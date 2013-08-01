/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f14.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f14.s,v 1.1 2007/05/11 17:22:21 drp Exp $"
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
	setx	0x66455B8D3058DA16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0xD,	%g2
	set	0xE,	%g3
	set	0xF,	%g4
	set	0x0,	%g5
	set	0x0,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0x5,	%i1
	set	-0xC,	%i2
	set	-0xA,	%i3
	set	-0xA,	%i4
	set	-0x7,	%i5
	set	-0x8,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x00C9ABF0,	%l0
	set	0x3BE24E28,	%l1
	set	0x7A3C6601,	%l2
	set	0x4C9BDC7D,	%l3
	set	0x79EA755C,	%l4
	set	0x6C781944,	%l5
	set	0x1A72D9F2,	%l6
	!# Output registers
	set	-0x0B26,	%o0
	set	0x1881,	%o1
	set	0x1CCF,	%o2
	set	0x118B,	%o3
	set	-0x0B67,	%o4
	set	-0x1FDE,	%o5
	set	0x1B34,	%o6
	set	-0x03A0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x018FDBC6E058A07E)
	INIT_TH_FP_REG(%l7,%f2,0x855B9AB0508C48CA)
	INIT_TH_FP_REG(%l7,%f4,0x12FCE700DF53663B)
	INIT_TH_FP_REG(%l7,%f6,0x1273512D53D6DE9C)
	INIT_TH_FP_REG(%l7,%f8,0x42037F2FD3505F17)
	INIT_TH_FP_REG(%l7,%f10,0x125F51801624E17E)
	INIT_TH_FP_REG(%l7,%f12,0x4E8A8A5E7307B969)
	INIT_TH_FP_REG(%l7,%f14,0x49B579815E454406)
	INIT_TH_FP_REG(%l7,%f16,0xDF784C922B2023C1)
	INIT_TH_FP_REG(%l7,%f18,0x7F25FDFDCF8BC629)
	INIT_TH_FP_REG(%l7,%f20,0xCBD845734AD3535E)
	INIT_TH_FP_REG(%l7,%f22,0x5CBBF10A0CBB5B9B)
	INIT_TH_FP_REG(%l7,%f24,0x83E83D8C2A72C420)
	INIT_TH_FP_REG(%l7,%f26,0xDFB87ABB4957BBD1)
	INIT_TH_FP_REG(%l7,%f28,0x515398F957C11C0E)
	INIT_TH_FP_REG(%l7,%f30,0xC9A355972E4B1580)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x024, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	movl	%icc,	%l1,	%o0
	movrgz	%g5,	%o4,	%l2
	call	loop_1
	orncc	%l0,	0x0FD3,	%g7
	brlez,a	%l4,	loop_2
	tge	%xcc,	0x0
loop_1:
	edge32l	%g6,	%i3,	%i2
	brnz,a	%o6,	loop_3
loop_2:
	sethi	0x085D,	%o7
	array8	%o1,	%i7,	%g4
	ld	[%l7 + 0x1C],	%f25
loop_3:
	sdiv	%o3,	0x065D,	%l3
	movge	%xcc,	%g2,	%l5
	mulscc	%i0,	0x1D15,	%i1
	tcc	%xcc,	0x7
	fpack32	%f0,	%f16,	%f20
	umulcc	%i6,	0x0B32,	%g1
	tl	%xcc,	0x1
	taddcctv	%g3,	%l6,	%i4
	udivx	%o5,	0x0645,	%o2
	fnands	%f24,	%f12,	%f0
	edge16n	%i5,	%o0,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x1
	fcmpeq16	%f16,	%f6,	%g5
	membar	0x54
	fpack16	%f12,	%f12
	fmovsne	%icc,	%f9,	%f14
	addc	%l2,	%o4,	%l0
	tsubcc	%l4,	%g7,	%i3
	popc	0x0CDF,	%i2
	fbul,a	%fcc1,	loop_4
	fmovspos	%icc,	%f10,	%f10
	fmovdne	%icc,	%f15,	%f2
	brz	%o6,	loop_5
loop_4:
	sethi	0x14E9,	%g6
	taddcctv	%o7,	0x1B9C,	%i7
	ld	[%l7 + 0x50],	%f24
loop_5:
	orcc	%g4,	%o1,	%o3
	addccc	%l3,	%g2,	%i0
	movl	%icc,	%i1,	%l5
	umul	%i6,	%g1,	%g3
	alignaddr	%i4,	%l6,	%o5
	srl	%o2,	%i5,	%o0
	prefetch	[%l7 + 0x10],	 0x1
	movl	%xcc,	%g5,	%l2
	fbge	%fcc1,	loop_6
	movvc	%icc,	%o4,	%l0
	st	%f13,	[%l7 + 0x7C]
	movvc	%xcc,	%l4,	%l1
loop_6:
	sllx	%g7,	0x06,	%i2
	ldx	[%l7 + 0x28],	%o6
	movrlez	%i3,	%o7,	%i7
	prefetch	[%l7 + 0x60],	 0x2
	fpsub16s	%f7,	%f30,	%f5
	fpsub32s	%f6,	%f1,	%f19
	tcs	%xcc,	0x0
	or	%g4,	%g6,	%o3
	brgz	%o1,	loop_7
	fmovsn	%icc,	%f1,	%f21
	fand	%f30,	%f16,	%f30
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x28] %asi,	%g2
loop_7:
	nop
	set	0x54, %l1
	lduwa	[%l7 + %l1] 0x81,	%i0
	umul	%i1,	0x0D68,	%l5
	udivcc	%i6,	0x1A13,	%g1
	tcs	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g3
	fabsd	%f8,	%f26
	movge	%icc,	%l3,	%i4
	tg	%xcc,	0x7
	fcmpd	%fcc0,	%f6,	%f22
	edge32l	%l6,	%o5,	%i5
	fpadd16	%f22,	%f24,	%f0
	movre	%o2,	%o0,	%l2
	array16	%o4,	%l0,	%g5
	edge32n	%l4,	%g7,	%i2
	move	%xcc,	%l1,	%i3
	ta	%xcc,	0x1
	fmovsgu	%xcc,	%f7,	%f7
	popc	%o6,	%i7
	fmovdgu	%icc,	%f11,	%f19
	udivcc	%o7,	0x06D2,	%g4
	te	%icc,	0x2
	fbul,a	%fcc0,	loop_8
	subc	%o3,	0x1970,	%g6
	std	%f24,	[%l7 + 0x38]
	tcc	%icc,	0x5
loop_8:
	alignaddr	%g2,	%o1,	%i0
	sdivx	%i1,	0x1DD4,	%l5
	brgez,a	%i6,	loop_9
	sethi	0x1C87,	%g3
	sdiv	%g1,	0x1830,	%i4
	fmovrdgez	%l3,	%f30,	%f10
loop_9:
	tsubcctv	%l6,	0x0326,	%i5
	st	%f27,	[%l7 + 0x5C]
	taddcctv	%o2,	%o5,	%l2
	fcmple32	%f4,	%f6,	%o4
	andn	%l0,	0x0465,	%g5
	ldx	[%l7 + 0x18],	%l4
	movre	%o0,	0x182,	%i2
	movrlz	%l1,	%g7,	%o6
	edge16ln	%i3,	%i7,	%o7
	fxors	%f12,	%f24,	%f15
	movrne	%o3,	0x161,	%g6
	tn	%xcc,	0x7
	movcs	%icc,	%g2,	%o1
	ta	%icc,	0x2
	fpsub32s	%f30,	%f1,	%f3
	movrgez	%i0,	%g4,	%i1
	bl	loop_10
	movcs	%xcc,	%i6,	%l5
	sdivx	%g3,	0x1977,	%g1
	set	0x24, %l4
	sta	%f29,	[%l7 + %l4] 0x04
loop_10:
	edge8l	%i4,	%l3,	%l6
	sdiv	%i5,	0x1D90,	%o2
	fabsd	%f20,	%f12
	fmul8x16al	%f22,	%f24,	%f16
	flush	%l7 + 0x48
	fbge,a	%fcc3,	loop_11
	mova	%xcc,	%o5,	%l2
	tle	%xcc,	0x7
	tne	%xcc,	0x0
loop_11:
	bn,pt	%icc,	loop_12
	be,a	loop_13
	tcc	%icc,	0x6
	prefetch	[%l7 + 0x14],	 0x3
loop_12:
	fors	%f11,	%f27,	%f26
loop_13:
	fpadd32	%f18,	%f0,	%f16
	sllx	%o4,	0x0B,	%g5
	call	loop_14
	fbuge,a	%fcc2,	loop_15
	edge8n	%l0,	%l4,	%o0
	fpmerge	%f27,	%f13,	%f26
loop_14:
	ldstub	[%l7 + 0x1E],	%l1
loop_15:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge16n	%g7,	%i2,	%i3
	movn	%icc,	%i7,	%o7
	nop
	setx	loop_16,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbue	%fcc0,	loop_17
	lduh	[%l7 + 0x4E],	%o6
	sir	0x1489
loop_16:
	fmovdg	%icc,	%f9,	%f16
loop_17:
	edge8l	%g6,	%o3,	%g2
	edge32n	%o1,	%i0,	%i1
	movneg	%xcc,	%i6,	%g4
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x50] %asi,	%l5
	stbar
	andncc	%g1,	%g3,	%i4
	sethi	0x04C6,	%l3
	subccc	%i5,	0x1017,	%l6
	stbar
	movne	%icc,	%o5,	%l2
	edge32n	%o2,	%g5,	%o4
	srl	%l4,	0x03,	%o0
	edge8l	%l0,	%l1,	%g7
	fmovrslez	%i3,	%f31,	%f17
	mulscc	%i7,	%o7,	%i2
	edge8n	%o6,	%o3,	%g6
	subccc	%o1,	0x0884,	%i0
	array16	%g2,	%i6,	%i1
	move	%icc,	%l5,	%g4
	tsubcctv	%g3,	%g1,	%l3
	umulcc	%i5,	0x0721,	%l6
	fpsub16	%f0,	%f14,	%f12
	sub	%i4,	0x19D9,	%l2
	tcs	%xcc,	0x6
	tsubcc	%o5,	%o2,	%g5
	fmovrdgz	%o4,	%f2,	%f10
	fornot2s	%f9,	%f22,	%f25
	sir	0x0415
	lduh	[%l7 + 0x12],	%o0
	bneg	%icc,	loop_18
	fcmpgt32	%f2,	%f10,	%l4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x50] %asi,	%f8
loop_18:
	edge8ln	%l1,	%l0,	%i3
	fmovdg	%icc,	%f18,	%f31
	movne	%icc,	%i7,	%o7
	popc	0x0497,	%g7
	tsubcctv	%o6,	%o3,	%i2
	fxnors	%f1,	%f4,	%f6
	xor	%o1,	%i0,	%g6
	nop
	setx	loop_19,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcctv	%g2,	0x1E45,	%i6
	srl	%l5,	0x11,	%g4
	set	0x58, %i6
	stwa	%i1,	[%l7 + %i6] 0x14
loop_19:
	edge16n	%g1,	%g3,	%i5
	nop
	set	0x46, %l6
	ldsb	[%l7 + %l6],	%l6
	fbul,a	%fcc1,	loop_20
	fbule,a	%fcc2,	loop_21
	movn	%icc,	%l3,	%l2
	sdivcc	%i4,	0x0312,	%o5
loop_20:
	sdivx	%g5,	0x16FC,	%o4
loop_21:
	fbn	%fcc1,	loop_22
	fbue	%fcc0,	loop_23
	orn	%o2,	0x1445,	%l4
	fbge	%fcc0,	loop_24
loop_22:
	fpadd32	%f18,	%f2,	%f26
loop_23:
	addccc	%o0,	0x12C7,	%l1
	fpack16	%f28,	%f7
loop_24:
	nop
	set	0x22, %o0
	lduha	[%l7 + %o0] 0x04,	%l0
	fxnor	%f18,	%f6,	%f18
	mova	%icc,	%i3,	%i7
	prefetch	[%l7 + 0x4C],	 0x2
	set	0x34, %i4
	ldstuba	[%l7 + %i4] 0x11,	%o7
	sra	%o6,	%g7,	%o3
	std	%i2,	[%l7 + 0x60]
	subcc	%o1,	0x0676,	%g6
	movneg	%xcc,	%i0,	%i6
	bcs	loop_25
	subc	%l5,	0x0B06,	%g2
	stbar
	tsubcctv	%g4,	0x0BE4,	%g1
loop_25:
	sir	0x0089
	addc	%i1,	0x1C8C,	%g3
	movrne	%l6,	0x31D,	%i5
	tvs	%xcc,	0x5
	sllx	%l3,	0x13,	%i4
	sub	%l2,	0x11EA,	%o5
	fpackfix	%f26,	%f28
	sdiv	%o4,	0x1A8B,	%g5
	edge32	%o2,	%o0,	%l1
	fpsub16	%f24,	%f20,	%f16
	stbar
	mova	%icc,	%l0,	%i3
	tle	%icc,	0x2
	addccc	%l4,	%i7,	%o6
	movcs	%icc,	%g7,	%o3
	set	0x48, %o4
	lduha	[%l7 + %o4] 0x88,	%o7
	edge16	%i2,	%g6,	%i0
	fbl	%fcc1,	loop_26
	sllx	%i6,	%o1,	%g2
	addcc	%g4,	%l5,	%i1
	tgu	%xcc,	0x4
loop_26:
	tgu	%xcc,	0x3
	fcmpgt16	%f14,	%f18,	%g3
	movg	%xcc,	%g1,	%i5
	set	0x24, %l3
	ldswa	[%l7 + %l3] 0x81,	%l6
	fmovsgu	%icc,	%f25,	%f15
	fcmpeq16	%f0,	%f6,	%i4
	taddcc	%l2,	0x1669,	%l3
	movrne	%o5,	0x11A,	%o4
	movcs	%icc,	%o2,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a	loop_27
	tn	%icc,	0x1
	sdivcc	%l1,	0x0C31,	%l0
	fpsub32	%f2,	%f14,	%f26
loop_27:
	nop
	set	0x2A, %i7
	stha	%g5,	[%l7 + %i7] 0xeb
	membar	#Sync
	bvs,a	%icc,	loop_28
	umul	%i3,	%i7,	%o6
	bshuffle	%f0,	%f20,	%f22
	swap	[%l7 + 0x54],	%l4
loop_28:
	andncc	%g7,	%o3,	%i2
	ba,a	loop_29
	tle	%xcc,	0x4
	movge	%xcc,	%g6,	%i0
	movleu	%icc,	%o7,	%i6
loop_29:
	edge16l	%o1,	%g4,	%g2
	fmovsneg	%icc,	%f4,	%f6
	edge32n	%i1,	%l5,	%g1
	bleu,pt	%xcc,	loop_30
	taddcctv	%g3,	0x009C,	%l6
	stb	%i4,	[%l7 + 0x58]
	fbge,a	%fcc1,	loop_31
loop_30:
	udivx	%i5,	0x12DC,	%l3
	fmovdpos	%xcc,	%f22,	%f17
	or	%l2,	%o4,	%o2
loop_31:
	fmovdvs	%icc,	%f11,	%f2
	movcc	%xcc,	%o0,	%l1
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x29] %asi,	%l0
	edge32ln	%g5,	%o5,	%i3
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge32l	%o6,	%i7,	%l4
	bneg,a	%xcc,	loop_32
	edge16ln	%o3,	%i2,	%g7
	andcc	%g6,	%o7,	%i6
	fcmpne16	%f14,	%f6,	%o1
loop_32:
	sdivx	%g4,	0x08C0,	%i0
	ba	%xcc,	loop_33
	fmovrdlz	%g2,	%f14,	%f28
	ta	%icc,	0x6
	taddcc	%l5,	%i1,	%g1
loop_33:
	fmovrde	%g3,	%f30,	%f30
	fba,a	%fcc3,	loop_34
	tl	%icc,	0x6
	fmovdleu	%xcc,	%f15,	%f2
	tn	%icc,	0x6
loop_34:
	te	%xcc,	0x5
	move	%icc,	%l6,	%i4
	ba,pn	%icc,	loop_35
	tgu	%icc,	0x3
	edge8ln	%l3,	%i5,	%o4
	movl	%xcc,	%l2,	%o0
loop_35:
	edge32ln	%o2,	%l1,	%l0
	sdivcc	%o5,	0x117B,	%g5
	tcc	%xcc,	0x3
	set	0x68, %g7
	prefetcha	[%l7 + %g7] 0x11,	 0x2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x22] %asi,	%i7
	sllx	%o6,	0x01,	%l4
	edge16ln	%i2,	%g7,	%o3
	edge32	%g6,	%o7,	%i6
	sdivx	%g4,	0x1E6C,	%o1
	movcs	%xcc,	%g2,	%i0
	sethi	0x1641,	%l5
	sir	0x1939
	addc	%i1,	%g3,	%l6
	sllx	%g1,	0x01,	%l3
	addccc	%i5,	%o4,	%i4
	orcc	%o0,	%l2,	%o2
	addccc	%l0,	0x025F,	%o5
	edge16ln	%l1,	%i3,	%g5
	movvc	%icc,	%o6,	%i7
	sdivcc	%i2,	0x0B91,	%g7
	fpadd16s	%f25,	%f6,	%f26
	bneg,a,pt	%icc,	loop_36
	udivx	%o3,	0x1E0D,	%g6
	set	0x70, %l2
	lduwa	[%l7 + %l2] 0x10,	%o7
loop_36:
	tvc	%icc,	0x2
	tpos	%icc,	0x5
	xnorcc	%i6,	%g4,	%l4
	fmul8x16al	%f4,	%f22,	%f24
	sdivx	%o1,	0x1FA3,	%i0
	stbar
	movle	%xcc,	%l5,	%g2
	tsubcc	%i1,	0x02BD,	%l6
	fpsub16	%f4,	%f6,	%f8
	te	%icc,	0x4
	smulcc	%g3,	%l3,	%i5
	stb	%o4,	[%l7 + 0x1A]
	te	%xcc,	0x7
	movvs	%icc,	%i4,	%o0
	movrlez	%g1,	0x0C1,	%l2
	bvc,pt	%icc,	loop_37
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o2,	%o5,	%l1
	fbne	%fcc0,	loop_38
loop_37:
	smulcc	%i3,	0x1608,	%g5
	set	0x108, %g6
	stxa	%o6,	[%g0 + %g6] 0x21
loop_38:
	fba,a	%fcc0,	loop_39
	fmovrsne	%i7,	%f14,	%f30
	fbg,a	%fcc3,	loop_40
	tne	%xcc,	0x6
loop_39:
	srl	%i2,	%g7,	%o3
	bn,pn	%icc,	loop_41
loop_40:
	ble	%xcc,	loop_42
	fmul8x16au	%f11,	%f30,	%f14
	andcc	%l0,	0x165B,	%g6
loop_41:
	nop
	set	0x08, %g5
	lduha	[%l7 + %g5] 0x81,	%i6
loop_42:
	edge32l	%o7,	%l4,	%o1
	tgu	%xcc,	0x2
	sth	%i0,	[%l7 + 0x0C]
	fmovrslz	%g4,	%f1,	%f23
	nop
	setx loop_43, %l0, %l1
	jmpl %l1, %g2
	alignaddr	%l5,	%l6,	%i1
	addc	%g3,	%l3,	%o4
	srl	%i5,	%o0,	%g1
loop_43:
	movpos	%icc,	%i4,	%l2
	edge16	%o2,	%l1,	%i3
	edge8l	%g5,	%o5,	%i7
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x23,	%i2
	tne	%xcc,	0x3
	array16	%o6,	%o3,	%g7
	fmul8x16	%f15,	%f2,	%f22
	movge	%xcc,	%g6,	%i6
	set	0x68, %o3
	stxa	%o7,	[%l7 + %o3] 0x15
	fbue	%fcc1,	loop_44
	fble,a	%fcc2,	loop_45
	bvs	loop_46
	addccc	%l0,	%l4,	%o1
loop_44:
	nop
	set	0x48, %g3
	stx	%i0,	[%l7 + %g3]
loop_45:
	bneg,a	loop_47
loop_46:
	fmovdn	%icc,	%f14,	%f0
	fmovdpos	%icc,	%f26,	%f10
	fmovrdne	%g2,	%f12,	%f24
loop_47:
	movrlez	%g4,	%l6,	%i1
	movre	%g3,	0x3F2,	%l5
	fmovrse	%l3,	%f13,	%f29
	subccc	%i5,	0x0B3D,	%o4
	ldd	[%l7 + 0x30],	%f28
	alignaddr	%o0,	%g1,	%l2
	xor	%i4,	%o2,	%l1
	xnor	%g5,	%i3,	%i7
	umul	%o5,	%o6,	%i2
	tge	%xcc,	0x0
	popc	%g7,	%o3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x31] %asi,	%g6
	fmovscs	%icc,	%f6,	%f4
	srl	%i6,	0x0C,	%l0
	xnorcc	%l4,	%o1,	%o7
	xnor	%g2,	0x000F,	%i0
	fpmerge	%f23,	%f12,	%f18
	movrlz	%g4,	%l6,	%g3
	udiv	%l5,	0x0E2F,	%i1
	fmovdcs	%xcc,	%f28,	%f15
	movre	%i5,	%l3,	%o4
	movrne	%g1,	0x1D9,	%l2
	movvs	%icc,	%i4,	%o0
	fxor	%f8,	%f16,	%f18
	flush	%l7 + 0x50
	fors	%f25,	%f23,	%f12
	ldd	[%l7 + 0x48],	%o2
	tg	%icc,	0x2
	udivcc	%l1,	0x1F9A,	%g5
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i7
	movn	%icc,	%i3,	%o5
	movvc	%icc,	%o6,	%g7
	subcc	%i2,	0x1768,	%g6
	fmovrdlez	%i6,	%f24,	%f20
	smul	%o3,	0x0FDC,	%l0
	tcs	%icc,	0x0
	ldd	[%l7 + 0x10],	%f6
	bneg,a	loop_48
	fpadd16s	%f25,	%f27,	%f31
	edge16	%o1,	%o7,	%l4
	fbuge,a	%fcc3,	loop_49
loop_48:
	movrgz	%g2,	0x1BC,	%g4
	smulcc	%i0,	0x0369,	%l6
	movcc	%xcc,	%g3,	%i1
loop_49:
	andcc	%l5,	%i5,	%o4
	srl	%l3,	%g1,	%i4
	sll	%l2,	0x00,	%o0
	sub	%l1,	0x0D6A,	%g5
	fbne,a	%fcc0,	loop_50
	orn	%o2,	0x1C52,	%i7
	tn	%xcc,	0x5
	fpackfix	%f26,	%f5
loop_50:
	stw	%o5,	[%l7 + 0x74]
	array16	%i3,	%o6,	%g7
	mulx	%i2,	%i6,	%g6
	addc	%l0,	0x0199,	%o3
	fpack32	%f26,	%f14,	%f18
	movn	%icc,	%o7,	%o1
	edge16n	%l4,	%g4,	%g2
	mova	%icc,	%i0,	%g3
	movleu	%xcc,	%i1,	%l5
	fnor	%f28,	%f22,	%f12
	movg	%icc,	%l6,	%o4
	fcmple32	%f28,	%f12,	%l3
	ldub	[%l7 + 0x52],	%i5
	taddcctv	%g1,	%i4,	%l2
	umulcc	%o0,	%l1,	%o2
	fmovd	%f12,	%f20
	movneg	%xcc,	%i7,	%g5
	bpos,a,pn	%xcc,	loop_51
	edge32l	%o5,	%i3,	%o6
	movg	%icc,	%g7,	%i2
	fmovsvs	%icc,	%f31,	%f14
loop_51:
	nop
	set	0x38, %i2
	sth	%i6,	[%l7 + %i2]
	set	0x1C, %i3
	lduwa	[%l7 + %i3] 0x14,	%l0
	nop
	setx loop_52, %l0, %l1
	jmpl %l1, %o3
	bn,a	loop_53
	fmovrdlez	%g6,	%f30,	%f18
	edge32ln	%o7,	%l4,	%o1
loop_52:
	movl	%icc,	%g2,	%g4
loop_53:
	fcmpd	%fcc2,	%f2,	%f8
	lduw	[%l7 + 0x14],	%i0
	edge8n	%i1,	%l5,	%g3
	fcmpeq16	%f16,	%f12,	%o4
	set	0x28, %o2
	swapa	[%l7 + %o2] 0x04,	%l6
	fmovsne	%icc,	%f1,	%f30
	tle	%xcc,	0x1
	fmovrse	%i5,	%f1,	%f6
	tle	%icc,	0x2
	alignaddr	%g1,	%i4,	%l3
	fnors	%f28,	%f7,	%f2
	sethi	0x0E31,	%o0
	fandnot2	%f4,	%f24,	%f16
	sir	0x0EC4
	movgu	%icc,	%l2,	%l1
	te	%xcc,	0x1
	xnorcc	%i7,	%o2,	%g5
	movrgez	%i3,	%o6,	%g7
	bn,a,pt	%xcc,	loop_54
	fmovda	%xcc,	%f23,	%f26
	or	%i2,	0x1C19,	%o5
	bvs,a,pt	%xcc,	loop_55
loop_54:
	edge8n	%l0,	%i6,	%g6
	andncc	%o7,	%o3,	%o1
	set	0x40, %i5
	lduwa	[%l7 + %i5] 0x19,	%l4
loop_55:
	srl	%g4,	%g2,	%i1
	fmovdn	%xcc,	%f28,	%f19
	array8	%i0,	%g3,	%l5
	set	0x78, %o7
	sta	%f0,	[%l7 + %o7] 0x11
	movcs	%xcc,	%o4,	%i5
	bl	%icc,	loop_56
	fbl,a	%fcc1,	loop_57
	taddcctv	%l6,	0x18B1,	%g1
	mova	%xcc,	%i4,	%l3
loop_56:
	mulscc	%o0,	%l2,	%l1
loop_57:
	fpadd32s	%f28,	%f9,	%f11
	array16	%i7,	%g5,	%o2
	movleu	%xcc,	%i3,	%o6
	stw	%i2,	[%l7 + 0x24]
	brnz,a	%g7,	loop_58
	edge8	%l0,	%o5,	%i6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o7
loop_58:
	edge8n	%g6,	%o3,	%l4
	fmovdge	%xcc,	%f0,	%f4
	tl	%icc,	0x4
	fpack16	%f26,	%f6
	fmul8ulx16	%f10,	%f2,	%f28
	fcmpeq32	%f16,	%f16,	%o1
	movcc	%icc,	%g4,	%i1
	fsrc1	%f10,	%f2
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x4A] %asi,	%g2
	set	0x44, %g1
	lda	[%l7 + %g1] 0x0c,	%f12
	alignaddrl	%i0,	%l5,	%g3
	fble	%fcc1,	loop_59
	fbg	%fcc3,	loop_60
	sll	%o4,	%i5,	%g1
	tcs	%xcc,	0x0
loop_59:
	fnegd	%f26,	%f28
loop_60:
	mova	%xcc,	%i4,	%l3
	sth	%l6,	[%l7 + 0x1A]
	or	%l2,	0x170B,	%o0
	bvc,pt	%xcc,	loop_61
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x6
	fmovrde	%l1,	%f12,	%f0
loop_61:
	add	%i7,	0x105E,	%g5
	te	%xcc,	0x2
	movne	%icc,	%i3,	%o2
	tgu	%icc,	0x2
	mulx	%i2,	0x000E,	%o6
	smul	%g7,	0x0000,	%o5
	andncc	%l0,	%o7,	%i6
	array32	%o3,	%l4,	%o1
	udivx	%g4,	0x038A,	%g6
	ta	%xcc,	0x3
	tn	%xcc,	0x4
	edge16ln	%g2,	%i0,	%i1
	movcc	%icc,	%l5,	%g3
	stw	%o4,	[%l7 + 0x10]
	movrgz	%g1,	0x38D,	%i4
	bn,pn	%xcc,	loop_62
	smul	%i5,	%l6,	%l3
	set	0x54, %o1
	swapa	[%l7 + %o1] 0x89,	%l2
loop_62:
	orncc	%l1,	%i7,	%o0
	brlz	%i3,	loop_63
	edge8	%g5,	%i2,	%o6
	taddcctv	%g7,	0x0232,	%o2
	addccc	%l0,	0x1D75,	%o5
loop_63:
	array32	%i6,	%o3,	%l4
	stb	%o1,	[%l7 + 0x3A]
	orncc	%g4,	%g6,	%o7
	fnands	%f14,	%f15,	%f0
	andn	%g2,	0x0E8D,	%i1
	fmovse	%icc,	%f30,	%f9
	fbo	%fcc1,	loop_64
	bcc,a,pn	%icc,	loop_65
	tsubcctv	%i0,	%l5,	%g3
	fmovdge	%icc,	%f14,	%f24
loop_64:
	sdivcc	%o4,	0x0D2A,	%i4
loop_65:
	fpack32	%f30,	%f22,	%f4
	nop
	setx	loop_66,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orn	%i5,	%l6,	%l3
	add	%g1,	0x18FE,	%l2
	membar	0x3C
loop_66:
	bg	loop_67
	bgu,a,pn	%icc,	loop_68
	fornot1	%f16,	%f4,	%f16
	te	%xcc,	0x5
loop_67:
	srax	%l1,	0x09,	%o0
loop_68:
	popc	0x04F3,	%i7
	fmovsvc	%xcc,	%f19,	%f26
	tn	%icc,	0x2
	movrgez	%g5,	%i3,	%i2
	subcc	%g7,	%o2,	%l0
	fmuld8ulx16	%f15,	%f26,	%f26
	umul	%o5,	0x053A,	%o6
	movrlz	%o3,	0x3E8,	%l4
	fbn	%fcc1,	loop_69
	lduw	[%l7 + 0x70],	%i6
	umulcc	%o1,	%g6,	%o7
	sll	%g4,	0x09,	%i1
loop_69:
	smul	%i0,	%l5,	%g3
	movne	%xcc,	%o4,	%i4
	fandnot2s	%f25,	%f22,	%f2
	array8	%i5,	%g2,	%l6
	edge32l	%g1,	%l2,	%l1
	set	0x28, %o6
	ldxa	[%l7 + %o6] 0x10,	%l3
	movn	%icc,	%o0,	%g5
	xor	%i3,	0x117A,	%i7
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x1e,	%f0
	bge,pt	%xcc,	loop_70
	udivx	%g7,	0x0704,	%i2
	fbue,a	%fcc2,	loop_71
	siam	0x6
loop_70:
	ldsw	[%l7 + 0x64],	%l0
	movgu	%xcc,	%o5,	%o2
loop_71:
	fba	%fcc1,	loop_72
	mova	%icc,	%o3,	%o6
	fbo,a	%fcc0,	loop_73
	tpos	%xcc,	0x6
loop_72:
	edge16ln	%l4,	%o1,	%i6
	set	0x68, %l0
	stha	%g6,	[%l7 + %l0] 0x04
loop_73:
	fbue	%fcc0,	loop_74
	edge16ln	%g4,	%i1,	%i0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x04,	%f0
loop_74:
	add	%l5,	%o7,	%g3
	movgu	%icc,	%i4,	%o4
	addccc	%g2,	%i5,	%g1
	tvc	%icc,	0x5
	bl,a,pt	%xcc,	loop_75
	ldsw	[%l7 + 0x68],	%l6
	sdiv	%l2,	0x19C3,	%l3
	fmovsle	%xcc,	%f4,	%f11
loop_75:
	fba	%fcc1,	loop_76
	fmovs	%f5,	%f11
	fmovdpos	%icc,	%f20,	%f29
	fmovrsgz	%l1,	%f2,	%f20
loop_76:
	and	%o0,	%g5,	%i7
	sra	%i3,	%g7,	%l0
	alignaddrl	%o5,	%i2,	%o3
	nop
	setx loop_77, %l0, %l1
	jmpl %l1, %o6
	brgz,a	%o2,	loop_78
	addc	%o1,	%i6,	%l4
	fmul8x16	%f10,	%f30,	%f24
loop_77:
	brgz,a	%g6,	loop_79
loop_78:
	xor	%i1,	%g4,	%i0
	ldsh	[%l7 + 0x4A],	%o7
	umulcc	%l5,	0x107F,	%i4
loop_79:
	fnor	%f16,	%f12,	%f16
	movre	%o4,	0x1F1,	%g2
	movcc	%xcc,	%i5,	%g3
	fbg	%fcc2,	loop_80
	array8	%l6,	%g1,	%l3
	fpadd32	%f2,	%f28,	%f8
	alignaddrl	%l2,	%o0,	%l1
loop_80:
	fmovdne	%xcc,	%f15,	%f21
	orncc	%g5,	%i7,	%i3
	edge16l	%l0,	%o5,	%i2
	fbg,a	%fcc1,	loop_81
	brnz,a	%o3,	loop_82
	movgu	%icc,	%o6,	%g7
	srl	%o2,	%o1,	%l4
loop_81:
	tge	%xcc,	0x3
loop_82:
	addccc	%g6,	0x12D7,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f9,	%f14,	%f20
	nop
	setx	loop_83,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%g4,	%i0,	%o7
	array32	%l5,	%i4,	%i6
	stb	%g2,	[%l7 + 0x6E]
loop_83:
	tvc	%xcc,	0x2
	edge16ln	%o4,	%i5,	%l6
	prefetch	[%l7 + 0x78],	 0x3
	tpos	%icc,	0x6
	bneg,a,pt	%icc,	loop_84
	fbuge,a	%fcc1,	loop_85
	taddcc	%g1,	0x1F8A,	%g3
	movneg	%icc,	%l2,	%o0
loop_84:
	andn	%l1,	%g5,	%i7
loop_85:
	alignaddr	%l3,	%i3,	%o5
	movre	%l0,	%o3,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o6
	tge	%xcc,	0x1
	bvs,a,pn	%xcc,	loop_86
	fmovsg	%xcc,	%f25,	%f2
	ble,a,pn	%xcc,	loop_87
	fzeros	%f25
loop_86:
	alignaddr	%g7,	%o2,	%o1
	sub	%g6,	%l4,	%i1
loop_87:
	umul	%g4,	0x115A,	%o7
	edge16ln	%l5,	%i4,	%i0
	or	%i6,	0x0BF4,	%g2
	fxnor	%f10,	%f22,	%f8
	fandnot2	%f20,	%f20,	%f18
	add	%o4,	0x0413,	%i5
	brgz,a	%l6,	loop_88
	st	%f29,	[%l7 + 0x78]
	bvc,a,pn	%icc,	loop_89
	sub	%g1,	0x1828,	%g3
loop_88:
	sub	%l2,	%o0,	%l1
	fmovse	%icc,	%f20,	%f27
loop_89:
	fmovdneg	%xcc,	%f1,	%f29
	brnz	%i7,	loop_90
	umul	%g5,	%i3,	%o5
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x5C] %asi,	%f23
loop_90:
	movrlez	%l3,	0x357,	%l0
	sllx	%o3,	0x12,	%o6
	membar	0x7B
	tne	%xcc,	0x2
	lduh	[%l7 + 0x36],	%i2
	addcc	%o2,	0x1E57,	%o1
	fabsd	%f16,	%f24
	edge32n	%g6,	%g7,	%l4
	movpos	%xcc,	%i1,	%o7
	udiv	%g4,	0x083D,	%i4
	xnor	%i0,	%i6,	%l5
	sra	%g2,	%o4,	%l6
	fmul8ulx16	%f8,	%f4,	%f14
	umulcc	%g1,	0x0228,	%g3
	fmovrslz	%i5,	%f13,	%f14
	movg	%icc,	%o0,	%l1
	popc	%i7,	%g5
	fmovdne	%icc,	%f18,	%f18
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%l2
	nop
	setx	loop_91,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%i3,	%o5,	%l3
	addccc	%l0,	0x122A,	%o3
	te	%xcc,	0x2
loop_91:
	movrne	%o6,	0x1D7,	%i2
	array16	%o2,	%o1,	%g6
	ldd	[%l7 + 0x58],	%l4
	wr	%g0,	0xeb,	%asi
	stba	%g7,	[%l7 + 0x67] %asi
	membar	#Sync
	array32	%i1,	%o7,	%g4
	fmovdne	%xcc,	%f28,	%f19
	fandnot1s	%f17,	%f15,	%f13
	tleu	%icc,	0x6
	fmovrdlz	%i4,	%f8,	%f20
	mulscc	%i6,	%l5,	%g2
	fcmpne16	%f18,	%f2,	%o4
	movgu	%xcc,	%i0,	%l6
	set	0x30, %g2
	ldda	[%l7 + %g2] 0xe2,	%g0
	fblg,a	%fcc1,	loop_92
	brnz,a	%g3,	loop_93
	orn	%o0,	0x1C92,	%l1
	subcc	%i5,	%i7,	%g5
loop_92:
	movleu	%xcc,	%i3,	%o5
loop_93:
	fbuge	%fcc3,	loop_94
	movvc	%icc,	%l2,	%l3
	umul	%o3,	%o6,	%i2
	tle	%xcc,	0x3
loop_94:
	nop
	set	0x4A, %i1
	stha	%l0,	[%l7 + %i1] 0xe3
	membar	#Sync
	add	%o2,	%g6,	%l4
	movre	%o1,	%i1,	%o7
	subccc	%g4,	0x0385,	%i4
	tsubcc	%i6,	%l5,	%g7
	tcc	%icc,	0x6
	fbne,a	%fcc2,	loop_95
	movvs	%xcc,	%g2,	%o4
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
loop_95:
	siam	0x2
	bne	%xcc,	loop_96
	movrgez	%i0,	0x24D,	%g1
	tle	%xcc,	0x6
	andn	%l6,	0x1C59,	%g3
loop_96:
	fbo	%fcc2,	loop_97
	brlez,a	%o0,	loop_98
	movre	%l1,	0x02D,	%i7
	tneg	%icc,	0x5
loop_97:
	fbne	%fcc3,	loop_99
loop_98:
	mulx	%g5,	0x0F22,	%i5
	edge8n	%o5,	%l2,	%l3
	xorcc	%o3,	0x0F96,	%o6
loop_99:
	mova	%icc,	%i2,	%l0
	tl	%xcc,	0x2
	edge8ln	%o2,	%g6,	%l4
	fmovsneg	%icc,	%f19,	%f17
	wr	%g0,	0x11,	%asi
	sta	%f14,	[%l7 + 0x48] %asi
	xor	%o1,	0x1937,	%i1
	movleu	%xcc,	%i3,	%g4
	orcc	%o7,	%i6,	%l5
	fmovdcc	%xcc,	%f7,	%f31
	alignaddr	%i4,	%g7,	%g2
	alignaddr	%i0,	%g1,	%l6
	movle	%icc,	%g3,	%o0
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x19,	%l0
	sdivx	%o4,	0x0EDB,	%g5
	fbn,a	%fcc3,	loop_100
	edge16ln	%i7,	%o5,	%i5
	fcmpgt16	%f18,	%f30,	%l2
	subcc	%o3,	%o6,	%i2
loop_100:
	orncc	%l0,	%l3,	%o2
	movne	%xcc,	%g6,	%o1
	stb	%i1,	[%l7 + 0x78]
	edge16	%i3,	%l4,	%g4
	srax	%i6,	0x1A,	%l5
	movrne	%i4,	0x052,	%o7
	edge8	%g2,	%i0,	%g1
	orn	%l6,	%g3,	%o0
	edge32	%l1,	%o4,	%g7
	tneg	%icc,	0x2
	sir	0x039E
	edge16l	%g5,	%o5,	%i7
	fmovsleu	%icc,	%f25,	%f12
	tpos	%xcc,	0x1
	fzeros	%f17
	movpos	%icc,	%l2,	%i5
	tne	%icc,	0x6
	sra	%o6,	%o3,	%l0
	or	%i2,	0x0523,	%l3
	sdivcc	%o2,	0x0A68,	%g6
	fmovrdgez	%o1,	%f16,	%f14
	bgu,a,pn	%icc,	loop_101
	smulcc	%i1,	%i3,	%g4
	tsubcctv	%l4,	0x16C2,	%l5
	edge32	%i4,	%i6,	%o7
loop_101:
	fmovrdgz	%g2,	%f4,	%f28
	set	0x0, %l1
	stxa	%g1,	[%g0 + %l1] 0x4f
	tl	%icc,	0x0
	sth	%l6,	[%l7 + 0x2A]
	tvs	%xcc,	0x7
	tgu	%icc,	0x6
	fxors	%f7,	%f13,	%f29
	array8	%g3,	%i0,	%o0
	tne	%xcc,	0x0
	umul	%o4,	0x1E20,	%l1
	fcmpne32	%f28,	%f4,	%g5
	andcc	%o5,	%g7,	%i7
	edge16	%l2,	%i5,	%o6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%o3
	fbe	%fcc0,	loop_102
	fxors	%f21,	%f22,	%f31
	sir	0x1A78
	udivcc	%i2,	0x18EE,	%l0
loop_102:
	umulcc	%l3,	0x0473,	%o2
	bl,a	loop_103
	fmovdgu	%icc,	%f10,	%f23
	ldub	[%l7 + 0x18],	%o1
	movneg	%icc,	%i1,	%g6
loop_103:
	or	%g4,	%l4,	%l5
	fmovdgu	%icc,	%f26,	%f5
	movg	%icc,	%i3,	%i6
	movge	%icc,	%i4,	%o7
	sir	0x0E6B
	subcc	%g1,	0x1EF4,	%l6
	fornot2s	%f22,	%f26,	%f14
	fmovdcc	%xcc,	%f11,	%f14
	tneg	%xcc,	0x4
	taddcctv	%g3,	%i0,	%o0
	udivcc	%o4,	0x156C,	%l1
	udivx	%g5,	0x169E,	%o5
	fbue	%fcc1,	loop_104
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g2,	0x0C08,	%g7
	movg	%xcc,	%l2,	%i5
loop_104:
	tsubcctv	%i7,	0x1D6E,	%o3
	fpsub32s	%f21,	%f15,	%f9
	tne	%icc,	0x4
	or	%o6,	%l0,	%l3
	umulcc	%o2,	%i2,	%i1
	nop
	setx	loop_105,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbl,a	%fcc0,	loop_106
	bcc	%xcc,	loop_107
	fpsub32	%f28,	%f0,	%f18
loop_105:
	mulx	%o1,	%g6,	%g4
loop_106:
	sra	%l5,	%i3,	%i6
loop_107:
	nop
	set	0x5E, %o0
	stha	%i4,	[%l7 + %o0] 0x80
	alignaddrl	%l4,	%o7,	%g1
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x23,	%g2
	udiv	%l6,	0x1AFB,	%i0
	edge8	%o4,	%l1,	%g5
	fornot1s	%f12,	%f10,	%f1
	edge8	%o5,	%o0,	%g7
	fmovsleu	%icc,	%f14,	%f28
	flush	%l7 + 0x64
	ble,pt	%icc,	loop_108
	movne	%xcc,	%g2,	%i5
	movg	%icc,	%i7,	%l2
	sethi	0x0F4C,	%o3
loop_108:
	tge	%xcc,	0x4
	te	%icc,	0x0
	bleu,a,pn	%icc,	loop_109
	brgz,a	%o6,	loop_110
	movcc	%xcc,	%l0,	%l3
	set	0x65, %o4
	ldstuba	[%l7 + %o4] 0x04,	%o2
loop_109:
	bl,a,pt	%icc,	loop_111
loop_110:
	fmovdcs	%icc,	%f18,	%f30
	xnor	%i2,	%o1,	%i1
	ta	%xcc,	0x6
loop_111:
	tvc	%icc,	0x4
	for	%f2,	%f2,	%f16
	fmovsvc	%icc,	%f14,	%f28
	brgez,a	%g6,	loop_112
	edge8	%l5,	%i3,	%i6
	movcc	%icc,	%i4,	%g4
	movl	%icc,	%l4,	%g1
loop_112:
	tg	%xcc,	0x3
	set	0x4C, %l6
	lduha	[%l7 + %l6] 0x15,	%g3
	bvc	%xcc,	loop_113
	alignaddrl	%o7,	%i0,	%o4
	stx	%l1,	[%l7 + 0x20]
	fmovsleu	%icc,	%f12,	%f15
loop_113:
	nop
	setx	loop_114,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%l6,	%g5,	%o5
	andn	%o0,	0x1367,	%g7
	sdivcc	%g2,	0x129A,	%i5
loop_114:
	edge16n	%l2,	%i7,	%o6
	andn	%o3,	%l0,	%o2
	udivcc	%l3,	0x08B6,	%o1
	taddcctv	%i2,	%g6,	%i1
	wr	%g0,	0x11,	%asi
	sta	%f19,	[%l7 + 0x18] %asi
	set	0x54, %i7
	ldswa	[%l7 + %i7] 0x10,	%i3
	tvc	%icc,	0x4
	fcmpne16	%f18,	%f8,	%i6
	fmovrsgez	%i4,	%f17,	%f4
	or	%g4,	0x121E,	%l5
	tsubcctv	%g1,	%l4,	%o7
	sra	%g3,	%o4,	%l1
	ldsb	[%l7 + 0x7B],	%l6
	fmovsn	%xcc,	%f28,	%f7
	srax	%g5,	0x04,	%o5
	edge8	%o0,	%g7,	%i0
	umulcc	%g2,	%l2,	%i7
	nop
	setx loop_115, %l0, %l1
	jmpl %l1, %i5
	edge16n	%o3,	%l0,	%o6
	fcmple16	%f2,	%f10,	%l3
	movre	%o1,	%i2,	%o2
loop_115:
	movcc	%icc,	%g6,	%i3
	fmul8sux16	%f0,	%f26,	%f12
	smul	%i1,	0x0305,	%i4
	fbe	%fcc2,	loop_116
	movg	%xcc,	%i6,	%g4
	fbne,a	%fcc0,	loop_117
	movcs	%icc,	%g1,	%l4
loop_116:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f27,	%f3
loop_117:
	alignaddrl	%o7,	%l5,	%o4
	bshuffle	%f8,	%f16,	%f26
	andn	%g3,	0x04B3,	%l1
	xorcc	%l6,	0x1836,	%o5
	std	%f6,	[%l7 + 0x18]
	fblg	%fcc3,	loop_118
	or	%o0,	%g7,	%i0
	edge16l	%g2,	%l2,	%g5
	stbar
loop_118:
	taddcc	%i7,	%o3,	%l0
	fmovdcc	%icc,	%f26,	%f3
	fmovsl	%xcc,	%f0,	%f3
	sra	%o6,	0x15,	%i5
	tvs	%icc,	0x3
	ldsh	[%l7 + 0x7E],	%o1
	brnz	%i2,	loop_119
	sethi	0x0583,	%o2
	srax	%l3,	%g6,	%i1
	fmovsl	%icc,	%f8,	%f10
loop_119:
	movrlez	%i3,	0x375,	%i6
	st	%f15,	[%l7 + 0x54]
	edge8l	%i4,	%g1,	%g4
	movle	%xcc,	%l4,	%l5
	movpos	%xcc,	%o4,	%o7
	xnorcc	%g3,	0x1FDE,	%l1
	xor	%o5,	%o0,	%l6
	smulcc	%g7,	%i0,	%l2
	movle	%icc,	%g2,	%g5
	mova	%icc,	%o3,	%l0
	fmovrse	%o6,	%f13,	%f23
	tsubcc	%i7,	%o1,	%i2
	array8	%o2,	%i5,	%l3
	edge8ln	%i1,	%g6,	%i3
	smulcc	%i4,	0x1994,	%g1
	tvs	%xcc,	0x0
	fmovdgu	%xcc,	%f22,	%f12
	movvc	%icc,	%i6,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g4,	%l5,	%o4
	fnot1s	%f31,	%f6
	set	0x0A, %g7
	lduha	[%l7 + %g7] 0x18,	%o7
	tne	%icc,	0x2
	wr	%g0,	0x89,	%asi
	stba	%g3,	[%l7 + 0x0F] %asi
	bleu,a	loop_120
	fsrc2	%f0,	%f24
	edge8	%o5,	%l1,	%o0
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x19,	%g6
loop_120:
	movrgz	%l6,	%l2,	%i0
	andn	%g2,	0x165A,	%g5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
	movrgz	%o3,	0x108,	%o6
	tneg	%icc,	0x6
	fandnot2	%f2,	%f16,	%f30
	fpadd16	%f20,	%f14,	%f6
	edge16ln	%i7,	%i2,	%o1
	fnegs	%f30,	%f3
	sdiv	%i5,	0x1A4E,	%l3
	add	%i1,	%o2,	%g6
	fornot1s	%f18,	%f12,	%f24
	xorcc	%i3,	%g1,	%i4
	fmul8x16au	%f3,	%f25,	%f18
	edge32l	%i6,	%l4,	%g4
	ldstub	[%l7 + 0x0A],	%l5
	tle	%xcc,	0x5
	fbue,a	%fcc2,	loop_121
	flush	%l7 + 0x10
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%o4
loop_121:
	fmovdle	%icc,	%f19,	%f28
	array8	%g3,	%o5,	%o7
	umulcc	%l1,	%g7,	%o0
	tleu	%icc,	0x6
	fmovdcs	%icc,	%f7,	%f5
	addc	%l2,	%l6,	%i0
	edge8ln	%g5,	%g2,	%l0
	fnegd	%f0,	%f10
	smul	%o6,	%o3,	%i2
	fmovrdgez	%o1,	%f2,	%f18
	movrlez	%i7,	0x2C4,	%l3
	ta	%xcc,	0x4
	andn	%i5,	0x1207,	%o2
	bvc,a	loop_122
	ldsw	[%l7 + 0x64],	%g6
	subc	%i3,	0x0DD5,	%i1
	movle	%icc,	%g1,	%i4
loop_122:
	edge8ln	%l4,	%g4,	%l5
	alignaddr	%o4,	%g3,	%i6
	srlx	%o7,	0x06,	%l1
	tneg	%icc,	0x5
	fmul8x16	%f14,	%f2,	%f8
	sth	%g7,	[%l7 + 0x36]
	tn	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x38] %asi,	%o5
	tcs	%xcc,	0x1
	tvc	%xcc,	0x4
	tsubcc	%l2,	%o0,	%i0
	udivcc	%l6,	0x0070,	%g5
	fxnors	%f19,	%f6,	%f11
	brgz	%l0,	loop_123
	tvs	%icc,	0x2
	mulx	%o6,	0x18F3,	%g2
	fmovsg	%icc,	%f14,	%f27
loop_123:
	be	%xcc,	loop_124
	edge8l	%o3,	%o1,	%i7
	movrne	%i2,	0x3A5,	%l3
	movcc	%xcc,	%i5,	%o2
loop_124:
	taddcctv	%i3,	%i1,	%g6
	movleu	%icc,	%i4,	%l4
	bcs,a,pn	%icc,	loop_125
	alignaddrl	%g1,	%g4,	%o4
	fmovsneg	%xcc,	%f3,	%f28
	tpos	%icc,	0x7
loop_125:
	taddcctv	%g3,	%l5,	%i6
	taddcctv	%l1,	%o7,	%g7
	fbn	%fcc2,	loop_126
	array16	%o5,	%l2,	%o0
	subccc	%i0,	0x0C92,	%l6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x58] %asi,	%l0
loop_126:
	tle	%xcc,	0x6
	bgu,a	%icc,	loop_127
	or	%o6,	%g2,	%o3
	sub	%o1,	0x0974,	%g5
	prefetch	[%l7 + 0x24],	 0x1
loop_127:
	brlz,a	%i2,	loop_128
	movpos	%icc,	%i7,	%i5
	fmovdgu	%icc,	%f12,	%f19
	ld	[%l7 + 0x64],	%f5
loop_128:
	edge16l	%o2,	%l3,	%i3
	tpos	%icc,	0x6
	fandnot1s	%f19,	%f26,	%f13
	membar	0x1A
	ldsw	[%l7 + 0x1C],	%g6
	faligndata	%f26,	%f28,	%f22
	tle	%xcc,	0x3
	tsubcctv	%i1,	%i4,	%g1
	movcc	%icc,	%l4,	%g4
	nop
	setx loop_129, %l0, %l1
	jmpl %l1, %o4
	umulcc	%l5,	%g3,	%i6
	set	0x30, %g6
	lduwa	[%l7 + %g6] 0x81,	%o7
loop_129:
	ble,a	loop_130
	bne	%xcc,	loop_131
	swap	[%l7 + 0x4C],	%l1
	orcc	%o5,	0x01EE,	%l2
loop_130:
	fmuld8ulx16	%f24,	%f5,	%f24
loop_131:
	fblg,a	%fcc0,	loop_132
	movne	%icc,	%g7,	%i0
	movrlez	%l6,	%l0,	%o0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x60] %asi,	%f21
loop_132:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%o3
	set	0x10, %l3
	stda	%g2,	[%l7 + %l3] 0x22
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o1,	%i2
	tleu	%icc,	0x4
	sra	%g5,	%i5,	%o2
	add	%l3,	0x1E90,	%i7
	fmovde	%xcc,	%f27,	%f0
	sra	%g6,	%i3,	%i1
	array16	%g1,	%i4,	%l4
	tpos	%icc,	0x0
	fpmerge	%f13,	%f3,	%f6
	tgu	%icc,	0x2
	fmovdleu	%icc,	%f13,	%f24
	sdivcc	%o4,	0x06C0,	%g4
	alignaddr	%g3,	%l5,	%i6
	nop
	setx	loop_133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%l1,	%o7,	%o5
	movl	%icc,	%l2,	%i0
	call	loop_134
loop_133:
	fnegs	%f26,	%f3
	andcc	%l6,	%g7,	%l0
	fmovdneg	%xcc,	%f0,	%f14
loop_134:
	fornot2	%f18,	%f26,	%f0
	fmul8x16al	%f2,	%f17,	%f16
	nop
	setx	loop_135,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%o6,	0x0FAB,	%o3
	movneg	%icc,	%o0,	%g2
	fcmpne32	%f28,	%f2,	%i2
loop_135:
	edge16ln	%o1,	%i5,	%g5
	stw	%l3,	[%l7 + 0x50]
	sdivcc	%i7,	0x0750,	%g6
	fcmpne32	%f0,	%f6,	%i3
	edge32n	%i1,	%o2,	%i4
	xnorcc	%l4,	%g1,	%g4
	fmovdleu	%icc,	%f16,	%f3
	alignaddr	%g3,	%o4,	%l5
	fmul8ulx16	%f20,	%f22,	%f0
	tvs	%xcc,	0x3
	array32	%l1,	%o7,	%o5
	subcc	%l2,	%i0,	%l6
	sir	0x0869
	tsubcc	%i6,	%g7,	%o6
	xnor	%l0,	%o3,	%o0
	fandnot2s	%f8,	%f28,	%f4
	movrgez	%i2,	%g2,	%o1
	fand	%f14,	%f0,	%f10
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%g5
	fmovsa	%xcc,	%f6,	%f22
	srl	%i7,	0x19,	%g6
	sub	%i3,	%i1,	%o2
	fbo,a	%fcc1,	loop_136
	fmovrsgez	%i4,	%f6,	%f6
	tg	%xcc,	0x7
	andncc	%l4,	%l3,	%g4
loop_136:
	fcmple32	%f22,	%f26,	%g1
	fcmpgt16	%f8,	%f26,	%g3
	sra	%o4,	0x1E,	%l5
	bl,a,pt	%icc,	loop_137
	edge32n	%o7,	%o5,	%l1
	movrgez	%i0,	%l2,	%i6
	move	%xcc,	%l6,	%o6
loop_137:
	taddcctv	%l0,	%g7,	%o3
	movrlez	%i2,	%o0,	%o1
	lduh	[%l7 + 0x2C],	%i5
	set	0x40, %i0
	sta	%f25,	[%l7 + %i0] 0x10
	fmovsn	%xcc,	%f11,	%f6
	tsubcc	%g2,	0x06C8,	%i7
	movcs	%xcc,	%g5,	%g6
	ldx	[%l7 + 0x68],	%i1
	movrlz	%i3,	0x17B,	%i4
	fcmpgt16	%f2,	%f0,	%l4
	movre	%l3,	0x213,	%o2
	bvs	loop_138
	stw	%g1,	[%l7 + 0x0C]
	nop
	set	0x0E, %o3
	ldstub	[%l7 + %o3],	%g4
	alignaddr	%g3,	%o4,	%l5
loop_138:
	xnorcc	%o5,	%o7,	%i0
	nop
	setx	loop_139,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%l2,	%i6,	%l6
	movneg	%icc,	%l1,	%o6
	edge8ln	%l0,	%o3,	%g7
loop_139:
	brnz,a	%o0,	loop_140
	tge	%xcc,	0x2
	movcs	%icc,	%o1,	%i2
	tgu	%icc,	0x7
loop_140:
	tvc	%xcc,	0x2
	movl	%icc,	%g2,	%i7
	ldub	[%l7 + 0x4B],	%i5
	srlx	%g5,	0x11,	%g6
	movrgez	%i3,	0x0D0,	%i1
	movrlz	%l4,	0x3EB,	%l3
	umul	%i4,	0x1A94,	%g1
	movrlz	%g4,	0x022,	%g3
	orncc	%o2,	0x1344,	%l5
	edge16ln	%o5,	%o7,	%o4
	tn	%xcc,	0x5
	tge	%xcc,	0x1
	smul	%i0,	0x0139,	%l2
	fmul8x16	%f18,	%f28,	%f0
	brgz	%l6,	loop_141
	addccc	%l1,	0x08B1,	%o6
	srl	%i6,	%o3,	%g7
	set	0x09, %g3
	ldsba	[%l7 + %g3] 0x80,	%l0
loop_141:
	fandnot1s	%f8,	%f28,	%f7
	fba	%fcc1,	loop_142
	orn	%o0,	%o1,	%i2
	fmul8x16au	%f19,	%f1,	%f16
	fble	%fcc3,	loop_143
loop_142:
	edge16n	%i7,	%g2,	%g5
	fmovrse	%i5,	%f3,	%f11
	tn	%icc,	0x1
loop_143:
	alignaddr	%i3,	%g6,	%i1
	movg	%xcc,	%l3,	%i4
	movrne	%g1,	0x1DE,	%l4
	fble	%fcc1,	loop_144
	fcmpgt16	%f22,	%f18,	%g4
	edge16	%o2,	%g3,	%l5
	fmovdleu	%xcc,	%f14,	%f22
loop_144:
	bvc	%xcc,	loop_145
	lduw	[%l7 + 0x70],	%o7
	fcmpne32	%f16,	%f26,	%o5
	xnor	%i0,	0x030C,	%o4
loop_145:
	bneg	%icc,	loop_146
	edge16ln	%l6,	%l1,	%l2
	xor	%i6,	0x15FD,	%o6
	edge8ln	%o3,	%l0,	%g7
loop_146:
	srlx	%o1,	%i2,	%i7
	orn	%g2,	0x1493,	%g5
	edge16l	%i5,	%o0,	%g6
	srlx	%i3,	%l3,	%i1
	andcc	%i4,	0x0BD1,	%l4
	fbn,a	%fcc1,	loop_147
	tne	%xcc,	0x1
	fbul	%fcc3,	loop_148
	fand	%f22,	%f6,	%f30
loop_147:
	fsrc1	%f0,	%f14
	tge	%icc,	0x1
loop_148:
	andcc	%g4,	0x17C7,	%g1
	fnot1	%f4,	%f18
	ldd	[%l7 + 0x70],	%o2
	swap	[%l7 + 0x78],	%g3
	movne	%icc,	%o7,	%o5
	xnor	%l5,	0x0841,	%i0
	mova	%icc,	%o4,	%l6
	movrgez	%l1,	0x3AA,	%l2
	movge	%xcc,	%i6,	%o3
	subcc	%l0,	0x0199,	%o6
	fmovrde	%o1,	%f8,	%f20
	brz,a	%i2,	loop_149
	sra	%g7,	%i7,	%g2
	fmovrdgz	%g5,	%f16,	%f12
	fble	%fcc0,	loop_150
loop_149:
	movrgz	%o0,	%i5,	%g6
	tsubcctv	%l3,	%i3,	%i4
	fcmpeq16	%f24,	%f2,	%l4
loop_150:
	nop
	set	0x34, %i2
	lda	[%l7 + %i2] 0x0c,	%f25
	movrgez	%i1,	%g1,	%g4
	mulscc	%o2,	0x0509,	%g3
	fbue	%fcc0,	loop_151
	umul	%o7,	0x057B,	%l5
	tcc	%icc,	0x7
	mulscc	%o5,	0x024A,	%o4
loop_151:
	movrgez	%l6,	0x256,	%l1
	movn	%icc,	%i0,	%l2
	bl,pt	%icc,	loop_152
	xnorcc	%i6,	0x1F92,	%l0
	udivx	%o3,	0x1827,	%o1
	bgu,a,pt	%xcc,	loop_153
loop_152:
	brz,a	%i2,	loop_154
	fnor	%f26,	%f8,	%f8
	tleu	%icc,	0x3
loop_153:
	bneg	loop_155
loop_154:
	bl	%icc,	loop_156
	ldx	[%l7 + 0x70],	%g7
	or	%o6,	0x0512,	%i7
loop_155:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_156:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g5,	0x0A32,	%o0
	fmovdpos	%icc,	%f31,	%f0
	bleu,a	%xcc,	loop_157
	movge	%icc,	%i5,	%g6
	fmovsl	%icc,	%f13,	%f1
	movneg	%xcc,	%g2,	%l3
loop_157:
	andn	%i3,	%i4,	%i1
	st	%f28,	[%l7 + 0x70]
	wr	%g0,	0x81,	%asi
	stha	%l4,	[%l7 + 0x0A] %asi
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x60] %asi,	%g4
	std	%g0,	[%l7 + 0x18]
	bl	%icc,	loop_158
	edge32ln	%g3,	%o2,	%l5
	and	%o7,	%o4,	%o5
	addc	%l6,	%i0,	%l1
loop_158:
	fcmpne16	%f6,	%f18,	%l2
	movl	%icc,	%l0,	%o3
	movleu	%xcc,	%i6,	%o1
	fbul	%fcc0,	loop_159
	brgez	%g7,	loop_160
	movl	%icc,	%o6,	%i2
	movge	%xcc,	%g5,	%i7
loop_159:
	nop
	set	0x2C, %i3
	sta	%f10,	[%l7 + %i3] 0x18
loop_160:
	orncc	%i5,	%g6,	%o0
	xnor	%l3,	0x1910,	%i3
	sethi	0x166D,	%i4
	andcc	%g2,	0x10EE,	%i1
	array32	%l4,	%g4,	%g1
	taddcctv	%o2,	0x1118,	%g3
	andncc	%o7,	%l5,	%o4
	smul	%l6,	%o5,	%i0
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%l2
	fxnors	%f3,	%f8,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug	%fcc1,	loop_161
	movrlez	%l1,	0x27B,	%l0
	fabss	%f17,	%f3
	and	%o3,	0x1EFB,	%i6
loop_161:
	movg	%xcc,	%o1,	%o6
	flush	%l7 + 0x70
	srlx	%g7,	%i2,	%g5
	fbge	%fcc1,	loop_162
	movg	%xcc,	%i5,	%g6
	tleu	%icc,	0x7
	sllx	%o0,	%i7,	%l3
loop_162:
	edge8l	%i3,	%g2,	%i1
	nop
	set	0x2C, %g5
	ldsb	[%l7 + %g5],	%i4
	tsubcctv	%l4,	%g4,	%o2
	umul	%g3,	%o7,	%g1
	tle	%xcc,	0x0
	tg	%xcc,	0x3
	fmovrse	%l5,	%f16,	%f8
	srl	%l6,	%o4,	%o5
	tsubcctv	%l2,	0x0041,	%l1
	fors	%f28,	%f7,	%f4
	tle	%xcc,	0x3
	tsubcc	%l0,	0x16C9,	%i0
	fmovs	%f27,	%f31
	sdivx	%i6,	0x1383,	%o3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x10,	%o6,	%o1
	ldsw	[%l7 + 0x68],	%i2
	movneg	%xcc,	%g5,	%i5
	set	0x48, %o2
	stda	%g6,	[%l7 + %o2] 0x0c
	movg	%icc,	%g7,	%i7
	fbl,a	%fcc1,	loop_163
	ldsw	[%l7 + 0x1C],	%l3
	stx	%o0,	[%l7 + 0x48]
	tpos	%icc,	0x5
loop_163:
	brnz	%g2,	loop_164
	tleu	%xcc,	0x3
	wr	%g0,	0xe2,	%asi
	stha	%i3,	[%l7 + 0x78] %asi
	membar	#Sync
loop_164:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x22] %asi,	%i1
	nop
	setx	loop_165,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%l4,	%g4,	%o2
	andn	%i4,	0x11E8,	%o7
	umul	%g1,	%l5,	%l6
loop_165:
	fcmpd	%fcc1,	%f18,	%f2
	fbule,a	%fcc1,	loop_166
	sll	%o4,	%g3,	%o5
	tge	%xcc,	0x7
	or	%l2,	%l0,	%i0
loop_166:
	fbule	%fcc0,	loop_167
	fmovscc	%xcc,	%f25,	%f22
	edge16l	%l1,	%o3,	%o6
	fmovd	%f4,	%f24
loop_167:
	fbn,a	%fcc1,	loop_168
	tn	%icc,	0x5
	movrgez	%o1,	%i2,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_168:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pt	%xcc,	loop_169
	movrgz	%i5,	0x326,	%g6
	movvc	%icc,	%g7,	%g5
	sra	%l3,	%o0,	%g2
loop_169:
	tcc	%xcc,	0x0
	movrlez	%i7,	%i3,	%l4
	sllx	%g4,	0x1E,	%o2
	movvc	%xcc,	%i1,	%i4
	edge32n	%o7,	%l5,	%l6
	subcc	%o4,	0x160E,	%g1
	fnand	%f8,	%f24,	%f10
	fpackfix	%f20,	%f2
	fmovse	%xcc,	%f14,	%f30
	fsrc2s	%f20,	%f18
	fbug	%fcc1,	loop_170
	move	%xcc,	%g3,	%l2
	fmovsle	%icc,	%f11,	%f6
	fmovdgu	%icc,	%f14,	%f13
loop_170:
	fnot1	%f8,	%f28
	fmovsne	%xcc,	%f10,	%f6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x35] %asi,	%o5
	tn	%icc,	0x1
	fmovdg	%xcc,	%f30,	%f30
	movpos	%icc,	%i0,	%l0
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32n	%l1,	%o3,	%o1
	fcmpgt16	%f10,	%f10,	%o6
	umul	%i2,	0x1CEF,	%i5
	flush	%l7 + 0x58
	prefetch	[%l7 + 0x7C],	 0x2
	brnz	%i6,	loop_171
	movleu	%icc,	%g7,	%g5
	andncc	%g6,	%l3,	%g2
	sdivx	%o0,	0x0656,	%i3
loop_171:
	fandnot2s	%f26,	%f14,	%f29
	taddcc	%i7,	0x13F6,	%l4
	sra	%o2,	%i1,	%g4
	set	0x54, %i5
	swapa	[%l7 + %i5] 0x0c,	%o7
	tgu	%icc,	0x5
	wr	%g0,	0x2a,	%asi
	stha	%i4,	[%l7 + 0x48] %asi
	membar	#Sync
	edge32l	%l6,	%o4,	%l5
	movcc	%icc,	%g1,	%l2
	tcc	%icc,	0x3
	umulcc	%g3,	0x0F0E,	%o5
	udiv	%l0,	0x0990,	%l1
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x73] %asi,	%o3
	membar	0x52
	alignaddrl	%o1,	%i0,	%o6
	fmovsne	%xcc,	%f8,	%f10
	ldd	[%l7 + 0x70],	%f22
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x0c,	%i2,	%i5
	movvc	%icc,	%g7,	%g5
	sra	%i6,	0x07,	%g6
	brlez,a	%g2,	loop_172
	fcmps	%fcc3,	%f5,	%f4
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x04,	%f16
loop_172:
	movneg	%xcc,	%l3,	%o0
	wr	%g0,	0x89,	%asi
	stha	%i3,	[%l7 + 0x4C] %asi
	brlz	%i7,	loop_173
	tvs	%xcc,	0x7
	movgu	%xcc,	%l4,	%i1
	edge8n	%o2,	%g4,	%i4
loop_173:
	fmovrdne	%l6,	%f28,	%f6
	fmovd	%f22,	%f2
	addccc	%o7,	%l5,	%g1
	movcs	%xcc,	%o4,	%g3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2A] %asi,	%o5
	brz,a	%l2,	loop_174
	tcs	%xcc,	0x3
	fmovrdlz	%l0,	%f26,	%f22
	fmovrdlz	%o3,	%f4,	%f18
loop_174:
	edge32l	%o1,	%i0,	%l1
	fmovdgu	%icc,	%f8,	%f15
	fornot1s	%f0,	%f16,	%f16
	movle	%icc,	%o6,	%i2
	xor	%i5,	%g5,	%g7
	edge16l	%i6,	%g2,	%g6
	bge	loop_175
	sdiv	%l3,	0x0AC7,	%o0
	taddcctv	%i7,	0x186F,	%i3
	fmovdne	%icc,	%f23,	%f19
loop_175:
	tcs	%icc,	0x1
	fsrc2	%f30,	%f12
	orncc	%l4,	%o2,	%g4
	taddcc	%i1,	%l6,	%i4
	movrlz	%o7,	0x0EC,	%g1
	fbe	%fcc1,	loop_176
	edge16	%l5,	%g3,	%o5
	array32	%o4,	%l2,	%l0
	brnz	%o3,	loop_177
loop_176:
	edge32	%i0,	%o1,	%l1
	xorcc	%o6,	0x0409,	%i2
	fmovrslez	%g5,	%f31,	%f12
loop_177:
	sub	%g7,	%i6,	%i5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x78] %asi,	%g2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	sra	%g6,	%o0,	%i3
	udivcc	%i7,	0x03D8,	%o2
	sdivx	%g4,	0x0D4C,	%l4
	taddcctv	%l6,	%i4,	%o7
	fsrc1	%f8,	%f28
	fmovdcc	%icc,	%f17,	%f2
	movcc	%icc,	%i1,	%g1
	fpsub16	%f14,	%f4,	%f2
	nop
	set	0x70, %o7
	std	%f0,	[%l7 + %o7]
	fzeros	%f23
	and	%g3,	%l5,	%o4
	fand	%f16,	%f0,	%f4
	fnot2s	%f13,	%f28
	xnor	%l2,	0x1B00,	%l0
	wr	%g0,	0x80,	%asi
	stxa	%o5,	[%l7 + 0x18] %asi
	set	0x44, %o6
	lduwa	[%l7 + %o6] 0x18,	%o3
	fmovdvs	%xcc,	%f16,	%f24
	alignaddrl	%i0,	%o1,	%o6
	udiv	%l1,	0x1C46,	%i2
	movg	%xcc,	%g7,	%g5
	tne	%xcc,	0x4
	movcs	%icc,	%i6,	%g2
	bgu,a,pt	%xcc,	loop_178
	tsubcc	%i5,	0x084A,	%g6
	edge8n	%o0,	%l3,	%i3
	tpos	%xcc,	0x1
loop_178:
	fors	%f13,	%f11,	%f11
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x50] %asi,	%o2
	tcs	%icc,	0x4
	fcmpeq16	%f10,	%f16,	%i7
	udiv	%l4,	0x03F8,	%l6
	fnands	%f18,	%f30,	%f1
	fbo,a	%fcc0,	loop_179
	srax	%g4,	0x15,	%o7
	ldx	[%l7 + 0x18],	%i1
	and	%i4,	%g1,	%g3
loop_179:
	bcs,a	loop_180
	fba,a	%fcc3,	loop_181
	ta	%xcc,	0x6
	be,pt	%xcc,	loop_182
loop_180:
	fbne,a	%fcc0,	loop_183
loop_181:
	tcc	%xcc,	0x5
	edge16n	%l5,	%l2,	%l0
loop_182:
	sub	%o4,	%o3,	%i0
loop_183:
	popc	0x0EAB,	%o1
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x11] %asi,	%o5
	ld	[%l7 + 0x40],	%f25
	sra	%l1,	0x16,	%o6
	sllx	%i2,	0x06,	%g7
	tgu	%icc,	0x1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x60] %asi,	%f26
	fpack16	%f18,	%f7
	alignaddrl	%i6,	%g5,	%i5
	bcs	%icc,	loop_184
	fbl	%fcc0,	loop_185
	addc	%g2,	%g6,	%o0
	brlez,a	%l3,	loop_186
loop_184:
	movre	%o2,	0x215,	%i7
loop_185:
	xorcc	%l4,	%l6,	%i3
	fpackfix	%f2,	%f27
loop_186:
	nop
	set	0x2C, %l5
	stwa	%o7,	[%l7 + %l5] 0x2f
	membar	#Sync
	ldub	[%l7 + 0x2B],	%g4
	fbe,a	%fcc0,	loop_187
	fzeros	%f29
	tsubcc	%i1,	%i4,	%g3
	taddcc	%g1,	%l5,	%l2
loop_187:
	movcs	%icc,	%o4,	%l0
	mulx	%i0,	0x1223,	%o3
	fba,a	%fcc3,	loop_188
	stw	%o1,	[%l7 + 0x24]
	membar	0x7E
	fpsub32s	%f17,	%f24,	%f23
loop_188:
	movle	%xcc,	%o5,	%o6
	movgu	%icc,	%l1,	%i2
	fbug,a	%fcc3,	loop_189
	fmovrdne	%i6,	%f28,	%f0
	andn	%g5,	%i5,	%g7
	orn	%g2,	%g6,	%l3
loop_189:
	brgez	%o2,	loop_190
	fbn	%fcc2,	loop_191
	smul	%o0,	%l4,	%i7
	lduh	[%l7 + 0x66],	%i3
loop_190:
	tleu	%icc,	0x3
loop_191:
	tge	%xcc,	0x0
	bvs,pt	%xcc,	loop_192
	swap	[%l7 + 0x30],	%l6
	taddcctv	%g4,	0x1736,	%o7
	lduh	[%l7 + 0x6C],	%i4
loop_192:
	sub	%i1,	0x15FE,	%g1
	fnot1s	%f0,	%f17
	array32	%l5,	%l2,	%o4
	bg,a	%icc,	loop_193
	ldx	[%l7 + 0x50],	%g3
	tpos	%icc,	0x7
	st	%f10,	[%l7 + 0x08]
loop_193:
	bleu,pn	%xcc,	loop_194
	srlx	%i0,	0x1A,	%l0
	fmovsn	%icc,	%f24,	%f15
	movne	%xcc,	%o3,	%o5
loop_194:
	ba,pt	%icc,	loop_195
	edge32l	%o1,	%l1,	%i2
	movrgz	%o6,	%g5,	%i5
	sdivx	%g7,	0x1982,	%g2
loop_195:
	fba	%fcc3,	loop_196
	subc	%i6,	0x0E7A,	%g6
	tcc	%xcc,	0x2
	prefetch	[%l7 + 0x60],	 0x0
loop_196:
	bpos,a,pn	%icc,	loop_197
	mulx	%l3,	%o0,	%o2
	orncc	%l4,	0x0657,	%i3
	sllx	%l6,	%i7,	%g4
loop_197:
	edge16l	%o7,	%i1,	%i4
	fmovdg	%icc,	%f21,	%f31
	orncc	%g1,	%l2,	%o4
	subc	%l5,	%g3,	%l0
	fmovrdne	%o3,	%f28,	%f26
	fsrc2	%f12,	%f30
	movrne	%o5,	%i0,	%o1
	orncc	%l1,	%o6,	%i2
	fmul8sux16	%f18,	%f10,	%f20
	sll	%i5,	%g7,	%g5
	lduw	[%l7 + 0x5C],	%i6
	fone	%f26
	fmovsa	%xcc,	%f17,	%f20
	fbg	%fcc0,	loop_198
	fmovrsne	%g6,	%f9,	%f12
	ldsh	[%l7 + 0x12],	%l3
	tsubcc	%o0,	%o2,	%l4
loop_198:
	stbar
	sdivcc	%g2,	0x0F31,	%l6
	andncc	%i3,	%g4,	%o7
	movn	%icc,	%i1,	%i4
	movrgez	%g1,	%l2,	%o4
	movcc	%icc,	%l5,	%g3
	srl	%l0,	0x09,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,pn	%xcc,	loop_199
	movvs	%xcc,	%i7,	%i0
	tpos	%xcc,	0x2
	movre	%o5,	0x0BA,	%o1
loop_199:
	fcmpne16	%f6,	%f8,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i2,	%l1
	fmovsa	%icc,	%f8,	%f2
	tle	%icc,	0x5
	ldd	[%l7 + 0x78],	%g6
	movvs	%xcc,	%i5,	%i6
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x14,	%g5
	mulscc	%l3,	%g6,	%o0
	brnz,a	%l4,	loop_200
	stw	%g2,	[%l7 + 0x28]
	andcc	%l6,	0x0E50,	%i3
	bvs,a,pn	%xcc,	loop_201
loop_200:
	edge8n	%g4,	%o7,	%i1
	smul	%i4,	%o2,	%g1
	addcc	%l2,	0x0894,	%l5
loop_201:
	fmovsneg	%xcc,	%f26,	%f19
	mova	%xcc,	%g3,	%l0
	array8	%o4,	%i7,	%i0
	fcmpd	%fcc1,	%f22,	%f2
	fbn	%fcc2,	loop_202
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%o5,	%f8,	%f0
	bg,pt	%icc,	loop_203
loop_202:
	mulx	%o3,	0x013F,	%o1
	tgu	%xcc,	0x1
	movl	%xcc,	%i2,	%l1
loop_203:
	fbge,a	%fcc1,	loop_204
	prefetch	[%l7 + 0x78],	 0x1
	fpadd16s	%f5,	%f7,	%f31
	sub	%g7,	0x15BD,	%o6
loop_204:
	fxor	%f20,	%f16,	%f24
	bl,a	%icc,	loop_205
	movrlez	%i5,	0x3AC,	%g5
	fmovrdlz	%i6,	%f12,	%f12
	mulx	%g6,	0x06A7,	%l3
loop_205:
	tvc	%xcc,	0x0
	set	0x58, %o5
	ldswa	[%l7 + %o5] 0x19,	%l4
	edge32l	%g2,	%o0,	%i3
	movrgez	%l6,	0x179,	%o7
	bcc,a,pn	%xcc,	loop_206
	ld	[%l7 + 0x60],	%f25
	udivx	%i1,	0x0EE5,	%g4
	fmovdcs	%xcc,	%f31,	%f25
loop_206:
	fpmerge	%f25,	%f12,	%f28
	smul	%o2,	%g1,	%l2
	or	%i4,	%g3,	%l5
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x18
	xnor	%l0,	%o4,	%i7
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x5C] %asi,	%f31
	sll	%o5,	0x0F,	%i0
	prefetch	[%l7 + 0x38],	 0x3
	sra	%o1,	%o3,	%l1
	fmovrslez	%i2,	%f15,	%f22
	edge32n	%g7,	%i5,	%o6
	xorcc	%g5,	0x0F6C,	%g6
	andcc	%i6,	0x0EC8,	%l3
	edge16n	%g2,	%l4,	%i3
	array16	%o0,	%l6,	%o7
	pdist	%f0,	%f6,	%f16
	movrne	%g4,	%o2,	%g1
	for	%f2,	%f24,	%f24
	edge32	%l2,	%i1,	%i4
	stb	%l5,	[%l7 + 0x3B]
	tvc	%icc,	0x5
	nop
	setx	loop_207,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnegs	%f12,	%f30
	swap	[%l7 + 0x74],	%g3
	srlx	%o4,	%i7,	%l0
loop_207:
	tl	%xcc,	0x2
	sdivcc	%i0,	0x1443,	%o5
	flush	%l7 + 0x6C
	tl	%xcc,	0x3
	set	0x7C, %g2
	swapa	[%l7 + %g2] 0x19,	%o1
	bleu,a,pt	%icc,	loop_208
	tpos	%xcc,	0x6
	tcc	%icc,	0x3
	fandnot2s	%f17,	%f4,	%f25
loop_208:
	bge	%xcc,	loop_209
	movn	%xcc,	%l1,	%i2
	bvc,pn	%icc,	loop_210
	fba	%fcc0,	loop_211
loop_209:
	movn	%icc,	%o3,	%g7
	xnor	%i5,	0x0130,	%o6
loop_210:
	fmovde	%xcc,	%f22,	%f15
loop_211:
	fsrc1	%f22,	%f4
	tsubcc	%g5,	%g6,	%l3
	xnorcc	%g2,	0x0AAE,	%i6
	fbu,a	%fcc1,	loop_212
	alignaddrl	%i3,	%l4,	%l6
	sll	%o0,	%o7,	%o2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x6E] %asi,	%g4
loop_212:
	fmovsge	%icc,	%f21,	%f17
	movrlz	%g1,	0x01A,	%l2
	fnot2s	%f19,	%f22
	xnorcc	%i1,	0x0FF4,	%l5
	popc	%g3,	%o4
	fbg	%fcc1,	loop_213
	brnz	%i4,	loop_214
	brnz,a	%l0,	loop_215
	udivcc	%i7,	0x146D,	%o5
loop_213:
	sth	%o1,	[%l7 + 0x3A]
loop_214:
	mulscc	%i0,	0x0E61,	%l1
loop_215:
	addccc	%o3,	0x0DCA,	%g7
	tle	%icc,	0x2
	fzero	%f24
	tge	%xcc,	0x1
	movrgez	%i5,	0x333,	%i2
	addccc	%g5,	0x03F5,	%o6
	ldub	[%l7 + 0x33],	%l3
	bge,a	loop_216
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x3
	edge16ln	%g6,	%i6,	%g2
loop_216:
	andn	%i3,	%l6,	%l4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o0
	movneg	%icc,	%o7,	%g4
	tcs	%xcc,	0x0
	sra	%g1,	0x1E,	%o2
	mova	%icc,	%l2,	%i1
	wr	%g0,	0x89,	%asi
	stwa	%l5,	[%l7 + 0x48] %asi
	fmovrdlz	%g3,	%f22,	%f2
	ta	%xcc,	0x3
	taddcctv	%i4,	0x115A,	%l0
	movrgz	%i7,	%o5,	%o1
	add	%i0,	%l1,	%o3
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x5C] %asi,	%o4
	edge8ln	%i5,	%i2,	%g5
	fmul8sux16	%f2,	%f12,	%f10
	srl	%o6,	%l3,	%g7
	set	0x218, %i1
	ldxa	[%g0 + %i1] 0x52,	%g6
	ldub	[%l7 + 0x4E],	%g2
	sub	%i6,	%l6,	%l4
	ldstub	[%l7 + 0x28],	%i3
	tcc	%xcc,	0x2
	edge32	%o7,	%g4,	%g1
	xor	%o0,	0x184B,	%o2
	addc	%l2,	0x0829,	%i1
	nop
	setx	loop_217,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tleu	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	stba	%g3,	[%l7 + 0x54] %asi
loop_217:
	fmovsne	%icc,	%f11,	%f2
	fcmps	%fcc3,	%f14,	%f6
	tvs	%xcc,	0x4
	fble	%fcc0,	loop_218
	sll	%i4,	0x13,	%l5
	udiv	%i7,	0x0AF3,	%l0
	fmovrde	%o5,	%f22,	%f0
loop_218:
	tl	%xcc,	0x3
	ble	loop_219
	tg	%icc,	0x1
	tpos	%icc,	0x2
	subc	%i0,	%l1,	%o1
loop_219:
	fbul	%fcc3,	loop_220
	tne	%xcc,	0x4
	mulscc	%o3,	%o4,	%i2
	umulcc	%g5,	%o6,	%l3
loop_220:
	taddcc	%i5,	%g6,	%g2
	udiv	%g7,	0x1AB4,	%l6
	movge	%icc,	%i6,	%i3
	set	0x68, %l4
	sta	%f1,	[%l7 + %l4] 0x0c
	addcc	%o7,	%l4,	%g1
	subcc	%o0,	0x0660,	%g4
	fsrc2s	%f20,	%f5
	tle	%icc,	0x7
	bleu,a	%xcc,	loop_221
	array32	%o2,	%l2,	%g3
	fsrc2s	%f13,	%f2
	movcs	%xcc,	%i1,	%i4
loop_221:
	edge16n	%l5,	%i7,	%l0
	fand	%f20,	%f14,	%f0
	addccc	%i0,	0x18E1,	%l1
	mova	%icc,	%o1,	%o3
	brlez,a	%o4,	loop_222
	fpmerge	%f25,	%f7,	%f8
	bvs	%xcc,	loop_223
	movrne	%i2,	0x37F,	%o5
loop_222:
	fmovse	%icc,	%f23,	%f31
	taddcc	%o6,	%g5,	%l3
loop_223:
	ldstub	[%l7 + 0x08],	%i5
	sdiv	%g6,	0x1A8A,	%g7
	srlx	%l6,	%i6,	%g2
	tsubcc	%i3,	0x1EB9,	%o7
	flush	%l7 + 0x08
	fxnor	%f6,	%f6,	%f2
	tle	%xcc,	0x4
	flush	%l7 + 0x28
	bg,pt	%xcc,	loop_224
	fmovdle	%icc,	%f7,	%f16
	set	0x50, %l0
	stda	%l4,	[%l7 + %l0] 0x18
loop_224:
	movvs	%xcc,	%g1,	%o0
	tvc	%xcc,	0x3
	tl	%xcc,	0x3
	array32	%g4,	%o2,	%g3
	fsrc2	%f6,	%f4
	tsubcctv	%l2,	0x0960,	%i4
	for	%f14,	%f14,	%f2
	ldsw	[%l7 + 0x6C],	%l5
	fbn	%fcc2,	loop_225
	edge32ln	%i7,	%i1,	%i0
	fmovsvs	%xcc,	%f26,	%f3
	tg	%icc,	0x3
loop_225:
	movneg	%xcc,	%l0,	%l1
	fsrc2	%f22,	%f28
	fmovdcc	%icc,	%f14,	%f1
	flush	%l7 + 0x40
	addcc	%o3,	0x17C8,	%o1
	sra	%o4,	0x04,	%i2
	tleu	%xcc,	0x6
	movgu	%xcc,	%o6,	%o5
	st	%f0,	[%l7 + 0x08]
	fmul8x16al	%f20,	%f5,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc2,	loop_226
	movl	%icc,	%l3,	%g5
	bl	%xcc,	loop_227
	te	%icc,	0x3
loop_226:
	bge	%icc,	loop_228
	std	%f2,	[%l7 + 0x50]
loop_227:
	fble	%fcc1,	loop_229
	fmovdgu	%icc,	%f25,	%f27
loop_228:
	sub	%i5,	0x10A9,	%g7
	addccc	%l6,	%g6,	%i6
loop_229:
	orncc	%g2,	0x16BE,	%i3
	mova	%icc,	%o7,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f23,	%f9,	%f19
	edge8	%l4,	%g4,	%o0
	movne	%xcc,	%g3,	%o2
	brnz	%i4,	loop_230
	movpos	%icc,	%l5,	%i7
	edge32l	%i1,	%i0,	%l0
	mova	%icc,	%l2,	%l1
loop_230:
	edge32	%o3,	%o1,	%i2
	fmovscs	%xcc,	%f24,	%f5
	movge	%xcc,	%o4,	%o5
	std	%l2,	[%l7 + 0x20]
	andn	%o6,	0x1B84,	%g5
	orn	%i5,	0x19C3,	%l6
	andn	%g6,	%g7,	%i6
	tleu	%icc,	0x1
	fnands	%f17,	%f29,	%f22
	tle	%xcc,	0x7
	alignaddrl	%g2,	%i3,	%g1
	fbug,a	%fcc2,	loop_231
	fnot2s	%f23,	%f24
	std	%f12,	[%l7 + 0x70]
	fmovrsne	%o7,	%f0,	%f2
loop_231:
	bcc,a	%xcc,	loop_232
	smulcc	%g4,	0x196D,	%l4
	ldsh	[%l7 + 0x1C],	%o0
	tg	%icc,	0x1
loop_232:
	sdivx	%o2,	0x0C51,	%g3
	sdiv	%l5,	0x143A,	%i7
	movvc	%icc,	%i4,	%i1
	or	%i0,	0x1445,	%l2
	fmovdleu	%xcc,	%f13,	%f15
	sll	%l0,	0x0B,	%o3
	xorcc	%o1,	0x1D8B,	%i2
	array16	%o4,	%o5,	%l3
	tle	%icc,	0x7
	ldd	[%l7 + 0x08],	%o6
	tcs	%icc,	0x2
	tge	%xcc,	0x2
	membar	0x69
	or	%l1,	%i5,	%g5
	fmovsge	%icc,	%f2,	%f29
	tsubcc	%g6,	%g7,	%l6
	movrlz	%i6,	0x22F,	%g2
	movrgez	%g1,	%o7,	%i3
	fbug	%fcc2,	loop_233
	mulx	%l4,	0x0F1C,	%o0
	fmovsge	%icc,	%f6,	%f20
	subccc	%g4,	0x0E2E,	%g3
loop_233:
	fmovscc	%xcc,	%f7,	%f16
	fbne,a	%fcc2,	loop_234
	bne,a	%icc,	loop_235
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o2,	%i7,	%l5
loop_234:
	tsubcctv	%i4,	0x0744,	%i0
loop_235:
	bpos,a,pt	%xcc,	loop_236
	fmovspos	%xcc,	%f5,	%f30
	array8	%l2,	%l0,	%o3
	tgu	%icc,	0x2
loop_236:
	movgu	%xcc,	%o1,	%i2
	set	0x10, %i6
	stda	%o4,	[%l7 + %i6] 0xeb
	membar	#Sync
	fmovsge	%xcc,	%f20,	%f18
	bgu,a	loop_237
	tvc	%xcc,	0x7
	xor	%i1,	0x1876,	%o5
	or	%l3,	%l1,	%o6
loop_237:
	edge32n	%g5,	%g6,	%i5
	add	%l6,	0x1F7D,	%i6
	tvs	%xcc,	0x2
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g2
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g7
	array32	%g1,	%o7,	%i3
	fones	%f4
	for	%f4,	%f18,	%f8
	orcc	%l4,	%o0,	%g4
	tpos	%icc,	0x0
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x15
	smul	%g3,	%i7,	%o2
	movcs	%icc,	%l5,	%i4
	subcc	%i0,	0x1D5E,	%l2
	flush	%l7 + 0x20
	edge16ln	%l0,	%o1,	%i2
	nop
	set	0x20, %i4
	std	%o2,	[%l7 + %i4]
	array16	%i1,	%o5,	%o4
	andncc	%l1,	%l3,	%o6
	smul	%g5,	%i5,	%g6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%l6
	sra	%g2,	0x19,	%g7
	movrne	%o7,	%g1,	%i3
	movgu	%icc,	%l4,	%g4
	set	0x48, %l1
	prefetcha	[%l7 + %l1] 0x88,	 0x2
	edge16	%i7,	%o2,	%g3
	te	%xcc,	0x7
	movcc	%xcc,	%i4,	%i0
	sll	%l5,	0x1E,	%l0
	tleu	%icc,	0x3
	fornot2	%f8,	%f14,	%f4
	fmovrdgez	%o1,	%f8,	%f14
	orn	%i2,	%o3,	%l2
	xnorcc	%i1,	0x11E8,	%o5
	te	%xcc,	0x3
	membar	0x3A
	edge16ln	%o4,	%l3,	%o6
	fnor	%f18,	%f20,	%f30
	udivx	%g5,	0x07C9,	%l1
	tg	%icc,	0x6
	ldsb	[%l7 + 0x32],	%i5
	fnot1	%f14,	%f8
	ta	%xcc,	0x3
	fmovrslez	%g6,	%f5,	%f20
	umulcc	%i6,	0x0156,	%g2
	edge32n	%l6,	%g7,	%g1
	bpos	%icc,	loop_238
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x072E,	%o7
	ta	%xcc,	0x7
loop_238:
	addc	%i3,	0x091F,	%l4
	movrlez	%o0,	%i7,	%o2
	edge8l	%g4,	%i4,	%i0
	taddcctv	%l5,	%g3,	%l0
	bleu,pt	%icc,	loop_239
	movrne	%i2,	%o1,	%o3
	bge,pt	%xcc,	loop_240
	stw	%i1,	[%l7 + 0x54]
loop_239:
	move	%xcc,	%l2,	%o4
	bge,a,pt	%icc,	loop_241
loop_240:
	movne	%xcc,	%o5,	%l3
	fmovdvs	%xcc,	%f25,	%f23
	orncc	%g5,	0x1E4C,	%o6
loop_241:
	fmovrslez	%i5,	%f21,	%f31
	fbn,a	%fcc1,	loop_242
	tn	%xcc,	0x1
	prefetch	[%l7 + 0x24],	 0x0
	edge8n	%l1,	%g6,	%g2
loop_242:
	bgu,a	%icc,	loop_243
	ldd	[%l7 + 0x18],	%f24
	taddcc	%i6,	0x0143,	%g7
	sub	%l6,	0x101F,	%g1
loop_243:
	alignaddr	%i3,	%o7,	%o0
	orcc	%l4,	%i7,	%o2
	fsrc1s	%f31,	%f1
	bcc,a	loop_244
	movre	%i4,	0x04E,	%g4
	edge32n	%i0,	%g3,	%l5
	array8	%i2,	%o1,	%l0
loop_244:
	edge16n	%o3,	%i1,	%o4
	movrgz	%o5,	%l3,	%l2
	edge8l	%g5,	%o6,	%l1
	movl	%xcc,	%i5,	%g6
	fbule	%fcc1,	loop_245
	edge16l	%g2,	%g7,	%i6
	addcc	%g1,	0x1C94,	%i3
	wr	%g0,	0x18,	%asi
	sta	%f17,	[%l7 + 0x70] %asi
loop_245:
	fbl	%fcc1,	loop_246
	bneg,a,pn	%icc,	loop_247
	edge32n	%o7,	%o0,	%l4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x19,	%f16
loop_246:
	movl	%xcc,	%i7,	%l6
loop_247:
	fmovdneg	%icc,	%f16,	%f4
	prefetch	[%l7 + 0x4C],	 0x1
	movrne	%i4,	%g4,	%o2
	fmovsne	%icc,	%f14,	%f20
	andcc	%g3,	0x0704,	%i0
	tn	%xcc,	0x6
	subcc	%i2,	0x1A69,	%l5
	movrlez	%l0,	0x3AF,	%o3
	set	0x7C, %l6
	swapa	[%l7 + %l6] 0x89,	%i1
	fandnot1	%f24,	%f0,	%f8
	xorcc	%o1,	0x0625,	%o4
	prefetch	[%l7 + 0x68],	 0x3
	fcmple16	%f12,	%f22,	%o5
	swap	[%l7 + 0x5C],	%l2
	srax	%l3,	%o6,	%l1
	nop
	set	0x12, %g7
	lduh	[%l7 + %g7],	%i5
	srax	%g6,	%g2,	%g7
	movrgz	%i6,	0x296,	%g1
	fbuge,a	%fcc1,	loop_248
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0FEF
	movge	%icc,	%g5,	%o7
loop_248:
	edge32ln	%i3,	%o0,	%i7
	stbar
	fxor	%f30,	%f28,	%f28
	edge8l	%l6,	%i4,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x2
	nop
	setx	loop_249,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addcc	%o2,	%g4,	%i0
	orcc	%g3,	%l5,	%l0
	move	%xcc,	%i2,	%i1
loop_249:
	sllx	%o1,	%o4,	%o5
	movcc	%icc,	%o3,	%l2
	addccc	%l3,	0x0FD4,	%l1
	fpsub32	%f28,	%f16,	%f18
	array8	%o6,	%i5,	%g6
	movrlez	%g7,	0x0CC,	%g2
	popc	0x10D7,	%g1
	array32	%i6,	%g5,	%o7
	edge32	%i3,	%i7,	%o0
	alignaddr	%l6,	%i4,	%o2
	flush	%l7 + 0x68
	fsrc1s	%f22,	%f22
	movrne	%g4,	%l4,	%i0
	sub	%l5,	0x0C31,	%l0
	fmovrslz	%g3,	%f16,	%f10
	te	%xcc,	0x5
	mulx	%i1,	%i2,	%o4
	movgu	%xcc,	%o1,	%o3
	tne	%xcc,	0x7
	set	0x40, %l2
	stxa	%l2,	[%l7 + %l2] 0x89
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%l3
	udivx	%l1,	0x1C9F,	%o6
	taddcc	%g6,	%g7,	%i5
	edge16	%g1,	%g2,	%i6
	fmovsne	%xcc,	%f2,	%f28
	tsubcctv	%g5,	0x16A5,	%i3
	udiv	%i7,	0x188E,	%o7
	movrgz	%l6,	0x3D7,	%i4
	movvc	%xcc,	%o2,	%g4
	brgz	%o0,	loop_250
	srl	%l4,	%i0,	%l5
	xnorcc	%g3,	0x0877,	%i1
	fbg,a	%fcc0,	loop_251
loop_250:
	tne	%icc,	0x1
	addccc	%l0,	0x1C11,	%o4
	bgu	%xcc,	loop_252
loop_251:
	array16	%o1,	%o3,	%i2
	andn	%o5,	%l3,	%l2
	sdivcc	%l1,	0x02EC,	%g6
loop_252:
	sir	0x17E5
	fmovdg	%icc,	%f11,	%f21
	sdivx	%o6,	0x0381,	%i5
	move	%icc,	%g1,	%g2
	fabsd	%f6,	%f16
	movrgez	%g7,	0x397,	%i6
	call	loop_253
	fxnor	%f14,	%f20,	%f22
	edge8	%i3,	%g5,	%o7
	fbe,a	%fcc3,	loop_254
loop_253:
	sdiv	%i7,	0x161A,	%i4
	fnegs	%f27,	%f21
	wr	%g0,	0x11,	%asi
	stwa	%o2,	[%l7 + 0x64] %asi
loop_254:
	fmovrdne	%l6,	%f30,	%f16
	sdivcc	%g4,	0x05A9,	%l4
	subccc	%o0,	0x0C91,	%i0
	umulcc	%l5,	0x0114,	%g3
	movrne	%i1,	%o4,	%o1
	call	loop_255
	movvc	%xcc,	%o3,	%l0
	fpsub16s	%f2,	%f15,	%f17
	move	%icc,	%o5,	%l3
loop_255:
	fmovda	%icc,	%f5,	%f21
	tcs	%xcc,	0x7
	fmovdge	%icc,	%f2,	%f6
	bn,a	%icc,	loop_256
	movrlez	%i2,	0x1D3,	%l1
	sth	%l2,	[%l7 + 0x3C]
	taddcctv	%o6,	0x0ABC,	%g6
loop_256:
	edge16	%i5,	%g1,	%g2
	fmovdpos	%xcc,	%f27,	%f1
	fmovsge	%xcc,	%f2,	%f6
	fbge	%fcc0,	loop_257
	bg	%xcc,	loop_258
	fbule	%fcc3,	loop_259
	addc	%i6,	%i3,	%g5
loop_257:
	sdiv	%o7,	0x1ABA,	%i7
loop_258:
	srax	%g7,	%i4,	%o2
loop_259:
	movvc	%xcc,	%g4,	%l6
	fxnors	%f2,	%f14,	%f15
	movcc	%xcc,	%o0,	%l4
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x3C] %asi,	%l5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%i0
	ldsb	[%l7 + 0x1C],	%i1
	membar	0x1E
	nop
	setx	loop_260,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ta	%xcc,	0x0
	movcs	%xcc,	%o1,	%o4
	tleu	%xcc,	0x3
loop_260:
	nop
	set	0x2C, %i7
	sta	%f15,	[%l7 + %i7] 0x04
	movrgez	%l0,	%o3,	%l3
	srl	%i2,	%o5,	%l2
	taddcctv	%o6,	%l1,	%i5
	tvc	%xcc,	0x0
	brz,a	%g1,	loop_261
	fnot2	%f30,	%f12
	tsubcc	%g6,	%i6,	%g2
	xnor	%i3,	0x1B4B,	%g5
loop_261:
	xor	%o7,	0x149B,	%i7
	sll	%g7,	0x12,	%o2
	set	0x58, %l3
	ldsha	[%l7 + %l3] 0x0c,	%i4
	fsrc2s	%f17,	%f9
	orcc	%g4,	%o0,	%l6
	brz	%l4,	loop_262
	membar	0x2A
	fble,a	%fcc3,	loop_263
	add	%g3,	0x01DB,	%l5
loop_262:
	andncc	%i1,	%i0,	%o4
	fpadd32s	%f29,	%f17,	%f3
loop_263:
	tvs	%xcc,	0x6
	edge8ln	%l0,	%o3,	%o1
	stbar
	umul	%l3,	0x01A3,	%i2
	orcc	%o5,	%l2,	%l1
	fornot1	%f26,	%f0,	%f24
	fbne,a	%fcc3,	loop_264
	sdivcc	%i5,	0x19AF,	%g1
	sdivcc	%o6,	0x118D,	%g6
	fpmerge	%f16,	%f30,	%f4
loop_264:
	tn	%icc,	0x3
	fbue	%fcc1,	loop_265
	mova	%xcc,	%g2,	%i3
	brgez	%g5,	loop_266
	sir	0x01E9
loop_265:
	fpsub32	%f28,	%f4,	%f2
	orcc	%o7,	%i7,	%g7
loop_266:
	fmovsneg	%icc,	%f7,	%f9
	subccc	%i6,	%i4,	%o2
	fmovrdgez	%o0,	%f14,	%f12
	movrgez	%l6,	0x399,	%g4
	edge32l	%l4,	%l5,	%g3
	for	%f28,	%f30,	%f22
	udivcc	%i1,	0x007A,	%o4
	fmovrdgz	%l0,	%f2,	%f24
	fnor	%f18,	%f2,	%f28
	movn	%icc,	%o3,	%o1
	ldx	[%l7 + 0x60],	%i0
	sethi	0x0582,	%i2
	bcs	%xcc,	loop_267
	tneg	%icc,	0x2
	xorcc	%l3,	%o5,	%l1
	sethi	0x015C,	%l2
loop_267:
	movpos	%xcc,	%i5,	%g1
	edge8ln	%g6,	%o6,	%g2
	fmovrdlz	%g5,	%f24,	%f30
	movcc	%icc,	%i3,	%o7
	fmovdn	%xcc,	%f20,	%f26
	move	%icc,	%i7,	%i6
	movle	%xcc,	%g7,	%i4
	movcc	%xcc,	%o0,	%o2
	fmovdne	%xcc,	%f26,	%f17
	srl	%g4,	0x1F,	%l4
	movrlz	%l5,	0x2AF,	%g3
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x27,	%i0
	wr	%g0,	0x80,	%asi
	stda	%i6,	[%l7 + 0x48] %asi
	alignaddrl	%l0,	%o4,	%o3
	udivcc	%o1,	0x0415,	%i2
	subccc	%i0,	%o5,	%l1
	xnor	%l3,	%l2,	%g1
	sdivcc	%i5,	0x03E5,	%o6
	fmovdgu	%icc,	%f22,	%f6
	tsubcc	%g6,	%g5,	%i3
	edge8	%o7,	%g2,	%i7
	andcc	%i6,	0x1253,	%i4
	fmovdneg	%icc,	%f1,	%f12
	be	loop_268
	fpadd32s	%f16,	%f28,	%f10
	ble,pt	%icc,	loop_269
	edge32l	%g7,	%o2,	%g4
loop_268:
	popc	%o0,	%l5
	fandnot1	%f20,	%f26,	%f0
loop_269:
	array16	%g3,	%i1,	%l6
	fmovdneg	%icc,	%f11,	%f22
	flush	%l7 + 0x70
	mulx	%l4,	0x1226,	%o4
	brz,a	%o3,	loop_270
	lduw	[%l7 + 0x30],	%l0
	move	%icc,	%i2,	%i0
	umul	%o1,	%o5,	%l1
loop_270:
	nop
	set	0x60, %g6
	ldsha	[%l7 + %g6] 0x11,	%l2
	membar	0x1E
	movcc	%icc,	%l3,	%g1
	ldub	[%l7 + 0x7F],	%o6
	and	%i5,	%g5,	%i3
	tne	%xcc,	0x5
	te	%icc,	0x5
	fpsub32s	%f11,	%f9,	%f12
	ble,pn	%xcc,	loop_271
	alignaddrl	%g6,	%g2,	%o7
	move	%icc,	%i7,	%i6
	wr	%g0,	0xeb,	%asi
	stha	%i4,	[%l7 + 0x48] %asi
	membar	#Sync
loop_271:
	nop
	set	0x48, %o3
	ldsha	[%l7 + %o3] 0x04,	%g7
	lduw	[%l7 + 0x60],	%o2
	sethi	0x0810,	%g4
	bvs	loop_272
	movre	%o0,	%g3,	%i1
	tg	%icc,	0x3
	fmovscc	%icc,	%f22,	%f24
loop_272:
	tle	%icc,	0x0
	movre	%l6,	0x014,	%l4
	fornot2s	%f6,	%f24,	%f7
	be	loop_273
	bcc,pn	%xcc,	loop_274
	movcc	%icc,	%o4,	%l5
	bn,pn	%icc,	loop_275
loop_273:
	edge16	%o3,	%l0,	%i0
loop_274:
	bpos	%icc,	loop_276
	bg	loop_277
loop_275:
	brnz,a	%o1,	loop_278
	fones	%f17
loop_276:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_277:
	movn	%xcc,	%i2,	%o5
loop_278:
	fpsub32	%f20,	%f18,	%f14
	fbue	%fcc1,	loop_279
	fbge,a	%fcc3,	loop_280
	fpsub16	%f18,	%f2,	%f28
	brgz,a	%l2,	loop_281
loop_279:
	movvs	%icc,	%l3,	%g1
loop_280:
	movrne	%l1,	%o6,	%g5
	subc	%i3,	0x0CC9,	%g6
loop_281:
	subc	%g2,	0x110C,	%i5
	fmovrslz	%o7,	%f17,	%f5
	fcmpeq32	%f6,	%f22,	%i6
	te	%xcc,	0x4
	movrlez	%i7,	0x33A,	%g7
	fmuld8sux16	%f8,	%f23,	%f16
	umulcc	%i4,	%g4,	%o2
	array32	%o0,	%g3,	%i1
	udivx	%l4,	0x1C21,	%l6
	edge16	%o4,	%l5,	%o3
	fbne	%fcc0,	loop_282
	movrgez	%i0,	%l0,	%i2
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x30] %asi,	%o4
loop_282:
	fbne	%fcc2,	loop_283
	fands	%f20,	%f9,	%f22
	move	%icc,	%l2,	%o1
	fornot2s	%f24,	%f28,	%f18
loop_283:
	fandnot1s	%f10,	%f14,	%f25
	umulcc	%g1,	0x1F8D,	%l3
	fbne,a	%fcc1,	loop_284
	movgu	%icc,	%l1,	%g5
	membar	0x75
	move	%icc,	%o6,	%g6
loop_284:
	edge8n	%g2,	%i3,	%o7
	swap	[%l7 + 0x38],	%i6
	fmovsgu	%icc,	%f12,	%f7
	membar	0x02
	brgez,a	%i7,	loop_285
	smulcc	%g7,	%i5,	%i4
	movvs	%icc,	%o2,	%o0
	sllx	%g3,	%g4,	%i1
loop_285:
	movle	%xcc,	%l4,	%o4
	fmul8x16au	%f10,	%f3,	%f4
	subc	%l6,	%o3,	%l5
	set	0x20, %g3
	prefetcha	[%l7 + %g3] 0x14,	 0x1
	movcs	%xcc,	%l0,	%o5
	siam	0x1
	fsrc1	%f2,	%f0
	movleu	%icc,	%l2,	%o1
	fpack16	%f12,	%f29
	udivx	%g1,	0x034C,	%i2
	movcs	%icc,	%l3,	%g5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x14] %asi,	%l1
	be,pn	%xcc,	loop_286
	mulx	%g6,	0x00D9,	%g2
	fmovdge	%icc,	%f31,	%f22
	fmovdl	%xcc,	%f15,	%f16
loop_286:
	umulcc	%o6,	0x07DA,	%o7
	stw	%i6,	[%l7 + 0x3C]
	tcc	%icc,	0x7
	set	0x37, %i2
	ldstuba	[%l7 + %i2] 0x10,	%i3
	fmovdpos	%icc,	%f6,	%f19
	andncc	%g7,	%i5,	%i7
	tpos	%xcc,	0x2
	movn	%icc,	%o2,	%i4
	movge	%xcc,	%o0,	%g4
	movrne	%i1,	%g3,	%l4
	ldub	[%l7 + 0x1A],	%o4
	fmovde	%xcc,	%f6,	%f27
	fmovsvc	%xcc,	%f2,	%f14
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l5,	%i0
	wr	%g0,	0x22,	%asi
	stha	%l0,	[%l7 + 0x1C] %asi
	membar	#Sync
	movrlz	%o3,	0x386,	%o5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x54] %asi,	%l2
	sll	%g1,	%i2,	%l3
	movleu	%icc,	%o1,	%g5
	xor	%g6,	0x091E,	%g2
	ba,a,pn	%icc,	loop_287
	array8	%l1,	%o6,	%o7
	call	loop_288
	tgu	%xcc,	0x7
loop_287:
	fcmpeq32	%f10,	%f6,	%i6
	sllx	%g7,	0x1F,	%i3
loop_288:
	fcmpne32	%f6,	%f2,	%i7
	sdiv	%o2,	0x05BD,	%i5
	fnors	%f24,	%f22,	%f12
	bge	%icc,	loop_289
	fbul	%fcc2,	loop_290
	fnands	%f15,	%f12,	%f11
	fmovsle	%xcc,	%f16,	%f23
loop_289:
	fmovdleu	%xcc,	%f22,	%f14
loop_290:
	nop
	set	0x50, %g5
	std	%i4,	[%l7 + %g5]
	prefetch	[%l7 + 0x58],	 0x0
	taddcc	%o0,	%i1,	%g3
	array8	%g4,	%l4,	%l6
	fnands	%f21,	%f11,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l5,	%o4,	%i0
	bgu,a	%icc,	loop_291
	bgu,pn	%icc,	loop_292
	ldd	[%l7 + 0x10],	%f20
	movle	%xcc,	%o3,	%o5
loop_291:
	movcs	%xcc,	%l0,	%g1
loop_292:
	srax	%l2,	0x1E,	%l3
	umul	%o1,	0x0A99,	%i2
	fmovrdlz	%g5,	%f10,	%f10
	ldub	[%l7 + 0x4C],	%g2
	call	loop_293
	fmovsneg	%xcc,	%f24,	%f3
	fornot2s	%f14,	%f26,	%f8
	tl	%icc,	0x2
loop_293:
	array16	%l1,	%o6,	%o7
	brnz,a	%g6,	loop_294
	ldd	[%l7 + 0x30],	%f8
	edge16n	%i6,	%g7,	%i3
	swap	[%l7 + 0x2C],	%i7
loop_294:
	movrgez	%i5,	0x3B1,	%o2
	for	%f8,	%f16,	%f16
	addcc	%o0,	%i1,	%g3
	array16	%i4,	%l4,	%l6
	fnot2s	%f13,	%f12
	fnot1s	%f29,	%f23
	sllx	%g4,	%o4,	%l5
	tneg	%xcc,	0x6
	stbar
	fcmple32	%f26,	%f22,	%i0
	ldsb	[%l7 + 0x7C],	%o5
	movge	%xcc,	%o3,	%l0
	movgu	%xcc,	%g1,	%l2
	andcc	%o1,	%l3,	%i2
	fmuld8sux16	%f30,	%f0,	%f8
	edge8	%g5,	%l1,	%g2
	movneg	%xcc,	%o7,	%g6
	fbule,a	%fcc3,	loop_295
	movl	%xcc,	%o6,	%g7
	tleu	%icc,	0x0
	sra	%i3,	%i7,	%i5
loop_295:
	array16	%i6,	%o0,	%i1
	fmovdg	%icc,	%f26,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g3,	0x03E9,	%o2
	fmuld8sux16	%f2,	%f2,	%f24
	tcs	%xcc,	0x1
	fblg,a	%fcc3,	loop_296
	tvc	%xcc,	0x7
	tne	%icc,	0x4
	srax	%i4,	0x1C,	%l6
loop_296:
	udivcc	%l4,	0x1A22,	%o4
	movvc	%xcc,	%g4,	%i0
	tvs	%xcc,	0x2
	udivcc	%o5,	0x0C6C,	%o3
	array32	%l5,	%l0,	%l2
	mulscc	%o1,	0x0E89,	%l3
	edge32ln	%g1,	%i2,	%l1
	fpackfix	%f8,	%f12
	ldx	[%l7 + 0x08],	%g5
	fbu	%fcc0,	loop_297
	flush	%l7 + 0x34
	tn	%xcc,	0x4
	mulscc	%g2,	%o7,	%g6
loop_297:
	edge32n	%o6,	%i3,	%i7
	addcc	%g7,	0x1F88,	%i6
	movrne	%i5,	%i1,	%o0
	bg,a	loop_298
	fornot1	%f22,	%f24,	%f14
	fmovsvs	%xcc,	%f26,	%f0
	bg,a,pt	%icc,	loop_299
loop_298:
	tneg	%icc,	0x7
	movn	%icc,	%o2,	%i4
	fmovdcc	%xcc,	%f17,	%f30
loop_299:
	sdivx	%l6,	0x1547,	%g3
	set	0x00, %o2
	ldxa	[%g0 + %o2] 0x50,	%l4
	sllx	%g4,	0x1C,	%o4
	tgu	%icc,	0x4
	faligndata	%f16,	%f6,	%f30
	fxors	%f7,	%f25,	%f17
	edge16	%o5,	%o3,	%l5
	prefetch	[%l7 + 0x40],	 0x0
	bcc,a,pn	%icc,	loop_300
	edge32l	%i0,	%l2,	%l0
	sir	0x17CE
	and	%l3,	%o1,	%i2
loop_300:
	fsrc1s	%f8,	%f18
	movl	%icc,	%l1,	%g5
	sdivx	%g1,	0x1B87,	%g2
	smulcc	%g6,	0x03D5,	%o7
	ldsh	[%l7 + 0x26],	%i3
	fors	%f6,	%f24,	%f9
	movvc	%icc,	%i7,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%o6,	loop_301
	fpadd32	%f26,	%f2,	%f22
	stx	%i5,	[%l7 + 0x48]
	call	loop_302
loop_301:
	tvc	%icc,	0x0
	tpos	%icc,	0x1
	edge8	%i6,	%o0,	%i1
loop_302:
	stx	%o2,	[%l7 + 0x20]
	fornot2s	%f17,	%f31,	%f8
	stx	%l6,	[%l7 + 0x38]
	orcc	%g3,	%l4,	%g4
	lduh	[%l7 + 0x58],	%o4
	xor	%o5,	%o3,	%i4
	fabsd	%f28,	%f14
	fmovdg	%icc,	%f1,	%f5
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovdgu	%xcc,	%f4,	%f14
	nop
	set	0x48, %i5
	ldd	[%l7 + %i5],	%l4
	fmul8x16	%f7,	%f8,	%f6
	fabss	%f17,	%f12
	taddcc	%l2,	%l0,	%l3
	tneg	%xcc,	0x5
	movleu	%icc,	%i0,	%i2
	fmovsle	%xcc,	%f17,	%f30
	ld	[%l7 + 0x44],	%f25
	brlez,a	%o1,	loop_303
	umulcc	%l1,	0x0A7C,	%g1
	movn	%xcc,	%g5,	%g2
	bvs	%xcc,	loop_304
loop_303:
	fba,a	%fcc1,	loop_305
	bg,a,pt	%icc,	loop_306
	sub	%g6,	0x0CFA,	%i3
loop_304:
	brgz,a	%o7,	loop_307
loop_305:
	fnot1s	%f3,	%f20
loop_306:
	bcc,a	%icc,	loop_308
	udivcc	%g7,	0x0A94,	%o6
loop_307:
	edge16ln	%i5,	%i7,	%i6
	addcc	%i1,	0x0F47,	%o0
loop_308:
	fmovrsgz	%l6,	%f25,	%f23
	fmovdle	%icc,	%f4,	%f23
	taddcc	%o2,	%g3,	%g4
	move	%icc,	%o4,	%l4
	subc	%o5,	0x1436,	%o3
	fbue,a	%fcc2,	loop_309
	edge8ln	%i4,	%l5,	%l0
	tneg	%xcc,	0x2
	ba,a	loop_310
loop_309:
	ta	%icc,	0x1
	bcs,pt	%icc,	loop_311
	fmovsa	%xcc,	%f3,	%f21
loop_310:
	movrlez	%l2,	0x22C,	%l3
	call	loop_312
loop_311:
	add	%i2,	0x0F0C,	%o1
	fbn,a	%fcc0,	loop_313
	flush	%l7 + 0x20
loop_312:
	popc	%l1,	%g1
	fpadd16	%f0,	%f22,	%f10
loop_313:
	nop
	wr	%g0,	0xea,	%asi
	stda	%i0,	[%l7 + 0x68] %asi
	membar	#Sync
	edge8	%g5,	%g6,	%i3
	orncc	%g2,	%g7,	%o6
	add	%o7,	0x1BD8,	%i5
	stbar
	smulcc	%i7,	%i1,	%o0
	fmovdl	%xcc,	%f12,	%f16
	fbl,a	%fcc0,	loop_314
	edge16	%l6,	%o2,	%g3
	movle	%xcc,	%g4,	%i6
	sra	%l4,	0x19,	%o5
loop_314:
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x58] %asi,	%o3
	fbule,a	%fcc1,	loop_315
	fmovsgu	%xcc,	%f12,	%f28
	tvs	%icc,	0x0
	movg	%icc,	%o4,	%i4
loop_315:
	fmovde	%xcc,	%f3,	%f12
	movg	%xcc,	%l0,	%l2
	fors	%f30,	%f12,	%f1
	movvc	%xcc,	%l3,	%i2
	movcc	%xcc,	%o1,	%l5
	orncc	%g1,	%i0,	%g5
	fbl	%fcc0,	loop_316
	fmovd	%f20,	%f0
	tsubcc	%g6,	%l1,	%g2
	sub	%g7,	0x01DD,	%i3
loop_316:
	ldd	[%l7 + 0x40],	%f2
	xorcc	%o6,	%i5,	%o7
	movrne	%i7,	0x121,	%o0
	brnz,a	%l6,	loop_317
	fnot2	%f0,	%f12
	fmovdg	%xcc,	%f1,	%f6
	te	%xcc,	0x3
loop_317:
	fbuge,a	%fcc2,	loop_318
	orcc	%i1,	0x0D02,	%o2
	fsrc1	%f2,	%f20
	nop
	setx	loop_319,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_318:
	add	%g3,	0x0F1C,	%g4
	edge8	%l4,	%o5,	%o3
	srl	%i6,	0x16,	%o4
loop_319:
	bl,a,pt	%icc,	loop_320
	andncc	%l0,	%l2,	%i4
	tg	%xcc,	0x7
	fmovsne	%xcc,	%f30,	%f6
loop_320:
	xor	%l3,	0x1CE4,	%o1
	fmovs	%f27,	%f28
	fmovrsne	%l5,	%f16,	%f22
	fpack32	%f2,	%f24,	%f14
	bcc,pn	%xcc,	loop_321
	tneg	%icc,	0x0
	set	0x58, %g1
	swapa	[%l7 + %g1] 0x80,	%g1
loop_321:
	nop
	wr	%g0,	0x11,	%asi
	sta	%f21,	[%l7 + 0x4C] %asi
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%i2
	set	0x64, %i3
	lduba	[%l7 + %i3] 0x0c,	%g5
	array8	%l1,	%g2,	%g6
	bvc,a	%icc,	loop_322
	pdist	%f20,	%f4,	%f12
	sethi	0x1623,	%i3
	nop
	set	0x10, %o6
	std	%g6,	[%l7 + %o6]
loop_322:
	andn	%i5,	0x0EE3,	%o6
	edge8	%o7,	%i7,	%o0
	fmovrdlez	%i1,	%f16,	%f28
	tcs	%xcc,	0x5
	movcs	%xcc,	%l6,	%o2
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	orncc	%g3,	%g4,	%l4
	array32	%o3,	%i6,	%o4
	fsrc2	%f16,	%f6
	smulcc	%o5,	%l2,	%i4
	tleu	%xcc,	0x0
	lduw	[%l7 + 0x3C],	%l0
	fxors	%f5,	%f2,	%f26
	alignaddrl	%o1,	%l5,	%g1
	fpadd32s	%f12,	%f11,	%f10
	add	%l3,	%i0,	%i2
	fmovdpos	%xcc,	%f10,	%f4
	sub	%l1,	0x1D3C,	%g2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%g6
	movpos	%icc,	%g5,	%g7
	add	%i3,	%o6,	%o7
	fmovsneg	%xcc,	%f25,	%f24
	array16	%i5,	%i7,	%o0
	fba,a	%fcc1,	loop_323
	movrgez	%i1,	0x219,	%l6
	xor	%g3,	%o2,	%g4
	movvs	%icc,	%l4,	%o3
loop_323:
	tcc	%xcc,	0x5
	andncc	%o4,	%i6,	%o5
	fmovdleu	%xcc,	%f2,	%f10
	ba	%xcc,	loop_324
	sethi	0x17BE,	%l2
	bgu,pt	%xcc,	loop_325
	edge16l	%i4,	%o1,	%l5
loop_324:
	bvs	%icc,	loop_326
	movpos	%icc,	%g1,	%l0
loop_325:
	sllx	%i0,	%i2,	%l1
	fmovsvc	%icc,	%f17,	%f15
loop_326:
	fsrc2s	%f26,	%f15
	edge8	%g2,	%l3,	%g5
	xorcc	%g7,	%i3,	%o6
	tsubcc	%o7,	%i5,	%i7
	tgu	%xcc,	0x7
	orcc	%g6,	0x1ABD,	%i1
	tn	%icc,	0x0
	sethi	0x1867,	%o0
	movneg	%icc,	%l6,	%o2
	tle	%icc,	0x3
	fandnot1	%f20,	%f18,	%f30
	srax	%g4,	0x0B,	%l4
	brz,a	%o3,	loop_327
	fbug,a	%fcc1,	loop_328
	addcc	%g3,	0x1FBF,	%o4
	array8	%i6,	%l2,	%i4
loop_327:
	movrgz	%o5,	%o1,	%g1
loop_328:
	udivx	%l5,	0x1B7B,	%l0
	movvc	%xcc,	%i2,	%i0
	fmovdleu	%icc,	%f8,	%f1
	addc	%l1,	0x13C0,	%l3
	sdiv	%g5,	0x0D26,	%g7
	sllx	%g2,	%o6,	%o7
	subc	%i3,	0x01A8,	%i7
	fxor	%f26,	%f16,	%f22
	fone	%f20
	bg,pt	%xcc,	loop_329
	smul	%i5,	%i1,	%o0
	fmovde	%icc,	%f31,	%f23
	movrgz	%l6,	0x129,	%o2
loop_329:
	fbo	%fcc1,	loop_330
	st	%f13,	[%l7 + 0x3C]
	siam	0x3
	edge8l	%g4,	%g6,	%o3
loop_330:
	tvs	%xcc,	0x0
	tg	%xcc,	0x4
	movre	%l4,	0x048,	%o4
	wr	%g0,	0x81,	%asi
	stba	%i6,	[%l7 + 0x4D] %asi
	popc	0x0576,	%l2
	edge32ln	%g3,	%i4,	%o1
	set	0x7C, %l5
	sta	%f24,	[%l7 + %l5] 0x04
	fmovdcs	%xcc,	%f16,	%f2
	array8	%g1,	%o5,	%l0
	brlz,a	%l5,	loop_331
	mulx	%i2,	%i0,	%l3
	ldub	[%l7 + 0x39],	%g5
	fcmpgt16	%f28,	%f10,	%g7
loop_331:
	umul	%g2,	0x0084,	%o6
	sdivcc	%l1,	0x1A67,	%o7
	movrlz	%i3,	%i7,	%i5
	fmovdl	%xcc,	%f26,	%f13
	movcs	%icc,	%o0,	%i1
	set	0x52, %o7
	stha	%l6,	[%l7 + %o7] 0x0c
	edge32l	%o2,	%g4,	%o3
	edge16n	%l4,	%o4,	%g6
	movle	%icc,	%i6,	%l2
	fmovsge	%xcc,	%f12,	%f14
	edge8l	%g3,	%o1,	%g1
	taddcctv	%o5,	0x10C4,	%l0
	set	0x72, %o5
	stha	%l5,	[%l7 + %o5] 0x89
	udiv	%i2,	0x0242,	%i4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l3,	%i0
	movcc	%xcc,	%g5,	%g7
	swap	[%l7 + 0x30],	%o6
	subccc	%l1,	%o7,	%i3
	movpos	%icc,	%g2,	%i7
	edge32	%o0,	%i1,	%l6
	array32	%o2,	%g4,	%o3
	movn	%xcc,	%i5,	%o4
	bcs,pt	%xcc,	loop_332
	movleu	%icc,	%l4,	%g6
	sir	0x0613
	fmovs	%f13,	%f19
loop_332:
	srlx	%i6,	0x0A,	%l2
	fbu	%fcc2,	loop_333
	movcc	%xcc,	%o1,	%g1
	tleu	%xcc,	0x7
	fbo,a	%fcc2,	loop_334
loop_333:
	sethi	0x17C2,	%g3
	andn	%l0,	%o5,	%i2
	movle	%icc,	%l5,	%i4
loop_334:
	fmovdcc	%icc,	%f8,	%f5
	movn	%icc,	%l3,	%i0
	fcmpne32	%f10,	%f16,	%g7
	fmovrsgz	%o6,	%f25,	%f1
	mulx	%g5,	%l1,	%o7
	brz,a	%g2,	loop_335
	fbg	%fcc2,	loop_336
	bpos	loop_337
	te	%icc,	0x2
loop_335:
	edge32ln	%i7,	%i3,	%o0
loop_336:
	xorcc	%l6,	0x185A,	%o2
loop_337:
	xor	%g4,	0x0428,	%o3
	movneg	%icc,	%i1,	%i5
	lduw	[%l7 + 0x2C],	%l4
	umulcc	%g6,	0x0E67,	%i6
	fmovse	%xcc,	%f23,	%f20
	fone	%f12
	tvs	%icc,	0x5
	tleu	%icc,	0x3
	alignaddr	%l2,	%o1,	%g1
	smul	%o4,	%g3,	%o5
	edge32	%l0,	%i2,	%l5
	bcc,a	%xcc,	loop_338
	fpadd32	%f22,	%f2,	%f12
	fones	%f14
	edge16ln	%i4,	%l3,	%g7
loop_338:
	movneg	%icc,	%i0,	%g5
	tge	%xcc,	0x0
	fornot2s	%f10,	%f7,	%f2
	srl	%o6,	%l1,	%g2
	edge8l	%i7,	%i3,	%o7
	subccc	%l6,	%o0,	%o2
	fpsub32s	%f18,	%f14,	%f17
	tsubcctv	%g4,	0x09FD,	%o3
	te	%xcc,	0x3
	subccc	%i1,	%l4,	%g6
	andn	%i5,	0x096E,	%l2
	movgu	%icc,	%i6,	%o1
	or	%g1,	%o4,	%o5
	movleu	%xcc,	%l0,	%i2
	andcc	%g3,	0x1FDF,	%i4
	fpsub16s	%f29,	%f5,	%f2
	fmovrse	%l5,	%f17,	%f8
	brlez,a	%g7,	loop_339
	fbg,a	%fcc0,	loop_340
	edge8n	%l3,	%i0,	%o6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x50] %asi,	%g5
loop_339:
	fpadd32	%f26,	%f10,	%f30
loop_340:
	movn	%xcc,	%g2,	%i7
	bpos,a	%icc,	loop_341
	fbne	%fcc0,	loop_342
	srl	%l1,	%o7,	%l6
	array8	%o0,	%o2,	%g4
loop_341:
	sub	%o3,	%i3,	%i1
loop_342:
	tl	%xcc,	0x3
	alignaddr	%g6,	%i5,	%l2
	stb	%l4,	[%l7 + 0x1B]
	movrne	%i6,	0x261,	%g1
	movg	%xcc,	%o1,	%o5
	bleu,a,pn	%icc,	loop_343
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l0,	%o4,	%g3
	set	0x30, %g4
	ldda	[%l7 + %g4] 0x15,	%i4
loop_343:
	fmovrdlz	%l5,	%f12,	%f10
	ld	[%l7 + 0x4C],	%f10
	wr	%g0,	0xeb,	%asi
	stba	%g7,	[%l7 + 0x62] %asi
	membar	#Sync
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i2
	alignaddr	%l3,	%i0,	%g5
	movvs	%icc,	%o6,	%i7
	be	%icc,	loop_344
	brlez	%l1,	loop_345
	srax	%o7,	%l6,	%g2
	stw	%o0,	[%l7 + 0x2C]
loop_344:
	sllx	%g4,	0x0B,	%o3
loop_345:
	ta	%xcc,	0x7
	alignaddr	%o2,	%i1,	%i3
	fornot2	%f10,	%f8,	%f18
	sra	%i5,	0x13,	%l2
	tle	%xcc,	0x5
	movvc	%xcc,	%g6,	%l4
	sllx	%i6,	%g1,	%o1
	movg	%icc,	%l0,	%o4
	wr	%g0,	0x22,	%asi
	stxa	%g3,	[%l7 + 0x70] %asi
	membar	#Sync
	bshuffle	%f28,	%f22,	%f8
	fsrc1	%f4,	%f14
	alignaddr	%o5,	%l5,	%i4
	fsrc2s	%f27,	%f11
	edge32n	%i2,	%l3,	%i0
	movrgez	%g7,	%g5,	%i7
	fmovrde	%o6,	%f28,	%f28
	addccc	%o7,	%l1,	%l6
	umulcc	%g2,	0x0880,	%o0
	fnot1	%f0,	%f24
	subccc	%o3,	0x1C1A,	%g4
	set	0x68, %o1
	ldswa	[%l7 + %o1] 0x88,	%o2
	umul	%i3,	%i1,	%i5
	movl	%icc,	%l2,	%g6
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x1C] %asi,	%f26
	tne	%xcc,	0x3
	movrne	%l4,	0x085,	%g1
	tpos	%xcc,	0x0
	alignaddrl	%o1,	%i6,	%o4
	set	0x60, %g2
	stxa	%l0,	[%l7 + %g2] 0x14
	smul	%g3,	%o5,	%l5
	edge8n	%i4,	%l3,	%i2
	sdivcc	%i0,	0x02E5,	%g7
	add	%i7,	0x0D0F,	%g5
	tcc	%xcc,	0x7
	orn	%o7,	%l1,	%o6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l6,	%o0
	tsubcc	%g2,	%g4,	%o3
	movcc	%xcc,	%i3,	%o2
	smulcc	%i1,	%i5,	%g6
	tvc	%icc,	0x1
	smulcc	%l4,	0x0D4E,	%l2
	srlx	%g1,	0x0A,	%i6
	movrne	%o4,	%o1,	%l0
	bneg,a	loop_346
	subcc	%g3,	%o5,	%i4
	tgu	%xcc,	0x4
	alignaddr	%l5,	%l3,	%i2
loop_346:
	fornot2	%f14,	%f8,	%f4
	taddcctv	%i0,	%i7,	%g5
	lduh	[%l7 + 0x3E],	%g7
	edge32	%o7,	%l1,	%o6
	movcc	%icc,	%l6,	%o0
	fbg	%fcc1,	loop_347
	fbn,a	%fcc1,	loop_348
	brz	%g4,	loop_349
	ldstub	[%l7 + 0x11],	%o3
loop_347:
	nop
	set	0x50, %i1
	lda	[%l7 + %i1] 0x14,	%f0
loop_348:
	stbar
loop_349:
	prefetch	[%l7 + 0x2C],	 0x2
	taddcctv	%g2,	0x0D72,	%i3
	popc	0x163C,	%i1
	tvs	%xcc,	0x2
	movcc	%icc,	%i5,	%g6
	bne,a,pt	%icc,	loop_350
	nop
	set	0x3A, %l0
	sth	%o2,	[%l7 + %l0]
	movle	%xcc,	%l4,	%l2
	movleu	%xcc,	%g1,	%o4
loop_350:
	alignaddrl	%i6,	%l0,	%g3
	movrne	%o1,	0x36A,	%o5
	edge32l	%l5,	%i4,	%i2
	srl	%l3,	0x0B,	%i7
	bne	%xcc,	loop_351
	fmovrdgz	%g5,	%f24,	%f18
	fmul8x16	%f1,	%f26,	%f24
	brlez	%g7,	loop_352
loop_351:
	bpos,a	%icc,	loop_353
	popc	0x119E,	%i0
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x20] %asi,	%l1
loop_352:
	sllx	%o7,	0x19,	%l6
loop_353:
	addccc	%o0,	0x04FA,	%g4
	umul	%o3,	%g2,	%i3
	alignaddr	%i1,	%o6,	%i5
	pdist	%f28,	%f26,	%f24
	fones	%f29
	edge16	%g6,	%l4,	%o2
	xor	%g1,	0x1614,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o4,	%l0,	%g3
	fmovdn	%xcc,	%f26,	%f4
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	sdivcc	%o5,	0x1389,	%l5
	for	%f20,	%f26,	%f8
	ldub	[%l7 + 0x1B],	%o1
	pdist	%f10,	%f18,	%f14
	ldsh	[%l7 + 0x5E],	%i2
	tsubcctv	%l3,	%i7,	%i4
	movleu	%icc,	%g5,	%i0
	faligndata	%f30,	%f12,	%f16
	fpsub16	%f4,	%f4,	%f20
	fbug,a	%fcc3,	loop_354
	fbge,a	%fcc1,	loop_355
	movvs	%icc,	%g7,	%l1
	tle	%icc,	0x2
loop_354:
	sth	%l6,	[%l7 + 0x7A]
loop_355:
	ld	[%l7 + 0x2C],	%f18
	xorcc	%o7,	0x07F7,	%o0
	subccc	%o3,	%g2,	%g4
	fsrc1s	%f20,	%f11
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x7A] %asi,	%i1
	fcmple16	%f28,	%f14,	%o6
	srlx	%i3,	%i5,	%l4
	andncc	%o2,	%g1,	%g6
	srl	%l2,	0x05,	%l0
	fxnors	%f5,	%f18,	%f22
	movg	%icc,	%o4,	%i6
	srax	%o5,	0x02,	%l5
	movre	%g3,	0x2DF,	%o1
	movgu	%icc,	%l3,	%i2
	nop
	setx loop_356, %l0, %l1
	jmpl %l1, %i7
	udivcc	%i4,	0x135B,	%i0
	set	0x48, %i6
	prefetcha	[%l7 + %i6] 0x0c,	 0x1
loop_356:
	ta	%xcc,	0x6
	tvs	%xcc,	0x5
	umulcc	%l1,	%g7,	%l6
	brgez	%o0,	loop_357
	edge8ln	%o7,	%o3,	%g4
	fone	%f0
	movrgez	%g2,	%o6,	%i3
loop_357:
	fbne	%fcc2,	loop_358
	umulcc	%i1,	0x0052,	%i5
	movcc	%icc,	%o2,	%g1
	tg	%icc,	0x7
loop_358:
	membar	0x6A
	ba	loop_359
	fmovdcs	%xcc,	%f21,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f24,	%f16,	%g6
loop_359:
	bge,pt	%icc,	loop_360
	umul	%l2,	0x100D,	%l4
	tneg	%xcc,	0x6
	lduh	[%l7 + 0x6A],	%o4
loop_360:
	ldsh	[%l7 + 0x7E],	%l0
	andncc	%o5,	%l5,	%g3
	edge32	%o1,	%l3,	%i6
	bshuffle	%f10,	%f12,	%f14
	fornot1s	%f13,	%f27,	%f20
	movrgez	%i7,	%i4,	%i2
	andncc	%i0,	%g5,	%g7
	fandnot1s	%f30,	%f29,	%f27
	sethi	0x0461,	%l6
	fmovdneg	%xcc,	%f9,	%f19
	subccc	%o0,	0x1EA8,	%o7
	ldub	[%l7 + 0x6D],	%l1
	wr	%g0,	0x0c,	%asi
	stwa	%g4,	[%l7 + 0x74] %asi
	edge16n	%o3,	%g2,	%i3
	movvc	%icc,	%i1,	%i5
	sllx	%o2,	0x1C,	%o6
	umulcc	%g1,	0x01AB,	%g6
	tcs	%icc,	0x5
	flush	%l7 + 0x3C
	tcc	%icc,	0x3
	xnorcc	%l2,	0x04AD,	%o4
	sdivx	%l0,	0x0D1F,	%o5
	fba	%fcc3,	loop_361
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l4,	%g3
	ta	%icc,	0x1
loop_361:
	edge8n	%l5,	%l3,	%i6
	tvs	%xcc,	0x5
	movvc	%xcc,	%o1,	%i7
	set	0x4C, %l4
	stwa	%i4,	[%l7 + %l4] 0xe2
	membar	#Sync
	lduw	[%l7 + 0x44],	%i2
	udivx	%g5,	0x13C3,	%i0
	fmul8x16au	%f17,	%f31,	%f8
	sllx	%g7,	%l6,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x20] %asi,	%l0
	fcmple32	%f28,	%f10,	%g4
	fandnot1	%f12,	%f0,	%f4
	sll	%o3,	0x07,	%g2
	movle	%xcc,	%o7,	%i1
	be,pt	%icc,	loop_362
	fxor	%f22,	%f4,	%f24
	tne	%icc,	0x1
	andn	%i3,	%o2,	%o6
loop_362:
	sir	0x000E
	sdivx	%i5,	0x0FF5,	%g1
	movrlez	%l2,	0x15A,	%g6
	movcc	%xcc,	%l0,	%o4
	movle	%xcc,	%o5,	%g3
	orncc	%l4,	0x0839,	%l5
	edge8n	%l3,	%o1,	%i6
	fmovde	%xcc,	%f3,	%f14
	stb	%i7,	[%l7 + 0x28]
	fbl,a	%fcc3,	loop_363
	array16	%i4,	%g5,	%i0
	alignaddr	%i2,	%l6,	%g7
	stbar
loop_363:
	nop
	set	0x32, %i4
	lduba	[%l7 + %i4] 0x19,	%o0
	fmovdg	%icc,	%f5,	%f3
	tvs	%xcc,	0x4
	brlez,a	%g4,	loop_364
	te	%icc,	0x0
	fzeros	%f29
	add	%l1,	0x13E3,	%o3
loop_364:
	fmovdleu	%icc,	%f23,	%f9
	sdivcc	%o7,	0x0D7B,	%g2
	addccc	%i3,	%o2,	%i1
	movg	%xcc,	%i5,	%o6
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x24] %asi,	%g1
	xor	%l2,	0x087B,	%g6
	movl	%xcc,	%l0,	%o4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%l4
	xnorcc	%o5,	%l5,	%l3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i6
	ldx	[%l7 + 0x10],	%i7
	fornot1	%f14,	%f8,	%f24
	fpadd16	%f12,	%f8,	%f4
	tsubcctv	%i4,	0x18A5,	%g5
	pdist	%f18,	%f6,	%f8
	edge16n	%i0,	%o1,	%i2
	edge8l	%l6,	%o0,	%g7
	sdivx	%g4,	0x1714,	%o3
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%l1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%o7
	fcmple32	%f16,	%f0,	%o2
	subcc	%i1,	%i3,	%o6
	fcmpne32	%f10,	%f6,	%g1
	be,a,pt	%xcc,	loop_365
	fzeros	%f11
	tn	%xcc,	0x6
	fpsub32	%f18,	%f26,	%f26
loop_365:
	sdivx	%i5,	0x11A1,	%g6
	fbl,a	%fcc1,	loop_366
	be,a	%icc,	loop_367
	fmovsvc	%icc,	%f17,	%f7
	ldub	[%l7 + 0x28],	%l0
loop_366:
	fbne,a	%fcc3,	loop_368
loop_367:
	tpos	%xcc,	0x5
	fornot2s	%f6,	%f29,	%f25
	orn	%o4,	%g3,	%l4
loop_368:
	fxor	%f0,	%f20,	%f6
	movvc	%xcc,	%o5,	%l5
	movvc	%xcc,	%l2,	%i6
	fbule,a	%fcc3,	loop_369
	mulx	%l3,	0x1F79,	%i4
	movneg	%xcc,	%i7,	%g5
	fmovsleu	%icc,	%f3,	%f20
loop_369:
	fcmple32	%f12,	%f26,	%o1
	taddcc	%i2,	%l6,	%o0
	fcmpeq32	%f2,	%f0,	%g7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%i0
	sir	0x02C0
	ldstub	[%l7 + 0x71],	%o3
	movre	%g2,	0x0D4,	%o7
	umulcc	%o2,	0x0848,	%i1
	movvc	%icc,	%i3,	%l1
	pdist	%f0,	%f10,	%f12
	mulx	%o6,	0x0F89,	%i5
	te	%icc,	0x5
	stx	%g1,	[%l7 + 0x08]
	xor	%l0,	%o4,	%g3
	fbule	%fcc2,	loop_370
	movrlz	%g6,	%l4,	%o5
	movne	%xcc,	%l2,	%l5
	orn	%l3,	%i4,	%i7
loop_370:
	sll	%g5,	0x1C,	%i6
	fcmpne32	%f26,	%f16,	%o1
	fbuge	%fcc1,	loop_371
	fsrc2	%f14,	%f28
	ldd	[%l7 + 0x70],	%f14
	movgu	%xcc,	%l6,	%o0
loop_371:
	udivx	%i2,	0x1648,	%g7
	alignaddr	%i0,	%o3,	%g2
	sir	0x0140
	fbg	%fcc0,	loop_372
	fnot2s	%f24,	%f4
	fmovsge	%xcc,	%f16,	%f9
	stb	%o7,	[%l7 + 0x33]
loop_372:
	fandnot1	%f2,	%f24,	%f24
	fbug,a	%fcc3,	loop_373
	edge32n	%g4,	%o2,	%i1
	prefetch	[%l7 + 0x50],	 0x1
	fbl	%fcc3,	loop_374
loop_373:
	smul	%l1,	0x04B9,	%o6
	movleu	%xcc,	%i5,	%i3
	fmovdpos	%icc,	%f20,	%f10
loop_374:
	alignaddr	%g1,	%l0,	%g3
	edge32n	%o4,	%l4,	%o5
	for	%f4,	%f10,	%f10
	brgez	%l2,	loop_375
	orncc	%g6,	0x0E43,	%l5
	addccc	%l3,	0x1443,	%i7
	movrne	%g5,	%i4,	%o1
loop_375:
	tleu	%icc,	0x1
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x67] %asi,	%l6
	sra	%o0,	0x13,	%i2
	udiv	%i6,	0x0E41,	%i0
	movrlz	%o3,	0x320,	%g2
	bpos,a	loop_376
	bvc,a	loop_377
	tvs	%xcc,	0x3
	edge32l	%g7,	%o7,	%o2
loop_376:
	movg	%icc,	%g4,	%i1
loop_377:
	edge16ln	%l1,	%o6,	%i5
	orcc	%i3,	%g1,	%l0
	movrlz	%o4,	0x364,	%l4
	orn	%g3,	0x1F3A,	%o5
	taddcc	%g6,	0x1013,	%l2
	set	0x40, %o0
	swapa	[%l7 + %o0] 0x04,	%l3
	fble	%fcc3,	loop_378
	movrgez	%l5,	%g5,	%i7
	tl	%xcc,	0x5
	brnz	%i4,	loop_379
loop_378:
	fble,a	%fcc1,	loop_380
	tleu	%xcc,	0x0
	movleu	%xcc,	%o1,	%l6
loop_379:
	fcmple32	%f18,	%f24,	%i2
loop_380:
	fmovdgu	%xcc,	%f8,	%f29
	or	%i6,	%o0,	%o3
	brz,a	%i0,	loop_381
	edge16	%g2,	%g7,	%o2
	subccc	%o7,	%g4,	%i1
	sir	0x1C0C
loop_381:
	ldub	[%l7 + 0x67],	%l1
	fmovrslez	%i5,	%f19,	%f20
	alignaddrl	%i3,	%o6,	%l0
	fpack32	%f6,	%f2,	%f30
	movl	%icc,	%g1,	%l4
	edge16l	%o4,	%o5,	%g3
	tsubcctv	%l2,	0x07A2,	%l3
	movvs	%xcc,	%g6,	%g5
	smulcc	%i7,	0x1717,	%l5
	addccc	%o1,	0x18FF,	%l6
	fornot1	%f22,	%f8,	%f0
	xnorcc	%i4,	%i6,	%o0
	xorcc	%i2,	0x0C45,	%i0
	fnand	%f12,	%f30,	%f16
	subcc	%g2,	0x0D54,	%o3
	smul	%o2,	%g7,	%o7
	bgu,a	%xcc,	loop_382
	bneg	%icc,	loop_383
	tvs	%xcc,	0x6
	fnot1	%f20,	%f8
loop_382:
	move	%xcc,	%i1,	%l1
loop_383:
	tge	%icc,	0x6
	edge32	%i5,	%i3,	%o6
	tvs	%icc,	0x4
	set	0x5A, %l1
	stha	%l0,	[%l7 + %l1] 0x88
	srlx	%g4,	0x13,	%g1
	smul	%o4,	0x1FE6,	%l4
	edge16n	%o5,	%l2,	%g3
	edge8l	%g6,	%g5,	%i7
	movrlez	%l3,	%l5,	%l6
	xnor	%o1,	0x13BC,	%i6
	and	%i4,	%i2,	%i0
	membar	0x01
	edge8ln	%g2,	%o3,	%o2
	tleu	%xcc,	0x6
	fmovrdgez	%g7,	%f6,	%f18
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x24] %asi,	%f18
	fmovda	%xcc,	%f28,	%f7
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x42] %asi,	%o0
	std	%i0,	[%l7 + 0x48]
	movcc	%xcc,	%o7,	%l1
	fmovdgu	%xcc,	%f13,	%f0
	sethi	0x01D6,	%i5
	set	0x54, %l6
	lda	[%l7 + %l6] 0x19,	%f22
	fmovrslz	%o6,	%f30,	%f7
	fmovscs	%xcc,	%f11,	%f22
	tleu	%xcc,	0x6
	ld	[%l7 + 0x60],	%f23
	fmovrde	%i3,	%f8,	%f0
	movpos	%icc,	%l0,	%g4
	movrne	%o4,	%g1,	%o5
	movn	%icc,	%l2,	%g3
	fsrc1s	%f7,	%f17
	stbar
	ldsh	[%l7 + 0x38],	%l4
	tsubcctv	%g6,	0x1E3A,	%g5
	umul	%i7,	0x1C16,	%l3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l6,	%l5
	mulx	%i6,	%i4,	%i2
	ldstub	[%l7 + 0x2B],	%i0
	movneg	%icc,	%g2,	%o1
	sdivx	%o2,	0x01B0,	%g7
	alignaddr	%o3,	%i1,	%o7
	or	%o0,	%i5,	%l1
	bn,a	loop_384
	fmovsvs	%icc,	%f13,	%f27
	lduw	[%l7 + 0x48],	%o6
	fmovdcs	%xcc,	%f17,	%f0
loop_384:
	udiv	%i3,	0x059E,	%l0
	lduh	[%l7 + 0x20],	%o4
	movrne	%g4,	%o5,	%l2
	fmovsl	%xcc,	%f14,	%f5
	tsubcc	%g1,	%g3,	%l4
	membar	0x4A
	ldx	[%l7 + 0x68],	%g5
	tg	%xcc,	0x1
	brnz,a	%g6,	loop_385
	fbug	%fcc0,	loop_386
	fandnot1	%f26,	%f10,	%f26
	edge16n	%l3,	%l6,	%l5
loop_385:
	nop
	set	0x64, %o4
	stwa	%i7,	[%l7 + %o4] 0x22
	membar	#Sync
loop_386:
	sdivx	%i6,	0x0FF0,	%i4
	ldsh	[%l7 + 0x3C],	%i0
	fmovsne	%xcc,	%f20,	%f5
	sllx	%i2,	0x14,	%g2
	orcc	%o1,	0x15CD,	%g7
	movvs	%xcc,	%o2,	%i1
	movrlez	%o3,	%o7,	%i5
	movgu	%icc,	%l1,	%o0
	fbo,a	%fcc3,	loop_387
	fmovrdne	%i3,	%f20,	%f12
	xorcc	%o6,	%l0,	%g4
	smul	%o5,	0x13E5,	%o4
loop_387:
	subccc	%l2,	0x0E3E,	%g3
	edge16ln	%l4,	%g1,	%g6
	movrlz	%l3,	0x1C6,	%g5
	xor	%l6,	%l5,	%i6
	fbn,a	%fcc0,	loop_388
	tgu	%xcc,	0x4
	srax	%i7,	%i4,	%i2
	edge32n	%i0,	%o1,	%g7
loop_388:
	fmovsneg	%icc,	%f31,	%f24
	mulscc	%g2,	%o2,	%o3
	wr	%g0,	0x2a,	%asi
	stxa	%o7,	[%l7 + 0x38] %asi
	membar	#Sync
	set	0x52, %g7
	ldsha	[%l7 + %g7] 0x81,	%i1
	sra	%i5,	0x06,	%l1
	movre	%i3,	0x0C4,	%o6
	movne	%icc,	%l0,	%g4
	fbue	%fcc3,	loop_389
	fmovdne	%icc,	%f0,	%f19
	fmovscs	%xcc,	%f0,	%f19
	movneg	%xcc,	%o0,	%o4
loop_389:
	fmovd	%f0,	%f4
	stb	%l2,	[%l7 + 0x36]
	bcc,pn	%xcc,	loop_390
	edge8n	%g3,	%o5,	%g1
	fornot2s	%f25,	%f22,	%f15
	fnot1	%f12,	%f4
loop_390:
	edge16ln	%g6,	%l3,	%g5
	nop
	setx loop_391, %l0, %l1
	jmpl %l1, %l6
	fmovrsgz	%l5,	%f8,	%f17
	set	0x24, %l2
	stwa	%i6,	[%l7 + %l2] 0x18
loop_391:
	ldd	[%l7 + 0x60],	%f12
	set	0x24, %l3
	lduwa	[%l7 + %l3] 0x81,	%i7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%i0
	fcmple16	%f26,	%f30,	%o1
	fbug,a	%fcc2,	loop_392
	sra	%l4,	0x1F,	%g7
	mulscc	%o2,	0x0808,	%g2
	movvc	%xcc,	%o7,	%i1
loop_392:
	fcmpgt32	%f30,	%f4,	%o3
	movrgz	%l1,	0x0B7,	%i3
	movvc	%xcc,	%i5,	%l0
	edge16	%g4,	%o0,	%o4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o6
	popc	%g3,	%l2
	movrlez	%o5,	0x195,	%g1
	bvs	%icc,	loop_393
	bge,a	%xcc,	loop_394
	umul	%l3,	%g5,	%l6
	fbne,a	%fcc1,	loop_395
loop_393:
	srl	%g6,	%i6,	%l5
loop_394:
	nop
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x19,	%i6
loop_395:
	sub	%i4,	%i0,	%o1
	tgu	%icc,	0x0
	move	%icc,	%i2,	%g7
	fxors	%f18,	%f30,	%f17
	fmuld8ulx16	%f5,	%f29,	%f30
	addcc	%o2,	%g2,	%l4
	fone	%f20
	movle	%icc,	%i1,	%o3
	for	%f12,	%f8,	%f22
	fmovrslez	%l1,	%f18,	%f4
	fbug	%fcc0,	loop_396
	std	%f20,	[%l7 + 0x78]
	brz	%o7,	loop_397
	brgz,a	%i5,	loop_398
loop_396:
	mulx	%l0,	0x10C6,	%i3
	tvs	%xcc,	0x2
loop_397:
	stx	%o0,	[%l7 + 0x20]
loop_398:
	fmovde	%xcc,	%f21,	%f7
	movg	%icc,	%o4,	%o6
	movrlz	%g4,	%l2,	%g3
	movre	%g1,	%o5,	%g5
	fbge,a	%fcc3,	loop_399
	sllx	%l6,	%l3,	%i6
	sll	%g6,	%i7,	%l5
	edge8	%i0,	%i4,	%i2
loop_399:
	nop
	setx	loop_400,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdpos	%xcc,	%f8,	%f9
	fmuld8ulx16	%f16,	%f11,	%f6
	nop
	setx	loop_401,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_400:
	srl	%g7,	0x17,	%o1
	fcmpes	%fcc2,	%f12,	%f12
	movl	%xcc,	%o2,	%g2
loop_401:
	nop
	set	0x18, %i7
	prefetcha	[%l7 + %i7] 0x80,	 0x1
	movn	%xcc,	%i1,	%o3
	smulcc	%o7,	0x10F5,	%l1
	movrgez	%l0,	%i3,	%i5
	and	%o0,	0x02AD,	%o6
	fble	%fcc1,	loop_402
	movge	%icc,	%o4,	%l2
	edge16n	%g4,	%g3,	%o5
	orcc	%g5,	0x15AE,	%g1
loop_402:
	movvs	%xcc,	%l3,	%i6
	fmovscs	%icc,	%f24,	%f31
	fnot2s	%f9,	%f9
	tvc	%icc,	0x3
	sethi	0x07F8,	%l6
	or	%g6,	%l5,	%i0
	fabsd	%f10,	%f14
	srl	%i7,	%i2,	%g7
	movrgez	%i4,	0x35E,	%o1
	alignaddrl	%g2,	%l4,	%o2
	tne	%icc,	0x2
	sir	0x143B
	tg	%xcc,	0x0
	movcs	%xcc,	%i1,	%o3
	fblg	%fcc0,	loop_403
	fones	%f20
	brz	%l1,	loop_404
	movne	%xcc,	%o7,	%i3
loop_403:
	ldub	[%l7 + 0x32],	%i5
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
loop_404:
	array8	%o0,	%o4,	%l2
	edge32ln	%g4,	%g3,	%o5
	ldd	[%l7 + 0x28],	%f16
	ta	%icc,	0x5
	brlez	%o6,	loop_405
	fxors	%f16,	%f1,	%f19
	taddcctv	%g1,	%g5,	%l3
	wr	%g0,	0x2b,	%asi
	stha	%i6,	[%l7 + 0x18] %asi
	membar	#Sync
loop_405:
	movvs	%icc,	%l6,	%l5
	fmovsgu	%icc,	%f26,	%f13
	ta	%xcc,	0x1
	flush	%l7 + 0x68
	sub	%i0,	0x14E5,	%g6
	sra	%i7,	0x12,	%g7
	edge32l	%i2,	%i4,	%g2
	fnand	%f12,	%f30,	%f14
	mulx	%o1,	0x0677,	%o2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	or	%i1,	0x16A6,	%l4
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x7B] %asi,	%l1
	array8	%o7,	%i3,	%o3
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i5
	faligndata	%f12,	%f26,	%f22
	bneg,pn	%icc,	loop_406
	tgu	%icc,	0x3
	tgu	%icc,	0x7
	udivx	%o0,	0x0980,	%l0
loop_406:
	orn	%o4,	0x0F7F,	%g4
	umulcc	%l2,	0x0795,	%o5
	pdist	%f14,	%f8,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1E14
	tl	%xcc,	0x4
	tleu	%icc,	0x2
	movg	%xcc,	%o6,	%g1
	orncc	%g5,	%g3,	%i6
	umul	%l6,	0x0348,	%l3
	sir	0x147B
	tcs	%xcc,	0x4
	or	%l5,	0x08CD,	%i0
	movrlz	%i7,	0x136,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g6,	%i2,	%i4
	stbar
	subccc	%g2,	%o1,	%i1
	fmovda	%xcc,	%f29,	%f17
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x318] %asi,	%o2 ripped by fixASI40.pl ripped by fixASI40.pl
	tvs	%icc,	0x0
	subccc	%l4,	%l1,	%o7
	movle	%icc,	%o3,	%i5
	fble	%fcc0,	loop_407
	movre	%i3,	0x34E,	%o0
	fmovdleu	%icc,	%f12,	%f25
	tneg	%icc,	0x6
loop_407:
	tpos	%xcc,	0x7
	sllx	%l0,	%o4,	%l2
	umul	%o5,	%o6,	%g1
	movle	%xcc,	%g4,	%g5
	orn	%i6,	0x1042,	%g3
	udivx	%l6,	0x06D4,	%l5
	fnot1s	%f26,	%f23
	edge32n	%i0,	%l3,	%i7
	bg,a,pn	%xcc,	loop_408
	fmovrdlz	%g7,	%f22,	%f2
	sra	%g6,	0x00,	%i4
	fbl	%fcc1,	loop_409
loop_408:
	fabsd	%f18,	%f6
	subccc	%g2,	%i2,	%i1
	add	%o2,	0x0E37,	%o1
loop_409:
	nop
	setx	loop_410,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%icc,	%l4,	%o7
	array16	%o3,	%l1,	%i3
	ldsb	[%l7 + 0x2A],	%o0
loop_410:
	edge16l	%i5,	%o4,	%l2
	fpackfix	%f18,	%f30
	tsubcctv	%l0,	0x00C5,	%o5
	nop
	set	0x30, %o3
	ldsw	[%l7 + %o3],	%g1
	flush	%l7 + 0x4C
	std	%g4,	[%l7 + 0x60]
	std	%g4,	[%l7 + 0x30]
	orncc	%o6,	%g3,	%i6
	movneg	%icc,	%l5,	%l6
	srlx	%l3,	0x01,	%i7
	subccc	%g7,	%i0,	%g6
	tl	%xcc,	0x3
	bneg	%icc,	loop_411
	brlz	%g2,	loop_412
	movpos	%xcc,	%i4,	%i2
	brnz	%o2,	loop_413
loop_411:
	fbne,a	%fcc0,	loop_414
loop_412:
	fbe	%fcc1,	loop_415
	fcmpgt16	%f6,	%f22,	%o1
loop_413:
	ldstub	[%l7 + 0x16],	%l4
loop_414:
	ldd	[%l7 + 0x58],	%f28
loop_415:
	edge32l	%o7,	%i1,	%l1
	fmovsa	%xcc,	%f28,	%f4
	tleu	%xcc,	0x2
	movrgz	%o3,	0x2EC,	%o0
	set	0x5E, %g3
	stha	%i3,	[%l7 + %g3] 0x10
	movgu	%xcc,	%o4,	%l2
	ldd	[%l7 + 0x60],	%f16
	fbul	%fcc3,	loop_416
	brnz	%l0,	loop_417
	mulx	%i5,	%g1,	%o5
	edge8l	%g5,	%o6,	%g4
loop_416:
	array32	%i6,	%l5,	%g3
loop_417:
	fbn	%fcc1,	loop_418
	tn	%icc,	0x3
	tcs	%icc,	0x5
	wr	%g0,	0x89,	%asi
	stba	%l3,	[%l7 + 0x6B] %asi
loop_418:
	be,pn	%icc,	loop_419
	alignaddr	%l6,	%g7,	%i7
	sethi	0x1CA6,	%i0
	bl,pt	%icc,	loop_420
loop_419:
	tcs	%icc,	0x0
	fba	%fcc2,	loop_421
	taddcc	%g6,	%i4,	%i2
loop_420:
	fmovspos	%icc,	%f16,	%f12
	sdivx	%g2,	0x1177,	%o2
loop_421:
	fxnors	%f25,	%f19,	%f5
	srl	%o1,	0x1A,	%l4
	edge32n	%o7,	%l1,	%i1
	fmovsneg	%icc,	%f31,	%f22
	nop
	setx	loop_422,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ld	[%l7 + 0x74],	%f26
	movrne	%o0,	0x306,	%o3
	tsubcc	%o4,	0x1120,	%i3
loop_422:
	fmovrslz	%l0,	%f14,	%f23
	bn,a	%icc,	loop_423
	tn	%xcc,	0x0
	orcc	%l2,	%g1,	%o5
	ldstub	[%l7 + 0x10],	%i5
loop_423:
	edge32ln	%g5,	%o6,	%i6
	tle	%icc,	0x0
	movleu	%icc,	%l5,	%g3
	nop
	set	0x24, %i2
	prefetch	[%l7 + %i2],	 0x2
	move	%icc,	%l3,	%l6
	smul	%g4,	0x13B5,	%g7
	fornot2s	%f14,	%f27,	%f7
	fcmpne16	%f24,	%f8,	%i0
	edge8ln	%g6,	%i7,	%i2
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x6C] %asi
	movn	%xcc,	%i4,	%o2
	ble	%icc,	loop_424
	nop
	setx	loop_425,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%o1,	%l4,	%o7
	fmovdge	%xcc,	%f23,	%f18
loop_424:
	brz,a	%g2,	loop_426
loop_425:
	prefetch	[%l7 + 0x54],	 0x3
	membar	0x63
	fbu	%fcc0,	loop_427
loop_426:
	brz	%l1,	loop_428
	fbuge,a	%fcc2,	loop_429
	umulcc	%o0,	%o3,	%i1
loop_427:
	fmovsleu	%xcc,	%f5,	%f12
loop_428:
	edge32n	%o4,	%l0,	%i3
loop_429:
	orcc	%g1,	%o5,	%l2
	udivx	%i5,	0x04F9,	%g5
	ldstub	[%l7 + 0x3A],	%o6
	fcmpne16	%f30,	%f24,	%l5
	sethi	0x1B1C,	%g3
	brz,a	%l3,	loop_430
	ba,a	%xcc,	loop_431
	ld	[%l7 + 0x60],	%f29
	subc	%i6,	%l6,	%g4
loop_430:
	movrlez	%g7,	0x05E,	%g6
loop_431:
	mova	%icc,	%i0,	%i2
	xorcc	%i7,	0x0336,	%o2
	edge8l	%o1,	%i4,	%o7
	fmovscs	%icc,	%f22,	%f14
	fmovsg	%xcc,	%f14,	%f10
	fpmerge	%f28,	%f16,	%f10
	fmovspos	%xcc,	%f17,	%f25
	movcs	%xcc,	%g2,	%l1
	andncc	%l4,	%o3,	%i1
	fcmpne16	%f2,	%f24,	%o0
	fpmerge	%f17,	%f15,	%f30
	fxnor	%f20,	%f26,	%f28
	bvs,pn	%icc,	loop_432
	tcc	%xcc,	0x7
	membar	0x34
	tleu	%icc,	0x7
loop_432:
	subccc	%o4,	0x0E4D,	%i3
	addcc	%g1,	%o5,	%l2
	udivcc	%l0,	0x0A4F,	%g5
	brnz,a	%i5,	loop_433
	movcs	%icc,	%l5,	%o6
	fexpand	%f27,	%f26
	tsubcc	%g3,	%i6,	%l3
loop_433:
	ldub	[%l7 + 0x46],	%l6
	taddcctv	%g7,	%g6,	%g4
	fbl	%fcc1,	loop_434
	alignaddr	%i2,	%i7,	%i0
	fcmpne32	%f0,	%f18,	%o2
	ldsw	[%l7 + 0x08],	%o1
loop_434:
	bvs,pn	%icc,	loop_435
	ldsb	[%l7 + 0x4A],	%o7
	fbul,a	%fcc2,	loop_436
	mova	%icc,	%g2,	%l1
loop_435:
	array16	%i4,	%o3,	%i1
	tcc	%xcc,	0x4
loop_436:
	orcc	%l4,	0x0F95,	%o0
	swap	[%l7 + 0x68],	%i3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x60] %asi,	%g1
	fbl,a	%fcc2,	loop_437
	movne	%icc,	%o4,	%o5
	fcmpeq16	%f26,	%f28,	%l2
	fmovrsgez	%g5,	%f3,	%f25
loop_437:
	fbo,a	%fcc2,	loop_438
	tcc	%icc,	0x2
	sdivx	%l0,	0x01C6,	%l5
	fpackfix	%f22,	%f31
loop_438:
	addccc	%o6,	%g3,	%i6
	addccc	%i5,	0x0302,	%l6
	fpadd16	%f6,	%f22,	%f24
	fbge,a	%fcc3,	loop_439
	xor	%l3,	0x0232,	%g6
	fmovsa	%xcc,	%f19,	%f19
	sir	0x0A06
loop_439:
	xor	%g7,	%i2,	%i7
	orncc	%g4,	0x079B,	%i0
	mulscc	%o2,	%o1,	%g2
	tvc	%xcc,	0x3
	or	%l1,	%o7,	%o3
	sir	0x070D
	nop
	setx loop_440, %l0, %l1
	jmpl %l1, %i1
	mulx	%l4,	0x0EB9,	%o0
	orncc	%i3,	0x1305,	%g1
	ldstub	[%l7 + 0x18],	%o4
loop_440:
	movge	%icc,	%o5,	%l2
	ldsb	[%l7 + 0x25],	%g5
	tneg	%xcc,	0x0
	array32	%i4,	%l5,	%l0
	movg	%icc,	%o6,	%g3
	membar	0x5C
	call	loop_441
	tgu	%icc,	0x5
	tvs	%icc,	0x6
	call	loop_442
loop_441:
	edge32ln	%i5,	%l6,	%l3
	fmovrse	%i6,	%f7,	%f27
	fmovsleu	%icc,	%f23,	%f5
loop_442:
	brgz	%g6,	loop_443
	tg	%icc,	0x0
	fmovscc	%icc,	%f2,	%f22
	fpsub32	%f28,	%f20,	%f30
loop_443:
	nop
	set	0x3C, %g5
	sta	%f4,	[%l7 + %g5] 0x88
	xnorcc	%g7,	%i2,	%g4
	set	0x18, %g6
	stha	%i7,	[%l7 + %g6] 0x27
	membar	#Sync
	udivx	%o2,	0x1347,	%i0
	edge16ln	%o1,	%g2,	%o7
	fsrc1s	%f25,	%f0
	fmovdg	%xcc,	%f17,	%f2
	movg	%icc,	%l1,	%i1
	fmovrdgz	%l4,	%f10,	%f28
	fbg,a	%fcc0,	loop_444
	movrne	%o3,	%o0,	%g1
	te	%icc,	0x0
	nop
	set	0x68, %o2
	stx	%o4,	[%l7 + %o2]
loop_444:
	fmovrslz	%o5,	%f14,	%f21
	bgu	%xcc,	loop_445
	bl,a	loop_446
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l2,	0x1CBF,	%g5
loop_445:
	edge8l	%i4,	%l5,	%l0
loop_446:
	fsrc1	%f14,	%f24
	taddcc	%o6,	0x17FB,	%i3
	fcmpne32	%f20,	%f2,	%i5
	ldx	[%l7 + 0x50],	%g3
	subcc	%l3,	0x1B77,	%i6
	brgez	%g6,	loop_447
	bneg,a,pt	%icc,	loop_448
	array32	%l6,	%g7,	%i2
	xorcc	%i7,	%o2,	%g4
loop_447:
	subc	%o1,	0x1C47,	%g2
loop_448:
	movg	%icc,	%o7,	%l1
	fmovdvs	%icc,	%f19,	%f30
	edge32ln	%i1,	%l4,	%o3
	bvs,a	loop_449
	brnz,a	%i0,	loop_450
	addc	%g1,	0x1C34,	%o4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o5,	%o0
loop_449:
	sll	%g5,	%i4,	%l5
loop_450:
	fcmpes	%fcc2,	%f12,	%f16
	ld	[%l7 + 0x2C],	%f6
	and	%l0,	%o6,	%l2
	brnz,a	%i3,	loop_451
	edge16ln	%g3,	%i5,	%i6
	edge8	%g6,	%l6,	%l3
	for	%f18,	%f24,	%f20
loop_451:
	movrgz	%i2,	%g7,	%o2
	tgu	%xcc,	0x1
	andncc	%g4,	%o1,	%g2
	movrne	%i7,	%o7,	%i1
	prefetch	[%l7 + 0x3C],	 0x1
	fbne,a	%fcc3,	loop_452
	tl	%icc,	0x6
	edge16n	%l1,	%o3,	%i0
	tcs	%icc,	0x5
loop_452:
	movg	%xcc,	%g1,	%o4
	fmovrslez	%o5,	%f8,	%f25
	fba,a	%fcc0,	loop_453
	tsubcc	%o0,	0x0852,	%l4
	fmovrslez	%i4,	%f17,	%f31
	edge32ln	%g5,	%l5,	%o6
loop_453:
	membar	0x76
	fandnot2	%f10,	%f30,	%f2
	addccc	%l2,	%i3,	%l0
	tcs	%xcc,	0x4
	membar	0x17
	movrlez	%g3,	%i5,	%i6
	umul	%l6,	%g6,	%i2
	tgu	%icc,	0x2
	call	loop_454
	movrlz	%g7,	%o2,	%l3
	smulcc	%g4,	%g2,	%i7
	xor	%o7,	0x1AFD,	%i1
loop_454:
	sdivcc	%o1,	0x04BE,	%l1
	fexpand	%f12,	%f8
	udivcc	%o3,	0x0A76,	%g1
	orn	%i0,	0x19CC,	%o5
	sub	%o4,	%l4,	%o0
	xorcc	%g5,	%l5,	%i4
	movne	%icc,	%o6,	%l2
	fmovd	%f6,	%f0
	orn	%l0,	%g3,	%i3
	fnot2s	%f29,	%f19
	fnot2	%f14,	%f0
	edge8l	%i6,	%i5,	%g6
	alignaddrl	%l6,	%g7,	%i2
	bl,a,pn	%xcc,	loop_455
	tle	%icc,	0x7
	fmovrsne	%l3,	%f5,	%f23
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o2
loop_455:
	sra	%g4,	%i7,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%g2,	%i1
	srax	%l1,	%o3,	%g1
	smulcc	%o1,	%o5,	%i0
	edge16n	%l4,	%o4,	%o0
	edge32l	%g5,	%l5,	%o6
	and	%l2,	%i4,	%l0
	fone	%f2
	fmovsgu	%icc,	%f13,	%f12
	umulcc	%g3,	0x1DC0,	%i6
	sir	0x16C7
	edge32	%i5,	%g6,	%i3
	brgez,a	%g7,	loop_456
	edge16	%l6,	%l3,	%o2
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x16
	membar	#Sync
loop_456:
	nop
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x16
	membar	#Sync
	set	0x6F, %g1
	lduba	[%l7 + %g1] 0x11,	%g4
	sir	0x050D
	tsubcctv	%i7,	0x0C52,	%i2
	tvs	%icc,	0x0
	tle	%icc,	0x2
	fmovda	%icc,	%f23,	%f11
	umul	%g2,	0x0E6E,	%i1
	array16	%l1,	%o7,	%o3
	addc	%o1,	0x10C2,	%o5
	faligndata	%f6,	%f24,	%f16
	ldx	[%l7 + 0x70],	%g1
	tsubcctv	%l4,	0x0FD0,	%o4
	orcc	%o0,	%i0,	%g5
	fxor	%f2,	%f18,	%f10
	nop
	setx	loop_457,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fxnors	%f4,	%f9,	%f1
	fornot1s	%f30,	%f9,	%f24
	fcmpne16	%f14,	%f28,	%l5
loop_457:
	taddcctv	%o6,	0x1A37,	%i4
	ldstub	[%l7 + 0x19],	%l0
	fpsub32	%f12,	%f28,	%f20
	tgu	%xcc,	0x6
	movrlz	%g3,	%l2,	%i5
	sdivx	%i6,	0x0257,	%i3
	stx	%g7,	[%l7 + 0x18]
	movge	%icc,	%l6,	%l3
	edge16ln	%o2,	%g6,	%i7
	movle	%xcc,	%i2,	%g2
	fandnot1	%f14,	%f20,	%f0
	brlz,a	%g4,	loop_458
	addc	%l1,	0x1CF2,	%i1
	add	%o7,	0x0A38,	%o1
	fmovsge	%xcc,	%f21,	%f15
loop_458:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%o3
	edge8l	%g1,	%o5,	%l4
	umul	%o4,	%o0,	%i0
	fpack16	%f30,	%f26
	xnorcc	%l5,	%g5,	%o6
	umul	%i4,	%l0,	%l2
	tleu	%xcc,	0x7
	movrgz	%g3,	0x09B,	%i6
	movvs	%xcc,	%i5,	%g7
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x04,	%f0
	fornot1	%f6,	%f8,	%f18
	bne,a	loop_459
	addc	%l6,	%l3,	%o2
	tg	%xcc,	0x2
	umulcc	%g6,	0x1DDA,	%i7
loop_459:
	srlx	%i2,	%g2,	%g4
	ldx	[%l7 + 0x38],	%l1
	fornot1	%f6,	%f18,	%f6
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x64] %asi,	%i3
	xnor	%o7,	0x11EB,	%i1
	xnorcc	%o3,	%o1,	%o5
	sdivcc	%g1,	0x030E,	%l4
	movre	%o0,	%o4,	%i0
	and	%g5,	%l5,	%i4
	mova	%xcc,	%o6,	%l2
	array32	%g3,	%i6,	%l0
	stw	%g7,	[%l7 + 0x40]
	tneg	%icc,	0x2
	movcc	%xcc,	%l6,	%i5
	fmovscs	%icc,	%f18,	%f13
	array8	%l3,	%o2,	%g6
	stx	%i7,	[%l7 + 0x08]
	ldsw	[%l7 + 0x54],	%i2
	lduw	[%l7 + 0x1C],	%g2
	set	0x08, %o7
	lduwa	[%l7 + %o7] 0x11,	%l1
	fands	%f10,	%f10,	%f16
	mova	%icc,	%i3,	%g4
	mulx	%i1,	%o7,	%o1
	fmovsle	%xcc,	%f18,	%f14
	bl	loop_460
	fbe,a	%fcc0,	loop_461
	movge	%xcc,	%o5,	%o3
	sth	%g1,	[%l7 + 0x4C]
loop_460:
	fmovdgu	%xcc,	%f26,	%f1
loop_461:
	std	%f30,	[%l7 + 0x08]
	tneg	%icc,	0x3
	te	%xcc,	0x0
	fmovrse	%l4,	%f12,	%f12
	fpsub32s	%f8,	%f8,	%f20
	fpadd16	%f12,	%f20,	%f26
	subc	%o4,	0x0A65,	%i0
	call	loop_462
	andncc	%g5,	%o0,	%i4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x3C] %asi,	%f0
loop_462:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x2A] %asi,	%l5
	fbug,a	%fcc3,	loop_463
	array16	%o6,	%g3,	%l2
	edge32l	%l0,	%g7,	%i6
	fbge	%fcc1,	loop_464
loop_463:
	brz	%i5,	loop_465
	faligndata	%f8,	%f6,	%f0
	umul	%l3,	%o2,	%l6
loop_464:
	bge,a	%icc,	loop_466
loop_465:
	tg	%xcc,	0x3
	orn	%i7,	0x0DC8,	%g6
	edge8l	%g2,	%i2,	%i3
loop_466:
	edge8n	%g4,	%i1,	%o7
	set	0x38, %o5
	ldswa	[%l7 + %o5] 0x10,	%l1
	brlz,a	%o1,	loop_467
	smul	%o5,	%o3,	%g1
	alignaddr	%l4,	%i0,	%g5
	edge32n	%o4,	%o0,	%l5
loop_467:
	ldd	[%l7 + 0x10],	%f18
	be,a	loop_468
	mulscc	%i4,	0x1A10,	%o6
	udivx	%l2,	0x0E19,	%g3
	ta	%icc,	0x7
loop_468:
	movl	%xcc,	%l0,	%i6
	addccc	%i5,	0x1982,	%l3
	srax	%g7,	0x18,	%o2
	fpsub16	%f4,	%f10,	%f4
	edge16n	%l6,	%g6,	%i7
	fpsub32s	%f7,	%f30,	%f11
	srl	%i2,	%i3,	%g2
	movleu	%icc,	%i1,	%g4
	movcs	%icc,	%l1,	%o1
	fcmpeq16	%f4,	%f24,	%o7
	array16	%o3,	%g1,	%o5
	tvc	%icc,	0x7
	fmovd	%f20,	%f4
	tpos	%icc,	0x0
	nop
	setx loop_469, %l0, %l1
	jmpl %l1, %i0
	tcc	%icc,	0x3
	fbul	%fcc0,	loop_470
	subccc	%g5,	%l4,	%o4
loop_469:
	ldx	[%l7 + 0x08],	%o0
	fbl	%fcc3,	loop_471
loop_470:
	srl	%i4,	%l5,	%o6
	movl	%icc,	%g3,	%l2
	fcmpgt16	%f6,	%f30,	%l0
loop_471:
	fands	%f20,	%f0,	%f9
	fmovrsgez	%i5,	%f10,	%f13
	and	%l3,	%i6,	%o2
	xorcc	%g7,	%g6,	%l6
	fmovdg	%xcc,	%f19,	%f10
	tle	%xcc,	0x7
	stb	%i7,	[%l7 + 0x41]
	movn	%xcc,	%i3,	%g2
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge32	%i2,	%g4,	%i1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%l1
	taddcctv	%o7,	0x1390,	%o3
	prefetch	[%l7 + 0x18],	 0x0
	movre	%g1,	%o1,	%i0
	fnegs	%f22,	%f4
	sth	%o5,	[%l7 + 0x5C]
	fmovrse	%l4,	%f15,	%f3
	fnot2s	%f24,	%f24
	fble,a	%fcc1,	loop_472
	alignaddr	%o4,	%g5,	%o0
	bvc,pt	%xcc,	loop_473
	std	%i4,	[%l7 + 0x30]
loop_472:
	fmovdcc	%icc,	%f31,	%f18
	tgu	%xcc,	0x0
loop_473:
	fmovrdgz	%l5,	%f26,	%f12
	set	0x108, %g4
	stxa	%o6,	[%g0 + %g4] 0x21
	edge8ln	%g3,	%l2,	%i5
	nop
	setx	loop_474,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%l0,	%i6,	%o2
	movpos	%icc,	%l3,	%g7
	ldsb	[%l7 + 0x72],	%l6
loop_474:
	sethi	0x1A26,	%i7
	taddcctv	%g6,	0x1BCD,	%g2
	alignaddrl	%i2,	%g4,	%i3
	array16	%i1,	%l1,	%o3
	tg	%icc,	0x0
	xor	%o7,	%o1,	%i0
	brnz,a	%g1,	loop_475
	sir	0x177B
	fnot2s	%f7,	%f5
	addc	%l4,	%o5,	%g5
loop_475:
	sir	0x1980
	edge8	%o0,	%i4,	%l5
	fpmerge	%f0,	%f21,	%f0
	tcs	%icc,	0x2
	fcmple16	%f26,	%f24,	%o6
	fpadd32	%f22,	%f12,	%f16
	subccc	%g3,	%o4,	%l2
	movneg	%xcc,	%l0,	%i5
	tg	%icc,	0x2
	ldd	[%l7 + 0x38],	%f12
	tneg	%xcc,	0x0
	mulx	%o2,	0x046D,	%l3
	srl	%i6,	0x00,	%l6
	popc	%i7,	%g6
	wr	%g0,	0xe3,	%asi
	stda	%g2,	[%l7 + 0x30] %asi
	membar	#Sync
	edge8ln	%g7,	%i2,	%g4
	array8	%i3,	%i1,	%l1
	tn	%icc,	0x5
	brgz	%o3,	loop_476
	orcc	%o1,	%i0,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x50] %asi,	%l4
loop_476:
	xnor	%o7,	%o5,	%g5
	subc	%i4,	%l5,	%o6
	tge	%xcc,	0x2
	andncc	%o0,	%g3,	%l2
	bshuffle	%f28,	%f2,	%f6
	addccc	%o4,	0x1D72,	%l0
	fpadd16	%f10,	%f22,	%f26
	fornot1s	%f10,	%f12,	%f30
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
	move	%xcc,	%i5,	%i6
	or	%l3,	0x00D6,	%l6
	fsrc1s	%f22,	%f21
	tl	%xcc,	0x3
	tsubcctv	%g6,	0x05B4,	%g2
	alignaddrl	%i7,	%g7,	%i2
	ba	%icc,	loop_477
	addccc	%i3,	0x042A,	%i1
	movgu	%xcc,	%g4,	%o3
	ble,pt	%xcc,	loop_478
loop_477:
	andncc	%l1,	%o1,	%i0
	fmovrslez	%g1,	%f14,	%f25
	fandnot1	%f18,	%f10,	%f18
loop_478:
	addccc	%l4,	0x0116,	%o7
	fsrc1	%f28,	%f18
	ldsb	[%l7 + 0x72],	%g5
	ba,a,pn	%icc,	loop_479
	fmovde	%xcc,	%f6,	%f3
	udiv	%i4,	0x02E1,	%o5
	tcs	%icc,	0x0
loop_479:
	tcc	%icc,	0x1
	and	%o6,	%l5,	%o0
	subccc	%g3,	%o4,	%l2
	set	0x18, %o6
	stda	%o2,	[%l7 + %o6] 0xea
	membar	#Sync
	ldsb	[%l7 + 0x57],	%i5
	sir	0x1058
	orncc	%i6,	0x0E31,	%l0
	fbo,a	%fcc2,	loop_480
	movvs	%icc,	%l3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%g6,	%g2
loop_480:
	tne	%xcc,	0x6
	array32	%i7,	%g7,	%i3
	fors	%f23,	%f24,	%f12
	movrgz	%i2,	0x198,	%i1
	add	%o3,	0x0B9F,	%l1
	popc	%o1,	%g4
	sra	%g1,	0x19,	%l4
	movrne	%i0,	0x2C7,	%g5
	sll	%i4,	0x11,	%o5
	faligndata	%f4,	%f16,	%f22
	tsubcctv	%o6,	0x0151,	%l5
	bpos,a	%xcc,	loop_481
	movge	%icc,	%o7,	%g3
	sll	%o4,	0x04,	%l2
	movrgez	%o2,	0x3E2,	%o0
loop_481:
	edge32	%i5,	%l0,	%i6
	edge16	%l3,	%g6,	%l6
	edge32ln	%i7,	%g7,	%g2
	fmovsgu	%icc,	%f19,	%f30
	alignaddr	%i3,	%i2,	%i1
	sir	0x0DC3
	subc	%o3,	0x0452,	%l1
	tge	%xcc,	0x4
	addccc	%o1,	%g4,	%g1
	movn	%icc,	%l4,	%i0
	movn	%xcc,	%g5,	%o5
	srax	%i4,	0x09,	%o6
	movneg	%icc,	%l5,	%g3
	orn	%o7,	%o4,	%l2
	mulx	%o0,	0x1206,	%i5
	fmovrslz	%o2,	%f15,	%f19
	mulx	%i6,	0x089D,	%l0
	fnands	%f29,	%f25,	%f11
	movl	%xcc,	%g6,	%l6
	ldd	[%l7 + 0x30],	%i6
	fandnot1	%f14,	%f22,	%f20
	bvs,a,pn	%icc,	loop_482
	stb	%l3,	[%l7 + 0x41]
	fsrc1	%f8,	%f24
	std	%g2,	[%l7 + 0x48]
loop_482:
	stbar
	sir	0x00F2
	bneg,a	loop_483
	bl,pn	%icc,	loop_484
	ta	%xcc,	0x0
	fandnot1	%f20,	%f10,	%f14
loop_483:
	xnor	%g7,	0x15AA,	%i3
loop_484:
	fmuld8sux16	%f28,	%f22,	%f2
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	orncc	%i2,	0x17AC,	%o3
	andn	%l1,	0x0248,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g4,	%i1,	%l4
	edge8ln	%g1,	%g5,	%i0
	subc	%i4,	0x0D02,	%o5
	addc	%o6,	0x0C79,	%g3
	alignaddrl	%l5,	%o4,	%l2
	fblg,a	%fcc3,	loop_485
	move	%xcc,	%o7,	%o0
	fmovsvc	%icc,	%f4,	%f22
	edge8l	%i5,	%o2,	%i6
loop_485:
	fbl	%fcc1,	loop_486
	brlez	%l0,	loop_487
	fbu,a	%fcc0,	loop_488
	sub	%g6,	%l6,	%l3
loop_486:
	popc	0x1488,	%g2
loop_487:
	lduw	[%l7 + 0x18],	%g7
loop_488:
	fmovdpos	%icc,	%f30,	%f1
	fsrc1	%f10,	%f16
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x58] %asi,	%i7
	tne	%icc,	0x1
	bl,a	%xcc,	loop_489
	movgu	%icc,	%i2,	%o3
	tl	%icc,	0x5
	xor	%l1,	%i3,	%g4
loop_489:
	edge32	%o1,	%l4,	%g1
	fbge,a	%fcc1,	loop_490
	udivx	%i1,	0x1724,	%i0
	movpos	%icc,	%i4,	%g5
	edge8l	%o5,	%g3,	%l5
loop_490:
	udivcc	%o4,	0x1E52,	%o6
	udivx	%o7,	0x07A6,	%l2
	swap	[%l7 + 0x58],	%o0
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i5
	tvs	%xcc,	0x3
	fmovsge	%icc,	%f25,	%f28
	srl	%o2,	%l0,	%g6
	srl	%i6,	%l3,	%g2
	tsubcc	%g7,	%l6,	%i7
	sdiv	%o3,	0x0928,	%l1
	set	0x74, %g2
	ldstuba	[%l7 + %g2] 0x18,	%i2
	fnand	%f24,	%f12,	%f6
	fmovrdne	%i3,	%f22,	%f24
	stx	%g4,	[%l7 + 0x48]
	edge32l	%o1,	%l4,	%i1
	fmovdgu	%icc,	%f27,	%f31
	movpos	%xcc,	%g1,	%i4
	fbe	%fcc2,	loop_491
	popc	%i0,	%g5
	fba,a	%fcc3,	loop_492
	fmovrdgez	%g3,	%f4,	%f4
loop_491:
	fmovdge	%xcc,	%f30,	%f16
	alignaddr	%o5,	%o4,	%l5
loop_492:
	fcmpgt16	%f2,	%f26,	%o7
	fsrc1s	%f10,	%f24
	movvc	%icc,	%l2,	%o6
	movrgez	%i5,	%o2,	%l0
	movl	%xcc,	%g6,	%o0
	taddcctv	%i6,	%g2,	%g7
	sub	%l6,	0x1387,	%i7
	tcc	%xcc,	0x7
	xor	%o3,	0x0BF3,	%l3
	fpsub16	%f12,	%f28,	%f18
	movpos	%xcc,	%l1,	%i3
	subc	%i2,	%o1,	%g4
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
	edge8	%g1,	%i4,	%i0
	fsrc1	%f6,	%f12
	nop
	setx	loop_493,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orn	%i1,	0x0A51,	%g3
	fcmpgt32	%f30,	%f12,	%g5
	movvc	%xcc,	%o4,	%l5
loop_493:
	movrlez	%o7,	%o5,	%o6
	ldd	[%l7 + 0x68],	%f4
	edge32ln	%l2,	%i5,	%l0
	movneg	%icc,	%o2,	%o0
	fmovdvc	%icc,	%f19,	%f12
	popc	%i6,	%g6
	edge32	%g7,	%l6,	%i7
	movg	%xcc,	%o3,	%g2
	xor	%l1,	0x11D9,	%l3
	fcmpne16	%f14,	%f30,	%i2
	movneg	%icc,	%o1,	%g4
	xor	%i3,	0x1F3B,	%l4
	lduh	[%l7 + 0x1E],	%g1
	fbl,a	%fcc3,	loop_494
	brgez,a	%i0,	loop_495
	fbn	%fcc2,	loop_496
	fmovsge	%xcc,	%f19,	%f1
loop_494:
	fcmpgt32	%f12,	%f30,	%i4
loop_495:
	movpos	%icc,	%i1,	%g5
loop_496:
	fornot2	%f14,	%f28,	%f10
	edge16	%o4,	%l5,	%g3
	fmovdl	%icc,	%f25,	%f12
	movrgz	%o5,	%o7,	%o6
	tvs	%icc,	0x7
	sdivcc	%i5,	0x095E,	%l2
	fbe	%fcc1,	loop_497
	mulx	%l0,	%o2,	%o0
	tvc	%xcc,	0x4
	tcs	%icc,	0x1
loop_497:
	fpsub16	%f28,	%f14,	%f8
	sdivx	%i6,	0x13EF,	%g6
	fands	%f7,	%f4,	%f27
	fandnot2s	%f2,	%f26,	%f14
	tcs	%icc,	0x0
	edge8l	%l6,	%i7,	%o3
	srl	%g7,	0x1F,	%l1
	alignaddr	%g2,	%l3,	%i2
	sdivcc	%o1,	0x1108,	%i3
	or	%l4,	%g4,	%g1
	movvs	%icc,	%i0,	%i4
	bg	loop_498
	edge32l	%g5,	%i1,	%o4
	ldx	[%l7 + 0x38],	%g3
	bvc,a,pn	%icc,	loop_499
loop_498:
	xnor	%o5,	%l5,	%o7
	udivx	%o6,	0x09ED,	%i5
	umul	%l2,	%l0,	%o0
loop_499:
	fpadd32s	%f25,	%f19,	%f20
	fcmped	%fcc0,	%f18,	%f16
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	ldsb	[%l7 + 0x1D],	%o2
	movrgez	%g6,	%i7,	%l6
	movgu	%xcc,	%o3,	%l1
	taddcctv	%g2,	%g7,	%l3
	movge	%icc,	%o1,	%i3
	mulx	%i2,	0x0920,	%g4
	andcc	%g1,	0x0E71,	%i0
	fmovsge	%icc,	%f15,	%f19
	fcmpgt16	%f8,	%f2,	%i4
	fmovdleu	%xcc,	%f25,	%f23
	tcc	%icc,	0x1
	edge16n	%l4,	%g5,	%i1
	alignaddrl	%g3,	%o5,	%o4
	stbar
	movn	%xcc,	%o7,	%l5
	tgu	%xcc,	0x0
	stw	%i5,	[%l7 + 0x08]
	array32	%l2,	%o6,	%l0
	std	%i6,	[%l7 + 0x40]
	sdiv	%o2,	0x12E5,	%o0
	edge32n	%i7,	%l6,	%g6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x74] %asi,	%l1
	brgz,a	%g2,	loop_500
	movn	%icc,	%o3,	%g7
	smul	%o1,	0x1569,	%l3
	fpmerge	%f2,	%f11,	%f14
loop_500:
	tvc	%icc,	0x2
	brlz	%i3,	loop_501
	movleu	%xcc,	%g4,	%g1
	umul	%i0,	%i2,	%l4
	fpackfix	%f4,	%f4
loop_501:
	ldsw	[%l7 + 0x48],	%i4
	fmovdleu	%xcc,	%f15,	%f9
	fzeros	%f24
	edge16l	%g5,	%i1,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o5,	%o4,	%l5
	subccc	%i5,	%l2,	%o6
	orcc	%o7,	%i6,	%o2
	sdivx	%l0,	0x1396,	%o0
	orncc	%i7,	0x12E5,	%g6
	bgu,pt	%icc,	loop_502
	movrlez	%l1,	%g2,	%o3
	fblg	%fcc1,	loop_503
	bge,a,pn	%xcc,	loop_504
loop_502:
	movvs	%icc,	%l6,	%o1
	fbue	%fcc2,	loop_505
loop_503:
	brgz	%g7,	loop_506
loop_504:
	fmovdpos	%xcc,	%f13,	%f0
	xor	%l3,	0x1EB4,	%g4
loop_505:
	ldstub	[%l7 + 0x14],	%g1
loop_506:
	tgu	%icc,	0x7
	fabsd	%f30,	%f6
	fones	%f22
	umulcc	%i0,	%i2,	%l4
	srlx	%i4,	%i3,	%g5
	tneg	%icc,	0x4
	edge16ln	%g3,	%o5,	%o4
	taddcc	%l5,	0x198B,	%i5
	fnot2s	%f14,	%f27
	set	0x38, %o1
	prefetcha	[%l7 + %o1] 0x11,	 0x1
	addccc	%l2,	0x1506,	%o7
	tne	%icc,	0x5
	or	%o6,	0x0653,	%o2
	tgu	%xcc,	0x1
	edge8	%l0,	%i6,	%o0
	subc	%g6,	0x1CB8,	%i7
	fornot1s	%f8,	%f13,	%f1
	fpack16	%f28,	%f20
	ldd	[%l7 + 0x28],	%g2
	lduh	[%l7 + 0x36],	%l1
	movl	%icc,	%o3,	%o1
	fmul8sux16	%f10,	%f22,	%f12
	bshuffle	%f2,	%f12,	%f24
	add	%l6,	0x1C2F,	%l3
	alignaddrl	%g7,	%g1,	%i0
	set	0x1C, %i1
	lda	[%l7 + %i1] 0x80,	%f10
	tcc	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i2,	%l4,	%g4
	tvs	%xcc,	0x1
	brlez	%i4,	loop_507
	fbo,a	%fcc3,	loop_508
	fcmpeq32	%f6,	%f12,	%i3
	fone	%f24
loop_507:
	mulscc	%g5,	0x17D8,	%g3
loop_508:
	edge32l	%o4,	%o5,	%l5
	andncc	%i1,	%l2,	%i5
	fcmps	%fcc2,	%f3,	%f30
	fabsd	%f2,	%f4
	edge32l	%o7,	%o6,	%o2
	array16	%l0,	%i6,	%o0
	sethi	0x10BF,	%i7
	movrlz	%g2,	0x062,	%l1
	prefetch	[%l7 + 0x50],	 0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba	%fcc3,	loop_509
	edge16	%g6,	%o1,	%l6
	set	0x60, %i6
	ldda	[%l7 + %i6] 0xe3,	%l2
loop_509:
	orn	%g7,	%g1,	%i0
	fmovdg	%xcc,	%f18,	%f18
	fmovrdgez	%o3,	%f26,	%f14
	udivcc	%i2,	0x12C1,	%g4
	movge	%icc,	%i4,	%i3
	edge16n	%g5,	%g3,	%l4
	tg	%xcc,	0x0
	flush	%l7 + 0x14
	fone	%f28
	set	0x6D, %l4
	stba	%o4,	[%l7 + %l4] 0x10
	bpos,a	%xcc,	loop_510
	taddcc	%l5,	%o5,	%l2
	xor	%i5,	0x0204,	%o7
	movneg	%xcc,	%i1,	%o2
loop_510:
	movre	%l0,	%i6,	%o6
	sdivx	%o0,	0x109B,	%g2
	be,a,pt	%icc,	loop_511
	movrne	%i7,	%g6,	%o1
	mova	%icc,	%l1,	%l3
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x14,	 0x3
loop_511:
	nop
	set	0x6C, %o0
	ldsha	[%l7 + %o0] 0x81,	%g7
	addc	%g1,	0x1B36,	%i0
	xnorcc	%o3,	%i2,	%i4
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	srax	%i3,	%g5,	%g3
	sir	0x0414
	fbue,a	%fcc1,	loop_512
	fnands	%f27,	%f19,	%f13
	fcmps	%fcc3,	%f21,	%f31
	stw	%o4,	[%l7 + 0x48]
loop_512:
	tne	%xcc,	0x5
	fpadd32	%f4,	%f28,	%f28
	nop
	setx loop_513, %l0, %l1
	jmpl %l1, %l4
	pdist	%f16,	%f22,	%f10
	fmovdne	%icc,	%f7,	%f16
	movrgez	%o5,	%l5,	%i5
loop_513:
	ldstub	[%l7 + 0x2C],	%l2
	edge16ln	%o7,	%o2,	%l0
	srl	%i6,	%i1,	%o0
	set	0x18, %l1
	stha	%g2,	[%l7 + %l1] 0x88
	fcmpgt16	%f12,	%f20,	%i7
	fxors	%f5,	%f28,	%f19
	ldx	[%l7 + 0x70],	%o6
	fbe,a	%fcc1,	loop_514
	brgez	%o1,	loop_515
	fpsub32s	%f3,	%f1,	%f19
	set	0x10, %l6
	sta	%f23,	[%l7 + %l6] 0x15
loop_514:
	fpadd16	%f10,	%f18,	%f24
loop_515:
	tpos	%icc,	0x3
	te	%xcc,	0x3
	fpmerge	%f21,	%f17,	%f14
	fmovdneg	%xcc,	%f16,	%f14
	mulscc	%l1,	0x0A0B,	%l3
	tvc	%icc,	0x1
	membar	0x4F
	be,a	%xcc,	loop_516
	brlz,a	%g6,	loop_517
	fbg,a	%fcc0,	loop_518
	umulcc	%g7,	0x0CF6,	%g1
loop_516:
	nop
	setx loop_519, %l0, %l1
	jmpl %l1, %l6
loop_517:
	movl	%icc,	%o3,	%i2
loop_518:
	srl	%i4,	0x10,	%g4
	tsubcc	%i0,	0x1379,	%g5
loop_519:
	movge	%xcc,	%i3,	%o4
	fmovsneg	%xcc,	%f3,	%f15
	movrlez	%l4,	0x36D,	%g3
	flush	%l7 + 0x64
	xnor	%l5,	%o5,	%i5
	fones	%f16
	smulcc	%l2,	%o2,	%l0
	fbuge,a	%fcc2,	loop_520
	fandnot2	%f10,	%f24,	%f2
	tsubcctv	%o7,	%i1,	%o0
	movn	%icc,	%g2,	%i6
loop_520:
	nop
	setx	loop_521,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x40],	%o6
	umulcc	%o1,	0x03D3,	%l1
	fbn,a	%fcc2,	loop_522
loop_521:
	andcc	%i7,	%g6,	%l3
	fors	%f27,	%f17,	%f17
	fmovrdne	%g7,	%f16,	%f16
loop_522:
	nop
	set	0x30, %i4
	stxa	%l6,	[%l7 + %i4] 0x11
	tpos	%xcc,	0x3
	sir	0x118C
	tl	%xcc,	0x5
	edge8	%o3,	%g1,	%i2
	fbn	%fcc2,	loop_523
	edge16ln	%g4,	%i4,	%g5
	udiv	%i3,	0x1C0C,	%i0
	tcs	%xcc,	0x4
loop_523:
	membar	0x6D
	fmovspos	%icc,	%f9,	%f3
	tl	%xcc,	0x1
	taddcctv	%o4,	0x109A,	%g3
	prefetch	[%l7 + 0x78],	 0x2
	orncc	%l5,	%l4,	%i5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	fmovde	%icc,	%f18,	%f0
	edge8l	%l2,	%o2,	%l0
	tneg	%xcc,	0x3
	fbe	%fcc0,	loop_524
	bcc	loop_525
	edge8n	%i1,	%o7,	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i6,	%o6
loop_524:
	fbne	%fcc1,	loop_526
loop_525:
	fmul8x16al	%f20,	%f9,	%f4
	fbuge	%fcc2,	loop_527
	fpadd32s	%f21,	%f30,	%f11
loop_526:
	fbn	%fcc1,	loop_528
	movleu	%icc,	%g2,	%l1
loop_527:
	sir	0x14EF
	fcmple16	%f14,	%f6,	%o1
loop_528:
	edge32	%g6,	%i7,	%l3
	movvs	%icc,	%l6,	%o3
	orncc	%g7,	0x062D,	%g1
	fpmerge	%f21,	%f12,	%f20
	subcc	%g4,	0x063A,	%i2
	andncc	%i4,	%i3,	%g5
	movpos	%xcc,	%i0,	%g3
	alignaddr	%l5,	%l4,	%i5
	move	%xcc,	%o5,	%o4
	andn	%l2,	0x0E73,	%l0
	movcs	%icc,	%i1,	%o7
	xorcc	%o0,	%i6,	%o2
	fmovrsgz	%g2,	%f15,	%f5
	udiv	%o6,	0x05B3,	%l1
	fmovsa	%icc,	%f17,	%f8
	fcmpeq32	%f12,	%f24,	%o1
	fmovdcs	%icc,	%f3,	%f17
	tvc	%xcc,	0x0
	fbule	%fcc3,	loop_529
	fmovsgu	%xcc,	%f29,	%f27
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%i7,	%l3
loop_529:
	fcmpes	%fcc1,	%f2,	%f27
	fmovrsgez	%l6,	%f29,	%f2
	for	%f24,	%f16,	%f18
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%g6
	brlez	%o3,	loop_530
	tcc	%xcc,	0x4
	tpos	%icc,	0x7
	mulx	%g1,	%g7,	%i2
loop_530:
	fcmple16	%f14,	%f10,	%i4
	prefetch	[%l7 + 0x08],	 0x2
	bpos,a,pt	%xcc,	loop_531
	brnz,a	%i3,	loop_532
	fnot1	%f4,	%f20
	smul	%g5,	%i0,	%g3
loop_531:
	nop
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%l5
loop_532:
	stx	%g4,	[%l7 + 0x60]
	edge32l	%i5,	%o5,	%l4
	subccc	%o4,	0x1F8E,	%l2
	fmovsgu	%xcc,	%f21,	%f11
	movvc	%icc,	%l0,	%i1
	array16	%o7,	%i6,	%o2
	edge16	%g2,	%o6,	%o0
	taddcc	%o1,	%i7,	%l1
	edge32n	%l6,	%l3,	%g6
	tsubcctv	%g1,	%g7,	%o3
	edge32l	%i2,	%i4,	%i3
	srl	%i0,	%g3,	%l5
	edge8	%g4,	%g5,	%o5
	fba,a	%fcc3,	loop_533
	addc	%i5,	%o4,	%l2
	edge16ln	%l4,	%l0,	%o7
	stw	%i1,	[%l7 + 0x5C]
loop_533:
	tcs	%icc,	0x2
	set	0x14, %o4
	sta	%f18,	[%l7 + %o4] 0x14
	fxnor	%f18,	%f18,	%f2
	fmovrdlz	%o2,	%f14,	%f4
	movpos	%icc,	%g2,	%i6
	swap	[%l7 + 0x6C],	%o6
	edge32l	%o1,	%i7,	%o0
	movpos	%icc,	%l1,	%l3
	fbu	%fcc0,	loop_534
	orncc	%l6,	%g6,	%g7
	tvs	%xcc,	0x5
	movvs	%xcc,	%g1,	%o3
loop_534:
	tgu	%icc,	0x5
	srlx	%i2,	%i4,	%i3
	edge8	%g3,	%l5,	%i0
	stbar
	wr	%g0,	0x19,	%asi
	stwa	%g5,	[%l7 + 0x0C] %asi
	andn	%o5,	0x1D2F,	%i5
	tcc	%xcc,	0x0
	sub	%g4,	%o4,	%l4
	andn	%l0,	0x0347,	%l2
	addcc	%i1,	0x0215,	%o2
	tsubcc	%o7,	0x180C,	%g2
	alignaddrl	%o6,	%o1,	%i7
	set	0x74, %g7
	lduwa	[%l7 + %g7] 0x10,	%i6
	andncc	%o0,	%l3,	%l1
	edge32n	%l6,	%g6,	%g1
	stbar
	edge32n	%o3,	%g7,	%i4
	edge8ln	%i3,	%g3,	%i2
	andn	%i0,	0x14D7,	%g5
	movrgez	%o5,	%i5,	%g4
	fpack16	%f4,	%f21
	bge,a,pt	%xcc,	loop_535
	brgez	%l5,	loop_536
	brlez,a	%o4,	loop_537
	ta	%xcc,	0x0
loop_535:
	fornot2	%f12,	%f8,	%f10
loop_536:
	siam	0x6
loop_537:
	movneg	%icc,	%l4,	%l2
	fmovsa	%icc,	%f21,	%f26
	wr	%g0,	0x23,	%asi
	stxa	%l0,	[%l7 + 0x20] %asi
	membar	#Sync
	tsubcctv	%o2,	%o7,	%g2
	edge8l	%o6,	%i1,	%i7
	movrlez	%o1,	%o0,	%i6
	sub	%l3,	0x092D,	%l6
	udivcc	%l1,	0x04D8,	%g6
	fmovsgu	%xcc,	%f0,	%f23
	fmovdgu	%xcc,	%f26,	%f5
	edge32l	%g1,	%o3,	%g7
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	movn	%xcc,	%i3,	%i4
	fmovdg	%xcc,	%f10,	%f10
	andcc	%g3,	0x031C,	%i0
	andn	%i2,	0x1222,	%g5
	movre	%i5,	0x3D3,	%g4
	brnz,a	%l5,	loop_538
	edge16ln	%o4,	%o5,	%l4
	andcc	%l0,	0x090B,	%l2
	fbul,a	%fcc2,	loop_539
loop_538:
	tne	%xcc,	0x4
	brgez,a	%o7,	loop_540
	movrne	%g2,	%o6,	%i1
loop_539:
	fnot1s	%f22,	%f17
	fxnor	%f4,	%f4,	%f16
loop_540:
	srlx	%i7,	%o1,	%o0
	addcc	%o2,	0x12F2,	%l3
	smulcc	%l6,	0x0AD1,	%i6
	movrlez	%l1,	0x0E2,	%g1
	umul	%o3,	%g6,	%g7
	addc	%i4,	%i3,	%g3
	sra	%i0,	0x19,	%i2
	edge16l	%g5,	%g4,	%l5
	for	%f28,	%f30,	%f10
	flush	%l7 + 0x18
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	tle	%icc,	0x1
	sll	%o4,	%o5,	%l0
	brlez	%l2,	loop_541
	sdivx	%l4,	0x15E1,	%o7
	fcmpes	%fcc1,	%f13,	%f17
	edge16ln	%g2,	%i1,	%i7
loop_541:
	stbar
	movgu	%icc,	%o6,	%o0
	fandnot1s	%f25,	%f24,	%f15
	move	%xcc,	%o2,	%o1
	nop
	setx	loop_542,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxnor	%f2,	%f28,	%f28
	tg	%xcc,	0x4
	array8	%l3,	%i6,	%l6
loop_542:
	fmovdneg	%xcc,	%f9,	%f22
	fxnor	%f4,	%f10,	%f2
	xor	%l1,	%g1,	%o3
	nop
	setx	loop_543,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%g6,	%i4,	%g7
	fandnot2	%f6,	%f30,	%f26
	andcc	%g3,	0x16FF,	%i3
loop_543:
	ba,a	%xcc,	loop_544
	ldsb	[%l7 + 0x49],	%i0
	edge32n	%g5,	%i2,	%l5
	fmovrdne	%g4,	%f0,	%f10
loop_544:
	tn	%icc,	0x2
	add	%o4,	%i5,	%l0
	tne	%xcc,	0x7
	fcmps	%fcc3,	%f26,	%f1
	fmovdn	%icc,	%f2,	%f25
	edge8ln	%l2,	%l4,	%o5
	prefetch	[%l7 + 0x60],	 0x2
	movrgz	%g2,	%i1,	%o7
	fpack32	%f8,	%f18,	%f22
	movrne	%o6,	0x239,	%o0
	movrgz	%i7,	%o2,	%o1
	set	0x6C, %l3
	swapa	[%l7 + %l3] 0x89,	%i6
	bgu,pt	%xcc,	loop_545
	sra	%l6,	0x02,	%l1
	smul	%g1,	%l3,	%o3
	fmovs	%f7,	%f13
loop_545:
	fpsub32	%f24,	%f2,	%f0
	fsrc2s	%f16,	%f31
	tg	%icc,	0x5
	edge8ln	%g6,	%i4,	%g3
	tcs	%icc,	0x0
	fpadd16	%f18,	%f10,	%f26
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x89,	%f16
	or	%g7,	0x19BA,	%i3
	brgez	%i0,	loop_546
	umulcc	%i2,	0x10AF,	%l5
	sth	%g5,	[%l7 + 0x72]
	edge32n	%g4,	%o4,	%l0
loop_546:
	subccc	%l2,	%i5,	%o5
	stx	%g2,	[%l7 + 0x48]
	fmovdne	%xcc,	%f20,	%f6
	orncc	%i1,	%l4,	%o6
	fcmpd	%fcc1,	%f16,	%f16
	edge16n	%o7,	%i7,	%o0
	fbu	%fcc1,	loop_547
	array8	%o1,	%o2,	%l6
	ta	%icc,	0x4
	movgu	%xcc,	%i6,	%l1
loop_547:
	fbu,a	%fcc2,	loop_548
	andncc	%g1,	%l3,	%g6
	movneg	%icc,	%o3,	%i4
	andcc	%g7,	%g3,	%i3
loop_548:
	sll	%i2,	0x0A,	%i0
	edge32	%l5,	%g5,	%g4
	sra	%o4,	%l0,	%l2
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32l	%o5,	%g2,	%i1
	srax	%i5,	%l4,	%o6
	smulcc	%o7,	0x036F,	%o0
	fpsub32	%f8,	%f20,	%f20
	addcc	%o1,	%i7,	%o2
	fcmpne32	%f8,	%f8,	%l6
	fxors	%f16,	%f21,	%f21
	stx	%i6,	[%l7 + 0x30]
	bcc	loop_549
	and	%l1,	%g1,	%l3
	ldub	[%l7 + 0x6F],	%g6
	fmovsneg	%xcc,	%f7,	%f16
loop_549:
	tge	%xcc,	0x0
	fmovse	%icc,	%f3,	%f11
	taddcc	%i4,	0x147C,	%g7
	fzero	%f22
	orcc	%g3,	0x1D65,	%i3
	alignaddr	%o3,	%i0,	%l5
	movrlez	%g5,	0x35B,	%i2
	movrlez	%o4,	0x127,	%g4
	edge32ln	%l0,	%o5,	%l2
	lduh	[%l7 + 0x2A],	%g2
	edge8n	%i1,	%i5,	%o6
	sll	%o7,	%l4,	%o0
	fcmple16	%f8,	%f14,	%o1
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x80
	subc	%o2,	%i7,	%i6
	ldsw	[%l7 + 0x34],	%l1
	tn	%icc,	0x0
	st	%f21,	[%l7 + 0x28]
	te	%icc,	0x2
	udivcc	%l6,	0x15E3,	%l3
	set	0x62, %g3
	lduba	[%l7 + %g3] 0x80,	%g1
	edge8n	%i4,	%g6,	%g3
	sir	0x0B38
	bpos,a	%xcc,	loop_550
	fmovsneg	%icc,	%f21,	%f25
	fand	%f30,	%f12,	%f16
	fmul8sux16	%f10,	%f30,	%f8
loop_550:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%i3
	mova	%icc,	%g7,	%o3
	umulcc	%l5,	%i0,	%g5
	edge32ln	%o4,	%i2,	%g4
	movrlez	%l0,	%o5,	%g2
	ldsb	[%l7 + 0x3A],	%l2
	smul	%i5,	%o6,	%i1
	taddcc	%o7,	%l4,	%o0
	movneg	%xcc,	%o1,	%o2
	umulcc	%i7,	0x0EC0,	%i6
	taddcc	%l6,	0x154B,	%l1
	stw	%l3,	[%l7 + 0x0C]
	fbug	%fcc0,	loop_551
	tsubcc	%g1,	0x07FE,	%g6
	fabsd	%f22,	%f20
	ld	[%l7 + 0x5C],	%f28
loop_551:
	fcmpeq16	%f8,	%f6,	%g3
	xnorcc	%i4,	0x1D2D,	%i3
	movcc	%xcc,	%g7,	%o3
	fmovsvc	%icc,	%f13,	%f27
	fbu,a	%fcc0,	loop_552
	subccc	%l5,	%i0,	%g5
	tsubcctv	%o4,	%g4,	%i2
	ldsh	[%l7 + 0x3A],	%o5
loop_552:
	fbuge,a	%fcc2,	loop_553
	nop
	setx	loop_554,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%g2,	%l0,	%i5
	prefetch	[%l7 + 0x54],	 0x2
loop_553:
	fmovdcc	%icc,	%f31,	%f13
loop_554:
	tn	%xcc,	0x4
	movne	%xcc,	%l2,	%i1
	fnegs	%f3,	%f24
	fpadd16	%f6,	%f16,	%f28
	srlx	%o6,	%l4,	%o0
	bn,pt	%icc,	loop_555
	move	%icc,	%o7,	%o1
	movre	%i7,	%o2,	%i6
	srax	%l1,	%l3,	%l6
loop_555:
	edge8n	%g6,	%g3,	%i4
	fbl,a	%fcc2,	loop_556
	andncc	%g1,	%g7,	%i3
	nop
	set	0x1A, %i2
	stb	%l5,	[%l7 + %i2]
	tvc	%xcc,	0x2
loop_556:
	nop
	set	0x1F, %o3
	ldsb	[%l7 + %o3],	%i0
	or	%o3,	0x081B,	%g5
	fsrc1s	%f28,	%f11
	umulcc	%o4,	0x0EF8,	%i2
	movge	%icc,	%g4,	%g2
	pdist	%f22,	%f28,	%f6
	fexpand	%f27,	%f10
	membar	0x19
	fnot1s	%f29,	%f22
	fmovsg	%icc,	%f31,	%f31
	and	%l0,	%o5,	%i5
	ldx	[%l7 + 0x10],	%i1
	sethi	0x0FE2,	%l2
	st	%f6,	[%l7 + 0x4C]
	fone	%f26
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x41] %asi,	%o6
	fmuld8ulx16	%f16,	%f26,	%f28
	fmovdvc	%xcc,	%f20,	%f29
	movrlz	%o0,	%o7,	%o1
	fbule	%fcc3,	loop_557
	subc	%i7,	%l4,	%o2
	movgu	%icc,	%i6,	%l3
	ldub	[%l7 + 0x32],	%l1
loop_557:
	fmuld8ulx16	%f8,	%f5,	%f10
	stx	%l6,	[%l7 + 0x10]
	fxnors	%f21,	%f15,	%f19
	movre	%g3,	%i4,	%g1
	movge	%icc,	%g6,	%i3
	movne	%icc,	%g7,	%i0
	set	0x4E, %g6
	ldsba	[%l7 + %g6] 0x14,	%l5
	tsubcctv	%o3,	%o4,	%g5
	fblg	%fcc0,	loop_558
	fmul8x16al	%f14,	%f19,	%f30
	edge32	%g4,	%i2,	%l0
	edge16	%o5,	%i5,	%i1
loop_558:
	movrne	%l2,	0x339,	%o6
	fpmerge	%f6,	%f16,	%f10
	fmovrsne	%o0,	%f0,	%f9
	addccc	%g2,	%o7,	%o1
	lduw	[%l7 + 0x40],	%i7
	subcc	%l4,	0x09A0,	%i6
	fcmpd	%fcc2,	%f22,	%f24
	movrgz	%o2,	0x3B3,	%l3
	alignaddrl	%l1,	%g3,	%l6
	tneg	%xcc,	0x0
	edge32ln	%i4,	%g6,	%g1
	fnegs	%f23,	%f5
	taddcc	%g7,	0x16F5,	%i0
	fcmpgt32	%f22,	%f12,	%l5
	tsubcctv	%o3,	0x0D1B,	%i3
	tpos	%icc,	0x2
	pdist	%f10,	%f24,	%f20
	fmovdg	%xcc,	%f29,	%f21
	fornot1	%f24,	%f30,	%f30
	fandnot1	%f26,	%f8,	%f4
	movrne	%o4,	%g4,	%g5
	movneg	%xcc,	%i2,	%l0
	subccc	%o5,	%i1,	%i5
	orn	%l2,	0x00CA,	%o0
	subccc	%g2,	0x1260,	%o7
	edge16ln	%o6,	%i7,	%o1
	movvc	%xcc,	%i6,	%l4
	tg	%xcc,	0x3
	siam	0x7
	fbn	%fcc0,	loop_559
	fmovdcc	%icc,	%f6,	%f21
	edge8n	%o2,	%l1,	%g3
	ta	%icc,	0x2
loop_559:
	popc	%l3,	%i4
	fnot2	%f20,	%f14
	fpadd16s	%f14,	%f28,	%f17
	fbug,a	%fcc2,	loop_560
	mulx	%g6,	0x0F58,	%l6
	set	0x5C, %g5
	stba	%g7,	[%l7 + %g5] 0x23
	membar	#Sync
loop_560:
	ta	%xcc,	0x5
	movrgz	%g1,	0x1D2,	%i0
	edge32l	%o3,	%l5,	%o4
	movrne	%i3,	%g5,	%i2
	subcc	%l0,	0x05F8,	%o5
	bcs,a	loop_561
	membar	0x73
	std	%i0,	[%l7 + 0x08]
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
loop_561:
	alignaddrl	%l2,	%o0,	%g4
	nop
	setx loop_562, %l0, %l1
	jmpl %l1, %o7
	fbu	%fcc3,	loop_563
	subcc	%g2,	%i7,	%o6
	fmovdvs	%xcc,	%f1,	%f6
loop_562:
	tg	%xcc,	0x3
loop_563:
	fmovdl	%xcc,	%f3,	%f19
	edge8l	%o1,	%l4,	%i6
	stb	%o2,	[%l7 + 0x20]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%xcc,	%f29,	%f8
	andn	%g3,	%l1,	%l3
	array32	%i4,	%l6,	%g6
	movl	%icc,	%g7,	%g1
	nop
	setx loop_564, %l0, %l1
	jmpl %l1, %o3
	movl	%xcc,	%l5,	%i0
	fandnot1s	%f23,	%f7,	%f15
	movrne	%o4,	%g5,	%i3
loop_564:
	tgu	%xcc,	0x5
	ld	[%l7 + 0x60],	%f0
	movrlz	%i2,	%l0,	%i1
	fmovse	%icc,	%f15,	%f0
	sdivcc	%i5,	0x045E,	%o5
	add	%l2,	0x0CCA,	%o0
	nop
	setx	loop_565,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%o7,	%g4,	%i7
	wr	%g0,	0x89,	%asi
	stwa	%g2,	[%l7 + 0x24] %asi
loop_565:
	be,pn	%icc,	loop_566
	taddcctv	%o6,	%o1,	%l4
	move	%icc,	%o2,	%g3
	fandnot1	%f14,	%f30,	%f22
loop_566:
	be	%icc,	loop_567
	fbn	%fcc3,	loop_568
	call	loop_569
	fcmpgt16	%f14,	%f20,	%i6
loop_567:
	fpadd32	%f4,	%f4,	%f26
loop_568:
	fbge	%fcc0,	loop_570
loop_569:
	edge8n	%l1,	%l3,	%i4
	edge16	%l6,	%g7,	%g6
	fcmpgt16	%f26,	%f22,	%o3
loop_570:
	fornot2	%f6,	%f4,	%f16
	movge	%xcc,	%g1,	%l5
	fmovsvs	%xcc,	%f18,	%f23
	or	%o4,	0x1FB7,	%g5
	movl	%icc,	%i3,	%i0
	alignaddrl	%i2,	%i1,	%i5
	bleu,pn	%xcc,	loop_571
	tvs	%xcc,	0x7
	fnor	%f24,	%f20,	%f30
	sdivx	%l0,	0x1E9B,	%o5
loop_571:
	movvs	%xcc,	%o0,	%o7
	fmul8x16	%f5,	%f0,	%f10
	mulscc	%l2,	%i7,	%g2
	fsrc1s	%f8,	%f24
	tn	%xcc,	0x0
	fmovdcs	%icc,	%f3,	%f26
	sll	%o6,	0x1D,	%g4
	std	%f30,	[%l7 + 0x20]
	fpackfix	%f24,	%f15
	brz	%o1,	loop_572
	smulcc	%l4,	%o2,	%i6
	array8	%g3,	%l3,	%l1
	fmovsa	%xcc,	%f24,	%f14
loop_572:
	fpsub32s	%f29,	%f30,	%f1
	set	0x54, %i5
	lduha	[%l7 + %i5] 0x14,	%l6
	bvc,pt	%xcc,	loop_573
	fmovdle	%icc,	%f18,	%f25
	lduh	[%l7 + 0x4E],	%g7
	siam	0x0
loop_573:
	membar	0x54
	ta	%xcc,	0x1
	movcs	%xcc,	%g6,	%o3
	fbuge,a	%fcc2,	loop_574
	fcmple32	%f16,	%f28,	%i4
	bneg,a,pt	%icc,	loop_575
	tneg	%icc,	0x3
loop_574:
	edge32n	%g1,	%o4,	%g5
	set	0x70, %i3
	prefetcha	[%l7 + %i3] 0x81,	 0x2
loop_575:
	te	%xcc,	0x5
	fba,a	%fcc1,	loop_576
	ldd	[%l7 + 0x58],	%f2
	fnot1	%f0,	%f22
	bge,pt	%xcc,	loop_577
loop_576:
	orn	%i0,	%i2,	%i1
	xnor	%i3,	0x0AB4,	%i5
	umulcc	%o5,	0x1524,	%l0
loop_577:
	fnot1s	%f9,	%f1
	fmovdge	%xcc,	%f23,	%f18
	movpos	%xcc,	%o7,	%l2
	smulcc	%o0,	%i7,	%o6
	tcs	%icc,	0x6
	movg	%xcc,	%g4,	%o1
	sub	%g2,	%o2,	%l4
	std	%f30,	[%l7 + 0x70]
	fands	%f9,	%f26,	%f30
	bg,a	%xcc,	loop_578
	srl	%g3,	0x0A,	%l3
	fpack32	%f18,	%f24,	%f18
	set	0x6C, %g1
	ldstuba	[%l7 + %g1] 0x18,	%i6
loop_578:
	xnorcc	%l1,	0x1E58,	%l6
	movg	%xcc,	%g6,	%o3
	call	loop_579
	movvc	%xcc,	%g7,	%g1
	movrne	%o4,	0x323,	%i4
	edge8l	%l5,	%i0,	%g5
loop_579:
	sllx	%i1,	0x0A,	%i2
	xorcc	%i3,	0x00CA,	%i5
	fand	%f24,	%f0,	%f18
	movvc	%xcc,	%o5,	%o7
	sll	%l2,	%l0,	%o0
	edge16	%o6,	%g4,	%o1
	bleu,a	loop_580
	ldsb	[%l7 + 0x6A],	%i7
	fmul8x16au	%f4,	%f29,	%f2
	movrlz	%g2,	%o2,	%l4
loop_580:
	tge	%xcc,	0x0
	subcc	%l3,	0x06BB,	%g3
	mulscc	%i6,	%l1,	%l6
	movleu	%icc,	%o3,	%g7
	ta	%xcc,	0x1
	fmovdvs	%icc,	%f16,	%f7
	fbul,a	%fcc2,	loop_581
	xorcc	%g6,	0x138A,	%g1
	smulcc	%o4,	%l5,	%i4
	lduw	[%l7 + 0x78],	%i0
loop_581:
	bge	%icc,	loop_582
	fornot1s	%f13,	%f22,	%f25
	fandnot2	%f12,	%f0,	%f16
	ldsb	[%l7 + 0x7F],	%g5
loop_582:
	fmovsle	%xcc,	%f12,	%f26
	ldd	[%l7 + 0x38],	%f2
	edge16ln	%i2,	%i3,	%i5
	fbug,a	%fcc2,	loop_583
	sra	%i1,	0x02,	%o7
	move	%xcc,	%o5,	%l0
	xnorcc	%l2,	0x194A,	%o0
loop_583:
	taddcc	%o6,	0x1C41,	%g4
	tvs	%xcc,	0x4
	edge8l	%o1,	%i7,	%g2
	fmovdcs	%icc,	%f2,	%f19
	fba,a	%fcc2,	loop_584
	lduh	[%l7 + 0x2E],	%o2
	fones	%f6
	nop
	setx	loop_585,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_584:
	orcc	%l4,	%g3,	%l3
	sllx	%l1,	0x1B,	%i6
	sllx	%l6,	0x1F,	%o3
loop_585:
	fmovdvc	%icc,	%f25,	%f22
	movneg	%icc,	%g6,	%g1
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovscs	%icc,	%f14,	%f8
	fmovsa	%xcc,	%f27,	%f19
	xor	%g7,	%o4,	%i4
	fxnors	%f29,	%f22,	%f20
	bcc,a	loop_586
	fcmpne16	%f2,	%f18,	%l5
	edge8ln	%g5,	%i0,	%i2
	fbge	%fcc2,	loop_587
loop_586:
	tcs	%xcc,	0x4
	fmovspos	%xcc,	%f10,	%f8
	edge8	%i3,	%i5,	%o7
loop_587:
	sir	0x0D27
	sdivcc	%i1,	0x0C19,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l0,	%l2,	%o6
	bl,a,pt	%xcc,	loop_588
	smulcc	%o0,	%g4,	%o1
	fbn	%fcc0,	loop_589
	addccc	%g2,	%o2,	%i7
loop_588:
	sll	%g3,	0x0A,	%l4
	movcc	%xcc,	%l1,	%i6
loop_589:
	tvc	%icc,	0x6
	fbne,a	%fcc2,	loop_590
	xnor	%l6,	0x1616,	%l3
	ldx	[%l7 + 0x38],	%o3
	tle	%xcc,	0x4
loop_590:
	be,a	loop_591
	add	%g1,	0x093B,	%g7
	srax	%g6,	0x00,	%i4
	tne	%icc,	0x3
loop_591:
	fmuld8sux16	%f11,	%f16,	%f14
	fones	%f13
	tneg	%icc,	0x1
	or	%l5,	%o4,	%g5
	ldub	[%l7 + 0x35],	%i0
	tsubcctv	%i3,	%i2,	%i5
	or	%i1,	0x0D05,	%o7
	edge32ln	%o5,	%l0,	%o6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x69] %asi,	%o0
	tn	%icc,	0x4
	ble,a	%icc,	loop_592
	tleu	%icc,	0x0
	edge16ln	%g4,	%l2,	%o1
	edge16	%o2,	%i7,	%g2
loop_592:
	movcs	%xcc,	%l4,	%g3
	fors	%f12,	%f15,	%f18
	bvs,a	%xcc,	loop_593
	edge16n	%i6,	%l1,	%l6
	sdivcc	%o3,	0x0367,	%g1
	fpsub32s	%f11,	%f11,	%f12
loop_593:
	brz,a	%l3,	loop_594
	tcs	%icc,	0x0
	fzeros	%f30
	fcmple32	%f30,	%f22,	%g6
loop_594:
	tge	%icc,	0x1
	bshuffle	%f12,	%f20,	%f30
	set	0x10, %o2
	ldswa	[%l7 + %o2] 0x04,	%i4
	fbul,a	%fcc0,	loop_595
	ta	%icc,	0x4
	xorcc	%g7,	%l5,	%g5
	andncc	%i0,	%i3,	%o4
loop_595:
	fpackfix	%f12,	%f5
	fpadd16s	%f24,	%f1,	%f8
	edge32l	%i5,	%i1,	%o7
	fble,a	%fcc3,	loop_596
	udivcc	%o5,	0x079E,	%l0
	mulx	%i2,	0x172B,	%o6
	ldsw	[%l7 + 0x1C],	%g4
loop_596:
	umulcc	%o0,	0x1985,	%o1
	tcc	%xcc,	0x3
	fzero	%f14
	movrgz	%o2,	%l2,	%g2
	srax	%i7,	%l4,	%i6
	fnot1s	%f0,	%f28
	edge8ln	%g3,	%l1,	%o3
	fpsub32s	%f21,	%f26,	%f16
	xor	%g1,	0x1B60,	%l6
	udivx	%l3,	0x0279,	%i4
	ldub	[%l7 + 0x5B],	%g7
	alignaddr	%l5,	%g6,	%i0
	movleu	%xcc,	%g5,	%o4
	flush	%l7 + 0x34
	bvc,pt	%icc,	loop_597
	fmovdpos	%icc,	%f23,	%f19
	fcmpeq32	%f8,	%f20,	%i3
	fmovrse	%i1,	%f15,	%f19
loop_597:
	fmul8x16al	%f4,	%f10,	%f2
	tn	%xcc,	0x6
	and	%o7,	0x0C65,	%i5
	array32	%l0,	%i2,	%o5
	stw	%o6,	[%l7 + 0x58]
	tleu	%xcc,	0x4
	sth	%g4,	[%l7 + 0x78]
	udivcc	%o1,	0x1D1B,	%o2
	or	%l2,	%g2,	%o0
	ldsb	[%l7 + 0x52],	%l4
	edge16ln	%i6,	%g3,	%i7
	ta	%icc,	0x4
	movgu	%xcc,	%l1,	%o3
	addccc	%g1,	0x0883,	%l6
	xorcc	%l3,	0x01DD,	%i4
	fones	%f12
	sra	%l5,	0x18,	%g7
	movvs	%icc,	%i0,	%g6
	membar	0x0E
	umulcc	%o4,	%i3,	%i1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x50] %asi,	%g4
	and	%o7,	0x14B9,	%i5
	edge32ln	%i2,	%l0,	%o6
	fsrc2	%f28,	%f6
	fpackfix	%f24,	%f28
	fnot2s	%f19,	%f10
	udivx	%g4,	0x0C66,	%o5
	edge32ln	%o1,	%o2,	%l2
	edge32ln	%o0,	%g2,	%i6
	add	%g3,	0x061B,	%l4
	wr	%g0,	0x0c,	%asi
	stwa	%i7,	[%l7 + 0x3C] %asi
	nop
	setx	loop_598,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%l1,	%o3,	%g1
	tsubcc	%l3,	0x1EE2,	%l6
	fbue	%fcc1,	loop_599
loop_598:
	bn	loop_600
	movrgez	%i4,	0x077,	%l5
	srax	%i0,	0x1D,	%g6
loop_599:
	movneg	%icc,	%o4,	%i3
loop_600:
	udivx	%i1,	0x18C5,	%g5
	edge8n	%g7,	%i5,	%o7
	fpmerge	%f13,	%f15,	%f6
	alignaddrl	%l0,	%i2,	%o6
	bcc,a	loop_601
	fmovs	%f5,	%f29
	mulx	%g4,	0x03AB,	%o1
	tne	%xcc,	0x3
loop_601:
	movrlz	%o2,	0x2AC,	%l2
	fcmped	%fcc1,	%f16,	%f0
	fnands	%f5,	%f26,	%f17
	add	%o5,	%o0,	%g2
	movn	%icc,	%g3,	%l4
	fmovsleu	%icc,	%f0,	%f16
	fmuld8sux16	%f18,	%f14,	%f20
	st	%f27,	[%l7 + 0x34]
	sdiv	%i7,	0x1D37,	%i6
	fpack32	%f30,	%f12,	%f28
	udivcc	%o3,	0x1E28,	%g1
	xnorcc	%l3,	0x0D0D,	%l6
	fmovsne	%xcc,	%f24,	%f9
	fmul8x16	%f29,	%f2,	%f8
	brnz,a	%i4,	loop_602
	sdiv	%l5,	0x068B,	%i0
	orncc	%g6,	0x072C,	%l1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x1F] %asi,	%i3
loop_602:
	orncc	%o4,	0x196B,	%g5
	fmul8x16	%f20,	%f10,	%f8
	movcs	%xcc,	%g7,	%i5
	fbn,a	%fcc1,	loop_603
	ldd	[%l7 + 0x40],	%f6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x3A] %asi,	%o7
loop_603:
	nop
	wr	%g0,	0xeb,	%asi
	stba	%i1,	[%l7 + 0x4D] %asi
	membar	#Sync
	fmovd	%f10,	%f8
	fmovdcc	%icc,	%f12,	%f6
	ldub	[%l7 + 0x0B],	%l0
	fbo,a	%fcc3,	loop_604
	te	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x4
loop_604:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x30, %o7
	sta	%f30,	[%l7 + %o7] 0x14
	xnor	%o6,	0x04CE,	%g4
	tge	%xcc,	0x1
	array32	%o1,	%o2,	%i2
	movrne	%o5,	0x099,	%o0
	fnot1s	%f3,	%f21
	movg	%xcc,	%g2,	%g3
	sdivcc	%l2,	0x0202,	%l4
	flush	%l7 + 0x5C
	smul	%i6,	%i7,	%o3
	fbu	%fcc1,	loop_605
	fmovrslz	%g1,	%f8,	%f30
	tsubcc	%l6,	0x18CB,	%i4
	edge16ln	%l5,	%l3,	%g6
loop_605:
	orn	%i0,	%i3,	%l1
	xnor	%o4,	%g5,	%g7
	movrlz	%o7,	0x28E,	%i1
	umul	%i5,	%o6,	%g4
	subc	%l0,	0x0635,	%o2
	movrgz	%o1,	%i2,	%o0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%g2
	edge8n	%l2,	%g3,	%i6
	udiv	%i7,	0x1D23,	%l4
	fandnot1	%f14,	%f26,	%f30
	fmovs	%f20,	%f27
	fmovsa	%icc,	%f26,	%f10
	edge32	%o3,	%l6,	%g1
	fornot1s	%f9,	%f19,	%f21
	swap	[%l7 + 0x30],	%l5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x58] %asi,	%f7
	edge8l	%i4,	%g6,	%l3
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x64] %asi,	%i0
	fmovrde	%l1,	%f28,	%f2
	andn	%i3,	0x1FD4,	%o4
	ldsw	[%l7 + 0x48],	%g7
	sllx	%o7,	%g5,	%i5
	andn	%o6,	0x003A,	%i1
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x62] %asi,	%l0
	fblg	%fcc0,	loop_606
	smul	%o2,	0x0057,	%o1
	popc	0x1E93,	%g4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i2,	%o0
loop_606:
	fmovda	%xcc,	%f0,	%f15
	and	%o5,	0x0A98,	%g2
	andcc	%l2,	0x1A2B,	%i6
	movg	%icc,	%i7,	%l4
	movle	%xcc,	%o3,	%l6
	bn,pt	%xcc,	loop_607
	tcs	%icc,	0x5
	prefetch	[%l7 + 0x20],	 0x2
	stbar
loop_607:
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%g1
	ldsh	[%l7 + 0x72],	%g3
	movpos	%xcc,	%l5,	%i4
	movn	%xcc,	%g6,	%l3
	sdivcc	%l1,	0x1FB0,	%i3
	fmovrsne	%o4,	%f28,	%f22
	andncc	%i0,	%o7,	%g5
	movneg	%icc,	%g7,	%i5
	mulscc	%o6,	%l0,	%o2
	sir	0x06F5
	movleu	%icc,	%o1,	%g4
	fbu	%fcc1,	loop_608
	fbe	%fcc1,	loop_609
	movg	%icc,	%i2,	%i1
	ta	%icc,	0x6
loop_608:
	fmovsl	%icc,	%f22,	%f26
loop_609:
	fbu	%fcc3,	loop_610
	fmuld8sux16	%f18,	%f14,	%f16
	movne	%xcc,	%o0,	%o5
	fbo	%fcc1,	loop_611
loop_610:
	fmul8ulx16	%f2,	%f6,	%f10
	movneg	%icc,	%g2,	%l2
	movrne	%i6,	0x09D,	%i7
loop_611:
	fzero	%f24
	fmul8x16au	%f30,	%f27,	%f24
	sir	0x0E24
	or	%o3,	0x1114,	%l4
	brgz,a	%g1,	loop_612
	fmovsa	%xcc,	%f28,	%f15
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x1f,	%f16
loop_612:
	edge16	%g3,	%l6,	%i4
	be,pn	%icc,	loop_613
	fpsub32	%f20,	%f0,	%f24
	swap	[%l7 + 0x64],	%l5
	stw	%l3,	[%l7 + 0x44]
loop_613:
	sllx	%l1,	%g6,	%o4
	edge8	%i3,	%i0,	%o7
	fabss	%f11,	%f27
	srax	%g7,	0x17,	%g5
	and	%o6,	0x010F,	%l0
	smul	%i5,	%o2,	%o1
	nop
	setx	loop_614,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq16	%f10,	%f26,	%g4
	srax	%i2,	0x15,	%o0
	tge	%icc,	0x2
loop_614:
	movrlz	%o5,	0x37D,	%g2
	ba	%icc,	loop_615
	fcmpeq16	%f16,	%f6,	%i1
	movcs	%icc,	%i6,	%l2
	tsubcctv	%o3,	%i7,	%l4
loop_615:
	nop
	setx loop_616, %l0, %l1
	jmpl %l1, %g3
	fxors	%f15,	%f13,	%f1
	xnorcc	%l6,	%g1,	%i4
	fpsub16s	%f31,	%f14,	%f13
loop_616:
	orcc	%l5,	0x16B6,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g6,	%l3,	%o4
	tsubcctv	%i3,	%i0,	%g7
	fpack16	%f30,	%f4
	edge16	%g5,	%o7,	%o6
	tvc	%xcc,	0x6
	movre	%i5,	0x243,	%l0
	fmovd	%f12,	%f14
	movge	%xcc,	%o1,	%o2
	sethi	0x079F,	%g4
	set	0x5A, %o6
	ldsha	[%l7 + %o6] 0x18,	%o0
	srax	%o5,	%i2,	%i1
	ble,pt	%xcc,	loop_617
	ldub	[%l7 + 0x6F],	%g2
	bl,a,pn	%xcc,	loop_618
	movn	%xcc,	%l2,	%i6
loop_617:
	movl	%icc,	%o3,	%l4
	set	0x4C, %g4
	stba	%g3,	[%l7 + %g4] 0x81
loop_618:
	fmovs	%f8,	%f3
	tsubcctv	%i7,	0x12AB,	%l6
	fcmped	%fcc2,	%f18,	%f20
	fnot1s	%f3,	%f13
	tgu	%xcc,	0x7
	addccc	%g1,	0x17D9,	%l5
	edge8	%l1,	%g6,	%l3
	fmovsgu	%icc,	%f10,	%f12
	orn	%o4,	%i4,	%i3
	membar	0x6D
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x04,	%g7,	%g5
	membar	0x61
	movn	%xcc,	%o7,	%i0
	edge32ln	%o6,	%l0,	%i5
	fmovdcc	%xcc,	%f20,	%f17
	fmovse	%icc,	%f3,	%f8
	ldsh	[%l7 + 0x58],	%o2
	taddcctv	%g4,	0x1544,	%o0
	move	%xcc,	%o1,	%o5
	movrlez	%i2,	%g2,	%i1
	tl	%icc,	0x4
	edge32	%l2,	%i6,	%o3
	fmovsgu	%xcc,	%f18,	%f0
	edge32l	%g3,	%l4,	%i7
	edge32ln	%g1,	%l5,	%l1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l6,	%l3
	swap	[%l7 + 0x38],	%o4
	subcc	%i4,	0x0A63,	%g6
	bge,pt	%icc,	loop_619
	tne	%icc,	0x2
	fandnot2s	%f20,	%f28,	%f24
	srlx	%g7,	0x1F,	%i3
loop_619:
	nop
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x15
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x89,	%g5
	fbn	%fcc2,	loop_620
	fbl,a	%fcc0,	loop_621
	movg	%xcc,	%o7,	%i0
	nop
	setx	loop_622,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_620:
	sdiv	%o6,	0x19F6,	%l0
loop_621:
	brnz,a	%i5,	loop_623
	fmovsa	%xcc,	%f5,	%f27
loop_622:
	ldd	[%l7 + 0x40],	%o2
	movne	%icc,	%o0,	%g4
loop_623:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x2E] %asi,	%o1
	add	%o5,	%g2,	%i1
	fblg,a	%fcc2,	loop_624
	movrgz	%i2,	%i6,	%l2
	edge32l	%o3,	%g3,	%l4
	tne	%xcc,	0x3
loop_624:
	lduh	[%l7 + 0x1C],	%g1
	sethi	0x0E9F,	%i7
	fornot2s	%f18,	%f31,	%f17
	sethi	0x062C,	%l5
	set	0x08, %o1
	ldxa	[%l7 + %o1] 0x15,	%l1
	edge16	%l3,	%o4,	%l6
	srl	%g6,	0x15,	%g7
	movgu	%xcc,	%i3,	%g5
	mulx	%i4,	%o7,	%o6
	edge16n	%i0,	%l0,	%o2
	fcmpd	%fcc1,	%f26,	%f12
	edge16l	%o0,	%g4,	%o1
	movrne	%o5,	0x0D6,	%g2
	xorcc	%i5,	0x1F6C,	%i2
	bcc,a,pn	%icc,	loop_625
	sub	%i6,	%i1,	%o3
	orn	%l2,	%l4,	%g3
	fble	%fcc0,	loop_626
loop_625:
	fmovsvs	%icc,	%f5,	%f16
	bl,pt	%xcc,	loop_627
	andn	%g1,	0x009D,	%l5
loop_626:
	sllx	%l1,	0x0F,	%i7
	membar	0x7B
loop_627:
	sll	%o4,	0x1F,	%l6
	srlx	%g6,	0x13,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i3,	%g7,	%g5
	array16	%i4,	%o7,	%i0
	srax	%o6,	%l0,	%o2
	movleu	%icc,	%g4,	%o1
	fxnor	%f0,	%f28,	%f8
	and	%o0,	%g2,	%o5
	sth	%i2,	[%l7 + 0x72]
	fpadd32s	%f8,	%f16,	%f22
	fmuld8sux16	%f7,	%f25,	%f30
	fmovde	%xcc,	%f26,	%f27
	movvc	%xcc,	%i5,	%i1
	subc	%i6,	%o3,	%l4
	bleu,a	%xcc,	loop_628
	alignaddrl	%g3,	%g1,	%l2
	sethi	0x0C30,	%l1
	add	%i7,	%l5,	%o4
loop_628:
	movcs	%icc,	%g6,	%l3
	edge32n	%i3,	%g7,	%g5
	mova	%xcc,	%l6,	%i4
	srax	%o7,	0x11,	%o6
	sll	%i0,	0x17,	%l0
	tle	%xcc,	0x4
	movre	%o2,	0x206,	%g4
	faligndata	%f14,	%f30,	%f26
	fcmpgt16	%f2,	%f20,	%o1
	tsubcc	%o0,	%o5,	%g2
	srax	%i5,	%i2,	%i6
	sll	%i1,	0x02,	%o3
	orn	%l4,	%g1,	%g3
	tcs	%xcc,	0x5
	sdiv	%l1,	0x122F,	%l2
	set	0x78, %i6
	stwa	%i7,	[%l7 + %i6] 0x2a
	membar	#Sync
	alignaddrl	%o4,	%g6,	%l5
	xorcc	%i3,	%g7,	%g5
	add	%l6,	0x0486,	%i4
	andn	%o7,	0x113E,	%o6
	umulcc	%i0,	%l0,	%l3
	addcc	%g4,	%o1,	%o2
	orncc	%o5,	0x0144,	%o0
	fbne	%fcc2,	loop_629
	fbul,a	%fcc0,	loop_630
	bvs,a,pn	%icc,	loop_631
	popc	%g2,	%i2
loop_629:
	fmovrdlz	%i5,	%f8,	%f8
loop_630:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_631:
	fcmpeq32	%f2,	%f22,	%i1
	fmovrdlez	%i6,	%f22,	%f12
	bvc	loop_632
	orncc	%o3,	0x0116,	%g1
	tn	%xcc,	0x4
	array8	%l4,	%l1,	%l2
loop_632:
	fpadd16s	%f10,	%f29,	%f26
	tleu	%icc,	0x7
	fnors	%f20,	%f11,	%f1
	tsubcc	%i7,	%o4,	%g6
	bpos,a	%icc,	loop_633
	udiv	%l5,	0x005F,	%g3
	movvc	%xcc,	%i3,	%g7
	taddcctv	%l6,	0x0F5C,	%g5
loop_633:
	edge8l	%i4,	%o7,	%i0
	be,pn	%xcc,	loop_634
	movvs	%icc,	%o6,	%l3
	subcc	%g4,	%o1,	%l0
	movcs	%icc,	%o5,	%o0
loop_634:
	fmovsvc	%xcc,	%f29,	%f24
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%g2,	%o2
	alignaddrl	%i5,	%i2,	%i6
	fandnot2s	%f23,	%f23,	%f13
	subc	%o3,	0x0D57,	%g1
	fmul8x16	%f18,	%f20,	%f8
	fpadd16s	%f29,	%f28,	%f26
	movne	%xcc,	%l4,	%l1
	tne	%icc,	0x3
	sethi	0x057E,	%i1
	srl	%i7,	0x02,	%l2
	fmovrslz	%o4,	%f5,	%f28
	udiv	%g6,	0x1B3B,	%l5
	fbule	%fcc3,	loop_635
	fba,a	%fcc0,	loop_636
	sll	%g3,	0x11,	%i3
	ldstub	[%l7 + 0x5A],	%g7
loop_635:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
loop_636:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x22] %asi,	%i4
	movg	%xcc,	%g5,	%i0
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x4D] %asi,	%o7
	edge8n	%o6,	%g4,	%o1
	movrlz	%l3,	%o5,	%o0
	xnor	%l0,	%o2,	%i5
	fsrc1s	%f0,	%f22
	fmovs	%f5,	%f28
	alignaddrl	%g2,	%i2,	%o3
	subcc	%g1,	0x0979,	%l4
	fcmpeq32	%f8,	%f8,	%l1
	fcmple32	%f10,	%f4,	%i1
	bcc,a	%xcc,	loop_637
	movne	%icc,	%i6,	%i7
	fcmpeq32	%f18,	%f8,	%o4
	nop
	set	0x30, %l4
	std	%f16,	[%l7 + %l4]
loop_637:
	move	%icc,	%g6,	%l5
	movge	%icc,	%g3,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i3,	0x1549,	%l6
	tg	%xcc,	0x0
	edge16	%g7,	%g5,	%i0
	movcc	%xcc,	%o7,	%o6
	movrlez	%g4,	%o1,	%i4
	mulscc	%l3,	0x1235,	%o0
	fmovdgu	%icc,	%f6,	%f0
	tsubcctv	%l0,	0x1042,	%o2
	and	%o5,	0x1F59,	%i5
	fbue	%fcc2,	loop_638
	movgu	%icc,	%g2,	%o3
	tvs	%icc,	0x5
	te	%icc,	0x0
loop_638:
	fand	%f6,	%f30,	%f2
	tn	%xcc,	0x1
	nop
	setx loop_639, %l0, %l1
	jmpl %l1, %i2
	bn,a,pn	%icc,	loop_640
	movcs	%icc,	%g1,	%l4
	or	%i1,	%l1,	%i7
loop_639:
	subcc	%o4,	%i6,	%g6
loop_640:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	fmovdcc	%xcc,	%f23,	%f13
	ldstub	[%l7 + 0x18],	%l2
	fcmpd	%fcc1,	%f16,	%f8
	movrlz	%i3,	%l5,	%l6
	xor	%g7,	%g5,	%i0
	fxor	%f28,	%f24,	%f18
	fmovdvc	%xcc,	%f9,	%f15
	swap	[%l7 + 0x5C],	%o6
	fbuge	%fcc0,	loop_641
	edge32	%g4,	%o1,	%o7
	array16	%i4,	%o0,	%l0
	fmovdpos	%xcc,	%f28,	%f5
loop_641:
	smul	%l3,	%o2,	%i5
	fmovdvs	%icc,	%f3,	%f12
	movvc	%icc,	%g2,	%o3
	mova	%icc,	%o5,	%g1
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%l4
	edge16n	%i2,	%l1,	%i7
	bne,pn	%icc,	loop_642
	membar	0x6A
	movgu	%icc,	%o4,	%i1
	fand	%f22,	%f12,	%f30
loop_642:
	ldsw	[%l7 + 0x28],	%i6
	srl	%g3,	%l2,	%i3
	bcs,a,pn	%icc,	loop_643
	stbar
	fmul8sux16	%f12,	%f8,	%f20
	andcc	%g6,	%l6,	%g7
loop_643:
	bcs,pt	%xcc,	loop_644
	tg	%xcc,	0x6
	set	0x74, %o0
	stwa	%l5,	[%l7 + %o0] 0x11
loop_644:
	array16	%i0,	%g5,	%o6
	fbge	%fcc1,	loop_645
	movne	%xcc,	%o1,	%g4
	mulscc	%i4,	%o7,	%l0
	fones	%f19
loop_645:
	edge32l	%l3,	%o2,	%o0
	or	%g2,	%o3,	%o5
	bcc,a	%xcc,	loop_646
	movrgez	%i5,	%g1,	%i2
	srax	%l4,	0x06,	%l1
	std	%o4,	[%l7 + 0x78]
loop_646:
	tvs	%icc,	0x1
	sllx	%i1,	%i6,	%i7
	or	%l2,	%i3,	%g6
	fpmerge	%f6,	%f5,	%f24
	sir	0x159F
	set	0x3E, %l1
	stha	%l6,	[%l7 + %l1] 0x81
	movle	%icc,	%g7,	%l5
	mulscc	%g3,	0x0AD1,	%i0
	fpsub32s	%f29,	%f26,	%f19
	edge8n	%o6,	%o1,	%g5
	edge16	%g4,	%o7,	%l0
	addccc	%l3,	0x011A,	%o2
	edge32l	%i4,	%g2,	%o0
	movgu	%xcc,	%o3,	%o5
	nop
	set	0x68, %l6
	stx	%i5,	[%l7 + %l6]
	umulcc	%i2,	%g1,	%l4
	fmovrsgz	%o4,	%f3,	%f15
	fxors	%f13,	%f4,	%f17
	andncc	%l1,	%i1,	%i6
	popc	%i7,	%l2
	srax	%i3,	0x19,	%l6
	ldstub	[%l7 + 0x60],	%g7
	fornot1	%f18,	%f28,	%f28
	sdiv	%g6,	0x1D30,	%g3
	subc	%l5,	%i0,	%o6
	and	%g5,	%g4,	%o1
	fmovdge	%icc,	%f11,	%f20
	fcmple32	%f8,	%f4,	%o7
	edge8l	%l0,	%l3,	%i4
	xnor	%o2,	0x122F,	%o0
	membar	0x27
	fbo,a	%fcc0,	loop_647
	movpos	%xcc,	%g2,	%o5
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x18,	%f0
loop_647:
	movvs	%icc,	%i5,	%i2
	tg	%xcc,	0x1
	tge	%xcc,	0x6
	tgu	%icc,	0x6
	fpmerge	%f16,	%f11,	%f0
	popc	0x199A,	%g1
	bl,a	%xcc,	loop_648
	smulcc	%l4,	0x0C92,	%o4
	subc	%l1,	%i1,	%o3
	andcc	%i7,	%l2,	%i6
loop_648:
	movre	%i3,	%g7,	%l6
	fnot1	%f28,	%f10
	tn	%xcc,	0x0
	ldstub	[%l7 + 0x5D],	%g3
	set	0x55, %o4
	stba	%g6,	[%l7 + %o4] 0xe2
	membar	#Sync
	movrlz	%i0,	%o6,	%l5
	movgu	%xcc,	%g4,	%g5
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x65] %asi,	%o7
	edge8n	%l0,	%l3,	%o1
	umulcc	%o2,	%i4,	%g2
	bl,a	%icc,	loop_649
	movn	%xcc,	%o5,	%o0
	movrne	%i5,	%g1,	%l4
	nop
	setx	loop_650,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_649:
	ldx	[%l7 + 0x40],	%i2
	fmovrdgz	%o4,	%f12,	%f0
	ldx	[%l7 + 0x20],	%i1
loop_650:
	fmovrdlz	%o3,	%f2,	%f18
	tl	%xcc,	0x0
	movrlz	%i7,	0x2C6,	%l1
	bcs	%xcc,	loop_651
	fnot1	%f0,	%f10
	fmovd	%f6,	%f8
	addc	%i6,	%i3,	%g7
loop_651:
	edge32l	%l6,	%l2,	%g6
	addcc	%i0,	%o6,	%g3
	fbug	%fcc2,	loop_652
	sdivx	%l5,	0x10FB,	%g4
	mova	%icc,	%g5,	%l0
	tgu	%icc,	0x7
loop_652:
	movg	%icc,	%l3,	%o7
	fbug	%fcc3,	loop_653
	fbu,a	%fcc0,	loop_654
	sdivx	%o2,	0x0A8E,	%i4
	alignaddr	%o1,	%g2,	%o0
loop_653:
	fandnot1	%f4,	%f24,	%f14
loop_654:
	stb	%i5,	[%l7 + 0x52]
	taddcctv	%o5,	0x0BB2,	%g1
	umulcc	%i2,	%o4,	%i1
	fmul8x16au	%f9,	%f17,	%f24
	and	%l4,	0x0F7D,	%i7
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x16] %asi,	%o3
	subc	%i6,	0x1229,	%i3
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x04
	xnor	%l1,	0x0409,	%g7
	umul	%l6,	0x17DE,	%g6
	st	%f16,	[%l7 + 0x78]
	movl	%xcc,	%i0,	%o6
	and	%l2,	%l5,	%g3
	wr	%g0,	0x27,	%asi
	stba	%g5,	[%l7 + 0x7A] %asi
	membar	#Sync
	edge8	%g4,	%l3,	%l0
	movpos	%icc,	%o2,	%i4
	movle	%icc,	%o1,	%o7
	edge8l	%o0,	%g2,	%i5
	or	%o5,	0x09A0,	%g1
	array8	%i2,	%i1,	%o4
	fmul8x16au	%f2,	%f20,	%f14
	fba,a	%fcc3,	loop_655
	andncc	%l4,	%o3,	%i7
	movneg	%icc,	%i3,	%i6
	edge8ln	%l1,	%g7,	%l6
loop_655:
	fabsd	%f26,	%f30
	fpadd32	%f26,	%f12,	%f26
	movrgez	%g6,	0x359,	%i0
	movleu	%xcc,	%l2,	%o6
	fbe,a	%fcc2,	loop_656
	tg	%xcc,	0x3
	edge32ln	%g3,	%g5,	%l5
	bg,a,pt	%icc,	loop_657
loop_656:
	fnands	%f28,	%f31,	%f12
	tg	%xcc,	0x4
	edge8	%l3,	%g4,	%l0
loop_657:
	edge16l	%i4,	%o2,	%o7
	flush	%l7 + 0x38
	edge32ln	%o1,	%g2,	%o0
	fmovse	%icc,	%f31,	%f25
	tpos	%icc,	0x5
	xor	%o5,	0x0FB6,	%g1
	fzero	%f4
	set	0x60, %i4
	swapa	[%l7 + %i4] 0x88,	%i2
	bneg,a	loop_658
	fzero	%f16
	set	0x68, %l3
	ldswa	[%l7 + %l3] 0x10,	%i5
loop_658:
	tle	%icc,	0x6
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf8,	%f16
	andncc	%o4,	%i1,	%o3
	fmovsneg	%xcc,	%f15,	%f29
	fmovsl	%xcc,	%f22,	%f29
	array16	%l4,	%i7,	%i3
	bg,pt	%icc,	loop_659
	bgu,a,pt	%xcc,	loop_660
	tne	%xcc,	0x7
	movl	%icc,	%l1,	%g7
loop_659:
	edge8l	%l6,	%i6,	%g6
loop_660:
	fmovrsgz	%l2,	%f1,	%f29
	movneg	%icc,	%i0,	%o6
	xorcc	%g5,	%l5,	%l3
	fblg,a	%fcc2,	loop_661
	fnegd	%f28,	%f18
	movcs	%xcc,	%g3,	%g4
	ld	[%l7 + 0x70],	%f2
loop_661:
	membar	0x1A
	movpos	%icc,	%l0,	%o2
	move	%icc,	%o7,	%o1
	mulx	%g2,	%o0,	%i4
	and	%o5,	%g1,	%i2
	fbl,a	%fcc0,	loop_662
	stb	%i5,	[%l7 + 0x70]
	movleu	%xcc,	%i1,	%o4
	udivx	%o3,	0x0195,	%l4
loop_662:
	fmovrdlez	%i7,	%f6,	%f18
	ta	%icc,	0x2
	fmovd	%f20,	%f12
	popc	%i3,	%g7
	fmovdle	%icc,	%f31,	%f21
	srlx	%l1,	%l6,	%i6
	wr	%g0,	0x80,	%asi
	stba	%g6,	[%l7 + 0x67] %asi
	fbne	%fcc3,	loop_663
	fxor	%f10,	%f10,	%f30
	fbe,a	%fcc3,	loop_664
	array16	%l2,	%o6,	%i0
loop_663:
	fandnot1s	%f15,	%f17,	%f18
	bn,a,pt	%icc,	loop_665
loop_664:
	movvs	%icc,	%l5,	%l3
	ld	[%l7 + 0x60],	%f7
	xorcc	%g5,	0x022D,	%g4
loop_665:
	lduw	[%l7 + 0x38],	%l0
	movgu	%icc,	%o2,	%o7
	sir	0x172A
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x10,	%f16
	edge16ln	%o1,	%g2,	%g3
	sethi	0x0E0C,	%o0
	sdivcc	%o5,	0x193B,	%i4
	membar	0x68
	nop
	setx	loop_666,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrsgz	%g1,	%f19,	%f20
	fmovrdlez	%i5,	%f8,	%f22
	movrgez	%i2,	0x3CF,	%i1
loop_666:
	orncc	%o3,	0x0407,	%l4
	tneg	%icc,	0x2
	movvs	%xcc,	%i7,	%i3
	fabsd	%f8,	%f24
	addc	%o4,	%g7,	%l6
	fmul8sux16	%f0,	%f14,	%f26
	fabss	%f13,	%f0
	edge8	%i6,	%l1,	%l2
	fmovrsgz	%o6,	%f16,	%f25
	wr	%g0,	0xe3,	%asi
	stha	%i0,	[%l7 + 0x7A] %asi
	membar	#Sync
	fpadd16	%f12,	%f8,	%f12
	movcc	%icc,	%g6,	%l5
	edge16ln	%g5,	%l3,	%g4
	edge32n	%o2,	%o7,	%o1
	bpos,pt	%xcc,	loop_667
	fmovs	%f7,	%f14
	ldd	[%l7 + 0x70],	%f24
	movcs	%icc,	%g2,	%l0
loop_667:
	bvs,a	loop_668
	brlz	%o0,	loop_669
	movl	%icc,	%g3,	%i4
	movrlz	%g1,	%i5,	%i2
loop_668:
	fbg,a	%fcc0,	loop_670
loop_669:
	sub	%i1,	0x1CBE,	%o5
	sllx	%o3,	0x1D,	%l4
	movrne	%i7,	0x1F7,	%o4
loop_670:
	movl	%xcc,	%g7,	%i3
	fmovde	%icc,	%f24,	%f8
	tsubcctv	%i6,	0x0F0D,	%l1
	fbne	%fcc3,	loop_671
	movneg	%icc,	%l6,	%o6
	udivx	%l2,	0x0652,	%i0
	udivcc	%l5,	0x149B,	%g5
loop_671:
	and	%g6,	0x158D,	%l3
	fnegs	%f31,	%f11
	nop
	setx	loop_672,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdgz	%g4,	%f6,	%f16
	tsubcctv	%o2,	0x03FF,	%o1
	taddcctv	%o7,	%g2,	%o0
loop_672:
	fmovdleu	%xcc,	%f10,	%f31
	fxnor	%f22,	%f28,	%f4
	fmovspos	%xcc,	%f24,	%f8
	brgz	%g3,	loop_673
	fnand	%f16,	%f6,	%f4
	andcc	%i4,	%g1,	%i5
	call	loop_674
loop_673:
	movrlez	%l0,	0x1A5,	%i2
	tne	%xcc,	0x3
	fone	%f24
loop_674:
	array16	%o5,	%o3,	%i1
	call	loop_675
	fxor	%f28,	%f22,	%f30
	tsubcctv	%i7,	%o4,	%l4
	st	%f23,	[%l7 + 0x28]
loop_675:
	subcc	%i3,	0x0BDB,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x3
	edge32	%l1,	%l6,	%o6
	udiv	%g7,	0x1069,	%l2
	array16	%i0,	%g5,	%g6
	srlx	%l5,	%l3,	%g4
	xnorcc	%o2,	0x004A,	%o1
	alignaddrl	%o7,	%g2,	%o0
	fnegd	%f0,	%f26
	udivcc	%i4,	0x066A,	%g3
	xnorcc	%g1,	%l0,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o5,	%i2
	movleu	%icc,	%o3,	%i1
	tge	%xcc,	0x3
	brnz,a	%i7,	loop_676
	bl,pn	%icc,	loop_677
	sir	0x1750
	fmul8ulx16	%f28,	%f6,	%f14
loop_676:
	movpos	%icc,	%o4,	%i3
loop_677:
	fbge,a	%fcc0,	loop_678
	fornot2	%f26,	%f18,	%f24
	call	loop_679
	movrgz	%i6,	0x16C,	%l1
loop_678:
	alignaddrl	%l6,	%l4,	%g7
	fcmpne32	%f4,	%f16,	%l2
loop_679:
	fcmpd	%fcc1,	%f12,	%f18
	sdivcc	%o6,	0x0D89,	%i0
	movvc	%icc,	%g6,	%g5
	addcc	%l3,	%g4,	%o2
	orn	%o1,	0x091B,	%l5
	stbar
	edge32n	%o7,	%g2,	%o0
	edge16	%g3,	%i4,	%g1
	fbo,a	%fcc0,	loop_680
	fcmple32	%f26,	%f14,	%l0
	tl	%icc,	0x0
	tcc	%xcc,	0x5
loop_680:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%i2
	fors	%f28,	%f18,	%f4
	be	loop_681
	nop
	set	0x1E, %i0
	sth	%o5,	[%l7 + %i0]
	movre	%o3,	%i1,	%o4
	ldsw	[%l7 + 0x6C],	%i7
loop_681:
	movcc	%xcc,	%i6,	%l1
	addccc	%l6,	%i3,	%l4
	movcs	%xcc,	%g7,	%o6
	xorcc	%l2,	%g6,	%i0
	fmul8x16al	%f16,	%f9,	%f16
	te	%icc,	0x1
	sub	%g5,	0x0794,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g4,	%o2,	%l5
	brz	%o1,	loop_682
	bvs,a	loop_683
	fmovdpos	%icc,	%f26,	%f16
	movge	%xcc,	%g2,	%o0
loop_682:
	movg	%icc,	%g3,	%o7
loop_683:
	fpackfix	%f16,	%f17
	tleu	%xcc,	0x5
	movrlez	%i4,	%l0,	%g1
	fnot1	%f30,	%f22
	fsrc2	%f10,	%f12
	orncc	%i5,	0x08AC,	%i2
	edge32	%o5,	%o3,	%o4
	bcs,a,pn	%xcc,	loop_684
	mulscc	%i1,	%i6,	%l1
	fxor	%f6,	%f12,	%f0
	movrlez	%l6,	0x1EC,	%i3
loop_684:
	tgu	%xcc,	0x5
	ldd	[%l7 + 0x10],	%f8
	fmovdn	%icc,	%f0,	%f18
	tvs	%xcc,	0x1
	andn	%i7,	%l4,	%o6
	fbule	%fcc0,	loop_685
	movvc	%icc,	%l2,	%g7
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x35] %asi,	%i0
loop_685:
	brz,a	%g5,	loop_686
	ble,a	%xcc,	loop_687
	fmovsl	%xcc,	%f21,	%f22
	bpos,pn	%xcc,	loop_688
loop_686:
	taddcctv	%g6,	%g4,	%o2
loop_687:
	fpsub32s	%f5,	%f2,	%f28
	fmul8x16au	%f7,	%f13,	%f18
loop_688:
	membar	0x05
	edge16ln	%l5,	%l3,	%o1
	sllx	%o0,	%g3,	%o7
	addcc	%g2,	%l0,	%i4
	fmuld8sux16	%f27,	%f11,	%f18
	subcc	%g1,	0x134A,	%i2
	sdivx	%i5,	0x00E8,	%o5
	fabss	%f20,	%f26
	edge8l	%o3,	%i1,	%i6
	subc	%l1,	%l6,	%i3
	fbe,a	%fcc1,	loop_689
	fmuld8sux16	%f24,	%f1,	%f6
	edge8l	%o4,	%i7,	%l4
	ta	%icc,	0x6
loop_689:
	fmovrsgez	%l2,	%f7,	%f11
	movcs	%icc,	%g7,	%o6
	ldx	[%l7 + 0x20],	%g5
	edge16l	%i0,	%g6,	%o2
	mulx	%l5,	%g4,	%l3
	movgu	%xcc,	%o1,	%o0
	edge16	%g3,	%g2,	%l0
	tl	%xcc,	0x3
	movn	%icc,	%o7,	%i4
	tsubcc	%i2,	0x1DB6,	%g1
	ldsw	[%l7 + 0x10],	%o5
	fbule	%fcc1,	loop_690
	xnor	%o3,	0x032B,	%i1
	std	%f0,	[%l7 + 0x18]
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3C] %asi,	%i6
loop_690:
	smul	%i5,	%l1,	%i3
	bgu,a,pt	%icc,	loop_691
	movpos	%xcc,	%l6,	%o4
	taddcctv	%l4,	0x0B3A,	%l2
	umulcc	%g7,	0x0187,	%o6
loop_691:
	sdivcc	%i7,	0x0BCB,	%i0
	edge8n	%g6,	%g5,	%o2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x50] %asi,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x40
	orncc	%l3,	0x0020,	%o1
	tvs	%xcc,	0x1
	movne	%xcc,	%o0,	%g4
	bleu,pn	%icc,	loop_692
	and	%g3,	0x0088,	%l0
	set	0x50, %i2
	stda	%o6,	[%l7 + %i2] 0x19
loop_692:
	fbe	%fcc3,	loop_693
	tleu	%xcc,	0x3
	fmovsne	%icc,	%f25,	%f17
	movn	%icc,	%g2,	%i4
loop_693:
	fbl,a	%fcc2,	loop_694
	fcmpgt32	%f18,	%f0,	%i2
	movcs	%icc,	%g1,	%o3
	fcmped	%fcc0,	%f26,	%f30
loop_694:
	fornot2s	%f1,	%f0,	%f7
	ldub	[%l7 + 0x75],	%i1
	sdiv	%o5,	0x0C70,	%i6
	movge	%xcc,	%l1,	%i5
	taddcctv	%i3,	0x12A7,	%o4
	lduh	[%l7 + 0x22],	%l6
	fbne	%fcc3,	loop_695
	movle	%icc,	%l2,	%l4
	movle	%icc,	%g7,	%o6
	alignaddrl	%i0,	%g6,	%i7
loop_695:
	fcmple16	%f28,	%f10,	%o2
	smulcc	%g5,	0x0246,	%l5
	tl	%xcc,	0x3
	siam	0x7
	fandnot2s	%f16,	%f23,	%f8
	fzeros	%f24
	movpos	%xcc,	%o1,	%l3
	tle	%xcc,	0x5
	sir	0x1014
	fcmpes	%fcc3,	%f18,	%f10
	fcmpd	%fcc3,	%f30,	%f30
	movleu	%xcc,	%o0,	%g4
	fmovspos	%icc,	%f3,	%f4
	andcc	%g3,	0x19FF,	%l0
	addc	%o7,	0x1331,	%g2
	addccc	%i4,	0x0D3E,	%i2
	and	%o3,	0x07A5,	%g1
	set	0x64, %g3
	swapa	[%l7 + %g3] 0x81,	%i1
	fbg,a	%fcc1,	loop_696
	movneg	%xcc,	%i6,	%o5
	movrgz	%i5,	%i3,	%o4
	tpos	%xcc,	0x6
loop_696:
	ldsw	[%l7 + 0x20],	%l6
	stw	%l1,	[%l7 + 0x44]
	fbule	%fcc3,	loop_697
	tleu	%icc,	0x2
	tleu	%xcc,	0x2
	fcmps	%fcc0,	%f31,	%f5
loop_697:
	ta	%xcc,	0x0
	swap	[%l7 + 0x38],	%l2
	te	%icc,	0x4
	brnz	%l4,	loop_698
	movcs	%xcc,	%o6,	%g7
	fmovrse	%i0,	%f22,	%f22
	fbule,a	%fcc1,	loop_699
loop_698:
	fmovscc	%icc,	%f6,	%f1
	mova	%xcc,	%i7,	%o2
	movvc	%xcc,	%g5,	%l5
loop_699:
	alignaddr	%o1,	%l3,	%o0
	addccc	%g4,	%g3,	%g6
	tcc	%xcc,	0x6
	array32	%o7,	%g2,	%i4
	edge32n	%l0,	%i2,	%o3
	tgu	%icc,	0x0
	tg	%icc,	0x4
	fmovrse	%i1,	%f15,	%f25
	std	%f12,	[%l7 + 0x08]
	fpsub16	%f16,	%f28,	%f4
	ldx	[%l7 + 0x78],	%i6
	movgu	%icc,	%o5,	%g1
	taddcctv	%i3,	0x01B3,	%o4
	srax	%l6,	%l1,	%i5
	sll	%l4,	%l2,	%g7
	fmovsne	%icc,	%f4,	%f5
	edge8l	%o6,	%i7,	%o2
	fmovdvs	%icc,	%f0,	%f28
	movpos	%icc,	%i0,	%l5
	andn	%o1,	%g5,	%o0
	ldub	[%l7 + 0x3B],	%l3
	andn	%g4,	%g3,	%o7
	call	loop_700
	movn	%icc,	%g6,	%i4
	fornot1	%f8,	%f12,	%f24
	movrgz	%l0,	0x27A,	%g2
loop_700:
	tsubcc	%i2,	%o3,	%i1
	movcc	%xcc,	%o5,	%i6
	smulcc	%i3,	0x16B6,	%g1
	wr	%g0,	0x10,	%asi
	sta	%f12,	[%l7 + 0x14] %asi
	mulscc	%o4,	0x06CE,	%l6
	bge	loop_701
	brnz	%l1,	loop_702
	sll	%l4,	0x18,	%l2
	sir	0x15E6
loop_701:
	tle	%icc,	0x2
loop_702:
	fmovde	%xcc,	%f22,	%f0
	edge16	%g7,	%i5,	%o6
	fmovde	%xcc,	%f30,	%f28
	fmovsvc	%xcc,	%f13,	%f10
	movle	%xcc,	%i7,	%o2
	movrlez	%l5,	%o1,	%i0
	nop
	set	0x38, %g6
	lduh	[%l7 + %g6],	%g5
	tvs	%icc,	0x3
	addccc	%o0,	0x0B12,	%l3
	fmovsle	%icc,	%f17,	%f23
	array16	%g4,	%o7,	%g3
	mulscc	%g6,	%l0,	%g2
	movrlez	%i2,	0x227,	%o3
	fandnot2s	%f6,	%f16,	%f5
	movneg	%xcc,	%i4,	%i1
	set	0x6E, %g5
	stha	%o5,	[%l7 + %g5] 0x15
	bg,a,pt	%icc,	loop_703
	edge16ln	%i3,	%i6,	%g1
	fcmple32	%f16,	%f10,	%o4
	fnors	%f15,	%f4,	%f9
loop_703:
	subc	%l6,	%l4,	%l2
	te	%icc,	0x3
	sir	0x0EA1
	edge8l	%l1,	%g7,	%o6
	bg,pn	%xcc,	loop_704
	fmovrsgz	%i5,	%f17,	%f9
	set	0x48, %o3
	lda	[%l7 + %o3] 0x10,	%f2
loop_704:
	andn	%o2,	0x08C4,	%l5
	bge,a	%icc,	loop_705
	movge	%icc,	%o1,	%i7
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g5
loop_705:
	taddcc	%o0,	%i0,	%l3
	fmul8x16al	%f30,	%f25,	%f20
	movge	%xcc,	%o7,	%g4
	xnor	%g6,	0x1A85,	%g3
	movrgz	%g2,	0x007,	%i2
	taddcc	%l0,	%i4,	%o3
	movcc	%xcc,	%o5,	%i3
	fbuge,a	%fcc3,	loop_706
	srl	%i1,	0x0D,	%g1
	movgu	%xcc,	%o4,	%i6
	lduw	[%l7 + 0x6C],	%l6
loop_706:
	sdivcc	%l2,	0x1D7D,	%l4
	xor	%g7,	%l1,	%o6
	fsrc1	%f18,	%f14
	tsubcctv	%o2,	%l5,	%o1
	fbg,a	%fcc3,	loop_707
	fxors	%f19,	%f26,	%f1
	ld	[%l7 + 0x50],	%f11
	srax	%i7,	0x11,	%g5
loop_707:
	srlx	%i5,	%i0,	%l3
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x70] %asi,	%o7
	movleu	%xcc,	%g4,	%g6
	fba	%fcc3,	loop_708
	fpmerge	%f23,	%f2,	%f22
	movcs	%icc,	%o0,	%g2
	movrgez	%i2,	%g3,	%i4
loop_708:
	sdiv	%l0,	0x14C7,	%o3
	taddcc	%i3,	%i1,	%o5
	movgu	%icc,	%o4,	%i6
	tgu	%xcc,	0x5
	tl	%icc,	0x0
	edge32ln	%g1,	%l6,	%l4
	te	%icc,	0x3
	bpos,pn	%xcc,	loop_709
	popc	%l2,	%g7
	edge8	%o6,	%o2,	%l1
	fcmps	%fcc2,	%f18,	%f4
loop_709:
	tleu	%icc,	0x1
	edge8n	%o1,	%i7,	%g5
	edge32n	%l5,	%i5,	%i0
	prefetch	[%l7 + 0x74],	 0x0
	alignaddrl	%o7,	%g4,	%g6
	set	0x4E, %i3
	ldsba	[%l7 + %i3] 0x80,	%o0
	fmovd	%f12,	%f10
	set	0x58, %g1
	stxa	%g2,	[%l7 + %g1] 0x10
	fmovrsgz	%l3,	%f29,	%f4
	movrgz	%i2,	%i4,	%l0
	fmovsvs	%icc,	%f9,	%f4
	fmovrslez	%o3,	%f24,	%f19
	edge32l	%g3,	%i3,	%o5
	tvc	%icc,	0x3
	srax	%o4,	%i1,	%i6
	edge16n	%g1,	%l4,	%l2
	alignaddr	%l6,	%o6,	%g7
	stb	%l1,	[%l7 + 0x1A]
	fmovdcs	%icc,	%f7,	%f11
	lduw	[%l7 + 0x54],	%o2
	movgu	%xcc,	%o1,	%i7
	edge32l	%l5,	%g5,	%i0
	edge8	%o7,	%g4,	%i5
	tneg	%icc,	0x7
	fmovrslez	%g6,	%f12,	%f4
	movre	%g2,	0x265,	%o0
	fmovdgu	%xcc,	%f4,	%f13
	orn	%l3,	0x1EDE,	%i4
	edge8l	%l0,	%i2,	%g3
	taddcctv	%o3,	%o5,	%i3
	fmovsg	%xcc,	%f24,	%f10
	set	0x7C, %o2
	lduwa	[%l7 + %o2] 0x89,	%i1
	tsubcctv	%o4,	%i6,	%l4
	fmovdcc	%icc,	%f0,	%f2
	smulcc	%g1,	%l6,	%l2
	sra	%g7,	0x08,	%o6
	andncc	%l1,	%o2,	%i7
	tsubcc	%o1,	%g5,	%i0
	mova	%xcc,	%o7,	%l5
	udivx	%i5,	0x1AE8,	%g4
	brgez	%g2,	loop_710
	stw	%g6,	[%l7 + 0x44]
	array32	%l3,	%i4,	%l0
	fmovrdgez	%i2,	%f8,	%f4
loop_710:
	movcs	%xcc,	%g3,	%o3
	array16	%o5,	%i3,	%i1
	stw	%o0,	[%l7 + 0x3C]
	tvc	%icc,	0x0
	tleu	%xcc,	0x2
	tne	%xcc,	0x1
	smul	%i6,	0x0775,	%o4
	movg	%xcc,	%g1,	%l6
	smul	%l2,	%g7,	%o6
	edge32l	%l4,	%o2,	%i7
	fmovspos	%icc,	%f25,	%f24
	movvs	%icc,	%o1,	%l1
	movn	%xcc,	%i0,	%g5
	bgu	loop_711
	fbe	%fcc0,	loop_712
	smulcc	%l5,	%o7,	%g4
	fmovde	%icc,	%f3,	%f7
loop_711:
	fbul,a	%fcc1,	loop_713
loop_712:
	edge8	%g2,	%g6,	%l3
	fbne	%fcc1,	loop_714
	smul	%i4,	%l0,	%i5
loop_713:
	xorcc	%g3,	%o3,	%i2
	and	%i3,	%o5,	%i1
loop_714:
	te	%icc,	0x3
	edge8l	%o0,	%o4,	%i6
	movneg	%icc,	%l6,	%g1
	bvc,pn	%xcc,	loop_715
	sllx	%g7,	0x0B,	%l2
	fbn	%fcc2,	loop_716
	tsubcctv	%l4,	%o2,	%i7
loop_715:
	ldub	[%l7 + 0x2D],	%o6
	bleu,a	%xcc,	loop_717
loop_716:
	fmovdleu	%icc,	%f17,	%f11
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x30] %asi,	%o1
loop_717:
	fmovsg	%xcc,	%f28,	%f1
	mulx	%i0,	0x176D,	%g5
	movneg	%xcc,	%l1,	%o7
	tg	%xcc,	0x3
	fandnot2s	%f3,	%f21,	%f4
	move	%icc,	%g4,	%g2
	ba,a	loop_718
	fmovsleu	%xcc,	%f29,	%f26
	nop
	setx	loop_719,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulx	%l5,	0x1127,	%g6
loop_718:
	sub	%i4,	%l0,	%i5
	movvc	%xcc,	%l3,	%g3
loop_719:
	fmovsge	%icc,	%f1,	%f22
	edge16ln	%o3,	%i3,	%o5
	edge16	%i2,	%i1,	%o0
	edge32l	%i6,	%o4,	%g1
	tge	%icc,	0x1
	fbo	%fcc3,	loop_720
	edge32l	%l6,	%g7,	%l2
	fornot2s	%f4,	%f28,	%f27
	brlez,a	%o2,	loop_721
loop_720:
	fbe	%fcc2,	loop_722
	movcc	%xcc,	%i7,	%o6
	andn	%l4,	0x0254,	%o1
loop_721:
	and	%i0,	%g5,	%l1
loop_722:
	fnegd	%f12,	%f2
	fbn	%fcc2,	loop_723
	addcc	%g4,	0x089D,	%o7
	for	%f18,	%f16,	%f2
	mulx	%l5,	%g2,	%g6
loop_723:
	ldsw	[%l7 + 0x28],	%l0
	movneg	%icc,	%i4,	%l3
	tgu	%icc,	0x3
	fcmple16	%f26,	%f0,	%g3
	add	%i5,	%o3,	%o5
	smul	%i3,	%i1,	%o0
	tgu	%xcc,	0x2
	fbe,a	%fcc1,	loop_724
	xnorcc	%i6,	0x019E,	%o4
	tvs	%xcc,	0x0
	tsubcctv	%i2,	0x1944,	%g1
loop_724:
	ldub	[%l7 + 0x57],	%g7
	brnz	%l2,	loop_725
	fcmpd	%fcc1,	%f4,	%f24
	fxnor	%f2,	%f10,	%f6
	ldd	[%l7 + 0x28],	%f28
loop_725:
	te	%icc,	0x3
	taddcc	%o2,	0x0A24,	%l6
	movvc	%xcc,	%i7,	%o6
	movcs	%icc,	%o1,	%i0
	array16	%l4,	%l1,	%g4
	movvc	%icc,	%o7,	%l5
	fxors	%f29,	%f6,	%f2
	fandnot2s	%f14,	%f0,	%f30
	xor	%g2,	0x0347,	%g5
	fabss	%f7,	%f12
	movneg	%xcc,	%g6,	%l0
	stbar
	popc	0x1115,	%l3
	sir	0x178D
	fcmple16	%f14,	%f20,	%i4
	edge8n	%g3,	%i5,	%o5
	tcc	%icc,	0x5
	set	0x10, %o7
	stda	%o2,	[%l7 + %o7] 0x04
	tvs	%icc,	0x1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	membar	0x02
	movgu	%icc,	%o0,	%i6
	or	%i1,	%i2,	%g1
	movvc	%icc,	%o4,	%l2
	fsrc2	%f2,	%f30
	bge	loop_726
	fandnot1	%f18,	%f24,	%f14
	tgu	%xcc,	0x4
	edge8ln	%g7,	%o2,	%i7
loop_726:
	ldsb	[%l7 + 0x5B],	%o6
	tvc	%icc,	0x5
	array32	%l6,	%i0,	%l4
	bgu,a	loop_727
	fandnot1	%f20,	%f8,	%f28
	fmovrslez	%l1,	%f1,	%f24
	edge8	%g4,	%o7,	%l5
loop_727:
	movleu	%xcc,	%o1,	%g2
	set	0x20, %o5
	ldswa	[%l7 + %o5] 0x81,	%g5
	alignaddrl	%l0,	%g6,	%i4
	fmul8ulx16	%f28,	%f6,	%f6
	ta	%icc,	0x3
	movrlez	%l3,	0x20C,	%g3
	tvc	%xcc,	0x0
	fbue	%fcc1,	loop_728
	tleu	%icc,	0x7
	tcc	%icc,	0x4
	movrlez	%i5,	%o5,	%i3
loop_728:
	addc	%o3,	%i6,	%i1
	call	loop_729
	faligndata	%f20,	%f18,	%f6
	array16	%i2,	%g1,	%o0
	mulx	%o4,	0x118A,	%g7
loop_729:
	udivx	%l2,	0x0DE9,	%o2
	edge8l	%o6,	%l6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f21,	%f12,	%f6
	sll	%l4,	%l1,	%i7
	ldsw	[%l7 + 0x5C],	%g4
	bcc,a,pt	%icc,	loop_730
	movpos	%xcc,	%l5,	%o7
	add	%g2,	0x0FC0,	%g5
	or	%l0,	%g6,	%i4
loop_730:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f14,	%f28,	%f11
	bleu,a	%xcc,	loop_731
	addcc	%l3,	%g3,	%i5
	tleu	%icc,	0x4
	umul	%o1,	0x1D90,	%o5
loop_731:
	movge	%icc,	%i3,	%i6
	fbn	%fcc3,	loop_732
	tcs	%xcc,	0x6
	fbe,a	%fcc0,	loop_733
	edge16l	%o3,	%i2,	%i1
loop_732:
	fpack16	%f0,	%f1
	stbar
loop_733:
	edge32ln	%o0,	%o4,	%g7
	alignaddrl	%g1,	%o2,	%o6
	or	%l2,	0x0AB5,	%i0
	fnors	%f15,	%f3,	%f11
	fbg	%fcc1,	loop_734
	fexpand	%f11,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0AD0,	%l6
loop_734:
	bl	%xcc,	loop_735
	ba	loop_736
	udivcc	%l1,	0x1120,	%i7
	membar	0x55
loop_735:
	edge32ln	%l4,	%l5,	%o7
loop_736:
	edge32n	%g2,	%g4,	%g5
	prefetch	[%l7 + 0x74],	 0x0
	movne	%xcc,	%l0,	%i4
	addc	%g6,	%l3,	%g3
	udivx	%i5,	0x15D4,	%o1
	fbuge,a	%fcc3,	loop_737
	alignaddr	%i3,	%i6,	%o5
	movrgz	%o3,	0x07F,	%i1
	array32	%o0,	%o4,	%i2
loop_737:
	orn	%g1,	0x1285,	%g7
	fbn,a	%fcc2,	loop_738
	fpack16	%f6,	%f29
	umulcc	%o2,	0x149E,	%o6
	movrlz	%l2,	0x377,	%i0
loop_738:
	edge32	%l1,	%i7,	%l6
	xnorcc	%l4,	0x06C0,	%l5
	fmovrdgz	%o7,	%f8,	%f4
	udivcc	%g2,	0x0639,	%g4
	sra	%l0,	%g5,	%i4
	popc	0x0063,	%l3
	fmovdl	%xcc,	%f1,	%f9
	orcc	%g3,	%i5,	%g6
	tcs	%icc,	0x3
	fblg,a	%fcc3,	loop_739
	fbge,a	%fcc2,	loop_740
	fbu,a	%fcc0,	loop_741
	te	%icc,	0x1
loop_739:
	fblg,a	%fcc3,	loop_742
loop_740:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_741:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_742:
	be,pt	%icc,	loop_743
	sdiv	%i3,	0x0A5D,	%i6
	tcc	%xcc,	0x7
	set	0x7C, %i5
	lduha	[%l7 + %i5] 0x15,	%o5
loop_743:
	fmuld8ulx16	%f24,	%f21,	%f26
	movl	%xcc,	%o3,	%o1
	sdiv	%i1,	0x1681,	%o4
	fbue	%fcc1,	loop_744
	fmovdleu	%icc,	%f17,	%f12
	edge32l	%i2,	%g1,	%o0
	nop
	setx	loop_745,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_744:
	fmovdle	%xcc,	%f19,	%f27
	wr	%g0,	0x11,	%asi
	stwa	%g7,	[%l7 + 0x68] %asi
loop_745:
	movn	%icc,	%o2,	%l2
	ldub	[%l7 + 0x4D],	%i0
	bgu,a	%icc,	loop_746
	sllx	%o6,	0x1F,	%l1
	subcc	%i7,	%l6,	%l5
	ba,pn	%icc,	loop_747
loop_746:
	stx	%l4,	[%l7 + 0x20]
	std	%o6,	[%l7 + 0x70]
	xnor	%g2,	0x0E62,	%g4
loop_747:
	tsubcc	%g5,	0x019B,	%l0
	sll	%l3,	%i4,	%g3
	move	%xcc,	%g6,	%i3
	bvc	%icc,	loop_748
	stbar
	bvs	loop_749
	sdivx	%i5,	0x1E38,	%i6
loop_748:
	fmovdvs	%xcc,	%f8,	%f22
	sdivcc	%o3,	0x043E,	%o5
loop_749:
	fnands	%f24,	%f11,	%f2
	subcc	%i1,	%o1,	%o4
	popc	0x138C,	%i2
	subcc	%o0,	%g1,	%o2
	nop
	set	0x14, %l5
	prefetch	[%l7 + %l5],	 0x2
	bvs,pt	%xcc,	loop_750
	tne	%xcc,	0x0
	bshuffle	%f2,	%f24,	%f0
	alignaddr	%g7,	%i0,	%l2
loop_750:
	add	%l1,	0x0B97,	%i7
	udivx	%o6,	0x0316,	%l5
	fbe,a	%fcc3,	loop_751
	umulcc	%l6,	%o7,	%l4
	tl	%xcc,	0x2
	orcc	%g4,	0x0300,	%g2
loop_751:
	brnz,a	%l0,	loop_752
	fpadd32s	%f19,	%f11,	%f10
	bcs,a,pt	%xcc,	loop_753
	edge8l	%l3,	%i4,	%g3
loop_752:
	srl	%g5,	0x07,	%i3
	xnorcc	%i5,	%i6,	%o3
loop_753:
	nop
	set	0x48, %o6
	lda	[%l7 + %o6] 0x88,	%f24
	fnand	%f4,	%f10,	%f8
	andn	%o5,	0x0CE3,	%g6
	alignaddrl	%o1,	%o4,	%i2
	taddcctv	%o0,	%i1,	%o2
	fmovsgu	%icc,	%f20,	%f31
	fbg	%fcc1,	loop_754
	movneg	%xcc,	%g7,	%g1
	swap	[%l7 + 0x3C],	%l2
	fmovs	%f23,	%f2
loop_754:
	ta	%icc,	0x5
	movl	%icc,	%i0,	%i7
	movneg	%icc,	%o6,	%l1
	movleu	%icc,	%l6,	%o7
	array16	%l5,	%g4,	%l4
	movrlz	%g2,	0x264,	%l3
	movre	%i4,	%l0,	%g5
	movvs	%icc,	%g3,	%i5
	and	%i6,	0x1D21,	%i3
	bshuffle	%f14,	%f20,	%f18
	brlz	%o5,	loop_755
	sllx	%o3,	%g6,	%o4
	srax	%i2,	0x17,	%o1
	nop
	setx	loop_756,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_755:
	udivx	%i1,	0x1E57,	%o0
	movn	%xcc,	%g7,	%o2
	sir	0x0BB8
loop_756:
	sll	%l2,	0x09,	%g1
	fcmpne16	%f0,	%f18,	%i7
	tpos	%xcc,	0x0
	movre	%i0,	%o6,	%l6
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l1
	umulcc	%l5,	%o7,	%l4
	prefetch	[%l7 + 0x60],	 0x1
	fnands	%f25,	%f12,	%f21
	fcmpeq32	%f2,	%f30,	%g4
	brlez	%l3,	loop_757
	movcc	%xcc,	%g2,	%l0
	fblg	%fcc0,	loop_758
	fbule	%fcc1,	loop_759
loop_757:
	ldd	[%l7 + 0x48],	%f0
	edge16l	%g5,	%g3,	%i5
loop_758:
	nop
	set	0x5E, %g2
	stha	%i6,	[%l7 + %g2] 0x22
	membar	#Sync
loop_759:
	tn	%icc,	0x2
	xnor	%i3,	0x03DA,	%o5
	srl	%i4,	%g6,	%o3
	subccc	%o4,	%i2,	%i1
	srax	%o1,	%g7,	%o0
	movneg	%icc,	%o2,	%l2
	tcc	%icc,	0x3
	edge16l	%i7,	%g1,	%i0
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	udiv	%l6,	0x06F9,	%o6
	tg	%xcc,	0x2
	fpack32	%f14,	%f16,	%f24
	movvc	%icc,	%l5,	%l1
	pdist	%f16,	%f22,	%f8
	andn	%o7,	0x0668,	%g4
	orncc	%l4,	%g2,	%l0
	movcs	%icc,	%l3,	%g5
	sdiv	%i5,	0x0AED,	%g3
	ta	%xcc,	0x5
	array16	%i3,	%i6,	%o5
	fmovsleu	%icc,	%f28,	%f30
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x0A] %asi,	%i4
	fmovs	%f5,	%f26
	membar	0x1A
	smulcc	%o3,	0x0704,	%g6
	movre	%i2,	0x0E0,	%o4
	brgez,a	%o1,	loop_760
	movl	%xcc,	%g7,	%i1
	fmovdge	%icc,	%f19,	%f1
	udivcc	%o0,	0x08FC,	%l2
loop_760:
	fpack32	%f20,	%f16,	%f30
	te	%icc,	0x5
	fmovscs	%icc,	%f10,	%f13
	addcc	%i7,	%o2,	%g1
	addc	%i0,	%o6,	%l6
	fmovdvc	%icc,	%f22,	%f12
	ta	%icc,	0x3
	fmovdgu	%icc,	%f9,	%f9
	brgez	%l5,	loop_761
	movpos	%xcc,	%o7,	%l1
	udivcc	%g4,	0x090A,	%g2
	fmul8x16al	%f14,	%f19,	%f22
loop_761:
	taddcctv	%l4,	%l0,	%l3
	fbue,a	%fcc2,	loop_762
	udivx	%g5,	0x0ECC,	%i5
	bcc	%xcc,	loop_763
	and	%i3,	0x1F40,	%g3
loop_762:
	fpsub16s	%f31,	%f22,	%f23
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_763:
	siam	0x1
	array8	%i6,	%o5,	%o3
	movg	%icc,	%i4,	%i2
	edge32	%o4,	%o1,	%g6
	sth	%i1,	[%l7 + 0x14]
	tsubcctv	%o0,	%g7,	%l2
	movvc	%icc,	%o2,	%g1
	tsubcctv	%i0,	0x05BB,	%o6
	tcc	%xcc,	0x5
	sra	%i7,	0x1B,	%l6
	nop
	setx	loop_764,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%l5,	0x06C7,	%l1
	ta	%xcc,	0x4
	fpadd32	%f14,	%f0,	%f0
loop_764:
	sllx	%g4,	0x19,	%g2
	smulcc	%o7,	%l4,	%l3
	fbo	%fcc3,	loop_765
	sllx	%l0,	0x1D,	%i5
	fbg	%fcc1,	loop_766
	add	%i3,	0x176F,	%g3
loop_765:
	subcc	%i6,	%g5,	%o3
	te	%xcc,	0x7
loop_766:
	te	%xcc,	0x1
	smul	%i4,	0x1D39,	%i2
	xor	%o5,	0x07B9,	%o1
	fpadd32s	%f29,	%f21,	%f21
	fmovsle	%icc,	%f3,	%f4
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x22] %asi,	%g6
	sdivx	%i1,	0x0B78,	%o4
	set	0x64, %g4
	stwa	%o0,	[%l7 + %g4] 0x19
	edge8ln	%l2,	%o2,	%g7
	sdivx	%i0,	0x0321,	%g1
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x210] %asi,	%i7
	ldub	[%l7 + 0x74],	%l6
	mulscc	%o6,	%l1,	%l5
	movn	%icc,	%g4,	%g2
	movrlez	%l4,	%o7,	%l0
	subc	%l3,	0x04F4,	%i5
	taddcc	%g3,	0x00C8,	%i3
	udivx	%i6,	0x1084,	%g5
	movgu	%icc,	%i4,	%i2
	fbg	%fcc2,	loop_767
	smul	%o5,	%o1,	%o3
	fsrc1	%f22,	%f0
	edge32n	%i1,	%o4,	%g6
loop_767:
	addcc	%l2,	%o2,	%o0
	edge32n	%g7,	%g1,	%i7
	bg,pn	%xcc,	loop_768
	srlx	%l6,	%i0,	%l1
	tsubcctv	%l5,	%o6,	%g2
	orcc	%g4,	%o7,	%l4
loop_768:
	taddcc	%l0,	0x046B,	%l3
	xor	%g3,	0x1367,	%i3
	te	%xcc,	0x5
	orn	%i5,	%i6,	%i4
	orcc	%i2,	%o5,	%g5
	tneg	%xcc,	0x5
	movn	%xcc,	%o3,	%o1
	udivcc	%o4,	0x1764,	%g6
	array8	%l2,	%i1,	%o0
	alignaddrl	%o2,	%g1,	%g7
	fmovrdlez	%l6,	%f2,	%f2
	membar	0x54
	taddcc	%i0,	%i7,	%l1
	subc	%l5,	0x1F2A,	%o6
	sra	%g2,	0x13,	%g4
	tl	%xcc,	0x4
	fxnors	%f31,	%f28,	%f17
	nop
	setx	loop_769,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movpos	%icc,	%o7,	%l4
	be,pn	%icc,	loop_770
	fmovrdlz	%l0,	%f2,	%f2
loop_769:
	nop
	wr	%g0,	0x27,	%asi
	stwa	%g3,	[%l7 + 0x54] %asi
	membar	#Sync
loop_770:
	addccc	%l3,	0x0DBA,	%i5
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x40] %asi,	%i3
	edge8n	%i4,	%i6,	%o5
	sdivcc	%i2,	0x11A9,	%o3
	tl	%icc,	0x7
	umul	%g5,	%o4,	%g6
	bg,a	%xcc,	loop_771
	stx	%l2,	[%l7 + 0x70]
	set	0x42, %o1
	stha	%o1,	[%l7 + %o1] 0x10
loop_771:
	stw	%i1,	[%l7 + 0x6C]
	edge8ln	%o2,	%g1,	%o0
	add	%g7,	%l6,	%i7
	smul	%i0,	0x1050,	%l5
	tle	%xcc,	0x2
	ble,a,pt	%xcc,	loop_772
	fbn,a	%fcc2,	loop_773
	fmovse	%xcc,	%f15,	%f0
	addccc	%l1,	%o6,	%g2
loop_772:
	tvc	%xcc,	0x4
loop_773:
	fbne,a	%fcc3,	loop_774
	and	%g4,	0x04E0,	%l4
	sdiv	%l0,	0x0EAF,	%o7
	fbo,a	%fcc2,	loop_775
loop_774:
	smulcc	%g3,	0x16E7,	%i5
	brlez,a	%i3,	loop_776
	bcs	loop_777
loop_775:
	fmovsgu	%xcc,	%f8,	%f1
	mulx	%i4,	0x1ADC,	%l3
loop_776:
	fornot2s	%f27,	%f23,	%f2
loop_777:
	edge32ln	%o5,	%i6,	%o3
	movle	%xcc,	%i2,	%g5
	mulscc	%o4,	0x1D3C,	%l2
	fmovrdgez	%g6,	%f2,	%f26
	movle	%icc,	%o1,	%i1
	array8	%o2,	%o0,	%g1
	fmovdgu	%xcc,	%f28,	%f3
	movleu	%icc,	%l6,	%g7
	taddcctv	%i7,	%l5,	%l1
	fbu	%fcc1,	loop_778
	mulx	%i0,	0x0078,	%o6
	tne	%xcc,	0x6
	fxors	%f23,	%f14,	%f19
loop_778:
	movneg	%icc,	%g2,	%g4
	fcmpd	%fcc2,	%f0,	%f10
	udivx	%l4,	0x1988,	%o7
	umul	%l0,	%g3,	%i5
	fmovde	%xcc,	%f13,	%f1
	set	0x2E, %i1
	stba	%i4,	[%l7 + %i1] 0x10
	edge32	%i3,	%l3,	%i6
	addc	%o3,	%i2,	%o5
	fors	%f12,	%f7,	%f18
	nop
	setx	loop_779,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpne16	%f4,	%f14,	%g5
	movcs	%xcc,	%l2,	%o4
	fmovrslz	%g6,	%f10,	%f27
loop_779:
	fmovsl	%xcc,	%f12,	%f3
	sdiv	%o1,	0x1F86,	%i1
	fmul8x16au	%f30,	%f15,	%f28
	udivcc	%o2,	0x0CAF,	%o0
	bcs,a	loop_780
	tvs	%xcc,	0x4
	bvs,pt	%xcc,	loop_781
	nop
	setx	loop_782,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_780:
	fmovdvc	%xcc,	%f29,	%f26
	fnot2s	%f3,	%f9
loop_781:
	subc	%l6,	%g7,	%i7
loop_782:
	xor	%l5,	0x01A8,	%l1
	wr	%g0,	0x0c,	%asi
	sta	%f20,	[%l7 + 0x48] %asi
	taddcc	%i0,	0x1131,	%g1
	fmovs	%f11,	%f9
	stbar
	movne	%xcc,	%g2,	%o6
	std	%g4,	[%l7 + 0x30]
	taddcc	%o7,	0x1F77,	%l4
	tle	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g3,	%i5,	%l0
	udivx	%i3,	0x0C86,	%i4
	fnot2	%f16,	%f18
	movre	%i6,	0x254,	%l3
	popc	0x0847,	%o3
	fmovdg	%xcc,	%f21,	%f26
	set	0x28, %i6
	stba	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	ld	[%l7 + 0x4C],	%f22
	xor	%o5,	%l2,	%o4
	xor	%g5,	0x1B51,	%g6
	lduh	[%l7 + 0x34],	%o1
	array8	%o2,	%o0,	%l6
	array32	%g7,	%i7,	%l5
	and	%l1,	%i0,	%g1
	std	%f2,	[%l7 + 0x48]
	fandnot1	%f26,	%f20,	%f4
	lduw	[%l7 + 0x24],	%i1
	set	0x60, %l4
	prefetcha	[%l7 + %l4] 0x0c,	 0x2
	edge8ln	%g4,	%o7,	%l4
	or	%g2,	%i5,	%l0
	and	%g3,	0x00BE,	%i4
	array32	%i6,	%i3,	%o3
	fcmpne16	%f30,	%f26,	%i2
	mulscc	%l3,	0x17A5,	%o5
	bge,a,pt	%icc,	loop_783
	edge8n	%l2,	%o4,	%g6
	tleu	%xcc,	0x4
	set	0x40, %o0
	prefetcha	[%l7 + %o0] 0x15,	 0x3
loop_783:
	sdiv	%o2,	0x19D5,	%o0
	fcmpeq32	%f14,	%f28,	%l6
	movvs	%xcc,	%g7,	%i7
	movrlz	%g5,	0x1F5,	%l5
	st	%f11,	[%l7 + 0x7C]
	brlez,a	%i0,	loop_784
	addccc	%g1,	%i1,	%o6
	ldd	[%l7 + 0x08],	%g4
	and	%o7,	0x1BCB,	%l4
loop_784:
	movcs	%icc,	%l1,	%g2
	xnor	%l0,	%g3,	%i5
	fxnor	%f28,	%f4,	%f14
	fbu	%fcc1,	loop_785
	fmovrdne	%i4,	%f8,	%f18
	lduw	[%l7 + 0x34],	%i6
	movpos	%xcc,	%o3,	%i3
loop_785:
	taddcctv	%i2,	%o5,	%l3
	tvs	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x09] %asi,	%l2
	be,a	loop_786
	movre	%o4,	%g6,	%o2
	fmovdvc	%icc,	%f16,	%f22
	fcmpeq32	%f12,	%f8,	%o1
loop_786:
	taddcc	%l6,	0x1346,	%o0
	ta	%icc,	0x1
	fmovrde	%g7,	%f30,	%f6
	lduh	[%l7 + 0x36],	%i7
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	taddcctv	%i0,	0x0432,	%g1
	xnor	%l5,	%i1,	%o6
	movle	%xcc,	%o7,	%g4
	tge	%icc,	0x3
	nop
	setx	loop_787,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%l1,	0x0363,	%g2
	set	0x40, %l6
	stha	%l0,	[%l7 + %l6] 0x14
loop_787:
	fcmpeq16	%f10,	%f22,	%l4
	and	%i5,	0x15D2,	%g3
	srl	%i6,	%o3,	%i3
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movge	%icc,	%i2,	%o5
	tne	%xcc,	0x6
	bgu,pt	%xcc,	loop_788
	mulscc	%l3,	0x1BFF,	%i4
	tsubcctv	%l2,	0x036B,	%g6
	fmovrdgz	%o2,	%f6,	%f22
loop_788:
	movrlez	%o4,	0x2F7,	%l6
	array16	%o0,	%g7,	%i7
	srax	%o1,	0x03,	%i0
	sdivx	%g1,	0x1A18,	%l5
	xnor	%i1,	0x0DBF,	%o6
	ldsb	[%l7 + 0x4C],	%g5
	tneg	%icc,	0x0
	edge16ln	%o7,	%l1,	%g2
	popc	%g4,	%l4
	sir	0x0970
	tpos	%icc,	0x1
	subccc	%l0,	%i5,	%g3
	subcc	%i6,	%o3,	%i2
	edge32	%i3,	%o5,	%i4
	set	0x08, %l1
	stwa	%l2,	[%l7 + %l1] 0x04
	movrlez	%g6,	%o2,	%o4
	lduw	[%l7 + 0x4C],	%l6
	edge16	%o0,	%l3,	%i7
	fbul	%fcc2,	loop_789
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o1,	%i0,	%g1
	fnot2	%f4,	%f28
loop_789:
	tne	%icc,	0x6
	fcmps	%fcc1,	%f11,	%f20
	xor	%g7,	0x094C,	%l5
	set	0x0C, %o4
	ldsha	[%l7 + %o4] 0x04,	%i1
	fbn,a	%fcc3,	loop_790
	subcc	%g5,	%o7,	%o6
	set	0x2C, %l0
	swapa	[%l7 + %l0] 0x80,	%g2
loop_790:
	movcc	%xcc,	%l1,	%g4
	set	0x08, %g7
	lda	[%l7 + %g7] 0x18,	%f6
	move	%xcc,	%l0,	%i5
	fmovrsgz	%l4,	%f18,	%f0
	ldstub	[%l7 + 0x20],	%i6
	xorcc	%o3,	%i2,	%g3
	fnand	%f10,	%f24,	%f24
	tsubcctv	%i3,	%o5,	%i4
	edge16	%g6,	%o2,	%o4
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x2a,	%l2
	mulx	%o0,	%l6,	%i7
	popc	0x112B,	%o1
	nop
	setx	loop_791,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%l3,	%i0
	fmovrsgez	%g1,	%f13,	%f5
	fmul8ulx16	%f18,	%f12,	%f22
loop_791:
	orn	%l5,	%i1,	%g7
	fbo	%fcc2,	loop_792
	movg	%xcc,	%g5,	%o6
	te	%xcc,	0x6
	set	0x70, %l3
	swapa	[%l7 + %l3] 0x0c,	%o7
loop_792:
	mova	%icc,	%g2,	%l1
	movcs	%xcc,	%l0,	%g4
	movvs	%icc,	%l4,	%i5
	bl,pn	%xcc,	loop_793
	ldub	[%l7 + 0x17],	%o3
	udiv	%i6,	0x0979,	%g3
	siam	0x5
loop_793:
	tpos	%xcc,	0x1
	fcmple16	%f22,	%f18,	%i2
	sll	%o5,	%i4,	%i3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x40] %asi,	%g6
	fmovd	%f6,	%f24
	umulcc	%o4,	0x0AA8,	%l2
	set	0x24, %l2
	stha	%o0,	[%l7 + %l2] 0x10
	taddcc	%l6,	0x0732,	%i7
	add	%o1,	0x0A67,	%o2
	fbg,a	%fcc0,	loop_794
	movne	%icc,	%l3,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f6,	[%l7 + 0x34]
loop_794:
	udivx	%i0,	0x12D6,	%l5
	movvc	%xcc,	%g7,	%g5
	movvc	%icc,	%i1,	%o6
	fpack32	%f20,	%f14,	%f4
	srlx	%g2,	0x07,	%o7
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x62] %asi,	%l1
	fmovdg	%xcc,	%f24,	%f26
	stw	%l0,	[%l7 + 0x1C]
	tgu	%xcc,	0x3
	movge	%icc,	%l4,	%i5
	movle	%icc,	%g4,	%o3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%g3,	%i2
	fbl,a	%fcc2,	loop_795
	taddcc	%i6,	0x15A9,	%i4
	fbl,a	%fcc2,	loop_796
	subcc	%i3,	0x1375,	%g6
loop_795:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o5
loop_796:
	move	%xcc,	%o4,	%o0
	edge32n	%l2,	%l6,	%o1
	mova	%xcc,	%o2,	%i7
	set	0x6C, %i7
	lda	[%l7 + %i7] 0x80,	%f22
	fmovsa	%icc,	%f27,	%f25
	sllx	%l3,	%i0,	%l5
	set	0x34, %i2
	ldswa	[%l7 + %i2] 0x19,	%g7
	set	0x5C, %g3
	lduba	[%l7 + %g3] 0x18,	%g1
	fmovdle	%xcc,	%f19,	%f27
	fmovsl	%xcc,	%f0,	%f9
	membar	0x0D
	sdiv	%g5,	0x0407,	%i1
	membar	0x0D
	sllx	%o6,	0x04,	%o7
	tvc	%xcc,	0x3
	udiv	%g2,	0x194D,	%l0
	orn	%l4,	%l1,	%g4
	movvs	%xcc,	%o3,	%g3
	bn	loop_797
	umulcc	%i2,	0x0F22,	%i6
	srlx	%i5,	%i3,	%i4
	wr	%g0,	0x18,	%asi
	sta	%f29,	[%l7 + 0x0C] %asi
loop_797:
	nop
	set	0x14, %i0
	lduha	[%l7 + %i0] 0x15,	%o5
	sethi	0x06C1,	%g6
	fmovrdlez	%o0,	%f30,	%f12
	bge,a	%xcc,	loop_798
	brgez,a	%l2,	loop_799
	sir	0x0EDC
	bne,a,pt	%icc,	loop_800
loop_798:
	addcc	%o4,	%o1,	%l6
loop_799:
	movrne	%i7,	0x23A,	%l3
	smulcc	%o2,	0x184C,	%l5
loop_800:
	movrlez	%i0,	%g1,	%g7
	set	0x44, %g5
	stwa	%i1,	[%l7 + %g5] 0x2b
	membar	#Sync
	bg,pn	%xcc,	loop_801
	sll	%g5,	0x1A,	%o6
	fpack16	%f22,	%f8
	fbug	%fcc2,	loop_802
loop_801:
	movrne	%o7,	%l0,	%g2
	fmovsge	%icc,	%f27,	%f6
	brgez,a	%l1,	loop_803
loop_802:
	ld	[%l7 + 0x3C],	%f26
	fmovdge	%xcc,	%f26,	%f14
	ble,a	loop_804
loop_803:
	move	%icc,	%g4,	%o3
	bleu,pn	%icc,	loop_805
	movne	%xcc,	%l4,	%i2
loop_804:
	sub	%i6,	%g3,	%i5
	fbg,a	%fcc2,	loop_806
loop_805:
	fpadd16s	%f10,	%f9,	%f17
	fones	%f7
	tn	%xcc,	0x7
loop_806:
	fmovscc	%xcc,	%f10,	%f23
	set	0x30, %g6
	stwa	%i4,	[%l7 + %g6] 0x11
	fba,a	%fcc0,	loop_807
	ldx	[%l7 + 0x60],	%o5
	sllx	%i3,	%g6,	%l2
	fmovde	%xcc,	%f2,	%f20
loop_807:
	movgu	%icc,	%o4,	%o1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x48] %asi,	%f11
	ba,a,pn	%icc,	loop_808
	bvs,pn	%icc,	loop_809
	fmovrdgez	%o0,	%f20,	%f24
	subccc	%i7,	%l3,	%l6
loop_808:
	fbug	%fcc3,	loop_810
loop_809:
	tcs	%xcc,	0x1
	andn	%o2,	%i0,	%l5
	lduh	[%l7 + 0x74],	%g1
loop_810:
	alignaddr	%g7,	%i1,	%g5
	xorcc	%o7,	0x0A59,	%o6
	bn,a,pt	%icc,	loop_811
	tle	%xcc,	0x1
	udiv	%g2,	0x05DD,	%l0
	umulcc	%l1,	%g4,	%o3
loop_811:
	prefetch	[%l7 + 0x14],	 0x2
	add	%i2,	%i6,	%g3
	movl	%icc,	%i5,	%l4
	fmovsgu	%icc,	%f24,	%f8
	membar	0x15
	sdivx	%o5,	0x0A09,	%i4
	edge32l	%g6,	%i3,	%l2
	ld	[%l7 + 0x70],	%f3
	fxor	%f22,	%f24,	%f2
	taddcc	%o4,	%o1,	%o0
	array16	%i7,	%l6,	%l3
	movrne	%o2,	0x06B,	%l5
	mova	%xcc,	%g1,	%i0
	movvc	%icc,	%g7,	%i1
	edge8ln	%g5,	%o6,	%g2
	fmovdcs	%icc,	%f11,	%f19
	st	%f22,	[%l7 + 0x78]
	movne	%icc,	%l0,	%o7
	movpos	%xcc,	%l1,	%o3
	tcs	%xcc,	0x4
	nop
	setx loop_812, %l0, %l1
	jmpl %l1, %i2
	fbge	%fcc3,	loop_813
	ldub	[%l7 + 0x63],	%i6
	fpadd16s	%f18,	%f24,	%f15
loop_812:
	smulcc	%g3,	%g4,	%l4
loop_813:
	orcc	%o5,	%i5,	%i4
	udiv	%i3,	0x081C,	%g6
	fornot2	%f4,	%f8,	%f6
	movg	%icc,	%o4,	%o1
	set	0x20, %i3
	prefetcha	[%l7 + %i3] 0x88,	 0x3
	ble,a	loop_814
	orn	%i7,	0x0B81,	%l6
	tvs	%icc,	0x3
	tn	%icc,	0x0
loop_814:
	taddcc	%l3,	%o2,	%l5
	fandnot2	%f20,	%f22,	%f22
	ldsw	[%l7 + 0x74],	%g1
	movrlz	%l2,	%g7,	%i1
	bneg,pn	%icc,	loop_815
	fmovsl	%icc,	%f21,	%f13
	movleu	%icc,	%i0,	%o6
	udiv	%g5,	0x0A9A,	%l0
loop_815:
	st	%f7,	[%l7 + 0x44]
	fble	%fcc0,	loop_816
	tvc	%icc,	0x5
	fmovsleu	%icc,	%f6,	%f28
	ldsw	[%l7 + 0x30],	%g2
loop_816:
	fmovsgu	%xcc,	%f2,	%f11
	fbul,a	%fcc2,	loop_817
	fmovrslz	%l1,	%f29,	%f23
	and	%o7,	0x1F76,	%i2
	addccc	%o3,	%g3,	%i6
loop_817:
	stw	%l4,	[%l7 + 0x38]
	ldx	[%l7 + 0x30],	%g4
	te	%icc,	0x5
	fmovdneg	%icc,	%f5,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f23,	%f28
	fcmpne32	%f2,	%f18,	%o5
	fpadd16	%f26,	%f4,	%f22
	edge32n	%i5,	%i4,	%i3
	ta	%icc,	0x3
	srl	%o4,	0x09,	%o1
	set	0x50, %g1
	stwa	%g6,	[%l7 + %g1] 0x18
	brgz	%i7,	loop_818
	bpos,a,pn	%xcc,	loop_819
	edge8	%o0,	%l3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_818:
	fmovrde	%o2,	%f16,	%f30
loop_819:
	nop
	set	0x38, %o2
	prefetcha	[%l7 + %o2] 0x19,	 0x3
	fmovsn	%xcc,	%f15,	%f7
	movge	%icc,	%l5,	%g7
	tsubcc	%i1,	0x1759,	%l2
	ldd	[%l7 + 0x50],	%f4
	add	%i0,	0x18AD,	%g5
	fcmpeq32	%f30,	%f22,	%l0
	membar	0x09
	tpos	%xcc,	0x3
	ld	[%l7 + 0x1C],	%f0
	fmovdleu	%icc,	%f11,	%f6
	or	%o6,	%l1,	%o7
	sra	%i2,	%g2,	%o3
	fnors	%f27,	%f4,	%f31
	srl	%g3,	0x07,	%l4
	fabsd	%f12,	%f8
	edge16	%g4,	%o5,	%i5
	fbu	%fcc2,	loop_820
	movge	%icc,	%i4,	%i3
	fornot2	%f16,	%f8,	%f22
	fmuld8sux16	%f21,	%f30,	%f14
loop_820:
	movrgez	%o4,	0x009,	%i6
	taddcc	%o1,	0x14A3,	%i7
	fxnor	%f20,	%f22,	%f16
	edge8l	%g6,	%l3,	%l6
	edge32	%o0,	%g1,	%o2
	movneg	%icc,	%l5,	%i1
	fmovrsgez	%g7,	%f21,	%f25
	fpadd16	%f20,	%f10,	%f10
	fmovda	%xcc,	%f28,	%f10
	sdivcc	%i0,	0x04B5,	%l2
	fpsub32	%f18,	%f4,	%f16
	udiv	%g5,	0x0AFB,	%l0
	fcmpne16	%f12,	%f2,	%l1
	fmovrdgez	%o6,	%f10,	%f24
	popc	%i2,	%g2
	movrgez	%o3,	0x1F9,	%o7
	fmovdn	%xcc,	%f27,	%f16
	bcs	%icc,	loop_821
	fmovrdlez	%l4,	%f28,	%f18
	alignaddr	%g3,	%o5,	%g4
	wr	%g0,	0x88,	%asi
	stba	%i4,	[%l7 + 0x5C] %asi
loop_821:
	fmovde	%icc,	%f27,	%f16
	movre	%i5,	0x375,	%i3
	brz	%o4,	loop_822
	movge	%icc,	%i6,	%o1
	nop
	setx	loop_823,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fxnors	%f30,	%f14,	%f30
loop_822:
	subc	%g6,	%i7,	%l3
	xorcc	%l6,	0x05E9,	%g1
loop_823:
	orcc	%o2,	%o0,	%i1
	brz,a	%l5,	loop_824
	movvc	%icc,	%i0,	%g7
	fmovdvc	%xcc,	%f8,	%f19
	fcmpgt32	%f2,	%f2,	%g5
loop_824:
	orncc	%l0,	0x04B2,	%l2
	fbg	%fcc1,	loop_825
	movpos	%xcc,	%o6,	%l1
	movleu	%icc,	%g2,	%o3
	sth	%o7,	[%l7 + 0x3C]
loop_825:
	fmovsn	%xcc,	%f6,	%f20
	movrne	%l4,	0x15D,	%g3
	fpmerge	%f21,	%f28,	%f30
	fmovdge	%icc,	%f11,	%f5
	fandnot2	%f20,	%f4,	%f0
	set	0x74, %o7
	ldsha	[%l7 + %o7] 0x04,	%o5
	fnot1	%f30,	%f2
	fbul	%fcc0,	loop_826
	movvc	%icc,	%i2,	%i4
	te	%xcc,	0x4
	tleu	%xcc,	0x2
loop_826:
	edge16	%i5,	%g4,	%o4
	bgu,a	loop_827
	tpos	%icc,	0x4
	bpos,a,pn	%xcc,	loop_828
	fbl	%fcc2,	loop_829
loop_827:
	movcc	%xcc,	%i3,	%i6
	fzero	%f30
loop_828:
	tgu	%icc,	0x0
loop_829:
	xor	%o1,	0x0362,	%g6
	taddcctv	%l3,	%l6,	%i7
	umul	%g1,	0x0E80,	%o0
	movvs	%xcc,	%o2,	%i1
	lduw	[%l7 + 0x60],	%i0
	edge32	%l5,	%g5,	%l0
	std	%g6,	[%l7 + 0x78]
	tne	%icc,	0x6
	sdiv	%l2,	0x1F3C,	%l1
	brnz	%o6,	loop_830
	fble	%fcc2,	loop_831
	edge32n	%g2,	%o3,	%l4
	fmovsn	%xcc,	%f29,	%f9
loop_830:
	tg	%icc,	0x3
loop_831:
	tsubcctv	%o7,	%o5,	%i2
	fsrc1	%f6,	%f26
	fors	%f26,	%f31,	%f27
	movrne	%g3,	%i4,	%g4
	set	0x58, %o5
	swapa	[%l7 + %o5] 0x81,	%o4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i3,	%i5
	tne	%icc,	0x3
	ldd	[%l7 + 0x08],	%o0
	set	0x28, %o3
	stxa	%i6,	[%l7 + %o3] 0x2b
	membar	#Sync
	tsubcctv	%g6,	0x18DD,	%l6
	xnorcc	%i7,	%l3,	%g1
	tle	%xcc,	0x5
	srl	%o0,	0x18,	%o2
	umulcc	%i1,	%i0,	%l5
	movcc	%icc,	%l0,	%g7
	swap	[%l7 + 0x74],	%g5
	umul	%l1,	0x10FB,	%l2
	edge8ln	%o6,	%o3,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc0,	loop_832
	fones	%f6
	and	%o7,	%o5,	%i2
	array8	%g2,	%i4,	%g4
loop_832:
	edge16n	%o4,	%i3,	%i5
	tpos	%icc,	0x4
	fbue,a	%fcc1,	loop_833
	mulscc	%g3,	%i6,	%o1
	nop
	setx	loop_834,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brz	%g6,	loop_835
loop_833:
	fmovrslez	%i7,	%f31,	%f13
	swap	[%l7 + 0x50],	%l6
loop_834:
	tcc	%xcc,	0x0
loop_835:
	tsubcctv	%l3,	0x1E70,	%g1
	stx	%o2,	[%l7 + 0x40]
	set	0x38, %l5
	stha	%i1,	[%l7 + %l5] 0x2b
	membar	#Sync
	fmovdcc	%xcc,	%f17,	%f30
	tsubcc	%i0,	%l5,	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g7,	%g5
	udivx	%l0,	0x1B97,	%l2
	tge	%xcc,	0x1
	tvc	%xcc,	0x1
	fmovdvs	%xcc,	%f22,	%f24
	edge8l	%o6,	%l1,	%l4
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x56] %asi,	%o3
	brgz	%o7,	loop_836
	edge8ln	%o5,	%g2,	%i4
	fandnot1s	%f13,	%f28,	%f14
	edge32	%g4,	%i2,	%o4
loop_836:
	movl	%xcc,	%i3,	%g3
	edge8l	%i6,	%o1,	%i5
	lduh	[%l7 + 0x48],	%g6
	subc	%l6,	%i7,	%l3
	fmovdn	%xcc,	%f21,	%f11
	sra	%o2,	0x16,	%i1
	fmovdneg	%icc,	%f1,	%f4
	fmul8sux16	%f2,	%f6,	%f18
	bn,a,pt	%xcc,	loop_837
	andcc	%i0,	%g1,	%o0
	fnegs	%f23,	%f22
	set	0x13, %i5
	ldstuba	[%l7 + %i5] 0x04,	%g7
loop_837:
	bneg	%icc,	loop_838
	edge8	%l5,	%g5,	%l0
	fmovde	%icc,	%f16,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_838:
	sub	%o6,	0x11AA,	%l1
	edge8	%l4,	%l2,	%o7
	subcc	%o3,	0x10FE,	%o5
	subccc	%g2,	0x1C31,	%i4
	mulscc	%g4,	0x0B58,	%o4
	edge8ln	%i2,	%i3,	%g3
	fbge,a	%fcc2,	loop_839
	array32	%o1,	%i6,	%g6
	fsrc1	%f26,	%f14
	tne	%icc,	0x5
loop_839:
	fbo	%fcc0,	loop_840
	movn	%icc,	%l6,	%i7
	ble,a	%xcc,	loop_841
	movne	%icc,	%i5,	%o2
loop_840:
	siam	0x6
	orn	%i1,	0x0CEF,	%i0
loop_841:
	tgu	%icc,	0x6
	bcc,a,pn	%xcc,	loop_842
	edge16l	%g1,	%o0,	%g7
	brlz	%l5,	loop_843
	xnorcc	%l3,	%g5,	%o6
loop_842:
	edge16	%l1,	%l0,	%l4
	subccc	%l2,	0x1A46,	%o7
loop_843:
	andcc	%o5,	%g2,	%o3
	fnot2	%f20,	%f28
	call	loop_844
	andn	%g4,	0x1B60,	%o4
	udiv	%i2,	0x0771,	%i4
	be,pn	%xcc,	loop_845
loop_844:
	xnorcc	%g3,	0x1DE9,	%i3
	tne	%icc,	0x0
	set	0x44, %g2
	ldswa	[%l7 + %g2] 0x14,	%o1
loop_845:
	alignaddrl	%g6,	%i6,	%l6
	movrgz	%i5,	0x0E4,	%i7
	wr	%g0,	0x89,	%asi
	stwa	%o2,	[%l7 + 0x54] %asi
	fpadd32s	%f7,	%f12,	%f24
	fmovdneg	%icc,	%f31,	%f20
	movrlz	%i1,	%g1,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x08F6,	%i0
	fcmpgt32	%f22,	%f0,	%l5
	bgu,a	loop_846
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g7,	%l3,	%g5
	set	0x44, %g4
	stwa	%o6,	[%l7 + %g4] 0x2a
	membar	#Sync
loop_846:
	fbug	%fcc3,	loop_847
	movgu	%icc,	%l0,	%l4
	movrgz	%l2,	%o7,	%l1
	wr	%g0,	0x81,	%asi
	stha	%o5,	[%l7 + 0x50] %asi
loop_847:
	popc	0x1D5D,	%g2
	movre	%o3,	0x242,	%o4
	fornot2	%f20,	%f0,	%f2
	tpos	%icc,	0x1
	fmovrde	%g4,	%f12,	%f28
	ba,a,pt	%xcc,	loop_848
	movrlez	%i4,	%g3,	%i2
	alignaddr	%o1,	%i3,	%i6
	smul	%g6,	0x01C7,	%i5
loop_848:
	tge	%icc,	0x5
	mulscc	%l6,	%o2,	%i1
	movcs	%xcc,	%g1,	%i7
	edge8n	%i0,	%o0,	%l5
	taddcctv	%g7,	%g5,	%l3
	array32	%o6,	%l4,	%l0
	tsubcc	%l2,	%l1,	%o7
	fbn	%fcc1,	loop_849
	tn	%xcc,	0x0
	movrgez	%g2,	%o3,	%o5
	fbg,a	%fcc2,	loop_850
loop_849:
	siam	0x3
	xor	%g4,	0x0D64,	%i4
	fmovsleu	%xcc,	%f28,	%f28
loop_850:
	stb	%o4,	[%l7 + 0x2D]
	fblg	%fcc1,	loop_851
	fbue,a	%fcc2,	loop_852
	fmovscc	%icc,	%f25,	%f21
	movn	%xcc,	%g3,	%i2
loop_851:
	brgz,a	%o1,	loop_853
loop_852:
	edge32	%i3,	%i6,	%i5
	srax	%g6,	0x07,	%o2
	alignaddrl	%i1,	%l6,	%g1
loop_853:
	mova	%icc,	%i0,	%o0
	sdivcc	%l5,	0x1D1B,	%g7
	tvs	%xcc,	0x6
	fcmpeq32	%f16,	%f16,	%i7
	add	%l3,	0x11B8,	%g5
	lduh	[%l7 + 0x2E],	%l4
	andn	%l0,	0x038A,	%l2
	fbuge,a	%fcc1,	loop_854
	fcmple32	%f18,	%f24,	%l1
	alignaddr	%o6,	%o7,	%o3
	sub	%g2,	0x0423,	%g4
loop_854:
	bcs,a	loop_855
	fmovde	%xcc,	%f5,	%f31
	edge16n	%o5,	%o4,	%g3
	tge	%icc,	0x3
loop_855:
	movrgez	%i2,	%o1,	%i4
	edge16n	%i6,	%i5,	%g6
	smul	%o2,	%i3,	%i1
	movrne	%g1,	0x163,	%l6
	addccc	%o0,	%l5,	%g7
	movl	%xcc,	%i0,	%l3
	fmovsge	%icc,	%f4,	%f13
	tgu	%xcc,	0x6
	sth	%g5,	[%l7 + 0x2E]
	srl	%l4,	0x0B,	%l0
	movvs	%xcc,	%l2,	%l1
	tsubcc	%o6,	%o7,	%o3
	bg,pn	%xcc,	loop_856
	movg	%icc,	%g2,	%i7
	brlz,a	%o5,	loop_857
	sir	0x0143
loop_856:
	movgu	%icc,	%g4,	%g3
	bcs	loop_858
loop_857:
	fcmpgt32	%f24,	%f24,	%i2
	fmovsgu	%xcc,	%f8,	%f11
	movg	%xcc,	%o1,	%o4
loop_858:
	edge32n	%i4,	%i5,	%g6
	srl	%o2,	0x08,	%i3
	brgz	%i6,	loop_859
	fmuld8ulx16	%f16,	%f2,	%f14
	tne	%icc,	0x0
	sub	%i1,	0x05B4,	%g1
loop_859:
	xorcc	%l6,	0x0023,	%o0
	movre	%g7,	0x3C0,	%l5
	te	%icc,	0x4
	tneg	%xcc,	0x4
	bleu,a	%icc,	loop_860
	tcs	%icc,	0x0
	brgz,a	%i0,	loop_861
	fmovdleu	%icc,	%f0,	%f1
loop_860:
	smulcc	%l3,	%g5,	%l0
	fmovsa	%icc,	%f16,	%f29
loop_861:
	edge32l	%l4,	%l2,	%o6
	sethi	0x1804,	%l1
	std	%f4,	[%l7 + 0x18]
	xnor	%o3,	%o7,	%i7
	bpos,a,pt	%xcc,	loop_862
	fones	%f9
	sllx	%g2,	%o5,	%g4
	sdivx	%g3,	0x1D6F,	%o1
loop_862:
	alignaddrl	%i2,	%i4,	%i5
	movgu	%xcc,	%o4,	%g6
	sdiv	%o2,	0x1624,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x18, %o6
	swapa	[%l7 + %o6] 0x04,	%i3
	sdiv	%i1,	0x0988,	%g1
	array8	%l6,	%g7,	%o0
	movvc	%icc,	%l5,	%i0
	edge16ln	%l3,	%l0,	%l4
	movle	%icc,	%g5,	%o6
	addccc	%l2,	0x17FC,	%l1
	sll	%o3,	0x11,	%i7
	fnands	%f8,	%f23,	%f19
	movge	%icc,	%g2,	%o7
	umulcc	%g4,	0x026C,	%g3
	set	0x71, %o1
	ldsba	[%l7 + %o1] 0x80,	%o1
	srax	%o5,	%i4,	%i5
	sra	%i2,	0x06,	%o4
	bcs,a	loop_863
	movleu	%xcc,	%o2,	%i6
	fmul8x16al	%f1,	%f30,	%f4
	wr	%g0,	0x89,	%asi
	stda	%i2,	[%l7 + 0x18] %asi
loop_863:
	fbe,a	%fcc1,	loop_864
	bcs,a	%icc,	loop_865
	movrlez	%i1,	%g6,	%l6
	edge16ln	%g7,	%o0,	%g1
loop_864:
	ldstub	[%l7 + 0x64],	%l5
loop_865:
	fmovdl	%xcc,	%f31,	%f3
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x16,	%f16
	movn	%icc,	%i0,	%l0
	movpos	%xcc,	%l4,	%l3
	set	0x70, %l4
	stxa	%g5,	[%l7 + %l4] 0x88
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x3
	movre	%o6,	0x3AB,	%l2
	edge8n	%l1,	%i7,	%o3
	array8	%o7,	%g2,	%g4
	smulcc	%g3,	%o5,	%o1
	movre	%i5,	0x3F3,	%i2
	movrne	%o4,	0x19C,	%i4
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o2
	taddcctv	%i6,	0x0797,	%i3
	orcc	%i1,	0x0649,	%l6
	fmovrdlez	%g6,	%f24,	%f6
	edge32ln	%g7,	%o0,	%g1
	edge8ln	%l5,	%i0,	%l4
	edge8n	%l0,	%l3,	%g5
	movpos	%xcc,	%o6,	%l1
	stw	%l2,	[%l7 + 0x64]
	movvc	%xcc,	%o3,	%o7
	addc	%g2,	%i7,	%g3
	set	0x43, %o0
	stba	%g4,	[%l7 + %o0] 0x19
	nop
	setx	loop_866,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%icc,	%o5,	%i5
	xor	%i2,	%o1,	%o4
	bleu	loop_867
loop_866:
	addcc	%o2,	0x13AA,	%i6
	tvc	%icc,	0x2
	addccc	%i3,	0x1606,	%i4
loop_867:
	array16	%i1,	%l6,	%g6
	movvc	%xcc,	%o0,	%g1
	edge32l	%l5,	%i0,	%l4
	fcmple32	%f4,	%f18,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%l3,	%f29,	%f0
	fnegs	%f18,	%f24
	subcc	%g7,	0x0296,	%g5
	edge16	%l1,	%l2,	%o3
	edge16n	%o7,	%o6,	%g2
	fmul8x16al	%f1,	%f11,	%f8
	tsubcctv	%i7,	0x1B4D,	%g4
	movre	%g3,	%i5,	%i2
	movcs	%xcc,	%o5,	%o4
	udivcc	%o2,	0x14D6,	%o1
	srax	%i6,	%i3,	%i4
	edge32n	%l6,	%i1,	%o0
	tpos	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc3,	loop_868
	fblg,a	%fcc3,	loop_869
	swap	[%l7 + 0x28],	%g1
	sdiv	%l5,	0x0E85,	%i0
loop_868:
	bl,a,pt	%icc,	loop_870
loop_869:
	add	%l4,	%g6,	%l0
	fnor	%f30,	%f2,	%f12
	xnorcc	%l3,	%g5,	%l1
loop_870:
	tne	%icc,	0x3
	movrgz	%g7,	%l2,	%o3
	mova	%xcc,	%o6,	%g2
	movcs	%xcc,	%i7,	%g4
	set	0x68, %i6
	stxa	%o7,	[%l7 + %i6] 0x88
	udiv	%i5,	0x13DC,	%g3
	edge8	%i2,	%o5,	%o4
	sra	%o1,	0x19,	%i6
	subccc	%o2,	%i4,	%i3
	fsrc1s	%f10,	%f18
	membar	0x55
	fbul,a	%fcc2,	loop_871
	tl	%xcc,	0x7
	subc	%i1,	0x16D4,	%l6
	ldsh	[%l7 + 0x3A],	%g1
loop_871:
	fmovdg	%icc,	%f8,	%f28
	nop
	setx loop_872, %l0, %l1
	jmpl %l1, %o0
	fmovdvc	%icc,	%f20,	%f29
	tcs	%icc,	0x7
	brgez	%l5,	loop_873
loop_872:
	tsubcc	%l4,	0x028B,	%i0
	fmovs	%f8,	%f13
	fbo,a	%fcc0,	loop_874
loop_873:
	fmovrdlz	%l0,	%f24,	%f20
	bl,pn	%xcc,	loop_875
	fbne,a	%fcc3,	loop_876
loop_874:
	orcc	%g6,	0x0594,	%l3
	std	%g4,	[%l7 + 0x78]
loop_875:
	fmul8x16	%f28,	%f14,	%f26
loop_876:
	fsrc2s	%f1,	%f6
	tleu	%icc,	0x4
	tsubcctv	%l1,	0x0F1F,	%g7
	prefetch	[%l7 + 0x40],	 0x0
	srax	%o3,	%o6,	%l2
	edge16l	%i7,	%g2,	%o7
	ble,pt	%icc,	loop_877
	fcmpeq32	%f2,	%f24,	%g4
	xorcc	%g3,	%i5,	%o5
	fornot2	%f16,	%f0,	%f8
loop_877:
	fcmpeq16	%f18,	%f18,	%i2
	edge8n	%o4,	%o1,	%i6
	fbne,a	%fcc1,	loop_878
	mova	%xcc,	%i4,	%o2
	movn	%icc,	%i3,	%i1
	movrlez	%g1,	0x3C1,	%l6
loop_878:
	mulscc	%o0,	%l5,	%i0
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x89,	%f16
	andn	%l4,	0x1A71,	%l0
	tvc	%xcc,	0x2
	mulscc	%g6,	0x155E,	%g5
	udivx	%l1,	0x1653,	%g7
	fmovsneg	%icc,	%f1,	%f10
	addcc	%o3,	%l3,	%l2
	fcmpd	%fcc2,	%f24,	%f30
	fcmpne16	%f26,	%f14,	%o6
	array8	%g2,	%o7,	%i7
	movne	%icc,	%g3,	%g4
	array16	%o5,	%i2,	%o4
	array32	%i5,	%o1,	%i4
	fand	%f16,	%f4,	%f14
	fmovrdlez	%i6,	%f26,	%f26
	fnegs	%f8,	%f31
	umul	%i3,	0x0EE3,	%o2
	movl	%icc,	%g1,	%i1
	set	0x14, %o4
	swapa	[%l7 + %o4] 0x89,	%l6
	edge32	%o0,	%i0,	%l5
	stx	%l4,	[%l7 + 0x20]
	edge8ln	%l0,	%g5,	%l1
	addc	%g6,	0x09E2,	%o3
	ldstub	[%l7 + 0x77],	%g7
	edge32ln	%l2,	%l3,	%g2
	movle	%xcc,	%o6,	%i7
	xnor	%g3,	0x1285,	%g4
	umulcc	%o7,	%i2,	%o5
	movrne	%o4,	%i5,	%i4
	set	0x40, %l6
	prefetcha	[%l7 + %l6] 0x18,	 0x2
	add	%i3,	%o1,	%o2
	fmovrslez	%g1,	%f19,	%f11
	andcc	%l6,	0x1229,	%o0
	fba	%fcc1,	loop_879
	sethi	0x1D43,	%i0
	edge8n	%l5,	%i1,	%l4
	movrgez	%g5,	0x37D,	%l1
loop_879:
	fcmple32	%f18,	%f22,	%g6
	fmul8sux16	%f30,	%f6,	%f26
	fpsub16s	%f17,	%f19,	%f25
	tpos	%icc,	0x6
	stbar
	fxnor	%f24,	%f10,	%f8
	edge8	%l0,	%o3,	%g7
	tne	%icc,	0x4
	tcc	%icc,	0x3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l3,	%l2
	edge16n	%g2,	%o6,	%i7
	subc	%g3,	%g4,	%i2
	tneg	%xcc,	0x5
	brlez	%o7,	loop_880
	bcs,a,pt	%xcc,	loop_881
	fornot1s	%f20,	%f12,	%f4
	tle	%xcc,	0x0
loop_880:
	tge	%icc,	0x2
loop_881:
	edge8n	%o4,	%i5,	%o5
	andn	%i6,	%i3,	%o1
	fmovrsne	%o2,	%f17,	%f2
	fxor	%f22,	%f30,	%f26
	tn	%icc,	0x1
	fxnors	%f2,	%f19,	%f13
	movrgz	%i4,	%l6,	%o0
	fmovrdlez	%i0,	%f0,	%f4
	brgez,a	%g1,	loop_882
	fbuge	%fcc2,	loop_883
	call	loop_884
	movpos	%icc,	%i1,	%l5
loop_882:
	fmovsl	%xcc,	%f27,	%f27
loop_883:
	ble,a,pt	%xcc,	loop_885
loop_884:
	fmovs	%f27,	%f15
	movpos	%xcc,	%g5,	%l4
	srlx	%g6,	0x18,	%l0
loop_885:
	fmul8sux16	%f4,	%f4,	%f24
	fmul8ulx16	%f6,	%f4,	%f18
	movcc	%xcc,	%l1,	%g7
	nop
	setx	loop_886,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%xcc,	%o3,	%l3
	sllx	%l2,	%o6,	%i7
	tsubcc	%g2,	0x152A,	%g3
loop_886:
	fbne	%fcc0,	loop_887
	and	%i2,	%o7,	%g4
	tpos	%xcc,	0x2
	fmovdne	%xcc,	%f22,	%f27
loop_887:
	edge8	%o4,	%o5,	%i5
	edge8n	%i3,	%i6,	%o2
	fmovsge	%xcc,	%f8,	%f18
	fmovsneg	%xcc,	%f14,	%f21
	set	0x7E, %g7
	ldsha	[%l7 + %g7] 0x89,	%i4
	edge32l	%l6,	%o0,	%o1
	sra	%i0,	0x15,	%g1
	alignaddrl	%l5,	%i1,	%l4
	set	0x18, %l0
	ldswa	[%l7 + %l0] 0x10,	%g5
	fnegd	%f28,	%f12
	fandnot2	%f0,	%f10,	%f6
	move	%icc,	%l0,	%g6
	xnorcc	%g7,	%o3,	%l3
	tpos	%xcc,	0x4
	udiv	%l2,	0x0A38,	%o6
	movrgz	%i7,	0x2FC,	%g2
	fcmpgt32	%f30,	%f20,	%g3
	alignaddrl	%l1,	%i2,	%o7
	addc	%o4,	0x080C,	%o5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	fba	%fcc1,	loop_888
	fbn,a	%fcc2,	loop_889
	xnor	%i3,	%g4,	%i6
	movl	%icc,	%o2,	%l6
loop_888:
	std	%i4,	[%l7 + 0x30]
loop_889:
	srl	%o0,	%i0,	%o1
	tgu	%icc,	0x3
	fnot2s	%f22,	%f18
	addc	%l5,	%i1,	%g1
	fmovdge	%xcc,	%f10,	%f17
	udiv	%g5,	0x0587,	%l4
	fmovrslez	%l0,	%f11,	%f10
	move	%xcc,	%g6,	%o3
	fmovdne	%icc,	%f9,	%f14
	fornot2	%f0,	%f8,	%f6
	set	0x54, %l3
	ldswa	[%l7 + %l3] 0x18,	%l3
	st	%f15,	[%l7 + 0x2C]
	set	0x59, %i4
	ldsba	[%l7 + %i4] 0x11,	%l2
	nop
	setx	loop_890,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%g7,	0x04,	%o6
	andcc	%i7,	0x19F6,	%g3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x34] %asi,	%f17
loop_890:
	ba,a	%icc,	loop_891
	movge	%icc,	%l1,	%i2
	smul	%o7,	0x1953,	%o4
	srax	%g2,	0x0E,	%o5
loop_891:
	ld	[%l7 + 0x3C],	%f28
	edge8l	%i3,	%i5,	%i6
	tcs	%xcc,	0x6
	fxnors	%f15,	%f25,	%f11
	call	loop_892
	smulcc	%g4,	%l6,	%i4
	set	0x2C, %l2
	lduwa	[%l7 + %l2] 0x81,	%o0
loop_892:
	sdiv	%i0,	0x06F3,	%o2
	edge16n	%l5,	%o1,	%i1
	fpsub32	%f18,	%f4,	%f28
	fone	%f18
	and	%g1,	0x0403,	%g5
	movrgez	%l0,	%l4,	%o3
	sdivx	%l3,	0x104B,	%l2
	movvs	%xcc,	%g6,	%g7
	fpmerge	%f29,	%f16,	%f10
	andcc	%o6,	%g3,	%i7
	alignaddrl	%i2,	%o7,	%l1
	fbn	%fcc1,	loop_893
	sdivx	%g2,	0x0E38,	%o5
	fbule	%fcc1,	loop_894
	st	%f29,	[%l7 + 0x64]
loop_893:
	siam	0x2
	fornot2s	%f21,	%f11,	%f13
loop_894:
	movg	%xcc,	%o4,	%i5
	fmovdg	%xcc,	%f28,	%f15
	fbu,a	%fcc2,	loop_895
	andcc	%i6,	0x09F1,	%i3
	fbu	%fcc3,	loop_896
	tvc	%icc,	0x5
loop_895:
	edge8n	%l6,	%g4,	%i4
	swap	[%l7 + 0x60],	%o0
loop_896:
	smulcc	%o2,	0x0868,	%i0
	fors	%f20,	%f18,	%f4
	fmul8x16al	%f11,	%f7,	%f10
	brnz	%o1,	loop_897
	tvs	%icc,	0x3
	tneg	%icc,	0x3
	subc	%i1,	%g1,	%g5
loop_897:
	smul	%l5,	%l0,	%o3
	srax	%l4,	0x19,	%l3
	be,a	%icc,	loop_898
	tsubcctv	%l2,	0x124B,	%g6
	edge32	%o6,	%g7,	%g3
	orcc	%i2,	0x1954,	%o7
loop_898:
	xnor	%l1,	0x1544,	%g2
	fcmpgt16	%f20,	%f24,	%i7
	faligndata	%f28,	%f26,	%f12
	bn,a,pt	%icc,	loop_899
	fblg,a	%fcc1,	loop_900
	movrgz	%o5,	%i5,	%i6
	mova	%xcc,	%i3,	%l6
loop_899:
	tpos	%xcc,	0x6
loop_900:
	udiv	%o4,	0x128C,	%i4
	brgez	%g4,	loop_901
	andcc	%o2,	0x0789,	%i0
	edge8l	%o0,	%o1,	%i1
	brlz,a	%g5,	loop_902
loop_901:
	sir	0x0300
	udiv	%l5,	0x1B8E,	%l0
	ldsh	[%l7 + 0x2A],	%o3
loop_902:
	fxnor	%f30,	%f10,	%f28
	mulx	%g1,	%l3,	%l2
	set	0x25, %i7
	lduba	[%l7 + %i7] 0x15,	%g6
	fbu	%fcc3,	loop_903
	and	%l4,	%g7,	%o6
	tge	%xcc,	0x2
	fpackfix	%f16,	%f29
loop_903:
	andncc	%i2,	%g3,	%o7
	tvs	%icc,	0x1
	edge8l	%g2,	%i7,	%l1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
	ld	[%l7 + 0x58],	%f27
	tpos	%icc,	0x4
	fnor	%f4,	%f10,	%f24
	tpos	%xcc,	0x0
	tn	%icc,	0x0
	brz,a	%i5,	loop_904
	bneg,a,pn	%xcc,	loop_905
	ba	loop_906
	or	%i6,	0x12FD,	%l6
loop_904:
	fsrc1s	%f11,	%f6
loop_905:
	fmovrdgez	%o4,	%f30,	%f30
loop_906:
	fmovda	%icc,	%f17,	%f0
	pdist	%f30,	%f22,	%f22
	tg	%xcc,	0x5
	tsubcctv	%i4,	0x174D,	%i3
	move	%xcc,	%g4,	%i0
	edge16l	%o0,	%o1,	%o2
	movn	%icc,	%i1,	%l5
	bne,a	loop_907
	fandnot2	%f14,	%f18,	%f10
	udivx	%g5,	0x1D53,	%l0
	alignaddrl	%o3,	%g1,	%l3
loop_907:
	addccc	%l2,	0x1928,	%l4
	addcc	%g6,	%o6,	%g7
	fcmpes	%fcc2,	%f27,	%f6
	movrne	%i2,	%g3,	%o7
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i7
	membar	0x6D
	array16	%l1,	%g2,	%o5
	array32	%i5,	%i6,	%o4
	and	%i4,	0x00A2,	%i3
	add	%l6,	0x0056,	%i0
	fpack16	%f10,	%f11
	popc	%o0,	%o1
	tleu	%xcc,	0x3
	brgez,a	%g4,	loop_908
	addcc	%i1,	%l5,	%g5
	fbo,a	%fcc0,	loop_909
	sdivx	%l0,	0x1893,	%o3
loop_908:
	xnor	%g1,	0x1003,	%l3
	edge8	%l2,	%o2,	%g6
loop_909:
	fmovdne	%icc,	%f2,	%f21
	tleu	%xcc,	0x7
	sdivx	%l4,	0x0F57,	%g7
	movre	%o6,	0x296,	%i2
	tcc	%icc,	0x3
	orcc	%g3,	0x0BD4,	%i7
	tsubcc	%l1,	%g2,	%o7
	fble,a	%fcc1,	loop_910
	movle	%xcc,	%i5,	%i6
	sra	%o5,	%i4,	%i3
	tne	%icc,	0x5
loop_910:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x6C] %asi,	%l6
	edge32n	%i0,	%o0,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f27,	%f14
	std	%f10,	[%l7 + 0x68]
	udiv	%o1,	0x03B4,	%g4
	pdist	%f16,	%f24,	%f26
	edge32ln	%l5,	%i1,	%g5
	ld	[%l7 + 0x54],	%f27
	set	0x38, %g3
	stxa	%o3,	[%l7 + %g3] 0x10
	fbu,a	%fcc3,	loop_911
	edge32n	%l0,	%g1,	%l3
	addc	%l2,	0x0ACB,	%o2
	brnz	%g6,	loop_912
loop_911:
	bshuffle	%f0,	%f20,	%f20
	fbule,a	%fcc3,	loop_913
	taddcc	%g7,	0x016C,	%o6
loop_912:
	popc	0x1BD1,	%i2
	fmovsvc	%xcc,	%f0,	%f26
loop_913:
	bne	%xcc,	loop_914
	tsubcctv	%l4,	0x176B,	%g3
	array16	%l1,	%g2,	%o7
	fmovsleu	%xcc,	%f19,	%f12
loop_914:
	edge16n	%i5,	%i6,	%o5
	movrne	%i4,	0x110,	%i7
	fcmpeq16	%f6,	%f28,	%l6
	array8	%i3,	%o0,	%i0
	umul	%o4,	0x1161,	%g4
	fbug	%fcc3,	loop_915
	movleu	%icc,	%o1,	%l5
	stbar
	fba,a	%fcc1,	loop_916
loop_915:
	fpsub32s	%f1,	%f25,	%f20
	orcc	%i1,	0x09C0,	%o3
	tn	%icc,	0x3
loop_916:
	orcc	%g5,	0x18A6,	%g1
	edge16n	%l0,	%l3,	%l2
	te	%icc,	0x5
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x30] %asi,	%g6
	smul	%o2,	%o6,	%i2
	edge32	%l4,	%g3,	%l1
	fmovdleu	%xcc,	%f22,	%f15
	fmul8ulx16	%f28,	%f24,	%f10
	pdist	%f24,	%f2,	%f10
	tsubcctv	%g2,	%g7,	%o7
	fmul8x16	%f21,	%f24,	%f18
	popc	0x0DA1,	%i6
	sdiv	%i5,	0x1601,	%i4
	fmovrdgez	%o5,	%f30,	%f24
	umul	%i7,	%i3,	%l6
	edge32ln	%o0,	%i0,	%g4
	fbne,a	%fcc2,	loop_917
	popc	%o4,	%l5
	orncc	%i1,	0x07D6,	%o1
	fmul8sux16	%f22,	%f6,	%f14
loop_917:
	srax	%g5,	%g1,	%o3
	fmovrsgz	%l3,	%f10,	%f30
	mulx	%l2,	%l0,	%o2
	srax	%o6,	%i2,	%g6
	set	0x2B, %i0
	ldstuba	[%l7 + %i0] 0x80,	%l4
	movl	%icc,	%g3,	%g2
	tcs	%xcc,	0x5
	alignaddr	%g7,	%o7,	%i6
	tl	%icc,	0x5
	fornot2	%f2,	%f2,	%f14
	tpos	%xcc,	0x1
	mulx	%i5,	0x1A89,	%i4
	st	%f7,	[%l7 + 0x70]
	srl	%l1,	0x1A,	%i7
	fbne,a	%fcc3,	loop_918
	fbule,a	%fcc3,	loop_919
	mova	%xcc,	%i3,	%l6
	fexpand	%f24,	%f16
loop_918:
	fmovdneg	%icc,	%f28,	%f25
loop_919:
	fcmpd	%fcc0,	%f22,	%f14
	fbg	%fcc0,	loop_920
	tneg	%icc,	0x5
	bgu,a	%xcc,	loop_921
	smul	%o5,	%o0,	%g4
loop_920:
	fbul,a	%fcc2,	loop_922
	std	%f14,	[%l7 + 0x58]
loop_921:
	bcc,a	loop_923
	array8	%i0,	%o4,	%l5
loop_922:
	subc	%o1,	%g5,	%g1
	fbue,a	%fcc2,	loop_924
loop_923:
	fbule	%fcc3,	loop_925
	fmovrslz	%o3,	%f8,	%f18
	fmovd	%f2,	%f8
loop_924:
	smulcc	%i1,	%l3,	%l2
loop_925:
	srlx	%l0,	0x06,	%o2
	edge16n	%o6,	%i2,	%g6
	edge16ln	%l4,	%g2,	%g3
	fbg	%fcc2,	loop_926
	alignaddrl	%g7,	%o7,	%i6
	edge8n	%i4,	%l1,	%i7
	edge16l	%i5,	%i3,	%l6
loop_926:
	fornot2	%f4,	%f14,	%f2
	fbule	%fcc2,	loop_927
	brgz,a	%o0,	loop_928
	orcc	%g4,	%o5,	%o4
	nop
	set	0x70, %g5
	ldsb	[%l7 + %g5],	%i0
loop_927:
	nop
	set	0x22, %g6
	ldsba	[%l7 + %g6] 0x88,	%l5
loop_928:
	movleu	%xcc,	%o1,	%g5
	ld	[%l7 + 0x34],	%f22
	fbu	%fcc0,	loop_929
	movpos	%xcc,	%o3,	%g1
	fbge,a	%fcc2,	loop_930
	fcmpgt32	%f12,	%f0,	%i1
loop_929:
	swap	[%l7 + 0x44],	%l3
	bneg,a	%icc,	loop_931
loop_930:
	move	%xcc,	%l2,	%o2
	fmul8ulx16	%f16,	%f14,	%f8
	movg	%xcc,	%l0,	%o6
loop_931:
	tleu	%xcc,	0x7
	xnorcc	%i2,	0x1746,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x18,	%g6,	%g3
	fcmpd	%fcc2,	%f0,	%f20
	edge16l	%g2,	%g7,	%i6
	ba	loop_932
	and	%i4,	0x1AD5,	%o7
	orncc	%l1,	%i5,	%i7
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%i3
loop_932:
	call	loop_933
	array8	%l6,	%g4,	%o5
	tvc	%xcc,	0x4
	orn	%o4,	%i0,	%o0
loop_933:
	addcc	%o1,	0x00B6,	%l5
	fpadd32	%f18,	%f0,	%f10
	edge8l	%g5,	%g1,	%i1
	ldd	[%l7 + 0x38],	%o2
	sdivx	%l3,	0x02A0,	%o2
	wr	%g0,	0xeb,	%asi
	stha	%l2,	[%l7 + 0x78] %asi
	membar	#Sync
	fnegd	%f8,	%f2
	std	%f12,	[%l7 + 0x70]
	ldsh	[%l7 + 0x5C],	%o6
	bneg,a,pt	%xcc,	loop_934
	ba,pt	%xcc,	loop_935
	fmovdpos	%icc,	%f14,	%f8
	nop
	set	0x10, %g1
	ldx	[%l7 + %g1],	%l0
loop_934:
	taddcc	%i2,	%l4,	%g3
loop_935:
	movneg	%icc,	%g6,	%g7
	movre	%i6,	0x11F,	%g2
	fsrc2	%f20,	%f24
	stb	%o7,	[%l7 + 0x34]
	edge16	%l1,	%i4,	%i7
	addc	%i5,	%i3,	%g4
	edge8ln	%l6,	%o5,	%o4
	edge16	%i0,	%o1,	%l5
	movvc	%xcc,	%g5,	%g1
	bl,a,pt	%icc,	loop_936
	andcc	%i1,	0x0BE3,	%o0
	lduw	[%l7 + 0x0C],	%o3
	stx	%l3,	[%l7 + 0x50]
loop_936:
	umulcc	%l2,	%o6,	%o2
	fpackfix	%f10,	%f14
	edge32	%l0,	%i2,	%g3
	fmovsvc	%icc,	%f30,	%f20
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x88,	%f16
	siam	0x2
	tle	%icc,	0x0
	movne	%xcc,	%l4,	%g7
	andcc	%g6,	0x09F0,	%i6
	tneg	%icc,	0x5
	bn,a,pt	%icc,	loop_937
	sethi	0x1FF6,	%g2
	tleu	%xcc,	0x5
	sdivx	%l1,	0x1E9B,	%i4
loop_937:
	edge8n	%o7,	%i5,	%i3
	movrgez	%i7,	0x34D,	%l6
	movrne	%o5,	%o4,	%i0
	tleu	%xcc,	0x7
	for	%f16,	%f22,	%f26
	edge8	%g4,	%o1,	%g5
	mulscc	%l5,	%i1,	%o0
	sir	0x0695
	sdivcc	%g1,	0x068A,	%o3
	fmovsg	%xcc,	%f26,	%f24
	fmovsn	%icc,	%f9,	%f3
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fabsd	%f20,	%f20
	tneg	%icc,	0x5
	andcc	%l3,	0x1AE3,	%o6
	fcmpeq16	%f30,	%f6,	%o2
	fmovsneg	%icc,	%f25,	%f7
	fones	%f5
	nop
	setx	loop_938,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%l0,	0x1F,	%i2
	fbge	%fcc0,	loop_939
	fcmped	%fcc0,	%f28,	%f18
loop_938:
	fornot2	%f16,	%f12,	%f18
	smulcc	%g3,	%l4,	%l2
loop_939:
	movcs	%xcc,	%g7,	%i6
	udiv	%g2,	0x0A51,	%l1
	movg	%icc,	%g6,	%i4
	fbu	%fcc3,	loop_940
	fcmpes	%fcc3,	%f9,	%f22
	edge32n	%i5,	%o7,	%i7
	array8	%i3,	%o5,	%l6
loop_940:
	movrgez	%o4,	0x3BB,	%g4
	andcc	%i0,	%o1,	%g5
	membar	0x34
	udiv	%i1,	0x10F6,	%o0
	set	0x59, %o2
	stba	%l5,	[%l7 + %o2] 0x15
	sll	%o3,	%l3,	%g1
	ld	[%l7 + 0x38],	%f24
	fbg	%fcc0,	loop_941
	fzeros	%f2
	fsrc1s	%f13,	%f16
	udiv	%o6,	0x1B81,	%l0
loop_941:
	faligndata	%f0,	%f24,	%f14
	tpos	%xcc,	0x0
	fmovrsgz	%i2,	%f26,	%f5
	fpmerge	%f29,	%f7,	%f4
	move	%xcc,	%o2,	%l4
	smul	%l2,	%g3,	%g7
	alignaddrl	%i6,	%l1,	%g6
	fandnot1s	%f16,	%f10,	%f0
	fandnot2s	%f0,	%f8,	%f26
	or	%g2,	0x0C55,	%i4
	or	%i5,	%o7,	%i7
	addcc	%i3,	%o5,	%o4
	andn	%l6,	%i0,	%o1
	fornot1s	%f23,	%f2,	%f12
	tge	%xcc,	0x3
	movpos	%icc,	%g4,	%i1
	mulscc	%g5,	0x1E55,	%o0
	sdivcc	%o3,	0x1106,	%l3
	taddcctv	%g1,	0x0929,	%l5
	ble,a	%xcc,	loop_942
	edge8ln	%l0,	%i2,	%o6
	ta	%icc,	0x3
	xorcc	%l4,	%l2,	%g3
loop_942:
	tgu	%icc,	0x3
	fornot2	%f8,	%f10,	%f28
	tsubcc	%g7,	0x073D,	%i6
	brlez,a	%l1,	loop_943
	fmovdne	%xcc,	%f5,	%f27
	movgu	%xcc,	%g6,	%o2
	tgu	%xcc,	0x6
loop_943:
	mulx	%g2,	%i4,	%i5
	smulcc	%o7,	0x12EF,	%i7
	edge16n	%i3,	%o4,	%l6
	taddcctv	%o5,	0x00E8,	%o1
	xor	%i0,	0x1B75,	%i1
	movgu	%xcc,	%g5,	%o0
	bne	%icc,	loop_944
	movvc	%icc,	%o3,	%g4
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x0E] %asi,	%g1
loop_944:
	lduw	[%l7 + 0x40],	%l5
	mulx	%l0,	0x11A6,	%i2
	movge	%xcc,	%l3,	%l4
	edge16ln	%o6,	%g3,	%g7
	fmovrdne	%l2,	%f12,	%f0
	tle	%icc,	0x6
	movrgez	%i6,	%g6,	%o2
	array8	%l1,	%i4,	%g2
	array32	%i5,	%i7,	%o7
	array16	%i3,	%o4,	%o5
	fxor	%f12,	%f2,	%f8
	set	0x2C, %o5
	sta	%f23,	[%l7 + %o5] 0x15
	fsrc1	%f8,	%f14
	fmovde	%xcc,	%f13,	%f20
	fandnot2	%f10,	%f30,	%f28
	nop
	setx	loop_945,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32	%o1,	%i0,	%i1
	lduw	[%l7 + 0x7C],	%l6
	nop
	setx loop_946, %l0, %l1
	jmpl %l1, %o0
loop_945:
	lduw	[%l7 + 0x54],	%g5
	movg	%xcc,	%g4,	%o3
	sdivcc	%g1,	0x00AD,	%l0
loop_946:
	nop
	set	0x34, %o3
	stb	%i2,	[%l7 + %o3]
	bpos,a,pn	%icc,	loop_947
	fmovrdlz	%l5,	%f2,	%f24
	stw	%l3,	[%l7 + 0x14]
	movrgz	%o6,	0x078,	%g3
loop_947:
	taddcctv	%g7,	%l4,	%l2
	edge32ln	%i6,	%g6,	%o2
	fnot2	%f4,	%f2
	edge16n	%l1,	%g2,	%i5
	tgu	%xcc,	0x4
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x1e,	%f0
	movn	%xcc,	%i4,	%i7
	tvc	%xcc,	0x3
	set	0x44, %i5
	swapa	[%l7 + %i5] 0x18,	%i3
	fmovrse	%o7,	%f24,	%f16
	te	%xcc,	0x4
	movcs	%xcc,	%o4,	%o5
	fornot1s	%f20,	%f1,	%f10
	movcc	%xcc,	%i0,	%i1
	bvs,a	loop_948
	popc	%l6,	%o0
	movne	%icc,	%g5,	%o1
	bgu,pn	%xcc,	loop_949
loop_948:
	fbg,a	%fcc3,	loop_950
	tsubcc	%g4,	0x1BDE,	%o3
	membar	0x0D
loop_949:
	sdivx	%g1,	0x053F,	%i2
loop_950:
	movgu	%xcc,	%l5,	%l0
	fbue,a	%fcc0,	loop_951
	ba,pn	%xcc,	loop_952
	xnor	%l3,	0x0AA2,	%g3
	movvc	%xcc,	%g7,	%o6
loop_951:
	movcc	%icc,	%l4,	%i6
loop_952:
	edge16n	%l2,	%g6,	%o2
	set	0x0, %g2
	stxa	%l1,	[%g0 + %g2] 0x5f
	fba	%fcc3,	loop_953
	fcmpd	%fcc1,	%f16,	%f10
	sll	%i5,	%g2,	%i4
	edge16	%i7,	%o7,	%o4
loop_953:
	movre	%i3,	%o5,	%i0
	ldd	[%l7 + 0x48],	%i0
	edge8	%o0,	%g5,	%o1
	mova	%icc,	%g4,	%o3
	movg	%icc,	%g1,	%i2
	bn	%icc,	loop_954
	sdiv	%l6,	0x15D2,	%l5
	nop
	setx loop_955, %l0, %l1
	jmpl %l1, %l0
	nop
	setx	loop_956,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_954:
	fmovdge	%icc,	%f21,	%f5
	fbne,a	%fcc0,	loop_957
loop_955:
	fbuge,a	%fcc3,	loop_958
loop_956:
	bvc,pt	%xcc,	loop_959
	movrgez	%l3,	0x233,	%g3
loop_957:
	fmovscs	%icc,	%f1,	%f29
loop_958:
	addcc	%g7,	%l4,	%i6
loop_959:
	nop
	setx loop_960, %l0, %l1
	jmpl %l1, %o6
	sra	%l2,	%o2,	%l1
	brlez,a	%g6,	loop_961
	flush	%l7 + 0x1C
loop_960:
	fmovrslz	%g2,	%f18,	%f11
	std	%f16,	[%l7 + 0x78]
loop_961:
	taddcc	%i5,	%i4,	%o7
	tcs	%xcc,	0x4
	popc	%o4,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x0C],	%i3
	tsubcctv	%i0,	%i1,	%o0
	and	%g5,	0x11D9,	%o1
	ble,a,pt	%icc,	loop_962
	fmovrsgez	%o5,	%f6,	%f1
	array16	%o3,	%g1,	%g4
	fmovdpos	%icc,	%f21,	%f10
loop_962:
	tvc	%icc,	0x3
	fmul8x16	%f17,	%f16,	%f0
	movrlez	%i2,	0x212,	%l5
	fandnot2	%f22,	%f24,	%f14
	or	%l6,	0x0F3D,	%l3
	brlez	%l0,	loop_963
	subc	%g7,	0x1941,	%g3
	movrlez	%i6,	0x18E,	%o6
	tl	%icc,	0x6
loop_963:
	alignaddr	%l4,	%l2,	%l1
	prefetch	[%l7 + 0x40],	 0x0
	te	%xcc,	0x3
	movrlez	%o2,	0x1E9,	%g6
	brz	%g2,	loop_964
	alignaddr	%i4,	%i5,	%o4
	ld	[%l7 + 0x24],	%f29
	movgu	%xcc,	%i7,	%o7
loop_964:
	fmul8ulx16	%f28,	%f22,	%f26
	sll	%i0,	%i1,	%o0
	fbue	%fcc3,	loop_965
	add	%g5,	0x04A4,	%i3
	sllx	%o5,	%o3,	%g1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x64] %asi,	%g4
loop_965:
	edge32n	%o1,	%i2,	%l5
	tcc	%icc,	0x3
	nop
	setx	loop_966,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tleu	%icc,	0x7
	bg	loop_967
	fcmpeq16	%f18,	%f28,	%l3
loop_966:
	edge32	%l0,	%l6,	%g3
	bge	loop_968
loop_967:
	fabsd	%f22,	%f20
	ta	%xcc,	0x1
	addc	%i6,	%o6,	%g7
loop_968:
	edge8	%l2,	%l1,	%o2
	wr	%g0,	0x0c,	%asi
	stha	%g6,	[%l7 + 0x28] %asi
	tvc	%xcc,	0x1
	edge16l	%g2,	%i4,	%l4
	movle	%icc,	%i5,	%o4
	set	0x29, %o7
	stba	%i7,	[%l7 + %o7] 0x88
	umulcc	%o7,	%i0,	%o0
	edge32l	%g5,	%i3,	%i1
	andncc	%o3,	%g1,	%o5
	edge8n	%g4,	%o1,	%i2
	tg	%xcc,	0x2
	stbar
	movvc	%icc,	%l5,	%l0
	movne	%xcc,	%l3,	%l6
	prefetch	[%l7 + 0x18],	 0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i6,	%g3,	%o6
	add	%l2,	%g7,	%o2
	addcc	%l1,	%g6,	%i4
	fblg,a	%fcc1,	loop_969
	alignaddr	%g2,	%l4,	%i5
	movne	%xcc,	%o4,	%i7
	brlz,a	%o7,	loop_970
loop_969:
	bge,a,pt	%xcc,	loop_971
	fmovdgu	%xcc,	%f27,	%f15
	fcmpes	%fcc2,	%f24,	%f12
loop_970:
	fmovs	%f1,	%f5
loop_971:
	tcs	%xcc,	0x2
	addccc	%o0,	0x1486,	%i0
	tle	%xcc,	0x2
	te	%xcc,	0x1
	set	0x09, %o6
	ldstuba	[%l7 + %o6] 0x11,	%i3
	fmovrse	%i1,	%f4,	%f30
	edge8l	%o3,	%g1,	%o5
	tne	%icc,	0x1
	movvs	%icc,	%g4,	%o1
	srlx	%g5,	%l5,	%i2
	fmovrdlz	%l0,	%f16,	%f8
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x0C] %asi,	%f8
	fcmple16	%f30,	%f2,	%l6
	fcmpeq16	%f2,	%f14,	%i6
	xnorcc	%l3,	0x0C7D,	%g3
	fmovsgu	%xcc,	%f1,	%f3
	fmovsvs	%icc,	%f22,	%f18
	fba	%fcc3,	loop_972
	fbne,a	%fcc0,	loop_973
	xnorcc	%o6,	0x014B,	%l2
	set	0x4D, %o1
	stba	%g7,	[%l7 + %o1] 0x81
loop_972:
	fnot1	%f18,	%f18
loop_973:
	smul	%l1,	0x129A,	%o2
	edge8ln	%i4,	%g6,	%l4
	xorcc	%i5,	%g2,	%o4
	fmovrdgz	%o7,	%f12,	%f28
	edge32n	%o0,	%i7,	%i3
	stbar
	movrgz	%i1,	%i0,	%g1
	udivcc	%o3,	0x0461,	%o5
	sra	%g4,	%g5,	%l5
	wr	%g0,	0x81,	%asi
	stda	%o0,	[%l7 + 0x68] %asi
	sdivcc	%l0,	0x11D9,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x1
	fnot1s	%f2,	%f26
	fmovdle	%xcc,	%f20,	%f21
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x51] %asi,	%l6
	tcs	%xcc,	0x4
	andcc	%l3,	%i6,	%o6
	taddcctv	%l2,	0x177C,	%g3
	tvs	%icc,	0x3
	stw	%l1,	[%l7 + 0x10]
	fmovdl	%xcc,	%f13,	%f19
	fblg	%fcc3,	loop_974
	prefetch	[%l7 + 0x78],	 0x1
	fcmpd	%fcc0,	%f18,	%f6
	fpsub32	%f2,	%f24,	%f28
loop_974:
	prefetch	[%l7 + 0x40],	 0x3
	sllx	%o2,	%g7,	%i4
	orn	%l4,	0x08CD,	%g6
	brgz	%g2,	loop_975
	fble	%fcc1,	loop_976
	tneg	%icc,	0x6
	fpsub32	%f18,	%f28,	%f6
loop_975:
	orn	%i5,	%o4,	%o7
loop_976:
	array8	%o0,	%i3,	%i1
	set	0x31, %i1
	lduba	[%l7 + %i1] 0x19,	%i0
	edge32	%i7,	%o3,	%g1
	faligndata	%f8,	%f8,	%f12
	taddcctv	%o5,	0x0240,	%g5
	smul	%g4,	%o1,	%l0
	mulscc	%l5,	%i2,	%l3
	set	0x0E, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i6
	addc	%l6,	%l2,	%g3
	xnorcc	%o6,	%l1,	%o2
	bcs,a,pn	%icc,	loop_977
	sth	%i4,	[%l7 + 0x60]
	fbul,a	%fcc0,	loop_978
	fexpand	%f12,	%f12
loop_977:
	fmul8x16	%f13,	%f24,	%f2
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%g7,	[%g0 + 0x3a0] %asi ripped by fixASI40.pl ripped by fixASI40.pl
loop_978:
	fxors	%f22,	%f29,	%f25
	fbge	%fcc3,	loop_979
	udivcc	%g6,	0x1050,	%g2
	srlx	%i5,	0x0F,	%o4
	faligndata	%f4,	%f28,	%f28
loop_979:
	movre	%l4,	%o0,	%i3
	movcc	%xcc,	%o7,	%i1
	tsubcc	%i0,	0x1EE2,	%i7
	tsubcc	%g1,	0x1CDE,	%o3
	tcs	%icc,	0x3
	movrlz	%o5,	0x2F1,	%g5
	nop
	setx	loop_980,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%icc,	%g4,	%o1
	srlx	%l0,	%l5,	%i2
	movl	%xcc,	%i6,	%l3
loop_980:
	andncc	%l6,	%g3,	%o6
	fmovrsne	%l1,	%f13,	%f6
	fcmpd	%fcc2,	%f24,	%f22
	movcc	%xcc,	%l2,	%o2
	fzeros	%f0
	umulcc	%i4,	0x189F,	%g6
	edge16n	%g2,	%g7,	%o4
	sir	0x0004
	mulx	%l4,	0x1648,	%i5
	sub	%i3,	%o0,	%i1
	sdivcc	%i0,	0x06FD,	%o7
	tne	%xcc,	0x5
	subccc	%i7,	0x0D20,	%g1
	fmul8x16au	%f1,	%f26,	%f16
	set	0x10, %l4
	ldxa	[%g0 + %l4] 0x20,	%o5
	fbu	%fcc1,	loop_981
	edge16	%o3,	%g4,	%g5
	be,a,pt	%icc,	loop_982
	tcc	%icc,	0x2
loop_981:
	fcmple32	%f10,	%f30,	%o1
	or	%l5,	0x018D,	%i2
loop_982:
	brgez,a	%i6,	loop_983
	fmovrslez	%l0,	%f2,	%f29
	fpsub32	%f14,	%f8,	%f26
	tvs	%icc,	0x3
loop_983:
	movgu	%xcc,	%l6,	%l3
	fblg	%fcc1,	loop_984
	tne	%icc,	0x7
	movrlz	%o6,	%g3,	%l1
	movrgz	%l2,	0x009,	%i4
loop_984:
	fabss	%f25,	%f8
	tl	%icc,	0x1
	subcc	%o2,	%g2,	%g7
	mulscc	%g6,	%o4,	%i5
	sll	%i3,	%l4,	%o0
	array16	%i0,	%o7,	%i1
	brz,a	%g1,	loop_985
	movcc	%icc,	%o5,	%o3
	fbue,a	%fcc0,	loop_986
	mulscc	%i7,	%g5,	%o1
loop_985:
	nop
	set	0x2F, %o0
	lduba	[%l7 + %o0] 0x10,	%l5
loop_986:
	fsrc2s	%f24,	%f0
	tsubcctv	%i2,	%i6,	%l0
	nop
	set	0x52, %i6
	sth	%g4,	[%l7 + %i6]
	umulcc	%l6,	%o6,	%g3
	bg	%icc,	loop_987
	array16	%l3,	%l2,	%l1
	movn	%xcc,	%i4,	%o2
	edge16n	%g7,	%g6,	%g2
loop_987:
	addcc	%i5,	0x0802,	%o4
	subcc	%l4,	%i3,	%o0
	orcc	%o7,	%i1,	%g1
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x0C] %asi,	%o5
	fnot1	%f18,	%f12
	set	0x60, %l1
	lduwa	[%l7 + %l1] 0x80,	%i0
	movg	%icc,	%i7,	%o3
	tcc	%xcc,	0x4
	movge	%icc,	%g5,	%o1
	taddcctv	%l5,	0x1014,	%i2
	fpadd32s	%f11,	%f24,	%f10
	array16	%i6,	%l0,	%l6
	fmul8sux16	%f16,	%f30,	%f14
	tcs	%xcc,	0x3
	be	%icc,	loop_988
	nop
	setx	loop_989,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%xcc,	0x4
	movge	%icc,	%o6,	%g3
loop_988:
	movvc	%xcc,	%l3,	%g4
loop_989:
	nop
	setx	loop_990,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8ulx16	%f2,	%f30,	%f14
	movvc	%icc,	%l1,	%i4
	movl	%xcc,	%o2,	%g7
loop_990:
	movre	%l2,	%g2,	%i5
	movvs	%xcc,	%g6,	%o4
	subccc	%i3,	0x0574,	%o0
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x17,	%f16
	array8	%l4,	%i1,	%o7
	ldsw	[%l7 + 0x70],	%o5
	membar	0x39
	fbo	%fcc2,	loop_991
	movcs	%icc,	%i0,	%i7
	fmovdvc	%xcc,	%f8,	%f27
	mova	%xcc,	%o3,	%g1
loop_991:
	fmovscs	%xcc,	%f9,	%f6
	fmovsneg	%xcc,	%f19,	%f28
	tn	%icc,	0x7
	movcc	%xcc,	%o1,	%g5
	prefetch	[%l7 + 0x5C],	 0x2
	and	%l5,	%i6,	%l0
	xnorcc	%l6,	0x0205,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x36, %g7
	ldsha	[%l7 + %g7] 0x89,	%i2
	wr	%g0,	0x18,	%asi
	stha	%g3,	[%l7 + 0x70] %asi
	fmovrdlz	%g4,	%f12,	%f18
	fmovscc	%icc,	%f24,	%f7
	bge	loop_992
	alignaddr	%l1,	%l3,	%o2
	fmovsle	%xcc,	%f25,	%f6
	nop
	set	0x3D, %l0
	ldstub	[%l7 + %l0],	%g7
loop_992:
	movrgez	%l2,	%g2,	%i4
	wr	%g0,	0x0c,	%asi
	stda	%g6,	[%l7 + 0x48] %asi
	set	0x28, %l3
	ldswa	[%l7 + %l3] 0x18,	%i5
	ba,a,pt	%icc,	loop_993
	fmovsneg	%xcc,	%f9,	%f18
	fmovrslez	%o4,	%f2,	%f28
	nop
	set	0x64, %i4
	stw	%i3,	[%l7 + %i4]
loop_993:
	bg,a,pt	%icc,	loop_994
	ld	[%l7 + 0x20],	%f19
	call	loop_995
	movneg	%xcc,	%o0,	%i1
loop_994:
	ble,a,pt	%xcc,	loop_996
	tsubcc	%o7,	0x0F01,	%o5
loop_995:
	nop
	set	0x08, %l2
	prefetcha	[%l7 + %l2] 0x14,	 0x3
loop_996:
	fandnot1s	%f2,	%f21,	%f25
	movrgez	%i7,	%o3,	%l4
	movre	%g1,	0x354,	%o1
	mulx	%g5,	0x09C6,	%i6
	be	%xcc,	loop_997
	te	%xcc,	0x4
	movrlez	%l5,	%l6,	%o6
	fzero	%f2
loop_997:
	subccc	%i2,	%g3,	%l0
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x1B] %asi,	%g4
	taddcctv	%l1,	0x1E1C,	%o2
	faligndata	%f8,	%f0,	%f24
	ld	[%l7 + 0x58],	%f11
	umulcc	%l3,	0x0BF7,	%g7
	edge32	%g2,	%l2,	%g6
	fmovrdlz	%i4,	%f24,	%f16
	addc	%i5,	0x0B33,	%o4
	fmovsle	%icc,	%f30,	%f23
	umul	%o0,	0x1FBC,	%i1
	fnor	%f12,	%f4,	%f14
	bcs,a,pt	%xcc,	loop_998
	udivx	%i3,	0x143E,	%o7
	bgu,a	%xcc,	loop_999
	bl	loop_1000
loop_998:
	tcs	%xcc,	0x6
	movgu	%xcc,	%i0,	%o5
loop_999:
	fsrc1s	%f5,	%f5
loop_1000:
	bvc	%xcc,	loop_1001
	movneg	%icc,	%i7,	%l4
	srl	%g1,	%o1,	%g5
	fcmped	%fcc2,	%f4,	%f24
loop_1001:
	bvs,pt	%xcc,	loop_1002
	subc	%o3,	0x11A8,	%l5
	set	0x5D, %i7
	ldsba	[%l7 + %i7] 0x0c,	%i6
loop_1002:
	bne,pt	%xcc,	loop_1003
	fmovdne	%xcc,	%f1,	%f21
	sir	0x10D0
	tl	%icc,	0x2
loop_1003:
	fcmpgt16	%f4,	%f26,	%o6
	edge32n	%i2,	%g3,	%l6
	brnz,a	%l0,	loop_1004
	ldd	[%l7 + 0x28],	%f8
	nop
	setx	loop_1005,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%xcc,	0x7
loop_1004:
	sllx	%g4,	0x19,	%o2
	fpsub32s	%f24,	%f3,	%f20
loop_1005:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f9,	[%l7 + 0x20] %asi
	fmovdl	%xcc,	%f20,	%f30
	andcc	%l1,	0x13C9,	%l3
	fbn	%fcc1,	loop_1006
	fble	%fcc0,	loop_1007
	edge16	%g7,	%g2,	%g6
	nop
	set	0x08, %l6
	stx	%l2,	[%l7 + %l6]
loop_1006:
	andcc	%i5,	%i4,	%o4
loop_1007:
	tcc	%xcc,	0x0
	fmovdl	%icc,	%f27,	%f7
	edge8	%o0,	%i1,	%o7
	movge	%xcc,	%i3,	%i0
	fnot1	%f16,	%f18
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x78] %asi,	%o5
	ldd	[%l7 + 0x38],	%f28
	movpos	%xcc,	%i7,	%g1
	orn	%o1,	%l4,	%o3
	fone	%f16
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	sdivcc	%i6,	0x18AC,	%o6
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l5
	movge	%icc,	%i2,	%l6
	alignaddrl	%g3,	%g4,	%l0
	ta	%icc,	0x4
	addccc	%l1,	%o2,	%l3
	stbar
	edge8l	%g2,	%g7,	%l2
	udiv	%i5,	0x0B1E,	%g6
	fnot1s	%f20,	%f2
	udiv	%i4,	0x14B1,	%o4
	fmovsneg	%icc,	%f28,	%f20
	movrne	%i1,	%o7,	%i3
	subc	%o0,	%i0,	%o5
	st	%f19,	[%l7 + 0x24]
	fnands	%f10,	%f10,	%f26
	movcs	%icc,	%i7,	%g1
	tne	%icc,	0x4
	array16	%l4,	%o1,	%o3
	smulcc	%i6,	%o6,	%g5
	nop
	set	0x70, %g3
	stw	%i2,	[%l7 + %g3]
	fors	%f17,	%f6,	%f20
	fmovrdlez	%l5,	%f8,	%f20
	tcs	%icc,	0x4
	fandnot1	%f14,	%f2,	%f2
	xor	%l6,	%g3,	%l0
	bge,a	%icc,	loop_1008
	fbuge	%fcc3,	loop_1009
	edge16ln	%l1,	%g4,	%l3
	movpos	%xcc,	%o2,	%g2
loop_1008:
	bne,a,pn	%icc,	loop_1010
loop_1009:
	smulcc	%l2,	%g7,	%i5
	movge	%xcc,	%i4,	%g6
	tsubcctv	%o4,	%i1,	%i3
loop_1010:
	movgu	%icc,	%o7,	%o0
	udiv	%o5,	0x12CE,	%i0
	edge16l	%g1,	%i7,	%o1
	movpos	%icc,	%l4,	%i6
	fbne	%fcc3,	loop_1011
	bleu,pn	%xcc,	loop_1012
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f5,	%f19
loop_1011:
	fbug	%fcc2,	loop_1013
loop_1012:
	movg	%xcc,	%o6,	%o3
	fmovscs	%xcc,	%f25,	%f4
	fbo	%fcc2,	loop_1014
loop_1013:
	movl	%icc,	%g5,	%i2
	tsubcc	%l6,	%g3,	%l5
	edge32ln	%l0,	%g4,	%l1
loop_1014:
	fcmpgt16	%f10,	%f6,	%l3
	addccc	%o2,	%g2,	%g7
	orn	%l2,	%i5,	%g6
	srlx	%i4,	0x02,	%i1
	movleu	%icc,	%i3,	%o7
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x2E] %asi,	%o4
	fmovdge	%xcc,	%f6,	%f21
	stx	%o0,	[%l7 + 0x10]
	bpos,a	%icc,	loop_1015
	bl	%xcc,	loop_1016
	fnor	%f18,	%f22,	%f18
	std	%o4,	[%l7 + 0x58]
loop_1015:
	fmovde	%icc,	%f24,	%f9
loop_1016:
	or	%g1,	%i7,	%i0
	membar	0x7C
	udiv	%l4,	0x04A3,	%o1
	fmovdge	%xcc,	%f15,	%f31
	movl	%xcc,	%o6,	%i6
	ldd	[%l7 + 0x70],	%g4
	fble,a	%fcc1,	loop_1017
	fmuld8sux16	%f5,	%f23,	%f0
	set	0x76, %g5
	stha	%i2,	[%l7 + %g5] 0xe2
	membar	#Sync
loop_1017:
	edge16n	%o3,	%l6,	%l5
	edge8n	%l0,	%g3,	%l1
	ta	%icc,	0x0
	alignaddr	%g4,	%o2,	%l3
	srax	%g7,	%g2,	%i5
	bleu,pt	%xcc,	loop_1018
	tpos	%icc,	0x5
	ta	%icc,	0x4
	ld	[%l7 + 0x20],	%f30
loop_1018:
	srl	%l2,	%i4,	%g6
	alignaddrl	%i1,	%o7,	%i3
	or	%o4,	%o5,	%g1
	xnorcc	%i7,	0x120E,	%o0
	movre	%i0,	%o1,	%o6
	fmovdl	%icc,	%f11,	%f9
	set	0x1D, %g6
	stba	%i6,	[%l7 + %g6] 0x0c
	fba,a	%fcc3,	loop_1019
	movn	%icc,	%g5,	%l4
	movle	%xcc,	%o3,	%l6
	fmovrse	%l5,	%f23,	%f7
loop_1019:
	movg	%icc,	%i2,	%l0
	ta	%icc,	0x1
	orcc	%g3,	0x1749,	%g4
	edge32ln	%o2,	%l3,	%l1
	te	%xcc,	0x5
	tsubcc	%g7,	0x0DC3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i5,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f26,	%f8,	%f10
	tvs	%icc,	0x7
	fand	%f24,	%f6,	%f18
	xor	%i4,	0x0458,	%i1
	brlz	%o7,	loop_1020
	fbug	%fcc1,	loop_1021
	movvs	%xcc,	%g6,	%o4
	fmovspos	%xcc,	%f19,	%f13
loop_1020:
	fcmpd	%fcc2,	%f18,	%f6
loop_1021:
	movg	%icc,	%o5,	%g1
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x5E] %asi,	%i7
	ldx	[%l7 + 0x68],	%i3
	popc	0x112C,	%o0
	siam	0x0
	brgez	%o1,	loop_1022
	srlx	%i0,	%o6,	%g5
	array32	%l4,	%i6,	%o3
	movl	%icc,	%l6,	%l5
loop_1022:
	fbne	%fcc0,	loop_1023
	movg	%icc,	%l0,	%i2
	addcc	%g4,	0x1445,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1023:
	edge8	%g3,	%l3,	%g7
	andncc	%l1,	%g2,	%i5
	edge32ln	%i4,	%l2,	%i1
	addccc	%o7,	0x0075,	%g6
	tvs	%icc,	0x1
	stbar
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o5,	%o4,	%i7
	fsrc2	%f30,	%f24
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%g1
	edge16l	%i3,	%o1,	%i0
	popc	%o6,	%g5
	mulx	%o0,	0x081A,	%l4
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x78] %asi,	%o3
	smul	%l6,	%l5,	%i6
	array8	%i2,	%l0,	%g4
	sdivx	%o2,	0x0DB4,	%l3
	edge8ln	%g3,	%l1,	%g2
	sethi	0x1985,	%i5
	movg	%xcc,	%g7,	%l2
	fmovrsgez	%i1,	%f12,	%f4
	fpadd16	%f18,	%f18,	%f8
	bne,a	%icc,	loop_1024
	edge16n	%i4,	%g6,	%o5
	sra	%o7,	%o4,	%i7
	movrne	%g1,	%o1,	%i3
loop_1024:
	fbo,a	%fcc3,	loop_1025
	addccc	%i0,	%g5,	%o0
	brgez,a	%o6,	loop_1026
	xor	%o3,	0x0A6D,	%l6
loop_1025:
	stx	%l5,	[%l7 + 0x10]
	brnz,a	%i6,	loop_1027
loop_1026:
	ble,pt	%xcc,	loop_1028
	andcc	%i2,	0x1FCF,	%l4
	tge	%icc,	0x6
loop_1027:
	movre	%g4,	%l0,	%o2
loop_1028:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l3,	%l1
	xorcc	%g2,	%g3,	%g7
	stw	%l2,	[%l7 + 0x64]
	fbn	%fcc2,	loop_1029
	fmovda	%icc,	%f18,	%f0
	sdiv	%i1,	0x1405,	%i4
	srl	%g6,	%o5,	%o7
loop_1029:
	fpadd16s	%f30,	%f13,	%f12
	tge	%xcc,	0x2
	addcc	%i5,	%o4,	%i7
	umulcc	%o1,	%g1,	%i0
	ldub	[%l7 + 0x10],	%g5
	movvc	%icc,	%i3,	%o6
	and	%o3,	0x1066,	%l6
	andncc	%o0,	%i6,	%l5
	bge,a,pn	%xcc,	loop_1030
	fblg,a	%fcc0,	loop_1031
	edge8n	%i2,	%l4,	%l0
	fbul	%fcc3,	loop_1032
loop_1030:
	fmovsneg	%icc,	%f16,	%f25
loop_1031:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1032:
	nop
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x48] %asi,	%o2
	mova	%xcc,	%g4,	%l1
	andn	%g2,	%g3,	%l3
	bcc	%xcc,	loop_1033
	edge32	%g7,	%l2,	%i4
	set	0x28, %i0
	lduba	[%l7 + %i0] 0x89,	%i1
loop_1033:
	nop
	set	0x68, %g1
	prefetcha	[%l7 + %g1] 0x11,	 0x2
	umulcc	%o5,	%i5,	%o7
	movg	%xcc,	%i7,	%o1
	tgu	%xcc,	0x4
	movvc	%xcc,	%o4,	%i0
	fmul8x16al	%f25,	%f28,	%f18
	bne,pn	%xcc,	loop_1034
	fbul	%fcc0,	loop_1035
	orncc	%g1,	0x155C,	%g5
	fbe,a	%fcc0,	loop_1036
loop_1034:
	edge8	%o6,	%o3,	%l6
loop_1035:
	movvc	%icc,	%i3,	%i6
	tvs	%icc,	0x7
loop_1036:
	ldub	[%l7 + 0x20],	%l5
	movle	%icc,	%i2,	%l4
	wr	%g0,	0x27,	%asi
	stba	%l0,	[%l7 + 0x7C] %asi
	membar	#Sync
	fxors	%f22,	%f11,	%f24
	fcmple16	%f2,	%f16,	%o0
	tvs	%icc,	0x1
	fpack16	%f20,	%f13
	alignaddr	%o2,	%g4,	%g2
	tsubcctv	%l1,	%l3,	%g3
	membar	0x78
	fornot2	%f28,	%f6,	%f6
	fsrc1	%f26,	%f2
	sdivx	%l2,	0x021F,	%i4
	te	%icc,	0x7
	bshuffle	%f6,	%f8,	%f26
	fornot1	%f4,	%f26,	%f14
	ldsh	[%l7 + 0x0A],	%g7
	fpsub32	%f30,	%f8,	%f10
	mova	%xcc,	%g6,	%o5
	smulcc	%i1,	%i5,	%o7
	bcs	loop_1037
	ldsh	[%l7 + 0x08],	%o1
	mova	%xcc,	%o4,	%i7
	mulx	%g1,	0x03A8,	%i0
loop_1037:
	move	%icc,	%g5,	%o6
	sub	%l6,	%i3,	%i6
	andcc	%o3,	%i2,	%l5
	tpos	%icc,	0x6
	edge8l	%l4,	%l0,	%o0
	tle	%xcc,	0x7
	srl	%o2,	0x15,	%g4
	udivx	%g2,	0x1096,	%l3
	subcc	%g3,	%l2,	%l1
	movrlz	%i4,	0x234,	%g6
	edge16	%o5,	%g7,	%i1
	siam	0x4
	fones	%f30
	fbule,a	%fcc2,	loop_1038
	taddcc	%i5,	0x19F5,	%o7
	udivx	%o4,	0x00DB,	%i7
	xor	%o1,	0x1EB7,	%g1
loop_1038:
	bn,a,pn	%xcc,	loop_1039
	swap	[%l7 + 0x6C],	%g5
	te	%icc,	0x6
	fabss	%f24,	%f8
loop_1039:
	movge	%icc,	%o6,	%i0
	tle	%icc,	0x2
	fbl	%fcc3,	loop_1040
	srl	%i3,	%i6,	%l6
	tvs	%icc,	0x1
	addcc	%o3,	%i2,	%l5
loop_1040:
	fzeros	%f31
	move	%xcc,	%l0,	%l4
	tn	%icc,	0x2
	tl	%icc,	0x2
	movrlz	%o2,	0x085,	%g4
	movcs	%icc,	%o0,	%l3
	tn	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%g2,	0x1853,	%g3
	bvc,pn	%icc,	loop_1041
	ldsw	[%l7 + 0x50],	%l1
	bneg,a,pt	%icc,	loop_1042
	tsubcctv	%i4,	%g6,	%o5
loop_1041:
	fornot2	%f12,	%f10,	%f18
	bgu	loop_1043
loop_1042:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l2,	0x1885,	%g7
	ld	[%l7 + 0x1C],	%f31
loop_1043:
	movn	%xcc,	%i5,	%o7
	fmul8ulx16	%f10,	%f24,	%f16
	sdiv	%i1,	0x0222,	%o4
	tge	%xcc,	0x2
	tvs	%xcc,	0x2
	fmovrdne	%o1,	%f26,	%f10
	fmovsle	%icc,	%f0,	%f4
	sdivx	%i7,	0x0A08,	%g1
	movrlz	%o6,	%g5,	%i0
	fmovsl	%xcc,	%f15,	%f23
	edge32ln	%i3,	%i6,	%l6
	fabss	%f29,	%f19
	edge32l	%o3,	%i2,	%l0
	and	%l4,	%l5,	%o2
	sll	%g4,	%l3,	%g2
	sra	%o0,	%l1,	%i4
	fmovrsgez	%g6,	%f9,	%f25
	fmovse	%icc,	%f26,	%f2
	sra	%g3,	%l2,	%o5
	alignaddrl	%g7,	%i5,	%i1
	fzeros	%f25
	sdiv	%o4,	0x1A35,	%o7
	subc	%i7,	0x1AA0,	%g1
	xnor	%o6,	%g5,	%i0
	sub	%o1,	%i6,	%i3
	fmovdle	%xcc,	%f21,	%f9
	sth	%l6,	[%l7 + 0x7E]
	tvc	%icc,	0x5
	xorcc	%o3,	%i2,	%l0
	movn	%icc,	%l4,	%o2
	fbl	%fcc2,	loop_1044
	fmul8ulx16	%f2,	%f26,	%f4
	nop
	setx loop_1045, %l0, %l1
	jmpl %l1, %l5
	fbuge,a	%fcc0,	loop_1046
loop_1044:
	fmovdne	%xcc,	%f17,	%f1
	edge16l	%g4,	%l3,	%g2
loop_1045:
	movvs	%xcc,	%o0,	%l1
loop_1046:
	taddcctv	%i4,	%g6,	%l2
	fxor	%f10,	%f20,	%f20
	tsubcctv	%g3,	0x0112,	%g7
	fpsub32	%f14,	%f18,	%f2
	fpsub32	%f22,	%f12,	%f30
	fnegd	%f18,	%f4
	fpack32	%f8,	%f16,	%f4
	fmovdne	%icc,	%f19,	%f21
	membar	0x32
	fbl,a	%fcc0,	loop_1047
	subc	%i5,	0x1698,	%i1
	mulscc	%o4,	0x17D1,	%o7
	tg	%xcc,	0x3
loop_1047:
	tg	%icc,	0x1
	movrlz	%o5,	%g1,	%i7
	edge8ln	%o6,	%g5,	%o1
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x11
	stbar
	stx	%i0,	[%l7 + 0x30]
	movvs	%icc,	%i3,	%l6
	edge8n	%i6,	%o3,	%l0
	fmovrdne	%i2,	%f24,	%f6
	tcs	%xcc,	0x4
	sdivcc	%o2,	0x0108,	%l4
	edge8ln	%l5,	%g4,	%l3
	fbe,a	%fcc0,	loop_1048
	subc	%g2,	0x097F,	%o0
	fblg,a	%fcc2,	loop_1049
	smul	%i4,	0x0F83,	%g6
loop_1048:
	srax	%l2,	%l1,	%g7
	sethi	0x0984,	%g3
loop_1049:
	fmuld8ulx16	%f11,	%f15,	%f28
	umulcc	%i5,	0x16FB,	%i1
	fbuge,a	%fcc2,	loop_1050
	andncc	%o7,	%o4,	%o5
	fabsd	%f16,	%f0
	fmovdgu	%xcc,	%f16,	%f19
loop_1050:
	tn	%icc,	0x6
	ldsw	[%l7 + 0x20],	%i7
	movcc	%icc,	%o6,	%g1
	array32	%o1,	%i0,	%g5
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	brlez,a	%i6,	loop_1051
	udiv	%o3,	0x1FFC,	%l6
	tleu	%xcc,	0x1
	fmul8sux16	%f26,	%f16,	%f18
loop_1051:
	nop
	set	0x38, %i2
	lduwa	[%l7 + %i2] 0x80,	%l0
	edge16	%i2,	%o2,	%l5
	movneg	%icc,	%l4,	%g4
	bpos	%icc,	loop_1052
	ta	%xcc,	0x7
	movrgez	%g2,	%l3,	%i4
	and	%o0,	%g6,	%l2
loop_1052:
	andncc	%g7,	%l1,	%g3
	ba,pt	%icc,	loop_1053
	orncc	%i5,	0x1687,	%i1
	fbul	%fcc0,	loop_1054
	alignaddrl	%o4,	%o5,	%i7
loop_1053:
	tleu	%icc,	0x4
	bpos,pt	%xcc,	loop_1055
loop_1054:
	move	%xcc,	%o6,	%g1
	srlx	%o7,	%i0,	%o1
	edge16l	%i3,	%i6,	%g5
loop_1055:
	fmovsvs	%xcc,	%f26,	%f28
	bn,pt	%xcc,	loop_1056
	st	%f25,	[%l7 + 0x10]
	edge16l	%o3,	%l6,	%i2
	smul	%l0,	0x0B2E,	%o2
loop_1056:
	sdivcc	%l5,	0x0523,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g4,	0x1576,	%l3
	srax	%g2,	0x09,	%i4
	bgu	loop_1057
	andn	%o0,	%l2,	%g6
	sll	%l1,	0x1C,	%g3
	sra	%i5,	%i1,	%o4
loop_1057:
	fmovdvc	%xcc,	%f5,	%f17
	fmovdvs	%xcc,	%f7,	%f31
	wr	%g0,	0x2b,	%asi
	stha	%g7,	[%l7 + 0x42] %asi
	membar	#Sync
	fpadd32s	%f0,	%f19,	%f17
	fmul8sux16	%f2,	%f6,	%f14
	edge8l	%o5,	%o6,	%i7
	array16	%o7,	%g1,	%o1
	fmul8sux16	%f8,	%f24,	%f16
	fmovsneg	%icc,	%f28,	%f6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%i3
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x30] %asi,	%f4
	andcc	%i0,	%i6,	%o3
	array32	%g5,	%l6,	%i2
	fsrc2s	%f28,	%f1
	fmovrdlz	%o2,	%f20,	%f12
	array16	%l0,	%l5,	%g4
	and	%l4,	0x0922,	%g2
	udivx	%i4,	0x1269,	%l3
	for	%f4,	%f6,	%f18
	addccc	%o0,	0x0B68,	%g6
	edge8n	%l2,	%g3,	%i5
	sdivcc	%i1,	0x0874,	%o4
	swap	[%l7 + 0x1C],	%g7
	array8	%l1,	%o5,	%o6
	ldx	[%l7 + 0x20],	%i7
	movn	%icc,	%g1,	%o1
	stbar
	andcc	%i3,	%o7,	%i6
	fornot2s	%f12,	%f9,	%f21
	movg	%xcc,	%o3,	%i0
	fbug,a	%fcc0,	loop_1058
	movvc	%icc,	%l6,	%g5
	xor	%i2,	0x131E,	%l0
	ba,pt	%xcc,	loop_1059
loop_1058:
	subc	%o2,	%l5,	%g4
	srax	%l4,	0x0D,	%g2
	tcs	%icc,	0x4
loop_1059:
	fba	%fcc1,	loop_1060
	tge	%xcc,	0x7
	fbg	%fcc1,	loop_1061
	movneg	%xcc,	%l3,	%o0
loop_1060:
	fcmpne32	%f8,	%f28,	%g6
	std	%i4,	[%l7 + 0x38]
loop_1061:
	alignaddrl	%g3,	%i5,	%i1
	fmovrdgez	%l2,	%f22,	%f16
	sir	0x0552
	fsrc1s	%f5,	%f20
	fbu,a	%fcc1,	loop_1062
	movneg	%xcc,	%g7,	%o4
	sdivcc	%l1,	0x1BE9,	%o6
	fmovrslz	%o5,	%f9,	%f16
loop_1062:
	edge32n	%i7,	%o1,	%g1
	nop
	setx loop_1063, %l0, %l1
	jmpl %l1, %o7
	xnor	%i6,	0x1E4C,	%o3
	sll	%i3,	%i0,	%l6
	fmovsneg	%xcc,	%f25,	%f10
loop_1063:
	movge	%xcc,	%i2,	%g5
	bleu	%icc,	loop_1064
	bvs,a,pt	%xcc,	loop_1065
	fmovsl	%icc,	%f15,	%f17
	bpos,a,pn	%xcc,	loop_1066
loop_1064:
	orncc	%o2,	%l0,	%l5
loop_1065:
	ldsw	[%l7 + 0x0C],	%l4
	udivx	%g2,	0x1BFD,	%l3
loop_1066:
	nop
	set	0x48, %o5
	stba	%o0,	[%l7 + %o5] 0x0c
	array8	%g6,	%i4,	%g3
	fpsub16	%f0,	%f10,	%f0
	array16	%g4,	%i5,	%i1
	tsubcc	%g7,	0x1EF9,	%o4
	edge16ln	%l2,	%l1,	%o6
	fbul	%fcc0,	loop_1067
	movre	%o5,	0x2A2,	%o1
	fnand	%f26,	%f14,	%f28
	fmovrsne	%g1,	%f5,	%f25
loop_1067:
	array16	%o7,	%i6,	%o3
	movrlz	%i7,	%i0,	%i3
	fmovdleu	%icc,	%f5,	%f27
	movle	%xcc,	%i2,	%l6
	movrlez	%g5,	%l0,	%l5
	edge8	%l4,	%g2,	%o2
	fpadd16s	%f27,	%f0,	%f17
	taddcc	%l3,	0x14D2,	%g6
	fmovdn	%icc,	%f1,	%f1
	tsubcctv	%i4,	%o0,	%g3
	std	%f16,	[%l7 + 0x50]
	sll	%g4,	%i5,	%i1
	movvc	%icc,	%g7,	%l2
	movrgez	%o4,	0x1F1,	%l1
	fabsd	%f18,	%f12
	srax	%o5,	0x19,	%o1
	subc	%g1,	%o6,	%i6
	fmuld8sux16	%f12,	%f22,	%f16
	and	%o7,	0x0E09,	%o3
	ldd	[%l7 + 0x20],	%i0
	sllx	%i7,	%i3,	%l6
	tn	%icc,	0x0
	sdiv	%i2,	0x0EF2,	%l0
	tle	%icc,	0x4
	xor	%l5,	%l4,	%g5
	fbue	%fcc0,	loop_1068
	tvs	%xcc,	0x4
	fba,a	%fcc0,	loop_1069
	fmovrsne	%g2,	%f10,	%f11
loop_1068:
	alignaddrl	%l3,	%g6,	%i4
	edge16	%o2,	%g3,	%g4
loop_1069:
	fbug,a	%fcc3,	loop_1070
	tl	%icc,	0x3
	sub	%i5,	%o0,	%g7
	taddcc	%i1,	0x0379,	%o4
loop_1070:
	sub	%l1,	%o5,	%l2
	ta	%xcc,	0x2
	fzeros	%f18
	fmovsle	%xcc,	%f18,	%f14
	orn	%o1,	%o6,	%i6
	tle	%icc,	0x3
	edge16l	%o7,	%g1,	%o3
	tn	%xcc,	0x1
	movg	%icc,	%i7,	%i3
	brnz,a	%i0,	loop_1071
	tne	%icc,	0x7
	fnot2	%f0,	%f0
	taddcc	%i2,	0x0257,	%l0
loop_1071:
	edge16ln	%l6,	%l5,	%l4
	fmovs	%f23,	%f22
	stx	%g2,	[%l7 + 0x78]
	tleu	%icc,	0x0
	udivcc	%l3,	0x0160,	%g6
	orn	%i4,	%o2,	%g5
	sethi	0x00D6,	%g4
	addccc	%i5,	0x18FF,	%g3
	addc	%o0,	%g7,	%i1
	addcc	%l1,	%o5,	%o4
	udiv	%l2,	0x089E,	%o1
	wr	%g0,	0xe3,	%asi
	stba	%i6,	[%l7 + 0x33] %asi
	membar	#Sync
	tvc	%xcc,	0x1
	taddcctv	%o7,	0x0907,	%g1
	udiv	%o6,	0x1351,	%o3
	set	0x50, %o2
	lda	[%l7 + %o2] 0x15,	%f28
	edge16	%i7,	%i3,	%i0
	brnz	%l0,	loop_1072
	fmovdcs	%icc,	%f4,	%f20
	edge8	%l6,	%i2,	%l5
	sllx	%l4,	0x18,	%g2
loop_1072:
	edge8n	%g6,	%l3,	%o2
	stx	%g5,	[%l7 + 0x58]
	fmuld8sux16	%f4,	%f3,	%f10
	fcmpgt16	%f26,	%f6,	%g4
	bne	loop_1073
	bg,a,pn	%icc,	loop_1074
	movrlz	%i5,	%i4,	%o0
	edge32n	%g7,	%i1,	%g3
loop_1073:
	smul	%l1,	0x07BA,	%o4
loop_1074:
	std	%l2,	[%l7 + 0x68]
	fmuld8sux16	%f19,	%f13,	%f16
	fpsub16	%f22,	%f30,	%f0
	fmovsneg	%icc,	%f6,	%f6
	srax	%o5,	%o1,	%o7
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%i6
	fnegs	%f23,	%f2
	fnor	%f24,	%f0,	%f4
	ld	[%l7 + 0x70],	%f3
	sdiv	%o6,	0x1C67,	%g1
	edge8l	%i7,	%i3,	%o3
	nop
	set	0x36, %o3
	ldub	[%l7 + %o3],	%l0
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fcmpne32	%f2,	%f6,	%l6
	movpos	%icc,	%i0,	%i2
	tne	%xcc,	0x4
	bg,pt	%xcc,	loop_1075
	xor	%l5,	%l4,	%g6
	alignaddrl	%l3,	%g2,	%o2
	fbn	%fcc3,	loop_1076
loop_1075:
	ta	%xcc,	0x1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%g4
loop_1076:
	mulx	%i5,	0x06C2,	%o0
	fbe	%fcc0,	loop_1077
	movl	%xcc,	%g7,	%i1
	fmovrsne	%g3,	%f13,	%f20
	bshuffle	%f24,	%f8,	%f2
loop_1077:
	fmovrdlez	%i4,	%f8,	%f18
	movcc	%icc,	%l1,	%o4
	tgu	%xcc,	0x6
	tge	%xcc,	0x3
	call	loop_1078
	movgu	%xcc,	%o5,	%o1
	nop
	set	0x60, %l5
	ldd	[%l7 + %l5],	%l2
	movcc	%xcc,	%o7,	%o6
loop_1078:
	movrgz	%i6,	%i7,	%g1
	addc	%o3,	0x0766,	%l0
	fxor	%f0,	%f24,	%f18
	ta	%icc,	0x5
	movge	%icc,	%i3,	%l6
	fsrc1s	%f19,	%f21
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x27,	%i0
	fpadd16	%f0,	%f2,	%f2
	tpos	%xcc,	0x1
	be,pt	%xcc,	loop_1079
	and	%i2,	0x0978,	%l4
	bcs,a	%icc,	loop_1080
	tsubcctv	%g6,	%l5,	%g2
loop_1079:
	stw	%l3,	[%l7 + 0x40]
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x10,	%g4
loop_1080:
	ta	%xcc,	0x0
	membar	0x36
	ldstub	[%l7 + 0x4F],	%g4
	fmovrslz	%o2,	%f30,	%f0
	tsubcctv	%o0,	%i5,	%i1
	fxors	%f14,	%f19,	%f10
	fcmpeq16	%f16,	%f16,	%g3
	xnor	%g7,	%l1,	%o4
	andn	%i4,	%o5,	%l2
	wr	%g0,	0x80,	%asi
	stxa	%o1,	[%l7 + 0x48] %asi
	fmovrdlez	%o6,	%f2,	%f16
	fmovsa	%icc,	%f31,	%f16
	xnor	%i6,	0x148F,	%i7
	fmovsneg	%xcc,	%f16,	%f21
	fmovrdgez	%g1,	%f6,	%f0
	fbue,a	%fcc0,	loop_1081
	fbule	%fcc0,	loop_1082
	for	%f4,	%f22,	%f4
	fornot2s	%f14,	%f21,	%f4
loop_1081:
	movrgez	%o3,	0x2FA,	%o7
loop_1082:
	fmovsgu	%xcc,	%f28,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i3,	%l0
	srlx	%i0,	0x0E,	%l6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%g6
	wr	%g0,	0x88,	%asi
	stxa	%l4,	[%l7 + 0x38] %asi
	tne	%xcc,	0x1
	edge8l	%l5,	%l3,	%g2
	fmovdge	%icc,	%f13,	%f10
	xor	%g5,	%o2,	%o0
	udiv	%g4,	0x1C07,	%i1
	fmovrsgz	%g3,	%f25,	%f21
	set	0x6C, %g2
	sta	%f7,	[%l7 + %g2] 0x11
	taddcc	%i5,	0x0917,	%g7
	tleu	%xcc,	0x1
	andn	%l1,	0x1CBB,	%i4
	fors	%f24,	%f20,	%f13
	move	%icc,	%o5,	%o4
	fmovse	%icc,	%f7,	%f28
	array8	%l2,	%o6,	%i6
	ta	%xcc,	0x2
	addcc	%i7,	0x1DE7,	%o1
	fpsub32	%f12,	%f14,	%f2
	xnorcc	%o3,	0x0FD2,	%g1
	array32	%i3,	%l0,	%i0
	xnor	%o7,	0x0964,	%l6
	fmovspos	%xcc,	%f30,	%f13
	fzero	%f8
	edge8	%g6,	%l4,	%l5
	movle	%xcc,	%l3,	%i2
	taddcctv	%g2,	0x029C,	%o2
	brnz,a	%g5,	loop_1083
	fblg	%fcc2,	loop_1084
	fmovrdlz	%o0,	%f26,	%f14
	xorcc	%g4,	0x1633,	%i1
loop_1083:
	edge32n	%i5,	%g3,	%g7
loop_1084:
	movrlz	%i4,	0x2AB,	%o5
	andncc	%l1,	%l2,	%o4
	ldd	[%l7 + 0x38],	%o6
	udivx	%i6,	0x1294,	%i7
	edge16ln	%o3,	%g1,	%i3
	ldstub	[%l7 + 0x50],	%l0
	tg	%icc,	0x6
	edge8n	%i0,	%o1,	%l6
	udivcc	%g6,	0x0909,	%l4
	fmovsleu	%xcc,	%f15,	%f23
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4F] %asi,	%l5
	edge16n	%o7,	%l3,	%g2
	bpos	%xcc,	loop_1085
	sllx	%i2,	%g5,	%o0
	faligndata	%f6,	%f18,	%f16
	fmul8sux16	%f24,	%f2,	%f30
loop_1085:
	addc	%o2,	0x1039,	%g4
	flush	%l7 + 0x70
	nop
	setx	loop_1086,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsn	%icc,	%f22,	%f28
	movpos	%icc,	%i5,	%g3
	fornot2	%f0,	%f8,	%f18
loop_1086:
	fabsd	%f28,	%f0
	fmul8sux16	%f26,	%f26,	%f0
	ldsh	[%l7 + 0x32],	%g7
	fpmerge	%f0,	%f30,	%f4
	xnor	%i4,	%i1,	%l1
	tcs	%xcc,	0x0
	orn	%l2,	0x0647,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o5,	0x0FBE,	%o6
	fxnors	%f23,	%f17,	%f8
	fandnot2s	%f18,	%f16,	%f11
	edge32n	%i6,	%i7,	%g1
	fbu,a	%fcc3,	loop_1087
	edge16n	%o3,	%l0,	%i0
	edge8ln	%o1,	%l6,	%i3
	smul	%l4,	0x0C68,	%g6
loop_1087:
	bcc,pt	%xcc,	loop_1088
	sra	%o7,	0x1A,	%l3
	set	0x10, %o1
	stba	%g2,	[%l7 + %o1] 0xea
	membar	#Sync
loop_1088:
	edge32l	%l5,	%i2,	%o0
	orncc	%o2,	0x19D0,	%g5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%g4
	fbg,a	%fcc2,	loop_1089
	fbge	%fcc2,	loop_1090
	fpack32	%f26,	%f18,	%f30
	movle	%icc,	%i5,	%g3
loop_1089:
	xnorcc	%g7,	%i1,	%i4
loop_1090:
	movle	%icc,	%l1,	%l2
	fmovrdgz	%o5,	%f12,	%f6
	tneg	%xcc,	0x6
	fmul8sux16	%f8,	%f6,	%f26
	subc	%o4,	0x1058,	%i6
	fmovsle	%icc,	%f29,	%f27
	or	%i7,	%g1,	%o6
	tvs	%icc,	0x7
	brz,a	%l0,	loop_1091
	mova	%xcc,	%i0,	%o3
	movcc	%xcc,	%l6,	%i3
	movre	%l4,	0x02F,	%g6
loop_1091:
	fbo	%fcc3,	loop_1092
	fmovsle	%xcc,	%f10,	%f0
	orcc	%o7,	0x11D1,	%o1
	udivx	%l3,	0x198F,	%l5
loop_1092:
	sdiv	%g2,	0x0851,	%i2
	edge32n	%o2,	%o0,	%g5
	udivx	%i5,	0x0EE8,	%g4
	fnot2s	%f16,	%f7
	flush	%l7 + 0x30
	nop
	set	0x5C, %i1
	prefetch	[%l7 + %i1],	 0x0
	brlz	%g7,	loop_1093
	fcmple16	%f10,	%f6,	%g3
	for	%f30,	%f20,	%f28
	bvs,a,pn	%xcc,	loop_1094
loop_1093:
	sethi	0x169D,	%i1
	fbg,a	%fcc3,	loop_1095
	fmovsa	%xcc,	%f14,	%f21
loop_1094:
	edge32	%l1,	%i4,	%o5
	tle	%icc,	0x5
loop_1095:
	array32	%l2,	%i6,	%o4
	srl	%g1,	%o6,	%l0
	brlz	%i0,	loop_1096
	udivx	%o3,	0x041A,	%l6
	movpos	%xcc,	%i7,	%i3
	fmovdn	%xcc,	%f18,	%f0
loop_1096:
	fbue	%fcc2,	loop_1097
	sir	0x1713
	fbge	%fcc2,	loop_1098
	edge16l	%l4,	%g6,	%o1
loop_1097:
	movrlz	%l3,	0x154,	%o7
	set	0x60, %o6
	prefetcha	[%l7 + %o6] 0x04,	 0x3
loop_1098:
	sir	0x16A6
	orncc	%i2,	%o2,	%g2
	fbue,a	%fcc0,	loop_1099
	fmul8ulx16	%f12,	%f4,	%f12
	lduw	[%l7 + 0x58],	%o0
	ldsw	[%l7 + 0x68],	%g5
loop_1099:
	fnot1	%f4,	%f6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x32] %asi,	%g4
	or	%g7,	%g3,	%i5
	ldsw	[%l7 + 0x7C],	%i1
	andn	%i4,	0x181F,	%l1
	fnors	%f29,	%f25,	%f25
	edge8l	%l2,	%i6,	%o4
	umul	%g1,	%o6,	%l0
	tsubcctv	%o5,	0x0EF6,	%o3
	fmovscs	%xcc,	%f23,	%f14
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x1f
	membar	#Sync
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x60] %asi,	%f8
	addccc	%l6,	%i7,	%i3
	fmovdneg	%icc,	%f5,	%f29
	fbue	%fcc3,	loop_1100
	andn	%i0,	%g6,	%o1
	sdivx	%l4,	0x19CD,	%o7
	wr	%g0,	0x04,	%asi
	stha	%l5,	[%l7 + 0x26] %asi
loop_1100:
	udiv	%i2,	0x108A,	%l3
	fbl,a	%fcc2,	loop_1101
	mulscc	%g2,	0x1C39,	%o2
	fbu,a	%fcc3,	loop_1102
	fmul8x16al	%f9,	%f7,	%f0
loop_1101:
	brz,a	%o0,	loop_1103
	lduw	[%l7 + 0x24],	%g5
loop_1102:
	nop
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1103:
	fmovdvs	%xcc,	%f1,	%f21
	bpos,pt	%xcc,	loop_1104
	movneg	%xcc,	%g4,	%g7
	siam	0x1
	sdivx	%g3,	0x15C8,	%i1
loop_1104:
	movge	%xcc,	%i4,	%l1
	edge8ln	%i5,	%i6,	%o4
	ba,a	%icc,	loop_1105
	ldsw	[%l7 + 0x5C],	%l2
	fbul	%fcc2,	loop_1106
	sdiv	%o6,	0x03EF,	%l0
loop_1105:
	ldsb	[%l7 + 0x32],	%g1
	te	%xcc,	0x0
loop_1106:
	bcc,a	%xcc,	loop_1107
	edge8ln	%o3,	%o5,	%i7
	sdivcc	%i3,	0x15D5,	%l6
	edge16n	%i0,	%g6,	%l4
loop_1107:
	movn	%xcc,	%o7,	%o1
	movrgz	%l5,	0x32D,	%i2
	fbo	%fcc3,	loop_1108
	edge8n	%g2,	%l3,	%o0
	tvs	%xcc,	0x5
	tcc	%xcc,	0x7
loop_1108:
	umulcc	%o2,	%g4,	%g5
	and	%g7,	0x0981,	%i1
	movgu	%icc,	%i4,	%g3
	lduh	[%l7 + 0x56],	%i5
	movge	%icc,	%l1,	%i6
	tgu	%icc,	0x2
	fbe	%fcc2,	loop_1109
	sll	%o4,	%o6,	%l0
	tsubcctv	%l2,	0x073E,	%g1
	sir	0x12D1
loop_1109:
	sllx	%o3,	0x1D,	%i7
	movrlez	%o5,	0x0A7,	%l6
	tvc	%icc,	0x4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i3
	fmovscs	%icc,	%f16,	%f27
	set	0x0, %o0
	stxa	%i0,	[%g0 + %o0] 0x5f
	tvc	%xcc,	0x0
	edge8	%l4,	%o7,	%o1
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%i2
	tl	%xcc,	0x4
	movn	%icc,	%l5,	%g2
	andncc	%o0,	%o2,	%l3
	fmovdl	%icc,	%f12,	%f1
	fmovscc	%xcc,	%f17,	%f12
	tgu	%xcc,	0x4
	fmovse	%xcc,	%f27,	%f26
	subcc	%g4,	%g7,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i4,	%g5,	%g3
	andcc	%i5,	%l1,	%o4
	edge16l	%i6,	%o6,	%l2
	xnor	%g1,	0x0F0C,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o3,	%i7,	%l6
	fmovdl	%xcc,	%f14,	%f6
	fpmerge	%f26,	%f18,	%f24
	bgu,a	%xcc,	loop_1110
	tl	%xcc,	0x2
	xnorcc	%o5,	%i0,	%l4
	addc	%o7,	%i3,	%g6
loop_1110:
	sra	%o1,	0x1B,	%i2
	bg	loop_1111
	mulx	%g2,	0x0AC9,	%l5
	brlz,a	%o0,	loop_1112
	move	%icc,	%l3,	%o2
loop_1111:
	ble,pn	%icc,	loop_1113
	fmovsne	%icc,	%f21,	%f14
loop_1112:
	sub	%g7,	%g4,	%i4
	sth	%i1,	[%l7 + 0x6E]
loop_1113:
	andn	%g5,	0x1FBD,	%g3
	orcc	%l1,	%o4,	%i5
	fands	%f25,	%f21,	%f18
	fandnot2	%f8,	%f8,	%f24
	sdiv	%o6,	0x1FF3,	%i6
	mulx	%l2,	0x026D,	%g1
	subccc	%l0,	%o3,	%l6
	edge16ln	%i7,	%o5,	%i0
	tvc	%icc,	0x2
	edge16ln	%l4,	%o7,	%g6
	movgu	%icc,	%o1,	%i2
	sdivcc	%g2,	0x03BA,	%l5
	subc	%o0,	%l3,	%o2
	tg	%xcc,	0x5
	edge32ln	%i3,	%g7,	%g4
	fzero	%f26
	fornot2	%f22,	%f14,	%f28
	fbe,a	%fcc0,	loop_1114
	andcc	%i4,	%i1,	%g5
	fones	%f15
	fmovsle	%xcc,	%f15,	%f19
loop_1114:
	xor	%g3,	%o4,	%i5
	tge	%icc,	0x7
	fcmple16	%f26,	%f26,	%o6
	tsubcc	%l1,	0x1C4E,	%i6
	tle	%xcc,	0x0
	fmovsge	%xcc,	%f6,	%f13
	tcc	%xcc,	0x2
	smulcc	%g1,	0x1E45,	%l2
	nop
	setx	loop_1115,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subccc	%l0,	0x06D4,	%l6
	movpos	%xcc,	%o3,	%i7
	or	%o5,	%i0,	%l4
loop_1115:
	movleu	%icc,	%o7,	%o1
	sdivx	%i2,	0x1931,	%g6
	set	0x20, %l4
	stda	%g2,	[%l7 + %l4] 0x11
	tn	%xcc,	0x4
	andncc	%o0,	%l3,	%l5
	umulcc	%i3,	%g7,	%g4
	fnot2s	%f9,	%f28
	fornot2s	%f3,	%f28,	%f8
	andncc	%i4,	%i1,	%g5
	fbuge,a	%fcc3,	loop_1116
	edge16n	%o2,	%o4,	%i5
	movge	%icc,	%o6,	%l1
	tvs	%xcc,	0x7
loop_1116:
	edge8l	%g3,	%i6,	%l2
	andcc	%l0,	%g1,	%l6
	movcs	%xcc,	%i7,	%o3
	movge	%xcc,	%o5,	%i0
	edge16l	%l4,	%o1,	%o7
	alignaddr	%g6,	%g2,	%o0
	fmovdcc	%xcc,	%f11,	%f12
	fmovdpos	%icc,	%f28,	%f7
	fmovsvs	%xcc,	%f30,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x58, %l1
	prefetcha	[%l7 + %l1] 0x04,	 0x0
	orn	%l5,	%i3,	%i2
	edge8l	%g4,	%g7,	%i4
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%g5
	sll	%o2,	0x19,	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i5,	%o4
	edge32ln	%l1,	%g3,	%o6
	call	loop_1117
	array32	%i6,	%l2,	%l0
	smulcc	%l6,	0x0DD5,	%g1
	std	%f16,	[%l7 + 0x40]
loop_1117:
	udivx	%i7,	0x0466,	%o3
	and	%i0,	0x09A9,	%o5
	fmovdpos	%xcc,	%f21,	%f7
	taddcctv	%o1,	%l4,	%g6
	ldsh	[%l7 + 0x32],	%o7
	smul	%g2,	%l3,	%l5
	movrlz	%i3,	%o0,	%g4
	edge8ln	%g7,	%i2,	%g5
	edge8n	%o2,	%i4,	%i5
	sdivcc	%o4,	0x0D8E,	%l1
	brlez,a	%g3,	loop_1118
	srl	%i1,	0x13,	%i6
	fcmpes	%fcc1,	%f29,	%f12
	movn	%icc,	%o6,	%l2
loop_1118:
	faligndata	%f12,	%f10,	%f22
	stb	%l6,	[%l7 + 0x0B]
	fmovdpos	%xcc,	%f17,	%f4
	movrne	%g1,	0x306,	%i7
	fmovdl	%xcc,	%f10,	%f10
	orn	%l0,	0x1707,	%o3
	set	0x08, %i6
	lduwa	[%l7 + %i6] 0x10,	%i0
	fmovsl	%xcc,	%f19,	%f16
	ldx	[%l7 + 0x78],	%o1
	fone	%f30
	sir	0x03FB
	swap	[%l7 + 0x0C],	%l4
	subc	%o5,	%g6,	%g2
	movvs	%icc,	%l3,	%o7
	movn	%icc,	%l5,	%i3
	fnot1	%f20,	%f28
	subc	%o0,	0x08E7,	%g4
	fnot2s	%f3,	%f11
	edge8l	%i2,	%g7,	%g5
	te	%xcc,	0x2
	fcmpne16	%f8,	%f18,	%i4
	fmul8x16au	%f29,	%f23,	%f18
	sdivcc	%o2,	0x0A82,	%i5
	fsrc2s	%f12,	%f2
	ldx	[%l7 + 0x50],	%o4
	smulcc	%l1,	%g3,	%i1
	tcc	%xcc,	0x6
	sll	%i6,	0x0D,	%o6
	bcc,a,pn	%icc,	loop_1119
	taddcc	%l2,	0x19E6,	%l6
	set	0x24, %g7
	lduwa	[%l7 + %g7] 0x04,	%i7
loop_1119:
	brgez	%g1,	loop_1120
	bpos,a,pt	%xcc,	loop_1121
	taddcc	%o3,	0x033E,	%l0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x54] %asi,	%i0
loop_1120:
	fbug	%fcc3,	loop_1122
loop_1121:
	fmovrde	%l4,	%f14,	%f8
	fandnot1s	%f27,	%f14,	%f0
	ba,a	loop_1123
loop_1122:
	stw	%o1,	[%l7 + 0x34]
	srlx	%o5,	%g6,	%l3
	edge8	%o7,	%l5,	%i3
loop_1123:
	nop
	setx loop_1124, %l0, %l1
	jmpl %l1, %g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g4,	0x1BB6,	%o0
	fmul8ulx16	%f0,	%f10,	%f14
loop_1124:
	array32	%g7,	%i2,	%i4
	smul	%o2,	%i5,	%o4
	srax	%l1,	0x17,	%g5
	tpos	%xcc,	0x4
	array8	%i1,	%g3,	%o6
	smul	%i6,	0x151D,	%l6
	set	0x52, %o4
	stha	%l2,	[%l7 + %o4] 0x27
	membar	#Sync
	tleu	%icc,	0x1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x4A] %asi,	%g1
	fmul8x16al	%f8,	%f3,	%f0
	fmovdvs	%icc,	%f12,	%f23
	sllx	%o3,	%l0,	%i7
	srlx	%l4,	0x09,	%i0
	brlez	%o5,	loop_1125
	tvs	%xcc,	0x4
	ta	%icc,	0x6
	set	0x2C, %l0
	lduwa	[%l7 + %l0] 0x10,	%g6
loop_1125:
	udivx	%o1,	0x18E4,	%o7
	tvc	%xcc,	0x4
	set	0x42, %i4
	stba	%l3,	[%l7 + %i4] 0x89
	stbar
	subc	%i3,	%g2,	%l5
	addcc	%o0,	%g4,	%g7
	srl	%i4,	%o2,	%i5
	tleu	%xcc,	0x1
	bleu	%icc,	loop_1126
	orncc	%o4,	%i2,	%l1
	set	0x54, %l2
	stwa	%g5,	[%l7 + %l2] 0xe3
	membar	#Sync
loop_1126:
	brgz,a	%i1,	loop_1127
	andcc	%o6,	%g3,	%i6
	movpos	%xcc,	%l2,	%l6
	mulx	%g1,	0x14EF,	%l0
loop_1127:
	fcmpeq32	%f10,	%f30,	%o3
	fmovdl	%xcc,	%f24,	%f12
	fbule	%fcc0,	loop_1128
	movl	%icc,	%l4,	%i7
	tcc	%xcc,	0x7
	fors	%f6,	%f26,	%f1
loop_1128:
	mulscc	%o5,	%g6,	%o1
	fble	%fcc1,	loop_1129
	tge	%xcc,	0x0
	array16	%o7,	%i0,	%i3
	membar	0x2A
loop_1129:
	edge32ln	%g2,	%l3,	%o0
	bn,a,pt	%icc,	loop_1130
	membar	0x25
	edge8ln	%g4,	%l5,	%i4
	tvc	%xcc,	0x0
loop_1130:
	nop
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x10,	%g7,	%i5
	movge	%xcc,	%o4,	%o2
	sdivcc	%l1,	0x1243,	%i2
	orcc	%g5,	%i1,	%g3
	ldsw	[%l7 + 0x34],	%i6
	fmovdle	%icc,	%f5,	%f19
	tcs	%xcc,	0x3
	andn	%l2,	0x1EFC,	%l6
	move	%icc,	%g1,	%o6
	set	0x0A, %l3
	ldsha	[%l7 + %l3] 0x88,	%l0
	tn	%icc,	0x3
	tsubcctv	%o3,	0x116A,	%i7
	tg	%icc,	0x5
	membar	0x43
	array16	%o5,	%g6,	%l4
	edge16	%o1,	%i0,	%i3
	movre	%o7,	0x290,	%l3
	orncc	%o0,	0x087D,	%g2
	fbu,a	%fcc0,	loop_1131
	subccc	%g4,	%l5,	%g7
	mulscc	%i5,	%o4,	%i4
	alignaddr	%o2,	%i2,	%g5
loop_1131:
	addcc	%l1,	0x1CDD,	%g3
	bvs	%xcc,	loop_1132
	tl	%xcc,	0x4
	tpos	%xcc,	0x2
	subccc	%i6,	%i1,	%l6
loop_1132:
	nop
	setx loop_1133, %l0, %l1
	jmpl %l1, %l2
	ldsb	[%l7 + 0x70],	%g1
	array16	%o6,	%l0,	%o3
	movcs	%icc,	%o5,	%i7
loop_1133:
	fpsub16s	%f6,	%f25,	%f23
	xnorcc	%l4,	%o1,	%g6
	fbu	%fcc3,	loop_1134
	tl	%xcc,	0x1
	brgz	%i3,	loop_1135
	ta	%icc,	0x4
loop_1134:
	taddcctv	%i0,	0x1113,	%o7
	edge8l	%o0,	%l3,	%g2
loop_1135:
	bneg,a	%icc,	loop_1136
	and	%g4,	0x064A,	%g7
	tsubcc	%i5,	0x13C4,	%o4
	fbn,a	%fcc2,	loop_1137
loop_1136:
	nop
	set	0x30, %i7
	prefetch	[%l7 + %i7],	 0x1
	movrlz	%l5,	%o2,	%i2
	fmovspos	%icc,	%f13,	%f9
loop_1137:
	te	%xcc,	0x6
	subccc	%g5,	0x0C2F,	%l1
	fbug,a	%fcc0,	loop_1138
	tle	%xcc,	0x0
	swap	[%l7 + 0x08],	%g3
	fmovsvc	%xcc,	%f21,	%f26
loop_1138:
	alignaddrl	%i4,	%i6,	%l6
	fabss	%f10,	%f24
	tcs	%icc,	0x2
	lduw	[%l7 + 0x40],	%i1
	membar	0x04
	movle	%icc,	%l2,	%g1
	nop
	setx	loop_1139,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brnz	%l0,	loop_1140
	movne	%icc,	%o6,	%o3
	xorcc	%o5,	%l4,	%o1
loop_1139:
	addc	%i7,	0x1AB8,	%i3
loop_1140:
	std	%f12,	[%l7 + 0x60]
	fmovdpos	%xcc,	%f14,	%f31
	tpos	%xcc,	0x4
	tcs	%xcc,	0x0
	addcc	%g6,	0x1E83,	%o7
	array16	%i0,	%o0,	%l3
	fmul8x16al	%f6,	%f31,	%f6
	fbge	%fcc0,	loop_1141
	sdiv	%g4,	0x0DBC,	%g2
	movneg	%xcc,	%g7,	%i5
	smul	%o4,	0x10C5,	%o2
loop_1141:
	movvs	%xcc,	%i2,	%g5
	sra	%l5,	0x1B,	%l1
	movgu	%xcc,	%i4,	%i6
	move	%xcc,	%l6,	%g3
	bn	%xcc,	loop_1142
	subcc	%i1,	0x1D12,	%l2
	sth	%l0,	[%l7 + 0x4A]
	fmovd	%f10,	%f10
loop_1142:
	fmovsneg	%icc,	%f1,	%f28
	umul	%g1,	0x165F,	%o3
	bcs,a	%icc,	loop_1143
	fmovrdgz	%o6,	%f14,	%f16
	fpsub16s	%f15,	%f29,	%f5
	subcc	%o5,	0x0958,	%l4
loop_1143:
	movrgz	%i7,	%o1,	%g6
	addcc	%i3,	0x08FE,	%i0
	ldsb	[%l7 + 0x41],	%o0
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x08] %asi,	%f14
	mulscc	%l3,	0x0111,	%o7
	fbe	%fcc0,	loop_1144
	movpos	%icc,	%g2,	%g4
	andn	%i5,	%g7,	%o4
	sdivcc	%i2,	0x0B73,	%o2
loop_1144:
	te	%xcc,	0x0
	tg	%xcc,	0x6
	fmovsgu	%icc,	%f7,	%f15
	fcmpgt32	%f12,	%f12,	%l5
	stb	%g5,	[%l7 + 0x09]
	ldx	[%l7 + 0x70],	%i4
	edge32l	%i6,	%l6,	%g3
	sir	0x0DB1
	fmovsvs	%xcc,	%f11,	%f2
	fcmpes	%fcc3,	%f5,	%f11
	ldd	[%l7 + 0x58],	%i0
	fxors	%f14,	%f2,	%f17
	set	0x44, %g3
	ldsha	[%l7 + %g3] 0x89,	%l1
	add	%l2,	%g1,	%l0
	movg	%xcc,	%o6,	%o5
	bcc,pn	%xcc,	loop_1145
	bpos,pt	%icc,	loop_1146
	smulcc	%l4,	%i7,	%o1
	fornot2s	%f13,	%f1,	%f11
loop_1145:
	mova	%xcc,	%o3,	%i3
loop_1146:
	subccc	%g6,	0x1BD7,	%o0
	movge	%icc,	%i0,	%l3
	movgu	%xcc,	%o7,	%g2
	andcc	%i5,	0x0278,	%g7
	bvc	%icc,	loop_1147
	fmovdpos	%xcc,	%f11,	%f3
	fmovdg	%xcc,	%f15,	%f6
	popc	0x0AC6,	%g4
loop_1147:
	sll	%o4,	%i2,	%l5
	fbuge	%fcc1,	loop_1148
	fandnot2s	%f26,	%f4,	%f19
	movn	%xcc,	%o2,	%i4
	xnor	%g5,	0x16FE,	%i6
loop_1148:
	movcs	%xcc,	%l6,	%g3
	fnands	%f21,	%f28,	%f22
	tneg	%icc,	0x6
	tneg	%xcc,	0x6
	flush	%l7 + 0x24
	set	0x60, %l6
	ldswa	[%l7 + %l6] 0x14,	%i1
	set	0x3C, %g6
	lda	[%l7 + %g6] 0x80,	%f13
	fbge	%fcc3,	loop_1149
	fmovrdlz	%l1,	%f12,	%f6
	fsrc1	%f22,	%f14
	movrlz	%g1,	%l0,	%l2
loop_1149:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o6,	0x1C,	%o5
	edge8ln	%l4,	%o1,	%o3
	fexpand	%f25,	%f16
	tcc	%icc,	0x5
	subcc	%i3,	%g6,	%o0
	brz,a	%i0,	loop_1150
	fxor	%f8,	%f26,	%f2
	xnorcc	%i7,	%l3,	%g2
	movn	%icc,	%i5,	%o7
loop_1150:
	ld	[%l7 + 0x1C],	%f15
	sdiv	%g4,	0x037E,	%o4
	tne	%icc,	0x6
	fmovdne	%icc,	%f0,	%f3
	fbul	%fcc2,	loop_1151
	udiv	%i2,	0x1BDC,	%g7
	tne	%icc,	0x6
	fpmerge	%f30,	%f7,	%f2
loop_1151:
	be,a,pt	%xcc,	loop_1152
	edge16ln	%l5,	%i4,	%o2
	subcc	%g5,	%l6,	%g3
	edge8	%i6,	%i1,	%l1
loop_1152:
	edge8ln	%g1,	%l2,	%l0
	sdivx	%o6,	0x0311,	%l4
	fmovsvc	%xcc,	%f18,	%f3
	movrlez	%o1,	%o5,	%i3
	tcc	%xcc,	0x4
	andcc	%g6,	%o0,	%i0
	te	%icc,	0x5
	add	%o3,	0x07BC,	%l3
	be,a	loop_1153
	movrlz	%i7,	%i5,	%o7
	fmovdvc	%icc,	%f20,	%f26
	tgu	%icc,	0x4
loop_1153:
	tge	%icc,	0x7
	umul	%g2,	0x1F26,	%o4
	pdist	%f18,	%f8,	%f28
	edge16l	%g4,	%g7,	%l5
	brz	%i4,	loop_1154
	edge32l	%i2,	%o2,	%g5
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x28] %asi,	%f10
loop_1154:
	brlz	%g3,	loop_1155
	sethi	0x06C0,	%i6
	movle	%xcc,	%i1,	%l1
	wr	%g0,	0x89,	%asi
	stwa	%g1,	[%l7 + 0x24] %asi
loop_1155:
	alignaddr	%l6,	%l2,	%o6
	tsubcctv	%l4,	0x0D12,	%l0
	tvs	%xcc,	0x6
	edge16n	%o1,	%i3,	%o5
	array16	%g6,	%i0,	%o3
	nop
	setx	loop_1156,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l3,	0x17,	%o0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%o7
loop_1156:
	xor	%i7,	%o4,	%g2
	sethi	0x1954,	%g4
	fmovrsgz	%l5,	%f18,	%f9
	smulcc	%i4,	0x12FD,	%i2
	set	0x1C, %i0
	stwa	%o2,	[%l7 + %i0] 0x89
	array8	%g5,	%g3,	%i6
	tle	%icc,	0x1
	tne	%xcc,	0x2
	movn	%xcc,	%i1,	%g7
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x11,	%f0
	sub	%l1,	0x1845,	%l6
	sll	%g1,	0x01,	%l2
	udiv	%o6,	0x13F5,	%l4
	subc	%l0,	0x1A79,	%i3
	xnorcc	%o5,	%g6,	%o1
	srlx	%o3,	%i0,	%o0
	fmovdpos	%xcc,	%f5,	%f12
	sra	%i5,	%o7,	%l3
	orncc	%i7,	0x12C0,	%o4
	st	%f12,	[%l7 + 0x5C]
	sra	%g4,	%l5,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i4,	0x011E,	%o2
	brz	%g5,	loop_1157
	bvc,pn	%xcc,	loop_1158
	nop
	set	0x68, %g1
	std	%f26,	[%l7 + %g1]
	addcc	%g3,	0x10B7,	%i6
loop_1157:
	sir	0x0418
loop_1158:
	fnors	%f4,	%f4,	%f13
	brz,a	%i2,	loop_1159
	sdivx	%g7,	0x133D,	%i1
	addccc	%l1,	0x1ACB,	%l6
	fornot1s	%f18,	%f14,	%f17
loop_1159:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l2,	%o6
	tne	%xcc,	0x4
	movl	%xcc,	%l4,	%l0
	be,pt	%icc,	loop_1160
	bshuffle	%f14,	%f2,	%f0
	edge16ln	%g1,	%o5,	%i3
	orcc	%o1,	0x0BBC,	%o3
loop_1160:
	fandnot1	%f24,	%f10,	%f8
	orcc	%g6,	0x0BAC,	%o0
	membar	0x4E
	fmovdcc	%icc,	%f9,	%f4
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x16,	%f16
	addccc	%i0,	%i5,	%l3
	andncc	%o7,	%o4,	%i7
	brgz,a	%l5,	loop_1161
	tgu	%xcc,	0x4
	fcmpeq32	%f26,	%f18,	%g4
	fcmpne16	%f4,	%f10,	%g2
loop_1161:
	nop
	set	0x70, %o5
	prefetch	[%l7 + %o5],	 0x3
	wr	%g0,	0x52,	%asi
	stxa	%o2,	[%g0 + 0x120] %asi
	addc	%i4,	%g5,	%i6
	wr	%g0,	0x0c,	%asi
	stha	%i2,	[%l7 + 0x62] %asi
	movrlz	%g3,	%g7,	%l1
	fbg	%fcc2,	loop_1162
	fcmpes	%fcc3,	%f18,	%f7
	orn	%i1,	%l2,	%l6
	edge8l	%l4,	%o6,	%l0
loop_1162:
	sra	%o5,	%i3,	%g1
	brlz	%o3,	loop_1163
	fbuge	%fcc1,	loop_1164
	smul	%g6,	0x190E,	%o0
	udivx	%o1,	0x0644,	%i0
loop_1163:
	fble,a	%fcc1,	loop_1165
loop_1164:
	edge8n	%l3,	%i5,	%o4
	mulscc	%i7,	%o7,	%g4
	tsubcc	%l5,	0x0314,	%o2
loop_1165:
	sra	%i4,	%g2,	%i6
	fmovrdne	%g5,	%f12,	%f22
	taddcc	%i2,	0x0138,	%g3
	andcc	%g7,	0x0C3E,	%l1
	bvs,pt	%xcc,	loop_1166
	fmul8x16al	%f21,	%f23,	%f22
	siam	0x0
	sra	%l2,	0x19,	%l6
loop_1166:
	alignaddr	%l4,	%o6,	%i1
	tsubcctv	%l0,	0x01E1,	%o5
	array16	%i3,	%g1,	%g6
	movle	%xcc,	%o0,	%o1
	fbne,a	%fcc3,	loop_1167
	tsubcc	%o3,	%l3,	%i5
	sdivx	%i0,	0x0D06,	%i7
	bn,pn	%icc,	loop_1168
loop_1167:
	bvs,pt	%icc,	loop_1169
	ta	%xcc,	0x1
	orncc	%o4,	%g4,	%o7
loop_1168:
	fmovdcs	%xcc,	%f9,	%f3
loop_1169:
	udivx	%l5,	0x04E1,	%i4
	edge32l	%o2,	%i6,	%g2
	fmuld8ulx16	%f10,	%f18,	%f14
	srl	%g5,	%i2,	%g7
	fmovsneg	%xcc,	%f20,	%f12
	fones	%f0
	sra	%l1,	0x19,	%g3
	std	%l2,	[%l7 + 0x40]
	movle	%xcc,	%l6,	%o6
	fbl	%fcc0,	loop_1170
	add	%i1,	%l4,	%l0
	tgu	%xcc,	0x5
	sethi	0x07A8,	%o5
loop_1170:
	fba	%fcc3,	loop_1171
	mulscc	%i3,	%g1,	%o0
	fpsub32s	%f3,	%f30,	%f31
	smulcc	%g6,	0x14C5,	%o3
loop_1171:
	movrlz	%o1,	0x271,	%i5
	fmovrsgez	%i0,	%f4,	%f26
	fxnors	%f11,	%f14,	%f4
	or	%i7,	0x1163,	%o4
	movl	%xcc,	%l3,	%o7
	movrgz	%g4,	0x0B1,	%i4
	fabsd	%f0,	%f16
	bneg,pn	%xcc,	loop_1172
	fbug,a	%fcc1,	loop_1173
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o2,	%i6,	%l5
loop_1172:
	tcc	%icc,	0x2
loop_1173:
	movle	%icc,	%g2,	%i2
	fbul,a	%fcc0,	loop_1174
	fmovsvs	%xcc,	%f28,	%f1
	tsubcctv	%g5,	0x032C,	%g7
	addcc	%g3,	0x1E6F,	%l1
loop_1174:
	andn	%l6,	%l2,	%o6
	ldub	[%l7 + 0x23],	%l4
	tge	%icc,	0x4
	swap	[%l7 + 0x2C],	%l0
	fmovspos	%xcc,	%f12,	%f12
	movrgz	%i1,	%i3,	%g1
	andncc	%o5,	%o0,	%o3
	movg	%xcc,	%g6,	%o1
	move	%icc,	%i5,	%i0
	bgu	%icc,	loop_1175
	sethi	0x0723,	%i7
	edge8l	%o4,	%o7,	%g4
	tg	%xcc,	0x2
loop_1175:
	fxor	%f20,	%f4,	%f16
	movne	%icc,	%i4,	%l3
	fmovdgu	%icc,	%f4,	%f16
	addcc	%i6,	0x1D98,	%l5
	bg,pt	%icc,	loop_1176
	movleu	%xcc,	%g2,	%i2
	wr	%g0,	0xeb,	%asi
	stda	%o2,	[%l7 + 0x70] %asi
	membar	#Sync
loop_1176:
	fmovdcc	%icc,	%f28,	%f26
	edge8n	%g7,	%g5,	%l1
	fble,a	%fcc2,	loop_1177
	fmuld8ulx16	%f8,	%f26,	%f28
	ldd	[%l7 + 0x48],	%g2
	fmovdpos	%icc,	%f12,	%f23
loop_1177:
	ldd	[%l7 + 0x58],	%f18
	tvs	%icc,	0x4
	sdivx	%l6,	0x19C7,	%o6
	udivcc	%l4,	0x0056,	%l2
	array8	%i1,	%i3,	%g1
	te	%icc,	0x4
	fmovsvs	%xcc,	%f28,	%f13
	umulcc	%l0,	0x1126,	%o5
	orn	%o3,	0x0A7E,	%o0
	ldd	[%l7 + 0x40],	%f22
	bneg	%icc,	loop_1178
	movle	%icc,	%o1,	%g6
	movpos	%icc,	%i0,	%i5
	fornot2	%f30,	%f4,	%f18
loop_1178:
	fmovsne	%xcc,	%f7,	%f13
	udivx	%o4,	0x1BAA,	%i7
	movle	%icc,	%o7,	%g4
	tg	%xcc,	0x1
	fmovdvc	%xcc,	%f29,	%f14
	movcc	%icc,	%i4,	%l3
	ldsw	[%l7 + 0x18],	%i6
	fandnot2s	%f15,	%f5,	%f29
	taddcc	%l5,	0x08A8,	%i2
	set	0x32, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g2
	fbul,a	%fcc3,	loop_1179
	movgu	%xcc,	%o2,	%g7
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1179:
	movcc	%xcc,	%l1,	%g3
	wr	%g0,	0x0c,	%asi
	sta	%f29,	[%l7 + 0x48] %asi
	fmovsvc	%icc,	%f11,	%f24
	fmovrslez	%g5,	%f26,	%f28
	fpack16	%f10,	%f13
	mulscc	%l6,	%l4,	%l2
	stb	%i1,	[%l7 + 0x58]
	orcc	%i3,	%o6,	%l0
	xorcc	%g1,	0x1443,	%o3
	fpadd16s	%f24,	%f29,	%f6
	xor	%o0,	0x0A62,	%o1
	sub	%g6,	0x1AEC,	%o5
	fpadd32s	%f20,	%f8,	%f1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%o4
	brgz	%i0,	loop_1180
	brlz	%i7,	loop_1181
	tpos	%xcc,	0x2
	movcc	%icc,	%o7,	%g4
loop_1180:
	fsrc1	%f0,	%f18
loop_1181:
	tg	%icc,	0x5
	nop
	setx	loop_1182,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvc	loop_1183
	tcc	%xcc,	0x7
	be,a,pn	%xcc,	loop_1184
loop_1182:
	popc	%l3,	%i6
loop_1183:
	fbo	%fcc2,	loop_1185
	tne	%icc,	0x3
loop_1184:
	bleu,a	%xcc,	loop_1186
	fpsub32s	%f7,	%f25,	%f0
loop_1185:
	bgu,a	%icc,	loop_1187
	sll	%i4,	%i2,	%g2
loop_1186:
	fmovscc	%icc,	%f8,	%f23
	fbn	%fcc0,	loop_1188
loop_1187:
	fpmerge	%f31,	%f6,	%f4
	tpos	%icc,	0x4
	lduh	[%l7 + 0x08],	%l5
loop_1188:
	movvs	%xcc,	%g7,	%l1
	subcc	%g3,	%g5,	%o2
	subccc	%l6,	0x0EFA,	%l2
	andncc	%l4,	%i3,	%i1
	orncc	%o6,	0x0070,	%l0
	edge32ln	%g1,	%o0,	%o3
	fmovrdlz	%o1,	%f4,	%f6
	array16	%g6,	%o5,	%i5
	ld	[%l7 + 0x4C],	%f22
	movge	%icc,	%i0,	%o4
	fpsub16s	%f19,	%f13,	%f26
	addccc	%o7,	0x12F5,	%i7
	fexpand	%f12,	%f12
	set	0x7C, %o3
	lduha	[%l7 + %o3] 0x18,	%g4
	fsrc2s	%f0,	%f4
	srax	%i6,	%l3,	%i4
	te	%icc,	0x1
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	stbar
	fnands	%f24,	%f14,	%f25
	srax	%g2,	%i2,	%g7
	sub	%l5,	0x120E,	%g3
	movrne	%l1,	0x13F,	%o2
	edge16	%l6,	%l2,	%g5
	bcc	%xcc,	loop_1189
	fmovse	%xcc,	%f23,	%f7
	fbe,a	%fcc2,	loop_1190
	fnor	%f0,	%f10,	%f6
loop_1189:
	srlx	%i3,	%l4,	%i1
	ldd	[%l7 + 0x20],	%f12
loop_1190:
	popc	%o6,	%g1
	fbul	%fcc2,	loop_1191
	edge32l	%o0,	%o3,	%l0
	mulscc	%g6,	%o1,	%i5
	sth	%i0,	[%l7 + 0x70]
loop_1191:
	edge16l	%o5,	%o7,	%i7
	edge8ln	%g4,	%i6,	%l3
	tsubcctv	%o4,	%g2,	%i2
	fmul8ulx16	%f10,	%f10,	%f24
	set	0x3A, %o2
	lduha	[%l7 + %o2] 0x89,	%i4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x67] %asi,	%l5
	fmovdpos	%xcc,	%f31,	%f20
	xnorcc	%g3,	%l1,	%o2
	fand	%f2,	%f2,	%f10
	ldd	[%l7 + 0x58],	%f22
	brgz,a	%l6,	loop_1192
	movneg	%icc,	%l2,	%g5
	popc	%i3,	%g7
	alignaddrl	%l4,	%o6,	%i1
loop_1192:
	fmovde	%xcc,	%f27,	%f25
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x62] %asi,	%o0
	ldstub	[%l7 + 0x26],	%g1
	bpos	loop_1193
	edge16ln	%l0,	%o3,	%g6
	xor	%o1,	%i0,	%o5
	call	loop_1194
loop_1193:
	nop
	setx	loop_1195,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbue,a	%fcc1,	loop_1196
	or	%i5,	0x160B,	%i7
loop_1194:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%g4,	[%g0 + 0x1b8] %asi ripped by fixASI40.pl ripped by fixASI40.pl
loop_1195:
	fnand	%f4,	%f10,	%f28
loop_1196:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o7,	%l3
	tgu	%xcc,	0x3
	fpsub32	%f30,	%f14,	%f14
	brz	%i6,	loop_1197
	brgz,a	%g2,	loop_1198
	movcs	%xcc,	%i2,	%o4
	orncc	%i4,	%g3,	%l5
loop_1197:
	bgu,a	%icc,	loop_1199
loop_1198:
	fmul8sux16	%f0,	%f12,	%f26
	orcc	%o2,	%l1,	%l2
	bvc	%icc,	loop_1200
loop_1199:
	sdiv	%l6,	0x1E66,	%i3
	edge16n	%g7,	%l4,	%g5
	taddcctv	%i1,	0x0E28,	%o0
loop_1200:
	nop
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x58] %asi,	%g1
	ta	%icc,	0x6
	ld	[%l7 + 0x20],	%f2
	std	%f6,	[%l7 + 0x20]
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x1C] %asi,	%l0
	fmovsle	%icc,	%f6,	%f21
	brgz,a	%o3,	loop_1201
	alignaddr	%o6,	%o1,	%i0
	fmovsneg	%xcc,	%f10,	%f6
	andn	%o5,	0x11EE,	%i5
loop_1201:
	fxnor	%f24,	%f20,	%f28
	fone	%f0
	andn	%i7,	0x08A2,	%g4
	tg	%xcc,	0x3
	movrlez	%o7,	%g6,	%l3
	fcmpne32	%f30,	%f26,	%g2
	and	%i6,	%o4,	%i4
	fxor	%f4,	%f2,	%f30
	ldd	[%l7 + 0x68],	%g2
	fble,a	%fcc2,	loop_1202
	sdiv	%l5,	0x0E38,	%i2
	movpos	%icc,	%o2,	%l2
	tleu	%icc,	0x4
loop_1202:
	udiv	%l6,	0x03B8,	%i3
	edge8ln	%l1,	%g7,	%g5
	taddcc	%l4,	0x0F7C,	%i1
	movrgz	%g1,	0x102,	%o0
	subc	%l0,	%o3,	%o6
	lduh	[%l7 + 0x08],	%i0
	movvc	%icc,	%o5,	%o1
	tge	%icc,	0x5
	movge	%icc,	%i7,	%i5
	and	%g4,	0x1D43,	%o7
	bg,a,pn	%xcc,	loop_1203
	fmovsle	%xcc,	%f18,	%f11
	tcc	%xcc,	0x4
	tcs	%xcc,	0x0
loop_1203:
	fbe	%fcc0,	loop_1204
	umul	%l3,	0x01F3,	%g6
	smul	%i6,	%o4,	%g2
	fmovda	%xcc,	%f19,	%f2
loop_1204:
	edge8l	%i4,	%l5,	%g3
	sethi	0x0D67,	%o2
	edge8ln	%i2,	%l2,	%l6
	fxors	%f19,	%f3,	%f26
	array16	%l1,	%i3,	%g5
	and	%g7,	0x0873,	%l4
	xorcc	%g1,	0x1767,	%o0
	movpos	%icc,	%i1,	%o3
	fexpand	%f10,	%f26
	sir	0x1EB9
	srax	%o6,	0x0D,	%l0
	fmovse	%xcc,	%f16,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i0,	0x0E5C,	%o1
	xnorcc	%o5,	%i5,	%i7
	brz	%g4,	loop_1205
	edge32n	%l3,	%g6,	%i6
	addccc	%o4,	0x0652,	%g2
	te	%icc,	0x2
loop_1205:
	fbu,a	%fcc2,	loop_1206
	ta	%icc,	0x3
	tneg	%icc,	0x2
	tvc	%xcc,	0x1
loop_1206:
	array16	%i4,	%l5,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o2,	%o7,	%i2
	fcmpes	%fcc3,	%f25,	%f8
	fcmpeq32	%f16,	%f26,	%l6
	movrlz	%l2,	%l1,	%i3
	fmovrsne	%g7,	%f2,	%f6
	orn	%l4,	%g1,	%o0
	nop
	set	0x20, %i5
	stx	%g5,	[%l7 + %i5]
	sdiv	%o3,	0x15DE,	%i1
	bleu,a,pn	%icc,	loop_1207
	sub	%l0,	%o6,	%o1
	srl	%i0,	0x05,	%i5
	srlx	%i7,	%o5,	%g4
loop_1207:
	tl	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g6
	stx	%i6,	[%l7 + 0x50]
	mulx	%l3,	0x03D0,	%g2
	fmovde	%icc,	%f30,	%f2
	subcc	%i4,	%l5,	%g3
	fnegd	%f24,	%f30
	tsubcc	%o2,	%o7,	%o4
	movleu	%xcc,	%l6,	%i2
	movne	%icc,	%l1,	%i3
	subccc	%l2,	%g7,	%g1
	tvc	%xcc,	0x5
	tpos	%xcc,	0x0
	membar	0x36
	movrlez	%l4,	%g5,	%o0
	fpmerge	%f23,	%f17,	%f4
	fmovsn	%xcc,	%f9,	%f16
	fmovdl	%xcc,	%f3,	%f5
	fmovdpos	%xcc,	%f0,	%f25
	nop
	setx	loop_1208,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovs	%f8,	%f8
	orncc	%i1,	0x0C0E,	%l0
	movre	%o6,	%o3,	%o1
loop_1208:
	fxor	%f8,	%f28,	%f6
	fmovscc	%xcc,	%f20,	%f19
	tleu	%icc,	0x7
	bcc,a	loop_1209
	stw	%i0,	[%l7 + 0x58]
	bne,a,pt	%xcc,	loop_1210
	edge8	%i5,	%o5,	%i7
loop_1209:
	stx	%g4,	[%l7 + 0x10]
	fmovrdne	%i6,	%f24,	%f0
loop_1210:
	taddcctv	%l3,	0x077F,	%g6
	subccc	%g2,	0x0FDC,	%l5
	orcc	%g3,	%i4,	%o2
	sth	%o7,	[%l7 + 0x1C]
	fxnors	%f13,	%f30,	%f5
	fpadd16	%f30,	%f0,	%f0
	fmovscs	%xcc,	%f20,	%f12
	brlz	%o4,	loop_1211
	fxnors	%f2,	%f10,	%f8
	fnegs	%f30,	%f0
	srlx	%i2,	%l1,	%l6
loop_1211:
	std	%l2,	[%l7 + 0x40]
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x60] %asi,	%g7
	movle	%icc,	%g1,	%l4
	set	0x47, %l5
	ldsba	[%l7 + %l5] 0x14,	%i3
	orn	%g5,	%o0,	%i1
	smul	%l0,	0x1B93,	%o6
	movre	%o3,	%o1,	%i0
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	wr	%g0,	0x27,	%asi
	stha	%i7,	[%l7 + 0x6E] %asi
	membar	#Sync
	andcc	%g4,	%i5,	%l3
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x4A] %asi,	%i6
	taddcc	%g2,	%l5,	%g3
	array16	%i4,	%o2,	%o7
	ldsh	[%l7 + 0x58],	%g6
	edge32ln	%i2,	%l1,	%l6
	array8	%l2,	%g7,	%o4
	be,a,pn	%xcc,	loop_1212
	bl,a,pt	%icc,	loop_1213
	umul	%g1,	%i3,	%g5
	tvc	%xcc,	0x3
loop_1212:
	fblg,a	%fcc3,	loop_1214
loop_1213:
	ldsw	[%l7 + 0x74],	%l4
	brlz	%o0,	loop_1215
	stb	%l0,	[%l7 + 0x35]
loop_1214:
	umul	%i1,	%o3,	%o6
	movleu	%icc,	%o1,	%o5
loop_1215:
	fcmpd	%fcc3,	%f26,	%f6
	fmovdneg	%icc,	%f17,	%f29
	udivx	%i0,	0x09A6,	%i7
	movvc	%icc,	%i5,	%l3
	bvc,a	loop_1216
	movne	%icc,	%g4,	%g2
	fmovdcc	%xcc,	%f3,	%f11
	tcs	%xcc,	0x2
loop_1216:
	movge	%icc,	%i6,	%g3
	fmovsge	%icc,	%f17,	%f17
	sll	%i4,	0x01,	%l5
	fmovrdgz	%o7,	%f22,	%f16
	fbu,a	%fcc2,	loop_1217
	fcmpd	%fcc0,	%f2,	%f10
	fmovd	%f4,	%f0
	andncc	%o2,	%i2,	%g6
loop_1217:
	fbule,a	%fcc0,	loop_1218
	edge16	%l6,	%l1,	%l2
	subcc	%o4,	0x0F6C,	%g7
	edge16	%i3,	%g1,	%l4
loop_1218:
	edge16	%o0,	%l0,	%g5
	te	%xcc,	0x3
	nop
	setx loop_1219, %l0, %l1
	jmpl %l1, %i1
	edge32ln	%o3,	%o1,	%o6
	fbne,a	%fcc1,	loop_1220
	umulcc	%o5,	0x176E,	%i7
loop_1219:
	subc	%i5,	%l3,	%i0
	smul	%g2,	0x05BC,	%g4
loop_1220:
	fexpand	%f30,	%f0
	movgu	%xcc,	%i6,	%i4
	fnor	%f16,	%f18,	%f12
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x1e
	membar	#Sync
	fbul	%fcc1,	loop_1221
	srlx	%l5,	%g3,	%o2
	sir	0x1B51
	mova	%xcc,	%o7,	%g6
loop_1221:
	smul	%l6,	0x1253,	%l1
	fbe	%fcc0,	loop_1222
	tne	%icc,	0x4
	mova	%xcc,	%l2,	%i2
	fmovrslez	%g7,	%f27,	%f0
loop_1222:
	flush	%l7 + 0x44
	movrlez	%o4,	%i3,	%l4
	wr	%g0,	0x23,	%asi
	stha	%g1,	[%l7 + 0x42] %asi
	membar	#Sync
	fmovdcc	%xcc,	%f30,	%f20
	movrlz	%o0,	0x0A6,	%l0
	fbg	%fcc3,	loop_1223
	bl,a,pn	%icc,	loop_1224
	udivx	%i1,	0x07AF,	%o3
	bcc,pt	%xcc,	loop_1225
loop_1223:
	nop
	setx	loop_1226,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1224:
	orn	%o1,	%g5,	%o5
	fsrc1s	%f26,	%f2
loop_1225:
	sdivcc	%i7,	0x166D,	%o6
loop_1226:
	bvs,a,pn	%icc,	loop_1227
	movn	%xcc,	%i5,	%l3
	fpack16	%f18,	%f3
	fpsub16s	%f16,	%f19,	%f9
loop_1227:
	add	%g2,	%i0,	%i6
	fbl,a	%fcc1,	loop_1228
	brnz,a	%i4,	loop_1229
	tleu	%icc,	0x0
	edge32	%g4,	%l5,	%g3
loop_1228:
	fbl	%fcc0,	loop_1230
loop_1229:
	fpsub32s	%f16,	%f12,	%f31
	fcmple32	%f28,	%f24,	%o7
	fzeros	%f4
loop_1230:
	edge8	%g6,	%l6,	%l1
	set	0x7C, %o7
	swapa	[%l7 + %o7] 0x19,	%o2
	tcc	%xcc,	0x0
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	fbo	%fcc0,	loop_1231
	ldsw	[%l7 + 0x7C],	%l2
	umulcc	%o4,	0x0FBA,	%g7
	fbe,a	%fcc0,	loop_1232
loop_1231:
	edge8n	%l4,	%i3,	%g1
	fbn	%fcc0,	loop_1233
	movle	%xcc,	%o0,	%l0
loop_1232:
	orncc	%o3,	%i1,	%g5
	fbge	%fcc0,	loop_1234
loop_1233:
	orcc	%o1,	%o5,	%i7
	mova	%xcc,	%o6,	%l3
	fmul8x16au	%f1,	%f20,	%f26
loop_1234:
	lduh	[%l7 + 0x22],	%g2
	movleu	%icc,	%i5,	%i0
	movre	%i4,	0x344,	%i6
	fpsub32s	%f17,	%f23,	%f8
	fmovdg	%icc,	%f31,	%f17
	fcmps	%fcc0,	%f3,	%f9
	sethi	0x117F,	%g4
	brlez,a	%g3,	loop_1235
	array16	%l5,	%g6,	%o7
	fandnot1	%f18,	%f24,	%f0
	tle	%icc,	0x4
loop_1235:
	fmovrsgz	%l6,	%f21,	%f8
	udivcc	%o2,	0x1378,	%i2
	fbg	%fcc2,	loop_1236
	nop
	set	0x60, %i1
	std	%l0,	[%l7 + %i1]
	set	0x68, %o1
	ldstuba	[%l7 + %o1] 0x18,	%l2
loop_1236:
	fcmpes	%fcc0,	%f17,	%f10
	array16	%g7,	%l4,	%i3
	bge,a	%icc,	loop_1237
	movrlz	%o4,	%g1,	%l0
	movre	%o0,	0x37A,	%o3
	tn	%xcc,	0x5
loop_1237:
	te	%icc,	0x5
	orcc	%i1,	%o1,	%o5
	andncc	%g5,	%i7,	%o6
	fpadd16	%f30,	%f30,	%f8
	fpadd16	%f20,	%f12,	%f22
	addcc	%g2,	%i5,	%i0
	mova	%icc,	%i4,	%i6
	fmovdge	%xcc,	%f7,	%f14
	array8	%l3,	%g4,	%g3
	fbne	%fcc1,	loop_1238
	array16	%l5,	%g6,	%o7
	fmovrsgz	%o2,	%f13,	%f7
	sdiv	%l6,	0x085D,	%l1
loop_1238:
	tn	%xcc,	0x0
	movrlz	%l2,	%i2,	%l4
	tpos	%icc,	0x4
	edge16n	%g7,	%i3,	%g1
	tle	%xcc,	0x6
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%o4
	andn	%l0,	%o3,	%i1
	fmovrslez	%o1,	%f13,	%f1
	fnegs	%f21,	%f14
	movre	%o0,	0x2E3,	%g5
	srl	%o5,	0x17,	%i7
	fcmpd	%fcc3,	%f26,	%f30
	xor	%o6,	%i5,	%g2
	edge8n	%i4,	%i6,	%l3
	fbo	%fcc3,	loop_1239
	tvc	%xcc,	0x5
	brlez	%i0,	loop_1240
	fnot1s	%f3,	%f27
loop_1239:
	te	%xcc,	0x6
	stbar
loop_1240:
	nop
	setx loop_1241, %l0, %l1
	jmpl %l1, %g3
	fmovrslez	%l5,	%f4,	%f25
	fcmple16	%f16,	%f10,	%g6
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%o7
loop_1241:
	brgez	%g4,	loop_1242
	move	%xcc,	%o2,	%l6
	edge16	%l2,	%l1,	%l4
	bneg,a	%xcc,	loop_1243
loop_1242:
	fcmpd	%fcc0,	%f4,	%f10
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x34] %asi,	%g7
loop_1243:
	nop
	setx	loop_1244,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpadd32s	%f0,	%f0,	%f4
	edge32n	%i2,	%i3,	%g1
	xnor	%l0,	%o4,	%i1
loop_1244:
	bge,a,pn	%icc,	loop_1245
	tgu	%xcc,	0x4
	fabsd	%f2,	%f12
	fcmpne16	%f24,	%f6,	%o1
loop_1245:
	tleu	%icc,	0x6
	andncc	%o3,	%o0,	%o5
	sethi	0x06D2,	%g5
	tl	%icc,	0x1
	andn	%i7,	%i5,	%g2
	fpadd16	%f20,	%f14,	%f6
	udivcc	%o6,	0x187E,	%i6
	movn	%icc,	%l3,	%i4
	fmovsne	%icc,	%f8,	%f4
	fcmpeq16	%f18,	%f26,	%g3
	movn	%icc,	%i0,	%g6
	edge16ln	%o7,	%g4,	%o2
	fpadd32	%f2,	%f22,	%f22
	edge8	%l6,	%l5,	%l1
	nop
	set	0x08, %o6
	lduh	[%l7 + %o6],	%l4
	fmovrsne	%l2,	%f12,	%f24
	edge16l	%g7,	%i3,	%i2
	ldd	[%l7 + 0x68],	%l0
	fsrc2s	%f31,	%f27
	movneg	%icc,	%o4,	%g1
	fbuge,a	%fcc2,	loop_1246
	popc	0x0D9B,	%o1
	movcc	%icc,	%i1,	%o3
	stb	%o5,	[%l7 + 0x3C]
loop_1246:
	edge32ln	%g5,	%o0,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc2,	loop_1247
	movne	%icc,	%i7,	%o6
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x68] %asi,	%g2
loop_1247:
	movvs	%icc,	%l3,	%i6
	tg	%icc,	0x2
	fbug	%fcc2,	loop_1248
	fxor	%f22,	%f26,	%f0
	bcs,a	%icc,	loop_1249
	movg	%xcc,	%i4,	%i0
loop_1248:
	sdivx	%g3,	0x11A2,	%o7
	taddcc	%g6,	%o2,	%g4
loop_1249:
	movg	%xcc,	%l6,	%l1
	tcs	%xcc,	0x2
	fxnors	%f30,	%f13,	%f8
	fnot1	%f20,	%f14
	sub	%l4,	0x02A5,	%l5
	ble,a,pn	%xcc,	loop_1250
	fmovd	%f26,	%f10
	udivx	%g7,	0x0997,	%i3
	sra	%i2,	0x0F,	%l0
loop_1250:
	movvs	%xcc,	%l2,	%o4
	movcs	%xcc,	%g1,	%o1
	fmovrdgz	%o3,	%f0,	%f22
	edge16n	%i1,	%g5,	%o5
	siam	0x0
	addc	%i5,	%i7,	%o0
	edge32ln	%g2,	%l3,	%o6
	edge32n	%i6,	%i4,	%g3
	addcc	%o7,	0x0255,	%g6
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf0
	membar	#Sync
	sub	%i0,	%g4,	%o2
	fpsub32s	%f22,	%f0,	%f30
	subccc	%l1,	0x1DCE,	%l4
	tcc	%icc,	0x4
	tne	%xcc,	0x1
	movpos	%icc,	%l6,	%l5
	edge16ln	%i3,	%g7,	%i2
	nop
	set	0x60, %l1
	std	%l2,	[%l7 + %l1]
	ble,pt	%icc,	loop_1251
	movle	%icc,	%o4,	%l0
	edge16ln	%o1,	%g1,	%i1
	tgu	%xcc,	0x2
loop_1251:
	movle	%xcc,	%o3,	%g5
	fmovs	%f17,	%f0
	edge16l	%i5,	%o5,	%o0
	srlx	%i7,	%g2,	%o6
	orcc	%i6,	%i4,	%l3
	wr	%g0,	0xeb,	%asi
	stwa	%o7,	[%l7 + 0x30] %asi
	membar	#Sync
	sir	0x0B0E
	edge16l	%g3,	%g6,	%i0
	fpsub16s	%f17,	%f18,	%f13
	edge16	%o2,	%l1,	%g4
	fxnors	%f1,	%f27,	%f26
	sdivcc	%l4,	0x10CA,	%l5
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f14
	ldd	[%l7 + 0x50],	%f26
	st	%f12,	[%l7 + 0x14]
	orncc	%l6,	%g7,	%i2
	edge8	%i3,	%o4,	%l2
	edge8	%l0,	%o1,	%g1
	tcc	%icc,	0x6
	movrgez	%o3,	%i1,	%g5
	subccc	%o5,	%o0,	%i7
	add	%i5,	%o6,	%i6
	ldsw	[%l7 + 0x40],	%i4
	sll	%g2,	0x11,	%o7
	bg,pt	%icc,	loop_1252
	fbg	%fcc2,	loop_1253
	ldsb	[%l7 + 0x2B],	%l3
	edge32n	%g3,	%g6,	%i0
loop_1252:
	fbl,a	%fcc0,	loop_1254
loop_1253:
	edge32l	%o2,	%g4,	%l4
	movcs	%xcc,	%l1,	%l6
	tcs	%icc,	0x7
loop_1254:
	movvc	%xcc,	%g7,	%i2
	fmovd	%f14,	%f4
	fmovsne	%icc,	%f18,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l5,	0x10CF,	%o4
	movrlz	%l2,	0x32E,	%i3
	be,a,pn	%icc,	loop_1255
	movne	%xcc,	%l0,	%o1
	movrlz	%g1,	%o3,	%g5
	bpos,a	loop_1256
loop_1255:
	fmovdgu	%xcc,	%f6,	%f28
	edge16l	%o5,	%i1,	%i7
	tpos	%icc,	0x7
loop_1256:
	movrgz	%i5,	0x196,	%o0
	fbl,a	%fcc2,	loop_1257
	fbg,a	%fcc0,	loop_1258
	array32	%i6,	%o6,	%g2
	fornot2s	%f7,	%f18,	%f26
loop_1257:
	nop
	set	0x7C, %l4
	stha	%o7,	[%l7 + %l4] 0x27
	membar	#Sync
loop_1258:
	andcc	%i4,	%g3,	%g6
	fxors	%f30,	%f16,	%f8
	fmovse	%icc,	%f10,	%f1
	fmovdle	%xcc,	%f6,	%f18
	umulcc	%l3,	0x0E57,	%i0
	fxnors	%f13,	%f13,	%f25
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	andncc	%g4,	%l4,	%l1
	xnorcc	%o2,	0x00C1,	%g7
	udivx	%l6,	0x0A9F,	%i2
	fbne,a	%fcc2,	loop_1259
	tg	%icc,	0x2
	movleu	%icc,	%l5,	%o4
	set	0x34, %g7
	lduwa	[%l7 + %g7] 0x0c,	%l2
loop_1259:
	lduw	[%l7 + 0x64],	%i3
	fxors	%f2,	%f26,	%f4
	tsubcc	%l0,	%g1,	%o3
	bcs	%xcc,	loop_1260
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g5,	0x1D54,	%o5
	fmovdge	%icc,	%f23,	%f16
loop_1260:
	bge,a,pn	%icc,	loop_1261
	bn,a	%icc,	loop_1262
	fpmerge	%f26,	%f1,	%f2
	addccc	%o1,	%i7,	%i1
loop_1261:
	sra	%i5,	%i6,	%o6
loop_1262:
	tvc	%xcc,	0x2
	fmul8x16	%f21,	%f26,	%f14
	taddcc	%o0,	%g2,	%i4
	fcmpeq16	%f26,	%f26,	%o7
	prefetch	[%l7 + 0x74],	 0x3
	tcs	%icc,	0x4
	fmovrdgz	%g6,	%f30,	%f18
	and	%l3,	0x0A94,	%i0
	fpsub16	%f14,	%f4,	%f6
	tl	%icc,	0x5
	movrlz	%g3,	%l4,	%g4
	sdivcc	%o2,	0x0C41,	%l1
	stbar
	fmovrse	%l6,	%f22,	%f31
	movg	%xcc,	%i2,	%g7
	orcc	%l5,	%l2,	%i3
	movpos	%xcc,	%l0,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o3,	%g5
	fmovdgu	%icc,	%f28,	%f16
	membar	0x52
	ldx	[%l7 + 0x48],	%o5
	membar	0x35
	sub	%o4,	%i7,	%i1
	edge8l	%i5,	%i6,	%o1
	subc	%o6,	%o0,	%i4
	fcmpd	%fcc1,	%f4,	%f8
	bn,a,pn	%xcc,	loop_1263
	nop
	setx loop_1264, %l0, %l1
	jmpl %l1, %o7
	fmul8ulx16	%f18,	%f4,	%f24
	tvc	%xcc,	0x4
loop_1263:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
loop_1264:
	fpsub32	%f4,	%f24,	%f8
	xnor	%l3,	0x12FD,	%i0
	tvs	%xcc,	0x3
	movgu	%icc,	%g2,	%l4
	movge	%xcc,	%g3,	%o2
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
	edge8ln	%l6,	%g4,	%g7
	bg	%icc,	loop_1265
	fmovrslez	%i2,	%f7,	%f7
	array8	%l2,	%i3,	%l5
	tn	%icc,	0x4
loop_1265:
	fbn	%fcc2,	loop_1266
	xnorcc	%g1,	0x04DE,	%l0
	fpadd16s	%f12,	%f2,	%f11
	udivcc	%o3,	0x1B6D,	%o5
loop_1266:
	movvs	%xcc,	%o4,	%g5
	movrlez	%i1,	%i7,	%i5
	bpos,pt	%xcc,	loop_1267
	xnorcc	%o1,	%o6,	%o0
	std	%f28,	[%l7 + 0x28]
	fnot1	%f4,	%f12
loop_1267:
	edge8	%i6,	%i4,	%g6
	edge32l	%l3,	%o7,	%i0
	sll	%l4,	0x1D,	%g2
	srl	%o2,	0x1C,	%l1
	be	loop_1268
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%g3,	%g4
	mova	%icc,	%l6,	%i2
loop_1268:
	edge32	%g7,	%l2,	%i3
	movge	%xcc,	%g1,	%l5
	fcmpgt32	%f16,	%f14,	%l0
	edge8l	%o3,	%o4,	%o5
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
	fmovsleu	%xcc,	%f6,	%f28
	movvc	%icc,	%i1,	%i5
	stb	%i7,	[%l7 + 0x55]
	fpadd32	%f4,	%f10,	%f28
	stx	%o6,	[%l7 + 0x70]
	xnorcc	%o0,	%i6,	%o1
	fmovrdgz	%i4,	%f14,	%f6
	edge8n	%l3,	%g6,	%o7
	orncc	%i0,	0x0B0B,	%g2
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x81
	fmul8x16	%f18,	%f16,	%f10
	movn	%xcc,	%o2,	%l4
	edge8n	%l1,	%g3,	%l6
	movre	%i2,	%g7,	%l2
	bgu	loop_1269
	stbar
	fbn	%fcc1,	loop_1270
	sll	%i3,	0x0A,	%g1
loop_1269:
	tneg	%xcc,	0x3
	movle	%icc,	%l5,	%l0
loop_1270:
	movge	%xcc,	%g4,	%o4
	movvc	%xcc,	%o5,	%o3
	edge8ln	%i1,	%i5,	%g5
	movneg	%icc,	%i7,	%o6
	smul	%o0,	0x17A3,	%o1
	sdiv	%i6,	0x0B35,	%i4
	ta	%xcc,	0x2
	subccc	%l3,	%g6,	%i0
	tg	%xcc,	0x1
	edge16n	%g2,	%o2,	%o7
	movvs	%xcc,	%l1,	%l4
	tgu	%icc,	0x1
	edge16	%l6,	%i2,	%g3
	tne	%xcc,	0x4
	fandnot2s	%f4,	%f16,	%f17
	fornot1	%f14,	%f26,	%f26
	fmovdl	%icc,	%f19,	%f24
	edge8	%g7,	%i3,	%l2
	fors	%f27,	%f25,	%f14
	mulscc	%l5,	%l0,	%g1
	tge	%icc,	0x2
	fpadd16s	%f23,	%f24,	%f11
	movrne	%o4,	%g4,	%o5
	sethi	0x0917,	%o3
	bn,a,pn	%xcc,	loop_1271
	std	%f14,	[%l7 + 0x78]
	tge	%icc,	0x2
	tpos	%xcc,	0x3
loop_1271:
	andncc	%i5,	%i1,	%g5
	ld	[%l7 + 0x64],	%f1
	fmovde	%icc,	%f31,	%f11
	sra	%i7,	0x11,	%o0
	sethi	0x126B,	%o1
	array32	%o6,	%i4,	%l3
	movleu	%icc,	%i6,	%i0
	movg	%icc,	%g2,	%o2
	brgz	%o7,	loop_1272
	std	%g6,	[%l7 + 0x30]
	taddcc	%l4,	%l1,	%i2
	mulx	%g3,	%l6,	%g7
loop_1272:
	call	loop_1273
	srax	%l2,	%l5,	%i3
	tvc	%icc,	0x1
	fabss	%f1,	%f13
loop_1273:
	ldub	[%l7 + 0x38],	%l0
	fmovsl	%xcc,	%f9,	%f31
	fmovsne	%xcc,	%f13,	%f21
	stw	%o4,	[%l7 + 0x40]
	tn	%icc,	0x5
	subccc	%g1,	0x199B,	%g4
	set	0x5C, %i4
	lduwa	[%l7 + %i4] 0x80,	%o5
	bgu,a,pn	%icc,	loop_1274
	movl	%icc,	%i5,	%i1
	edge8ln	%o3,	%i7,	%g5
	bcs	loop_1275
loop_1274:
	orncc	%o0,	%o6,	%o1
	tne	%icc,	0x1
	fmovrsgez	%i4,	%f22,	%f6
loop_1275:
	sub	%i6,	0x11F5,	%i0
	movge	%xcc,	%g2,	%o2
	edge32n	%l3,	%o7,	%l4
	bgu,a,pt	%xcc,	loop_1276
	bgu	loop_1277
	addcc	%l1,	%g6,	%g3
	fnands	%f21,	%f7,	%f20
loop_1276:
	fnot1s	%f15,	%f17
loop_1277:
	bgu,pt	%xcc,	loop_1278
	fnegd	%f22,	%f14
	bvc,a,pn	%icc,	loop_1279
	tsubcctv	%i2,	%l6,	%l2
loop_1278:
	xor	%g7,	0x0867,	%i3
	fexpand	%f22,	%f4
loop_1279:
	bne,a,pt	%xcc,	loop_1280
	nop
	setx loop_1281, %l0, %l1
	jmpl %l1, %l0
	bpos,a	%xcc,	loop_1282
	call	loop_1283
loop_1280:
	tvc	%icc,	0x0
loop_1281:
	fmovda	%xcc,	%f14,	%f9
loop_1282:
	fone	%f26
loop_1283:
	movleu	%icc,	%o4,	%l5
	umulcc	%g1,	0x09BC,	%o5
	fands	%f10,	%f14,	%f1
	subcc	%g4,	%i1,	%o3
	edge8n	%i7,	%g5,	%o0
	umul	%i5,	0x0DEA,	%o1
	nop
	setx	loop_1284,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%xcc,	%i4,	%o6
	fbo	%fcc2,	loop_1285
	movvs	%icc,	%i6,	%i0
loop_1284:
	fcmpeq32	%f30,	%f30,	%g2
	smulcc	%l3,	0x03BC,	%o7
loop_1285:
	subc	%l4,	%o2,	%g6
	sll	%l1,	0x03,	%g3
	fnot2	%f12,	%f30
	fpmerge	%f25,	%f8,	%f28
	sdiv	%i2,	0x1A4F,	%l6
	movle	%xcc,	%l2,	%g7
	fpadd16s	%f22,	%f31,	%f17
	fandnot1	%f24,	%f0,	%f18
	array32	%i3,	%o4,	%l5
	subc	%g1,	0x0E9B,	%o5
	array32	%g4,	%l0,	%o3
	srl	%i1,	%i7,	%o0
	bl,a,pn	%icc,	loop_1286
	edge8	%i5,	%g5,	%o1
	fbge,a	%fcc2,	loop_1287
	bg,pn	%xcc,	loop_1288
loop_1286:
	fmovsne	%icc,	%f9,	%f16
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%i4
loop_1287:
	tvs	%icc,	0x5
loop_1288:
	bneg,pn	%icc,	loop_1289
	bg,a	%xcc,	loop_1290
	tvs	%xcc,	0x3
	edge16n	%i6,	%o6,	%g2
loop_1289:
	fmovsvs	%xcc,	%f25,	%f30
loop_1290:
	te	%icc,	0x2
	edge8l	%l3,	%i0,	%o7
	fbl	%fcc2,	loop_1291
	addc	%o2,	0x017C,	%l4
	fmovsn	%icc,	%f29,	%f23
	edge8l	%g6,	%l1,	%i2
loop_1291:
	fnot1s	%f4,	%f26
	array8	%g3,	%l6,	%g7
	xor	%l2,	0x1200,	%i3
	smulcc	%o4,	0x136A,	%g1
	sdivcc	%o5,	0x000E,	%l5
	bn,a	%icc,	loop_1292
	tg	%xcc,	0x1
	bneg,a	loop_1293
	array16	%g4,	%o3,	%i1
loop_1292:
	alignaddr	%l0,	%o0,	%i7
	tvs	%icc,	0x4
loop_1293:
	tle	%icc,	0x3
	membar	0x5E
	taddcctv	%i5,	0x07E0,	%o1
	edge16n	%i4,	%i6,	%o6
	fnot2s	%f12,	%f2
	fsrc1s	%f7,	%f7
	sethi	0x15E1,	%g5
	bcs,a	loop_1294
	fble	%fcc0,	loop_1295
	fmovrde	%g2,	%f8,	%f20
	membar	0x5A
loop_1294:
	fandnot1	%f28,	%f24,	%f12
loop_1295:
	tvs	%xcc,	0x2
	movre	%l3,	0x163,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o2,	%l4,	%o7
	tcc	%xcc,	0x0
	bcc	loop_1296
	srax	%l1,	%g6,	%g3
	tcc	%icc,	0x1
	movre	%i2,	0x0B0,	%g7
loop_1296:
	alignaddrl	%l2,	%l6,	%o4
	bge	loop_1297
	fornot2	%f14,	%f20,	%f10
	fba,a	%fcc0,	loop_1298
	edge16n	%g1,	%o5,	%i3
loop_1297:
	fmovdneg	%icc,	%f8,	%f4
	ldx	[%l7 + 0x48],	%g4
loop_1298:
	sll	%l5,	0x1D,	%o3
	edge32	%i1,	%l0,	%o0
	ldx	[%l7 + 0x10],	%i5
	movpos	%icc,	%i7,	%i4
	smul	%i6,	%o1,	%o6
	sllx	%g2,	0x02,	%g5
	sdivcc	%i0,	0x0C51,	%l3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o2
	set	0x18, %o4
	ldxa	[%l7 + %o4] 0x88,	%o7
	flush	%l7 + 0x38
	movre	%l1,	0x2B4,	%g6
	fmovrdlez	%l4,	%f12,	%f18
	umulcc	%i2,	0x0C6F,	%g7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x38] %asi,	%g3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l6
	udiv	%o4,	0x038B,	%l2
	be,pt	%icc,	loop_1299
	array8	%g1,	%o5,	%g4
	tsubcctv	%l5,	%o3,	%i3
	edge16ln	%l0,	%i1,	%i5
loop_1299:
	be,a,pt	%icc,	loop_1300
	movrlez	%i7,	0x3D5,	%o0
	fmovsne	%icc,	%f0,	%f12
	udiv	%i4,	0x0FE9,	%i6
loop_1300:
	fbug	%fcc0,	loop_1301
	udiv	%o6,	0x12B0,	%g2
	fmovdleu	%xcc,	%f0,	%f3
	and	%g5,	0x0935,	%o1
loop_1301:
	fcmpeq32	%f12,	%f24,	%i0
	fsrc1s	%f24,	%f19
	srlx	%l3,	%o2,	%l1
	ldstub	[%l7 + 0x3D],	%o7
	fzero	%f22
	movle	%icc,	%l4,	%i2
	movrlz	%g6,	0x15D,	%g7
	sethi	0x1368,	%l6
	fmovrdgez	%o4,	%f14,	%f2
	addcc	%l2,	%g1,	%o5
	lduh	[%l7 + 0x5E],	%g4
	udivx	%l5,	0x059B,	%g3
	fcmpeq32	%f30,	%f10,	%o3
	edge16	%l0,	%i1,	%i3
	fmovrdgez	%i7,	%f18,	%f28
	fcmps	%fcc0,	%f28,	%f24
	edge16l	%o0,	%i5,	%i6
	wr	%g0,	0x27,	%asi
	stda	%i4,	[%l7 + 0x10] %asi
	membar	#Sync
	fsrc1s	%f28,	%f24
	flush	%l7 + 0x6C
	edge32ln	%o6,	%g2,	%o1
	fmovdle	%xcc,	%f9,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl	%icc,	loop_1302
	fbn,a	%fcc3,	loop_1303
	edge32ln	%i0,	%l3,	%g5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%o2
loop_1302:
	array8	%o7,	%l4,	%i2
loop_1303:
	alignaddrl	%g6,	%g7,	%l6
	tcc	%icc,	0x3
	movvs	%icc,	%l1,	%l2
	sir	0x050F
	sir	0x144F
	movneg	%icc,	%g1,	%o5
	movn	%icc,	%g4,	%l5
	fbue,a	%fcc0,	loop_1304
	tsubcctv	%o4,	%g3,	%l0
	fmul8sux16	%f4,	%f30,	%f2
	tn	%icc,	0x1
loop_1304:
	bvc,a,pt	%xcc,	loop_1305
	fcmped	%fcc3,	%f30,	%f20
	ldub	[%l7 + 0x3A],	%o3
	sllx	%i3,	%i7,	%o0
loop_1305:
	bge,pt	%xcc,	loop_1306
	fcmple32	%f24,	%f10,	%i5
	tneg	%xcc,	0x5
	movrlz	%i1,	%i4,	%i6
loop_1306:
	taddcc	%o6,	0x1ED0,	%o1
	nop
	setx	loop_1307,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnorcc	%i0,	%l3,	%g5
	addccc	%g2,	%o7,	%l4
	fblg,a	%fcc1,	loop_1308
loop_1307:
	mulx	%o2,	%i2,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f8,	%f24,	%f26
loop_1308:
	sllx	%g6,	0x0F,	%l6
	lduw	[%l7 + 0x34],	%l2
	fmovdgu	%xcc,	%f22,	%f23
	fbul	%fcc1,	loop_1309
	fbg,a	%fcc0,	loop_1310
	tsubcctv	%l1,	%g1,	%g4
	fbug	%fcc3,	loop_1311
loop_1309:
	taddcc	%o5,	0x1175,	%l5
loop_1310:
	alignaddrl	%o4,	%g3,	%o3
	fbu	%fcc2,	loop_1312
loop_1311:
	stw	%l0,	[%l7 + 0x64]
	movvs	%xcc,	%i7,	%i3
	addccc	%o0,	0x05C3,	%i1
loop_1312:
	bgu,a,pn	%xcc,	loop_1313
	movcc	%icc,	%i5,	%i6
	edge32n	%o6,	%i4,	%i0
	bgu,pn	%icc,	loop_1314
loop_1313:
	popc	%l3,	%g5
	fbl,a	%fcc2,	loop_1315
	sll	%o1,	%g2,	%l4
loop_1314:
	nop
	set	0x68, %l2
	lduwa	[%l7 + %l2] 0x88,	%o7
loop_1315:
	sll	%o2,	%g7,	%i2
	tg	%icc,	0x7
	edge32n	%l6,	%l2,	%l1
	edge32ln	%g6,	%g1,	%o5
	smulcc	%g4,	%l5,	%o4
	xnorcc	%g3,	0x0B64,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l0,	%i3
	fbul,a	%fcc2,	loop_1316
	array8	%o0,	%i7,	%i1
	subccc	%i5,	%o6,	%i6
	fmovdleu	%xcc,	%f21,	%f4
loop_1316:
	movvc	%xcc,	%i0,	%i4
	edge16n	%l3,	%o1,	%g5
	array32	%l4,	%g2,	%o2
	addc	%g7,	0x1CD2,	%o7
	swap	[%l7 + 0x20],	%i2
	fxor	%f10,	%f18,	%f10
	edge8l	%l2,	%l6,	%g6
	edge16l	%l1,	%g1,	%o5
	sir	0x07D3
	sub	%l5,	0x0033,	%o4
	brz,a	%g4,	loop_1317
	fand	%f20,	%f30,	%f30
	fzero	%f24
	fcmple32	%f24,	%f8,	%g3
loop_1317:
	mova	%icc,	%o3,	%l0
	movrgez	%o0,	0x269,	%i3
	stx	%i1,	[%l7 + 0x20]
	edge32n	%i5,	%i7,	%o6
	array16	%i0,	%i6,	%i4
	array8	%o1,	%l3,	%l4
	xnor	%g2,	0x079D,	%o2
	movvs	%icc,	%g7,	%o7
	tvs	%icc,	0x7
	sth	%g5,	[%l7 + 0x72]
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tne	%icc,	0x5
	sdivcc	%i2,	0x12AF,	%l6
	xor	%l2,	%l1,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x18],	%o5
	fxnors	%f16,	%f29,	%f3
	brnz	%g6,	loop_1318
	ldstub	[%l7 + 0x46],	%l5
	fmovsge	%xcc,	%f31,	%f12
	edge32l	%o4,	%g4,	%g3
loop_1318:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x4C] %asi,	%f16
	movne	%xcc,	%o3,	%o0
	fbu	%fcc2,	loop_1319
	xnorcc	%l0,	%i1,	%i3
	tle	%xcc,	0x2
	movle	%xcc,	%i5,	%o6
loop_1319:
	edge16n	%i7,	%i0,	%i4
	sir	0x116A
	be,a	%icc,	loop_1320
	bne	%icc,	loop_1321
	fmovrdlez	%i6,	%f2,	%f0
	lduh	[%l7 + 0x5A],	%l3
loop_1320:
	bn	loop_1322
loop_1321:
	fbule,a	%fcc2,	loop_1323
	smul	%o1,	%l4,	%o2
	movrgz	%g2,	%g7,	%g5
loop_1322:
	movvs	%xcc,	%i2,	%o7
loop_1323:
	te	%xcc,	0x1
	subccc	%l6,	%l2,	%g1
	tcs	%xcc,	0x7
	movrlz	%l1,	0x3F0,	%g6
	fbu,a	%fcc3,	loop_1324
	sllx	%o5,	%l5,	%g4
	fmuld8sux16	%f2,	%f10,	%f24
	fxnors	%f18,	%f4,	%f26
loop_1324:
	bn,pn	%icc,	loop_1325
	taddcc	%o4,	0x1483,	%g3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%l0
loop_1325:
	movcc	%icc,	%i1,	%i3
	edge8l	%i5,	%o6,	%i7
	movrlez	%i0,	%o3,	%i4
	fornot1s	%f2,	%f23,	%f27
	fmovsn	%icc,	%f12,	%f26
	orncc	%l3,	%o1,	%l4
	xnor	%i6,	%o2,	%g2
	edge32l	%g7,	%g5,	%o7
	fzeros	%f26
	udivcc	%i2,	0x03E7,	%l6
	array8	%l2,	%l1,	%g1
	andncc	%g6,	%l5,	%o5
	brlz	%o4,	loop_1326
	movvs	%icc,	%g3,	%g4
	movleu	%icc,	%o0,	%l0
	fmovdneg	%icc,	%f11,	%f15
loop_1326:
	be,a,pn	%xcc,	loop_1327
	fbg	%fcc2,	loop_1328
	tl	%xcc,	0x7
	ldd	[%l7 + 0x48],	%i2
loop_1327:
	tgu	%icc,	0x4
loop_1328:
	add	%i1,	0x1D4E,	%i5
	taddcc	%o6,	0x0CF3,	%i0
	mulscc	%i7,	%o3,	%i4
	alignaddrl	%o1,	%l3,	%l4
	movrlez	%o2,	%g2,	%g7
	flush	%l7 + 0x4C
	tgu	%xcc,	0x4
	edge16	%i6,	%o7,	%i2
	orncc	%l6,	%g5,	%l2
	edge32ln	%l1,	%g6,	%l5
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x24] %asi,	%f0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x10] %asi,	%g0
	tpos	%xcc,	0x4
	and	%o5,	%g3,	%g4
	movrlz	%o4,	%o0,	%l0
	tneg	%xcc,	0x7
	movcc	%xcc,	%i1,	%i3
	fones	%f15
	bcs,a,pt	%xcc,	loop_1329
	fone	%f6
	tge	%xcc,	0x3
	tgu	%xcc,	0x6
loop_1329:
	mulx	%i5,	0x1646,	%o6
	fsrc1s	%f30,	%f10
	tsubcc	%i0,	%i7,	%i4
	movrlez	%o1,	0x075,	%o3
	movvs	%xcc,	%l4,	%l3
	tn	%xcc,	0x3
	movle	%icc,	%g2,	%g7
	set	0x30, %i7
	ldxa	[%l7 + %i7] 0x18,	%o2
	fbue,a	%fcc3,	loop_1330
	stbar
	fmovsl	%xcc,	%f7,	%f18
	movcc	%icc,	%i6,	%i2
loop_1330:
	tcc	%xcc,	0x1
	mova	%icc,	%o7,	%l6
	fandnot2	%f8,	%f8,	%f30
	set	0x48, %l3
	stxa	%l2,	[%l7 + %l3] 0xea
	membar	#Sync
	sir	0x0B3D
	fpack16	%f2,	%f8
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%g5
	orncc	%l1,	0x1024,	%l5
	tpos	%icc,	0x0
	siam	0x5
	edge8	%g6,	%g1,	%o5
	movn	%icc,	%g4,	%g3
	flush	%l7 + 0x40
	movrlz	%o0,	%l0,	%i1
	stx	%o4,	[%l7 + 0x20]
	bpos,a	loop_1331
	nop
	setx	loop_1332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbu	%fcc1,	loop_1333
	movl	%xcc,	%i5,	%i3
loop_1331:
	movrgz	%i0,	0x2FA,	%o6
loop_1332:
	nop
	set	0x48, %l6
	stba	%i7,	[%l7 + %l6] 0x89
loop_1333:
	fmovdn	%xcc,	%f3,	%f17
	taddcc	%o1,	0x1496,	%o3
	subccc	%i4,	0x0C4A,	%l3
	movcc	%icc,	%g2,	%g7
	fcmpgt32	%f14,	%f24,	%l4
	fmovsleu	%xcc,	%f10,	%f10
	bvc,pn	%xcc,	loop_1334
	movrgz	%i6,	0x34C,	%o2
	fmovrsgez	%i2,	%f20,	%f5
	addccc	%o7,	0x15D0,	%l6
loop_1334:
	taddcctv	%g5,	%l2,	%l5
	fandnot1	%f12,	%f22,	%f26
	movne	%xcc,	%g6,	%g1
	sdiv	%l1,	0x0F52,	%g4
	bcs,pn	%xcc,	loop_1335
	mulx	%g3,	%o5,	%l0
	edge32l	%i1,	%o0,	%o4
	wr	%g0,	0xeb,	%asi
	stwa	%i5,	[%l7 + 0x34] %asi
	membar	#Sync
loop_1335:
	bcc,a,pt	%icc,	loop_1336
	fmovse	%icc,	%f17,	%f0
	subc	%i0,	%o6,	%i7
	xnorcc	%o1,	%i3,	%i4
loop_1336:
	fmovdgu	%icc,	%f2,	%f14
	movre	%o3,	%l3,	%g7
	movrlz	%g2,	0x128,	%i6
	edge8ln	%o2,	%i2,	%l4
	fbe	%fcc3,	loop_1337
	tn	%icc,	0x6
	edge32	%o7,	%g5,	%l2
	sir	0x1290
loop_1337:
	srlx	%l6,	%l5,	%g6
	fmovrsne	%g1,	%f17,	%f30
	brz	%g4,	loop_1338
	fzeros	%f11
	movg	%xcc,	%g3,	%o5
	tsubcc	%l0,	%i1,	%l1
loop_1338:
	fpsub32	%f16,	%f14,	%f16
	fpsub16s	%f29,	%f2,	%f7
	movn	%icc,	%o4,	%i5
	srax	%i0,	%o6,	%o0
	sir	0x15F5
	andcc	%o1,	%i7,	%i3
	fmovda	%icc,	%f28,	%f0
	or	%i4,	%o3,	%g7
	fcmpgt32	%f8,	%f24,	%g2
	umulcc	%l3,	0x0030,	%i6
	sir	0x093A
	umul	%o2,	0x1B7C,	%l4
	fnot2s	%f23,	%f30
	sdivx	%o7,	0x1199,	%g5
	set	0x6C, %g3
	lduba	[%l7 + %g3] 0x04,	%i2
	edge16n	%l6,	%l2,	%g6
	movge	%xcc,	%g1,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f2,	%f13,	%f19
	membar	0x07
	fbn,a	%fcc0,	loop_1339
	fmovdvs	%icc,	%f24,	%f28
	movcc	%xcc,	%g3,	%l5
	tvc	%icc,	0x3
loop_1339:
	stb	%l0,	[%l7 + 0x4D]
	ble,a	%icc,	loop_1340
	fpadd16	%f14,	%f26,	%f26
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x54] %asi,	%o5
loop_1340:
	edge16ln	%l1,	%i1,	%i5
	tvc	%icc,	0x0
	movl	%icc,	%o4,	%i0
	addcc	%o6,	%o1,	%i7
	smulcc	%i3,	0x0250,	%o0
	ldd	[%l7 + 0x68],	%i4
	srax	%g7,	0x18,	%o3
	std	%l2,	[%l7 + 0x70]
	movgu	%xcc,	%g2,	%i6
	tsubcctv	%l4,	0x0957,	%o2
	fmovrse	%o7,	%f8,	%f30
	ba,a,pn	%xcc,	loop_1341
	sub	%i2,	0x090E,	%g5
	udiv	%l2,	0x03DE,	%l6
	ba,pt	%xcc,	loop_1342
loop_1341:
	fble,a	%fcc3,	loop_1343
	fcmpne32	%f26,	%f6,	%g6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x88,	%g1,	%g4
loop_1342:
	brlez	%l5,	loop_1344
loop_1343:
	fcmps	%fcc1,	%f27,	%f9
	tl	%icc,	0x5
	movne	%icc,	%l0,	%o5
loop_1344:
	movle	%xcc,	%l1,	%g3
	tle	%icc,	0x1
	movne	%icc,	%i1,	%o4
	be,a	loop_1345
	xorcc	%i5,	0x04F2,	%o6
	xorcc	%i0,	%o1,	%i3
	flush	%l7 + 0x58
loop_1345:
	nop
	set	0x70, %g6
	prefetcha	[%l7 + %g6] 0x04,	 0x1
	fzeros	%f17
	srl	%o0,	0x04,	%g7
	edge16	%o3,	%l3,	%g2
	fnands	%f7,	%f16,	%f5
	udiv	%i4,	0x04A2,	%l4
	tge	%icc,	0x0
	bne,a,pt	%xcc,	loop_1346
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x74],	%i6
	edge16ln	%o7,	%i2,	%g5
loop_1346:
	fbge,a	%fcc1,	loop_1347
	fmovsleu	%icc,	%f24,	%f27
	edge32l	%o2,	%l2,	%l6
	taddcc	%g6,	0x0997,	%g1
loop_1347:
	movvs	%icc,	%l5,	%l0
	ld	[%l7 + 0x1C],	%f3
	xor	%o5,	0x0BC0,	%l1
	movleu	%icc,	%g3,	%i1
	popc	0x1EA5,	%g4
	edge16n	%i5,	%o4,	%o6
	be	%icc,	loop_1348
	fble	%fcc1,	loop_1349
	fxors	%f16,	%f13,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1348:
	movrgez	%i0,	0x3A1,	%i3
loop_1349:
	udivx	%o1,	0x06C1,	%i7
	ldx	[%l7 + 0x38],	%o0
	smul	%o3,	%g7,	%l3
	sethi	0x09FD,	%g2
	move	%icc,	%i4,	%l4
	movcc	%xcc,	%i6,	%i2
	membar	0x38
	andcc	%o7,	0x1C35,	%g5
	ldub	[%l7 + 0x28],	%o2
	sdivx	%l6,	0x1ECE,	%l2
	fcmple32	%f16,	%f2,	%g6
	prefetch	[%l7 + 0x34],	 0x3
	tle	%icc,	0x6
	movre	%l5,	%g1,	%o5
	fmul8sux16	%f24,	%f28,	%f4
	addccc	%l1,	%l0,	%i1
	orncc	%g3,	0x0AED,	%i5
	array16	%o4,	%g4,	%o6
	edge16l	%i3,	%o1,	%i0
	bneg,pt	%xcc,	loop_1350
	tsubcctv	%i7,	0x1A61,	%o3
	addc	%o0,	%l3,	%g7
	sra	%g2,	0x15,	%i4
loop_1350:
	taddcc	%l4,	0x0878,	%i2
	fmovrslez	%o7,	%f2,	%f17
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x48] %asi,	%g5
	fmovdleu	%icc,	%f10,	%f28
	edge16ln	%o2,	%i6,	%l2
	fmovsvs	%xcc,	%f18,	%f17
	tsubcctv	%l6,	%l5,	%g6
	smul	%o5,	0x00D9,	%g1
	fbu,a	%fcc0,	loop_1351
	tcc	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	stda	%l0,	[%l7 + 0x68] %asi
loop_1351:
	fmovsa	%xcc,	%f29,	%f15
	tn	%icc,	0x4
	fbul,a	%fcc0,	loop_1352
	sir	0x1CF2
	subccc	%i1,	0x14C0,	%g3
	ta	%xcc,	0x5
loop_1352:
	taddcctv	%l0,	0x187B,	%i5
	fpmerge	%f23,	%f11,	%f10
	xor	%g4,	%o6,	%o4
	movcs	%icc,	%o1,	%i0
	fcmpgt32	%f2,	%f14,	%i3
	tleu	%icc,	0x2
	fmovsa	%icc,	%f31,	%f26
	fcmpgt32	%f24,	%f18,	%i7
	mova	%icc,	%o0,	%o3
	xnor	%l3,	0x0861,	%g2
	movle	%icc,	%i4,	%g7
	sir	0x08A2
	fmovsle	%xcc,	%f31,	%f10
	fmovrslz	%l4,	%f30,	%f23
	bl,pn	%icc,	loop_1353
	addc	%i2,	%o7,	%o2
	fmul8x16au	%f25,	%f2,	%f0
	movge	%icc,	%g5,	%l2
loop_1353:
	fmovrse	%l6,	%f31,	%f27
	umulcc	%i6,	0x0CCD,	%l5
	tcc	%xcc,	0x5
	xor	%o5,	0x0569,	%g6
	taddcctv	%g1,	0x0DA5,	%i1
	fmovdg	%xcc,	%f25,	%f22
	ldstub	[%l7 + 0x5E],	%l1
	xnor	%l0,	%i5,	%g3
	fnot1	%f18,	%f14
	bg	%icc,	loop_1354
	lduh	[%l7 + 0x5C],	%o6
	set	0x1A, %g5
	lduba	[%l7 + %g5] 0x19,	%o4
loop_1354:
	fcmped	%fcc2,	%f20,	%f14
	movcs	%xcc,	%g4,	%o1
	membar	0x62
	addc	%i0,	0x08BB,	%i3
	fmovsn	%icc,	%f9,	%f21
	alignaddr	%i7,	%o3,	%o0
	movrne	%g2,	0x06C,	%l3
	fmovrslz	%g7,	%f21,	%f7
	ba,a,pt	%xcc,	loop_1355
	tcc	%icc,	0x7
	orncc	%i4,	%l4,	%i2
	fmovspos	%icc,	%f17,	%f19
loop_1355:
	andcc	%o2,	%o7,	%g5
	bneg,a	%xcc,	loop_1356
	mulscc	%l2,	%l6,	%l5
	movg	%icc,	%o5,	%g6
	edge8n	%i6,	%g1,	%i1
loop_1356:
	fmovsl	%xcc,	%f17,	%f30
	xorcc	%l1,	%i5,	%l0
	bneg	%xcc,	loop_1357
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc1,	loop_1358
	movvc	%icc,	%g3,	%o4
loop_1357:
	prefetch	[%l7 + 0x20],	 0x2
	movrne	%o6,	%g4,	%o1
loop_1358:
	edge32l	%i3,	%i7,	%o3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x64] %asi,	%o0
	stb	%g2,	[%l7 + 0x1C]
	xor	%l3,	%i0,	%g7
	ldd	[%l7 + 0x20],	%f22
	movrlz	%i4,	0x32E,	%i2
	mova	%xcc,	%l4,	%o7
	fcmpeq16	%f12,	%f14,	%o2
	fbul	%fcc2,	loop_1359
	nop
	setx	loop_1360,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%g5,	%l2,	%l6
	mulscc	%l5,	%g6,	%o5
loop_1359:
	brlez	%i6,	loop_1361
loop_1360:
	nop
	setx loop_1362, %l0, %l1
	jmpl %l1, %i1
	fmovdge	%icc,	%f26,	%f0
	tleu	%xcc,	0x7
loop_1361:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%l0,	[%l7 + 0x60] %asi
loop_1362:
	alignaddrl	%i5,	%g1,	%g3
	sir	0x07F9
	xnor	%o4,	%l0,	%g4
	tvc	%icc,	0x1
	xorcc	%o6,	0x1F88,	%o1
	and	%i7,	%o3,	%o0
	lduh	[%l7 + 0x5C],	%g2
	brz	%i3,	loop_1363
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x099D,	%i0
	movgu	%icc,	%l3,	%g7
loop_1363:
	fmovdle	%icc,	%f16,	%f0
	xnorcc	%i2,	0x14A4,	%i4
	call	loop_1364
	addcc	%l4,	0x083B,	%o2
	call	loop_1365
	movvc	%xcc,	%o7,	%l2
loop_1364:
	ldsw	[%l7 + 0x6C],	%g5
	fbge	%fcc2,	loop_1366
loop_1365:
	movpos	%icc,	%l5,	%l6
	ble,pt	%icc,	loop_1367
	call	loop_1368
loop_1366:
	udiv	%o5,	0x0D88,	%g6
	movge	%icc,	%i1,	%l1
loop_1367:
	edge8ln	%i6,	%i5,	%g3
loop_1368:
	nop
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x28] %asi,	%g1
	edge32n	%l0,	%g4,	%o6
	bg,pt	%icc,	loop_1369
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f24
	addccc	%o4,	0x1B5D,	%i7
loop_1369:
	tl	%xcc,	0x3
	set	0x26, %g1
	ldsha	[%l7 + %g1] 0x88,	%o1
	membar	0x44
	fmovsl	%xcc,	%f1,	%f23
	movrne	%o3,	0x1EA,	%g2
	fones	%f26
	edge8	%o0,	%i0,	%l3
	fmovsg	%icc,	%f20,	%f14
	set	0x30, %i3
	ldda	[%l7 + %i3] 0x88,	%i2
	bl,a	%xcc,	loop_1370
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i2,	%i4,	%l4
	tcc	%xcc,	0x7
loop_1370:
	subccc	%o2,	%g7,	%o7
	edge16n	%l2,	%g5,	%l6
	movne	%xcc,	%o5,	%l5
	set	0x48, %o5
	swapa	[%l7 + %o5] 0x18,	%g6
	movrlz	%i1,	%l1,	%i6
	tne	%xcc,	0x7
	set	0x40, %i0
	ldswa	[%l7 + %i0] 0x15,	%i5
	or	%g3,	%l0,	%g4
	movre	%g1,	%o6,	%i7
	or	%o1,	%o4,	%o3
	fble	%fcc0,	loop_1371
	move	%xcc,	%g2,	%o0
	fmovspos	%icc,	%f17,	%f29
	edge16	%i0,	%i3,	%l3
loop_1371:
	udivx	%i2,	0x138B,	%l4
	mulx	%o2,	%g7,	%i4
	fmovda	%xcc,	%f17,	%f22
	fmovrdlez	%l2,	%f0,	%f2
	bvc,a	%xcc,	loop_1372
	sllx	%o7,	%l6,	%g5
	xor	%l5,	%o5,	%g6
	ldsh	[%l7 + 0x38],	%l1
loop_1372:
	nop
	setx	loop_1373,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnegs	%f24,	%f28
	xnorcc	%i6,	0x1E05,	%i1
	fpadd32	%f12,	%f28,	%f28
loop_1373:
	tcc	%xcc,	0x3
	bvs	%xcc,	loop_1374
	mulscc	%i5,	%g3,	%l0
	fcmple32	%f8,	%f20,	%g1
	fornot1s	%f4,	%f26,	%f2
loop_1374:
	fzero	%f8
	nop
	setx loop_1375, %l0, %l1
	jmpl %l1, %g4
	add	%o6,	%o1,	%o4
	fbug,a	%fcc1,	loop_1376
	taddcc	%o3,	0x058B,	%i7
loop_1375:
	fnors	%f31,	%f17,	%f22
	movleu	%xcc,	%g2,	%o0
loop_1376:
	subccc	%i0,	%l3,	%i3
	tneg	%xcc,	0x3
	bge,a	%icc,	loop_1377
	udivx	%l4,	0x1C14,	%o2
	fpackfix	%f24,	%f0
	fmovscc	%xcc,	%f14,	%f16
loop_1377:
	addc	%i2,	%g7,	%l2
	ta	%icc,	0x1
	brz,a	%i4,	loop_1378
	mulscc	%o7,	0x1E80,	%g5
	fblg	%fcc2,	loop_1379
	add	%l5,	0x05BF,	%o5
loop_1378:
	sdivx	%g6,	0x1A20,	%l1
	subccc	%l6,	0x06EA,	%i6
loop_1379:
	ldsb	[%l7 + 0x29],	%i5
	tge	%xcc,	0x4
	stx	%g3,	[%l7 + 0x70]
	fmovrse	%l0,	%f13,	%f18
	sllx	%i1,	%g4,	%g1
	bcc,a,pn	%xcc,	loop_1380
	bvc,a	loop_1381
	tn	%xcc,	0x7
	orncc	%o1,	%o6,	%o3
loop_1380:
	movle	%xcc,	%o4,	%i7
loop_1381:
	edge8ln	%o0,	%g2,	%i0
	stx	%l3,	[%l7 + 0x08]
	andn	%i3,	%l4,	%i2
	tcs	%icc,	0x7
	array16	%o2,	%g7,	%i4
	bshuffle	%f28,	%f14,	%f24
	sllx	%l2,	0x11,	%g5
	nop
	setx	loop_1382,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%icc,	0x4
	fnand	%f4,	%f4,	%f0
	or	%o7,	0x00FF,	%l5
loop_1382:
	ldub	[%l7 + 0x2C],	%o5
	udivx	%g6,	0x10D8,	%l6
	fpsub16	%f16,	%f28,	%f26
	fbu,a	%fcc1,	loop_1383
	addc	%i6,	0x0E47,	%i5
	st	%f26,	[%l7 + 0x5C]
	set	0x0, %o3
	ldxa	[%g0 + %o3] 0x4f,	%l1
loop_1383:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x40] %asi,	%l0
	edge16l	%g3,	%g4,	%i1
	siam	0x5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x54] %asi,	%g1
	fpsub32s	%f27,	%f2,	%f18
	fmovspos	%xcc,	%f14,	%f24
	fandnot1s	%f17,	%f31,	%f14
	fnors	%f3,	%f17,	%f20
	fbe	%fcc0,	loop_1384
	array32	%o1,	%o6,	%o4
	alignaddrl	%i7,	%o0,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1384:
	brz	%o3,	loop_1385
	bg,a,pt	%icc,	loop_1386
	fbue,a	%fcc0,	loop_1387
	movgu	%icc,	%i0,	%i3
loop_1385:
	fmovsleu	%icc,	%f12,	%f26
loop_1386:
	array16	%l3,	%i2,	%l4
loop_1387:
	fble,a	%fcc0,	loop_1388
	lduw	[%l7 + 0x78],	%g7
	tcs	%icc,	0x4
	sdiv	%i4,	0x1AD5,	%l2
loop_1388:
	fmovrse	%o2,	%f17,	%f14
	tleu	%xcc,	0x0
	orn	%g5,	%l5,	%o5
	movrne	%g6,	0x0E9,	%l6
	edge32n	%o7,	%i5,	%i6
	array32	%l1,	%l0,	%g3
	fornot1	%f6,	%f12,	%f30
	brgz	%g4,	loop_1389
	taddcc	%g1,	%i1,	%o1
	srl	%o6,	0x0A,	%i7
	sdiv	%o0,	0x1F1C,	%g2
loop_1389:
	add	%o3,	0x0684,	%i0
	taddcc	%i3,	%o4,	%i2
	stx	%l3,	[%l7 + 0x30]
	fmovsvc	%xcc,	%f0,	%f5
	udiv	%g7,	0x087F,	%i4
	andn	%l2,	0x1BF2,	%o2
	srl	%g5,	%l5,	%o5
	movge	%icc,	%l4,	%l6
	ldsh	[%l7 + 0x18],	%o7
	lduw	[%l7 + 0x34],	%i5
	srax	%i6,	0x12,	%g6
	st	%f8,	[%l7 + 0x30]
	orn	%l0,	%g3,	%l1
	bleu,pt	%xcc,	loop_1390
	fnor	%f24,	%f12,	%f8
	array32	%g1,	%i1,	%o1
	xor	%g4,	%i7,	%o0
loop_1390:
	tsubcctv	%g2,	0x0D93,	%o6
	movre	%o3,	0x371,	%i3
	fmovrde	%o4,	%f12,	%f20
	lduh	[%l7 + 0x64],	%i2
	tgu	%icc,	0x5
	edge32ln	%i0,	%l3,	%g7
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l2
	andncc	%i4,	%g5,	%l5
	movcs	%xcc,	%o2,	%l4
	set	0x44, %i2
	lduha	[%l7 + %i2] 0x11,	%l6
	tcc	%xcc,	0x5
	orncc	%o5,	%i5,	%i6
	sdivcc	%g6,	0x14BC,	%o7
	addc	%g3,	0x15C0,	%l0
	set	0x6C, %i5
	swapa	[%l7 + %i5] 0x0c,	%l1
	bleu,pt	%icc,	loop_1391
	subc	%g1,	%i1,	%g4
	smul	%i7,	0x0510,	%o0
	lduw	[%l7 + 0x60],	%g2
loop_1391:
	tgu	%icc,	0x6
	fmovrdne	%o1,	%f14,	%f14
	fmovdvc	%icc,	%f1,	%f28
	edge32	%o6,	%i3,	%o4
	brz	%o3,	loop_1392
	ld	[%l7 + 0x54],	%f28
	fmovrde	%i2,	%f22,	%f26
	brgez	%l3,	loop_1393
loop_1392:
	st	%f3,	[%l7 + 0x1C]
	movrlez	%g7,	0x2E6,	%l2
	mulx	%i4,	0x0C01,	%i0
loop_1393:
	for	%f22,	%f10,	%f24
	fnands	%f4,	%f24,	%f14
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x13] %asi,	%g5
	edge16n	%l5,	%l4,	%l6
	alignaddr	%o5,	%i5,	%o2
	umulcc	%i6,	0x0D4A,	%g6
	fmovrsgz	%g3,	%f20,	%f0
	tne	%icc,	0x6
	fbu	%fcc3,	loop_1394
	tneg	%xcc,	0x2
	sth	%o7,	[%l7 + 0x4C]
	movg	%icc,	%l0,	%g1
loop_1394:
	fcmps	%fcc1,	%f16,	%f7
	and	%i1,	0x0CCC,	%g4
	xor	%l1,	%i7,	%o0
	movrne	%g2,	%o6,	%i3
	tvs	%xcc,	0x7
	fmovs	%f29,	%f7
	fpadd32s	%f3,	%f14,	%f26
	move	%xcc,	%o4,	%o1
	tgu	%xcc,	0x7
	fmovdgu	%xcc,	%f28,	%f30
	edge32	%i2,	%l3,	%o3
	tgu	%icc,	0x5
	fcmpes	%fcc2,	%f25,	%f1
	tle	%icc,	0x5
	edge32l	%g7,	%i4,	%l2
	bgu,a,pt	%xcc,	loop_1395
	orcc	%g5,	%i0,	%l4
	edge16n	%l5,	%l6,	%o5
	fpadd16	%f24,	%f6,	%f0
loop_1395:
	movre	%i5,	%o2,	%g6
	ldsw	[%l7 + 0x58],	%g3
	fbg	%fcc1,	loop_1396
	te	%icc,	0x6
	movrgz	%o7,	%l0,	%i6
	fandnot1s	%f5,	%f16,	%f6
loop_1396:
	tg	%icc,	0x1
	bcc,a,pt	%icc,	loop_1397
	bpos,pn	%xcc,	loop_1398
	andn	%g1,	0x0E53,	%i1
	fble	%fcc3,	loop_1399
loop_1397:
	udiv	%l1,	0x1E2E,	%g4
loop_1398:
	movge	%icc,	%i7,	%o0
	fmovse	%xcc,	%f6,	%f19
loop_1399:
	fcmpes	%fcc2,	%f21,	%f25
	alignaddr	%g2,	%o6,	%i3
	fandnot2	%f4,	%f2,	%f4
	sll	%o1,	0x1B,	%o4
	mova	%xcc,	%l3,	%i2
	fbl,a	%fcc3,	loop_1400
	tpos	%icc,	0x1
	umul	%o3,	%g7,	%i4
	udivcc	%g5,	0x185C,	%i0
loop_1400:
	fbug	%fcc1,	loop_1401
	addccc	%l4,	0x0C36,	%l5
	movleu	%icc,	%l2,	%o5
	siam	0x1
loop_1401:
	mulx	%l6,	0x11CA,	%i5
	set	0x40, %o2
	stda	%g6,	[%l7 + %o2] 0x89
	fbg,a	%fcc1,	loop_1402
	taddcc	%o2,	%o7,	%g3
	sub	%l0,	0x1460,	%g1
	tleu	%icc,	0x0
loop_1402:
	bvs	loop_1403
	movle	%xcc,	%i1,	%i6
	sethi	0x0210,	%l1
	or	%g4,	0x1F69,	%o0
loop_1403:
	mulx	%g2,	%i7,	%i3
	xnor	%o6,	%o4,	%o1
	edge8	%i2,	%l3,	%g7
	array16	%i4,	%g5,	%i0
	fmovrslez	%o3,	%f20,	%f2
	ldx	[%l7 + 0x30],	%l4
	set	0x50, %g2
	ldxa	[%l7 + %g2] 0x19,	%l2
	bcc	loop_1404
	alignaddrl	%l5,	%l6,	%o5
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x2C] %asi,	%f5
loop_1404:
	nop
	wr	%g0,	0x11,	%asi
	stha	%i5,	[%l7 + 0x46] %asi
	tsubcctv	%o2,	0x0FC6,	%o7
	movrgez	%g3,	%g6,	%l0
	mulx	%g1,	0x1C66,	%i1
	membar	0x4D
	tcs	%icc,	0x0
	umulcc	%l1,	0x14FA,	%g4
	be,a,pn	%icc,	loop_1405
	movcc	%xcc,	%o0,	%i6
	movcc	%icc,	%g2,	%i7
	sir	0x0EC1
loop_1405:
	edge16n	%o6,	%o4,	%i3
	sra	%o1,	%l3,	%g7
	sllx	%i4,	0x0B,	%g5
	andn	%i0,	0x16BF,	%o3
	subccc	%i2,	0x1297,	%l2
	wr	%g0,	0xeb,	%asi
	stda	%l4,	[%l7 + 0x18] %asi
	membar	#Sync
	fmovs	%f29,	%f10
	fmovdvc	%xcc,	%f24,	%f2
	fble	%fcc2,	loop_1406
	sra	%l6,	%o5,	%i5
	srlx	%l4,	0x0D,	%o7
	ba	%xcc,	loop_1407
loop_1406:
	fones	%f12
	movrgz	%o2,	0x137,	%g6
	set	0x52, %l5
	stba	%l0,	[%l7 + %l5] 0x23
	membar	#Sync
loop_1407:
	fandnot2s	%f15,	%f2,	%f23
	movrgez	%g1,	%g3,	%i1
	set	0x16, %i1
	stha	%l1,	[%l7 + %i1] 0x04
	xorcc	%o0,	0x0371,	%g4
	sdiv	%g2,	0x1660,	%i6
	prefetch	[%l7 + 0x74],	 0x2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x44] %asi,	%i7
	nop
	set	0x67, %o7
	ldstub	[%l7 + %o7],	%o6
	alignaddrl	%o4,	%i3,	%o1
	fsrc1s	%f29,	%f17
	orcc	%g7,	0x0F36,	%i4
	fmovrslez	%l3,	%f23,	%f4
	fmovrde	%g5,	%f24,	%f12
	movle	%icc,	%i0,	%i2
	edge16ln	%l2,	%l5,	%o3
	edge32n	%l6,	%o5,	%l4
	sth	%i5,	[%l7 + 0x6E]
	add	%o2,	%o7,	%g6
	fzeros	%f14
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x64] %asi,	%g1
	edge16	%g3,	%i1,	%l1
	fbule	%fcc2,	loop_1408
	ldsh	[%l7 + 0x3E],	%l0
	fmovrdgz	%g4,	%f16,	%f24
	nop
	setx	loop_1409,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1408:
	std	%o0,	[%l7 + 0x10]
	srlx	%i6,	%i7,	%g2
	edge32ln	%o4,	%i3,	%o1
loop_1409:
	ldub	[%l7 + 0x15],	%o6
	xnor	%g7,	%l3,	%g5
	fandnot1	%f20,	%f26,	%f26
	srax	%i4,	0x19,	%i0
	addc	%l2,	0x09B9,	%i2
	sll	%o3,	%l5,	%o5
	edge16n	%l6,	%i5,	%l4
	bneg,a,pn	%xcc,	loop_1410
	srlx	%o2,	%o7,	%g6
	fcmpes	%fcc0,	%f2,	%f12
	orncc	%g1,	%i1,	%g3
loop_1410:
	fmovse	%icc,	%f13,	%f16
	tsubcctv	%l1,	0x00F5,	%l0
	umul	%g4,	%i6,	%i7
	fmovscc	%icc,	%f29,	%f29
	nop
	set	0x20, %g4
	ldsw	[%l7 + %g4],	%g2
	srax	%o0,	0x1A,	%i3
	fsrc1s	%f10,	%f8
	fmovdn	%icc,	%f10,	%f2
	subcc	%o4,	%o6,	%o1
	fnot2s	%f27,	%f10
	sdiv	%l3,	0x1E4E,	%g7
	fornot1s	%f18,	%f20,	%f19
	fbule,a	%fcc3,	loop_1411
	andncc	%g5,	%i0,	%i4
	orcc	%i2,	%l2,	%o3
	set	0x48, %o1
	stxa	%o5,	[%l7 + %o1] 0xe2
	membar	#Sync
loop_1411:
	edge32ln	%l6,	%l5,	%i5
	tn	%xcc,	0x6
	tvc	%xcc,	0x0
	fbule	%fcc2,	loop_1412
	fzeros	%f10
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%l4
loop_1412:
	srax	%g6,	%o7,	%g1
	lduw	[%l7 + 0x18],	%i1
	fmovsn	%xcc,	%f4,	%f15
	fmovrsgez	%l1,	%f0,	%f13
	edge8n	%l0,	%g3,	%i6
	movcs	%icc,	%g4,	%i7
	fmovdgu	%icc,	%f21,	%f27
	xnor	%o0,	0x0C04,	%g2
	fzeros	%f1
	subc	%i3,	%o4,	%o1
	fmul8x16	%f3,	%f28,	%f8
	brlz,a	%l3,	loop_1413
	movcs	%xcc,	%o6,	%g7
	tg	%xcc,	0x2
	lduh	[%l7 + 0x52],	%i0
loop_1413:
	tgu	%xcc,	0x6
	tcc	%icc,	0x6
	movneg	%icc,	%g5,	%i4
	addcc	%i2,	%l2,	%o5
	edge32	%o3,	%l5,	%l6
	addcc	%o2,	%l4,	%g6
	sethi	0x1CDD,	%i5
	fmovsl	%xcc,	%f25,	%f31
	stx	%g1,	[%l7 + 0x58]
	brgz,a	%o7,	loop_1414
	fcmps	%fcc1,	%f14,	%f6
	edge32l	%i1,	%l1,	%l0
	fmul8x16	%f15,	%f26,	%f22
loop_1414:
	nop
	set	0x10, %o6
	ldda	[%l7 + %o6] 0x2b,	%i6
	array16	%g3,	%i7,	%g4
	orcc	%g2,	0x0F23,	%i3
	movg	%icc,	%o4,	%o1
	sir	0x06A4
	fmovse	%icc,	%f6,	%f21
	fzeros	%f28
	tge	%xcc,	0x3
	edge16	%o0,	%l3,	%g7
	addcc	%o6,	0x1E08,	%g5
	fcmpd	%fcc1,	%f6,	%f14
	move	%icc,	%i0,	%i4
	fcmpgt16	%f26,	%f24,	%l2
	xnor	%i2,	%o3,	%o5
	orcc	%l6,	0x0476,	%o2
	movrgz	%l5,	%g6,	%i5
	edge16l	%l4,	%g1,	%o7
	mulx	%l1,	0x0DA4,	%l0
	fcmps	%fcc3,	%f28,	%f7
	membar	0x00
	smulcc	%i1,	%g3,	%i6
	orncc	%g4,	%g2,	%i7
	wr	%g0,	0x80,	%asi
	stda	%i2,	[%l7 + 0x38] %asi
	tpos	%xcc,	0x1
	alignaddrl	%o4,	%o0,	%l3
	orncc	%g7,	%o6,	%g5
	set	0x2C, %l1
	lduwa	[%l7 + %l1] 0x14,	%i0
	orcc	%o1,	0x1083,	%l2
	nop
	setx	loop_1415,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16au	%f18,	%f19,	%f14
	lduw	[%l7 + 0x28],	%i4
	edge16ln	%o3,	%o5,	%l6
loop_1415:
	smul	%i2,	0x094A,	%l5
	fbg	%fcc2,	loop_1416
	movrlz	%g6,	%o2,	%l4
	fmovd	%f4,	%f16
	subc	%i5,	0x020C,	%o7
loop_1416:
	edge32n	%l1,	%l0,	%i1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge32l	%g3,	%g1,	%i6
	sir	0x1DF7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%g4
	set	0x6A, %o0
	stha	%i3,	[%l7 + %o0] 0x11
	smulcc	%i7,	%o0,	%o4
	movle	%xcc,	%l3,	%o6
	mulscc	%g7,	0x0582,	%g5
	tgu	%xcc,	0x3
	fmuld8ulx16	%f25,	%f4,	%f24
	fornot2	%f24,	%f10,	%f8
	srlx	%i0,	%l2,	%o1
	std	%o2,	[%l7 + 0x70]
	fmovscs	%xcc,	%f22,	%f27
	movcs	%icc,	%i4,	%o5
	fmovrsgez	%i2,	%f9,	%f1
	fmovsleu	%xcc,	%f1,	%f22
	fble,a	%fcc3,	loop_1417
	fmovs	%f6,	%f3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x55] %asi,	%l5
loop_1417:
	stw	%l6,	[%l7 + 0x40]
	tn	%xcc,	0x3
	andcc	%g6,	%o2,	%i5
	fmul8x16	%f18,	%f24,	%f24
	fmovsleu	%icc,	%f15,	%f21
	fmovse	%icc,	%f30,	%f18
	fbu	%fcc0,	loop_1418
	sll	%o7,	%l1,	%l4
	move	%icc,	%l0,	%i1
	fmovrdne	%g1,	%f28,	%f28
loop_1418:
	fmovdleu	%xcc,	%f24,	%f0
	fbge	%fcc2,	loop_1419
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x5B, %l4
	ldstuba	[%l7 + %l4] 0x89,	%i6
loop_1419:
	move	%icc,	%g3,	%g2
	ldsb	[%l7 + 0x5C],	%g4
	udiv	%i7,	0x08D1,	%o0
	movn	%icc,	%o4,	%i3
	srax	%o6,	%l3,	%g7
	ble	%xcc,	loop_1420
	fnot2s	%f7,	%f17
	fnot1s	%f2,	%f11
	xorcc	%g5,	0x054F,	%i0
loop_1420:
	fmovdpos	%icc,	%f21,	%f9
	fnand	%f16,	%f2,	%f2
	udivx	%l2,	0x15D8,	%o3
	edge16	%i4,	%o1,	%o5
	call	loop_1421
	movg	%xcc,	%i2,	%l6
	xorcc	%g6,	0x0A39,	%l5
	tsubcc	%o2,	0x1C5D,	%i5
loop_1421:
	sir	0x11AF
	fcmple16	%f22,	%f2,	%o7
	fbule	%fcc0,	loop_1422
	tsubcctv	%l4,	0x1D5D,	%l0
	tn	%xcc,	0x5
	fmovrsne	%l1,	%f27,	%f12
loop_1422:
	fnot1s	%f12,	%f8
	wr	%g0,	0x23,	%asi
	stba	%g1,	[%l7 + 0x41] %asi
	membar	#Sync
	brlez	%i1,	loop_1423
	fmovdvc	%icc,	%f7,	%f0
	tleu	%icc,	0x2
	alignaddrl	%i6,	%g3,	%g2
loop_1423:
	fba,a	%fcc3,	loop_1424
	fbue	%fcc1,	loop_1425
	tleu	%xcc,	0x7
	fmovdcc	%xcc,	%f31,	%f23
loop_1424:
	fmovsvc	%icc,	%f14,	%f4
loop_1425:
	movneg	%icc,	%g4,	%o0
	popc	0x0A56,	%i7
	sdivcc	%o4,	0x188B,	%o6
	bleu,a,pt	%xcc,	loop_1426
	movleu	%icc,	%l3,	%i3
	xnor	%g7,	0x1ED5,	%i0
	edge16	%g5,	%l2,	%o3
loop_1426:
	sethi	0x1A25,	%i4
	edge8	%o5,	%o1,	%l6
	fbue	%fcc0,	loop_1427
	sethi	0x0FAB,	%i2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g6,	%l5
loop_1427:
	orn	%i5,	%o2,	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%l0
	movrlez	%g1,	%l1,	%i6
	set	0x22, %g7
	stha	%g3,	[%l7 + %g7] 0x89
	or	%g2,	0x0CFF,	%g4
	udiv	%i1,	0x0D06,	%i7
	sdiv	%o0,	0x0917,	%o6
	movvc	%xcc,	%o4,	%i3
	fbne	%fcc0,	loop_1428
	nop
	setx	loop_1429,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srlx	%g7,	0x0E,	%i0
	or	%g5,	0x15DB,	%l2
loop_1428:
	movcs	%icc,	%l3,	%i4
loop_1429:
	array8	%o3,	%o1,	%o5
	fnot1s	%f27,	%f13
	lduh	[%l7 + 0x54],	%i2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%l5
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i5
	fbn	%fcc3,	loop_1430
	ldd	[%l7 + 0x28],	%g6
	fmovspos	%xcc,	%f24,	%f22
	te	%xcc,	0x6
loop_1430:
	tsubcctv	%o2,	%o7,	%l4
	sdivcc	%l0,	0x0CD0,	%g1
	bg,a	%xcc,	loop_1431
	nop
	set	0x46, %l0
	ldstub	[%l7 + %l0],	%l1
	taddcctv	%i6,	0x06A6,	%g3
	pdist	%f14,	%f4,	%f0
loop_1431:
	std	%g4,	[%l7 + 0x60]
	sllx	%i1,	0x0E,	%i7
	sub	%g2,	%o6,	%o4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	sethi	0x0841,	%g7
	tne	%icc,	0x3
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x60] %asi,	%o0
	udiv	%g5,	0x07F9,	%i0
	popc	0x01D8,	%l2
	tpos	%xcc,	0x1
	fmovrdgz	%i4,	%f12,	%f16
	fmovdvs	%xcc,	%f7,	%f21
	umulcc	%l3,	%o1,	%o3
	xnor	%o5,	0x0F64,	%l6
	movrlez	%i2,	%i5,	%g6
	tleu	%icc,	0x1
	edge16ln	%l5,	%o7,	%o2
	bpos,pt	%xcc,	loop_1432
	bvc,pn	%xcc,	loop_1433
	fbg,a	%fcc0,	loop_1434
	movrne	%l4,	0x18A,	%g1
loop_1432:
	tn	%icc,	0x5
loop_1433:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1434:
	nop
	set	0x10, %i6
	ldsba	[%l7 + %i6] 0x88,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i6,	0x0DEE,	%g3
	sll	%g4,	%l0,	%i7
	sra	%g2,	0x01,	%i1
	fbn,a	%fcc3,	loop_1435
	tvc	%icc,	0x0
	movcc	%xcc,	%o6,	%o4
	umulcc	%i3,	0x11BD,	%o0
loop_1435:
	movgu	%icc,	%g7,	%g5
	tsubcc	%l2,	%i0,	%i4
	bcs,pn	%xcc,	loop_1436
	subc	%l3,	0x1430,	%o1
	edge32	%o5,	%l6,	%o3
	addccc	%i2,	%i5,	%g6
loop_1436:
	lduw	[%l7 + 0x4C],	%l5
	bpos,a,pt	%xcc,	loop_1437
	fcmped	%fcc3,	%f26,	%f22
	srax	%o2,	0x05,	%l4
	tge	%xcc,	0x3
loop_1437:
	array8	%g1,	%o7,	%i6
	set	0x31, %i4
	lduba	[%l7 + %i4] 0x15,	%l1
	movre	%g3,	%g4,	%i7
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%l0
	edge8n	%g2,	%i1,	%o4
	set	0x55, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i3
	movrgez	%o6,	%g7,	%g5
	brgez,a	%l2,	loop_1438
	fbe	%fcc1,	loop_1439
	brlz	%i0,	loop_1440
	fbug	%fcc2,	loop_1441
loop_1438:
	edge8l	%i4,	%l3,	%o0
loop_1439:
	std	%f24,	[%l7 + 0x70]
loop_1440:
	nop
	set	0x22, %l3
	stba	%o5,	[%l7 + %l3] 0x19
loop_1441:
	sdiv	%l6,	0x0536,	%o3
	movvc	%xcc,	%o1,	%i2
	std	%f10,	[%l7 + 0x60]
	movne	%icc,	%i5,	%l5
	movvs	%icc,	%g6,	%l4
	subccc	%g1,	%o7,	%o2
	tcs	%xcc,	0x3
	movneg	%icc,	%i6,	%l1
	stb	%g3,	[%l7 + 0x10]
	swap	[%l7 + 0x2C],	%g4
	fmovse	%xcc,	%f0,	%f26
	fmovrde	%i7,	%f20,	%f20
	bgu	loop_1442
	fmovsl	%xcc,	%f24,	%f7
	popc	%l0,	%i1
	andn	%o4,	0x19F0,	%i3
loop_1442:
	fmovdl	%xcc,	%f6,	%f0
	movcs	%icc,	%o6,	%g2
	edge32ln	%g7,	%l2,	%i0
	sdiv	%i4,	0x1D46,	%l3
	fmovscc	%xcc,	%f19,	%f22
	movne	%xcc,	%o0,	%o5
	mulscc	%l6,	0x0422,	%o3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x40] %asi,	%g5
	tne	%xcc,	0x0
	xorcc	%o1,	0x0FDA,	%i5
	fpsub32	%f28,	%f10,	%f6
	orn	%l5,	0x16B7,	%i2
	edge8n	%l4,	%g1,	%o7
	ta	%xcc,	0x7
	alignaddrl	%o2,	%g6,	%i6
	fmul8ulx16	%f2,	%f0,	%f24
	fbuge,a	%fcc0,	loop_1443
	edge16	%g3,	%g4,	%i7
	set	0x18, %l6
	stwa	%l0,	[%l7 + %l6] 0x18
loop_1443:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x54] %asi,	%l1
	movl	%icc,	%o4,	%i1
	fmuld8sux16	%f9,	%f18,	%f18
	fbuge	%fcc3,	loop_1444
	fsrc1s	%f30,	%f7
	mulscc	%o6,	0x14D7,	%g2
	ldd	[%l7 + 0x20],	%f2
loop_1444:
	addcc	%g7,	0x0F38,	%i3
	fmovsneg	%xcc,	%f16,	%f6
	brz	%i0,	loop_1445
	ble,a	loop_1446
	fpmerge	%f22,	%f21,	%f0
	addccc	%i4,	%l3,	%o0
loop_1445:
	faligndata	%f18,	%f0,	%f12
loop_1446:
	edge8	%l2,	%l6,	%o3
	smulcc	%o5,	0x1F46,	%o1
	set	0x20, %i7
	stwa	%g5,	[%l7 + %i7] 0x88
	ta	%xcc,	0x3
	alignaddrl	%i5,	%l5,	%i2
	smul	%g1,	%l4,	%o7
	fandnot2s	%f18,	%f31,	%f26
	orncc	%o2,	%g6,	%i6
	set	0x30, %g6
	stwa	%g4,	[%l7 + %g6] 0x04
	nop
	setx loop_1447, %l0, %l1
	jmpl %l1, %g3
	movvs	%icc,	%i7,	%l0
	srl	%o4,	0x01,	%i1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x4C] %asi,	%f30
loop_1447:
	array32	%o6,	%g2,	%g7
	nop
	setx loop_1448, %l0, %l1
	jmpl %l1, %i3
	fcmpgt32	%f0,	%f28,	%i0
	fmovd	%f28,	%f30
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x32] %asi,	%l1
loop_1448:
	andcc	%i4,	%l3,	%l2
	fba	%fcc2,	loop_1449
	ba,pt	%xcc,	loop_1450
	alignaddr	%l6,	%o0,	%o5
	nop
	set	0x28, %g3
	ldsh	[%l7 + %g3],	%o1
loop_1449:
	fba	%fcc2,	loop_1451
loop_1450:
	fmovrdgz	%o3,	%f24,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g5,	[%l7 + 0x49]
loop_1451:
	tleu	%xcc,	0x5
	ldd	[%l7 + 0x70],	%i4
	movre	%l5,	0x00C,	%g1
	xor	%i2,	%o7,	%l4
	bneg,a,pt	%xcc,	loop_1452
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g6,	0x0B43,	%o2
	edge8ln	%g4,	%i6,	%i7
loop_1452:
	ldsb	[%l7 + 0x21],	%l0
	move	%icc,	%o4,	%i1
	brz	%o6,	loop_1453
	movre	%g2,	%g3,	%i3
	array32	%i0,	%g7,	%i4
	movg	%icc,	%l3,	%l2
loop_1453:
	fxor	%f16,	%f18,	%f12
	fexpand	%f26,	%f18
	addcc	%l6,	0x0E40,	%o0
	smul	%l1,	0x16E7,	%o1
	edge16n	%o5,	%o3,	%g5
	sdiv	%i5,	0x13D8,	%l5
	alignaddr	%i2,	%o7,	%g1
	taddcc	%g6,	0x03DB,	%o2
	fmovdl	%xcc,	%f13,	%f27
	edge32n	%l4,	%g4,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%icc,	%f23,	%f15
	edge8	%i6,	%l0,	%o4
	tg	%icc,	0x3
	brlez,a	%o6,	loop_1454
	fbuge	%fcc2,	loop_1455
	and	%i1,	%g3,	%i3
	fbule	%fcc2,	loop_1456
loop_1454:
	taddcctv	%g2,	%i0,	%i4
loop_1455:
	udivcc	%g7,	0x04B6,	%l2
	tleu	%xcc,	0x6
loop_1456:
	fxor	%f28,	%f30,	%f18
	popc	0x100C,	%l6
	movge	%icc,	%l3,	%o0
	edge16	%l1,	%o1,	%o5
	bneg,a,pn	%icc,	loop_1457
	movvc	%icc,	%o3,	%g5
	movre	%i5,	0x2EB,	%i2
	orn	%l5,	%o7,	%g1
loop_1457:
	fandnot1	%f10,	%f28,	%f28
	edge8l	%g6,	%l4,	%o2
	tneg	%xcc,	0x1
	set	0x28, %g5
	stda	%i6,	[%l7 + %g5] 0x2b
	membar	#Sync
	taddcctv	%i6,	0x13E6,	%g4
	sethi	0x08FC,	%o4
	fcmpne32	%f26,	%f6,	%o6
	sdiv	%l0,	0x08CD,	%g3
	mulscc	%i3,	%i1,	%g2
	fblg	%fcc3,	loop_1458
	fornot2s	%f23,	%f26,	%f12
	subcc	%i0,	0x0007,	%g7
	stb	%i4,	[%l7 + 0x6E]
loop_1458:
	movrne	%l6,	%l2,	%l3
	fmovd	%f14,	%f0
	fbo,a	%fcc0,	loop_1459
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o0,	0x1DB6,	%o1
	array8	%l1,	%o3,	%o5
loop_1459:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x30] %asi,	%f1
	movg	%xcc,	%g5,	%i5
	fbn	%fcc3,	loop_1460
	fbo,a	%fcc0,	loop_1461
	be,pn	%xcc,	loop_1462
	movl	%xcc,	%i2,	%l5
loop_1460:
	srax	%o7,	%g1,	%l4
loop_1461:
	addc	%o2,	0x1E9D,	%i7
loop_1462:
	edge8	%g6,	%i6,	%o4
	ldsh	[%l7 + 0x66],	%g4
	movneg	%icc,	%l0,	%o6
	nop
	setx loop_1463, %l0, %l1
	jmpl %l1, %i3
	srax	%g3,	0x17,	%g2
	and	%i1,	%i0,	%i4
	tcc	%icc,	0x2
loop_1463:
	sth	%l6,	[%l7 + 0x6E]
	edge32	%l2,	%l3,	%g7
	movre	%o0,	0x3F7,	%o1
	wr	%g0,	0x22,	%asi
	stxa	%o3,	[%l7 + 0x40] %asi
	membar	#Sync
	membar	0x79
	movneg	%xcc,	%l1,	%g5
	nop
	set	0x15, %g1
	stb	%i5,	[%l7 + %g1]
	movcs	%icc,	%i2,	%o5
	fnegs	%f26,	%f22
	movle	%xcc,	%l5,	%g1
	te	%xcc,	0x2
	fmovsleu	%xcc,	%f17,	%f8
	srax	%l4,	0x1E,	%o7
	nop
	setx	loop_1464,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbg,a	%fcc3,	loop_1465
	tl	%xcc,	0x3
	fmovdvc	%icc,	%f2,	%f4
loop_1464:
	fcmps	%fcc2,	%f23,	%f22
loop_1465:
	subc	%o2,	0x0D6B,	%g6
	fmul8ulx16	%f2,	%f16,	%f30
	smulcc	%i6,	0x0468,	%o4
	fbuge,a	%fcc0,	loop_1466
	srl	%i7,	%l0,	%o6
	taddcc	%i3,	0x1618,	%g4
	edge16n	%g3,	%i1,	%g2
loop_1466:
	fmovsvs	%icc,	%f24,	%f27
	wr	%g0,	0x80,	%asi
	stxa	%i0,	[%l7 + 0x70] %asi
	and	%l6,	%i4,	%l2
	udiv	%g7,	0x1907,	%o0
	orcc	%l3,	0x1C86,	%o1
	fcmpeq16	%f6,	%f10,	%l1
	movneg	%xcc,	%g5,	%i5
	tneg	%icc,	0x5
	movre	%i2,	%o5,	%l5
	for	%f30,	%f0,	%f10
	and	%o3,	0x18D1,	%g1
	movcs	%xcc,	%l4,	%o2
	alignaddr	%o7,	%i6,	%g6
	fsrc1	%f4,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	stha	%o4,	[%l7 + 0x3E] %asi
	udivx	%l0,	0x1132,	%i7
	tge	%icc,	0x7
	fbuge,a	%fcc1,	loop_1467
	array32	%o6,	%i3,	%g4
	fmovsa	%xcc,	%f27,	%f30
	addcc	%g3,	0x039B,	%g2
loop_1467:
	te	%icc,	0x6
	movrne	%i1,	%l6,	%i4
	fmovdcc	%icc,	%f12,	%f28
	fmovsgu	%xcc,	%f16,	%f17
	tg	%xcc,	0x6
	stx	%l2,	[%l7 + 0x20]
	movl	%xcc,	%i0,	%o0
	fbul	%fcc3,	loop_1468
	bshuffle	%f4,	%f18,	%f4
	edge32n	%l3,	%o1,	%l1
	fands	%f13,	%f29,	%f18
loop_1468:
	udiv	%g7,	0x0C42,	%i5
	movpos	%xcc,	%i2,	%g5
	bg,a	loop_1469
	fble,a	%fcc1,	loop_1470
	fcmpgt32	%f0,	%f2,	%l5
	tneg	%xcc,	0x6
loop_1469:
	tsubcctv	%o3,	%g1,	%o5
loop_1470:
	tvs	%icc,	0x6
	fcmpne32	%f10,	%f16,	%o2
	bg,pt	%xcc,	loop_1471
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o7,	0x026F,	%l4
	edge16n	%g6,	%o4,	%i6
loop_1471:
	srlx	%i7,	0x12,	%l0
	sll	%i3,	0x06,	%o6
	orcc	%g3,	0x1431,	%g2
	bn,a	%icc,	loop_1472
	fmovrsne	%i1,	%f13,	%f22
	tge	%xcc,	0x3
	fand	%f30,	%f8,	%f20
loop_1472:
	edge16	%g4,	%l6,	%l2
	fnand	%f8,	%f22,	%f28
	fmovsn	%icc,	%f30,	%f14
	tpos	%xcc,	0x3
	andcc	%i4,	0x16BC,	%i0
	stx	%o0,	[%l7 + 0x10]
	call	loop_1473
	sir	0x0A14
	movl	%xcc,	%o1,	%l3
	udivx	%g7,	0x1A00,	%l1
loop_1473:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i5,	0x0D,	%g5
	bneg,a	loop_1474
	movrgz	%i2,	%o3,	%g1
	fmovsvc	%xcc,	%f17,	%f5
	fmovda	%icc,	%f22,	%f6
loop_1474:
	tvc	%icc,	0x4
	sir	0x1988
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	tgu	%icc,	0x0
	fnor	%f28,	%f8,	%f10
	edge16ln	%l5,	%o5,	%o7
	movre	%o2,	0x3DD,	%l4
	bge,a	%icc,	loop_1475
	fmovsgu	%icc,	%f29,	%f8
	edge16l	%g6,	%o4,	%i7
	siam	0x3
loop_1475:
	orncc	%i6,	0x0599,	%i3
	orcc	%l0,	%g3,	%o6
	edge16	%g2,	%g4,	%l6
	tg	%xcc,	0x4
	tge	%icc,	0x7
	addccc	%l2,	%i1,	%i4
	umul	%i0,	%o0,	%l3
	fmovdge	%xcc,	%f17,	%f18
	set	0x44, %o5
	sta	%f22,	[%l7 + %o5] 0x80
	move	%xcc,	%g7,	%l1
	edge8ln	%o1,	%i5,	%g5
	fble,a	%fcc0,	loop_1476
	xor	%o3,	%g1,	%i2
	ldstub	[%l7 + 0x35],	%l5
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%o4
loop_1476:
	tgu	%icc,	0x3
	st	%f12,	[%l7 + 0x50]
	wr	%g0,	0x18,	%asi
	stba	%o7,	[%l7 + 0x13] %asi
	sll	%o2,	0x18,	%l4
	edge8ln	%g6,	%o4,	%i7
	prefetch	[%l7 + 0x10],	 0x0
	movg	%xcc,	%i3,	%i6
	fmovdcc	%icc,	%f3,	%f24
	smul	%g3,	%o6,	%g2
	sdivcc	%g4,	0x0A0A,	%l6
	smul	%l2,	%i1,	%l0
	fbe	%fcc0,	loop_1477
	fbule	%fcc2,	loop_1478
	fmuld8ulx16	%f14,	%f15,	%f0
	movrgz	%i4,	%o0,	%i0
loop_1477:
	orn	%g7,	0x16C0,	%l3
loop_1478:
	fbul	%fcc1,	loop_1479
	fandnot1	%f12,	%f2,	%f14
	movrlez	%o1,	%i5,	%g5
	umulcc	%l1,	%o3,	%g1
loop_1479:
	fmovsgu	%xcc,	%f8,	%f29
	stbar
	sllx	%i2,	0x07,	%l5
	tg	%icc,	0x7
	subcc	%o7,	%o2,	%l4
	bleu	loop_1480
	movn	%icc,	%g6,	%o5
	fornot1	%f16,	%f26,	%f10
	bpos,a,pt	%icc,	loop_1481
loop_1480:
	fbl	%fcc1,	loop_1482
	and	%i7,	%o4,	%i6
	fxor	%f12,	%f10,	%f12
loop_1481:
	fxnor	%f4,	%f14,	%f8
loop_1482:
	addccc	%g3,	0x0256,	%i3
	srlx	%o6,	%g2,	%g4
	brgz	%l2,	loop_1483
	smulcc	%l6,	%l0,	%i1
	edge16n	%o0,	%i0,	%i4
	subccc	%g7,	%l3,	%o1
loop_1483:
	fmovdvs	%xcc,	%f15,	%f26
	be	loop_1484
	popc	0x0148,	%g5
	bg,a,pt	%icc,	loop_1485
	move	%icc,	%l1,	%i5
loop_1484:
	bleu	loop_1486
	edge16l	%o3,	%i2,	%g1
loop_1485:
	stw	%l5,	[%l7 + 0x44]
	tne	%icc,	0x1
loop_1486:
	array32	%o2,	%l4,	%g6
	fmovrdlez	%o5,	%f22,	%f12
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x6C] %asi,	%f13
	addccc	%o7,	%i7,	%o4
	movrgz	%i6,	0x295,	%g3
	tge	%xcc,	0x4
	tvc	%xcc,	0x7
	movrne	%i3,	%g2,	%o6
	bneg,a	loop_1487
	nop
	setx loop_1488, %l0, %l1
	jmpl %l1, %g4
	bleu,pt	%xcc,	loop_1489
	for	%f26,	%f22,	%f4
loop_1487:
	fcmpes	%fcc0,	%f5,	%f29
loop_1488:
	stw	%l2,	[%l7 + 0x60]
loop_1489:
	tleu	%xcc,	0x3
	fmovrsne	%l0,	%f0,	%f27
	fmovrdlz	%i1,	%f4,	%f14
	taddcctv	%l6,	0x0023,	%o0
	orncc	%i0,	%g7,	%l3
	srax	%i4,	0x15,	%g5
	edge8n	%l1,	%o1,	%i5
	set	0x7B, %o3
	lduba	[%l7 + %o3] 0x81,	%o3
	sub	%g1,	0x0CF3,	%i2
	movrne	%o2,	0x2EA,	%l4
	orn	%l5,	%g6,	%o7
	pdist	%f8,	%f28,	%f26
	movrgz	%o5,	%i7,	%i6
	addc	%o4,	%i3,	%g2
	umul	%o6,	%g4,	%g3
	fpadd16s	%f25,	%f8,	%f19
	and	%l2,	0x1FC5,	%i1
	addccc	%l0,	%o0,	%l6
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	fpsub32s	%f28,	%f15,	%f12
	edge8ln	%l3,	%i4,	%g5
	fpadd32s	%f25,	%f12,	%f11
	fmovrdne	%l1,	%f28,	%f26
	fxor	%f0,	%f10,	%f6
	addc	%g7,	0x08A5,	%o1
	edge8ln	%i5,	%g1,	%o3
	movle	%xcc,	%i2,	%o2
	sdivx	%l5,	0x1448,	%l4
	fpackfix	%f2,	%f10
	subccc	%o7,	%g6,	%i7
	sir	0x0441
	brlez	%i6,	loop_1490
	sdiv	%o4,	0x05AE,	%i3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g2,	%o6
loop_1490:
	movpos	%xcc,	%g4,	%o5
	fpadd16s	%f7,	%f5,	%f24
	edge8	%l2,	%i1,	%g3
	ta	%icc,	0x7
	movneg	%icc,	%o0,	%l0
	bg,pn	%xcc,	loop_1491
	edge8n	%i0,	%l3,	%i4
	addccc	%g5,	0x1E8D,	%l1
	sir	0x107B
loop_1491:
	edge16n	%g7,	%l6,	%i5
	movrlz	%o1,	0x018,	%o3
	udiv	%i2,	0x09DA,	%g1
	xor	%o2,	%l4,	%l5
	movn	%xcc,	%o7,	%g6
	sub	%i6,	%o4,	%i7
	fmovdvc	%xcc,	%f26,	%f20
	tleu	%xcc,	0x4
	tne	%xcc,	0x6
	udivx	%g2,	0x0574,	%o6
	umul	%g4,	%i3,	%l2
	movcs	%icc,	%o5,	%g3
	subcc	%i1,	0x1DFD,	%l0
	flush	%l7 + 0x30
	movne	%icc,	%o0,	%i0
	move	%icc,	%i4,	%g5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x68] %asi,	%f15
	fmovde	%xcc,	%f15,	%f9
	tg	%icc,	0x0
	sir	0x1554
	edge8n	%l1,	%g7,	%l6
	fmovsl	%xcc,	%f8,	%f14
	fnegs	%f14,	%f17
	edge16n	%l3,	%o1,	%i5
	fmovdle	%icc,	%f25,	%f18
	brlez	%i2,	loop_1492
	xorcc	%g1,	0x0586,	%o2
	fmovrdgez	%o3,	%f30,	%f4
	tneg	%icc,	0x6
loop_1492:
	umul	%l5,	%o7,	%g6
	nop
	setx	loop_1493,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tle	%icc,	0x3
	fxnors	%f27,	%f5,	%f6
	edge16l	%l4,	%i6,	%o4
loop_1493:
	fmul8x16au	%f5,	%f0,	%f22
	fbn	%fcc0,	loop_1494
	tvc	%icc,	0x0
	andcc	%g2,	0x0D23,	%i7
	movgu	%xcc,	%o6,	%g4
loop_1494:
	xnor	%l2,	%o5,	%g3
	edge32n	%i3,	%i1,	%o0
	udiv	%i0,	0x087B,	%l0
	ta	%xcc,	0x0
	nop
	setx	loop_1495,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%i4,	%l1,	%g7
	popc	%g5,	%l6
	fmovscs	%icc,	%f1,	%f17
loop_1495:
	fmovdneg	%xcc,	%f3,	%f30
	popc	0x0732,	%o1
	set	0x78, %i2
	stwa	%i5,	[%l7 + %i2] 0x23
	membar	#Sync
	brnz,a	%i2,	loop_1496
	ba,a	loop_1497
	fmovrdne	%l3,	%f4,	%f28
	tvc	%xcc,	0x1
loop_1496:
	fone	%f4
loop_1497:
	nop
	setx	loop_1498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%g1,	%o2,	%o3
	tne	%xcc,	0x1
	fmovsge	%xcc,	%f10,	%f20
loop_1498:
	movcs	%xcc,	%l5,	%g6
	edge8ln	%o7,	%i6,	%o4
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x30] %asi,	%l4
	fones	%f23
	bl,pt	%xcc,	loop_1499
	ta	%xcc,	0x5
	sdivcc	%i7,	0x133B,	%g2
	set	0x34, %i5
	ldswa	[%l7 + %i5] 0x11,	%o6
loop_1499:
	fornot2s	%f24,	%f13,	%f7
	fnors	%f20,	%f17,	%f4
	mulscc	%l2,	%g4,	%g3
	array16	%i3,	%o5,	%o0
	fmul8ulx16	%f12,	%f14,	%f20
	mova	%icc,	%i0,	%l0
	bshuffle	%f18,	%f18,	%f6
	fbl	%fcc3,	loop_1500
	movre	%i4,	0x06A,	%l1
	edge16ln	%i1,	%g5,	%g7
	ba,a,pt	%icc,	loop_1501
loop_1500:
	fbule	%fcc1,	loop_1502
	tsubcctv	%o1,	0x0E7B,	%i5
	bneg,a,pn	%icc,	loop_1503
loop_1501:
	subccc	%i2,	0x189B,	%l3
loop_1502:
	movne	%icc,	%l6,	%g1
	movg	%icc,	%o2,	%o3
loop_1503:
	srlx	%l5,	0x15,	%g6
	fnor	%f18,	%f18,	%f28
	array32	%o7,	%o4,	%l4
	edge8ln	%i6,	%g2,	%o6
	edge16l	%i7,	%g4,	%l2
	fcmpeq16	%f10,	%f6,	%i3
	udivx	%o5,	0x041E,	%o0
	fmovrsgez	%g3,	%f5,	%f0
	bneg,a,pn	%icc,	loop_1504
	fbg,a	%fcc3,	loop_1505
	tle	%xcc,	0x1
	mulx	%l0,	%i0,	%l1
loop_1504:
	subccc	%i1,	0x1FB5,	%i4
loop_1505:
	fmovd	%f8,	%f12
	xnorcc	%g7,	%g5,	%o1
	tn	%xcc,	0x7
	addccc	%i5,	0x1C70,	%l3
	brlez,a	%i2,	loop_1506
	and	%g1,	%o2,	%o3
	srl	%l5,	%l6,	%g6
	fmovscs	%icc,	%f1,	%f13
loop_1506:
	ta	%xcc,	0x7
	fcmpgt16	%f4,	%f2,	%o7
	edge32l	%o4,	%i6,	%g2
	fmul8x16au	%f13,	%f12,	%f16
	stx	%o6,	[%l7 + 0x10]
	umul	%i7,	0x0A83,	%l4
	fmovrdne	%l2,	%f24,	%f10
	set	0x5C, %o2
	lduwa	[%l7 + %o2] 0x18,	%g4
	move	%xcc,	%o5,	%i3
	tn	%icc,	0x0
	fpack32	%f30,	%f28,	%f0
	fbl	%fcc3,	loop_1507
	tgu	%xcc,	0x7
	ta	%icc,	0x4
	fornot1	%f8,	%f24,	%f30
loop_1507:
	fnor	%f28,	%f2,	%f6
	edge32l	%o0,	%g3,	%i0
	andn	%l1,	%i1,	%i4
	tgu	%xcc,	0x0
	addcc	%g7,	0x11C2,	%l0
	addccc	%o1,	%g5,	%i5
	srax	%l3,	0x17,	%g1
	movvc	%icc,	%i2,	%o3
	fbe	%fcc1,	loop_1508
	bpos,a,pn	%icc,	loop_1509
	edge16	%l5,	%o2,	%g6
	ldd	[%l7 + 0x58],	%i6
loop_1508:
	move	%icc,	%o7,	%i6
loop_1509:
	fzero	%f30
	edge8l	%o4,	%o6,	%g2
	fbne	%fcc3,	loop_1510
	fandnot1	%f22,	%f2,	%f14
	nop
	setx loop_1511, %l0, %l1
	jmpl %l1, %l4
	umul	%l2,	%g4,	%o5
loop_1510:
	sdiv	%i7,	0x103A,	%o0
	fmovdl	%xcc,	%f11,	%f21
loop_1511:
	subcc	%i3,	%g3,	%i0
	mulscc	%i1,	0x01B1,	%l1
	udivx	%i4,	0x0274,	%g7
	tge	%xcc,	0x3
	xnor	%o1,	0x14FE,	%l0
	movge	%xcc,	%g5,	%i5
	and	%g1,	0x11DB,	%i2
	stx	%l3,	[%l7 + 0x78]
	andncc	%o3,	%o2,	%g6
	movge	%xcc,	%l6,	%o7
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
	addc	%i6,	0x1AC9,	%o4
	fmovsl	%xcc,	%f19,	%f18
	sllx	%o6,	%l4,	%l2
	movleu	%icc,	%g2,	%o5
	ldx	[%l7 + 0x78],	%g4
	brz,a	%i7,	loop_1512
	movpos	%icc,	%o0,	%i3
	edge16l	%i0,	%g3,	%l1
	movn	%xcc,	%i4,	%g7
loop_1512:
	sdivx	%o1,	0x15C3,	%i1
	fnegd	%f12,	%f0
	addccc	%g5,	%l0,	%g1
	subcc	%i2,	%i5,	%o3
	tneg	%xcc,	0x2
	fbe	%fcc3,	loop_1513
	tne	%icc,	0x2
	bg,a	%icc,	loop_1514
	fmovdl	%xcc,	%f11,	%f26
loop_1513:
	fcmpne32	%f6,	%f18,	%o2
	edge32ln	%l3,	%g6,	%l6
loop_1514:
	siam	0x1
	xor	%o7,	%i6,	%o4
	mova	%icc,	%o6,	%l4
	smul	%l5,	0x1BAB,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x14, %i0
	sta	%f10,	[%l7 + %i0] 0x81
	popc	0x10A9,	%o5
	std	%f14,	[%l7 + 0x68]
	movneg	%icc,	%g4,	%g2
	add	%o0,	%i7,	%i3
	move	%xcc,	%i0,	%l1
	set	0x70, %g2
	lda	[%l7 + %g2] 0x10,	%f10
	srax	%i4,	%g7,	%o1
	fmovse	%icc,	%f21,	%f21
	st	%f14,	[%l7 + 0x20]
	movrne	%g3,	%g5,	%i1
	stw	%g1,	[%l7 + 0x14]
	fmovsneg	%xcc,	%f19,	%f28
	bleu	%xcc,	loop_1515
	udiv	%l0,	0x0DA1,	%i5
	tcs	%xcc,	0x2
	fbn,a	%fcc0,	loop_1516
loop_1515:
	fornot1	%f8,	%f24,	%f26
	tvs	%icc,	0x7
	mova	%icc,	%o3,	%i2
loop_1516:
	edge16n	%l3,	%o2,	%g6
	umulcc	%o7,	%l6,	%i6
	fbuge	%fcc1,	loop_1517
	fbl,a	%fcc0,	loop_1518
	fmovrdgez	%o6,	%f30,	%f2
	or	%o4,	%l4,	%l5
loop_1517:
	sdivcc	%o5,	0x155B,	%l2
loop_1518:
	movcc	%xcc,	%g2,	%g4
	udiv	%i7,	0x14F3,	%i3
	bvc,a	%xcc,	loop_1519
	movleu	%xcc,	%i0,	%o0
	fbne,a	%fcc0,	loop_1520
	fpadd16s	%f16,	%f17,	%f19
loop_1519:
	fbule	%fcc1,	loop_1521
	andn	%l1,	%g7,	%i4
loop_1520:
	mulx	%o1,	%g5,	%g3
	tneg	%icc,	0x6
loop_1521:
	movleu	%icc,	%i1,	%g1
	ld	[%l7 + 0x5C],	%f18
	tvs	%icc,	0x5
	array16	%l0,	%i5,	%o3
	call	loop_1522
	ldd	[%l7 + 0x28],	%i2
	fnot2	%f16,	%f8
	movneg	%xcc,	%o2,	%l3
loop_1522:
	tgu	%xcc,	0x3
	fnor	%f14,	%f2,	%f18
	add	%g6,	%l6,	%i6
	fbu,a	%fcc3,	loop_1523
	movrgz	%o6,	%o4,	%o7
	move	%icc,	%l5,	%o5
	add	%l4,	%l2,	%g4
loop_1523:
	nop
	set	0x49, %i1
	ldstuba	[%l7 + %i1] 0x11,	%g2
	fbu,a	%fcc2,	loop_1524
	fpsub32s	%f31,	%f15,	%f28
	movge	%xcc,	%i3,	%i7
	bne,a,pt	%icc,	loop_1525
loop_1524:
	or	%i0,	%l1,	%o0
	fornot2	%f24,	%f16,	%f16
	ldx	[%l7 + 0x30],	%g7
loop_1525:
	fmovdleu	%xcc,	%f31,	%f27
	lduh	[%l7 + 0x28],	%i4
	array8	%o1,	%g5,	%i1
	udiv	%g3,	0x1FB8,	%g1
	fmovrdgz	%i5,	%f10,	%f28
	fbul	%fcc3,	loop_1526
	fcmpeq32	%f18,	%f10,	%o3
	tn	%icc,	0x6
	fmovrsgz	%l0,	%f5,	%f19
loop_1526:
	xnorcc	%o2,	%l3,	%i2
	nop
	setx	loop_1527,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	membar	0x00
	fmovrdgz	%g6,	%f22,	%f24
	fmovrde	%l6,	%f0,	%f0
loop_1527:
	bneg,a,pt	%xcc,	loop_1528
	fpadd16	%f4,	%f26,	%f8
	tleu	%icc,	0x4
	fmovrdlez	%o6,	%f4,	%f24
loop_1528:
	mulx	%i6,	0x067E,	%o4
	sllx	%o7,	%l5,	%o5
	fcmps	%fcc2,	%f24,	%f11
	wr	%g0,	0x80,	%asi
	stba	%l2,	[%l7 + 0x5A] %asi
	fmovd	%f8,	%f6
	subccc	%g4,	%g2,	%l4
	call	loop_1529
	fmovrde	%i3,	%f22,	%f24
	fbul,a	%fcc0,	loop_1530
	fxnors	%f7,	%f13,	%f1
loop_1529:
	fmovdl	%xcc,	%f29,	%f4
	subccc	%i0,	%l1,	%o0
loop_1530:
	bg,a	loop_1531
	srax	%i7,	%i4,	%g7
	sllx	%g5,	0x0A,	%i1
	andncc	%g3,	%o1,	%g1
loop_1531:
	fbo	%fcc1,	loop_1532
	movneg	%xcc,	%i5,	%o3
	fmovscs	%icc,	%f18,	%f29
	bcc,a,pt	%icc,	loop_1533
loop_1532:
	bpos,pt	%icc,	loop_1534
	fmovsgu	%icc,	%f17,	%f6
	wr	%g0,	0x11,	%asi
	stha	%o2,	[%l7 + 0x18] %asi
loop_1533:
	call	loop_1535
loop_1534:
	tg	%xcc,	0x5
	stb	%l3,	[%l7 + 0x15]
	sdivcc	%l0,	0x130B,	%g6
loop_1535:
	addcc	%l6,	0x006C,	%i2
	nop
	setx	loop_1536,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%icc,	%o6,	%o4
	faligndata	%f18,	%f22,	%f4
	udivcc	%o7,	0x054E,	%l5
loop_1536:
	tne	%icc,	0x7
	subccc	%o5,	0x0ABE,	%i6
	swap	[%l7 + 0x48],	%l2
	fpadd16	%f10,	%f8,	%f30
	stb	%g4,	[%l7 + 0x5D]
	fmovsa	%xcc,	%f14,	%f3
	tpos	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%l4,	%f27,	%f14
	movleu	%icc,	%i3,	%g2
	alignaddr	%l1,	%o0,	%i7
	fmul8x16	%f19,	%f14,	%f0
	membar	0x51
	sdiv	%i0,	0x135A,	%i4
	udiv	%g7,	0x1A58,	%g5
	move	%icc,	%g3,	%i1
	add	%g1,	%i5,	%o3
	stw	%o1,	[%l7 + 0x14]
	fbuge,a	%fcc1,	loop_1537
	bleu,pn	%xcc,	loop_1538
	fbe,a	%fcc2,	loop_1539
	brgz	%l3,	loop_1540
loop_1537:
	subccc	%l0,	0x008C,	%o2
loop_1538:
	fnot2	%f8,	%f8
loop_1539:
	popc	%g6,	%l6
loop_1540:
	fones	%f16
	set	0x26, %l5
	stha	%i2,	[%l7 + %l5] 0x88
	wr	%g0,	0x22,	%asi
	stxa	%o4,	[%l7 + 0x18] %asi
	membar	#Sync
	fmovrde	%o6,	%f20,	%f28
	ldsh	[%l7 + 0x34],	%l5
	movge	%icc,	%o7,	%o5
	movneg	%icc,	%i6,	%l2
	nop
	setx	loop_1541,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%l4,	%g4,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,pn	%xcc,	loop_1542
loop_1541:
	fnors	%f27,	%f21,	%f6
	umul	%i3,	0x0AF1,	%o0
	ta	%xcc,	0x3
loop_1542:
	fsrc1s	%f2,	%f13
	fone	%f14
	ta	%xcc,	0x2
	movrlz	%i7,	%i0,	%l1
	array8	%g7,	%i4,	%g3
	fcmps	%fcc3,	%f28,	%f20
	edge8ln	%g5,	%i1,	%i5
	movvs	%xcc,	%g1,	%o3
	set	0x74, %o7
	stwa	%l3,	[%l7 + %o7] 0xea
	membar	#Sync
	movneg	%icc,	%o1,	%l0
	fcmple32	%f22,	%f14,	%o2
	wr	%g0,	0x89,	%asi
	stba	%g6,	[%l7 + 0x7A] %asi
	tneg	%icc,	0x3
	subcc	%i2,	%l6,	%o4
	set	0x10, %o1
	ldxa	[%g0 + %o1] 0x21,	%l5
	fmovdpos	%icc,	%f31,	%f28
	orncc	%o7,	0x0D27,	%o5
	tvs	%xcc,	0x7
	tge	%xcc,	0x3
	umul	%o6,	%l2,	%i6
	movgu	%xcc,	%g4,	%l4
	bcs,pt	%icc,	loop_1543
	edge16	%i3,	%g2,	%i7
	nop
	set	0x30, %g4
	ldsh	[%l7 + %g4],	%i0
	sllx	%l1,	0x0C,	%o0
loop_1543:
	fmovrdgez	%g7,	%f12,	%f2
	movvc	%xcc,	%g3,	%g5
	orncc	%i1,	0x0295,	%i4
	ldstub	[%l7 + 0x2E],	%i5
	mulscc	%o3,	0x1B5A,	%l3
	subccc	%o1,	%g1,	%o2
	taddcctv	%l0,	%g6,	%i2
	or	%l6,	%l5,	%o4
	edge32l	%o7,	%o6,	%l2
	tvc	%icc,	0x5
	xnor	%i6,	0x11DD,	%o5
	edge32	%g4,	%l4,	%i3
	edge32n	%i7,	%i0,	%l1
	sll	%o0,	0x0E,	%g2
	umulcc	%g3,	0x1725,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble	%fcc3,	loop_1544
	movneg	%xcc,	%g7,	%i1
	tcc	%xcc,	0x4
	edge32l	%i5,	%i4,	%o3
loop_1544:
	movrgz	%o1,	0x023,	%g1
	movrgez	%l3,	%o2,	%l0
	array16	%i2,	%g6,	%l6
	tsubcctv	%l5,	%o7,	%o4
	movre	%l2,	0x0B5,	%i6
	subc	%o6,	%g4,	%o5
	fzero	%f4
	swap	[%l7 + 0x44],	%i3
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x18
	orcc	%l4,	%i7,	%l1
	movleu	%icc,	%i0,	%g2
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x45] %asi,	%o0
	add	%g3,	%g7,	%i1
	set	0x08, %o0
	stda	%i4,	[%l7 + %o0] 0x88
	fpackfix	%f12,	%f3
	fzeros	%f8
	movgu	%xcc,	%g5,	%i4
	fbn	%fcc3,	loop_1545
	fmovse	%xcc,	%f26,	%f22
	fmul8ulx16	%f24,	%f22,	%f4
	movcs	%xcc,	%o1,	%g1
loop_1545:
	fzero	%f8
	std	%f14,	[%l7 + 0x60]
	fmovdcc	%icc,	%f21,	%f18
	tneg	%xcc,	0x7
	alignaddrl	%o3,	%o2,	%l3
	tge	%icc,	0x6
	sdiv	%i2,	0x1E86,	%g6
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x14] %asi,	%l6
	fmovrdne	%l5,	%f10,	%f22
	edge16	%l0,	%o7,	%l2
	fpadd32	%f8,	%f20,	%f24
	movge	%xcc,	%o4,	%i6
	addcc	%o6,	0x1B27,	%o5
	movpos	%xcc,	%i3,	%g4
	wr	%g0,	0x89,	%asi
	sta	%f2,	[%l7 + 0x3C] %asi
	fcmps	%fcc1,	%f13,	%f22
	tvs	%icc,	0x3
	movrlz	%l4,	%l1,	%i7
	tle	%xcc,	0x3
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x44] %asi,	%f4
	tvc	%icc,	0x4
	bge,pn	%icc,	loop_1546
	xnorcc	%g2,	0x017A,	%i0
	movvc	%icc,	%g3,	%g7
	edge32ln	%o0,	%i5,	%i1
loop_1546:
	tpos	%xcc,	0x4
	sdiv	%g5,	0x02E7,	%o1
	fmovrdgz	%g1,	%f24,	%f26
	movge	%xcc,	%i4,	%o2
	movvs	%icc,	%o3,	%l3
	edge32	%i2,	%l6,	%g6
	te	%icc,	0x1
	and	%l5,	%o7,	%l0
	udivx	%l2,	0x111D,	%i6
	tsubcctv	%o4,	%o5,	%i3
	bshuffle	%f22,	%f0,	%f20
	and	%g4,	%o6,	%l4
	fcmps	%fcc2,	%f17,	%f16
	sdiv	%i7,	0x1BB3,	%g2
	brz,a	%i0,	loop_1547
	std	%l0,	[%l7 + 0x18]
	alignaddr	%g7,	%g3,	%o0
	fornot2s	%f6,	%f4,	%f1
loop_1547:
	edge32	%i5,	%i1,	%o1
	xor	%g1,	%i4,	%g5
	alignaddr	%o3,	%o2,	%i2
	fbule,a	%fcc1,	loop_1548
	fmovsn	%xcc,	%f0,	%f23
	tsubcctv	%l6,	%g6,	%l3
	movne	%xcc,	%o7,	%l5
loop_1548:
	xorcc	%l2,	0x03C7,	%l0
	fcmps	%fcc2,	%f11,	%f15
	fmovsneg	%xcc,	%f20,	%f19
	movrgez	%i6,	0x151,	%o4
	addcc	%i3,	0x1B54,	%o5
	fmovsvs	%icc,	%f23,	%f11
	fmovrdlz	%g4,	%f22,	%f10
	brlez	%o6,	loop_1549
	sllx	%l4,	%i7,	%i0
	tcc	%xcc,	0x0
	fmovrdlz	%g2,	%f12,	%f28
loop_1549:
	fpack32	%f20,	%f0,	%f2
	sethi	0x0DAC,	%g7
	te	%xcc,	0x6
	fnand	%f30,	%f18,	%f26
	stx	%g3,	[%l7 + 0x68]
	pdist	%f30,	%f16,	%f22
	fandnot1	%f8,	%f26,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o0,	0x0445,	%l1
	tle	%xcc,	0x0
	fandnot1s	%f29,	%f18,	%f17
	fmovsgu	%icc,	%f6,	%f8
	edge32n	%i1,	%i5,	%g1
	edge32	%i4,	%o1,	%o3
	st	%f24,	[%l7 + 0x38]
	fmovsn	%icc,	%f7,	%f19
	fmovrdlez	%o2,	%f12,	%f6
	subccc	%i2,	0x1606,	%l6
	wr	%g0,	0x10,	%asi
	stwa	%g6,	[%l7 + 0x6C] %asi
	fmovrslez	%l3,	%f0,	%f8
	mulscc	%g5,	%l5,	%o7
	fbl,a	%fcc1,	loop_1550
	edge16ln	%l0,	%i6,	%l2
	ld	[%l7 + 0x5C],	%f29
	tvs	%icc,	0x6
loop_1550:
	smulcc	%o4,	0x0C0C,	%o5
	bn,a	loop_1551
	addcc	%i3,	0x08B0,	%g4
	tleu	%xcc,	0x3
	movvc	%xcc,	%o6,	%i7
loop_1551:
	membar	0x7C
	mova	%icc,	%i0,	%l4
	fmul8ulx16	%f30,	%f24,	%f10
	sll	%g2,	0x0F,	%g3
	fpackfix	%f6,	%f23
	bgu,pt	%icc,	loop_1552
	edge16ln	%g7,	%o0,	%i1
	fcmpne32	%f0,	%f12,	%i5
	array16	%g1,	%l1,	%o1
loop_1552:
	fpsub16	%f2,	%f14,	%f10
	fmul8x16au	%f29,	%f31,	%f10
	smul	%i4,	0x1DD2,	%o2
	fpadd32	%f8,	%f26,	%f16
	subc	%i2,	0x1CD8,	%l6
	xor	%g6,	%l3,	%g5
	smulcc	%o3,	0x1A60,	%o7
	fnands	%f12,	%f7,	%f17
	edge16l	%l5,	%i6,	%l2
	alignaddr	%o4,	%l0,	%o5
	edge32	%g4,	%o6,	%i7
	edge32l	%i3,	%l4,	%i0
	fble,a	%fcc2,	loop_1553
	udivx	%g3,	0x10FD,	%g2
	orcc	%g7,	0x124D,	%o0
	udiv	%i5,	0x0246,	%i1
loop_1553:
	movne	%icc,	%g1,	%o1
	smul	%i4,	%l1,	%i2
	subcc	%o2,	%g6,	%l3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2A] %asi,	%g5
	mulx	%l6,	0x13D2,	%o3
	taddcctv	%l5,	%o7,	%i6
	smul	%o4,	%l2,	%o5
	edge16ln	%l0,	%g4,	%i7
	fmovdle	%icc,	%f0,	%f28
	smulcc	%o6,	%l4,	%i0
	fornot2s	%f9,	%f26,	%f19
	movvc	%icc,	%g3,	%g2
	edge32l	%g7,	%o0,	%i3
	fblg,a	%fcc2,	loop_1554
	tsubcctv	%i5,	0x0546,	%i1
	fmovdcc	%icc,	%f12,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1554:
	nop
	set	0x38, %o6
	lda	[%l7 + %o6] 0x89,	%f4
	edge16ln	%o1,	%i4,	%g1
	bg,pt	%icc,	loop_1555
	fbe,a	%fcc1,	loop_1556
	sethi	0x1C7C,	%i2
	edge16	%o2,	%g6,	%l1
loop_1555:
	addc	%l3,	%g5,	%o3
loop_1556:
	xnor	%l5,	0x0DEB,	%o7
	fmovdleu	%icc,	%f6,	%f3
	fmovsvc	%icc,	%f28,	%f26
	umulcc	%l6,	%o4,	%i6
	fornot2	%f24,	%f16,	%f2
	movcs	%xcc,	%l2,	%o5
	xnorcc	%l0,	0x0D82,	%i7
	srlx	%g4,	%o6,	%i0
	tl	%xcc,	0x5
	fmul8x16	%f9,	%f22,	%f26
	fmovrdgz	%l4,	%f6,	%f10
	sub	%g3,	%g2,	%o0
	membar	0x5E
	movrlez	%i3,	0x141,	%g7
	fmovdl	%icc,	%f13,	%f14
	lduh	[%l7 + 0x6E],	%i5
	array8	%i1,	%i4,	%o1
	mulx	%g1,	0x0F92,	%i2
	movrlez	%g6,	0x12E,	%o2
	movpos	%icc,	%l3,	%g5
	umul	%l1,	%o3,	%l5
	stb	%o7,	[%l7 + 0x70]
	fsrc2	%f2,	%f6
	fbl	%fcc3,	loop_1557
	nop
	setx	loop_1558,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x70, %l4
	ldstub	[%l7 + %l4],	%o4
	tl	%xcc,	0x4
loop_1557:
	srlx	%l6,	0x08,	%l2
loop_1558:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f6,	%f12
	sdivcc	%o5,	0x03CE,	%l0
	ldsh	[%l7 + 0x32],	%i7
	fbug	%fcc0,	loop_1559
	movge	%icc,	%i6,	%o6
	taddcc	%g4,	0x051B,	%i0
	andcc	%l4,	%g3,	%o0
loop_1559:
	fmovdl	%icc,	%f11,	%f14
	umul	%g2,	%i3,	%i5
	movrgz	%g7,	%i4,	%o1
	edge32n	%i1,	%g1,	%i2
	orcc	%o2,	%g6,	%g5
	tvc	%xcc,	0x0
	movgu	%xcc,	%l3,	%o3
	fmovsneg	%icc,	%f2,	%f0
	sub	%l5,	0x0B37,	%o7
	sll	%o4,	%l1,	%l6
	swap	[%l7 + 0x18],	%l2
	fnot1	%f10,	%f10
	movrne	%l0,	0x1B6,	%i7
	fbo,a	%fcc0,	loop_1560
	movcc	%icc,	%o5,	%i6
	fmul8x16au	%f21,	%f7,	%f18
	edge16	%g4,	%i0,	%l4
loop_1560:
	movne	%xcc,	%o6,	%g3
	nop
	setx	loop_1561,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%icc,	%g2,	%o0
	fbu	%fcc1,	loop_1562
	sll	%i3,	0x07,	%g7
loop_1561:
	move	%icc,	%i5,	%o1
	brz	%i4,	loop_1563
loop_1562:
	fxor	%f4,	%f18,	%f14
	fornot1	%f30,	%f24,	%f22
	edge32n	%g1,	%i2,	%i1
loop_1563:
	sdiv	%o2,	0x10CA,	%g5
	set	0x78, %g7
	stxa	%l3,	[%l7 + %g7] 0x80
	bcc,a,pn	%icc,	loop_1564
	fmovdneg	%xcc,	%f30,	%f0
	fpadd32s	%f18,	%f29,	%f23
	fors	%f18,	%f6,	%f10
loop_1564:
	lduw	[%l7 + 0x7C],	%o3
	fmovrslez	%g6,	%f30,	%f31
	fone	%f22
	tsubcc	%l5,	%o7,	%l1
	tge	%icc,	0x3
	fmovspos	%xcc,	%f9,	%f3
	array8	%o4,	%l2,	%l6
	mova	%xcc,	%l0,	%i7
	fmovde	%icc,	%f25,	%f10
	movvc	%icc,	%o5,	%g4
	fxnor	%f18,	%f30,	%f14
	ldd	[%l7 + 0x30],	%i0
	set	0x0C, %i6
	lduha	[%l7 + %i6] 0x18,	%i6
	movpos	%icc,	%o6,	%l4
	wr	%g0,	0x11,	%asi
	sta	%f11,	[%l7 + 0x20] %asi
	fmul8sux16	%f28,	%f18,	%f18
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sllx	%g2,	%o0,	%i3
	tl	%xcc,	0x3
	fbug	%fcc2,	loop_1565
	movgu	%xcc,	%g3,	%i5
	fmovsl	%xcc,	%f21,	%f1
	lduw	[%l7 + 0x44],	%g7
loop_1565:
	ldub	[%l7 + 0x75],	%o1
	fblg,a	%fcc1,	loop_1566
	prefetch	[%l7 + 0x10],	 0x0
	bn,a	%xcc,	loop_1567
	movl	%xcc,	%i4,	%g1
loop_1566:
	mulscc	%i1,	0x1E35,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1567:
	srl	%o2,	%g5,	%o3
	fbl,a	%fcc1,	loop_1568
	add	%g6,	%l5,	%l3
	movge	%xcc,	%l1,	%o7
	membar	0x10
loop_1568:
	subcc	%o4,	0x1015,	%l6
	fmovsvc	%xcc,	%f22,	%f12
	movg	%icc,	%l2,	%i7
	taddcctv	%l0,	0x1807,	%g4
	subccc	%o5,	%i6,	%i0
	movn	%icc,	%o6,	%g2
	wr	%g0,	0x2b,	%asi
	stba	%o0,	[%l7 + 0x5B] %asi
	membar	#Sync
	fxnor	%f18,	%f26,	%f14
	tne	%xcc,	0x3
	tle	%icc,	0x2
	bpos,a	loop_1569
	fbul	%fcc0,	loop_1570
	nop
	setx	loop_1571,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%icc,	%l4,	%g3
loop_1569:
	fpack32	%f14,	%f0,	%f12
loop_1570:
	fbe	%fcc3,	loop_1572
loop_1571:
	nop
	setx	loop_1573,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	be,a	%icc,	loop_1574
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1572:
	bvs	%icc,	loop_1575
loop_1573:
	xorcc	%i5,	0x003A,	%g7
loop_1574:
	smul	%i3,	%i4,	%o1
	set	0x28, %i4
	stha	%i1,	[%l7 + %i4] 0xe3
	membar	#Sync
loop_1575:
	fmovsleu	%xcc,	%f26,	%f1
	fmovscs	%xcc,	%f22,	%f24
	lduw	[%l7 + 0x1C],	%g1
	fmovdvc	%xcc,	%f15,	%f26
	fpadd32	%f28,	%f10,	%f4
	tcc	%xcc,	0x5
	tsubcctv	%i2,	0x1357,	%g5
	srax	%o3,	%g6,	%o2
	addc	%l5,	0x1E6C,	%l3
	movle	%icc,	%l1,	%o7
	movpos	%xcc,	%o4,	%l2
	lduw	[%l7 + 0x30],	%i7
	xnorcc	%l6,	%l0,	%g4
	ldsw	[%l7 + 0x7C],	%o5
	andcc	%i6,	%o6,	%i0
	ldsw	[%l7 + 0x44],	%o0
	fmovsgu	%icc,	%f22,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g2,	%g3,	%l4
	set	0x1E, %l2
	stha	%g7,	[%l7 + %l2] 0x14
	tneg	%icc,	0x2
	nop
	setx loop_1576, %l0, %l1
	jmpl %l1, %i3
	sdivx	%i5,	0x1F81,	%o1
	move	%xcc,	%i4,	%g1
	bne	%xcc,	loop_1577
loop_1576:
	fxnor	%f4,	%f14,	%f22
	mova	%icc,	%i2,	%i1
	tleu	%icc,	0x1
loop_1577:
	movgu	%icc,	%g5,	%o3
	udivx	%o2,	0x0D1A,	%l5
	edge8l	%g6,	%l3,	%o7
	addcc	%l1,	0x0E85,	%o4
	ldx	[%l7 + 0x40],	%i7
	membar	0x54
	tle	%icc,	0x7
	edge32	%l2,	%l0,	%l6
	udivcc	%g4,	0x143E,	%o5
	fmovdcs	%icc,	%f17,	%f9
	nop
	set	0x0C, %l0
	sth	%o6,	[%l7 + %l0]
	std	%f12,	[%l7 + 0x40]
	std	%i6,	[%l7 + 0x78]
	taddcc	%i0,	%g2,	%o0
	movrlez	%l4,	0x252,	%g7
	flush	%l7 + 0x14
	tneg	%icc,	0x5
	sdiv	%i3,	0x16E7,	%g3
	ldstub	[%l7 + 0x7C],	%o1
	fblg	%fcc2,	loop_1578
	edge32l	%i5,	%i4,	%i2
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i1
loop_1578:
	edge32n	%g5,	%g1,	%o3
	udivx	%l5,	0x17E1,	%g6
	tne	%xcc,	0x2
	movneg	%xcc,	%o2,	%o7
	sra	%l3,	%o4,	%i7
	fmovspos	%xcc,	%f20,	%f5
	fpack32	%f30,	%f0,	%f0
	addcc	%l1,	0x1822,	%l0
	set	0x4A, %o4
	ldsha	[%l7 + %o4] 0x04,	%l6
	sllx	%g4,	0x08,	%l2
	movvs	%xcc,	%o6,	%o5
	fmovsneg	%xcc,	%f26,	%f2
	fblg	%fcc2,	loop_1579
	andn	%i6,	%g2,	%i0
	bge	loop_1580
	movrlez	%o0,	0x10E,	%l4
loop_1579:
	udivcc	%g7,	0x0081,	%i3
	nop
	setx	loop_1581,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1580:
	fbe	%fcc2,	loop_1582
	te	%xcc,	0x2
	fmovspos	%xcc,	%f22,	%f21
loop_1581:
	fmovsl	%xcc,	%f14,	%f30
loop_1582:
	tge	%xcc,	0x5
	fmovspos	%icc,	%f2,	%f22
	std	%g2,	[%l7 + 0x68]
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	xor	%i4,	%i2,	%i1
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i5
	fpack32	%f8,	%f4,	%f14
	movrgz	%g5,	%o3,	%g1
	subccc	%g6,	0x0D09,	%l5
	andn	%o7,	%o2,	%l3
	brnz	%o4,	loop_1583
	sdivx	%i7,	0x02B9,	%l0
	set	0x0C, %l6
	sta	%f10,	[%l7 + %l6] 0x10
loop_1583:
	tleu	%icc,	0x1
	fands	%f5,	%f8,	%f7
	movcs	%icc,	%l1,	%g4
	movn	%xcc,	%l2,	%o6
	sub	%o5,	0x1D4F,	%i6
	brlez	%l6,	loop_1584
	movcs	%icc,	%i0,	%g2
	fnands	%f15,	%f11,	%f12
	fpsub16s	%f29,	%f11,	%f31
loop_1584:
	fbu	%fcc1,	loop_1585
	tleu	%xcc,	0x5
	movpos	%icc,	%o0,	%g7
	tl	%icc,	0x4
loop_1585:
	fmovsge	%xcc,	%f17,	%f10
	xorcc	%l4,	0x1CFC,	%i3
	subc	%g3,	%i4,	%o1
	xnor	%i1,	%i5,	%g5
	fmovscc	%xcc,	%f6,	%f7
	orn	%i2,	%g1,	%o3
	sdivx	%l5,	0x0C12,	%g6
	movleu	%xcc,	%o2,	%l3
	sdivx	%o7,	0x0558,	%i7
	srlx	%l0,	0x17,	%o4
	edge8l	%g4,	%l1,	%l2
	fnand	%f22,	%f16,	%f12
	fmul8x16	%f17,	%f16,	%f24
	movn	%icc,	%o6,	%o5
	mulx	%i6,	%i0,	%g2
	tne	%icc,	0x6
	srlx	%o0,	%g7,	%l6
	subccc	%l4,	0x0208,	%g3
	tge	%xcc,	0x6
	wr	%g0,	0x11,	%asi
	stha	%i4,	[%l7 + 0x60] %asi
	fzero	%f18
	mulx	%o1,	%i1,	%i3
	tn	%icc,	0x0
	edge16	%i5,	%i2,	%g5
	fnot2s	%f31,	%f27
	call	loop_1586
	edge32n	%o3,	%g1,	%l5
	nop
	setx	loop_1587,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmps	%fcc3,	%f10,	%f18
loop_1586:
	udivx	%g6,	0x0256,	%l3
	edge32ln	%o7,	%i7,	%o2
loop_1587:
	membar	0x36
	alignaddr	%o4,	%g4,	%l0
	set	0x6C, %i7
	ldsba	[%l7 + %i7] 0x15,	%l1
	alignaddrl	%l2,	%o6,	%i6
	edge16	%o5,	%g2,	%i0
	edge32l	%g7,	%o0,	%l6
	sra	%l4,	0x1B,	%i4
	fmovsl	%xcc,	%f19,	%f14
	movgu	%xcc,	%o1,	%i1
	or	%g3,	%i3,	%i5
	brz	%g5,	loop_1588
	fbue	%fcc0,	loop_1589
	srl	%i2,	0x00,	%g1
	srlx	%l5,	%o3,	%l3
loop_1588:
	fxor	%f6,	%f22,	%f24
loop_1589:
	nop
	set	0x30, %g6
	prefetcha	[%l7 + %g6] 0x14,	 0x1
	std	%i6,	[%l7 + 0x10]
	srlx	%o2,	0x1C,	%o4
	orcc	%o7,	0x1FAD,	%l0
	sth	%l1,	[%l7 + 0x20]
	bvc,a	loop_1590
	nop
	setx loop_1591, %l0, %l1
	jmpl %l1, %l2
	ta	%icc,	0x4
	fmovsneg	%xcc,	%f16,	%f21
loop_1590:
	fone	%f4
loop_1591:
	fxnor	%f14,	%f24,	%f4
	ldd	[%l7 + 0x60],	%f28
	ta	%icc,	0x6
	ldd	[%l7 + 0x40],	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x1C, %l3
	sta	%f6,	[%l7 + %l3] 0x11
	mulscc	%g4,	%o6,	%o5
	mulscc	%g2,	0x0365,	%i6
	sra	%i0,	0x13,	%o0
	fmovdg	%icc,	%f31,	%f11
	fones	%f22
	sllx	%g7,	%l6,	%l4
	faligndata	%f22,	%f20,	%f4
	set	0x0C, %g3
	stwa	%i4,	[%l7 + %g3] 0x22
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc1,	loop_1592
	fzeros	%f2
	srax	%o1,	%g3,	%i1
	array32	%i5,	%g5,	%i2
loop_1592:
	fsrc2	%f4,	%f6
	edge8n	%i3,	%l5,	%o3
	tge	%xcc,	0x2
	brz,a	%l3,	loop_1593
	fabsd	%f6,	%f4
	fpack32	%f12,	%f6,	%f20
	array16	%g6,	%i7,	%g1
loop_1593:
	fones	%f13
	ldsb	[%l7 + 0x08],	%o2
	fba,a	%fcc0,	loop_1594
	udiv	%o4,	0x16F5,	%l0
	movrgez	%o7,	%l1,	%g4
	stbar
loop_1594:
	movre	%l2,	%o6,	%g2
	andn	%o5,	%i0,	%i6
	fmovrdlz	%o0,	%f16,	%f24
	sll	%g7,	%l6,	%i4
	be,a,pt	%xcc,	loop_1595
	edge32ln	%o1,	%l4,	%i1
	umul	%i5,	%g3,	%i2
	set	0x2A, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i3
loop_1595:
	smulcc	%l5,	0x1294,	%o3
	sethi	0x1D9B,	%l3
	edge16n	%g5,	%g6,	%i7
	stw	%g1,	[%l7 + 0x10]
	srax	%o4,	0x05,	%o2
	srl	%l0,	%l1,	%o7
	andn	%g4,	0x1AF6,	%o6
	tgu	%xcc,	0x5
	movre	%l2,	%g2,	%o5
	andcc	%i0,	0x172D,	%o0
	wr	%g0,	0x81,	%asi
	stxa	%g7,	[%l7 + 0x48] %asi
	fandnot2	%f24,	%f4,	%f8
	fba	%fcc1,	loop_1596
	for	%f0,	%f28,	%f30
	be,a,pt	%xcc,	loop_1597
	bcs,a	loop_1598
loop_1596:
	membar	0x21
	edge32n	%l6,	%i4,	%o1
loop_1597:
	ldstub	[%l7 + 0x59],	%i6
loop_1598:
	fnot2s	%f31,	%f16
	edge32	%i1,	%l4,	%g3
	fmovrdlz	%i2,	%f22,	%f22
	array16	%i3,	%i5,	%o3
	movcc	%icc,	%l5,	%l3
	movn	%icc,	%g6,	%i7
	fcmpgt32	%f4,	%f16,	%g5
	edge32	%o4,	%g1,	%l0
	movcs	%xcc,	%o2,	%o7
	fmovde	%icc,	%f9,	%f18
	call	loop_1599
	tg	%icc,	0x1
	movrlz	%l1,	0x15C,	%g4
	orncc	%l2,	0x1EA7,	%g2
loop_1599:
	edge32l	%o5,	%i0,	%o6
	membar	0x38
	smul	%o0,	%g7,	%i4
	edge32l	%o1,	%l6,	%i6
	fsrc1	%f24,	%f2
	tl	%xcc,	0x1
	fmovrdlez	%l4,	%f4,	%f0
	movg	%xcc,	%i1,	%i2
	wr	%g0,	0x19,	%asi
	stha	%g3,	[%l7 + 0x6C] %asi
	fbul,a	%fcc0,	loop_1600
	taddcc	%i5,	%o3,	%l5
	movrne	%i3,	%l3,	%g6
	taddcctv	%i7,	%g5,	%g1
loop_1600:
	fbl,a	%fcc3,	loop_1601
	edge8ln	%l0,	%o4,	%o2
	movl	%xcc,	%o7,	%l1
	movcs	%icc,	%l2,	%g2
loop_1601:
	flush	%l7 + 0x20
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x58] %asi,	%o5
	tn	%xcc,	0x6
	movcc	%xcc,	%g4,	%o6
	movre	%o0,	%i0,	%g7
	tvs	%icc,	0x1
	edge32ln	%i4,	%o1,	%i6
	ta	%xcc,	0x4
	edge8n	%l4,	%l6,	%i1
	movneg	%xcc,	%g3,	%i2
	fba	%fcc3,	loop_1602
	fblg	%fcc1,	loop_1603
	fcmpeq16	%f22,	%f0,	%i5
	movpos	%xcc,	%o3,	%l5
loop_1602:
	nop
	set	0x5C, %o5
	lduha	[%l7 + %o5] 0x88,	%i3
loop_1603:
	tvs	%xcc,	0x4
	subcc	%g6,	0x0DA5,	%l3
	stb	%g5,	[%l7 + 0x41]
	tsubcc	%i7,	%g1,	%o4
	fba,a	%fcc1,	loop_1604
	fcmpeq16	%f24,	%f16,	%l0
	fmovdvs	%xcc,	%f0,	%f28
	fmovsneg	%icc,	%f13,	%f12
loop_1604:
	addc	%o2,	%l1,	%o7
	bleu,a	loop_1605
	subcc	%l2,	0x015A,	%g2
	andcc	%g4,	0x121D,	%o6
	popc	%o5,	%i0
loop_1605:
	fble	%fcc3,	loop_1606
	fpack32	%f14,	%f12,	%f22
	orcc	%o0,	%g7,	%o1
	array16	%i4,	%l4,	%i6
loop_1606:
	fbu	%fcc0,	loop_1607
	fbule,a	%fcc0,	loop_1608
	brgez,a	%i1,	loop_1609
	sir	0x03E2
loop_1607:
	addc	%g3,	%i2,	%i5
loop_1608:
	taddcc	%o3,	%l6,	%i3
loop_1609:
	fpsub16s	%f1,	%f24,	%f0
	te	%icc,	0x0
	edge8	%g6,	%l5,	%g5
	bcs,pn	%xcc,	loop_1610
	taddcc	%i7,	%l3,	%o4
	sdivx	%g1,	0x1BA3,	%o2
	tle	%xcc,	0x7
loop_1610:
	array8	%l1,	%o7,	%l0
	tvs	%icc,	0x3
	ba,a,pt	%xcc,	loop_1611
	subcc	%l2,	0x134E,	%g2
	andncc	%o6,	%o5,	%i0
	udiv	%o0,	0x12F7,	%g7
loop_1611:
	sdivcc	%g4,	0x10E3,	%i4
	movpos	%icc,	%l4,	%o1
	std	%i0,	[%l7 + 0x10]
	array32	%g3,	%i2,	%i6
	movle	%xcc,	%i5,	%o3
	smulcc	%i3,	0x1070,	%g6
	xnor	%l6,	0x0D0F,	%l5
	alignaddrl	%g5,	%i7,	%l3
	fors	%f9,	%f7,	%f25
	movrlz	%o4,	0x3A1,	%o2
	bvs,a,pt	%icc,	loop_1612
	edge32l	%l1,	%g1,	%o7
	movle	%xcc,	%l2,	%l0
	tneg	%icc,	0x1
loop_1612:
	mulx	%g2,	%o6,	%i0
	stw	%o5,	[%l7 + 0x28]
	movrgez	%g7,	%o0,	%g4
	fpsub16s	%f21,	%f16,	%f2
	fmovs	%f17,	%f18
	srax	%i4,	0x19,	%l4
	fmul8x16au	%f25,	%f23,	%f0
	edge32n	%o1,	%i1,	%g3
	movgu	%icc,	%i2,	%i5
	fnot2	%f0,	%f24
	subccc	%i6,	%i3,	%o3
	movrgz	%l6,	0x127,	%l5
	alignaddrl	%g5,	%i7,	%l3
	bge,pn	%xcc,	loop_1613
	fbne	%fcc3,	loop_1614
	subcc	%o4,	%g6,	%o2
	fxors	%f19,	%f14,	%f26
loop_1613:
	tle	%icc,	0x7
loop_1614:
	popc	%l1,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x1
	pdist	%f14,	%f12,	%f14
	ldd	[%l7 + 0x08],	%f18
	xorcc	%g1,	%l2,	%l0
	fbule	%fcc2,	loop_1615
	fmovdvs	%xcc,	%f12,	%f7
	movvc	%icc,	%g2,	%o6
	fmul8x16au	%f21,	%f28,	%f18
loop_1615:
	movne	%xcc,	%o5,	%i0
	fmovrsgez	%g7,	%f3,	%f18
	xor	%g4,	%i4,	%o0
	fmovdcs	%icc,	%f12,	%f27
	mulx	%o1,	0x0191,	%l4
	fpadd32s	%f3,	%f21,	%f16
	fnegs	%f4,	%f7
	bg	%xcc,	loop_1616
	orncc	%i1,	0x144C,	%g3
	tg	%icc,	0x7
	orcc	%i5,	%i6,	%i2
loop_1616:
	fmovrdne	%o3,	%f14,	%f0
	orn	%i3,	0x1C1E,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f22,	%f10,	%f26
	be,pt	%icc,	loop_1617
	ldd	[%l7 + 0x78],	%f12
	membar	0x5D
	stbar
loop_1617:
	edge32l	%l5,	%i7,	%g5
	xor	%o4,	0x1A22,	%g6
	addcc	%o2,	%l1,	%o7
	ldsh	[%l7 + 0x7C],	%l3
	fmovd	%f30,	%f4
	nop
	set	0x78, %g5
	ldx	[%l7 + %g5],	%g1
	stbar
	nop
	setx	loop_1618,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%l0,	%l2
	tsubcc	%g2,	0x06D9,	%o5
	movg	%icc,	%o6,	%i0
loop_1618:
	edge16n	%g7,	%i4,	%o0
	sub	%g4,	%l4,	%o1
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x18,	%i1
	movcc	%icc,	%g3,	%i5
	movge	%xcc,	%i2,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i3,	%o3,	%l6
	mulx	%i7,	0x0D0F,	%g5
	movle	%xcc,	%o4,	%g6
	set	0x68, %i3
	stwa	%o2,	[%l7 + %i3] 0xea
	membar	#Sync
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sll	%l5,	%l1,	%o7
	movgu	%xcc,	%l3,	%g1
	fmovdle	%icc,	%f21,	%f26
	fnor	%f24,	%f8,	%f20
	edge32ln	%l0,	%g2,	%l2
	ble	%xcc,	loop_1619
	tcs	%icc,	0x7
	subccc	%o6,	0x18DE,	%o5
	nop
	setx	loop_1620,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1619:
	movcc	%icc,	%g7,	%i0
	edge16l	%i4,	%o0,	%l4
	fors	%f19,	%f14,	%f22
loop_1620:
	movrlz	%o1,	%g4,	%g3
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x72] %asi,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i1,	0x1091,	%i6
	edge16n	%i2,	%o3,	%l6
	edge16l	%i3,	%i7,	%g5
	popc	%o4,	%o2
	subccc	%l5,	%g6,	%o7
	te	%xcc,	0x2
	fcmple32	%f10,	%f10,	%l1
	edge16	%l3,	%g1,	%g2
	edge32	%l0,	%o6,	%o5
	fzero	%f24
	subcc	%l2,	%g7,	%i0
	array32	%i4,	%l4,	%o1
	bcc,a,pt	%icc,	loop_1621
	sdivcc	%o0,	0x16D0,	%g3
	andn	%g4,	0x035E,	%i5
	xnorcc	%i6,	0x1078,	%i2
loop_1621:
	taddcctv	%o3,	%i1,	%i3
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	fbg,a	%fcc0,	loop_1622
	tge	%icc,	0x7
	edge16	%i7,	%g5,	%o4
	addcc	%o2,	0x0C18,	%l5
loop_1622:
	movrne	%g6,	%o7,	%l3
	fnot1s	%f2,	%f24
	udiv	%g1,	0x03C7,	%g2
	fmovdge	%xcc,	%f12,	%f9
	fpsub16s	%f6,	%f7,	%f30
	edge8	%l0,	%o6,	%l1
	fmovrslz	%o5,	%f3,	%f24
	fand	%f2,	%f24,	%f10
	movrgz	%g7,	0x3E9,	%l2
	movl	%icc,	%i0,	%l4
	ta	%icc,	0x3
	fexpand	%f3,	%f16
	bcs	%icc,	loop_1623
	edge32l	%o1,	%o0,	%g3
	bl,pt	%xcc,	loop_1624
	fmovscs	%icc,	%f24,	%f1
loop_1623:
	fbule,a	%fcc0,	loop_1625
	movpos	%icc,	%g4,	%i4
loop_1624:
	alignaddrl	%i5,	%i6,	%i2
	tcc	%icc,	0x3
loop_1625:
	xnor	%i1,	%o3,	%l6
	siam	0x4
	fblg,a	%fcc2,	loop_1626
	fmovda	%icc,	%f13,	%f16
	tcs	%xcc,	0x1
	udivcc	%i7,	0x0FE6,	%i3
loop_1626:
	popc	%o4,	%g5
	sub	%l5,	%g6,	%o2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l3
	stbar
	fmovsa	%xcc,	%f15,	%f26
	fmovsvs	%xcc,	%f19,	%f29
	or	%o7,	0x1572,	%g1
	addccc	%g2,	0x1B13,	%l0
	edge32ln	%o6,	%o5,	%g7
	smulcc	%l1,	%l2,	%l4
	alignaddr	%o1,	%i0,	%o0
	te	%icc,	0x5
	movpos	%icc,	%g3,	%i4
	edge32l	%g4,	%i5,	%i2
	edge8l	%i6,	%i1,	%l6
	xnorcc	%i7,	%o3,	%o4
	tpos	%icc,	0x7
	sdivcc	%g5,	0x05C3,	%i3
	brlez,a	%l5,	loop_1627
	swap	[%l7 + 0x30],	%o2
	edge32l	%l3,	%o7,	%g1
	pdist	%f6,	%f10,	%f2
loop_1627:
	sethi	0x0925,	%g2
	tle	%icc,	0x7
	umul	%g6,	%l0,	%o6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x89,	%g7,	%l1
	tvc	%icc,	0x7
	array8	%l2,	%l4,	%o1
	or	%o5,	%i0,	%o0
	set	0x25, %i5
	ldstuba	[%l7 + %i5] 0x0c,	%i4
	fcmped	%fcc3,	%f14,	%f12
	sethi	0x00D7,	%g4
	edge32	%i5,	%g3,	%i2
	lduw	[%l7 + 0x18],	%i1
	fmovrdne	%l6,	%f14,	%f8
	orn	%i7,	%i6,	%o4
	set	0x68, %i2
	sta	%f6,	[%l7 + %i2] 0x14
	addcc	%o3,	0x04EC,	%g5
	taddcctv	%i3,	0x0993,	%l5
	sub	%l3,	%o7,	%g1
	fandnot1s	%f6,	%f3,	%f13
	sub	%g2,	0x1B49,	%g6
	te	%xcc,	0x6
	orncc	%o2,	%l0,	%o6
	set	0x10, %i0
	ldxa	[%g0 + %i0] 0x21,	%l1
	ldsh	[%l7 + 0x66],	%l2
	and	%l4,	0x07F7,	%o1
	mova	%icc,	%g7,	%i0
	fbule,a	%fcc2,	loop_1628
	edge32n	%o5,	%i4,	%g4
	fmovdl	%icc,	%f0,	%f0
	movgu	%xcc,	%o0,	%i5
loop_1628:
	array8	%g3,	%i2,	%i1
	ta	%icc,	0x1
	srlx	%l6,	0x12,	%i7
	fbo,a	%fcc0,	loop_1629
	tsubcctv	%o4,	0x1957,	%o3
	movn	%icc,	%g5,	%i3
	tsubcctv	%l5,	0x03DC,	%i6
loop_1629:
	or	%l3,	%o7,	%g2
	fmovsne	%icc,	%f6,	%f7
	movvs	%icc,	%g1,	%g6
	andncc	%l0,	%o6,	%o2
	fandnot2s	%f27,	%f3,	%f1
	udivcc	%l1,	0x11BF,	%l2
	stbar
	ldsw	[%l7 + 0x34],	%l4
	edge16	%g7,	%o1,	%i0
	mulscc	%o5,	0x1DED,	%i4
	fnot1s	%f14,	%f8
	movre	%o0,	0x0DF,	%g4
	swap	[%l7 + 0x28],	%g3
	movcc	%xcc,	%i2,	%i1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l6,	%i5
	andcc	%i7,	0x1560,	%o4
	fmovrdlez	%g5,	%f6,	%f6
	fbge	%fcc3,	loop_1630
	ldsh	[%l7 + 0x0A],	%i3
	fmovdneg	%icc,	%f24,	%f31
	edge8l	%o3,	%i6,	%l5
loop_1630:
	edge32n	%o7,	%l3,	%g1
	edge8ln	%g6,	%g2,	%o6
	tvc	%xcc,	0x0
	fmovs	%f19,	%f26
	fbuge	%fcc3,	loop_1631
	fbg	%fcc2,	loop_1632
	pdist	%f30,	%f24,	%f2
	set	0x32, %g2
	lduba	[%l7 + %g2] 0x11,	%o2
loop_1631:
	udivx	%l1,	0x0711,	%l0
loop_1632:
	ldx	[%l7 + 0x08],	%l4
	popc	0x05FD,	%l2
	addc	%g7,	%o1,	%o5
	membar	0x0B
	tgu	%icc,	0x5
	or	%i4,	0x1D0C,	%o0
	stw	%g4,	[%l7 + 0x3C]
	sethi	0x052C,	%i0
	sethi	0x12E9,	%i2
	membar	0x74
	fcmple32	%f26,	%f10,	%g3
	edge32l	%l6,	%i1,	%i7
	edge32	%o4,	%i5,	%i3
	tvs	%xcc,	0x7
	srl	%o3,	%g5,	%l5
	bgu	loop_1633
	edge8	%i6,	%l3,	%o7
	fmovrdgez	%g6,	%f18,	%f6
	bcs	%icc,	loop_1634
loop_1633:
	fmovdl	%xcc,	%f27,	%f9
	lduw	[%l7 + 0x74],	%g1
	fnands	%f18,	%f9,	%f17
loop_1634:
	movrgz	%g2,	%o6,	%l1
	movcs	%xcc,	%o2,	%l0
	bneg,a	loop_1635
	smul	%l4,	0x0992,	%g7
	taddcctv	%o1,	%l2,	%o5
	xnorcc	%i4,	%g4,	%i0
loop_1635:
	bgu,a	loop_1636
	call	loop_1637
	edge32l	%o0,	%g3,	%i2
	udivx	%i1,	0x0666,	%l6
loop_1636:
	fmovdne	%xcc,	%f2,	%f16
loop_1637:
	stx	%i7,	[%l7 + 0x10]
	bn,a	%xcc,	loop_1638
	movn	%xcc,	%i5,	%i3
	sdivx	%o4,	0x0729,	%g5
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o3
loop_1638:
	addccc	%l5,	0x030D,	%i6
	movrne	%o7,	%l3,	%g6
	tvs	%xcc,	0x2
	stx	%g2,	[%l7 + 0x60]
	fmovrdgz	%o6,	%f10,	%f2
	or	%g1,	%l1,	%l0
	movpos	%xcc,	%o2,	%l4
	orncc	%o1,	%l2,	%g7
	stx	%i4,	[%l7 + 0x30]
	be	%xcc,	loop_1639
	movrne	%o5,	0x3B8,	%g4
	fmovd	%f20,	%f24
	fmovdneg	%icc,	%f14,	%f6
loop_1639:
	fmovdn	%icc,	%f10,	%f15
	orcc	%i0,	%g3,	%i2
	subccc	%o0,	0x1262,	%i1
	fcmped	%fcc0,	%f4,	%f18
	movrlz	%l6,	0x091,	%i5
	stw	%i7,	[%l7 + 0x3C]
	taddcctv	%i3,	%o4,	%o3
	movneg	%icc,	%g5,	%l5
	mulscc	%o7,	%l3,	%g6
	fmul8x16	%f22,	%f24,	%f22
	fpsub16s	%f5,	%f29,	%f21
	movge	%icc,	%g2,	%i6
	movn	%icc,	%g1,	%o6
	edge8n	%l0,	%l1,	%l4
	movre	%o2,	0x2C8,	%l2
	fmul8sux16	%f18,	%f24,	%f24
	fmovdle	%icc,	%f8,	%f9
	orn	%g7,	0x1FF3,	%o1
	tleu	%icc,	0x6
	fbul	%fcc0,	loop_1640
	alignaddrl	%i4,	%g4,	%i0
	fzeros	%f19
	sub	%o5,	%g3,	%o0
loop_1640:
	bpos,a,pn	%xcc,	loop_1641
	edge32n	%i1,	%l6,	%i2
	movleu	%xcc,	%i7,	%i5
	movrlez	%o4,	0x316,	%i3
loop_1641:
	fbe	%fcc0,	loop_1642
	lduw	[%l7 + 0x1C],	%o3
	ba,a,pt	%xcc,	loop_1643
	fzeros	%f1
loop_1642:
	brgez,a	%g5,	loop_1644
	fabss	%f15,	%f0
loop_1643:
	fbne,a	%fcc1,	loop_1645
	fmovdn	%icc,	%f18,	%f13
loop_1644:
	xorcc	%l5,	%l3,	%o7
	ta	%xcc,	0x6
loop_1645:
	edge8n	%g2,	%g6,	%i6
	fand	%f16,	%f2,	%f0
	xnor	%o6,	0x1211,	%l0
	fand	%f18,	%f8,	%f28
	fandnot2s	%f3,	%f11,	%f12
	andcc	%g1,	0x0BF8,	%l4
	fmovde	%xcc,	%f8,	%f9
	movg	%icc,	%l1,	%l2
	subcc	%g7,	0x10AF,	%o2
	sub	%i4,	0x0CC1,	%g4
	fabss	%f3,	%f0
	movgu	%icc,	%i0,	%o5
	bcs,a	%xcc,	loop_1646
	stw	%g3,	[%l7 + 0x74]
	brz	%o1,	loop_1647
	sub	%o0,	0x1DFB,	%l6
loop_1646:
	tcs	%xcc,	0x0
	fmovsvc	%xcc,	%f7,	%f11
loop_1647:
	orncc	%i1,	%i2,	%i7
	stx	%i5,	[%l7 + 0x48]
	mova	%icc,	%i3,	%o4
	brgez,a	%o3,	loop_1648
	te	%xcc,	0x6
	edge32l	%l5,	%g5,	%o7
	edge32n	%l3,	%g6,	%g2
loop_1648:
	tle	%xcc,	0x7
	tsubcctv	%i6,	0x0FB9,	%l0
	fpadd16	%f20,	%f20,	%f12
	fpsub16	%f6,	%f16,	%f10
	fblg,a	%fcc0,	loop_1649
	movpos	%xcc,	%o6,	%l4
	and	%g1,	%l2,	%g7
	ldsb	[%l7 + 0x67],	%o2
loop_1649:
	nop
	setx loop_1650, %l0, %l1
	jmpl %l1, %l1
	flush	%l7 + 0x7C
	movvc	%icc,	%g4,	%i0
	sdivcc	%i4,	0x047F,	%g3
loop_1650:
	fpadd32	%f26,	%f8,	%f6
	orn	%o5,	0x1EDE,	%o0
	edge16	%o1,	%l6,	%i1
	sll	%i2,	0x0B,	%i5
	tl	%xcc,	0x3
	fmul8x16au	%f23,	%f21,	%f12
	fmovdg	%xcc,	%f29,	%f22
	ta	%icc,	0x5
	st	%f6,	[%l7 + 0x78]
	udivcc	%i7,	0x0053,	%o4
	flush	%l7 + 0x40
	movcs	%xcc,	%i3,	%l5
	bneg,a,pt	%xcc,	loop_1651
	fandnot1	%f22,	%f20,	%f10
	srlx	%o3,	0x08,	%g5
	bcc	loop_1652
loop_1651:
	fabss	%f26,	%f29
	andncc	%l3,	%o7,	%g6
	wr	%g0,	0x2f,	%asi
	stba	%g2,	[%l7 + 0x47] %asi
	membar	#Sync
loop_1652:
	sra	%i6,	0x0C,	%l0
	te	%icc,	0x7
	fnegs	%f26,	%f17
	mulx	%l4,	%g1,	%o6
	fbn,a	%fcc3,	loop_1653
	tvs	%xcc,	0x4
	subccc	%l2,	%g7,	%o2
	movpos	%xcc,	%l1,	%g4
loop_1653:
	andn	%i4,	%i0,	%g3
	nop
	setx	loop_1654,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tne	%xcc,	0x6
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x14] %asi,	%o5
loop_1654:
	and	%o1,	%o0,	%l6
	movleu	%xcc,	%i1,	%i2
	set	0x50, %o2
	lduwa	[%l7 + %o2] 0x18,	%i5
	fandnot2s	%f25,	%f21,	%f0
	brnz	%o4,	loop_1655
	ldsw	[%l7 + 0x24],	%i3
	addccc	%l5,	0x1BA5,	%i7
	fmovs	%f8,	%f0
loop_1655:
	movg	%icc,	%o3,	%l3
	fpadd32	%f24,	%f28,	%f16
	addcc	%o7,	%g5,	%g6
	tcs	%xcc,	0x6
	fmovse	%icc,	%f31,	%f2
	fbge,a	%fcc0,	loop_1656
	array32	%i6,	%l0,	%g2
	sethi	0x1DFA,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1656:
	fmovsne	%icc,	%f28,	%f18
	fpmerge	%f4,	%f13,	%f4
	edge8n	%l4,	%l2,	%o6
	popc	0x0A18,	%o2
	tpos	%xcc,	0x7
	fmovrslez	%l1,	%f17,	%f11
	fbug	%fcc2,	loop_1657
	movne	%icc,	%g4,	%g7
	ldd	[%l7 + 0x48],	%f2
	or	%i0,	0x0DEB,	%g3
loop_1657:
	edge32ln	%o5,	%i4,	%o1
	lduw	[%l7 + 0x38],	%l6
	ldsw	[%l7 + 0x1C],	%i1
	subc	%i2,	%i5,	%o4
	bcc,a	%icc,	loop_1658
	fpadd16s	%f12,	%f21,	%f20
	bl,pt	%xcc,	loop_1659
	ldub	[%l7 + 0x5E],	%o0
loop_1658:
	array8	%i3,	%i7,	%l5
	movrlez	%l3,	0x0F6,	%o3
loop_1659:
	edge16n	%g5,	%o7,	%i6
	and	%g6,	%l0,	%g1
	tneg	%xcc,	0x7
	alignaddr	%g2,	%l2,	%l4
	movrlez	%o2,	0x2A8,	%o6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%g4
	edge16ln	%l1,	%g7,	%g3
	edge32	%o5,	%i0,	%i4
	movpos	%icc,	%l6,	%i1
	te	%icc,	0x5
	addcc	%i2,	0x064D,	%i5
	edge32ln	%o1,	%o0,	%o4
	fcmpeq32	%f0,	%f14,	%i7
	tcc	%xcc,	0x3
	array32	%i3,	%l3,	%l5
	edge16ln	%o3,	%g5,	%i6
	srl	%o7,	%l0,	%g6
	taddcc	%g1,	%l2,	%l4
	fbuge	%fcc2,	loop_1660
	ldsb	[%l7 + 0x1E],	%o2
	sdivcc	%g2,	0x0DE5,	%g4
	te	%icc,	0x7
loop_1660:
	sllx	%l1,	0x0D,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	brgez	%o6,	loop_1661
	movre	%o5,	0x12C,	%g3
	fbug,a	%fcc2,	loop_1662
	tn	%icc,	0x2
loop_1661:
	edge16n	%i4,	%i0,	%i1
	fmul8x16	%f21,	%f4,	%f8
loop_1662:
	fbug,a	%fcc3,	loop_1663
	bn,a,pn	%xcc,	loop_1664
	edge16n	%l6,	%i2,	%o1
	tn	%icc,	0x6
loop_1663:
	fmovsgu	%icc,	%f27,	%f25
loop_1664:
	movl	%icc,	%o0,	%o4
	smul	%i7,	0x11BF,	%i5
	fmul8x16au	%f19,	%f14,	%f6
	movpos	%icc,	%i3,	%l3
	mova	%xcc,	%l5,	%g5
	tge	%xcc,	0x0
	and	%i6,	0x10F3,	%o3
	taddcc	%o7,	%l0,	%g1
	andncc	%g6,	%l2,	%l4
	fmovdvs	%xcc,	%f9,	%f13
	fmovrsgz	%o2,	%f21,	%f19
	edge8n	%g2,	%l1,	%g4
	fmovd	%f6,	%f16
	add	%o6,	%o5,	%g7
	move	%xcc,	%i4,	%g3
	movg	%icc,	%i1,	%l6
	movrgez	%i2,	0x20F,	%i0
	fcmpd	%fcc3,	%f24,	%f2
	fbg,a	%fcc3,	loop_1665
	edge32n	%o0,	%o4,	%i7
	movge	%icc,	%i5,	%o1
	tvs	%icc,	0x0
loop_1665:
	membar	0x72
	brgz	%i3,	loop_1666
	brnz	%l3,	loop_1667
	fpadd32s	%f12,	%f12,	%f16
	sra	%g5,	%i6,	%o3
loop_1666:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1667:
	xnor	%o7,	%l0,	%l5
	fbne,a	%fcc1,	loop_1668
	movvs	%icc,	%g6,	%l2
	stb	%g1,	[%l7 + 0x4A]
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x60] %asi,	%o2
loop_1668:
	ldd	[%l7 + 0x78],	%f4
	smulcc	%g2,	0x1225,	%l4
	movvs	%xcc,	%g4,	%l1
	tsubcc	%o6,	%o5,	%i4
	edge32l	%g7,	%i1,	%g3
	fbl,a	%fcc1,	loop_1669
	or	%i2,	%l6,	%o0
	tgu	%icc,	0x0
	fandnot1s	%f29,	%f15,	%f28
loop_1669:
	edge8l	%o4,	%i7,	%i5
	ldsh	[%l7 + 0x64],	%o1
	tcc	%xcc,	0x2
	tge	%xcc,	0x7
	stb	%i3,	[%l7 + 0x17]
	taddcctv	%i0,	%g5,	%l3
	edge16ln	%i6,	%o7,	%o3
	fnot1s	%f22,	%f6
	edge32	%l0,	%l5,	%l2
	set	0x68, %l5
	stwa	%g1,	[%l7 + %l5] 0x2a
	membar	#Sync
	fnot2	%f20,	%f16
	subcc	%o2,	%g6,	%l4
	brnz	%g2,	loop_1670
	fbl,a	%fcc1,	loop_1671
	edge8n	%g4,	%o6,	%o5
	stb	%l1,	[%l7 + 0x19]
loop_1670:
	movgu	%icc,	%i4,	%g7
loop_1671:
	fmovrslez	%i1,	%f10,	%f17
	tcc	%icc,	0x1
	addc	%i2,	%l6,	%o0
	umulcc	%o4,	%g3,	%i7
	movrlz	%i5,	0x3FE,	%i3
	xnor	%o1,	0x018A,	%i0
	fandnot1s	%f0,	%f5,	%f22
	sir	0x1767
	tsubcc	%g5,	%l3,	%i6
	fornot2	%f20,	%f18,	%f8
	edge32l	%o7,	%l0,	%o3
	array16	%l5,	%g1,	%l2
	edge8ln	%o2,	%l4,	%g6
	addccc	%g4,	0x15B0,	%o6
	sir	0x1413
	edge16l	%g2,	%o5,	%i4
	fnot2	%f20,	%f30
	taddcc	%g7,	%i1,	%i2
	ta	%icc,	0x0
	fmovrdlez	%l1,	%f14,	%f8
	subcc	%l6,	%o4,	%o0
	bl,a	%icc,	loop_1672
	edge32l	%i7,	%i5,	%g3
	movvs	%xcc,	%o1,	%i0
	fand	%f26,	%f0,	%f26
loop_1672:
	sll	%g5,	%l3,	%i3
	movcc	%icc,	%o7,	%l0
	array32	%i6,	%l5,	%o3
	andn	%g1,	0x0A38,	%o2
	wr	%g0,	0x04,	%asi
	stba	%l2,	[%l7 + 0x6A] %asi
	set	0x50, %i1
	ldxa	[%l7 + %i1] 0x89,	%l4
	smulcc	%g4,	%g6,	%g2
	fxnors	%f16,	%f27,	%f4
	alignaddr	%o5,	%i4,	%g7
	movne	%xcc,	%o6,	%i2
	fnot2s	%f23,	%f31
	fpack16	%f18,	%f8
	fmovrdlez	%l1,	%f22,	%f20
	fbue,a	%fcc2,	loop_1673
	movne	%icc,	%l6,	%o4
	std	%f24,	[%l7 + 0x10]
	set	0x54, %o7
	lda	[%l7 + %o7] 0x19,	%f30
loop_1673:
	tpos	%xcc,	0x4
	tvs	%icc,	0x0
	bl	loop_1674
	bg,a	%xcc,	loop_1675
	te	%xcc,	0x0
	orcc	%i1,	0x0DF2,	%i7
loop_1674:
	fbg,a	%fcc0,	loop_1676
loop_1675:
	fbule,a	%fcc2,	loop_1677
	sllx	%i5,	%g3,	%o0
	array16	%o1,	%g5,	%l3
loop_1676:
	movvs	%icc,	%i3,	%i0
loop_1677:
	tle	%xcc,	0x3
	addc	%l0,	0x10BC,	%o7
	fbue	%fcc1,	loop_1678
	popc	0x1ECA,	%i6
	tsubcc	%l5,	0x00A8,	%g1
	ldstub	[%l7 + 0x3E],	%o2
loop_1678:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x14] %asi,	%l2
	tneg	%icc,	0x6
	be,a	%xcc,	loop_1679
	fmovdg	%xcc,	%f3,	%f14
	sdivcc	%l4,	0x1F4E,	%o3
	taddcc	%g4,	0x01DA,	%g2
loop_1679:
	move	%xcc,	%g6,	%i4
	smulcc	%o5,	%o6,	%i2
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x88
	movleu	%xcc,	%l1,	%g7
	edge8ln	%l6,	%i1,	%o4
	tvc	%icc,	0x6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x54] %asi,	%i7
	membar	0x2B
	std	%g2,	[%l7 + 0x28]
	brgz,a	%o0,	loop_1680
	fpmerge	%f14,	%f6,	%f28
	tcs	%xcc,	0x1
	brlz,a	%i5,	loop_1681
loop_1680:
	for	%f30,	%f12,	%f28
	xor	%o1,	%l3,	%i3
	fcmpne16	%f16,	%f28,	%g5
loop_1681:
	smul	%i0,	0x01B1,	%l0
	bleu,a,pt	%icc,	loop_1682
	sll	%i6,	%l5,	%o7
	movcs	%icc,	%o2,	%l2
	fmovrse	%g1,	%f5,	%f13
loop_1682:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%g4
	edge8	%g2,	%g6,	%l4
	bgu,a,pn	%icc,	loop_1683
	bg,pn	%icc,	loop_1684
	orcc	%i4,	%o6,	%o5
	fmovrsne	%l1,	%f2,	%f31
loop_1683:
	movgu	%xcc,	%i2,	%l6
loop_1684:
	movvs	%icc,	%g7,	%i1
	fmovsge	%icc,	%f19,	%f19
	be	%xcc,	loop_1685
	ble,a	%xcc,	loop_1686
	fmovdn	%icc,	%f25,	%f6
	fcmpne32	%f20,	%f2,	%i7
loop_1685:
	fmovrslz	%g3,	%f21,	%f3
loop_1686:
	movvc	%xcc,	%o4,	%i5
	fmovrdlez	%o1,	%f2,	%f16
	set	0x24, %l1
	lda	[%l7 + %l1] 0x0c,	%f22
	fpadd32s	%f25,	%f10,	%f11
	sdivcc	%l3,	0x03BA,	%o0
	brlez	%i3,	loop_1687
	movle	%xcc,	%i0,	%l0
	udiv	%i6,	0x049B,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1687:
	movvc	%icc,	%o7,	%g5
	tvs	%xcc,	0x6
	fbue	%fcc1,	loop_1688
	tne	%icc,	0x6
	movg	%xcc,	%o2,	%l2
	movg	%xcc,	%g1,	%o3
loop_1688:
	tvc	%icc,	0x1
	fmovde	%xcc,	%f22,	%f12
	tne	%icc,	0x1
	movn	%icc,	%g2,	%g4
	tneg	%icc,	0x5
	tvs	%xcc,	0x6
	edge32n	%l4,	%i4,	%g6
	array32	%o6,	%o5,	%i2
	andn	%l6,	%g7,	%i1
	umul	%l1,	%i7,	%g3
	fnors	%f16,	%f18,	%f6
	swap	[%l7 + 0x10],	%o4
	xor	%i5,	0x16EA,	%l3
	movleu	%icc,	%o1,	%o0
	fbe,a	%fcc0,	loop_1689
	bcc,a	loop_1690
	popc	0x0FFF,	%i3
	addc	%l0,	%i6,	%l5
loop_1689:
	prefetch	[%l7 + 0x10],	 0x1
loop_1690:
	bcc,pt	%icc,	loop_1691
	fmovdpos	%icc,	%f18,	%f23
	sir	0x095D
	lduh	[%l7 + 0x72],	%o7
loop_1691:
	tcs	%xcc,	0x1
	array8	%g5,	%o2,	%i0
	subcc	%g1,	%l2,	%o3
	fone	%f28
	fpmerge	%f0,	%f8,	%f6
	tsubcc	%g2,	0x10E7,	%g4
	fandnot2	%f8,	%f12,	%f30
	edge32l	%l4,	%i4,	%g6
	movrne	%o6,	%i2,	%l6
	smul	%o5,	0x1D55,	%i1
	fba,a	%fcc3,	loop_1692
	movle	%xcc,	%g7,	%i7
	andcc	%l1,	0x08B0,	%o4
	xnorcc	%i5,	%l3,	%o1
loop_1692:
	movrlez	%g3,	0x1DB,	%i3
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	te	%icc,	0x2
	tvs	%icc,	0x7
	fpsub16	%f14,	%f28,	%f16
	movcc	%xcc,	%l0,	%i6
	fcmpgt32	%f28,	%f6,	%l5
	xnor	%o7,	0x1CCF,	%o0
	tneg	%xcc,	0x6
	popc	%o2,	%g5
	ldsh	[%l7 + 0x5C],	%i0
	movleu	%icc,	%l2,	%o3
	fmovdcs	%xcc,	%f14,	%f11
	fbuge	%fcc1,	loop_1693
	edge16l	%g1,	%g4,	%l4
	sir	0x1355
	subc	%i4,	0x05E8,	%g2
loop_1693:
	fone	%f10
	sethi	0x009C,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g6,	%i2,	%l6
	set	0x30, %o1
	ldda	[%l7 + %o1] 0xe3,	%o4
	fble	%fcc3,	loop_1694
	fmovrde	%g7,	%f10,	%f20
	fbn	%fcc2,	loop_1695
	tvc	%icc,	0x1
loop_1694:
	nop
	set	0x18, %o0
	ldxa	[%g0 + %o0] 0x58,	%i7
loop_1695:
	fbule,a	%fcc3,	loop_1696
	taddcctv	%l1,	0x092A,	%i1
	tgu	%xcc,	0x0
	subc	%o4,	0x0B3A,	%l3
loop_1696:
	addccc	%i5,	0x1548,	%o1
	fpsub16	%f20,	%f6,	%f2
	tgu	%xcc,	0x5
	set	0x28, %o6
	ldswa	[%l7 + %o6] 0x14,	%i3
	edge8n	%g3,	%l0,	%i6
	edge8n	%l5,	%o7,	%o0
	xnor	%o2,	0x0EE7,	%i0
	fnands	%f18,	%f20,	%f13
	udivcc	%l2,	0x0A26,	%g5
	movpos	%xcc,	%o3,	%g4
	sdiv	%g1,	0x1392,	%l4
	mulscc	%g2,	%o6,	%g6
	nop
	setx	loop_1697,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%i4,	0x1A59,	%l6
	ldsb	[%l7 + 0x33],	%i2
	sra	%g7,	0x1C,	%o5
loop_1697:
	addc	%l1,	0x0A07,	%i1
	nop
	setx	loop_1698,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnor	%o4,	0x0CD0,	%l3
	movrlz	%i5,	%o1,	%i3
	fbul	%fcc1,	loop_1699
loop_1698:
	fandnot2s	%f27,	%f29,	%f11
	mulscc	%i7,	%g3,	%l0
	fandnot1	%f24,	%f16,	%f10
loop_1699:
	xnor	%l5,	%i6,	%o0
	sethi	0x1418,	%o2
	movpos	%icc,	%i0,	%l2
	fmul8x16al	%f12,	%f9,	%f12
	fbne,a	%fcc1,	loop_1700
	orcc	%g5,	0x1E79,	%o7
	ldsw	[%l7 + 0x4C],	%g4
	bcc	%icc,	loop_1701
loop_1700:
	tsubcctv	%g1,	0x186D,	%o3
	call	loop_1702
	addcc	%g2,	0x1481,	%o6
loop_1701:
	fpadd32	%f8,	%f18,	%f28
	movvc	%xcc,	%l4,	%g6
loop_1702:
	edge32n	%i4,	%l6,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o5,	0x024D,	%l1
	fnegs	%f27,	%f10
	membar	0x37
	movn	%xcc,	%i2,	%i1
	sll	%l3,	%o4,	%i5
	xnorcc	%i3,	0x12E1,	%o1
	fcmple16	%f20,	%f14,	%g3
	xnorcc	%l0,	%l5,	%i7
	nop
	setx loop_1703, %l0, %l1
	jmpl %l1, %o0
	edge32ln	%i6,	%o2,	%l2
	fands	%f28,	%f15,	%f29
	fcmple16	%f0,	%f20,	%i0
loop_1703:
	fbu,a	%fcc3,	loop_1704
	st	%f16,	[%l7 + 0x74]
	edge8ln	%o7,	%g5,	%g1
	xorcc	%o3,	0x106C,	%g2
loop_1704:
	movleu	%xcc,	%o6,	%l4
	fbuge	%fcc3,	loop_1705
	fmovsleu	%icc,	%f16,	%f10
	nop
	set	0x28, %l4
	prefetch	[%l7 + %l4],	 0x1
	subcc	%g4,	0x16BA,	%g6
loop_1705:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	call	loop_1706
	edge16	%l6,	%g7,	%o5
	edge32	%l1,	%i1,	%l3
	fandnot1s	%f18,	%f5,	%f15
loop_1706:
	ldub	[%l7 + 0x73],	%i2
	movvs	%icc,	%o4,	%i5
	be,a	%xcc,	loop_1707
	fmul8x16al	%f6,	%f30,	%f22
	xnorcc	%i3,	0x0D67,	%o1
	xnorcc	%l0,	%l5,	%i7
loop_1707:
	nop
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x39] %asi,	%o0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%i6
	xnorcc	%o2,	%l2,	%i0
	sir	0x1E91
	ta	%icc,	0x6
	umul	%g3,	0x1E90,	%g5
	edge8l	%o7,	%o3,	%g2
	mova	%icc,	%o6,	%l4
	edge8ln	%g1,	%g6,	%i4
	ta	%xcc,	0x7
	set	0x10, %g7
	sta	%f23,	[%l7 + %g7] 0x11
	andn	%l6,	%g7,	%g4
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o5
	bvc,a,pt	%xcc,	loop_1708
	movneg	%xcc,	%l1,	%l3
	movleu	%xcc,	%i2,	%o4
	taddcc	%i5,	%i3,	%i1
loop_1708:
	bpos,pt	%xcc,	loop_1709
	edge32	%o1,	%l5,	%l0
	movleu	%icc,	%i7,	%i6
	mova	%xcc,	%o0,	%o2
loop_1709:
	fpadd16s	%f15,	%f25,	%f30
	fsrc1s	%f14,	%f20
	array32	%l2,	%g3,	%i0
	edge8	%g5,	%o3,	%g2
	bvs	%xcc,	loop_1710
	edge32	%o7,	%o6,	%g1
	smulcc	%g6,	%i4,	%l4
	sdiv	%l6,	0x0E70,	%g7
loop_1710:
	edge16ln	%g4,	%o5,	%l3
	edge8l	%l1,	%i2,	%i5
	fsrc2s	%f4,	%f30
	edge16l	%o4,	%i1,	%o1
	edge16	%i3,	%l0,	%i7
	fmovrdlez	%i6,	%f18,	%f0
	set	0x7A, %i4
	lduha	[%l7 + %i4] 0x10,	%o0
	fmovdcs	%icc,	%f30,	%f14
	ldsh	[%l7 + 0x0C],	%o2
	alignaddr	%l5,	%g3,	%l2
	st	%f8,	[%l7 + 0x78]
	tpos	%icc,	0x0
	fblg,a	%fcc0,	loop_1711
	fmovsa	%icc,	%f23,	%f31
	sdivcc	%i0,	0x1836,	%o3
	edge8	%g5,	%o7,	%o6
loop_1711:
	fcmpes	%fcc2,	%f24,	%f17
	addccc	%g1,	%g6,	%g2
	fmovrse	%i4,	%f27,	%f25
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f0
	sir	0x1893
	ta	%icc,	0x0
	srax	%l4,	0x05,	%l6
	addcc	%g4,	0x16E2,	%o5
	sdiv	%g7,	0x08B3,	%l3
	brlez	%i2,	loop_1712
	be,pt	%xcc,	loop_1713
	ldd	[%l7 + 0x48],	%f24
	fmovsneg	%xcc,	%f2,	%f10
loop_1712:
	tcs	%icc,	0x1
loop_1713:
	fbule,a	%fcc0,	loop_1714
	fmovsgu	%xcc,	%f25,	%f14
	fnot1s	%f28,	%f6
	fmovd	%f8,	%f18
loop_1714:
	or	%l1,	%o4,	%i5
	set	0x36, %l0
	ldsba	[%l7 + %l0] 0x80,	%o1
	fpsub16s	%f23,	%f24,	%f14
	ld	[%l7 + 0x5C],	%f0
	brnz	%i1,	loop_1715
	nop
	set	0x18, %i6
	sth	%l0,	[%l7 + %i6]
	fsrc2s	%f25,	%f12
	fmovdneg	%xcc,	%f30,	%f26
loop_1715:
	fbuge,a	%fcc0,	loop_1716
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%i7,	loop_1717
	fmovsneg	%xcc,	%f0,	%f3
loop_1716:
	orn	%i3,	0x0683,	%o0
	tleu	%icc,	0x7
loop_1717:
	fmovdgu	%icc,	%f13,	%f7
	movn	%xcc,	%o2,	%i6
	xnor	%g3,	%l2,	%i0
	bvc	loop_1718
	edge32n	%o3,	%l5,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x48, %l6
	swapa	[%l7 + %l6] 0x10,	%o7
loop_1718:
	add	%g1,	%o6,	%g2
	movrgez	%g6,	%i4,	%l4
	movcc	%icc,	%l6,	%g4
	bge,pt	%xcc,	loop_1719
	fcmpgt16	%f30,	%f24,	%o5
	fsrc2	%f0,	%f8
	xnorcc	%g7,	0x1A7B,	%i2
loop_1719:
	sdivcc	%l1,	0x1A1B,	%o4
	ldx	[%l7 + 0x28],	%l3
	tn	%icc,	0x4
	ldsw	[%l7 + 0x48],	%o1
	fmovrsgez	%i5,	%f5,	%f21
	movvs	%xcc,	%l0,	%i1
	fpadd32s	%f17,	%f7,	%f4
	movle	%xcc,	%i3,	%i7
	ldsh	[%l7 + 0x3E],	%o2
	fcmpeq32	%f18,	%f26,	%o0
	orncc	%i6,	%g3,	%l2
	xorcc	%o3,	0x0D69,	%i0
	edge16	%g5,	%o7,	%g1
	stw	%o6,	[%l7 + 0x30]
	bg,a,pn	%xcc,	loop_1720
	fnot2s	%f25,	%f24
	movrgz	%l5,	0x197,	%g2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x14] %asi,	%f31
loop_1720:
	orn	%g6,	%i4,	%l6
	tge	%icc,	0x4
	movg	%icc,	%g4,	%l4
	nop
	set	0x62, %i7
	ldsh	[%l7 + %i7],	%g7
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0xf0
	membar	#Sync
	array8	%i2,	%l1,	%o4
	bcs	loop_1721
	movge	%xcc,	%o5,	%o1
	tn	%icc,	0x4
	fbo	%fcc0,	loop_1722
loop_1721:
	edge8ln	%l3,	%i5,	%i1
	addc	%l0,	0x10E1,	%i7
	fmovsg	%xcc,	%f22,	%f8
loop_1722:
	fbule,a	%fcc2,	loop_1723
	fble,a	%fcc3,	loop_1724
	fpadd16s	%f16,	%f31,	%f5
	fmovdvs	%icc,	%f7,	%f4
loop_1723:
	xnor	%i3,	%o2,	%i6
loop_1724:
	lduh	[%l7 + 0x56],	%g3
	fbg	%fcc2,	loop_1725
	brgz,a	%o0,	loop_1726
	tneg	%icc,	0x7
	and	%l2,	%i0,	%o3
loop_1725:
	fmovdne	%xcc,	%f22,	%f12
loop_1726:
	swap	[%l7 + 0x14],	%g5
	bneg,pn	%icc,	loop_1727
	orn	%g1,	%o6,	%l5
	xor	%g2,	%o7,	%i4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%l6,	%g6
loop_1727:
	edge32n	%l4,	%g4,	%i2
	fpack16	%f2,	%f22
	smul	%l1,	%g7,	%o4
	tpos	%icc,	0x2
	movrlz	%o1,	0x1B8,	%o5
	movrlez	%l3,	%i5,	%i1
	edge32n	%i7,	%l0,	%o2
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f0
	umulcc	%i6,	%g3,	%i3
	fmovdleu	%xcc,	%f31,	%f5
	sll	%l2,	%o0,	%i0
	sllx	%o3,	%g1,	%o6
	subc	%g5,	%l5,	%g2
	wr	%g0,	0x18,	%asi
	stha	%i4,	[%l7 + 0x58] %asi
	xnor	%o7,	%g6,	%l4
	fbu,a	%fcc0,	loop_1728
	orncc	%l6,	%i2,	%g4
	edge8	%l1,	%o4,	%g7
	edge8l	%o5,	%o1,	%l3
loop_1728:
	fbug,a	%fcc3,	loop_1729
	ldsw	[%l7 + 0x1C],	%i5
	sra	%i1,	0x1B,	%i7
	fabss	%f10,	%f31
loop_1729:
	fbug	%fcc1,	loop_1730
	movcc	%xcc,	%o2,	%l0
	mova	%icc,	%g3,	%i3
	ld	[%l7 + 0x78],	%f20
loop_1730:
	movrne	%l2,	%o0,	%i6
	bl,pn	%xcc,	loop_1731
	xorcc	%i0,	0x1773,	%g1
	tneg	%icc,	0x5
	array32	%o6,	%g5,	%l5
loop_1731:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g2,	%o3
	srax	%o7,	0x1C,	%i4
	ba	%xcc,	loop_1732
	and	%g6,	0x1ABF,	%l4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%l6
loop_1732:
	sllx	%l1,	%g4,	%o4
	tge	%icc,	0x2
	st	%f27,	[%l7 + 0x50]
	fmovdvc	%xcc,	%f5,	%f20
	fmovs	%f4,	%f5
	srax	%g7,	%o1,	%o5
	orcc	%i5,	%l3,	%i1
	ldd	[%l7 + 0x18],	%i6
	fmovd	%f24,	%f6
	movrlez	%l0,	0x1EA,	%o2
	ldstub	[%l7 + 0x51],	%i3
	ba,pt	%xcc,	loop_1733
	fpsub16	%f16,	%f18,	%f22
	xnor	%l2,	0x166F,	%o0
	fnegd	%f24,	%f0
loop_1733:
	umul	%i6,	0x0FDB,	%g3
	ta	%xcc,	0x1
	sth	%g1,	[%l7 + 0x10]
	edge32	%o6,	%i0,	%l5
	fpadd32s	%f16,	%f11,	%f0
	tne	%xcc,	0x0
	array8	%g2,	%o3,	%o7
	fbge,a	%fcc3,	loop_1734
	fmovdneg	%icc,	%f13,	%f27
	sllx	%g5,	%g6,	%l4
	call	loop_1735
loop_1734:
	movrne	%i4,	0x337,	%l6
	edge8ln	%i2,	%g4,	%l1
	set	0x54, %g3
	stba	%g7,	[%l7 + %g3] 0x2b
	membar	#Sync
loop_1735:
	add	%o1,	0x0B54,	%o5
	fnands	%f14,	%f22,	%f27
	nop
	set	0x2C, %g1
	ldsb	[%l7 + %g1],	%o4
	fcmpeq32	%f4,	%f18,	%l3
	umulcc	%i5,	%i7,	%i1
	taddcctv	%o2,	%l0,	%i3
	ta	%xcc,	0x2
	tge	%xcc,	0x0
	xorcc	%o0,	0x1882,	%i6
	edge8	%g3,	%g1,	%l2
	fmovdneg	%xcc,	%f6,	%f19
	brgez,a	%o6,	loop_1736
	sub	%l5,	0x12ED,	%i0
	fpsub16	%f30,	%f10,	%f0
	edge32ln	%o3,	%o7,	%g5
loop_1736:
	stx	%g6,	[%l7 + 0x58]
	sub	%g2,	0x0DCE,	%l4
	wr	%g0,	0x04,	%asi
	sta	%f23,	[%l7 + 0x48] %asi
	fmovdne	%xcc,	%f31,	%f1
	movrlz	%i4,	%l6,	%i2
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x1f,	%f0
	movcc	%xcc,	%g4,	%l1
	fmovscs	%xcc,	%f9,	%f1
	fandnot2	%f4,	%f14,	%f0
	set	0x40, %o5
	stxa	%g7,	[%l7 + %o5] 0xe2
	membar	#Sync
	tge	%xcc,	0x0
	wr	%g0,	0x23,	%asi
	stha	%o5,	[%l7 + 0x5E] %asi
	membar	#Sync
	fnot2s	%f6,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f20,	%f30,	%f16
	fba	%fcc1,	loop_1737
	tsubcc	%o4,	0x0C68,	%o1
	pdist	%f24,	%f2,	%f6
	set	0x16, %g5
	ldsha	[%l7 + %g5] 0x10,	%l3
loop_1737:
	alignaddr	%i7,	%i1,	%o2
	sllx	%l0,	%i5,	%o0
	fnot1	%f24,	%f14
	fnegs	%f30,	%f3
	sub	%i3,	0x06F8,	%g3
	fmovrdgz	%i6,	%f4,	%f6
	addccc	%l2,	%o6,	%g1
	fmovsa	%icc,	%f16,	%f19
	orncc	%i0,	%l5,	%o7
	andn	%g5,	%g6,	%o3
	set	0x60, %i3
	lduha	[%l7 + %i3] 0x80,	%l4
	edge32	%i4,	%g2,	%l6
	tl	%xcc,	0x6
	swap	[%l7 + 0x2C],	%i2
	alignaddr	%g4,	%g7,	%o5
	fmovscc	%icc,	%f1,	%f13
	edge8	%l1,	%o4,	%l3
	array8	%o1,	%i7,	%i1
	nop
	setx loop_1738, %l0, %l1
	jmpl %l1, %o2
	fba	%fcc2,	loop_1739
	movne	%icc,	%i5,	%o0
	array16	%l0,	%g3,	%i6
loop_1738:
	or	%i3,	0x1C04,	%l2
loop_1739:
	movpos	%xcc,	%g1,	%o6
	movleu	%icc,	%l5,	%i0
	edge32	%g5,	%g6,	%o7
	fornot2	%f16,	%f28,	%f24
	fabsd	%f6,	%f30
	orcc	%o3,	%l4,	%i4
	fble	%fcc0,	loop_1740
	fnot2	%f0,	%f2
	fandnot2s	%f12,	%f0,	%f20
	prefetch	[%l7 + 0x58],	 0x2
loop_1740:
	ba,a	loop_1741
	fcmpne16	%f4,	%f0,	%g2
	fmovsa	%icc,	%f19,	%f25
	sir	0x13AD
loop_1741:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x0
	tle	%xcc,	0x5
	movneg	%xcc,	%l6,	%g4
	movrne	%i2,	%g7,	%l1
	movrne	%o4,	0x0B7,	%l3
	fpadd16	%f12,	%f4,	%f16
	tsubcctv	%o1,	%o5,	%i1
	srax	%i7,	%i5,	%o2
	orn	%l0,	%g3,	%i6
	fbo	%fcc0,	loop_1742
	ta	%icc,	0x5
	move	%icc,	%o0,	%i3
	pdist	%f24,	%f18,	%f8
loop_1742:
	edge16l	%l2,	%g1,	%l5
	set	0x2C, %i5
	stwa	%o6,	[%l7 + %i5] 0x2f
	membar	#Sync
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g5,	%g6
	andn	%o7,	%i0,	%o3
	movg	%icc,	%i4,	%g2
	taddcc	%l4,	%l6,	%g4
	sll	%g7,	0x04,	%i2
	set	0x44, %o3
	stha	%o4,	[%l7 + %o3] 0x18
	tge	%icc,	0x0
	fmovdle	%icc,	%f14,	%f26
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%l1
	tleu	%icc,	0x2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x0C] %asi,	%f9
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%l3
	srax	%o5,	0x06,	%o1
	tn	%xcc,	0x1
	smulcc	%i7,	%i1,	%o2
	tne	%icc,	0x4
	brlez,a	%i5,	loop_1743
	swap	[%l7 + 0x20],	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f16,	%f26,	%f12
loop_1743:
	movne	%icc,	%i6,	%l0
	or	%o0,	%l2,	%g1
	popc	%i3,	%o6
	fmovs	%f7,	%f5
	edge16	%l5,	%g6,	%g5
	taddcctv	%o7,	%i0,	%i4
	set	0x6F, %i0
	ldstuba	[%l7 + %i0] 0x11,	%o3
	set	0x78, %i2
	stha	%l4,	[%l7 + %i2] 0x0c
	taddcctv	%l6,	%g4,	%g7
	andcc	%i2,	0x0937,	%o4
	tne	%icc,	0x3
	movrne	%l1,	%g2,	%l3
	array32	%o5,	%i7,	%i1
	movgu	%icc,	%o2,	%o1
	and	%i5,	%g3,	%i6
	movpos	%icc,	%o0,	%l0
	movle	%xcc,	%g1,	%i3
	and	%l2,	0x179B,	%l5
	movg	%icc,	%g6,	%o6
	set	0x24, %g2
	ldswa	[%l7 + %g2] 0x18,	%g5
	taddcctv	%i0,	%i4,	%o7
	edge16ln	%o3,	%l4,	%g4
	alignaddrl	%l6,	%g7,	%i2
	tvs	%icc,	0x0
	andcc	%l1,	%o4,	%l3
	bn,a	loop_1744
	edge32ln	%g2,	%o5,	%i7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%o2
loop_1744:
	popc	%i1,	%o1
	ldsw	[%l7 + 0x0C],	%i5
	edge16	%i6,	%o0,	%g3
	subcc	%l0,	%i3,	%l2
	movcs	%icc,	%g1,	%l5
	sethi	0x041F,	%g6
	xnor	%o6,	0x1F16,	%i0
	subccc	%g5,	0x120F,	%i4
	brgz,a	%o7,	loop_1745
	tcs	%icc,	0x4
	fbo	%fcc0,	loop_1746
	movre	%l4,	%g4,	%l6
loop_1745:
	fexpand	%f25,	%f0
	membar	0x6C
loop_1746:
	movneg	%xcc,	%o3,	%g7
	fpack16	%f8,	%f24
	wr	%g0,	0x80,	%asi
	sta	%f24,	[%l7 + 0x54] %asi
	movgu	%xcc,	%l1,	%o4
	bneg,a,pt	%icc,	loop_1747
	fxors	%f6,	%f16,	%f8
	sdivx	%i2,	0x0CD3,	%l3
	mulx	%g2,	0x1597,	%o5
loop_1747:
	ldub	[%l7 + 0x10],	%i7
	subcc	%o2,	%i1,	%o1
	fnot1	%f6,	%f8
	ld	[%l7 + 0x24],	%f4
	nop
	setx	loop_1748,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%i5,	0x1DF4,	%i6
	move	%xcc,	%g3,	%o0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
loop_1748:
	sra	%l2,	0x16,	%l0
	array8	%l5,	%g6,	%g1
	sethi	0x1047,	%i0
	tl	%icc,	0x3
	fmovsl	%icc,	%f3,	%f11
	fbug,a	%fcc3,	loop_1749
	edge16n	%o6,	%i4,	%o7
	addccc	%g5,	0x0891,	%l4
	tcc	%icc,	0x4
loop_1749:
	sir	0x1A0D
	or	%g4,	%l6,	%g7
	xnorcc	%o3,	%l1,	%o4
	tpos	%xcc,	0x0
	tsubcctv	%l3,	%i2,	%o5
	tsubcc	%g2,	0x0CF1,	%o2
	sth	%i1,	[%l7 + 0x42]
	fcmpes	%fcc0,	%f17,	%f19
	fandnot2	%f10,	%f20,	%f26
	sdiv	%o1,	0x1347,	%i7
	brgz	%i5,	loop_1750
	bleu	loop_1751
	popc	0x0255,	%g3
	fones	%f3
loop_1750:
	edge32	%i6,	%o0,	%i3
loop_1751:
	fbug,a	%fcc3,	loop_1752
	flush	%l7 + 0x28
	faligndata	%f12,	%f8,	%f30
	sir	0x1791
loop_1752:
	sdivcc	%l0,	0x1CC4,	%l2
	movgu	%xcc,	%g6,	%g1
	prefetch	[%l7 + 0x78],	 0x1
	move	%xcc,	%l5,	%i0
	fmovsle	%xcc,	%f23,	%f22
	movrgez	%i4,	0x375,	%o7
	movpos	%icc,	%g5,	%o6
	be	loop_1753
	ble,pn	%xcc,	loop_1754
	array8	%g4,	%l6,	%l4
	movg	%xcc,	%g7,	%o3
loop_1753:
	movl	%icc,	%o4,	%l3
loop_1754:
	subcc	%i2,	%o5,	%g2
	fxor	%f6,	%f0,	%f28
	alignaddr	%o2,	%i1,	%l1
	fbne	%fcc2,	loop_1755
	movvc	%icc,	%i7,	%o1
	tne	%icc,	0x5
	brgz	%g3,	loop_1756
loop_1755:
	fmovrdne	%i6,	%f18,	%f4
	fexpand	%f9,	%f12
	sll	%o0,	0x07,	%i5
loop_1756:
	fsrc2s	%f10,	%f28
	subc	%l0,	0x1B6E,	%i3
	fone	%f4
	ble,a	%icc,	loop_1757
	bvc,a,pn	%icc,	loop_1758
	fbue	%fcc1,	loop_1759
	xnorcc	%l2,	0x020D,	%g1
loop_1757:
	membar	0x67
loop_1758:
	st	%f5,	[%l7 + 0x30]
loop_1759:
	tvs	%xcc,	0x4
	smul	%g6,	%l5,	%i4
	tsubcctv	%i0,	0x0967,	%g5
	fxnor	%f8,	%f4,	%f4
	brnz	%o6,	loop_1760
	movvs	%icc,	%o7,	%g4
	stw	%l4,	[%l7 + 0x30]
	set	0x38, %l5
	lduwa	[%l7 + %l5] 0x89,	%l6
loop_1760:
	bneg,pt	%xcc,	loop_1761
	lduh	[%l7 + 0x38],	%g7
	movre	%o3,	0x0FB,	%o4
	tg	%xcc,	0x5
loop_1761:
	tsubcctv	%l3,	0x09DE,	%o5
	edge16	%i2,	%g2,	%o2
	tleu	%icc,	0x5
	movrgez	%i1,	0x2EA,	%i7
	sir	0x054D
	xnorcc	%l1,	0x033E,	%o1
	for	%f6,	%f0,	%f30
	set	0x74, %i1
	ldsba	[%l7 + %i1] 0x89,	%g3
	fnegs	%f21,	%f15
	fcmple16	%f20,	%f4,	%i6
	flush	%l7 + 0x4C
	subc	%i5,	%l0,	%i3
	brz,a	%o0,	loop_1762
	sllx	%l2,	0x0C,	%g6
	fmovscs	%xcc,	%f29,	%f9
	bge,pt	%xcc,	loop_1763
loop_1762:
	edge16l	%g1,	%i4,	%l5
	tgu	%xcc,	0x6
	udivx	%g5,	0x08CA,	%i0
loop_1763:
	fmovsle	%xcc,	%f24,	%f22
	orn	%o7,	%g4,	%l4
	taddcctv	%l6,	0x137C,	%o6
	stx	%o3,	[%l7 + 0x18]
	tne	%icc,	0x1
	ble,a	%icc,	loop_1764
	fcmpgt32	%f6,	%f4,	%o4
	umulcc	%g7,	%o5,	%l3
	nop
	set	0x08, %o7
	std	%f26,	[%l7 + %o7]
loop_1764:
	mulx	%g2,	%o2,	%i2
	fmovsl	%icc,	%f16,	%f18
	edge8	%i7,	%i1,	%l1
	tle	%xcc,	0x3
	fxors	%f7,	%f6,	%f6
	fmovdleu	%icc,	%f31,	%f22
	ldd	[%l7 + 0x70],	%f2
	fmovsvc	%icc,	%f20,	%f27
	fmovrsgez	%g3,	%f17,	%f22
	srax	%i6,	0x02,	%i5
	movg	%xcc,	%l0,	%i3
	wr	%g0,	0x23,	%asi
	stba	%o0,	[%l7 + 0x24] %asi
	membar	#Sync
	fcmped	%fcc3,	%f2,	%f8
	sll	%l2,	0x0B,	%o1
	sdivcc	%g1,	0x0B6B,	%g6
	fbl,a	%fcc2,	loop_1765
	subcc	%i4,	0x1858,	%g5
	umul	%l5,	0x1840,	%o7
	movle	%icc,	%i0,	%g4
loop_1765:
	tcs	%xcc,	0x5
	movrlz	%l4,	%o6,	%o3
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o4
	sethi	0x1D61,	%g7
	edge8l	%o5,	%l3,	%l6
	andncc	%g2,	%o2,	%i7
	addccc	%i2,	0x0967,	%l1
	movne	%icc,	%i1,	%i6
	xnor	%i5,	%l0,	%g3
	edge8n	%i3,	%l2,	%o1
	sethi	0x1265,	%o0
	movg	%xcc,	%g6,	%g1
	brlz,a	%g5,	loop_1766
	xnorcc	%i4,	0x1FB1,	%l5
	movg	%icc,	%o7,	%i0
	ldx	[%l7 + 0x58],	%l4
loop_1766:
	bge,a,pt	%icc,	loop_1767
	tge	%icc,	0x0
	fexpand	%f17,	%f2
	ba	loop_1768
loop_1767:
	fcmple32	%f28,	%f8,	%o6
	mulx	%g4,	0x0836,	%o4
	andcc	%o3,	0x0AAA,	%o5
loop_1768:
	fmovsneg	%xcc,	%f2,	%f3
	andncc	%l3,	%g7,	%g2
	fbo,a	%fcc1,	loop_1769
	fnot2s	%f21,	%f20
	ble,pn	%xcc,	loop_1770
	fcmpeq16	%f0,	%f26,	%l6
loop_1769:
	array8	%i7,	%o2,	%i2
	tvs	%xcc,	0x0
loop_1770:
	movcc	%icc,	%l1,	%i6
	prefetch	[%l7 + 0x48],	 0x1
	edge32l	%i1,	%i5,	%g3
	ta	%xcc,	0x2
	movrlz	%l0,	%l2,	%i3
	andn	%o1,	%o0,	%g6
	tn	%xcc,	0x4
	edge16l	%g1,	%i4,	%l5
	umul	%o7,	%g5,	%i0
	std	%o6,	[%l7 + 0x60]
	fmul8sux16	%f0,	%f30,	%f24
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x15] %asi,	%g4
	movrlz	%o4,	%l4,	%o3
	std	%f4,	[%l7 + 0x60]
	fbo	%fcc2,	loop_1771
	xnorcc	%o5,	0x0E70,	%g7
	fbule,a	%fcc3,	loop_1772
	brlz,a	%l3,	loop_1773
loop_1771:
	mulx	%l6,	0x09D2,	%i7
	set	0x52, %o2
	lduha	[%l7 + %o2] 0x15,	%o2
loop_1772:
	tcs	%xcc,	0x1
loop_1773:
	lduh	[%l7 + 0x0E],	%i2
	subcc	%l1,	0x1C81,	%i6
	tvs	%icc,	0x0
	taddcctv	%g2,	%i1,	%g3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x42] %asi,	%i5
	fcmpne16	%f18,	%f30,	%l0
	fmul8x16	%f17,	%f0,	%f6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x14] %asi,	%i3
	fmovsle	%xcc,	%f30,	%f28
	tvc	%icc,	0x6
	bn	%icc,	loop_1774
	fcmple16	%f26,	%f14,	%l2
	bpos	%xcc,	loop_1775
	fbe,a	%fcc1,	loop_1776
loop_1774:
	movrlez	%o1,	0x0A0,	%g6
	brgz	%o0,	loop_1777
loop_1775:
	fblg,a	%fcc3,	loop_1778
loop_1776:
	fmovrslz	%i4,	%f3,	%f18
	fors	%f23,	%f17,	%f1
loop_1777:
	lduh	[%l7 + 0x5E],	%l5
loop_1778:
	orncc	%g1,	%o7,	%g5
	taddcc	%o6,	0x146F,	%i0
	subcc	%o4,	0x11FC,	%g4
	tne	%icc,	0x4
	call	loop_1779
	fble,a	%fcc2,	loop_1780
	udivx	%l4,	0x0F0D,	%o3
	edge32ln	%o5,	%l3,	%l6
loop_1779:
	flush	%l7 + 0x0C
loop_1780:
	tcs	%icc,	0x3
	movge	%icc,	%g7,	%i7
	udiv	%o2,	0x1124,	%l1
	movrlz	%i2,	0x2CD,	%g2
	fbne	%fcc0,	loop_1781
	bl,a	loop_1782
	umulcc	%i1,	0x1353,	%i6
	fcmpne32	%f10,	%f22,	%i5
loop_1781:
	add	%l0,	0x06AB,	%i3
loop_1782:
	nop
	set	0x10, %g4
	ldsha	[%l7 + %g4] 0x04,	%g3
	movvs	%icc,	%l2,	%o1
	brnz	%g6,	loop_1783
	orcc	%i4,	%l5,	%o0
	subcc	%o7,	0x1628,	%g5
	bge,a,pn	%xcc,	loop_1784
loop_1783:
	bg,pn	%icc,	loop_1785
	fmovsvs	%xcc,	%f7,	%f12
	movn	%icc,	%o6,	%g1
loop_1784:
	nop
	wr	%g0,	0x89,	%asi
	stxa	%o4,	[%l7 + 0x28] %asi
loop_1785:
	sdivx	%i0,	0x0016,	%l4
	fbo,a	%fcc3,	loop_1786
	subc	%o3,	%g4,	%l3
	set	0x28, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0x0
loop_1786:
	movrgez	%o5,	0x3FD,	%i7
	edge8	%o2,	%g7,	%l1
	fcmpne32	%f20,	%f10,	%i2
	nop
	setx loop_1787, %l0, %l1
	jmpl %l1, %i1
	fnot1s	%f28,	%f13
	fpsub32s	%f27,	%f19,	%f7
	movrgz	%i6,	0x1FC,	%g2
loop_1787:
	nop
	setx	loop_1788,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movgu	%icc,	%i5,	%l0
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x3A] %asi,	%i3
loop_1788:
	flush	%l7 + 0x1C
	fmovdge	%icc,	%f11,	%f3
	xor	%l2,	%o1,	%g3
	fand	%f18,	%f24,	%f28
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	smulcc	%g6,	%l5,	%o0
	tsubcc	%i4,	%g5,	%o6
	fmuld8sux16	%f6,	%f11,	%f20
	array16	%o7,	%g1,	%o4
	addc	%i0,	%o3,	%l4
	tne	%icc,	0x7
	mulscc	%l3,	0x1F82,	%g4
	edge16n	%o5,	%i7,	%o2
	bgu	loop_1789
	subcc	%l6,	%l1,	%i2
	tcc	%icc,	0x6
	sdiv	%g7,	0x03B4,	%i6
loop_1789:
	umul	%i1,	0x1F6A,	%i5
	ldsw	[%l7 + 0x50],	%g2
	ta	%xcc,	0x0
	movg	%xcc,	%i3,	%l0
	tgu	%xcc,	0x1
	fcmpeq32	%f16,	%f30,	%o1
	addc	%l2,	0x14C8,	%g6
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x18] %asi,	%g3
	fxor	%f22,	%f14,	%f10
	fcmpne16	%f26,	%f20,	%o0
	prefetch	[%l7 + 0x58],	 0x3
	smul	%l5,	0x01C9,	%g5
	movle	%icc,	%i4,	%o7
	std	%f16,	[%l7 + 0x60]
	fnor	%f12,	%f30,	%f2
	ta	%icc,	0x2
	addccc	%o6,	%o4,	%i0
	fbg	%fcc2,	loop_1790
	add	%g1,	0x1AD8,	%o3
	set	0x78, %o1
	ldxa	[%l7 + %o1] 0x15,	%l4
loop_1790:
	tl	%icc,	0x6
	movg	%icc,	%l3,	%g4
	prefetch	[%l7 + 0x24],	 0x2
	fbu,a	%fcc0,	loop_1791
	ldsh	[%l7 + 0x40],	%i7
	sub	%o5,	%l6,	%o2
	xnorcc	%l1,	0x0137,	%i2
loop_1791:
	nop
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x80,	%f16
	movle	%xcc,	%g7,	%i1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x58] %asi,	%i6
	tge	%icc,	0x0
	edge16n	%i5,	%g2,	%l0
	edge16l	%o1,	%l2,	%g6
	edge32n	%i3,	%g3,	%l5
	umul	%o0,	%g5,	%i4
	wr	%g0,	0x27,	%asi
	stwa	%o7,	[%l7 + 0x14] %asi
	membar	#Sync
	fbn,a	%fcc0,	loop_1792
	fnegd	%f0,	%f24
	smulcc	%o4,	%i0,	%o6
	bl,a,pn	%icc,	loop_1793
loop_1792:
	mulscc	%g1,	0x043A,	%o3
	tvs	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1793:
	fmovrdgez	%l3,	%f30,	%f4
	xnor	%g4,	%l4,	%o5
	orcc	%l6,	%o2,	%l1
	set	0x70, %o0
	stda	%i6,	[%l7 + %o0] 0x04
	fmovrslez	%g7,	%f31,	%f17
	nop
	setx	loop_1794,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%i1,	0x11C2,	%i2
	fcmpes	%fcc1,	%f13,	%f14
	set	0x70, %l4
	ldstuba	[%l7 + %l4] 0x89,	%i6
loop_1794:
	mulscc	%i5,	0x101B,	%l0
	movrlz	%g2,	%l2,	%o1
	brnz	%g6,	loop_1795
	subc	%g3,	0x1CFE,	%i3
	fmovrdne	%l5,	%f14,	%f0
	fpsub16s	%f23,	%f29,	%f6
loop_1795:
	bne,a,pt	%icc,	loop_1796
	array8	%o0,	%i4,	%g5
	orn	%o4,	0x014B,	%i0
	fmovde	%icc,	%f24,	%f29
loop_1796:
	edge16l	%o6,	%g1,	%o3
	movleu	%xcc,	%o7,	%l3
	movle	%icc,	%g4,	%l4
	orcc	%o5,	0x1D87,	%l6
	addccc	%o2,	0x0890,	%i7
	umulcc	%g7,	%l1,	%i1
	fcmped	%fcc3,	%f10,	%f18
	taddcctv	%i6,	0x1A93,	%i2
	pdist	%f4,	%f16,	%f18
	tgu	%xcc,	0x7
	bgu,pt	%xcc,	loop_1797
	bcc,a	loop_1798
	tle	%xcc,	0x6
	xnorcc	%i5,	0x00FB,	%g2
loop_1797:
	fabsd	%f12,	%f16
loop_1798:
	be,a	loop_1799
	xor	%l0,	%l2,	%g6
	fmovsge	%icc,	%f1,	%f14
	edge16l	%g3,	%i3,	%o1
loop_1799:
	tpos	%xcc,	0x3
	brz,a	%o0,	loop_1800
	movne	%xcc,	%i4,	%l5
	movneg	%icc,	%g5,	%i0
	fcmpgt16	%f4,	%f8,	%o4
loop_1800:
	fcmpeq32	%f22,	%f12,	%g1
	sdivcc	%o6,	0x1A53,	%o7
	fmovsge	%icc,	%f29,	%f20
	ldd	[%l7 + 0x10],	%l2
	movn	%xcc,	%o3,	%g4
	fnot2s	%f20,	%f16
	movrgz	%l4,	0x3AD,	%l6
	fbn,a	%fcc3,	loop_1801
	movcs	%xcc,	%o2,	%o5
	tl	%icc,	0x6
	movrlez	%i7,	%g7,	%i1
loop_1801:
	fornot1	%f26,	%f20,	%f18
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%i6
	alignaddrl	%i2,	%g2,	%i5
	orn	%l2,	%l0,	%g6
	fbue	%fcc3,	loop_1802
	fbl,a	%fcc1,	loop_1803
	lduw	[%l7 + 0x24],	%g3
	fmovscc	%xcc,	%f23,	%f23
loop_1802:
	tneg	%icc,	0x0
loop_1803:
	xor	%i3,	%o1,	%o0
	brgez,a	%i4,	loop_1804
	fcmpgt16	%f6,	%f2,	%l5
	alignaddrl	%g5,	%o4,	%i0
	edge16ln	%o6,	%o7,	%g1
loop_1804:
	xorcc	%o3,	0x1C1E,	%g4
	alignaddr	%l4,	%l3,	%l6
	tvs	%icc,	0x3
	tn	%icc,	0x5
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x3C] %asi,	%f20
	movle	%xcc,	%o2,	%o5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x16
	membar	#Sync
	tn	%icc,	0x4
	set	0x64, %i4
	swapa	[%l7 + %i4] 0x0c,	%g7
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x19
	fbl,a	%fcc0,	loop_1805
	mulx	%i7,	0x1BDC,	%i1
	tgu	%icc,	0x7
	fbuge	%fcc3,	loop_1806
loop_1805:
	brz	%l1,	loop_1807
	movcs	%xcc,	%i6,	%i2
	bvs,a,pn	%icc,	loop_1808
loop_1806:
	fmovrsne	%i5,	%f5,	%f29
loop_1807:
	fmovsle	%icc,	%f9,	%f1
	fxor	%f18,	%f4,	%f0
loop_1808:
	sll	%g2,	%l2,	%g6
	ba,a	%icc,	loop_1809
	umul	%l0,	0x1533,	%g3
	tvc	%icc,	0x7
	movpos	%xcc,	%i3,	%o1
loop_1809:
	alignaddrl	%o0,	%i4,	%g5
	fbo,a	%fcc2,	loop_1810
	tvc	%icc,	0x3
	tleu	%icc,	0x0
	movcs	%xcc,	%l5,	%i0
loop_1810:
	movn	%icc,	%o6,	%o7
	fmovrdgez	%o4,	%f0,	%f0
	fcmpne32	%f10,	%f30,	%o3
	tge	%icc,	0x3
	ldub	[%l7 + 0x76],	%g4
	move	%xcc,	%l4,	%l3
	srlx	%l6,	%g1,	%o5
	xnor	%g7,	0x0165,	%i7
	udivcc	%i1,	0x06F6,	%l1
	edge8l	%i6,	%o2,	%i2
	bleu,pt	%icc,	loop_1811
	fmovsgu	%icc,	%f16,	%f12
	fmuld8ulx16	%f20,	%f3,	%f2
	prefetch	[%l7 + 0x68],	 0x3
loop_1811:
	fmovrsgz	%i5,	%f3,	%f15
	ldstub	[%l7 + 0x68],	%l2
	tsubcctv	%g6,	%g2,	%g3
	xorcc	%l0,	%i3,	%o0
	subcc	%i4,	0x1D05,	%o1
	fmovdn	%icc,	%f11,	%f13
	mova	%xcc,	%g5,	%l5
	tsubcc	%i0,	0x099C,	%o6
	nop
	set	0x08, %i6
	std	%f8,	[%l7 + %i6]
	movg	%icc,	%o4,	%o7
	fmovdg	%xcc,	%f17,	%f23
	tvc	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g4,	0x1E68,	%o3
	mova	%icc,	%l3,	%l6
	stbar
	array16	%g1,	%o5,	%l4
	edge32n	%g7,	%i1,	%i7
	tne	%xcc,	0x2
	fcmps	%fcc3,	%f3,	%f15
	fble	%fcc2,	loop_1812
	movg	%icc,	%l1,	%i6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x1C] %asi,	%o2
loop_1812:
	tcs	%icc,	0x6
	umul	%i5,	%l2,	%i2
	fbule,a	%fcc2,	loop_1813
	addc	%g6,	0x0FDF,	%g3
	and	%g2,	0x05CD,	%l0
	fblg,a	%fcc3,	loop_1814
loop_1813:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%i3,	%i4
	movneg	%icc,	%o0,	%o1
loop_1814:
	fmovdleu	%icc,	%f29,	%f9
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x0B] %asi,	%g5
	fmovdle	%icc,	%f11,	%f20
	or	%l5,	%o6,	%i0
	fmovsg	%xcc,	%f18,	%f9
	taddcc	%o7,	%g4,	%o4
	udivcc	%l3,	0x0D31,	%o3
	te	%xcc,	0x3
	addc	%l6,	%g1,	%o5
	fmovsne	%xcc,	%f12,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x28],	%g7
	tn	%xcc,	0x3
	sethi	0x1EAF,	%l4
	fba	%fcc1,	loop_1815
	srl	%i7,	%l1,	%i1
	fmovrse	%i6,	%f21,	%f18
	ble,a	loop_1816
loop_1815:
	movn	%xcc,	%i5,	%o2
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x14] %asi,	%l2
loop_1816:
	ldx	[%l7 + 0x78],	%g6
	edge32l	%i2,	%g3,	%l0
	udivcc	%g2,	0x16ED,	%i3
	ld	[%l7 + 0x70],	%f11
	addcc	%o0,	0x120B,	%i4
	addcc	%o1,	0x1066,	%l5
	fbul	%fcc0,	loop_1817
	xnorcc	%g5,	0x0856,	%i0
	edge32	%o6,	%g4,	%o4
	sllx	%o7,	0x1F,	%l3
loop_1817:
	fnors	%f16,	%f16,	%f1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%o3
	fmul8x16al	%f0,	%f1,	%f22
	andn	%l6,	0x08CE,	%g1
	taddcc	%o5,	%l4,	%i7
	subccc	%g7,	%l1,	%i1
	xnor	%i5,	0x131F,	%i6
	fmul8x16	%f5,	%f20,	%f18
	fbuge,a	%fcc3,	loop_1818
	edge8l	%o2,	%g6,	%l2
	andcc	%g3,	%l0,	%g2
	sdivx	%i3,	0x03F8,	%o0
loop_1818:
	stx	%i2,	[%l7 + 0x38]
	movrgez	%o1,	0x1B2,	%i4
	fbne	%fcc3,	loop_1819
	movcc	%icc,	%l5,	%g5
	fmovsgu	%xcc,	%f1,	%f21
	flush	%l7 + 0x0C
loop_1819:
	add	%i0,	%o6,	%g4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x7C] %asi,	%o7
	sir	0x1048
	sllx	%o4,	%l3,	%o3
	lduw	[%l7 + 0x68],	%l6
	ta	%icc,	0x2
	wr	%g0,	0x11,	%asi
	stda	%o4,	[%l7 + 0x28] %asi
	andncc	%g1,	%l4,	%g7
	membar	0x2C
	tneg	%xcc,	0x2
	sll	%i7,	0x00,	%i1
	fbe,a	%fcc2,	loop_1820
	edge32	%i5,	%l1,	%i6
	edge16n	%o2,	%g6,	%g3
	fabss	%f10,	%f8
loop_1820:
	fmovrsgz	%l0,	%f7,	%f8
	fxnor	%f12,	%f4,	%f20
	fnand	%f2,	%f6,	%f2
	orncc	%l2,	%g2,	%o0
	swap	[%l7 + 0x40],	%i2
	brlz	%i3,	loop_1821
	popc	0x0017,	%i4
	array32	%l5,	%o1,	%i0
	nop
	set	0x7F, %l6
	ldstub	[%l7 + %l6],	%o6
loop_1821:
	sethi	0x196A,	%g4
	bleu,a	%icc,	loop_1822
	edge16n	%o7,	%o4,	%g5
	siam	0x4
	edge16n	%l3,	%l6,	%o5
loop_1822:
	taddcc	%o3,	0x0E2E,	%g1
	fmul8x16au	%f25,	%f5,	%f16
	edge16n	%l4,	%g7,	%i1
	fmovda	%icc,	%f5,	%f28
	fnegd	%f18,	%f28
	fmovdn	%icc,	%f12,	%f4
	tvc	%icc,	0x4
	ldsw	[%l7 + 0x48],	%i5
	fmovdcc	%xcc,	%f5,	%f16
	edge32l	%i7,	%i6,	%o2
	sllx	%l1,	0x12,	%g6
	andcc	%l0,	0x02F4,	%g3
	fmovrslez	%l2,	%f8,	%f20
	fmovsg	%xcc,	%f12,	%f13
	stx	%o0,	[%l7 + 0x28]
	brgez,a	%g2,	loop_1823
	addccc	%i3,	%i4,	%i2
	edge32ln	%o1,	%l5,	%o6
	fble,a	%fcc1,	loop_1824
loop_1823:
	fmovdg	%icc,	%f9,	%f1
	ble	%xcc,	loop_1825
	fandnot2	%f12,	%f2,	%f10
loop_1824:
	edge32l	%i0,	%g4,	%o4
	array32	%g5,	%o7,	%l6
loop_1825:
	prefetch	[%l7 + 0x28],	 0x1
	fbu,a	%fcc2,	loop_1826
	movrgez	%l3,	0x3A5,	%o3
	mulx	%g1,	%l4,	%o5
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%i1
loop_1826:
	andncc	%i5,	%i7,	%g7
	edge32l	%o2,	%l1,	%i6
	tcs	%xcc,	0x4
	movrne	%l0,	%g6,	%l2
	fmovrdlez	%g3,	%f30,	%f14
	lduw	[%l7 + 0x4C],	%o0
	taddcc	%i3,	%i4,	%g2
	nop
	setx	loop_1827,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%i2,	0x1E1F,	%l5
	sdiv	%o1,	0x185E,	%i0
	umulcc	%o6,	%o4,	%g5
loop_1827:
	movneg	%xcc,	%g4,	%l6
	tn	%xcc,	0x7
	fmovsvs	%xcc,	%f2,	%f2
	set	0x50, %l0
	lduha	[%l7 + %l0] 0x10,	%o7
	fmovdn	%icc,	%f16,	%f3
	fmovscc	%icc,	%f0,	%f11
	fmovrsgez	%o3,	%f0,	%f2
	movrlz	%l3,	%l4,	%o5
	movvs	%xcc,	%g1,	%i5
	subcc	%i7,	%i1,	%g7
	mova	%xcc,	%o2,	%l1
	edge32ln	%i6,	%l0,	%l2
	prefetch	[%l7 + 0x64],	 0x1
	edge16ln	%g3,	%g6,	%o0
	sll	%i3,	%i4,	%g2
	bneg,a,pt	%xcc,	loop_1828
	smul	%l5,	%o1,	%i2
	fmovscs	%icc,	%f19,	%f28
	tvc	%icc,	0x6
loop_1828:
	tcc	%xcc,	0x5
	fmovs	%f10,	%f16
	ldsw	[%l7 + 0x4C],	%i0
	fpadd16s	%f30,	%f5,	%f28
	fmovrslez	%o6,	%f18,	%f9
	fpsub16	%f8,	%f10,	%f28
	st	%f5,	[%l7 + 0x54]
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g5,	%g4
	fxnors	%f5,	%f9,	%f10
	pdist	%f24,	%f2,	%f24
	tsubcctv	%o4,	0x0EF6,	%o7
	add	%l6,	0x0A70,	%l3
	brlz	%o3,	loop_1829
	fbug,a	%fcc0,	loop_1830
	be	loop_1831
	fmovrsgz	%o5,	%f29,	%f7
loop_1829:
	andncc	%g1,	%l4,	%i5
loop_1830:
	sdivcc	%i7,	0x06C1,	%i1
loop_1831:
	tsubcc	%o2,	0x1ABF,	%l1
	addcc	%i6,	0x007C,	%g7
	tpos	%xcc,	0x0
	orncc	%l2,	0x07A9,	%l0
	bgu,a,pt	%xcc,	loop_1832
	brlz	%g6,	loop_1833
	fbne	%fcc2,	loop_1834
	nop
	set	0x38, %o4
	sth	%o0,	[%l7 + %o4]
loop_1832:
	tneg	%icc,	0x7
loop_1833:
	edge16ln	%i3,	%g3,	%g2
loop_1834:
	sll	%i4,	0x0B,	%o1
	tge	%xcc,	0x3
	fnot1	%f26,	%f14
	srl	%l5,	%i2,	%o6
	array32	%g5,	%i0,	%g4
	edge8l	%o4,	%o7,	%l6
	fblg	%fcc3,	loop_1835
	movle	%xcc,	%l3,	%o3
	array8	%g1,	%o5,	%i5
	mova	%icc,	%l4,	%i1
loop_1835:
	fmovs	%f12,	%f1
	edge32	%i7,	%o2,	%i6
	sethi	0x070A,	%l1
	pdist	%f6,	%f8,	%f18
	set	0x3C, %l3
	lduba	[%l7 + %l3] 0x14,	%g7
	wr	%g0,	0x80,	%asi
	stda	%l0,	[%l7 + 0x60] %asi
	fcmpgt32	%f28,	%f8,	%g6
	sdiv	%o0,	0x04BF,	%i3
	fmovsg	%xcc,	%f1,	%f7
	nop
	set	0x22, %i7
	ldsh	[%l7 + %i7],	%g3
	taddcc	%g2,	0x0AD3,	%l2
	fcmpd	%fcc3,	%f2,	%f0
	nop
	setx	loop_1836,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bshuffle	%f22,	%f14,	%f0
	edge8n	%o1,	%i4,	%i2
	xor	%o6,	%g5,	%l5
loop_1836:
	smulcc	%g4,	%o4,	%i0
	fpmerge	%f3,	%f13,	%f26
	fcmpeq16	%f8,	%f18,	%o7
	brgz,a	%l6,	loop_1837
	movre	%o3,	0x178,	%g1
	fbo	%fcc1,	loop_1838
	tcc	%icc,	0x7
loop_1837:
	flush	%l7 + 0x78
	flush	%l7 + 0x64
loop_1838:
	movne	%icc,	%l3,	%o5
	bge,pn	%icc,	loop_1839
	orn	%i5,	%l4,	%i7
	xnor	%i1,	%o2,	%l1
	brlez	%i6,	loop_1840
loop_1839:
	alignaddr	%l0,	%g7,	%o0
	subccc	%g6,	%i3,	%g3
	sdiv	%l2,	0x1777,	%g2
loop_1840:
	fexpand	%f31,	%f6
	tle	%xcc,	0x3
	fmovdleu	%xcc,	%f29,	%f14
	ldstub	[%l7 + 0x18],	%i4
	fexpand	%f20,	%f8
	or	%i2,	0x1CBC,	%o6
	tcc	%xcc,	0x0
	movcc	%icc,	%o1,	%l5
	movne	%icc,	%g5,	%o4
	fmovsge	%icc,	%f16,	%f1
	taddcctv	%g4,	0x007C,	%i0
	taddcc	%o7,	0x01A2,	%o3
	st	%f17,	[%l7 + 0x60]
	tg	%xcc,	0x5
	movvc	%xcc,	%g1,	%l6
	tn	%icc,	0x3
	fmovde	%xcc,	%f22,	%f31
	movn	%xcc,	%o5,	%i5
	fmovrsgez	%l4,	%f14,	%f15
	udivx	%i7,	0x05CD,	%i1
	brgz	%o2,	loop_1841
	movge	%xcc,	%l3,	%i6
	brnz,a	%l0,	loop_1842
	movle	%xcc,	%g7,	%o0
loop_1841:
	movge	%xcc,	%l1,	%g6
	srl	%g3,	%l2,	%i3
loop_1842:
	umulcc	%i4,	%g2,	%i2
	set	0x41, %g3
	lduba	[%l7 + %g3] 0x89,	%o1
	tleu	%icc,	0x7
	fblg,a	%fcc3,	loop_1843
	edge16	%o6,	%l5,	%o4
	stx	%g5,	[%l7 + 0x20]
	tcs	%xcc,	0x0
loop_1843:
	bshuffle	%f10,	%f28,	%f8
	fmovrslez	%g4,	%f3,	%f3
	fbge	%fcc2,	loop_1844
	subccc	%i0,	%o7,	%g1
	fcmps	%fcc0,	%f13,	%f28
	edge32	%l6,	%o5,	%o3
loop_1844:
	edge32	%l4,	%i7,	%i5
	nop
	set	0x30, %g6
	ldub	[%l7 + %g6],	%o2
	membar	0x2F
	fxnor	%f22,	%f22,	%f24
	movle	%xcc,	%i1,	%l3
	edge16	%l0,	%g7,	%i6
	movrgz	%o0,	0x046,	%l1
	sdivx	%g6,	0x0D4C,	%l2
	tvs	%xcc,	0x6
	andn	%g3,	%i3,	%i4
	edge8	%i2,	%g2,	%o1
	ta	%xcc,	0x7
	xnorcc	%l5,	%o6,	%o4
	fmovdneg	%icc,	%f17,	%f23
	movre	%g5,	%i0,	%g4
	movvs	%icc,	%o7,	%g1
	array8	%o5,	%l6,	%o3
	andn	%i7,	%i5,	%o2
	movl	%icc,	%l4,	%l3
	sir	0x060B
	bpos,a,pn	%xcc,	loop_1845
	edge16l	%i1,	%l0,	%i6
	and	%g7,	0x096E,	%o0
	ldd	[%l7 + 0x40],	%l0
loop_1845:
	array16	%l2,	%g6,	%g3
	edge8	%i4,	%i2,	%g2
	bn,a	%xcc,	loop_1846
	taddcctv	%o1,	0x1E50,	%l5
	tl	%xcc,	0x5
	array8	%i3,	%o6,	%g5
loop_1846:
	tcc	%xcc,	0x7
	tcc	%icc,	0x6
	movcc	%xcc,	%o4,	%i0
	sub	%g4,	%g1,	%o5
	std	%i6,	[%l7 + 0x08]
	umulcc	%o7,	0x0CFC,	%o3
	edge16n	%i5,	%i7,	%o2
	edge8ln	%l3,	%l4,	%i1
	orncc	%l0,	0x0B0E,	%g7
	fmul8sux16	%f24,	%f0,	%f30
	umulcc	%i6,	%l1,	%l2
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x50] %asi,	%o0
	movge	%xcc,	%g3,	%i4
	sdiv	%g6,	0x17F1,	%g2
	tle	%icc,	0x0
	fmovse	%xcc,	%f8,	%f2
	fpack16	%f4,	%f14
	movge	%xcc,	%o1,	%l5
	fxnor	%f2,	%f0,	%f26
	bn,a,pt	%xcc,	loop_1847
	stx	%i2,	[%l7 + 0x78]
	fbuge,a	%fcc2,	loop_1848
	array32	%o6,	%g5,	%o4
loop_1847:
	movpos	%xcc,	%i3,	%g4
	tle	%icc,	0x3
loop_1848:
	edge16ln	%i0,	%g1,	%o5
	fornot2s	%f4,	%f29,	%f15
	array16	%o7,	%o3,	%l6
	membar	0x3A
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x34] %asi,	%i7
	tgu	%icc,	0x5
	subcc	%o2,	0x0237,	%l3
	and	%l4,	0x0F52,	%i5
	fmovsg	%icc,	%f29,	%f13
	fnands	%f6,	%f26,	%f2
	udivcc	%l0,	0x1C41,	%g7
	andcc	%i1,	0x0D1E,	%l1
	fbug	%fcc0,	loop_1849
	sllx	%i6,	%o0,	%l2
	movvs	%icc,	%i4,	%g3
	fxors	%f31,	%f15,	%f22
loop_1849:
	fcmpes	%fcc2,	%f18,	%f18
	fmovsgu	%icc,	%f25,	%f15
	tg	%icc,	0x6
	fones	%f8
	udivx	%g6,	0x1117,	%g2
	fmovdg	%xcc,	%f9,	%f27
	fcmpne32	%f26,	%f12,	%l5
	stx	%i2,	[%l7 + 0x40]
	orncc	%o6,	%g5,	%o4
	move	%xcc,	%o1,	%i3
	tvs	%icc,	0x3
	tcc	%xcc,	0x1
	srl	%i0,	0x16,	%g4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%o7
	bcc	loop_1850
	fba	%fcc3,	loop_1851
	xorcc	%o3,	0x1D82,	%l6
	edge32ln	%i7,	%o2,	%o5
loop_1850:
	bge	loop_1852
loop_1851:
	array32	%l4,	%l3,	%i5
	fornot2	%f24,	%f2,	%f4
	tsubcc	%g7,	0x12DF,	%l0
loop_1852:
	fmovd	%f30,	%f8
	set	0x5E, %o5
	stba	%l1,	[%l7 + %o5] 0x11
	fbne	%fcc0,	loop_1853
	array16	%i1,	%i6,	%o0
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%i4
loop_1853:
	mulx	%g3,	%l2,	%g6
	movrne	%g2,	0x272,	%l5
	brz	%i2,	loop_1854
	stw	%g5,	[%l7 + 0x5C]
	bne,a,pn	%xcc,	loop_1855
	ldd	[%l7 + 0x10],	%f6
loop_1854:
	fmovrdgz	%o4,	%f0,	%f28
	bpos,a,pn	%icc,	loop_1856
loop_1855:
	array8	%o6,	%o1,	%i3
	movrgz	%i0,	%g1,	%o7
	taddcctv	%g4,	0x095E,	%o3
loop_1856:
	nop
	wr	%g0,	0x18,	%asi
	stxa	%l6,	[%l7 + 0x40] %asi
	fbo,a	%fcc0,	loop_1857
	fmovrdne	%i7,	%f8,	%f24
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x80,	 0x1
loop_1857:
	fbug,a	%fcc2,	loop_1858
	edge8ln	%o5,	%l3,	%l4
	fpsub16s	%f21,	%f16,	%f15
	brlz	%i5,	loop_1859
loop_1858:
	movg	%icc,	%g7,	%l0
	edge8l	%l1,	%i1,	%o0
	wr	%g0,	0x89,	%asi
	stba	%i6,	[%l7 + 0x12] %asi
loop_1859:
	tpos	%xcc,	0x5
	xorcc	%g3,	%l2,	%g6
	brgez,a	%i4,	loop_1860
	array32	%l5,	%i2,	%g2
	subc	%o4,	0x097D,	%o6
	srl	%o1,	0x13,	%g5
loop_1860:
	fpsub16s	%f4,	%f11,	%f3
	or	%i3,	%i0,	%o7
	prefetch	[%l7 + 0x50],	 0x3
	movleu	%icc,	%g4,	%o3
	srl	%l6,	0x1C,	%g1
	tpos	%xcc,	0x5
	tn	%xcc,	0x6
	bg,pn	%xcc,	loop_1861
	call	loop_1862
	edge16l	%i7,	%o5,	%l3
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1861:
	array8	%l4,	%i5,	%o2
loop_1862:
	nop
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf9,	%f0
	fandnot2s	%f20,	%f6,	%f0
	ta	%xcc,	0x4
	fnot1	%f30,	%f8
	mova	%xcc,	%l0,	%g7
	fpadd32	%f10,	%f20,	%f2
	fmuld8ulx16	%f16,	%f25,	%f0
	fcmpne16	%f0,	%f18,	%l1
	ldstub	[%l7 + 0x3A],	%o0
	alignaddr	%i6,	%g3,	%i1
	mulscc	%l2,	%g6,	%l5
	orn	%i4,	%i2,	%g2
	fmul8x16	%f27,	%f12,	%f24
	alignaddrl	%o4,	%o1,	%g5
	fmovdcc	%icc,	%f13,	%f22
	sdiv	%o6,	0x0C1B,	%i3
	nop
	setx	loop_1863,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%o7,	%g4,	%i0
	or	%o3,	%g1,	%l6
	bgu,pt	%xcc,	loop_1864
loop_1863:
	edge8	%i7,	%l3,	%o5
	sra	%l4,	0x11,	%o2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%i5
loop_1864:
	movl	%icc,	%g7,	%l0
	array8	%o0,	%i6,	%g3
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	addcc	%i1,	%l2,	%l1
	tg	%xcc,	0x5
	tvs	%xcc,	0x5
	umul	%g6,	%l5,	%i2
	nop
	set	0x59, %i5
	ldstub	[%l7 + %i5],	%g2
	sdivx	%o4,	0x166D,	%o1
	tn	%icc,	0x3
	movl	%xcc,	%g5,	%o6
	umulcc	%i3,	%o7,	%i4
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x50] %asi,	%i0
	edge8n	%o3,	%g4,	%l6
	sllx	%i7,	%l3,	%o5
	bne,a,pt	%xcc,	loop_1865
	movne	%xcc,	%g1,	%l4
	sethi	0x1FA4,	%i5
	subc	%g7,	%o2,	%l0
loop_1865:
	brlz,a	%i6,	loop_1866
	ldsw	[%l7 + 0x48],	%o0
	andcc	%i1,	%g3,	%l1
	edge16	%l2,	%g6,	%l5
loop_1866:
	nop
	set	0x3F, %i3
	lduba	[%l7 + %i3] 0x19,	%i2
	array8	%g2,	%o4,	%g5
	edge32l	%o1,	%o6,	%i3
	edge8	%i4,	%i0,	%o7
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	fsrc1s	%f17,	%f7
	bg	%xcc,	loop_1867
	lduh	[%l7 + 0x38],	%g4
	fandnot2	%f0,	%f24,	%f28
	wr	%g0,	0x80,	%asi
	stxa	%i7,	[%l7 + 0x08] %asi
loop_1867:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l3,	%o5
	ldd	[%l7 + 0x30],	%f8
	fpsub32	%f18,	%f24,	%f22
	fnegs	%f21,	%f7
	set	0x60, %i0
	ldda	[%l7 + %i0] 0x18,	%g0
	fnors	%f20,	%f2,	%f31
	set	0x60, %i2
	stwa	%l4,	[%l7 + %i2] 0x10
	tl	%xcc,	0x2
	fmuld8ulx16	%f16,	%f11,	%f20
	movg	%icc,	%l6,	%i5
	fcmpeq32	%f26,	%f30,	%g7
	brnz,a	%o2,	loop_1868
	fble,a	%fcc0,	loop_1869
	umulcc	%i6,	0x1CB2,	%l0
	te	%xcc,	0x7
loop_1868:
	fmovrslez	%o0,	%f10,	%f28
loop_1869:
	nop
	set	0x20, %g2
	lda	[%l7 + %g2] 0x10,	%f23
	brgz	%i1,	loop_1870
	tg	%icc,	0x4
	fbuge	%fcc1,	loop_1871
	tl	%icc,	0x2
loop_1870:
	srl	%l1,	0x05,	%l2
	bvs,pn	%icc,	loop_1872
loop_1871:
	ba	%xcc,	loop_1873
	array8	%g3,	%l5,	%i2
	sllx	%g6,	%g2,	%o4
loop_1872:
	fbge	%fcc3,	loop_1874
loop_1873:
	for	%f0,	%f12,	%f10
	sdiv	%o1,	0x0A27,	%g5
	edge32	%i3,	%i4,	%i0
loop_1874:
	addcc	%o7,	0x0520,	%o6
	brz	%g4,	loop_1875
	movge	%icc,	%o3,	%l3
	movrlez	%i7,	0x3CB,	%g1
	edge32	%o5,	%l4,	%l6
loop_1875:
	brgez,a	%i5,	loop_1876
	movle	%icc,	%g7,	%i6
	sllx	%o2,	%o0,	%l0
	ld	[%l7 + 0x14],	%f4
loop_1876:
	tn	%icc,	0x5
	fmovrsgz	%i1,	%f26,	%f10
	bl,a,pn	%icc,	loop_1877
	edge32l	%l1,	%l2,	%g3
	movcc	%xcc,	%l5,	%i2
	tgu	%xcc,	0x4
loop_1877:
	addccc	%g2,	0x0419,	%g6
	edge16n	%o1,	%o4,	%g5
	fmovdne	%icc,	%f19,	%f23
	fsrc2s	%f16,	%f1
	alignaddr	%i4,	%i3,	%o7
	fmovrsgez	%o6,	%f22,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x7
	array16	%i0,	%g4,	%l3
	ldd	[%l7 + 0x38],	%f4
	fpadd32s	%f22,	%f3,	%f2
	wr	%g0,	0xe3,	%asi
	stba	%o3,	[%l7 + 0x25] %asi
	membar	#Sync
	mulx	%g1,	%o5,	%i7
	edge16l	%l6,	%i5,	%g7
	fmovrdgz	%l4,	%f14,	%f28
	tle	%icc,	0x4
	sdivcc	%i6,	0x0D60,	%o0
	fabss	%f10,	%f16
	orcc	%o2,	0x043D,	%l0
	ldx	[%l7 + 0x38],	%l1
	fandnot2	%f12,	%f8,	%f2
	fandnot2s	%f9,	%f27,	%f0
	movge	%icc,	%i1,	%g3
	ldsh	[%l7 + 0x52],	%l5
	fmul8ulx16	%f22,	%f0,	%f16
	movrne	%l2,	0x3EF,	%i2
	addccc	%g2,	%g6,	%o4
	mova	%xcc,	%o1,	%g5
	edge16l	%i3,	%i4,	%o7
	movcs	%xcc,	%i0,	%o6
	brlez	%g4,	loop_1878
	movne	%icc,	%o3,	%g1
	and	%l3,	%o5,	%i7
	array16	%i5,	%g7,	%l4
loop_1878:
	srl	%i6,	%o0,	%o2
	brnz	%l0,	loop_1879
	sdiv	%l6,	0x0FD0,	%l1
	array16	%i1,	%l5,	%g3
	edge32	%i2,	%g2,	%l2
loop_1879:
	sir	0x1644
	udivcc	%o4,	0x1E50,	%o1
	ldd	[%l7 + 0x60],	%g6
	edge16	%g5,	%i3,	%o7
	tne	%xcc,	0x4
	tsubcctv	%i0,	0x0F09,	%o6
	movge	%icc,	%g4,	%o3
	te	%icc,	0x7
	array16	%g1,	%i4,	%l3
	nop
	set	0x30, %l5
	std	%o4,	[%l7 + %l5]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i7,	%i5
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%l4
	fsrc1	%f6,	%f28
	fmovsge	%xcc,	%f31,	%f11
	ble,a	%icc,	loop_1880
	bcs,a,pn	%icc,	loop_1881
	mulscc	%i6,	%g7,	%o0
	tvc	%icc,	0x0
loop_1880:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1881:
	xnorcc	%o2,	%l0,	%l1
	faligndata	%f12,	%f28,	%f2
	brnz	%i1,	loop_1882
	tneg	%xcc,	0x1
	fandnot1	%f2,	%f20,	%f20
	tleu	%xcc,	0x4
loop_1882:
	fmul8x16au	%f28,	%f11,	%f30
	srax	%l6,	0x1F,	%g3
	set	0x118, %i1
	ldxa	[%g0 + %i1] 0x52,	%i2
	movl	%xcc,	%g2,	%l5
	xorcc	%o4,	%o1,	%l2
	tn	%icc,	0x4
	fcmpne16	%f0,	%f6,	%g5
	fpsub16	%f16,	%f26,	%f4
	edge16	%i3,	%g6,	%i0
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f16
	movrne	%o7,	0x357,	%o6
	fmovdcc	%xcc,	%f29,	%f2
	fbule	%fcc0,	loop_1883
	fmovdpos	%xcc,	%f14,	%f8
	fmovrdlz	%o3,	%f0,	%f0
	st	%f9,	[%l7 + 0x0C]
loop_1883:
	sllx	%g1,	0x17,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l3,	%i4,	%o5
	edge8l	%i7,	%i5,	%l4
	fmovde	%xcc,	%f17,	%f9
	ldub	[%l7 + 0x27],	%i6
	movl	%xcc,	%o0,	%o2
	andcc	%l0,	0x11D7,	%g7
	fnands	%f13,	%f10,	%f7
	brnz	%l1,	loop_1884
	fmovse	%icc,	%f10,	%f5
	fandnot2	%f24,	%f26,	%f2
	tcc	%icc,	0x5
loop_1884:
	bne	loop_1885
	andcc	%l6,	0x081B,	%i1
	udivx	%i2,	0x01FF,	%g3
	add	%l5,	%g2,	%o1
loop_1885:
	te	%xcc,	0x0
	move	%xcc,	%o4,	%l2
	nop
	set	0x50, %o2
	lduh	[%l7 + %o2],	%i3
	add	%g6,	%i0,	%g5
	edge16n	%o6,	%o7,	%g1
	mulx	%g4,	0x03CB,	%l3
	fmovscs	%icc,	%f13,	%f6
	fmovsneg	%xcc,	%f16,	%f23
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%o2
	edge8n	%o5,	%i7,	%i5
	fmovrdgez	%i4,	%f20,	%f24
	tgu	%xcc,	0x6
	movrlez	%l4,	0x245,	%o0
	tsubcc	%i6,	0x127F,	%o2
	xnorcc	%l0,	0x1F65,	%l1
	alignaddr	%l6,	%g7,	%i2
	tneg	%icc,	0x0
	tpos	%xcc,	0x6
	srl	%g3,	0x10,	%l5
	andn	%g2,	%o1,	%o4
	movg	%xcc,	%i1,	%l2
	tg	%xcc,	0x2
	alignaddr	%g6,	%i0,	%g5
	edge32n	%i3,	%o7,	%g1
	fandnot1s	%f3,	%f14,	%f27
	tcc	%icc,	0x1
	movn	%xcc,	%g4,	%l3
	brgz,a	%o6,	loop_1886
	tne	%icc,	0x5
	tne	%xcc,	0x3
	or	%o3,	0x10A7,	%i7
loop_1886:
	bshuffle	%f0,	%f12,	%f4
	movne	%xcc,	%i5,	%i4
	fmovdle	%icc,	%f3,	%f23
	array16	%l4,	%o5,	%o0
	orn	%i6,	%l0,	%o2
	be	%icc,	loop_1887
	movpos	%xcc,	%l6,	%g7
	ble,a,pt	%icc,	loop_1888
	subc	%l1,	%g3,	%l5
loop_1887:
	edge16n	%i2,	%g2,	%o1
	edge32l	%o4,	%l2,	%i1
loop_1888:
	srl	%g6,	%i0,	%g5
	fmovdn	%icc,	%f29,	%f25
	movcs	%xcc,	%o7,	%i3
	andcc	%g4,	%l3,	%g1
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x16] %asi,	%o3
	bvc,pn	%icc,	loop_1889
	sub	%i7,	%o6,	%i5
	srl	%l4,	%o5,	%i4
	fbg	%fcc0,	loop_1890
loop_1889:
	fexpand	%f17,	%f12
	wr	%g0,	0x2b,	%asi
	stxa	%i6,	[%l7 + 0x18] %asi
	membar	#Sync
loop_1890:
	fcmpne16	%f28,	%f20,	%o0
	movpos	%xcc,	%o2,	%l0
	std	%g6,	[%l7 + 0x40]
	set	0x70, %o7
	ldda	[%l7 + %o7] 0x89,	%i6
	tg	%xcc,	0x7
	wr	%g0,	0x2a,	%asi
	stda	%g2,	[%l7 + 0x10] %asi
	membar	#Sync
	movrgez	%l1,	0x296,	%i2
	fbuge,a	%fcc2,	loop_1891
	tgu	%icc,	0x0
	movpos	%xcc,	%l5,	%g2
	add	%o1,	0x1687,	%o4
loop_1891:
	fmovde	%icc,	%f11,	%f5
	tcs	%xcc,	0x6
	stbar
	fcmpne16	%f20,	%f30,	%i1
	xorcc	%l2,	0x171C,	%g6
	call	loop_1892
	brlz,a	%g5,	loop_1893
	fsrc2	%f22,	%f28
	fmovse	%icc,	%f11,	%f25
loop_1892:
	subc	%i0,	0x02FD,	%o7
loop_1893:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x70] %asi,	%i3
	edge8ln	%g4,	%g1,	%l3
	fbl,a	%fcc2,	loop_1894
	xorcc	%o3,	%i7,	%o6
	membar	0x00
	smul	%i5,	0x1835,	%l4
loop_1894:
	subccc	%i4,	%o5,	%i6
	bl,a,pt	%xcc,	loop_1895
	fxnors	%f21,	%f19,	%f22
	tneg	%icc,	0x0
	sdivcc	%o0,	0x1956,	%o2
loop_1895:
	fpsub32	%f4,	%f26,	%f12
	andncc	%l0,	%g7,	%g3
	brz	%l1,	loop_1896
	taddcctv	%i2,	%l6,	%g2
	fmovdleu	%icc,	%f27,	%f19
	tge	%xcc,	0x7
loop_1896:
	edge32l	%l5,	%o1,	%i1
	fmovda	%xcc,	%f8,	%f13
	fbe,a	%fcc0,	loop_1897
	movrlz	%l2,	%g6,	%g5
	nop
	set	0x72, %l1
	sth	%o4,	[%l7 + %l1]
	ble,pt	%xcc,	loop_1898
loop_1897:
	ldd	[%l7 + 0x28],	%i0
	mulx	%i3,	0x07AF,	%g4
	fone	%f4
loop_1898:
	stbar
	edge32ln	%o7,	%l3,	%g1
	fbne,a	%fcc3,	loop_1899
	fmovd	%f30,	%f26
	ldsw	[%l7 + 0x58],	%i7
	andn	%o6,	0x166C,	%o3
loop_1899:
	fmovrdlez	%i5,	%f26,	%f26
	movge	%icc,	%i4,	%o5
	tpos	%xcc,	0x1
	movle	%xcc,	%i6,	%l4
	ble,pn	%xcc,	loop_1900
	edge16ln	%o2,	%o0,	%g7
	membar	0x2A
	tleu	%icc,	0x0
loop_1900:
	fmovrslez	%l0,	%f27,	%f4
	fpsub32	%f12,	%f16,	%f22
	sub	%l1,	0x01C6,	%g3
	sra	%i2,	0x02,	%g2
	edge8	%l6,	%o1,	%l5
	nop
	setx	loop_1901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%l2,	0x0D4D,	%i1
	bn,pn	%icc,	loop_1902
	membar	0x5E
loop_1901:
	fnand	%f26,	%f20,	%f4
	stx	%g6,	[%l7 + 0x18]
loop_1902:
	fmovsvc	%xcc,	%f12,	%f20
	sethi	0x0E74,	%o4
	fsrc2	%f2,	%f26
	orcc	%i0,	%g5,	%i3
	fsrc1	%f18,	%f24
	membar	0x22
	orncc	%o7,	0x0D31,	%l3
	bvc	loop_1903
	ldd	[%l7 + 0x60],	%f24
	tl	%xcc,	0x0
	stbar
loop_1903:
	fsrc1s	%f26,	%f22
	sdiv	%g1,	0x1192,	%g4
	tl	%xcc,	0x5
	brlz	%i7,	loop_1904
	stx	%o3,	[%l7 + 0x18]
	movrgez	%o6,	0x1F9,	%i5
	mulx	%i4,	0x0DC9,	%o5
loop_1904:
	fmovsleu	%xcc,	%f19,	%f0
	movg	%xcc,	%l4,	%o2
	fandnot2s	%f20,	%f11,	%f8
	std	%f12,	[%l7 + 0x20]
	tg	%icc,	0x7
	fmovs	%f0,	%f25
	movcc	%icc,	%i6,	%o0
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x17,	%f0
	ldsh	[%l7 + 0x28],	%g7
	tvs	%icc,	0x7
	edge32	%l1,	%l0,	%i2
	edge16	%g3,	%g2,	%o1
	edge32l	%l5,	%l6,	%i1
	edge8n	%l2,	%o4,	%g6
	sdivx	%g5,	0x1206,	%i3
	te	%icc,	0x5
	orncc	%i0,	%o7,	%l3
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g4
	tn	%xcc,	0x1
	nop
	set	0x1B, %o6
	ldsb	[%l7 + %o6],	%g1
	sir	0x1BF0
	edge16	%o3,	%i7,	%o6
	sdivcc	%i4,	0x142A,	%i5
	fmovsge	%icc,	%f7,	%f5
	movvs	%icc,	%o5,	%l4
	bcs,a	%icc,	loop_1905
	movle	%xcc,	%o2,	%i6
	fmovsl	%xcc,	%f16,	%f20
	bg,a,pt	%xcc,	loop_1906
loop_1905:
	fabsd	%f16,	%f18
	siam	0x1
	set	0x33, %o0
	ldsba	[%l7 + %o0] 0x81,	%g7
loop_1906:
	array32	%l1,	%l0,	%i2
	alignaddr	%g3,	%o0,	%o1
	fcmple16	%f10,	%f14,	%g2
	ldx	[%l7 + 0x48],	%l6
	prefetch	[%l7 + 0x60],	 0x1
	edge16	%i1,	%l5,	%l2
	fornot1	%f8,	%f10,	%f12
	subc	%o4,	0x0F0A,	%g5
	sll	%g6,	0x10,	%i0
	tcs	%icc,	0x6
	tsubcctv	%i3,	0x1980,	%l3
	edge16	%o7,	%g4,	%g1
	tne	%xcc,	0x6
	subc	%o3,	0x09F5,	%o6
	sir	0x078F
	ble	loop_1907
	fsrc2s	%f30,	%f14
	movg	%icc,	%i4,	%i7
	fabsd	%f4,	%f6
loop_1907:
	fsrc1s	%f1,	%f19
	call	loop_1908
	movrlez	%i5,	%o5,	%l4
	fmovsleu	%xcc,	%f12,	%f27
	nop
	set	0x28, %o1
	ldx	[%l7 + %o1],	%i6
loop_1908:
	bpos,a	%icc,	loop_1909
	bne,pn	%icc,	loop_1910
	be,a	%xcc,	loop_1911
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1909:
	taddcc	%o2,	0x05CF,	%g7
loop_1910:
	stx	%l1,	[%l7 + 0x40]
loop_1911:
	edge16n	%l0,	%g3,	%o0
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
	set	0x1E, %l4
	stha	%i2,	[%l7 + %l4] 0x14
	fmovsg	%xcc,	%f27,	%f10
	movge	%icc,	%l6,	%i1
	movleu	%xcc,	%l5,	%l2
	sdivx	%g2,	0x03D8,	%o4
	fcmple32	%f24,	%f4,	%g6
	fbu	%fcc0,	loop_1912
	fmuld8ulx16	%f17,	%f3,	%f0
	fnand	%f0,	%f2,	%f4
	udiv	%i0,	0x0ADB,	%i3
loop_1912:
	fbug	%fcc1,	loop_1913
	lduh	[%l7 + 0x2E],	%g5
	orn	%l3,	%g4,	%g1
	fandnot2	%f28,	%f22,	%f6
loop_1913:
	movrlz	%o3,	0x35E,	%o6
	addccc	%i4,	%i7,	%o7
	movne	%xcc,	%i5,	%o5
	xnorcc	%i6,	%o2,	%g7
	movn	%icc,	%l4,	%l1
	fmovrde	%g3,	%f18,	%f16
	fba	%fcc0,	loop_1914
	fmovrse	%o0,	%f12,	%f24
	fornot1s	%f0,	%f0,	%f18
	te	%icc,	0x6
loop_1914:
	fnand	%f24,	%f4,	%f0
	fabss	%f5,	%f30
	fmul8x16	%f12,	%f22,	%f4
	edge8l	%o1,	%l0,	%l6
	movn	%xcc,	%i2,	%l5
	edge8l	%i1,	%l2,	%o4
	bleu	%xcc,	loop_1915
	and	%g6,	%g2,	%i0
	brlz	%g5,	loop_1916
	fmovdcs	%icc,	%f25,	%f24
loop_1915:
	fandnot2	%f28,	%f30,	%f30
	mulscc	%i3,	0x0869,	%l3
loop_1916:
	umul	%g1,	0x10BA,	%g4
	fmovsvs	%icc,	%f26,	%f7
	edge16n	%o3,	%i4,	%o6
	array8	%o7,	%i7,	%i5
	call	loop_1917
	or	%i6,	0x01D4,	%o2
	fmovdg	%xcc,	%f26,	%f8
	fmovsvc	%xcc,	%f11,	%f13
loop_1917:
	movleu	%xcc,	%g7,	%o5
	mulscc	%l1,	0x0AD0,	%l4
	set	0x10, %g7
	swapa	[%l7 + %g7] 0x19,	%o0
	movne	%xcc,	%g3,	%o1
	bpos,pt	%icc,	loop_1918
	udivx	%l6,	0x17F9,	%l0
	fnot1s	%f23,	%f16
	fzeros	%f14
loop_1918:
	prefetch	[%l7 + 0x20],	 0x1
	edge8l	%l5,	%i2,	%l2
	subc	%o4,	%i1,	%g6
	fbule	%fcc1,	loop_1919
	tgu	%icc,	0x2
	movge	%icc,	%i0,	%g5
	siam	0x4
loop_1919:
	tcs	%icc,	0x2
	fnot1	%f22,	%f2
	ldd	[%l7 + 0x68],	%g2
	fmovdvs	%xcc,	%f1,	%f22
	udivcc	%l3,	0x1821,	%g1
	sir	0x0F02
	brz	%g4,	loop_1920
	bleu,a	loop_1921
	tneg	%xcc,	0x2
	nop
	set	0x58, %i4
	ldd	[%l7 + %i4],	%f4
loop_1920:
	sll	%i3,	%o3,	%i4
loop_1921:
	call	loop_1922
	movrlz	%o6,	%i7,	%i5
	movvc	%xcc,	%i6,	%o2
	edge32n	%o7,	%g7,	%o5
loop_1922:
	fmovde	%xcc,	%f13,	%f4
	fbe	%fcc1,	loop_1923
	sdivx	%l1,	0x08DF,	%o0
	popc	%g3,	%l4
	st	%f29,	[%l7 + 0x68]
loop_1923:
	udiv	%l6,	0x0A67,	%l0
	nop
	set	0x0D, %l2
	ldub	[%l7 + %l2],	%l5
	fcmpes	%fcc2,	%f22,	%f7
	fbg,a	%fcc2,	loop_1924
	fpadd16	%f18,	%f16,	%f4
	edge8	%o1,	%i2,	%l2
	edge8l	%o4,	%i1,	%g6
loop_1924:
	sdiv	%g5,	0x0251,	%g2
	fbl	%fcc2,	loop_1925
	fba	%fcc3,	loop_1926
	srlx	%l3,	0x1E,	%g1
	fpadd32	%f26,	%f24,	%f8
loop_1925:
	stw	%g4,	[%l7 + 0x30]
loop_1926:
	subc	%i3,	0x1B25,	%i0
	tsubcctv	%i4,	0x1C75,	%o6
	alignaddrl	%i7,	%i5,	%i6
	movcs	%xcc,	%o2,	%o3
	tle	%xcc,	0x0
	addcc	%o7,	%o5,	%l1
	brnz,a	%o0,	loop_1927
	fcmpd	%fcc0,	%f2,	%f8
	fpadd32	%f26,	%f4,	%f22
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x44] %asi,	%g7
loop_1927:
	tvc	%xcc,	0x0
	fcmps	%fcc1,	%f3,	%f17
	edge16n	%l4,	%g3,	%l6
	fbul,a	%fcc3,	loop_1928
	fzeros	%f0
	fbuge,a	%fcc3,	loop_1929
	ble	loop_1930
loop_1928:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc1,	loop_1931
loop_1929:
	orncc	%l0,	%o1,	%i2
loop_1930:
	edge16n	%l5,	%l2,	%o4
	set	0x69, %l6
	stba	%g6,	[%l7 + %l6] 0x23
	membar	#Sync
loop_1931:
	te	%icc,	0x1
	sethi	0x10BD,	%i1
	be,pt	%xcc,	loop_1932
	ldsh	[%l7 + 0x78],	%g2
	udivx	%l3,	0x1693,	%g5
	sra	%g1,	%g4,	%i0
loop_1932:
	edge8n	%i3,	%o6,	%i7
	fandnot2s	%f0,	%f25,	%f21
	movre	%i5,	%i6,	%i4
	std	%o2,	[%l7 + 0x20]
	set	0x20, %i6
	stwa	%o3,	[%l7 + %i6] 0x23
	membar	#Sync
	subcc	%o5,	%o7,	%o0
	edge8ln	%l1,	%g7,	%g3
	set	0x1C, %l0
	sta	%f8,	[%l7 + %l0] 0x10
	xnorcc	%l4,	0x041E,	%l6
	ta	%xcc,	0x1
	xor	%o1,	0x1114,	%i2
	fbul	%fcc1,	loop_1933
	subc	%l0,	%l2,	%l5
	ldstub	[%l7 + 0x4D],	%o4
	edge32ln	%g6,	%g2,	%i1
loop_1933:
	fnot2s	%f19,	%f9
	ta	%icc,	0x5
	srax	%g5,	%g1,	%l3
	sllx	%g4,	%i3,	%o6
	xor	%i7,	0x07EE,	%i0
	edge32ln	%i6,	%i4,	%o2
	sra	%o3,	%o5,	%o7
	fand	%f28,	%f6,	%f18
	fbne,a	%fcc3,	loop_1934
	andncc	%i5,	%o0,	%l1
	nop
	set	0x60, %l3
	stw	%g3,	[%l7 + %l3]
	orn	%l4,	0x136B,	%l6
loop_1934:
	sra	%o1,	%i2,	%g7
	edge32ln	%l0,	%l5,	%o4
	movrgz	%l2,	%g6,	%g2
	set	0x68, %i7
	lda	[%l7 + %i7] 0x11,	%f26
	fbu,a	%fcc0,	loop_1935
	tleu	%icc,	0x2
	fsrc1	%f10,	%f8
	edge16n	%g5,	%g1,	%i1
loop_1935:
	edge16l	%g4,	%i3,	%l3
	fmovdge	%xcc,	%f16,	%f25
	subcc	%o6,	0x12F3,	%i7
	fcmped	%fcc1,	%f16,	%f8
	fxnors	%f19,	%f1,	%f11
	movl	%xcc,	%i6,	%i4
	brgez,a	%o2,	loop_1936
	fbne,a	%fcc3,	loop_1937
	xnor	%i0,	%o3,	%o5
	andcc	%o7,	0x0C4A,	%o0
loop_1936:
	umul	%l1,	%i5,	%l4
loop_1937:
	fsrc2	%f0,	%f8
	membar	0x47
	tl	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g3,	%l6,	%i2
	edge8n	%g7,	%l0,	%l5
	orncc	%o1,	0x0E58,	%l2
	tle	%xcc,	0x1
	fmovdcc	%icc,	%f20,	%f15
	stbar
	set	0x08, %o4
	lda	[%l7 + %o4] 0x18,	%f25
	movcs	%icc,	%o4,	%g6
	tcc	%xcc,	0x5
	movpos	%xcc,	%g2,	%g5
	fblg,a	%fcc3,	loop_1938
	membar	0x72
	alignaddrl	%g1,	%i1,	%i3
	tle	%xcc,	0x4
loop_1938:
	mova	%icc,	%g4,	%o6
	orn	%i7,	%l3,	%i4
	pdist	%f24,	%f8,	%f16
	std	%f30,	[%l7 + 0x10]
	srl	%i6,	0x09,	%i0
	ldx	[%l7 + 0x40],	%o3
	fpsub16	%f0,	%f30,	%f22
	sdivx	%o2,	0x0315,	%o7
	fandnot1	%f26,	%f24,	%f0
	fandnot1s	%f13,	%f8,	%f26
	fmovrsgz	%o0,	%f21,	%f21
	fba	%fcc1,	loop_1939
	orcc	%l1,	%o5,	%l4
	movre	%i5,	%l6,	%i2
	fmovsg	%xcc,	%f16,	%f7
loop_1939:
	fbge	%fcc1,	loop_1940
	fsrc2	%f30,	%f2
	fcmps	%fcc3,	%f9,	%f27
	sll	%g7,	%l0,	%g3
loop_1940:
	movg	%xcc,	%l5,	%o1
	smul	%l2,	0x0761,	%o4
	movrgz	%g6,	%g5,	%g2
	set	0x4C, %g6
	ldstuba	[%l7 + %g6] 0x81,	%i1
	movcs	%icc,	%i3,	%g4
	fone	%f10
	ldstub	[%l7 + 0x55],	%o6
	nop
	set	0x7D, %g3
	ldsb	[%l7 + %g3],	%g1
	edge16	%i7,	%i4,	%i6
	fmovrslz	%l3,	%f29,	%f0
	array32	%o3,	%i0,	%o7
	taddcctv	%o0,	0x040A,	%o2
	bleu,pt	%icc,	loop_1941
	fmovrde	%o5,	%f24,	%f30
	fbne	%fcc0,	loop_1942
	subccc	%l1,	0x0C7F,	%l4
loop_1941:
	array8	%l6,	%i5,	%i2
	smulcc	%g7,	%g3,	%l5
loop_1942:
	addc	%l0,	0x1C4B,	%l2
	movneg	%icc,	%o4,	%o1
	movrgz	%g6,	0x0CD,	%g5
	nop
	set	0x56, %g1
	lduh	[%l7 + %g1],	%i1
	alignaddr	%i3,	%g4,	%g2
	umulcc	%g1,	0x187E,	%o6
	edge16	%i4,	%i6,	%i7
	sra	%o3,	0x18,	%l3
	taddcc	%i0,	%o0,	%o2
	array16	%o5,	%l1,	%l4
	movrne	%o7,	%l6,	%i5
	ldsh	[%l7 + 0x32],	%i2
	srax	%g7,	0x1A,	%g3
	tle	%xcc,	0x2
	taddcctv	%l5,	0x1A32,	%l2
	ba,a,pn	%icc,	loop_1943
	movne	%icc,	%o4,	%o1
	udivx	%l0,	0x01A5,	%g6
	te	%xcc,	0x5
loop_1943:
	tge	%icc,	0x7
	fornot1s	%f12,	%f2,	%f31
	movleu	%xcc,	%g5,	%i1
	subcc	%g4,	0x08C4,	%i3
	tgu	%icc,	0x7
	st	%f23,	[%l7 + 0x48]
	array16	%g2,	%g1,	%i4
	fone	%f2
	st	%f25,	[%l7 + 0x0C]
	sth	%i6,	[%l7 + 0x40]
	alignaddrl	%o6,	%i7,	%o3
	sir	0x06B6
	mova	%icc,	%l3,	%o0
	lduw	[%l7 + 0x10],	%o2
	bcs,a,pt	%xcc,	loop_1944
	sdivx	%o5,	0x0AE8,	%i0
	te	%xcc,	0x2
	std	%l4,	[%l7 + 0x58]
loop_1944:
	orncc	%l1,	0x0527,	%l6
	tvs	%xcc,	0x4
	sir	0x1E7B
	fmuld8sux16	%f12,	%f18,	%f10
	tg	%icc,	0x0
	edge32l	%o7,	%i5,	%i2
	tne	%xcc,	0x4
	andn	%g3,	0x15D6,	%g7
	prefetch	[%l7 + 0x20],	 0x3
	swap	[%l7 + 0x38],	%l5
	movrne	%o4,	0x1C9,	%l2
	edge16	%o1,	%g6,	%g5
	fandnot2	%f0,	%f26,	%f30
	fcmpne16	%f14,	%f8,	%i1
	set	0x08, %o5
	stwa	%l0,	[%l7 + %o5] 0x04
	bvc,a,pt	%icc,	loop_1945
	alignaddr	%g4,	%i3,	%g1
	fornot2	%f8,	%f2,	%f24
	fmuld8sux16	%f25,	%f7,	%f10
loop_1945:
	sra	%i4,	%i6,	%o6
	fmovsn	%xcc,	%f21,	%f27
	umul	%g2,	0x1A63,	%o3
	sdivcc	%l3,	0x1634,	%i7
	fnot1s	%f6,	%f11
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%o0
	edge8n	%o2,	%o5,	%l4
	array16	%l1,	%l6,	%i0
	tsubcctv	%i5,	0x0783,	%i2
	ta	%icc,	0x1
	tsubcc	%g3,	0x12D1,	%o7
	srlx	%l5,	%o4,	%l2
	movrne	%o1,	0x3C4,	%g6
	movrgz	%g5,	%i1,	%g7
	bne	loop_1946
	bge,a	loop_1947
	fmovrslez	%l0,	%f24,	%f11
	fbuge	%fcc2,	loop_1948
loop_1946:
	bvs,a	%icc,	loop_1949
loop_1947:
	edge16n	%i3,	%g1,	%i4
	fmovsleu	%icc,	%f9,	%f4
loop_1948:
	siam	0x6
loop_1949:
	taddcctv	%i6,	0x05EC,	%g4
	set	0x5C, %g5
	stwa	%o6,	[%l7 + %g5] 0x10
	taddcctv	%g2,	0x0AFD,	%l3
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x52] %asi,	%i7
	ldstub	[%l7 + 0x28],	%o0
	movleu	%xcc,	%o2,	%o3
	mulx	%l4,	0x0F51,	%l1
	movcs	%xcc,	%l6,	%i0
	mulx	%i5,	%i2,	%o5
	fmovdne	%icc,	%f22,	%f3
	xor	%o7,	%g3,	%o4
	bn,a	%xcc,	loop_1950
	fmul8x16al	%f9,	%f10,	%f22
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1950:
	nop
	set	0x77, %i3
	lduba	[%l7 + %i3] 0x0c,	%l5
	ba,pt	%icc,	loop_1951
	tvs	%xcc,	0x4
	tge	%icc,	0x1
	fmul8x16au	%f6,	%f7,	%f0
loop_1951:
	srlx	%l2,	%o1,	%g5
	array8	%g6,	%g7,	%l0
	set	0x78, %i0
	lduba	[%l7 + %i0] 0x10,	%i1
	fbn,a	%fcc0,	loop_1952
	pdist	%f4,	%f8,	%f26
	ld	[%l7 + 0x10],	%f0
	fpadd32s	%f8,	%f14,	%f28
loop_1952:
	brlz	%g1,	loop_1953
	movpos	%xcc,	%i4,	%i3
	fmovspos	%xcc,	%f16,	%f28
	srlx	%g4,	0x03,	%i6
loop_1953:
	fmovdcc	%icc,	%f20,	%f22
	array16	%o6,	%g2,	%i7
	fnands	%f16,	%f0,	%f29
	prefetch	[%l7 + 0x08],	 0x0
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x28] %asi,	%o0
	movre	%o2,	0x021,	%o3
	bne,pn	%xcc,	loop_1954
	bshuffle	%f22,	%f24,	%f10
	array8	%l3,	%l4,	%l6
	movre	%l1,	%i5,	%i0
loop_1954:
	or	%i2,	0x07B8,	%o7
	tpos	%icc,	0x4
	fmovde	%xcc,	%f3,	%f17
	tvs	%xcc,	0x3
	sra	%o5,	%g3,	%l5
	tn	%xcc,	0x0
	edge32	%o4,	%o1,	%l2
	umulcc	%g6,	%g5,	%l0
	sethi	0x0CF5,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x7
	sdivcc	%g1,	0x19C8,	%i1
	bleu,pt	%icc,	loop_1955
	nop
	set	0x5C, %g2
	lduw	[%l7 + %g2],	%i4
	brgz	%g4,	loop_1956
	tn	%icc,	0x0
loop_1955:
	brz	%i6,	loop_1957
	edge8l	%o6,	%g2,	%i3
loop_1956:
	srax	%o0,	0x05,	%i7
	addccc	%o2,	0x0CE1,	%o3
loop_1957:
	tge	%icc,	0x2
	movvc	%icc,	%l4,	%l3
	mulscc	%l1,	0x0DF6,	%i5
	fbug	%fcc1,	loop_1958
	movn	%xcc,	%l6,	%i2
	smulcc	%o7,	%i0,	%g3
	edge16l	%l5,	%o4,	%o1
loop_1958:
	fnand	%f4,	%f8,	%f2
	edge8n	%l2,	%g6,	%g5
	fmovdvs	%icc,	%f20,	%f22
	fbg,a	%fcc3,	loop_1959
	orcc	%l0,	%o5,	%g7
	set	0x7C, %i2
	ldstuba	[%l7 + %i2] 0x11,	%i1
loop_1959:
	fcmpne16	%f22,	%f28,	%g1
	tpos	%xcc,	0x5
	tsubcc	%g4,	%i6,	%i4
	andcc	%g2,	0x04E1,	%o6
	fmovse	%icc,	%f24,	%f19
	sll	%o0,	0x13,	%i7
	bpos,pt	%icc,	loop_1960
	xnor	%i3,	%o2,	%o3
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x3E] %asi,	%l3
loop_1960:
	nop
	set	0x2C, %l5
	lduha	[%l7 + %l5] 0x89,	%l4
	ta	%xcc,	0x7
	mulx	%i5,	%l6,	%i2
	tle	%icc,	0x6
	fmovd	%f2,	%f10
	fmovse	%xcc,	%f16,	%f24
	fbug	%fcc0,	loop_1961
	sdiv	%o7,	0x1491,	%i0
	lduh	[%l7 + 0x6E],	%l1
	sra	%g3,	0x14,	%o4
loop_1961:
	tleu	%xcc,	0x7
	mulx	%o1,	%l5,	%g6
	pdist	%f18,	%f24,	%f28
	taddcctv	%l2,	0x0567,	%g5
	movg	%xcc,	%o5,	%l0
	fsrc1	%f8,	%f8
	bge,pn	%xcc,	loop_1962
	tge	%xcc,	0x3
	alignaddrl	%i1,	%g1,	%g4
	movre	%g7,	0x263,	%i4
loop_1962:
	orcc	%i6,	0x1A6F,	%g2
	fpsub16	%f4,	%f8,	%f18
	movvs	%xcc,	%o6,	%i7
	sdiv	%o0,	0x17F7,	%o2
	fmovda	%xcc,	%f8,	%f26
	fandnot1s	%f20,	%f20,	%f23
	movg	%xcc,	%i3,	%o3
	fmul8ulx16	%f14,	%f12,	%f6
	sub	%l3,	0x04B0,	%l4
	nop
	setx	loop_1963,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%l6,	0x1828,	%i5
	edge32ln	%o7,	%i0,	%l1
	movvs	%icc,	%g3,	%o4
loop_1963:
	mulscc	%i2,	%o1,	%l5
	tpos	%xcc,	0x7
	popc	0x0417,	%g6
	tcc	%icc,	0x4
	fcmple16	%f6,	%f0,	%g5
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	fmovrdlz	%l0,	%f12,	%f20
	fbule	%fcc2,	loop_1964
	movle	%xcc,	%i1,	%g1
	tgu	%icc,	0x5
	tcs	%icc,	0x1
loop_1964:
	udivcc	%g4,	0x062F,	%g7
	ta	%icc,	0x6
	movre	%i4,	0x236,	%i6
	fnands	%f15,	%f0,	%f4
	fxnors	%f7,	%f2,	%f28
	xorcc	%g2,	0x08DD,	%l2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%i7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x10,	%o0,	%o2
	sll	%o6,	0x0A,	%i3
	fmovrslez	%l3,	%f15,	%f14
	fmovsgu	%icc,	%f18,	%f6
	sra	%l4,	0x07,	%o3
	ta	%xcc,	0x5
	lduh	[%l7 + 0x58],	%i5
	movvc	%xcc,	%o7,	%i0
	fbug,a	%fcc0,	loop_1965
	movge	%xcc,	%l1,	%g3
	fbg	%fcc2,	loop_1966
	fcmpeq16	%f22,	%f12,	%o4
loop_1965:
	nop
	set	0x30, %i1
	ldstuba	[%l7 + %i1] 0x88,	%i2
loop_1966:
	bn	%xcc,	loop_1967
	subccc	%o1,	%l5,	%l6
	fsrc1	%f8,	%f12
	mulx	%g6,	0x0C9B,	%g5
loop_1967:
	array8	%o5,	%l0,	%g1
	movrgz	%i1,	0x2ED,	%g4
	fmul8x16al	%f21,	%f3,	%f30
	tl	%icc,	0x5
	fble,a	%fcc1,	loop_1968
	array8	%g7,	%i4,	%g2
	bcc,a	loop_1969
	udivcc	%l2,	0x008B,	%i6
loop_1968:
	ldsh	[%l7 + 0x22],	%i7
	tle	%icc,	0x7
loop_1969:
	addccc	%o0,	0x14FF,	%o2
	mulx	%o6,	0x0DDC,	%l3
	bcc,a,pt	%icc,	loop_1970
	fmovdvc	%icc,	%f7,	%f28
	ba	%icc,	loop_1971
	fmovdvc	%icc,	%f25,	%f22
loop_1970:
	nop
	setx	loop_1972,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnands	%f17,	%f19,	%f20
loop_1971:
	addc	%i3,	0x08DE,	%o3
	tcc	%icc,	0x1
loop_1972:
	mova	%icc,	%l4,	%i5
	mova	%icc,	%o7,	%i0
	sth	%l1,	[%l7 + 0x1C]
	edge32ln	%o4,	%i2,	%g3
	call	loop_1973
	fbuge	%fcc1,	loop_1974
	fbue	%fcc2,	loop_1975
	movrlez	%o1,	%l5,	%g6
loop_1973:
	movvc	%xcc,	%g5,	%o5
loop_1974:
	tl	%icc,	0x3
loop_1975:
	movrgz	%l0,	0x15A,	%g1
	edge8ln	%l6,	%g4,	%g7
	movn	%xcc,	%i4,	%i1
	tvs	%xcc,	0x7
	fpadd32	%f8,	%f14,	%f2
	array32	%g2,	%i6,	%l2
	edge16	%o0,	%i7,	%o6
	bcc,a,pt	%xcc,	loop_1976
	fabss	%f26,	%f2
	fmovsvs	%xcc,	%f5,	%f8
	tl	%icc,	0x6
loop_1976:
	brgz	%o2,	loop_1977
	edge16ln	%i3,	%o3,	%l4
	fmovrse	%i5,	%f13,	%f9
	fsrc2s	%f4,	%f1
loop_1977:
	ta	%xcc,	0x2
	nop
	setx loop_1978, %l0, %l1
	jmpl %l1, %o7
	array16	%i0,	%l1,	%l3
	fbn,a	%fcc0,	loop_1979
	bcc,a,pt	%xcc,	loop_1980
loop_1978:
	sir	0x07DF
	tcs	%icc,	0x3
loop_1979:
	sir	0x0C32
loop_1980:
	xnor	%i2,	0x1D2C,	%o4
	move	%icc,	%g3,	%l5
	fbuge,a	%fcc0,	loop_1981
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc2,	loop_1982
	sllx	%g6,	%g5,	%o5
loop_1981:
	movgu	%icc,	%o1,	%g1
	sllx	%l6,	%l0,	%g7
loop_1982:
	fnor	%f24,	%f28,	%f6
	brlz,a	%g4,	loop_1983
	fornot2	%f16,	%f24,	%f30
	popc	0x0FBF,	%i1
	taddcctv	%g2,	0x18D6,	%i4
loop_1983:
	stbar
	orcc	%l2,	0x0606,	%o0
	fmul8x16	%f30,	%f20,	%f24
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	array16	%i7,	%o6,	%i6
	fba,a	%fcc1,	loop_1984
	sth	%o2,	[%l7 + 0x4A]
	fbne,a	%fcc1,	loop_1985
	tcs	%icc,	0x7
loop_1984:
	fmovrdlez	%i3,	%f20,	%f10
	alignaddrl	%o3,	%i5,	%o7
loop_1985:
	fsrc2	%f2,	%f18
	bleu,a,pt	%icc,	loop_1986
	fmovscs	%xcc,	%f8,	%f7
	fmovrdne	%i0,	%f30,	%f10
	xorcc	%l4,	0x153C,	%l1
loop_1986:
	movl	%icc,	%l3,	%o4
	nop
	setx	loop_1987,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bg	loop_1988
	fpsub16s	%f12,	%f25,	%f19
	sub	%g3,	%l5,	%g6
loop_1987:
	fors	%f3,	%f0,	%f17
loop_1988:
	fmovde	%xcc,	%f16,	%f10
	fblg	%fcc1,	loop_1989
	movvs	%xcc,	%i2,	%o5
	fzero	%f22
	bneg,a	%icc,	loop_1990
loop_1989:
	alignaddrl	%o1,	%g1,	%l6
	tvc	%xcc,	0x2
	srlx	%l0,	0x0A,	%g5
loop_1990:
	xorcc	%g7,	%i1,	%g4
	fmovrdlz	%g2,	%f16,	%f26
	fcmpne16	%f22,	%f22,	%i4
	movg	%xcc,	%o0,	%l2
	sll	%i7,	0x02,	%i6
	fcmpes	%fcc1,	%f8,	%f5
	addccc	%o6,	%i3,	%o2
	mova	%icc,	%o3,	%o7
	tvc	%icc,	0x1
	bn,pn	%xcc,	loop_1991
	tcc	%icc,	0x1
	tle	%xcc,	0x5
	tcc	%icc,	0x2
loop_1991:
	movvs	%xcc,	%i5,	%l4
	ta	%xcc,	0x2
	subccc	%l1,	%i0,	%l3
	or	%g3,	0x149E,	%l5
	ta	%icc,	0x2
	fandnot1s	%f19,	%f21,	%f13
	edge32n	%o4,	%i2,	%o5
	and	%g6,	0x0A06,	%g1
	movrgz	%l6,	0x1B0,	%l0
	orncc	%g5,	0x18F6,	%o1
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x48] %asi,	%i1
	sra	%g7,	%g2,	%g4
	brgz,a	%o0,	loop_1992
	movvc	%xcc,	%l2,	%i7
	fnands	%f12,	%f8,	%f3
	set	0x68, %o3
	lda	[%l7 + %o3] 0x80,	%f3
loop_1992:
	fandnot1s	%f27,	%f30,	%f1
	wr	%g0,	0x0c,	%asi
	stwa	%i4,	[%l7 + 0x48] %asi
	te	%icc,	0x6
	taddcctv	%i6,	%o6,	%i3
	tsubcc	%o3,	%o7,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l4,	0x1E20,	%o2
	tcc	%icc,	0x6
	xorcc	%i0,	0x04C3,	%l1
	bn	loop_1993
	edge8ln	%l3,	%l5,	%o4
	array32	%i2,	%g3,	%o5
	fone	%f30
loop_1993:
	sllx	%g1,	%l6,	%g6
	xorcc	%g5,	0x0D57,	%o1
	mulscc	%i1,	0x0087,	%l0
	tcs	%xcc,	0x3
	fcmpne16	%f8,	%f6,	%g7
	fbne	%fcc2,	loop_1994
	fmovdleu	%icc,	%f28,	%f19
	std	%g2,	[%l7 + 0x70]
	wr	%g0,	0xe2,	%asi
	stha	%g4,	[%l7 + 0x78] %asi
	membar	#Sync
loop_1994:
	sdivx	%l2,	0x1D41,	%o0
	movrlz	%i7,	%i4,	%i6
	edge32	%o6,	%i3,	%o3
	set	0x57, %o2
	lduba	[%l7 + %o2] 0x04,	%i5
	mova	%icc,	%o7,	%l4
	fmovrdlz	%i0,	%f18,	%f10
	fmovsle	%icc,	%f24,	%f5
	bcs,pt	%xcc,	loop_1995
	tleu	%xcc,	0x1
	sdivcc	%l1,	0x09CF,	%o2
	edge8n	%l3,	%l5,	%o4
loop_1995:
	or	%i2,	0x075B,	%g3
	alignaddrl	%o5,	%g1,	%g6
	fmovdl	%xcc,	%f25,	%f15
	bgu,a	loop_1996
	fmovsn	%icc,	%f25,	%f22
	fbule,a	%fcc2,	loop_1997
	fmovsvs	%xcc,	%f25,	%f31
loop_1996:
	edge32n	%l6,	%o1,	%g5
	call	loop_1998
loop_1997:
	brgz	%i1,	loop_1999
	fones	%f1
	swap	[%l7 + 0x44],	%l0
loop_1998:
	tl	%xcc,	0x3
loop_1999:
	tleu	%icc,	0x3
	fmovdpos	%icc,	%f25,	%f11
	te	%icc,	0x0
	taddcctv	%g2,	0x0A8D,	%g4
	bne,a	%xcc,	loop_2000
	fmovdge	%xcc,	%f16,	%f2
	set	0x7C, %l1
	swapa	[%l7 + %l1] 0x88,	%l2
loop_2000:
	swap	[%l7 + 0x7C],	%o0
	mulscc	%i7,	%i4,	%g7
	array8	%o6,	%i3,	%o3
	wr	%g0,	0x18,	%asi
	stba	%i5,	[%l7 + 0x5A] %asi
	orncc	%i6,	0x1010,	%l4
	set	0x10, %o7
	stxa	%o7,	[%l7 + %o7] 0x80
	fble	%fcc3,	loop_2001
	movvs	%xcc,	%i0,	%o2
	movle	%icc,	%l3,	%l5
	tsubcc	%l1,	0x03C9,	%i2
loop_2001:
	movneg	%xcc,	%g3,	%o4
	sra	%o5,	0x12,	%g6
	set	0x58, %o6
	stha	%g1,	[%l7 + %o6] 0x14
	xorcc	%l6,	0x123A,	%g5
	move	%icc,	%o1,	%l0
	ldstub	[%l7 + 0x2C],	%g2
	umulcc	%i1,	%l2,	%g4
	fmovdvc	%icc,	%f14,	%f12
	fmovdcs	%xcc,	%f0,	%f30
	fbl,a	%fcc1,	loop_2002
	fmovs	%f13,	%f30
	srax	%i7,	0x1C,	%o0
	fandnot2s	%f27,	%f4,	%f0
loop_2002:
	sir	0x0A48
	fbule	%fcc0,	loop_2003
	addcc	%i4,	0x0BB4,	%o6
	umulcc	%g7,	0x0AF0,	%o3
	movleu	%xcc,	%i5,	%i3
loop_2003:
	fmuld8ulx16	%f14,	%f11,	%f24
	tneg	%icc,	0x7
	tgu	%xcc,	0x2
	andcc	%i6,	%l4,	%o7
	nop
	set	0x7B, %o0
	ldstub	[%l7 + %o0],	%i0
	xnor	%o2,	0x0DAC,	%l5
	fble	%fcc1,	loop_2004
	ldx	[%l7 + 0x70],	%l1
	tg	%xcc,	0x1
	set	0x24, %g4
	sta	%f29,	[%l7 + %g4] 0x80
loop_2004:
	movge	%icc,	%i2,	%g3
	brlez	%l3,	loop_2005
	tg	%icc,	0x1
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf1
	membar	#Sync
loop_2005:
	tleu	%icc,	0x0
	array32	%o5,	%g6,	%g1
	fpadd16	%f26,	%f26,	%f8
	fpadd32s	%f8,	%f11,	%f25
	fbne,a	%fcc2,	loop_2006
	andncc	%o4,	%l6,	%g5
	fbug	%fcc0,	loop_2007
	tsubcctv	%l0,	%g2,	%i1
loop_2006:
	sdivcc	%l2,	0x088F,	%g4
	umul	%o1,	0x191B,	%i7
loop_2007:
	fsrc2s	%f28,	%f3
	movcs	%xcc,	%i4,	%o6
	movgu	%icc,	%o0,	%g7
	fmovrdlez	%i5,	%f28,	%f18
	fpack16	%f18,	%f11
	fmovrdlez	%i3,	%f26,	%f14
	sdivx	%i6,	0x1658,	%l4
	tleu	%icc,	0x3
	movrgez	%o3,	%i0,	%o7
	tl	%icc,	0x2
	brgz,a	%l5,	loop_2008
	fmovdgu	%icc,	%f11,	%f24
	fnor	%f12,	%f6,	%f14
	wr	%g0,	0xea,	%asi
	stwa	%o2,	[%l7 + 0x78] %asi
	membar	#Sync
loop_2008:
	xorcc	%i2,	%g3,	%l1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%g6
	tsubcctv	%g1,	%o4,	%l3
	fpsub32	%f14,	%f30,	%f12
	smul	%l6,	0x1712,	%l0
	movle	%icc,	%g2,	%g5
	ldsb	[%l7 + 0x4C],	%i1
	edge16l	%g4,	%l2,	%o1
	movpos	%xcc,	%i4,	%i7
	movleu	%xcc,	%o6,	%g7
	andncc	%o0,	%i3,	%i6
	brnz,a	%l4,	loop_2009
	movcc	%icc,	%o3,	%i0
	stb	%o7,	[%l7 + 0x5B]
	be	loop_2010
loop_2009:
	tpos	%icc,	0x3
	fbl,a	%fcc0,	loop_2011
	fmovsneg	%xcc,	%f19,	%f23
loop_2010:
	add	%l5,	%i5,	%i2
	umul	%o2,	%l1,	%o5
loop_2011:
	movrlz	%g6,	0x0ED,	%g3
	subcc	%g1,	0x16F7,	%l3
	udiv	%o4,	0x1383,	%l6
	alignaddrl	%l0,	%g5,	%g2
	tsubcc	%g4,	%i1,	%o1
	fmovrslz	%i4,	%f23,	%f22
	fabss	%f24,	%f26
	andncc	%l2,	%i7,	%o6
	tl	%xcc,	0x3
	fcmpes	%fcc3,	%f18,	%f17
	be,a	loop_2012
	movneg	%icc,	%o0,	%g7
	fbne	%fcc1,	loop_2013
	alignaddr	%i3,	%i6,	%o3
loop_2012:
	edge32n	%i0,	%o7,	%l4
	ta	%icc,	0x0
loop_2013:
	srax	%i5,	0x0F,	%l5
	swap	[%l7 + 0x70],	%o2
	fsrc1s	%f2,	%f9
	orcc	%l1,	0x011F,	%i2
	fmuld8sux16	%f25,	%f16,	%f28
	movrgez	%o5,	%g6,	%g1
	edge32n	%g3,	%o4,	%l3
	fmovsa	%xcc,	%f0,	%f31
	andncc	%l6,	%l0,	%g5
	fxnors	%f26,	%f9,	%f15
	ldsw	[%l7 + 0x0C],	%g2
	umul	%g4,	%i1,	%o1
	srl	%l2,	%i7,	%i4
	tpos	%icc,	0x1
	tsubcctv	%o6,	%g7,	%o0
	set	0x50, %o1
	stha	%i6,	[%l7 + %o1] 0xea
	membar	#Sync
	bcc,pn	%xcc,	loop_2014
	brlez	%o3,	loop_2015
	addccc	%i3,	0x1B46,	%o7
	fmovse	%xcc,	%f27,	%f25
loop_2014:
	tcc	%icc,	0x1
loop_2015:
	mulscc	%i0,	0x0F6C,	%i5
	taddcctv	%l5,	%l4,	%o2
	orn	%l1,	0x1249,	%i2
	movne	%icc,	%o5,	%g1
	fmovdcs	%icc,	%f25,	%f2
	movpos	%icc,	%g3,	%g6
	tsubcc	%o4,	%l6,	%l3
	movre	%g5,	0x049,	%g2
	addcc	%g4,	%i1,	%l0
	fmovsne	%icc,	%f11,	%f27
	movg	%xcc,	%l2,	%o1
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i4
	ld	[%l7 + 0x38],	%f13
	swap	[%l7 + 0x54],	%i7
	umulcc	%g7,	0x117A,	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%i6
	mulscc	%i3,	%o3,	%i0
	movcc	%icc,	%o7,	%i5
	set	0x0B, %g7
	ldsba	[%l7 + %g7] 0x0c,	%l5
	fmovdne	%icc,	%f17,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f4,	%f12,	%f0
	set	0x6C, %i4
	lduha	[%l7 + %i4] 0x80,	%l4
	fpackfix	%f4,	%f0
	alignaddrl	%o2,	%l1,	%i2
	movrlez	%g1,	0x345,	%o5
	fpadd16	%f20,	%f26,	%f22
	orn	%g3,	%o4,	%g6
	tg	%icc,	0x0
	fsrc1	%f22,	%f22
	tneg	%xcc,	0x6
	tle	%icc,	0x0
	movre	%l3,	%g5,	%g2
	subcc	%l6,	%i1,	%l0
	sll	%l2,	%g4,	%o1
	stb	%i7,	[%l7 + 0x50]
	orncc	%i4,	%o0,	%o6
	alignaddrl	%i6,	%g7,	%i3
	fmovsvs	%xcc,	%f15,	%f12
	sra	%i0,	%o3,	%i5
	movrgz	%l5,	%l4,	%o2
	movvc	%icc,	%l1,	%o7
	tvc	%xcc,	0x1
	fbuge	%fcc3,	loop_2016
	tsubcc	%i2,	0x039D,	%o5
	fbne	%fcc1,	loop_2017
	movpos	%icc,	%g1,	%g3
loop_2016:
	tcc	%icc,	0x4
	array8	%o4,	%l3,	%g5
loop_2017:
	addccc	%g2,	0x1018,	%g6
	tleu	%icc,	0x6
	bne	%xcc,	loop_2018
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l6,	%i1,	%l2
	prefetch	[%l7 + 0x34],	 0x3
loop_2018:
	fmul8ulx16	%f22,	%f10,	%f18
	faligndata	%f14,	%f6,	%f8
	srlx	%l0,	%o1,	%g4
	fbo,a	%fcc1,	loop_2019
	bvc,a,pt	%xcc,	loop_2020
	orn	%i4,	0x0252,	%i7
	move	%icc,	%o6,	%o0
loop_2019:
	fblg,a	%fcc2,	loop_2021
loop_2020:
	fba,a	%fcc2,	loop_2022
	sub	%i6,	0x0B30,	%g7
	orn	%i3,	0x04CA,	%i0
loop_2021:
	fmovdvs	%icc,	%f28,	%f11
loop_2022:
	subc	%o3,	0x0DB4,	%l5
	call	loop_2023
	fmovdcc	%icc,	%f21,	%f2
	movge	%icc,	%l4,	%o2
	array16	%l1,	%i5,	%o7
loop_2023:
	ldd	[%l7 + 0x20],	%f6
	membar	0x55
	sll	%o5,	0x06,	%i2
	udiv	%g1,	0x0AB7,	%o4
	bne,a	loop_2024
	fbuge	%fcc3,	loop_2025
	xnorcc	%g3,	0x1F08,	%g5
	movgu	%icc,	%l3,	%g6
loop_2024:
	nop
	set	0x108, %l2
	stxa	%l6,	[%g0 + %l2] 0x21
loop_2025:
	st	%f4,	[%l7 + 0x10]
	subc	%g2,	%l2,	%l0
	fbne	%fcc0,	loop_2026
	andn	%o1,	0x148D,	%i1
	movleu	%icc,	%g4,	%i4
	movrne	%o6,	%i7,	%o0
loop_2026:
	sdivcc	%i6,	0x1983,	%i3
	tsubcc	%i0,	%o3,	%g7
	sdiv	%l4,	0x1831,	%o2
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x42] %asi,	%l5
	fmovdleu	%xcc,	%f5,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i5,	%o7,	%o5
	edge32l	%l1,	%i2,	%o4
	fbge	%fcc1,	loop_2027
	bleu,a	%xcc,	loop_2028
	tleu	%xcc,	0x4
	sir	0x064A
loop_2027:
	prefetch	[%l7 + 0x4C],	 0x2
loop_2028:
	fmovsvs	%xcc,	%f5,	%f16
	fbn	%fcc1,	loop_2029
	addc	%g1,	%g3,	%g5
	bn,a,pn	%xcc,	loop_2030
	orncc	%g6,	0x0EA4,	%l3
loop_2029:
	bge,a	loop_2031
	edge8ln	%g2,	%l2,	%l6
loop_2030:
	edge16ln	%l0,	%i1,	%o1
	fbue	%fcc3,	loop_2032
loop_2031:
	mulscc	%i4,	%o6,	%i7
	orn	%o0,	%g4,	%i3
	sll	%i0,	%o3,	%g7
loop_2032:
	fpmerge	%f11,	%f6,	%f24
	tne	%xcc,	0x3
	fmovsvc	%xcc,	%f16,	%f29
	move	%icc,	%l4,	%o2
	set	0x18, %i6
	stba	%l5,	[%l7 + %i6] 0x88
	tg	%xcc,	0x7
	fmovsge	%xcc,	%f2,	%f3
	umul	%i6,	0x1576,	%i5
	ba,pt	%icc,	loop_2033
	array32	%o7,	%o5,	%i2
	fpadd16	%f18,	%f24,	%f2
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x0c
loop_2033:
	fpackfix	%f10,	%f10
	fpadd16	%f12,	%f8,	%f30
	orncc	%l1,	0x1C4F,	%g1
	fxnor	%f12,	%f6,	%f30
	udiv	%o4,	0x05B3,	%g5
	movcc	%xcc,	%g6,	%g3
	edge16	%l3,	%g2,	%l6
	edge32	%l0,	%i1,	%l2
	tneg	%icc,	0x3
	fblg,a	%fcc0,	loop_2034
	fcmpeq16	%f28,	%f14,	%i4
	fmovrdgez	%o6,	%f18,	%f12
	siam	0x3
loop_2034:
	fands	%f5,	%f30,	%f14
	umulcc	%o1,	0x0AC5,	%i7
	array8	%g4,	%i3,	%o0
	stb	%i0,	[%l7 + 0x7D]
	movvc	%xcc,	%g7,	%l4
	subccc	%o3,	%l5,	%o2
	fbl,a	%fcc3,	loop_2035
	movrlz	%i6,	0x0D8,	%i5
	fmovdn	%icc,	%f20,	%f5
	std	%o6,	[%l7 + 0x48]
loop_2035:
	xor	%i2,	0x1932,	%l1
	subcc	%g1,	%o5,	%g5
	subc	%o4,	0x1995,	%g3
	move	%icc,	%l3,	%g2
	fmovrslez	%l6,	%f13,	%f28
	edge32ln	%g6,	%i1,	%l2
	xorcc	%i4,	%l0,	%o6
	fmovrslez	%i7,	%f26,	%f8
	movrgez	%o1,	%i3,	%o0
	fnot2s	%f25,	%f11
	andncc	%i0,	%g4,	%g7
	sub	%o3,	%l4,	%o2
	prefetch	[%l7 + 0x10],	 0x2
	ldsw	[%l7 + 0x0C],	%i6
	movn	%xcc,	%l5,	%o7
	addcc	%i2,	0x16DB,	%i5
	ldub	[%l7 + 0x1F],	%g1
	prefetch	[%l7 + 0x64],	 0x3
	pdist	%f22,	%f8,	%f2
	wr	%g0,	0x88,	%asi
	stha	%l1,	[%l7 + 0x1E] %asi
	set	0x4D, %l3
	ldstuba	[%l7 + %l3] 0x0c,	%g5
	sdivcc	%o4,	0x0393,	%g3
	fnegs	%f23,	%f13
	fornot1s	%f24,	%f22,	%f8
	ldsw	[%l7 + 0x58],	%o5
	tpos	%icc,	0x1
	set	0x38, %l0
	stxa	%g2,	[%l7 + %l0] 0x04
	addcc	%l3,	%g6,	%i1
	wr	%g0,	0x80,	%asi
	stha	%l2,	[%l7 + 0x4E] %asi
	array32	%l6,	%l0,	%o6
	srlx	%i4,	0x0F,	%i7
	subccc	%o1,	0x099A,	%o0
	fmovdne	%xcc,	%f26,	%f2
	edge16	%i3,	%i0,	%g4
	nop
	setx	loop_2036,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdlez	%g7,	%f20,	%f20
	fcmpeq32	%f24,	%f28,	%o3
	set	0x4F, %o4
	stba	%o2,	[%l7 + %o4] 0x0c
loop_2036:
	nop
	set	0x62, %g6
	sth	%i6,	[%l7 + %g6]
	udivcc	%l4,	0x1B46,	%l5
	addcc	%i2,	0x0927,	%o7
	andcc	%g1,	0x03E1,	%i5
	addcc	%g5,	%l1,	%g3
	edge16l	%o4,	%o5,	%l3
	xorcc	%g6,	%g2,	%l2
	andncc	%l6,	%i1,	%o6
	brlz	%i4,	loop_2037
	umul	%l0,	0x1D92,	%o1
	lduh	[%l7 + 0x20],	%o0
	fmovdgu	%icc,	%f26,	%f1
loop_2037:
	movrlez	%i3,	0x32E,	%i7
	andn	%i0,	%g7,	%o3
	and	%g4,	%o2,	%i6
	sdivcc	%l4,	0x0EE1,	%i2
	fmovdleu	%xcc,	%f12,	%f20
	fnegs	%f11,	%f24
	fmovspos	%xcc,	%f24,	%f4
	bge,a	loop_2038
	fcmps	%fcc3,	%f27,	%f12
	nop
	setx	loop_2039,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%icc,	%o7,	%l5
loop_2038:
	andcc	%g1,	%i5,	%l1
	array8	%g5,	%o4,	%o5
loop_2039:
	tleu	%icc,	0x2
	fmovsvs	%icc,	%f20,	%f14
	tcc	%xcc,	0x0
	movpos	%icc,	%l3,	%g3
	fnot2s	%f5,	%f10
	movneg	%xcc,	%g2,	%g6
	andncc	%l2,	%l6,	%o6
	srlx	%i4,	%i1,	%l0
	alignaddrl	%o1,	%i3,	%i7
	set	0x15, %g3
	ldstuba	[%l7 + %g3] 0x0c,	%o0
	tle	%icc,	0x7
	sdiv	%g7,	0x0E6D,	%o3
	movle	%xcc,	%i0,	%g4
	umul	%i6,	0x025B,	%l4
	tneg	%icc,	0x2
	sll	%o2,	0x12,	%o7
	mova	%icc,	%i2,	%l5
	fornot2	%f18,	%f16,	%f14
	fandnot1s	%f23,	%f19,	%f12
	movne	%icc,	%g1,	%i5
	ba	%xcc,	loop_2040
	tl	%xcc,	0x0
	fbne	%fcc2,	loop_2041
	udiv	%g5,	0x1BC2,	%o4
loop_2040:
	fcmped	%fcc1,	%f4,	%f22
	wr	%g0,	0xe3,	%asi
	stha	%l1,	[%l7 + 0x60] %asi
	membar	#Sync
loop_2041:
	fmovsvc	%icc,	%f14,	%f12
	set	0x36, %g1
	stba	%o5,	[%l7 + %g1] 0x81
	tleu	%xcc,	0x2
	fmovd	%f0,	%f28
	tgu	%icc,	0x1
	movrgez	%l3,	0x0FC,	%g2
	bcs	%icc,	loop_2042
	fbg	%fcc0,	loop_2043
	fmovrsne	%g3,	%f16,	%f17
	fpsub32s	%f27,	%f17,	%f22
loop_2042:
	fbe,a	%fcc3,	loop_2044
loop_2043:
	srax	%l2,	0x03,	%l6
	sir	0x1B5A
	tsubcc	%o6,	0x1EC4,	%g6
loop_2044:
	alignaddr	%i4,	%i1,	%l0
	fcmpeq16	%f6,	%f14,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i7,	%i3,	%o0
	xnorcc	%o3,	%i0,	%g4
	tpos	%xcc,	0x0
	edge16n	%i6,	%l4,	%g7
	fba	%fcc1,	loop_2045
	fcmpne16	%f0,	%f18,	%o2
	subc	%o7,	0x09D0,	%i2
	xor	%g1,	%l5,	%i5
loop_2045:
	subcc	%o4,	%g5,	%o5
	fnands	%f23,	%f4,	%f21
	bleu,a,pt	%xcc,	loop_2046
	edge32ln	%l1,	%g2,	%l3
	tsubcctv	%g3,	%l2,	%o6
	movcs	%xcc,	%l6,	%g6
loop_2046:
	movneg	%xcc,	%i4,	%i1
	fmul8x16au	%f14,	%f5,	%f12
	addcc	%l0,	%i7,	%o1
	fmovsvc	%icc,	%f9,	%f17
	edge8	%o0,	%o3,	%i3
	fbuge	%fcc1,	loop_2047
	fcmpeq16	%f8,	%f18,	%i0
	orn	%i6,	%g4,	%g7
	sub	%l4,	0x183C,	%o2
loop_2047:
	andncc	%o7,	%g1,	%i2
	smul	%l5,	0x161A,	%o4
	udivcc	%g5,	0x0F88,	%o5
	fmovrsne	%l1,	%f23,	%f29
	srlx	%i5,	0x01,	%l3
	fmovrsgz	%g2,	%f16,	%f16
	srlx	%g3,	0x1F,	%l2
	movn	%xcc,	%l6,	%o6
	call	loop_2048
	alignaddr	%i4,	%g6,	%i1
	sdivx	%l0,	0x0391,	%i7
	edge32	%o1,	%o3,	%i3
loop_2048:
	fmovscs	%icc,	%f16,	%f12
	fmovrslez	%i0,	%f14,	%f25
	srlx	%i6,	0x04,	%o0
	tcs	%xcc,	0x1
	subccc	%g7,	%l4,	%o2
	fbu,a	%fcc0,	loop_2049
	nop
	setx	loop_2050,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subc	%g4,	0x0736,	%o7
	set	0x12, %o5
	ldsha	[%l7 + %o5] 0x18,	%i2
loop_2049:
	te	%xcc,	0x6
loop_2050:
	fmovsleu	%xcc,	%f10,	%f4
	fblg	%fcc3,	loop_2051
	fors	%f9,	%f23,	%f8
	taddcc	%g1,	%l5,	%o4
	swap	[%l7 + 0x78],	%g5
loop_2051:
	te	%xcc,	0x2
	popc	0x1902,	%o5
	movgu	%xcc,	%i5,	%l1
	edge16l	%g2,	%g3,	%l3
	udivcc	%l6,	0x1B82,	%l2
	and	%o6,	%g6,	%i1
	ld	[%l7 + 0x18],	%f18
	siam	0x5
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movneg	%icc,	%i4,	%i7
	fzeros	%f24
	fbne,a	%fcc2,	loop_2052
	fmovdleu	%xcc,	%f13,	%f23
	addc	%o1,	%l0,	%i3
	mulx	%i0,	0x048A,	%i6
loop_2052:
	tn	%xcc,	0x0
	orn	%o0,	0x0783,	%o3
	fnot1	%f6,	%f20
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%o2
	fmovrdlez	%g7,	%f8,	%f4
	srlx	%o7,	%g4,	%i2
	bge,pt	%xcc,	loop_2053
	subccc	%g1,	%l5,	%o4
	array8	%g5,	%i5,	%l1
	movne	%xcc,	%g2,	%g3
loop_2053:
	lduh	[%l7 + 0x54],	%o5
	tcc	%xcc,	0x5
	edge8l	%l3,	%l6,	%o6
	lduh	[%l7 + 0x5A],	%l2
	edge8l	%i1,	%g6,	%i4
	movcs	%icc,	%i7,	%l0
	fblg	%fcc1,	loop_2054
	edge32l	%i3,	%i0,	%o1
	movle	%icc,	%i6,	%o0
	edge8l	%l4,	%o2,	%g7
loop_2054:
	taddcc	%o7,	%g4,	%i2
	fmovdleu	%icc,	%f7,	%f5
	tle	%xcc,	0x7
	smulcc	%o3,	0x1CC3,	%g1
	brnz	%o4,	loop_2055
	bvc,a,pn	%xcc,	loop_2056
	sllx	%g5,	%l5,	%l1
	udivcc	%g2,	0x1154,	%i5
loop_2055:
	movneg	%icc,	%g3,	%l3
loop_2056:
	movrne	%o5,	0x260,	%l6
	movle	%xcc,	%l2,	%i1
	orn	%g6,	0x0FB7,	%i4
	bvs,a,pn	%icc,	loop_2057
	and	%o6,	%l0,	%i7
	sra	%i3,	0x01,	%i0
	andncc	%i6,	%o1,	%l4
loop_2057:
	ldsh	[%l7 + 0x66],	%o2
	srl	%g7,	0x06,	%o7
	movcs	%xcc,	%g4,	%i2
	movpos	%xcc,	%o0,	%o3
	tsubcc	%o4,	%g1,	%g5
	fpack16	%f30,	%f30
	mulx	%l1,	%g2,	%i5
	nop
	set	0x38, %i5
	ldub	[%l7 + %i5],	%l5
	tl	%icc,	0x0
	set	0x28, %g5
	sta	%f30,	[%l7 + %g5] 0x15
	fone	%f22
	fbo,a	%fcc3,	loop_2058
	movg	%icc,	%g3,	%o5
	brlz	%l3,	loop_2059
	addcc	%l2,	0x0E69,	%i1
loop_2058:
	nop
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%l6
loop_2059:
	fmovrsgz	%o6,	%f12,	%f9
	tcc	%xcc,	0x5
	sethi	0x1AC7,	%i4
	ldd	[%l7 + 0x48],	%l0
	wr	%g0,	0x0c,	%asi
	sta	%f0,	[%l7 + 0x40] %asi
	tleu	%icc,	0x5
	mulscc	%i7,	%i0,	%i6
	tn	%icc,	0x0
	fbul,a	%fcc1,	loop_2060
	andn	%i3,	0x0027,	%o1
	orncc	%l4,	0x11DA,	%g7
	te	%xcc,	0x3
loop_2060:
	fmovdvs	%xcc,	%f0,	%f14
	movl	%xcc,	%o7,	%g4
	ba,a,pt	%xcc,	loop_2061
	tsubcc	%i2,	%o2,	%o3
	mova	%xcc,	%o0,	%g1
	movrgz	%o4,	%g5,	%g2
loop_2061:
	smul	%l1,	0x1CDC,	%l5
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x11,	%f16
	movrne	%i5,	0x3C8,	%g3
	edge32	%o5,	%l2,	%l3
	flush	%l7 + 0x3C
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g6
	set	0x60, %i0
	lda	[%l7 + %i0] 0x19,	%f6
	brz	%i1,	loop_2062
	fpmerge	%f25,	%f19,	%f16
	movrlz	%l6,	%i4,	%l0
	subc	%o6,	%i0,	%i6
loop_2062:
	xnor	%i3,	0x02FA,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l4,	%g7,	%o1
	addcc	%g4,	0x01C3,	%i2
	bcc,a,pn	%icc,	loop_2063
	fpack16	%f28,	%f17
	nop
	set	0x40, %g2
	ldstub	[%l7 + %g2],	%o7
	tsubcc	%o3,	%o0,	%o2
loop_2063:
	nop
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x89,	 0x0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x39] %asi,	%g5
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	sll	%g1,	%l1,	%l5
	nop
	set	0x42, %i3
	stb	%g2,	[%l7 + %i3]
	tne	%xcc,	0x7
	movcs	%xcc,	%g3,	%i5
	fcmped	%fcc2,	%f8,	%f2
	tg	%xcc,	0x4
	edge32l	%o5,	%l3,	%g6
	umulcc	%i1,	%l6,	%l2
	move	%xcc,	%i4,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i0,	%i6,	%l0
	fmovs	%f21,	%f25
	tsubcc	%i3,	%i7,	%l4
	fmovrdlez	%o1,	%f18,	%f26
	bvc,a,pt	%icc,	loop_2064
	movrgz	%g4,	0x309,	%g7
	fpack32	%f26,	%f8,	%f18
	tleu	%icc,	0x2
loop_2064:
	brnz,a	%i2,	loop_2065
	movl	%xcc,	%o7,	%o3
	tneg	%xcc,	0x6
	subc	%o2,	0x1BA8,	%o4
loop_2065:
	nop
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sllx	%g5,	0x0C,	%g1
	tgu	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	stwa	%l1,	[%l7 + 0x0C] %asi
	movne	%icc,	%o0,	%l5
	edge8ln	%g3,	%g2,	%o5
	be,pt	%xcc,	loop_2066
	fnegs	%f15,	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l3,	%i5
loop_2066:
	bg,pt	%xcc,	loop_2067
	fmovrslz	%i1,	%f31,	%f25
	wr	%g0,	0xea,	%asi
	stxa	%l6,	[%l7 + 0x50] %asi
	membar	#Sync
loop_2067:
	bleu,a,pn	%icc,	loop_2068
	movgu	%icc,	%g6,	%l2
	mulx	%i4,	0x1466,	%o6
	sir	0x121B
loop_2068:
	tn	%xcc,	0x7
	fmovrse	%i0,	%f28,	%f13
	set	0x70, %i1
	stha	%i6,	[%l7 + %i1] 0x88
	fba	%fcc3,	loop_2069
	fpsub32s	%f5,	%f27,	%f22
	stx	%i3,	[%l7 + 0x08]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2069:
	nop
	set	0x10, %o3
	stda	%i6,	[%l7 + %o3] 0x2f
	membar	#Sync
	brgez	%l4,	loop_2070
	bneg,a,pt	%icc,	loop_2071
	membar	0x1C
	be,a,pn	%xcc,	loop_2072
loop_2070:
	brgez,a	%l0,	loop_2073
loop_2071:
	fmuld8sux16	%f30,	%f1,	%f28
	fmovdne	%xcc,	%f11,	%f14
loop_2072:
	bvc,pn	%xcc,	loop_2074
loop_2073:
	sir	0x0C7F
	addc	%g4,	0x071D,	%g7
	edge32l	%o1,	%i2,	%o7
loop_2074:
	fand	%f26,	%f24,	%f6
	tcc	%xcc,	0x1
	fxor	%f28,	%f2,	%f18
	orn	%o3,	0x0BC3,	%o2
	xnorcc	%o4,	%g5,	%l1
	taddcc	%o0,	%g1,	%l5
	fbule	%fcc3,	loop_2075
	movvs	%xcc,	%g2,	%g3
	fbn,a	%fcc0,	loop_2076
	fbe,a	%fcc3,	loop_2077
loop_2075:
	fmul8x16	%f5,	%f26,	%f24
	mova	%xcc,	%o5,	%i5
loop_2076:
	sdiv	%i1,	0x0EE4,	%l6
loop_2077:
	fbn,a	%fcc1,	loop_2078
	fbule	%fcc1,	loop_2079
	fcmpgt16	%f18,	%f18,	%g6
	fmovdleu	%icc,	%f15,	%f0
loop_2078:
	fmovrsgz	%l3,	%f8,	%f5
loop_2079:
	movleu	%icc,	%l2,	%i4
	orn	%o6,	0x090F,	%i6
	bl,a	%icc,	loop_2080
	bg,a	loop_2081
	tgu	%icc,	0x3
	membar	0x63
loop_2080:
	fmovrsne	%i0,	%f3,	%f5
loop_2081:
	fmovrdlz	%i7,	%f20,	%f4
	bvc,pn	%xcc,	loop_2082
	movne	%xcc,	%i3,	%l0
	alignaddrl	%l4,	%g4,	%g7
	addccc	%o1,	0x044B,	%o7
loop_2082:
	edge16l	%i2,	%o2,	%o3
	set	0x78, %o2
	lduwa	[%l7 + %o2] 0x15,	%o4
	set	0x14, %l1
	sta	%f22,	[%l7 + %l1] 0x15
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x04
	tsubcc	%g5,	%o0,	%g1
	fbe	%fcc2,	loop_2083
	edge16n	%l1,	%l5,	%g3
	sll	%g2,	0x0F,	%o5
	addc	%i5,	%l6,	%i1
loop_2083:
	and	%g6,	%l3,	%i4
	fmovd	%f20,	%f18
	movcc	%icc,	%l2,	%o6
	andcc	%i6,	%i7,	%i0
	tleu	%icc,	0x0
	brlz	%l0,	loop_2084
	fbl	%fcc3,	loop_2085
	subcc	%i3,	%l4,	%g7
	fbue	%fcc3,	loop_2086
loop_2084:
	fmovrdlez	%g4,	%f14,	%f24
loop_2085:
	andn	%o1,	%i2,	%o7
	smul	%o3,	%o2,	%g5
loop_2086:
	andcc	%o4,	%o0,	%g1
	flush	%l7 + 0x34
	edge8ln	%l1,	%g3,	%l5
	fmovsleu	%xcc,	%f21,	%f0
	ta	%icc,	0x7
	bn,a,pn	%icc,	loop_2087
	movge	%icc,	%o5,	%i5
	tgu	%icc,	0x1
	sdivcc	%g2,	0x06C6,	%i1
loop_2087:
	taddcc	%l6,	0x1661,	%l3
	fmovsa	%icc,	%f30,	%f31
	tge	%xcc,	0x7
	tvc	%icc,	0x1
	be,pn	%xcc,	loop_2088
	and	%i4,	0x1FBA,	%g6
	wr	%g0,	0x0c,	%asi
	sta	%f7,	[%l7 + 0x08] %asi
loop_2088:
	fmovdl	%icc,	%f29,	%f16
	tsubcctv	%o6,	%l2,	%i6
	fmovsvc	%xcc,	%f5,	%f13
	edge8l	%i7,	%l0,	%i0
	addccc	%i3,	0x0828,	%g7
	movge	%xcc,	%l4,	%g4
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x81,	%i2,	%o7
	fbug,a	%fcc3,	loop_2089
	tgu	%icc,	0x5
	faligndata	%f16,	%f28,	%f0
	std	%o2,	[%l7 + 0x30]
loop_2089:
	fmovsa	%xcc,	%f14,	%f27
	edge16ln	%o2,	%g5,	%o1
	smul	%o4,	%o0,	%l1
	movrlz	%g1,	%g3,	%l5
	fpsub16s	%f24,	%f9,	%f2
	tgu	%icc,	0x1
	alignaddrl	%i5,	%o5,	%i1
	edge8n	%g2,	%l3,	%l6
	srl	%g6,	%i4,	%o6
	fbl	%fcc0,	loop_2090
	tvs	%icc,	0x7
	fbn,a	%fcc3,	loop_2091
	fsrc2s	%f13,	%f2
loop_2090:
	nop
	set	0x0A, %o7
	stha	%l2,	[%l7 + %o7] 0xeb
	membar	#Sync
loop_2091:
	bcs,pn	%icc,	loop_2092
	fmovrslez	%i6,	%f16,	%f7
	fpackfix	%f0,	%f2
	te	%xcc,	0x1
loop_2092:
	flush	%l7 + 0x74
	stw	%i7,	[%l7 + 0x48]
	sir	0x05FB
	array8	%i0,	%i3,	%l0
	array32	%l4,	%g4,	%i2
	nop
	set	0x2C, %o6
	ldub	[%l7 + %o6],	%o7
	movge	%xcc,	%o3,	%g7
	addc	%g5,	%o1,	%o2
	nop
	setx	loop_2093,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%o4,	0x037E,	%o0
	wr	%g0,	0x19,	%asi
	stha	%g1,	[%l7 + 0x44] %asi
loop_2093:
	tneg	%icc,	0x5
	array8	%g3,	%l5,	%i5
	srax	%o5,	%l1,	%i1
	sethi	0x02AA,	%l3
	fpsub32	%f30,	%f22,	%f10
	call	loop_2094
	fmovdpos	%icc,	%f25,	%f1
	stx	%g2,	[%l7 + 0x08]
	addcc	%l6,	0x1907,	%i4
loop_2094:
	stw	%g6,	[%l7 + 0x38]
	mulscc	%o6,	0x1367,	%i6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%l2
	stb	%i0,	[%l7 + 0x22]
	membar	0x3B
	edge32	%i3,	%l0,	%l4
	wr	%g0,	0x27,	%asi
	stha	%g4,	[%l7 + 0x26] %asi
	membar	#Sync
	umul	%i2,	0x0F3C,	%o3
	add	%o7,	0x15C4,	%g5
	udiv	%o1,	0x1262,	%g7
	tcs	%xcc,	0x3
	sllx	%o4,	0x0D,	%o2
	tsubcc	%o0,	%g3,	%g1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x31] %asi,	%i5
	tcs	%xcc,	0x1
	smulcc	%o5,	0x0DA0,	%l5
	fmovdg	%xcc,	%f30,	%f28
	tge	%xcc,	0x7
	orncc	%i1,	0x179F,	%l3
	orcc	%l1,	%g2,	%i4
	sth	%l6,	[%l7 + 0x08]
	brgez,a	%o6,	loop_2095
	xnorcc	%g6,	%i7,	%l2
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x2A] %asi,	%i6
loop_2095:
	tg	%icc,	0x3
	tvs	%icc,	0x3
	udivx	%i3,	0x1C5C,	%l0
	mova	%icc,	%i0,	%g4
	brz	%i2,	loop_2096
	bcs	%xcc,	loop_2097
	fcmpeq16	%f2,	%f12,	%o3
	fmovrdne	%o7,	%f30,	%f26
loop_2096:
	nop
	set	0x34, %g4
	swapa	[%l7 + %g4] 0x10,	%l4
loop_2097:
	nop
	set	0x37, %l4
	ldsba	[%l7 + %l4] 0x15,	%g5
	tneg	%xcc,	0x7
	fbg	%fcc2,	loop_2098
	alignaddr	%g7,	%o4,	%o2
	bpos,a,pt	%icc,	loop_2099
	addcc	%o0,	0x1760,	%g3
loop_2098:
	sra	%g1,	%o1,	%o5
	fble	%fcc3,	loop_2100
loop_2099:
	array8	%i5,	%i1,	%l3
	te	%xcc,	0x2
	orncc	%l1,	0x1C87,	%g2
loop_2100:
	fmovdpos	%icc,	%f3,	%f14
	movn	%xcc,	%i4,	%l5
	movre	%o6,	%l6,	%i7
	brz,a	%g6,	loop_2101
	mulx	%i6,	0x0E9E,	%l2
	wr	%g0,	0xea,	%asi
	stha	%l0,	[%l7 + 0x3E] %asi
	membar	#Sync
loop_2101:
	movge	%xcc,	%i3,	%g4
	tpos	%icc,	0x6
	andn	%i0,	0x103E,	%i2
	movn	%icc,	%o7,	%o3
	sllx	%l4,	%g7,	%o4
	edge16l	%g5,	%o0,	%g3
	brgz	%g1,	loop_2102
	smul	%o1,	%o5,	%i5
	be,a	loop_2103
	andn	%i1,	0x185F,	%l3
loop_2102:
	sdivx	%o2,	0x0A5B,	%g2
	tsubcctv	%l1,	0x0F41,	%l5
loop_2103:
	fpadd32s	%f17,	%f20,	%f6
	set	0x78, %o1
	lduwa	[%l7 + %o1] 0x80,	%i4
	movn	%icc,	%o6,	%i7
	addc	%l6,	0x043D,	%i6
	wr	%g0,	0x81,	%asi
	stxa	%l2,	[%l7 + 0x70] %asi
	umul	%g6,	%l0,	%g4
	fmovsneg	%icc,	%f6,	%f16
	xnorcc	%i0,	0x17F2,	%i2
	sub	%o7,	%o3,	%l4
	tsubcctv	%i3,	0x0129,	%o4
	mova	%xcc,	%g7,	%g5
	alignaddr	%o0,	%g1,	%o1
	tleu	%xcc,	0x0
	movne	%xcc,	%g3,	%i5
	mulx	%o5,	%i1,	%l3
	edge8l	%g2,	%o2,	%l1
	set	0x20, %g7
	swapa	[%l7 + %g7] 0x80,	%i4
	bg,a,pt	%xcc,	loop_2104
	ldd	[%l7 + 0x70],	%l4
	sth	%o6,	[%l7 + 0x62]
	movge	%icc,	%i7,	%l6
loop_2104:
	tcc	%xcc,	0x6
	xnor	%l2,	%g6,	%i6
	call	loop_2105
	tvc	%xcc,	0x7
	edge16	%g4,	%i0,	%l0
	fmovdn	%xcc,	%f22,	%f18
loop_2105:
	nop
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x5B] %asi,	%i2
	edge32	%o3,	%o7,	%i3
	fcmped	%fcc2,	%f10,	%f0
	fmovrde	%l4,	%f6,	%f16
	fzero	%f30
	movrlez	%g7,	0x26D,	%g5
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x7E] %asi,	%o4
	movrlez	%g1,	0x312,	%o1
	sllx	%g3,	%i5,	%o5
	fmovrdlz	%i1,	%f16,	%f2
	std	%o0,	[%l7 + 0x28]
	fcmped	%fcc3,	%f22,	%f8
	fblg	%fcc2,	loop_2106
	fblg,a	%fcc1,	loop_2107
	fcmpes	%fcc3,	%f3,	%f11
	movleu	%icc,	%l3,	%o2
loop_2106:
	array16	%l1,	%i4,	%g2
loop_2107:
	array16	%o6,	%i7,	%l6
	tvs	%icc,	0x0
	movneg	%xcc,	%l5,	%g6
	bl,a,pt	%icc,	loop_2108
	fandnot2	%f24,	%f2,	%f14
	orn	%i6,	%l2,	%i0
	andncc	%g4,	%i2,	%l0
loop_2108:
	udivcc	%o3,	0x0639,	%o7
	tne	%icc,	0x0
	fpadd32s	%f9,	%f15,	%f24
	tpos	%icc,	0x1
	wr	%g0,	0x18,	%asi
	stha	%i3,	[%l7 + 0x0A] %asi
	lduw	[%l7 + 0x20],	%l4
	edge16l	%g5,	%g7,	%o4
	bg,a,pn	%xcc,	loop_2109
	fcmpne32	%f0,	%f0,	%o1
	movvs	%xcc,	%g3,	%i5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o5
loop_2109:
	udiv	%g1,	0x08BC,	%o0
	fmovrslez	%l3,	%f8,	%f2
	mova	%icc,	%i1,	%l1
	addccc	%o2,	0x167C,	%i4
	fcmpne32	%f0,	%f14,	%o6
	brgz	%g2,	loop_2110
	fmovdl	%xcc,	%f27,	%f14
	sir	0x0220
	edge8	%i7,	%l5,	%g6
loop_2110:
	or	%i6,	%l6,	%l2
	add	%g4,	%i2,	%l0
	call	loop_2111
	taddcc	%i0,	0x1537,	%o3
	movrlz	%i3,	0x35D,	%l4
	sth	%o7,	[%l7 + 0x56]
loop_2111:
	te	%xcc,	0x1
	sll	%g7,	0x04,	%g5
	taddcctv	%o1,	%g3,	%o4
	popc	0x1A5B,	%i5
	alignaddr	%g1,	%o0,	%o5
	brgz,a	%i1,	loop_2112
	srl	%l1,	0x12,	%o2
	fpadd32s	%f17,	%f8,	%f4
	bcc,a,pn	%icc,	loop_2113
loop_2112:
	tg	%xcc,	0x1
	sdiv	%i4,	0x11C1,	%o6
	wr	%g0,	0x2b,	%asi
	stwa	%l3,	[%l7 + 0x5C] %asi
	membar	#Sync
loop_2113:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%g2
	tpos	%icc,	0x5
	subccc	%l5,	0x12AA,	%i7
	tsubcc	%i6,	%g6,	%l6
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xnor	%l2,	0x1867,	%g4
	fnot1s	%f8,	%f30
	fmovscc	%xcc,	%f4,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l0,	0x39C,	%i0
	fpadd32	%f8,	%f6,	%f30
	ldx	[%l7 + 0x38],	%i2
	udivcc	%o3,	0x10ED,	%i3
	tl	%xcc,	0x2
	set	0x20, %o0
	stxa	%l4,	[%l7 + %o0] 0x18
	edge32ln	%o7,	%g5,	%g7
	movl	%xcc,	%o1,	%g3
	fmovdle	%xcc,	%f29,	%f19
	fmovsleu	%xcc,	%f24,	%f14
	sra	%o4,	0x0D,	%g1
	xor	%i5,	0x1629,	%o0
	movcc	%xcc,	%o5,	%l1
	tgu	%xcc,	0x0
	edge8n	%o2,	%i1,	%i4
	popc	0x1864,	%l3
	edge16	%g2,	%l5,	%o6
	movleu	%xcc,	%i6,	%g6
	smul	%l6,	%l2,	%i7
	brz,a	%l0,	loop_2114
	sdiv	%g4,	0x0695,	%i2
	ldub	[%l7 + 0x13],	%o3
	fmul8ulx16	%f24,	%f18,	%f2
loop_2114:
	addcc	%i3,	0x04F3,	%l4
	fbug	%fcc1,	loop_2115
	fmovrsne	%i0,	%f31,	%f12
	movvs	%icc,	%o7,	%g7
	bl	%xcc,	loop_2116
loop_2115:
	smul	%g5,	0x124A,	%g3
	tg	%xcc,	0x1
	movg	%icc,	%o1,	%o4
loop_2116:
	addccc	%i5,	%o0,	%g1
	srax	%l1,	%o5,	%i1
	edge32l	%i4,	%o2,	%l3
	srlx	%g2,	%o6,	%l5
	movne	%xcc,	%i6,	%l6
	sir	0x13E7
	fmovdne	%xcc,	%f18,	%f1
	udivx	%l2,	0x0661,	%i7
	tgu	%icc,	0x6
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x40] %asi,	%l0
	fcmpeq16	%f18,	%f2,	%g6
	fmovdle	%xcc,	%f29,	%f16
	fbe	%fcc2,	loop_2117
	mulx	%i2,	0x1721,	%o3
	tneg	%icc,	0x7
	ble	%xcc,	loop_2118
loop_2117:
	udivx	%g4,	0x111A,	%l4
	tcs	%icc,	0x1
	xnor	%i3,	0x054C,	%o7
loop_2118:
	edge16l	%g7,	%i0,	%g5
	subccc	%g3,	%o4,	%o1
	ldsb	[%l7 + 0x20],	%o0
	fmovrdgez	%g1,	%f24,	%f26
	fnot2s	%f3,	%f25
	or	%i5,	0x0F2C,	%l1
	subcc	%i1,	%o5,	%o2
	fmovscs	%xcc,	%f19,	%f3
	nop
	setx	loop_2119,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x64, %i4
	prefetch	[%l7 + %i4],	 0x3
	taddcc	%i4,	%g2,	%o6
	brlez,a	%l3,	loop_2120
loop_2119:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x0
	movpos	%xcc,	%l5,	%i6
loop_2120:
	nop
	set	0x71, %i6
	ldub	[%l7 + %i6],	%l2
	fmovdgu	%icc,	%f19,	%f25
	fbul,a	%fcc1,	loop_2121
	andncc	%l6,	%i7,	%l0
	fmul8ulx16	%f22,	%f2,	%f10
	orcc	%i2,	0x008E,	%o3
loop_2121:
	edge8ln	%g4,	%g6,	%l4
	xorcc	%o7,	0x042E,	%g7
	fbuge,a	%fcc2,	loop_2122
	bcc,a	loop_2123
	fcmpes	%fcc2,	%f27,	%f4
	ldd	[%l7 + 0x38],	%f28
loop_2122:
	fnand	%f24,	%f14,	%f26
loop_2123:
	xor	%i3,	%g5,	%g3
	udivx	%o4,	0x0ECD,	%i0
	fpadd16	%f30,	%f2,	%f30
	fzeros	%f29
	fba,a	%fcc2,	loop_2124
	andcc	%o1,	0x0A8B,	%g1
	sub	%o0,	%i5,	%l1
	nop
	setx	loop_2125,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2124:
	sllx	%o5,	0x17,	%o2
	movge	%icc,	%i4,	%i1
	fexpand	%f2,	%f0
loop_2125:
	edge32n	%g2,	%l3,	%o6
	tle	%xcc,	0x3
	tvs	%xcc,	0x4
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i6
	fmovrdlz	%l5,	%f26,	%f0
	set	0x3F, %l6
	stba	%l6,	[%l7 + %l6] 0x10
	movne	%icc,	%l2,	%l0
	flush	%l7 + 0x44
	membar	0x6A
	fmul8x16	%f22,	%f30,	%f14
	subccc	%i7,	%o3,	%g4
	bne,pn	%xcc,	loop_2126
	fmovsle	%xcc,	%f16,	%f28
	add	%i2,	0x115B,	%g6
	fandnot2s	%f24,	%f8,	%f4
loop_2126:
	fnegs	%f14,	%f13
	fmovscs	%xcc,	%f0,	%f12
	orncc	%o7,	%l4,	%i3
	tvc	%xcc,	0x6
	taddcc	%g5,	%g3,	%o4
	tcs	%xcc,	0x2
	fxnors	%f7,	%f8,	%f0
	fble,a	%fcc2,	loop_2127
	bcc,a,pn	%icc,	loop_2128
	subccc	%g7,	%i0,	%o1
	fmovrslez	%o0,	%f19,	%f5
loop_2127:
	te	%icc,	0x6
loop_2128:
	movne	%icc,	%i5,	%l1
	array16	%g1,	%o5,	%o2
	ld	[%l7 + 0x7C],	%f8
	add	%i4,	0x04A6,	%g2
	fands	%f28,	%f9,	%f7
	brz,a	%i1,	loop_2129
	sdivcc	%l3,	0x0AAF,	%i6
	fcmpd	%fcc0,	%f4,	%f26
	movrgez	%o6,	0x256,	%l5
loop_2129:
	edge16	%l2,	%l6,	%l0
	fmovrdne	%i7,	%f18,	%f10
	set	0x58, %l3
	prefetcha	[%l7 + %l3] 0x14,	 0x1
	movge	%icc,	%o3,	%i2
	movrgz	%o7,	0x389,	%l4
	sub	%g6,	%g5,	%g3
	fblg,a	%fcc2,	loop_2130
	edge8l	%o4,	%i3,	%g7
	fbuge,a	%fcc0,	loop_2131
	smulcc	%i0,	0x0F68,	%o1
loop_2130:
	array16	%i5,	%l1,	%g1
	fmul8x16	%f15,	%f30,	%f6
loop_2131:
	fsrc2s	%f11,	%f7
	edge16l	%o0,	%o2,	%o5
	add	%i4,	0x1123,	%i1
	fandnot2	%f30,	%f20,	%f24
	fnegs	%f15,	%f23
	tgu	%icc,	0x3
	fcmpeq16	%f28,	%f8,	%g2
	movne	%icc,	%l3,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a	loop_2132
	fbn	%fcc3,	loop_2133
	tle	%icc,	0x3
	tcs	%icc,	0x0
loop_2132:
	brlez	%o6,	loop_2134
loop_2133:
	movle	%icc,	%l5,	%l2
	taddcc	%l0,	%l6,	%i7
	movge	%xcc,	%o3,	%i2
loop_2134:
	ldstub	[%l7 + 0x31],	%o7
	fpack32	%f26,	%f24,	%f18
	fzeros	%f14
	xor	%g4,	0x130D,	%g6
	sethi	0x0A41,	%g5
	fmovrsne	%l4,	%f4,	%f6
	orcc	%o4,	0x1858,	%i3
	ld	[%l7 + 0x30],	%f3
	udivcc	%g3,	0x0851,	%i0
	addcc	%o1,	0x0750,	%g7
	bvs,a	%icc,	loop_2135
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l1,	%i5,	%o0
	sth	%o2,	[%l7 + 0x32]
loop_2135:
	bpos	loop_2136
	edge16l	%o5,	%i4,	%i1
	ldd	[%l7 + 0x20],	%f22
	fmuld8ulx16	%f14,	%f11,	%f16
loop_2136:
	ldx	[%l7 + 0x30],	%g1
	movrgz	%g2,	0x161,	%l3
	fcmpgt32	%f28,	%f28,	%i6
	stx	%l5,	[%l7 + 0x38]
	tvs	%xcc,	0x4
	array16	%o6,	%l2,	%l0
	or	%i7,	0x0588,	%l6
	fbne,a	%fcc1,	loop_2137
	prefetch	[%l7 + 0x20],	 0x3
	tn	%icc,	0x3
	fmovdcc	%icc,	%f21,	%f18
loop_2137:
	st	%f31,	[%l7 + 0x78]
	sub	%o3,	0x1F6A,	%i2
	srl	%g4,	%g6,	%o7
	bneg,a	%icc,	loop_2138
	or	%g5,	%l4,	%o4
	fnor	%f14,	%f8,	%f10
	tne	%xcc,	0x1
loop_2138:
	movneg	%xcc,	%i3,	%i0
	movre	%g3,	0x054,	%o1
	tle	%icc,	0x3
	andncc	%l1,	%g7,	%i5
	movneg	%xcc,	%o2,	%o5
	mulx	%o0,	0x10B4,	%i1
	tg	%icc,	0x1
	brz,a	%g1,	loop_2139
	ldsh	[%l7 + 0x7A],	%i4
	tsubcc	%l3,	0x1FB7,	%g2
	fnegs	%f28,	%f12
loop_2139:
	addccc	%i6,	0x01CC,	%l5
	xorcc	%l2,	0x0826,	%o6
	sdiv	%i7,	0x1EC7,	%l6
	fsrc2	%f6,	%f24
	srax	%o3,	%l0,	%g4
	addc	%i2,	0x110F,	%g6
	fcmpgt16	%f20,	%f24,	%o7
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbu	%fcc1,	loop_2140
	tneg	%xcc,	0x7
	movre	%g5,	%l4,	%i3
	xnorcc	%i0,	0x09D3,	%g3
loop_2140:
	mulx	%o1,	%o4,	%l1
	tvs	%xcc,	0x6
	ldd	[%l7 + 0x50],	%f28
	movrne	%g7,	0x15E,	%i5
	swap	[%l7 + 0x70],	%o2
	edge32l	%o5,	%i1,	%o0
	be,pt	%icc,	loop_2141
	std	%i4,	[%l7 + 0x38]
	fone	%f4
	tsubcctv	%l3,	0x1086,	%g2
loop_2141:
	tcs	%icc,	0x4
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x80,	%i6
	wr	%g0,	0xe2,	%asi
	stwa	%l5,	[%l7 + 0x70] %asi
	membar	#Sync
	add	%l2,	%g1,	%o6
	udivcc	%i7,	0x03AA,	%l6
	mova	%xcc,	%o3,	%l0
	fand	%f30,	%f18,	%f26
	edge32ln	%g4,	%i2,	%o7
	bvs,pt	%icc,	loop_2142
	ldx	[%l7 + 0x30],	%g6
	stbar
	movn	%icc,	%l4,	%g5
loop_2142:
	srl	%i3,	0x09,	%i0
	fornot1	%f4,	%f14,	%f18
	srl	%g3,	0x01,	%o1
	be,pn	%xcc,	loop_2143
	tsubcctv	%l1,	%g7,	%i5
	smul	%o2,	0x128B,	%o5
	bn,pt	%xcc,	loop_2144
loop_2143:
	edge8n	%i1,	%o4,	%o0
	fmovscc	%xcc,	%f5,	%f6
	fba	%fcc3,	loop_2145
loop_2144:
	orncc	%i4,	%g2,	%l3
	taddcc	%i6,	%l2,	%g1
	fba,a	%fcc2,	loop_2146
loop_2145:
	fmovsneg	%xcc,	%f1,	%f12
	smul	%o6,	0x02FD,	%l5
	fpack32	%f2,	%f26,	%f10
loop_2146:
	tl	%icc,	0x2
	fbule	%fcc1,	loop_2147
	tge	%xcc,	0x2
	sethi	0x082F,	%l6
	movn	%icc,	%i7,	%l0
loop_2147:
	edge8n	%g4,	%i2,	%o7
	std	%g6,	[%l7 + 0x78]
	udivcc	%o3,	0x10BA,	%g5
	udivcc	%l4,	0x0B24,	%i3
	subcc	%i0,	0x08B2,	%o1
	movne	%xcc,	%l1,	%g3
	brgz	%i5,	loop_2148
	fmovsgu	%xcc,	%f27,	%f6
	tvc	%icc,	0x4
	movn	%icc,	%g7,	%o5
loop_2148:
	sllx	%i1,	0x03,	%o2
	fandnot2s	%f4,	%f24,	%f13
	movge	%icc,	%o0,	%i4
	stbar
	subccc	%g2,	%o4,	%l3
	siam	0x1
	addcc	%l2,	0x0F13,	%g1
	edge16ln	%i6,	%o6,	%l6
	movrne	%i7,	%l0,	%g4
	bgu,a	loop_2149
	tvs	%xcc,	0x0
	prefetch	[%l7 + 0x6C],	 0x0
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%l5
loop_2149:
	nop
	set	0x50, %o4
	ldswa	[%l7 + %o4] 0x18,	%o7
	array32	%i2,	%g6,	%g5
	edge32l	%o3,	%i3,	%i0
	movle	%xcc,	%o1,	%l4
	movl	%xcc,	%g3,	%l1
	movre	%g7,	0x237,	%o5
	taddcctv	%i1,	%o2,	%o0
	set	0x60, %l0
	ldsha	[%l7 + %l0] 0x11,	%i4
	siam	0x5
	mulx	%i5,	%g2,	%l3
	tsubcctv	%o4,	0x0E95,	%g1
	bneg,a,pn	%xcc,	loop_2150
	tle	%xcc,	0x1
	ldd	[%l7 + 0x28],	%i6
	movrgz	%o6,	0x070,	%l6
loop_2150:
	fzero	%f28
	sll	%l2,	0x06,	%l0
	sdivcc	%g4,	0x0398,	%l5
	brgez,a	%o7,	loop_2151
	stb	%i2,	[%l7 + 0x73]
	fones	%f22
	xnor	%i7,	%g6,	%g5
loop_2151:
	fmovsle	%xcc,	%f2,	%f20
	fmul8ulx16	%f22,	%f4,	%f22
	tn	%icc,	0x4
	move	%icc,	%o3,	%i0
	edge32ln	%o1,	%i3,	%g3
	bg,pn	%xcc,	loop_2152
	fpack32	%f20,	%f28,	%f4
	and	%l4,	%l1,	%g7
	alignaddr	%i1,	%o2,	%o5
loop_2152:
	popc	%i4,	%i5
	movg	%xcc,	%g2,	%l3
	movre	%o4,	%o0,	%g1
	fone	%f0
	edge16ln	%o6,	%l6,	%i6
	ldstub	[%l7 + 0x10],	%l2
	swap	[%l7 + 0x30],	%l0
	or	%l5,	0x1ACD,	%g4
	sllx	%i2,	%i7,	%g6
	faligndata	%f26,	%f30,	%f28
	pdist	%f0,	%f28,	%f16
	membar	0x33
	movgu	%xcc,	%g5,	%o3
	movcc	%icc,	%i0,	%o1
	set	0x6A, %g3
	stba	%o7,	[%l7 + %g3] 0x2f
	membar	#Sync
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x70] %asi,	%g3
	edge16l	%i3,	%l4,	%g7
	tvs	%icc,	0x1
	edge16ln	%i1,	%l1,	%o5
	xnor	%i4,	%o2,	%i5
	fmovda	%icc,	%f0,	%f12
	fnand	%f30,	%f20,	%f10
	bne,pn	%xcc,	loop_2153
	fmovdl	%xcc,	%f9,	%f3
	fpack16	%f20,	%f22
	te	%icc,	0x7
loop_2153:
	edge32ln	%g2,	%o4,	%l3
	fpmerge	%f10,	%f22,	%f20
	mulscc	%g1,	0x03C7,	%o6
	movrgez	%l6,	%i6,	%o0
	stbar
	fmovrsgez	%l0,	%f12,	%f19
	fmul8x16al	%f10,	%f20,	%f16
	fpsub32	%f16,	%f22,	%f20
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	stbar
	movl	%xcc,	%l5,	%g4
	brgz,a	%i2,	loop_2154
	bshuffle	%f30,	%f24,	%f18
	fmovrse	%i7,	%f0,	%f5
	mova	%icc,	%l2,	%g5
loop_2154:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	array32	%o3,	%g6,	%i0
	fmovdgu	%icc,	%f17,	%f1
	tcc	%icc,	0x2
	fmovsvc	%xcc,	%f11,	%f20
	ldd	[%l7 + 0x70],	%f8
	movgu	%xcc,	%o1,	%o7
	movrgz	%g3,	0x296,	%l4
	fbne	%fcc2,	loop_2155
	bshuffle	%f22,	%f16,	%f4
	movne	%icc,	%g7,	%i1
	mulscc	%i3,	0x0EAB,	%o5
loop_2155:
	fmovdl	%icc,	%f27,	%f7
	xnor	%i4,	%l1,	%i5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4D] %asi,	%o2
	tgu	%xcc,	0x7
	wr	%g0,	0x10,	%asi
	stda	%o4,	[%l7 + 0x28] %asi
	set	0x2C, %g1
	stha	%l3,	[%l7 + %g1] 0x89
	srax	%g1,	0x0D,	%o6
	wr	%g0,	0x18,	%asi
	stda	%i6,	[%l7 + 0x70] %asi
	fbl	%fcc0,	loop_2156
	srax	%g2,	%i6,	%o0
	popc	0x1E69,	%l5
	tge	%xcc,	0x2
loop_2156:
	and	%l0,	0x0841,	%g4
	fbug,a	%fcc2,	loop_2157
	movvc	%icc,	%i7,	%l2
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x0c,	%f0
loop_2157:
	fxnor	%f28,	%f18,	%f24
	xor	%i2,	%g5,	%g6
	set	0x48, %i5
	stxa	%o3,	[%l7 + %i5] 0x0c
	edge32l	%o1,	%i0,	%g3
	fandnot1s	%f9,	%f8,	%f1
	ldsb	[%l7 + 0x7E],	%o7
	bneg,a	%icc,	loop_2158
	orncc	%g7,	%i1,	%l4
	edge32ln	%i3,	%o5,	%i4
	tsubcc	%l1,	%o2,	%i5
loop_2158:
	alignaddrl	%o4,	%g1,	%l3
	edge16ln	%o6,	%g2,	%l6
	udivcc	%o0,	0x1E00,	%i6
	tsubcc	%l5,	0x1139,	%l0
	edge32ln	%g4,	%l2,	%i7
	ldd	[%l7 + 0x70],	%g4
	subc	%i2,	%g6,	%o1
	fnegd	%f0,	%f24
	movgu	%xcc,	%o3,	%g3
	edge32	%i0,	%g7,	%i1
	movgu	%xcc,	%l4,	%i3
	movle	%xcc,	%o7,	%i4
	lduh	[%l7 + 0x0A],	%o5
	edge32ln	%l1,	%i5,	%o2
	nop
	set	0x14, %g5
	sth	%g1,	[%l7 + %g5]
	andn	%l3,	%o4,	%o6
	ta	%icc,	0x4
	fmovdge	%xcc,	%f8,	%f4
	sllx	%l6,	%o0,	%i6
	bne	loop_2159
	bshuffle	%f6,	%f20,	%f6
	tvc	%icc,	0x3
	tge	%icc,	0x5
loop_2159:
	array8	%g2,	%l0,	%g4
	sdiv	%l2,	0x052F,	%i7
	brlez,a	%l5,	loop_2160
	tcs	%xcc,	0x1
	bge,pt	%icc,	loop_2161
	sdivcc	%g5,	0x1B4C,	%i2
loop_2160:
	sir	0x0584
	lduw	[%l7 + 0x24],	%o1
loop_2161:
	fpadd32s	%f25,	%f24,	%f28
	brgz	%g6,	loop_2162
	fmovdl	%xcc,	%f12,	%f11
	xnorcc	%g3,	%i0,	%g7
	movcc	%icc,	%o3,	%i1
loop_2162:
	udivcc	%i3,	0x1205,	%l4
	fmovsl	%xcc,	%f17,	%f5
	addc	%i4,	%o7,	%l1
	udivcc	%i5,	0x1785,	%o2
	srax	%o5,	%l3,	%o4
	alignaddrl	%g1,	%o6,	%o0
	srlx	%l6,	0x18,	%i6
	movleu	%icc,	%l0,	%g4
	sir	0x1F3C
	sdivx	%l2,	0x11C1,	%i7
	std	%g2,	[%l7 + 0x50]
	add	%g5,	%i2,	%l5
	edge8	%o1,	%g3,	%g6
	fbge,a	%fcc2,	loop_2163
	orncc	%i0,	0x145F,	%o3
	fcmpd	%fcc3,	%f2,	%f28
	alignaddr	%i1,	%g7,	%i3
loop_2163:
	edge8n	%l4,	%o7,	%l1
	membar	0x22
	tsubcctv	%i5,	%o2,	%i4
	movne	%xcc,	%l3,	%o4
	fmovspos	%xcc,	%f18,	%f15
	xorcc	%o5,	0x1CC0,	%o6
	bn,a	loop_2164
	bleu	%xcc,	loop_2165
	andncc	%o0,	%g1,	%l6
	movcc	%xcc,	%l0,	%g4
loop_2164:
	fmovd	%f8,	%f4
loop_2165:
	sub	%l2,	0x014F,	%i7
	fornot1s	%f7,	%f17,	%f3
	call	loop_2166
	srl	%g2,	%g5,	%i2
	fandnot2	%f18,	%f26,	%f4
	movn	%icc,	%i6,	%l5
loop_2166:
	srl	%o1,	%g3,	%g6
	bshuffle	%f26,	%f18,	%f2
	movge	%xcc,	%o3,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x7C
	edge16l	%g7,	%i3,	%i0
	fmovde	%icc,	%f19,	%f29
	fsrc1	%f24,	%f8
	edge32	%l4,	%l1,	%i5
	te	%icc,	0x1
	fands	%f27,	%f12,	%f0
	movre	%o2,	%i4,	%o7
	mulscc	%o4,	0x02FC,	%l3
	tcc	%icc,	0x0
	bvs,a	loop_2167
	sub	%o6,	0x0418,	%o5
	subccc	%o0,	%g1,	%l6
	fmul8x16	%f6,	%f0,	%f6
loop_2167:
	fmovdleu	%icc,	%f7,	%f9
	smulcc	%l0,	0x020F,	%g4
	bleu,a	loop_2168
	array16	%l2,	%i7,	%g5
	movleu	%icc,	%i2,	%i6
	udivcc	%g2,	0x0F8E,	%o1
loop_2168:
	fbue,a	%fcc1,	loop_2169
	brlz	%g3,	loop_2170
	alignaddr	%l5,	%g6,	%i1
	sdiv	%g7,	0x0AEA,	%o3
loop_2169:
	tcs	%xcc,	0x1
loop_2170:
	movpos	%icc,	%i0,	%i3
	movvs	%icc,	%l4,	%l1
	ldd	[%l7 + 0x78],	%i4
	fmul8sux16	%f4,	%f2,	%f14
	bge,a	%xcc,	loop_2171
	srlx	%o2,	%o7,	%o4
	orncc	%i4,	0x133C,	%l3
	edge8	%o6,	%o5,	%g1
loop_2171:
	movleu	%xcc,	%o0,	%l6
	addcc	%g4,	0x1CC2,	%l2
	mulscc	%l0,	0x10B8,	%g5
	fpsub32	%f0,	%f24,	%f14
	tsubcctv	%i2,	0x08EF,	%i7
	movrlez	%g2,	0x3CE,	%o1
	bn,a,pn	%icc,	loop_2172
	edge16l	%i6,	%g3,	%l5
	movle	%xcc,	%i1,	%g7
	taddcc	%o3,	%i0,	%i3
loop_2172:
	fbn,a	%fcc3,	loop_2173
	tcc	%icc,	0x1
	movrne	%g6,	%l4,	%i5
	fcmple32	%f0,	%f30,	%l1
loop_2173:
	fcmpeq16	%f22,	%f12,	%o2
	fmovsl	%xcc,	%f15,	%f7
	fble	%fcc1,	loop_2174
	fsrc1	%f4,	%f6
	movle	%icc,	%o4,	%i4
	fbe	%fcc3,	loop_2175
loop_2174:
	bge,a	%xcc,	loop_2176
	movvc	%icc,	%o7,	%l3
	srlx	%o6,	0x08,	%g1
loop_2175:
	umulcc	%o0,	%l6,	%g4
loop_2176:
	movg	%icc,	%o5,	%l2
	fmovrsgez	%l0,	%f13,	%f0
	edge8ln	%g5,	%i7,	%g2
	tn	%xcc,	0x3
	xnorcc	%o1,	%i2,	%i6
	fxnors	%f29,	%f2,	%f5
	fpack32	%f2,	%f8,	%f18
	fmovrde	%g3,	%f18,	%f10
	fbe	%fcc3,	loop_2177
	bg,a	%icc,	loop_2178
	xor	%l5,	0x07E9,	%g7
	addcc	%o3,	%i1,	%i0
loop_2177:
	nop
	set	0x34, %i7
	ldswa	[%l7 + %i7] 0x89,	%i3
loop_2178:
	umul	%l4,	0x1D04,	%g6
	taddcc	%i5,	0x1631,	%o2
	brlez,a	%o4,	loop_2179
	stx	%i4,	[%l7 + 0x70]
	udivx	%o7,	0x11EC,	%l3
	set	0x54, %i0
	ldsha	[%l7 + %i0] 0x81,	%l1
loop_2179:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o0,	%g1,	%g4
	sub	%o5,	0x0CDB,	%l6
	fmul8x16	%f6,	%f12,	%f28
	addc	%l2,	%l0,	%g5
	movleu	%icc,	%i7,	%g2
	edge32l	%o1,	%i2,	%g3
	xnor	%i6,	0x00C8,	%l5
	tpos	%icc,	0x6
	edge32ln	%g7,	%i1,	%o3
	fmovda	%xcc,	%f13,	%f2
	ta	%xcc,	0x0
	tneg	%xcc,	0x5
	fmovrse	%i3,	%f2,	%f4
	andncc	%l4,	%g6,	%i5
	edge32ln	%i0,	%o4,	%o2
	nop
	setx	loop_2180,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%o7,	0x16EE,	%l3
	mulx	%i4,	0x1738,	%o6
	movpos	%icc,	%l1,	%g1
loop_2180:
	fpack16	%f8,	%f18
	ta	%icc,	0x5
	movcs	%icc,	%g4,	%o0
	movleu	%xcc,	%o5,	%l6
	call	loop_2181
	edge16l	%l0,	%l2,	%i7
	for	%f30,	%f8,	%f2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g5
loop_2181:
	tleu	%xcc,	0x2
	wr	%g0,	0x23,	%asi
	stba	%g2,	[%l7 + 0x6A] %asi
	membar	#Sync
	bleu,a	loop_2182
	fnors	%f15,	%f17,	%f20
	fmovse	%icc,	%f1,	%f15
	movge	%xcc,	%i2,	%g3
loop_2182:
	nop
	wr	%g0,	0x0c,	%asi
	stxa	%i6,	[%l7 + 0x10] %asi
	edge8ln	%l5,	%o1,	%i1
	fpsub32s	%f6,	%f21,	%f25
	sllx	%g7,	%i3,	%l4
	or	%g6,	%i5,	%i0
	edge32l	%o3,	%o2,	%o7
	movcs	%xcc,	%l3,	%i4
	movle	%icc,	%o6,	%o4
	tsubcc	%g1,	%g4,	%o0
	ba,pt	%icc,	loop_2183
	add	%o5,	0x19BC,	%l1
	mulx	%l6,	0x00A2,	%l2
	movvs	%xcc,	%l0,	%g5
loop_2183:
	fors	%f15,	%f25,	%f10
	fzeros	%f8
	movvs	%xcc,	%g2,	%i7
	movcs	%icc,	%i2,	%g3
	smul	%i6,	%l5,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g7,	%i3,	%i1
	fbu,a	%fcc2,	loop_2184
	bg,a,pt	%icc,	loop_2185
	xnor	%g6,	0x0729,	%i5
	edge8l	%i0,	%l4,	%o2
loop_2184:
	popc	%o3,	%o7
loop_2185:
	edge8ln	%i4,	%l3,	%o6
	movneg	%icc,	%o4,	%g4
	ldd	[%l7 + 0x60],	%f18
	bn,a,pn	%icc,	loop_2186
	ld	[%l7 + 0x48],	%f5
	edge32	%g1,	%o0,	%l1
	alignaddrl	%l6,	%l2,	%o5
loop_2186:
	fmovsvs	%xcc,	%f3,	%f23
	edge8ln	%g5,	%g2,	%l0
	movrgez	%i7,	%g3,	%i2
	fxor	%f24,	%f18,	%f4
	udivx	%i6,	0x1DC8,	%o1
	edge32	%l5,	%g7,	%i1
	tsubcc	%i3,	%i5,	%g6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x78] %asi,	%l4
	fmovdne	%xcc,	%f20,	%f0
	ldd	[%l7 + 0x78],	%f4
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x1e,	%f0
	tge	%icc,	0x7
	ldsw	[%l7 + 0x60],	%i0
	tl	%icc,	0x1
	movvc	%icc,	%o3,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc3,	loop_2187
	mulscc	%i4,	0x1858,	%o7
	smul	%l3,	%o4,	%g4
	fcmpd	%fcc2,	%f22,	%f8
loop_2187:
	or	%o6,	%o0,	%l1
	mulx	%g1,	%l6,	%o5
	xorcc	%l2,	%g5,	%g2
	udiv	%l0,	0x0818,	%g3
	orn	%i7,	0x182F,	%i2
	fmovsge	%icc,	%f2,	%f18
	sub	%o1,	0x13EE,	%l5
	ld	[%l7 + 0x7C],	%f9
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x04
	fblg	%fcc2,	loop_2188
	fsrc1s	%f18,	%f26
	set	0x6B, %i3
	ldsba	[%l7 + %i3] 0x14,	%g7
loop_2188:
	fmovsgu	%icc,	%f27,	%f16
	orcc	%i6,	0x1D91,	%i1
	fxor	%f28,	%f28,	%f30
	movge	%icc,	%i3,	%g6
	ldub	[%l7 + 0x72],	%i5
	edge8ln	%l4,	%o3,	%i0
	tle	%icc,	0x0
	fors	%f14,	%f2,	%f18
	array32	%i4,	%o7,	%l3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%o2
	tgu	%xcc,	0x2
	fpadd32	%f2,	%f20,	%f26
	udivcc	%g4,	0x19FB,	%o6
	edge8	%o0,	%l1,	%o4
	xnorcc	%g1,	%o5,	%l6
	fands	%f28,	%f18,	%f26
	fxnors	%f23,	%f19,	%f30
	umul	%g5,	%g2,	%l0
	fnot1s	%f23,	%f0
	std	%f10,	[%l7 + 0x78]
	movvs	%icc,	%l2,	%i7
	bg,a,pt	%xcc,	loop_2189
	fcmpne32	%f14,	%f10,	%i2
	edge32l	%o1,	%g3,	%l5
	stb	%g7,	[%l7 + 0x11]
loop_2189:
	andcc	%i1,	0x16AC,	%i6
	fcmple16	%f2,	%f12,	%i3
	sdivx	%i5,	0x02D0,	%l4
	edge16	%o3,	%i0,	%g6
	fmuld8ulx16	%f19,	%f3,	%f22
	fmovdneg	%xcc,	%f5,	%f8
	for	%f20,	%f10,	%f28
	movcc	%icc,	%i4,	%o7
	tcc	%xcc,	0x4
	membar	0x2F
	movrlz	%o2,	%g4,	%o6
	andcc	%l3,	%l1,	%o0
	flush	%l7 + 0x28
	stb	%o4,	[%l7 + 0x42]
	stw	%o5,	[%l7 + 0x44]
	fnor	%f18,	%f0,	%f30
	edge32n	%l6,	%g5,	%g2
	edge16n	%l0,	%l2,	%g1
	edge8ln	%i2,	%o1,	%g3
	addcc	%i7,	0x0317,	%l5
	fmovdvs	%xcc,	%f15,	%f0
	orn	%g7,	%i6,	%i1
	edge32n	%i5,	%i3,	%l4
	tneg	%xcc,	0x3
	tge	%xcc,	0x7
	sdivx	%i0,	0x0EE5,	%g6
	bneg,a	%icc,	loop_2190
	taddcc	%o3,	%o7,	%o2
	nop
	setx	loop_2191,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movgu	%icc,	%g4,	%i4
loop_2190:
	sllx	%l3,	%o6,	%l1
	movpos	%xcc,	%o0,	%o5
loop_2191:
	be,a,pt	%icc,	loop_2192
	fmovsl	%icc,	%f16,	%f24
	taddcctv	%l6,	%g5,	%o4
	tle	%xcc,	0x2
loop_2192:
	fbe,a	%fcc2,	loop_2193
	smul	%l0,	0x1AEF,	%g2
	fba	%fcc1,	loop_2194
	tvc	%icc,	0x7
loop_2193:
	addccc	%g1,	0x03AC,	%l2
	st	%f21,	[%l7 + 0x5C]
loop_2194:
	edge32ln	%o1,	%g3,	%i2
	subcc	%l5,	0x1443,	%i7
	sub	%g7,	0x0F89,	%i1
	fandnot2s	%f24,	%f14,	%f22
	tcc	%xcc,	0x1
	addccc	%i5,	%i6,	%l4
	array32	%i3,	%i0,	%g6
	sir	0x0C01
	array32	%o3,	%o7,	%g4
	popc	0x1FCF,	%o2
	fpsub16s	%f1,	%f12,	%f3
	sll	%i4,	0x12,	%l3
	fmovrdne	%o6,	%f18,	%f10
	andn	%o0,	%l1,	%o5
	orcc	%l6,	%g5,	%o4
	fand	%f10,	%f30,	%f12
	wr	%g0,	0x89,	%asi
	stwa	%g2,	[%l7 + 0x20] %asi
	edge8	%l0,	%l2,	%g1
	wr	%g0,	0x2f,	%asi
	stda	%o0,	[%l7 + 0x50] %asi
	membar	#Sync
	brlez	%i2,	loop_2195
	movcc	%xcc,	%l5,	%g3
	bcc,a	%xcc,	loop_2196
	array8	%i7,	%g7,	%i1
loop_2195:
	fabsd	%f8,	%f28
	andcc	%i5,	0x1D1F,	%i6
loop_2196:
	fmovrsgz	%l4,	%f24,	%f19
	movl	%xcc,	%i0,	%g6
	fzeros	%f16
	srlx	%i3,	0x0F,	%o3
	xorcc	%g4,	%o7,	%o2
	fsrc1	%f0,	%f2
	te	%xcc,	0x1
	tsubcctv	%i4,	0x190D,	%o6
	ldub	[%l7 + 0x2F],	%l3
	be,a,pn	%icc,	loop_2197
	move	%icc,	%o0,	%o5
	edge8	%l1,	%l6,	%g5
	edge32n	%g2,	%o4,	%l2
loop_2197:
	alignaddrl	%g1,	%l0,	%o1
	smulcc	%i2,	0x06BD,	%g3
	edge8l	%l5,	%i7,	%g7
	sdivcc	%i1,	0x0789,	%i6
	ldd	[%l7 + 0x30],	%l4
	taddcc	%i5,	%i0,	%i3
	fmovsneg	%xcc,	%f19,	%f5
	tpos	%icc,	0x7
	xnorcc	%o3,	%g4,	%o7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%g6,	%i4
	flush	%l7 + 0x20
	fmovdcc	%icc,	%f17,	%f5
	smul	%o6,	%l3,	%o2
	stx	%o0,	[%l7 + 0x58]
	fbe,a	%fcc0,	loop_2198
	move	%xcc,	%o5,	%l1
	movrgez	%l6,	0x15E,	%g5
	move	%icc,	%o4,	%l2
loop_2198:
	alignaddrl	%g2,	%g1,	%l0
	popc	%o1,	%i2
	movcc	%icc,	%g3,	%l5
	tg	%icc,	0x4
	alignaddr	%i7,	%i1,	%i6
	membar	0x52
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x54] %asi,	%l4
	udivcc	%i5,	0x0E7F,	%g7
	array8	%i3,	%o3,	%g4
	andcc	%i0,	%g6,	%o7
	sdivx	%i4,	0x0D3A,	%l3
	andcc	%o2,	0x05D2,	%o0
	movleu	%icc,	%o6,	%l1
	add	%l6,	%o5,	%o4
	fbu,a	%fcc1,	loop_2199
	fsrc1	%f8,	%f30
	xor	%g5,	%l2,	%g1
	edge16l	%g2,	%l0,	%o1
loop_2199:
	fmovsl	%icc,	%f15,	%f1
	tcc	%icc,	0x5
	and	%g3,	%i2,	%i7
	set	0x1C, %i1
	swapa	[%l7 + %i1] 0x89,	%i1
	tvs	%icc,	0x4
	wr	%g0,	0x2a,	%asi
	stha	%l5,	[%l7 + 0x22] %asi
	membar	#Sync
	mulscc	%l4,	0x1147,	%i5
	ldd	[%l7 + 0x10],	%g6
	xorcc	%i3,	0x0165,	%i6
	movn	%icc,	%g4,	%o3
	edge16l	%g6,	%i0,	%i4
	fbne	%fcc3,	loop_2200
	udivcc	%l3,	0x1E74,	%o7
	tsubcctv	%o0,	%o2,	%l1
	fornot1s	%f16,	%f5,	%f6
loop_2200:
	fbug	%fcc1,	loop_2201
	fcmpeq32	%f4,	%f12,	%l6
	fpackfix	%f26,	%f16
	fmul8x16au	%f31,	%f6,	%f4
loop_2201:
	fmovdle	%icc,	%f9,	%f26
	membar	0x1D
	edge16l	%o5,	%o4,	%g5
	edge32	%l2,	%g1,	%g2
	tcc	%icc,	0x3
	st	%f18,	[%l7 + 0x64]
	stw	%o6,	[%l7 + 0x20]
	bg,a	loop_2202
	movcc	%icc,	%o1,	%g3
	sdivcc	%l0,	0x16A5,	%i2
	ble,a,pt	%icc,	loop_2203
loop_2202:
	tl	%icc,	0x3
	fbe	%fcc1,	loop_2204
	movrlez	%i7,	0x331,	%i1
loop_2203:
	edge16	%l4,	%i5,	%g7
	fnors	%f12,	%f4,	%f9
loop_2204:
	or	%i3,	%l5,	%i6
	fmul8sux16	%f16,	%f12,	%f22
	wr	%g0,	0x19,	%asi
	stda	%o2,	[%l7 + 0x70] %asi
	subcc	%g6,	0x154B,	%i0
	brlez,a	%i4,	loop_2205
	tcs	%xcc,	0x0
	sllx	%l3,	0x06,	%o7
	udivcc	%g4,	0x1348,	%o0
loop_2205:
	fblg	%fcc0,	loop_2206
	movrne	%l1,	0x138,	%l6
	umulcc	%o5,	%o4,	%o2
	fmul8x16al	%f9,	%f26,	%f10
loop_2206:
	smul	%g5,	0x0B99,	%l2
	fandnot2s	%f30,	%f18,	%f3
	movne	%xcc,	%g1,	%g2
	nop
	set	0x4F, %i2
	ldstub	[%l7 + %i2],	%o1
	xnorcc	%g3,	0x1B93,	%l0
	fsrc1s	%f25,	%f15
	movcs	%icc,	%i2,	%o6
	edge8	%i1,	%i7,	%l4
	move	%icc,	%g7,	%i5
	tn	%icc,	0x2
	smul	%l5,	0x0D1F,	%i6
	sra	%o3,	0x15,	%g6
	sllx	%i3,	%i0,	%i4
	sdiv	%o7,	0x14ED,	%l3
	tpos	%xcc,	0x4
	edge8l	%o0,	%g4,	%l6
	popc	0x0A0E,	%o5
	mova	%icc,	%o4,	%o2
	movle	%icc,	%g5,	%l2
	movg	%icc,	%l1,	%g2
	bpos,pn	%icc,	loop_2207
	st	%f18,	[%l7 + 0x38]
	movleu	%icc,	%o1,	%g1
	movge	%icc,	%l0,	%g3
loop_2207:
	fmovdne	%icc,	%f20,	%f7
	ld	[%l7 + 0x08],	%f6
	movrlz	%o6,	0x20F,	%i1
	addccc	%i2,	%l4,	%i7
	orncc	%i5,	0x1983,	%l5
	fbue	%fcc2,	loop_2208
	tvs	%xcc,	0x4
	tcc	%xcc,	0x3
	fone	%f6
loop_2208:
	tvc	%icc,	0x6
	fmovdpos	%icc,	%f18,	%f29
	movrgz	%i6,	0x2DE,	%o3
	edge8ln	%g6,	%g7,	%i0
	fnors	%f31,	%f24,	%f19
	smul	%i3,	0x1820,	%i4
	tsubcctv	%l3,	0x1BDA,	%o7
	subcc	%g4,	0x00AA,	%l6
	taddcctv	%o0,	0x02DF,	%o4
	alignaddrl	%o2,	%g5,	%o5
	fcmped	%fcc1,	%f12,	%f22
	sllx	%l2,	0x1D,	%g2
	edge16l	%o1,	%g1,	%l0
	bvc,pn	%icc,	loop_2209
	fpackfix	%f18,	%f26
	movn	%xcc,	%l1,	%g3
	fandnot2s	%f5,	%f0,	%f8
loop_2209:
	srlx	%o6,	0x0B,	%i2
	subc	%i1,	%i7,	%l4
	fexpand	%f9,	%f6
	fmovrslez	%l5,	%f23,	%f15
	sra	%i6,	0x15,	%i5
	movneg	%icc,	%g6,	%g7
	movrlez	%o3,	0x14E,	%i0
	te	%xcc,	0x5
	and	%i3,	%i4,	%o7
	edge16l	%l3,	%l6,	%o0
	orcc	%o4,	%o2,	%g4
	tvc	%xcc,	0x5
	sdivx	%g5,	0x0011,	%o5
	srlx	%l2,	%g2,	%g1
	fmovs	%f8,	%f15
	movvc	%icc,	%o1,	%l0
	tneg	%xcc,	0x2
	fbl,a	%fcc3,	loop_2210
	fmovsgu	%xcc,	%f15,	%f15
	fornot1	%f10,	%f10,	%f16
	alignaddrl	%l1,	%g3,	%o6
loop_2210:
	mulscc	%i2,	0x0701,	%i1
	edge16l	%l4,	%i7,	%i6
	ldsb	[%l7 + 0x15],	%i5
	umul	%g6,	0x0FE1,	%l5
	subcc	%o3,	%i0,	%g7
	array16	%i3,	%o7,	%l3
	srlx	%l6,	0x04,	%o0
	taddcctv	%o4,	0x0901,	%i4
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o2
	andncc	%g5,	%o5,	%l2
	fbue,a	%fcc3,	loop_2211
	movre	%g4,	%g2,	%o1
	fcmple16	%f24,	%f8,	%l0
	fnegs	%f29,	%f23
loop_2211:
	sllx	%g1,	%g3,	%o6
	movcs	%icc,	%l1,	%i1
	tvc	%xcc,	0x6
	fnot2s	%f22,	%f2
	sdivcc	%i2,	0x1951,	%i7
	tn	%xcc,	0x7
	sethi	0x02CE,	%i6
	fnands	%f30,	%f27,	%f4
	fxnors	%f9,	%f19,	%f8
	siam	0x3
	movpos	%icc,	%i5,	%l4
	fandnot1	%f8,	%f10,	%f2
	brlez	%g6,	loop_2212
	movgu	%xcc,	%o3,	%l5
	sethi	0x1D76,	%i0
	smul	%g7,	0x1A5D,	%o7
loop_2212:
	movg	%xcc,	%i3,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %o2
	prefetcha	[%l7 + %o2] 0x0c,	 0x2
	fnor	%f0,	%f12,	%f12
	bg	%xcc,	loop_2213
	addccc	%l6,	%o4,	%i4
	fpsub16	%f0,	%f16,	%f26
	xnorcc	%o2,	0x08D4,	%o5
loop_2213:
	tneg	%icc,	0x7
	edge16n	%g5,	%g4,	%g2
	subcc	%o1,	%l0,	%l2
	orcc	%g1,	0x007B,	%o6
	orcc	%g3,	0x079F,	%i1
	movleu	%xcc,	%i2,	%l1
	std	%i6,	[%l7 + 0x10]
	movle	%icc,	%i6,	%l4
	tpos	%icc,	0x5
	ldd	[%l7 + 0x38],	%f20
	fnot2	%f2,	%f14
	movcc	%xcc,	%g6,	%o3
	edge8	%l5,	%i5,	%i0
	call	loop_2214
	movpos	%xcc,	%g7,	%i3
	edge8l	%o7,	%o0,	%l6
	tg	%icc,	0x4
loop_2214:
	fpack32	%f26,	%f24,	%f6
	xorcc	%l3,	%o4,	%i4
	taddcctv	%o2,	0x0A08,	%o5
	fbo	%fcc0,	loop_2215
	subc	%g5,	0x05F6,	%g2
	ldd	[%l7 + 0x68],	%o0
	fnand	%f30,	%f8,	%f18
loop_2215:
	udiv	%g4,	0x0E7E,	%l0
	fmovsgu	%xcc,	%f6,	%f19
	movre	%l2,	%o6,	%g1
	movne	%icc,	%i1,	%i2
	te	%icc,	0x1
	edge16ln	%g3,	%i7,	%i6
	tge	%icc,	0x3
	sdivx	%l4,	0x1D03,	%l1
	edge16n	%g6,	%o3,	%i5
	fbue,a	%fcc3,	loop_2216
	umulcc	%l5,	0x106B,	%i0
	andn	%g7,	%o7,	%i3
	tsubcctv	%o0,	%l6,	%l3
loop_2216:
	nop
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x15,	 0x1
	fmovrslz	%o4,	%f4,	%f24
	movcc	%xcc,	%o2,	%g5
	fbe,a	%fcc2,	loop_2217
	fmovdg	%xcc,	%f17,	%f6
	movleu	%icc,	%o5,	%o1
	umulcc	%g2,	%l0,	%g4
loop_2217:
	ldd	[%l7 + 0x50],	%f30
	bgu,a,pn	%icc,	loop_2218
	mulx	%o6,	%l2,	%g1
	ta	%xcc,	0x4
	umul	%i1,	%g3,	%i7
loop_2218:
	swap	[%l7 + 0x54],	%i2
	alignaddrl	%i6,	%l4,	%g6
	edge16n	%l1,	%o3,	%i5
	taddcctv	%i0,	%l5,	%o7
	fmovrslz	%g7,	%f28,	%f4
	sir	0x1D25
	fmovs	%f11,	%f19
	subc	%o0,	0x0E88,	%i3
	udivcc	%l6,	0x0FF1,	%i4
	udivcc	%o4,	0x0B06,	%o2
	movrgz	%l3,	0x0C0,	%o5
	fpadd32	%f12,	%f24,	%f28
	st	%f2,	[%l7 + 0x64]
	fmovse	%icc,	%f24,	%f6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g5,	%g2
	movgu	%icc,	%l0,	%o1
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x70] %asi,	%o6
	edge32ln	%g4,	%l2,	%i1
	xor	%g3,	%i7,	%g1
	sdivx	%i6,	0x0DFA,	%i2
	fmovrslz	%l4,	%f30,	%f9
	xor	%l1,	0x0318,	%g6
	be,a	loop_2219
	fxnors	%f6,	%f19,	%f2
	fmovdle	%xcc,	%f5,	%f21
	fble	%fcc0,	loop_2220
loop_2219:
	fbne	%fcc2,	loop_2221
	movne	%icc,	%o3,	%i5
	edge16	%i0,	%l5,	%o7
loop_2220:
	xnor	%o0,	0x19EC,	%g7
loop_2221:
	subccc	%i3,	0x07E2,	%l6
	movne	%xcc,	%o4,	%o2
	addccc	%i4,	%o5,	%l3
	tne	%icc,	0x3
	tg	%xcc,	0x1
	taddcc	%g5,	%g2,	%l0
	fcmpd	%fcc2,	%f2,	%f10
	edge8ln	%o6,	%g4,	%l2
	ble,pt	%xcc,	loop_2222
	fpadd32	%f14,	%f20,	%f8
	sra	%i1,	0x14,	%g3
	andcc	%i7,	0x1E30,	%g1
loop_2222:
	orn	%o1,	%i6,	%i2
	fmul8ulx16	%f24,	%f30,	%f18
	fnegs	%f7,	%f22
	fornot2s	%f25,	%f3,	%f13
	movrlz	%l4,	%g6,	%o3
	fpmerge	%f23,	%f6,	%f16
	edge8ln	%i5,	%l1,	%l5
	flush	%l7 + 0x2C
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	set	0x23, %l5
	ldsba	[%l7 + %l5] 0x89,	%i0
	movpos	%icc,	%o0,	%g7
	udivx	%i3,	0x1FC8,	%o7
	udivx	%l6,	0x1E25,	%o4
	sethi	0x1A67,	%o2
	ldsh	[%l7 + 0x52],	%i4
	movvs	%icc,	%l3,	%g5
	fmovdle	%xcc,	%f30,	%f23
	movrgz	%o5,	0x09A,	%g2
	and	%o6,	0x0418,	%l0
	fbue,a	%fcc3,	loop_2223
	edge32	%l2,	%i1,	%g4
	movrlez	%g3,	0x19D,	%g1
	bne,pn	%icc,	loop_2224
loop_2223:
	xnor	%i7,	0x1FBD,	%o1
	movge	%xcc,	%i2,	%l4
	sub	%i6,	0x0851,	%g6
loop_2224:
	fands	%f29,	%f21,	%f22
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i5
	edge8n	%o3,	%l1,	%i0
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x16
	membar	#Sync
	umul	%o0,	%g7,	%i3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x19,	%f16
	lduw	[%l7 + 0x0C],	%l5
	fpack32	%f26,	%f26,	%f4
	set	0x24, %g4
	ldswa	[%l7 + %g4] 0x80,	%l6
	set	0x10, %l4
	stda	%o4,	[%l7 + %l4] 0x04
	fandnot2	%f20,	%f4,	%f10
	fnegd	%f28,	%f28
	fnot1	%f10,	%f8
	ldstub	[%l7 + 0x6F],	%o2
	stb	%i4,	[%l7 + 0x2A]
	fpackfix	%f18,	%f28
	std	%o6,	[%l7 + 0x48]
	tneg	%xcc,	0x5
	edge16n	%g5,	%o5,	%g2
	tpos	%icc,	0x0
	tn	%icc,	0x5
	andcc	%o6,	0x0F4E,	%l0
	set	0x18, %o1
	ldxa	[%g0 + %o1] 0x50,	%l2
	and	%i1,	%g4,	%g3
	movneg	%icc,	%g1,	%l3
	taddcctv	%o1,	0x07A1,	%i7
	edge32	%l4,	%i6,	%g6
	orcc	%i5,	0x09FF,	%i2
	srl	%l1,	%i0,	%o0
	fzero	%f0
	nop
	setx loop_2225, %l0, %l1
	jmpl %l1, %g7
	and	%i3,	0x0CB4,	%o3
	edge8n	%l6,	%o4,	%l5
	umulcc	%o2,	0x1409,	%i4
loop_2225:
	fsrc1	%f26,	%f20
	fmovdne	%xcc,	%f23,	%f17
	brgz	%g5,	loop_2226
	fmovsn	%icc,	%f14,	%f24
	movn	%xcc,	%o7,	%g2
	wr	%g0,	0x80,	%asi
	stda	%o4,	[%l7 + 0x28] %asi
loop_2226:
	fmovrdgz	%o6,	%f24,	%f0
	flush	%l7 + 0x28
	srl	%l2,	0x03,	%i1
	lduh	[%l7 + 0x44],	%g4
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
	subcc	%g3,	0x0A40,	%l3
	xor	%g1,	0x0FD6,	%i7
	fzeros	%f10
	movne	%xcc,	%l4,	%o1
	udiv	%g6,	0x098F,	%i5
	ldstub	[%l7 + 0x7F],	%i2
	udiv	%i6,	0x008E,	%l1
	movrlez	%i0,	0x1FD,	%g7
	tsubcctv	%i3,	0x19EE,	%o3
	subc	%o0,	%l6,	%o4
	tneg	%xcc,	0x1
	sra	%l5,	%o2,	%g5
	fnot2s	%f23,	%f28
	edge16ln	%i4,	%o7,	%g2
	taddcc	%o5,	0x1139,	%o6
	addc	%l2,	0x1AA9,	%g4
	addc	%l0,	%i1,	%g3
	ldsb	[%l7 + 0x23],	%g1
	smul	%i7,	0x0235,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x34, %o7
	lduwa	[%l7 + %o7] 0x14,	%l3
	ld	[%l7 + 0x70],	%f14
	movge	%icc,	%o1,	%i5
	fsrc1s	%f1,	%f20
	mulx	%g6,	%i2,	%l1
	set	0x10, %g7
	sta	%f0,	[%l7 + %g7] 0x18
	stx	%i6,	[%l7 + 0x48]
	brgez,a	%g7,	loop_2227
	fzeros	%f23
	edge32n	%i3,	%o3,	%o0
	movneg	%icc,	%i0,	%o4
loop_2227:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x7C] %asi,	%f29
	fbug,a	%fcc2,	loop_2228
	fmovda	%xcc,	%f6,	%f17
	fxnors	%f20,	%f10,	%f27
	fnegs	%f14,	%f22
loop_2228:
	tsubcc	%l5,	%o2,	%g5
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0xf0
	membar	#Sync
	tsubcctv	%l6,	%i4,	%o7
	bn	loop_2229
	stw	%o5,	[%l7 + 0x08]
	movcc	%xcc,	%g2,	%o6
	edge8l	%g4,	%l0,	%l2
loop_2229:
	xnor	%g3,	0x047F,	%g1
	movg	%icc,	%i7,	%l4
	fmovdne	%xcc,	%f26,	%f25
	for	%f16,	%f2,	%f20
	array16	%l3,	%i1,	%i5
	brlz,a	%o1,	loop_2230
	tge	%xcc,	0x5
	movleu	%icc,	%g6,	%i2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%l1
loop_2230:
	add	%g7,	0x196A,	%o3
	subcc	%i3,	0x1D32,	%o0
	fcmpeq16	%f16,	%f16,	%o4
	fpsub16	%f22,	%f14,	%f20
	movn	%xcc,	%i0,	%l5
	add	%g5,	%o2,	%l6
	fbo,a	%fcc2,	loop_2231
	fornot2	%f6,	%f24,	%f20
	fbu	%fcc2,	loop_2232
	fbge,a	%fcc2,	loop_2233
loop_2231:
	subc	%o7,	%o5,	%i4
	fnot2	%f22,	%f20
loop_2232:
	ldstub	[%l7 + 0x15],	%o6
loop_2233:
	mulscc	%g2,	0x00ED,	%l0
	movpos	%icc,	%l2,	%g4
	mulscc	%g1,	0x1AEF,	%g3
	bleu,a,pt	%xcc,	loop_2234
	lduw	[%l7 + 0x70],	%l4
	movcc	%xcc,	%i7,	%i1
	movpos	%icc,	%i5,	%l3
loop_2234:
	alignaddrl	%o1,	%i2,	%i6
	fmovsvc	%xcc,	%f20,	%f22
	smul	%g6,	%g7,	%o3
	orcc	%i3,	0x1476,	%l1
	set	0x3C, %i6
	stwa	%o0,	[%l7 + %i6] 0x27
	membar	#Sync
	fbo,a	%fcc1,	loop_2235
	bcc,a	loop_2236
	orn	%i0,	%o4,	%g5
	fxnors	%f9,	%f21,	%f28
loop_2235:
	movge	%xcc,	%o2,	%l6
loop_2236:
	tcc	%xcc,	0x6
	add	%l5,	%o5,	%i4
	tneg	%xcc,	0x3
	ldstub	[%l7 + 0x79],	%o6
	addcc	%g2,	%l0,	%o7
	movrne	%g4,	0x2F4,	%l2
	nop
	setx	loop_2237,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%g3,	%l4,	%g1
	array8	%i1,	%i5,	%l3
	tpos	%icc,	0x2
loop_2237:
	subccc	%i7,	0x192E,	%i2
	movcs	%icc,	%o1,	%i6
	tsubcc	%g6,	%g7,	%i3
	fcmple32	%f8,	%f2,	%l1
	xnor	%o0,	0x0157,	%o3
	ldstub	[%l7 + 0x45],	%i0
	mulx	%o4,	%o2,	%g5
	tneg	%xcc,	0x7
	array8	%l6,	%l5,	%o5
	fmovrdne	%o6,	%f0,	%f28
	tleu	%xcc,	0x6
	fandnot1s	%f27,	%f31,	%f0
	tl	%xcc,	0x1
	fones	%f20
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x35] %asi,	%g2
	orn	%i4,	0x0460,	%l0
	bleu,a,pn	%icc,	loop_2238
	tsubcc	%o7,	0x1B64,	%l2
	edge32l	%g3,	%l4,	%g1
	set	0x30, %o0
	lduwa	[%l7 + %o0] 0x15,	%g4
loop_2238:
	fnegs	%f5,	%f13
	fbne	%fcc2,	loop_2239
	fcmpne32	%f4,	%f0,	%i1
	tcc	%icc,	0x1
	tne	%xcc,	0x4
loop_2239:
	udiv	%l3,	0x1674,	%i5
	set	0x44, %l6
	lda	[%l7 + %l6] 0x0c,	%f28
	lduw	[%l7 + 0x30],	%i7
	udivcc	%i2,	0x0EE0,	%i6
	tvs	%icc,	0x7
	fbge	%fcc0,	loop_2240
	movge	%xcc,	%o1,	%g7
	ta	%xcc,	0x1
	fpackfix	%f22,	%f3
loop_2240:
	fsrc1s	%f28,	%f13
	fnot2	%f22,	%f4
	sdivcc	%g6,	0x0AE2,	%i3
	fmovrsne	%o0,	%f16,	%f2
	fmovdge	%xcc,	%f30,	%f8
	subcc	%l1,	0x168D,	%i0
	xor	%o3,	%o2,	%o4
	subc	%g5,	%l5,	%l6
	ldsw	[%l7 + 0x30],	%o6
	movrlz	%g2,	%o5,	%i4
	nop
	setx loop_2241, %l0, %l1
	jmpl %l1, %l0
	sub	%o7,	0x0DFC,	%g3
	ldx	[%l7 + 0x40],	%l4
	fmul8x16al	%f9,	%f25,	%f24
loop_2241:
	subcc	%l2,	%g4,	%g1
	movn	%icc,	%l3,	%i5
	udiv	%i1,	0x1F1C,	%i7
	sdivcc	%i2,	0x0B6C,	%i6
	tcs	%xcc,	0x3
	tvs	%xcc,	0x7
	sll	%g7,	0x10,	%g6
	edge8l	%i3,	%o1,	%o0
	xnor	%l1,	%i0,	%o3
	orcc	%o2,	%o4,	%g5
	mova	%xcc,	%l6,	%o6
	lduw	[%l7 + 0x20],	%l5
	fcmple32	%f8,	%f22,	%g2
	fnot1s	%f2,	%f15
	movrlez	%o5,	%i4,	%o7
	fnors	%f21,	%f6,	%f15
	fcmple32	%f22,	%f22,	%l0
	fcmpeq32	%f4,	%f18,	%l4
	udivcc	%g3,	0x1C02,	%g4
	movn	%xcc,	%l2,	%l3
	fpmerge	%f22,	%f16,	%f30
	prefetch	[%l7 + 0x54],	 0x3
	fcmps	%fcc1,	%f0,	%f7
	orncc	%i5,	%g1,	%i1
	smulcc	%i7,	0x0B76,	%i6
	fpackfix	%f6,	%f2
	xnorcc	%i2,	%g6,	%g7
	sll	%o1,	0x1E,	%o0
	xorcc	%l1,	0x1360,	%i3
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x2b,	%o2
	edge32l	%o2,	%i0,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l6,	%o6
	movrgez	%g5,	0x0FA,	%g2
	taddcc	%o5,	0x126D,	%l5
	fones	%f22
	bleu	%icc,	loop_2242
	movcc	%icc,	%i4,	%o7
	sllx	%l4,	%g3,	%l0
	set	0x32, %o4
	stba	%g4,	[%l7 + %o4] 0x2a
	membar	#Sync
loop_2242:
	fbl,a	%fcc0,	loop_2243
	movrne	%l3,	0x037,	%l2
	fmovsg	%xcc,	%f16,	%f19
	fbo	%fcc1,	loop_2244
loop_2243:
	movg	%icc,	%i5,	%i1
	fba	%fcc3,	loop_2245
	lduw	[%l7 + 0x50],	%g1
loop_2244:
	movpos	%icc,	%i7,	%i6
	fpsub16s	%f4,	%f31,	%f11
loop_2245:
	fpadd32	%f10,	%f4,	%f4
	fbne,a	%fcc2,	loop_2246
	movgu	%xcc,	%i2,	%g6
	sll	%g7,	%o1,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2246:
	fmul8ulx16	%f28,	%f6,	%f0
	movcc	%icc,	%i3,	%l1
	fmovdl	%xcc,	%f20,	%f1
	fabsd	%f6,	%f24
	edge16l	%o2,	%o3,	%o4
	srax	%l6,	%o6,	%g5
	movrlez	%i0,	%o5,	%g2
	movrlz	%i4,	0x1BD,	%o7
	xorcc	%l5,	0x0908,	%g3
	fmul8x16au	%f19,	%f22,	%f22
	sdivx	%l4,	0x1292,	%l0
	srl	%g4,	%l3,	%i5
	sra	%i1,	%l2,	%g1
	fpsub16	%f26,	%f8,	%f0
	array32	%i7,	%i6,	%i2
	fmovsg	%icc,	%f24,	%f6
	tsubcctv	%g7,	0x010C,	%o1
	addc	%o0,	0x180A,	%i3
	tneg	%xcc,	0x3
	srlx	%g6,	%l1,	%o2
	srlx	%o3,	%o4,	%o6
	movrgz	%l6,	0x278,	%g5
	andcc	%o5,	0x1F7A,	%g2
	bvc,a,pt	%xcc,	loop_2247
	mulscc	%i0,	0x079A,	%i4
	tle	%xcc,	0x6
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x04,	%f16
loop_2247:
	fpadd16	%f14,	%f20,	%f30
	movcc	%icc,	%o7,	%g3
	fnand	%f12,	%f30,	%f22
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x41] %asi,	%l5
	smul	%l4,	0x1145,	%g4
	sdivcc	%l3,	0x065B,	%i5
	stx	%i1,	[%l7 + 0x48]
	wr	%g0,	0x2a,	%asi
	stda	%l0,	[%l7 + 0x48] %asi
	membar	#Sync
	fcmpeq32	%f8,	%f0,	%g1
	fsrc1s	%f4,	%f29
	fmovsgu	%icc,	%f10,	%f7
	fands	%f19,	%f19,	%f31
	sir	0x02A0
	addcc	%i7,	%l2,	%i2
	fsrc1s	%f8,	%f23
	fcmpgt16	%f2,	%f20,	%i6
	fble	%fcc2,	loop_2248
	fmovsa	%xcc,	%f4,	%f29
	edge8ln	%o1,	%o0,	%i3
	fmovscs	%icc,	%f1,	%f7
loop_2248:
	edge16n	%g7,	%l1,	%g6
	movleu	%xcc,	%o2,	%o4
	bne	loop_2249
	edge32l	%o6,	%l6,	%o3
	smulcc	%g5,	%o5,	%i0
	srax	%g2,	0x1B,	%o7
loop_2249:
	fmovsa	%icc,	%f25,	%f26
	alignaddr	%i4,	%g3,	%l5
	xorcc	%g4,	%l4,	%l3
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x49] %asi,	%i5
	fnot2s	%f31,	%f22
	fornot2s	%f21,	%f16,	%f21
	taddcc	%i1,	%g1,	%i7
	prefetch	[%l7 + 0x40],	 0x2
	fmovd	%f16,	%f24
	bg,a,pt	%xcc,	loop_2250
	edge8ln	%l0,	%i2,	%i6
	movne	%xcc,	%o1,	%o0
	movge	%icc,	%i3,	%g7
loop_2250:
	movl	%icc,	%l2,	%g6
	sethi	0x1B15,	%o2
	fmuld8ulx16	%f10,	%f27,	%f8
	fmovsgu	%icc,	%f8,	%f23
	tg	%icc,	0x4
	movg	%xcc,	%o4,	%o6
	umul	%l1,	%l6,	%o3
	fnot1	%f28,	%f8
	andcc	%g5,	%i0,	%o5
	umul	%g2,	%o7,	%g3
	ta	%icc,	0x6
	brnz,a	%l5,	loop_2251
	fnands	%f27,	%f9,	%f1
	fcmpgt32	%f6,	%f2,	%i4
	popc	%g4,	%l3
loop_2251:
	orn	%i5,	0x11F8,	%l4
	fmovdg	%xcc,	%f22,	%f25
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x08] %asi,	%i1
	tcc	%icc,	0x2
	tcs	%xcc,	0x5
	fmovsn	%xcc,	%f0,	%f5
	fbn	%fcc1,	loop_2252
	alignaddrl	%i7,	%l0,	%g1
	membar	0x12
	fmovrdgez	%i2,	%f10,	%f16
loop_2252:
	ldx	[%l7 + 0x68],	%o1
	addcc	%i6,	0x0990,	%o0
	tge	%xcc,	0x3
	lduh	[%l7 + 0x36],	%i3
	udivcc	%g7,	0x1C88,	%l2
	taddcc	%o2,	%g6,	%o4
	bl,a	%icc,	loop_2253
	fnot1	%f18,	%f28
	movgu	%xcc,	%l1,	%o6
	fpmerge	%f4,	%f13,	%f4
loop_2253:
	andcc	%o3,	%g5,	%i0
	movge	%xcc,	%o5,	%l6
	fmul8x16	%f30,	%f30,	%f28
	fones	%f8
	movge	%icc,	%g2,	%o7
	movrlez	%g3,	0x238,	%i4
	edge8n	%g4,	%l5,	%l3
	addcc	%i5,	%i1,	%i7
	sethi	0x1C21,	%l0
	bpos,a	%xcc,	loop_2254
	fmovrsne	%l4,	%f31,	%f11
	nop
	set	0x4C, %g3
	prefetch	[%l7 + %g3],	 0x3
	xorcc	%g1,	%o1,	%i2
loop_2254:
	addc	%o0,	%i6,	%g7
	fabsd	%f4,	%f16
	movvc	%xcc,	%l2,	%o2
	fnegd	%f6,	%f30
	fexpand	%f27,	%f16
	tvc	%icc,	0x6
	tpos	%icc,	0x6
	movgu	%xcc,	%g6,	%i3
	addcc	%l1,	0x10CE,	%o6
	addc	%o3,	0x030B,	%o4
	alignaddr	%g5,	%i0,	%l6
	membar	0x51
	bcs,a,pt	%xcc,	loop_2255
	edge16n	%o5,	%g2,	%g3
	smul	%i4,	0x0FAE,	%g4
	fors	%f7,	%f4,	%f7
loop_2255:
	fblg,a	%fcc3,	loop_2256
	fpadd16	%f6,	%f18,	%f10
	set	0x7C, %l0
	stba	%l5,	[%l7 + %l0] 0xe2
	membar	#Sync
loop_2256:
	addcc	%o7,	0x11C7,	%i5
	movne	%xcc,	%l3,	%i7
	alignaddrl	%l0,	%i1,	%g1
	nop
	setx	loop_2257,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bneg	%xcc,	loop_2258
	bg,a,pt	%xcc,	loop_2259
	tle	%xcc,	0x6
loop_2257:
	andcc	%o1,	%l4,	%i2
loop_2258:
	edge16	%i6,	%g7,	%o0
loop_2259:
	movrlz	%l2,	0x0D7,	%g6
	edge8l	%i3,	%l1,	%o2
	set	0x3E, %g6
	ldsba	[%l7 + %g6] 0x18,	%o6
	tgu	%xcc,	0x3
	fpack16	%f22,	%f0
	mulscc	%o3,	%o4,	%g5
	brz	%l6,	loop_2260
	subccc	%i0,	%o5,	%g3
	fzero	%f16
	subcc	%g2,	0x0397,	%i4
loop_2260:
	addccc	%l5,	%g4,	%o7
	tne	%icc,	0x3
	std	%f24,	[%l7 + 0x70]
	sethi	0x085B,	%i5
	fbue	%fcc2,	loop_2261
	umulcc	%l3,	%l0,	%i1
	fornot2	%f30,	%f24,	%f18
	movg	%icc,	%g1,	%o1
loop_2261:
	nop
	set	0x14, %g1
	sth	%i7,	[%l7 + %g1]
	mulx	%i2,	0x0CF1,	%l4
	move	%xcc,	%i6,	%g7
	fmul8ulx16	%f6,	%f0,	%f20
	edge32	%l2,	%o0,	%i3
	fmul8ulx16	%f6,	%f30,	%f10
	movcs	%icc,	%l1,	%o2
	fbu	%fcc0,	loop_2262
	movrlez	%g6,	%o6,	%o4
	fmovrdgez	%o3,	%f14,	%f8
	fbul,a	%fcc2,	loop_2263
loop_2262:
	call	loop_2264
	tcs	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l6
loop_2263:
	edge32ln	%g5,	%i0,	%g3
loop_2264:
	edge16	%g2,	%o5,	%i4
	fmul8x16au	%f21,	%f7,	%f12
	srax	%l5,	0x0F,	%g4
	mulscc	%o7,	%l3,	%i5
	fmovsg	%xcc,	%f11,	%f13
	movrne	%i1,	0x06F,	%l0
	fmovscs	%xcc,	%f17,	%f25
	set	0x28, %i5
	stxa	%g1,	[%l7 + %i5] 0xe3
	membar	#Sync
	stx	%i7,	[%l7 + 0x20]
	tneg	%xcc,	0x6
	tge	%icc,	0x4
	fand	%f30,	%f10,	%f0
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0xf1
	membar	#Sync
	stb	%o1,	[%l7 + 0x53]
	edge16n	%i2,	%i6,	%g7
	smulcc	%l2,	%o0,	%i3
	udiv	%l4,	0x02A6,	%o2
	movle	%xcc,	%g6,	%l1
	movrlez	%o6,	%o4,	%o3
	alignaddr	%l6,	%g5,	%g3
	ldub	[%l7 + 0x24],	%i0
	wr	%g0,	0xea,	%asi
	stba	%o5,	[%l7 + 0x08] %asi
	membar	#Sync
	xnor	%g2,	0x042B,	%l5
	fsrc2	%f6,	%f4
	fornot1s	%f14,	%f26,	%f2
	nop
	setx	loop_2265,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdn	%xcc,	%f29,	%f25
	brz,a	%i4,	loop_2266
	bvc,pt	%xcc,	loop_2267
loop_2265:
	subc	%g4,	0x1366,	%o7
	array16	%l3,	%i1,	%i5
loop_2266:
	fmovscc	%icc,	%f31,	%f12
loop_2267:
	nop
	set	0x40, %i7
	swapa	[%l7 + %i7] 0x19,	%g1
	movrne	%i7,	%o1,	%l0
	fxor	%f6,	%f8,	%f16
	movn	%icc,	%i6,	%i2
	fbg,a	%fcc0,	loop_2268
	fmovdcs	%icc,	%f23,	%f10
	addc	%l2,	0x1BB7,	%o0
	fmovdg	%xcc,	%f4,	%f8
loop_2268:
	edge16l	%g7,	%l4,	%o2
	tn	%icc,	0x4
	tg	%xcc,	0x5
	fnors	%f21,	%f6,	%f13
	tl	%xcc,	0x6
	movneg	%icc,	%g6,	%l1
	fmovdcc	%icc,	%f8,	%f8
	fmovsg	%icc,	%f26,	%f1
	ldstub	[%l7 + 0x33],	%i3
	movrne	%o6,	%o3,	%o4
	edge16n	%l6,	%g5,	%g3
	fnors	%f28,	%f20,	%f7
	movrlez	%o5,	%i0,	%g2
	wr	%g0,	0x22,	%asi
	stwa	%l5,	[%l7 + 0x48] %asi
	membar	#Sync
	nop
	setx	loop_2269,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%icc,	%i4,	%o7
	fors	%f8,	%f6,	%f30
	fornot2	%f2,	%f18,	%f6
loop_2269:
	edge32l	%l3,	%i1,	%i5
	movpos	%icc,	%g4,	%g1
	fmul8x16al	%f9,	%f19,	%f12
	fmovsl	%xcc,	%f26,	%f13
	fbe,a	%fcc2,	loop_2270
	umul	%i7,	0x1AAB,	%l0
	fandnot2	%f0,	%f24,	%f28
	set	0x7C, %i0
	lda	[%l7 + %i0] 0x18,	%f0
loop_2270:
	nop
	set	0x7C, %g2
	ldsw	[%l7 + %g2],	%o1
	mulx	%i6,	%l2,	%i2
	smulcc	%g7,	0x04B7,	%l4
	bpos	loop_2271
	movrgz	%o0,	0x123,	%o2
	fmovs	%f1,	%f4
	mulx	%l1,	0x0328,	%g6
loop_2271:
	prefetch	[%l7 + 0x1C],	 0x0
	sll	%o6,	0x13,	%o3
	alignaddr	%o4,	%i3,	%l6
	fbu	%fcc3,	loop_2272
	sir	0x0223
	fble,a	%fcc2,	loop_2273
	sra	%g5,	0x1C,	%g3
loop_2272:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x7E] %asi,	%i0
loop_2273:
	add	%g2,	0x04AB,	%l5
	xnorcc	%o5,	%o7,	%l3
	fand	%f28,	%f4,	%f12
	xorcc	%i1,	0x11A2,	%i5
	movneg	%xcc,	%g4,	%g1
	sdivx	%i7,	0x0241,	%i4
	addc	%l0,	0x158F,	%o1
	tne	%xcc,	0x0
	tne	%xcc,	0x2
	ldsh	[%l7 + 0x68],	%l2
	fmovrslz	%i2,	%f9,	%f6
	call	loop_2274
	tge	%icc,	0x6
	udiv	%g7,	0x1871,	%i6
	fmovsleu	%icc,	%f24,	%f3
loop_2274:
	taddcctv	%l4,	0x1186,	%o0
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x14,	 0x3
	nop
	setx loop_2275, %l0, %l1
	jmpl %l1, %l1
	edge32n	%o6,	%o3,	%g6
	tsubcc	%o4,	0x049B,	%l6
	stbar
loop_2275:
	and	%g5,	0x1C26,	%g3
	brgz,a	%i3,	loop_2276
	edge16	%i0,	%l5,	%g2
	be	%icc,	loop_2277
	membar	0x3E
loop_2276:
	bneg,a,pn	%icc,	loop_2278
	fmovdne	%xcc,	%f22,	%f30
loop_2277:
	flush	%l7 + 0x38
	set	0x50, %i3
	ldswa	[%l7 + %i3] 0x81,	%o5
loop_2278:
	fmovspos	%icc,	%f4,	%f3
	fmovsleu	%icc,	%f14,	%f6
	tpos	%xcc,	0x0
	edge16ln	%o7,	%l3,	%i1
	movleu	%icc,	%i5,	%g4
	or	%g1,	%i4,	%i7
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	movrlez	%l0,	0x2C8,	%l2
	ld	[%l7 + 0x40],	%f4
	wr	%g0,	0xea,	%asi
	stha	%g7,	[%l7 + 0x32] %asi
	membar	#Sync
	movrgz	%i2,	%i6,	%o0
	move	%icc,	%o2,	%l4
	fcmps	%fcc1,	%f18,	%f7
	wr	%g0,	0x88,	%asi
	stxa	%l1,	[%l7 + 0x28] %asi
	udiv	%o3,	0x1680,	%o6
	bvs,pt	%icc,	loop_2279
	tvs	%icc,	0x6
	bne	%icc,	loop_2280
	addc	%o4,	%g6,	%l6
loop_2279:
	stb	%g3,	[%l7 + 0x78]
	srax	%g5,	0x15,	%i0
loop_2280:
	fmovsl	%icc,	%f6,	%f10
	fnands	%f1,	%f6,	%f22
	fornot1s	%f12,	%f15,	%f19
	andcc	%l5,	0x0AB2,	%g2
	tvc	%xcc,	0x1
	tg	%icc,	0x1
	edge16ln	%i3,	%o7,	%l3
	fmovrsgez	%o5,	%f28,	%f16
	edge8ln	%i5,	%g4,	%g1
	fornot1s	%f9,	%f17,	%f31
	sll	%i4,	0x07,	%i7
	sub	%o1,	%l0,	%i1
	array16	%l2,	%i2,	%g7
	fsrc2	%f6,	%f24
	fmovrdlz	%i6,	%f6,	%f4
	bcs	loop_2281
	edge8	%o2,	%l4,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o3
loop_2281:
	movcc	%xcc,	%l1,	%o4
	movcs	%icc,	%g6,	%o6
	xorcc	%l6,	0x1974,	%g3
	mulx	%i0,	%g5,	%l5
	fmovsle	%icc,	%f11,	%f17
	set	0x62, %i1
	stba	%i3,	[%l7 + %i1] 0xea
	membar	#Sync
	movneg	%icc,	%g2,	%l3
	orcc	%o5,	%i5,	%o7
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movcs	%xcc,	%g4,	%g1
	bn,a	%xcc,	loop_2282
	tg	%xcc,	0x7
	or	%i4,	0x1C14,	%i7
	orcc	%l0,	%i1,	%o1
loop_2282:
	edge32ln	%i2,	%l2,	%i6
	tpos	%xcc,	0x5
	movrlez	%o2,	%g7,	%l4
	edge16l	%o3,	%o0,	%l1
	tvs	%xcc,	0x0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o4,	%o6
	umulcc	%l6,	0x10C6,	%g3
	fzeros	%f19
	movvc	%xcc,	%i0,	%g6
	fnot2	%f28,	%f14
	ta	%icc,	0x6
	wr	%g0,	0xea,	%asi
	stwa	%g5,	[%l7 + 0x14] %asi
	membar	#Sync
	fbul	%fcc0,	loop_2283
	ldd	[%l7 + 0x10],	%i2
	tg	%icc,	0x5
	fmovsvc	%xcc,	%f22,	%f13
loop_2283:
	bgu	loop_2284
	fnegd	%f30,	%f6
	alignaddr	%g2,	%l5,	%l3
	edge16l	%o5,	%o7,	%i5
loop_2284:
	fbul,a	%fcc2,	loop_2285
	fmovd	%f16,	%f16
	ldd	[%l7 + 0x30],	%g0
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g4
loop_2285:
	andn	%i7,	%i4,	%l0
	bpos,pt	%xcc,	loop_2286
	brlz,a	%i1,	loop_2287
	and	%i2,	%o1,	%l2
	tcs	%xcc,	0x3
loop_2286:
	fcmple16	%f8,	%f6,	%o2
loop_2287:
	mulscc	%i6,	0x015F,	%g7
	array16	%l4,	%o0,	%o3
	movn	%xcc,	%l1,	%o6
	tvs	%xcc,	0x0
	movleu	%icc,	%o4,	%l6
	edge8n	%i0,	%g6,	%g3
	set	0x28, %o2
	stda	%i2,	[%l7 + %o2] 0xe2
	membar	#Sync
	tvs	%xcc,	0x3
	fble	%fcc1,	loop_2288
	brlz,a	%g5,	loop_2289
	fsrc1s	%f15,	%f5
	fmovrse	%l5,	%f7,	%f27
loop_2288:
	edge32l	%l3,	%g2,	%o7
loop_2289:
	fcmple32	%f22,	%f12,	%i5
	xnorcc	%g1,	%g4,	%o5
	movvc	%xcc,	%i4,	%i7
	sra	%i1,	0x02,	%i2
	xor	%o1,	0x1916,	%l2
	mulscc	%l0,	%i6,	%g7
	addccc	%l4,	%o2,	%o3
	brlez,a	%o0,	loop_2290
	fmovdg	%xcc,	%f22,	%f30
	sdivx	%o6,	0x08BE,	%o4
	xnor	%l6,	0x1499,	%l1
loop_2290:
	st	%f25,	[%l7 + 0x44]
	and	%g6,	%i0,	%i3
	tsubcc	%g5,	0x0FF5,	%g3
	ldub	[%l7 + 0x64],	%l5
	umul	%l3,	%o7,	%g2
	movre	%g1,	%g4,	%o5
	fmovrslz	%i5,	%f14,	%f9
	sdiv	%i4,	0x1029,	%i1
	fnot2s	%f27,	%f0
	subcc	%i2,	0x06A2,	%i7
	sll	%o1,	0x1D,	%l0
	set	0x20, %l1
	ldda	[%l7 + %l1] 0x2b,	%l2
	nop
	setx	loop_2291,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%i6,	%g7,	%l4
	fmuld8sux16	%f1,	%f12,	%f12
	fbn,a	%fcc2,	loop_2292
loop_2291:
	andncc	%o3,	%o2,	%o0
	subccc	%o4,	0x0F73,	%o6
	movrgez	%l6,	%g6,	%l1
loop_2292:
	fmovsl	%icc,	%f20,	%f28
	brlz,a	%i0,	loop_2293
	nop
	setx	loop_2294,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16au	%f9,	%f25,	%f14
	orn	%i3,	0x0E44,	%g5
loop_2293:
	edge8ln	%g3,	%l5,	%l3
loop_2294:
	fbu	%fcc1,	loop_2295
	tvs	%icc,	0x6
	fbue,a	%fcc1,	loop_2296
	nop
	setx	loop_2297,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2295:
	brlz,a	%g2,	loop_2298
	movvc	%xcc,	%g1,	%o7
loop_2296:
	smul	%o5,	%i5,	%i4
loop_2297:
	srl	%i1,	%g4,	%i2
loop_2298:
	tneg	%xcc,	0x5
	fexpand	%f0,	%f0
	set	0x35, %i2
	stba	%i7,	[%l7 + %i2] 0x27
	membar	#Sync
	subcc	%l0,	0x1FDC,	%o1
	bneg,a,pn	%icc,	loop_2299
	taddcc	%l2,	%i6,	%g7
	bge,a,pt	%icc,	loop_2300
	movpos	%icc,	%l4,	%o2
loop_2299:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%o4
loop_2300:
	mova	%icc,	%o0,	%o6
	mova	%icc,	%l6,	%l1
	wr	%g0,	0x81,	%asi
	stxa	%g6,	[%l7 + 0x58] %asi
	move	%icc,	%i0,	%g5
	fmovdcc	%icc,	%f2,	%f18
	sub	%g3,	0x0C89,	%i3
	fpsub32	%f8,	%f30,	%f18
	ldsb	[%l7 + 0x4C],	%l3
	nop
	setx loop_2301, %l0, %l1
	jmpl %l1, %g2
	srl	%g1,	0x18,	%o7
	tvs	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x51] %asi,	%l5
loop_2301:
	siam	0x6
	and	%i5,	0x1A82,	%i4
	movge	%icc,	%o5,	%i1
	sra	%i2,	%g4,	%l0
	sra	%i7,	0x02,	%l2
	edge8n	%o1,	%i6,	%g7
	srl	%l4,	%o2,	%o4
	sethi	0x1E2E,	%o0
	tleu	%xcc,	0x2
	ldsh	[%l7 + 0x52],	%o3
	edge16	%l6,	%o6,	%g6
	fpack16	%f10,	%f14
	fba	%fcc0,	loop_2302
	tsubcctv	%i0,	%l1,	%g3
	edge8ln	%g5,	%i3,	%l3
	movre	%g1,	0x064,	%g2
loop_2302:
	xorcc	%o7,	%i5,	%i4
	xor	%l5,	0x0663,	%i1
	edge8l	%i2,	%g4,	%o5
	orcc	%l0,	0x11EB,	%l2
	andn	%i7,	0x0D47,	%i6
	fbo	%fcc1,	loop_2303
	fbule	%fcc2,	loop_2304
	srlx	%g7,	%o1,	%l4
	srl	%o4,	0x10,	%o0
loop_2303:
	subcc	%o2,	%l6,	%o3
loop_2304:
	lduh	[%l7 + 0x62],	%o6
	andncc	%i0,	%g6,	%g3
	bleu,pn	%xcc,	loop_2305
	subccc	%l1,	0x1E6C,	%g5
	movcs	%xcc,	%i3,	%g1
	nop
	setx	loop_2306,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2305:
	fpmerge	%f27,	%f23,	%f20
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%l2
	mova	%xcc,	%o7,	%g2
loop_2306:
	orcc	%i4,	0x0DC0,	%i5
	stbar
	xorcc	%i1,	%i2,	%l5
	lduw	[%l7 + 0x14],	%o5
	stbar
	movl	%icc,	%l0,	%l2
	fnegs	%f27,	%f27
	tvs	%xcc,	0x0
	alignaddrl	%g4,	%i6,	%i7
	fmovsne	%xcc,	%f3,	%f3
	movvc	%icc,	%g7,	%o1
	udivcc	%l4,	0x11F9,	%o4
	nop
	setx loop_2307, %l0, %l1
	jmpl %l1, %o2
	fbul	%fcc2,	loop_2308
	array8	%l6,	%o3,	%o0
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%f6
loop_2307:
	addcc	%i0,	0x03CE,	%o6
loop_2308:
	tcs	%icc,	0x5
	orncc	%g6,	%g3,	%l1
	fbue	%fcc2,	loop_2309
	movcc	%xcc,	%i3,	%g1
	sub	%l3,	%o7,	%g5
	nop
	setx loop_2310, %l0, %l1
	jmpl %l1, %g2
loop_2309:
	fmovdn	%xcc,	%f27,	%f28
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i4
loop_2310:
	udiv	%i5,	0x10DF,	%i2
	orncc	%i1,	0x143C,	%o5
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x58] %asi,	%l5
	move	%xcc,	%l0,	%l2
	array32	%i6,	%g4,	%g7
	ta	%icc,	0x1
	sth	%o1,	[%l7 + 0x70]
	sllx	%l4,	%o4,	%i7
	edge16l	%l6,	%o2,	%o3
	te	%xcc,	0x4
	bleu,pt	%xcc,	loop_2311
	tgu	%icc,	0x1
	subc	%i0,	%o0,	%o6
	addccc	%g6,	0x1F88,	%l1
loop_2311:
	movrgez	%g3,	0x35C,	%g1
	edge16	%l3,	%i3,	%o7
	movrlz	%g2,	0x145,	%i4
	movrlz	%g5,	%i5,	%i2
	membar	0x60
	tge	%icc,	0x7
	xorcc	%i1,	0x0379,	%l5
	movrgez	%o5,	0x1F9,	%l2
	taddcc	%i6,	0x121F,	%g4
	ta	%xcc,	0x7
	udivcc	%l0,	0x1A75,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pn	%xcc,	loop_2312
	udivx	%g7,	0x0C36,	%l4
	xnor	%o4,	0x044B,	%i7
	srlx	%o2,	0x0A,	%l6
loop_2312:
	edge32	%o3,	%o0,	%i0
	fmovdn	%xcc,	%f6,	%f5
	fbule,a	%fcc1,	loop_2313
	ldsb	[%l7 + 0x6A],	%g6
	movle	%xcc,	%l1,	%o6
	mova	%icc,	%g1,	%g3
loop_2313:
	fmovdcs	%xcc,	%f13,	%f6
	fornot2s	%f16,	%f7,	%f29
	srl	%i3,	0x10,	%l3
	addcc	%o7,	0x0754,	%g2
	fmovrdne	%g5,	%f22,	%f16
	fabsd	%f8,	%f6
	tcs	%xcc,	0x2
	movgu	%xcc,	%i5,	%i4
	tcc	%icc,	0x0
	fnot1	%f10,	%f28
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i2
	movrne	%i1,	%l5,	%l2
	fbo	%fcc0,	loop_2314
	bpos,a	%icc,	loop_2315
	fnot1s	%f22,	%f7
	bge	%icc,	loop_2316
loop_2314:
	add	%o5,	%g4,	%l0
loop_2315:
	tl	%xcc,	0x2
	movl	%xcc,	%i6,	%g7
loop_2316:
	fbul,a	%fcc0,	loop_2317
	edge8l	%o1,	%o4,	%l4
	subccc	%i7,	%l6,	%o3
	sra	%o2,	%i0,	%g6
loop_2317:
	addcc	%l1,	%o0,	%g1
	tcc	%icc,	0x7
	fabsd	%f20,	%f30
	edge32	%o6,	%i3,	%l3
	sdivx	%g3,	0x0758,	%g2
	movge	%xcc,	%g5,	%i5
	movneg	%icc,	%o7,	%i2
	tge	%xcc,	0x6
	movne	%icc,	%i1,	%i4
	tleu	%icc,	0x4
	tn	%xcc,	0x1
	andncc	%l5,	%o5,	%l2
	fandnot1	%f14,	%f26,	%f0
	fmovrsne	%l0,	%f20,	%f29
	ta	%xcc,	0x1
	sdivx	%g4,	0x1EA6,	%g7
	movpos	%xcc,	%o1,	%o4
	bneg,a	loop_2318
	orncc	%i6,	0x060C,	%i7
	andn	%l6,	0x0A0F,	%l4
	tgu	%icc,	0x0
loop_2318:
	fpsub32	%f28,	%f12,	%f18
	movre	%o2,	%i0,	%o3
	movle	%xcc,	%g6,	%l1
	alignaddr	%g1,	%o0,	%o6
	sir	0x1495
	swap	[%l7 + 0x78],	%i3
	nop
	set	0x6E, %g4
	lduh	[%l7 + %g4],	%g3
	fmovsne	%icc,	%f5,	%f23
	tgu	%icc,	0x3
	srlx	%l3,	0x17,	%g5
	tvs	%icc,	0x5
	tgu	%xcc,	0x5
	orn	%g2,	0x149C,	%i5
	fbug,a	%fcc1,	loop_2319
	movrgz	%i2,	%i1,	%o7
	set	0x0, %o6
	ldxa	[%g0 + %o6] 0x4f,	%i4
loop_2319:
	movvs	%icc,	%o5,	%l2
	movne	%xcc,	%l5,	%l0
	set	0x30, %o1
	stda	%g4,	[%l7 + %o1] 0x23
	membar	#Sync
	sdivx	%o1,	0x0BE2,	%g7
	sra	%i6,	%o4,	%l6
	tgu	%icc,	0x1
	fcmpne16	%f28,	%f24,	%i7
	fmovscs	%xcc,	%f23,	%f8
	fmovrde	%l4,	%f6,	%f14
	fbge	%fcc2,	loop_2320
	bl,a	loop_2321
	sethi	0x11D3,	%o2
	mulx	%i0,	%g6,	%l1
loop_2320:
	andcc	%o3,	%g1,	%o6
loop_2321:
	movvc	%icc,	%i3,	%o0
	fbg	%fcc3,	loop_2322
	movneg	%icc,	%g3,	%l3
	tle	%icc,	0x2
	edge8n	%g2,	%g5,	%i5
loop_2322:
	ble,a	%xcc,	loop_2323
	sdivcc	%i1,	0x1497,	%i2
	taddcc	%i4,	0x13B2,	%o5
	sra	%l2,	%l5,	%l0
loop_2323:
	fcmped	%fcc0,	%f2,	%f2
	fbug,a	%fcc0,	loop_2324
	mova	%xcc,	%o7,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%g4,	loop_2325
loop_2324:
	fmovsg	%icc,	%f17,	%f29
	fabsd	%f18,	%f26
	stx	%g7,	[%l7 + 0x18]
loop_2325:
	te	%icc,	0x1
	edge8l	%o4,	%l6,	%i6
	taddcc	%i7,	0x0A60,	%o2
	bneg,pn	%xcc,	loop_2326
	swap	[%l7 + 0x20],	%i0
	mulx	%l4,	0x0CF4,	%l1
	set	0x3C, %l4
	sta	%f21,	[%l7 + %l4] 0x0c
loop_2326:
	fblg,a	%fcc3,	loop_2327
	fsrc1	%f24,	%f12
	addccc	%g6,	%o3,	%g1
	swap	[%l7 + 0x74],	%i3
loop_2327:
	bge,a,pn	%xcc,	loop_2328
	movrne	%o6,	0x26F,	%o0
	edge32n	%g3,	%g2,	%g5
	tcs	%xcc,	0x5
loop_2328:
	addccc	%l3,	0x1DBB,	%i1
	movleu	%xcc,	%i5,	%i2
	fmovsneg	%xcc,	%f8,	%f18
	fmovrdne	%o5,	%f22,	%f14
	srax	%i4,	0x14,	%l2
	ta	%xcc,	0x5
	ldub	[%l7 + 0x21],	%l5
	edge32	%o7,	%l0,	%o1
	set	0x58, %o7
	swapa	[%l7 + %o7] 0x0c,	%g4
	stw	%g7,	[%l7 + 0x70]
	alignaddr	%l6,	%o4,	%i7
	addccc	%o2,	%i6,	%i0
	sra	%l1,	0x19,	%l4
	array16	%o3,	%g6,	%i3
	taddcc	%g1,	%o6,	%g3
	fnegs	%f30,	%f25
	fornot2	%f4,	%f18,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%o0,	0x02D0,	%g5
	fbn	%fcc1,	loop_2329
	movg	%icc,	%g2,	%i1
	fmovsvs	%xcc,	%f15,	%f30
	and	%l3,	0x148F,	%i5
loop_2329:
	bleu	loop_2330
	fblg	%fcc2,	loop_2331
	edge32ln	%i2,	%i4,	%o5
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
loop_2330:
	edge32	%l5,	%l0,	%o7
loop_2331:
	movpos	%xcc,	%g4,	%g7
	edge16l	%l6,	%o1,	%i7
	tvc	%xcc,	0x3
	set	0x2A, %g7
	lduha	[%l7 + %g7] 0x11,	%o2
	fone	%f22
	edge32n	%i6,	%i0,	%o4
	brgz	%l4,	loop_2332
	orn	%o3,	0x1E66,	%l1
	set	0x44, %i4
	sta	%f18,	[%l7 + %i4] 0x04
loop_2332:
	fnand	%f12,	%f26,	%f26
	movge	%icc,	%i3,	%g1
	fmovdcs	%icc,	%f15,	%f3
	andncc	%o6,	%g6,	%g3
	umul	%o0,	%g5,	%g2
	fsrc1s	%f7,	%f9
	fbu	%fcc3,	loop_2333
	fcmpd	%fcc0,	%f14,	%f0
	and	%l3,	%i1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2333:
	nop
	setx	loop_2334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ta	%xcc,	0x1
	fandnot1	%f28,	%f26,	%f2
	movne	%xcc,	%i4,	%i5
loop_2334:
	edge32ln	%l2,	%o5,	%l0
	movn	%icc,	%o7,	%g4
	fcmpes	%fcc0,	%f12,	%f26
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x24] %asi,	%g7
	andn	%l5,	0x0774,	%l6
	fmovdleu	%icc,	%f22,	%f28
	fmovrdne	%i7,	%f28,	%f16
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbuge,a	%fcc3,	loop_2335
	orn	%o2,	0x0FE5,	%i6
	stbar
	tcs	%xcc,	0x6
loop_2335:
	ldsb	[%l7 + 0x7B],	%i0
	fbule	%fcc3,	loop_2336
	nop
	set	0x2A, %i6
	ldub	[%l7 + %i6],	%o4
	sdivcc	%o1,	0x081D,	%l4
	edge8ln	%o3,	%i3,	%l1
loop_2336:
	fcmped	%fcc3,	%f14,	%f22
	tsubcctv	%g1,	%o6,	%g3
	fnot2	%f6,	%f16
	subccc	%o0,	%g5,	%g6
	fmuld8sux16	%f3,	%f18,	%f20
	fmovrde	%g2,	%f26,	%f12
	lduw	[%l7 + 0x20],	%i1
	fpack32	%f12,	%f0,	%f12
	set	0x34, %o0
	lda	[%l7 + %o0] 0x15,	%f30
	movge	%icc,	%l3,	%i4
	movre	%i2,	0x157,	%l2
	tg	%xcc,	0x4
	xnorcc	%i5,	%l0,	%o5
	movn	%xcc,	%g4,	%g7
	brgez	%l5,	loop_2337
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o7,	[%l7 + 0x0C]
	taddcctv	%i7,	0x0463,	%o2
loop_2337:
	orncc	%l6,	0x1D1C,	%i0
	fcmple32	%f14,	%f0,	%o4
	mulscc	%o1,	0x1DF3,	%l4
	fbo	%fcc2,	loop_2338
	fornot2s	%f9,	%f0,	%f22
	fornot2s	%f28,	%f14,	%f25
	fmovsle	%icc,	%f26,	%f20
loop_2338:
	subcc	%o3,	0x03C0,	%i6
	tcc	%xcc,	0x5
	tvc	%xcc,	0x4
	andn	%i3,	%g1,	%o6
	flush	%l7 + 0x50
	fmul8x16al	%f18,	%f24,	%f2
	and	%g3,	%o0,	%l1
	nop
	set	0x31, %l6
	ldub	[%l7 + %l6],	%g6
	edge32	%g5,	%i1,	%l3
	fsrc1	%f24,	%f16
	movn	%xcc,	%g2,	%i2
	brlz	%i4,	loop_2339
	brlez,a	%i5,	loop_2340
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x88,	%l2,	%o5
loop_2339:
	bl,a,pt	%xcc,	loop_2341
loop_2340:
	tg	%icc,	0x6
	ldub	[%l7 + 0x57],	%l0
	movg	%icc,	%g7,	%l5
loop_2341:
	tle	%xcc,	0x1
	std	%f4,	[%l7 + 0x40]
	umul	%g4,	%i7,	%o2
	fbuge,a	%fcc3,	loop_2342
	fpadd16	%f6,	%f4,	%f20
	tge	%xcc,	0x2
	umul	%o7,	%l6,	%i0
loop_2342:
	sra	%o1,	0x0D,	%o4
	movrne	%o3,	%i6,	%i3
	orncc	%l4,	%o6,	%g1
	edge32	%o0,	%g3,	%g6
	bge	%icc,	loop_2343
	fmovsvc	%icc,	%f31,	%f29
	movgu	%icc,	%l1,	%g5
	fbge	%fcc2,	loop_2344
loop_2343:
	nop
	set	0x6C, %l3
	lduw	[%l7 + %l3],	%l3
	tgu	%icc,	0x2
	movge	%xcc,	%g2,	%i1
loop_2344:
	movcs	%icc,	%i4,	%i5
	fmovdcs	%icc,	%f3,	%f14
	std	%f8,	[%l7 + 0x70]
	tle	%icc,	0x6
	movrlz	%i2,	%l2,	%l0
	fzeros	%f21
	sdiv	%g7,	0x0792,	%l5
	bneg,a	%icc,	loop_2345
	ta	%icc,	0x1
	tn	%xcc,	0x4
	fbg	%fcc0,	loop_2346
loop_2345:
	movre	%g4,	%i7,	%o2
	edge32n	%o5,	%l6,	%i0
	andn	%o7,	%o4,	%o1
loop_2346:
	fbl,a	%fcc1,	loop_2347
	bleu	loop_2348
	srl	%i6,	%o3,	%l4
	array32	%o6,	%i3,	%g1
loop_2347:
	fcmple16	%f12,	%f24,	%o0
loop_2348:
	movcs	%xcc,	%g3,	%g6
	fmuld8sux16	%f2,	%f29,	%f10
	tle	%xcc,	0x6
	fmovdcs	%xcc,	%f7,	%f9
	bshuffle	%f16,	%f0,	%f28
	bcc,pn	%xcc,	loop_2349
	subccc	%l1,	%g5,	%g2
	fmuld8sux16	%f4,	%f9,	%f16
	alignaddr	%l3,	%i1,	%i5
loop_2349:
	smul	%i4,	0x0D9C,	%i2
	udivx	%l2,	0x096A,	%l0
	fmovscc	%xcc,	%f6,	%f0
	alignaddr	%g7,	%l5,	%g4
	orncc	%o2,	%i7,	%o5
	fbl	%fcc2,	loop_2350
	fones	%f19
	mulscc	%l6,	%i0,	%o7
	tvs	%icc,	0x5
loop_2350:
	fmovdvc	%xcc,	%f25,	%f30
	tcc	%icc,	0x3
	srlx	%o4,	0x04,	%i6
	taddcc	%o1,	%o3,	%l4
	taddcctv	%o6,	%i3,	%o0
	srax	%g3,	%g6,	%l1
	movg	%icc,	%g5,	%g2
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x7A] %asi,	%l3
	stw	%i1,	[%l7 + 0x3C]
	nop
	setx	loop_2351,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brnz,a	%g1,	loop_2352
	fnor	%f28,	%f10,	%f10
	fpsub16	%f22,	%f18,	%f0
loop_2351:
	ba,a,pt	%icc,	loop_2353
loop_2352:
	movcs	%icc,	%i5,	%i2
	fcmpne16	%f6,	%f10,	%l2
	umulcc	%i4,	%l0,	%g7
loop_2353:
	umul	%g4,	0x0C65,	%o2
	bneg,a	%xcc,	loop_2354
	edge8ln	%l5,	%o5,	%i7
	edge8	%i0,	%o7,	%l6
	movrgez	%o4,	%o1,	%i6
loop_2354:
	movg	%xcc,	%l4,	%o6
	sllx	%o3,	0x1E,	%o0
	ldstub	[%l7 + 0x62],	%g3
	movg	%xcc,	%i3,	%l1
	xnor	%g5,	0x0C07,	%g6
	fmovscs	%xcc,	%f29,	%f13
	fones	%f24
	fmovsvs	%icc,	%f28,	%f26
	fpadd16	%f28,	%f24,	%f16
	edge32n	%g2,	%l3,	%i1
	sdivx	%g1,	0x0A6C,	%i2
	edge32	%i5,	%l2,	%i4
	bl,pt	%xcc,	loop_2355
	srl	%l0,	%g4,	%o2
	wr	%g0,	0x81,	%asi
	stda	%l4,	[%l7 + 0x28] %asi
loop_2355:
	movrlez	%o5,	%g7,	%i0
	set	0x16, %o4
	ldsha	[%l7 + %o4] 0x81,	%i7
	movrgez	%l6,	0x00F,	%o4
	brgz	%o7,	loop_2356
	edge32l	%i6,	%l4,	%o1
	xorcc	%o3,	0x0A03,	%o0
	or	%o6,	0x1797,	%g3
loop_2356:
	fbul	%fcc3,	loop_2357
	tl	%icc,	0x4
	xnorcc	%l1,	%i3,	%g5
	tvs	%icc,	0x4
loop_2357:
	movcs	%xcc,	%g6,	%g2
	fmovdcc	%xcc,	%f13,	%f20
	udivcc	%l3,	0x163F,	%g1
	bneg,pn	%xcc,	loop_2358
	popc	0x0789,	%i2
	addccc	%i1,	0x1330,	%l2
	subc	%i4,	%l0,	%i5
loop_2358:
	umulcc	%g4,	%l5,	%o5
	tcs	%icc,	0x7
	stbar
	movle	%xcc,	%o2,	%i0
	edge8l	%i7,	%g7,	%o4
	wr	%g0,	0xeb,	%asi
	stba	%o7,	[%l7 + 0x4E] %asi
	membar	#Sync
	brgz,a	%i6,	loop_2359
	tsubcctv	%l6,	0x1469,	%o1
	fxors	%f31,	%f9,	%f24
	tsubcctv	%o3,	0x049F,	%o0
loop_2359:
	tcc	%xcc,	0x0
	tle	%xcc,	0x1
	edge32ln	%o6,	%l4,	%g3
	fmovs	%f3,	%f28
	fbul	%fcc0,	loop_2360
	nop
	setx	loop_2361,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%icc,	%i3,	%l1
	movleu	%xcc,	%g5,	%g2
loop_2360:
	move	%icc,	%l3,	%g6
loop_2361:
	movn	%icc,	%i2,	%i1
	tcs	%xcc,	0x4
	subcc	%g1,	%l2,	%i4
	stbar
	tvc	%icc,	0x0
	subc	%i5,	%g4,	%l0
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x70] %asi,	%o5
	subccc	%o2,	0x067B,	%l5
	sth	%i0,	[%l7 + 0x3E]
	fsrc2s	%f29,	%f24
	nop
	setx loop_2362, %l0, %l1
	jmpl %l1, %i7
	fmovsge	%icc,	%f29,	%f5
	wr	%g0,	0x23,	%asi
	stxa	%g7,	[%l7 + 0x50] %asi
	membar	#Sync
loop_2362:
	movrgz	%o4,	%i6,	%l6
	movg	%xcc,	%o7,	%o1
	fmuld8ulx16	%f3,	%f20,	%f18
	nop
	setx	loop_2363,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcs	loop_2364
	bge,pn	%xcc,	loop_2365
	tgu	%xcc,	0x7
loop_2363:
	tcs	%icc,	0x7
loop_2364:
	edge32l	%o3,	%o6,	%o0
loop_2365:
	movn	%xcc,	%g3,	%i3
	alignaddr	%l4,	%g5,	%l1
	fnot2	%f0,	%f24
	andn	%g2,	0x1EEA,	%g6
	tleu	%icc,	0x2
	edge8ln	%i2,	%l3,	%g1
	stw	%l2,	[%l7 + 0x38]
	fmovdne	%icc,	%f6,	%f16
	sllx	%i4,	0x1D,	%i1
	movcc	%icc,	%g4,	%l0
	movvc	%xcc,	%i5,	%o2
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f30
	mova	%icc,	%o5,	%i0
	sdivcc	%i7,	0x1394,	%g7
	movvs	%xcc,	%o4,	%l5
	movpos	%xcc,	%l6,	%i6
	array8	%o1,	%o7,	%o6
	fbo	%fcc1,	loop_2366
	orncc	%o3,	%g3,	%o0
	fblg,a	%fcc2,	loop_2367
	orncc	%i3,	%g5,	%l1
loop_2366:
	orncc	%l4,	%g2,	%i2
	fabss	%f22,	%f0
loop_2367:
	smul	%g6,	%g1,	%l3
	srl	%l2,	%i1,	%i4
	alignaddr	%g4,	%i5,	%l0
	and	%o2,	%o5,	%i0
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%i7
	mulscc	%o4,	%g7,	%l5
	edge32n	%i6,	%l6,	%o1
	set	0x32, %l2
	lduba	[%l7 + %l2] 0x19,	%o7
	tcc	%xcc,	0x5
	movrgez	%o3,	0x098,	%g3
	fornot2	%f4,	%f26,	%f6
	wr	%g0,	0xe3,	%asi
	stba	%o6,	[%l7 + 0x1E] %asi
	membar	#Sync
	udiv	%o0,	0x0C8B,	%i3
	movg	%icc,	%g5,	%l4
	srlx	%l1,	%g2,	%i2
	udiv	%g1,	0x1AA2,	%l3
	bne,a	%icc,	loop_2368
	fbg	%fcc2,	loop_2369
	xnorcc	%g6,	0x000C,	%i1
	tge	%icc,	0x6
loop_2368:
	movrgz	%l2,	%g4,	%i4
loop_2369:
	fandnot1	%f14,	%f18,	%f6
	sdivx	%i5,	0x0ECD,	%l0
	xorcc	%o5,	0x1ED8,	%o2
	ble	loop_2370
	smul	%i7,	%i0,	%g7
	alignaddr	%l5,	%o4,	%l6
	wr	%g0,	0x18,	%asi
	stda	%i6,	[%l7 + 0x20] %asi
loop_2370:
	bpos	%icc,	loop_2371
	bvc,a,pt	%xcc,	loop_2372
	subc	%o1,	%o3,	%o7
	srl	%o6,	0x03,	%o0
loop_2371:
	sdivcc	%i3,	0x1D23,	%g3
loop_2372:
	fmovrslz	%g5,	%f20,	%f13
	nop
	setx loop_2373, %l0, %l1
	jmpl %l1, %l1
	movge	%xcc,	%l4,	%g2
	bn	loop_2374
	movleu	%xcc,	%i2,	%g1
loop_2373:
	alignaddrl	%g6,	%l3,	%i1
	sir	0x14F6
loop_2374:
	fmovda	%icc,	%f17,	%f12
	sll	%g4,	%i4,	%i5
	sdiv	%l0,	0x0DBB,	%l2
	edge16n	%o2,	%i7,	%i0
	wr	%g0,	0x2b,	%asi
	stda	%o4,	[%l7 + 0x28] %asi
	membar	#Sync
	tge	%icc,	0x0
	ba,a	%icc,	loop_2375
	ldsh	[%l7 + 0x72],	%g7
	movrlz	%l5,	%l6,	%i6
	subcc	%o4,	0x02AC,	%o1
loop_2375:
	edge32n	%o3,	%o6,	%o7
	brz	%o0,	loop_2376
	tneg	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g3,	%i3,	%g5
loop_2376:
	sdiv	%l1,	0x1BD5,	%g2
	edge16ln	%l4,	%g1,	%i2
	tpos	%xcc,	0x0
	tcs	%xcc,	0x4
	alignaddrl	%g6,	%l3,	%i1
	ble	loop_2377
	sub	%g4,	0x1280,	%i5
	movge	%icc,	%i4,	%l0
	tgu	%xcc,	0x5
loop_2377:
	array8	%o2,	%l2,	%i7
	ld	[%l7 + 0x14],	%f11
	udivcc	%i0,	0x0ACC,	%o5
	movpos	%icc,	%l5,	%g7
	umulcc	%i6,	%o4,	%l6
	orcc	%o3,	0x1F7B,	%o1
	set	0x7E, %g6
	lduba	[%l7 + %g6] 0x80,	%o6
	udivx	%o0,	0x1B91,	%g3
	edge8n	%o7,	%i3,	%l1
	fmovrsne	%g5,	%f21,	%f6
	sdivcc	%g2,	0x1569,	%g1
	ldub	[%l7 + 0x35],	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f19,	%f0
	edge32n	%g6,	%l3,	%i1
	bleu,pn	%xcc,	loop_2378
	bn	loop_2379
	umulcc	%i2,	0x0B1D,	%g4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
loop_2378:
	fbue,a	%fcc0,	loop_2380
loop_2379:
	sll	%l0,	%o2,	%l2
	udivcc	%i5,	0x0D7C,	%i0
	fbug,a	%fcc1,	loop_2381
loop_2380:
	and	%o5,	%i7,	%l5
	ba,pn	%icc,	loop_2382
	srlx	%g7,	%i6,	%o4
loop_2381:
	fmovdpos	%icc,	%f24,	%f10
	tge	%xcc,	0x6
loop_2382:
	brgz,a	%o3,	loop_2383
	orcc	%l6,	0x06C5,	%o6
	prefetch	[%l7 + 0x10],	 0x2
	ta	%icc,	0x7
loop_2383:
	fexpand	%f13,	%f16
	move	%icc,	%o0,	%g3
	alignaddr	%o1,	%i3,	%o7
	fmovscs	%icc,	%f3,	%f5
	nop
	setx	loop_2384,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%l1,	0x096B,	%g5
	tg	%xcc,	0x0
	smulcc	%g1,	%g2,	%l4
loop_2384:
	fmovrdlz	%l3,	%f20,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i1,	0x0605,	%g6
	movge	%icc,	%g4,	%i4
	udivcc	%l0,	0x0172,	%o2
	mova	%xcc,	%i2,	%l2
	fpadd16s	%f1,	%f18,	%f16
	fbg,a	%fcc3,	loop_2385
	tcs	%xcc,	0x2
	fmovdcc	%icc,	%f22,	%f20
	movle	%icc,	%i0,	%o5
loop_2385:
	nop
	set	0x30, %l0
	ldsba	[%l7 + %l0] 0x04,	%i5
	movrgez	%l5,	0x216,	%i7
	flush	%l7 + 0x50
	tvs	%icc,	0x2
	edge32l	%i6,	%o4,	%g7
	movcs	%xcc,	%l6,	%o3
	stbar
	edge16ln	%o6,	%o0,	%g3
	set	0x34, %g1
	ldswa	[%l7 + %g1] 0x19,	%i3
	xnor	%o7,	0x0A3D,	%l1
	sethi	0x0DD6,	%o1
	tpos	%xcc,	0x7
	fmovdne	%xcc,	%f26,	%f11
	fbl	%fcc3,	loop_2386
	array8	%g5,	%g2,	%l4
	brgz	%l3,	loop_2387
	fbule	%fcc2,	loop_2388
loop_2386:
	edge16ln	%i1,	%g6,	%g4
	brlz	%i4,	loop_2389
loop_2387:
	mulscc	%l0,	%g1,	%o2
loop_2388:
	mova	%xcc,	%l2,	%i0
	fmovdn	%xcc,	%f25,	%f0
loop_2389:
	fabsd	%f10,	%f8
	movrlz	%i2,	%o5,	%l5
	fcmpne32	%f20,	%f0,	%i5
	wr	%g0,	0x0c,	%asi
	sta	%f8,	[%l7 + 0x50] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i6,	0x1A69,	%i7
	movne	%xcc,	%o4,	%g7
	srl	%l6,	%o3,	%o0
	fmovdvs	%icc,	%f0,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%g3,	%f0,	%f14
	edge32l	%o6,	%i3,	%o7
	fmovsl	%icc,	%f4,	%f3
	taddcc	%o1,	%g5,	%g2
	ldsb	[%l7 + 0x0A],	%l4
	movgu	%xcc,	%l3,	%l1
	sra	%i1,	0x09,	%g6
	ldub	[%l7 + 0x51],	%g4
	taddcctv	%l0,	0x146C,	%i4
	sdiv	%o2,	0x032E,	%g1
	udivcc	%l2,	0x00BF,	%i2
	fandnot1s	%f7,	%f0,	%f6
	fmovdvc	%xcc,	%f3,	%f25
	movrgez	%i0,	%o5,	%i5
	ldsw	[%l7 + 0x2C],	%l5
	fcmpgt32	%f30,	%f14,	%i6
	movre	%i7,	0x05F,	%o4
	fmovdg	%icc,	%f24,	%f21
	fmovscs	%icc,	%f6,	%f13
	andn	%l6,	%o3,	%g7
	orcc	%o0,	0x000B,	%o6
	edge32n	%g3,	%o7,	%i3
	fcmped	%fcc3,	%f12,	%f4
	swap	[%l7 + 0x14],	%g5
	tpos	%xcc,	0x2
	tcc	%icc,	0x4
	fmovdge	%icc,	%f19,	%f24
	ldsw	[%l7 + 0x78],	%g2
	tge	%icc,	0x3
	movleu	%xcc,	%o1,	%l3
	sdiv	%l1,	0x1A77,	%l4
	movrgez	%g6,	0x1E4,	%i1
	fors	%f22,	%f11,	%f20
	tge	%icc,	0x1
	subccc	%g4,	%l0,	%i4
	orcc	%g1,	0x11C6,	%l2
	fmul8x16al	%f6,	%f7,	%f28
	popc	%o2,	%i0
	move	%icc,	%i2,	%o5
	movpos	%icc,	%l5,	%i5
	umul	%i7,	%i6,	%l6
	movvs	%icc,	%o3,	%o4
	fmovsneg	%xcc,	%f13,	%f19
	add	%g7,	%o6,	%g3
	sllx	%o0,	%i3,	%o7
	siam	0x7
	tleu	%xcc,	0x6
	fmovsvs	%icc,	%f30,	%f19
	subccc	%g2,	0x1089,	%g5
	ldub	[%l7 + 0x7E],	%o1
	sllx	%l3,	%l1,	%l4
	bvc,pn	%icc,	loop_2390
	xorcc	%g6,	0x1BAC,	%g4
	bgu	loop_2391
	sdivcc	%i1,	0x1030,	%l0
loop_2390:
	tsubcc	%i4,	%l2,	%g1
	movvc	%icc,	%o2,	%i2
loop_2391:
	tgu	%icc,	0x0
	and	%i0,	0x1B8A,	%o5
	subcc	%l5,	0x034A,	%i5
	tcs	%icc,	0x5
	edge8ln	%i6,	%i7,	%l6
	sir	0x0E52
	ta	%xcc,	0x2
	andncc	%o4,	%o3,	%g7
	bg,a	loop_2392
	fnot1s	%f19,	%f25
	tl	%xcc,	0x7
	ldsh	[%l7 + 0x3C],	%g3
loop_2392:
	tsubcctv	%o6,	%i3,	%o7
	udiv	%g2,	0x0D07,	%o0
	tsubcctv	%o1,	0x085E,	%g5
	subccc	%l3,	%l4,	%l1
	xnor	%g4,	%i1,	%g6
	sth	%i4,	[%l7 + 0x60]
	tcc	%icc,	0x4
	udivx	%l0,	0x0163,	%g1
	edge32	%o2,	%l2,	%i2
	smul	%i0,	%o5,	%l5
	ta	%icc,	0x5
	ldsh	[%l7 + 0x6C],	%i6
	fbu	%fcc0,	loop_2393
	fmovsle	%xcc,	%f7,	%f1
	fbuge,a	%fcc2,	loop_2394
	movl	%xcc,	%i5,	%i7
loop_2393:
	tcc	%icc,	0x1
	xnorcc	%o4,	%l6,	%g7
loop_2394:
	fands	%f24,	%f3,	%f4
	edge8	%g3,	%o6,	%i3
	andncc	%o3,	%o7,	%o0
	be,pn	%xcc,	loop_2395
	movleu	%icc,	%g2,	%g5
	popc	%l3,	%l4
	movgu	%xcc,	%l1,	%g4
loop_2395:
	movcs	%icc,	%i1,	%o1
	bneg,a,pn	%xcc,	loop_2396
	fabss	%f22,	%f27
	fcmpeq32	%f22,	%f16,	%i4
	fba,a	%fcc0,	loop_2397
loop_2396:
	fbu,a	%fcc1,	loop_2398
	fpsub16s	%f27,	%f27,	%f30
	fmovse	%xcc,	%f5,	%f13
loop_2397:
	fba	%fcc1,	loop_2399
loop_2398:
	bneg,a	loop_2400
	sllx	%g6,	%l0,	%g1
	movle	%icc,	%l2,	%i2
loop_2399:
	movle	%xcc,	%o2,	%i0
loop_2400:
	movge	%xcc,	%o5,	%i6
	edge8ln	%i5,	%i7,	%o4
	fmovdleu	%icc,	%f22,	%f30
	tsubcc	%l6,	%l5,	%g7
	udivcc	%o6,	0x16DB,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f28,	%f31
	orncc	%i3,	0x01EF,	%o3
	fmovrdlz	%o7,	%f28,	%f28
	move	%icc,	%o0,	%g5
	udiv	%g2,	0x1660,	%l4
	smulcc	%l1,	0x0C28,	%g4
	udivcc	%l3,	0x0CF2,	%o1
	sdivx	%i1,	0x125F,	%g6
	lduw	[%l7 + 0x28],	%l0
	movneg	%xcc,	%i4,	%l2
	fcmped	%fcc0,	%f18,	%f26
	movge	%icc,	%i2,	%o2
	edge32ln	%g1,	%o5,	%i0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x0c,	%i5,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%i6,	%l6
	fandnot1s	%f19,	%f10,	%f13
	fmovsgu	%xcc,	%f12,	%f12
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x11
	movrne	%o4,	%g7,	%l5
	tn	%xcc,	0x4
	fbge,a	%fcc0,	loop_2401
	ba	loop_2402
	tne	%icc,	0x2
	fmovdcc	%xcc,	%f15,	%f5
loop_2401:
	tge	%icc,	0x4
loop_2402:
	tcc	%icc,	0x7
	edge32	%o6,	%i3,	%g3
	fmovrslz	%o3,	%f13,	%f12
	fmovspos	%xcc,	%f21,	%f3
	fmovrsgez	%o0,	%f0,	%f18
	fbg	%fcc2,	loop_2403
	fcmple16	%f22,	%f20,	%g5
	ldsw	[%l7 + 0x14],	%g2
	st	%f14,	[%l7 + 0x54]
loop_2403:
	edge8n	%l4,	%l1,	%g4
	fmovda	%icc,	%f24,	%f1
	swap	[%l7 + 0x5C],	%l3
	brgz	%o1,	loop_2404
	edge32ln	%o7,	%i1,	%g6
	movvc	%xcc,	%l0,	%l2
	edge16	%i2,	%o2,	%i4
loop_2404:
	nop
	set	0x1C, %i5
	stwa	%g1,	[%l7 + %i5] 0x15
	udivcc	%o5,	0x07FD,	%i5
	fones	%f1
	array8	%i7,	%i6,	%i0
	lduw	[%l7 + 0x58],	%o4
	movrlz	%g7,	0x318,	%l6
	tle	%xcc,	0x5
	movleu	%icc,	%l5,	%o6
	fmovse	%icc,	%f26,	%f31
	fmovdcc	%icc,	%f26,	%f25
	set	0x08, %i7
	ldswa	[%l7 + %i7] 0x11,	%i3
	bshuffle	%f28,	%f24,	%f18
	movg	%xcc,	%o3,	%o0
	add	%g3,	%g2,	%g5
	brgz,a	%l1,	loop_2405
	fmovsn	%icc,	%f12,	%f26
	stw	%g4,	[%l7 + 0x2C]
	set	0x24, %i0
	swapa	[%l7 + %i0] 0x80,	%l4
loop_2405:
	lduh	[%l7 + 0x64],	%l3
	mova	%icc,	%o1,	%o7
	fmovdle	%xcc,	%f25,	%f3
	wr	%g0,	0x04,	%asi
	sta	%f4,	[%l7 + 0x0C] %asi
	srlx	%i1,	0x0B,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a,pt	%xcc,	loop_2406
	std	%l2,	[%l7 + 0x10]
	movrgez	%i2,	0x1CC,	%o2
	alignaddr	%i4,	%g1,	%l0
loop_2406:
	movge	%xcc,	%o5,	%i7
	fpmerge	%f8,	%f5,	%f8
	edge16n	%i5,	%i6,	%i0
	set	0x2C, %o5
	lduwa	[%l7 + %o5] 0x0c,	%g7
	smulcc	%l6,	%l5,	%o4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x54] %asi,	%i3
	xnor	%o3,	%o6,	%o0
	fbue,a	%fcc1,	loop_2407
	tleu	%icc,	0x4
	membar	0x13
	xnorcc	%g2,	%g5,	%l1
loop_2407:
	ta	%xcc,	0x6
	array8	%g3,	%l4,	%l3
	bpos	loop_2408
	fnor	%f22,	%f10,	%f6
	fblg,a	%fcc0,	loop_2409
	fcmple32	%f18,	%f30,	%g4
loop_2408:
	nop
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x08] %asi,	%o7
loop_2409:
	tcs	%icc,	0x7
	tpos	%xcc,	0x5
	or	%o1,	%g6,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i2,	%i1,	%o2
	udiv	%g1,	0x1730,	%l0
	mulscc	%i4,	0x0695,	%o5
	fzero	%f18
	edge8l	%i7,	%i6,	%i5
	fbue,a	%fcc1,	loop_2410
	edge32ln	%g7,	%l6,	%i0
	umulcc	%o4,	0x035E,	%l5
	wr	%g0,	0xea,	%asi
	stwa	%o3,	[%l7 + 0x34] %asi
	membar	#Sync
loop_2410:
	tsubcc	%o6,	%o0,	%g2
	set	0x1C, %i3
	lda	[%l7 + %i3] 0x18,	%f18
	tcc	%xcc,	0x7
	udivx	%g5,	0x0795,	%l1
	mulscc	%g3,	%i3,	%l3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x14] %asi,	%l4
	fbul	%fcc1,	loop_2411
	udiv	%g4,	0x0567,	%o7
	mova	%xcc,	%o1,	%l2
	xorcc	%i2,	0x1FB5,	%g6
loop_2411:
	movg	%xcc,	%o2,	%g1
	fands	%f7,	%f27,	%f6
	movpos	%icc,	%i1,	%l0
	movne	%xcc,	%i4,	%o5
	alignaddr	%i6,	%i5,	%g7
	ta	%icc,	0x7
	edge32l	%i7,	%l6,	%o4
	bl,pn	%xcc,	loop_2412
	fsrc2s	%f22,	%f10
	mova	%xcc,	%l5,	%i0
	set	0x10, %g2
	stxa	%o3,	[%l7 + %g2] 0x81
loop_2412:
	tleu	%icc,	0x3
	movleu	%xcc,	%o0,	%o6
	fmovsgu	%icc,	%f2,	%f7
	fblg,a	%fcc2,	loop_2413
	movg	%xcc,	%g2,	%g5
	lduh	[%l7 + 0x60],	%g3
	ble,a	%icc,	loop_2414
loop_2413:
	sdivx	%l1,	0x10EF,	%l3
	xnor	%l4,	%i3,	%o7
	fxnor	%f8,	%f8,	%f14
loop_2414:
	fmovdn	%xcc,	%f24,	%f3
	fmovscs	%icc,	%f31,	%f5
	array8	%g4,	%l2,	%i2
	fmovdvc	%icc,	%f31,	%f30
	edge32n	%g6,	%o2,	%o1
	edge16ln	%i1,	%l0,	%g1
	sethi	0x009C,	%o5
	movrne	%i4,	0x212,	%i6
	flush	%l7 + 0x38
	array32	%i5,	%g7,	%i7
	set	0x30, %i1
	stxa	%o4,	[%l7 + %i1] 0x2b
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f0
	and	%l5,	0x05F5,	%l6
	fbuge	%fcc1,	loop_2415
	tvc	%icc,	0x7
	fcmpne32	%f18,	%f2,	%o3
	movvc	%xcc,	%o0,	%i0
loop_2415:
	be	loop_2416
	fsrc2s	%f16,	%f28
	mova	%icc,	%o6,	%g5
	movrne	%g2,	%g3,	%l3
loop_2416:
	nop
	set	0x10, %i2
	ldda	[%l7 + %i2] 0x0c,	%l4
	tcs	%icc,	0x7
	udiv	%i3,	0x06CC,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g4,	0x252,	%l2
	edge8l	%l1,	%i2,	%g6
	movneg	%icc,	%o1,	%i1
	edge32ln	%l0,	%o2,	%g1
	ldsh	[%l7 + 0x68],	%o5
	fbg	%fcc2,	loop_2417
	fornot2	%f10,	%f0,	%f0
	movcc	%icc,	%i4,	%i5
	fpsub16s	%f24,	%f5,	%f18
loop_2417:
	movre	%i6,	0x1B7,	%g7
	ta	%icc,	0x0
	sdivcc	%i7,	0x1B22,	%o4
	addc	%l6,	0x018E,	%o3
	fcmple32	%f26,	%f22,	%o0
	tsubcctv	%l5,	%i0,	%g5
	tgu	%icc,	0x2
	fmovdvc	%xcc,	%f24,	%f11
	movn	%xcc,	%o6,	%g3
	fmovsne	%xcc,	%f23,	%f3
	movrgz	%g2,	0x128,	%l3
	srl	%i3,	0x14,	%o7
	fxor	%f28,	%f14,	%f26
	xnorcc	%l4,	0x1D5B,	%l2
	movvc	%icc,	%g4,	%i2
	sdiv	%l1,	0x01AB,	%o1
	movvs	%xcc,	%i1,	%g6
	fbul,a	%fcc2,	loop_2418
	fsrc2s	%f17,	%f14
	fpadd32	%f4,	%f2,	%f0
	fmovrsgez	%l0,	%f21,	%f13
loop_2418:
	fpadd32	%f26,	%f20,	%f26
	brlz	%o2,	loop_2419
	ldd	[%l7 + 0x08],	%g0
	fzero	%f2
	array8	%i4,	%o5,	%i5
loop_2419:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%i6
	srl	%i7,	0x00,	%o4
	stb	%l6,	[%l7 + 0x21]
	orn	%o3,	0x0EB5,	%l5
	fmovdcc	%xcc,	%f4,	%f26
	tge	%icc,	0x0
	movpos	%icc,	%o0,	%i0
	bneg,a	%icc,	loop_2420
	edge8n	%g5,	%g3,	%g2
	subc	%o6,	%l3,	%o7
	ba	loop_2421
loop_2420:
	movrlz	%l4,	0x3D7,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f14,	%f11
loop_2421:
	lduh	[%l7 + 0x0C],	%i3
	sdiv	%g4,	0x048F,	%l1
	movrne	%o1,	0x1D6,	%i1
	tleu	%xcc,	0x6
	faligndata	%f4,	%f16,	%f10
	bgu	%icc,	loop_2422
	fnot1s	%f9,	%f27
	subcc	%g6,	%l0,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2422:
	movn	%icc,	%o2,	%g1
	lduh	[%l7 + 0x14],	%i4
	bneg,pn	%xcc,	loop_2423
	bvs,a,pn	%xcc,	loop_2424
	movvc	%icc,	%o5,	%i5
	tle	%icc,	0x5
loop_2423:
	fmovsneg	%icc,	%f18,	%f24
loop_2424:
	fmul8x16au	%f21,	%f16,	%f4
	tvs	%xcc,	0x3
	edge8ln	%i6,	%g7,	%i7
	fmovs	%f25,	%f5
	edge32n	%l6,	%o4,	%l5
	subc	%o0,	0x16A8,	%i0
	faligndata	%f8,	%f12,	%f6
	edge16	%o3,	%g3,	%g2
	fmovsleu	%xcc,	%f9,	%f6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tvs	%icc,	0x4
	array32	%o6,	%l3,	%g5
	movge	%xcc,	%o7,	%l4
	fandnot2s	%f8,	%f8,	%f22
	popc	0x0794,	%i3
	brlz,a	%l2,	loop_2425
	sth	%l1,	[%l7 + 0x44]
	fsrc2s	%f19,	%f24
	fone	%f6
loop_2425:
	fmovrde	%o1,	%f30,	%f0
	andncc	%g4,	%g6,	%i1
	set	0x50, %o2
	swapa	[%l7 + %o2] 0x19,	%l0
	fnegs	%f18,	%f11
	subcc	%i2,	0x0448,	%o2
	edge32	%g1,	%o5,	%i4
	tge	%xcc,	0x5
	set	0x5C, %l5
	ldswa	[%l7 + %l5] 0x14,	%i5
	and	%g7,	0x097A,	%i7
	tpos	%icc,	0x3
	sllx	%i6,	0x1B,	%o4
	movre	%l5,	%l6,	%i0
	xor	%o3,	%o0,	%g3
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0xf8
	membar	#Sync
	fmovdvc	%xcc,	%f4,	%f9
	fsrc1	%f8,	%f22
	fmovdvs	%xcc,	%f18,	%f24
	ldsb	[%l7 + 0x24],	%g2
	xorcc	%o6,	%l3,	%g5
	tpos	%xcc,	0x0
	xnor	%o7,	%i3,	%l2
	fands	%f2,	%f4,	%f1
	sllx	%l4,	%l1,	%o1
	ldstub	[%l7 + 0x68],	%g4
	udiv	%g6,	0x1588,	%l0
	movne	%xcc,	%i1,	%o2
	ldsh	[%l7 + 0x2C],	%i2
	fbne,a	%fcc2,	loop_2426
	movrlz	%o5,	%g1,	%i4
	fpsub32	%f18,	%f28,	%f26
	set	0x70, %o6
	lduwa	[%l7 + %o6] 0x80,	%g7
loop_2426:
	array8	%i5,	%i6,	%o4
	bcs,pt	%xcc,	loop_2427
	brgez,a	%i7,	loop_2428
	tge	%icc,	0x0
	brlz,a	%l6,	loop_2429
loop_2427:
	sethi	0x0521,	%l5
loop_2428:
	fmovsvc	%icc,	%f14,	%f23
	sub	%o3,	%o0,	%i0
loop_2429:
	fmovs	%f31,	%f30
	edge8	%g3,	%o6,	%l3
	fone	%f20
	xnor	%g5,	0x17B5,	%o7
	for	%f18,	%f10,	%f8
	movl	%icc,	%g2,	%l2
	sub	%l4,	0x0CAD,	%i3
	movrlz	%o1,	%l1,	%g4
	tn	%icc,	0x5
	fmovsn	%xcc,	%f7,	%f14
	fxnors	%f14,	%f17,	%f8
	fabss	%f8,	%f30
	fcmpes	%fcc1,	%f21,	%f25
	fmovsneg	%xcc,	%f25,	%f19
	sir	0x12A1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x54] %asi,	%l0
	nop
	setx loop_2430, %l0, %l1
	jmpl %l1, %i1
	fmul8sux16	%f6,	%f20,	%f4
	addccc	%o2,	%g6,	%i2
	subc	%g1,	0x1389,	%i4
loop_2430:
	movrne	%g7,	0x2EF,	%o5
	array8	%i5,	%i6,	%o4
	fbule	%fcc3,	loop_2431
	fpsub16	%f16,	%f24,	%f22
	fmovrse	%l6,	%f14,	%f7
	orcc	%l5,	0x03D5,	%i7
loop_2431:
	membar	0x3A
	ldsb	[%l7 + 0x1A],	%o0
	fpadd32s	%f27,	%f17,	%f9
	tsubcctv	%o3,	%i0,	%g3
	fnand	%f16,	%f4,	%f30
	sdivcc	%o6,	0x1359,	%l3
	addccc	%g5,	%o7,	%g2
	xorcc	%l2,	%i3,	%o1
	set	0x20, %o1
	ldxa	[%g0 + %o1] 0x20,	%l4
	fpadd16	%f20,	%f28,	%f2
	srax	%g4,	%l1,	%i1
	fba	%fcc0,	loop_2432
	umulcc	%o2,	%g6,	%l0
	wr	%g0,	0x23,	%asi
	stha	%i2,	[%l7 + 0x0E] %asi
	membar	#Sync
loop_2432:
	fornot1	%f26,	%f20,	%f24
	umul	%i4,	%g7,	%o5
	fmovdgu	%icc,	%f3,	%f24
	membar	0x3E
	fmovsvs	%xcc,	%f8,	%f27
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc2,	%f1,	%f9
	movrlz	%i6,	%o4,	%l6
	ldx	[%l7 + 0x20],	%g1
	popc	0x11E8,	%l5
	stw	%i7,	[%l7 + 0x10]
	edge16l	%o3,	%o0,	%i0
	orncc	%o6,	0x1C53,	%l3
	movvc	%xcc,	%g3,	%o7
	popc	%g2,	%l2
	movne	%xcc,	%g5,	%i3
	umulcc	%o1,	0x13E5,	%l4
	edge8ln	%l1,	%g4,	%i1
	stw	%g6,	[%l7 + 0x34]
	movge	%icc,	%o2,	%i2
	tvc	%icc,	0x4
	fcmpgt32	%f18,	%f20,	%i4
	edge8n	%g7,	%l0,	%o5
	edge32ln	%i5,	%o4,	%i6
	orcc	%g1,	%l6,	%i7
	fmovscc	%icc,	%f7,	%f1
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
	fmovsg	%xcc,	%f5,	%f7
	fmuld8sux16	%f28,	%f2,	%f16
	movpos	%icc,	%o3,	%o0
	fba,a	%fcc3,	loop_2433
	srlx	%l5,	%o6,	%l3
	movrgez	%g3,	%o7,	%i0
	fones	%f22
loop_2433:
	fmuld8ulx16	%f25,	%f23,	%f10
	wr	%g0,	0x0c,	%asi
	stha	%g2,	[%l7 + 0x2A] %asi
	movrgz	%l2,	0x303,	%g5
	xorcc	%o1,	%l4,	%i3
	bneg,a,pt	%xcc,	loop_2434
	fmovscs	%icc,	%f28,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g4,	%l1,	%i1
loop_2434:
	movcc	%icc,	%g6,	%o2
	sdiv	%i4,	0x0371,	%i2
	srl	%g7,	%o5,	%l0
	sir	0x0BE1
	be	loop_2435
	fnot1	%f6,	%f30
	movl	%icc,	%i5,	%o4
	fbug,a	%fcc3,	loop_2436
loop_2435:
	movcc	%icc,	%i6,	%g1
	movge	%icc,	%i7,	%o3
	fmovrdlez	%o0,	%f4,	%f6
loop_2436:
	fcmpeq16	%f20,	%f30,	%l6
	edge16l	%l5,	%l3,	%o6
	call	loop_2437
	taddcctv	%o7,	%i0,	%g3
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x26] %asi,	%l2
loop_2437:
	movle	%icc,	%g2,	%g5
	edge32ln	%l4,	%o1,	%g4
	alignaddr	%i3,	%i1,	%g6
	taddcctv	%o2,	%i4,	%i2
	edge32	%g7,	%o5,	%l1
	sir	0x02F7
	ble,pn	%icc,	loop_2438
	smul	%i5,	%o4,	%l0
	fornot2	%f18,	%f6,	%f20
	fpmerge	%f16,	%f16,	%f14
loop_2438:
	movvs	%icc,	%i6,	%i7
	fbo,a	%fcc0,	loop_2439
	movrgez	%o3,	%g1,	%o0
	fcmpgt16	%f18,	%f8,	%l5
	movcs	%xcc,	%l6,	%l3
loop_2439:
	ta	%xcc,	0x2
	subccc	%o6,	%o7,	%g3
	tvc	%xcc,	0x1
	movcc	%icc,	%l2,	%i0
	sir	0x0E28
	movrgz	%g5,	%g2,	%o1
	tle	%icc,	0x0
	brlez,a	%l4,	loop_2440
	brgz,a	%i3,	loop_2441
	tne	%xcc,	0x0
	fmuld8sux16	%f19,	%f10,	%f20
loop_2440:
	fcmpne32	%f4,	%f26,	%g4
loop_2441:
	sethi	0x13DF,	%i1
	ta	%xcc,	0x1
	fbl,a	%fcc1,	loop_2442
	edge16	%g6,	%i4,	%o2
	sethi	0x08E0,	%g7
	add	%l7,	0x24,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x0c,	%o5,	%i2
loop_2442:
	movge	%xcc,	%l1,	%i5
	movge	%xcc,	%o4,	%l0
	sethi	0x1DD2,	%i6
	nop
	setx	loop_2443,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%xcc,	0x2
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%i7,	[%g0 + 0x198] %asi ripped by fixASI40.pl ripped by fixASI40.pl
loop_2443:
	xnorcc	%g1,	%o0,	%l5
	fmovrdlez	%l6,	%f22,	%f20
	ldd	[%l7 + 0x68],	%l2
	movcs	%icc,	%o3,	%o6
	subc	%o7,	0x111C,	%g3
	brnz	%l2,	loop_2444
	for	%f26,	%f12,	%f26
	fmovrdlz	%g5,	%f2,	%f0
	tcc	%xcc,	0x2
loop_2444:
	nop
	set	0x70, %g4
	sta	%f18,	[%l7 + %g4] 0x81
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%i0
	ldd	[%l7 + 0x40],	%f4
	movgu	%xcc,	%g2,	%l4
	edge8ln	%i3,	%o1,	%g4
	brnz,a	%g6,	loop_2445
	fbul,a	%fcc1,	loop_2446
	xnor	%i4,	0x0D8C,	%i1
	fcmped	%fcc2,	%f0,	%f16
loop_2445:
	fmovs	%f16,	%f11
loop_2446:
	fcmpes	%fcc3,	%f20,	%f5
	fnot1s	%f17,	%f10
	set	0x50, %g7
	stba	%o2,	[%l7 + %g7] 0x89
	set	0x3C, %i4
	ldswa	[%l7 + %i4] 0x81,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%xcc,	%f8,	%f5
	ldd	[%l7 + 0x58],	%f2
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i2,	%o5
	movn	%xcc,	%l1,	%o4
	umulcc	%l0,	%i5,	%i7
	fmovrsgez	%g1,	%f17,	%f8
	sdivcc	%i6,	0x107A,	%l5
	sethi	0x0E13,	%l6
	sub	%l3,	%o3,	%o0
	subccc	%o6,	0x0625,	%g3
	fpadd32s	%f31,	%f18,	%f23
	fmovrslez	%l2,	%f31,	%f1
	movl	%icc,	%g5,	%i0
	bpos,a,pt	%xcc,	loop_2447
	smul	%o7,	0x0ED3,	%l4
	orncc	%g2,	%o1,	%i3
	movn	%xcc,	%g6,	%i4
loop_2447:
	fmovrdne	%i1,	%f26,	%f24
	fmul8ulx16	%f14,	%f30,	%f22
	udivx	%o2,	0x11B9,	%g4
	set	0x30, %i6
	stxa	%g7,	[%l7 + %i6] 0x04
	subccc	%o5,	%l1,	%i2
	fcmpd	%fcc3,	%f6,	%f20
	tl	%icc,	0x2
	tne	%icc,	0x2
	fmovsgu	%icc,	%f18,	%f5
	array16	%l0,	%i5,	%o4
	array32	%g1,	%i6,	%l5
	lduw	[%l7 + 0x44],	%i7
	tne	%icc,	0x7
	membar	0x42
	popc	0x0921,	%l3
	umul	%o3,	%o0,	%l6
	ldsw	[%l7 + 0x50],	%g3
	fmovrslz	%l2,	%f1,	%f28
	subccc	%o6,	%g5,	%i0
	sub	%o7,	0x10D7,	%l4
	edge32ln	%g2,	%o1,	%g6
	movgu	%xcc,	%i3,	%i1
	fbl,a	%fcc3,	loop_2448
	srlx	%i4,	%o2,	%g7
	sra	%g4,	0x1D,	%l1
	fpadd32	%f6,	%f24,	%f2
loop_2448:
	flush	%l7 + 0x24
	mova	%xcc,	%i2,	%o5
	siam	0x2
	srax	%l0,	0x0A,	%i5
	taddcc	%o4,	0x1C1C,	%g1
	ldub	[%l7 + 0x10],	%i6
	tcc	%xcc,	0x0
	orcc	%l5,	%i7,	%o3
	fmovsne	%xcc,	%f22,	%f14
	bne,pt	%icc,	loop_2449
	subccc	%l3,	%o0,	%g3
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
loop_2449:
	tneg	%icc,	0x5
	tgu	%icc,	0x1
	fmovrdlz	%l2,	%f12,	%f10
	smulcc	%o6,	%i0,	%o7
	edge32ln	%l4,	%g2,	%o1
	sethi	0x0EEC,	%g6
	srl	%i3,	%g5,	%i4
	tleu	%xcc,	0x1
	fmovsg	%xcc,	%f9,	%f24
	ldsh	[%l7 + 0x38],	%i1
	tpos	%xcc,	0x2
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x14,	%f0
	smul	%g7,	%o2,	%l1
	bneg,pt	%xcc,	loop_2450
	fcmpne32	%f26,	%f30,	%i2
	andn	%o5,	0x13C8,	%g4
	bg,a	loop_2451
loop_2450:
	ldsw	[%l7 + 0x20],	%l0
	movn	%icc,	%o4,	%g1
	bvc,pn	%xcc,	loop_2452
loop_2451:
	udivcc	%i5,	0x1C6E,	%i6
	udiv	%l5,	0x0243,	%i7
	tg	%xcc,	0x6
loop_2452:
	fbn	%fcc3,	loop_2453
	edge16l	%l3,	%o3,	%o0
	movcc	%icc,	%l6,	%l2
	movvs	%icc,	%g3,	%i0
loop_2453:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x4
	movne	%icc,	%o6,	%l4
	tsubcctv	%g2,	%o1,	%o7
	fbe	%fcc3,	loop_2454
	movrne	%i3,	%g6,	%g5
	tvs	%icc,	0x5
	fmovda	%icc,	%f1,	%f21
loop_2454:
	edge8n	%i4,	%i1,	%o2
	movre	%l1,	0x254,	%i2
	movpos	%xcc,	%g7,	%g4
	fands	%f23,	%f13,	%f5
	array8	%l0,	%o4,	%o5
	fmovsg	%xcc,	%f25,	%f27
	movge	%icc,	%g1,	%i5
	fnegs	%f29,	%f24
	bcs,pt	%icc,	loop_2455
	tvc	%icc,	0x6
	sllx	%i6,	0x01,	%l5
	movrne	%l3,	%i7,	%o3
loop_2455:
	ldsh	[%l7 + 0x62],	%l6
	edge8n	%o0,	%l2,	%i0
	fmovscs	%icc,	%f24,	%f4
	srl	%o6,	0x0E,	%l4
	subccc	%g2,	0x00BD,	%g3
	tg	%icc,	0x0
	stx	%o7,	[%l7 + 0x68]
	edge32ln	%i3,	%g6,	%o1
	nop
	set	0x28, %o7
	std	%f30,	[%l7 + %o7]
	edge8ln	%i4,	%i1,	%g5
	subc	%o2,	%i2,	%l1
	bshuffle	%f0,	%f6,	%f16
	tcs	%icc,	0x5
	smulcc	%g4,	0x0666,	%g7
	edge8n	%l0,	%o5,	%o4
	fmovdle	%xcc,	%f20,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g1,	%i5,	%i6
	nop
	set	0x18, %l6
	prefetch	[%l7 + %l6],	 0x0
	movre	%l3,	%i7,	%o3
	movvc	%icc,	%l5,	%l6
	sdivcc	%o0,	0x1127,	%l2
	bgu,pn	%icc,	loop_2456
	brgz	%o6,	loop_2457
	nop
	setx	loop_2458,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrslez	%l4,	%f23,	%f26
loop_2456:
	fnot2	%f6,	%f16
loop_2457:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x64] %asi,	%g2
loop_2458:
	movg	%xcc,	%i0,	%o7
	fbge,a	%fcc2,	loop_2459
	movge	%xcc,	%g3,	%i3
	edge8l	%g6,	%i4,	%i1
	ldsb	[%l7 + 0x38],	%g5
loop_2459:
	nop
	setx	loop_2460,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subcc	%o1,	%o2,	%l1
	sdivx	%i2,	0x0679,	%g7
	subccc	%l0,	0x1A22,	%g4
loop_2460:
	orn	%o5,	0x04B9,	%o4
	membar	0x0B
	for	%f22,	%f30,	%f20
	addcc	%g1,	0x0ED3,	%i5
	movpos	%icc,	%i6,	%l3
	orn	%o3,	%l5,	%l6
	movne	%xcc,	%i7,	%o0
	tgu	%xcc,	0x7
	faligndata	%f20,	%f16,	%f10
	fmovsleu	%xcc,	%f2,	%f16
	umul	%l2,	0x0520,	%l4
	tn	%xcc,	0x6
	taddcc	%o6,	0x0FAF,	%i0
	addc	%g2,	0x140B,	%o7
	movrne	%g3,	%g6,	%i4
	ldd	[%l7 + 0x10],	%f16
	tle	%icc,	0x6
	popc	%i3,	%i1
	brlez,a	%g5,	loop_2461
	fpmerge	%f2,	%f15,	%f30
	fmul8ulx16	%f14,	%f4,	%f18
	tsubcctv	%o1,	%l1,	%o2
loop_2461:
	movvc	%xcc,	%i2,	%l0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x40] %asi,	%g4
	te	%xcc,	0x3
	edge8	%g7,	%o5,	%o4
	edge8n	%i5,	%g1,	%l3
	tsubcc	%o3,	%i6,	%l6
	bne	%icc,	loop_2462
	bleu,a,pn	%icc,	loop_2463
	array8	%l5,	%i7,	%o0
	alignaddrl	%l2,	%l4,	%o6
loop_2462:
	nop
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2463:
	brgez,a	%i0,	loop_2464
	fmul8sux16	%f18,	%f24,	%f16
	movcs	%xcc,	%g2,	%g3
	srl	%o7,	%i4,	%g6
loop_2464:
	edge8ln	%i3,	%g5,	%o1
	edge32	%l1,	%i1,	%o2
	fornot2	%f26,	%f14,	%f10
	fmovdgu	%icc,	%f17,	%f9
	fmovdne	%icc,	%f19,	%f17
	sll	%i2,	%l0,	%g7
	brlez,a	%g4,	loop_2465
	movge	%icc,	%o5,	%i5
	set	0x34, %o4
	swapa	[%l7 + %o4] 0x80,	%g1
loop_2465:
	nop
	set	0x30, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0x3
	xor	%o3,	%o4,	%l6
	sra	%l5,	%i7,	%i6
	edge8ln	%l2,	%l4,	%o6
	edge8	%o0,	%i0,	%g2
	move	%icc,	%g3,	%o7
	bne,pn	%icc,	loop_2466
	bleu,a	loop_2467
	fba	%fcc1,	loop_2468
	umulcc	%i4,	%i3,	%g5
loop_2466:
	xorcc	%o1,	%l1,	%g6
loop_2467:
	mulscc	%i1,	0x0ACC,	%i2
loop_2468:
	bne,a	loop_2469
	stbar
	flush	%l7 + 0x28
	ld	[%l7 + 0x2C],	%f5
loop_2469:
	movrlz	%l0,	0x154,	%g7
	set	0x58, %l2
	ldswa	[%l7 + %l2] 0x18,	%o2
	addccc	%o5,	0x1D17,	%g4
	tleu	%xcc,	0x3
	set	0x20, %g3
	ldda	[%l7 + %g3] 0xea,	%i4
	movrgez	%g1,	%o3,	%o4
	tle	%xcc,	0x6
	fxnor	%f16,	%f10,	%f26
	movleu	%xcc,	%l6,	%l3
	orn	%i7,	0x1AAA,	%i6
	set	0x38, %l0
	ldxa	[%l7 + %l0] 0x10,	%l5
	fbu	%fcc0,	loop_2470
	tsubcc	%l4,	%l2,	%o6
	edge8ln	%i0,	%o0,	%g3
	lduw	[%l7 + 0x54],	%o7
loop_2470:
	bgu,a	%icc,	loop_2471
	fexpand	%f29,	%f10
	fsrc2	%f14,	%f18
	tn	%xcc,	0x1
loop_2471:
	sub	%g2,	0x0323,	%i4
	fmovrdgez	%g5,	%f12,	%f4
	te	%icc,	0x2
	srlx	%o1,	%i3,	%l1
	fmovsneg	%xcc,	%f8,	%f28
	tsubcc	%i1,	0x0D40,	%g6
	subccc	%i2,	0x088B,	%l0
	bneg,a,pn	%xcc,	loop_2472
	move	%xcc,	%o2,	%g7
	bpos	loop_2473
	sub	%o5,	0x1050,	%g4
loop_2472:
	edge32n	%g1,	%i5,	%o3
	movrlz	%o4,	0x174,	%l6
loop_2473:
	or	%i7,	%l3,	%l5
	fxnor	%f16,	%f18,	%f24
	brgez,a	%l4,	loop_2474
	movrlez	%i6,	0x367,	%o6
	sll	%l2,	%i0,	%g3
	fbg	%fcc2,	loop_2475
loop_2474:
	edge8n	%o0,	%o7,	%i4
	tle	%xcc,	0x4
	ldsh	[%l7 + 0x4E],	%g5
loop_2475:
	smulcc	%o1,	%i3,	%g2
	fbule	%fcc1,	loop_2476
	mova	%icc,	%l1,	%i1
	sdiv	%g6,	0x00D6,	%i2
	fxnors	%f28,	%f14,	%f10
loop_2476:
	sethi	0x060B,	%o2
	and	%l0,	0x1776,	%g7
	edge16	%g4,	%g1,	%o5
	move	%xcc,	%o3,	%i5
	umul	%o4,	0x1FFD,	%l6
	popc	0x1D56,	%i7
	nop
	setx loop_2477, %l0, %l1
	jmpl %l1, %l3
	sll	%l5,	0x18,	%l4
	edge32l	%i6,	%o6,	%l2
	tsubcc	%g3,	%o0,	%i0
loop_2477:
	fnot2s	%f1,	%f23
	tge	%xcc,	0x6
	tcs	%xcc,	0x0
	movle	%icc,	%o7,	%g5
	movge	%xcc,	%i4,	%i3
	tvs	%xcc,	0x1
	ldd	[%l7 + 0x18],	%g2
	sub	%o1,	%i1,	%g6
	udiv	%l1,	0x190C,	%i2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x58] %asi,	%f29
	edge8	%l0,	%g7,	%g4
	edge8n	%o2,	%g1,	%o3
	fxors	%f22,	%f29,	%f11
	xnorcc	%o5,	%i5,	%o4
	bneg,a	%xcc,	loop_2478
	membar	0x4D
	movre	%i7,	%l3,	%l6
	lduh	[%l7 + 0x5E],	%l5
loop_2478:
	udivcc	%i6,	0x1B7F,	%l4
	fbn	%fcc2,	loop_2479
	fbul	%fcc3,	loop_2480
	fbul,a	%fcc0,	loop_2481
	movgu	%xcc,	%l2,	%g3
loop_2479:
	tcs	%xcc,	0x4
loop_2480:
	call	loop_2482
loop_2481:
	taddcctv	%o6,	0x05AF,	%i0
	fnot2	%f26,	%f4
	taddcc	%o7,	%g5,	%o0
loop_2482:
	udivx	%i3,	0x0329,	%i4
	edge8ln	%o1,	%i1,	%g2
	addccc	%l1,	%i2,	%g6
	sdivx	%g7,	0x0C57,	%l0
	movrgz	%o2,	%g4,	%g1
	movrlz	%o5,	0x1DC,	%i5
	bne,a,pn	%icc,	loop_2483
	alignaddrl	%o3,	%o4,	%i7
	call	loop_2484
	fmovdgu	%xcc,	%f16,	%f4
loop_2483:
	fbe,a	%fcc1,	loop_2485
	fxnor	%f18,	%f0,	%f4
loop_2484:
	sdiv	%l6,	0x0705,	%l3
	brgez	%l5,	loop_2486
loop_2485:
	stbar
	alignaddr	%l4,	%l2,	%g3
	bcs,a,pn	%xcc,	loop_2487
loop_2486:
	fornot1	%f18,	%f6,	%f4
	st	%f21,	[%l7 + 0x20]
	ld	[%l7 + 0x34],	%f9
loop_2487:
	movre	%o6,	0x37A,	%i6
	edge8	%o7,	%g5,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i3,	%i0,	%i4
	bge,a	loop_2488
	udiv	%i1,	0x0086,	%g2
	movn	%xcc,	%l1,	%i2
	alignaddrl	%g6,	%g7,	%l0
loop_2488:
	andn	%o2,	0x1967,	%g4
	orn	%o1,	0x1292,	%o5
	movrlz	%g1,	0x3B1,	%o3
	subcc	%i5,	%o4,	%l6
	tvc	%icc,	0x7
	subc	%l3,	0x1B93,	%l5
	fones	%f3
	edge8ln	%l4,	%l2,	%g3
	fpsub16s	%f10,	%f13,	%f19
	alignaddrl	%o6,	%i7,	%o7
	fmovrdlz	%g5,	%f2,	%f18
	mulscc	%o0,	0x1B5C,	%i3
	array32	%i0,	%i6,	%i4
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x0c
	sir	0x1D63
	movl	%icc,	%i1,	%g2
	movge	%xcc,	%i2,	%l1
	andncc	%g7,	%l0,	%o2
	tge	%xcc,	0x7
	brnz	%g4,	loop_2489
	sth	%o1,	[%l7 + 0x1E]
	tne	%xcc,	0x5
	sir	0x0638
loop_2489:
	be	loop_2490
	edge16ln	%o5,	%g6,	%o3
	addccc	%i5,	%o4,	%l6
	addccc	%g1,	%l3,	%l4
loop_2490:
	tneg	%xcc,	0x7
	edge8n	%l2,	%l5,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o6,	0x20B,	%i7
	mova	%xcc,	%o7,	%o0
	andn	%g5,	0x19D9,	%i3
	tl	%xcc,	0x4
	fmovscs	%xcc,	%f16,	%f31
	umul	%i6,	%i0,	%i4
	bpos,pn	%xcc,	loop_2491
	sdivx	%g2,	0x0978,	%i1
	ta	%xcc,	0x1
	stx	%i2,	[%l7 + 0x78]
loop_2491:
	edge32l	%l1,	%g7,	%l0
	bg	loop_2492
	array16	%g4,	%o1,	%o2
	nop
	setx loop_2493, %l0, %l1
	jmpl %l1, %g6
	movg	%icc,	%o5,	%i5
loop_2492:
	stx	%o4,	[%l7 + 0x68]
	fpackfix	%f30,	%f9
loop_2493:
	movrne	%o3,	0x2A7,	%g1
	fnegd	%f10,	%f30
	tleu	%xcc,	0x1
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	fmovsa	%xcc,	%f18,	%f31
	orncc	%l4,	0x1ECC,	%l2
	array16	%l3,	%g3,	%o6
	edge16n	%l5,	%o7,	%o0
	fone	%f30
	bge	%xcc,	loop_2494
	fandnot2s	%f24,	%f28,	%f15
	bpos	%icc,	loop_2495
	tgu	%xcc,	0x0
loop_2494:
	tgu	%xcc,	0x6
	fmovrdlez	%i7,	%f8,	%f10
loop_2495:
	udivx	%g5,	0x192F,	%i3
	mulscc	%i6,	%i0,	%i4
	ldd	[%l7 + 0x60],	%f28
	bcs,pn	%icc,	loop_2496
	fmovse	%xcc,	%f8,	%f23
	bgu,a,pt	%xcc,	loop_2497
	orcc	%g2,	%i2,	%l1
loop_2496:
	srax	%i1,	%l0,	%g7
	addcc	%o1,	0x056A,	%g4
loop_2497:
	srl	%g6,	%o5,	%i5
	tvc	%xcc,	0x1
	movvs	%icc,	%o2,	%o3
	tle	%xcc,	0x5
	umulcc	%g1,	0x0EE3,	%o4
	call	loop_2498
	fnot1	%f14,	%f8
	fmovscc	%icc,	%f3,	%f27
	xorcc	%l6,	%l2,	%l4
loop_2498:
	movrlz	%l3,	0x317,	%o6
	bleu,a	%icc,	loop_2499
	fba	%fcc1,	loop_2500
	fmuld8ulx16	%f27,	%f30,	%f26
	bcc,a	loop_2501
loop_2499:
	stbar
loop_2500:
	sra	%l5,	0x0E,	%g3
	set	0x34, %g6
	ldsba	[%l7 + %g6] 0x04,	%o0
loop_2501:
	edge16	%i7,	%o7,	%g5
	bl,pn	%xcc,	loop_2502
	edge8	%i6,	%i0,	%i3
	fnot2s	%f21,	%f16
	xor	%g2,	0x109D,	%i2
loop_2502:
	fmovrdgz	%i4,	%f12,	%f30
	andncc	%l1,	%l0,	%i1
	sdivcc	%o1,	0x1482,	%g4
	and	%g7,	0x176D,	%g6
	std	%i4,	[%l7 + 0x68]
	tg	%icc,	0x7
	nop
	setx loop_2503, %l0, %l1
	jmpl %l1, %o2
	addc	%o5,	%g1,	%o3
	umul	%o4,	%l2,	%l6
	edge8n	%l3,	%o6,	%l5
loop_2503:
	orcc	%l4,	0x0987,	%g3
	wr	%g0,	0x81,	%asi
	stha	%i7,	[%l7 + 0x6A] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f26,	%f27
	fblg,a	%fcc1,	loop_2504
	tgu	%xcc,	0x1
	sdivx	%o7,	0x186E,	%o0
	ldsh	[%l7 + 0x42],	%i6
loop_2504:
	edge32l	%i0,	%g5,	%g2
	xor	%i2,	%i4,	%i3
	wr	%g0,	0x27,	%asi
	stda	%l0,	[%l7 + 0x08] %asi
	membar	#Sync
	bvc,a	%xcc,	loop_2505
	movvc	%icc,	%i1,	%o1
	tge	%icc,	0x7
	ldstub	[%l7 + 0x45],	%l1
loop_2505:
	fbe	%fcc2,	loop_2506
	fnot2	%f28,	%f12
	sethi	0x13B3,	%g4
	sub	%g7,	%i5,	%g6
loop_2506:
	fmovdvc	%icc,	%f24,	%f7
	movgu	%xcc,	%o2,	%g1
	st	%f4,	[%l7 + 0x6C]
	fbug,a	%fcc2,	loop_2507
	ld	[%l7 + 0x58],	%f8
	brlz,a	%o3,	loop_2508
	array32	%o4,	%l2,	%l6
loop_2507:
	fmovda	%xcc,	%f25,	%f18
	taddcctv	%o5,	%l3,	%o6
loop_2508:
	tpos	%xcc,	0x4
	movrlz	%l5,	%l4,	%g3
	set	0x73, %g5
	ldstuba	[%l7 + %g5] 0x10,	%i7
	fmovrsne	%o7,	%f21,	%f27
	fnot1	%f10,	%f16
	fxors	%f7,	%f29,	%f7
	movle	%icc,	%i6,	%i0
	fcmpgt16	%f2,	%f18,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o0,	%i2,	%g2
	fmul8x16au	%f30,	%f14,	%f4
	xor	%i4,	0x0B01,	%i3
	edge8	%l0,	%i1,	%l1
	fpack32	%f8,	%f6,	%f4
	umulcc	%g4,	0x04E6,	%g7
	nop
	set	0x40, %i5
	ldx	[%l7 + %i5],	%i5
	udivx	%g6,	0x00F5,	%o2
	tpos	%icc,	0x3
	tpos	%xcc,	0x5
	brz,a	%o1,	loop_2509
	fpackfix	%f2,	%f25
	edge32n	%o3,	%g1,	%l2
	brlz,a	%l6,	loop_2510
loop_2509:
	edge8ln	%o5,	%l3,	%o4
	sll	%l5,	%l4,	%o6
	ldub	[%l7 + 0x3C],	%i7
loop_2510:
	fnot2	%f2,	%f24
	movrgz	%g3,	%i6,	%o7
	movneg	%xcc,	%i0,	%g5
	sdiv	%i2,	0x1298,	%o0
	sra	%g2,	0x1E,	%i4
	bl,a	loop_2511
	fcmpgt32	%f14,	%f30,	%l0
	fmovrse	%i3,	%f8,	%f25
	movcc	%icc,	%l1,	%g4
loop_2511:
	mulscc	%i1,	0x0C2A,	%g7
	tgu	%xcc,	0x0
	fmovsleu	%icc,	%f21,	%f16
	array16	%i5,	%o2,	%g6
	fmovsneg	%xcc,	%f8,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f28
	st	%f13,	[%l7 + 0x18]
	movrne	%o3,	%g1,	%l2
	movl	%icc,	%o1,	%l6
	fpadd32s	%f27,	%f30,	%f12
	andn	%o5,	%l3,	%l5
	nop
	setx	loop_2512,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%icc,	%l4,	%o4
	movneg	%xcc,	%o6,	%g3
	fpsub32s	%f20,	%f0,	%f13
loop_2512:
	andn	%i6,	%i7,	%i0
	fpack16	%f26,	%f8
	bn,a	%icc,	loop_2513
	fmovde	%xcc,	%f0,	%f18
	fnot1s	%f2,	%f26
	fmovrslz	%o7,	%f2,	%f11
loop_2513:
	tpos	%xcc,	0x1
	faligndata	%f16,	%f14,	%f24
	movne	%icc,	%i2,	%o0
	sdiv	%g5,	0x0F04,	%i4
	movle	%xcc,	%l0,	%i3
	xor	%l1,	0x17F3,	%g4
	taddcctv	%g2,	0x00AA,	%g7
	fmovsge	%icc,	%f29,	%f20
	fabsd	%f24,	%f14
	fcmpne16	%f4,	%f14,	%i1
	set	0x6A, %i0
	stba	%o2,	[%l7 + %i0] 0x2a
	membar	#Sync
	lduh	[%l7 + 0x08],	%i5
	tn	%xcc,	0x7
	sdivcc	%g6,	0x0B03,	%o3
	tn	%xcc,	0x3
	udivx	%l2,	0x1D14,	%g1
	edge16l	%l6,	%o5,	%o1
	set	0x28, %i7
	stda	%l4,	[%l7 + %i7] 0x19
	subcc	%l3,	%l4,	%o4
	smulcc	%o6,	%g3,	%i6
	set	0x13, %i3
	lduba	[%l7 + %i3] 0x15,	%i0
	xnor	%o7,	%i2,	%i7
	subc	%o0,	0x047C,	%i4
	xor	%g5,	0x064A,	%i3
	movn	%icc,	%l0,	%g4
	movcs	%xcc,	%l1,	%g2
	ldub	[%l7 + 0x6D],	%i1
	fmovdn	%icc,	%f28,	%f18
	fbule	%fcc2,	loop_2514
	fbg,a	%fcc0,	loop_2515
	add	%o2,	%g7,	%g6
	popc	%i5,	%o3
loop_2514:
	fcmpne16	%f20,	%f14,	%l2
loop_2515:
	nop
	set	0x1C, %o5
	lduwa	[%l7 + %o5] 0x89,	%l6
	sdivx	%o5,	0x1346,	%o1
	tle	%icc,	0x4
	fmovrse	%g1,	%f20,	%f21
	array32	%l3,	%l4,	%l5
	tvs	%xcc,	0x6
	fbug	%fcc1,	loop_2516
	fabss	%f29,	%f2
	mulx	%o6,	%o4,	%i6
	tcs	%icc,	0x6
loop_2516:
	fxnor	%f24,	%f22,	%f28
	wr	%g0,	0x2a,	%asi
	stba	%g3,	[%l7 + 0x4A] %asi
	membar	#Sync
	smulcc	%o7,	%i0,	%i2
	movpos	%icc,	%o0,	%i4
	movcs	%xcc,	%g5,	%i7
	orn	%l0,	%i3,	%g4
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%g2
	sub	%l1,	0x13EC,	%o2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g7,	%g6
	st	%f14,	[%l7 + 0x24]
	movrne	%i1,	%i5,	%l2
	bpos,a,pn	%icc,	loop_2517
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l6,	0x04C,	%o5
	fbul,a	%fcc0,	loop_2518
loop_2517:
	mova	%xcc,	%o1,	%g1
	tg	%xcc,	0x2
	srlx	%l3,	0x19,	%o3
loop_2518:
	orn	%l4,	0x1877,	%l5
	sth	%o6,	[%l7 + 0x50]
	stb	%i6,	[%l7 + 0x27]
	orncc	%o4,	%o7,	%g3
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
	tcs	%xcc,	0x0
	tvs	%icc,	0x1
	fmovda	%xcc,	%f9,	%f29
	fmovdg	%xcc,	%f2,	%f10
	wr	%g0,	0xea,	%asi
	stxa	%i2,	[%l7 + 0x30] %asi
	membar	#Sync
	edge32n	%i4,	%o0,	%g5
	fmovdgu	%icc,	%f23,	%f12
	nop
	set	0x70, %g2
	stx	%l0,	[%l7 + %g2]
	movrlz	%i7,	0x3B7,	%i3
	movvs	%icc,	%g4,	%l1
	ldd	[%l7 + 0x48],	%g2
	movgu	%xcc,	%o2,	%g6
	fxnor	%f28,	%f4,	%f16
	fmul8x16au	%f17,	%f6,	%f30
	sethi	0x1CEB,	%i1
	fcmpne32	%f6,	%f16,	%i5
	xnor	%g7,	%l2,	%o5
	nop
	set	0x28, %i1
	prefetch	[%l7 + %i1],	 0x2
	tgu	%xcc,	0x3
	subccc	%o1,	%g1,	%l3
	add	%o3,	0x1F1F,	%l6
	call	loop_2519
	brlz	%l4,	loop_2520
	pdist	%f8,	%f14,	%f6
	srlx	%l5,	%i6,	%o6
loop_2519:
	movrgez	%o7,	%g3,	%o4
loop_2520:
	addc	%i2,	0x010F,	%i4
	fmovsvc	%xcc,	%f9,	%f29
	fmovscs	%xcc,	%f1,	%f3
	fmovsne	%xcc,	%f9,	%f30
	fmovdpos	%xcc,	%f19,	%f26
	edge8n	%i0,	%o0,	%g5
	tl	%icc,	0x3
	fmul8x16al	%f10,	%f14,	%f16
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x74] %asi,	%i7
	bl	%xcc,	loop_2521
	tcs	%xcc,	0x6
	tle	%xcc,	0x0
	movre	%i3,	0x0B7,	%g4
loop_2521:
	addc	%l1,	%g2,	%l0
	orn	%g6,	%o2,	%i1
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	taddcctv	%i5,	0x1F81,	%g7
	sethi	0x13C6,	%l2
	alignaddr	%o1,	%o5,	%g1
	andn	%l3,	%o3,	%l6
	udivcc	%l4,	0x179A,	%l5
	array8	%o6,	%i6,	%o7
	smul	%g3,	0x0FC4,	%i2
	umul	%o4,	0x0709,	%i4
	fmovscc	%xcc,	%f31,	%f12
	bshuffle	%f6,	%f20,	%f8
	tneg	%icc,	0x7
	sdiv	%i0,	0x0D0C,	%o0
	fnot2	%f2,	%f24
	fmovs	%f8,	%f7
	srlx	%i7,	%i3,	%g4
	or	%g5,	0x125F,	%g2
	ldub	[%l7 + 0x76],	%l0
	addccc	%g6,	0x01B3,	%l1
	taddcc	%o2,	0x0331,	%i1
	fbne,a	%fcc1,	loop_2522
	bg,a	loop_2523
	stx	%i5,	[%l7 + 0x78]
	nop
	setx	loop_2524,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2522:
	ldsb	[%l7 + 0x17],	%g7
loop_2523:
	fbe,a	%fcc0,	loop_2525
	sll	%l2,	0x1A,	%o1
loop_2524:
	movleu	%icc,	%o5,	%g1
	movpos	%xcc,	%l3,	%l6
loop_2525:
	nop
	setx	loop_2526,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%l4,	%o3,	%l5
	brgz	%o6,	loop_2527
	fbge,a	%fcc3,	loop_2528
loop_2526:
	fmovscs	%xcc,	%f19,	%f6
	fcmpne32	%f8,	%f22,	%o7
loop_2527:
	edge16	%i6,	%g3,	%o4
loop_2528:
	edge8ln	%i4,	%i2,	%o0
	movgu	%icc,	%i7,	%i3
	fbo,a	%fcc3,	loop_2529
	andn	%g4,	%i0,	%g2
	array16	%g5,	%l0,	%l1
	sub	%g6,	%i1,	%o2
loop_2529:
	fmovrsgz	%i5,	%f2,	%f23
	movrne	%g7,	0x039,	%o1
	movre	%o5,	%l2,	%l3
	tcs	%icc,	0x6
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x56] %asi,	%l6
	movcs	%icc,	%g1,	%o3
	edge8	%l4,	%o6,	%o7
	stx	%l5,	[%l7 + 0x78]
	fmovrde	%i6,	%f4,	%f4
	sdivcc	%o4,	0x098B,	%g3
	subcc	%i2,	0x0F5D,	%i4
	set	0x30, %l1
	stda	%o0,	[%l7 + %l1] 0x2b
	membar	#Sync
	ble	%icc,	loop_2530
	movg	%xcc,	%i7,	%i3
	subcc	%i0,	0x1FC7,	%g2
	nop
	set	0x69, %o2
	ldub	[%l7 + %o2],	%g5
loop_2530:
	tneg	%icc,	0x6
	fbl,a	%fcc2,	loop_2531
	array16	%l0,	%g4,	%g6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
loop_2531:
	array32	%i1,	%i5,	%o2
	orcc	%o1,	0x17B3,	%g7
	mulx	%l2,	%o5,	%l6
	set	0x1E, %l5
	ldsha	[%l7 + %l5] 0x88,	%g1
	fmovrsgez	%o3,	%f17,	%f4
	movge	%icc,	%l3,	%l4
	udiv	%o7,	0x0B16,	%o6
	orncc	%i6,	0x15AF,	%l5
	tn	%xcc,	0x7
	subccc	%o4,	%i2,	%g3
	fmovdl	%xcc,	%f20,	%f21
	bvs	loop_2532
	bl,pt	%xcc,	loop_2533
	xnorcc	%o0,	0x03F7,	%i4
	fsrc1s	%f30,	%f21
loop_2532:
	fbuge	%fcc0,	loop_2534
loop_2533:
	taddcc	%i3,	0x1ED2,	%i0
	array8	%g2,	%i7,	%l0
	movre	%g4,	%g5,	%l1
loop_2534:
	fpack32	%f16,	%f2,	%f0
	faligndata	%f20,	%f20,	%f20
	tsubcc	%i1,	0x07D3,	%g6
	set	0x4C, %i2
	lduwa	[%l7 + %i2] 0x14,	%o2
	movrlz	%i5,	%g7,	%o1
	addccc	%o5,	%l6,	%l2
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x50] %asi,	%o3
	fcmpne16	%f30,	%f12,	%l3
	fmovrde	%g1,	%f24,	%f30
	wr	%g0,	0x04,	%asi
	sta	%f5,	[%l7 + 0x68] %asi
	tgu	%xcc,	0x3
	sdivcc	%l4,	0x0332,	%o6
	fmovsn	%xcc,	%f25,	%f26
	fbul	%fcc1,	loop_2535
	sllx	%o7,	0x10,	%i6
	fmovrdlz	%o4,	%f30,	%f18
	edge32l	%i2,	%l5,	%g3
loop_2535:
	tle	%xcc,	0x0
	orcc	%o0,	%i4,	%i0
	tl	%icc,	0x0
	movneg	%xcc,	%i3,	%g2
	movvs	%xcc,	%i7,	%g4
	movvc	%xcc,	%g5,	%l1
	and	%l0,	%i1,	%o2
	bgu	%xcc,	loop_2536
	fmovs	%f31,	%f21
	st	%f7,	[%l7 + 0x48]
	edge16n	%g6,	%g7,	%o1
loop_2536:
	tvc	%icc,	0x0
	fmovsvc	%icc,	%f23,	%f23
	fpack32	%f10,	%f16,	%f2
	tg	%xcc,	0x2
	fbl,a	%fcc0,	loop_2537
	bshuffle	%f4,	%f16,	%f6
	alignaddr	%i5,	%o5,	%l2
	movrgz	%o3,	0x397,	%l6
loop_2537:
	fxors	%f12,	%f0,	%f9
	edge16	%l3,	%l4,	%g1
	fmovdgu	%icc,	%f1,	%f24
	tcc	%icc,	0x5
	xnor	%o7,	%o6,	%i6
	movrlez	%i2,	%l5,	%g3
	fbo	%fcc3,	loop_2538
	array16	%o4,	%o0,	%i4
	movge	%icc,	%i0,	%g2
	bn,a,pn	%icc,	loop_2539
loop_2538:
	tl	%icc,	0x4
	tcs	%icc,	0x6
	fcmpgt16	%f16,	%f6,	%i7
loop_2539:
	stbar
	fmul8sux16	%f4,	%f16,	%f0
	array8	%i3,	%g4,	%g5
	umulcc	%l1,	%l0,	%i1
	bshuffle	%f24,	%f18,	%f0
	udivx	%g6,	0x0806,	%o2
	sll	%o1,	%i5,	%o5
	fbge,a	%fcc3,	loop_2540
	sub	%l2,	%g7,	%o3
	movpos	%icc,	%l3,	%l4
	fmovdneg	%icc,	%f6,	%f10
loop_2540:
	alignaddr	%g1,	%l6,	%o7
	std	%f30,	[%l7 + 0x78]
	tpos	%xcc,	0x4
	set	0x70, %o3
	stda	%o6,	[%l7 + %o3] 0x10
	fmovdl	%xcc,	%f25,	%f4
	stb	%i6,	[%l7 + 0x75]
	tsubcctv	%i2,	%g3,	%l5
	bgu,pt	%icc,	loop_2541
	fand	%f18,	%f2,	%f16
	srlx	%o0,	%i4,	%i0
	tgu	%icc,	0x2
loop_2541:
	fmovrdgz	%g2,	%f20,	%f2
	fmovsg	%icc,	%f10,	%f26
	brnz	%o4,	loop_2542
	fpsub32s	%f29,	%f9,	%f10
	movrlez	%i3,	%i7,	%g4
	fmovsneg	%xcc,	%f16,	%f9
loop_2542:
	tne	%icc,	0x5
	fmovdg	%icc,	%f14,	%f13
	edge8n	%g5,	%l0,	%l1
	bleu,a	%icc,	loop_2543
	fmuld8sux16	%f9,	%f7,	%f18
	set	0x1D, %o1
	lduba	[%l7 + %o1] 0x19,	%g6
loop_2543:
	sub	%o2,	%i1,	%i5
	te	%icc,	0x3
	fornot2	%f26,	%f26,	%f6
	subcc	%o1,	%l2,	%g7
	movrgez	%o3,	%l3,	%l4
	bneg,a	%xcc,	loop_2544
	move	%xcc,	%g1,	%l6
	fnand	%f28,	%f12,	%f18
	fcmpne16	%f0,	%f6,	%o7
loop_2544:
	fmovspos	%xcc,	%f1,	%f1
	movneg	%xcc,	%o6,	%i6
	tge	%xcc,	0x0
	call	loop_2545
	edge16ln	%i2,	%o5,	%l5
	fmovrdlez	%o0,	%f22,	%f28
	sllx	%g3,	0x12,	%i4
loop_2545:
	nop
	set	0x24, %l4
	ldswa	[%l7 + %l4] 0x18,	%g2
	membar	0x64
	fpack16	%f16,	%f27
	set	0x30, %o6
	swapa	[%l7 + %o6] 0x18,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%xcc,	%f13,	%f4
	fbuge	%fcc0,	loop_2546
	addc	%i3,	%i7,	%g4
	for	%f16,	%f4,	%f6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%l0
loop_2546:
	fbo,a	%fcc0,	loop_2547
	edge16ln	%i0,	%l1,	%o2
	tn	%icc,	0x3
	fabss	%f26,	%f30
loop_2547:
	fmovdpos	%icc,	%f23,	%f11
	edge8l	%g6,	%i5,	%o1
	addc	%i1,	%g7,	%o3
	subc	%l2,	0x0F24,	%l3
	tle	%icc,	0x1
	bg,a	loop_2548
	subccc	%l4,	0x18C9,	%g1
	tcc	%icc,	0x3
	alignaddr	%o7,	%l6,	%o6
loop_2548:
	tn	%xcc,	0x6
	movne	%icc,	%i2,	%i6
	movvs	%xcc,	%o5,	%o0
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x80
	bleu,a,pt	%xcc,	loop_2549
	fpsub32	%f24,	%f2,	%f6
	fbn,a	%fcc0,	loop_2550
	movrne	%g3,	%l5,	%i4
loop_2549:
	fzero	%f10
	fmovdn	%xcc,	%f10,	%f6
loop_2550:
	fmovdpos	%icc,	%f21,	%f22
	sdiv	%g2,	0x1172,	%i3
	fcmple16	%f10,	%f28,	%o4
	fnot2s	%f15,	%f27
	fnegs	%f3,	%f9
	ldx	[%l7 + 0x48],	%g4
	bshuffle	%f8,	%f12,	%f2
	bl,a	%xcc,	loop_2551
	bleu,a,pn	%xcc,	loop_2552
	xnor	%i7,	%l0,	%g5
	edge8ln	%i0,	%o2,	%l1
loop_2551:
	fble	%fcc0,	loop_2553
loop_2552:
	orncc	%i5,	%o1,	%i1
	sdivx	%g6,	0x0357,	%g7
	set	0x77, %i4
	lduba	[%l7 + %i4] 0x0c,	%l2
loop_2553:
	edge32ln	%l3,	%o3,	%g1
	array32	%o7,	%l4,	%o6
	movneg	%icc,	%i2,	%l6
	srl	%i6,	%o5,	%o0
	set	0x50, %g4
	ldda	[%l7 + %g4] 0x2e,	%g2
	edge16	%l5,	%g2,	%i4
	set	0x4A, %o0
	stba	%o4,	[%l7 + %o0] 0x22
	membar	#Sync
	sllx	%g4,	0x1E,	%i3
	sethi	0x10A7,	%i7
	tle	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%g5,	%i0
	tcc	%icc,	0x0
	fbug	%fcc0,	loop_2554
	ta	%xcc,	0x3
	umulcc	%l0,	0x19C2,	%l1
	tvc	%icc,	0x4
loop_2554:
	edge32l	%o2,	%o1,	%i5
	fnot2	%f14,	%f22
	subccc	%g6,	%g7,	%l2
	orcc	%l3,	0x0DE4,	%o3
	and	%g1,	0x0AFA,	%i1
	be	%icc,	loop_2555
	sra	%l4,	0x18,	%o6
	edge8ln	%i2,	%l6,	%o7
	st	%f27,	[%l7 + 0x44]
loop_2555:
	movne	%icc,	%i6,	%o5
	fmovrde	%o0,	%f2,	%f10
	set	0x208, %o7
	ldxa	[%g0 + %o7] 0x52,	%l5
	alignaddrl	%g3,	%i4,	%g2
	movre	%o4,	%i3,	%i7
	fpsub16s	%f13,	%f17,	%f21
	bcc,a,pn	%icc,	loop_2556
	fnands	%f29,	%f23,	%f12
	xnor	%g4,	%i0,	%g5
	sdiv	%l1,	0x00D3,	%o2
loop_2556:
	fmul8ulx16	%f18,	%f22,	%f24
	edge32n	%o1,	%l0,	%g6
	smulcc	%i5,	%g7,	%l3
	edge16	%o3,	%g1,	%i1
	subc	%l4,	0x12A8,	%l2
	sdiv	%o6,	0x1E57,	%l6
	brlz	%i2,	loop_2557
	bvs,a,pn	%icc,	loop_2558
	movvc	%xcc,	%o7,	%i6
	tcs	%icc,	0x5
loop_2557:
	array8	%o0,	%o5,	%l5
loop_2558:
	nop
	setx loop_2559, %l0, %l1
	jmpl %l1, %i4
	movvs	%xcc,	%g3,	%g2
	te	%icc,	0x4
	movrne	%i3,	0x066,	%i7
loop_2559:
	nop
	setx loop_2560, %l0, %l1
	jmpl %l1, %g4
	xorcc	%o4,	%i0,	%g5
	tg	%xcc,	0x7
	sdivx	%l1,	0x0315,	%o1
loop_2560:
	bge,pn	%icc,	loop_2561
	array32	%l0,	%g6,	%i5
	popc	0x0F6F,	%o2
	sir	0x0A9A
loop_2561:
	fandnot1	%f12,	%f22,	%f14
	move	%icc,	%l3,	%o3
	sdiv	%g7,	0x0A07,	%g1
	wr	%g0,	0x2b,	%asi
	stwa	%l4,	[%l7 + 0x68] %asi
	membar	#Sync
	fornot1	%f8,	%f28,	%f30
	be	%icc,	loop_2562
	addccc	%l2,	0x03FF,	%o6
	smulcc	%l6,	%i2,	%o7
	edge8n	%i1,	%o0,	%o5
loop_2562:
	fbe	%fcc3,	loop_2563
	movn	%icc,	%i6,	%i4
	edge8l	%g3,	%l5,	%i3
	fmovrdlz	%i7,	%f4,	%f30
loop_2563:
	fbg	%fcc2,	loop_2564
	tleu	%xcc,	0x2
	fcmpgt32	%f16,	%f14,	%g2
	movrlez	%g4,	%o4,	%i0
loop_2564:
	fcmped	%fcc1,	%f26,	%f20
	tpos	%xcc,	0x5
	bgu	%xcc,	loop_2565
	sir	0x0AC0
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%l1
loop_2565:
	fbne,a	%fcc3,	loop_2566
	nop
	setx	loop_2567,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%g5,	0x187E,	%l0
	movvs	%xcc,	%o1,	%g6
loop_2566:
	sdivx	%i5,	0x1D5E,	%l3
loop_2567:
	ta	%icc,	0x5
	tn	%icc,	0x4
	edge8n	%o2,	%o3,	%g1
	alignaddr	%l4,	%l2,	%o6
	move	%xcc,	%l6,	%i2
	orn	%g7,	0x075B,	%i1
	andcc	%o7,	%o5,	%i6
	sir	0x0AD3
	movcc	%xcc,	%i4,	%o0
	fcmpeq32	%f10,	%f10,	%g3
	addc	%l5,	0x1EB9,	%i7
	brgez,a	%i3,	loop_2568
	tleu	%xcc,	0x2
	sethi	0x0D8C,	%g4
	call	loop_2569
loop_2568:
	orcc	%o4,	%g2,	%i0
	edge32ln	%g5,	%l0,	%o1
	nop
	setx	loop_2570,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2569:
	tg	%icc,	0x1
	fcmpgt16	%f12,	%f26,	%l1
	brlez	%i5,	loop_2571
loop_2570:
	addc	%g6,	0x0C36,	%l3
	edge16l	%o2,	%g1,	%o3
	movle	%icc,	%l4,	%l2
loop_2571:
	movle	%xcc,	%l6,	%o6
	ta	%xcc,	0x7
	fmovscs	%xcc,	%f31,	%f26
	stb	%i2,	[%l7 + 0x4E]
	taddcc	%g7,	0x1FCB,	%o7
	stx	%o5,	[%l7 + 0x40]
	fcmpes	%fcc2,	%f23,	%f20
	fones	%f14
	fbul	%fcc2,	loop_2572
	xnor	%i6,	0x1D1C,	%i1
	add	%o0,	0x0594,	%i4
	fmovspos	%xcc,	%f28,	%f24
loop_2572:
	tsubcc	%l5,	%i7,	%i3
	stb	%g3,	[%l7 + 0x5A]
	fpadd16s	%f21,	%f2,	%f19
	fmovrslez	%o4,	%f5,	%f8
	stbar
	alignaddr	%g4,	%i0,	%g2
	bcc,a,pn	%xcc,	loop_2573
	edge16n	%g5,	%o1,	%l1
	fbug,a	%fcc3,	loop_2574
	tsubcctv	%l0,	0x1AC1,	%i5
loop_2573:
	edge16l	%g6,	%o2,	%g1
	edge16n	%l3,	%l4,	%l2
loop_2574:
	udivcc	%o3,	0x191A,	%o6
	mova	%xcc,	%i2,	%l6
	tg	%icc,	0x2
	fbule	%fcc3,	loop_2575
	bg,a	%icc,	loop_2576
	smul	%g7,	0x0CCC,	%o7
	xorcc	%o5,	%i6,	%i1
loop_2575:
	andn	%o0,	%l5,	%i7
loop_2576:
	subccc	%i4,	%g3,	%o4
	udivcc	%g4,	0x0521,	%i0
	udiv	%i3,	0x1A24,	%g2
	edge8	%o1,	%l1,	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g5,	%g6
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x39] %asi,	%o2
	fbe	%fcc1,	loop_2577
	array8	%i5,	%l3,	%g1
	movrgez	%l2,	%l4,	%o3
	edge32l	%i2,	%l6,	%g7
loop_2577:
	fbge,a	%fcc2,	loop_2578
	edge16	%o6,	%o5,	%i6
	tge	%icc,	0x3
	fbge,a	%fcc1,	loop_2579
loop_2578:
	mova	%icc,	%o7,	%i1
	sth	%o0,	[%l7 + 0x10]
	alignaddrl	%i7,	%i4,	%l5
loop_2579:
	fsrc1s	%f2,	%f18
	smul	%o4,	0x034F,	%g4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x66] %asi,	%i0
	or	%g3,	%g2,	%i3
	movvs	%xcc,	%o1,	%l0
	ld	[%l7 + 0x1C],	%f26
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%g5
	set	0x14, %l6
	lduba	[%l7 + %l6] 0x19,	%l1
	ba,a	%xcc,	loop_2580
	sub	%o2,	%i5,	%g6
	taddcc	%l3,	%l2,	%g1
	fmovs	%f7,	%f7
loop_2580:
	add	%l4,	0x1CBD,	%o3
	udivx	%l6,	0x0F94,	%g7
	taddcc	%o6,	%i2,	%i6
	bvs,a,pn	%icc,	loop_2581
	srax	%o7,	0x1A,	%o5
	sllx	%o0,	0x00,	%i1
	taddcc	%i7,	0x1D62,	%l5
loop_2581:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%i4,	%g4
	movcs	%xcc,	%o4,	%i0
	ta	%icc,	0x4
	sllx	%g2,	%i3,	%o1
	fpadd32s	%f7,	%f14,	%f5
	fnot2s	%f4,	%f30
	subcc	%g3,	%l0,	%l1
	move	%xcc,	%o2,	%g5
	stb	%g6,	[%l7 + 0x69]
	lduw	[%l7 + 0x28],	%i5
	fbe	%fcc2,	loop_2582
	fmovda	%icc,	%f9,	%f17
	orn	%l3,	0x0A88,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2582:
	edge8	%l4,	%o3,	%l2
	ldd	[%l7 + 0x38],	%f30
	tvc	%icc,	0x6
	sdiv	%g7,	0x17FF,	%o6
	subc	%l6,	0x1B5D,	%i6
	tvc	%icc,	0x2
	edge32ln	%i2,	%o7,	%o0
	movgu	%icc,	%i1,	%i7
	sdiv	%l5,	0x004A,	%i4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x1C] %asi,	%o5
	fpadd16	%f8,	%f20,	%f24
	tvc	%xcc,	0x5
	edge8ln	%o4,	%g4,	%g2
	sra	%i3,	0x0C,	%i0
	smul	%o1,	%g3,	%l0
	tl	%xcc,	0x4
	fmovdpos	%icc,	%f6,	%f12
	edge32n	%l1,	%g5,	%g6
	orcc	%i5,	0x1CAB,	%o2
	ta	%xcc,	0x7
	tge	%icc,	0x3
	andn	%g1,	%l4,	%o3
	bcs,pt	%xcc,	loop_2583
	sll	%l3,	%g7,	%l2
	alignaddr	%o6,	%l6,	%i6
	fmovdvs	%xcc,	%f29,	%f16
loop_2583:
	membar	0x3C
	set	0x7C, %i6
	ldsha	[%l7 + %i6] 0x19,	%i2
	ble	%xcc,	loop_2584
	fones	%f18
	set	0x48, %o4
	stwa	%o7,	[%l7 + %o4] 0x11
loop_2584:
	movvc	%icc,	%o0,	%i7
	tneg	%icc,	0x2
	addccc	%i1,	%l5,	%o5
	fandnot1s	%f27,	%f15,	%f15
	addcc	%i4,	0x0E18,	%o4
	bl,pn	%icc,	loop_2585
	ta	%xcc,	0x1
	tl	%xcc,	0x1
	movvc	%icc,	%g2,	%g4
loop_2585:
	edge16n	%i0,	%i3,	%o1
	mulx	%l0,	%l1,	%g3
	movn	%xcc,	%g6,	%g5
	movg	%xcc,	%o2,	%g1
	fmovscs	%xcc,	%f21,	%f20
	stb	%l4,	[%l7 + 0x3C]
	stw	%i5,	[%l7 + 0x18]
	addc	%o3,	0x1F8C,	%l3
	bl,pn	%icc,	loop_2586
	sdivcc	%l2,	0x1C40,	%g7
	ldd	[%l7 + 0x68],	%o6
	fcmple32	%f8,	%f22,	%i6
loop_2586:
	fcmpgt32	%f20,	%f0,	%i2
	andn	%o7,	0x1CEC,	%o0
	orncc	%i7,	%l6,	%l5
	movleu	%icc,	%i1,	%i4
	brnz	%o5,	loop_2587
	taddcctv	%g2,	0x0D2E,	%o4
	tsubcctv	%i0,	%i3,	%g4
	addcc	%l0,	0x0FB8,	%l1
loop_2587:
	nop
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x70] %asi,	%g2
	movleu	%icc,	%g6,	%g5
	set	0x20, %l3
	ldxa	[%l7 + %l3] 0x89,	%o2
	xorcc	%o1,	0x09CB,	%l4
	andncc	%g1,	%i5,	%o3
	tg	%xcc,	0x7
	movvs	%xcc,	%l3,	%g7
	umul	%o6,	%l2,	%i2
	tvc	%xcc,	0x6
	fbo	%fcc1,	loop_2588
	addc	%i6,	%o7,	%o0
	andn	%l6,	%i7,	%i1
	set	0x3a8, %l2
	nop 	! 	stxa	%l5,	[%g0 + %l2] 0x40 ripped by fixASI40.pl
loop_2588:
	fones	%f30
	edge8	%i4,	%o5,	%g2
	fmovsl	%icc,	%f24,	%f12
	bn,a,pt	%xcc,	loop_2589
	be	%icc,	loop_2590
	stbar
	ble,a	loop_2591
loop_2589:
	edge32	%o4,	%i0,	%i3
loop_2590:
	fors	%f20,	%f15,	%f9
	wr	%g0,	0x27,	%asi
	stha	%g4,	[%l7 + 0x44] %asi
	membar	#Sync
loop_2591:
	edge32l	%l0,	%g3,	%l1
	array32	%g5,	%g6,	%o2
	bn,a,pt	%xcc,	loop_2592
	ldsb	[%l7 + 0x4C],	%o1
	sdivcc	%g1,	0x1D43,	%i5
	mulx	%l4,	0x0EF4,	%o3
loop_2592:
	fnors	%f4,	%f1,	%f12
	fmuld8sux16	%f16,	%f21,	%f30
	popc	%l3,	%o6
	mulscc	%g7,	%i2,	%i6
	prefetch	[%l7 + 0x10],	 0x1
	move	%icc,	%o7,	%o0
	ble	%icc,	loop_2593
	fbu	%fcc2,	loop_2594
	edge16l	%l6,	%i7,	%i1
	orcc	%l5,	%l2,	%o5
loop_2593:
	brlz	%i4,	loop_2595
loop_2594:
	fxnor	%f10,	%f28,	%f14
	or	%g2,	0x07F6,	%i0
	fblg,a	%fcc1,	loop_2596
loop_2595:
	udivcc	%i3,	0x0E12,	%o4
	fpsub32	%f26,	%f8,	%f22
	ta	%xcc,	0x5
loop_2596:
	udiv	%g4,	0x0AD0,	%l0
	edge32ln	%l1,	%g3,	%g5
	fnegd	%f2,	%f10
	fmovsle	%xcc,	%f21,	%f2
	addccc	%o2,	%g6,	%o1
	call	loop_2597
	fabsd	%f12,	%f6
	st	%f31,	[%l7 + 0x14]
	orcc	%g1,	%l4,	%i5
loop_2597:
	move	%xcc,	%l3,	%o6
	ldstub	[%l7 + 0x0A],	%o3
	edge32	%g7,	%i2,	%o7
	addccc	%o0,	0x15DB,	%l6
	fmul8x16	%f1,	%f26,	%f26
	addcc	%i6,	0x1044,	%i1
	tcc	%icc,	0x7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x42] %asi,	%i7
	brgz,a	%l5,	loop_2598
	fmul8ulx16	%f10,	%f30,	%f4
	srlx	%o5,	0x16,	%l2
	edge8n	%g2,	%i0,	%i4
loop_2598:
	fbo	%fcc2,	loop_2599
	fba	%fcc0,	loop_2600
	fandnot1	%f4,	%f22,	%f26
	fcmple32	%f14,	%f14,	%o4
loop_2599:
	tcs	%icc,	0x0
loop_2600:
	xor	%i3,	0x03AC,	%l0
	movrlez	%l1,	0x191,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g3,	%o2,	%g6
	bvs,a	loop_2601
	tsubcctv	%o1,	0x085B,	%g5
	fba,a	%fcc0,	loop_2602
	edge16n	%l4,	%i5,	%g1
loop_2601:
	fnegs	%f4,	%f4
	andn	%l3,	0x1B7C,	%o3
loop_2602:
	ldsh	[%l7 + 0x1E],	%g7
	fsrc2	%f8,	%f2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x38] %asi,	%o6
	popc	%o7,	%o0
	umul	%l6,	0x13C9,	%i6
	fnor	%f30,	%f10,	%f4
	ldd	[%l7 + 0x50],	%i2
	movrlz	%i7,	0x118,	%l5
	set	0x7C, %l0
	swapa	[%l7 + %l0] 0x80,	%o5
	brlez	%i1,	loop_2603
	fmul8ulx16	%f22,	%f12,	%f24
	taddcctv	%g2,	%i0,	%l2
	te	%xcc,	0x1
loop_2603:
	orn	%i4,	0x0B8D,	%o4
	fmovsa	%icc,	%f14,	%f8
	udivcc	%i3,	0x1A01,	%l1
	tge	%icc,	0x4
	movn	%icc,	%l0,	%g4
	and	%g3,	0x1994,	%g6
	ldsh	[%l7 + 0x3A],	%o1
	ldsw	[%l7 + 0x64],	%g5
	movg	%icc,	%l4,	%i5
	set	0x14, %g3
	lduha	[%l7 + %g3] 0x81,	%g1
	membar	0x57
	movneg	%icc,	%l3,	%o3
	sra	%g7,	%o2,	%o6
	orncc	%o7,	%o0,	%l6
	tpos	%icc,	0x2
	tle	%icc,	0x0
	fcmpd	%fcc2,	%f6,	%f8
	fabss	%f30,	%f4
	bg,pt	%xcc,	loop_2604
	array8	%i2,	%i6,	%l5
	fmovdgu	%xcc,	%f1,	%f28
	bpos,a	loop_2605
loop_2604:
	movcc	%xcc,	%o5,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f12,	%f28
loop_2605:
	edge32l	%g2,	%i1,	%i0
	umul	%l2,	%o4,	%i3
	smulcc	%i4,	%l0,	%l1
	fnors	%f18,	%f20,	%f12
	array8	%g3,	%g4,	%g6
	edge8	%g5,	%l4,	%i5
	bne	loop_2606
	edge8ln	%o1,	%l3,	%o3
	stw	%g7,	[%l7 + 0x34]
	tcc	%icc,	0x6
loop_2606:
	stb	%g1,	[%l7 + 0x61]
	udivx	%o2,	0x1766,	%o6
	move	%icc,	%o0,	%l6
	fornot1	%f26,	%f2,	%f24
	orn	%o7,	%i6,	%l5
	te	%xcc,	0x1
	lduh	[%l7 + 0x64],	%i2
	sll	%o5,	%i7,	%i1
	tleu	%xcc,	0x6
	fbge	%fcc1,	loop_2607
	movrgz	%g2,	%i0,	%l2
	umul	%o4,	%i3,	%i4
	srl	%l1,	%l0,	%g3
loop_2607:
	fmovs	%f7,	%f2
	nop
	setx loop_2608, %l0, %l1
	jmpl %l1, %g4
	umul	%g6,	%l4,	%i5
	tcs	%xcc,	0x3
	fpmerge	%f30,	%f1,	%f14
loop_2608:
	subc	%o1,	0x0A64,	%g5
	tvc	%xcc,	0x6
	andn	%l3,	0x172D,	%g7
	tvc	%xcc,	0x7
	set	0x0C, %g1
	stwa	%o3,	[%l7 + %g1] 0x14
	fbg,a	%fcc2,	loop_2609
	fxor	%f8,	%f8,	%f14
	bge,a,pt	%icc,	loop_2610
	xnorcc	%g1,	%o2,	%o6
loop_2609:
	srl	%o0,	0x0D,	%l6
	addccc	%i6,	%o7,	%i2
loop_2610:
	addcc	%o5,	%l5,	%i1
	stx	%i7,	[%l7 + 0x28]
	movrlez	%g2,	0x36E,	%l2
	udivcc	%i0,	0x1FEA,	%o4
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x14] %asi,	%i3
	fbule	%fcc1,	loop_2611
	fmovsg	%xcc,	%f18,	%f0
	popc	%i4,	%l1
	movvs	%icc,	%g3,	%g4
loop_2611:
	tleu	%xcc,	0x5
	popc	%l0,	%g6
	andncc	%i5,	%l4,	%o1
	ld	[%l7 + 0x20],	%f10
	fcmpgt16	%f16,	%f4,	%g5
	pdist	%f8,	%f0,	%f26
	smulcc	%l3,	%g7,	%g1
	faligndata	%f0,	%f18,	%f0
	array16	%o3,	%o2,	%o0
	movrgz	%o6,	0x117,	%i6
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l6
	set	0x18, %g6
	stxa	%i2,	[%l7 + %g6] 0x0c
	fmul8ulx16	%f30,	%f26,	%f24
	membar	0x40
	bleu,pn	%icc,	loop_2612
	edge16l	%o7,	%o5,	%l5
	flush	%l7 + 0x50
	mova	%xcc,	%i1,	%i7
loop_2612:
	nop
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l2
	sra	%g2,	0x18,	%i0
	fmovsn	%icc,	%f16,	%f14
	movcs	%xcc,	%i3,	%o4
	ld	[%l7 + 0x50],	%f2
	mova	%icc,	%l1,	%g3
	sdivcc	%g4,	0x11C3,	%l0
	umul	%g6,	0x1BE9,	%i4
	brgz	%i5,	loop_2613
	tne	%xcc,	0x0
	umulcc	%l4,	0x1E5A,	%g5
	fcmpne32	%f16,	%f24,	%l3
loop_2613:
	move	%xcc,	%g7,	%o1
	edge8	%g1,	%o2,	%o0
	sdiv	%o3,	0x1235,	%o6
	movre	%i6,	0x2A9,	%i2
	movle	%icc,	%o7,	%l6
	ta	%icc,	0x0
	fmovsg	%xcc,	%f24,	%f3
	edge32	%o5,	%l5,	%i7
	movn	%icc,	%l2,	%g2
	fbn	%fcc2,	loop_2614
	srax	%i0,	0x18,	%i1
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x11,	 0x2
loop_2614:
	xnor	%o4,	0x012B,	%g3
	nop
	set	0x38, %g5
	std	%l0,	[%l7 + %g5]
	edge8ln	%l0,	%g6,	%i4
	orncc	%i5,	0x0E9F,	%g4
	fbne	%fcc1,	loop_2615
	tgu	%icc,	0x6
	fbul,a	%fcc1,	loop_2616
	move	%icc,	%g5,	%l3
loop_2615:
	edge8n	%g7,	%l4,	%o1
	fpmerge	%f0,	%f12,	%f6
loop_2616:
	fnands	%f11,	%f1,	%f10
	fmovdleu	%icc,	%f5,	%f4
	tne	%icc,	0x4
	bgu	%icc,	loop_2617
	fbul,a	%fcc3,	loop_2618
	fbne	%fcc3,	loop_2619
	or	%g1,	%o2,	%o0
loop_2617:
	nop
	set	0x3C, %i0
	ldsw	[%l7 + %i0],	%o6
loop_2618:
	fcmpne16	%f18,	%f12,	%i6
loop_2619:
	xor	%o3,	%i2,	%o7
	fbne	%fcc3,	loop_2620
	fands	%f29,	%f2,	%f27
	fnors	%f20,	%f6,	%f12
	edge16n	%o5,	%l6,	%l5
loop_2620:
	fxnors	%f22,	%f14,	%f2
	bg	loop_2621
	udiv	%l2,	0x1104,	%g2
	fmovdvc	%xcc,	%f12,	%f6
	taddcc	%i0,	%i1,	%i3
loop_2621:
	fbu,a	%fcc0,	loop_2622
	tvs	%xcc,	0x5
	movpos	%xcc,	%o4,	%g3
	wr	%g0,	0x2a,	%asi
	stba	%l1,	[%l7 + 0x6E] %asi
	membar	#Sync
loop_2622:
	nop
	set	0x38, %i3
	std	%f22,	[%l7 + %i3]
	fnor	%f4,	%f16,	%f0
	umul	%i7,	0x048F,	%l0
	fexpand	%f0,	%f24
	fmovscs	%icc,	%f27,	%f11
	fabsd	%f6,	%f2
	prefetch	[%l7 + 0x78],	 0x3
	tl	%icc,	0x3
	alignaddr	%i4,	%g6,	%i5
	xnor	%g4,	%l3,	%g5
	ldsh	[%l7 + 0x60],	%l4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x66] %asi,	%g7
	tg	%xcc,	0x4
	siam	0x3
	fmovsl	%icc,	%f18,	%f0
	edge16n	%g1,	%o2,	%o1
	flush	%l7 + 0x14
	fmuld8ulx16	%f13,	%f10,	%f4
	swap	[%l7 + 0x2C],	%o0
	tl	%icc,	0x6
	movrgez	%o6,	0x14F,	%o3
	lduh	[%l7 + 0x6A],	%i6
	fnors	%f24,	%f9,	%f29
	fcmpes	%fcc0,	%f8,	%f6
	fbug,a	%fcc2,	loop_2623
	edge32	%o7,	%o5,	%l6
	edge8	%l5,	%i2,	%l2
	st	%f0,	[%l7 + 0x60]
loop_2623:
	lduh	[%l7 + 0x1A],	%g2
	tvc	%icc,	0x3
	movrgz	%i1,	0x3E8,	%i0
	movre	%o4,	0x02B,	%g3
	addcc	%l1,	%i3,	%l0
	edge16l	%i4,	%g6,	%i7
	stw	%g4,	[%l7 + 0x5C]
	movpos	%icc,	%i5,	%g5
	fmovs	%f21,	%f25
	edge32n	%l3,	%g7,	%g1
	mova	%icc,	%o2,	%l4
	wr	%g0,	0x80,	%asi
	stda	%o0,	[%l7 + 0x38] %asi
	nop
	setx loop_2624, %l0, %l1
	jmpl %l1, %o6
	sir	0x0D4C
	tvs	%icc,	0x7
	swap	[%l7 + 0x24],	%o3
loop_2624:
	mulscc	%i6,	%o1,	%o7
	nop
	setx loop_2625, %l0, %l1
	jmpl %l1, %l6
	nop
	setx	loop_2626,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%icc,	0x1
	fbul,a	%fcc0,	loop_2627
loop_2625:
	movrne	%l5,	0x350,	%o5
loop_2626:
	nop
	setx	loop_2628,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movg	%icc,	%i2,	%g2
loop_2627:
	fba,a	%fcc3,	loop_2629
	tg	%xcc,	0x7
loop_2628:
	addc	%i1,	%i0,	%l2
	edge16ln	%o4,	%l1,	%i3
loop_2629:
	be,a	%icc,	loop_2630
	movrne	%g3,	0x1FA,	%l0
	lduh	[%l7 + 0x6A],	%i4
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i7
loop_2630:
	taddcctv	%g6,	%i5,	%g4
	tpos	%icc,	0x3
	edge8	%g5,	%l3,	%g7
	andn	%g1,	%l4,	%o2
	ta	%icc,	0x5
	fcmps	%fcc2,	%f31,	%f10
	fbuge	%fcc0,	loop_2631
	edge32ln	%o6,	%o0,	%i6
	andn	%o1,	0x01DB,	%o7
	bshuffle	%f10,	%f24,	%f6
loop_2631:
	smulcc	%o3,	0x1B27,	%l6
	fpadd32	%f6,	%f0,	%f14
	brlez,a	%o5,	loop_2632
	subc	%l5,	%g2,	%i2
	alignaddr	%i0,	%l2,	%i1
	fmovrslz	%l1,	%f25,	%f27
loop_2632:
	orn	%o4,	0x0395,	%i3
	andncc	%l0,	%g3,	%i4
	fmovdn	%icc,	%f25,	%f4
	tl	%xcc,	0x1
	move	%icc,	%i7,	%i5
	sdiv	%g6,	0x0A1F,	%g5
	movg	%xcc,	%l3,	%g7
	tneg	%icc,	0x6
	movvs	%icc,	%g1,	%l4
	fmovdg	%xcc,	%f6,	%f12
	siam	0x1
	fsrc2	%f6,	%f20
	brgez	%g4,	loop_2633
	ldstub	[%l7 + 0x7A],	%o6
	edge32n	%o0,	%o2,	%o1
	for	%f16,	%f18,	%f28
loop_2633:
	fmovrdne	%i6,	%f26,	%f6
	stw	%o3,	[%l7 + 0x64]
	fmovdleu	%xcc,	%f13,	%f15
	movne	%xcc,	%l6,	%o7
	nop
	setx loop_2634, %l0, %l1
	jmpl %l1, %o5
	fand	%f6,	%f6,	%f18
	fbue,a	%fcc2,	loop_2635
	fone	%f6
loop_2634:
	addccc	%l5,	0x0BF6,	%i2
	fbo	%fcc2,	loop_2636
loop_2635:
	movrgz	%g2,	0x023,	%i0
	fbul,a	%fcc1,	loop_2637
	fmovdge	%icc,	%f25,	%f0
loop_2636:
	edge8ln	%i1,	%l2,	%o4
	edge32ln	%l1,	%l0,	%g3
loop_2637:
	andn	%i4,	%i7,	%i3
	wr	%g0,	0x22,	%asi
	stwa	%i5,	[%l7 + 0x68] %asi
	membar	#Sync
	flush	%l7 + 0x48
	fnegs	%f6,	%f26
	tneg	%xcc,	0x0
	bshuffle	%f10,	%f28,	%f30
	udivcc	%g5,	0x0E79,	%l3
	xnor	%g7,	0x073A,	%g6
	pdist	%f6,	%f12,	%f10
	tcs	%xcc,	0x5
	fpsub32s	%f27,	%f27,	%f26
	te	%xcc,	0x6
	tg	%icc,	0x2
	mulx	%l4,	%g4,	%o6
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x50] %asi,	%o0
	fcmple32	%f26,	%f0,	%o2
	srax	%o1,	%g1,	%i6
	tn	%xcc,	0x3
	edge32ln	%l6,	%o3,	%o7
	movgu	%xcc,	%o5,	%l5
	prefetch	[%l7 + 0x7C],	 0x3
	bge,a,pn	%xcc,	loop_2638
	xnorcc	%i2,	0x1C47,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%xcc,	%f16,	%f25
loop_2638:
	movrgez	%i1,	%g2,	%o4
	taddcctv	%l1,	%l0,	%g3
	sra	%i4,	0x1C,	%l2
	movg	%xcc,	%i3,	%i5
	fcmpeq16	%f22,	%f14,	%g5
	movn	%xcc,	%i7,	%g7
	addc	%l3,	0x1EFD,	%l4
	fmovsge	%xcc,	%f30,	%f4
	smul	%g6,	0x09C9,	%o6
	movrlz	%o0,	0x24C,	%o2
	fandnot1s	%f19,	%f11,	%f25
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x71] %asi,	%g4
	movre	%g1,	0x268,	%o1
	bcs,a	%icc,	loop_2639
	sub	%i6,	%o3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o7,	0x1C79,	%l5
loop_2639:
	fbne	%fcc1,	loop_2640
	mova	%xcc,	%i2,	%o5
	bleu,a	%icc,	loop_2641
	addcc	%i1,	0x100F,	%g2
loop_2640:
	subccc	%o4,	0x1FA9,	%l1
	fba,a	%fcc0,	loop_2642
loop_2641:
	xnor	%i0,	%l0,	%i4
	sll	%g3,	%i3,	%l2
	smulcc	%g5,	0x0618,	%i7
loop_2642:
	array16	%g7,	%i5,	%l3
	stx	%g6,	[%l7 + 0x18]
	fmovsa	%xcc,	%f11,	%f13
	udivcc	%l4,	0x1139,	%o6
	movpos	%xcc,	%o2,	%o0
	alignaddrl	%g4,	%g1,	%i6
	sdivcc	%o1,	0x1772,	%l6
	subcc	%o7,	0x10E1,	%o3
	movrgz	%l5,	%o5,	%i2
	movrne	%i1,	0x30A,	%g2
	bne,a	loop_2643
	addc	%o4,	0x1E57,	%i0
	subccc	%l0,	0x0B6C,	%l1
	umulcc	%i4,	0x197C,	%g3
loop_2643:
	or	%l2,	%g5,	%i3
	sll	%g7,	%i7,	%i5
	subccc	%l3,	%l4,	%g6
	fmovrslez	%o6,	%f28,	%f31
	fbo	%fcc1,	loop_2644
	tsubcctv	%o2,	0x1A12,	%g4
	edge8ln	%o0,	%g1,	%o1
	tsubcc	%l6,	0x16E0,	%o7
loop_2644:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x7C] %asi,	%o3
	movpos	%xcc,	%l5,	%o5
	nop
	setx	loop_2645,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%i2,	%i6,	%i1
	orncc	%g2,	%o4,	%i0
	subc	%l1,	%l0,	%i4
loop_2645:
	fba	%fcc2,	loop_2646
	edge32	%g3,	%l2,	%i3
	andncc	%g5,	%g7,	%i7
	fmovrdlz	%i5,	%f18,	%f28
loop_2646:
	edge32l	%l3,	%g6,	%l4
	fmovsl	%xcc,	%f23,	%f29
	fmovdleu	%xcc,	%f9,	%f3
	array16	%o6,	%g4,	%o2
	fpadd16	%f6,	%f4,	%f10
	edge16n	%g1,	%o0,	%o1
	fpackfix	%f0,	%f16
	fbo,a	%fcc0,	loop_2647
	fsrc2s	%f15,	%f22
	movrlz	%l6,	%o3,	%o7
	fmovsne	%xcc,	%f30,	%f15
loop_2647:
	fmovdvc	%xcc,	%f3,	%f12
	orn	%o5,	0x0C52,	%l5
	fmovsa	%xcc,	%f0,	%f19
	add	%i6,	%i2,	%g2
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x04
	subcc	%o4,	0x0969,	%i0
	srax	%l1,	0x0B,	%i1
	fnegd	%f14,	%f6
	fnand	%f18,	%f6,	%f4
	tcc	%icc,	0x3
	fnot1	%f8,	%f0
	bneg,pn	%icc,	loop_2648
	fmovdgu	%icc,	%f4,	%f13
	fmovd	%f4,	%f4
	fmul8x16al	%f14,	%f15,	%f8
loop_2648:
	fbu	%fcc2,	loop_2649
	fbne	%fcc2,	loop_2650
	edge16n	%l0,	%g3,	%l2
	swap	[%l7 + 0x08],	%i4
loop_2649:
	fnot1s	%f15,	%f26
loop_2650:
	nop
	set	0x30, %g2
	ldxa	[%g0 + %g2] 0x50,	%g5
	membar	0x1F
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%xcc,	%f10,	%f1
	ldub	[%l7 + 0x39],	%i3
	edge16	%g7,	%i5,	%i7
	bg	loop_2651
	tcc	%icc,	0x2
	ldsh	[%l7 + 0x42],	%l3
	stbar
loop_2651:
	add	%l4,	%o6,	%g4
	fbo,a	%fcc2,	loop_2652
	fpack32	%f20,	%f0,	%f6
	st	%f10,	[%l7 + 0x40]
	edge32ln	%g6,	%o2,	%g1
loop_2652:
	subc	%o0,	0x19FB,	%o1
	fones	%f17
	subc	%o3,	0x0904,	%l6
	fzeros	%f11
	fnot1	%f16,	%f0
	tgu	%xcc,	0x3
	tg	%xcc,	0x0
	sdiv	%o5,	0x1E55,	%o7
	faligndata	%f18,	%f6,	%f14
	movcs	%icc,	%i6,	%i2
	brgez,a	%l5,	loop_2653
	tl	%icc,	0x7
	movre	%g2,	%i0,	%l1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%o4
loop_2653:
	array8	%g3,	%l2,	%i4
	set	0x38, %i1
	stda	%g4,	[%l7 + %i1] 0x14
	fnot2	%f6,	%f18
	sdivcc	%l0,	0x0398,	%i3
	fbule	%fcc1,	loop_2654
	fnands	%f18,	%f17,	%f16
	bg,a,pn	%icc,	loop_2655
	edge8ln	%g7,	%i5,	%l3
loop_2654:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i7
loop_2655:
	array8	%l4,	%o6,	%g4
	set	0x08, %i7
	stxa	%o2,	[%l7 + %i7] 0x89
	sra	%g1,	0x17,	%g6
	fandnot2s	%f8,	%f29,	%f27
	udivx	%o0,	0x1576,	%o1
	ble,a	%icc,	loop_2656
	fmovrslez	%l6,	%f0,	%f15
	umul	%o5,	0x0407,	%o7
	movgu	%icc,	%i6,	%i2
loop_2656:
	movvs	%icc,	%o3,	%l5
	udiv	%g2,	0x05F2,	%i0
	movneg	%icc,	%i1,	%l1
	movne	%xcc,	%g3,	%l2
	fpack16	%f14,	%f7
	edge8ln	%i4,	%g5,	%l0
	sdivx	%i3,	0x00FA,	%o4
	fnot1s	%f11,	%f22
	fmovrslez	%g7,	%f6,	%f1
	fnot1	%f22,	%f2
	brgz	%i5,	loop_2657
	brnz,a	%i7,	loop_2658
	fxors	%f16,	%f7,	%f17
	stbar
loop_2657:
	orn	%l4,	%l3,	%g4
loop_2658:
	ble,pt	%icc,	loop_2659
	movrgz	%o2,	0x26B,	%g1
	edge32n	%o6,	%o0,	%g6
	movn	%icc,	%l6,	%o5
loop_2659:
	fmovsne	%icc,	%f29,	%f17
	tvc	%icc,	0x1
	srl	%o1,	0x15,	%i6
	xorcc	%i2,	0x0CBC,	%o3
	be,pn	%icc,	loop_2660
	sdivx	%o7,	0x186A,	%l5
	wr	%g0,	0xeb,	%asi
	stba	%g2,	[%l7 + 0x51] %asi
	membar	#Sync
loop_2660:
	sth	%i0,	[%l7 + 0x36]
	xnor	%l1,	0x1E23,	%i1
	ldd	[%l7 + 0x40],	%l2
	te	%icc,	0x4
	andncc	%i4,	%g3,	%l0
	fcmple32	%f16,	%f12,	%g5
	mulscc	%o4,	0x0219,	%g7
	movcs	%xcc,	%i5,	%i3
	xor	%i7,	0x180B,	%l3
	mova	%icc,	%g4,	%l4
	sdivx	%g1,	0x1178,	%o2
	fpadd16	%f28,	%f8,	%f12
	movvc	%xcc,	%o6,	%g6
	fxnors	%f29,	%f10,	%f8
	for	%f18,	%f30,	%f6
	andcc	%o0,	%l6,	%o5
	tne	%xcc,	0x3
	tvc	%icc,	0x6
	subc	%i6,	%o1,	%i2
	movrne	%o3,	%l5,	%g2
	edge16n	%o7,	%i0,	%l1
	sethi	0x1341,	%l2
	fpadd16s	%f23,	%f1,	%f24
	sdivcc	%i4,	0x1AD4,	%i1
	mova	%icc,	%l0,	%g5
	tl	%icc,	0x6
	bleu,pt	%xcc,	loop_2661
	add	%g3,	0x0A43,	%g7
	fornot1	%f26,	%f6,	%f16
	srax	%o4,	0x05,	%i3
loop_2661:
	fabsd	%f28,	%f24
	prefetch	[%l7 + 0x24],	 0x0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%i5
	bshuffle	%f0,	%f18,	%f30
	fbule,a	%fcc1,	loop_2662
	sdivcc	%l3,	0x16F9,	%i7
	alignaddr	%g4,	%l4,	%g1
	tcc	%icc,	0x2
loop_2662:
	xor	%o6,	0x1D1A,	%g6
	tvc	%xcc,	0x5
	orncc	%o0,	%o2,	%l6
	movrlez	%o5,	%i6,	%i2
	orcc	%o3,	0x19CE,	%l5
	fbe,a	%fcc2,	loop_2663
	fbu,a	%fcc2,	loop_2664
	movrlez	%o1,	%g2,	%o7
	flush	%l7 + 0x2C
loop_2663:
	tsubcctv	%l1,	0x124D,	%i0
loop_2664:
	st	%f2,	[%l7 + 0x18]
	sll	%i4,	0x19,	%i1
	ldx	[%l7 + 0x30],	%l0
	bne,pt	%icc,	loop_2665
	fmovdpos	%xcc,	%f13,	%f22
	orcc	%l2,	%g3,	%g7
	movrgz	%g5,	%i3,	%i5
loop_2665:
	fmovse	%icc,	%f4,	%f27
	sth	%l3,	[%l7 + 0x60]
	bcs	%icc,	loop_2666
	fbge,a	%fcc2,	loop_2667
	movrne	%o4,	%i7,	%g4
	fmovdvs	%icc,	%f10,	%f20
loop_2666:
	movg	%icc,	%g1,	%o6
loop_2667:
	mova	%icc,	%l4,	%g6
	std	%o2,	[%l7 + 0x48]
	ld	[%l7 + 0x34],	%f19
	fmovscs	%icc,	%f1,	%f26
	fsrc1	%f14,	%f8
	brz	%l6,	loop_2668
	brlez	%o5,	loop_2669
	alignaddrl	%i6,	%o0,	%o3
	andn	%i2,	0x1CC0,	%l5
loop_2668:
	orn	%g2,	%o1,	%o7
loop_2669:
	nop
	wr	%g0,	0x89,	%asi
	stba	%i0,	[%l7 + 0x0D] %asi
	andn	%i4,	0x160D,	%i1
	sll	%l1,	0x1A,	%l2
	tcs	%xcc,	0x0
	movrgz	%l0,	0x310,	%g3
	st	%f3,	[%l7 + 0x50]
	fornot1s	%f28,	%f17,	%f4
	faligndata	%f4,	%f16,	%f24
	tn	%xcc,	0x5
	tneg	%icc,	0x6
	fmul8x16au	%f7,	%f6,	%f28
	edge32	%g7,	%i3,	%i5
	fandnot2	%f0,	%f28,	%f26
	fmul8x16au	%f10,	%f3,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l3,	%o4,	%i7
	ldsh	[%l7 + 0x1C],	%g4
	bge,a,pt	%icc,	loop_2670
	sdiv	%g1,	0x1647,	%o6
	fmul8sux16	%f26,	%f16,	%f6
	ldstub	[%l7 + 0x75],	%l4
loop_2670:
	fmovdcs	%xcc,	%f24,	%f21
	fmovsvc	%icc,	%f4,	%f6
	udivx	%g5,	0x0995,	%o2
	xorcc	%l6,	0x1F94,	%g6
	ldx	[%l7 + 0x48],	%i6
	stbar
	and	%o0,	0x1DC0,	%o3
	sethi	0x0583,	%i2
	fmuld8ulx16	%f28,	%f11,	%f4
	fornot2	%f20,	%f6,	%f12
	tvs	%icc,	0x4
	srax	%o5,	%l5,	%g2
	movcc	%xcc,	%o7,	%i0
	andn	%i4,	%i1,	%o1
	movn	%xcc,	%l2,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l1,	%g3
	fbule	%fcc0,	loop_2671
	sub	%i3,	%g7,	%i5
	alignaddr	%l3,	%o4,	%g4
	fsrc2s	%f17,	%f6
loop_2671:
	movg	%xcc,	%g1,	%i7
	addcc	%l4,	%o6,	%o2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x14] %asi,	%f1
	edge16n	%l6,	%g6,	%i6
	smul	%g5,	0x0418,	%o3
	sdivcc	%o0,	0x009B,	%i2
	fmovsl	%xcc,	%f5,	%f27
	mulscc	%l5,	%o5,	%g2
	ldsb	[%l7 + 0x41],	%o7
	sir	0x133E
	sdiv	%i4,	0x0AC8,	%i1
	movrgez	%o1,	%i0,	%l0
	fmovrsgez	%l1,	%f16,	%f24
	call	loop_2672
	nop
	setx loop_2673, %l0, %l1
	jmpl %l1, %g3
	orncc	%i3,	%l2,	%i5
	brlez	%g7,	loop_2674
loop_2672:
	array8	%o4,	%g4,	%g1
loop_2673:
	sub	%i7,	0x0BF1,	%l4
	fabss	%f27,	%f31
loop_2674:
	sllx	%l3,	0x06,	%o2
	mulx	%o6,	0x005B,	%l6
	set	0x3C, %o2
	stwa	%i6,	[%l7 + %o2] 0x18
	subc	%g6,	0x1A02,	%g5
	fcmpne32	%f30,	%f18,	%o3
	mova	%icc,	%o0,	%l5
	edge8l	%o5,	%g2,	%o7
	srl	%i4,	%i2,	%i1
	fmovrslz	%o1,	%f5,	%f8
	movn	%icc,	%i0,	%l0
	smulcc	%g3,	0x089D,	%i3
	nop
	setx loop_2675, %l0, %l1
	jmpl %l1, %l2
	brgz,a	%l1,	loop_2676
	movle	%xcc,	%i5,	%o4
	udiv	%g7,	0x0969,	%g4
loop_2675:
	fabss	%f19,	%f20
loop_2676:
	ldsb	[%l7 + 0x7E],	%i7
	fmovsneg	%icc,	%f22,	%f20
	fmovspos	%xcc,	%f11,	%f18
	fandnot1	%f10,	%f8,	%f16
	fmovrdgz	%g1,	%f28,	%f26
	movrlz	%l3,	0x019,	%l4
	fmovrdgez	%o6,	%f12,	%f6
	brlz,a	%o2,	loop_2677
	xnorcc	%l6,	%i6,	%g5
	ldsh	[%l7 + 0x4A],	%g6
	subccc	%o3,	0x1DB2,	%o0
loop_2677:
	fmovrde	%l5,	%f20,	%f20
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	fandnot2	%f26,	%f18,	%f4
	sir	0x0FF2
	ldsw	[%l7 + 0x14],	%o7
	fmovsleu	%xcc,	%f3,	%f14
	fandnot1	%f12,	%f18,	%f6
	tneg	%xcc,	0x2
	bleu	loop_2678
	movpos	%icc,	%g2,	%i4
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2678:
	fnot2	%f28,	%f2
	movne	%xcc,	%i1,	%i2
	udiv	%i0,	0x1FA1,	%o1
	sll	%g3,	%l0,	%i3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l1,	%l2
	alignaddr	%i5,	%g7,	%g4
	tleu	%xcc,	0x4
	andcc	%i7,	%o4,	%l3
	set	0x17, %l1
	lduba	[%l7 + %l1] 0x89,	%l4
	fmovda	%icc,	%f27,	%f15
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g1
	flush	%l7 + 0x2C
	move	%xcc,	%o2,	%l6
	tneg	%xcc,	0x5
	movleu	%xcc,	%i6,	%o6
	xnor	%g6,	%g5,	%o3
	xnorcc	%l5,	0x1300,	%o5
	addccc	%o7,	%o0,	%g2
	fpsub16	%f18,	%f30,	%f24
	bvc	loop_2679
	fcmpne32	%f6,	%f30,	%i4
	tsubcc	%i2,	%i0,	%i1
	sdiv	%o1,	0x0880,	%g3
loop_2679:
	edge16ln	%i3,	%l1,	%l2
	array8	%i5,	%l0,	%g4
	mova	%icc,	%i7,	%g7
	set	0x7A, %l5
	ldsha	[%l7 + %l5] 0x89,	%o4
	brlez,a	%l3,	loop_2680
	fblg,a	%fcc2,	loop_2681
	bne	loop_2682
	array32	%g1,	%o2,	%l6
loop_2680:
	ld	[%l7 + 0x64],	%f19
loop_2681:
	tge	%xcc,	0x3
loop_2682:
	xnorcc	%i6,	0x0767,	%o6
	ldub	[%l7 + 0x5A],	%l4
	umulcc	%g5,	0x0C05,	%o3
	addcc	%g6,	%o5,	%l5
	smul	%o0,	%o7,	%g2
	taddcctv	%i2,	0x1CF2,	%i0
	addc	%i1,	0x04E8,	%i4
	andcc	%o1,	0x00BA,	%i3
	brnz,a	%g3,	loop_2683
	fmovsvc	%xcc,	%f20,	%f29
	smul	%l2,	0x0C34,	%l1
	be	loop_2684
loop_2683:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug	%fcc3,	loop_2685
	movrne	%l0,	0x174,	%g4
loop_2684:
	flush	%l7 + 0x30
	fmovdcc	%xcc,	%f23,	%f5
loop_2685:
	fmovde	%xcc,	%f7,	%f22
	ta	%icc,	0x0
	bge,pt	%icc,	loop_2686
	edge16	%i7,	%g7,	%o4
	fnegd	%f22,	%f16
	fba	%fcc3,	loop_2687
loop_2686:
	brlz,a	%l3,	loop_2688
	udiv	%g1,	0x06F1,	%o2
	udivcc	%i5,	0x0B75,	%l6
loop_2687:
	movn	%xcc,	%o6,	%l4
loop_2688:
	for	%f4,	%f24,	%f20
	fmovdn	%xcc,	%f25,	%f9
	movrgz	%g5,	0x1D5,	%i6
	fbn	%fcc3,	loop_2689
	fbug	%fcc2,	loop_2690
	fpack32	%f22,	%f24,	%f22
	fbge,a	%fcc1,	loop_2691
loop_2689:
	fpsub16s	%f2,	%f30,	%f30
loop_2690:
	movneg	%xcc,	%o3,	%o5
	faligndata	%f2,	%f24,	%f14
loop_2691:
	sdivcc	%g6,	0x0CF0,	%l5
	bpos,a	%icc,	loop_2692
	movl	%xcc,	%o7,	%g2
	movpos	%icc,	%o0,	%i0
	srl	%i1,	0x01,	%i4
loop_2692:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o1
	tge	%xcc,	0x2
	movcs	%xcc,	%i2,	%g3
	edge16n	%i3,	%l1,	%l2
	fbn,a	%fcc1,	loop_2693
	nop
	setx loop_2694, %l0, %l1
	jmpl %l1, %l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g4,	0x17F9,	%g7
loop_2693:
	fmovrslz	%o4,	%f22,	%f25
loop_2694:
	array8	%l3,	%i7,	%g1
	sllx	%o2,	%l6,	%i5
	nop
	setx	loop_2695,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnors	%f9,	%f27,	%f25
	fpadd16s	%f0,	%f23,	%f26
	brlz,a	%o6,	loop_2696
loop_2695:
	edge16	%l4,	%i6,	%o3
	fbg	%fcc0,	loop_2697
	edge8l	%g5,	%g6,	%l5
loop_2696:
	and	%o7,	%g2,	%o5
	fmovdle	%xcc,	%f28,	%f12
loop_2697:
	bvs,a,pn	%icc,	loop_2698
	fbue	%fcc2,	loop_2699
	fmovdpos	%icc,	%f23,	%f7
	mulscc	%o0,	%i1,	%i0
loop_2698:
	tle	%xcc,	0x7
loop_2699:
	edge8	%i4,	%o1,	%i2
	tcs	%icc,	0x2
	fornot1s	%f22,	%f18,	%f19
	nop
	set	0x20, %o3
	stw	%g3,	[%l7 + %o3]
	tge	%xcc,	0x6
	edge8n	%i3,	%l2,	%l1
	fnegd	%f6,	%f2
	fmovrdgz	%g4,	%f20,	%f28
	edge8n	%g7,	%o4,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l3,	0x2AE,	%g1
	brgez,a	%o2,	loop_2700
	edge16l	%i7,	%i5,	%l6
	movleu	%icc,	%l4,	%o6
	smulcc	%i6,	%o3,	%g6
loop_2700:
	fble,a	%fcc0,	loop_2701
	sllx	%g5,	%o7,	%g2
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%l5
loop_2701:
	sdivcc	%o5,	0x1B93,	%i1
	fmovdcc	%xcc,	%f14,	%f10
	tle	%xcc,	0x0
	subccc	%i0,	0x08A0,	%o0
	tneg	%xcc,	0x4
	fmovsl	%xcc,	%f27,	%f23
	sethi	0x1FB1,	%o1
	array16	%i2,	%i4,	%g3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%l2
	edge16ln	%i3,	%l1,	%g7
	fxors	%f31,	%f3,	%f23
	movl	%xcc,	%o4,	%l0
	call	loop_2702
	brgez	%g4,	loop_2703
	addccc	%g1,	0x0034,	%l3
	umulcc	%i7,	%o2,	%l6
loop_2702:
	ba	loop_2704
loop_2703:
	call	loop_2705
	brlez,a	%l4,	loop_2706
	stbar
loop_2704:
	fbn,a	%fcc1,	loop_2707
loop_2705:
	fmovrdne	%o6,	%f22,	%f28
loop_2706:
	nop
	set	0x3C, %i2
	lda	[%l7 + %i2] 0x0c,	%f18
loop_2707:
	bneg,pn	%xcc,	loop_2708
	ta	%icc,	0x6
	bn,pt	%xcc,	loop_2709
	stx	%i6,	[%l7 + 0x20]
loop_2708:
	fmovd	%f30,	%f16
	sll	%i5,	0x0C,	%o3
loop_2709:
	srax	%g5,	%o7,	%g2
	fexpand	%f23,	%f22
	brnz	%g6,	loop_2710
	movrgez	%l5,	0x126,	%i1
	addccc	%o5,	%i0,	%o0
	bcs,a,pt	%xcc,	loop_2711
loop_2710:
	edge16n	%i2,	%o1,	%i4
	edge8	%g3,	%i3,	%l1
	tvc	%icc,	0x2
loop_2711:
	fbul	%fcc1,	loop_2712
	nop
	set	0x78, %l4
	ldx	[%l7 + %l4],	%g7
	fcmpgt16	%f30,	%f30,	%o4
	fbug	%fcc0,	loop_2713
loop_2712:
	fbu	%fcc1,	loop_2714
	array16	%l2,	%g4,	%g1
	sdivx	%l3,	0x0476,	%i7
loop_2713:
	udivcc	%o2,	0x1D07,	%l0
loop_2714:
	brgz,a	%l6,	loop_2715
	xnorcc	%l4,	%o6,	%i5
	fblg	%fcc1,	loop_2716
	addccc	%o3,	%i6,	%g5
loop_2715:
	ldub	[%l7 + 0x1F],	%o7
	fbul,a	%fcc3,	loop_2717
loop_2716:
	fpadd32s	%f26,	%f24,	%f25
	fbule	%fcc2,	loop_2718
	sdivx	%g2,	0x1251,	%l5
loop_2717:
	sir	0x0A4C
	sir	0x108A
loop_2718:
	fandnot2s	%f23,	%f25,	%f26
	fbue,a	%fcc0,	loop_2719
	sdivcc	%i1,	0x0FB0,	%g6
	smul	%o5,	%o0,	%i0
	ldsb	[%l7 + 0x15],	%i2
loop_2719:
	taddcc	%o1,	%i4,	%g3
	st	%f19,	[%l7 + 0x64]
	tneg	%icc,	0x7
	call	loop_2720
	xnor	%i3,	%g7,	%o4
	movn	%xcc,	%l1,	%l2
	tg	%xcc,	0x4
loop_2720:
	nop
	set	0x4E, %o6
	lduha	[%l7 + %o6] 0x81,	%g1
	xnor	%g4,	%l3,	%i7
	xnorcc	%l0,	%o2,	%l6
	sllx	%l4,	%i5,	%o3
	fsrc2	%f14,	%f0
	set	0x8, %g7
	ldxa	[%g0 + %g7] 0x21,	%o6
	movg	%xcc,	%g5,	%o7
	movvc	%xcc,	%i6,	%g2
	or	%l5,	0x1852,	%i1
	set	0x36, %o1
	lduba	[%l7 + %o1] 0x14,	%g6
	orcc	%o5,	%i0,	%i2
	alignaddr	%o1,	%o0,	%g3
	edge8	%i4,	%i3,	%g7
	tcs	%icc,	0x3
	fbul,a	%fcc1,	loop_2721
	movcs	%xcc,	%o4,	%l2
	edge16l	%g1,	%g4,	%l3
	fmovrse	%i7,	%f28,	%f18
loop_2721:
	nop
	wr	%g0,	0x04,	%asi
	stxa	%l0,	[%l7 + 0x10] %asi
	tsubcc	%l1,	%o2,	%l4
	array32	%l6,	%o3,	%i5
	mova	%xcc,	%g5,	%o7
	flush	%l7 + 0x54
	xnorcc	%o6,	0x1757,	%i6
	fbl	%fcc3,	loop_2722
	fmuld8sux16	%f18,	%f4,	%f10
	movpos	%xcc,	%g2,	%l5
	movrne	%i1,	%o5,	%g6
loop_2722:
	taddcctv	%i2,	%o1,	%o0
	movne	%icc,	%g3,	%i4
	bneg	loop_2723
	fmovdneg	%icc,	%f13,	%f0
	bne,a	loop_2724
	sdiv	%i3,	0x04BE,	%g7
loop_2723:
	fmovsge	%icc,	%f7,	%f21
	nop
	set	0x34, %i4
	lduw	[%l7 + %i4],	%i0
loop_2724:
	ba,a,pt	%xcc,	loop_2725
	movg	%icc,	%l2,	%g1
	tvc	%icc,	0x6
	array8	%o4,	%l3,	%i7
loop_2725:
	alignaddr	%l0,	%g4,	%l1
	fmovsleu	%xcc,	%f27,	%f20
	edge8	%o2,	%l6,	%l4
	popc	%o3,	%g5
	fornot1s	%f3,	%f16,	%f3
	tle	%xcc,	0x6
	fbe	%fcc3,	loop_2726
	movleu	%icc,	%i5,	%o7
	edge8ln	%i6,	%o6,	%l5
	sdivx	%i1,	0x14CD,	%g2
loop_2726:
	tcc	%xcc,	0x2
	sdiv	%o5,	0x1BA9,	%i2
	tle	%icc,	0x2
	set	0x58, %g4
	stxa	%o1,	[%l7 + %g4] 0x88
	bge,a	loop_2727
	tneg	%xcc,	0x2
	movvs	%xcc,	%o0,	%g6
	movne	%xcc,	%i4,	%i3
loop_2727:
	tne	%icc,	0x0
	movle	%xcc,	%g3,	%i0
	movrlz	%g7,	0x05E,	%g1
	fble	%fcc1,	loop_2728
	fmovrsgz	%l2,	%f6,	%f17
	fnot1	%f8,	%f18
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x74] %asi,	%o4
loop_2728:
	andcc	%i7,	0x1008,	%l3
	fba,a	%fcc2,	loop_2729
	fmovdcc	%icc,	%f17,	%f30
	movgu	%xcc,	%l0,	%g4
	movn	%icc,	%o2,	%l1
loop_2729:
	fbe,a	%fcc2,	loop_2730
	andncc	%l4,	%l6,	%o3
	movle	%xcc,	%g5,	%i5
	sllx	%o7,	%i6,	%o6
loop_2730:
	prefetch	[%l7 + 0x6C],	 0x1
	fmovsgu	%xcc,	%f30,	%f6
	fble	%fcc2,	loop_2731
	fnot2	%f18,	%f28
	tvc	%icc,	0x3
	fxnor	%f0,	%f14,	%f14
loop_2731:
	and	%l5,	0x196D,	%i1
	ldsb	[%l7 + 0x71],	%g2
	ldstub	[%l7 + 0x7A],	%i2
	sdiv	%o5,	0x04FB,	%o1
	tvc	%icc,	0x2
	fabsd	%f8,	%f2
	nop
	set	0x08, %o7
	std	%o0,	[%l7 + %o7]
	sll	%g6,	%i3,	%g3
	movl	%xcc,	%i0,	%i4
	fmovsl	%icc,	%f5,	%f10
	tvc	%xcc,	0x6
	edge16ln	%g7,	%g1,	%o4
	edge16n	%i7,	%l2,	%l0
	alignaddrl	%l3,	%o2,	%g4
	be,pt	%icc,	loop_2732
	movn	%xcc,	%l4,	%l1
	set	0x56, %l6
	stha	%o3,	[%l7 + %l6] 0x22
	membar	#Sync
loop_2732:
	nop
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movg	%icc,	%l6,	%g5
	fands	%f4,	%f8,	%f8
	movrgz	%o7,	0x14F,	%i5
	srl	%i6,	0x0D,	%l5
	tn	%xcc,	0x1
	fbule,a	%fcc3,	loop_2733
	fcmple32	%f16,	%f24,	%i1
	and	%o6,	0x145D,	%g2
	taddcc	%i2,	0x14F8,	%o5
loop_2733:
	nop
	set	0x68, %i6
	stda	%o0,	[%l7 + %i6] 0x14
	sll	%g6,	%i3,	%g3
	fbe,a	%fcc3,	loop_2734
	fpadd16	%f8,	%f20,	%f18
	movge	%icc,	%i0,	%i4
	tleu	%xcc,	0x6
loop_2734:
	fbl	%fcc1,	loop_2735
	movcs	%icc,	%o0,	%g1
	srl	%o4,	%g7,	%i7
	membar	0x16
loop_2735:
	tsubcctv	%l2,	%l0,	%l3
	fands	%f19,	%f24,	%f16
	call	loop_2736
	call	loop_2737
	subcc	%o2,	%g4,	%l4
	bvc,a	%icc,	loop_2738
loop_2736:
	brlez,a	%o3,	loop_2739
loop_2737:
	addccc	%l6,	%l1,	%o7
	movcs	%xcc,	%g5,	%i6
loop_2738:
	fones	%f6
loop_2739:
	sra	%l5,	0x0A,	%i1
	movrlez	%i5,	0x393,	%o6
	fmovscc	%icc,	%f6,	%f11
	bvs	loop_2740
	fnot2	%f10,	%f6
	sllx	%i2,	%g2,	%o1
	fandnot1s	%f6,	%f25,	%f26
loop_2740:
	array16	%g6,	%o5,	%g3
	ta	%xcc,	0x0
	edge32	%i0,	%i3,	%o0
	nop
	set	0x60, %o4
	std	%g0,	[%l7 + %o4]
	sth	%i4,	[%l7 + 0x2A]
	edge32n	%g7,	%o4,	%l2
	fmuld8sux16	%f5,	%f11,	%f16
	array8	%l0,	%i7,	%o2
	bl,pt	%icc,	loop_2741
	fmovrdne	%l3,	%f26,	%f8
	fmovda	%xcc,	%f0,	%f3
	ldd	[%l7 + 0x10],	%f4
loop_2741:
	array8	%g4,	%o3,	%l4
	orn	%l6,	0x1C14,	%l1
	subcc	%o7,	%i6,	%l5
	fmovscc	%xcc,	%f2,	%f20
	subcc	%g5,	0x0134,	%i1
	prefetch	[%l7 + 0x78],	 0x2
	fmuld8sux16	%f10,	%f9,	%f6
	fmovrsgez	%i5,	%f5,	%f18
	edge32	%o6,	%i2,	%o1
	fnor	%f10,	%f14,	%f12
	edge8n	%g2,	%g6,	%o5
	xorcc	%i0,	%g3,	%o0
	orn	%i3,	%i4,	%g7
	andcc	%o4,	%l2,	%l0
	movrlez	%g1,	%i7,	%l3
	nop
	set	0x5C, %o0
	lduw	[%l7 + %o0],	%g4
	tle	%icc,	0x5
	set	0x77, %l3
	lduba	[%l7 + %l3] 0x10,	%o3
	mulx	%o2,	%l6,	%l4
	movleu	%xcc,	%o7,	%i6
	fblg	%fcc0,	loop_2742
	movvs	%xcc,	%l1,	%g5
	tl	%icc,	0x4
	udiv	%l5,	0x0071,	%i5
loop_2742:
	bneg,pt	%xcc,	loop_2743
	ldstub	[%l7 + 0x08],	%o6
	fsrc2s	%f19,	%f24
	fba,a	%fcc3,	loop_2744
loop_2743:
	tl	%xcc,	0x1
	edge16	%i2,	%i1,	%o1
	srax	%g6,	0x1D,	%o5
loop_2744:
	fcmpes	%fcc1,	%f15,	%f4
	fmovdleu	%icc,	%f16,	%f2
	or	%i0,	%g3,	%g2
	fnands	%f6,	%f11,	%f18
	fmovrdlez	%o0,	%f22,	%f10
	movne	%icc,	%i3,	%i4
	movvc	%xcc,	%g7,	%l2
	orcc	%o4,	0x0AA6,	%l0
	te	%xcc,	0x0
	movrne	%g1,	%i7,	%l3
	st	%f14,	[%l7 + 0x68]
	fmuld8ulx16	%f27,	%f16,	%f6
	bleu,pt	%xcc,	loop_2745
	fcmpeq16	%f2,	%f24,	%g4
	orcc	%o3,	0x1359,	%o2
	sll	%l4,	%o7,	%l6
loop_2745:
	fxor	%f12,	%f22,	%f30
	bneg,a,pn	%icc,	loop_2746
	nop
	set	0x28, %l0
	ldd	[%l7 + %l0],	%f18
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%i6
	movleu	%xcc,	%l1,	%l5
loop_2746:
	fcmpeq16	%f26,	%f20,	%g5
	fmovde	%icc,	%f27,	%f31
	movneg	%xcc,	%i5,	%o6
	fpsub16s	%f4,	%f2,	%f26
	fornot1	%f16,	%f2,	%f26
	movl	%icc,	%i2,	%o1
	movvs	%xcc,	%i1,	%g6
	sdivcc	%i0,	0x0B8D,	%o5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%g3
	fcmpne16	%f14,	%f8,	%o0
	fmovrde	%i3,	%f26,	%f10
	udivx	%i4,	0x048D,	%g7
	tvs	%xcc,	0x2
	alignaddrl	%l2,	%g2,	%l0
	tneg	%icc,	0x0
	sll	%o4,	0x03,	%g1
	movn	%icc,	%i7,	%l3
	xnorcc	%o3,	%g4,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a	%icc,	loop_2747
	swap	[%l7 + 0x6C],	%l4
	sdivcc	%o7,	0x1148,	%i6
	fmovsvs	%icc,	%f14,	%f22
loop_2747:
	fornot2s	%f1,	%f8,	%f7
	fmul8ulx16	%f4,	%f30,	%f8
	nop
	setx loop_2748, %l0, %l1
	jmpl %l1, %l1
	tcc	%xcc,	0x2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%l5
loop_2748:
	fnot1s	%f23,	%f16
	movre	%g5,	%o6,	%i2
	fmovda	%xcc,	%f9,	%f17
	sra	%o1,	%i1,	%g6
	fcmpd	%fcc3,	%f30,	%f20
	fpack32	%f6,	%f16,	%f2
	membar	0x53
	movl	%icc,	%i0,	%i5
	sub	%o5,	%g3,	%i3
	udivcc	%i4,	0x1D7F,	%o0
	fpackfix	%f26,	%f1
	andcc	%l2,	0x042B,	%g7
	fnands	%f16,	%f12,	%f26
	fmovrsne	%g2,	%f6,	%f1
	fmovrdgz	%l0,	%f12,	%f24
	fmovscs	%icc,	%f1,	%f24
	xor	%o4,	0x02C9,	%i7
	fbue	%fcc0,	loop_2749
	sdivcc	%l3,	0x14B1,	%g1
	ta	%xcc,	0x5
	movrlz	%o3,	%o2,	%l4
loop_2749:
	fpsub32s	%f25,	%f5,	%f5
	fmovsge	%icc,	%f13,	%f21
	srax	%g4,	%i6,	%o7
	ba,a,pn	%xcc,	loop_2750
	call	loop_2751
	fpack16	%f22,	%f9
	bvs,a,pn	%icc,	loop_2752
loop_2750:
	tsubcc	%l6,	%l5,	%g5
loop_2751:
	sra	%l1,	0x0E,	%i2
	sth	%o1,	[%l7 + 0x72]
loop_2752:
	edge16n	%o6,	%g6,	%i0
	set	0x3C, %g1
	lda	[%l7 + %g1] 0x14,	%f28
	subc	%i1,	%i5,	%o5
	movrlez	%g3,	%i4,	%o0
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%i3
	array32	%g7,	%g2,	%l2
	or	%o4,	0x175A,	%l0
	fbule	%fcc1,	loop_2753
	fcmpeq16	%f12,	%f14,	%i7
	bn,pn	%icc,	loop_2754
	alignaddr	%g1,	%l3,	%o2
loop_2753:
	brlez,a	%l4,	loop_2755
	and	%o3,	0x0BE7,	%i6
loop_2754:
	udivcc	%o7,	0x1467,	%l6
	fmovd	%f2,	%f18
loop_2755:
	sdivx	%g4,	0x1EE1,	%l5
	andcc	%g5,	0x16FA,	%l1
	tcc	%icc,	0x6
	sdiv	%i2,	0x15D4,	%o6
	mova	%xcc,	%o1,	%g6
	nop
	setx	loop_2756,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq32	%f6,	%f16,	%i1
	fornot1s	%f10,	%f28,	%f21
	tcc	%icc,	0x5
loop_2756:
	fnands	%f28,	%f24,	%f16
	prefetch	[%l7 + 0x1C],	 0x2
	set	0x44, %l2
	ldswa	[%l7 + %l2] 0x89,	%i0
	movg	%icc,	%o5,	%i5
	fbug,a	%fcc1,	loop_2757
	smulcc	%i4,	%o0,	%i3
	bg	loop_2758
	movn	%xcc,	%g7,	%g2
loop_2757:
	fcmpeq32	%f0,	%f4,	%g3
	fnot2s	%f25,	%f5
loop_2758:
	fbul,a	%fcc0,	loop_2759
	mulx	%l2,	0x0439,	%o4
	popc	%l0,	%g1
	fbn	%fcc2,	loop_2760
loop_2759:
	sdivcc	%i7,	0x10F0,	%l3
	sdiv	%o2,	0x0C3D,	%l4
	sir	0x0E21
loop_2760:
	fmovdneg	%xcc,	%f20,	%f0
	fblg	%fcc2,	loop_2761
	edge32ln	%o3,	%o7,	%l6
	mulscc	%g4,	0x1B11,	%l5
	popc	0x0EA2,	%i6
loop_2761:
	ldstub	[%l7 + 0x69],	%g5
	fpsub32s	%f1,	%f24,	%f11
	udivcc	%l1,	0x183B,	%o6
	srax	%i2,	%g6,	%o1
	umul	%i1,	%o5,	%i0
	fcmpgt16	%f20,	%f22,	%i4
	fcmpgt16	%f2,	%f20,	%o0
	array8	%i5,	%i3,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc1,	loop_2762
	fmovsvs	%icc,	%f11,	%f7
	membar	0x5B
	movrlz	%g3,	%g7,	%l2
loop_2762:
	ldd	[%l7 + 0x50],	%o4
	tcs	%icc,	0x2
	brnz,a	%l0,	loop_2763
	swap	[%l7 + 0x74],	%i7
	bne,a,pn	%icc,	loop_2764
	tcs	%xcc,	0x2
loop_2763:
	fmovsge	%xcc,	%f1,	%f10
	edge16l	%l3,	%g1,	%o2
loop_2764:
	fbe,a	%fcc0,	loop_2765
	fnegd	%f4,	%f2
	nop
	setx	loop_2766,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%l4,	0x114D,	%o7
loop_2765:
	fbue,a	%fcc2,	loop_2767
	fmovrdlz	%o3,	%f18,	%f0
loop_2766:
	fandnot2	%f4,	%f2,	%f18
	bvc,a	loop_2768
loop_2767:
	subc	%g4,	%l6,	%l5
	tne	%xcc,	0x5
	orn	%g5,	%l1,	%o6
loop_2768:
	for	%f24,	%f22,	%f16
	fornot1	%f24,	%f28,	%f12
	tne	%icc,	0x5
	fnot1	%f20,	%f18
	srax	%i6,	0x10,	%i2
	fbe	%fcc0,	loop_2769
	be,pt	%icc,	loop_2770
	fmovsn	%icc,	%f2,	%f5
	alignaddrl	%o1,	%g6,	%o5
loop_2769:
	tl	%xcc,	0x3
loop_2770:
	tpos	%icc,	0x7
	ble,a,pn	%icc,	loop_2771
	movgu	%xcc,	%i1,	%i4
	movcc	%icc,	%o0,	%i0
	srl	%i3,	0x12,	%g2
loop_2771:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a,pt	%icc,	loop_2772
	bgu,a,pt	%xcc,	loop_2773
	movl	%xcc,	%i5,	%g3
	bvc,pt	%xcc,	loop_2774
loop_2772:
	xorcc	%l2,	0x039A,	%o4
loop_2773:
	fcmpgt32	%f6,	%f8,	%g7
	bcc,a,pt	%xcc,	loop_2775
loop_2774:
	tsubcctv	%i7,	0x1C55,	%l0
	smul	%g1,	0x0414,	%l3
	ldsh	[%l7 + 0x2A],	%o2
loop_2775:
	fbug	%fcc0,	loop_2776
	fpack16	%f4,	%f8
	fmovda	%xcc,	%f29,	%f21
	subcc	%l4,	0x1099,	%o7
loop_2776:
	fpackfix	%f4,	%f6
	edge16ln	%o3,	%g4,	%l6
	umulcc	%l5,	%l1,	%g5
	popc	0x1D2A,	%o6
	set	0x58, %g6
	sta	%f1,	[%l7 + %g6] 0x10
	fmovdvc	%icc,	%f21,	%f1
	array16	%i2,	%o1,	%g6
	smulcc	%o5,	0x0F3D,	%i6
	stw	%i1,	[%l7 + 0x48]
	sllx	%o0,	%i4,	%i3
	addc	%i0,	%g2,	%i5
	bgu	%xcc,	loop_2777
	addccc	%l2,	%g3,	%o4
	fmovsge	%xcc,	%f12,	%f31
	edge8l	%i7,	%l0,	%g7
loop_2777:
	fbu,a	%fcc2,	loop_2778
	srl	%l3,	0x10,	%o2
	fmuld8sux16	%f19,	%f1,	%f6
	edge32	%l4,	%o7,	%o3
loop_2778:
	movvc	%xcc,	%g1,	%l6
	fmovsg	%icc,	%f23,	%f5
	tn	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f1,	%f2,	%f20
	movgu	%icc,	%l5,	%l1
	tsubcc	%g5,	0x18A0,	%o6
	xnorcc	%i2,	%g4,	%g6
	fmuld8ulx16	%f27,	%f0,	%f4
	sdivx	%o1,	0x0C45,	%o5
	set	0x14, %i5
	lduwa	[%l7 + %i5] 0x88,	%i1
	movn	%xcc,	%o0,	%i4
	fmovrde	%i3,	%f12,	%f0
	bgu,a,pn	%icc,	loop_2779
	movcc	%icc,	%i0,	%g2
	fmovrdlez	%i5,	%f12,	%f30
	movcc	%icc,	%l2,	%i6
loop_2779:
	tle	%xcc,	0x1
	srlx	%o4,	%i7,	%g3
	fsrc1s	%f1,	%f14
	move	%xcc,	%g7,	%l0
	fxnor	%f28,	%f26,	%f18
	sdivx	%o2,	0x13E6,	%l4
	fmovdne	%xcc,	%f20,	%f1
	move	%xcc,	%o7,	%l3
	xnorcc	%o3,	%l6,	%g1
	array16	%l5,	%g5,	%o6
	movge	%xcc,	%i2,	%g4
	edge32	%g6,	%l1,	%o5
	sdivcc	%i1,	0x03F0,	%o1
	fbe,a	%fcc2,	loop_2780
	edge8	%i4,	%i3,	%o0
	fandnot1	%f28,	%f18,	%f16
	xor	%g2,	0x0AD1,	%i5
loop_2780:
	fmovrslez	%l2,	%f0,	%f17
	edge16l	%i6,	%i0,	%i7
	flush	%l7 + 0x54
	movgu	%xcc,	%o4,	%g7
	brz,a	%l0,	loop_2781
	movne	%icc,	%o2,	%l4
	sdivx	%o7,	0x1289,	%l3
	xnorcc	%o3,	%g3,	%l6
loop_2781:
	movrgez	%l5,	0x01E,	%g1
	fble	%fcc3,	loop_2782
	edge16ln	%o6,	%i2,	%g4
	bleu,a,pn	%xcc,	loop_2783
	sir	0x09B7
loop_2782:
	tn	%xcc,	0x7
	srax	%g5,	%g6,	%o5
loop_2783:
	xorcc	%i1,	%l1,	%o1
	tpos	%icc,	0x0
	fcmple16	%f4,	%f16,	%i4
	flush	%l7 + 0x28
	sll	%o0,	%g2,	%i5
	tsubcctv	%l2,	%i3,	%i6
	sdivcc	%i7,	0x0F22,	%i0
	bgu,a	loop_2784
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%o4,	%l0
	sdiv	%g7,	0x0205,	%l4
loop_2784:
	fmovrsgz	%o7,	%f18,	%f19
	subcc	%l3,	0x1BB8,	%o3
	std	%f24,	[%l7 + 0x18]
	fmovdl	%xcc,	%f3,	%f12
	mova	%xcc,	%g3,	%l6
	movleu	%icc,	%o2,	%g1
	lduh	[%l7 + 0x74],	%o6
	fmovd	%f18,	%f22
	andcc	%i2,	0x045E,	%l5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g5,	%g6
	xorcc	%o5,	0x113E,	%i1
	bne,a,pt	%xcc,	loop_2785
	mova	%icc,	%l1,	%g4
	movcs	%icc,	%o1,	%i4
	fornot2	%f12,	%f14,	%f14
loop_2785:
	fmovda	%xcc,	%f20,	%f28
	fpadd16s	%f24,	%f11,	%f8
	srax	%g2,	%o0,	%l2
	ld	[%l7 + 0x30],	%f30
	stbar
	mulx	%i3,	0x009A,	%i5
	orncc	%i6,	0x14A9,	%i0
	fmuld8ulx16	%f9,	%f11,	%f14
	fmovsn	%icc,	%f16,	%f3
	movgu	%xcc,	%i7,	%o4
	wr	%g0,	0x18,	%asi
	stba	%l0,	[%l7 + 0x6D] %asi
	fbo,a	%fcc3,	loop_2786
	tvc	%xcc,	0x3
	xnor	%g7,	0x178F,	%l4
	fone	%f24
loop_2786:
	movrgez	%o7,	0x112,	%o3
	edge32ln	%g3,	%l6,	%o2
	sra	%l3,	0x05,	%o6
	edge32	%g1,	%i2,	%g5
	siam	0x4
	udiv	%l5,	0x0892,	%o5
	set	0x28, %i0
	swapa	[%l7 + %i0] 0x81,	%g6
	fcmpeq32	%f30,	%f10,	%i1
	movcc	%icc,	%g4,	%o1
	fmuld8ulx16	%f1,	%f7,	%f16
	fmovrsgez	%i4,	%f16,	%f17
	xnorcc	%l1,	%g2,	%l2
	fors	%f12,	%f29,	%f14
	fcmple16	%f2,	%f14,	%i3
	te	%icc,	0x3
	mulscc	%o0,	0x01FB,	%i5
	subc	%i0,	0x1530,	%i6
	movvc	%icc,	%i7,	%o4
	fbule	%fcc2,	loop_2787
	movl	%icc,	%l0,	%g7
	fbg,a	%fcc3,	loop_2788
	bne	loop_2789
loop_2787:
	fmovrdlz	%o7,	%f12,	%f8
	fmovdcc	%xcc,	%f24,	%f18
loop_2788:
	movvs	%xcc,	%l4,	%o3
loop_2789:
	edge16ln	%g3,	%l6,	%o2
	fabsd	%f10,	%f26
	ldsh	[%l7 + 0x52],	%l3
	fpsub32	%f28,	%f16,	%f20
	fmul8x16	%f25,	%f8,	%f8
	sdivcc	%g1,	0x06B4,	%i2
	tsubcc	%g5,	%o6,	%l5
	fcmpes	%fcc0,	%f31,	%f0
	movgu	%icc,	%g6,	%o5
	brlz	%i1,	loop_2790
	srlx	%o1,	%i4,	%g4
	sdivcc	%g2,	0x161E,	%l2
	fmovrsgz	%i3,	%f6,	%f8
loop_2790:
	bcs,pt	%icc,	loop_2791
	fmovdpos	%xcc,	%f25,	%f14
	bneg,a,pn	%icc,	loop_2792
	srlx	%l1,	0x08,	%o0
loop_2791:
	or	%i5,	0x0A8A,	%i0
	movrgez	%i6,	%o4,	%i7
loop_2792:
	sth	%l0,	[%l7 + 0x4A]
	fexpand	%f15,	%f8
	fpack16	%f8,	%f22
	sdivcc	%o7,	0x0CDD,	%l4
	array8	%o3,	%g7,	%g3
	brlez,a	%o2,	loop_2793
	fmovsvs	%icc,	%f8,	%f22
	set	0x38, %g5
	stwa	%l6,	[%l7 + %g5] 0xe3
	membar	#Sync
loop_2793:
	mulx	%l3,	0x145E,	%i2
	add	%g5,	0x0C17,	%o6
	addccc	%g1,	%g6,	%l5
	movle	%icc,	%i1,	%o1
	bn,pn	%icc,	loop_2794
	movgu	%icc,	%o5,	%i4
	array16	%g2,	%g4,	%l2
	edge8n	%i3,	%o0,	%l1
loop_2794:
	sdivx	%i0,	0x03AE,	%i6
	mulscc	%i5,	0x0EFC,	%i7
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovda	%xcc,	%f12,	%f29
	nop
	set	0x08, %o5
	stx	%l0,	[%l7 + %o5]
	te	%icc,	0x4
	wr	%g0,	0x27,	%asi
	stxa	%o4,	[%l7 + 0x48] %asi
	membar	#Sync
	membar	0x1B
	sllx	%l4,	0x0A,	%o3
	fmovrdne	%g7,	%f22,	%f26
	fmovd	%f4,	%f30
	taddcc	%o7,	0x1803,	%g3
	orncc	%o2,	%l3,	%i2
	bpos,pt	%xcc,	loop_2795
	stb	%l6,	[%l7 + 0x4C]
	movgu	%xcc,	%g5,	%g1
	mulx	%o6,	0x0F59,	%l5
loop_2795:
	ta	%icc,	0x2
	bg	loop_2796
	fpack32	%f14,	%f26,	%f30
	subcc	%i1,	0x0FA6,	%o1
	tgu	%xcc,	0x4
loop_2796:
	siam	0x2
	tcs	%xcc,	0x4
	bcs,pt	%icc,	loop_2797
	bvc,pt	%xcc,	loop_2798
	edge32ln	%o5,	%g6,	%g2
	orn	%i4,	0x162E,	%g4
loop_2797:
	umul	%l2,	%i3,	%l1
loop_2798:
	membar	0x39
	fbo,a	%fcc1,	loop_2799
	udiv	%o0,	0x1AF2,	%i6
	taddcc	%i5,	%i0,	%l0
	brlz	%i7,	loop_2800
loop_2799:
	fmovspos	%icc,	%f24,	%f12
	ldd	[%l7 + 0x08],	%f12
	edge8	%l4,	%o3,	%g7
loop_2800:
	fpack32	%f14,	%f14,	%f4
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x78] %asi,	%o4
	edge32l	%g3,	%o2,	%o7
	brlz	%l3,	loop_2801
	fcmpeq32	%f30,	%f14,	%i2
	edge8ln	%g5,	%l6,	%g1
	sll	%l5,	0x15,	%o6
loop_2801:
	brlz,a	%i1,	loop_2802
	fornot2s	%f17,	%f28,	%f31
	andncc	%o5,	%g6,	%o1
	ldd	[%l7 + 0x10],	%f0
loop_2802:
	edge16l	%i4,	%g2,	%g4
	bvs,a,pt	%icc,	loop_2803
	orcc	%l2,	%l1,	%i3
	and	%o0,	%i6,	%i5
	edge8	%l0,	%i7,	%l4
loop_2803:
	alignaddr	%o3,	%g7,	%i0
	sra	%o4,	%o2,	%o7
	bvs,a	%icc,	loop_2804
	movvs	%icc,	%l3,	%g3
	fmovsle	%icc,	%f23,	%f18
	fnands	%f11,	%f16,	%f3
loop_2804:
	fcmple32	%f18,	%f20,	%i2
	fmovdle	%xcc,	%f16,	%f29
	fmovsne	%icc,	%f12,	%f20
	fnot1s	%f9,	%f7
	bvs	%icc,	loop_2805
	bcc	%icc,	loop_2806
	srl	%l6,	0x01,	%g5
	tg	%xcc,	0x1
loop_2805:
	srl	%g1,	0x16,	%o6
loop_2806:
	fmovrdne	%l5,	%f22,	%f0
	edge8l	%o5,	%g6,	%i1
	movrne	%o1,	0x326,	%i4
	xnorcc	%g4,	0x0044,	%l2
	bne,a	%xcc,	loop_2807
	sllx	%l1,	%g2,	%i3
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf9,	%f16
loop_2807:
	movrgz	%o0,	0x0BE,	%i6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x74] %asi,	%f13
	array16	%l0,	%i7,	%l4
	tl	%xcc,	0x7
	movrgez	%o3,	%i5,	%i0
	set	0x30, %i1
	stxa	%o4,	[%g0 + %i1] 0x20
	edge16l	%o2,	%o7,	%l3
	xorcc	%g7,	0x1F13,	%g3
	srl	%l6,	%g5,	%i2
	fmovrde	%o6,	%f10,	%f18
	orn	%l5,	0x05A0,	%o5
	movre	%g6,	%g1,	%o1
	set	0x38, %i3
	stda	%i0,	[%l7 + %i3] 0x81
	movg	%icc,	%i4,	%l2
	tcc	%icc,	0x1
	udivcc	%g4,	0x19C0,	%l1
	andncc	%g2,	%o0,	%i3
	fpackfix	%f20,	%f7
	nop
	setx	loop_2808,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdcc	%icc,	%f23,	%f5
	tcs	%xcc,	0x4
	ta	%xcc,	0x7
loop_2808:
	bshuffle	%f30,	%f28,	%f26
	and	%i6,	%l0,	%l4
	tne	%xcc,	0x5
	edge16l	%o3,	%i5,	%i7
	movrne	%o4,	0x252,	%o2
	movrgz	%i0,	%o7,	%g7
	movvc	%xcc,	%l3,	%g3
	tneg	%xcc,	0x7
	sdivx	%g5,	0x0561,	%l6
	movpos	%xcc,	%o6,	%l5
	alignaddrl	%i2,	%g6,	%o5
	fmovdle	%icc,	%f3,	%f26
	fmul8sux16	%f16,	%f24,	%f10
	nop
	setx	loop_2809,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivcc	%g1,	0x0AB9,	%o1
	siam	0x1
	stbar
loop_2809:
	sdiv	%i1,	0x094A,	%l2
	std	%g4,	[%l7 + 0x68]
	fmovrdlez	%l1,	%f14,	%f18
	set	0x24, %i7
	stha	%g2,	[%l7 + %i7] 0x2f
	membar	#Sync
	fpack16	%f4,	%f0
	movrlez	%o0,	%i3,	%i6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i4,	%l0
	fandnot2s	%f17,	%f5,	%f1
	fcmpgt32	%f8,	%f10,	%o3
	bcs,a,pn	%icc,	loop_2810
	movge	%icc,	%l4,	%i5
	subcc	%i7,	0x075D,	%o4
	srl	%i0,	%o7,	%g7
loop_2810:
	orcc	%o2,	0x1063,	%g3
	fpack16	%f2,	%f29
	ldx	[%l7 + 0x68],	%g5
	fmovrdgz	%l6,	%f20,	%f14
	edge8n	%o6,	%l5,	%l3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%i2
	udivcc	%o5,	0x008E,	%g1
	sub	%o1,	0x0876,	%g6
	edge16n	%i1,	%l2,	%g4
	tcs	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x69] %asi,	%l1
	alignaddr	%o0,	%i3,	%g2
	stbar
	fmovscs	%xcc,	%f16,	%f26
	flush	%l7 + 0x4C
	movpos	%xcc,	%i6,	%l0
	fmovrslez	%i4,	%f4,	%f10
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x1e
	membar	#Sync
	movpos	%xcc,	%o3,	%i5
	fmovdn	%icc,	%f29,	%f13
	tpos	%icc,	0x2
	fmul8x16	%f20,	%f20,	%f20
	andn	%i7,	0x10D7,	%l4
	movn	%xcc,	%i0,	%o7
	fnors	%f15,	%f22,	%f13
	wr	%g0,	0x88,	%asi
	stba	%g7,	[%l7 + 0x46] %asi
	movcs	%icc,	%o4,	%o2
	ldsw	[%l7 + 0x0C],	%g3
	edge8ln	%l6,	%o6,	%g5
	taddcctv	%l3,	%l5,	%o5
	nop
	setx	loop_2811,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%i2,	0x16F8,	%g1
	fbug	%fcc3,	loop_2812
	alignaddr	%g6,	%i1,	%o1
loop_2811:
	fornot2s	%f18,	%f15,	%f11
	srlx	%l2,	%g4,	%l1
loop_2812:
	smulcc	%i3,	0x1AC8,	%g2
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x27,	%o0
	movrne	%i6,	0x028,	%i4
	tgu	%xcc,	0x7
	tneg	%icc,	0x2
	sdivcc	%l0,	0x1E6E,	%o3
	taddcc	%i5,	0x0EA0,	%i7
	fmovsle	%icc,	%f14,	%f1
	orcc	%l4,	%o7,	%g7
	edge16	%o4,	%o2,	%i0
	edge32ln	%l6,	%g3,	%g5
	subcc	%l3,	%o6,	%l5
	fmovdcs	%xcc,	%f17,	%f29
	fbne	%fcc2,	loop_2813
	brz,a	%o5,	loop_2814
	movrgz	%g1,	0x3BF,	%g6
	call	loop_2815
loop_2813:
	fpack32	%f18,	%f0,	%f12
loop_2814:
	lduh	[%l7 + 0x40],	%i2
	taddcc	%o1,	%l2,	%g4
loop_2815:
	movge	%icc,	%l1,	%i1
	fmovdcc	%xcc,	%f8,	%f4
	fpadd32	%f22,	%f2,	%f22
	fbl,a	%fcc0,	loop_2816
	movrlez	%i3,	0x054,	%o0
	fmovsvs	%xcc,	%f14,	%f3
	fbg	%fcc3,	loop_2817
loop_2816:
	fmovrslez	%i6,	%f27,	%f10
	movpos	%xcc,	%i4,	%l0
	movge	%xcc,	%o3,	%g2
loop_2817:
	fpack32	%f22,	%f6,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x5
	udiv	%i7,	0x0C3B,	%l4
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fpack32	%f22,	%f8,	%f28
	ta	%xcc,	0x1
	membar	0x14
	movgu	%icc,	%o7,	%i5
	fone	%f16
	fmovdle	%icc,	%f12,	%f3
	movge	%xcc,	%g7,	%o4
	edge16ln	%i0,	%l6,	%g3
	mulx	%o2,	%l3,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g5,	0x158F,	%o5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g1,	%g6
	srax	%l5,	0x0B,	%o1
	ta	%icc,	0x0
	fcmpgt16	%f8,	%f26,	%l2
	sethi	0x1608,	%i2
	fmovsge	%icc,	%f19,	%f0
	fcmped	%fcc1,	%f2,	%f24
	fcmpeq32	%f16,	%f2,	%l1
	edge8	%i1,	%i3,	%g4
	udiv	%o0,	0x134A,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i4,	%o3
	fpmerge	%f0,	%f20,	%f6
	taddcctv	%l0,	%i7,	%g2
	xor	%l4,	%i5,	%g7
	move	%icc,	%o4,	%o7
	mulscc	%l6,	%i0,	%o2
	tsubcc	%l3,	%o6,	%g3
	movrlz	%g5,	%o5,	%g1
	membar	0x02
	add	%l5,	0x02F0,	%g6
	edge32l	%o1,	%l2,	%i2
	popc	%i1,	%l1
	edge16	%g4,	%i3,	%o0
	tsubcctv	%i4,	0x0F84,	%o3
	fandnot1	%f22,	%f18,	%f0
	edge16ln	%l0,	%i6,	%g2
	edge32ln	%l4,	%i7,	%i5
	sra	%o4,	0x00,	%g7
	tn	%xcc,	0x5
	tle	%icc,	0x6
	fpsub16	%f20,	%f16,	%f26
	fmovda	%xcc,	%f2,	%f16
	nop
	set	0x52, %l1
	stb	%l6,	[%l7 + %l1]
	fexpand	%f9,	%f24
	fmovsl	%xcc,	%f18,	%f23
	fmovdleu	%icc,	%f1,	%f5
	fcmpeq32	%f2,	%f4,	%i0
	movrne	%o7,	%o2,	%l3
	tgu	%icc,	0x0
	movge	%icc,	%g3,	%g5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%g1
	bshuffle	%f22,	%f18,	%f0
	ba,pn	%icc,	loop_2818
	array32	%o6,	%g6,	%o1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x40] %asi,	%l5
loop_2818:
	bvs,a	loop_2819
	ldd	[%l7 + 0x40],	%f10
	movvs	%xcc,	%i2,	%i1
	fmovdgu	%icc,	%f20,	%f1
loop_2819:
	taddcc	%l2,	%g4,	%i3
	or	%o0,	0x0C15,	%i4
	movrlez	%o3,	%l1,	%i6
	movrne	%g2,	0x3D5,	%l0
	fcmpeq32	%f6,	%f10,	%i7
	alignaddrl	%i5,	%l4,	%g7
	sdivx	%o4,	0x1024,	%l6
	movrgez	%i0,	0x227,	%o2
	movge	%icc,	%o7,	%g3
	fmovda	%xcc,	%f1,	%f25
	edge32l	%g5,	%o5,	%l3
	fblg,a	%fcc2,	loop_2820
	ldd	[%l7 + 0x60],	%f28
	tne	%xcc,	0x0
	array8	%g1,	%g6,	%o1
loop_2820:
	tgu	%xcc,	0x7
	tg	%xcc,	0x2
	tvs	%xcc,	0x2
	srax	%o6,	0x19,	%l5
	umul	%i2,	%l2,	%g4
	tne	%icc,	0x3
	sub	%i1,	0x0BCE,	%i3
	set	0x2B, %i2
	stba	%i4,	[%l7 + %i2] 0x2a
	membar	#Sync
	bg,a	loop_2821
	fzero	%f26
	add	%o3,	0x1C7E,	%l1
	sub	%o0,	0x0AE2,	%i6
loop_2821:
	bneg,a,pn	%icc,	loop_2822
	sra	%g2,	0x03,	%i7
	fmovd	%f20,	%f2
	fmovdneg	%icc,	%f31,	%f21
loop_2822:
	subcc	%i5,	%l4,	%g7
	stb	%o4,	[%l7 + 0x5C]
	fcmpne16	%f24,	%f20,	%l0
	fandnot1s	%f25,	%f18,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x7
	fnand	%f6,	%f30,	%f6
	edge8	%i0,	%o2,	%l6
	edge8l	%o7,	%g5,	%g3
	edge8l	%o5,	%g1,	%g6
	fbul	%fcc3,	loop_2823
	udiv	%o1,	0x0EEB,	%l3
	set	0x4C, %o3
	lduwa	[%l7 + %o3] 0x88,	%o6
loop_2823:
	fmovsvs	%icc,	%f31,	%f2
	fnand	%f8,	%f8,	%f0
	fcmped	%fcc3,	%f26,	%f26
	sll	%l5,	0x1E,	%l2
	edge16ln	%i2,	%g4,	%i3
	edge32	%i4,	%i1,	%o3
	mulscc	%l1,	0x052F,	%i6
	orcc	%g2,	%i7,	%o0
	ldx	[%l7 + 0x38],	%i5
	tvs	%icc,	0x0
	fmovdle	%icc,	%f13,	%f10
	move	%icc,	%l4,	%g7
	movle	%xcc,	%o4,	%l0
	fmovsneg	%icc,	%f28,	%f21
	movcc	%xcc,	%o2,	%i0
	sethi	0x1844,	%o7
	movvc	%xcc,	%l6,	%g3
	te	%icc,	0x0
	tvs	%icc,	0x7
	movg	%xcc,	%o5,	%g5
	movrne	%g6,	0x1FD,	%o1
	mulx	%g1,	%l3,	%o6
	fmovsne	%icc,	%f7,	%f6
	subcc	%l2,	0x0D03,	%i2
	edge8ln	%l5,	%g4,	%i3
	prefetch	[%l7 + 0x38],	 0x3
	ldsh	[%l7 + 0x78],	%i4
	fxnor	%f10,	%f30,	%f4
	alignaddrl	%i1,	%o3,	%i6
	movneg	%xcc,	%g2,	%l1
	popc	%i7,	%o0
	wr	%g0,	0x19,	%asi
	stha	%i5,	[%l7 + 0x76] %asi
	fornot1s	%f23,	%f14,	%f1
	movrne	%g7,	%l4,	%o4
	fand	%f16,	%f6,	%f12
	andncc	%o2,	%l0,	%o7
	set	0x4E, %l4
	stha	%i0,	[%l7 + %l4] 0x18
	fmul8x16al	%f25,	%f10,	%f6
	fbn	%fcc0,	loop_2824
	srl	%g3,	0x05,	%o5
	edge16l	%l6,	%g5,	%g6
	movcc	%xcc,	%o1,	%g1
loop_2824:
	fsrc2	%f30,	%f8
	fmovsneg	%xcc,	%f24,	%f27
	srax	%o6,	0x18,	%l2
	andn	%l3,	0x1992,	%l5
	fcmpne16	%f30,	%f14,	%i2
	tg	%icc,	0x7
	movrgez	%i3,	0x0CA,	%i4
	ldub	[%l7 + 0x15],	%i1
	fpack32	%f0,	%f30,	%f22
	srl	%o3,	0x0C,	%i6
	set	0x210, %o6
	ldxa	[%g0 + %o6] 0x52,	%g2
	ble,pt	%xcc,	loop_2825
	bvc	loop_2826
	orcc	%l1,	%g4,	%o0
	membar	0x00
loop_2825:
	fmovrdlez	%i7,	%f6,	%f22
loop_2826:
	andcc	%g7,	0x0A13,	%l4
	tcs	%xcc,	0x6
	fmuld8ulx16	%f5,	%f8,	%f20
	edge32ln	%o4,	%o2,	%i5
	fmovdcc	%xcc,	%f26,	%f29
	swap	[%l7 + 0x58],	%o7
	edge16n	%l0,	%g3,	%i0
	ba	%icc,	loop_2827
	tpos	%xcc,	0x5
	movl	%icc,	%l6,	%o5
	sdivcc	%g5,	0x09FA,	%g6
loop_2827:
	orncc	%o1,	%o6,	%g1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%l3
	brz	%l2,	loop_2828
	brlez	%l5,	loop_2829
	tl	%xcc,	0x4
	nop
	set	0x3C, %g7
	stw	%i2,	[%l7 + %g7]
loop_2828:
	ldx	[%l7 + 0x68],	%i3
loop_2829:
	movrgez	%i1,	%i4,	%i6
	tsubcc	%o3,	0x02BE,	%l1
	fsrc2s	%f14,	%f28
	fbne	%fcc3,	loop_2830
	ldsw	[%l7 + 0x2C],	%g2
	addc	%o0,	0x19C4,	%g4
	and	%i7,	0x0D2E,	%l4
loop_2830:
	fnor	%f10,	%f22,	%f0
	array32	%g7,	%o4,	%o2
	mova	%icc,	%o7,	%i5
	andcc	%g3,	0x0957,	%l0
	movrgz	%i0,	%l6,	%g5
	sra	%o5,	%o1,	%o6
	sllx	%g6,	%l3,	%l2
	fbge,a	%fcc1,	loop_2831
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g1,	%l5
	tpos	%icc,	0x2
loop_2831:
	array8	%i3,	%i2,	%i1
	fba,a	%fcc3,	loop_2832
	edge16ln	%i4,	%o3,	%i6
	fands	%f5,	%f27,	%f21
	bneg,pt	%xcc,	loop_2833
loop_2832:
	edge32l	%g2,	%o0,	%g4
	movcs	%xcc,	%l1,	%i7
	tle	%xcc,	0x3
loop_2833:
	smulcc	%l4,	0x186F,	%g7
	umul	%o4,	%o2,	%o7
	tl	%xcc,	0x6
	brnz,a	%g3,	loop_2834
	fmovdgu	%icc,	%f6,	%f26
	tn	%xcc,	0x6
	tg	%icc,	0x6
loop_2834:
	sir	0x071D
	bne,a,pt	%xcc,	loop_2835
	fnot2s	%f4,	%f30
	brnz,a	%i5,	loop_2836
	sethi	0x0B33,	%i0
loop_2835:
	ba	loop_2837
	tn	%icc,	0x3
loop_2836:
	fmovdvs	%xcc,	%f3,	%f4
	tne	%xcc,	0x5
loop_2837:
	movre	%l0,	%l6,	%g5
	fmovdvs	%xcc,	%f16,	%f5
	xnorcc	%o5,	0x0641,	%o1
	edge16	%g6,	%l3,	%o6
	movgu	%icc,	%g1,	%l5
	or	%i3,	%l2,	%i1
	edge16	%i4,	%i2,	%o3
	nop
	set	0x44, %o1
	ldsw	[%l7 + %o1],	%i6
	fornot2s	%f28,	%f20,	%f7
	sll	%o0,	%g4,	%g2
	edge16ln	%i7,	%l1,	%l4
	alignaddr	%g7,	%o4,	%o2
	fexpand	%f28,	%f18
	ldsb	[%l7 + 0x5D],	%o7
	set	0x22, %i4
	ldsha	[%l7 + %i4] 0x18,	%i5
	tvs	%xcc,	0x3
	tcs	%icc,	0x7
	addccc	%i0,	0x1321,	%g3
	movn	%icc,	%l6,	%g5
	movrgz	%o5,	0x241,	%l0
	bcc	%icc,	loop_2838
	subc	%o1,	%g6,	%o6
	orcc	%l3,	0x1680,	%l5
	fmovdl	%xcc,	%f3,	%f23
loop_2838:
	fbue,a	%fcc2,	loop_2839
	orncc	%i3,	%l2,	%i1
	fmul8x16au	%f3,	%f27,	%f20
	edge16	%g1,	%i4,	%o3
loop_2839:
	edge8l	%i2,	%i6,	%o0
	bpos	%xcc,	loop_2840
	stbar
	smul	%g4,	%g2,	%i7
	movcc	%icc,	%l4,	%l1
loop_2840:
	srlx	%o4,	0x09,	%o2
	taddcctv	%o7,	0x1459,	%g7
	movn	%xcc,	%i5,	%g3
	addccc	%i0,	0x0D6D,	%g5
	fmovdcs	%icc,	%f21,	%f19
	ldsw	[%l7 + 0x30],	%o5
	fornot2	%f12,	%f8,	%f0
	fmovrdgez	%l6,	%f10,	%f16
	fmovrsgez	%l0,	%f29,	%f12
	fabss	%f21,	%f20
	fnot1s	%f8,	%f19
	add	%l7,	0x54,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%o1
	edge32n	%o6,	%l3,	%l5
	fxors	%f24,	%f7,	%f7
	orn	%i3,	0x08BC,	%l2
	fbl	%fcc1,	loop_2841
	te	%icc,	0x0
	edge32ln	%g1,	%i4,	%i1
	fabss	%f29,	%f12
loop_2841:
	fmuld8sux16	%f3,	%f4,	%f2
	andncc	%o3,	%i2,	%i6
	sllx	%o0,	0x1E,	%g2
	movrlz	%g4,	%i7,	%l4
	fmuld8ulx16	%f28,	%f21,	%f0
	edge16ln	%l1,	%o2,	%o7
	fmovrdlz	%g7,	%f18,	%f28
	fnot2	%f16,	%f2
	movl	%icc,	%i5,	%g3
	ldsw	[%l7 + 0x68],	%i0
	bvs,pn	%icc,	loop_2842
	mulx	%o4,	0x109E,	%o5
	mulscc	%g5,	%l0,	%l6
	srax	%g6,	%o6,	%l3
loop_2842:
	orcc	%o1,	0x087F,	%i3
	array16	%l2,	%l5,	%g1
	movle	%xcc,	%i1,	%i4
	addc	%i2,	0x10FF,	%o3
	fbl	%fcc0,	loop_2843
	srax	%o0,	%i6,	%g2
	tvc	%xcc,	0x5
	bn,a,pt	%icc,	loop_2844
loop_2843:
	nop
	setx loop_2845, %l0, %l1
	jmpl %l1, %g4
	brnz	%i7,	loop_2846
	sth	%l4,	[%l7 + 0x2E]
loop_2844:
	tl	%xcc,	0x0
loop_2845:
	xor	%l1,	%o7,	%o2
loop_2846:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x63
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x10,	%f16
	fabsd	%f10,	%f12
	umulcc	%g7,	0x1A71,	%g3
	andncc	%i5,	%i0,	%o5
	fbuge	%fcc1,	loop_2847
	fmovrse	%g5,	%f14,	%f11
	movleu	%icc,	%l0,	%l6
	movrlz	%g6,	0x1CF,	%o4
loop_2847:
	ldub	[%l7 + 0x21],	%o6
	orncc	%o1,	%i3,	%l2
	fmovdvc	%icc,	%f16,	%f13
	fbo	%fcc1,	loop_2848
	movcc	%icc,	%l3,	%l5
	edge8l	%g1,	%i1,	%i4
	and	%o3,	0x1663,	%o0
loop_2848:
	movvs	%icc,	%i2,	%g2
	movn	%xcc,	%i6,	%g4
	wr	%g0,	0x18,	%asi
	sta	%f13,	[%l7 + 0x48] %asi
	fmovrsne	%l4,	%f10,	%f2
	fmovrdlez	%l1,	%f14,	%f30
	alignaddrl	%o7,	%i7,	%o2
	popc	0x012C,	%g3
	fors	%f25,	%f29,	%f24
	movcc	%xcc,	%i5,	%g7
	fmovrslz	%o5,	%f8,	%f22
	tge	%xcc,	0x4
	set	0x20, %g4
	stxa	%i0,	[%l7 + %g4] 0x23
	membar	#Sync
	fmovda	%icc,	%f3,	%f22
	taddcc	%l0,	0x01E1,	%g5
	add	%l6,	0x144D,	%g6
	brgz,a	%o6,	loop_2849
	ldub	[%l7 + 0x71],	%o1
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x38] %asi,	%o4
loop_2849:
	sub	%i3,	0x0BB5,	%l2
	tpos	%xcc,	0x7
	taddcctv	%l3,	0x01C8,	%l5
	fornot1	%f8,	%f28,	%f14
	srax	%g1,	0x04,	%i4
	movl	%icc,	%o3,	%o0
	nop
	setx loop_2850, %l0, %l1
	jmpl %l1, %i2
	fandnot2s	%f6,	%f7,	%f20
	wr	%g0,	0x10,	%asi
	stha	%i1,	[%l7 + 0x38] %asi
loop_2850:
	fnors	%f1,	%f11,	%f21
	subccc	%i6,	0x0C42,	%g2
	edge16ln	%l4,	%g4,	%l1
	fbl	%fcc1,	loop_2851
	edge8n	%i7,	%o7,	%o2
	stb	%g3,	[%l7 + 0x43]
	fmuld8sux16	%f9,	%f27,	%f18
loop_2851:
	ldd	[%l7 + 0x68],	%i4
	fcmpgt32	%f6,	%f10,	%g7
	umul	%o5,	%i0,	%l0
	mova	%xcc,	%g5,	%l6
	ldsb	[%l7 + 0x0B],	%g6
	nop
	setx	loop_2852,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdvc	%icc,	%f17,	%f0
	tpos	%xcc,	0x6
	wr	%g0,	0x27,	%asi
	stda	%o6,	[%l7 + 0x48] %asi
	membar	#Sync
loop_2852:
	tleu	%icc,	0x2
	tsubcc	%o1,	%i3,	%o4
	fmovdpos	%xcc,	%f16,	%f27
	fnegs	%f21,	%f0
	tle	%xcc,	0x2
	fmovsn	%icc,	%f24,	%f13
	movrlez	%l3,	0x125,	%l5
	umulcc	%g1,	%l2,	%i4
	array8	%o0,	%i2,	%o3
	fbul,a	%fcc2,	loop_2853
	umulcc	%i1,	%g2,	%l4
	fble	%fcc0,	loop_2854
	std	%i6,	[%l7 + 0x18]
loop_2853:
	movle	%xcc,	%l1,	%g4
	edge32	%i7,	%o2,	%g3
loop_2854:
	ldstub	[%l7 + 0x60],	%i5
	xorcc	%o7,	%g7,	%i0
	fbne	%fcc3,	loop_2855
	edge16ln	%o5,	%g5,	%l0
	fpack32	%f6,	%f10,	%f14
	nop
	setx	loop_2856,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2855:
	edge32n	%l6,	%g6,	%o6
	ta	%xcc,	0x5
	movvc	%xcc,	%i3,	%o1
loop_2856:
	edge32n	%o4,	%l5,	%l3
	movge	%xcc,	%l2,	%g1
	edge8	%o0,	%i4,	%o3
	edge32	%i1,	%g2,	%i2
	orcc	%l4,	0x1828,	%l1
	nop
	set	0x26, %l6
	sth	%i6,	[%l7 + %l6]
	bgu,a,pn	%xcc,	loop_2857
	addc	%g4,	0x0965,	%i7
	fcmpeq16	%f10,	%f20,	%g3
	movl	%icc,	%i5,	%o7
loop_2857:
	srlx	%g7,	0x12,	%i0
	sll	%o5,	0x0D,	%g5
	andncc	%o2,	%l0,	%l6
	wr	%g0,	0x11,	%asi
	stxa	%o6,	[%l7 + 0x70] %asi
	movne	%icc,	%i3,	%g6
	tvc	%icc,	0x1
	addcc	%o4,	%l5,	%o1
	bcc	%xcc,	loop_2858
	alignaddr	%l2,	%l3,	%g1
	edge16n	%o0,	%o3,	%i4
	fbue	%fcc0,	loop_2859
loop_2858:
	movre	%i1,	0x0D1,	%i2
	brgez,a	%l4,	loop_2860
	movre	%l1,	%g2,	%i6
loop_2859:
	subc	%i7,	%g3,	%i5
	ta	%xcc,	0x3
loop_2860:
	srax	%o7,	0x09,	%g4
	fmovsle	%icc,	%f28,	%f9
	set	0x57, %i6
	ldsba	[%l7 + %i6] 0x14,	%g7
	smul	%o5,	%g5,	%o2
	fmovrse	%i0,	%f9,	%f17
	fpack16	%f6,	%f21
	set	0x08, %o4
	stba	%l0,	[%l7 + %o4] 0x04
	ldub	[%l7 + 0x61],	%o6
	bleu,a,pt	%icc,	loop_2861
	movgu	%xcc,	%l6,	%g6
	movvs	%icc,	%o4,	%i3
	addc	%o1,	%l2,	%l5
loop_2861:
	movg	%icc,	%g1,	%l3
	movge	%xcc,	%o0,	%i4
	edge8l	%o3,	%i2,	%l4
	ldub	[%l7 + 0x49],	%l1
	taddcc	%i1,	%i6,	%g2
	tge	%xcc,	0x3
	movl	%xcc,	%g3,	%i5
	fmovse	%icc,	%f5,	%f29
	fxnor	%f22,	%f2,	%f4
	movg	%icc,	%o7,	%g4
	fmovsvc	%icc,	%f29,	%f26
	udivx	%i7,	0x147F,	%g7
	edge16ln	%o5,	%g5,	%i0
	sdivcc	%l0,	0x11EB,	%o2
	fmovrsgez	%o6,	%f23,	%f22
	fone	%f2
	fbug,a	%fcc2,	loop_2862
	fpack16	%f14,	%f6
	bvc,a,pt	%icc,	loop_2863
	tcs	%icc,	0x7
loop_2862:
	nop
	set	0x12, %o0
	ldsba	[%l7 + %o0] 0x81,	%l6
loop_2863:
	fsrc1s	%f14,	%f1
	srlx	%g6,	%i3,	%o4
	move	%icc,	%o1,	%l2
	fornot1s	%f6,	%f7,	%f1
	fpack16	%f2,	%f14
	sllx	%l5,	%l3,	%o0
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x18] %asi,	%g1
	tle	%icc,	0x4
	std	%o2,	[%l7 + 0x58]
	for	%f16,	%f20,	%f30
	tsubcctv	%i2,	%i4,	%l1
	srl	%i1,	%l4,	%g2
	fnot2s	%f15,	%f23
	udiv	%i6,	0x0418,	%g3
	smul	%i5,	0x12AB,	%g4
	subcc	%i7,	%o7,	%g7
	bne,pn	%xcc,	loop_2864
	nop
	setx	loop_2865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdl	%icc,	%f14,	%f11
	xorcc	%g5,	%i0,	%l0
loop_2864:
	movg	%icc,	%o5,	%o2
loop_2865:
	membar	0x1F
	bcs	loop_2866
	tgu	%xcc,	0x2
	tsubcctv	%o6,	0x0780,	%g6
	fmovrdgez	%i3,	%f2,	%f28
loop_2866:
	tgu	%icc,	0x1
	movle	%xcc,	%o4,	%l6
	movne	%icc,	%o1,	%l5
	ldub	[%l7 + 0x17],	%l3
	mova	%icc,	%o0,	%g1
	taddcctv	%o3,	%i2,	%l2
	st	%f10,	[%l7 + 0x7C]
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x18,	%i4
	movvs	%icc,	%i1,	%l1
	movre	%l4,	0x0D6,	%i6
	addcc	%g3,	0x0FFF,	%g2
	brlez,a	%i5,	loop_2867
	tneg	%xcc,	0x7
	ldsw	[%l7 + 0x44],	%i7
	srlx	%g4,	0x12,	%g7
loop_2867:
	tn	%icc,	0x6
	sir	0x0032
	sra	%o7,	%g5,	%i0
	addccc	%l0,	0x1015,	%o5
	sir	0x0094
	fmovrslz	%o2,	%f20,	%f20
	andncc	%o6,	%g6,	%o4
	set	0x6C, %g3
	swapa	[%l7 + %g3] 0x11,	%i3
	fmovdcc	%xcc,	%f5,	%f24
	faligndata	%f28,	%f8,	%f6
	edge16n	%l6,	%l5,	%l3
	fnors	%f31,	%f13,	%f31
	edge32ln	%o0,	%o1,	%o3
	array32	%g1,	%l2,	%i4
	sllx	%i2,	0x1E,	%l1
	nop
	setx	loop_2868,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpgt16	%f16,	%f2,	%l4
	nop
	setx	loop_2869,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpd	%fcc2,	%f2,	%f28
loop_2868:
	tvs	%icc,	0x0
	xnorcc	%i6,	%i1,	%g3
loop_2869:
	bge,a	%xcc,	loop_2870
	movleu	%xcc,	%g2,	%i5
	fnot1s	%f28,	%f15
	faligndata	%f28,	%f10,	%f28
loop_2870:
	brgz,a	%i7,	loop_2871
	movrgz	%g7,	%o7,	%g4
	fbu,a	%fcc1,	loop_2872
	fabsd	%f4,	%f30
loop_2871:
	fmovrsgez	%g5,	%f0,	%f11
	bneg	%icc,	loop_2873
loop_2872:
	andn	%i0,	0x0729,	%o5
	st	%f30,	[%l7 + 0x20]
	xnor	%o2,	0x1071,	%o6
loop_2873:
	edge16n	%g6,	%l0,	%i3
	tne	%icc,	0x7
	fornot1s	%f13,	%f10,	%f30
	edge8ln	%o4,	%l5,	%l3
	set	0x56, %g1
	lduha	[%l7 + %g1] 0x18,	%o0
	edge8	%l6,	%o3,	%g1
	tn	%xcc,	0x2
	fcmpeq16	%f8,	%f12,	%o1
	ldsb	[%l7 + 0x25],	%i4
	srlx	%i2,	%l2,	%l4
	tne	%icc,	0x4
	orn	%l1,	0x1AC8,	%i1
	udivx	%g3,	0x1542,	%i6
	movvs	%icc,	%g2,	%i7
	te	%xcc,	0x4
	fbne,a	%fcc2,	loop_2874
	movrgez	%i5,	0x2EA,	%g7
	movrgez	%o7,	%g4,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2874:
	movneg	%xcc,	%i0,	%o5
	movrgz	%o2,	%g6,	%o6
	xorcc	%i3,	%o4,	%l0
	edge8n	%l5,	%o0,	%l6
	fmovdn	%icc,	%f23,	%f3
	ta	%xcc,	0x7
	array16	%l3,	%g1,	%o1
	tg	%xcc,	0x3
	array8	%o3,	%i4,	%i2
	fmovdneg	%icc,	%f23,	%f23
	movrne	%l2,	%l4,	%i1
	subc	%l1,	0x017C,	%g3
	fmovrse	%g2,	%f10,	%f31
	fnor	%f16,	%f4,	%f30
	fmovdge	%xcc,	%f20,	%f11
	movvc	%xcc,	%i7,	%i5
	tsubcc	%g7,	0x1F29,	%i6
	fones	%f16
	edge16l	%o7,	%g5,	%i0
	brlz	%g4,	loop_2875
	mova	%xcc,	%o5,	%o2
	edge16ln	%g6,	%i3,	%o6
	sdivcc	%o4,	0x04E2,	%l0
loop_2875:
	movrgz	%l5,	%l6,	%o0
	movpos	%xcc,	%g1,	%o1
	lduh	[%l7 + 0x56],	%o3
	stb	%i4,	[%l7 + 0x2B]
	brlz	%i2,	loop_2876
	and	%l2,	0x0952,	%l3
	ldub	[%l7 + 0x48],	%l4
	xnor	%l1,	%g3,	%g2
loop_2876:
	smul	%i7,	0x1A57,	%i1
	movcs	%icc,	%g7,	%i6
	sra	%i5,	%o7,	%g5
	array8	%g4,	%i0,	%o5
	bvs,a,pn	%xcc,	loop_2877
	movrlz	%g6,	%i3,	%o2
	edge32	%o6,	%o4,	%l5
	sdiv	%l0,	0x0922,	%o0
loop_2877:
	fcmpne16	%f0,	%f22,	%g1
	ldsh	[%l7 + 0x20],	%l6
	movge	%xcc,	%o1,	%i4
	smulcc	%o3,	0x0C99,	%l2
	stx	%l3,	[%l7 + 0x20]
	sll	%l4,	0x09,	%l1
	fpsub16s	%f18,	%f30,	%f14
	udivcc	%i2,	0x19D8,	%g3
	alignaddr	%i7,	%i1,	%g7
	nop
	setx	loop_2878,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x7
	tsubcc	%g2,	0x1229,	%i5
	ba,a	%icc,	loop_2879
loop_2878:
	fmovdneg	%xcc,	%f23,	%f4
	fnands	%f15,	%f11,	%f3
	brnz,a	%i6,	loop_2880
loop_2879:
	edge8l	%o7,	%g5,	%g4
	movl	%xcc,	%o5,	%g6
	umul	%i0,	0x166C,	%o2
loop_2880:
	movgu	%xcc,	%i3,	%o4
	tge	%icc,	0x4
	prefetch	[%l7 + 0x44],	 0x1
	movrne	%l5,	%l0,	%o6
	wr	%g0,	0x80,	%asi
	stba	%o0,	[%l7 + 0x4D] %asi
	edge8	%g1,	%o1,	%l6
	movgu	%xcc,	%o3,	%i4
	wr	%g0,	0x2f,	%asi
	stba	%l3,	[%l7 + 0x2D] %asi
	membar	#Sync
	movneg	%icc,	%l2,	%l4
	fcmple16	%f2,	%f10,	%l1
	fnot2	%f2,	%f20
	set	0x50, %l2
	lduwa	[%l7 + %l2] 0x0c,	%i2
	ldub	[%l7 + 0x43],	%i7
	fcmpeq16	%f2,	%f30,	%g3
	movg	%icc,	%g7,	%i1
	array16	%g2,	%i6,	%i5
	edge8l	%g5,	%o7,	%o5
	edge32n	%g4,	%g6,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%o2,	%i3
	movvs	%icc,	%o4,	%l5
	set	0x4C, %g6
	sta	%f22,	[%l7 + %g6] 0x89
	tsubcctv	%o6,	%l0,	%g1
	fmuld8sux16	%f13,	%f7,	%f16
	orcc	%o1,	0x1BF8,	%l6
	array16	%o3,	%i4,	%o0
	set	0x5B, %i5
	ldsba	[%l7 + %i5] 0x18,	%l2
	xnor	%l3,	0x0DF2,	%l4
	movg	%xcc,	%l1,	%i7
	swap	[%l7 + 0x48],	%i2
	set	0x68, %i0
	stda	%g2,	[%l7 + %i0] 0x88
	udivcc	%g7,	0x0E66,	%i1
	tne	%xcc,	0x0
	tleu	%icc,	0x4
	fbl,a	%fcc2,	loop_2881
	prefetch	[%l7 + 0x6C],	 0x0
	orncc	%i6,	0x12B7,	%g2
	movrlez	%g5,	%o7,	%i5
loop_2881:
	array16	%g4,	%o5,	%i0
	wr	%g0,	0x18,	%asi
	stwa	%g6,	[%l7 + 0x38] %asi
	prefetch	[%l7 + 0x14],	 0x3
	movl	%icc,	%i3,	%o2
	te	%xcc,	0x2
	nop
	setx	loop_2882,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%icc,	%o4,	%o6
	sdivx	%l0,	0x1612,	%g1
	alignaddrl	%l5,	%l6,	%o3
loop_2882:
	bge,a	loop_2883
	fones	%f19
	mulscc	%i4,	%o1,	%o0
	movrgz	%l3,	%l4,	%l2
loop_2883:
	brz,a	%i7,	loop_2884
	stbar
	tle	%icc,	0x6
	udivcc	%i2,	0x15C2,	%l1
loop_2884:
	movle	%xcc,	%g7,	%g3
	bn,a,pn	%icc,	loop_2885
	movcs	%icc,	%i6,	%g2
	fmovrdgez	%i1,	%f4,	%f14
	movrlez	%g5,	%o7,	%g4
loop_2885:
	sub	%o5,	%i5,	%g6
	movcs	%icc,	%i0,	%o2
	movrlez	%o4,	%i3,	%l0
	udivx	%g1,	0x1BBA,	%o6
	fexpand	%f12,	%f22
	tvc	%xcc,	0x5
	taddcc	%l6,	0x01A3,	%o3
	fmovrsgz	%i4,	%f30,	%f31
	and	%o1,	0x17B4,	%o0
	xnor	%l5,	%l3,	%l2
	std	%f2,	[%l7 + 0x48]
	ldsh	[%l7 + 0x24],	%i7
	std	%f28,	[%l7 + 0x78]
	edge16l	%l4,	%i2,	%g7
	udiv	%g3,	0x05B5,	%i6
	ldsb	[%l7 + 0x51],	%g2
	or	%i1,	0x0A70,	%l1
	fbo	%fcc0,	loop_2886
	orn	%o7,	%g5,	%g4
	orcc	%i5,	%o5,	%g6
	movrlz	%i0,	0x183,	%o2
loop_2886:
	lduh	[%l7 + 0x36],	%o4
	edge16ln	%l0,	%g1,	%i3
	brnz,a	%l6,	loop_2887
	taddcc	%o3,	0x12B9,	%i4
	nop
	setx	loop_2888,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fand	%f28,	%f16,	%f6
loop_2887:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x64] %asi,	%o1
loop_2888:
	movpos	%xcc,	%o0,	%l5
	sethi	0x1D84,	%o6
	tcc	%icc,	0x7
	tsubcc	%l3,	%i7,	%l2
	movgu	%icc,	%i2,	%l4
	fmovdl	%icc,	%f20,	%f26
	edge32	%g3,	%g7,	%i6
	bne	loop_2889
	fmovspos	%icc,	%f12,	%f3
	fandnot1s	%f24,	%f18,	%f6
	fmovsle	%xcc,	%f4,	%f4
loop_2889:
	fcmped	%fcc0,	%f20,	%f6
	fbe	%fcc3,	loop_2890
	edge16	%g2,	%l1,	%o7
	array32	%g5,	%g4,	%i5
	edge32ln	%o5,	%g6,	%i0
loop_2890:
	sdivcc	%o2,	0x1968,	%o4
	movrgez	%i1,	0x1CF,	%g1
	tsubcc	%i3,	0x0E77,	%l6
	tvc	%icc,	0x1
	sllx	%l0,	%i4,	%o1
	alignaddrl	%o0,	%l5,	%o6
	fmul8ulx16	%f4,	%f14,	%f22
	nop
	set	0x68, %l0
	stw	%o3,	[%l7 + %l0]
	fmovdneg	%icc,	%f24,	%f9
	tcs	%icc,	0x4
	sth	%i7,	[%l7 + 0x6C]
	fbue	%fcc2,	loop_2891
	lduh	[%l7 + 0x7E],	%l2
	edge8n	%i2,	%l3,	%l4
	edge32n	%g3,	%g7,	%i6
loop_2891:
	faligndata	%f14,	%f4,	%f28
	set	0x10, %g5
	ldda	[%l7 + %g5] 0xeb,	%g2
	movne	%icc,	%l1,	%g5
	fnor	%f14,	%f10,	%f20
	tvc	%xcc,	0x4
	fmovscs	%icc,	%f21,	%f21
	fbug,a	%fcc2,	loop_2892
	movle	%xcc,	%o7,	%g4
	umulcc	%o5,	%i5,	%g6
	edge32ln	%i0,	%o2,	%i1
loop_2892:
	srlx	%g1,	%i3,	%l6
	fmovrslez	%l0,	%f26,	%f0
	bleu	loop_2893
	array16	%o4,	%i4,	%o1
	ldx	[%l7 + 0x60],	%l5
	bne,pn	%icc,	loop_2894
loop_2893:
	orcc	%o0,	%o6,	%i7
	tvc	%icc,	0x3
	addccc	%l2,	%o3,	%i2
loop_2894:
	srax	%l4,	%l3,	%g3
	fpack32	%f22,	%f16,	%f0
	srax	%i6,	0x0E,	%g2
	array32	%l1,	%g5,	%o7
	sdiv	%g7,	0x1CED,	%o5
	bcc,a,pt	%xcc,	loop_2895
	fbue,a	%fcc2,	loop_2896
	fmovsge	%icc,	%f0,	%f7
	movrlez	%i5,	%g6,	%g4
loop_2895:
	membar	0x28
loop_2896:
	tge	%xcc,	0x6
	subccc	%o2,	0x1959,	%i0
	set	0x18, %g2
	lda	[%l7 + %g2] 0x04,	%f8
	stx	%i1,	[%l7 + 0x10]
	andn	%i3,	0x15C0,	%g1
	fcmps	%fcc2,	%f20,	%f18
	tneg	%xcc,	0x1
	sdivcc	%l6,	0x0B41,	%l0
	andncc	%o4,	%i4,	%l5
	fmovdn	%xcc,	%f15,	%f17
	stb	%o1,	[%l7 + 0x10]
	edge32	%o6,	%i7,	%o0
	tgu	%xcc,	0x6
	fxnor	%f4,	%f22,	%f30
	udiv	%l2,	0x1968,	%i2
	tn	%xcc,	0x2
	movvs	%xcc,	%l4,	%o3
	orn	%l3,	%g3,	%i6
	movle	%icc,	%g2,	%g5
	fands	%f5,	%f15,	%f8
	fmovscs	%xcc,	%f20,	%f14
	tl	%icc,	0x5
	wr	%g0,	0x19,	%asi
	stha	%o7,	[%l7 + 0x7E] %asi
	bl	loop_2897
	fcmpgt16	%f8,	%f18,	%g7
	set	0x8, %i1
	stxa	%l1,	[%g0 + %i1] 0x21
loop_2897:
	fbuge	%fcc2,	loop_2898
	edge32l	%o5,	%i5,	%g4
	fand	%f18,	%f2,	%f4
	movrlez	%g6,	0x29A,	%o2
loop_2898:
	fbn	%fcc3,	loop_2899
	smulcc	%i1,	%i0,	%i3
	fnot2s	%f1,	%f29
	andcc	%g1,	%l0,	%o4
loop_2899:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%l5
	fcmpne32	%f20,	%f8,	%o1
	or	%o6,	0x081B,	%i4
	ldub	[%l7 + 0x6F],	%o0
	edge16l	%i7,	%l2,	%l4
	movcs	%icc,	%o3,	%i2
	ld	[%l7 + 0x2C],	%f21
	fbe,a	%fcc2,	loop_2900
	andcc	%l3,	%i6,	%g3
	fmovdpos	%xcc,	%f20,	%f4
	srl	%g5,	%o7,	%g7
loop_2900:
	nop
	set	0x65, %i3
	ldsba	[%l7 + %i3] 0x04,	%l1
	fble	%fcc1,	loop_2901
	bcs,pt	%xcc,	loop_2902
	sethi	0x0C3B,	%g2
	tle	%icc,	0x4
loop_2901:
	fmovsl	%icc,	%f3,	%f5
loop_2902:
	andn	%i5,	0x1F70,	%g4
	edge16	%o5,	%o2,	%i1
	edge8n	%g6,	%i3,	%g1
	xnorcc	%i0,	0x199B,	%l0
	fmovsneg	%xcc,	%f3,	%f28
	tn	%xcc,	0x0
	bleu,pn	%icc,	loop_2903
	movge	%xcc,	%l6,	%o4
	fmovdcc	%xcc,	%f5,	%f24
	mulscc	%o1,	%l5,	%o6
loop_2903:
	smul	%o0,	%i4,	%l2
	tneg	%icc,	0x2
	sdiv	%i7,	0x131C,	%o3
	edge8	%i2,	%l3,	%i6
	fxnors	%f20,	%f0,	%f22
	edge32ln	%l4,	%g5,	%g3
	fcmpgt32	%f16,	%f10,	%g7
	fmovsle	%icc,	%f2,	%f19
	alignaddr	%o7,	%l1,	%g2
	call	loop_2904
	fbug,a	%fcc0,	loop_2905
	array32	%g4,	%o5,	%o2
	edge8l	%i1,	%g6,	%i3
loop_2904:
	nop
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf8
	membar	#Sync
loop_2905:
	tne	%icc,	0x4
	movre	%g1,	%i5,	%i0
	wr	%g0,	0x23,	%asi
	stba	%l0,	[%l7 + 0x61] %asi
	membar	#Sync
	fxnors	%f4,	%f28,	%f29
	set	0x19, %o2
	lduba	[%l7 + %o2] 0x81,	%l6
	subc	%o4,	%l5,	%o1
	alignaddrl	%o6,	%i4,	%o0
	bn	%icc,	loop_2906
	fcmpeq32	%f22,	%f22,	%i7
	fmovs	%f16,	%f1
	tcc	%icc,	0x1
loop_2906:
	move	%xcc,	%o3,	%i2
	movrne	%l2,	0x138,	%l3
	bpos,a	loop_2907
	xnor	%i6,	0x1375,	%g5
	fnot2s	%f8,	%f28
	taddcc	%l4,	%g3,	%g7
loop_2907:
	fbul	%fcc2,	loop_2908
	addc	%o7,	0x0EC8,	%g2
	fornot1	%f22,	%f20,	%f20
	fxors	%f20,	%f23,	%f10
loop_2908:
	nop
	set	0x44, %l5
	lduwa	[%l7 + %l5] 0x10,	%l1
	ldsh	[%l7 + 0x5E],	%o5
	for	%f18,	%f18,	%f12
	movcc	%xcc,	%o2,	%i1
	umulcc	%g4,	0x1940,	%g6
	fble,a	%fcc2,	loop_2909
	bleu	loop_2910
	udivcc	%i3,	0x1453,	%g1
	call	loop_2911
loop_2909:
	mulscc	%i0,	%l0,	%i5
loop_2910:
	for	%f16,	%f10,	%f26
	sub	%l6,	%l5,	%o1
loop_2911:
	nop
	set	0x2C, %o5
	sta	%f22,	[%l7 + %o5] 0x19
	array32	%o6,	%i4,	%o4
	sra	%o0,	0x19,	%i7
	alignaddr	%o3,	%i2,	%l2
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf8
	membar	#Sync
	mulscc	%l3,	%i6,	%l4
	fbne,a	%fcc0,	loop_2912
	fmovdcs	%icc,	%f22,	%f30
	umul	%g3,	%g7,	%g5
	movge	%icc,	%g2,	%l1
loop_2912:
	sethi	0x0E7F,	%o7
	ble,a	loop_2913
	fnors	%f25,	%f27,	%f1
	fand	%f24,	%f14,	%f2
	smul	%o5,	0x1E30,	%i1
loop_2913:
	orncc	%o2,	%g4,	%i3
	ldx	[%l7 + 0x20],	%g6
	srlx	%g1,	%i0,	%l0
	set	0x20, %o3
	stda	%i4,	[%l7 + %o3] 0x10
	lduh	[%l7 + 0x72],	%l6
	movrlz	%l5,	0x137,	%o1
	movrgz	%o6,	0x2B6,	%o4
	tvs	%xcc,	0x2
	movvs	%xcc,	%i4,	%o0
	array32	%o3,	%i7,	%i2
	tne	%icc,	0x6
	set	0x28, %l4
	stxa	%l3,	[%l7 + %l4] 0x2b
	membar	#Sync
	popc	0x06EE,	%i6
	xorcc	%l2,	%l4,	%g7
	movneg	%icc,	%g3,	%g2
	fmul8ulx16	%f28,	%f12,	%f18
	subc	%g5,	%l1,	%o7
	bcs	%xcc,	loop_2914
	movneg	%icc,	%o5,	%i1
	tpos	%icc,	0x6
	bne,a,pn	%icc,	loop_2915
loop_2914:
	sll	%o2,	0x0B,	%i3
	sethi	0x0FF3,	%g6
	movre	%g4,	0x306,	%i0
loop_2915:
	sdiv	%l0,	0x10FF,	%i5
	ldsh	[%l7 + 0x40],	%g1
	xor	%l5,	0x13C9,	%l6
	movcc	%xcc,	%o1,	%o6
	movpos	%icc,	%i4,	%o4
	bpos,a	loop_2916
	fcmpne32	%f20,	%f24,	%o0
	fbul	%fcc1,	loop_2917
	tge	%icc,	0x2
loop_2916:
	edge16l	%o3,	%i2,	%i7
	fornot1s	%f9,	%f15,	%f0
loop_2917:
	sub	%i6,	0x009D,	%l2
	fnegs	%f16,	%f7
	mulx	%l4,	%g7,	%l3
	fcmple16	%f6,	%f8,	%g2
	mulx	%g3,	%l1,	%o7
	sub	%o5,	%g5,	%o2
	tsubcc	%i3,	%i1,	%g6
	fcmpd	%fcc3,	%f2,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i0,	%g4
	fbn	%fcc3,	loop_2918
	fandnot2s	%f13,	%f7,	%f20
	flush	%l7 + 0x60
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2918:
	tvs	%icc,	0x3
	udiv	%l0,	0x0123,	%i5
	edge8l	%l5,	%g1,	%o1
	tvc	%xcc,	0x1
	popc	%o6,	%l6
	lduh	[%l7 + 0x74],	%i4
	xnorcc	%o4,	%o0,	%o3
	andn	%i7,	%i2,	%i6
	alignaddr	%l4,	%l2,	%l3
	fpsub16	%f16,	%f24,	%f14
	movge	%xcc,	%g7,	%g2
	smul	%g3,	%o7,	%o5
	subccc	%g5,	0x0DA9,	%o2
	edge32ln	%i3,	%i1,	%g6
	fmovrsne	%i0,	%f11,	%f20
	call	loop_2919
	movne	%icc,	%g4,	%l1
	ldstub	[%l7 + 0x41],	%i5
	array8	%l5,	%l0,	%g1
loop_2919:
	sdiv	%o6,	0x0F1B,	%o1
	fmovrse	%i4,	%f19,	%f24
	fcmpeq32	%f6,	%f30,	%o4
	bcs	%icc,	loop_2920
	movcc	%icc,	%l6,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_2921, %l0, %l1
	jmpl %l1, %o0
loop_2920:
	fbg,a	%fcc0,	loop_2922
	ldsb	[%l7 + 0x6C],	%i2
	movg	%xcc,	%i6,	%l4
loop_2921:
	edge16n	%i7,	%l2,	%l3
loop_2922:
	subcc	%g2,	0x1FF8,	%g3
	andn	%o7,	%o5,	%g5
	taddcctv	%g7,	%o2,	%i3
	fnegs	%f14,	%f16
	fmovrdgez	%i1,	%f18,	%f30
	sll	%i0,	0x06,	%g6
	movle	%icc,	%l1,	%i5
	smulcc	%l5,	0x155E,	%l0
	fba	%fcc3,	loop_2923
	movg	%icc,	%g1,	%g4
	fabss	%f28,	%f27
	movge	%xcc,	%o6,	%i4
loop_2923:
	movl	%icc,	%o4,	%o1
	fmovde	%icc,	%f15,	%f31
	tge	%icc,	0x5
	edge8ln	%o3,	%o0,	%i2
	sdiv	%i6,	0x0431,	%l6
	sdiv	%l4,	0x17E1,	%i7
	lduh	[%l7 + 0x0C],	%l3
	xor	%l2,	0x101E,	%g2
	mova	%icc,	%o7,	%g3
	sdivcc	%g5,	0x150A,	%o5
	alignaddr	%o2,	%g7,	%i3
	fble	%fcc2,	loop_2924
	st	%f19,	[%l7 + 0x40]
	fmovdgu	%icc,	%f25,	%f18
	movcs	%icc,	%i1,	%i0
loop_2924:
	andncc	%l1,	%i5,	%g6
	tle	%xcc,	0x7
	tne	%xcc,	0x0
	be,a,pt	%icc,	loop_2925
	add	%l5,	0x1BDF,	%l0
	fmovrsgez	%g1,	%f25,	%f25
	taddcc	%o6,	0x1037,	%g4
loop_2925:
	move	%xcc,	%o4,	%o1
	fxors	%f28,	%f10,	%f2
	tleu	%icc,	0x5
	fmovsvs	%icc,	%f14,	%f22
	add	%i4,	0x0219,	%o0
	fxnor	%f24,	%f14,	%f20
	orcc	%o3,	%i6,	%l6
	fmovsvs	%icc,	%f24,	%f19
	flush	%l7 + 0x48
	wr	%g0,	0x2a,	%asi
	stda	%l4,	[%l7 + 0x48] %asi
	membar	#Sync
	movcs	%icc,	%i2,	%l3
	tsubcctv	%l2,	0x040A,	%g2
	bleu,pn	%icc,	loop_2926
	ldstub	[%l7 + 0x59],	%o7
	srl	%i7,	0x13,	%g5
	srlx	%o5,	0x03,	%o2
loop_2926:
	xorcc	%g7,	0x1B85,	%g3
	stw	%i3,	[%l7 + 0x38]
	fmovsge	%icc,	%f8,	%f8
	fzeros	%f23
	tvc	%icc,	0x6
	fandnot1s	%f16,	%f27,	%f4
	umul	%i1,	%i0,	%l1
	edge8ln	%g6,	%l5,	%l0
	sethi	0x00A5,	%i5
	fcmpes	%fcc2,	%f4,	%f27
	add	%g1,	0x034D,	%o6
	movvc	%xcc,	%g4,	%o1
	membar	0x5F
	fnot1	%f26,	%f16
	fmovrslz	%o4,	%f13,	%f25
	andn	%i4,	%o0,	%i6
	movn	%icc,	%l6,	%o3
	movpos	%icc,	%i2,	%l4
	edge32n	%l2,	%l3,	%g2
	fbu	%fcc1,	loop_2927
	tpos	%icc,	0x1
	fmovsvc	%icc,	%f1,	%f9
	smulcc	%o7,	0x13A4,	%g5
loop_2927:
	fpack32	%f26,	%f12,	%f18
	set	0x70, %o6
	prefetcha	[%l7 + %o6] 0x14,	 0x0
	andncc	%o2,	%o5,	%g7
	tsubcc	%i3,	0x0536,	%g3
	edge32n	%i1,	%i0,	%l1
	andncc	%l5,	%l0,	%i5
	ld	[%l7 + 0x64],	%f9
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf9,	%f16
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x78] %asi,	%g1
	xnor	%g6,	0x1425,	%g4
	bvc	%icc,	loop_2928
	fmovrde	%o6,	%f6,	%f18
	tge	%icc,	0x6
	edge32n	%o1,	%o4,	%o0
loop_2928:
	movrlez	%i4,	%i6,	%l6
	movcs	%icc,	%i2,	%l4
	fmovrsgez	%l2,	%f13,	%f26
	xorcc	%l3,	%o3,	%o7
	movpos	%xcc,	%g5,	%i7
	ldx	[%l7 + 0x18],	%g2
	movrgz	%o2,	0x159,	%o5
	andn	%g7,	0x1740,	%i3
	bl	%icc,	loop_2929
	tpos	%icc,	0x1
	alignaddr	%g3,	%i1,	%l1
	fbug,a	%fcc0,	loop_2930
loop_2929:
	ble,a,pn	%icc,	loop_2931
	subccc	%i0,	0x087E,	%l5
	swap	[%l7 + 0x6C],	%i5
loop_2930:
	movle	%icc,	%g1,	%l0
loop_2931:
	fmovs	%f19,	%f27
	taddcc	%g4,	%g6,	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%o4,	%o0
	movrne	%o1,	0x225,	%i6
	andn	%i4,	%i2,	%l6
	alignaddrl	%l4,	%l3,	%o3
	wr	%g0,	0x0c,	%asi
	stxa	%l2,	[%l7 + 0x58] %asi
	be,a,pt	%xcc,	loop_2932
	fmul8sux16	%f16,	%f26,	%f24
	bleu,a,pn	%xcc,	loop_2933
	andcc	%g5,	0x03D2,	%o7
loop_2932:
	tleu	%xcc,	0x1
	fcmpgt16	%f10,	%f10,	%i7
loop_2933:
	fcmpes	%fcc3,	%f25,	%f20
	subccc	%g2,	0x10A6,	%o5
	taddcctv	%g7,	%i3,	%g3
	fnegs	%f21,	%f3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x54] %asi,	%f12
	fmovdgu	%icc,	%f6,	%f12
	andcc	%i1,	0x05B2,	%l1
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%o2
	tgu	%xcc,	0x5
	orncc	%l5,	0x0186,	%i5
	tvs	%icc,	0x0
	tleu	%xcc,	0x2
	fabss	%f7,	%f8
	andncc	%l0,	%g1,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o6,	%g6
	ldstub	[%l7 + 0x35],	%o0
	tn	%icc,	0x6
	movrlez	%o1,	0x237,	%o4
	sdivx	%i4,	0x0BAD,	%i6
	subcc	%l6,	%l4,	%l3
	sdivx	%o3,	0x02D1,	%l2
	ldstub	[%l7 + 0x0C],	%i2
	ba,a,pt	%icc,	loop_2934
	fsrc1s	%f20,	%f8
	srlx	%o7,	%g5,	%i7
	edge8ln	%g2,	%g7,	%o5
loop_2934:
	movn	%icc,	%i3,	%g3
	movrgez	%i1,	0x220,	%i0
	prefetch	[%l7 + 0x20],	 0x2
	nop
	setx	loop_2935,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%icc,	%o2,	%l1
	tcc	%xcc,	0x4
	fbe,a	%fcc2,	loop_2936
loop_2935:
	sub	%i5,	0x1F18,	%l0
	alignaddr	%l5,	%g4,	%g1
	fpadd32s	%f20,	%f6,	%f20
loop_2936:
	movre	%o6,	%g6,	%o0
	fnands	%f9,	%f19,	%f9
	popc	%o4,	%i4
	tsubcctv	%i6,	%o1,	%l6
	sir	0x165D
	fsrc2	%f12,	%f28
	edge16l	%l3,	%o3,	%l4
	fnot1s	%f21,	%f15
	fmovspos	%xcc,	%f8,	%f24
	fcmple16	%f18,	%f8,	%l2
	umulcc	%i2,	%g5,	%o7
	xorcc	%i7,	%g7,	%o5
	ldx	[%l7 + 0x78],	%g2
	subcc	%g3,	%i3,	%i0
	fexpand	%f5,	%f16
	ldsb	[%l7 + 0x3C],	%i1
	movl	%icc,	%o2,	%l1
	movpos	%xcc,	%i5,	%l0
	fbu	%fcc3,	loop_2937
	fmovdge	%xcc,	%f22,	%f15
	fmovse	%icc,	%f22,	%f1
	movre	%g4,	%g1,	%l5
loop_2937:
	srlx	%g6,	%o6,	%o0
	movrgz	%o4,	0x0C9,	%i6
	ldd	[%l7 + 0x18],	%f14
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x3A] %asi,	%o1
	fcmped	%fcc0,	%f30,	%f6
	prefetch	[%l7 + 0x0C],	 0x1
	prefetch	[%l7 + 0x24],	 0x3
	tpos	%xcc,	0x2
	sll	%i4,	%l3,	%l6
	tgu	%icc,	0x2
	sub	%l4,	%l2,	%i2
	orn	%g5,	%o7,	%o3
	st	%f3,	[%l7 + 0x1C]
	edge8ln	%g7,	%i7,	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g2,	%g3
	bvs,pn	%xcc,	loop_2938
	edge8l	%i3,	%i1,	%i0
	add	%l1,	0x18F6,	%i5
	fbuge	%fcc1,	loop_2939
loop_2938:
	fcmps	%fcc1,	%f8,	%f5
	ldstub	[%l7 + 0x4B],	%o2
	bcs,pt	%icc,	loop_2940
loop_2939:
	ldsw	[%l7 + 0x40],	%l0
	ldstub	[%l7 + 0x1E],	%g4
	popc	%g1,	%l5
loop_2940:
	tsubcc	%o6,	%g6,	%o0
	fcmpgt32	%f18,	%f14,	%i6
	pdist	%f4,	%f4,	%f16
	sir	0x0313
	sll	%o1,	0x1E,	%i4
	movvs	%icc,	%l3,	%l6
	fbl,a	%fcc2,	loop_2941
	ldsw	[%l7 + 0x60],	%o4
	sdivx	%l2,	0x00EB,	%i2
	edge16n	%l4,	%g5,	%o3
loop_2941:
	prefetch	[%l7 + 0x74],	 0x1
	brgz	%g7,	loop_2942
	fsrc2s	%f19,	%f6
	movrgz	%i7,	%o7,	%o5
	edge8l	%g2,	%g3,	%i3
loop_2942:
	add	%i0,	0x1E22,	%i1
	fnand	%f20,	%f14,	%f2
	edge16l	%i5,	%l1,	%o2
	tpos	%icc,	0x3
	sub	%l0,	0x1A18,	%g4
	nop
	set	0x68, %g7
	lduh	[%l7 + %g7],	%g1
	movgu	%xcc,	%o6,	%l5
	movle	%xcc,	%g6,	%i6
	set	0x30, %i4
	sta	%f31,	[%l7 + %i4] 0x15
	movvs	%xcc,	%o1,	%o0
	udivx	%i4,	0x0160,	%l3
	movpos	%icc,	%l6,	%o4
	fmovsvc	%icc,	%f0,	%f10
	fmovdcs	%icc,	%f4,	%f26
	fpsub32	%f30,	%f10,	%f16
	movleu	%icc,	%l2,	%l4
	edge16n	%i2,	%g5,	%g7
	fcmpgt16	%f6,	%f2,	%i7
	lduw	[%l7 + 0x2C],	%o3
	set	0x58, %o7
	stwa	%o5,	[%l7 + %o7] 0x88
	movrgez	%g2,	%o7,	%i3
	fmovrde	%g3,	%f12,	%f22
	bshuffle	%f20,	%f18,	%f10
	movne	%xcc,	%i0,	%i5
	brgz	%i1,	loop_2943
	edge16ln	%o2,	%l0,	%g4
	movvc	%xcc,	%l1,	%g1
	movgu	%xcc,	%o6,	%l5
loop_2943:
	fornot2	%f10,	%f6,	%f2
	bvs	loop_2944
	fmovdl	%icc,	%f26,	%f28
	tcs	%icc,	0x6
	movvc	%icc,	%g6,	%o1
loop_2944:
	taddcctv	%o0,	0x0595,	%i4
	fmovse	%xcc,	%f31,	%f28
	popc	%i6,	%l6
	tg	%xcc,	0x2
	sdiv	%l3,	0x0ACA,	%o4
	fmovda	%icc,	%f17,	%f25
	popc	%l2,	%l4
	sethi	0x0F0B,	%g5
	set	0x60, %o1
	stxa	%i2,	[%l7 + %o1] 0x81
	srl	%g7,	%i7,	%o3
	edge16n	%g2,	%o7,	%i3
	movre	%g3,	%i0,	%o5
	edge32l	%i5,	%o2,	%l0
	tsubcctv	%g4,	%i1,	%g1
	std	%o6,	[%l7 + 0x58]
	tl	%xcc,	0x2
	and	%l1,	0x0FA7,	%g6
	sdivx	%o1,	0x0CF1,	%l5
	udivx	%o0,	0x030A,	%i6
	sir	0x06AF
	tvs	%xcc,	0x2
	umul	%i4,	0x041B,	%l6
	fbuge,a	%fcc1,	loop_2945
	movleu	%icc,	%o4,	%l3
	orcc	%l2,	%l4,	%i2
	fbg,a	%fcc2,	loop_2946
loop_2945:
	fcmpeq16	%f24,	%f2,	%g7
	array32	%i7,	%g5,	%o3
	sdiv	%g2,	0x07B7,	%i3
loop_2946:
	fmovdcs	%icc,	%f7,	%f0
	std	%f14,	[%l7 + 0x18]
	stx	%o7,	[%l7 + 0x78]
	popc	0x1602,	%g3
	bneg	loop_2947
	tgu	%xcc,	0x3
	fpack16	%f4,	%f6
	movg	%icc,	%i0,	%o5
loop_2947:
	movne	%icc,	%o2,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l0,	0x0EB8,	%g4
	bn,a	loop_2948
	alignaddrl	%g1,	%o6,	%l1
	array32	%g6,	%o1,	%i1
	fandnot1	%f18,	%f10,	%f2
loop_2948:
	fmovdneg	%xcc,	%f10,	%f23
	srl	%l5,	0x09,	%o0
	movvs	%xcc,	%i6,	%i4
	movre	%o4,	%l6,	%l3
	fnot2	%f6,	%f8
	edge8n	%l4,	%l2,	%g7
	smulcc	%i7,	0x0655,	%g5
	sub	%o3,	0x0F18,	%g2
	subccc	%i2,	%i3,	%o7
	stx	%g3,	[%l7 + 0x30]
	tge	%xcc,	0x3
	edge8l	%i0,	%o2,	%i5
	fmovda	%xcc,	%f9,	%f20
	edge16l	%o5,	%g4,	%l0
	xnorcc	%g1,	0x1015,	%l1
	tcs	%xcc,	0x0
	movpos	%xcc,	%o6,	%o1
	set	0x54, %l6
	ldstuba	[%l7 + %l6] 0x0c,	%i1
	edge8n	%l5,	%o0,	%i6
	bl,a	%xcc,	loop_2949
	edge8l	%i4,	%o4,	%g6
	edge16	%l3,	%l6,	%l4
	tgu	%xcc,	0x1
loop_2949:
	xor	%g7,	0x10E3,	%l2
	movre	%g5,	%o3,	%i7
	bcc	loop_2950
	fbule,a	%fcc0,	loop_2951
	fmovsg	%icc,	%f27,	%f24
	fmovd	%f24,	%f30
loop_2950:
	faligndata	%f26,	%f20,	%f0
loop_2951:
	addcc	%i2,	0x0B64,	%i3
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	stx	%g2,	[%l7 + 0x68]
	sub	%g3,	0x1285,	%o2
	fmul8x16al	%f29,	%f25,	%f18
	set	0x6B, %g4
	ldstuba	[%l7 + %g4] 0x11,	%i0
	fmovspos	%xcc,	%f5,	%f11
	xnor	%i5,	0x02E1,	%o5
	for	%f16,	%f24,	%f12
	subccc	%l0,	0x174C,	%g1
	tg	%icc,	0x0
	fone	%f10
	sub	%l1,	0x12D1,	%o6
	mova	%icc,	%o1,	%i1
	fmovsvs	%icc,	%f1,	%f27
	taddcc	%l5,	0x1563,	%g4
	tvs	%xcc,	0x6
	movgu	%icc,	%i6,	%o0
	membar	0x4D
	xnorcc	%i4,	%o4,	%l3
	set	0x40, %i6
	lduwa	[%l7 + %i6] 0x89,	%l6
	mova	%xcc,	%l4,	%g6
	edge32	%g7,	%l2,	%o3
	movn	%icc,	%g5,	%i7
	andncc	%i2,	%i3,	%o7
	sub	%g3,	%o2,	%g2
	fmul8ulx16	%f10,	%f2,	%f24
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x89
	edge16ln	%i0,	%i5,	%o5
	fbn	%fcc3,	loop_2952
	fpack16	%f6,	%f14
	tne	%xcc,	0x1
	fmovrslez	%l0,	%f23,	%f1
loop_2952:
	fsrc2	%f4,	%f20
	movl	%icc,	%g1,	%l1
	nop
	setx loop_2953, %l0, %l1
	jmpl %l1, %o6
	ta	%xcc,	0x0
	fmovrse	%o1,	%f13,	%f16
	ba,pt	%xcc,	loop_2954
loop_2953:
	brgz,a	%l5,	loop_2955
	mulscc	%g4,	%i6,	%i1
	fxor	%f16,	%f26,	%f12
loop_2954:
	tsubcc	%o0,	0x199B,	%i4
loop_2955:
	bvc,a,pt	%icc,	loop_2956
	smul	%l3,	0x05EB,	%l6
	alignaddr	%o4,	%l4,	%g6
	std	%l2,	[%l7 + 0x20]
loop_2956:
	std	%g6,	[%l7 + 0x10]
	fsrc1s	%f6,	%f18
	fands	%f0,	%f1,	%f28
	mulscc	%o3,	0x0212,	%g5
	brlz	%i7,	loop_2957
	movrne	%i2,	0x3A6,	%o7
	umulcc	%i3,	0x1871,	%g3
	ldstub	[%l7 + 0x23],	%o2
loop_2957:
	edge8n	%i0,	%g2,	%i5
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x19,	%l0
	fmuld8sux16	%f5,	%f15,	%f26
	addc	%o5,	0x18F1,	%g1
	movneg	%icc,	%o6,	%o1
	movl	%icc,	%l1,	%l5
	andcc	%g4,	0x0F8C,	%i1
	fnand	%f22,	%f20,	%f24
	fbul,a	%fcc0,	loop_2958
	fsrc2	%f2,	%f28
	movne	%icc,	%i6,	%i4
	movrgz	%l3,	0x299,	%l6
loop_2958:
	stbar
	fmovrdne	%o0,	%f22,	%f4
	xorcc	%o4,	0x1F7F,	%g6
	fmovsle	%icc,	%f2,	%f7
	srlx	%l2,	0x12,	%g7
	fbe	%fcc2,	loop_2959
	fbue,a	%fcc0,	loop_2960
	movne	%icc,	%l4,	%g5
	brlez	%i7,	loop_2961
loop_2959:
	fmovdleu	%xcc,	%f14,	%f3
loop_2960:
	nop
	set	0x50, %g3
	stha	%o3,	[%l7 + %g3] 0x18
loop_2961:
	sllx	%i2,	%i3,	%g3
	fcmple16	%f10,	%f30,	%o7
	set	0x19, %g1
	lduba	[%l7 + %g1] 0x14,	%i0
	addccc	%g2,	0x1343,	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%o2
	fornot2	%f20,	%f22,	%f24
	sth	%g1,	[%l7 + 0x3E]
	fmovdgu	%xcc,	%f0,	%f11
	ta	%xcc,	0x2
	fbuge,a	%fcc0,	loop_2962
	movg	%xcc,	%o6,	%o1
	bvs	loop_2963
	mulx	%l1,	%l5,	%o5
loop_2962:
	orcc	%g4,	%i1,	%i6
	sub	%i4,	0x00FF,	%l3
loop_2963:
	tcs	%icc,	0x2
	umul	%l6,	0x1A2B,	%o0
	movrlz	%o4,	%l2,	%g6
	ld	[%l7 + 0x58],	%f22
	movne	%icc,	%l4,	%g5
	edge32l	%i7,	%o3,	%g7
	fexpand	%f18,	%f22
	movleu	%xcc,	%i3,	%i2
	bneg	%icc,	loop_2964
	edge8ln	%g3,	%i0,	%g2
	taddcctv	%o7,	%l0,	%i5
	sll	%o2,	0x0B,	%g1
loop_2964:
	and	%o1,	%l1,	%o6
	addccc	%l5,	%o5,	%i1
	movrgz	%g4,	%i6,	%l3
	brnz	%i4,	loop_2965
	move	%icc,	%l6,	%o4
	fble,a	%fcc1,	loop_2966
	fblg	%fcc0,	loop_2967
loop_2965:
	fbge	%fcc3,	loop_2968
	bn,pn	%xcc,	loop_2969
loop_2966:
	brlez,a	%o0,	loop_2970
loop_2967:
	fmovs	%f17,	%f6
loop_2968:
	fbge	%fcc2,	loop_2971
loop_2969:
	srl	%g6,	0x01,	%l4
loop_2970:
	sdivcc	%l2,	0x00BD,	%i7
	edge32	%o3,	%g5,	%i3
loop_2971:
	tneg	%icc,	0x0
	fmovrdgez	%i2,	%f2,	%f6
	movg	%xcc,	%g7,	%g3
	movrgez	%i0,	%o7,	%l0
	array32	%i5,	%o2,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f28,	%f6,	%g1
	fandnot2	%f0,	%f12,	%f12
	swap	[%l7 + 0x64],	%l1
	tn	%icc,	0x1
	subc	%o6,	0x096C,	%o1
	ldsb	[%l7 + 0x3D],	%l5
	umulcc	%i1,	0x1239,	%o5
	brlez	%i6,	loop_2972
	taddcc	%g4,	0x1CFB,	%i4
	smulcc	%l3,	0x1ED6,	%o4
	stx	%l6,	[%l7 + 0x58]
loop_2972:
	fmovdneg	%xcc,	%f8,	%f7
	tge	%xcc,	0x2
	fcmpgt32	%f2,	%f10,	%o0
	set	0x20, %l2
	ldsha	[%l7 + %l2] 0x14,	%g6
	alignaddrl	%l4,	%i7,	%l2
	edge16	%g5,	%o3,	%i3
	fmovrdlez	%g7,	%f22,	%f22
	nop
	set	0x10, %o0
	prefetch	[%l7 + %o0],	 0x1
	bne,a	%icc,	loop_2973
	andncc	%i2,	%i0,	%o7
	std	%g2,	[%l7 + 0x08]
	movleu	%icc,	%i5,	%l0
loop_2973:
	movrlz	%o2,	0x0BC,	%g1
	tl	%xcc,	0x2
	orn	%g2,	0x1DDA,	%o6
	set	0x28, %g6
	ldsha	[%l7 + %g6] 0x18,	%o1
	and	%l1,	%l5,	%i1
	taddcctv	%o5,	%i6,	%g4
	fble	%fcc2,	loop_2974
	edge16n	%i4,	%l3,	%o4
	or	%l6,	%g6,	%l4
	addcc	%o0,	%l2,	%i7
loop_2974:
	umulcc	%g5,	%o3,	%g7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x2b,	%asi
	stxa	%i2,	[%l7 + 0x78] %asi
	membar	#Sync
	sdivcc	%i3,	0x0D97,	%i0
	andn	%g3,	%i5,	%o7
	fmovsge	%xcc,	%f22,	%f19
	bg	%xcc,	loop_2975
	fmovsvc	%xcc,	%f23,	%f28
	fmul8x16	%f16,	%f24,	%f20
	xorcc	%l0,	%g1,	%o2
loop_2975:
	fornot1s	%f13,	%f10,	%f15
	fones	%f31
	tle	%icc,	0x0
	fmovdcc	%icc,	%f23,	%f7
	movcc	%icc,	%o6,	%g2
	fmul8x16au	%f14,	%f17,	%f22
	fmovrse	%o1,	%f3,	%f19
	addccc	%l1,	%i1,	%o5
	set	0x24, %i5
	sta	%f26,	[%l7 + %i5] 0x0c
	movrgez	%l5,	%g4,	%i4
	fmul8x16	%f18,	%f6,	%f24
	orn	%i6,	0x083E,	%l3
	fandnot2	%f0,	%f10,	%f14
	movneg	%icc,	%o4,	%g6
	movleu	%icc,	%l4,	%o0
	fbn,a	%fcc1,	loop_2976
	tl	%icc,	0x6
	popc	%l6,	%i7
	nop
	set	0x78, %l0
	std	%f0,	[%l7 + %l0]
loop_2976:
	fmovsge	%xcc,	%f1,	%f31
	tleu	%xcc,	0x1
	taddcc	%l2,	0x0D8E,	%g5
	set	0x5C, %g5
	stwa	%o3,	[%l7 + %g5] 0x11
	fcmpne32	%f10,	%f14,	%g7
	nop
	setx loop_2977, %l0, %l1
	jmpl %l1, %i2
	movrne	%i0,	0x3EB,	%g3
	array8	%i5,	%o7,	%i3
	popc	0x1F54,	%g1
loop_2977:
	fbuge	%fcc1,	loop_2978
	movvc	%icc,	%o2,	%l0
	ldstub	[%l7 + 0x58],	%o6
	smul	%o1,	0x1392,	%l1
loop_2978:
	and	%g2,	0x153A,	%i1
	edge8ln	%l5,	%o5,	%g4
	taddcc	%i6,	0x011A,	%i4
	subccc	%o4,	0x1E70,	%l3
	movne	%xcc,	%l4,	%o0
	fbug	%fcc2,	loop_2979
	subcc	%g6,	0x1BCE,	%l6
	sethi	0x0E1D,	%i7
	fandnot2s	%f24,	%f0,	%f18
loop_2979:
	orcc	%l2,	%o3,	%g7
	fmovs	%f4,	%f8
	fnot2	%f24,	%f0
	fandnot2s	%f23,	%f15,	%f22
	movgu	%icc,	%i2,	%g5
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x32] %asi,	%g3
	fbe,a	%fcc2,	loop_2980
	edge8n	%i0,	%i5,	%o7
	tneg	%xcc,	0x2
	ldub	[%l7 + 0x2F],	%g1
loop_2980:
	fmovde	%xcc,	%f22,	%f10
	fbo	%fcc2,	loop_2981
	tsubcc	%i3,	%l0,	%o2
	bshuffle	%f18,	%f16,	%f30
	lduh	[%l7 + 0x3E],	%o1
loop_2981:
	sll	%l1,	%o6,	%g2
	brlez,a	%i1,	loop_2982
	sdivx	%l5,	0x1A9D,	%g4
	sdivcc	%o5,	0x1F1D,	%i6
	fmovsa	%xcc,	%f6,	%f6
loop_2982:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f30,	%f0,	%f6
	edge16	%i4,	%l3,	%l4
	wr	%g0,	0x0c,	%asi
	stha	%o4,	[%l7 + 0x60] %asi
	fcmpeq16	%f18,	%f24,	%g6
	edge16l	%l6,	%o0,	%i7
	nop
	set	0x08, %g2
	ldstub	[%l7 + %g2],	%l2
	fmovdcc	%icc,	%f1,	%f13
	fcmped	%fcc1,	%f0,	%f8
	subcc	%o3,	%g7,	%g5
	fmovde	%icc,	%f13,	%f25
	edge32l	%g3,	%i0,	%i2
	umul	%i5,	0x1A52,	%g1
	tvs	%xcc,	0x3
	andcc	%i3,	0x0C2E,	%o7
	lduh	[%l7 + 0x72],	%o2
	fmovd	%f6,	%f4
	umulcc	%l0,	0x11A5,	%o1
	srax	%l1,	%g2,	%i1
	edge16l	%o6,	%g4,	%l5
	set	0x3C, %i0
	lduha	[%l7 + %i0] 0x89,	%i6
	fcmple32	%f0,	%f26,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc2,	loop_2983
	tleu	%xcc,	0x6
	fmovdg	%icc,	%f22,	%f31
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x26,	%i4
loop_2983:
	tvs	%xcc,	0x3
	st	%f19,	[%l7 + 0x24]
	srax	%l4,	0x1E,	%o4
	movg	%icc,	%l3,	%l6
	orncc	%o0,	%i7,	%l2
	movle	%icc,	%o3,	%g7
	xorcc	%g6,	%g5,	%i0
	movg	%xcc,	%i2,	%i5
	ta	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g3,	0x1C6D,	%i3
	edge16	%g1,	%o7,	%l0
	orn	%o2,	0x00AF,	%o1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x70] %asi,	%g2
	sethi	0x09B6,	%i1
	andncc	%o6,	%g4,	%l5
	fsrc1	%f16,	%f8
	edge8	%i6,	%o5,	%i4
	fmovsl	%xcc,	%f1,	%f11
	fcmple32	%f8,	%f28,	%l4
	fmovrdne	%l1,	%f8,	%f8
	fmovsa	%icc,	%f0,	%f0
	tpos	%xcc,	0x1
	wr	%g0,	0x2f,	%asi
	stwa	%o4,	[%l7 + 0x2C] %asi
	membar	#Sync
	sdivx	%l3,	0x1250,	%l6
	ba,a,pn	%icc,	loop_2984
	fbe,a	%fcc0,	loop_2985
	edge8ln	%o0,	%l2,	%i7
	taddcctv	%o3,	0x05C6,	%g6
loop_2984:
	te	%icc,	0x2
loop_2985:
	tvc	%xcc,	0x2
	andcc	%g7,	0x1403,	%i0
	fpack32	%f24,	%f4,	%f24
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movle	%xcc,	%g5,	%i5
	fble,a	%fcc2,	loop_2986
	edge16	%i2,	%i3,	%g3
	srax	%g1,	%o7,	%o2
	orncc	%l0,	0x02DA,	%o1
loop_2986:
	subccc	%g2,	0x0540,	%o6
	srl	%i1,	0x1D,	%l5
	tleu	%icc,	0x6
	movrgez	%g4,	0x333,	%o5
	movg	%icc,	%i6,	%i4
	ldub	[%l7 + 0x2A],	%l1
	siam	0x7
	array32	%l4,	%l3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o0,	0x1864,	%o4
	tge	%xcc,	0x0
	tgu	%xcc,	0x7
	orncc	%l2,	0x071D,	%i7
	bneg,pn	%xcc,	loop_2987
	fornot2s	%f26,	%f13,	%f26
	bvs	%xcc,	loop_2988
	sdivcc	%g6,	0x1101,	%g7
loop_2987:
	addcc	%i0,	%g5,	%o3
	udivx	%i2,	0x0A18,	%i3
loop_2988:
	ta	%xcc,	0x4
	movcc	%icc,	%g3,	%i5
	tcs	%xcc,	0x7
	fcmple16	%f18,	%f28,	%g1
	srlx	%o2,	%o7,	%o1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x50] %asi,	%f15
	fpsub32	%f14,	%f26,	%f30
	nop
	setx	loop_2989,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%l0,	%g2,	%o6
	andcc	%l5,	0x0EB3,	%i1
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x30] %asi,	%o4
loop_2989:
	movvs	%xcc,	%g4,	%i6
	subcc	%l1,	0x192E,	%l4
	tleu	%xcc,	0x2
	ldd	[%l7 + 0x68],	%f16
	addc	%i4,	%l6,	%o0
	sir	0x1589
	movrgez	%o4,	0x1F6,	%l2
	movne	%xcc,	%l3,	%i7
	movre	%g7,	%i0,	%g6
	alignaddrl	%g5,	%o3,	%i3
	sll	%g3,	%i2,	%i5
	set	0x2C, %i3
	lduwa	[%l7 + %i3] 0x14,	%o2
	tgu	%xcc,	0x3
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x1f,	%f0
	movg	%xcc,	%o7,	%o1
	movcc	%icc,	%g1,	%l0
	sdivcc	%o6,	0x1E99,	%l5
	fcmple32	%f26,	%f24,	%i1
	fcmpes	%fcc0,	%f25,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x5
	set	0x68, %l5
	ldswa	[%l7 + %l5] 0x10,	%o5
	movn	%xcc,	%g4,	%g2
	fnor	%f28,	%f0,	%f8
	fmul8sux16	%f20,	%f26,	%f30
	fandnot2	%f12,	%f26,	%f12
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2857
!	Type x   	: 1310
!	Type cti   	: 2989
!	Type f   	: 4491
!	Type i   	: 13353
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x73DAD596
.word 0xA04CE104
.word 0x6405E0B0
.word 0x6157020C
.word 0x864EBC72
.word 0x81E9ACC4
.word 0xC9021A9B
.word 0x6F1DA958
.word 0xF929D901
.word 0x6A2DAA43
.word 0x3997B353
.word 0x53BB7EB4
.word 0x21A13863
.word 0x97F9329D
.word 0x840D0FF5
.word 0x94538185
.word 0xC4BBA365
.word 0x1077EB90
.word 0x2E820AA7
.word 0x46A8B514
.word 0xEC70D4DD
.word 0x335864DF
.word 0x452CE9FD
.word 0xE1560EC0
.word 0x497DE442
.word 0x1957BE8D
.word 0x4305D676
.word 0x464C23D4
.word 0x8853E6B6
.word 0x9CD3BFBD
.word 0x719E552B
.word 0x5E8AA313
.word 0xE795FC5B
.word 0x7576E420
.word 0xB81AF83D
.word 0xF76DF2A6
.word 0x80A4D149
.word 0xA2E0D1A6
.word 0x33839047
.word 0xC917C0CF
.word 0xC6EA14B2
.word 0x0EAA3636
.word 0x18565D0E
.word 0xADE115C2
.word 0xDB7FF316
.word 0x71574CA1
.word 0xC05F4A4F
.word 0xD9191C16
.word 0x2009759B
.word 0x06D2FFF9
.word 0x9CEF8442
.word 0xEBB7F36A
.word 0x807A5CDB
.word 0xF32BD267
.word 0x3ED49311
.word 0xF43481DD
.word 0xDEB70F20
.word 0x9F29078D
.word 0x2ED6BA1F
.word 0xF0556062
.word 0xE88542DB
.word 0x1A68095F
.word 0xD5D831E0
.word 0x36DE22CE
.end
