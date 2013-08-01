/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f12.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f12.s,v 1.1 2007/05/11 17:22:26 drp Exp $"
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
	setx	0x802C35F5E07F40E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xD,	%g1
	set	0x7,	%g2
	set	0xC,	%g3
	set	0xE,	%g4
	set	0x3,	%g5
	set	0x4,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0xA,	%i1
	set	-0x0,	%i2
	set	-0xD,	%i3
	set	-0x6,	%i4
	set	-0xA,	%i5
	set	-0xB,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x28F69B9D,	%l0
	set	0x7065A8A4,	%l1
	set	0x3903D307,	%l2
	set	0x61398E82,	%l3
	set	0x406B1668,	%l4
	set	0x73645B6F,	%l5
	set	0x705AEA5E,	%l6
	!# Output registers
	set	0x1A46,	%o0
	set	0x024F,	%o1
	set	0x000B,	%o2
	set	0x0DA1,	%o3
	set	0x1D81,	%o4
	set	0x1524,	%o5
	set	-0x0C47,	%o6
	set	0x1785,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x3903B6E0402D2305)
	INIT_TH_FP_REG(%l7,%f2,0xDF6465368420CCC7)
	INIT_TH_FP_REG(%l7,%f4,0x4D25B40AA12131A7)
	INIT_TH_FP_REG(%l7,%f6,0x18C6E8AA1FE98745)
	INIT_TH_FP_REG(%l7,%f8,0xAE5AA2947EAAD3C3)
	INIT_TH_FP_REG(%l7,%f10,0x52CDDA0B502961AD)
	INIT_TH_FP_REG(%l7,%f12,0x897E35BCFDEF1852)
	INIT_TH_FP_REG(%l7,%f14,0xF28250BB44AF9473)
	INIT_TH_FP_REG(%l7,%f16,0x24B025C5D1A81DC1)
	INIT_TH_FP_REG(%l7,%f18,0x636DC4E110542118)
	INIT_TH_FP_REG(%l7,%f20,0xDCCD0E6C090A62A9)
	INIT_TH_FP_REG(%l7,%f22,0x562B7FBA12297249)
	INIT_TH_FP_REG(%l7,%f24,0xAE9A08DB783D4D4F)
	INIT_TH_FP_REG(%l7,%f26,0x2FF31C7BA4A376A0)
	INIT_TH_FP_REG(%l7,%f28,0x4116EB3A83718CBA)
	INIT_TH_FP_REG(%l7,%f30,0x09AD3DF95C3CC3E0)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x708, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	addcc	%i3,	0x0454,	%o7
	fxor	%f24,	%f12,	%f20
	orncc	%o2,	%g1,	%l1
	bleu,a	loop_1
	nop
	setx	0x4D3D3F5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x158F2654,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f5,	%f31
	tsubcc	%l6,	0x0B66,	%o4
	fmul8x16au	%f13,	%f8,	%f28
loop_1:
	nop
	fitos	%f14,	%f4
	fstox	%f4,	%f10
	umul	%l0,	0x0D4D,	%l2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o6
	nop
	fitos	%f1,	%f7
	fstox	%f7,	%f8
	fxtos	%f8,	%f9
	edge16ln	%o0,	%i2,	%i1
	fbg	%fcc0,	loop_2
	addccc	%g7,	%i6,	%i7
	tvc	%xcc,	0x1
	edge32n	%g6,	%o1,	%g5
loop_2:
	nop
	setx	0x759339333D5E2DFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f30
	fxnors	%f7,	%f30,	%f10
	umulcc	%l3,	0x012F,	%o5
	ld	[%l7 + 0x48],	%f17
	tl	%icc,	0x5
	addc	%o3,	0x05CB,	%g2
	stx	%g3,	[%l7 + 0x58]
	xor	%i0,	0x16E0,	%i4
	te	%xcc,	0x7
	ta	%xcc,	0x5
	fbo,a	%fcc2,	loop_3
	fabss	%f5,	%f17
	fnot2s	%f28,	%f20
	fbn	%fcc1,	loop_4
loop_3:
	sethi	0x094C,	%l5
	edge16n	%l4,	%g4,	%i5
	set	0x00, %g3
	ldxa	[%g0 + %g3] 0x50,	%o7
loop_4:
	fmovdvs	%xcc,	%f28,	%f8
	edge16n	%o2,	%g1,	%i3
	sdivx	%l6,	0x127B,	%o4
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x18,	%l1
	movgu	%icc,	%l0,	%o6
	tleu	%xcc,	0x4
	brz,a	%l2,	loop_5
	sll	%o0,	%i1,	%i2
	movg	%icc,	%i6,	%i7
	tleu	%icc,	0x7
loop_5:
	sir	0x0751
	ta	%icc,	0x3
	movne	%xcc,	%g6,	%g7
	lduw	[%l7 + 0x30],	%g5
	array8	%o1,	%l3,	%o3
	tsubcctv	%o5,	%g3,	%i0
	edge16l	%g2,	%i4,	%l4
	set	0x74, %o3
	ldswa	[%l7 + %o3] 0x14,	%l5
	subccc	%i5,	%o7,	%g4
	fsrc1s	%f18,	%f30
	bvs,pt	%xcc,	loop_6
	movrgez	%o2,	0x3D6,	%g1
	orcc	%i3,	%o4,	%l6
	xor	%l1,	%o6,	%l0
loop_6:
	umulcc	%o0,	0x14EC,	%i1
	fmovdpos	%icc,	%f23,	%f22
	fblg	%fcc3,	loop_7
	edge16l	%l2,	%i6,	%i7
	xor	%i2,	%g6,	%g7
	call	loop_8
loop_7:
	mova	%xcc,	%g5,	%o1
	tgu	%icc,	0x2
	nop
	fitos	%f11,	%f23
	fstox	%f23,	%f30
	fxtos	%f30,	%f26
loop_8:
	fpackfix	%f24,	%f31
	bleu,a	loop_9
	sll	%o3,	0x09,	%o5
	nop
	setx	0x6F1093BCE06E1D3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	bvs	loop_10
loop_9:
	edge8n	%l3,	%i0,	%g3
	bgu,a	%xcc,	loop_11
	lduw	[%l7 + 0x3C],	%i4
loop_10:
	umulcc	%g2,	%l5,	%l4
	tl	%icc,	0x2
loop_11:
	tl	%icc,	0x6
	fzero	%f28
	xorcc	%o7,	%g4,	%i5
	umulcc	%o2,	0x0D59,	%g1
	fmul8x16au	%f16,	%f17,	%f22
	bpos,a,pn	%xcc,	loop_12
	tl	%xcc,	0x3
	fmovrsgez	%o4,	%f27,	%f7
	subccc	%l6,	%l1,	%i3
loop_12:
	edge16n	%o6,	%o0,	%i1
	fornot1	%f6,	%f0,	%f12
	movne	%icc,	%l0,	%i6
	bl	loop_13
	nop
	setx	0xBC0FEB84,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x34C07F0C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f3,	%f4
	tne	%icc,	0x6
	fcmple16	%f4,	%f14,	%i7
loop_13:
	movle	%icc,	%i2,	%g6
	bshuffle	%f8,	%f28,	%f0
	subccc	%g7,	0x1EBB,	%g5
	edge8	%o1,	%o3,	%l2
	movleu	%icc,	%o5,	%l3
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f14,	%f24
	brnz,a	%g2,	loop_14
	te	%xcc,	0x4
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g3
loop_14:
	tleu	%xcc,	0x7
	sdivx	%l4,	0x021D,	%o7
	edge8n	%l5,	%i5,	%o2
	sdiv	%g1,	0x159B,	%o4
	ldstub	[%l7 + 0x30],	%l6
	nop
	fitod	%f0,	%f2
	fdtoi	%f2,	%f19
	fmovrdlz	%g4,	%f24,	%f6
	edge32n	%i3,	%o6,	%l1
	fmovrse	%o0,	%f27,	%f25
	movn	%xcc,	%l0,	%i6
	fbu	%fcc3,	loop_15
	taddcc	%i1,	0x1F05,	%i7
	brgz,a	%i2,	loop_16
	sethi	0x0CF8,	%g6
loop_15:
	movre	%g7,	0x3AA,	%g5
	bleu,a	loop_17
loop_16:
	movrne	%o1,	0x07C,	%o3
	fpackfix	%f2,	%f10
	movre	%o5,	%l2,	%l3
loop_17:
	nop
	setx	loop_18,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivcc	%i4,	0x0E7E,	%g2
	tneg	%xcc,	0x6
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
loop_18:
	fbug	%fcc0,	loop_20
	movne	%icc,	%i0,	%g3
	subcc	%o7,	0x13E4,	%l4
loop_19:
	subcc	%i5,	%o2,	%l5
loop_20:
	array8	%g1,	%o4,	%g4
	tvs	%xcc,	0x7
	array16	%l6,	%o6,	%i3
	tn	%xcc,	0x7
	movge	%icc,	%o0,	%l1
	fcmple32	%f10,	%f8,	%i6
	edge8ln	%l0,	%i7,	%i1
	sllx	%i2,	%g7,	%g6
	or	%o1,	0x08EA,	%o3
	fmovsne	%xcc,	%f13,	%f20
	addcc	%g5,	0x138F,	%o5
	mulscc	%l3,	0x04BA,	%i4
	fbn	%fcc0,	loop_21
	subccc	%l2,	0x1A5C,	%i0
	fmovsle	%icc,	%f21,	%f31
	edge8n	%g2,	%o7,	%g3
loop_21:
	fnegd	%f2,	%f8
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l4
	ld	[%l7 + 0x68],	%f23
	alignaddrl	%o2,	%i5,	%g1
	ta	%icc,	0x0
	mova	%icc,	%l5,	%g4
	xnor	%o4,	%o6,	%l6
	set	0x62, %g4
	stba	%o0,	[%l7 + %g4] 0x0c
	nop
	setx	0x278F781D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f26
	movgu	%icc,	%i3,	%l1
	nop
	setx	0xA22A53CB30837D34,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x3F5E6F5F8EF9D93A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f0,	%f24
	tcc	%icc,	0x3
	fnot2s	%f31,	%f5
	movle	%icc,	%l0,	%i6
	array8	%i1,	%i2,	%g7
	brgez	%g6,	loop_22
	popc	0x166B,	%i7
	fone	%f16
	fmuld8sux16	%f5,	%f24,	%f4
loop_22:
	fbul	%fcc3,	loop_23
	fornot1	%f2,	%f2,	%f10
	fmovdvc	%xcc,	%f22,	%f26
	movcc	%icc,	%o3,	%g5
loop_23:
	movleu	%xcc,	%o1,	%o5
	fandnot1s	%f28,	%f22,	%f25
	lduw	[%l7 + 0x74],	%i4
	movcc	%xcc,	%l2,	%i0
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x0c,	%l2
	addcc	%o7,	%g2,	%g3
	subcc	%o2,	%l4,	%g1
	nop
	setx loop_24, %l0, %l1
	jmpl %l1, %l5
	tge	%icc,	0x1
	array8	%g4,	%i5,	%o6
	srl	%o4,	%l6,	%i3
loop_24:
	addcc	%l1,	0x0527,	%l0
	bleu	loop_25
	tne	%icc,	0x1
	swap	[%l7 + 0x48],	%o0
	brnz,a	%i6,	loop_26
loop_25:
	sir	0x0A16
	edge16l	%i1,	%i2,	%g6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%i7
loop_26:
	fbug	%fcc3,	loop_27
	tne	%icc,	0x6
	brlez	%o3,	loop_28
	edge8ln	%g5,	%o5,	%o1
loop_27:
	movpos	%icc,	%l2,	%i0
	wr	%g0,	0x89,	%asi
	sta	%f4,	[%l7 + 0x18] %asi
loop_28:
	array16	%l3,	%i4,	%g2
	ldd	[%l7 + 0x50],	%g2
	tg	%xcc,	0x1
	fmovdcc	%xcc,	%f22,	%f19
	edge32ln	%o7,	%l4,	%o2
	prefetch	[%l7 + 0x1C],	 0x0
	taddcc	%g1,	0x01F4,	%g4
	fbo	%fcc0,	loop_29
	fmovsle	%icc,	%f27,	%f10
	sra	%l5,	0x0E,	%o6
	tg	%icc,	0x4
loop_29:
	movrgez	%i5,	0x3A8,	%l6
	fmovde	%xcc,	%f30,	%f31
	tvc	%xcc,	0x4
	xnorcc	%o4,	%l1,	%i3
	movneg	%icc,	%l0,	%i6
	xnorcc	%i1,	%i2,	%o0
	xnor	%g7,	%g6,	%i7
	fbe,a	%fcc0,	loop_30
	membar	0x55
	udivx	%o3,	0x0C73,	%g5
	fpadd16	%f0,	%f8,	%f0
loop_30:
	tn	%icc,	0x3
	or	%o1,	%o5,	%l2
	tneg	%xcc,	0x0
	tpos	%icc,	0x1
	nop
	setx	0x5284DF012586914A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xB68E1903AE8C7C83,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f2,	%f16
	set	0x0E, %o6
	lduba	[%l7 + %o6] 0x88,	%l3
	alignaddr	%i4,	%g2,	%g3
	movcs	%xcc,	%o7,	%i0
	udivx	%o2,	0x0F99,	%g1
	fsrc2s	%f9,	%f10
	st	%f16,	[%l7 + 0x08]
	nop
	fitod	%f6,	%f2
	fdtos	%f2,	%f11
	andncc	%l4,	%l5,	%g4
	movpos	%icc,	%o6,	%l6
	subcc	%o4,	%i5,	%l1
	set	0x3C, %o4
	ldswa	[%l7 + %o4] 0x89,	%l0
	brgz	%i3,	loop_31
	fpsub32s	%f31,	%f23,	%f21
	bleu,a,pn	%xcc,	loop_32
	sdiv	%i1,	0x155B,	%i6
loop_31:
	edge8l	%o0,	%g7,	%i2
	brnz,a	%g6,	loop_33
loop_32:
	add	%o3,	%i7,	%g5
	fpsub32	%f24,	%f16,	%f10
	alignaddrl	%o1,	%o5,	%l2
loop_33:
	subc	%l3,	%i4,	%g3
	nop
	setx	0xA63C491BC0781E9B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fbug	%fcc2,	loop_34
	movrgez	%g2,	0x29A,	%o7
	sllx	%i0,	%g1,	%o2
	fcmpgt32	%f28,	%f28,	%l5
loop_34:
	edge32l	%l4,	%g4,	%o6
	array16	%l6,	%i5,	%o4
	bneg,a,pt	%icc,	loop_35
	fnegd	%f6,	%f24
	addccc	%l0,	%l1,	%i1
	wr	%g0,	0x89,	%asi
	stxa	%i6,	[%l7 + 0x28] %asi
loop_35:
	orcc	%o0,	0x0DE8,	%i3
	fbuge	%fcc0,	loop_36
	membar	0x2F
	fmul8x16al	%f7,	%f1,	%f28
	movne	%xcc,	%i2,	%g6
loop_36:
	fsrc2	%f22,	%f18
	fbo	%fcc1,	loop_37
	fmovrslz	%o3,	%f15,	%f13
	tn	%xcc,	0x1
	ldd	[%l7 + 0x20],	%f4
loop_37:
	pdist	%f4,	%f12,	%f20
	movrlez	%g7,	%g5,	%i7
	edge16ln	%o5,	%o1,	%l3
	edge32n	%l2,	%g3,	%i4
	tsubcctv	%g2,	0x1203,	%o7
	fandnot1	%f12,	%f14,	%f16
	tpos	%xcc,	0x7
	lduw	[%l7 + 0x5C],	%g1
	movn	%xcc,	%i0,	%o2
	tcc	%icc,	0x5
	sllx	%l4,	0x1E,	%l5
	fcmpeq32	%f22,	%f8,	%o6
	taddcc	%g4,	0x021D,	%i5
	edge16	%l6,	%o4,	%l0
	fble	%fcc0,	loop_38
	orn	%i1,	%i6,	%l1
	umul	%i3,	0x1186,	%i2
	tcc	%icc,	0x4
loop_38:
	move	%xcc,	%g6,	%o3
	fba,a	%fcc1,	loop_39
	movrlz	%g7,	0x122,	%g5
	fzeros	%f18
	movrlez	%o0,	0x3E9,	%o5
loop_39:
	tl	%icc,	0x1
	set	0x38, %i4
	prefetcha	[%l7 + %i4] 0x18,	 0x1
	orn	%l3,	%o1,	%l2
	nop
	setx loop_40, %l0, %l1
	jmpl %l1, %g3
	orncc	%g2,	%i4,	%g1
	sdivx	%i0,	0x0FED,	%o7
	movrgz	%l4,	0x285,	%l5
loop_40:
	sethi	0x18ED,	%o2
	tvs	%icc,	0x3
	st	%f1,	[%l7 + 0x24]
	tvc	%icc,	0x2
	edge32n	%o6,	%g4,	%l6
	fandnot1s	%f19,	%f0,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o4,	%i5,	%i1
	fmovdn	%xcc,	%f10,	%f13
	movle	%xcc,	%i6,	%l0
	ld	[%l7 + 0x18],	%f2
	fmovrsne	%i3,	%f18,	%f25
	fbg,a	%fcc1,	loop_41
	edge16	%i2,	%l1,	%o3
	popc	0x10D2,	%g7
	fbug,a	%fcc2,	loop_42
loop_41:
	nop
	fitos	%f1,	%f23
	fstox	%f23,	%f26
	fmovrse	%g5,	%f24,	%f30
	fbul	%fcc3,	loop_43
loop_42:
	sdiv	%g6,	0x018F,	%o5
	fmovdneg	%xcc,	%f8,	%f9
	nop
	fitos	%f12,	%f17
	fstox	%f17,	%f24
	fxtos	%f24,	%f11
loop_43:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x0c,	%o0,	%l3
	movrgez	%i7,	0x035,	%l2
	mova	%icc,	%g3,	%o1
	sdivcc	%i4,	0x1BEC,	%g1
	stx	%g2,	[%l7 + 0x30]
	alignaddrl	%i0,	%l4,	%l5
	bleu,a,pn	%xcc,	loop_44
	subcc	%o2,	%o6,	%o7
	srax	%g4,	0x0B,	%o4
	smul	%l6,	0x1091,	%i1
loop_44:
	array32	%i6,	%l0,	%i3
	sll	%i2,	0x15,	%l1
	array32	%o3,	%g7,	%g5
	ldx	[%l7 + 0x68],	%g6
	edge8ln	%i5,	%o5,	%o0
	edge16ln	%l3,	%i7,	%g3
	tn	%xcc,	0x4
	ble,pt	%xcc,	loop_45
	ldx	[%l7 + 0x20],	%o1
	set	0x40, %g2
	sta	%f24,	[%l7 + %g2] 0x10
loop_45:
	nop
	set	0x78, %o7
	prefetcha	[%l7 + %o7] 0x15,	 0x1
	st	%f7,	[%l7 + 0x48]
	nop
	setx	0x7E522D02,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x24E2CBEB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f17,	%f2
	fbg	%fcc3,	loop_46
	tvs	%icc,	0x1
	srlx	%g1,	%l2,	%i0
	movl	%icc,	%l4,	%l5
loop_46:
	smulcc	%o2,	0x01D6,	%g2
	ldsw	[%l7 + 0x7C],	%o6
	ta	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	stxa	%g4,	[%l7 + 0x18] %asi
	movvs	%icc,	%o7,	%o4
	movrlez	%i1,	%i6,	%l6
	smulcc	%l0,	%i2,	%l1
	move	%icc,	%o3,	%i3
	fmovs	%f11,	%f12
	fandnot1s	%f23,	%f28,	%f9
	fnot1s	%f20,	%f3
	addc	%g7,	0x04B2,	%g5
	movrlz	%i5,	0x322,	%o5
	fmovdgu	%icc,	%f7,	%f22
	set	0x19, %i1
	ldstuba	[%l7 + %i1] 0x18,	%o0
	sdivx	%l3,	0x194E,	%g6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%g3,	%i7
	set	0x70, %o2
	lda	[%l7 + %o2] 0x80,	%f21
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	xnor	%g1,	%l2,	%o1
	edge32l	%i0,	%l5,	%o2
	srax	%g2,	%l4,	%g4
	fmovdcs	%xcc,	%f18,	%f26
	mulx	%o6,	0x0092,	%o4
	fnegs	%f31,	%f8
	and	%o7,	%i1,	%i6
	xnorcc	%l6,	%l0,	%i2
	sll	%o3,	0x15,	%i3
	bneg	%icc,	loop_47
	fbge	%fcc1,	loop_48
	fzeros	%f28
	bcs	%icc,	loop_49
loop_47:
	edge8l	%l1,	%g7,	%i5
loop_48:
	udivx	%o5,	0x17E6,	%g5
	te	%icc,	0x0
loop_49:
	tl	%icc,	0x7
	sir	0x0C70
	sdiv	%o0,	0x1CDE,	%g6
	move	%icc,	%g3,	%i7
	fmovsvc	%icc,	%f2,	%f6
	edge16l	%i4,	%l3,	%g1
	fmovdneg	%xcc,	%f12,	%f21
	bne,pt	%icc,	loop_50
	mova	%icc,	%o1,	%l2
	fbg	%fcc3,	loop_51
	movleu	%icc,	%i0,	%o2
loop_50:
	tleu	%icc,	0x2
	edge16n	%l5,	%l4,	%g4
loop_51:
	fbo	%fcc3,	loop_52
	movrgez	%g2,	%o4,	%o7
	tl	%xcc,	0x5
	taddcc	%o6,	0x005B,	%i1
loop_52:
	umulcc	%l6,	%i6,	%l0
	bne	loop_53
	alignaddr	%o3,	%i3,	%l1
	move	%xcc,	%g7,	%i5
	call	loop_54
loop_53:
	fbul	%fcc1,	loop_55
	array16	%o5,	%i2,	%g5
	sethi	0x0B82,	%o0
loop_54:
	addc	%g3,	%g6,	%i7
loop_55:
	lduh	[%l7 + 0x2E],	%i4
	xorcc	%l3,	%o1,	%g1
	tsubcctv	%l2,	%i0,	%l5
	edge32	%o2,	%l4,	%g4
	bneg,pn	%icc,	loop_56
	fmovdpos	%xcc,	%f22,	%f12
	edge16n	%g2,	%o4,	%o6
	umul	%i1,	0x1912,	%o7
loop_56:
	movrgez	%l6,	0x030,	%l0
	stx	%o3,	[%l7 + 0x30]
	array32	%i6,	%i3,	%l1
	mulscc	%g7,	%o5,	%i5
	edge8	%g5,	%o0,	%g3
	array32	%i2,	%i7,	%i4
	set	0x32, %l6
	ldsha	[%l7 + %l6] 0x81,	%g6
	set	0x0C, %l2
	stha	%o1,	[%l7 + %l2] 0x04
	fbn	%fcc1,	loop_57
	movg	%xcc,	%l3,	%g1
	stw	%i0,	[%l7 + 0x40]
	wr	%g0,	0x18,	%asi
	stha	%l5,	[%l7 + 0x72] %asi
loop_57:
	tcc	%xcc,	0x4
	fmovrslez	%o2,	%f24,	%f25
	tvs	%icc,	0x0
	fmovrdgez	%l2,	%f4,	%f4
	fornot1s	%f8,	%f4,	%f4
	fmovdle	%xcc,	%f1,	%f19
	fmovspos	%xcc,	%f26,	%f9
	array16	%l4,	%g2,	%o4
	bn	%icc,	loop_58
	edge32n	%o6,	%i1,	%g4
	fmovdg	%xcc,	%f3,	%f1
	subc	%l6,	%l0,	%o3
loop_58:
	movre	%i6,	%i3,	%o7
	movvc	%xcc,	%g7,	%o5
	edge32	%l1,	%g5,	%o0
	ble,pn	%icc,	loop_59
	fnegs	%f18,	%f16
	mova	%icc,	%g3,	%i2
	prefetch	[%l7 + 0x1C],	 0x0
loop_59:
	be,a,pn	%xcc,	loop_60
	pdist	%f22,	%f0,	%f26
	sll	%i7,	0x12,	%i5
	flush	%l7 + 0x34
loop_60:
	fors	%f11,	%f28,	%f31
	andncc	%i4,	%g6,	%o1
	edge32ln	%l3,	%i0,	%g1
	fmovspos	%icc,	%f6,	%f1
	ldsw	[%l7 + 0x20],	%o2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x24,	%l2
	orcc	%l5,	%g2,	%o4
	alignaddrl	%o6,	%i1,	%g4
	ble,a	loop_61
	sethi	0x0DB1,	%l4
	nop
	setx	0x289C59BB3C31BAA9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x08EB191CB3C7D18D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f8,	%f14
	be,a	%xcc,	loop_62
loop_61:
	fbg	%fcc0,	loop_63
	bcc,a,pt	%icc,	loop_64
	andn	%l6,	0x1F66,	%l0
loop_62:
	move	%icc,	%o3,	%i6
loop_63:
	movg	%icc,	%o7,	%g7
loop_64:
	andncc	%o5,	%l1,	%i3
	movn	%icc,	%g5,	%g3
	subc	%i2,	%i7,	%i5
	bn,a	%icc,	loop_65
	edge8n	%i4,	%g6,	%o1
	fmovd	%f2,	%f8
	sir	0x1333
loop_65:
	sllx	%l3,	%i0,	%g1
	tl	%icc,	0x1
	fmovsle	%icc,	%f3,	%f0
	flush	%l7 + 0x70
	edge32ln	%o0,	%o2,	%l2
	sethi	0x0CED,	%l5
	te	%icc,	0x1
	fbn,a	%fcc2,	loop_66
	fandnot2s	%f30,	%f9,	%f21
	taddcc	%o4,	%o6,	%i1
	fsrc1	%f26,	%f8
loop_66:
	orcc	%g2,	0x1C0C,	%l4
	and	%g4,	0x1F3D,	%l6
	std	%f20,	[%l7 + 0x48]
	sra	%o3,	0x04,	%i6
	ldd	[%l7 + 0x70],	%f8
	brlz	%o7,	loop_67
	movrlez	%l0,	%o5,	%g7
	edge16	%l1,	%g5,	%i3
	ldstub	[%l7 + 0x0D],	%g3
loop_67:
	fmovsneg	%xcc,	%f13,	%f29
	edge32n	%i7,	%i5,	%i2
	fnegs	%f9,	%f12
	tl	%icc,	0x6
	movg	%icc,	%g6,	%o1
	fbl,a	%fcc3,	loop_68
	movpos	%icc,	%l3,	%i0
	fbn,a	%fcc3,	loop_69
	array16	%g1,	%o0,	%o2
loop_68:
	movpos	%xcc,	%l2,	%i4
	set	0x46, %i6
	ldstuba	[%l7 + %i6] 0x0c,	%l5
loop_69:
	movl	%icc,	%o6,	%i1
	bl,a,pn	%icc,	loop_70
	tl	%icc,	0x7
	tsubcc	%o4,	%l4,	%g2
	movrlez	%l6,	%o3,	%g4
loop_70:
	movg	%xcc,	%o7,	%l0
	umulcc	%o5,	0x0942,	%g7
	lduw	[%l7 + 0x64],	%l1
	fpadd16s	%f12,	%f13,	%f18
	alignaddr	%i6,	%g5,	%i3
	fmovsvc	%xcc,	%f15,	%f19
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%f0
	fbuge,a	%fcc0,	loop_71
	fmovdg	%icc,	%f10,	%f23
	orcc	%i7,	%g3,	%i2
	movrgz	%g6,	0x35A,	%i5
loop_71:
	movle	%xcc,	%l3,	%o1
	edge16	%g1,	%i0,	%o2
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%o0
	bl	%icc,	loop_72
	taddcc	%i4,	0x012E,	%l2
	ldub	[%l7 + 0x78],	%l5
	movleu	%icc,	%i1,	%o4
loop_72:
	array8	%l4,	%g2,	%o6
	fpadd32s	%f2,	%f23,	%f25
	nop
	setx	0x27CF51DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x3AD57B66,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f19,	%f11
	nop
	setx	0x159C4A2AEE081F6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC8EE940664889422,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f30,	%f4
	array32	%l6,	%g4,	%o7
	srax	%o3,	0x06,	%l0
	flush	%l7 + 0x24
	tgu	%icc,	0x7
	udiv	%g7,	0x0EDD,	%l1
	sth	%o5,	[%l7 + 0x14]
	umul	%g5,	0x1C4C,	%i3
	tleu	%icc,	0x0
	xorcc	%i7,	%g3,	%i2
	alignaddrl	%g6,	%i5,	%l3
	ldd	[%l7 + 0x38],	%o0
	set	0x30, %g6
	ldda	[%l7 + %g6] 0xe2,	%g0
	fmovsg	%xcc,	%f12,	%f2
	add	%i6,	%o2,	%o0
	tcc	%icc,	0x3
	fone	%f6
	set	0x18, %i0
	sta	%f6,	[%l7 + %i0] 0x14
	movrlz	%i4,	%i0,	%l2
	bvs,pn	%icc,	loop_73
	fbue,a	%fcc0,	loop_74
	movneg	%icc,	%i1,	%o4
	movleu	%xcc,	%l4,	%l5
loop_73:
	sllx	%g2,	0x0C,	%l6
loop_74:
	bge,a,pn	%icc,	loop_75
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%icc,	%f31,	%f1
	move	%xcc,	%g4,	%o7
loop_75:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o3,	%l0
	smulcc	%o6,	%g7,	%l1
	move	%icc,	%o5,	%i3
	fpsub32	%f8,	%f26,	%f8
	fmovscc	%icc,	%f30,	%f2
	fmovda	%xcc,	%f19,	%f15
	ldsw	[%l7 + 0x30],	%i7
	fsrc1	%f20,	%f12
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%g3
	set	0x45, %l1
	ldsba	[%l7 + %l1] 0x81,	%i2
	fmul8ulx16	%f28,	%f14,	%f28
	fmovsvs	%xcc,	%f26,	%f30
	mulscc	%g6,	%g5,	%i5
	brgz,a	%o1,	loop_76
	addcc	%g1,	0x147B,	%l3
	addc	%o2,	0x065C,	%o0
	mulscc	%i4,	%i0,	%l2
loop_76:
	nop
	set	0x28, %o0
	stxa	%i6,	[%l7 + %o0] 0x18
	stx	%i1,	[%l7 + 0x48]
	movleu	%xcc,	%o4,	%l4
	tne	%xcc,	0x4
	addccc	%g2,	0x132E,	%l6
	movrgez	%g4,	%l5,	%o3
	fabss	%f18,	%f7
	xorcc	%o7,	%o6,	%l0
	for	%f4,	%f14,	%f4
	movcs	%xcc,	%g7,	%l1
	movne	%icc,	%i3,	%i7
	xorcc	%g3,	0x1019,	%o5
	tne	%xcc,	0x7
	flush	%l7 + 0x30
	fones	%f14
	brlez,a	%i2,	loop_77
	fpadd32	%f18,	%f20,	%f10
	tvc	%xcc,	0x6
	fabsd	%f10,	%f30
loop_77:
	xor	%g5,	0x06DD,	%g6
	tcc	%icc,	0x6
	edge32ln	%i5,	%g1,	%l3
	ba	loop_78
	edge16	%o1,	%o0,	%i4
	ldx	[%l7 + 0x20],	%o2
	sllx	%l2,	%i0,	%i1
loop_78:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f9,	[%l7 + 0x78] %asi
	fmovdpos	%xcc,	%f10,	%f8
	mulscc	%i6,	0x1FBA,	%o4
	nop
	fitos	%f4,	%f29
	fstox	%f29,	%f20
	fxtos	%f20,	%f8
	set	0x38, %g7
	stxa	%l4,	[%l7 + %g7] 0x0c
	taddcctv	%g2,	0x0260,	%g4
	nop
	fitos	%f0,	%f0
	fstoi	%f0,	%f29
	udiv	%l6,	0x076D,	%l5
	umul	%o3,	0x1E00,	%o7
	sethi	0x11EC,	%l0
	membar	0x63
	bge,a	%xcc,	loop_79
	tg	%xcc,	0x2
	andn	%o6,	%g7,	%l1
	nop
	setx	loop_80,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_79:
	andcc	%i3,	%g3,	%i7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%g5
loop_80:
	fbne,a	%fcc3,	loop_81
	andcc	%o5,	%g6,	%i5
	edge16l	%l3,	%g1,	%o1
	tne	%xcc,	0x7
loop_81:
	nop
	set	0x4C, %l0
	stha	%i4,	[%l7 + %l0] 0x27
	membar	#Sync
	ble	%xcc,	loop_82
	ta	%icc,	0x6
	umulcc	%o2,	0x151E,	%o0
	array16	%i0,	%l2,	%i6
loop_82:
	movpos	%icc,	%o4,	%l4
	sir	0x0064
	orcc	%i1,	0x0103,	%g2
	xnorcc	%g4,	0x02C1,	%l6
	fbule,a	%fcc1,	loop_83
	fmovdleu	%xcc,	%f28,	%f29
	edge32l	%o3,	%o7,	%l0
	fnor	%f30,	%f28,	%f26
loop_83:
	edge16n	%o6,	%g7,	%l1
	tge	%xcc,	0x0
	tn	%xcc,	0x0
	bcs,a	%xcc,	loop_84
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l5,	%i3,	%g3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%i2
loop_84:
	movvs	%xcc,	%g5,	%g6
	fnors	%f30,	%f11,	%f4
	fble	%fcc1,	loop_85
	fmovdneg	%icc,	%f15,	%f6
	movge	%icc,	%i5,	%o5
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f2
loop_85:
	fmovscc	%xcc,	%f6,	%f2
	fmovdleu	%icc,	%f13,	%f14
	fmovscs	%xcc,	%f13,	%f19
	bne	loop_86
	addccc	%g1,	%o1,	%i4
	or	%l3,	%o2,	%i0
	edge8l	%l2,	%i6,	%o4
loop_86:
	xnorcc	%l4,	%i1,	%o0
	bneg,a	loop_87
	fbo	%fcc3,	loop_88
	fmuld8sux16	%f14,	%f22,	%f24
	fmul8x16au	%f19,	%f3,	%f6
loop_87:
	ldsh	[%l7 + 0x56],	%g4
loop_88:
	nop
	set	0x38, %i2
	swapa	[%l7 + %i2] 0x19,	%g2
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	orcc	%l6,	0x1C92,	%o7
	tgu	%icc,	0x4
	tsubcc	%l0,	0x1677,	%o3
	nop
	setx	0x761DCEE083D0FAB6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x0036D8AE72379DA7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f24,	%f6
	fbne	%fcc0,	loop_89
	sll	%g7,	%o6,	%l1
	andn	%i3,	%g3,	%l5
	edge32n	%i2,	%i7,	%g5
loop_89:
	nop
	setx	0xF152E51C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f12
	flush	%l7 + 0x30
	nop
	setx loop_90, %l0, %l1
	jmpl %l1, %i5
	addccc	%g6,	0x08DB,	%g1
	brlez,a	%o1,	loop_91
	srlx	%i4,	%o5,	%l3
loop_90:
	subccc	%i0,	0x1E92,	%l2
	nop
	fitod	%f2,	%f8
	fdtoi	%f8,	%f2
loop_91:
	fornot2s	%f6,	%f16,	%f1
	udiv	%o2,	0x0C20,	%i6
	bvs	loop_92
	umulcc	%o4,	0x0238,	%l4
	bcc	%icc,	loop_93
	tn	%xcc,	0x1
loop_92:
	fmovde	%icc,	%f26,	%f27
	brnz	%o0,	loop_94
loop_93:
	movcs	%icc,	%g4,	%g2
	tcc	%xcc,	0x1
	nop
	setx	0x40689219,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
loop_94:
	orncc	%l6,	0x08F3,	%o7
	addccc	%l0,	0x1C29,	%i1
	nop
	setx	0x1F9C96395E1F03DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x193AA4998A3E5CBE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f26,	%f26
	fpackfix	%f18,	%f22
	xorcc	%g7,	0x0380,	%o3
	edge32l	%o6,	%l1,	%g3
	ba,a	loop_95
	movg	%xcc,	%l5,	%i3
	addccc	%i2,	%g5,	%i7
	ldsh	[%l7 + 0x68],	%i5
loop_95:
	movrlz	%g1,	0x037,	%o1
	tne	%xcc,	0x2
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x27,	%g6
	movrgz	%o5,	0x3AE,	%i4
	srlx	%l3,	%l2,	%o2
	brgz	%i6,	loop_96
	udiv	%i0,	0x1350,	%o4
	edge8l	%o0,	%g4,	%g2
	subc	%l6,	%l4,	%o7
loop_96:
	xnor	%l0,	%g7,	%i1
	subc	%o6,	%o3,	%g3
	fsrc2	%f10,	%f2
	bleu,a,pt	%xcc,	loop_97
	tneg	%xcc,	0x5
	sir	0x116D
	fnegs	%f18,	%f19
loop_97:
	brlez	%l5,	loop_98
	tsubcctv	%i3,	%i2,	%g5
	sdivcc	%i7,	0x1CBB,	%i5
	tsubcctv	%g1,	0x12EC,	%l1
loop_98:
	smulcc	%o1,	0x1003,	%g6
	subccc	%o5,	0x0ABE,	%i4
	movneg	%icc,	%l3,	%l2
	movn	%xcc,	%o2,	%i0
	movcs	%icc,	%o4,	%o0
	edge16	%g4,	%i6,	%g2
	add	%l4,	0x1C82,	%o7
	fmovdvs	%xcc,	%f16,	%f12
	lduh	[%l7 + 0x4C],	%l6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%g7,	%i1
	sir	0x1845
	edge16l	%l0,	%o6,	%o3
	movrne	%l5,	0x35E,	%i3
	edge32l	%g3,	%i2,	%g5
	move	%icc,	%i7,	%i5
	movvs	%xcc,	%g1,	%l1
	movle	%xcc,	%o1,	%o5
	bge,pn	%icc,	loop_99
	taddcctv	%i4,	%g6,	%l2
	sdivx	%o2,	0x0F36,	%l3
	fmovsg	%xcc,	%f26,	%f10
loop_99:
	nop
	wr	%g0,	0x22,	%asi
	stxa	%i0,	[%l7 + 0x70] %asi
	membar	#Sync
	addcc	%o4,	%g4,	%i6
	stbar
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f16
	mova	%icc,	%o0,	%g2
	orcc	%l4,	0x18C6,	%l6
	bl,a,pn	%icc,	loop_100
	nop
	setx	0x77CA9B71B0E6604F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2BB6333D52A7F24B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f24,	%f26
	edge32l	%o7,	%i1,	%l0
	fmovde	%xcc,	%f0,	%f16
loop_100:
	call	loop_101
	sdivcc	%g7,	0x189A,	%o3
	ldd	[%l7 + 0x68],	%f12
	movleu	%xcc,	%o6,	%l5
loop_101:
	tgu	%icc,	0x2
	fmovdleu	%icc,	%f20,	%f25
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i3,	%g3,	%g5
	fandnot2	%f26,	%f4,	%f10
	bvc,a	%xcc,	loop_102
	fnor	%f18,	%f22,	%f2
	wr	%g0,	0xea,	%asi
	stwa	%i2,	[%l7 + 0x68] %asi
	membar	#Sync
loop_102:
	tge	%icc,	0x3
	srlx	%i5,	%i7,	%l1
	fpsub32	%f28,	%f6,	%f6
	sllx	%o1,	%g1,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	stwa	%i4,	[%l7 + 0x28] %asi
	st	%f3,	[%l7 + 0x18]
	movrne	%l2,	%o2,	%l3
	bpos	%icc,	loop_103
	subcc	%i0,	0x07B2,	%g6
	umul	%o4,	%i6,	%g4
	fmovscc	%xcc,	%f16,	%f23
loop_103:
	movgu	%xcc,	%o0,	%l4
	fornot1	%f4,	%f8,	%f10
	udiv	%g2,	0x04F3,	%l6
	edge8	%o7,	%l0,	%g7
	bg	loop_104
	sll	%o3,	0x19,	%o6
	fbe	%fcc2,	loop_105
	fsrc1	%f16,	%f8
loop_104:
	fbug,a	%fcc1,	loop_106
	sdivx	%i1,	0x139D,	%i3
loop_105:
	andcc	%g3,	%g5,	%i2
	tgu	%xcc,	0x2
loop_106:
	smulcc	%l5,	0x1EAE,	%i7
	nop
	setx	0x5792C51A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x545676DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f14,	%f18
	fnot2	%f6,	%f4
	movl	%icc,	%i5,	%l1
	edge32l	%g1,	%o1,	%i4
	set	0x34, %l3
	lduwa	[%l7 + %l3] 0x04,	%l2
	set	0x40, %i7
	ldxa	[%l7 + %i7] 0x15,	%o5
	te	%icc,	0x3
	mulscc	%o2,	0x0903,	%l3
	nop
	setx	loop_107,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%i0,	0x0887,	%o4
	umulcc	%i6,	0x1000,	%g4
	call	loop_108
loop_107:
	movneg	%xcc,	%g6,	%l4
	array8	%g2,	%l6,	%o7
	and	%o0,	%g7,	%o3
loop_108:
	srl	%o6,	%i1,	%i3
	andn	%l0,	0x10FC,	%g5
	umul	%g3,	%i2,	%i7
	movl	%xcc,	%l5,	%l1
	movrne	%i5,	0x249,	%o1
	tvs	%xcc,	0x7
	edge8	%i4,	%g1,	%o5
	nop
	setx	0x5089E964406AF822,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x0B89DDC41D8D039E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f24,	%f6
	movcs	%xcc,	%o2,	%l3
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x78] %asi,	%l2
	fandnot2	%f30,	%f28,	%f30
	tle	%xcc,	0x1
	alignaddrl	%o4,	%i6,	%i0
	fone	%f16
	brgz,a	%g6,	loop_109
	fbl,a	%fcc1,	loop_110
	or	%l4,	0x094B,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_109:
	ble,a	%icc,	loop_111
loop_110:
	subc	%g4,	%l6,	%o7
	edge32n	%g7,	%o3,	%o6
	bpos,pt	%icc,	loop_112
loop_111:
	add	%o0,	0x0B44,	%i3
	edge8n	%l0,	%g5,	%g3
	tcc	%icc,	0x0
loop_112:
	ta	%icc,	0x6
	brlz	%i2,	loop_113
	srax	%i7,	%l5,	%l1
	edge8l	%i1,	%i5,	%o1
	mulscc	%i4,	0x1CC7,	%o5
loop_113:
	movne	%xcc,	%o2,	%l3
	sethi	0x17C5,	%l2
	tsubcc	%o4,	%i6,	%i0
	fzeros	%f24
	fors	%f16,	%f31,	%f13
	brz	%g6,	loop_114
	taddcc	%l4,	0x18C0,	%g1
	tvs	%icc,	0x4
	edge8ln	%g4,	%g2,	%o7
loop_114:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g7,	%l6
	ldsh	[%l7 + 0x72],	%o3
	ldd	[%l7 + 0x20],	%o0
	nop
	setx	0x4D03D3E1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f25
	fpadd16s	%f9,	%f4,	%f10
	set	0x38, %o5
	prefetcha	[%l7 + %o5] 0x81,	 0x2
	stw	%l0,	[%l7 + 0x58]
	tpos	%icc,	0x6
	add	%o6,	0x1C85,	%g5
	edge8	%i2,	%i7,	%g3
	tleu	%xcc,	0x4
	edge16n	%l1,	%i1,	%l5
	fnor	%f20,	%f12,	%f10
	edge8	%o1,	%i4,	%i5
	fmovs	%f15,	%f26
	set	0x4A, %g3
	ldsba	[%l7 + %g3] 0x15,	%o5
	tge	%xcc,	0x4
	bneg,pn	%xcc,	loop_115
	movneg	%xcc,	%o2,	%l3
	fmovrde	%o4,	%f4,	%f8
	fmovrse	%i6,	%f15,	%f20
loop_115:
	udivcc	%i0,	0x1376,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x156B,	%l2
	array8	%l4,	%g4,	%g2
	smulcc	%o7,	%g1,	%l6
	fbue,a	%fcc0,	loop_116
	array8	%g7,	%o0,	%o3
	bvc,a	loop_117
	fmovda	%icc,	%f7,	%f4
loop_116:
	ldsw	[%l7 + 0x44],	%l0
	nop
	setx	0xDD500E01,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x97FD4685,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f30,	%f28
loop_117:
	fpsub32s	%f8,	%f14,	%f29
	stx	%o6,	[%l7 + 0x38]
	fzero	%f26
	smulcc	%g5,	0x0A44,	%i2
	tvc	%xcc,	0x3
	nop
	set	0x10, %o1
	ldx	[%l7 + %o1],	%i7
	fpsub16s	%f12,	%f11,	%f13
	swap	[%l7 + 0x58],	%i3
	ta	%xcc,	0x6
	nop
	fitos	%f1,	%f15
	fstox	%f15,	%f0
	stx	%g3,	[%l7 + 0x58]
	movrgz	%i1,	0x029,	%l5
	pdist	%f8,	%f20,	%f14
	fba,a	%fcc2,	loop_118
	movleu	%icc,	%l1,	%i4
	tge	%xcc,	0x7
	nop
	setx	0x2BD041CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xA29B9DDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f10,	%f8
loop_118:
	fmovrde	%i5,	%f18,	%f4
	movrgz	%o5,	%o1,	%o2
	tleu	%xcc,	0x4
	nop
	setx	0x581786D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xF2D86823,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f30,	%f12
	brlz,a	%o4,	loop_119
	subcc	%i6,	%i0,	%g6
	edge32l	%l3,	%l4,	%l2
	array8	%g2,	%g4,	%o7
loop_119:
	movrlz	%l6,	0x1CD,	%g7
	fmovrsne	%g1,	%f5,	%f23
	mulx	%o3,	%l0,	%o0
	xnor	%o6,	0x0880,	%i2
	movleu	%xcc,	%i7,	%g5
	movcs	%xcc,	%i3,	%i1
	wr	%g0,	0x11,	%asi
	sta	%f9,	[%l7 + 0x58] %asi
	smulcc	%g3,	0x1879,	%l1
	movn	%xcc,	%l5,	%i5
	sethi	0x18E4,	%o5
	ta	%icc,	0x1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%o1
	subcc	%o2,	%o4,	%i6
	tcc	%xcc,	0x7
	tpos	%icc,	0x1
	fmovrslz	%g6,	%f2,	%f24
	fbl,a	%fcc0,	loop_120
	nop
	fitod	%f19,	%f2
	ldd	[%l7 + 0x70],	%f30
	movg	%icc,	%i0,	%l4
loop_120:
	edge8n	%l3,	%g2,	%g4
	srlx	%l2,	%l6,	%o7
	addccc	%g7,	%g1,	%l0
	fbu	%fcc2,	loop_121
	fmovscs	%xcc,	%f21,	%f25
	fbge	%fcc3,	loop_122
	bl,pn	%icc,	loop_123
loop_121:
	movrlez	%o0,	%o6,	%i2
	fmul8sux16	%f16,	%f6,	%f24
loop_122:
	tcc	%xcc,	0x0
loop_123:
	addcc	%i7,	0x1CF6,	%o3
	membar	0x74
	movcc	%xcc,	%g5,	%i3
	edge32ln	%g3,	%l1,	%l5
	srl	%i1,	0x0A,	%i5
	tg	%xcc,	0x2
	nop
	setx loop_124, %l0, %l1
	jmpl %l1, %o5
	tcc	%xcc,	0x4
	fmovsne	%icc,	%f5,	%f17
	movn	%icc,	%o1,	%i4
loop_124:
	tne	%icc,	0x0
	fmovdneg	%xcc,	%f3,	%f21
	subc	%o2,	%o4,	%i6
	edge32	%i0,	%l4,	%l3
	srax	%g6,	%g2,	%l2
	popc	%g4,	%l6
	edge16	%o7,	%g7,	%l0
	fbug	%fcc3,	loop_125
	taddcc	%o0,	0x077F,	%o6
	tcc	%icc,	0x6
	fsrc1	%f8,	%f18
loop_125:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%i2
	popc	%i7,	%g1
	fbug	%fcc0,	loop_126
	movvc	%icc,	%o3,	%g5
	std	%f14,	[%l7 + 0x40]
	movrgz	%g3,	0x146,	%l1
loop_126:
	movge	%icc,	%i3,	%i1
	addccc	%i5,	%l5,	%o1
	ld	[%l7 + 0x74],	%f5
	fpadd32s	%f9,	%f15,	%f23
	st	%f16,	[%l7 + 0x50]
	srl	%i4,	%o5,	%o2
	fmovs	%f11,	%f12
	set	0x64, %g5
	sta	%f13,	[%l7 + %g5] 0x18
	nop
	setx	0x8076D663,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x2C] %asi,	%f10
	fbul,a	%fcc0,	loop_127
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_127:
	tle	%xcc,	0x0
	tn	%xcc,	0x0
	tsubcctv	%o4,	%i0,	%i6
	ba,pn	%xcc,	loop_128
	fcmple16	%f12,	%f6,	%l4
	umul	%g6,	0x1FFB,	%g2
	fandnot2s	%f14,	%f30,	%f9
loop_128:
	taddcc	%l3,	%g4,	%l2
	and	%o7,	0x1406,	%l6
	udivx	%l0,	0x1540,	%g7
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f14
	fmovdcs	%xcc,	%f16,	%f31
	mova	%icc,	%o6,	%i2
	fzeros	%f11
	fbe,a	%fcc2,	loop_129
	edge8ln	%i7,	%o0,	%g1
	prefetch	[%l7 + 0x40],	 0x0
	fnot2s	%f24,	%f18
loop_129:
	fmovs	%f23,	%f9
	alignaddr	%o3,	%g3,	%g5
	fbul	%fcc0,	loop_130
	ldsw	[%l7 + 0x58],	%l1
	swap	[%l7 + 0x5C],	%i3
	orn	%i5,	0x0580,	%l5
loop_130:
	fbge	%fcc1,	loop_131
	fnands	%f29,	%f20,	%f19
	umulcc	%i1,	%i4,	%o1
	fxnors	%f0,	%f5,	%f16
loop_131:
	edge8	%o2,	%o4,	%o5
	edge16l	%i0,	%i6,	%g6
	bg	loop_132
	movre	%g2,	%l4,	%g4
	nop
	setx	0x7E248C4C96207CA5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x9CCF06490BED7DF3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f12,	%f16
	movcs	%icc,	%l3,	%o7
loop_132:
	fmovrdlz	%l6,	%f4,	%f20
	tsubcctv	%l0,	%g7,	%o6
	edge16l	%l2,	%i7,	%i2
	fsrc2	%f8,	%f16
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0x3
	edge32l	%o3,	%g3,	%g5
	nop
	setx	0x7D4106E72050196E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	edge32l	%g1,	%i3,	%l1
	fmovdgu	%xcc,	%f10,	%f22
	edge32ln	%l5,	%i5,	%i4
	edge16l	%o1,	%i1,	%o2
	tvc	%xcc,	0x7
	popc	%o5,	%i0
	fcmple32	%f16,	%f20,	%o4
	fbu	%fcc2,	loop_133
	andcc	%i6,	%g6,	%l4
	popc	%g2,	%g4
	or	%l3,	%o7,	%l6
loop_133:
	orcc	%g7,	0x0BFB,	%o6
	edge16l	%l2,	%i7,	%i2
	srl	%o0,	%o3,	%l0
	fba	%fcc0,	loop_134
	tl	%xcc,	0x1
	subccc	%g3,	0x051C,	%g1
	edge8l	%g5,	%l1,	%i3
loop_134:
	sth	%l5,	[%l7 + 0x5A]
	edge8ln	%i4,	%i5,	%o1
	movrne	%i1,	%o5,	%o2
	edge32n	%i0,	%i6,	%g6
	brgz,a	%o4,	loop_135
	bge,a,pn	%xcc,	loop_136
	fnands	%f27,	%f19,	%f0
	smulcc	%g2,	%l4,	%g4
loop_135:
	nop
	set	0x208, %g4
	stxa	%l3,	[%g0 + %g4] 0x52
loop_136:
	sra	%l6,	0x08,	%g7
	tvc	%icc,	0x0
	subccc	%o7,	0x0491,	%o6
	tvs	%xcc,	0x6
	fbug,a	%fcc0,	loop_137
	ld	[%l7 + 0x44],	%f27
	brlz,a	%l2,	loop_138
	movcc	%xcc,	%i7,	%o0
loop_137:
	edge16l	%o3,	%l0,	%i2
	set	0x30, %l4
	ldxa	[%g0 + %l4] 0x50,	%g1
loop_138:
	fmovrdgez	%g3,	%f12,	%f24
	fmovdgu	%icc,	%f18,	%f15
	nop
	setx	loop_139,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%xcc,	%l1,	%i3
	fcmpne16	%f26,	%f16,	%g5
	edge8n	%i4,	%l5,	%o1
loop_139:
	mulx	%i5,	%i1,	%o5
	xnor	%o2,	%i0,	%g6
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%i6
	movrgz	%g2,	%l4,	%g4
	add	%o4,	%l6,	%l3
	movne	%xcc,	%g7,	%o7
	sdivx	%l2,	0x0149,	%o6
	fnor	%f8,	%f4,	%f12
	edge32	%i7,	%o0,	%l0
	tg	%xcc,	0x4
	movvc	%icc,	%i2,	%g1
	edge16l	%g3,	%l1,	%o3
	fmovdpos	%icc,	%f12,	%f29
	tle	%icc,	0x4
	swap	[%l7 + 0x78],	%g5
	brgez,a	%i4,	loop_140
	subcc	%l5,	0x1601,	%i3
	edge16l	%o1,	%i5,	%o5
	for	%f20,	%f2,	%f28
loop_140:
	tcs	%icc,	0x3
	tge	%icc,	0x0
	fcmpgt16	%f28,	%f28,	%o2
	nop
	set	0x38, %o4
	std	%f0,	[%l7 + %o4]
	fnot1s	%f30,	%f21
	andcc	%i0,	0x1955,	%i1
	edge16n	%g6,	%g2,	%l4
	fmovsge	%xcc,	%f18,	%f12
	fabss	%f13,	%f17
	fmovsg	%xcc,	%f8,	%f25
	movne	%icc,	%i6,	%o4
	array16	%l6,	%g4,	%l3
	or	%o7,	0x0DA5,	%g7
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%o6
	bleu	loop_141
	edge8	%l2,	%i7,	%l0
	fmul8x16al	%f15,	%f7,	%f28
	bvc,pn	%xcc,	loop_142
loop_141:
	movrgz	%i2,	0x0F5,	%g1
	set	0x70, %g2
	ldda	[%l7 + %g2] 0x26,	%o0
loop_142:
	array32	%l1,	%g3,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f3,	%f27
	mulscc	%i4,	%g5,	%l5
	movl	%xcc,	%i3,	%o1
	bge,a,pn	%icc,	loop_143
	tpos	%icc,	0x6
	brlez	%i5,	loop_144
	tsubcctv	%o2,	%i0,	%o5
loop_143:
	nop
	wr	%g0,	0x10,	%asi
	stwa	%i1,	[%l7 + 0x10] %asi
loop_144:
	orncc	%g6,	0x0D3E,	%g2
	set	0x46, %o7
	stha	%i6,	[%l7 + %o7] 0x11
	bleu,a	loop_145
	array8	%o4,	%l4,	%l6
	nop
	setx	0xADDDFC8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x761B7FD7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f16,	%f24
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x2E] %asi,	%l3
loop_145:
	udiv	%o7,	0x1F0A,	%g4
	edge32ln	%o6,	%g7,	%i7
	nop
	setx	0xD0456CD5,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	andcc	%l0,	0x1A16,	%i2
	edge16ln	%l2,	%o0,	%l1
	fmovdle	%icc,	%f14,	%f18
	brlz,a	%g1,	loop_146
	tg	%icc,	0x1
	ldsw	[%l7 + 0x18],	%g3
	fcmpeq16	%f22,	%f24,	%o3
loop_146:
	movvc	%xcc,	%g5,	%l5
	smulcc	%i3,	%i4,	%o1
	fmovdn	%xcc,	%f4,	%f5
	tleu	%icc,	0x3
	fba,a	%fcc3,	loop_147
	tpos	%xcc,	0x6
	movcs	%icc,	%i5,	%o2
	xor	%i0,	0x1C94,	%o5
loop_147:
	bleu,a	%xcc,	loop_148
	fmovsg	%icc,	%f22,	%f23
	fcmple32	%f10,	%f6,	%i1
	sll	%g2,	0x19,	%g6
loop_148:
	fblg	%fcc3,	loop_149
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o4,	%l4
	sdivx	%i6,	0x12FD,	%l6
loop_149:
	nop
	setx	0x70664357,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	fmovrsgez	%l3,	%f25,	%f9
	nop
	setx	loop_150,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16	%o7,	%g4,	%g7
	movne	%xcc,	%i7,	%l0
	tne	%xcc,	0x0
loop_150:
	movre	%i2,	%o6,	%l2
	edge16l	%o0,	%g1,	%l1
	orncc	%o3,	%g5,	%l5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	te	%xcc,	0x1
	smul	%i3,	%g3,	%i4
	movcc	%xcc,	%i5,	%o1
	edge16ln	%o2,	%o5,	%i0
	fmovdge	%icc,	%f11,	%f13
	fmovdneg	%icc,	%f27,	%f12
	te	%icc,	0x4
	bcc	%icc,	loop_151
	movrgz	%i1,	0x1A9,	%g6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x74] %asi,	%o4
loop_151:
	movrlz	%g2,	%i6,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0426,	%l3
	movleu	%xcc,	%l4,	%g4
	ldsw	[%l7 + 0x24],	%g7
	andncc	%o7,	%i7,	%i2
	fxors	%f23,	%f19,	%f0
	fmuld8sux16	%f3,	%f1,	%f4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x37] %asi,	%l0
	udivx	%o6,	0x11EE,	%l2
	move	%icc,	%g1,	%l1
	array8	%o3,	%g5,	%o0
	movrlz	%i3,	%l5,	%i4
	bgu,a,pn	%icc,	loop_152
	fpsub32	%f12,	%f6,	%f8
	tl	%xcc,	0x7
	bl,a	loop_153
loop_152:
	srax	%i5,	%g3,	%o1
	fbule	%fcc2,	loop_154
	fornot1	%f22,	%f26,	%f10
loop_153:
	fmovdl	%icc,	%f16,	%f9
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%o5
loop_154:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x4C] %asi,	%i0
	movge	%xcc,	%g6,	%o4
	movne	%icc,	%g2,	%i1
	subcc	%l6,	0x04C8,	%l3
	fmovrslz	%i6,	%f7,	%f22
	fands	%f5,	%f8,	%f4
	call	loop_155
	fmovdg	%icc,	%f5,	%f17
	sll	%g4,	%l4,	%g7
	ta	%icc,	0x1
loop_155:
	or	%i7,	%o7,	%i2
	set	0x20, %i4
	ldda	[%l7 + %i4] 0x26,	%o6
	brlez	%l2,	loop_156
	stw	%l0,	[%l7 + 0x44]
	movrlez	%g1,	%o3,	%l1
	umul	%o0,	0x013B,	%i3
loop_156:
	tgu	%xcc,	0x6
	tle	%icc,	0x5
	stx	%l5,	[%l7 + 0x78]
	orcc	%g5,	%i5,	%i4
	tsubcctv	%o1,	%o2,	%o5
	fmovs	%f28,	%f19
	srl	%g3,	0x15,	%g6
	move	%xcc,	%o4,	%i0
	addc	%g2,	0x0B8B,	%l6
	nop
	fitod	%f4,	%f18
	fdtoi	%f18,	%f0
	umul	%i1,	%i6,	%g4
	te	%icc,	0x2
	fbn,a	%fcc3,	loop_157
	st	%f25,	[%l7 + 0x54]
	movvc	%xcc,	%l4,	%g7
	nop
	set	0x43, %i1
	ldstub	[%l7 + %i1],	%i7
loop_157:
	edge8ln	%o7,	%l3,	%o6
	fornot1	%f14,	%f16,	%f30
	membar	0x2B
	movre	%i2,	%l0,	%l2
	bshuffle	%f28,	%f6,	%f10
	xnorcc	%g1,	%l1,	%o0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	fexpand	%f20,	%f20
	tl	%icc,	0x5
	movrgz	%l5,	%o3,	%i5
	set	0x4C, %o2
	ldsha	[%l7 + %o2] 0x19,	%g5
	mova	%xcc,	%i4,	%o1
	fpsub16s	%f24,	%f12,	%f24
	movneg	%icc,	%o5,	%g3
	brgz,a	%o2,	loop_158
	fbl	%fcc3,	loop_159
	udivcc	%o4,	0x0D39,	%i0
	tle	%icc,	0x4
loop_158:
	edge32ln	%g6,	%g2,	%l6
loop_159:
	std	%f20,	[%l7 + 0x10]
	edge32	%i6,	%i1,	%g4
	sdivx	%l4,	0x10DC,	%i7
	mova	%xcc,	%o7,	%g7
	sra	%l3,	0x03,	%i2
	add	%l0,	%l2,	%g1
	nop
	fitos	%f7,	%f22
	fstox	%f22,	%f0
	wr	%g0,	0x18,	%asi
	stwa	%l1,	[%l7 + 0x30] %asi
	nop
	setx	0xC287132A0742E252,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD36271DE23359B15,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f30,	%f20
	movre	%o6,	%o0,	%l5
	tgu	%icc,	0x6
	fands	%f9,	%f15,	%f5
	move	%xcc,	%i3,	%i5
	sir	0x0B14
	subc	%g5,	%i4,	%o1
	fnand	%f0,	%f24,	%f28
	mulscc	%o3,	0x135A,	%g3
	ldx	[%l7 + 0x50],	%o5
	movle	%xcc,	%o4,	%i0
	fbug	%fcc3,	loop_160
	nop
	setx	0x027EDE1E6144F940,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xCDEF244A1BEF3C03,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f12,	%f6
	taddcc	%o2,	%g2,	%g6
	fand	%f4,	%f0,	%f18
loop_160:
	nop
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l6
	nop
	fitos	%f8,	%f27
	fstox	%f27,	%f10
	fxtos	%f10,	%f10
	fmovdvc	%xcc,	%f23,	%f6
	addcc	%i1,	%i6,	%l4
	fpsub16	%f16,	%f22,	%f10
	fmovdcc	%xcc,	%f10,	%f24
	tvc	%xcc,	0x6
	bgu,pn	%xcc,	loop_161
	nop
	fitod	%f10,	%f26
	fdtox	%f26,	%f18
	edge32	%g4,	%i7,	%o7
	edge8ln	%l3,	%g7,	%l0
loop_161:
	fmovrdgz	%i2,	%f4,	%f12
	umul	%g1,	0x1D3D,	%l1
	edge32n	%o6,	%l2,	%o0
	edge32ln	%i3,	%i5,	%l5
	edge8n	%i4,	%g5,	%o1
	movgu	%icc,	%o3,	%g3
	add	%o4,	%i0,	%o5
	movge	%xcc,	%g2,	%g6
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%f0
	or	%o2,	%l6,	%i6
	edge32l	%i1,	%g4,	%i7
	fbue,a	%fcc3,	loop_162
	edge32	%o7,	%l4,	%l3
	fzeros	%f11
	tsubcc	%l0,	0x1E33,	%i2
loop_162:
	membar	0x65
	orcc	%g7,	%g1,	%o6
	array32	%l2,	%o0,	%l1
	array32	%i3,	%l5,	%i5
	flush	%l7 + 0x48
	sth	%i4,	[%l7 + 0x56]
	fmovsle	%xcc,	%f13,	%f14
	udivcc	%g5,	0x00B4,	%o1
	tvc	%xcc,	0x7
	fbl	%fcc3,	loop_163
	movn	%icc,	%o3,	%g3
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x7B] %asi,	%o4
loop_163:
	andcc	%i0,	%g2,	%o5
	edge8ln	%o2,	%g6,	%l6
	movl	%icc,	%i1,	%i6
	nop
	setx	loop_164,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%icc,	%i7,	%g4
	sdivx	%l4,	0x1F75,	%o7
	fpsub16	%f4,	%f30,	%f6
loop_164:
	nop
	setx loop_165, %l0, %l1
	jmpl %l1, %l0
	fbu	%fcc2,	loop_166
	add	%l3,	%g7,	%g1
	sll	%o6,	0x17,	%l2
loop_165:
	ldx	[%l7 + 0x38],	%o0
loop_166:
	edge16n	%l1,	%i2,	%i3
	fbul,a	%fcc0,	loop_167
	tsubcctv	%l5,	0x0978,	%i5
	orncc	%g5,	%i4,	%o3
	tgu	%icc,	0x5
loop_167:
	fbue,a	%fcc2,	loop_168
	nop
	setx	loop_169,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	lduh	[%l7 + 0x24],	%g3
	edge8l	%o4,	%o1,	%g2
loop_168:
	popc	%i0,	%o5
loop_169:
	edge32n	%o2,	%g6,	%i1
	movrgz	%l6,	0x383,	%i6
	fmovda	%icc,	%f19,	%f24
	udivx	%g4,	0x0134,	%l4
	fbug,a	%fcc1,	loop_170
	movre	%i7,	0x12E,	%l0
	nop
	setx	0x4D734C72059CE907,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x63C94BDE76B1F759,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f8,	%f28
	tn	%icc,	0x4
loop_170:
	movg	%xcc,	%o7,	%l3
	addc	%g1,	0x07B2,	%o6
	orncc	%l2,	0x15BB,	%o0
	sdivx	%g7,	0x129C,	%i2
	mova	%xcc,	%i3,	%l1
	fba,a	%fcc3,	loop_171
	fmovde	%icc,	%f20,	%f28
	movrgez	%l5,	%i5,	%g5
	bneg	loop_172
loop_171:
	add	%o3,	%i4,	%g3
	fmuld8sux16	%f20,	%f3,	%f16
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%o1
loop_172:
	fnot2s	%f5,	%f4
	movn	%icc,	%o4,	%i0
	edge16n	%g2,	%o2,	%o5
	nop
	setx	0x98E8CA6EE07493BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	membar	0x35
	ldsb	[%l7 + 0x0E],	%g6
	tsubcctv	%l6,	0x14B1,	%i6
	movcs	%xcc,	%i1,	%g4
	addc	%l4,	0x098E,	%i7
	movg	%xcc,	%l0,	%o7
	subc	%g1,	%l3,	%l2
	fxors	%f30,	%f19,	%f28
	fsrc2s	%f0,	%f12
	be,a	loop_173
	edge16	%o6,	%o0,	%i2
	nop
	fitos	%f7,	%f3
	fstox	%f3,	%f30
	tneg	%icc,	0x1
loop_173:
	alignaddr	%g7,	%l1,	%i3
	tvc	%icc,	0x5
	srlx	%i5,	0x1F,	%l5
	edge8ln	%g5,	%o3,	%i4
	call	loop_174
	brlez	%o1,	loop_175
	fmovrde	%g3,	%f4,	%f12
	nop
	setx	0x263F8EB664586E1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x9BC3B84FB6B66D14,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f30,	%f4
loop_174:
	movrgez	%o4,	0x262,	%g2
loop_175:
	tn	%icc,	0x2
	udiv	%i0,	0x0C71,	%o2
	nop
	set	0x18, %l6
	ldd	[%l7 + %l6],	%o4
	call	loop_176
	xnorcc	%g6,	%l6,	%i6
	srlx	%g4,	0x06,	%i1
	mova	%icc,	%l4,	%l0
loop_176:
	stw	%i7,	[%l7 + 0x4C]
	brz	%o7,	loop_177
	edge8l	%g1,	%l2,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f16,	%f8,	%f0
loop_177:
	srlx	%o0,	%l3,	%i2
	movle	%icc,	%l1,	%g7
	umulcc	%i5,	0x1C24,	%i3
	add	%g5,	%o3,	%l5
	srax	%o1,	0x0E,	%g3
	tsubcctv	%i4,	0x136C,	%g2
	brnz,a	%o4,	loop_178
	tl	%icc,	0x7
	edge8ln	%o2,	%o5,	%i0
	fmovsle	%xcc,	%f19,	%f0
loop_178:
	fnegd	%f12,	%f30
	andncc	%g6,	%i6,	%l6
	nop
	setx	loop_179,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%g4,	%i1
	movneg	%icc,	%l4,	%i7
	edge32ln	%o7,	%l0,	%g1
loop_179:
	bne,pn	%xcc,	loop_180
	movcc	%icc,	%l2,	%o0
	nop
	setx	0x8294849A386A1C50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x650A2359BC8FACB8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f0,	%f30
	nop
	setx	0x3058CE63,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
loop_180:
	fmovsle	%xcc,	%f5,	%f9
	sub	%o6,	%i2,	%l1
	fabsd	%f14,	%f4
	movg	%icc,	%l3,	%i5
	tcc	%xcc,	0x0
	edge16	%i3,	%g5,	%o3
	stw	%l5,	[%l7 + 0x1C]
	or	%g7,	%g3,	%o1
	fmul8x16	%f4,	%f4,	%f16
	tvc	%icc,	0x2
	fxor	%f6,	%f10,	%f24
	array32	%g2,	%i4,	%o2
	movleu	%icc,	%o4,	%o5
	bcs,a	loop_181
	movg	%xcc,	%i0,	%i6
	tle	%xcc,	0x1
	call	loop_182
loop_181:
	ldd	[%l7 + 0x08],	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f14,	%f10,	%f24
loop_182:
	fmovrsgz	%l6,	%f10,	%f16
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%i1
	fand	%f22,	%f12,	%f16
	xnorcc	%l4,	%o7,	%l0
	movgu	%xcc,	%i7,	%l2
	fbg,a	%fcc3,	loop_183
	move	%icc,	%o0,	%g1
	fbug	%fcc2,	loop_184
	movrgez	%i2,	%o6,	%l1
loop_183:
	nop
	setx	loop_185,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16ln	%l3,	%i5,	%g5
loop_184:
	ld	[%l7 + 0x28],	%f5
	nop
	setx	loop_186,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_185:
	fmovdvc	%icc,	%f17,	%f22
	brlez	%i3,	loop_187
	edge16ln	%l5,	%g7,	%g3
loop_186:
	nop
	fitod	%f12,	%f0
	fdtox	%f0,	%f22
	set	0x38, %i5
	lduwa	[%l7 + %i5] 0x18,	%o3
loop_187:
	bcc,a,pt	%xcc,	loop_188
	fmovrdgz	%g2,	%f18,	%f20
	set	0x62, %i6
	stha	%i4,	[%l7 + %i6] 0xe2
	membar	#Sync
loop_188:
	tpos	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x26, %i3
	sth	%o1,	[%l7 + %i3]
	bvs,pt	%icc,	loop_189
	andcc	%o2,	0x1F62,	%o4
	movle	%xcc,	%o5,	%i0
	fnot1s	%f9,	%f0
loop_189:
	orn	%g6,	%l6,	%i6
	fmovspos	%icc,	%f0,	%f23
	fbo	%fcc2,	loop_190
	srl	%i1,	%g4,	%l4
	movrgez	%o7,	%l0,	%i7
	umulcc	%l2,	%g1,	%o0
loop_190:
	tle	%icc,	0x4
	sub	%i2,	%o6,	%l1
	array16	%i5,	%l3,	%i3
	smul	%g5,	0x0B1B,	%g7
	bneg,a	loop_191
	array8	%l5,	%g3,	%o3
	sethi	0x0FDA,	%g2
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x40] %asi,	%o0
loop_191:
	te	%icc,	0x1
	alignaddrl	%i4,	%o2,	%o5
	udivcc	%i0,	0x0D57,	%o4
	fmovsvs	%xcc,	%f0,	%f26
	addccc	%g6,	%l6,	%i1
	edge16l	%i6,	%g4,	%o7
	srax	%l0,	0x0F,	%i7
	movre	%l4,	%l2,	%g1
	sir	0x15EA
	fbu	%fcc0,	loop_192
	fxors	%f22,	%f18,	%f3
	orn	%i2,	%o6,	%o0
	tleu	%xcc,	0x4
loop_192:
	movre	%l1,	%l3,	%i5
	ldsw	[%l7 + 0x0C],	%i3
	tvc	%icc,	0x2
	tcc	%xcc,	0x2
	fcmpgt32	%f10,	%f16,	%g7
	andncc	%l5,	%g5,	%o3
	subccc	%g3,	0x10AD,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i4,	%o2
	ldd	[%l7 + 0x08],	%f6
	ldsw	[%l7 + 0x54],	%o5
	brgz	%o1,	loop_193
	edge32ln	%i0,	%g6,	%l6
	tne	%icc,	0x7
	orn	%i1,	0x0C0A,	%o4
loop_193:
	movcc	%icc,	%i6,	%g4
	xnor	%l0,	%o7,	%i7
	sdiv	%l4,	0x0E71,	%l2
	bvc,pt	%icc,	loop_194
	alignaddrl	%g1,	%o6,	%o0
	brgz	%l1,	loop_195
	sir	0x01E9
loop_194:
	movvs	%xcc,	%i2,	%i5
	fmovdvs	%icc,	%f10,	%f5
loop_195:
	ldsw	[%l7 + 0x18],	%i3
	fblg	%fcc2,	loop_196
	bleu,a	%icc,	loop_197
	fbge,a	%fcc0,	loop_198
	fbu,a	%fcc3,	loop_199
loop_196:
	edge16	%g7,	%l5,	%g5
loop_197:
	ldx	[%l7 + 0x30],	%o3
loop_198:
	ldsw	[%l7 + 0x2C],	%g3
loop_199:
	movrgz	%l3,	0x2B3,	%i4
	edge16	%o2,	%g2,	%o1
	srax	%i0,	0x1A,	%o5
	nop
	fitod	%f4,	%f18
	fdtos	%f18,	%f29
	fornot2	%f10,	%f0,	%f2
	xnorcc	%g6,	%l6,	%i1
	add	%o4,	%g4,	%l0
	andn	%i6,	%o7,	%i7
	set	0x69, %g6
	ldsba	[%l7 + %g6] 0x15,	%l4
	fbl	%fcc3,	loop_200
	andcc	%g1,	0x039B,	%l2
	taddcc	%o0,	0x122D,	%l1
	brnz,a	%i2,	loop_201
loop_200:
	ld	[%l7 + 0x10],	%f29
	fexpand	%f6,	%f0
	orn	%o6,	0x12E9,	%i3
loop_201:
	bg,pt	%xcc,	loop_202
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc1,	loop_203
	fmovrslz	%g7,	%f24,	%f2
loop_202:
	bg,a	%xcc,	loop_204
	fbl	%fcc0,	loop_205
loop_203:
	mova	%xcc,	%i5,	%g5
	tn	%icc,	0x1
loop_204:
	subc	%o3,	%g3,	%l3
loop_205:
	edge32ln	%i4,	%o2,	%g2
	sra	%o1,	0x05,	%l5
	fbu,a	%fcc2,	loop_206
	xorcc	%i0,	0x1D7C,	%o5
	srax	%g6,	%i1,	%l6
	fbn,a	%fcc1,	loop_207
loop_206:
	fandnot1	%f30,	%f8,	%f14
	wr	%g0,	0x80,	%asi
	stha	%o4,	[%l7 + 0x22] %asi
loop_207:
	fbge	%fcc3,	loop_208
	mulx	%l0,	%i6,	%g4
	movne	%icc,	%o7,	%l4
	fsrc1	%f20,	%f0
loop_208:
	nop
	set	0x13, %l5
	ldsba	[%l7 + %l5] 0x10,	%i7
	ldx	[%l7 + 0x30],	%g1
	movpos	%icc,	%o0,	%l2
	fmovd	%f6,	%f18
	movneg	%xcc,	%i2,	%l1
	nop
	fitos	%f13,	%f8
	fstoi	%f8,	%f11
	ldsb	[%l7 + 0x61],	%o6
	udiv	%i3,	0x13E1,	%i5
	movvs	%xcc,	%g5,	%g7
	nop
	setx	0xB886334F607BFE96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	tvs	%icc,	0x1
	udivx	%o3,	0x0987,	%l3
	nop
	setx	loop_209,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%g3,	0x0C0D,	%i4
	movre	%o2,	0x38C,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_209:
	srlx	%l5,	%i0,	%o5
	fabsd	%f28,	%f0
	fmovsl	%icc,	%f19,	%f15
	brnz,a	%g6,	loop_210
	pdist	%f8,	%f22,	%f20
	move	%xcc,	%o1,	%i1
	xorcc	%o4,	0x0F03,	%l0
loop_210:
	nop
	setx	0xA4F1F911A06A94BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	movrlez	%l6,	%g4,	%i6
	array8	%l4,	%o7,	%g1
	set	0x70, %l1
	ldxa	[%l7 + %l1] 0x89,	%i7
	movrne	%l2,	%i2,	%o0
	alignaddr	%l1,	%o6,	%i3
	array16	%i5,	%g7,	%o3
	edge32ln	%l3,	%g3,	%g5
	bn,a	%icc,	loop_211
	nop
	fitod	%f10,	%f4
	fdtox	%f4,	%f2
	sethi	0x16FD,	%i4
	popc	0x1CDB,	%g2
loop_211:
	fbge,a	%fcc2,	loop_212
	fblg,a	%fcc1,	loop_213
	tneg	%xcc,	0x7
	nop
	fitos	%f3,	%f11
loop_212:
	bcc,a,pt	%icc,	loop_214
loop_213:
	nop
	setx	0xE8C281D305AA3BCE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x0701D451FA31B97E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f16,	%f4
	membar	0x30
	bg	loop_215
loop_214:
	be,a,pt	%xcc,	loop_216
	addc	%o2,	0x16D8,	%i0
	fmovscc	%icc,	%f2,	%f3
loop_215:
	fba,a	%fcc1,	loop_217
loop_216:
	addccc	%l5,	%o5,	%g6
	movne	%xcc,	%i1,	%o4
	nop
	fitod	%f21,	%f2
loop_217:
	movpos	%icc,	%o1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g4,	%i6
	fpackfix	%f30,	%f29
	movre	%l4,	%o7,	%g1
	movneg	%icc,	%i7,	%l0
	tsubcctv	%i2,	%o0,	%l1
	udivcc	%o6,	0x1AEC,	%i3
	prefetch	[%l7 + 0x54],	 0x0
	tsubcctv	%i5,	0x0A6B,	%g7
	ldstub	[%l7 + 0x1A],	%l2
	mova	%icc,	%l3,	%g3
	bge	loop_218
	xnor	%o3,	%g5,	%i4
	movle	%icc,	%g2,	%o2
	movneg	%xcc,	%i0,	%o5
loop_218:
	fcmpne16	%f10,	%f22,	%g6
	fnegs	%f28,	%f28
	movpos	%icc,	%i1,	%l5
	wr	%g0,	0x80,	%asi
	stwa	%o4,	[%l7 + 0x6C] %asi
	st	%f4,	[%l7 + 0x78]
	tsubcctv	%l6,	0x1436,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x22, %o0
	lduha	[%l7 + %o0] 0x15,	%i6
	stbar
	xorcc	%l4,	%o1,	%o7
	sll	%g1,	%i7,	%l0
	movle	%xcc,	%o0,	%l1
	movn	%icc,	%i2,	%o6
	fandnot1	%f18,	%f10,	%f10
	tcc	%xcc,	0x4
	fmuld8ulx16	%f23,	%f24,	%f24
	set	0x0, %i0
	ldxa	[%g0 + %i0] 0x58,	%i5
	fbn	%fcc3,	loop_219
	umul	%g7,	%i3,	%l3
	edge32ln	%l2,	%g3,	%g5
	ldub	[%l7 + 0x30],	%i4
loop_219:
	brgz,a	%o3,	loop_220
	popc	0x0300,	%o2
	subc	%i0,	%g2,	%o5
	fmuld8sux16	%f29,	%f29,	%f26
loop_220:
	edge8l	%g6,	%i1,	%o4
	fbge	%fcc2,	loop_221
	movleu	%xcc,	%l5,	%l6
	nop
	setx	0xCC635506,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x03F77385,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f31,	%f9
	xnorcc	%i6,	0x19E2,	%g4
loop_221:
	array32	%l4,	%o7,	%g1
	edge16n	%i7,	%o1,	%l0
	fand	%f8,	%f20,	%f14
	edge32l	%l1,	%o0,	%i2
	tsubcctv	%i5,	%g7,	%o6
	edge16	%i3,	%l2,	%g3
	movleu	%icc,	%l3,	%i4
	tg	%xcc,	0x4
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f10
	fxtod	%f10,	%f28
	orcc	%o3,	%g5,	%o2
	tpos	%icc,	0x5
	nop
	setx	0xC92E1850,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xBD7BD636,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f28,	%f29
	ta	%icc,	0x0
	edge8n	%i0,	%g2,	%o5
	tne	%icc,	0x5
	edge32	%i1,	%o4,	%l5
	xnorcc	%l6,	0x1E71,	%g6
	udivcc	%i6,	0x1F10,	%l4
	flush	%l7 + 0x6C
	edge16	%g4,	%g1,	%o7
	xnorcc	%o1,	%l0,	%l1
	bcs,a,pt	%xcc,	loop_222
	edge32	%i7,	%i2,	%o0
	fmuld8ulx16	%f8,	%f6,	%f30
	membar	0x51
loop_222:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tpos	%xcc,	0x7
	orncc	%g7,	%i5,	%i3
	edge16	%l2,	%o6,	%g3
	brlz	%i4,	loop_223
	array8	%o3,	%g5,	%l3
	fpack16	%f30,	%f12
	tcs	%icc,	0x2
loop_223:
	andcc	%o2,	%g2,	%i0
	tcc	%icc,	0x4
	movge	%icc,	%i1,	%o4
	bn	%icc,	loop_224
	smulcc	%l5,	%o5,	%l6
	sir	0x05A3
	umulcc	%g6,	%l4,	%i6
loop_224:
	fmovdne	%xcc,	%f4,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x0
	fmovrse	%g4,	%f2,	%f14
	ldstub	[%l7 + 0x56],	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o1,	%g1
	movgu	%xcc,	%l0,	%l1
	mulscc	%i2,	0x0F67,	%o0
	fbul,a	%fcc2,	loop_225
	fmovdcs	%xcc,	%f23,	%f28
	xnor	%i7,	0x151A,	%i5
	tleu	%icc,	0x7
loop_225:
	add	%i3,	0x1DD7,	%l2
	edge32l	%g7,	%g3,	%i4
	mulx	%o3,	0x18EB,	%g5
	movre	%o6,	0x383,	%l3
	movvs	%xcc,	%g2,	%o2
	fpack32	%f2,	%f14,	%f2
	movleu	%icc,	%i1,	%i0
	movrgez	%o4,	%l5,	%o5
	sdivcc	%l6,	0x0171,	%g6
	edge32l	%l4,	%i6,	%o7
	fmovrslz	%o1,	%f3,	%f5
	edge32l	%g4,	%l0,	%g1
	fbe	%fcc2,	loop_226
	fmovscs	%icc,	%f28,	%f25
	tcs	%icc,	0x7
	udivcc	%i2,	0x1119,	%l1
loop_226:
	xnorcc	%o0,	0x1228,	%i5
	mulscc	%i7,	%i3,	%g7
	fbne,a	%fcc2,	loop_227
	or	%l2,	%i4,	%g3
	movn	%xcc,	%g5,	%o6
	movcc	%xcc,	%o3,	%g2
loop_227:
	edge16n	%o2,	%i1,	%i0
	set	0x14, %l0
	sta	%f23,	[%l7 + %l0] 0x81
	udivcc	%o4,	0x1CB5,	%l5
	orcc	%o5,	0x0E8F,	%l3
	movgu	%xcc,	%g6,	%l6
	st	%f11,	[%l7 + 0x6C]
	fmovdpos	%icc,	%f15,	%f6
	bge,a	loop_228
	movneg	%xcc,	%i6,	%l4
	bpos,a	loop_229
	be,pn	%xcc,	loop_230
loop_228:
	udivcc	%o7,	0x12B4,	%g4
	array16	%o1,	%g1,	%l0
loop_229:
	tgu	%icc,	0x5
loop_230:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%i2
	nop
	fitos	%f2,	%f28
	fstoi	%f28,	%f19
	tg	%xcc,	0x0
	mulscc	%l1,	%o0,	%i7
	and	%i3,	0x1891,	%i5
	nop
	set	0x73, %g7
	ldsb	[%l7 + %g7],	%l2
	fbn	%fcc2,	loop_231
	movle	%xcc,	%g7,	%g3
	nop
	set	0x74, %i2
	lduw	[%l7 + %i2],	%g5
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f22
loop_231:
	subcc	%o6,	0x171A,	%i4
	tsubcc	%o3,	%o2,	%i1
	stx	%g2,	[%l7 + 0x60]
	fmovdg	%icc,	%f3,	%f18
	udivx	%o4,	0x1BB4,	%l5
	movrne	%o5,	0x10B,	%l3
	fble	%fcc0,	loop_232
	sra	%g6,	0x1B,	%l6
	lduh	[%l7 + 0x5E],	%i6
	movrlez	%l4,	%i0,	%g4
loop_232:
	movrgz	%o1,	0x086,	%g1
	movl	%xcc,	%o7,	%l0
	tcc	%xcc,	0x1
	movle	%xcc,	%l1,	%o0
	fmul8x16	%f30,	%f16,	%f22
	udiv	%i2,	0x1A26,	%i3
	fandnot2	%f12,	%f22,	%f6
	nop
	fitod	%f12,	%f2
	fdtos	%f2,	%f24
	mulscc	%i5,	0x1294,	%i7
	nop
	setx	0x763B67A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f13
	bvs,a,pt	%icc,	loop_233
	movvs	%icc,	%l2,	%g3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
loop_233:
	fmovsle	%xcc,	%f17,	%f1
	srlx	%g7,	0x00,	%o6
	nop
	setx	loop_234,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	and	%o3,	%i4,	%o2
	fmovrdlez	%g2,	%f2,	%f30
	tle	%icc,	0x1
loop_234:
	edge32	%o4,	%i1,	%o5
	andn	%l5,	0x12D2,	%g6
	fsrc2	%f8,	%f30
	fpsub32s	%f12,	%f8,	%f13
	brgez,a	%l3,	loop_235
	movpos	%icc,	%l6,	%i6
	nop
	setx	0xF482A8B7A1E782C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x66F6D2248962D8CA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f12,	%f30
	movn	%xcc,	%i0,	%l4
loop_235:
	tvs	%icc,	0x6
	edge32l	%g4,	%g1,	%o7
	edge16	%o1,	%l0,	%l1
	movre	%i2,	%o0,	%i5
	nop
	setx	loop_236,	%l0,	%l1
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
	fsrc1	%f4,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_236:
	addcc	%i3,	%l2,	%g3
	tl	%icc,	0x3
	xor	%g5,	0x08BF,	%g7
	fmovs	%f25,	%f13
	std	%f0,	[%l7 + 0x18]
	sra	%o6,	0x13,	%o3
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x04,	%i4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x18] %asi,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i7,	0x110E,	%o2
	subccc	%g2,	0x14C9,	%o4
	sll	%o5,	%i1,	%g6
	andncc	%l3,	%l6,	%l5
	movvc	%icc,	%i0,	%l4
	tcc	%icc,	0x4
	fpadd16s	%f21,	%f0,	%f4
	andn	%i6,	0x168E,	%g1
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%g4
	tpos	%xcc,	0x2
	orn	%o7,	%l0,	%l1
	srl	%i2,	0x0B,	%o0
	set	0x10, %l3
	prefetcha	[%l7 + %l3] 0x88,	 0x0
	edge16n	%i3,	%o1,	%l2
	movpos	%xcc,	%g5,	%g3
	tvs	%icc,	0x3
	xnorcc	%o6,	%g7,	%i4
	fmovsneg	%icc,	%f30,	%f23
	tsubcctv	%i7,	%o3,	%o2
	tl	%xcc,	0x7
	sth	%g2,	[%l7 + 0x22]
	mova	%xcc,	%o5,	%i1
	bcs,a,pt	%xcc,	loop_237
	xnorcc	%o4,	0x0578,	%g6
	or	%l3,	%l5,	%i0
	addc	%l4,	%i6,	%l6
loop_237:
	tg	%icc,	0x7
	fmovscs	%icc,	%f22,	%f0
	set	0x34, %i7
	swapa	[%l7 + %i7] 0x18,	%g4
	stw	%g1,	[%l7 + 0x18]
	sdivcc	%l0,	0x0413,	%o7
	movrlz	%l1,	0x0DE,	%i2
	umul	%i5,	0x16FB,	%i3
	stbar
	bvs,pt	%icc,	loop_238
	ble	%icc,	loop_239
	fmovsn	%xcc,	%f16,	%f29
	tvc	%icc,	0x2
loop_238:
	bleu	loop_240
loop_239:
	movge	%xcc,	%o0,	%l2
	tvs	%icc,	0x0
	fcmpne32	%f28,	%f22,	%g5
loop_240:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%o1,	%g3
	fmul8sux16	%f0,	%f28,	%f2
	st	%f31,	[%l7 + 0x78]
	srax	%o6,	%g7,	%i4
	fxors	%f11,	%f6,	%f5
	udivcc	%o3,	0x18A4,	%i7
	and	%g2,	0x1F18,	%o5
	edge16l	%i1,	%o4,	%o2
	fandnot1s	%f18,	%f4,	%f16
	add	%l3,	%g6,	%l5
	fbule,a	%fcc0,	loop_241
	edge32l	%i0,	%i6,	%l6
	fmovdvc	%xcc,	%f17,	%f19
	set	0x34, %o5
	lduwa	[%l7 + %o5] 0x0c,	%l4
loop_241:
	tgu	%icc,	0x3
	edge8ln	%g4,	%l0,	%g1
	movvs	%icc,	%l1,	%o7
	lduw	[%l7 + 0x38],	%i5
	sth	%i2,	[%l7 + 0x46]
	bg,a,pt	%icc,	loop_242
	fmovsg	%icc,	%f26,	%f22
	fmovdle	%xcc,	%f10,	%f1
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x40] %asi,	%o0
loop_242:
	umulcc	%i3,	%l2,	%o1
	popc	%g3,	%o6
	fbu,a	%fcc3,	loop_243
	fandnot2s	%f18,	%f16,	%f11
	fmul8sux16	%f10,	%f28,	%f14
	fmovsne	%icc,	%f24,	%f6
loop_243:
	tvs	%icc,	0x0
	move	%icc,	%g7,	%i4
	xnorcc	%g5,	0x0B76,	%i7
	array32	%g2,	%o3,	%o5
	bne,a,pt	%xcc,	loop_244
	fmovd	%f26,	%f20
	bcs,a	%icc,	loop_245
	ldstub	[%l7 + 0x09],	%i1
loop_244:
	tn	%icc,	0x6
	srl	%o2,	0x01,	%l3
loop_245:
	fandnot2s	%f6,	%f3,	%f22
	fcmpgt32	%f4,	%f24,	%o4
	edge16l	%g6,	%i0,	%i6
	sll	%l6,	%l5,	%l4
	edge16n	%l0,	%g4,	%l1
	orcc	%g1,	0x13A5,	%i5
	andcc	%o7,	0x0B56,	%i2
	orcc	%o0,	%i3,	%o1
	mulscc	%g3,	%o6,	%g7
	tpos	%icc,	0x6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%l2
	movpos	%icc,	%i4,	%i7
	fcmpne16	%f28,	%f4,	%g5
	tg	%icc,	0x4
	sethi	0x10E8,	%g2
	edge16	%o5,	%i1,	%o2
	fmovrse	%o3,	%f12,	%f9
	tvs	%xcc,	0x5
	xnor	%l3,	0x0D87,	%g6
	or	%i0,	%o4,	%i6
	subc	%l6,	%l5,	%l0
	stbar
	ldd	[%l7 + 0x48],	%l4
	xnorcc	%l1,	%g1,	%g4
	popc	0x0329,	%i5
	fmovdle	%icc,	%f8,	%f14
	set	0x1C, %o1
	ldswa	[%l7 + %o1] 0x11,	%o7
	sdivcc	%o0,	0x011F,	%i2
	edge16n	%i3,	%g3,	%o1
	fbo	%fcc3,	loop_246
	edge8	%g7,	%l2,	%o6
	edge8ln	%i4,	%g5,	%i7
	tcs	%xcc,	0x3
loop_246:
	te	%xcc,	0x3
	tsubcctv	%o5,	0x182C,	%i1
	tge	%icc,	0x5
	tleu	%icc,	0x5
	edge16n	%o2,	%o3,	%l3
	fmovrde	%g2,	%f4,	%f10
	tl	%icc,	0x4
	set	0x4B, %g5
	stba	%i0,	[%l7 + %g5] 0xe2
	membar	#Sync
	set	0x0C, %o3
	swapa	[%l7 + %o3] 0x18,	%o4
	membar	0x48
	tleu	%icc,	0x7
	fnot1s	%f24,	%f5
	tgu	%xcc,	0x6
	fmovse	%xcc,	%f26,	%f16
	movge	%icc,	%i6,	%l6
	ta	%icc,	0x6
	taddcc	%l5,	%l0,	%g6
	mulx	%l4,	0x11D5,	%l1
	movge	%icc,	%g4,	%g1
	movle	%xcc,	%i5,	%o7
	smul	%o0,	%i2,	%i3
	bl,a	%xcc,	loop_247
	taddcc	%o1,	%g7,	%g3
	ldsh	[%l7 + 0x08],	%l2
	membar	0x1A
loop_247:
	nop
	set	0x29, %g4
	ldub	[%l7 + %g4],	%i4
	fmuld8sux16	%f6,	%f20,	%f0
	sra	%g5,	0x0B,	%i7
	tgu	%icc,	0x7
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x24] %asi,	%o5
	brlez,a	%o6,	loop_248
	smulcc	%o2,	%o3,	%i1
	array32	%g2,	%l3,	%o4
	nop
	set	0x28, %g3
	stw	%i6,	[%l7 + %g3]
loop_248:
	brgz	%l6,	loop_249
	smul	%l5,	0x1F7E,	%l0
	edge8l	%i0,	%g6,	%l4
	bcs,a	loop_250
loop_249:
	fones	%f19
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g4,	%g1
loop_250:
	tle	%icc,	0x5
	tcs	%xcc,	0x3
	fmovd	%f30,	%f30
	movrlz	%i5,	%l1,	%o7
	nop
	fitos	%f1,	%f27
	fstod	%f27,	%f28
	tgu	%icc,	0x7
	fnand	%f18,	%f24,	%f6
	tneg	%xcc,	0x4
	bg	loop_251
	smul	%o0,	%i3,	%i2
	umul	%o1,	%g3,	%l2
	nop
	set	0x18, %l4
	ldsw	[%l7 + %l4],	%i4
loop_251:
	sdivx	%g7,	0x0139,	%g5
	taddcctv	%i7,	0x0653,	%o5
	srax	%o6,	%o3,	%o2
	tcs	%xcc,	0x6
	fmovd	%f16,	%f6
	set	0x48, %o4
	stwa	%g2,	[%l7 + %o4] 0x88
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f14
	fxtod	%f14,	%f14
	movcc	%xcc,	%i1,	%l3
	movleu	%icc,	%i6,	%l6
	prefetch	[%l7 + 0x38],	 0x3
	movrlez	%o4,	0x1E3,	%l5
	orn	%i0,	%l0,	%g6
	edge32n	%g4,	%g1,	%i5
	nop
	fitos	%f19,	%f27
	fmovsl	%xcc,	%f6,	%f18
	srax	%l4,	0x16,	%o7
	mulx	%l1,	0x11AA,	%o0
	andcc	%i3,	%i2,	%g3
	st	%f1,	[%l7 + 0x78]
	movrne	%o1,	%l2,	%i4
	udiv	%g5,	0x106F,	%g7
	alignaddrl	%o5,	%o6,	%i7
	bleu,pt	%icc,	loop_252
	stb	%o3,	[%l7 + 0x74]
	udivcc	%o2,	0x1E47,	%g2
	bcc,a,pn	%icc,	loop_253
loop_252:
	edge16ln	%i1,	%i6,	%l3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0B] %asi,	%o4
loop_253:
	movrne	%l6,	0x209,	%i0
	movn	%xcc,	%l5,	%g6
	fbule,a	%fcc0,	loop_254
	tcs	%xcc,	0x1
	edge8l	%g4,	%l0,	%i5
	fmovrdgez	%g1,	%f28,	%f14
loop_254:
	subccc	%l4,	0x0DEC,	%o7
	smul	%l1,	0x1019,	%o0
	movl	%xcc,	%i3,	%i2
	mulx	%o1,	0x0976,	%g3
	andcc	%i4,	0x0B5C,	%l2
	udivcc	%g5,	0x062D,	%g7
	udivx	%o6,	0x1D79,	%o5
	orn	%o3,	%i7,	%o2
	srax	%i1,	0x1C,	%g2
	fpack32	%f30,	%f14,	%f16
	stx	%l3,	[%l7 + 0x78]
	smul	%o4,	0x092A,	%l6
	sll	%i0,	0x03,	%i6
	sll	%g6,	%g4,	%l5
	fcmple16	%f22,	%f24,	%i5
	fmovsleu	%xcc,	%f20,	%f28
	array8	%g1,	%l0,	%l4
	tvs	%icc,	0x0
	movcc	%icc,	%o7,	%o0
	movn	%icc,	%i3,	%l1
	andcc	%o1,	0x0BC0,	%i2
	tle	%icc,	0x3
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x24] %asi,	%g3
	fmovrdne	%l2,	%f10,	%f12
	movrgez	%g5,	%g7,	%i4
	nop
	fitos	%f3,	%f23
	fstod	%f23,	%f8
	movgu	%icc,	%o5,	%o3
	tl	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o6,	%o2
	xor	%i1,	0x0673,	%g2
	brz,a	%i7,	loop_255
	ld	[%l7 + 0x08],	%f9
	subcc	%o4,	0x1597,	%l3
	alignaddrl	%i0,	%l6,	%i6
loop_255:
	sir	0x1A56
	sethi	0x0EA0,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0888,	%g4
	addcc	%i5,	%l5,	%g1
	xnorcc	%l4,	0x1669,	%l0
	fmovdne	%icc,	%f25,	%f3
	set	0x10, %o6
	stxa	%o7,	[%l7 + %o6] 0x2f
	membar	#Sync
	pdist	%f30,	%f4,	%f22
	ldd	[%l7 + 0x10],	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o0,	%l1,	%i3
	xnorcc	%i2,	0x0731,	%g3
	movne	%xcc,	%l2,	%o1
	mulx	%g7,	%g5,	%o5
	fbne,a	%fcc3,	loop_256
	taddcctv	%o3,	%i4,	%o2
	stx	%o6,	[%l7 + 0x40]
	fblg,a	%fcc1,	loop_257
loop_256:
	subc	%g2,	%i7,	%o4
	movrne	%i1,	%i0,	%l3
	movcc	%xcc,	%l6,	%i6
loop_257:
	fmovrdlez	%g6,	%f16,	%f2
	stw	%g4,	[%l7 + 0x08]
	fmovsleu	%icc,	%f20,	%f4
	array8	%l5,	%i5,	%l4
	tsubcctv	%g1,	0x0F19,	%l0
	brgez	%o0,	loop_258
	edge8l	%o7,	%l1,	%i2
	fble,a	%fcc2,	loop_259
	fbule	%fcc3,	loop_260
loop_258:
	tn	%icc,	0x7
	ta	%icc,	0x3
loop_259:
	or	%g3,	0x1932,	%i3
loop_260:
	fbo	%fcc3,	loop_261
	fnegs	%f4,	%f10
	or	%l2,	%g7,	%o1
	fmovsg	%xcc,	%f19,	%f21
loop_261:
	fpack32	%f24,	%f22,	%f26
	andncc	%o5,	%g5,	%i4
	orn	%o3,	0x065C,	%o6
	fbuge	%fcc1,	loop_262
	fmovsneg	%icc,	%f12,	%f20
	subc	%o2,	0x03BA,	%i7
	umul	%g2,	0x1B0E,	%o4
loop_262:
	taddcctv	%i1,	0x09DA,	%i0
	srl	%l6,	%l3,	%i6
	sdivx	%g6,	0x16C3,	%l5
	umulcc	%g4,	%l4,	%g1
	movl	%icc,	%i5,	%o0
	ldx	[%l7 + 0x18],	%l0
	udiv	%l1,	0x0C1C,	%i2
	fmovd	%f18,	%f6
	set	0x34, %g2
	lda	[%l7 + %g2] 0x10,	%f23
	fba,a	%fcc0,	loop_263
	movpos	%icc,	%o7,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a,pt	%icc,	loop_264
loop_263:
	tpos	%xcc,	0x5
	edge32ln	%i3,	%l2,	%g7
	tleu	%icc,	0x3
loop_264:
	and	%o1,	%o5,	%i4
	sdivx	%o3,	0x172E,	%o6
	stx	%o2,	[%l7 + 0x70]
	sll	%g5,	%i7,	%g2
	subc	%i1,	0x1998,	%i0
	fones	%f23
	bvs,a,pn	%icc,	loop_265
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x2C],	 0x2
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x24] %asi,	%o4
loop_265:
	tsubcctv	%l3,	0x1236,	%l6
	fmul8ulx16	%f16,	%f30,	%f24
	or	%i6,	%l5,	%g6
	mova	%xcc,	%g4,	%g1
	popc	%l4,	%i5
	udiv	%o0,	0x09A7,	%l1
	fmovdvs	%icc,	%f15,	%f11
	fpadd16s	%f20,	%f13,	%f26
	fpsub16	%f16,	%f10,	%f14
	be	%icc,	loop_266
	movrne	%l0,	0x3DB,	%i2
	set	0x6C, %i4
	lduwa	[%l7 + %i4] 0x80,	%g3
loop_266:
	tgu	%icc,	0x7
	edge8ln	%o7,	%l2,	%g7
	sll	%o1,	%o5,	%i4
	movle	%xcc,	%i3,	%o3
	movl	%xcc,	%o2,	%o6
	fmul8x16au	%f0,	%f15,	%f26
	srl	%g5,	0x10,	%g2
	or	%i7,	0x15D1,	%i0
	tsubcc	%o4,	%i1,	%l6
	fxor	%f28,	%f8,	%f0
	andncc	%i6,	%l5,	%l3
	fxors	%f30,	%f19,	%f31
	call	loop_267
	tne	%xcc,	0x0
	nop
	setx	loop_268,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%icc,	0x3
loop_267:
	subccc	%g6,	%g1,	%g4
	nop
	fitos	%f5,	%f24
	fstod	%f24,	%f24
loop_268:
	prefetch	[%l7 + 0x08],	 0x1
	fmovrse	%l4,	%f5,	%f1
	movg	%xcc,	%i5,	%o0
	brgez,a	%l1,	loop_269
	fbl	%fcc3,	loop_270
	umul	%i2,	0x03C5,	%l0
	xorcc	%g3,	0x0B89,	%l2
loop_269:
	fmovscs	%xcc,	%f8,	%f14
loop_270:
	bneg,a,pt	%xcc,	loop_271
	sll	%o7,	%o1,	%o5
	movleu	%icc,	%g7,	%i4
	movneg	%icc,	%o3,	%o2
loop_271:
	andn	%i3,	%o6,	%g2
	swap	[%l7 + 0x24],	%i7
	mulx	%i0,	%g5,	%o4
	sllx	%l6,	0x1A,	%i6
	fnands	%f25,	%f13,	%f1
	brgez	%i1,	loop_272
	fmovrdlz	%l3,	%f12,	%f2
	membar	0x5B
	movrne	%g6,	%l5,	%g4
loop_272:
	alignaddr	%g1,	%i5,	%o0
	andncc	%l1,	%l4,	%i2
	stx	%g3,	[%l7 + 0x08]
	nop
	setx	0xACD0E150,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x341B79C6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f21,	%f22
	movleu	%xcc,	%l2,	%o7
	fcmple32	%f22,	%f14,	%o1
	umulcc	%o5,	0x1F19,	%l0
	udivx	%g7,	0x0CF3,	%o3
	brgz	%o2,	loop_273
	fcmpne16	%f2,	%f2,	%i4
	nop
	setx	0xB87CF316,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xFD1DC5C7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f14,	%f14
	srl	%o6,	%g2,	%i7
loop_273:
	fmovscs	%icc,	%f0,	%f1
	edge32n	%i3,	%i0,	%o4
	bleu,a,pn	%icc,	loop_274
	fbn	%fcc0,	loop_275
	ta	%icc,	0x7
	set	0x39, %i1
	lduba	[%l7 + %i1] 0x88,	%g5
loop_274:
	movneg	%xcc,	%l6,	%i1
loop_275:
	tne	%icc,	0x1
	movl	%icc,	%i6,	%g6
	xor	%l3,	%g4,	%g1
	movcs	%icc,	%i5,	%o0
	stb	%l1,	[%l7 + 0x28]
	sth	%l4,	[%l7 + 0x0E]
	tge	%icc,	0x1
	movvs	%xcc,	%l5,	%i2
	set	0x0E, %o2
	ldsba	[%l7 + %o2] 0x14,	%g3
	tcc	%xcc,	0x3
	xnorcc	%o7,	%l2,	%o5
	fabsd	%f16,	%f14
	fandnot1s	%f26,	%f5,	%f31
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	edge8l	%l0,	%o1,	%o3
	movcc	%xcc,	%g7,	%o2
	andn	%i4,	0x1876,	%g2
	ba,a,pt	%xcc,	loop_276
	mulx	%i7,	0x1D56,	%i3
	tl	%xcc,	0x2
	xor	%i0,	0x032F,	%o4
loop_276:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x80,	%o6,	%l6
	orn	%i1,	0x083C,	%g5
	tvs	%icc,	0x2
	fmovsl	%icc,	%f1,	%f9
	subcc	%i6,	0x0454,	%g6
	movrlez	%l3,	%g4,	%i5
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f10,	%f2,	%f24
	or	%g1,	0x0C4D,	%l1
	edge16	%o0,	%l4,	%i2
	brgez,a	%g3,	loop_277
	fble,a	%fcc3,	loop_278
	tl	%xcc,	0x3
	tg	%icc,	0x4
loop_277:
	ld	[%l7 + 0x08],	%f14
loop_278:
	edge8ln	%l5,	%l2,	%o7
	fsrc2	%f26,	%f6
	bcc,a,pt	%icc,	loop_279
	orcc	%o5,	0x1125,	%l0
	sdivx	%o3,	0x02E4,	%o1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g7,	%o2
loop_279:
	udivcc	%i4,	0x1F81,	%i7
	fmuld8sux16	%f0,	%f26,	%f10
	sdivx	%i3,	0x0FAD,	%i0
	ba	%xcc,	loop_280
	movgu	%xcc,	%o4,	%g2
	movvs	%xcc,	%l6,	%i1
	movcs	%xcc,	%o6,	%g5
loop_280:
	fone	%f6
	ba,pn	%icc,	loop_281
	ld	[%l7 + 0x08],	%f18
	fcmpgt32	%f28,	%f24,	%i6
	taddcctv	%l3,	%g6,	%i5
loop_281:
	edge8	%g1,	%l1,	%o0
	edge8l	%g4,	%i2,	%l4
	edge8n	%l5,	%l2,	%o7
	array16	%g3,	%o5,	%l0
	fbuge,a	%fcc2,	loop_282
	nop
	set	0x30, %l6
	ldd	[%l7 + %l6],	%f4
	sdivx	%o3,	0x12F8,	%g7
	move	%xcc,	%o1,	%i4
loop_282:
	bvs,a,pt	%icc,	loop_283
	bge,a,pt	%icc,	loop_284
	movleu	%xcc,	%o2,	%i7
	fmovdvc	%icc,	%f3,	%f27
loop_283:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_284:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f0,	[%l7 + 0x64] %asi
	stx	%i3,	[%l7 + 0x08]
	movrne	%i0,	0x167,	%o4
	movpos	%icc,	%g2,	%i1
	fmuld8ulx16	%f21,	%f18,	%f16
	udivx	%l6,	0x01F7,	%g5
	movre	%o6,	0x065,	%i6
	tge	%xcc,	0x7
	srlx	%g6,	0x02,	%i5
	fbg	%fcc2,	loop_285
	nop
	set	0x10, %i5
	lduh	[%l7 + %i5],	%l3
	fmovdvs	%icc,	%f16,	%f19
	fmovdvs	%icc,	%f25,	%f27
loop_285:
	movrgz	%l1,	%g1,	%g4
	fpadd16s	%f7,	%f28,	%f0
	xor	%i2,	0x1CE8,	%l4
	stw	%l5,	[%l7 + 0x40]
	fxor	%f18,	%f12,	%f22
	tleu	%icc,	0x3
	tvc	%icc,	0x4
	bgu,pt	%xcc,	loop_286
	movneg	%xcc,	%l2,	%o7
	taddcctv	%g3,	%o5,	%l0
	set	0x58, %i6
	ldswa	[%l7 + %i6] 0x0c,	%o0
loop_286:
	ba,a	%icc,	loop_287
	edge8ln	%o3,	%o1,	%i4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x43] %asi,	%o2
loop_287:
	tgu	%icc,	0x7
	sth	%i7,	[%l7 + 0x76]
	tpos	%icc,	0x5
	edge8n	%i3,	%g7,	%i0
	and	%g2,	%i1,	%l6
	srax	%o4,	0x07,	%g5
	udivx	%i6,	0x19B6,	%g6
	umulcc	%o6,	%l3,	%i5
	movgu	%icc,	%l1,	%g1
	fbue	%fcc3,	loop_288
	nop
	setx	loop_289,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%i2,	0x1D42,	%g4
	tg	%icc,	0x6
loop_288:
	fmul8sux16	%f0,	%f4,	%f8
loop_289:
	movrgez	%l4,	0x1FF,	%l2
	movl	%icc,	%o7,	%g3
	edge16ln	%l5,	%l0,	%o0
	movle	%icc,	%o5,	%o3
	sll	%i4,	0x04,	%o1
	fcmpgt32	%f14,	%f26,	%o2
	taddcc	%i3,	0x0DA7,	%g7
	set	0x50, %i3
	stxa	%i7,	[%l7 + %i3] 0x18
	edge8ln	%i0,	%i1,	%g2
	array8	%o4,	%g5,	%i6
	addcc	%g6,	%o6,	%l6
	nop
	setx	0x826902537C330FDA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xA116F12C7A658F3C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f22,	%f4
	brgez,a	%l3,	loop_290
	ld	[%l7 + 0x68],	%f31
	movle	%xcc,	%l1,	%g1
	bcs,pn	%xcc,	loop_291
loop_290:
	nop
	setx	0x6BE568A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xEC5E340F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f26,	%f10
	tvs	%xcc,	0x6
	fmovrse	%i5,	%f2,	%f27
loop_291:
	bleu,pt	%xcc,	loop_292
	xor	%g4,	%l4,	%l2
	movge	%icc,	%o7,	%i2
	set	0x60, %o7
	swapa	[%l7 + %o7] 0x81,	%g3
loop_292:
	nop
	setx loop_293, %l0, %l1
	jmpl %l1, %l5
	fbne,a	%fcc1,	loop_294
	fmovsg	%xcc,	%f7,	%f9
	movne	%xcc,	%o0,	%o5
loop_293:
	edge32	%o3,	%i4,	%o1
loop_294:
	tgu	%icc,	0x4
	fbue,a	%fcc0,	loop_295
	srlx	%l0,	%i3,	%g7
	sdivx	%i7,	0x0816,	%o2
	bvc,a,pt	%xcc,	loop_296
loop_295:
	tpos	%xcc,	0x4
	fbu,a	%fcc1,	loop_297
	udivcc	%i0,	0x1F4F,	%g2
loop_296:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x10,	%i1,	%o4
loop_297:
	edge32	%i6,	%g6,	%o6
	subc	%g5,	%l3,	%l6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g1
	andncc	%l1,	%g4,	%i5
	ta	%icc,	0x2
	tneg	%icc,	0x5
	fmovdvs	%icc,	%f2,	%f4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%l2
	nop
	fitos	%f5,	%f29
	fstox	%f29,	%f18
	fxtos	%f18,	%f1
	edge32n	%l4,	%i2,	%g3
	fxnor	%f20,	%f22,	%f12
	fmul8x16al	%f12,	%f11,	%f20
	fpadd32s	%f6,	%f17,	%f0
	fmovsn	%icc,	%f6,	%f6
	ble,pn	%icc,	loop_298
	movg	%icc,	%l5,	%o7
	mulscc	%o0,	0x126E,	%o3
	nop
	fitos	%f2,	%f1
	fstox	%f1,	%f20
loop_298:
	andncc	%o5,	%i4,	%l0
	set	0x5C, %g6
	lduba	[%l7 + %g6] 0x14,	%i3
	array32	%o1,	%i7,	%g7
	edge16n	%o2,	%i0,	%i1
	sdiv	%g2,	0x0309,	%o4
	xnor	%i6,	0x069C,	%g6
	fone	%f4
	umulcc	%g5,	%o6,	%l6
	nop
	setx	0x9E08EC02,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f24
	tsubcc	%l3,	%l1,	%g4
	edge32	%i5,	%g1,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%i2,	%f18,	%f10
	fnand	%f24,	%f14,	%f26
	srl	%l2,	%g3,	%o7
	srax	%o0,	%l5,	%o5
	tge	%icc,	0x7
	movpos	%xcc,	%o3,	%i4
	fmovrse	%i3,	%f2,	%f27
	movgu	%xcc,	%o1,	%i7
	addcc	%g7,	%o2,	%l0
	fbo,a	%fcc0,	loop_299
	fba	%fcc0,	loop_300
	fbuge	%fcc3,	loop_301
	add	%i0,	%g2,	%i1
loop_299:
	fmovsgu	%xcc,	%f8,	%f26
loop_300:
	array16	%i6,	%g6,	%g5
loop_301:
	edge8	%o6,	%o4,	%l6
	tpos	%icc,	0x6
	fmovrdgz	%l1,	%f14,	%f6
	brz,a	%l3,	loop_302
	orcc	%g4,	%g1,	%l4
	ta	%icc,	0x6
	fandnot1s	%f7,	%f31,	%f25
loop_302:
	srlx	%i5,	0x13,	%i2
	taddcctv	%g3,	0x1C2D,	%l2
	membar	0x6B
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x40] %asi,	%o0
	tle	%icc,	0x1
	edge16	%o7,	%o5,	%o3
	edge16n	%i4,	%l5,	%o1
	fpadd32s	%f28,	%f11,	%f20
	std	%f30,	[%l7 + 0x58]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i7,	%g7
	tge	%icc,	0x6
	ldsb	[%l7 + 0x54],	%i3
	ldd	[%l7 + 0x08],	%o2
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%i0
	edge16n	%g2,	%i1,	%i6
	edge16n	%l0,	%g6,	%g5
	nop
	setx	loop_303,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movre	%o6,	0x24C,	%l6
	taddcc	%l1,	%o4,	%g4
	movrlz	%l3,	%g1,	%l4
loop_303:
	bl,a	%icc,	loop_304
	sllx	%i5,	%g3,	%i2
	sub	%o0,	%o7,	%l2
	xnor	%o5,	0x1E23,	%i4
loop_304:
	fxor	%f10,	%f18,	%f2
	ldx	[%l7 + 0x60],	%o3
	fsrc1	%f16,	%f30
	tne	%icc,	0x4
	fmovsne	%icc,	%f2,	%f15
	fmovdne	%xcc,	%f24,	%f19
	bg,a,pt	%icc,	loop_305
	fmovd	%f26,	%f4
	move	%icc,	%l5,	%i7
	tsubcc	%g7,	0x1E99,	%o1
loop_305:
	edge8l	%o2,	%i0,	%i3
	prefetch	[%l7 + 0x4C],	 0x1
	orcc	%i1,	%g2,	%l0
	andncc	%i6,	%g6,	%g5
	ldx	[%l7 + 0x10],	%l6
	movrne	%l1,	%o6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc0,	loop_306
	edge8l	%o4,	%g1,	%l3
	umul	%l4,	0x0203,	%i5
	bvs,a,pt	%xcc,	loop_307
loop_306:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i2,	%o0
	bleu,a,pt	%icc,	loop_308
loop_307:
	tn	%xcc,	0x3
	edge32l	%o7,	%l2,	%o5
	fcmpgt16	%f6,	%f12,	%i4
loop_308:
	nop
	setx	0x486BC480,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x76C3467E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f30,	%f22
	fmovdcc	%icc,	%f28,	%f27
	tcc	%xcc,	0x6
	movge	%xcc,	%o3,	%g3
	edge8ln	%i7,	%l5,	%g7
	edge16l	%o2,	%i0,	%i3
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
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%o1
	taddcc	%i1,	0x0F03,	%g2
	fmovrde	%l0,	%f24,	%f4
	movgu	%xcc,	%i6,	%g6
	umulcc	%g5,	0x02C9,	%l6
	fbo,a	%fcc3,	loop_309
	bneg	loop_310
	array8	%l1,	%g4,	%o6
	edge32ln	%g1,	%l3,	%o4
loop_309:
	tsubcc	%i5,	%i2,	%o0
loop_310:
	fornot2	%f18,	%f10,	%f14
	smulcc	%o7,	%l4,	%o5
	tsubcctv	%i4,	0x0E4C,	%o3
	tsubcctv	%g3,	%l2,	%i7
	mulscc	%g7,	%o2,	%l5
	nop
	set	0x62, %l5
	ldsb	[%l7 + %l5],	%i3
	stw	%i0,	[%l7 + 0x38]
	fnot1s	%f31,	%f20
	movrlz	%o1,	0x28D,	%g2
	set	0x20, %o0
	ldswa	[%l7 + %o0] 0x18,	%l0
	set	0x60, %l1
	swapa	[%l7 + %l1] 0x89,	%i6
	xorcc	%i1,	0x02F3,	%g6
	alignaddr	%l6,	%l1,	%g4
	xnorcc	%o6,	0x151C,	%g1
	sdivcc	%g5,	0x1997,	%l3
	and	%o4,	%i2,	%i5
	fmul8x16au	%f18,	%f4,	%f26
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3C] %asi,	%o7
	edge16	%o0,	%o5,	%l4
	be	%xcc,	loop_311
	bvc,a	%xcc,	loop_312
	tvc	%xcc,	0x1
	fmovrde	%o3,	%f6,	%f16
loop_311:
	fmovsneg	%icc,	%f14,	%f6
loop_312:
	fcmpne32	%f16,	%f30,	%g3
	movgu	%xcc,	%i4,	%l2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x7E] %asi,	%i7
	ldd	[%l7 + 0x30],	%f2
	fmul8x16au	%f22,	%f1,	%f6
	fbue,a	%fcc3,	loop_313
	edge8	%o2,	%l5,	%g7
	fnegs	%f3,	%f26
	taddcc	%i3,	%o1,	%g2
loop_313:
	fone	%f12
	add	%l0,	%i0,	%i6
	alignaddrl	%g6,	%i1,	%l6
	tcs	%xcc,	0x7
	edge32ln	%g4,	%o6,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g1,	%g5,	%o4
	movrgez	%l3,	0x06B,	%i5
	udivcc	%i2,	0x0154,	%o0
	tcs	%icc,	0x6
	sethi	0x03CC,	%o7
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	subcc	%o5,	0x0456,	%l4
	orncc	%o3,	0x14D8,	%i4
	srax	%g3,	%i7,	%o2
	addc	%l5,	0x00F7,	%g7
	bcc,a,pn	%xcc,	loop_314
	udivcc	%l2,	0x1161,	%o1
	xnor	%i3,	%g2,	%l0
	set	0x6C, %l0
	stba	%i6,	[%l7 + %l0] 0x81
loop_314:
	xorcc	%i0,	0x0348,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i1,	[%l7 + 0x79]
	bl	loop_315
	or	%l6,	0x0A1B,	%o6
	fmovrdgz	%l1,	%f26,	%f6
	nop
	fitod	%f6,	%f4
	fdtoi	%f4,	%f3
loop_315:
	nop
	set	0x68, %g7
	swapa	[%l7 + %g7] 0x11,	%g1
	tpos	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	movneg	%xcc,	%g4,	%g5
	fbul,a	%fcc2,	loop_316
	movn	%icc,	%l3,	%o4
	srax	%i5,	%o0,	%o7
	fmovsleu	%xcc,	%f22,	%f9
loop_316:
	tsubcctv	%i2,	%l4,	%o3
	andn	%i4,	0x1014,	%o5
	andcc	%i7,	%g3,	%o2
	fornot2	%f6,	%f0,	%f28
	fmovsgu	%xcc,	%f4,	%f10
	fbo	%fcc0,	loop_317
	fmovsneg	%xcc,	%f24,	%f8
	set	0x4C, %i0
	sta	%f7,	[%l7 + %i0] 0x0c
loop_317:
	array16	%g7,	%l5,	%l2
	ldub	[%l7 + 0x31],	%i3
	orcc	%o1,	0x0FB2,	%g2
	fmovsvc	%icc,	%f11,	%f30
	wr	%g0,	0xeb,	%asi
	stha	%i6,	[%l7 + 0x52] %asi
	membar	#Sync
	lduw	[%l7 + 0x3C],	%i0
	movrlez	%l0,	%g6,	%i1
	fba,a	%fcc1,	loop_318
	fands	%f1,	%f8,	%f13
	sllx	%o6,	%l1,	%l6
	sethi	0x0761,	%g4
loop_318:
	tsubcc	%g1,	%l3,	%g5
	tsubcctv	%o4,	%o0,	%o7
	tcc	%icc,	0x6
	set	0x68, %g1
	ldxa	[%l7 + %g1] 0x89,	%i2
	sll	%i5,	0x10,	%l4
	tn	%icc,	0x5
	smul	%o3,	0x1906,	%o5
	fmovrde	%i4,	%f28,	%f22
	ldsw	[%l7 + 0x34],	%i7
	sdivcc	%g3,	0x14B6,	%g7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%o2
	and	%l5,	%l2,	%o1
	edge32l	%i3,	%g2,	%i0
	or	%l0,	0x05CA,	%i6
	bne	%icc,	loop_319
	fzero	%f12
	movne	%icc,	%g6,	%i1
	fnegd	%f14,	%f8
loop_319:
	movrlz	%l1,	%l6,	%o6
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x40] %asi,	%g4
	ldd	[%l7 + 0x40],	%f18
	fmovdge	%xcc,	%f25,	%f27
	movrne	%l3,	%g1,	%g5
	fmovrdlz	%o0,	%f26,	%f10
	fmovsn	%icc,	%f18,	%f28
	tleu	%icc,	0x4
	sdiv	%o4,	0x0768,	%o7
	fpsub16s	%f12,	%f25,	%f5
	movg	%xcc,	%i2,	%i5
	tpos	%xcc,	0x5
	tge	%icc,	0x7
	ld	[%l7 + 0x30],	%f26
	set	0x40, %i2
	prefetcha	[%l7 + %i2] 0x0c,	 0x0
	stw	%o5,	[%l7 + 0x5C]
	fpadd16	%f20,	%f4,	%f28
	fpadd32s	%f16,	%f24,	%f9
	addccc	%i4,	0x1631,	%l4
	movrgz	%i7,	%g7,	%o2
	flush	%l7 + 0x40
	sll	%l5,	%l2,	%o1
	fpsub16	%f28,	%f6,	%f20
	edge16l	%g3,	%i3,	%g2
	udivcc	%i0,	0x108F,	%l0
	fpack32	%f12,	%f4,	%f2
	edge16ln	%g6,	%i6,	%i1
	subcc	%l6,	%o6,	%l1
	xor	%l3,	0x1317,	%g1
	movrne	%g4,	%o0,	%o4
	std	%f14,	[%l7 + 0x48]
	nop
	fitos	%f9,	%f0
	fstod	%f0,	%f0
	edge16n	%g5,	%i2,	%o7
	alignaddrl	%o3,	%i5,	%o5
	edge8l	%i4,	%l4,	%g7
	fsrc2s	%f2,	%f16
	fmul8ulx16	%f28,	%f8,	%f22
	ba,pt	%icc,	loop_320
	fcmpeq32	%f8,	%f6,	%o2
	fxnor	%f30,	%f22,	%f14
	fbul	%fcc2,	loop_321
loop_320:
	fbu,a	%fcc3,	loop_322
	movge	%icc,	%i7,	%l2
	movneg	%icc,	%o1,	%g3
loop_321:
	sub	%l5,	0x1B83,	%g2
loop_322:
	fmovde	%icc,	%f2,	%f29
	andncc	%i0,	%l0,	%g6
	stx	%i3,	[%l7 + 0x18]
	set	0x15, %l3
	stba	%i6,	[%l7 + %l3] 0x10
	movneg	%xcc,	%i1,	%l6
	xorcc	%o6,	0x1EC4,	%l1
	subc	%g1,	%g4,	%l3
	sdivx	%o4,	0x0FA3,	%g5
	addcc	%i2,	0x032A,	%o0
	movrgz	%o3,	%o7,	%o5
	orn	%i5,	0x195B,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i4,	%g7,	%i7
	umul	%l2,	0x0FAE,	%o1
	tne	%icc,	0x7
	movcc	%xcc,	%g3,	%o2
	array16	%g2,	%i0,	%l0
	sra	%g6,	%l5,	%i6
	fbu,a	%fcc2,	loop_323
	sdivx	%i3,	0x166B,	%l6
	array16	%o6,	%i1,	%l1
	umul	%g4,	%g1,	%o4
loop_323:
	taddcctv	%g5,	0x1B29,	%i2
	tvs	%icc,	0x2
	addcc	%o0,	0x109F,	%o3
	pdist	%f26,	%f22,	%f20
	movrne	%o7,	%l3,	%i5
	tle	%icc,	0x1
	movrgz	%o5,	%l4,	%g7
	edge16	%i7,	%i4,	%l2
	addcc	%o1,	0x0C2E,	%o2
	movg	%icc,	%g3,	%g2
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x18] %asi,	%f15
	movl	%icc,	%i0,	%l0
	movl	%xcc,	%g6,	%l5
	udivcc	%i3,	0x15D9,	%i6
	fmuld8sux16	%f24,	%f7,	%f18
	bleu,a	%icc,	loop_324
	add	%l6,	%o6,	%l1
	movl	%xcc,	%g4,	%g1
	andcc	%o4,	0x1B4F,	%i1
loop_324:
	tpos	%icc,	0x0
	or	%i2,	0x0771,	%g5
	xnor	%o0,	%o3,	%l3
	movleu	%xcc,	%i5,	%o7
	movrgz	%l4,	0x25F,	%o5
	movpos	%xcc,	%i7,	%i4
	tle	%xcc,	0x0
	fpsub32s	%f15,	%f9,	%f19
	stbar
	fmovdcc	%xcc,	%f18,	%f5
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g7
	smul	%o1,	0x0A17,	%o2
	movrne	%g3,	0x359,	%g2
	fsrc2s	%f22,	%f5
	fcmpne32	%f6,	%f4,	%i0
	fmovdge	%icc,	%f14,	%f7
	edge32l	%l2,	%g6,	%l0
	mulx	%l5,	%i3,	%l6
	stbar
	tl	%xcc,	0x1
	sethi	0x1819,	%o6
	te	%xcc,	0x4
	tleu	%icc,	0x5
	movne	%icc,	%i6,	%l1
	edge8l	%g4,	%g1,	%i1
	tg	%xcc,	0x5
	umulcc	%i2,	0x1FB1,	%o4
	movgu	%icc,	%g5,	%o0
	wr	%g0,	0x23,	%asi
	stba	%o3,	[%l7 + 0x0D] %asi
	membar	#Sync
	bge,pt	%icc,	loop_325
	array32	%i5,	%o7,	%l4
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f28
	fxtod	%f28,	%f22
	xnorcc	%l3,	0x062F,	%o5
loop_325:
	or	%i7,	0x0876,	%g7
	fzeros	%f4
	umulcc	%i4,	%o1,	%o2
	ta	%icc,	0x4
	tpos	%xcc,	0x3
	array16	%g3,	%i0,	%l2
	fpsub32	%f2,	%f20,	%f2
	sllx	%g2,	%g6,	%l0
	bvs,a	loop_326
	nop
	setx loop_327, %l0, %l1
	jmpl %l1, %l5
	taddcc	%l6,	0x0699,	%o6
	subcc	%i3,	0x0C26,	%i6
loop_326:
	umulcc	%l1,	0x1B4B,	%g4
loop_327:
	swap	[%l7 + 0x08],	%i1
	movrlez	%g1,	0x128,	%i2
	fxor	%f18,	%f4,	%f2
	edge16l	%g5,	%o4,	%o3
	fnot1	%f20,	%f30
	xnorcc	%o0,	%i5,	%l4
	wr	%g0,	0x18,	%asi
	stha	%l3,	[%l7 + 0x44] %asi
	taddcc	%o7,	%o5,	%i7
	nop
	set	0x70, %o5
	stx	%i4,	[%l7 + %o5]
	taddcc	%o1,	%o2,	%g3
	fmovdl	%xcc,	%f4,	%f20
	edge32n	%g7,	%i0,	%g2
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x69] %asi,	%l2
	alignaddrl	%l0,	%g6,	%l6
	tl	%xcc,	0x3
	set	0x5C, %i7
	lduwa	[%l7 + %i7] 0x88,	%o6
	fmovsleu	%xcc,	%f0,	%f17
	edge32	%i3,	%i6,	%l5
	srax	%l1,	%g4,	%g1
	array32	%i2,	%g5,	%o4
	movrne	%o3,	%i1,	%i5
	fsrc1	%f20,	%f6
	srl	%l4,	%l3,	%o0
	tle	%xcc,	0x6
	ldx	[%l7 + 0x38],	%o5
	bvc,pn	%xcc,	loop_328
	edge8	%o7,	%i4,	%i7
	movvc	%xcc,	%o1,	%g3
	alignaddrl	%g7,	%i0,	%g2
loop_328:
	fbu,a	%fcc0,	loop_329
	or	%o2,	%l0,	%l2
	sdivx	%l6,	0x189D,	%g6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i3
loop_329:
	fpmerge	%f26,	%f1,	%f12
	fmovspos	%icc,	%f9,	%f31
	fmovrdgez	%i6,	%f22,	%f6
	edge16l	%o6,	%l5,	%l1
	nop
	fitos	%f24,	%f11
	tg	%xcc,	0x1
	tleu	%xcc,	0x6
	fbul	%fcc1,	loop_330
	sir	0x1C20
	membar	0x48
	movne	%xcc,	%g1,	%i2
loop_330:
	fabss	%f13,	%f13
	movleu	%icc,	%g4,	%o4
	be,pn	%xcc,	loop_331
	mulscc	%g5,	%i1,	%o3
	edge32	%l4,	%i5,	%l3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%o7
loop_331:
	sth	%i4,	[%l7 + 0x14]
	fmovdgu	%xcc,	%f4,	%f5
	fabss	%f19,	%f31
	fxor	%f6,	%f2,	%f14
	te	%xcc,	0x3
	sub	%i7,	%o5,	%o1
	movl	%xcc,	%g3,	%g7
	fbue	%fcc3,	loop_332
	fabsd	%f16,	%f18
	tneg	%xcc,	0x1
	sir	0x1A73
loop_332:
	edge16ln	%i0,	%o2,	%l0
	movcc	%icc,	%g2,	%l2
	movcc	%xcc,	%g6,	%i3
	movne	%xcc,	%l6,	%i6
	nop
	setx	0xBB7F876D441236CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x79A214FE28B1A75F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f20,	%f14
	movleu	%icc,	%o6,	%l1
	edge32n	%g1,	%i2,	%g4
	udivx	%o4,	0x0712,	%g5
	std	%f6,	[%l7 + 0x60]
	movle	%xcc,	%i1,	%o3
	subc	%l4,	0x0FC4,	%i5
	addccc	%l5,	%o0,	%l3
	be,pt	%xcc,	loop_333
	tpos	%xcc,	0x3
	movne	%icc,	%o7,	%i4
	movrlez	%i7,	0x0CE,	%o5
loop_333:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%g3,	%o1
	popc	0x0480,	%g7
	set	0x52, %o1
	ldsha	[%l7 + %o1] 0x15,	%o2
	tcs	%xcc,	0x7
	te	%icc,	0x6
	fcmpeq16	%f2,	%f10,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%l0,	0x11,	%g2
	bg,pn	%xcc,	loop_335
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f2
loop_334:
	or	%l2,	0x182B,	%g6
	movrgez	%l6,	%i3,	%i6
loop_335:
	fbule	%fcc0,	loop_336
	alignaddrl	%l1,	%g1,	%o6
	andncc	%i2,	%g4,	%o4
	tsubcctv	%i1,	0x07FB,	%g5
loop_336:
	array16	%o3,	%i5,	%l5
	umul	%o0,	%l4,	%l3
	movpos	%xcc,	%o7,	%i4
	tsubcc	%i7,	0x19DA,	%g3
	ba	loop_337
	popc	0x1333,	%o1
	movn	%xcc,	%g7,	%o5
	fbule	%fcc0,	loop_338
loop_337:
	fnors	%f17,	%f20,	%f7
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_338:
	srl	%i0,	0x08,	%l0
	nop
	fitod	%f4,	%f6
	fdtoi	%f6,	%f4
	movneg	%xcc,	%g2,	%o2
	bcc	loop_339
	movg	%icc,	%g6,	%l6
	or	%i3,	0x0DCD,	%i6
	movn	%icc,	%l2,	%g1
loop_339:
	fpack16	%f28,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_340
	fsrc1	%f16,	%f0
	addcc	%l1,	0x0523,	%i2
	edge8ln	%o6,	%g4,	%i1
loop_340:
	orn	%g5,	0x0580,	%o4
	set	0x4A, %o3
	stha	%o3,	[%l7 + %o3] 0x0c
	bvc,a,pn	%icc,	loop_341
	stw	%i5,	[%l7 + 0x4C]
	taddcc	%o0,	%l4,	%l3
	umul	%l5,	%o7,	%i7
loop_341:
	fornot2s	%f13,	%f13,	%f27
	nop
	fitos	%f5,	%f4
	fstod	%f4,	%f24
	nop
	setx	loop_342,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd16s	%f13,	%f20,	%f0
	fmovsgu	%icc,	%f0,	%f14
	mulx	%i4,	0x18F1,	%g3
loop_342:
	subccc	%g7,	0x1EED,	%o1
	movre	%i0,	0x1FD,	%l0
	sdivcc	%g2,	0x12F8,	%o2
	membar	0x54
	tpos	%icc,	0x1
	nop
	set	0x10, %g4
	std	%f30,	[%l7 + %g4]
	fmovdge	%icc,	%f12,	%f4
	fmovrsne	%g6,	%f27,	%f31
	fmovdpos	%xcc,	%f27,	%f6
	tneg	%xcc,	0x2
	movle	%xcc,	%o5,	%i3
	movre	%i6,	0x0A5,	%l6
	orcc	%l2,	%g1,	%i2
	andn	%o6,	%l1,	%i1
	fmovsle	%icc,	%f4,	%f6
	fexpand	%f9,	%f20
	nop
	set	0x08, %g3
	ldstub	[%l7 + %g3],	%g4
	tcs	%icc,	0x2
	tvs	%xcc,	0x2
	movrne	%o4,	%o3,	%i5
	tcs	%xcc,	0x2
	addc	%o0,	0x1793,	%l4
	fbuge,a	%fcc2,	loop_343
	bcs,a	%xcc,	loop_344
	ldd	[%l7 + 0x68],	%f2
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%l3
loop_343:
	fpadd32	%f2,	%f28,	%f30
loop_344:
	fzero	%f28
	andncc	%l5,	%o7,	%g5
	membar	0x11
	movge	%xcc,	%i4,	%i7
	fandnot1s	%f2,	%f8,	%f6
	orn	%g7,	%g3,	%i0
	fpadd32	%f18,	%f22,	%f10
	fnors	%f15,	%f2,	%f12
	edge32n	%o1,	%l0,	%g2
	set	0x58, %l4
	lda	[%l7 + %l4] 0x15,	%f9
	sub	%g6,	0x1158,	%o2
	fmovrsgz	%i3,	%f8,	%f2
	edge8l	%i6,	%l6,	%o5
	addcc	%l2,	0x0BB4,	%g1
	mulx	%o6,	%l1,	%i1
	movrlz	%g4,	0x3C8,	%i2
	taddcc	%o4,	0x0B1B,	%i5
	andncc	%o3,	%o0,	%l3
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f6
	fxtod	%f6,	%f0
	nop
	set	0x24, %g5
	lduh	[%l7 + %g5],	%l5
	fmovdneg	%xcc,	%f5,	%f6
	mulscc	%o7,	%g5,	%i4
	movrgez	%i7,	%g7,	%l4
	sdivcc	%i0,	0x15E7,	%o1
	umulcc	%g3,	0x08F0,	%l0
	fcmple16	%f24,	%f8,	%g2
	ba,a,pn	%icc,	loop_345
	udivcc	%o2,	0x0A31,	%i3
	addccc	%i6,	%g6,	%l6
	edge8l	%l2,	%o5,	%g1
loop_345:
	nop
	set	0x50, %o4
	ldda	[%l7 + %o4] 0x88,	%o6
	set	0x30, %g2
	stxa	%i1,	[%l7 + %g2] 0x14
	sllx	%g4,	0x10,	%l1
	fcmpgt16	%f30,	%f6,	%i2
	wr	%g0,	0x2a,	%asi
	stxa	%i5,	[%l7 + 0x18] %asi
	membar	#Sync
	set	0x0, %o6
	stxa	%o3,	[%g0 + %o6] 0x57
	addccc	%o4,	%l3,	%l5
	edge32l	%o7,	%g5,	%i4
	bcs	%icc,	loop_346
	fmovdleu	%icc,	%f23,	%f7
	nop
	fitos	%f14,	%f9
	fstoi	%f9,	%f18
	edge16l	%o0,	%i7,	%g7
loop_346:
	bvs,pn	%icc,	loop_347
	fbn	%fcc1,	loop_348
	udivx	%i0,	0x0520,	%o1
	edge8l	%g3,	%l0,	%l4
loop_347:
	fmovscc	%icc,	%f3,	%f29
loop_348:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%o2
	subc	%i6,	0x19ED,	%g6
	fmovdneg	%icc,	%f19,	%f26
	brgz	%i3,	loop_349
	ldstub	[%l7 + 0x3A],	%l6
	fbule,a	%fcc3,	loop_350
	movneg	%icc,	%o5,	%g1
loop_349:
	taddcctv	%l2,	0x0B7D,	%o6
	fblg	%fcc3,	loop_351
loop_350:
	tle	%icc,	0x6
	edge32n	%g4,	%l1,	%i2
	tle	%icc,	0x0
loop_351:
	fbue,a	%fcc2,	loop_352
	tvs	%icc,	0x3
	edge8n	%i1,	%i5,	%o3
	fbg	%fcc1,	loop_353
loop_352:
	movgu	%xcc,	%o4,	%l5
	umulcc	%l3,	0x16A5,	%g5
	srl	%o7,	%i4,	%o0
loop_353:
	ldx	[%l7 + 0x68],	%g7
	for	%f8,	%f10,	%f4
	nop
	fitos	%f6,	%f25
	fstox	%f25,	%f28
	movrlez	%i0,	0x2E7,	%o1
	tle	%icc,	0x0
	umulcc	%g3,	0x1ABC,	%i7
	tvc	%icc,	0x1
	alignaddr	%l4,	%g2,	%o2
	ldub	[%l7 + 0x2F],	%i6
	alignaddrl	%l0,	%i3,	%g6
	orncc	%o5,	0x0FEB,	%l6
	tl	%icc,	0x1
	fmovrsne	%l2,	%f3,	%f19
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x81,	%o6,	%g4
	smul	%l1,	0x0227,	%i2
	ble,pn	%xcc,	loop_354
	tg	%xcc,	0x4
	fmovrdgz	%g1,	%f28,	%f2
	edge8	%i1,	%i5,	%o4
loop_354:
	tn	%icc,	0x1
	te	%xcc,	0x5
	stw	%l5,	[%l7 + 0x60]
	movcc	%xcc,	%o3,	%g5
	fmovdvc	%icc,	%f16,	%f7
	edge32l	%o7,	%l3,	%i4
	nop
	fitos	%f14,	%f29
	fstox	%f29,	%f14
	fmovdg	%xcc,	%f10,	%f10
	movcs	%xcc,	%g7,	%o0
	wr	%g0,	0xe3,	%asi
	stba	%i0,	[%l7 + 0x3C] %asi
	membar	#Sync
	stb	%o1,	[%l7 + 0x41]
	set	0x7C, %i1
	lda	[%l7 + %i1] 0x81,	%f22
	xnor	%g3,	0x011C,	%i7
	fnands	%f23,	%f4,	%f25
	nop
	setx	0xC8848E2A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xB9583AF5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f7,	%f22
	lduh	[%l7 + 0x54],	%g2
	tn	%icc,	0x0
	tsubcctv	%o2,	0x084B,	%i6
	tn	%xcc,	0x4
	prefetch	[%l7 + 0x1C],	 0x0
	movcc	%xcc,	%l4,	%i3
	umul	%l0,	%o5,	%l6
	fmovdcc	%xcc,	%f0,	%f17
	movne	%xcc,	%g6,	%o6
	fmovsneg	%xcc,	%f9,	%f4
	fbue	%fcc1,	loop_355
	fpadd32s	%f23,	%f7,	%f26
	sdivcc	%l2,	0x1C96,	%g4
	fcmpeq32	%f18,	%f26,	%l1
loop_355:
	fpmerge	%f4,	%f31,	%f4
	brlz	%i2,	loop_356
	fexpand	%f18,	%f14
	fmovspos	%icc,	%f21,	%f10
	movre	%i1,	0x312,	%g1
loop_356:
	nop
	setx	0x6967FBD5B05E0420,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	movne	%xcc,	%i5,	%o4
	edge16l	%o3,	%g5,	%o7
	tle	%icc,	0x3
	sir	0x1E68
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x26] %asi,	%l5
	ldx	[%l7 + 0x68],	%i4
	fmovdgu	%icc,	%f19,	%f31
	smul	%l3,	%g7,	%o0
	taddcctv	%o1,	0x19AA,	%i0
	tle	%icc,	0x7
	fbo,a	%fcc1,	loop_357
	xor	%i7,	%g2,	%g3
	fpsub16s	%f15,	%f9,	%f29
	or	%i6,	0x1F15,	%l4
loop_357:
	be,pn	%xcc,	loop_358
	fmovdge	%icc,	%f30,	%f18
	andncc	%i3,	%o2,	%l0
	taddcctv	%l6,	%o5,	%o6
loop_358:
	fbg	%fcc2,	loop_359
	movne	%xcc,	%g6,	%l2
	tcs	%xcc,	0x2
	movrgz	%l1,	0x29A,	%i2
loop_359:
	edge8ln	%g4,	%g1,	%i5
	sir	0x155F
	tleu	%xcc,	0x5
	set	0x30, %o2
	ldxa	[%g0 + %o2] 0x58,	%i1
	std	%f24,	[%l7 + 0x18]
	bvc	loop_360
	umul	%o3,	0x1635,	%o4
	movrne	%g5,	%l5,	%o7
	edge32	%l3,	%i4,	%o0
loop_360:
	fmovse	%icc,	%f6,	%f30
	nop
	setx loop_361, %l0, %l1
	jmpl %l1, %g7
	movge	%xcc,	%o1,	%i7
	fmovdgu	%icc,	%f20,	%f1
	fmovsle	%icc,	%f6,	%f20
loop_361:
	andn	%g2,	%i0,	%g3
	set	0x34, %l2
	stwa	%l4,	[%l7 + %l2] 0xe3
	membar	#Sync
	ba	loop_362
	alignaddrl	%i6,	%o2,	%l0
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x0c,	%f0
loop_362:
	tn	%xcc,	0x3
	fbe	%fcc1,	loop_363
	fnegd	%f26,	%f14
	andn	%i3,	%l6,	%o6
	fmovrse	%o5,	%f13,	%f16
loop_363:
	bge,a,pn	%xcc,	loop_364
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g6,	0x09FE,	%l1
	bge,a	loop_365
loop_364:
	movne	%xcc,	%l2,	%g4
	tge	%xcc,	0x5
	edge16	%g1,	%i5,	%i2
loop_365:
	popc	%i1,	%o3
	movg	%xcc,	%g5,	%o4
	fxors	%f20,	%f22,	%f5
	movl	%xcc,	%o7,	%l5
	ldstub	[%l7 + 0x30],	%l3
	mulx	%i4,	%o0,	%o1
	edge8l	%i7,	%g7,	%g2
	mulscc	%g3,	0x1504,	%l4
	fzeros	%f19
	tgu	%xcc,	0x0
	subc	%i0,	%o2,	%l0
	ldd	[%l7 + 0x40],	%i2
	fbule,a	%fcc2,	loop_366
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%i6,	%o6
	fmovsne	%xcc,	%f2,	%f11
loop_366:
	or	%l6,	0x01D7,	%g6
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge16	%o5,	%l1,	%g4
	tgu	%xcc,	0x1
	membar	0x49
	edge16ln	%g1,	%l2,	%i2
	udiv	%i1,	0x100B,	%o3
	sdivcc	%g5,	0x03EB,	%o4
	andncc	%i5,	%o7,	%l5
	fble	%fcc2,	loop_367
	edge8	%l3,	%o0,	%o1
	movvs	%icc,	%i7,	%g7
	sdivx	%i4,	0x11A6,	%g3
loop_367:
	stbar
	movvc	%xcc,	%l4,	%g2
	sethi	0x11CA,	%o2
	fmovdleu	%xcc,	%f8,	%f26
	srl	%i0,	0x1A,	%l0
	xor	%i6,	0x10D9,	%o6
	fmovsn	%xcc,	%f6,	%f6
	fmovrde	%l6,	%f8,	%f0
	brlez	%g6,	loop_368
	bn,pt	%icc,	loop_369
	fxnors	%f21,	%f9,	%f9
	sdivx	%o5,	0x1F5D,	%i3
loop_368:
	swap	[%l7 + 0x0C],	%g4
loop_369:
	nop
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x0c,	 0x1
	array32	%l2,	%l1,	%i1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x52] %asi,	%i2
	ldsb	[%l7 + 0x6C],	%g5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f26
	fxtod	%f26,	%f24
	sra	%o3,	0x19,	%o7
	tsubcc	%l5,	0x19A8,	%i5
	srlx	%l3,	%o0,	%i7
	xorcc	%g7,	0x1ADD,	%i4
	mulx	%g3,	0x0441,	%l4
	fbule	%fcc2,	loop_370
	sdiv	%g2,	0x1F4D,	%o2
	sllx	%o1,	0x14,	%l0
	movg	%xcc,	%i0,	%o6
loop_370:
	addc	%l6,	%g6,	%i6
	srlx	%i3,	%g4,	%o5
	membar	0x57
	wr	%g0,	0xeb,	%asi
	stha	%g1,	[%l7 + 0x62] %asi
	membar	#Sync
	sub	%l2,	%l1,	%i2
	membar	0x61
	fabss	%f26,	%f8
	movrgz	%i1,	%g5,	%o3
	sub	%o7,	0x0001,	%o4
	fmovdneg	%xcc,	%f11,	%f25
	fandnot1s	%f21,	%f16,	%f26
	orcc	%l5,	0x09C3,	%i5
	sdivcc	%o0,	0x0D92,	%i7
	fornot1s	%f16,	%f22,	%f13
	fcmpeq32	%f2,	%f12,	%g7
	sdivx	%i4,	0x05AD,	%g3
	edge16	%l4,	%l3,	%g2
	edge8n	%o2,	%l0,	%o1
	movl	%xcc,	%i0,	%o6
	set	0x53, %i6
	stba	%l6,	[%l7 + %i6] 0x11
	movre	%g6,	0x0A5,	%i3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x52] %asi,	%g4
	subccc	%i6,	%o5,	%g1
	fbl	%fcc2,	loop_371
	movrlez	%l1,	0x145,	%l2
	orcc	%i1,	%g5,	%i2
	brlez	%o3,	loop_372
loop_371:
	fbn	%fcc2,	loop_373
	fmovrsne	%o4,	%f26,	%f10
	fandnot2s	%f5,	%f26,	%f7
loop_372:
	fpadd32	%f8,	%f2,	%f2
loop_373:
	movvs	%xcc,	%o7,	%i5
	movl	%xcc,	%l5,	%o0
	stb	%i7,	[%l7 + 0x29]
	movrlz	%g7,	%g3,	%i4
	tl	%xcc,	0x1
	nop
	fitod	%f4,	%f4
	fdtos	%f4,	%f20
	fnot2	%f12,	%f6
	edge8n	%l3,	%g2,	%o2
	edge16	%l4,	%l0,	%o1
	andn	%o6,	%l6,	%g6
	taddcc	%i0,	%i3,	%g4
	call	loop_374
	tvc	%icc,	0x6
	movneg	%xcc,	%i6,	%o5
	ba,a,pn	%xcc,	loop_375
loop_374:
	udivcc	%g1,	0x0CA3,	%l1
	tvc	%icc,	0x3
	mulscc	%i1,	0x0E5F,	%g5
loop_375:
	brgez	%i2,	loop_376
	fpsub32s	%f8,	%f15,	%f2
	bpos,a	%icc,	loop_377
	array32	%l2,	%o3,	%o7
loop_376:
	xnor	%o4,	0x1220,	%i5
	bgu,a,pn	%xcc,	loop_378
loop_377:
	ta	%icc,	0x1
	movrgez	%l5,	0x396,	%i7
	tvc	%icc,	0x3
loop_378:
	fpadd16s	%f9,	%f12,	%f8
	edge16	%o0,	%g3,	%g7
	fone	%f20
	bleu,a	%icc,	loop_379
	smul	%i4,	0x0A8C,	%l3
	fnot1	%f22,	%f12
	xnor	%g2,	%l4,	%o2
loop_379:
	fbn	%fcc0,	loop_380
	tle	%xcc,	0x0
	fnors	%f10,	%f21,	%f25
	edge32	%l0,	%o6,	%o1
loop_380:
	movrgez	%g6,	%l6,	%i0
	edge32	%g4,	%i3,	%o5
	set	0x4C, %i3
	swapa	[%l7 + %i3] 0x80,	%g1
	srl	%i6,	0x0F,	%l1
	be,pt	%xcc,	loop_381
	fxnors	%f21,	%f4,	%f2
	addccc	%i1,	0x0B71,	%i2
	tsubcctv	%g5,	%l2,	%o7
loop_381:
	edge32n	%o3,	%o4,	%i5
	subcc	%i7,	0x014C,	%o0
	fmovde	%xcc,	%f4,	%f30
	te	%xcc,	0x3
	edge16	%l5,	%g3,	%i4
	fmovrslez	%g7,	%f13,	%f20
	edge32n	%g2,	%l3,	%l4
	movcc	%xcc,	%l0,	%o2
	add	%o6,	0x098E,	%o1
	movg	%xcc,	%l6,	%g6
	ldsh	[%l7 + 0x7A],	%g4
	wr	%g0,	0xeb,	%asi
	stwa	%i3,	[%l7 + 0x0C] %asi
	membar	#Sync
	mulscc	%i0,	0x0939,	%o5
	tsubcc	%i6,	0x19F2,	%g1
	bgu,a	%icc,	loop_382
	fbo	%fcc3,	loop_383
	fbg	%fcc1,	loop_384
	movcc	%xcc,	%i1,	%l1
loop_382:
	ldsw	[%l7 + 0x18],	%g5
loop_383:
	orcc	%i2,	%l2,	%o7
loop_384:
	srlx	%o4,	0x13,	%i5
	nop
	setx	0x0EA54C98CCEEC8FC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x884663C5EB9EA3FF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f4,	%f6
	brgez,a	%o3,	loop_385
	fbue	%fcc0,	loop_386
	brgez,a	%o0,	loop_387
	alignaddrl	%l5,	%i7,	%i4
loop_385:
	fsrc1	%f28,	%f26
loop_386:
	tne	%icc,	0x3
loop_387:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x3C] %asi,	%f2
	fnegs	%f13,	%f11
	sdiv	%g7,	0x0647,	%g2
	xorcc	%g3,	%l4,	%l0
	nop
	setx	0xE996D858D2744009,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x049D2EBC4DCCB79D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f14,	%f12
	fnor	%f4,	%f26,	%f10
	fmovde	%icc,	%f2,	%f4
	fbn,a	%fcc2,	loop_388
	movl	%xcc,	%l3,	%o6
	xorcc	%o1,	%o2,	%g6
	fbge,a	%fcc1,	loop_389
loop_388:
	bn,a,pt	%icc,	loop_390
	fpsub32s	%f7,	%f5,	%f18
	fbl	%fcc3,	loop_391
loop_389:
	edge32l	%l6,	%g4,	%i0
loop_390:
	tg	%xcc,	0x3
	fbe	%fcc3,	loop_392
loop_391:
	movre	%o5,	0x289,	%i3
	bleu,a,pt	%icc,	loop_393
	add	%i6,	%g1,	%l1
loop_392:
	fornot2s	%f12,	%f2,	%f2
	xor	%g5,	%i1,	%l2
loop_393:
	fmovspos	%icc,	%f23,	%f9
	edge8l	%i2,	%o4,	%o7
	udiv	%o3,	0x07DD,	%o0
	movge	%xcc,	%l5,	%i7
	xorcc	%i4,	0x1994,	%i5
	stbar
	membar	0x2A
	srl	%g2,	0x1C,	%g7
	sethi	0x0231,	%g3
	ta	%icc,	0x4
	movge	%icc,	%l0,	%l4
	srl	%l3,	%o6,	%o2
	andn	%g6,	0x16D5,	%o1
	array8	%g4,	%i0,	%l6
	tsubcc	%o5,	%i3,	%g1
	tn	%icc,	0x4
	movgu	%icc,	%l1,	%g5
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f26
	tcs	%xcc,	0x3
	fble	%fcc2,	loop_394
	andn	%i1,	%l2,	%i6
	fcmpne16	%f28,	%f16,	%i2
	nop
	fitos	%f14,	%f8
	fstod	%f8,	%f22
loop_394:
	edge32ln	%o7,	%o3,	%o4
	sir	0x18B8
	fmovsl	%icc,	%f13,	%f8
	tsubcc	%l5,	%i7,	%i4
	movl	%xcc,	%o0,	%i5
	tpos	%xcc,	0x2
	stw	%g7,	[%l7 + 0x14]
	fmul8sux16	%f22,	%f4,	%f4
	orncc	%g2,	%g3,	%l0
	sir	0x169B
	ldd	[%l7 + 0x28],	%l4
	ldub	[%l7 + 0x72],	%o6
	set	0x1C, %o7
	ldstuba	[%l7 + %o7] 0x81,	%l3
	movrgez	%g6,	0x0A5,	%o1
	edge8	%o2,	%g4,	%l6
	xor	%i0,	%i3,	%o5
	srax	%l1,	0x14,	%g1
	fmovdneg	%xcc,	%f23,	%f15
	nop
	setx	0xF5D597D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x5E5FA4FE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f13,	%f29
	fmovse	%xcc,	%f2,	%f21
	move	%xcc,	%i1,	%l2
	ldx	[%l7 + 0x28],	%g5
	movrgez	%i2,	0x2AB,	%i6
	alignaddr	%o7,	%o3,	%l5
	popc	0x0923,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i4,	0x0007,	%o0
	fbug,a	%fcc0,	loop_395
	movneg	%xcc,	%o4,	%i5
	movg	%xcc,	%g7,	%g3
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%l0,	[%g0 + 0x130] %asi ripped by fixASI40.pl ripped by fixASI40.pl
loop_395:
	fmovsle	%xcc,	%f22,	%f30
	xorcc	%l4,	0x1E3C,	%o6
	addcc	%l3,	%g2,	%g6
	brlez,a	%o1,	loop_396
	xnor	%g4,	0x100E,	%o2
	edge8l	%l6,	%i3,	%o5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_396:
	movrlez	%l1,	%i0,	%g1
	edge16n	%l2,	%g5,	%i2
	tg	%xcc,	0x1
	te	%xcc,	0x1
	fcmple32	%f18,	%f4,	%i6
	std	%f4,	[%l7 + 0x78]
	array32	%o7,	%o3,	%l5
	stbar
	fmovsvs	%icc,	%f25,	%f21
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	alignaddrl	%i1,	%i4,	%o0
	fmovdgu	%xcc,	%f24,	%f7
	fandnot1	%f6,	%f24,	%f22
	brlez	%o4,	loop_397
	srlx	%i7,	%i5,	%g3
	nop
	fitos	%f1,	%f11
	fstod	%f11,	%f10
	xorcc	%l0,	0x01D9,	%g7
loop_397:
	fmul8x16	%f27,	%f18,	%f16
	fble	%fcc1,	loop_398
	fcmpeq32	%f20,	%f10,	%o6
	smul	%l4,	0x075C,	%g2
	addccc	%g6,	%o1,	%l3
loop_398:
	fcmpeq16	%f10,	%f0,	%g4
	edge32l	%o2,	%i3,	%l6
	tneg	%xcc,	0x2
	umul	%o5,	0x0D33,	%l1
	nop
	fitos	%f1,	%f14
	fstoi	%f14,	%f28
	udiv	%g1,	0x03D5,	%i0
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x48] %asi,	%g5
	movre	%l2,	%i2,	%o7
	sir	0x0609
	edge8ln	%o3,	%l5,	%i6
	fxors	%f19,	%f30,	%f29
	fandnot1	%f30,	%f16,	%f22
	fnors	%f25,	%f9,	%f22
	tpos	%icc,	0x1
	nop
	set	0x6E, %g6
	ldstub	[%l7 + %g6],	%i4
	srl	%o0,	0x10,	%o4
	tpos	%xcc,	0x4
	fpsub32	%f30,	%f0,	%f6
	for	%f28,	%f28,	%f18
	edge16ln	%i1,	%i5,	%g3
	subccc	%l0,	%i7,	%g7
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f26
	fxtod	%f26,	%f4
	xor	%l4,	0x1C09,	%g2
	edge16ln	%o6,	%g6,	%o1
	st	%f2,	[%l7 + 0x20]
	nop
	fitod	%f12,	%f26
	fdtox	%f26,	%f8
	subccc	%g4,	0x046E,	%l3
	movn	%icc,	%o2,	%l6
	umul	%i3,	0x1662,	%l1
	edge16	%g1,	%o5,	%g5
	umul	%l2,	%i2,	%i0
	fmovdne	%icc,	%f17,	%f20
	fmuld8ulx16	%f17,	%f13,	%f10
	movvs	%xcc,	%o7,	%o3
	udivcc	%l5,	0x1352,	%i6
	edge16n	%o0,	%i4,	%o4
	fmovdvc	%icc,	%f27,	%f23
	smulcc	%i1,	%g3,	%i5
	tle	%xcc,	0x5
	swap	[%l7 + 0x58],	%l0
	move	%xcc,	%g7,	%i7
	ldub	[%l7 + 0x51],	%g2
	umulcc	%o6,	0x11EB,	%l4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x0B] %asi,	%g6
	xnorcc	%o1,	0x197C,	%l3
	move	%icc,	%g4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o2,	0x03,	%i3
	set	0x40, %i4
	sta	%f5,	[%l7 + %i4] 0x14
	srl	%g1,	0x05,	%o5
	nop
	setx	0xCAD4E149904FD005,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movrgez	%l1,	0x146,	%l2
	tleu	%icc,	0x7
	or	%i2,	%i0,	%g5
	nop
	fitos	%f1,	%f18
	fstoi	%f18,	%f3
	orncc	%o3,	0x1A6A,	%o7
	fbo,a	%fcc0,	loop_399
	nop
	fitod	%f12,	%f10
	fdtos	%f10,	%f22
	fornot1s	%f8,	%f4,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_399:
	edge32ln	%l5,	%i6,	%i4
	xnorcc	%o0,	%o4,	%g3
	fbue,a	%fcc1,	loop_400
	nop
	setx	0x002956DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xFC824F90,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f13,	%f31
	tpos	%xcc,	0x2
	tsubcctv	%i1,	0x1753,	%l0
loop_400:
	array16	%i5,	%i7,	%g7
	movge	%xcc,	%o6,	%g2
	sdivx	%l4,	0x148C,	%o1
	fmovsgu	%icc,	%f2,	%f28
	subcc	%g6,	%g4,	%l6
	movneg	%icc,	%o2,	%l3
	fmovsgu	%xcc,	%f8,	%f20
	edge16n	%g1,	%o5,	%i3
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x10] %asi,	%l0
	move	%xcc,	%i2,	%l2
	movleu	%icc,	%g5,	%i0
	mova	%icc,	%o3,	%o7
	edge16ln	%i6,	%l5,	%i4
	array8	%o0,	%o4,	%i1
	fcmple32	%f10,	%f8,	%l0
	fmuld8sux16	%f29,	%f8,	%f24
	fbue,a	%fcc1,	loop_401
	movrgez	%g3,	%i7,	%i5
	xorcc	%g7,	0x023B,	%o6
	call	loop_402
loop_401:
	std	%f30,	[%l7 + 0x30]
	fpsub16	%f6,	%f20,	%f8
	movneg	%icc,	%g2,	%l4
loop_402:
	smul	%g6,	0x18B6,	%g4
	sub	%o1,	%l6,	%o2
	andn	%g1,	0x0644,	%l3
	movge	%xcc,	%o5,	%l1
	andn	%i2,	0x100A,	%i3
	fnot2s	%f28,	%f28
	addc	%l2,	0x16E3,	%g5
	edge8ln	%i0,	%o3,	%o7
	alignaddrl	%l5,	%i6,	%o0
	tn	%icc,	0x5
	fblg,a	%fcc2,	loop_403
	fmul8x16	%f5,	%f12,	%f18
	ldd	[%l7 + 0x08],	%i4
	fbge	%fcc2,	loop_404
loop_403:
	nop
	fitos	%f4,	%f27
	fstod	%f27,	%f30
	addc	%i1,	0x1466,	%o4
	fmuld8sux16	%f15,	%f12,	%f8
loop_404:
	movvs	%icc,	%g3,	%i7
	fbule,a	%fcc3,	loop_405
	tvs	%icc,	0x7
	tvc	%icc,	0x6
	std	%f26,	[%l7 + 0x38]
loop_405:
	flush	%l7 + 0x5C
	brgez,a	%l0,	loop_406
	edge8l	%i5,	%o6,	%g2
	brnz,a	%g7,	loop_407
	fnot1	%f4,	%f4
loop_406:
	fnegd	%f10,	%f26
	tne	%xcc,	0x3
loop_407:
	ldstub	[%l7 + 0x19],	%g6
	addccc	%l4,	%g4,	%o1
	stx	%o2,	[%l7 + 0x48]
	set	0x10, %l5
	ldda	[%l7 + %l5] 0x88,	%g0
	subcc	%l6,	%o5,	%l1
	nop
	setx	0xCFCFCDD6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xA3FBA9DF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f25,	%f14
	tgu	%xcc,	0x2
	fbge,a	%fcc1,	loop_408
	tn	%xcc,	0x5
	set	0x34, %o0
	lduba	[%l7 + %o0] 0x11,	%i2
loop_408:
	movrlez	%i3,	0x327,	%l3
	taddcc	%l2,	%g5,	%i0
	fmovsne	%icc,	%f22,	%f23
	mulx	%o3,	0x132A,	%o7
	set	0x24, %l0
	lduha	[%l7 + %l0] 0x88,	%i6
	tsubcc	%l5,	0x1EE7,	%o0
	stx	%i4,	[%l7 + 0x78]
	fmovsgu	%xcc,	%f25,	%f30
	ldub	[%l7 + 0x7F],	%o4
	bg,pn	%xcc,	loop_409
	lduw	[%l7 + 0x20],	%i1
	fpack16	%f8,	%f15
	andn	%i7,	%l0,	%g3
loop_409:
	fblg	%fcc3,	loop_410
	fmovscs	%xcc,	%f11,	%f21
	movrne	%i5,	0x0F5,	%g2
	addc	%g7,	0x1346,	%o6
loop_410:
	bgu,a	loop_411
	fandnot2	%f20,	%f6,	%f20
	bcs,pn	%icc,	loop_412
	movneg	%xcc,	%l4,	%g6
loop_411:
	alignaddr	%g4,	%o1,	%g1
	std	%f2,	[%l7 + 0x38]
loop_412:
	movle	%icc,	%o2,	%o5
	tvc	%xcc,	0x7
	edge16	%l1,	%l6,	%i3
	tcc	%xcc,	0x7
	bg,a	loop_413
	fabss	%f31,	%f0
	movne	%xcc,	%i2,	%l3
	movne	%xcc,	%g5,	%i0
loop_413:
	bge,a,pt	%xcc,	loop_414
	tcs	%icc,	0x7
	tg	%icc,	0x4
	fnegd	%f22,	%f10
loop_414:
	ldsh	[%l7 + 0x0E],	%o3
	movpos	%xcc,	%l2,	%o7
	bcc	loop_415
	fmovdg	%icc,	%f17,	%f10
	brgz,a	%i6,	loop_416
	ldstub	[%l7 + 0x7C],	%l5
loop_415:
	popc	%o0,	%i4
	tg	%xcc,	0x2
loop_416:
	and	%o4,	0x0598,	%i1
	fmovrdne	%l0,	%f24,	%f4
	move	%icc,	%i7,	%g3
	fmovscs	%xcc,	%f9,	%f24
	movne	%icc,	%i5,	%g7
	ld	[%l7 + 0x4C],	%f8
	ldd	[%l7 + 0x08],	%g2
	movge	%xcc,	%o6,	%l4
	prefetch	[%l7 + 0x28],	 0x1
	sra	%g6,	%o1,	%g1
	alignaddr	%g4,	%o2,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f13,	%f22
	nop
	fitos	%f11,	%f29
	fstoi	%f29,	%f14
	andcc	%l6,	0x043C,	%i3
	taddcctv	%l1,	%i2,	%g5
	movl	%xcc,	%i0,	%l3
	fpadd16s	%f23,	%f9,	%f0
	edge8l	%o3,	%l2,	%o7
	movn	%xcc,	%i6,	%o0
	movrlez	%i4,	%l5,	%i1
	fbl	%fcc3,	loop_417
	srax	%l0,	0x17,	%o4
	stb	%g3,	[%l7 + 0x65]
	edge8ln	%i7,	%i5,	%g7
loop_417:
	sdiv	%o6,	0x0118,	%g2
	fsrc1	%f12,	%f22
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x40] %asi,	%g6
	mova	%xcc,	%l4,	%g1
	fnors	%f11,	%f24,	%f23
	fbule,a	%fcc2,	loop_418
	edge8	%o1,	%o2,	%o5
	fandnot1	%f26,	%f30,	%f14
	sll	%g4,	%i3,	%l6
loop_418:
	brgz	%l1,	loop_419
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g5,	0x1336,	%i2
	udivx	%l3,	0x1D06,	%i0
loop_419:
	xnorcc	%l2,	0x15FC,	%o7
	array32	%o3,	%i6,	%o0
	movvc	%xcc,	%i4,	%i1
	fors	%f4,	%f15,	%f2
	fmovd	%f30,	%f26
	fbl,a	%fcc1,	loop_420
	fmovs	%f14,	%f25
	umulcc	%l0,	%o4,	%l5
	ta	%icc,	0x4
loop_420:
	movl	%icc,	%i7,	%i5
	tcc	%icc,	0x4
	bge	loop_421
	fpmerge	%f4,	%f23,	%f18
	ldsw	[%l7 + 0x18],	%g3
	mova	%icc,	%o6,	%g7
loop_421:
	lduw	[%l7 + 0x18],	%g2
	ta	%xcc,	0x4
	tg	%icc,	0x6
	movl	%icc,	%g6,	%g1
	fbe	%fcc0,	loop_422
	fbuge,a	%fcc3,	loop_423
	fble,a	%fcc0,	loop_424
	movleu	%icc,	%l4,	%o1
loop_422:
	xnor	%o5,	%g4,	%o2
loop_423:
	fnegd	%f30,	%f22
loop_424:
	fnot2s	%f10,	%f5
	sdivx	%i3,	0x0318,	%l1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l6
	nop
	fitos	%f14,	%f4
	and	%g5,	%l3,	%i0
	fmovsvs	%xcc,	%f1,	%f25
	sllx	%i2,	%o7,	%l2
	mulx	%o3,	%i6,	%o0
	edge32l	%i4,	%l0,	%i1
	movne	%xcc,	%o4,	%i7
	stbar
	addccc	%i5,	0x1DE3,	%g3
	sub	%l5,	0x19EC,	%o6
	nop
	fitos	%f6,	%f19
	fstox	%f19,	%f18
	fxtos	%f18,	%f26
	fors	%f19,	%f8,	%f20
	orcc	%g2,	0x166D,	%g7
	array32	%g1,	%g6,	%o1
	edge8	%l4,	%g4,	%o2
	mulx	%o5,	0x0EB8,	%i3
	udivx	%l6,	0x1F67,	%l1
	edge32ln	%l3,	%i0,	%g5
	srax	%o7,	0x13,	%i2
	udivcc	%o3,	0x069B,	%l2
	or	%o0,	0x0944,	%i4
	move	%xcc,	%i6,	%l0
	fmovdpos	%icc,	%f19,	%f25
	ldsw	[%l7 + 0x30],	%i1
	fmovsleu	%icc,	%f11,	%f26
	nop
	setx loop_425, %l0, %l1
	jmpl %l1, %i7
	array32	%o4,	%g3,	%l5
	nop
	setx	0x95EC5FD9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x5ECE3758,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f30,	%f12
	bneg	%xcc,	loop_426
loop_425:
	edge16l	%o6,	%i5,	%g7
	orncc	%g2,	%g1,	%g6
	bge,pt	%icc,	loop_427
loop_426:
	edge16	%l4,	%o1,	%g4
	call	loop_428
	tsubcctv	%o2,	0x0EAC,	%i3
loop_427:
	edge8ln	%l6,	%o5,	%l3
	smulcc	%i0,	0x0DF4,	%g5
loop_428:
	stbar
	pdist	%f26,	%f10,	%f26
	mulscc	%l1,	0x1D97,	%i2
	orcc	%o3,	%o7,	%l2
	tl	%xcc,	0x6
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x04,	%f16
	fmuld8sux16	%f10,	%f31,	%f12
	tvs	%icc,	0x6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i4
	subc	%i6,	0x082E,	%o0
	brgz,a	%i1,	loop_429
	movge	%icc,	%i7,	%o4
	nop
	fitos	%f31,	%f16
	movcs	%icc,	%g3,	%l0
loop_429:
	fsrc1	%f30,	%f4
	tg	%xcc,	0x7
	nop
	fitod	%f12,	%f12
	fdtoi	%f12,	%f16
	fpsub32	%f28,	%f0,	%f22
	fbul	%fcc1,	loop_430
	tcc	%xcc,	0x5
	brnz	%o6,	loop_431
	edge32l	%l5,	%i5,	%g2
loop_430:
	bvs,a,pn	%icc,	loop_432
	fcmple32	%f30,	%f6,	%g1
loop_431:
	srl	%g6,	0x1D,	%l4
	bge,a	loop_433
loop_432:
	fcmpgt32	%f16,	%f10,	%o1
	stx	%g7,	[%l7 + 0x58]
	ba,a,pn	%xcc,	loop_434
loop_433:
	xor	%g4,	%i3,	%o2
	set	0x5C, %i0
	ldstuba	[%l7 + %i0] 0x88,	%o5
loop_434:
	faligndata	%f30,	%f14,	%f16
	tleu	%icc,	0x3
	mova	%icc,	%l6,	%l3
	nop
	setx	loop_435,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcs,pn	%icc,	loop_436
	movle	%xcc,	%g5,	%l1
	movgu	%xcc,	%i0,	%o3
loop_435:
	ldsh	[%l7 + 0x50],	%o7
loop_436:
	movneg	%xcc,	%i2,	%i4
	movn	%xcc,	%i6,	%o0
	subccc	%i1,	0x1750,	%l2
	udiv	%i7,	0x11B3,	%g3
	fbule	%fcc3,	loop_437
	xorcc	%o4,	0x1D52,	%o6
	fabsd	%f30,	%f10
	edge32	%l0,	%i5,	%g2
loop_437:
	taddcctv	%l5,	0x02F3,	%g1
	andn	%l4,	%g6,	%o1
	fpsub16s	%f7,	%f0,	%f24
	andcc	%g4,	0x1BC6,	%i3
	fba,a	%fcc1,	loop_438
	sdivcc	%o2,	0x0426,	%o5
	tle	%xcc,	0x2
	movgu	%xcc,	%g7,	%l6
loop_438:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	ldd	[%l7 + 0x30],	%l0
	tsubcctv	%l3,	%i0,	%o3
	nop
	setx	loop_439,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%o7,	0x1E96,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i4,	%o0,	%i6
loop_439:
	movcc	%xcc,	%l2,	%i7
	xnorcc	%i1,	%o4,	%g3
	movrgz	%o6,	0x1E5,	%i5
	ld	[%l7 + 0x20],	%f0
	tsubcc	%l0,	%g2,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	stba	%l4,	[%l7 + 0x7B] %asi
	fmovrslez	%g6,	%f4,	%f2
	udivcc	%o1,	0x1399,	%g4
	fpackfix	%f8,	%f17
	array8	%g1,	%i3,	%o5
	xnor	%o2,	%l6,	%g7
	addccc	%l1,	%g5,	%i0
	fmovdg	%xcc,	%f27,	%f16
	swap	[%l7 + 0x18],	%l3
	movge	%xcc,	%o3,	%i2
	bvs,pt	%xcc,	loop_440
	fpadd32	%f0,	%f18,	%f24
	smulcc	%o7,	%o0,	%i4
	taddcctv	%l2,	0x1712,	%i7
loop_440:
	taddcc	%i6,	0x0283,	%i1
	flush	%l7 + 0x24
	tle	%icc,	0x0
	fbg,a	%fcc3,	loop_441
	udiv	%g3,	0x09F7,	%o4
	fmovdg	%xcc,	%f2,	%f18
	fbuge,a	%fcc1,	loop_442
loop_441:
	subcc	%i5,	%o6,	%g2
	sub	%l5,	0x0D29,	%l0
	tvs	%xcc,	0x1
loop_442:
	xnorcc	%l4,	%g6,	%g4
	ldsb	[%l7 + 0x15],	%o1
	udiv	%i3,	0x0882,	%g1
	edge32ln	%o5,	%o2,	%g7
	ldsh	[%l7 + 0x40],	%l1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g5,	%l6
	nop
	setx	0x194962428EF1DF94,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xE149D5E021A1C026,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f22,	%f16
	fzeros	%f0
	andncc	%l3,	%i0,	%o3
	edge32ln	%o7,	%i2,	%o0
	subccc	%i4,	%i7,	%i6
	edge32l	%l2,	%g3,	%o4
	fbule,a	%fcc2,	loop_443
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%icc,	%f2,	%f4
	popc	0x17C8,	%i5
loop_443:
	tvc	%icc,	0x1
	bcs,a	loop_444
	andn	%o6,	%i1,	%l5
	fsrc2	%f4,	%f8
	fmovspos	%icc,	%f5,	%f16
loop_444:
	fbge,a	%fcc1,	loop_445
	smulcc	%g2,	0x198E,	%l0
	edge8n	%g6,	%l4,	%g4
	sethi	0x1F46,	%o1
loop_445:
	fbo,a	%fcc3,	loop_446
	fmovsgu	%icc,	%f13,	%f13
	orcc	%g1,	%i3,	%o5
	movleu	%xcc,	%g7,	%l1
loop_446:
	fnand	%f30,	%f2,	%f16
	sub	%o2,	0x08AE,	%g5
	movgu	%icc,	%l3,	%l6
	fbu	%fcc0,	loop_447
	fmul8ulx16	%f12,	%f28,	%f20
	movgu	%xcc,	%i0,	%o7
	fxor	%f14,	%f4,	%f0
loop_447:
	udiv	%i2,	0x137D,	%o3
	sir	0x18D4
	sdivx	%i4,	0x0EAF,	%i7
	sir	0x1BF3
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x70] %asi,	%o0
	taddcc	%l2,	0x0E5D,	%g3
	subcc	%i6,	%o4,	%i5
	fxnors	%f8,	%f19,	%f14
	movpos	%icc,	%i1,	%o6
	movvs	%icc,	%g2,	%l5
	xorcc	%l0,	%l4,	%g6
	movne	%icc,	%g4,	%g1
	edge32	%i3,	%o5,	%g7
	xnorcc	%l1,	%o2,	%g5
	be	%icc,	loop_448
	umulcc	%l3,	%l6,	%o1
	edge8ln	%o7,	%i0,	%o3
	fone	%f28
loop_448:
	fxnors	%f24,	%f10,	%f3
	sir	0x1078
	bg,a	loop_449
	stbar
	membar	0x68
	wr	%g0,	0x2a,	%asi
	stba	%i2,	[%l7 + 0x72] %asi
	membar	#Sync
loop_449:
	pdist	%f2,	%f8,	%f26
	stbar
	edge32n	%i7,	%o0,	%i4
	sub	%l2,	0x0A4D,	%g3
	movpos	%icc,	%i6,	%i5
	fmovs	%f15,	%f13
	xor	%o4,	0x1CA1,	%i1
	movne	%icc,	%g2,	%l5
	alignaddr	%l0,	%o6,	%g6
	sdiv	%l4,	0x03EC,	%g4
	brgez	%g1,	loop_450
	and	%o5,	%g7,	%l1
	tne	%xcc,	0x2
	movl	%icc,	%i3,	%o2
loop_450:
	movleu	%icc,	%l3,	%l6
	edge16ln	%o1,	%o7,	%g5
	stx	%i0,	[%l7 + 0x50]
	tne	%xcc,	0x5
	mulx	%o3,	%i7,	%o0
	fbg,a	%fcc2,	loop_451
	fxnor	%f28,	%f24,	%f22
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%i4
loop_451:
	edge32l	%g3,	%i6,	%l2
	alignaddr	%i5,	%o4,	%g2
	fmovsl	%icc,	%f23,	%f15
	mova	%xcc,	%l5,	%i1
	movrne	%o6,	0x01E,	%l0
	sllx	%g6,	%l4,	%g4
	mulscc	%o5,	%g1,	%g7
	fmovscs	%xcc,	%f29,	%f28
	fbne,a	%fcc0,	loop_452
	fmovrdlez	%i3,	%f4,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x6F4DDFAC4FB5473C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB6534471CE4A0DB9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f18,	%f20
loop_452:
	fandnot2	%f28,	%f16,	%f12
	stx	%o2,	[%l7 + 0x48]
	ldx	[%l7 + 0x60],	%l3
	tpos	%xcc,	0x1
	movrlez	%l1,	0x272,	%l6
	edge16n	%o7,	%o1,	%i0
	fbuge	%fcc1,	loop_453
	fmovscs	%icc,	%f23,	%f15
	faligndata	%f28,	%f4,	%f18
	fmovrdgez	%g5,	%f2,	%f16
loop_453:
	tle	%icc,	0x1
	movpos	%xcc,	%o3,	%o0
	fors	%f3,	%f13,	%f24
	xorcc	%i7,	%i2,	%g3
	movrgz	%i4,	0x0E8,	%l2
	addc	%i6,	%o4,	%i5
	movrgez	%g2,	0x2C1,	%i1
	fmovrdgz	%o6,	%f6,	%f30
	udivx	%l0,	0x148B,	%g6
	tn	%xcc,	0x7
	orcc	%l5,	0x13F3,	%l4
	xor	%g4,	%o5,	%g1
	xnorcc	%g7,	%i3,	%l3
	ldub	[%l7 + 0x75],	%l1
	srlx	%o2,	0x1C,	%o7
	edge8l	%o1,	%i0,	%g5
	sra	%l6,	%o0,	%o3
	bcc,a,pt	%xcc,	loop_454
	edge32n	%i2,	%i7,	%g3
	movrne	%l2,	%i6,	%o4
	nop
	setx	loop_455,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_454:
	movpos	%xcc,	%i5,	%i4
	fsrc1s	%f9,	%f25
	movg	%icc,	%g2,	%i1
loop_455:
	tleu	%xcc,	0x7
	fmovrsne	%o6,	%f30,	%f6
	nop
	setx	0x94AF5E7B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f15
	bvs	%xcc,	loop_456
	tleu	%icc,	0x5
	fbge	%fcc0,	loop_457
	fmovsvc	%icc,	%f30,	%f14
loop_456:
	tl	%xcc,	0x2
	fcmpeq32	%f10,	%f18,	%g6
loop_457:
	alignaddr	%l5,	%l4,	%l0
	fmovdg	%xcc,	%f12,	%f12
	movgu	%xcc,	%o5,	%g1
	ldsh	[%l7 + 0x40],	%g7
	fbule,a	%fcc3,	loop_458
	movrgz	%g4,	0x1FF,	%l3
	udivcc	%l1,	0x1155,	%i3
	fbn	%fcc2,	loop_459
loop_458:
	edge8	%o2,	%o7,	%o1
	bl,a,pn	%icc,	loop_460
	movle	%icc,	%i0,	%g5
loop_459:
	alignaddr	%o0,	%o3,	%l6
	fxnor	%f16,	%f14,	%f22
loop_460:
	fbul,a	%fcc3,	loop_461
	tsubcctv	%i7,	0x0892,	%g3
	movcs	%icc,	%i2,	%i6
	bcs,pn	%xcc,	loop_462
loop_461:
	movn	%icc,	%o4,	%i5
	movrgz	%l2,	%i4,	%i1
	movrlz	%g2,	0x276,	%o6
loop_462:
	xor	%l5,	%l4,	%g6
	lduh	[%l7 + 0x52],	%l0
	tle	%xcc,	0x5
	umulcc	%o5,	%g1,	%g7
	udivx	%g4,	0x168D,	%l1
	tl	%icc,	0x4
	bleu,pt	%xcc,	loop_463
	prefetch	[%l7 + 0x34],	 0x1
	edge8	%l3,	%i3,	%o7
	fpadd32	%f28,	%f8,	%f6
loop_463:
	tl	%xcc,	0x0
	fmul8x16	%f21,	%f28,	%f10
	fmovrdne	%o1,	%f28,	%f10
	edge32ln	%i0,	%o2,	%g5
	xnor	%o3,	0x1517,	%o0
	fmovsne	%xcc,	%f5,	%f26
	ldsw	[%l7 + 0x34],	%i7
	fnot1s	%f21,	%f26
	andcc	%g3,	%i2,	%l6
	andcc	%i6,	%o4,	%i5
	sdivx	%l2,	0x0527,	%i1
	ta	%icc,	0x1
	udivcc	%g2,	0x1EBF,	%i4
	sdivcc	%l5,	0x0355,	%l4
	tcs	%icc,	0x3
	fmovde	%xcc,	%f27,	%f17
	movrgez	%g6,	%o6,	%l0
	brlez	%g1,	loop_464
	fmovsvs	%xcc,	%f6,	%f0
	fornot1	%f26,	%f26,	%f18
	edge32ln	%o5,	%g4,	%g7
loop_464:
	movvc	%icc,	%l1,	%i3
	edge8ln	%l3,	%o1,	%i0
	edge8	%o7,	%g5,	%o3
	tleu	%xcc,	0x2
	move	%xcc,	%o0,	%o2
	smulcc	%g3,	0x07A6,	%i2
	fpadd32	%f30,	%f8,	%f14
	fblg	%fcc1,	loop_465
	edge8	%i7,	%l6,	%o4
	mova	%xcc,	%i6,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_465:
	fcmpne16	%f24,	%f18,	%i1
	brgez	%g2,	loop_466
	movrgz	%i4,	%l5,	%l4
	fbug,a	%fcc0,	loop_467
	fbl,a	%fcc3,	loop_468
loop_466:
	fbne	%fcc0,	loop_469
	bn,a	loop_470
loop_467:
	bn,a,pt	%xcc,	loop_471
loop_468:
	sdiv	%i5,	0x0B92,	%g6
loop_469:
	movpos	%icc,	%o6,	%l0
loop_470:
	udiv	%o5,	0x04A8,	%g1
loop_471:
	udivx	%g4,	0x1A63,	%l1
	udiv	%i3,	0x0B2F,	%l3
	edge32n	%o1,	%i0,	%o7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%g6
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f4
	fxtod	%f4,	%f28
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x17,	%f16
	nop
	setx	loop_472,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%g5,	0x0F67,	%o3
	fpadd32s	%f26,	%f31,	%f28
	set	0x64, %i2
	ldswa	[%l7 + %i2] 0x18,	%o2
loop_472:
	fabss	%f14,	%f15
	subccc	%o0,	%i2,	%i7
	fbu,a	%fcc0,	loop_473
	edge8ln	%g3,	%o4,	%i6
	bvs,a	loop_474
	brlez,a	%l6,	loop_475
loop_473:
	tneg	%icc,	0x5
	ldsw	[%l7 + 0x4C],	%l2
loop_474:
	fcmple32	%f12,	%f8,	%i1
loop_475:
	addccc	%i4,	%g2,	%l4
	bvs,a	loop_476
	fmovsn	%icc,	%f30,	%f5
	edge8ln	%i5,	%l5,	%g6
	orncc	%l0,	0x08D4,	%o5
loop_476:
	nop
	setx	0x43E7B196504458D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movgu	%xcc,	%o6,	%g4
	edge32l	%g1,	%i3,	%l1
	bg,pt	%icc,	loop_477
	ldstub	[%l7 + 0x7F],	%l3
	membar	0x4B
	udivx	%i0,	0x1E19,	%o7
loop_477:
	tsubcctv	%o1,	%g7,	%g5
	movrne	%o2,	%o3,	%o0
	edge16l	%i2,	%g3,	%i7
	movre	%i6,	0x36A,	%o4
	fbo	%fcc3,	loop_478
	andn	%l2,	%l6,	%i4
	movcs	%xcc,	%g2,	%l4
	udivcc	%i1,	0x14D7,	%i5
loop_478:
	fmovdl	%xcc,	%f5,	%f30
	bpos	loop_479
	tsubcc	%g6,	0x0801,	%l5
	nop
	setx	loop_480,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%l0,	0x110,	%o5
loop_479:
	bn,pn	%icc,	loop_481
	bcc,a,pn	%icc,	loop_482
loop_480:
	umul	%o6,	0x1CE8,	%g4
	ldsh	[%l7 + 0x0A],	%i3
loop_481:
	fmovdl	%xcc,	%f14,	%f14
loop_482:
	ldd	[%l7 + 0x30],	%f14
	fabss	%f10,	%f18
	fbge	%fcc3,	loop_483
	fmovdcc	%icc,	%f23,	%f0
	fnot2	%f12,	%f18
	taddcctv	%l1,	0x0E30,	%l3
loop_483:
	fsrc2s	%f30,	%f9
	movg	%icc,	%g1,	%i0
	and	%o7,	0x1DB6,	%o1
	fpsub16	%f26,	%f2,	%f18
	fsrc2s	%f16,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g7,	%g5,	%o3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x14] %asi,	%o0
	ble,a,pn	%icc,	loop_484
	andcc	%o2,	%i2,	%i7
	fzeros	%f16
	fands	%f31,	%f22,	%f10
loop_484:
	mulx	%g3,	%i6,	%l2
	array32	%l6,	%i4,	%g2
	array32	%o4,	%l4,	%i5
	fblg,a	%fcc3,	loop_485
	std	%f6,	[%l7 + 0x58]
	set	0x29, %l3
	lduba	[%l7 + %l3] 0x15,	%i1
loop_485:
	movcc	%icc,	%g6,	%l0
	fmovsn	%icc,	%f11,	%f28
	movn	%icc,	%o5,	%o6
	tge	%icc,	0x2
	umul	%l5,	%i3,	%g4
	srax	%l3,	%l1,	%g1
	edge16n	%o7,	%i0,	%g7
	tgu	%xcc,	0x2
	set	0x1E, %o5
	stba	%o1,	[%l7 + %o5] 0x88
	bvc,a	%icc,	loop_486
	movneg	%xcc,	%g5,	%o0
	movge	%xcc,	%o3,	%o2
	ldub	[%l7 + 0x29],	%i7
loop_486:
	bgu,pt	%icc,	loop_487
	mulscc	%g3,	%i2,	%i6
	edge16	%l6,	%l2,	%i4
	fmovdvs	%icc,	%f25,	%f18
loop_487:
	tl	%icc,	0x5
	addccc	%g2,	%l4,	%i5
	nop
	setx	0xD64C401D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f28
	bn,pt	%xcc,	loop_488
	nop
	setx	loop_489,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%icc,	%o4,	%g6
	array32	%l0,	%i1,	%o6
loop_488:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_489:
	subc	%l5,	0x1EBE,	%i3
	stb	%o5,	[%l7 + 0x44]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f18,	%f28
	movle	%icc,	%g4,	%l3
	taddcc	%l1,	%o7,	%g1
	bpos,a,pn	%xcc,	loop_490
	nop
	set	0x10, %g1
	stx	%g7,	[%l7 + %g1]
	tvs	%icc,	0x4
	movleu	%icc,	%i0,	%g5
loop_490:
	fone	%f28
	subcc	%o1,	0x1917,	%o0
	movcc	%xcc,	%o2,	%i7
	fcmpeq32	%f14,	%f24,	%g3
	wr	%g0,	0x80,	%asi
	stha	%o3,	[%l7 + 0x54] %asi
	tneg	%icc,	0x0
	tsubcc	%i2,	0x0979,	%i6
	sra	%l6,	%l2,	%g2
	bleu,pn	%icc,	loop_491
	fpackfix	%f16,	%f19
	srax	%i4,	0x07,	%l4
	sll	%o4,	%g6,	%i5
loop_491:
	fxor	%f28,	%f28,	%f26
	movge	%xcc,	%l0,	%i1
	bl,a	loop_492
	nop
	set	0x08, %o1
	ldstub	[%l7 + %o1],	%l5
	nop
	setx	0xC668226125124C22,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x839C72D5FBCFBF97,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f26,	%f30
	and	%i3,	0x0184,	%o6
loop_492:
	tne	%xcc,	0x7
	tle	%xcc,	0x6
	edge16ln	%o5,	%g4,	%l1
	sra	%o7,	%g1,	%g7
	tvc	%xcc,	0x4
	fpadd16s	%f31,	%f21,	%f27
	set	0x1F, %o3
	ldstuba	[%l7 + %o3] 0x80,	%i0
	sdivx	%g5,	0x13F9,	%o1
	nop
	fitod	%f4,	%f20
	brz	%o0,	loop_493
	movrlz	%o2,	0x007,	%i7
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l3
loop_493:
	fmovs	%f9,	%f25
	fpackfix	%f26,	%f22
	ble,pt	%icc,	loop_494
	movneg	%icc,	%g3,	%i2
	fandnot1s	%f12,	%f26,	%f11
	nop
	setx	0xB66396AF47E225D8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f16
loop_494:
	movn	%icc,	%i6,	%l6
	te	%xcc,	0x5
	nop
	set	0x32, %g4
	ldsh	[%l7 + %g4],	%o3
	movrgez	%l2,	0x12F,	%g2
	movcs	%xcc,	%l4,	%i4
	stb	%g6,	[%l7 + 0x67]
	movgu	%xcc,	%o4,	%i5
	fmovdgu	%icc,	%f26,	%f10
	bshuffle	%f20,	%f20,	%f0
	fcmple16	%f14,	%f26,	%l0
	fbe	%fcc3,	loop_495
	edge16	%i1,	%l5,	%o6
	subccc	%o5,	%g4,	%i3
	tcc	%xcc,	0x4
loop_495:
	te	%icc,	0x2
	bne	loop_496
	stx	%l1,	[%l7 + 0x30]
	tgu	%icc,	0x0
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f8
loop_496:
	fmovsa	%xcc,	%f11,	%f24
	tge	%xcc,	0x4
	fble	%fcc2,	loop_497
	smul	%g1,	%g7,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g5,	%o1,	%i0
loop_497:
	movneg	%xcc,	%o0,	%i7
	movvs	%xcc,	%o2,	%l3
	brlz,a	%i2,	loop_498
	nop
	setx loop_499, %l0, %l1
	jmpl %l1, %g3
	xorcc	%l6,	0x0757,	%i6
	wr	%g0,	0x52,	%asi
	stxa	%o3,	[%g0 + 0x210] %asi
loop_498:
	fbule,a	%fcc3,	loop_500
loop_499:
	edge16ln	%l2,	%g2,	%l4
	fsrc2s	%f17,	%f28
	fmovrdgez	%g6,	%f4,	%f18
loop_500:
	fnands	%f26,	%f21,	%f10
	bleu,a,pt	%xcc,	loop_501
	array16	%i4,	%i5,	%o4
	orcc	%l0,	%i1,	%o6
	andncc	%o5,	%l5,	%i3
loop_501:
	edge8ln	%g4,	%l1,	%g1
	movvs	%xcc,	%o7,	%g5
	alignaddrl	%o1,	%i0,	%g7
	tvs	%xcc,	0x3
	fmovs	%f5,	%f11
	edge16l	%i7,	%o2,	%l3
	tn	%icc,	0x4
	fmovdvc	%icc,	%f28,	%f19
	srl	%i2,	0x01,	%o0
	fnot2	%f2,	%f4
	ldsb	[%l7 + 0x75],	%g3
	movcs	%xcc,	%l6,	%i6
	movrgz	%l2,	%g2,	%o3
	orn	%g6,	0x1A00,	%i4
	bge,a	%icc,	loop_502
	fmovsvs	%xcc,	%f19,	%f30
	and	%l4,	0x0FA9,	%o4
	movrne	%i5,	0x043,	%l0
loop_502:
	andn	%o6,	0x1DCA,	%o5
	fmovdcc	%xcc,	%f9,	%f26
	bvc	%icc,	loop_503
	nop
	set	0x64, %i7
	ldsw	[%l7 + %i7],	%i1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x7C] %asi,	%l5
loop_503:
	edge8l	%i3,	%g4,	%g1
	movpos	%icc,	%l1,	%o7
	nop
	fitos	%f9,	%f18
	nop
	setx	loop_504,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%g5,	%i0
	fmovdn	%icc,	%f31,	%f24
	fmovsleu	%icc,	%f6,	%f17
loop_504:
	movle	%xcc,	%g7,	%o1
	edge32n	%o2,	%l3,	%i7
	fbl,a	%fcc3,	loop_505
	movcc	%xcc,	%o0,	%g3
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f0
loop_505:
	array16	%l6,	%i6,	%l2
	edge32n	%i2,	%g2,	%o3
	sll	%i4,	0x09,	%g6
	alignaddr	%o4,	%l4,	%l0
	orncc	%i5,	0x1E06,	%o5
	sir	0x1CA1
	set	0x108, %g3
	stxa	%o6,	[%g0 + %g3] 0x21
	edge32	%l5,	%i3,	%i1
	fmovdl	%xcc,	%f24,	%f25
	fmovsvs	%icc,	%f26,	%f8
	lduw	[%l7 + 0x38],	%g4
	umul	%g1,	0x0384,	%l1
	fpmerge	%f8,	%f24,	%f14
	srax	%g5,	%i0,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o1,	%o7,	%l3
	sllx	%o2,	0x13,	%i7
	edge16n	%o0,	%g3,	%i6
	sdivx	%l6,	0x1F6D,	%l2
	subc	%i2,	0x0DD8,	%g2
	sdivx	%o3,	0x0EC0,	%g6
	edge16l	%o4,	%i4,	%l4
	xnor	%i5,	0x16FC,	%o5
	movvs	%icc,	%o6,	%l0
	fbue	%fcc0,	loop_506
	addc	%l5,	%i1,	%g4
	sllx	%i3,	%g1,	%g5
	alignaddrl	%i0,	%g7,	%l1
loop_506:
	nop
	wr	%g0,	0x88,	%asi
	sta	%f1,	[%l7 + 0x44] %asi
	taddcc	%o1,	%l3,	%o2
	fmovrdlz	%o7,	%f28,	%f12
	fbul	%fcc2,	loop_507
	bcc	%xcc,	loop_508
	ldsh	[%l7 + 0x12],	%o0
	xnor	%g3,	0x0708,	%i6
loop_507:
	fornot1	%f4,	%f14,	%f18
loop_508:
	fbn	%fcc3,	loop_509
	ta	%xcc,	0x2
	edge32n	%l6,	%l2,	%i7
	wr	%g0,	0x88,	%asi
	sta	%f29,	[%l7 + 0x3C] %asi
loop_509:
	te	%icc,	0x4
	edge8n	%g2,	%o3,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xF0D81777B691473A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB85C8E5AF61B8240,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f16,	%f18
	fbuge	%fcc2,	loop_510
	edge32n	%o4,	%g6,	%l4
	array8	%i4,	%o5,	%i5
	srl	%l0,	%l5,	%o6
loop_510:
	smulcc	%g4,	%i3,	%i1
	stw	%g1,	[%l7 + 0x34]
	stx	%i0,	[%l7 + 0x20]
	add	%g7,	0x09B5,	%l1
	tge	%xcc,	0x0
	fbo,a	%fcc3,	loop_511
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f16,	%f16
	edge8ln	%o1,	%g5,	%o2
loop_511:
	fmul8sux16	%f28,	%f14,	%f16
	fornot1	%f0,	%f0,	%f4
	fpmerge	%f28,	%f8,	%f28
	bgu	loop_512
	fcmple32	%f0,	%f30,	%o7
	fbuge,a	%fcc1,	loop_513
	fands	%f11,	%f2,	%f21
loop_512:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x74] %asi,	%l3
loop_513:
	fmovrde	%g3,	%f18,	%f2
	fxor	%f10,	%f24,	%f4
	brgz	%o0,	loop_514
	orn	%i6,	0x0F22,	%l6
	fpmerge	%f23,	%f28,	%f28
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x4C] %asi,	%l2
loop_514:
	pdist	%f6,	%f18,	%f8
	set	0x70, %g5
	swapa	[%l7 + %g5] 0x11,	%g2
	set	0x14, %o4
	sta	%f25,	[%l7 + %o4] 0x11
	set	0x8, %o6
	stxa	%i7,	[%g0 + %o6] 0x21
	array8	%o3,	%o4,	%g6
	fsrc2s	%f24,	%f4
	nop
	setx	0x875949D573D2251D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x2AC5DA29D7375F6E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f8,	%f24
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f12
	edge32n	%i2,	%l4,	%i4
	nop
	setx	loop_515,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%xcc,	0x2
	array32	%i5,	%l0,	%l5
	alignaddr	%o5,	%g4,	%o6
loop_515:
	stx	%i3,	[%l7 + 0x70]
	bne,a,pt	%icc,	loop_516
	orcc	%i1,	%i0,	%g7
	fsrc2s	%f14,	%f18
	movl	%xcc,	%g1,	%l1
loop_516:
	nop
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	xnorcc	%g5,	0x1AA3,	%o7
	edge16n	%o2,	%g3,	%o0
	ldsh	[%l7 + 0x38],	%l3
	xnorcc	%i6,	%l6,	%g2
	tleu	%xcc,	0x0
	swap	[%l7 + 0x30],	%l2
	edge32n	%i7,	%o3,	%o4
	orncc	%g6,	0x0D78,	%l4
	smulcc	%i4,	%i2,	%l0
	fnor	%f0,	%f28,	%f10
	tneg	%icc,	0x6
	fmul8x16au	%f18,	%f18,	%f28
	movgu	%icc,	%i5,	%l5
	fmovrdne	%g4,	%f8,	%f26
	edge16l	%o5,	%i3,	%i1
	andcc	%o6,	%g7,	%g1
	movpos	%icc,	%i0,	%l1
	ble	loop_517
	udiv	%g5,	0x0E20,	%o1
	edge32n	%o7,	%o2,	%g3
	fmul8x16au	%f16,	%f10,	%f4
loop_517:
	nop
	fitod	%f6,	%f14
	nop
	setx	0xAD2064864B4A70C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4BBC3FAA368E9217,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f24,	%f6
	fmovdl	%xcc,	%f25,	%f7
	addcc	%o0,	%i6,	%l3
	wr	%g0,	0x19,	%asi
	stha	%g2,	[%l7 + 0x46] %asi
	nop
	setx loop_518, %l0, %l1
	jmpl %l1, %l2
	fcmpgt16	%f6,	%f18,	%l6
	fpsub16	%f28,	%f28,	%f6
	fbne	%fcc0,	loop_519
loop_518:
	orn	%o3,	0x1830,	%i7
	orn	%o4,	%g6,	%l4
	ldub	[%l7 + 0x77],	%i4
loop_519:
	movrlez	%i2,	0x341,	%l0
	array32	%l5,	%i5,	%o5
	movrgez	%i3,	%i1,	%g4
	fone	%f22
	fmovsle	%xcc,	%f27,	%f24
	nop
	setx	loop_520,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcs	%xcc,	0x6
	edge8ln	%o6,	%g1,	%i0
	fpack16	%f28,	%f25
loop_520:
	sdivcc	%g7,	0x0A92,	%g5
	movcs	%icc,	%l1,	%o1
	subc	%o7,	0x05E9,	%g3
	xor	%o2,	0x01F3,	%i6
	std	%f12,	[%l7 + 0x50]
	sra	%o0,	0x14,	%g2
	fbug	%fcc0,	loop_521
	sdiv	%l2,	0x1AC7,	%l6
	nop
	setx	loop_522,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrsgz	%o3,	%f9,	%f7
loop_521:
	fpadd16s	%f14,	%f15,	%f0
	fbg,a	%fcc2,	loop_523
loop_522:
	tgu	%icc,	0x3
	edge16n	%l3,	%o4,	%g6
	addccc	%i7,	0x1AF3,	%i4
loop_523:
	edge16n	%i2,	%l4,	%l5
	edge8ln	%i5,	%l0,	%i3
	stx	%o5,	[%l7 + 0x48]
	fmovrde	%i1,	%f14,	%f4
	movcs	%xcc,	%g4,	%g1
	tvs	%xcc,	0x4
	tsubcc	%i0,	%g7,	%g5
	nop
	fitod	%f6,	%f6
	fdtoi	%f6,	%f31
	set	0x2E, %i1
	lduha	[%l7 + %i1] 0x04,	%l1
	movvs	%icc,	%o1,	%o7
	sub	%g3,	0x14AC,	%o2
	array16	%o6,	%o0,	%g2
	movle	%xcc,	%l2,	%l6
	edge8ln	%i6,	%o3,	%l3
	nop
	setx	loop_524,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%o4,	0x0ACC,	%g6
	addcc	%i4,	0x00B4,	%i2
	xnor	%l4,	0x1179,	%l5
loop_524:
	tpos	%xcc,	0x7
	fnor	%f18,	%f2,	%f24
	tgu	%icc,	0x6
	movcs	%xcc,	%i5,	%i7
	and	%i3,	0x18C1,	%o5
	nop
	setx	0x6F932FFBB0643EDA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	brz,a	%i1,	loop_525
	fmovrdlez	%g4,	%f24,	%f30
	fbule,a	%fcc3,	loop_526
	srax	%g1,	%i0,	%g7
loop_525:
	udivx	%l0,	0x16B5,	%l1
	tsubcctv	%o1,	0x0C2D,	%g5
loop_526:
	nop
	fitod	%f11,	%f28
	set	0x20, %o2
	prefetcha	[%l7 + %o2] 0x0c,	 0x0
	nop
	setx	0xA66CE371,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xD3B8CB78,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f18,	%f23
	brgez,a	%o2,	loop_527
	st	%f11,	[%l7 + 0x14]
	sdiv	%o6,	0x0C23,	%o7
	sth	%o0,	[%l7 + 0x32]
loop_527:
	nop
	setx	0xA7437ACB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f16
	fnegs	%f8,	%f0
	lduw	[%l7 + 0x40],	%l2
	movre	%l6,	%i6,	%g2
	fmovsleu	%icc,	%f30,	%f8
	edge32n	%o3,	%o4,	%g6
	taddcc	%l3,	0x11D0,	%i2
	tcc	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i4
	movrlez	%l5,	%i5,	%l4
	mova	%icc,	%i3,	%i7
	sub	%i1,	%o5,	%g4
	tvs	%icc,	0x6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x28] %asi,	%g1
	bne,a	loop_528
	sethi	0x02B3,	%i0
	smulcc	%g7,	%l0,	%o1
	tl	%xcc,	0x5
loop_528:
	movvs	%icc,	%g5,	%l1
	tvs	%icc,	0x7
	bge	%icc,	loop_529
	nop
	setx	loop_530,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bpos,a,pt	%icc,	loop_531
	tl	%xcc,	0x6
loop_529:
	brgz,a	%g3,	loop_532
loop_530:
	sdiv	%o2,	0x1C37,	%o7
loop_531:
	movl	%xcc,	%o0,	%o6
	bne,a,pt	%icc,	loop_533
loop_532:
	bg,pn	%icc,	loop_534
	tge	%icc,	0x5
	smulcc	%l2,	0x1B67,	%i6
loop_533:
	movrne	%l6,	0x215,	%o3
loop_534:
	nop
	set	0x2C, %g2
	lduwa	[%l7 + %g2] 0x15,	%g2
	srlx	%o4,	0x1C,	%g6
	sra	%l3,	0x1C,	%i2
	fmovde	%icc,	%f30,	%f23
	membar	0x02
	nop
	fitod	%f29,	%f16
	edge16ln	%l5,	%i5,	%i4
	array32	%i3,	%i7,	%l4
	bcc,a,pn	%xcc,	loop_535
	bg	loop_536
	movre	%i1,	0x110,	%g4
	fzeros	%f25
loop_535:
	fpadd16	%f10,	%f22,	%f24
loop_536:
	fpsub32s	%f19,	%f24,	%f13
	fmul8x16au	%f15,	%f20,	%f16
	tne	%icc,	0x3
	array32	%o5,	%g1,	%g7
	movl	%xcc,	%i0,	%o1
	bleu	%xcc,	loop_537
	fmovrdlz	%g5,	%f14,	%f0
	tgu	%icc,	0x0
	edge32	%l0,	%g3,	%l1
loop_537:
	edge8n	%o2,	%o0,	%o6
	xnorcc	%o7,	0x0C0B,	%i6
	alignaddr	%l6,	%o3,	%l2
	fmovsg	%icc,	%f20,	%f23
	edge32l	%g2,	%g6,	%l3
	array32	%o4,	%l5,	%i5
	movg	%xcc,	%i4,	%i3
	add	%i7,	0x1B6E,	%l4
	fandnot1s	%f10,	%f2,	%f2
	taddcctv	%i2,	0x1E5E,	%g4
	fmovsge	%icc,	%f15,	%f20
	fmul8x16al	%f2,	%f10,	%f30
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x34] %asi,	%o5
	fmul8x16au	%f26,	%f2,	%f12
	xnorcc	%g1,	%i1,	%g7
	addcc	%i0,	%o1,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g3,	%l1,	%l0
	bge	loop_538
	tneg	%xcc,	0x4
	movgu	%icc,	%o2,	%o0
	brgez	%o6,	loop_539
loop_538:
	xor	%o7,	%l6,	%i6
	xor	%l2,	0x19BF,	%o3
	fbo	%fcc3,	loop_540
loop_539:
	array16	%g6,	%l3,	%o4
	fmovscs	%icc,	%f2,	%f24
	addccc	%g2,	%l5,	%i4
loop_540:
	orncc	%i5,	%i7,	%i3
	fabss	%f23,	%f15
	edge32	%i2,	%g4,	%o5
	swap	[%l7 + 0x38],	%l4
	andn	%i1,	%g7,	%i0
	nop
	setx	0xF3D2CAE2E041EC9E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fmul8x16	%f6,	%f18,	%f20
	smulcc	%o1,	%g1,	%g5
	taddcctv	%g3,	%l1,	%o2
	fpsub32	%f14,	%f18,	%f0
	udivx	%o0,	0x003B,	%l0
	and	%o7,	0x0EA6,	%o6
	xor	%i6,	0x0933,	%l2
	subc	%o3,	0x1B53,	%l6
	orn	%l3,	0x0DC5,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g6,	0x1EA2,	%g2
	array32	%i4,	%i5,	%i7
	bvc,pn	%icc,	loop_541
	brz,a	%l5,	loop_542
	edge16ln	%i2,	%i3,	%g4
	sll	%o5,	0x0E,	%l4
loop_541:
	movvs	%xcc,	%g7,	%i0
loop_542:
	tcc	%icc,	0x1
	fmovsg	%icc,	%f11,	%f5
	xnor	%i1,	%g1,	%o1
	fmovdcc	%xcc,	%f28,	%f1
	tn	%icc,	0x4
	edge32n	%g5,	%l1,	%g3
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x10,	 0x0
	bn,a	%icc,	loop_543
	fbul,a	%fcc3,	loop_544
	lduh	[%l7 + 0x44],	%l0
	xor	%o2,	%o7,	%i6
loop_543:
	fornot1s	%f22,	%f11,	%f7
loop_544:
	edge8n	%o6,	%l2,	%l6
	move	%icc,	%l3,	%o4
	taddcctv	%o3,	0x1DC8,	%g6
	fmovdneg	%xcc,	%f5,	%f5
	fsrc2	%f14,	%f28
	nop
	fitos	%f7,	%f30
	tsubcc	%g2,	%i4,	%i7
	fbo,a	%fcc0,	loop_545
	srl	%i5,	%i2,	%l5
	membar	0x40
	fpackfix	%f10,	%f0
loop_545:
	movneg	%xcc,	%i3,	%o5
	fmovrdlez	%g4,	%f22,	%f12
	sllx	%g7,	0x1B,	%l4
	nop
	setx	loop_546,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdcs	%icc,	%f31,	%f9
	edge8l	%i1,	%i0,	%g1
	nop
	fitod	%f0,	%f20
	fdtox	%f20,	%f6
loop_546:
	sdivx	%g5,	0x0DDB,	%l1
	brgz	%o1,	loop_547
	nop
	setx	0x090E971E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x0454F693,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f30,	%f12
	movrne	%o0,	%l0,	%o2
	bne,a,pn	%icc,	loop_548
loop_547:
	be,pn	%icc,	loop_549
	subccc	%o7,	0x0581,	%g3
	tleu	%icc,	0x2
loop_548:
	subcc	%o6,	%i6,	%l2
loop_549:
	edge32ln	%l3,	%l6,	%o3
	andncc	%g6,	%o4,	%i4
	edge16ln	%g2,	%i5,	%i2
	udiv	%l5,	0x1794,	%i7
	movvc	%icc,	%i3,	%o5
	movre	%g4,	0x08A,	%l4
	fmovscc	%xcc,	%f23,	%f18
	fpadd16s	%f8,	%f30,	%f2
	set	0x70, %l2
	lda	[%l7 + %l2] 0x0c,	%f7
	fbne,a	%fcc1,	loop_550
	bge,a,pn	%icc,	loop_551
	fmovdpos	%xcc,	%f1,	%f6
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
loop_550:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_551:
	tvs	%xcc,	0x7
	movvc	%icc,	%g7,	%i0
	movne	%xcc,	%g5,	%l1
	addc	%g1,	0x1C48,	%o0
	edge16	%o1,	%o2,	%l0
	fmovrde	%g3,	%f24,	%f16
	fbue,a	%fcc3,	loop_552
	fxors	%f6,	%f16,	%f30
	sir	0x0D62
	edge16n	%o7,	%i6,	%o6
loop_552:
	bne,a	%xcc,	loop_553
	fpackfix	%f14,	%f26
	fblg,a	%fcc2,	loop_554
	andcc	%l3,	%l6,	%o3
loop_553:
	ba,pt	%icc,	loop_555
	udivx	%l2,	0x099F,	%o4
loop_554:
	fsrc1	%f16,	%f8
	be,a,pn	%icc,	loop_556
loop_555:
	bn	%icc,	loop_557
	tg	%icc,	0x2
	flush	%l7 + 0x6C
loop_556:
	smulcc	%g6,	0x10FD,	%i4
loop_557:
	edge16ln	%i5,	%i2,	%l5
	taddcc	%i7,	0x1782,	%i3
	fsrc1s	%f12,	%f14
	movrgz	%g2,	0x0A1,	%o5
	sub	%l4,	%g4,	%g7
	sth	%i1,	[%l7 + 0x32]
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x77A30016,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xB39B0BFF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f3,	%f15
	fmovdne	%xcc,	%f31,	%f20
	taddcctv	%i0,	%l1,	%g5
	mulscc	%g1,	0x1BC4,	%o0
	prefetch	[%l7 + 0x10],	 0x3
	edge32n	%o1,	%o2,	%g3
	movn	%icc,	%l0,	%i6
	fblg	%fcc1,	loop_558
	nop
	fitod	%f5,	%f28
	sethi	0x017C,	%o6
	mova	%icc,	%l3,	%l6
loop_558:
	fcmpeq16	%f24,	%f4,	%o7
	fmovdgu	%xcc,	%f3,	%f0
	sethi	0x0A20,	%o3
	xor	%o4,	%l2,	%g6
	ldsh	[%l7 + 0x62],	%i4
	tneg	%xcc,	0x3
	edge16l	%i2,	%l5,	%i7
	tpos	%xcc,	0x0
	fsrc1s	%f20,	%f0
	fpsub32	%f2,	%f4,	%f20
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x34] %asi,	%i3
	tn	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x50] %asi
	edge32l	%g2,	%o5,	%i5
	bgu,pt	%xcc,	loop_559
	edge16l	%l4,	%g4,	%g7
	movvs	%xcc,	%i1,	%l1
	array8	%i0,	%g5,	%o0
loop_559:
	bvc,a,pn	%xcc,	loop_560
	taddcctv	%o1,	%o2,	%g3
	movvs	%xcc,	%l0,	%g1
	bleu,a	%icc,	loop_561
loop_560:
	nop
	setx	0xC08ACD94D06DACA5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	move	%xcc,	%o6,	%i6
	tleu	%xcc,	0x5
loop_561:
	edge8l	%l6,	%o7,	%o3
	umul	%l3,	0x0A3F,	%o4
	sdivcc	%g6,	0x065E,	%l2
	wr	%g0,	0x88,	%asi
	sta	%f3,	[%l7 + 0x4C] %asi
	fzero	%f18
	orcc	%i2,	%i4,	%l5
	fbn,a	%fcc2,	loop_562
	udiv	%i7,	0x0212,	%g2
	movrgz	%o5,	0x14E,	%i5
	movrlez	%l4,	%g4,	%i3
loop_562:
	sethi	0x07C8,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i1,	0x1B84,	%l1
	fxors	%f25,	%f5,	%f28
	ld	[%l7 + 0x10],	%f18
	brz,a	%i0,	loop_563
	addccc	%o0,	%g5,	%o2
	movvc	%icc,	%o1,	%g3
	udivcc	%g1,	0x188D,	%o6
loop_563:
	ldx	[%l7 + 0x40],	%i6
	nop
	fitod	%f12,	%f10
	fdtos	%f10,	%f17
	tg	%icc,	0x4
	tcs	%icc,	0x2
	andn	%l6,	0x141A,	%o7
	tsubcctv	%l0,	%l3,	%o4
	edge8n	%g6,	%o3,	%l2
	fandnot1s	%f26,	%f18,	%f8
	fbn,a	%fcc3,	loop_564
	fmovrsne	%i2,	%f22,	%f11
	movre	%i4,	%l5,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_564:
	nop
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x44] %asi,	%g2
	orn	%o5,	0x1389,	%i5
	wr	%g0,	0x89,	%asi
	sta	%f22,	[%l7 + 0x64] %asi
	fmovdneg	%icc,	%f27,	%f17
	fmovsvs	%xcc,	%f31,	%f10
	fzero	%f24
	tl	%xcc,	0x6
	tn	%icc,	0x6
	swap	[%l7 + 0x5C],	%l4
	movrlez	%g4,	0x1A3,	%i3
	array8	%i1,	%l1,	%i0
	andn	%o0,	%g7,	%g5
	tle	%xcc,	0x6
	tgu	%icc,	0x4
	movneg	%xcc,	%o2,	%o1
	sra	%g1,	0x1C,	%g3
	fmovse	%xcc,	%f28,	%f23
	fmovdneg	%xcc,	%f4,	%f14
	edge16l	%i6,	%o6,	%o7
	movn	%icc,	%l6,	%l3
	movge	%xcc,	%o4,	%l0
	stx	%o3,	[%l7 + 0x68]
	fornot1	%f16,	%f26,	%f10
	mulscc	%l2,	0x02D7,	%i2
	ble,pn	%xcc,	loop_565
	fmovdg	%xcc,	%f16,	%f25
	bvs,a,pt	%xcc,	loop_566
	movcc	%icc,	%i4,	%g6
loop_565:
	tvs	%icc,	0x1
	fmovrdlz	%l5,	%f18,	%f14
loop_566:
	move	%xcc,	%i7,	%g2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%o4
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	mova	%icc,	%l4,	%i5
	std	%f30,	[%l7 + 0x48]
	andcc	%i3,	%g4,	%i1
	or	%i0,	%l1,	%o0
	tle	%icc,	0x4
	sdivx	%g7,	0x04EB,	%g5
	alignaddr	%o1,	%g1,	%o2
	bcc	loop_567
	edge8ln	%i6,	%g3,	%o7
	tgu	%icc,	0x7
	array16	%o6,	%l3,	%l6
loop_567:
	fand	%f20,	%f18,	%f6
	fmovrdgz	%l0,	%f24,	%f30
	tsubcc	%o3,	%l2,	%i2
	xnorcc	%o4,	0x1489,	%g6
	movle	%xcc,	%l5,	%i7
	taddcctv	%i4,	0x0934,	%o5
	fbu	%fcc3,	loop_568
	movrlez	%g2,	%l4,	%i5
	srlx	%i3,	%i1,	%g4
	nop
	setx	0x604F7B47,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
loop_568:
	fmovsne	%xcc,	%f29,	%f21
	fbue,a	%fcc1,	loop_569
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f14
	fxtod	%f14,	%f20
	addcc	%l1,	0x1B06,	%o0
	fmovrslez	%i0,	%f14,	%f7
loop_569:
	addcc	%g5,	%o1,	%g7
	subc	%o2,	%g1,	%g3
	subc	%i6,	%o6,	%o7
	wr	%g0,	0xe3,	%asi
	stxa	%l6,	[%l7 + 0x10] %asi
	membar	#Sync
	fandnot2s	%f7,	%f16,	%f24
	sdivx	%l0,	0x05CA,	%o3
	fpmerge	%f0,	%f29,	%f28
	tpos	%xcc,	0x2
	fmovsa	%icc,	%f19,	%f11
	subccc	%l2,	0x05FC,	%i2
	movpos	%xcc,	%o4,	%g6
	fnands	%f1,	%f27,	%f27
	fmovdpos	%icc,	%f9,	%f25
	ta	%xcc,	0x5
	movl	%icc,	%l3,	%i7
	or	%i4,	0x148F,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f28,	%f4,	%f26
	fmovdvc	%icc,	%f2,	%f17
	edge8l	%o5,	%l4,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g2,	%i3,	%g4
	movrne	%l1,	0x1A7,	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%g5
	fmovdleu	%xcc,	%f4,	%f20
	fmovdne	%icc,	%f24,	%f9
	fmovsge	%icc,	%f2,	%f26
	movneg	%icc,	%o1,	%g7
	smulcc	%o2,	%i0,	%g3
	orncc	%g1,	0x152D,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o7,	%o6,	%l6
	sra	%o3,	%l2,	%l0
	edge16ln	%o4,	%i2,	%l3
	subccc	%i7,	%i4,	%g6
	edge32l	%o5,	%l5,	%i5
	fmovdvc	%xcc,	%f19,	%f7
	tge	%icc,	0x1
	fblg	%fcc2,	loop_570
	addc	%l4,	0x183F,	%i3
	fmovsge	%icc,	%f10,	%f4
	fsrc2s	%f8,	%f28
loop_570:
	fble	%fcc3,	loop_571
	andncc	%g2,	%g4,	%o0
	fmovdpos	%xcc,	%f17,	%f30
	or	%i1,	0x16CE,	%g5
loop_571:
	fmovdle	%icc,	%f26,	%f0
	add	%l7,	0x24,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x04,	%l1,	%g7
	udiv	%o2,	0x1525,	%i0
	fones	%f13
	ble,a	%xcc,	loop_572
	orn	%o1,	0x09F7,	%g1
	udivcc	%i6,	0x11F7,	%g3
	movge	%icc,	%o6,	%l6
loop_572:
	movrgz	%o3,	%o7,	%l2
	movge	%xcc,	%o4,	%l0
	edge16l	%i2,	%l3,	%i7
	edge8	%g6,	%o5,	%i4
	fmovdg	%icc,	%f15,	%f21
	fornot1s	%f26,	%f20,	%f7
	fbg,a	%fcc1,	loop_573
	andncc	%i5,	%l5,	%i3
	fmovrdne	%l4,	%f8,	%f2
	fmovrslz	%g2,	%f7,	%f29
loop_573:
	ldsw	[%l7 + 0x40],	%o0
	subccc	%i1,	%g4,	%g5
	mulx	%g7,	0x1207,	%o2
	sir	0x12EC
	fmovdgu	%xcc,	%f12,	%f10
	fmovd	%f10,	%f26
	taddcctv	%i0,	0x1BD0,	%o1
	fcmpgt32	%f16,	%f12,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i6,	%g3,	%g1
	alignaddr	%o6,	%o3,	%o7
	membar	0x0C
	movleu	%icc,	%l2,	%o4
	edge32l	%l6,	%l0,	%l3
	array8	%i2,	%g6,	%o5
	bg	loop_574
	edge16ln	%i4,	%i7,	%i5
	nop
	fitos	%f4,	%f20
	fstoi	%f20,	%f25
	ldd	[%l7 + 0x58],	%f30
loop_574:
	sethi	0x19BD,	%l5
	movrlz	%i3,	0x061,	%l4
	ldsw	[%l7 + 0x68],	%o0
	andncc	%i1,	%g2,	%g5
	nop
	set	0x30, %i5
	ldx	[%l7 + %i5],	%g7
	movleu	%xcc,	%o2,	%g4
	tsubcc	%i0,	%o1,	%l1
	tg	%icc,	0x2
	brnz	%i6,	loop_575
	fmul8sux16	%f20,	%f20,	%f2
	movvc	%xcc,	%g3,	%g1
	orncc	%o3,	0x1B21,	%o6
loop_575:
	sllx	%o7,	%l2,	%l6
	edge16l	%o4,	%l0,	%i2
	fbo	%fcc3,	loop_576
	movvs	%icc,	%g6,	%o5
	ble	%icc,	loop_577
	movpos	%icc,	%i4,	%l3
loop_576:
	tvs	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_577:
	edge8	%i5,	%i7,	%i3
	set	0x3F, %i6
	ldstuba	[%l7 + %i6] 0x19,	%l5
	movcc	%icc,	%o0,	%i1
	fpadd16s	%f1,	%f23,	%f8
	addccc	%g2,	%g5,	%g7
	tl	%icc,	0x1
	xorcc	%o2,	%g4,	%l4
	fmovdvs	%xcc,	%f25,	%f18
	fbug,a	%fcc3,	loop_578
	te	%xcc,	0x3
	movvc	%icc,	%i0,	%o1
	stw	%l1,	[%l7 + 0x10]
loop_578:
	fsrc1	%f30,	%f8
	st	%f10,	[%l7 + 0x44]
	movrlz	%g3,	%i6,	%g1
	fbo,a	%fcc2,	loop_579
	edge8l	%o6,	%o3,	%o7
	subcc	%l6,	0x1AD9,	%o4
	fmovdneg	%icc,	%f23,	%f17
loop_579:
	udiv	%l0,	0x15B7,	%l2
	fmuld8sux16	%f8,	%f10,	%f24
	alignaddr	%g6,	%o5,	%i2
	sra	%l3,	0x14,	%i4
	xorcc	%i7,	0x0F20,	%i3
	movle	%icc,	%l5,	%i5
	edge32l	%i1,	%g2,	%g5
	tleu	%icc,	0x1
	fmovsne	%icc,	%f8,	%f30
	edge8	%g7,	%o2,	%o0
	addccc	%l4,	%g4,	%o1
	bl	loop_580
	tvc	%icc,	0x6
	sdiv	%i0,	0x1FDE,	%l1
	srlx	%i6,	%g1,	%g3
loop_580:
	fpackfix	%f22,	%f0
	subccc	%o3,	%o7,	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o4,	%l0
	edge32n	%o6,	%g6,	%o5
	fbu	%fcc2,	loop_581
	tle	%xcc,	0x2
	fmul8x16al	%f28,	%f11,	%f24
	fnegd	%f14,	%f10
loop_581:
	fmovdg	%xcc,	%f7,	%f7
	nop
	fitos	%f1,	%f28
	fstox	%f28,	%f0
	fmovsne	%icc,	%f6,	%f3
	fmovrde	%l2,	%f26,	%f28
	tge	%xcc,	0x1
	tsubcctv	%l3,	0x1768,	%i2
	brgz,a	%i7,	loop_582
	sll	%i4,	0x03,	%l5
	fpmerge	%f3,	%f3,	%f16
	tl	%xcc,	0x2
loop_582:
	fone	%f12
	tvs	%xcc,	0x3
	orncc	%i5,	0x1A08,	%i1
	smulcc	%i3,	%g5,	%g7
	addc	%o2,	0x08DF,	%g2
	fmovsgu	%xcc,	%f29,	%f3
	movgu	%icc,	%o0,	%l4
	swap	[%l7 + 0x58],	%o1
	fmovsneg	%xcc,	%f0,	%f13
	flush	%l7 + 0x20
	tne	%icc,	0x0
	ldub	[%l7 + 0x7D],	%g4
	sllx	%i0,	0x1C,	%l1
	addcc	%g1,	%g3,	%o3
	fbu	%fcc2,	loop_583
	tgu	%xcc,	0x2
	movgu	%xcc,	%i6,	%l6
	orn	%o7,	%o4,	%l0
loop_583:
	edge8ln	%g6,	%o6,	%o5
	mova	%xcc,	%l3,	%l2
	fnors	%f16,	%f5,	%f25
	fnot2s	%f6,	%f21
	fba	%fcc3,	loop_584
	subcc	%i7,	%i4,	%l5
	movrlez	%i2,	0x05F,	%i5
	add	%i1,	%g5,	%g7
loop_584:
	fmovd	%f8,	%f28
	movrgez	%o2,	0x0A8,	%i3
	edge32	%o0,	%g2,	%l4
	fcmpgt32	%f14,	%f20,	%o1
	movcc	%xcc,	%i0,	%g4
	edge32ln	%g1,	%g3,	%o3
	bcs	%icc,	loop_585
	edge32	%l1,	%i6,	%o7
	edge16n	%o4,	%l6,	%l0
	nop
	fitod	%f10,	%f24
	fdtox	%f24,	%f12
loop_585:
	popc	0x0C5C,	%o6
	fmovsge	%icc,	%f13,	%f25
	stw	%o5,	[%l7 + 0x2C]
	taddcc	%g6,	%l3,	%l2
	set	0x30, %o7
	prefetcha	[%l7 + %o7] 0x14,	 0x0
	movn	%xcc,	%i4,	%l5
	edge32n	%i5,	%i2,	%i1
	xnor	%g7,	%o2,	%g5
	andncc	%o0,	%g2,	%i3
	te	%icc,	0x7
	umulcc	%o1,	%l4,	%i0
	set	0x74, %g6
	stha	%g1,	[%l7 + %g6] 0x2b
	membar	#Sync
	fnot2s	%f10,	%f24
	subccc	%g4,	%o3,	%g3
	fmovrdne	%i6,	%f14,	%f4
	mova	%xcc,	%o7,	%o4
	fnot1s	%f4,	%f6
	edge8	%l1,	%l0,	%o6
	edge8	%l6,	%g6,	%l3
	sll	%l2,	0x09,	%o5
	fpadd16s	%f2,	%f29,	%f31
	edge32l	%i7,	%l5,	%i4
	srl	%i2,	%i5,	%g7
	fsrc2	%f24,	%f26
	movgu	%xcc,	%o2,	%i1
	sethi	0x137D,	%o0
	fmovdpos	%icc,	%f3,	%f28
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%i3
	fmovsn	%icc,	%f24,	%f12
	taddcc	%g2,	%l4,	%i0
	tvc	%icc,	0x0
	sdiv	%o1,	0x0193,	%g4
	orncc	%g1,	%g3,	%o3
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	andncc	%o4,	%o7,	%l1
	array32	%o6,	%l6,	%g6
	ldx	[%l7 + 0x28],	%l0
	fpmerge	%f23,	%f3,	%f20
	srax	%l2,	0x02,	%o5
	membar	0x17
	bl,pn	%icc,	loop_586
	brgez,a	%i7,	loop_587
	fmuld8ulx16	%f18,	%f3,	%f30
	udiv	%l5,	0x0A6E,	%i4
loop_586:
	sir	0x16E4
loop_587:
	sra	%l3,	%i5,	%g7
	movre	%o2,	%i2,	%i1
	fpadd32	%f14,	%f0,	%f0
	ldd	[%l7 + 0x28],	%f26
	edge8n	%o0,	%i3,	%g2
	brlz	%g5,	loop_588
	nop
	setx	0xB3C82228,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xE132DA74,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f16,	%f6
	fbu,a	%fcc3,	loop_589
	bl,a	%xcc,	loop_590
loop_588:
	fbule	%fcc3,	loop_591
	fmovsle	%icc,	%f11,	%f25
loop_589:
	udivx	%i0,	0x199D,	%l4
loop_590:
	nop
	fitos	%f1,	%f17
	fstox	%f17,	%f10
	fxtos	%f10,	%f31
loop_591:
	fone	%f30
	sir	0x1366
	fmovdpos	%icc,	%f11,	%f24
	addc	%o1,	0x05D7,	%g4
	stbar
	ta	%xcc,	0x4
	fabsd	%f14,	%f6
	ldd	[%l7 + 0x20],	%g0
	fpadd32s	%f26,	%f28,	%f22
	fpack16	%f22,	%f4
	edge16	%o3,	%g3,	%o4
	movneg	%icc,	%i6,	%l1
	tcc	%xcc,	0x5
	edge16l	%o7,	%l6,	%g6
	fpsub32s	%f13,	%f5,	%f14
	fmovdpos	%xcc,	%f30,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o6,	%l0,	%o5
	fpadd16	%f14,	%f26,	%f14
	ldub	[%l7 + 0x18],	%i7
	fbg	%fcc0,	loop_592
	sethi	0x0B71,	%l2
	bpos	loop_593
	tg	%icc,	0x7
loop_592:
	fmul8ulx16	%f8,	%f10,	%f20
	sub	%i4,	0x1C80,	%l3
loop_593:
	fnot2s	%f15,	%f29
	fandnot2	%f24,	%f26,	%f22
	tvs	%xcc,	0x4
	edge8ln	%l5,	%g7,	%i5
	srlx	%i2,	%o2,	%o0
	fpack16	%f12,	%f0
	fmovdgu	%xcc,	%f21,	%f0
	fmovsle	%xcc,	%f4,	%f20
	sra	%i3,	%g2,	%i1
	orcc	%g5,	0x059F,	%l4
	mulscc	%i0,	%o1,	%g1
	movcc	%icc,	%g4,	%o3
	xnor	%g3,	%o4,	%l1
	movre	%o7,	%l6,	%i6
	fmovdle	%xcc,	%f4,	%f10
	umulcc	%g6,	%o6,	%l0
	fbul,a	%fcc0,	loop_594
	movre	%i7,	%l2,	%i4
	fnand	%f30,	%f20,	%f2
	sethi	0x002D,	%o5
loop_594:
	movle	%xcc,	%l5,	%l3
	set	0x18, %i4
	stxa	%g7,	[%l7 + %i4] 0x0c
	nop
	setx	loop_595,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	0x1B34,	%i2
	tne	%xcc,	0x6
	stx	%o2,	[%l7 + 0x60]
loop_595:
	fbule,a	%fcc0,	loop_596
	addc	%o0,	%i3,	%g2
	sdivx	%i1,	0x171F,	%g5
	fpack32	%f28,	%f4,	%f18
loop_596:
	edge16n	%l4,	%i0,	%o1
	fbne,a	%fcc1,	loop_597
	subccc	%i5,	%g4,	%g1
	tvc	%xcc,	0x2
	fbule,a	%fcc3,	loop_598
loop_597:
	movpos	%xcc,	%g3,	%o3
	nop
	fitos	%f16,	%f30
	fbg	%fcc2,	loop_599
loop_598:
	ldd	[%l7 + 0x58],	%l0
	fone	%f28
	taddcctv	%o4,	%o7,	%l6
loop_599:
	sra	%i6,	0x1F,	%o6
	fbul	%fcc3,	loop_600
	tgu	%xcc,	0x0
	st	%f7,	[%l7 + 0x48]
	edge32	%g6,	%l0,	%l2
loop_600:
	movl	%xcc,	%i7,	%i4
	lduh	[%l7 + 0x74],	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o5,	%l3,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o2,	%i2
	fbne,a	%fcc1,	loop_601
	fzeros	%f25
	movl	%icc,	%o0,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_601:
	srl	%i1,	0x07,	%i3
	fnot1	%f4,	%f0
	wr	%g0,	0x10,	%asi
	stwa	%l4,	[%l7 + 0x20] %asi
	andn	%g5,	0x0BA1,	%i0
	nop
	fitod	%f19,	%f30
	andncc	%i5,	%o1,	%g4
	fmovdleu	%xcc,	%f14,	%f21
	tcc	%xcc,	0x1
	subc	%g3,	0x0D96,	%o3
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f0
	fble	%fcc0,	loop_602
	and	%g1,	0x114B,	%o4
	xor	%l1,	0x14D3,	%o7
	fnors	%f4,	%f25,	%f6
loop_602:
	tn	%xcc,	0x5
	fmuld8ulx16	%f19,	%f7,	%f26
	fpadd16	%f26,	%f6,	%f24
	for	%f26,	%f28,	%f28
	popc	%i6,	%l6
	xnorcc	%g6,	%o6,	%l2
	edge8	%i7,	%l0,	%l5
	edge16l	%i4,	%l3,	%g7
	alignaddr	%o2,	%o5,	%o0
	movle	%icc,	%g2,	%i2
	fpsub32s	%f25,	%f5,	%f1
	fmovsvs	%xcc,	%f30,	%f2
	taddcctv	%i1,	%i3,	%l4
	fmovsvc	%icc,	%f22,	%f14
	add	%g5,	0x1852,	%i0
	movl	%icc,	%o1,	%i5
	tcc	%xcc,	0x5
	srlx	%g3,	%g4,	%o3
	tsubcc	%o4,	0x0B66,	%l1
	add	%g1,	0x100B,	%i6
	call	loop_603
	fmovsge	%xcc,	%f28,	%f9
	nop
	set	0x24, %l5
	ldsw	[%l7 + %l5],	%l6
	umulcc	%g6,	%o7,	%l2
loop_603:
	brgz,a	%i7,	loop_604
	nop
	setx	0xC342C2CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x8D46FC3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f29,	%f18
	fbue	%fcc3,	loop_605
	fnot1	%f8,	%f24
loop_604:
	for	%f18,	%f22,	%f12
	movre	%l0,	0x017,	%o6
loop_605:
	sdivx	%l5,	0x18D6,	%l3
	fcmpne32	%f24,	%f26,	%g7
	nop
	setx	0x5700F779B0470FD1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fmovsge	%xcc,	%f30,	%f25
	brgez,a	%i4,	loop_606
	umul	%o5,	0x09D4,	%o0
	bshuffle	%f28,	%f30,	%f4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%i2
loop_606:
	movne	%icc,	%g2,	%i3
	fpsub32	%f22,	%f2,	%f6
	edge32ln	%i1,	%g5,	%i0
	sdivx	%l4,	0x07D1,	%i5
	edge8ln	%o1,	%g4,	%g3
	tcs	%xcc,	0x7
	tg	%xcc,	0x5
	fbne	%fcc3,	loop_607
	sdivx	%o3,	0x1008,	%o4
	fble,a	%fcc2,	loop_608
	tleu	%icc,	0x6
loop_607:
	tneg	%xcc,	0x0
	tvc	%icc,	0x2
loop_608:
	movvc	%icc,	%l1,	%i6
	andn	%l6,	%g6,	%g1
	sub	%l2,	%i7,	%l0
	brz,a	%o6,	loop_609
	nop
	setx	0x2B2DA0C16711588C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE1C80808A810483B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f16,	%f8
	tsubcctv	%l5,	0x1729,	%o7
	nop
	set	0x08, %o0
	ldsw	[%l7 + %o0],	%g7
loop_609:
	movrgz	%l3,	0x29C,	%i4
	xor	%o5,	0x18F2,	%o0
	movrlz	%o2,	0x361,	%g2
	xorcc	%i2,	%i1,	%i3
	set	0x40, %i3
	stwa	%i0,	[%l7 + %i3] 0x88
	tge	%xcc,	0x1
	tneg	%icc,	0x0
	mova	%xcc,	%g5,	%i5
	tn	%icc,	0x2
	andn	%o1,	0x0CC7,	%l4
	fbn	%fcc0,	loop_610
	fpsub16	%f4,	%f20,	%f8
	fnands	%f19,	%f3,	%f7
	brnz,a	%g4,	loop_611
loop_610:
	movgu	%icc,	%g3,	%o4
	fbul,a	%fcc1,	loop_612
	fmovda	%xcc,	%f8,	%f12
loop_611:
	edge8l	%o3,	%i6,	%l1
	fbg,a	%fcc0,	loop_613
loop_612:
	edge8ln	%g6,	%g1,	%l6
	brnz	%l2,	loop_614
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f22
	fxtod	%f22,	%f0
loop_613:
	udiv	%l0,	0x029F,	%i7
	fbl	%fcc3,	loop_615
loop_614:
	edge8l	%o6,	%o7,	%g7
	tgu	%xcc,	0x3
	bne,a	%xcc,	loop_616
loop_615:
	orn	%l5,	0x1CEF,	%i4
	taddcc	%l3,	0x02F5,	%o0
	movge	%xcc,	%o2,	%o5
loop_616:
	fmovdle	%icc,	%f7,	%f28
	tsubcctv	%i2,	%g2,	%i3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x12] %asi,	%i0
	edge32n	%i1,	%g5,	%i5
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%l4
	tvs	%xcc,	0x3
	movpos	%icc,	%g4,	%o1
	movrlz	%g3,	%o3,	%i6
	movn	%xcc,	%o4,	%g6
	movcs	%xcc,	%g1,	%l6
	fornot2s	%f4,	%f28,	%f23
	nop
	setx	loop_617,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f8
	fxtod	%f8,	%f10
	ldsh	[%l7 + 0x08],	%l1
	stw	%l0,	[%l7 + 0x40]
loop_617:
	brz,a	%l2,	loop_618
	tleu	%icc,	0x3
	srlx	%o6,	%i7,	%g7
	bleu,a,pt	%icc,	loop_619
loop_618:
	fmovrsgz	%o7,	%f11,	%f16
	sdiv	%i4,	0x02D2,	%l3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%o2
loop_619:
	nop
	set	0x24, %g7
	ldswa	[%l7 + %g7] 0x89,	%l5
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f31
	sethi	0x0BE7,	%i2
	movcc	%xcc,	%g2,	%i3
	ta	%xcc,	0x7
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x2f,	%o4
	ldstub	[%l7 + 0x4F],	%i0
	edge32	%i1,	%g5,	%i5
	fmovdge	%icc,	%f20,	%f7
	fmovse	%icc,	%f22,	%f4
	fmovrdgz	%g4,	%f6,	%f28
	movle	%icc,	%l4,	%g3
	tn	%icc,	0x4
	xnor	%o1,	%i6,	%o3
	movpos	%xcc,	%g6,	%g1
	fandnot2s	%f25,	%f28,	%f15
	orcc	%l6,	0x0614,	%l1
	sll	%o4,	0x11,	%l2
	set	0x58, %i2
	stxa	%o6,	[%l7 + %i2] 0xe3
	membar	#Sync
	movvs	%xcc,	%l0,	%i7
	fmovdl	%icc,	%f8,	%f11
	udivx	%o7,	0x12A4,	%g7
	membar	0x27
	xnorcc	%i4,	%l3,	%o2
	subccc	%l5,	%i2,	%g2
	edge8	%o0,	%i3,	%o5
	fpadd32	%f28,	%f26,	%f10
	sra	%i0,	%i1,	%i5
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f14
	fxtod	%f14,	%f20
	subcc	%g4,	%g5,	%g3
	tge	%icc,	0x4
	bg,a	loop_620
	movrgz	%l4,	%o1,	%o3
	fpack16	%f6,	%f1
	tsubcctv	%i6,	%g6,	%l6
loop_620:
	fmovsgu	%xcc,	%f7,	%f9
	fpsub32	%f28,	%f12,	%f28
	fmovde	%icc,	%f15,	%f24
	st	%f27,	[%l7 + 0x28]
	fpadd32	%f0,	%f8,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a,pn	%xcc,	loop_621
	tl	%icc,	0x0
	swap	[%l7 + 0x58],	%g1
	subcc	%o4,	0x003C,	%l2
loop_621:
	tcs	%icc,	0x2
	tsubcc	%l1,	%l0,	%o6
	andncc	%o7,	%i7,	%i4
	ta	%icc,	0x2
	edge8l	%l3,	%g7,	%l5
	fba	%fcc1,	loop_622
	xor	%o2,	%g2,	%i2
	umulcc	%i3,	%o0,	%o5
	fble,a	%fcc3,	loop_623
loop_622:
	movn	%icc,	%i0,	%i1
	bgu,a,pt	%xcc,	loop_624
	smul	%g4,	%i5,	%g3
loop_623:
	tg	%xcc,	0x5
	movvs	%icc,	%l4,	%o1
loop_624:
	srl	%o3,	%i6,	%g6
	fmovdvc	%icc,	%f29,	%f0
	movl	%icc,	%g5,	%l6
	fmul8ulx16	%f20,	%f4,	%f6
	nop
	setx	0x79E681AEB29D2CE6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB717BB46E4704C3C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f4,	%f16
	sdiv	%o4,	0x1B61,	%g1
	fbe	%fcc3,	loop_625
	edge16	%l1,	%l0,	%l2
	fbe	%fcc0,	loop_626
	movne	%icc,	%o6,	%i7
loop_625:
	tpos	%xcc,	0x3
	sdivx	%o7,	0x19DA,	%l3
loop_626:
	tvs	%icc,	0x3
	tle	%icc,	0x1
	tvs	%xcc,	0x6
	tn	%icc,	0x1
	smul	%g7,	%l5,	%i4
	fbge	%fcc1,	loop_627
	movcc	%icc,	%o2,	%i2
	add	%i3,	%o0,	%g2
	movcs	%icc,	%o5,	%i0
loop_627:
	nop
	set	0x7B, %i0
	stba	%g4,	[%l7 + %i0] 0x2b
	membar	#Sync
	bgu,pn	%xcc,	loop_628
	tl	%xcc,	0x5
	fmovd	%f18,	%f4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x68] %asi,	%i1
loop_628:
	fsrc1	%f8,	%f26
	edge32ln	%i5,	%l4,	%g3
	andn	%o3,	0x0589,	%i6
	tpos	%icc,	0x2
	fbue,a	%fcc3,	loop_629
	nop
	setx loop_630, %l0, %l1
	jmpl %l1, %g6
	fmovrdgez	%g5,	%f14,	%f20
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f12
	fxtod	%f12,	%f4
loop_629:
	nop
	setx	0xD06841DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
loop_630:
	movgu	%xcc,	%o1,	%o4
	lduw	[%l7 + 0x5C],	%l6
	nop
	setx	loop_631,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%icc,	%l1,	%l0
	movrne	%g1,	0x3EF,	%o6
	set	0x2A, %o5
	stha	%l2,	[%l7 + %o5] 0xe2
	membar	#Sync
loop_631:
	fnegd	%f16,	%f30
	or	%o7,	%l3,	%g7
	movvc	%xcc,	%i7,	%l5
	movrne	%o2,	0x263,	%i2
	fsrc2	%f18,	%f22
	fbo,a	%fcc3,	loop_632
	pdist	%f4,	%f8,	%f30
	set	0x34, %g1
	lduwa	[%l7 + %g1] 0x18,	%i4
loop_632:
	nop
	setx	0x205D5A5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	addc	%o0,	0x057A,	%i3
	andn	%g2,	0x006D,	%i0
	fmovspos	%icc,	%f11,	%f31
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x80,	%g4
	movrlz	%i1,	0x0B4,	%o5
	fbuge	%fcc1,	loop_633
	tge	%xcc,	0x3
	addc	%l4,	%i5,	%g3
	fxnor	%f12,	%f0,	%f28
loop_633:
	movcs	%xcc,	%o3,	%g6
	tvs	%icc,	0x4
	fnor	%f18,	%f30,	%f28
	udiv	%g5,	0x1C75,	%o1
	andn	%o4,	0x07B4,	%l6
	udivx	%l1,	0x0A8C,	%i6
	set	0x08, %o3
	lda	[%l7 + %o3] 0x11,	%f19
	xorcc	%l0,	%g1,	%l2
	taddcc	%o7,	%o6,	%l3
	udiv	%i7,	0x0824,	%l5
	movpos	%xcc,	%g7,	%o2
	fmovdneg	%icc,	%f28,	%f31
	fandnot1s	%f7,	%f25,	%f4
	swap	[%l7 + 0x58],	%i2
	popc	0x1938,	%o0
	fmovdleu	%icc,	%f27,	%f14
	movl	%xcc,	%i4,	%g2
	nop
	setx	0x2E2CE43D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x59DB5A63,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f27,	%f13
	fandnot1s	%f30,	%f30,	%f5
	brz,a	%i0,	loop_634
	array32	%i3,	%g4,	%i1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x78] %asi,	%l4
loop_634:
	or	%i5,	%g3,	%o5
	addcc	%g6,	0x0A6C,	%g5
	array32	%o3,	%o1,	%o4
	edge16l	%l1,	%i6,	%l6
	fbn	%fcc1,	loop_635
	movleu	%xcc,	%g1,	%l0
	smul	%l2,	0x0545,	%o6
	nop
	setx	0x9E1E363F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f23
loop_635:
	umul	%l3,	%o7,	%l5
	tleu	%xcc,	0x7
	and	%i7,	0x02C9,	%g7
	nop
	setx	0xA1C1F15E80738D1C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	nop
	set	0x5A, %g4
	stb	%o2,	[%l7 + %g4]
	movvc	%icc,	%i2,	%o0
	add	%g2,	0x1D00,	%i4
	tle	%icc,	0x0
	bne,a	%xcc,	loop_636
	fbug	%fcc3,	loop_637
	addc	%i0,	%i3,	%g4
	move	%xcc,	%l4,	%i5
loop_636:
	ta	%icc,	0x5
loop_637:
	bcc,pt	%xcc,	loop_638
	tgu	%xcc,	0x4
	tl	%icc,	0x2
	movrne	%g3,	0x01A,	%i1
loop_638:
	tne	%icc,	0x0
	fmovdg	%icc,	%f26,	%f27
	fblg,a	%fcc2,	loop_639
	sir	0x1B27
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x08] %asi,	%o5
loop_639:
	nop
	set	0x38, %o1
	stb	%g5,	[%l7 + %o1]
	sra	%g6,	%o1,	%o4
	umul	%o3,	%i6,	%l1
	ldd	[%l7 + 0x18],	%f30
	lduh	[%l7 + 0x22],	%g1
	fmovs	%f23,	%f16
	tvc	%icc,	0x7
	fmovsleu	%icc,	%f2,	%f9
	fmovdg	%icc,	%f5,	%f3
	movn	%xcc,	%l6,	%l2
	fnor	%f6,	%f6,	%f2
	addcc	%o6,	0x1A61,	%l0
	set	0x5F, %i7
	ldstuba	[%l7 + %i7] 0x88,	%l3
	addc	%o7,	0x1884,	%i7
	fnot1	%f6,	%f6
	srax	%g7,	%l5,	%i2
	fmovsneg	%xcc,	%f28,	%f29
	fba,a	%fcc1,	loop_640
	popc	0x0603,	%o0
	faligndata	%f20,	%f6,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_640:
	nop
	set	0x7E, %g3
	lduba	[%l7 + %g3] 0x18,	%g2
	edge16l	%i4,	%o2,	%i0
	fnors	%f4,	%f4,	%f13
	fmovda	%icc,	%f12,	%f7
	fmovde	%xcc,	%f15,	%f31
	tcc	%icc,	0x4
	nop
	setx	0xA174F80FA068AA88,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fcmple32	%f4,	%f8,	%g4
	fbl,a	%fcc3,	loop_641
	stb	%i3,	[%l7 + 0x40]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_642,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_641:
	edge16ln	%i5,	%g3,	%i1
	tleu	%xcc,	0x3
	fmovsa	%icc,	%f28,	%f5
loop_642:
	ldstub	[%l7 + 0x69],	%l4
	movpos	%icc,	%o5,	%g5
	xnor	%o1,	0x156E,	%g6
	sub	%o4,	0x1556,	%i6
	fmovscc	%icc,	%f23,	%f16
	wr	%g0,	0x5f,	%asi
	stxa	%l1,	[%g0 + 0x0] %asi
	swap	[%l7 + 0x28],	%g1
	fsrc1	%f30,	%f28
	tn	%icc,	0x3
	tvs	%icc,	0x2
	fbue,a	%fcc0,	loop_643
	alignaddrl	%o3,	%l2,	%l6
	tn	%icc,	0x1
	movcs	%icc,	%o6,	%l0
loop_643:
	bl	%icc,	loop_644
	nop
	setx	0x739A3F88,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x0AC314E1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f5,	%f30
	umulcc	%o7,	%l3,	%i7
	movvc	%xcc,	%l5,	%g7
loop_644:
	sra	%i2,	0x1F,	%g2
	fbule	%fcc3,	loop_645
	xnorcc	%i4,	0x1C9B,	%o2
	tsubcc	%i0,	0x142D,	%g4
	smulcc	%o0,	%i5,	%i3
loop_645:
	tvc	%icc,	0x0
	fmovdl	%xcc,	%f8,	%f14
	brgz,a	%i1,	loop_646
	tg	%xcc,	0x0
	call	loop_647
	tcs	%xcc,	0x2
loop_646:
	array32	%g3,	%l4,	%g5
	nop
	setx loop_648, %l0, %l1
	jmpl %l1, %o1
loop_647:
	nop
	set	0x2C, %g5
	stb	%g6,	[%l7 + %g5]
	movg	%xcc,	%o5,	%o4
	mulscc	%i6,	0x132A,	%l1
loop_648:
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%o2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbne,a	%fcc3,	loop_649
	fbg,a	%fcc0,	loop_650
	addcc	%l2,	%l6,	%o6
	lduh	[%l7 + 0x5A],	%l0
loop_649:
	nop
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x19,	%f0
loop_650:
	sllx	%g1,	%o7,	%l3
	tleu	%xcc,	0x7
	umulcc	%i7,	0x15EF,	%g7
	bl,a,pt	%icc,	loop_651
	movvc	%icc,	%l5,	%g2
	fmul8sux16	%f2,	%f30,	%f26
	mulscc	%i4,	%i2,	%i0
loop_651:
	subcc	%o2,	0x1B6D,	%g4
	swap	[%l7 + 0x4C],	%i5
	bpos,a	%icc,	loop_652
	tvs	%xcc,	0x3
	andcc	%i3,	%i1,	%g3
	fpack32	%f4,	%f6,	%f18
loop_652:
	edge8	%l4,	%o0,	%g5
	andncc	%g6,	%o1,	%o5
	tg	%xcc,	0x4
	taddcctv	%i6,	%o4,	%l1
	udivx	%l2,	0x16D1,	%l6
	edge16l	%o3,	%o6,	%g1
	subc	%l0,	0x12A8,	%l3
	fba,a	%fcc0,	loop_653
	fxor	%f0,	%f14,	%f8
	bn,pt	%icc,	loop_654
	stx	%o7,	[%l7 + 0x50]
loop_653:
	edge16l	%i7,	%l5,	%g7
	bg,a	%icc,	loop_655
loop_654:
	smul	%g2,	0x0781,	%i2
	array32	%i4,	%o2,	%i0
	array32	%i5,	%g4,	%i3
loop_655:
	fands	%f15,	%f3,	%f31
	sra	%i1,	0x0B,	%g3
	ta	%xcc,	0x5
	smulcc	%l4,	0x190F,	%g5
	sdiv	%g6,	0x02B3,	%o1
	movrlz	%o5,	0x2B8,	%i6
	fmovsleu	%icc,	%f13,	%f25
	movrlz	%o0,	%l1,	%o4
	nop
	setx	0x6F3F3517,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x3804DFAE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f21,	%f28
	bn,pt	%icc,	loop_656
	orncc	%l2,	%o3,	%l6
	tle	%icc,	0x1
	orcc	%o6,	0x0CB1,	%g1
loop_656:
	prefetch	[%l7 + 0x3C],	 0x3
	fnors	%f24,	%f30,	%f26
	fmovdge	%xcc,	%f4,	%f8
	addcc	%l3,	%o7,	%i7
	fpadd16	%f24,	%f2,	%f0
	wr	%g0,	0x81,	%asi
	stba	%l0,	[%l7 + 0x74] %asi
	nop
	setx	0xC0B5C2B68F975C34,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f8
	fnegd	%f14,	%f26
	edge32n	%l5,	%g7,	%i2
	tn	%icc,	0x4
	fmovsvc	%icc,	%f11,	%f8
	nop
	fitos	%f9,	%f27
	fstoi	%f27,	%f0
	udivx	%g2,	0x0569,	%i4
	movle	%xcc,	%o2,	%i5
	addcc	%i0,	0x1791,	%i3
	edge8n	%g4,	%g3,	%i1
	fbne	%fcc2,	loop_657
	udivcc	%l4,	0x01AA,	%g6
	tsubcctv	%g5,	%o5,	%o1
	edge32l	%o0,	%l1,	%i6
loop_657:
	ldd	[%l7 + 0x70],	%f0
	tvs	%icc,	0x2
	fpsub16s	%f24,	%f13,	%f5
	movvs	%icc,	%l2,	%o4
	edge16n	%o3,	%o6,	%l6
	nop
	setx	loop_658,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%g1,	0x02C8,	%l3
	umul	%i7,	0x0201,	%l0
	umulcc	%l5,	0x1FDE,	%g7
loop_658:
	edge32	%i2,	%o7,	%g2
	fbn	%fcc3,	loop_659
	sllx	%i4,	0x19,	%i5
	fmovdpos	%xcc,	%f20,	%f6
	sub	%i0,	%o2,	%i3
loop_659:
	fnot2	%f4,	%f24
	alignaddrl	%g3,	%g4,	%l4
	andcc	%i1,	0x1B65,	%g5
	edge32	%o5,	%o1,	%o0
	orn	%l1,	%g6,	%l2
	fcmpgt32	%f2,	%f18,	%i6
	addcc	%o4,	0x1C22,	%o6
	sir	0x0CD0
	sethi	0x0B12,	%o3
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x50] %asi,	%g0
	or	%l6,	%i7,	%l0
	sllx	%l3,	%l5,	%i2
	alignaddr	%o7,	%g2,	%g7
	sdivcc	%i4,	0x1BA3,	%i5
	tleu	%icc,	0x5
	edge8l	%i0,	%i3,	%o2
	set	0x49, %i1
	ldsba	[%l7 + %i1] 0x14,	%g3
	nop
	setx	loop_660,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tn	%xcc,	0x1
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g4
loop_660:
	fnot2	%f2,	%f6
	edge8l	%i1,	%g5,	%o5
	fmul8x16au	%f14,	%f29,	%f24
	array32	%l4,	%o1,	%o0
	edge16ln	%g6,	%l1,	%l2
	tcs	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	stba	%o4,	[%l7 + 0x4E] %asi
	fnot2s	%f26,	%f26
	bne	loop_661
	bcs,a	%icc,	loop_662
	movre	%o6,	%i6,	%o3
	bvc,a,pn	%xcc,	loop_663
loop_661:
	taddcctv	%g1,	0x0EBE,	%l6
loop_662:
	movrlez	%l0,	%l3,	%l5
	alignaddrl	%i2,	%o7,	%g2
loop_663:
	tcc	%icc,	0x1
	movrgez	%i7,	%g7,	%i5
	movneg	%icc,	%i4,	%i3
	nop
	setx	0x208E55F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f8
	umulcc	%o2,	%g3,	%i0
	fcmpgt32	%f8,	%f16,	%g4
	taddcc	%g5,	0x1997,	%o5
	fcmpeq16	%f14,	%f6,	%l4
	tcs	%icc,	0x2
	stbar
	movpos	%xcc,	%i1,	%o1
	movrgez	%o0,	%g6,	%l1
	subcc	%o4,	%l2,	%o6
	movvs	%icc,	%o3,	%g1
	nop
	set	0x68, %o2
	stx	%i6,	[%l7 + %o2]
	alignaddrl	%l6,	%l0,	%l3
	addccc	%l5,	0x0FDE,	%o7
	tleu	%xcc,	0x7
	fmovdg	%xcc,	%f6,	%f19
	fmul8x16	%f27,	%f26,	%f2
	te	%xcc,	0x6
	stw	%g2,	[%l7 + 0x38]
	bleu	%icc,	loop_664
	ba	loop_665
	smul	%i2,	%i7,	%i5
	tl	%xcc,	0x7
loop_664:
	tsubcctv	%g7,	%i4,	%i3
loop_665:
	fmovsvs	%xcc,	%f3,	%f14
	fsrc1s	%f6,	%f24
	nop
	setx	0x75620897,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x93125C1E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f29,	%f7
	brgez	%o2,	loop_666
	edge8	%i0,	%g4,	%g3
	tleu	%xcc,	0x7
	fcmpeq16	%f10,	%f12,	%g5
loop_666:
	fabsd	%f16,	%f6
	edge32n	%l4,	%i1,	%o5
	nop
	fitos	%f4,	%f23
	fstox	%f23,	%f2
	fxtos	%f2,	%f2
	bleu,pt	%icc,	loop_667
	udivx	%o0,	0x0A17,	%o1
	addc	%l1,	0x1B3E,	%o4
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x2e,	%g6
loop_667:
	subc	%o6,	0x1A89,	%o3
	fsrc2s	%f31,	%f30
	movge	%icc,	%g1,	%l2
	umulcc	%i6,	0x1B08,	%l0
	sir	0x176E
	movle	%icc,	%l6,	%l5
	fmovrdgez	%o7,	%f14,	%f0
	edge32l	%g2,	%l3,	%i2
	fsrc1	%f28,	%f22
	udivx	%i7,	0x1259,	%i5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x18,	%g7,	%i3
	subccc	%i4,	0x193D,	%o2
	subc	%i0,	0x0E8F,	%g3
	xnorcc	%g4,	0x1165,	%l4
	movrlz	%g5,	0x2D0,	%i1
	edge16ln	%o5,	%o1,	%l1
	bcs,a,pt	%icc,	loop_668
	call	loop_669
	tvc	%icc,	0x0
	nop
	setx	loop_670,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_668:
	mulscc	%o0,	0x16C4,	%g6
loop_669:
	sll	%o4,	%o3,	%o6
	movrlez	%l2,	%g1,	%i6
loop_670:
	srax	%l0,	0x0A,	%l5
	movcc	%xcc,	%o7,	%g2
	fmuld8sux16	%f4,	%f3,	%f20
	taddcctv	%l6,	0x16EC,	%i2
	tleu	%xcc,	0x1
	tgu	%xcc,	0x5
	sdiv	%i7,	0x11E8,	%i5
	fpsub16s	%f30,	%f14,	%f4
	fmovdne	%icc,	%f11,	%f10
	bg,pt	%xcc,	loop_671
	sra	%g7,	0x15,	%i3
	movcc	%icc,	%i4,	%o2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i0,	%l3
loop_671:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x4E] %asi,	%g3
	fmul8x16	%f28,	%f4,	%f24
	movn	%icc,	%l4,	%g5
	smul	%g4,	0x1848,	%i1
	fmovrsgez	%o1,	%f24,	%f16
	andn	%o5,	0x044E,	%l1
	fmovsne	%xcc,	%f8,	%f26
	movrgez	%g6,	0x007,	%o4
	stbar
	sdivx	%o0,	0x1BAF,	%o3
	udivcc	%l2,	0x1A99,	%g1
	subccc	%i6,	%o6,	%l5
	brlez,a	%o7,	loop_672
	fsrc1s	%f5,	%f26
	fbule	%fcc2,	loop_673
	fmovsneg	%icc,	%f13,	%f16
loop_672:
	bcc,a	loop_674
	fmovse	%icc,	%f29,	%f9
loop_673:
	ble,a,pt	%icc,	loop_675
	popc	%l0,	%g2
loop_674:
	xnor	%i2,	0x17B1,	%i7
	addc	%l6,	0x14BA,	%g7
loop_675:
	movneg	%icc,	%i5,	%i4
	sdivcc	%i3,	0x144E,	%o2
	sll	%i0,	0x1C,	%l3
	movgu	%icc,	%l4,	%g5
	movpos	%xcc,	%g4,	%g3
	fbule,a	%fcc3,	loop_676
	tsubcc	%i1,	%o5,	%o1
	xnor	%g6,	0x1855,	%l1
	fcmpgt16	%f16,	%f2,	%o0
loop_676:
	fbe,a	%fcc3,	loop_677
	mova	%icc,	%o4,	%l2
	sdiv	%g1,	0x0DDB,	%i6
	edge32n	%o6,	%o3,	%l5
loop_677:
	fsrc1	%f18,	%f30
	edge16ln	%l0,	%o7,	%g2
	and	%i7,	%l6,	%i2
	nop
	setx	0x404E10B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	sdivcc	%i5,	0x18A0,	%g7
	tsubcc	%i3,	%i4,	%o2
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x67] %asi,	%l3
	tpos	%icc,	0x2
	set	0x28, %l6
	sta	%f19,	[%l7 + %l6] 0x14
	fmovrde	%i0,	%f24,	%f6
	addccc	%l4,	%g4,	%g3
	smulcc	%g5,	%i1,	%o5
	fble,a	%fcc3,	loop_678
	fbl,a	%fcc1,	loop_679
	fmul8x16al	%f24,	%f22,	%f8
	movneg	%icc,	%o1,	%l1
loop_678:
	movn	%icc,	%o0,	%o4
loop_679:
	add	%l2,	0x1D27,	%g1
	ldsw	[%l7 + 0x48],	%i6
	fnot1s	%f31,	%f15
	edge8	%g6,	%o6,	%o3
	orcc	%l5,	%o7,	%g2
	ldsw	[%l7 + 0x1C],	%i7
	fbn,a	%fcc1,	loop_680
	nop
	setx	0x405B2DFD,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	nop
	setx	0xF7F2355D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x1A4DB1E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f12,	%f15
	add	%l0,	%i2,	%i5
loop_680:
	taddcctv	%l6,	%i3,	%i4
	nop
	setx	loop_681,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	%g7,	%l3
	fmovdneg	%icc,	%f5,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_681:
	tle	%xcc,	0x1
	andcc	%i0,	0x0728,	%o2
	tleu	%icc,	0x0
	tge	%xcc,	0x7
	fmovrdlz	%g4,	%f16,	%f12
	sll	%g3,	0x1B,	%l4
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f6
	tle	%xcc,	0x1
	fmovrdlz	%i1,	%f18,	%f22
	bne	%xcc,	loop_682
	movvc	%icc,	%g5,	%o1
	nop
	setx	0x006DAA90,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	srl	%l1,	0x12,	%o0
loop_682:
	edge32l	%o5,	%o4,	%g1
	popc	0x0D8F,	%i6
	edge32n	%l2,	%g6,	%o3
	movleu	%icc,	%o6,	%l5
	movgu	%xcc,	%g2,	%o7
	fands	%f28,	%f4,	%f3
	edge16l	%l0,	%i7,	%i2
	brlez	%i5,	loop_683
	fpack32	%f8,	%f0,	%f8
	orn	%l6,	%i3,	%g7
	edge32l	%l3,	%i4,	%o2
loop_683:
	alignaddr	%i0,	%g4,	%g3
	movrlz	%i1,	%g5,	%o1
	sdivx	%l4,	0x1F3C,	%o0
	bvs	loop_684
	tgu	%icc,	0x2
	movrgez	%l1,	%o5,	%g1
	fpmerge	%f12,	%f7,	%f2
loop_684:
	udiv	%o4,	0x1C88,	%l2
	nop
	setx	0xFA268A96,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f22
	fcmpne32	%f12,	%f6,	%g6
	fmovrdgez	%i6,	%f4,	%f6
	movvc	%icc,	%o3,	%o6
	andncc	%g2,	%l5,	%l0
	bge,a	%xcc,	loop_685
	bgu,a	loop_686
	for	%f0,	%f14,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_685:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x21] %asi,	%o7
loop_686:
	te	%icc,	0x7
	array8	%i7,	%i2,	%l6
	tneg	%icc,	0x0
	sdivx	%i3,	0x1330,	%g7
	edge8ln	%i5,	%l3,	%o2
	udivx	%i4,	0x1D17,	%g4
	fbule	%fcc2,	loop_687
	umulcc	%g3,	%i1,	%g5
	movpos	%icc,	%o1,	%i0
	ta	%icc,	0x3
loop_687:
	nop
	setx	loop_688,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%o0,	%l4,	%l1
	tle	%icc,	0x0
	orcc	%g1,	0x0A66,	%o4
loop_688:
	nop
	setx	0x6DD382B5D2B0E878,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f8
	sub	%l2,	%o5,	%i6
	edge8ln	%o3,	%g6,	%g2
	add	%o6,	0x0AF0,	%l0
	ldx	[%l7 + 0x48],	%l5
	fmovsn	%xcc,	%f24,	%f3
	tleu	%xcc,	0x0
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x7F] %asi,	%o7
	andn	%i7,	%i2,	%l6
	udivx	%i3,	0x1360,	%i5
	ldd	[%l7 + 0x28],	%l2
	mulx	%o2,	0x17CF,	%i4
	movrgz	%g4,	%g3,	%g7
	ldsb	[%l7 + 0x18],	%g5
	subcc	%o1,	0x1F6F,	%i1
	fbe	%fcc1,	loop_689
	movrgez	%o0,	%l4,	%l1
	call	loop_690
	smulcc	%g1,	0x18F1,	%i0
loop_689:
	fmovrdne	%o4,	%f8,	%f2
	xnor	%l2,	%o5,	%o3
loop_690:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g6,	0x1B3B,	%g2
	mova	%xcc,	%i6,	%l0
	fbu	%fcc2,	loop_691
	movrgez	%l5,	%o7,	%o6
	tvc	%xcc,	0x2
	fbl	%fcc2,	loop_692
loop_691:
	sir	0x09DC
	nop
	fitos	%f26,	%f1
	membar	0x47
loop_692:
	and	%i2,	0x1537,	%i7
	fsrc1	%f6,	%f10
	movne	%xcc,	%i3,	%i5
	fmovdvc	%xcc,	%f26,	%f2
	fmovd	%f0,	%f26
	alignaddr	%l3,	%o2,	%i4
	fmul8x16	%f5,	%f16,	%f4
	srax	%g4,	%l6,	%g7
	fmovdg	%xcc,	%f22,	%f8
	ld	[%l7 + 0x68],	%f15
	fbule	%fcc1,	loop_693
	mulscc	%g5,	0x030D,	%g3
	edge8ln	%o1,	%o0,	%i1
	fbn,a	%fcc1,	loop_694
loop_693:
	fmovse	%icc,	%f1,	%f26
	ldd	[%l7 + 0x18],	%f12
	movneg	%xcc,	%l4,	%l1
loop_694:
	fornot1s	%f19,	%f30,	%f22
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x0C] %asi,	%f2
	fbue,a	%fcc1,	loop_695
	brlz	%g1,	loop_696
	sub	%o4,	0x1CA2,	%l2
	nop
	setx	0x006AB98A,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
loop_695:
	lduw	[%l7 + 0x6C],	%o5
loop_696:
	movrlez	%o3,	%i0,	%g2
	fcmpne16	%f26,	%f20,	%g6
	nop
	fitos	%f2,	%f29
	fstoi	%f29,	%f3
	array16	%l0,	%l5,	%o7
	tsubcc	%o6,	%i2,	%i6
	nop
	setx	0x99D359AB8EC9C422,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f28
	subcc	%i7,	%i5,	%i3
	umul	%l3,	%i4,	%g4
	sir	0x11CF
	addc	%o2,	0x1AB5,	%l6
	srlx	%g7,	0x1F,	%g5
	movrgez	%o1,	%o0,	%i1
	edge8	%g3,	%l1,	%l4
	andcc	%g1,	0x13C3,	%o4
	fmovrdgez	%l2,	%f8,	%f10
	edge16n	%o5,	%o3,	%g2
	and	%i0,	%g6,	%l5
	sdiv	%l0,	0x0BAC,	%o6
	ldsw	[%l7 + 0x68],	%i2
	flush	%l7 + 0x64
	sdiv	%o7,	0x02AD,	%i7
	edge16l	%i6,	%i5,	%l3
	tleu	%icc,	0x3
	brnz	%i3,	loop_697
	fxnors	%f13,	%f17,	%f24
	ba,pt	%xcc,	loop_698
	nop
	setx	loop_699,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_697:
	movvc	%xcc,	%i4,	%g4
	ba,pn	%icc,	loop_700
loop_698:
	movge	%icc,	%o2,	%l6
loop_699:
	ldsb	[%l7 + 0x3B],	%g7
	fnot1s	%f31,	%f16
loop_700:
	fbule,a	%fcc2,	loop_701
	edge16	%o1,	%g5,	%i1
	ldd	[%l7 + 0x10],	%g2
	movcs	%xcc,	%l1,	%l4
loop_701:
	orncc	%g1,	%o0,	%l2
	nop
	set	0x5C, %l2
	sth	%o4,	[%l7 + %l2]
	fcmple32	%f20,	%f30,	%o3
	fands	%f25,	%f11,	%f29
	nop
	fitod	%f13,	%f28
	fpackfix	%f8,	%f26
	sir	0x090A
	edge16ln	%g2,	%i0,	%g6
	set	0x4C, %i5
	lduwa	[%l7 + %i5] 0x10,	%l5
	stb	%o5,	[%l7 + 0x37]
	array8	%l0,	%i2,	%o7
	fxnor	%f10,	%f24,	%f28
	bneg,a	%icc,	loop_702
	fbue,a	%fcc2,	loop_703
	sdivcc	%o6,	0x07B5,	%i6
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x70] %asi,	%i7
loop_702:
	sll	%i5,	%i3,	%i4
loop_703:
	movg	%icc,	%g4,	%l3
	alignaddrl	%l6,	%g7,	%o2
	wr	%g0,	0x0c,	%asi
	stwa	%g5,	[%l7 + 0x30] %asi
	nop
	fitos	%f4,	%f5
	fstoi	%f5,	%f11
	tleu	%icc,	0x2
	movvc	%icc,	%i1,	%g3
	lduw	[%l7 + 0x48],	%l1
	fbne,a	%fcc2,	loop_704
	tneg	%xcc,	0x3
	fpadd16	%f10,	%f18,	%f28
	fpadd16s	%f1,	%f11,	%f22
loop_704:
	fmovrslz	%l4,	%f2,	%f7
	srlx	%o1,	%g1,	%l2
	fbuge,a	%fcc1,	loop_705
	sth	%o0,	[%l7 + 0x6A]
	fcmpne32	%f20,	%f24,	%o3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%g2
loop_705:
	sdivcc	%i0,	0x1FCB,	%g6
	swap	[%l7 + 0x34],	%l5
	movrgez	%o5,	0x25A,	%i2
	ta	%xcc,	0x0
	fmovrdlz	%o7,	%f4,	%f20
	edge8n	%o6,	%l0,	%i7
	mulx	%i5,	0x0B85,	%i3
	movvs	%icc,	%i6,	%g4
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x0A] %asi,	%i4
	ldsb	[%l7 + 0x73],	%l6
	xnor	%l3,	%g7,	%o2
	fpadd32s	%f29,	%f19,	%f3
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x08] %asi,	%i1
	fandnot2s	%f25,	%f23,	%f7
	stb	%g3,	[%l7 + 0x55]
	bpos,a,pt	%xcc,	loop_706
	brgez	%l1,	loop_707
	edge8n	%g5,	%l4,	%o1
	fmovdvc	%xcc,	%f29,	%f3
loop_706:
	tge	%xcc,	0x1
loop_707:
	andcc	%l2,	0x076D,	%g1
	bn,a,pt	%icc,	loop_708
	nop
	setx	0x453244192163441A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x55FD0EE2B2D98729,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f10,	%f0
	fbug,a	%fcc3,	loop_709
	nop
	setx	0xDADEC2A540100395,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x15F64CD28E8166B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f28,	%f12
loop_708:
	andn	%o3,	0x01D8,	%o0
	movpos	%xcc,	%o4,	%i0
loop_709:
	bvs,a	%icc,	loop_710
	add	%g6,	%l5,	%o5
	orn	%i2,	0x1D9F,	%o7
	movpos	%icc,	%o6,	%l0
loop_710:
	orn	%i7,	0x05C4,	%g2
	tvc	%icc,	0x6
	set	0x10, %i6
	sta	%f13,	[%l7 + %i6] 0x89
	bne	%icc,	loop_711
	bl,a	%xcc,	loop_712
	bl,a,pn	%icc,	loop_713
	orcc	%i3,	%i6,	%g4
loop_711:
	tle	%xcc,	0x2
loop_712:
	alignaddrl	%i4,	%i5,	%l3
loop_713:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g7,	0x09,	%l6
	subccc	%i1,	0x1F9A,	%o2
	nop
	set	0x4C, %o7
	prefetch	[%l7 + %o7],	 0x0
	movcc	%icc,	%g3,	%l1
	fblg,a	%fcc1,	loop_714
	movvc	%icc,	%g5,	%l4
	edge16n	%l2,	%o1,	%o3
	movrlz	%g1,	0x220,	%o4
loop_714:
	fbuge,a	%fcc0,	loop_715
	tl	%icc,	0x6
	orncc	%o0,	0x1D19,	%i0
	orn	%l5,	0x1AE6,	%o5
loop_715:
	ldd	[%l7 + 0x18],	%g6
	fmovdpos	%icc,	%f14,	%f13
	xorcc	%o7,	0x1BCE,	%i2
	std	%f2,	[%l7 + 0x48]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l0,	0x02DE,	%o6
	nop
	fitos	%f13,	%f31
	fstod	%f31,	%f0
	movrlez	%i7,	%i3,	%i6
	movle	%icc,	%g4,	%g2
	and	%i5,	0x1C69,	%l3
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x18] %asi,	%i4
	andn	%g7,	0x1229,	%l6
	fpadd32	%f4,	%f10,	%f0
	fmovsle	%xcc,	%f22,	%f31
	set	0x28, %g2
	ldswa	[%l7 + %g2] 0x04,	%o2
	be,a	%xcc,	loop_716
	add	%g3,	0x1C60,	%i1
	bn,pn	%icc,	loop_717
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f18
loop_716:
	orn	%l1,	0x0641,	%g5
	fxnors	%f26,	%f7,	%f17
loop_717:
	movn	%xcc,	%l2,	%l4
	edge16n	%o1,	%g1,	%o3
	movvc	%icc,	%o0,	%i0
	movrlz	%l5,	%o5,	%o4
	andn	%o7,	0x1934,	%g6
	nop
	setx loop_718, %l0, %l1
	jmpl %l1, %l0
	smul	%o6,	0x0ECD,	%i7
	movrgez	%i3,	0x0E3,	%i2
	tcc	%xcc,	0x5
loop_718:
	movleu	%icc,	%g4,	%i6
	fmovdleu	%xcc,	%f24,	%f6
	sra	%i5,	0x14,	%g2
	bne,a	loop_719
	movleu	%icc,	%i4,	%l3
	fmovrsgz	%l6,	%f28,	%f0
	tleu	%xcc,	0x2
loop_719:
	smulcc	%o2,	%g7,	%i1
	stb	%l1,	[%l7 + 0x1E]
	fmovsne	%icc,	%f22,	%f15
	brlez	%g3,	loop_720
	mova	%xcc,	%l2,	%l4
	fexpand	%f9,	%f6
	movcs	%xcc,	%g5,	%o1
loop_720:
	prefetch	[%l7 + 0x2C],	 0x2
	fbug,a	%fcc1,	loop_721
	tl	%xcc,	0x1
	fsrc2s	%f21,	%f7
	smul	%o3,	0x0BBB,	%o0
loop_721:
	swap	[%l7 + 0x78],	%i0
	set	0x40, %g6
	stwa	%g1,	[%l7 + %g6] 0x04
	srax	%l5,	%o5,	%o4
	ba,a	%icc,	loop_722
	fsrc2	%f2,	%f8
	edge16n	%o7,	%g6,	%l0
	set	0x10, %l5
	lda	[%l7 + %l5] 0x14,	%f29
loop_722:
	addccc	%i7,	%o6,	%i3
	edge8ln	%i2,	%g4,	%i6
	sdiv	%g2,	0x1185,	%i4
	sdivcc	%i5,	0x12FE,	%l3
	udiv	%l6,	0x08B3,	%g7
	fbe	%fcc3,	loop_723
	fnegs	%f5,	%f5
	fbg	%fcc0,	loop_724
	fmovrdgez	%i1,	%f24,	%f10
loop_723:
	ldd	[%l7 + 0x20],	%f10
	tle	%xcc,	0x0
loop_724:
	nop
	wr	%g0,	0x18,	%asi
	stha	%l1,	[%l7 + 0x6C] %asi
	edge32l	%g3,	%o2,	%l2
	orcc	%l4,	0x071B,	%g5
	fxnors	%f27,	%f9,	%f9
	bl,a,pt	%xcc,	loop_725
	bne,a,pn	%xcc,	loop_726
	popc	%o1,	%o3
	xorcc	%i0,	0x047B,	%o0
loop_725:
	movpos	%xcc,	%l5,	%g1
loop_726:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x2
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x5D] %asi,	%o5
	umulcc	%o4,	0x0F91,	%g6
	and	%l0,	%i7,	%o6
	tge	%xcc,	0x2
	set	0x0B, %i4
	ldstuba	[%l7 + %i4] 0x0c,	%i3
	std	%f20,	[%l7 + 0x20]
	edge32l	%i2,	%o7,	%g4
	edge8ln	%i6,	%i4,	%g2
	tge	%xcc,	0x7
	movrlz	%i5,	0x2D5,	%l3
	popc	0x0E1A,	%g7
	tvs	%xcc,	0x4
	fbne,a	%fcc3,	loop_727
	fbe	%fcc3,	loop_728
	fors	%f21,	%f6,	%f27
	and	%l6,	0x1B27,	%i1
loop_727:
	edge32n	%l1,	%g3,	%o2
loop_728:
	fbge	%fcc2,	loop_729
	and	%l2,	%l4,	%o1
	movvc	%xcc,	%g5,	%o3
	ldsw	[%l7 + 0x54],	%o0
loop_729:
	xnor	%l5,	%i0,	%g1
	nop
	setx loop_730, %l0, %l1
	jmpl %l1, %o5
	umul	%g6,	0x0BD9,	%o4
	xnorcc	%i7,	0x1251,	%l0
	fxnors	%f12,	%f2,	%f1
loop_730:
	sdivcc	%o6,	0x10D1,	%i2
	fmovrslz	%i3,	%f20,	%f7
	bgu,pn	%icc,	loop_731
	xnorcc	%o7,	0x0364,	%i6
	fnot2s	%f3,	%f13
	tl	%icc,	0x1
loop_731:
	subc	%i4,	%g4,	%g2
	set	0x38, %i3
	lduba	[%l7 + %i3] 0x10,	%l3
	sll	%g7,	%i5,	%i1
	edge16ln	%l1,	%g3,	%l6
	fsrc2s	%f5,	%f28
	bn,a	%icc,	loop_732
	sir	0x0435
	ldd	[%l7 + 0x18],	%l2
	udiv	%o2,	0x1250,	%o1
loop_732:
	ldsh	[%l7 + 0x5C],	%g5
	sethi	0x13D5,	%o3
	movrgez	%o0,	0x02A,	%l5
	fnand	%f2,	%f28,	%f24
	orcc	%i0,	0x009B,	%l4
	fmovdcs	%xcc,	%f4,	%f11
	andn	%o5,	0x1504,	%g6
	set	0x2D, %o0
	lduba	[%l7 + %o0] 0x89,	%o4
	movrlez	%i7,	0x1D0,	%g1
	fsrc2s	%f2,	%f0
	brz,a	%l0,	loop_733
	bg,a,pn	%xcc,	loop_734
	bvs,a,pt	%xcc,	loop_735
	movle	%icc,	%i2,	%o6
loop_733:
	movvc	%icc,	%o7,	%i3
loop_734:
	bn,a	loop_736
loop_735:
	fblg,a	%fcc3,	loop_737
	array32	%i4,	%g4,	%g2
	movgu	%icc,	%l3,	%i6
loop_736:
	movrlz	%i5,	%i1,	%l1
loop_737:
	edge8n	%g3,	%l6,	%g7
	fmovrdlez	%l2,	%f22,	%f8
	fones	%f2
	orcc	%o2,	0x00FE,	%o1
	udivcc	%o3,	0x0C58,	%g5
	edge32ln	%o0,	%l5,	%l4
	set	0x64, %l0
	ldswa	[%l7 + %l0] 0x89,	%o5
	fmovsg	%xcc,	%f7,	%f4
	ldsh	[%l7 + 0x72],	%g6
	fmovde	%icc,	%f27,	%f21
	fpsub32	%f24,	%f24,	%f4
	array8	%i0,	%o4,	%i7
	fble	%fcc1,	loop_738
	movgu	%xcc,	%l0,	%i2
	orn	%g1,	%o7,	%o6
	popc	0x1D43,	%i4
loop_738:
	movcs	%icc,	%g4,	%i3
	movle	%icc,	%l3,	%i6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x10] %asi,	%g2
	nop
	fitos	%f8,	%f14
	fstod	%f14,	%f12
	tgu	%icc,	0x2
	bg,a,pt	%icc,	loop_739
	fmovsle	%icc,	%f22,	%f27
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_739:
	fnot2s	%f31,	%f3
	nop
	setx loop_740, %l0, %l1
	jmpl %l1, %i5
	movle	%icc,	%l1,	%g3
	fornot1	%f18,	%f8,	%f14
	fpadd32s	%f17,	%f15,	%f7
loop_740:
	fmovdvs	%xcc,	%f0,	%f12
	subcc	%l6,	%g7,	%l2
	edge8ln	%i1,	%o1,	%o3
	membar	0x3B
	fabss	%f15,	%f11
	fexpand	%f13,	%f26
	udiv	%g5,	0x134F,	%o0
	fcmpgt16	%f26,	%f0,	%o2
	or	%l4,	%o5,	%l5
	membar	0x5A
	lduw	[%l7 + 0x64],	%g6
	brnz,a	%o4,	loop_741
	bge,a	%icc,	loop_742
	bneg	%icc,	loop_743
	sra	%i7,	0x08,	%i0
loop_741:
	alignaddr	%l0,	%g1,	%o7
loop_742:
	movl	%xcc,	%i2,	%i4
loop_743:
	sdiv	%o6,	0x0C4E,	%i3
	bne,a,pn	%xcc,	loop_744
	xnorcc	%l3,	0x052A,	%i6
	edge8ln	%g2,	%g4,	%i5
	fsrc2s	%f7,	%f17
loop_744:
	tgu	%icc,	0x3
	std	%f12,	[%l7 + 0x38]
	tl	%xcc,	0x7
	orn	%l1,	%l6,	%g7
	movvs	%xcc,	%l2,	%g3
	addcc	%i1,	0x1F70,	%o1
	orncc	%o3,	0x15F8,	%g5
	bneg	loop_745
	addc	%o2,	0x137B,	%l4
	xorcc	%o5,	0x1E49,	%l5
	andn	%g6,	0x13E1,	%o0
loop_745:
	sllx	%i7,	%o4,	%i0
	fmovsneg	%icc,	%f9,	%f16
	bleu	%icc,	loop_746
	flush	%l7 + 0x14
	wr	%g0,	0x10,	%asi
	stxa	%l0,	[%l7 + 0x50] %asi
loop_746:
	sdiv	%g1,	0x0855,	%o7
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x53] %asi,	%i2
	mulx	%i4,	0x1D4F,	%o6
	ldd	[%l7 + 0x70],	%i2
	fmovspos	%xcc,	%f31,	%f31
	wr	%g0,	0x11,	%asi
	stba	%l3,	[%l7 + 0x24] %asi
	taddcc	%i6,	0x0619,	%g2
	subcc	%i5,	0x0085,	%l1
	fsrc2	%f8,	%f24
	srl	%l6,	0x1E,	%g4
	edge32ln	%l2,	%g3,	%i1
	ldsh	[%l7 + 0x08],	%o1
	fbue	%fcc2,	loop_747
	sll	%g7,	%o3,	%g5
	array32	%l4,	%o2,	%l5
	edge8n	%o5,	%g6,	%o0
loop_747:
	movpos	%icc,	%i7,	%o4
	tn	%icc,	0x4
	fbuge	%fcc0,	loop_748
	tle	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l0,	%g1,	%o7
loop_748:
	tle	%xcc,	0x3
	tneg	%icc,	0x5
	udivcc	%i0,	0x1538,	%i2
	srl	%o6,	%i3,	%l3
	orn	%i6,	%g2,	%i5
	movrgz	%l1,	%l6,	%i4
	ba,a	%icc,	loop_749
	edge8n	%g4,	%g3,	%i1
	fmovdvs	%icc,	%f30,	%f23
	umul	%l2,	%o1,	%g7
loop_749:
	fmovdle	%icc,	%f10,	%f11
	fornot2s	%f26,	%f8,	%f8
	edge32l	%g5,	%o3,	%o2
	ldstub	[%l7 + 0x7D],	%l5
	andn	%o5,	0x1232,	%l4
	subccc	%g6,	0x1A52,	%i7
	movcc	%icc,	%o4,	%o0
	tge	%xcc,	0x6
	fmovsl	%icc,	%f20,	%f16
	fmovdn	%xcc,	%f8,	%f27
	orn	%l0,	%o7,	%i0
	edge16l	%i2,	%g1,	%i3
	tg	%xcc,	0x3
	flush	%l7 + 0x2C
	addc	%l3,	%i6,	%o6
	movrlz	%i5,	0x127,	%g2
	movne	%xcc,	%l1,	%i4
	fbo,a	%fcc3,	loop_750
	ldsh	[%l7 + 0x24],	%l6
	fnor	%f26,	%f10,	%f4
	nop
	setx	0x3F91C038,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x7CF843BF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f15,	%f25
loop_750:
	orncc	%g4,	%g3,	%l2
	fblg,a	%fcc2,	loop_751
	sir	0x1AEF
	ta	%icc,	0x4
	movcc	%icc,	%i1,	%o1
loop_751:
	nop
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf8
	membar	#Sync
	movrgez	%g7,	0x1C6,	%g5
	andcc	%o3,	0x097A,	%o2
	edge8n	%l5,	%l4,	%g6
	mulscc	%i7,	0x1A3C,	%o4
	bleu	loop_752
	tl	%icc,	0x6
	fmovsvc	%icc,	%f21,	%f10
	edge32l	%o5,	%o0,	%l0
loop_752:
	tl	%xcc,	0x4
	nop
	setx loop_753, %l0, %l1
	jmpl %l1, %i0
	addcc	%i2,	0x1D2A,	%g1
	sdivcc	%o7,	0x1119,	%i3
	addccc	%i6,	0x0176,	%o6
loop_753:
	be,a,pt	%xcc,	loop_754
	ldd	[%l7 + 0x58],	%i4
	movgu	%xcc,	%l3,	%l1
	orn	%i4,	%l6,	%g2
loop_754:
	mova	%icc,	%g4,	%g3
	fmul8sux16	%f4,	%f30,	%f24
	mova	%xcc,	%l2,	%o1
	tsubcctv	%i1,	%g5,	%g7
	fabss	%f5,	%f23
	tne	%xcc,	0x5
	fba,a	%fcc0,	loop_755
	tne	%xcc,	0x1
	movgu	%icc,	%o2,	%o3
	fmovdle	%icc,	%f23,	%f6
loop_755:
	fpsub16s	%f16,	%f27,	%f16
	sdivcc	%l5,	0x0079,	%l4
	sllx	%g6,	0x19,	%o4
	addc	%i7,	0x1423,	%o0
	nop
	fitos	%f11,	%f1
	udivcc	%l0,	0x18DA,	%o5
	alignaddr	%i2,	%g1,	%o7
	movneg	%xcc,	%i3,	%i6
	tn	%xcc,	0x5
	fcmpgt16	%f16,	%f20,	%o6
	sdivx	%i5,	0x1D0F,	%l3
	be,pt	%icc,	loop_756
	fmovd	%f8,	%f16
	ldd	[%l7 + 0x38],	%i0
	set	0x38, %i2
	sta	%f5,	[%l7 + %i2] 0x10
loop_756:
	fmovscc	%xcc,	%f29,	%f26
	fmovsne	%icc,	%f14,	%f3
	fcmpne32	%f6,	%f8,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f16,	%f1
	taddcc	%l6,	0x1FC3,	%g2
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf9,	%f16
	mova	%icc,	%g4,	%i4
	membar	0x4F
	umul	%l2,	%g3,	%o1
	fmovd	%f26,	%f20
	bl,pn	%xcc,	loop_757
	membar	0x7F
	subccc	%g5,	0x174C,	%i1
	set	0x18, %l1
	ldxa	[%l7 + %l1] 0x15,	%o2
loop_757:
	orcc	%g7,	0x0612,	%l5
	movvc	%icc,	%o3,	%l4
	tvs	%xcc,	0x7
	sdivx	%o4,	0x03B2,	%g6
	set	0x34, %o5
	lda	[%l7 + %o5] 0x15,	%f22
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x48] %asi,	%o0
	te	%xcc,	0x2
	nop
	setx loop_758, %l0, %l1
	jmpl %l1, %i7
	fmovdvc	%xcc,	%f9,	%f11
	bgu,a	loop_759
	tgu	%icc,	0x1
loop_758:
	ble,a	%xcc,	loop_760
	fmovrslez	%l0,	%f28,	%f9
loop_759:
	subccc	%i2,	%g1,	%o7
	umul	%o5,	0x1402,	%i6
loop_760:
	sra	%o6,	%i5,	%l3
	subc	%i3,	0x0838,	%i0
	fandnot2	%f10,	%f6,	%f30
	fmovrse	%l6,	%f5,	%f20
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf1,	%f0
	srl	%l1,	0x1F,	%g4
	stb	%i4,	[%l7 + 0x2A]
	edge8l	%l2,	%g2,	%o1
	be,pn	%xcc,	loop_761
	fxor	%f26,	%f14,	%f22
	bpos,a	%icc,	loop_762
	tge	%xcc,	0x2
loop_761:
	tsubcc	%g5,	%g3,	%i1
	edge32l	%o2,	%g7,	%l5
loop_762:
	movrgez	%l4,	0x1D3,	%o3
	edge8l	%g6,	%o4,	%i7
	fmovdleu	%xcc,	%f11,	%f27
	bvc	%icc,	loop_763
	subcc	%l0,	%i2,	%g1
	tvc	%xcc,	0x0
	tle	%xcc,	0x3
loop_763:
	movn	%icc,	%o0,	%o7
	tgu	%icc,	0x0
	fxors	%f2,	%f21,	%f8
	fpadd16	%f18,	%f8,	%f4
	fands	%f13,	%f8,	%f2
	movvc	%icc,	%o5,	%o6
	umul	%i5,	%l3,	%i3
	movrne	%i6,	%i0,	%l1
	movne	%xcc,	%g4,	%i4
	tsubcctv	%l2,	%l6,	%o1
	fbne	%fcc3,	loop_764
	fexpand	%f16,	%f16
	movcs	%icc,	%g5,	%g3
	srax	%i1,	0x07,	%o2
loop_764:
	nop
	setx	0xBF550C83F04CB6A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fabss	%f21,	%f4
	fblg	%fcc0,	loop_765
	bpos	loop_766
	bne,a,pt	%xcc,	loop_767
	and	%g7,	%g2,	%l5
loop_765:
	ba,pt	%xcc,	loop_768
loop_766:
	fone	%f6
loop_767:
	array32	%o3,	%l4,	%o4
	fmovrse	%g6,	%f6,	%f24
loop_768:
	movrne	%l0,	%i2,	%i7
	smul	%o0,	0x0BE1,	%g1
	tvs	%xcc,	0x0
	popc	%o7,	%o5
	xor	%i5,	%l3,	%i3
	fnegd	%f28,	%f6
	wr	%g0,	0x2f,	%asi
	stxa	%o6,	[%l7 + 0x38] %asi
	membar	#Sync
	taddcctv	%i6,	0x0E5A,	%i0
	movneg	%xcc,	%g4,	%i4
	te	%xcc,	0x4
	nop
	fitos	%f4,	%f13
	fstod	%f13,	%f18
	bpos,pn	%xcc,	loop_769
	movre	%l2,	%l6,	%o1
	srax	%g5,	0x01,	%l1
	fbne,a	%fcc0,	loop_770
loop_769:
	sir	0x0CF2
	tle	%icc,	0x7
	nop
	setx	0x6675301A104AA774,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_770:
	addc	%g3,	0x1E22,	%i1
	nop
	setx	loop_771,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%g7,	0x08C1,	%o2
	sethi	0x063D,	%g2
	fmovdge	%xcc,	%f7,	%f12
loop_771:
	brgez	%l5,	loop_772
	stw	%o3,	[%l7 + 0x74]
	movcc	%icc,	%l4,	%g6
	movg	%icc,	%l0,	%i2
loop_772:
	and	%o4,	%o0,	%i7
	lduw	[%l7 + 0x3C],	%o7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x0C] %asi,	%f5
	fsrc1s	%f4,	%f22
	movn	%xcc,	%g1,	%o5
	umul	%l3,	0x1D85,	%i5
	mova	%xcc,	%o6,	%i6
	edge8l	%i0,	%i3,	%g4
	umulcc	%i4,	%l2,	%l6
	tcc	%xcc,	0x2
	bge,a,pt	%xcc,	loop_773
	addc	%g5,	0x014F,	%o1
	tsubcc	%l1,	0x1A34,	%g3
	edge8	%i1,	%g7,	%g2
loop_773:
	fsrc2s	%f21,	%f11
	fmovdcs	%xcc,	%f21,	%f13
	movrgez	%o2,	%l5,	%l4
	movgu	%xcc,	%g6,	%l0
	fcmpne16	%f12,	%f20,	%o3
	fmovdne	%xcc,	%f11,	%f10
	fbge	%fcc2,	loop_774
	fpmerge	%f4,	%f0,	%f12
	tgu	%icc,	0x4
	edge8l	%o4,	%i2,	%i7
loop_774:
	edge16ln	%o0,	%o7,	%o5
	nop
	setx	0x8A1D8E89FDE63B75,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2D0840943B67D43F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f10,	%f26
	fbu,a	%fcc3,	loop_775
	nop
	setx	0xD5CED6EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f23
loop_775:
	te	%icc,	0x0
	fzero	%f14
	sir	0x1124
	std	%f24,	[%l7 + 0x40]
	tneg	%xcc,	0x5
	fmovdl	%icc,	%f4,	%f13
	udivcc	%g1,	0x052A,	%l3
	bne,a	%icc,	loop_776
	alignaddr	%i5,	%o6,	%i0
	fmul8ulx16	%f22,	%f18,	%f4
	fbn	%fcc3,	loop_777
loop_776:
	tcc	%xcc,	0x6
	subcc	%i6,	%i3,	%g4
	fnot2	%f20,	%f2
loop_777:
	movvs	%icc,	%l2,	%l6
	fmovdl	%xcc,	%f15,	%f5
	taddcctv	%g5,	0x06DB,	%o1
	nop
	fitod	%f10,	%f16
	movrlz	%i4,	%l1,	%i1
	brlz	%g3,	loop_778
	fble,a	%fcc0,	loop_779
	sir	0x0A58
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g7
loop_778:
	edge8ln	%o2,	%g2,	%l4
loop_779:
	movgu	%icc,	%g6,	%l5
	subccc	%l0,	%o3,	%i2
	set	0x0C, %o3
	ldswa	[%l7 + %o3] 0x10,	%i7
	fbl,a	%fcc2,	loop_780
	edge8ln	%o0,	%o7,	%o5
	movleu	%xcc,	%g1,	%o4
	xorcc	%l3,	0x0192,	%o6
loop_780:
	xor	%i0,	0x1521,	%i6
	movcs	%xcc,	%i3,	%i5
	ta	%xcc,	0x0
	bcc,a,pn	%icc,	loop_781
	movrlz	%g4,	%l2,	%l6
	ba,a,pn	%xcc,	loop_782
	udiv	%o1,	0x1351,	%g5
loop_781:
	fmovsl	%xcc,	%f2,	%f15
	nop
	setx	0x1928E24D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xFFBF6176,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f18,	%f14
loop_782:
	edge32n	%l1,	%i4,	%g3
	brgez,a	%g7,	loop_783
	andn	%i1,	%o2,	%g2
	tsubcctv	%l4,	%l5,	%g6
	taddcc	%l0,	0x1FB6,	%o3
loop_783:
	fandnot2s	%f1,	%f12,	%f28
	fxnor	%f30,	%f2,	%f22
	sir	0x1348
	nop
	setx	loop_784,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%i2,	0x0387,	%i7
	tle	%icc,	0x5
	ldsb	[%l7 + 0x67],	%o0
loop_784:
	nop
	set	0x38, %g4
	ldxa	[%l7 + %g4] 0x18,	%o5
	brz	%o7,	loop_785
	edge32l	%g1,	%o4,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x3
loop_785:
	fandnot2s	%f7,	%f20,	%f23
	fmovrsgz	%i0,	%f15,	%f18
	mulscc	%l3,	%i3,	%i5
	edge16n	%i6,	%l2,	%g4
	tcs	%xcc,	0x0
	taddcctv	%l6,	%o1,	%l1
	nop
	fitos	%f4,	%f18
	fstox	%f18,	%f24
	stx	%i4,	[%l7 + 0x60]
	tgu	%xcc,	0x2
	tneg	%icc,	0x7
	array32	%g5,	%g7,	%g3
	edge16n	%o2,	%i1,	%l4
	ta	%xcc,	0x4
	edge32	%l5,	%g2,	%l0
	edge16n	%g6,	%i2,	%o3
	andncc	%i7,	%o0,	%o5
	smulcc	%g1,	%o7,	%o6
	bleu,a	loop_786
	edge32ln	%i0,	%l3,	%o4
	tcs	%icc,	0x4
	sra	%i5,	0x17,	%i6
loop_786:
	ldd	[%l7 + 0x60],	%l2
	xor	%g4,	0x11A4,	%i3
	set	0x74, %g1
	swapa	[%l7 + %g1] 0x88,	%o1
	movrlz	%l6,	%l1,	%g5
	fnot1s	%f3,	%f0
	fmul8x16	%f0,	%f14,	%f28
	movpos	%xcc,	%g7,	%g3
	edge16	%o2,	%i4,	%l4
	tcc	%icc,	0x3
	fbne,a	%fcc0,	loop_787
	nop
	set	0x6F, %o1
	ldstub	[%l7 + %o1],	%l5
	std	%f10,	[%l7 + 0x50]
	udivcc	%i1,	0x0BB5,	%g2
loop_787:
	fnors	%f23,	%f27,	%f29
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x50] %asi,	%g6
	set	0x64, %g3
	ldswa	[%l7 + %g3] 0x81,	%l0
	fbge	%fcc0,	loop_788
	fpsub32	%f30,	%f2,	%f12
	tle	%icc,	0x6
	bgu,pn	%icc,	loop_789
loop_788:
	tsubcc	%o3,	0x15F0,	%i2
	wr	%g0,	0xe3,	%asi
	stwa	%o0,	[%l7 + 0x3C] %asi
	membar	#Sync
loop_789:
	tge	%icc,	0x5
	movrlez	%i7,	%g1,	%o5
	fbue	%fcc1,	loop_790
	srl	%o6,	0x13,	%o7
	fpmerge	%f9,	%f0,	%f22
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f19
loop_790:
	taddcctv	%l3,	0x089D,	%i0
	set	0x0, %i7
	ldxa	[%g0 + %i7] 0x58,	%o4
	movg	%icc,	%i5,	%i6
	fmovsvc	%xcc,	%f1,	%f12
	fmovsg	%icc,	%f6,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l2,	%g4,	%i3
	tsubcctv	%l6,	%l1,	%g5
	call	loop_791
	fbu,a	%fcc1,	loop_792
	ldsw	[%l7 + 0x3C],	%o1
	mulx	%g7,	0x077C,	%o2
loop_791:
	fbne	%fcc2,	loop_793
loop_792:
	fbule	%fcc3,	loop_794
	swap	[%l7 + 0x6C],	%i4
	movn	%icc,	%l4,	%g3
loop_793:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_794:
	edge8n	%l5,	%g2,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l0,	%o3,	%g6
	array16	%o0,	%i2,	%i7
	ldub	[%l7 + 0x14],	%o5
	fabsd	%f22,	%f16
	tne	%icc,	0x5
	taddcc	%g1,	0x178D,	%o6
	fmovdl	%icc,	%f25,	%f26
	xorcc	%l3,	%i0,	%o7
	fandnot1s	%f13,	%f21,	%f29
	ldsw	[%l7 + 0x78],	%i5
	tsubcc	%o4,	%i6,	%g4
	edge16n	%l2,	%l6,	%i3
	popc	%g5,	%l1
	fsrc2s	%f22,	%f19
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x19,	%g7,	%o2
	ldsb	[%l7 + 0x79],	%i4
	andcc	%o1,	0x192E,	%l4
	movleu	%xcc,	%l5,	%g3
	xnor	%i1,	%g2,	%l0
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tg	%xcc,	0x2
	movre	%g6,	%o0,	%o3
	srax	%i7,	0x16,	%i2
	tsubcctv	%o5,	%o6,	%g1
	pdist	%f10,	%f24,	%f28
	edge32ln	%i0,	%l3,	%i5
	movcs	%icc,	%o7,	%o4
	for	%f14,	%f8,	%f30
	fblg,a	%fcc1,	loop_795
	fpadd16s	%f7,	%f26,	%f19
	subcc	%i6,	0x04F0,	%l2
	fbu	%fcc3,	loop_796
loop_795:
	sll	%g4,	0x14,	%i3
	edge16	%g5,	%l6,	%l1
	bshuffle	%f20,	%f22,	%f30
loop_796:
	smulcc	%o2,	0x1BFD,	%g7
	movrgz	%i4,	%l4,	%l5
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x38] %asi,	%o1
	edge8l	%i1,	%g2,	%g3
	set	0x20, %o4
	swapa	[%l7 + %o4] 0x80,	%l0
	movne	%icc,	%o0,	%g6
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x89,	%i6
	brgez,a	%o3,	loop_797
	fmovrsgez	%o5,	%f17,	%f21
	orncc	%i2,	%g1,	%i0
	ldx	[%l7 + 0x28],	%o6
loop_797:
	array8	%l3,	%o7,	%i5
	tsubcc	%i6,	0x15F1,	%l2
	brlez,a	%o4,	loop_798
	array32	%i3,	%g5,	%g4
	sdiv	%l6,	0x07EB,	%o2
	movleu	%xcc,	%g7,	%i4
loop_798:
	nop
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	mulscc	%l4,	%l5,	%o1
	nop
	fitod	%f4,	%f24
	fdtox	%f24,	%f28
	movneg	%xcc,	%i1,	%l1
	fmovrdne	%g3,	%f6,	%f16
	fmovsvs	%xcc,	%f17,	%f25
	edge8l	%l0,	%o0,	%g2
	umul	%i7,	0x10AC,	%g6
	tvc	%icc,	0x7
	addc	%o5,	0x0379,	%i2
	fbge,a	%fcc0,	loop_799
	alignaddrl	%g1,	%o3,	%o6
	movvc	%icc,	%l3,	%i0
	movneg	%icc,	%i5,	%o7
loop_799:
	tn	%icc,	0x1
	call	loop_800
	movl	%xcc,	%l2,	%o4
	udivcc	%i3,	0x0DE5,	%g5
	bne,a,pn	%xcc,	loop_801
loop_800:
	fmovsgu	%xcc,	%f14,	%f14
	edge8l	%g4,	%l6,	%i6
	movle	%icc,	%o2,	%g7
loop_801:
	movcc	%icc,	%i4,	%l5
	movne	%xcc,	%l4,	%i1
	ldub	[%l7 + 0x29],	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g3,	%l1,	%l0
	sdivcc	%o0,	0x015A,	%i7
	set	0x50, %g5
	prefetcha	[%l7 + %g5] 0x19,	 0x1
	edge32l	%o5,	%i2,	%g6
	nop
	fitod	%f29,	%f6
	nop
	setx loop_802, %l0, %l1
	jmpl %l1, %g1
	st	%f30,	[%l7 + 0x10]
	edge32ln	%o3,	%l3,	%i0
	ta	%icc,	0x0
loop_802:
	fmovdleu	%xcc,	%f2,	%f10
	fbne,a	%fcc1,	loop_803
	tn	%xcc,	0x5
	stbar
	set	0x2B, %i1
	lduba	[%l7 + %i1] 0x80,	%i5
loop_803:
	edge8ln	%o7,	%o6,	%l2
	fbul,a	%fcc0,	loop_804
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i3,	0x1B24,	%o4
	bvc,pt	%icc,	loop_805
loop_804:
	fnands	%f8,	%f1,	%f18
	fbe,a	%fcc1,	loop_806
	addc	%g5,	0x0D21,	%g4
loop_805:
	tle	%xcc,	0x7
	edge8n	%i6,	%l6,	%o2
loop_806:
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f18
	fxtod	%f18,	%f2
	smulcc	%i4,	%g7,	%l5
	fmovspos	%icc,	%f26,	%f17
	fbue,a	%fcc3,	loop_807
	sll	%l4,	%i1,	%g3
	fbn	%fcc2,	loop_808
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f10
	fxtod	%f10,	%f0
loop_807:
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f28
	orcc	%o1,	%l1,	%o0
loop_808:
	nop
	setx	0xDFAC9769,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f12
	edge8n	%l0,	%g2,	%i7
	fmovs	%f23,	%f11
	tsubcc	%i2,	%o5,	%g1
	fmovscs	%icc,	%f26,	%f31
	xnorcc	%o3,	%g6,	%l3
	alignaddrl	%i0,	%o7,	%o6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
	addccc	%i3,	%i5,	%g5
	edge8	%g4,	%i6,	%l6
	brz,a	%o2,	loop_809
	ldstub	[%l7 + 0x52],	%i4
	bneg,a	loop_810
	ta	%xcc,	0x0
loop_809:
	alignaddrl	%g7,	%o4,	%l5
	brz	%i1,	loop_811
loop_810:
	edge8ln	%g3,	%l4,	%o1
	movrgz	%o0,	0x0FE,	%l1
	tvs	%xcc,	0x5
loop_811:
	smulcc	%g2,	%l0,	%i2
	brlez	%o5,	loop_812
	fzero	%f6
	sll	%i7,	0x03,	%o3
	taddcctv	%g6,	%g1,	%i0
loop_812:
	sdivx	%o7,	0x02F0,	%l3
	mulx	%o6,	0x0FB5,	%i3
	nop
	setx loop_813, %l0, %l1
	jmpl %l1, %l2
	edge8n	%g5,	%g4,	%i5
	mova	%xcc,	%i6,	%o2
	wr	%g0,	0x04,	%asi
	stwa	%i4,	[%l7 + 0x6C] %asi
loop_813:
	movvc	%xcc,	%l6,	%o4
	movrgz	%g7,	0x197,	%l5
	sir	0x1ACA
	fandnot2	%f30,	%f22,	%f2
	edge8	%g3,	%l4,	%i1
	ldx	[%l7 + 0x68],	%o0
	fzero	%f18
	nop
	set	0x60, %o6
	stx	%o1,	[%l7 + %o6]
	movpos	%icc,	%g2,	%l1
	fnors	%f9,	%f9,	%f15
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f28
	fbge,a	%fcc3,	loop_814
	tgu	%xcc,	0x6
	andncc	%l0,	%o5,	%i7
	edge32l	%o3,	%g6,	%g1
loop_814:
	stx	%i2,	[%l7 + 0x50]
	sllx	%i0,	0x02,	%l3
	fbo	%fcc1,	loop_815
	ta	%icc,	0x6
	addc	%o7,	%o6,	%i3
	addcc	%l2,	%g4,	%g5
loop_815:
	bne,pn	%xcc,	loop_816
	tcc	%icc,	0x1
	array32	%i6,	%i5,	%i4
	fmul8x16au	%f9,	%f6,	%f10
loop_816:
	nop
	set	0x10, %l6
	sta	%f13,	[%l7 + %l6] 0x18
	tle	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l6,	%o4,	%g7
	movvc	%xcc,	%l5,	%g3
	nop
	set	0x38, %o2
	sth	%o2,	[%l7 + %o2]
	fmovrsgz	%l4,	%f20,	%f30
	fsrc2	%f18,	%f0
	tge	%icc,	0x1
	tle	%icc,	0x6
	movge	%icc,	%i1,	%o1
	edge32	%g2,	%l1,	%o0
	ld	[%l7 + 0x68],	%f6
	swap	[%l7 + 0x0C],	%o5
	fmovdneg	%icc,	%f24,	%f10
	srl	%i7,	0x0E,	%l0
	fmovrsgez	%o3,	%f14,	%f21
	xor	%g1,	%g6,	%i2
	fpsub32	%f10,	%f4,	%f0
	fcmpeq32	%f22,	%f2,	%i0
	sdivcc	%o7,	0x13D5,	%l3
	tgu	%icc,	0x7
	set	0x6C, %l2
	sta	%f16,	[%l7 + %l2] 0x80
	sub	%i3,	0x044A,	%o6
	fbul,a	%fcc3,	loop_817
	fpadd16	%f24,	%f18,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x7
loop_817:
	fpadd16s	%f9,	%f29,	%f9
	fmovdn	%icc,	%f20,	%f3
	te	%xcc,	0x7
	udivcc	%l2,	0x17A9,	%g5
	movpos	%xcc,	%i6,	%i5
	srl	%g4,	0x19,	%i4
	edge32l	%o4,	%g7,	%l6
	swap	[%l7 + 0x0C],	%l5
	edge32	%o2,	%l4,	%i1
	movgu	%xcc,	%o1,	%g2
	sdiv	%l1,	0x153B,	%g3
	movne	%icc,	%o5,	%o0
	movrne	%l0,	%i7,	%g1
	nop
	setx	0xC567C856,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f11
	bneg,pn	%icc,	loop_818
	fors	%f2,	%f5,	%f23
	tvc	%icc,	0x0
	fands	%f6,	%f2,	%f9
loop_818:
	movgu	%icc,	%g6,	%i2
	bpos,a,pn	%xcc,	loop_819
	add	%o3,	%i0,	%o7
	movvs	%xcc,	%l3,	%o6
	fornot2	%f4,	%f0,	%f26
loop_819:
	andncc	%l2,	%g5,	%i3
	brlz,a	%i6,	loop_820
	array16	%g4,	%i5,	%o4
	srl	%g7,	%l6,	%i4
	alignaddr	%o2,	%l4,	%i1
loop_820:
	fbu,a	%fcc2,	loop_821
	mova	%xcc,	%l5,	%g2
	fmovdvc	%xcc,	%f19,	%f23
	andncc	%o1,	%l1,	%g3
loop_821:
	sll	%o5,	%l0,	%o0
	popc	0x0A31,	%i7
	ldd	[%l7 + 0x68],	%f22
	ba,a	%xcc,	loop_822
	movneg	%xcc,	%g1,	%i2
	fbge	%fcc1,	loop_823
	fbu	%fcc0,	loop_824
loop_822:
	fnot1s	%f24,	%f20
	fpadd16	%f6,	%f2,	%f22
loop_823:
	fmovrdne	%g6,	%f24,	%f4
loop_824:
	movl	%icc,	%i0,	%o3
	fors	%f23,	%f3,	%f7
	edge16	%l3,	%o7,	%o6
	ta	%xcc,	0x2
	move	%icc,	%g5,	%i3
	bgu	%icc,	loop_825
	move	%xcc,	%l2,	%g4
	tne	%icc,	0x2
	tl	%xcc,	0x2
loop_825:
	tgu	%icc,	0x2
	fxnor	%f0,	%f26,	%f18
	nop
	setx	0x1BD9086B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x840029D8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f28,	%f13
	edge8n	%i5,	%i6,	%o4
	popc	%g7,	%i4
	edge16ln	%o2,	%l4,	%i1
	sethi	0x19E3,	%l5
	membar	0x51
	fmovsn	%xcc,	%f16,	%f10
	edge16	%l6,	%o1,	%l1
	sdivcc	%g2,	0x0746,	%o5
	fmovdge	%xcc,	%f6,	%f13
	movrlez	%l0,	%o0,	%g3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%g1
	mulx	%g6,	%i0,	%o3
	fbge,a	%fcc2,	loop_826
	fbo,a	%fcc2,	loop_827
	array32	%l3,	%i2,	%o7
	tleu	%xcc,	0x4
loop_826:
	edge8	%g5,	%i3,	%l2
loop_827:
	fbn	%fcc3,	loop_828
	fmovdleu	%icc,	%f15,	%f22
	movleu	%xcc,	%g4,	%i5
	fbul,a	%fcc2,	loop_829
loop_828:
	fbu,a	%fcc0,	loop_830
	fandnot2s	%f4,	%f3,	%f17
	fmovdcs	%icc,	%f18,	%f15
loop_829:
	tvc	%xcc,	0x0
loop_830:
	fbn	%fcc3,	loop_831
	subcc	%i6,	0x1FEB,	%o4
	bvs,a	loop_832
	tpos	%xcc,	0x5
loop_831:
	fbn,a	%fcc1,	loop_833
	tvs	%xcc,	0x5
loop_832:
	fnand	%f16,	%f0,	%f14
	nop
	setx	0x24B3BA8A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x49C3B3D2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f5,	%f2
loop_833:
	edge32l	%o6,	%i4,	%o2
	movg	%icc,	%l4,	%g7
	movge	%icc,	%l5,	%i1
	movl	%icc,	%o1,	%l6
	orcc	%l1,	%o5,	%g2
	and	%o0,	0x0C16,	%l0
	subcc	%g3,	%g1,	%i7
	alignaddr	%g6,	%i0,	%l3
	prefetch	[%l7 + 0x10],	 0x1
	fpsub16s	%f3,	%f29,	%f29
	fmovdcc	%icc,	%f7,	%f4
	sra	%o3,	%o7,	%i2
	fmovrsne	%g5,	%f24,	%f13
	andcc	%l2,	0x1BD7,	%i3
	move	%icc,	%i5,	%i6
	tgu	%icc,	0x6
	edge8n	%o4,	%o6,	%i4
	st	%f12,	[%l7 + 0x78]
	fmovsg	%xcc,	%f28,	%f29
	fbul,a	%fcc2,	loop_834
	movvs	%xcc,	%g4,	%o2
	edge16n	%g7,	%l5,	%l4
	bn,a,pn	%icc,	loop_835
loop_834:
	array8	%i1,	%l6,	%o1
	edge16n	%l1,	%o5,	%o0
	fmovdcc	%xcc,	%f17,	%f27
loop_835:
	sethi	0x0BCC,	%l0
	set	0x1C, %i6
	ldswa	[%l7 + %i6] 0x10,	%g2
	ta	%icc,	0x5
	fnors	%f5,	%f22,	%f17
	alignaddr	%g3,	%g1,	%g6
	edge16	%i0,	%l3,	%i7
	fbue,a	%fcc0,	loop_836
	nop
	setx	0x5E61D5AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x0FD18D5A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f31,	%f26
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x0C] %asi,	%o3
loop_836:
	brgez	%o7,	loop_837
	sdiv	%i2,	0x0DAD,	%l2
	array8	%g5,	%i5,	%i3
	xor	%i6,	%o4,	%i4
loop_837:
	sra	%o6,	%o2,	%g7
	movge	%xcc,	%g4,	%l4
	fmovrsgz	%l5,	%f22,	%f15
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x14] %asi,	%f24
	tge	%icc,	0x7
	edge16	%l6,	%i1,	%o1
	ta	%icc,	0x1
	edge16n	%o5,	%o0,	%l1
	xorcc	%g2,	%g3,	%g1
	sdivcc	%l0,	0x01C0,	%i0
	fornot1	%f10,	%f6,	%f12
	popc	0x0F0E,	%g6
	tleu	%icc,	0x0
	fmovsneg	%icc,	%f19,	%f4
	sethi	0x04D1,	%i7
	fpadd16s	%f23,	%f26,	%f26
	fmul8x16au	%f8,	%f20,	%f20
	sub	%o3,	%o7,	%l3
	umul	%l2,	0x0BBD,	%g5
	subccc	%i2,	0x1787,	%i3
	edge32n	%i6,	%i5,	%o4
	stb	%i4,	[%l7 + 0x1D]
	movrgez	%o6,	0x0C6,	%o2
	ble,a	loop_838
	edge32	%g7,	%g4,	%l5
	movcc	%xcc,	%l6,	%l4
	fmovdne	%icc,	%f0,	%f24
loop_838:
	popc	0x14D1,	%i1
	sth	%o5,	[%l7 + 0x18]
	tcs	%icc,	0x4
	sdiv	%o0,	0x0EBD,	%l1
	andcc	%g2,	0x00CC,	%o1
	edge32n	%g1,	%g3,	%l0
	fbl,a	%fcc1,	loop_839
	edge16l	%i0,	%i7,	%o3
	tleu	%icc,	0x4
	nop
	fitod	%f2,	%f4
	fdtox	%f4,	%f28
loop_839:
	movneg	%icc,	%o7,	%l3
	add	%g6,	0x1877,	%g5
	udivx	%l2,	0x0019,	%i2
	ble	%xcc,	loop_840
	fsrc1s	%f29,	%f11
	edge16n	%i6,	%i5,	%o4
	sub	%i4,	0x0F56,	%i3
loop_840:
	nop
	set	0x60, %i5
	std	%f8,	[%l7 + %i5]
	fpsub16s	%f4,	%f1,	%f0
	edge16n	%o2,	%g7,	%g4
	fmovsvs	%xcc,	%f27,	%f0
	sdivx	%l5,	0x056A,	%o6
	fnot1s	%f16,	%f15
	edge8	%l6,	%i1,	%l4
	xnorcc	%o0,	0x1CEA,	%o5
	movcs	%icc,	%l1,	%g2
	movrgez	%o1,	%g1,	%g3
	fbo	%fcc1,	loop_841
	movre	%l0,	%i7,	%o3
	fxor	%f6,	%f2,	%f16
	movle	%xcc,	%o7,	%i0
loop_841:
	nop
	set	0x11, %g2
	stba	%g6,	[%l7 + %g2] 0x14
	fbu,a	%fcc1,	loop_842
	fmul8x16au	%f30,	%f13,	%f28
	bpos,a,pt	%icc,	loop_843
	fba,a	%fcc3,	loop_844
loop_842:
	movn	%icc,	%l3,	%g5
	addc	%l2,	%i6,	%i5
loop_843:
	fors	%f29,	%f16,	%f9
loop_844:
	andncc	%o4,	%i4,	%i2
	bgu,a	%icc,	loop_845
	bge,pn	%icc,	loop_846
	array8	%o2,	%g7,	%i3
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%g4
loop_845:
	fzeros	%f17
loop_846:
	fmovsa	%icc,	%f21,	%f19
	mulx	%l5,	0x0677,	%o6
	tcs	%icc,	0x3
	fmul8x16	%f4,	%f26,	%f14
	nop
	set	0x58, %o7
	lduw	[%l7 + %o7],	%i1
	and	%l4,	%l6,	%o5
	tne	%icc,	0x6
	add	%o0,	0x076A,	%l1
	nop
	setx	loop_847,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitod	%f8,	%f12
	fdtos	%f12,	%f30
	tle	%icc,	0x0
	ldsb	[%l7 + 0x56],	%g2
loop_847:
	sll	%g1,	0x16,	%g3
	tne	%xcc,	0x7
	fmovdgu	%xcc,	%f28,	%f23
	addc	%l0,	%o1,	%o3
	nop
	setx	0xD198A5BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xD0C84DC0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f13,	%f24
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	movrlez	%i0,	0x311,	%g6
	andncc	%o7,	%l3,	%l2
	fblg	%fcc2,	loop_848
	te	%icc,	0x6
	fmovrsgz	%g5,	%f26,	%f13
	fornot2s	%f25,	%f0,	%f10
loop_848:
	fmovdneg	%icc,	%f30,	%f10
	fmovsneg	%xcc,	%f8,	%f15
	edge8ln	%i6,	%i5,	%o4
	andcc	%i4,	0x10CD,	%i2
	tpos	%xcc,	0x2
	edge16	%g7,	%o2,	%g4
	srax	%l5,	0x00,	%i3
	srl	%o6,	0x16,	%l4
	ldd	[%l7 + 0x20],	%i0
	movl	%icc,	%l6,	%o0
	bne,pt	%xcc,	loop_849
	brlez	%o5,	loop_850
	srlx	%l1,	0x02,	%g1
	bpos	loop_851
loop_849:
	tvc	%icc,	0x3
loop_850:
	movge	%xcc,	%g3,	%g2
	mova	%icc,	%l0,	%o1
loop_851:
	sethi	0x03A0,	%o3
	orcc	%i7,	0x0645,	%g6
	srl	%i0,	0x0B,	%l3
	movneg	%xcc,	%o7,	%l2
	movpos	%xcc,	%i6,	%i5
	srlx	%g5,	%i4,	%i2
	bne,pt	%icc,	loop_852
	fbul,a	%fcc1,	loop_853
	sir	0x14DF
	wr	%g0,	0x10,	%asi
	stxa	%g7,	[%l7 + 0x10] %asi
loop_852:
	edge16	%o4,	%g4,	%o2
loop_853:
	tvc	%xcc,	0x3
	and	%l5,	0x0734,	%o6
	movvc	%icc,	%i3,	%l4
	taddcctv	%i1,	0x1A94,	%l6
	nop
	setx	loop_854,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%xcc,	%o5,	%l1
	umul	%o0,	0x0CCA,	%g1
	fzeros	%f16
loop_854:
	fmovsvs	%icc,	%f6,	%f26
	ldstub	[%l7 + 0x73],	%g2
	add	%l0,	0x139E,	%g3
	wr	%g0,	0x81,	%asi
	stxa	%o3,	[%l7 + 0x60] %asi
	andn	%i7,	0x14D5,	%o1
	tvs	%icc,	0x6
	bleu,pt	%icc,	loop_855
	alignaddrl	%i0,	%l3,	%o7
	movle	%xcc,	%g6,	%i6
	fmovrsgz	%i5,	%f22,	%f7
loop_855:
	tpos	%icc,	0x7
	xnor	%l2,	%g5,	%i2
	fmovdneg	%xcc,	%f20,	%f7
	fmovsn	%xcc,	%f1,	%f30
	fmuld8ulx16	%f13,	%f17,	%f8
	brlez,a	%g7,	loop_856
	ldd	[%l7 + 0x58],	%f0
	udivcc	%i4,	0x057B,	%o4
	nop
	setx	0x11689760,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xF6FE8C14,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f11,	%f25
loop_856:
	fexpand	%f27,	%f28
	flush	%l7 + 0x78
	edge16n	%g4,	%l5,	%o6
	xorcc	%o2,	%l4,	%i3
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x42] %asi,	%i1
	srl	%o5,	%l6,	%o0
	fnegs	%f4,	%f0
	fbne,a	%fcc3,	loop_857
	umulcc	%g1,	0x075A,	%g2
	movrne	%l0,	0x2E3,	%g3
	edge8l	%l1,	%o3,	%o1
loop_857:
	movleu	%icc,	%i7,	%l3
	nop
	fitos	%f10,	%f25
	fstod	%f25,	%f20
	sub	%i0,	%g6,	%i6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i5
	fmovsvs	%xcc,	%f12,	%f3
	brlz	%o7,	loop_858
	udivcc	%g5,	0x1D15,	%i2
	fnegs	%f19,	%f2
	movcc	%xcc,	%g7,	%i4
loop_858:
	umul	%l2,	0x0BBD,	%g4
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	tgu	%xcc,	0x5
	fmul8ulx16	%f22,	%f12,	%f26
	tge	%xcc,	0x5
	subcc	%l5,	0x0112,	%o6
	fmovdle	%icc,	%f22,	%f17
	movle	%xcc,	%l4,	%i3
	set	0x2E, %l5
	lduba	[%l7 + %l5] 0x19,	%i1
	movcs	%icc,	%o2,	%l6
	tsubcc	%o5,	%o0,	%g1
	addcc	%l0,	0x0D15,	%g2
	tge	%xcc,	0x0
	orcc	%l1,	%o3,	%o1
	nop
	fitod	%f18,	%f22
	fbo,a	%fcc3,	loop_859
	brgez,a	%i7,	loop_860
	brlez,a	%l3,	loop_861
	fbne,a	%fcc2,	loop_862
loop_859:
	edge16l	%g3,	%g6,	%i6
loop_860:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_861:
	sir	0x1BD5
loop_862:
	tsubcctv	%i0,	0x135C,	%i5
	tg	%xcc,	0x3
	umul	%g5,	0x0F3B,	%i2
	bpos,a	%icc,	loop_863
	subcc	%g7,	0x0999,	%o7
	tge	%xcc,	0x6
	tcc	%xcc,	0x4
loop_863:
	taddcc	%l2,	%g4,	%o4
	st	%f11,	[%l7 + 0x2C]
	nop
	setx	0xF5B8C4A7CBB9CF2D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x1F35EB559E8AAA39,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f10,	%f2
	andcc	%i4,	0x14AE,	%l5
	movre	%l4,	0x2A0,	%i3
	fmovsge	%icc,	%f0,	%f19
	edge8l	%i1,	%o6,	%o2
	fpadd32s	%f21,	%f2,	%f0
	fbuge,a	%fcc3,	loop_864
	fmovsneg	%icc,	%f23,	%f28
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o5,	%o0
loop_864:
	nop
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x30] %asi,	%g0
	umulcc	%l0,	%l6,	%l1
	fsrc1s	%f27,	%f30
	fbul,a	%fcc1,	loop_865
	fzero	%f24
	ldsh	[%l7 + 0x0A],	%g2
	bgu,pt	%icc,	loop_866
loop_865:
	sra	%o3,	%o1,	%i7
	sdivx	%g3,	0x09DC,	%l3
	brgez,a	%i6,	loop_867
loop_866:
	fpackfix	%f2,	%f17
	edge8ln	%i0,	%g6,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_867:
	fmul8x16	%f13,	%f18,	%f8
	edge32l	%g5,	%i2,	%g7
	orncc	%l2,	0x1CF2,	%g4
	and	%o4,	%o7,	%l5
	srax	%l4,	%i3,	%i1
	edge32ln	%i4,	%o6,	%o2
	tne	%xcc,	0x2
	sllx	%o0,	0x15,	%g1
	fmovrse	%l0,	%f21,	%f26
	umul	%l6,	0x1925,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f2,	%f30,	%f14
	faligndata	%f28,	%f14,	%f30
	fbuge,a	%fcc1,	loop_868
	tgu	%xcc,	0x3
	fbge	%fcc0,	loop_869
	smulcc	%o5,	%o3,	%o1
loop_868:
	te	%icc,	0x3
	wr	%g0,	0x80,	%asi
	stwa	%i7,	[%l7 + 0x5C] %asi
loop_869:
	nop
	fitos	%f6,	%f22
	fba	%fcc2,	loop_870
	fmovsvs	%icc,	%f10,	%f25
	array16	%g2,	%g3,	%i6
	movleu	%xcc,	%l3,	%g6
loop_870:
	edge8l	%i5,	%i0,	%g5
	sdivx	%i2,	0x1D97,	%g7
	ldub	[%l7 + 0x48],	%g4
	xor	%o4,	%o7,	%l5
	sdivcc	%l2,	0x15AA,	%i3
	edge16ln	%i1,	%l4,	%o6
	fpadd32s	%f14,	%f21,	%f25
	nop
	fitos	%f5,	%f30
	fstoi	%f30,	%f0
	smulcc	%o2,	%o0,	%i4
	alignaddr	%l0,	%g1,	%l1
	bg,a,pt	%xcc,	loop_871
	fmul8ulx16	%f30,	%f16,	%f18
	edge8	%o5,	%l6,	%o3
	tleu	%xcc,	0x1
loop_871:
	nop
	fitos	%f13,	%f3
	fstox	%f3,	%f20
	fxtos	%f20,	%f25
	popc	%i7,	%o1
	addcc	%g3,	%g2,	%l3
	xnorcc	%i6,	0x0FDE,	%g6
	tvs	%icc,	0x7
	fmovrslez	%i0,	%f26,	%f0
	or	%i5,	0x000C,	%g5
	fabss	%f13,	%f30
	sdivx	%g7,	0x197A,	%i2
	fmul8x16	%f19,	%f18,	%f22
	set	0x22, %i4
	ldsha	[%l7 + %i4] 0x88,	%g4
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x1f,	%f16
	udiv	%o4,	0x13C4,	%o7
	tne	%icc,	0x1
	sra	%l5,	%i3,	%i1
	fmovsne	%xcc,	%f30,	%f29
	and	%l2,	%l4,	%o2
	ld	[%l7 + 0x6C],	%f11
	ba,pn	%xcc,	loop_872
	movcs	%xcc,	%o0,	%i4
	alignaddrl	%o6,	%l0,	%l1
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x14
loop_872:
	fone	%f10
	edge16l	%g1,	%l6,	%o5
	fexpand	%f17,	%f0
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%i7
	andcc	%o3,	%g3,	%g2
	ba,a	%xcc,	loop_873
	nop
	set	0x10, %g6
	ldx	[%l7 + %g6],	%o1
	fmovda	%xcc,	%f12,	%f22
	array8	%l3,	%g6,	%i6
loop_873:
	tvs	%xcc,	0x4
	nop
	set	0x70, %g7
	std	%f20,	[%l7 + %g7]
	fmovscc	%icc,	%f6,	%f20
	movge	%icc,	%i0,	%g5
	edge32	%i5,	%i2,	%g7
	tpos	%icc,	0x3
	movrne	%g4,	0x056,	%o7
	tsubcctv	%o4,	%l5,	%i1
	fmul8ulx16	%f0,	%f6,	%f10
	ldx	[%l7 + 0x78],	%i3
	fpack32	%f16,	%f20,	%f30
	fmovsle	%icc,	%f3,	%f13
	tvc	%xcc,	0x0
	fbne	%fcc2,	loop_874
	sra	%l2,	0x15,	%l4
	array32	%o2,	%i4,	%o0
	set	0x3A, %l0
	lduba	[%l7 + %l0] 0x18,	%o6
loop_874:
	tsubcctv	%l1,	%g1,	%l6
	mulscc	%l0,	0x0BCB,	%i7
	edge8ln	%o3,	%g3,	%g2
	fbule,a	%fcc3,	loop_875
	tleu	%icc,	0x2
	sll	%o1,	0x12,	%l3
	tneg	%xcc,	0x1
loop_875:
	edge32l	%g6,	%i6,	%o5
	fmovsleu	%xcc,	%f8,	%f25
	tn	%xcc,	0x5
	mulx	%i0,	%g5,	%i5
	tle	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x38] %asi,	%i2
	fmovscc	%icc,	%f30,	%f19
	sllx	%g7,	0x03,	%o7
	movne	%xcc,	%g4,	%o4
	sdivx	%l5,	0x1538,	%i1
	movrgz	%l2,	0x1EC,	%l4
	srlx	%o2,	0x06,	%i4
	nop
	setx	loop_876,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot2	%f22,	%f10,	%f2
	edge16l	%i3,	%o0,	%o6
	movl	%xcc,	%g1,	%l1
loop_876:
	tn	%xcc,	0x1
	set	0x56, %i2
	stha	%l6,	[%l7 + %i2] 0xe2
	membar	#Sync
	sub	%i7,	%l0,	%g3
	sdiv	%o3,	0x089B,	%g2
	edge8	%o1,	%g6,	%i6
	edge16ln	%l3,	%o5,	%g5
	sub	%i5,	0x0BC3,	%i0
	wr	%g0,	0x10,	%asi
	stwa	%g7,	[%l7 + 0x40] %asi
	sir	0x13A3
	bneg,a,pt	%xcc,	loop_877
	movgu	%icc,	%o7,	%g4
	edge32ln	%i2,	%l5,	%o4
	ldstub	[%l7 + 0x6F],	%i1
loop_877:
	tcs	%xcc,	0x5
	tsubcc	%l2,	%o2,	%l4
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x18] %asi,	%i4
	movne	%xcc,	%i3,	%o6
	fmovdcc	%icc,	%f23,	%f9
	sth	%o0,	[%l7 + 0x50]
	movl	%xcc,	%g1,	%l1
	nop
	setx	loop_878,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%l6,	0x1580,	%i7
	fmovdpos	%xcc,	%f6,	%f26
	membar	0x03
loop_878:
	addc	%g3,	0x0CC8,	%o3
	tn	%icc,	0x1
	taddcctv	%g2,	%l0,	%g6
	wr	%g0,	0x89,	%asi
	stxa	%o1,	[%l7 + 0x18] %asi
	move	%xcc,	%l3,	%o5
	sub	%g5,	%i6,	%i5
	fcmpne16	%f8,	%f2,	%i0
	fbe	%fcc3,	loop_879
	movl	%xcc,	%o7,	%g7
	edge16n	%g4,	%i2,	%l5
	mulscc	%i1,	%o4,	%o2
loop_879:
	ble,a,pt	%xcc,	loop_880
	fblg	%fcc3,	loop_881
	sdivx	%l4,	0x0D45,	%l2
	array16	%i4,	%o6,	%o0
loop_880:
	nop
	setx	0x0C5F14421FB996AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x8FC424474F56F10A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f2,	%f4
loop_881:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x81,	%g1,	%i3
	fpack16	%f24,	%f21
	taddcc	%l6,	%i7,	%g3
	array32	%l1,	%o3,	%g2
	fbe	%fcc3,	loop_882
	fmovs	%f19,	%f8
	edge32	%l0,	%o1,	%l3
	movleu	%xcc,	%o5,	%g5
loop_882:
	fexpand	%f6,	%f12
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x88
	fbule	%fcc1,	loop_883
	ba,a	%xcc,	loop_884
	ldd	[%l7 + 0x58],	%g6
	fcmpne16	%f16,	%f4,	%i5
loop_883:
	orcc	%i0,	%i6,	%g7
loop_884:
	movrlz	%o7,	%g4,	%l5
	array32	%i2,	%o4,	%o2
	addc	%i1,	0x0B98,	%l4
	movrne	%i4,	0x032,	%o6
	udiv	%l2,	0x0959,	%o0
	movleu	%xcc,	%g1,	%i3
	ta	%xcc,	0x5
	andn	%l6,	0x0B3F,	%i7
	edge16ln	%l1,	%o3,	%g3
	sll	%l0,	0x17,	%g2
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x15
	set	0x78, %l3
	ldxa	[%l7 + %l3] 0x81,	%o1
	fmovsvs	%icc,	%f25,	%f21
	bvc,a,pn	%xcc,	loop_885
	ldx	[%l7 + 0x58],	%l3
	bne,a,pn	%xcc,	loop_886
	tvs	%icc,	0x1
loop_885:
	nop
	set	0x32, %o3
	ldsba	[%l7 + %o3] 0x80,	%o5
loop_886:
	tg	%icc,	0x7
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x19
	nop
	setx	0xB71CCCFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x3A9AE097,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f12,	%f27
	edge32	%g5,	%g6,	%i5
	fzeros	%f27
	fblg	%fcc3,	loop_887
	tgu	%icc,	0x3
	tl	%icc,	0x6
	movn	%xcc,	%i0,	%i6
loop_887:
	brgez	%g7,	loop_888
	fbul,a	%fcc0,	loop_889
	fbo,a	%fcc0,	loop_890
	edge16n	%o7,	%g4,	%l5
loop_888:
	tpos	%xcc,	0x4
loop_889:
	edge16l	%i2,	%o4,	%o2
loop_890:
	movre	%l4,	0x0C3,	%i4
	movleu	%icc,	%i1,	%o6
	fmovsn	%icc,	%f16,	%f27
	movcs	%icc,	%l2,	%g1
	fsrc2s	%f28,	%f30
	fnot1	%f10,	%f28
	brz	%i3,	loop_891
	fone	%f30
	tsubcctv	%l6,	%o0,	%l1
	tcs	%xcc,	0x7
loop_891:
	nop
	set	0x2E, %o5
	ldsba	[%l7 + %o5] 0x10,	%o3
	tleu	%icc,	0x2
	fzeros	%f25
	movleu	%icc,	%g3,	%l0
	te	%icc,	0x3
	edge32l	%i7,	%g2,	%l3
	fbn,a	%fcc2,	loop_892
	fbge	%fcc0,	loop_893
	sra	%o5,	%o1,	%g5
	fmovrsgez	%i5,	%f11,	%f29
loop_892:
	andcc	%g6,	0x090A,	%i6
loop_893:
	movneg	%icc,	%g7,	%o7
	fbo	%fcc1,	loop_894
	array32	%i0,	%l5,	%g4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x65] %asi,	%i2
loop_894:
	edge16	%o4,	%l4,	%i4
	fornot1	%f14,	%f28,	%f6
	fbug,a	%fcc3,	loop_895
	fornot1s	%f27,	%f1,	%f16
	fbug	%fcc0,	loop_896
	mulx	%i1,	0x05D2,	%o6
loop_895:
	nop
	set	0x20, %g1
	ldswa	[%l7 + %g1] 0x14,	%o2
loop_896:
	fnot1s	%f25,	%f24
	fmovsne	%xcc,	%f2,	%f5
	fzero	%f18
	xorcc	%l2,	%g1,	%l6
	fbge,a	%fcc0,	loop_897
	prefetch	[%l7 + 0x48],	 0x1
	movneg	%icc,	%i3,	%l1
	edge32	%o3,	%g3,	%o0
loop_897:
	nop
	setx loop_898, %l0, %l1
	jmpl %l1, %i7
	popc	0x0D95,	%l0
	fsrc2s	%f11,	%f27
	fmovsleu	%xcc,	%f7,	%f27
loop_898:
	popc	%l3,	%g2
	xnorcc	%o5,	%o1,	%g5
	fpmerge	%f31,	%f11,	%f12
	sethi	0x1C0E,	%i5
	movg	%xcc,	%i6,	%g7
	fbuge,a	%fcc3,	loop_899
	fmovsleu	%icc,	%f5,	%f9
	movge	%xcc,	%g6,	%o7
	sethi	0x01B4,	%i0
loop_899:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l5,	%g4
	movrlez	%o4,	0x227,	%l4
	tpos	%icc,	0x7
	brlez	%i2,	loop_900
	tcs	%icc,	0x4
	fmul8x16au	%f5,	%f15,	%f14
	umulcc	%i4,	0x17DB,	%o6
loop_900:
	fsrc1s	%f8,	%f4
	fmovdne	%xcc,	%f1,	%f7
	fand	%f8,	%f26,	%f4
	movle	%xcc,	%i1,	%l2
	movpos	%xcc,	%g1,	%o2
	movpos	%xcc,	%i3,	%l1
	tne	%xcc,	0x1
	nop
	setx	0x12400D34,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x600DFAD9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f7,	%f30
	brgez,a	%l6,	loop_901
	fmovdg	%icc,	%f20,	%f22
	fnegd	%f10,	%f8
	array8	%g3,	%o3,	%o0
loop_901:
	nop
	fitos	%f11,	%f26
	fstoi	%f26,	%f20
	tcc	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	stwa	%i7,	[%l7 + 0x64] %asi
	fba	%fcc2,	loop_902
	fmovda	%xcc,	%f20,	%f20
	tsubcc	%l3,	0x1A2F,	%g2
	fpackfix	%f20,	%f24
loop_902:
	fbule	%fcc3,	loop_903
	edge32	%l0,	%o5,	%g5
	edge16	%i5,	%i6,	%o1
	te	%xcc,	0x7
loop_903:
	fbule	%fcc3,	loop_904
	movne	%xcc,	%g7,	%o7
	movrlz	%i0,	0x0AC,	%g6
	tle	%icc,	0x6
loop_904:
	fmovspos	%xcc,	%f14,	%f12
	sub	%g4,	%l5,	%l4
	orcc	%o4,	%i4,	%o6
	tgu	%icc,	0x2
	subccc	%i1,	%i2,	%g1
	fnot1s	%f11,	%f6
	edge32	%o2,	%i3,	%l2
	tle	%icc,	0x1
	fxor	%f8,	%f10,	%f26
	nop
	setx	0x2F6A0E5D05E495D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x301AD6F19FB06FD8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f14,	%f12
	fbl	%fcc1,	loop_905
	addc	%l1,	%l6,	%g3
	edge32	%o3,	%i7,	%l3
	fblg,a	%fcc3,	loop_906
loop_905:
	sethi	0x01A4,	%g2
	edge32l	%l0,	%o0,	%g5
	srl	%i5,	0x02,	%o5
loop_906:
	ldd	[%l7 + 0x50],	%i6
	edge16	%o1,	%o7,	%i0
	fmovrse	%g7,	%f10,	%f27
	sdivx	%g4,	0x07A8,	%l5
	be,a,pn	%icc,	loop_907
	alignaddrl	%g6,	%o4,	%l4
	bge,a,pt	%icc,	loop_908
	edge32n	%o6,	%i1,	%i2
loop_907:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x6
loop_908:
	edge16l	%i4,	%o2,	%g1
	fmovdcc	%icc,	%f11,	%f28
	orcc	%i3,	0x1B5A,	%l1
	movn	%icc,	%l2,	%l6
	nop
	fitod	%f2,	%f20
	fdtos	%f20,	%f25
	edge32	%o3,	%i7,	%l3
	addccc	%g2,	0x07A9,	%g3
	brlz	%o0,	loop_909
	fornot1s	%f14,	%f11,	%f16
	sdivx	%l0,	0x0312,	%g5
	addccc	%i5,	%i6,	%o1
loop_909:
	fbule	%fcc2,	loop_910
	nop
	fitos	%f12,	%f17
	fstox	%f17,	%f24
	fxtos	%f24,	%f29
	brgz	%o7,	loop_911
	for	%f18,	%f10,	%f28
loop_910:
	movrlz	%o5,	0x3F2,	%i0
	fmovsle	%icc,	%f7,	%f18
loop_911:
	tl	%icc,	0x3
	movn	%xcc,	%g7,	%l5
	edge16ln	%g4,	%g6,	%o4
	umul	%o6,	0x158D,	%l4
	popc	%i2,	%i4
	fandnot2s	%f18,	%f23,	%f22
	add	%i1,	%o2,	%g1
	subcc	%i3,	%l1,	%l6
	edge8	%o3,	%l2,	%l3
	ble	loop_912
	fmovdl	%icc,	%f25,	%f10
	movre	%g2,	0x39D,	%i7
	movre	%g3,	0x198,	%o0
loop_912:
	prefetch	[%l7 + 0x6C],	 0x0
	nop
	setx	0xF3D325011CE404F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x8E6C53C7EF91A193,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f12,	%f18
	sra	%l0,	%i5,	%g5
	brz	%o1,	loop_913
	te	%icc,	0x6
	fmovsa	%xcc,	%f25,	%f16
	edge32	%i6,	%o5,	%o7
loop_913:
	xnorcc	%g7,	%i0,	%g4
	fandnot1	%f14,	%f18,	%f16
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
	addc	%g6,	0x0882,	%o4
	movne	%icc,	%o6,	%l4
	array32	%i2,	%i1,	%o2
	fpmerge	%f19,	%f30,	%f18
	nop
	setx loop_914, %l0, %l1
	jmpl %l1, %i4
	tsubcctv	%g1,	%i3,	%l1
	tne	%icc,	0x1
	sdiv	%l6,	0x0FED,	%o3
loop_914:
	taddcctv	%l2,	0x1583,	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l3,	%g3
	umulcc	%o0,	%l0,	%i5
	fmovs	%f6,	%f1
	bge	%xcc,	loop_915
	xorcc	%i7,	0x18AD,	%o1
	array16	%i6,	%g5,	%o5
	fblg,a	%fcc1,	loop_916
loop_915:
	nop
	setx	loop_917,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%g7,	%o7,	%g4
	tcs	%icc,	0x5
loop_916:
	orn	%i0,	%g6,	%o4
loop_917:
	movrgez	%o6,	0x23E,	%l4
	fbul,a	%fcc1,	loop_918
	sdivx	%l5,	0x05CE,	%i2
	sra	%o2,	0x0D,	%i1
	membar	0x03
loop_918:
	fmovdge	%xcc,	%f3,	%f6
	fsrc2	%f26,	%f30
	fbl,a	%fcc3,	loop_919
	fnot2s	%f22,	%f17
	ldsb	[%l7 + 0x5F],	%i4
	movrgez	%i3,	0x092,	%g1
loop_919:
	bleu	loop_920
	sra	%l1,	%l6,	%o3
	taddcctv	%l2,	0x03A1,	%l3
	fbule	%fcc0,	loop_921
loop_920:
	edge16	%g2,	%o0,	%l0
	movle	%xcc,	%i5,	%i7
	set	0x28, %g3
	stwa	%o1,	[%l7 + %g3] 0xea
	membar	#Sync
loop_921:
	taddcctv	%i6,	0x049E,	%g3
	orn	%g5,	0x11B7,	%o5
	tl	%xcc,	0x6
	movcc	%xcc,	%o7,	%g4
	array16	%i0,	%g7,	%g6
	edge16n	%o6,	%o4,	%l4
	tg	%xcc,	0x0
	bpos,a	%xcc,	loop_922
	subc	%i2,	0x0307,	%o2
	edge32l	%l5,	%i4,	%i3
	tsubcc	%g1,	0x05E3,	%i1
loop_922:
	sub	%l6,	%l1,	%l2
	movrlz	%l3,	%g2,	%o0
	addccc	%o3,	0x0CF3,	%l0
	srax	%i7,	%o1,	%i6
	call	loop_923
	fmovrdlez	%g3,	%f28,	%f10
	fmovdvs	%xcc,	%f12,	%f20
	tcs	%icc,	0x4
loop_923:
	edge16l	%g5,	%o5,	%o7
	sllx	%i5,	%g4,	%g7
	mulx	%g6,	0x012D,	%o6
	taddcc	%i0,	%l4,	%i2
	movre	%o4,	0x3A1,	%o2
	movre	%i4,	%i3,	%g1
	fblg	%fcc1,	loop_924
	movrlz	%i1,	0x3A8,	%l6
	fmovsle	%xcc,	%f21,	%f3
	edge32	%l5,	%l2,	%l1
loop_924:
	tgu	%icc,	0x1
	tneg	%icc,	0x6
	tl	%xcc,	0x4
	fpadd16s	%f31,	%f28,	%f24
	xnorcc	%g2,	0x07C0,	%l3
	xor	%o0,	0x1E59,	%o3
	tcs	%icc,	0x0
	fmul8sux16	%f14,	%f8,	%f4
	orn	%i7,	%l0,	%i6
	andncc	%g3,	%g5,	%o1
	fmovsne	%xcc,	%f1,	%f14
	movrgz	%o7,	0x0C0,	%i5
	fmovdge	%xcc,	%f7,	%f26
	fbuge	%fcc3,	loop_925
	xor	%o5,	%g4,	%g7
	xnorcc	%g6,	0x03F5,	%o6
	fmovsne	%icc,	%f31,	%f10
loop_925:
	andncc	%i0,	%i2,	%o4
	udivx	%o2,	0x09C1,	%l4
	fmovsge	%icc,	%f9,	%f25
	fornot1s	%f13,	%f23,	%f6
	udivcc	%i4,	0x0520,	%g1
	tle	%xcc,	0x6
	tsubcctv	%i1,	%l6,	%l5
	sir	0x06F3
	fmovdne	%xcc,	%f28,	%f10
	ldsw	[%l7 + 0x4C],	%i3
	fpack32	%f16,	%f14,	%f2
	umul	%l1,	0x1585,	%g2
	addc	%l2,	%l3,	%o3
	popc	%o0,	%i7
	brnz,a	%i6,	loop_926
	fpadd32s	%f1,	%f13,	%f4
	fbge,a	%fcc3,	loop_927
	sra	%g3,	%l0,	%g5
loop_926:
	tn	%icc,	0x2
	fornot2	%f28,	%f10,	%f18
loop_927:
	smul	%o1,	%i5,	%o7
	smulcc	%g4,	0x1B00,	%o5
	andn	%g6,	0x1C74,	%g7
	edge16ln	%o6,	%i2,	%o4
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x60] %asi,	%i0
	tneg	%icc,	0x4
	addc	%o2,	0x004D,	%i4
	fmovdgu	%icc,	%f2,	%f13
	nop
	setx	0xEBB50B8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f29
	wr	%g0,	0x80,	%asi
	stxa	%g1,	[%l7 + 0x20] %asi
	fmovrsgz	%i1,	%f14,	%f11
	tsubcc	%l6,	0x052E,	%l5
	stbar
	mulscc	%l4,	%i3,	%l1
	array8	%l2,	%g2,	%o3
	ldub	[%l7 + 0x4F],	%l3
	lduh	[%l7 + 0x28],	%o0
	fsrc1	%f16,	%f22
	movne	%icc,	%i6,	%g3
	fmovsvc	%icc,	%f11,	%f16
	edge8ln	%l0,	%g5,	%o1
	smulcc	%i5,	%i7,	%o7
	fbue,a	%fcc0,	loop_928
	addccc	%o5,	%g6,	%g4
	edge16l	%g7,	%o6,	%i2
	ldx	[%l7 + 0x28],	%o4
loop_928:
	alignaddrl	%o2,	%i4,	%g1
	edge8	%i1,	%l6,	%i0
	addccc	%l5,	%l4,	%i3
	movgu	%icc,	%l2,	%g2
	subccc	%l1,	%l3,	%o3
	set	0x2A, %i7
	stha	%o0,	[%l7 + %i7] 0x22
	membar	#Sync
	flush	%l7 + 0x60
	alignaddr	%i6,	%g3,	%g5
	fmovscc	%icc,	%f25,	%f7
	sethi	0x0E1F,	%o1
	fmul8ulx16	%f8,	%f26,	%f4
	xnor	%l0,	%i5,	%o7
	popc	%o5,	%g6
	fnegd	%f18,	%f20
	srl	%g4,	%i7,	%g7
	tsubcc	%i2,	0x1C7F,	%o4
	edge8l	%o2,	%i4,	%o6
	fmovdneg	%xcc,	%f11,	%f2
	movg	%icc,	%i1,	%l6
	fbge,a	%fcc3,	loop_929
	ldub	[%l7 + 0x41],	%g1
	andn	%i0,	%l5,	%l4
	sethi	0x0F9E,	%i3
loop_929:
	movne	%icc,	%g2,	%l1
	and	%l3,	%o3,	%o0
	srlx	%i6,	%l2,	%g5
	fmovrdlz	%g3,	%f24,	%f14
	tvc	%xcc,	0x7
	movre	%l0,	%o1,	%i5
	fbe	%fcc2,	loop_930
	te	%icc,	0x0
	edge16ln	%o7,	%o5,	%g4
	tcs	%xcc,	0x4
loop_930:
	movvs	%xcc,	%g6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i7,	0x184B,	%o4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i2,	%i4
	ldsb	[%l7 + 0x17],	%o2
	edge16ln	%i1,	%l6,	%o6
	nop
	set	0x79, %o1
	stb	%i0,	[%l7 + %o1]
	fmovsge	%xcc,	%f19,	%f14
	smulcc	%l5,	%l4,	%i3
	movcc	%icc,	%g1,	%g2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l3
	tpos	%xcc,	0x7
	ta	%xcc,	0x0
	bgu	loop_931
	array8	%o3,	%o0,	%i6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%l1
loop_931:
	array32	%g5,	%g3,	%l0
	fbne	%fcc0,	loop_932
	movn	%xcc,	%o1,	%l2
	tsubcctv	%i5,	%o7,	%g4
	bcs,a,pt	%icc,	loop_933
loop_932:
	addcc	%g6,	0x1E4A,	%g7
	fmovsne	%icc,	%f3,	%f22
	movneg	%icc,	%o5,	%i7
loop_933:
	bne,a	loop_934
	tge	%xcc,	0x3
	movne	%icc,	%i2,	%i4
	fbuge,a	%fcc2,	loop_935
loop_934:
	movpos	%icc,	%o2,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l6,	0x11FF,	%o6
loop_935:
	mulx	%i1,	0x081C,	%i0
	edge8	%l5,	%i3,	%l4
	brlz,a	%g2,	loop_936
	fmuld8sux16	%f10,	%f8,	%f26
	tcs	%icc,	0x6
	brnz	%g1,	loop_937
loop_936:
	stw	%o3,	[%l7 + 0x58]
	orn	%o0,	%l3,	%i6
	srax	%g5,	%g3,	%l0
loop_937:
	andcc	%l1,	0x0192,	%o1
	fbug	%fcc1,	loop_938
	subcc	%l2,	0x07FC,	%o7
	fnands	%f15,	%f0,	%f10
	nop
	setx	loop_939,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_938:
	array16	%g4,	%g6,	%i5
	pdist	%f20,	%f18,	%f30
	fbule,a	%fcc3,	loop_940
loop_939:
	bne,pn	%icc,	loop_941
	tn	%xcc,	0x4
	bpos,a,pn	%xcc,	loop_942
loop_940:
	ldx	[%l7 + 0x10],	%o5
loop_941:
	alignaddrl	%i7,	%g7,	%i2
	nop
	setx	0x6644BE95,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x435AF067,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f7,	%f15
loop_942:
	nop
	set	0x3E, %l4
	lduha	[%l7 + %l4] 0x10,	%i4
	movrgez	%o2,	%l6,	%o4
	add	%i1,	%o6,	%i0
	ldd	[%l7 + 0x20],	%l4
	sllx	%i3,	%g2,	%l4
	swap	[%l7 + 0x6C],	%o3
	wr	%g0,	0x11,	%asi
	stwa	%g1,	[%l7 + 0x58] %asi
	tle	%icc,	0x7
	and	%o0,	0x1B94,	%l3
	addc	%g5,	%g3,	%i6
	udivcc	%l1,	0x064F,	%o1
	wr	%g0,	0x81,	%asi
	stba	%l0,	[%l7 + 0x5A] %asi
	edge16n	%l2,	%o7,	%g4
	mova	%icc,	%g6,	%i5
	tg	%xcc,	0x2
	andncc	%i7,	%o5,	%g7
	bneg	loop_943
	lduw	[%l7 + 0x68],	%i2
	bge	loop_944
	sth	%o2,	[%l7 + 0x1A]
loop_943:
	tneg	%icc,	0x1
	orncc	%l6,	0x1AB7,	%i4
loop_944:
	tsubcctv	%i1,	%o4,	%i0
	andn	%l5,	0x147B,	%i3
	tvs	%icc,	0x6
	fblg	%fcc3,	loop_945
	andncc	%o6,	%l4,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_946,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_945:
	andcc	%g1,	0x1421,	%o0
	fnand	%f16,	%f14,	%f18
	xnor	%g2,	0x1C4D,	%l3
loop_946:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7E] %asi,	%g3
	std	%f20,	[%l7 + 0x08]
	ldsh	[%l7 + 0x26],	%i6
	sllx	%g5,	0x19,	%o1
	movpos	%xcc,	%l0,	%l1
	subcc	%l2,	%g4,	%o7
	add	%i5,	0x1590,	%g6
	subc	%o5,	%g7,	%i2
	brnz	%i7,	loop_947
	subc	%o2,	0x05ED,	%l6
	ldd	[%l7 + 0x50],	%i0
	smulcc	%i4,	%o4,	%l5
loop_947:
	movvs	%xcc,	%i0,	%i3
	nop
	set	0x38, %g5
	stx	%l4,	[%l7 + %g5]
	fmovsge	%xcc,	%f26,	%f7
	fexpand	%f26,	%f8
	movle	%icc,	%o3,	%o6
	edge16n	%o0,	%g2,	%g1
	fbg	%fcc1,	loop_948
	movle	%icc,	%g3,	%i6
	tn	%icc,	0x3
	xnor	%g5,	0x0B10,	%o1
loop_948:
	taddcc	%l3,	0x1C01,	%l0
	tcs	%icc,	0x6
	and	%l2,	%g4,	%l1
	sra	%o7,	%i5,	%g6
	mulx	%o5,	%i2,	%i7
	tle	%icc,	0x7
	ble,a,pn	%xcc,	loop_949
	edge8l	%g7,	%l6,	%i1
	srax	%o2,	0x12,	%o4
	fbo,a	%fcc2,	loop_950
loop_949:
	fmovsg	%xcc,	%f1,	%f13
	umulcc	%l5,	%i4,	%i3
	fpmerge	%f11,	%f2,	%f26
loop_950:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3b8] %asi,	%l4 ripped by fixASI40.pl ripped by fixASI40.pl
	sth	%i0,	[%l7 + 0x14]
	bcc,a	loop_951
	fnot1	%f20,	%f20
	ble,pn	%icc,	loop_952
	taddcctv	%o3,	0x17DF,	%o0
loop_951:
	subc	%o6,	%g2,	%g1
	fmovscs	%xcc,	%f7,	%f24
loop_952:
	fone	%f10
	stw	%i6,	[%l7 + 0x70]
	edge8	%g3,	%g5,	%l3
	fmovdvs	%icc,	%f9,	%f8
	movl	%xcc,	%l0,	%l2
	fmovsg	%xcc,	%f13,	%f18
	subccc	%g4,	0x1C93,	%l1
	tsubcctv	%o1,	%i5,	%o7
	fble	%fcc2,	loop_953
	edge8	%g6,	%o5,	%i7
	mova	%xcc,	%i2,	%g7
	udivx	%l6,	0x01AB,	%o2
loop_953:
	fmul8x16au	%f0,	%f17,	%f22
	edge16ln	%i1,	%o4,	%l5
	fbule	%fcc3,	loop_954
	fmovdcs	%icc,	%f29,	%f27
	and	%i4,	%l4,	%i3
	addc	%o3,	0x0C2C,	%i0
loop_954:
	fmul8x16	%f12,	%f0,	%f22
	st	%f29,	[%l7 + 0x48]
	stx	%o0,	[%l7 + 0x50]
	stw	%g2,	[%l7 + 0x18]
	bneg,a	%icc,	loop_955
	sdivcc	%o6,	0x0FB6,	%g1
	sdiv	%g3,	0x1A72,	%g5
	movrlez	%i6,	%l0,	%l3
loop_955:
	fxnors	%f28,	%f2,	%f23
	fble	%fcc2,	loop_956
	umul	%l2,	0x0C06,	%l1
	array8	%g4,	%o1,	%i5
	fmovrsgz	%g6,	%f12,	%f10
loop_956:
	sethi	0x0344,	%o7
	fornot1	%f16,	%f16,	%f8
	fpackfix	%f4,	%f18
	andn	%o5,	0x142A,	%i7
	sir	0x063C
	bpos	%icc,	loop_957
	movrlez	%i2,	0x1C5,	%l6
	udiv	%g7,	0x1D11,	%o2
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%o4
loop_957:
	nop
	setx	0x206F2496,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x2
	fmovsvc	%xcc,	%f14,	%f15
	or	%i4,	%l5,	%l4
	fmovdn	%xcc,	%f26,	%f29
	fbne	%fcc1,	loop_958
	edge32n	%i3,	%o3,	%i0
	bg,a	%xcc,	loop_959
	fpadd16s	%f21,	%f15,	%f13
loop_958:
	fmuld8ulx16	%f0,	%f6,	%f2
	sir	0x1DED
loop_959:
	tpos	%xcc,	0x6
	fnot2s	%f24,	%f4
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f4
	fxtos	%f4,	%f18
	bn,a	loop_960
	movgu	%icc,	%g2,	%o0
	ldub	[%l7 + 0x1A],	%g1
	movpos	%icc,	%o6,	%g3
loop_960:
	movvs	%icc,	%i6,	%l0
	stb	%l3,	[%l7 + 0x79]
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x44] %asi,	%l2
	xor	%l1,	%g5,	%o1
	subc	%g4,	%g6,	%o7
	stbar
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
	ldd	[%l7 + 0x60],	%f0
	edge16n	%o5,	%i2,	%i7
	addc	%g7,	%o2,	%i1
	xnor	%o4,	%l6,	%i4
	bne,pt	%xcc,	loop_961
	array32	%l5,	%i3,	%o3
	fbge	%fcc3,	loop_962
	movre	%i0,	%g2,	%o0
loop_961:
	fand	%f26,	%f18,	%f14
	taddcc	%l4,	0x0111,	%g1
loop_962:
	flush	%l7 + 0x54
	sra	%g3,	%i6,	%l0
	set	0x310, %i1
	nop 	! 	nop 	! 	ldxa	[%g0 + %i1] 0x40,	%l3 ripped by fixASI40.pl ripped by fixASI40.pl
	fbg,a	%fcc1,	loop_963
	edge16	%o6,	%l2,	%l1
	xnorcc	%g5,	%o1,	%g4
	te	%xcc,	0x6
loop_963:
	nop
	setx	0x6869C1AB2BA7413C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xEB6D821A48DFBBBE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f8,	%f0
	movn	%xcc,	%o7,	%g6
	fcmpgt16	%f20,	%f6,	%i5
	movrgez	%i2,	0x2A7,	%o5
	fbn,a	%fcc3,	loop_964
	xorcc	%i7,	%g7,	%o2
	umulcc	%i1,	0x0B57,	%l6
	fbul	%fcc1,	loop_965
loop_964:
	tl	%icc,	0x1
	nop
	setx	0xFA43ECD455F09451,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f24
	taddcc	%i4,	%o4,	%l5
loop_965:
	fble,a	%fcc1,	loop_966
	edge16	%o3,	%i0,	%g2
	fxnor	%f2,	%f18,	%f12
	movg	%icc,	%o0,	%i3
loop_966:
	udivx	%l4,	0x1B7E,	%g3
	fxnor	%f30,	%f16,	%f12
	fbn	%fcc1,	loop_967
	smulcc	%g1,	%l0,	%l3
	brlz	%o6,	loop_968
	fandnot1s	%f18,	%f2,	%f15
loop_967:
	movn	%icc,	%l2,	%i6
	xnorcc	%l1,	0x0554,	%g5
loop_968:
	nop
	setx	0xB7956063,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xEBAEFD6B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f9,	%f27
	nop
	setx	loop_969,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%o1,	%o7,	%g6
	sir	0x0C95
	te	%xcc,	0x0
loop_969:
	movcs	%xcc,	%g4,	%i2
	edge16ln	%o5,	%i5,	%i7
	edge32n	%o2,	%i1,	%g7
	brnz	%i4,	loop_970
	bne,a	loop_971
	fbl	%fcc1,	loop_972
	edge32l	%o4,	%l6,	%l5
loop_970:
	fabsd	%f20,	%f26
loop_971:
	movl	%xcc,	%o3,	%g2
loop_972:
	move	%xcc,	%o0,	%i3
	udivcc	%l4,	0x0F2F,	%g3
	fmovrdgez	%g1,	%f20,	%f22
	mulscc	%i0,	0x11F7,	%l0
	bpos	loop_973
	bne	loop_974
	fnegs	%f26,	%f14
	addcc	%o6,	%l3,	%l2
loop_973:
	nop
	set	0x64, %o6
	stw	%l1,	[%l7 + %o6]
loop_974:
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%g4
	nop
	setx	0xCCAD1C780A418A57,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x1941BC4E8CB2EBC9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f8,	%f20
	movgu	%xcc,	%o1,	%o7
	xor	%g6,	%g4,	%i6
	fcmpgt16	%f22,	%f10,	%i2
	flush	%l7 + 0x74
	fnot1s	%f26,	%f19
	fmovdvc	%icc,	%f20,	%f12
	tsubcc	%i5,	%i7,	%o2
	nop
	setx loop_975, %l0, %l1
	jmpl %l1, %o5
	tcc	%icc,	0x6
	or	%g7,	%i1,	%i4
	sdiv	%l6,	0x1DB2,	%l5
loop_975:
	andncc	%o3,	%g2,	%o0
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x43] %asi,	%i3
	add	%l4,	0x0DCC,	%g3
	nop
	setx	0xB17C07D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f31
	movrlz	%g1,	%o4,	%i0
	tvs	%icc,	0x6
	tsubcctv	%l0,	%l3,	%l2
	udiv	%o6,	0x0C72,	%g5
	fmovscc	%xcc,	%f7,	%f28
	fblg,a	%fcc0,	loop_976
	add	%o1,	0x126F,	%l1
	set	0x30, %o4
	ldda	[%l7 + %o4] 0x0c,	%o6
loop_976:
	ld	[%l7 + 0x0C],	%f29
	fnot1	%f16,	%f26
	edge16n	%g6,	%i6,	%g4
	xor	%i2,	0x173E,	%i5
	fpack32	%f20,	%f20,	%f14
	nop
	fitos	%f10,	%f29
	fstox	%f29,	%f0
	fxtos	%f0,	%f0
	membar	0x1D
	movn	%icc,	%o2,	%o5
	addcc	%i7,	0x02A5,	%i1
	ldub	[%l7 + 0x26],	%i4
	smulcc	%g7,	%l6,	%l5
	be	loop_977
	movrgez	%g2,	%o3,	%o0
	bcc,a	%icc,	loop_978
	subccc	%l4,	%i3,	%g1
loop_977:
	ldsh	[%l7 + 0x12],	%g3
	popc	0x0766,	%i0
loop_978:
	fpadd32	%f0,	%f6,	%f10
	srax	%l0,	%l3,	%o4
	edge16	%o6,	%g5,	%o1
	movrgz	%l2,	%o7,	%l1
	popc	0x11CE,	%i6
	movn	%xcc,	%g4,	%i2
	wr	%g0,	0x81,	%asi
	stwa	%i5,	[%l7 + 0x74] %asi
	edge16l	%g6,	%o2,	%o5
	fmovrdne	%i7,	%f18,	%f14
	sub	%i1,	0x1B34,	%g7
	movrgz	%i4,	0x17C,	%l6
	fpsub16	%f0,	%f2,	%f6
	or	%l5,	%o3,	%o0
	subcc	%g2,	0x1585,	%i3
	movne	%icc,	%l4,	%g3
	fands	%f2,	%f7,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f16,	%f11
	lduh	[%l7 + 0x36],	%i0
	movrne	%l0,	%l3,	%o4
	call	loop_979
	udivcc	%o6,	0x1F24,	%g5
	fmul8x16au	%f7,	%f25,	%f4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x0c,	%o1,	%g1
loop_979:
	taddcctv	%l2,	%l1,	%o7
	addc	%i6,	%g4,	%i2
	set	0x28, %l2
	swapa	[%l7 + %l2] 0x11,	%i5
	bgu	loop_980
	movrgz	%g6,	0x19D,	%o5
	tpos	%xcc,	0x6
	edge32l	%i7,	%o2,	%i1
loop_980:
	nop
	set	0x28, %o2
	ldswa	[%l7 + %o2] 0x10,	%i4
	fmovse	%xcc,	%f13,	%f17
	fbue	%fcc3,	loop_981
	sub	%l6,	0x0C2A,	%g7
	fbuge,a	%fcc3,	loop_982
	srlx	%o3,	%l5,	%g2
loop_981:
	edge32l	%i3,	%o0,	%l4
	movgu	%xcc,	%i0,	%l0
loop_982:
	mova	%xcc,	%g3,	%l3
	tcc	%xcc,	0x5
	mova	%icc,	%o4,	%g5
	movvs	%icc,	%o6,	%o1
	edge32n	%g1,	%l2,	%o7
	nop
	fitod	%f2,	%f20
	fdtos	%f20,	%f10
	fmovdl	%icc,	%f4,	%f10
	nop
	setx loop_983, %l0, %l1
	jmpl %l1, %l1
	tn	%icc,	0x1
	fmovsle	%icc,	%f11,	%f2
	movn	%icc,	%i6,	%g4
loop_983:
	brgez	%i2,	loop_984
	bg,a	%icc,	loop_985
	fpsub32s	%f17,	%f7,	%f16
	ldsw	[%l7 + 0x7C],	%g6
loop_984:
	xnorcc	%o5,	0x01DF,	%i5
loop_985:
	fmovsneg	%xcc,	%f11,	%f1
	smulcc	%o2,	0x00B4,	%i7
	xnor	%i1,	%i4,	%g7
	fpsub16	%f10,	%f4,	%f12
	tsubcc	%l6,	%o3,	%l5
	fbg	%fcc2,	loop_986
	edge32n	%g2,	%o0,	%i3
	brgez	%i0,	loop_987
	sllx	%l4,	%g3,	%l3
loop_986:
	nop
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l0,	%o4
loop_987:
	fmul8x16	%f28,	%f22,	%f10
	fmul8sux16	%f12,	%f26,	%f14
	ldub	[%l7 + 0x6F],	%g5
	bneg	%icc,	loop_988
	nop
	setx	0x6CABC148,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x47886835,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f10,	%f1
	movrgz	%o6,	0x2E9,	%g1
	fmovdg	%icc,	%f24,	%f14
loop_988:
	addcc	%l2,	%o1,	%o7
	orn	%l1,	%g4,	%i2
	movcs	%icc,	%i6,	%o5
	taddcctv	%g6,	%o2,	%i7
	ta	%xcc,	0x2
	alignaddrl	%i1,	%i4,	%i5
	set	0x59, %i5
	ldstuba	[%l7 + %i5] 0x0c,	%g7
	movcs	%icc,	%l6,	%o3
	tsubcc	%l5,	0x1877,	%o0
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	udiv	%g2,	0x1A2F,	%i3
	fmovdne	%xcc,	%f15,	%f2
	fbue,a	%fcc0,	loop_989
	tvc	%icc,	0x7
	orcc	%i0,	%l4,	%g3
	srlx	%l0,	%o4,	%l3
loop_989:
	fmovscs	%xcc,	%f11,	%f28
	edge32ln	%g5,	%o6,	%l2
	fbu,a	%fcc3,	loop_990
	edge32l	%o1,	%o7,	%l1
	tg	%xcc,	0x5
	fmovsa	%icc,	%f11,	%f4
loop_990:
	andn	%g4,	%g1,	%i6
	fmovscc	%xcc,	%f1,	%f22
	subccc	%i2,	0x10DC,	%g6
	edge32l	%o5,	%o2,	%i7
	fmovsneg	%icc,	%f5,	%f2
	edge16l	%i4,	%i5,	%i1
	fcmpgt16	%f12,	%f10,	%l6
	sll	%o3,	0x13,	%g7
	umul	%o0,	%g2,	%i3
	nop
	fitos	%f1,	%f10
	fstoi	%f10,	%f15
	tl	%xcc,	0x7
	set	0x52, %g2
	stha	%l5,	[%l7 + %g2] 0xe2
	membar	#Sync
	udivx	%i0,	0x0F40,	%l4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x5E] %asi,	%g3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x1A] %asi,	%l0
	edge32	%o4,	%g5,	%o6
	ldd	[%l7 + 0x30],	%l2
	edge8	%l3,	%o1,	%l1
	sll	%o7,	0x02,	%g1
	sll	%g4,	0x1A,	%i6
	udiv	%i2,	0x10EC,	%g6
	andncc	%o5,	%o2,	%i7
	swap	[%l7 + 0x08],	%i4
	andncc	%i5,	%i1,	%l6
	set	0x42, %i6
	stha	%o3,	[%l7 + %i6] 0x18
	nop
	setx	0xEF2558F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xD5D42622,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f4,	%f5
	movcs	%xcc,	%o0,	%g2
	tvs	%icc,	0x2
	addcc	%g7,	0x0987,	%l5
	lduw	[%l7 + 0x4C],	%i0
	brgez,a	%i3,	loop_991
	movrlz	%l4,	%l0,	%g3
	brlez,a	%o4,	loop_992
	fmovspos	%xcc,	%f27,	%f6
loop_991:
	fmovdne	%xcc,	%f18,	%f18
	tne	%xcc,	0x3
loop_992:
	orncc	%g5,	%o6,	%l3
	subc	%o1,	%l1,	%l2
	xorcc	%g1,	0x0E56,	%o7
	wr	%g0,	0x80,	%asi
	stha	%g4,	[%l7 + 0x08] %asi
	fandnot2s	%f23,	%f24,	%f26
	movre	%i6,	0x189,	%g6
	nop
	set	0x61, %o7
	ldstub	[%l7 + %o7],	%o5
	ldub	[%l7 + 0x54],	%i2
	fbule	%fcc3,	loop_993
	movvs	%xcc,	%o2,	%i4
	nop
	fitod	%f8,	%f0
	fdtos	%f0,	%f8
	fmovsle	%icc,	%f10,	%f2
loop_993:
	sdiv	%i5,	0x1BB3,	%i7
	umul	%i1,	%l6,	%o0
	movrgz	%o3,	0x2AF,	%g7
	smulcc	%g2,	%l5,	%i0
	edge32l	%i3,	%l0,	%l4
	sdiv	%o4,	0x00D5,	%g5
	fbug,a	%fcc0,	loop_994
	sll	%o6,	0x1C,	%l3
	srlx	%o1,	0x13,	%l1
	ta	%xcc,	0x4
loop_994:
	movge	%xcc,	%g3,	%g1
	mulscc	%l2,	0x1A31,	%o7
	set	0x34, %i4
	lduha	[%l7 + %i4] 0x0c,	%g4
	set	0x4E, %l5
	stha	%g6,	[%l7 + %l5] 0x11
	fmuld8ulx16	%f23,	%f26,	%f26
	tcc	%xcc,	0x3
	fmovdne	%xcc,	%f24,	%f19
	array8	%o5,	%i6,	%i2
	fzero	%f24
	nop
	setx	0x33C8326300480235,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fbo,a	%fcc2,	loop_995
	xnorcc	%i4,	%i5,	%o2
	movrgez	%i7,	0x207,	%l6
	addccc	%o0,	0x100C,	%o3
loop_995:
	for	%f2,	%f12,	%f10
	movrgez	%i1,	%g2,	%l5
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x120] %asi,	%g7 ripped by fixASI40.pl ripped by fixASI40.pl
	fcmpeq32	%f14,	%f28,	%i3
	movre	%l0,	%i0,	%l4
	and	%g5,	%o6,	%l3
	orcc	%o1,	%o4,	%g3
	edge16	%g1,	%l2,	%l1
	array32	%o7,	%g6,	%o5
	movvc	%xcc,	%i6,	%i2
	sub	%g4,	%i4,	%o2
	fbne,a	%fcc2,	loop_996
	movne	%xcc,	%i7,	%l6
	movvc	%xcc,	%o0,	%o3
	edge32l	%i1,	%i5,	%l5
loop_996:
	mulx	%g7,	%i3,	%l0
	tcs	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x14] %asi,	%i0
	nop
	fitod	%f11,	%f2
	ldsb	[%l7 + 0x58],	%l4
	mova	%icc,	%g2,	%g5
	tpos	%icc,	0x7
	fmovdle	%xcc,	%f24,	%f28
	taddcc	%l3,	0x13A3,	%o6
	mova	%xcc,	%o1,	%g3
	tne	%xcc,	0x3
	array32	%g1,	%l2,	%l1
	nop
	setx	0xF6B8025C88AD9A0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f30
	fnot1s	%f10,	%f7
	subcc	%o7,	0x1616,	%g6
	fmovrsgez	%o5,	%f15,	%f27
	fmovsleu	%icc,	%f31,	%f3
	xorcc	%i6,	0x0873,	%i2
	alignaddrl	%o4,	%g4,	%i4
	movre	%o2,	%i7,	%l6
	movgu	%xcc,	%o0,	%i1
	subc	%i5,	0x12D8,	%l5
	ldstub	[%l7 + 0x51],	%o3
	movcc	%icc,	%g7,	%i3
	edge8n	%i0,	%l4,	%g2
	subc	%l0,	0x050A,	%l3
	andncc	%g5,	%o6,	%g3
	for	%f26,	%f4,	%f22
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bpos,pt	%icc,	loop_997
	movrne	%g1,	%o1,	%l2
	nop
	setx	0x8AEC1E46305EF166,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f8
	fxtod	%f8,	%f2
loop_997:
	tneg	%icc,	0x7
	tvs	%xcc,	0x1
	fmovsl	%icc,	%f24,	%f11
	set	0x108, %o0
	ldxa	[%g0 + %o0] 0x52,	%l1
	tle	%xcc,	0x6
	bvc	loop_998
	movle	%xcc,	%g6,	%o7
	bneg,a,pn	%xcc,	loop_999
	lduh	[%l7 + 0x42],	%o5
loop_998:
	udivx	%i2,	0x15F2,	%o4
	fmovrsgz	%g4,	%f11,	%f13
loop_999:
	fmul8x16au	%f4,	%f11,	%f12
	orncc	%i4,	0x176E,	%i6
	edge16	%i7,	%l6,	%o2
	and	%i1,	%o0,	%l5
	fmovsge	%xcc,	%f19,	%f29
	edge16ln	%o3,	%i5,	%g7
	tcc	%icc,	0x0
	movvs	%icc,	%i3,	%l4
	edge8l	%i0,	%l0,	%l3
	tcc	%xcc,	0x6
	fbn	%fcc0,	loop_1000
	sdivx	%g5,	0x10C6,	%o6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g2,	%g3
loop_1000:
	fmovdge	%icc,	%f7,	%f17
	addcc	%o1,	%l2,	%g1
	fpsub32	%f28,	%f14,	%f6
	nop
	setx	0x46DF6A58,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x2D912301,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f30,	%f19
	tvc	%xcc,	0x4
	udivcc	%g6,	0x0216,	%l1
	bl,a,pn	%icc,	loop_1001
	movne	%xcc,	%o7,	%o5
	wr	%g0,	0x89,	%asi
	sta	%f2,	[%l7 + 0x10] %asi
loop_1001:
	nop
	fitos	%f8,	%f24
	fstoi	%f24,	%f28
	bne,a	%xcc,	loop_1002
	brlz,a	%o4,	loop_1003
	fcmpne16	%f14,	%f14,	%i2
	nop
	setx	0xF0B6E850943D04AE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xFE14293462F39223,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f22,	%f4
loop_1002:
	nop
	setx	0x1CC50F3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xC25BF869,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f15,	%f8
loop_1003:
	mulscc	%i4,	0x17BB,	%g4
	fmovse	%xcc,	%f13,	%f19
	brgz,a	%i6,	loop_1004
	orncc	%l6,	0x0A3B,	%i7
	fsrc2s	%f11,	%f23
	mova	%icc,	%i1,	%o2
loop_1004:
	ba,pt	%xcc,	loop_1005
	udiv	%l5,	0x0FAC,	%o3
	fmovs	%f19,	%f20
	edge8	%o0,	%g7,	%i3
loop_1005:
	alignaddrl	%l4,	%i5,	%l0
	and	%i0,	%g5,	%l3
	subccc	%g2,	0x08B7,	%o6
	add	%o1,	0x0E50,	%l2
	call	loop_1006
	alignaddr	%g3,	%g6,	%l1
	orcc	%o7,	0x11E8,	%g1
	fmuld8ulx16	%f23,	%f26,	%f24
loop_1006:
	or	%o4,	0x0FF7,	%o5
	movle	%icc,	%i2,	%g4
	fmovscc	%xcc,	%f2,	%f18
	orncc	%i4,	%l6,	%i7
	tne	%xcc,	0x5
	mova	%icc,	%i1,	%i6
	smulcc	%o2,	0x1E06,	%o3
	std	%f20,	[%l7 + 0x28]
	brgz,a	%o0,	loop_1007
	fmovdcc	%icc,	%f19,	%f23
	srl	%l5,	%g7,	%i3
	array32	%i5,	%l4,	%l0
loop_1007:
	fmovspos	%icc,	%f24,	%f28
	be,pt	%xcc,	loop_1008
	fmovspos	%xcc,	%f12,	%f20
	sethi	0x0656,	%i0
	edge8l	%l3,	%g2,	%g5
loop_1008:
	stw	%o1,	[%l7 + 0x4C]
	movre	%l2,	0x30E,	%o6
	movle	%icc,	%g6,	%g3
	fabss	%f18,	%f17
	edge32l	%o7,	%g1,	%o4
	nop
	setx	0x8857902293656D58,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f12
	swap	[%l7 + 0x48],	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%icc,	%f6,	%f17
	bneg,a,pt	%icc,	loop_1009
	edge8	%o5,	%i2,	%g4
	fpadd32	%f20,	%f26,	%f26
	bg,pn	%icc,	loop_1010
loop_1009:
	bge	loop_1011
	array16	%l6,	%i4,	%i7
	movvc	%xcc,	%i6,	%i1
loop_1010:
	movn	%icc,	%o2,	%o3
loop_1011:
	add	%o0,	%g7,	%l5
	fmovsleu	%icc,	%f14,	%f10
	alignaddr	%i5,	%l4,	%i3
	umulcc	%l0,	0x0CF8,	%i0
	tcs	%icc,	0x4
	fbl	%fcc3,	loop_1012
	umulcc	%l3,	%g5,	%g2
	membar	0x4C
	fpadd32s	%f12,	%f14,	%f1
loop_1012:
	srax	%o1,	%o6,	%l2
	movrne	%g3,	%g6,	%g1
	fbul,a	%fcc2,	loop_1013
	popc	0x16CF,	%o7
	move	%xcc,	%o4,	%l1
	smulcc	%i2,	%g4,	%o5
loop_1013:
	fmovrse	%i4,	%f28,	%f14
	movge	%icc,	%l6,	%i6
	prefetch	[%l7 + 0x4C],	 0x3
	move	%xcc,	%i7,	%o2
	sra	%o3,	%i1,	%o0
	edge32l	%g7,	%l5,	%l4
	movg	%xcc,	%i3,	%i5
	fbn,a	%fcc2,	loop_1014
	tvs	%icc,	0x6
	edge16	%i0,	%l0,	%l3
	wr	%g0,	0xe2,	%asi
	stba	%g2,	[%l7 + 0x41] %asi
	membar	#Sync
loop_1014:
	fbge,a	%fcc0,	loop_1015
	std	%f14,	[%l7 + 0x08]
	bcc	loop_1016
	array8	%g5,	%o6,	%o1
loop_1015:
	and	%l2,	%g6,	%g1
	lduh	[%l7 + 0x5A],	%g3
loop_1016:
	sll	%o4,	0x12,	%o7
	udiv	%i2,	0x1706,	%l1
	sdiv	%g4,	0x0400,	%o5
	fmovrslez	%l6,	%f18,	%f7
	smul	%i6,	0x06CA,	%i7
	fbe	%fcc2,	loop_1017
	tleu	%icc,	0x7
	sdivcc	%i4,	0x0A89,	%o2
	movg	%xcc,	%o3,	%i1
loop_1017:
	fmovsge	%xcc,	%f16,	%f6
	brlez	%o0,	loop_1018
	flush	%l7 + 0x08
	fcmpeq32	%f0,	%f16,	%l5
	xorcc	%l4,	0x043C,	%i3
loop_1018:
	sdivx	%g7,	0x00A7,	%i0
	nop
	set	0x10, %i3
	stx	%l0,	[%l7 + %i3]
	edge32n	%i5,	%g2,	%g5
	movvc	%xcc,	%l3,	%o1
	wr	%g0,	0xe2,	%asi
	stba	%o6,	[%l7 + 0x08] %asi
	membar	#Sync
	te	%xcc,	0x2
	bge,a	loop_1019
	fabss	%f25,	%f12
	andncc	%l2,	%g1,	%g6
	taddcctv	%o4,	%o7,	%g3
loop_1019:
	mulscc	%i2,	0x0DE0,	%g4
	udiv	%l1,	0x02B3,	%l6
	fmovdne	%icc,	%f5,	%f3
	fmul8ulx16	%f2,	%f24,	%f12
	fbl,a	%fcc2,	loop_1020
	fbge	%fcc2,	loop_1021
	bvs,a	%xcc,	loop_1022
	brlz	%i6,	loop_1023
loop_1020:
	movvs	%xcc,	%i7,	%i4
loop_1021:
	add	%o5,	0x1B8E,	%o2
loop_1022:
	andn	%i1,	%o0,	%o3
loop_1023:
	smul	%l4,	%l5,	%i3
	udiv	%i0,	0x0CF3,	%g7
	tge	%xcc,	0x0
	xor	%i5,	0x0AC9,	%l0
	fxnor	%f20,	%f0,	%f10
	array32	%g2,	%l3,	%o1
	fpackfix	%f26,	%f2
	subcc	%g5,	0x15BC,	%l2
	fcmpeq32	%f8,	%f14,	%o6
	edge32ln	%g6,	%g1,	%o4
	sir	0x0AF5
	fmovdge	%xcc,	%f28,	%f3
	fmovrsgz	%g3,	%f19,	%f3
	sll	%i2,	0x0B,	%o7
	bg,a	%icc,	loop_1024
	xorcc	%g4,	%l6,	%i6
	umulcc	%l1,	%i4,	%o5
	fmovrsne	%i7,	%f24,	%f10
loop_1024:
	nop
	set	0x20, %g6
	lduwa	[%l7 + %g6] 0x0c,	%i1
	fands	%f21,	%f17,	%f8
	nop
	fitos	%f8,	%f27
	fstoi	%f27,	%f17
	fmovsle	%icc,	%f29,	%f8
	set	0x50, %l0
	lda	[%l7 + %l0] 0x10,	%f7
	fbl	%fcc2,	loop_1025
	edge16l	%o2,	%o3,	%o0
	bge,pn	%xcc,	loop_1026
	smulcc	%l5,	0x0DCB,	%l4
loop_1025:
	fmovdvc	%xcc,	%f8,	%f9
	edge32	%i3,	%i0,	%g7
loop_1026:
	sdivcc	%i5,	0x14DA,	%l0
	swap	[%l7 + 0x70],	%g2
	fmovsleu	%icc,	%f23,	%f29
	fsrc2s	%f8,	%f19
	set	0x34, %g7
	swapa	[%l7 + %g7] 0x89,	%o1
	ldd	[%l7 + 0x40],	%f22
	movleu	%xcc,	%l3,	%g5
	bvc,a	%xcc,	loop_1027
	mulscc	%l2,	0x03C7,	%o6
	std	%f6,	[%l7 + 0x18]
	ldx	[%l7 + 0x30],	%g1
loop_1027:
	st	%f11,	[%l7 + 0x7C]
	fbn,a	%fcc2,	loop_1028
	tcs	%icc,	0x6
	tl	%xcc,	0x1
	wr	%g0,	0x52,	%asi
	stxa	%g6,	[%g0 + 0x218] %asi
loop_1028:
	fmul8ulx16	%f2,	%f10,	%f8
	edge32l	%o4,	%g3,	%o7
	alignaddr	%i2,	%g4,	%l6
	array16	%i6,	%i4,	%o5
	udivcc	%i7,	0x1233,	%l1
	edge8	%o2,	%o3,	%o0
	ldsb	[%l7 + 0x4C],	%i1
	ldsb	[%l7 + 0x7B],	%l5
	umulcc	%l4,	0x1E21,	%i3
	fsrc1	%f18,	%f6
	fandnot2	%f26,	%f14,	%f10
	orn	%g7,	%i0,	%l0
	fbu,a	%fcc0,	loop_1029
	fcmpgt32	%f8,	%f10,	%g2
	xor	%i5,	0x1FC7,	%l3
	ldsh	[%l7 + 0x1E],	%o1
loop_1029:
	stw	%g5,	[%l7 + 0x6C]
	ta	%xcc,	0x4
	subccc	%o6,	%l2,	%g1
	bvs	loop_1030
	addcc	%o4,	0x1E24,	%g3
	array16	%g6,	%o7,	%i2
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f28
loop_1030:
	tcs	%icc,	0x7
	nop
	set	0x54, %l1
	lduw	[%l7 + %l1],	%l6
	alignaddrl	%i6,	%i4,	%g4
	fmul8x16au	%f19,	%f23,	%f28
	smul	%i7,	%l1,	%o5
	movrne	%o3,	%o2,	%i1
	or	%l5,	%l4,	%o0
	edge8	%i3,	%g7,	%l0
	movvs	%xcc,	%i0,	%g2
	addc	%i5,	0x0D2A,	%o1
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f22
	fxtod	%f22,	%f0
	subc	%g5,	%o6,	%l2
	std	%f28,	[%l7 + 0x78]
	fmul8sux16	%f8,	%f30,	%f12
	add	%g1,	%o4,	%l3
	fxors	%f16,	%f31,	%f15
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%o7
	nop
	setx	0xB4DB5D64406E8028,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	edge16	%g3,	%i2,	%i6
	mulscc	%l6,	%g4,	%i7
	edge8ln	%l1,	%i4,	%o5
	movleu	%icc,	%o3,	%i1
	andncc	%o2,	%l5,	%l4
	smulcc	%o0,	0x022C,	%g7
	fmovdvc	%xcc,	%f9,	%f4
	tl	%xcc,	0x0
	srlx	%l0,	0x17,	%i0
	edge16	%i3,	%g2,	%i5
	nop
	setx	0xC07510B6,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	nop
	setx	loop_1031,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmple32	%f8,	%f4,	%o1
	movvs	%xcc,	%o6,	%g5
	nop
	setx	0x8BB6FDC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x6B4442A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f8,	%f31
loop_1031:
	sll	%g1,	%l2,	%o4
	popc	%l3,	%o7
	fnor	%f30,	%f4,	%f26
	subc	%g3,	0x1658,	%i2
	smulcc	%g6,	0x0BC1,	%i6
	edge16ln	%g4,	%l6,	%i7
	ldx	[%l7 + 0x10],	%i4
	srax	%l1,	0x1F,	%o5
	bpos,a,pn	%icc,	loop_1032
	brnz	%o3,	loop_1033
	edge8l	%o2,	%l5,	%i1
	nop
	setx	0x7EC576A7F041B0B3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_1032:
	nop
	setx loop_1034, %l0, %l1
	jmpl %l1, %l4
loop_1033:
	tl	%xcc,	0x6
	tne	%icc,	0x2
	edge8n	%g7,	%l0,	%i0
loop_1034:
	nop
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x1f,	%f16
	fbl	%fcc2,	loop_1035
	be,a	loop_1036
	ldsw	[%l7 + 0x64],	%i3
	movne	%icc,	%g2,	%i5
loop_1035:
	udivx	%o1,	0x11FC,	%o6
loop_1036:
	bleu,pn	%xcc,	loop_1037
	ble,a,pt	%icc,	loop_1038
	for	%f20,	%f18,	%f8
	tsubcctv	%o0,	%g5,	%g1
loop_1037:
	fble,a	%fcc3,	loop_1039
loop_1038:
	movrlez	%l2,	%l3,	%o7
	fexpand	%f26,	%f16
	fsrc1s	%f13,	%f27
loop_1039:
	srlx	%o4,	%g3,	%i2
	addccc	%i6,	0x0FC8,	%g4
	prefetch	[%l7 + 0x20],	 0x0
	tl	%icc,	0x0
	sdivx	%l6,	0x0C99,	%i7
	movle	%icc,	%i4,	%l1
	be	%icc,	loop_1040
	tcc	%xcc,	0x4
	fmovspos	%icc,	%f18,	%f20
	fmovda	%xcc,	%f29,	%f28
loop_1040:
	movrlez	%o5,	%o3,	%g6
	mova	%xcc,	%o2,	%i1
	nop
	setx	0x727CC0E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xECA9FE72,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f29,	%f24
	set	0x22, %l3
	ldsha	[%l7 + %l3] 0x88,	%l5
	movrgez	%l4,	%g7,	%i0
	wr	%g0,	0x23,	%asi
	stxa	%l0,	[%l7 + 0x30] %asi
	membar	#Sync
	alignaddr	%g2,	%i5,	%i3
	sra	%o6,	%o1,	%g5
	for	%f12,	%f10,	%f8
	tcs	%xcc,	0x2
	movge	%xcc,	%o0,	%l2
	wr	%g0,	0x80,	%asi
	sta	%f19,	[%l7 + 0x44] %asi
	ldsb	[%l7 + 0x6F],	%l3
	fmul8ulx16	%f20,	%f6,	%f26
	tg	%xcc,	0x5
	fba,a	%fcc3,	loop_1041
	umul	%g1,	0x03B0,	%o4
	movle	%xcc,	%g3,	%i2
	sdivcc	%i6,	0x17CD,	%o7
loop_1041:
	sllx	%g4,	0x11,	%i7
	addccc	%i4,	%l1,	%l6
	srlx	%o5,	0x03,	%o3
	movgu	%xcc,	%g6,	%i1
	nop
	fitos	%f12,	%f0
	fstox	%f0,	%f20
	edge16	%l5,	%o2,	%g7
	sdivx	%l4,	0x0317,	%l0
	umul	%i0,	%i5,	%i3
	tn	%icc,	0x5
	sdivcc	%g2,	0x0E7D,	%o1
	tpos	%xcc,	0x7
	tgu	%xcc,	0x6
	edge32	%g5,	%o6,	%l2
	tgu	%icc,	0x6
	tsubcc	%o0,	%g1,	%o4
	fzero	%f14
	set	0x52, %i0
	ldstuba	[%l7 + %i0] 0x18,	%l3
	srlx	%g3,	%i6,	%i2
	fmovsa	%icc,	%f27,	%f18
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	tneg	%icc,	0x7
	nop
	fitos	%f4,	%f27
	fstod	%f27,	%f4
	movcs	%icc,	%i7,	%i4
	edge32l	%g4,	%l6,	%l1
	move	%xcc,	%o5,	%o3
	xorcc	%i1,	%g6,	%l5
	fcmpeq32	%f6,	%f12,	%g7
	fcmpgt32	%f30,	%f22,	%l4
	wr	%g0,	0x88,	%asi
	stha	%l0,	[%l7 + 0x12] %asi
	fzeros	%f23
	movleu	%xcc,	%i0,	%i5
	edge32ln	%o2,	%g2,	%o1
	addccc	%i3,	0x05C8,	%g5
	fbo	%fcc0,	loop_1042
	edge32	%o6,	%o0,	%l2
	edge16	%g1,	%l3,	%g3
	array32	%o4,	%i6,	%o7
loop_1042:
	edge16	%i7,	%i4,	%i2
	movvc	%icc,	%g4,	%l6
	movle	%xcc,	%l1,	%o3
	tn	%xcc,	0x6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x88,	%i1,	%g6
	sra	%l5,	%o5,	%l4
	ba,a	%xcc,	loop_1043
	fbn	%fcc0,	loop_1044
	tne	%icc,	0x4
	addcc	%g7,	0x1D35,	%i0
loop_1043:
	nop
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l0
loop_1044:
	bn,pn	%icc,	loop_1045
	edge32l	%i5,	%g2,	%o2
	fmovsne	%xcc,	%f13,	%f6
	fmovsleu	%xcc,	%f24,	%f19
loop_1045:
	tl	%xcc,	0x4
	subccc	%i3,	0x0B83,	%g5
	xnor	%o1,	%o6,	%l2
	andcc	%o0,	%l3,	%g1
	andcc	%o4,	0x1166,	%i6
	movvs	%xcc,	%g3,	%o7
	fcmple16	%f4,	%f12,	%i4
	fpsub32s	%f3,	%f7,	%f3
	edge32n	%i2,	%g4,	%i7
	fornot2	%f10,	%f8,	%f0
	movrlez	%l1,	0x15D,	%l6
	sllx	%i1,	%o3,	%g6
	tleu	%xcc,	0x5
	tsubcc	%o5,	0x050B,	%l4
	fmovscc	%icc,	%f14,	%f7
	alignaddr	%g7,	%i0,	%l0
	fabss	%f18,	%f2
	fmovrsgez	%l5,	%f26,	%f30
	wr	%g0,	0x11,	%asi
	stba	%i5,	[%l7 + 0x12] %asi
	fmovse	%icc,	%f22,	%f30
	fpadd32s	%f20,	%f24,	%f3
	bgu	%xcc,	loop_1046
	fmovrse	%o2,	%f16,	%f15
	fpsub16	%f2,	%f24,	%f10
	fornot1	%f16,	%f4,	%f6
loop_1046:
	fsrc2	%f10,	%f0
	movgu	%xcc,	%i3,	%g5
	brgez,a	%o1,	loop_1047
	orcc	%o6,	%l2,	%o0
	sub	%l3,	0x119A,	%g2
	nop
	set	0x50, %g4
	stw	%g1,	[%l7 + %g4]
loop_1047:
	fnot2	%f20,	%f10
	movle	%icc,	%i6,	%g3
	movgu	%xcc,	%o4,	%o7
	tg	%icc,	0x6
	srlx	%i4,	%i2,	%i7
	sra	%l1,	0x00,	%l6
	addccc	%g4,	%i1,	%o3
	fmul8x16	%f23,	%f4,	%f20
	nop
	setx	0x06D71898,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x3B08D788,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f15,	%f22
	bshuffle	%f30,	%f6,	%f16
	ldsh	[%l7 + 0x52],	%g6
	fbug	%fcc2,	loop_1048
	array8	%l4,	%o5,	%g7
	or	%i0,	%l0,	%i5
	fmovrslz	%o2,	%f8,	%f10
loop_1048:
	movre	%i3,	%g5,	%l5
	nop
	setx	0x64A0C2F00F9A6841,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f24
	sra	%o6,	%o1,	%l2
	taddcc	%o0,	0x03C9,	%g2
	lduh	[%l7 + 0x76],	%l3
	nop
	setx	loop_1049,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnegd	%f24,	%f4
	edge16l	%i6,	%g3,	%g1
	srax	%o4,	0x09,	%o7
loop_1049:
	edge8ln	%i2,	%i7,	%i4
	sll	%l6,	0x1B,	%g4
	movg	%xcc,	%i1,	%l1
	srl	%o3,	%l4,	%o5
	nop
	fitod	%f4,	%f20
	fdtos	%f20,	%f13
	edge32	%g6,	%i0,	%g7
	edge16ln	%l0,	%o2,	%i5
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x38] %asi,	%i3
	edge16n	%l5,	%g5,	%o6
	movl	%icc,	%o1,	%l2
	brlez	%o0,	loop_1050
	nop
	setx	0x86E3135F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f28
	nop
	setx	0x404E3B76,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	add	%l7,	0x54,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%g2,	%i6
loop_1050:
	array8	%l3,	%g1,	%g3
	fzeros	%f21
	prefetch	[%l7 + 0x20],	 0x3
	tge	%xcc,	0x2
	fexpand	%f13,	%f30
	set	0x24, %o3
	lduha	[%l7 + %o3] 0x0c,	%o4
	subcc	%o7,	0x17A4,	%i7
	sethi	0x1622,	%i4
	tl	%xcc,	0x6
	tneg	%xcc,	0x5
	fnot2	%f28,	%f0
	udivx	%l6,	0x178B,	%g4
	fmovrslz	%i2,	%f30,	%f8
	tn	%xcc,	0x0
	ba,a,pn	%icc,	loop_1051
	fpsub16s	%f15,	%f28,	%f31
	pdist	%f18,	%f6,	%f6
	tcs	%icc,	0x1
loop_1051:
	fmul8x16	%f25,	%f22,	%f2
	fmovrslz	%i1,	%f19,	%f28
	srax	%l1,	%o3,	%l4
	fmovsge	%xcc,	%f30,	%f14
	fnand	%f12,	%f12,	%f14
	movn	%icc,	%o5,	%i0
	set	0x38, %g1
	swapa	[%l7 + %g1] 0x19,	%g6
	nop
	set	0x4D, %g3
	ldstub	[%l7 + %g3],	%l0
	wr	%g0,	0x18,	%asi
	stwa	%g7,	[%l7 + 0x50] %asi
	tcs	%icc,	0x6
	movneg	%icc,	%o2,	%i3
	tvc	%icc,	0x1
	fpadd16	%f16,	%f28,	%f24
	subc	%l5,	%g5,	%o6
	sllx	%i5,	0x14,	%l2
	fsrc1	%f12,	%f12
	movcc	%icc,	%o0,	%o1
	sub	%g2,	%i6,	%l3
	fmovdle	%icc,	%f18,	%f27
	fmul8ulx16	%f4,	%f2,	%f16
	fsrc2s	%f15,	%f29
	movg	%icc,	%g3,	%o4
	ldstub	[%l7 + 0x78],	%g1
	edge8ln	%i7,	%o7,	%i4
	tl	%xcc,	0x0
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x40] %asi,	%g4
	fba,a	%fcc2,	loop_1052
	orn	%l6,	%i1,	%l1
	set	0x58, %i7
	lda	[%l7 + %i7] 0x80,	%f17
loop_1052:
	mulx	%o3,	%i2,	%l4
	orncc	%o5,	%i0,	%g6
	fpadd32	%f0,	%f4,	%f16
	std	%f10,	[%l7 + 0x20]
	fpack16	%f2,	%f31
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g7
	tcs	%icc,	0x2
	tg	%xcc,	0x4
	srax	%o2,	0x0E,	%l0
	fcmpeq16	%f18,	%f26,	%i3
	tcs	%xcc,	0x7
	fmul8x16au	%f27,	%f19,	%f8
	tl	%xcc,	0x5
	andncc	%g5,	%l5,	%o6
	andcc	%i5,	0x1A51,	%o0
	sdiv	%l2,	0x14F9,	%o1
	and	%i6,	%g2,	%g3
	addc	%l3,	%g1,	%o4
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	membar	0x0F
	addc	%i4,	%g4,	%o7
	addc	%l6,	0x041B,	%i1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%l0
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o3
	edge32n	%l4,	%i2,	%i0
	subcc	%o5,	%g7,	%o2
	ld	[%l7 + 0x48],	%f29
	orncc	%l0,	0x0811,	%i3
	nop
	fitod	%f4,	%f12
	fdtoi	%f12,	%f31
	fmovdcs	%icc,	%f26,	%f11
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g6,	%l5
	nop
	setx	0x1042EBBE,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g5,	[%l7 + 0x26]
	edge32n	%i5,	%o6,	%o0
	sdivcc	%l2,	0x0F8A,	%o1
	nop
	setx	0xF153615736DAECC9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x3E31DCCE9F0B32ED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f10,	%f30
	fmovdle	%xcc,	%f0,	%f11
	udivx	%i6,	0x051B,	%g2
	tle	%icc,	0x5
	bcc,a	%icc,	loop_1053
	movrgz	%g3,	%g1,	%o4
	tsubcctv	%l3,	%i4,	%g4
	array16	%o7,	%l6,	%i7
loop_1053:
	sir	0x1CD0
	bg,a	loop_1054
	edge8n	%l1,	%o3,	%l4
	umul	%i1,	%i0,	%o5
	sdiv	%g7,	0x0E24,	%o2
loop_1054:
	sdivcc	%i2,	0x1B68,	%i3
	fbule	%fcc1,	loop_1055
	popc	0x0344,	%l0
	fors	%f25,	%f15,	%f14
	lduh	[%l7 + 0x5E],	%g6
loop_1055:
	stbar
	array8	%l5,	%i5,	%o6
	movvs	%xcc,	%g5,	%o0
	movrgz	%l2,	0x1EB,	%o1
	xor	%g2,	0x18C4,	%g3
	movne	%xcc,	%g1,	%i6
	fornot1s	%f27,	%f18,	%f10
	tsubcc	%o4,	%l3,	%g4
	te	%xcc,	0x2
	fpsub16	%f18,	%f22,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f9,	%f8
	move	%icc,	%i4,	%l6
	ldd	[%l7 + 0x20],	%f14
	fpsub32s	%f20,	%f31,	%f18
	ta	%xcc,	0x5
	nop
	fitos	%f14,	%f20
	fstoi	%f20,	%f23
	tsubcctv	%o7,	%i7,	%o3
	movvc	%xcc,	%l4,	%l1
	smulcc	%i1,	%i0,	%g7
	fbg,a	%fcc1,	loop_1056
	addc	%o5,	%o2,	%i3
	fpadd16	%f22,	%f12,	%f10
	fmovdge	%xcc,	%f22,	%f30
loop_1056:
	popc	%l0,	%g6
	movrne	%i2,	%i5,	%l5
	movcc	%icc,	%g5,	%o0
	udivx	%o6,	0x015F,	%l2
	movrgz	%g2,	%o1,	%g3
	tle	%xcc,	0x5
	nop
	fitos	%f8,	%f8
	fstox	%f8,	%f2
	wr	%g0,	0x88,	%asi
	stha	%g1,	[%l7 + 0x5C] %asi
	tg	%xcc,	0x7
	be	%xcc,	loop_1057
	tl	%xcc,	0x5
	tsubcc	%i6,	0x1F9D,	%o4
	edge8	%g4,	%i4,	%l6
loop_1057:
	tleu	%icc,	0x4
	stw	%l3,	[%l7 + 0x70]
	call	loop_1058
	fbu,a	%fcc1,	loop_1059
	mulx	%i7,	%o7,	%l4
	stbar
loop_1058:
	brnz,a	%o3,	loop_1060
loop_1059:
	subcc	%l1,	%i0,	%i1
	nop
	setx loop_1061, %l0, %l1
	jmpl %l1, %o5
	movrne	%g7,	%i3,	%o2
loop_1060:
	fbue	%fcc3,	loop_1062
	edge32	%g6,	%l0,	%i5
loop_1061:
	flush	%l7 + 0x28
	edge16l	%i2,	%g5,	%l5
loop_1062:
	array16	%o0,	%o6,	%l2
	stb	%g2,	[%l7 + 0x4F]
	sub	%o1,	0x07BD,	%g3
	tpos	%icc,	0x3
	sdivcc	%i6,	0x1058,	%g1
	std	%f30,	[%l7 + 0x50]
	movrne	%g4,	0x034,	%i4
	fmovs	%f0,	%f7
	sub	%o4,	%l6,	%i7
	sra	%o7,	0x07,	%l3
	fmovdg	%icc,	%f21,	%f22
	sra	%o3,	%l4,	%i0
	srl	%l1,	0x1B,	%i1
	movleu	%xcc,	%g7,	%o5
	fnor	%f10,	%f18,	%f10
	fmovdleu	%xcc,	%f16,	%f21
	udivx	%o2,	0x03A8,	%g6
	bge,a,pt	%xcc,	loop_1063
	bcc,a,pt	%icc,	loop_1064
	fnot2s	%f23,	%f25
	udivcc	%l0,	0x0B3D,	%i5
loop_1063:
	srax	%i3,	%g5,	%i2
loop_1064:
	fmovsleu	%icc,	%f14,	%f3
	for	%f16,	%f16,	%f6
	movvs	%xcc,	%o0,	%l5
	wr	%g0,	0x0c,	%asi
	stha	%o6,	[%l7 + 0x5E] %asi
	fand	%f20,	%f8,	%f4
	fbue,a	%fcc1,	loop_1065
	sllx	%g2,	%o1,	%l2
	bshuffle	%f10,	%f8,	%f22
	fbn	%fcc3,	loop_1066
loop_1065:
	edge16	%i6,	%g3,	%g1
	set	0x4E, %o5
	ldsba	[%l7 + %o5] 0x18,	%i4
loop_1066:
	movn	%xcc,	%o4,	%g4
	array32	%i7,	%l6,	%l3
	move	%icc,	%o3,	%l4
	std	%f12,	[%l7 + 0x78]
	edge32l	%i0,	%l1,	%o7
	srl	%i1,	0x1E,	%g7
	sdiv	%o5,	0x1177,	%g6
	edge16l	%l0,	%o2,	%i3
	edge8ln	%g5,	%i5,	%o0
	ld	[%l7 + 0x3C],	%f28
	bl	%icc,	loop_1067
	fmovdneg	%xcc,	%f31,	%f14
	movcs	%xcc,	%i2,	%o6
	fornot2s	%f2,	%f27,	%f5
loop_1067:
	array32	%g2,	%o1,	%l5
	movrgez	%l2,	%g3,	%g1
	andn	%i4,	0x04B2,	%i6
	fmovrsgez	%o4,	%f9,	%f5
	addccc	%i7,	0x07B3,	%g4
	tcs	%icc,	0x5
	movgu	%xcc,	%l3,	%l6
	ble	%xcc,	loop_1068
	ble,a,pn	%xcc,	loop_1069
	addcc	%o3,	%i0,	%l1
	fmovde	%xcc,	%f8,	%f12
loop_1068:
	andncc	%o7,	%i1,	%g7
loop_1069:
	umul	%o5,	0x0414,	%g6
	tcs	%xcc,	0x5
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f24
	fxtod	%f24,	%f12
	subc	%l4,	0x0C40,	%o2
	xnor	%l0,	%i3,	%i5
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
	smul	%i2,	0x0C06,	%g5
	udivx	%g2,	0x037B,	%o6
	subc	%l5,	0x027E,	%l2
	fmovde	%xcc,	%f19,	%f9
	array8	%o1,	%g1,	%g3
	taddcc	%i6,	%i4,	%o4
	movle	%icc,	%i7,	%g4
	movvc	%icc,	%l6,	%o3
	swap	[%l7 + 0x34],	%i0
	brlz,a	%l3,	loop_1070
	movge	%xcc,	%l1,	%i1
	fcmpeq16	%f28,	%f0,	%g7
	fblg,a	%fcc1,	loop_1071
loop_1070:
	fmovsgu	%xcc,	%f22,	%f20
	set	0x5B, %o1
	lduba	[%l7 + %o1] 0x80,	%o5
loop_1071:
	srlx	%g6,	%l4,	%o7
	bge	%icc,	loop_1072
	move	%icc,	%o2,	%l0
	fmovsvs	%icc,	%f9,	%f14
	sth	%i3,	[%l7 + 0x40]
loop_1072:
	edge16	%o0,	%i2,	%g5
	fmuld8sux16	%f5,	%f11,	%f0
	edge32	%g2,	%o6,	%i5
	bvc,pt	%icc,	loop_1073
	fcmple32	%f16,	%f18,	%l5
	fbe	%fcc3,	loop_1074
	bl,a,pt	%xcc,	loop_1075
loop_1073:
	edge16n	%o1,	%l2,	%g1
	mulx	%i6,	%g3,	%o4
loop_1074:
	edge32l	%i4,	%i7,	%l6
loop_1075:
	fbul,a	%fcc3,	loop_1076
	movne	%xcc,	%o3,	%g4
	ldd	[%l7 + 0x60],	%i0
	fnot1	%f20,	%f28
loop_1076:
	smulcc	%l1,	0x103B,	%l3
	addc	%i1,	%g7,	%g6
	st	%f25,	[%l7 + 0x2C]
	bvs,a	loop_1077
	movcc	%icc,	%l4,	%o7
	stb	%o2,	[%l7 + 0x4A]
	brgez,a	%l0,	loop_1078
loop_1077:
	move	%xcc,	%i3,	%o0
	wr	%g0,	0x89,	%asi
	sta	%f13,	[%l7 + 0x28] %asi
loop_1078:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o5,	%g5
	tn	%icc,	0x6
	subcc	%i2,	0x0D83,	%g2
	fxnors	%f13,	%f4,	%f22
	array32	%i5,	%o6,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,pt	%xcc,	loop_1079
	and	%l2,	0x112E,	%g1
	tge	%xcc,	0x4
	tvs	%icc,	0x1
loop_1079:
	fsrc2	%f6,	%f22
	fnot2	%f22,	%f12
	edge16n	%l5,	%i6,	%o4
	movneg	%icc,	%g3,	%i4
	fmul8x16al	%f27,	%f9,	%f16
	edge32n	%l6,	%o3,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f23,	%f11
	movn	%icc,	%i0,	%l1
	movgu	%icc,	%g4,	%i1
	movg	%xcc,	%l3,	%g7
	orn	%l4,	0x007A,	%g6
	movrgez	%o7,	0x14E,	%l0
	alignaddrl	%o2,	%i3,	%o5
	tne	%icc,	0x5
	edge32ln	%g5,	%o0,	%g2
	movrgz	%i2,	%o6,	%o1
	tvs	%icc,	0x0
	edge8n	%l2,	%i5,	%g1
	smulcc	%i6,	%l5,	%g3
	movrgz	%i4,	0x3C4,	%o4
	fnand	%f8,	%f24,	%f16
	edge32n	%l6,	%i7,	%o3
	nop
	setx	0x2A1293CBC6037AE1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD02443A00A86363F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f20,	%f10
	smul	%l1,	0x049C,	%g4
	sllx	%i1,	%i0,	%g7
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sub	%l3,	%g6,	%l4
	mulx	%l0,	0x0EA4,	%o2
	stx	%i3,	[%l7 + 0x30]
	fmovdcc	%xcc,	%f23,	%f8
	tleu	%icc,	0x2
	fmovdcs	%icc,	%f24,	%f24
	fmovdg	%xcc,	%f23,	%f29
	movn	%xcc,	%o7,	%g5
	sdivx	%o0,	0x1334,	%o5
	addcc	%g2,	%i2,	%o6
	fmovrde	%o1,	%f8,	%f24
	array16	%i5,	%l2,	%i6
	movrne	%g1,	0x221,	%g3
	nop
	setx	loop_1080,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnorcc	%l5,	%i4,	%o4
	fexpand	%f5,	%f24
	fcmpgt32	%f8,	%f18,	%i7
loop_1080:
	fmovsvc	%xcc,	%f20,	%f5
	subc	%l6,	%l1,	%g4
	fmovd	%f14,	%f14
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x1E] %asi,	%o3
	array16	%i1,	%i0,	%l3
	tleu	%icc,	0x5
	subc	%g7,	0x0269,	%g6
	addc	%l0,	%o2,	%i3
	nop
	setx	0x5708FA66CC596E0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF809D8CB0FD4E014,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f12,	%f6
	tcs	%xcc,	0x2
	umul	%o7,	%l4,	%o0
	bcc	%icc,	loop_1081
	or	%g5,	0x1BF8,	%g2
	movrne	%o5,	%i2,	%o6
	fsrc1s	%f23,	%f8
loop_1081:
	nop
	fitod	%f3,	%f2
	move	%icc,	%o1,	%l2
	sethi	0x0954,	%i5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x53] %asi,	%i6
	fbug,a	%fcc2,	loop_1082
	nop
	setx	loop_1083,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsh	[%l7 + 0x3E],	%g3
	srax	%l5,	0x15,	%i4
loop_1082:
	fpadd16s	%f7,	%f10,	%f27
loop_1083:
	sll	%o4,	0x17,	%g1
	subcc	%i7,	0x027F,	%l6
	nop
	fitos	%f11,	%f13
	fstod	%f13,	%f26
	addcc	%l1,	0x1CDA,	%o3
	movge	%xcc,	%i1,	%i0
	nop
	fitod	%f7,	%f12
	fbne,a	%fcc0,	loop_1084
	fsrc1s	%f14,	%f16
	fmovdg	%xcc,	%f9,	%f23
	nop
	setx	0x7C7F6005,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x5BE6CC22,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f31,	%f12
loop_1084:
	nop
	setx	0x42972BB240CAD5C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xF0D13E1653F75F12,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f10,	%f20
	bvc,a	loop_1085
	bl	loop_1086
	edge8ln	%l3,	%g7,	%g4
	lduh	[%l7 + 0x74],	%g6
loop_1085:
	smul	%l0,	%i3,	%o2
loop_1086:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1087,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l4,	%o7,	%o0
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f2
	fxtod	%f2,	%f28
loop_1087:
	edge16l	%g5,	%g2,	%o5
	movcc	%icc,	%o6,	%o1
	fbge	%fcc0,	loop_1088
	tcc	%xcc,	0x2
	fcmpgt32	%f8,	%f10,	%i2
	andn	%l2,	0x15B7,	%i5
loop_1088:
	edge32n	%i6,	%g3,	%i4
	umul	%l5,	%o4,	%i7
	fands	%f24,	%f28,	%f9
	movleu	%icc,	%g1,	%l1
	tge	%icc,	0x5
	fbe,a	%fcc1,	loop_1089
	fmovsneg	%icc,	%f4,	%f9
	fexpand	%f8,	%f6
	xorcc	%l6,	0x1C5C,	%i1
loop_1089:
	fpsub16s	%f12,	%f26,	%f29
	srl	%i0,	0x14,	%l3
	edge8l	%o3,	%g4,	%g7
	fmuld8sux16	%f27,	%f5,	%f26
	movpos	%xcc,	%g6,	%l0
	fmovdcc	%xcc,	%f19,	%f7
	movcc	%icc,	%o2,	%l4
	fmovrslez	%i3,	%f31,	%f20
	movneg	%icc,	%o0,	%o7
	edge32ln	%g5,	%o5,	%g2
	edge16l	%o1,	%o6,	%i2
	fmovsle	%icc,	%f28,	%f27
	fmovsge	%icc,	%f4,	%f21
	fmovrde	%i5,	%f0,	%f20
	tg	%xcc,	0x1
	fmovdne	%xcc,	%f3,	%f22
	movrne	%l2,	%i6,	%i4
	fmovdleu	%xcc,	%f24,	%f4
	addc	%l5,	%g3,	%i7
	set	0x24, %g5
	ldsba	[%l7 + %g5] 0x11,	%g1
	subcc	%l1,	%l6,	%i1
	srl	%i0,	0x19,	%l3
	nop
	fitod	%f10,	%f26
	fdtox	%f26,	%f22
	fmovrdne	%o4,	%f28,	%f22
	sir	0x13FA
	xor	%o3,	0x074F,	%g7
	brgez,a	%g6,	loop_1090
	umul	%l0,	0x129E,	%o2
	movle	%xcc,	%g4,	%i3
	nop
	fitod	%f4,	%f4
	fdtox	%f4,	%f0
loop_1090:
	fmovse	%xcc,	%f3,	%f5
	prefetch	[%l7 + 0x4C],	 0x2
	fmovdle	%xcc,	%f0,	%f15
	subccc	%o0,	0x018F,	%l4
	andn	%g5,	0x1149,	%o7
	fmul8ulx16	%f28,	%f14,	%f12
	fba,a	%fcc0,	loop_1091
	nop
	fitos	%f7,	%f13
	movrgez	%g2,	%o5,	%o6
	fandnot2s	%f7,	%f7,	%f20
loop_1091:
	alignaddrl	%i2,	%i5,	%o1
	srl	%l2,	0x0B,	%i6
	subc	%i4,	%g3,	%i7
	edge16l	%l5,	%l1,	%g1
	tle	%xcc,	0x1
	sub	%i1,	%l6,	%l3
	fmovspos	%icc,	%f17,	%f1
	xor	%i0,	%o3,	%g7
	sllx	%g6,	0x05,	%o4
	nop
	fitos	%f8,	%f12
	fstoi	%f12,	%f27
	srlx	%l0,	%g4,	%i3
	movl	%xcc,	%o2,	%o0
	subccc	%l4,	%g5,	%o7
	mova	%xcc,	%o5,	%g2
	brlez,a	%i2,	loop_1092
	orncc	%o6,	%o1,	%i5
	fbe,a	%fcc1,	loop_1093
	fbo,a	%fcc1,	loop_1094
loop_1092:
	nop
	setx	0x39850819501A6D8E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB9F472A746F96807,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f4,	%f18
	fbul	%fcc3,	loop_1095
loop_1093:
	fors	%f16,	%f27,	%f10
loop_1094:
	srlx	%i6,	%i4,	%g3
	sdivcc	%l2,	0x18A8,	%i7
loop_1095:
	fble,a	%fcc0,	loop_1096
	array8	%l1,	%l5,	%i1
	movpos	%icc,	%g1,	%l3
	sllx	%i0,	0x05,	%l6
loop_1096:
	edge32l	%g7,	%g6,	%o3
	fmovsvs	%icc,	%f20,	%f10
	stb	%l0,	[%l7 + 0x30]
	fandnot2	%f0,	%f8,	%f24
	popc	0x00FA,	%g4
	tsubcc	%i3,	0x0F5F,	%o4
	stbar
	fba	%fcc0,	loop_1097
	subccc	%o2,	0x1F3A,	%l4
	st	%f24,	[%l7 + 0x20]
	fmovsn	%icc,	%f8,	%f27
loop_1097:
	bvc,a	%icc,	loop_1098
	tcs	%icc,	0x5
	fmovdge	%icc,	%f5,	%f22
	nop
	fitod	%f5,	%f0
loop_1098:
	array16	%o0,	%g5,	%o7
	tsubcc	%o5,	%i2,	%g2
	bn,a,pt	%icc,	loop_1099
	brnz	%o6,	loop_1100
	subccc	%o1,	0x1434,	%i6
	fnot2	%f2,	%f20
loop_1099:
	subccc	%i5,	%g3,	%l2
loop_1100:
	mova	%icc,	%i4,	%i7
	movleu	%icc,	%l1,	%l5
	sllx	%i1,	%g1,	%i0
	array16	%l6,	%l3,	%g7
	lduw	[%l7 + 0x20],	%g6
	taddcctv	%o3,	0x0ABA,	%g4
	edge8ln	%i3,	%l0,	%o2
	ba,a,pt	%icc,	loop_1101
	nop
	setx	0x7C7CAE98F832648D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0AB785BFA8C9F1A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f26,	%f16
	edge8l	%l4,	%o4,	%g5
	sra	%o7,	0x17,	%o5
loop_1101:
	nop
	setx	0x7048025C,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	sra	%o0,	%i2,	%g2
	fmovdne	%icc,	%f22,	%f10
	taddcctv	%o6,	0x0C4E,	%i6
	fmovsgu	%icc,	%f20,	%f0
	bne	%icc,	loop_1102
	sir	0x0CEF
	nop
	fitos	%f10,	%f5
	popc	%i5,	%g3
loop_1102:
	popc	%l2,	%o1
	tcs	%xcc,	0x0
	movrlz	%i7,	%i4,	%l1
	sll	%i1,	%l5,	%g1
	fmovsvc	%xcc,	%f0,	%f9
	fbu	%fcc2,	loop_1103
	fornot2s	%f1,	%f6,	%f18
	mulx	%l6,	%l3,	%i0
	subccc	%g7,	%o3,	%g6
loop_1103:
	taddcc	%i3,	%g4,	%o2
	sra	%l4,	0x04,	%o4
	mulscc	%l0,	%g5,	%o7
	nop
	set	0x78, %l4
	ldsw	[%l7 + %l4],	%o0
	fmovscc	%xcc,	%f11,	%f22
	fmovs	%f20,	%f15
	tsubcctv	%i2,	%o5,	%g2
	orncc	%i6,	0x0BBF,	%o6
	fmovrdgez	%i5,	%f20,	%f26
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x50] %asi,	%f8
	fmovde	%xcc,	%f4,	%f11
	edge8ln	%g3,	%o1,	%l2
	movge	%xcc,	%i4,	%l1
	fbuge	%fcc2,	loop_1104
	fmovdvc	%icc,	%f8,	%f16
	array16	%i1,	%i7,	%g1
	taddcctv	%l6,	%l5,	%l3
loop_1104:
	fcmple32	%f22,	%f30,	%g7
	move	%icc,	%o3,	%g6
	andcc	%i3,	0x0057,	%g4
	sdiv	%i0,	0x1E96,	%o2
	addccc	%l4,	%l0,	%o4
	stb	%g5,	[%l7 + 0x10]
	sll	%o0,	0x11,	%o7
	movvc	%icc,	%o5,	%g2
	edge16	%i2,	%i6,	%o6
	bpos,pt	%xcc,	loop_1105
	nop
	setx	loop_1106,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x504FFE21,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	movle	%xcc,	%g3,	%o1
loop_1105:
	edge16n	%i5,	%i4,	%l1
loop_1106:
	stw	%i1,	[%l7 + 0x48]
	sethi	0x1EF9,	%l2
	movcc	%icc,	%i7,	%g1
	nop
	setx	loop_1107,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%l5,	%l3,	%g7
	nop
	setx	0x6C66225F4472D280,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xF4AF17E745F0F13D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f8,	%f24
	movrlez	%o3,	0x215,	%g6
loop_1107:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%l6,	[%l7 + 0x48] %asi
	sub	%g4,	0x1E47,	%i0
	fpsub16s	%f29,	%f18,	%f1
	nop
	setx	0x7D9CD9AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xE08BC3B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f16,	%f8
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x69] %asi,	%o2
	fmovsn	%xcc,	%f15,	%f23
	tcs	%xcc,	0x7
	fblg	%fcc2,	loop_1108
	andn	%i3,	%l4,	%l0
	edge16n	%o4,	%o0,	%g5
	alignaddr	%o7,	%g2,	%o5
loop_1108:
	brlz,a	%i2,	loop_1109
	add	%o6,	0x159C,	%i6
	edge8l	%g3,	%i5,	%o1
	edge8	%i4,	%l1,	%i1
loop_1109:
	tle	%xcc,	0x0
	fbu	%fcc2,	loop_1110
	udiv	%l2,	0x14E8,	%g1
	array8	%l5,	%l3,	%g7
	sdivx	%i7,	0x05CF,	%o3
loop_1110:
	subcc	%l6,	0x0709,	%g6
	fmovrde	%i0,	%f26,	%f4
	fpack16	%f26,	%f7
	fmovdn	%icc,	%f2,	%f8
	tne	%icc,	0x5
	fcmpeq16	%f6,	%f16,	%o2
	movle	%icc,	%g4,	%i3
	fpack32	%f16,	%f8,	%f30
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
	fmovda	%xcc,	%f24,	%f4
	umul	%o4,	0x1BC2,	%l0
	brgz,a	%o0,	loop_1111
	movne	%xcc,	%o7,	%g2
	fcmpeq32	%f2,	%f6,	%o5
	sdivcc	%g5,	0x1359,	%o6
loop_1111:
	tsubcctv	%i6,	0x0688,	%g3
	edge8n	%i5,	%o1,	%i4
	movcc	%xcc,	%i2,	%i1
	array16	%l2,	%l1,	%g1
	fmul8sux16	%f22,	%f24,	%f24
	ldstub	[%l7 + 0x36],	%l5
	fmovrse	%g7,	%f5,	%f23
	fmovrde	%i7,	%f12,	%f18
	fnot1	%f30,	%f18
	fmovdcc	%xcc,	%f17,	%f23
	xnor	%l3,	0x1618,	%o3
	tcs	%icc,	0x3
	orncc	%g6,	%i0,	%l6
	set	0x74, %o6
	ldswa	[%l7 + %o6] 0x10,	%o2
	set	0x79, %l6
	ldsba	[%l7 + %l6] 0x15,	%i3
	std	%f30,	[%l7 + 0x60]
	sll	%g4,	0x0C,	%l4
	tgu	%xcc,	0x6
	smul	%l0,	0x1437,	%o0
	edge16	%o7,	%o4,	%g2
	nop
	setx	loop_1112,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tgu	%icc,	0x4
	tne	%xcc,	0x7
	fabsd	%f18,	%f22
loop_1112:
	subc	%g5,	%o6,	%i6
	xnorcc	%g3,	%i5,	%o1
	nop
	setx	0xB04A00D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	fmovde	%xcc,	%f25,	%f31
	edge8	%o5,	%i2,	%i1
	nop
	setx	0xA38455C30056AB85,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	subc	%i4,	%l2,	%l1
	brlz,a	%l5,	loop_1113
	fmovsvs	%icc,	%f24,	%f18
	tgu	%xcc,	0x2
	movle	%icc,	%g1,	%g7
loop_1113:
	nop
	set	0x14, %i1
	lduha	[%l7 + %i1] 0x19,	%i7
	fornot1s	%f20,	%f24,	%f5
	tge	%xcc,	0x4
	fpsub16s	%f23,	%f13,	%f16
	fxnors	%f6,	%f4,	%f8
	set	0x18, %l2
	stxa	%o3,	[%l7 + %l2] 0x81
	fbuge	%fcc0,	loop_1114
	nop
	setx	0xC5142CA2F6DA4CEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f20
	edge16	%g6,	%l3,	%l6
	set	0x18, %o2
	lduha	[%l7 + %o2] 0x19,	%i0
loop_1114:
	fandnot1s	%f18,	%f18,	%f10
	movge	%icc,	%o2,	%i3
	xorcc	%l4,	%l0,	%o0
	xnor	%o7,	%g4,	%g2
	bcc	loop_1115
	popc	%g5,	%o6
	edge8n	%i6,	%o4,	%g3
	fxor	%f18,	%f6,	%f10
loop_1115:
	tsubcc	%o1,	0x14CA,	%o5
	tgu	%xcc,	0x3
	fsrc1	%f26,	%f18
	tl	%xcc,	0x4
	subccc	%i5,	%i2,	%i1
	ldsh	[%l7 + 0x26],	%l2
	brgz	%i4,	loop_1116
	fmul8sux16	%f22,	%f30,	%f26
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l1,	%g1
loop_1116:
	nop
	fitos	%f1,	%f11
	fstox	%f11,	%f26
	fxtos	%f26,	%f23
	sth	%g7,	[%l7 + 0x3E]
	addccc	%l5,	0x177E,	%o3
	fandnot1s	%f27,	%f29,	%f9
	taddcc	%g6,	0x0C15,	%l3
	mulx	%l6,	%i7,	%o2
	movvs	%xcc,	%i0,	%i3
	andn	%l0,	0x1ECD,	%l4
	fornot1s	%f4,	%f17,	%f15
	edge16l	%o0,	%o7,	%g2
	smulcc	%g4,	0x1A0A,	%g5
	popc	0x12E3,	%o6
	te	%xcc,	0x4
	movcs	%icc,	%i6,	%g3
	udiv	%o4,	0x1EDC,	%o5
	nop
	fitos	%f6,	%f12
	fmovsl	%icc,	%f29,	%f28
	fbule	%fcc1,	loop_1117
	mulx	%o1,	%i5,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l2,	%i1,	%l1
loop_1117:
	fzeros	%f12
	ldub	[%l7 + 0x36],	%g1
	set	0x1C, %o4
	ldstuba	[%l7 + %o4] 0x0c,	%i4
	movrne	%g7,	%o3,	%g6
	be,a	loop_1118
	fornot2s	%f16,	%f15,	%f3
	mova	%icc,	%l5,	%l6
	sdivcc	%l3,	0x16A3,	%o2
loop_1118:
	fmovsneg	%icc,	%f0,	%f2
	tneg	%xcc,	0x4
	udiv	%i0,	0x0F23,	%i7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x48] %asi,	%l0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%o0
	andncc	%o7,	%g2,	%g4
	taddcctv	%g5,	%o6,	%i6
	tgu	%icc,	0x7
	movre	%g3,	%l4,	%o4
	movcs	%xcc,	%o1,	%i5
	orncc	%o5,	0x1455,	%l2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i1,	%l1
	movge	%xcc,	%i2,	%i4
	edge32	%g1,	%g7,	%g6
	udivx	%l5,	0x0B89,	%l6
	tpos	%icc,	0x5
	edge16l	%l3,	%o2,	%o3
	movrgez	%i7,	%i0,	%i3
	movrgez	%o0,	%o7,	%l0
	fba,a	%fcc0,	loop_1119
	fpadd16s	%f10,	%f17,	%f22
	ld	[%l7 + 0x60],	%f4
	fblg	%fcc1,	loop_1120
loop_1119:
	stx	%g2,	[%l7 + 0x48]
	bleu,pt	%xcc,	loop_1121
	add	%g4,	0x064F,	%o6
loop_1120:
	movvs	%icc,	%g5,	%g3
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%i6
loop_1121:
	orncc	%o4,	%o1,	%i5
	nop
	set	0x45, %i5
	ldstub	[%l7 + %i5],	%l4
	movn	%icc,	%o5,	%l2
	movpos	%icc,	%i1,	%l1
	umul	%i4,	0x110B,	%i2
	xor	%g1,	%g6,	%l5
	edge16l	%l6,	%g7,	%o2
	edge32	%l3,	%o3,	%i0
	fexpand	%f21,	%f0
	fbul	%fcc0,	loop_1122
	sethi	0x01EE,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f14,	%f2,	%f6
loop_1122:
	bcc,a,pn	%xcc,	loop_1123
	move	%icc,	%o0,	%o7
	srlx	%i3,	0x1B,	%g2
	fandnot1	%f14,	%f30,	%f12
loop_1123:
	tge	%icc,	0x5
	edge16l	%l0,	%o6,	%g4
	edge32ln	%g5,	%g3,	%o4
	edge16ln	%o1,	%i6,	%i5
	xnorcc	%l4,	0x1EF8,	%l2
	subccc	%o5,	0x1450,	%i1
	movle	%icc,	%i4,	%i2
	addcc	%l1,	0x09B8,	%g1
	taddcctv	%l5,	%l6,	%g6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x08] %asi,	%g7
	popc	%l3,	%o3
	tvc	%xcc,	0x2
	mulscc	%o2,	0x129F,	%i0
	fbug,a	%fcc3,	loop_1124
	bgu,a,pt	%xcc,	loop_1125
	fbu,a	%fcc1,	loop_1126
	bge,a	loop_1127
loop_1124:
	ble,a,pt	%xcc,	loop_1128
loop_1125:
	add	%i7,	0x01A3,	%o7
loop_1126:
	lduh	[%l7 + 0x48],	%i3
loop_1127:
	orncc	%g2,	%o0,	%o6
loop_1128:
	alignaddr	%l0,	%g4,	%g5
	wr	%g0,	0x2f,	%asi
	stha	%o4,	[%l7 + 0x66] %asi
	membar	#Sync
	mulx	%g3,	0x0A6E,	%o1
	edge8n	%i6,	%i5,	%l2
	sdiv	%l4,	0x123B,	%i1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x18,	%o5,	%i2
	bg,pt	%xcc,	loop_1129
	popc	%l1,	%g1
	nop
	setx loop_1130, %l0, %l1
	jmpl %l1, %i4
	fnot2	%f2,	%f20
loop_1129:
	and	%l6,	%g6,	%l5
	stbar
loop_1130:
	mulx	%l3,	0x040B,	%g7
	fpadd32s	%f0,	%f20,	%f6
	sdiv	%o2,	0x12B5,	%i0
	bg	%icc,	loop_1131
	fmovdn	%icc,	%f28,	%f22
	tpos	%icc,	0x2
	bg	%xcc,	loop_1132
loop_1131:
	fbue	%fcc0,	loop_1133
	edge32l	%i7,	%o3,	%i3
	sra	%o7,	0x15,	%g2
loop_1132:
	fba,a	%fcc2,	loop_1134
loop_1133:
	movrgez	%o6,	%l0,	%o0
	popc	0x1CD5,	%g4
	fpadd32	%f18,	%f20,	%f30
loop_1134:
	fnand	%f20,	%f8,	%f18
	subc	%o4,	0x0178,	%g5
	tle	%icc,	0x5
	set	0x0B, %g2
	ldsba	[%l7 + %g2] 0x14,	%o1
	movneg	%xcc,	%i6,	%g3
	prefetch	[%l7 + 0x64],	 0x2
	fornot2	%f26,	%f20,	%f30
	fornot2	%f18,	%f4,	%f8
	fmovsl	%icc,	%f18,	%f10
	edge8ln	%l2,	%i5,	%l4
	srl	%o5,	%i2,	%l1
	movge	%icc,	%i1,	%g1
	or	%i4,	0x1661,	%l6
	fsrc2	%f14,	%f8
	sir	0x0E51
	tg	%xcc,	0x3
	movne	%xcc,	%g6,	%l3
	movg	%xcc,	%l5,	%g7
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
	addc	%i0,	0x1B21,	%o2
	movrlez	%i7,	%o3,	%o7
	tcs	%icc,	0x6
	mulscc	%i3,	%o6,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x30] %asi,	%o0
	andcc	%g4,	0x1DDF,	%g2
	be,a,pt	%icc,	loop_1135
	ta	%icc,	0x1
	fmovse	%icc,	%f15,	%f14
	xor	%o4,	%o1,	%i6
loop_1135:
	ldd	[%l7 + 0x78],	%f24
	and	%g5,	%l2,	%g3
	tcs	%xcc,	0x6
	fmovsgu	%xcc,	%f2,	%f17
	popc	0x032B,	%l4
	fmovrsgz	%o5,	%f13,	%f18
	movle	%icc,	%i5,	%i2
	fbne,a	%fcc0,	loop_1136
	tsubcc	%l1,	%i1,	%i4
	tneg	%xcc,	0x7
	taddcc	%g1,	0x0342,	%l6
loop_1136:
	alignaddrl	%l3,	%l5,	%g7
	brgz,a	%g6,	loop_1137
	edge8	%o2,	%i0,	%o3
	sllx	%i7,	0x00,	%i3
	edge32l	%o7,	%o6,	%l0
loop_1137:
	subccc	%g4,	0x107A,	%g2
	orn	%o0,	%o4,	%i6
	subcc	%g5,	0x1557,	%l2
	bl,a,pn	%icc,	loop_1138
	nop
	setx	0x00761EA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	edge16l	%o1,	%g3,	%l4
	nop
	setx	0xBBBD86D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x3DA82EA5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f31,	%f19
loop_1138:
	orn	%i5,	%o5,	%l1
	brgez	%i2,	loop_1139
	fbule	%fcc0,	loop_1140
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i4,	%g1,	%l6
loop_1139:
	fble	%fcc0,	loop_1141
loop_1140:
	tle	%icc,	0x5
	movrgez	%l3,	%l5,	%i1
	for	%f24,	%f12,	%f26
loop_1141:
	fsrc1s	%f11,	%f10
	sll	%g7,	%o2,	%g6
	movcc	%icc,	%i0,	%i7
	brgez	%i3,	loop_1142
	or	%o3,	%o6,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz	%l0,	loop_1143
loop_1142:
	brlez	%g4,	loop_1144
	edge8l	%o0,	%g2,	%o4
	tpos	%icc,	0x7
loop_1143:
	movneg	%xcc,	%i6,	%l2
loop_1144:
	taddcctv	%g5,	%g3,	%l4
	stw	%o1,	[%l7 + 0x48]
	movcs	%xcc,	%o5,	%l1
	brgez	%i2,	loop_1145
	andcc	%i4,	0x12C1,	%g1
	set	0x70, %o7
	lda	[%l7 + %o7] 0x10,	%f28
loop_1145:
	xnor	%i5,	%l3,	%l6
	fexpand	%f28,	%f28
	fmovrsne	%i1,	%f11,	%f6
	fmuld8ulx16	%f22,	%f9,	%f24
	fpsub16	%f30,	%f14,	%f26
	tsubcc	%g7,	%o2,	%l5
	brgz,a	%g6,	loop_1146
	mova	%xcc,	%i7,	%i3
	fmovdne	%xcc,	%f28,	%f23
	movleu	%icc,	%i0,	%o6
loop_1146:
	fmovdg	%xcc,	%f1,	%f14
	array8	%o3,	%o7,	%l0
	ldd	[%l7 + 0x08],	%g4
	tleu	%icc,	0x4
	std	%f16,	[%l7 + 0x50]
	umul	%o0,	%o4,	%g2
	array16	%l2,	%g5,	%i6
	set	0x110, %i4
	stxa	%g3,	[%g0 + %i4] 0x21
	fmovdge	%xcc,	%f23,	%f9
	or	%o1,	0x098E,	%l4
	andcc	%l1,	0x1671,	%i2
	fabss	%f25,	%f18
	sdivcc	%i4,	0x0457,	%g1
	edge32ln	%i5,	%o5,	%l3
	mova	%xcc,	%i1,	%g7
	edge8l	%l6,	%l5,	%o2
	set	0x53, %i6
	ldstuba	[%l7 + %i6] 0x0c,	%g6
	movl	%icc,	%i3,	%i0
	tn	%xcc,	0x3
	movle	%xcc,	%i7,	%o6
	lduw	[%l7 + 0x08],	%o3
	fpsub16	%f30,	%f18,	%f20
	std	%f8,	[%l7 + 0x58]
	fmovdleu	%icc,	%f27,	%f27
	xnor	%l0,	0x0DC9,	%g4
	membar	0x57
	edge16l	%o0,	%o4,	%o7
	fbuge,a	%fcc2,	loop_1147
	fmovrsgz	%l2,	%f10,	%f6
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1147:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f0,	[%l7 + 0x58] %asi
	bleu,pn	%icc,	loop_1148
	tneg	%xcc,	0x6
	edge32l	%g2,	%g5,	%i6
	edge16	%o1,	%g3,	%l1
loop_1148:
	edge16n	%l4,	%i2,	%g1
	sir	0x036D
	fnot2s	%f4,	%f5
	sub	%i5,	0x0247,	%i4
	fblg,a	%fcc2,	loop_1149
	edge16ln	%l3,	%i1,	%g7
	brlez,a	%l6,	loop_1150
	fmuld8sux16	%f17,	%f31,	%f14
loop_1149:
	movleu	%xcc,	%l5,	%o2
	bcc	loop_1151
loop_1150:
	edge8ln	%g6,	%o5,	%i3
	udivx	%i7,	0x0D7A,	%o6
	sra	%o3,	0x04,	%i0
loop_1151:
	add	%l0,	%g4,	%o4
	or	%o0,	0x1A19,	%l2
	bneg,a,pn	%xcc,	loop_1152
	tge	%xcc,	0x0
	addcc	%o7,	0x1D98,	%g2
	prefetch	[%l7 + 0x54],	 0x2
loop_1152:
	nop
	setx	0xBDC99EC61055BBD7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	edge16n	%i6,	%o1,	%g5
	orn	%g3,	%l4,	%i2
	and	%g1,	0x1E5E,	%l1
	sethi	0x0940,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f26,	%f8,	%f22
	andncc	%i4,	%l3,	%g7
	sdivcc	%i1,	0x197E,	%l5
	taddcctv	%l6,	0x1EBB,	%g6
	fbuge	%fcc1,	loop_1153
	movrne	%o5,	0x16E,	%o2
	ldd	[%l7 + 0x50],	%i6
	sllx	%o6,	0x03,	%o3
loop_1153:
	fpmerge	%f0,	%f12,	%f8
	tl	%icc,	0x7
	fmovsa	%xcc,	%f30,	%f20
	tsubcctv	%i0,	%l0,	%i3
	set	0x6C, %l5
	sta	%f21,	[%l7 + %l5] 0x15
	fpack16	%f8,	%f19
	fsrc2s	%f2,	%f8
	nop
	fitos	%f2,	%f29
	fstoi	%f29,	%f31
	xnor	%g4,	0x0624,	%o4
	bpos	loop_1154
	smulcc	%l2,	%o7,	%g2
	srlx	%o0,	%o1,	%g5
	subccc	%i6,	%g3,	%l4
loop_1154:
	fmovdneg	%icc,	%f25,	%f13
	tvs	%icc,	0x5
	bne,pt	%xcc,	loop_1155
	movl	%icc,	%i2,	%l1
	brnz	%g1,	loop_1156
	fbu,a	%fcc3,	loop_1157
loop_1155:
	subc	%i5,	%l3,	%g7
	set	0x5E, %i3
	ldstuba	[%l7 + %i3] 0x81,	%i1
loop_1156:
	fpack16	%f14,	%f24
loop_1157:
	movcc	%icc,	%l5,	%i4
	te	%xcc,	0x7
	movvc	%icc,	%g6,	%o5
	sir	0x1B88
	fabsd	%f6,	%f4
	fcmpeq16	%f18,	%f14,	%l6
	fexpand	%f21,	%f26
	fbug	%fcc0,	loop_1158
	mulscc	%o2,	0x09CE,	%i7
	taddcctv	%o3,	0x197C,	%i0
	fmovscc	%xcc,	%f31,	%f26
loop_1158:
	fnand	%f4,	%f18,	%f22
	srlx	%l0,	%o6,	%g4
	smulcc	%o4,	%i3,	%l2
	wr	%g0,	0xeb,	%asi
	stxa	%o7,	[%l7 + 0x58] %asi
	membar	#Sync
	nop
	setx	0x72E1B0F8212B4AF5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xABB942763BCB5EEC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f24,	%f22
	tsubcctv	%g2,	0x114A,	%o1
	subc	%g5,	%o0,	%g3
	mova	%xcc,	%i6,	%i2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x78] %asi,	%l1
	srl	%l4,	0x1C,	%g1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x48] %asi,	%i5
	edge8l	%g7,	%l3,	%l5
	movleu	%xcc,	%i4,	%g6
	edge16	%i1,	%l6,	%o2
	udivx	%i7,	0x0B58,	%o3
	wr	%g0,	0x22,	%asi
	stba	%o5,	[%l7 + 0x6C] %asi
	membar	#Sync
	fmovrse	%i0,	%f3,	%f18
	fpsub32s	%f13,	%f26,	%f0
	set	0x42, %g6
	ldstuba	[%l7 + %g6] 0x18,	%l0
	stbar
	fmovscs	%xcc,	%f28,	%f29
	movre	%o6,	%o4,	%i3
	fmovrde	%l2,	%f6,	%f16
	nop
	fitod	%f27,	%f14
	movpos	%xcc,	%g4,	%o7
	movcc	%xcc,	%g2,	%o1
	fpadd16s	%f20,	%f29,	%f30
	nop
	setx	0x8ED6F5F30AA23B83,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x87EB18A8D1EF5F87,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f8,	%f6
	fmovdcs	%xcc,	%f23,	%f2
	add	%o0,	%g5,	%i6
	set	0x45, %o0
	ldsba	[%l7 + %o0] 0x89,	%g3
	movvc	%xcc,	%i2,	%l1
	fpackfix	%f10,	%f4
	or	%l4,	%g1,	%g7
	fmovdvs	%icc,	%f1,	%f1
	tneg	%icc,	0x7
	tgu	%icc,	0x7
	edge32ln	%i5,	%l3,	%i4
	call	loop_1159
	bcc,a	%xcc,	loop_1160
	fpsub32s	%f30,	%f9,	%f19
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
loop_1159:
	fpsub32s	%f29,	%f27,	%f11
loop_1160:
	movrne	%g6,	%i1,	%l6
	tvc	%icc,	0x2
	edge32ln	%o2,	%o3,	%i7
	nop
	setx	0xF73C4ED0E690DC3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xF489E0E95E627DD4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f28,	%f12
	srl	%i0,	0x1B,	%o5
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	tn	%xcc,	0x7
	fmovdvs	%icc,	%f12,	%f16
	tvc	%xcc,	0x5
	nop
	fitod	%f27,	%f28
	fblg	%fcc1,	loop_1161
	add	%l0,	0x1B01,	%o6
	fmovrse	%o4,	%f23,	%f5
	umulcc	%i3,	%l2,	%g4
loop_1161:
	sdivcc	%o7,	0x0964,	%g2
	tne	%icc,	0x4
	movgu	%icc,	%o0,	%o1
	mova	%icc,	%i6,	%g3
	bvs	%icc,	loop_1162
	prefetch	[%l7 + 0x2C],	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g5,	%l1,	%l4
loop_1162:
	stbar
	tsubcc	%i2,	%g7,	%i5
	nop
	fitod	%f8,	%f26
	fdtoi	%f26,	%f22
	ta	%icc,	0x0
	bvs,a,pt	%icc,	loop_1163
	te	%xcc,	0x7
	tn	%icc,	0x4
	lduh	[%l7 + 0x3E],	%g1
loop_1163:
	lduh	[%l7 + 0x40],	%l3
	andn	%i4,	%l5,	%g6
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x28] %asi,	%l6
	edge8ln	%o2,	%o3,	%i1
	movne	%xcc,	%i0,	%i7
	xnorcc	%o5,	0x0A4D,	%o6
	smulcc	%o4,	%l0,	%l2
	fmovdpos	%icc,	%f29,	%f24
	sub	%g4,	%o7,	%g2
	fmovdgu	%xcc,	%f21,	%f28
	membar	0x47
	movrlz	%i3,	0x2EA,	%o1
	movrgez	%o0,	0x137,	%i6
	orncc	%g3,	%g5,	%l4
	mulx	%l1,	0x06F8,	%g7
	bl,a,pn	%xcc,	loop_1164
	fsrc1s	%f2,	%f17
	sra	%i5,	%i2,	%g1
	flush	%l7 + 0x64
loop_1164:
	sdiv	%l3,	0x084C,	%l5
	fmovscc	%xcc,	%f22,	%f30
	andncc	%g6,	%i4,	%l6
	movrgz	%o3,	%i1,	%o2
	movrne	%i0,	0x08A,	%i7
	fnegs	%f24,	%f18
	swap	[%l7 + 0x30],	%o6
	array8	%o5,	%l0,	%o4
	array16	%g4,	%o7,	%g2
	fmovrdgez	%i3,	%f24,	%f2
	alignaddr	%o1,	%o0,	%i6
	sdivx	%g3,	0x1204,	%g5
	move	%icc,	%l2,	%l1
	nop
	fitos	%f8,	%f23
	set	0x3C, %l0
	ldswa	[%l7 + %l0] 0x89,	%g7
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbne	%fcc0,	loop_1165
	edge8	%i5,	%i2,	%l4
	brz,a	%l3,	loop_1166
	subcc	%g1,	%g6,	%i4
loop_1165:
	fmovrde	%l5,	%f10,	%f10
	tgu	%xcc,	0x3
loop_1166:
	fmovsge	%xcc,	%f19,	%f22
	udiv	%o3,	0x15F6,	%l6
	smul	%o2,	%i0,	%i7
	subccc	%o6,	%o5,	%i1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l0,	%o4
	fmovdle	%xcc,	%f25,	%f23
	edge8	%g4,	%o7,	%g2
	fmovrdgez	%o1,	%f30,	%f26
	popc	%o0,	%i3
	tgu	%xcc,	0x4
	fcmpeq32	%f18,	%f10,	%i6
	edge16	%g3,	%l2,	%g5
	fmul8ulx16	%f10,	%f18,	%f0
	tsubcc	%g7,	%l1,	%i2
	popc	%l4,	%i5
	movleu	%icc,	%g1,	%l3
	fandnot2s	%f2,	%f27,	%f30
	tne	%xcc,	0x3
	set	0x30, %l1
	ldstuba	[%l7 + %l1] 0x11,	%i4
	addccc	%l5,	0x1483,	%g6
	movn	%xcc,	%l6,	%o3
	edge32ln	%o2,	%i0,	%i7
	mulscc	%o5,	%i1,	%o6
	ldub	[%l7 + 0x56],	%l0
	edge8	%g4,	%o4,	%g2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o7
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x04,	%o0
	orcc	%i3,	0x09F9,	%o1
	fbuge,a	%fcc1,	loop_1167
	edge32n	%i6,	%l2,	%g5
	movneg	%icc,	%g3,	%g7
	fand	%f22,	%f28,	%f18
loop_1167:
	mova	%xcc,	%i2,	%l1
	ldsb	[%l7 + 0x79],	%l4
	edge8l	%g1,	%l3,	%i4
	movcc	%icc,	%l5,	%i5
	edge8n	%l6,	%g6,	%o2
	nop
	setx	0xA55296B7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f11
	tle	%icc,	0x7
	fmovdleu	%icc,	%f0,	%f21
	edge16l	%o3,	%i7,	%i0
	fmovrse	%i1,	%f8,	%f31
	movl	%xcc,	%o6,	%l0
	fmovdle	%icc,	%f12,	%f23
	umul	%g4,	%o4,	%o5
	fble,a	%fcc3,	loop_1168
	xnor	%g2,	%o7,	%o0
	tn	%icc,	0x0
	srax	%o1,	%i3,	%i6
loop_1168:
	ldd	[%l7 + 0x78],	%f4
	orncc	%g5,	%l2,	%g3
	for	%f30,	%f30,	%f12
	xnorcc	%i2,	0x1814,	%g7
	movrne	%l4,	0x2C5,	%l1
	fmovdgu	%xcc,	%f30,	%f31
	bshuffle	%f10,	%f18,	%f2
	edge8l	%l3,	%g1,	%l5
	set	0x48, %l3
	stxa	%i5,	[%l7 + %l3] 0x0c
	be,a	loop_1169
	udiv	%l6,	0x143A,	%g6
	edge32ln	%o2,	%o3,	%i7
	movgu	%xcc,	%i0,	%i4
loop_1169:
	lduw	[%l7 + 0x68],	%i1
	udiv	%l0,	0x04F2,	%o6
	sdivx	%g4,	0x082D,	%o4
	edge16	%g2,	%o5,	%o7
	xnorcc	%o0,	%o1,	%i6
	mulscc	%i3,	0x1614,	%l2
	fmovsg	%xcc,	%f27,	%f19
	udivx	%g3,	0x081C,	%g5
	nop
	setx	loop_1170,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge	%xcc,	loop_1171
	movvc	%icc,	%g7,	%l4
	fxnor	%f18,	%f8,	%f22
loop_1170:
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f20
	fxtos	%f20,	%f21
loop_1171:
	nop
	setx	0xBEA05743CF58574A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f8
	fblg,a	%fcc2,	loop_1172
	movl	%icc,	%l1,	%l3
	fmovs	%f31,	%f0
	nop
	fitod	%f12,	%f20
	fdtos	%f20,	%f13
loop_1172:
	tneg	%icc,	0x4
	orn	%g1,	0x0084,	%l5
	movvs	%icc,	%i5,	%i2
	fxors	%f19,	%f16,	%f2
	edge32ln	%l6,	%g6,	%o2
	ldd	[%l7 + 0x10],	%f10
	fsrc2s	%f31,	%f18
	movleu	%icc,	%i7,	%i0
	bcc,a,pt	%xcc,	loop_1173
	sir	0x0051
	te	%xcc,	0x4
	fabsd	%f30,	%f26
loop_1173:
	nop
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i4
	movleu	%icc,	%i1,	%l0
	fand	%f28,	%f18,	%f22
	fmovspos	%xcc,	%f9,	%f9
	movn	%xcc,	%o6,	%o3
	alignaddr	%g4,	%g2,	%o4
	sub	%o5,	0x0A78,	%o7
	fpadd32s	%f21,	%f15,	%f25
	edge8	%o1,	%i6,	%o0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	array8	%i3,	%g5,	%g3
	srlx	%g7,	%l4,	%l1
	udiv	%g1,	0x09B1,	%l5
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x50] %asi,	%l3
	tleu	%icc,	0x4
	array16	%i5,	%l6,	%g6
	tsubcctv	%i2,	0x009E,	%o2
	fmovdvc	%xcc,	%f4,	%f13
	movle	%icc,	%i7,	%i0
	sdivcc	%i1,	0x1227,	%l0
	edge8l	%i4,	%o3,	%o6
	set	0x0, %i0
	ldxa	[%g0 + %i0] 0x58,	%g2
	tneg	%xcc,	0x7
	fpmerge	%f22,	%f15,	%f26
	fmovdle	%icc,	%f5,	%f16
	bneg	loop_1174
	movleu	%xcc,	%o4,	%o5
	fnors	%f12,	%f6,	%f18
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x0A] %asi,	%o7
loop_1174:
	edge8l	%o1,	%i6,	%g4
	tneg	%icc,	0x6
	brnz	%l2,	loop_1175
	fmovsle	%icc,	%f30,	%f28
	andn	%i3,	0x1AFE,	%g5
	tvc	%icc,	0x3
loop_1175:
	orn	%o0,	0x1A5D,	%g7
	tleu	%icc,	0x0
	addc	%g3,	0x0484,	%l4
	addcc	%l1,	0x13ED,	%g1
	and	%l3,	%i5,	%l5
	edge32ln	%g6,	%i2,	%o2
	movcs	%xcc,	%i7,	%i0
	xor	%i1,	%l0,	%l6
	edge32l	%i4,	%o3,	%o6
	alignaddrl	%o4,	%g2,	%o7
	movrne	%o5,	0x17A,	%o1
	bl,a	%xcc,	loop_1176
	fabsd	%f4,	%f28
	edge16	%g4,	%l2,	%i3
	edge16	%i6,	%o0,	%g5
loop_1176:
	bl	%icc,	loop_1177
	movrgez	%g7,	%g3,	%l1
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g1
loop_1177:
	addc	%l4,	%l3,	%i5
	orn	%g6,	0x1A45,	%i2
	edge32	%o2,	%i7,	%i0
	fbn	%fcc0,	loop_1178
	tle	%icc,	0x2
	ble,pn	%icc,	loop_1179
	nop
	setx	0x5040E37B,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
loop_1178:
	tsubcc	%l5,	%l0,	%i1
	alignaddr	%i4,	%o3,	%l6
loop_1179:
	fmovdvs	%icc,	%f14,	%f11
	edge32n	%o6,	%o4,	%g2
	te	%xcc,	0x4
	swap	[%l7 + 0x64],	%o5
	ldub	[%l7 + 0x40],	%o7
	edge8n	%g4,	%o1,	%l2
	srl	%i6,	%o0,	%i3
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g7,	%l1,	%g1
	srax	%g3,	0x17,	%l3
	tleu	%xcc,	0x7
	tge	%xcc,	0x7
	fnot1s	%f29,	%f31
	edge16l	%l4,	%g6,	%i5
	tneg	%xcc,	0x6
	edge8ln	%o2,	%i7,	%i2
	movgu	%icc,	%i0,	%l5
	fsrc1s	%f10,	%f20
	edge32l	%l0,	%i1,	%o3
	udiv	%l6,	0x0F6E,	%i4
	xorcc	%o4,	%o6,	%g2
	fbue	%fcc0,	loop_1180
	fmovsl	%icc,	%f13,	%f22
	edge16ln	%o5,	%g4,	%o1
	andncc	%l2,	%o7,	%i6
loop_1180:
	bg,pt	%icc,	loop_1181
	tgu	%icc,	0x0
	brgez,a	%o0,	loop_1182
	fmovsleu	%icc,	%f26,	%f0
loop_1181:
	srax	%g5,	%g7,	%l1
	fmovdgu	%icc,	%f17,	%f19
loop_1182:
	bgu,a	loop_1183
	fandnot1	%f26,	%f26,	%f12
	xnorcc	%i3,	%g3,	%g1
	fmovd	%f26,	%f14
loop_1183:
	xnor	%l3,	%g6,	%i5
	nop
	setx	0x9258EFAC20614365,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	sub	%l4,	%i7,	%o2
	fbule,a	%fcc2,	loop_1184
	edge32n	%i2,	%l5,	%i0
	stbar
	fnot1s	%f12,	%f2
loop_1184:
	fmul8ulx16	%f20,	%f8,	%f22
	movge	%xcc,	%l0,	%o3
	xor	%l6,	0x170C,	%i4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x28] %asi,	%o4
	fnegd	%f22,	%f20
	movvc	%xcc,	%o6,	%i1
	brnz,a	%g2,	loop_1185
	membar	0x17
	tl	%icc,	0x2
	andncc	%g4,	%o5,	%l2
loop_1185:
	nop
	set	0x48, %g7
	lduba	[%l7 + %g7] 0x18,	%o7
	fmovsne	%xcc,	%f14,	%f17
	tge	%xcc,	0x0
	fpsub16	%f26,	%f18,	%f18
	nop
	setx	0x2201C07BED04C81E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x700005C9B50BC526,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f0,	%f18
	tvc	%xcc,	0x3
	movrlz	%i6,	0x3CB,	%o1
	movn	%xcc,	%g5,	%o0
	andncc	%l1,	%g7,	%i3
	fnands	%f30,	%f26,	%f6
	set	0x6D, %g4
	stba	%g3,	[%l7 + %g4] 0x23
	membar	#Sync
	fbule	%fcc1,	loop_1186
	bleu	loop_1187
	subcc	%l3,	%g6,	%g1
	nop
	setx	0xAAA1472F31F14F91,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x5455FE3BC6834EE0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f30,	%f28
loop_1186:
	tn	%icc,	0x6
loop_1187:
	fpmerge	%f17,	%f19,	%f14
	brlz	%i5,	loop_1188
	fandnot1s	%f3,	%f28,	%f21
	edge8	%l4,	%i7,	%i2
	fnot1s	%f23,	%f0
loop_1188:
	edge16n	%o2,	%i0,	%l5
	tpos	%xcc,	0x4
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x88
	tleu	%icc,	0x6
	sll	%o3,	%l0,	%l6
	fmovdle	%xcc,	%f2,	%f19
	fzero	%f12
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sub	%i4,	0x0906,	%o6
	sdiv	%o4,	0x1872,	%g2
	fmovdvs	%xcc,	%f20,	%f5
	alignaddrl	%g4,	%i1,	%l2
	fblg,a	%fcc0,	loop_1189
	fmovscc	%xcc,	%f11,	%f10
	smul	%o5,	%i6,	%o1
	movre	%g5,	%o0,	%o7
loop_1189:
	andn	%l1,	0x0B1A,	%i3
	fnot2	%f22,	%f28
	fmovsge	%icc,	%f5,	%f28
	edge8n	%g7,	%l3,	%g6
	xnorcc	%g3,	%i5,	%l4
	movne	%icc,	%g1,	%i7
	stb	%i2,	[%l7 + 0x62]
	sub	%i0,	0x18B8,	%o2
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
	xnorcc	%l0,	%l6,	%i4
	nop
	setx	0xDBA7D5DA60608046,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	sub	%o6,	0x06B8,	%o4
	brnz,a	%o3,	loop_1190
	movrgez	%g4,	0x0A9,	%g2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%o5
loop_1190:
	orncc	%i6,	%o1,	%l2
	sll	%o0,	%o7,	%l1
	umulcc	%i3,	%g5,	%l3
	tpos	%xcc,	0x5
	addccc	%g6,	%g3,	%g7
	tge	%xcc,	0x0
	array16	%i5,	%g1,	%i7
	set	0x1C, %g3
	stwa	%i2,	[%l7 + %g3] 0x10
	tpos	%icc,	0x1
	brgz,a	%l4,	loop_1191
	bgu	loop_1192
	ldx	[%l7 + 0x48],	%i0
	ldd	[%l7 + 0x10],	%l4
loop_1191:
	tge	%icc,	0x7
loop_1192:
	movvc	%icc,	%o2,	%l0
	fmovscs	%icc,	%f29,	%f16
	ldd	[%l7 + 0x30],	%i4
	edge8	%o6,	%o4,	%l6
	tcs	%icc,	0x2
	fmovd	%f10,	%f26
	brlz	%o3,	loop_1193
	edge8n	%g4,	%i1,	%g2
	tcs	%xcc,	0x0
	edge8ln	%i6,	%o5,	%l2
loop_1193:
	tge	%xcc,	0x6
	faligndata	%f10,	%f16,	%f30
	bg,a,pt	%icc,	loop_1194
	bn	loop_1195
	fmul8x16au	%f21,	%f7,	%f6
	movrne	%o0,	%o7,	%l1
loop_1194:
	fmovscc	%xcc,	%f26,	%f14
loop_1195:
	orncc	%o1,	0x18E5,	%g5
	brlz,a	%i3,	loop_1196
	edge32n	%l3,	%g6,	%g3
	bvs,a,pt	%icc,	loop_1197
	taddcctv	%g7,	%i5,	%g1
loop_1196:
	movleu	%icc,	%i7,	%l4
	orcc	%i0,	%i2,	%o2
loop_1197:
	fmovsvc	%icc,	%f9,	%f0
	popc	0x13D0,	%l0
	fmovscc	%icc,	%f18,	%f12
	subcc	%l5,	0x1284,	%o6
	tn	%xcc,	0x5
	fmovsleu	%xcc,	%f7,	%f19
	nop
	setx	0xD465721FFD23D16D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x2B304D7A2281D767,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f12,	%f0
	tcs	%xcc,	0x6
	movre	%i4,	%o4,	%l6
	nop
	setx	0x4D704A0E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xE6466180,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f10,	%f26
	std	%f30,	[%l7 + 0x68]
	movcc	%icc,	%o3,	%g4
	brnz	%g2,	loop_1198
	movrgez	%i6,	0x136,	%i1
	array16	%o5,	%l2,	%o7
	mova	%xcc,	%o0,	%l1
loop_1198:
	andcc	%o1,	%g5,	%l3
	mulx	%g6,	0x1967,	%i3
	edge8n	%g3,	%i5,	%g1
	sll	%i7,	%g7,	%l4
	fbl	%fcc0,	loop_1199
	srl	%i2,	%o2,	%i0
	or	%l5,	%l0,	%o6
	alignaddr	%i4,	%l6,	%o3
loop_1199:
	movrgz	%o4,	0x316,	%g4
	array32	%i6,	%i1,	%g2
	alignaddr	%l2,	%o5,	%o0
	umulcc	%o7,	0x1EF1,	%o1
	fmul8sux16	%f18,	%f22,	%f30
	umul	%g5,	0x1290,	%l1
	edge8ln	%l3,	%i3,	%g6
	edge32n	%g3,	%i5,	%g1
	bleu,a	%xcc,	loop_1200
	andn	%g7,	%l4,	%i2
	bne	loop_1201
	movcc	%icc,	%o2,	%i7
loop_1200:
	nop
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x80,	%f16
loop_1201:
	fmuld8ulx16	%f22,	%f26,	%f8
	umul	%i0,	%l5,	%o6
	andn	%l0,	%i4,	%o3
	sub	%o4,	%l6,	%g4
	bneg	loop_1202
	movcc	%xcc,	%i6,	%i1
	fxors	%f27,	%f15,	%f1
	edge32n	%l2,	%g2,	%o5
loop_1202:
	fmul8x16al	%f7,	%f18,	%f20
	edge32	%o0,	%o1,	%g5
	movneg	%icc,	%o7,	%l1
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f18
	fxtos	%f18,	%f0
	movpos	%xcc,	%i3,	%g6
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f30
	set	0x0E, %o3
	stha	%g3,	[%l7 + %o3] 0x10
	fbo	%fcc0,	loop_1203
	movrgez	%l3,	%i5,	%g7
	nop
	fitod	%f0,	%f18
	fdtoi	%f18,	%f9
	nop
	setx	loop_1204,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1203:
	fmovdcc	%icc,	%f18,	%f14
	andcc	%l4,	0x1A30,	%i2
	udivcc	%o2,	0x1E4B,	%i7
loop_1204:
	movvc	%xcc,	%i0,	%l5
	movcs	%icc,	%g1,	%l0
	movle	%xcc,	%o6,	%i4
	edge16ln	%o3,	%o4,	%g4
	mulx	%i6,	0x05BB,	%i1
	movge	%icc,	%l2,	%l6
	edge32l	%g2,	%o0,	%o1
	udivcc	%o5,	0x0213,	%o7
	nop
	setx	0xAAB2841DD08FA56E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f20
	taddcc	%g5,	%l1,	%g6
	fcmpgt32	%f24,	%f28,	%i3
	sdivx	%g3,	0x1100,	%i5
	fpadd16	%f2,	%f28,	%f14
	fmovsvc	%icc,	%f21,	%f4
	fnands	%f20,	%f17,	%f27
	fbo,a	%fcc0,	loop_1205
	tvs	%icc,	0x6
	fmovdne	%icc,	%f31,	%f16
	brnz,a	%g7,	loop_1206
loop_1205:
	fmovdge	%icc,	%f18,	%f19
	fmovrdlez	%l4,	%f4,	%f16
	movrlez	%l3,	%i2,	%o2
loop_1206:
	alignaddrl	%i0,	%l5,	%i7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x80,	%g1,	%o6
	tsubcc	%l0,	0x1551,	%o3
	move	%xcc,	%i4,	%g4
	tg	%xcc,	0x6
	bn,a	%icc,	loop_1207
	brz	%i6,	loop_1208
	smulcc	%o4,	%i1,	%l6
	flush	%l7 + 0x1C
loop_1207:
	srlx	%g2,	%o0,	%l2
loop_1208:
	array8	%o5,	%o1,	%g5
	nop
	setx	0x404828F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	movgu	%icc,	%o7,	%g6
	movrgz	%l1,	%g3,	%i3
	xnor	%i5,	0x1F70,	%l4
	mulx	%l3,	%g7,	%o2
	umul	%i0,	0x1256,	%i2
	sdivx	%i7,	0x0961,	%l5
	ld	[%l7 + 0x28],	%f29
	fpadd32	%f10,	%f18,	%f8
	std	%f8,	[%l7 + 0x08]
	sir	0x1D17
	nop
	fitod	%f10,	%f4
	nop
	setx	0xBB0B4E42DBABCCA3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE513FC6CBC38EE26,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f2,	%f28
	tle	%xcc,	0x1
	brlz	%g1,	loop_1209
	nop
	setx	loop_1210,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpack16	%f14,	%f22
	set	0x10, %o5
	lduha	[%l7 + %o5] 0x89,	%o6
loop_1209:
	ba,a	loop_1211
loop_1210:
	sll	%o3,	%i4,	%l0
	nop
	setx	0xA074A60D,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	fbo	%fcc2,	loop_1212
loop_1211:
	movre	%g4,	%o4,	%i1
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f8
	fxtod	%f8,	%f4
	bg,pt	%icc,	loop_1213
loop_1212:
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f8
	fxtod	%f8,	%f4
	movvs	%icc,	%l6,	%i6
	edge8n	%g2,	%o0,	%l2
loop_1213:
	edge8ln	%o1,	%g5,	%o5
	move	%xcc,	%g6,	%o7
	tpos	%icc,	0x2
	tvs	%xcc,	0x2
	st	%f1,	[%l7 + 0x54]
	fbul,a	%fcc0,	loop_1214
	sub	%l1,	%i3,	%i5
	brnz	%l4,	loop_1215
	tsubcc	%l3,	0x165F,	%g3
loop_1214:
	srax	%o2,	%i0,	%g7
	srlx	%i7,	0x13,	%l5
loop_1215:
	brlez	%i2,	loop_1216
	fmovdpos	%icc,	%f13,	%f1
	movneg	%icc,	%o6,	%g1
	sllx	%o3,	%i4,	%l0
loop_1216:
	xor	%g4,	0x1ABC,	%o4
	udiv	%l6,	0x05AF,	%i6
	andcc	%g2,	%o0,	%l2
	fblg	%fcc3,	loop_1217
	fsrc1s	%f0,	%f0
	movgu	%xcc,	%i1,	%o1
	fmovsleu	%icc,	%f27,	%f0
loop_1217:
	ba,pn	%icc,	loop_1218
	fxnors	%f9,	%f19,	%f22
	taddcc	%g5,	%o5,	%o7
	bl,pt	%icc,	loop_1219
loop_1218:
	fpackfix	%f20,	%f2
	and	%g6,	0x0D1E,	%l1
	movrlz	%i3,	0x2DB,	%l4
loop_1219:
	fbug,a	%fcc2,	loop_1220
	movneg	%xcc,	%l3,	%g3
	andn	%i5,	0x0565,	%i0
	alignaddr	%g7,	%o2,	%i7
loop_1220:
	andncc	%l5,	%o6,	%g1
	andcc	%i2,	0x05F9,	%i4
	mova	%xcc,	%l0,	%o3
	edge32ln	%o4,	%g4,	%l6
	sll	%i6,	%o0,	%l2
	fones	%f12
	fnands	%f10,	%f8,	%f6
	sth	%i1,	[%l7 + 0x12]
	edge32n	%g2,	%g5,	%o5
	bn,a,pt	%xcc,	loop_1221
	sllx	%o7,	%g6,	%o1
	subccc	%i3,	0x0DE8,	%l1
	fpmerge	%f5,	%f25,	%f22
loop_1221:
	edge32ln	%l3,	%l4,	%g3
	srlx	%i0,	%i5,	%o2
	edge32ln	%i7,	%g7,	%o6
	stbar
	array16	%g1,	%l5,	%i2
	orn	%l0,	%i4,	%o4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x63] %asi,	%o3
	nop
	setx	loop_1222,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andn	%l6,	0x1FB8,	%g4
	st	%f11,	[%l7 + 0x08]
	tsubcc	%o0,	0x04F4,	%i6
loop_1222:
	xnorcc	%l2,	%i1,	%g2
	fcmple32	%f2,	%f28,	%g5
	std	%f20,	[%l7 + 0x50]
	bneg,a,pt	%icc,	loop_1223
	nop
	setx	loop_1224,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%o7,	%o5,	%g6
	fpsub16	%f2,	%f10,	%f16
loop_1223:
	stb	%o1,	[%l7 + 0x6C]
loop_1224:
	nop
	wr	%g0,	0x2b,	%asi
	stba	%i3,	[%l7 + 0x1E] %asi
	membar	#Sync
	sdiv	%l1,	0x1A93,	%l4
	nop
	setx	0xA06F3744,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	subcc	%l3,	0x1D27,	%g3
	bg	%icc,	loop_1225
	tge	%icc,	0x1
	fbe	%fcc3,	loop_1226
	edge8n	%i0,	%o2,	%i5
loop_1225:
	alignaddr	%g7,	%i7,	%g1
	fblg,a	%fcc1,	loop_1227
loop_1226:
	srax	%l5,	%i2,	%o6
	fmovrsgez	%l0,	%f6,	%f11
	fmovsl	%icc,	%f18,	%f12
loop_1227:
	fmul8x16al	%f8,	%f11,	%f26
	pdist	%f0,	%f6,	%f14
	brlez,a	%o4,	loop_1228
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xAC86712F9E696125,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f26
	subc	%o3,	%i4,	%l6
loop_1228:
	umul	%o0,	%g4,	%i6
	movleu	%icc,	%l2,	%i1
	wr	%g0,	0xeb,	%asi
	stba	%g2,	[%l7 + 0x40] %asi
	membar	#Sync
	flush	%l7 + 0x68
	tgu	%icc,	0x7
	fbn	%fcc1,	loop_1229
	or	%o7,	0x0B3B,	%o5
	addc	%g5,	0x1915,	%g6
	stbar
loop_1229:
	xor	%i3,	%l1,	%l4
	tge	%xcc,	0x2
	ldsh	[%l7 + 0x5A],	%o1
	andn	%l3,	0x042B,	%i0
	sllx	%g3,	%i5,	%g7
	xnorcc	%o2,	0x0A7B,	%i7
	add	%g1,	%i2,	%o6
	movneg	%icc,	%l5,	%o4
	array16	%o3,	%l0,	%l6
	stx	%i4,	[%l7 + 0x50]
	udivcc	%g4,	0x0872,	%o0
	tvs	%xcc,	0x2
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x89
	fmovda	%xcc,	%f13,	%f23
	andcc	%i6,	%i1,	%l2
	move	%xcc,	%g2,	%o5
	tge	%xcc,	0x0
	tgu	%xcc,	0x3
	tge	%icc,	0x7
	wr	%g0,	0x89,	%asi
	sta	%f5,	[%l7 + 0x64] %asi
	orncc	%o7,	0x0F38,	%g5
	fmovdl	%icc,	%f5,	%f28
	fble,a	%fcc0,	loop_1230
	alignaddrl	%g6,	%l1,	%l4
	andn	%o1,	%l3,	%i3
	edge32n	%g3,	%i0,	%i5
loop_1230:
	sdivx	%o2,	0x0FE1,	%i7
	brlz	%g7,	loop_1231
	bvs	loop_1232
	fmovd	%f0,	%f0
	brgez	%g1,	loop_1233
loop_1231:
	taddcctv	%i2,	%l5,	%o4
loop_1232:
	tcc	%xcc,	0x4
	addccc	%o6,	0x1D99,	%l0
loop_1233:
	nop
	setx	0xEFF27A06,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x0EE50C04,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f2,	%f3
	fmovrdne	%o3,	%f20,	%f0
	xorcc	%i4,	0x0EDD,	%g4
	sll	%o0,	0x15,	%i6
	set	0x38, %o1
	stxa	%i1,	[%l7 + %o1] 0x2f
	membar	#Sync
	mova	%xcc,	%l2,	%l6
	bcs	%icc,	loop_1234
	movvc	%xcc,	%o5,	%g2
	fmovrslez	%o7,	%f30,	%f23
	tcc	%xcc,	0x3
loop_1234:
	movcs	%xcc,	%g6,	%g5
	movn	%icc,	%l4,	%o1
	edge32n	%l3,	%i3,	%l1
	andn	%g3,	0x0A57,	%i0
	fmovrsgz	%i5,	%f18,	%f8
	fbne,a	%fcc3,	loop_1235
	ldub	[%l7 + 0x34],	%o2
	edge8ln	%i7,	%g1,	%i2
	set	0x72, %o6
	ldsba	[%l7 + %o6] 0x18,	%l5
loop_1235:
	fmovsneg	%icc,	%f16,	%f30
	fmovscc	%icc,	%f27,	%f19
	movvs	%xcc,	%o4,	%o6
	umulcc	%l0,	0x0B94,	%g7
	st	%f25,	[%l7 + 0x58]
	orncc	%i4,	%g4,	%o0
	fmovdneg	%xcc,	%f27,	%f6
	tg	%xcc,	0x5
	fmovrdgz	%i6,	%f10,	%f30
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0E] %asi,	%o3
	edge32ln	%l2,	%i1,	%o5
	nop
	setx	0xF9374338A046575A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	movcs	%icc,	%g2,	%o7
	tvc	%xcc,	0x2
	edge8ln	%l6,	%g5,	%l4
	edge32	%o1,	%l3,	%g6
	set	0x69, %l4
	ldsba	[%l7 + %l4] 0x80,	%i3
	tcc	%xcc,	0x4
	fbule,a	%fcc2,	loop_1236
	fnor	%f24,	%f18,	%f16
	smulcc	%l1,	%i0,	%g3
	tn	%icc,	0x1
loop_1236:
	nop
	set	0x0C, %l6
	lduha	[%l7 + %l6] 0x89,	%o2
	udivx	%i7,	0x0FDA,	%g1
	movvc	%xcc,	%i5,	%l5
	taddcctv	%i2,	0x0A1B,	%o4
	bvs	loop_1237
	edge8l	%l0,	%g7,	%i4
	srl	%o6,	0x03,	%g4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
loop_1237:
	smulcc	%o3,	%l2,	%i6
	bneg,pt	%icc,	loop_1238
	movneg	%icc,	%o5,	%g2
	movrgz	%i1,	0x02C,	%o7
	for	%f20,	%f12,	%f18
loop_1238:
	fone	%f0
	tvc	%xcc,	0x7
	edge16ln	%l6,	%g5,	%l4
	fmovrdgez	%o1,	%f8,	%f22
	fpadd16	%f4,	%f4,	%f30
	subccc	%l3,	0x10BA,	%g6
	nop
	setx	0xF9847BBC105C2A38,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	nop
	fitod	%f8,	%f20
	fdtox	%f20,	%f24
	ldd	[%l7 + 0x78],	%i2
	movrgz	%l1,	0x3BA,	%i0
	fpackfix	%f8,	%f14
	fpmerge	%f19,	%f9,	%f0
	set	0x5C, %i1
	swapa	[%l7 + %i1] 0x04,	%o2
	srl	%i7,	%g3,	%g1
	edge16ln	%l5,	%i5,	%i2
	fxnor	%f4,	%f14,	%f10
	fbue	%fcc3,	loop_1239
	tleu	%icc,	0x2
	srlx	%l0,	0x0D,	%g7
	andncc	%o4,	%o6,	%g4
loop_1239:
	tgu	%icc,	0x5
	fmovdle	%icc,	%f0,	%f0
	tgu	%icc,	0x1
	edge8	%o0,	%o3,	%i4
	edge8n	%i6,	%l2,	%o5
	fmovsgu	%xcc,	%f21,	%f1
	move	%xcc,	%i1,	%g2
	sra	%o7,	%l6,	%g5
	stx	%l4,	[%l7 + 0x58]
	nop
	set	0x08, %o2
	std	%f28,	[%l7 + %o2]
	sll	%o1,	%l3,	%g6
	fandnot2s	%f25,	%f17,	%f20
	fpadd32	%f14,	%f26,	%f18
	tneg	%icc,	0x3
	sdiv	%l1,	0x11C8,	%i3
	movgu	%icc,	%o2,	%i0
	std	%f18,	[%l7 + 0x78]
	nop
	setx	0x4FDCAA64E062858C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fmovsneg	%icc,	%f10,	%f8
	tcs	%icc,	0x6
	srax	%g3,	%g1,	%l5
	fsrc1s	%f27,	%f28
	edge16	%i5,	%i7,	%l0
	nop
	setx loop_1240, %l0, %l1
	jmpl %l1, %g7
	nop
	set	0x4F, %l2
	stb	%i2,	[%l7 + %l2]
	nop
	setx	0x1541FEBED07B02C4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	set	0x5E, %i5
	stba	%o4,	[%l7 + %i5] 0x11
loop_1240:
	tge	%icc,	0x5
	tg	%icc,	0x7
	fabsd	%f26,	%f6
	fmovrdgz	%g4,	%f28,	%f8
	andn	%o0,	0x15B8,	%o3
	movneg	%xcc,	%i4,	%i6
	nop
	fitos	%f30,	%f15
	prefetch	[%l7 + 0x30],	 0x1
	tle	%xcc,	0x4
	xnorcc	%o6,	0x03C0,	%o5
	movrgz	%i1,	0x29F,	%g2
	bshuffle	%f24,	%f22,	%f26
	fble,a	%fcc3,	loop_1241
	flush	%l7 + 0x48
	bg,pn	%icc,	loop_1242
	sdivcc	%l2,	0x0896,	%o7
loop_1241:
	edge16n	%l6,	%l4,	%o1
	srl	%g5,	0x0D,	%l3
loop_1242:
	add	%g6,	%i3,	%l1
	bl,a	%xcc,	loop_1243
	bg	%icc,	loop_1244
	fornot2	%f24,	%f14,	%f30
	tge	%xcc,	0x7
loop_1243:
	nop
	setx	0x2E76012C80512DD3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_1244:
	fblg,a	%fcc3,	loop_1245
	andncc	%o2,	%g3,	%g1
	movvc	%xcc,	%l5,	%i5
	smulcc	%i0,	0x1E59,	%l0
loop_1245:
	mulx	%i7,	%i2,	%g7
	fmovsgu	%xcc,	%f14,	%f11
	fmovsgu	%icc,	%f21,	%f26
	tleu	%icc,	0x5
	movle	%xcc,	%o4,	%g4
	or	%o0,	%i4,	%i6
	edge16n	%o6,	%o5,	%o3
	taddcc	%i1,	%g2,	%l2
	bpos,pt	%xcc,	loop_1246
	fnot2	%f0,	%f8
	fba,a	%fcc1,	loop_1247
	fmovrdgez	%o7,	%f6,	%f24
loop_1246:
	fmovsvs	%xcc,	%f7,	%f16
	set	0x3E, %o4
	lduba	[%l7 + %o4] 0x80,	%l4
loop_1247:
	tge	%xcc,	0x7
	brz,a	%l6,	loop_1248
	movrlez	%g5,	0x2D9,	%l3
	fpmerge	%f26,	%f25,	%f14
	edge32n	%o1,	%i3,	%g6
loop_1248:
	edge8ln	%o2,	%l1,	%g3
	sdivx	%l5,	0x07FE,	%i5
	movrlz	%g1,	%l0,	%i7
	fmovdcc	%xcc,	%f14,	%f22
	tpos	%icc,	0x7
	popc	%i2,	%i0
	subccc	%g7,	0x0185,	%g4
	tsubcctv	%o0,	0x1373,	%o4
	tpos	%icc,	0x6
	fcmpgt32	%f0,	%f20,	%i6
	ldd	[%l7 + 0x10],	%o6
	xor	%o5,	0x16D9,	%i4
	tne	%xcc,	0x0
	movle	%xcc,	%i1,	%o3
	tpos	%xcc,	0x3
	umul	%l2,	0x0B48,	%o7
	addccc	%g2,	0x18A0,	%l6
	nop
	setx	loop_1249,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fba	%fcc0,	loop_1250
	edge16l	%g5,	%l3,	%l4
	tn	%xcc,	0x7
loop_1249:
	array16	%o1,	%i3,	%g6
loop_1250:
	udivx	%o2,	0x094C,	%g3
	tvs	%xcc,	0x4
	tcs	%xcc,	0x6
	tl	%icc,	0x5
	xorcc	%l5,	0x1AE9,	%i5
	movcc	%xcc,	%g1,	%l0
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x0C] %asi,	%f15
	tsubcc	%i7,	0x0969,	%l1
	nop
	setx	0x8444398E8381BE0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f12
	edge16l	%i2,	%g7,	%g4
	tg	%xcc,	0x0
	bpos,pn	%icc,	loop_1251
	ldsb	[%l7 + 0x7F],	%i0
	nop
	fitod	%f0,	%f10
	fdtoi	%f10,	%f30
	fbule	%fcc3,	loop_1252
loop_1251:
	te	%icc,	0x3
	movrlez	%o4,	0x359,	%i6
	set	0x58, %o7
	stha	%o0,	[%l7 + %o7] 0xeb
	membar	#Sync
loop_1252:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x20] %asi,	%o4
	movvc	%icc,	%i4,	%i1
	movn	%icc,	%o3,	%l2
	set	0x38, %g2
	lduha	[%l7 + %g2] 0x10,	%o6
	fexpand	%f26,	%f2
	move	%icc,	%o7,	%g2
	fmovsg	%xcc,	%f29,	%f26
	addc	%l6,	%l3,	%l4
	edge16ln	%o1,	%g5,	%i3
	set	0x2D, %i4
	ldstuba	[%l7 + %i4] 0x80,	%o2
	tpos	%xcc,	0x6
	fmovsn	%xcc,	%f21,	%f10
	bvs,pt	%xcc,	loop_1253
	tpos	%icc,	0x7
	sth	%g6,	[%l7 + 0x3C]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1253:
	addcc	%l5,	0x0477,	%i5
	tleu	%icc,	0x7
	movg	%icc,	%g3,	%g1
	subcc	%i7,	%l0,	%l1
	edge32ln	%g7,	%g4,	%i2
	stbar
	movl	%xcc,	%o4,	%i0
	xor	%o0,	0x0EB6,	%i6
	tsubcc	%i4,	%i1,	%o3
	fbu,a	%fcc1,	loop_1254
	fbu	%fcc0,	loop_1255
	addcc	%l2,	0x1146,	%o6
	add	%o5,	%g2,	%o7
loop_1254:
	tl	%icc,	0x6
loop_1255:
	bn,a,pt	%icc,	loop_1256
	umulcc	%l6,	0x1CFF,	%l3
	tgu	%xcc,	0x5
	fmovde	%icc,	%f15,	%f4
loop_1256:
	orcc	%l4,	0x0361,	%g5
	movgu	%xcc,	%i3,	%o1
	set	0x3C, %l5
	ldswa	[%l7 + %l5] 0x88,	%o2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g6
	srax	%i5,	0x17,	%g3
	movn	%icc,	%l5,	%g1
	addcc	%i7,	0x1F3A,	%l0
	fmovdleu	%xcc,	%f11,	%f30
	fmul8ulx16	%f14,	%f28,	%f2
	mova	%xcc,	%g7,	%l1
	andcc	%i2,	%o4,	%i0
	srl	%g4,	0x03,	%o0
	brlz,a	%i6,	loop_1257
	smulcc	%i1,	0x0DB9,	%o3
	xnorcc	%l2,	%i4,	%o6
	sdivcc	%o5,	0x1533,	%g2
loop_1257:
	fbg,a	%fcc1,	loop_1258
	fmovda	%icc,	%f20,	%f5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x45] %asi,	%o7
loop_1258:
	tpos	%xcc,	0x5
	stbar
	or	%l3,	%l4,	%l6
	mulscc	%g5,	%o1,	%o2
	udiv	%g6,	0x0FD3,	%i5
	nop
	setx loop_1259, %l0, %l1
	jmpl %l1, %g3
	fpmerge	%f19,	%f12,	%f28
	lduh	[%l7 + 0x7A],	%l5
	edge8ln	%g1,	%i7,	%l0
loop_1259:
	movgu	%xcc,	%g7,	%i3
	be,a	loop_1260
	brnz,a	%i2,	loop_1261
	bgu,a	loop_1262
	stb	%o4,	[%l7 + 0x69]
loop_1260:
	fornot1	%f16,	%f0,	%f18
loop_1261:
	xnorcc	%i0,	%g4,	%l1
loop_1262:
	fbul,a	%fcc0,	loop_1263
	swap	[%l7 + 0x4C],	%i6
	umul	%i1,	0x17AE,	%o0
	fnors	%f8,	%f3,	%f21
loop_1263:
	movvs	%icc,	%l2,	%i4
	tge	%icc,	0x1
	brlez	%o3,	loop_1264
	xnor	%o6,	%o5,	%o7
	movrne	%g2,	%l3,	%l4
	bpos,pt	%xcc,	loop_1265
loop_1264:
	orncc	%l6,	%o1,	%g5
	tge	%icc,	0x1
	set	0x60, %i6
	lduha	[%l7 + %i6] 0x15,	%o2
loop_1265:
	fmovrdlez	%g6,	%f22,	%f10
	sra	%g3,	%i5,	%g1
	xorcc	%l5,	0x05C4,	%i7
	tpos	%xcc,	0x5
	tge	%xcc,	0x3
	bpos,a,pn	%icc,	loop_1266
	fmovde	%xcc,	%f18,	%f18
	movne	%xcc,	%g7,	%l0
	fandnot1s	%f0,	%f11,	%f17
loop_1266:
	edge8	%i2,	%i3,	%o4
	mulscc	%g4,	0x100A,	%l1
	tcs	%xcc,	0x4
	edge16l	%i0,	%i1,	%o0
	movcs	%icc,	%l2,	%i4
	membar	0x60
	movrgez	%i6,	0x06E,	%o6
	fnegd	%f12,	%f2
	andncc	%o5,	%o3,	%o7
	edge16l	%l3,	%l4,	%l6
	movg	%xcc,	%g2,	%g5
	fnot1s	%f7,	%f23
	call	loop_1267
	movne	%xcc,	%o2,	%o1
	movcs	%xcc,	%g3,	%i5
	andn	%g1,	0x0B59,	%l5
loop_1267:
	nop
	fitos	%f7,	%f27
	fstod	%f27,	%f24
	st	%f27,	[%l7 + 0x14]
	fbug	%fcc2,	loop_1268
	movne	%icc,	%g6,	%g7
	ldsw	[%l7 + 0x40],	%l0
	movneg	%icc,	%i7,	%i2
loop_1268:
	brlz,a	%o4,	loop_1269
	movvs	%icc,	%i3,	%l1
	udivx	%g4,	0x0A6E,	%i0
	wr	%g0,	0xe3,	%asi
	stha	%o0,	[%l7 + 0x6A] %asi
	membar	#Sync
loop_1269:
	subcc	%l2,	%i4,	%i1
	movrlez	%i6,	%o5,	%o6
	movrgz	%o7,	0x3A1,	%l3
	std	%f30,	[%l7 + 0x40]
	wr	%g0,	0x80,	%asi
	stba	%l4,	[%l7 + 0x4F] %asi
	move	%icc,	%l6,	%g2
	sllx	%o3,	0x06,	%o2
	bvs,pn	%xcc,	loop_1270
	sub	%g5,	0x0C40,	%o1
	srlx	%g3,	0x0C,	%i5
	and	%g1,	0x0BD1,	%l5
loop_1270:
	sir	0x0D3C
	sth	%g7,	[%l7 + 0x2E]
	bge	%xcc,	loop_1271
	tvc	%icc,	0x1
	fpadd32	%f28,	%f26,	%f8
	fmovdcs	%icc,	%f4,	%f5
loop_1271:
	bvs,a	%icc,	loop_1272
	ldsw	[%l7 + 0x3C],	%g6
	udivx	%l0,	0x1AF8,	%i2
	fmovsg	%xcc,	%f4,	%f26
loop_1272:
	orcc	%o4,	0x0A2C,	%i7
	fcmpgt32	%f12,	%f20,	%l1
	or	%g4,	%i3,	%o0
	ldd	[%l7 + 0x38],	%i0
	tg	%icc,	0x5
	fblg	%fcc1,	loop_1273
	te	%xcc,	0x6
	taddcc	%i4,	0x0912,	%l2
	fmovrslz	%i6,	%f20,	%f28
loop_1273:
	fnand	%f20,	%f18,	%f10
	nop
	setx	loop_1274,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tgu	%xcc,	0x3
	andncc	%i1,	%o6,	%o7
	fmovscc	%xcc,	%f1,	%f12
loop_1274:
	orncc	%o5,	%l4,	%l6
	fmovdvc	%icc,	%f8,	%f30
	stbar
	bcs,pn	%xcc,	loop_1275
	movneg	%icc,	%g2,	%o3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
loop_1275:
	fbule	%fcc2,	loop_1276
	tl	%xcc,	0x5
	addc	%o2,	%o1,	%g3
	alignaddr	%g5,	%i5,	%g1
loop_1276:
	movvc	%icc,	%g7,	%l5
	edge8n	%g6,	%l0,	%o4
	te	%icc,	0x0
	prefetch	[%l7 + 0x28],	 0x3
	sdivx	%i7,	0x0CE4,	%l1
	mulx	%i2,	0x1A6F,	%g4
	tle	%icc,	0x6
	addc	%i3,	0x0A80,	%o0
	tle	%icc,	0x1
	tne	%icc,	0x1
	fmovdvs	%xcc,	%f17,	%f14
	fmovdleu	%icc,	%f12,	%f19
	array16	%i4,	%i0,	%i6
	fmovrdne	%l2,	%f4,	%f30
	edge32n	%i1,	%o6,	%o7
	fbule,a	%fcc3,	loop_1277
	subccc	%o5,	%l4,	%l6
	sir	0x05A4
	edge16n	%o3,	%g2,	%l3
loop_1277:
	move	%icc,	%o1,	%g3
	edge16	%g5,	%o2,	%g1
	nop
	fitos	%f6,	%f23
	sir	0x1254
	addccc	%i5,	%g7,	%l5
	movgu	%xcc,	%g6,	%l0
	taddcctv	%i7,	0x1286,	%o4
	bge,pn	%icc,	loop_1278
	mova	%icc,	%i2,	%g4
	tpos	%xcc,	0x3
	andn	%l1,	%i3,	%i4
loop_1278:
	movrlez	%i0,	%o0,	%l2
	tl	%xcc,	0x0
	edge16l	%i6,	%i1,	%o6
	fbu	%fcc2,	loop_1279
	bg,a	loop_1280
	fmovd	%f8,	%f24
	fnors	%f28,	%f28,	%f16
loop_1279:
	membar	0x32
loop_1280:
	orncc	%o5,	%l4,	%o7
	stbar
	sir	0x0ACB
	umul	%l6,	0x19D2,	%o3
	movrlz	%l3,	%o1,	%g3
	edge32l	%g2,	%g5,	%g1
	fbue	%fcc3,	loop_1281
	ba	%xcc,	loop_1282
	ble,a,pn	%xcc,	loop_1283
	nop
	setx loop_1284, %l0, %l1
	jmpl %l1, %o2
loop_1281:
	popc	0x0B67,	%g7
loop_1282:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1283:
	fmovsge	%xcc,	%f26,	%f0
loop_1284:
	sub	%l5,	%i5,	%l0
	set	0x10, %g6
	stxa	%i7,	[%g0 + %g6] 0x21
	set	0x38, %i3
	ldswa	[%l7 + %i3] 0x19,	%g6
	movgu	%icc,	%i2,	%o4
	subcc	%l1,	%g4,	%i3
	edge8ln	%i4,	%i0,	%l2
	tl	%xcc,	0x6
	fmuld8sux16	%f20,	%f30,	%f16
	movrne	%o0,	0x019,	%i1
	subccc	%o6,	%i6,	%l4
	edge8n	%o7,	%l6,	%o3
	array16	%l3,	%o5,	%g3
	fblg,a	%fcc3,	loop_1285
	tleu	%icc,	0x2
	fpadd16	%f22,	%f30,	%f10
	movrgez	%g2,	%o1,	%g1
loop_1285:
	ldsw	[%l7 + 0x70],	%o2
	bvc,pn	%xcc,	loop_1286
	pdist	%f28,	%f22,	%f4
	nop
	fitos	%f4,	%f16
	fstoi	%f16,	%f19
	ldsh	[%l7 + 0x7C],	%g5
loop_1286:
	tleu	%icc,	0x0
	movrgz	%g7,	0x1DD,	%i5
	srl	%l5,	0x13,	%i7
	edge32	%g6,	%l0,	%i2
	andcc	%o4,	%l1,	%i3
	subccc	%i4,	0x041D,	%g4
	tne	%xcc,	0x4
	movrgz	%i0,	0x02A,	%o0
	fnand	%f18,	%f28,	%f14
	ble,a,pn	%xcc,	loop_1287
	umulcc	%i1,	0x1AEC,	%o6
	xnorcc	%l2,	0x18F8,	%l4
	ta	%icc,	0x0
loop_1287:
	addc	%i6,	%l6,	%o3
	movre	%o7,	0x325,	%o5
	tl	%xcc,	0x7
	tne	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	sta	%f9,	[%l7 + 0x58] %asi
	movneg	%icc,	%g3,	%l3
	fba,a	%fcc3,	loop_1288
	tgu	%icc,	0x6
	fabsd	%f6,	%f12
	fandnot1	%f24,	%f16,	%f6
loop_1288:
	mulx	%o1,	%g2,	%o2
	movcs	%icc,	%g5,	%g7
	fexpand	%f26,	%f0
	nop
	setx	0xC8B4074F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xB937E128,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f25,	%f19
	fandnot2s	%f28,	%f23,	%f18
	addc	%g1,	%i5,	%l5
	sllx	%i7,	%l0,	%g6
	tn	%xcc,	0x6
	alignaddrl	%o4,	%i2,	%l1
	add	%i4,	0x1935,	%g4
	bge,a	%xcc,	loop_1289
	tvs	%icc,	0x2
	movpos	%xcc,	%i3,	%i0
	edge32n	%o0,	%i1,	%o6
loop_1289:
	ta	%icc,	0x6
	movvc	%icc,	%l4,	%i6
	alignaddr	%l6,	%l2,	%o3
	edge16l	%o5,	%o7,	%g3
	fmovsvs	%xcc,	%f24,	%f16
	movcs	%xcc,	%l3,	%g2
	andn	%o1,	0x13FC,	%g5
	movcs	%xcc,	%o2,	%g7
	edge16	%i5,	%l5,	%g1
	fnand	%f4,	%f10,	%f6
	tvc	%icc,	0x7
	fmovdvs	%xcc,	%f19,	%f1
	udiv	%l0,	0x00E5,	%i7
	nop
	setx loop_1290, %l0, %l1
	jmpl %l1, %g6
	fmovsvc	%icc,	%f29,	%f8
	fsrc2	%f4,	%f4
	edge8l	%i2,	%o4,	%i4
loop_1290:
	fmovrdgz	%g4,	%f28,	%f8
	fmovdneg	%xcc,	%f9,	%f12
	taddcctv	%l1,	0x01B4,	%i0
	nop
	setx	0x904E37CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	ldsh	[%l7 + 0x5E],	%o0
	nop
	fitos	%f4,	%f1
	fstox	%f1,	%f14
	fxtos	%f14,	%f13
	and	%i3,	0x1EAE,	%o6
	fmovse	%xcc,	%f24,	%f30
	subc	%i1,	0x0C35,	%l4
	nop
	setx	0x0574A4B293F1B06E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x49897FDE33723644,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f12,	%f26
	sethi	0x139A,	%l6
	or	%i6,	0x136A,	%o3
	sllx	%o5,	0x17,	%o7
	tge	%icc,	0x5
	te	%icc,	0x3
	fmovdge	%icc,	%f8,	%f14
	tgu	%icc,	0x1
	edge8ln	%l2,	%g3,	%l3
	nop
	fitos	%f9,	%f5
	fstoi	%f5,	%f11
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o1,	[%g0 + 0x328] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	xnor	%g2,	0x1A4B,	%o2
	nop
	setx	0x4357B34F13AE94D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x8A076C551D67C905,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f14,	%f22
	alignaddrl	%g5,	%g7,	%i5
	fbul,a	%fcc3,	loop_1291
	edge32ln	%l5,	%l0,	%i7
	edge8l	%g6,	%g1,	%i2
	te	%xcc,	0x6
loop_1291:
	subc	%o4,	0x06B8,	%g4
	tcc	%icc,	0x1
	subccc	%i4,	%i0,	%l1
	fbuge,a	%fcc0,	loop_1292
	popc	0x015F,	%i3
	fmovdg	%xcc,	%f21,	%f0
	fmuld8ulx16	%f22,	%f20,	%f10
loop_1292:
	fpsub16	%f10,	%f18,	%f20
	movge	%icc,	%o0,	%i1
	movn	%xcc,	%l4,	%o6
	fpadd32s	%f29,	%f5,	%f19
	bn,a	%icc,	loop_1293
	move	%icc,	%l6,	%i6
	movgu	%xcc,	%o3,	%o5
	fpack16	%f22,	%f15
loop_1293:
	fblg,a	%fcc3,	loop_1294
	fmovsvs	%xcc,	%f25,	%f28
	srax	%o7,	0x07,	%l2
	swap	[%l7 + 0x48],	%l3
loop_1294:
	movge	%icc,	%g3,	%g2
	srlx	%o1,	%g5,	%o2
	fmovsne	%icc,	%f11,	%f17
	movcc	%xcc,	%i5,	%g7
	subc	%l5,	0x168D,	%i7
	array32	%l0,	%g1,	%i2
	fmovda	%icc,	%f18,	%f11
	edge16l	%g6,	%o4,	%g4
	set	0x50, %l0
	ldda	[%l7 + %l0] 0x80,	%i0
	orncc	%l1,	%i4,	%i3
	movgu	%xcc,	%o0,	%l4
	udiv	%o6,	0x1DBF,	%l6
	nop
	fitos	%f0,	%f14
	fstox	%f14,	%f6
	ldsw	[%l7 + 0x28],	%i1
	fmovrslez	%o3,	%f31,	%f11
	tvc	%icc,	0x6
	orcc	%i6,	%o7,	%l2
	tn	%xcc,	0x2
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x30] %asi,	%l3
	movcs	%icc,	%g3,	%g2
	stx	%o1,	[%l7 + 0x10]
	sub	%o5,	0x1845,	%g5
	fbule	%fcc1,	loop_1295
	fone	%f4
	nop
	setx	loop_1296,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_1297
loop_1295:
	edge32	%i5,	%o2,	%g7
	movn	%icc,	%l5,	%i7
loop_1296:
	alignaddrl	%g1,	%l0,	%i2
loop_1297:
	fmovscs	%icc,	%f27,	%f15
	fmovrse	%o4,	%f30,	%f18
	mulx	%g6,	%i0,	%g4
	ldsw	[%l7 + 0x24],	%i4
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x11
	movleu	%icc,	%i3,	%l1
	bg,pt	%icc,	loop_1298
	fcmpeq16	%f8,	%f6,	%l4
	subccc	%o6,	0x1E55,	%l6
	brz,a	%o0,	loop_1299
loop_1298:
	movrlz	%o3,	%i1,	%i6
	srl	%o7,	0x19,	%l3
	nop
	setx	0xE8BF04F6CDA3B028,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x87A624D606D21342,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f2,	%f0
loop_1299:
	or	%l2,	%g3,	%g2
	tleu	%xcc,	0x6
	bvs,a	%xcc,	loop_1300
	tne	%xcc,	0x5
	edge16l	%o5,	%o1,	%g5
	and	%i5,	%g7,	%o2
loop_1300:
	nop
	wr	%g0,	0x2f,	%asi
	stha	%i7,	[%l7 + 0x54] %asi
	membar	#Sync
	tgu	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	sta	%f25,	[%l7 + 0x58] %asi
	tneg	%icc,	0x6
	edge16n	%l5,	%l0,	%i2
	set	0x64, %i2
	sta	%f31,	[%l7 + %i2] 0x89
	movrlez	%g1,	%g6,	%i0
	bcs,a,pn	%xcc,	loop_1301
	tcc	%icc,	0x7
	addcc	%g4,	%i4,	%o4
	movle	%xcc,	%l1,	%i3
loop_1301:
	nop
	setx	loop_1302,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpsub32	%f0,	%f0,	%f24
	udiv	%o6,	0x17C3,	%l6
	fornot2	%f0,	%f8,	%f10
loop_1302:
	xor	%o0,	0x020A,	%l4
	fmovdge	%xcc,	%f1,	%f24
	stw	%i1,	[%l7 + 0x6C]
	sllx	%i6,	%o3,	%l3
	fsrc2s	%f11,	%f22
	udiv	%o7,	0x1F82,	%g3
	tle	%icc,	0x5
	tg	%xcc,	0x0
	ldstub	[%l7 + 0x1D],	%g2
	bvc,pn	%xcc,	loop_1303
	movl	%icc,	%l2,	%o1
	fpsub32	%f14,	%f14,	%f24
	edge16ln	%o5,	%i5,	%g5
loop_1303:
	tge	%icc,	0x3
	udivcc	%g7,	0x11E0,	%o2
	addc	%l5,	%i7,	%l0
	fbul,a	%fcc1,	loop_1304
	movcc	%xcc,	%i2,	%g1
	array32	%g6,	%g4,	%i4
	fmovdneg	%icc,	%f8,	%f27
loop_1304:
	udiv	%i0,	0x1655,	%o4
	bvs	%xcc,	loop_1305
	orcc	%i3,	%l1,	%l6
	fmovdgu	%icc,	%f27,	%f18
	movre	%o0,	0x1C8,	%l4
loop_1305:
	subccc	%i1,	%o6,	%i6
	call	loop_1306
	fornot1s	%f13,	%f25,	%f20
	movre	%o3,	0x3A6,	%l3
	srax	%o7,	%g3,	%l2
loop_1306:
	movre	%o1,	0x160,	%o5
	fornot2s	%f27,	%f14,	%f15
	edge32l	%i5,	%g2,	%g7
	brlz,a	%g5,	loop_1307
	tleu	%icc,	0x3
	bg,a,pn	%icc,	loop_1308
	fandnot1s	%f1,	%f23,	%f15
loop_1307:
	movcc	%icc,	%o2,	%i7
	and	%l0,	%l5,	%g1
loop_1308:
	xnorcc	%g6,	0x1B6F,	%i2
	bn,a	%icc,	loop_1309
	nop
	setx	loop_1310,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%xcc,	%g4,	%i0
	mulx	%i4,	0x1E8E,	%i3
loop_1309:
	fmovrdlez	%o4,	%f18,	%f22
loop_1310:
	srax	%l6,	%o0,	%l1
	fmovrdlez	%l4,	%f30,	%f10
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x14,	%f0
	fbl	%fcc2,	loop_1311
	udiv	%i1,	0x0735,	%o6
	xorcc	%o3,	0x11A5,	%l3
	fmovd	%f26,	%f6
loop_1311:
	subcc	%i6,	0x195A,	%o7
	array8	%g3,	%l2,	%o1
	fmovdl	%icc,	%f19,	%f26
	ble,pt	%xcc,	loop_1312
	fornot2s	%f10,	%f23,	%f13
	bvc	loop_1313
	fmovs	%f7,	%f7
loop_1312:
	bge,a	loop_1314
	bg,a,pn	%icc,	loop_1315
loop_1313:
	srax	%i5,	0x10,	%g2
	tge	%xcc,	0x1
loop_1314:
	fmuld8sux16	%f1,	%f16,	%f6
loop_1315:
	addcc	%o5,	%g7,	%o2
	andncc	%i7,	%g5,	%l0
	fmovdvs	%xcc,	%f8,	%f12
	edge8	%l5,	%g1,	%g6
	or	%g4,	%i0,	%i4
	edge32ln	%i2,	%o4,	%i3
	fpadd32	%f2,	%f8,	%f24
	sdiv	%o0,	0x108F,	%l6
	tsubcctv	%l1,	%i1,	%l4
	nop
	fitos	%f14,	%f5
	fstox	%f5,	%f24
	fmul8sux16	%f8,	%f22,	%f20
	srax	%o6,	%l3,	%i6
	andn	%o3,	%o7,	%g3
	fmul8x16	%f22,	%f14,	%f14
	movcs	%xcc,	%o1,	%i5
	fbu,a	%fcc1,	loop_1316
	taddcc	%g2,	%l2,	%g7
	subcc	%o5,	%o2,	%i7
	srax	%l0,	0x10,	%g5
loop_1316:
	sdivx	%g1,	0x178A,	%g6
	set	0x77, %i0
	ldstuba	[%l7 + %i0] 0x88,	%l5
	tneg	%xcc,	0x5
	sdivcc	%g4,	0x13B7,	%i4
	fbo,a	%fcc1,	loop_1317
	tne	%icc,	0x5
	movge	%icc,	%i2,	%o4
	nop
	setx loop_1318, %l0, %l1
	jmpl %l1, %i0
loop_1317:
	alignaddrl	%o0,	%l6,	%l1
	edge32n	%i3,	%l4,	%o6
	fbe,a	%fcc1,	loop_1319
loop_1318:
	pdist	%f20,	%f10,	%f30
	tcc	%xcc,	0x5
	tge	%xcc,	0x6
loop_1319:
	sth	%l3,	[%l7 + 0x62]
	bgu,a	loop_1320
	mulscc	%i6,	%i1,	%o7
	tl	%icc,	0x4
	movge	%xcc,	%g3,	%o3
loop_1320:
	movcc	%xcc,	%i5,	%o1
	orncc	%g2,	%g7,	%o5
	tsubcc	%o2,	%i7,	%l0
	umul	%g5,	0x0DD1,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%l2,	%l5
	movgu	%icc,	%g6,	%i4
	ldd	[%l7 + 0x50],	%f22
	fnot1s	%f28,	%f2
	flush	%l7 + 0x10
	movcs	%icc,	%g4,	%i2
	tn	%icc,	0x1
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x28] %asi,	%f22
	ld	[%l7 + 0x2C],	%f22
	edge16n	%o4,	%i0,	%l6
	srl	%l1,	%o0,	%i3
	subccc	%l4,	%l3,	%o6
	smulcc	%i6,	0x1AD3,	%o7
	movvs	%icc,	%g3,	%i1
	orcc	%o3,	%o1,	%i5
	sra	%g7,	%o5,	%g2
	movvs	%icc,	%o2,	%l0
	membar	0x47
	fpsub32	%f6,	%f28,	%f10
	bne	%icc,	loop_1321
	tneg	%icc,	0x5
	movgu	%icc,	%g5,	%i7
	movneg	%icc,	%g1,	%l5
loop_1321:
	xorcc	%l2,	0x11A3,	%i4
	fxors	%f31,	%f11,	%f9
	tpos	%icc,	0x5
	ldsb	[%l7 + 0x41],	%g4
	wr	%g0,	0x81,	%asi
	stha	%i2,	[%l7 + 0x0E] %asi
	stb	%g6,	[%l7 + 0x0B]
	fpsub32s	%f8,	%f1,	%f10
	orcc	%o4,	0x149E,	%l6
	fxnor	%f28,	%f18,	%f12
	fmul8x16au	%f3,	%f20,	%f30
	set	0x5E, %g7
	lduba	[%l7 + %g7] 0x18,	%l1
	popc	0x1D3B,	%o0
	fpackfix	%f2,	%f15
	movg	%xcc,	%i3,	%i0
	fsrc2s	%f27,	%f14
	nop
	set	0x38, %g4
	ldd	[%l7 + %g4],	%l4
	movrlz	%l3,	0x3BE,	%o6
	umulcc	%o7,	0x0FA7,	%i6
	be,pn	%icc,	loop_1322
	bneg	%xcc,	loop_1323
	udivx	%i1,	0x1645,	%g3
	nop
	setx	0xF254EDAC556B0080,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2D219E20B38EA3E5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f10,	%f18
loop_1322:
	fba	%fcc2,	loop_1324
loop_1323:
	and	%o1,	0x029F,	%o3
	umulcc	%g7,	%i5,	%g2
	array32	%o5,	%o2,	%l0
loop_1324:
	tcs	%xcc,	0x5
	bne,pn	%icc,	loop_1325
	edge8l	%i7,	%g1,	%l5
	udivcc	%l2,	0x1E97,	%i4
	nop
	setx	0x30EB6232,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x88862BC0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f19,	%f17
loop_1325:
	fmovsleu	%icc,	%f1,	%f2
	fpsub32s	%f19,	%f15,	%f9
	fpsub16	%f16,	%f8,	%f12
	brgz	%g5,	loop_1326
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f29
	fmovrslz	%i2,	%f15,	%f29
	movvs	%icc,	%g4,	%o4
loop_1326:
	fbe,a	%fcc0,	loop_1327
	fmovrdlz	%l6,	%f4,	%f20
	fmovscc	%xcc,	%f12,	%f22
	alignaddrl	%g6,	%o0,	%l1
loop_1327:
	fpadd32	%f2,	%f8,	%f0
	orn	%i0,	0x16F1,	%i3
	edge16l	%l3,	%o6,	%o7
	fpadd32	%f8,	%f8,	%f30
	fcmpgt32	%f26,	%f26,	%i6
	srl	%i1,	0x04,	%l4
	bge,a,pt	%icc,	loop_1328
	edge16n	%o1,	%g3,	%o3
	sra	%g7,	0x1F,	%g2
	sllx	%o5,	%o2,	%i5
loop_1328:
	xnorcc	%i7,	0x1485,	%l0
	fmul8ulx16	%f12,	%f6,	%f20
	fmovdcs	%xcc,	%f15,	%f25
	edge16n	%l5,	%l2,	%i4
	bcc	%xcc,	loop_1329
	orn	%g5,	0x058F,	%i2
	edge16l	%g4,	%g1,	%o4
	fnors	%f10,	%f18,	%f6
loop_1329:
	nop
	setx loop_1330, %l0, %l1
	jmpl %l1, %l6
	bneg,a,pn	%icc,	loop_1331
	sdiv	%g6,	0x1AC4,	%o0
	fands	%f9,	%f7,	%f9
loop_1330:
	sth	%i0,	[%l7 + 0x2C]
loop_1331:
	edge16	%l1,	%l3,	%i3
	add	%o6,	%i6,	%o7
	fmovdn	%icc,	%f19,	%f6
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f20
	fxtod	%f20,	%f2
	stbar
	nop
	setx	loop_1332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpmerge	%f9,	%f16,	%f6
	xnorcc	%i1,	%l4,	%o1
	orcc	%o3,	%g7,	%g2
loop_1332:
	fones	%f6
	movcc	%xcc,	%o5,	%g3
	movrlez	%i5,	%o2,	%l0
	movre	%i7,	0x06C,	%l2
	xor	%i4,	0x1661,	%g5
	movgu	%icc,	%l5,	%i2
	movn	%icc,	%g4,	%g1
	fbg,a	%fcc0,	loop_1333
	ld	[%l7 + 0x6C],	%f3
	nop
	setx	0x9BB3DAEE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f3
	edge16n	%l6,	%o4,	%g6
loop_1333:
	tcc	%icc,	0x7
	bge,pt	%xcc,	loop_1334
	movgu	%icc,	%o0,	%l1
	fmul8x16au	%f14,	%f14,	%f4
	sdivx	%i0,	0x097B,	%l3
loop_1334:
	movrne	%i3,	%i6,	%o6
	array16	%i1,	%l4,	%o7
	fnot2	%f6,	%f30
	fble	%fcc3,	loop_1335
	fmovsne	%icc,	%f29,	%f30
	edge32ln	%o3,	%o1,	%g2
	nop
	set	0x14, %g1
	prefetch	[%l7 + %g1],	 0x2
loop_1335:
	fnors	%f8,	%f1,	%f30
	nop
	set	0x19, %g3
	stb	%o5,	[%l7 + %g3]
	smul	%g7,	%g3,	%o2
	mova	%icc,	%l0,	%i5
	andn	%i7,	%l2,	%g5
	mova	%icc,	%i4,	%l5
	movrgz	%i2,	%g1,	%g4
	fmovsvc	%icc,	%f21,	%f3
	edge8n	%l6,	%o4,	%g6
	edge32l	%l1,	%i0,	%o0
	fpadd16s	%f2,	%f5,	%f27
	tcs	%xcc,	0x2
	movn	%xcc,	%i3,	%i6
	array16	%o6,	%l3,	%i1
	nop
	setx	0x2ED87EED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f22
	stb	%l4,	[%l7 + 0x71]
	nop
	fitos	%f3,	%f1
	fstox	%f1,	%f28
	fxtos	%f28,	%f8
	fbo	%fcc0,	loop_1336
	brlz	%o7,	loop_1337
	fones	%f31
	addc	%o3,	0x1687,	%g2
loop_1336:
	tg	%icc,	0x5
loop_1337:
	tsubcctv	%o5,	0x11D7,	%g7
	set	0x0C, %i7
	swapa	[%l7 + %i7] 0x10,	%g3
	edge8ln	%o2,	%o1,	%i5
	andcc	%i7,	0x05B9,	%l0
	fmovsa	%icc,	%f16,	%f16
	taddcctv	%l2,	%g5,	%i4
	tle	%xcc,	0x2
	addccc	%l5,	0x0BF0,	%i2
	fpadd16	%f0,	%f0,	%f16
	wr	%g0,	0x80,	%asi
	sta	%f10,	[%l7 + 0x3C] %asi
	tn	%xcc,	0x0
	addccc	%g4,	0x01D3,	%l6
	tpos	%xcc,	0x4
	sll	%o4,	%g6,	%l1
	tleu	%icc,	0x6
	st	%f24,	[%l7 + 0x18]
	brnz,a	%g1,	loop_1338
	umul	%i0,	0x1B93,	%o0
	and	%i6,	%i3,	%o6
	ba,a	%icc,	loop_1339
loop_1338:
	bvc	%icc,	loop_1340
	tneg	%xcc,	0x2
	brgz	%i1,	loop_1341
loop_1339:
	bvs,pn	%xcc,	loop_1342
loop_1340:
	tneg	%xcc,	0x4
	fzeros	%f31
loop_1341:
	addccc	%l3,	%l4,	%o3
loop_1342:
	srax	%g2,	0x13,	%o7
	fmovse	%xcc,	%f5,	%f7
	fcmple16	%f30,	%f18,	%o5
	mova	%icc,	%g3,	%o2
	mulx	%g7,	%i5,	%o1
	tg	%icc,	0x4
	for	%f6,	%f2,	%f8
	popc	0x00C0,	%l0
	be,pt	%icc,	loop_1343
	fbl,a	%fcc1,	loop_1344
	tl	%xcc,	0x7
	sub	%l2,	0x1E4C,	%g5
loop_1343:
	edge8ln	%i7,	%i4,	%i2
loop_1344:
	sll	%l5,	0x15,	%l6
	tn	%icc,	0x6
	wr	%g0,	0x19,	%asi
	stha	%o4,	[%l7 + 0x0C] %asi
	movne	%icc,	%g6,	%l1
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x32] %asi,	%g4
	stx	%i0,	[%l7 + 0x68]
	sth	%g1,	[%l7 + 0x28]
	bpos,a,pt	%xcc,	loop_1345
	fone	%f10
	fsrc1	%f6,	%f12
	fornot1	%f2,	%f30,	%f14
loop_1345:
	bgu	loop_1346
	fnands	%f13,	%f23,	%f22
	movcc	%icc,	%i6,	%i3
	udiv	%o6,	0x0609,	%o0
loop_1346:
	bpos	loop_1347
	fmovsle	%icc,	%f16,	%f0
	brlz,a	%i1,	loop_1348
	fbe,a	%fcc3,	loop_1349
loop_1347:
	srax	%l3,	0x19,	%l4
	orncc	%o3,	%g2,	%o7
loop_1348:
	nop
	set	0x18, %l3
	lduha	[%l7 + %l3] 0x14,	%g3
loop_1349:
	edge16ln	%o2,	%o5,	%i5
	sdiv	%g7,	0x11D9,	%o1
	umul	%l2,	0x197F,	%g5
	array32	%l0,	%i7,	%i2
	fand	%f6,	%f16,	%f18
	udiv	%i4,	0x1957,	%l5
	fandnot2s	%f4,	%f21,	%f11
	movneg	%xcc,	%l6,	%o4
	bg,a,pn	%icc,	loop_1350
	sub	%g6,	0x1DE2,	%l1
	fcmpne16	%f4,	%f24,	%g4
	udiv	%g1,	0x0E8D,	%i0
loop_1350:
	nop
	setx	loop_1351,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu,a	%fcc1,	loop_1352
	movle	%xcc,	%i6,	%o6
	movpos	%xcc,	%o0,	%i3
loop_1351:
	mulscc	%i1,	0x04DB,	%l3
loop_1352:
	mulscc	%l4,	0x1E1B,	%o3
	fmovdleu	%icc,	%f13,	%f22
	edge8n	%g2,	%o7,	%o2
	fpsub16	%f10,	%f22,	%f16
	orcc	%o5,	0x1F6D,	%g3
	bl	loop_1353
	srl	%i5,	%o1,	%l2
	movge	%xcc,	%g5,	%g7
	tg	%xcc,	0x2
loop_1353:
	addcc	%l0,	0x00A5,	%i7
	umulcc	%i4,	%i2,	%l5
	sdiv	%l6,	0x0466,	%g6
	movpos	%icc,	%o4,	%l1
	fornot1s	%f1,	%f1,	%f26
	tne	%icc,	0x0
	fmovspos	%xcc,	%f4,	%f24
	stw	%g1,	[%l7 + 0x50]
	fzeros	%f4
	fnegd	%f12,	%f30
	movg	%xcc,	%i0,	%i6
	bcc,a	loop_1354
	array8	%o6,	%g4,	%i3
	te	%xcc,	0x7
	nop
	set	0x7A, %o3
	lduh	[%l7 + %o3],	%i1
loop_1354:
	tg	%icc,	0x5
	array8	%l3,	%l4,	%o0
	tge	%icc,	0x3
	edge16l	%g2,	%o3,	%o7
	bcs	%xcc,	loop_1355
	mulx	%o5,	%g3,	%o2
	orcc	%o1,	%l2,	%g5
	smulcc	%i5,	0x1727,	%l0
loop_1355:
	orn	%i7,	0x0785,	%g7
	srax	%i4,	0x1D,	%i2
	sdivcc	%l6,	0x0C56,	%l5
	bgu,a,pt	%icc,	loop_1356
	addccc	%g6,	%o4,	%g1
	edge32n	%i0,	%l1,	%o6
	fcmpeq32	%f20,	%f18,	%i6
loop_1356:
	brlz	%i3,	loop_1357
	subc	%g4,	0x1C06,	%l3
	andcc	%l4,	0x10E7,	%o0
	movvs	%icc,	%g2,	%i1
loop_1357:
	udivcc	%o7,	0x1976,	%o3
	edge16	%g3,	%o2,	%o5
	fmovrdgz	%l2,	%f10,	%f18
	edge8ln	%g5,	%i5,	%l0
	set	0x28, %g5
	ldsha	[%l7 + %g5] 0x89,	%i7
	movrgz	%o1,	%i4,	%g7
	nop
	setx	0xD40AFCC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x876753A4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f30,	%f2
	edge16ln	%l6,	%i2,	%l5
	addcc	%g6,	%o4,	%g1
	movvc	%xcc,	%l1,	%i0
	edge16ln	%i6,	%o6,	%g4
	set	0x3C, %o5
	swapa	[%l7 + %o5] 0x18,	%l3
	fabsd	%f26,	%f28
	edge16ln	%l4,	%i3,	%g2
	movneg	%xcc,	%i1,	%o0
	set	0x22, %o1
	stha	%o3,	[%l7 + %o1] 0xe2
	membar	#Sync
	bl,pn	%xcc,	loop_1358
	andncc	%o7,	%o2,	%g3
	brgez	%l2,	loop_1359
	alignaddrl	%g5,	%o5,	%i5
loop_1358:
	srax	%l0,	%o1,	%i4
	nop
	set	0x2A, %l4
	lduh	[%l7 + %l4],	%g7
loop_1359:
	sdivx	%l6,	0x0372,	%i2
	lduh	[%l7 + 0x5A],	%l5
	tge	%xcc,	0x2
	addcc	%g6,	0x03AF,	%o4
	nop
	setx	loop_1360,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	swap	[%l7 + 0x50],	%i7
	brlz	%l1,	loop_1361
	fbe,a	%fcc0,	loop_1362
loop_1360:
	edge16l	%g1,	%i6,	%i0
	tneg	%icc,	0x6
loop_1361:
	movrgez	%o6,	0x1CA,	%g4
loop_1362:
	fbn,a	%fcc0,	loop_1363
	taddcctv	%l4,	0x1E4D,	%i3
	fcmpne32	%f26,	%f8,	%g2
	edge32	%i1,	%l3,	%o3
loop_1363:
	ta	%xcc,	0x2
	fbge	%fcc3,	loop_1364
	edge16ln	%o7,	%o0,	%g3
	bneg,a	%xcc,	loop_1365
	and	%l2,	%g5,	%o2
loop_1364:
	edge8l	%i5,	%l0,	%o1
	tvs	%icc,	0x0
loop_1365:
	fpack16	%f28,	%f9
	fmovdne	%icc,	%f0,	%f15
	fbug	%fcc0,	loop_1366
	stbar
	movpos	%xcc,	%o5,	%i4
	membar	0x4D
loop_1366:
	ba	%xcc,	loop_1367
	fbo	%fcc0,	loop_1368
	fand	%f28,	%f12,	%f8
	fone	%f2
loop_1367:
	nop
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l6
loop_1368:
	sir	0x024C
	xnor	%i2,	0x0C67,	%g7
	andn	%l5,	0x1F3A,	%g6
	fmul8x16au	%f26,	%f15,	%f4
	fone	%f16
	bcs,pt	%icc,	loop_1369
	edge32ln	%o4,	%l1,	%i7
	andncc	%g1,	%i0,	%i6
	bpos,a	%xcc,	loop_1370
loop_1369:
	fmovdgu	%icc,	%f3,	%f3
	fmovrdgz	%o6,	%f12,	%f16
	fnor	%f8,	%f2,	%f28
loop_1370:
	fzeros	%f8
	edge16n	%g4,	%i3,	%l4
	addcc	%i1,	%g2,	%l3
	st	%f8,	[%l7 + 0x78]
	stx	%o3,	[%l7 + 0x38]
	andncc	%o0,	%o7,	%g3
	tsubcctv	%l2,	%o2,	%i5
	udiv	%g5,	0x1B69,	%o1
	edge32	%o5,	%l0,	%l6
	tvs	%xcc,	0x0
	umulcc	%i4,	0x14AB,	%i2
	umulcc	%g7,	%l5,	%g6
	fnegd	%f22,	%f26
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf1
	membar	#Sync
	fba	%fcc0,	loop_1371
	and	%o4,	%l1,	%i7
	fmovda	%icc,	%f17,	%f16
	orn	%i0,	%g1,	%o6
loop_1371:
	fcmpne32	%f12,	%f10,	%i6
	bleu	loop_1372
	move	%xcc,	%g4,	%i3
	fpackfix	%f0,	%f25
	bcs,a,pn	%icc,	loop_1373
loop_1372:
	fmovsleu	%icc,	%f14,	%f19
	fone	%f12
	fmovrdlez	%i1,	%f30,	%f28
loop_1373:
	tneg	%icc,	0x5
	bgu,pt	%icc,	loop_1374
	fandnot2	%f18,	%f12,	%f0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%g2,	%l3
loop_1374:
	movn	%xcc,	%l4,	%o0
	edge8l	%o3,	%g3,	%l2
	movre	%o7,	0x1E5,	%o2
	ldd	[%l7 + 0x78],	%f18
	sir	0x1AE7
	and	%i5,	0x1C6B,	%o1
	bg,a	%xcc,	loop_1375
	bg	loop_1376
	bn	loop_1377
	stw	%g5,	[%l7 + 0x1C]
loop_1375:
	brlz	%l0,	loop_1378
loop_1376:
	mulx	%l6,	%i4,	%o5
loop_1377:
	bgu,pt	%xcc,	loop_1379
	edge8n	%i2,	%g7,	%g6
loop_1378:
	stx	%o4,	[%l7 + 0x68]
	set	0x10, %l6
	ldxa	[%g0 + %l6] 0x21,	%l5
loop_1379:
	array8	%l1,	%i7,	%i0
	nop
	fitos	%f2,	%f17
	fstox	%f17,	%f4
	prefetch	[%l7 + 0x58],	 0x1
	sdivcc	%g1,	0x19A2,	%o6
	fbue,a	%fcc2,	loop_1380
	nop
	setx	0x144C8F63,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x387DCE96,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f3,	%f21
	movgu	%xcc,	%i6,	%i3
	movne	%xcc,	%i1,	%g2
loop_1380:
	fbug,a	%fcc0,	loop_1381
	orcc	%g4,	0x01F5,	%l3
	movleu	%icc,	%l4,	%o3
	orcc	%g3,	%o0,	%l2
loop_1381:
	move	%xcc,	%o2,	%o7
	movne	%icc,	%o1,	%g5
	ld	[%l7 + 0x0C],	%f30
	movle	%xcc,	%i5,	%l0
	nop
	fitod	%f16,	%f18
	movle	%icc,	%i4,	%o5
	movcc	%icc,	%l6,	%i2
	srl	%g6,	0x11,	%o4
	fmovdpos	%xcc,	%f22,	%f12
	edge16	%g7,	%l1,	%l5
	flush	%l7 + 0x44
	sdivx	%i7,	0x09D3,	%g1
	orncc	%i0,	0x053D,	%i6
	wr	%g0,	0x19,	%asi
	stha	%o6,	[%l7 + 0x6A] %asi
	fbne	%fcc1,	loop_1382
	move	%xcc,	%i3,	%i1
	fmuld8sux16	%f18,	%f17,	%f30
	ta	%icc,	0x0
loop_1382:
	edge8l	%g2,	%l3,	%l4
	fbne	%fcc0,	loop_1383
	ldstub	[%l7 + 0x19],	%g4
	or	%g3,	%o3,	%o0
	fbule	%fcc3,	loop_1384
loop_1383:
	sethi	0x075C,	%o2
	sra	%o7,	%l2,	%g5
	add	%i5,	%o1,	%l0
loop_1384:
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f14
	fxtod	%f14,	%f2
	fnot1s	%f23,	%f24
	udiv	%i4,	0x060D,	%o5
	tge	%xcc,	0x1
	sll	%l6,	0x13,	%i2
	brgez	%o4,	loop_1385
	fpsub16s	%f27,	%f25,	%f30
	fmovdpos	%xcc,	%f27,	%f24
	tvc	%xcc,	0x5
loop_1385:
	addc	%g6,	%g7,	%l5
	sra	%i7,	0x02,	%g1
	tleu	%xcc,	0x3
	fmovdgu	%icc,	%f31,	%f22
	tle	%icc,	0x0
	array8	%i0,	%i6,	%o6
	ble,a,pt	%icc,	loop_1386
	lduw	[%l7 + 0x70],	%l1
	tsubcctv	%i3,	%i1,	%l3
	brgez,a	%g2,	loop_1387
loop_1386:
	andn	%l4,	%g4,	%o3
	fbue,a	%fcc0,	loop_1388
	bgu,a,pt	%icc,	loop_1389
loop_1387:
	edge8l	%g3,	%o0,	%o2
	edge32l	%o7,	%g5,	%i5
loop_1388:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x72] %asi,	%o1
loop_1389:
	ldsh	[%l7 + 0x72],	%l2
	array32	%l0,	%o5,	%l6
	movge	%xcc,	%i2,	%i4
	movl	%icc,	%o4,	%g6
	fbu,a	%fcc1,	loop_1390
	xorcc	%g7,	%i7,	%l5
	ble,pt	%xcc,	loop_1391
	tne	%icc,	0x5
loop_1390:
	nop
	setx	0x3AE31056A72A8B53,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x60D60930DAD64ED9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f30,	%f12
	edge32l	%g1,	%i6,	%o6
loop_1391:
	taddcctv	%i0,	%l1,	%i1
	movvc	%xcc,	%i3,	%g2
	fmovrsne	%l3,	%f30,	%f18
	fpadd16s	%f10,	%f0,	%f18
	subccc	%g4,	0x1C97,	%o3
	movvs	%icc,	%g3,	%l4
	nop
	setx	0x6F929E0DAAB49082,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB7F2E6A9556634C6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f18,	%f6
	umulcc	%o2,	%o7,	%g5
	fmuld8ulx16	%f25,	%f4,	%f8
	array16	%o0,	%i5,	%o1
	umul	%l0,	%l2,	%o5
	edge8l	%i2,	%i4,	%l6
	fbl	%fcc2,	loop_1392
	fexpand	%f7,	%f12
	movcs	%xcc,	%g6,	%o4
	tgu	%icc,	0x0
loop_1392:
	sth	%i7,	[%l7 + 0x7C]
	movpos	%xcc,	%l5,	%g7
	subc	%i6,	0x1C09,	%o6
	xnorcc	%i0,	%l1,	%i1
	te	%xcc,	0x3
	fmovrsgz	%i3,	%f14,	%f5
	orcc	%g1,	%g2,	%l3
	umulcc	%g4,	0x014D,	%g3
	ld	[%l7 + 0x18],	%f4
	fmovsvs	%xcc,	%f22,	%f3
	set	0x3D, %o2
	stba	%l4,	[%l7 + %o2] 0x23
	membar	#Sync
	subcc	%o2,	0x0B67,	%o3
	tge	%xcc,	0x5
	srl	%o7,	0x1E,	%o0
	fsrc2	%f28,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x6A30A8F8116F3E55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f30
	movcc	%icc,	%g5,	%i5
	fmovdle	%xcc,	%f31,	%f25
	set	0x160, %i1
	nop 	! 	nop 	! 	ldxa	[%g0 + %i1] 0x40,	%o1 ripped by fixASI40.pl ripped by fixASI40.pl
	tleu	%xcc,	0x1
	sll	%l0,	0x17,	%o5
	prefetch	[%l7 + 0x44],	 0x0
	tcc	%icc,	0x0
	orn	%i2,	%i4,	%l2
	sll	%l6,	%g6,	%i7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%l5,	%o4
	fpadd32s	%f30,	%f28,	%f21
	set	0x66, %i5
	stba	%i6,	[%l7 + %i5] 0xeb
	membar	#Sync
	movg	%xcc,	%g7,	%o6
	tge	%icc,	0x1
	popc	%i0,	%i1
	fornot1	%f8,	%f18,	%f14
	nop
	setx	loop_1393,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpgt16	%f16,	%f18,	%i3
	bvc,a	loop_1394
	fpsub32s	%f28,	%f20,	%f0
loop_1393:
	nop
	fitod	%f10,	%f18
	fdtoi	%f18,	%f28
	tne	%xcc,	0x1
loop_1394:
	fbl,a	%fcc0,	loop_1395
	nop
	setx	loop_1396,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrsne	%l1,	%f24,	%f4
	sdiv	%g1,	0x0E36,	%g2
loop_1395:
	srlx	%g4,	0x08,	%l3
loop_1396:
	nop
	fitod	%f2,	%f26
	fdtos	%f26,	%f31
	andncc	%l4,	%o2,	%o3
	tgu	%xcc,	0x7
	edge16l	%g3,	%o0,	%o7
	set	0x64, %l2
	lduwa	[%l7 + %l2] 0x88,	%g5
	udivx	%o1,	0x0232,	%i5
	edge32n	%o5,	%i2,	%l0
	fcmpne16	%f12,	%f24,	%l2
	nop
	setx loop_1397, %l0, %l1
	jmpl %l1, %i4
	movneg	%icc,	%l6,	%i7
	nop
	fitos	%f0,	%f25
	fstod	%f25,	%f26
	nop
	setx	loop_1398,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1397:
	fmovrdlez	%l5,	%f10,	%f6
	tcs	%icc,	0x6
	nop
	setx	0x27058BB58077F1BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_1398:
	nop
	fitod	%f6,	%f28
	fdtoi	%f28,	%f22
	fmuld8ulx16	%f31,	%f11,	%f12
	tleu	%xcc,	0x2
	brlez	%g6,	loop_1399
	fpackfix	%f12,	%f1
	fmovdleu	%xcc,	%f24,	%f2
	orncc	%o4,	%g7,	%i6
loop_1399:
	nop
	set	0x6C, %o4
	swapa	[%l7 + %o4] 0x04,	%o6
	bcs,pt	%xcc,	loop_1400
	smulcc	%i1,	%i0,	%i3
	movrlez	%l1,	0x3B4,	%g2
	bgu,pn	%icc,	loop_1401
loop_1400:
	edge16n	%g1,	%l3,	%g4
	array8	%l4,	%o3,	%g3
	array32	%o0,	%o2,	%o7
loop_1401:
	bn,pt	%icc,	loop_1402
	array16	%o1,	%i5,	%g5
	edge8	%o5,	%i2,	%l2
	fcmpgt32	%f18,	%f28,	%i4
loop_1402:
	xor	%l6,	%l0,	%i7
	fbul,a	%fcc3,	loop_1403
	nop
	setx	0x70670A0E,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	tgu	%icc,	0x6
	nop
	setx	0x1D1773B2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x154FA88D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f13,	%f12
loop_1403:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1c8] %asi,	%g6 ripped by fixASI40.pl ripped by fixASI40.pl
	taddcc	%l5,	%o4,	%g7
	andncc	%o6,	%i6,	%i0
	nop
	setx	0x803C2AE52D83D5E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x889A2FE96A093A9E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f28,	%f0
	edge16	%i1,	%l1,	%i3
	edge32n	%g2,	%l3,	%g1
	tneg	%xcc,	0x2
	brgz	%g4,	loop_1404
	tcs	%xcc,	0x0
	bvs,a	%icc,	loop_1405
	sll	%l4,	0x17,	%o3
loop_1404:
	fblg	%fcc1,	loop_1406
	nop
	setx	0x89F007F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB6A03C87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f11,	%f15
loop_1405:
	movgu	%icc,	%g3,	%o0
	mulscc	%o2,	%o7,	%o1
loop_1406:
	edge16ln	%i5,	%o5,	%i2
	fmovdcs	%icc,	%f8,	%f14
	brlez,a	%l2,	loop_1407
	brz,a	%i4,	loop_1408
	brlz	%g5,	loop_1409
	edge8l	%l6,	%i7,	%g6
loop_1407:
	array32	%l0,	%l5,	%o4
loop_1408:
	fpadd32s	%f3,	%f18,	%f30
loop_1409:
	ldsb	[%l7 + 0x30],	%g7
	tcs	%xcc,	0x3
	fnor	%f4,	%f18,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f31,	%f6
	sllx	%i6,	%o6,	%i0
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x80,	%f16
	tvs	%xcc,	0x5
	umulcc	%l1,	%i3,	%i1
	movvs	%xcc,	%l3,	%g2
	add	%g4,	%l4,	%o3
	array32	%g3,	%g1,	%o2
	move	%icc,	%o7,	%o1
	tcs	%icc,	0x4
	fpsub32s	%f6,	%f18,	%f1
	subc	%i5,	%o5,	%o0
	be,a,pn	%xcc,	loop_1410
	fmovscc	%xcc,	%f9,	%f15
	edge8ln	%l2,	%i2,	%g5
	nop
	fitos	%f6,	%f30
	fstod	%f30,	%f28
loop_1410:
	alignaddrl	%l6,	%i4,	%i7
	movrlez	%g6,	0x055,	%l5
	ta	%icc,	0x5
	tvs	%icc,	0x2
	addccc	%l0,	%o4,	%i6
	movle	%icc,	%o6,	%i0
	fmovdleu	%xcc,	%f16,	%f2
	tl	%icc,	0x7
	nop
	setx	loop_1411,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%icc,	0x0
	mova	%icc,	%g7,	%i3
	movrlz	%l1,	0x1B5,	%l3
loop_1411:
	tg	%icc,	0x6
	or	%i1,	0x0FC3,	%g2
	andcc	%l4,	0x1CF1,	%o3
	te	%icc,	0x6
	movvs	%xcc,	%g4,	%g3
	brnz,a	%o2,	loop_1412
	nop
	setx	0x97B3EC6614167E21,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xDDEBAD151C906DBA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f10,	%f24
	orcc	%o7,	%g1,	%i5
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x80,	 0x3
loop_1412:
	tvs	%icc,	0x0
	fmovsg	%icc,	%f7,	%f30
	edge8ln	%o5,	%l2,	%i2
	and	%g5,	0x0B0E,	%l6
	movrlez	%i4,	%i7,	%g6
	subccc	%l5,	0x0167,	%l0
	subcc	%o4,	0x1602,	%o0
	sllx	%o6,	%i0,	%g7
	subcc	%i6,	%l1,	%l3
	sub	%i1,	0x175B,	%i3
	movleu	%xcc,	%l4,	%g2
	movrlz	%g4,	0x09D,	%o3
	for	%f26,	%f2,	%f2
	movgu	%xcc,	%o2,	%o7
	movne	%xcc,	%g1,	%g3
	addccc	%o1,	%o5,	%l2
	fmovdpos	%icc,	%f24,	%f7
	srlx	%i2,	0x0E,	%i5
	movrgez	%l6,	%g5,	%i7
	xnor	%i4,	%l5,	%l0
	sra	%o4,	0x0D,	%g6
	movg	%icc,	%o0,	%o6
	set	0x0F, %l5
	ldsba	[%l7 + %l5] 0x11,	%g7
	nop
	fitod	%f31,	%f6
	array8	%i6,	%l1,	%l3
	bg,a,pn	%xcc,	loop_1413
	mulscc	%i1,	%i3,	%l4
	edge16l	%i0,	%g4,	%o3
	fcmpgt16	%f24,	%f8,	%g2
loop_1413:
	xnor	%o2,	0x0EAA,	%g1
	or	%o7,	%o1,	%o5
	bgu,pt	%icc,	loop_1414
	fmovsle	%xcc,	%f20,	%f1
	fcmpne32	%f4,	%f20,	%l2
	fcmpgt32	%f30,	%f0,	%i2
loop_1414:
	nop
	setx	0x360F568F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xA8B7C4D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f31,	%f27
	nop
	setx	loop_1415,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot2	%f6,	%f30,	%f20
	movrgez	%i5,	%l6,	%g5
	wr	%g0,	0x80,	%asi
	sta	%f9,	[%l7 + 0x1C] %asi
loop_1415:
	fmovdvc	%icc,	%f26,	%f9
	nop
	setx	0xC093D126,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x65F1DFF9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f30,	%f31
	movvc	%icc,	%g3,	%i7
	tleu	%xcc,	0x5
	xnor	%i4,	0x0FD5,	%l5
	fnor	%f10,	%f16,	%f20
	edge8ln	%o4,	%l0,	%g6
	tneg	%xcc,	0x6
	array8	%o6,	%o0,	%g7
	nop
	fitos	%f2,	%f7
	fstoi	%f7,	%f6
	tle	%xcc,	0x3
	tneg	%icc,	0x0
	fxnor	%f6,	%f20,	%f20
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i6
	edge16	%l1,	%l3,	%i3
	nop
	set	0x0E, %i4
	ldstub	[%l7 + %i4],	%i1
	fmovrsgez	%l4,	%f11,	%f29
	fmul8x16au	%f1,	%f13,	%f8
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f26
	taddcc	%i0,	0x1C3B,	%g4
	fsrc2	%f30,	%f6
	fornot2	%f20,	%f12,	%f2
	edge8l	%o3,	%g2,	%o2
	nop
	set	0x20, %i6
	stx	%o7,	[%l7 + %i6]
	alignaddrl	%o1,	%g1,	%o5
	nop
	setx	0xCF1C1C7D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x2A58FC4F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f22,	%f11
	tcs	%xcc,	0x2
	fnot2s	%f9,	%f9
	movgu	%xcc,	%i2,	%i5
	orncc	%l6,	%g5,	%g3
	bl,a	loop_1416
	fbug,a	%fcc2,	loop_1417
	tpos	%xcc,	0x5
	fcmpeq32	%f8,	%f28,	%i7
loop_1416:
	tsubcc	%i4,	0x0E04,	%l5
loop_1417:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x50] %asi,	%o4
	xnorcc	%l2,	%l0,	%o6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o0
	bvc,a,pn	%icc,	loop_1418
	alignaddrl	%g7,	%g6,	%l1
	edge16ln	%i6,	%l3,	%i1
	fbue,a	%fcc1,	loop_1419
loop_1418:
	prefetch	[%l7 + 0x40],	 0x2
	ble,a,pt	%xcc,	loop_1420
	or	%i3,	0x1FBC,	%l4
loop_1419:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%f26
loop_1420:
	srlx	%i0,	0x09,	%g4
	umulcc	%g2,	%o2,	%o3
	movrgez	%o7,	%o1,	%o5
	sir	0x1698
	movleu	%icc,	%g1,	%i2
	subccc	%l6,	%i5,	%g3
	ldd	[%l7 + 0x10],	%f18
	ba,a,pn	%icc,	loop_1421
	fbul	%fcc3,	loop_1422
	srl	%i7,	%i4,	%l5
	subccc	%o4,	0x0CB1,	%g5
loop_1421:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1422:
	tl	%xcc,	0x0
	movleu	%xcc,	%l0,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o0,	[%l7 + 0x54]
	move	%xcc,	%l2,	%g7
	taddcc	%l1,	0x0DEC,	%i6
	taddcc	%l3,	0x15B8,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f12,	%f7
	fstox	%f7,	%f22
	fxtos	%f22,	%f11
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%i3
	movleu	%xcc,	%g6,	%l4
	edge32n	%i0,	%g4,	%o2
	sra	%o3,	0x16,	%o7
	te	%icc,	0x1
	array16	%g2,	%o5,	%o1
	srl	%i2,	%l6,	%g1
	popc	%i5,	%i7
	movcc	%xcc,	%i4,	%g3
	sdivx	%o4,	0x13AD,	%g5
	ta	%icc,	0x3
	bne,a	loop_1423
	movcc	%icc,	%l0,	%l5
	wr	%g0,	0xea,	%asi
	stwa	%o6,	[%l7 + 0x78] %asi
	membar	#Sync
loop_1423:
	tge	%xcc,	0x3
	fsrc2s	%f13,	%f30
	tcc	%xcc,	0x3
	sra	%o0,	%l2,	%g7
	fmovscs	%icc,	%f24,	%f18
	sub	%l1,	%i6,	%l3
	orn	%i3,	0x005B,	%g6
	mova	%icc,	%i1,	%l4
	set	0x08, %g6
	stwa	%g4,	[%l7 + %g6] 0x81
	stb	%o2,	[%l7 + 0x44]
	ld	[%l7 + 0x08],	%f10
	nop
	fitod	%f0,	%f6
	fdtos	%f6,	%f31
	tleu	%xcc,	0x5
	ld	[%l7 + 0x50],	%f26
	edge8n	%i0,	%o7,	%g2
	bpos	loop_1424
	fornot2	%f6,	%f24,	%f28
	and	%o3,	%o1,	%i2
	ble,pn	%icc,	loop_1425
loop_1424:
	movg	%icc,	%o5,	%g1
	alignaddr	%i5,	%l6,	%i7
	swap	[%l7 + 0x58],	%i4
loop_1425:
	nop
	fitod	%f0,	%f16
	fdtoi	%f16,	%f30
	sdivcc	%o4,	0x0078,	%g3
	udivx	%l0,	0x01B2,	%l5
	andcc	%o6,	0x139A,	%o0
	movl	%icc,	%g5,	%l2
	edge8ln	%g7,	%l1,	%l3
	nop
	setx	0x71670288806D56D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x32] %asi,	%i6
	movrlz	%g6,	%i3,	%l4
	udivx	%g4,	0x05C5,	%i1
	srl	%o2,	0x1B,	%i0
	mova	%xcc,	%o7,	%o3
	tvc	%xcc,	0x0
	movcs	%icc,	%o1,	%i2
	bn	%icc,	loop_1426
	move	%xcc,	%g2,	%o5
	move	%xcc,	%i5,	%g1
	xnor	%i7,	0x1C58,	%l6
loop_1426:
	fbule	%fcc1,	loop_1427
	mulx	%o4,	0x126A,	%i4
	fcmple32	%f14,	%f2,	%l0
	movpos	%icc,	%g3,	%l5
loop_1427:
	fpsub32s	%f7,	%f2,	%f31
	nop
	setx	0x303F8382,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x3E3CAA82,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f26,	%f21
	sll	%o0,	%g5,	%o6
	nop
	setx	0x4F54FBBADEC0A353,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f28
	nop
	setx	0x793BF372088AA99D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x93EE7F04D24E3586,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f18,	%f22
	tn	%icc,	0x1
	sub	%g7,	0x0A8E,	%l1
	fpsub32s	%f30,	%f16,	%f14
	move	%icc,	%l3,	%i6
	and	%l2,	0x1F75,	%g6
	popc	%i3,	%g4
	fcmple16	%f16,	%f28,	%i1
	fmovdneg	%xcc,	%f2,	%f18
	addccc	%o2,	%l4,	%o7
	set	0x78, %l0
	stha	%i0,	[%l7 + %l0] 0xea
	membar	#Sync
	std	%f0,	[%l7 + 0x78]
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0xf8
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o1,	%o3
	movcs	%icc,	%g2,	%i2
	stw	%i5,	[%l7 + 0x44]
	swap	[%l7 + 0x3C],	%g1
	brgez,a	%i7,	loop_1428
	umul	%l6,	0x1DAB,	%o4
	addcc	%o5,	0x1A6C,	%i4
	movrgez	%g3,	%l5,	%l0
loop_1428:
	ldd	[%l7 + 0x20],	%o0
	fblg	%fcc0,	loop_1429
	fmovsle	%xcc,	%f24,	%f30
	bcs,pn	%icc,	loop_1430
	tneg	%icc,	0x1
loop_1429:
	andncc	%o6,	%g7,	%l1
	array32	%l3,	%i6,	%l2
loop_1430:
	fbe	%fcc2,	loop_1431
	srax	%g5,	0x0A,	%g6
	movcc	%xcc,	%g4,	%i1
	sdivx	%i3,	0x051E,	%l4
loop_1431:
	bn	loop_1432
	nop
	setx loop_1433, %l0, %l1
	jmpl %l1, %o2
	bpos,a	%icc,	loop_1434
	bvc,pn	%xcc,	loop_1435
loop_1432:
	swap	[%l7 + 0x48],	%o7
loop_1433:
	tcs	%icc,	0x4
loop_1434:
	movrlez	%o1,	0x121,	%i0
loop_1435:
	nop
	setx	0x566E37EBAF65E717,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x9C4C53DAC4461B9B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f10,	%f28
	sra	%o3,	0x0E,	%g2
	fpack16	%f20,	%f9
	edge16l	%i2,	%g1,	%i7
	sir	0x1BDC
	stbar
	edge8n	%i5,	%l6,	%o4
	movge	%icc,	%i4,	%o5
	movleu	%xcc,	%l5,	%l0
	alignaddr	%g3,	%o6,	%o0
	andn	%g7,	0x05B0,	%l3
	bcs,pt	%xcc,	loop_1436
	movpos	%icc,	%i6,	%l2
	nop
	setx	0xF33B58A7E7DFD2EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xA7F3B9C9074AA225,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f8,	%f2
	nop
	fitos	%f12,	%f14
	fstoi	%f14,	%f26
loop_1436:
	nop
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l1
	fmovrde	%g6,	%f24,	%f8
	movrlz	%g5,	0x181,	%i1
	tgu	%icc,	0x3
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbue	%fcc3,	loop_1437
	umul	%g4,	%i3,	%l4
	tpos	%xcc,	0x1
	edge16n	%o2,	%o1,	%i0
loop_1437:
	nop
	fitod	%f4,	%f14
	fdtos	%f14,	%f5
	sra	%o7,	0x0C,	%o3
	te	%icc,	0x7
	sir	0x1F3A
	tsubcc	%g2,	0x13D8,	%g1
	sra	%i2,	%i5,	%l6
	addcc	%i7,	0x1B5E,	%o4
	fbne,a	%fcc0,	loop_1438
	edge16	%i4,	%l5,	%l0
	movleu	%xcc,	%g3,	%o5
	edge16n	%o6,	%o0,	%g7
loop_1438:
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f26
	andcc	%i6,	0x103E,	%l3
	edge32	%l2,	%g6,	%l1
	nop
	setx	0x2AD16FE8E050F0A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	move	%icc,	%g5,	%g4
	movne	%icc,	%i3,	%l4
	set	0x68, %l1
	sta	%f14,	[%l7 + %l1] 0x80
	taddcc	%o2,	0x0495,	%o1
	movrgez	%i1,	%o7,	%o3
	stbar
	addcc	%g2,	0x0C0E,	%g1
	tne	%icc,	0x0
	movge	%icc,	%i2,	%i5
	addc	%i0,	0x05E6,	%i7
	edge16l	%o4,	%i4,	%l5
	fmul8x16au	%f10,	%f15,	%f6
	add	%l0,	%l6,	%o5
	add	%o6,	0x1B67,	%o0
	movge	%icc,	%g3,	%g7
	nop
	setx	0xE57EEB48,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f19
	subccc	%i6,	%l3,	%g6
	movrgez	%l2,	%l1,	%g4
	faligndata	%f2,	%f10,	%f18
	nop
	setx	0xA8C82E14262CCB6E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x930DF3743ACD5D76,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f30,	%f10
	addcc	%i3,	%g5,	%l4
	mova	%icc,	%o2,	%i1
	array8	%o1,	%o7,	%g2
	sth	%o3,	[%l7 + 0x54]
	xnorcc	%i2,	0x082E,	%g1
	fpadd16	%f20,	%f24,	%f18
	fmovde	%xcc,	%f19,	%f28
	ldstub	[%l7 + 0x24],	%i5
	sdivcc	%i0,	0x1BEC,	%i7
	tsubcc	%i4,	0x1AF6,	%l5
	array32	%o4,	%l6,	%o5
	wr	%g0,	0x19,	%asi
	stha	%l0,	[%l7 + 0x4A] %asi
	taddcctv	%o6,	%o0,	%g3
	orn	%g7,	%i6,	%g6
	bg,a	loop_1439
	orcc	%l3,	0x1EBD,	%l2
	fcmpgt32	%f2,	%f26,	%g4
	fba,a	%fcc2,	loop_1440
loop_1439:
	edge32ln	%l1,	%g5,	%l4
	fpsub16s	%f6,	%f27,	%f23
	movle	%icc,	%i3,	%o2
loop_1440:
	taddcctv	%i1,	%o7,	%o1
	movne	%icc,	%o3,	%g2
	nop
	setx	0xBDA3867D264F9704,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9905157910D49D62,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f8,	%f18
	movpos	%xcc,	%g1,	%i2
	stx	%i5,	[%l7 + 0x08]
	edge16	%i7,	%i0,	%i4
	umulcc	%o4,	%l6,	%l5
	xor	%o5,	0x1B1A,	%o6
	sir	0x1FE0
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f8
	fxtod	%f8,	%f10
	brlz	%l0,	loop_1441
	ld	[%l7 + 0x18],	%f19
	fpsub16	%f18,	%f16,	%f20
	call	loop_1442
loop_1441:
	alignaddr	%g3,	%o0,	%g7
	udivx	%i6,	0x131F,	%l3
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x4D] %asi,	%l2
loop_1442:
	nop
	fitos	%f9,	%f3
	fstox	%f3,	%f18
	fxtos	%f18,	%f26
	set	0x1A, %o0
	stha	%g6,	[%l7 + %o0] 0x23
	membar	#Sync
	movle	%xcc,	%l1,	%g4
	tvc	%xcc,	0x7
	xnor	%g5,	0x0DCF,	%l4
	edge32n	%i3,	%o2,	%i1
	fbu	%fcc0,	loop_1443
	array8	%o7,	%o3,	%g2
	umul	%o1,	%g1,	%i5
	srl	%i7,	%i2,	%i4
loop_1443:
	nop
	set	0x08, %i0
	prefetcha	[%l7 + %i0] 0x80,	 0x0
	popc	%l6,	%o4
	fble,a	%fcc2,	loop_1444
	sethi	0x0C87,	%l5
	movl	%icc,	%o6,	%o5
	tne	%xcc,	0x4
loop_1444:
	sir	0x0127
	udivcc	%g3,	0x10B1,	%l0
	orncc	%g7,	0x1018,	%i6
	alignaddrl	%o0,	%l3,	%l2
	tgu	%icc,	0x6
	nop
	set	0x7C, %g7
	ldsw	[%l7 + %g7],	%g6
	fmovdvc	%icc,	%f0,	%f9
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x88
	popc	%l1,	%g4
	membar	0x4E
	fmovscc	%icc,	%f9,	%f28
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l4
	set	0x18, %g4
	stxa	%g5,	[%l7 + %g4] 0x18
	movpos	%icc,	%i3,	%o2
	bvc,pn	%xcc,	loop_1445
	fmovdvc	%xcc,	%f9,	%f22
	movrgz	%o7,	0x382,	%o3
	bne	%xcc,	loop_1446
loop_1445:
	edge32	%g2,	%i1,	%o1
	array16	%i5,	%i7,	%g1
	movpos	%xcc,	%i4,	%i0
loop_1446:
	tn	%xcc,	0x0
	tpos	%icc,	0x2
	fmul8x16au	%f12,	%f3,	%f4
	stbar
	faligndata	%f24,	%f16,	%f8
	brlz,a	%l6,	loop_1447
	movrlz	%o4,	0x3EF,	%i2
	fabss	%f12,	%f14
	tleu	%icc,	0x7
loop_1447:
	mulscc	%l5,	0x042F,	%o5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x0c,	%o6,	%g3
	srlx	%g7,	%i6,	%o0
	ldsh	[%l7 + 0x14],	%l3
	fpsub16s	%f8,	%f28,	%f8
	fmovdvs	%icc,	%f8,	%f30
	fone	%f20
	fnand	%f26,	%f0,	%f0
	set	0x44, %g3
	ldswa	[%l7 + %g3] 0x15,	%l0
	fmul8sux16	%f14,	%f28,	%f22
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l2
	add	%l1,	0x15F4,	%g4
	popc	0x1617,	%l4
	bne	loop_1448
	be,a,pn	%icc,	loop_1449
	and	%g6,	%g5,	%o2
	orcc	%o7,	0x18A4,	%o3
loop_1448:
	movl	%icc,	%i3,	%g2
loop_1449:
	mova	%xcc,	%o1,	%i1
	movcs	%icc,	%i7,	%g1
	taddcctv	%i5,	%i0,	%i4
	fbg	%fcc0,	loop_1450
	edge8	%o4,	%l6,	%i2
	edge8l	%l5,	%o6,	%g3
	brlz,a	%g7,	loop_1451
loop_1450:
	move	%xcc,	%i6,	%o0
	fmovsvs	%icc,	%f24,	%f1
	nop
	setx	0x94161FE988827E5B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xACFDA307BD89F9BC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f8,	%f12
loop_1451:
	nop
	set	0x55, %g1
	stba	%l3,	[%l7 + %g1] 0xea
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l0,	%o5,	%l2
	fpadd32s	%f27,	%f29,	%f20
	orcc	%l1,	%g4,	%l4
	movleu	%xcc,	%g5,	%g6
	orncc	%o2,	%o3,	%o7
	fmovsgu	%xcc,	%f25,	%f12
	sllx	%g2,	%o1,	%i3
	fpadd16	%f24,	%f6,	%f28
	edge8	%i1,	%g1,	%i7
	set	0x30, %i7
	lda	[%l7 + %i7] 0x18,	%f4
	array16	%i0,	%i4,	%o4
	tn	%xcc,	0x5
	subc	%l6,	%i5,	%l5
	srlx	%i2,	%o6,	%g3
	array16	%i6,	%o0,	%l3
	fnor	%f18,	%f0,	%f10
	bcs	loop_1452
	swap	[%l7 + 0x10],	%l0
	wr	%g0,	0x19,	%asi
	stha	%o5,	[%l7 + 0x36] %asi
loop_1452:
	edge8n	%l2,	%g7,	%l1
	movrne	%l4,	0x2E6,	%g4
	sllx	%g6,	0x11,	%o2
	edge8l	%o3,	%g5,	%g2
	bneg,a	loop_1453
	ld	[%l7 + 0x60],	%f5
	and	%o7,	0x0832,	%o1
	swap	[%l7 + 0x30],	%i3
loop_1453:
	add	%g1,	%i7,	%i0
	movpos	%icc,	%i1,	%o4
	nop
	setx	0x4A549A6BB062414B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fblg,a	%fcc2,	loop_1454
	ble,a,pn	%xcc,	loop_1455
	popc	%i4,	%l6
	fmovdcc	%xcc,	%f23,	%f22
loop_1454:
	nop
	setx	0x7D609E01,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x982296BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f11,	%f27
loop_1455:
	nop
	setx	0xB10195D53BE811F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x194F4462ADB5178E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f24,	%f24
	bneg,pn	%icc,	loop_1456
	addc	%i5,	%i2,	%l5
	bn,a,pt	%xcc,	loop_1457
	fmovda	%icc,	%f8,	%f14
loop_1456:
	fbo,a	%fcc2,	loop_1458
	sllx	%g3,	%o6,	%o0
loop_1457:
	edge32l	%i6,	%l0,	%l3
	fzero	%f16
loop_1458:
	fcmpeq32	%f18,	%f16,	%l2
	edge8ln	%g7,	%l1,	%l4
	movrlz	%g4,	0x10A,	%o5
	movneg	%xcc,	%g6,	%o3
	nop
	setx	0x5056513D,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	ldub	[%l7 + 0x2C],	%o2
	movrlz	%g2,	0x1BB,	%g5
	alignaddrl	%o1,	%i3,	%o7
	movvs	%xcc,	%g1,	%i7
	sir	0x18BD
	alignaddr	%i1,	%o4,	%i4
	bg,a,pn	%xcc,	loop_1459
	sdivcc	%l6,	0x0533,	%i5
	brlez,a	%i0,	loop_1460
	alignaddrl	%l5,	%g3,	%o6
loop_1459:
	ta	%icc,	0x1
	be,pt	%xcc,	loop_1461
loop_1460:
	fpsub32	%f28,	%f18,	%f28
	tpos	%xcc,	0x6
	orcc	%o0,	%i6,	%i2
loop_1461:
	edge32l	%l3,	%l2,	%l0
	membar	0x76
	srax	%l1,	%g7,	%l4
	edge8l	%o5,	%g4,	%o3
	movl	%xcc,	%g6,	%g2
	fandnot1	%f6,	%f24,	%f6
	fandnot1	%f26,	%f8,	%f28
	flush	%l7 + 0x28
	prefetch	[%l7 + 0x24],	 0x1
	subccc	%o2,	%g5,	%o1
	sra	%i3,	0x13,	%o7
	srax	%g1,	%i1,	%i7
	fmovscs	%xcc,	%f3,	%f14
	umulcc	%o4,	%i4,	%i5
	xnorcc	%i0,	0x03EB,	%l5
	srax	%g3,	%o6,	%l6
	andcc	%o0,	0x0FF0,	%i6
	fmovsle	%icc,	%f10,	%f1
	tge	%icc,	0x0
	andcc	%l3,	%i2,	%l2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	bneg,pt	%xcc,	loop_1462
	udiv	%l1,	0x0457,	%g7
	fnands	%f2,	%f10,	%f0
	tl	%xcc,	0x5
loop_1462:
	xnor	%o5,	0x02B6,	%g4
	fbul	%fcc3,	loop_1463
	stx	%l4,	[%l7 + 0x30]
	wr	%g0,	0x89,	%asi
	sta	%f18,	[%l7 + 0x3C] %asi
loop_1463:
	edge32n	%o3,	%g2,	%g6
	array8	%g5,	%o1,	%i3
	swap	[%l7 + 0x10],	%o7
	fmovrdne	%g1,	%f4,	%f18
	subcc	%i1,	%i7,	%o2
	bn	%icc,	loop_1464
	edge16l	%i4,	%o4,	%i5
	subccc	%i0,	0x1482,	%g3
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%o6,	%l6
loop_1464:
	fabsd	%f18,	%f30
	fbn,a	%fcc0,	loop_1465
	edge16	%o0,	%i6,	%l5
	nop
	setx	0xDEA56943,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x809F3D6E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f7,	%f10
	tcs	%icc,	0x7
loop_1465:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%l2
	tle	%xcc,	0x1
	fbo,a	%fcc1,	loop_1466
	nop
	setx	0x83F724BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x3ABDD6C6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f6,	%f17
	fmuld8sux16	%f6,	%f22,	%f8
	udivcc	%l0,	0x12E6,	%i2
loop_1466:
	ldstub	[%l7 + 0x56],	%l1
	fmovdne	%xcc,	%f9,	%f26
	fble,a	%fcc1,	loop_1467
	fmovdpos	%icc,	%f25,	%f13
	lduw	[%l7 + 0x14],	%g7
	tleu	%xcc,	0x3
loop_1467:
	fabsd	%f2,	%f2
	movge	%xcc,	%g4,	%l4
	edge16l	%o5,	%o3,	%g6
	nop
	fitos	%f7,	%f11
	fstoi	%f11,	%f6
	brnz	%g2,	loop_1468
	tsubcctv	%g5,	0x1AF2,	%i3
	fmovdcc	%icc,	%f23,	%f25
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x18] %asi,	%o7
loop_1468:
	xnor	%o1,	0x11B3,	%g1
	add	%i7,	0x1AD3,	%o2
	stw	%i1,	[%l7 + 0x14]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x72],	%o4
	movg	%xcc,	%i4,	%i5
	fbule,a	%fcc2,	loop_1469
	fnot1s	%f12,	%f23
	movg	%icc,	%g3,	%o6
	sethi	0x0C69,	%i0
loop_1469:
	movgu	%icc,	%o0,	%l6
	bleu,a	%icc,	loop_1470
	srl	%i6,	%l5,	%l2
	nop
	set	0x51, %l3
	ldub	[%l7 + %l3],	%l0
	andn	%i2,	0x16B2,	%l3
loop_1470:
	tleu	%icc,	0x0
	tvc	%xcc,	0x0
	fandnot2	%f10,	%f4,	%f18
	tl	%icc,	0x0
	fbl	%fcc2,	loop_1471
	bcs,a	%icc,	loop_1472
	fmovse	%xcc,	%f27,	%f15
	sdivcc	%g7,	0x035E,	%l1
loop_1471:
	brlez	%l4,	loop_1473
loop_1472:
	array8	%g4,	%o5,	%o3
	mulscc	%g6,	0x1BD5,	%g5
	movg	%xcc,	%g2,	%o7
loop_1473:
	nop
	fitos	%f6,	%f29
	fstod	%f29,	%f10
	movge	%xcc,	%o1,	%g1
	fand	%f26,	%f26,	%f4
	bcc,a	loop_1474
	nop
	fitos	%f5,	%f0
	ta	%xcc,	0x3
	ta	%icc,	0x4
loop_1474:
	movn	%icc,	%i7,	%i3
	edge32l	%i1,	%o2,	%o4
	xnorcc	%i5,	0x0FB6,	%i4
	fbuge,a	%fcc1,	loop_1475
	edge8n	%g3,	%i0,	%o6
	ld	[%l7 + 0x20],	%f0
	edge16l	%o0,	%i6,	%l5
loop_1475:
	subccc	%l6,	0x13D2,	%l0
	fmovrslez	%i2,	%f21,	%f8
	fbug	%fcc0,	loop_1476
	array16	%l3,	%l2,	%l1
	smulcc	%l4,	0x073F,	%g4
	edge16	%o5,	%g7,	%o3
loop_1476:
	srax	%g5,	0x1D,	%g2
	ba,a	%icc,	loop_1477
	movg	%icc,	%o7,	%g6
	sub	%o1,	%g1,	%i3
	tgu	%icc,	0x4
loop_1477:
	fbe,a	%fcc2,	loop_1478
	ldsb	[%l7 + 0x2F],	%i7
	sub	%i1,	0x0AA3,	%o2
	sll	%i5,	0x1D,	%o4
loop_1478:
	movcs	%xcc,	%i4,	%g3
	tl	%icc,	0x3
	nop
	set	0x58, %o3
	ldsw	[%l7 + %o3],	%i0
	membar	0x1B
	fabsd	%f6,	%f16
	fmuld8sux16	%f24,	%f22,	%f20
	movcc	%icc,	%o0,	%o6
	fornot2s	%f22,	%f3,	%f11
	fbo	%fcc2,	loop_1479
	fcmpne16	%f24,	%f18,	%l5
	sir	0x1FFF
	fmovdneg	%icc,	%f29,	%f17
loop_1479:
	popc	%l6,	%l0
	tsubcctv	%i2,	%l3,	%i6
	tcc	%xcc,	0x0
	tsubcc	%l2,	%l1,	%g4
	tcc	%xcc,	0x6
	umulcc	%o5,	%l4,	%g7
	ba,a,pn	%icc,	loop_1480
	edge8n	%o3,	%g2,	%g5
	sra	%o7,	0x1A,	%g6
	alignaddrl	%g1,	%o1,	%i3
loop_1480:
	bg	%icc,	loop_1481
	nop
	setx	0x4762FF9286737305,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x97E062C0823C8C4F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f10,	%f22
	fcmpgt32	%f2,	%f28,	%i7
	fpack32	%f14,	%f2,	%f0
loop_1481:
	add	%o2,	%i5,	%i1
	ld	[%l7 + 0x68],	%f0
	nop
	setx	loop_1482,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movre	%i4,	%o4,	%g3
	tle	%xcc,	0x1
	fbule	%fcc3,	loop_1483
loop_1482:
	fpackfix	%f2,	%f11
	umulcc	%o0,	%o6,	%i0
	xnorcc	%l5,	0x0E4A,	%l6
loop_1483:
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f22
	fxtod	%f22,	%f26
	udivcc	%i2,	0x129F,	%l3
	fcmpne16	%f12,	%f8,	%i6
	fornot1	%f10,	%f22,	%f4
	fzero	%f30
	tcc	%icc,	0x5
	movcs	%icc,	%l0,	%l2
	brgez,a	%l1,	loop_1484
	mulx	%o5,	0x068D,	%l4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%g4
loop_1484:
	move	%xcc,	%g2,	%g5
	fble	%fcc3,	loop_1485
	fmovd	%f12,	%f18
	fandnot2s	%f13,	%f15,	%f22
	edge32n	%o3,	%o7,	%g6
loop_1485:
	fmovdge	%icc,	%f8,	%f3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bvs,a,pn	%icc,	loop_1486
	fnot2	%f26,	%f28
	tle	%icc,	0x5
	tleu	%icc,	0x1
loop_1486:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x58] %asi,	%g1
	sdiv	%o1,	0x0907,	%i7
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i3
	tpos	%icc,	0x7
	te	%xcc,	0x1
	nop
	set	0x46, %g5
	stb	%o2,	[%l7 + %g5]
	edge8n	%i5,	%i4,	%i1
	popc	0x029E,	%o4
	orncc	%g3,	%o6,	%o0
	fble	%fcc2,	loop_1487
	edge16ln	%i0,	%l6,	%l5
	or	%i2,	0x1BFE,	%l3
	tneg	%icc,	0x1
loop_1487:
	ble,a,pn	%icc,	loop_1488
	movg	%xcc,	%i6,	%l0
	fpackfix	%f12,	%f16
	tleu	%xcc,	0x2
loop_1488:
	tl	%xcc,	0x6
	tl	%icc,	0x2
	bne	%xcc,	loop_1489
	fble,a	%fcc0,	loop_1490
	sdivx	%l2,	0x14B9,	%o5
	movgu	%icc,	%l4,	%l1
loop_1489:
	brgz	%g4,	loop_1491
loop_1490:
	fbue	%fcc1,	loop_1492
	umulcc	%g7,	%g5,	%g2
	tgu	%icc,	0x6
loop_1491:
	movrgz	%o3,	%g6,	%g1
loop_1492:
	sdiv	%o7,	0x1DD8,	%o1
	fcmple32	%f14,	%f4,	%i7
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
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
	tcc	%icc,	0x0
	edge16n	%i5,	%i3,	%i4
	faligndata	%f6,	%f4,	%f18
loop_1493:
	fpack16	%f30,	%f2
	st	%f6,	[%l7 + 0x14]
	ldsw	[%l7 + 0x7C],	%o4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i1
	fand	%f0,	%f10,	%f24
	fmuld8ulx16	%f7,	%f7,	%f26
	movrgez	%o6,	%g3,	%i0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%l5
	movgu	%xcc,	%l6,	%i2
	taddcctv	%l3,	0x10C9,	%i6
	sdivcc	%l0,	0x041B,	%o5
	fmul8x16au	%f2,	%f7,	%f8
	tgu	%xcc,	0x3
	fpmerge	%f3,	%f28,	%f18
	ld	[%l7 + 0x74],	%f19
	fmovdn	%xcc,	%f5,	%f11
	movg	%xcc,	%l4,	%l1
	fcmpgt16	%f22,	%f8,	%g4
	fand	%f18,	%f8,	%f14
	tvc	%xcc,	0x5
	nop
	setx	0x406B4BF8,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	orncc	%g7,	0x1689,	%g5
	edge16l	%g2,	%l2,	%o3
	bl	%xcc,	loop_1494
	fcmpgt16	%f20,	%f20,	%g1
	andn	%o7,	%g6,	%o1
	edge8l	%i7,	%o2,	%i5
loop_1494:
	be	loop_1495
	ldsw	[%l7 + 0x70],	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo,a	%fcc2,	loop_1496
loop_1495:
	movg	%xcc,	%i4,	%i1
	popc	0x052A,	%o4
	udivcc	%g3,	0x09AD,	%i0
loop_1496:
	xnorcc	%o6,	%o0,	%l6
	ble,a	loop_1497
	tvc	%icc,	0x1
	umul	%i2,	0x0539,	%l3
	bleu	%icc,	loop_1498
loop_1497:
	and	%i6,	%l0,	%o5
	nop
	setx	0xA8FE9C1EC922CFA6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x104E41CB2C371BBF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f2,	%f4
	ld	[%l7 + 0x48],	%f11
loop_1498:
	tcc	%icc,	0x3
	bshuffle	%f30,	%f8,	%f4
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x11,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%l1,	%f24,	%f3
	andncc	%g4,	%l5,	%g7
	tg	%xcc,	0x7
	udiv	%g5,	0x1B6B,	%l2
	or	%o3,	0x15F5,	%g1
	tgu	%icc,	0x0
	fors	%f23,	%f8,	%f1
	umul	%g2,	%o7,	%g6
	nop
	fitod	%f10,	%f2
	fdtos	%f2,	%f19
	movre	%i7,	0x3FF,	%o2
	tne	%icc,	0x1
	fpack16	%f8,	%f24
	fmovrse	%i5,	%f2,	%f21
	or	%o1,	0x04C3,	%i4
	subccc	%i1,	0x1FC4,	%i3
	sdivx	%g3,	0x18D4,	%o4
	tvc	%icc,	0x4
	nop
	setx	0xFF416118,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x9BE7A801,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f7,	%f9
	movleu	%icc,	%i0,	%o6
	fbe	%fcc3,	loop_1499
	array16	%o0,	%l6,	%i2
	nop
	fitos	%f7,	%f9
	fstod	%f9,	%f12
	fnot1s	%f11,	%f12
loop_1499:
	fbne,a	%fcc1,	loop_1500
	movneg	%xcc,	%i6,	%l0
	membar	0x6E
	fpackfix	%f12,	%f1
loop_1500:
	ldsb	[%l7 + 0x2E],	%l3
	array8	%l4,	%l1,	%g4
	edge32ln	%o5,	%l5,	%g7
	fmovrdlz	%g5,	%f4,	%f22
	nop
	fitos	%f8,	%f2
	fstoi	%f2,	%f3
	fnot1	%f2,	%f2
	be,pt	%icc,	loop_1501
	sllx	%o3,	%l2,	%g1
	popc	%g2,	%o7
	xnor	%g6,	%i7,	%i5
loop_1501:
	smul	%o1,	0x133D,	%o2
	fones	%f10
	te	%xcc,	0x0
	mova	%xcc,	%i4,	%i1
	tsubcctv	%i3,	0x1ACA,	%g3
	movrlez	%i0,	%o6,	%o4
	addcc	%o0,	0x058F,	%l6
	tle	%xcc,	0x5
	sir	0x1D8C
	fmovrsne	%i6,	%f31,	%f4
	edge32n	%i2,	%l0,	%l4
	fbul,a	%fcc2,	loop_1502
	fpsub16	%f6,	%f24,	%f20
	fmovsneg	%xcc,	%f17,	%f30
	ldsw	[%l7 + 0x44],	%l1
loop_1502:
	fone	%f8
	fmovdn	%xcc,	%f15,	%f8
	fbo	%fcc0,	loop_1503
	fmovdneg	%xcc,	%f14,	%f5
	movrlz	%g4,	%l3,	%o5
	tg	%xcc,	0x1
loop_1503:
	movle	%icc,	%g7,	%l5
	addc	%o3,	0x1C35,	%l2
	fmovdneg	%icc,	%f7,	%f16
	xnor	%g1,	%g2,	%g5
	fmovdleu	%xcc,	%f24,	%f17
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x04,	%o7,	%i7
	add	%g6,	%i5,	%o2
	addc	%i4,	%o1,	%i1
	fbne,a	%fcc3,	loop_1504
	bleu,a,pn	%icc,	loop_1505
	andn	%g3,	0x0CB6,	%i0
	movpos	%xcc,	%o6,	%o4
loop_1504:
	sdiv	%o0,	0x13A4,	%l6
loop_1505:
	tge	%xcc,	0x6
	movle	%xcc,	%i6,	%i2
	fmovscc	%xcc,	%f22,	%f11
	smulcc	%i3,	%l4,	%l0
	tsubcctv	%g4,	0x143D,	%l1
	ldub	[%l7 + 0x64],	%o5
	tl	%xcc,	0x7
	edge32n	%l3,	%l5,	%o3
	movcs	%icc,	%g7,	%l2
	orcc	%g1,	%g5,	%o7
	sdiv	%i7,	0x07D3,	%g6
	andcc	%g2,	0x180D,	%o2
	pdist	%f10,	%f30,	%f8
	movn	%xcc,	%i5,	%o1
	fnot2s	%f25,	%f26
	udiv	%i4,	0x0243,	%i1
	tgu	%xcc,	0x4
	tsubcc	%g3,	%o6,	%i0
	prefetch	[%l7 + 0x34],	 0x2
	or	%o0,	0x0D22,	%l6
	movpos	%xcc,	%o4,	%i2
	move	%icc,	%i6,	%i3
	array8	%l4,	%g4,	%l1
	fmovsneg	%icc,	%f17,	%f15
	edge16l	%o5,	%l3,	%l5
	movge	%icc,	%o3,	%l0
	set	0x28, %l4
	ldxa	[%l7 + %l4] 0x81,	%l2
	smulcc	%g7,	0x0B23,	%g5
	tg	%xcc,	0x0
	for	%f22,	%f2,	%f30
	orn	%g1,	%o7,	%i7
	move	%xcc,	%g2,	%g6
	movneg	%xcc,	%i5,	%o1
	fone	%f14
	fmul8ulx16	%f4,	%f24,	%f22
	udivx	%o2,	0x08BD,	%i4
	edge8	%i1,	%g3,	%i0
	movleu	%xcc,	%o6,	%o0
	edge8n	%o4,	%i2,	%l6
	fmovdcs	%icc,	%f21,	%f17
	orn	%i6,	0x1874,	%i3
	fmovsl	%icc,	%f1,	%f22
	edge32l	%l4,	%g4,	%o5
	movvc	%xcc,	%l3,	%l5
	fmovs	%f23,	%f7
	tvs	%xcc,	0x4
	fzero	%f20
	wr	%g0,	0x88,	%asi
	sta	%f22,	[%l7 + 0x70] %asi
	srlx	%l1,	%o3,	%l0
	bl,pn	%icc,	loop_1506
	andn	%l2,	%g7,	%g1
	fbl	%fcc0,	loop_1507
	tcc	%icc,	0x2
loop_1506:
	tpos	%xcc,	0x4
	edge16n	%g5,	%i7,	%o7
loop_1507:
	tsubcctv	%g6,	%i5,	%g2
	fmovsle	%icc,	%f14,	%f10
	stw	%o1,	[%l7 + 0x24]
	tn	%xcc,	0x6
	movre	%i4,	0x270,	%o2
	fbe	%fcc2,	loop_1508
	edge16	%i1,	%g3,	%o6
	srax	%i0,	%o0,	%o4
	xor	%i2,	0x0241,	%i6
loop_1508:
	popc	0x1343,	%i3
	fmul8x16al	%f6,	%f20,	%f26
	fbe,a	%fcc1,	loop_1509
	tne	%icc,	0x2
	tcc	%xcc,	0x6
	umulcc	%l6,	%g4,	%l4
loop_1509:
	fpmerge	%f5,	%f7,	%f28
	array8	%l3,	%o5,	%l5
	fmovspos	%xcc,	%f24,	%f13
	fones	%f14
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l1
	fmovrde	%o3,	%f24,	%f8
	bn	%icc,	loop_1510
	nop
	fitos	%f4,	%f22
	fstox	%f22,	%f30
	movcs	%icc,	%l0,	%g7
	fble,a	%fcc1,	loop_1511
loop_1510:
	fmovdpos	%icc,	%f13,	%f1
	srl	%l2,	0x19,	%g5
	fbu	%fcc2,	loop_1512
loop_1511:
	mulscc	%g1,	%i7,	%o7
	movrlez	%i5,	%g2,	%g6
	ldsb	[%l7 + 0x1C],	%i4
loop_1512:
	fbe	%fcc0,	loop_1513
	edge16l	%o1,	%i1,	%o2
	fnot2s	%f2,	%f27
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
loop_1513:
	tge	%icc,	0x3
	movcs	%xcc,	%i0,	%o6
	set	0x5E, %o1
	ldsba	[%l7 + %o1] 0x0c,	%o4
	fbu	%fcc3,	loop_1514
	bgu,a,pn	%xcc,	loop_1515
	movcs	%icc,	%o0,	%i6
	movle	%xcc,	%i3,	%l6
loop_1514:
	movl	%xcc,	%g4,	%i2
loop_1515:
	ldstub	[%l7 + 0x74],	%l4
	fbu,a	%fcc1,	loop_1516
	fmul8x16	%f4,	%f20,	%f0
	nop
	setx	0x2B829F1C406AAE93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	set	0x78, %l6
	lduwa	[%l7 + %l6] 0x15,	%l3
loop_1516:
	fbule,a	%fcc2,	loop_1517
	umulcc	%o5,	0x071D,	%l5
	fmovdl	%icc,	%f7,	%f6
	edge32	%l1,	%o3,	%l0
loop_1517:
	sdiv	%l2,	0x0237,	%g7
	brgz,a	%g5,	loop_1518
	taddcc	%i7,	%g1,	%i5
	tgu	%xcc,	0x6
	movre	%g2,	%g6,	%i4
loop_1518:
	ba,a	loop_1519
	nop
	setx	0xF4E0410666A078B3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x81A52BAF9EF18CDC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f30,	%f0
	brnz	%o7,	loop_1520
	array32	%o1,	%i1,	%o2
loop_1519:
	edge16l	%i0,	%g3,	%o6
	addcc	%o4,	%i6,	%o0
loop_1520:
	orncc	%i3,	%l6,	%i2
	te	%icc,	0x6
	fpack32	%f4,	%f0,	%f22
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x21] %asi,	%g4
	sub	%l3,	0x0737,	%l4
	fbul	%fcc0,	loop_1521
	fornot1	%f6,	%f30,	%f22
	sir	0x12EF
	nop
	setx	0x03195202,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f24
loop_1521:
	mova	%xcc,	%o5,	%l5
	bne,a	loop_1522
	movrlz	%l1,	%l0,	%o3
	fmovrdgez	%l2,	%f8,	%f10
	addcc	%g5,	0x12AA,	%g7
loop_1522:
	movgu	%icc,	%g1,	%i7
	move	%icc,	%g2,	%i5
	movn	%xcc,	%g6,	%i4
	wr	%g0,	0xe3,	%asi
	stwa	%o7,	[%l7 + 0x7C] %asi
	membar	#Sync
	stbar
	array16	%o1,	%i1,	%i0
	tgu	%xcc,	0x4
	orncc	%g3,	%o6,	%o2
	ldsb	[%l7 + 0x15],	%o4
	ld	[%l7 + 0x78],	%f13
	fbug	%fcc1,	loop_1523
	or	%i6,	%i3,	%l6
	fbge	%fcc2,	loop_1524
	sethi	0x082C,	%i2
loop_1523:
	fmovrdlez	%o0,	%f12,	%f10
	popc	0x045A,	%g4
loop_1524:
	edge8l	%l4,	%l3,	%o5
	srl	%l5,	%l1,	%o3
	movvs	%xcc,	%l0,	%l2
	stbar
	lduw	[%l7 + 0x28],	%g7
	tpos	%xcc,	0x1
	brlez	%g5,	loop_1525
	sdiv	%i7,	0x0F77,	%g2
	subccc	%i5,	%g6,	%g1
	ldub	[%l7 + 0x3A],	%i4
loop_1525:
	smul	%o1,	0x0191,	%i1
	tvs	%xcc,	0x5
	movcc	%icc,	%o7,	%i0
	bgu,a,pt	%icc,	loop_1526
	sth	%g3,	[%l7 + 0x68]
	umul	%o2,	0x1580,	%o6
	brz	%o4,	loop_1527
loop_1526:
	add	%i6,	0x1183,	%i3
	array16	%i2,	%o0,	%g4
	fbu	%fcc2,	loop_1528
loop_1527:
	stb	%l4,	[%l7 + 0x25]
	udiv	%l3,	0x0F4A,	%l6
	subccc	%l5,	%l1,	%o5
loop_1528:
	edge32	%o3,	%l0,	%l2
	taddcc	%g5,	0x0F48,	%i7
	movrlz	%g7,	0x039,	%i5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movle	%icc,	%g2,	%g6
	fnands	%f7,	%f12,	%f9
	andn	%g1,	0x1B38,	%o1
	fbg,a	%fcc1,	loop_1529
	orn	%i1,	0x1E65,	%o7
	srax	%i4,	%g3,	%o2
	fble,a	%fcc0,	loop_1530
loop_1529:
	movleu	%icc,	%i0,	%o4
	movrgez	%i6,	0x268,	%i3
	array32	%i2,	%o6,	%o0
loop_1530:
	bne,a	loop_1531
	edge32n	%g4,	%l3,	%l6
	sth	%l4,	[%l7 + 0x48]
	smulcc	%l5,	0x1F89,	%o5
loop_1531:
	sth	%o3,	[%l7 + 0x70]
	membar	0x26
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x70] %asi,	%l1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x20] %asi,	%l0
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	setx	0xEE66CDB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xF5767586,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f31,	%f26
	movl	%icc,	%g5,	%l2
	movle	%xcc,	%g7,	%i7
	umul	%g2,	0x1961,	%i5
	fmovdleu	%xcc,	%f13,	%f29
	movrne	%g1,	%g6,	%i1
	edge16n	%o1,	%i4,	%o7
	fmovsvc	%icc,	%f6,	%f6
	ldx	[%l7 + 0x20],	%o2
	fbuge,a	%fcc1,	loop_1532
	nop
	fitod	%f0,	%f10
	fdtoi	%f10,	%f18
	edge32	%g3,	%o4,	%i0
	fmovrse	%i3,	%f26,	%f27
loop_1532:
	nop
	set	0x74, %o6
	sta	%f25,	[%l7 + %o6] 0x10
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
	movg	%icc,	%i2,	%i6
	movrgez	%o6,	%o0,	%g4
	nop
	setx	0x09A67E56,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x35D3BE50,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f26,	%f14
	taddcc	%l6,	0x1D56,	%l4
	nop
	fitos	%f10,	%f3
	fstoi	%f3,	%f18
	addcc	%l3,	0x08E8,	%l5
	fbuge	%fcc3,	loop_1533
	fbuge	%fcc1,	loop_1534
	add	%o3,	%l1,	%o5
	fornot1s	%f24,	%f15,	%f18
loop_1533:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1534:
	xor	%g5,	0x117F,	%l2
	movrne	%g7,	0x37A,	%l0
	edge32n	%i7,	%i5,	%g1
	tvc	%xcc,	0x4
	edge8l	%g2,	%i1,	%o1
	andn	%g6,	0x13EB,	%o7
	tg	%icc,	0x6
	alignaddr	%i4,	%g3,	%o4
	alignaddr	%i0,	%i3,	%o2
	mova	%icc,	%i2,	%i6
	movge	%xcc,	%o0,	%g4
	srax	%o6,	0x06,	%l4
	fxnors	%f4,	%f10,	%f19
	fcmpeq32	%f24,	%f10,	%l3
	fbe,a	%fcc3,	loop_1535
	orn	%l6,	%l5,	%o3
	nop
	setx	0x705DC2E0,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	st	%f28,	[%l7 + 0x6C]
loop_1535:
	fands	%f29,	%f12,	%f9
	ldub	[%l7 + 0x6A],	%l1
	st	%f30,	[%l7 + 0x50]
	set	0x30, %i1
	stxa	%o5,	[%l7 + %i1] 0x80
	edge16n	%l2,	%g5,	%l0
	fexpand	%f30,	%f22
	lduw	[%l7 + 0x44],	%g7
	fmovrdne	%i5,	%f16,	%f4
	fnands	%f10,	%f1,	%f24
	tcc	%xcc,	0x3
	ba,a	%xcc,	loop_1536
	edge16	%i7,	%g2,	%g1
	andcc	%i1,	%g6,	%o1
	tsubcc	%i4,	%o7,	%g3
loop_1536:
	call	loop_1537
	fmovrse	%o4,	%f3,	%f19
	bne	%icc,	loop_1538
	ldd	[%l7 + 0x60],	%i2
loop_1537:
	fbug	%fcc2,	loop_1539
	movn	%icc,	%o2,	%i0
loop_1538:
	be,a,pt	%xcc,	loop_1540
	brgez	%i6,	loop_1541
loop_1539:
	tvs	%icc,	0x2
	tvc	%xcc,	0x3
loop_1540:
	ldstub	[%l7 + 0x40],	%i2
loop_1541:
	fmovrde	%o0,	%f28,	%f22
	fsrc1	%f24,	%f14
	edge32	%o6,	%l4,	%g4
	fxor	%f20,	%f28,	%f22
	popc	%l3,	%l6
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
	movrlez	%l5,	0x1DE,	%o5
	fand	%f28,	%f30,	%f18
	nop
	setx loop_1542, %l0, %l1
	jmpl %l1, %l2
	movgu	%icc,	%l1,	%l0
	fmovde	%icc,	%f3,	%f22
	fornot1	%f6,	%f22,	%f24
loop_1542:
	movneg	%xcc,	%g7,	%i5
	nop
	setx	0x7EF9CDEDC25CC738,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x74191FD87361A439,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f22,	%f24
	nop
	setx	0x55F9C6D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x18F73E97,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fsubs	%f7,	%f14,	%f10
	brgez,a	%g5,	loop_1543
	movrlz	%g2,	%g1,	%i1
	tle	%xcc,	0x5
	movcc	%icc,	%g6,	%o1
loop_1543:
	nop
	wr	%g0,	0x80,	%asi
	stha	%i7,	[%l7 + 0x58] %asi
	fmovrsne	%i4,	%f25,	%f30
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x20] %asi,	%f31
	movne	%icc,	%g3,	%o4
	popc	0x123D,	%o7
	sdiv	%i3,	0x068A,	%o2
	tle	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%i6
	faligndata	%f24,	%f2,	%f4
	udiv	%i0,	0x07AE,	%o0
	umulcc	%i2,	%l4,	%o6
	movne	%xcc,	%l3,	%l6
	movrlz	%g4,	%o3,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l5,	%l1,	%l0
	fnot1	%f6,	%f4
	srl	%l2,	%i5,	%g7
	tge	%icc,	0x2
	call	loop_1544
	edge8	%g5,	%g1,	%g2
	tcs	%xcc,	0x7
	ba	%xcc,	loop_1545
loop_1544:
	taddcctv	%g6,	%o1,	%i7
	tsubcc	%i4,	%i1,	%g3
	ba	%icc,	loop_1546
loop_1545:
	brz,a	%o7,	loop_1547
	movcc	%icc,	%i3,	%o4
	fnot2	%f2,	%f14
loop_1546:
	movrgz	%i6,	%o2,	%i0
loop_1547:
	edge16	%o0,	%i2,	%l4
	fmul8sux16	%f26,	%f16,	%f24
	taddcc	%l3,	0x0764,	%l6
	umulcc	%o6,	0x0B4E,	%o3
	fands	%f2,	%f1,	%f6
	sdiv	%g4,	0x0991,	%l5
	fmuld8sux16	%f8,	%f25,	%f28
	mulscc	%o5,	%l0,	%l2
	move	%icc,	%l1,	%i5
	edge16ln	%g7,	%g1,	%g2
	tsubcc	%g5,	%o1,	%g6
	ldd	[%l7 + 0x48],	%i6
	fbg,a	%fcc1,	loop_1548
	nop
	setx	loop_1549,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movn	%xcc,	%i1,	%g3
	movrgz	%o7,	%i3,	%o4
loop_1548:
	edge16n	%i4,	%i6,	%i0
loop_1549:
	fmovdvs	%icc,	%f21,	%f0
	tn	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o0,	%i2,	%l4
	tge	%xcc,	0x7
	stw	%o2,	[%l7 + 0x44]
	ldub	[%l7 + 0x2C],	%l3
	set	0x28, %o2
	ldxa	[%l7 + %o2] 0x18,	%o6
	ldstub	[%l7 + 0x53],	%l6
	movneg	%xcc,	%g4,	%o3
	bneg,a,pn	%icc,	loop_1550
	srlx	%o5,	%l0,	%l5
	sdiv	%l1,	0x05A1,	%l2
	mova	%xcc,	%i5,	%g7
loop_1550:
	tle	%xcc,	0x2
	alignaddr	%g1,	%g2,	%o1
	movvs	%icc,	%g6,	%g5
	fmul8x16	%f31,	%f6,	%f14
	tle	%xcc,	0x7
	sdiv	%i1,	0x0346,	%g3
	fbuge,a	%fcc2,	loop_1551
	bge,pt	%xcc,	loop_1552
	mova	%xcc,	%i7,	%o7
	nop
	set	0x20, %l2
	ldx	[%l7 + %l2],	%o4
loop_1551:
	fmovsa	%xcc,	%f15,	%f6
loop_1552:
	mulscc	%i3,	0x00D8,	%i4
	movcc	%icc,	%i0,	%i6
	subcc	%o0,	%i2,	%o2
	movge	%xcc,	%l4,	%o6
	movvc	%xcc,	%l3,	%l6
	fmovsle	%xcc,	%f10,	%f8
	set	0x2C, %i5
	lduwa	[%l7 + %i5] 0x10,	%o3
	fbne,a	%fcc3,	loop_1553
	xnor	%g4,	%l0,	%l5
	mulscc	%o5,	%l1,	%l2
	addcc	%g7,	%g1,	%i5
loop_1553:
	sll	%g2,	0x18,	%g6
	ble,a,pt	%xcc,	loop_1554
	movg	%icc,	%o1,	%i1
	fbn,a	%fcc3,	loop_1555
	and	%g5,	%i7,	%o7
loop_1554:
	stbar
	array16	%g3,	%o4,	%i4
loop_1555:
	nop
	fitod	%f17,	%f18
	fpsub32s	%f9,	%f31,	%f30
	fmovrdlz	%i3,	%f4,	%f0
	ldstub	[%l7 + 0x5D],	%i6
	movn	%icc,	%i0,	%o0
	set	0x28, %o4
	sta	%f11,	[%l7 + %o4] 0x14
	alignaddrl	%i2,	%o2,	%o6
	edge16l	%l3,	%l6,	%l4
	bvs,pn	%icc,	loop_1556
	edge8l	%g4,	%l0,	%o3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x48] %asi,	%l5
loop_1556:
	nop
	setx	loop_1557,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%o5,	0x0262,	%l1
	nop
	setx	0x304540D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	fnot1	%f18,	%f2
loop_1557:
	tl	%icc,	0x0
	nop
	set	0x48, %g2
	prefetch	[%l7 + %g2],	 0x3
	tsubcctv	%g7,	%l2,	%i5
	movre	%g2,	%g6,	%g1
	fpadd16	%f28,	%f18,	%f20
	bne,a	%xcc,	loop_1558
	andn	%o1,	0x0CE5,	%g5
	fmovscs	%xcc,	%f21,	%f17
	fbe,a	%fcc2,	loop_1559
loop_1558:
	fpsub16	%f30,	%f8,	%f28
	edge32ln	%i7,	%o7,	%i1
	stbar
loop_1559:
	edge32n	%g3,	%o4,	%i4
	movne	%xcc,	%i3,	%i6
	addcc	%i0,	%o0,	%o2
	udivcc	%o6,	0x0F17,	%i2
	srlx	%l6,	%l3,	%l4
	tvc	%xcc,	0x0
	fbne,a	%fcc3,	loop_1560
	srlx	%l0,	0x1A,	%o3
	bcc,a	loop_1561
	movne	%xcc,	%g4,	%o5
loop_1560:
	taddcctv	%l5,	%l1,	%g7
	movrlez	%l2,	%i5,	%g6
loop_1561:
	andncc	%g2,	%g1,	%g5
	addcc	%i7,	0x1C61,	%o7
	set	0x20, %l5
	stwa	%i1,	[%l7 + %l5] 0x15
	mova	%icc,	%o1,	%g3
	stw	%i4,	[%l7 + 0x7C]
	lduh	[%l7 + 0x3E],	%o4
	movrne	%i3,	%i0,	%o0
	wr	%g0,	0x89,	%asi
	sta	%f14,	[%l7 + 0x60] %asi
	array16	%i6,	%o2,	%i2
	mulscc	%o6,	0x1E62,	%l6
	movcs	%xcc,	%l3,	%l0
	alignaddr	%o3,	%l4,	%o5
	andncc	%l5,	%g4,	%l1
	movl	%icc,	%g7,	%i5
	fmovdg	%xcc,	%f25,	%f7
	fmovscs	%xcc,	%f15,	%f28
	smulcc	%l2,	%g6,	%g2
	movre	%g1,	%g5,	%i7
	fnot1	%f8,	%f16
	andncc	%o7,	%o1,	%i1
	bl,a	%icc,	loop_1562
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g3,	%o4
	nop
	setx	loop_1563,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1562:
	ldstub	[%l7 + 0x5D],	%i3
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x68] %asi,	%i4
loop_1563:
	fnands	%f24,	%f22,	%f8
	sll	%i0,	%i6,	%o2
	fbg,a	%fcc0,	loop_1564
	std	%f16,	[%l7 + 0x78]
	faligndata	%f8,	%f16,	%f10
	std	%f20,	[%l7 + 0x78]
loop_1564:
	movleu	%icc,	%o0,	%o6
	udivx	%l6,	0x13F1,	%l3
	movg	%xcc,	%l0,	%o3
	edge32	%l4,	%o5,	%l5
	nop
	fitos	%f4,	%f20
	fstoi	%f20,	%f24
	fpsub32	%f6,	%f20,	%f24
	tgu	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x13] %asi,	%g4
	fmuld8ulx16	%f6,	%f25,	%f14
	fcmpgt16	%f10,	%f18,	%l1
	fbue,a	%fcc3,	loop_1565
	nop
	setx	loop_1566,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%g7,	%i2,	%i5
	srlx	%g6,	%g2,	%g1
loop_1565:
	lduw	[%l7 + 0x2C],	%l2
loop_1566:
	sdivx	%i7,	0x1BBE,	%o7
	andn	%g5,	0x06A6,	%i1
	bl,a	%icc,	loop_1567
	movrlz	%o1,	%g3,	%o4
	tleu	%icc,	0x7
	taddcc	%i4,	0x1153,	%i0
loop_1567:
	fpadd16	%f22,	%f30,	%f4
	xnorcc	%i6,	0x0FF8,	%i3
	orncc	%o0,	0x00D3,	%o6
	array16	%l6,	%l3,	%l0
	movg	%icc,	%o2,	%o3
	fpadd32	%f16,	%f16,	%f20
	array32	%o5,	%l4,	%g4
	movvs	%xcc,	%l5,	%g7
	membar	0x4C
	subc	%l1,	0x1E61,	%i5
	call	loop_1568
	tg	%icc,	0x1
	bleu,a,pt	%icc,	loop_1569
	fbul	%fcc1,	loop_1570
loop_1568:
	tneg	%xcc,	0x5
	tpos	%xcc,	0x2
loop_1569:
	tl	%icc,	0x5
loop_1570:
	fnand	%f12,	%f30,	%f0
	movle	%xcc,	%g6,	%g2
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x18,	 0x1
	fmovda	%xcc,	%f2,	%f17
	fmul8x16	%f28,	%f18,	%f30
	tvc	%xcc,	0x1
	sra	%i2,	%i7,	%l2
	or	%o7,	%g5,	%o1
	fbl,a	%fcc1,	loop_1571
	ld	[%l7 + 0x20],	%f10
	edge16ln	%i1,	%g3,	%o4
	udivcc	%i0,	0x0183,	%i4
loop_1571:
	nop
	fitod	%f6,	%f26
	wr	%g0,	0x19,	%asi
	stba	%i6,	[%l7 + 0x13] %asi
	sethi	0x0C94,	%o0
	taddcc	%i3,	0x010C,	%o6
	bneg,a	loop_1572
	fors	%f23,	%f24,	%f6
	fxnors	%f1,	%f9,	%f6
	fsrc2	%f12,	%f8
loop_1572:
	or	%l3,	%l6,	%l0
	edge8l	%o3,	%o5,	%o2
	fxors	%f20,	%f8,	%f19
	brlz	%g4,	loop_1573
	tvs	%icc,	0x1
	ldx	[%l7 + 0x68],	%l5
	nop
	setx	0xAD483ACA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x8262F926,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f27,	%f14
loop_1573:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f14,	[%l7 + 0x10] %asi
	xorcc	%g7,	%l1,	%l4
	fmovdvs	%icc,	%f31,	%f22
	swap	[%l7 + 0x54],	%g6
	sethi	0x0E85,	%i5
	orncc	%g1,	%g2,	%i7
	fble	%fcc2,	loop_1574
	fbul,a	%fcc1,	loop_1575
	ldsb	[%l7 + 0x0B],	%l2
	movvs	%xcc,	%o7,	%g5
loop_1574:
	array8	%o1,	%i2,	%g3
loop_1575:
	fabss	%f5,	%f15
	fmovdgu	%icc,	%f24,	%f20
	edge16l	%i1,	%o4,	%i4
	edge16	%i0,	%i6,	%o0
	fornot1s	%f7,	%f31,	%f25
	movrgz	%o6,	0x09F,	%l3
	fmovscs	%xcc,	%f2,	%f9
	udivcc	%i3,	0x1EF8,	%l6
	xnor	%l0,	%o3,	%o2
	umulcc	%g4,	0x08B6,	%l5
	bl,a	%xcc,	loop_1576
	fmovsleu	%icc,	%f1,	%f5
	prefetch	[%l7 + 0x24],	 0x3
	srax	%g7,	%o5,	%l1
loop_1576:
	subc	%g6,	0x193C,	%l4
	tle	%icc,	0x3
	fcmpeq32	%f10,	%f24,	%i5
	fcmpne16	%f6,	%f16,	%g2
	fmovsvc	%icc,	%f9,	%f7
	fandnot1	%f26,	%f28,	%f16
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f2
	and	%i7,	0x1933,	%l2
	st	%f29,	[%l7 + 0x4C]
	sdiv	%o7,	0x1946,	%g5
	bneg,a,pn	%xcc,	loop_1577
	or	%g1,	0x1047,	%o1
	alignaddr	%g3,	%i1,	%i2
	movn	%xcc,	%i4,	%i0
loop_1577:
	bne,a,pn	%icc,	loop_1578
	fba,a	%fcc2,	loop_1579
	edge16l	%i6,	%o4,	%o0
	fzero	%f28
loop_1578:
	tsubcctv	%o6,	0x05D1,	%l3
loop_1579:
	movge	%icc,	%l6,	%l0
	fbe,a	%fcc3,	loop_1580
	ba,a,pt	%xcc,	loop_1581
	fblg	%fcc3,	loop_1582
	for	%f8,	%f14,	%f4
loop_1580:
	orncc	%o3,	%i3,	%g4
loop_1581:
	brgz,a	%o2,	loop_1583
loop_1582:
	fmovsne	%xcc,	%f16,	%f19
	sdiv	%g7,	0x1AB7,	%l5
	fmovrdlz	%o5,	%f26,	%f10
loop_1583:
	fbn,a	%fcc2,	loop_1584
	addcc	%g6,	%l1,	%i5
	tleu	%xcc,	0x6
	fmovse	%xcc,	%f31,	%f19
loop_1584:
	xnorcc	%g2,	%i7,	%l2
	te	%xcc,	0x3
	sra	%l4,	%o7,	%g5
	array8	%g1,	%o1,	%g3
	movleu	%icc,	%i2,	%i4
	nop
	setx	0x2A76E911,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f6
	fmuld8sux16	%f15,	%f14,	%f22
	array32	%i1,	%i0,	%i6
	fbue,a	%fcc0,	loop_1585
	fmul8ulx16	%f8,	%f14,	%f4
	alignaddr	%o4,	%o0,	%o6
	movle	%xcc,	%l3,	%l0
loop_1585:
	movvc	%icc,	%o3,	%l6
	fmovsne	%icc,	%f12,	%f27
	andn	%i3,	%o2,	%g4
	edge32n	%g7,	%l5,	%g6
	fzeros	%f16
	move	%xcc,	%l1,	%i5
	srl	%g2,	%o5,	%i7
	bgu,a	%icc,	loop_1586
	edge32	%l4,	%o7,	%l2
	ldd	[%l7 + 0x18],	%f26
	tcs	%icc,	0x7
loop_1586:
	edge8l	%g1,	%o1,	%g3
	popc	0x05E4,	%i2
	addc	%i4,	%g5,	%i0
	movrne	%i6,	%i1,	%o0
	sllx	%o4,	%o6,	%l3
	brgz,a	%o3,	loop_1587
	tneg	%xcc,	0x1
	addcc	%l6,	0x0958,	%i3
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x16,	%f16
loop_1587:
	subccc	%l0,	%g4,	%g7
	ta	%xcc,	0x1
	umulcc	%l5,	0x191E,	%g6
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x15,	%f16
	udivx	%l1,	0x1D10,	%o2
	movgu	%icc,	%g2,	%i5
	nop
	setx	0x1C025F4A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xA7DF3F2F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f25,	%f1
	te	%icc,	0x2
	fornot1s	%f29,	%f27,	%f25
	ldsw	[%l7 + 0x6C],	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%o5,	%o7
	fmovda	%xcc,	%f31,	%f8
	taddcc	%l4,	%g1,	%l2
	fbl	%fcc2,	loop_1588
	movcs	%icc,	%g3,	%i2
	addcc	%i4,	0x1183,	%g5
	movgu	%xcc,	%o1,	%i0
loop_1588:
	sllx	%i6,	%i1,	%o4
	ta	%xcc,	0x4
	sethi	0x1153,	%o0
	movre	%o6,	0x1E2,	%l3
	edge32	%l6,	%i3,	%l0
	movvc	%icc,	%o3,	%g4
	sra	%l5,	0x09,	%g7
	xnorcc	%l1,	%o2,	%g2
	fmovscs	%icc,	%f10,	%f16
	udiv	%g6,	0x1824,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	%fcc2,	loop_1589
	array8	%o5,	%i5,	%l4
	tn	%icc,	0x5
	orcc	%g1,	%l2,	%g3
loop_1589:
	edge16n	%o7,	%i2,	%i4
	movvs	%xcc,	%g5,	%o1
	tne	%xcc,	0x2
	move	%xcc,	%i0,	%i6
	tn	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldsh	[%l7 + 0x7E],	%i1
	subc	%o4,	0x02A1,	%o0
	bshuffle	%f2,	%f22,	%f10
	sdivcc	%o6,	0x1421,	%l6
	edge8	%i3,	%l3,	%l0
	tsubcctv	%g4,	0x0FD7,	%l5
	brlez	%o3,	loop_1590
	fmovrsgez	%g7,	%f30,	%f14
	xnorcc	%l1,	0x16A1,	%g2
	fpackfix	%f24,	%f20
loop_1590:
	brlez	%g6,	loop_1591
	sub	%i7,	0x1808,	%o5
	fpsub32	%f6,	%f18,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1591:
	edge32l	%o2,	%i5,	%g1
	movne	%icc,	%l2,	%l4
	umul	%g3,	0x1D0D,	%i2
	movre	%i4,	%g5,	%o7
	tneg	%xcc,	0x6
	membar	0x47
	bne,pn	%icc,	loop_1592
	movrlez	%i0,	0x062,	%o1
	movl	%xcc,	%i1,	%i6
	nop
	setx	0x4E92717A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x3BBF0313,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f27,	%f11
loop_1592:
	fmovsvc	%xcc,	%f2,	%f14
	tleu	%icc,	0x5
	stb	%o4,	[%l7 + 0x68]
	fmovrsgez	%o6,	%f2,	%f13
	ldsh	[%l7 + 0x26],	%l6
	bcc	loop_1593
	stx	%i3,	[%l7 + 0x20]
	umulcc	%o0,	0x1986,	%l0
	mova	%icc,	%g4,	%l5
loop_1593:
	mulx	%l3,	0x04BE,	%o3
	sll	%g7,	%l1,	%g6
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8ln	%g2,	%i7,	%o2
	alignaddrl	%o5,	%g1,	%i5
	be,pn	%icc,	loop_1594
	tpos	%xcc,	0x6
	edge8n	%l2,	%g3,	%l4
	fnegd	%f26,	%f8
loop_1594:
	movrgz	%i2,	%g5,	%o7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x0c,	%i0,	%i4
	tneg	%icc,	0x4
	umul	%i1,	%o1,	%i6
	lduw	[%l7 + 0x58],	%o6
	edge8n	%o4,	%i3,	%o0
	movle	%icc,	%l0,	%l6
	set	0x4C, %l0
	stwa	%l5,	[%l7 + %l0] 0x10
	fandnot1s	%f10,	%f11,	%f30
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l3
	tleu	%xcc,	0x4
	movge	%icc,	%o3,	%g4
	tn	%icc,	0x7
	sub	%g7,	%l1,	%g6
	te	%icc,	0x5
	movge	%xcc,	%i7,	%o2
	fbn	%fcc1,	loop_1595
	tg	%xcc,	0x7
	xnor	%g2,	0x063E,	%g1
	tge	%xcc,	0x1
loop_1595:
	nop
	setx	loop_1596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x4
	fpadd32s	%f13,	%f21,	%f26
	movpos	%icc,	%i5,	%o5
loop_1596:
	fxor	%f24,	%f22,	%f16
	udivcc	%g3,	0x1E60,	%l4
	ldub	[%l7 + 0x7C],	%i2
	andcc	%l2,	%g5,	%i0
	fbl,a	%fcc2,	loop_1597
	edge16	%o7,	%i4,	%i1
	movg	%xcc,	%o1,	%o6
	bvc	%xcc,	loop_1598
loop_1597:
	nop
	setx	0xB0D3DACBA2068B5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x5C78FF66AFF1089E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f4,	%f0
	orn	%o4,	0x137B,	%i6
	movgu	%icc,	%i3,	%o0
loop_1598:
	fpsub32	%f16,	%f4,	%f16
	set	0x7F, %i3
	stba	%l0,	[%l7 + %i3] 0xe2
	membar	#Sync
	fpsub32s	%f5,	%f31,	%f26
	fbn	%fcc3,	loop_1599
	udivx	%l6,	0x1B70,	%l5
	addc	%o3,	%g4,	%g7
	fbug	%fcc3,	loop_1600
loop_1599:
	bvc,a,pt	%xcc,	loop_1601
	ldd	[%l7 + 0x38],	%l0
	sdivcc	%l3,	0x17FB,	%g6
loop_1600:
	andncc	%o2,	%g2,	%g1
loop_1601:
	orcc	%i7,	%i5,	%o5
	fmovrdne	%l4,	%f14,	%f24
	subc	%i2,	0x1E4C,	%g3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%l2,	%g5
	fmovrslz	%o7,	%f22,	%f3
	sethi	0x1E51,	%i0
	addccc	%i1,	%i4,	%o6
	bvs,a	loop_1602
	fmovs	%f30,	%f18
	swap	[%l7 + 0x08],	%o1
	sir	0x0A37
loop_1602:
	movre	%o4,	%i3,	%i6
	brlz	%l0,	loop_1603
	fble,a	%fcc0,	loop_1604
	movg	%icc,	%o0,	%l6
	bge,a	%icc,	loop_1605
loop_1603:
	smul	%l5,	0x049C,	%o3
loop_1604:
	nop
	setx	0xEF8CB2B43FA18137,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xADD7C91A96FBBE49,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f18,	%f20
	fble,a	%fcc0,	loop_1606
loop_1605:
	fandnot2	%f30,	%f30,	%f6
	sub	%g4,	0x0AEA,	%g7
	fba,a	%fcc3,	loop_1607
loop_1606:
	udivcc	%l3,	0x1757,	%g6
	srax	%l1,	0x18,	%o2
	ldx	[%l7 + 0x18],	%g2
loop_1607:
	tn	%icc,	0x7
	movrgz	%i7,	0x2E1,	%i5
	fmovrslez	%o5,	%f1,	%f31
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
	tcc	%icc,	0x3
	bleu,a,pt	%icc,	loop_1608
	nop
	setx	0x607D549C,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	movvc	%icc,	%g1,	%i2
	movg	%icc,	%l2,	%g3
loop_1608:
	brlz,a	%o7,	loop_1609
	andn	%g5,	%i1,	%i4
	fbg,a	%fcc2,	loop_1610
	fnegd	%f30,	%f22
loop_1609:
	xor	%i0,	%o1,	%o6
	edge16n	%i3,	%i6,	%o4
loop_1610:
	move	%xcc,	%o0,	%l0
	smulcc	%l5,	0x1E6E,	%l6
	tvc	%xcc,	0x5
	fbo,a	%fcc0,	loop_1611
	brgez	%o3,	loop_1612
	fmovd	%f4,	%f16
	movrne	%g7,	%g4,	%l3
loop_1611:
	bgu	%xcc,	loop_1613
loop_1612:
	brz,a	%l1,	loop_1614
	xnor	%g6,	%o2,	%g2
	movn	%icc,	%i7,	%o5
loop_1613:
	movneg	%icc,	%l4,	%g1
loop_1614:
	edge32n	%i5,	%i2,	%l2
	taddcc	%g3,	0x1817,	%o7
	subc	%g5,	0x1AF5,	%i4
	fnot2	%f18,	%f10
	fbn,a	%fcc2,	loop_1615
	te	%icc,	0x3
	subcc	%i0,	0x1DF9,	%o1
	bvc,pn	%icc,	loop_1616
loop_1615:
	stbar
	tl	%icc,	0x1
	te	%xcc,	0x3
loop_1616:
	sdivcc	%o6,	0x11F5,	%i1
	tvc	%icc,	0x4
	smul	%i3,	%o4,	%i6
	and	%l0,	0x087D,	%o0
	brlz,a	%l5,	loop_1617
	movne	%xcc,	%l6,	%g7
	fors	%f3,	%f26,	%f9
	fandnot2s	%f18,	%f30,	%f12
loop_1617:
	sir	0x0255
	fbn,a	%fcc3,	loop_1618
	fbue,a	%fcc2,	loop_1619
	nop
	setx	0xA31AF09B616C228C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x75B839EF28FAD9B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f26,	%f14
	movvc	%xcc,	%o3,	%g4
loop_1618:
	movle	%icc,	%l3,	%l1
loop_1619:
	bvs,a	loop_1620
	ldsw	[%l7 + 0x48],	%g6
	array16	%o2,	%g2,	%o5
	tgu	%xcc,	0x2
loop_1620:
	stb	%i7,	[%l7 + 0x2E]
	tl	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x42] %asi,	%g1
	fxnor	%f26,	%f12,	%f0
	movne	%icc,	%l4,	%i2
	movleu	%icc,	%i5,	%g3
	ldstub	[%l7 + 0x5C],	%l2
	tl	%icc,	0x1
	bvs,pn	%icc,	loop_1621
	orn	%g5,	%o7,	%i4
	xorcc	%i0,	0x1B85,	%o6
	popc	%o1,	%i1
loop_1621:
	movrlez	%i3,	%i6,	%l0
	call	loop_1622
	sth	%o4,	[%l7 + 0x34]
	fcmple32	%f24,	%f14,	%l5
	ldsh	[%l7 + 0x5E],	%o0
loop_1622:
	bgu,a,pt	%icc,	loop_1623
	edge32l	%l6,	%o3,	%g7
	srlx	%l3,	%l1,	%g6
	nop
	setx	0x9D8ADBE7F05B7515,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
loop_1623:
	subcc	%g4,	%o2,	%o5
	mova	%xcc,	%g2,	%i7
	fpsub32s	%f23,	%f7,	%f13
	xor	%g1,	%l4,	%i2
	edge32ln	%i5,	%l2,	%g3
	array8	%o7,	%i4,	%i0
	alignaddrl	%g5,	%o6,	%o1
	std	%f6,	[%l7 + 0x38]
	movrlez	%i1,	%i3,	%l0
	srl	%i6,	0x02,	%o4
	fnot1s	%f21,	%f29
	edge8	%l5,	%l6,	%o3
	or	%g7,	0x1790,	%o0
	bvc,a	loop_1624
	bgu,a	loop_1625
	xorcc	%l1,	%g6,	%l3
	ldsw	[%l7 + 0x10],	%g4
loop_1624:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x0A] %asi,	%o5
loop_1625:
	movl	%xcc,	%o2,	%g2
	umul	%i7,	%g1,	%l4
	movrne	%i5,	0x2F8,	%i2
	bvc,pt	%icc,	loop_1626
	std	%f20,	[%l7 + 0x60]
	movvc	%xcc,	%g3,	%o7
	ta	%icc,	0x7
loop_1626:
	fpsub32s	%f27,	%f1,	%f25
	edge32ln	%i4,	%i0,	%g5
	tl	%icc,	0x0
	sdiv	%o6,	0x18FA,	%l2
	sdiv	%i1,	0x11EE,	%i3
	movrne	%l0,	0x323,	%o1
	edge16ln	%o4,	%i6,	%l6
	xor	%o3,	%l5,	%g7
	sth	%l1,	[%l7 + 0x60]
	fxnors	%f22,	%f27,	%f10
	addcc	%g6,	0x05E1,	%o0
	fmovdn	%xcc,	%f27,	%f27
	andcc	%l3,	%o5,	%g4
	movl	%xcc,	%o2,	%i7
	movn	%xcc,	%g1,	%g2
	nop
	fitos	%f11,	%f3
	fstoi	%f3,	%f27
	be,a	%xcc,	loop_1627
	andn	%i5,	0x14F6,	%l4
	mova	%icc,	%i2,	%o7
	bpos,a,pn	%icc,	loop_1628
loop_1627:
	fbo,a	%fcc2,	loop_1629
	or	%i4,	%i0,	%g5
	movcc	%xcc,	%o6,	%l2
loop_1628:
	sir	0x1BFF
loop_1629:
	nop
	setx	loop_1630,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbe,a	%fcc1,	loop_1631
	ta	%icc,	0x4
	edge32ln	%g3,	%i1,	%l0
loop_1630:
	movn	%xcc,	%o1,	%i3
loop_1631:
	fands	%f30,	%f24,	%f10
	fpackfix	%f20,	%f10
	bn,pt	%xcc,	loop_1632
	edge8l	%i6,	%l6,	%o3
	tle	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1632:
	bg,a,pt	%icc,	loop_1633
	movvs	%xcc,	%l5,	%g7
	movneg	%icc,	%o4,	%g6
	sethi	0x135F,	%o0
loop_1633:
	tcs	%xcc,	0x0
	movcs	%icc,	%l1,	%o5
	tne	%xcc,	0x0
	fmovdcs	%icc,	%f1,	%f20
	st	%f0,	[%l7 + 0x14]
	tge	%icc,	0x1
	and	%l3,	0x1717,	%g4
	tg	%xcc,	0x5
	fmovd	%f12,	%f22
	pdist	%f16,	%f2,	%f18
	stw	%i7,	[%l7 + 0x64]
	movleu	%icc,	%g1,	%o2
	membar	0x22
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x1e
	membar	#Sync
	bleu,a,pt	%icc,	loop_1634
	movrgez	%i5,	%l4,	%i2
	xor	%o7,	%i4,	%g2
	edge32l	%i0,	%g5,	%o6
loop_1634:
	movcc	%xcc,	%g3,	%l2
	movre	%i1,	%o1,	%i3
	fble	%fcc1,	loop_1635
	fcmpeq16	%f6,	%f24,	%l0
	edge32ln	%l6,	%i6,	%o3
	fnand	%f0,	%f18,	%f12
loop_1635:
	movrlez	%g7,	%l5,	%g6
	tvs	%xcc,	0x3
	sll	%o0,	%l1,	%o5
	subc	%o4,	0x1EFF,	%l3
	andncc	%g4,	%g1,	%i7
	movpos	%icc,	%i5,	%o2
	wr	%g0,	0x5f,	%asi
	stxa	%l4,	[%g0 + 0x0] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc2,	loop_1636
	movle	%icc,	%o7,	%i2
	fbne	%fcc2,	loop_1637
	tleu	%xcc,	0x5
loop_1636:
	movne	%xcc,	%g2,	%i4
	fbu,a	%fcc3,	loop_1638
loop_1637:
	tpos	%xcc,	0x7
	set	0x50, %l1
	prefetcha	[%l7 + %l1] 0x10,	 0x2
loop_1638:
	brgez	%g5,	loop_1639
	edge32l	%g3,	%l2,	%i1
	udiv	%o1,	0x11BF,	%o6
	sdivx	%i3,	0x1C25,	%l0
loop_1639:
	and	%l6,	0x1E85,	%o3
	edge16	%g7,	%l5,	%g6
	nop
	setx	0x34A64AB1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xED62FC69,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f20,	%f11
	tpos	%icc,	0x3
	taddcctv	%i6,	%o0,	%l1
	sra	%o5,	0x06,	%o4
	tg	%xcc,	0x2
	tcs	%xcc,	0x3
	brlez	%g4,	loop_1640
	edge16	%l3,	%g1,	%i7
	lduh	[%l7 + 0x70],	%o2
	fand	%f2,	%f12,	%f4
loop_1640:
	movg	%xcc,	%i5,	%l4
	edge8ln	%o7,	%g2,	%i4
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x44] %asi,	%f12
	tl	%xcc,	0x4
	for	%f8,	%f8,	%f4
	tg	%icc,	0x2
	fmovrde	%i0,	%f14,	%f26
	mulx	%g5,	%i2,	%l2
	fpadd16s	%f15,	%f31,	%f27
	addccc	%i1,	%g3,	%o6
	fmovsg	%icc,	%f12,	%f4
	smul	%i3,	%l0,	%o1
	tge	%icc,	0x5
	membar	0x63
	add	%o3,	0x18B1,	%g7
	fmovrdlez	%l6,	%f26,	%f10
	andn	%g6,	%l5,	%o0
	fornot1s	%f28,	%f1,	%f24
	fbge,a	%fcc1,	loop_1641
	andn	%i6,	0x0668,	%l1
	movg	%icc,	%o5,	%g4
	fnors	%f22,	%f2,	%f9
loop_1641:
	movne	%xcc,	%l3,	%g1
	movre	%o4,	%i7,	%i5
	nop
	setx	0x77D0A526,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x556F95EF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f22,	%f20
	umulcc	%l4,	%o2,	%g2
	tsubcc	%i4,	%o7,	%g5
	add	%i2,	%l2,	%i1
	movre	%i0,	%g3,	%i3
	set	0x40, %o0
	ldswa	[%l7 + %o0] 0x89,	%l0
	fmovsle	%xcc,	%f20,	%f20
	nop
	setx	0x59CF66779041D3A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fbu	%fcc2,	loop_1642
	alignaddrl	%o1,	%o6,	%g7
	movneg	%xcc,	%l6,	%o3
	tcc	%xcc,	0x2
loop_1642:
	fpadd32s	%f10,	%f18,	%f8
	te	%xcc,	0x6
	tcs	%icc,	0x0
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f0
	ldx	[%l7 + 0x10],	%g6
	tgu	%icc,	0x1
	ba	loop_1643
	alignaddrl	%o0,	%l5,	%i6
	set	0x0C, %i0
	swapa	[%l7 + %i0] 0x11,	%o5
loop_1643:
	fmovsleu	%xcc,	%f8,	%f9
	movneg	%xcc,	%g4,	%l3
	ba	loop_1644
	fbg,a	%fcc3,	loop_1645
	fmul8sux16	%f2,	%f16,	%f16
	fmul8x16al	%f2,	%f0,	%f10
loop_1644:
	nop
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1645:
	srl	%l1,	0x0C,	%g1
	bvc,a,pn	%xcc,	loop_1646
	taddcc	%i7,	0x1EE9,	%i5
	bcc	%xcc,	loop_1647
	ba,a	%icc,	loop_1648
loop_1646:
	fmovsa	%xcc,	%f18,	%f4
	movvs	%xcc,	%l4,	%o4
loop_1647:
	fones	%f13
loop_1648:
	tsubcc	%o2,	0x0F61,	%i4
	bl,pn	%icc,	loop_1649
	edge16ln	%g2,	%o7,	%i2
	array8	%l2,	%i1,	%i0
	tneg	%icc,	0x1
loop_1649:
	movn	%xcc,	%g3,	%i3
	fbn	%fcc1,	loop_1650
	movgu	%icc,	%l0,	%g5
	edge32l	%o6,	%g7,	%l6
	movrlz	%o3,	%g6,	%o0
loop_1650:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x28] %asi,	%o1
	nop
	setx	0x338F1599,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x881C3F81,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f3,	%f11
	taddcc	%l5,	0x11B3,	%i6
	bvc	loop_1651
	ldd	[%l7 + 0x60],	%g4
	srl	%l3,	0x02,	%l1
	ta	%xcc,	0x7
loop_1651:
	taddcc	%o5,	0x04E8,	%g1
	wr	%g0,	0x10,	%asi
	sta	%f23,	[%l7 + 0x78] %asi
	movleu	%xcc,	%i7,	%i5
	mulscc	%o4,	0x00E7,	%o2
	fmovrsgz	%i4,	%f0,	%f22
	nop
	fitos	%f14,	%f19
	fstoi	%f19,	%f10
	sdivcc	%l4,	0x0048,	%g2
	tvs	%xcc,	0x2
	ldx	[%l7 + 0x40],	%i2
	nop
	setx	loop_1652,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%xcc,	0x3
	bl,a	%icc,	loop_1653
	sth	%o7,	[%l7 + 0x22]
loop_1652:
	popc	0x1168,	%l2
	set	0x33, %g7
	stba	%i1,	[%l7 + %g7] 0x27
	membar	#Sync
loop_1653:
	sdivcc	%i0,	0x1A75,	%g3
	fnor	%f12,	%f24,	%f20
	ldd	[%l7 + 0x60],	%l0
	fsrc1s	%f20,	%f12
	mulx	%i3,	0x025D,	%g5
	fmovspos	%icc,	%f15,	%f5
	nop
	set	0x0F, %i2
	ldstub	[%l7 + %i2],	%g7
	bn,pt	%xcc,	loop_1654
	ldub	[%l7 + 0x62],	%l6
	tvc	%xcc,	0x4
	nop
	setx	loop_1655,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1654:
	movg	%icc,	%o6,	%g6
	srl	%o0,	%o1,	%l5
	fors	%f5,	%f3,	%f11
loop_1655:
	edge8ln	%o3,	%g4,	%i6
	sll	%l3,	0x08,	%l1
	fmovsn	%xcc,	%f9,	%f8
	udivcc	%g1,	0x0286,	%o5
	mulx	%i7,	0x171F,	%o4
	lduh	[%l7 + 0x52],	%i5
	fnor	%f2,	%f10,	%f24
	fba,a	%fcc0,	loop_1656
	fxors	%f16,	%f10,	%f6
	tcs	%xcc,	0x6
	fnot1	%f12,	%f20
loop_1656:
	tg	%xcc,	0x6
	tsubcc	%o2,	%l4,	%i4
	tsubcctv	%i2,	0x10F8,	%g2
	membar	0x56
	fbe,a	%fcc3,	loop_1657
	fnegd	%f14,	%f14
	fcmple32	%f20,	%f22,	%l2
	andcc	%o7,	0x16B8,	%i0
loop_1657:
	array32	%i1,	%l0,	%i3
	movg	%xcc,	%g5,	%g7
	addc	%l6,	0x090D,	%o6
	bneg,a,pn	%xcc,	loop_1658
	fbg,a	%fcc2,	loop_1659
	edge8l	%g6,	%g3,	%o0
	fbne	%fcc3,	loop_1660
loop_1658:
	edge32	%l5,	%o3,	%o1
loop_1659:
	and	%g4,	0x05FA,	%l3
	movle	%icc,	%i6,	%g1
loop_1660:
	fbule,a	%fcc0,	loop_1661
	fba	%fcc0,	loop_1662
	be	loop_1663
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1661:
	fmovsl	%xcc,	%f26,	%f4
loop_1662:
	te	%xcc,	0x4
loop_1663:
	nop
	set	0x48, %g4
	prefetcha	[%l7 + %g4] 0x14,	 0x3
	fnegs	%f12,	%f15
	tg	%icc,	0x7
	taddcctv	%i7,	0x0A59,	%o4
	umul	%l1,	%i5,	%o2
	tvs	%xcc,	0x5
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x36] %asi,	%i4
	tsubcc	%i2,	%g2,	%l4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o7,	%i0
	movg	%icc,	%l2,	%l0
	fornot1	%f14,	%f6,	%f30
	sdivx	%i1,	0x0A05,	%g5
	subccc	%g7,	%l6,	%i3
	st	%f26,	[%l7 + 0x40]
	nop
	setx loop_1664, %l0, %l1
	jmpl %l1, %g6
	movpos	%icc,	%g3,	%o0
	xnor	%o6,	%o3,	%l5
	tne	%icc,	0x2
loop_1664:
	fcmple16	%f0,	%f10,	%o1
	tneg	%icc,	0x5
	edge8ln	%g4,	%l3,	%i6
	tcs	%icc,	0x6
	movne	%xcc,	%g1,	%o5
	set	0x58, %g3
	sta	%f5,	[%l7 + %g3] 0x0c
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	setx	0x5CA95AD55063ED96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fmovs	%f3,	%f4
	andncc	%i7,	%o4,	%i5
	stw	%l1,	[%l7 + 0x64]
	udiv	%o2,	0x1C23,	%i4
	taddcc	%i2,	0x1A3B,	%l4
	st	%f19,	[%l7 + 0x7C]
	tge	%icc,	0x0
	movrlz	%g2,	%i0,	%l2
	smul	%l0,	%o7,	%i1
	fbug	%fcc0,	loop_1665
	tgu	%icc,	0x7
	orn	%g7,	0x139E,	%g5
	edge8ln	%l6,	%i3,	%g3
loop_1665:
	subcc	%g6,	%o0,	%o3
	andn	%l5,	0x1046,	%o1
	faligndata	%f2,	%f28,	%f8
	sir	0x0493
	nop
	setx	0x8B45F779,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x9D93CB4A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f19,	%f0
	sethi	0x0563,	%o6
	movcc	%xcc,	%g4,	%l3
	orn	%g1,	%o5,	%i6
	sdivcc	%i7,	0x04D6,	%o4
	movrlz	%i5,	0x23B,	%l1
	fmovrdne	%o2,	%f0,	%f28
	te	%xcc,	0x5
	fbl,a	%fcc2,	loop_1666
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f28
	xnor	%i4,	0x173B,	%i2
	nop
	setx	0x499BE2CF0C3AC073,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x66DF22E50B9D4709,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f12,	%f22
loop_1666:
	orncc	%l4,	0x0C85,	%i0
	te	%xcc,	0x6
	pdist	%f22,	%f4,	%f2
	taddcc	%l2,	0x1FBD,	%g2
	fnot2	%f22,	%f22
	fble	%fcc3,	loop_1667
	smul	%o7,	%i1,	%l0
	bvc,a	loop_1668
	movvs	%xcc,	%g5,	%g7
loop_1667:
	udivx	%l6,	0x1A2F,	%i3
	tvs	%icc,	0x7
loop_1668:
	nop
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x0C] %asi,	%g6
	movcc	%xcc,	%g3,	%o3
	taddcctv	%l5,	%o0,	%o6
	mulscc	%g4,	0x1E96,	%o1
	te	%xcc,	0x3
	tsubcctv	%g1,	0x1598,	%o5
	bneg	%icc,	loop_1669
	bg,a	loop_1670
	andcc	%i6,	0x0D4C,	%i7
	fpadd16s	%f30,	%f0,	%f9
loop_1669:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x18] %asi,	%f14
loop_1670:
	nop
	set	0x5E, %i7
	lduha	[%l7 + %i7] 0x04,	%o4
	faligndata	%f26,	%f24,	%f6
	nop
	setx	0xE0769862,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	tsubcctv	%i5,	%l3,	%l1
	bgu,a	%xcc,	loop_1671
	bge,pn	%xcc,	loop_1672
	andncc	%i4,	%i2,	%l4
	udiv	%i0,	0x0790,	%l2
loop_1671:
	addc	%g2,	0x1048,	%o7
loop_1672:
	movleu	%xcc,	%o2,	%i1
	popc	%g5,	%g7
	movrgez	%l6,	0x23C,	%l0
	subc	%g6,	0x19DB,	%g3
	movl	%icc,	%i3,	%o3
	fcmpne16	%f22,	%f10,	%l5
	stx	%o0,	[%l7 + 0x20]
	sethi	0x0B00,	%o6
	fmovs	%f2,	%f16
	sra	%o1,	%g1,	%o5
	fbn	%fcc2,	loop_1673
	fbu	%fcc0,	loop_1674
	fmovrdlz	%i6,	%f2,	%f28
	bshuffle	%f4,	%f28,	%f8
loop_1673:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%i7
loop_1674:
	movg	%xcc,	%i5,	%l3
	bne,pt	%icc,	loop_1675
	brnz,a	%o4,	loop_1676
	srl	%l1,	%i2,	%i4
	fbule	%fcc1,	loop_1677
loop_1675:
	tpos	%icc,	0x2
loop_1676:
	movvc	%icc,	%i0,	%l4
	ld	[%l7 + 0x14],	%f25
loop_1677:
	be,a,pn	%xcc,	loop_1678
	udivcc	%l2,	0x00AA,	%g2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
loop_1678:
	sra	%i1,	%g5,	%g7
	orncc	%o2,	%l0,	%g6
	sir	0x1CE9
	movcc	%xcc,	%g3,	%i3
	and	%l6,	%l5,	%o3
	sethi	0x0189,	%o6
	array16	%o0,	%g1,	%o1
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f24
	fnands	%f8,	%f18,	%f17
	fnot2s	%f16,	%f7
	fcmpgt16	%f24,	%f10,	%o5
	fba,a	%fcc0,	loop_1679
	ld	[%l7 + 0x40],	%f3
	movre	%g4,	%i6,	%i7
	edge16n	%i5,	%o4,	%l3
loop_1679:
	tcc	%xcc,	0x1
	fzero	%f14
	tge	%icc,	0x3
	andncc	%i2,	%l1,	%i4
	fbul,a	%fcc3,	loop_1680
	udivx	%i0,	0x084D,	%l4
	stbar
	sll	%g2,	0x02,	%l2
loop_1680:
	edge32	%o7,	%g5,	%g7
	edge32	%o2,	%l0,	%i1
	sub	%g3,	%g6,	%l6
	alignaddr	%l5,	%i3,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o0,	0x11A6,	%g1
	popc	0x047E,	%o3
	smul	%o1,	%o5,	%i6
	umulcc	%g4,	0x04BB,	%i7
	tcs	%xcc,	0x6
	nop
	fitos	%f7,	%f6
	fstox	%f6,	%f20
	bg,a,pt	%xcc,	loop_1681
	brlz	%o4,	loop_1682
	movg	%xcc,	%l3,	%i5
	fmovsg	%xcc,	%f14,	%f25
loop_1681:
	movcs	%xcc,	%i2,	%l1
loop_1682:
	fbne,a	%fcc1,	loop_1683
	fmovda	%icc,	%f20,	%f31
	movne	%xcc,	%i0,	%l4
	bgu	%xcc,	loop_1684
loop_1683:
	lduh	[%l7 + 0x1C],	%g2
	movl	%xcc,	%l2,	%i4
	popc	0x0424,	%g5
loop_1684:
	mova	%xcc,	%g7,	%o7
	andncc	%o2,	%l0,	%g3
	taddcc	%i1,	0x13E1,	%g6
	alignaddrl	%l6,	%l5,	%i3
	subc	%o0,	0x1730,	%g1
	sdivcc	%o6,	0x0675,	%o3
	ba,a	%xcc,	loop_1685
	tg	%icc,	0x1
	taddcc	%o1,	%i6,	%o5
	srl	%i7,	0x00,	%g4
loop_1685:
	addc	%o4,	%l3,	%i2
	fornot2	%f12,	%f12,	%f20
	fornot2s	%f14,	%f16,	%f16
	movrlez	%i5,	%i0,	%l1
	nop
	setx	0xF95B9D63,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xFA0003C7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f11,	%f31
	fmul8sux16	%f20,	%f4,	%f14
	srlx	%g2,	%l2,	%i4
	smul	%g5,	0x0881,	%g7
	fblg,a	%fcc0,	loop_1686
	orncc	%l4,	%o7,	%l0
	sdivx	%g3,	0x15F7,	%i1
	umul	%o2,	%g6,	%l5
loop_1686:
	movrgez	%l6,	%o0,	%i3
	movgu	%icc,	%g1,	%o3
	array32	%o6,	%o1,	%o5
	srax	%i7,	%g4,	%o4
	taddcctv	%i6,	0x0AB1,	%i2
	be,a,pt	%icc,	loop_1687
	array8	%l3,	%i5,	%l1
	edge32l	%i0,	%l2,	%i4
	movrgz	%g2,	%g7,	%g5
loop_1687:
	and	%l4,	%l0,	%g3
	nop
	setx	loop_1688,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcs	%xcc,	%o7,	%i1
	sethi	0x1971,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1688:
	orncc	%l5,	0x08CF,	%l6
	movrne	%o2,	%o0,	%g1
	fabsd	%f6,	%f4
	bvs,pt	%xcc,	loop_1689
	fbule	%fcc0,	loop_1690
	nop
	fitod	%f10,	%f4
	fdtoi	%f4,	%f24
	xnor	%o3,	%o6,	%i3
loop_1689:
	nop
	setx	loop_1691,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1690:
	flush	%l7 + 0x48
	tneg	%icc,	0x1
	movle	%xcc,	%o1,	%o5
loop_1691:
	tleu	%icc,	0x7
	tgu	%xcc,	0x2
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f26
	fxtod	%f26,	%f12
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x75] %asi,	%i7
	set	0x54, %g1
	lduba	[%l7 + %g1] 0x04,	%g4
	membar	0x40
	edge16ln	%o4,	%i2,	%i6
	fpmerge	%f23,	%f12,	%f2
	array32	%i5,	%l3,	%i0
	movleu	%icc,	%l2,	%i4
	fnot1s	%f24,	%f10
	fcmple32	%f26,	%f26,	%g2
	brgez	%l1,	loop_1692
	edge16ln	%g7,	%g5,	%l0
	sir	0x13C0
	umulcc	%l4,	0x1BDF,	%o7
loop_1692:
	addcc	%i1,	0x0CAB,	%g6
	tle	%xcc,	0x2
	fzeros	%f11
	mova	%xcc,	%g3,	%l6
	edge16ln	%l5,	%o2,	%o0
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g1
	subcc	%o6,	0x07A8,	%o3
	srax	%o1,	%i3,	%i7
	nop
	fitos	%f7,	%f24
	fstod	%f24,	%f26
	tl	%icc,	0x6
	flush	%l7 + 0x54
	nop
	fitod	%f4,	%f28
	fdtox	%f28,	%f18
	mova	%xcc,	%o5,	%g4
	sth	%i2,	[%l7 + 0x0C]
	andncc	%o4,	%i6,	%l3
	edge32n	%i0,	%i5,	%l2
	sllx	%i4,	0x19,	%g2
	bpos,pt	%xcc,	loop_1693
	sir	0x15BE
	fmovse	%xcc,	%f10,	%f13
	add	%l1,	%g7,	%l0
loop_1693:
	ld	[%l7 + 0x20],	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l4,	%g5,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%i1,	loop_1694
	fcmple32	%f10,	%f6,	%g6
	brgz	%l6,	loop_1695
	subccc	%l5,	0x17CD,	%g3
loop_1694:
	fors	%f9,	%f4,	%f9
	movrgz	%o2,	0x1AB,	%g1
loop_1695:
	stw	%o6,	[%l7 + 0x6C]
	orncc	%o3,	0x1723,	%o1
	xnor	%o0,	0x04A7,	%i3
	tcs	%icc,	0x1
	ldd	[%l7 + 0x08],	%i6
	nop
	setx loop_1696, %l0, %l1
	jmpl %l1, %g4
	sllx	%o5,	%i2,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i6,	0x19B6,	%l3
loop_1696:
	smulcc	%i5,	%l2,	%i0
	fcmple16	%f4,	%f30,	%g2
	movvc	%xcc,	%i4,	%l1
	movneg	%xcc,	%l0,	%l4
	fcmple32	%f26,	%f26,	%g7
	xnor	%g5,	%i1,	%o7
	srlx	%l6,	%g6,	%g3
	ldx	[%l7 + 0x18],	%l5
	lduw	[%l7 + 0x6C],	%o2
	set	0x70, %l3
	prefetcha	[%l7 + %l3] 0x15,	 0x0
	fpsub16s	%f18,	%f6,	%f16
	tsubcctv	%o3,	0x0949,	%o1
	tcc	%icc,	0x3
	faligndata	%f10,	%f14,	%f8
	fmul8x16au	%f20,	%f19,	%f8
	movrgz	%o6,	%o0,	%i3
	fornot1	%f14,	%f20,	%f22
	fmovdneg	%xcc,	%f19,	%f15
	mova	%xcc,	%g4,	%o5
	ldstub	[%l7 + 0x3D],	%i2
	fmovrdlz	%i7,	%f20,	%f6
	set	0x18, %g5
	lda	[%l7 + %g5] 0x15,	%f15
	movrgz	%i6,	0x08D,	%o4
	movgu	%xcc,	%l3,	%i5
	bl,pn	%xcc,	loop_1697
	addcc	%l2,	%i0,	%i4
	nop
	fitos	%f3,	%f5
	fstox	%f5,	%f28
	set	0x68, %o5
	ldsha	[%l7 + %o5] 0x04,	%g2
loop_1697:
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
	addcc	%l0,	%l1,	%l4
	movvc	%xcc,	%g7,	%i1
	movleu	%xcc,	%g5,	%l6
loop_1698:
	bneg,pn	%icc,	loop_1699
	udiv	%g6,	0x1968,	%g3
	subc	%o7,	%l5,	%o2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g1
loop_1699:
	fexpand	%f26,	%f2
	edge16ln	%o3,	%o6,	%o0
	srl	%i3,	0x18,	%o1
	orncc	%o5,	%i2,	%i7
	tgu	%xcc,	0x7
	and	%i6,	0x1692,	%g4
	fexpand	%f27,	%f20
	fxors	%f25,	%f7,	%f26
	edge16l	%l3,	%o4,	%i5
	set	0x3E, %o3
	lduba	[%l7 + %o3] 0x88,	%i0
	bvc	%xcc,	loop_1700
	nop
	set	0x37, %l4
	ldub	[%l7 + %l4],	%i4
	xor	%g2,	%l0,	%l1
	bvs,a	%xcc,	loop_1701
loop_1700:
	fmovsvc	%icc,	%f8,	%f13
	tcc	%icc,	0x1
	xorcc	%l4,	0x16D5,	%g7
loop_1701:
	fmovsl	%xcc,	%f0,	%f22
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sethi	0x144E,	%l2
	tne	%icc,	0x2
	stbar
	tvc	%xcc,	0x3
	andncc	%g5,	%i1,	%g6
	fmovsa	%xcc,	%f29,	%f14
	mova	%icc,	%l6,	%g3
	xnorcc	%o7,	%l5,	%g1
	fbu,a	%fcc2,	loop_1702
	movrlz	%o3,	%o2,	%o0
	fbl	%fcc1,	loop_1703
	fbl,a	%fcc3,	loop_1704
loop_1702:
	sdivcc	%o6,	0x040F,	%o1
	fpack32	%f4,	%f6,	%f16
loop_1703:
	brz,a	%o5,	loop_1705
loop_1704:
	fmovdge	%xcc,	%f21,	%f19
	sdiv	%i3,	0x1960,	%i2
	bpos,a	%xcc,	loop_1706
loop_1705:
	tge	%icc,	0x6
	xnorcc	%i6,	%i7,	%l3
	movne	%xcc,	%g4,	%i5
loop_1706:
	movge	%xcc,	%i0,	%o4
	fmovrdlz	%i4,	%f26,	%f28
	tvc	%xcc,	0x6
	movleu	%xcc,	%l0,	%g2
	bpos	loop_1707
	sra	%l1,	%g7,	%l2
	fbg	%fcc3,	loop_1708
	movgu	%xcc,	%g5,	%i1
loop_1707:
	fbo	%fcc3,	loop_1709
	udivcc	%g6,	0x1E01,	%l6
loop_1708:
	fnot2s	%f4,	%f26
	srlx	%l4,	%g3,	%o7
loop_1709:
	nop
	set	0x4B, %o1
	ldstuba	[%l7 + %o1] 0x89,	%g1
	sllx	%o3,	0x13,	%l5
	edge8ln	%o2,	%o6,	%o1
	call	loop_1710
	bgu,pt	%xcc,	loop_1711
	subcc	%o5,	%i3,	%i2
	udivx	%i6,	0x0BCD,	%o0
loop_1710:
	stx	%i7,	[%l7 + 0x20]
loop_1711:
	edge8	%l3,	%g4,	%i0
	subc	%i5,	%i4,	%l0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o4,	%l1
	nop
	fitos	%f13,	%f9
	movleu	%icc,	%g7,	%l2
	movpos	%xcc,	%g5,	%i1
	xnorcc	%g2,	0x159E,	%l6
	nop
	setx	0xF6E869E95043BDEC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	set	0x54, %l6
	stwa	%g6,	[%l7 + %l6] 0x22
	membar	#Sync
	tneg	%xcc,	0x0
	movrgz	%l4,	0x0BD,	%o7
	call	loop_1712
	sllx	%g1,	0x0B,	%g3
	edge8ln	%o3,	%l5,	%o2
	edge8n	%o1,	%o6,	%o5
loop_1712:
	ld	[%l7 + 0x40],	%f1
	nop
	setx	0x4397EA13F2CB6CF8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x11A199FFD89115A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f4,	%f0
	addcc	%i3,	0x0C2C,	%i2
	nop
	fitod	%f12,	%f20
	fdtos	%f20,	%f23
	xorcc	%i6,	0x0545,	%i7
	edge32	%o0,	%l3,	%i0
	sllx	%g4,	0x00,	%i4
	fbuge	%fcc1,	loop_1713
	udivcc	%i5,	0x1B5D,	%o4
	fpsub32s	%f21,	%f7,	%f21
	movrgz	%l0,	%g7,	%l1
loop_1713:
	movle	%icc,	%g5,	%l2
	fmovsge	%icc,	%f8,	%f1
	fmovda	%icc,	%f30,	%f12
	fmul8x16al	%f9,	%f16,	%f10
	movle	%xcc,	%g2,	%i1
	edge32l	%l6,	%l4,	%g6
	movgu	%xcc,	%g1,	%o7
	sethi	0x0064,	%o3
	sub	%g3,	0x0CE3,	%o2
	sethi	0x11EB,	%l5
	ldx	[%l7 + 0x30],	%o6
	fmovdn	%icc,	%f1,	%f13
	te	%xcc,	0x1
	fmovdg	%icc,	%f5,	%f16
	movvc	%xcc,	%o5,	%i3
	fbn	%fcc1,	loop_1714
	array16	%i2,	%i6,	%i7
	tgu	%icc,	0x6
	bneg	loop_1715
loop_1714:
	subcc	%o1,	%l3,	%o0
	tgu	%icc,	0x1
	edge8	%i0,	%i4,	%g4
loop_1715:
	movle	%xcc,	%o4,	%l0
	fmovrdgez	%i5,	%f18,	%f26
	stx	%g7,	[%l7 + 0x60]
	fbuge	%fcc0,	loop_1716
	array16	%l1,	%g5,	%l2
	andn	%g2,	%l6,	%l4
	fmovdge	%xcc,	%f1,	%f7
loop_1716:
	movvs	%icc,	%g6,	%g1
	sth	%o7,	[%l7 + 0x5E]
	call	loop_1717
	fnot2	%f28,	%f20
	bcs,pn	%xcc,	loop_1718
	tvs	%xcc,	0x0
loop_1717:
	tsubcctv	%i1,	0x1D22,	%g3
	sub	%o2,	%l5,	%o6
loop_1718:
	edge32ln	%o5,	%i3,	%o3
	fbn,a	%fcc3,	loop_1719
	membar	0x1E
	tn	%xcc,	0x2
	fmovsn	%icc,	%f7,	%f27
loop_1719:
	movl	%xcc,	%i2,	%i6
	orcc	%o1,	0x01DF,	%l3
	fsrc2	%f18,	%f14
	nop
	setx	0x04D91163505C4669,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	tg	%icc,	0x0
	edge8n	%i7,	%i0,	%o0
	mulscc	%g4,	0x0385,	%o4
	fsrc1	%f20,	%f6
	smulcc	%l0,	0x024B,	%i5
	fmovdge	%icc,	%f26,	%f4
	bvs,pn	%xcc,	loop_1720
	umul	%i4,	%l1,	%g5
	array32	%g7,	%l2,	%g2
	edge32ln	%l4,	%g6,	%l6
loop_1720:
	stx	%o7,	[%l7 + 0x30]
	set	0x50, %i1
	swapa	[%l7 + %i1] 0x11,	%g1
	movre	%i1,	%g3,	%o2
	edge16	%o6,	%l5,	%i3
	and	%o3,	%o5,	%i6
	fmuld8ulx16	%f16,	%f20,	%f20
	and	%o1,	%i2,	%i7
	nop
	fitod	%f7,	%f22
	taddcc	%i0,	%o0,	%l3
	andn	%g4,	%o4,	%l0
	taddcc	%i5,	0x03A0,	%l1
	sra	%g5,	0x03,	%i4
	fmovdl	%icc,	%f25,	%f15
	ldub	[%l7 + 0x79],	%g7
	edge16n	%g2,	%l4,	%l2
	movrlez	%l6,	%o7,	%g6
	sdivcc	%g1,	0x1C8A,	%g3
	swap	[%l7 + 0x3C],	%i1
	bne,a	%icc,	loop_1721
	tpos	%xcc,	0x0
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x15,	%f16
loop_1721:
	subc	%o6,	0x1973,	%o2
	xor	%i3,	0x0F3E,	%l5
	bne,pn	%xcc,	loop_1722
	movle	%icc,	%o3,	%o5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x19,	%i6,	%o1
loop_1722:
	movcc	%xcc,	%i2,	%i0
	fzero	%f30
	umulcc	%i7,	%l3,	%o0
	edge32l	%g4,	%o4,	%i5
	taddcc	%l1,	%l0,	%i4
	fmovsvs	%icc,	%f8,	%f10
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x80,	%g5,	%g2
	wr	%g0,	0x80,	%asi
	stwa	%g7,	[%l7 + 0x0C] %asi
	bvs,a	loop_1723
	tsubcc	%l2,	0x02C4,	%l4
	add	%o7,	0x19FA,	%g6
	fsrc2s	%f23,	%f12
loop_1723:
	fcmpne16	%f4,	%f18,	%l6
	edge32ln	%g3,	%g1,	%o6
	mulx	%o2,	%i1,	%i3
	edge32n	%o3,	%l5,	%i6
	udivx	%o5,	0x15C7,	%o1
	ldsw	[%l7 + 0x24],	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge	loop_1724
	and	%i2,	0x1F16,	%l3
	fornot1s	%f26,	%f16,	%f14
	fpsub32	%f10,	%f2,	%f8
loop_1724:
	sdiv	%i7,	0x0B7A,	%o0
	set	0x30, %o2
	ldda	[%l7 + %o2] 0x22,	%o4
	faligndata	%f0,	%f22,	%f28
	nop
	setx	0xA54206E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x74DAD993,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f12,	%f27
	fmovdpos	%icc,	%f14,	%f27
	fornot1	%f12,	%f24,	%f20
	array32	%i5,	%l1,	%g4
	fxnors	%f24,	%f4,	%f22
	orncc	%i4,	0x1177,	%g5
	edge16n	%l0,	%g2,	%g7
	movcs	%icc,	%l4,	%l2
	bcc,a	loop_1725
	tle	%xcc,	0x6
	move	%icc,	%o7,	%g6
	sllx	%g3,	0x03,	%l6
loop_1725:
	edge16	%o6,	%o2,	%g1
	edge8	%i3,	%i1,	%o3
	umul	%i6,	%l5,	%o1
	sdivx	%o5,	0x1B02,	%i2
	sdivcc	%i0,	0x0269,	%l3
	movvc	%xcc,	%o0,	%i7
	edge32	%i5,	%o4,	%l1
	te	%icc,	0x7
	taddcc	%g4,	0x0BB0,	%g5
	fxors	%f29,	%f1,	%f15
	fmovsn	%icc,	%f8,	%f25
	movl	%icc,	%i4,	%g2
	fmovdcc	%xcc,	%f22,	%f12
	fblg	%fcc2,	loop_1726
	subccc	%g7,	%l0,	%l2
	movvc	%xcc,	%o7,	%g6
	movgu	%icc,	%g3,	%l4
loop_1726:
	fand	%f28,	%f26,	%f16
	alignaddrl	%l6,	%o2,	%g1
	fbule,a	%fcc2,	loop_1727
	sra	%i3,	0x02,	%i1
	wr	%g0,	0x80,	%asi
	stba	%o6,	[%l7 + 0x6A] %asi
loop_1727:
	movre	%i6,	%l5,	%o1
	fbug	%fcc2,	loop_1728
	fnands	%f4,	%f14,	%f25
	movne	%xcc,	%o5,	%o3
	tl	%icc,	0x3
loop_1728:
	andn	%i2,	%i0,	%l3
	fmovrslez	%o0,	%f29,	%f22
	popc	0x14A4,	%i7
	tneg	%xcc,	0x7
	sll	%i5,	0x0D,	%o4
	tcs	%icc,	0x4
	array16	%l1,	%g4,	%i4
	fbule	%fcc1,	loop_1729
	bleu,a	%icc,	loop_1730
	mulscc	%g5,	0x015B,	%g2
	bn,a	%xcc,	loop_1731
loop_1729:
	fors	%f25,	%f10,	%f31
loop_1730:
	bleu,a	%icc,	loop_1732
	tsubcctv	%l0,	%l2,	%g7
loop_1731:
	movge	%xcc,	%o7,	%g6
	tgu	%xcc,	0x3
loop_1732:
	fmovsle	%icc,	%f1,	%f16
	nop
	setx	0x776D906DB23AF4A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x2A6D8402DD0A7E99,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f18,	%f4
	alignaddr	%l4,	%g3,	%l6
	sth	%g1,	[%l7 + 0x30]
	nop
	setx	0x907662FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	bleu,a,pt	%icc,	loop_1733
	brlez	%o2,	loop_1734
	alignaddrl	%i3,	%o6,	%i1
	umul	%i6,	%o1,	%l5
loop_1733:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x14] %asi,	%o5
loop_1734:
	srl	%o3,	%i0,	%l3
	addc	%o0,	%i2,	%i5
	ldub	[%l7 + 0x2B],	%o4
	sll	%i7,	0x1C,	%g4
	fbe	%fcc3,	loop_1735
	nop
	setx	0xAF771CB730445241,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	ta	%icc,	0x3
	ldd	[%l7 + 0x70],	%i4
loop_1735:
	tn	%icc,	0x4
	set	0x28, %l2
	stba	%g5,	[%l7 + %l2] 0x89
	tvs	%xcc,	0x6
	bn,a	loop_1736
	st	%f12,	[%l7 + 0x30]
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f12
	fxtod	%f12,	%f12
	udivx	%g2,	0x1747,	%l0
loop_1736:
	fnot2	%f10,	%f22
	brlz	%l1,	loop_1737
	edge8	%g7,	%l2,	%g6
	xnorcc	%l4,	0x0153,	%g3
	movcs	%icc,	%l6,	%o7
loop_1737:
	subcc	%o2,	%g1,	%o6
	fands	%f17,	%f21,	%f30
	be,a	%xcc,	loop_1738
	for	%f30,	%f28,	%f20
	nop
	setx	0xF7B0D0745AA322CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF5EB668FA496031D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f30,	%f14
	movn	%icc,	%i1,	%i3
loop_1738:
	movl	%icc,	%o1,	%i6
	addccc	%l5,	0x1B76,	%o5
	orncc	%i0,	%l3,	%o3
	movg	%icc,	%o0,	%i5
	movcs	%xcc,	%i2,	%i7
	tsubcc	%g4,	%o4,	%i4
	xnor	%g2,	%g5,	%l1
	fmovdcc	%xcc,	%f12,	%f1
	stx	%l0,	[%l7 + 0x68]
	fpadd16	%f4,	%f26,	%f10
	brz	%l2,	loop_1739
	sll	%g6,	0x0F,	%l4
	fcmple16	%f2,	%f18,	%g7
	nop
	setx	loop_1740,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1739:
	nop
	setx	loop_1741,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%g3,	0x1B,	%o7
	subccc	%o2,	%g1,	%l6
loop_1740:
	andncc	%o6,	%i3,	%i1
loop_1741:
	tg	%icc,	0x1
	or	%i6,	%l5,	%o1
	set	0x38, %i5
	stxa	%o5,	[%l7 + %i5] 0x10
	alignaddr	%i0,	%o3,	%o0
	stbar
	tcs	%icc,	0x6
	movl	%icc,	%i5,	%i2
	tl	%xcc,	0x7
	nop
	setx loop_1742, %l0, %l1
	jmpl %l1, %i7
	subc	%g4,	%l3,	%i4
	tle	%icc,	0x4
	movrne	%g2,	%o4,	%g5
loop_1742:
	subcc	%l0,	0x0E6D,	%l1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x81,	%l2,	%l4
	edge8	%g6,	%g3,	%o7
	te	%icc,	0x2
	orn	%g7,	0x1C47,	%o2
	fmuld8sux16	%f27,	%f1,	%f10
	subcc	%g1,	%l6,	%o6
	fmovdvs	%xcc,	%f8,	%f27
	fcmpne32	%f0,	%f26,	%i1
	taddcc	%i6,	%i3,	%o1
	movcc	%icc,	%o5,	%l5
	tn	%xcc,	0x7
	sdiv	%o3,	0x0C76,	%i0
	sub	%o0,	0x1A45,	%i5
	udivcc	%i7,	0x19D7,	%g4
	subccc	%i2,	0x1829,	%i4
	array32	%l3,	%g2,	%g5
	ba,pn	%icc,	loop_1743
	fbe,a	%fcc2,	loop_1744
	ldd	[%l7 + 0x28],	%f0
	nop
	setx	0x047C1D18,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x093DEFB9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f3,	%f27
loop_1743:
	fnot1s	%f14,	%f21
loop_1744:
	fbn	%fcc1,	loop_1745
	array32	%l0,	%l1,	%o4
	nop
	fitod	%f6,	%f2
	fdtoi	%f2,	%f22
	bleu,a,pn	%xcc,	loop_1746
loop_1745:
	srlx	%l2,	%l4,	%g3
	movrlz	%o7,	0x25E,	%g7
	ld	[%l7 + 0x2C],	%f3
loop_1746:
	edge32n	%g6,	%o2,	%l6
	alignaddrl	%g1,	%o6,	%i6
	brgez	%i1,	loop_1747
	fone	%f24
	xnor	%o1,	0x0D4E,	%i3
	fnegs	%f14,	%f16
loop_1747:
	subc	%o5,	0x04C8,	%o3
	movrgz	%i0,	%l5,	%o0
	andncc	%i7,	%g4,	%i5
	ldd	[%l7 + 0x50],	%f8
	sdiv	%i2,	0x09A5,	%l3
	fblg,a	%fcc2,	loop_1748
	alignaddrl	%g2,	%i4,	%g5
	movcc	%xcc,	%l0,	%l1
	lduh	[%l7 + 0x4E],	%l2
loop_1748:
	andn	%l4,	%o4,	%o7
	wr	%g0,	0x81,	%asi
	stba	%g3,	[%l7 + 0x79] %asi
	smulcc	%g6,	%o2,	%l6
	movgu	%xcc,	%g7,	%g1
	addcc	%i6,	%o6,	%i1
	nop
	setx	loop_1749,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%o1,	0x0405,	%o5
	bvs,pn	%xcc,	loop_1750
	umul	%o3,	%i0,	%i3
loop_1749:
	alignaddr	%l5,	%i7,	%g4
	or	%o0,	0x00D1,	%i5
loop_1750:
	edge16l	%l3,	%i2,	%g2
	taddcc	%i4,	0x0D5F,	%l0
	tne	%icc,	0x2
	subccc	%l1,	%l2,	%g5
	fbule,a	%fcc2,	loop_1751
	array32	%l4,	%o7,	%o4
	tleu	%xcc,	0x2
	fmul8sux16	%f20,	%f26,	%f20
loop_1751:
	nop
	setx	0xCF27FA9C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x2D8F149E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f15,	%f28
	movcs	%xcc,	%g3,	%o2
	nop
	fitos	%f4,	%f10
	fstox	%f10,	%f0
	fcmpne32	%f30,	%f10,	%l6
	sdivcc	%g6,	0x0C65,	%g7
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f3
	xor	%g1,	0x075D,	%i6
	edge32n	%i1,	%o6,	%o1
	nop
	setx	0x0A7043CDD05F3915,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	edge32l	%o3,	%o5,	%i3
	bne,a	loop_1752
	fmovdle	%xcc,	%f19,	%f11
	edge16n	%l5,	%i7,	%g4
	udiv	%i0,	0x0756,	%o0
loop_1752:
	brnz,a	%l3,	loop_1753
	edge8n	%i2,	%i5,	%g2
	edge16l	%l0,	%l1,	%i4
	edge16ln	%g5,	%l2,	%l4
loop_1753:
	tleu	%xcc,	0x3
	edge8n	%o4,	%o7,	%o2
	nop
	setx	loop_1754,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%xcc,	0x4
	fmovdcc	%xcc,	%f3,	%f29
	edge16	%g3,	%l6,	%g7
loop_1754:
	st	%f25,	[%l7 + 0x50]
	srl	%g6,	%g1,	%i1
	flush	%l7 + 0x0C
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	umulcc	%o6,	0x154A,	%o3
	umul	%o5,	%i3,	%o1
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%i7
	udivcc	%l5,	0x1F93,	%g4
	std	%f22,	[%l7 + 0x48]
	fcmpeq32	%f18,	%f26,	%i0
	mova	%icc,	%l3,	%i2
	subccc	%o0,	%i5,	%l0
	ldd	[%l7 + 0x40],	%l0
	sra	%g2,	%i4,	%g5
	tvs	%xcc,	0x1
	sdivcc	%l4,	0x138E,	%o4
	andn	%o7,	0x1D3F,	%l2
	set	0x64, %g2
	stwa	%g3,	[%l7 + %g2] 0x04
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x11
	fabsd	%f8,	%f2
	ldx	[%l7 + 0x08],	%l6
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f6
	sdivcc	%o2,	0x032F,	%g6
	movrne	%g7,	0x3F0,	%g1
	fmovda	%xcc,	%f5,	%f12
	fbg	%fcc1,	loop_1755
	bcs	loop_1756
	sdivx	%i1,	0x0451,	%i6
	fbug,a	%fcc3,	loop_1757
loop_1755:
	tvc	%icc,	0x1
loop_1756:
	movleu	%icc,	%o3,	%o6
	udiv	%i3,	0x1BBB,	%o5
loop_1757:
	movrne	%o1,	0x27E,	%i7
	fmovspos	%icc,	%f11,	%f22
	movcs	%xcc,	%l5,	%i0
	array8	%l3,	%g4,	%i2
	fmovse	%icc,	%f26,	%f4
	tvs	%xcc,	0x4
	movrlz	%o0,	%l0,	%l1
	fmuld8ulx16	%f5,	%f9,	%f20
	alignaddr	%i5,	%g2,	%i4
	fcmple32	%f28,	%f20,	%g5
	fmovdcs	%icc,	%f14,	%f11
	tpos	%xcc,	0x3
	edge16l	%o4,	%l4,	%o7
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x38] %asi,	%g3
	orn	%l2,	0x1717,	%o2
	andn	%l6,	0x155F,	%g6
	move	%icc,	%g7,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i6,	%o3,	%o6
	movg	%xcc,	%i3,	%g1
	edge8	%o5,	%i7,	%l5
	movre	%i0,	0x10C,	%o1
	udivcc	%l3,	0x0D4D,	%g4
	tcs	%xcc,	0x3
	fbne,a	%fcc0,	loop_1758
	fbe,a	%fcc1,	loop_1759
	srl	%i2,	0x05,	%l0
	fmovdvc	%xcc,	%f6,	%f1
loop_1758:
	nop
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1759:
	taddcc	%l1,	0x15F8,	%i5
	fpsub16	%f0,	%f30,	%f14
	addccc	%o0,	%g2,	%i4
	alignaddrl	%o4,	%g5,	%l4
	udivcc	%o7,	0x18A1,	%l2
	subc	%g3,	%o2,	%l6
	fmul8x16au	%f20,	%f0,	%f26
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%i1
	array8	%g6,	%i6,	%o3
	fbg	%fcc1,	loop_1760
	mova	%xcc,	%i3,	%o6
	bne	%icc,	loop_1761
	fmovsvs	%icc,	%f13,	%f25
loop_1760:
	addccc	%g1,	0x1AD3,	%o5
	edge32	%i7,	%l5,	%o1
loop_1761:
	bn	%xcc,	loop_1762
	taddcc	%i0,	0x0CC1,	%l3
	tge	%xcc,	0x4
	brz,a	%g4,	loop_1763
loop_1762:
	edge8	%l0,	%i2,	%l1
	tge	%icc,	0x3
	movrgez	%o0,	0x324,	%g2
loop_1763:
	fmovrdlez	%i5,	%f28,	%f6
	srax	%o4,	0x1A,	%i4
	movrne	%g5,	0x24A,	%l4
	fornot1	%f14,	%f4,	%f16
	addc	%l2,	0x08F5,	%g3
	udivcc	%o7,	0x1E8F,	%o2
	tne	%xcc,	0x4
	taddcc	%l6,	0x08C2,	%i1
	sllx	%g7,	%g6,	%i6
	fmovdcs	%icc,	%f29,	%f6
	movvc	%xcc,	%o3,	%i3
	wr	%g0,	0x81,	%asi
	stwa	%g1,	[%l7 + 0x24] %asi
	fbo,a	%fcc3,	loop_1764
	tcc	%icc,	0x3
	smulcc	%o5,	%i7,	%o6
	orcc	%o1,	0x0D9C,	%l5
loop_1764:
	fmovrsgz	%i0,	%f19,	%f20
	movge	%icc,	%g4,	%l3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x34] %asi,	%i2
	sll	%l0,	%l1,	%o0
	mulscc	%i5,	0x0D1A,	%g2
	movcc	%icc,	%o4,	%i4
	edge8	%l4,	%l2,	%g3
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x14] %asi,	%o7
	fors	%f6,	%f0,	%f11
	movrgz	%g5,	0x2FC,	%o2
	or	%i1,	0x1FE2,	%g7
	srax	%l6,	0x12,	%g6
	sth	%o3,	[%l7 + 0x0A]
	tsubcc	%i6,	%g1,	%i3
	bn,a,pt	%xcc,	loop_1765
	fmovspos	%icc,	%f10,	%f3
	movg	%xcc,	%i7,	%o5
	sethi	0x0E6D,	%o6
loop_1765:
	movcs	%icc,	%l5,	%i0
	array32	%o1,	%l3,	%i2
	movleu	%icc,	%g4,	%l1
	tsubcctv	%o0,	%l0,	%i5
	or	%o4,	%g2,	%l4
	fnegs	%f9,	%f31
	alignaddrl	%i4,	%l2,	%g3
	xnorcc	%g5,	0x1FF5,	%o2
	tgu	%xcc,	0x3
	tpos	%xcc,	0x1
	edge16n	%i1,	%o7,	%l6
	fsrc1s	%f6,	%f20
	taddcc	%g7,	0x01B4,	%g6
	fba,a	%fcc0,	loop_1766
	nop
	setx	0xAA018868,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x7E472B0B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f19,	%f24
	edge32l	%o3,	%i6,	%i3
	set	0x10, %o4
	sta	%f30,	[%l7 + %o4] 0x19
loop_1766:
	movpos	%icc,	%i7,	%g1
	fbl	%fcc2,	loop_1767
	lduw	[%l7 + 0x58],	%o6
	brlz	%o5,	loop_1768
	srlx	%i0,	%l5,	%l3
loop_1767:
	tg	%xcc,	0x4
	fabsd	%f20,	%f24
loop_1768:
	umul	%o1,	%i2,	%g4
	mulx	%o0,	%l1,	%i5
	ta	%icc,	0x3
	mulx	%o4,	%g2,	%l0
	sdiv	%i4,	0x0EFE,	%l2
	fbl	%fcc1,	loop_1769
	nop
	setx	0x793415B918D08A7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f24
	nop
	setx	0x40645D4C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x69BE8626,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f11,	%f17
	sethi	0x1199,	%g3
loop_1769:
	move	%xcc,	%l4,	%o2
	sdivx	%i1,	0x1034,	%g5
	set	0x40, %i6
	ldxa	[%l7 + %i6] 0x81,	%l6
	fpackfix	%f14,	%f23
	tge	%xcc,	0x2
	xnorcc	%g7,	0x13AE,	%g6
	add	%o3,	%i6,	%o7
	flush	%l7 + 0x74
	tg	%icc,	0x7
	srax	%i3,	%g1,	%i7
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movneg	%xcc,	%o5,	%o6
	sllx	%i0,	%l3,	%o1
	edge32n	%i2,	%l5,	%g4
	brlez	%o0,	loop_1770
	sllx	%i5,	0x11,	%o4
	movrlez	%l1,	0x3E8,	%l0
	and	%i4,	%g2,	%l2
loop_1770:
	udivcc	%l4,	0x1400,	%g3
	addccc	%o2,	%i1,	%l6
	set	0x3A, %o7
	ldsha	[%l7 + %o7] 0x15,	%g7
	fmovdcc	%icc,	%f24,	%f22
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x22] %asi,	%g5
	membar	0x13
	bge,pt	%xcc,	loop_1771
	movleu	%icc,	%g6,	%o3
	set	0x38, %l0
	prefetcha	[%l7 + %l0] 0x14,	 0x3
loop_1771:
	movge	%xcc,	%i6,	%g1
	nop
	fitod	%f17,	%f16
	fmovdpos	%xcc,	%f3,	%f30
	stb	%i7,	[%l7 + 0x2F]
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%o5
	xor	%i3,	%i0,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x0A],	%l3
	fmovdne	%icc,	%f30,	%f27
	edge32	%i2,	%l5,	%o1
	fpadd16	%f20,	%f8,	%f20
	fmovdvc	%icc,	%f30,	%f22
	movpos	%xcc,	%o0,	%i5
	nop
	fitos	%f19,	%f4
	nop
	fitos	%f9,	%f13
	fstod	%f13,	%f20
	mulx	%g4,	0x1A16,	%l1
	mulscc	%o4,	%l0,	%g2
	fmovsle	%xcc,	%f24,	%f30
	tl	%xcc,	0x5
	bge,pt	%xcc,	loop_1772
	tleu	%icc,	0x0
	taddcc	%l2,	0x03AF,	%i4
	movvs	%xcc,	%l4,	%g3
loop_1772:
	fnot2	%f20,	%f28
	taddcctv	%o2,	0x1B6F,	%l6
	fpadd32	%f28,	%f20,	%f12
	set	0x40, %i3
	stha	%g7,	[%l7 + %i3] 0x2b
	membar	#Sync
	ldsh	[%l7 + 0x16],	%g5
	edge32n	%g6,	%o3,	%i1
	tneg	%xcc,	0x5
	tsubcctv	%o7,	0x03C4,	%i6
	tsubcctv	%i7,	0x0F46,	%o5
	tl	%icc,	0x6
	movrlz	%i3,	0x16C,	%i0
	move	%xcc,	%o6,	%g1
	movcs	%icc,	%l3,	%i2
	fmuld8ulx16	%f12,	%f27,	%f16
	add	%l5,	0x15BA,	%o0
	fornot2s	%f27,	%f27,	%f19
	smulcc	%o1,	%i5,	%g4
	movn	%icc,	%o4,	%l0
	edge8	%l1,	%g2,	%l2
	andn	%l4,	0x04BA,	%i4
	edge32	%g3,	%l6,	%o2
	tl	%icc,	0x6
	fmovsneg	%icc,	%f25,	%f1
	and	%g7,	%g6,	%o3
	be,pt	%xcc,	loop_1773
	subc	%g5,	0x075D,	%o7
	add	%i1,	0x005A,	%i7
	fmul8x16au	%f0,	%f10,	%f24
loop_1773:
	nop
	set	0x14, %g6
	lduba	[%l7 + %g6] 0x14,	%i6
	xor	%i3,	%o5,	%o6
	fnot1	%f14,	%f20
	and	%g1,	0x073F,	%i0
	add	%i2,	0x0C89,	%l5
	movg	%icc,	%l3,	%o1
	ble,a,pn	%icc,	loop_1774
	srlx	%i5,	%o0,	%g4
	te	%xcc,	0x2
	fcmpne32	%f4,	%f0,	%l0
loop_1774:
	fbug	%fcc3,	loop_1775
	edge16n	%o4,	%l1,	%l2
	movge	%icc,	%g2,	%i4
	mulscc	%l4,	%g3,	%o2
loop_1775:
	movneg	%icc,	%g7,	%g6
	movrne	%l6,	0x10C,	%g5
	alignaddrl	%o3,	%i1,	%i7
	bshuffle	%f14,	%f6,	%f26
	flush	%l7 + 0x60
	fbue	%fcc2,	loop_1776
	tge	%xcc,	0x6
	te	%icc,	0x7
	set	0x28, %i4
	lduba	[%l7 + %i4] 0x10,	%i6
loop_1776:
	nop
	setx	loop_1777,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%o7,	%i3,	%o5
	array16	%g1,	%i0,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1777:
	udiv	%o6,	0x00FC,	%l5
	bl,a,pt	%xcc,	loop_1778
	fcmpgt16	%f6,	%f18,	%o1
	stbar
	bgu	%icc,	loop_1779
loop_1778:
	orcc	%i5,	0x1E63,	%l3
	set	0x40, %l1
	lda	[%l7 + %l1] 0x89,	%f28
loop_1779:
	nop
	set	0x68, %o0
	ldswa	[%l7 + %o0] 0x14,	%o0
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x14,	%g4
	movvc	%xcc,	%o4,	%l1
	srax	%l2,	0x0E,	%l0
	sdivx	%i4,	0x0A99,	%g2
	sll	%l4,	0x0E,	%g3
	bne,a	%icc,	loop_1780
	sll	%g7,	0x09,	%g6
	ldd	[%l7 + 0x48],	%f22
	srax	%o2,	%g5,	%o3
loop_1780:
	edge8	%i1,	%i7,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x7
	sir	0x16B4
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x78] %asi,	%i6
	fmovdneg	%xcc,	%f6,	%f0
	edge16ln	%i3,	%o5,	%g1
	udivx	%o7,	0x0106,	%i2
	fpsub16	%f4,	%f18,	%f4
	fmovsg	%icc,	%f12,	%f24
	tneg	%icc,	0x1
	faligndata	%f2,	%f24,	%f28
	fpsub32s	%f16,	%f4,	%f30
	fmovsl	%xcc,	%f4,	%f17
	nop
	setx loop_1781, %l0, %l1
	jmpl %l1, %o6
	fbn	%fcc1,	loop_1782
	xor	%l5,	0x11D8,	%o1
	taddcc	%i5,	0x1213,	%l3
loop_1781:
	udivx	%o0,	0x0647,	%g4
loop_1782:
	nop
	setx	0x90518DEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x44] %asi,	%i0
	move	%icc,	%l1,	%l2
	movre	%o4,	0x007,	%l0
	movneg	%icc,	%i4,	%l4
	array16	%g3,	%g2,	%g7
	ld	[%l7 + 0x58],	%f30
	edge32l	%o2,	%g6,	%o3
	movvs	%icc,	%i1,	%g5
	bne,a,pt	%icc,	loop_1783
	subcc	%l6,	0x0968,	%i7
	subccc	%i3,	0x1205,	%i6
	tsubcc	%g1,	%o5,	%i2
loop_1783:
	taddcc	%o6,	0x1D04,	%l5
	fmovsl	%xcc,	%f1,	%f19
	andncc	%o7,	%i5,	%o1
	brz	%o0,	loop_1784
	movrlz	%l3,	%i0,	%g4
	movne	%icc,	%l1,	%l2
	movre	%l0,	0x1E5,	%i4
loop_1784:
	edge16l	%o4,	%l4,	%g3
	nop
	fitod	%f8,	%f14
	fdtos	%f14,	%f17
	fandnot1s	%f6,	%f7,	%f13
	fbu,a	%fcc2,	loop_1785
	bl,pt	%icc,	loop_1786
	xor	%g7,	%g2,	%o2
	xorcc	%g6,	%o3,	%g5
loop_1785:
	taddcc	%i1,	%l6,	%i3
loop_1786:
	fbne,a	%fcc3,	loop_1787
	fbule	%fcc2,	loop_1788
	movle	%xcc,	%i7,	%i6
	fzeros	%f21
loop_1787:
	fbo	%fcc1,	loop_1789
loop_1788:
	sdivcc	%g1,	0x024B,	%i2
	call	loop_1790
	smulcc	%o5,	0x0DBB,	%l5
loop_1789:
	fxnor	%f16,	%f24,	%f20
	brgz,a	%o6,	loop_1791
loop_1790:
	move	%xcc,	%i5,	%o7
	movrlz	%o1,	0x022,	%l3
	smul	%o0,	0x0305,	%g4
loop_1791:
	nop
	set	0x16, %i2
	ldub	[%l7 + %i2],	%i0
	smulcc	%l1,	%l0,	%l2
	alignaddrl	%o4,	%i4,	%g3
	fcmpeq16	%f8,	%f20,	%l4
	ta	%icc,	0x7
	edge32n	%g7,	%g2,	%o2
	xnorcc	%o3,	0x0D1D,	%g6
	edge8ln	%g5,	%i1,	%l6
	udivx	%i7,	0x187D,	%i6
	bgu,a	%icc,	loop_1792
	fornot1s	%f3,	%f25,	%f19
	edge32n	%i3,	%i2,	%o5
	fpadd16s	%f2,	%f6,	%f15
loop_1792:
	edge8ln	%g1,	%l5,	%i5
	tneg	%icc,	0x4
	stw	%o7,	[%l7 + 0x64]
	tl	%xcc,	0x6
	tsubcc	%o1,	0x1F19,	%l3
	fbuge,a	%fcc1,	loop_1793
	fmovrsgz	%o6,	%f4,	%f0
	popc	%g4,	%o0
	fandnot2s	%f19,	%f1,	%f10
loop_1793:
	xorcc	%i0,	%l1,	%l0
	andn	%o4,	0x0D95,	%l2
	fbne	%fcc0,	loop_1794
	orn	%g3,	0x1025,	%i4
	smulcc	%l4,	%g7,	%g2
	brgz,a	%o3,	loop_1795
loop_1794:
	fmovrdne	%o2,	%f6,	%f16
	orncc	%g6,	%i1,	%g5
	fpsub32	%f14,	%f6,	%f6
loop_1795:
	and	%i7,	0x1A16,	%l6
	fxnors	%f1,	%f21,	%f4
	fmovsa	%icc,	%f7,	%f25
	sdiv	%i6,	0x0A13,	%i2
	srlx	%i3,	%o5,	%l5
	xnorcc	%i5,	%g1,	%o1
	xorcc	%o7,	%l3,	%g4
	tsubcctv	%o0,	0x02F2,	%o6
	movne	%xcc,	%l1,	%i0
	tge	%icc,	0x3
	fxnor	%f30,	%f8,	%f0
	fmovrdne	%l0,	%f8,	%f18
	stw	%o4,	[%l7 + 0x60]
	fcmpne32	%f8,	%f0,	%l2
	movrne	%g3,	0x073,	%l4
	flush	%l7 + 0x0C
	fmovda	%xcc,	%f28,	%f8
	movrlz	%i4,	%g7,	%g2
	tge	%xcc,	0x7
	movn	%xcc,	%o2,	%o3
	movrne	%i1,	%g6,	%g5
	tvc	%xcc,	0x2
	array8	%i7,	%i6,	%i2
	movrlz	%l6,	%o5,	%l5
	edge32n	%i3,	%g1,	%o1
	edge8ln	%i5,	%o7,	%g4
	fnor	%f30,	%f26,	%f10
	ta	%icc,	0x5
	bcs,a	loop_1796
	nop
	fitod	%f6,	%f20
	fdtoi	%f20,	%f22
	srax	%l3,	%o6,	%o0
	array16	%i0,	%l0,	%l1
loop_1796:
	tne	%xcc,	0x1
	fcmple32	%f6,	%f4,	%l2
	orcc	%o4,	%l4,	%i4
	sra	%g3,	%g2,	%o2
	nop
	setx loop_1797, %l0, %l1
	jmpl %l1, %g7
	fnegd	%f4,	%f8
	mulscc	%i1,	%o3,	%g6
	fmovdle	%icc,	%f7,	%f29
loop_1797:
	movre	%g5,	%i6,	%i7
	fmovdpos	%xcc,	%f5,	%f23
	ldub	[%l7 + 0x3A],	%i2
	tleu	%xcc,	0x4
	movg	%icc,	%l6,	%o5
	edge16	%l5,	%g1,	%o1
	ta	%xcc,	0x1
	movne	%xcc,	%i5,	%i3
	mova	%xcc,	%g4,	%o7
	fmovrdgez	%l3,	%f0,	%f20
	fmovdpos	%xcc,	%f2,	%f21
	nop
	setx	loop_1798,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%o6,	0x0FBB,	%i0
	nop
	fitod	%f8,	%f20
	sllx	%o0,	0x09,	%l0
loop_1798:
	tsubcctv	%l2,	0x1A38,	%l1
	subccc	%o4,	%l4,	%g3
	fbne	%fcc3,	loop_1799
	sll	%g2,	0x07,	%o2
	bpos,a,pn	%icc,	loop_1800
	fmovdge	%xcc,	%f11,	%f20
loop_1799:
	nop
	fitos	%f10,	%f27
	fstox	%f27,	%f24
	fxtos	%f24,	%f13
	fcmpne16	%f10,	%f2,	%i4
loop_1800:
	fnot2s	%f24,	%f9
	movpos	%icc,	%g7,	%i1
	movn	%xcc,	%g6,	%o3
	sdivcc	%g5,	0x1B1E,	%i7
	alignaddrl	%i2,	%l6,	%o5
	call	loop_1801
	movre	%i6,	0x285,	%l5
	popc	0x136E,	%o1
	fmovse	%icc,	%f12,	%f30
loop_1801:
	fsrc1s	%f13,	%f30
	move	%icc,	%g1,	%i3
	srlx	%i5,	0x13,	%o7
	and	%l3,	%g4,	%o6
	smulcc	%o0,	%i0,	%l2
	sth	%l0,	[%l7 + 0x56]
	membar	0x44
	movrlz	%l1,	0x394,	%l4
	tpos	%icc,	0x6
	fbue	%fcc0,	loop_1802
	brnz,a	%g3,	loop_1803
	prefetch	[%l7 + 0x6C],	 0x0
	tgu	%icc,	0x2
loop_1802:
	movne	%icc,	%g2,	%o2
loop_1803:
	fbule	%fcc0,	loop_1804
	and	%o4,	0x183A,	%g7
	tvs	%icc,	0x1
	edge32	%i1,	%g6,	%i4
loop_1804:
	movrne	%o3,	0x3E7,	%g5
	tsubcc	%i7,	%l6,	%i2
	subcc	%o5,	%i6,	%o1
	fbne,a	%fcc3,	loop_1805
	movgu	%icc,	%l5,	%g1
	movre	%i3,	%i5,	%o7
	bl,a	loop_1806
loop_1805:
	fmovsvc	%xcc,	%f20,	%f6
	and	%l3,	0x0B61,	%o6
	std	%f20,	[%l7 + 0x20]
loop_1806:
	movcc	%icc,	%o0,	%g4
	nop
	fitod	%f23,	%f2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%l2
	mulscc	%l1,	%l4,	%l0
	edge32l	%g3,	%o2,	%g2
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x56] %asi,	%o4
	movneg	%xcc,	%i1,	%g7
	movn	%icc,	%i4,	%o3
	srlx	%g5,	0x08,	%i7
	movneg	%icc,	%l6,	%i2
	bcs,a	%icc,	loop_1807
	movre	%o5,	0x208,	%g6
	ble	loop_1808
	andncc	%i6,	%o1,	%l5
loop_1807:
	taddcc	%g1,	%i5,	%o7
	subcc	%l3,	0x00E8,	%i3
loop_1808:
	xorcc	%o6,	0x1D1A,	%o0
	ldub	[%l7 + 0x0A],	%i0
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x14,	%f0
	subccc	%l2,	0x0C6A,	%l1
	movge	%icc,	%l4,	%g4
	edge16l	%l0,	%o2,	%g2
	bcc	%icc,	loop_1809
	movvc	%xcc,	%g3,	%o4
	tleu	%xcc,	0x6
	fmovscs	%xcc,	%f5,	%f5
loop_1809:
	xorcc	%g7,	0x1BBD,	%i4
	andcc	%o3,	%i1,	%i7
	smul	%g5,	%i2,	%l6
	set	0x68, %g3
	lda	[%l7 + %g3] 0x10,	%f28
	sir	0x1F82
	xorcc	%o5,	0x191C,	%i6
	udiv	%g6,	0x0D5C,	%o1
	movrgz	%g1,	%l5,	%i5
	movcs	%icc,	%l3,	%i3
	movneg	%xcc,	%o7,	%o0
	nop
	setx	0xC061E33B,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	fbu,a	%fcc2,	loop_1810
	mulscc	%i0,	0x0A27,	%l2
	andncc	%l1,	%l4,	%o6
	te	%icc,	0x1
loop_1810:
	nop
	setx	0xAF0CF15F07A034AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xDD847B0767933F58,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f16,	%f0
	array8	%g4,	%o2,	%l0
	movcs	%xcc,	%g2,	%o4
	lduh	[%l7 + 0x28],	%g7
	smulcc	%i4,	%g3,	%i1
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%o3
	movgu	%icc,	%g5,	%i2
	fmovdge	%icc,	%f27,	%f5
	orncc	%l6,	%i7,	%i6
	addccc	%o5,	%o1,	%g6
	sub	%g1,	0x1BF8,	%i5
	movvc	%xcc,	%l3,	%i3
	fxnors	%f4,	%f13,	%f21
	fcmpeq32	%f18,	%f16,	%l5
	alignaddr	%o7,	%i0,	%o0
	udivcc	%l1,	0x0FE2,	%l2
	set	0x34, %i7
	lduwa	[%l7 + %i7] 0x10,	%o6
	and	%g4,	%o2,	%l4
	movg	%icc,	%l0,	%g2
	addcc	%o4,	%g7,	%g3
	for	%f22,	%f4,	%f6
	array16	%i4,	%o3,	%i1
	movl	%xcc,	%i2,	%g5
	fbn	%fcc1,	loop_1811
	membar	0x76
	andn	%i7,	%i6,	%o5
	edge16	%o1,	%l6,	%g6
loop_1811:
	subc	%i5,	%l3,	%g1
	addc	%i3,	%l5,	%i0
	movn	%icc,	%o0,	%o7
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	ble,a	loop_1812
	movrgez	%o6,	%l2,	%g4
	movne	%icc,	%o2,	%l0
	movgu	%xcc,	%l4,	%o4
loop_1812:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x38, %g1
	sta	%f3,	[%l7 + %g1] 0x18
	tsubcc	%g2,	0x19B0,	%g3
	tgu	%xcc,	0x4
	sllx	%g7,	%i4,	%i1
	nop
	fitod	%f2,	%f4
	fdtos	%f4,	%f12
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%o3,	%g5
	ta	%icc,	0x5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movl	%xcc,	%i2,	%i6
	addc	%o5,	0x099C,	%o1
	fpackfix	%f18,	%f17
	brlez	%l6,	loop_1813
	tl	%icc,	0x1
	array32	%g6,	%i7,	%i5
	ldx	[%l7 + 0x10],	%g1
loop_1813:
	ble,a	loop_1814
	fnor	%f2,	%f20,	%f24
	movg	%xcc,	%i3,	%l3
	tne	%xcc,	0x1
loop_1814:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x4C] %asi,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %g4
	ldda	[%l7 + %g4] 0x19,	%i0
	movpos	%icc,	%l5,	%o0
	fors	%f23,	%f9,	%f6
	srax	%o7,	%l1,	%o6
	tneg	%xcc,	0x3
	movvc	%icc,	%g4,	%o2
	tvs	%icc,	0x1
	popc	%l2,	%l0
	te	%xcc,	0x5
	tcc	%icc,	0x2
	membar	0x2C
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%l4
	fbne	%fcc2,	loop_1815
	fmovdgu	%xcc,	%f23,	%f20
	mova	%icc,	%g2,	%g3
	movrlz	%i4,	0x1CD,	%i1
loop_1815:
	popc	0x0EA2,	%g7
	tsubcc	%o3,	%i2,	%g5
	set	0x68, %g5
	prefetcha	[%l7 + %g5] 0x81,	 0x2
	udiv	%o5,	0x1E73,	%l6
	edge32n	%g6,	%o1,	%i7
	sethi	0x0F92,	%g1
	or	%i5,	%i3,	%i0
	movge	%icc,	%l3,	%o0
	set	0x2C, %o5
	stwa	%o7,	[%l7 + %o5] 0x2b
	membar	#Sync
	tge	%xcc,	0x2
	fbuge,a	%fcc3,	loop_1816
	fcmple32	%f30,	%f30,	%l5
	edge32ln	%o6,	%l1,	%g4
	nop
	fitos	%f14,	%f28
	fstox	%f28,	%f12
loop_1816:
	movleu	%xcc,	%o2,	%l2
	ta	%xcc,	0x4
	tsubcc	%o4,	0x054B,	%l4
	stx	%l0,	[%l7 + 0x40]
	fmovrsgz	%g3,	%f12,	%f10
	fmovscs	%xcc,	%f29,	%f15
	bge,a	loop_1817
	tne	%icc,	0x3
	movrgez	%i4,	0x3D8,	%g2
	edge32l	%g7,	%i1,	%o3
loop_1817:
	fbul,a	%fcc1,	loop_1818
	subcc	%g5,	0x0707,	%i2
	edge32ln	%i6,	%o5,	%g6
	movg	%icc,	%l6,	%o1
loop_1818:
	bn	%icc,	loop_1819
	movge	%icc,	%i7,	%g1
	fxnor	%f12,	%f20,	%f26
	sra	%i5,	0x18,	%i0
loop_1819:
	brgez	%l3,	loop_1820
	srlx	%o0,	0x02,	%o7
	movle	%icc,	%l5,	%o6
	xorcc	%l1,	0x0C9C,	%g4
loop_1820:
	tsubcc	%o2,	%i3,	%l2
	fornot1s	%f26,	%f22,	%f27
	tcc	%xcc,	0x7
	swap	[%l7 + 0x34],	%l4
	mova	%xcc,	%o4,	%g3
	movrgz	%l0,	%i4,	%g7
	set	0x52, %o3
	lduha	[%l7 + %o3] 0x18,	%g2
	fmovsne	%icc,	%f20,	%f20
	movcs	%xcc,	%i1,	%g5
	smul	%i2,	0x0073,	%i6
	ta	%xcc,	0x3
	fbe,a	%fcc1,	loop_1821
	fpadd16	%f26,	%f26,	%f14
	tgu	%xcc,	0x4
	movrgz	%o3,	%g6,	%l6
loop_1821:
	mova	%xcc,	%o1,	%o5
	orn	%i7,	%i5,	%i0
	bleu,pt	%xcc,	loop_1822
	array8	%l3,	%o0,	%g1
	fxnor	%f30,	%f30,	%f6
	movge	%icc,	%o7,	%l5
loop_1822:
	umul	%o6,	%l1,	%g4
	edge32ln	%i3,	%l2,	%l4
	bn	%xcc,	loop_1823
	brlz	%o4,	loop_1824
	tpos	%icc,	0x3
	fblg,a	%fcc2,	loop_1825
loop_1823:
	fmovdl	%icc,	%f6,	%f0
loop_1824:
	srlx	%g3,	%o2,	%i4
	nop
	setx	0x9050BA2F,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
loop_1825:
	movneg	%icc,	%g7,	%g2
	edge16ln	%i1,	%g5,	%i2
	nop
	setx	0x34F70468EB6FEE0A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x82653377D200321A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f22,	%f16
	fpadd32	%f30,	%f18,	%f4
	xnor	%l0,	%i6,	%g6
	fmovrde	%l6,	%f14,	%f2
	fmul8ulx16	%f12,	%f24,	%f0
	be	loop_1826
	fmovda	%icc,	%f16,	%f6
	movge	%xcc,	%o1,	%o3
	nop
	fitod	%f12,	%f26
	fdtoi	%f26,	%f8
loop_1826:
	sdiv	%o5,	0x0803,	%i7
	nop
	set	0x50, %l3
	ldx	[%l7 + %l3],	%i5
	tvc	%xcc,	0x7
	fble	%fcc0,	loop_1827
	subc	%i0,	0x1E9F,	%l3
	set	0x4C, %l4
	stba	%o0,	[%l7 + %l4] 0x2f
	membar	#Sync
loop_1827:
	ta	%icc,	0x2
	tle	%icc,	0x7
	movpos	%icc,	%g1,	%o7
	tleu	%icc,	0x4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x89,	%o6,	%l5
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	smul	%i3,	%l2,	%l4
	edge16l	%l1,	%o4,	%g3
	fxnors	%f19,	%f20,	%f25
	add	%i4,	0x0C27,	%g7
	nop
	setx	0x06BF9A6D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xCA7D1E0A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f11,	%f30
	fcmpgt16	%f26,	%f10,	%g2
	fbug,a	%fcc1,	loop_1828
	tcs	%icc,	0x0
	xor	%o2,	0x160E,	%i1
	nop
	fitos	%f8,	%f5
	fstox	%f5,	%f12
	fxtos	%f12,	%f0
loop_1828:
	nop
	fitos	%f2,	%f13
	fstoi	%f13,	%f4
	xnorcc	%g5,	0x1FF4,	%l0
	set	0x20, %l6
	lda	[%l7 + %l6] 0x18,	%f18
	fpsub16s	%f11,	%f20,	%f9
	edge16	%i2,	%g6,	%l6
	udivcc	%o1,	0x0DFF,	%o3
	tsubcctv	%o5,	0x0B5B,	%i7
	udivx	%i6,	0x1887,	%i5
	brz,a	%l3,	loop_1829
	tg	%xcc,	0x6
	ldstub	[%l7 + 0x29],	%o0
	movpos	%xcc,	%i0,	%g1
loop_1829:
	fble	%fcc2,	loop_1830
	nop
	setx	loop_1831,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%o7,	%o6,	%l5
	fsrc2s	%f12,	%f4
loop_1830:
	fpsub16	%f6,	%f10,	%f6
loop_1831:
	movg	%icc,	%i3,	%g4
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x2C] %asi,	%l4
	mulscc	%l2,	0x1C31,	%o4
	tcs	%xcc,	0x5
	bneg,pt	%icc,	loop_1832
	fmovspos	%icc,	%f5,	%f23
	movvs	%xcc,	%g3,	%l1
	fbne,a	%fcc2,	loop_1833
loop_1832:
	movneg	%icc,	%i4,	%g7
	fornot2s	%f10,	%f31,	%f25
	nop
	setx loop_1834, %l0, %l1
	jmpl %l1, %o2
loop_1833:
	fmovdpos	%xcc,	%f28,	%f1
	sllx	%i1,	%g2,	%g5
	tvs	%icc,	0x5
loop_1834:
	nop
	setx	0x23146E5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x4C5BDA11,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f23,	%f27
	movrlz	%i2,	%l0,	%g6
	movl	%xcc,	%o1,	%l6
	sll	%o5,	%i7,	%o3
	ldd	[%l7 + 0x48],	%i6
	xnorcc	%i5,	%o0,	%i0
	tg	%icc,	0x7
	nop
	setx	0x1D4B995E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f6
	sdiv	%l3,	0x07D6,	%g1
	fmovdvs	%xcc,	%f14,	%f11
	nop
	fitos	%f14,	%f23
	fstox	%f23,	%f30
	fxtos	%f30,	%f8
	xorcc	%o6,	%l5,	%i3
	andcc	%g4,	0x0FCD,	%l4
	fmovsn	%icc,	%f0,	%f12
	movneg	%icc,	%o7,	%o4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g3,	%l2
	set	0x00, %o1
	ldxa	[%g0 + %o1] 0x50,	%i4
	edge16ln	%l1,	%g7,	%o2
	tvc	%xcc,	0x6
	fnot1s	%f14,	%f27
	nop
	fitos	%f1,	%f4
	fstod	%f4,	%f26
	alignaddr	%g2,	%i1,	%i2
	ldd	[%l7 + 0x30],	%g4
	edge16n	%g6,	%l0,	%o1
	tge	%icc,	0x0
	bneg,a,pt	%icc,	loop_1835
	brlz,a	%l6,	loop_1836
	array32	%i7,	%o3,	%o5
	fblg	%fcc1,	loop_1837
loop_1835:
	stw	%i6,	[%l7 + 0x14]
loop_1836:
	tpos	%icc,	0x6
	fand	%f26,	%f22,	%f6
loop_1837:
	tgu	%icc,	0x2
	srl	%i5,	%i0,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f23,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1838
	fbuge,a	%fcc3,	loop_1839
	movle	%xcc,	%g1,	%l3
	popc	%l5,	%o6
loop_1838:
	subc	%g4,	%i3,	%l4
loop_1839:
	sllx	%o4,	0x0F,	%o7
	tsubcctv	%l2,	%g3,	%l1
	edge16l	%g7,	%i4,	%g2
	andcc	%o2,	0x08AA,	%i2
	fexpand	%f2,	%f4
	tl	%icc,	0x2
	nop
	fitod	%f12,	%f22
	fdtox	%f22,	%f16
	add	%l7,	0x24,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%i1,	%g5
	udivcc	%g6,	0x0154,	%l0
	bge,a	%xcc,	loop_1840
	nop
	fitos	%f10,	%f19
	fstoi	%f19,	%f14
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l6,	%o1
loop_1840:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	fbug,a	%fcc3,	loop_1841
	edge32n	%o5,	%o3,	%i5
	stb	%i6,	[%l7 + 0x73]
	umulcc	%o0,	0x10F1,	%i0
loop_1841:
	sir	0x0EBD
	xnorcc	%g1,	%l3,	%o6
	movrgez	%g4,	%i3,	%l5
	movg	%icc,	%l4,	%o7
	edge16l	%o4,	%l2,	%g3
	fmovrdgz	%g7,	%f10,	%f18
	fmovsvs	%xcc,	%f28,	%f18
	movneg	%xcc,	%i4,	%l1
	brz	%g2,	loop_1842
	bleu,a	%xcc,	loop_1843
	fpadd16s	%f14,	%f17,	%f10
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i2
loop_1842:
	movl	%icc,	%o2,	%i1
loop_1843:
	fpadd16s	%f20,	%f20,	%f7
	tpos	%xcc,	0x4
	array16	%g5,	%l0,	%l6
	fmovrsgez	%g6,	%f25,	%f0
	andn	%i7,	0x09CE,	%o1
	fxors	%f29,	%f18,	%f15
	fpackfix	%f18,	%f29
	fmovdpos	%xcc,	%f0,	%f15
	set	0x78, %i1
	stxa	%o5,	[%l7 + %i1] 0x22
	membar	#Sync
	tge	%icc,	0x2
	flush	%l7 + 0x44
	fmovde	%xcc,	%f17,	%f31
	fmul8x16al	%f19,	%f8,	%f30
	edge32ln	%o3,	%i6,	%i5
	movre	%i0,	0x335,	%g1
	fpadd32s	%f27,	%f12,	%f30
	mova	%icc,	%o0,	%o6
	move	%icc,	%g4,	%l3
	fzero	%f30
	tsubcc	%l5,	%l4,	%o7
	membar	0x1A
	tsubcctv	%o4,	0x0E46,	%i3
	fpackfix	%f22,	%f19
	sth	%g3,	[%l7 + 0x46]
	umulcc	%l2,	%i4,	%l1
	flush	%l7 + 0x34
	ldx	[%l7 + 0x20],	%g7
	fpadd32s	%f21,	%f31,	%f31
	fmovd	%f30,	%f4
	stw	%g2,	[%l7 + 0x34]
	movrlz	%i2,	0x0E7,	%o2
	movvc	%xcc,	%i1,	%g5
	srlx	%l0,	0x18,	%g6
	brlz	%i7,	loop_1844
	fcmple16	%f12,	%f18,	%l6
	nop
	setx	0x3DCB9CEE15985590,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x8ADC555A65E1D966,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f0,	%f24
	orncc	%o1,	0x0781,	%o3
loop_1844:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i6,	%o5
	addc	%i5,	%i0,	%o0
	edge16l	%o6,	%g4,	%g1
	ldsh	[%l7 + 0x44],	%l5
	popc	%l3,	%l4
	set	0x10, %o2
	ldswa	[%l7 + %o2] 0x15,	%o7
	swap	[%l7 + 0x64],	%o4
	tcc	%xcc,	0x5
	fnors	%f0,	%f1,	%f16
	fble	%fcc0,	loop_1845
	tneg	%icc,	0x4
	set	0x17, %o6
	ldsba	[%l7 + %o6] 0x81,	%g3
loop_1845:
	sdiv	%l2,	0x1BC4,	%i3
	te	%icc,	0x7
	movvc	%icc,	%l1,	%g7
	umulcc	%g2,	%i2,	%i4
	tsubcc	%i1,	0x0F47,	%g5
	tneg	%icc,	0x3
	andcc	%l0,	0x0869,	%o2
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x4C] %asi,	%f23
	fpsub16s	%f7,	%f20,	%f17
	be,a,pn	%xcc,	loop_1846
	udivx	%i7,	0x190D,	%l6
	sllx	%o1,	%g6,	%o3
	set	0x60, %l2
	ldsha	[%l7 + %l2] 0x81,	%i6
loop_1846:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o5
	std	%f22,	[%l7 + 0x18]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x5
	call	loop_1847
	bneg	loop_1848
	xor	%i0,	0x097E,	%i5
	fxor	%f8,	%f14,	%f10
loop_1847:
	fbul	%fcc1,	loop_1849
loop_1848:
	tneg	%xcc,	0x5
	pdist	%f8,	%f6,	%f2
	umul	%o6,	%o0,	%g4
loop_1849:
	sth	%l5,	[%l7 + 0x44]
	umul	%g1,	%l3,	%l4
	movpos	%icc,	%o4,	%o7
	sub	%g3,	%l2,	%i3
	movre	%l1,	0x2AC,	%g7
	orncc	%g2,	0x09CE,	%i4
	sdivx	%i1,	0x0E34,	%g5
	tvs	%icc,	0x7
	movrne	%i2,	0x0A2,	%l0
	movpos	%icc,	%i7,	%o2
	tg	%icc,	0x3
	brgz	%o1,	loop_1850
	udiv	%g6,	0x032A,	%l6
	fmovdge	%icc,	%f1,	%f4
	fcmpeq16	%f0,	%f8,	%o3
loop_1850:
	array32	%o5,	%i6,	%i5
	fcmpeq16	%f18,	%f30,	%i0
	movl	%xcc,	%o0,	%o6
	mulx	%g4,	0x1E08,	%g1
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x4A] %asi,	%l3
	nop
	setx	loop_1851,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%icc,	%l4,	%l5
	nop
	setx	0xE37907A845E1CBFC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f26
	andcc	%o7,	0x0077,	%g3
loop_1851:
	prefetch	[%l7 + 0x60],	 0x3
	mova	%xcc,	%o4,	%i3
	bne,a,pt	%xcc,	loop_1852
	bg	%xcc,	loop_1853
	brgez	%l1,	loop_1854
	taddcctv	%g7,	0x1736,	%g2
loop_1852:
	taddcctv	%i4,	%i1,	%g5
loop_1853:
	nop
	setx	0x67995552,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f5
loop_1854:
	fmovsg	%xcc,	%f25,	%f28
	edge32	%i2,	%l2,	%i7
	sdiv	%l0,	0x107D,	%o2
	edge8	%o1,	%l6,	%o3
	fbl,a	%fcc1,	loop_1855
	or	%o5,	0x0F8A,	%i6
	set	0x1A, %i5
	ldsba	[%l7 + %i5] 0x11,	%i5
loop_1855:
	nop
	set	0x29, %l5
	stba	%i0,	[%l7 + %l5] 0xe3
	membar	#Sync
	te	%xcc,	0x6
	tvs	%xcc,	0x0
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x81
	edge16	%g6,	%o0,	%o6
	orncc	%g4,	0x0468,	%l3
	andncc	%l4,	%g1,	%o7
	tg	%icc,	0x4
	edge16	%g3,	%o4,	%l5
	movrne	%i3,	%g7,	%g2
	tvs	%xcc,	0x2
	movn	%xcc,	%l1,	%i4
	fbl	%fcc2,	loop_1856
	xorcc	%g5,	%i1,	%l2
	xnorcc	%i2,	%l0,	%o2
	orcc	%o1,	%i7,	%l6
loop_1856:
	fones	%f31
	ldsh	[%l7 + 0x1A],	%o3
	tcc	%icc,	0x2
	nop
	setx	0x99A43E8C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f21
	faligndata	%f20,	%f2,	%f28
	xor	%i6,	%i5,	%o5
	movleu	%xcc,	%i0,	%g6
	tneg	%xcc,	0x1
	prefetch	[%l7 + 0x7C],	 0x3
	ldsh	[%l7 + 0x6E],	%o0
	for	%f4,	%f6,	%f10
	bgu	%icc,	loop_1857
	xnor	%o6,	0x0E33,	%g4
	edge32l	%l3,	%l4,	%g1
	subcc	%o7,	0x0D6B,	%o4
loop_1857:
	prefetch	[%l7 + 0x34],	 0x3
	fmovdle	%icc,	%f21,	%f26
	fbn,a	%fcc1,	loop_1858
	movne	%icc,	%l5,	%g3
	add	%g7,	%g2,	%l1
	set	0x6C, %g2
	lduwa	[%l7 + %g2] 0x89,	%i4
loop_1858:
	tleu	%icc,	0x4
	movcs	%icc,	%g5,	%i3
	ldstub	[%l7 + 0x48],	%l2
	mulx	%i1,	%i2,	%o2
	umul	%l0,	%o1,	%l6
	smulcc	%i7,	%i6,	%o3
	udivx	%o5,	0x1EB8,	%i0
	subccc	%g6,	%o0,	%i5
	fpmerge	%f13,	%f2,	%f4
	brlz	%o6,	loop_1859
	movrgez	%l3,	%l4,	%g1
	subcc	%o7,	%o4,	%l5
	ldd	[%l7 + 0x70],	%f18
loop_1859:
	addccc	%g3,	%g4,	%g7
	nop
	setx loop_1860, %l0, %l1
	jmpl %l1, %g2
	movrgez	%i4,	%g5,	%l1
	umulcc	%i3,	0x075D,	%i1
	sra	%l2,	0x12,	%o2
loop_1860:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%l0,	0x13ED,	%i2
	xnorcc	%l6,	0x0720,	%o1
	swap	[%l7 + 0x48],	%i6
	swap	[%l7 + 0x40],	%i7
	fxnors	%f27,	%f18,	%f23
	movle	%icc,	%o5,	%i0
	movg	%xcc,	%g6,	%o3
	tvs	%icc,	0x6
	array32	%i5,	%o0,	%l3
	sll	%o6,	%l4,	%g1
	fbge	%fcc0,	loop_1861
	brlz,a	%o4,	loop_1862
	tcc	%icc,	0x2
	ldstub	[%l7 + 0x52],	%o7
loop_1861:
	mova	%icc,	%g3,	%g4
loop_1862:
	fzeros	%f22
	bge,pn	%xcc,	loop_1863
	subcc	%g7,	%g2,	%i4
	fmovrsgez	%l5,	%f7,	%f29
	move	%icc,	%g5,	%l1
loop_1863:
	movne	%icc,	%i3,	%l2
	andn	%i1,	%o2,	%i2
	smul	%l6,	%o1,	%i6
	fmovsne	%xcc,	%f3,	%f28
	fnands	%f16,	%f11,	%f11
	movrgz	%i7,	0x152,	%o5
	fcmple32	%f26,	%f20,	%i0
	sra	%g6,	%l0,	%o3
	nop
	setx	0x8AAC4583,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x39B822A5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f6,	%f6
	smul	%i5,	%l3,	%o0
	edge16l	%l4,	%o6,	%o4
	array8	%g1,	%o7,	%g3
	sdivx	%g4,	0x13D8,	%g7
	movle	%xcc,	%i4,	%l5
	ldx	[%l7 + 0x58],	%g2
	tvc	%xcc,	0x2
	edge8n	%l1,	%g5,	%i3
	mulx	%i1,	0x0E5B,	%o2
	orcc	%i2,	0x0F97,	%l6
	mova	%icc,	%o1,	%l2
	tgu	%xcc,	0x5
	sll	%i6,	0x04,	%i7
	or	%o5,	%g6,	%i0
	bvs	loop_1864
	ldsw	[%l7 + 0x48],	%l0
	bvc,pt	%icc,	loop_1865
	srax	%i5,	0x0D,	%o3
loop_1864:
	orn	%l3,	0x0B72,	%l4
	fmovrsne	%o0,	%f31,	%f4
loop_1865:
	fmovrsgez	%o4,	%f25,	%f25
	bge,pn	%xcc,	loop_1866
	fmuld8ulx16	%f7,	%f26,	%f28
	subcc	%g1,	%o6,	%o7
	andn	%g4,	0x1F0E,	%g7
loop_1866:
	ldx	[%l7 + 0x20],	%i4
	sub	%l5,	%g3,	%g2
	fmovs	%f9,	%f16
	fmovdne	%icc,	%f29,	%f1
	smul	%l1,	0x033B,	%i3
	ldsh	[%l7 + 0x44],	%g5
	fbge,a	%fcc2,	loop_1867
	mova	%icc,	%o2,	%i1
	subc	%l6,	%i2,	%l2
	edge16n	%o1,	%i6,	%i7
loop_1867:
	movcs	%xcc,	%o5,	%g6
	or	%i0,	%i5,	%l0
	bneg,pn	%icc,	loop_1868
	bvc	loop_1869
	movleu	%icc,	%l3,	%o3
	ta	%icc,	0x3
loop_1868:
	movleu	%xcc,	%o0,	%l4
loop_1869:
	movre	%o4,	0x275,	%g1
	sdiv	%o6,	0x136A,	%g4
	orn	%g7,	%o7,	%l5
	movvs	%xcc,	%i4,	%g3
	bn,a	%icc,	loop_1870
	st	%f11,	[%l7 + 0x44]
	edge32	%l1,	%g2,	%i3
	or	%o2,	0x1885,	%g5
loop_1870:
	fmovscs	%icc,	%f10,	%f7
	fbuge	%fcc1,	loop_1871
	and	%l6,	0x1563,	%i1
	fmovrsgz	%i2,	%f30,	%f16
	sub	%o1,	%i6,	%l2
loop_1871:
	ldd	[%l7 + 0x38],	%f10
	smulcc	%i7,	%o5,	%i0
	subccc	%g6,	%i5,	%l0
	movrlez	%o3,	%l3,	%l4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x52] %asi,	%o0
	tn	%xcc,	0x0
	mova	%icc,	%o4,	%g1
	bn	%xcc,	loop_1872
	nop
	setx	loop_1873,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrslez	%g4,	%f1,	%f9
	bn,a	%icc,	loop_1874
loop_1872:
	movrlez	%g7,	0x080,	%o7
loop_1873:
	movre	%o6,	%i4,	%l5
	xnor	%g3,	0x0A0D,	%l1
loop_1874:
	fsrc1s	%f11,	%f3
	te	%icc,	0x3
	movge	%xcc,	%i3,	%g2
	movl	%xcc,	%g5,	%o2
	set	0x40, %i6
	lduwa	[%l7 + %i6] 0x15,	%l6
	orcc	%i2,	%o1,	%i6
	nop
	setx loop_1875, %l0, %l1
	jmpl %l1, %l2
	fxors	%f31,	%f17,	%f1
	set	0x48, %l0
	lduwa	[%l7 + %l0] 0x88,	%i1
loop_1875:
	smulcc	%o5,	%i0,	%i7
	array32	%g6,	%l0,	%i5
	nop
	setx loop_1876, %l0, %l1
	jmpl %l1, %o3
	fornot1s	%f20,	%f31,	%f30
	fxor	%f22,	%f30,	%f2
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf8,	%f16
loop_1876:
	addccc	%l3,	0x042D,	%o0
	srax	%o4,	0x09,	%g1
	orcc	%g4,	0x1C1A,	%l4
	set	0x4A, %o7
	stba	%o7,	[%l7 + %o7] 0x81
	fbl,a	%fcc0,	loop_1877
	ta	%icc,	0x2
	sethi	0x0414,	%g7
	movvs	%icc,	%i4,	%o6
loop_1877:
	call	loop_1878
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%g3,	%l1
	movne	%xcc,	%l5,	%g2
loop_1878:
	fcmple32	%f8,	%f24,	%g5
	fxnors	%f24,	%f28,	%f4
	movleu	%icc,	%o2,	%i3
	fabss	%f25,	%f31
	movrgz	%l6,	%i2,	%i6
	movcc	%xcc,	%o1,	%l2
	movvs	%xcc,	%i1,	%o5
	ldd	[%l7 + 0x10],	%f6
	tsubcc	%i0,	%g6,	%i7
	brgez,a	%i5,	loop_1879
	movrgez	%o3,	%l3,	%o0
	fbge	%fcc1,	loop_1880
	movgu	%icc,	%l0,	%g1
loop_1879:
	fxnor	%f28,	%f22,	%f30
	sdiv	%o4,	0x1230,	%g4
loop_1880:
	tvs	%xcc,	0x7
	edge8n	%l4,	%o7,	%g7
	udiv	%i4,	0x1C96,	%g3
	fpack32	%f0,	%f26,	%f28
	movrlez	%o6,	0x1FB,	%l1
	orncc	%l5,	0x0BA6,	%g2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x76] %asi,	%g5
	udiv	%o2,	0x154D,	%i3
	bcc,pt	%icc,	loop_1881
	nop
	setx	0x68C688380078E772,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	pdist	%f18,	%f8,	%f26
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%i6
loop_1881:
	edge8n	%i2,	%l2,	%i1
	popc	%o1,	%i0
	stbar
	movl	%xcc,	%o5,	%g6
	fors	%f2,	%f6,	%f11
	brlz	%i7,	loop_1882
	movvs	%icc,	%i5,	%l3
	orncc	%o0,	%o3,	%l0
	movrgez	%g1,	0x21E,	%o4
loop_1882:
	ba,pn	%icc,	loop_1883
	udivcc	%g4,	0x1E33,	%o7
	tpos	%icc,	0x0
	ldsw	[%l7 + 0x68],	%g7
loop_1883:
	tpos	%xcc,	0x5
	array16	%l4,	%g3,	%o6
	movge	%icc,	%i4,	%l1
	orcc	%g2,	0x1700,	%g5
	popc	%o2,	%l5
	movcc	%xcc,	%l6,	%i6
	taddcctv	%i3,	%i2,	%i1
	fmovrse	%l2,	%f2,	%f31
	edge16	%o1,	%o5,	%g6
	fmovsne	%xcc,	%f23,	%f8
	fandnot2	%f22,	%f2,	%f4
	movrgez	%i0,	0x299,	%i7
	alignaddrl	%i5,	%o0,	%l3
	popc	%l0,	%g1
	nop
	setx	0xB060CB31,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	fbe,a	%fcc0,	loop_1884
	tsubcctv	%o3,	%g4,	%o4
	movleu	%icc,	%g7,	%o7
	udivx	%l4,	0x17A8,	%o6
loop_1884:
	movle	%icc,	%g3,	%i4
	fabss	%f8,	%f12
	umul	%l1,	0x0FAE,	%g5
	fcmpne32	%f14,	%f6,	%o2
	fbn	%fcc1,	loop_1885
	nop
	setx	0x5CB82EAE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xFD924EEB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f1,	%f31
	andn	%l5,	0x1B5F,	%g2
	fmovdne	%xcc,	%f16,	%f29
loop_1885:
	movcc	%icc,	%i6,	%l6
	orncc	%i3,	%i2,	%l2
	srax	%i1,	%o5,	%o1
	taddcctv	%g6,	0x05FA,	%i7
	ba,pt	%xcc,	loop_1886
	subccc	%i5,	0x03A8,	%i0
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%l3
loop_1886:
	edge16	%o0,	%g1,	%l0
	sdivcc	%o3,	0x18D8,	%o4
	alignaddr	%g7,	%g4,	%l4
	flush	%l7 + 0x7C
	edge8	%o7,	%g3,	%o6
	sethi	0x145D,	%l1
	edge8l	%i4,	%g5,	%o2
	tneg	%xcc,	0x1
	tcc	%xcc,	0x6
	fbuge,a	%fcc2,	loop_1887
	fmovdcc	%xcc,	%f6,	%f17
	subc	%l5,	0x1D9F,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1887:
	mulscc	%l6,	%g2,	%i2
	bneg	loop_1888
	sdiv	%l2,	0x0BFE,	%i3
	fone	%f2
	andcc	%o5,	0x0AA0,	%o1
loop_1888:
	srl	%g6,	0x0D,	%i1
	mulscc	%i7,	0x170F,	%i5
	sra	%i0,	0x13,	%l3
	sth	%g1,	[%l7 + 0x32]
	sethi	0x0E05,	%l0
	nop
	set	0x20, %i4
	stx	%o0,	[%l7 + %i4]
	ble,a,pn	%xcc,	loop_1889
	tpos	%icc,	0x6
	ba,a	%icc,	loop_1890
	alignaddr	%o3,	%g7,	%o4
loop_1889:
	tn	%icc,	0x4
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x2a,	%l4
loop_1890:
	movg	%xcc,	%o7,	%g4
	nop
	setx	0xCAA57E8C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xCE299A7B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f16,	%f28
	orn	%g3,	0x0D8A,	%o6
	edge32n	%i4,	%g5,	%l1
	nop
	setx	0x5E27D779F24D1200,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x624BEE3B060D4214,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f20,	%f10
	tl	%xcc,	0x0
	sll	%l5,	0x15,	%o2
	edge32l	%l6,	%g2,	%i6
	set	0x1C, %g6
	ldswa	[%l7 + %g6] 0x81,	%i2
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f18
	fxtod	%f18,	%f10
	set	0x54, %i0
	lduwa	[%l7 + %i0] 0x10,	%i3
	sdivcc	%l2,	0x055E,	%o1
	fmovrdgz	%o5,	%f18,	%f20
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x81,	%i1,	%i7
	tgu	%icc,	0x2
	pdist	%f4,	%f18,	%f12
	fnot1	%f16,	%f18
	fxor	%f14,	%f24,	%f18
	movre	%i5,	0x1EC,	%i0
	movgu	%xcc,	%l3,	%g6
	edge16l	%g1,	%o0,	%l0
	tpos	%icc,	0x3
	fmovdvc	%xcc,	%f8,	%f10
	tsubcc	%o3,	%g7,	%o4
	sra	%o7,	0x1A,	%l4
	tg	%xcc,	0x3
	orncc	%g4,	0x0EB4,	%g3
	udiv	%o6,	0x0698,	%g5
	alignaddrl	%i4,	%l5,	%l1
	fmovda	%icc,	%f26,	%f23
	movrgz	%l6,	%g2,	%i6
	tcs	%xcc,	0x4
	fcmpne32	%f20,	%f26,	%i2
	fbl,a	%fcc3,	loop_1891
	fcmpgt32	%f30,	%f16,	%i3
	fmovdge	%xcc,	%f28,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1891:
	xnorcc	%o2,	%o1,	%o5
	fnot1	%f24,	%f14
	wr	%g0,	0x19,	%asi
	sta	%f10,	[%l7 + 0x5C] %asi
	fbo	%fcc1,	loop_1892
	udivx	%i1,	0x0337,	%i7
	movpos	%icc,	%i5,	%l2
	popc	0x07B1,	%l3
loop_1892:
	movcs	%icc,	%g6,	%g1
	edge32n	%o0,	%i0,	%l0
	movrgez	%g7,	0x330,	%o4
	bvc	loop_1893
	fmul8x16al	%f16,	%f18,	%f4
	fmovde	%icc,	%f15,	%f31
	fzero	%f28
loop_1893:
	fpsub16s	%f19,	%f15,	%f4
	alignaddrl	%o3,	%l4,	%o7
	brnz,a	%g4,	loop_1894
	fabss	%f1,	%f4
	edge32	%o6,	%g3,	%i4
	subcc	%g5,	0x16B1,	%l5
loop_1894:
	bcc,a,pt	%xcc,	loop_1895
	bcc,a,pn	%icc,	loop_1896
	bge,a,pt	%icc,	loop_1897
	lduw	[%l7 + 0x78],	%l1
loop_1895:
	fpsub16s	%f0,	%f0,	%f8
loop_1896:
	tg	%xcc,	0x0
loop_1897:
	fsrc1s	%f11,	%f16
	edge32	%g2,	%l6,	%i2
	fmovsvs	%icc,	%f6,	%f20
	mova	%xcc,	%i3,	%i6
	fpsub32s	%f24,	%f5,	%f7
	fmovrsne	%o2,	%f27,	%f13
	fsrc2s	%f8,	%f12
	ta	%xcc,	0x2
	movn	%icc,	%o1,	%i1
	movvs	%icc,	%i7,	%i5
	fexpand	%f25,	%f24
	edge16	%l2,	%o5,	%g6
	fbne,a	%fcc0,	loop_1898
	nop
	setx loop_1899, %l0, %l1
	jmpl %l1, %l3
	fmovse	%icc,	%f20,	%f19
	swap	[%l7 + 0x08],	%g1
loop_1898:
	fandnot1s	%f18,	%f19,	%f21
loop_1899:
	andn	%i0,	0x0190,	%l0
	stw	%o0,	[%l7 + 0x20]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f31,	%f23
	sir	0x056D
	orcc	%g7,	%o4,	%l4
	mulscc	%o3,	0x15FA,	%g4
	movg	%icc,	%o7,	%o6
	bpos,a,pn	%icc,	loop_1900
	array16	%i4,	%g3,	%l5
	movle	%icc,	%g5,	%g2
	fmovd	%f14,	%f24
loop_1900:
	fand	%f12,	%f8,	%f22
	array32	%l1,	%i2,	%l6
	set	0x74, %o0
	stwa	%i6,	[%l7 + %o0] 0x2b
	membar	#Sync
	fmuld8ulx16	%f7,	%f22,	%f2
	nop
	setx	0xCE137573,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f2
	nop
	setx	0xC098E6252F4B90EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x74EDDF54EC3304E1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f8,	%f12
	subc	%o2,	0x0CAA,	%o1
	fbge,a	%fcc2,	loop_1901
	udiv	%i3,	0x1136,	%i7
	lduw	[%l7 + 0x44],	%i5
	sethi	0x0677,	%i1
loop_1901:
	subccc	%o5,	0x0FBD,	%l2
	xnorcc	%g6,	0x0D9C,	%g1
	orn	%i0,	%l0,	%o0
	array8	%l3,	%o4,	%g7
	movgu	%icc,	%l4,	%g4
	fpsub16s	%f23,	%f1,	%f22
	brlz,a	%o3,	loop_1902
	mulscc	%o6,	0x03A7,	%o7
	add	%g3,	0x0AB4,	%l5
	movle	%xcc,	%g5,	%i4
loop_1902:
	fmovdleu	%icc,	%f15,	%f22
	array32	%g2,	%l1,	%l6
	udivcc	%i6,	0x0E1B,	%o2
	smulcc	%i2,	%i3,	%o1
	movneg	%icc,	%i7,	%i5
	brgz,a	%i1,	loop_1903
	fmovsleu	%icc,	%f18,	%f31
	edge32l	%l2,	%o5,	%g1
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x50] %asi,	%g6
loop_1903:
	udiv	%l0,	0x1062,	%o0
	movrgz	%l3,	0x1B4,	%o4
	sdivcc	%g7,	0x0ADC,	%i0
	nop
	setx	0xEF374580,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f14
	swap	[%l7 + 0x74],	%g4
	mulscc	%l4,	0x1DA5,	%o3
	smul	%o6,	%g3,	%o7
	tpos	%icc,	0x4
	fmovde	%xcc,	%f6,	%f21
	mulx	%l5,	%g5,	%i4
	mulx	%g2,	0x1C66,	%l6
	fpack32	%f30,	%f8,	%f12
	edge32l	%l1,	%o2,	%i6
	bgu,a,pn	%xcc,	loop_1904
	fmovsl	%xcc,	%f12,	%f1
	nop
	setx	0xECD87B0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xA8C5118E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f25,	%f11
	alignaddr	%i3,	%o1,	%i7
loop_1904:
	movne	%icc,	%i2,	%i5
	fsrc2s	%f25,	%f14
	xorcc	%l2,	0x004B,	%o5
	edge32l	%g1,	%i1,	%l0
	bcc,pt	%xcc,	loop_1905
	sll	%o0,	0x15,	%g6
	udivcc	%l3,	0x16CE,	%o4
	movcs	%xcc,	%i0,	%g4
loop_1905:
	fmovsge	%xcc,	%f21,	%f30
	std	%f14,	[%l7 + 0x18]
	bl,a,pt	%icc,	loop_1906
	fmovsgu	%xcc,	%f12,	%f25
	movrlz	%g7,	%o3,	%o6
	array16	%g3,	%l4,	%l5
loop_1906:
	fpsub16	%f0,	%f14,	%f22
	ld	[%l7 + 0x38],	%f26
	fba,a	%fcc2,	loop_1907
	srlx	%o7,	%g5,	%i4
	sllx	%g2,	0x02,	%l1
	tleu	%xcc,	0x2
loop_1907:
	tl	%xcc,	0x7
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x2C] %asi,	%o2
	stb	%i6,	[%l7 + 0x0F]
	fmovdgu	%xcc,	%f30,	%f8
	fpmerge	%f5,	%f1,	%f0
	fbge,a	%fcc0,	loop_1908
	fmul8x16au	%f15,	%f1,	%f20
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i3,	%l6
loop_1908:
	fnor	%f6,	%f24,	%f16
	nop
	fitos	%f13,	%f9
	fstod	%f9,	%f10
	fmovda	%xcc,	%f26,	%f0
	fcmple16	%f16,	%f24,	%i7
	fandnot1	%f26,	%f10,	%f16
	xorcc	%o1,	0x1379,	%i2
	xnorcc	%i5,	%l2,	%g1
	edge8ln	%i1,	%o5,	%l0
	tvs	%icc,	0x3
	fmovsge	%xcc,	%f24,	%f6
	fands	%f21,	%f2,	%f24
	set	0x60, %i2
	ldda	[%l7 + %i2] 0xe2,	%o0
	brlz,a	%l3,	loop_1909
	xor	%o4,	0x07A4,	%g6
	andcc	%g4,	%g7,	%o3
	nop
	setx	0x52AB43D615EFCA97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x34D69525F3057AA5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f28,	%f0
loop_1909:
	move	%xcc,	%i0,	%g3
	bge,a,pn	%xcc,	loop_1910
	sra	%o6,	0x03,	%l5
	nop
	setx	0x70743AB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	std	%f30,	[%l7 + 0x38]
loop_1910:
	nop
	setx	loop_1911,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%o7,	%l4
	tn	%icc,	0x7
	srl	%i4,	0x1B,	%g2
loop_1911:
	movcc	%icc,	%g5,	%o2
	ldstub	[%l7 + 0x1E],	%i6
	bn	loop_1912
	stw	%i3,	[%l7 + 0x38]
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f28
	fxtod	%f28,	%f14
	xnorcc	%l6,	0x0363,	%l1
loop_1912:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x7C] %asi,	%i7
	fmovdleu	%xcc,	%f26,	%f1
	fbue	%fcc2,	loop_1913
	edge8n	%i2,	%o1,	%l2
	sub	%g1,	0x1A05,	%i5
	bvc	loop_1914
loop_1913:
	movne	%xcc,	%i1,	%o5
	edge32	%l0,	%o0,	%l3
	brlez,a	%o4,	loop_1915
loop_1914:
	fmuld8ulx16	%f21,	%f21,	%f6
	set	0x18, %g3
	sta	%f3,	[%l7 + %g3] 0x15
loop_1915:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f20,	[%l7 + 0x44] %asi
	fmovse	%xcc,	%f24,	%f31
	nop
	fitod	%f0,	%f2
	fdtos	%f2,	%f0
	fbg	%fcc2,	loop_1916
	brnz,a	%g6,	loop_1917
	fmovsl	%xcc,	%f31,	%f8
	bshuffle	%f10,	%f2,	%f8
loop_1916:
	movneg	%icc,	%g4,	%o3
loop_1917:
	fmovdvs	%icc,	%f18,	%f3
	edge16ln	%g7,	%g3,	%i0
	ta	%icc,	0x5
	tcc	%xcc,	0x7
	movpos	%xcc,	%l5,	%o6
	fmuld8sux16	%f11,	%f5,	%f4
	fmovdne	%xcc,	%f24,	%f24
	tcs	%xcc,	0x4
	mulx	%l4,	%o7,	%i4
	edge8ln	%g5,	%o2,	%i6
	ld	[%l7 + 0x24],	%f1
	sethi	0x14E0,	%g2
	or	%l6,	0x1D1D,	%l1
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x12] %asi,	%i3
	addccc	%i7,	0x0C3B,	%o1
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x22,	%i2
	sdiv	%l2,	0x0AD1,	%g1
	movrlz	%i5,	%i1,	%l0
	andcc	%o5,	%l3,	%o4
	addccc	%o0,	%g6,	%g4
	tpos	%icc,	0x0
	fbug	%fcc2,	loop_1918
	fabsd	%f18,	%f16
	bl,a,pt	%icc,	loop_1919
	nop
	setx	loop_1920,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1918:
	movcs	%xcc,	%g7,	%o3
	fmovd	%f30,	%f30
loop_1919:
	movvs	%icc,	%i0,	%l5
loop_1920:
	edge32l	%o6,	%g3,	%o7
	bleu,a	%xcc,	loop_1921
	sethi	0x1A6A,	%l4
	fand	%f30,	%f20,	%f12
	nop
	setx	0x52F64E49CC99188A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x7CEEBF6EB198FACE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f14,	%f26
loop_1921:
	smulcc	%g5,	%o2,	%i4
	mova	%icc,	%i6,	%g2
	movl	%icc,	%l1,	%l6
	tle	%xcc,	0x5
	movrgez	%i3,	0x256,	%o1
	tcc	%icc,	0x1
	bg,pt	%xcc,	loop_1922
	lduw	[%l7 + 0x30],	%i7
	fxnors	%f2,	%f17,	%f17
	orcc	%l2,	%g1,	%i5
loop_1922:
	popc	%i1,	%l0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x68] %asi,	%f30
	ta	%xcc,	0x3
	tneg	%xcc,	0x4
	edge32l	%i2,	%o5,	%l3
	set	0x110, %g1
	ldxa	[%g0 + %g1] 0x21,	%o4
	fblg	%fcc2,	loop_1923
	fbe	%fcc1,	loop_1924
	nop
	setx	0x8D7C9711,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f30
	fmovs	%f7,	%f19
loop_1923:
	mulx	%o0,	0x1684,	%g6
loop_1924:
	orcc	%g7,	0x0019,	%o3
	fmovrdgez	%g4,	%f30,	%f16
	popc	0x1DD6,	%l5
	fnegs	%f22,	%f9
	ldub	[%l7 + 0x1E],	%i0
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	swap	[%l7 + 0x3C],	%g3
	add	%o7,	0x0F82,	%g5
	fbuge	%fcc2,	loop_1925
	fbuge	%fcc0,	loop_1926
	xnorcc	%o2,	0x1D0C,	%l4
	fabss	%f1,	%f21
loop_1925:
	brlez,a	%i4,	loop_1927
loop_1926:
	mova	%xcc,	%i6,	%l1
	fmovdneg	%icc,	%f29,	%f24
	nop
	fitod	%f18,	%f0
loop_1927:
	fmuld8sux16	%f16,	%f2,	%f24
	tvc	%xcc,	0x5
	edge32n	%l6,	%g2,	%o1
	fnands	%f1,	%f5,	%f8
	movrgz	%i7,	%l2,	%g1
	popc	0x00D4,	%i3
	fmovdl	%xcc,	%f16,	%f4
	movge	%xcc,	%i5,	%i1
	tsubcc	%i2,	0x0E93,	%o5
	fmovrdlez	%l0,	%f18,	%f28
	tg	%icc,	0x4
	tcs	%xcc,	0x6
	membar	0x6C
	fmovdn	%xcc,	%f7,	%f25
	fornot1s	%f29,	%f7,	%f25
	orn	%o4,	%l3,	%o0
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%g6
	tcc	%icc,	0x7
	movge	%icc,	%o3,	%g4
	bn,a	%xcc,	loop_1928
	edge32ln	%g7,	%i0,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g3,	%o7
loop_1928:
	brgz	%l5,	loop_1929
	ta	%icc,	0x6
	tsubcc	%o2,	%g5,	%l4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x60] %asi,	%i6
loop_1929:
	edge32	%i4,	%l1,	%l6
	popc	0x186B,	%g2
	xnor	%o1,	0x153E,	%l2
	nop
	setx	0xF67D585C9227A929,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x3DE6D4C74E860A0C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f20,	%f2
	brz,a	%i7,	loop_1930
	fabsd	%f30,	%f26
	orn	%g1,	0x05C9,	%i3
	bcs,a,pn	%xcc,	loop_1931
loop_1930:
	orcc	%i5,	0x0613,	%i2
	subccc	%o5,	%i1,	%l0
	tleu	%xcc,	0x3
loop_1931:
	fbne	%fcc0,	loop_1932
	nop
	setx	loop_1933,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvc,pt	%icc,	loop_1934
	movre	%l3,	%o0,	%g6
loop_1932:
	sllx	%o3,	0x14,	%g4
loop_1933:
	tle	%xcc,	0x3
loop_1934:
	sdiv	%o4,	0x1FFF,	%g7
	stb	%i0,	[%l7 + 0x5E]
	edge8n	%o6,	%g3,	%o7
	movl	%xcc,	%l5,	%g5
	movneg	%xcc,	%o2,	%l4
	xorcc	%i6,	0x0A2B,	%i4
	bn,a	%icc,	loop_1935
	sdivx	%l1,	0x0037,	%g2
	array16	%l6,	%l2,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1935:
	tcc	%icc,	0x3
	mova	%xcc,	%i7,	%g1
	set	0x46, %i7
	lduba	[%l7 + %i7] 0x0c,	%i5
	fmovrdgz	%i3,	%f18,	%f10
	edge32l	%o5,	%i1,	%i2
	andncc	%l3,	%l0,	%g6
	fornot1	%f24,	%f16,	%f6
	fmul8sux16	%f6,	%f0,	%f30
	fcmpgt16	%f12,	%f24,	%o3
	addc	%g4,	0x19D5,	%o4
	fexpand	%f18,	%f14
	bn,pt	%xcc,	loop_1936
	edge8n	%g7,	%o0,	%i0
	nop
	setx	0x336B2136,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x55BE29DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f12,	%f11
	tsubcc	%g3,	0x1C09,	%o7
loop_1936:
	edge32ln	%o6,	%g5,	%o2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x15
	fxors	%f27,	%f18,	%f3
	orcc	%l4,	0x17C5,	%l5
	and	%i4,	0x109C,	%l1
	bvc	%icc,	loop_1937
	ldsw	[%l7 + 0x60],	%i6
	tpos	%icc,	0x6
	fnands	%f29,	%f30,	%f11
loop_1937:
	bleu,a	loop_1938
	tn	%xcc,	0x2
	move	%icc,	%g2,	%l2
	movrne	%o1,	%l6,	%i7
loop_1938:
	movrlez	%g1,	%i3,	%o5
	umulcc	%i5,	%i2,	%i1
	ble	%xcc,	loop_1939
	fbe	%fcc1,	loop_1940
	sub	%l0,	%l3,	%o3
	taddcc	%g6,	0x0DA8,	%o4
loop_1939:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x44] %asi,	%g7
loop_1940:
	sll	%o0,	0x18,	%g4
	fmovsvc	%icc,	%f14,	%f3
	fmovsgu	%xcc,	%f15,	%f3
	movcc	%icc,	%i0,	%g3
	umul	%o6,	0x022E,	%g5
	umulcc	%o2,	%o7,	%l4
	fbe,a	%fcc2,	loop_1941
	lduh	[%l7 + 0x1E],	%i4
	tsubcctv	%l5,	%i6,	%g2
	alignaddrl	%l1,	%l2,	%o1
loop_1941:
	tge	%icc,	0x0
	wr	%g0,	0x27,	%asi
	stba	%l6,	[%l7 + 0x41] %asi
	membar	#Sync
	array16	%i7,	%g1,	%o5
	add	%i3,	%i2,	%i1
	srax	%l0,	0x01,	%i5
	fmovsg	%icc,	%f11,	%f27
	fbge,a	%fcc1,	loop_1942
	mulx	%l3,	%g6,	%o3
	andcc	%o4,	%g7,	%o0
	nop
	setx	loop_1943,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1942:
	tcs	%xcc,	0x1
	nop
	setx	0xDDF54E1C94A73507,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f18
	call	loop_1944
loop_1943:
	sllx	%i0,	%g3,	%o6
	fcmple16	%f30,	%f2,	%g4
	orcc	%g5,	0x0C4D,	%o2
loop_1944:
	fmovrdne	%o7,	%f14,	%f2
	movrgez	%l4,	0x15A,	%l5
	xnor	%i4,	%g2,	%l1
	orcc	%l2,	%o1,	%l6
	fzero	%f22
	fands	%f20,	%f22,	%f19
	set	0x50, %o5
	stxa	%i6,	[%l7 + %o5] 0xea
	membar	#Sync
	movneg	%xcc,	%i7,	%o5
	fbul	%fcc1,	loop_1945
	fbge	%fcc2,	loop_1946
	nop
	setx	0xEC5F8E5B6E8E3C3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x3279D2E2573969D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f0,	%f14
	fble	%fcc1,	loop_1947
loop_1945:
	fcmpne16	%f12,	%f24,	%i3
loop_1946:
	nop
	set	0x3C, %o3
	sta	%f29,	[%l7 + %o3] 0x88
loop_1947:
	nop
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x11,	%f0
	pdist	%f14,	%f22,	%f10
	fmovdcs	%xcc,	%f25,	%f11
	sethi	0x0223,	%i2
	st	%f3,	[%l7 + 0x54]
	nop
	setx	0xE0737A10,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	movrgz	%i1,	%g1,	%l0
	tcc	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l3,	0x1619,	%i5
	tn	%xcc,	0x6
	tleu	%icc,	0x2
	sdiv	%o3,	0x09C7,	%o4
	ta	%xcc,	0x5
	tle	%xcc,	0x4
	xor	%g6,	0x13DA,	%o0
	edge8l	%i0,	%g3,	%o6
	fmovdn	%xcc,	%f11,	%f25
	fones	%f2
	edge32ln	%g4,	%g7,	%o2
	fpsub16s	%f22,	%f3,	%f13
	subccc	%g5,	%o7,	%l4
	nop
	setx loop_1948, %l0, %l1
	jmpl %l1, %l5
	nop
	setx	loop_1949,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stw	%i4,	[%l7 + 0x6C]
	fxors	%f19,	%f5,	%f24
loop_1948:
	fpsub32s	%f13,	%f7,	%f4
loop_1949:
	edge8ln	%g2,	%l2,	%o1
	tpos	%xcc,	0x5
	fornot2s	%f7,	%f15,	%f20
	nop
	setx	0x52AE6931,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xFB4F76A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f8,	%f16
	movle	%xcc,	%l6,	%i6
	subccc	%l1,	0x0385,	%o5
	fornot2s	%f28,	%f6,	%f13
	tpos	%icc,	0x7
	fxors	%f14,	%f9,	%f6
	tvc	%icc,	0x5
	tle	%icc,	0x0
	tgu	%xcc,	0x5
	nop
	fitos	%f10,	%f13
	fstox	%f13,	%f22
	fxtos	%f22,	%f31
	edge8ln	%i7,	%i3,	%i1
	movle	%xcc,	%i2,	%l0
	sir	0x01B5
	sethi	0x182E,	%g1
	fbne,a	%fcc1,	loop_1950
	edge16ln	%l3,	%i5,	%o3
	movcc	%icc,	%g6,	%o4
	udiv	%o0,	0x09E1,	%g3
loop_1950:
	edge32ln	%i0,	%o6,	%g7
	set	0x4A, %g5
	ldsba	[%l7 + %g5] 0x80,	%o2
	fcmpne32	%f4,	%f6,	%g5
	fcmpeq32	%f28,	%f8,	%g4
	edge32l	%l4,	%o7,	%i4
	andncc	%g2,	%l5,	%o1
	xnor	%l6,	%i6,	%l1
	smulcc	%l2,	%i7,	%i3
	or	%o5,	%i1,	%i2
	fbl,a	%fcc1,	loop_1951
	stw	%g1,	[%l7 + 0x58]
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x20] %asi,	%l0
loop_1951:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l3,	0x0BF7,	%o3
	nop
	setx loop_1952, %l0, %l1
	jmpl %l1, %g6
	movg	%icc,	%o4,	%o0
	st	%f19,	[%l7 + 0x48]
	movpos	%icc,	%g3,	%i0
loop_1952:
	movpos	%icc,	%o6,	%g7
	brlz	%i5,	loop_1953
	alignaddrl	%g5,	%g4,	%l4
	movrlz	%o7,	%o2,	%g2
	fone	%f0
loop_1953:
	movvc	%icc,	%i4,	%o1
	subccc	%l6,	%l5,	%i6
	array8	%l1,	%i7,	%i3
	fbe,a	%fcc3,	loop_1954
	st	%f3,	[%l7 + 0x08]
	andncc	%l2,	%o5,	%i1
	srl	%g1,	%l0,	%i2
loop_1954:
	fmovspos	%icc,	%f13,	%f2
	tg	%icc,	0x2
	prefetch	[%l7 + 0x70],	 0x0
	for	%f12,	%f14,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x1
	fbge	%fcc2,	loop_1955
	sub	%l3,	0x0D3A,	%g6
	fnot2s	%f3,	%f8
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o4
loop_1955:
	stw	%o3,	[%l7 + 0x6C]
	tcs	%icc,	0x3
	array32	%g3,	%o0,	%o6
	nop
	setx	0xE20E2AE3DCE504D4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xE4E03A9254553E9A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f0,	%f4
	fands	%f16,	%f22,	%f19
	ba,a	%xcc,	loop_1956
	taddcctv	%i0,	0x05E8,	%i5
	tcc	%xcc,	0x7
	fornot2s	%f5,	%f15,	%f15
loop_1956:
	movcc	%xcc,	%g5,	%g4
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	umulcc	%g7,	0x1037,	%o7
	xorcc	%l4,	0x07E9,	%g2
	taddcc	%i4,	0x1086,	%o1
	nop
	setx	0xD9C1BC95A063DF5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	alignaddr	%o2,	%l6,	%l5
	array32	%l1,	%i6,	%i3
	fxnor	%f10,	%f18,	%f18
	lduw	[%l7 + 0x54],	%l2
	ldd	[%l7 + 0x78],	%i6
	fba	%fcc0,	loop_1957
	fmovsleu	%xcc,	%f3,	%f20
	xnor	%o5,	%i1,	%l0
	tn	%xcc,	0x6
loop_1957:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%l3
	fmovs	%f7,	%f7
	bgu,a,pt	%xcc,	loop_1958
	fxors	%f9,	%f0,	%f1
	tleu	%xcc,	0x6
	fone	%f26
loop_1958:
	addccc	%g6,	0x0461,	%o4
	tpos	%icc,	0x1
	edge32l	%o3,	%g1,	%g3
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x4C] %asi,	%f27
	orncc	%o0,	%i0,	%i5
	movn	%icc,	%g5,	%g4
	nop
	setx	0xF79B22AB80706217,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fmuld8sux16	%f3,	%f31,	%f4
	array8	%o6,	%o7,	%g7
	movvc	%xcc,	%g2,	%l4
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf1
	membar	#Sync
	udiv	%o1,	0x0B01,	%o2
	edge16n	%i4,	%l6,	%l1
	fbug	%fcc0,	loop_1959
	alignaddr	%l5,	%i3,	%l2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x0c,	%i7,	%i6
loop_1959:
	movrgez	%o5,	%i1,	%l0
	movpos	%icc,	%l3,	%g6
	subccc	%i2,	0x10D9,	%o3
	mulscc	%o4,	0x0428,	%g3
	lduw	[%l7 + 0x30],	%o0
	fbge,a	%fcc0,	loop_1960
	subcc	%g1,	%i0,	%i5
	edge32ln	%g5,	%o6,	%g4
	sra	%o7,	%g2,	%g7
loop_1960:
	edge32ln	%o1,	%l4,	%o2
	ldsb	[%l7 + 0x28],	%l6
	tle	%icc,	0x7
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	smulcc	%l1,	0x1A55,	%l5
	sdivx	%i3,	0x1B20,	%i4
	movrne	%i7,	0x22D,	%l2
	subcc	%o5,	0x150D,	%i6
	fnot1	%f14,	%f0
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l3,	%i1,	%g6
	srl	%i2,	%o3,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc2,	loop_1961
	mulx	%o4,	%o0,	%g1
	te	%xcc,	0x2
	te	%xcc,	0x0
loop_1961:
	orcc	%i5,	0x0B42,	%g5
	tcs	%icc,	0x2
	fnors	%f25,	%f12,	%f31
	fabss	%f31,	%f1
	brgz	%o6,	loop_1962
	std	%f18,	[%l7 + 0x28]
	sub	%i0,	0x0E29,	%o7
	popc	0x0787,	%g2
loop_1962:
	tsubcctv	%g7,	0x0450,	%o1
	movrgez	%l4,	%o2,	%g4
	fpadd16	%f10,	%f8,	%f16
	edge32l	%l1,	%l5,	%l6
	nop
	setx	loop_1963,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmple32	%f14,	%f24,	%i4
	add	%i7,	%i3,	%l2
	fmovsleu	%icc,	%f1,	%f9
loop_1963:
	fzero	%f10
	edge32l	%i6,	%l0,	%o5
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
	bpos,a,pt	%icc,	loop_1964
	movrne	%g6,	%i1,	%o3
	array16	%i2,	%o4,	%o0
	edge32l	%g3,	%g1,	%i5
loop_1964:
	nop
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf1,	%f16
	edge8n	%o6,	%i0,	%o7
	xorcc	%g5,	0x0D77,	%g7
	fbo	%fcc3,	loop_1965
	tsubcc	%g2,	%o1,	%l4
	movge	%xcc,	%o2,	%g4
	movre	%l1,	%l6,	%i4
loop_1965:
	fone	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x6
	edge8	%l5,	%i7,	%i3
	edge16	%l2,	%l0,	%i6
	edge8ln	%l3,	%g6,	%i1
	taddcctv	%o5,	%i2,	%o3
	nop
	fitos	%f2,	%f11
	fstoi	%f11,	%f15
	movrlz	%o4,	0x05B,	%o0
	fmovsgu	%xcc,	%f4,	%f1
	lduw	[%l7 + 0x58],	%g3
	stb	%i5,	[%l7 + 0x7F]
	movrne	%o6,	%g1,	%o7
	fmovdge	%icc,	%f20,	%f23
	tsubcc	%i0,	0x1F6B,	%g7
	edge16ln	%g2,	%g5,	%l4
	srl	%o2,	0x07,	%g4
	bne	loop_1966
	movcc	%icc,	%l1,	%l6
	edge16ln	%i4,	%o1,	%l5
	tpos	%icc,	0x6
loop_1966:
	tvs	%icc,	0x6
	umul	%i7,	%i3,	%l2
	edge8ln	%l0,	%i6,	%l3
	fxnors	%f29,	%f2,	%f19
	bneg,pt	%xcc,	loop_1967
	nop
	setx	0x965BFBF046B05F9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x46F521DBB44D7C8A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f20,	%f16
	srl	%i1,	%g6,	%i2
	bn	loop_1968
loop_1967:
	fornot1s	%f21,	%f29,	%f23
	fbul	%fcc0,	loop_1969
	movn	%xcc,	%o5,	%o3
loop_1968:
	fmovsg	%xcc,	%f23,	%f27
	nop
	setx	0x80799F2C,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
loop_1969:
	ldd	[%l7 + 0x58],	%f4
	fcmpeq16	%f20,	%f4,	%o4
	movrlz	%o0,	0x1BE,	%g3
	sub	%o6,	%i5,	%o7
	movre	%g1,	0x022,	%i0
	tge	%xcc,	0x0
	stbar
	fandnot2	%f22,	%f28,	%f26
	fone	%f20
	udivx	%g2,	0x1DC9,	%g7
	lduw	[%l7 + 0x10],	%l4
	xnor	%g5,	0x05DD,	%o2
	nop
	fitos	%f1,	%f17
	fstoi	%f17,	%f0
	xorcc	%l1,	0x01F9,	%l6
	fmovrdlz	%i4,	%f6,	%f18
	array16	%o1,	%g4,	%l5
	orncc	%i3,	%i7,	%l2
	membar	0x22
	fbo	%fcc3,	loop_1970
	andn	%i6,	0x00B5,	%l3
	srl	%l0,	0x1F,	%i1
	nop
	fitos	%f5,	%f3
	fstoi	%f3,	%f18
loop_1970:
	movneg	%icc,	%g6,	%o5
	fmovrsne	%i2,	%f21,	%f4
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x0E] %asi,	%o3
	movvs	%xcc,	%o4,	%o0
	fmovsn	%icc,	%f16,	%f13
	tvs	%xcc,	0x4
	or	%o6,	0x1CE5,	%g3
	ble,a,pn	%icc,	loop_1971
	call	loop_1972
	movgu	%xcc,	%i5,	%g1
	umulcc	%o7,	%i0,	%g7
loop_1971:
	movg	%icc,	%g2,	%l4
loop_1972:
	fnor	%f16,	%f18,	%f4
	tsubcc	%o2,	0x05A2,	%g5
	sdiv	%l6,	0x1296,	%l1
	edge16ln	%i4,	%g4,	%o1
	edge32	%l5,	%i3,	%i7
	edge16	%i6,	%l2,	%l0
	tne	%xcc,	0x2
	fnot1	%f30,	%f24
	fbule,a	%fcc2,	loop_1973
	add	%l3,	0x1514,	%i1
	mulscc	%o5,	%i2,	%o3
	lduh	[%l7 + 0x70],	%g6
loop_1973:
	movne	%icc,	%o0,	%o4
	brz,a	%o6,	loop_1974
	edge16l	%i5,	%g3,	%o7
	fpadd32	%f26,	%f24,	%f0
	nop
	fitos	%f28,	%f21
loop_1974:
	membar	0x2F
	fmovrsgez	%g1,	%f29,	%f21
	srax	%g7,	%i0,	%l4
	fmovdpos	%xcc,	%f23,	%f24
	sth	%g2,	[%l7 + 0x1E]
	subcc	%g5,	%l6,	%l1
	andncc	%o2,	%i4,	%g4
	fxors	%f25,	%f13,	%f23
	fpsub16	%f12,	%f16,	%f10
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x76] %asi,	%o1
	edge32	%i3,	%i7,	%l5
	ldsh	[%l7 + 0x4A],	%i6
	tneg	%icc,	0x0
	alignaddrl	%l0,	%l2,	%l3
	movneg	%icc,	%i1,	%i2
	udivcc	%o3,	0x0892,	%g6
	addc	%o0,	0x1794,	%o5
	fmul8x16	%f30,	%f14,	%f16
	srax	%o6,	0x03,	%i5
	edge32	%o4,	%o7,	%g1
	sethi	0x02CB,	%g7
	sir	0x1701
	mulscc	%g3,	%l4,	%i0
	edge16	%g2,	%l6,	%l1
	xnor	%g5,	%o2,	%i4
	fzeros	%f5
	ta	%icc,	0x2
	mova	%icc,	%o1,	%i3
	subccc	%i7,	%g4,	%l5
	movre	%i6,	0x3A5,	%l2
	tne	%icc,	0x5
	movrgez	%l3,	0x2CB,	%i1
	movge	%icc,	%i2,	%o3
	udivx	%l0,	0x137E,	%g6
	or	%o5,	0x0ABB,	%o0
	sll	%i5,	%o4,	%o6
	stw	%o7,	[%l7 + 0x48]
	tleu	%xcc,	0x7
	andcc	%g1,	%g7,	%l4
	edge16l	%g3,	%g2,	%l6
	andcc	%l1,	%i0,	%o2
	nop
	setx	0x90552F25,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	set	0x1A, %i1
	lduha	[%l7 + %i1] 0x11,	%i4
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x50] %asi,	%g4
	xnor	%i3,	0x07AA,	%i7
	smulcc	%g4,	%l5,	%o1
	movvs	%xcc,	%l2,	%l3
	tcs	%xcc,	0x2
	move	%icc,	%i1,	%i2
	fmovrdlez	%o3,	%f22,	%f12
	fbue	%fcc0,	loop_1975
	fmul8x16al	%f1,	%f25,	%f2
	tn	%xcc,	0x2
	fmovrde	%l0,	%f0,	%f2
loop_1975:
	tg	%xcc,	0x0
	fmovrsgz	%g6,	%f15,	%f20
	fmovrdne	%o5,	%f4,	%f8
	nop
	setx	0x3D232E71792E6A16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB15F9D9C043A4640,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f4,	%f12
	fmovs	%f17,	%f0
	fbuge	%fcc2,	loop_1976
	nop
	fitod	%f30,	%f0
	mova	%xcc,	%o0,	%i6
	movrgz	%o4,	0x345,	%i5
loop_1976:
	movg	%xcc,	%o6,	%o7
	edge16ln	%g7,	%l4,	%g3
	tne	%icc,	0x7
	fbe	%fcc3,	loop_1977
	movrlz	%g2,	0x3F8,	%l6
	fmovsgu	%xcc,	%f4,	%f23
	fpackfix	%f20,	%f17
loop_1977:
	fpack16	%f12,	%f19
	popc	0x0A3F,	%g1
	fmovda	%xcc,	%f6,	%f1
	sra	%i0,	%o2,	%i4
	bge,pt	%icc,	loop_1978
	brnz	%g5,	loop_1979
	fpackfix	%f24,	%f24
	fnot1	%f0,	%f14
loop_1978:
	bvc	loop_1980
loop_1979:
	xnorcc	%i3,	0x00D0,	%l1
	sir	0x0D6D
	orncc	%i7,	0x1688,	%l5
loop_1980:
	nop
	setx	0x0F4B925808652D50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x3E0D14F2956F5A01,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f28,	%f8
	nop
	setx loop_1981, %l0, %l1
	jmpl %l1, %g4
	umul	%l2,	0x05F7,	%o1
	subcc	%l3,	0x0586,	%i1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%o3,	%l0
loop_1981:
	stx	%g6,	[%l7 + 0x58]
	xor	%i2,	0x1D13,	%o5
	move	%icc,	%i6,	%o4
	edge32l	%i5,	%o6,	%o7
	srl	%g7,	%o0,	%l4
	or	%g2,	%l6,	%g3
	nop
	setx	0xEC9BFFF8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xDC8EC193,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f19,	%f11
	fbul,a	%fcc1,	loop_1982
	movrlz	%g1,	0x33D,	%o2
	orn	%i4,	0x048D,	%g5
	wr	%g0,	0x2b,	%asi
	stxa	%i3,	[%l7 + 0x30] %asi
	membar	#Sync
loop_1982:
	fblg,a	%fcc1,	loop_1983
	tcs	%icc,	0x2
	edge32	%i0,	%l1,	%l5
	fmovsle	%icc,	%f12,	%f1
loop_1983:
	addccc	%i7,	0x1994,	%g4
	tge	%xcc,	0x6
	fmovrdlz	%o1,	%f4,	%f22
	sub	%l3,	0x0274,	%l2
	fmovrsgz	%o3,	%f23,	%f30
	xnor	%l0,	%i1,	%i2
	tle	%xcc,	0x1
	umul	%o5,	0x1258,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g6,	0x1D06,	%o4
	edge16n	%o6,	%i5,	%o7
	ldx	[%l7 + 0x70],	%g7
	tcc	%xcc,	0x0
	movrlz	%o0,	%g2,	%l4
	smulcc	%l6,	%g3,	%o2
	fbul	%fcc2,	loop_1984
	tleu	%xcc,	0x6
	movleu	%xcc,	%i4,	%g5
	tneg	%icc,	0x3
loop_1984:
	call	loop_1985
	movneg	%xcc,	%g1,	%i0
	nop
	set	0x50, %o2
	stx	%i3,	[%l7 + %o2]
	tcc	%xcc,	0x6
loop_1985:
	movgu	%xcc,	%l1,	%i7
	movge	%icc,	%l5,	%o1
	umul	%g4,	0x07B3,	%l3
	call	loop_1986
	orcc	%l2,	0x17DA,	%o3
	fpack16	%f30,	%f31
	fcmple16	%f28,	%f18,	%l0
loop_1986:
	fblg	%fcc3,	loop_1987
	fand	%f30,	%f28,	%f16
	tsubcc	%i2,	%i1,	%o5
	movge	%icc,	%g6,	%i6
loop_1987:
	movre	%o6,	%o4,	%i5
	movcc	%icc,	%g7,	%o0
	tle	%icc,	0x5
	tl	%xcc,	0x1
	tcc	%icc,	0x2
	taddcctv	%o7,	%l4,	%g2
	tg	%xcc,	0x7
	add	%g3,	%o2,	%l6
	nop
	setx loop_1988, %l0, %l1
	jmpl %l1, %g5
	fnot1s	%f5,	%f21
	bgu,pn	%xcc,	loop_1989
	ldstub	[%l7 + 0x17],	%g1
loop_1988:
	lduw	[%l7 + 0x28],	%i4
	or	%i0,	0x0A89,	%l1
loop_1989:
	bneg,pt	%xcc,	loop_1990
	udivcc	%i7,	0x1086,	%l5
	edge16ln	%i3,	%g4,	%l3
	nop
	setx loop_1991, %l0, %l1
	jmpl %l1, %l2
loop_1990:
	ldd	[%l7 + 0x30],	%f12
	prefetch	[%l7 + 0x2C],	 0x1
	tl	%xcc,	0x4
loop_1991:
	sll	%o3,	%o1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc1,	loop_1992
	movg	%icc,	%i1,	%o5
	andcc	%g6,	%l0,	%i6
	bl	%xcc,	loop_1993
loop_1992:
	srlx	%o4,	%o6,	%g7
	brlez,a	%i5,	loop_1994
	movg	%icc,	%o7,	%o0
loop_1993:
	xor	%g2,	%g3,	%l4
	edge32	%o2,	%l6,	%g1
loop_1994:
	edge16n	%i4,	%i0,	%l1
	sdivx	%i7,	0x136A,	%l5
	movn	%xcc,	%g5,	%i3
	taddcctv	%g4,	0x1E4D,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l2,	%o1,	%o3
	fnors	%f14,	%f3,	%f23
	orcc	%i1,	0x18F3,	%o5
	sub	%i2,	0x0E78,	%l0
	bgu,a	%icc,	loop_1995
	smul	%i6,	%g6,	%o6
	popc	0x1091,	%o4
	fmovrsne	%g7,	%f27,	%f2
loop_1995:
	ldub	[%l7 + 0x59],	%i5
	sra	%o7,	%o0,	%g3
	fmovsa	%icc,	%f7,	%f2
	movleu	%icc,	%l4,	%o2
	brgz	%l6,	loop_1996
	nop
	fitos	%f13,	%f16
	movrgz	%g1,	0x26D,	%i4
	andncc	%g2,	%i0,	%l1
loop_1996:
	movrne	%i7,	0x18B,	%l5
	tsubcc	%i3,	0x1A30,	%g4
	sethi	0x1979,	%l3
	ldsb	[%l7 + 0x26],	%g5
	edge32	%o1,	%o3,	%i1
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x11,	 0x2
	fbne,a	%fcc1,	loop_1997
	addc	%o5,	0x0E6D,	%i2
	set	0x28, %l2
	prefetcha	[%l7 + %l2] 0x0c,	 0x3
loop_1997:
	array8	%l0,	%g6,	%o4
	bcc,a	loop_1998
	addccc	%g7,	%i5,	%o6
	fcmple16	%f24,	%f2,	%o0
	ta	%icc,	0x1
loop_1998:
	fmovrslz	%o7,	%f2,	%f15
	fbo	%fcc3,	loop_1999
	tl	%xcc,	0x1
	nop
	setx	0x773156772D1B7572,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x07CAFF157652E137,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f10,	%f12
	taddcc	%l4,	%o2,	%l6
loop_1999:
	tg	%xcc,	0x6
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f8
	movge	%icc,	%g1,	%i4
	taddcctv	%g2,	0x1C8A,	%g3
	addc	%l1,	0x190D,	%i7
	movrlz	%i0,	0x357,	%l5
	movrlez	%i3,	0x3AC,	%g4
	movrlz	%l3,	%g5,	%o1
	movle	%xcc,	%o3,	%i1
	fmovrsne	%l2,	%f6,	%f8
	fxors	%f18,	%f29,	%f9
	smul	%o5,	0x02F5,	%i6
	movg	%xcc,	%l0,	%g6
	movneg	%xcc,	%o4,	%i2
	mulx	%i5,	%g7,	%o6
	bne	loop_2000
	mulscc	%o7,	%o0,	%l4
	set	0x1C, %o6
	ldstuba	[%l7 + %o6] 0x89,	%l6
loop_2000:
	umulcc	%g1,	0x0A6B,	%o2
	wr	%g0,	0x80,	%asi
	sta	%f16,	[%l7 + 0x4C] %asi
	or	%i4,	0x1FE7,	%g3
	sdivcc	%g2,	0x1813,	%i7
	fmovsge	%icc,	%f1,	%f28
	fmovsg	%icc,	%f11,	%f8
	edge16n	%i0,	%l5,	%i3
	movre	%g4,	%l1,	%g5
	smulcc	%o1,	%o3,	%l3
	fmovscc	%icc,	%f8,	%f4
	nop
	setx loop_2001, %l0, %l1
	jmpl %l1, %i1
	andncc	%o5,	%i6,	%l0
	set	0x23, %l5
	ldstuba	[%l7 + %l5] 0x19,	%g6
loop_2001:
	bleu	loop_2002
	movrlez	%o4,	0x300,	%i2
	and	%l2,	0x1F1E,	%i5
	call	loop_2003
loop_2002:
	mulscc	%o6,	%o7,	%o0
	set	0x74, %o4
	ldswa	[%l7 + %o4] 0x14,	%g7
loop_2003:
	bne,a	%xcc,	loop_2004
	sir	0x078D
	te	%icc,	0x4
	fands	%f2,	%f22,	%f12
loop_2004:
	edge32	%l6,	%g1,	%o2
	srl	%i4,	%g3,	%l4
	movvc	%xcc,	%i7,	%i0
	tgu	%icc,	0x0
	fbge	%fcc2,	loop_2005
	array16	%l5,	%g2,	%i3
	fbug	%fcc2,	loop_2006
	nop
	fitos	%f6,	%f23
	fstox	%f23,	%f18
	fxtos	%f18,	%f5
loop_2005:
	fmul8x16	%f21,	%f14,	%f14
	sra	%l1,	0x03,	%g4
loop_2006:
	fmuld8ulx16	%f19,	%f31,	%f20
	ldsb	[%l7 + 0x64],	%g5
	nop
	fitod	%f10,	%f10
	fdtos	%f10,	%f30
	movcs	%icc,	%o3,	%o1
	fabsd	%f2,	%f18
	array8	%l3,	%i1,	%i6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%l0,	%g6
	sdivx	%o5,	0x091B,	%i2
	movre	%l2,	0x14D,	%o4
	fmovsgu	%icc,	%f0,	%f6
	ldsh	[%l7 + 0x22],	%i5
	brz	%o6,	loop_2007
	movrgez	%o0,	0x0EA,	%g7
	nop
	fitod	%f6,	%f4
	fdtoi	%f4,	%f20
	set	0x55, %i5
	lduba	[%l7 + %i5] 0x14,	%l6
loop_2007:
	tne	%xcc,	0x5
	nop
	set	0x5B, %g2
	stb	%o7,	[%l7 + %g2]
	movcs	%xcc,	%g1,	%i4
	movrlez	%g3,	0x299,	%l4
	fcmple16	%f6,	%f20,	%i7
	movle	%icc,	%i0,	%o2
	stw	%g2,	[%l7 + 0x74]
	movcc	%icc,	%i3,	%l5
	brgz	%l1,	loop_2008
	movvc	%xcc,	%g5,	%g4
	fmovdl	%xcc,	%f15,	%f14
	movrlz	%o3,	0x1D2,	%o1
loop_2008:
	movn	%icc,	%i1,	%i6
	sth	%l3,	[%l7 + 0x76]
	fmovdn	%xcc,	%f2,	%f12
	prefetch	[%l7 + 0x14],	 0x3
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x11,	%f16
	xorcc	%l0,	%g6,	%o5
	srax	%l2,	0x18,	%i2
	bvc,pt	%icc,	loop_2009
	bvs,a	%xcc,	loop_2010
	ld	[%l7 + 0x10],	%f4
	addc	%o4,	%i5,	%o0
loop_2009:
	bleu	loop_2011
loop_2010:
	add	%g7,	%l6,	%o6
	faligndata	%f28,	%f10,	%f6
	nop
	fitod	%f6,	%f14
	fdtoi	%f14,	%f22
loop_2011:
	tsubcctv	%o7,	0x02D0,	%g1
	fxnors	%f13,	%f16,	%f30
	prefetch	[%l7 + 0x40],	 0x2
	tgu	%icc,	0x6
	bl,pn	%icc,	loop_2012
	edge32ln	%i4,	%g3,	%l4
	fmovdne	%xcc,	%f12,	%f15
	te	%xcc,	0x2
loop_2012:
	edge16ln	%i0,	%i7,	%g2
	ldsh	[%l7 + 0x1A],	%o2
	movre	%l5,	0x3D2,	%l1
	bg,pn	%xcc,	loop_2013
	movle	%icc,	%g5,	%g4
	popc	%o3,	%o1
	movrlz	%i1,	0x232,	%i3
loop_2013:
	nop
	fitod	%f4,	%f26
	fdtox	%f26,	%f24
	wr	%g0,	0x89,	%asi
	stba	%i6,	[%l7 + 0x45] %asi
	taddcctv	%l3,	0x0521,	%l0
	and	%o5,	%g6,	%l2
	fblg	%fcc1,	loop_2014
	fbe,a	%fcc0,	loop_2015
	array16	%i2,	%o4,	%i5
	fblg	%fcc0,	loop_2016
loop_2014:
	movle	%icc,	%g7,	%o0
loop_2015:
	nop
	set	0x18, %i3
	ldxa	[%g0 + %i3] 0x58,	%l6
loop_2016:
	fmovsvs	%xcc,	%f6,	%f25
	taddcc	%o6,	%g1,	%i4
	sdivx	%g3,	0x110F,	%o7
	fbo	%fcc3,	loop_2017
	fandnot2	%f20,	%f22,	%f20
	bne,a	%xcc,	loop_2018
	sub	%l4,	0x180F,	%i0
loop_2017:
	taddcctv	%g2,	0x1E4A,	%i7
	subcc	%l5,	%o2,	%g5
loop_2018:
	sir	0x15A2
	addc	%g4,	0x1F93,	%l1
	movrlz	%o1,	%o3,	%i3
	fblg	%fcc0,	loop_2019
	fornot1s	%f9,	%f29,	%f14
	fmovdn	%xcc,	%f13,	%f1
	fexpand	%f1,	%f4
loop_2019:
	fexpand	%f19,	%f24
	movrne	%i6,	0x111,	%i1
	mulscc	%l3,	0x0005,	%l0
	move	%xcc,	%o5,	%g6
	subc	%i2,	%l2,	%o4
	fba,a	%fcc3,	loop_2020
	edge16	%i5,	%g7,	%o0
	tle	%xcc,	0x6
	xnorcc	%o6,	%g1,	%i4
loop_2020:
	movrlez	%l6,	0x26B,	%g3
	andcc	%o7,	0x0D7B,	%l4
	nop
	fitos	%f1,	%f10
	fstoi	%f10,	%f9
	fxnor	%f22,	%f6,	%f6
	alignaddr	%g2,	%i0,	%i7
	call	loop_2021
	sdivcc	%l5,	0x068E,	%g5
	movleu	%icc,	%o2,	%g4
	set	0x28, %l0
	ldsha	[%l7 + %l0] 0x15,	%l1
loop_2021:
	movle	%icc,	%o1,	%o3
	bne,pn	%icc,	loop_2022
	bne,pt	%icc,	loop_2023
	tgu	%xcc,	0x0
	fbo	%fcc2,	loop_2024
loop_2022:
	bpos,a,pn	%xcc,	loop_2025
loop_2023:
	sub	%i3,	%i1,	%i6
	sub	%l3,	%l0,	%g6
loop_2024:
	bshuffle	%f20,	%f30,	%f20
loop_2025:
	edge16ln	%o5,	%l2,	%i2
	fabss	%f2,	%f24
	fbue,a	%fcc1,	loop_2026
	edge16n	%i5,	%g7,	%o4
	udiv	%o0,	0x158F,	%o6
	std	%f8,	[%l7 + 0x58]
loop_2026:
	movle	%icc,	%i4,	%g1
	fmovrslez	%l6,	%f12,	%f5
	movpos	%xcc,	%g3,	%l4
	fmovsgu	%xcc,	%f10,	%f27
	alignaddr	%o7,	%g2,	%i0
	srlx	%i7,	0x05,	%g5
	edge8n	%o2,	%l5,	%l1
	nop
	setx	loop_2027,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	std	%f8,	[%l7 + 0x30]
	tcs	%xcc,	0x0
	popc	%g4,	%o1
loop_2027:
	nop
	fitos	%f14,	%f15
	fstox	%f15,	%f10
	fxtos	%f10,	%f27
	add	%o3,	%i1,	%i3
	ble	%xcc,	loop_2028
	edge8l	%l3,	%i6,	%g6
	movrne	%l0,	0x3AF,	%o5
	alignaddr	%i2,	%i5,	%l2
loop_2028:
	tg	%icc,	0x1
	tvs	%xcc,	0x4
	edge16	%o4,	%g7,	%o0
	ldx	[%l7 + 0x78],	%i4
	set	0x4B, %i4
	ldsba	[%l7 + %i4] 0x89,	%g1
	xorcc	%l6,	0x1670,	%g3
	addc	%l4,	0x160C,	%o6
	fmovrdne	%g2,	%f14,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f17,	%f1,	%f12
	movrgez	%o7,	0x21B,	%i7
	fones	%f31
	fble,a	%fcc1,	loop_2029
	tpos	%icc,	0x5
	fmovdne	%xcc,	%f9,	%f22
	movle	%xcc,	%g5,	%o2
loop_2029:
	udivx	%i0,	0x16B5,	%l1
	tg	%xcc,	0x3
	bvc,a,pt	%xcc,	loop_2030
	or	%g4,	%l5,	%o1
	fpsub16	%f26,	%f0,	%f2
	sir	0x1E2C
loop_2030:
	movvc	%xcc,	%o3,	%i3
	edge32ln	%i1,	%i6,	%l3
	edge8	%l0,	%g6,	%i2
	bleu,a	%icc,	loop_2031
	ta	%icc,	0x7
	fcmpeq16	%f0,	%f18,	%i5
	sll	%o5,	%l2,	%o4
loop_2031:
	nop
	fitod	%f12,	%f22
	fdtox	%f22,	%f10
	edge16ln	%o0,	%g7,	%i4
	srax	%g1,	0x0F,	%l6
	srax	%l4,	0x18,	%g3
	fnand	%f18,	%f20,	%f12
	fbne	%fcc0,	loop_2032
	fmul8sux16	%f20,	%f6,	%f28
	move	%xcc,	%o6,	%o7
	stw	%g2,	[%l7 + 0x0C]
loop_2032:
	movrgez	%i7,	%o2,	%i0
	or	%l1,	%g5,	%g4
	fnor	%f28,	%f24,	%f24
	fzeros	%f10
	ta	%xcc,	0x5
	fcmpeq16	%f28,	%f12,	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%i3
	tne	%icc,	0x7
	movpos	%icc,	%i1,	%i6
	orn	%l3,	0x1CF4,	%o3
	tneg	%icc,	0x0
	fmuld8sux16	%f13,	%f6,	%f14
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f16
	fxtod	%f16,	%f10
	edge16	%l0,	%g6,	%i5
	fmovrdne	%o5,	%f2,	%f12
	nop
	setx	loop_2033,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnegd	%f26,	%f14
	movgu	%icc,	%i2,	%o4
	srlx	%l2,	0x10,	%g7
loop_2033:
	taddcctv	%i4,	0x00AF,	%g1
	alignaddrl	%l6,	%l4,	%o0
	bvs,a,pt	%icc,	loop_2034
	movg	%icc,	%o6,	%g3
	bvc,a	loop_2035
	st	%f7,	[%l7 + 0x48]
loop_2034:
	tl	%xcc,	0x4
	movge	%xcc,	%o7,	%i7
loop_2035:
	bpos	loop_2036
	edge8l	%g2,	%o2,	%l1
	movcc	%xcc,	%g5,	%g4
	fmovd	%f24,	%f28
loop_2036:
	fone	%f6
	tn	%icc,	0x3
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x10,	 0x2
	and	%i0,	%l5,	%i1
	wr	%g0,	0x81,	%asi
	stha	%i6,	[%l7 + 0x7C] %asi
	umulcc	%l3,	%i3,	%o3
	ble,a,pn	%icc,	loop_2037
	addc	%l0,	0x0DC0,	%g6
	set	0x54, %l1
	sta	%f18,	[%l7 + %l1] 0x10
loop_2037:
	tneg	%xcc,	0x6
	and	%o5,	%i5,	%i2
	fbe	%fcc2,	loop_2038
	fbule	%fcc2,	loop_2039
	srax	%l2,	%g7,	%o4
	edge8ln	%g1,	%i4,	%l4
loop_2038:
	fmovs	%f5,	%f5
loop_2039:
	srlx	%o0,	0x0F,	%l6
	orncc	%o6,	%g3,	%i7
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f10
	flush	%l7 + 0x6C
	movpos	%xcc,	%o7,	%g2
	xnor	%o2,	%l1,	%g5
	fcmple16	%f4,	%f6,	%g4
	membar	0x1F
	tcc	%xcc,	0x7
	movle	%icc,	%i0,	%l5
	subcc	%o1,	%i6,	%l3
	andcc	%i3,	0x1CC9,	%o3
	ldx	[%l7 + 0x28],	%i1
	move	%xcc,	%g6,	%o5
	xnorcc	%i5,	0x19C8,	%l0
	bneg	%xcc,	loop_2040
	fmovsle	%icc,	%f3,	%f22
	fsrc1	%f14,	%f28
	movrlz	%i2,	%l2,	%o4
loop_2040:
	nop
	setx loop_2041, %l0, %l1
	jmpl %l1, %g1
	orcc	%g7,	0x06BD,	%l4
	movne	%icc,	%o0,	%l6
	nop
	setx	0x764B97CB51D87370,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x0843BEA7D4C020F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f10,	%f10
loop_2041:
	lduh	[%l7 + 0x56],	%i4
	alignaddr	%g3,	%o6,	%i7
	addc	%g2,	0x0103,	%o7
	fmovdvs	%xcc,	%f13,	%f0
	movg	%xcc,	%o2,	%g5
	movpos	%xcc,	%l1,	%g4
	edge8n	%l5,	%o1,	%i0
	movrlez	%i6,	0x0BC,	%l3
	fsrc1s	%f23,	%f14
	flush	%l7 + 0x1C
	faligndata	%f10,	%f26,	%f12
	movge	%icc,	%o3,	%i1
	sir	0x1822
	fmovdneg	%xcc,	%f16,	%f25
	array32	%g6,	%i3,	%i5
	sdiv	%l0,	0x031B,	%i2
	taddcc	%o5,	%l2,	%g1
	nop
	fitod	%f0,	%f10
	fdtoi	%f10,	%f25
	movle	%icc,	%o4,	%l4
	tge	%xcc,	0x3
	fmovsle	%icc,	%f6,	%f2
	flush	%l7 + 0x3C
	addccc	%g7,	0x1F26,	%l6
	tleu	%xcc,	0x2
	fmovse	%xcc,	%f17,	%f14
	bleu,a,pn	%xcc,	loop_2042
	tge	%xcc,	0x2
	tle	%xcc,	0x0
	movn	%icc,	%i4,	%o0
loop_2042:
	bleu,pt	%xcc,	loop_2043
	movgu	%icc,	%g3,	%i7
	tvc	%xcc,	0x2
	fmovrde	%o6,	%f28,	%f14
loop_2043:
	bl,pt	%xcc,	loop_2044
	fmovdl	%icc,	%f4,	%f16
	alignaddr	%g2,	%o7,	%o2
	nop
	setx	0x4963F600,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x0D93998F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f31,	%f23
loop_2044:
	tsubcctv	%l1,	0x1325,	%g5
	st	%f1,	[%l7 + 0x3C]
	edge8ln	%g4,	%o1,	%i0
	fmovspos	%icc,	%f1,	%f23
	fcmpgt32	%f8,	%f2,	%i6
	addccc	%l3,	0x028C,	%o3
	fmuld8ulx16	%f20,	%f3,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i1,	%l5
	movg	%xcc,	%i3,	%i5
	te	%icc,	0x3
	sdivcc	%l0,	0x0A71,	%g6
	addc	%i2,	0x1E50,	%o5
	fmovdcc	%icc,	%f27,	%f26
	sdivx	%g1,	0x1CE8,	%l2
	move	%xcc,	%l4,	%g7
	movvc	%icc,	%o4,	%i4
	nop
	setx	0x921278C7AD743C44,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f16
	nop
	set	0x5F, %i0
	ldsb	[%l7 + %i0],	%o0
	movge	%icc,	%l6,	%i7
	prefetch	[%l7 + 0x20],	 0x1
	movrlez	%o6,	0x180,	%g2
	or	%o7,	%g3,	%l1
	fpsub16	%f4,	%f6,	%f8
	bleu,a,pt	%xcc,	loop_2045
	fnot1	%f6,	%f2
	edge8n	%o2,	%g4,	%o1
	ble,pn	%xcc,	loop_2046
loop_2045:
	edge16	%i0,	%g5,	%l3
	set	0x64, %g6
	ldswa	[%l7 + %g6] 0x11,	%i6
loop_2046:
	edge16n	%i1,	%o3,	%l5
	edge32n	%i5,	%l0,	%i3
	popc	%g6,	%o5
	wr	%g0,	0xe3,	%asi
	stha	%g1,	[%l7 + 0x24] %asi
	membar	#Sync
	movn	%xcc,	%i2,	%l2
	bne,a,pn	%xcc,	loop_2047
	movgu	%icc,	%g7,	%l4
	bvc	%icc,	loop_2048
	umulcc	%i4,	0x18A2,	%o0
loop_2047:
	fsrc2s	%f1,	%f1
	smul	%l6,	%o4,	%i7
loop_2048:
	movne	%icc,	%g2,	%o6
	sllx	%g3,	0x00,	%l1
	tg	%icc,	0x5
	fbge	%fcc0,	loop_2049
	xorcc	%o7,	%g4,	%o1
	tg	%xcc,	0x2
	nop
	set	0x49, %i2
	ldsb	[%l7 + %i2],	%o2
loop_2049:
	fnot1s	%f18,	%f24
	nop
	setx	0x2E0B53A90DA0D214,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE1159CCDEB1875DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f14,	%f0
	sllx	%i0,	0x1E,	%g5
	swap	[%l7 + 0x10],	%i6
	edge32	%i1,	%o3,	%l3
	xor	%i5,	%l5,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%g6,	loop_2050
	fpsub32	%f22,	%f24,	%f6
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x70] %asi,	%o4
loop_2050:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x55] %asi,	%l0
	taddcctv	%i2,	%l2,	%g7
	fmovdge	%xcc,	%f21,	%f2
	array16	%l4,	%i4,	%g1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	movg	%icc,	%l6,	%o4
	xnor	%i7,	0x1609,	%o6
	edge32ln	%g2,	%l1,	%o7
	movl	%icc,	%g3,	%g4
	nop
	setx	loop_2051,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sll	%o2,	%o1,	%g5
	fmovdge	%icc,	%f11,	%f10
	stbar
loop_2051:
	fandnot1	%f22,	%f12,	%f2
	brnz,a	%i0,	loop_2052
	nop
	fitod	%f27,	%f24
	nop
	fitod	%f2,	%f12
	fdtos	%f12,	%f9
	fbul,a	%fcc2,	loop_2053
loop_2052:
	movgu	%icc,	%i1,	%i6
	fmovrdlz	%l3,	%f14,	%f10
	sdivx	%i5,	0x16C2,	%l5
loop_2053:
	sethi	0x18B2,	%o3
	nop
	fitod	%f6,	%f24
	fdtox	%f24,	%f10
	subccc	%g6,	0x0B1F,	%o5
	tvs	%xcc,	0x2
	fbue,a	%fcc3,	loop_2054
	udivcc	%i3,	0x0A17,	%l0
	fmul8x16au	%f30,	%f20,	%f18
	fmovrse	%l2,	%f6,	%f18
loop_2054:
	fcmple16	%f18,	%f4,	%i2
	bshuffle	%f14,	%f2,	%f20
	bneg	loop_2055
	srl	%l4,	%i4,	%g1
	tn	%icc,	0x2
	fzero	%f28
loop_2055:
	tl	%xcc,	0x6
	nop
	setx	0x1EC8276E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC009CB58,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f17,	%f10
	tvs	%xcc,	0x7
	tg	%icc,	0x3
	stb	%g7,	[%l7 + 0x7B]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%o4
	sethi	0x1A85,	%l6
	movge	%xcc,	%o6,	%g2
	nop
	fitos	%f12,	%f9
	fstox	%f9,	%f26
	fxtos	%f26,	%f13
	mova	%xcc,	%i7,	%l1
	nop
	setx	0xC6E9B4426AF5B2EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x1B854DAC3C78DCA2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f20,	%f28
	fpack16	%f14,	%f24
	swap	[%l7 + 0x0C],	%o7
	smul	%g4,	0x038F,	%o2
	andn	%o1,	%g5,	%i0
	sdivcc	%i1,	0x0D1A,	%i6
	edge16ln	%l3,	%i5,	%g3
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l5
	sth	%g6,	[%l7 + 0x22]
	srl	%o3,	0x04,	%o5
	nop
	setx	0x91B7C0CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xA9E8BE7C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f28,	%f29
	brgz,a	%l0,	loop_2056
	edge32l	%l2,	%i2,	%l4
	sllx	%i3,	0x10,	%i4
	movgu	%xcc,	%g1,	%g7
loop_2056:
	fmovsgu	%icc,	%f15,	%f27
	fmovrsgez	%o0,	%f26,	%f13
	edge32ln	%l6,	%o4,	%g2
	xnorcc	%o6,	0x1DBE,	%l1
	xnor	%o7,	0x008C,	%i7
	srl	%o2,	0x0A,	%o1
	stbar
	fmovdpos	%icc,	%f17,	%f3
	fxnor	%f18,	%f24,	%f16
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x10,	%g4
	fxnor	%f30,	%f18,	%f20
	fmovrdne	%i0,	%f30,	%f30
	sdivcc	%i1,	0x1823,	%g5
	udivcc	%i6,	0x0469,	%i5
	fmovdpos	%icc,	%f10,	%f25
	movvc	%icc,	%l3,	%l5
	fblg	%fcc0,	loop_2057
	edge16n	%g3,	%g6,	%o3
	xnorcc	%l0,	0x088C,	%l2
	bne,a	%xcc,	loop_2058
loop_2057:
	subccc	%i2,	0x0787,	%o5
	fbl,a	%fcc0,	loop_2059
	fbge,a	%fcc0,	loop_2060
loop_2058:
	tn	%icc,	0x0
	umulcc	%i3,	0x0B06,	%l4
loop_2059:
	fbg,a	%fcc0,	loop_2061
loop_2060:
	tl	%xcc,	0x0
	fmul8x16	%f5,	%f28,	%f16
	sllx	%i4,	%g7,	%g1
loop_2061:
	move	%xcc,	%l6,	%o0
	fmovrsgez	%g2,	%f22,	%f31
	fsrc2	%f2,	%f20
	subcc	%o6,	%o4,	%l1
	fbl	%fcc1,	loop_2062
	sll	%o7,	0x10,	%i7
	andn	%o1,	%g4,	%o2
	subc	%i1,	%i0,	%g5
loop_2062:
	membar	0x76
	xnor	%i6,	%l3,	%l5
	movpos	%xcc,	%g3,	%i5
	nop
	fitos	%f9,	%f27
	fstoi	%f27,	%f30
	subc	%o3,	0x14F9,	%l0
	fbul	%fcc0,	loop_2063
	tle	%xcc,	0x2
	fmovdneg	%xcc,	%f19,	%f2
	fsrc1	%f10,	%f28
loop_2063:
	movleu	%xcc,	%g6,	%l2
	nop
	fitos	%f14,	%f26
	fstoi	%f26,	%f31
	movle	%xcc,	%i2,	%i3
	sdivcc	%l4,	0x0B89,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o5,	%g7,	%l6
	movneg	%xcc,	%o0,	%g1
	tcs	%xcc,	0x0
	xnor	%g2,	0x1BD3,	%o6
	fbge	%fcc3,	loop_2064
	fmovdgu	%icc,	%f0,	%f1
	bg	%icc,	loop_2065
	array32	%o4,	%l1,	%o7
loop_2064:
	fmovdgu	%xcc,	%f24,	%f29
	movvs	%icc,	%i7,	%g4
loop_2065:
	nop
	fitos	%f2,	%f6
	fstoi	%f6,	%f29
	orncc	%o1,	0x0CA4,	%o2
	movg	%icc,	%i1,	%g5
	ldub	[%l7 + 0x64],	%i6
	fbn,a	%fcc0,	loop_2066
	bne,a	%icc,	loop_2067
	tvs	%xcc,	0x7
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
loop_2066:
	sethi	0x064A,	%l5
loop_2067:
	sdiv	%g3,	0x012D,	%i5
	fnot1	%f22,	%f4
	orncc	%o3,	%l0,	%l3
	addc	%g6,	%i2,	%l2
	tcc	%icc,	0x3
	fnegs	%f17,	%f7
	stx	%i3,	[%l7 + 0x60]
	edge8ln	%l4,	%i4,	%g7
	movrgz	%l6,	%o0,	%g1
	subccc	%g2,	%o5,	%o6
	fmul8sux16	%f12,	%f2,	%f0
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
	fmovsge	%icc,	%f25,	%f8
	ldd	[%l7 + 0x10],	%f18
	fba	%fcc3,	loop_2068
	orn	%l1,	0x122A,	%o7
	fmovdcs	%xcc,	%f20,	%f18
	tgu	%xcc,	0x0
loop_2068:
	fpadd32	%f6,	%f20,	%f20
	bn	%xcc,	loop_2069
	bleu,a	loop_2070
	nop
	setx	0x20505109,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	tl	%icc,	0x2
loop_2069:
	fandnot1s	%f9,	%f0,	%f30
loop_2070:
	movgu	%icc,	%i7,	%g4
	tge	%icc,	0x7
	sub	%o1,	%o4,	%o2
	movg	%xcc,	%g5,	%i6
	fmovscc	%xcc,	%f1,	%f7
	taddcc	%i0,	%l5,	%i1
	set	0x77, %o0
	ldsba	[%l7 + %o0] 0x80,	%i5
	bge	%icc,	loop_2071
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f10,	%f21
	fstox	%f21,	%f30
	fxtos	%f30,	%f3
	nop
	setx	0x547A6E98061F4B1E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x18CD480A1439122D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f16,	%f16
loop_2071:
	nop
	set	0x28, %g7
	ldx	[%l7 + %g7],	%o3
	tsubcctv	%l0,	%g3,	%g6
	fmovdcs	%icc,	%f15,	%f1
	fpack32	%f18,	%f8,	%f14
	fbge,a	%fcc2,	loop_2072
	tl	%xcc,	0x7
	move	%xcc,	%l3,	%i2
	fba,a	%fcc3,	loop_2073
loop_2072:
	movpos	%icc,	%l2,	%i3
	movge	%icc,	%i4,	%l4
	edge8ln	%g7,	%l6,	%o0
loop_2073:
	brnz,a	%g2,	loop_2074
	fmovsle	%xcc,	%f18,	%f0
	brz,a	%g1,	loop_2075
	movgu	%xcc,	%o6,	%l1
loop_2074:
	movgu	%xcc,	%o7,	%o5
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x3
loop_2075:
	movn	%xcc,	%o1,	%o4
	set	0x32, %g1
	lduha	[%l7 + %g1] 0x88,	%i7
	sub	%o2,	%g5,	%i6
	nop
	setx	0xF05B9BB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	sdivx	%l5,	0x085D,	%i0
	edge32	%i1,	%o3,	%i5
	movvs	%xcc,	%g3,	%g6
	srax	%l3,	%i2,	%l2
	bleu	loop_2076
	fmovdvs	%icc,	%f18,	%f7
	umulcc	%i3,	0x1DB1,	%l0
	movle	%xcc,	%l4,	%i4
loop_2076:
	nop
	setx	0x3FB287D7722B9600,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE2EFD4D8EF98E8A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f8,	%f2
	fmul8x16al	%f3,	%f17,	%f4
	or	%l6,	%g7,	%o0
	movgu	%icc,	%g2,	%o6
	movg	%xcc,	%l1,	%o7
	movrlz	%g1,	%g4,	%o5
	array16	%o4,	%o1,	%o2
	bvs,a	%icc,	loop_2077
	movneg	%xcc,	%g5,	%i7
	call	loop_2078
	movl	%icc,	%l5,	%i6
loop_2077:
	array16	%i1,	%i0,	%i5
	fandnot2s	%f14,	%f5,	%f28
loop_2078:
	udiv	%o3,	0x0BCB,	%g3
	edge32	%g6,	%i2,	%l3
	alignaddrl	%i3,	%l2,	%l4
	set	0x60, %i7
	prefetcha	[%l7 + %i7] 0x18,	 0x2
	nop
	fitos	%f11,	%f26
	fstox	%f26,	%f8
	movrgz	%l6,	0x0C6,	%g7
	umulcc	%l0,	%g2,	%o0
	edge16l	%l1,	%o7,	%o6
	tpos	%icc,	0x4
	andcc	%g1,	%g4,	%o4
	lduh	[%l7 + 0x20],	%o1
	movn	%icc,	%o2,	%o5
	ldsb	[%l7 + 0x7F],	%g5
	movl	%xcc,	%i7,	%l5
	wr	%g0,	0x10,	%asi
	sta	%f7,	[%l7 + 0x74] %asi
	fmovsgu	%icc,	%f29,	%f25
	add	%i1,	%i0,	%i6
	movrlz	%o3,	0x23D,	%i5
	move	%icc,	%g6,	%g3
	tg	%xcc,	0x5
	tleu	%xcc,	0x7
	fble	%fcc3,	loop_2079
	movvs	%xcc,	%i2,	%i3
	for	%f22,	%f2,	%f6
	sdivx	%l3,	0x053E,	%l2
loop_2079:
	fbug,a	%fcc1,	loop_2080
	fzeros	%f26
	nop
	setx	loop_2081,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movl	%xcc,	%l4,	%l6
loop_2080:
	edge16	%g7,	%i4,	%l0
	array32	%g2,	%l1,	%o0
loop_2081:
	fbu	%fcc0,	loop_2082
	addccc	%o6,	0x1E24,	%o7
	movrgez	%g4,	%g1,	%o1
	orncc	%o2,	0x13B5,	%o5
loop_2082:
	fmovdge	%icc,	%f28,	%f22
	fpsub16	%f22,	%f8,	%f24
	array16	%o4,	%g5,	%l5
	tcc	%xcc,	0x5
	tcs	%xcc,	0x6
	tvs	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	stwa	%i7,	[%l7 + 0x40] %asi
	fbul,a	%fcc0,	loop_2083
	ta	%icc,	0x6
	srlx	%i0,	0x1B,	%i1
	brgez	%i6,	loop_2084
loop_2083:
	nop
	setx	0x7B10AAAF1561D65D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x4623D73D5F4B8B05,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f6,	%f30
	movrlez	%i5,	0x3EB,	%g6
	sethi	0x147E,	%o3
loop_2084:
	tcs	%icc,	0x5
	fcmpgt32	%f18,	%f0,	%g3
	movpos	%icc,	%i2,	%l3
	udiv	%l2,	0x0675,	%i3
	membar	0x75
	edge8l	%l6,	%g7,	%l4
	fzeros	%f1
	andcc	%l0,	0x1EDF,	%i4
	nop
	fitos	%f9,	%f19
	fstox	%f19,	%f8
	fxtos	%f8,	%f11
	fpadd32s	%f15,	%f17,	%f23
	tgu	%icc,	0x4
	movneg	%icc,	%g2,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,a	loop_2085
	movre	%o0,	0x35C,	%o7
	wr	%g0,	0x80,	%asi
	stha	%g4,	[%l7 + 0x3A] %asi
loop_2085:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%o1
	sdivx	%o2,	0x06B1,	%o6
	tn	%icc,	0x1
	fmovsle	%xcc,	%f18,	%f23
	xnor	%o4,	0x0E6D,	%o5
	fmovd	%f8,	%f12
	fbu,a	%fcc2,	loop_2086
	movcs	%icc,	%g5,	%l5
	subcc	%i0,	%i1,	%i6
	edge8ln	%i5,	%i7,	%g6
loop_2086:
	tn	%xcc,	0x5
	sll	%g3,	%o3,	%i2
	srax	%l3,	%i3,	%l6
	fandnot2	%f8,	%f2,	%f18
	movcs	%xcc,	%g7,	%l4
	movre	%l0,	%l2,	%i4
	set	0x14, %g4
	lda	[%l7 + %g4] 0x0c,	%f8
	smulcc	%g2,	%o0,	%l1
	fnot2s	%f9,	%f12
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x3C] %asi,	%f6
	edge16ln	%g4,	%g1,	%o7
	sth	%o1,	[%l7 + 0x0A]
	andcc	%o2,	0x03A4,	%o6
	tsubcc	%o5,	%o4,	%g5
	orcc	%i0,	0x15D5,	%i1
	edge32l	%l5,	%i6,	%i7
	xor	%i5,	0x1828,	%g3
	mova	%xcc,	%o3,	%i2
	bvs,a,pn	%xcc,	loop_2087
	movg	%xcc,	%l3,	%i3
	set	0x1E, %o5
	ldsha	[%l7 + %o5] 0x89,	%l6
loop_2087:
	nop
	setx loop_2088, %l0, %l1
	jmpl %l1, %g6
	fmovscs	%xcc,	%f27,	%f23
	movvc	%icc,	%g7,	%l0
	fmovdneg	%icc,	%f3,	%f3
loop_2088:
	edge32n	%l4,	%l2,	%g2
	movvc	%icc,	%i4,	%l1
	andn	%g4,	0x1B10,	%g1
	bg,a	%xcc,	loop_2089
	array8	%o7,	%o1,	%o0
	ldd	[%l7 + 0x18],	%o6
	alignaddr	%o5,	%o2,	%o4
loop_2089:
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f16
	stb	%i0,	[%l7 + 0x5B]
	wr	%g0,	0x10,	%asi
	stxa	%i1,	[%l7 + 0x18] %asi
	nop
	setx	0x4FB035D6604683FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	umulcc	%g5,	0x17EF,	%l5
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x64] %asi,	%i6
	bge	loop_2090
	xnor	%i7,	0x1063,	%g3
	fbue	%fcc3,	loop_2091
	fnegs	%f11,	%f29
loop_2090:
	edge32n	%o3,	%i2,	%i5
	fnands	%f2,	%f28,	%f10
loop_2091:
	ldstub	[%l7 + 0x53],	%l3
	fble	%fcc0,	loop_2092
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%f20
	subcc	%l6,	%g6,	%g7
	set	0x10, %l3
	lduha	[%l7 + %l3] 0x80,	%i3
loop_2092:
	fmovsle	%icc,	%f12,	%f30
	fnor	%f10,	%f30,	%f20
	subcc	%l0,	%l4,	%g2
	move	%icc,	%l2,	%i4
	movrne	%g4,	%g1,	%o7
	nop
	setx	loop_2093,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez	%o1,	loop_2094
	sdivcc	%o0,	0x1EBD,	%l1
	movrgez	%o6,	0x0B3,	%o5
loop_2093:
	add	%o2,	0x13B8,	%o4
loop_2094:
	movvc	%icc,	%i0,	%g5
	movneg	%icc,	%i1,	%l5
	fmovsle	%xcc,	%f23,	%f26
	addccc	%i6,	0x165A,	%g3
	fmovrdlz	%i7,	%f26,	%f10
	edge16l	%o3,	%i2,	%i5
	movrgz	%l6,	%g6,	%l3
	bcs,a,pt	%icc,	loop_2095
	nop
	setx	loop_2096,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrsgez	%g7,	%f26,	%f19
	set	0x28, %g5
	stxa	%l0,	[%l7 + %g5] 0xe2
	membar	#Sync
loop_2095:
	fmovsa	%xcc,	%f1,	%f14
loop_2096:
	st	%f1,	[%l7 + 0x44]
	bpos,a	%xcc,	loop_2097
	tcs	%icc,	0x6
	set	0x10, %l4
	sta	%f21,	[%l7 + %l4] 0x10
loop_2097:
	umul	%l4,	%i3,	%l2
	movg	%icc,	%i4,	%g2
	fornot1	%f26,	%f18,	%f30
	tn	%icc,	0x2
	set	0x29, %o1
	ldsba	[%l7 + %o1] 0x18,	%g4
	fabsd	%f14,	%f30
	tle	%xcc,	0x4
	fpmerge	%f10,	%f9,	%f6
	array32	%o7,	%o1,	%o0
	and	%g1,	0x10A5,	%o6
	movn	%icc,	%o5,	%l1
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x3C] %asi,	%o2
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	nop
	set	0x64, %i1
	stb	%o4,	[%l7 + %i1]
	fbu,a	%fcc2,	loop_2098
	nop
	setx	0x004540B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	xnor	%g5,	%i1,	%l5
	tgu	%xcc,	0x4
loop_2098:
	edge16n	%g3,	%i7,	%o3
	fnors	%f29,	%f13,	%f14
	fmovdge	%icc,	%f0,	%f9
	set	0x28, %o2
	stxa	%i2,	[%l7 + %o2] 0xea
	membar	#Sync
	tsubcc	%i5,	%i6,	%l6
	udiv	%g6,	0x1869,	%l3
	movre	%l0,	0x11A,	%l4
	set	0x3C, %l2
	stba	%i3,	[%l7 + %l2] 0x2a
	membar	#Sync
	bpos	loop_2099
	movl	%icc,	%l2,	%i4
	bleu,pt	%xcc,	loop_2100
	taddcctv	%g2,	0x159F,	%g4
loop_2099:
	bcs,pt	%xcc,	loop_2101
	xnor	%g7,	%o1,	%o0
loop_2100:
	ble,pn	%xcc,	loop_2102
	fcmpgt32	%f20,	%f30,	%o7
loop_2101:
	fmovsge	%icc,	%f5,	%f24
	nop
	setx	0x92B8249C480BD975,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f18
loop_2102:
	movrgz	%o6,	%g1,	%l1
	faligndata	%f6,	%f24,	%f18
	movrgez	%o2,	0x320,	%i0
	fmovsge	%xcc,	%f1,	%f26
	nop
	setx	0xA42DA203905EA0B7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	edge32	%o4,	%g5,	%i1
	addccc	%o5,	%l5,	%g3
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f7
	fbe,a	%fcc2,	loop_2103
	fble	%fcc1,	loop_2104
	edge32l	%i7,	%o3,	%i5
	movrgz	%i6,	0x135,	%l6
loop_2103:
	taddcctv	%i2,	0x1DC8,	%g6
loop_2104:
	umulcc	%l0,	0x0A8B,	%l4
	movle	%icc,	%i3,	%l3
	fandnot2s	%f15,	%f6,	%f7
	sdivx	%l2,	0x1C18,	%i4
	be,pn	%xcc,	loop_2105
	tvc	%xcc,	0x3
	tl	%icc,	0x0
	nop
	fitod	%f4,	%f14
	fdtos	%f14,	%f2
loop_2105:
	alignaddr	%g4,	%g7,	%o1
	tge	%xcc,	0x7
	fpadd16s	%f18,	%f22,	%f4
	ldx	[%l7 + 0x18],	%g2
	sdivcc	%o7,	0x0660,	%o0
	fpsub16	%f30,	%f30,	%f20
	bshuffle	%f16,	%f4,	%f26
	ble	loop_2106
	movcs	%xcc,	%o6,	%g1
	movvc	%xcc,	%l1,	%i0
	fbe,a	%fcc1,	loop_2107
loop_2106:
	movrlz	%o2,	%g5,	%o4
	fmovde	%xcc,	%f18,	%f28
	smul	%o5,	0x03B5,	%l5
loop_2107:
	nop
	wr	%g0,	0xea,	%asi
	stwa	%i1,	[%l7 + 0x4C] %asi
	membar	#Sync
	nop
	setx	loop_2108,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movneg	%xcc,	%g3,	%i7
	xnorcc	%i5,	%o3,	%l6
	subccc	%i2,	%g6,	%i6
loop_2108:
	fmovs	%f6,	%f12
	fpadd16	%f26,	%f18,	%f4
	tg	%xcc,	0x3
	nop
	fitos	%f8,	%f7
	fstod	%f7,	%f10
	subc	%l4,	0x03A5,	%i3
	brz,a	%l3,	loop_2109
	fmul8ulx16	%f12,	%f2,	%f26
	tge	%xcc,	0x6
	tcc	%icc,	0x7
loop_2109:
	orncc	%l0,	%l2,	%i4
	mova	%icc,	%g4,	%o1
	popc	%g2,	%g7
	taddcc	%o7,	%o0,	%o6
	xorcc	%g1,	%i0,	%o2
	edge16l	%g5,	%l1,	%o4
	addc	%o5,	%l5,	%g3
	array32	%i7,	%i5,	%i1
	ldd	[%l7 + 0x18],	%f16
	movgu	%icc,	%l6,	%o3
	movle	%icc,	%g6,	%i6
	subc	%l4,	%i3,	%i2
	ble,a,pt	%xcc,	loop_2110
	bshuffle	%f8,	%f4,	%f0
	sdivx	%l0,	0x11F1,	%l3
	nop
	setx	loop_2111,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2110:
	subcc	%l2,	0x0224,	%g4
	tpos	%xcc,	0x5
	bg,a	loop_2112
loop_2111:
	edge32l	%i4,	%g2,	%g7
	movn	%icc,	%o1,	%o0
	xnorcc	%o6,	0x0855,	%g1
loop_2112:
	fmovscs	%icc,	%f1,	%f3
	fbo	%fcc1,	loop_2113
	membar	0x46
	fcmpeq32	%f28,	%f2,	%o7
	fcmpeq32	%f2,	%f22,	%o2
loop_2113:
	fbul	%fcc1,	loop_2114
	array8	%g5,	%i0,	%o4
	tcs	%icc,	0x1
	ta	%icc,	0x2
loop_2114:
	mulx	%o5,	0x1552,	%l5
	and	%g3,	0x17FE,	%i7
	ldub	[%l7 + 0x08],	%i5
	movpos	%xcc,	%l1,	%l6
	set	0x78, %o6
	ldswa	[%l7 + %o6] 0x89,	%i1
	sethi	0x1033,	%o3
	and	%g6,	0x10A9,	%l4
	wr	%g0,	0x04,	%asi
	sta	%f29,	[%l7 + 0x30] %asi
	umul	%i3,	%i2,	%i6
	srlx	%l0,	%l3,	%l2
	subcc	%g4,	%i4,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tl	%xcc,	0x1
	mova	%xcc,	%o1,	%g7
	nop
	setx	loop_2115,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x15, %l6
	ldstub	[%l7 + %l6],	%o6
	bl,a,pn	%icc,	loop_2116
	tpos	%icc,	0x0
loop_2115:
	fbe	%fcc1,	loop_2117
	movrlz	%g1,	0x0C8,	%o0
loop_2116:
	fpackfix	%f4,	%f5
	move	%xcc,	%o2,	%o7
loop_2117:
	sdivcc	%i0,	0x0435,	%g5
	bvc,a	loop_2118
	edge8ln	%o4,	%o5,	%g3
	tsubcctv	%i7,	0x00F1,	%l5
	udiv	%i5,	0x15F0,	%l6
loop_2118:
	edge8ln	%l1,	%i1,	%g6
	edge16ln	%l4,	%o3,	%i2
	fnor	%f4,	%f22,	%f24
	srl	%i3,	%i6,	%l0
	movl	%icc,	%l2,	%l3
	umulcc	%g4,	%g2,	%o1
	tcs	%xcc,	0x1
	sll	%i4,	%o6,	%g1
	fnot1	%f10,	%f4
	orn	%o0,	0x0A9D,	%o2
	fbl,a	%fcc0,	loop_2119
	nop
	fitos	%f12,	%f6
	fstoi	%f6,	%f0
	ldsh	[%l7 + 0x18],	%g7
	tl	%xcc,	0x4
loop_2119:
	tsubcctv	%o7,	%g5,	%i0
	srax	%o5,	%g3,	%i7
	smul	%l5,	0x0677,	%o4
	tcs	%xcc,	0x7
	fmovdpos	%xcc,	%f11,	%f5
	bgu	loop_2120
	srlx	%i5,	%l1,	%i1
	fmovda	%xcc,	%f25,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2120:
	tpos	%icc,	0x2
	nop
	setx	0x46057B9EA075B361,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	set	0x41, %o4
	stba	%l6,	[%l7 + %o4] 0x14
	fabsd	%f22,	%f14
	sdivcc	%l4,	0x0A17,	%g6
	edge16l	%o3,	%i2,	%i6
	fbul	%fcc2,	loop_2121
	tleu	%xcc,	0x2
	ble,a	loop_2122
	popc	0x19B8,	%l0
loop_2121:
	fmovrsgz	%i3,	%f31,	%f30
	subc	%l3,	0x0E58,	%l2
loop_2122:
	brz	%g2,	loop_2123
	xnorcc	%g4,	%i4,	%o1
	andncc	%o6,	%o0,	%o2
	ldsh	[%l7 + 0x52],	%g1
loop_2123:
	sdivx	%g7,	0x1718,	%o7
	mulscc	%i0,	%o5,	%g5
	edge16	%g3,	%l5,	%i7
	edge32ln	%o4,	%l1,	%i1
	faligndata	%f28,	%f28,	%f22
	fnot2s	%f20,	%f11
	fnand	%f26,	%f14,	%f18
	fbg,a	%fcc1,	loop_2124
	srl	%i5,	0x13,	%l4
	srl	%l6,	0x11,	%g6
	nop
	fitos	%f0,	%f27
	fstox	%f27,	%f10
	fxtos	%f10,	%f27
loop_2124:
	bn	%icc,	loop_2125
	fand	%f10,	%f14,	%f8
	tgu	%icc,	0x7
	bneg,a,pn	%icc,	loop_2126
loop_2125:
	fornot2s	%f12,	%f6,	%f1
	udivcc	%i2,	0x165D,	%o3
	srl	%i6,	%l0,	%i3
loop_2126:
	nop
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x54] %asi,	%l2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l3
	fbug	%fcc1,	loop_2127
	srl	%g2,	0x15,	%i4
	fmovdvs	%icc,	%f4,	%f23
	fmovrdgz	%o1,	%f14,	%f22
loop_2127:
	fandnot1	%f10,	%f10,	%f8
	popc	%g4,	%o6
	edge32n	%o0,	%g1,	%o2
	brz,a	%o7,	loop_2128
	fmul8x16	%f12,	%f24,	%f0
	fmovsl	%icc,	%f7,	%f18
	fpsub16	%f28,	%f12,	%f6
loop_2128:
	call	loop_2129
	edge32n	%i0,	%o5,	%g7
	or	%g5,	%g3,	%l5
	fpsub16	%f2,	%f16,	%f12
loop_2129:
	edge16ln	%i7,	%l1,	%o4
	movpos	%icc,	%i1,	%i5
	fbule,a	%fcc0,	loop_2130
	addcc	%l6,	0x073E,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x34, %i5
	lda	[%l7 + %i5] 0x88,	%f9
loop_2130:
	movn	%xcc,	%i2,	%g6
	fornot2s	%f12,	%f30,	%f20
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x17,	%f16
	movrgez	%i6,	%o3,	%l0
	ld	[%l7 + 0x20],	%f12
	set	0x20, %g2
	lduwa	[%l7 + %g2] 0x89,	%l2
	movcc	%icc,	%l3,	%i3
	std	%f16,	[%l7 + 0x78]
	nop
	fitos	%f12,	%f23
	fstox	%f23,	%f24
	tne	%xcc,	0x0
	ldsw	[%l7 + 0x08],	%i4
	fmovrsgz	%g2,	%f21,	%f12
	faligndata	%f6,	%f4,	%f24
	tn	%icc,	0x4
	edge16ln	%o1,	%g4,	%o6
	umul	%g1,	%o0,	%o7
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%f28
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x81,	%o2
	fandnot2s	%f10,	%f4,	%f13
	mulscc	%i0,	%g7,	%g5
	bpos,a	%xcc,	loop_2131
	fmovsgu	%xcc,	%f24,	%f6
	andn	%g3,	%o5,	%l5
	fcmple16	%f28,	%f24,	%i7
loop_2131:
	membar	0x1E
	fnor	%f6,	%f2,	%f18
	bn	loop_2132
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o4,	%l1,	%i5
	tleu	%xcc,	0x5
loop_2132:
	nop
	set	0x60, %l0
	ldda	[%l7 + %l0] 0x18,	%i0
	popc	0x0254,	%l6
	fpsub16	%f10,	%f26,	%f12
	sth	%i2,	[%l7 + 0x2E]
	sdiv	%l4,	0x16E9,	%g6
	fnot2	%f28,	%f12
	movrlez	%i6,	%l0,	%l2
	set	0x3B, %i4
	lduba	[%l7 + %i4] 0x15,	%o3
	tsubcctv	%l3,	%i3,	%g2
	movcc	%xcc,	%i4,	%g4
	nop
	set	0x12, %l1
	sth	%o1,	[%l7 + %l1]
	edge16l	%g1,	%o6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o7,	0x0775,	%i0
	fmul8ulx16	%f20,	%f28,	%f16
	nop
	setx	0x37EB3367,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x1951A301,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f13,	%f14
	andn	%g7,	%o2,	%g3
	stw	%g5,	[%l7 + 0x14]
	nop
	setx	loop_2133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%icc,	%o5,	%i7
	fxor	%f14,	%f22,	%f28
	andncc	%o4,	%l1,	%l5
loop_2133:
	nop
	wr	%g0,	0x2b,	%asi
	stwa	%i5,	[%l7 + 0x78] %asi
	membar	#Sync
	fzeros	%f6
	fcmpne16	%f10,	%f4,	%i1
	bg,pn	%xcc,	loop_2134
	umulcc	%i2,	%l4,	%l6
	fmovrsne	%i6,	%f5,	%f4
	or	%l0,	0x1C8D,	%l2
loop_2134:
	tcc	%icc,	0x3
	tn	%xcc,	0x2
	edge16l	%o3,	%g6,	%i3
	or	%g2,	0x007C,	%l3
	movl	%icc,	%i4,	%o1
	fsrc2s	%f19,	%f22
	fabss	%f16,	%f18
	orn	%g1,	0x1928,	%o6
	faligndata	%f20,	%f0,	%f2
	fmovdcs	%icc,	%f9,	%f27
	edge32	%o0,	%g4,	%o7
	taddcc	%g7,	0x0999,	%o2
	movvc	%icc,	%i0,	%g3
	andncc	%o5,	%g5,	%o4
	fcmpne16	%f12,	%f0,	%l1
	edge8l	%i7,	%l5,	%i5
	orn	%i2,	%i1,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l4,	%i6,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l2,	0x0F9A,	%g6
	movre	%i3,	0x12D,	%g2
	fbuge	%fcc1,	loop_2135
	fornot1	%f6,	%f20,	%f16
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x45] %asi,	%o3
loop_2135:
	sir	0x028D
	sra	%i4,	0x02,	%l3
	ble,a,pn	%xcc,	loop_2136
	fexpand	%f1,	%f24
	set	0x52, %i0
	ldsha	[%l7 + %i0] 0x80,	%g1
loop_2136:
	bcs,pn	%xcc,	loop_2137
	fba	%fcc3,	loop_2138
	orcc	%o6,	0x0A0E,	%o1
	ld	[%l7 + 0x48],	%f18
loop_2137:
	bcs	loop_2139
loop_2138:
	movvs	%xcc,	%o0,	%o7
	movg	%icc,	%g7,	%o2
	movgu	%xcc,	%i0,	%g4
loop_2139:
	stbar
	smulcc	%g3,	%o5,	%g5
	brnz	%o4,	loop_2140
	nop
	setx	0x56D84779507ED9A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fpmerge	%f22,	%f21,	%f22
	fcmpne32	%f20,	%f2,	%i7
loop_2140:
	edge8l	%l1,	%l5,	%i5
	movcs	%icc,	%i1,	%l6
	ldsb	[%l7 + 0x5D],	%l4
	bn,a	loop_2141
	andncc	%i6,	%i2,	%l2
	tne	%icc,	0x2
	srl	%l0,	0x05,	%g6
loop_2141:
	movrlez	%i3,	0x2EA,	%g2
	mova	%icc,	%o3,	%l3
	addcc	%g1,	%i4,	%o1
	array16	%o0,	%o6,	%o7
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%o2
	movcc	%xcc,	%i0,	%g4
	tle	%icc,	0x0
	taddcc	%g7,	0x0CAF,	%o5
	edge16ln	%g5,	%g3,	%o4
	fors	%f18,	%f29,	%f22
	nop
	setx	0xECF5EDC1CBE5B3DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x6908A9AE80EC6104,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f0,	%f10
	mulscc	%i7,	%l5,	%l1
	movrlez	%i1,	%i5,	%l4
	nop
	setx	0x89ECF361404F4AB7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	srl	%i6,	0x0C,	%l6
	tle	%icc,	0x5
	tn	%icc,	0x3
	brnz,a	%i2,	loop_2142
	taddcctv	%l2,	%g6,	%i3
	sll	%g2,	0x13,	%o3
	fble,a	%fcc0,	loop_2143
loop_2142:
	fornot2	%f2,	%f14,	%f26
	addcc	%l0,	0x07ED,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2143:
	fmovdleu	%icc,	%f21,	%f14
	ldsw	[%l7 + 0x30],	%i4
	movvc	%icc,	%o1,	%l3
	udiv	%o0,	0x09C2,	%o7
	fcmpne32	%f0,	%f12,	%o6
	edge16n	%o2,	%i0,	%g7
	brz	%g4,	loop_2144
	edge32ln	%o5,	%g3,	%g5
	bgu,pt	%icc,	loop_2145
	sllx	%i7,	0x0E,	%l5
loop_2144:
	nop
	set	0x68, %o7
	ldsha	[%l7 + %o7] 0x04,	%l1
loop_2145:
	edge32ln	%i1,	%o4,	%l4
	srl	%i5,	0x08,	%l6
	bvc,a	loop_2146
	fbu	%fcc1,	loop_2147
	movge	%xcc,	%i6,	%l2
	nop
	setx	loop_2148,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2146:
	taddcctv	%g6,	0x1CA0,	%i3
loop_2147:
	fbo	%fcc1,	loop_2149
	alignaddrl	%i2,	%g2,	%l0
loop_2148:
	movcs	%xcc,	%o3,	%i4
	fsrc1	%f2,	%f6
loop_2149:
	srax	%g1,	0x08,	%o1
	fnegs	%f25,	%f28
	nop
	setx	0xE30ADE1528082E56,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x67766091CBF6AE1D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f2,	%f8
	movrlz	%o0,	0x039,	%o7
	nop
	set	0x5C, %i2
	lduw	[%l7 + %i2],	%l3
	fpadd32s	%f24,	%f6,	%f12
	bne,a	loop_2150
	tneg	%xcc,	0x0
	sub	%o6,	0x1C0C,	%o2
	tpos	%xcc,	0x3
loop_2150:
	fbu,a	%fcc3,	loop_2151
	orn	%i0,	%g7,	%o5
	fxnor	%f16,	%f6,	%f28
	andn	%g3,	%g5,	%g4
loop_2151:
	nop
	wr	%g0,	0xe2,	%asi
	stha	%l5,	[%l7 + 0x78] %asi
	membar	#Sync
	std	%f10,	[%l7 + 0x40]
	umul	%l1,	%i7,	%i1
	bgu,a,pt	%xcc,	loop_2152
	sub	%o4,	0x00AF,	%i5
	edge32l	%l4,	%l6,	%i6
	edge32ln	%l2,	%i3,	%g6
loop_2152:
	movleu	%xcc,	%i2,	%g2
	orn	%o3,	0x0B49,	%i4
	fpadd16	%f10,	%f10,	%f24
	sdiv	%l0,	0x19B9,	%o1
	tcc	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f22,	%f9
	brgz,a	%o0,	loop_2153
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%g1,	%l3
	sdivcc	%o6,	0x0816,	%o7
loop_2153:
	fbl	%fcc1,	loop_2154
	fmovrslz	%o2,	%f14,	%f27
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i0,	%g7
loop_2154:
	edge16n	%o5,	%g3,	%g5
	fnot1s	%f29,	%f13
	fpsub16s	%f31,	%f9,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc3,	loop_2155
	movgu	%icc,	%l5,	%g4
	sra	%l1,	0x15,	%i7
	fbo	%fcc1,	loop_2156
loop_2155:
	udivcc	%o4,	0x0044,	%i1
	fbn,a	%fcc1,	loop_2157
	nop
	setx loop_2158, %l0, %l1
	jmpl %l1, %i5
loop_2156:
	fmovsge	%xcc,	%f3,	%f29
	edge16l	%l4,	%l6,	%l2
loop_2157:
	mova	%xcc,	%i6,	%g6
loop_2158:
	orncc	%i3,	%i2,	%o3
	ldd	[%l7 + 0x40],	%g2
	bleu,a,pt	%xcc,	loop_2159
	move	%xcc,	%i4,	%o1
	fmovrsne	%o0,	%f6,	%f26
	srax	%l0,	%g1,	%l3
loop_2159:
	alignaddrl	%o7,	%o6,	%o2
	fble	%fcc2,	loop_2160
	fbn,a	%fcc2,	loop_2161
	fbule	%fcc3,	loop_2162
	srlx	%g7,	%o5,	%i0
loop_2160:
	tsubcctv	%g5,	0x0C02,	%l5
loop_2161:
	movg	%icc,	%g3,	%g4
loop_2162:
	ldsb	[%l7 + 0x1B],	%l1
	addc	%i7,	%i1,	%o4
	movle	%xcc,	%i5,	%l4
	smul	%l6,	0x1ADD,	%l2
	andn	%i6,	0x0CB9,	%g6
	sdivx	%i3,	0x12E6,	%o3
	fsrc2s	%f5,	%f20
	fmovdvc	%xcc,	%f3,	%f9
	ldx	[%l7 + 0x48],	%i2
	nop
	setx	loop_2163,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcctv	%i4,	0x1F2B,	%o1
	brnz	%o0,	loop_2164
	fmovdle	%xcc,	%f1,	%f23
loop_2163:
	bshuffle	%f30,	%f22,	%f10
	set	0x22, %g6
	ldstuba	[%l7 + %g6] 0x89,	%g2
loop_2164:
	movrlez	%l0,	%g1,	%l3
	fors	%f25,	%f13,	%f11
	fmul8sux16	%f28,	%f8,	%f8
	mulscc	%o6,	0x11DC,	%o2
	taddcc	%o7,	%g7,	%o5
	edge16l	%g5,	%l5,	%i0
	fbu,a	%fcc3,	loop_2165
	xnorcc	%g3,	0x1560,	%l1
	mova	%xcc,	%i7,	%g4
	xor	%i1,	%i5,	%o4
loop_2165:
	fnot2	%f18,	%f18
	fcmpgt16	%f16,	%f18,	%l6
	tsubcctv	%l2,	0x14B7,	%l4
	mova	%xcc,	%g6,	%i3
	taddcctv	%o3,	%i2,	%i6
	tvs	%xcc,	0x1
	array8	%i4,	%o0,	%g2
	swap	[%l7 + 0x38],	%l0
	fbul,a	%fcc1,	loop_2166
	fnot1s	%f4,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o1,	%l3
loop_2166:
	movvs	%icc,	%o6,	%o2
	tle	%xcc,	0x7
	set	0x45, %g3
	ldsba	[%l7 + %g3] 0x19,	%g1
	edge32ln	%g7,	%o5,	%g5
	fmovdne	%icc,	%f7,	%f30
	membar	0x65
	edge32l	%o7,	%i0,	%l5
	mulx	%l1,	0x0F38,	%g3
	movgu	%xcc,	%g4,	%i7
	addcc	%i5,	%o4,	%i1
	fmovsa	%icc,	%f21,	%f30
	sth	%l2,	[%l7 + 0x3E]
	movle	%xcc,	%l4,	%g6
	fxors	%f14,	%f20,	%f12
	lduw	[%l7 + 0x20],	%i3
	set	0x0A, %o0
	lduba	[%l7 + %o0] 0x89,	%o3
	tneg	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%l6,	%f30,	%f4
	orn	%i6,	0x19A1,	%i2
	smul	%i4,	%o0,	%g2
	edge16ln	%l0,	%l3,	%o1
	and	%o2,	%g1,	%o6
	lduh	[%l7 + 0x0A],	%g7
	addccc	%g5,	0x0920,	%o5
	st	%f9,	[%l7 + 0x78]
	ld	[%l7 + 0x5C],	%f18
	fmul8sux16	%f6,	%f16,	%f30
	srl	%o7,	%l5,	%i0
	edge8ln	%g3,	%g4,	%i7
	edge32l	%i5,	%o4,	%l1
	sdivcc	%i1,	0x0AC6,	%l2
	bg,a,pn	%icc,	loop_2167
	lduh	[%l7 + 0x18],	%l4
	nop
	fitod	%f6,	%f24
	fdtos	%f24,	%f24
	fcmpne32	%f20,	%f16,	%i3
loop_2167:
	movpos	%xcc,	%o3,	%l6
	edge8n	%g6,	%i6,	%i4
	fnot1s	%f16,	%f23
	edge32l	%i2,	%o0,	%g2
	fbn	%fcc2,	loop_2168
	brgz	%l3,	loop_2169
	tn	%icc,	0x0
	edge16ln	%l0,	%o1,	%g1
loop_2168:
	for	%f24,	%f0,	%f4
loop_2169:
	movge	%xcc,	%o2,	%o6
	tg	%xcc,	0x1
	fbne	%fcc1,	loop_2170
	fornot2s	%f16,	%f5,	%f16
	fbug,a	%fcc3,	loop_2171
	sdivx	%g7,	0x1F42,	%o5
loop_2170:
	fmovspos	%xcc,	%f26,	%f25
	tne	%xcc,	0x3
loop_2171:
	fmul8x16al	%f19,	%f29,	%f12
	set	0x6B, %g1
	ldsba	[%l7 + %g1] 0x89,	%o7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%g5
	xnor	%g3,	%i0,	%i7
	brnz	%g4,	loop_2172
	popc	%i5,	%o4
	fbge	%fcc0,	loop_2173
	nop
	setx	0xA3D4D1F97B951183,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x017D044CB5668BCB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f8,	%f10
loop_2172:
	fmovrse	%l1,	%f16,	%f18
	movle	%icc,	%l2,	%i1
loop_2173:
	edge32l	%i3,	%o3,	%l4
	ldsb	[%l7 + 0x64],	%l6
	bpos	loop_2174
	movrgz	%g6,	0x0BF,	%i6
	tne	%icc,	0x3
	edge32ln	%i2,	%i4,	%g2
loop_2174:
	edge16n	%o0,	%l0,	%o1
	nop
	setx	0x07031748893D0A0D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x4CE9BCB8110C3DC8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f30,	%f10
	fmovdcs	%xcc,	%f15,	%f10
	nop
	setx	loop_2175,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%icc,	%l3,	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%g7
loop_2175:
	bg,a	%xcc,	loop_2176
	fmovsl	%icc,	%f29,	%f19
	xnorcc	%o6,	%o7,	%l5
	tl	%xcc,	0x7
loop_2176:
	nop
	setx	0x7061EE1C,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fpsub32	%f20,	%f28,	%f8
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f22,	%f4,	%f21
	sub	%g3,	0x0B53,	%i0
	movpos	%icc,	%i7,	%g4
	addccc	%i5,	0x044F,	%o4
	smulcc	%g5,	0x1322,	%l2
	nop
	setx	0xA483CA67,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x828B0583,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f11,	%f18
	stx	%l1,	[%l7 + 0x28]
	brgz	%i3,	loop_2177
	fmul8ulx16	%f24,	%f10,	%f0
	mulscc	%o3,	0x1069,	%l4
	brgez	%l6,	loop_2178
loop_2177:
	sethi	0x1749,	%i1
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x50] %asi,	%f7
loop_2178:
	xnorcc	%g6,	%i6,	%i2
	fnor	%f10,	%f0,	%f18
	edge32	%g2,	%o0,	%l0
	movg	%icc,	%i4,	%o1
	orn	%g1,	%o2,	%g7
	sth	%l3,	[%l7 + 0x28]
	popc	0x00AF,	%o6
	tsubcctv	%l5,	0x03D5,	%o7
	tgu	%xcc,	0x1
	fbu,a	%fcc0,	loop_2179
	fandnot2	%f14,	%f20,	%f28
	bshuffle	%f12,	%f6,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2179:
	nop
	fitos	%f5,	%f11
	fstod	%f11,	%f8
	edge16n	%o5,	%i0,	%i7
	sdivx	%g3,	0x0F77,	%i5
	srax	%o4,	0x14,	%g4
	fmovsneg	%icc,	%f29,	%f31
	tleu	%icc,	0x0
	addc	%l2,	%g5,	%l1
	fsrc1	%f16,	%f12
	tsubcctv	%o3,	0x04BB,	%i3
	fbg	%fcc1,	loop_2180
	fnot2s	%f5,	%f24
	bcc,pt	%icc,	loop_2181
	brz	%l6,	loop_2182
loop_2180:
	brlez	%i1,	loop_2183
	brlz	%l4,	loop_2184
loop_2181:
	edge32	%g6,	%i6,	%i2
loop_2182:
	brlz	%g2,	loop_2185
loop_2183:
	edge8	%o0,	%l0,	%i4
loop_2184:
	fnegd	%f4,	%f28
	movneg	%xcc,	%o1,	%o2
loop_2185:
	subc	%g1,	0x0CA2,	%l3
	membar	0x48
	taddcc	%g7,	0x1F9D,	%o6
	addccc	%o7,	0x1911,	%o5
	alignaddrl	%i0,	%i7,	%l5
	movre	%g3,	0x319,	%i5
	nop
	fitod	%f14,	%f22
	tl	%xcc,	0x3
	smulcc	%g4,	0x1A69,	%l2
	tgu	%xcc,	0x6
	fmul8x16au	%f9,	%f21,	%f30
	fcmpeq16	%f0,	%f10,	%g5
	edge32ln	%l1,	%o4,	%i3
	bn,a,pt	%xcc,	loop_2186
	movrne	%o3,	0x241,	%i1
	set	0x08, %i7
	lduha	[%l7 + %i7] 0x11,	%l4
loop_2186:
	nop
	set	0x4C, %g7
	sta	%f14,	[%l7 + %g7] 0x18
	sdivcc	%l6,	0x0981,	%g6
	fmovsge	%icc,	%f22,	%f25
	fandnot1s	%f19,	%f26,	%f3
	bn,pn	%icc,	loop_2187
	srl	%i6,	%i2,	%o0
	taddcctv	%l0,	0x1E50,	%i4
	movge	%xcc,	%o1,	%g2
loop_2187:
	tg	%xcc,	0x3
	edge8n	%o2,	%g1,	%g7
	te	%xcc,	0x6
	fbue	%fcc0,	loop_2188
	movn	%xcc,	%o6,	%o7
	nop
	setx	0xFC02F64610634E3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	nop
	setx loop_2189, %l0, %l1
	jmpl %l1, %l3
loop_2188:
	movre	%i0,	%i7,	%l5
	nop
	setx	loop_2190,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbue,a	%fcc1,	loop_2191
loop_2189:
	tvc	%xcc,	0x5
	fmovdcs	%icc,	%f1,	%f8
loop_2190:
	andncc	%o5,	%g3,	%i5
loop_2191:
	fmovsgu	%xcc,	%f7,	%f3
	andn	%l2,	%g5,	%g4
	alignaddr	%l1,	%i3,	%o3
	xnorcc	%i1,	0x17DA,	%l4
	sll	%o4,	0x00,	%l6
	tvs	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i6,	%g6
	sra	%o0,	%i2,	%l0
	pdist	%f2,	%f28,	%f12
	xor	%i4,	%g2,	%o2
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x6C] %asi,	%o1
	bleu,pt	%icc,	loop_2192
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f15,	%f25
	movrgez	%g1,	%g7,	%o7
loop_2192:
	tsubcctv	%l3,	0x0651,	%o6
	movrgz	%i7,	%i0,	%l5
	fornot2	%f6,	%f10,	%f2
	xnorcc	%o5,	%g3,	%i5
	tsubcc	%g5,	%l2,	%g4
	edge16ln	%l1,	%i3,	%i1
	fmovda	%icc,	%f19,	%f0
	set	0x10, %o5
	ldda	[%l7 + %o5] 0x23,	%o2
	set	0x74, %g4
	sta	%f14,	[%l7 + %g4] 0x10
	fmovdle	%icc,	%f31,	%f2
	bvc	%icc,	loop_2193
	lduw	[%l7 + 0x38],	%o4
	taddcctv	%l4,	0x148D,	%l6
	edge8l	%g6,	%i6,	%i2
loop_2193:
	fmovsleu	%xcc,	%f20,	%f13
	fpackfix	%f2,	%f14
	fnor	%f4,	%f28,	%f8
	fmovrsgez	%o0,	%f2,	%f26
	xor	%l0,	%i4,	%o2
	add	%o1,	%g1,	%g7
	ldsh	[%l7 + 0x62],	%o7
	fsrc1s	%f24,	%f23
	tn	%xcc,	0x2
	xnorcc	%g2,	%l3,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i0,	%l5,	%o5
	fmovrde	%o6,	%f4,	%f10
	tg	%icc,	0x4
	movneg	%xcc,	%i5,	%g5
	edge8ln	%l2,	%g4,	%g3
	fbue	%fcc2,	loop_2194
	fmovdgu	%icc,	%f31,	%f2
	fmovd	%f2,	%f6
	umul	%i3,	0x15FF,	%l1
loop_2194:
	bne,pt	%xcc,	loop_2195
	tcs	%xcc,	0x4
	udiv	%o3,	0x11E0,	%o4
	ldub	[%l7 + 0x2B],	%l4
loop_2195:
	move	%icc,	%i1,	%g6
	bge,a	loop_2196
	bvc,a,pn	%icc,	loop_2197
	sra	%i6,	%i2,	%l6
	tgu	%icc,	0x7
loop_2196:
	prefetch	[%l7 + 0x10],	 0x3
loop_2197:
	or	%l0,	0x0841,	%o0
	tsubcctv	%i4,	0x00BF,	%o2
	swap	[%l7 + 0x0C],	%g1
	add	%g7,	0x049A,	%o7
	fbuge	%fcc2,	loop_2198
	orncc	%g2,	0x192F,	%o1
	tgu	%xcc,	0x4
	sdiv	%i7,	0x1837,	%i0
loop_2198:
	tpos	%xcc,	0x3
	movvc	%icc,	%l3,	%l5
	edge8n	%o5,	%i5,	%o6
	fxor	%f20,	%f28,	%f22
	tvs	%xcc,	0x6
	tpos	%xcc,	0x5
	alignaddrl	%g5,	%l2,	%g4
	xor	%g3,	0x1199,	%i3
	set	0x49, %l3
	ldsba	[%l7 + %l3] 0x80,	%o3
	fba	%fcc0,	loop_2199
	udiv	%o4,	0x0BB7,	%l1
	tleu	%xcc,	0x2
	tvc	%xcc,	0x0
loop_2199:
	sethi	0x0906,	%i1
	fbg,a	%fcc1,	loop_2200
	fmul8sux16	%f8,	%f14,	%f18
	be,pt	%icc,	loop_2201
	xnorcc	%l4,	%g6,	%i6
loop_2200:
	brgz,a	%i2,	loop_2202
	sethi	0x0368,	%l6
loop_2201:
	fmovsneg	%icc,	%f19,	%f4
	fmovsneg	%xcc,	%f15,	%f15
loop_2202:
	fmovdneg	%xcc,	%f18,	%f15
	sdivx	%o0,	0x0901,	%l0
	subc	%i4,	%g1,	%o2
	alignaddr	%g7,	%g2,	%o7
	nop
	setx	0x3264E45A2072B276,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	addcc	%o1,	%i7,	%l3
	brnz	%i0,	loop_2203
	brnz	%l5,	loop_2204
	fandnot1s	%f22,	%f25,	%f20
	movrlez	%o5,	0x023,	%i5
loop_2203:
	subcc	%g5,	0x0D9F,	%l2
loop_2204:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o6,	%g3
	bne,pt	%xcc,	loop_2205
	ldsb	[%l7 + 0x64],	%i3
	tpos	%icc,	0x2
	mulscc	%o3,	%g4,	%o4
loop_2205:
	sra	%l1,	%l4,	%i1
	tge	%xcc,	0x0
	bleu,pt	%icc,	loop_2206
	nop
	fitos	%f1,	%f11
	fstod	%f11,	%f6
	fba,a	%fcc0,	loop_2207
	nop
	setx	0x1AA64846,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x2331F48C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f25,	%f5
loop_2206:
	fnot2s	%f2,	%f27
	prefetch	[%l7 + 0x3C],	 0x0
loop_2207:
	fmovrdgez	%g6,	%f4,	%f28
	brgz	%i2,	loop_2208
	fmovdpos	%xcc,	%f0,	%f1
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x2A] %asi,	%i6
loop_2208:
	ld	[%l7 + 0x24],	%f21
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x13] %asi,	%o0
	fnegs	%f24,	%f0
	andn	%l6,	%i4,	%l0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x2C] %asi,	%o2
	movgu	%xcc,	%g7,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g1,	0x0CD6,	%o7
	movcc	%icc,	%i7,	%o1
	movg	%icc,	%l3,	%l5
	tgu	%icc,	0x0
	edge32	%i0,	%i5,	%g5
	bcc	loop_2209
	nop
	setx	loop_2210,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tn	%icc,	0x1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%o5
loop_2209:
	fone	%f22
loop_2210:
	stw	%l2,	[%l7 + 0x2C]
	fbue	%fcc1,	loop_2211
	umul	%g3,	%o6,	%i3
	movpos	%xcc,	%g4,	%o4
	movle	%icc,	%l1,	%l4
loop_2211:
	orncc	%i1,	%g6,	%o3
	movcs	%xcc,	%i2,	%o0
	tn	%icc,	0x1
	xnorcc	%l6,	%i4,	%i6
	fmovdgu	%icc,	%f13,	%f1
	bpos,pn	%icc,	loop_2212
	ldsh	[%l7 + 0x48],	%l0
	fbo,a	%fcc2,	loop_2213
	brgez	%o2,	loop_2214
loop_2212:
	andncc	%g7,	%g2,	%o7
	movg	%xcc,	%i7,	%g1
loop_2213:
	nop
	set	0x320, %o3
	nop 	! 	stxa	%o1,	[%g0 + %o3] 0x40 ripped by fixASI40.pl
loop_2214:
	xnorcc	%l3,	0x11E9,	%i0
	fmovrdlez	%l5,	%f28,	%f2
	bcs,a	loop_2215
	fmovd	%f4,	%f16
	ta	%icc,	0x2
	call	loop_2216
loop_2215:
	xnorcc	%g5,	%i5,	%l2
	ldd	[%l7 + 0x48],	%f14
	fmovdle	%xcc,	%f11,	%f5
loop_2216:
	andcc	%o5,	0x1C67,	%g3
	std	%f8,	[%l7 + 0x78]
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x48] %asi,	%f12
	movge	%icc,	%o6,	%i3
	addcc	%o4,	0x130D,	%l1
	edge16n	%g4,	%i1,	%g6
	sll	%o3,	0x01,	%l4
	movrgez	%i2,	0x062,	%o0
	popc	0x01B6,	%l6
	orcc	%i4,	%i6,	%l0
	tpos	%icc,	0x1
	ble,a,pn	%xcc,	loop_2217
	move	%icc,	%g7,	%o2
	ldd	[%l7 + 0x50],	%f2
	movgu	%icc,	%g2,	%i7
loop_2217:
	nop
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
	orn	%o1,	0x0F56,	%g1
	edge8l	%i0,	%l3,	%l5
	brgez,a	%g5,	loop_2218
	smulcc	%l2,	%o5,	%i5
	array8	%o6,	%g3,	%i3
	xorcc	%o4,	%l1,	%i1
loop_2218:
	tne	%xcc,	0x6
	fbo	%fcc1,	loop_2219
	umulcc	%g4,	0x125F,	%g6
	or	%l4,	%i2,	%o0
	fxors	%f29,	%f31,	%f7
loop_2219:
	tsubcc	%o3,	0x13A1,	%i4
	srlx	%i6,	0x11,	%l0
	tleu	%xcc,	0x3
	umul	%l6,	0x11CE,	%o2
	edge32	%g2,	%g7,	%o7
	tcs	%xcc,	0x3
	add	%o1,	0x15BE,	%g1
	andn	%i0,	%i7,	%l5
	array16	%l3,	%l2,	%o5
	fsrc2s	%f6,	%f23
	fmovrse	%g5,	%f22,	%f28
	alignaddrl	%i5,	%g3,	%o6
	fmovs	%f3,	%f31
	array16	%i3,	%l1,	%i1
	fmovrsgz	%o4,	%f19,	%f30
	orn	%g6,	%l4,	%g4
	movrlz	%o0,	%o3,	%i2
	bpos,pt	%icc,	loop_2220
	edge16l	%i6,	%l0,	%l6
	fmovrdne	%i4,	%f30,	%f16
	srl	%g2,	0x19,	%o2
loop_2220:
	fcmpeq16	%f22,	%f6,	%g7
	movrne	%o1,	0x1A9,	%o7
	fpsub32	%f30,	%f24,	%f18
	nop
	setx	0x2C41B963,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xBA63BA3E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f19,	%f16
	movg	%icc,	%i0,	%i7
	movcc	%xcc,	%l5,	%g1
	orncc	%l2,	%o5,	%g5
	bvc,pt	%xcc,	loop_2221
	prefetch	[%l7 + 0x30],	 0x1
	fornot1	%f4,	%f28,	%f30
	bn,a,pn	%icc,	loop_2222
loop_2221:
	or	%i5,	0x131F,	%l3
	movrgez	%g3,	%o6,	%l1
	fors	%f11,	%f1,	%f29
loop_2222:
	nop
	fitos	%f10,	%f25
	fstox	%f25,	%f6
	fxtos	%f6,	%f13
	fmovsgu	%xcc,	%f16,	%f25
	udivcc	%i1,	0x0603,	%i3
	mulscc	%o4,	0x1C82,	%l4
	nop
	setx	0x73F4594B075E9F7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xE91D0E484428E7CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f4,	%f2
	fnot2	%f0,	%f12
	fcmpeq32	%f4,	%f30,	%g6
	tvc	%icc,	0x5
	mova	%xcc,	%g4,	%o0
	xnor	%i2,	%o3,	%l0
	fands	%f20,	%f12,	%f21
	brgez,a	%l6,	loop_2223
	fornot1s	%f2,	%f14,	%f14
	stw	%i4,	[%l7 + 0x08]
	movrlez	%i6,	%g2,	%o2
loop_2223:
	fandnot1	%f20,	%f2,	%f14
	movvc	%xcc,	%g7,	%o7
	tneg	%icc,	0x2
	sir	0x0C7F
	fornot2s	%f7,	%f0,	%f18
	tcc	%icc,	0x5
	brgez	%o1,	loop_2224
	xor	%i7,	%i0,	%g1
	brgz	%l5,	loop_2225
	movrgz	%l2,	%g5,	%i5
loop_2224:
	movrlz	%l3,	0x323,	%g3
	taddcctv	%o5,	%o6,	%l1
loop_2225:
	addccc	%i1,	0x0FF8,	%i3
	tne	%icc,	0x3
	movl	%xcc,	%o4,	%g6
	tcc	%icc,	0x3
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x62] %asi,	%l4
	fones	%f9
	tg	%xcc,	0x1
	sra	%o0,	%i2,	%g4
	movrlez	%o3,	%l0,	%i4
	edge8n	%l6,	%i6,	%g2
	fblg	%fcc0,	loop_2226
	and	%g7,	0x1EBC,	%o7
	sll	%o2,	%i7,	%i0
	tle	%xcc,	0x6
loop_2226:
	edge32n	%o1,	%l5,	%l2
	fbn,a	%fcc2,	loop_2227
	fblg	%fcc2,	loop_2228
	mulx	%g1,	%i5,	%l3
	tpos	%icc,	0x4
loop_2227:
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f26
loop_2228:
	array32	%g3,	%o5,	%o6
	tvs	%icc,	0x3
	alignaddr	%g5,	%l1,	%i1
	orncc	%o4,	%g6,	%i3
	bneg,pt	%icc,	loop_2229
	xnor	%o0,	%i2,	%l4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%g4
loop_2229:
	smulcc	%l0,	%o3,	%i4
	sra	%i6,	0x14,	%g2
	edge16n	%g7,	%l6,	%o7
	ble,a	%xcc,	loop_2230
	array32	%o2,	%i0,	%i7
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f10
	fxtod	%f10,	%f30
	fmovsl	%icc,	%f11,	%f13
loop_2230:
	brz,a	%o1,	loop_2231
	subc	%l5,	%g1,	%i5
	movvs	%xcc,	%l2,	%g3
	edge8n	%o5,	%l3,	%o6
loop_2231:
	movre	%g5,	0x302,	%l1
	addccc	%o4,	0x153C,	%g6
	edge32l	%i3,	%i1,	%i2
	srax	%l4,	0x0D,	%g4
	movcs	%xcc,	%o0,	%o3
	movre	%l0,	0x30E,	%i6
	andcc	%g2,	0x1D98,	%g7
	fornot1	%f8,	%f24,	%f2
	fmovdg	%xcc,	%f29,	%f30
	set	0x18, %l4
	stwa	%i4,	[%l7 + %l4] 0x88
	fmovda	%xcc,	%f0,	%f5
	te	%icc,	0x3
	ble	loop_2232
	faligndata	%f22,	%f20,	%f30
	subccc	%l6,	0x0A3F,	%o2
	fpsub32s	%f29,	%f16,	%f0
loop_2232:
	fbg	%fcc3,	loop_2233
	movvc	%icc,	%o7,	%i0
	nop
	fitos	%f1,	%f21
	fstox	%f21,	%f12
	fxtos	%f12,	%f25
	fbge	%fcc3,	loop_2234
loop_2233:
	umulcc	%i7,	0x053E,	%o1
	bge,a	loop_2235
	ble	%xcc,	loop_2236
loop_2234:
	fmovscc	%xcc,	%f15,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2235:
	movneg	%icc,	%g1,	%l5
loop_2236:
	tneg	%xcc,	0x7
	udivx	%l2,	0x04A1,	%i5
	alignaddr	%g3,	%l3,	%o6
	movle	%icc,	%g5,	%l1
	stbar
	popc	%o4,	%g6
	fbge,a	%fcc3,	loop_2237
	fmovrsgz	%i3,	%f28,	%f15
	array32	%i1,	%i2,	%l4
	fbl,a	%fcc2,	loop_2238
loop_2237:
	movvc	%icc,	%g4,	%o5
	tg	%xcc,	0x1
	set	0x18, %o1
	stwa	%o0,	[%l7 + %o1] 0x04
loop_2238:
	ldsw	[%l7 + 0x1C],	%l0
	sll	%i6,	0x1A,	%o3
	smul	%g7,	0x1FF0,	%i4
	addccc	%g2,	0x0399,	%o2
	tne	%xcc,	0x3
	bcs,a,pn	%xcc,	loop_2239
	movgu	%xcc,	%l6,	%o7
	fandnot2s	%f11,	%f22,	%f24
	smulcc	%i7,	0x045E,	%i0
loop_2239:
	popc	%o1,	%g1
	movgu	%xcc,	%l2,	%i5
	fbul,a	%fcc2,	loop_2240
	movcs	%icc,	%g3,	%l3
	tg	%xcc,	0x1
	ldd	[%l7 + 0x40],	%f10
loop_2240:
	movrlez	%o6,	0x017,	%l5
	tleu	%xcc,	0x2
	fcmpgt16	%f16,	%f16,	%l1
	orcc	%g5,	%o4,	%i3
	edge32	%i1,	%i2,	%g6
	edge8ln	%g4,	%o5,	%o0
	umulcc	%l0,	0x1651,	%i6
	tvc	%icc,	0x5
	subcc	%l4,	0x0B1D,	%g7
	fmovsge	%icc,	%f20,	%f12
	fmovrdne	%i4,	%f4,	%f12
	mulscc	%o3,	%o2,	%l6
	brnz,a	%o7,	loop_2241
	ldub	[%l7 + 0x0F],	%i7
	fbue,a	%fcc3,	loop_2242
	fmovrslz	%i0,	%f23,	%f19
loop_2241:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x80,	%o1,	%g2
loop_2242:
	or	%l2,	%g1,	%g3
	movg	%xcc,	%l3,	%i5
	brlez	%o6,	loop_2243
	movrlez	%l1,	%g5,	%o4
	subc	%i3,	%i1,	%l5
	fnor	%f18,	%f6,	%f24
loop_2243:
	smul	%i2,	0x02F7,	%g6
	fbo	%fcc1,	loop_2244
	movge	%icc,	%g4,	%o5
	xnorcc	%o0,	0x136B,	%l0
	movneg	%xcc,	%l4,	%g7
loop_2244:
	movl	%icc,	%i6,	%i4
	move	%icc,	%o3,	%l6
	ldx	[%l7 + 0x20],	%o2
	tpos	%icc,	0x6
	edge8ln	%i7,	%o7,	%i0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7A] %asi,	%o1
	tl	%icc,	0x0
	alignaddr	%l2,	%g2,	%g1
	sllx	%g3,	0x0F,	%l3
	fmovsne	%icc,	%f25,	%f30
	tcs	%icc,	0x3
	tpos	%xcc,	0x3
	wr	%g0,	0x52,	%asi
	stxa	%o6,	[%g0 + 0x218] %asi
	fmovsa	%xcc,	%f5,	%f4
	srax	%l1,	%g5,	%o4
	taddcc	%i3,	%i1,	%i5
	call	loop_2245
	tg	%icc,	0x1
	movle	%icc,	%l5,	%i2
	ba,pt	%xcc,	loop_2246
loop_2245:
	tsubcc	%g6,	0x11E8,	%o5
	movne	%xcc,	%o0,	%l0
	fble	%fcc2,	loop_2247
loop_2246:
	smulcc	%l4,	0x1C23,	%g4
	bvs	%icc,	loop_2248
	tcs	%icc,	0x6
loop_2247:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g7,	%i4
loop_2248:
	fpsub16	%f14,	%f28,	%f24
	sdivx	%i6,	0x13A5,	%l6
	add	%o3,	0x0F8A,	%o2
	nop
	fitos	%f10,	%f3
	fstox	%f3,	%f26
	fxtos	%f26,	%f25
	nop
	setx	0x75B28E0E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xD6AA887E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f20,	%f6
	movle	%xcc,	%o7,	%i7
	nop
	setx	loop_2249,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%i0,	%o1,	%g2
	movle	%icc,	%l2,	%g1
	addcc	%l3,	%o6,	%l1
loop_2249:
	brlz	%g5,	loop_2250
	fandnot1	%f20,	%f10,	%f18
	fornot1s	%f3,	%f26,	%f16
	bleu,a,pn	%xcc,	loop_2251
loop_2250:
	nop
	fitod	%f6,	%f28
	fdtox	%f28,	%f8
	movrne	%g3,	0x199,	%i3
	set	0x27, %g5
	ldstuba	[%l7 + %g5] 0x10,	%o4
loop_2251:
	fcmpeq32	%f16,	%f22,	%i1
	fbue	%fcc2,	loop_2252
	movg	%xcc,	%l5,	%i5
	array32	%g6,	%i2,	%o0
	set	0x68, %o2
	stxa	%l0,	[%l7 + %o2] 0x2a
	membar	#Sync
loop_2252:
	nop
	setx	0xB5A56FB8FD68D3B1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x2DA0A7200936B35A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f14,	%f12
	fpackfix	%f10,	%f7
	fornot2	%f28,	%f2,	%f10
	ba,a,pn	%icc,	loop_2253
	st	%f14,	[%l7 + 0x28]
	fmovd	%f28,	%f8
	umulcc	%o5,	0x1D7F,	%g4
loop_2253:
	movge	%icc,	%l4,	%i4
	srax	%g7,	0x12,	%i6
	sdivx	%l6,	0x0EF2,	%o2
	fands	%f2,	%f3,	%f10
	sdiv	%o7,	0x0AEB,	%o3
	addc	%i0,	0x1281,	%i7
	bgu	loop_2254
	xorcc	%g2,	%l2,	%o1
	movcs	%icc,	%g1,	%o6
	move	%icc,	%l1,	%l3
loop_2254:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x08] %asi,	%f22
	fbuge	%fcc3,	loop_2255
	sdivx	%g3,	0x10F8,	%g5
	bcc,a	%icc,	loop_2256
	fmovrdlez	%o4,	%f26,	%f22
loop_2255:
	tsubcc	%i3,	0x096B,	%l5
	fbge,a	%fcc2,	loop_2257
loop_2256:
	edge32ln	%i1,	%g6,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o0,	%i2,	%o5
loop_2257:
	fbul,a	%fcc1,	loop_2258
	add	%l0,	%l4,	%i4
	stw	%g7,	[%l7 + 0x40]
	fmovsneg	%icc,	%f18,	%f30
loop_2258:
	swap	[%l7 + 0x10],	%g4
	membar	0x40
	andcc	%i6,	%l6,	%o7
	srax	%o3,	0x0E,	%i0
	nop
	setx	0x31BBA80B08D7C40F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xE1A1A1A397C891E1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f4,	%f4
	be,a	loop_2259
	fornot2s	%f27,	%f19,	%f30
	ld	[%l7 + 0x68],	%f30
	call	loop_2260
loop_2259:
	fblg	%fcc3,	loop_2261
	addccc	%i7,	0x0EE5,	%o2
	be,pt	%xcc,	loop_2262
loop_2260:
	movrgez	%g2,	0x11E,	%l2
loop_2261:
	tge	%xcc,	0x2
	movn	%icc,	%o1,	%g1
loop_2262:
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f28
	fxtod	%f28,	%f10
	movcc	%xcc,	%o6,	%l1
	subc	%g3,	%l3,	%g5
	movl	%icc,	%i3,	%l5
	umulcc	%o4,	%g6,	%i1
	sra	%i5,	0x14,	%i2
	edge32ln	%o5,	%o0,	%l0
	fmovsne	%xcc,	%f16,	%f22
	fones	%f20
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x31] %asi,	%l4
	umul	%g7,	%g4,	%i4
	nop
	setx	loop_2263,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	for	%f28,	%f0,	%f8
	xnorcc	%i6,	%l6,	%o3
	movrlz	%i0,	%i7,	%o2
loop_2263:
	tgu	%xcc,	0x3
	edge8	%g2,	%o7,	%l2
	mulx	%o1,	0x033A,	%g1
	add	%l1,	%g3,	%o6
	sdivcc	%l3,	0x0824,	%g5
	edge32	%l5,	%o4,	%g6
	edge8	%i1,	%i3,	%i2
	tsubcctv	%i5,	%o0,	%o5
	movcc	%xcc,	%l0,	%g7
	brlz,a	%g4,	loop_2264
	nop
	setx	0xF86908C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f15
	umulcc	%i4,	0x0E32,	%l4
	sll	%i6,	0x07,	%o3
loop_2264:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x370] %asi,	%l6 ripped by fixASI40.pl ripped by fixASI40.pl
	array8	%i7,	%o2,	%i0
	nop
	fitod	%f12,	%f14
	fdtoi	%f14,	%f9
	fmovdvs	%xcc,	%f14,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,pt	%icc,	loop_2265
	sdivx	%g2,	0x1ACA,	%o7
	tg	%icc,	0x7
	tg	%xcc,	0x2
loop_2265:
	smulcc	%o1,	%g1,	%l1
	set	0x1F, %i1
	stba	%g3,	[%l7 + %i1] 0x80
	fbu	%fcc2,	loop_2266
	xnorcc	%o6,	0x0E8D,	%l2
	tne	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x50] %asi,	%g5
loop_2266:
	edge32l	%l5,	%l3,	%g6
	movrgez	%o4,	%i3,	%i1
	tcs	%icc,	0x7
	tge	%icc,	0x4
	fmovdle	%icc,	%f17,	%f4
	array8	%i5,	%i2,	%o5
	fbu	%fcc2,	loop_2267
	sub	%o0,	%l0,	%g4
	sllx	%i4,	0x08,	%l4
	fmovsge	%icc,	%f21,	%f31
loop_2267:
	brlz,a	%g7,	loop_2268
	umulcc	%o3,	0x0F70,	%i6
	nop
	setx	0x8054D2C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x066038CC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f4,	%f27
	edge16ln	%i7,	%l6,	%i0
loop_2268:
	fmovd	%f16,	%f28
	membar	0x18
	edge16ln	%g2,	%o7,	%o2
	fbge	%fcc1,	loop_2269
	srl	%g1,	%l1,	%g3
	nop
	setx	0x2A2D5BF3705614F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	smul	%o6,	0x1C3D,	%l2
loop_2269:
	tne	%xcc,	0x5
	fmovdle	%xcc,	%f14,	%f28
	tge	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g5,	%o1
	fmovsvs	%xcc,	%f26,	%f18
	nop
	fitos	%f0,	%f22
	fstod	%f22,	%f6
	sethi	0x1166,	%l3
	mulscc	%l5,	%o4,	%g6
	fmovdcc	%icc,	%f7,	%f26
	ldstub	[%l7 + 0x6A],	%i1
	taddcctv	%i3,	0x1984,	%i5
	smul	%o5,	%i2,	%l0
	movrlz	%g4,	%o0,	%i4
	mulscc	%g7,	%l4,	%i6
	ba,a	%icc,	loop_2270
	tcs	%icc,	0x3
	andncc	%o3,	%l6,	%i7
	edge16n	%g2,	%i0,	%o2
loop_2270:
	ble,a,pn	%xcc,	loop_2271
	movrgz	%g1,	%l1,	%g3
	sir	0x1DD5
	tleu	%xcc,	0x3
loop_2271:
	nop
	setx	0xC069B826,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	movge	%xcc,	%o7,	%l2
	ldsb	[%l7 + 0x10],	%o6
	umul	%g5,	%o1,	%l5
	orcc	%l3,	%g6,	%o4
	addcc	%i3,	0x0664,	%i1
	fmovsneg	%xcc,	%f17,	%f3
	add	%i5,	0x1FFA,	%i2
	fmovsvc	%xcc,	%f31,	%f11
	fbne,a	%fcc2,	loop_2272
	bcs,pt	%icc,	loop_2273
	fbl	%fcc2,	loop_2274
	movrgez	%l0,	%o5,	%g4
loop_2272:
	movleu	%xcc,	%o0,	%g7
loop_2273:
	addccc	%i4,	0x1676,	%i6
loop_2274:
	fbge,a	%fcc1,	loop_2275
	subcc	%l4,	0x11FD,	%l6
	taddcctv	%o3,	0x033F,	%i7
	nop
	setx	0x326C0FD54D5FDDA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB36E748BE82C77EE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f16,	%f28
loop_2275:
	fexpand	%f28,	%f4
	alignaddr	%g2,	%o2,	%g1
	set	0x2F, %l2
	ldsba	[%l7 + %l2] 0x18,	%l1
	fxors	%f1,	%f9,	%f30
	fmul8x16au	%f16,	%f29,	%f20
	fmovsn	%icc,	%f8,	%f2
	fba,a	%fcc1,	loop_2276
	sll	%g3,	%i0,	%o7
	nop
	setx	0xACBF6179,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x61687237,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f25,	%f28
	stx	%o6,	[%l7 + 0x68]
loop_2276:
	xnorcc	%l2,	0x1987,	%o1
	movn	%xcc,	%l5,	%l3
	fcmpeq16	%f4,	%f20,	%g6
	ld	[%l7 + 0x4C],	%f20
	fbge,a	%fcc1,	loop_2277
	te	%xcc,	0x2
	set	0x4C, %l6
	stba	%o4,	[%l7 + %l6] 0xe3
	membar	#Sync
loop_2277:
	orncc	%g5,	0x0998,	%i1
	tg	%xcc,	0x7
	tneg	%xcc,	0x1
	tcs	%xcc,	0x5
	edge32l	%i3,	%i5,	%l0
	mova	%xcc,	%i2,	%o5
	ba	%icc,	loop_2278
	addccc	%o0,	0x07BA,	%g4
	wr	%g0,	0x0c,	%asi
	stxa	%g7,	[%l7 + 0x28] %asi
loop_2278:
	call	loop_2279
	movrlz	%i6,	0x0BC,	%l4
	ta	%xcc,	0x5
	fmovdvs	%xcc,	%f11,	%f11
loop_2279:
	fmovrdlez	%l6,	%f8,	%f28
	or	%o3,	%i4,	%g2
	ble,a,pt	%icc,	loop_2280
	nop
	set	0x10, %o4
	ldx	[%l7 + %o4],	%o2
	tl	%icc,	0x0
	mulx	%g1,	%l1,	%g3
loop_2280:
	edge16l	%i7,	%o7,	%o6
	mulscc	%i0,	%l2,	%o1
	stbar
	orn	%l3,	%g6,	%l5
	fmovsleu	%xcc,	%f16,	%f16
	tvs	%xcc,	0x1
	smul	%g5,	%o4,	%i3
	fbuge	%fcc1,	loop_2281
	andn	%i5,	0x1189,	%l0
	be,pt	%icc,	loop_2282
	fmovrde	%i2,	%f2,	%f16
loop_2281:
	fmovdg	%xcc,	%f18,	%f15
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf9
	membar	#Sync
loop_2282:
	orncc	%i1,	%o5,	%o0
	movvc	%icc,	%g4,	%i6
	movcs	%xcc,	%l4,	%g7
	tcs	%xcc,	0x3
	fmovrde	%o3,	%f18,	%f28
	fabsd	%f26,	%f6
	nop
	setx loop_2283, %l0, %l1
	jmpl %l1, %l6
	alignaddrl	%i4,	%g2,	%g1
	srax	%o2,	%g3,	%l1
	xor	%i7,	0x04E6,	%o6
loop_2283:
	tvc	%icc,	0x0
	fcmpgt16	%f18,	%f8,	%o7
	srl	%l2,	0x1A,	%o1
	fmovdvc	%xcc,	%f7,	%f0
	addccc	%i0,	0x1D09,	%g6
	fabss	%f15,	%f27
	orn	%l3,	%l5,	%g5
	ldub	[%l7 + 0x18],	%o4
	fnegs	%f10,	%f5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i5,	%i3
	movvc	%xcc,	%i2,	%l0
	addccc	%o5,	%o0,	%g4
	xnorcc	%i6,	0x1A37,	%i1
	subc	%l4,	%g7,	%o3
	ta	%xcc,	0x6
	tcs	%icc,	0x7
	bge,a,pn	%xcc,	loop_2284
	sllx	%i4,	%g2,	%g1
	edge16ln	%l6,	%o2,	%g3
	call	loop_2285
loop_2284:
	mova	%xcc,	%i7,	%l1
	addcc	%o7,	0x17CC,	%l2
	smulcc	%o6,	0x097C,	%i0
loop_2285:
	array8	%o1,	%g6,	%l3
	tsubcc	%g5,	0x0979,	%o4
	fpackfix	%f8,	%f23
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%i5
	te	%icc,	0x4
	tleu	%xcc,	0x3
	nop
	fitos	%f9,	%f1
	fstox	%f1,	%f6
	fxtos	%f6,	%f0
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x14
	fzeros	%f16
	addcc	%i3,	%l5,	%i2
	fmovsg	%icc,	%f19,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a,pt	%xcc,	loop_2286
	movcs	%icc,	%o5,	%l0
	edge16	%g4,	%o0,	%i6
	movcs	%xcc,	%i1,	%g7
loop_2286:
	brgz,a	%l4,	loop_2287
	fble,a	%fcc0,	loop_2288
	tsubcc	%i4,	0x1E47,	%o3
	fba	%fcc3,	loop_2289
loop_2287:
	fmovdcc	%xcc,	%f4,	%f30
loop_2288:
	edge16	%g2,	%g1,	%l6
	orn	%g3,	%i7,	%l1
loop_2289:
	sll	%o7,	%l2,	%o2
	swap	[%l7 + 0x6C],	%i0
	edge32	%o6,	%o1,	%g6
	nop
	setx	loop_2290,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0xDBF35244,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xE31377B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f20,	%f22
	ld	[%l7 + 0x78],	%f27
	stx	%g5,	[%l7 + 0x48]
loop_2290:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x4
	bvc,pn	%xcc,	loop_2291
	addccc	%l3,	0x1775,	%o4
	orcc	%i5,	0x091D,	%l5
	sth	%i3,	[%l7 + 0x7A]
loop_2291:
	fbg,a	%fcc1,	loop_2292
	smulcc	%o5,	0x19A8,	%l0
	bn	loop_2293
	edge8n	%i2,	%o0,	%g4
loop_2292:
	alignaddr	%i1,	%i6,	%g7
	orn	%i4,	%o3,	%g2
loop_2293:
	movn	%icc,	%l4,	%l6
	movrlz	%g1,	%i7,	%g3
	bshuffle	%f4,	%f22,	%f6
	subc	%o7,	0x0831,	%l1
	tl	%icc,	0x5
	set	0x20, %l5
	stha	%o2,	[%l7 + %l5] 0x2b
	membar	#Sync
	subccc	%l2,	0x006E,	%o6
	nop
	fitos	%f0,	%f15
	fstod	%f15,	%f22
	mulscc	%o1,	%g6,	%i0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x71] %asi,	%g5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%o4,	%l3
	xnor	%i5,	0x0A62,	%i3
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x1e,	%f16
	udivcc	%l5,	0x1790,	%o5
	tpos	%xcc,	0x5
	movre	%l0,	%o0,	%i2
	movvs	%xcc,	%i1,	%g4
	add	%g7,	0x10FD,	%i4
	movrne	%i6,	0x2F8,	%g2
	movvs	%icc,	%o3,	%l6
	ldd	[%l7 + 0x50],	%g0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i7,	%l4
	fmovdvs	%xcc,	%f23,	%f3
	fmovdl	%xcc,	%f31,	%f29
	movcc	%xcc,	%g3,	%o7
	nop
	setx	0x66148C19EBC68EFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x17FAAC7534B814A5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f20,	%f0
	fbuge	%fcc0,	loop_2294
	tvc	%xcc,	0x6
	subccc	%o2,	0x01E7,	%l2
	fornot1s	%f6,	%f18,	%f18
loop_2294:
	sllx	%l1,	0x00,	%o6
	taddcctv	%o1,	0x07FB,	%i0
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%g6
	udivx	%g5,	0x1615,	%o4
	fandnot1s	%f16,	%f28,	%f8
	fmovsleu	%icc,	%f31,	%f0
	movne	%xcc,	%i5,	%l3
	tcc	%xcc,	0x6
	edge8	%i3,	%l5,	%o5
	stbar
	and	%l0,	0x10AE,	%o0
	edge32ln	%i1,	%g4,	%g7
	xorcc	%i4,	0x128D,	%i2
	tg	%xcc,	0x1
	fmovrsgez	%g2,	%f28,	%f17
	fmul8x16al	%f2,	%f10,	%f8
	fmul8sux16	%f2,	%f28,	%f0
	srax	%o3,	%i6,	%l6
	taddcc	%g1,	0x1520,	%i7
	bne,a	%xcc,	loop_2295
	array16	%l4,	%g3,	%o2
	movge	%xcc,	%o7,	%l1
	xor	%o6,	0x1C43,	%l2
loop_2295:
	tle	%icc,	0x2
	popc	%i0,	%g6
	edge32n	%g5,	%o1,	%i5
	movle	%xcc,	%l3,	%i3
	tn	%icc,	0x6
	sdiv	%o4,	0x0B3E,	%o5
	movrgz	%l0,	0x1ED,	%l5
	te	%icc,	0x3
	edge8n	%i1,	%o0,	%g7
	movgu	%icc,	%g4,	%i2
	fmovrdne	%i4,	%f8,	%f20
	fsrc1	%f6,	%f6
	sdivcc	%g2,	0x0EAD,	%i6
	mulx	%o3,	%l6,	%i7
	fmovrsne	%l4,	%f11,	%f19
	fabsd	%f4,	%f20
	udiv	%g3,	0x067D,	%g1
	tneg	%icc,	0x7
	popc	0x1D8A,	%o7
	movgu	%xcc,	%o2,	%o6
	nop
	fitod	%f10,	%f12
	fmovrslz	%l1,	%f13,	%f3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x5B] %asi,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,pt	%icc,	loop_2296
	tpos	%icc,	0x5
	ldsh	[%l7 + 0x10],	%l2
	movrgz	%g6,	%g5,	%i5
loop_2296:
	sll	%l3,	0x09,	%o1
	be,a,pt	%icc,	loop_2297
	fmovdcs	%icc,	%f11,	%f6
	movvs	%xcc,	%o4,	%i3
	mulscc	%o5,	0x1ABE,	%l0
loop_2297:
	tle	%icc,	0x4
	orcc	%i1,	%o0,	%g7
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f14
	fxtod	%f14,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%icc,	%f0,	%f29
	move	%xcc,	%g4,	%l5
	fpsub16s	%f11,	%f11,	%f12
	edge16	%i2,	%i4,	%g2
	tpos	%xcc,	0x4
	fabss	%f18,	%f15
	edge8l	%i6,	%l6,	%i7
	orn	%l4,	0x0CE1,	%g3
	bleu,pt	%xcc,	loop_2298
	fbuge	%fcc3,	loop_2299
	fmovdcs	%icc,	%f20,	%f11
	fxnor	%f0,	%f20,	%f12
loop_2298:
	fmovdneg	%icc,	%f6,	%f27
loop_2299:
	xor	%o3,	0x161F,	%g1
	fmovsa	%icc,	%f28,	%f13
	fandnot1	%f28,	%f14,	%f12
	array8	%o7,	%o6,	%o2
	fcmpne32	%f14,	%f2,	%i0
	set	0x0C, %i6
	stha	%l1,	[%l7 + %i6] 0xea
	membar	#Sync
	edge16l	%l2,	%g6,	%i5
	smul	%l3,	%g5,	%o4
	fmovscs	%xcc,	%f16,	%f11
	tsubcc	%i3,	0x1957,	%o5
	tpos	%icc,	0x5
	movrgez	%l0,	0x1A4,	%i1
	xorcc	%o0,	%o1,	%g7
	tvs	%icc,	0x1
	stbar
	brnz	%g4,	loop_2300
	tpos	%xcc,	0x2
	fnot2s	%f30,	%f1
	nop
	fitos	%f10,	%f26
	fstox	%f26,	%f8
loop_2300:
	ldsb	[%l7 + 0x7C],	%i2
	bvs,a,pt	%icc,	loop_2301
	tpos	%xcc,	0x2
	xnorcc	%i4,	0x0AA4,	%l5
	mulx	%i6,	0x037C,	%l6
loop_2301:
	nop
	setx	0x86BB70347852993B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD99CC99054EA84CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f20,	%f6
	flush	%l7 + 0x3C
	swap	[%l7 + 0x54],	%i7
	sdiv	%g2,	0x02B5,	%g3
	edge8n	%l4,	%g1,	%o7
	umul	%o6,	%o2,	%i0
	ldd	[%l7 + 0x68],	%f30
	fmovrsgez	%l1,	%f24,	%f12
	nop
	setx	loop_2302,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd16s	%f7,	%f7,	%f2
	st	%f10,	[%l7 + 0x2C]
	fzeros	%f19
loop_2302:
	and	%o3,	0x0D22,	%g6
	movleu	%icc,	%l2,	%i5
	stx	%g5,	[%l7 + 0x30]
	set	0x20, %l0
	lda	[%l7 + %l0] 0x10,	%f2
	brz,a	%o4,	loop_2303
	edge16	%l3,	%i3,	%o5
	tl	%xcc,	0x3
	movrgez	%l0,	0x3F7,	%i1
loop_2303:
	fxnors	%f18,	%f15,	%f10
	sir	0x0825
	fbe	%fcc3,	loop_2304
	ldsw	[%l7 + 0x38],	%o1
	movge	%xcc,	%o0,	%g7
	set	0x70, %g2
	lduwa	[%l7 + %g2] 0x80,	%g4
loop_2304:
	nop
	setx	0x1A490C90,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xA7CD5E73,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f4,	%f30
	fbn,a	%fcc3,	loop_2305
	xor	%i2,	%i4,	%l5
	fnot1	%f14,	%f30
	edge32	%l6,	%i7,	%i6
loop_2305:
	smul	%g2,	%g3,	%l4
	movvs	%icc,	%o7,	%o6
	udiv	%g1,	0x1ABA,	%o2
	nop
	setx	0xAAAF317655C7B9F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x7111BC2EFD2CDE68,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f14,	%f22
	nop
	setx	0x2044F8C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	nop
	setx	0xC067B858,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	bvc,pt	%icc,	loop_2306
	addcc	%i0,	0x012A,	%l1
	tvc	%xcc,	0x3
	tsubcctv	%o3,	%g6,	%i5
loop_2306:
	nop
	set	0x60, %i4
	ldxa	[%l7 + %i4] 0x19,	%l2
	movcs	%icc,	%g5,	%o4
	fbn	%fcc2,	loop_2307
	ldstub	[%l7 + 0x73],	%i3
	taddcc	%o5,	%l0,	%i1
	edge8ln	%o1,	%o0,	%g7
loop_2307:
	udivx	%g4,	0x1CF1,	%i2
	tpos	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x5A] %asi,	%l3
	pdist	%f10,	%f14,	%f12
	tsubcctv	%i4,	0x08B4,	%l6
	stx	%l5,	[%l7 + 0x10]
	wr	%g0,	0x88,	%asi
	stxa	%i7,	[%l7 + 0x68] %asi
	fbo	%fcc0,	loop_2308
	bl,pt	%icc,	loop_2309
	membar	0x35
	movrlz	%i6,	%g3,	%l4
loop_2308:
	nop
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x20] %asi,	%o7
loop_2309:
	subc	%o6,	0x0AA2,	%g2
	nop
	setx	0xC90B51BD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xC19396BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f21,	%f6
	subccc	%g1,	0x0F97,	%o2
	set	0x210, %i0
	stxa	%i0,	[%g0 + %i0] 0x52
	brz	%o3,	loop_2310
	movleu	%xcc,	%l1,	%g6
	tvc	%xcc,	0x2
	lduh	[%l7 + 0x60],	%l2
loop_2310:
	brlez	%i5,	loop_2311
	ldd	[%l7 + 0x20],	%f28
	tl	%icc,	0x2
	movl	%icc,	%g5,	%o4
loop_2311:
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f24
	xnor	%o5,	0x05AF,	%i3
	fandnot2	%f28,	%f24,	%f0
	fpadd32s	%f2,	%f17,	%f18
	nop
	fitos	%f8,	%f31
	fstox	%f31,	%f18
	movvc	%icc,	%l0,	%i1
	bneg,a,pt	%icc,	loop_2312
	fnegs	%f28,	%f19
	taddcc	%o1,	0x11AC,	%g7
	sra	%o0,	0x11,	%i2
loop_2312:
	edge32l	%g4,	%l3,	%l6
	nop
	setx	loop_2313,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x68],	%f0
	tgu	%xcc,	0x4
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x18] %asi,	%i4
loop_2313:
	fornot2s	%f23,	%f21,	%f24
	nop
	fitod	%f0,	%f18
	fdtoi	%f18,	%f20
	lduw	[%l7 + 0x4C],	%i7
	xnorcc	%i6,	0x155F,	%g3
	taddcc	%l4,	0x1658,	%o7
	tn	%icc,	0x7
	fcmpgt32	%f6,	%f12,	%o6
	array16	%g2,	%l5,	%o2
	movrlz	%i0,	%o3,	%g1
	sir	0x159D
	set	0x64, %l1
	stwa	%l1,	[%l7 + %l1] 0x2b
	membar	#Sync
	movleu	%icc,	%l2,	%i5
	bg,a,pt	%xcc,	loop_2314
	stw	%g6,	[%l7 + 0x50]
	te	%icc,	0x3
	xorcc	%g5,	%o4,	%i3
loop_2314:
	te	%icc,	0x1
	sub	%o5,	0x0B17,	%i1
	andn	%o1,	0x095B,	%l0
	nop
	fitos	%f5,	%f17
	fstox	%f17,	%f6
	fxtos	%f6,	%f20
	tsubcc	%g7,	0x179C,	%i2
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x208] %asi,	%o0
	fmovdpos	%xcc,	%f15,	%f12
	edge16l	%g4,	%l3,	%l6
	sdivcc	%i7,	0x1B34,	%i4
	udivcc	%i6,	0x0150,	%l4
	ta	%icc,	0x3
	edge32	%o7,	%g3,	%g2
	xnor	%o6,	0x05B9,	%l5
	bgu,pn	%icc,	loop_2315
	mulx	%o2,	0x165C,	%o3
	tl	%icc,	0x0
	bcc	%icc,	loop_2316
loop_2315:
	movre	%i0,	%g1,	%l2
	taddcc	%i5,	%l1,	%g6
	xnor	%o4,	0x0B5C,	%i3
loop_2316:
	srax	%o5,	%i1,	%o1
	tsubcc	%l0,	0x0087,	%g5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g7,	%o0
	edge16l	%g4,	%l3,	%l6
	sethi	0x03AB,	%i7
	movrgez	%i2,	0x200,	%i6
	tgu	%xcc,	0x6
	nop
	set	0x08, %i2
	ldsh	[%l7 + %i2],	%l4
	fblg,a	%fcc2,	loop_2317
	movrgez	%i4,	0x290,	%o7
	fmovsvc	%xcc,	%f20,	%f20
	tneg	%xcc,	0x3
loop_2317:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x36] %asi,	%g3
	nop
	setx	0x308C6DA695DF3CE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x72D78542722DB048,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f2,	%f24
	wr	%g0,	0x2a,	%asi
	stwa	%o6,	[%l7 + 0x64] %asi
	membar	#Sync
	move	%xcc,	%l5,	%o2
	sdivx	%o3,	0x0A96,	%i0
	xor	%g2,	0x18F7,	%g1
	movleu	%icc,	%i5,	%l2
	bge,pt	%xcc,	loop_2318
	nop
	setx	0x4044512D,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	stb	%l1,	[%l7 + 0x58]
	movcs	%xcc,	%g6,	%o4
loop_2318:
	fmovdg	%xcc,	%f25,	%f17
	fmovdneg	%icc,	%f29,	%f8
	fmovrdgz	%o5,	%f0,	%f2
	nop
	set	0x3B, %g6
	ldstub	[%l7 + %g6],	%i3
	addccc	%o1,	0x11AD,	%i1
	nop
	setx	0x0059646B,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fcmpne16	%f30,	%f28,	%l0
	fnegd	%f24,	%f8
	flush	%l7 + 0x68
	set	0x60, %o7
	lduha	[%l7 + %o7] 0x14,	%g7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x08] %asi,	%o0
	fornot2s	%f24,	%f11,	%f17
	array8	%g5,	%l3,	%l6
	brnz	%g4,	loop_2319
	tsubcctv	%i2,	%i6,	%l4
	movvc	%xcc,	%i4,	%o7
	call	loop_2320
loop_2319:
	fabss	%f17,	%f8
	movpos	%xcc,	%i7,	%o6
	sdiv	%g3,	0x126F,	%o2
loop_2320:
	tgu	%xcc,	0x5
	sdiv	%l5,	0x0CC4,	%i0
	tcc	%icc,	0x2
	orn	%o3,	0x08EA,	%g1
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x18] %asi,	%i5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g2
	alignaddrl	%l2,	%g6,	%l1
	mulx	%o5,	%o4,	%i3
	tsubcc	%o1,	0x0D01,	%i1
	xor	%l0,	%g7,	%o0
	movrgez	%g5,	0x0CF,	%l6
	tleu	%icc,	0x5
	xor	%l3,	0x1B68,	%g4
	fnot1s	%f6,	%f20
	xnorcc	%i2,	%l4,	%i6
	array16	%i4,	%o7,	%o6
	sdiv	%g3,	0x0B8E,	%o2
	addc	%l5,	0x069E,	%i7
	set	0x10, %o0
	sta	%f22,	[%l7 + %o0] 0x14
	movrlz	%i0,	0x381,	%o3
	xnorcc	%i5,	0x0044,	%g2
	brz	%l2,	loop_2321
	subccc	%g6,	0x1B14,	%g1
	movcc	%xcc,	%o5,	%o4
	edge16l	%l1,	%i3,	%i1
loop_2321:
	fpadd32s	%f28,	%f14,	%f8
	ble,a	loop_2322
	tsubcctv	%l0,	0x1C63,	%g7
	edge16l	%o1,	%o0,	%g5
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f16
loop_2322:
	fbue,a	%fcc0,	loop_2323
	fpadd16	%f14,	%f6,	%f4
	sethi	0x0557,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2323:
	fbu,a	%fcc1,	loop_2324
	srlx	%l3,	0x19,	%g4
	fbne	%fcc2,	loop_2325
	andn	%i2,	0x00A1,	%l4
loop_2324:
	fand	%f18,	%f8,	%f22
	tpos	%xcc,	0x5
loop_2325:
	tle	%icc,	0x1
	tcs	%icc,	0x4
	ldsb	[%l7 + 0x5A],	%i6
	fnor	%f8,	%f24,	%f24
	fand	%f26,	%f0,	%f8
	edge8n	%i4,	%o6,	%o7
	movl	%xcc,	%g3,	%l5
	nop
	setx	loop_2326,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd16s	%f0,	%f3,	%f2
	fmovsvc	%xcc,	%f11,	%f9
	edge32n	%o2,	%i0,	%i7
loop_2326:
	move	%xcc,	%i5,	%g2
	xnorcc	%l2,	%g6,	%g1
	movneg	%icc,	%o3,	%o5
	andncc	%o4,	%i3,	%l1
	sllx	%i1,	0x06,	%g7
	ble	%icc,	loop_2327
	addccc	%l0,	%o1,	%o0
	andncc	%g5,	%l6,	%g4
	tvc	%xcc,	0x5
loop_2327:
	tg	%xcc,	0x6
	sdivcc	%l3,	0x01BF,	%i2
	fmovrsgez	%i6,	%f11,	%f15
	ldub	[%l7 + 0x77],	%l4
	fmovs	%f4,	%f6
	array8	%o6,	%o7,	%g3
	udivx	%l5,	0x0221,	%i4
	orncc	%o2,	0x1103,	%i0
	or	%i5,	0x12D4,	%i7
	andncc	%l2,	%g2,	%g1
	mova	%xcc,	%g6,	%o3
	brlz	%o5,	loop_2328
	brz	%i3,	loop_2329
	tsubcc	%o4,	0x1E7D,	%l1
	addcc	%i1,	%l0,	%o1
loop_2328:
	sra	%g7,	%g5,	%l6
loop_2329:
	sethi	0x0EF9,	%g4
	ldd	[%l7 + 0x58],	%f8
	array8	%l3,	%i2,	%o0
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0xf8
	membar	#Sync
	fmovrsgz	%l4,	%f31,	%f7
	movrlz	%o6,	%i6,	%o7
	addcc	%l5,	%g3,	%i4
	fmovdn	%xcc,	%f10,	%f5
	movrgz	%o2,	%i0,	%i5
	movvs	%icc,	%l2,	%g2
	udiv	%i7,	0x110F,	%g1
	std	%f14,	[%l7 + 0x58]
	membar	0x7B
	fmovrdne	%g6,	%f26,	%f8
	edge8n	%o5,	%o3,	%o4
	st	%f19,	[%l7 + 0x54]
	and	%l1,	0x0921,	%i1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%o1
	tne	%icc,	0x1
	andncc	%g7,	%l0,	%l6
	nop
	set	0x58, %i7
	prefetch	[%l7 + %i7],	 0x3
	bcc,pt	%icc,	loop_2330
	tne	%xcc,	0x0
	tcc	%xcc,	0x4
	stb	%g5,	[%l7 + 0x49]
loop_2330:
	movcc	%xcc,	%l3,	%i2
	fcmple32	%f12,	%f18,	%o0
	movrlz	%g4,	%l4,	%i6
	fmovdvs	%xcc,	%f20,	%f29
	tg	%icc,	0x1
	move	%xcc,	%o7,	%l5
	fnot2	%f10,	%f18
	andn	%g3,	%o6,	%o2
	movre	%i4,	0x03A,	%i0
	nop
	setx	loop_2331,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%i5,	0x1314,	%l2
	edge32	%g2,	%i7,	%g6
	tle	%icc,	0x0
loop_2331:
	fbn,a	%fcc1,	loop_2332
	fnor	%f18,	%f14,	%f10
	umulcc	%o5,	0x12E1,	%g1
	fmovse	%xcc,	%f17,	%f3
loop_2332:
	movrlz	%o3,	0x180,	%l1
	sdivx	%o4,	0x1F9D,	%i3
	fcmpne16	%f18,	%f10,	%o1
	ld	[%l7 + 0x10],	%f6
	orcc	%i1,	0x077A,	%l0
	nop
	fitod	%f2,	%f4
	fdtoi	%f4,	%f6
	subcc	%l6,	%g5,	%g7
	fbue	%fcc1,	loop_2333
	bne,a	%icc,	loop_2334
	fmovsa	%icc,	%f3,	%f18
	tn	%xcc,	0x1
loop_2333:
	fxnor	%f8,	%f16,	%f0
loop_2334:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f4
	tleu	%icc,	0x4
	brnz	%l3,	loop_2335
	bcs,a,pt	%icc,	loop_2336
	tvc	%xcc,	0x4
	tl	%xcc,	0x3
loop_2335:
	nop
	setx	0xDC95EEB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xC3CB2700,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f1,	%f2
loop_2336:
	taddcctv	%i2,	0x185E,	%o0
	stb	%l4,	[%l7 + 0x0B]
	sllx	%i6,	%g4,	%o7
	orncc	%l5,	%g3,	%o2
	bne,a	%icc,	loop_2337
	srlx	%i4,	0x13,	%i0
	orncc	%i5,	%o6,	%l2
	fmovsgu	%icc,	%f11,	%f16
loop_2337:
	bcs,a,pt	%xcc,	loop_2338
	movcc	%xcc,	%g2,	%i7
	movge	%xcc,	%o5,	%g1
	or	%g6,	%l1,	%o3
loop_2338:
	movne	%icc,	%o4,	%o1
	tvs	%icc,	0x4
	and	%i3,	%l0,	%l6
	movleu	%icc,	%i1,	%g7
	wr	%g0,	0x27,	%asi
	stba	%l3,	[%l7 + 0x55] %asi
	membar	#Sync
	fnegs	%f27,	%f27
	taddcc	%i2,	0x0402,	%g5
	fpsub16	%f4,	%f26,	%f4
	ldx	[%l7 + 0x10],	%o0
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%i6
	fcmpne16	%f26,	%f20,	%l4
	std	%f2,	[%l7 + 0x68]
	membar	0x39
	taddcc	%g4,	%o7,	%l5
	movvs	%icc,	%g3,	%i4
	edge16l	%o2,	%i5,	%i0
	fmovdleu	%icc,	%f9,	%f11
	sdivx	%l2,	0x0DB2,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o6,	0x174A,	%o5
	fsrc1s	%f19,	%f27
	fbuge,a	%fcc0,	loop_2339
	mulx	%g1,	%i7,	%g6
	tsubcc	%o3,	%l1,	%o4
	fnegs	%f2,	%f13
loop_2339:
	taddcctv	%i3,	0x1BE7,	%l0
	fmovsg	%xcc,	%f14,	%f11
	orncc	%o1,	0x0FA2,	%l6
	fpackfix	%f10,	%f29
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x1E] %asi,	%g7
	tgu	%icc,	0x6
	xor	%i1,	%i2,	%g5
	fzeros	%f7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x50] %asi,	%f29
	nop
	set	0x1C, %g1
	lduw	[%l7 + %g1],	%l3
	smulcc	%i6,	0x0C29,	%l4
	call	loop_2340
	fcmple16	%f12,	%f2,	%o0
	subc	%g4,	0x005B,	%l5
	movn	%icc,	%g3,	%i4
loop_2340:
	movn	%xcc,	%o2,	%i5
	array16	%i0,	%o7,	%g2
	nop
	setx	0x2A88D9A4068ACD0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5E9E98F3FD5F9DAB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f6
	sllx	%l2,	%o6,	%g1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i7,	%o5
	ldd	[%l7 + 0x38],	%f4
	fmovrde	%g6,	%f8,	%f2
	udiv	%o3,	0x095B,	%o4
	bshuffle	%f30,	%f12,	%f10
	ta	%icc,	0x6
	bvc,a,pn	%icc,	loop_2341
	xnorcc	%i3,	%l0,	%l1
	fnot1s	%f21,	%f24
	bg,pn	%icc,	loop_2342
loop_2341:
	nop
	setx	0x91349A42,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xF098D66F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f16,	%f31
	movre	%l6,	0x235,	%o1
	fmul8x16	%f29,	%f8,	%f4
loop_2342:
	mulx	%g7,	%i2,	%g5
	sub	%i1,	%l3,	%l4
	orcc	%i6,	0x1B4F,	%o0
	fbne,a	%fcc0,	loop_2343
	ldd	[%l7 + 0x30],	%l4
	membar	0x33
	sdivcc	%g4,	0x1A40,	%i4
loop_2343:
	fone	%f24
	or	%g3,	%o2,	%i5
	fmuld8ulx16	%f9,	%f1,	%f14
	set	0x08, %o5
	swapa	[%l7 + %o5] 0x89,	%o7
	te	%icc,	0x5
	fmovdg	%icc,	%f21,	%f14
	movvc	%icc,	%g2,	%i0
	nop
	fitos	%f31,	%f3
	movcs	%icc,	%l2,	%o6
	xnorcc	%i7,	%o5,	%g1
	fmovs	%f1,	%f7
	movn	%icc,	%g6,	%o4
	stx	%o3,	[%l7 + 0x48]
	tneg	%icc,	0x0
	nop
	setx	0x8DBAF91A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f19
	movrgez	%l0,	0x3FF,	%l1
	ldx	[%l7 + 0x68],	%i3
	nop
	setx loop_2344, %l0, %l1
	jmpl %l1, %l6
	srlx	%g7,	%o1,	%g5
	movl	%xcc,	%i1,	%i2
	tsubcctv	%l3,	%i6,	%l4
loop_2344:
	smul	%l5,	0x0017,	%g4
	taddcctv	%i4,	%o0,	%g3
	be,pt	%icc,	loop_2345
	fornot1	%f2,	%f4,	%f0
	subcc	%i5,	0x0871,	%o7
	taddcctv	%o2,	0x05C2,	%i0
loop_2345:
	edge16	%l2,	%g2,	%o6
	nop
	fitos	%f8,	%f13
	fstod	%f13,	%f28
	tvs	%icc,	0x0
	edge32l	%i7,	%g1,	%g6
	tl	%icc,	0x5
	fmovrsne	%o5,	%f26,	%f3
	umulcc	%o3,	%o4,	%l1
	sdivx	%l0,	0x1A0A,	%i3
	tgu	%xcc,	0x1
	tsubcctv	%g7,	0x18BA,	%o1
	fands	%f12,	%f3,	%f8
	sdiv	%l6,	0x0D80,	%g5
	nop
	fitos	%f3,	%f18
	fstoi	%f18,	%f9
	udivcc	%i2,	0x08DA,	%i1
	edge8	%i6,	%l3,	%l4
	sdivcc	%l5,	0x10B9,	%i4
	nop
	setx	0x99623A7E204668BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movge	%xcc,	%g4,	%o0
	fandnot2s	%f31,	%f8,	%f24
	addcc	%g3,	0x17FD,	%o7
	add	%o2,	%i0,	%l2
	st	%f23,	[%l7 + 0x70]
	array16	%i5,	%o6,	%i7
	movvc	%icc,	%g1,	%g2
	movle	%icc,	%g6,	%o3
	subcc	%o5,	%l1,	%l0
	ldd	[%l7 + 0x48],	%i2
	fmovsg	%xcc,	%f10,	%f27
	tl	%xcc,	0x5
	sra	%o4,	0x01,	%g7
	movl	%xcc,	%o1,	%g5
	smulcc	%l6,	0x02FA,	%i2
	bvs,a,pn	%icc,	loop_2346
	fbe	%fcc0,	loop_2347
	brlez,a	%i6,	loop_2348
	orn	%i1,	0x1DE1,	%l4
loop_2346:
	stx	%l3,	[%l7 + 0x68]
loop_2347:
	movg	%xcc,	%l5,	%i4
loop_2348:
	ldsw	[%l7 + 0x24],	%o0
	nop
	setx	0xF0967710,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x5C3AE4F0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f27,	%f1
	fcmple16	%f14,	%f10,	%g3
	popc	0x003E,	%o7
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o2
	bcc,a	%icc,	loop_2349
	fors	%f1,	%f3,	%f17
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x3B] %asi,	%i0
loop_2349:
	tcs	%xcc,	0x0
	fbu,a	%fcc2,	loop_2350
	udivx	%g4,	0x0295,	%i5
	fblg,a	%fcc2,	loop_2351
	fmovspos	%xcc,	%f9,	%f11
loop_2350:
	nop
	set	0x64, %g7
	ldstuba	[%l7 + %g7] 0x19,	%l2
loop_2351:
	sethi	0x1B97,	%o6
	lduh	[%l7 + 0x26],	%g1
	udivcc	%i7,	0x141E,	%g6
	add	%g2,	0x04F4,	%o5
	nop
	setx	0xF6DE20D879C558A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2B8AE16C331264A5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f26,	%f16
	orcc	%o3,	0x055D,	%l0
	orn	%i3,	0x00A6,	%l1
	fxnors	%f19,	%f8,	%f0
	fbule,a	%fcc0,	loop_2352
	addc	%o4,	0x18E3,	%o1
	umulcc	%g5,	%g7,	%l6
	edge8	%i2,	%i6,	%i1
loop_2352:
	fbl	%fcc3,	loop_2353
	edge32l	%l4,	%l5,	%l3
	fmovrdlz	%o0,	%f28,	%f10
	st	%f15,	[%l7 + 0x7C]
loop_2353:
	udivx	%i4,	0x1A79,	%g3
	fmovrslez	%o2,	%f24,	%f5
	fble	%fcc0,	loop_2354
	smulcc	%o7,	0x1291,	%g4
	sdivx	%i5,	0x144E,	%l2
	ldstub	[%l7 + 0x26],	%i0
loop_2354:
	stb	%g1,	[%l7 + 0x65]
	fpackfix	%f4,	%f27
	tsubcctv	%o6,	0x121F,	%g6
	alignaddr	%g2,	%i7,	%o3
	move	%xcc,	%o5,	%i3
	movl	%icc,	%l0,	%o4
	addccc	%o1,	%l1,	%g5
	edge16l	%l6,	%g7,	%i2
	tcs	%xcc,	0x5
	edge32l	%i6,	%i1,	%l4
	nop
	setx	0x6062704E,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	fmovdneg	%icc,	%f6,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%l3,	%f30,	%f10
	fmul8ulx16	%f18,	%f10,	%f30
	nop
	setx	0x28A5F762FC2E7CE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x5A0BB17FEC575F96,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f12,	%f6
	fsrc2	%f30,	%f26
	movrne	%o0,	%i4,	%g3
	edge8	%l5,	%o2,	%g4
	alignaddr	%o7,	%l2,	%i5
	nop
	fitod	%f8,	%f10
	fdtos	%f10,	%f19
	fpadd16	%f6,	%f2,	%f2
	fmovrslez	%g1,	%f11,	%f26
	fmovdvc	%xcc,	%f14,	%f22
	bg,pt	%icc,	loop_2355
	popc	%i0,	%g6
	fnot1s	%f9,	%f5
	bl,a,pt	%icc,	loop_2356
loop_2355:
	mulscc	%g2,	0x170A,	%o6
	xnor	%i7,	0x0D67,	%o5
	fsrc2	%f26,	%f28
loop_2356:
	fxnor	%f26,	%f16,	%f22
	smulcc	%o3,	0x134D,	%i3
	fbge,a	%fcc1,	loop_2357
	udiv	%l0,	0x1C77,	%o1
	fbu,a	%fcc1,	loop_2358
	taddcc	%l1,	0x175A,	%g5
loop_2357:
	edge16ln	%o4,	%l6,	%i2
	fbue	%fcc1,	loop_2359
loop_2358:
	srlx	%g7,	%i1,	%i6
	orcc	%l3,	0x0F8A,	%o0
	edge8ln	%l4,	%g3,	%i4
loop_2359:
	fbge,a	%fcc3,	loop_2360
	xnor	%l5,	0x061B,	%g4
	fbg,a	%fcc1,	loop_2361
	movgu	%xcc,	%o2,	%l2
loop_2360:
	bge,a,pn	%xcc,	loop_2362
	sir	0x0EC9
loop_2361:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x44] %asi,	%i5
loop_2362:
	tpos	%icc,	0x4
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%g0
	edge8l	%i0,	%o7,	%g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%o6,	%i7
	fmovrslz	%o5,	%f20,	%f26
	pdist	%f2,	%f16,	%f22
	ldsw	[%l7 + 0x7C],	%o3
	fnegd	%f22,	%f8
	fnot1	%f8,	%f6
	or	%i3,	0x114E,	%l0
	tleu	%icc,	0x4
	fmovrsgz	%o1,	%f17,	%f14
	addcc	%g2,	%g5,	%o4
	subcc	%l1,	%l6,	%i2
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	and	%g7,	%i1,	%l3
	edge16ln	%i6,	%o0,	%g3
	and	%l4,	%l5,	%g4
	array32	%o2,	%i4,	%l2
	edge8ln	%i5,	%i0,	%g1
	movcs	%xcc,	%o7,	%o6
	edge32n	%i7,	%g6,	%o5
	umulcc	%i3,	0x056A,	%o3
	wr	%g0,	0x89,	%asi
	stba	%l0,	[%l7 + 0x6B] %asi
	ldd	[%l7 + 0x40],	%g2
	fbg,a	%fcc1,	loop_2363
	sethi	0x1B94,	%g5
	fmuld8sux16	%f30,	%f1,	%f16
	stbar
loop_2363:
	orn	%o4,	0x161D,	%l1
	movrlez	%l6,	0x339,	%i2
	fcmple16	%f26,	%f24,	%g7
	sll	%o1,	0x02,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l3,	%i6,	%g3
	fmovrdlz	%o0,	%f26,	%f8
	fbne,a	%fcc3,	loop_2364
	tcs	%icc,	0x1
	udivcc	%l5,	0x0418,	%g4
	bne	%xcc,	loop_2365
loop_2364:
	movrne	%l4,	0x3AA,	%i4
	fone	%f10
	fbug	%fcc1,	loop_2366
loop_2365:
	tvs	%xcc,	0x5
	tn	%xcc,	0x2
	lduw	[%l7 + 0x30],	%l2
loop_2366:
	nop
	set	0x2C, %l3
	lduha	[%l7 + %l3] 0x81,	%o2
	addc	%i0,	%i5,	%o7
	fpadd16s	%f30,	%f2,	%f12
	set	0x38, %g4
	swapa	[%l7 + %g4] 0x88,	%g1
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x2b,	%o6
	fble	%fcc2,	loop_2367
	edge32l	%i7,	%g6,	%i3
	udivcc	%o5,	0x0605,	%l0
	sir	0x0CE2
loop_2367:
	edge16l	%o3,	%g5,	%g2
	tsubcctv	%o4,	0x0C7B,	%l6
	fmovrsgz	%l1,	%f22,	%f16
	nop
	setx	loop_2368,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcc	%icc,	0x4
	sll	%i2,	%o1,	%g7
	addc	%l3,	0x027F,	%i1
loop_2368:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g3,	%o0
	tsubcctv	%l5,	%g4,	%l4
	fbug	%fcc0,	loop_2369
	xorcc	%i4,	0x14B9,	%l2
	sra	%i6,	0x0F,	%o2
	xor	%i5,	%o7,	%i0
loop_2369:
	nop
	fitos	%f8,	%f13
	brlz	%o6,	loop_2370
	nop
	setx	0x8F42991A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f1
	nop
	setx	0x706A74CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	tleu	%icc,	0x3
loop_2370:
	stb	%g1,	[%l7 + 0x28]
	tvc	%xcc,	0x5
	fmovdle	%xcc,	%f9,	%f0
	wr	%g0,	0x2b,	%asi
	stba	%i7,	[%l7 + 0x1D] %asi
	membar	#Sync
	fcmple32	%f22,	%f14,	%i3
	udiv	%o5,	0x14E7,	%g6
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
	fba,a	%fcc0,	loop_2371
	nop
	setx	0x4973CE47B08A602F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x379D0E64AED9CE65,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f0,	%f6
	sir	0x17CC
	bvs,a	%xcc,	loop_2372
loop_2371:
	fands	%f18,	%f25,	%f12
	movneg	%icc,	%g5,	%l0
	set	0x3C, %o1
	ldswa	[%l7 + %o1] 0x04,	%g2
loop_2372:
	xorcc	%l6,	0x1818,	%o4
	bcc,a,pn	%xcc,	loop_2373
	bl,pn	%xcc,	loop_2374
	and	%i2,	%o1,	%g7
	sdiv	%l3,	0x05CD,	%l1
loop_2373:
	fand	%f10,	%f28,	%f18
loop_2374:
	nop
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x18
	and	%i1,	%g3,	%l5
	flush	%l7 + 0x2C
	umul	%g4,	%l4,	%i4
	fzeros	%f26
	orcc	%l2,	%i6,	%o2
	fxor	%f0,	%f10,	%f28
	tg	%icc,	0x2
	andn	%o0,	0x1CDB,	%i5
	fmovdgu	%xcc,	%f9,	%f4
	movneg	%xcc,	%i0,	%o7
	edge8	%o6,	%g1,	%i3
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%i7
	xorcc	%o5,	%g6,	%o3
	umul	%g5,	%g2,	%l6
	subcc	%o4,	%i2,	%o1
	sll	%l0,	%g7,	%l1
	alignaddr	%l3,	%i1,	%g3
	sth	%g4,	[%l7 + 0x16]
	array32	%l4,	%i4,	%l5
	tg	%icc,	0x5
	addc	%l2,	0x1E86,	%i6
	array8	%o2,	%i5,	%i0
	fxor	%f8,	%f22,	%f12
	ldx	[%l7 + 0x10],	%o7
	nop
	fitod	%f2,	%f0
	fdtox	%f0,	%f30
	tn	%xcc,	0x6
	fornot2	%f0,	%f14,	%f10
	taddcc	%o0,	0x06DB,	%o6
	nop
	setx	loop_2375,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcs	%icc,	0x5
	array8	%i3,	%g1,	%i7
	fcmple32	%f12,	%f2,	%o5
loop_2375:
	movrgez	%o3,	%g5,	%g2
	fmovrdlez	%g6,	%f0,	%f12
	movl	%xcc,	%o4,	%l6
	add	%i2,	0x01C7,	%o1
	nop
	fitos	%f14,	%f3
	fstoi	%f3,	%f22
	umul	%g7,	%l0,	%l1
	fbug	%fcc1,	loop_2376
	tpos	%xcc,	0x5
	edge16	%i1,	%g3,	%g4
	fbg,a	%fcc3,	loop_2377
loop_2376:
	move	%xcc,	%l3,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l5,	%l4,	%l2
loop_2377:
	tcc	%icc,	0x4
	fbn,a	%fcc1,	loop_2378
	movrlez	%o2,	0x160,	%i5
	movn	%xcc,	%i0,	%o7
	fmovrdlez	%i6,	%f10,	%f6
loop_2378:
	call	loop_2379
	fmul8sux16	%f2,	%f4,	%f26
	array32	%o6,	%o0,	%g1
	mulx	%i3,	0x122E,	%o5
loop_2379:
	tneg	%xcc,	0x1
	fxor	%f10,	%f14,	%f12
	fornot2s	%f12,	%f12,	%f1
	subc	%o3,	0x042B,	%g5
	tcs	%icc,	0x7
	brgz,a	%i7,	loop_2380
	movrlez	%g2,	%o4,	%l6
	or	%g6,	0x1874,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2380:
	xnor	%i2,	%g7,	%l0
	mulscc	%l1,	0x153F,	%g3
	movrne	%g4,	0x18D,	%i1
	set	0x54, %g5
	swapa	[%l7 + %g5] 0x80,	%l3
	movcc	%xcc,	%i4,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc2,	loop_2381
	fpsub32	%f30,	%f16,	%f0
	andcc	%l2,	0x0A12,	%o2
	popc	%i5,	%l5
loop_2381:
	fbl	%fcc1,	loop_2382
	bshuffle	%f4,	%f12,	%f24
	edge16ln	%o7,	%i6,	%i0
	tvs	%xcc,	0x7
loop_2382:
	movvc	%xcc,	%o0,	%g1
	wr	%g0,	0x10,	%asi
	stba	%i3,	[%l7 + 0x0E] %asi
	movre	%o6,	0x24A,	%o5
	bg,pn	%icc,	loop_2383
	fmovrse	%g5,	%f16,	%f13
	fands	%f10,	%f0,	%f4
	ble,a,pn	%icc,	loop_2384
loop_2383:
	movleu	%icc,	%o3,	%i7
	fmovrsgez	%g2,	%f6,	%f7
	stx	%l6,	[%l7 + 0x78]
loop_2384:
	srax	%g6,	%o1,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f12,	%f0,	%g7
	st	%f13,	[%l7 + 0x50]
	movcs	%icc,	%o4,	%l1
	lduh	[%l7 + 0x5E],	%l0
	lduw	[%l7 + 0x58],	%g4
	fmovdn	%icc,	%f23,	%f19
	tl	%xcc,	0x6
	edge16l	%g3,	%i1,	%l3
	fmul8x16au	%f27,	%f15,	%f14
	movneg	%xcc,	%l4,	%l2
	bshuffle	%f6,	%f8,	%f16
	edge16	%o2,	%i4,	%l5
	tsubcctv	%o7,	0x1794,	%i6
	movleu	%icc,	%i0,	%o0
	umul	%i5,	%g1,	%i3
	stb	%o5,	[%l7 + 0x6E]
	set	0x1C, %i1
	lduha	[%l7 + %i1] 0x19,	%o6
	movcc	%icc,	%o3,	%g5
	or	%g2,	0x1E58,	%l6
	movg	%icc,	%i7,	%g6
	set	0x1C, %l2
	lda	[%l7 + %l2] 0x18,	%f5
	bvs,a	loop_2385
	edge16	%o1,	%g7,	%i2
	fmovdcc	%xcc,	%f11,	%f12
	fexpand	%f17,	%f8
loop_2385:
	nop
	setx	0xFC9CB9AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x96893254,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f20,	%f18
	sll	%l1,	0x08,	%o4
	array16	%g4,	%g3,	%l0
	orn	%i1,	0x0DF9,	%l4
	movvs	%xcc,	%l3,	%l2
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x15
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x78] %asi,	%i4
	ldd	[%l7 + 0x30],	%f4
	srl	%o2,	%l5,	%i6
	fmovdcs	%icc,	%f18,	%f14
	fpsub16	%f16,	%f2,	%f8
	fnegs	%f14,	%f31
	movn	%xcc,	%o7,	%i0
	tge	%xcc,	0x1
	sethi	0x1A2E,	%o0
	smul	%g1,	%i3,	%i5
	movre	%o5,	0x1F4,	%o6
	fbue	%fcc1,	loop_2386
	nop
	setx	0x6E6C83547342CB2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x2B54C90715B6CFCD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f12,	%f2
	nop
	setx loop_2387, %l0, %l1
	jmpl %l1, %o3
	tne	%icc,	0x3
loop_2386:
	movl	%xcc,	%g5,	%g2
	edge32l	%i7,	%l6,	%g6
loop_2387:
	sdivcc	%g7,	0x1084,	%o1
	movvc	%icc,	%i2,	%l1
	movge	%icc,	%g4,	%o4
	ldstub	[%l7 + 0x4F],	%g3
	bvs,a,pn	%xcc,	loop_2388
	movpos	%icc,	%l0,	%i1
	addc	%l4,	%l2,	%l3
	edge16ln	%i4,	%o2,	%i6
loop_2388:
	fmovrsne	%o7,	%f29,	%f26
	ldsb	[%l7 + 0x72],	%i0
	orn	%l5,	%g1,	%o0
	xnorcc	%i3,	0x08BD,	%i5
	fbge	%fcc1,	loop_2389
	prefetch	[%l7 + 0x34],	 0x3
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x50] %asi,	%o4
loop_2389:
	fbuge,a	%fcc3,	loop_2390
	edge8ln	%o3,	%o6,	%g5
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x28] %asi,	%g2
loop_2390:
	sdiv	%l6,	0x19D1,	%i7
	brlz,a	%g7,	loop_2391
	array16	%o1,	%i2,	%g6
	tcs	%icc,	0x7
	call	loop_2392
loop_2391:
	tge	%xcc,	0x4
	tle	%xcc,	0x2
	sethi	0x0BD4,	%g4
loop_2392:
	prefetch	[%l7 + 0x58],	 0x0
	fbo,a	%fcc0,	loop_2393
	mulscc	%o4,	0x080B,	%g3
	fnot2	%f8,	%f30
	orn	%l0,	0x188B,	%i1
loop_2393:
	brz,a	%l4,	loop_2394
	fandnot1	%f28,	%f10,	%f10
	tcs	%xcc,	0x2
	flush	%l7 + 0x7C
loop_2394:
	edge16ln	%l1,	%l3,	%i4
	movrgz	%o2,	%l2,	%o7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i6,	%i0
	orncc	%l5,	%o0,	%i3
	umulcc	%i5,	0x1099,	%g1
	popc	%o5,	%o3
	fzeros	%f19
	edge16	%g5,	%o6,	%l6
	fmovsa	%xcc,	%f0,	%f10
	movrlez	%i7,	0x3DB,	%g2
	fmovrsgez	%o1,	%f19,	%f23
	smulcc	%i2,	%g7,	%g6
	lduh	[%l7 + 0x22],	%o4
	ldsw	[%l7 + 0x64],	%g3
	sdivcc	%l0,	0x1C9B,	%i1
	membar	0x24
	movvs	%xcc,	%g4,	%l4
	bne	loop_2395
	nop
	fitos	%f2,	%f4
	fstod	%f4,	%f16
	fmovsgu	%icc,	%f26,	%f3
	alignaddrl	%l3,	%l1,	%o2
loop_2395:
	srl	%l2,	%o7,	%i6
	fbl	%fcc3,	loop_2396
	umul	%i4,	%l5,	%o0
	tneg	%icc,	0x0
	tg	%xcc,	0x1
loop_2396:
	nop
	set	0x60, %o2
	ldda	[%l7 + %o2] 0xe2,	%i0
	fmovrsgez	%i3,	%f0,	%f20
	srlx	%g1,	%i5,	%o5
	te	%xcc,	0x1
	mulscc	%o3,	%o6,	%g5
	subc	%l6,	0x0723,	%g2
	addcc	%o1,	0x0ADD,	%i2
	movvs	%icc,	%g7,	%g6
	mulx	%i7,	0x1213,	%g3
	bvc,a,pt	%xcc,	loop_2397
	movvc	%xcc,	%l0,	%o4
	movcc	%icc,	%g4,	%i1
	movre	%l4,	%l3,	%o2
loop_2397:
	fpadd32	%f8,	%f26,	%f30
	andn	%l1,	0x063C,	%o7
	nop
	setx	0x21975E185E9C1A4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x00E7312DA5B90429,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f14,	%f12
	ldub	[%l7 + 0x6B],	%l2
	tgu	%icc,	0x5
	ldsh	[%l7 + 0x36],	%i6
	fmovrdlez	%l5,	%f30,	%f6
	tle	%icc,	0x4
	movcs	%icc,	%i4,	%i0
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
	movgu	%xcc,	%o0,	%i5
	tsubcc	%g1,	0x02B5,	%o3
	subcc	%o6,	%o5,	%l6
	fmovsvc	%icc,	%f15,	%f1
	movl	%xcc,	%g2,	%o1
	fzeros	%f30
	sll	%g5,	0x18,	%g7
	fcmple16	%f16,	%f6,	%g6
	fandnot2s	%f28,	%f31,	%f18
	array16	%i7,	%i2,	%g3
	movvc	%xcc,	%o4,	%l0
	tl	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x78] %asi,	%i1
	fcmpgt32	%f20,	%f6,	%g4
	ta	%xcc,	0x0
	tl	%xcc,	0x1
	tgu	%icc,	0x5
	set	0x20, %o4
	lda	[%l7 + %o4] 0x81,	%f14
	bpos,a,pn	%icc,	loop_2398
	fbule	%fcc3,	loop_2399
	sir	0x0034
	tcs	%xcc,	0x0
loop_2398:
	ldsb	[%l7 + 0x7A],	%l3
loop_2399:
	fandnot2s	%f6,	%f25,	%f18
	taddcc	%l4,	0x1290,	%o2
	nop
	fitos	%f2,	%f2
	fstoi	%f2,	%f15
	ldsw	[%l7 + 0x14],	%l1
	movrlez	%l2,	0x09F,	%i6
	fpack16	%f14,	%f13
	sdivx	%l5,	0x1CCF,	%i4
	stb	%o7,	[%l7 + 0x3E]
	bne	loop_2400
	array8	%i3,	%i0,	%i5
	for	%f14,	%f26,	%f2
	srlx	%g1,	%o0,	%o3
loop_2400:
	nop
	fitod	%f30,	%f4
	tgu	%icc,	0x5
	fsrc1	%f30,	%f16
	fpadd16s	%f0,	%f16,	%f19
	nop
	fitod	%f6,	%f20
	fdtox	%f20,	%f12
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x20] %asi,	%o6
	edge16ln	%o5,	%g2,	%o1
	bgu,pn	%icc,	loop_2401
	udivx	%l6,	0x14E9,	%g7
	nop
	setx	loop_2402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16	%g5,	%g6,	%i7
loop_2401:
	xor	%g3,	0x186E,	%o4
	orncc	%l0,	0x0A61,	%i1
loop_2402:
	edge16	%i2,	%g4,	%l3
	edge8n	%o2,	%l4,	%l2
	tn	%xcc,	0x7
	tle	%xcc,	0x6
	movg	%icc,	%i6,	%l1
	edge16l	%l5,	%i4,	%o7
	nop
	setx	0xB011CB19B0687738,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	udivx	%i3,	0x02A0,	%i0
	set	0x24, %o6
	stwa	%i5,	[%l7 + %o6] 0x15
	umulcc	%o0,	%o3,	%o6
	edge16n	%o5,	%g1,	%o1
	subc	%l6,	0x0356,	%g7
	fba,a	%fcc2,	loop_2403
	tgu	%icc,	0x1
	or	%g5,	%g6,	%i7
	set	0x20, %l5
	ldxa	[%l7 + %l5] 0x89,	%g2
loop_2403:
	movrgz	%o4,	0x176,	%g3
	tvc	%icc,	0x6
	fzeros	%f18
	fmovdneg	%xcc,	%f0,	%f19
	sth	%i1,	[%l7 + 0x62]
	alignaddrl	%i2,	%l0,	%g4
	fbule	%fcc2,	loop_2404
	edge32l	%l3,	%l4,	%o2
	fmovdcs	%icc,	%f24,	%f31
	stw	%i6,	[%l7 + 0x4C]
loop_2404:
	nop
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf1,	%f0
	edge8n	%l1,	%l2,	%l5
	ble,a,pt	%xcc,	loop_2405
	sra	%i4,	%o7,	%i0
	nop
	setx	0xFDFB1E20D0711167,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	movge	%icc,	%i3,	%o0
loop_2405:
	fxnors	%f20,	%f13,	%f3
	bge,pn	%xcc,	loop_2406
	umul	%i5,	%o3,	%o5
	nop
	setx	loop_2407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%o6,	%g1
loop_2406:
	and	%l6,	%o1,	%g7
	edge8l	%g6,	%g5,	%i7
loop_2407:
	tneg	%icc,	0x1
	fexpand	%f0,	%f20
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x14,	%g2
	smul	%o4,	0x169F,	%i1
	fmovdvc	%xcc,	%f21,	%f8
	ldsh	[%l7 + 0x74],	%g3
	call	loop_2408
	nop
	setx	0xCB91C1A9D4F13A72,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xF1B4CED709729EDF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f24,	%f4
	or	%i2,	0x199F,	%g4
	tgu	%icc,	0x1
loop_2408:
	fone	%f26
	fbl	%fcc2,	loop_2409
	fmovdcc	%icc,	%f9,	%f27
	fblg	%fcc3,	loop_2410
	array8	%l3,	%l0,	%o2
loop_2409:
	stbar
	fbuge	%fcc3,	loop_2411
loop_2410:
	ba,a	loop_2412
	fmovdvs	%xcc,	%f29,	%f12
	nop
	fitod	%f6,	%f26
	fdtox	%f26,	%f4
loop_2411:
	movrlz	%i6,	0x1DD,	%l1
loop_2412:
	sub	%l2,	%l5,	%l4
	fmovde	%xcc,	%f21,	%f7
	bneg,a,pt	%xcc,	loop_2413
	nop
	setx	0xC01E38ECEB6CD990,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC534A14F8A316B3A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f26,	%f4
	fmul8x16au	%f17,	%f26,	%f16
	array16	%o7,	%i4,	%i3
loop_2413:
	mulscc	%i0,	0x17E2,	%i5
	or	%o3,	0x07B8,	%o5
	tsubcc	%o6,	0x1C3E,	%g1
	stb	%l6,	[%l7 + 0x21]
	fmovrdgez	%o1,	%f22,	%f22
	smul	%g7,	%o0,	%g6
	bgu,pn	%xcc,	loop_2414
	array16	%g5,	%g2,	%o4
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x19] %asi,	%i1
loop_2414:
	fbu,a	%fcc2,	loop_2415
	fmovsn	%xcc,	%f8,	%f8
	xorcc	%i7,	%g3,	%i2
	addcc	%g4,	%l3,	%o2
loop_2415:
	bn,a,pn	%xcc,	loop_2416
	stx	%i6,	[%l7 + 0x38]
	fmovsgu	%icc,	%f3,	%f18
	movne	%icc,	%l1,	%l2
loop_2416:
	bneg	%xcc,	loop_2417
	bvs	loop_2418
	movle	%icc,	%l0,	%l4
	tcc	%xcc,	0x2
loop_2417:
	fmovdl	%xcc,	%f21,	%f27
loop_2418:
	ldsh	[%l7 + 0x46],	%o7
	nop
	fitos	%f0,	%f5
	fstox	%f5,	%f6
	andncc	%l5,	%i4,	%i0
	andcc	%i3,	0x144A,	%i5
	edge16	%o5,	%o3,	%g1
	fcmple16	%f14,	%f26,	%o6
	edge32l	%l6,	%g7,	%o1
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x3D] %asi,	%o0
	edge32	%g6,	%g5,	%o4
	fmovdn	%icc,	%f4,	%f20
	nop
	fitos	%f0,	%f17
	fstox	%f17,	%f2
	fxtos	%f2,	%f4
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f4
	fxtod	%f4,	%f6
	tgu	%icc,	0x3
	srax	%g2,	%i7,	%i1
	edge16l	%i2,	%g3,	%l3
	st	%f15,	[%l7 + 0x38]
	array16	%o2,	%g4,	%l1
	popc	%i6,	%l0
	fpack16	%f0,	%f8
	sth	%l2,	[%l7 + 0x54]
	sub	%o7,	0x1A57,	%l4
	mulscc	%l5,	%i4,	%i3
	fnot2	%f20,	%f18
	fbl	%fcc2,	loop_2419
	mulx	%i5,	%i0,	%o3
	mova	%icc,	%o5,	%o6
	fbg,a	%fcc3,	loop_2420
loop_2419:
	smulcc	%l6,	0x18EF,	%g7
	nop
	set	0x58, %i6
	prefetch	[%l7 + %i6],	 0x3
	tge	%xcc,	0x0
loop_2420:
	fblg,a	%fcc0,	loop_2421
	movcs	%icc,	%g1,	%o1
	movg	%xcc,	%g6,	%o0
	bcc,a	%icc,	loop_2422
loop_2421:
	taddcc	%o4,	%g2,	%i7
	fmovsle	%xcc,	%f30,	%f10
	fnot1	%f16,	%f0
loop_2422:
	fmovrdne	%g5,	%f28,	%f6
	edge8l	%i1,	%i2,	%g3
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%o2
	move	%icc,	%l3,	%g4
	fmovrde	%l1,	%f28,	%f16
	tgu	%icc,	0x1
	ld	[%l7 + 0x2C],	%f17
	movcc	%xcc,	%l0,	%i6
	movrgz	%l2,	0x2BC,	%o7
	xnorcc	%l5,	0x1D84,	%i4
	tgu	%xcc,	0x0
	stbar
	ld	[%l7 + 0x28],	%f22
	xor	%i3,	%i5,	%i0
	tgu	%xcc,	0x2
	sdivx	%o3,	0x1A0F,	%l4
	movpos	%icc,	%o5,	%o6
	nop
	fitos	%f12,	%f1
	fstox	%f1,	%f14
	fxtos	%f14,	%f8
	addc	%l6,	%g1,	%o1
	fnegd	%f10,	%f24
	fone	%f30
	sir	0x153D
	fbge,a	%fcc2,	loop_2423
	be	loop_2424
	subcc	%g7,	0x00AB,	%o0
	fpadd32s	%f27,	%f2,	%f11
loop_2423:
	nop
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g6
loop_2424:
	ta	%xcc,	0x3
	mulscc	%o4,	%g2,	%g5
	edge16n	%i7,	%i2,	%i1
	tpos	%icc,	0x5
	tleu	%icc,	0x4
	smul	%o2,	0x1F6B,	%l3
	fbn,a	%fcc0,	loop_2425
	tn	%icc,	0x1
	set	0x12, %l0
	lduha	[%l7 + %l0] 0x18,	%g4
loop_2425:
	fornot1	%f8,	%f24,	%f2
	ta	%xcc,	0x2
	tleu	%icc,	0x3
	fbue	%fcc1,	loop_2426
	smul	%l1,	%l0,	%i6
	movvc	%xcc,	%l2,	%o7
	edge8	%l5,	%i4,	%i3
loop_2426:
	andn	%i5,	%g3,	%i0
	bvs	%xcc,	loop_2427
	array16	%o3,	%o5,	%l4
	udiv	%o6,	0x18B6,	%g1
	brgz,a	%o1,	loop_2428
loop_2427:
	nop
	fitos	%f8,	%f17
	fstod	%f17,	%f12
	fcmpne32	%f4,	%f18,	%g7
	fmovs	%f8,	%f13
loop_2428:
	ldsh	[%l7 + 0x48],	%o0
	set	0x10, %i4
	lduha	[%l7 + %i4] 0x19,	%l6
	andncc	%g6,	%g2,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc2,	loop_2429
	fxors	%f2,	%f30,	%f13
	fsrc1s	%f17,	%f11
	edge32ln	%i7,	%g5,	%i2
loop_2429:
	fpadd32s	%f4,	%f11,	%f9
	fmovrse	%i1,	%f8,	%f0
	edge16	%l3,	%o2,	%l1
	ldd	[%l7 + 0x48],	%f4
	fmovsgu	%icc,	%f12,	%f27
	movleu	%xcc,	%g4,	%i6
	fmovsge	%xcc,	%f21,	%f16
	nop
	fitos	%f28,	%f6
	orn	%l2,	%o7,	%l0
	tpos	%xcc,	0x3
	ldstub	[%l7 + 0x0B],	%i4
	edge32	%l5,	%i3,	%g3
	nop
	fitod	%f25,	%f24
	fsrc1s	%f4,	%f31
	movrne	%i5,	%i0,	%o3
	brgez	%o5,	loop_2430
	fands	%f30,	%f29,	%f0
	andcc	%o6,	0x1F69,	%l4
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2430:
	fors	%f19,	%f8,	%f21
	taddcc	%o1,	0x01D1,	%g1
	fbl,a	%fcc2,	loop_2431
	fpadd16	%f24,	%f24,	%f20
	sub	%g7,	0x15C0,	%o0
	tle	%icc,	0x5
loop_2431:
	fcmpgt16	%f26,	%f28,	%l6
	fbo	%fcc1,	loop_2432
	edge8n	%g2,	%o4,	%g6
	edge16ln	%g5,	%i2,	%i1
	ldstub	[%l7 + 0x16],	%l3
loop_2432:
	edge32l	%o2,	%l1,	%g4
	tl	%xcc,	0x0
	movrgez	%i6,	%i7,	%o7
	edge16ln	%l2,	%i4,	%l5
	movrgz	%l0,	0x249,	%g3
	taddcc	%i3,	0x15E5,	%i0
	nop
	setx	0x5694C8EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x68FEB8E3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f31,	%f21
	tleu	%xcc,	0x0
	fpadd32	%f26,	%f30,	%f16
	be,pn	%icc,	loop_2433
	add	%o3,	0x0C7E,	%o5
	tge	%xcc,	0x7
	fpadd16s	%f20,	%f10,	%f14
loop_2433:
	fmul8ulx16	%f22,	%f22,	%f14
	fsrc2s	%f3,	%f1
	membar	0x1B
	fbuge,a	%fcc2,	loop_2434
	brnz	%o6,	loop_2435
	nop
	setx	0x060A3323DE46977B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xF055906293DFF2CD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f22,	%f24
	std	%f22,	[%l7 + 0x40]
loop_2434:
	subc	%i5,	0x196F,	%o1
loop_2435:
	fbuge,a	%fcc2,	loop_2436
	st	%f21,	[%l7 + 0x4C]
	tn	%xcc,	0x3
	smulcc	%g1,	0x123F,	%l4
loop_2436:
	add	%g7,	0x04C4,	%o0
	sll	%g2,	0x16,	%o4
	nop
	setx	0x0A388BFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xFFE90F2C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f18,	%f30
	fexpand	%f25,	%f20
	fmovdcc	%icc,	%f24,	%f17
	fnot1	%f30,	%f26
	brnz	%l6,	loop_2437
	mova	%xcc,	%g6,	%i2
	fxor	%f16,	%f14,	%f12
	movrgz	%g5,	%l3,	%i1
loop_2437:
	faligndata	%f28,	%f6,	%f2
	umulcc	%l1,	0x0F49,	%o2
	udiv	%i6,	0x14BC,	%g4
	add	%i7,	0x0E9E,	%l2
	tvs	%xcc,	0x5
	bne,a	loop_2438
	tle	%xcc,	0x3
	addcc	%i4,	%l5,	%l0
	movpos	%xcc,	%o7,	%g3
loop_2438:
	taddcctv	%i0,	0x0E3B,	%o3
	tn	%icc,	0x3
	xorcc	%o5,	0x1F05,	%i3
	edge32ln	%i5,	%o6,	%g1
	fmovspos	%icc,	%f26,	%f24
	fmovscc	%icc,	%f3,	%f12
	edge16ln	%l4,	%g7,	%o0
	tsubcctv	%g2,	0x0682,	%o1
	taddcc	%o4,	0x099C,	%g6
	ta	%xcc,	0x7
	fbue	%fcc1,	loop_2439
	nop
	setx	0x0813788E7E7A0497,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f0
	mova	%icc,	%i2,	%g5
	movrlez	%l3,	%l6,	%l1
loop_2439:
	movgu	%icc,	%o2,	%i1
	sra	%g4,	%i7,	%i6
	ld	[%l7 + 0x70],	%f30
	fornot1	%f0,	%f2,	%f14
	subccc	%i4,	%l5,	%l2
	fmovspos	%xcc,	%f4,	%f19
	fcmpne16	%f20,	%f16,	%o7
	tle	%icc,	0x4
	fmovrde	%l0,	%f26,	%f4
	sra	%i0,	%g3,	%o3
	fmovrdne	%i3,	%f30,	%f24
	fmovda	%icc,	%f8,	%f29
	sdiv	%i5,	0x09B2,	%o5
	ldsh	[%l7 + 0x6C],	%g1
	tne	%xcc,	0x5
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x88,	 0x3
	fmul8x16	%f8,	%f20,	%f18
	sir	0x05D3
	fpsub32s	%f2,	%f24,	%f31
	andn	%o6,	%o0,	%g7
	stb	%o1,	[%l7 + 0x75]
	alignaddr	%o4,	%g6,	%i2
	fbne	%fcc0,	loop_2440
	fmovsvc	%icc,	%f4,	%f7
	addc	%g5,	%g2,	%l6
	xorcc	%l1,	%l3,	%o2
loop_2440:
	ld	[%l7 + 0x68],	%f16
	fmovrde	%i1,	%f6,	%f28
	set	0x42, %l1
	lduha	[%l7 + %l1] 0x10,	%g4
	tcc	%icc,	0x3
	movn	%xcc,	%i7,	%i4
	movn	%icc,	%l5,	%i6
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x89
	or	%l2,	0x0D52,	%l0
	taddcc	%i0,	%o7,	%o3
	nop
	fitod	%f8,	%f12
	fdtos	%f12,	%f21
	tsubcc	%i3,	%g3,	%o5
	andncc	%g1,	%i5,	%l4
	ld	[%l7 + 0x60],	%f15
	tne	%icc,	0x3
	edge8n	%o0,	%o6,	%o1
	nop
	setx	0xADBC8CFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x41095878,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f6,	%f0
	nop
	setx	0xA7F7482FA441CDC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x34C5FBD4F8301C86,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f4,	%f30
	movcs	%xcc,	%g7,	%g6
	fmul8sux16	%f8,	%f6,	%f14
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%i2
	fmovrdlez	%g5,	%f22,	%f20
	tcc	%icc,	0x3
	fandnot2	%f14,	%f16,	%f10
	addccc	%o4,	%l6,	%l1
	stb	%l3,	[%l7 + 0x28]
	fmovdvs	%xcc,	%f8,	%f19
	nop
	setx	0x021EB7668FDAE7BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD92A7A935363F624,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f0,	%f2
	brnz,a	%o2,	loop_2441
	and	%g2,	%g4,	%i7
	ba,a,pn	%icc,	loop_2442
	fmovdvc	%xcc,	%f2,	%f25
loop_2441:
	movrgz	%i4,	%i1,	%i6
	tsubcctv	%l2,	%l0,	%i0
loop_2442:
	nop
	set	0x54, %g6
	lduwa	[%l7 + %g6] 0x11,	%l5
	fpadd32s	%f10,	%f20,	%f17
	array8	%o3,	%o7,	%g3
	bcc,a	loop_2443
	fmovrsne	%o5,	%f13,	%f18
	ld	[%l7 + 0x7C],	%f2
	swap	[%l7 + 0x68],	%i3
loop_2443:
	bg,pn	%icc,	loop_2444
	orcc	%g1,	%l4,	%o0
	fbo	%fcc1,	loop_2445
	tsubcctv	%i5,	0x0D11,	%o1
loop_2444:
	fnand	%f6,	%f2,	%f16
	brz,a	%g7,	loop_2446
loop_2445:
	fmul8x16al	%f30,	%f5,	%f12
	flush	%l7 + 0x0C
	movn	%xcc,	%g6,	%i2
loop_2446:
	fxnor	%f24,	%f10,	%f30
	fpsub16	%f4,	%f26,	%f30
	te	%icc,	0x2
	andncc	%o6,	%o4,	%g5
	movcs	%icc,	%l6,	%l3
	fnor	%f4,	%f26,	%f12
	edge8ln	%o2,	%l1,	%g2
	fbug,a	%fcc2,	loop_2447
	tleu	%icc,	0x7
	tcc	%icc,	0x1
	nop
	setx	loop_2448,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2447:
	movrlez	%i7,	%i4,	%g4
	udiv	%i6,	0x074B,	%l2
	fandnot2	%f8,	%f20,	%f22
loop_2448:
	andn	%i1,	0x0A86,	%i0
	fmovdle	%icc,	%f2,	%f12
	fnor	%f22,	%f16,	%f20
	bleu,a	%xcc,	loop_2449
	move	%xcc,	%l0,	%l5
	fbue	%fcc0,	loop_2450
	popc	0x1D0E,	%o3
loop_2449:
	fpadd32	%f18,	%f28,	%f24
	sir	0x193D
loop_2450:
	tvs	%icc,	0x7
	bvs,pn	%icc,	loop_2451
	stw	%o7,	[%l7 + 0x64]
	array8	%o5,	%i3,	%g1
	alignaddrl	%g3,	%l4,	%i5
loop_2451:
	movne	%icc,	%o1,	%o0
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x42] %asi,	%g7
	addc	%i2,	0x14EC,	%o6
	wr	%g0,	0x88,	%asi
	stba	%g6,	[%l7 + 0x77] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f6,	%f22,	%f31
	tsubcctv	%g5,	0x1573,	%o4
	umulcc	%l6,	%l3,	%o2
	orn	%g2,	%l1,	%i7
	bge,a,pt	%icc,	loop_2452
	sdivx	%g4,	0x026B,	%i4
	subccc	%i6,	0x15EA,	%l2
	be,pt	%icc,	loop_2453
loop_2452:
	sra	%i0,	0x17,	%i1
	fmovdle	%icc,	%f1,	%f27
	movrlez	%l0,	0x3D7,	%o3
loop_2453:
	tle	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	addcc	%o7,	%l5,	%i3
	call	loop_2454
	te	%icc,	0x4
	edge8l	%o5,	%g3,	%l4
	umulcc	%g1,	%i5,	%o1
loop_2454:
	fmovsle	%xcc,	%f19,	%f21
	mulscc	%g7,	0x0817,	%i2
	fmul8ulx16	%f4,	%f16,	%f8
	fble,a	%fcc2,	loop_2455
	addcc	%o6,	%g6,	%g5
	fnot1	%f8,	%f24
	fpadd32s	%f14,	%f25,	%f22
loop_2455:
	fnegs	%f11,	%f27
	movpos	%icc,	%o0,	%o4
	fbule,a	%fcc3,	loop_2456
	taddcc	%l6,	0x1779,	%o2
	orcc	%l3,	%l1,	%g2
	edge8l	%i7,	%g4,	%i4
loop_2456:
	srl	%i6,	%i0,	%l2
	udivx	%l0,	0x0020,	%o3
	edge16ln	%o7,	%l5,	%i3
	fmovrsgz	%o5,	%f31,	%f5
	sdivx	%i1,	0x0A0E,	%l4
	ld	[%l7 + 0x0C],	%f11
	fandnot1s	%f3,	%f17,	%f17
	fand	%f26,	%f30,	%f18
	array32	%g1,	%g3,	%o1
	tsubcctv	%g7,	0x0BCA,	%i2
	edge8n	%o6,	%i5,	%g6
	bvc	loop_2457
	tvs	%xcc,	0x7
	edge16n	%g5,	%o0,	%o4
	edge32n	%o2,	%l6,	%l3
loop_2457:
	fmovsleu	%xcc,	%f20,	%f3
	tcc	%icc,	0x4
	tgu	%icc,	0x2
	fmovrdgez	%g2,	%f28,	%f26
	set	0x36, %i0
	lduha	[%l7 + %i0] 0x15,	%l1
	fmovrdgz	%i7,	%f10,	%f10
	fmovde	%icc,	%f31,	%f23
	fble	%fcc3,	loop_2458
	tg	%icc,	0x2
	umulcc	%g4,	%i6,	%i0
	edge32n	%i4,	%l2,	%l0
loop_2458:
	tg	%xcc,	0x1
	orncc	%o3,	0x1364,	%l5
	tle	%xcc,	0x1
	subcc	%o7,	0x1BC3,	%i3
	sllx	%i1,	%o5,	%g1
	movvs	%icc,	%l4,	%g3
	orncc	%g7,	0x17EF,	%i2
	movg	%xcc,	%o6,	%i5
	nop
	setx	0x6DE5050EF276B842,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD53E2D10112F3630,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f22,	%f30
	fba	%fcc2,	loop_2459
	tcs	%xcc,	0x1
	fpmerge	%f11,	%f7,	%f22
	swap	[%l7 + 0x60],	%o1
loop_2459:
	fmovdcs	%icc,	%f1,	%f16
	movre	%g5,	0x0EE,	%o0
	sllx	%g6,	%o2,	%o4
	nop
	setx	loop_2460,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stx	%l3,	[%l7 + 0x60]
	sdivcc	%g2,	0x065C,	%l6
	mova	%xcc,	%i7,	%l1
loop_2460:
	udivcc	%g4,	0x0AC4,	%i0
	nop
	setx	0x7C386B5268C3A768,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f18
	stx	%i6,	[%l7 + 0x30]
	tvc	%icc,	0x1
	xnorcc	%l2,	0x0E23,	%i4
	fmovrse	%o3,	%f5,	%f6
	subccc	%l5,	%o7,	%i3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l0,	%o5
	ldub	[%l7 + 0x1F],	%g1
	xor	%l4,	0x1F6F,	%g3
	movle	%icc,	%i1,	%g7
	nop
	setx	0xC044674F,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fmovrslez	%o6,	%f31,	%f8
	subc	%i5,	0x0016,	%o1
	flush	%l7 + 0x48
	fones	%f16
	nop
	fitos	%f1,	%f3
	fstoi	%f3,	%f22
	stbar
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sllx	%g5,	%o0,	%g6
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x04,	 0x1
	nop
	setx	0x8B006E69,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xE716C502,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f12,	%f5
	tg	%xcc,	0x4
	srlx	%i2,	%l3,	%g2
	sdivcc	%o4,	0x1E57,	%i7
	add	%l6,	0x17E6,	%l1
	nop
	fitos	%f12,	%f20
	fstox	%f20,	%f12
	alignaddr	%g4,	%i6,	%i0
	tvs	%xcc,	0x1
	fmovsl	%xcc,	%f1,	%f6
	edge8ln	%i4,	%o3,	%l2
	nop
	fitos	%f4,	%f4
	fstox	%f4,	%f10
	xnorcc	%l5,	%o7,	%l0
	fmovrsgez	%o5,	%f7,	%f10
	fmovdn	%xcc,	%f28,	%f21
	nop
	setx	0x8F028DE5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x5B3ADFC8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f17,	%f0
	addc	%i3,	0x03A0,	%l4
	edge8l	%g1,	%i1,	%g7
	ldd	[%l7 + 0x78],	%o6
	bcs,pt	%xcc,	loop_2461
	fbule	%fcc3,	loop_2462
	sra	%i5,	%g3,	%o1
	brlz	%o0,	loop_2463
loop_2461:
	movle	%icc,	%g6,	%g5
loop_2462:
	edge8l	%i2,	%o2,	%l3
	for	%f0,	%f28,	%f28
loop_2463:
	fbge,a	%fcc1,	loop_2464
	fbue,a	%fcc1,	loop_2465
	movle	%xcc,	%o4,	%g2
	addc	%i7,	%l1,	%l6
loop_2464:
	sll	%g4,	%i0,	%i6
loop_2465:
	subccc	%i4,	0x1E94,	%o3
	tg	%icc,	0x2
	edge32ln	%l5,	%o7,	%l0
	edge16l	%l2,	%i3,	%o5
	fors	%f7,	%f14,	%f7
	sll	%g1,	%l4,	%i1
	fcmpeq16	%f14,	%f6,	%g7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i5
	bcs,a	%icc,	loop_2466
	fbo,a	%fcc3,	loop_2467
	umulcc	%g3,	%o6,	%o1
	fbuge,a	%fcc1,	loop_2468
loop_2466:
	fmuld8sux16	%f25,	%f25,	%f26
loop_2467:
	andncc	%o0,	%g5,	%g6
	brlez	%i2,	loop_2469
loop_2468:
	fmul8x16au	%f1,	%f8,	%f28
	array16	%l3,	%o4,	%o2
	edge8l	%g2,	%l1,	%l6
loop_2469:
	srlx	%g4,	0x0A,	%i0
	alignaddr	%i6,	%i7,	%o3
	edge16l	%i4,	%o7,	%l0
	movle	%icc,	%l2,	%i3
	fbge	%fcc3,	loop_2470
	tg	%xcc,	0x3
	movne	%xcc,	%l5,	%g1
	movleu	%icc,	%l4,	%o5
loop_2470:
	xor	%g7,	%i5,	%i1
	sdiv	%g3,	0x0EB1,	%o1
	addc	%o6,	%o0,	%g6
	array32	%i2,	%l3,	%o4
	mova	%xcc,	%o2,	%g2
	fmovrsne	%l1,	%f11,	%f21
	fandnot1s	%f26,	%f13,	%f20
	tn	%xcc,	0x2
	array16	%g5,	%g4,	%i0
	xnor	%i6,	0x17F8,	%l6
	tne	%xcc,	0x3
	fbne	%fcc3,	loop_2471
	fmovdle	%icc,	%f8,	%f29
	sth	%i7,	[%l7 + 0x14]
	ldd	[%l7 + 0x08],	%o2
loop_2471:
	move	%icc,	%i4,	%l0
	fandnot2	%f6,	%f16,	%f26
	edge32ln	%l2,	%o7,	%l5
	fornot1	%f10,	%f26,	%f24
	movrgz	%g1,	%l4,	%i3
	umul	%g7,	%o5,	%i1
	brz	%g3,	loop_2472
	bne,a,pn	%icc,	loop_2473
	membar	0x1B
	movn	%xcc,	%i5,	%o6
loop_2472:
	fbo,a	%fcc2,	loop_2474
loop_2473:
	xnor	%o1,	%o0,	%g6
	subcc	%l3,	%i2,	%o2
	udivx	%o4,	0x1DA7,	%l1
loop_2474:
	fba,a	%fcc1,	loop_2475
	stb	%g5,	[%l7 + 0x63]
	set	0x70, %o0
	lduba	[%l7 + %o0] 0x80,	%g2
loop_2475:
	fpsub16s	%f13,	%f29,	%f17
	st	%f23,	[%l7 + 0x4C]
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x28] %asi,	%g4
	tsubcc	%i6,	0x0199,	%i0
	nop
	fitod	%f2,	%f0
	fdtoi	%f0,	%f15
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%i7
	fsrc1	%f0,	%f16
	xorcc	%i4,	%l0,	%l2
	movcs	%icc,	%o3,	%o7
	smul	%l5,	%l4,	%i3
	fble,a	%fcc1,	loop_2476
	fmovd	%f2,	%f18
	tpos	%xcc,	0x1
	array8	%g7,	%g1,	%o5
loop_2476:
	srl	%g3,	%i1,	%i5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x48] %asi,	%o1
	nop
	setx	0x58A4255F104ACF5E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	subcc	%o0,	0x16CC,	%o6
	bge	%xcc,	loop_2477
	tleu	%icc,	0x5
	orncc	%l3,	0x000F,	%g6
	flush	%l7 + 0x10
loop_2477:
	and	%o2,	%i2,	%l1
	sethi	0x117E,	%g5
	ldsb	[%l7 + 0x2C],	%g2
	membar	0x75
	bneg,pt	%icc,	loop_2478
	taddcctv	%o4,	%g4,	%i0
	fabss	%f16,	%f15
	edge32ln	%l6,	%i7,	%i4
loop_2478:
	fbge,a	%fcc2,	loop_2479
	xnorcc	%l0,	0x057C,	%l2
	fpsub16	%f18,	%f14,	%f8
	and	%i6,	%o7,	%l5
loop_2479:
	fandnot2s	%f19,	%f26,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x17E8
	subccc	%l4,	%i3,	%o3
	fcmpeq16	%f4,	%f24,	%g1
	fmovrsne	%o5,	%f24,	%f27
	tpos	%xcc,	0x0
	fnot2	%f12,	%f0
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x13] %asi,	%g7
	andncc	%i1,	%i5,	%o1
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x74] %asi,	%g3
	call	loop_2480
	edge8	%o6,	%o0,	%g6
	fmovrsgz	%o2,	%f6,	%f10
	fmovrde	%l3,	%f14,	%f0
loop_2480:
	movrgz	%i2,	%l1,	%g5
	alignaddr	%g2,	%o4,	%g4
	be	%icc,	loop_2481
	lduh	[%l7 + 0x72],	%i0
	bge,a	%icc,	loop_2482
	stx	%i7,	[%l7 + 0x28]
loop_2481:
	tsubcc	%l6,	%l0,	%l2
	fmuld8sux16	%f5,	%f6,	%f22
loop_2482:
	nop
	fitos	%f2,	%f30
	fstod	%f30,	%f22
	tleu	%icc,	0x3
	movn	%icc,	%i6,	%i4
	fmovd	%f18,	%f16
	subc	%l5,	%o7,	%l4
	bgu,a	loop_2483
	xnor	%o3,	%i3,	%g1
	tge	%icc,	0x3
	sll	%o5,	0x1D,	%i1
loop_2483:
	movn	%xcc,	%i5,	%o1
	fmul8ulx16	%f22,	%f22,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g3,	%g7
	sdivcc	%o0,	0x07CE,	%o6
	smul	%o2,	0x1C43,	%g6
	srax	%i2,	%l3,	%g5
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l1
	edge8n	%g2,	%o4,	%i0
	brgz	%g4,	loop_2484
	fpsub32s	%f1,	%f30,	%f2
	sub	%l6,	0x030B,	%l0
	edge32l	%l2,	%i7,	%i4
loop_2484:
	sdivcc	%i6,	0x08F9,	%l5
	smulcc	%o7,	0x169C,	%l4
	tsubcc	%i3,	0x1B42,	%g1
	xor	%o3,	%i1,	%o5
	sdiv	%i5,	0x1213,	%g3
	set	0x38, %i7
	ldxa	[%l7 + %i7] 0x81,	%o1
	fbu,a	%fcc3,	loop_2485
	edge8n	%o0,	%g7,	%o6
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x14] %asi,	%g6
loop_2485:
	movvc	%xcc,	%o2,	%l3
	or	%g5,	%l1,	%i2
	edge32ln	%o4,	%g2,	%g4
	nop
	setx	0x69E77E4723B694E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f12
	tl	%xcc,	0x3
	be,a	loop_2486
	fmovdcc	%xcc,	%f4,	%f3
	sir	0x1599
	movgu	%xcc,	%l6,	%l0
loop_2486:
	tneg	%icc,	0x3
	umul	%l2,	%i0,	%i7
	wr	%g0,	0x80,	%asi
	stha	%i6,	[%l7 + 0x54] %asi
	fpsub16	%f24,	%f20,	%f0
	popc	%l5,	%o7
	movrgez	%i4,	%l4,	%g1
	fblg	%fcc0,	loop_2487
	subcc	%o3,	0x1D98,	%i1
	wr	%g0,	0x10,	%asi
	stba	%o5,	[%l7 + 0x26] %asi
loop_2487:
	tl	%icc,	0x2
	bn,a,pn	%icc,	loop_2488
	sdivx	%i3,	0x1E51,	%g3
	set	0x30, %g1
	ldxa	[%g0 + %g1] 0x4f,	%o1
loop_2488:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%i5
	fbule	%fcc2,	loop_2489
	umulcc	%g7,	0x0C1C,	%o6
	tl	%xcc,	0x7
	movrgez	%o0,	0x3DB,	%o2
loop_2489:
	sdiv	%l3,	0x1951,	%g5
	mulscc	%g6,	0x1F9C,	%i2
	bg,a	%icc,	loop_2490
	membar	0x3B
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o4,	0x1299,	%g2
loop_2490:
	movrlz	%g4,	%l6,	%l1
	tle	%xcc,	0x6
	edge8	%l2,	%l0,	%i0
	ble	%xcc,	loop_2491
	bvc,a,pt	%icc,	loop_2492
	array8	%i7,	%i6,	%o7
	brgez,a	%l5,	loop_2493
loop_2491:
	edge16n	%l4,	%g1,	%i4
loop_2492:
	xnorcc	%o3,	0x1FAF,	%o5
	brz,a	%i1,	loop_2494
loop_2493:
	tcs	%xcc,	0x4
	tleu	%xcc,	0x1
	fandnot1	%f2,	%f8,	%f14
loop_2494:
	taddcc	%g3,	0x0606,	%o1
	fpadd32s	%f6,	%f4,	%f28
	sdivx	%i5,	0x0B12,	%g7
	tg	%xcc,	0x7
	srlx	%o6,	%o0,	%o2
	edge32n	%i3,	%l3,	%g6
	fmovsa	%xcc,	%f23,	%f0
	sdivx	%g5,	0x06A4,	%o4
	fbug	%fcc1,	loop_2495
	st	%f27,	[%l7 + 0x0C]
	fmul8x16al	%f6,	%f30,	%f8
	sdivx	%g2,	0x1E15,	%g4
loop_2495:
	nop
	fitos	%f0,	%f13
	be,a	%icc,	loop_2496
	edge8n	%l6,	%l1,	%i2
	taddcc	%l2,	%l0,	%i7
	fcmple16	%f10,	%f8,	%i6
loop_2496:
	sub	%i0,	%l5,	%o7
	ba,a	loop_2497
	ta	%xcc,	0x3
	movn	%xcc,	%l4,	%g1
	ble,a	loop_2498
loop_2497:
	umulcc	%o3,	%i4,	%i1
	edge16ln	%g3,	%o5,	%i5
	xor	%o1,	%o6,	%g7
loop_2498:
	fbg	%fcc2,	loop_2499
	fmovdleu	%icc,	%f10,	%f6
	array16	%o2,	%o0,	%i3
	movrlez	%l3,	%g5,	%o4
loop_2499:
	fxors	%f7,	%f6,	%f5
	movrlz	%g2,	%g4,	%l6
	udivcc	%l1,	0x0392,	%g6
	move	%xcc,	%i2,	%l0
	andcc	%i7,	%l2,	%i6
	subccc	%l5,	%i0,	%o7
	tleu	%icc,	0x1
	brlz	%g1,	loop_2500
	tge	%xcc,	0x2
	fmovscs	%icc,	%f18,	%f14
	edge16	%l4,	%o3,	%i1
loop_2500:
	nop
	set	0x78, %o5
	lduwa	[%l7 + %o5] 0x15,	%i4
	sll	%o5,	0x08,	%i5
	mulx	%o1,	0x0AC9,	%o6
	subc	%g3,	0x0735,	%o2
	tsubcctv	%o0,	%g7,	%i3
	andncc	%g5,	%l3,	%o4
	sll	%g4,	%l6,	%l1
	bneg	loop_2501
	stw	%g6,	[%l7 + 0x50]
	fmovspos	%icc,	%f23,	%f29
	movpos	%icc,	%i2,	%g2
loop_2501:
	sethi	0x0061,	%i7
	movg	%xcc,	%l0,	%l2
	fmovrsne	%l5,	%f29,	%f28
	set	0x28, %g3
	swapa	[%l7 + %g3] 0x18,	%i6
	sll	%o7,	0x1D,	%g1
	fpadd16	%f10,	%f26,	%f14
	tvc	%xcc,	0x0
	srax	%l4,	%i0,	%o3
	edge32	%i4,	%i1,	%i5
	tle	%icc,	0x2
	movrne	%o1,	%o5,	%g3
	subcc	%o2,	0x1537,	%o6
	tgu	%xcc,	0x3
	udivcc	%g7,	0x132E,	%i3
	nop
	setx	0x42205B8496AF7E96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x6E257D6C602FA12A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f16,	%f22
	edge32ln	%o0,	%g5,	%l3
	fmovrsgez	%g4,	%f19,	%f1
	andcc	%o4,	0x0467,	%l6
	movge	%xcc,	%l1,	%i2
	add	%g2,	%g6,	%i7
	umul	%l0,	%l5,	%l2
	nop
	setx	0x57706404C85B574D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f14
	add	%l7,	0x64,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x11,	%i6,	%o7
	set	0x50, %l3
	stwa	%l4,	[%l7 + %l3] 0xeb
	membar	#Sync
	edge8n	%g1,	%i0,	%i4
	taddcctv	%i1,	%i5,	%o3
	sdivcc	%o1,	0x0061,	%o5
	bcc,a,pn	%xcc,	loop_2502
	fabsd	%f4,	%f10
	move	%icc,	%o2,	%o6
	umul	%g7,	0x0CDD,	%g3
loop_2502:
	fpadd32	%f2,	%f22,	%f16
	sir	0x0883
	tcc	%icc,	0x3
	ta	%xcc,	0x2
	edge32ln	%o0,	%i3,	%l3
	fmovda	%xcc,	%f1,	%f6
	mulx	%g5,	%o4,	%g4
	fbl,a	%fcc1,	loop_2503
	fmovscs	%icc,	%f29,	%f30
	fmul8x16al	%f18,	%f10,	%f8
	sethi	0x0E42,	%l1
loop_2503:
	brz	%l6,	loop_2504
	ba,pn	%xcc,	loop_2505
	fmovdleu	%xcc,	%f8,	%f12
	fmovsvc	%xcc,	%f24,	%f28
loop_2504:
	tsubcctv	%i2,	0x1846,	%g6
loop_2505:
	nop
	setx	0x006CDC960FC0F360,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x97739B3B016716A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f28,	%f16
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x47] %asi,	%i7
	edge32ln	%l0,	%g2,	%l2
	and	%l5,	%o7,	%i6
	call	loop_2506
	fxor	%f22,	%f24,	%f22
	fmovrdgez	%l4,	%f22,	%f8
	std	%f10,	[%l7 + 0x68]
loop_2506:
	fpadd32s	%f8,	%f8,	%f15
	fmovrsgz	%g1,	%f28,	%f12
	bleu,a	%icc,	loop_2507
	bgu,pn	%xcc,	loop_2508
	orncc	%i0,	0x0A1C,	%i1
	fbug	%fcc1,	loop_2509
loop_2507:
	ldsb	[%l7 + 0x2E],	%i5
loop_2508:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x44] %asi,	%f3
loop_2509:
	fmovdleu	%xcc,	%f6,	%f24
	array16	%o3,	%o1,	%o5
	ldd	[%l7 + 0x08],	%f30
	fmovrslz	%o2,	%f3,	%f0
	tcc	%icc,	0x2
	movleu	%icc,	%i4,	%o6
	fmovdvc	%xcc,	%f5,	%f16
	nop
	set	0x58, %g7
	ldx	[%l7 + %g7],	%g3
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o0,	%i3
	fbe,a	%fcc2,	loop_2510
	movrne	%l3,	0x038,	%g7
	movrgz	%g5,	%g4,	%o4
	srl	%l1,	0x15,	%i2
loop_2510:
	edge16n	%l6,	%g6,	%l0
	ldstub	[%l7 + 0x1E],	%i7
	edge32	%l2,	%l5,	%o7
	ldsh	[%l7 + 0x30],	%i6
	ldx	[%l7 + 0x70],	%g2
	or	%g1,	%i0,	%l4
	xnor	%i1,	%i5,	%o3
	fsrc2s	%f26,	%f25
	edge32l	%o1,	%o2,	%i4
	tsubcc	%o5,	0x0B2F,	%g3
	srlx	%o0,	0x10,	%o6
	tvs	%xcc,	0x0
	fmovsge	%icc,	%f12,	%f9
	edge16	%l3,	%g7,	%g5
	or	%i3,	%o4,	%g4
	sll	%i2,	%l6,	%l1
	bcs	%icc,	loop_2511
	udivx	%g6,	0x10D4,	%i7
	movcs	%xcc,	%l2,	%l0
	tgu	%icc,	0x5
loop_2511:
	smul	%l5,	0x0D0C,	%o7
	sdivcc	%i6,	0x062F,	%g2
	bvs,a,pt	%xcc,	loop_2512
	taddcc	%i0,	0x0E6F,	%l4
	fpack16	%f30,	%f2
	taddcctv	%i1,	0x1543,	%g1
loop_2512:
	movge	%xcc,	%o3,	%i5
	movrgz	%o1,	%i4,	%o5
	fbl	%fcc0,	loop_2513
	nop
	set	0x70, %g4
	std	%f26,	[%l7 + %g4]
	call	loop_2514
	movg	%xcc,	%o2,	%g3
loop_2513:
	add	%o6,	%o0,	%l3
	movrlez	%g5,	0x348,	%i3
loop_2514:
	alignaddr	%o4,	%g7,	%g4
	fmuld8ulx16	%f5,	%f11,	%f28
	subc	%i2,	%l1,	%l6
	fbo	%fcc1,	loop_2515
	mulscc	%i7,	0x14EE,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x58] %asi,	%l0
loop_2515:
	add	%l5,	0x14CB,	%o7
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bleu,a,pt	%icc,	loop_2516
	edge8n	%i6,	%g2,	%i0
	orcc	%l2,	%l4,	%i1
	membar	0x49
loop_2516:
	edge32l	%o3,	%g1,	%o1
	edge32ln	%i4,	%o5,	%i5
	set	0x18, %o1
	prefetcha	[%l7 + %o1] 0x0c,	 0x0
	lduw	[%l7 + 0x3C],	%o2
	ldd	[%l7 + 0x10],	%o6
	swap	[%l7 + 0x74],	%l3
	movcs	%xcc,	%g5,	%i3
	fba,a	%fcc3,	loop_2517
	addccc	%o0,	%g7,	%o4
	subc	%i2,	0x098D,	%l1
	srlx	%l6,	0x1F,	%g4
loop_2517:
	sdiv	%i7,	0x1CD4,	%l0
	tne	%icc,	0x6
	sethi	0x16F2,	%l5
	sdiv	%o7,	0x01F5,	%g6
	fnegd	%f0,	%f8
	mova	%icc,	%g2,	%i6
	fnot2s	%f24,	%f22
	nop
	setx loop_2518, %l0, %l1
	jmpl %l1, %i0
	bgu,a,pt	%icc,	loop_2519
	movleu	%xcc,	%l4,	%i1
	bg,a,pn	%xcc,	loop_2520
loop_2518:
	tvc	%xcc,	0x7
loop_2519:
	movleu	%xcc,	%o3,	%g1
	xnorcc	%o1,	%i4,	%l2
loop_2520:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%i5,	loop_2521
	bvc,a	%icc,	loop_2522
	flush	%l7 + 0x20
	nop
	setx loop_2523, %l0, %l1
	jmpl %l1, %g3
loop_2521:
	sdivx	%o5,	0x0A0A,	%o6
loop_2522:
	smul	%o2,	%g5,	%l3
	addccc	%i3,	0x07D5,	%o0
loop_2523:
	array8	%g7,	%o4,	%i2
	sir	0x0867
	fmovrde	%l1,	%f18,	%f0
	sethi	0x1732,	%g4
	nop
	set	0x3D, %l4
	stb	%i7,	[%l7 + %l4]
	movrlz	%l0,	%l5,	%o7
	fandnot1s	%f25,	%f14,	%f17
	tle	%icc,	0x6
	ldstub	[%l7 + 0x54],	%g6
	smul	%l6,	0x1260,	%i6
	movvc	%icc,	%i0,	%g2
	fandnot2s	%f13,	%f1,	%f26
	tle	%icc,	0x2
	ba,a,pn	%icc,	loop_2524
	udiv	%i1,	0x0CEA,	%o3
	xorcc	%g1,	0x0510,	%o1
	tneg	%icc,	0x0
loop_2524:
	nop
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x16
	membar	#Sync
	movne	%xcc,	%i4,	%l4
	fbo,a	%fcc0,	loop_2525
	fbule,a	%fcc1,	loop_2526
	tne	%xcc,	0x3
	addccc	%l2,	%g3,	%o5
loop_2525:
	tl	%xcc,	0x6
loop_2526:
	mulx	%o6,	0x1737,	%o2
	srax	%g5,	%l3,	%i5
	fmovdne	%icc,	%f8,	%f20
	bcc	loop_2527
	xorcc	%i3,	0x1F50,	%o0
	andcc	%o4,	0x1FFB,	%i2
	movrgez	%l1,	0x23D,	%g4
loop_2527:
	nop
	set	0x70, %o3
	stx	%g7,	[%l7 + %o3]
	alignaddr	%l0,	%i7,	%l5
	be	loop_2528
	movg	%icc,	%g6,	%l6
	umulcc	%i6,	0x1188,	%i0
	andcc	%o7,	0x0730,	%i1
loop_2528:
	fbne,a	%fcc0,	loop_2529
	bne	loop_2530
	lduh	[%l7 + 0x0C],	%g2
	edge8n	%o3,	%g1,	%i4
loop_2529:
	andcc	%o1,	0x0D40,	%l4
loop_2530:
	stx	%g3,	[%l7 + 0x78]
	ta	%icc,	0x5
	edge32ln	%l2,	%o6,	%o5
	addccc	%o2,	%g5,	%l3
	fmovsg	%xcc,	%f16,	%f7
	nop
	fitos	%f11,	%f13
	fstoi	%f13,	%f2
	andcc	%i3,	0x0D19,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o4,	%i5
	tcc	%xcc,	0x0
	bgu,a,pn	%icc,	loop_2531
	tvc	%xcc,	0x6
	movrgez	%i2,	%g4,	%g7
	orn	%l0,	0x0049,	%i7
loop_2531:
	addcc	%l5,	%l1,	%g6
	alignaddr	%i6,	%l6,	%o7
	tpos	%xcc,	0x0
	fmovscs	%xcc,	%f23,	%f9
	membar	0x4D
	sir	0x1C64
	stb	%i1,	[%l7 + 0x24]
	fands	%f9,	%f22,	%f0
	fmovrdlez	%i0,	%f28,	%f0
	tvs	%xcc,	0x6
	set	0x48, %i1
	ldswa	[%l7 + %i1] 0x81,	%g2
	set	0x18, %l6
	stxa	%g1,	[%g0 + %l6] 0x4f
	andncc	%i4,	%o3,	%o1
	sll	%g3,	%l2,	%l4
	movrlez	%o6,	%o5,	%o2
	ldd	[%l7 + 0x48],	%f28
	sir	0x1D22
	nop
	setx	0xAF953403,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x69FFB686,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f13,	%f17
	lduh	[%l7 + 0x20],	%l3
	sir	0x0BA2
	tleu	%icc,	0x1
	stb	%i3,	[%l7 + 0x15]
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x6A] %asi,	%o0
	edge8ln	%g5,	%o4,	%i2
	set	0x63, %l2
	stba	%g4,	[%l7 + %l2] 0xe2
	membar	#Sync
	umul	%g7,	0x117B,	%i5
	sethi	0x110D,	%i7
	bshuffle	%f14,	%f16,	%f16
	xor	%l5,	0x040F,	%l0
	sth	%g6,	[%l7 + 0x1C]
	fbue	%fcc2,	loop_2532
	edge8n	%l1,	%i6,	%l6
	fbg	%fcc2,	loop_2533
	umul	%o7,	0x02AA,	%i1
loop_2532:
	movgu	%icc,	%i0,	%g2
	sra	%i4,	%g1,	%o1
loop_2533:
	add	%o3,	0x152F,	%l2
	movvc	%icc,	%g3,	%o6
	edge16	%o5,	%l4,	%o2
	set	0x56, %o4
	ldsha	[%l7 + %o4] 0x18,	%l3
	tsubcc	%o0,	%g5,	%i3
	fsrc1	%f18,	%f28
	fmuld8ulx16	%f18,	%f16,	%f10
	lduw	[%l7 + 0x24],	%o4
	sethi	0x001F,	%g4
	srlx	%i2,	0x03,	%g7
	swap	[%l7 + 0x14],	%i7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l5,	%l0
	fbg,a	%fcc0,	loop_2534
	fbne	%fcc1,	loop_2535
	sdivcc	%g6,	0x1133,	%l1
	edge8ln	%i6,	%i5,	%l6
loop_2534:
	pdist	%f26,	%f20,	%f22
loop_2535:
	tpos	%xcc,	0x5
	taddcc	%o7,	0x1987,	%i1
	fbn	%fcc2,	loop_2536
	nop
	setx	0xE2E720D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f4
	brlez	%g2,	loop_2537
	lduh	[%l7 + 0x72],	%i4
loop_2536:
	fmul8x16	%f0,	%f26,	%f6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2537:
	brlez,a	%i0,	loop_2538
	prefetch	[%l7 + 0x54],	 0x2
	nop
	fitos	%f7,	%f3
	fstox	%f3,	%f22
	fxtos	%f22,	%f18
	fcmpne32	%f4,	%f26,	%o1
loop_2538:
	orncc	%g1,	0x0CF6,	%l2
	fmovdgu	%icc,	%f7,	%f26
	move	%icc,	%g3,	%o3
	tleu	%xcc,	0x1
	edge32	%o6,	%l4,	%o2
	sll	%o5,	0x1D,	%o0
	alignaddr	%g5,	%l3,	%i3
	fmovdge	%icc,	%f3,	%f19
	xnorcc	%g4,	%o4,	%g7
	move	%icc,	%i2,	%l5
	tn	%xcc,	0x7
	nop
	set	0x13, %o6
	ldub	[%l7 + %o6],	%l0
	edge8n	%g6,	%i7,	%l1
	lduh	[%l7 + 0x44],	%i5
	array16	%i6,	%l6,	%o7
	ldd	[%l7 + 0x78],	%f28
	addcc	%g2,	%i4,	%i0
	fmovrdgez	%i1,	%f2,	%f4
	fbne	%fcc1,	loop_2539
	andcc	%o1,	%l2,	%g1
	nop
	set	0x08, %l5
	ldsw	[%l7 + %l5],	%o3
	bl,a,pt	%icc,	loop_2540
loop_2539:
	addccc	%o6,	%g3,	%o2
	orncc	%o5,	0x02FF,	%l4
	fcmpeq16	%f24,	%f0,	%o0
loop_2540:
	udiv	%l3,	0x0241,	%g5
	fmul8x16au	%f20,	%f25,	%f22
	add	%i3,	%o4,	%g4
	ble,a	%icc,	loop_2541
	tle	%xcc,	0x3
	sir	0x1968
	sdiv	%i2,	0x147C,	%l5
loop_2541:
	prefetch	[%l7 + 0x1C],	 0x3
	edge32l	%l0,	%g6,	%g7
	udiv	%i7,	0x10AD,	%i5
	ta	%xcc,	0x0
	nop
	setx	loop_2542,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%i6,	0x0583,	%l6
	fcmpeq16	%f14,	%f4,	%o7
	tle	%xcc,	0x1
loop_2542:
	fmovrdlez	%l1,	%f30,	%f0
	fpsub16s	%f21,	%f4,	%f31
	udiv	%g2,	0x01B9,	%i0
	umul	%i1,	0x0EDC,	%o1
	andn	%l2,	%i4,	%g1
	set	0x68, %i3
	ldsba	[%l7 + %i3] 0x10,	%o3
	umul	%g3,	0x0001,	%o6
	fmovdcc	%icc,	%f13,	%f19
	umul	%o5,	%l4,	%o0
	edge32l	%o2,	%l3,	%g5
	fmovrsgez	%o4,	%f25,	%f3
	nop
	setx	0x27918375D071FC13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fmovdvs	%icc,	%f27,	%f21
	nop
	setx	0x14141CD8296C4954,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x49DE7406D170D957,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f4,	%f30
	lduw	[%l7 + 0x18],	%i3
	sethi	0x0FA6,	%g4
	add	%l5,	0x079E,	%l0
	tg	%xcc,	0x2
	tsubcc	%i2,	0x0D97,	%g7
	xor	%g6,	0x1ABF,	%i5
	sethi	0x0360,	%i7
	udiv	%l6,	0x15C5,	%i6
	subcc	%o7,	%g2,	%l1
	and	%i1,	0x12C1,	%i0
	tsubcc	%l2,	0x02BB,	%o1
	fsrc1	%f8,	%f0
	bg	loop_2543
	add	%g1,	0x1075,	%o3
	fmovsvc	%icc,	%f9,	%f16
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x80,	%i4,	%o6
loop_2543:
	movneg	%xcc,	%g3,	%l4
	prefetch	[%l7 + 0x58],	 0x1
	fmovdl	%icc,	%f16,	%f1
	tneg	%icc,	0x5
	sdiv	%o0,	0x1E19,	%o2
	andn	%o5,	0x140B,	%g5
	orn	%l3,	0x032D,	%i3
	nop
	setx loop_2544, %l0, %l1
	jmpl %l1, %g4
	addc	%l5,	%l0,	%o4
	fpadd32s	%f19,	%f15,	%f4
	sdivcc	%i2,	0x1291,	%g7
loop_2544:
	tneg	%icc,	0x6
	sdivx	%i5,	0x0390,	%g6
	movre	%l6,	0x0B1,	%i7
	fbuge,a	%fcc2,	loop_2545
	andncc	%o7,	%i6,	%g2
	movl	%xcc,	%i1,	%i0
	stx	%l1,	[%l7 + 0x18]
loop_2545:
	movrne	%l2,	0x394,	%o1
	sdivx	%o3,	0x0B77,	%g1
	sethi	0x0344,	%o6
	movrne	%i4,	%l4,	%g3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o0
	ld	[%l7 + 0x2C],	%f24
	sllx	%o2,	%o5,	%l3
	movne	%xcc,	%i3,	%g4
	ldsb	[%l7 + 0x63],	%l5
	movrne	%g5,	%o4,	%l0
	addccc	%g7,	%i5,	%i2
	edge32ln	%l6,	%i7,	%g6
	pdist	%f24,	%f20,	%f0
	tvc	%xcc,	0x6
	ble,a	loop_2546
	ble,pt	%icc,	loop_2547
	subcc	%o7,	0x0199,	%g2
	movgu	%icc,	%i6,	%i0
loop_2546:
	fmovdleu	%xcc,	%f8,	%f17
loop_2547:
	nop
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x1f
	membar	#Sync
	mulscc	%l1,	0x0634,	%i1
	sll	%o1,	0x0F,	%o3
	movcc	%icc,	%l2,	%g1
	tcs	%icc,	0x2
	mulx	%o6,	%l4,	%i4
	ldd	[%l7 + 0x20],	%o0
	wr	%g0,	0x18,	%asi
	stxa	%o2,	[%l7 + 0x68] %asi
	edge16n	%g3,	%o5,	%l3
	ldd	[%l7 + 0x38],	%i2
	fmovrdne	%l5,	%f12,	%f24
	fmovdn	%icc,	%f3,	%f23
	fble	%fcc0,	loop_2548
	fmovscc	%icc,	%f6,	%f13
	sll	%g5,	0x19,	%o4
	sdivx	%l0,	0x0A1A,	%g4
loop_2548:
	fmovrdne	%g7,	%f30,	%f28
	wr	%g0,	0xe3,	%asi
	stxa	%i5,	[%l7 + 0x50] %asi
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x19,	%i6
	bge,a,pn	%icc,	loop_2549
	tg	%icc,	0x1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%g6
loop_2549:
	movl	%icc,	%o7,	%i2
	set	0x3C, %l0
	stha	%g2,	[%l7 + %l0] 0x19
	orncc	%i0,	%l1,	%i1
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	smulcc	%o3,	%i6,	%g1
	wr	%g0,	0x2a,	%asi
	stha	%o6,	[%l7 + 0x54] %asi
	membar	#Sync
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x63] %asi,	%l4
	ldx	[%l7 + 0x58],	%l2
	movneg	%icc,	%o0,	%i4
	nop
	setx	0x7FFCEC9E326B04B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x155DA95D3ABBF106,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f2,	%f28
	movge	%icc,	%o2,	%g3
	movvs	%xcc,	%l3,	%i3
	edge32	%l5,	%o5,	%o4
	fnot1	%f0,	%f12
	tl	%icc,	0x0
	mulscc	%l0,	%g4,	%g5
	fbl,a	%fcc3,	loop_2550
	faligndata	%f4,	%f28,	%f2
	fmovscc	%xcc,	%f30,	%f30
	movcc	%xcc,	%g7,	%l6
loop_2550:
	sra	%i7,	0x00,	%i5
	movrlez	%o7,	%g6,	%g2
	ldstub	[%l7 + 0x27],	%i0
	srl	%l1,	0x04,	%i1
	udivx	%i2,	0x1B74,	%o1
	subcc	%i6,	0x1098,	%o3
	ldsh	[%l7 + 0x4A],	%g1
	fbul,a	%fcc2,	loop_2551
	fpadd32s	%f27,	%f31,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o6,	0x005D,	%l2
loop_2551:
	ldsb	[%l7 + 0x1D],	%o0
	tcs	%icc,	0x3
	stbar
	edge32n	%i4,	%o2,	%g3
	movvc	%icc,	%l4,	%i3
	array32	%l3,	%l5,	%o4
	mova	%xcc,	%l0,	%o5
	umul	%g4,	%g5,	%l6
	array32	%g7,	%i7,	%i5
	taddcctv	%g6,	%g2,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f20,	%f12,	%l1
	alignaddr	%i1,	%i0,	%o1
	sethi	0x18F7,	%i6
	sdivcc	%i2,	0x04EE,	%o3
	sethi	0x147E,	%o6
	alignaddrl	%g1,	%o0,	%i4
	fbn,a	%fcc3,	loop_2552
	tl	%icc,	0x1
	ldub	[%l7 + 0x17],	%o2
	movl	%icc,	%l2,	%g3
loop_2552:
	brgez	%i3,	loop_2553
	tvc	%icc,	0x0
	nop
	fitos	%f1,	%f22
	fstox	%f22,	%f8
	fmovsa	%xcc,	%f10,	%f6
loop_2553:
	stx	%l4,	[%l7 + 0x50]
	fmovda	%xcc,	%f1,	%f0
	fsrc2s	%f14,	%f4
	tge	%icc,	0x7
	fmovsneg	%icc,	%f0,	%f0
	srlx	%l3,	%o4,	%l5
	fmovscs	%xcc,	%f5,	%f27
	subcc	%o5,	0x07F4,	%g4
	ble,a	%xcc,	loop_2554
	fmovdne	%icc,	%f20,	%f30
	bpos,a	%icc,	loop_2555
	fmovrse	%g5,	%f21,	%f18
loop_2554:
	st	%f31,	[%l7 + 0x0C]
	umulcc	%l6,	%l0,	%g7
loop_2555:
	fpsub32s	%f8,	%f14,	%f13
	fba,a	%fcc2,	loop_2556
	sethi	0x15D0,	%i7
	ldsb	[%l7 + 0x1E],	%g6
	tne	%icc,	0x0
loop_2556:
	fbe,a	%fcc3,	loop_2557
	nop
	setx	loop_2558,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%g2,	0x1919,	%o7
	ble,pn	%icc,	loop_2559
loop_2557:
	mova	%xcc,	%i5,	%i1
loop_2558:
	stx	%l1,	[%l7 + 0x70]
	movl	%icc,	%i0,	%i6
loop_2559:
	or	%o1,	%o3,	%i2
	wr	%g0,	0x10,	%asi
	stxa	%g1,	[%l7 + 0x28] %asi
	movleu	%icc,	%o0,	%i4
	ldsb	[%l7 + 0x39],	%o2
	tle	%xcc,	0x7
	ldd	[%l7 + 0x20],	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g3,	%o6,	%l4
	edge16ln	%l3,	%i3,	%o4
	edge8ln	%l5,	%g4,	%g5
	sethi	0x15B8,	%o5
	bpos,pn	%xcc,	loop_2560
	and	%l6,	%l0,	%g7
	xnor	%i7,	%g2,	%o7
	movrlz	%i5,	%i1,	%l1
loop_2560:
	mova	%xcc,	%g6,	%i0
	movcs	%icc,	%i6,	%o3
	fmovdge	%xcc,	%f18,	%f5
	swap	[%l7 + 0x18],	%o1
	edge16n	%g1,	%i2,	%o0
	sub	%i4,	%o2,	%l2
	swap	[%l7 + 0x28],	%g3
	nop
	setx loop_2561, %l0, %l1
	jmpl %l1, %l4
	mulx	%l3,	%i3,	%o6
	bneg	loop_2562
	fmovsne	%icc,	%f9,	%f17
loop_2561:
	edge16ln	%o4,	%g4,	%l5
	movvc	%xcc,	%o5,	%l6
loop_2562:
	fmovdgu	%xcc,	%f21,	%f20
	sll	%l0,	0x18,	%g5
	umulcc	%i7,	0x13D6,	%g7
	mova	%xcc,	%g2,	%i5
	nop
	setx	0x13BD7B9C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f29
	movl	%xcc,	%i1,	%o7
	fmovsle	%xcc,	%f29,	%f16
	ld	[%l7 + 0x1C],	%f9
	brlez,a	%l1,	loop_2563
	sethi	0x0212,	%i0
	movleu	%icc,	%g6,	%o3
	alignaddr	%i6,	%g1,	%i2
loop_2563:
	edge8l	%o0,	%i4,	%o1
	andcc	%l2,	%g3,	%l4
	andn	%l3,	%o2,	%o6
	bgu	%xcc,	loop_2564
	bne,a,pt	%icc,	loop_2565
	array16	%i3,	%g4,	%l5
	stw	%o5,	[%l7 + 0x08]
loop_2564:
	edge16l	%l6,	%o4,	%g5
loop_2565:
	stbar
	fsrc1s	%f7,	%f27
	fpsub32s	%f9,	%f31,	%f9
	edge16l	%i7,	%l0,	%g2
	set	0x7C, %i4
	lda	[%l7 + %i4] 0x10,	%f6
	stx	%g7,	[%l7 + 0x20]
	fbl	%fcc3,	loop_2566
	edge16n	%i5,	%i1,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o7,	%i0
loop_2566:
	umul	%g6,	%i6,	%g1
	udiv	%o3,	0x0F62,	%i2
	movn	%xcc,	%o0,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o1,	%l2
	edge8l	%g3,	%l3,	%l4
	movge	%xcc,	%o6,	%i3
	sllx	%o2,	0x19,	%l5
	movrgz	%g4,	%l6,	%o4
	brz,a	%g5,	loop_2567
	fbug	%fcc1,	loop_2568
	taddcc	%i7,	%l0,	%g2
	addc	%o5,	%i5,	%i1
loop_2567:
	subcc	%g7,	0x13E8,	%l1
loop_2568:
	addcc	%o7,	%i0,	%i6
	fmovdneg	%icc,	%f23,	%f29
	prefetch	[%l7 + 0x18],	 0x0
	sll	%g6,	0x1C,	%g1
	fmul8sux16	%f4,	%f24,	%f6
	fmovrdne	%i2,	%f8,	%f30
	fcmpeq16	%f2,	%f20,	%o0
	andn	%o3,	0x1311,	%o1
	nop
	setx	0xE178A43B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x50FF5E62,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f24,	%f6
	subccc	%i4,	%g3,	%l2
	lduw	[%l7 + 0x20],	%l4
	andn	%l3,	%o6,	%o2
	swap	[%l7 + 0x34],	%l5
	orncc	%i3,	%l6,	%o4
	edge32ln	%g4,	%g5,	%i7
	tgu	%xcc,	0x4
	movrgz	%l0,	%o5,	%g2
	fmovsgu	%icc,	%f14,	%f23
	brnz,a	%i1,	loop_2569
	alignaddrl	%g7,	%l1,	%i5
	for	%f2,	%f20,	%f8
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%i6
loop_2569:
	movpos	%xcc,	%g6,	%i0
	addccc	%g1,	0x0356,	%o0
	sllx	%o3,	0x11,	%o1
	fpsub32s	%f19,	%f30,	%f3
	tvc	%icc,	0x6
	edge16ln	%i4,	%g3,	%i2
	addc	%l4,	0x0F65,	%l2
	and	%l3,	0x111F,	%o6
	tsubcctv	%o2,	0x0AEA,	%i3
	fmovscc	%xcc,	%f24,	%f0
	nop
	setx	loop_2570,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16au	%f30,	%f15,	%f18
	smul	%l5,	0x10DD,	%l6
	fxnors	%f25,	%f19,	%f19
loop_2570:
	sdivcc	%g4,	0x06B2,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g5,	%i7,	%l0
	wr	%g0,	0x2b,	%asi
	stha	%o5,	[%l7 + 0x42] %asi
	membar	#Sync
	sdivcc	%g2,	0x1B51,	%i1
	std	%f26,	[%l7 + 0x78]
	tsubcc	%l1,	%g7,	%o7
	edge8n	%i6,	%g6,	%i0
	ldub	[%l7 + 0x5E],	%i5
	sethi	0x024D,	%g1
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f4
	alignaddr	%o0,	%o1,	%i4
	fmovrsgez	%o3,	%f1,	%f10
	nop
	fitos	%f10,	%f31
	mulx	%i2,	%g3,	%l2
	xor	%l3,	%o6,	%o2
	nop
	fitos	%f11,	%f15
	fstox	%f15,	%f16
	fxtos	%f16,	%f11
	fmovdge	%icc,	%f21,	%f24
	bcc,pn	%xcc,	loop_2571
	umul	%l4,	%i3,	%l6
	sllx	%g4,	0x1A,	%o4
	movrgez	%l5,	%g5,	%l0
loop_2571:
	fpadd16	%f12,	%f14,	%f8
	fpsub32	%f12,	%f4,	%f16
	fpadd16	%f10,	%f20,	%f2
	bg,pn	%icc,	loop_2572
	tvc	%icc,	0x3
	fxnors	%f19,	%f20,	%f2
	srax	%o5,	0x14,	%g2
loop_2572:
	smulcc	%i1,	%l1,	%i7
	prefetch	[%l7 + 0x60],	 0x0
	fbu,a	%fcc1,	loop_2573
	array16	%g7,	%i6,	%g6
	sir	0x0401
	bneg,pn	%icc,	loop_2574
loop_2573:
	udivx	%o7,	0x185E,	%i0
	movrlez	%i5,	%o0,	%g1
	movge	%xcc,	%i4,	%o3
loop_2574:
	fmovsvc	%xcc,	%f4,	%f24
	xnor	%i2,	0x14CC,	%o1
	edge16n	%g3,	%l2,	%o6
	subcc	%l3,	%o2,	%l4
	addccc	%l6,	%g4,	%i3
	fmovda	%icc,	%f17,	%f6
	fsrc1	%f4,	%f18
	wr	%g0,	0x2a,	%asi
	stha	%l5,	[%l7 + 0x28] %asi
	membar	#Sync
	st	%f25,	[%l7 + 0x44]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x10ED
	movleu	%icc,	%g5,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o5,	0x1E,	%l1
	tcc	%icc,	0x4
	addc	%i1,	0x08AB,	%i7
	movvs	%icc,	%i6,	%g6
	edge16	%g7,	%o7,	%i5
	andn	%i0,	0x010B,	%g1
	stw	%i4,	[%l7 + 0x60]
	fcmpgt32	%f10,	%f2,	%o0
	subc	%o3,	0x1FEB,	%o1
	fandnot1s	%f9,	%f9,	%f11
	movrlez	%g3,	%i2,	%l2
	fnor	%f12,	%f12,	%f26
	array32	%o6,	%l3,	%l4
	srl	%l6,	0x05,	%g4
	sll	%o2,	%l5,	%i3
	fmovda	%xcc,	%f16,	%f9
	tl	%xcc,	0x2
	fbge,a	%fcc3,	loop_2575
	fpadd32	%f28,	%f18,	%f16
	wr	%g0,	0xea,	%asi
	stxa	%o4,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2575:
	nop
	set	0x2B, %i6
	ldsba	[%l7 + %i6] 0x0c,	%g5
	edge16n	%l0,	%g2,	%l1
	tle	%icc,	0x2
	orncc	%o5,	%i7,	%i6
	membar	0x0A
	fmul8sux16	%f24,	%f18,	%f26
	tne	%icc,	0x3
	xorcc	%g6,	0x04F6,	%g7
	addcc	%o7,	0x1496,	%i1
	edge32ln	%i5,	%i0,	%i4
	prefetch	[%l7 + 0x74],	 0x2
	brz,a	%g1,	loop_2576
	edge32	%o0,	%o1,	%o3
	edge16ln	%i2,	%l2,	%o6
	addccc	%g3,	0x1401,	%l3
loop_2576:
	nop
	set	0x4C, %g2
	sta	%f1,	[%l7 + %g2] 0x10
	smul	%l4,	%g4,	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l6,	%l5
	tn	%icc,	0x6
	movcc	%icc,	%i3,	%g5
	movrgez	%o4,	0x317,	%l0
	fbu,a	%fcc0,	loop_2577
	ldd	[%l7 + 0x30],	%f4
	tg	%icc,	0x7
	tg	%xcc,	0x5
loop_2577:
	umulcc	%g2,	0x1B85,	%o5
	smul	%l1,	%i7,	%i6
	edge16ln	%g7,	%o7,	%g6
	fbne,a	%fcc1,	loop_2578
	nop
	fitos	%f12,	%f11
	fstox	%f11,	%f10
	fxtos	%f10,	%f1
	fmovrsne	%i1,	%f24,	%f12
	tgu	%icc,	0x1
loop_2578:
	tg	%icc,	0x6
	fmul8x16	%f27,	%f0,	%f12
	set	0x5C, %l1
	stha	%i5,	[%l7 + %l1] 0x80
	edge16ln	%i0,	%g1,	%i4
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf1
	membar	#Sync
	edge32l	%o0,	%o1,	%i2
	te	%xcc,	0x2
	taddcc	%o3,	%o6,	%g3
	movcs	%xcc,	%l3,	%l4
	alignaddr	%g4,	%o2,	%l6
	array8	%l5,	%l2,	%i3
	lduw	[%l7 + 0x7C],	%o4
	movg	%icc,	%l0,	%g5
	ta	%xcc,	0x2
	fmovse	%icc,	%f27,	%f31
	fblg,a	%fcc3,	loop_2579
	tgu	%icc,	0x5
	andncc	%g2,	%o5,	%i7
	movvc	%icc,	%i6,	%g7
loop_2579:
	tcc	%xcc,	0x5
	fmovdpos	%icc,	%f24,	%f9
	tcs	%icc,	0x1
	andncc	%o7,	%g6,	%i1
	movrlez	%i5,	%l1,	%g1
	sir	0x11DA
	mulscc	%i0,	%i4,	%o1
	smulcc	%o0,	0x0A78,	%i2
	movg	%icc,	%o3,	%g3
	orn	%l3,	0x0827,	%l4
	and	%g4,	0x1878,	%o6
	tne	%icc,	0x4
	tgu	%xcc,	0x1
	sra	%l6,	%o2,	%l5
	tcc	%xcc,	0x0
	tvs	%icc,	0x0
	tle	%icc,	0x2
	bn,a,pn	%icc,	loop_2580
	umul	%i3,	%o4,	%l2
	fmovsleu	%xcc,	%f24,	%f16
	sdivcc	%l0,	0x04B3,	%g5
loop_2580:
	xnor	%o5,	0x1928,	%g2
	smul	%i6,	0x1D07,	%i7
	fnor	%f6,	%f4,	%f22
	subc	%g7,	%g6,	%i1
	edge8n	%o7,	%i5,	%l1
	movne	%icc,	%i0,	%i4
	umulcc	%o1,	%g1,	%o0
	taddcc	%o3,	0x1CF1,	%i2
	sdivx	%g3,	0x1D50,	%l3
	ldstub	[%l7 + 0x47],	%l4
	srax	%o6,	0x1E,	%l6
	set	0x60, %i0
	ldswa	[%l7 + %i0] 0x15,	%o2
	nop
	setx	0x505EF981,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x10, %o7
	prefetch	[%l7 + %o7],	 0x0
	fmovdleu	%xcc,	%f10,	%f2
	fpadd32s	%f5,	%f0,	%f19
	set	0x70, %i2
	stxa	%g4,	[%l7 + %i2] 0x10
	sll	%l5,	%o4,	%i3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l2
	subcc	%g5,	0x11A5,	%l0
	edge32l	%g2,	%i6,	%i7
	ldsb	[%l7 + 0x21],	%g7
	mulx	%g6,	%i1,	%o7
	and	%o5,	0x0127,	%l1
	addcc	%i5,	%i4,	%o1
	andn	%g1,	%o0,	%o3
	movcc	%icc,	%i2,	%i0
	set	0x7C, %i7
	ldsba	[%l7 + %i7] 0x0c,	%l3
	fmovrslz	%l4,	%f16,	%f20
	edge16ln	%o6,	%g3,	%o2
	tcs	%xcc,	0x6
	fmovdl	%xcc,	%f30,	%f6
	movre	%l6,	0x0ED,	%g4
	fpsub16s	%f5,	%f24,	%f10
	sra	%l5,	%i3,	%o4
	tvs	%icc,	0x1
	sethi	0x16E1,	%g5
	ldd	[%l7 + 0x10],	%l0
	tneg	%icc,	0x2
	ldd	[%l7 + 0x08],	%f2
	fmul8sux16	%f4,	%f2,	%f30
	edge16l	%l2,	%g2,	%i6
	ble	%xcc,	loop_2581
	mulscc	%i7,	%g7,	%i1
	lduh	[%l7 + 0x78],	%o7
	movgu	%icc,	%o5,	%g6
loop_2581:
	ble,a,pt	%icc,	loop_2582
	brz	%i5,	loop_2583
	brgez,a	%l1,	loop_2584
	fmovdge	%xcc,	%f1,	%f25
loop_2582:
	sdivcc	%i4,	0x0C9E,	%g1
loop_2583:
	bvc,pn	%icc,	loop_2585
loop_2584:
	fmovdcc	%icc,	%f12,	%f1
	andncc	%o1,	%o3,	%i2
	andncc	%o0,	%l3,	%i0
loop_2585:
	nop
	fitos	%f3,	%f7
	fstod	%f7,	%f28
	ta	%icc,	0x2
	addcc	%l4,	%o6,	%g3
	fpadd16s	%f14,	%f19,	%f16
	bn,a,pn	%xcc,	loop_2586
	tl	%icc,	0x3
	movre	%l6,	0x232,	%o2
	taddcc	%l5,	%g4,	%i3
loop_2586:
	tcc	%icc,	0x0
	nop
	setx	0x29557970505FBF0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	flush	%l7 + 0x78
	fmovrdgez	%g5,	%f28,	%f26
	addcc	%o4,	%l2,	%g2
	edge16ln	%l0,	%i7,	%i6
	tg	%icc,	0x4
	andcc	%i1,	%g7,	%o7
	wr	%g0,	0xea,	%asi
	stba	%g6,	[%l7 + 0x6F] %asi
	membar	#Sync
	bneg,pn	%icc,	loop_2587
	edge32ln	%i5,	%o5,	%i4
	sra	%l1,	0x13,	%g1
	fbn	%fcc1,	loop_2588
loop_2587:
	fone	%f0
	call	loop_2589
	alignaddrl	%o1,	%i2,	%o3
loop_2588:
	edge32l	%o0,	%i0,	%l3
	fone	%f26
loop_2589:
	nop
	set	0x1C, %g1
	lda	[%l7 + %g1] 0x18,	%f30
	edge8n	%o6,	%g3,	%l4
	fmovdg	%icc,	%f26,	%f13
	nop
	setx	0x22301882,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xF4C6FF75,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f31,	%f21
	movrgz	%l6,	%l5,	%o2
	mulscc	%i3,	%g5,	%o4
	fnot2s	%f2,	%f1
	wr	%g0,	0x89,	%asi
	stba	%l2,	[%l7 + 0x2C] %asi
	movge	%icc,	%g2,	%l0
	fpsub16	%f30,	%f0,	%f20
	udiv	%g4,	0x04B5,	%i6
	set	0x64, %o5
	ldswa	[%l7 + %o5] 0x15,	%i1
	ta	%icc,	0x5
	fmovrsgz	%i7,	%f9,	%f29
	set	0x40, %g3
	lduwa	[%l7 + %g3] 0x81,	%o7
	edge8ln	%g6,	%i5,	%o5
	edge8l	%i4,	%l1,	%g7
	movvs	%icc,	%g1,	%i2
	bvs	%xcc,	loop_2590
	nop
	fitos	%f3,	%f24
	fstox	%f24,	%f22
	nop
	setx	loop_2591,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%icc,	0x6
loop_2590:
	nop
	setx	loop_2592,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx loop_2593, %l0, %l1
	jmpl %l1, %o1
loop_2591:
	fnot2	%f8,	%f6
	array16	%o0,	%i0,	%o3
loop_2592:
	edge32ln	%o6,	%l3,	%l4
loop_2593:
	movrgez	%g3,	%l5,	%o2
	movrlz	%i3,	%l6,	%o4
	taddcctv	%l2,	0x100A,	%g2
	ta	%xcc,	0x7
	fbe	%fcc2,	loop_2594
	sra	%l0,	%g5,	%g4
	add	%i1,	%i6,	%o7
	ldub	[%l7 + 0x73],	%g6
loop_2594:
	edge8	%i5,	%i7,	%i4
	fmul8x16	%f27,	%f14,	%f30
	tsubcctv	%l1,	%g7,	%o5
	tsubcc	%i2,	0x08F5,	%o1
	fmovsa	%icc,	%f5,	%f27
	edge16l	%g1,	%o0,	%i0
	sir	0x0F53
	or	%o6,	%l3,	%l4
	sdivcc	%o3,	0x04EF,	%l5
	nop
	setx	0xF20F1ADD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x0CEF602D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f25,	%f29
	fmovsa	%xcc,	%f20,	%f5
	fbl,a	%fcc3,	loop_2595
	fmovsge	%xcc,	%f31,	%f16
	fmovsneg	%icc,	%f0,	%f31
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x75] %asi,	%o2
loop_2595:
	edge16n	%i3,	%g3,	%l6
	ta	%xcc,	0x2
	addccc	%l2,	%o4,	%g2
	umulcc	%g5,	0x1EF7,	%g4
	orcc	%i1,	%l0,	%o7
	udivcc	%g6,	0x198D,	%i6
	mulscc	%i5,	0x1732,	%i7
	fbn	%fcc3,	loop_2596
	array32	%i4,	%l1,	%o5
	tsubcctv	%i2,	0x1944,	%o1
	alignaddrl	%g1,	%o0,	%i0
loop_2596:
	tcc	%xcc,	0x6
	add	%o6,	%l3,	%g7
	srlx	%o3,	%l5,	%o2
	subc	%i3,	%l4,	%l6
	fandnot1	%f22,	%f28,	%f0
	bl,pn	%xcc,	loop_2597
	fmovrsgz	%g3,	%f5,	%f2
	set	0x18, %o0
	ldsha	[%l7 + %o0] 0x14,	%l2
loop_2597:
	tcc	%icc,	0x1
	ldub	[%l7 + 0x2E],	%g2
	tpos	%icc,	0x3
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x7F] %asi,	%o4
	fbue	%fcc2,	loop_2598
	fnors	%f4,	%f14,	%f1
	fnegs	%f16,	%f18
	edge8l	%g5,	%g4,	%i1
loop_2598:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o7,	0x1170,	%g6
	srl	%l0,	%i6,	%i5
	fones	%f3
	or	%i7,	%i4,	%l1
	movrlz	%i2,	%o1,	%g1
	edge16ln	%o0,	%o5,	%i0
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x220] %asi,	%l3
	edge8n	%g7,	%o3,	%o6
	fxor	%f14,	%f0,	%f20
	fzeros	%f5
	fone	%f30
	ldsb	[%l7 + 0x70],	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x1
	smul	%l5,	%i3,	%l6
	fsrc2s	%f30,	%f21
	tsubcc	%l4,	0x0016,	%g3
	smul	%g2,	0x028E,	%o4
	srax	%l2,	%g4,	%g5
	sub	%i1,	%g6,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc2,	loop_2599
	swap	[%l7 + 0x38],	%l0
	nop
	setx	0x707C50C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	tgu	%xcc,	0x7
loop_2599:
	tsubcctv	%i5,	%i6,	%i4
	sir	0x0FD4
	nop
	set	0x2F, %l3
	stb	%i7,	[%l7 + %l3]
	fnors	%f9,	%f30,	%f1
	fmul8x16al	%f16,	%f26,	%f28
	edge32	%i2,	%l1,	%g1
	set	0x72, %g4
	lduha	[%l7 + %g4] 0x04,	%o1
	bcc	loop_2600
	alignaddrl	%o0,	%i0,	%o5
	nop
	setx	0xEF81867C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xA46DABAE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f0,	%f25
	fxors	%f5,	%f14,	%f19
loop_2600:
	bg,a	%xcc,	loop_2601
	call	loop_2602
	movge	%icc,	%l3,	%g7
	xnor	%o3,	0x01BC,	%o2
loop_2601:
	sdiv	%l5,	0x0BD9,	%i3
loop_2602:
	fornot1s	%f28,	%f27,	%f14
	smulcc	%o6,	%l4,	%l6
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%g2
	fba,a	%fcc3,	loop_2603
	nop
	setx	0xE50338AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x88B1507D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f23,	%f17
	sir	0x1FF5
	fmovsvc	%xcc,	%f14,	%f31
loop_2603:
	edge32	%o4,	%l2,	%g3
	smulcc	%g5,	%g4,	%g6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o7,	%i1
	nop
	setx loop_2604, %l0, %l1
	jmpl %l1, %i5
	nop
	setx	0x33C27265C48385EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x7206BFD34D12A721,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f6,	%f12
	fmovrslz	%i6,	%f21,	%f15
	tg	%xcc,	0x5
loop_2604:
	bcc,a	loop_2605
	edge16n	%i4,	%i7,	%i2
	fba,a	%fcc0,	loop_2606
	ble,pn	%icc,	loop_2607
loop_2605:
	smul	%l1,	0x00D8,	%l0
	subccc	%o1,	0x1DCA,	%g1
loop_2606:
	fbg	%fcc1,	loop_2608
loop_2607:
	fmovrsgez	%i0,	%f18,	%f31
	sethi	0x1C66,	%o0
	movpos	%icc,	%o5,	%l3
loop_2608:
	sdivx	%o3,	0x1BD9,	%g7
	movn	%icc,	%o2,	%i3
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0xf9
	membar	#Sync
	call	loop_2609
	tvs	%icc,	0x4
	fzero	%f16
	sub	%o6,	%l4,	%l5
loop_2609:
	fnegs	%f27,	%f15
	bl,a	%xcc,	loop_2610
	edge32	%l6,	%o4,	%g2
	fbul	%fcc0,	loop_2611
	tleu	%xcc,	0x5
loop_2610:
	tn	%icc,	0x7
	tsubcctv	%g3,	0x0261,	%l2
loop_2611:
	fones	%f16
	movre	%g4,	0x265,	%g6
	umulcc	%o7,	0x16D5,	%g5
	sll	%i5,	%i6,	%i4
	popc	%i7,	%i2
	or	%l1,	%i1,	%l0
	fornot1	%f18,	%f24,	%f24
	movle	%icc,	%o1,	%i0
	st	%f11,	[%l7 + 0x48]
	tn	%icc,	0x7
	sll	%g1,	%o0,	%o5
	movleu	%icc,	%o3,	%g7
	edge32	%l3,	%o2,	%i3
	andn	%o6,	%l5,	%l4
	taddcc	%o4,	0x17FF,	%g2
	array32	%g3,	%l6,	%g4
	ld	[%l7 + 0x74],	%f28
	fsrc2s	%f5,	%f22
	stb	%g6,	[%l7 + 0x67]
	fble,a	%fcc3,	loop_2612
	membar	0x18
	movl	%icc,	%l2,	%o7
	xorcc	%i5,	%i6,	%g5
loop_2612:
	sir	0x03E5
	fba	%fcc0,	loop_2613
	sll	%i4,	%i2,	%i7
	set	0x1D, %g7
	lduba	[%l7 + %g7] 0x14,	%l1
loop_2613:
	umulcc	%l0,	%i1,	%o1
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x34] %asi,	%g1
	membar	0x5A
	tcs	%icc,	0x6
	fbe,a	%fcc1,	loop_2614
	move	%icc,	%o0,	%i0
	xnor	%o5,	%o3,	%l3
	xor	%o2,	0x0530,	%g7
loop_2614:
	sll	%o6,	%i3,	%l4
	movneg	%xcc,	%l5,	%g2
	edge16ln	%g3,	%o4,	%g4
	taddcc	%g6,	0x1F3C,	%l2
	ta	%xcc,	0x0
	fornot2	%f28,	%f12,	%f4
	edge8ln	%l6,	%o7,	%i6
	fmovsleu	%icc,	%f5,	%f27
	movn	%icc,	%i5,	%i4
	udivx	%i2,	0x0736,	%g5
	sir	0x0800
	nop
	setx	0x78BB56E7D0559E87,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	taddcc	%i7,	%l1,	%i1
	orncc	%l0,	0x0399,	%o1
	membar	0x0D
	bneg,a,pt	%icc,	loop_2615
	nop
	setx	loop_2616,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%icc,	0x2
	ldd	[%l7 + 0x30],	%f26
loop_2615:
	nop
	set	0x68, %g5
	ldsw	[%l7 + %g5],	%o0
loop_2616:
	bl	loop_2617
	fmovdn	%icc,	%f24,	%f5
	addc	%i0,	%g1,	%o3
	nop
	set	0x3C, %l4
	sth	%o5,	[%l7 + %l4]
loop_2617:
	fpack32	%f28,	%f20,	%f22
	nop
	fitod	%f12,	%f4
	fdtos	%f4,	%f3
	stw	%o2,	[%l7 + 0x34]
	fmovrslez	%g7,	%f28,	%f22
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x65] %asi,	%l3
	tsubcc	%i3,	0x1EE3,	%o6
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tsubcc	%l5,	%g2,	%g3
	fmovrdlez	%l4,	%f16,	%f26
	nop
	setx	0x5DF81C04DC2D4703,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x338BA1537D06BCAF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f0,	%f20
	fmovspos	%icc,	%f30,	%f17
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x12] %asi,	%g4
	movg	%icc,	%o4,	%l2
	tcs	%icc,	0x1
	orcc	%l6,	%g6,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o7,	%i5,	%i2
	addc	%i4,	%i7,	%l1
	ldsw	[%l7 + 0x1C],	%i1
	bn	%xcc,	loop_2618
	fmul8sux16	%f4,	%f16,	%f24
	fand	%f10,	%f28,	%f12
	edge16ln	%g5,	%l0,	%o0
loop_2618:
	fnot1s	%f24,	%f27
	xor	%o1,	0x0B29,	%i0
	alignaddrl	%o3,	%o5,	%g1
	set	0x3B, %i1
	ldsba	[%l7 + %i1] 0x88,	%o2
	membar	0x72
	udivcc	%l3,	0x158C,	%i3
	edge32n	%o6,	%l5,	%g7
	movrgz	%g3,	0x020,	%l4
	movl	%xcc,	%g4,	%g2
	bshuffle	%f12,	%f6,	%f2
	movpos	%xcc,	%o4,	%l2
	stb	%g6,	[%l7 + 0x20]
	xorcc	%l6,	0x0B1B,	%i6
	fbo	%fcc2,	loop_2619
	umulcc	%i5,	0x10A1,	%i2
	nop
	setx	loop_2620,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%i4,	%o7,	%l1
loop_2619:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i1,	0x1598,	%g5
loop_2620:
	udiv	%i7,	0x171E,	%l0
	fors	%f8,	%f9,	%f1
	fmovdne	%xcc,	%f24,	%f22
	alignaddrl	%o0,	%o1,	%i0
	nop
	setx	loop_2621,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%xcc,	0x1
	fmovsn	%xcc,	%f8,	%f19
	umulcc	%o5,	%g1,	%o3
loop_2621:
	sllx	%l3,	%i3,	%o2
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x26,	%l4
	sub	%o6,	%g3,	%l4
	sir	0x0E0A
	fsrc1	%f10,	%f20
	fnand	%f28,	%f30,	%f6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x66] %asi,	%g4
	sub	%g7,	0x09EC,	%g2
	sethi	0x08E0,	%l2
	fmovrslez	%o4,	%f0,	%f15
	fones	%f29
	std	%f6,	[%l7 + 0x40]
	edge8l	%l6,	%i6,	%g6
	orn	%i2,	0x06A5,	%i5
	movleu	%icc,	%o7,	%i4
	tg	%xcc,	0x0
	andcc	%l1,	%i1,	%i7
	fandnot1s	%f28,	%f12,	%f0
	movg	%xcc,	%g5,	%l0
	movpos	%xcc,	%o0,	%o1
	set	0x44, %l2
	lduba	[%l7 + %l2] 0x14,	%o5
	movvc	%icc,	%g1,	%o3
	fpack16	%f0,	%f27
	fnot2s	%f16,	%f22
	fbn,a	%fcc3,	loop_2622
	srl	%l3,	%i0,	%o2
	fmovd	%f8,	%f26
	tvs	%icc,	0x5
loop_2622:
	brlez,a	%i3,	loop_2623
	fmul8x16	%f29,	%f18,	%f20
	sra	%l5,	0x17,	%g3
	fpack16	%f20,	%f22
loop_2623:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l4
	movn	%icc,	%g4,	%g7
	mulx	%g2,	%o6,	%l2
	fmovd	%f8,	%f4
	sub	%l6,	0x1352,	%i6
	edge32ln	%g6,	%o4,	%i5
	ble,pn	%icc,	loop_2624
	fbl	%fcc0,	loop_2625
	fmovrdlz	%i2,	%f22,	%f6
	fcmpgt16	%f8,	%f10,	%i4
loop_2624:
	stw	%o7,	[%l7 + 0x44]
loop_2625:
	fmuld8ulx16	%f6,	%f19,	%f12
	movgu	%icc,	%i1,	%l1
	srlx	%i7,	0x07,	%g5
	nop
	setx loop_2626, %l0, %l1
	jmpl %l1, %l0
	ldub	[%l7 + 0x6B],	%o1
	movvs	%icc,	%o5,	%o0
	tgu	%xcc,	0x1
loop_2626:
	taddcc	%g1,	%l3,	%o3
	ba,pt	%icc,	loop_2627
	nop
	setx loop_2628, %l0, %l1
	jmpl %l1, %i0
	movg	%xcc,	%i3,	%l5
	movgu	%xcc,	%g3,	%l4
loop_2627:
	udivx	%o2,	0x1864,	%g4
loop_2628:
	fmovrslz	%g2,	%f23,	%f2
	edge32l	%g7,	%l2,	%o6
	addcc	%i6,	0x11CF,	%l6
	wr	%g0,	0x4f,	%asi
	stxa	%o4,	[%g0 + 0x30] %asi
	ldstub	[%l7 + 0x6B],	%g6
	ldsh	[%l7 + 0x64],	%i2
	nop
	set	0x61, %o4
	stb	%i4,	[%l7 + %o4]
	nop
	fitod	%f5,	%f22
	set	0x46, %o3
	ldsba	[%l7 + %o3] 0x04,	%o7
	edge8	%i5,	%i1,	%l1
	ldstub	[%l7 + 0x51],	%i7
	edge8ln	%g5,	%o1,	%o5
	bge,a,pt	%icc,	loop_2629
	for	%f14,	%f18,	%f26
	srax	%o0,	%g1,	%l0
	or	%o3,	0x1D33,	%l3
loop_2629:
	fmovrse	%i0,	%f9,	%f13
	ldx	[%l7 + 0x60],	%l5
	movvs	%icc,	%g3,	%i3
	movvs	%xcc,	%l4,	%g4
	lduh	[%l7 + 0x78],	%g2
	bneg,pn	%xcc,	loop_2630
	fone	%f6
	fbn,a	%fcc0,	loop_2631
	srax	%o2,	0x09,	%l2
loop_2630:
	udiv	%o6,	0x065F,	%i6
	movleu	%icc,	%g7,	%o4
loop_2631:
	addccc	%l6,	0x1B98,	%g6
	array8	%i2,	%o7,	%i5
	ld	[%l7 + 0x70],	%f29
	sdivcc	%i4,	0x0D49,	%i1
	set	0x28, %o6
	stha	%l1,	[%l7 + %o6] 0x2b
	membar	#Sync
	tge	%icc,	0x4
	movre	%g5,	%i7,	%o1
	fmul8x16	%f7,	%f26,	%f0
	bgu	%icc,	loop_2632
	bg,a,pt	%icc,	loop_2633
	bgu,pt	%icc,	loop_2634
	mulx	%o5,	%g1,	%l0
loop_2632:
	sdivcc	%o0,	0x0A7C,	%o3
loop_2633:
	xnor	%i0,	%l3,	%g3
loop_2634:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l5,	%l4
	tge	%icc,	0x3
	fmovdg	%icc,	%f14,	%f8
	call	loop_2635
	smulcc	%g4,	%i3,	%g2
	xor	%o2,	0x062F,	%o6
	movne	%xcc,	%i6,	%l2
loop_2635:
	fbuge	%fcc2,	loop_2636
	tle	%icc,	0x5
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf0,	%f0
loop_2636:
	fmovsgu	%xcc,	%f28,	%f21
	movre	%g7,	%o4,	%l6
	tge	%icc,	0x6
	movvc	%icc,	%g6,	%o7
	set	0x42, %i5
	stba	%i2,	[%l7 + %i5] 0x10
	fbu	%fcc2,	loop_2637
	tsubcc	%i5,	%i4,	%i1
	movrne	%l1,	0x122,	%g5
	popc	%i7,	%o1
loop_2637:
	nop
	fitos	%f13,	%f8
	set	0x58, %o2
	swapa	[%l7 + %o2] 0x81,	%g1
	movre	%o5,	%l0,	%o3
	mulx	%o0,	0x0CD6,	%i0
	ldsb	[%l7 + 0x63],	%l3
	addccc	%l5,	%l4,	%g4
	tleu	%xcc,	0x4
	nop
	setx	0xAB7972CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x945BB55C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f15,	%f17
	edge32	%g3,	%i3,	%g2
	fnors	%f5,	%f19,	%f12
	xnorcc	%o2,	%o6,	%i6
	array8	%l2,	%g7,	%o4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x6C] %asi,	%l6
	ldsb	[%l7 + 0x71],	%o7
	movl	%xcc,	%i2,	%g6
	fsrc2	%f24,	%f30
	sdivx	%i5,	0x1C7C,	%i4
	taddcc	%l1,	0x018B,	%i1
	sethi	0x0C77,	%i7
	tn	%icc,	0x6
	alignaddr	%g5,	%g1,	%o1
	fmovrdne	%l0,	%f4,	%f20
	tsubcctv	%o3,	0x102B,	%o5
	prefetch	[%l7 + 0x70],	 0x3
	movrgz	%o0,	0x1CB,	%l3
	fxnor	%f4,	%f22,	%f22
	fpsub16s	%f20,	%f24,	%f9
	fnot2s	%f6,	%f23
	stx	%l5,	[%l7 + 0x70]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l4,	0x15F8,	%g4
	fmovrse	%i0,	%f23,	%f6
	set	0x32, %l5
	ldstuba	[%l7 + %l5] 0x04,	%g3
	tne	%xcc,	0x3
	and	%g2,	%o2,	%i3
	addccc	%i6,	0x01C9,	%o6
	xor	%l2,	0x184E,	%o4
	fbue	%fcc2,	loop_2638
	brz,a	%l6,	loop_2639
	fbu,a	%fcc3,	loop_2640
	fornot1	%f18,	%f22,	%f2
loop_2638:
	fmovrse	%g7,	%f17,	%f13
loop_2639:
	fba	%fcc0,	loop_2641
loop_2640:
	fpack32	%f4,	%f24,	%f2
	movge	%xcc,	%o7,	%i2
	tge	%xcc,	0x7
loop_2641:
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%g6
	udiv	%i5,	0x08B0,	%i4
	tvs	%xcc,	0x0
	ldstub	[%l7 + 0x77],	%i1
	movn	%icc,	%i7,	%g5
	srax	%l1,	0x02,	%o1
	add	%l0,	%g1,	%o5
	nop
	setx	0x9B122F80,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f23
	edge32n	%o0,	%l3,	%l5
	subccc	%o3,	0x1AF6,	%g4
	xnorcc	%l4,	0x05BA,	%g3
	tvs	%xcc,	0x1
	xor	%i0,	%o2,	%g2
	sir	0x1AC1
	alignaddr	%i3,	%o6,	%l2
	sdivx	%o4,	0x18AA,	%i6
	prefetch	[%l7 + 0x34],	 0x0
	te	%xcc,	0x7
	fsrc2	%f26,	%f28
	movge	%xcc,	%g7,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%icc,	%f20,	%f16
	movvs	%icc,	%i2,	%l6
	tvs	%xcc,	0x1
	tcc	%xcc,	0x1
	srlx	%i5,	0x0D,	%i4
	ldstub	[%l7 + 0x40],	%i1
	nop
	setx	0x9E8AE7F79E0BC18F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x5B521073D5EAF98C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f22,	%f10
	sethi	0x069F,	%g6
	fmovda	%xcc,	%f22,	%f11
	fcmpne16	%f12,	%f0,	%g5
	ld	[%l7 + 0x44],	%f5
	tsubcctv	%i7,	%o1,	%l0
	or	%l1,	%o5,	%o0
	nop
	setx	0xE5FDB9D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f27
	smul	%l3,	%l5,	%g1
	smulcc	%o3,	%g4,	%l4
	srlx	%i0,	%o2,	%g3
	nop
	fitod	%f12,	%f24
	fdtoi	%f24,	%f1
	tcc	%xcc,	0x2
	edge32n	%i3,	%g2,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l2,	0x076E,	%o4
	fmul8sux16	%f8,	%f12,	%f22
	fmovrsne	%g7,	%f2,	%f2
	tsubcc	%i6,	%i2,	%o7
	xorcc	%i5,	0x1623,	%i4
	array8	%l6,	%i1,	%g6
	bvs,pn	%icc,	loop_2642
	brgez,a	%g5,	loop_2643
	tgu	%icc,	0x4
	stb	%i7,	[%l7 + 0x70]
loop_2642:
	edge16ln	%o1,	%l1,	%o5
loop_2643:
	tsubcc	%l0,	0x03AE,	%o0
	move	%icc,	%l3,	%g1
	movrgez	%o3,	0x300,	%l5
	movcc	%xcc,	%g4,	%l4
	tneg	%icc,	0x6
	fornot2	%f26,	%f0,	%f26
	fmovdneg	%icc,	%f0,	%f26
	fmovsge	%icc,	%f8,	%f12
	bvc,a,pn	%icc,	loop_2644
	nop
	setx	0x1A8F6FB11795D7E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x633F8355C3E0B6C2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f0,	%f16
	orn	%i0,	0x0035,	%o2
	sra	%i3,	0x06,	%g2
loop_2644:
	taddcc	%g3,	%l2,	%o4
	fmovsn	%icc,	%f14,	%f1
	srl	%o6,	0x14,	%i6
	brlez,a	%i2,	loop_2645
	fabsd	%f8,	%f12
	tsubcctv	%o7,	%i5,	%g7
	fblg	%fcc2,	loop_2646
loop_2645:
	movrgz	%i4,	0x0D7,	%i1
	nop
	setx	0xB4890B84,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f6
	bshuffle	%f22,	%f6,	%f28
loop_2646:
	bn	%xcc,	loop_2647
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l6,	%g6,	%i7
	fbne	%fcc3,	loop_2648
loop_2647:
	te	%icc,	0x4
	fpack32	%f28,	%f0,	%f16
	udiv	%g5,	0x1EF6,	%l1
loop_2648:
	stw	%o1,	[%l7 + 0x40]
	fmul8x16	%f24,	%f26,	%f8
	fbul	%fcc0,	loop_2649
	movl	%icc,	%o5,	%l0
	brlz	%l3,	loop_2650
	membar	0x13
loop_2649:
	te	%icc,	0x0
	tcc	%icc,	0x2
loop_2650:
	and	%o0,	0x00F2,	%g1
	umulcc	%o3,	%g4,	%l4
	taddcctv	%i0,	%o2,	%l5
	xnorcc	%g2,	%g3,	%i3
	movpos	%xcc,	%l2,	%o4
	edge32ln	%i6,	%o6,	%i2
	be,pt	%xcc,	loop_2651
	subcc	%i5,	0x165F,	%o7
	movrne	%i4,	0x30C,	%g7
	udiv	%i1,	0x1FD7,	%l6
loop_2651:
	addc	%i7,	0x007F,	%g5
	movge	%icc,	%g6,	%l1
	udivcc	%o5,	0x057C,	%l0
	bneg,a,pn	%icc,	loop_2652
	sth	%o1,	[%l7 + 0x22]
	alignaddr	%o0,	%l3,	%o3
	edge16n	%g4,	%l4,	%i0
loop_2652:
	edge32n	%o2,	%g1,	%l5
	orncc	%g3,	%i3,	%g2
	bshuffle	%f0,	%f8,	%f14
	sllx	%o4,	%l2,	%i6
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x52] %asi,	%i2
	addc	%o6,	0x1308,	%o7
	stb	%i4,	[%l7 + 0x7D]
	wr	%g0,	0x52,	%asi
	stxa	%g7,	[%g0 + 0x210] %asi
	fzeros	%f21
	set	0x74, %i6
	swapa	[%l7 + %i6] 0x80,	%i1
	array32	%i5,	%i7,	%l6
	movle	%icc,	%g6,	%g5
	sdivx	%o5,	0x1BE2,	%l1
	fmovrdgez	%l0,	%f28,	%f26
	movle	%icc,	%o1,	%o0
	sll	%o3,	0x18,	%l3
	faligndata	%f0,	%f0,	%f10
	array8	%g4,	%i0,	%o2
	tpos	%icc,	0x5
	tcc	%icc,	0x3
	fornot2s	%f23,	%f0,	%f5
	fbl,a	%fcc3,	loop_2653
	membar	0x68
	udiv	%g1,	0x1E72,	%l4
	fmovse	%icc,	%f6,	%f9
loop_2653:
	edge32n	%l5,	%i3,	%g3
	movleu	%icc,	%o4,	%g2
	sll	%i6,	0x19,	%l2
	srl	%o6,	%o7,	%i2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movle	%xcc,	%g7,	%i4
	fmovdvs	%xcc,	%f17,	%f24
	bne,a,pt	%xcc,	loop_2654
	ldsw	[%l7 + 0x40],	%i1
	orncc	%i5,	0x0615,	%i7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x0C] %asi,	%f12
loop_2654:
	srl	%l6,	%g6,	%g5
	movpos	%icc,	%o5,	%l0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x14] %asi,	%f8
	fpsub32	%f10,	%f20,	%f12
	movvs	%xcc,	%o1,	%l1
	sdiv	%o3,	0x1D52,	%l3
	movrlez	%g4,	%o0,	%o2
	and	%i0,	%l4,	%g1
	movle	%xcc,	%i3,	%g3
	fnot1	%f12,	%f10
	movvc	%icc,	%o4,	%l5
	mova	%xcc,	%g2,	%l2
	sdivcc	%i6,	0x1EA5,	%o6
	fpmerge	%f16,	%f1,	%f16
	fpmerge	%f8,	%f10,	%f26
	fmovsgu	%xcc,	%f24,	%f10
	movleu	%icc,	%i2,	%g7
	edge32	%i4,	%i1,	%i5
	fmovrse	%i7,	%f29,	%f28
	fbo,a	%fcc2,	loop_2655
	bn,a,pt	%icc,	loop_2656
	smulcc	%l6,	%g6,	%g5
	andncc	%o7,	%l0,	%o5
loop_2655:
	brlz,a	%l1,	loop_2657
loop_2656:
	edge32ln	%o1,	%l3,	%o3
	movneg	%icc,	%o0,	%o2
	fmovse	%xcc,	%f5,	%f5
loop_2657:
	movrgez	%i0,	%g4,	%g1
	movrgez	%i3,	0x224,	%l4
	bcc,a,pn	%xcc,	loop_2658
	movne	%icc,	%g3,	%o4
	fmovrse	%l5,	%f6,	%f16
	srax	%g2,	0x02,	%l2
loop_2658:
	nop
	set	0x78, %g2
	sta	%f28,	[%l7 + %g2] 0x11
	tneg	%xcc,	0x7
	bleu	%xcc,	loop_2659
	fpmerge	%f15,	%f18,	%f2
	ble	%icc,	loop_2660
	edge16ln	%i6,	%i2,	%g7
loop_2659:
	stw	%i4,	[%l7 + 0x14]
	popc	0x0092,	%o6
loop_2660:
	and	%i1,	0x1E04,	%i5
	fmuld8sux16	%f7,	%f1,	%f4
	ldub	[%l7 + 0x5C],	%l6
	fbge,a	%fcc1,	loop_2661
	movre	%g6,	%i7,	%o7
	movl	%icc,	%g5,	%o5
	sdivcc	%l0,	0x14CE,	%o1
loop_2661:
	swap	[%l7 + 0x68],	%l3
	fnegd	%f20,	%f10
	subc	%o3,	0x1B26,	%l1
	srl	%o0,	0x00,	%o2
	udivx	%g4,	0x19B0,	%g1
	edge8l	%i3,	%i0,	%g3
	fsrc1s	%f11,	%f0
	orn	%o4,	0x1853,	%l5
	xnorcc	%l4,	%g2,	%i6
	alignaddr	%i2,	%g7,	%i4
	movrlz	%o6,	%l2,	%i5
	tvc	%xcc,	0x2
	array8	%l6,	%g6,	%i7
	edge16ln	%o7,	%i1,	%g5
	ba	%xcc,	loop_2662
	tn	%xcc,	0x5
	bg	loop_2663
	bn,pn	%icc,	loop_2664
loop_2662:
	edge8l	%l0,	%o5,	%l3
	nop
	fitos	%f12,	%f30
	fstoi	%f30,	%f21
loop_2663:
	and	%o3,	0x12A2,	%l1
loop_2664:
	edge8l	%o1,	%o2,	%g4
	bge,a,pt	%xcc,	loop_2665
	fandnot1	%f10,	%f20,	%f2
	brlz,a	%g1,	loop_2666
	sth	%i3,	[%l7 + 0x22]
loop_2665:
	tcs	%xcc,	0x4
	edge8	%i0,	%g3,	%o4
loop_2666:
	array8	%o0,	%l5,	%l4
	bvc,pt	%icc,	loop_2667
	prefetch	[%l7 + 0x50],	 0x2
	fnands	%f4,	%f9,	%f0
	andncc	%g2,	%i2,	%i6
loop_2667:
	xnor	%i4,	%g7,	%o6
	taddcc	%i5,	%l6,	%g6
	movvc	%xcc,	%l2,	%o7
	fexpand	%f0,	%f16
	edge8ln	%i7,	%g5,	%l0
	movleu	%icc,	%i1,	%l3
	edge16ln	%o3,	%o5,	%l1
	tl	%icc,	0x6
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
	ldsb	[%l7 + 0x08],	%o1
	and	%g1,	0x1AA5,	%g4
	fbne,a	%fcc3,	loop_2668
	srl	%i0,	%g3,	%o4
	swap	[%l7 + 0x40],	%o0
	ldsb	[%l7 + 0x67],	%l5
loop_2668:
	brz	%l4,	loop_2669
	srl	%g2,	0x14,	%i2
	call	loop_2670
	fpadd32s	%f3,	%f6,	%f7
loop_2669:
	tvc	%xcc,	0x0
	nop
	setx	0x07ABF5E727071B94,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x6F2D5F73C46931DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f30,	%f10
loop_2670:
	st	%f21,	[%l7 + 0x4C]
	fornot1	%f8,	%f8,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i6,	%i4,	%g7
	andncc	%i3,	%i5,	%o6
	udiv	%l6,	0x156B,	%l2
	movrlz	%o7,	0x1FC,	%g6
	umul	%g5,	0x17F1,	%i7
	mova	%xcc,	%i1,	%l3
	edge32l	%o3,	%o5,	%l0
	sdivcc	%o2,	0x0854,	%l1
	movcc	%xcc,	%g1,	%g4
	umulcc	%o1,	0x1A12,	%g3
	movle	%xcc,	%i0,	%o0
	fpack32	%f8,	%f26,	%f10
	nop
	fitod	%f6,	%f2
	fdtos	%f2,	%f13
	movrlz	%l5,	0x38B,	%l4
	fbge,a	%fcc1,	loop_2671
	xnorcc	%g2,	%i2,	%i6
	movre	%i4,	%g7,	%o4
	movpos	%xcc,	%i5,	%i3
loop_2671:
	subc	%l6,	%o6,	%o7
	fmul8x16au	%f13,	%f12,	%f30
	bvc,a	loop_2672
	fbe,a	%fcc2,	loop_2673
	fmovdvs	%xcc,	%f3,	%f20
	sdivcc	%l2,	0x0C8B,	%g6
loop_2672:
	bleu,a	%xcc,	loop_2674
loop_2673:
	fxnors	%f4,	%f7,	%f31
	popc	%g5,	%i1
	tpos	%icc,	0x4
loop_2674:
	nop
	setx	0x10659C09807ECC93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	subc	%l3,	%i7,	%o3
	umul	%o5,	0x1EE9,	%l0
	fcmple16	%f18,	%f30,	%o2
	movcc	%xcc,	%l1,	%g4
	fmovdne	%icc,	%f4,	%f17
	or	%o1,	%g3,	%i0
	subcc	%g1,	%l5,	%o0
	fmovrde	%g2,	%f10,	%f28
	edge32ln	%l4,	%i2,	%i6
	edge32l	%g7,	%i4,	%o4
	fbne,a	%fcc0,	loop_2675
	sra	%i5,	0x0A,	%l6
	fcmple32	%f30,	%f22,	%o6
	bpos,a,pn	%icc,	loop_2676
loop_2675:
	tsubcctv	%i3,	0x091C,	%o7
	tl	%icc,	0x7
	tge	%xcc,	0x7
loop_2676:
	sra	%g6,	0x09,	%l2
	fble,a	%fcc3,	loop_2677
	fpack32	%f14,	%f14,	%f4
	nop
	setx	0xF04F04D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	nop
	setx	0xA0632DFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
loop_2677:
	nop
	setx	0x0B137EECEAD821AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xD94465525B2ED574,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f30,	%f14
	subccc	%i1,	%g5,	%l3
	call	loop_2678
	edge16n	%o3,	%i7,	%l0
	edge16	%o2,	%l1,	%g4
	movl	%icc,	%o5,	%o1
loop_2678:
	fpsub32	%f10,	%f26,	%f26
	tl	%xcc,	0x4
	nop
	setx	0xA0467192,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	ldstub	[%l7 + 0x48],	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g1,	%i0,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble	%fcc3,	loop_2679
	movrlez	%l5,	0x210,	%g2
	edge32n	%i2,	%i6,	%l4
	and	%i4,	%g7,	%i5
loop_2679:
	std	%f22,	[%l7 + 0x10]
	wr	%g0,	0x0c,	%asi
	sta	%f18,	[%l7 + 0x38] %asi
	sra	%o4,	0x14,	%l6
	subc	%o6,	0x0E13,	%o7
	fbuge,a	%fcc3,	loop_2680
	or	%g6,	%i3,	%l2
	edge16n	%i1,	%g5,	%l3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i7
loop_2680:
	nop
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x0c,	%f0
	subcc	%l0,	0x02DF,	%o3
	fmul8x16al	%f17,	%f6,	%f22
	nop
	fitos	%f7,	%f26
	fstod	%f26,	%f10
	movpos	%xcc,	%o2,	%g4
	movgu	%icc,	%o5,	%l1
	and	%o1,	0x0E9C,	%g3
	sllx	%g1,	%o0,	%l5
	subccc	%g2,	0x0C7C,	%i0
	fbne	%fcc2,	loop_2681
	pdist	%f24,	%f4,	%f18
	fbn,a	%fcc3,	loop_2682
	subccc	%i6,	%l4,	%i4
loop_2681:
	fxors	%f22,	%f18,	%f29
	umulcc	%i2,	%g7,	%o4
loop_2682:
	tvc	%xcc,	0x7
	fmovdle	%xcc,	%f18,	%f4
	fsrc1s	%f14,	%f12
	fmovrslez	%i5,	%f8,	%f5
	brgez,a	%o6,	loop_2683
	addc	%o7,	0x18CA,	%l6
	move	%icc,	%g6,	%i3
	xor	%l2,	%g5,	%l3
loop_2683:
	alignaddrl	%i7,	%l0,	%i1
	array8	%o3,	%o2,	%g4
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l1
	movg	%xcc,	%o1,	%g3
	nop
	setx loop_2684, %l0, %l1
	jmpl %l1, %g1
	subc	%o0,	0x0B7D,	%l5
	flush	%l7 + 0x6C
	add	%g2,	0x1500,	%i0
loop_2684:
	alignaddr	%o5,	%i6,	%l4
	udiv	%i2,	0x1149,	%i4
	tsubcctv	%o4,	0x1313,	%g7
	edge32n	%o6,	%i5,	%o7
	brlz	%l6,	loop_2685
	nop
	setx	loop_2686,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx loop_2687, %l0, %l1
	jmpl %l1, %i3
	tcc	%icc,	0x6
loop_2685:
	fmovrsne	%l2,	%f18,	%f2
loop_2686:
	swap	[%l7 + 0x34],	%g6
loop_2687:
	fbl,a	%fcc1,	loop_2688
	tn	%xcc,	0x5
	ldub	[%l7 + 0x5A],	%l3
	umul	%i7,	%l0,	%i1
loop_2688:
	nop
	set	0x6C, %g6
	lduwa	[%l7 + %g6] 0x80,	%g5
	srl	%o2,	0x04,	%g4
	nop
	fitos	%f9,	%f24
	fstod	%f24,	%f14
	tgu	%xcc,	0x5
	edge16n	%l1,	%o3,	%g3
	tsubcc	%g1,	0x0530,	%o0
	movneg	%xcc,	%l5,	%o1
	subccc	%i0,	0x1EEF,	%o5
	fbe	%fcc0,	loop_2689
	fmovspos	%icc,	%f14,	%f30
	xor	%g2,	%i6,	%i2
	movcc	%icc,	%i4,	%l4
loop_2689:
	move	%xcc,	%g7,	%o6
	udivcc	%o4,	0x0DC1,	%i5
	array32	%o7,	%l6,	%l2
	edge16ln	%i3,	%l3,	%i7
	tvc	%xcc,	0x7
	fmovrdne	%l0,	%f14,	%f4
	tsubcctv	%g6,	0x05F2,	%g5
	and	%i1,	0x0A62,	%g4
	fandnot2	%f24,	%f10,	%f22
	sdivx	%o2,	0x170B,	%l1
	stx	%g3,	[%l7 + 0x60]
	fmovrde	%o3,	%f30,	%f0
	ba,pn	%icc,	loop_2690
	fmovdge	%icc,	%f6,	%f12
	tne	%xcc,	0x2
	and	%g1,	%l5,	%o0
loop_2690:
	movleu	%icc,	%i0,	%o5
	tpos	%xcc,	0x2
	tge	%xcc,	0x3
	tn	%icc,	0x0
	fpackfix	%f20,	%f29
	nop
	setx	loop_2691,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ble,a,pn	%icc,	loop_2692
	tvs	%xcc,	0x0
	nop
	fitos	%f10,	%f13
	fstod	%f13,	%f28
loop_2691:
	udivx	%o1,	0x1E3C,	%i6
loop_2692:
	edge16	%i2,	%g2,	%l4
	movle	%xcc,	%i4,	%g7
	xnorcc	%o6,	0x0977,	%i5
	mulscc	%o7,	%l6,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f26,	%f28,	%f16
	xorcc	%l2,	0x0195,	%l3
	be,a	loop_2693
	edge8n	%i3,	%i7,	%l0
	fmovde	%icc,	%f20,	%f2
	fsrc1	%f22,	%f4
loop_2693:
	nop
	set	0x5C, %i0
	lda	[%l7 + %i0] 0x0c,	%f12
	array8	%g6,	%g5,	%i1
	edge16n	%g4,	%o2,	%l1
	brlez	%g3,	loop_2694
	edge16n	%g1,	%o3,	%l5
	nop
	setx	loop_2695,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x1
loop_2694:
	nop
	fitod	%f20,	%f22
	sll	%i0,	%o5,	%o1
loop_2695:
	call	loop_2696
	fmovsg	%icc,	%f7,	%f3
	edge16ln	%o0,	%i2,	%g2
	edge16ln	%l4,	%i4,	%i6
loop_2696:
	sra	%g7,	%o6,	%o7
	tvc	%xcc,	0x0
	fmovs	%f7,	%f3
	tne	%xcc,	0x0
	sir	0x07C9
	movrgez	%l6,	0x1D2,	%o4
	bge	%icc,	loop_2697
	fexpand	%f28,	%f0
	smulcc	%l2,	%i5,	%i3
	mulx	%i7,	0x0E89,	%l3
loop_2697:
	fmovdgu	%icc,	%f9,	%f26
	sdiv	%g6,	0x082A,	%l0
	ta	%xcc,	0x0
	movge	%xcc,	%g5,	%i1
	subcc	%o2,	0x101B,	%g4
	sethi	0x0322,	%l1
	movle	%icc,	%g1,	%o3
	tne	%xcc,	0x1
	alignaddrl	%l5,	%g3,	%o5
	set	0x72, %o7
	ldsba	[%l7 + %o7] 0x10,	%o1
	tvs	%icc,	0x5
	tleu	%xcc,	0x6
	orcc	%i0,	0x1FFF,	%i2
	ldx	[%l7 + 0x58],	%o0
	umul	%g2,	%i4,	%l4
	andn	%g7,	%o6,	%i6
	taddcctv	%l6,	0x0288,	%o7
	fpadd32s	%f24,	%f19,	%f23
	tpos	%xcc,	0x4
	be,a	%xcc,	loop_2698
	subccc	%o4,	0x1530,	%l2
	bcs,a	loop_2699
	movpos	%icc,	%i5,	%i7
loop_2698:
	ld	[%l7 + 0x0C],	%f17
	bgu,pn	%icc,	loop_2700
loop_2699:
	subcc	%i3,	%g6,	%l3
	fmul8ulx16	%f28,	%f28,	%f4
	smul	%g5,	%i1,	%l0
loop_2700:
	nop
	set	0x60, %l1
	ldstuba	[%l7 + %l1] 0x10,	%o2
	ble	%icc,	loop_2701
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz	%l1,	loop_2702
	sir	0x1E98
loop_2701:
	fmovsa	%xcc,	%f23,	%f16
	nop
	set	0x50, %i2
	ldsw	[%l7 + %i2],	%g1
loop_2702:
	alignaddrl	%g4,	%l5,	%g3
	xnor	%o5,	0x1D2E,	%o3
	tvs	%xcc,	0x3
	andn	%o1,	0x1A61,	%i2
	fmovrslez	%i0,	%f20,	%f11
	xnor	%g2,	0x1294,	%o0
	mulscc	%i4,	%g7,	%l4
	movrgz	%i6,	0x182,	%o6
	fnands	%f21,	%f27,	%f10
	movre	%o7,	0x38B,	%o4
	fmovsneg	%xcc,	%f9,	%f12
	membar	0x0C
	nop
	fitos	%f29,	%f11
	bcc,pt	%xcc,	loop_2703
	addc	%l2,	0x07A8,	%i5
	brgez	%l6,	loop_2704
	call	loop_2705
loop_2703:
	array16	%i3,	%i7,	%l3
	subc	%g5,	%g6,	%i1
loop_2704:
	fmovsl	%xcc,	%f0,	%f1
loop_2705:
	nop
	fitos	%f12,	%f17
	fstox	%f17,	%f14
	fblg,a	%fcc0,	loop_2706
	ld	[%l7 + 0x14],	%f15
	lduw	[%l7 + 0x28],	%o2
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f26
loop_2706:
	tpos	%icc,	0x5
	movn	%icc,	%l0,	%l1
	udiv	%g1,	0x0843,	%g4
	ldsb	[%l7 + 0x39],	%g3
	fmovsg	%xcc,	%f0,	%f19
	fxors	%f18,	%f24,	%f25
	fcmpne32	%f26,	%f22,	%o5
	subcc	%l5,	0x126D,	%o3
	brgez	%o1,	loop_2707
	fmovscs	%xcc,	%f13,	%f11
	popc	0x0F3C,	%i2
	movvs	%xcc,	%g2,	%o0
loop_2707:
	edge32ln	%i4,	%i0,	%l4
	nop
	setx loop_2708, %l0, %l1
	jmpl %l1, %g7
	tcs	%xcc,	0x3
	set	0x58, %g1
	swapa	[%l7 + %g1] 0x10,	%o6
loop_2708:
	movrlez	%o7,	%o4,	%i6
	ba	%xcc,	loop_2709
	fbu	%fcc3,	loop_2710
	lduh	[%l7 + 0x08],	%i5
	edge16l	%l6,	%i3,	%i7
loop_2709:
	tn	%xcc,	0x5
loop_2710:
	movrne	%l3,	%l2,	%g6
	fmovse	%icc,	%f26,	%f4
	umulcc	%g5,	%o2,	%l0
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x7C] %asi,	%i1
	nop
	setx	0x20A10B4C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xDDB4277B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f3,	%f30
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x3C] %asi,	%f28
	xorcc	%l1,	%g4,	%g1
	movl	%icc,	%o5,	%l5
	alignaddr	%o3,	%g3,	%o1
	movg	%icc,	%g2,	%i2
	fnot2	%f26,	%f14
	array16	%o0,	%i0,	%l4
	fmovsg	%xcc,	%f5,	%f1
	fblg,a	%fcc3,	loop_2711
	tleu	%xcc,	0x5
	edge16	%i4,	%g7,	%o7
	sra	%o6,	%i6,	%i5
loop_2711:
	addcc	%l6,	0x1D17,	%o4
	movne	%icc,	%i3,	%l3
	mulscc	%i7,	0x10BF,	%l2
	movg	%xcc,	%g6,	%g5
	tvs	%icc,	0x7
	tge	%icc,	0x7
	ta	%xcc,	0x2
	tg	%icc,	0x5
	alignaddrl	%l0,	%o2,	%i1
	fblg,a	%fcc1,	loop_2712
	edge32	%l1,	%g1,	%g4
	fmovdcc	%xcc,	%f6,	%f31
	srlx	%o5,	0x11,	%l5
loop_2712:
	xnor	%g3,	%o3,	%o1
	sir	0x1392
	fcmple16	%f6,	%f26,	%i2
	udivx	%o0,	0x1B14,	%g2
	edge8l	%l4,	%i4,	%g7
	edge16ln	%i0,	%o7,	%o6
	array8	%i5,	%l6,	%i6
	fnot1	%f26,	%f0
	brlez,a	%i3,	loop_2713
	mulscc	%o4,	0x0BE4,	%i7
	andn	%l3,	0x1BDD,	%g6
	edge16	%g5,	%l2,	%l0
loop_2713:
	fsrc1	%f24,	%f20
	movn	%icc,	%o2,	%i1
	tneg	%xcc,	0x5
	sll	%l1,	%g1,	%o5
	sir	0x1A81
	bge,pn	%xcc,	loop_2714
	umulcc	%g4,	0x0EE9,	%l5
	sethi	0x07A3,	%g3
	tne	%icc,	0x7
loop_2714:
	fxnors	%f25,	%f16,	%f15
	set	0x18, %o5
	sta	%f4,	[%l7 + %o5] 0x10
	mulscc	%o3,	0x03AE,	%i2
	udivx	%o0,	0x0EC2,	%g2
	fornot2	%f14,	%f20,	%f4
	wr	%g0,	0x18,	%asi
	sta	%f23,	[%l7 + 0x10] %asi
	alignaddrl	%o1,	%l4,	%i4
	movrlz	%i0,	%g7,	%o6
	addcc	%i5,	%l6,	%o7
	edge32l	%i6,	%o4,	%i7
	fmul8x16	%f26,	%f12,	%f0
	bvs,pn	%xcc,	loop_2715
	edge8l	%l3,	%i3,	%g5
	subcc	%l2,	%g6,	%l0
	movrgz	%i1,	%l1,	%g1
loop_2715:
	fcmpne16	%f22,	%f30,	%o2
	sdiv	%o5,	0x0B45,	%g4
	tg	%icc,	0x5
	udivcc	%l5,	0x1B57,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f29,	%f1,	%f18
	edge8ln	%g3,	%o0,	%i2
	fcmpne16	%f20,	%f28,	%g2
	movleu	%icc,	%o1,	%l4
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x28] %asi,	%i0
	xnorcc	%g7,	%i4,	%o6
	te	%xcc,	0x0
	sethi	0x0581,	%l6
	bg,pt	%xcc,	loop_2716
	fsrc2s	%f17,	%f0
	tcc	%xcc,	0x3
	fbl	%fcc2,	loop_2717
loop_2716:
	fbe	%fcc3,	loop_2718
	fmovsvs	%xcc,	%f18,	%f0
	wr	%g0,	0x27,	%asi
	stba	%i5,	[%l7 + 0x65] %asi
	membar	#Sync
loop_2717:
	fnands	%f6,	%f5,	%f22
loop_2718:
	sdivx	%i6,	0x0026,	%o4
	fornot1	%f2,	%f14,	%f16
	subc	%i7,	0x07FB,	%l3
	sdivcc	%o7,	0x0CDF,	%g5
	move	%icc,	%i3,	%l2
	brnz	%g6,	loop_2719
	edge32ln	%l0,	%i1,	%l1
	alignaddr	%g1,	%o5,	%o2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l5,	%o3
loop_2719:
	tne	%icc,	0x5
	swap	[%l7 + 0x4C],	%g4
	fmul8x16al	%f23,	%f3,	%f28
	fmovdle	%icc,	%f14,	%f11
	fpmerge	%f5,	%f2,	%f20
	stb	%o0,	[%l7 + 0x76]
	fmovdpos	%xcc,	%f12,	%f22
	move	%icc,	%i2,	%g3
	tvs	%xcc,	0x0
	set	0x24, %i7
	lda	[%l7 + %i7] 0x04,	%f25
	fmovspos	%icc,	%f22,	%f27
	edge8	%o1,	%l4,	%i0
	ldstub	[%l7 + 0x74],	%g2
	fmovda	%icc,	%f6,	%f17
	umul	%i4,	%o6,	%l6
	movvs	%icc,	%g7,	%i6
	sll	%o4,	%i5,	%l3
	fones	%f11
	set	0x6C, %o0
	sta	%f1,	[%l7 + %o0] 0x0c
	fbn,a	%fcc0,	loop_2720
	bl	loop_2721
	orn	%o7,	%g5,	%i7
	sllx	%l2,	0x08,	%i3
loop_2720:
	nop
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x15
loop_2721:
	nop
	setx	loop_2722,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%l0,	0x0F47,	%i1
	nop
	set	0x10, %g3
	std	%f8,	[%l7 + %g3]
	bn,pn	%xcc,	loop_2723
loop_2722:
	movn	%icc,	%l1,	%g1
	ta	%xcc,	0x3
	subccc	%g6,	0x1A99,	%o2
loop_2723:
	fmovscs	%icc,	%f17,	%f13
	edge8ln	%l5,	%o3,	%g4
	set	0x7C, %g4
	lduwa	[%l7 + %g4] 0x81,	%o0
	addccc	%i2,	0x178A,	%o5
	udivx	%g3,	0x16D1,	%o1
	std	%f24,	[%l7 + 0x48]
	movrlz	%l4,	%g2,	%i0
	nop
	setx	0xEB227069,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xDA9C754F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f12,	%f15
	sllx	%i4,	%l6,	%o6
	lduh	[%l7 + 0x4C],	%i6
	edge32	%g7,	%i5,	%o4
	fnor	%f26,	%f8,	%f14
	fnegs	%f18,	%f14
	stb	%o7,	[%l7 + 0x75]
	mova	%xcc,	%g5,	%l3
	ble,pt	%icc,	loop_2724
	tsubcctv	%i7,	%l2,	%i3
	movn	%icc,	%l0,	%i1
	array8	%l1,	%g1,	%o2
loop_2724:
	nop
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	move	%icc,	%l5,	%g6
	nop
	setx	loop_2725,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsb	[%l7 + 0x6B],	%g4
	edge32n	%o0,	%i2,	%o5
	xnorcc	%g3,	%o1,	%l4
loop_2725:
	tl	%xcc,	0x3
	tge	%icc,	0x3
	edge8ln	%o3,	%i0,	%g2
	fpackfix	%f6,	%f14
	edge32ln	%i4,	%o6,	%i6
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x52] %asi,	%g7
	movl	%xcc,	%i5,	%l6
	edge16n	%o4,	%g5,	%l3
	set	0x7C, %g7
	ldsba	[%l7 + %g7] 0x10,	%i7
	movpos	%xcc,	%l2,	%i3
	swap	[%l7 + 0x1C],	%l0
	tle	%icc,	0x1
	smul	%i1,	%o7,	%l1
	tgu	%xcc,	0x5
	taddcctv	%g1,	0x0522,	%l5
	fbule	%fcc1,	loop_2726
	andn	%g6,	%g4,	%o0
	bvc,a	loop_2727
	array16	%i2,	%o2,	%g3
loop_2726:
	ldx	[%l7 + 0x78],	%o5
	xnorcc	%l4,	0x0E7D,	%o3
loop_2727:
	nop
	set	0x1B, %o1
	stba	%i0,	[%l7 + %o1] 0x2b
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x7
	tcc	%icc,	0x7
	movle	%icc,	%g2,	%i4
	addccc	%o1,	0x0A16,	%o6
	movvs	%icc,	%i6,	%i5
	fmovdvc	%xcc,	%f17,	%f4
	udivx	%l6,	0x13BC,	%o4
	umul	%g7,	%g5,	%i7
	xor	%l2,	0x034A,	%i3
	nop
	setx	0x4B3562F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x6ECAE51A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f27,	%f30
	ba,a,pt	%xcc,	loop_2728
	std	%f10,	[%l7 + 0x10]
	bcs,a,pn	%xcc,	loop_2729
	xorcc	%l0,	0x00D2,	%l3
loop_2728:
	andn	%o7,	%l1,	%g1
	fmul8x16au	%f12,	%f25,	%f6
loop_2729:
	andncc	%l5,	%i1,	%g6
	movrlz	%g4,	0x025,	%o0
	fnegs	%f4,	%f2
	smul	%i2,	%o2,	%o5
	ld	[%l7 + 0x08],	%f6
	movne	%icc,	%l4,	%g3
	fabsd	%f28,	%f14
	xorcc	%o3,	%g2,	%i0
	ldsb	[%l7 + 0x1C],	%o1
	nop
	fitod	%f4,	%f0
	fdtos	%f0,	%f21
	srlx	%i4,	%i6,	%o6
	brlz	%l6,	loop_2730
	addccc	%i5,	%g7,	%g5
	array16	%o4,	%i7,	%l2
	edge32n	%i3,	%l0,	%l3
loop_2730:
	sra	%o7,	%l1,	%g1
	addccc	%l5,	0x12F3,	%g6
	nop
	setx	0xB1BE4C11A2198E5C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xF373F1D03CFA6BF3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f18,	%f10
	subc	%i1,	0x0688,	%g4
	ldx	[%l7 + 0x48],	%o0
	tn	%icc,	0x7
	fors	%f22,	%f20,	%f9
	sdivcc	%i2,	0x15E3,	%o5
	movge	%icc,	%o2,	%g3
	movl	%xcc,	%l4,	%o3
	fsrc2	%f4,	%f22
	ldd	[%l7 + 0x68],	%i0
	edge16ln	%g2,	%o1,	%i6
	fmovsne	%icc,	%f23,	%f16
	movvs	%icc,	%i4,	%o6
	smulcc	%l6,	0x1BA6,	%i5
	nop
	set	0x38, %l4
	lduw	[%l7 + %l4],	%g5
	tne	%xcc,	0x2
	edge16l	%o4,	%i7,	%g7
	fmovscs	%xcc,	%f8,	%f6
	movrne	%i3,	0x058,	%l0
	fmovdge	%icc,	%f18,	%f5
	tcs	%xcc,	0x5
	tg	%xcc,	0x4
	tne	%icc,	0x6
	nop
	fitod	%f31,	%f20
	fbuge,a	%fcc2,	loop_2731
	tneg	%icc,	0x5
	fpadd32s	%f23,	%f12,	%f24
	tpos	%xcc,	0x1
loop_2731:
	addccc	%l2,	%l3,	%l1
	subccc	%g1,	0x15A5,	%l5
	movre	%o7,	%g6,	%g4
	nop
	fitod	%f4,	%f8
	fdtos	%f8,	%f8
	te	%xcc,	0x2
	movle	%xcc,	%i1,	%i2
	subcc	%o5,	%o0,	%o2
	orn	%g3,	0x1EB0,	%l4
	sdivx	%o3,	0x02ED,	%i0
	fand	%f6,	%f12,	%f2
	orn	%o1,	0x1D4F,	%i6
	sdivx	%i4,	0x1FBB,	%g2
	fands	%f11,	%f15,	%f31
	taddcc	%l6,	%i5,	%o6
	taddcc	%o4,	0x190C,	%g5
	bleu	%xcc,	loop_2732
	fmovrslz	%i7,	%f27,	%f10
	fmovscs	%icc,	%f2,	%f23
	tpos	%icc,	0x1
loop_2732:
	sra	%i3,	%g7,	%l2
	fmovdvc	%xcc,	%f18,	%f27
	edge8ln	%l3,	%l0,	%l1
	movrgz	%l5,	%o7,	%g1
	mulx	%g6,	0x056C,	%g4
	bcs,a	loop_2733
	udivx	%i1,	0x124F,	%i2
	tn	%icc,	0x7
	nop
	setx	0x81CBF77E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f7
loop_2733:
	nop
	setx	0xB4FCD68CEAB1B5A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC5386800C9230A42,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f26,	%f20
	alignaddr	%o0,	%o2,	%o5
	fsrc2	%f30,	%f30
	movcc	%icc,	%g3,	%l4
	fpadd16s	%f23,	%f16,	%f14
	set	0x78, %i1
	stxa	%i0,	[%l7 + %i1] 0x22
	membar	#Sync
	popc	0x0E16,	%o3
	fmuld8sux16	%f14,	%f13,	%f28
	movge	%xcc,	%i6,	%i4
	subccc	%o1,	%l6,	%g2
	sth	%i5,	[%l7 + 0x1E]
	fcmple32	%f24,	%f0,	%o6
	udiv	%o4,	0x15F0,	%g5
	fmovscs	%xcc,	%f19,	%f30
	movrgez	%i7,	%i3,	%g7
	umulcc	%l2,	%l0,	%l3
	fmovrsgez	%l5,	%f24,	%f6
	orncc	%o7,	0x1C60,	%g1
	membar	0x0F
	fba,a	%fcc0,	loop_2734
	subccc	%l1,	%g4,	%i1
	xnorcc	%i2,	%o0,	%o2
	movg	%icc,	%o5,	%g3
loop_2734:
	fmovrdgz	%g6,	%f22,	%f6
	movrgz	%i0,	0x0D3,	%l4
	movcc	%xcc,	%i6,	%i4
	taddcc	%o3,	0x1D54,	%l6
	tneg	%xcc,	0x1
	umulcc	%o1,	0x0487,	%i5
	brz,a	%o6,	loop_2735
	movrlz	%o4,	0x349,	%g5
	fmovdl	%icc,	%f10,	%f14
	addc	%i7,	%i3,	%g7
loop_2735:
	edge16l	%l2,	%l0,	%g2
	sth	%l3,	[%l7 + 0x14]
	fbuge	%fcc3,	loop_2736
	stbar
	array32	%l5,	%g1,	%l1
	umulcc	%o7,	0x1C8B,	%g4
loop_2736:
	movle	%xcc,	%i1,	%o0
	nop
	setx	loop_2737,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bleu,pt	%xcc,	loop_2738
	bn,pt	%xcc,	loop_2739
	orncc	%o2,	0x11BA,	%o5
loop_2737:
	fmovdcc	%icc,	%f24,	%f11
loop_2738:
	popc	%g3,	%i2
loop_2739:
	nop
	set	0x30, %l6
	lduwa	[%l7 + %l6] 0x80,	%i0
	edge16l	%l4,	%g6,	%i4
	bneg,pt	%xcc,	loop_2740
	fmovsne	%xcc,	%f19,	%f1
	fbge,a	%fcc1,	loop_2741
	fmul8x16	%f8,	%f6,	%f4
loop_2740:
	orn	%o3,	%i6,	%o1
	fbuge	%fcc0,	loop_2742
loop_2741:
	nop
	fitos	%f3,	%f28
	fstod	%f28,	%f14
	prefetch	[%l7 + 0x18],	 0x3
	addc	%l6,	%i5,	%o4
loop_2742:
	fpsub16s	%f5,	%f29,	%f8
	umulcc	%o6,	0x1507,	%g5
	add	%i3,	%g7,	%i7
	andcc	%l2,	0x0F7C,	%g2
	umul	%l3,	0x19A0,	%l5
	xnorcc	%g1,	%l0,	%o7
	fcmpne16	%f8,	%f26,	%l1
	nop
	setx	0x53610566,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x251419AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f12,	%f6
	movrlez	%g4,	%o0,	%o2
	movleu	%xcc,	%o5,	%g3
	fcmple32	%f0,	%f18,	%i2
	brz	%i0,	loop_2743
	srlx	%l4,	0x17,	%i1
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f22
	fxtod	%f22,	%f30
	fmovdvs	%icc,	%f13,	%f18
loop_2743:
	fmovsn	%xcc,	%f6,	%f26
	brz,a	%g6,	loop_2744
	nop
	setx	0x7F9E8B45CEE7876F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x14B436EF082690DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f22,	%f24
	orcc	%i4,	%o3,	%o1
	tleu	%xcc,	0x7
loop_2744:
	mulx	%i6,	%i5,	%o4
	nop
	setx	0x22D8CCE4EF1B27D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xAAAFB50BA3B986E9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f28,	%f4
	edge8	%l6,	%o6,	%i3
	sll	%g7,	%g5,	%i7
	fmovdcc	%icc,	%f31,	%f20
	bleu,a	loop_2745
	nop
	fitos	%f7,	%f16
	fstoi	%f16,	%f26
	edge8	%g2,	%l3,	%l2
	bge,a,pt	%icc,	loop_2746
loop_2745:
	stb	%g1,	[%l7 + 0x4A]
	edge32	%l5,	%o7,	%l0
	flush	%l7 + 0x2C
loop_2746:
	fble	%fcc2,	loop_2747
	array8	%l1,	%o0,	%o2
	mulscc	%g4,	%g3,	%o5
	add	%i0,	%i2,	%l4
loop_2747:
	stx	%g6,	[%l7 + 0x40]
	fmovdn	%xcc,	%f7,	%f6
	ldd	[%l7 + 0x10],	%f10
	fandnot1s	%f6,	%f30,	%f23
	prefetch	[%l7 + 0x50],	 0x2
	ldx	[%l7 + 0x40],	%i4
	edge32l	%o3,	%o1,	%i6
	fmovsne	%icc,	%f26,	%f11
	alignaddr	%i1,	%o4,	%i5
	tneg	%xcc,	0x7
	fpack16	%f4,	%f18
	movre	%l6,	%o6,	%g7
	addcc	%i3,	0x084A,	%g5
	nop
	setx	0xA1D27B46ADFAA81D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f4
	tg	%xcc,	0x5
	alignaddrl	%i7,	%l3,	%g2
	tsubcctv	%g1,	%l5,	%l2
	tne	%icc,	0x6
	subc	%o7,	%l1,	%l0
	stb	%o0,	[%l7 + 0x0B]
	tl	%xcc,	0x3
	bpos,pt	%xcc,	loop_2748
	edge32n	%g4,	%g3,	%o5
	movne	%icc,	%o2,	%i2
	ldub	[%l7 + 0x26],	%l4
loop_2748:
	nop
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g6
	movcs	%xcc,	%i0,	%o3
	movneg	%xcc,	%i4,	%i6
	sll	%i1,	%o4,	%o1
	edge16ln	%l6,	%i5,	%o6
	tcc	%xcc,	0x1
	fmovsne	%xcc,	%f9,	%f23
	ldd	[%l7 + 0x78],	%g6
	sir	0x0DEE
	ldx	[%l7 + 0x58],	%i3
	tpos	%icc,	0x0
	fcmpne16	%f30,	%f22,	%i7
	mulscc	%g5,	0x1073,	%g2
	umul	%g1,	0x04E3,	%l5
	move	%icc,	%l3,	%l2
	nop
	setx	0x50510A9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	umul	%o7,	0x1EF4,	%l1
	tleu	%xcc,	0x7
	set	0x0C, %g5
	lduwa	[%l7 + %g5] 0x88,	%l0
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x08] %asi,	%f18
	addc	%g4,	0x1E26,	%o0
	edge8	%g3,	%o5,	%i2
	edge8ln	%o2,	%l4,	%g6
	fmovsneg	%icc,	%f20,	%f16
	edge16n	%o3,	%i4,	%i0
	fbul,a	%fcc2,	loop_2749
	fmovs	%f25,	%f10
	edge32ln	%i1,	%o4,	%i6
	fsrc2s	%f8,	%f26
loop_2749:
	orcc	%o1,	%i5,	%l6
	movrgz	%o6,	0x135,	%i3
	set	0x2C, %l2
	lduwa	[%l7 + %l2] 0x80,	%i7
	set	0x24, %o3
	ldswa	[%l7 + %o3] 0x10,	%g5
	te	%icc,	0x4
	movpos	%icc,	%g2,	%g7
	bgu	%xcc,	loop_2750
	tl	%xcc,	0x3
	stx	%l5,	[%l7 + 0x58]
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l3
loop_2750:
	fmovrdgez	%g1,	%f6,	%f6
	orcc	%l2,	0x17C7,	%l1
	edge8ln	%o7,	%g4,	%o0
	fnot2	%f0,	%f20
	xnor	%g3,	%l0,	%o5
	tvs	%xcc,	0x0
	move	%xcc,	%o2,	%i2
	fmovda	%icc,	%f29,	%f11
	tcc	%icc,	0x6
	tle	%icc,	0x7
	edge8n	%l4,	%g6,	%i4
	umul	%o3,	0x138A,	%i0
	set	0x50, %o6
	ldxa	[%l7 + %o6] 0x11,	%i1
	fmul8x16al	%f26,	%f14,	%f0
	tsubcctv	%o4,	%o1,	%i6
	fba	%fcc0,	loop_2751
	alignaddrl	%l6,	%i5,	%i3
	tl	%xcc,	0x3
	sub	%i7,	0x1A31,	%o6
loop_2751:
	st	%f26,	[%l7 + 0x38]
	taddcctv	%g2,	%g5,	%l5
	sethi	0x1206,	%g7
	fpsub32	%f22,	%f12,	%f30
	fsrc1	%f0,	%f4
	movvc	%xcc,	%l3,	%g1
	tleu	%icc,	0x3
	edge32ln	%l1,	%l2,	%g4
	or	%o7,	%o0,	%l0
	fbul,a	%fcc3,	loop_2752
	fcmpeq32	%f24,	%f14,	%o5
	movneg	%icc,	%g3,	%i2
	lduh	[%l7 + 0x28],	%l4
loop_2752:
	brz,a	%g6,	loop_2753
	movcc	%xcc,	%o2,	%o3
	fmovse	%icc,	%f12,	%f5
	andn	%i4,	0x0B73,	%i1
loop_2753:
	edge16ln	%i0,	%o4,	%o1
	wr	%g0,	0x22,	%asi
	stba	%i6,	[%l7 + 0x6A] %asi
	membar	#Sync
	edge32n	%i5,	%i3,	%l6
	bneg,a	%xcc,	loop_2754
	tn	%icc,	0x6
	fbe	%fcc2,	loop_2755
	prefetch	[%l7 + 0x24],	 0x3
loop_2754:
	fbul,a	%fcc0,	loop_2756
	nop
	setx	0x8FCE2401E04AC311,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
loop_2755:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2756:
	movleu	%xcc,	%i7,	%o6
	sdiv	%g5,	0x1EDC,	%l5
	tg	%xcc,	0x4
	fcmpgt16	%f10,	%f18,	%g2
	fmovrsne	%l3,	%f16,	%f8
	tle	%icc,	0x0
	movl	%icc,	%g7,	%g1
	edge16n	%l2,	%g4,	%l1
	lduh	[%l7 + 0x42],	%o0
	fmovsleu	%icc,	%f0,	%f14
	bn	%icc,	loop_2757
	movne	%icc,	%l0,	%o5
	fmovscs	%icc,	%f14,	%f10
	fbu,a	%fcc0,	loop_2758
loop_2757:
	fxors	%f26,	%f29,	%f26
	nop
	setx loop_2759, %l0, %l1
	jmpl %l1, %o7
	fxnor	%f18,	%f8,	%f18
loop_2758:
	fbue	%fcc3,	loop_2760
	sllx	%g3,	%i2,	%g6
loop_2759:
	ldd	[%l7 + 0x70],	%l4
	nop
	fitos	%f30,	%f15
loop_2760:
	brlez,a	%o3,	loop_2761
	fone	%f6
	udivcc	%o2,	0x083C,	%i4
	umulcc	%i0,	0x143A,	%i1
loop_2761:
	movpos	%icc,	%o4,	%o1
	movcc	%icc,	%i6,	%i3
	movrne	%l6,	0x104,	%i7
	fnegd	%f6,	%f24
	fbule,a	%fcc3,	loop_2762
	tleu	%icc,	0x2
	sdivcc	%o6,	0x0B3A,	%i5
	ba	%icc,	loop_2763
loop_2762:
	edge16n	%l5,	%g2,	%g5
	mulscc	%l3,	0x1C84,	%g1
	andncc	%g7,	%g4,	%l2
loop_2763:
	fmovdne	%xcc,	%f18,	%f29
	tgu	%xcc,	0x7
	andncc	%l1,	%o0,	%l0
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x5E] %asi,	%o5
	addc	%g3,	%i2,	%g6
	tl	%icc,	0x5
	edge16l	%l4,	%o3,	%o7
	bcs,a,pt	%xcc,	loop_2764
	tn	%icc,	0x1
	sub	%o2,	0x16F9,	%i0
	fblg,a	%fcc3,	loop_2765
loop_2764:
	array32	%i1,	%o4,	%o1
	movge	%xcc,	%i6,	%i4
	prefetch	[%l7 + 0x58],	 0x2
loop_2765:
	xnor	%i3,	%l6,	%i7
	tne	%icc,	0x1
	ba,a,pn	%xcc,	loop_2766
	fbu	%fcc1,	loop_2767
	fcmpgt32	%f18,	%f6,	%o6
	tleu	%xcc,	0x6
loop_2766:
	brlz,a	%l5,	loop_2768
loop_2767:
	fmovrse	%i5,	%f24,	%f22
	array16	%g5,	%g2,	%g1
	bpos,a	%xcc,	loop_2769
loop_2768:
	bshuffle	%f4,	%f14,	%f12
	fxnor	%f2,	%f12,	%f26
	tneg	%icc,	0x6
loop_2769:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g7
	nop
	setx	0x8E05354C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x6265F6E4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f14,	%f27
	fornot1	%f2,	%f4,	%f2
	tsubcctv	%l3,	%g4,	%l2
	for	%f4,	%f10,	%f12
	tcs	%xcc,	0x0
	tn	%icc,	0x1
	movleu	%icc,	%o0,	%l0
	fbl	%fcc2,	loop_2770
	ble,a	loop_2771
	nop
	setx	loop_2772,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpeq16	%f30,	%f20,	%l1
loop_2770:
	tg	%icc,	0x5
loop_2771:
	edge8ln	%g3,	%o5,	%i2
loop_2772:
	edge32ln	%l4,	%o3,	%o7
	smul	%o2,	%g6,	%i1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x30] %asi,	%i0
	movrne	%o4,	%i6,	%o1
	subcc	%i3,	0x1B07,	%l6
	fnot2s	%f15,	%f10
	fmovsgu	%icc,	%f5,	%f27
	orncc	%i4,	0x136B,	%o6
	fbu	%fcc2,	loop_2773
	umulcc	%l5,	%i7,	%i5
	ldd	[%l7 + 0x58],	%g2
	fcmpne32	%f2,	%f30,	%g1
loop_2773:
	fbu	%fcc3,	loop_2774
	nop
	setx	loop_2775,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%g5,	0x1AA6,	%l3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x38] %asi,	%g7
loop_2774:
	mulx	%g4,	0x07F8,	%l2
loop_2775:
	subccc	%l0,	%l1,	%o0
	fmovdge	%icc,	%f26,	%f26
	alignaddr	%o5,	%g3,	%l4
	fmovrdlz	%o3,	%f24,	%f8
	sethi	0x115B,	%o7
	nop
	setx	0x805CAC4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	tcc	%xcc,	0x5
	sllx	%o2,	%g6,	%i2
	udivcc	%i1,	0x1A97,	%i0
	xorcc	%o4,	%o1,	%i3
	bshuffle	%f12,	%f8,	%f8
	movvc	%icc,	%l6,	%i6
	tcs	%icc,	0x6
	tle	%xcc,	0x4
	fbn	%fcc0,	loop_2776
	movrlz	%i4,	%l5,	%o6
	set	0x28, %i3
	ldstuba	[%l7 + %i3] 0x80,	%i5
loop_2776:
	srax	%i7,	0x03,	%g1
	brgez,a	%g2,	loop_2777
	fmul8x16al	%f21,	%f31,	%f22
	brgz,a	%l3,	loop_2778
	fmovde	%icc,	%f10,	%f5
loop_2777:
	movcs	%icc,	%g7,	%g4
	orcc	%g5,	0x1743,	%l2
loop_2778:
	movrlz	%l1,	%l0,	%o5
	add	%o0,	0x09B7,	%l4
	edge32l	%o3,	%o7,	%g3
	fmovdcs	%xcc,	%f18,	%f11
	tge	%xcc,	0x5
	bg	loop_2779
	movrgez	%g6,	%o2,	%i2
	mulx	%i0,	%o4,	%o1
	sdivx	%i3,	0x0581,	%l6
loop_2779:
	fblg,a	%fcc2,	loop_2780
	movne	%xcc,	%i1,	%i4
	ldsw	[%l7 + 0x6C],	%l5
	edge32	%o6,	%i6,	%i7
loop_2780:
	sethi	0x128A,	%i5
	tgu	%xcc,	0x0
	fmovsleu	%xcc,	%f3,	%f31
	set	0x5E, %o4
	stha	%g2,	[%l7 + %o4] 0x27
	membar	#Sync
	sth	%l3,	[%l7 + 0x38]
	orncc	%g1,	%g7,	%g5
	ba,a	loop_2781
	bn	loop_2782
	fmovrdgz	%l2,	%f4,	%f6
	nop
	setx	0x07EA7A590DB89627,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xAF6395D2C0B545E2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f10,	%f2
loop_2781:
	tcs	%icc,	0x3
loop_2782:
	smulcc	%l1,	0x0525,	%l0
	movvc	%xcc,	%g4,	%o5
	fmovrdgz	%o0,	%f6,	%f18
	bcs,a	%xcc,	loop_2783
	ldsb	[%l7 + 0x1B],	%l4
	fsrc2s	%f30,	%f6
	bgu	loop_2784
loop_2783:
	tl	%icc,	0x2
	fbug	%fcc0,	loop_2785
	sir	0x1409
loop_2784:
	addc	%o3,	%o7,	%g6
	movrlez	%g3,	0x07B,	%i2
loop_2785:
	edge32n	%o2,	%i0,	%o1
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x1C] %asi,	%i3
	fmovrsne	%o4,	%f28,	%f19
	fmovsneg	%icc,	%f4,	%f19
	sethi	0x125C,	%l6
	addc	%i1,	%i4,	%l5
	movcc	%icc,	%i6,	%o6
	brlez	%i7,	loop_2786
	fmovrdgez	%g2,	%f8,	%f2
	movvc	%icc,	%i5,	%g1
	fands	%f4,	%f6,	%f18
loop_2786:
	edge16ln	%l3,	%g7,	%l2
	andn	%l1,	%g5,	%g4
	sra	%l0,	%o0,	%o5
	sth	%l4,	[%l7 + 0x1C]
	tne	%icc,	0x3
	smul	%o3,	0x18D0,	%g6
	movrlz	%g3,	%o7,	%i2
	addc	%o2,	%o1,	%i3
	tle	%xcc,	0x4
	nop
	setx loop_2787, %l0, %l1
	jmpl %l1, %i0
	movvc	%xcc,	%l6,	%o4
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i1
loop_2787:
	edge16l	%i4,	%i6,	%o6
	alignaddrl	%l5,	%g2,	%i7
	membar	0x01
	mova	%icc,	%g1,	%l3
	fba,a	%fcc1,	loop_2788
	movleu	%icc,	%g7,	%i5
	fble	%fcc3,	loop_2789
	andncc	%l2,	%g5,	%g4
loop_2788:
	udiv	%l0,	0x138C,	%l1
	taddcc	%o0,	0x0F7A,	%o5
loop_2789:
	sethi	0x096B,	%l4
	nop
	fitos	%f11,	%f27
	fstox	%f27,	%f30
	fxtos	%f30,	%f14
	stx	%o3,	[%l7 + 0x18]
	array16	%g6,	%g3,	%i2
	fmovscc	%xcc,	%f27,	%f20
	fmovrdgez	%o7,	%f12,	%f16
	sub	%o1,	0x0326,	%i3
	stw	%i0,	[%l7 + 0x6C]
	movcc	%xcc,	%o2,	%o4
	fbule	%fcc0,	loop_2790
	fmul8x16al	%f22,	%f6,	%f12
	orcc	%i1,	0x1522,	%l6
	tpos	%icc,	0x4
loop_2790:
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f4
	fxtod	%f4,	%f22
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ldsw	[%l7 + 0x40],	%i6
	andncc	%o6,	%i4,	%g2
	fbug	%fcc1,	loop_2791
	srl	%l5,	0x01,	%g1
	sllx	%i7,	0x02,	%l3
	movneg	%icc,	%g7,	%i5
loop_2791:
	taddcctv	%l2,	%g4,	%l0
	brnz,a	%l1,	loop_2792
	stx	%g5,	[%l7 + 0x18]
	fmovsg	%xcc,	%f29,	%f12
	movl	%xcc,	%o5,	%o0
loop_2792:
	srl	%l4,	%o3,	%g6
	fmovrsne	%i2,	%f19,	%f24
	set	0x48, %o2
	lduwa	[%l7 + %o2] 0x89,	%o7
	tg	%xcc,	0x1
	move	%icc,	%g3,	%i3
	nop
	setx	0xB425DE67,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x1D37C229,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f4,	%f2
	edge32	%i0,	%o2,	%o4
	addcc	%i1,	0x1A8B,	%o1
	nop
	setx	0x5EDE8445,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xF5F8EADB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f22,	%f1
	sll	%l6,	0x1E,	%i6
	tleu	%xcc,	0x1
	fzero	%f16
	movleu	%icc,	%o6,	%g2
	tvs	%icc,	0x3
	fmuld8ulx16	%f9,	%f10,	%f16
	bleu,a	%xcc,	loop_2793
	fmovs	%f15,	%f16
	movcs	%icc,	%l5,	%g1
	tle	%icc,	0x4
loop_2793:
	edge32ln	%i4,	%i7,	%l3
	stbar
	bn,pt	%icc,	loop_2794
	tleu	%icc,	0x5
	fsrc1s	%f9,	%f15
	fmovdn	%icc,	%f22,	%f4
loop_2794:
	fmovdn	%xcc,	%f19,	%f2
	umul	%g7,	0x0BAF,	%l2
	ld	[%l7 + 0x78],	%f28
	umul	%i5,	0x0946,	%l0
	udivx	%g4,	0x1BA6,	%l1
	movgu	%xcc,	%g5,	%o5
	nop
	setx	0xC4DCFCD714CFB77E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x568E318A60EE9E32,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f28,	%f4
	prefetch	[%l7 + 0x64],	 0x2
	array16	%l4,	%o3,	%g6
	movrgz	%o0,	%i2,	%g3
	fmovsgu	%xcc,	%f5,	%f25
	fbul	%fcc2,	loop_2795
	nop
	fitod	%f10,	%f30
	fdtox	%f30,	%f26
	fcmple32	%f10,	%f4,	%o7
	tvc	%xcc,	0x1
loop_2795:
	addc	%i0,	%o2,	%o4
	subccc	%i3,	0x1801,	%i1
	movneg	%xcc,	%l6,	%i6
	srax	%o1,	0x1F,	%g2
	set	0x5C, %l5
	ldstuba	[%l7 + %l5] 0x88,	%l5
	nop
	setx	0xA830E444,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x0BD5F925,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f3,	%f26
	nop
	set	0x10, %l0
	std	%f26,	[%l7 + %l0]
	orncc	%o6,	%g1,	%i4
	stw	%i7,	[%l7 + 0x58]
	tcs	%xcc,	0x6
	movle	%icc,	%l3,	%l2
	nop
	setx	0x5D971391,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x6CC8BE30,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f23,	%f0
	taddcc	%g7,	0x0DA1,	%l0
	array16	%i5,	%l1,	%g5
	ldd	[%l7 + 0x58],	%f22
	set	0x46, %i6
	stha	%o5,	[%l7 + %i6] 0x27
	membar	#Sync
	fxnors	%f23,	%f31,	%f18
	st	%f8,	[%l7 + 0x1C]
	set	0x5F, %g2
	ldsba	[%l7 + %g2] 0x15,	%l4
	sub	%g4,	0x19BB,	%g6
	movcs	%icc,	%o0,	%i2
	addccc	%o3,	%o7,	%g3
	tcc	%xcc,	0x4
	fmuld8ulx16	%f27,	%f8,	%f16
	fmovscs	%icc,	%f3,	%f10
	andncc	%o2,	%o4,	%i0
	tleu	%icc,	0x0
	tleu	%icc,	0x5
	fnot2	%f18,	%f12
	edge32n	%i1,	%l6,	%i6
	fxnors	%f27,	%f29,	%f9
	wr	%g0,	0x19,	%asi
	sta	%f1,	[%l7 + 0x10] %asi
	set	0x20, %i4
	ldda	[%l7 + %i4] 0xea,	%o0
	fbl,a	%fcc0,	loop_2796
	popc	0x0E2A,	%g2
	fmovdne	%icc,	%f7,	%f8
	mova	%icc,	%l5,	%o6
loop_2796:
	stw	%i3,	[%l7 + 0x48]
	fmovsge	%xcc,	%f28,	%f28
	tvc	%icc,	0x2
	fcmpeq16	%f0,	%f28,	%g1
	tleu	%xcc,	0x1
	fnor	%f22,	%f16,	%f30
	subc	%i7,	%i4,	%l3
	membar	0x4C
	nop
	fitos	%f11,	%f6
	fstoi	%f6,	%f23
	movrlez	%l2,	%l0,	%g7
	brnz,a	%l1,	loop_2797
	andncc	%i5,	%o5,	%l4
	udiv	%g4,	0x1CE3,	%g6
	nop
	fitos	%f0,	%f21
	fstox	%f21,	%f26
	fxtos	%f26,	%f30
loop_2797:
	mulscc	%o0,	0x0882,	%g5
	movge	%icc,	%o3,	%o7
	fmovsne	%xcc,	%f20,	%f11
	fbg	%fcc2,	loop_2798
	ldstub	[%l7 + 0x47],	%g3
	movcc	%icc,	%o2,	%o4
	fmuld8ulx16	%f29,	%f23,	%f26
loop_2798:
	edge8ln	%i0,	%i1,	%l6
	sra	%i6,	0x06,	%i2
	fmovdne	%xcc,	%f2,	%f29
	nop
	setx loop_2799, %l0, %l1
	jmpl %l1, %o1
	fmovd	%f0,	%f30
	fornot2	%f2,	%f24,	%f28
	fnor	%f26,	%f24,	%f14
loop_2799:
	nop
	wr	%g0,	0x18,	%asi
	stha	%l5,	[%l7 + 0x1C] %asi
	subccc	%g2,	0x1140,	%i3
	bgu,a	%xcc,	loop_2800
	bcc,pt	%icc,	loop_2801
	fbge,a	%fcc3,	loop_2802
	movle	%xcc,	%g1,	%o6
loop_2800:
	stbar
loop_2801:
	tsubcc	%i4,	%i7,	%l3
loop_2802:
	edge32n	%l0,	%g7,	%l2
	sdivcc	%i5,	0x1619,	%l1
	srl	%l4,	0x01,	%g4
	tne	%icc,	0x5
	subcc	%o5,	0x10DD,	%g6
	andcc	%o0,	0x13C4,	%o3
	tsubcc	%g5,	0x0BB5,	%g3
	or	%o2,	%o4,	%o7
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movl	%icc,	%i1,	%l6
	umul	%i6,	0x0819,	%i0
	movrlez	%o1,	%l5,	%i2
	st	%f23,	[%l7 + 0x40]
	fmuld8ulx16	%f6,	%f15,	%f4
	movvc	%icc,	%i3,	%g2
	andcc	%o6,	0x1175,	%i4
	mulscc	%g1,	%l3,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l0,	%g7,	%i5
	nop
	fitod	%f9,	%f10
	fbn,a	%fcc1,	loop_2803
	fors	%f2,	%f26,	%f2
	pdist	%f8,	%f16,	%f26
	membar	0x67
loop_2803:
	stbar
	bleu,a,pn	%xcc,	loop_2804
	membar	0x39
	bn,pt	%xcc,	loop_2805
	fpadd16	%f8,	%f30,	%f24
loop_2804:
	edge16ln	%l2,	%l4,	%g4
	fpsub16s	%f3,	%f31,	%f20
loop_2805:
	movge	%icc,	%l1,	%o5
	fbuge	%fcc2,	loop_2806
	fmovrde	%o0,	%f0,	%f14
	edge16l	%g6,	%o3,	%g5
	stw	%g3,	[%l7 + 0x38]
loop_2806:
	edge8l	%o4,	%o7,	%o2
	sdivcc	%i1,	0x0AED,	%l6
	fmovspos	%icc,	%f26,	%f12
	std	%f22,	[%l7 + 0x40]
	brz,a	%i0,	loop_2807
	pdist	%f28,	%f16,	%f2
	bshuffle	%f14,	%f20,	%f26
	brnz	%i6,	loop_2808
loop_2807:
	edge8ln	%o1,	%i2,	%l5
	fpsub32	%f22,	%f6,	%f8
	fba,a	%fcc2,	loop_2809
loop_2808:
	bge,pn	%icc,	loop_2810
	nop
	setx	0x85A1DE6D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x0D05197C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f9,	%f27
	srax	%i3,	0x0A,	%o6
loop_2809:
	fmovsne	%xcc,	%f17,	%f17
loop_2810:
	movleu	%xcc,	%g2,	%g1
	edge8n	%i4,	%i7,	%l3
	nop
	set	0x4E, %i5
	ldsb	[%l7 + %i5],	%l0
	nop
	setx	0xE06BB222,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fmovrslez	%g7,	%f1,	%f20
	nop
	fitos	%f12,	%f2
	fstoi	%f2,	%f18
	edge8	%l2,	%i5,	%g4
	tcc	%xcc,	0x7
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f2
	fxtod	%f2,	%f0
	sdivx	%l1,	0x1D96,	%o5
	tcs	%xcc,	0x3
	nop
	setx	0x9B89D0F9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xE1B2C241,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f1,	%f7
	movrne	%o0,	%l4,	%o3
	movleu	%xcc,	%g5,	%g3
	srlx	%o4,	%o7,	%g6
	andcc	%i1,	%l6,	%i0
	fmovda	%icc,	%f7,	%f22
	movle	%xcc,	%i6,	%o2
	and	%o1,	0x00EE,	%l5
	te	%xcc,	0x6
	tneg	%icc,	0x4
	bg	loop_2811
	array8	%i2,	%o6,	%g2
	sth	%g1,	[%l7 + 0x44]
	fbl,a	%fcc1,	loop_2812
loop_2811:
	ldsh	[%l7 + 0x14],	%i3
	srlx	%i4,	%l3,	%l0
	bvs,a	loop_2813
loop_2812:
	tpos	%icc,	0x7
	fmovdg	%icc,	%f30,	%f7
	fmovdneg	%icc,	%f29,	%f3
loop_2813:
	udivx	%g7,	0x1FBE,	%i7
	set	0x34, %i0
	sta	%f26,	[%l7 + %i0] 0x89
	set	0x10, %g6
	lduha	[%l7 + %g6] 0x15,	%l2
	xnor	%g4,	0x1243,	%i5
	movge	%xcc,	%l1,	%o0
	xnorcc	%l4,	0x101E,	%o5
	fbl	%fcc2,	loop_2814
	fabss	%f9,	%f5
	sir	0x03B8
	sdivx	%g5,	0x1A98,	%o3
loop_2814:
	movneg	%xcc,	%o4,	%o7
	bcc,pn	%xcc,	loop_2815
	fmovrdlez	%g6,	%f2,	%f24
	edge16	%g3,	%l6,	%i0
	fnot2s	%f1,	%f17
loop_2815:
	sdivx	%i6,	0x0FB7,	%o2
	wr	%g0,	0x0c,	%asi
	sta	%f19,	[%l7 + 0x48] %asi
	subc	%o1,	0x19A9,	%l5
	tn	%xcc,	0x0
	edge8n	%i2,	%i1,	%o6
	movl	%icc,	%g1,	%i3
	edge32ln	%i4,	%g2,	%l3
	brlez,a	%l0,	loop_2816
	fbg,a	%fcc1,	loop_2817
	ld	[%l7 + 0x7C],	%f18
	fmovrdgz	%i7,	%f24,	%f24
loop_2816:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g7
loop_2817:
	fmovrslez	%g4,	%f4,	%f12
	fornot1	%f12,	%f30,	%f6
	ld	[%l7 + 0x74],	%f7
	tsubcctv	%l2,	0x010E,	%i5
	sdivx	%o0,	0x075B,	%l1
	nop
	setx	0xA072AAC2,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	edge32ln	%l4,	%o5,	%g5
	nop
	fitod	%f10,	%f28
	fdtoi	%f28,	%f19
	fcmple32	%f16,	%f8,	%o3
	tge	%icc,	0x0
	movrlez	%o4,	0x36F,	%o7
	array16	%g3,	%l6,	%g6
	movrlez	%i6,	0x275,	%o2
	orn	%i0,	%l5,	%o1
	fmovscc	%icc,	%f11,	%f8
	array8	%i1,	%o6,	%g1
	sra	%i2,	0x15,	%i3
	fbue	%fcc1,	loop_2818
	add	%i4,	0x1F4F,	%g2
	tneg	%xcc,	0x5
	edge16n	%l3,	%i7,	%g7
loop_2818:
	fmovrdlez	%g4,	%f22,	%f0
	edge8ln	%l0,	%i5,	%l2
	fpsub16	%f10,	%f30,	%f2
	bcc,a,pn	%icc,	loop_2819
	tcc	%xcc,	0x4
	tvs	%icc,	0x3
	prefetch	[%l7 + 0x70],	 0x0
loop_2819:
	xnor	%o0,	%l1,	%o5
	nop
	setx	0xDB043003C3644925,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8DF73718700B965E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f20,	%f30
	sll	%g5,	%l4,	%o3
	udivx	%o4,	0x1F2C,	%g3
	fcmpne32	%f8,	%f22,	%o7
	movvs	%icc,	%l6,	%g6
	tsubcc	%o2,	0x1BF4,	%i0
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x44] %asi,	%i6
	tne	%xcc,	0x7
	fmovrsgez	%o1,	%f9,	%f23
	nop
	setx	0x404CFC50,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	fcmpeq32	%f8,	%f20,	%l5
	te	%xcc,	0x5
	set	0x18, %l1
	lduha	[%l7 + %l1] 0x04,	%o6
	andncc	%i1,	%g1,	%i2
	subcc	%i3,	0x1601,	%i4
	sdivx	%g2,	0x173F,	%i7
	orncc	%g7,	%g4,	%l3
	smulcc	%l0,	%l2,	%o0
	tle	%xcc,	0x7
	nop
	setx	0xF2A20851E387CBB0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x6DAEE6E6A38075A8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f12,	%f28
	udivx	%l1,	0x1BA0,	%o5
	bcc,a	%xcc,	loop_2820
	tgu	%xcc,	0x0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x35] %asi,	%g5
loop_2820:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	fmovsgu	%xcc,	%f24,	%f29
	array8	%i5,	%o3,	%g3
	edge8l	%o7,	%o4,	%g6
	xnorcc	%l6,	%i0,	%o2
	fmul8x16al	%f30,	%f27,	%f8
	fnot1	%f8,	%f2
	array16	%o1,	%l5,	%o6
	fpsub32s	%f24,	%f28,	%f25
	udivx	%i6,	0x16B6,	%i1
	sdivcc	%i2,	0x0324,	%i3
	xor	%i4,	0x1329,	%g2
	fbge	%fcc2,	loop_2821
	tneg	%xcc,	0x0
	movneg	%xcc,	%i7,	%g7
	mulscc	%g4,	%g1,	%l3
loop_2821:
	bcc,pt	%icc,	loop_2822
	udiv	%l2,	0x1E4A,	%o0
	movvc	%icc,	%l1,	%o5
	tge	%xcc,	0x7
loop_2822:
	bcs	%icc,	loop_2823
	tneg	%icc,	0x1
	fnot2	%f8,	%f0
	mulx	%g5,	%l0,	%i5
loop_2823:
	tvc	%icc,	0x3
	srax	%l4,	%g3,	%o3
	movrlez	%o7,	0x29F,	%o4
	tsubcc	%g6,	0x11BE,	%l6
	tsubcctv	%o2,	%o1,	%l5
	movle	%icc,	%i0,	%o6
	swap	[%l7 + 0x0C],	%i6
	and	%i2,	%i3,	%i1
	nop
	setx	0x84F529F130BB07DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xC4BA5A268D359DE6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f18,	%f14
	nop
	setx	0x238B03CADD5E3B9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xDBEF7C7F48B76281,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f20,	%f8
	sethi	0x123F,	%g2
	sllx	%i4,	0x04,	%g7
	edge8l	%g4,	%g1,	%i7
	fmovsvc	%xcc,	%f18,	%f20
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	fandnot2s	%f25,	%f30,	%f24
	tge	%xcc,	0x1
	fmovdvc	%icc,	%f19,	%f13
	membar	0x0C
	bg	%xcc,	loop_2824
	bvc,a,pn	%xcc,	loop_2825
	fmovsvc	%icc,	%f5,	%f26
	addc	%l3,	0x0C21,	%l1
loop_2824:
	orncc	%o0,	0x035A,	%o5
loop_2825:
	sll	%l0,	0x16,	%g5
	umulcc	%l4,	%g3,	%i5
	set	0x76, %i2
	ldsha	[%l7 + %i2] 0x11,	%o3
	fbu,a	%fcc0,	loop_2826
	andncc	%o7,	%g6,	%o4
	for	%f2,	%f8,	%f2
	alignaddr	%o2,	%l6,	%l5
loop_2826:
	bneg,a,pn	%xcc,	loop_2827
	movgu	%icc,	%o1,	%i0
	ta	%icc,	0x3
	array16	%o6,	%i6,	%i3
loop_2827:
	fbg,a	%fcc0,	loop_2828
	fmovsleu	%icc,	%f15,	%f9
	bleu	%icc,	loop_2829
	smulcc	%i2,	%i1,	%i4
loop_2828:
	tl	%xcc,	0x7
	tle	%icc,	0x3
loop_2829:
	fmovdg	%icc,	%f21,	%f17
	te	%xcc,	0x5
	fornot1	%f24,	%f4,	%f14
	movvs	%xcc,	%g2,	%g7
	tne	%icc,	0x5
	addc	%g4,	0x05DC,	%i7
	movne	%xcc,	%g1,	%l3
	ldub	[%l7 + 0x67],	%l2
	tge	%xcc,	0x1
	srlx	%o0,	%o5,	%l0
	sll	%l1,	0x1C,	%g5
	sdivcc	%g3,	0x0BD5,	%i5
	set	0x6C, %o7
	sta	%f13,	[%l7 + %o7] 0x88
	stx	%l4,	[%l7 + 0x68]
	brnz,a	%o7,	loop_2830
	stbar
	array16	%g6,	%o4,	%o2
	nop
	setx	0x5EA7CC3C42BF01B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x75774411F76A228D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f2,	%f22
loop_2830:
	ta	%icc,	0x2
	xnorcc	%l6,	%l5,	%o3
	taddcctv	%i0,	0x1287,	%o6
	tne	%xcc,	0x4
	te	%icc,	0x6
	fmovsn	%xcc,	%f6,	%f3
	be,pt	%xcc,	loop_2831
	add	%o1,	%i6,	%i3
	nop
	setx	0x073C3011,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x534C8F94,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f30,	%f11
	fmul8sux16	%f8,	%f18,	%f30
loop_2831:
	subcc	%i1,	0x198F,	%i4
	taddcc	%g2,	%i2,	%g7
	set	0x20, %o5
	ldswa	[%l7 + %o5] 0x0c,	%g4
	movge	%icc,	%g1,	%l3
	fornot2s	%f21,	%f8,	%f6
	movneg	%icc,	%l2,	%o0
	fbge,a	%fcc3,	loop_2832
	stbar
	fornot2	%f2,	%f6,	%f2
	fxors	%f13,	%f1,	%f16
loop_2832:
	be	%icc,	loop_2833
	tge	%icc,	0x3
	ldx	[%l7 + 0x60],	%o5
	ta	%xcc,	0x1
loop_2833:
	fpsub16	%f18,	%f30,	%f4
	sub	%i7,	%l1,	%l0
	fbge	%fcc0,	loop_2834
	movrne	%g3,	0x0D0,	%g5
	ba,a	%icc,	loop_2835
	taddcc	%i5,	0x15C0,	%o7
loop_2834:
	edge8ln	%l4,	%o4,	%o2
	fmovda	%xcc,	%f17,	%f8
loop_2835:
	tcs	%xcc,	0x1
	nop
	fitos	%f0,	%f16
	fstoi	%f16,	%f9
	bgu,a	loop_2836
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x5
	alignaddrl	%g6,	%l5,	%l6
loop_2836:
	brgz	%o3,	loop_2837
	sll	%i0,	0x08,	%o6
	orn	%o1,	0x1770,	%i6
	nop
	setx loop_2838, %l0, %l1
	jmpl %l1, %i3
loop_2837:
	stb	%i1,	[%l7 + 0x0C]
	movl	%xcc,	%i4,	%i2
	sdivcc	%g7,	0x0A40,	%g4
loop_2838:
	tne	%xcc,	0x3
	mova	%xcc,	%g1,	%g2
	srl	%l2,	0x0C,	%l3
	fmovsa	%xcc,	%f29,	%f29
	sethi	0x1CD9,	%o5
	fbe	%fcc1,	loop_2839
	sdiv	%o0,	0x1A92,	%l1
	nop
	setx loop_2840, %l0, %l1
	jmpl %l1, %l0
	add	%i7,	%g5,	%g3
loop_2839:
	movrne	%i5,	%l4,	%o7
	sdivx	%o2,	0x12FD,	%o4
loop_2840:
	fbul	%fcc3,	loop_2841
	sir	0x0C84
	tsubcc	%l5,	0x0CDE,	%l6
	tge	%icc,	0x0
loop_2841:
	mova	%icc,	%o3,	%i0
	addc	%o6,	%o1,	%i6
	edge8l	%g6,	%i3,	%i4
	edge32l	%i2,	%i1,	%g4
	tcs	%xcc,	0x5
	movne	%xcc,	%g7,	%g1
	edge8ln	%l2,	%g2,	%l3
	ldd	[%l7 + 0x50],	%f24
	fors	%f2,	%f9,	%f18
	sethi	0x02B5,	%o0
	subc	%l1,	0x1735,	%l0
	fandnot1	%f28,	%f22,	%f18
	alignaddr	%i7,	%g5,	%o5
	mulx	%g3,	%i5,	%l4
	movle	%icc,	%o2,	%o7
	subc	%o4,	0x0B6C,	%l5
	nop
	setx	0x5040ED3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	andcc	%l6,	0x192F,	%i0
	stx	%o6,	[%l7 + 0x40]
	fmovrslez	%o3,	%f11,	%f24
	fbg,a	%fcc3,	loop_2842
	edge16ln	%i6,	%g6,	%i3
	fandnot2	%f6,	%f12,	%f22
	movvs	%xcc,	%i4,	%i2
loop_2842:
	fbg	%fcc0,	loop_2843
	lduw	[%l7 + 0x68],	%o1
	movneg	%xcc,	%g4,	%i1
	movrgez	%g7,	%l2,	%g1
loop_2843:
	edge32	%g2,	%l3,	%o0
	movrgez	%l1,	%l0,	%i7
	sra	%g5,	%g3,	%o5
	mova	%xcc,	%l4,	%i5
	fpsub32s	%f6,	%f9,	%f18
	add	%o7,	0x1035,	%o2
	fmovsle	%xcc,	%f13,	%f10
	brlz,a	%o4,	loop_2844
	fnegd	%f6,	%f8
	udivcc	%l6,	0x044F,	%l5
	or	%o6,	%o3,	%i0
loop_2844:
	tvc	%xcc,	0x5
	fxnors	%f5,	%f2,	%f3
	sir	0x0ADA
	edge16n	%g6,	%i6,	%i3
	udiv	%i4,	0x0ABA,	%o1
	brz,a	%g4,	loop_2845
	move	%icc,	%i1,	%g7
	fornot1s	%f28,	%f26,	%f25
	fabsd	%f20,	%f2
loop_2845:
	fmovrde	%i2,	%f20,	%f8
	call	loop_2846
	taddcctv	%l2,	0x079E,	%g2
	movcc	%icc,	%g1,	%l3
	nop
	setx	0xB6DD516F330A6265,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f28
loop_2846:
	fmovdneg	%icc,	%f2,	%f31
	movne	%xcc,	%l1,	%l0
	taddcctv	%o0,	%i7,	%g3
	st	%f16,	[%l7 + 0x38]
	fbne	%fcc3,	loop_2847
	tgu	%icc,	0x2
	nop
	setx	0x72B5929875094499,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x77069661F813E0E5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f2,	%f8
	nop
	setx	loop_2848,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2847:
	edge16ln	%o5,	%g5,	%i5
	st	%f22,	[%l7 + 0x14]
	subcc	%l4,	0x0E87,	%o7
loop_2848:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o2,	0x1236,	%o4
	nop
	set	0x58, %i7
	ldsw	[%l7 + %i7],	%l6
	ldstub	[%l7 + 0x18],	%o6
	tle	%xcc,	0x6
	movleu	%icc,	%l5,	%o3
	nop
	set	0x20, %g1
	lduw	[%l7 + %g1],	%i0
	movrgez	%i6,	0x01B,	%i3
	udivx	%g6,	0x046E,	%o1
	edge16	%i4,	%g4,	%i1
	movn	%icc,	%i2,	%g7
	fmovd	%f26,	%f30
	alignaddrl	%l2,	%g1,	%l3
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
	movre	%l0,	0x234,	%o0
	tne	%icc,	0x3
	tge	%icc,	0x4
	edge32n	%i7,	%l1,	%g3
	addccc	%o5,	%i5,	%g5
	fmul8ulx16	%f24,	%f2,	%f18
	bpos,pn	%icc,	loop_2849
	fbuge	%fcc3,	loop_2850
	taddcc	%o7,	%o2,	%o4
	fba	%fcc0,	loop_2851
loop_2849:
	edge32n	%l4,	%o6,	%l6
loop_2850:
	andn	%o3,	0x151D,	%i0
	fmovse	%xcc,	%f18,	%f30
loop_2851:
	fpadd16s	%f21,	%f1,	%f26
	edge32ln	%i6,	%l5,	%i3
	bcs,a	%xcc,	loop_2852
	movrlez	%o1,	%g6,	%i4
	srl	%i1,	%i2,	%g7
	subccc	%l2,	0x10A8,	%g1
loop_2852:
	edge8	%l3,	%g2,	%g4
	fmul8x16	%f8,	%f24,	%f16
	tsubcctv	%l0,	%i7,	%l1
	xnorcc	%o0,	%o5,	%g3
	bn,a,pt	%icc,	loop_2853
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%g5,	0x16AF,	%i5
	wr	%g0,	0x11,	%asi
	stha	%o2,	[%l7 + 0x3E] %asi
loop_2853:
	tleu	%xcc,	0x5
	addcc	%o4,	%o7,	%o6
	movrgez	%l6,	0x2C4,	%o3
	fbug	%fcc1,	loop_2854
	movvs	%xcc,	%l4,	%i6
	alignaddrl	%i0,	%i3,	%o1
	movcs	%icc,	%g6,	%i4
loop_2854:
	brgz,a	%i1,	loop_2855
	movle	%icc,	%l5,	%g7
	array16	%l2,	%i2,	%g1
	sub	%l3,	0x12E2,	%g2
loop_2855:
	flush	%l7 + 0x74
	bpos	%icc,	loop_2856
	srax	%l0,	0x16,	%i7
	nop
	fitos	%f20,	%f21
	movrgz	%g4,	0x14D,	%l1
loop_2856:
	stbar
	sdiv	%o0,	0x196C,	%o5
	tle	%icc,	0x5
	sra	%g5,	0x00,	%g3
	fbuge,a	%fcc2,	loop_2857
	fbne	%fcc2,	loop_2858
	srlx	%o2,	%o4,	%i5
	sra	%o7,	%l6,	%o3
loop_2857:
	fmovrdgez	%l4,	%f2,	%f18
loop_2858:
	tle	%xcc,	0x3
	tle	%icc,	0x2
	fmovde	%icc,	%f29,	%f9
	srl	%i6,	0x1F,	%i0
	fors	%f26,	%f22,	%f6
	sdivcc	%i3,	0x0AC3,	%o1
	edge8n	%o6,	%g6,	%i1
	bpos,pn	%icc,	loop_2859
	sdiv	%i4,	0x0AA2,	%g7
	movn	%icc,	%l2,	%l5
	smulcc	%i2,	%g1,	%g2
loop_2859:
	fcmpgt16	%f28,	%f8,	%l3
	udiv	%i7,	0x1E86,	%g4
	nop
	fitod	%f2,	%f10
	fdtos	%f10,	%f28
	movgu	%xcc,	%l0,	%l1
	fbne	%fcc2,	loop_2860
	xor	%o5,	0x1732,	%g5
	movneg	%icc,	%o0,	%o2
	srax	%o4,	0x17,	%g3
loop_2860:
	movpos	%xcc,	%i5,	%l6
	tcc	%xcc,	0x7
	movrgez	%o7,	0x32B,	%l4
	ldsw	[%l7 + 0x14],	%i6
	faligndata	%f12,	%f18,	%f30
	tleu	%xcc,	0x1
	tl	%xcc,	0x7
	movpos	%icc,	%i0,	%o3
	fmovsneg	%xcc,	%f15,	%f29
	bl	loop_2861
	movcs	%xcc,	%i3,	%o1
	tl	%xcc,	0x6
	bne,a,pn	%icc,	loop_2862
loop_2861:
	fmovsge	%xcc,	%f12,	%f1
	movg	%xcc,	%o6,	%i1
	edge8n	%g6,	%i4,	%g7
loop_2862:
	tcc	%icc,	0x2
	brgz	%l5,	loop_2863
	bneg,a	loop_2864
	fmul8sux16	%f20,	%f24,	%f24
	smul	%l2,	%g1,	%g2
loop_2863:
	fmovda	%icc,	%f25,	%f19
loop_2864:
	udivcc	%l3,	0x0EA6,	%i2
	movne	%xcc,	%i7,	%g4
	fbge	%fcc1,	loop_2865
	tvc	%icc,	0x7
	tvc	%xcc,	0x6
	movne	%icc,	%l0,	%l1
loop_2865:
	bcs,a,pn	%xcc,	loop_2866
	ldd	[%l7 + 0x10],	%o4
	movne	%icc,	%o0,	%g5
	ldx	[%l7 + 0x70],	%o4
loop_2866:
	stw	%o2,	[%l7 + 0x30]
	stbar
	popc	%g3,	%i5
	te	%icc,	0x6
	wr	%g0,	0xe2,	%asi
	stwa	%o7,	[%l7 + 0x38] %asi
	membar	#Sync
	fmovrdne	%l4,	%f8,	%f4
	edge32n	%i6,	%i0,	%o3
	set	0x34, %o0
	ldstuba	[%l7 + %o0] 0x89,	%l6
	fnands	%f3,	%f30,	%f2
	movneg	%icc,	%o1,	%o6
	alignaddrl	%i3,	%i1,	%i4
	fornot1	%f22,	%f14,	%f2
	fpadd32	%f26,	%f8,	%f12
	movrlz	%g7,	%g6,	%l5
	array8	%g1,	%l2,	%g2
	edge8n	%i2,	%l3,	%i7
	xor	%g4,	0x0446,	%l0
	brnz	%o5,	loop_2867
	fblg,a	%fcc3,	loop_2868
	movrlz	%o0,	0x2E8,	%g5
	movrne	%o4,	%l1,	%o2
loop_2867:
	for	%f14,	%f2,	%f30
loop_2868:
	udiv	%g3,	0x134A,	%i5
	fmovsvc	%icc,	%f22,	%f12
	fpsub32s	%f4,	%f22,	%f2
	bne,a	%icc,	loop_2869
	umulcc	%o7,	0x17F4,	%i6
	bvc	loop_2870
	edge32	%i0,	%l4,	%l6
loop_2869:
	fmovsleu	%xcc,	%f26,	%f0
	fmovrde	%o3,	%f14,	%f28
loop_2870:
	edge32ln	%o6,	%i3,	%o1
	tsubcc	%i1,	0x0A86,	%g7
	te	%xcc,	0x5
	edge8ln	%g6,	%l5,	%i4
	stbar
	edge8n	%g1,	%l2,	%g2
	bvc,a	loop_2871
	andcc	%i2,	0x05C2,	%i7
	movrgez	%g4,	%l0,	%o5
	ldsw	[%l7 + 0x60],	%o0
loop_2871:
	nop
	set	0x23, %g3
	ldstuba	[%l7 + %g3] 0x80,	%g5
	movle	%icc,	%o4,	%l1
	fbo,a	%fcc2,	loop_2872
	bcc,pn	%icc,	loop_2873
	movrlez	%l3,	0x024,	%o2
	tgu	%xcc,	0x4
loop_2872:
	udiv	%i5,	0x0B7E,	%o7
loop_2873:
	andcc	%g3,	0x1E56,	%i0
	edge16ln	%l4,	%l6,	%o3
	mulx	%i6,	%i3,	%o6
	and	%i1,	%g7,	%g6
	bl,pt	%xcc,	loop_2874
	movvc	%icc,	%o1,	%i4
	bge	loop_2875
	orcc	%g1,	0x1960,	%l5
loop_2874:
	fmovsa	%xcc,	%f29,	%f25
	and	%g2,	%l2,	%i2
loop_2875:
	orncc	%g4,	%l0,	%i7
	tl	%icc,	0x1
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x0c
	stx	%o5,	[%l7 + 0x48]
	fmovsl	%xcc,	%f16,	%f10
	alignaddr	%g5,	%o4,	%l1
	stb	%o0,	[%l7 + 0x4E]
	sir	0x14C8
	stbar
	tvc	%xcc,	0x2
	movpos	%xcc,	%o2,	%i5
	brlez,a	%l3,	loop_2876
	movge	%icc,	%g3,	%o7
	addc	%l4,	0x1434,	%l6
	smulcc	%o3,	%i0,	%i6
loop_2876:
	xnorcc	%o6,	%i3,	%i1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%g7
	addccc	%o1,	0x1E31,	%g6
	movre	%g1,	%i4,	%l5
	fbl	%fcc1,	loop_2877
	ba	%icc,	loop_2878
	nop
	fitod	%f4,	%f24
	fdtoi	%f24,	%f4
	tne	%xcc,	0x0
loop_2877:
	movg	%icc,	%l2,	%i2
loop_2878:
	fmovscc	%xcc,	%f1,	%f19
	andncc	%g2,	%l0,	%i7
	move	%icc,	%g4,	%g5
	srax	%o4,	0x01,	%l1
	fmovsgu	%icc,	%f10,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f13,	%f18
	fstod	%f18,	%f22
	tsubcctv	%o5,	%o2,	%o0
	move	%icc,	%l3,	%i5
	edge32ln	%g3,	%l4,	%l6
	ldsw	[%l7 + 0x5C],	%o3
	movl	%icc,	%o7,	%i6
	and	%i0,	0x1FD7,	%o6
	stw	%i1,	[%l7 + 0x28]
	fnot2	%f10,	%f26
	popc	0x01D3,	%i3
	tn	%xcc,	0x2
	movl	%icc,	%g7,	%o1
	set	0x08, %g7
	prefetcha	[%l7 + %g7] 0x18,	 0x0
	nop
	setx loop_2879, %l0, %l1
	jmpl %l1, %g6
	sra	%i4,	%l5,	%i2
	alignaddrl	%l2,	%l0,	%g2
	ba,a,pt	%icc,	loop_2880
loop_2879:
	fpmerge	%f20,	%f1,	%f30
	popc	0x1EBF,	%g4
	nop
	fitos	%f2,	%f15
	fstox	%f15,	%f18
loop_2880:
	edge16ln	%i7,	%o4,	%g5
	edge32n	%l1,	%o2,	%o5
	edge8l	%l3,	%o0,	%i5
	stx	%l4,	[%l7 + 0x48]
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x70] %asi,	%g3
	movgu	%icc,	%o3,	%o7
	mulscc	%i6,	0x1A52,	%l6
	nop
	setx	0xF81FC066AAF6E5F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x5F10AC1A6910159B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f10,	%f30
	sir	0x1139
	fmovrdgez	%o6,	%f26,	%f28
	umulcc	%i1,	0x1827,	%i3
	umulcc	%g7,	%i0,	%o1
	nop
	setx	0xC6087391,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f10
	fmovda	%xcc,	%f30,	%f11
	movcs	%xcc,	%g1,	%i4
	mova	%xcc,	%l5,	%g6
	ble	loop_2881
	fcmpgt32	%f4,	%f28,	%l2
	nop
	setx	0x95C5BF1CA2E91BE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x46C2F099D0E6054C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f12,	%f24
	movl	%icc,	%l0,	%i2
loop_2881:
	nop
	setx	0x21FF20D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x490FACC1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f22,	%f22
	set	0x3C, %o1
	lduwa	[%l7 + %o1] 0x11,	%g4
	xorcc	%g2,	%i7,	%o4
	std	%f2,	[%l7 + 0x10]
	fornot1	%f2,	%f14,	%f0
	fmovsvc	%icc,	%f1,	%f26
	fnot1	%f8,	%f28
	edge16	%l1,	%o2,	%o5
	srax	%g5,	%l3,	%o0
	stbar
	edge32	%l4,	%i5,	%o3
	taddcctv	%g3,	%o7,	%l6
	bvc	%icc,	loop_2882
	sll	%i6,	%o6,	%i1
	nop
	setx loop_2883, %l0, %l1
	jmpl %l1, %g7
	movrgz	%i3,	0x293,	%i0
loop_2882:
	movrgez	%g1,	0x1D4,	%i4
	ta	%icc,	0x7
loop_2883:
	brz,a	%o1,	loop_2884
	movrgez	%g6,	0x2ED,	%l5
	movrgez	%l0,	0x363,	%l2
	bvc,pn	%xcc,	loop_2885
loop_2884:
	movpos	%xcc,	%i2,	%g2
	smul	%i7,	0x0124,	%g4
	tne	%icc,	0x4
loop_2885:
	flush	%l7 + 0x2C
	fcmple32	%f4,	%f6,	%l1
	udivcc	%o4,	0x0818,	%o5
	sdivcc	%g5,	0x1525,	%o2
	nop
	setx	0x660C54D30F4FC65B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x841AC92D16E008C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f22,	%f24
	fmul8x16au	%f21,	%f2,	%f14
	addccc	%o0,	%l3,	%i5
	bge,pt	%xcc,	loop_2886
	subc	%l4,	0x0989,	%g3
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o7
loop_2886:
	edge16	%o3,	%i6,	%o6
	srl	%i1,	0x00,	%l6
	fmovrdlz	%i3,	%f4,	%f6
	tgu	%xcc,	0x6
	bvc	loop_2887
	fmovsle	%icc,	%f0,	%f19
	movl	%icc,	%g7,	%g1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x7F] %asi,	%i4
loop_2887:
	add	%i0,	0x1D4F,	%g6
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x19,	%f0
	nop
	setx	0x888437192045C84A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	movneg	%icc,	%l5,	%l0
	fmovdne	%xcc,	%f13,	%f27
	edge32ln	%l2,	%i2,	%o1
	movn	%icc,	%i7,	%g2
	fmovsg	%xcc,	%f16,	%f25
	fcmpgt32	%f12,	%f2,	%g4
	movle	%xcc,	%l1,	%o5
	movre	%o4,	%g5,	%o0
	tleu	%xcc,	0x2
	tleu	%icc,	0x0
	set	0x28, %i1
	stxa	%l3,	[%g0 + %i1] 0x4f
	fmovsne	%xcc,	%f18,	%f21
	ble	%icc,	loop_2888
	fblg,a	%fcc0,	loop_2889
	edge16n	%o2,	%l4,	%i5
	fbo	%fcc0,	loop_2890
loop_2888:
	fexpand	%f24,	%f12
loop_2889:
	smulcc	%o7,	0x0B75,	%g3
	edge16	%o3,	%o6,	%i1
loop_2890:
	fba,a	%fcc3,	loop_2891
	membar	0x56
	fnegs	%f9,	%f10
	smul	%i6,	0x0C1B,	%l6
loop_2891:
	tg	%icc,	0x7
	movleu	%icc,	%g7,	%i3
	fcmpgt16	%f8,	%f12,	%i4
	fxnor	%f12,	%f10,	%f0
	edge8	%i0,	%g6,	%l5
	array16	%l0,	%l2,	%g1
	xorcc	%o1,	%i2,	%i7
	tleu	%icc,	0x4
	sllx	%g4,	0x11,	%l1
	sllx	%o5,	%g2,	%g5
	wr	%g0,	0x21,	%asi
	stxa	%o0,	[%g0 + 0x10] %asi
	edge32n	%o4,	%l3,	%o2
	movvc	%xcc,	%l4,	%o7
	or	%g3,	%i5,	%o6
	edge32	%i1,	%o3,	%l6
	umul	%g7,	%i6,	%i4
	sra	%i3,	%i0,	%g6
	fmovdleu	%xcc,	%f15,	%f28
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x20] %asi,	%f19
	tle	%icc,	0x3
	alignaddr	%l5,	%l2,	%l0
	movcs	%xcc,	%o1,	%i2
	sdivcc	%i7,	0x006A,	%g1
	fbug,a	%fcc3,	loop_2892
	movleu	%icc,	%g4,	%l1
	udiv	%g2,	0x0ADD,	%o5
	movrgz	%g5,	%o4,	%o0
loop_2892:
	fmovsvs	%xcc,	%f26,	%f22
	ldsh	[%l7 + 0x30],	%l3
	stx	%o2,	[%l7 + 0x10]
	fmul8sux16	%f18,	%f30,	%f6
	add	%l4,	%g3,	%i5
	sdivx	%o7,	0x1FCE,	%i1
	ldx	[%l7 + 0x30],	%o6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x54] %asi,	%o3
	tgu	%xcc,	0x6
	array8	%g7,	%i6,	%l6
	wr	%g0,	0x2a,	%asi
	stha	%i3,	[%l7 + 0x32] %asi
	membar	#Sync
	fnands	%f29,	%f23,	%f19
	fmovdl	%xcc,	%f4,	%f15
	udivcc	%i4,	0x1070,	%i0
	mulx	%l5,	0x130F,	%l2
	or	%l0,	0x1C4A,	%o1
	swap	[%l7 + 0x68],	%g6
	taddcctv	%i2,	0x0527,	%g1
	sllx	%i7,	%l1,	%g2
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovsn	%xcc,	%f27,	%f19
	tleu	%xcc,	0x6
	bg,pn	%xcc,	loop_2893
	fmovrdgez	%g4,	%f26,	%f14
	fornot2s	%f4,	%f29,	%f22
	nop
	setx	loop_2894,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2893:
	edge32	%g5,	%o5,	%o4
	subcc	%l3,	%o2,	%l4
	edge8ln	%o0,	%g3,	%o7
loop_2894:
	movrlez	%i5,	%i1,	%o6
	fmovsg	%xcc,	%f29,	%f16
	set	0x08, %l4
	ldxa	[%l7 + %l4] 0x14,	%o3
	fpmerge	%f12,	%f16,	%f20
	swap	[%l7 + 0x60],	%i6
	fmovrse	%l6,	%f27,	%f21
	movvc	%icc,	%g7,	%i3
	fmovdvs	%icc,	%f23,	%f11
	ldsb	[%l7 + 0x27],	%i0
	umul	%i4,	%l2,	%l0
	sub	%o1,	%g6,	%l5
	movpos	%xcc,	%i2,	%i7
	fbe	%fcc1,	loop_2895
	movgu	%xcc,	%l1,	%g2
	movrlz	%g4,	0x145,	%g1
	srlx	%g5,	%o4,	%l3
loop_2895:
	nop
	fitos	%f0,	%f21
	fstoi	%f21,	%f16
	tcc	%xcc,	0x7
	addccc	%o5,	0x0774,	%l4
	tge	%xcc,	0x6
	movgu	%xcc,	%o2,	%o0
	fnot2s	%f0,	%f14
	umulcc	%o7,	0x1499,	%g3
	nop
	setx	0xA758E707,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xC3A4CBF1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f27,	%f10
	set	0x74, %g5
	swapa	[%l7 + %g5] 0x81,	%i5
	udiv	%o6,	0x1603,	%o3
	and	%i6,	%l6,	%i1
	flush	%l7 + 0x14
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bn	loop_2896
	andn	%i3,	0x1C2F,	%g7
	taddcctv	%i4,	0x1457,	%i0
	move	%icc,	%l0,	%o1
loop_2896:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x0c,	%l2,	%l5
	nop
	fitos	%f12,	%f3
	fstod	%f3,	%f4
	tg	%xcc,	0x1
	tne	%xcc,	0x1
	bneg,a	loop_2897
	tle	%icc,	0x1
	fmovsn	%icc,	%f29,	%f15
	srl	%i2,	%i7,	%g6
loop_2897:
	subcc	%l1,	%g2,	%g4
	brz	%g1,	loop_2898
	movpos	%icc,	%g5,	%l3
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2898:
	edge8n	%o5,	%o4,	%o2
	srlx	%o0,	0x05,	%l4
	fmovdl	%icc,	%f5,	%f12
	fmovdvc	%xcc,	%f12,	%f28
	fsrc2	%f28,	%f18
	array16	%o7,	%g3,	%o6
	xorcc	%o3,	%i5,	%l6
	fmovdvc	%icc,	%f6,	%f11
	fbne	%fcc3,	loop_2899
	sdivx	%i6,	0x0ECC,	%i3
	fmovd	%f0,	%f16
	add	%g7,	%i4,	%i1
loop_2899:
	smul	%i0,	%l0,	%l2
	movleu	%xcc,	%o1,	%l5
	ba,a	loop_2900
	srl	%i2,	0x1A,	%i7
	movgu	%icc,	%l1,	%g6
	nop
	setx	0xB0517166,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
loop_2900:
	fmovdleu	%icc,	%f30,	%f12
	nop
	setx	0xDBA46056,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xA0A5C877,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f21,	%f10
	movleu	%icc,	%g2,	%g1
	edge16n	%g5,	%g4,	%o5
	subccc	%o4,	%o2,	%l3
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l4
	sub	%o7,	%o0,	%g3
	fmovrdlez	%o3,	%f20,	%f28
	wr	%g0,	0x11,	%asi
	sta	%f26,	[%l7 + 0x1C] %asi
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x24] %asi,	%i5
	edge32n	%l6,	%i6,	%o6
	movrgz	%g7,	0x173,	%i3
	addccc	%i4,	%i1,	%i0
	edge32ln	%l2,	%l0,	%l5
	nop
	setx	0xE05131DD,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	ba,pt	%icc,	loop_2901
	move	%xcc,	%o1,	%i7
	edge16n	%l1,	%g6,	%g2
	tl	%xcc,	0x0
loop_2901:
	movneg	%xcc,	%i2,	%g1
	fmovdvc	%icc,	%f29,	%f1
	xnor	%g5,	0x028D,	%o5
	orcc	%o4,	%o2,	%g4
	fbo	%fcc2,	loop_2902
	sethi	0x1588,	%l4
	bn,a	loop_2903
	movge	%icc,	%l3,	%o0
loop_2902:
	membar	0x34
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g3
loop_2903:
	bpos	%icc,	loop_2904
	sethi	0x105A,	%o3
	movleu	%icc,	%o7,	%i5
	bcc	loop_2905
loop_2904:
	membar	0x6D
	xor	%l6,	%o6,	%i6
	sdivx	%g7,	0x02F0,	%i4
loop_2905:
	sllx	%i1,	0x1C,	%i0
	fbl,a	%fcc2,	loop_2906
	array8	%i3,	%l0,	%l5
	fmovs	%f31,	%f25
	tcc	%xcc,	0x5
loop_2906:
	movrlez	%o1,	0x13F,	%l2
	movre	%i7,	0x37D,	%l1
	tgu	%xcc,	0x2
	tgu	%icc,	0x5
	fsrc1s	%f7,	%f5
	addc	%g6,	%g2,	%i2
	andn	%g5,	0x1624,	%g1
	movrlez	%o4,	%o5,	%o2
	nop
	setx	0x4AB419034651B628,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x31C7DEEC497061B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f16,	%f0
	edge16	%g4,	%l3,	%o0
	tleu	%xcc,	0x3
	edge32	%g3,	%o3,	%l4
	edge16n	%i5,	%l6,	%o7
	subccc	%o6,	%g7,	%i4
	movrgz	%i1,	0x149,	%i6
	fones	%f25
	nop
	setx	0x0D36A8EC14EE14C0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xB3F1A229855E66C7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f8,	%f12
	tvs	%xcc,	0x5
	fmovsge	%xcc,	%f10,	%f1
	fblg,a	%fcc2,	loop_2907
	fbge	%fcc0,	loop_2908
	bn,pn	%xcc,	loop_2909
	edge8	%i3,	%l0,	%l5
loop_2907:
	movrgez	%o1,	0x0ED,	%l2
loop_2908:
	movvc	%icc,	%i0,	%i7
loop_2909:
	ta	%icc,	0x3
	tvs	%icc,	0x2
	tgu	%xcc,	0x6
	or	%g6,	%g2,	%i2
	umul	%l1,	%g5,	%o4
	for	%f8,	%f24,	%f0
	sdivx	%g1,	0x1719,	%o5
	tg	%icc,	0x7
	tcc	%icc,	0x3
	fmul8sux16	%f10,	%f10,	%f14
	brlz	%o2,	loop_2910
	edge16l	%g4,	%l3,	%o0
	orncc	%o3,	%l4,	%g3
	movne	%icc,	%l6,	%i5
loop_2910:
	movge	%xcc,	%o7,	%g7
	movrgez	%i4,	%o6,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f3
	te	%xcc,	0x1
	sdivcc	%i3,	0x0E12,	%l0
	xor	%i1,	%o1,	%l5
	or	%l2,	%i7,	%i0
	edge32	%g6,	%i2,	%g2
	tcs	%icc,	0x5
	umul	%g5,	0x1873,	%l1
	wr	%g0,	0x89,	%asi
	stha	%o4,	[%l7 + 0x2A] %asi
	fble,a	%fcc0,	loop_2911
	ldstub	[%l7 + 0x73],	%g1
	fand	%f22,	%f24,	%f26
	fmovrse	%o5,	%f17,	%f9
loop_2911:
	array32	%g4,	%l3,	%o2
	nop
	setx	0xCF2984BF3A8F773F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x45563AADF5AD8B3C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f24,	%f8
	st	%f27,	[%l7 + 0x14]
	nop
	setx	0xB78446C1F47E7B05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x268666A1424137C2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f6,	%f8
	fpsub32	%f28,	%f2,	%f26
	bgu	%icc,	loop_2912
	fba	%fcc0,	loop_2913
	move	%icc,	%o3,	%l4
	movleu	%icc,	%o0,	%g3
loop_2912:
	brlez	%i5,	loop_2914
loop_2913:
	sub	%o7,	%g7,	%l6
	movrne	%i4,	0x2E5,	%o6
	umulcc	%i6,	0x0C42,	%i3
loop_2914:
	nop
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x24] %asi,	%l0
	movrlz	%o1,	%i1,	%l5
	addccc	%l2,	0x0AC5,	%i7
	bleu	loop_2915
	srl	%i0,	%g6,	%i2
	membar	0x74
	brgz	%g2,	loop_2916
loop_2915:
	faligndata	%f24,	%f22,	%f4
	lduh	[%l7 + 0x50],	%g5
	sir	0x16C3
loop_2916:
	fmovrdne	%l1,	%f18,	%f28
	alignaddr	%g1,	%o5,	%o4
	nop
	setx	loop_2917,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_2918
	fxor	%f24,	%f18,	%f20
	andncc	%l3,	%o2,	%o3
loop_2917:
	movge	%icc,	%l4,	%g4
loop_2918:
	nop
	setx	0x999D14D1CD5F73B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xDF7A76B2AF322546,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f12,	%f0
	sub	%o0,	%g3,	%i5
	alignaddr	%o7,	%g7,	%l6
	and	%o6,	%i4,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%i6,	0x1740,	%l0
	mulscc	%i1,	%l5,	%o1
	fbul	%fcc2,	loop_2919
	fabss	%f21,	%f25
	set	0x38, %l2
	ldsha	[%l7 + %l2] 0x89,	%i7
loop_2919:
	tpos	%xcc,	0x7
	fmovscc	%icc,	%f31,	%f25
	smulcc	%l2,	0x022B,	%g6
	membar	0x09
	edge8n	%i0,	%i2,	%g5
	edge32n	%l1,	%g1,	%o5
	fbn	%fcc3,	loop_2920
	fba,a	%fcc3,	loop_2921
	edge16	%o4,	%g2,	%l3
	orn	%o3,	0x07DA,	%o2
loop_2920:
	fpsub32s	%f8,	%f6,	%f18
loop_2921:
	array8	%g4,	%o0,	%g3
	edge8n	%l4,	%i5,	%o7
	and	%l6,	0x1CF7,	%o6
	xorcc	%g7,	%i3,	%i6
	movvs	%icc,	%i4,	%i1
	movcc	%xcc,	%l5,	%o1
	array32	%i7,	%l2,	%l0
	movgu	%icc,	%g6,	%i2
	udivx	%i0,	0x05CE,	%l1
	tge	%xcc,	0x3
	fmovdn	%icc,	%f4,	%f29
	fpsub32	%f14,	%f12,	%f20
	fsrc2s	%f25,	%f20
	srl	%g1,	0x13,	%o5
	lduh	[%l7 + 0x0C],	%g5
	tge	%xcc,	0x2
	tsubcctv	%g2,	%l3,	%o3
	wr	%g0,	0x81,	%asi
	stha	%o4,	[%l7 + 0x14] %asi
	movre	%o2,	0x134,	%g4
	sra	%o0,	%g3,	%l4
	bpos,a	%xcc,	loop_2922
	movvs	%xcc,	%i5,	%l6
	movvs	%icc,	%o6,	%g7
	tgu	%xcc,	0x0
loop_2922:
	sll	%i3,	%o7,	%i6
	movl	%icc,	%i1,	%l5
	movpos	%icc,	%i4,	%i7
	edge8l	%l2,	%o1,	%l0
	fbg	%fcc3,	loop_2923
	subc	%g6,	%i0,	%l1
	sll	%i2,	0x0B,	%g1
	movleu	%icc,	%g5,	%g2
loop_2923:
	mulx	%l3,	%o3,	%o4
	edge16n	%o5,	%g4,	%o0
	fmuld8sux16	%f0,	%f25,	%f4
	fmovrdgez	%g3,	%f22,	%f26
	tsubcctv	%l4,	%o2,	%i5
	movrlez	%o6,	0x2D8,	%l6
	sub	%g7,	0x0974,	%i3
	bl	loop_2924
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f20
	fxtod	%f20,	%f30
	udiv	%o7,	0x057C,	%i1
	ba,a	%icc,	loop_2925
loop_2924:
	nop
	fitos	%f4,	%f10
	fstox	%f10,	%f2
	movleu	%icc,	%l5,	%i4
	andncc	%i6,	%i7,	%o1
loop_2925:
	or	%l2,	%l0,	%i0
	sdivx	%g6,	0x05BB,	%i2
	mulscc	%l1,	%g1,	%g2
	bge,a	loop_2926
	edge8n	%g5,	%l3,	%o4
	stw	%o3,	[%l7 + 0x48]
	sdivx	%o5,	0x0F57,	%o0
loop_2926:
	fbge,a	%fcc2,	loop_2927
	movrgez	%g3,	0x15A,	%l4
	bg,a,pt	%xcc,	loop_2928
	bcc	%icc,	loop_2929
loop_2927:
	tvc	%xcc,	0x3
	fxor	%f4,	%f30,	%f12
loop_2928:
	xorcc	%g4,	%i5,	%o2
loop_2929:
	xorcc	%l6,	%o6,	%i3
	ta	%xcc,	0x3
	fmovdcc	%icc,	%f1,	%f17
	fmovdcc	%icc,	%f25,	%f10
	orcc	%o7,	0x1C9A,	%i1
	bneg,a	%icc,	loop_2930
	movneg	%xcc,	%l5,	%g7
	bvc	loop_2931
	mulx	%i6,	0x0540,	%i7
loop_2930:
	movvs	%icc,	%o1,	%l2
	tcs	%xcc,	0x3
loop_2931:
	nop
	setx	0x0B7A211FD066FFA9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f14
	tvs	%icc,	0x2
	movvc	%xcc,	%i4,	%l0
	movvs	%icc,	%i0,	%i2
	andn	%l1,	%g1,	%g6
	subcc	%g5,	%g2,	%o4
	edge16n	%l3,	%o5,	%o0
	stw	%o3,	[%l7 + 0x5C]
	fmovdvc	%xcc,	%f30,	%f31
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0x3
	fcmpeq32	%f16,	%f24,	%g4
	fnot1s	%f25,	%f12
	movleu	%xcc,	%g3,	%i5
	array8	%l6,	%o6,	%i3
	tne	%icc,	0x1
	ba,a,pn	%xcc,	loop_2932
	movg	%xcc,	%o2,	%o7
	fbul	%fcc1,	loop_2933
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2932:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%i0
loop_2933:
	fba	%fcc2,	loop_2934
	fmovrslz	%g7,	%f21,	%f7
	sub	%i6,	0x1350,	%l5
	edge8l	%o1,	%l2,	%i4
loop_2934:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l0,	0x17D8,	%i0
	smulcc	%i2,	%l1,	%g1
	smul	%i7,	0x1150,	%g5
	fmul8ulx16	%f6,	%f30,	%f26
	nop
	setx	loop_2935,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbue	%fcc2,	loop_2936
	taddcc	%g6,	0x0831,	%o4
	edge16n	%g2,	%o5,	%o0
loop_2935:
	movn	%xcc,	%l3,	%o3
loop_2936:
	alignaddrl	%l4,	%g3,	%g4
	fmovsn	%xcc,	%f15,	%f20
	alignaddrl	%l6,	%o6,	%i5
	ble,a,pn	%xcc,	loop_2937
	tge	%xcc,	0x2
	tl	%xcc,	0x2
	sll	%o2,	0x00,	%o7
loop_2937:
	tn	%icc,	0x3
	nop
	set	0x29, %l6
	stb	%i3,	[%l7 + %l6]
	orcc	%i1,	%i6,	%l5
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	fmovsvs	%xcc,	%f31,	%f8
	tpos	%icc,	0x7
	nop
	set	0x74, %o6
	sth	%l2,	[%l7 + %o6]
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o1
	fbe,a	%fcc3,	loop_2938
	addc	%i4,	%i0,	%l0
	nop
	setx	loop_2939,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%i2,	%l1,	%g1
loop_2938:
	udivx	%g5,	0x1F46,	%g6
	fpack32	%f8,	%f8,	%f26
loop_2939:
	fmovsne	%icc,	%f7,	%f7
	membar	0x17
	fmovde	%icc,	%f15,	%f31
	nop
	setx	0xBC8942445069E6B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f13,	%f0,	%f24
	edge8	%i7,	%o4,	%o5
	movg	%xcc,	%o0,	%l3
	edge16n	%o3,	%g2,	%l4
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrdne	%g4,	%f24,	%f20
	ldsw	[%l7 + 0x78],	%g3
	nop
	fitos	%f10,	%f4
	fstox	%f4,	%f4
	tg	%icc,	0x5
	set	0x38, %o4
	stha	%o6,	[%l7 + %o4] 0x23
	membar	#Sync
	sllx	%i5,	%o2,	%l6
	udivx	%o7,	0x0D44,	%i1
	edge32ln	%i6,	%l5,	%i3
	udiv	%l2,	0x02D8,	%g7
	bcs	loop_2940
	tcc	%icc,	0x0
	brlz,a	%i4,	loop_2941
	swap	[%l7 + 0x28],	%o1
loop_2940:
	srax	%l0,	0x0A,	%i2
	xor	%l1,	%i0,	%g5
loop_2941:
	fbn,a	%fcc0,	loop_2942
	fand	%f14,	%f4,	%f0
	ldstub	[%l7 + 0x0B],	%g6
	subccc	%i7,	%o4,	%o5
loop_2942:
	fmovrdne	%g1,	%f18,	%f2
	fmovdne	%xcc,	%f0,	%f23
	fbul,a	%fcc2,	loop_2943
	tgu	%xcc,	0x6
	nop
	setx	0x40554EB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	sdivx	%o0,	0x163A,	%l3
loop_2943:
	stx	%o3,	[%l7 + 0x08]
	movpos	%xcc,	%g2,	%g4
	fcmpne32	%f12,	%f24,	%g3
	and	%o6,	%i5,	%l4
	tg	%xcc,	0x2
	movrgz	%l6,	%o7,	%i1
	fmovsn	%xcc,	%f21,	%f12
	movl	%xcc,	%i6,	%l5
	brz,a	%i3,	loop_2944
	move	%icc,	%l2,	%o2
	fmovsneg	%xcc,	%f3,	%f5
	set	0x5C, %o2
	lduba	[%l7 + %o2] 0x04,	%g7
loop_2944:
	ldd	[%l7 + 0x38],	%f0
	fmovrdne	%o1,	%f10,	%f24
	edge8l	%l0,	%i2,	%l1
	movn	%icc,	%i0,	%g5
	fxnors	%f28,	%f23,	%f11
	set	0x6C, %i3
	lduwa	[%l7 + %i3] 0x18,	%i4
	fmovsneg	%xcc,	%f10,	%f12
	xnor	%i7,	0x19A6,	%g6
	fmuld8sux16	%f22,	%f10,	%f26
	fornot2s	%f22,	%f6,	%f31
	edge32n	%o5,	%o4,	%o0
	fmovsvs	%icc,	%f4,	%f15
	tn	%icc,	0x4
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f28
	prefetch	[%l7 + 0x40],	 0x0
	nop
	setx loop_2945, %l0, %l1
	jmpl %l1, %g1
	movle	%icc,	%l3,	%o3
	tneg	%xcc,	0x6
	fpadd32s	%f18,	%f6,	%f12
loop_2945:
	tleu	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x10] %asi,	%g2
	fbge	%fcc0,	loop_2946
	addccc	%g4,	%g3,	%i5
	fble,a	%fcc2,	loop_2947
	edge16l	%l4,	%o6,	%o7
loop_2946:
	ble,a	loop_2948
	edge32	%l6,	%i1,	%i6
loop_2947:
	addcc	%l5,	0x0F53,	%i3
	edge16	%l2,	%o2,	%o1
loop_2948:
	movrlz	%l0,	0x136,	%g7
	nop
	fitos	%f8,	%f15
	fstox	%f15,	%f8
	fxtos	%f8,	%f11
	movg	%icc,	%l1,	%i0
	taddcc	%i2,	0x1C02,	%i4
	nop
	setx	loop_2949,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16n	%g5,	%g6,	%o5
	fmovrdgez	%i7,	%f30,	%f28
	xnor	%o4,	0x13D4,	%o0
loop_2949:
	fmovscc	%xcc,	%f18,	%f21
	udivx	%l3,	0x08B1,	%g1
	srax	%g2,	0x1C,	%g4
	fbge	%fcc1,	loop_2950
	bn,a,pn	%xcc,	loop_2951
	smul	%g3,	0x16E1,	%o3
	edge16l	%l4,	%o6,	%o7
loop_2950:
	for	%f4,	%f14,	%f10
loop_2951:
	fornot2s	%f17,	%f12,	%f8
	fba,a	%fcc1,	loop_2952
	taddcctv	%l6,	0x1FEA,	%i5
	bneg,pt	%icc,	loop_2953
	bshuffle	%f24,	%f16,	%f0
loop_2952:
	nop
	wr	%g0,	0x18,	%asi
	stha	%i1,	[%l7 + 0x5C] %asi
loop_2953:
	edge8ln	%i6,	%i3,	%l2
	fmovdpos	%xcc,	%f13,	%f1
	nop
	fitos	%f2,	%f14
	fstoi	%f14,	%f23
	tle	%xcc,	0x2
	nop
	setx	0x8273A35F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x78705EF3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f6,	%f3
	srax	%o2,	%l5,	%l0
	smulcc	%o1,	0x1FAB,	%g7
	fmovdge	%icc,	%f14,	%f20
	tneg	%xcc,	0x5
	fsrc2s	%f5,	%f9
	tg	%xcc,	0x5
	mulx	%i0,	%l1,	%i4
	movne	%xcc,	%g5,	%g6
	umul	%i2,	0x1252,	%o5
	set	0x11, %l0
	ldstuba	[%l7 + %l0] 0x88,	%i7
	umul	%o0,	%o4,	%l3
	alignaddrl	%g1,	%g4,	%g2
	mulscc	%g3,	%o3,	%l4
	taddcc	%o6,	0x0E06,	%o7
	fmovrdlez	%l6,	%f12,	%f16
	tsubcc	%i1,	%i6,	%i3
	fabsd	%f24,	%f8
	movrgez	%i5,	0x184,	%o2
	move	%icc,	%l5,	%l0
	fbge	%fcc1,	loop_2954
	addc	%l2,	%g7,	%i0
	mulx	%l1,	0x198F,	%o1
	fpsub16	%f2,	%f4,	%f18
loop_2954:
	fpackfix	%f16,	%f20
	tne	%xcc,	0x4
	bneg	%icc,	loop_2955
	fmovscc	%icc,	%f7,	%f3
	fnot1	%f10,	%f8
	set	0x50, %l5
	lduwa	[%l7 + %l5] 0x18,	%g5
loop_2955:
	xorcc	%g6,	0x1ADB,	%i2
	fpsub32	%f26,	%f28,	%f0
	fbule	%fcc2,	loop_2956
	sdivcc	%i4,	0x1C2E,	%o5
	tcc	%icc,	0x1
	edge16l	%i7,	%o0,	%l3
loop_2956:
	fble,a	%fcc0,	loop_2957
	movleu	%icc,	%g1,	%g4
	fble	%fcc1,	loop_2958
	fbl	%fcc3,	loop_2959
loop_2957:
	alignaddrl	%o4,	%g2,	%o3
	fornot2s	%f6,	%f25,	%f3
loop_2958:
	bneg	%icc,	loop_2960
loop_2959:
	movle	%xcc,	%l4,	%g3
	set	0x68, %i6
	swapa	[%l7 + %i6] 0x18,	%o6
loop_2960:
	fpack16	%f24,	%f8
	addc	%o7,	0x09AF,	%i1
	ta	%xcc,	0x0
	sethi	0x0131,	%i6
	tsubcc	%l6,	%i5,	%o2
	array32	%i3,	%l0,	%l2
	fbge	%fcc0,	loop_2961
	addc	%g7,	%l5,	%i0
	wr	%g0,	0x81,	%asi
	sta	%f24,	[%l7 + 0x6C] %asi
loop_2961:
	tneg	%xcc,	0x5
	subccc	%o1,	%l1,	%g6
	edge32l	%g5,	%i4,	%o5
	std	%f30,	[%l7 + 0x28]
	ldx	[%l7 + 0x08],	%i7
	ta	%icc,	0x5
	xnorcc	%i2,	%o0,	%g1
	xorcc	%l3,	%o4,	%g4
	edge32	%o3,	%l4,	%g3
	tsubcctv	%o6,	%o7,	%i1
	sir	0x0380
	xnor	%i6,	%g2,	%l6
	fbn,a	%fcc0,	loop_2962
	tgu	%icc,	0x0
	bgu	%icc,	loop_2963
	xorcc	%i5,	%i3,	%o2
loop_2962:
	tvs	%xcc,	0x4
	sth	%l2,	[%l7 + 0x5A]
loop_2963:
	fmovdcc	%xcc,	%f29,	%f25
	tle	%xcc,	0x7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%l5
	edge16	%g7,	%i0,	%l1
	orncc	%g6,	%g5,	%o1
	stbar
	tn	%xcc,	0x5
	fbo	%fcc1,	loop_2964
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%i4
	xorcc	%o5,	0x1792,	%i2
	bvc,a	%xcc,	loop_2965
loop_2964:
	edge32	%i7,	%o0,	%l3
	te	%xcc,	0x4
	edge8l	%g1,	%g4,	%o3
loop_2965:
	subccc	%l4,	%o4,	%g3
	edge32	%o7,	%o6,	%i1
	tcs	%icc,	0x2
	fbe	%fcc3,	loop_2966
	fpsub32s	%f14,	%f16,	%f3
	tvc	%icc,	0x2
	subccc	%i6,	0x1DEE,	%l6
loop_2966:
	edge32	%g2,	%i3,	%i5
	orncc	%l2,	%o2,	%l5
	movcc	%xcc,	%l0,	%g7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x58] %asi,	%i0
	stb	%l1,	[%l7 + 0x35]
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x11,	%g6
	fmovdge	%xcc,	%f3,	%f5
	fmovs	%f16,	%f4
	tl	%xcc,	0x6
	array32	%g5,	%i4,	%o5
	taddcc	%i2,	%i7,	%o0
	sdivcc	%o1,	0x0C13,	%l3
	umulcc	%g1,	0x1D02,	%g4
	xnor	%o3,	%l4,	%g3
	movgu	%icc,	%o4,	%o7
	movge	%xcc,	%o6,	%i1
	tsubcc	%l6,	0x193C,	%i6
	orncc	%g2,	%i3,	%i5
	fand	%f8,	%f14,	%f30
	fbl,a	%fcc2,	loop_2967
	edge32n	%l2,	%o2,	%l5
	xor	%g7,	0x0671,	%i0
	edge32l	%l1,	%g6,	%g5
loop_2967:
	srl	%l0,	%o5,	%i2
	edge8n	%i7,	%i4,	%o0
	orcc	%l3,	%g1,	%o1
	fmovrdlez	%g4,	%f30,	%f2
	fble	%fcc2,	loop_2968
	srl	%l4,	0x19,	%g3
	fcmpgt16	%f24,	%f24,	%o3
	sdivcc	%o7,	0x06EE,	%o4
loop_2968:
	ldd	[%l7 + 0x70],	%f26
	or	%o6,	0x19C7,	%i1
	udivx	%i6,	0x077E,	%l6
	fmovdn	%xcc,	%f21,	%f30
	brz,a	%g2,	loop_2969
	fbule	%fcc1,	loop_2970
	or	%i5,	%l2,	%o2
	fbge	%fcc2,	loop_2971
loop_2969:
	edge32n	%i3,	%l5,	%i0
loop_2970:
	subcc	%g7,	0x0B00,	%g6
	array8	%l1,	%g5,	%l0
loop_2971:
	sdivcc	%i2,	0x0673,	%i7
	fba	%fcc0,	loop_2972
	movrlz	%i4,	0x38D,	%o0
	fzeros	%f26
	stb	%o5,	[%l7 + 0x2B]
loop_2972:
	edge8l	%g1,	%o1,	%l3
	ld	[%l7 + 0x58],	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l4,	%g3
	nop
	setx loop_2973, %l0, %l1
	jmpl %l1, %o3
	tneg	%xcc,	0x4
	nop
	fitos	%f14,	%f5
	fstox	%f5,	%f10
	movg	%xcc,	%g4,	%o7
loop_2973:
	sra	%o6,	%i1,	%o4
	std	%f14,	[%l7 + 0x28]
	array32	%l6,	%g2,	%i6
	ld	[%l7 + 0x78],	%f15
	edge32ln	%i5,	%l2,	%o2
	tpos	%icc,	0x2
	addcc	%i3,	%i0,	%l5
	fors	%f0,	%f11,	%f10
	fmovsvc	%xcc,	%f10,	%f14
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x64] %asi,	%g7
	fsrc1s	%f27,	%f21
	udiv	%g6,	0x1A4A,	%l1
	brnz	%g5,	loop_2974
	xnorcc	%i2,	%i7,	%l0
	stb	%o0,	[%l7 + 0x5C]
	popc	%i4,	%o5
loop_2974:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x72, %i4
	sth	%g1,	[%l7 + %i4]
	addcc	%l3,	%o1,	%l4
	andncc	%g3,	%o3,	%g4
	nop
	set	0x22, %g6
	lduh	[%l7 + %g6],	%o6
	fnegd	%f4,	%f16
	xnor	%o7,	%i1,	%o4
	ba,a	loop_2975
	fmovsg	%xcc,	%f16,	%f18
	nop
	setx	loop_2976,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu,a	%fcc2,	loop_2977
loop_2975:
	edge32n	%g2,	%i6,	%l6
	mulscc	%l2,	0x1971,	%i5
loop_2976:
	tle	%xcc,	0x5
loop_2977:
	nop
	fitod	%f0,	%f4
	fdtox	%f4,	%f16
	fsrc2	%f10,	%f4
	fbuge,a	%fcc3,	loop_2978
	sub	%o2,	0x17FD,	%i0
	srax	%l5,	%i3,	%g7
	fmovdle	%xcc,	%f29,	%f11
loop_2978:
	edge32	%g6,	%g5,	%l1
	fbu,a	%fcc2,	loop_2979
	nop
	setx	0x74E44255,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x75CC1281,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f19,	%f17
	tle	%icc,	0x1
	fmovsneg	%icc,	%f14,	%f14
loop_2979:
	fbul,a	%fcc0,	loop_2980
	stw	%i2,	[%l7 + 0x78]
	subc	%i7,	%o0,	%l0
	nop
	setx loop_2981, %l0, %l1
	jmpl %l1, %i4
loop_2980:
	or	%g1,	%l3,	%o5
	add	%l4,	0x01DD,	%g3
	fmovrdgz	%o3,	%f20,	%f4
loop_2981:
	sllx	%o1,	0x15,	%o6
	orn	%g4,	0x0EDB,	%i1
	fpack32	%f2,	%f4,	%f14
	tsubcctv	%o4,	%o7,	%g2
	edge8ln	%i6,	%l6,	%l2
	te	%icc,	0x0
	set	0x33, %l1
	ldsba	[%l7 + %l1] 0x0c,	%i5
	fmovdne	%xcc,	%f16,	%f30
	fnot2s	%f22,	%f23
	edge16	%o2,	%i0,	%i3
	xnor	%l5,	0x06EE,	%g6
	taddcctv	%g7,	0x1EE1,	%l1
	subc	%i2,	0x19ED,	%i7
	set	0x1D, %i2
	ldsba	[%l7 + %i2] 0x19,	%g5
	ldstub	[%l7 + 0x0A],	%o0
	edge32ln	%l0,	%g1,	%l3
	movle	%icc,	%o5,	%l4
	fcmpgt32	%f26,	%f18,	%g3
	bg,pn	%icc,	loop_2982
	movg	%xcc,	%o3,	%o1
	tneg	%icc,	0x2
	tcc	%icc,	0x6
loop_2982:
	fzeros	%f6
	brz	%o6,	loop_2983
	xor	%g4,	%i4,	%o4
	tleu	%xcc,	0x3
	tcs	%icc,	0x0
loop_2983:
	array16	%o7,	%g2,	%i1
	xorcc	%l6,	%l2,	%i6
	taddcc	%o2,	0x01C2,	%i5
	nop
	fitos	%f8,	%f13
	fstox	%f13,	%f30
	fxtos	%f30,	%f8
	movrgez	%i3,	%i0,	%g6
	xnorcc	%l5,	0x1910,	%l1
	movpos	%icc,	%i2,	%g7
	brz	%g5,	loop_2984
	movpos	%xcc,	%o0,	%l0
	movrlz	%g1,	0x29E,	%i7
	set	0x50, %o7
	stwa	%o5,	[%l7 + %o7] 0x0c
loop_2984:
	sllx	%l3,	0x05,	%l4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x89,	%g3,	%o1
	set	0x58, %o5
	swapa	[%l7 + %o5] 0x80,	%o3
	tleu	%xcc,	0x6
	xorcc	%g4,	0x009E,	%i4
	ldsw	[%l7 + 0x4C],	%o6
	edge32ln	%o7,	%o4,	%i1
	xnorcc	%g2,	%l2,	%l6
	fsrc1s	%f26,	%f18
	set	0x7C, %i0
	ldsha	[%l7 + %i0] 0x04,	%o2
	movrlz	%i6,	0x2E7,	%i5
	fmovrsne	%i0,	%f21,	%f12
	sir	0x19F3
	fmovse	%icc,	%f24,	%f28
	movle	%icc,	%i3,	%l5
	ta	%xcc,	0x2
	fabsd	%f10,	%f0
	or	%g6,	0x0C34,	%l1
	sdivcc	%g7,	0x1D15,	%i2
	fbug,a	%fcc1,	loop_2985
	sra	%o0,	0x06,	%g5
	fmovrdgz	%l0,	%f6,	%f22
	tcs	%icc,	0x6
loop_2985:
	movcc	%icc,	%g1,	%o5
	fexpand	%f15,	%f6
	array8	%l3,	%i7,	%l4
	ldsw	[%l7 + 0x48],	%g3
	std	%f20,	[%l7 + 0x40]
	tne	%xcc,	0x7
	faligndata	%f2,	%f18,	%f18
	add	%o1,	%o3,	%g4
	fmovs	%f20,	%f30
	movn	%icc,	%i4,	%o6
	tleu	%icc,	0x2
	tle	%icc,	0x1
	xor	%o4,	%i1,	%g2
	set	0x5A, %i7
	stha	%o7,	[%l7 + %i7] 0x18
	fsrc2	%f6,	%f2
	srax	%l6,	0x1B,	%o2
	or	%l2,	0x1635,	%i5
	te	%xcc,	0x4
	fmovrsgez	%i6,	%f5,	%f15
	fmovspos	%icc,	%f0,	%f1
	prefetch	[%l7 + 0x14],	 0x0
	fble	%fcc3,	loop_2986
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i3,	%i0,	%l5
	fmovsge	%xcc,	%f11,	%f4
loop_2986:
	tsubcctv	%g6,	0x1F6C,	%l1
	tvs	%icc,	0x2
	tvc	%icc,	0x4
	sth	%g7,	[%l7 + 0x2E]
	and	%o0,	0x1E1D,	%g5
	xnorcc	%l0,	%i2,	%g1
	fblg,a	%fcc3,	loop_2987
	edge32l	%l3,	%i7,	%o5
loop_2987:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2813
!	Type x   	: 1251
!	Type cti   	: 2987
!	Type f   	: 4627
!	Type i   	: 13322
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xE20E7CCE
.word 0x49F536EC
.word 0xFEB4B1FB
.word 0xA6C20735
.word 0xD233EF48
.word 0x663CAFD9
.word 0x8C0652DE
.word 0xE2633371
.word 0xE5FDD2B8
.word 0xB05DDD30
.word 0x6556F840
.word 0x557AA9F9
.word 0x855D16CC
.word 0xDF3C0E91
.word 0x9A88298A
.word 0x48D7A5E0
.word 0x28167F35
.word 0x1FA3CD44
.word 0x2E45A84E
.word 0xC7F7BB32
.word 0xFA0C8E2F
.word 0x1F36E081
.word 0x44A11DBE
.word 0x164E0A63
.word 0x3D04724B
.word 0x8419D477
.word 0x255EC217
.word 0xBEACF790
.word 0x68C24804
.word 0x037F60CF
.word 0x680D3B79
.word 0xB93C951A
.word 0x1B95EA3D
.word 0x95195A2B
.word 0xC4E7ABBA
.word 0xFAE93D23
.word 0xB8847D6F
.word 0x370E9BA8
.word 0xEEDC3027
.word 0x457FBD7D
.word 0xD6E29075
.word 0x45F292E1
.word 0x486BF8E5
.word 0xC73BC197
.word 0x34B60630
.word 0xFD48715C
.word 0x9FF20D9B
.word 0x20736BCC
.word 0xCA0DA78D
.word 0x6E063443
.word 0xBF37492C
.word 0xBAA746AE
.word 0x8C791922
.word 0x39FC048E
.word 0xFF0EF685
.word 0x14D2ABAF
.word 0xD61192B2
.word 0x09FB5202
.word 0x2A45A749
.word 0x382994FD
.word 0xB85AEF36
.word 0xDB4C7828
.word 0x633FB6E4
.word 0xFDC786B1
.end
