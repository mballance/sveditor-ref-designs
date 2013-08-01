/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f15.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f15.s,v 1.1 2007/05/11 17:22:26 drp Exp $"
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
	setx	0x635F7077F0687935,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0xF,	%g2
	set	0xD,	%g3
	set	0x8,	%g4
	set	0x1,	%g5
	set	0x6,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x2,	%i0
	set	-0x2,	%i1
	set	-0x2,	%i2
	set	-0x9,	%i3
	set	-0x5,	%i4
	set	-0xA,	%i5
	set	-0xF,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x00B1EDD9,	%l0
	set	0x26596E11,	%l1
	set	0x1BA99AE6,	%l2
	set	0x0C2AFC52,	%l3
	set	0x564334EA,	%l4
	set	0x00D18F9B,	%l5
	set	0x758A75D1,	%l6
	!# Output registers
	set	0x178E,	%o0
	set	-0x1564,	%o1
	set	-0x07F2,	%o2
	set	0x174A,	%o3
	set	-0x027E,	%o4
	set	-0x10ED,	%o5
	set	0x1222,	%o6
	set	-0x0BC8,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA210EBE3DA99B598)
	INIT_TH_FP_REG(%l7,%f2,0x56F8834911058081)
	INIT_TH_FP_REG(%l7,%f4,0x612E53FC91AB1F93)
	INIT_TH_FP_REG(%l7,%f6,0x500D351A57D4F4D8)
	INIT_TH_FP_REG(%l7,%f8,0x5DE295223CB8772D)
	INIT_TH_FP_REG(%l7,%f10,0xD278AEBA6389E60D)
	INIT_TH_FP_REG(%l7,%f12,0x16F8C2D2CFCC5109)
	INIT_TH_FP_REG(%l7,%f14,0x6CCB371DEB792B38)
	INIT_TH_FP_REG(%l7,%f16,0xAC33F84E0F4C3659)
	INIT_TH_FP_REG(%l7,%f18,0xE6A96EF3671470CD)
	INIT_TH_FP_REG(%l7,%f20,0xCFF080A7F831DE19)
	INIT_TH_FP_REG(%l7,%f22,0x8B300F2C7F951627)
	INIT_TH_FP_REG(%l7,%f24,0x7CAFD428B1965CA6)
	INIT_TH_FP_REG(%l7,%f26,0x0C66E47FDD086C30)
	INIT_TH_FP_REG(%l7,%f28,0x002BC8D8F48102B8)
	INIT_TH_FP_REG(%l7,%f30,0x921BA1F04ABDE31A)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x496, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	nop
	set	0x18, %i0
	ldsw	[%l7 + %i0],	%i1
	movl	%icc,	%i0,	%g6
	fmul8x16al	%f26,	%f23,	%f26
	lduw	[%l7 + 0x64],	%o3
	movl	%icc,	%i4,	%o1
	edge16n	%l0,	%g2,	%l6
	fmovrslz	%l2,	%f9,	%f30
	taddcctv	%i5,	0x055C,	%g1
	fpsub32s	%f17,	%f0,	%f25
	tne	%icc,	0x3
	stw	%l1,	[%l7 + 0x48]
	wr	%g0,	0x19,	%asi
	stxa	%g7,	[%l7 + 0x40] %asi
	fmovdle	%xcc,	%f27,	%f5
	fmovsvs	%xcc,	%f28,	%f11
	fpadd32	%f16,	%f0,	%f22
	fxnor	%f20,	%f16,	%f8
	movleu	%xcc,	%o5,	%o0
	movvs	%xcc,	%o7,	%o6
	taddcctv	%g3,	0x00B7,	%g4
	umul	%i6,	0x17E7,	%l3
	tvs	%icc,	0x3
	addc	%l5,	0x16B1,	%o4
	edge8n	%i7,	%o2,	%i3
	movrne	%i2,	%l4,	%i1
	bneg,a,pt	%xcc,	loop_1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i0,	%g6
	alignaddrl	%o3,	%g5,	%i4
loop_1:
	fmovde	%icc,	%f13,	%f2
	movle	%icc,	%l0,	%g2
	and	%o1,	%l6,	%l2
	fmovdgu	%xcc,	%f27,	%f19
	subc	%i5,	%g1,	%g7
	movgu	%icc,	%o5,	%l1
	fblg,a	%fcc2,	loop_2
	array32	%o0,	%o6,	%g3
	nop
	set	0x40, %l5
	prefetch	[%l7 + %l5],	 0x1
	std	%f2,	[%l7 + 0x30]
loop_2:
	stb	%o7,	[%l7 + 0x3D]
	udivcc	%i6,	0x1250,	%g4
	be,a,pt	%icc,	loop_3
	or	%l5,	%l3,	%i7
	alignaddr	%o4,	%i3,	%o2
	std	%f0,	[%l7 + 0x40]
loop_3:
	tne	%icc,	0x0
	fmovdleu	%xcc,	%f12,	%f29
	brnz	%i2,	loop_4
	bneg,a	%icc,	loop_5
	fblg,a	%fcc1,	loop_6
	ldstub	[%l7 + 0x63],	%i1
loop_4:
	xnor	%l4,	0x0C29,	%g6
loop_5:
	ldx	[%l7 + 0x08],	%o3
loop_6:
	tvc	%icc,	0x0
	nop
	fitos	%f5,	%f6
	udiv	%i0,	0x13F5,	%g5
	alignaddrl	%l0,	%i4,	%g2
	fmovdn	%icc,	%f12,	%f5
	movn	%icc,	%l6,	%o1
	sir	0x10E2
	movrlez	%i5,	%g1,	%g7
	tvs	%icc,	0x2
	andncc	%o5,	%l1,	%l2
	taddcctv	%o0,	0x0DA7,	%g3
	ble,pn	%xcc,	loop_7
	edge8	%o6,	%o7,	%i6
	tvs	%icc,	0x1
	edge32ln	%l5,	%g4,	%l3
loop_7:
	stbar
	movre	%o4,	%i3,	%o2
	movl	%icc,	%i2,	%i7
	edge32n	%l4,	%g6,	%i1
	fnot1s	%f22,	%f4
	fnand	%f20,	%f20,	%f10
	xnor	%o3,	0x0123,	%g5
	ta	%icc,	0x0
	subccc	%l0,	%i0,	%g2
	bcs,pt	%xcc,	loop_8
	taddcc	%l6,	%i4,	%o1
	fbue,a	%fcc1,	loop_9
	movrgz	%g1,	%g7,	%o5
loop_8:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%l1
loop_9:
	tpos	%icc,	0x2
	edge16n	%l2,	%g3,	%o0
	array8	%o6,	%o7,	%l5
	movrlez	%g4,	0x22E,	%i6
	fzero	%f20
	alignaddr	%o4,	%l3,	%o2
	fbn,a	%fcc2,	loop_10
	ldsb	[%l7 + 0x60],	%i2
	srax	%i7,	%l4,	%g6
	nop
	setx	0x3C389F11,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x9D44B105,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f26,	%f23
loop_10:
	sethi	0x1230,	%i1
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o3
	sll	%g5,	0x0C,	%l0
	array16	%i3,	%g2,	%i0
	nop
	set	0x70, %i6
	ldd	[%l7 + %i6],	%i6
	tsubcc	%o1,	0x1B1C,	%g1
	membar	0x42
	ldsh	[%l7 + 0x16],	%i4
	ldsw	[%l7 + 0x2C],	%g7
	fzeros	%f31
	srlx	%i5,	%l1,	%o5
	ldstub	[%l7 + 0x60],	%g3
	tleu	%icc,	0x3
	array32	%l2,	%o6,	%o7
	edge16ln	%o0,	%l5,	%g4
	fcmple16	%f16,	%f12,	%i6
	smulcc	%o4,	%o2,	%i2
	fpmerge	%f17,	%f26,	%f12
	nop
	set	0x4C, %l2
	ldsw	[%l7 + %l2],	%l3
	pdist	%f12,	%f28,	%f4
	fmovrslez	%l4,	%f4,	%f30
	tvc	%xcc,	0x5
	andncc	%i7,	%g6,	%i1
	addcc	%o3,	%g5,	%i3
	fmovrdlez	%l0,	%f16,	%f18
	fpsub16	%f30,	%f30,	%f22
	fbuge	%fcc2,	loop_11
	stw	%i0,	[%l7 + 0x68]
	orncc	%g2,	%o1,	%l6
	edge16n	%i4,	%g7,	%i5
loop_11:
	xnor	%g1,	0x06D7,	%o5
	fmul8x16al	%f28,	%f8,	%f6
	array8	%g3,	%l2,	%o6
	lduw	[%l7 + 0x50],	%l1
	array16	%o0,	%l5,	%o7
	move	%xcc,	%i6,	%g4
	bgu,a,pn	%xcc,	loop_12
	bneg,a,pt	%icc,	loop_13
	tcs	%icc,	0x3
	taddcctv	%o2,	0x0848,	%o4
loop_12:
	mulscc	%l3,	%i2,	%l4
loop_13:
	array8	%g6,	%i1,	%o3
	fmovsleu	%icc,	%f22,	%f11
	bcs,a,pn	%icc,	loop_14
	sethi	0x0FC5,	%g5
	nop
	fitos	%f10,	%f22
	fstox	%f22,	%f26
	tle	%icc,	0x6
loop_14:
	edge8ln	%i3,	%l0,	%i0
	smulcc	%g2,	0x02B5,	%i7
	or	%l6,	%o1,	%i4
	edge8n	%i5,	%g7,	%g1
	fnegd	%f24,	%f8
	std	%f26,	[%l7 + 0x20]
	xorcc	%o5,	%l2,	%o6
	nop
	fitos	%f3,	%f17
	fstod	%f17,	%f16
	orn	%g3,	0x00B6,	%l1
	brgz	%l5,	loop_15
	andn	%o0,	%i6,	%o7
	sra	%o2,	%o4,	%l3
	call	loop_16
loop_15:
	fmovrslez	%i2,	%f14,	%f23
	bge,a	loop_17
	sllx	%l4,	0x10,	%g4
loop_16:
	fmovrslz	%g6,	%f15,	%f2
	flush	%l7 + 0x74
loop_17:
	brnz	%o3,	loop_18
	sra	%g5,	0x1E,	%i3
	fmovse	%xcc,	%f1,	%f3
	set	0x1C, %g4
	lduwa	[%l7 + %g4] 0x80,	%l0
loop_18:
	ld	[%l7 + 0x70],	%f0
	ta	%icc,	0x6
	set	0x2A, %o1
	lduha	[%l7 + %o1] 0x18,	%i0
	nop
	setx	0x9662427FC8501FE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f16
	set	0x08, %g3
	ldstuba	[%l7 + %g3] 0x18,	%i1
	movrgez	%g2,	0x319,	%i7
	nop
	setx loop_19, %l0, %l1
	jmpl %l1, %l6
	stw	%i4,	[%l7 + 0x30]
	edge16n	%i5,	%o1,	%g7
	umulcc	%g1,	%l2,	%o6
loop_19:
	movg	%xcc,	%o5,	%g3
	fbug,a	%fcc2,	loop_20
	fmovrdlez	%l5,	%f14,	%f0
	xnorcc	%l1,	0x1A03,	%o0
	sth	%i6,	[%l7 + 0x44]
loop_20:
	movge	%xcc,	%o2,	%o4
	edge16	%o7,	%i2,	%l4
	xnorcc	%g4,	0x1ADC,	%l3
	edge32n	%o3,	%g6,	%g5
	fpsub32	%f14,	%f2,	%f4
	prefetch	[%l7 + 0x3C],	 0x0
	movle	%icc,	%i3,	%l0
	edge8n	%i1,	%g2,	%i7
	popc	%l6,	%i4
	taddcctv	%i5,	%o1,	%i0
	tvs	%icc,	0x1
	movleu	%icc,	%g1,	%g7
	movcs	%xcc,	%l2,	%o6
	udivcc	%g3,	0x0628,	%o5
	fexpand	%f13,	%f2
	sir	0x0FE8
	udiv	%l5,	0x1EAC,	%l1
	nop
	setx	0x3042B2FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	movleu	%xcc,	%o0,	%o2
	mulx	%o4,	0x14E2,	%i6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	fmul8x16	%f27,	%f14,	%f22
	add	%l4,	%i2,	%g4
	brgez	%l3,	loop_21
	movpos	%xcc,	%g6,	%g5
	ldstub	[%l7 + 0x14],	%i3
	add	%o3,	0x068D,	%i1
loop_21:
	mulx	%l0,	0x0532,	%g2
	udivx	%i7,	0x0C57,	%i4
	fmovrse	%l6,	%f26,	%f16
	tsubcctv	%o1,	0x0D5E,	%i5
	subc	%g1,	%i0,	%l2
	subc	%o6,	%g3,	%g7
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x04,	%o4
	stw	%l1,	[%l7 + 0x08]
	set	0x2C, %g6
	lda	[%l7 + %g6] 0x10,	%f26
	ldd	[%l7 + 0x50],	%f12
	tvc	%xcc,	0x3
	movn	%xcc,	%l5,	%o2
	array8	%o4,	%i6,	%o7
	fbne,a	%fcc3,	loop_22
	movn	%icc,	%o0,	%i2
	wr	%g0,	0x89,	%asi
	stwa	%g4,	[%l7 + 0x68] %asi
loop_22:
	srax	%l4,	%l3,	%g6
	sub	%i3,	%o3,	%g5
	movneg	%icc,	%i1,	%g2
	fandnot1	%f12,	%f22,	%f30
	ba,a,pt	%icc,	loop_23
	srlx	%l0,	%i7,	%l6
	fmovscc	%xcc,	%f19,	%f17
	sdivx	%o1,	0x1A13,	%i4
loop_23:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i5
	or	%g1,	0x0ADE,	%l2
	fmovdne	%xcc,	%f9,	%f20
	sdivx	%i0,	0x1D82,	%o6
	bcc	%xcc,	loop_24
	fmovsn	%xcc,	%f23,	%f26
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x81
loop_24:
	sir	0x179A
	tsubcctv	%g3,	%o5,	%l1
	popc	%l5,	%g7
	fmovdle	%xcc,	%f29,	%f1
	fmul8x16	%f26,	%f22,	%f8
	fbuge	%fcc3,	loop_25
	lduw	[%l7 + 0x3C],	%o2
	sethi	0x13CB,	%o4
	fmovrdgz	%o7,	%f22,	%f12
loop_25:
	udivx	%o0,	0x0E62,	%i6
	mova	%icc,	%i2,	%g4
	set	0x28, %o4
	lduha	[%l7 + %o4] 0x81,	%l3
	movleu	%xcc,	%g6,	%i3
	edge16	%o3,	%l4,	%g5
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x15,	 0x3
	fmovd	%f22,	%f6
	nop
	set	0x48, %l1
	ldx	[%l7 + %l1],	%l0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x60] %asi,	%g2
	fandnot2	%f0,	%f20,	%f16
	nop
	setx	0x506E1746,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	movrgez	%i7,	%o1,	%i4
	udiv	%i5,	0x1DF2,	%g1
	fones	%f1
	set	0x24, %o6
	sta	%f20,	[%l7 + %o6] 0x0c
	movleu	%xcc,	%l2,	%l6
	nop
	setx	loop_26,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcs,a,pn	%icc,	loop_27
	tneg	%icc,	0x3
	te	%icc,	0x1
loop_26:
	tsubcc	%o6,	0x029F,	%i0
loop_27:
	xnorcc	%o5,	%g3,	%l5
	bn,a,pt	%icc,	loop_28
	ba	loop_29
	tgu	%xcc,	0x1
	fmul8x16au	%f9,	%f11,	%f30
loop_28:
	popc	0x0059,	%l1
loop_29:
	xorcc	%o2,	0x1241,	%g7
	nop
	set	0x5D, %l6
	ldub	[%l7 + %l6],	%o7
	fcmpne16	%f2,	%f18,	%o4
	ldsw	[%l7 + 0x24],	%o0
	fnors	%f22,	%f23,	%f27
	nop
	fitos	%f7,	%f15
	fstox	%f15,	%f2
	fxtos	%f2,	%f2
	wr	%g0,	0xe3,	%asi
	stba	%i2,	[%l7 + 0x6A] %asi
	membar	#Sync
	udiv	%i6,	0x06E5,	%g4
	add	%g6,	%i3,	%o3
	movrlz	%l3,	0x0FC,	%l4
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
	fmuld8ulx16	%f8,	%f14,	%f0
	brgz,a	%g5,	loop_30
	brz,a	%l0,	loop_31
	movneg	%icc,	%i7,	%o1
	fmovrsgz	%g2,	%f16,	%f21
loop_30:
	udiv	%i4,	0x102B,	%g1
loop_31:
	fmovdl	%xcc,	%f17,	%f8
	brgz	%i5,	loop_32
	addcc	%l2,	%o6,	%l6
	alignaddr	%o5,	%g3,	%i0
	edge8	%l5,	%l1,	%g7
loop_32:
	brgez,a	%o7,	loop_33
	ldsh	[%l7 + 0x5E],	%o4
	sir	0x0746
	bne,pt	%xcc,	loop_34
loop_33:
	fmovrde	%o2,	%f30,	%f30
	membar	0x6A
	edge32n	%o0,	%i2,	%g4
loop_34:
	sra	%i6,	0x0C,	%g6
	fbuge,a	%fcc3,	loop_35
	tl	%icc,	0x1
	sir	0x0C68
	fbl,a	%fcc0,	loop_36
loop_35:
	ldub	[%l7 + 0x75],	%o3
	andcc	%i3,	0x0FD1,	%l3
	movcs	%icc,	%l4,	%g5
loop_36:
	subccc	%i1,	%l0,	%i7
	edge32ln	%o1,	%i4,	%g2
	movrlz	%g1,	%l2,	%i5
	add	%o6,	%o5,	%g3
	xorcc	%l6,	0x0EAD,	%i0
	movcs	%xcc,	%l1,	%g7
	orn	%o7,	%o4,	%o2
	flush	%l7 + 0x60
	brlez	%l5,	loop_37
	std	%f0,	[%l7 + 0x30]
	ta	%icc,	0x5
	stbar
loop_37:
	tsubcctv	%o0,	0x187A,	%g4
	set	0x14, %i3
	ldswa	[%l7 + %i3] 0x11,	%i2
	tsubcc	%g6,	%i6,	%i3
	fmovspos	%icc,	%f11,	%f30
	bshuffle	%f26,	%f22,	%f28
	udiv	%l3,	0x01D5,	%o3
	movne	%icc,	%g5,	%l4
	tsubcc	%i1,	%i7,	%o1
	tne	%icc,	0x5
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f30
	fxtod	%f30,	%f10
	swap	[%l7 + 0x64],	%i4
	fnors	%f0,	%f11,	%f1
	fbue	%fcc2,	loop_38
	ldub	[%l7 + 0x58],	%l0
	sth	%g1,	[%l7 + 0x32]
	fbe	%fcc0,	loop_39
loop_38:
	fandnot2s	%f14,	%f17,	%f8
	srl	%g2,	0x04,	%l2
	orcc	%i5,	0x138B,	%o5
loop_39:
	tcs	%xcc,	0x2
	movne	%xcc,	%o6,	%g3
	bne,a	%xcc,	loop_40
	brgez	%l6,	loop_41
	andn	%l1,	%g7,	%o7
	set	0x60, %l3
	prefetcha	[%l7 + %l3] 0x10,	 0x0
loop_40:
	ld	[%l7 + 0x78],	%f12
loop_41:
	ble,a	%xcc,	loop_42
	fpadd32s	%f1,	%f30,	%f20
	orcc	%i0,	%o2,	%o0
	fbule	%fcc0,	loop_43
loop_42:
	ba,pt	%xcc,	loop_44
	edge8	%l5,	%i2,	%g4
	tvc	%xcc,	0x5
loop_43:
	subc	%i6,	%i3,	%g6
loop_44:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x60] %asi,	%f1
	bne,a	%xcc,	loop_45
	udivx	%l3,	0x0C3A,	%g5
	edge16	%l4,	%o3,	%i7
	ldsb	[%l7 + 0x44],	%o1
loop_45:
	xor	%i1,	%i4,	%l0
	sub	%g2,	%l2,	%i5
	fcmple32	%f24,	%f20,	%g1
	te	%xcc,	0x0
	std	%f22,	[%l7 + 0x38]
	nop
	setx	loop_46,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpsub16	%f26,	%f14,	%f30
	ldsh	[%l7 + 0x56],	%o5
	fmovsl	%xcc,	%f13,	%f30
loop_46:
	tgu	%xcc,	0x7
	tle	%icc,	0x6
	nop
	setx	0x028C624E697D1359,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xD98515AB46310783,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f4,	%f6
	movneg	%xcc,	%g3,	%l6
	fmovrdlz	%l1,	%f22,	%f24
	xnorcc	%o6,	0x1C57,	%o7
	movle	%icc,	%o4,	%g7
	sdiv	%i0,	0x0C79,	%o2
	fandnot1s	%f13,	%f31,	%f15
	fmovsle	%xcc,	%f16,	%f27
	ldsh	[%l7 + 0x7A],	%o0
	mulscc	%i2,	0x1074,	%g4
	fmovde	%xcc,	%f18,	%f16
	lduw	[%l7 + 0x50],	%i6
	nop
	fitod	%f8,	%f2
	fdtox	%f2,	%f28
	edge32l	%i3,	%g6,	%l5
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf1
	membar	#Sync
	umulcc	%l3,	%g5,	%l4
	fbue	%fcc3,	loop_47
	smul	%o3,	%o1,	%i7
	movrlz	%i4,	%i1,	%g2
	stbar
loop_47:
	stx	%l2,	[%l7 + 0x10]
	set	0x69, %i7
	ldsba	[%l7 + %i7] 0x18,	%i5
	movrlz	%g1,	%l0,	%g3
	movg	%icc,	%o5,	%l6
	nop
	setx	0xD6BBBC35,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xD5A87ACE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f23,	%f24
	movl	%xcc,	%l1,	%o6
	movne	%icc,	%o7,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%o2
	edge32n	%o0,	%i0,	%i2
	fpsub32	%f6,	%f24,	%f12
	movvs	%icc,	%g4,	%i6
	movrgez	%i3,	0x3CC,	%g6
	add	%l5,	0x037B,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a	%xcc,	loop_48
	subc	%l4,	0x072B,	%o3
	sir	0x0297
	call	loop_49
loop_48:
	srlx	%g5,	%i7,	%o1
	edge16ln	%i4,	%g2,	%i1
	fmovdge	%icc,	%f18,	%f28
loop_49:
	tsubcc	%l2,	0x099A,	%i5
	sethi	0x0DF7,	%g1
	addccc	%g3,	0x0C43,	%l0
	edge32	%o5,	%l1,	%o6
	fmovdcs	%icc,	%f1,	%f18
	srl	%o7,	0x1C,	%o4
	sll	%l6,	0x1F,	%o2
	tge	%xcc,	0x5
	nop
	fitos	%f18,	%f0
	fmovsvc	%xcc,	%f25,	%f12
	tsubcctv	%o0,	%i0,	%g7
	fnor	%f26,	%f8,	%f16
	addcc	%i2,	0x0F7A,	%g4
	fnegd	%f0,	%f10
	nop
	set	0x30, %g1
	ldx	[%l7 + %g1],	%i3
	fpack16	%f0,	%f27
	ta	%xcc,	0x2
	fcmpeq16	%f12,	%f16,	%i6
	srl	%l5,	%l3,	%g6
	fblg	%fcc0,	loop_50
	alignaddr	%o3,	%g5,	%i7
	edge8n	%l4,	%o1,	%i4
	and	%g2,	%l2,	%i1
loop_50:
	tvc	%icc,	0x3
	nop
	setx	0x3471FC794060AECD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	mova	%icc,	%g1,	%i5
	tge	%icc,	0x2
	sdiv	%l0,	0x1F9B,	%g3
	tcs	%xcc,	0x7
	fnot1s	%f27,	%f8
	sra	%l1,	%o5,	%o6
	fmovsg	%icc,	%f18,	%f28
	bvs,pn	%xcc,	loop_51
	fmovsgu	%xcc,	%f22,	%f4
	movneg	%icc,	%o4,	%l6
	movrlz	%o2,	0x257,	%o7
loop_51:
	edge8	%i0,	%o0,	%i2
	fabsd	%f18,	%f8
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x48] %asi,	%g4
	popc	0x1B02,	%i3
	umul	%i6,	%l5,	%g7
	tcs	%icc,	0x7
	edge8l	%l3,	%g6,	%g5
	edge8n	%i7,	%o3,	%l4
	fpadd32s	%f9,	%f3,	%f8
	fmul8sux16	%f26,	%f6,	%f18
	edge16n	%o1,	%i4,	%g2
	nop
	setx	0x3049A1D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	fmovsgu	%icc,	%f2,	%f24
	array16	%l2,	%i1,	%g1
	udiv	%i5,	0x082B,	%l0
	edge32ln	%l1,	%g3,	%o6
	fble	%fcc1,	loop_52
	edge32n	%o5,	%l6,	%o4
	smul	%o7,	0x0BE7,	%o2
	tg	%icc,	0x7
loop_52:
	edge16	%i0,	%o0,	%i2
	movne	%icc,	%g4,	%i6
	movn	%icc,	%l5,	%i3
	lduw	[%l7 + 0x28],	%g7
	srax	%g6,	%g5,	%l3
	fmovsgu	%icc,	%f31,	%f31
	orcc	%i7,	%l4,	%o1
	andcc	%i4,	%g2,	%l2
	te	%icc,	0x2
	be,a,pt	%icc,	loop_53
	tpos	%xcc,	0x4
	stw	%o3,	[%l7 + 0x78]
	fmovscs	%xcc,	%f3,	%f3
loop_53:
	nop
	set	0x72, %g5
	stha	%i1,	[%l7 + %g5] 0x88
	nop
	setx loop_54, %l0, %l1
	jmpl %l1, %i5
	tn	%xcc,	0x7
	srax	%l0,	0x1E,	%l1
	edge16ln	%g3,	%g1,	%o6
loop_54:
	membar	0x1F
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fornot2s	%f12,	%f0,	%f24
	stb	%l6,	[%l7 + 0x21]
	sdiv	%o5,	0x15C1,	%o7
	brnz	%o4,	loop_55
	ba,a,pt	%xcc,	loop_56
	movrgz	%i0,	0x344,	%o2
	tne	%icc,	0x5
loop_55:
	ble	%icc,	loop_57
loop_56:
	and	%o0,	%i2,	%i6
	lduw	[%l7 + 0x58],	%g4
	edge32	%l5,	%g7,	%g6
loop_57:
	array32	%i3,	%l3,	%i7
	array8	%l4,	%o1,	%i4
	tcs	%icc,	0x3
	andcc	%g5,	0x1C94,	%g2
	umulcc	%l2,	%i1,	%o3
	tne	%xcc,	0x1
	smul	%l0,	0x0879,	%l1
	fmovsne	%xcc,	%f4,	%f20
	fbu	%fcc0,	loop_58
	edge16	%i5,	%g3,	%o6
	bne,a,pt	%icc,	loop_59
	or	%g1,	%l6,	%o5
loop_58:
	nop
	set	0x38, %g7
	prefetcha	[%l7 + %g7] 0x15,	 0x0
loop_59:
	tpos	%xcc,	0x4
	ba,a	loop_60
	mova	%xcc,	%i0,	%o2
	smul	%o4,	0x1946,	%i2
	srax	%o0,	%i6,	%l5
loop_60:
	fmovdcs	%icc,	%f22,	%f24
	ba,a,pn	%icc,	loop_61
	call	loop_62
	stb	%g4,	[%l7 + 0x63]
	xorcc	%g6,	0x0477,	%g7
loop_61:
	fsrc2s	%f29,	%f18
loop_62:
	brnz	%l3,	loop_63
	brlez,a	%i7,	loop_64
	ldd	[%l7 + 0x40],	%i2
	popc	0x1944,	%l4
loop_63:
	movl	%icc,	%o1,	%g5
loop_64:
	nop
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	addccc	%i4,	0x1501,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%xcc,	%f3,	%f5
	edge32	%i1,	%o3,	%l2
	ldsb	[%l7 + 0x4D],	%l0
	tcs	%icc,	0x7
	addc	%i5,	%g3,	%l1
	set	0x30, %g2
	sta	%f3,	[%l7 + %g2] 0x19
	movcc	%xcc,	%g1,	%l6
	set	0x42, %i1
	ldsha	[%l7 + %i1] 0x04,	%o6
	nop
	setx	0x150207BE31CD5BA8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xDBC585516ADDA314,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f26,	%f2
	tl	%xcc,	0x2
	brz,a	%o5,	loop_65
	subc	%o7,	%o2,	%i0
	stbar
	srax	%i2,	0x12,	%o4
loop_65:
	subccc	%o0,	%l5,	%g4
	be	%icc,	loop_66
	fble,a	%fcc0,	loop_67
	tcs	%icc,	0x4
	stw	%i6,	[%l7 + 0x70]
loop_66:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g7
loop_67:
	srax	%l3,	%g6,	%i7
	fbn,a	%fcc2,	loop_68
	movneg	%xcc,	%i3,	%o1
	fbo	%fcc2,	loop_69
	fnot2	%f10,	%f10
loop_68:
	array32	%l4,	%g5,	%i4
	movpos	%xcc,	%i1,	%g2
loop_69:
	movpos	%icc,	%o3,	%l0
	sllx	%i5,	%g3,	%l2
	bl	loop_70
	nop
	setx	0xA06E6C92,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	nop
	setx	loop_71,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0xF809764D382254AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x03D83B7C765C6C5F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f4,	%f8
loop_70:
	fbu	%fcc2,	loop_72
	tsubcc	%g1,	0x1BFC,	%l6
loop_71:
	srax	%o6,	%o5,	%o7
	or	%l1,	0x133C,	%o2
loop_72:
	tle	%xcc,	0x7
	fpackfix	%f26,	%f13
	lduw	[%l7 + 0x08],	%i0
	bne,pn	%icc,	loop_73
	fblg	%fcc3,	loop_74
	sdivcc	%o4,	0x0237,	%o0
	membar	0x57
loop_73:
	fnor	%f22,	%f26,	%f10
loop_74:
	movge	%icc,	%l5,	%i2
	fcmpeq32	%f22,	%f24,	%i6
	fandnot1	%f6,	%f22,	%f22
	fbg	%fcc0,	loop_75
	fone	%f0
	nop
	fitos	%f8,	%f15
	fstox	%f15,	%f20
	fxtos	%f20,	%f23
	fmovscs	%xcc,	%f22,	%f9
loop_75:
	movvc	%icc,	%g7,	%g4
	ldx	[%l7 + 0x50],	%g6
	ldd	[%l7 + 0x78],	%f8
	taddcctv	%i7,	%i3,	%l3
	nop
	fitos	%f5,	%f9
	fstoi	%f9,	%f19
	umulcc	%o1,	%l4,	%i4
	fmovdle	%xcc,	%f8,	%f27
	lduh	[%l7 + 0x0C],	%i1
	fmovrde	%g5,	%f6,	%f26
	movle	%xcc,	%o3,	%g2
	srax	%i5,	0x0F,	%g3
	movvs	%xcc,	%l2,	%g1
	movleu	%xcc,	%l6,	%o6
	taddcc	%l0,	%o5,	%o7
	fbne,a	%fcc1,	loop_76
	bneg,a	%xcc,	loop_77
	stbar
	andcc	%l1,	%o2,	%o4
loop_76:
	or	%o0,	%l5,	%i2
loop_77:
	fandnot2s	%f6,	%f30,	%f16
	fand	%f10,	%f16,	%f10
	edge32ln	%i0,	%g7,	%g4
	andn	%g6,	%i7,	%i3
	fmuld8sux16	%f19,	%f13,	%f10
	edge32n	%i6,	%l3,	%o1
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tpos	%xcc,	0x0
	edge32	%i4,	%l4,	%i1
	add	%o3,	%g2,	%i5
	udivcc	%g3,	0x03C9,	%g5
	tl	%icc,	0x2
	stbar
	movle	%xcc,	%g1,	%l2
	fmovrse	%o6,	%f17,	%f29
	brlez,a	%l6,	loop_78
	tcs	%xcc,	0x7
	move	%xcc,	%o5,	%o7
	fcmpgt16	%f2,	%f16,	%l1
loop_78:
	fmovrdlez	%o2,	%f10,	%f14
	ldx	[%l7 + 0x20],	%o4
	tleu	%icc,	0x1
	fbo,a	%fcc1,	loop_79
	nop
	setx	0xECDF0B08,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x5E185D57,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f2,	%f6
	fxor	%f24,	%f22,	%f22
	tvc	%icc,	0x6
loop_79:
	fmovd	%f26,	%f18
	te	%xcc,	0x7
	edge32n	%l0,	%l5,	%o0
	fpackfix	%f20,	%f24
	addccc	%i0,	0x0A19,	%g7
	stbar
	add	%g4,	0x09B1,	%g6
	fmuld8sux16	%f24,	%f27,	%f10
	tcs	%icc,	0x4
	mulscc	%i7,	%i3,	%i6
	brlez	%l3,	loop_80
	te	%xcc,	0x2
	fmovdgu	%xcc,	%f26,	%f24
	nop
	setx	0xFBA8A66C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f28
loop_80:
	lduw	[%l7 + 0x18],	%i2
	fpsub16s	%f20,	%f13,	%f28
	tvc	%xcc,	0x3
	edge32n	%i4,	%o1,	%l4
	sdivx	%o3,	0x183B,	%i1
	edge32	%g2,	%g3,	%i5
	fmuld8sux16	%f13,	%f0,	%f8
	fba,a	%fcc1,	loop_81
	fba,a	%fcc2,	loop_82
	fcmpeq32	%f12,	%f8,	%g1
	edge8	%l2,	%g5,	%l6
loop_81:
	movrlz	%o6,	0x112,	%o7
loop_82:
	movvs	%icc,	%o5,	%l1
	tcc	%xcc,	0x3
	stw	%o2,	[%l7 + 0x38]
	fbug,a	%fcc3,	loop_83
	alignaddrl	%o4,	%l5,	%l0
	movneg	%icc,	%o0,	%g7
	edge8ln	%i0,	%g6,	%g4
loop_83:
	mulscc	%i3,	0x1584,	%i6
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f6
	fxtod	%f6,	%f6
	andn	%l3,	%i2,	%i4
	orcc	%i7,	0x1C9D,	%o1
	fmovdn	%xcc,	%f21,	%f26
	edge16n	%l4,	%o3,	%i1
	fcmpeq32	%f8,	%f2,	%g2
	udivx	%g3,	0x0EBD,	%g1
	set	0x7C, %o3
	ldsba	[%l7 + %o3] 0x88,	%i5
	fmovsleu	%icc,	%f5,	%f28
	bgu,a	%icc,	loop_84
	smulcc	%g5,	0x0CDB,	%l2
	nop
	fitos	%f1,	%f12
	fstoi	%f12,	%f10
	tsubcc	%o6,	0x0BBE,	%l6
loop_84:
	umulcc	%o7,	%l1,	%o2
	fmovsleu	%icc,	%f5,	%f9
	stw	%o5,	[%l7 + 0x08]
	edge16ln	%o4,	%l0,	%l5
	tleu	%xcc,	0x1
	edge32	%g7,	%o0,	%i0
	movg	%icc,	%g4,	%g6
	alignaddr	%i6,	%i3,	%i2
	stbar
	srl	%l3,	0x12,	%i4
	tl	%xcc,	0x4
	fbe,a	%fcc2,	loop_85
	addccc	%i7,	0x069E,	%o1
	ld	[%l7 + 0x78],	%f15
	addc	%l4,	0x1B24,	%o3
loop_85:
	edge32ln	%g2,	%g3,	%g1
	subccc	%i5,	%g5,	%l2
	fandnot1	%f22,	%f6,	%f8
	mulscc	%i1,	%o6,	%o7
	te	%xcc,	0x3
	fmovrde	%l1,	%f22,	%f26
	movrne	%l6,	0x1F8,	%o2
	bn,pn	%icc,	loop_86
	movgu	%xcc,	%o4,	%l0
	stbar
	set	0x2D, %i4
	ldstuba	[%l7 + %i4] 0x18,	%l5
loop_86:
	movge	%icc,	%g7,	%o0
	movcs	%icc,	%o5,	%i0
	tpos	%xcc,	0x2
	tsubcctv	%g4,	%i6,	%g6
	fxnor	%f22,	%f20,	%f22
	tge	%xcc,	0x3
	bl,a	loop_87
	fabss	%f7,	%f15
	fmovda	%xcc,	%f24,	%f4
	movg	%xcc,	%i3,	%l3
loop_87:
	mulx	%i4,	0x02B4,	%i2
	bn	loop_88
	nop
	set	0x71, %o0
	ldsb	[%l7 + %o0],	%o1
	subc	%i7,	0x0D0C,	%l4
	stb	%o3,	[%l7 + 0x08]
loop_88:
	xnorcc	%g2,	0x0E64,	%g3
	orncc	%g1,	%g5,	%i5
	subccc	%i1,	%l2,	%o7
	fnor	%f18,	%f16,	%f22
	edge32l	%l1,	%o6,	%l6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x54] %asi,	%o4
	sdivcc	%l0,	0x0C7C,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f8,	%f9
	fstox	%f9,	%f18
	movrgez	%g7,	%l5,	%o5
	movg	%icc,	%o0,	%i0
	edge32l	%i6,	%g4,	%i3
	array8	%g6,	%l3,	%i2
	edge16n	%o1,	%i4,	%i7
	fornot1s	%f13,	%f18,	%f10
	edge32n	%l4,	%g2,	%g3
	movneg	%xcc,	%g1,	%g5
	edge16ln	%o3,	%i5,	%i1
	or	%l2,	0x1840,	%o7
	edge16ln	%o6,	%l6,	%l1
	ld	[%l7 + 0x70],	%f15
	edge16l	%l0,	%o4,	%o2
	std	%f14,	[%l7 + 0x70]
	movpos	%xcc,	%l5,	%o5
	sllx	%g7,	%i0,	%i6
	brgz	%o0,	loop_89
	orn	%g4,	%i3,	%l3
	ba,a,pt	%xcc,	loop_90
	nop
	setx	loop_91,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_89:
	bvc,pt	%xcc,	loop_92
	membar	0x79
loop_90:
	fmovsg	%xcc,	%f27,	%f18
loop_91:
	fnands	%f24,	%f4,	%f10
loop_92:
	fba,a	%fcc1,	loop_93
	subc	%i2,	0x1AB5,	%o1
	fbo,a	%fcc3,	loop_94
	movrlez	%g6,	0x1A2,	%i4
loop_93:
	fxors	%f4,	%f10,	%f10
	set	0x4C, %l0
	stha	%l4,	[%l7 + %l0] 0xe3
	membar	#Sync
loop_94:
	array16	%g2,	%i7,	%g1
	movpos	%xcc,	%g5,	%g3
	movge	%icc,	%i5,	%o3
	tl	%xcc,	0x1
	tvs	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l2,	0x031,	%i1
	umulcc	%o6,	%o7,	%l1
	srax	%l6,	%o4,	%o2
	nop
	setx	0xD918ADC300614568,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movvs	%icc,	%l0,	%l5
	and	%g7,	%i0,	%o5
	fbl,a	%fcc2,	loop_95
	fnegd	%f0,	%f10
	prefetch	[%l7 + 0x6C],	 0x2
	nop
	setx	0xC043E774,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
loop_95:
	orncc	%o0,	%g4,	%i6
	set	0x70, %o2
	ldda	[%l7 + %o2] 0xe2,	%i2
	andn	%l3,	0x03C0,	%i2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o1,	%g6
	ldx	[%l7 + 0x20],	%l4
	popc	0x07A1,	%i4
	brnz	%i7,	loop_96
	taddcctv	%g1,	0x1917,	%g5
	movneg	%icc,	%g2,	%i5
	sdivcc	%g3,	0x00C7,	%l2
loop_96:
	subccc	%o3,	%i1,	%o6
	or	%l1,	%l6,	%o4
	bne,a	loop_97
	fornot2s	%f31,	%f2,	%f13
	taddcctv	%o7,	0x1BC9,	%o2
	movvc	%icc,	%l0,	%l5
loop_97:
	tsubcc	%g7,	0x16ED,	%i0
	bl,pn	%icc,	loop_98
	movvc	%xcc,	%o5,	%o0
	fmovdneg	%xcc,	%f3,	%f2
	sir	0x08C2
loop_98:
	sll	%i6,	%g4,	%l3
	sdiv	%i2,	0x0E9D,	%i3
	bl,pt	%icc,	loop_99
	add	%g6,	%o1,	%l4
	umul	%i4,	%i7,	%g1
	movleu	%xcc,	%g5,	%g2
loop_99:
	movg	%icc,	%g3,	%l2
	sethi	0x0242,	%o3
	tneg	%xcc,	0x2
	fcmple32	%f0,	%f12,	%i5
	movg	%xcc,	%i1,	%l1
	movleu	%icc,	%o6,	%l6
	tleu	%xcc,	0x3
	orcc	%o7,	%o2,	%o4
	edge8n	%l0,	%g7,	%l5
	bl,a	loop_100
	movrlz	%i0,	0x1AD,	%o0
	mulscc	%o5,	%i6,	%g4
	nop
	setx	0x95BF64C8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x9AED2C06,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f16,	%f8
loop_100:
	bcc,a	loop_101
	umul	%l3,	%i2,	%i3
	fsrc2s	%f4,	%f26
	nop
	setx	loop_102,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_101:
	fmovdvc	%xcc,	%f23,	%f13
	nop
	setx	0xB9E68234,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x697F7D39,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f6,	%f24
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o1
loop_102:
	stw	%l4,	[%l7 + 0x14]
	set	0x3C, %i2
	ldswa	[%l7 + %i2] 0x80,	%i4
	edge16l	%i7,	%g1,	%g6
	movrgez	%g2,	0x29B,	%g3
	or	%l2,	0x153C,	%o3
	membar	0x4F
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%g5
	fmovsl	%icc,	%f10,	%f31
	sllx	%i5,	%l1,	%o6
	popc	%i1,	%o7
	fmovscs	%icc,	%f27,	%f29
	bvc	loop_103
	fbule,a	%fcc2,	loop_104
	bgu,pt	%icc,	loop_105
	fmovrsne	%l6,	%f23,	%f5
loop_103:
	edge16	%o2,	%o4,	%g7
loop_104:
	sethi	0x06E3,	%l0
loop_105:
	brz	%i0,	loop_106
	udiv	%l5,	0x161C,	%o5
	fmovrdgez	%o0,	%f12,	%f14
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x70] %asi,	%i6
loop_106:
	fand	%f12,	%f30,	%f20
	fmovsl	%xcc,	%f21,	%f11
	addcc	%l3,	0x062C,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,pt	%xcc,	loop_107
	fpsub32s	%f9,	%f5,	%f29
	fpsub32	%f12,	%f6,	%f10
	tleu	%xcc,	0x5
loop_107:
	fabsd	%f26,	%f22
	movne	%xcc,	%i3,	%g4
	nop
	setx loop_108, %l0, %l1
	jmpl %l1, %l4
	edge32ln	%o1,	%i7,	%g1
	fandnot2s	%f0,	%f2,	%f23
	alignaddr	%i4,	%g6,	%g2
loop_108:
	mova	%xcc,	%g3,	%l2
	fbl	%fcc3,	loop_109
	fand	%f18,	%f28,	%f2
	edge8n	%o3,	%g5,	%l1
	brlz,a	%i5,	loop_110
loop_109:
	fmovda	%icc,	%f15,	%f7
	andncc	%i1,	%o6,	%l6
	movrne	%o7,	%o4,	%o2
loop_110:
	nop
	setx	0x866258EBC45CBE7F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f26
	bleu,a,pt	%icc,	loop_111
	andn	%l0,	0x125D,	%g7
	and	%l5,	0x0EED,	%i0
	fbu,a	%fcc1,	loop_112
loop_111:
	fxor	%f12,	%f26,	%f4
	move	%xcc,	%o5,	%i6
	nop
	setx loop_113, %l0, %l1
	jmpl %l1, %o0
loop_112:
	brgez	%i2,	loop_114
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f0,	%f16
loop_113:
	movvc	%xcc,	%l3,	%i3
loop_114:
	sdivcc	%g4,	0x077F,	%l4
	orcc	%i7,	%o1,	%i4
	bvs,a,pt	%xcc,	loop_115
	nop
	setx	0x8056710D,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	tsubcctv	%g1,	%g2,	%g6
	udivcc	%l2,	0x0693,	%g3
loop_115:
	edge32l	%g5,	%l1,	%i5
	taddcctv	%i1,	0x0659,	%o6
	bgu	loop_116
	brgez,a	%l6,	loop_117
	stx	%o7,	[%l7 + 0x68]
	movg	%icc,	%o3,	%o4
loop_116:
	tl	%xcc,	0x5
loop_117:
	tn	%icc,	0x3
	array32	%o2,	%l0,	%g7
	movrne	%i0,	0x3BE,	%o5
	fpadd32	%f2,	%f28,	%f4
	fmovdge	%xcc,	%f11,	%f17
	edge32n	%i6,	%o0,	%l5
	movrgez	%l3,	%i2,	%g4
	fmovrdne	%i3,	%f10,	%f6
	movrlz	%i7,	%o1,	%i4
	fzeros	%f18
	brnz	%g1,	loop_118
	bvc,a	loop_119
	smulcc	%l4,	0x0255,	%g2
	fmovrdgez	%g6,	%f14,	%f16
loop_118:
	movne	%xcc,	%l2,	%g3
loop_119:
	movrgz	%g5,	%l1,	%i5
	addcc	%i1,	0x1171,	%l6
	movre	%o7,	%o3,	%o4
	edge32	%o2,	%l0,	%o6
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x78] %asi,	%f14
	edge16n	%i0,	%g7,	%o5
	tn	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	stwa	%o0,	[%l7 + 0x7C] %asi
	fpmerge	%f1,	%f14,	%f24
	array32	%i6,	%l5,	%l3
	xor	%i2,	0x0543,	%i3
	fmovdle	%icc,	%f3,	%f4
	set	0x38, %l5
	stxa	%g4,	[%l7 + %l5] 0x2b
	membar	#Sync
	fbuge,a	%fcc3,	loop_120
	movneg	%xcc,	%i7,	%o1
	movne	%xcc,	%g1,	%l4
	orcc	%g2,	0x06A2,	%g6
loop_120:
	andn	%l2,	%g3,	%i4
	bg,a	%xcc,	loop_121
	fmul8x16au	%f13,	%f20,	%f4
	subccc	%l1,	0x0F52,	%g5
	lduw	[%l7 + 0x44],	%i5
loop_121:
	smulcc	%l6,	0x0F04,	%o7
	sir	0x1DAA
	movneg	%xcc,	%o3,	%o4
	sth	%i1,	[%l7 + 0x12]
	lduw	[%l7 + 0x3C],	%o2
	fmovdleu	%icc,	%f10,	%f9
	call	loop_122
	fmovsa	%xcc,	%f11,	%f28
	ld	[%l7 + 0x78],	%f20
	fpadd32	%f4,	%f20,	%f4
loop_122:
	sdivcc	%o6,	0x0A80,	%i0
	fpsub32s	%f30,	%f0,	%f25
	fmul8x16	%f23,	%f6,	%f16
	bl,pn	%icc,	loop_123
	edge16n	%l0,	%o5,	%o0
	tne	%xcc,	0x2
	lduw	[%l7 + 0x7C],	%g7
loop_123:
	subccc	%l5,	%i6,	%l3
	srax	%i3,	%g4,	%i2
	sdivcc	%o1,	0x1F9A,	%g1
	movrgez	%i7,	0x325,	%g2
	ta	%icc,	0x5
	fpadd32	%f24,	%f16,	%f28
	tcc	%icc,	0x6
	nop
	setx	loop_124,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16ln	%l4,	%g6,	%g3
	movgu	%icc,	%i4,	%l1
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l2
loop_124:
	brgz,a	%i5,	loop_125
	tn	%icc,	0x7
	bneg,a,pt	%xcc,	loop_126
	bn,a	%xcc,	loop_127
loop_125:
	movgu	%icc,	%g5,	%o7
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x13] %asi,	%o3
loop_126:
	movn	%icc,	%o4,	%i1
loop_127:
	ble,a	%xcc,	loop_128
	fmovdg	%icc,	%f24,	%f1
	nop
	setx loop_129, %l0, %l1
	jmpl %l1, %l6
	fandnot1	%f24,	%f12,	%f4
loop_128:
	fmovda	%icc,	%f17,	%f4
	fxor	%f16,	%f4,	%f30
loop_129:
	andcc	%o6,	0x0329,	%o2
	prefetch	[%l7 + 0x34],	 0x3
	subcc	%i0,	%o5,	%o0
	movcs	%icc,	%l0,	%l5
	fors	%f29,	%f8,	%f17
	sub	%i6,	%g7,	%i3
	xnorcc	%g4,	%i2,	%o1
	edge8l	%g1,	%l3,	%g2
	tcc	%xcc,	0x2
	for	%f28,	%f6,	%f20
	fpack16	%f28,	%f14
	andncc	%i7,	%l4,	%g3
	andncc	%i4,	%g6,	%l2
	orn	%i5,	0x1406,	%l1
	fmovdl	%xcc,	%f12,	%f31
	movrlez	%o7,	%g5,	%o3
	nop
	fitos	%f6,	%f6
	fstox	%f6,	%f6
	fmovsle	%icc,	%f4,	%f1
	sll	%i1,	0x12,	%l6
	movpos	%icc,	%o6,	%o4
	movvc	%icc,	%o2,	%o5
	movgu	%icc,	%i0,	%l0
	movn	%xcc,	%l5,	%i6
	movge	%xcc,	%o0,	%g7
	tge	%icc,	0x7
	fmovspos	%icc,	%f13,	%f1
	andn	%i3,	0x0B7D,	%i2
	fmovrslez	%g4,	%f20,	%f20
	mulscc	%g1,	0x0924,	%o1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x08] %asi,	%l3
	sra	%i7,	0x08,	%g2
	movneg	%icc,	%g3,	%i4
	sethi	0x163C,	%g6
	fxnors	%f12,	%f5,	%f12
	ldsb	[%l7 + 0x0F],	%l2
	mulx	%i5,	0x0845,	%l4
	subc	%l1,	%g5,	%o7
	umulcc	%i1,	0x1CB6,	%l6
	popc	%o3,	%o6
	fmovrsgez	%o4,	%f3,	%f31
	fbne	%fcc1,	loop_130
	fmovdvc	%icc,	%f12,	%f21
	movl	%xcc,	%o5,	%i0
	fmovdvc	%xcc,	%f6,	%f20
loop_130:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x58] %asi,	%o2
	movrlez	%l0,	0x031,	%i6
	tn	%icc,	0x3
	edge16ln	%o0,	%g7,	%l5
	or	%i2,	0x0290,	%g4
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fcmpgt32	%f2,	%f6,	%g1
	tvs	%xcc,	0x5
	ldsh	[%l7 + 0x0E],	%i3
	tgu	%xcc,	0x0
	tsubcctv	%o1,	%i7,	%g2
	movgu	%icc,	%l3,	%g3
	tcs	%xcc,	0x7
	wr	%g0,	0x2b,	%asi
	stba	%g6,	[%l7 + 0x4A] %asi
	membar	#Sync
	tle	%xcc,	0x3
	fmovrse	%i4,	%f4,	%f15
	fbl	%fcc0,	loop_131
	fmovsle	%icc,	%f4,	%f20
	orncc	%i5,	%l4,	%l2
	nop
	setx	0xE83BDE61E6852352,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x76BBA6E2AE3D2337,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f2,	%f28
loop_131:
	or	%g5,	%l1,	%o7
	wr	%g0,	0x2f,	%asi
	stha	%l6,	[%l7 + 0x50] %asi
	membar	#Sync
	orncc	%i1,	%o3,	%o6
	fmovrsne	%o4,	%f5,	%f0
	stb	%i0,	[%l7 + 0x22]
	and	%o5,	0x0F6C,	%o2
	fmovdleu	%xcc,	%f25,	%f21
	array16	%i6,	%o0,	%g7
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0E] %asi,	%l0
	array16	%i2,	%l5,	%g4
	fnegd	%f28,	%f2
	movrne	%i3,	%o1,	%g1
	movleu	%icc,	%g2,	%l3
	set	0x3C, %i6
	lda	[%l7 + %i6] 0x89,	%f6
	movgu	%icc,	%i7,	%g3
	sllx	%i4,	%g6,	%l4
	smul	%l2,	%i5,	%l1
	ta	%xcc,	0x0
	umulcc	%o7,	%l6,	%g5
	movcc	%xcc,	%o3,	%o6
	movcs	%icc,	%o4,	%i1
	pdist	%f0,	%f30,	%f14
	tg	%xcc,	0x5
	sir	0x1D77
	movvs	%xcc,	%i0,	%o2
	udivcc	%o5,	0x00D3,	%o0
	fbu,a	%fcc2,	loop_132
	xor	%i6,	0x1ACA,	%g7
	andncc	%l0,	%i2,	%g4
	subcc	%l5,	0x0546,	%o1
loop_132:
	andncc	%i3,	%g2,	%l3
	edge32	%g1,	%g3,	%i4
	addc	%g6,	%l4,	%l2
	tsubcc	%i5,	%l1,	%o7
	bn	%xcc,	loop_133
	mova	%icc,	%i7,	%g5
	and	%o3,	0x15E5,	%o6
	brlez,a	%o4,	loop_134
loop_133:
	sub	%l6,	%i0,	%o2
	or	%o5,	0x0EDA,	%o0
	movleu	%xcc,	%i1,	%i6
loop_134:
	tsubcctv	%g7,	%l0,	%g4
	st	%f7,	[%l7 + 0x74]
	edge8n	%l5,	%o1,	%i2
	movleu	%xcc,	%g2,	%i3
	ldx	[%l7 + 0x68],	%l3
	mova	%xcc,	%g3,	%g1
	smul	%g6,	0x04E8,	%l4
	sdivx	%l2,	0x14F2,	%i4
	fmul8x16al	%f29,	%f20,	%f4
	edge32n	%l1,	%i5,	%o7
	fornot2s	%f15,	%f12,	%f21
	fpadd16	%f6,	%f10,	%f8
	fcmpeq16	%f8,	%f10,	%i7
	fmovdvs	%icc,	%f1,	%f25
	add	%g5,	%o6,	%o3
	fpadd16s	%f17,	%f20,	%f2
	te	%xcc,	0x4
	fbg,a	%fcc2,	loop_135
	lduw	[%l7 + 0x6C],	%l6
	fcmpeq32	%f14,	%f4,	%i0
	andncc	%o2,	%o4,	%o0
loop_135:
	bcs,a,pt	%icc,	loop_136
	movge	%icc,	%o5,	%i1
	fmovsg	%icc,	%f27,	%f28
	fmovrdgz	%i6,	%f26,	%f4
loop_136:
	tleu	%icc,	0x7
	movcs	%icc,	%g7,	%l0
	mulscc	%g4,	0x1807,	%o1
	tsubcc	%i2,	0x17F5,	%l5
	edge16ln	%g2,	%i3,	%g3
	bpos,a,pn	%xcc,	loop_137
	fbn,a	%fcc3,	loop_138
	movg	%icc,	%l3,	%g1
	edge32ln	%g6,	%l4,	%l2
loop_137:
	tleu	%icc,	0x6
loop_138:
	movcs	%xcc,	%l1,	%i4
	fone	%f24
	xnorcc	%o7,	0x1751,	%i7
	flush	%l7 + 0x0C
	set	0x40, %i0
	lduwa	[%l7 + %i0] 0x0c,	%g5
	tl	%icc,	0x2
	fmovs	%f7,	%f10
	edge8ln	%i5,	%o3,	%l6
	xnorcc	%i0,	%o6,	%o2
	fornot2	%f26,	%f8,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o4,	0x161D,	%o5
	fbue	%fcc3,	loop_139
	movrgz	%i1,	%i6,	%o0
	lduh	[%l7 + 0x66],	%l0
	addcc	%g4,	%o1,	%g7
loop_139:
	movrne	%i2,	0x3C3,	%l5
	movrlz	%i3,	0x21B,	%g3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%g2,	%g1
	fnot1s	%f7,	%f21
	taddcctv	%l3,	0x037D,	%g6
	tsubcctv	%l2,	%l1,	%l4
	srax	%o7,	%i4,	%i7
	fmovsgu	%icc,	%f1,	%f14
	or	%g5,	%o3,	%i5
	fnand	%f16,	%f22,	%f2
	ta	%xcc,	0x0
	andn	%l6,	%i0,	%o6
	addcc	%o4,	0x16BB,	%o2
	tneg	%xcc,	0x2
	srax	%i1,	0x0C,	%i6
	set	0x2F, %l2
	ldstuba	[%l7 + %l2] 0x10,	%o0
	fbul,a	%fcc3,	loop_140
	fnot2s	%f17,	%f4
	andncc	%l0,	%o5,	%o1
	for	%f20,	%f16,	%f24
loop_140:
	fbuge,a	%fcc1,	loop_141
	movl	%xcc,	%g4,	%g7
	addccc	%i2,	%i3,	%l5
	fabsd	%f12,	%f26
loop_141:
	nop
	setx	0xAE1255F032AD3847,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x49DDD392D0A4B4FC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f18,	%f16
	addcc	%g2,	0x01EF,	%g1
	umulcc	%l3,	%g3,	%l2
	orn	%l1,	0x1C4A,	%g6
	fornot2s	%f18,	%f5,	%f8
	nop
	setx	0xA7D0EAC3655CB30D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x45CB2BC851E5E9BC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f16,	%f10
	prefetch	[%l7 + 0x28],	 0x3
	fmovrdgz	%o7,	%f8,	%f6
	addccc	%l4,	%i4,	%g5
	tsubcctv	%i7,	0x1F36,	%i5
	nop
	setx	0xFDB538D055BD90CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA7ACECA879989855,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f26,	%f14
	tl	%icc,	0x3
	array32	%o3,	%i0,	%o6
	mulx	%l6,	%o2,	%o4
	mova	%icc,	%i1,	%i6
	tcs	%icc,	0x0
	movle	%icc,	%o0,	%l0
	tcc	%xcc,	0x4
	sllx	%o5,	%o1,	%g4
	fmovdgu	%icc,	%f17,	%f18
	fors	%f1,	%f31,	%f27
	fba	%fcc3,	loop_142
	movcs	%icc,	%i2,	%i3
	brlz	%g7,	loop_143
	srlx	%g2,	0x1D,	%l5
loop_142:
	prefetch	[%l7 + 0x38],	 0x1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%l3
loop_143:
	nop
	set	0x15, %o1
	ldstuba	[%l7 + %o1] 0x80,	%l2
	nop
	set	0x7B, %g3
	ldub	[%l7 + %g3],	%l1
	fmovdle	%xcc,	%f23,	%f29
	umul	%g3,	%g6,	%l4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%g5
	nop
	setx	0x60704F8D,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	udivx	%i7,	0x052A,	%i5
	sdivx	%o3,	0x0DB6,	%o7
	fbn	%fcc1,	loop_144
	fbl	%fcc1,	loop_145
	tsubcc	%i0,	%l6,	%o6
	movn	%xcc,	%o2,	%i1
loop_144:
	brgez	%o4,	loop_146
loop_145:
	tpos	%icc,	0x4
	ta	%xcc,	0x2
	set	0x2C, %g4
	sta	%f0,	[%l7 + %g4] 0x89
loop_146:
	sethi	0x0C02,	%i6
	edge16l	%l0,	%o0,	%o5
	sub	%g4,	%i2,	%i3
	orcc	%g7,	%o1,	%g2
	fzeros	%f22
	ldd	[%l7 + 0x78],	%f28
	subccc	%l5,	0x1016,	%l3
	fcmpne16	%f16,	%f30,	%g1
	fble	%fcc2,	loop_147
	add	%l2,	%g3,	%l1
	umulcc	%l4,	%i4,	%g6
	call	loop_148
loop_147:
	edge16n	%i7,	%i5,	%o3
	set	0x50, %l4
	prefetcha	[%l7 + %l4] 0x14,	 0x0
loop_148:
	fmovscc	%icc,	%f25,	%f27
	edge8	%o7,	%l6,	%i0
	udiv	%o2,	0x076B,	%o6
	tn	%xcc,	0x1
	move	%icc,	%o4,	%i1
	edge32l	%l0,	%i6,	%o0
	fsrc1s	%f18,	%f31
	subc	%o5,	%g4,	%i2
	fnot1s	%f25,	%f3
	sllx	%g7,	0x02,	%o1
	udiv	%i3,	0x05A0,	%g2
	fbo,a	%fcc3,	loop_149
	nop
	setx	0x30D8822D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f5
	fmovdpos	%icc,	%f7,	%f3
	edge8ln	%l3,	%g1,	%l5
loop_149:
	ba,pn	%xcc,	loop_150
	movrne	%l2,	%g3,	%l1
	subcc	%l4,	0x1A98,	%g6
	edge32n	%i4,	%i7,	%i5
loop_150:
	fblg	%fcc3,	loop_151
	movgu	%icc,	%o3,	%o7
	fand	%f20,	%f14,	%f18
	orncc	%g5,	%i0,	%l6
loop_151:
	tleu	%xcc,	0x6
	fmovsg	%xcc,	%f11,	%f2
	bcs,pt	%xcc,	loop_152
	fmovdn	%xcc,	%f7,	%f26
	set	0x14, %i5
	lduba	[%l7 + %i5] 0x10,	%o2
loop_152:
	fand	%f8,	%f26,	%f16
	fmovsleu	%xcc,	%f1,	%f8
	set	0x56, %o4
	stha	%o6,	[%l7 + %o4] 0x19
	tvs	%xcc,	0x6
	tcs	%xcc,	0x3
	movrlz	%o4,	0x195,	%i1
	popc	%i6,	%o0
	flush	%l7 + 0x2C
	popc	0x194B,	%l0
	fabss	%f19,	%f20
	tsubcc	%g4,	%o5,	%i2
	fbug	%fcc3,	loop_153
	tcs	%icc,	0x1
	movn	%icc,	%o1,	%g7
	udiv	%i3,	0x1075,	%l3
loop_153:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x18,	%g1,	%l5
	fxnors	%f15,	%f10,	%f20
	fbl	%fcc2,	loop_154
	brlz	%g2,	loop_155
	brlz	%l2,	loop_156
	movgu	%xcc,	%l1,	%g3
loop_154:
	movge	%xcc,	%g6,	%l4
loop_155:
	tge	%xcc,	0x3
loop_156:
	movrlz	%i7,	%i5,	%o3
	bne	%xcc,	loop_157
	fmovdvs	%icc,	%f24,	%f4
	ta	%xcc,	0x5
	sth	%i4,	[%l7 + 0x70]
loop_157:
	std	%f2,	[%l7 + 0x50]
	set	0x44, %g6
	stwa	%o7,	[%l7 + %g6] 0x2b
	membar	#Sync
	xnorcc	%i0,	%g5,	%l6
	mulx	%o6,	%o4,	%i1
	nop
	setx	0x80453067,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	alignaddr	%i6,	%o2,	%l0
	array8	%g4,	%o0,	%o5
	array32	%o1,	%g7,	%i3
	sub	%i2,	0x0D7E,	%l3
	ldd	[%l7 + 0x70],	%l4
	movg	%icc,	%g1,	%l2
	sir	0x0EB5
	add	%g2,	0x0029,	%g3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x88,	%g6,	%l1
	movcs	%icc,	%i7,	%l4
	movrgez	%i5,	0x2B0,	%o3
	stbar
	fmovsvc	%xcc,	%f25,	%f28
	add	%i4,	%i0,	%o7
	mulscc	%g5,	%l6,	%o4
	fcmple16	%f4,	%f20,	%i1
	nop
	fitos	%f6,	%f16
	fstox	%f16,	%f18
	brgez	%i6,	loop_158
	ble,a,pn	%icc,	loop_159
	nop
	setx loop_160, %l0, %l1
	jmpl %l1, %o2
	andn	%l0,	0x11B2,	%o6
loop_158:
	array8	%g4,	%o5,	%o0
loop_159:
	xorcc	%g7,	%i3,	%o1
loop_160:
	movrlez	%l3,	0x129,	%l5
	nop
	setx	0xD0416656,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	orn	%g1,	%l2,	%g2
	fbg	%fcc2,	loop_161
	bpos,a,pn	%icc,	loop_162
	srlx	%i2,	%g3,	%l1
	brnz	%g6,	loop_163
loop_161:
	movpos	%xcc,	%l4,	%i7
loop_162:
	srax	%o3,	%i4,	%i5
	ldd	[%l7 + 0x70],	%i0
loop_163:
	fxnor	%f10,	%f20,	%f2
	fornot1s	%f13,	%f27,	%f7
	tpos	%icc,	0x5
	movn	%icc,	%o7,	%l6
	fmovrslz	%g5,	%f23,	%f1
	nop
	setx	0xF60E6EECE039D301,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x028F4BF333681CD7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f0,	%f2
	fmovscs	%icc,	%f24,	%f10
	taddcc	%i1,	0x1BD4,	%o4
	movrlz	%o2,	%i6,	%l0
	sdiv	%g4,	0x0326,	%o5
	fandnot1	%f4,	%f10,	%f14
	movleu	%icc,	%o0,	%o6
	addc	%i3,	%o1,	%l3
	edge8ln	%l5,	%g1,	%l2
	movrgz	%g2,	%g7,	%g3
	movpos	%xcc,	%l1,	%i2
	fcmpgt32	%f4,	%f28,	%l4
	fmovsge	%icc,	%f2,	%f15
	popc	%g6,	%o3
	fmovd	%f18,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%icc,	%f28,	%f9
	fbo	%fcc3,	loop_164
	fpsub16	%f4,	%f4,	%f8
	edge32n	%i4,	%i7,	%i0
	addccc	%o7,	0x1A7B,	%i5
loop_164:
	fmovsgu	%xcc,	%f5,	%f10
	fcmpgt16	%f8,	%f18,	%g5
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
	tsubcc	%l6,	0x00C8,	%o2
	fmovdcc	%icc,	%f13,	%f24
	bl,pt	%xcc,	loop_165
	nop
	set	0x18, %o5
	sth	%i6,	[%l7 + %o5]
	bpos,a,pt	%xcc,	loop_166
	fbn	%fcc1,	loop_167
loop_165:
	tne	%xcc,	0x1
	ldd	[%l7 + 0x08],	%l0
loop_166:
	movpos	%icc,	%o4,	%g4
loop_167:
	tvs	%icc,	0x1
	fpadd32s	%f2,	%f21,	%f26
	edge16n	%o0,	%o6,	%o5
	add	%o1,	%i3,	%l5
	nop
	setx	0x6379D0CDFC9DA18C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2384F2D701A851A8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f10,	%f22
	sir	0x1966
	fmovscs	%icc,	%f25,	%f28
	mulscc	%l3,	0x1A78,	%l2
	tsubcctv	%g1,	0x0EAA,	%g2
	subc	%g3,	%g7,	%i2
	fnegs	%f11,	%f10
	edge16l	%l1,	%g6,	%l4
	andcc	%i4,	%o3,	%i7
	nop
	setx loop_168, %l0, %l1
	jmpl %l1, %o7
	bl,a,pt	%icc,	loop_169
	call	loop_170
	edge32ln	%i0,	%i5,	%g5
loop_168:
	fxors	%f21,	%f13,	%f13
loop_169:
	ldsb	[%l7 + 0x63],	%l6
loop_170:
	nop
	set	0x44, %l1
	ldsh	[%l7 + %l1],	%o2
	sth	%i6,	[%l7 + 0x2E]
	srax	%l0,	0x09,	%o4
	sir	0x11C2
	xor	%i1,	%g4,	%o0
	add	%o6,	%o1,	%i3
	fsrc1	%f28,	%f18
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%l3
	edge16l	%l5,	%l2,	%g1
	edge16ln	%g3,	%g7,	%i2
	fbug	%fcc1,	loop_171
	fbug,a	%fcc1,	loop_172
	fmovde	%xcc,	%f4,	%f1
	movvc	%icc,	%l1,	%g2
loop_171:
	edge16	%g6,	%i4,	%l4
loop_172:
	fmovrslz	%o3,	%f13,	%f5
	orn	%i7,	0x0FB4,	%i0
	bne,a,pn	%icc,	loop_173
	tcc	%xcc,	0x0
	array16	%o7,	%g5,	%i5
	flush	%l7 + 0x40
loop_173:
	subccc	%o2,	%i6,	%l0
	movrne	%o4,	%l6,	%g4
	movcc	%icc,	%o0,	%o6
	ldx	[%l7 + 0x38],	%i1
	movg	%icc,	%o1,	%i3
	movneg	%icc,	%l3,	%l5
	smulcc	%l2,	%g1,	%g3
	alignaddr	%g7,	%i2,	%o5
	fandnot1	%f2,	%f14,	%f20
	stw	%l1,	[%l7 + 0x0C]
	fbu	%fcc1,	loop_174
	bshuffle	%f12,	%f14,	%f20
	set	0x24, %o6
	swapa	[%l7 + %o6] 0x10,	%g6
loop_174:
	tpos	%icc,	0x0
	fsrc1s	%f11,	%f17
	alignaddrl	%i4,	%l4,	%g2
	fmuld8sux16	%f13,	%f20,	%f0
	andncc	%o3,	%i7,	%i0
	nop
	setx	0xD5C8E23A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xFF166D41,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f22,	%f22
	umulcc	%g5,	0x03F7,	%o7
	orncc	%i5,	0x12AF,	%i6
	tcs	%icc,	0x3
	lduh	[%l7 + 0x46],	%o2
	movrlz	%o4,	%l0,	%g4
	wr	%g0,	0x88,	%asi
	sta	%f10,	[%l7 + 0x40] %asi
	fnot2s	%f4,	%f4
	tleu	%icc,	0x4
	fpack32	%f16,	%f28,	%f30
	movg	%icc,	%l6,	%o6
	smul	%i1,	%o1,	%o0
	sdivcc	%i3,	0x11C3,	%l5
	sir	0x1E69
	taddcctv	%l2,	%g1,	%g3
	srl	%g7,	0x0F,	%l3
	movneg	%xcc,	%o5,	%l1
	srlx	%i2,	%i4,	%g6
	tge	%xcc,	0x6
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x38] %asi,	%l4
	movrgez	%g2,	0x134,	%i7
	bshuffle	%f12,	%f18,	%f14
	fnors	%f0,	%f11,	%f9
	fba,a	%fcc3,	loop_175
	tgu	%xcc,	0x6
	fbule,a	%fcc3,	loop_176
	srlx	%i0,	0x1F,	%g5
loop_175:
	stbar
	fmovrsne	%o7,	%f13,	%f26
loop_176:
	taddcc	%i5,	0x1B0E,	%i6
	fpack16	%f16,	%f19
	move	%xcc,	%o3,	%o2
	stb	%l0,	[%l7 + 0x79]
	ldsb	[%l7 + 0x69],	%o4
	fnand	%f22,	%f12,	%f28
	nop
	set	0x18, %i3
	prefetch	[%l7 + %i3],	 0x1
	fcmpne32	%f6,	%f12,	%g4
	tsubcc	%l6,	0x1460,	%i1
	andn	%o1,	%o6,	%i3
	fmovrse	%l5,	%f25,	%f23
	movrgz	%l2,	%o0,	%g1
	stw	%g7,	[%l7 + 0x50]
	movneg	%icc,	%l3,	%g3
	te	%icc,	0x4
	bvc,a,pt	%icc,	loop_177
	nop
	fitos	%f5,	%f23
	fstoi	%f23,	%f22
	movrgez	%o5,	%i2,	%i4
	fmuld8ulx16	%f8,	%f29,	%f6
loop_177:
	subcc	%l1,	%g6,	%l4
	movrne	%g2,	%i7,	%i0
	edge32	%o7,	%g5,	%i6
	srl	%i5,	%o2,	%o3
	mulscc	%l0,	%g4,	%o4
	edge8ln	%i1,	%o1,	%l6
	array16	%i3,	%o6,	%l2
	fmovrde	%o0,	%f24,	%f18
	movneg	%xcc,	%l5,	%g1
	edge32ln	%l3,	%g3,	%g7
	fpmerge	%f8,	%f18,	%f2
	orn	%o5,	%i2,	%i4
	fble,a	%fcc3,	loop_178
	fmovsneg	%icc,	%f7,	%f27
	sdiv	%g6,	0x0F03,	%l4
	edge32n	%g2,	%l1,	%i0
loop_178:
	fba	%fcc1,	loop_179
	udiv	%o7,	0x1549,	%g5
	tleu	%icc,	0x6
	array8	%i6,	%i7,	%o2
loop_179:
	ldsh	[%l7 + 0x40],	%o3
	fmovdl	%icc,	%f20,	%f20
	st	%f21,	[%l7 + 0x28]
	sir	0x1BB1
	sra	%i5,	%g4,	%o4
	tsubcc	%l0,	%i1,	%o1
	smul	%l6,	0x048E,	%i3
	nop
	fitos	%f8,	%f15
	fstox	%f15,	%f22
	fxtos	%f22,	%f4
	fmovsne	%xcc,	%f25,	%f21
	fmovse	%xcc,	%f29,	%f10
	orncc	%l2,	0x0504,	%o6
	tg	%icc,	0x2
	tpos	%xcc,	0x6
	fbl	%fcc0,	loop_180
	move	%xcc,	%l5,	%o0
	popc	0x155B,	%l3
	udivx	%g1,	0x0AAE,	%g3
loop_180:
	swap	[%l7 + 0x30],	%o5
	fmovsa	%icc,	%f1,	%f7
	fbe	%fcc0,	loop_181
	bg	loop_182
	tne	%icc,	0x0
	fpsub16s	%f30,	%f10,	%f23
loop_181:
	fmovrsne	%g7,	%f31,	%f15
loop_182:
	orn	%i4,	0x18E4,	%i2
	nop
	setx	0x9BE88061B056A10A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	tcs	%icc,	0x4
	addcc	%l4,	0x1EF8,	%g2
	xnorcc	%g6,	0x1A15,	%i0
	fmovrse	%l1,	%f17,	%f6
	fblg,a	%fcc0,	loop_183
	edge8ln	%g5,	%o7,	%i7
	sir	0x1ACA
	bshuffle	%f0,	%f22,	%f4
loop_183:
	add	%o2,	0x0C37,	%i6
	mova	%xcc,	%o3,	%g4
	fcmpne32	%f14,	%f16,	%i5
	srl	%o4,	0x1E,	%i1
	movrne	%o1,	%l0,	%i3
	fmovda	%icc,	%f31,	%f25
	nop
	fitod	%f6,	%f12
	fdtoi	%f12,	%f27
	stb	%l6,	[%l7 + 0x24]
	tleu	%xcc,	0x4
	mova	%xcc,	%l2,	%o6
	fmul8x16al	%f25,	%f0,	%f30
	srl	%o0,	0x0F,	%l3
	movcs	%xcc,	%l5,	%g3
	taddcctv	%o5,	0x01E3,	%g7
	fmovsleu	%icc,	%f27,	%f4
	tpos	%xcc,	0x0
	sdiv	%g1,	0x1B9E,	%i2
	tgu	%icc,	0x4
	movne	%icc,	%i4,	%g2
	sllx	%g6,	0x1E,	%i0
	sllx	%l1,	%g5,	%l4
	std	%f0,	[%l7 + 0x68]
	move	%xcc,	%o7,	%i7
	sra	%o2,	0x15,	%i6
	ble,pt	%xcc,	loop_184
	fmovdne	%xcc,	%f7,	%f22
	set	0x20, %l6
	swapa	[%l7 + %l6] 0x89,	%g4
loop_184:
	alignaddrl	%i5,	%o4,	%o3
	fmovs	%f31,	%f18
	xor	%o1,	%i1,	%l0
	tvs	%xcc,	0x7
	fpsub32s	%f27,	%f6,	%f31
	sll	%l6,	0x0F,	%i3
	array8	%l2,	%o6,	%o0
	fxnor	%f22,	%f10,	%f2
	fnot1s	%f27,	%f28
	edge8ln	%l3,	%l5,	%o5
	movvs	%xcc,	%g3,	%g7
	tn	%xcc,	0x2
	set	0x50, %l3
	ldda	[%l7 + %l3] 0x2c,	%i2
	nop
	setx	loop_185,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn	%fcc1,	loop_186
	st	%f22,	[%l7 + 0x54]
	edge16l	%g1,	%g2,	%g6
loop_185:
	orncc	%i4,	%i0,	%g5
loop_186:
	prefetch	[%l7 + 0x5C],	 0x0
	edge8	%l1,	%l4,	%i7
	be,a	%xcc,	loop_187
	movvc	%icc,	%o7,	%o2
	fxor	%f6,	%f2,	%f4
	fble,a	%fcc3,	loop_188
loop_187:
	edge8l	%g4,	%i6,	%i5
	mova	%xcc,	%o4,	%o3
	movge	%xcc,	%o1,	%l0
loop_188:
	membar	0x30
	addc	%i1,	0x10C3,	%i3
	sub	%l6,	0x10B0,	%l2
	popc	%o0,	%o6
	movvc	%icc,	%l3,	%o5
	movgu	%xcc,	%g3,	%g7
	alignaddr	%l5,	%i2,	%g2
	ldsb	[%l7 + 0x1C],	%g6
	pdist	%f0,	%f22,	%f8
	set	0x52, %o7
	ldsha	[%l7 + %o7] 0x0c,	%i4
	fabss	%f14,	%f19
	ba	loop_189
	nop
	setx	loop_190,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%g1,	%g5,	%i0
	alignaddrl	%l1,	%i7,	%l4
loop_189:
	bleu,pt	%icc,	loop_191
loop_190:
	edge32	%o7,	%o2,	%i6
	smulcc	%i5,	%o4,	%o3
	subc	%g4,	0x08FB,	%o1
loop_191:
	movre	%i1,	%i3,	%l0
	movrlez	%l6,	%o0,	%l2
	movvc	%xcc,	%o6,	%o5
	nop
	setx loop_192, %l0, %l1
	jmpl %l1, %g3
	tg	%xcc,	0x3
	alignaddr	%l3,	%g7,	%l5
	move	%icc,	%g2,	%i2
loop_192:
	nop
	setx	0x82BA9CF85D19A9E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x98C8C8F425E42323,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f14,	%f22
	fbuge,a	%fcc2,	loop_193
	nop
	fitod	%f21,	%f24
	nop
	setx	loop_194,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%i4,	0x04FB,	%g1
loop_193:
	tn	%xcc,	0x1
	set	0x08, %g1
	ldstuba	[%l7 + %g1] 0x0c,	%g6
loop_194:
	tg	%icc,	0x5
	array32	%i0,	%l1,	%i7
	fornot1s	%f9,	%f18,	%f21
	movvs	%xcc,	%l4,	%o7
	addccc	%g5,	%i6,	%i5
	andcc	%o4,	0x0844,	%o3
	bgu,a	%xcc,	loop_195
	subccc	%g4,	%o1,	%o2
	lduh	[%l7 + 0x48],	%i3
	set	0x28, %g5
	stwa	%i1,	[%l7 + %g5] 0xe3
	membar	#Sync
loop_195:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	pdist	%f10,	%f10,	%f2
	movg	%xcc,	%l0,	%l2
	bleu	%xcc,	loop_196
	udivx	%o0,	0x1557,	%o6
	fble,a	%fcc0,	loop_197
	fmovsgu	%icc,	%f10,	%f8
loop_196:
	nop
	setx loop_198, %l0, %l1
	jmpl %l1, %o5
	tcs	%xcc,	0x2
loop_197:
	movrne	%l3,	0x04F,	%g7
	ta	%icc,	0x3
loop_198:
	edge8ln	%l5,	%g2,	%i2
	orn	%g3,	%g1,	%g6
	fmovsl	%xcc,	%f22,	%f8
	movleu	%xcc,	%i0,	%i4
	sethi	0x0C05,	%i7
	edge16l	%l4,	%l1,	%g5
	sir	0x17F0
	fnegd	%f28,	%f12
	fmul8x16al	%f27,	%f31,	%f20
	edge8ln	%o7,	%i5,	%o4
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x4C] %asi,	%i6
	popc	%g4,	%o3
	fone	%f20
	movgu	%icc,	%o2,	%o1
	sra	%i3,	0x12,	%i1
	edge32n	%l0,	%l2,	%o0
	sethi	0x07E3,	%o6
	xor	%l6,	0x18C5,	%l3
	set	0x74, %i7
	stha	%g7,	[%l7 + %i7] 0x89
	st	%f12,	[%l7 + 0x50]
	movge	%xcc,	%l5,	%g2
	umulcc	%i2,	0x1B48,	%o5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x10,	%g1,	%g3
	fcmple32	%f18,	%f14,	%g6
	fandnot1s	%f0,	%f11,	%f3
	fmovdge	%xcc,	%f20,	%f6
	fmovse	%icc,	%f28,	%f26
	sdivcc	%i4,	0x1999,	%i0
	andn	%l4,	%i7,	%l1
	sllx	%g5,	0x01,	%o7
	bne,a,pt	%xcc,	loop_199
	fnors	%f20,	%f31,	%f22
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x14,	%f0
loop_199:
	smul	%i5,	%i6,	%o4
	array8	%g4,	%o2,	%o3
	sdivx	%i3,	0x1396,	%i1
	bvc	%icc,	loop_200
	array32	%l0,	%o1,	%o0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
loop_200:
	fmovsn	%icc,	%f28,	%f24
	xnorcc	%o6,	%l3,	%l6
	movre	%l5,	0x3D6,	%g2
	popc	0x04C7,	%i2
	nop
	setx	0x61FDE53A5A8A59BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x890FABCFC8822EDE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f20,	%f8
	nop
	setx	0x2EF34C8C2B3F7186,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x02E36841274FB59A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f20,	%f16
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x04,	%o5,	%g1
	xorcc	%g7,	%g3,	%g6
	edge32ln	%i0,	%i4,	%i7
	sllx	%l4,	%g5,	%o7
	movrlz	%i5,	0x1A9,	%i6
	srl	%l1,	%g4,	%o2
	fmovscc	%icc,	%f9,	%f2
	tneg	%icc,	0x2
	edge8ln	%o3,	%i3,	%i1
	ldd	[%l7 + 0x70],	%f6
	sethi	0x1E1C,	%l0
	bgu,a	loop_201
	edge8	%o1,	%o4,	%l2
	fmovdvc	%xcc,	%f9,	%f3
	or	%o0,	0x0D3E,	%l3
loop_201:
	bg,pn	%icc,	loop_202
	ldd	[%l7 + 0x20],	%f16
	lduw	[%l7 + 0x54],	%o6
	movrlez	%l5,	0x0FE,	%l6
loop_202:
	edge16	%g2,	%i2,	%g1
	array32	%g7,	%o5,	%g3
	wr	%g0,	0x88,	%asi
	stba	%i0,	[%l7 + 0x22] %asi
	bcs	%icc,	loop_203
	fmul8x16au	%f28,	%f29,	%f18
	tleu	%xcc,	0x0
	fmovrde	%i4,	%f4,	%f30
loop_203:
	tcs	%icc,	0x5
	tn	%xcc,	0x3
	edge16ln	%g6,	%l4,	%i7
	fcmpgt16	%f18,	%f26,	%g5
	fnot2	%f2,	%f4
	sub	%o7,	0x1989,	%i5
	fmovrde	%i6,	%f28,	%f20
	tcs	%xcc,	0x3
	sllx	%g4,	0x1D,	%l1
	fbe	%fcc1,	loop_204
	fmul8x16	%f19,	%f6,	%f24
	addc	%o2,	0x0A96,	%o3
	xnorcc	%i3,	%l0,	%i1
loop_204:
	mova	%xcc,	%o4,	%l2
	movvc	%icc,	%o0,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l3,	%o6,	%l6
	sll	%l5,	0x14,	%g2
	bcc,a,pt	%icc,	loop_205
	tge	%icc,	0x7
	fbge	%fcc1,	loop_206
	te	%xcc,	0x5
loop_205:
	fbl	%fcc1,	loop_207
	sra	%g1,	0x1C,	%g7
loop_206:
	ldsb	[%l7 + 0x59],	%i2
	fmuld8ulx16	%f4,	%f20,	%f22
loop_207:
	nop
	wr	%g0,	0x89,	%asi
	stxa	%g3,	[%l7 + 0x28] %asi
	edge16	%i0,	%o5,	%i4
	edge16	%l4,	%g6,	%g5
	andcc	%i7,	0x0A02,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x4
	fxnor	%f10,	%f24,	%f4
	udivx	%i6,	0x10E5,	%o7
	fmovdpos	%xcc,	%f15,	%f30
	movrgez	%l1,	%o2,	%o3
	movcs	%xcc,	%i3,	%l0
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%g4
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%f16
	movrne	%i1,	0x171,	%o4
	popc	0x0DF2,	%o0
	nop
	setx	0xCDF71EAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f18
	smulcc	%l2,	0x12B1,	%l3
	bgu,pn	%icc,	loop_208
	movrgz	%o1,	0x37E,	%l6
	te	%xcc,	0x0
	movl	%xcc,	%l5,	%o6
loop_208:
	sdivcc	%g2,	0x1DD4,	%g1
	fmovsvc	%icc,	%f13,	%f4
	movcc	%xcc,	%i2,	%g3
	edge16	%g7,	%o5,	%i0
	brz	%i4,	loop_209
	mova	%icc,	%g6,	%g5
	xorcc	%l4,	%i5,	%i6
	xor	%o7,	0x12B1,	%i7
loop_209:
	fpsub32s	%f6,	%f18,	%f21
	subcc	%o2,	%l1,	%o3
	nop
	fitod	%f10,	%f12
	fdtos	%f12,	%f1
	fmovsvs	%icc,	%f1,	%f31
	tl	%icc,	0x3
	movgu	%xcc,	%l0,	%i3
	movgu	%xcc,	%i1,	%o4
	fmovsl	%xcc,	%f27,	%f20
	fmovdl	%xcc,	%f18,	%f25
	set	0x1C, %i1
	lduba	[%l7 + %i1] 0x0c,	%g4
	fornot2	%f30,	%f4,	%f16
	or	%l2,	%l3,	%o0
	movcs	%xcc,	%o1,	%l5
	set	0x3E, %i4
	stha	%l6,	[%l7 + %i4] 0x2f
	membar	#Sync
	edge8n	%g2,	%o6,	%i2
	movrlez	%g1,	0x0E7,	%g3
	fxnors	%f22,	%f2,	%f22
	movcs	%icc,	%g7,	%i0
	ldsb	[%l7 + 0x53],	%i4
	set	0x58, %o0
	lduwa	[%l7 + %o0] 0x80,	%g6
	movneg	%xcc,	%o5,	%l4
	set	0x5C, %o3
	ldsba	[%l7 + %o3] 0x10,	%i5
	fcmpne32	%f12,	%f24,	%g5
	fmovrsgz	%o7,	%f4,	%f25
	nop
	setx	0xD0688C31,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	movre	%i6,	%o2,	%i7
	fornot2	%f20,	%f30,	%f6
	subcc	%l1,	0x1A87,	%l0
	set	0x14, %l0
	sta	%f10,	[%l7 + %l0] 0x0c
	brlz	%o3,	loop_210
	fbl	%fcc2,	loop_211
	fzero	%f16
	edge32l	%i1,	%o4,	%i3
loop_210:
	sir	0x1CCF
loop_211:
	mulscc	%g4,	%l3,	%o0
	movvs	%icc,	%o1,	%l5
	add	%l6,	%g2,	%l2
	fandnot1	%f6,	%f26,	%f20
	taddcctv	%o6,	0x0E20,	%i2
	sethi	0x0246,	%g1
	fbne,a	%fcc2,	loop_212
	fbge	%fcc1,	loop_213
	taddcctv	%g7,	%i0,	%i4
	fxnors	%f20,	%f6,	%f19
loop_212:
	fnot2	%f4,	%f26
loop_213:
	lduw	[%l7 + 0x4C],	%g3
	set	0x70, %i2
	swapa	[%l7 + %i2] 0x0c,	%g6
	tne	%xcc,	0x7
	tpos	%xcc,	0x4
	tcc	%xcc,	0x3
	stb	%l4,	[%l7 + 0x27]
	brz	%o5,	loop_214
	tge	%xcc,	0x4
	sll	%g5,	0x19,	%o7
	taddcc	%i5,	%i6,	%i7
loop_214:
	tsubcctv	%l1,	0x1ACD,	%l0
	udivcc	%o3,	0x1D4C,	%o2
	alignaddr	%i1,	%i3,	%g4
	fmovdg	%icc,	%f18,	%f22
	udivx	%o4,	0x0FF4,	%l3
	nop
	fitod	%f29,	%f28
	bvs,pn	%xcc,	loop_215
	tle	%xcc,	0x3
	movcc	%xcc,	%o0,	%l5
	xnorcc	%l6,	0x0761,	%o1
loop_215:
	fnot1	%f18,	%f30
	move	%icc,	%l2,	%g2
	movrlez	%i2,	0x10A,	%o6
	tvs	%icc,	0x0
	bneg,a	%xcc,	loop_216
	popc	0x0E6A,	%g7
	fble	%fcc1,	loop_217
	edge32l	%i0,	%g1,	%g3
loop_216:
	tcc	%icc,	0x7
	fmovd	%f28,	%f24
loop_217:
	and	%g6,	0x0159,	%i4
	bvc,pt	%xcc,	loop_218
	ldd	[%l7 + 0x10],	%l4
	edge16	%o5,	%g5,	%i5
	fsrc1	%f12,	%f4
loop_218:
	fbn,a	%fcc1,	loop_219
	alignaddr	%i6,	%i7,	%l1
	movleu	%icc,	%o7,	%l0
	nop
	setx	0x3E66DF920936DA1D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x87B6AFB9CCC64B0D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f16,	%f10
loop_219:
	tvc	%icc,	0x7
	fcmpeq16	%f22,	%f8,	%o3
	bl,a,pt	%icc,	loop_220
	ba,a,pt	%icc,	loop_221
	fnands	%f14,	%f5,	%f16
	addcc	%i1,	%i3,	%o2
loop_220:
	fsrc2s	%f20,	%f12
loop_221:
	fbug,a	%fcc0,	loop_222
	fmovdleu	%icc,	%f2,	%f23
	edge16n	%o4,	%g4,	%l3
	fmovd	%f30,	%f14
loop_222:
	bg,a,pn	%icc,	loop_223
	tpos	%icc,	0x5
	stb	%o0,	[%l7 + 0x57]
	fsrc2	%f16,	%f8
loop_223:
	add	%l5,	0x1454,	%o1
	fba	%fcc1,	loop_224
	subccc	%l6,	0x0A5E,	%l2
	fbg	%fcc2,	loop_225
	addcc	%i2,	%o6,	%g2
loop_224:
	bg,pt	%icc,	loop_226
	fmovsle	%xcc,	%f26,	%f6
loop_225:
	edge32n	%g7,	%i0,	%g3
	ldd	[%l7 + 0x28],	%g0
loop_226:
	tle	%xcc,	0x5
	addccc	%g6,	0x0D7D,	%l4
	udivx	%o5,	0x0CC6,	%g5
	brgez,a	%i4,	loop_227
	ldsb	[%l7 + 0x7D],	%i5
	fbn,a	%fcc2,	loop_228
	array8	%i6,	%l1,	%i7
loop_227:
	subcc	%o7,	%l0,	%o3
	edge16	%i1,	%o2,	%i3
loop_228:
	bvc,pt	%icc,	loop_229
	bneg,pt	%xcc,	loop_230
	movre	%g4,	%l3,	%o0
	orcc	%o4,	%l5,	%o1
loop_229:
	movcs	%xcc,	%l6,	%i2
loop_230:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%l2
	ta	%icc,	0x2
	fbo,a	%fcc3,	loop_231
	edge16n	%g2,	%o6,	%i0
	fmovrse	%g3,	%f8,	%f23
	add	%g1,	0x1556,	%g6
loop_231:
	sdiv	%g7,	0x12FC,	%o5
	tne	%xcc,	0x3
	ta	%icc,	0x1
	edge16	%g5,	%l4,	%i5
	movleu	%icc,	%i4,	%i6
	fcmple32	%f14,	%f10,	%i7
	movrgz	%o7,	%l0,	%o3
	edge8	%l1,	%i1,	%o2
	fmovrdgz	%g4,	%f22,	%f16
	fxnor	%f8,	%f0,	%f26
	movg	%icc,	%i3,	%l3
	addcc	%o4,	0x178A,	%l5
	tsubcctv	%o0,	0x116E,	%l6
	fornot2s	%f5,	%f5,	%f6
	orncc	%i2,	0x010E,	%o1
	or	%l2,	0x1048,	%g2
	stx	%i0,	[%l7 + 0x40]
	edge16ln	%o6,	%g3,	%g1
	movleu	%xcc,	%g7,	%g6
	taddcctv	%o5,	0x0630,	%l4
	umulcc	%g5,	0x1EB2,	%i4
	nop
	setx	0x0E45ECE59C8CD4F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x08274830DA37A9F2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f16,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i5,	%i7
	membar	0x7D
	udiv	%o7,	0x02C1,	%l0
	tne	%icc,	0x0
	nop
	setx	0xB056D2BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	sdivcc	%o3,	0x1AB0,	%l1
	tleu	%xcc,	0x3
	fbue,a	%fcc3,	loop_232
	nop
	set	0x40, %o2
	std	%f6,	[%l7 + %o2]
	smulcc	%i6,	%i1,	%o2
	fmovrdne	%g4,	%f10,	%f12
loop_232:
	movrlz	%i3,	0x3D0,	%o4
	fbule,a	%fcc2,	loop_233
	tvs	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x3
loop_233:
	movrgz	%l3,	%o0,	%l5
	tsubcc	%i2,	0x1251,	%l6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o1
	fbul	%fcc3,	loop_234
	movpos	%xcc,	%l2,	%g2
	sethi	0x0A9D,	%i0
	xnorcc	%o6,	%g1,	%g3
loop_234:
	stb	%g7,	[%l7 + 0x49]
	xor	%o5,	%g6,	%l4
	movge	%xcc,	%i4,	%i5
	nop
	setx	0x3B66BEB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x6C47E1C0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f12,	%f27
	te	%xcc,	0x4
	sdivcc	%g5,	0x019D,	%o7
	brgez,a	%l0,	loop_235
	srlx	%o3,	%i7,	%l1
	bcc	%xcc,	loop_236
	tsubcctv	%i1,	0x1C82,	%i6
loop_235:
	movrgz	%o2,	%i3,	%o4
	edge32l	%g4,	%o0,	%l5
loop_236:
	nop
	set	0x1A, %l5
	ldsha	[%l7 + %l5] 0x11,	%i2
	andn	%l3,	0x0E43,	%l6
	subccc	%l2,	0x0A6E,	%o1
	fbue	%fcc0,	loop_237
	xorcc	%g2,	0x071D,	%o6
	wr	%g0,	0x0c,	%asi
	stwa	%i0,	[%l7 + 0x64] %asi
loop_237:
	movn	%icc,	%g3,	%g7
	faligndata	%f12,	%f10,	%f6
	popc	0x163A,	%o5
	tl	%xcc,	0x6
	movpos	%icc,	%g6,	%g1
	taddcc	%l4,	%i4,	%g5
	or	%o7,	0x17A0,	%l0
	membar	0x43
	stw	%i5,	[%l7 + 0x68]
	srl	%o3,	0x13,	%i7
	edge16n	%i1,	%i6,	%l1
	movrlz	%i3,	0x33F,	%o2
	fmovdl	%icc,	%f13,	%f27
	tn	%icc,	0x7
	movcc	%icc,	%g4,	%o0
	movrlez	%o4,	%l5,	%l3
	brgz,a	%l6,	loop_238
	tcs	%xcc,	0x5
	fmuld8ulx16	%f11,	%f30,	%f14
	alignaddrl	%i2,	%l2,	%o1
loop_238:
	andncc	%o6,	%i0,	%g3
	fbg	%fcc0,	loop_239
	fmovsvc	%icc,	%f16,	%f19
	fpadd32	%f8,	%f16,	%f24
	smulcc	%g7,	0x18C2,	%g2
loop_239:
	stb	%g6,	[%l7 + 0x78]
	xorcc	%o5,	%l4,	%i4
	tn	%xcc,	0x5
	set	0x10, %i6
	ldda	[%l7 + %i6] 0x88,	%g0
	movrne	%g5,	0x343,	%o7
	or	%l0,	%i5,	%i7
	alignaddr	%o3,	%i6,	%l1
	movle	%icc,	%i1,	%i3
	fbl	%fcc2,	loop_240
	tgu	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o2
loop_240:
	sdivx	%g4,	0x199D,	%o4
	tsubcc	%o0,	0x18EA,	%l5
	tcs	%icc,	0x6
	movcc	%icc,	%l3,	%l6
	nop
	setx	0xF8F4A880,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x3339AC2F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f30,	%f3
	stb	%l2,	[%l7 + 0x2C]
	orncc	%o1,	%i2,	%o6
	tneg	%xcc,	0x4
	stbar
	movg	%icc,	%g3,	%g7
	nop
	setx	0xC0439734404131CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	tsubcc	%g2,	0x0A4D,	%i0
	tsubcctv	%o5,	0x116B,	%g6
	mulx	%i4,	%l4,	%g1
	bne	%xcc,	loop_241
	movvc	%icc,	%g5,	%l0
	nop
	setx	0x717FBCB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f4
	fnot1	%f20,	%f30
loop_241:
	fones	%f10
	movl	%xcc,	%i5,	%i7
	tn	%icc,	0x3
	tge	%xcc,	0x2
	tg	%xcc,	0x6
	nop
	setx	0xE1443C74,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xB3A8DDD2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f21,	%f3
	movleu	%icc,	%o3,	%o7
	bl,a	%xcc,	loop_242
	bvc,a	%icc,	loop_243
	udivcc	%l1,	0x0A77,	%i1
	tneg	%icc,	0x5
loop_242:
	movvs	%xcc,	%i6,	%o2
loop_243:
	tcs	%xcc,	0x6
	srl	%i3,	0x1B,	%g4
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o0
	movrgz	%o4,	%l5,	%l6
	tle	%xcc,	0x1
	fmovscs	%xcc,	%f1,	%f3
	fnands	%f9,	%f30,	%f24
	alignaddrl	%l3,	%o1,	%l2
	movneg	%xcc,	%i2,	%o6
	fbl	%fcc1,	loop_244
	edge16l	%g7,	%g2,	%i0
	movre	%o5,	0x2CD,	%g3
	popc	%i4,	%l4
loop_244:
	udiv	%g1,	0x1045,	%g5
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x5D] %asi,	%g6
	movneg	%icc,	%l0,	%i5
	ldsb	[%l7 + 0x4F],	%i7
	edge32l	%o7,	%l1,	%i1
	fbul	%fcc0,	loop_245
	pdist	%f28,	%f18,	%f2
	nop
	fitod	%f2,	%f26
	fdtox	%f26,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_245:
	subccc	%o3,	%o2,	%i3
	tge	%icc,	0x7
	fpmerge	%f17,	%f25,	%f16
	fbue,a	%fcc1,	loop_246
	edge16	%i6,	%o0,	%g4
	umulcc	%o4,	%l5,	%l3
	movl	%icc,	%l6,	%l2
loop_246:
	fbuge	%fcc1,	loop_247
	movrgz	%i2,	%o6,	%g7
	ba,a,pt	%icc,	loop_248
	udiv	%g2,	0x15BC,	%i0
loop_247:
	udivcc	%o5,	0x1DA9,	%g3
	fmovrsne	%i4,	%f30,	%f15
loop_248:
	addccc	%o1,	%g1,	%g5
	popc	%g6,	%l0
	mova	%icc,	%l4,	%i7
	edge16ln	%i5,	%o7,	%l1
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o3
	xorcc	%i1,	%i3,	%i6
	set	0x56, %i0
	stha	%o0,	[%l7 + %i0] 0x88
	xnorcc	%o2,	%g4,	%o4
	nop
	fitod	%f9,	%f12
	movrgez	%l5,	0x153,	%l3
	movleu	%xcc,	%l2,	%i2
	addc	%o6,	0x106E,	%g7
	movrne	%g2,	%i0,	%o5
	udivcc	%l6,	0x17C4,	%i4
	addcc	%g3,	%g1,	%g5
	fmovrdlez	%o1,	%f2,	%f10
	udivcc	%g6,	0x14A1,	%l0
	tcc	%icc,	0x6
	sdiv	%l4,	0x157E,	%i7
	ldstub	[%l7 + 0x52],	%o7
	fmovdvc	%icc,	%f24,	%f27
	bvs,a,pt	%icc,	loop_249
	fmovrde	%l1,	%f26,	%f28
	tsubcctv	%o3,	0x1BD3,	%i5
	and	%i1,	%i3,	%o0
loop_249:
	taddcctv	%o2,	0x0FD9,	%i6
	fmovsne	%xcc,	%f13,	%f8
	movrgez	%o4,	%g4,	%l5
	fmovrdne	%l3,	%f26,	%f4
	set	0x68, %o1
	ldswa	[%l7 + %o1] 0x88,	%i2
	tcc	%xcc,	0x4
	fmuld8ulx16	%f11,	%f13,	%f10
	ba	loop_250
	andn	%l2,	%o6,	%g2
	edge16	%g7,	%i0,	%o5
	movvc	%icc,	%l6,	%g3
loop_250:
	tvs	%icc,	0x1
	srax	%i4,	0x0C,	%g1
	ba,a	loop_251
	fbul	%fcc1,	loop_252
	movrne	%o1,	0x3E1,	%g6
	sub	%g5,	0x00AA,	%l0
loop_251:
	sdivx	%l4,	0x038F,	%i7
loop_252:
	xorcc	%l1,	0x0C93,	%o7
	addc	%i5,	0x13C7,	%o3
	tsubcctv	%i1,	%o0,	%i3
	te	%icc,	0x0
	fmovdvc	%icc,	%f0,	%f19
	fands	%f10,	%f27,	%f5
	fmovrsgz	%i6,	%f11,	%f14
	array8	%o2,	%g4,	%o4
	srlx	%l5,	0x1F,	%i2
	nop
	setx	loop_253,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%l2,	%o6,	%g2
	fble,a	%fcc2,	loop_254
	fba,a	%fcc0,	loop_255
loop_253:
	bneg,a,pt	%xcc,	loop_256
	nop
	fitod	%f10,	%f4
	fdtoi	%f4,	%f14
loop_254:
	subcc	%g7,	0x0EBB,	%i0
loop_255:
	lduh	[%l7 + 0x34],	%l3
loop_256:
	lduh	[%l7 + 0x4A],	%o5
	and	%l6,	%g3,	%g1
	sdiv	%o1,	0x1CDC,	%g6
	movn	%icc,	%g5,	%i4
	stbar
	edge8	%l4,	%i7,	%l0
	srlx	%l1,	0x1F,	%i5
	sethi	0x11D6,	%o7
	fmovdcs	%xcc,	%f5,	%f6
	sir	0x110C
	movg	%icc,	%i1,	%o3
	fmovrse	%o0,	%f2,	%f24
	sub	%i6,	0x1642,	%o2
	wr	%g0,	0x88,	%asi
	sta	%f31,	[%l7 + 0x44] %asi
	sir	0x1F15
	edge16ln	%g4,	%i3,	%o4
	movcc	%icc,	%i2,	%l2
	fble	%fcc1,	loop_257
	bleu	%icc,	loop_258
	add	%o6,	0x12B5,	%g2
	umul	%g7,	0x1821,	%i0
loop_257:
	udiv	%l5,	0x1C1F,	%l3
loop_258:
	membar	0x5C
	nop
	setx	0x8DE05C240059ED53,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	te	%xcc,	0x2
	fbg	%fcc0,	loop_259
	ta	%icc,	0x5
	movre	%l6,	%g3,	%o5
	stw	%o1,	[%l7 + 0x5C]
loop_259:
	fmul8ulx16	%f8,	%f20,	%f22
	edge8l	%g1,	%g5,	%g6
	alignaddr	%l4,	%i7,	%i4
	fmovsgu	%icc,	%f4,	%f28
	popc	%l0,	%l1
	array16	%i5,	%i1,	%o7
	taddcc	%o0,	%i6,	%o3
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x89
	popc	0x0F52,	%g4
	srlx	%i3,	%o2,	%o4
	andcc	%l2,	0x00DB,	%o6
	movrgz	%g2,	0x159,	%i2
	tge	%xcc,	0x5
	brgz	%g7,	loop_260
	edge32n	%l5,	%l3,	%l6
	movrlz	%g3,	%i0,	%o5
	taddcctv	%o1,	0x1204,	%g1
loop_260:
	fmovsg	%xcc,	%f31,	%f0
	addcc	%g6,	0x100C,	%g5
	fxors	%f13,	%f11,	%f14
	fmovdge	%xcc,	%f4,	%f1
	bge,pt	%xcc,	loop_261
	membar	0x65
	sdivcc	%l4,	0x04FC,	%i4
	fbue	%fcc3,	loop_262
loop_261:
	sdivcc	%l0,	0x08D0,	%i7
	subc	%l1,	%i5,	%i1
	movrne	%o7,	%i6,	%o0
loop_262:
	fnands	%f25,	%f18,	%f8
	movle	%xcc,	%g4,	%o3
	srlx	%i3,	0x10,	%o4
	array8	%l2,	%o2,	%g2
	xnorcc	%i2,	0x0E2A,	%g7
	movl	%xcc,	%o6,	%l3
	tleu	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f23,	%f18
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	popc	0x0EBB,	%l5
	movre	%g3,	%l6,	%o5
	sdiv	%i0,	0x0E76,	%g1
	sra	%g6,	%g5,	%o1
	nop
	setx	0x37430D354C36E5C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xBA7DBB9106AA7658,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f0,	%f2
	movg	%xcc,	%i4,	%l4
	fba	%fcc0,	loop_263
	fpack16	%f12,	%f31
	fbl,a	%fcc3,	loop_264
	udiv	%i7,	0x04C9,	%l1
loop_263:
	addcc	%i5,	%i1,	%l0
	mova	%xcc,	%i6,	%o0
loop_264:
	tgu	%xcc,	0x6
	xorcc	%g4,	0x17DB,	%o3
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x18
	fpsub32	%f26,	%f28,	%f24
	fba	%fcc0,	loop_265
	tl	%xcc,	0x7
	sethi	0x0A15,	%o7
	set	0x52, %l4
	ldstuba	[%l7 + %l4] 0x80,	%o4
loop_265:
	mulscc	%l2,	%o2,	%g2
	edge32l	%i2,	%i3,	%g7
	nop
	setx	0x78FAB343A6B6C6F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xC8DE37830CAB9B4F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f12,	%f24
	movvc	%xcc,	%o6,	%l5
	fpackfix	%f0,	%f24
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	array8	%g3,	%l3,	%l6
	movn	%xcc,	%i0,	%o5
	subc	%g1,	0x0D62,	%g5
	tsubcctv	%g6,	%i4,	%l4
	srlx	%i7,	0x1A,	%l1
	fbl	%fcc1,	loop_266
	ta	%xcc,	0x4
	ldd	[%l7 + 0x28],	%i4
	ldsw	[%l7 + 0x10],	%o1
loop_266:
	srlx	%i1,	%l0,	%i6
	fmul8ulx16	%f8,	%f8,	%f28
	fzeros	%f16
	movge	%icc,	%o0,	%g4
	and	%o3,	0x0A0F,	%o7
	te	%icc,	0x2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x70] %asi,	%o4
	alignaddr	%o2,	%g2,	%i2
	fcmpeq16	%f4,	%f18,	%l2
	alignaddrl	%g7,	%o6,	%i3
	movgu	%xcc,	%l5,	%l3
	tl	%xcc,	0x6
	tgu	%icc,	0x3
	movrgz	%l6,	%g3,	%i0
	movg	%icc,	%o5,	%g5
	move	%icc,	%g6,	%i4
	pdist	%f16,	%f2,	%f8
	set	0x7C, %l2
	lduwa	[%l7 + %l2] 0x80,	%l4
	sub	%i7,	0x13ED,	%g1
	fxnor	%f26,	%f20,	%f2
	sll	%l1,	%i5,	%o1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	taddcctv	%i6,	%i1,	%o0
	array32	%o3,	%g4,	%o4
	fornot2s	%f25,	%f9,	%f9
	fcmpgt32	%f2,	%f30,	%o2
	umulcc	%g2,	0x0C4D,	%i2
	tl	%icc,	0x3
	set	0x18, %o4
	lduwa	[%l7 + %o4] 0x14,	%o7
	set	0x70, %i5
	ldswa	[%l7 + %i5] 0x18,	%g7
	edge32	%o6,	%l2,	%l5
	array8	%l3,	%i3,	%g3
	movcs	%xcc,	%l6,	%i0
	movle	%xcc,	%g5,	%o5
	array32	%i4,	%l4,	%i7
	sra	%g6,	0x1F,	%g1
	smul	%l1,	0x0311,	%i5
	fmul8ulx16	%f2,	%f4,	%f2
	mulscc	%o1,	0x03A3,	%i6
	movleu	%xcc,	%i1,	%l0
	edge32ln	%o0,	%o3,	%g4
	fmovdleu	%icc,	%f15,	%f5
	ldstub	[%l7 + 0x27],	%o4
	udivcc	%o2,	0x09D6,	%g2
	fand	%f26,	%f4,	%f4
	bn,a,pt	%icc,	loop_267
	st	%f28,	[%l7 + 0x0C]
	fmovsne	%icc,	%f11,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_267:
	sdivcc	%i2,	0x0E55,	%g7
	brgz,a	%o6,	loop_268
	array32	%l2,	%o7,	%l5
	fbug,a	%fcc1,	loop_269
	bneg,a	%icc,	loop_270
loop_268:
	nop
	fitod	%f12,	%f6
	fbu	%fcc3,	loop_271
loop_269:
	sub	%i3,	0x09BD,	%g3
loop_270:
	mulx	%l6,	%i0,	%g5
	udiv	%l3,	0x0F67,	%o5
loop_271:
	subcc	%i4,	0x1427,	%i7
	ble	loop_272
	tg	%xcc,	0x6
	andn	%g6,	0x14F1,	%l4
	edge32l	%l1,	%i5,	%o1
loop_272:
	brlez	%g1,	loop_273
	tg	%icc,	0x4
	te	%icc,	0x0
	edge32	%i1,	%i6,	%l0
loop_273:
	addccc	%o0,	%g4,	%o3
	edge32l	%o2,	%g2,	%o4
	tvs	%xcc,	0x2
	subccc	%i2,	%o6,	%l2
	taddcc	%g7,	0x00ED,	%l5
	fmul8sux16	%f8,	%f14,	%f10
	udiv	%i3,	0x033C,	%g3
	fabsd	%f0,	%f8
	edge16ln	%l6,	%o7,	%i0
	and	%g5,	0x1D0E,	%o5
	orcc	%l3,	0x045E,	%i7
	brgez,a	%g6,	loop_274
	fbge	%fcc2,	loop_275
	nop
	set	0x4C, %g6
	lduw	[%l7 + %g6],	%i4
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f12
	fxtod	%f12,	%f18
loop_274:
	subcc	%l1,	0x07C2,	%i5
loop_275:
	movpos	%xcc,	%l4,	%g1
	fornot1s	%f20,	%f3,	%f24
	edge16ln	%o1,	%i1,	%l0
	movne	%xcc,	%i6,	%g4
	fbl	%fcc1,	loop_276
	edge8n	%o3,	%o0,	%o2
	taddcctv	%o4,	0x1E67,	%i2
	brgez,a	%g2,	loop_277
loop_276:
	edge32n	%l2,	%o6,	%g7
	fpack32	%f26,	%f30,	%f30
	sdiv	%l5,	0x188D,	%g3
loop_277:
	movrlez	%i3,	0x06A,	%o7
	move	%icc,	%i0,	%l6
	tg	%xcc,	0x2
	movge	%icc,	%o5,	%l3
	fble	%fcc2,	loop_278
	stb	%g5,	[%l7 + 0x1A]
	xnorcc	%i7,	0x07EF,	%i4
	fors	%f25,	%f2,	%f30
loop_278:
	brgez	%l1,	loop_279
	taddcctv	%i5,	0x1FE6,	%l4
	array32	%g6,	%g1,	%i1
	addccc	%o1,	%i6,	%l0
loop_279:
	fbl,a	%fcc2,	loop_280
	edge8l	%g4,	%o3,	%o2
	brlez	%o0,	loop_281
	nop
	fitod	%f24,	%f16
loop_280:
	fmovde	%icc,	%f4,	%f13
	alignaddrl	%o4,	%i2,	%l2
loop_281:
	fpsub16s	%f0,	%f20,	%f0
	std	%f30,	[%l7 + 0x40]
	xorcc	%g2,	0x0DAA,	%g7
	sethi	0x09FF,	%l5
	tle	%xcc,	0x3
	sdivx	%g3,	0x0E4F,	%o6
	udiv	%i3,	0x0F11,	%i0
	tvs	%xcc,	0x0
	tn	%icc,	0x3
	movrgz	%o7,	%o5,	%l3
	fnot2s	%f30,	%f10
	fble	%fcc3,	loop_282
	fmovsg	%icc,	%f8,	%f0
	andcc	%g5,	0x0960,	%i7
	membar	0x45
loop_282:
	nop
	wr	%g0,	0x0c,	%asi
	stwa	%l6,	[%l7 + 0x18] %asi
	alignaddrl	%i4,	%i5,	%l4
	edge32ln	%g6,	%g1,	%i1
	fmovsne	%icc,	%f3,	%f20
	udiv	%o1,	0x0C18,	%l1
	sth	%i6,	[%l7 + 0x3A]
	sllx	%l0,	%o3,	%g4
	subcc	%o0,	%o2,	%o4
	set	0x70, %o5
	stba	%i2,	[%l7 + %o5] 0x10
	ldsh	[%l7 + 0x64],	%l2
	udivcc	%g2,	0x083F,	%g7
	edge16l	%g3,	%o6,	%l5
	xnorcc	%i3,	%o7,	%i0
	movge	%xcc,	%o5,	%l3
	movvs	%xcc,	%i7,	%l6
	fbe	%fcc3,	loop_283
	bge,pt	%xcc,	loop_284
	tvs	%xcc,	0x1
	stb	%i4,	[%l7 + 0x2F]
loop_283:
	xor	%i5,	%g5,	%l4
loop_284:
	sra	%g1,	0x0B,	%i1
	movle	%xcc,	%g6,	%l1
	fmovd	%f22,	%f16
	fsrc1s	%f31,	%f7
	udivx	%o1,	0x1D8A,	%i6
	nop
	set	0x28, %l1
	ldub	[%l7 + %l1],	%l0
	mulx	%o3,	0x1F70,	%o0
	tg	%icc,	0x3
	stx	%o2,	[%l7 + 0x30]
	nop
	setx	0x7340BA8A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x55B82F82,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f7,	%f20
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x30] %asi,	%g4
	fbge,a	%fcc0,	loop_285
	fmovrdgz	%o4,	%f26,	%f24
	movneg	%xcc,	%i2,	%l2
	sdiv	%g7,	0x0C8B,	%g3
loop_285:
	umulcc	%g2,	0x0FCB,	%l5
	addccc	%o6,	0x155B,	%o7
	nop
	setx	0xC33B7D2F61F7FDE7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xEE3A0064406D7B64,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f30,	%f16
	nop
	setx	loop_286,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbl,a	%fcc0,	loop_287
	xnor	%i3,	0x04FA,	%i0
	udivx	%l3,	0x0522,	%o5
loop_286:
	sll	%l6,	%i4,	%i5
loop_287:
	movpos	%icc,	%g5,	%i7
	orn	%l4,	%g1,	%i1
	edge32	%l1,	%o1,	%g6
	array16	%l0,	%o3,	%i6
	movpos	%xcc,	%o0,	%g4
	add	%o2,	%i2,	%l2
	wr	%g0,	0x22,	%asi
	stxa	%g7,	[%l7 + 0x08] %asi
	membar	#Sync
	array16	%g3,	%g2,	%l5
	ldsb	[%l7 + 0x0E],	%o4
	smul	%o7,	%i3,	%i0
	sir	0x1ED6
	edge32	%o6,	%l3,	%l6
	taddcctv	%i4,	0x10E4,	%o5
	movle	%icc,	%i5,	%i7
	subcc	%g5,	%l4,	%i1
	umul	%g1,	%l1,	%o1
	addc	%g6,	%l0,	%o3
	nop
	setx	loop_288,	%l0,	%l1
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
	addccc	%i6,	%g4,	%o2
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_288:
	fnands	%f11,	%f12,	%f23
	sdiv	%i2,	0x10AB,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g7,	0x0D,	%g3
	fmovdle	%icc,	%f18,	%f1
	fpsub16	%f8,	%f24,	%f28
	fandnot2	%f26,	%f12,	%f0
	flush	%l7 + 0x2C
	fmovsl	%icc,	%f22,	%f19
	array8	%l2,	%g2,	%o4
	tleu	%xcc,	0x5
	set	0x20, %i3
	stwa	%l5,	[%l7 + %i3] 0xe3
	membar	#Sync
	fzero	%f24
	fmovrdlz	%o7,	%f12,	%f16
	edge32l	%i0,	%i3,	%o6
	edge32l	%l3,	%i4,	%o5
	xorcc	%l6,	0x00BB,	%i5
	ldd	[%l7 + 0x28],	%f30
	edge8l	%i7,	%g5,	%i1
	swap	[%l7 + 0x10],	%l4
	movle	%icc,	%l1,	%o1
	fmovsg	%xcc,	%f13,	%f14
	fmovscs	%xcc,	%f18,	%f17
	movcs	%xcc,	%g1,	%l0
	orn	%o3,	%g6,	%g4
	bne	%icc,	loop_289
	tneg	%xcc,	0x2
	edge32n	%o2,	%i6,	%i2
	set	0x6C, %l6
	stwa	%o0,	[%l7 + %l6] 0xeb
	membar	#Sync
loop_289:
	fornot1	%f20,	%f28,	%f0
	fmovd	%f28,	%f6
	popc	0x140E,	%g7
	edge8l	%l2,	%g3,	%o4
	fbu	%fcc0,	loop_290
	edge8ln	%l5,	%g2,	%i0
	membar	0x37
	movpos	%xcc,	%i3,	%o6
loop_290:
	fexpand	%f13,	%f4
	brlez,a	%o7,	loop_291
	tneg	%icc,	0x2
	edge16l	%l3,	%i4,	%l6
	mulx	%o5,	%i5,	%i7
loop_291:
	te	%xcc,	0x4
	nop
	fitos	%f11,	%f14
	fstod	%f14,	%f22
	fornot2	%f4,	%f18,	%f24
	edge32n	%g5,	%l4,	%l1
	udiv	%o1,	0x0582,	%g1
	fbe,a	%fcc3,	loop_292
	fbule,a	%fcc3,	loop_293
	orn	%l0,	0x1B63,	%i1
	bg,a,pt	%xcc,	loop_294
loop_292:
	sub	%o3,	0x035B,	%g6
loop_293:
	edge8l	%g4,	%i6,	%i2
	mulscc	%o0,	0x0B3D,	%g7
loop_294:
	fba,a	%fcc3,	loop_295
	bneg,a	loop_296
	addcc	%o2,	%l2,	%o4
	fmovrdne	%l5,	%f4,	%f30
loop_295:
	call	loop_297
loop_296:
	tl	%icc,	0x3
	fble,a	%fcc2,	loop_298
	movrgz	%g3,	0x374,	%i0
loop_297:
	sra	%g2,	0x04,	%i3
	fandnot1	%f2,	%f14,	%f30
loop_298:
	nop
	setx	0x105861D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	array16	%o7,	%l3,	%i4
	fandnot2s	%f15,	%f16,	%f26
	nop
	setx	0xB1B93484,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x3417431D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f18,	%f6
	nop
	setx	0x1052E2E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	srl	%l6,	%o5,	%o6
	tne	%xcc,	0x1
	edge8ln	%i5,	%i7,	%g5
	edge8n	%l1,	%o1,	%g1
	movg	%icc,	%l4,	%l0
	orn	%o3,	%i1,	%g6
	set	0x64, %o6
	swapa	[%l7 + %o6] 0x11,	%i6
	udiv	%g4,	0x0B5D,	%i2
	fnegd	%f18,	%f22
	fandnot2s	%f20,	%f6,	%f22
	fbe	%fcc3,	loop_299
	addcc	%g7,	%o2,	%o0
	movneg	%icc,	%o4,	%l2
	nop
	setx	loop_300,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_299:
	move	%xcc,	%l5,	%g3
	nop
	fitos	%f8,	%f1
	fstox	%f1,	%f28
	fxtos	%f28,	%f23
	fmovrdlez	%g2,	%f14,	%f0
loop_300:
	umulcc	%i3,	%o7,	%i0
	fmuld8ulx16	%f27,	%f0,	%f22
	tsubcc	%l3,	%i4,	%l6
	ldsb	[%l7 + 0x16],	%o5
	sra	%i5,	0x01,	%o6
	nop
	setx	0x21F1F050754AE45F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x658514901812FB28,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f14,	%f26
	ldub	[%l7 + 0x3F],	%g5
	sra	%i7,	0x1F,	%o1
	movcs	%xcc,	%l1,	%g1
	edge8ln	%l0,	%l4,	%i1
	movleu	%icc,	%g6,	%i6
	fmovspos	%xcc,	%f8,	%f30
	bge,pn	%xcc,	loop_301
	fmovdvs	%xcc,	%f7,	%f9
	fmovscc	%icc,	%f12,	%f14
	udiv	%o3,	0x1051,	%g4
loop_301:
	srax	%i2,	%o2,	%g7
	fmul8x16au	%f10,	%f21,	%f10
	tsubcc	%o4,	%l2,	%o0
	bcs,pt	%icc,	loop_302
	bne,pt	%icc,	loop_303
	fornot2	%f18,	%f26,	%f24
	tsubcc	%g3,	%l5,	%g2
loop_302:
	srlx	%i3,	0x0C,	%o7
loop_303:
	sll	%i0,	0x0E,	%i4
	lduw	[%l7 + 0x68],	%l3
	fmovdge	%xcc,	%f25,	%f23
	brgz	%o5,	loop_304
	edge16l	%i5,	%o6,	%g5
	bvs,a,pn	%icc,	loop_305
	ldstub	[%l7 + 0x1F],	%l6
loop_304:
	tpos	%icc,	0x7
	stb	%i7,	[%l7 + 0x78]
loop_305:
	nop
	setx	0xF10857E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xCB9DC2E8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f10,	%f17
	bgu,a,pt	%xcc,	loop_306
	umulcc	%l1,	%g1,	%l0
	nop
	fitos	%f14,	%f20
	fstox	%f20,	%f18
	tneg	%xcc,	0x5
loop_306:
	be,a	%icc,	loop_307
	ldub	[%l7 + 0x15],	%l4
	sllx	%i1,	%o1,	%g6
	fmovdg	%icc,	%f12,	%f14
loop_307:
	popc	%i6,	%g4
	bneg,pt	%xcc,	loop_308
	array32	%i2,	%o3,	%g7
	tvc	%xcc,	0x7
	movrlz	%o2,	0x026,	%o4
loop_308:
	sdiv	%l2,	0x1455,	%o0
	smul	%g3,	0x0771,	%l5
	bneg	loop_309
	subcc	%g2,	0x02AF,	%o7
	edge32n	%i3,	%i0,	%l3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
loop_309:
	fsrc1s	%f21,	%f14
	sra	%i4,	0x17,	%o6
	orncc	%g5,	0x181F,	%i5
	xorcc	%i7,	%l1,	%l6
	movl	%xcc,	%l0,	%l4
	fexpand	%f5,	%f6
	movn	%icc,	%i1,	%o1
	tcc	%xcc,	0x1
	array16	%g6,	%i6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i2,	%o3,	%g7
	nop
	setx	0x49E84D55F44AC572,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f26
	nop
	set	0x6C, %o7
	sth	%g4,	[%l7 + %o7]
	bl,a	loop_310
	tvc	%xcc,	0x6
	tne	%icc,	0x0
	tle	%icc,	0x3
loop_310:
	movn	%icc,	%o4,	%l2
	edge8	%o2,	%g3,	%l5
	fnors	%f23,	%f22,	%f14
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%o7
	subccc	%o0,	%i0,	%l3
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o5,	[%g0 + 0x180] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	prefetch	[%l7 + 0x64],	 0x0
	mulscc	%i4,	0x0048,	%i3
	movrgez	%g5,	0x3EB,	%i5
	fcmple32	%f20,	%f4,	%i7
	fxnors	%f27,	%f20,	%f24
	fandnot1s	%f27,	%f9,	%f29
	wr	%g0,	0x89,	%asi
	sta	%f28,	[%l7 + 0x68] %asi
	fmovdpos	%xcc,	%f17,	%f13
	movrlz	%o6,	0x372,	%l6
	xor	%l0,	%l1,	%l4
	nop
	fitod	%f12,	%f2
	fdtoi	%f2,	%f23
	sll	%o1,	%i1,	%g6
	srlx	%i6,	%i2,	%g1
	fornot2	%f28,	%f24,	%f30
	tn	%xcc,	0x0
	umul	%g7,	%g4,	%o3
	tneg	%xcc,	0x6
	array16	%l2,	%o2,	%o4
	orn	%g3,	%l5,	%g2
	tge	%xcc,	0x6
	fbug,a	%fcc1,	loop_311
	bge	loop_312
	movcc	%xcc,	%o0,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_311:
	edge16	%o7,	%l3,	%i4
loop_312:
	fors	%f10,	%f4,	%f14
	nop
	setx	loop_313,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8l	%o5,	%i3,	%g5
	tleu	%icc,	0x4
	wr	%g0,	0x11,	%asi
	stha	%i7,	[%l7 + 0x34] %asi
loop_313:
	nop
	set	0x44, %g1
	lduwa	[%l7 + %g1] 0x18,	%i5
	tne	%xcc,	0x1
	edge32ln	%l6,	%l0,	%l1
	set	0x1E, %l3
	lduha	[%l7 + %l3] 0x81,	%l4
	tneg	%xcc,	0x3
	add	%o6,	0x14F1,	%i1
	movrne	%g6,	0x2DD,	%o1
	sdivx	%i6,	0x0D44,	%i2
	taddcctv	%g7,	0x0BE4,	%g4
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x50] %asi,	%g1
	alignaddr	%l2,	%o2,	%o4
	fnegs	%f19,	%f28
	lduh	[%l7 + 0x6C],	%g3
	set	0x6A, %i7
	lduha	[%l7 + %i7] 0x15,	%o3
	subcc	%l5,	%o0,	%g2
	fandnot1	%f24,	%f10,	%f2
	bvs,pt	%icc,	loop_314
	tvs	%icc,	0x6
	umulcc	%o7,	%i0,	%i4
	set	0x3B, %g5
	stba	%o5,	[%l7 + %g5] 0x11
loop_314:
	fexpand	%f11,	%f0
	stw	%i3,	[%l7 + 0x50]
	movrgz	%g5,	0x09A,	%l3
	bneg,pt	%xcc,	loop_315
	fble	%fcc3,	loop_316
	bshuffle	%f26,	%f24,	%f12
	movvc	%icc,	%i5,	%i7
loop_315:
	edge8	%l0,	%l6,	%l1
loop_316:
	sdivcc	%o6,	0x1726,	%i1
	sll	%l4,	%g6,	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%i2,	%g7
	sdiv	%g4,	0x0AFF,	%g1
	fble,a	%fcc2,	loop_317
	tle	%icc,	0x4
	bgu,pn	%xcc,	loop_318
	or	%o1,	%o2,	%l2
loop_317:
	popc	%g3,	%o3
	srl	%o4,	0x14,	%l5
loop_318:
	movpos	%xcc,	%o0,	%g2
	bpos	%icc,	loop_319
	tneg	%icc,	0x0
	umul	%i0,	%i4,	%o5
	fnegd	%f12,	%f18
loop_319:
	edge32ln	%o7,	%g5,	%l3
	fbug	%fcc3,	loop_320
	movcs	%xcc,	%i5,	%i7
	fmul8x16al	%f15,	%f26,	%f20
	bg,a	loop_321
loop_320:
	sethi	0x1AB9,	%i3
	tl	%icc,	0x1
	fmovrsgez	%l6,	%f19,	%f28
loop_321:
	movneg	%xcc,	%l0,	%l1
	fandnot1s	%f22,	%f4,	%f4
	edge32l	%o6,	%l4,	%i1
	nop
	setx	loop_322,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbo	%fcc2,	loop_323
	srl	%g6,	0x09,	%i2
	fzeros	%f11
loop_322:
	movvc	%xcc,	%i6,	%g7
loop_323:
	fmovrslz	%g1,	%f19,	%f13
	srax	%g4,	%o2,	%l2
	smul	%g3,	0x0079,	%o1
	fmovsge	%icc,	%f18,	%f27
	mulscc	%o3,	%o4,	%o0
	tg	%xcc,	0x1
	fpadd16s	%f19,	%f11,	%f17
	edge8l	%l5,	%i0,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,a,pn	%icc,	loop_324
	movle	%icc,	%o5,	%o7
	movre	%g5,	0x028,	%l3
	wr	%g0,	0x2f,	%asi
	stba	%i5,	[%l7 + 0x79] %asi
	membar	#Sync
loop_324:
	ba,a	loop_325
	nop
	set	0x34, %g7
	prefetch	[%l7 + %g7],	 0x2
	wr	%g0,	0x81,	%asi
	stha	%g2,	[%l7 + 0x3E] %asi
loop_325:
	andn	%i7,	%l6,	%i3
	movle	%xcc,	%l1,	%l0
	add	%o6,	0x123E,	%l4
	bleu,a	loop_326
	bleu,pn	%xcc,	loop_327
	ldub	[%l7 + 0x38],	%g6
	fcmpeq32	%f0,	%f22,	%i1
loop_326:
	orncc	%i2,	%g7,	%g1
loop_327:
	movre	%g4,	%o2,	%l2
	movrlz	%g3,	%o1,	%i6
	sdiv	%o3,	0x1D3C,	%o4
	tcs	%xcc,	0x6
	movvs	%xcc,	%o0,	%i0
	bl,pn	%xcc,	loop_328
	prefetch	[%l7 + 0x6C],	 0x2
	xorcc	%i4,	%l5,	%o7
	fornot2s	%f23,	%f22,	%f18
loop_328:
	ba,pt	%icc,	loop_329
	fornot2	%f14,	%f16,	%f2
	ldsb	[%l7 + 0x49],	%o5
	sub	%g5,	%l3,	%g2
loop_329:
	movre	%i5,	%l6,	%i7
	edge8l	%i3,	%l0,	%o6
	fbge	%fcc1,	loop_330
	udiv	%l1,	0x0143,	%g6
	movrne	%l4,	0x039,	%i2
	addccc	%i1,	%g1,	%g4
loop_330:
	fbule	%fcc2,	loop_331
	fpsub16s	%f8,	%f7,	%f23
	andcc	%o2,	%g7,	%g3
	fnot1	%f2,	%f0
loop_331:
	edge32l	%l2,	%i6,	%o3
	array32	%o1,	%o4,	%i0
	movneg	%xcc,	%o0,	%i4
	srl	%l5,	0x17,	%o7
	sdivx	%g5,	0x008D,	%o5
	movvs	%xcc,	%g2,	%i5
	movg	%xcc,	%l3,	%l6
	orn	%i3,	%i7,	%l0
	umulcc	%l1,	0x1909,	%o6
	tl	%icc,	0x6
	nop
	fitod	%f6,	%f0
	fdtoi	%f0,	%f23
	tgu	%xcc,	0x0
	fpadd32s	%f4,	%f1,	%f25
	fpack32	%f10,	%f10,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f20
	popc	%l4,	%g6
	set	0x60, %g2
	ldswa	[%l7 + %g2] 0x11,	%i1
	movle	%icc,	%g1,	%i2
	fmul8x16au	%f17,	%f24,	%f26
	movne	%xcc,	%o2,	%g7
	tpos	%xcc,	0x3
	fpsub16	%f8,	%f26,	%f20
	tle	%xcc,	0x4
	movle	%xcc,	%g3,	%g4
	brz,a	%i6,	loop_332
	movn	%icc,	%o3,	%l2
	nop
	fitos	%f1,	%f23
	fstod	%f23,	%f18
	fpackfix	%f26,	%f17
loop_332:
	edge32	%o4,	%o1,	%o0
	fornot2s	%f29,	%f14,	%f31
	alignaddr	%i0,	%i4,	%l5
	srax	%o7,	0x10,	%g5
	srlx	%g2,	0x09,	%i5
	ldd	[%l7 + 0x10],	%l2
	fbge,a	%fcc3,	loop_333
	fmovrsne	%l6,	%f14,	%f20
	andn	%o5,	%i3,	%l0
	fmovsl	%icc,	%f29,	%f22
loop_333:
	for	%f12,	%f30,	%f18
	fmovrdgez	%l1,	%f30,	%f22
	edge32n	%i7,	%o6,	%g6
	umulcc	%l4,	0x1DBB,	%i1
	brnz	%g1,	loop_334
	smul	%i2,	0x0AEA,	%o2
	movrlz	%g3,	0x3F9,	%g7
	flush	%l7 + 0x24
loop_334:
	addc	%g4,	0x0EAA,	%o3
	movrgz	%i6,	%l2,	%o4
	fbg	%fcc0,	loop_335
	sra	%o0,	%o1,	%i4
	movpos	%icc,	%i0,	%l5
	tleu	%icc,	0x5
loop_335:
	fbu,a	%fcc2,	loop_336
	fnot2s	%f0,	%f20
	movrlz	%g5,	%g2,	%i5
	subc	%l3,	0x0A08,	%o7
loop_336:
	fxor	%f22,	%f6,	%f12
	array16	%l6,	%i3,	%o5
	taddcc	%l1,	%i7,	%l0
	brnz	%g6,	loop_337
	taddcc	%o6,	0x0E30,	%i1
	srax	%l4,	0x1B,	%i2
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%o2
loop_337:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f25,	%f13,	%f20
	movrne	%g1,	0x1A3,	%g3
	bge,a,pt	%xcc,	loop_338
	fmovdgu	%icc,	%f20,	%f15
	fnegs	%f29,	%f3
	ldx	[%l7 + 0x78],	%g7
loop_338:
	movvc	%icc,	%o3,	%i6
	fmovsg	%xcc,	%f10,	%f24
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1E] %asi,	%l2
	sra	%o4,	0x05,	%o0
	fbuge,a	%fcc2,	loop_339
	orcc	%o1,	%g4,	%i4
	sra	%i0,	0x0A,	%l5
	subcc	%g5,	%i5,	%g2
loop_339:
	popc	0x0766,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%l2
	edge16	%i3,	%l6,	%o5
	te	%xcc,	0x3
	sra	%i7,	0x0A,	%l1
	movgu	%xcc,	%g6,	%o6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	movcs	%xcc,	%l0,	%l4
	membar	0x78
	movg	%icc,	%o2,	%g1
	edge16n	%g3,	%g7,	%i2
	bpos,a,pn	%xcc,	loop_340
	smulcc	%i6,	%o3,	%o4
	fandnot1	%f14,	%f30,	%f2
	edge32l	%l2,	%o1,	%o0
loop_340:
	tl	%xcc,	0x3
	ta	%icc,	0x7
	te	%xcc,	0x6
	brz,a	%i4,	loop_341
	movgu	%icc,	%g4,	%i0
	and	%l5,	%g5,	%i5
	fornot1s	%f2,	%f23,	%f26
loop_341:
	tsubcctv	%g2,	%l3,	%i3
	ldsw	[%l7 + 0x5C],	%l6
	andcc	%o5,	%i7,	%l1
	fpackfix	%f8,	%f22
	sra	%g6,	%o6,	%o7
	movge	%icc,	%i1,	%l4
	edge8n	%o2,	%g1,	%l0
	nop
	set	0x38, %i1
	ldub	[%l7 + %i1],	%g3
	fble,a	%fcc2,	loop_342
	popc	%i2,	%i6
	tg	%icc,	0x5
	brlez	%g7,	loop_343
loop_342:
	array16	%o4,	%o3,	%l2
	srax	%o1,	0x08,	%o0
	array16	%g4,	%i0,	%l5
loop_343:
	stx	%g5,	[%l7 + 0x58]
	movneg	%xcc,	%i4,	%i5
	nop
	setx	0x70428F9F74B790A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x3422D3E6702E0A61,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f20,	%f0
	addcc	%l3,	0x0699,	%i3
	addccc	%l6,	0x12FD,	%o5
	edge32l	%g2,	%i7,	%g6
	sdivcc	%l1,	0x0452,	%o6
	movg	%icc,	%o7,	%i1
	sub	%o2,	%l4,	%g1
	sethi	0x14DB,	%g3
	edge8l	%l0,	%i2,	%i6
	bvs,a,pn	%xcc,	loop_344
	std	%f12,	[%l7 + 0x08]
	tvs	%icc,	0x3
	nop
	setx	0x280D115DBE4D4D70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xEA770D52E4881EE0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f30,	%f20
loop_344:
	fsrc1	%f30,	%f8
	bl,a	%icc,	loop_345
	array8	%g7,	%o4,	%l2
	xnorcc	%o1,	%o0,	%g4
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
loop_345:
	edge8	%l5,	%g5,	%i0
	srl	%i4,	0x0B,	%l3
	andncc	%i5,	%l6,	%i3
	addccc	%g2,	0x06F5,	%i7
	nop
	setx	0xF3FA540E27129E78,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x74769D476C9C117B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f6,	%f20
	edge16n	%g6,	%l1,	%o6
	nop
	fitod	%f2,	%f26
	fdtos	%f26,	%f19
	fnot2	%f18,	%f16
	flush	%l7 + 0x1C
	tl	%xcc,	0x4
	movrlz	%o5,	0x3C6,	%o7
	tne	%icc,	0x3
	te	%icc,	0x7
	xnor	%o2,	%l4,	%i1
	fmovsneg	%icc,	%f3,	%f21
	bgu,a	loop_346
	movleu	%icc,	%g3,	%l0
	movge	%icc,	%g1,	%i2
	fmovdvc	%icc,	%f23,	%f21
loop_346:
	fmovdgu	%icc,	%f17,	%f14
	mova	%xcc,	%i6,	%o4
	subc	%g7,	%o1,	%l2
	umulcc	%o0,	%g4,	%l5
	xnor	%g5,	0x0498,	%o3
	fmovdneg	%icc,	%f9,	%f21
	srax	%i4,	0x17,	%l3
	xnorcc	%i5,	0x0F98,	%i0
	array32	%i3,	%l6,	%i7
	tneg	%xcc,	0x0
	fmovdn	%icc,	%f24,	%f5
	andcc	%g6,	%l1,	%g2
	ldsh	[%l7 + 0x0E],	%o6
	tl	%xcc,	0x1
	ldd	[%l7 + 0x50],	%f10
	tgu	%icc,	0x0
	sethi	0x1D31,	%o7
	movgu	%xcc,	%o2,	%l4
	sdivx	%i1,	0x1C3F,	%g3
	smulcc	%o5,	%g1,	%l0
	fmovsn	%xcc,	%f30,	%f4
	tcs	%icc,	0x0
	fble	%fcc2,	loop_347
	tl	%xcc,	0x4
	movleu	%xcc,	%i6,	%i2
	fandnot2s	%f27,	%f1,	%f28
loop_347:
	fmovsleu	%icc,	%f28,	%f10
	popc	%g7,	%o4
	srax	%o1,	0x04,	%o0
	te	%xcc,	0x1
	movvc	%icc,	%l2,	%g4
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x28] %asi,	%g5
	fnot2s	%f26,	%f13
	movge	%icc,	%o3,	%i4
	fmovdn	%xcc,	%f14,	%f4
	movneg	%icc,	%l3,	%i5
	fmovdge	%icc,	%f15,	%f8
	movcs	%xcc,	%i0,	%i3
	move	%xcc,	%l6,	%i7
	subccc	%l5,	0x1D38,	%g6
	movrgez	%l1,	%g2,	%o7
	stbar
	membar	0x69
	mulscc	%o2,	0x00E6,	%l4
	umulcc	%i1,	%o6,	%o5
	fcmple16	%f8,	%f30,	%g1
	srlx	%l0,	0x12,	%i6
	set	0x10, %i4
	ldda	[%l7 + %i4] 0x14,	%i2
	ldd	[%l7 + 0x58],	%f30
	movre	%g3,	0x3BF,	%o4
	set	0x54, %o3
	ldstuba	[%l7 + %o3] 0x89,	%o1
	set	0x58, %l0
	stba	%g7,	[%l7 + %l0] 0x15
	subc	%o0,	0x1DCD,	%l2
	udiv	%g5,	0x030C,	%o3
	edge16ln	%g4,	%i4,	%l3
	movrlez	%i0,	0x16B,	%i3
	edge32l	%l6,	%i5,	%i7
	add	%l5,	%g6,	%l1
	fbe	%fcc0,	loop_348
	nop
	fitos	%f5,	%f0
	fstox	%f0,	%f16
	edge16ln	%g2,	%o7,	%l4
	fmovsgu	%icc,	%f28,	%f14
loop_348:
	nop
	setx	0x7393D743,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f17
	ldx	[%l7 + 0x30],	%i1
	bvs,a	%xcc,	loop_349
	subccc	%o2,	%o5,	%g1
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%o6
	mulx	%i6,	0x033C,	%l0
loop_349:
	tpos	%icc,	0x7
	ldub	[%l7 + 0x50],	%g3
	umul	%i2,	%o1,	%o4
	fnot2	%f24,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%xcc,	%f30,	%f4
	srlx	%o0,	%l2,	%g5
	srl	%g7,	%g4,	%o3
	fpsub32	%f4,	%f26,	%f26
	brz	%l3,	loop_350
	fmovdleu	%xcc,	%f0,	%f29
	srlx	%i0,	%i3,	%l6
	srlx	%i4,	0x12,	%i7
loop_350:
	fnands	%f1,	%f4,	%f27
	move	%icc,	%i5,	%g6
	fxnor	%f0,	%f0,	%f12
	addc	%l5,	0x0761,	%l1
	srax	%o7,	%g2,	%i1
	fcmpne16	%f6,	%f10,	%l4
	fmovdn	%icc,	%f10,	%f9
	movn	%xcc,	%o5,	%o2
	fxors	%f1,	%f28,	%f8
	move	%xcc,	%o6,	%i6
	tn	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrde	%l0,	%f14,	%f28
	popc	%g3,	%i2
	tg	%xcc,	0x5
	umul	%g1,	0x1BD4,	%o1
	lduh	[%l7 + 0x26],	%o0
	fbg,a	%fcc1,	loop_351
	fmovrdne	%l2,	%f0,	%f16
	movrne	%g5,	0x127,	%o4
	xor	%g4,	%g7,	%l3
loop_351:
	or	%o3,	%i0,	%i3
	andn	%i4,	0x1CA5,	%l6
	faligndata	%f18,	%f16,	%f14
	fble	%fcc2,	loop_352
	movrgz	%i7,	0x1B9,	%g6
	nop
	set	0x08, %i2
	stx	%i5,	[%l7 + %i2]
	edge8n	%l1,	%o7,	%g2
loop_352:
	fcmple16	%f2,	%f16,	%l5
	call	loop_353
	edge8n	%l4,	%i1,	%o5
	bne,a	%icc,	loop_354
	addcc	%o6,	0x0F7E,	%i6
loop_353:
	movle	%icc,	%o2,	%g3
	brnz	%i2,	loop_355
loop_354:
	edge32ln	%l0,	%o1,	%g1
	fmovdne	%xcc,	%f25,	%f19
	tcs	%xcc,	0x7
loop_355:
	xor	%l2,	0x12DD,	%g5
	mulx	%o0,	0x0124,	%g4
	tvs	%icc,	0x7
	xor	%o4,	0x0C31,	%l3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	move	%icc,	%i0,	%i3
	sra	%i4,	%l6,	%g7
	movgu	%xcc,	%i7,	%i5
	sth	%g6,	[%l7 + 0x70]
	sra	%l1,	0x09,	%g2
	tcs	%icc,	0x7
	fmovs	%f24,	%f0
	be,a,pt	%xcc,	loop_356
	tne	%xcc,	0x7
	andncc	%o7,	%l5,	%l4
	bn	loop_357
loop_356:
	fmovs	%f28,	%f8
	tvc	%icc,	0x7
	nop
	setx	0x9B264557,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x6F03D6A5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f19,	%f10
loop_357:
	fzeros	%f25
	edge8ln	%o5,	%i1,	%o6
	nop
	fitod	%f2,	%f22
	fdtos	%f22,	%f18
	fmovd	%f22,	%f10
	sub	%o2,	0x1C32,	%g3
	movrne	%i6,	0x3B5,	%i2
	add	%o1,	%g1,	%l2
	edge8ln	%l0,	%o0,	%g5
	movcc	%icc,	%o4,	%l3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x68] %asi,	%g4
	lduh	[%l7 + 0x74],	%i0
	edge16l	%i3,	%o3,	%i4
	taddcctv	%g7,	0x01C5,	%l6
	add	%i5,	%g6,	%l1
	set	0x18, %l5
	ldstuba	[%l7 + %l5] 0x0c,	%i7
	srax	%g2,	0x0B,	%o7
	tn	%icc,	0x2
	brnz,a	%l4,	loop_358
	fbule	%fcc1,	loop_359
	fabss	%f2,	%f30
	fmovse	%icc,	%f7,	%f20
loop_358:
	ldsw	[%l7 + 0x38],	%o5
loop_359:
	tsubcc	%i1,	%l5,	%o2
	st	%f26,	[%l7 + 0x10]
	fmovsleu	%xcc,	%f6,	%f30
	taddcc	%g3,	0x0F36,	%i6
	fornot1s	%f14,	%f14,	%f25
	movrlz	%o6,	0x244,	%i2
	orn	%o1,	0x1526,	%g1
	tge	%xcc,	0x2
	or	%l0,	0x037C,	%o0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x18] %asi,	%f8
	bvs,a	%icc,	loop_360
	orncc	%l2,	%o4,	%g5
	srax	%l3,	0x19,	%g4
	movrlz	%i3,	0x3A5,	%o3
loop_360:
	membar	0x6A
	movg	%xcc,	%i0,	%g7
	addcc	%i4,	0x1864,	%l6
	udivcc	%i5,	0x1FD7,	%l1
	ldstub	[%l7 + 0x16],	%i7
	edge32n	%g6,	%o7,	%l4
	fnot2	%f6,	%f22
	be,a	loop_361
	fmovspos	%icc,	%f30,	%f17
	fbul	%fcc2,	loop_362
	and	%o5,	%i1,	%l5
loop_361:
	nop
	fitos	%f10,	%f9
	fstoi	%f9,	%f9
	xnorcc	%g2,	%o2,	%g3
loop_362:
	movne	%icc,	%o6,	%i2
	xorcc	%o1,	%i6,	%g1
	sdiv	%o0,	0x089B,	%l0
	fmovs	%f13,	%f10
	tl	%xcc,	0x3
	udiv	%o4,	0x1AB1,	%l2
	srax	%l3,	%g4,	%i3
	fbug,a	%fcc2,	loop_363
	fornot1s	%f0,	%f1,	%f8
	bcc,a	loop_364
	fmovrdlez	%o3,	%f30,	%f12
loop_363:
	nop
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_364:
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x44] %asi,	%g5
	fmul8ulx16	%f14,	%f0,	%f30
	ldsb	[%l7 + 0x67],	%i0
	movleu	%icc,	%g7,	%i4
	addccc	%l6,	%i5,	%l1
	fmovsgu	%xcc,	%f21,	%f20
	movpos	%icc,	%i7,	%o7
	ldsb	[%l7 + 0x38],	%l4
	edge32ln	%o5,	%i1,	%l5
	tge	%icc,	0x3
	ba,a,pt	%xcc,	loop_365
	fmovscs	%xcc,	%f23,	%f19
	nop
	setx	loop_366,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsne	%xcc,	%f28,	%f22
loop_365:
	movcs	%icc,	%g6,	%g2
	movneg	%icc,	%g3,	%o6
loop_366:
	fmovdneg	%xcc,	%f18,	%f10
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i2
	orn	%o2,	0x01B7,	%o1
	bcc,pn	%xcc,	loop_367
	fpsub32s	%f30,	%f31,	%f7
	udiv	%i6,	0x156A,	%o0
	and	%g1,	%l0,	%l2
loop_367:
	nop
	set	0x3C, %i6
	swapa	[%l7 + %i6] 0x88,	%l3
	udivcc	%g4,	0x0203,	%o4
	mulscc	%o3,	0x1D3E,	%g5
	fmovrsgez	%i3,	%f24,	%f19
	fbne	%fcc3,	loop_368
	and	%i0,	%g7,	%l6
	tvs	%xcc,	0x3
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x0F] %asi,	%i4
loop_368:
	mulx	%l1,	%i7,	%o7
	subccc	%i5,	0x0C49,	%o5
	fmovrsgz	%i1,	%f4,	%f26
	sir	0x1170
	sra	%l5,	0x0B,	%g6
	fcmple16	%f2,	%f28,	%l4
	brgz	%g2,	loop_369
	nop
	setx	loop_370,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%icc,	%g3,	%i2
	move	%icc,	%o2,	%o1
loop_369:
	fmovda	%icc,	%f26,	%f13
loop_370:
	fcmpgt32	%f26,	%f28,	%o6
	addccc	%o0,	%g1,	%l0
	fmuld8sux16	%f0,	%f3,	%f22
	nop
	setx loop_371, %l0, %l1
	jmpl %l1, %i6
	movg	%xcc,	%l3,	%l2
	fba,a	%fcc0,	loop_372
	tsubcctv	%g4,	%o3,	%o4
loop_371:
	bge	loop_373
	addcc	%i3,	%i0,	%g7
loop_372:
	edge16n	%g5,	%l6,	%i4
	taddcctv	%i7,	%o7,	%i5
loop_373:
	movre	%l1,	%i1,	%o5
	mulscc	%g6,	%l4,	%l5
	sdivx	%g3,	0x0C6D,	%i2
	nop
	setx	loop_374,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tgu	%icc,	0x0
	nop
	setx	0x80792857,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	addccc	%g2,	0x03D4,	%o2
loop_374:
	fpmerge	%f28,	%f23,	%f24
	brgz,a	%o6,	loop_375
	ble,a	%xcc,	loop_376
	tg	%xcc,	0x1
	bcs,pt	%xcc,	loop_377
loop_375:
	movrne	%o0,	0x250,	%g1
loop_376:
	movrlez	%l0,	0x060,	%i6
	bcc,a,pn	%icc,	loop_378
loop_377:
	sdiv	%o1,	0x1F0E,	%l2
	edge8	%l3,	%o3,	%o4
	fsrc1	%f26,	%f6
loop_378:
	tneg	%xcc,	0x5
	srax	%g4,	%i3,	%g7
	xnor	%g5,	0x0A5F,	%i0
	fxnors	%f29,	%f27,	%f23
	edge16ln	%l6,	%i4,	%i7
	ld	[%l7 + 0x2C],	%f26
	edge32ln	%i5,	%l1,	%o7
	lduw	[%l7 + 0x30],	%i1
	edge32ln	%g6,	%l4,	%l5
	fpsub16s	%f25,	%f26,	%f2
	movvs	%icc,	%g3,	%o5
	movre	%g2,	%o2,	%o6
	bge,a	%xcc,	loop_379
	ba,a	loop_380
	tpos	%icc,	0x4
	sth	%i2,	[%l7 + 0x34]
loop_379:
	fmovrdlz	%o0,	%f28,	%f16
loop_380:
	nop
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g1
	addcc	%i6,	0x0483,	%l0
	addcc	%l2,	%l3,	%o1
	alignaddrl	%o3,	%o4,	%g4
	movrlez	%i3,	0x0FB,	%g7
	te	%xcc,	0x0
	subcc	%i0,	%g5,	%l6
	xnorcc	%i4,	%i5,	%i7
	array16	%o7,	%i1,	%l1
	edge16	%l4,	%l5,	%g6
	bl	%icc,	loop_381
	fnands	%f25,	%f1,	%f0
	fcmpeq32	%f12,	%f30,	%o5
	bg	%xcc,	loop_382
loop_381:
	udivx	%g3,	0x0384,	%o2
	andncc	%o6,	%i2,	%g2
	tvc	%icc,	0x5
loop_382:
	fbul	%fcc1,	loop_383
	sra	%o0,	%g1,	%i6
	tge	%xcc,	0x2
	orn	%l0,	0x1F9A,	%l2
loop_383:
	tneg	%icc,	0x7
	array8	%l3,	%o3,	%o1
	fmovs	%f4,	%f6
	sir	0x1961
	fpsub32	%f26,	%f30,	%f24
	movneg	%xcc,	%g4,	%i3
	popc	0x0E34,	%o4
	ldd	[%l7 + 0x70],	%g6
	xnor	%g5,	%i0,	%i4
	edge8ln	%l6,	%i7,	%i5
	fmovsge	%icc,	%f8,	%f10
	sdiv	%i1,	0x0052,	%o7
	edge32	%l1,	%l5,	%g6
	sethi	0x1A67,	%l4
	xorcc	%o5,	%o2,	%g3
	fmovsl	%icc,	%f6,	%f24
	fmovsgu	%xcc,	%f13,	%f22
	fmovspos	%xcc,	%f11,	%f27
	srlx	%i2,	0x07,	%g2
	sir	0x1363
	edge16ln	%o0,	%g1,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l0,	0x021D,	%i6
	ldub	[%l7 + 0x2E],	%l2
	tvc	%xcc,	0x0
	movpos	%xcc,	%o3,	%o1
	tgu	%icc,	0x2
	addcc	%l3,	%g4,	%o4
	addc	%i3,	0x137C,	%g7
	std	%f12,	[%l7 + 0x40]
	addcc	%i0,	0x0F76,	%i4
	smul	%g5,	%i7,	%l6
	edge32	%i5,	%o7,	%i1
	movcs	%icc,	%l1,	%l5
	movvs	%icc,	%g6,	%l4
	orn	%o2,	%o5,	%i2
	edge16l	%g3,	%o0,	%g2
	movle	%icc,	%o6,	%l0
	add	%l7,	0x24,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i6,	%l2
	nop
	setx	loop_384,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%icc,	%g1,	%o3
	movrgz	%l3,	0x30D,	%g4
	movvc	%icc,	%o4,	%i3
loop_384:
	popc	0x117D,	%g7
	mulscc	%o1,	0x1ACA,	%i4
	and	%i0,	%i7,	%g5
	fmovsgu	%xcc,	%f12,	%f1
	fmovrsne	%l6,	%f7,	%f8
	tcc	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f14,	%f28,	%f17
	fbn	%fcc2,	loop_385
	tne	%xcc,	0x6
	set	0x48, %o2
	ldswa	[%l7 + %o2] 0x19,	%o7
loop_385:
	umul	%i5,	0x1908,	%l1
	udivx	%l5,	0x0804,	%g6
	movrgz	%i1,	%o2,	%l4
	umulcc	%i2,	0x13BB,	%o5
	bgu,pn	%icc,	loop_386
	fmovdcc	%icc,	%f9,	%f5
	movn	%xcc,	%o0,	%g3
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%o6
loop_386:
	move	%icc,	%g2,	%l0
	bcc,a	loop_387
	fcmple16	%f2,	%f0,	%l2
	fandnot2s	%f25,	%f25,	%f14
	srlx	%g1,	%i6,	%l3
loop_387:
	movl	%icc,	%g4,	%o4
	orcc	%i3,	%o3,	%g7
	nop
	fitod	%f25,	%f0
	stb	%o1,	[%l7 + 0x79]
	nop
	setx loop_388, %l0, %l1
	jmpl %l1, %i4
	brnz,a	%i0,	loop_389
	mulscc	%g5,	%i7,	%o7
	tleu	%xcc,	0x7
loop_388:
	nop
	setx	loop_390,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_389:
	fmovspos	%xcc,	%f13,	%f22
	andncc	%i5,	%l6,	%l5
	set	0x50, %o1
	stxa	%g6,	[%l7 + %o1] 0x2a
	membar	#Sync
loop_390:
	te	%icc,	0x2
	fcmple32	%f18,	%f8,	%l1
	fcmpgt16	%f16,	%f16,	%i1
	addcc	%o2,	%l4,	%o5
	srlx	%i2,	0x10,	%g3
	fbule	%fcc0,	loop_391
	movrgez	%o0,	%g2,	%l0
	bne,a,pn	%icc,	loop_392
	tge	%xcc,	0x5
loop_391:
	edge8l	%l2,	%o6,	%g1
	set	0x30, %g3
	ldstuba	[%l7 + %g3] 0x11,	%i6
loop_392:
	movcc	%xcc,	%l3,	%o4
	fcmpgt32	%f0,	%f26,	%g4
	tvs	%icc,	0x7
	ldsh	[%l7 + 0x72],	%o3
	tvc	%xcc,	0x0
	subcc	%g7,	%i3,	%i4
	fbo,a	%fcc3,	loop_393
	srlx	%i0,	%g5,	%o1
	bneg,a	%icc,	loop_394
	fbn	%fcc3,	loop_395
loop_393:
	bne,a	%xcc,	loop_396
	fbu	%fcc0,	loop_397
loop_394:
	fbue	%fcc0,	loop_398
loop_395:
	ta	%xcc,	0x2
loop_396:
	tvc	%icc,	0x1
loop_397:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_398:
	fmovs	%f8,	%f6
	bl,a,pn	%xcc,	loop_399
	movrlz	%o7,	%i7,	%l6
	xnorcc	%i5,	%g6,	%l1
	movrlez	%l5,	0x291,	%o2
loop_399:
	movcs	%icc,	%l4,	%o5
	bpos,a	loop_400
	movn	%xcc,	%i2,	%g3
	andcc	%o0,	0x0865,	%i1
	orncc	%g2,	0x194E,	%l0
loop_400:
	fmovrslz	%o6,	%f1,	%f23
	move	%xcc,	%l2,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc2,	loop_401
	sdivx	%g1,	0x02F6,	%o4
	for	%f16,	%f8,	%f4
	fcmpgt32	%f2,	%f14,	%l3
loop_401:
	tcs	%icc,	0x5
	subccc	%o3,	%g7,	%g4
	fmovdcs	%xcc,	%f29,	%f22
	umul	%i4,	0x10E7,	%i3
	set	0x10, %g4
	swapa	[%l7 + %g4] 0x80,	%g5
	nop
	setx	loop_402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%i0,	0x1E2,	%o1
	tcc	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_402:
	fmovdle	%xcc,	%f18,	%f1
	tne	%icc,	0x5
	fmovscc	%icc,	%f26,	%f24
	sdiv	%o7,	0x1932,	%l6
	move	%xcc,	%i5,	%g6
	movrne	%i7,	%l5,	%o2
	movrne	%l4,	0x39E,	%l1
	fands	%f25,	%f20,	%f2
	std	%f28,	[%l7 + 0x68]
	membar	0x56
	fsrc1s	%f25,	%f20
	fornot2	%f18,	%f4,	%f30
	edge32n	%i2,	%o5,	%g3
	umulcc	%i1,	0x0C52,	%g2
	srl	%l0,	0x1E,	%o6
	fornot2	%f0,	%f14,	%f12
	set	0x3A, %i0
	ldsba	[%l7 + %i0] 0x04,	%o0
	tleu	%xcc,	0x5
	tcs	%xcc,	0x4
	movrne	%i6,	%g1,	%o4
	tgu	%xcc,	0x1
	tl	%xcc,	0x2
	subcc	%l3,	%o3,	%l2
	set	0x68, %l2
	lduba	[%l7 + %l2] 0x18,	%g7
	xnorcc	%g4,	0x0DCC,	%i4
	call	loop_403
	fmovde	%xcc,	%f10,	%f26
	fmovsg	%xcc,	%f28,	%f16
	tsubcc	%g5,	0x1326,	%i0
loop_403:
	sethi	0x1462,	%i3
	fbule,a	%fcc3,	loop_404
	brz,a	%o7,	loop_405
	movleu	%xcc,	%l6,	%i5
	addc	%o1,	0x055F,	%g6
loop_404:
	addccc	%i7,	%o2,	%l5
loop_405:
	tge	%icc,	0x7
	bvs,a	loop_406
	alignaddr	%l4,	%i2,	%o5
	stx	%g3,	[%l7 + 0x58]
	orcc	%l1,	0x139A,	%g2
loop_406:
	movn	%xcc,	%l0,	%i1
	bcs	loop_407
	nop
	setx	0x280AFDC7805224BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	tneg	%icc,	0x5
	tge	%xcc,	0x0
loop_407:
	tg	%icc,	0x0
	ld	[%l7 + 0x24],	%f27
	smul	%o0,	%o6,	%i6
	edge16l	%g1,	%o4,	%o3
	brgez,a	%l2,	loop_408
	movpos	%icc,	%l3,	%g7
	pdist	%f2,	%f0,	%f22
	tle	%xcc,	0x2
loop_408:
	ta	%xcc,	0x7
	movrlez	%g4,	%i4,	%i0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%i3
	srlx	%o7,	0x1B,	%l6
	edge32	%i5,	%o1,	%g6
	subc	%i7,	0x11AC,	%l5
	fmovse	%xcc,	%f23,	%f5
	fbe	%fcc2,	loop_409
	ldd	[%l7 + 0x60],	%f4
	fmovd	%f0,	%f12
	tge	%icc,	0x2
loop_409:
	fmovsle	%icc,	%f25,	%f3
	udivx	%o2,	0x0607,	%i2
	edge16n	%l4,	%g3,	%l1
	tsubcctv	%g2,	%o5,	%i1
	mulscc	%o0,	%l0,	%i6
	xor	%g1,	0x0783,	%o4
	taddcctv	%o3,	0x0537,	%l2
	bvc,a	loop_410
	tsubcc	%o6,	0x0522,	%g7
	and	%l3,	%i4,	%g4
	fcmpeq32	%f2,	%f28,	%g5
loop_410:
	addccc	%i0,	0x17C6,	%o7
	movrgez	%i3,	0x0F2,	%l6
	brlz,a	%i5,	loop_411
	fbul	%fcc1,	loop_412
	subcc	%g6,	%o1,	%l5
	array32	%o2,	%i7,	%i2
loop_411:
	bleu	loop_413
loop_412:
	umul	%l4,	%l1,	%g3
	and	%g2,	0x1C79,	%o5
	membar	0x26
loop_413:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%i1
	lduh	[%l7 + 0x60],	%l0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tvs	%icc,	0x7
	smulcc	%i6,	0x16EE,	%o3
	nop
	setx	0xEA47AA3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xD54F9C19,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f13,	%f18
	tge	%icc,	0x3
	fnor	%f0,	%f10,	%f24
	addc	%l2,	0x0051,	%o6
	fabsd	%f14,	%f22
	tg	%xcc,	0x0
	nop
	setx	0xF9DBC804,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xEAA1201F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f11,	%f22
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x54] %asi,	%o4
	stb	%g7,	[%l7 + 0x52]
	or	%i4,	%l3,	%g5
	fbue	%fcc2,	loop_414
	addccc	%i0,	0x1D75,	%o7
	tn	%icc,	0x4
	faligndata	%f20,	%f6,	%f16
loop_414:
	call	loop_415
	subcc	%i3,	%l6,	%i5
	array16	%g6,	%g4,	%l5
	tn	%icc,	0x2
loop_415:
	andn	%o1,	0x1571,	%o2
	tgu	%xcc,	0x2
	and	%i7,	0x1A1E,	%l4
	tge	%icc,	0x4
	srl	%i2,	%l1,	%g3
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x1e,	%f16
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%g2
	movrgez	%o0,	%o5,	%i1
	fbge,a	%fcc3,	loop_416
	taddcc	%l0,	0x03C2,	%i6
	edge8n	%o3,	%g1,	%o6
	ble	%xcc,	loop_417
loop_416:
	andcc	%o4,	0x0FF1,	%l2
	fnor	%f22,	%f24,	%f6
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f26
loop_417:
	fbne,a	%fcc3,	loop_418
	andcc	%i4,	0x0E11,	%g7
	nop
	setx loop_419, %l0, %l1
	jmpl %l1, %l3
	addc	%i0,	0x1F82,	%g5
loop_418:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f19,	[%l7 + 0x4C] %asi
loop_419:
	edge8n	%o7,	%l6,	%i3
	ldd	[%l7 + 0x70],	%g6
	brlez,a	%i5,	loop_420
	movvc	%xcc,	%g4,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o2,	%i7
loop_420:
	srlx	%o1,	%l4,	%i2
	nop
	setx	0x2B33ED3535D20265,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x04A2482D7B01ACD1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f20,	%f26
	srl	%g3,	%g2,	%l1
	xor	%o0,	%i1,	%l0
	fornot1s	%f19,	%f2,	%f14
	movrne	%o5,	0x2FF,	%o3
	movleu	%icc,	%i6,	%g1
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x60] %asi,	%o6
	fabsd	%f22,	%f18
	and	%o4,	0x0319,	%i4
	smulcc	%l2,	0x053F,	%g7
	be,a	%icc,	loop_421
	mulx	%l3,	0x1726,	%i0
	set	0x60, %g6
	stxa	%g5,	[%l7 + %g6] 0x2b
	membar	#Sync
loop_421:
	fornot1s	%f6,	%f2,	%f10
	srax	%o7,	0x16,	%i3
	alignaddrl	%l6,	%i5,	%g4
	sir	0x0FD9
	bne	loop_422
	movrgz	%g6,	0x170,	%l5
	tneg	%icc,	0x5
	fmovse	%xcc,	%f6,	%f3
loop_422:
	fnot2s	%f20,	%f30
	nop
	setx	0xE0AEA403,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x15C16C5E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f29,	%f27
	or	%i7,	0x11D1,	%o2
	fblg	%fcc2,	loop_423
	fmovdneg	%icc,	%f20,	%f15
	mulx	%o1,	%i2,	%g3
	tneg	%xcc,	0x0
loop_423:
	prefetch	[%l7 + 0x64],	 0x3
	edge32	%g2,	%l4,	%l1
	movrgz	%o0,	%l0,	%i1
	ldstub	[%l7 + 0x38],	%o3
	bshuffle	%f14,	%f30,	%f4
	wr	%g0,	0x11,	%asi
	stwa	%i6,	[%l7 + 0x0C] %asi
	movvs	%icc,	%g1,	%o5
	add	%o4,	0x0EE5,	%o6
	addccc	%l2,	%i4,	%g7
	movl	%xcc,	%i0,	%l3
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%g5,	%o7
	brgz,a	%i3,	loop_424
	addccc	%i5,	%l6,	%g4
	nop
	setx	0x4A78524A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xCBADFF87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f31,	%f24
	udivcc	%g6,	0x1322,	%l5
loop_424:
	nop
	setx	0xE537A6992405F1CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x294105CC14E7C967,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f2,	%f28
	srlx	%i7,	0x13,	%o2
	edge32l	%i2,	%g3,	%o1
	bl,a	loop_425
	sra	%l4,	%l1,	%o0
	or	%l0,	%i1,	%g2
	movl	%xcc,	%o3,	%g1
loop_425:
	nop
	fitos	%f10,	%f3
	fstod	%f3,	%f18
	smul	%o5,	%o4,	%o6
	fnands	%f5,	%f10,	%f8
	movcs	%xcc,	%l2,	%i6
	mulscc	%i4,	%i0,	%g7
	fbn,a	%fcc2,	loop_426
	tcs	%xcc,	0x6
	fbuge	%fcc2,	loop_427
	ldub	[%l7 + 0x40],	%l3
loop_426:
	edge32ln	%o7,	%i3,	%i5
	stbar
loop_427:
	sethi	0x0CB9,	%l6
	movvc	%xcc,	%g4,	%g6
	fmovrdlez	%l5,	%f14,	%f20
	movgu	%xcc,	%i7,	%o2
	sub	%i2,	%g5,	%o1
	sra	%g3,	0x0E,	%l1
	taddcc	%o0,	%l0,	%l4
	sub	%g2,	%o3,	%g1
	movg	%xcc,	%i1,	%o4
	lduw	[%l7 + 0x2C],	%o5
	fmovsle	%icc,	%f30,	%f29
	fnot1s	%f22,	%f2
	movcs	%xcc,	%l2,	%i6
	movvc	%icc,	%i4,	%o6
	umulcc	%i0,	0x114C,	%l3
	andncc	%o7,	%i3,	%g7
	fpadd16	%f12,	%f6,	%f18
	fmovrsne	%i5,	%f16,	%f13
	edge16	%g4,	%l6,	%g6
	bge	%icc,	loop_428
	st	%f7,	[%l7 + 0x2C]
	fmovsg	%icc,	%f9,	%f6
	flush	%l7 + 0x10
loop_428:
	movpos	%xcc,	%i7,	%o2
	sdivx	%i2,	0x0283,	%g5
	bn,pt	%icc,	loop_429
	tne	%xcc,	0x3
	srl	%l5,	%o1,	%l1
	tcc	%icc,	0x6
loop_429:
	fbue	%fcc2,	loop_430
	add	%o0,	0x1479,	%g3
	fabss	%f20,	%f22
	edge16n	%l4,	%g2,	%l0
loop_430:
	tg	%xcc,	0x3
	fmovdle	%xcc,	%f13,	%f19
	orcc	%g1,	0x1978,	%i1
	tpos	%xcc,	0x2
	ld	[%l7 + 0x70],	%f8
	sethi	0x078E,	%o4
	alignaddr	%o5,	%l2,	%o3
	sll	%i6,	%i4,	%o6
	nop
	setx	0xC6A70166B0546FE1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	bne,a	loop_431
	udiv	%l3,	0x04D4,	%o7
	fpsub32s	%f3,	%f25,	%f10
	bvs,a,pn	%xcc,	loop_432
loop_431:
	tge	%xcc,	0x6
	nop
	setx	0xB8CBC1AE827993EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x5AD631FB0EB58EAA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f4,	%f20
	taddcc	%i0,	0x0F5F,	%i3
loop_432:
	nop
	setx	loop_433,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fble,a	%fcc0,	loop_434
	ldsb	[%l7 + 0x55],	%g7
	fbul,a	%fcc2,	loop_435
loop_433:
	smulcc	%g4,	0x08E0,	%i5
loop_434:
	ble,a	%xcc,	loop_436
	edge8ln	%g6,	%i7,	%o2
loop_435:
	fnot1	%f18,	%f22
	fexpand	%f5,	%f0
loop_436:
	edge16n	%i2,	%g5,	%l5
	nop
	setx loop_437, %l0, %l1
	jmpl %l1, %l6
	movrlz	%o1,	%l1,	%o0
	movvc	%icc,	%l4,	%g3
	udiv	%g2,	0x0DD3,	%l0
loop_437:
	nop
	set	0x10, %i5
	ldsba	[%l7 + %i5] 0x19,	%i1
	fornot1	%f22,	%f24,	%f0
	fbul,a	%fcc1,	loop_438
	brz,a	%o4,	loop_439
	sdivx	%o5,	0x13FD,	%g1
	popc	0x1219,	%l2
loop_438:
	sra	%o3,	%i6,	%i4
loop_439:
	taddcc	%l3,	%o7,	%o6
	srlx	%i3,	0x1A,	%g7
	sdivx	%i0,	0x0EF2,	%i5
	movrgz	%g6,	0x222,	%i7
	fba,a	%fcc1,	loop_440
	brz	%o2,	loop_441
	add	%g4,	0x020A,	%i2
	movn	%icc,	%l5,	%g5
loop_440:
	fbe,a	%fcc3,	loop_442
loop_441:
	fbule	%fcc0,	loop_443
	fpsub32	%f16,	%f16,	%f0
	tvc	%xcc,	0x4
loop_442:
	fmovdge	%xcc,	%f26,	%f24
loop_443:
	sra	%o1,	%l1,	%l6
	movcs	%xcc,	%l4,	%g3
	or	%g2,	%o0,	%l0
	sllx	%o4,	0x1C,	%o5
	smulcc	%g1,	%l2,	%o3
	sra	%i6,	0x1E,	%i1
	movneg	%xcc,	%i4,	%l3
	smul	%o7,	0x16F4,	%i3
	udiv	%o6,	0x0C65,	%i0
	fexpand	%f4,	%f20
	tgu	%xcc,	0x1
	fbule	%fcc2,	loop_444
	movrne	%i5,	0x28D,	%g6
	edge8l	%i7,	%g7,	%o2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_444:
	fmovse	%icc,	%f10,	%f19
	nop
	fitos	%f9,	%f5
	fstoi	%f5,	%f18
	edge8l	%g4,	%l5,	%i2
	edge32l	%g5,	%l1,	%l6
	movl	%icc,	%o1,	%l4
	xorcc	%g3,	%g2,	%o0
	add	%o4,	%o5,	%l0
	or	%l2,	%o3,	%i6
	movne	%icc,	%g1,	%i1
	udiv	%i4,	0x1C86,	%o7
	xnor	%i3,	%l3,	%o6
	edge32ln	%i0,	%i5,	%g6
	tge	%xcc,	0x4
	fmul8ulx16	%f10,	%f22,	%f30
	brgez,a	%i7,	loop_445
	bl,a	loop_446
	ldsb	[%l7 + 0x28],	%o2
	set	0x50, %o5
	ldxa	[%l7 + %o5] 0x11,	%g4
loop_445:
	bpos,pn	%icc,	loop_447
loop_446:
	addccc	%g7,	%i2,	%g5
	ta	%icc,	0x2
	edge16n	%l1,	%l5,	%o1
loop_447:
	udivcc	%l4,	0x05F2,	%l6
	bpos,a,pn	%xcc,	loop_448
	ld	[%l7 + 0x28],	%f30
	set	0x28, %l1
	ldsha	[%l7 + %l1] 0x19,	%g3
loop_448:
	nop
	setx	0x307ACF56,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	movleu	%icc,	%o0,	%o4
	edge8n	%g2,	%o5,	%l2
	xnorcc	%o3,	%l0,	%g1
	fnand	%f0,	%f10,	%f0
	xnor	%i1,	0x0903,	%i6
	tl	%icc,	0x1
	fmovde	%xcc,	%f28,	%f17
	movleu	%xcc,	%o7,	%i4
	tvc	%icc,	0x1
	bcc,pn	%icc,	loop_449
	swap	[%l7 + 0x48],	%i3
	tcc	%icc,	0x2
	array32	%l3,	%i0,	%i5
loop_449:
	movl	%icc,	%o6,	%i7
	ta	%xcc,	0x0
	fmovsge	%icc,	%f23,	%f12
	movrlez	%o2,	0x198,	%g6
	move	%xcc,	%g4,	%g7
	and	%i2,	%l1,	%l5
	fmovrslz	%o1,	%f15,	%f0
	tpos	%icc,	0x1
	fmovsne	%icc,	%f8,	%f24
	movleu	%xcc,	%g5,	%l6
	fmuld8sux16	%f12,	%f18,	%f12
	stbar
	tge	%xcc,	0x5
	ldd	[%l7 + 0x28],	%f16
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x62] %asi,	%l4
	nop
	setx	loop_450,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%g3,	0x1C71,	%o0
	fcmpgt32	%f26,	%f24,	%g2
	movcc	%xcc,	%o5,	%o4
loop_450:
	tgu	%icc,	0x4
	umul	%o3,	%l0,	%g1
	array8	%l2,	%i1,	%o7
	fbul	%fcc0,	loop_451
	edge16ln	%i4,	%i6,	%i3
	sethi	0x1C2F,	%i0
	ba,a	loop_452
loop_451:
	movg	%icc,	%l3,	%o6
	movleu	%icc,	%i7,	%i5
	tle	%xcc,	0x0
loop_452:
	nop
	set	0x7C, %i3
	lduba	[%l7 + %i3] 0x0c,	%o2
	fmovsleu	%icc,	%f12,	%f9
	orncc	%g6,	%g4,	%i2
	mulx	%l1,	0x0144,	%g7
	movvc	%xcc,	%o1,	%l5
	bcs,a	loop_453
	movcs	%icc,	%l6,	%l4
	orcc	%g3,	0x0C6A,	%o0
	fbn	%fcc1,	loop_454
loop_453:
	xnor	%g2,	0x0189,	%g5
	xor	%o5,	0x1D3B,	%o4
	fmuld8sux16	%f22,	%f24,	%f2
loop_454:
	and	%l0,	0x148A,	%g1
	brlz	%l2,	loop_455
	edge8l	%i1,	%o7,	%i4
	sra	%i6,	%i3,	%o3
	subcc	%l3,	0x001F,	%i0
loop_455:
	nop
	fitos	%f2,	%f13
	fstox	%f13,	%f22
	fxtos	%f22,	%f25
	fmovrdne	%o6,	%f30,	%f10
	move	%icc,	%i7,	%o2
	addcc	%i5,	0x05EE,	%g4
	xnor	%i2,	0x0B06,	%l1
	smul	%g6,	0x1F57,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o1,	%l6
	set	0x2E, %l6
	ldsha	[%l7 + %l6] 0x10,	%l5
	tcc	%icc,	0x1
	fmovse	%xcc,	%f24,	%f30
	movrlz	%l4,	0x37C,	%o0
	movcc	%xcc,	%g2,	%g5
	tg	%icc,	0x7
	movpos	%xcc,	%g3,	%o4
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x18,	%f16
	array8	%l0,	%g1,	%o5
	tvs	%icc,	0x5
	fandnot1s	%f26,	%f5,	%f18
	edge32l	%i1,	%o7,	%l2
	set	0x5E, %o6
	stha	%i6,	[%l7 + %o6] 0xea
	membar	#Sync
	tsubcctv	%i4,	0x039B,	%o3
	taddcctv	%l3,	%i3,	%o6
	tleu	%xcc,	0x6
	fbule,a	%fcc3,	loop_456
	movle	%icc,	%i7,	%i0
	addcc	%o2,	0x1ED0,	%i5
	fmovdge	%xcc,	%f2,	%f0
loop_456:
	ldd	[%l7 + 0x28],	%f26
	set	0x70, %g1
	lduwa	[%l7 + %g1] 0x89,	%g4
	orn	%l1,	0x16D9,	%i2
	fmovsge	%icc,	%f14,	%f29
	movrlez	%g7,	%o1,	%g6
	fbge,a	%fcc1,	loop_457
	brnz	%l6,	loop_458
	tcc	%icc,	0x7
	nop
	setx	0x4F0A310E606B1F2B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
loop_457:
	movn	%icc,	%l4,	%l5
loop_458:
	fblg,a	%fcc2,	loop_459
	tvc	%xcc,	0x7
	fsrc1	%f20,	%f28
	tvc	%icc,	0x4
loop_459:
	sra	%g2,	0x07,	%g5
	movvs	%icc,	%g3,	%o0
	ldub	[%l7 + 0x7B],	%l0
	ta	%xcc,	0x0
	xnorcc	%g1,	0x0060,	%o4
	lduh	[%l7 + 0x08],	%i1
	fcmpgt16	%f26,	%f26,	%o7
	sir	0x0050
	or	%o5,	0x11B8,	%l2
	movn	%xcc,	%i4,	%i6
	membar	0x71
	bg,a	loop_460
	nop
	fitos	%f1,	%f28
	fstoi	%f28,	%f1
	ldub	[%l7 + 0x1F],	%l3
	orn	%i3,	0x04B7,	%o3
loop_460:
	tcs	%icc,	0x3
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%i7
	nop
	setx	0xDF6DB07FFF0BAAB0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xB13DE35C6C22FB5E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f22,	%f12
	edge32n	%i0,	%o6,	%o2
	ldd	[%l7 + 0x68],	%g4
	array32	%l1,	%i5,	%i2
	andncc	%g7,	%g6,	%l6
	movrgz	%l4,	0x127,	%l5
	udiv	%g2,	0x073C,	%o1
	flush	%l7 + 0x40
	smul	%g5,	%g3,	%l0
	movrgz	%g1,	%o0,	%o4
	nop
	setx	0x44F8A9F3286353CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xBD5213294BC13240,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f0,	%f10
	tl	%icc,	0x7
	set	0x18, %l3
	lda	[%l7 + %l3] 0x10,	%f1
	fmovdpos	%icc,	%f16,	%f20
	fcmpeq32	%f12,	%f22,	%o7
	tpos	%icc,	0x0
	movge	%icc,	%o5,	%i1
	fbl,a	%fcc0,	loop_461
	fbuge	%fcc3,	loop_462
	tneg	%xcc,	0x1
	lduh	[%l7 + 0x26],	%l2
loop_461:
	edge8n	%i6,	%l3,	%i4
loop_462:
	fbn,a	%fcc1,	loop_463
	edge16n	%o3,	%i7,	%i3
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i0
loop_463:
	membar	0x46
	movge	%xcc,	%o6,	%o2
	nop
	setx	0x7FD6D8C034CBE3D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x5823BE340EB2E8DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f22,	%f4
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x74] %asi,	%l1
	set	0x24, %g5
	swapa	[%l7 + %g5] 0x80,	%g4
	tneg	%icc,	0x5
	subcc	%i2,	0x1FEA,	%i5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	tleu	%icc,	0x4
	andcc	%l6,	%l4,	%g7
	movrgez	%g2,	0x05A,	%o1
	stbar
	movl	%xcc,	%g5,	%g3
	tn	%xcc,	0x7
	orn	%l0,	%l5,	%g1
	edge32	%o4,	%o0,	%o7
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%i1
	edge32ln	%o5,	%l2,	%l3
	movg	%icc,	%i4,	%o3
	brgz,a	%i6,	loop_464
	st	%f1,	[%l7 + 0x54]
	fxnor	%f10,	%f28,	%f8
	tcc	%icc,	0x5
loop_464:
	addcc	%i7,	0x1480,	%i0
	wr	%g0,	0x81,	%asi
	stba	%o6,	[%l7 + 0x5B] %asi
	udivcc	%i3,	0x0709,	%l1
	fnands	%f18,	%f28,	%f8
	fba	%fcc3,	loop_465
	sub	%g4,	0x1420,	%o2
	movre	%i5,	0x0D2,	%g6
	brlz	%l6,	loop_466
loop_465:
	xorcc	%i2,	%l4,	%g7
	movvc	%xcc,	%g2,	%g5
	ba,pt	%icc,	loop_467
loop_466:
	nop
	setx loop_468, %l0, %l1
	jmpl %l1, %o1
	bcs,a,pn	%icc,	loop_469
	andcc	%l0,	0x1544,	%l5
loop_467:
	fblg,a	%fcc2,	loop_470
loop_468:
	fmovse	%icc,	%f19,	%f19
loop_469:
	fbo,a	%fcc2,	loop_471
	subcc	%g3,	%o4,	%g1
loop_470:
	lduw	[%l7 + 0x48],	%o0
	umulcc	%i1,	0x14AC,	%o5
loop_471:
	bneg,a	loop_472
	bg	loop_473
	bcc,pt	%xcc,	loop_474
	movrgz	%o7,	0x247,	%l2
loop_472:
	movvs	%icc,	%i4,	%o3
loop_473:
	movle	%xcc,	%l3,	%i7
loop_474:
	sllx	%i0,	0x17,	%o6
	tle	%icc,	0x4
	movre	%i3,	%l1,	%i6
	tsubcctv	%g4,	0x0BE7,	%o2
	movgu	%icc,	%g6,	%i5
	and	%l6,	%l4,	%g7
	movg	%icc,	%g2,	%i2
	membar	0x2B
	fmovdpos	%xcc,	%f20,	%f4
	wr	%g0,	0x2f,	%asi
	stha	%o1,	[%l7 + 0x0C] %asi
	membar	#Sync
	nop
	setx	loop_475,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsne	%xcc,	%f8,	%f21
	ldsh	[%l7 + 0x40],	%l0
	fxnors	%f3,	%f31,	%f13
loop_475:
	fbo,a	%fcc3,	loop_476
	fnands	%f19,	%f15,	%f11
	tl	%icc,	0x4
	ldd	[%l7 + 0x60],	%f18
loop_476:
	fmovdneg	%xcc,	%f13,	%f23
	tne	%icc,	0x0
	movrlz	%l5,	%g5,	%g3
	sllx	%o4,	%g1,	%o0
	tge	%icc,	0x1
	tcs	%icc,	0x4
	fmovspos	%xcc,	%f27,	%f21
	fornot2	%f20,	%f4,	%f10
	tvs	%xcc,	0x7
	fmovrslez	%o5,	%f24,	%f20
	fones	%f10
	subcc	%i1,	0x09C3,	%l2
	smulcc	%o7,	0x14EA,	%o3
	srax	%l3,	0x08,	%i4
	movne	%icc,	%i0,	%i7
	fbug,a	%fcc1,	loop_477
	fbo,a	%fcc3,	loop_478
	fbe	%fcc2,	loop_479
	edge8ln	%o6,	%l1,	%i6
loop_477:
	sllx	%i3,	%g4,	%g6
loop_478:
	nop
	set	0x18, %g7
	swapa	[%l7 + %g7] 0x19,	%o2
loop_479:
	alignaddr	%l6,	%i5,	%g7
	sdivcc	%l4,	0x073D,	%g2
	movrlz	%o1,	%i2,	%l0
	edge32l	%l5,	%g5,	%o4
	swap	[%l7 + 0x24],	%g1
	fmovrsgez	%g3,	%f31,	%f31
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%o0
	tgu	%icc,	0x6
	movrlz	%l2,	%o7,	%i1
	nop
	setx	0x3BF3C04F46A0259A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xA4D200521C54BDD3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f4,	%f16
	bvc,pt	%icc,	loop_480
	tcs	%icc,	0x0
	add	%l3,	%i4,	%o3
	tn	%xcc,	0x7
loop_480:
	tne	%icc,	0x0
	tg	%icc,	0x7
	sir	0x128B
	xor	%i0,	%i7,	%l1
	tcs	%icc,	0x0
	and	%o6,	0x19CF,	%i6
	bne,a,pt	%icc,	loop_481
	ta	%icc,	0x5
	lduh	[%l7 + 0x0A],	%g4
	movneg	%icc,	%g6,	%o2
loop_481:
	flush	%l7 + 0x40
	movgu	%xcc,	%i3,	%i5
	mulx	%l6,	0x1433,	%l4
	umul	%g2,	0x165D,	%g7
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f28
	fxtod	%f28,	%f30
	fmovsl	%icc,	%f19,	%f26
	tvc	%xcc,	0x2
	movneg	%xcc,	%o1,	%l0
	movl	%icc,	%l5,	%g5
	taddcctv	%i2,	%o4,	%g1
	array8	%o5,	%o0,	%g3
	tvc	%icc,	0x4
	fmovdneg	%icc,	%f23,	%f29
	te	%icc,	0x1
	tge	%icc,	0x2
	array8	%l2,	%o7,	%i1
	movcs	%icc,	%l3,	%o3
	edge8l	%i0,	%i7,	%i4
	tn	%xcc,	0x0
	tneg	%xcc,	0x6
	fbn	%fcc0,	loop_482
	movcc	%xcc,	%o6,	%i6
	fsrc1	%f24,	%f16
	sdivcc	%l1,	0x1AA5,	%g6
loop_482:
	subccc	%o2,	%g4,	%i3
	fpadd32	%f10,	%f0,	%f4
	edge16l	%i5,	%l6,	%g2
	smulcc	%g7,	0x0FD6,	%l4
	fbn	%fcc3,	loop_483
	tneg	%icc,	0x5
	orncc	%o1,	0x0F95,	%l0
	fandnot2	%f8,	%f2,	%f14
loop_483:
	tg	%xcc,	0x0
	nop
	setx	0x57F96553E052458C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	ldd	[%l7 + 0x18],	%f22
	bge,a	loop_484
	xnorcc	%g5,	0x09E2,	%l5
	fmovdne	%xcc,	%f18,	%f16
	fmovsn	%icc,	%f7,	%f8
loop_484:
	and	%i2,	0x0B55,	%g1
	edge8n	%o4,	%o5,	%g3
	fble,a	%fcc1,	loop_485
	xor	%l2,	0x1522,	%o7
	ldsw	[%l7 + 0x58],	%o0
	array32	%l3,	%i1,	%o3
loop_485:
	subc	%i0,	%i4,	%o6
	fbug,a	%fcc2,	loop_486
	sethi	0x1E35,	%i7
	tne	%icc,	0x2
	tcs	%xcc,	0x1
loop_486:
	orcc	%l1,	%i6,	%o2
	tg	%xcc,	0x2
	orn	%g4,	0x1EF4,	%g6
	sdiv	%i3,	0x06C4,	%i5
	sdiv	%g2,	0x0543,	%g7
	movvc	%icc,	%l4,	%o1
	edge16ln	%l6,	%g5,	%l5
	edge32	%l0,	%i2,	%o4
	fnor	%f14,	%f4,	%f4
	sethi	0x0DA1,	%o5
	bleu,pt	%xcc,	loop_487
	sir	0x0831
	sdivx	%g3,	0x0BDF,	%l2
	sra	%g1,	%o7,	%o0
loop_487:
	fxors	%f17,	%f0,	%f4
	bge,a,pn	%xcc,	loop_488
	mulscc	%l3,	%o3,	%i0
	movcc	%xcc,	%i1,	%o6
	movrgz	%i4,	%l1,	%i6
loop_488:
	fmul8x16au	%f30,	%f3,	%f22
	edge32n	%i7,	%g4,	%o2
	alignaddrl	%g6,	%i5,	%g2
	bn,a,pt	%icc,	loop_489
	sll	%g7,	%l4,	%i3
	or	%o1,	0x1FF4,	%g5
	tge	%xcc,	0x4
loop_489:
	tsubcctv	%l5,	0x0882,	%l0
	brgz	%i2,	loop_490
	edge16	%l6,	%o4,	%o5
	movgu	%icc,	%g3,	%l2
	udiv	%g1,	0x136C,	%o7
loop_490:
	fmovscs	%icc,	%f26,	%f28
	udiv	%l3,	0x1929,	%o3
	fmovdvs	%icc,	%f25,	%f14
	fabsd	%f24,	%f6
	fcmpeq32	%f20,	%f14,	%i0
	array32	%o0,	%i1,	%i4
	brgz,a	%o6,	loop_491
	fmovrse	%i6,	%f28,	%f10
	udiv	%l1,	0x0A5D,	%i7
	tne	%icc,	0x0
loop_491:
	movleu	%xcc,	%g4,	%o2
	fmovrslz	%g6,	%f25,	%f1
	movpos	%icc,	%i5,	%g2
	fmovdvc	%icc,	%f10,	%f20
	sll	%l4,	%g7,	%o1
	edge32n	%g5,	%i3,	%l5
	movleu	%icc,	%l0,	%i2
	tsubcctv	%l6,	%o5,	%o4
	fmovdge	%icc,	%f2,	%f9
	udivcc	%g3,	0x1840,	%l2
	movle	%xcc,	%o7,	%g1
	taddcc	%l3,	0x08E7,	%o3
	sdiv	%o0,	0x0798,	%i1
	sir	0x1B32
	addcc	%i4,	0x185B,	%o6
	sdivcc	%i0,	0x1F3C,	%i6
	array16	%i7,	%g4,	%o2
	add	%g6,	%l1,	%i5
	stb	%l4,	[%l7 + 0x47]
	mova	%xcc,	%g7,	%o1
	fmovrse	%g5,	%f1,	%f13
	fcmple16	%f10,	%f24,	%g2
	stbar
	xorcc	%l5,	%i3,	%l0
	mulscc	%l6,	%o5,	%i2
	set	0x66, %g2
	stha	%o4,	[%l7 + %g2] 0xea
	membar	#Sync
	xnorcc	%l2,	0x150A,	%g3
	tsubcc	%o7,	%l3,	%o3
	bshuffle	%f28,	%f20,	%f2
	brgez,a	%o0,	loop_492
	fpsub32s	%f17,	%f15,	%f19
	fbl,a	%fcc0,	loop_493
	orcc	%i1,	0x1EC2,	%i4
loop_492:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f0,	%f12
loop_493:
	fmul8x16al	%f19,	%f16,	%f24
	sllx	%g1,	0x18,	%o6
	andcc	%i0,	%i7,	%g4
	nop
	setx	0x749967D7C30B3DE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC473C72BC7F1B3D1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f26,	%f8
	popc	0x1D60,	%o2
	edge16n	%g6,	%i6,	%i5
	edge16n	%l4,	%l1,	%g7
	brlz,a	%g5,	loop_494
	tsubcc	%o1,	%l5,	%g2
	nop
	fitos	%f6,	%f27
	fstox	%f27,	%f12
	fxtos	%f12,	%f16
	fmul8ulx16	%f26,	%f20,	%f10
loop_494:
	srax	%i3,	%l6,	%o5
	sub	%l0,	%i2,	%o4
	brlz	%l2,	loop_495
	andncc	%o7,	%g3,	%l3
	fpsub16	%f14,	%f10,	%f22
	tgu	%xcc,	0x7
loop_495:
	alignaddr	%o0,	%i1,	%o3
	andcc	%g1,	0x0A8E,	%i4
	fornot2s	%f3,	%f8,	%f22
	brz	%o6,	loop_496
	alignaddrl	%i0,	%g4,	%i7
	nop
	fitod	%f27,	%f24
	set	0x40, %i7
	swapa	[%l7 + %i7] 0x80,	%g6
loop_496:
	xnorcc	%o2,	%i5,	%l4
	tvc	%icc,	0x1
	tleu	%xcc,	0x5
	fmovrdlez	%i6,	%f14,	%f10
	fmovs	%f6,	%f5
	edge8l	%l1,	%g7,	%o1
	ldub	[%l7 + 0x55],	%l5
	wr	%g0,	0xe2,	%asi
	stha	%g2,	[%l7 + 0x72] %asi
	membar	#Sync
	bne,a,pn	%xcc,	loop_497
	move	%icc,	%i3,	%l6
	popc	%o5,	%g5
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x28] %asi,	%i2
loop_497:
	ldd	[%l7 + 0x70],	%f28
	set	0x3C, %i1
	lda	[%l7 + %i1] 0x19,	%f11
	bl,pn	%icc,	loop_498
	sdivcc	%l0,	0x0ED7,	%l2
	fmovdl	%icc,	%f2,	%f26
	st	%f23,	[%l7 + 0x60]
loop_498:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o7,	%o4
	smulcc	%l3,	0x05AC,	%g3
	movre	%o0,	0x0EB,	%o3
	srax	%i1,	0x01,	%g1
	fmovsne	%icc,	%f7,	%f18
	movleu	%xcc,	%i4,	%o6
	fbl	%fcc1,	loop_499
	orn	%i0,	%i7,	%g6
	ta	%xcc,	0x0
	flush	%l7 + 0x14
loop_499:
	edge16n	%g4,	%i5,	%o2
	tcc	%xcc,	0x7
	fbne	%fcc3,	loop_500
	movgu	%icc,	%i6,	%l1
	nop
	setx	0x80ECFE744422AA3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x69823DBE09A17FAF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f6,	%f14
	addcc	%l4,	%g7,	%o1
loop_500:
	stx	%g2,	[%l7 + 0x38]
	fandnot1	%f0,	%f16,	%f18
	bvs,a	loop_501
	fbu,a	%fcc0,	loop_502
	bvc,a	loop_503
	sll	%l5,	0x1A,	%l6
loop_501:
	xnor	%i3,	0x0C27,	%g5
loop_502:
	andcc	%i2,	%o5,	%l0
loop_503:
	nop
	wr	%g0,	0xea,	%asi
	stxa	%l2,	[%l7 + 0x38] %asi
	membar	#Sync
	edge8ln	%o7,	%o4,	%l3
	andcc	%g3,	0x0304,	%o0
	lduw	[%l7 + 0x68],	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,pn	%xcc,	loop_504
	fpadd32	%f24,	%f18,	%f4
	nop
	setx	0x34805F8D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x7C1D15AA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f26,	%f9
	mulx	%g1,	%i4,	%o6
loop_504:
	sth	%i0,	[%l7 + 0x40]
	movvc	%icc,	%i7,	%g6
	sdivx	%g4,	0x186B,	%i5
	set	0x08, %i4
	lduwa	[%l7 + %i4] 0x14,	%i1
	taddcctv	%o2,	%i6,	%l1
	movre	%l4,	%o1,	%g2
	sll	%l5,	0x1F,	%l6
	movrgez	%i3,	0x14A,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g5,	0x16B6,	%o5
	tl	%icc,	0x2
	orcc	%i2,	0x1E86,	%l0
	edge16l	%o7,	%o4,	%l3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x11] %asi,	%g3
	bvc	%icc,	loop_505
	fbne,a	%fcc0,	loop_506
	ble	%xcc,	loop_507
	edge16l	%o0,	%o3,	%g1
loop_505:
	tg	%xcc,	0x1
loop_506:
	tg	%icc,	0x7
loop_507:
	sdivx	%l2,	0x1BA3,	%i4
	ldsb	[%l7 + 0x0C],	%o6
	movpos	%icc,	%i0,	%g6
	sdivx	%g4,	0x10D1,	%i7
	movrlez	%i1,	%o2,	%i5
	movcs	%xcc,	%i6,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x2
	movne	%icc,	%l4,	%o1
	membar	0x66
	tcs	%icc,	0x7
	nop
	fitos	%f22,	%f29
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x2C] %asi,	%l5
	swap	[%l7 + 0x4C],	%g2
	tcs	%icc,	0x6
	bne,pt	%xcc,	loop_508
	fpackfix	%f16,	%f10
	alignaddr	%i3,	%g7,	%g5
	orn	%l6,	0x11FE,	%i2
loop_508:
	xorcc	%l0,	%o7,	%o4
	std	%f10,	[%l7 + 0x08]
	fbule,a	%fcc3,	loop_509
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x58
	ldd	[%l7 + 0x70],	%f12
loop_509:
	nop
	setx	0x21AF63FEC8D077A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x7CF634E1DA621E26,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f8,	%f22
	orcc	%l3,	%o5,	%g3
	fbuge	%fcc3,	loop_510
	tpos	%xcc,	0x4
	fmovrsne	%o0,	%f1,	%f8
	tsubcc	%g1,	0x1D73,	%o3
loop_510:
	srlx	%l2,	0x06,	%i4
	sll	%o6,	0x0A,	%g6
	fmul8ulx16	%f24,	%f4,	%f24
	alignaddrl	%g4,	%i7,	%i0
	fmovrsgz	%o2,	%f6,	%f28
	mulx	%i1,	%i6,	%l1
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x88
	fmovdg	%xcc,	%f22,	%f5
	fpadd16s	%f7,	%f11,	%f23
	te	%icc,	0x7
	subcc	%l4,	%o1,	%i5
	subccc	%l5,	0x088D,	%g2
	edge8n	%i3,	%g7,	%l6
	andncc	%i2,	%g5,	%l0
	sll	%o7,	%o4,	%l3
	tleu	%icc,	0x1
	nop
	setx loop_511, %l0, %l1
	jmpl %l1, %o5
	bcc	%icc,	loop_512
	sethi	0x1AD5,	%o0
	fcmple16	%f8,	%f2,	%g1
loop_511:
	fnot2	%f2,	%f12
loop_512:
	xnorcc	%g3,	%l2,	%i4
	sdivx	%o6,	0x1AAB,	%g6
	set	0x28, %l0
	ldsha	[%l7 + %l0] 0x81,	%o3
	sethi	0x04CA,	%g4
	smul	%i7,	%o2,	%i0
	alignaddrl	%i6,	%l1,	%i1
	movpos	%icc,	%o1,	%i5
	fmul8x16	%f18,	%f20,	%f18
	fmovsvs	%xcc,	%f4,	%f25
	ldd	[%l7 + 0x20],	%l4
	xorcc	%g2,	%l4,	%g7
	te	%xcc,	0x5
	nop
	setx	0xE91813D96DC04F0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x702713E386B452A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f2,	%f24
	udivcc	%l6,	0x1C5A,	%i2
	brz	%i3,	loop_513
	nop
	setx	0x2DB7CCB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xB5AF0B1F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f15,	%f17
	addcc	%g5,	%o7,	%o4
	tvs	%xcc,	0x2
loop_513:
	tge	%xcc,	0x2
	tne	%icc,	0x7
	tneg	%icc,	0x1
	fmovsvs	%icc,	%f17,	%f4
	movge	%xcc,	%l0,	%l3
	fands	%f22,	%f10,	%f9
	popc	0x0DB0,	%o5
	sub	%o0,	0x104A,	%g1
	smul	%l2,	%i4,	%g3
	tcs	%xcc,	0x5
	edge8l	%o6,	%o3,	%g4
	fbge,a	%fcc3,	loop_514
	tne	%icc,	0x5
	call	loop_515
	ba	%xcc,	loop_516
loop_514:
	fcmpne16	%f30,	%f12,	%g6
	movl	%icc,	%o2,	%i7
loop_515:
	fpack32	%f6,	%f26,	%f20
loop_516:
	alignaddrl	%i0,	%l1,	%i1
	tsubcc	%i6,	0x11E4,	%o1
	nop
	fitod	%f8,	%f20
	fdtoi	%f20,	%f12
	membar	0x3E
	mulx	%l5,	0x121F,	%g2
	taddcc	%l4,	0x0C9E,	%g7
	ble,pn	%xcc,	loop_517
	movge	%icc,	%l6,	%i5
	xnor	%i2,	0x1241,	%g5
	bcs,pt	%icc,	loop_518
loop_517:
	tcs	%icc,	0x2
	movpos	%icc,	%i3,	%o4
	movpos	%xcc,	%o7,	%l3
loop_518:
	movrne	%o5,	0x37B,	%l0
	nop
	fitos	%f9,	%f20
	fstoi	%f20,	%f17
	bneg,a,pt	%icc,	loop_519
	movleu	%xcc,	%g1,	%l2
	nop
	setx	0x7045A937,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	set	0x3E, %i2
	lduba	[%l7 + %i2] 0x0c,	%o0
loop_519:
	edge32	%i4,	%o6,	%g3
	tsubcctv	%o3,	0x1637,	%g4
	umul	%o2,	0x1AFF,	%g6
	tpos	%icc,	0x5
	tneg	%xcc,	0x3
	sll	%i7,	%l1,	%i0
	fmovdcs	%xcc,	%f16,	%f22
	set	0x2C, %l5
	stwa	%i6,	[%l7 + %l5] 0x2b
	membar	#Sync
	sdiv	%i1,	0x1231,	%o1
	mulscc	%g2,	%l4,	%g7
	fnot2s	%f17,	%f24
	xor	%l6,	%i5,	%i2
	movle	%xcc,	%g5,	%l5
	nop
	setx	0xF501D7D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xC6014835,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f4,	%f3
	edge32ln	%o4,	%i3,	%o7
	fbue,a	%fcc3,	loop_520
	be,pn	%icc,	loop_521
	movle	%xcc,	%l3,	%o5
	fbg,a	%fcc0,	loop_522
loop_520:
	movle	%icc,	%l0,	%g1
loop_521:
	fmuld8ulx16	%f4,	%f22,	%f18
	nop
	setx loop_523, %l0, %l1
	jmpl %l1, %l2
loop_522:
	tg	%icc,	0x5
	tn	%icc,	0x6
	mulx	%o0,	0x019B,	%i4
loop_523:
	tle	%xcc,	0x2
	wr	%g0,	0x2b,	%asi
	stba	%g3,	[%l7 + 0x45] %asi
	membar	#Sync
	movcs	%xcc,	%o3,	%g4
	edge32n	%o6,	%o2,	%g6
	sll	%l1,	0x0C,	%i0
	swap	[%l7 + 0x6C],	%i6
	xnor	%i7,	%i1,	%o1
	bvs,a,pn	%icc,	loop_524
	movpos	%xcc,	%g2,	%l4
	swap	[%l7 + 0x34],	%l6
	smul	%g7,	%i2,	%g5
loop_524:
	movrlz	%i5,	0x20E,	%l5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%i3
	ta	%xcc,	0x0
	prefetch	[%l7 + 0x58],	 0x0
	array32	%l3,	%o5,	%o7
	fbul	%fcc0,	loop_525
	tgu	%xcc,	0x4
	movne	%icc,	%g1,	%l0
	srax	%o0,	0x17,	%l2
loop_525:
	tcc	%icc,	0x6
	bneg	%xcc,	loop_526
	smulcc	%g3,	%i4,	%o3
	xorcc	%g4,	%o6,	%g6
	xor	%o2,	0x0AC2,	%i0
loop_526:
	sllx	%l1,	%i6,	%i1
	fcmpne16	%f0,	%f12,	%o1
	edge16l	%i7,	%g2,	%l6
	udivx	%l4,	0x0B1C,	%g7
	movrgez	%g5,	%i5,	%i2
	edge32	%l5,	%i3,	%o4
	fmovsa	%xcc,	%f13,	%f13
	movrlez	%l3,	%o7,	%o5
	move	%xcc,	%g1,	%o0
	subc	%l2,	%g3,	%i4
	xnorcc	%l0,	0x146E,	%g4
	ldsw	[%l7 + 0x74],	%o6
	edge32ln	%o3,	%g6,	%i0
	xorcc	%l1,	%o2,	%i6
	fmovsne	%icc,	%f11,	%f7
	umul	%i1,	0x1E96,	%o1
	brgz,a	%g2,	loop_527
	ta	%icc,	0x3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%l6,	%i7
loop_527:
	fmovspos	%xcc,	%f26,	%f12
	set	0x74, %i6
	lduwa	[%l7 + %i6] 0x04,	%g7
	movg	%xcc,	%g5,	%i5
	movpos	%xcc,	%l4,	%i2
	edge8	%i3,	%l5,	%l3
	mova	%xcc,	%o7,	%o4
	movg	%xcc,	%o5,	%g1
	sub	%o0,	%g3,	%l2
	nop
	setx	0x70579D70,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	nop
	setx	0x42B7C1A33CED1453,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f20
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x18] %asi,	%f28
	udiv	%i4,	0x1BF9,	%l0
	nop
	fitos	%f3,	%f9
	fstox	%f9,	%f12
	edge32ln	%g4,	%o6,	%o3
	set	0x70, %o2
	stxa	%g6,	[%l7 + %o2] 0x89
	tsubcctv	%i0,	0x0EDC,	%l1
	fabsd	%f16,	%f2
	tn	%xcc,	0x6
	fmovsleu	%xcc,	%f3,	%f3
	srl	%o2,	0x05,	%i1
	fnors	%f11,	%f8,	%f20
	nop
	fitod	%f8,	%f10
	fdtoi	%f10,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc2,	loop_528
	smul	%o1,	%i6,	%l6
	st	%f2,	[%l7 + 0x44]
	set	0x3E, %o1
	ldstuba	[%l7 + %o1] 0x80,	%i7
loop_528:
	fmovse	%xcc,	%f30,	%f19
	fand	%f22,	%f10,	%f0
	edge32	%g2,	%g7,	%g5
	ldsh	[%l7 + 0x7A],	%l4
	movpos	%xcc,	%i2,	%i3
	nop
	setx	0xE01D7063004EC783,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	tcs	%xcc,	0x6
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
	st	%f8,	[%l7 + 0x4C]
	fmovrdlz	%l3,	%f6,	%f10
	orncc	%o7,	0x07E7,	%i5
	andcc	%o5,	0x0327,	%g1
	movl	%xcc,	%o0,	%o4
	movrne	%g3,	%i4,	%l2
	nop
	setx	0x7242A4F532DFAC8F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x07C1C505D64011D2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f18,	%f18
	alignaddr	%g4,	%o6,	%l0
	nop
	set	0x14, %g3
	lduh	[%l7 + %g3],	%g6
	edge8ln	%i0,	%l1,	%o3
	fabsd	%f14,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o2,	%i1,	%o1
	movrne	%l6,	%i7,	%i6
	orcc	%g2,	0x03ED,	%g5
	set	0x60, %o0
	stxa	%g7,	[%l7 + %o0] 0x23
	membar	#Sync
	fmovsleu	%icc,	%f30,	%f0
	fbue,a	%fcc2,	loop_529
	mova	%xcc,	%i2,	%l4
	fbu,a	%fcc3,	loop_530
	nop
	setx	0x7BEAF09AA06C4F94,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_529:
	movre	%i3,	0x0F1,	%l5
	smul	%l3,	%o7,	%i5
loop_530:
	sub	%o5,	0x193F,	%o0
	edge16	%o4,	%g1,	%i4
	movvs	%icc,	%g3,	%l2
	fmuld8ulx16	%f19,	%f7,	%f4
	brlz,a	%g4,	loop_531
	sllx	%l0,	0x11,	%o6
	bvc	loop_532
	edge8l	%i0,	%g6,	%l1
loop_531:
	xnor	%o3,	0x0485,	%o2
	ta	%icc,	0x3
loop_532:
	srax	%i1,	0x0B,	%o1
	tle	%xcc,	0x7
	andncc	%l6,	%i7,	%i6
	nop
	fitos	%f11,	%f24
	brlez	%g2,	loop_533
	tl	%xcc,	0x5
	fmul8ulx16	%f10,	%f16,	%f2
	fmovse	%xcc,	%f22,	%f21
loop_533:
	ld	[%l7 + 0x08],	%f19
	smul	%g7,	0x0A4E,	%i2
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0x1e
	membar	#Sync
	srl	%g5,	0x11,	%i3
	array32	%l4,	%l5,	%l3
	tcc	%xcc,	0x2
	bpos,a,pt	%xcc,	loop_534
	tl	%icc,	0x6
	stx	%i5,	[%l7 + 0x20]
	fbul,a	%fcc3,	loop_535
loop_534:
	edge16ln	%o5,	%o7,	%o0
	fcmpne32	%f4,	%f6,	%g1
	brnz,a	%i4,	loop_536
loop_535:
	or	%g3,	%o4,	%l2
	taddcctv	%l0,	%g4,	%i0
	tsubcctv	%g6,	%o6,	%o3
loop_536:
	edge32ln	%o2,	%l1,	%i1
	movrgez	%o1,	0x1D9,	%l6
	edge16l	%i6,	%i7,	%g7
	edge32n	%g2,	%g5,	%i2
	tsubcc	%l4,	0x15EE,	%l5
	lduh	[%l7 + 0x2C],	%l3
	tg	%xcc,	0x4
	movle	%icc,	%i3,	%o5
	addc	%o7,	0x0617,	%i5
	movn	%xcc,	%o0,	%g1
	movrlz	%i4,	%g3,	%l2
	movvc	%xcc,	%o4,	%l0
	movpos	%icc,	%g4,	%g6
	edge16l	%i0,	%o3,	%o2
	nop
	setx	0xB07F5DA6,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	fmul8sux16	%f20,	%f22,	%f12
	movrgez	%l1,	0x1FC,	%o6
	addccc	%o1,	%l6,	%i6
	set	0x68, %g4
	sta	%f31,	[%l7 + %g4] 0x11
	fmovrsgz	%i7,	%f27,	%f14
	taddcc	%i1,	0x0D3F,	%g7
	fmovrdlez	%g5,	%f18,	%f10
	movneg	%icc,	%i2,	%l4
	nop
	setx	0x9A7A5866088E6C0A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xF0D371A4E2618A7F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f24,	%f0
	prefetch	[%l7 + 0x14],	 0x3
	fmovdleu	%xcc,	%f28,	%f3
	subc	%l5,	0x1E2A,	%g2
	bn,a	%xcc,	loop_537
	taddcctv	%l3,	0x1649,	%i3
	edge8l	%o5,	%i5,	%o0
	ldsh	[%l7 + 0x56],	%o7
loop_537:
	edge8ln	%g1,	%i4,	%l2
	srlx	%g3,	0x19,	%o4
	mova	%icc,	%g4,	%l0
	addc	%g6,	0x0209,	%o3
	fba,a	%fcc2,	loop_538
	membar	0x54
	set	0x78, %l2
	stwa	%o2,	[%l7 + %l2] 0x14
loop_538:
	fnot2s	%f17,	%f24
	bge,a,pn	%icc,	loop_539
	fmovdvc	%xcc,	%f20,	%f20
	tgu	%xcc,	0x2
	ldd	[%l7 + 0x78],	%f6
loop_539:
	addc	%l1,	%i0,	%o6
	xorcc	%l6,	0x057D,	%i6
	ble	loop_540
	nop
	setx loop_541, %l0, %l1
	jmpl %l1, %o1
	fbuge	%fcc1,	loop_542
	swap	[%l7 + 0x60],	%i7
loop_540:
	alignaddrl	%i1,	%g5,	%g7
loop_541:
	fbge	%fcc0,	loop_543
loop_542:
	tpos	%xcc,	0x4
	mulx	%i2,	0x1AB8,	%l5
	fbule,a	%fcc2,	loop_544
loop_543:
	fand	%f10,	%f18,	%f28
	xorcc	%g2,	0x08A3,	%l3
	sll	%l4,	%o5,	%i3
loop_544:
	udivcc	%i5,	0x0829,	%o7
	bgu,pn	%xcc,	loop_545
	nop
	setx	0xE7EA25C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x8BEDB706,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f17,	%f12
	mulx	%g1,	0x0A4A,	%o0
	andn	%i4,	%l2,	%g3
loop_545:
	fnot2s	%f31,	%f11
	fmovsl	%icc,	%f9,	%f5
	nop
	setx	0xDB3A652F06EA1A9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xCBAB2CEDF37E6B00,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f16,	%f24
	andcc	%g4,	0x13B6,	%l0
	fsrc1	%f24,	%f0
	addccc	%o4,	%o3,	%g6
	stw	%l1,	[%l7 + 0x2C]
	tl	%xcc,	0x0
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x0A] %asi,	%i0
	sra	%o2,	%l6,	%o6
	nop
	setx	0x6B047943,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x5884CF51,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f16,	%f20
	tneg	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x1C] %asi,	%i6
	ta	%xcc,	0x7
	xorcc	%o1,	%i7,	%g5
	sll	%g7,	%i1,	%l5
	fmovrdlz	%g2,	%f22,	%f0
	sdivcc	%i2,	0x03B1,	%l3
	movg	%icc,	%o5,	%i3
	nop
	setx	0xE87F5DACC9CB6227,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f0
	fandnot2s	%f21,	%f21,	%f22
	fmovdgu	%icc,	%f24,	%f11
	brlez,a	%l4,	loop_546
	srax	%o7,	0x15,	%i5
	add	%o0,	%i4,	%g1
	nop
	setx	loop_547,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_546:
	be	loop_548
	bvs,a	loop_549
	sdivx	%g3,	0x0618,	%g4
loop_547:
	subcc	%l0,	0x0AB6,	%l2
loop_548:
	fmovrsne	%o4,	%f31,	%f25
loop_549:
	tcc	%icc,	0x3
	set	0x38, %l4
	ldxa	[%l7 + %l4] 0x88,	%o3
	fbe,a	%fcc2,	loop_550
	array8	%l1,	%i0,	%g6
	tsubcc	%o2,	0x00F6,	%o6
	fbo	%fcc1,	loop_551
loop_550:
	be,a	%xcc,	loop_552
	ldsw	[%l7 + 0x6C],	%l6
	srax	%i6,	0x06,	%i7
loop_551:
	edge16ln	%g5,	%o1,	%i1
loop_552:
	brgez	%g7,	loop_553
	subcc	%g2,	%i2,	%l3
	sir	0x1B19
	tn	%icc,	0x6
loop_553:
	orncc	%l5,	%i3,	%o5
	fmul8x16	%f19,	%f24,	%f28
	xnorcc	%l4,	%i5,	%o0
	tl	%icc,	0x4
	and	%o7,	0x0CB1,	%i4
	fmovde	%icc,	%f7,	%f19
	ba	loop_554
	edge32ln	%g1,	%g4,	%g3
	fbl	%fcc0,	loop_555
	edge16l	%l2,	%l0,	%o3
loop_554:
	subcc	%l1,	0x161B,	%i0
	movvs	%icc,	%g6,	%o4
loop_555:
	lduw	[%l7 + 0x54],	%o2
	fbo,a	%fcc3,	loop_556
	call	loop_557
	udivx	%l6,	0x04F6,	%o6
	fmovscs	%icc,	%f3,	%f7
loop_556:
	fbo	%fcc3,	loop_558
loop_557:
	nop
	fitos	%f10,	%f21
	fstoi	%f21,	%f7
	fcmpeq32	%f8,	%f20,	%i6
	smul	%g5,	0x18A4,	%o1
loop_558:
	fmovsl	%xcc,	%f6,	%f16
	andn	%i1,	0x13E5,	%i7
	lduw	[%l7 + 0x74],	%g7
	udivx	%i2,	0x0039,	%l3
	fbo,a	%fcc3,	loop_559
	tn	%icc,	0x3
	ldd	[%l7 + 0x28],	%f8
	fmovda	%icc,	%f18,	%f24
loop_559:
	movle	%icc,	%g2,	%l5
	fbu,a	%fcc0,	loop_560
	fnand	%f20,	%f18,	%f20
	mulx	%i3,	%l4,	%i5
	brgez,a	%o5,	loop_561
loop_560:
	fmovsl	%xcc,	%f9,	%f14
	movrgz	%o0,	0x0EC,	%i4
	edge32l	%o7,	%g1,	%g3
loop_561:
	umul	%l2,	0x09FB,	%g4
	alignaddrl	%l0,	%l1,	%o3
	fmovrdne	%i0,	%f6,	%f4
	andncc	%o4,	%o2,	%g6
	tleu	%xcc,	0x5
	movgu	%icc,	%l6,	%i6
	fbule	%fcc0,	loop_562
	array16	%o6,	%g5,	%i1
	brgez,a	%o1,	loop_563
	xorcc	%i7,	0x00CE,	%i2
loop_562:
	edge16ln	%g7,	%l3,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_563:
	orcc	%l5,	%i3,	%l4
	fnor	%f8,	%f16,	%f2
	fbe	%fcc1,	loop_564
	edge32	%o5,	%o0,	%i5
	fmovdpos	%xcc,	%f9,	%f6
	brgez,a	%o7,	loop_565
loop_564:
	movgu	%xcc,	%i4,	%g3
	smul	%g1,	0x0226,	%l2
	orcc	%g4,	%l0,	%l1
loop_565:
	and	%i0,	0x19C2,	%o3
	tgu	%icc,	0x7
	nop
	fitos	%f4,	%f30
	fstox	%f30,	%f26
	sdiv	%o2,	0x0A5D,	%g6
	subcc	%o4,	0x087F,	%i6
	call	loop_566
	ldstub	[%l7 + 0x08],	%o6
	movcs	%icc,	%l6,	%g5
	movne	%icc,	%i1,	%i7
loop_566:
	fbul,a	%fcc1,	loop_567
	movvc	%xcc,	%o1,	%i2
	mova	%icc,	%g7,	%g2
	sub	%l5,	0x0696,	%l3
loop_567:
	nop
	wr	%g0,	0x04,	%asi
	stwa	%i3,	[%l7 + 0x44] %asi
	fcmpeq16	%f26,	%f18,	%o5
	movcc	%icc,	%o0,	%i5
	fmovsvc	%xcc,	%f0,	%f20
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x7D] %asi,	%o7
	and	%l4,	0x00A6,	%i4
	umul	%g1,	%l2,	%g4
	set	0x3D, %o4
	ldstuba	[%l7 + %o4] 0x10,	%g3
	edge8ln	%l0,	%l1,	%o3
	movg	%icc,	%i0,	%o2
	xorcc	%g6,	%o4,	%o6
	taddcc	%i6,	0x18FD,	%l6
	fbug,a	%fcc1,	loop_568
	xnor	%i1,	%g5,	%o1
	stb	%i7,	[%l7 + 0x63]
	movpos	%icc,	%i2,	%g2
loop_568:
	nop
	fitod	%f12,	%f22
	fdtox	%f22,	%f6
	edge32ln	%l5,	%g7,	%l3
	fbne,a	%fcc3,	loop_569
	movl	%xcc,	%o5,	%i3
	fmovdne	%xcc,	%f24,	%f27
	addc	%i5,	%o7,	%o0
loop_569:
	fones	%f27
	nop
	fitos	%f10,	%f7
	fstod	%f7,	%f20
	smul	%l4,	%g1,	%l2
	fmovdge	%xcc,	%f10,	%f15
	xorcc	%g4,	%i4,	%g3
	umulcc	%l0,	0x1D32,	%l1
	nop
	fitod	%f2,	%f24
	fdtoi	%f24,	%f26
	and	%o3,	0x13A5,	%i0
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g6
	call	loop_570
	edge16l	%o4,	%o2,	%o6
	nop
	setx	0xE375F273,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x59874B0C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f20,	%f3
	umulcc	%l6,	%i6,	%g5
loop_570:
	fbe,a	%fcc2,	loop_571
	swap	[%l7 + 0x6C],	%o1
	sdivcc	%i1,	0x05DF,	%i7
	movg	%xcc,	%g2,	%l5
loop_571:
	andn	%g7,	0x1AB7,	%l3
	movl	%xcc,	%o5,	%i3
	fbge	%fcc1,	loop_572
	fabss	%f30,	%f6
	fxors	%f28,	%f28,	%f15
	tne	%icc,	0x6
loop_572:
	movgu	%xcc,	%i2,	%i5
	fmovrde	%o0,	%f8,	%f16
	set	0x34, %i5
	lduwa	[%l7 + %i5] 0x81,	%l4
	subc	%o7,	0x0D30,	%g1
	movneg	%xcc,	%g4,	%l2
	ta	%xcc,	0x0
	taddcc	%i4,	0x1FF8,	%l0
	movle	%icc,	%g3,	%l1
	bpos	%xcc,	loop_573
	brgez	%i0,	loop_574
	nop
	setx	0xFD1860F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x4978662D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f15,	%f3
	bl,a,pt	%xcc,	loop_575
loop_573:
	xnorcc	%g6,	%o4,	%o2
loop_574:
	fands	%f25,	%f20,	%f19
	taddcc	%o6,	0x135B,	%l6
loop_575:
	nop
	setx	0x7C62A5AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x353E2133,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f6,	%f29
	movge	%icc,	%i6,	%o3
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g5
	movne	%icc,	%o1,	%i7
	fabsd	%f24,	%f6
	tneg	%icc,	0x6
	fbo,a	%fcc1,	loop_576
	bneg,pn	%xcc,	loop_577
	fmovsa	%icc,	%f30,	%f7
	sethi	0x12E1,	%g2
loop_576:
	nop
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x1f,	%f16
loop_577:
	nop
	setx	0x99580689,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f22
	edge8	%i1,	%g7,	%l5
	fmovrdne	%l3,	%f22,	%f30
	andcc	%i3,	0x0767,	%o5
	edge8ln	%i5,	%i2,	%l4
	tl	%icc,	0x4
	sra	%o7,	0x09,	%g1
	ba,pn	%xcc,	loop_578
	movpos	%icc,	%g4,	%o0
	movg	%xcc,	%i4,	%l2
	fba	%fcc3,	loop_579
loop_578:
	edge8ln	%g3,	%l1,	%i0
	sub	%g6,	%o4,	%l0
	movg	%icc,	%o6,	%o2
loop_579:
	sra	%i6,	%o3,	%g5
	tn	%icc,	0x3
	bg	loop_580
	movcc	%icc,	%l6,	%i7
	fbule	%fcc2,	loop_581
	or	%o1,	%i1,	%g2
loop_580:
	movneg	%xcc,	%g7,	%l5
	edge16ln	%l3,	%o5,	%i5
loop_581:
	xorcc	%i3,	0x026A,	%i2
	movrlz	%l4,	0x0F2,	%g1
	membar	0x47
	ld	[%l7 + 0x2C],	%f11
	set	0x66, %g6
	ldsha	[%l7 + %g6] 0x88,	%g4
	sth	%o7,	[%l7 + 0x5E]
	st	%f8,	[%l7 + 0x20]
	sllx	%o0,	0x07,	%i4
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x68] %asi,	%l2
	sth	%l1,	[%l7 + 0x64]
	tcc	%icc,	0x5
	alignaddrl	%g3,	%i0,	%g6
	nop
	setx	0x9BFE5EE8F654C560,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x303D3A70D038FF6A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f20,	%f0
	tl	%icc,	0x3
	fbe	%fcc2,	loop_582
	fmovspos	%xcc,	%f11,	%f31
	nop
	setx loop_583, %l0, %l1
	jmpl %l1, %l0
	subc	%o4,	%o2,	%o6
loop_582:
	swap	[%l7 + 0x44],	%i6
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x12] %asi,	%o3
loop_583:
	tle	%icc,	0x0
	nop
	fitos	%f13,	%f19
	fstox	%f19,	%f18
	fxtos	%f18,	%f11
	sdivx	%g5,	0x1ACB,	%l6
	movgu	%xcc,	%o1,	%i1
	ldd	[%l7 + 0x10],	%f24
	taddcc	%g2,	0x1373,	%g7
	ldstub	[%l7 + 0x4D],	%i7
	smulcc	%l3,	0x05C4,	%o5
	bcc,a	loop_584
	mulscc	%l5,	%i5,	%i2
	xor	%i3,	%g1,	%g4
	fmul8x16au	%f1,	%f12,	%f10
loop_584:
	umul	%o7,	0x0BA8,	%l4
	umul	%i4,	%o0,	%l1
	tsubcc	%l2,	%g3,	%i0
	fbue,a	%fcc1,	loop_585
	andcc	%l0,	0x0035,	%g6
	bl,pn	%icc,	loop_586
	ble,a,pt	%xcc,	loop_587
loop_585:
	fbe	%fcc1,	loop_588
	sllx	%o2,	0x1F,	%o4
loop_586:
	fcmple32	%f26,	%f2,	%o6
loop_587:
	st	%f31,	[%l7 + 0x68]
loop_588:
	tge	%xcc,	0x4
	tne	%icc,	0x3
	orncc	%o3,	0x1DC2,	%g5
	fmovda	%xcc,	%f20,	%f13
	prefetch	[%l7 + 0x0C],	 0x0
	edge16n	%l6,	%o1,	%i6
	fands	%f3,	%f6,	%f7
	movcc	%icc,	%g2,	%g7
	fpackfix	%f6,	%f15
	sir	0x180B
	tvc	%xcc,	0x5
	tsubcc	%i7,	%i1,	%o5
	be,a	%icc,	loop_589
	fand	%f12,	%f18,	%f26
	bneg,a,pt	%icc,	loop_590
	sir	0x00A1
loop_589:
	andn	%l5,	0x1DF0,	%i5
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x68] %asi,	%i2
loop_590:
	edge16	%l3,	%g1,	%g4
	movne	%icc,	%i3,	%l4
	addccc	%o7,	%o0,	%l1
	fpsub32	%f22,	%f28,	%f12
	orcc	%i4,	0x15AA,	%l2
	fpadd16	%f6,	%f24,	%f22
	nop
	fitos	%f5,	%f1
	fstoi	%f1,	%f26
	fands	%f12,	%f29,	%f4
	edge32ln	%i0,	%g3,	%l0
	sth	%g6,	[%l7 + 0x3A]
	srl	%o4,	0x18,	%o6
	tg	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x54] %asi,	%f17
	tcc	%xcc,	0x5
	fsrc2	%f8,	%f0
	add	%o2,	0x11A6,	%g5
	ldd	[%l7 + 0x78],	%f28
	fbn,a	%fcc2,	loop_591
	array32	%o3,	%l6,	%o1
	tneg	%xcc,	0x4
	fmul8x16	%f9,	%f12,	%f6
loop_591:
	andn	%i6,	%g7,	%g2
	movvc	%icc,	%i1,	%o5
	fmovsg	%icc,	%f12,	%f27
	edge16	%i7,	%i5,	%i2
	ble,a,pt	%xcc,	loop_592
	fmovsge	%icc,	%f3,	%f11
	array8	%l5,	%g1,	%l3
	movneg	%icc,	%g4,	%i3
loop_592:
	addcc	%l4,	%o0,	%o7
	fabsd	%f26,	%f2
	xnorcc	%i4,	0x0D27,	%l2
	movcc	%icc,	%i0,	%l1
	ld	[%l7 + 0x40],	%f15
	fmovdpos	%xcc,	%f30,	%f21
	bn	loop_593
	fmuld8sux16	%f5,	%f19,	%f10
	fmovdvc	%xcc,	%f12,	%f14
	stb	%g3,	[%l7 + 0x46]
loop_593:
	be	%xcc,	loop_594
	edge16	%g6,	%o4,	%o6
	brgez,a	%o2,	loop_595
	array32	%g5,	%l0,	%l6
loop_594:
	movvc	%xcc,	%o1,	%i6
	edge32ln	%o3,	%g2,	%g7
loop_595:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f18,	%f9
	ta	%xcc,	0x0
	te	%icc,	0x4
	fnot1s	%f21,	%f20
	tpos	%icc,	0x6
	bl,a	loop_596
	bpos,a	%icc,	loop_597
	alignaddrl	%o5,	%i7,	%i1
	for	%f24,	%f26,	%f14
loop_596:
	edge8	%i2,	%i5,	%g1
loop_597:
	tsubcc	%l5,	%l3,	%g4
	brgz	%l4,	loop_598
	tl	%icc,	0x5
	fcmpeq32	%f10,	%f26,	%i3
	fba	%fcc0,	loop_599
loop_598:
	fnors	%f15,	%f8,	%f12
	movrne	%o0,	%o7,	%l2
	tvc	%icc,	0x2
loop_599:
	fmovrdne	%i0,	%f16,	%f14
	stw	%l1,	[%l7 + 0x58]
	umulcc	%g3,	%i4,	%g6
	fcmpeq32	%f22,	%f24,	%o4
	sllx	%o6,	0x14,	%g5
	movrgz	%l0,	%l6,	%o1
	sir	0x1C84
	udiv	%o2,	0x1B16,	%i6
	fmul8x16al	%f20,	%f11,	%f20
	mova	%icc,	%g2,	%g7
	tn	%xcc,	0x7
	nop
	setx	0x1EBF6A0B5ED847EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE26C59D9206DFEA0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f12,	%f28
	andcc	%o5,	%o3,	%i1
	tneg	%xcc,	0x0
	addcc	%i2,	%i5,	%g1
	fcmple16	%f12,	%f12,	%l5
	membar	0x3E
	subccc	%l3,	%g4,	%i7
	srl	%i3,	%o0,	%l4
	fbuge	%fcc0,	loop_600
	fmovscs	%xcc,	%f5,	%f7
	fabsd	%f16,	%f4
	membar	0x4D
loop_600:
	andcc	%o7,	%l2,	%i0
	sdivx	%l1,	0x0DDB,	%i4
	stb	%g6,	[%l7 + 0x60]
	array16	%o4,	%o6,	%g3
	movne	%xcc,	%g5,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l6,	0x11DF,	%o1
	fnot2s	%f23,	%f26
	smul	%o2,	%g2,	%i6
	movrgez	%o5,	0x10A,	%g7
	srlx	%i1,	0x11,	%o3
	subc	%i5,	0x0482,	%i2
	fpsub16s	%f10,	%f16,	%f13
	subccc	%g1,	0x1AE0,	%l3
	fbuge,a	%fcc0,	loop_601
	bcs,pn	%icc,	loop_602
	sdivcc	%l5,	0x16B2,	%g4
	taddcc	%i7,	%o0,	%i3
loop_601:
	addc	%l4,	%o7,	%l2
loop_602:
	fxor	%f20,	%f12,	%f28
	bvs	%icc,	loop_603
	udivx	%l1,	0x029C,	%i0
	sdivx	%i4,	0x1844,	%o4
	udiv	%g6,	0x11F1,	%g3
loop_603:
	array32	%g5,	%l0,	%l6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o6,	%o2
	sll	%o1,	%i6,	%o5
	tneg	%xcc,	0x2
	sdivx	%g2,	0x146F,	%i1
	bcc,a,pt	%icc,	loop_604
	bn	loop_605
	fbge	%fcc0,	loop_606
	movgu	%xcc,	%o3,	%g7
loop_604:
	orncc	%i5,	%g1,	%l3
loop_605:
	xorcc	%l5,	%g4,	%i2
loop_606:
	fmul8x16au	%f26,	%f30,	%f22
	nop
	setx	0xDCCE3404B40D095E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x60A234F82CE864BC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f8,	%f4
	nop
	setx	0xF0654EABD29A6ADD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x2E9854C7A8B4F891,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f8,	%f12
	tcc	%icc,	0x1
	bcs,a	loop_607
	movl	%icc,	%o0,	%i3
	be,a,pn	%icc,	loop_608
	xnorcc	%l4,	0x1CE5,	%i7
loop_607:
	addccc	%o7,	%l2,	%l1
	fmovsl	%xcc,	%f0,	%f8
loop_608:
	movn	%icc,	%i0,	%o4
	tpos	%xcc,	0x3
	xnor	%g6,	%i4,	%g3
	brgz,a	%l0,	loop_609
	fbg,a	%fcc1,	loop_610
	edge32l	%g5,	%o6,	%l6
	smulcc	%o1,	0x1944,	%i6
loop_609:
	movvs	%icc,	%o5,	%g2
loop_610:
	fble,a	%fcc0,	loop_611
	movle	%xcc,	%i1,	%o2
	fornot1s	%f1,	%f29,	%f15
	fblg,a	%fcc2,	loop_612
loop_611:
	umul	%g7,	%o3,	%i5
	fmovrse	%l3,	%f6,	%f30
	edge32n	%l5,	%g4,	%i2
loop_612:
	ld	[%l7 + 0x0C],	%f2
	set	0x30, %l1
	ldswa	[%l7 + %l1] 0x04,	%g1
	tsubcctv	%o0,	%l4,	%i3
	ta	%xcc,	0x1
	orcc	%o7,	0x1C97,	%i7
	fbuge,a	%fcc2,	loop_613
	faligndata	%f8,	%f8,	%f4
	srlx	%l1,	%l2,	%o4
	fbge,a	%fcc1,	loop_614
loop_613:
	array32	%g6,	%i4,	%i0
	fbule	%fcc2,	loop_615
	swap	[%l7 + 0x14],	%l0
loop_614:
	sll	%g3,	%o6,	%l6
	fmovdle	%icc,	%f19,	%f28
loop_615:
	tcs	%xcc,	0x1
	subcc	%o1,	%g5,	%i6
	ldd	[%l7 + 0x30],	%f22
	tn	%xcc,	0x0
	tpos	%xcc,	0x6
	udivcc	%o5,	0x1F18,	%i1
	nop
	fitod	%f8,	%f28
	fdtox	%f28,	%f24
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x18] %asi,	%o2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g2,	%o3
	nop
	setx	loop_616,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%icc,	0x5
	tcc	%icc,	0x4
	bl,a,pt	%xcc,	loop_617
loop_616:
	alignaddrl	%i5,	%g7,	%l3
	bvc,pn	%icc,	loop_618
	stb	%g4,	[%l7 + 0x76]
loop_617:
	movpos	%xcc,	%l5,	%i2
	stx	%o0,	[%l7 + 0x28]
loop_618:
	move	%xcc,	%l4,	%i3
	bvc	loop_619
	movvs	%xcc,	%o7,	%g1
	udiv	%l1,	0x0D89,	%i7
	movle	%xcc,	%l2,	%g6
loop_619:
	subc	%o4,	%i0,	%i4
	movne	%xcc,	%l0,	%o6
	fmovdle	%icc,	%f17,	%f9
	srlx	%l6,	0x0A,	%o1
	bvs,pn	%icc,	loop_620
	subcc	%g3,	0x13AC,	%g5
	lduh	[%l7 + 0x68],	%o5
	fbule,a	%fcc2,	loop_621
loop_620:
	fornot2s	%f5,	%f5,	%f9
	sub	%i6,	%i1,	%g2
	movvc	%icc,	%o3,	%i5
loop_621:
	alignaddr	%o2,	%l3,	%g4
	nop
	setx	loop_622,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdlz	%g7,	%f20,	%f6
	movrgz	%l5,	%i2,	%l4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
loop_622:
	xnorcc	%o0,	%g1,	%l1
	fpmerge	%f15,	%f29,	%f24
	fbo,a	%fcc3,	loop_623
	edge32ln	%i7,	%l2,	%o7
	tgu	%xcc,	0x6
	nop
	setx	0xF0594D0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
loop_623:
	fba	%fcc3,	loop_624
	sll	%g6,	%i0,	%i4
	fpsub16	%f10,	%f8,	%f14
	fpmerge	%f13,	%f21,	%f2
loop_624:
	umulcc	%o4,	%l0,	%l6
	brlez,a	%o1,	loop_625
	sdiv	%o6,	0x1820,	%g5
	nop
	setx	0x71D21D4D371CE878,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f26
	orcc	%g3,	0x1784,	%o5
loop_625:
	ta	%icc,	0x6
	movneg	%icc,	%i6,	%i1
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x1C] %asi,	%o3
	tvs	%xcc,	0x5
	tg	%icc,	0x2
	edge32	%g2,	%i5,	%o2
	xnor	%l3,	0x0B2A,	%g7
	mulx	%l5,	0x1925,	%g4
	nop
	setx	0x879C13FEC25DC127,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f8
	array32	%l4,	%i3,	%o0
	umulcc	%g1,	0x1EA5,	%l1
	movge	%xcc,	%i7,	%l2
	udiv	%i2,	0x1EE5,	%o7
	subc	%g6,	%i0,	%o4
	movgu	%icc,	%l0,	%l6
	tge	%icc,	0x6
	srlx	%o1,	0x0E,	%o6
	array8	%g5,	%i4,	%g3
	fmovrdgez	%o5,	%f8,	%f0
	fbl,a	%fcc1,	loop_626
	sethi	0x17D5,	%i1
	fone	%f2
	movleu	%icc,	%i6,	%g2
loop_626:
	addc	%o3,	0x18E5,	%o2
	movre	%l3,	%g7,	%i5
	edge16ln	%l5,	%g4,	%i3
	mova	%icc,	%l4,	%o0
	movre	%l1,	0x2B3,	%g1
	flush	%l7 + 0x50
	edge16	%i7,	%l2,	%i2
	edge32l	%o7,	%g6,	%i0
	sub	%l0,	0x0954,	%l6
	membar	0x66
	andn	%o1,	0x0D2B,	%o4
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sir	0x1FF3
	nop
	setx	0xF7E27E51,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xE48D23B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f30,	%f25
	fbe	%fcc1,	loop_627
	movrgz	%o6,	%i4,	%g3
	fnegs	%f24,	%f29
	array32	%o5,	%g5,	%i6
loop_627:
	tsubcctv	%g2,	%i1,	%o2
	nop
	setx	0x019632F82E09C007,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x57388966F180576E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f20,	%f0
	tsubcctv	%l3,	%g7,	%o3
	fnand	%f10,	%f10,	%f8
	for	%f18,	%f30,	%f20
	tneg	%xcc,	0x6
	nop
	setx	0x250C361A7677F204,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xB5BFB28BAEA1D545,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f8,	%f2
	fmovdne	%icc,	%f30,	%f29
	andn	%i5,	0x018F,	%l5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	movneg	%xcc,	%i3,	%o0
	tneg	%icc,	0x2
	bg,a	loop_628
	bvs	%icc,	loop_629
	addc	%l4,	%g1,	%l1
	addccc	%l2,	%i2,	%i7
loop_628:
	fmovdle	%icc,	%f6,	%f28
loop_629:
	movvc	%xcc,	%g6,	%o7
	addccc	%l0,	0x0043,	%l6
	xorcc	%o1,	0x0D77,	%i0
	tn	%icc,	0x2
	ldsw	[%l7 + 0x68],	%o6
	edge8	%i4,	%o4,	%o5
	tg	%xcc,	0x4
	nop
	setx	0x74537F8700573615,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	nop
	setx	0xC4367C91,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x58C3B057,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f27,	%f17
	call	loop_630
	movrgz	%g5,	%g3,	%i6
	mulscc	%g2,	%i1,	%o2
	array8	%l3,	%o3,	%i5
loop_630:
	tne	%xcc,	0x4
	xorcc	%l5,	0x0249,	%g7
	tneg	%xcc,	0x5
	sll	%g4,	%o0,	%l4
	edge32	%i3,	%g1,	%l1
	nop
	fitod	%f6,	%f26
	fdtox	%f26,	%f18
	tsubcc	%i2,	%i7,	%l2
	sra	%g6,	%l0,	%o7
	flush	%l7 + 0x10
	movg	%xcc,	%o1,	%l6
	movvc	%icc,	%i0,	%o6
	te	%icc,	0x7
	nop
	setx loop_631, %l0, %l1
	jmpl %l1, %o4
	edge16n	%i4,	%o5,	%g3
	sethi	0x0024,	%i6
	edge16l	%g2,	%g5,	%i1
loop_631:
	fbule,a	%fcc2,	loop_632
	tvc	%icc,	0x3
	xor	%o2,	0x1B8A,	%o3
	movle	%icc,	%l3,	%l5
loop_632:
	nop
	wr	%g0,	0x88,	%asi
	stba	%g7,	[%l7 + 0x2A] %asi
	fcmpgt32	%f14,	%f12,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o0,	%i5
	movrlez	%i3,	%l4,	%l1
	tvs	%xcc,	0x0
	sdiv	%i2,	0x1B4C,	%i7
	mulx	%g1,	0x1F4E,	%g6
	fmul8x16	%f0,	%f28,	%f24
	andcc	%l0,	%o7,	%l2
	edge16l	%l6,	%o1,	%i0
	addc	%o4,	%o6,	%o5
	movvc	%xcc,	%i4,	%i6
	fpsub16	%f4,	%f10,	%f8
	fpadd32s	%f8,	%f17,	%f23
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	fornot2	%f22,	%f8,	%f0
	addc	%g3,	%i1,	%g5
	tn	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o3,	%l3,	%l5
	tvc	%xcc,	0x4
	movneg	%xcc,	%g7,	%o2
	edge32ln	%o0,	%g4,	%i3
	andcc	%l4,	0x1BB6,	%l1
	tg	%icc,	0x4
	ldstub	[%l7 + 0x4F],	%i5
	fbue	%fcc2,	loop_633
	nop
	setx	0x827770FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x4BC6B96C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f2,	%f6
	ldstub	[%l7 + 0x79],	%i7
	movcs	%icc,	%i2,	%g1
loop_633:
	ba,pt	%xcc,	loop_634
	edge16n	%l0,	%g6,	%o7
	fnand	%f26,	%f30,	%f12
	te	%icc,	0x2
loop_634:
	movneg	%icc,	%l6,	%o1
	fxor	%f18,	%f28,	%f24
	fble	%fcc1,	loop_635
	movcs	%xcc,	%l2,	%o4
	edge32ln	%i0,	%o6,	%i4
	tle	%icc,	0x6
loop_635:
	lduh	[%l7 + 0x3E],	%i6
	wr	%g0,	0x80,	%asi
	stha	%g2,	[%l7 + 0x2C] %asi
	ta	%icc,	0x3
	ta	%icc,	0x2
	set	0x3F, %l6
	ldstuba	[%l7 + %l6] 0x89,	%g3
	fbe,a	%fcc2,	loop_636
	ta	%icc,	0x0
	sth	%o5,	[%l7 + 0x7E]
	srax	%g5,	0x17,	%o3
loop_636:
	fmul8x16	%f28,	%f2,	%f22
	sdivx	%i1,	0x051A,	%l5
	movre	%l3,	%o2,	%o0
	movge	%xcc,	%g7,	%i3
	fexpand	%f26,	%f20
	tvs	%xcc,	0x7
	andcc	%g4,	0x041D,	%l4
	brgez	%l1,	loop_637
	nop
	setx	0x355101BF0AAFC77E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x7772B5ECEEE6B93B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f16,	%f26
	tle	%xcc,	0x5
	udiv	%i7,	0x148B,	%i2
loop_637:
	fsrc2	%f8,	%f28
	addc	%i5,	%g1,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x3
	set	0x51, %i3
	ldsba	[%l7 + %i3] 0x11,	%l0
	sethi	0x0A25,	%o7
	edge8ln	%l6,	%l2,	%o4
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
	movrlez	%o6,	%i4,	%i6
	movg	%xcc,	%g2,	%i0
	tle	%xcc,	0x7
	movn	%icc,	%o5,	%g3
	bpos,a,pn	%xcc,	loop_638
	membar	0x7C
	movvs	%xcc,	%g5,	%i1
	subccc	%o3,	%l3,	%l5
loop_638:
	sdivx	%o2,	0x078A,	%g7
	array32	%i3,	%o0,	%g4
	nop
	setx	0xEDA3EBCDE6BB4E3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xA2556C555760DE12,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f6,	%f6
	tvs	%xcc,	0x4
	xnorcc	%l1,	%l4,	%i2
	nop
	setx	0x43205821,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f1
	tsubcctv	%i5,	0x1083,	%i7
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%g6
	tl	%xcc,	0x5
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x81,	 0x2
	movrgez	%l0,	0x21D,	%o7
	movrlez	%l2,	0x201,	%o4
	ldd	[%l7 + 0x28],	%f10
	xnor	%l6,	0x12CA,	%o1
	fbuge,a	%fcc0,	loop_639
	fmovd	%f16,	%f28
	fnors	%f22,	%f23,	%f17
	movle	%xcc,	%o6,	%i4
loop_639:
	sllx	%g2,	0x08,	%i0
	tge	%icc,	0x2
	set	0x24, %o6
	stha	%o5,	[%l7 + %o6] 0x89
	array32	%g3,	%g5,	%i1
	set	0x6E, %l3
	lduba	[%l7 + %l3] 0x10,	%i6
	be,a	loop_640
	mulscc	%l3,	0x0275,	%o3
	fble,a	%fcc3,	loop_641
	edge8	%l5,	%g7,	%i3
loop_640:
	fmovsgu	%xcc,	%f11,	%f9
	nop
	setx	0xDBD80D55,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xF9C50810,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f18,	%f2
loop_641:
	movne	%xcc,	%o2,	%o0
	movre	%g4,	0x19D,	%l1
	movleu	%xcc,	%i2,	%i5
	edge8l	%l4,	%i7,	%g6
	addccc	%g1,	0x15A4,	%l0
	orn	%l2,	%o7,	%l6
	umulcc	%o4,	0x19D5,	%o1
	sub	%o6,	%i4,	%i0
	fmovsle	%icc,	%f13,	%f25
	srl	%o5,	0x0E,	%g3
	tne	%xcc,	0x7
	bne,pt	%icc,	loop_642
	nop
	setx	loop_643,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movl	%xcc,	%g5,	%g2
	fabsd	%f10,	%f18
loop_642:
	fmovrsne	%i6,	%f11,	%f14
loop_643:
	mulx	%i1,	0x0EBA,	%o3
	set	0x49, %g1
	ldstuba	[%l7 + %g1] 0x81,	%l3
	ta	%xcc,	0x2
	popc	%l5,	%g7
	nop
	setx	0xB02A6B3DFEED4341,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f12
	addccc	%i3,	%o2,	%o0
	tgu	%xcc,	0x6
	fnot2s	%f9,	%f9
	subc	%g4,	0x096E,	%l1
	fpadd32	%f14,	%f22,	%f26
	for	%f8,	%f8,	%f10
	movl	%xcc,	%i2,	%i5
	fbule	%fcc3,	loop_644
	xnor	%i7,	0x0A3D,	%g6
	taddcctv	%g1,	0x1453,	%l0
	set	0x28, %g5
	ldsha	[%l7 + %g5] 0x18,	%l4
loop_644:
	fblg,a	%fcc1,	loop_645
	xnor	%l2,	0x0A17,	%l6
	movg	%xcc,	%o4,	%o7
	movl	%xcc,	%o1,	%o6
loop_645:
	tcc	%xcc,	0x5
	edge8ln	%i4,	%i0,	%o5
	fornot1s	%f13,	%f2,	%f2
	fmovsge	%icc,	%f2,	%f1
	nop
	setx	loop_646,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movre	%g5,	%g3,	%i6
	mulx	%g2,	0x0BFD,	%i1
	srl	%o3,	%l3,	%g7
loop_646:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i3,	%o2
	fbug	%fcc0,	loop_647
	ldub	[%l7 + 0x0E],	%l5
	brnz	%o0,	loop_648
	mulx	%g4,	%l1,	%i5
loop_647:
	lduh	[%l7 + 0x6E],	%i7
	edge16	%g6,	%i2,	%l0
loop_648:
	fmovrdlez	%l4,	%f28,	%f30
	set	0x18, %g7
	ldsha	[%l7 + %g7] 0x04,	%l2
	subcc	%g1,	0x1793,	%o4
	movpos	%icc,	%l6,	%o1
	nop
	fitod	%f1,	%f26
	movg	%icc,	%o6,	%i4
	tvs	%icc,	0x6
	stw	%i0,	[%l7 + 0x30]
	addcc	%o7,	0x1B2E,	%g5
	tl	%xcc,	0x4
	add	%g3,	0x0D97,	%o5
	sllx	%g2,	0x17,	%i6
	movleu	%icc,	%i1,	%l3
	movg	%icc,	%o3,	%g7
	movvs	%xcc,	%o2,	%i3
	bneg,a,pt	%icc,	loop_649
	alignaddrl	%l5,	%g4,	%l1
	umulcc	%o0,	0x104D,	%i7
	add	%g6,	%i5,	%i2
loop_649:
	fcmpeq32	%f30,	%f4,	%l0
	smulcc	%l4,	0x0EBB,	%g1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%l2
	fnot1s	%f2,	%f19
	fpsub32	%f28,	%f8,	%f30
	movneg	%icc,	%l6,	%o4
	subccc	%o6,	%o1,	%i0
	fmovdvs	%xcc,	%f14,	%f2
	fbge,a	%fcc2,	loop_650
	nop
	fitod	%f4,	%f20
	fdtox	%f20,	%f18
	bpos,pn	%icc,	loop_651
	fmovdleu	%xcc,	%f21,	%f9
loop_650:
	tneg	%xcc,	0x3
	xnorcc	%i4,	%o7,	%g5
loop_651:
	ble,a,pn	%icc,	loop_652
	fsrc1	%f20,	%f22
	fnors	%f5,	%f29,	%f16
	movpos	%icc,	%o5,	%g3
loop_652:
	sra	%g2,	0x1F,	%i6
	fba,a	%fcc0,	loop_653
	tvc	%icc,	0x3
	xorcc	%l3,	0x15E9,	%o3
	andcc	%g7,	0x0AB0,	%i1
loop_653:
	fxor	%f26,	%f0,	%f14
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f16
	bne,a	%xcc,	loop_654
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%i3,	%f27,	%f1
	bg,a,pt	%xcc,	loop_655
loop_654:
	movvc	%icc,	%o2,	%l5
	edge16n	%g4,	%o0,	%l1
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x04,	%f0
loop_655:
	fmovd	%f28,	%f6
	fbne	%fcc2,	loop_656
	movvc	%icc,	%g6,	%i7
	bn,a	%xcc,	loop_657
	movrgz	%i2,	%i5,	%l0
loop_656:
	call	loop_658
	movcc	%icc,	%l4,	%g1
loop_657:
	prefetch	[%l7 + 0x68],	 0x1
	fcmpgt16	%f16,	%f10,	%l2
loop_658:
	edge16ln	%o4,	%o6,	%l6
	fbge,a	%fcc2,	loop_659
	edge16	%i0,	%o1,	%o7
	fba	%fcc3,	loop_660
	movge	%icc,	%i4,	%g5
loop_659:
	orncc	%o5,	%g2,	%g3
	be	%xcc,	loop_661
loop_660:
	sra	%i6,	%l3,	%o3
	fmovsleu	%xcc,	%f4,	%f30
	edge16	%g7,	%i3,	%o2
loop_661:
	mulscc	%l5,	0x19D7,	%g4
	fxors	%f28,	%f22,	%f28
	ldstub	[%l7 + 0x78],	%i1
	ble,pt	%icc,	loop_662
	movvs	%icc,	%o0,	%l1
	fnors	%f0,	%f9,	%f12
	andn	%g6,	0x0CB8,	%i7
loop_662:
	nop
	set	0x1C, %i1
	ldsha	[%l7 + %i1] 0x10,	%i2
	andncc	%l0,	%i5,	%g1
	xor	%l2,	%o4,	%l4
	subc	%l6,	%i0,	%o1
	udiv	%o6,	0x13F9,	%i4
	fmovrdne	%o7,	%f2,	%f0
	udivx	%g5,	0x0548,	%o5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%g3,	%g2
	and	%i6,	0x1ACC,	%o3
	lduw	[%l7 + 0x28],	%l3
	fmovrde	%g7,	%f26,	%f8
	movrgez	%o2,	0x02F,	%i3
	fblg	%fcc3,	loop_663
	brgz	%g4,	loop_664
	array16	%i1,	%l5,	%l1
	te	%icc,	0x2
loop_663:
	array32	%o0,	%g6,	%i7
loop_664:
	umul	%l0,	%i5,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez,a	%i2,	loop_665
	movvs	%icc,	%o4,	%l2
	array32	%l6,	%l4,	%i0
	fcmpeq16	%f24,	%f10,	%o1
loop_665:
	fpsub32s	%f15,	%f15,	%f29
	edge16ln	%i4,	%o6,	%g5
	edge16n	%o5,	%g3,	%g2
	tne	%icc,	0x2
	smulcc	%i6,	%o7,	%o3
	movrne	%l3,	%o2,	%i3
	movl	%xcc,	%g4,	%g7
	add	%l5,	%i1,	%o0
	nop
	setx	loop_666,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%xcc,	0x6
	smul	%l1,	0x04F1,	%i7
	xnorcc	%l0,	0x0B88,	%i5
loop_666:
	nop
	fitod	%f6,	%f10
	fdtoi	%f10,	%f22
	nop
	setx loop_667, %l0, %l1
	jmpl %l1, %g6
	fnegs	%f1,	%f31
	fbuge	%fcc0,	loop_668
	alignaddr	%i2,	%o4,	%l2
loop_667:
	fbug,a	%fcc0,	loop_669
	alignaddrl	%g1,	%l4,	%i0
loop_668:
	tcc	%icc,	0x0
	bvc,a,pt	%icc,	loop_670
loop_669:
	add	%l6,	%i4,	%o6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x50] %asi,	%g5
loop_670:
	smulcc	%o1,	%g3,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x3
	movleu	%xcc,	%g2,	%o7
	edge8l	%i6,	%l3,	%o3
	andn	%i3,	0x176F,	%o2
	edge16l	%g7,	%g4,	%i1
	umul	%l5,	%o0,	%i7
	udivx	%l1,	0x1A17,	%i5
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f6
	fxtod	%f6,	%f2
	taddcctv	%g6,	%i2,	%o4
	srax	%l0,	0x04,	%g1
	mulx	%l4,	%i0,	%l6
	addc	%i4,	%l2,	%g5
	ta	%icc,	0x5
	sdivcc	%o1,	0x06D0,	%o6
	tcc	%xcc,	0x2
	edge16ln	%o5,	%g3,	%g2
	fcmpne32	%f28,	%f24,	%i6
	mulx	%o7,	0x0791,	%o3
	brgez	%l3,	loop_671
	sdivx	%i3,	0x00F8,	%o2
	alignaddr	%g7,	%i1,	%l5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x74] %asi,	%o0
loop_671:
	fmovsvs	%xcc,	%f14,	%f4
	addc	%g4,	0x15AB,	%l1
	movrne	%i7,	0x027,	%g6
	xnor	%i2,	%o4,	%i5
	fmovdge	%xcc,	%f28,	%f18
	sir	0x18E0
	be,a	%icc,	loop_672
	sir	0x14B1
	movle	%icc,	%l0,	%g1
	fbg,a	%fcc3,	loop_673
loop_672:
	move	%xcc,	%l4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i0,	%l2,	%g5
loop_673:
	bcc,a,pt	%icc,	loop_674
	array32	%i4,	%o6,	%o1
	tvc	%icc,	0x5
	srl	%o5,	%g2,	%g3
loop_674:
	sth	%o7,	[%l7 + 0x76]
	ldsw	[%l7 + 0x40],	%o3
	nop
	setx	loop_675,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%icc,	%l3,	%i6
	array16	%o2,	%i3,	%i1
	movn	%icc,	%l5,	%o0
loop_675:
	movcs	%icc,	%g4,	%l1
	std	%f30,	[%l7 + 0x10]
	tleu	%xcc,	0x4
	lduw	[%l7 + 0x5C],	%g7
	fmovrslz	%i7,	%f6,	%f27
	tgu	%icc,	0x2
	fmovsneg	%xcc,	%f13,	%f20
	brz,a	%i2,	loop_676
	ldsh	[%l7 + 0x58],	%g6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x11,	%o4,	%i5
loop_676:
	tvc	%xcc,	0x5
	membar	0x1E
	movleu	%xcc,	%g1,	%l4
	stb	%l6,	[%l7 + 0x2F]
	fcmple16	%f2,	%f28,	%l0
	xnorcc	%i0,	%l2,	%i4
	movrgz	%g5,	%o6,	%o5
	ldd	[%l7 + 0x30],	%g2
	membar	0x69
	alignaddrl	%o1,	%o7,	%g3
	movrlez	%o3,	%l3,	%i6
	nop
	fitos	%f5,	%f16
	fstox	%f16,	%f22
	sll	%o2,	%i3,	%i1
	bg,pn	%icc,	loop_677
	nop
	fitos	%f3,	%f7
	fstox	%f7,	%f2
	set	0x68, %i7
	swapa	[%l7 + %i7] 0x0c,	%o0
loop_677:
	sir	0x0ACD
	fmovrde	%g4,	%f24,	%f20
	srl	%l5,	0x00,	%l1
	addc	%g7,	0x09C4,	%i2
	xor	%g6,	0x0F08,	%i7
	edge32	%i5,	%g1,	%o4
	fmovrse	%l4,	%f27,	%f7
	wr	%g0,	0x11,	%asi
	stha	%l0,	[%l7 + 0x28] %asi
	ldub	[%l7 + 0x2D],	%i0
	fmovdle	%xcc,	%f26,	%f31
	edge16l	%l2,	%i4,	%g5
	fba	%fcc0,	loop_678
	subc	%l6,	0x1537,	%o5
	fble,a	%fcc0,	loop_679
	bg,a	loop_680
loop_678:
	nop
	setx	0x7B0C2E2AA04D8F9A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f10
	std	%f10,	[%l7 + 0x70]
loop_679:
	fmovsne	%icc,	%f10,	%f2
loop_680:
	nop
	setx	loop_681,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdgez	%o6,	%f2,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f21
loop_681:
	move	%xcc,	%g2,	%o1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x2B] %asi,	%o7
	udivcc	%o3,	0x15C2,	%g3
	ble	%xcc,	loop_682
	orncc	%i6,	%o2,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i3,	%o0
loop_682:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x24] %asi,	%i1
	movleu	%icc,	%l5,	%g4
	fxor	%f4,	%f2,	%f8
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x75] %asi,	%g7
	mova	%xcc,	%l1,	%i2
	movneg	%xcc,	%i7,	%g6
	ldd	[%l7 + 0x18],	%g0
	sth	%i5,	[%l7 + 0x20]
	fnot2s	%f7,	%f17
	edge32ln	%o4,	%l4,	%i0
	tgu	%icc,	0x3
	sethi	0x0F59,	%l2
	udivcc	%l0,	0x04E5,	%g5
	fbl	%fcc3,	loop_683
	addcc	%l6,	%i4,	%o6
	fone	%f14
	fmovse	%icc,	%f0,	%f20
loop_683:
	ldd	[%l7 + 0x10],	%f8
	fnot2s	%f21,	%f31
	fpack16	%f16,	%f12
	set	0x70, %o3
	stwa	%o5,	[%l7 + %o3] 0x23
	membar	#Sync
	nop
	setx	0xDB8FC95332356363,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x59C9F0B873442F55,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f20,	%f0
	tge	%xcc,	0x6
	fmul8x16au	%f24,	%f16,	%f2
	fabsd	%f16,	%f26
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x71] %asi,	%o1
	movl	%icc,	%g2,	%o3
	fbue	%fcc1,	loop_684
	or	%o7,	%i6,	%g3
	ldub	[%l7 + 0x08],	%o2
	movrne	%i3,	%l3,	%o0
loop_684:
	nop
	setx	0xE053ED16,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	add	%i1,	%g4,	%l5
	tcs	%icc,	0x3
	xorcc	%g7,	%i2,	%i7
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x64] %asi,	%g6
	edge16	%g1,	%i5,	%l1
	fcmpeq16	%f16,	%f22,	%o4
	nop
	setx	0xF25CD743,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f2
	edge8ln	%i0,	%l2,	%l4
	addc	%l0,	0x16E6,	%g5
	set	0x58, %l0
	prefetcha	[%l7 + %l0] 0x15,	 0x1
	nop
	setx loop_685, %l0, %l1
	jmpl %l1, %l6
	edge16n	%o6,	%o1,	%o5
	subccc	%g2,	%o3,	%i6
	umulcc	%g3,	%o2,	%i3
loop_685:
	ldub	[%l7 + 0x3E],	%o7
	edge32n	%o0,	%i1,	%g4
	edge16ln	%l3,	%g7,	%i2
	fmovrsgez	%i7,	%f4,	%f11
	tvs	%icc,	0x0
	set	0x4E, %i4
	ldsha	[%l7 + %i4] 0x89,	%g6
	edge8l	%g1,	%i5,	%l5
	sdivx	%l1,	0x1D88,	%i0
	nop
	set	0x3C, %i2
	sth	%o4,	[%l7 + %i2]
	bn,a,pn	%xcc,	loop_686
	tn	%icc,	0x3
	tl	%xcc,	0x3
	movn	%xcc,	%l4,	%l2
loop_686:
	fzeros	%f16
	edge32l	%l0,	%g5,	%i4
	tleu	%xcc,	0x2
	fbe,a	%fcc2,	loop_687
	edge16l	%o6,	%o1,	%l6
	xnor	%g2,	0x09FD,	%o3
	fsrc2s	%f8,	%f15
loop_687:
	bge,a,pt	%icc,	loop_688
	subccc	%i6,	%o5,	%o2
	fmovdle	%icc,	%f3,	%f22
	ldsb	[%l7 + 0x71],	%i3
loop_688:
	fpsub32s	%f20,	%f4,	%f24
	tvs	%xcc,	0x1
	stx	%o7,	[%l7 + 0x70]
	fxor	%f6,	%f28,	%f14
	ldx	[%l7 + 0x18],	%o0
	fbne,a	%fcc2,	loop_689
	tne	%icc,	0x4
	fpadd16	%f8,	%f24,	%f4
	movvs	%xcc,	%i1,	%g3
loop_689:
	alignaddrl	%l3,	%g7,	%i2
	prefetch	[%l7 + 0x2C],	 0x1
	fpackfix	%f14,	%f12
	bvc	%xcc,	loop_690
	brlez,a	%i7,	loop_691
	movleu	%xcc,	%g4,	%g1
	srax	%g6,	0x06,	%l5
loop_690:
	edge32n	%l1,	%i0,	%o4
loop_691:
	ldx	[%l7 + 0x08],	%i5
	fmovd	%f8,	%f16
	udivcc	%l2,	0x16E4,	%l0
	bcs,a,pt	%icc,	loop_692
	nop
	set	0x1B, %i6
	ldstub	[%l7 + %i6],	%l4
	ldstub	[%l7 + 0x72],	%g5
	andn	%i4,	0x0252,	%o6
loop_692:
	array8	%o1,	%g2,	%l6
	mulx	%o3,	%i6,	%o2
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%i3
	xor	%o5,	%o0,	%o7
	fmul8x16au	%f10,	%f12,	%f12
	bg,a	%xcc,	loop_693
	move	%xcc,	%g3,	%l3
	umul	%i1,	%g7,	%i7
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f19
loop_693:
	fornot1s	%f4,	%f5,	%f24
	umulcc	%g4,	%i2,	%g6
	mova	%icc,	%g1,	%l1
	fmul8ulx16	%f14,	%f6,	%f4
	addc	%i0,	0x005B,	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o4,	%i5
	tne	%icc,	0x6
	array16	%l2,	%l4,	%g5
	subcc	%l0,	0x07C5,	%i4
	andn	%o6,	0x1DE4,	%g2
	lduw	[%l7 + 0x14],	%o1
	sethi	0x04D4,	%l6
	sir	0x0FA1
	taddcc	%o3,	0x04D4,	%o2
	movrne	%i6,	0x021,	%i3
	fmovscc	%icc,	%f20,	%f11
	ldsb	[%l7 + 0x1F],	%o0
	movleu	%xcc,	%o7,	%g3
	tg	%icc,	0x1
	fcmpgt32	%f20,	%f24,	%o5
	fmovdcc	%icc,	%f17,	%f13
	fabsd	%f4,	%f30
	fmovsneg	%icc,	%f4,	%f14
	sethi	0x0ECB,	%l3
	array16	%i1,	%i7,	%g7
	sethi	0x0A35,	%g4
	array16	%i2,	%g1,	%g6
	fmovdge	%xcc,	%f24,	%f25
	fnot1s	%f19,	%f22
	movl	%icc,	%i0,	%l5
	fpack32	%f8,	%f22,	%f14
	brlez,a	%o4,	loop_694
	or	%l1,	0x0179,	%l2
	movrlez	%i5,	%l4,	%l0
	movle	%xcc,	%i4,	%o6
loop_694:
	fsrc1s	%f29,	%f15
	fbn	%fcc0,	loop_695
	fmovdle	%xcc,	%f13,	%f11
	sub	%g2,	0x1CDE,	%g5
	sub	%o1,	%o3,	%l6
loop_695:
	edge8	%i6,	%o2,	%o0
	ba	loop_696
	nop
	setx	0xACC50D22,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x31EC5545,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f1,	%f30
	tsubcctv	%o7,	%g3,	%o5
	array32	%i3,	%i1,	%l3
loop_696:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g7
	ldstub	[%l7 + 0x33],	%g4
	fmovdg	%xcc,	%f4,	%f10
	movgu	%xcc,	%i2,	%i7
	sllx	%g1,	%i0,	%g6
	sir	0x0EE4
	movn	%xcc,	%l5,	%l1
	brgz,a	%o4,	loop_697
	bne	loop_698
	xorcc	%l2,	0x0C6B,	%l4
	edge8l	%i5,	%i4,	%l0
loop_697:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x40] %asi,	%f10
loop_698:
	fmovrdgz	%o6,	%f8,	%f2
	edge32	%g5,	%o1,	%g2
	movrgz	%o3,	%i6,	%o2
	sub	%l6,	0x192B,	%o7
	and	%g3,	0x1DBE,	%o0
	set	0x20, %o2
	ldswa	[%l7 + %o2] 0x11,	%o5
	nop
	setx loop_699, %l0, %l1
	jmpl %l1, %i3
	fornot2s	%f10,	%f14,	%f3
	addcc	%i1,	0x168C,	%l3
	andcc	%g4,	%i2,	%g7
loop_699:
	ldx	[%l7 + 0x60],	%g1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i7
	edge16l	%i0,	%l5,	%g6
	tcc	%icc,	0x4
	add	%o4,	0x117C,	%l2
	fmovdge	%xcc,	%f10,	%f25
	fpsub16s	%f16,	%f15,	%f29
	tvs	%icc,	0x2
	fcmpne16	%f2,	%f26,	%l1
	fcmple32	%f24,	%f20,	%i5
	fmovsleu	%icc,	%f8,	%f4
	ldd	[%l7 + 0x20],	%i4
	alignaddrl	%l0,	%l4,	%o6
	tvs	%xcc,	0x2
	edge32ln	%g5,	%o1,	%g2
	fble	%fcc3,	loop_700
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x51
	ld	[%l7 + 0x14],	%f31
loop_700:
	nop
	setx	0x40D6046EA38EE6D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x2E36D9F5BE0437C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f8,	%f16
	fornot1	%f12,	%f8,	%f0
	ldd	[%l7 + 0x68],	%f8
	fbge	%fcc0,	loop_701
	movre	%o3,	%o2,	%l6
	fmovsa	%xcc,	%f10,	%f6
	fors	%f4,	%f20,	%f20
loop_701:
	fmovrsne	%o7,	%f1,	%f20
	movre	%g3,	%i6,	%o0
	sub	%i3,	0x11AF,	%o5
	fxnor	%f22,	%f6,	%f2
	fbne	%fcc1,	loop_702
	tle	%xcc,	0x5
	sub	%l3,	0x1DE0,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_702:
	nop
	set	0x5A, %o1
	ldsha	[%l7 + %o1] 0x10,	%g4
	movre	%i2,	0x383,	%g1
	set	0x4C, %g3
	sta	%f17,	[%l7 + %g3] 0x81
	tleu	%xcc,	0x5
	taddcc	%i7,	%g7,	%l5
	edge8l	%g6,	%o4,	%i0
	alignaddr	%l2,	%i5,	%l1
	ldub	[%l7 + 0x20],	%l0
	fornot1	%f16,	%f10,	%f8
	set	0x14, %o0
	lduwa	[%l7 + %o0] 0x80,	%i4
	umulcc	%o6,	0x1970,	%g5
	tne	%xcc,	0x4
	smul	%o1,	0x1F7B,	%g2
	bneg	%xcc,	loop_703
	xorcc	%l4,	%o2,	%l6
	fnands	%f12,	%f1,	%f7
	tgu	%icc,	0x0
loop_703:
	movgu	%icc,	%o3,	%o7
	xnorcc	%g3,	%o0,	%i6
	fbul,a	%fcc3,	loop_704
	fmuld8sux16	%f24,	%f15,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i3,	%o5,	%i1
loop_704:
	fmovrdgez	%g4,	%f16,	%f18
	tg	%icc,	0x0
	udivcc	%i2,	0x03AF,	%l3
	tn	%icc,	0x7
	movl	%xcc,	%i7,	%g7
	movrlez	%l5,	0x2A3,	%g1
	udivcc	%g6,	0x00CB,	%o4
	orcc	%i0,	%l2,	%i5
	bgu	loop_705
	sdivx	%l1,	0x0380,	%i4
	srl	%o6,	%g5,	%l0
	movvs	%xcc,	%o1,	%g2
loop_705:
	andcc	%o2,	%l4,	%l6
	xor	%o7,	0x14EF,	%o3
	movgu	%xcc,	%o0,	%g3
	fmovrslz	%i6,	%f29,	%f1
	movge	%icc,	%i3,	%o5
	srax	%g4,	0x1B,	%i2
	sir	0x07AE
	set	0x48, %l5
	stha	%i1,	[%l7 + %l5] 0x2b
	membar	#Sync
	popc	%i7,	%g7
	te	%xcc,	0x0
	tg	%xcc,	0x5
	ldx	[%l7 + 0x70],	%l3
	fbu,a	%fcc0,	loop_706
	std	%f26,	[%l7 + 0x50]
	smul	%g1,	0x0F13,	%g6
	alignaddr	%o4,	%i0,	%l5
loop_706:
	movge	%icc,	%l2,	%l1
	orcc	%i4,	0x0B42,	%o6
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x70] %asi,	%g5
	tn	%icc,	0x0
	popc	%l0,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_707,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%i5,	%o2,	%g2
	andcc	%l4,	%o7,	%l6
	andncc	%o0,	%g3,	%o3
loop_707:
	movn	%icc,	%i3,	%o5
	prefetch	[%l7 + 0x28],	 0x3
	sdivcc	%g4,	0x1066,	%i6
	movcc	%icc,	%i1,	%i2
	mulx	%i7,	0x0E63,	%g7
	ldx	[%l7 + 0x40],	%g1
	sll	%l3,	0x1A,	%o4
	fmovsneg	%icc,	%f10,	%f24
	nop
	setx	0xF385E970C3C77EBE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x21C14BF8880F07E4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f4,	%f2
	ldsw	[%l7 + 0x18],	%i0
	movrgz	%g6,	%l5,	%l1
	bcs	%xcc,	loop_708
	sll	%l2,	%i4,	%g5
	subcc	%l0,	%o6,	%o1
	bneg,pn	%xcc,	loop_709
loop_708:
	fbue,a	%fcc0,	loop_710
	srl	%o2,	0x04,	%i5
	tneg	%xcc,	0x3
loop_709:
	xnorcc	%g2,	%o7,	%l4
loop_710:
	tgu	%icc,	0x7
	edge32n	%l6,	%g3,	%o3
	nop
	setx	0x6B96786D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f0
	fmovsge	%icc,	%f29,	%f18
	fxors	%f2,	%f10,	%f29
	movgu	%xcc,	%o0,	%o5
	movleu	%xcc,	%i3,	%g4
	andcc	%i6,	%i1,	%i2
	edge8l	%i7,	%g1,	%g7
	addccc	%l3,	0x0311,	%i0
	tl	%icc,	0x7
	fcmpne16	%f8,	%f18,	%g6
	bvc,pt	%icc,	loop_711
	smulcc	%l5,	%l1,	%l2
	fmovdcs	%icc,	%f7,	%f16
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f0
	fxtod	%f0,	%f30
loop_711:
	tg	%xcc,	0x6
	move	%icc,	%o4,	%i4
	edge8n	%l0,	%o6,	%o1
	movge	%xcc,	%o2,	%g5
	orncc	%g2,	0x0CE9,	%i5
	add	%o7,	%l4,	%g3
	edge16	%l6,	%o0,	%o3
	taddcctv	%i3,	0x0824,	%o5
	call	loop_712
	ta	%xcc,	0x2
	popc	%g4,	%i6
	and	%i2,	0x0058,	%i1
loop_712:
	movneg	%icc,	%g1,	%g7
	nop
	fitos	%f6,	%f29
	fstod	%f29,	%f12
	fmovse	%icc,	%f20,	%f25
	mulx	%i7,	%i0,	%l3
	brgez	%g6,	loop_713
	alignaddr	%l1,	%l2,	%l5
	subccc	%o4,	%l0,	%i4
	array8	%o1,	%o6,	%o2
loop_713:
	fmul8x16au	%f14,	%f4,	%f30
	fcmpeq16	%f22,	%f18,	%g2
	call	loop_714
	tpos	%icc,	0x4
	ldd	[%l7 + 0x38],	%i4
	fmul8sux16	%f20,	%f18,	%f26
loop_714:
	array16	%o7,	%g5,	%l4
	movneg	%icc,	%g3,	%l6
	movpos	%xcc,	%o0,	%i3
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x7C] %asi,	%f0
	umul	%o5,	0x16EE,	%g4
	fmovsvs	%icc,	%f24,	%f28
	fbug,a	%fcc3,	loop_715
	movcs	%xcc,	%i6,	%o3
	edge16n	%i1,	%g1,	%g7
	nop
	setx loop_716, %l0, %l1
	jmpl %l1, %i2
loop_715:
	sra	%i0,	0x13,	%i7
	fnand	%f18,	%f24,	%f24
	nop
	setx	0xBD18FCB7BC64A1A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5591BA73DE6A2512,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f16,	%f30
loop_716:
	nop
	setx	0xA622D6936FCA5EC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2E6C3F4C07FDD56B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f10,	%f10
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x48] %asi,	%l3
	tge	%icc,	0x1
	umul	%g6,	0x16F3,	%l1
	move	%xcc,	%l2,	%l5
	movcs	%icc,	%o4,	%i4
	fmovsle	%xcc,	%f30,	%f4
	membar	0x30
	movg	%icc,	%o1,	%l0
	set	0x40, %i0
	stxa	%o6,	[%l7 + %i0] 0x2b
	membar	#Sync
	movcs	%xcc,	%o2,	%g2
	mulx	%i5,	0x08D6,	%o7
	set	0x19, %l2
	stba	%l4,	[%l7 + %l2] 0x27
	membar	#Sync
	fmovsgu	%icc,	%f2,	%f28
	movg	%icc,	%g5,	%l6
	mulx	%o0,	%i3,	%o5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x66] %asi,	%g3
	movcs	%icc,	%g4,	%i6
	fbl	%fcc0,	loop_717
	fnot2s	%f16,	%f4
	orn	%o3,	%g1,	%i1
	taddcc	%i2,	0x064C,	%g7
loop_717:
	edge16ln	%i7,	%l3,	%i0
	nop
	fitod	%f6,	%f16
	fdtoi	%f16,	%f24
	wr	%g0,	0x18,	%asi
	stha	%g6,	[%l7 + 0x3E] %asi
	tl	%icc,	0x7
	sra	%l2,	0x19,	%l5
	ldstub	[%l7 + 0x63],	%o4
	call	loop_718
	andcc	%l1,	%o1,	%i4
	fnegs	%f20,	%f17
	ldsh	[%l7 + 0x5C],	%o6
loop_718:
	movvs	%xcc,	%o2,	%g2
	array16	%i5,	%l0,	%l4
	bpos	loop_719
	stw	%g5,	[%l7 + 0x7C]
	sdivcc	%o7,	0x13D8,	%o0
	array16	%l6,	%i3,	%o5
loop_719:
	sll	%g4,	0x1F,	%i6
	mulscc	%g3,	%o3,	%i1
	movneg	%xcc,	%g1,	%g7
	bneg	loop_720
	ble,pn	%xcc,	loop_721
	fabsd	%f20,	%f18
	fmovrdlez	%i2,	%f0,	%f20
loop_720:
	fmovs	%f10,	%f28
loop_721:
	xorcc	%i7,	%l3,	%g6
	srlx	%i0,	0x13,	%l2
	fmul8sux16	%f4,	%f6,	%f14
	tleu	%xcc,	0x5
	movg	%icc,	%l5,	%l1
	xnor	%o1,	0x14B1,	%o4
	sethi	0x172D,	%o6
	fmovdvs	%icc,	%f20,	%f7
	alignaddrl	%o2,	%i4,	%g2
	set	0x10, %l4
	ldxa	[%g0 + %l4] 0x4f,	%l0
	orcc	%i5,	0x0F09,	%g5
	popc	%o7,	%l4
	and	%o0,	%i3,	%o5
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fsrc1	%f20,	%f20
	xnorcc	%l6,	%i6,	%g4
	bshuffle	%f18,	%f6,	%f26
	alignaddr	%g3,	%i1,	%o3
	fpadd16s	%f4,	%f9,	%f13
	bne	loop_722
	fbuge,a	%fcc2,	loop_723
	movpos	%icc,	%g7,	%i2
	movrgez	%i7,	%g1,	%l3
loop_722:
	nop
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x0c,	%f0
loop_723:
	nop
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x158] %asi,	%i0 ripped by fixASI40.pl ripped by fixASI40.pl
	st	%f5,	[%l7 + 0x24]
	fmovdcs	%xcc,	%f6,	%f20
	fmovrsgz	%g6,	%f16,	%f4
	edge8ln	%l2,	%l5,	%l1
	edge8ln	%o1,	%o4,	%o6
	fmovd	%f6,	%f10
	fexpand	%f22,	%f30
	fcmpgt16	%f30,	%f18,	%i4
	fmovdne	%xcc,	%f7,	%f29
	fabsd	%f6,	%f4
	movcc	%icc,	%g2,	%o2
	addccc	%i5,	0x1DC7,	%l0
	fbug,a	%fcc3,	loop_724
	membar	0x64
	and	%g5,	%l4,	%o7
	addc	%i3,	0x19BD,	%o5
loop_724:
	edge32	%l6,	%o0,	%i6
	movrgez	%g4,	0x2CD,	%g3
	nop
	setx	0x399FCC4A94602505,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f24
	edge16l	%o3,	%i1,	%i2
	nop
	setx	loop_725,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bl	loop_726
	fmovdleu	%icc,	%f26,	%f13
	movrne	%i7,	%g1,	%l3
loop_725:
	fmovdcs	%xcc,	%f24,	%f20
loop_726:
	movvc	%icc,	%i0,	%g6
	srlx	%g7,	%l2,	%l5
	set	0x48, %g4
	swapa	[%l7 + %g4] 0x88,	%l1
	edge32	%o4,	%o6,	%o1
	call	loop_727
	movle	%xcc,	%i4,	%g2
	brgz	%i5,	loop_728
	addcc	%o2,	0x0157,	%l0
loop_727:
	tcs	%icc,	0x1
	mulx	%g5,	0x10B2,	%o7
loop_728:
	nop
	set	0x28, %i5
	ldd	[%l7 + %i5],	%l4
	tvc	%icc,	0x4
	set	0x38, %g6
	ldxa	[%g0 + %g6] 0x20,	%i3
	fmovrde	%l6,	%f10,	%f20
	nop
	setx	0x80277C4840488D1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	bpos,pt	%xcc,	loop_729
	fbe,a	%fcc2,	loop_730
	edge32n	%o0,	%o5,	%i6
	add	%g3,	0x05EF,	%o3
loop_729:
	taddcc	%g4,	0x085B,	%i2
loop_730:
	edge16ln	%i7,	%i1,	%g1
	bleu,pn	%icc,	loop_731
	bge,pt	%xcc,	loop_732
	tne	%xcc,	0x0
	ld	[%l7 + 0x34],	%f10
loop_731:
	nop
	fitod	%f27,	%f12
loop_732:
	edge32	%l3,	%g6,	%i0
	nop
	setx	0x7DD6309E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x009AFF55,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f10,	%f19
	edge16n	%g7,	%l2,	%l5
	edge8	%l1,	%o4,	%o6
	fpadd16s	%f2,	%f17,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x6
	ldstub	[%l7 + 0x2A],	%o1
	popc	0x062D,	%g2
	bcs,a	loop_733
	fmovspos	%xcc,	%f1,	%f19
	fsrc1s	%f3,	%f1
	swap	[%l7 + 0x54],	%i4
loop_733:
	fabsd	%f10,	%f12
	fmovsg	%xcc,	%f14,	%f11
	fones	%f3
	fxors	%f2,	%f17,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i5,	0x17EE,	%l0
	addcc	%g5,	%o2,	%l4
	orcc	%o7,	%i3,	%l6
	st	%f0,	[%l7 + 0x24]
	orcc	%o0,	0x0149,	%i6
	tsubcctv	%g3,	0x1A40,	%o3
	std	%f22,	[%l7 + 0x10]
	tl	%xcc,	0x1
	fpack16	%f14,	%f5
	fblg	%fcc3,	loop_734
	fmovrsgz	%o5,	%f0,	%f9
	addcc	%i2,	%g4,	%i1
	edge16ln	%g1,	%l3,	%i7
loop_734:
	edge16l	%g6,	%g7,	%i0
	edge16n	%l5,	%l1,	%l2
	array16	%o6,	%o1,	%g2
	or	%o4,	0x1DED,	%i5
	movneg	%xcc,	%l0,	%g5
	tpos	%xcc,	0x1
	nop
	setx	0xF0F0E7B4704A44F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fpmerge	%f14,	%f17,	%f0
	fmovse	%icc,	%f5,	%f23
	sdivcc	%i4,	0x0FF1,	%l4
	fbuge	%fcc0,	loop_735
	nop
	fitod	%f13,	%f22
	fcmpne32	%f8,	%f18,	%o2
	bshuffle	%f30,	%f8,	%f22
loop_735:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f13,	[%l7 + 0x40] %asi
	fbug	%fcc1,	loop_736
	fand	%f10,	%f26,	%f10
	tcs	%xcc,	0x2
	fnegs	%f28,	%f17
loop_736:
	lduw	[%l7 + 0x78],	%i3
	movre	%o7,	%o0,	%i6
	pdist	%f4,	%f6,	%f0
	nop
	setx	0x903616C5B06EEC5D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	lduh	[%l7 + 0x3A],	%g3
	bleu,a,pt	%icc,	loop_737
	andncc	%l6,	%o3,	%i2
	membar	0x7F
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_737:
	tl	%icc,	0x7
	ldsb	[%l7 + 0x39],	%g4
	tvc	%xcc,	0x1
	sllx	%o5,	0x1C,	%i1
	xnor	%l3,	%g1,	%i7
	be,a	loop_738
	andn	%g7,	0x1BD5,	%g6
	nop
	setx	0xDCFDD9E4CAB672A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x5603D5DF65724641,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f30,	%f18
	fxor	%f12,	%f6,	%f4
loop_738:
	ta	%xcc,	0x6
	movl	%xcc,	%l5,	%l1
	edge8l	%i0,	%o6,	%o1
	sdivx	%g2,	0x16B3,	%o4
	prefetch	[%l7 + 0x78],	 0x1
	alignaddrl	%i5,	%l0,	%l2
	movleu	%icc,	%i4,	%l4
	subcc	%o2,	%i3,	%g5
	taddcc	%o0,	0x0CC2,	%o7
	array16	%g3,	%l6,	%i6
	subccc	%o3,	0x12AB,	%g4
	xor	%o5,	%i2,	%i1
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xe3,	%g0
	movge	%xcc,	%l3,	%g7
	tpos	%icc,	0x3
	srax	%g6,	0x1B,	%l5
	xorcc	%l1,	%i0,	%o6
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%o0
	taddcc	%i7,	%g2,	%i5
	tleu	%xcc,	0x2
	taddcc	%o4,	%l2,	%i4
	movneg	%xcc,	%l0,	%o2
	ldsb	[%l7 + 0x60],	%i3
	fpadd16	%f4,	%f6,	%f2
	nop
	fitos	%f11,	%f22
	fstoi	%f22,	%f24
	addccc	%l4,	0x1908,	%o0
	tsubcctv	%o7,	0x0A73,	%g3
	nop
	set	0x50, %l1
	ldd	[%l7 + %l1],	%i6
	membar	0x63
	brlez	%g5,	loop_739
	move	%icc,	%o3,	%g4
	edge32ln	%o5,	%i2,	%i6
	srax	%g1,	0x0D,	%l3
loop_739:
	edge32n	%g7,	%g6,	%i1
	edge8ln	%l1,	%l5,	%o6
	xnorcc	%i0,	%o1,	%g2
	fpadd16s	%f20,	%f4,	%f12
	stbar
	stbar
	bgu,a	%xcc,	loop_740
	edge32	%i7,	%o4,	%i5
	edge32n	%l2,	%i4,	%o2
	fbg,a	%fcc2,	loop_741
loop_740:
	udivx	%l0,	0x0F2B,	%i3
	fmovsvs	%xcc,	%f6,	%f9
	movne	%xcc,	%l4,	%o0
loop_741:
	nop
	fitod	%f6,	%f2
	fdtoi	%f2,	%f0
	bge,a	loop_742
	fnegd	%f28,	%f8
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x6C] %asi,	%g3
loop_742:
	fmovsgu	%xcc,	%f19,	%f29
	udivx	%l6,	0x1744,	%o7
	fpsub32	%f26,	%f0,	%f10
	movrgez	%g5,	%g4,	%o5
	fmovsa	%icc,	%f21,	%f18
	subccc	%o3,	%i2,	%i6
	sdivx	%l3,	0x0865,	%g7
	array32	%g1,	%g6,	%l1
	movvs	%icc,	%l5,	%i1
	nop
	fitos	%f3,	%f8
	fstoi	%f8,	%f8
	edge8l	%i0,	%o6,	%o1
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x70] %asi,	%i7
	nop
	setx	0xC0511803,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	subccc	%o4,	%i5,	%l2
	tn	%xcc,	0x3
	fmovdge	%xcc,	%f6,	%f8
	movrlez	%g2,	0x210,	%o2
	movvc	%xcc,	%l0,	%i4
	tleu	%icc,	0x7
	movg	%xcc,	%i3,	%o0
	movrgez	%l4,	0x115,	%l6
	nop
	setx	0x762F9BCD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xA883A9BE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f7,	%f24
	movcs	%xcc,	%o7,	%g3
	edge8	%g5,	%o5,	%g4
	be,pn	%xcc,	loop_743
	fcmpgt32	%f12,	%f30,	%i2
	fexpand	%f7,	%f0
	orcc	%o3,	0x08CE,	%i6
loop_743:
	udivcc	%g7,	0x1F1D,	%l3
	edge8	%g6,	%g1,	%l5
	alignaddrl	%i1,	%l1,	%i0
	movvs	%xcc,	%o6,	%o1
	fones	%f17
	brlz	%o4,	loop_744
	bcc	%icc,	loop_745
	nop
	setx	loop_746,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%icc,	0x7
loop_744:
	subc	%i5,	0x0025,	%l2
loop_745:
	nop
	setx	0xA0470BCD,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
loop_746:
	tsubcc	%g2,	%i7,	%l0
	movge	%icc,	%i4,	%i3
	array16	%o2,	%o0,	%l4
	te	%xcc,	0x0
	fmul8ulx16	%f28,	%f14,	%f18
	sll	%l6,	%o7,	%g3
	tge	%icc,	0x0
	edge16l	%g5,	%o5,	%g4
	ldsh	[%l7 + 0x1C],	%i2
	fmovsleu	%icc,	%f13,	%f14
	umulcc	%o3,	0x0A40,	%i6
	array16	%l3,	%g6,	%g1
	movg	%xcc,	%l5,	%i1
	fmovrse	%l1,	%f6,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g7,	%i0,	%o6
	nop
	setx	0xF615AD28EC281253,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x13C6F5FA5B497D01,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f28,	%f12
	movneg	%xcc,	%o4,	%i5
	set	0x64, %i3
	stwa	%o1,	[%l7 + %i3] 0x2a
	membar	#Sync
	fmovrsgez	%l2,	%f9,	%f3
	smulcc	%g2,	%i7,	%i4
	fmovrse	%l0,	%f12,	%f31
	call	loop_747
	edge32n	%o2,	%i3,	%l4
	movrlez	%o0,	0x009,	%o7
	fnot2	%f16,	%f22
loop_747:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%l6
	movle	%icc,	%g5,	%g4
	fblg	%fcc3,	loop_748
	fnors	%f16,	%f6,	%f15
	tcs	%xcc,	0x0
	add	%o5,	0x0D30,	%i2
loop_748:
	movrne	%i6,	0x1DB,	%l3
	bne,pn	%xcc,	loop_749
	andn	%o3,	%g1,	%l5
	ld	[%l7 + 0x40],	%f2
	orncc	%g6,	0x104D,	%i1
loop_749:
	nop
	wr	%g0,	0x22,	%asi
	stba	%g7,	[%l7 + 0x32] %asi
	membar	#Sync
	tvs	%icc,	0x1
	movrgez	%i0,	0x1EF,	%l1
	tge	%icc,	0x2
	movge	%icc,	%o6,	%i5
	tl	%icc,	0x2
	edge16n	%o1,	%o4,	%g2
	bcc,pn	%xcc,	loop_750
	bl,a	%xcc,	loop_751
	bgu,a,pt	%xcc,	loop_752
	fcmpne16	%f2,	%f22,	%l2
loop_750:
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f28
loop_751:
	andn	%i4,	%l0,	%i7
loop_752:
	movrlz	%o2,	%i3,	%o0
	movcc	%icc,	%l4,	%g3
	ldsw	[%l7 + 0x74],	%l6
	movrgez	%o7,	0x2B8,	%g5
	sth	%g4,	[%l7 + 0x44]
	movg	%xcc,	%o5,	%i6
	addc	%l3,	%o3,	%g1
	edge8ln	%i2,	%g6,	%i1
	andcc	%l5,	0x1283,	%i0
	movre	%g7,	0x034,	%o6
	sra	%l1,	%i5,	%o1
	move	%icc,	%o4,	%g2
	taddcctv	%l2,	%i4,	%i7
	fbe,a	%fcc0,	loop_753
	tg	%icc,	0x4
	movrgez	%o2,	%i3,	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%l4,	%o0
loop_753:
	alignaddrl	%l6,	%g3,	%g5
	nop
	setx	0xC2A02B08A3F96B22,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD2023744DC9E41CF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f22,	%f28
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	tcc	%xcc,	0x3
	nop
	setx	0xEA5FB6CC88DFEAEE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6C58F02D706DFD37,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f8,	%f4
	bvs,a	%xcc,	loop_754
	udiv	%o7,	0x0541,	%i6
	sra	%o5,	%l3,	%o3
	movvs	%xcc,	%i2,	%g1
loop_754:
	popc	0x0D0C,	%g6
	umul	%i1,	%l5,	%i0
	mova	%icc,	%g7,	%l1
	alignaddrl	%o6,	%i5,	%o4
	sdivx	%o1,	0x0F82,	%g2
	fbne,a	%fcc1,	loop_755
	andncc	%i4,	%l2,	%i7
	fnegs	%f0,	%f5
	fmovde	%xcc,	%f17,	%f10
loop_755:
	addc	%o2,	%l0,	%i3
	alignaddrl	%l4,	%l6,	%g3
	tl	%icc,	0x4
	srlx	%g5,	%o0,	%o7
	movrne	%g4,	%i6,	%o5
	set	0x6B, %o7
	ldstuba	[%l7 + %o7] 0x89,	%l3
	array16	%o3,	%g1,	%i2
	tge	%icc,	0x1
	tvs	%icc,	0x6
	fcmpgt16	%f22,	%f8,	%g6
	edge32l	%i1,	%i0,	%g7
	edge32l	%l1,	%o6,	%l5
	sdiv	%o4,	0x170B,	%i5
	fmovdpos	%xcc,	%f20,	%f6
	srl	%g2,	%i4,	%l2
	fnot2	%f18,	%f18
	movvs	%xcc,	%o1,	%o2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
	fmovrsgz	%i3,	%f3,	%f16
	sra	%i7,	0x1A,	%l4
	pdist	%f24,	%f22,	%f4
	tne	%icc,	0x6
	stb	%g3,	[%l7 + 0x75]
	tneg	%icc,	0x2
	nop
	setx	loop_756,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%xcc,	0x5
	mova	%xcc,	%l6,	%g5
	fba,a	%fcc0,	loop_757
loop_756:
	faligndata	%f0,	%f4,	%f28
	fbue,a	%fcc2,	loop_758
	mulscc	%o0,	%g4,	%i6
loop_757:
	andncc	%o5,	%l3,	%o7
	sllx	%o3,	%g1,	%i2
loop_758:
	movrgez	%i1,	%i0,	%g7
	fandnot2s	%f28,	%f31,	%f9
	xor	%g6,	0x0DAE,	%o6
	taddcc	%l5,	0x0F10,	%l1
	fpadd32	%f24,	%f16,	%f24
	stb	%o4,	[%l7 + 0x57]
	nop
	fitos	%f1,	%f3
	fstoi	%f3,	%f0
	movrlez	%g2,	%i4,	%i5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x60] %asi,	%l2
	tl	%xcc,	0x2
	brlez	%o2,	loop_759
	nop
	setx	0x3AC4ECCB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xBC7541E9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f29,	%f3
	sub	%l0,	%i3,	%i7
	fexpand	%f26,	%f12
loop_759:
	subcc	%l4,	0x1914,	%o1
	nop
	setx	0x27795E8AB04DD6FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	orncc	%g3,	0x1814,	%l6
	udivx	%o0,	0x1956,	%g5
	movleu	%xcc,	%g4,	%i6
	movgu	%icc,	%l3,	%o5
	movre	%o3,	0x2B4,	%o7
	tne	%xcc,	0x3
	srax	%i2,	0x0B,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	loop_760
	taddcc	%g1,	%g7,	%i0
	brz	%o6,	loop_761
	movle	%icc,	%l5,	%l1
loop_760:
	addccc	%o4,	%g2,	%g6
	movneg	%xcc,	%i4,	%l2
loop_761:
	movg	%xcc,	%o2,	%i5
	or	%l0,	0x1014,	%i7
	fpadd16	%f4,	%f14,	%f10
	movleu	%icc,	%l4,	%o1
	fandnot2	%f26,	%f0,	%f0
	srax	%g3,	%l6,	%o0
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x30] %asi,	%g5
	fbe	%fcc0,	loop_762
	tg	%icc,	0x3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%i6
loop_762:
	fnors	%f16,	%f5,	%f20
	movrlez	%l3,	0x20C,	%g4
	tpos	%icc,	0x1
	tvc	%icc,	0x0
	movpos	%xcc,	%o3,	%o7
	ldstub	[%l7 + 0x78],	%i2
	tcs	%xcc,	0x3
	tvs	%icc,	0x2
	add	%o5,	0x18B0,	%i1
	umul	%g1,	0x1A0A,	%i0
	fmovrsne	%o6,	%f27,	%f3
	movg	%xcc,	%g7,	%l5
	udiv	%l1,	0x0051,	%g2
	xnor	%o4,	0x020D,	%g6
	nop
	setx	0xD0679F18,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	nop
	setx loop_763, %l0, %l1
	jmpl %l1, %i4
	array16	%l2,	%i5,	%l0
	mulx	%i7,	0x01E9,	%l4
	movle	%xcc,	%o1,	%g3
loop_763:
	move	%icc,	%o2,	%l6
	nop
	setx	0xD053DBEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	nop
	setx	0x5C543834,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x93C5C197,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f6,	%f15
	andcc	%g5,	0x1346,	%i3
	orn	%i6,	0x094C,	%o0
	fmovdge	%xcc,	%f27,	%f10
	sra	%g4,	%l3,	%o7
	sll	%i2,	%o3,	%o5
	andn	%i1,	0x19F8,	%i0
	nop
	setx	0x6ACD209021A2420A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x578976F6117034A0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f28,	%f2
	movl	%xcc,	%o6,	%g7
	fmovdcc	%xcc,	%f29,	%f3
	movvc	%icc,	%g1,	%l1
	movneg	%icc,	%g2,	%l5
	edge32ln	%g6,	%i4,	%o4
	mulscc	%i5,	0x1F9E,	%l0
	movcs	%xcc,	%i7,	%l2
	bleu,a	%xcc,	loop_764
	fornot2	%f18,	%f8,	%f30
	brlez	%o1,	loop_765
	udiv	%g3,	0x1BD5,	%o2
loop_764:
	array8	%l4,	%l6,	%g5
	umul	%i3,	0x1C01,	%i6
loop_765:
	xorcc	%g4,	0x15B7,	%l3
	srax	%o0,	0x00,	%o7
	tsubcctv	%i2,	%o3,	%o5
	tne	%xcc,	0x0
	std	%f30,	[%l7 + 0x50]
	set	0x78, %l6
	ldstuba	[%l7 + %l6] 0x81,	%i0
	nop
	set	0x78, %l3
	ldstub	[%l7 + %l3],	%i1
	fcmpne32	%f0,	%f2,	%g7
	orncc	%o6,	0x0CC4,	%g1
	movge	%xcc,	%l1,	%g2
	bpos,pt	%icc,	loop_766
	fpmerge	%f16,	%f23,	%f12
	addccc	%g6,	%l5,	%o4
	tleu	%xcc,	0x4
loop_766:
	tgu	%xcc,	0x4
	fbg	%fcc1,	loop_767
	swap	[%l7 + 0x08],	%i5
	flush	%l7 + 0x40
	ld	[%l7 + 0x58],	%f22
loop_767:
	tcs	%icc,	0x3
	edge32ln	%l0,	%i4,	%i7
	fcmpeq32	%f12,	%f14,	%l2
	sdivcc	%o1,	0x181A,	%g3
	tl	%icc,	0x6
	fmovdneg	%xcc,	%f23,	%f25
	fmul8sux16	%f8,	%f24,	%f28
	movcc	%icc,	%o2,	%l4
	movge	%xcc,	%l6,	%g5
	and	%i3,	%i6,	%g4
	bl,a,pt	%icc,	loop_768
	nop
	setx loop_769, %l0, %l1
	jmpl %l1, %l3
	subccc	%o0,	0x1716,	%i2
	std	%f30,	[%l7 + 0x18]
loop_768:
	ba,a	loop_770
loop_769:
	taddcc	%o3,	0x07AE,	%o7
	tne	%xcc,	0x2
	nop
	fitos	%f6,	%f29
	fstod	%f29,	%f8
loop_770:
	subcc	%i0,	%i1,	%o5
	orn	%o6,	0x0624,	%g7
	movpos	%icc,	%g1,	%g2
	fmovscs	%xcc,	%f18,	%f4
	sdivx	%l1,	0x13C3,	%g6
	fnors	%f30,	%f25,	%f15
	fpmerge	%f1,	%f26,	%f10
	fbule,a	%fcc0,	loop_771
	tle	%xcc,	0x1
	srax	%l5,	%i5,	%l0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%i4
loop_771:
	edge8l	%o4,	%i7,	%l2
	sethi	0x19BC,	%g3
	movleu	%xcc,	%o1,	%l4
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x18,	 0x2
	membar	0x5F
	srl	%g5,	%i3,	%i6
	edge8l	%o2,	%l3,	%g4
	addccc	%i2,	0x13D2,	%o3
	xorcc	%o0,	%i0,	%o7
	fble	%fcc3,	loop_772
	subc	%o5,	0x1CBA,	%i1
	udiv	%g7,	0x1373,	%g1
	fxors	%f0,	%f26,	%f22
loop_772:
	orcc	%o6,	%g2,	%l1
	xnorcc	%l5,	%g6,	%i5
	edge8n	%l0,	%o4,	%i4
	fcmpeq16	%f12,	%f24,	%i7
	movl	%icc,	%g3,	%l2
	nop
	setx	0x57C5ABF9A359B030,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xC9837B70800AE0E1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f2,	%f6
	movrlez	%l4,	0x1BC,	%l6
	fbe	%fcc1,	loop_773
	fcmpgt32	%f2,	%f0,	%o1
	set	0x18, %o6
	ldxa	[%g0 + %o6] 0x50,	%i3
loop_773:
	ldsh	[%l7 + 0x1E],	%g5
	tgu	%xcc,	0x2
	tcc	%icc,	0x7
	nop
	fitos	%f10,	%f31
	fstox	%f31,	%f8
	tn	%xcc,	0x5
	te	%xcc,	0x7
	movgu	%icc,	%o2,	%l3
	tleu	%icc,	0x4
	nop
	fitos	%f2,	%f24
	fstoi	%f24,	%f18
	srlx	%i6,	0x0E,	%g4
	andcc	%i2,	%o3,	%o0
	nop
	setx	0x928E2388405198DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	tneg	%xcc,	0x5
	edge32ln	%o7,	%i0,	%i1
	fmovsne	%icc,	%f26,	%f2
	movge	%icc,	%g7,	%g1
	tleu	%icc,	0x3
	tcc	%icc,	0x1
	fpadd16s	%f29,	%f21,	%f3
	bcs,a	loop_774
	addccc	%o6,	0x01E1,	%g2
	mulx	%o5,	%l5,	%l1
	edge32	%i5,	%l0,	%g6
loop_774:
	orncc	%i4,	0x1A97,	%o4
	xnor	%g3,	0x0CDD,	%i7
	edge16l	%l4,	%l2,	%o1
	udivcc	%l6,	0x05F7,	%g5
	tsubcc	%i3,	%l3,	%i6
	fbue	%fcc1,	loop_775
	fones	%f24
	fsrc2s	%f27,	%f2
	movge	%xcc,	%o2,	%g4
loop_775:
	xorcc	%o3,	%i2,	%o0
	ldsb	[%l7 + 0x1E],	%i0
	udivx	%i1,	0x0F37,	%o7
	fmovrdlez	%g7,	%f0,	%f4
	fmovrde	%g1,	%f6,	%f30
	ble,pt	%icc,	loop_776
	array16	%g2,	%o6,	%l5
	xnorcc	%l1,	0x1AA8,	%i5
	edge32	%l0,	%g6,	%i4
loop_776:
	xnorcc	%o5,	0x1DC8,	%g3
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x6C] %asi,	%o4
	orcc	%l4,	0x1A58,	%i7
	edge8ln	%o1,	%l6,	%g5
	movrne	%l2,	0x05D,	%l3
	fmovdvc	%xcc,	%f15,	%f24
	and	%i6,	%o2,	%i3
	edge32ln	%g4,	%o3,	%i2
	edge16l	%o0,	%i1,	%o7
	popc	%g7,	%i0
	and	%g1,	%g2,	%l5
	bvs,a	%xcc,	loop_777
	andcc	%o6,	%l1,	%l0
	movrne	%g6,	0x1C1,	%i4
	fmovd	%f4,	%f22
loop_777:
	faligndata	%f8,	%f4,	%f4
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x17
	membar	#Sync
	faligndata	%f4,	%f20,	%f10
	andncc	%i5,	%g3,	%o4
	sdivx	%o5,	0x1945,	%i7
	ba,a	loop_778
	fnands	%f25,	%f7,	%f0
	fbug,a	%fcc1,	loop_779
	stx	%l4,	[%l7 + 0x30]
loop_778:
	nop
	setx	0xD24BAE47,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xAA5EC0D9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f5,	%f12
	addc	%o1,	0x093E,	%g5
loop_779:
	fbg	%fcc3,	loop_780
	mulx	%l2,	0x1887,	%l6
	nop
	setx	0xB04A6E7AFE38A2DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x16D0B0EF80ED4074,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f6,	%f26
	pdist	%f2,	%f12,	%f16
loop_780:
	st	%f27,	[%l7 + 0x2C]
	fpsub32s	%f19,	%f3,	%f5
	lduh	[%l7 + 0x5E],	%l3
	sllx	%o2,	%i3,	%g4
	sdivcc	%i6,	0x0163,	%o3
	subccc	%o0,	%i2,	%o7
	xnorcc	%i1,	%g7,	%i0
	movvs	%icc,	%g2,	%g1
	addc	%o6,	0x1169,	%l5
	movrlez	%l0,	0x1AA,	%g6
	tneg	%xcc,	0x5
	fcmpne32	%f22,	%f10,	%l1
	udivx	%i4,	0x0BA1,	%g3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	xnor	%i5,	%o5,	%i7
	andcc	%l4,	0x0C3A,	%o4
	array16	%o1,	%g5,	%l2
	udiv	%l6,	0x0615,	%l3
	edge32n	%o2,	%i3,	%i6
	edge32	%g4,	%o3,	%i2
	movrlz	%o7,	0x30D,	%i1
	fmovdneg	%xcc,	%f2,	%f15
	movge	%xcc,	%o0,	%i0
	andcc	%g7,	0x169C,	%g2
	fmovse	%xcc,	%f15,	%f2
	call	loop_781
	tn	%xcc,	0x5
	mulscc	%o6,	%l5,	%l0
	smul	%g6,	%g1,	%l1
loop_781:
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f28
	movneg	%icc,	%g3,	%i5
	fmovrsgez	%i4,	%f11,	%f19
	addccc	%i7,	%o5,	%l4
	tg	%icc,	0x7
	movpos	%icc,	%o1,	%g5
	fpack32	%f14,	%f20,	%f12
	fornot1s	%f16,	%f19,	%f31
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x15
	edge16ln	%l2,	%o4,	%l3
	andncc	%l6,	%i3,	%i6
	fmovrsgz	%o2,	%f5,	%f11
	edge32ln	%g4,	%i2,	%o3
	sll	%i1,	%o7,	%o0
	movleu	%xcc,	%g7,	%g2
	edge8l	%i0,	%l5,	%o6
	bcc,a,pt	%xcc,	loop_782
	fcmpgt16	%f26,	%f24,	%g6
	brlz	%g1,	loop_783
	edge16ln	%l1,	%g3,	%i5
loop_782:
	fcmpgt32	%f2,	%f10,	%l0
	andncc	%i4,	%i7,	%l4
loop_783:
	bleu	loop_784
	fbl	%fcc0,	loop_785
	sll	%o5,	%o1,	%g5
	movvs	%xcc,	%o4,	%l2
loop_784:
	sdivx	%l6,	0x17AE,	%i3
loop_785:
	tsubcc	%l3,	0x1353,	%o2
	fornot2	%f28,	%f24,	%f28
	edge8n	%i6,	%i2,	%g4
	fbule,a	%fcc0,	loop_786
	orn	%i1,	%o3,	%o0
	fpadd32	%f2,	%f30,	%f2
	edge8l	%o7,	%g7,	%i0
loop_786:
	fmul8sux16	%f14,	%f0,	%f30
	sllx	%g2,	%l5,	%g6
	fnegs	%f12,	%f19
	tgu	%xcc,	0x3
	fmul8x16	%f26,	%f6,	%f18
	ldsb	[%l7 + 0x56],	%g1
	movgu	%icc,	%o6,	%l1
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g3,	%l0,	%i7
	andncc	%l4,	%i4,	%o5
	sdivx	%g5,	0x1440,	%o4
	fpadd32s	%f8,	%f28,	%f25
	edge16n	%l2,	%l6,	%i3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x64] %asi,	%o1
	movre	%o2,	0x0DB,	%i6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%g4
	orncc	%i1,	0x19D9,	%l3
	popc	0x0964,	%o0
	fmovsvc	%icc,	%f15,	%f0
	tcc	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o7
	tleu	%xcc,	0x7
	tg	%icc,	0x5
	fabss	%f21,	%f20
	fbuge	%fcc1,	loop_787
	edge32l	%g7,	%i0,	%o3
	movvs	%icc,	%g2,	%l5
	edge8n	%g1,	%o6,	%g6
loop_787:
	taddcc	%i5,	%l1,	%g3
	fmovrslez	%i7,	%f23,	%f4
	ldsw	[%l7 + 0x24],	%l0
	fnegs	%f28,	%f1
	fmovrde	%l4,	%f8,	%f16
	ld	[%l7 + 0x50],	%f12
	tcc	%icc,	0x5
	fbo	%fcc1,	loop_788
	srax	%o5,	%g5,	%i4
	fcmpeq32	%f28,	%f30,	%l2
	brlez,a	%o4,	loop_789
loop_788:
	bleu,pn	%icc,	loop_790
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f10
	membar	0x4F
loop_789:
	stb	%i3,	[%l7 + 0x42]
loop_790:
	fmovsleu	%icc,	%f16,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o1,	%o2,	%i6
	nop
	setx	loop_791,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16ln	%l6,	%g4,	%i2
	fabsd	%f28,	%f22
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i1,	%o0
loop_791:
	nop
	setx	0xE0F82207,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f22
	fnegs	%f3,	%f22
	nop
	setx loop_792, %l0, %l1
	jmpl %l1, %o7
	fmovdge	%icc,	%f14,	%f14
	movge	%icc,	%l3,	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%g7
loop_792:
	nop
	set	0x7C, %g5
	lduwa	[%l7 + %g5] 0x88,	%l5
	movcs	%icc,	%g2,	%g1
	brnz,a	%o6,	loop_793
	edge32l	%i5,	%l1,	%g6
	tge	%icc,	0x4
	fmovrsne	%g3,	%f1,	%f21
loop_793:
	ldd	[%l7 + 0x40],	%i6
	fmovsn	%xcc,	%f19,	%f2
	fmovsneg	%icc,	%f13,	%f31
	nop
	setx	loop_794,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%l0,	0x0F3F,	%o5
loop_794:
	taddcc	%l4,	0x0867,	%i4
	nop
	setx	0xE5E009F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xB8ED44D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f17,	%f11
	tcs	%icc,	0x2
	tne	%xcc,	0x7
	brlez	%l2,	loop_795
	fmovspos	%xcc,	%f14,	%f17
	bcc	%xcc,	loop_796
	be,pn	%xcc,	loop_797
loop_795:
	bg	loop_798
	array16	%o4,	%g5,	%i3
loop_796:
	movvc	%icc,	%o2,	%i6
loop_797:
	nop
	setx	0xF8E398B9B073D398,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_798:
	fmovscs	%xcc,	%f20,	%f28
	sdivx	%o1,	0x0B2C,	%l6
	membar	0x7F
	fbuge	%fcc2,	loop_799
	nop
	setx	0x909691C3F07BD006,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	movneg	%xcc,	%g4,	%i2
	flush	%l7 + 0x6C
loop_799:
	bleu,a,pn	%icc,	loop_800
	sir	0x0CDC
	movcs	%xcc,	%o0,	%i1
	std	%f22,	[%l7 + 0x40]
loop_800:
	movcc	%xcc,	%l3,	%i0
	movpos	%xcc,	%o3,	%o7
	set	0x50, %i1
	stxa	%l5,	[%l7 + %i1] 0x89
	mova	%xcc,	%g2,	%g1
	mova	%icc,	%o6,	%g7
	brlez	%i5,	loop_801
	call	loop_802
	bgu,a	loop_803
	edge32	%l1,	%g3,	%i7
loop_801:
	lduh	[%l7 + 0x12],	%g6
loop_802:
	srl	%l0,	0x04,	%l4
loop_803:
	movrlz	%o5,	0x327,	%l2
	andn	%i4,	%g5,	%i3
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f30
	movvs	%xcc,	%o2,	%i6
	movge	%xcc,	%o4,	%l6
	subccc	%g4,	0x1A31,	%i2
	tgu	%icc,	0x4
	alignaddrl	%o1,	%o0,	%l3
	for	%f16,	%f30,	%f4
	movcc	%icc,	%i0,	%i1
	bg,a,pn	%icc,	loop_804
	fbue,a	%fcc1,	loop_805
	fcmpgt32	%f2,	%f8,	%o7
	edge16	%o3,	%l5,	%g1
loop_804:
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g2
loop_805:
	tg	%icc,	0x1
	set	0x44, %o3
	ldswa	[%l7 + %o3] 0x19,	%o6
	movcc	%xcc,	%i5,	%g7
	addccc	%g3,	%l1,	%i7
	xnorcc	%l0,	0x0EDE,	%l4
	sdivcc	%g6,	0x1821,	%o5
	fmovrslez	%l2,	%f16,	%f10
	andcc	%i4,	%g5,	%i3
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i6
	fmovrdlez	%o2,	%f14,	%f28
	fmovdcc	%xcc,	%f29,	%f23
	subcc	%l6,	0x0896,	%o4
	fmovrdgez	%i2,	%f16,	%f12
	xnorcc	%g4,	%o0,	%o1
	udivcc	%i0,	0x03CA,	%i1
	fbn,a	%fcc2,	loop_806
	array32	%o7,	%o3,	%l5
	tgu	%icc,	0x4
	fsrc1s	%f5,	%f1
loop_806:
	nop
	setx	0x207C7EA5991600C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA94912ED975E7B4A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f16,	%f20
	nop
	fitod	%f6,	%f28
	fdtos	%f28,	%f0
	array16	%g1,	%l3,	%g2
	srax	%o6,	0x0C,	%g7
	edge16n	%i5,	%l1,	%g3
	fnors	%f17,	%f27,	%f22
	fmovrslez	%l0,	%f27,	%f4
	fmovrse	%l4,	%f8,	%f16
	stbar
	lduw	[%l7 + 0x68],	%i7
	movl	%icc,	%o5,	%g6
	set	0x0C, %i7
	stwa	%i4,	[%l7 + %i7] 0x14
	fmovrse	%g5,	%f6,	%f24
	movle	%icc,	%i3,	%l2
	fmovsn	%xcc,	%f16,	%f31
	fbo,a	%fcc1,	loop_807
	edge8n	%i6,	%l6,	%o4
	array32	%o2,	%g4,	%o0
	fpackfix	%f16,	%f16
loop_807:
	fxnor	%f2,	%f0,	%f6
	fornot1	%f0,	%f4,	%f0
	membar	0x59
	fmovdcs	%icc,	%f18,	%f28
	fnot1s	%f7,	%f22
	sdivcc	%i2,	0x10D0,	%i0
	te	%xcc,	0x0
	srlx	%o1,	%o7,	%o3
	brlez,a	%i1,	loop_808
	movg	%xcc,	%l5,	%g1
	nop
	fitod	%f4,	%f12
	fdtoi	%f12,	%f25
	bl	loop_809
loop_808:
	movcc	%xcc,	%g2,	%o6
	edge16n	%g7,	%l3,	%l1
	movl	%xcc,	%g3,	%l0
loop_809:
	nop
	setx	0xC0DBA64B405A60DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	addc	%i5,	0x1F8C,	%l4
	nop
	set	0x1C, %i4
	ldsh	[%l7 + %i4],	%o5
	movne	%icc,	%i7,	%g6
	taddcc	%g5,	%i4,	%i3
	sdiv	%i6,	0x0CD7,	%l2
	fmovdne	%xcc,	%f16,	%f3
	fbo	%fcc0,	loop_810
	movvc	%icc,	%l6,	%o4
	xorcc	%o2,	%g4,	%o0
	fmovsvs	%icc,	%f29,	%f18
loop_810:
	brgez,a	%i0,	loop_811
	fbuge	%fcc1,	loop_812
	addccc	%i2,	%o7,	%o1
	ba,a,pn	%icc,	loop_813
loop_811:
	fnot2	%f20,	%f24
loop_812:
	fmovdne	%icc,	%f27,	%f0
	bne,pt	%icc,	loop_814
loop_813:
	mova	%icc,	%i1,	%l5
	tneg	%xcc,	0x0
	or	%g1,	0x0437,	%o3
loop_814:
	fmovdleu	%icc,	%f20,	%f26
	nop
	setx	loop_815,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%o6,	%g7,	%l3
	xnor	%g2,	%l1,	%l0
	ldx	[%l7 + 0x70],	%i5
loop_815:
	fornot2s	%f26,	%f19,	%f29
	smulcc	%g3,	0x0905,	%o5
	movrgez	%i7,	%g6,	%l4
	edge8l	%i4,	%i3,	%g5
	tpos	%icc,	0x6
	srl	%l2,	0x1A,	%l6
	mulscc	%i6,	%o4,	%o2
	orncc	%g4,	%o0,	%i2
	ldsh	[%l7 + 0x28],	%i0
	tn	%xcc,	0x4
	smul	%o1,	0x1D6B,	%i1
	fnands	%f19,	%f13,	%f5
	prefetch	[%l7 + 0x0C],	 0x1
	te	%xcc,	0x2
	fmovsge	%xcc,	%f10,	%f3
	orn	%l5,	0x070C,	%o7
	fmovsa	%xcc,	%f16,	%f0
	ta	%xcc,	0x0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x64] %asi,	%o3
	bge,a	%xcc,	loop_816
	fmovsleu	%icc,	%f31,	%f19
	taddcc	%o6,	0x1D05,	%g7
	move	%xcc,	%l3,	%g1
loop_816:
	tvs	%xcc,	0x5
	fmovdge	%icc,	%f8,	%f30
	ldsh	[%l7 + 0x7E],	%l1
	tne	%icc,	0x7
	fmovsne	%xcc,	%f25,	%f14
	set	0x16, %i2
	stba	%l0,	[%l7 + %i2] 0x80
	mulx	%g2,	0x1584,	%g3
	orn	%o5,	%i5,	%i7
	movrgz	%l4,	%i4,	%i3
	bg,a,pt	%icc,	loop_817
	tneg	%icc,	0x2
	movg	%xcc,	%g6,	%l2
	fpack16	%f16,	%f13
loop_817:
	fmul8x16al	%f27,	%f23,	%f24
	addccc	%l6,	0x0FDD,	%g5
	stbar
	tg	%xcc,	0x4
	movrlz	%o4,	0x167,	%i6
	call	loop_818
	sdiv	%o2,	0x0233,	%o0
	nop
	setx	0x1062D415,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	set	0x0C, %i6
	swapa	[%l7 + %i6] 0x11,	%i2
loop_818:
	orn	%g4,	0x029F,	%o1
	edge16n	%i0,	%l5,	%i1
	fcmpeq16	%f2,	%f4,	%o3
	sllx	%o7,	0x0F,	%g7
	nop
	setx	loop_819,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc2s	%f14,	%f25
	brnz,a	%o6,	loop_820
	fnands	%f30,	%f9,	%f18
loop_819:
	addccc	%g1,	%l3,	%l0
	fcmple32	%f14,	%f12,	%g2
loop_820:
	fmuld8ulx16	%f14,	%f13,	%f24
	nop
	setx	0x2335FAE019376036,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f28
	ldx	[%l7 + 0x68],	%g3
	tcc	%icc,	0x4
	sir	0x193B
	orncc	%o5,	%l1,	%i5
	set	0x60, %l0
	prefetcha	[%l7 + %l0] 0x18,	 0x0
	set	0x38, %o2
	ldxa	[%g0 + %o2] 0x20,	%i7
	tcc	%icc,	0x3
	nop
	setx	0xB82C09E2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xCECE34BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f0,	%f21
	sll	%i3,	%i4,	%l2
	tvs	%xcc,	0x5
	fbul,a	%fcc1,	loop_821
	tg	%icc,	0x0
	fmul8sux16	%f18,	%f16,	%f8
	taddcc	%l6,	%g5,	%o4
loop_821:
	fpadd32s	%f5,	%f6,	%f2
	movleu	%icc,	%i6,	%g6
	mova	%icc,	%o0,	%o2
	orncc	%i2,	0x0327,	%o1
	nop
	fitos	%f6,	%f17
	fstod	%f17,	%f18
	fbne,a	%fcc3,	loop_822
	brz	%i0,	loop_823
	srlx	%g4,	%l5,	%i1
	movgu	%xcc,	%o3,	%g7
loop_822:
	fcmple16	%f22,	%f26,	%o7
loop_823:
	tne	%xcc,	0x0
	srl	%o6,	%g1,	%l0
	fandnot1	%f22,	%f6,	%f18
	tleu	%icc,	0x6
	ta	%icc,	0x5
	fmovrdlz	%l3,	%f4,	%f14
	fbule,a	%fcc0,	loop_824
	fpadd32	%f22,	%f26,	%f20
	fblg	%fcc2,	loop_825
	fmovrslz	%g2,	%f11,	%f11
loop_824:
	subc	%o5,	%g3,	%l1
	fmovdleu	%icc,	%f7,	%f29
loop_825:
	ldd	[%l7 + 0x50],	%f8
	te	%xcc,	0x3
	orcc	%l4,	0x1D4C,	%i5
	movrlz	%i7,	%i4,	%l2
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x0B] %asi,	%l6
	sdivx	%i3,	0x0BD0,	%o4
	movne	%icc,	%i6,	%g6
	bne,a	loop_826
	movrlz	%g5,	%o2,	%i2
	bpos	loop_827
	movl	%icc,	%o0,	%i0
loop_826:
	smulcc	%o1,	%l5,	%i1
	tvs	%icc,	0x6
loop_827:
	fmovrdgez	%o3,	%f22,	%f16
	movneg	%xcc,	%g4,	%g7
	add	%o7,	%o6,	%l0
	edge16n	%l3,	%g2,	%o5
	movge	%xcc,	%g3,	%g1
	brgz	%l1,	loop_828
	udivx	%l4,	0x03ED,	%i5
	sra	%i7,	0x1D,	%i4
	orncc	%l2,	0x0726,	%l6
loop_828:
	fbge	%fcc0,	loop_829
	brlez,a	%i3,	loop_830
	movrne	%o4,	%g6,	%i6
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%o2
loop_829:
	movl	%xcc,	%i2,	%g5
loop_830:
	fmul8sux16	%f4,	%f2,	%f16
	brz	%i0,	loop_831
	taddcctv	%o0,	0x1043,	%l5
	bge	%xcc,	loop_832
	ta	%icc,	0x7
loop_831:
	fcmpgt32	%f30,	%f6,	%o1
	addcc	%i1,	%g4,	%g7
loop_832:
	addccc	%o3,	%o6,	%l0
	tg	%icc,	0x5
	brlz,a	%o7,	loop_833
	ba,pt	%xcc,	loop_834
	tg	%xcc,	0x1
	set	0x14, %g3
	stwa	%g2,	[%l7 + %g3] 0xe2
	membar	#Sync
loop_833:
	fornot2	%f30,	%f14,	%f26
loop_834:
	bcc,a,pn	%icc,	loop_835
	tpos	%xcc,	0x4
	fcmpgt16	%f24,	%f24,	%l3
	sdiv	%g3,	0x0E59,	%g1
loop_835:
	brz	%o5,	loop_836
	fba,a	%fcc2,	loop_837
	mulscc	%l4,	%l1,	%i5
	bge,a	loop_838
loop_836:
	fxors	%f13,	%f9,	%f3
loop_837:
	edge32l	%i4,	%i7,	%l6
	xnor	%i3,	0x1BF5,	%o4
loop_838:
	fnor	%f14,	%f2,	%f18
	sllx	%g6,	%i6,	%o2
	flush	%l7 + 0x5C
	xor	%l2,	0x0162,	%g5
	umulcc	%i2,	%o0,	%i0
	brlz	%o1,	loop_839
	brlez	%i1,	loop_840
	edge32l	%g4,	%l5,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_839:
	fmovdcs	%icc,	%f7,	%f25
loop_840:
	sdiv	%g7,	0x0834,	%l0
	stw	%o7,	[%l7 + 0x40]
	andn	%o6,	%l3,	%g3
	fcmpgt16	%f14,	%f4,	%g2
	fmovdcs	%xcc,	%f13,	%f28
	nop
	setx	0x65CFAEF7007B21CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xFACB520A5D7E2DBB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f28,	%f16
	fsrc1s	%f18,	%f17
	fbue	%fcc3,	loop_841
	sir	0x1444
	te	%xcc,	0x5
	sir	0x1C96
loop_841:
	ba,pn	%xcc,	loop_842
	nop
	setx	0x7EEBA19F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x60913B60,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f27,	%f22
	set	0x5C, %o0
	lduha	[%l7 + %o0] 0x10,	%o5
loop_842:
	fmovdg	%xcc,	%f24,	%f12
	membar	0x4F
	fba	%fcc3,	loop_843
	popc	%g1,	%l4
	or	%l1,	0x0024,	%i5
	movgu	%icc,	%i4,	%l6
loop_843:
	stx	%i7,	[%l7 + 0x48]
	nop
	setx	0xF064FAAA,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	fbule	%fcc2,	loop_844
	fmovsl	%xcc,	%f6,	%f16
	bgu	%icc,	loop_845
	edge8l	%i3,	%o4,	%g6
loop_844:
	movne	%xcc,	%o2,	%l2
	movneg	%xcc,	%i6,	%g5
loop_845:
	fandnot2	%f8,	%f24,	%f8
	sethi	0x05ED,	%i2
	xor	%o0,	%i0,	%i1
	nop
	set	0x7F, %o1
	stb	%g4,	[%l7 + %o1]
	orcc	%o1,	0x145B,	%o3
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x0c,	%l4
	fbule,a	%fcc2,	loop_846
	array16	%l0,	%o7,	%g7
	array16	%l3,	%g3,	%g2
	andncc	%o5,	%o6,	%l4
loop_846:
	nop
	setx	0x231A87FB3A37256F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x786270AC0BA0BF05,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f2,	%f14
	tn	%xcc,	0x7
	sir	0x1D63
	udivx	%g1,	0x13FC,	%i5
	edge16l	%i4,	%l6,	%l1
	fble,a	%fcc3,	loop_847
	fcmpeq32	%f12,	%f4,	%i7
	movrgez	%o4,	%g6,	%i3
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
loop_847:
	nop
	setx	0xED90B4481568B466,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x90B10D5D5396503F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f24,	%f26
	fnor	%f24,	%f20,	%f14
	movle	%xcc,	%i6,	%g5
	fmovspos	%xcc,	%f14,	%f31
	popc	%o2,	%i2
	tle	%xcc,	0x6
	array16	%o0,	%i0,	%g4
	fble	%fcc2,	loop_848
	fba,a	%fcc0,	loop_849
	edge16ln	%i1,	%o3,	%o1
	orncc	%l0,	0x1BF6,	%o7
loop_848:
	sra	%l5,	0x1A,	%l3
loop_849:
	brlez,a	%g7,	loop_850
	tsubcc	%g3,	0x006D,	%o5
	fones	%f17
	array32	%o6,	%g2,	%l4
loop_850:
	te	%xcc,	0x1
	edge16l	%i5,	%i4,	%g1
	taddcc	%l1,	0x1ADC,	%l6
	fmovs	%f19,	%f8
	fpsub16s	%f14,	%f13,	%f6
	movrlz	%i7,	%g6,	%o4
	edge16l	%i3,	%i6,	%g5
	movgu	%xcc,	%l2,	%o2
	sub	%i2,	0x0C4B,	%i0
	udiv	%g4,	0x1D39,	%o0
	fmovrdne	%o3,	%f12,	%f24
	movg	%xcc,	%o1,	%l0
	bcs	loop_851
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f2
	fxtod	%f2,	%f26
	fmovrdgz	%i1,	%f24,	%f14
	mulscc	%l5,	%l3,	%g7
loop_851:
	ldsb	[%l7 + 0x52],	%g3
	sra	%o5,	0x12,	%o7
	brlz,a	%g2,	loop_852
	fbn	%fcc2,	loop_853
	fbule,a	%fcc0,	loop_854
	tn	%xcc,	0x6
loop_852:
	nop
	setx	0x928DC288,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x3EB958BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f19,	%f4
loop_853:
	udiv	%l4,	0x06DB,	%o6
loop_854:
	nop
	setx	0xFBE07C65,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xE7CC3924,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f25,	%f3
	fornot2s	%f11,	%f16,	%f28
	fxors	%f30,	%f23,	%f6
	fpsub32s	%f4,	%f6,	%f13
	edge16ln	%i5,	%g1,	%l1
	array32	%l6,	%i4,	%g6
	sll	%i7,	%o4,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0723
	xnor	%g5,	%l2,	%o2
	sethi	0x05B5,	%i2
	orcc	%i0,	%g4,	%o0
	array8	%i6,	%o1,	%o3
	movpos	%icc,	%i1,	%l5
	smul	%l3,	0x0973,	%l0
	xor	%g3,	0x05D8,	%g7
	movg	%icc,	%o5,	%o7
	addcc	%l4,	%o6,	%i5
	udivcc	%g2,	0x0326,	%g1
	fbug,a	%fcc1,	loop_855
	tg	%xcc,	0x4
	edge8ln	%l6,	%i4,	%l1
	fcmple32	%f6,	%f22,	%g6
loop_855:
	sethi	0x1879,	%o4
	bneg	%icc,	loop_856
	movvc	%xcc,	%i3,	%i7
	nop
	setx	0x61AFE498,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xCE41F67E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f14,	%f4
	movg	%icc,	%g5,	%l2
loop_856:
	movcc	%icc,	%o2,	%i2
	movle	%xcc,	%i0,	%g4
	orcc	%i6,	0x1672,	%o1
	movn	%xcc,	%o3,	%o0
	prefetch	[%l7 + 0x2C],	 0x1
	fandnot2	%f16,	%f24,	%f22
	ld	[%l7 + 0x24],	%f29
	sdiv	%l5,	0x024C,	%i1
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f2
	fxtod	%f2,	%f4
	bpos,a	loop_857
	tgu	%icc,	0x6
	fmovsvs	%icc,	%f1,	%f21
	srax	%l3,	%l0,	%g7
loop_857:
	nop
	setx	0x1D0BAAFBA05F9A08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	addcc	%g3,	%o7,	%l4
	fsrc1s	%f24,	%f25
	edge32n	%o5,	%o6,	%i5
	taddcctv	%g1,	%g2,	%l6
	xnorcc	%l1,	%i4,	%o4
	wr	%g0,	0x20,	%asi
	stxa	%g6,	[%g0 + 0x10] %asi
	nop
	setx	0x4EB940A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xE98F6B5A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f24,	%f22
	tvc	%xcc,	0x1
	brz	%i7,	loop_858
	orcc	%g5,	%i3,	%o2
	bge,a	loop_859
	movne	%icc,	%i2,	%l2
loop_858:
	bneg,a,pn	%icc,	loop_860
	edge32n	%i0,	%g4,	%o1
loop_859:
	ta	%icc,	0x5
	brlez,a	%i6,	loop_861
loop_860:
	fzeros	%f4
	orncc	%o3,	%l5,	%o0
	edge16	%l3,	%l0,	%i1
loop_861:
	call	loop_862
	orcc	%g7,	0x0369,	%g3
	tsubcc	%l4,	%o7,	%o6
	addcc	%o5,	%i5,	%g1
loop_862:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc0,	loop_863
	edge8l	%l6,	%l1,	%i4
	fxors	%f15,	%f4,	%f15
	sll	%o4,	%g6,	%g2
loop_863:
	edge32n	%g5,	%i7,	%i3
	nop
	fitod	%f0,	%f22
	fdtox	%f22,	%f26
	fmovsg	%xcc,	%f29,	%f29
	fbule	%fcc0,	loop_864
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%icc,	%f31,	%f25
	edge8n	%o2,	%l2,	%i2
loop_864:
	fmovdvs	%xcc,	%f20,	%f0
	alignaddrl	%g4,	%i0,	%o1
	fmovdleu	%icc,	%f19,	%f12
	movcc	%icc,	%o3,	%l5
	xor	%o0,	0x18EB,	%i6
	bn,a,pt	%icc,	loop_865
	orncc	%l0,	%l3,	%i1
	fcmpne32	%f4,	%f14,	%g3
	brgz,a	%l4,	loop_866
loop_865:
	smul	%o7,	0x1B98,	%o6
	fcmple32	%f8,	%f10,	%g7
	addccc	%i5,	%o5,	%l6
loop_866:
	ldd	[%l7 + 0x28],	%g0
	add	%l1,	0x00DF,	%i4
	alignaddr	%g6,	%o4,	%g2
	edge16l	%i7,	%g5,	%i3
	movneg	%icc,	%l2,	%i2
	nop
	fitos	%f0,	%f5
	fstox	%f5,	%f10
	set	0x50, %i0
	ldsha	[%l7 + %i0] 0x81,	%o2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%i0
	move	%xcc,	%o1,	%o3
	nop
	fitos	%f12,	%f24
	movpos	%icc,	%l5,	%o0
	movneg	%xcc,	%g4,	%l0
	srax	%i6,	%i1,	%l3
	movre	%g3,	%o7,	%o6
	addc	%g7,	%i5,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble	%fcc2,	loop_867
	fxors	%f27,	%f14,	%f7
	fmuld8ulx16	%f1,	%f21,	%f18
	wr	%g0,	0x2a,	%asi
	stwa	%o5,	[%l7 + 0x18] %asi
	membar	#Sync
loop_867:
	edge32	%g1,	%l1,	%l6
	fmovsge	%xcc,	%f20,	%f4
	be,a,pt	%xcc,	loop_868
	tcc	%xcc,	0x3
	edge16ln	%i4,	%g6,	%g2
	fbe,a	%fcc2,	loop_869
loop_868:
	sdivx	%o4,	0x1332,	%g5
	umulcc	%i7,	0x0707,	%l2
	taddcc	%i2,	0x1BCF,	%i3
loop_869:
	fblg,a	%fcc3,	loop_870
	edge16ln	%o2,	%i0,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%l5,	%f28,	%f12
loop_870:
	ldd	[%l7 + 0x70],	%o0
	nop
	setx	0x1313AC298059CCEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	nop
	set	0x36, %l2
	ldstub	[%l7 + %l2],	%o0
	ldstub	[%l7 + 0x33],	%g4
	edge32n	%l0,	%i1,	%l3
	movrlez	%g3,	%i6,	%o6
	andncc	%g7,	%i5,	%l4
	fmovrdne	%o5,	%f16,	%f16
	fble,a	%fcc3,	loop_871
	taddcc	%o7,	%g1,	%l6
	movge	%icc,	%l1,	%g6
	fbl,a	%fcc0,	loop_872
loop_871:
	edge16n	%g2,	%o4,	%g5
	fbn,a	%fcc0,	loop_873
	taddcc	%i7,	%l2,	%i4
loop_872:
	bge,pn	%xcc,	loop_874
	xor	%i3,	0x0403,	%i2
loop_873:
	movpos	%icc,	%o2,	%i0
	edge32l	%o3,	%l5,	%o1
loop_874:
	fbge,a	%fcc1,	loop_875
	membar	0x30
	tsubcc	%o0,	0x1583,	%g4
	movrlz	%l0,	%l3,	%g3
loop_875:
	bleu,a,pt	%xcc,	loop_876
	nop
	setx	0x31D82DED7125348F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x1D11509166776B33,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f24,	%f26
	ldsb	[%l7 + 0x51],	%i6
	fzeros	%f10
loop_876:
	brlz	%i1,	loop_877
	xnor	%g7,	0x094A,	%o6
	fcmpne16	%f18,	%f12,	%i5
	movleu	%xcc,	%o5,	%o7
loop_877:
	tneg	%icc,	0x7
	add	%l4,	%g1,	%l1
	fblg,a	%fcc3,	loop_878
	fmovsleu	%xcc,	%f22,	%f31
	tcs	%icc,	0x5
	ldd	[%l7 + 0x18],	%i6
loop_878:
	te	%xcc,	0x1
	tle	%xcc,	0x5
	fxor	%f8,	%f22,	%f8
	movpos	%icc,	%g6,	%g2
	sll	%g5,	%i7,	%o4
	taddcc	%l2,	0x1AFA,	%i4
	edge16ln	%i2,	%o2,	%i3
	xnorcc	%i0,	0x02C3,	%o3
	orncc	%o1,	%l5,	%o0
	bgu,pn	%xcc,	loop_879
	bge,pn	%icc,	loop_880
	addccc	%g4,	%l3,	%l0
	edge8ln	%i6,	%i1,	%g3
loop_879:
	alignaddr	%o6,	%i5,	%o5
loop_880:
	edge8	%o7,	%g7,	%g1
	array16	%l4,	%l1,	%g6
	fmovrde	%l6,	%f18,	%f20
	fmovrslez	%g2,	%f29,	%f26
	movle	%xcc,	%g5,	%o4
	faligndata	%f0,	%f24,	%f20
	add	%i7,	%l2,	%i2
	or	%i4,	%i3,	%i0
	ldsb	[%l7 + 0x6A],	%o2
	movge	%xcc,	%o1,	%l5
	addccc	%o0,	%o3,	%g4
	bcs	loop_881
	movcs	%xcc,	%l0,	%l3
	nop
	fitos	%f12,	%f4
	fstoi	%f4,	%f8
	xnor	%i6,	0x0385,	%i1
loop_881:
	sdivx	%o6,	0x0E6C,	%g3
	brgez	%o5,	loop_882
	fbule,a	%fcc2,	loop_883
	ld	[%l7 + 0x7C],	%f15
	fmovrsgez	%o7,	%f11,	%f28
loop_882:
	bl,pt	%xcc,	loop_884
loop_883:
	movrlz	%i5,	%g1,	%g7
	fbl,a	%fcc3,	loop_885
	array32	%l4,	%l1,	%g6
loop_884:
	movrlez	%g2,	%g5,	%l6
	array16	%i7,	%l2,	%o4
loop_885:
	fnors	%f31,	%f12,	%f13
	membar	0x7F
	addccc	%i4,	0x06DB,	%i2
	movl	%icc,	%i3,	%o2
	nop
	fitod	%f6,	%f20
	fdtos	%f20,	%f25
	sdivx	%o1,	0x04FF,	%i0
	fone	%f30
	fcmpeq32	%f22,	%f24,	%l5
	movg	%xcc,	%o3,	%g4
	sdivx	%l0,	0x0885,	%o0
	prefetch	[%l7 + 0x24],	 0x0
	fcmple32	%f20,	%f6,	%l3
	udivx	%i6,	0x015A,	%o6
	edge32n	%i1,	%o5,	%o7
	movg	%xcc,	%i5,	%g3
	move	%xcc,	%g1,	%g7
	umulcc	%l1,	0x07E1,	%l4
	fmovda	%icc,	%f19,	%f6
	tvc	%xcc,	0x0
	srax	%g2,	0x01,	%g6
	fmovsneg	%xcc,	%f4,	%f7
	tsubcc	%l6,	0x1319,	%i7
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x62] %asi,	%g5
	ldx	[%l7 + 0x60],	%l2
	membar	0x5A
	addccc	%o4,	%i4,	%i2
	fmovdn	%xcc,	%f15,	%f10
	nop
	setx	0x5DBB6300,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xAA9452C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f29,	%f9
	sll	%i3,	0x1E,	%o1
	faligndata	%f14,	%f4,	%f22
	tsubcc	%o2,	0x1ACB,	%i0
	tcs	%icc,	0x1
	fone	%f12
	fone	%f18
	movrlez	%o3,	%g4,	%l0
	orn	%o0,	%l3,	%i6
	fsrc1	%f14,	%f14
	sir	0x103F
	array8	%o6,	%l5,	%o5
	edge32ln	%i1,	%o7,	%g3
	fmovrse	%i5,	%f25,	%f14
	edge8l	%g7,	%l1,	%g1
	set	0x1C, %l4
	lduwa	[%l7 + %l4] 0x81,	%g2
	tsubcc	%g6,	%l4,	%l6
	sra	%i7,	0x1A,	%l2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0xf8
	membar	#Sync
	subc	%o4,	%g5,	%i4
	addc	%i3,	0x1681,	%i2
	xorcc	%o2,	%i0,	%o1
	andcc	%o3,	%g4,	%l0
	movrlz	%l3,	%o0,	%o6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%o5
	fmovrdlez	%l5,	%f14,	%f20
	subccc	%o7,	%i1,	%i5
	alignaddr	%g3,	%l1,	%g1
	orcc	%g7,	0x1DB9,	%g6
	udivx	%g2,	0x07E0,	%l6
	edge8ln	%l4,	%l2,	%o4
	tvc	%xcc,	0x7
	fblg	%fcc0,	loop_886
	fba,a	%fcc3,	loop_887
	edge16l	%g5,	%i4,	%i3
	sdivx	%i7,	0x0969,	%i2
loop_886:
	nop
	set	0x22, %i5
	stha	%i0,	[%l7 + %i5] 0x15
loop_887:
	umul	%o2,	0x1C1F,	%o1
	add	%o3,	%g4,	%l0
	movcs	%icc,	%l3,	%o0
	fpackfix	%f26,	%f31
	movvc	%xcc,	%i6,	%o6
	udivcc	%l5,	0x069F,	%o7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x54] %asi,	%o5
	array32	%i1,	%i5,	%l1
	fsrc1	%f4,	%f0
	bvs,a	%icc,	loop_888
	tle	%xcc,	0x1
	addc	%g3,	%g1,	%g6
	umulcc	%g7,	%g2,	%l4
loop_888:
	brlz,a	%l2,	loop_889
	nop
	set	0x50, %g6
	sth	%o4,	[%l7 + %g6]
	edge16	%l6,	%g5,	%i3
	bcs,a	loop_890
loop_889:
	ba,a	%icc,	loop_891
	fornot2	%f16,	%f6,	%f20
	and	%i7,	0x0623,	%i4
loop_890:
	sub	%i0,	0x0AA4,	%o2
loop_891:
	smul	%i2,	%o3,	%o1
	movrgz	%g4,	%l0,	%o0
	fbn,a	%fcc1,	loop_892
	movge	%xcc,	%l3,	%o6
	stw	%i6,	[%l7 + 0x70]
	edge32l	%l5,	%o7,	%i1
loop_892:
	nop
	set	0x7C, %o4
	lda	[%l7 + %o4] 0x18,	%f9
	fors	%f19,	%f27,	%f21
	fcmple32	%f28,	%f8,	%i5
	fors	%f0,	%f22,	%f14
	brlz	%o5,	loop_893
	mulx	%l1,	%g3,	%g6
	nop
	setx	0x8915DC8C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x30B1C027,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f5,	%f24
	edge16	%g7,	%g2,	%g1
loop_893:
	sra	%l2,	0x12,	%o4
	movrlz	%l6,	0x303,	%g5
	tvs	%xcc,	0x7
	edge8	%i3,	%i7,	%i4
	sll	%i0,	0x09,	%o2
	bvs	loop_894
	edge16l	%l4,	%o3,	%i2
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x88,	%g4
loop_894:
	tge	%xcc,	0x7
	subcc	%o1,	%l0,	%l3
	fmovscs	%xcc,	%f11,	%f26
	tvc	%icc,	0x1
	movrlez	%o6,	%o0,	%l5
	movrgez	%o7,	%i1,	%i6
	movpos	%icc,	%o5,	%l1
	tl	%xcc,	0x2
	tle	%icc,	0x4
	stx	%g3,	[%l7 + 0x18]
	nop
	setx	0x539B52E6347B6378,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f28
	fmovrdlez	%g6,	%f4,	%f12
	edge16ln	%g7,	%g2,	%g1
	fbge,a	%fcc3,	loop_895
	fpsub16	%f16,	%f2,	%f6
	edge32n	%l2,	%i5,	%o4
	ldsw	[%l7 + 0x74],	%l6
loop_895:
	edge32ln	%i3,	%i7,	%i4
	stx	%g5,	[%l7 + 0x40]
	tneg	%icc,	0x1
	fmovs	%f23,	%f6
	mulscc	%i0,	0x0A41,	%l4
	bn	loop_896
	fcmpeq32	%f0,	%f12,	%o3
	edge16	%o2,	%i2,	%g4
	nop
	fitod	%f0,	%f22
	fdtoi	%f22,	%f20
loop_896:
	udivx	%o1,	0x1228,	%l3
	fbule,a	%fcc0,	loop_897
	sdivcc	%l0,	0x025B,	%o6
	set	0x15, %l1
	ldsba	[%l7 + %l1] 0x89,	%o0
loop_897:
	popc	0x11A3,	%l5
	ldd	[%l7 + 0x48],	%i0
	edge16l	%o7,	%i6,	%o5
	fcmpgt32	%f22,	%f18,	%g3
	fmovdg	%icc,	%f11,	%f15
	bge,a,pt	%xcc,	loop_898
	movne	%icc,	%l1,	%g6
	udivcc	%g7,	0x145F,	%g1
	movvc	%xcc,	%g2,	%l2
loop_898:
	fbl	%fcc1,	loop_899
	edge8n	%i5,	%l6,	%i3
	fpadd32	%f18,	%f22,	%f28
	alignaddrl	%i7,	%i4,	%o4
loop_899:
	movrgz	%g5,	0x3F6,	%l4
	brz	%i0,	loop_900
	fmul8sux16	%f28,	%f8,	%f16
	andncc	%o2,	%o3,	%g4
	andcc	%o1,	%l3,	%i2
loop_900:
	nop
	set	0x6C, %i3
	stwa	%l0,	[%l7 + %i3] 0x04
	tcc	%icc,	0x6
	fmovdleu	%xcc,	%f31,	%f7
	bcs,pn	%xcc,	loop_901
	mulx	%o0,	%o6,	%l5
	edge16	%o7,	%i1,	%i6
	xorcc	%o5,	0x0A0F,	%g3
loop_901:
	edge32n	%g6,	%g7,	%l1
	fsrc1s	%f4,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g2,	0x3A5,	%g1
	tpos	%icc,	0x0
	taddcctv	%l2,	%i5,	%l6
	movrgz	%i7,	0x2D2,	%i4
	movge	%icc,	%o4,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x1
	sll	%l4,	0x01,	%i0
	movrlz	%i3,	%o3,	%g4
	nop
	fitos	%f13,	%f10
	fstod	%f10,	%f14
	orcc	%o1,	%o2,	%l3
	ble,a,pn	%icc,	loop_902
	movre	%l0,	0x0CD,	%i2
	fmovsg	%icc,	%f0,	%f4
	bge,a	%xcc,	loop_903
loop_902:
	bshuffle	%f18,	%f30,	%f22
	andncc	%o0,	%l5,	%o7
	fbg,a	%fcc1,	loop_904
loop_903:
	mulx	%i1,	%o6,	%o5
	fmovspos	%xcc,	%f9,	%f30
	bg,a	loop_905
loop_904:
	fmovrdlez	%i6,	%f24,	%f12
	fnegd	%f24,	%f12
	st	%f5,	[%l7 + 0x78]
loop_905:
	nop
	set	0x1C, %o7
	lda	[%l7 + %o7] 0x19,	%f19
	ldd	[%l7 + 0x38],	%g6
	andncc	%g7,	%g3,	%g2
	fcmpgt32	%f26,	%f26,	%g1
	movleu	%xcc,	%l2,	%i5
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l6
	fmovdn	%icc,	%f8,	%f5
	bneg,pn	%icc,	loop_906
	edge32	%i7,	%l1,	%i4
	nop
	setx	loop_907,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%g5,	%l4,	%o4
loop_906:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f18,	[%l7 + 0x34] %asi
loop_907:
	stb	%i3,	[%l7 + 0x0E]
	smul	%o3,	%i0,	%g4
	movne	%xcc,	%o1,	%o2
	umul	%l0,	0x1D1E,	%l3
	tpos	%icc,	0x0
	ba,a,pn	%icc,	loop_908
	popc	0x14E7,	%o0
	smulcc	%l5,	%i2,	%i1
	edge8l	%o7,	%o5,	%i6
loop_908:
	fmul8x16au	%f28,	%f14,	%f26
	nop
	setx loop_909, %l0, %l1
	jmpl %l1, %g6
	movvs	%icc,	%g7,	%o6
	tne	%xcc,	0x5
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_909:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	array32	%g2,	%g3,	%l2
	fbu	%fcc1,	loop_910
	ldstub	[%l7 + 0x43],	%i5
	edge16	%g1,	%l6,	%l1
	edge16l	%i7,	%g5,	%i4
loop_910:
	smulcc	%o4,	0x10AE,	%i3
	tsubcc	%l4,	%o3,	%i0
	movrne	%g4,	%o1,	%l0
	andcc	%l3,	0x1118,	%o0
	ldub	[%l7 + 0x66],	%o2
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f16
	fxtod	%f16,	%f8
	fmul8x16au	%f24,	%f5,	%f8
	xorcc	%l5,	%i1,	%i2
	ldsb	[%l7 + 0x79],	%o7
	tsubcc	%i6,	%o5,	%g7
	movvs	%xcc,	%o6,	%g6
	bge,pt	%xcc,	loop_911
	add	%g2,	%g3,	%l2
	tg	%xcc,	0x7
	xnorcc	%g1,	%i5,	%l1
loop_911:
	fmul8x16al	%f2,	%f6,	%f20
	fblg	%fcc0,	loop_912
	edge32n	%l6,	%g5,	%i4
	movgu	%icc,	%i7,	%i3
	prefetch	[%l7 + 0x34],	 0x3
loop_912:
	nop
	set	0x38, %l6
	ldd	[%l7 + %l6],	%f0
	fmovdne	%icc,	%f10,	%f6
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%o4
	fmovsneg	%icc,	%f1,	%f11
	movleu	%xcc,	%o3,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x2
	pdist	%f6,	%f14,	%f22
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x26] %asi,	%g4
	tl	%xcc,	0x4
	movre	%o1,	%l0,	%l4
	bl,a,pt	%icc,	loop_913
	movrgz	%l3,	0x257,	%o0
	orcc	%o2,	0x0C7A,	%l5
	bg,a,pt	%icc,	loop_914
loop_913:
	subc	%i2,	%o7,	%i1
	bvs,a,pn	%icc,	loop_915
	fornot2	%f22,	%f6,	%f28
loop_914:
	fbuge	%fcc3,	loop_916
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_915:
	bne,a	loop_917
	umul	%i6,	0x1276,	%g7
loop_916:
	addcc	%o6,	0x0A02,	%g6
	edge16	%g2,	%o5,	%l2
loop_917:
	move	%icc,	%g3,	%i5
	sra	%g1,	%l1,	%l6
	alignaddrl	%i4,	%g5,	%i3
	orcc	%o4,	0x1355,	%i7
	fbne,a	%fcc0,	loop_918
	fmovdn	%icc,	%f15,	%f0
	tneg	%xcc,	0x3
	stw	%o3,	[%l7 + 0x70]
loop_918:
	add	%i0,	%g4,	%l0
	fsrc2s	%f11,	%f5
	fnegs	%f0,	%f22
	ble	%xcc,	loop_919
	sethi	0x1B0A,	%l4
	movvs	%xcc,	%l3,	%o0
	mulscc	%o2,	0x1550,	%l5
loop_919:
	array32	%i2,	%o7,	%i1
	taddcctv	%i6,	0x1501,	%g7
	edge32	%o6,	%o1,	%g6
	bcc,a,pn	%icc,	loop_920
	movpos	%icc,	%g2,	%l2
	tcc	%xcc,	0x0
	ldub	[%l7 + 0x6B],	%o5
loop_920:
	fmovdleu	%xcc,	%f7,	%f9
	fbul,a	%fcc2,	loop_921
	srl	%g3,	0x11,	%g1
	nop
	setx	0x271A750433364FB3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x49001BEB4A7763A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f0,	%f18
	fmovrsne	%i5,	%f3,	%f9
loop_921:
	edge16	%l1,	%i4,	%l6
	subcc	%g5,	0x03C1,	%i3
	fornot2s	%f21,	%f13,	%f4
	wr	%g0,	0x11,	%asi
	stwa	%i7,	[%l7 + 0x64] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f16,	%f12,	%f18
	movrgz	%o3,	0x32C,	%o4
	bl,a	loop_922
	movgu	%xcc,	%g4,	%l0
	subc	%l4,	0x1830,	%i0
	tl	%xcc,	0x3
loop_922:
	edge8ln	%l3,	%o2,	%o0
	nop
	setx	loop_923,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x30],	%i2
	ldx	[%l7 + 0x30],	%l5
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_923:
	edge16l	%i1,	%o7,	%i6
	srl	%o6,	0x13,	%g7
	flush	%l7 + 0x10
	movvs	%icc,	%g6,	%o1
	ld	[%l7 + 0x2C],	%f9
	xnor	%l2,	0x0253,	%g2
	fzeros	%f20
	tneg	%xcc,	0x1
	array16	%o5,	%g1,	%i5
	or	%g3,	%i4,	%l6
	sth	%l1,	[%l7 + 0x34]
	nop
	setx	0x94D98482C688190B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xED7CEEE7C9C62D04,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f20,	%f12
	edge16	%i3,	%i7,	%g5
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge16n	%o3,	%g4,	%l0
	movpos	%xcc,	%l4,	%i0
	tle	%xcc,	0x0
	fsrc2	%f4,	%f2
	move	%xcc,	%l3,	%o2
	prefetch	[%l7 + 0x78],	 0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f22,	%f20,	%o4
	srl	%i2,	0x06,	%l5
	bshuffle	%f18,	%f30,	%f20
	bneg,a,pn	%icc,	loop_924
	or	%o0,	%o7,	%i6
	orncc	%i1,	%o6,	%g6
	sdiv	%g7,	0x1884,	%o1
loop_924:
	orncc	%l2,	%g2,	%g1
	ta	%icc,	0x0
	mova	%icc,	%o5,	%g3
	ldd	[%l7 + 0x48],	%i4
	sir	0x096E
	udivcc	%i5,	0x184C,	%l6
	fnegs	%f28,	%f10
	sethi	0x09D8,	%l1
	andn	%i3,	%g5,	%o3
	sdivcc	%i7,	0x01A2,	%g4
	movcc	%icc,	%l0,	%l4
	alignaddr	%i0,	%l3,	%o2
	flush	%l7 + 0x18
	fcmple32	%f26,	%f20,	%o4
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	stw	%l5,	[%l7 + 0x68]
	movcc	%xcc,	%o0,	%i2
	tpos	%icc,	0x5
	and	%i6,	0x0121,	%i1
	edge16ln	%o7,	%g6,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x38] %asi,	%o1
	nop
	fitod	%f5,	%f28
	set	0x64, %g1
	lduwa	[%l7 + %g1] 0x19,	%g7
	umul	%g2,	%g1,	%o5
	flush	%l7 + 0x40
	brgz	%g3,	loop_925
	array16	%i4,	%i5,	%l6
	nop
	set	0x60, %o6
	stx	%l2,	[%l7 + %o6]
	fmovdvc	%icc,	%f23,	%f10
loop_925:
	alignaddrl	%i3,	%g5,	%o3
	fsrc2	%f4,	%f18
	array16	%l1,	%g4,	%i7
	movvc	%xcc,	%l0,	%l4
	tpos	%xcc,	0x4
	bne,a	loop_926
	fba,a	%fcc0,	loop_927
	tcs	%xcc,	0x2
	ldx	[%l7 + 0x78],	%i0
loop_926:
	fnegd	%f28,	%f2
loop_927:
	sdivx	%l3,	0x163D,	%o2
	wr	%g0,	0xe3,	%asi
	stwa	%o4,	[%l7 + 0x60] %asi
	membar	#Sync
	fmuld8sux16	%f23,	%f28,	%f24
	fmovsleu	%icc,	%f26,	%f4
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	addcc	%o0,	%l5,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i1,	%o7,	%g6
	orncc	%o6,	0x0676,	%i2
	tgu	%xcc,	0x7
	fbg,a	%fcc1,	loop_928
	lduh	[%l7 + 0x32],	%g7
	orncc	%o1,	0x0D0C,	%g1
	tle	%icc,	0x3
loop_928:
	nop
	set	0x7C, %l3
	sta	%f6,	[%l7 + %l3] 0x11
	fcmple32	%f10,	%f16,	%g2
	tne	%xcc,	0x1
	fbge	%fcc3,	loop_929
	bn,a	loop_930
	fcmpne32	%f12,	%f24,	%g3
	fmovdvs	%xcc,	%f4,	%f15
loop_929:
	alignaddr	%i4,	%i5,	%l6
loop_930:
	tneg	%icc,	0x2
	taddcctv	%l2,	0x0484,	%o5
	fmovrdgz	%i3,	%f30,	%f6
	fandnot1	%f12,	%f8,	%f24
	movg	%xcc,	%o3,	%l1
	sllx	%g5,	0x1D,	%g4
	membar	0x28
	mulscc	%l0,	%i7,	%l4
	edge32ln	%i0,	%l3,	%o4
	nop
	fitod	%f30,	%f14
	add	%o2,	0x04C4,	%l5
	fmovd	%f6,	%f26
	fandnot1s	%f21,	%f14,	%f3
	or	%o0,	%i1,	%o7
	nop
	fitod	%f1,	%f16
	fbug,a	%fcc3,	loop_931
	bne,pt	%icc,	loop_932
	fnand	%f12,	%f30,	%f8
	tsubcctv	%g6,	0x1D5B,	%o6
loop_931:
	tsubcc	%i6,	0x075E,	%g7
loop_932:
	array8	%o1,	%g1,	%g2
	fors	%f28,	%f29,	%f7
	add	%i2,	0x1BEF,	%g3
	nop
	setx	0xDBEEC7AF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x41799356,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f30,	%f25
	fbl,a	%fcc0,	loop_933
	umul	%i4,	%i5,	%l2
	fbl,a	%fcc0,	loop_934
	addc	%o5,	0x19F8,	%i3
loop_933:
	sdiv	%o3,	0x18AF,	%l1
	alignaddrl	%g5,	%g4,	%l0
loop_934:
	ble,a	%xcc,	loop_935
	ldsw	[%l7 + 0x70],	%l6
	mulx	%l4,	%i7,	%l3
	edge16ln	%o4,	%o2,	%l5
loop_935:
	fmovdcc	%xcc,	%f25,	%f19
	tleu	%xcc,	0x4
	tleu	%icc,	0x4
	bg,a,pt	%xcc,	loop_936
	sub	%o0,	0x12B3,	%i1
	movcc	%xcc,	%o7,	%i0
	fbge,a	%fcc3,	loop_937
loop_936:
	addcc	%g6,	0x0094,	%o6
	udivcc	%g7,	0x049A,	%o1
	movvs	%xcc,	%g1,	%i6
loop_937:
	sdivcc	%i2,	0x1355,	%g3
	nop
	setx	0xD74B0123,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xD826314E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f9,	%f30
	tcc	%xcc,	0x4
	srax	%g2,	0x09,	%i4
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movle	%xcc,	%i5,	%o5
	fnot1s	%f12,	%f10
	tcs	%icc,	0x1
	sll	%l2,	0x19,	%o3
	tgu	%xcc,	0x3
	set	0x6C, %g2
	swapa	[%l7 + %g2] 0x11,	%l1
	nop
	setx loop_938, %l0, %l1
	jmpl %l1, %g5
	mulx	%g4,	%i3,	%l6
	nop
	setx	0x84DD7A7740549FEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	bcc,a,pt	%xcc,	loop_939
loop_938:
	fornot1	%f22,	%f14,	%f28
	movn	%xcc,	%l0,	%i7
	movvc	%xcc,	%l3,	%o4
loop_939:
	sub	%l4,	0x1D34,	%o2
	nop
	setx	0x9F4B00E690579D3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovrsgez	%l5,	%f9,	%f4
	nop
	setx	0xEDE38B92,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x99C87C25,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f24,	%f13
	fble	%fcc2,	loop_940
	orn	%o0,	0x0C1D,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i0,	%g6,	%o6
loop_940:
	fbul	%fcc1,	loop_941
	fmovrde	%o7,	%f4,	%f8
	udiv	%g7,	0x0779,	%g1
	sdiv	%i6,	0x106A,	%i2
loop_941:
	srl	%o1,	0x11,	%g3
	edge8n	%g2,	%i5,	%i4
	edge8l	%o5,	%o3,	%l2
	xorcc	%g5,	0x0091,	%g4
	sir	0x07E0
	subc	%l1,	0x1964,	%l6
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x40] %asi,	%i3
	fmovsvc	%icc,	%f27,	%f22
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l0
	edge8ln	%i7,	%o4,	%l4
	fornot1	%f26,	%f12,	%f6
	fmovsvc	%xcc,	%f24,	%f6
	brgez	%o2,	loop_942
	bpos,pt	%icc,	loop_943
	lduh	[%l7 + 0x4E],	%l5
	xnorcc	%o0,	%i1,	%l3
loop_942:
	tle	%xcc,	0x7
loop_943:
	sdivx	%i0,	0x05A6,	%o6
	edge8ln	%g6,	%o7,	%g1
	or	%i6,	0x1B40,	%i2
	sdivcc	%g7,	0x1777,	%g3
	movrgez	%o1,	%i5,	%g2
	stb	%i4,	[%l7 + 0x6B]
	addc	%o3,	0x0FF7,	%l2
	brgz	%g5,	loop_944
	andn	%o5,	%l1,	%l6
	bneg,pn	%xcc,	loop_945
	fnand	%f26,	%f28,	%f16
loop_944:
	smulcc	%i3,	0x0EC0,	%g4
	nop
	set	0x26, %g5
	ldsb	[%l7 + %g5],	%i7
loop_945:
	tvs	%icc,	0x2
	fmovrdgez	%o4,	%f2,	%f8
	fblg	%fcc3,	loop_946
	fpack32	%f22,	%f0,	%f22
	fmovrdgez	%l4,	%f18,	%f20
	movleu	%icc,	%o2,	%l5
loop_946:
	fmovde	%xcc,	%f30,	%f14
	sir	0x1CC5
	tsubcctv	%l0,	0x189D,	%o0
	call	loop_947
	movvs	%icc,	%i1,	%l3
	fnor	%f16,	%f12,	%f8
	ldsh	[%l7 + 0x2A],	%o6
loop_947:
	fmovsle	%xcc,	%f16,	%f29
	udiv	%i0,	0x1FC3,	%o7
	mova	%icc,	%g1,	%g6
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x0c,	%i2
	srax	%g7,	%i6,	%g3
	edge32	%i5,	%g2,	%i4
	movrgz	%o3,	0x0C7,	%l2
	andn	%o1,	0x1BE2,	%g5
	fzero	%f22
	fmovda	%icc,	%f19,	%f13
	fpadd16	%f28,	%f28,	%f14
	movge	%xcc,	%l1,	%o5
	xorcc	%i3,	%g4,	%i7
	subccc	%l6,	0x0F1F,	%o4
	srl	%o2,	0x1B,	%l5
	fandnot2	%f26,	%f30,	%f18
	ldsw	[%l7 + 0x5C],	%l0
	xnor	%l4,	%o0,	%l3
	subc	%o6,	0x020E,	%i0
	flush	%l7 + 0x44
	stx	%i1,	[%l7 + 0x70]
	movrgz	%o7,	%g6,	%g1
	fmovspos	%xcc,	%f28,	%f25
	fmul8sux16	%f4,	%f28,	%f8
	fsrc1	%f6,	%f26
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x2c,	%g6
	bne,a,pn	%xcc,	loop_948
	sdiv	%i6,	0x0471,	%i2
	xor	%i5,	0x0DF4,	%g2
	sethi	0x1BD7,	%i4
loop_948:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn	%fcc1,	loop_949
	smulcc	%o3,	%l2,	%g3
	movre	%o1,	0x0A3,	%l1
	movn	%icc,	%o5,	%i3
loop_949:
	fcmpgt16	%f6,	%f8,	%g5
	nop
	setx	0x342A7F120DE54D9A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xD6F8CBB5502C50A5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f4,	%f14
	sll	%i7,	0x16,	%g4
	fbule	%fcc2,	loop_950
	fnegs	%f21,	%f25
	movvc	%icc,	%o4,	%l6
	tl	%xcc,	0x1
loop_950:
	bneg,a	%icc,	loop_951
	fmuld8sux16	%f12,	%f18,	%f14
	membar	0x5F
	nop
	setx	loop_952,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_951:
	movleu	%icc,	%l5,	%o2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x75] %asi,	%l4
loop_952:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o0,	%l3
	addc	%o6,	0x0E71,	%i0
	set	0x08, %i7
	ldsba	[%l7 + %i7] 0x18,	%i1
	tsubcctv	%o7,	0x056C,	%l0
	add	%g6,	0x0223,	%g1
	fmovsge	%xcc,	%f15,	%f14
	nop
	setx	0x0076205B,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	edge16l	%g7,	%i2,	%i5
	mulscc	%i6,	0x0DAE,	%i4
	set	0x7C, %o3
	lduha	[%l7 + %o3] 0x0c,	%o3
	fxnors	%f28,	%f27,	%f14
	movneg	%icc,	%g2,	%l2
	movrgz	%g3,	0x2DB,	%l1
	movpos	%xcc,	%o5,	%o1
	brnz	%i3,	loop_953
	tle	%xcc,	0x1
	fbu	%fcc3,	loop_954
	fmovrdlz	%i7,	%f10,	%f28
loop_953:
	xorcc	%g5,	%g4,	%l6
	fpadd16	%f24,	%f26,	%f18
loop_954:
	srax	%o4,	0x13,	%o2
	sdivcc	%l4,	0x0C75,	%l5
	ldsh	[%l7 + 0x60],	%o0
	edge32l	%l3,	%i0,	%o6
	orncc	%o7,	0x0492,	%i1
	fmul8x16al	%f18,	%f4,	%f30
	srlx	%l0,	0x00,	%g6
	movrgez	%g1,	%g7,	%i2
	array16	%i6,	%i4,	%i5
	tgu	%icc,	0x2
	te	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%g2,	%f28,	%f30
	fbul	%fcc1,	loop_955
	srlx	%o3,	%g3,	%l1
	bne,a	%xcc,	loop_956
	edge8	%o5,	%l2,	%o1
loop_955:
	nop
	setx	0x09E08D4A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xF3B2E3D6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f29,	%f16
	tsubcctv	%i7,	0x07FD,	%i3
loop_956:
	movgu	%xcc,	%g4,	%g5
	smul	%l6,	0x0A0E,	%o2
	movn	%icc,	%l4,	%l5
	edge8n	%o4,	%l3,	%i0
	set	0x10, %i2
	sta	%f15,	[%l7 + %i2] 0x15
	fmovdn	%xcc,	%f24,	%f2
	ldd	[%l7 + 0x38],	%o0
	tvc	%xcc,	0x7
	andn	%o7,	%i1,	%l0
	bge,a,pn	%icc,	loop_957
	sdivcc	%o6,	0x19C7,	%g6
	nop
	setx	loop_958,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbge,a	%fcc1,	loop_959
loop_957:
	andn	%g1,	0x1B14,	%g7
	tvc	%xcc,	0x1
loop_958:
	nop
	setx	loop_960,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_959:
	ldsh	[%l7 + 0x7C],	%i2
	add	%i4,	%i6,	%i5
	taddcctv	%o3,	%g2,	%l1
loop_960:
	ldd	[%l7 + 0x78],	%o4
	brlz	%g3,	loop_961
	fpmerge	%f29,	%f22,	%f14
	ldsb	[%l7 + 0x79],	%o1
	tn	%icc,	0x2
loop_961:
	tsubcc	%i7,	0x12B2,	%l2
	wr	%g0,	0x23,	%asi
	stba	%g4,	[%l7 + 0x77] %asi
	membar	#Sync
	fornot1s	%f13,	%f17,	%f31
	nop
	fitod	%f8,	%f24
	fdtos	%f24,	%f29
	srlx	%g5,	0x16,	%i3
	taddcctv	%o2,	0x0332,	%l4
	sllx	%l6,	0x14,	%l5
	movvc	%icc,	%l3,	%i0
	edge16l	%o4,	%o7,	%o0
	set	0x6B, %i6
	ldsba	[%l7 + %i6] 0x14,	%i1
	nop
	fitos	%f6,	%f9
	fstox	%f9,	%f16
	nop
	setx	0xCFA7AE9F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f11
	move	%xcc,	%o6,	%g6
	edge16n	%l0,	%g1,	%g7
	fbo	%fcc1,	loop_962
	smul	%i2,	0x1382,	%i6
	nop
	setx loop_963, %l0, %l1
	jmpl %l1, %i4
	brlez,a	%o3,	loop_964
loop_962:
	movl	%icc,	%g2,	%l1
	bgu	%icc,	loop_965
loop_963:
	popc	%o5,	%g3
loop_964:
	movpos	%xcc,	%o1,	%i7
	bgu	%icc,	loop_966
loop_965:
	fmovspos	%icc,	%f18,	%f25
	tge	%icc,	0x1
	umulcc	%i5,	%l2,	%g5
loop_966:
	sllx	%i3,	%g4,	%o2
	fbg,a	%fcc3,	loop_967
	fmovsvc	%xcc,	%f9,	%f17
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
loop_967:
	edge16n	%l5,	%l4,	%l3
	udivcc	%o4,	0x0B7E,	%i0
	tge	%icc,	0x7
	movcs	%icc,	%o7,	%i1
	fornot1s	%f20,	%f30,	%f9
	xorcc	%o6,	%g6,	%o0
	movl	%xcc,	%l0,	%g1
	movrlz	%g7,	%i6,	%i4
	and	%i2,	%o3,	%l1
	be	%xcc,	loop_968
	movn	%xcc,	%g2,	%o5
	popc	0x02A0,	%g3
	tvs	%xcc,	0x2
loop_968:
	fnegs	%f12,	%f24
	array8	%o1,	%i7,	%i5
	fmovdvc	%icc,	%f2,	%f31
	tg	%xcc,	0x3
	tsubcctv	%l2,	%i3,	%g5
	movle	%xcc,	%o2,	%g4
	tl	%icc,	0x0
	movrgez	%l5,	0x375,	%l4
	tpos	%icc,	0x4
	edge32l	%l3,	%o4,	%i0
	taddcc	%o7,	%i1,	%o6
	tsubcc	%l6,	%g6,	%o0
	popc	0x1384,	%l0
	movcs	%xcc,	%g1,	%i6
	movpos	%icc,	%g7,	%i2
	ta	%xcc,	0x7
	fcmpne32	%f26,	%f2,	%o3
	nop
	fitos	%f14,	%f9
	fstox	%f9,	%f10
	fxtos	%f10,	%f18
	bneg	%icc,	loop_969
	fornot1s	%f1,	%f5,	%f28
	brgez,a	%l1,	loop_970
	fpsub32s	%f22,	%f19,	%f2
loop_969:
	tpos	%icc,	0x4
	movge	%xcc,	%i4,	%g2
loop_970:
	movpos	%icc,	%o5,	%o1
	fbul,a	%fcc1,	loop_971
	tcc	%xcc,	0x4
	tgu	%xcc,	0x7
	tgu	%xcc,	0x3
loop_971:
	bvc,pt	%icc,	loop_972
	xnorcc	%i7,	%i5,	%l2
	wr	%g0,	0x80,	%asi
	stwa	%i3,	[%l7 + 0x44] %asi
loop_972:
	tvs	%xcc,	0x1
	fnands	%f13,	%f30,	%f27
	ld	[%l7 + 0x5C],	%f1
	fmovde	%icc,	%f4,	%f7
	edge32	%g3,	%o2,	%g5
	tpos	%xcc,	0x3
	bcc,pn	%icc,	loop_973
	popc	%l5,	%g4
	membar	0x4E
	fcmpgt16	%f14,	%f18,	%l3
loop_973:
	alignaddrl	%o4,	%i0,	%l4
	movcc	%xcc,	%o7,	%o6
	xnor	%i1,	%g6,	%l6
	movcc	%icc,	%o0,	%l0
	edge32	%i6,	%g7,	%i2
	tg	%icc,	0x6
	xnor	%g1,	%l1,	%i4
	set	0x77, %l0
	ldstuba	[%l7 + %l0] 0x19,	%g2
	movne	%icc,	%o3,	%o1
	nop
	setx	0xD1E2730C6B79842D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x1850B7E4AEC5BA28,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f0,	%f22
	movcc	%xcc,	%o5,	%i5
	fsrc1s	%f1,	%f5
	fmovsgu	%icc,	%f2,	%f5
	array8	%i7,	%l2,	%i3
	fcmple16	%f14,	%f10,	%o2
	tvs	%xcc,	0x2
	popc	%g5,	%g3
	smul	%g4,	0x1116,	%l5
	movre	%o4,	0x25B,	%i0
	tn	%icc,	0x6
	fpsub32	%f20,	%f8,	%f0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x57] %asi,	%l3
	fmovde	%xcc,	%f19,	%f12
	brgez	%o7,	loop_974
	fmovdpos	%xcc,	%f4,	%f7
	tn	%icc,	0x2
	nop
	setx	0xF06ADBD3,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
loop_974:
	fmovdgu	%xcc,	%f0,	%f23
	edge32n	%l4,	%o6,	%g6
	fnegs	%f21,	%f31
	wr	%g0,	0x0c,	%asi
	stwa	%l6,	[%l7 + 0x74] %asi
	bn,a	%xcc,	loop_975
	brz,a	%o0,	loop_976
	brlez	%l0,	loop_977
	fble	%fcc3,	loop_978
loop_975:
	bgu,a	loop_979
loop_976:
	movrlz	%i6,	%i1,	%i2
loop_977:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f12,	[%l7 + 0x6C] %asi
loop_978:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x50] %asi,	%g1
loop_979:
	tvc	%icc,	0x1
	tleu	%xcc,	0x7
	fandnot1s	%f0,	%f29,	%f1
	umulcc	%g7,	0x08D6,	%i4
	edge32n	%g2,	%o3,	%o1
	movn	%icc,	%l1,	%i5
	movg	%icc,	%o5,	%i7
	alignaddr	%l2,	%i3,	%o2
	taddcctv	%g5,	0x1BC8,	%g3
	smul	%l5,	%o4,	%i0
	tleu	%icc,	0x7
	tcc	%xcc,	0x4
	nop
	fitos	%f13,	%f8
	fstox	%f8,	%f10
	array32	%l3,	%o7,	%l4
	sdivx	%g4,	0x1A47,	%g6
	bne,pn	%xcc,	loop_980
	edge32l	%o6,	%o0,	%l0
	edge8l	%l6,	%i1,	%i2
	movpos	%icc,	%g1,	%g7
loop_980:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x18] %asi,	%i6
	movrne	%i4,	0x346,	%o3
	bg,a,pt	%icc,	loop_981
	fmovsa	%icc,	%f13,	%f28
	tne	%icc,	0x5
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%o1
loop_981:
	brgez,a	%l1,	loop_982
	tgu	%xcc,	0x5
	fmuld8sux16	%f29,	%f16,	%f28
	movrlez	%i5,	0x0DC,	%o5
loop_982:
	edge32n	%g2,	%l2,	%i7
	orn	%i3,	0x147A,	%o2
	bgu,pt	%icc,	loop_983
	mulscc	%g3,	%g5,	%o4
	mulscc	%l5,	%l3,	%o7
	edge16	%l4,	%g4,	%g6
loop_983:
	move	%icc,	%o6,	%i0
	udivx	%o0,	0x1695,	%l0
	addc	%i1,	%l6,	%i2
	bvs,a	loop_984
	tsubcc	%g7,	0x0315,	%i6
	fpsub32	%f4,	%f30,	%f24
	be,a	loop_985
loop_984:
	tsubcctv	%i4,	0x0BA1,	%o3
	smul	%o1,	0x1488,	%l1
	te	%xcc,	0x1
loop_985:
	movle	%icc,	%g1,	%o5
	stx	%i5,	[%l7 + 0x18]
	and	%g2,	%i7,	%l2
	fpackfix	%f24,	%f19
	fbe	%fcc2,	loop_986
	movcc	%xcc,	%i3,	%o2
	nop
	fitos	%f12,	%f11
	fstox	%f11,	%f4
	fxtos	%f4,	%f14
	fones	%f16
loop_986:
	andcc	%g3,	%o4,	%l5
	fpmerge	%f3,	%f7,	%f24
	xor	%l3,	0x129C,	%o7
	tleu	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f2,	%f9,	%f26
	brz	%g5,	loop_987
	fmul8x16au	%f14,	%f20,	%f16
	brz,a	%l4,	loop_988
	sll	%g6,	0x10,	%g4
loop_987:
	andcc	%i0,	%o6,	%o0
	edge8l	%l0,	%l6,	%i2
loop_988:
	smul	%i1,	0x0F71,	%i6
	edge16n	%i4,	%o3,	%g7
	array8	%l1,	%g1,	%o1
	fbne	%fcc1,	loop_989
	or	%i5,	%g2,	%i7
	add	%l2,	%i3,	%o2
	subccc	%o5,	0x0069,	%o4
loop_989:
	pdist	%f10,	%f14,	%f4
	alignaddr	%g3,	%l5,	%l3
	movrgz	%g5,	0x02A,	%o7
	tle	%icc,	0x6
	fcmple16	%f24,	%f6,	%g6
	or	%l4,	%i0,	%o6
	mulscc	%g4,	0x089D,	%o0
	membar	0x3C
	tvs	%xcc,	0x1
	ld	[%l7 + 0x54],	%f16
	edge32n	%l0,	%l6,	%i1
	xnor	%i2,	0x0513,	%i6
	fsrc1	%f18,	%f8
	ldstub	[%l7 + 0x40],	%o3
	movrgz	%g7,	0x0AC,	%l1
	movre	%g1,	%o1,	%i4
	movgu	%xcc,	%g2,	%i7
	tne	%icc,	0x3
	edge16l	%i5,	%l2,	%o2
	orcc	%o5,	%i3,	%o4
	fand	%f2,	%f6,	%f28
	srax	%l5,	0x05,	%g3
	srl	%g5,	%l3,	%o7
	orncc	%g6,	%i0,	%l4
	fmovsg	%icc,	%f3,	%f29
	bvc,a,pn	%xcc,	loop_990
	movne	%xcc,	%g4,	%o6
	fabss	%f31,	%f10
	tneg	%icc,	0x7
loop_990:
	udivx	%o0,	0x0CD0,	%l6
	alignaddrl	%i1,	%i2,	%i6
	fmovde	%xcc,	%f1,	%f6
	fnands	%f18,	%f17,	%f3
	edge8	%l0,	%o3,	%l1
	array16	%g7,	%o1,	%g1
	fmuld8sux16	%f20,	%f26,	%f0
	movrgz	%i4,	0x0AF,	%g2
	movneg	%icc,	%i5,	%i7
	tleu	%xcc,	0x1
	edge8	%o2,	%l2,	%i3
	array8	%o5,	%o4,	%l5
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%g2
	stbar
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x70] %asi,	%g5
	fxnors	%f8,	%f26,	%f8
	fbule	%fcc0,	loop_991
	fpadd32	%f26,	%f22,	%f2
	prefetch	[%l7 + 0x28],	 0x1
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x58] %asi,	%o7
loop_991:
	tle	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	sta	%f19,	[%l7 + 0x48] %asi
	move	%icc,	%g6,	%l3
	andcc	%i0,	0x112F,	%g4
	movg	%xcc,	%l4,	%o0
	edge16	%l6,	%i1,	%i2
	fble,a	%fcc3,	loop_992
	bn,a,pt	%xcc,	loop_993
	popc	0x045A,	%o6
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x27] %asi,	%i6
loop_992:
	tneg	%icc,	0x2
loop_993:
	sllx	%o3,	0x19,	%l1
	movneg	%xcc,	%g7,	%o1
	tle	%xcc,	0x3
	fmovsneg	%xcc,	%f21,	%f2
	smul	%l0,	%i4,	%g1
	movl	%xcc,	%g2,	%i5
	movne	%xcc,	%i7,	%o2
	orcc	%l2,	%i3,	%o4
	movge	%icc,	%l5,	%g3
	fbo	%fcc0,	loop_994
	tgu	%xcc,	0x6
	subcc	%o5,	0x189F,	%o7
	fcmpeq16	%f20,	%f6,	%g5
loop_994:
	edge32	%l3,	%i0,	%g4
	brgez,a	%g6,	loop_995
	alignaddrl	%l4,	%l6,	%o0
	taddcctv	%i2,	%o6,	%i1
	movgu	%xcc,	%o3,	%i6
loop_995:
	movne	%icc,	%l1,	%g7
	fpadd16s	%f27,	%f8,	%f30
	subccc	%o1,	%l0,	%i4
	ldd	[%l7 + 0x70],	%g2
	tg	%icc,	0x7
	smulcc	%i5,	0x0136,	%i7
	membar	0x73
	movle	%xcc,	%g1,	%o2
	andn	%l2,	0x1427,	%o4
	andcc	%i3,	%g3,	%o5
	nop
	setx	loop_996,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%o7,	%g5,	%l5
	ble,a	%icc,	loop_997
	fblg,a	%fcc0,	loop_998
loop_996:
	membar	0x5D
	edge32	%l3,	%i0,	%g4
loop_997:
	mulx	%g6,	%l4,	%l6
loop_998:
	andn	%i2,	%o6,	%o0
	addccc	%o3,	%i6,	%i1
	tl	%xcc,	0x2
	edge16ln	%l1,	%g7,	%l0
	udivcc	%i4,	0x1523,	%o1
	fbue,a	%fcc1,	loop_999
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%g2,	%i7
	tpos	%xcc,	0x4
loop_999:
	nop
	setx	loop_1000,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpmerge	%f28,	%f28,	%f28
	mulx	%g1,	0x1A84,	%i5
	tg	%icc,	0x6
loop_1000:
	tgu	%xcc,	0x0
	fbug	%fcc2,	loop_1001
	taddcctv	%l2,	%o2,	%i3
	edge8ln	%g3,	%o5,	%o7
	tsubcc	%o4,	0x1A10,	%l5
loop_1001:
	nop
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x89,	%f0
	fbug	%fcc2,	loop_1002
	fone	%f16
	srlx	%g5,	%i0,	%l3
	fcmpgt16	%f24,	%f24,	%g4
loop_1002:
	srax	%g6,	0x10,	%l4
	fmovsne	%icc,	%f11,	%f10
	bg,a	%xcc,	loop_1003
	tsubcctv	%l6,	%o6,	%i2
	edge32ln	%o0,	%i6,	%i1
	bne,pt	%xcc,	loop_1004
loop_1003:
	alignaddr	%l1,	%o3,	%g7
	or	%l0,	%i4,	%o1
	movgu	%xcc,	%g2,	%g1
loop_1004:
	tvc	%xcc,	0x4
	udiv	%i5,	0x0DBA,	%l2
	fmovrdne	%i7,	%f14,	%f18
	set	0x36, %g3
	lduha	[%l7 + %g3] 0x81,	%i3
	ldsh	[%l7 + 0x36],	%g3
	fabss	%f16,	%f24
	smulcc	%o5,	0x04B5,	%o7
	bne,a	%xcc,	loop_1005
	nop
	setx	loop_1006,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fabsd	%f8,	%f20
	movvc	%icc,	%o4,	%l5
loop_1005:
	mulscc	%o2,	%g5,	%i0
loop_1006:
	fbe,a	%fcc1,	loop_1007
	bgu,a	loop_1008
	andcc	%g4,	0x1C39,	%g6
	edge32ln	%l3,	%l6,	%o6
loop_1007:
	udivx	%i2,	0x1730,	%o0
loop_1008:
	fbu	%fcc2,	loop_1009
	brgez,a	%l4,	loop_1010
	nop
	fitos	%f29,	%f21
	sllx	%i1,	0x10,	%i6
loop_1009:
	fmovdl	%xcc,	%f15,	%f31
loop_1010:
	stb	%o3,	[%l7 + 0x14]
	edge32	%g7,	%l0,	%i4
	xorcc	%o1,	0x07E2,	%g2
	edge8ln	%l1,	%g1,	%i5
	xnor	%l2,	0x16BB,	%i3
	tvc	%xcc,	0x4
	movrgez	%i7,	%g3,	%o5
	ble	%xcc,	loop_1011
	fblg	%fcc3,	loop_1012
	fxor	%f20,	%f12,	%f12
	movvc	%icc,	%o7,	%l5
loop_1011:
	nop
	set	0x5E, %o1
	lduh	[%l7 + %o1],	%o2
loop_1012:
	fbn	%fcc1,	loop_1013
	nop
	setx	0xDC4639697076FA7C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	movle	%xcc,	%g5,	%i0
	fble,a	%fcc2,	loop_1014
loop_1013:
	fnot2	%f28,	%f28
	prefetch	[%l7 + 0x28],	 0x0
	movleu	%icc,	%o4,	%g6
loop_1014:
	bvs,a,pt	%xcc,	loop_1015
	sllx	%l3,	0x1A,	%g4
	movrlez	%l6,	0x2F4,	%i2
	fzero	%f4
loop_1015:
	tgu	%xcc,	0x6
	fbl	%fcc3,	loop_1016
	udivcc	%o6,	0x0F07,	%o0
	swap	[%l7 + 0x24],	%i1
	sll	%l4,	0x18,	%o3
loop_1016:
	ta	%xcc,	0x6
	sir	0x0222
	fxors	%f9,	%f9,	%f8
	fbe,a	%fcc0,	loop_1017
	fbule,a	%fcc2,	loop_1018
	fmovdcc	%icc,	%f16,	%f30
	udivx	%i6,	0x12B4,	%g7
loop_1017:
	mova	%icc,	%l0,	%i4
loop_1018:
	movcc	%xcc,	%o1,	%l1
	fmovsge	%icc,	%f22,	%f0
	bcc,pt	%xcc,	loop_1019
	edge32	%g2,	%i5,	%g1
	movg	%icc,	%i3,	%l2
	fmovsvc	%icc,	%f7,	%f10
loop_1019:
	tsubcc	%g3,	0x0A62,	%o5
	set	0x1C, %l5
	ldswa	[%l7 + %l5] 0x88,	%i7
	fbul	%fcc1,	loop_1020
	movre	%l5,	%o7,	%g5
	bn	loop_1021
	sll	%o2,	0x04,	%o4
loop_1020:
	be,a	%xcc,	loop_1022
	movrlz	%g6,	0x27F,	%i0
loop_1021:
	fbo	%fcc2,	loop_1023
	addccc	%g4,	0x10BE,	%l3
loop_1022:
	udivcc	%i2,	0x04CA,	%o6
	udivcc	%o0,	0x166B,	%l6
loop_1023:
	nop
	fitod	%f4,	%f18
	fdtoi	%f18,	%f30
	set	0x58, %i0
	lda	[%l7 + %i0] 0x18,	%f10
	prefetch	[%l7 + 0x58],	 0x0
	fornot2s	%f19,	%f31,	%f4
	nop
	setx	0x6150670D4C353D3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x63A74F5DF5B75EE8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f24,	%f6
	edge32ln	%l4,	%o3,	%i1
	xnorcc	%g7,	%i6,	%i4
	movleu	%icc,	%o1,	%l0
	umulcc	%l1,	%i5,	%g1
	fcmpgt32	%f24,	%f0,	%i3
	set	0x5C, %o0
	lduwa	[%l7 + %o0] 0x15,	%g2
	movgu	%icc,	%g3,	%o5
	tgu	%xcc,	0x5
	andcc	%i7,	%l2,	%o7
	ble	%icc,	loop_1024
	sdivx	%l5,	0x00AF,	%o2
	udivx	%g5,	0x1F8C,	%g6
	fmovrsne	%o4,	%f30,	%f10
loop_1024:
	nop
	wr	%g0,	0x2f,	%asi
	stba	%i0,	[%l7 + 0x0D] %asi
	membar	#Sync
	udivcc	%l3,	0x134D,	%g4
	xnor	%i2,	0x1F9F,	%o0
	nop
	setx	0xE0072683,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f8
	taddcctv	%o6,	%l4,	%l6
	edge8	%o3,	%i1,	%g7
	fbug	%fcc2,	loop_1025
	edge8ln	%i6,	%i4,	%o1
	sth	%l1,	[%l7 + 0x0C]
	popc	%l0,	%i5
loop_1025:
	bpos,a,pt	%xcc,	loop_1026
	udivx	%g1,	0x0B96,	%i3
	umul	%g3,	%g2,	%i7
	edge8n	%l2,	%o5,	%l5
loop_1026:
	fones	%f19
	nop
	setx	0x8F0E1B63104BB1A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tgu	%icc,	0x1
	srl	%o2,	0x0A,	%o7
	udivx	%g5,	0x0D90,	%o4
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fblg	%fcc2,	loop_1027
	movn	%icc,	%i0,	%l3
	fmovsvc	%icc,	%f31,	%f4
	andn	%g4,	%i2,	%g6
loop_1027:
	move	%icc,	%o6,	%o0
	tle	%icc,	0x6
	edge16ln	%l6,	%l4,	%o3
	fmovscs	%xcc,	%f24,	%f27
	fmovsgu	%xcc,	%f12,	%f22
	fandnot1	%f4,	%f12,	%f26
	fmovdcs	%xcc,	%f18,	%f9
	fsrc2s	%f4,	%f22
	subcc	%i1,	0x0204,	%i6
	tgu	%icc,	0x6
	fmovdl	%xcc,	%f16,	%f18
	brlez,a	%i4,	loop_1028
	tsubcctv	%g7,	%l1,	%l0
	set	0x38, %l4
	lda	[%l7 + %l4] 0x88,	%f15
loop_1028:
	flush	%l7 + 0x20
	addccc	%o1,	%g1,	%i3
	fbge,a	%fcc3,	loop_1029
	fcmpeq32	%f6,	%f10,	%i5
	fcmple32	%f16,	%f20,	%g2
	movrlz	%i7,	0x22D,	%g3
loop_1029:
	tg	%xcc,	0x3
	smulcc	%l2,	0x02DE,	%l5
	edge32	%o2,	%o7,	%o5
	set	0x38, %l2
	stxa	%g5,	[%l7 + %l2] 0xeb
	membar	#Sync
	orcc	%i0,	0x0C06,	%o4
	nop
	setx loop_1030, %l0, %l1
	jmpl %l1, %g4
	movrne	%i2,	0x0F0,	%l3
	or	%o6,	0x1729,	%o0
	nop
	setx	0x0A93C9A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xC635B22D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f20,	%f22
loop_1030:
	edge32	%l6,	%l4,	%o3
	set	0x54, %i5
	lduba	[%l7 + %i5] 0x15,	%g6
	nop
	fitos	%f2,	%f15
	fstoi	%f15,	%f8
	edge16l	%i6,	%i1,	%g7
	tl	%icc,	0x4
	fbo	%fcc0,	loop_1031
	xnor	%l1,	0x0E25,	%i4
	membar	0x59
	tcs	%icc,	0x4
loop_1031:
	membar	0x5F
	fba	%fcc1,	loop_1032
	bpos,a	%icc,	loop_1033
	fnand	%f2,	%f20,	%f20
	ldsw	[%l7 + 0x38],	%o1
loop_1032:
	fbl	%fcc1,	loop_1034
loop_1033:
	flush	%l7 + 0x60
	fmul8sux16	%f8,	%f30,	%f0
	lduh	[%l7 + 0x52],	%g1
loop_1034:
	srl	%i3,	0x19,	%l0
	edge16ln	%g2,	%i7,	%i5
	orn	%g3,	%l5,	%o2
	move	%xcc,	%o7,	%o5
	ta	%xcc,	0x0
	sdivx	%l2,	0x1D18,	%g5
	fpsub16s	%f10,	%f12,	%f23
	fpsub32s	%f3,	%f0,	%f21
	popc	0x122C,	%i0
	fnot1	%f22,	%f4
	movpos	%xcc,	%o4,	%i2
	fors	%f0,	%f24,	%f8
	subcc	%g4,	0x0298,	%o6
	wr	%g0,	0xe2,	%asi
	stba	%l3,	[%l7 + 0x08] %asi
	membar	#Sync
	udivcc	%l6,	0x09A7,	%l4
	ld	[%l7 + 0x20],	%f26
	fmuld8ulx16	%f9,	%f4,	%f26
	bcc,a,pn	%xcc,	loop_1035
	udiv	%o0,	0x0A16,	%g6
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x41] %asi,	%i6
loop_1035:
	fba,a	%fcc0,	loop_1036
	fmovdg	%xcc,	%f10,	%f6
	pdist	%f18,	%f24,	%f26
	xnorcc	%o3,	%i1,	%g7
loop_1036:
	movle	%xcc,	%l1,	%o1
	tcc	%icc,	0x4
	stb	%g1,	[%l7 + 0x7F]
	fble	%fcc3,	loop_1037
	bl,pt	%xcc,	loop_1038
	array16	%i3,	%l0,	%i4
	fba	%fcc3,	loop_1039
loop_1037:
	bgu	loop_1040
loop_1038:
	tne	%xcc,	0x5
	sethi	0x0BE0,	%g2
loop_1039:
	xnor	%i7,	0x0F5F,	%g3
loop_1040:
	fmovrsne	%i5,	%f26,	%f19
	sdiv	%o2,	0x1CE5,	%o7
	fmovsneg	%xcc,	%f23,	%f30
	fbul,a	%fcc3,	loop_1041
	fbne	%fcc2,	loop_1042
	nop
	fitos	%f6,	%f16
	andn	%l5,	0x0DC3,	%l2
loop_1041:
	movg	%icc,	%o5,	%g5
loop_1042:
	nop
	setx	0x32626670,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xDD284937,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f29,	%f4
	edge32ln	%o4,	%i2,	%g4
	andcc	%o6,	0x0747,	%l3
	te	%icc,	0x0
	nop
	setx loop_1043, %l0, %l1
	jmpl %l1, %l6
	sra	%i0,	0x16,	%o0
	wr	%g0,	0x2b,	%asi
	stba	%g6,	[%l7 + 0x0D] %asi
	membar	#Sync
loop_1043:
	fxors	%f13,	%f15,	%f27
	srax	%l4,	%i6,	%i1
	ldd	[%l7 + 0x60],	%f8
	edge16l	%o3,	%l1,	%o1
	movn	%xcc,	%g1,	%i3
	movne	%xcc,	%g7,	%l0
	array32	%g2,	%i4,	%i7
	sub	%g3,	0x125B,	%i5
	movneg	%icc,	%o7,	%l5
	bcc,a,pn	%icc,	loop_1044
	sth	%l2,	[%l7 + 0x4E]
	mulx	%o2,	%o5,	%g5
	alignaddrl	%o4,	%g4,	%o6
loop_1044:
	fxnor	%f24,	%f6,	%f26
	movrlez	%l3,	0x37E,	%i2
	edge32n	%l6,	%i0,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l4,	%g6,	%i6
	nop
	setx	0xCC66CDC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x76D0B55F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f10,	%f8
	tn	%icc,	0x2
	subcc	%o3,	%i1,	%l1
	subc	%g1,	%o1,	%g7
	udiv	%l0,	0x1A0D,	%i3
	popc	0x1CBD,	%g2
	sir	0x115D
	fmovdle	%icc,	%f28,	%f27
	addc	%i7,	%i4,	%i5
	fmovsle	%xcc,	%f7,	%f24
	membar	0x09
	movgu	%xcc,	%g3,	%l5
	edge16n	%l2,	%o7,	%o2
	xnor	%g5,	0x15CC,	%o5
	fmovrdgz	%g4,	%f8,	%f4
	fornot2s	%f15,	%f1,	%f11
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x18,	%o6
	movgu	%icc,	%o4,	%i2
	ldsb	[%l7 + 0x75],	%l3
	orcc	%l6,	0x13A2,	%o0
	mova	%xcc,	%l4,	%g6
	tvs	%xcc,	0x4
	udivcc	%i6,	0x17F0,	%i0
	mova	%icc,	%o3,	%i1
	addc	%g1,	0x1B97,	%o1
	movre	%l1,	%l0,	%i3
	fmovscs	%xcc,	%f3,	%f28
	bpos	%icc,	loop_1045
	ldd	[%l7 + 0x30],	%f10
	fbue,a	%fcc1,	loop_1046
	array8	%g7,	%i7,	%g2
loop_1045:
	bcs,pn	%xcc,	loop_1047
	alignaddr	%i4,	%g3,	%l5
loop_1046:
	xorcc	%l2,	0x1383,	%i5
	array8	%o7,	%g5,	%o5
loop_1047:
	fnegs	%f23,	%f11
	brlez	%o2,	loop_1048
	sub	%g4,	0x1065,	%o6
	swap	[%l7 + 0x08],	%o4
	set	0x5E, %g4
	ldsba	[%l7 + %g4] 0x80,	%i2
loop_1048:
	fandnot1s	%f4,	%f16,	%f28
	bleu,a,pn	%icc,	loop_1049
	stw	%l3,	[%l7 + 0x40]
	smul	%l6,	0x0840,	%o0
	addccc	%l4,	0x01F7,	%g6
loop_1049:
	sir	0x1D76
	tcs	%xcc,	0x6
	ldd	[%l7 + 0x68],	%i0
	fnors	%f12,	%f12,	%f11
	edge16n	%o3,	%i1,	%g1
	fandnot1s	%f7,	%f21,	%f4
	fcmpeq32	%f22,	%f8,	%i6
	ld	[%l7 + 0x14],	%f8
	sir	0x0980
	movne	%icc,	%o1,	%l0
	fcmpne16	%f8,	%f12,	%l1
	fcmpeq16	%f18,	%f24,	%g7
	tl	%icc,	0x7
	bn,pn	%xcc,	loop_1050
	fbn,a	%fcc0,	loop_1051
	nop
	fitod	%f8,	%f0
	movle	%icc,	%i3,	%g2
loop_1050:
	tl	%icc,	0x2
loop_1051:
	fcmple16	%f20,	%f12,	%i7
	edge32ln	%g3,	%i4,	%l2
	xor	%l5,	%i5,	%g5
	tle	%xcc,	0x4
	andn	%o5,	%o2,	%o7
	edge32l	%g4,	%o6,	%o4
	addc	%l3,	0x15B7,	%l6
	andcc	%o0,	0x1950,	%i2
	bpos	loop_1052
	edge32l	%l4,	%i0,	%g6
	wr	%g0,	0xe3,	%asi
	stwa	%o3,	[%l7 + 0x50] %asi
	membar	#Sync
loop_1052:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a	loop_1053
	movvc	%xcc,	%i1,	%g1
	tge	%xcc,	0x3
	sra	%o1,	%l0,	%i6
loop_1053:
	fmovde	%xcc,	%f30,	%f27
	bshuffle	%f10,	%f6,	%f18
	addccc	%l1,	%i3,	%g2
	brlz,a	%i7,	loop_1054
	movl	%xcc,	%g7,	%i4
	lduh	[%l7 + 0x08],	%g3
	fbg,a	%fcc1,	loop_1055
loop_1054:
	bvs,a	%icc,	loop_1056
	fmovse	%icc,	%f1,	%f14
	subccc	%l5,	%i5,	%g5
loop_1055:
	nop
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x28] %asi,	%f3
loop_1056:
	tleu	%icc,	0x7
	ldsh	[%l7 + 0x38],	%l2
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f22
	fxtod	%f22,	%f14
	lduw	[%l7 + 0x10],	%o2
	movcs	%icc,	%o7,	%o5
	nop
	setx	0x3E929CB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x05E73E1A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f30,	%f26
	bpos,pn	%xcc,	loop_1057
	movrgz	%o6,	0x364,	%g4
	tl	%icc,	0x6
	lduh	[%l7 + 0x12],	%o4
loop_1057:
	std	%f8,	[%l7 + 0x20]
	movvs	%xcc,	%l3,	%o0
	fmuld8ulx16	%f30,	%f29,	%f28
	tgu	%icc,	0x3
	brlz	%i2,	loop_1058
	fmovse	%icc,	%f23,	%f6
	edge32l	%l6,	%l4,	%i0
	nop
	setx	0x089D9ECE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x24760053,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f14,	%f2
loop_1058:
	fmovdneg	%xcc,	%f16,	%f27
	nop
	setx	loop_1059,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx loop_1060, %l0, %l1
	jmpl %l1, %g6
	nop
	setx	0xE16696F647811C4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x8498D254D3C0938C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f26,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1059:
	fpsub16s	%f31,	%f4,	%f12
loop_1060:
	nop
	setx	loop_1061,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%o3,	%i1,	%o1
	move	%icc,	%g1,	%l0
	bn,pt	%xcc,	loop_1062
loop_1061:
	fcmpne32	%f22,	%f14,	%l1
	nop
	fitod	%f4,	%f20
	fdtox	%f20,	%f2
	alignaddr	%i3,	%i6,	%g2
loop_1062:
	fbo	%fcc1,	loop_1063
	sir	0x041B
	edge8ln	%i7,	%g7,	%g3
	smul	%i4,	0x00BC,	%l5
loop_1063:
	fpadd16s	%f5,	%f23,	%f19
	ta	%xcc,	0x2
	ldd	[%l7 + 0x50],	%g4
	andcc	%l2,	%o2,	%o7
	tsubcctv	%o5,	0x0C1A,	%o6
	srl	%i5,	0x08,	%o4
	nop
	setx	0xF074F7FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	alignaddr	%l3,	%o0,	%g4
	fmovsge	%icc,	%f22,	%f11
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x52] %asi,	%i2
	movre	%l4,	0x1E5,	%l6
	bgu,a	%xcc,	loop_1064
	umul	%g6,	0x000B,	%i0
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f22
	movneg	%xcc,	%i1,	%o3
loop_1064:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x14] %asi,	%g1
	addccc	%o1,	%l1,	%i3
	ta	%xcc,	0x2
	orcc	%l0,	%g2,	%i6
	udivx	%i7,	0x15D8,	%g3
	array16	%i4,	%l5,	%g5
	alignaddr	%l2,	%o2,	%o7
	array16	%g7,	%o6,	%o5
	movcc	%icc,	%i5,	%o4
	fbuge	%fcc1,	loop_1065
	umul	%l3,	0x1A11,	%o0
	set	0x74, %o4
	ldsha	[%l7 + %o4] 0x19,	%g4
loop_1065:
	nop
	set	0x4C, %o5
	lduha	[%l7 + %o5] 0x19,	%i2
	fbu,a	%fcc1,	loop_1066
	fmovdge	%icc,	%f30,	%f18
	fpsub32s	%f3,	%f18,	%f1
	tn	%xcc,	0x0
loop_1066:
	tg	%icc,	0x3
	nop
	setx	0x47F4725581CDEBEC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2DEE17ED062519A0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f26,	%f26
	edge16l	%l4,	%g6,	%i0
	srl	%i1,	%l6,	%g1
	bpos,a	loop_1067
	fmovsne	%icc,	%f22,	%f23
	fmovsneg	%xcc,	%f13,	%f1
	sdiv	%o3,	0x0874,	%o1
loop_1067:
	membar	0x28
	fors	%f4,	%f10,	%f21
	prefetch	[%l7 + 0x48],	 0x1
	andn	%l1,	0x1142,	%i3
	bne,a	%icc,	loop_1068
	movrlez	%g2,	%i6,	%i7
	move	%xcc,	%l0,	%i4
	tn	%icc,	0x7
loop_1068:
	mova	%xcc,	%l5,	%g5
	sdiv	%g3,	0x06C2,	%l2
	fmovscs	%icc,	%f4,	%f26
	movcc	%icc,	%o7,	%o2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o6
	ble	%icc,	loop_1069
	fmovdne	%xcc,	%f18,	%f2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x80,	%f0
loop_1069:
	xnor	%o5,	%g7,	%i5
	bvs,a,pn	%xcc,	loop_1070
	taddcc	%o4,	0x14A0,	%o0
	edge8ln	%l3,	%g4,	%l4
	fba	%fcc3,	loop_1071
loop_1070:
	fandnot1s	%f28,	%f2,	%f7
	tn	%icc,	0x7
	sir	0x092C
loop_1071:
	edge32	%g6,	%i0,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i2,	0x0E57,	%g1
	movcc	%xcc,	%o3,	%o1
	andcc	%l6,	0x0021,	%l1
	nop
	setx	0xCB2580CA505D3CB7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	brgez,a	%g2,	loop_1072
	ble	%icc,	loop_1073
	movrne	%i6,	0x3AA,	%i7
	subccc	%i3,	%l0,	%l5
loop_1072:
	nop
	set	0x44, %o7
	lduha	[%l7 + %o7] 0x89,	%i4
loop_1073:
	movneg	%xcc,	%g5,	%l2
	sll	%o7,	%g3,	%o6
	fmovrdne	%o5,	%f6,	%f0
	andncc	%g7,	%i5,	%o2
	fbo	%fcc2,	loop_1074
	mulscc	%o4,	0x141B,	%o0
	movcs	%icc,	%g4,	%l3
	srl	%g6,	0x1B,	%i0
loop_1074:
	movre	%l4,	0x039,	%i2
	tge	%icc,	0x1
	fmovsneg	%xcc,	%f7,	%f27
	fmovsgu	%xcc,	%f4,	%f13
	stb	%i1,	[%l7 + 0x08]
	ldub	[%l7 + 0x6C],	%g1
	set	0x0, %l6
	stxa	%o1,	[%g0 + %l6] 0x57
	andncc	%l6,	%o3,	%g2
	set	0x4C, %g1
	ldsha	[%l7 + %g1] 0x04,	%l1
	wr	%g0,	0x89,	%asi
	stba	%i7,	[%l7 + 0x2B] %asi
	movge	%icc,	%i6,	%i3
	movvs	%icc,	%l0,	%l5
	tsubcctv	%g5,	0x1055,	%i4
	nop
	setx	0x9064EE76,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	tg	%xcc,	0x5
	bcs,a	%xcc,	loop_1075
	movneg	%xcc,	%o7,	%l2
	fbuge,a	%fcc1,	loop_1076
	edge32l	%g3,	%o6,	%g7
loop_1075:
	edge32	%i5,	%o2,	%o5
	brgz	%o0,	loop_1077
loop_1076:
	edge16n	%g4,	%l3,	%g6
	mulscc	%o4,	%i0,	%i2
	fbg	%fcc3,	loop_1078
loop_1077:
	fmovsl	%icc,	%f9,	%f10
	std	%f4,	[%l7 + 0x58]
	andcc	%l4,	0x1EF7,	%g1
loop_1078:
	andn	%o1,	0x1BAE,	%l6
	sub	%i1,	0x16F1,	%o3
	movneg	%icc,	%l1,	%i7
	fbu	%fcc3,	loop_1079
	ldsb	[%l7 + 0x52],	%g2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x44] %asi,	%f31
loop_1079:
	fmovsg	%icc,	%f20,	%f18
	xnorcc	%i3,	0x1B8D,	%l0
	sll	%i6,	0x0F,	%l5
	set	0x20, %i3
	ldda	[%l7 + %i3] 0x2f,	%i4
	array8	%o7,	%g5,	%g3
	movg	%icc,	%o6,	%g7
	orn	%l2,	%i5,	%o5
	fmovsne	%icc,	%f11,	%f16
	fabsd	%f24,	%f2
	set	0x58, %o6
	stwa	%o2,	[%l7 + %o6] 0x0c
	array32	%g4,	%l3,	%g6
	andncc	%o4,	%i0,	%o0
	fcmpgt32	%f18,	%f8,	%i2
	xor	%l4,	0x1384,	%o1
	xnorcc	%g1,	0x06D2,	%i1
	fandnot2s	%f10,	%f27,	%f26
	andcc	%o3,	0x1D5E,	%l6
	movrne	%i7,	%g2,	%i3
	sdivcc	%l1,	0x172A,	%i6
	fsrc1s	%f7,	%f27
	edge32n	%l5,	%l0,	%i4
	tsubcctv	%g5,	%g3,	%o6
	wr	%g0,	0x0c,	%asi
	sta	%f10,	[%l7 + 0x40] %asi
	movvc	%icc,	%g7,	%o7
	movrgez	%i5,	0x2EF,	%l2
	nop
	fitod	%f8,	%f16
	fdtos	%f16,	%f21
	tvc	%icc,	0x0
	sir	0x1110
	tgu	%xcc,	0x6
	array8	%o2,	%g4,	%o5
	tleu	%icc,	0x2
	subcc	%l3,	0x17B2,	%g6
	movle	%xcc,	%o4,	%o0
	ta	%xcc,	0x6
	tvc	%xcc,	0x0
	fmovsn	%xcc,	%f16,	%f18
	umulcc	%i0,	0x1734,	%i2
	sra	%o1,	0x00,	%g1
	bleu,a	loop_1080
	ba,a	%xcc,	loop_1081
	lduh	[%l7 + 0x2E],	%l4
	fbul	%fcc3,	loop_1082
loop_1080:
	ba	%icc,	loop_1083
loop_1081:
	fmovde	%icc,	%f20,	%f21
	fzero	%f10
loop_1082:
	udiv	%o3,	0x12AD,	%l6
loop_1083:
	ldub	[%l7 + 0x6F],	%i7
	movgu	%icc,	%i1,	%g2
	edge8n	%l1,	%i6,	%i3
	fcmpgt16	%f4,	%f18,	%l5
	smulcc	%l0,	0x1828,	%g5
	fbe,a	%fcc2,	loop_1084
	tvs	%xcc,	0x0
	fmovdleu	%icc,	%f20,	%f6
	tneg	%xcc,	0x4
loop_1084:
	subccc	%i4,	0x0146,	%g3
	fcmpne16	%f20,	%f2,	%o6
	tg	%icc,	0x6
	movvc	%xcc,	%g7,	%i5
	fxors	%f3,	%f20,	%f0
	fmovrsgez	%l2,	%f1,	%f10
	fmovdcc	%icc,	%f28,	%f7
	fbue,a	%fcc3,	loop_1085
	tcs	%icc,	0x7
	tvc	%icc,	0x5
	tsubcc	%o7,	0x1884,	%o2
loop_1085:
	membar	0x6F
	edge32l	%g4,	%l3,	%g6
	srlx	%o5,	%o4,	%o0
	sll	%i0,	0x16,	%i2
	fbul	%fcc0,	loop_1086
	movrlz	%g1,	%l4,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	stwa	%o3,	[%l7 + 0x0C] %asi
loop_1086:
	movn	%icc,	%l6,	%i7
	set	0x48, %g2
	stha	%i1,	[%l7 + %g2] 0x81
	orncc	%l1,	%i6,	%i3
	fcmple32	%f12,	%f20,	%g2
	orncc	%l0,	0x0D0F,	%g5
	movvc	%xcc,	%i4,	%l5
	ldub	[%l7 + 0x4A],	%o6
	te	%icc,	0x1
	smulcc	%g3,	0x0DB7,	%i5
	fzeros	%f29
	fmovdvs	%xcc,	%f26,	%f14
	udivx	%l2,	0x0E30,	%o7
	edge16	%g7,	%g4,	%o2
	movvs	%xcc,	%g6,	%l3
	srlx	%o4,	0x0E,	%o0
	edge32ln	%i0,	%i2,	%o5
	movge	%xcc,	%g1,	%l4
	fnand	%f26,	%f12,	%f20
	movrgez	%o1,	%o3,	%l6
	orn	%i7,	%i1,	%l1
	fblg,a	%fcc1,	loop_1087
	edge16l	%i6,	%i3,	%l0
	addccc	%g5,	%g2,	%i4
	and	%o6,	0x13BC,	%g3
loop_1087:
	tge	%xcc,	0x2
	fbuge,a	%fcc3,	loop_1088
	mulx	%l5,	%i5,	%l2
	sdivx	%o7,	0x17CA,	%g7
	orcc	%o2,	0x0893,	%g4
loop_1088:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f22,	%f2
	tn	%xcc,	0x2
	sra	%l3,	0x09,	%g6
	fbuge	%fcc0,	loop_1089
	nop
	fitos	%f2,	%f15
	fstox	%f15,	%f22
	fxtos	%f22,	%f29
	tcs	%icc,	0x7
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x74] %asi,	%o4
loop_1089:
	nop
	set	0x48, %l3
	ldswa	[%l7 + %l3] 0x0c,	%i0
	bge	%icc,	loop_1090
	sra	%o0,	0x14,	%i2
	tgu	%xcc,	0x7
	mulscc	%g1,	%o5,	%o1
loop_1090:
	mova	%icc,	%o3,	%l4
	sdivx	%l6,	0x1276,	%i1
	movrgz	%l1,	%i6,	%i7
	tcs	%xcc,	0x1
	nop
	setx	loop_1091,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdleu	%xcc,	%f3,	%f7
	alignaddrl	%i3,	%l0,	%g2
	movne	%xcc,	%g5,	%i4
loop_1091:
	fmovdneg	%xcc,	%f29,	%f31
	sth	%o6,	[%l7 + 0x3E]
	fmovsneg	%xcc,	%f13,	%f2
	fmul8x16	%f1,	%f2,	%f6
	addcc	%g3,	%i5,	%l5
	udivcc	%l2,	0x1282,	%g7
	addc	%o7,	%o2,	%l3
	andn	%g4,	%g6,	%i0
	bn,pt	%icc,	loop_1092
	tsubcctv	%o0,	0x076D,	%i2
	sdivcc	%g1,	0x099C,	%o4
	brgz	%o5,	loop_1093
loop_1092:
	fxnor	%f12,	%f30,	%f4
	st	%f7,	[%l7 + 0x20]
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%o1
loop_1093:
	fandnot2	%f18,	%f6,	%f20
	tleu	%xcc,	0x1
	fmovrdne	%o3,	%f12,	%f12
	nop
	fitos	%f3,	%f12
	fstod	%f12,	%f2
	prefetch	[%l7 + 0x50],	 0x0
	movcs	%xcc,	%l6,	%i1
	sub	%l4,	%l1,	%i7
	fmovscs	%xcc,	%f20,	%f4
	addcc	%i3,	0x0C20,	%i6
	nop
	setx	0x8AF959D5A28FD4FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x6E738149CFE429AD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f24,	%f2
	sdivx	%l0,	0x1BC1,	%g2
	edge8ln	%g5,	%i4,	%o6
	movg	%xcc,	%g3,	%l5
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x7B] %asi,	%i5
	edge32ln	%l2,	%g7,	%o7
	fmovrslz	%l3,	%f13,	%f3
	fbn,a	%fcc0,	loop_1094
	movn	%icc,	%o2,	%g6
	brgez,a	%g4,	loop_1095
	orn	%o0,	0x0869,	%i0
loop_1094:
	fxors	%f6,	%f3,	%f8
	andcc	%g1,	0x1C38,	%o4
loop_1095:
	lduw	[%l7 + 0x60],	%o5
	tpos	%icc,	0x4
	set	0x22, %i1
	lduba	[%l7 + %i1] 0x15,	%o1
	fnot1s	%f2,	%f2
	nop
	setx	loop_1096,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%o3,	%l6,	%i1
	movrgz	%i2,	0x1BF,	%l4
	orncc	%i7,	0x08E5,	%i3
loop_1096:
	alignaddrl	%l1,	%i6,	%g2
	movrgez	%g5,	%l0,	%o6
	tneg	%icc,	0x1
	movrne	%g3,	0x1C7,	%l5
	movrlez	%i4,	%i5,	%g7
	sdiv	%o7,	0x0085,	%l2
	addc	%l3,	%o2,	%g6
	nop
	setx	0x2076C12C,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	nop
	setx loop_1097, %l0, %l1
	jmpl %l1, %g4
	bcc,a	loop_1098
	fxor	%f20,	%f0,	%f4
	movcs	%xcc,	%o0,	%g1
loop_1097:
	bvs,a,pt	%xcc,	loop_1099
loop_1098:
	fbe	%fcc1,	loop_1100
	fmovdge	%icc,	%f9,	%f13
	movrgz	%o4,	0x118,	%i0
loop_1099:
	orncc	%o5,	%o1,	%o3
loop_1100:
	fbl,a	%fcc0,	loop_1101
	taddcctv	%i1,	0x1BF7,	%l6
	edge16l	%l4,	%i2,	%i7
	umulcc	%i3,	%i6,	%g2
loop_1101:
	fmovrse	%g5,	%f15,	%f14
	add	%l0,	0x0B33,	%l1
	fbule	%fcc2,	loop_1102
	edge16n	%o6,	%l5,	%i4
	xnor	%i5,	%g3,	%o7
	sdiv	%l2,	0x1CD3,	%l3
loop_1102:
	movgu	%xcc,	%o2,	%g6
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x11
	sir	0x08B3
	tpos	%icc,	0x1
	xnorcc	%g4,	0x1CD2,	%o0
	movgu	%icc,	%g7,	%o4
	set	0x20, %i7
	prefetcha	[%l7 + %i7] 0x10,	 0x0
	array8	%i0,	%o1,	%o5
	brlz	%o3,	loop_1103
	and	%l6,	%i1,	%l4
	sdivx	%i2,	0x1634,	%i7
	fnot2s	%f6,	%f2
loop_1103:
	nop
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x16,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz,a	%i6,	loop_1104
	popc	0x0EA9,	%g2
	membar	0x36
	movge	%icc,	%i3,	%g5
loop_1104:
	movg	%xcc,	%l1,	%o6
	xnorcc	%l5,	0x15F6,	%i4
	alignaddr	%l0,	%g3,	%o7
	fmovde	%icc,	%f5,	%f17
	fones	%f1
	tsubcc	%l2,	%i5,	%l3
	edge8n	%o2,	%g4,	%o0
	taddcctv	%g6,	0x0F22,	%g7
	nop
	setx	loop_1105,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%g1,	%i0,	%o1
	movrne	%o4,	%o3,	%l6
	brlz	%i1,	loop_1106
loop_1105:
	tg	%icc,	0x5
	nop
	fitod	%f12,	%f2
	fdtox	%f2,	%f0
	move	%xcc,	%l4,	%o5
loop_1106:
	tpos	%xcc,	0x7
	set	0x34, %o3
	sta	%f7,	[%l7 + %o3] 0x04
	movl	%xcc,	%i7,	%i2
	edge16l	%i6,	%g2,	%i3
	umulcc	%l1,	%g5,	%o6
	alignaddrl	%i4,	%l0,	%g3
	stb	%o7,	[%l7 + 0x35]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%l5,	0x1CA3,	%l2
	movl	%xcc,	%i5,	%o2
	bcc,a	%icc,	loop_1107
	fble	%fcc1,	loop_1108
	array16	%l3,	%g4,	%o0
	sethi	0x0EEF,	%g6
loop_1107:
	nop
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
loop_1108:
	edge32n	%g1,	%o1,	%i0
	wr	%g0,	0x04,	%asi
	stwa	%o3,	[%l7 + 0x6C] %asi
	tle	%icc,	0x2
	movrne	%o4,	%i1,	%l4
	membar	0x3D
	lduh	[%l7 + 0x7C],	%o5
	fmovdle	%xcc,	%f24,	%f17
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%l6
	fpadd16s	%f4,	%f24,	%f16
	addc	%i2,	%i6,	%i3
	srlx	%l1,	%g2,	%g5
	fbl	%fcc2,	loop_1109
	ld	[%l7 + 0x20],	%f11
	movvc	%xcc,	%o6,	%l0
	fmovrslz	%i4,	%f18,	%f27
loop_1109:
	ta	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	stba	%o7,	[%l7 + 0x55] %asi
	array8	%g3,	%l2,	%l5
	taddcctv	%o2,	0x16FC,	%l3
	fbg	%fcc2,	loop_1110
	movcs	%xcc,	%g4,	%o0
	ta	%xcc,	0x7
	fmovdvc	%xcc,	%f9,	%f12
loop_1110:
	nop
	fitod	%f18,	%f24
	movn	%icc,	%g6,	%i5
	edge8l	%g7,	%g1,	%i0
	sdiv	%o1,	0x1D7D,	%o3
	edge16n	%o4,	%l4,	%o5
	sllx	%i1,	%l6,	%i2
	alignaddr	%i6,	%i7,	%l1
	edge16l	%g2,	%g5,	%i3
	call	loop_1111
	array32	%o6,	%l0,	%i4
	sllx	%o7,	%l2,	%g3
	subccc	%o2,	0x04EC,	%l3
loop_1111:
	edge16ln	%g4,	%l5,	%g6
	set	0x26, %i6
	ldstuba	[%l7 + %i6] 0x0c,	%o0
	nop
	fitod	%f10,	%f30
	fdtox	%f30,	%f30
	tvs	%xcc,	0x6
	fpsub32s	%f25,	%f8,	%f30
	srl	%i5,	%g1,	%g7
	edge32n	%o1,	%o3,	%o4
	fmovsa	%icc,	%f10,	%f12
	bgu,pn	%icc,	loop_1112
	andncc	%l4,	%i0,	%o5
	mulscc	%l6,	%i1,	%i6
	addccc	%i2,	0x0F31,	%i7
loop_1112:
	srlx	%g2,	0x07,	%l1
	tg	%icc,	0x0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x54] %asi,	%i3
	mulscc	%g5,	%o6,	%l0
	nop
	setx	loop_1113,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x0EF2,	%i4
	nop
	setx	0x3734190BA07EFDDE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	movrne	%l2,	%o7,	%g3
loop_1113:
	fpack32	%f20,	%f26,	%f22
	sra	%l3,	0x05,	%g4
	movg	%xcc,	%l5,	%g6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o2
	nop
	setx	0x22907019,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xC7DAD5F6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f27,	%f20
	fbe,a	%fcc3,	loop_1114
	bneg,pn	%icc,	loop_1115
	fbge,a	%fcc1,	loop_1116
	brlez,a	%i5,	loop_1117
loop_1114:
	sdiv	%g1,	0x198B,	%o0
loop_1115:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f13,	[%l7 + 0x08] %asi
loop_1116:
	move	%xcc,	%g7,	%o3
loop_1117:
	bl,a,pt	%xcc,	loop_1118
	fpadd16s	%f18,	%f28,	%f15
	sdivx	%o1,	0x1978,	%o4
	nop
	setx	loop_1119,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1118:
	brlz,a	%i0,	loop_1120
	fbl,a	%fcc1,	loop_1121
	array8	%o5,	%l4,	%i1
loop_1119:
	fands	%f0,	%f14,	%f24
loop_1120:
	taddcctv	%l6,	%i2,	%i6
loop_1121:
	bneg,a,pn	%icc,	loop_1122
	ldx	[%l7 + 0x30],	%i7
	fmovrde	%g2,	%f16,	%f6
	sll	%i3,	0x00,	%l1
loop_1122:
	tsubcc	%o6,	%g5,	%i4
	movpos	%xcc,	%l0,	%l2
	subccc	%o7,	0x0EFF,	%g3
	bcc,pt	%icc,	loop_1123
	membar	0x41
	edge32n	%l3,	%g4,	%g6
	tle	%icc,	0x0
loop_1123:
	addccc	%o2,	0x17D8,	%i5
	xorcc	%g1,	%l5,	%o0
	fmovscc	%icc,	%f7,	%f10
	xor	%o3,	%o1,	%g7
	nop
	setx	0x1CFF55DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f16
	fble,a	%fcc0,	loop_1124
	srlx	%o4,	%i0,	%o5
	subcc	%l4,	0x1695,	%l6
	brlz	%i2,	loop_1125
loop_1124:
	ta	%xcc,	0x2
	bshuffle	%f12,	%f6,	%f28
	stb	%i6,	[%l7 + 0x49]
loop_1125:
	fbule	%fcc3,	loop_1126
	sra	%i1,	0x08,	%g2
	set	0x66, %i2
	stha	%i7,	[%l7 + %i2] 0xea
	membar	#Sync
loop_1126:
	brnz,a	%i3,	loop_1127
	fnot1	%f6,	%f10
	bn,pt	%xcc,	loop_1128
	taddcc	%l1,	0x08C2,	%g5
loop_1127:
	tne	%xcc,	0x4
	tl	%xcc,	0x3
loop_1128:
	ldub	[%l7 + 0x25],	%o6
	edge32n	%l0,	%l2,	%o7
	movrgz	%i4,	0x24F,	%g3
	xnorcc	%l3,	0x0229,	%g6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x10] %asi,	%g4
	movpos	%icc,	%i5,	%g1
	movneg	%xcc,	%o2,	%o0
	edge16	%o3,	%o1,	%g7
	fmovrsgz	%l5,	%f3,	%f21
	lduh	[%l7 + 0x6C],	%o4
	array32	%o5,	%i0,	%l6
	fcmpne16	%f8,	%f14,	%l4
	tvc	%icc,	0x2
	movrlz	%i2,	%i6,	%g2
	bne,pn	%xcc,	loop_1129
	udivx	%i1,	0x09A5,	%i3
	fblg,a	%fcc2,	loop_1130
	edge8	%l1,	%g5,	%i7
loop_1129:
	nop
	fitos	%f16,	%f16
	brlez	%o6,	loop_1131
loop_1130:
	nop
	setx	loop_1132,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq16	%f12,	%f12,	%l2
	mulscc	%o7,	%i4,	%l0
loop_1131:
	fmovdn	%xcc,	%f31,	%f0
loop_1132:
	lduh	[%l7 + 0x0C],	%l3
	bleu,pt	%xcc,	loop_1133
	fmovsge	%xcc,	%f18,	%f1
	andcc	%g6,	%g3,	%g4
	set	0x6C, %l0
	stwa	%i5,	[%l7 + %l0] 0xe3
	membar	#Sync
loop_1133:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x74] %asi,	%f17
	andcc	%o2,	%g1,	%o0
	movgu	%icc,	%o3,	%o1
	set	0x78, %o2
	prefetcha	[%l7 + %o2] 0x10,	 0x2
	andncc	%l5,	%o5,	%o4
	tne	%xcc,	0x4
	fzero	%f16
	edge8n	%l6,	%i0,	%i2
	sdiv	%l4,	0x1F97,	%g2
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x2E] %asi,	%i6
	subcc	%i1,	0x1330,	%l1
	fmovdvs	%xcc,	%f6,	%f25
	fmul8x16au	%f3,	%f28,	%f30
	smul	%i3,	0x0F75,	%g5
	set	0x1A, %i4
	stha	%i7,	[%l7 + %i4] 0x10
	movle	%icc,	%l2,	%o7
	andn	%o6,	0x1F37,	%i4
	nop
	fitod	%f2,	%f0
	fdtox	%f0,	%f30
	fmul8sux16	%f10,	%f0,	%f20
	membar	0x24
	movvs	%xcc,	%l0,	%g6
	fcmpeq16	%f26,	%f30,	%g3
	nop
	setx	0xE32AD5E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x7F8E7C61,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f26,	%f9
	fbn	%fcc0,	loop_1134
	fblg	%fcc1,	loop_1135
	sra	%g4,	%i5,	%o2
	call	loop_1136
loop_1134:
	sdiv	%g1,	0x0776,	%l3
loop_1135:
	subcc	%o0,	0x1F87,	%o3
	fnot1s	%f7,	%f19
loop_1136:
	fcmpne32	%f6,	%f24,	%o1
	tge	%xcc,	0x1
	xnor	%g7,	%o5,	%o4
	bgu,a,pn	%icc,	loop_1137
	umul	%l5,	0x12AE,	%l6
	edge32l	%i2,	%i0,	%g2
	nop
	setx	0x3E942D0B8E7A69D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x430B4E970296E8C5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f20,	%f20
loop_1137:
	movrne	%l4,	0x3C3,	%i1
	edge8n	%l1,	%i3,	%g5
	fsrc2s	%f4,	%f31
	bl	loop_1138
	fbu,a	%fcc1,	loop_1139
	popc	0x1541,	%i7
	fxnor	%f8,	%f12,	%f24
loop_1138:
	tge	%icc,	0x5
loop_1139:
	movne	%icc,	%i6,	%o7
	bg,a,pt	%icc,	loop_1140
	fbuge	%fcc2,	loop_1141
	orncc	%l2,	%i4,	%l0
	bl,pt	%icc,	loop_1142
loop_1140:
	tpos	%icc,	0x2
loop_1141:
	movneg	%xcc,	%o6,	%g6
	movvc	%icc,	%g4,	%g3
loop_1142:
	xnor	%i5,	0x07E4,	%o2
	array8	%l3,	%o0,	%o3
	bpos,a	%xcc,	loop_1143
	nop
	setx	0x160F778A6C523B60,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xB525D64512322B62,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f24,	%f18
	fpsub32	%f16,	%f6,	%f6
	array16	%o1,	%g7,	%o5
loop_1143:
	orn	%g1,	%o4,	%l5
	bl,pt	%icc,	loop_1144
	movge	%xcc,	%i2,	%l6
	bgu,a	loop_1145
	udivcc	%i0,	0x016E,	%g2
loop_1144:
	mulx	%l4,	0x1EE6,	%l1
	tn	%xcc,	0x7
loop_1145:
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f28
	fxtos	%f28,	%f12
	edge16n	%i1,	%g5,	%i7
	be,a,pt	%xcc,	loop_1146
	stbar
	fxors	%f18,	%f11,	%f7
	fmovs	%f30,	%f20
loop_1146:
	edge32n	%i6,	%o7,	%i3
	mulscc	%i4,	%l2,	%l0
	movvc	%xcc,	%o6,	%g6
	umul	%g4,	%i5,	%o2
	tpos	%xcc,	0x7
	smulcc	%l3,	0x1FFC,	%o0
	fpsub32s	%f4,	%f27,	%f17
	movrlez	%o3,	0x21F,	%o1
	xor	%g3,	%o5,	%g7
	nop
	setx	0xFDF7F517,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xF8BF438B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f31,	%f10
	movleu	%xcc,	%g1,	%l5
	stx	%o4,	[%l7 + 0x70]
	movg	%icc,	%l6,	%i0
	nop
	fitos	%f9,	%f20
	fstox	%f20,	%f30
	udiv	%g2,	0x0A0C,	%i2
	set	0x2C, %g3
	lduha	[%l7 + %g3] 0x89,	%l1
	tcs	%icc,	0x2
	edge8l	%l4,	%g5,	%i1
	fpadd16s	%f15,	%f6,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i6,	%o7,	%i7
	call	loop_1147
	srlx	%i3,	%i4,	%l2
	stx	%o6,	[%l7 + 0x50]
	sdivx	%g6,	0x1A53,	%g4
loop_1147:
	sllx	%i5,	%l0,	%l3
	movcs	%xcc,	%o0,	%o3
	movcc	%icc,	%o1,	%o2
	fmovdgu	%icc,	%f0,	%f20
	swap	[%l7 + 0x7C],	%g3
	swap	[%l7 + 0x24],	%g7
	mulscc	%g1,	0x1582,	%o5
	tcc	%xcc,	0x0
	movvc	%icc,	%o4,	%l5
	taddcc	%i0,	0x12F0,	%l6
	fandnot1s	%f10,	%f8,	%f26
	movl	%xcc,	%g2,	%i2
	flush	%l7 + 0x38
	wr	%g0,	0x88,	%asi
	sta	%f5,	[%l7 + 0x0C] %asi
	fbule	%fcc3,	loop_1148
	movneg	%xcc,	%l1,	%l4
	swap	[%l7 + 0x40],	%i1
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g5
loop_1148:
	pdist	%f16,	%f26,	%f12
	nop
	setx loop_1149, %l0, %l1
	jmpl %l1, %o7
	tvs	%xcc,	0x3
	tcc	%xcc,	0x7
	sra	%i6,	%i7,	%i4
loop_1149:
	nop
	set	0x22, %l5
	ldstuba	[%l7 + %l5] 0x0c,	%i3
	mova	%xcc,	%l2,	%o6
	fnands	%f8,	%f22,	%f8
	sllx	%g4,	0x0B,	%g6
	xnor	%l0,	0x0D25,	%i5
	mova	%xcc,	%l3,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_1150, %l0, %l1
	jmpl %l1, %o0
	pdist	%f28,	%f22,	%f20
	edge32ln	%o2,	%g3,	%o1
	sdivx	%g7,	0x118A,	%g1
loop_1150:
	nop
	fitos	%f8,	%f16
	fstod	%f16,	%f12
	set	0x4A, %i0
	ldsha	[%l7 + %i0] 0x14,	%o5
	movn	%icc,	%o4,	%l5
	fpsub32s	%f16,	%f14,	%f22
	movcc	%xcc,	%l6,	%i0
	movneg	%xcc,	%i2,	%g2
	array32	%l4,	%i1,	%l1
	sethi	0x1EB2,	%o7
	sdivcc	%i6,	0x15BA,	%i7
	fmovrslez	%i4,	%f3,	%f31
	fnors	%f0,	%f2,	%f7
	fsrc2	%f22,	%f12
	xor	%i3,	%l2,	%g5
	stbar
	st	%f23,	[%l7 + 0x14]
	nop
	fitod	%f8,	%f20
	fdtoi	%f20,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f13,	%f16
	fmovsg	%icc,	%f27,	%f17
	sir	0x1108
	set	0x4B, %o0
	ldsba	[%l7 + %o0] 0x14,	%g4
	umul	%o6,	%l0,	%g6
	fmovrdgz	%l3,	%f18,	%f4
	te	%icc,	0x6
	fnot1s	%f25,	%f28
	array32	%i5,	%o0,	%o2
	andcc	%g3,	%o1,	%o3
	umul	%g7,	0x026D,	%o5
	srax	%o4,	%l5,	%g1
	bl,pn	%xcc,	loop_1151
	fmovdleu	%xcc,	%f5,	%f31
	stw	%l6,	[%l7 + 0x64]
	fxnors	%f28,	%f27,	%f10
loop_1151:
	edge16ln	%i0,	%g2,	%i2
	fcmpeq32	%f8,	%f24,	%l4
	fmovdpos	%xcc,	%f16,	%f6
	set	0x30, %o1
	ldsba	[%l7 + %o1] 0x14,	%l1
	edge32l	%o7,	%i6,	%i1
	fbne,a	%fcc3,	loop_1152
	tpos	%icc,	0x6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
loop_1152:
	movcc	%icc,	%i4,	%l2
	movrne	%g5,	%i3,	%g4
	and	%o6,	0x008C,	%l0
	st	%f22,	[%l7 + 0x70]
	tcs	%icc,	0x3
	smul	%l3,	0x12BC,	%g6
	fmovde	%icc,	%f26,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f1
	edge32ln	%o0,	%o2,	%g3
	fcmple32	%f12,	%f10,	%i5
	fcmple16	%f24,	%f10,	%o3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%g7
	bvs,a,pn	%xcc,	loop_1153
	fsrc2s	%f3,	%f5
	nop
	setx	0xCE496119,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f13
	alignaddrl	%o4,	%o5,	%g1
loop_1153:
	movle	%icc,	%l6,	%l5
	ldd	[%l7 + 0x18],	%i0
	fbe,a	%fcc2,	loop_1154
	sir	0x0381
	edge8n	%g2,	%i2,	%l4
	smulcc	%o7,	0x1346,	%l1
loop_1154:
	nop
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i1,	%i7
	tvs	%xcc,	0x4
	movleu	%xcc,	%i6,	%i4
	bleu	%xcc,	loop_1155
	tsubcctv	%g5,	%l2,	%g4
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x11
loop_1155:
	taddcc	%o6,	%i3,	%l0
	tg	%icc,	0x1
	srax	%l3,	0x1F,	%o0
	taddcctv	%o2,	0x056B,	%g6
	fmovdleu	%icc,	%f30,	%f18
	tsubcctv	%g3,	0x0DF7,	%o3
	fpsub16	%f6,	%f24,	%f8
	fcmpne16	%f6,	%f8,	%o1
	fcmpeq16	%f24,	%f22,	%g7
	fbuge,a	%fcc3,	loop_1156
	edge16n	%i5,	%o4,	%g1
	movgu	%icc,	%l6,	%o5
	tvs	%icc,	0x7
loop_1156:
	edge16	%l5,	%g2,	%i2
	set	0x7B, %l2
	lduba	[%l7 + %l2] 0x0c,	%l4
	udivx	%i0,	0x0DC4,	%l1
	tsubcctv	%i1,	0x1182,	%i7
	xor	%o7,	0x07D9,	%i6
	or	%i4,	0x1B16,	%l2
	sethi	0x04A1,	%g5
	array32	%g4,	%i3,	%o6
	fcmpne32	%f16,	%f22,	%l3
	fandnot2s	%f21,	%f28,	%f2
	movrne	%l0,	%o2,	%o0
	fnot2s	%f13,	%f12
	move	%icc,	%g3,	%g6
	udivcc	%o1,	0x1B53,	%g7
	movgu	%icc,	%i5,	%o3
	nop
	fitos	%f9,	%f12
	fstod	%f12,	%f22
	edge8	%g1,	%l6,	%o4
	movrgz	%o5,	%g2,	%l5
	ble	loop_1157
	movcc	%xcc,	%i2,	%l4
	ble,pn	%icc,	loop_1158
	edge8ln	%l1,	%i1,	%i0
loop_1157:
	edge16n	%i7,	%o7,	%i6
	umulcc	%l2,	%i4,	%g4
loop_1158:
	orncc	%i3,	%o6,	%g5
	stw	%l0,	[%l7 + 0x30]
	sdivcc	%o2,	0x0980,	%o0
	fmul8sux16	%f6,	%f8,	%f8
	tpos	%xcc,	0x1
	srax	%g3,	%l3,	%g6
	fpadd32	%f24,	%f0,	%f2
	bshuffle	%f2,	%f12,	%f24
	nop
	setx	0x707DAAD5,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	stx	%g7,	[%l7 + 0x08]
	edge32ln	%o1,	%o3,	%i5
	edge32ln	%g1,	%l6,	%o4
	sdivcc	%g2,	0x0DD6,	%o5
	movg	%icc,	%l5,	%l4
	fpackfix	%f14,	%f15
	sdiv	%i2,	0x0283,	%i1
	edge32	%i0,	%l1,	%i7
	array32	%i6,	%l2,	%i4
	tge	%xcc,	0x6
	tne	%xcc,	0x7
	movrne	%g4,	0x0CD,	%o7
	orcc	%o6,	0x145F,	%i3
	edge32n	%g5,	%o2,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g3,	0x1CF5,	%o0
	tg	%xcc,	0x2
	fmovsgu	%icc,	%f22,	%f3
	edge16	%g6,	%g7,	%l3
	bpos,pn	%xcc,	loop_1159
	udivcc	%o1,	0x1E21,	%i5
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f20
	sub	%o3,	0x0B06,	%l6
loop_1159:
	fpackfix	%f16,	%f30
	tle	%xcc,	0x3
	sllx	%o4,	0x0C,	%g1
	fand	%f14,	%f22,	%f14
	movg	%xcc,	%g2,	%l5
	sub	%o5,	%l4,	%i2
	move	%icc,	%i0,	%i1
	mova	%icc,	%l1,	%i6
	edge8l	%l2,	%i7,	%i4
	tcs	%xcc,	0x0
	fblg	%fcc0,	loop_1160
	fbug,a	%fcc3,	loop_1161
	movg	%xcc,	%g4,	%o6
	fbn,a	%fcc2,	loop_1162
loop_1160:
	tgu	%icc,	0x2
loop_1161:
	fbul,a	%fcc2,	loop_1163
	alignaddrl	%o7,	%i3,	%g5
loop_1162:
	fmovse	%xcc,	%f27,	%f16
	ldsb	[%l7 + 0x21],	%l0
loop_1163:
	nop
	setx	0xBCB0E203,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x2D565AA0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f29,	%f11
	fabsd	%f16,	%f18
	xnorcc	%g3,	%o2,	%o0
	and	%g6,	%g7,	%l3
	brgez,a	%o1,	loop_1164
	mulx	%o3,	0x19E8,	%i5
	udivx	%l6,	0x0C39,	%o4
	nop
	setx	0x89D585C252F74CC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x64D665302F1AF847,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f22,	%f12
loop_1164:
	be,a	%icc,	loop_1165
	fmovscs	%icc,	%f10,	%f27
	sub	%g1,	0x008D,	%g2
	movrgz	%o5,	0x349,	%l5
loop_1165:
	tcc	%icc,	0x6
	edge32n	%l4,	%i0,	%i1
	edge32n	%i2,	%l1,	%l2
	bge,a,pt	%icc,	loop_1166
	srl	%i6,	0x01,	%i4
	array16	%i7,	%o6,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1166:
	fpadd16s	%f16,	%f14,	%f10
	nop
	setx loop_1167, %l0, %l1
	jmpl %l1, %i3
	edge8n	%o7,	%g5,	%l0
	movne	%icc,	%g3,	%o2
	umulcc	%o0,	%g6,	%g7
loop_1167:
	sll	%o1,	%o3,	%i5
	sdivx	%l6,	0x0C21,	%o4
	alignaddrl	%l3,	%g2,	%g1
	call	loop_1168
	bneg	loop_1169
	stb	%l5,	[%l7 + 0x49]
	nop
	setx	0xF1DD63CA3706475F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x35AA4B30383DD0FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f8,	%f14
loop_1168:
	fmovs	%f2,	%f26
loop_1169:
	nop
	fitos	%f2,	%f30
	fstod	%f30,	%f26
	subccc	%o5,	%l4,	%i1
	udivx	%i2,	0x1268,	%l1
	movrgz	%i0,	0x2D2,	%l2
	fcmpeq16	%f0,	%f12,	%i4
	nop
	setx	0x92DF105E12C127CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xB303BCFC4FA112C5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f14,	%f0
	udivx	%i7,	0x07F3,	%o6
	fcmpne16	%f6,	%f20,	%g4
	alignaddrl	%i3,	%o7,	%g5
	fmovrsgz	%l0,	%f6,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%g3,	loop_1170
	brnz	%i6,	loop_1171
	nop
	setx	0xD046B3E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	edge32	%o2,	%g6,	%o0
loop_1170:
	membar	0x3D
loop_1171:
	nop
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x1e,	%f0
	smul	%g7,	0x098B,	%o3
	tg	%xcc,	0x4
	or	%o1,	%l6,	%o4
	edge8n	%i5,	%l3,	%g2
	set	0x5A, %g4
	ldsha	[%l7 + %g4] 0x89,	%g1
	sra	%l5,	%l4,	%o5
	fbuge,a	%fcc3,	loop_1172
	fmovsn	%icc,	%f10,	%f3
	st	%f25,	[%l7 + 0x44]
	brnz,a	%i2,	loop_1173
loop_1172:
	fbug	%fcc0,	loop_1174
	sdivx	%l1,	0x1D7F,	%i0
	tne	%xcc,	0x7
loop_1173:
	alignaddr	%l2,	%i4,	%i1
loop_1174:
	fmovdn	%xcc,	%f31,	%f5
	fmovdvs	%xcc,	%f14,	%f4
	fbu	%fcc2,	loop_1175
	sll	%o6,	0x05,	%g4
	smul	%i7,	%i3,	%g5
	edge8	%l0,	%g3,	%i6
loop_1175:
	edge16ln	%o7,	%g6,	%o2
	nop
	fitos	%f2,	%f5
	faligndata	%f24,	%f2,	%f6
	tpos	%xcc,	0x4
	mulscc	%o0,	%o3,	%g7
	srlx	%o1,	%l6,	%o4
	tge	%xcc,	0x5
	ldd	[%l7 + 0x70],	%l2
	udivx	%g2,	0x1447,	%g1
	movge	%xcc,	%i5,	%l4
	andcc	%o5,	%i2,	%l1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x04,	%l5,	%l2
	movrlz	%i0,	0x074,	%i4
	nop
	fitos	%f13,	%f21
	fstox	%f21,	%f0
	array8	%o6,	%i1,	%i7
	movcc	%xcc,	%g4,	%g5
	edge8ln	%i3,	%g3,	%i6
	alignaddrl	%o7,	%l0,	%o2
	nop
	setx	loop_1176,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdleu	%xcc,	%f19,	%f1
	lduh	[%l7 + 0x58],	%g6
	fnot1s	%f20,	%f11
loop_1176:
	ldub	[%l7 + 0x72],	%o0
	sdivcc	%o3,	0x0FB4,	%g7
	edge8ln	%o1,	%l6,	%o4
	brlz	%l3,	loop_1177
	sll	%g1,	0x1D,	%i5
	subc	%g2,	%l4,	%i2
	fandnot1s	%f30,	%f0,	%f6
loop_1177:
	movle	%icc,	%o5,	%l1
	fpack16	%f10,	%f15
	fpadd16s	%f5,	%f23,	%f17
	fbug	%fcc2,	loop_1178
	addcc	%l2,	0x0609,	%i0
	srl	%l5,	%o6,	%i1
	tcc	%xcc,	0x5
loop_1178:
	fbge,a	%fcc1,	loop_1179
	prefetch	[%l7 + 0x6C],	 0x3
	fbu	%fcc2,	loop_1180
	fmovd	%f8,	%f12
loop_1179:
	or	%i4,	%i7,	%g5
	brgz,a	%g4,	loop_1181
loop_1180:
	fmul8x16	%f2,	%f24,	%f10
	movrne	%g3,	%i6,	%i3
	ta	%icc,	0x0
loop_1181:
	nop
	setx	0xF06932F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fmovdle	%xcc,	%f23,	%f14
	udivcc	%l0,	0x180F,	%o2
	movleu	%icc,	%g6,	%o0
	srlx	%o7,	0x1B,	%g7
	smulcc	%o1,	0x1415,	%o3
	tne	%icc,	0x7
	movrlz	%l6,	%l3,	%g1
	membar	0x7E
	fmovrdgez	%i5,	%f12,	%f28
	movvs	%icc,	%o4,	%l4
	sir	0x0F83
	ldd	[%l7 + 0x10],	%f4
	fmovrdgz	%i2,	%f0,	%f16
	tsubcctv	%g2,	0x08CC,	%o5
	fble	%fcc1,	loop_1182
	fpsub16	%f0,	%f20,	%f0
	movn	%icc,	%l1,	%i0
	alignaddrl	%l5,	%o6,	%i1
loop_1182:
	call	loop_1183
	fnors	%f21,	%f25,	%f12
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x89,	%i4,	%i7
loop_1183:
	nop
	fitos	%f30,	%f31
	movneg	%icc,	%l2,	%g5
	taddcc	%g4,	0x1D21,	%g3
	stx	%i3,	[%l7 + 0x70]
	tpos	%icc,	0x7
	edge32	%l0,	%o2,	%g6
	tle	%xcc,	0x1
	te	%icc,	0x1
	bpos	%icc,	loop_1184
	add	%o0,	0x02AE,	%o7
	srlx	%i6,	%g7,	%o3
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%o1
loop_1184:
	movneg	%icc,	%l6,	%l3
	fmovsn	%xcc,	%f12,	%f22
	set	0x60, %o4
	prefetcha	[%l7 + %o4] 0x15,	 0x2
	bn,a,pt	%icc,	loop_1185
	move	%icc,	%i5,	%l4
	fbne,a	%fcc1,	loop_1186
	udivcc	%o4,	0x0210,	%i2
loop_1185:
	fbul	%fcc2,	loop_1187
	fxnor	%f26,	%f26,	%f6
loop_1186:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x40] %asi,	%o5
loop_1187:
	nop
	fitod	%f28,	%f20
	nop
	setx	0xC8BB1714,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xADCB3E55,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f17,	%f17
	tne	%icc,	0x4
	nop
	setx	loop_1188,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%xcc,	0x1
	orn	%g2,	0x0C56,	%i0
	fnot2s	%f30,	%f18
loop_1188:
	tl	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x19
	subcc	%l1,	0x094D,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc3,	loop_1189
	move	%xcc,	%i1,	%i4
	fmul8x16	%f29,	%f10,	%f18
	tleu	%icc,	0x5
loop_1189:
	movrgz	%l5,	0x0A2,	%i7
	fmovsvc	%icc,	%f17,	%f24
	edge16l	%l2,	%g5,	%g3
	fbule,a	%fcc0,	loop_1190
	addcc	%i3,	0x0357,	%l0
	movpos	%icc,	%g4,	%o2
	edge8	%g6,	%o0,	%i6
loop_1190:
	tleu	%icc,	0x7
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x10,	%g7
	or	%o7,	0x00E6,	%o1
	bn,pn	%icc,	loop_1191
	movrgez	%o3,	0x046,	%l6
	fcmpeq16	%f10,	%f18,	%l3
	or	%g1,	%i5,	%o4
loop_1191:
	fmovsle	%icc,	%f7,	%f13
	fbue	%fcc0,	loop_1192
	addc	%l4,	0x1DA3,	%o5
	ba,a,pt	%xcc,	loop_1193
	tpos	%xcc,	0x2
loop_1192:
	prefetch	[%l7 + 0x18],	 0x2
	nop
	setx	0x26653A7090223766,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x9A4896D404E1FB6E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f18,	%f20
loop_1193:
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f24
	fxtod	%f24,	%f14
	andncc	%g2,	%i0,	%i2
	tvs	%icc,	0x2
	fnegd	%f16,	%f12
	tneg	%xcc,	0x0
	fnands	%f28,	%f4,	%f30
	fornot2s	%f29,	%f18,	%f24
	nop
	setx	0x7E5CEF9230B990CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f20
	membar	0x08
	tcs	%xcc,	0x5
	movle	%xcc,	%l1,	%i1
	tvc	%icc,	0x1
	movrlez	%o6,	0x23A,	%i4
	bn,a	%xcc,	loop_1194
	array16	%i7,	%l5,	%g5
	mulx	%g3,	0x1C89,	%i3
	fcmpne16	%f14,	%f28,	%l2
loop_1194:
	edge32ln	%l0,	%g4,	%g6
	fmovdle	%icc,	%f30,	%f20
	movleu	%xcc,	%o0,	%o2
	fpmerge	%f14,	%f16,	%f20
	tneg	%xcc,	0x1
	edge16ln	%g7,	%o7,	%o1
	nop
	setx	0x807EDF0C,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	orncc	%i6,	0x1602,	%l6
	fmovda	%icc,	%f29,	%f15
	umul	%o3,	%l3,	%i5
	wr	%g0,	0x5f,	%asi
	stxa	%g1,	[%g0 + 0x0] %asi
	fornot2	%f24,	%f12,	%f4
	tvs	%xcc,	0x3
	popc	%o4,	%l4
	movrgez	%g2,	%o5,	%i2
	srax	%i0,	%l1,	%o6
	movge	%icc,	%i1,	%i4
	ldsh	[%l7 + 0x7C],	%l5
	tge	%icc,	0x0
	fmovsne	%icc,	%f22,	%f23
	nop
	setx	0xB54D23B27368FABD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x35B3CAA7B1CC679D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f22,	%f22
	tn	%xcc,	0x5
	edge16l	%g5,	%g3,	%i7
	fbne	%fcc2,	loop_1195
	nop
	setx	loop_1196,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%l2,	%l0
	fbuge	%fcc1,	loop_1197
loop_1195:
	edge32	%i3,	%g4,	%o0
loop_1196:
	bn,a	%xcc,	loop_1198
	movvs	%icc,	%o2,	%g7
loop_1197:
	nop
	fitod	%f2,	%f24
	fdtoi	%f24,	%f27
	fmovdvc	%xcc,	%f15,	%f4
loop_1198:
	swap	[%l7 + 0x30],	%o7
	pdist	%f30,	%f26,	%f28
	popc	%o1,	%i6
	taddcctv	%l6,	%g6,	%l3
	membar	0x6B
	nop
	setx	0x3E8B85F280792111,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%i5
	array16	%o3,	%g1,	%o4
	nop
	setx	loop_1199,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbg,a	%fcc2,	loop_1200
	swap	[%l7 + 0x08],	%l4
	bn,pn	%xcc,	loop_1201
loop_1199:
	sra	%o5,	0x04,	%g2
loop_1200:
	umulcc	%i2,	0x1E7A,	%l1
	andncc	%i0,	%i1,	%o6
loop_1201:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%l5
	movrlez	%i4,	%g3,	%i7
	udivx	%l2,	0x0819,	%g5
	umul	%l0,	0x0611,	%i3
	mulscc	%o0,	0x0308,	%o2
	andncc	%g7,	%o7,	%o1
	mulx	%i6,	%l6,	%g4
	addcc	%g6,	%l3,	%i5
	fbule,a	%fcc3,	loop_1202
	xorcc	%g1,	0x0768,	%o4
	te	%xcc,	0x2
	alignaddrl	%o3,	%o5,	%l4
loop_1202:
	nop
	setx	loop_1203,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnor	%i2,	0x16B8,	%g2
	fmovrslez	%i0,	%f6,	%f25
	edge16ln	%i1,	%l1,	%l5
loop_1203:
	movrne	%i4,	%g3,	%i7
	fba,a	%fcc3,	loop_1204
	nop
	setx	loop_1205,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movl	%icc,	%l2,	%o6
	fabsd	%f26,	%f4
loop_1204:
	tleu	%xcc,	0x2
loop_1205:
	nop
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x51] %asi,	%l0
	movrgez	%g5,	0x305,	%i3
	move	%icc,	%o2,	%o0
	orncc	%o7,	%g7,	%o1
	movcs	%xcc,	%l6,	%g4
	andcc	%g6,	0x11B9,	%l3
	xnorcc	%i6,	%i5,	%g1
	nop
	setx	0x42D41AA7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x0AB01B09,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f0,	%f27
	addc	%o4,	%o5,	%l4
	tge	%icc,	0x4
	or	%o3,	%g2,	%i2
	udivx	%i1,	0x0BF4,	%i0
	tvc	%icc,	0x0
	edge8n	%l5,	%l1,	%i4
	popc	%g3,	%i7
	st	%f14,	[%l7 + 0x18]
	fmovrdne	%l2,	%f22,	%f28
	tneg	%xcc,	0x7
	andcc	%l0,	0x065E,	%g5
	tsubcctv	%o6,	%o2,	%o0
	nop
	fitos	%f14,	%f6
	fstoi	%f6,	%f10
	sdiv	%o7,	0x01B1,	%i3
	ldsh	[%l7 + 0x4A],	%o1
	brnz,a	%l6,	loop_1206
	brgz	%g7,	loop_1207
	edge8l	%g4,	%g6,	%i6
	andncc	%l3,	%g1,	%i5
loop_1206:
	or	%o4,	%l4,	%o5
loop_1207:
	tneg	%xcc,	0x6
	sra	%o3,	%i2,	%i1
	fmul8x16al	%f10,	%f7,	%f24
	movvs	%icc,	%g2,	%l5
	smulcc	%i0,	0x140C,	%i4
	mulx	%g3,	0x1ED9,	%i7
	edge8	%l1,	%l0,	%l2
	movn	%xcc,	%o6,	%o2
	srlx	%o0,	0x19,	%g5
	fmovrdne	%o7,	%f30,	%f6
	popc	%i3,	%l6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%o1
	xorcc	%g4,	%g6,	%l3
	subcc	%g1,	%i5,	%o4
	prefetch	[%l7 + 0x64],	 0x2
	movrlez	%l4,	%i6,	%o3
	fpsub32s	%f27,	%f11,	%f1
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x48] %asi,	%o5
	fble,a	%fcc2,	loop_1208
	tn	%icc,	0x2
	tneg	%xcc,	0x6
	movvc	%xcc,	%i2,	%g2
loop_1208:
	tneg	%icc,	0x1
	orncc	%i1,	0x0846,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i4,	0x195B,	%i0
	movrlz	%g3,	0x3C7,	%i7
	umulcc	%l0,	0x1636,	%l1
	nop
	setx	0xF7F1FD64,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x40CB8DCD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f2,	%f28
	edge32l	%l2,	%o6,	%o2
	xor	%g5,	%o0,	%o7
	move	%icc,	%i3,	%l6
	wr	%g0,	0x0c,	%asi
	sta	%f4,	[%l7 + 0x18] %asi
	sdiv	%g7,	0x037C,	%g4
	sdivcc	%g6,	0x0ED0,	%l3
	movge	%icc,	%o1,	%g1
	sdivcc	%i5,	0x1155,	%l4
	andn	%o4,	%o3,	%i6
	subcc	%o5,	0x1F27,	%i2
	movrgz	%g2,	%i1,	%i4
	sllx	%l5,	%i0,	%i7
	srax	%g3,	%l0,	%l2
	udivcc	%o6,	0x0BFC,	%o2
	fexpand	%f1,	%f8
	edge32n	%g5,	%o0,	%l1
	tge	%icc,	0x5
	swap	[%l7 + 0x48],	%i3
	move	%xcc,	%l6,	%o7
	movrne	%g7,	0x323,	%g6
	edge16	%l3,	%o1,	%g1
	fmovse	%xcc,	%f5,	%f1
	edge32ln	%i5,	%l4,	%g4
	fbule	%fcc3,	loop_1209
	edge8n	%o3,	%o4,	%i6
	movcc	%xcc,	%o5,	%i2
	st	%f11,	[%l7 + 0x48]
loop_1209:
	taddcc	%g2,	%i4,	%l5
	andn	%i0,	%i7,	%i1
	movleu	%xcc,	%l0,	%l2
	sir	0x0BD0
	bn,a	loop_1210
	movl	%icc,	%g3,	%o2
	movgu	%xcc,	%o6,	%g5
	nop
	setx	0xF5853E2CDF9F5973,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x745BCE288F28F14B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f6,	%f4
loop_1210:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o0,	%l1,	%l6
	bvc,a,pn	%xcc,	loop_1211
	orcc	%i3,	0x1CD1,	%o7
	edge32	%g6,	%g7,	%o1
	membar	0x61
loop_1211:
	fsrc2	%f30,	%f12
	edge16l	%g1,	%i5,	%l3
	brgez,a	%l4,	loop_1212
	te	%icc,	0x2
	fmovdvc	%xcc,	%f11,	%f18
	alignaddrl	%g4,	%o4,	%o3
loop_1212:
	ldd	[%l7 + 0x10],	%f18
	ldsw	[%l7 + 0x64],	%o5
	edge8n	%i6,	%i2,	%g2
	addcc	%i4,	0x0621,	%l5
	mova	%xcc,	%i0,	%i7
	sdivx	%l0,	0x09B1,	%i1
	umul	%g3,	%l2,	%o2
	array8	%g5,	%o6,	%l1
	subc	%o0,	0x037C,	%i3
	subccc	%o7,	%l6,	%g6
	swap	[%l7 + 0x7C],	%o1
	edge8n	%g1,	%g7,	%l3
	ldub	[%l7 + 0x55],	%i5
	movne	%xcc,	%g4,	%l4
	te	%icc,	0x7
	and	%o4,	%o3,	%i6
	mulscc	%i2,	0x0916,	%o5
	tle	%icc,	0x3
	smulcc	%i4,	0x0220,	%g2
	movneg	%xcc,	%l5,	%i7
	st	%f25,	[%l7 + 0x2C]
	fnegs	%f12,	%f25
	fmovde	%icc,	%f7,	%f21
	move	%xcc,	%i0,	%l0
	movrgez	%i1,	0x2EC,	%l2
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f18
	srlx	%g3,	%o2,	%g5
	addccc	%o6,	%l1,	%i3
	nop
	setx	0xC04D7CE1,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	mulx	%o7,	0x1CBA,	%o0
	fone	%f28
	taddcc	%l6,	0x033B,	%o1
	tneg	%icc,	0x2
	andncc	%g6,	%g1,	%g7
	sdivcc	%i5,	0x1802,	%l3
	ldstub	[%l7 + 0x11],	%g4
	fmovdcc	%xcc,	%f23,	%f19
	tsubcc	%l4,	%o3,	%o4
	srl	%i6,	0x1E,	%o5
	bvc,pn	%xcc,	loop_1213
	sir	0x0C8B
	bneg,pn	%icc,	loop_1214
	ldsb	[%l7 + 0x4A],	%i2
loop_1213:
	fnot2	%f14,	%f6
	membar	0x7D
loop_1214:
	subc	%g2,	0x01EF,	%l5
	brgz	%i4,	loop_1215
	movrlez	%i0,	0x0E2,	%i7
	sra	%i1,	0x19,	%l2
	movrgz	%g3,	%l0,	%o2
loop_1215:
	subcc	%g5,	0x0DAD,	%o6
	udiv	%l1,	0x179F,	%i3
	edge8ln	%o0,	%o7,	%o1
	brnz,a	%g6,	loop_1216
	xorcc	%l6,	0x0D09,	%g7
	tl	%xcc,	0x3
	srax	%g1,	0x15,	%l3
loop_1216:
	movgu	%xcc,	%g4,	%i5
	ldstub	[%l7 + 0x20],	%o3
	fbg,a	%fcc2,	loop_1217
	bleu,a	%icc,	loop_1218
	or	%l4,	%i6,	%o4
	udivcc	%o5,	0x1C08,	%i2
loop_1217:
	nop
	fitod	%f22,	%f24
loop_1218:
	pdist	%f30,	%f10,	%f2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x18] %asi,	%l5
	fmul8x16al	%f16,	%f31,	%f0
	fandnot2	%f28,	%f28,	%f8
	stx	%i4,	[%l7 + 0x08]
	tleu	%xcc,	0x3
	tge	%icc,	0x0
	movcs	%icc,	%g2,	%i7
	fsrc2	%f22,	%f14
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
	bl,pt	%icc,	loop_1219
	fmovse	%xcc,	%f24,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x7
loop_1219:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x7C] %asi,	%l2
	fand	%f14,	%f24,	%f16
	addc	%g3,	%i1,	%l0
	fsrc2	%f22,	%f0
	edge8l	%o2,	%g5,	%l1
	set	0x34, %l1
	swapa	[%l7 + %l1] 0x10,	%o6
	fbo,a	%fcc0,	loop_1220
	tl	%icc,	0x2
	movrgez	%o0,	0x25A,	%i3
	brlz	%o1,	loop_1221
loop_1220:
	fbg,a	%fcc3,	loop_1222
	fmovrdlez	%g6,	%f30,	%f2
	faligndata	%f26,	%f22,	%f0
loop_1221:
	ldsw	[%l7 + 0x4C],	%l6
loop_1222:
	movvs	%icc,	%o7,	%g7
	membar	0x3D
	faligndata	%f14,	%f26,	%f26
	edge16l	%l3,	%g1,	%i5
	fmul8sux16	%f16,	%f4,	%f2
	add	%o3,	0x06F7,	%l4
	orcc	%i6,	%o4,	%o5
	sdiv	%g4,	0x1766,	%l5
	fcmpne16	%f12,	%f26,	%i2
	fpmerge	%f14,	%f1,	%f18
	movvc	%icc,	%i4,	%g2
	and	%i0,	0x0AC6,	%l2
	umul	%i7,	0x08D9,	%g3
	brlez	%l0,	loop_1223
	ble,a	loop_1224
	movvs	%icc,	%o2,	%g5
	fbue	%fcc2,	loop_1225
loop_1223:
	fble,a	%fcc3,	loop_1226
loop_1224:
	taddcc	%l1,	%i1,	%o0
	fmovrdne	%o6,	%f14,	%f6
loop_1225:
	nop
	fitod	%f6,	%f14
	fdtoi	%f14,	%f15
loop_1226:
	be,a,pn	%xcc,	loop_1227
	tgu	%xcc,	0x5
	fmovrdne	%i3,	%f12,	%f18
	nop
	fitos	%f1,	%f17
	fstox	%f17,	%f2
	fxtos	%f2,	%f24
loop_1227:
	fmovdneg	%xcc,	%f24,	%f7
	fmovdg	%xcc,	%f5,	%f11
	andn	%o1,	%l6,	%g6
	tneg	%icc,	0x3
	array16	%o7,	%l3,	%g7
	brlez,a	%i5,	loop_1228
	bne,a,pt	%xcc,	loop_1229
	ldx	[%l7 + 0x58],	%o3
	fbule	%fcc3,	loop_1230
loop_1228:
	alignaddr	%l4,	%g1,	%o4
loop_1229:
	nop
	setx	loop_1231,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8l	%i6,	%g4,	%l5
loop_1230:
	bvc,pn	%icc,	loop_1232
	bg,a,pt	%icc,	loop_1233
loop_1231:
	movrgz	%o5,	%i4,	%i2
	fmovdvc	%icc,	%f14,	%f2
loop_1232:
	mulscc	%g2,	%i0,	%i7
loop_1233:
	movl	%xcc,	%g3,	%l2
	nop
	setx	loop_1234,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%l0,	%g5,	%o2
	edge16ln	%i1,	%o0,	%l1
	fmuld8sux16	%f23,	%f6,	%f22
loop_1234:
	brz	%o6,	loop_1235
	tvc	%xcc,	0x2
	movvc	%xcc,	%i3,	%o1
	fmovdgu	%icc,	%f13,	%f15
loop_1235:
	edge16n	%l6,	%o7,	%l3
	movgu	%icc,	%g7,	%g6
	fmuld8sux16	%f31,	%f29,	%f26
	tsubcc	%i5,	%o3,	%g1
	bpos	loop_1236
	taddcctv	%l4,	%i6,	%g4
	movne	%icc,	%o4,	%o5
	ld	[%l7 + 0x40],	%f0
loop_1236:
	smulcc	%l5,	0x1AE6,	%i4
	edge32ln	%g2,	%i2,	%i7
	stw	%i0,	[%l7 + 0x74]
	ldsw	[%l7 + 0x0C],	%l2
	tleu	%icc,	0x2
	be,a,pn	%xcc,	loop_1237
	stw	%l0,	[%l7 + 0x54]
	bgu,a,pn	%xcc,	loop_1238
	fmovsa	%xcc,	%f31,	%f8
loop_1237:
	edge16ln	%g5,	%o2,	%g3
	fmovdge	%xcc,	%f14,	%f4
loop_1238:
	tcs	%icc,	0x2
	mova	%xcc,	%o0,	%i1
	edge8l	%o6,	%i3,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l6,	0x1D,	%o1
	edge32l	%l3,	%g7,	%o7
	fbug	%fcc1,	loop_1239
	array16	%g6,	%i5,	%o3
	nop
	setx	0xD501C27E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xE154C907,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f0,	%f18
	ldsh	[%l7 + 0x7C],	%g1
loop_1239:
	umulcc	%l4,	%g4,	%i6
	bg,a,pn	%xcc,	loop_1240
	or	%o4,	0x0AD8,	%o5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x48] %asi,	%i4
loop_1240:
	sdiv	%l5,	0x179B,	%i2
	movge	%icc,	%i7,	%g2
	xorcc	%l2,	0x13FE,	%l0
	mulx	%g5,	0x1769,	%i0
	subc	%g3,	0x091B,	%o0
	fbu	%fcc3,	loop_1241
	fpsub16s	%f23,	%f31,	%f1
	nop
	fitod	%f12,	%f6
	fdtos	%f6,	%f2
	tpos	%xcc,	0x0
loop_1241:
	ba	%xcc,	loop_1242
	ldstub	[%l7 + 0x44],	%i1
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x88,	 0x3
loop_1242:
	tcs	%xcc,	0x0
	movne	%xcc,	%i3,	%l1
	edge32ln	%l6,	%o1,	%o6
	fbu,a	%fcc1,	loop_1243
	movpos	%icc,	%g7,	%l3
	sra	%g6,	0x12,	%i5
	popc	0x189A,	%o3
loop_1243:
	popc	0x0684,	%o7
	umul	%g1,	%l4,	%i6
	ld	[%l7 + 0x0C],	%f16
	movg	%icc,	%o4,	%g4
	movrlz	%o5,	%l5,	%i4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1a0] %asi,	%i7 ripped by fixASI40.pl ripped by fixASI40.pl
	addcc	%i2,	0x0F82,	%l2
	umul	%l0,	%g2,	%i0
	array8	%g3,	%g5,	%i1
	prefetch	[%l7 + 0x24],	 0x3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2E] %asi,	%o2
	edge16ln	%i3,	%o0,	%l6
	fsrc2s	%f15,	%f2
	movle	%icc,	%l1,	%o6
	nop
	setx loop_1244, %l0, %l1
	jmpl %l1, %o1
	array32	%g7,	%g6,	%i5
	edge8	%o3,	%o7,	%l3
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f14
loop_1244:
	array16	%g1,	%i6,	%o4
	fand	%f12,	%f6,	%f12
	tle	%icc,	0x1
	movpos	%icc,	%g4,	%l4
	tneg	%icc,	0x6
	ble	%icc,	loop_1245
	andcc	%l5,	0x0A70,	%o5
	fmovrsgez	%i7,	%f27,	%f26
	edge16l	%i2,	%i4,	%l2
loop_1245:
	fmovdcc	%icc,	%f7,	%f2
	tcc	%icc,	0x7
	xor	%g2,	%l0,	%i0
	set	0x110, %g1
	ldxa	[%g0 + %g1] 0x21,	%g5
	brz	%i1,	loop_1246
	fmul8x16	%f15,	%f24,	%f18
	array16	%g3,	%o2,	%i3
	orncc	%l6,	0x00F1,	%l1
loop_1246:
	movrgz	%o0,	0x20F,	%o6
	movrlez	%o1,	0x3B9,	%g7
	bvc,a,pn	%xcc,	loop_1247
	tvc	%xcc,	0x3
	fpsub32s	%f20,	%f21,	%f31
	edge16n	%g6,	%i5,	%o7
loop_1247:
	movg	%icc,	%o3,	%g1
	mova	%icc,	%i6,	%o4
	ta	%icc,	0x3
	bneg,a,pn	%icc,	loop_1248
	fmovdvs	%icc,	%f7,	%f14
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x19
loop_1248:
	fmovdn	%xcc,	%f23,	%f2
	movleu	%xcc,	%g4,	%l3
	set	0x0D, %o6
	stba	%l5,	[%l7 + %o6] 0x2f
	membar	#Sync
	xor	%l4,	%o5,	%i7
	sllx	%i4,	0x08,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g2,	%l0
	fornot1	%f6,	%f16,	%f16
	edge32ln	%l2,	%g5,	%i0
	ldsb	[%l7 + 0x20],	%i1
	brgez,a	%g3,	loop_1249
	bpos,a	loop_1250
	nop
	setx	0xCBD34EF1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x623361BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f21,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1249:
	nop
	setx	0xF04B565B,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
loop_1250:
	ldstub	[%l7 + 0x28],	%o2
	fxors	%f18,	%f24,	%f0
	fpadd32	%f28,	%f4,	%f10
	fabss	%f24,	%f24
	tsubcc	%l6,	0x1960,	%i3
	ba,a,pn	%xcc,	loop_1251
	ldsb	[%l7 + 0x0D],	%o0
	fpmerge	%f23,	%f13,	%f6
	subcc	%l1,	0x190E,	%o6
loop_1251:
	tg	%xcc,	0x5
	nop
	fitos	%f3,	%f21
	fstox	%f21,	%f24
	fxtos	%f24,	%f22
	movl	%icc,	%g7,	%g6
	tge	%xcc,	0x0
	faligndata	%f6,	%f4,	%f2
	sub	%i5,	%o1,	%o7
	fsrc1s	%f29,	%f31
	nop
	fitod	%f4,	%f0
	fdtos	%f0,	%f24
	tl	%icc,	0x3
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f22
	fxtod	%f22,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o3,	%i6,	%o4
	std	%f30,	[%l7 + 0x30]
	smul	%g4,	0x0FEE,	%l3
	movcs	%icc,	%g1,	%l5
	fbul,a	%fcc1,	loop_1252
	brnz	%o5,	loop_1253
	bgu,pn	%xcc,	loop_1254
	and	%i7,	%l4,	%i4
loop_1252:
	lduh	[%l7 + 0x1C],	%i2
loop_1253:
	move	%xcc,	%g2,	%l2
loop_1254:
	orncc	%l0,	0x0865,	%g5
	fmuld8sux16	%f17,	%f23,	%f12
	xnor	%i1,	%i0,	%o2
	sir	0x08EF
	fbn	%fcc1,	loop_1255
	udiv	%l6,	0x0B8E,	%i3
	nop
	setx loop_1256, %l0, %l1
	jmpl %l1, %o0
	movvs	%xcc,	%g3,	%o6
loop_1255:
	add	%g7,	%l1,	%g6
	set	0x7C, %g2
	ldsha	[%l7 + %g2] 0x10,	%i5
loop_1256:
	tleu	%icc,	0x2
	alignaddrl	%o1,	%o3,	%i6
	tvc	%xcc,	0x6
	fpsub32	%f6,	%f28,	%f2
	stbar
	sllx	%o7,	0x0A,	%g4
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f16
	fxtod	%f16,	%f20
	smul	%o4,	0x0497,	%l3
	andncc	%l5,	%o5,	%g1
	edge16ln	%i7,	%l4,	%i4
	te	%xcc,	0x1
	fbu,a	%fcc0,	loop_1257
	edge16ln	%i2,	%g2,	%l2
	bleu	loop_1258
	edge32	%l0,	%i1,	%i0
loop_1257:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x5
loop_1258:
	sir	0x07BE
	tcc	%xcc,	0x3
	srax	%o2,	%g5,	%l6
	fbl	%fcc3,	loop_1259
	fabss	%f25,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o0,	%g3
loop_1259:
	fble,a	%fcc2,	loop_1260
	tg	%icc,	0x0
	ldd	[%l7 + 0x28],	%o6
	or	%g7,	0x16E1,	%l1
loop_1260:
	call	loop_1261
	nop
	setx	loop_1262,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%g6,	%i3,	%i5
	fornot1s	%f30,	%f27,	%f3
loop_1261:
	nop
	set	0x3C, %i3
	lduwa	[%l7 + %i3] 0x80,	%o1
loop_1262:
	tl	%xcc,	0x3
	orcc	%o3,	0x179E,	%i6
	taddcctv	%g4,	0x0442,	%o7
	lduw	[%l7 + 0x28],	%l3
	fmovdvs	%xcc,	%f24,	%f7
	fones	%f6
	srax	%l5,	%o5,	%g1
	sir	0x010F
	udivcc	%i7,	0x1F7B,	%o4
	subc	%l4,	0x08DB,	%i2
	ld	[%l7 + 0x48],	%f18
	fmovdne	%icc,	%f8,	%f26
	st	%f21,	[%l7 + 0x54]
	nop
	fitod	%f4,	%f4
	fdtox	%f4,	%f8
	nop
	fitos	%f6,	%f16
	fstoi	%f16,	%f13
	fcmpgt32	%f20,	%f0,	%i4
	st	%f3,	[%l7 + 0x44]
	fbu,a	%fcc2,	loop_1263
	movrne	%l2,	%g2,	%i1
	bvs	loop_1264
	tle	%icc,	0x2
loop_1263:
	fsrc1s	%f0,	%f20
	mova	%icc,	%i0,	%o2
loop_1264:
	fpmerge	%f30,	%f25,	%f26
	alignaddrl	%g5,	%l6,	%o0
	fabsd	%f6,	%f10
	mova	%xcc,	%g3,	%l0
	movrgez	%o6,	0x13F,	%l1
	edge8l	%g7,	%g6,	%i5
	movne	%xcc,	%o1,	%o3
	sdivx	%i3,	0x0747,	%g4
	orcc	%o7,	0x04AA,	%i6
	sdiv	%l5,	0x01D2,	%l3
	movvc	%xcc,	%g1,	%o5
	movn	%xcc,	%i7,	%o4
	udivcc	%i2,	0x17DA,	%l4
	tcs	%xcc,	0x1
	movl	%icc,	%l2,	%g2
	sllx	%i1,	0x03,	%i4
	fba,a	%fcc3,	loop_1265
	udiv	%i0,	0x0259,	%g5
	move	%xcc,	%l6,	%o0
	edge16n	%g3,	%o2,	%l0
loop_1265:
	fzero	%f30
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	edge16	%g7,	%g6,	%l1
	fnands	%f1,	%f17,	%f12
	wr	%g0,	0xeb,	%asi
	stha	%o1,	[%l7 + 0x0E] %asi
	membar	#Sync
	membar	0x7B
	edge8ln	%o3,	%i5,	%i3
	edge16l	%o7,	%g4,	%i6
	stb	%l5,	[%l7 + 0x4B]
	movcs	%xcc,	%g1,	%l3
	ta	%xcc,	0x6
	edge8n	%o5,	%i7,	%i2
	nop
	set	0x2C, %l3
	prefetch	[%l7 + %l3],	 0x2
	fbl	%fcc3,	loop_1266
	subccc	%o4,	%l2,	%g2
	movvs	%xcc,	%l4,	%i1
	movrgz	%i4,	0x26F,	%i0
loop_1266:
	fnot2s	%f14,	%f30
	fxors	%f21,	%f16,	%f7
	fpsub16	%f28,	%f28,	%f20
	xnor	%l6,	%o0,	%g5
	fmovsn	%xcc,	%f31,	%f5
	bl	loop_1267
	edge16l	%o2,	%g3,	%l0
	subc	%g7,	%g6,	%l1
	movrgez	%o1,	0x08D,	%o3
loop_1267:
	fabss	%f29,	%f3
	set	0x64, %g7
	stwa	%i5,	[%l7 + %g7] 0x11
	fandnot2	%f26,	%f16,	%f16
	addcc	%o6,	%i3,	%g4
	addcc	%o7,	0x06B4,	%l5
	tcc	%xcc,	0x1
	tle	%icc,	0x0
	fmovdneg	%icc,	%f31,	%f15
	add	%i6,	0x1D7B,	%l3
	ld	[%l7 + 0x74],	%f20
	movgu	%icc,	%g1,	%o5
	bne	%xcc,	loop_1268
	move	%xcc,	%i7,	%i2
	fpsub32	%f12,	%f0,	%f24
	movrgez	%l2,	%g2,	%l4
loop_1268:
	fbu,a	%fcc3,	loop_1269
	subccc	%o4,	%i1,	%i0
	fmovsle	%xcc,	%f28,	%f6
	fandnot2s	%f23,	%f13,	%f28
loop_1269:
	te	%xcc,	0x1
	edge16ln	%i4,	%o0,	%l6
	fbl	%fcc3,	loop_1270
	fone	%f22
	sll	%o2,	%g3,	%g5
	movpos	%xcc,	%l0,	%g6
loop_1270:
	alignaddr	%l1,	%o1,	%g7
	nop
	setx	0x16E5B25E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xFE9BBFDA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f10,	%f6
	fmovscc	%icc,	%f22,	%f12
	alignaddrl	%i5,	%o3,	%o6
	fmovrsgz	%i3,	%f28,	%f16
	or	%o7,	0x1B14,	%l5
	fbuge,a	%fcc3,	loop_1271
	tsubcctv	%g4,	0x0B9C,	%l3
	srlx	%i6,	%g1,	%i7
	mova	%xcc,	%o5,	%i2
loop_1271:
	tn	%icc,	0x6
	wr	%g0,	0x80,	%asi
	stwa	%g2,	[%l7 + 0x2C] %asi
	fbg,a	%fcc0,	loop_1272
	swap	[%l7 + 0x20],	%l2
	fbu	%fcc3,	loop_1273
	movn	%xcc,	%l4,	%i1
loop_1272:
	tneg	%icc,	0x0
	array16	%i0,	%i4,	%o0
loop_1273:
	fmul8ulx16	%f22,	%f28,	%f8
	movre	%o4,	0x068,	%o2
	edge32n	%g3,	%g5,	%l6
	movcs	%icc,	%l0,	%g6
	tgu	%icc,	0x0
	fmovdcs	%xcc,	%f5,	%f15
	sdivcc	%l1,	0x077F,	%g7
	ba	loop_1274
	nop
	fitos	%f9,	%f3
	fstox	%f3,	%f30
	fba	%fcc0,	loop_1275
	std	%f30,	[%l7 + 0x38]
loop_1274:
	tn	%icc,	0x2
	set	0x4A, %i7
	ldsba	[%l7 + %i7] 0x14,	%o1
loop_1275:
	fandnot2	%f10,	%f4,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble	%xcc,	loop_1276
	tn	%xcc,	0x0
	set	0x4F, %g5
	ldsba	[%l7 + %g5] 0x19,	%i5
loop_1276:
	bpos	loop_1277
	taddcc	%o3,	%o6,	%o7
	bg	loop_1278
	movn	%xcc,	%l5,	%i3
loop_1277:
	bl,pn	%xcc,	loop_1279
	xnorcc	%g4,	0x1880,	%l3
loop_1278:
	fpadd16	%f28,	%f18,	%f16
	subccc	%g1,	0x1856,	%i7
loop_1279:
	add	%i6,	%o5,	%g2
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf1,	%f0
	movvs	%xcc,	%i2,	%l2
	edge32n	%i1,	%l4,	%i4
	fmovsneg	%icc,	%f31,	%f20
	tle	%xcc,	0x7
	fmul8ulx16	%f10,	%f6,	%f24
	bcs,pt	%xcc,	loop_1280
	ble,a,pn	%icc,	loop_1281
	array32	%o0,	%o4,	%o2
	array16	%g3,	%g5,	%l6
loop_1280:
	array8	%l0,	%i0,	%l1
loop_1281:
	tsubcc	%g6,	%g7,	%o1
	ta	%xcc,	0x4
	edge32ln	%i5,	%o3,	%o7
	fmovsle	%icc,	%f1,	%f25
	tvc	%icc,	0x4
	xnorcc	%l5,	0x0EE8,	%i3
	udivcc	%g4,	0x145A,	%o6
	membar	0x08
	fpmerge	%f15,	%f3,	%f10
	edge32	%l3,	%g1,	%i6
	smul	%o5,	%i7,	%i2
	movrgez	%g2,	0x2E3,	%i1
	fmovspos	%icc,	%f23,	%f11
	fpsub16	%f8,	%f30,	%f26
	nop
	set	0x60, %i6
	prefetch	[%l7 + %i6],	 0x2
	lduw	[%l7 + 0x4C],	%l2
	move	%xcc,	%i4,	%o0
	fmovrsne	%o4,	%f2,	%f10
	sllx	%l4,	%g3,	%o2
	fpsub32	%f30,	%f10,	%f4
	nop
	setx	0xA06D2637,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	subcc	%l6,	0x0BF9,	%l0
	bleu,a,pn	%xcc,	loop_1282
	udivcc	%g5,	0x177E,	%i0
	sdivcc	%l1,	0x1DC7,	%g6
	brlz,a	%o1,	loop_1283
loop_1282:
	orcc	%g7,	0x1CE3,	%i5
	tneg	%xcc,	0x1
	stbar
loop_1283:
	fxors	%f23,	%f18,	%f13
	bleu	%icc,	loop_1284
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o3,	0x07A3,	%o7
	udivx	%l5,	0x0815,	%g4
loop_1284:
	nop
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x2b,	%o6
	fandnot2s	%f16,	%f7,	%f16
	edge32n	%i3,	%l3,	%i6
	movgu	%xcc,	%g1,	%o5
	fbg	%fcc1,	loop_1285
	fxors	%f18,	%f28,	%f18
	movrgez	%i7,	%g2,	%i1
	fornot2s	%f22,	%f14,	%f31
loop_1285:
	edge32n	%l2,	%i4,	%i2
	set	0x10, %o3
	stxa	%o0,	[%l7 + %o3] 0x14
	fones	%f2
	fmovdge	%xcc,	%f22,	%f25
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%g3
	array32	%o2,	%l6,	%l0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x59] %asi,	%g5
	nop
	setx	0xE302BA0515F22B30,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f4
	fmovdg	%xcc,	%f16,	%f6
	fpadd16	%f10,	%f2,	%f8
	fone	%f16
	movne	%icc,	%i0,	%l1
	fble	%fcc1,	loop_1286
	fnands	%f28,	%f10,	%f23
	movne	%xcc,	%l4,	%o1
	srl	%g7,	%i5,	%o3
loop_1286:
	tpos	%icc,	0x2
	brnz,a	%g6,	loop_1287
	movn	%icc,	%l5,	%o7
	sra	%o6,	%i3,	%l3
	brgez	%i6,	loop_1288
loop_1287:
	fmuld8sux16	%f20,	%f12,	%f16
	bl	%xcc,	loop_1289
	fabss	%f17,	%f23
loop_1288:
	xor	%g4,	0x0C96,	%o5
	fmovdneg	%xcc,	%f29,	%f12
loop_1289:
	fandnot1	%f12,	%f0,	%f4
	tge	%xcc,	0x6
	nop
	set	0x1C, %o2
	sth	%i7,	[%l7 + %o2]
	edge32n	%g1,	%g2,	%i1
	set	0x6C, %i4
	stwa	%i4,	[%l7 + %i4] 0xea
	membar	#Sync
	movne	%xcc,	%i2,	%o0
	smulcc	%o4,	%l2,	%o2
	sir	0x12B4
	te	%icc,	0x7
	fmovsvc	%xcc,	%f20,	%f10
	fble	%fcc0,	loop_1290
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x2
	sdiv	%l6,	0x0699,	%g3
loop_1290:
	array32	%l0,	%i0,	%l1
	nop
	fitod	%f19,	%f28
	bcc,a,pn	%xcc,	loop_1291
	xor	%g5,	0x1200,	%o1
	orcc	%g7,	0x030A,	%l4
	call	loop_1292
loop_1291:
	move	%xcc,	%i5,	%o3
	xorcc	%g6,	0x14CD,	%l5
	edge16	%o7,	%i3,	%l3
loop_1292:
	ble,a	%xcc,	loop_1293
	nop
	fitod	%f21,	%f20
	edge32l	%o6,	%g4,	%i6
	edge16	%i7,	%o5,	%g2
loop_1293:
	xor	%g1,	0x12AC,	%i4
	fmovsge	%icc,	%f8,	%f3
	fmovdleu	%icc,	%f13,	%f2
	smulcc	%i1,	0x05FB,	%o0
	udivx	%o4,	0x04E8,	%l2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	tcc	%icc,	0x7
	set	0x62, %g3
	lduba	[%l7 + %g3] 0x19,	%o2
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x11
	bn,a,pt	%icc,	loop_1294
	movneg	%xcc,	%g3,	%l0
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
loop_1294:
	sir	0x1EA2
	fmovdvs	%xcc,	%f30,	%f28
	set	0x2E, %l0
	stba	%l1,	[%l7 + %l0] 0x19
	tn	%xcc,	0x2
	fmovsgu	%icc,	%f28,	%f24
	xnor	%o1,	%g7,	%g5
	addcc	%l4,	0x0677,	%o3
	move	%xcc,	%g6,	%i5
	fandnot1	%f22,	%f20,	%f28
	mulscc	%l5,	%i3,	%l3
	tcc	%xcc,	0x1
	fmovrdlez	%o6,	%f22,	%f8
	tleu	%icc,	0x1
	movrgz	%g4,	0x37D,	%o7
	te	%icc,	0x7
	wr	%g0,	0x19,	%asi
	stha	%i6,	[%l7 + 0x78] %asi
	tcs	%xcc,	0x1
	tsubcc	%i7,	%g2,	%o5
	nop
	setx	0xC887A0BE2D341279,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x7A9A55573B383674,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f12,	%f12
	tsubcctv	%g1,	%i4,	%i1
	fmovdle	%xcc,	%f26,	%f3
	fmul8ulx16	%f12,	%f22,	%f22
	fnor	%f28,	%f8,	%f10
	orn	%o0,	0x1835,	%l2
	movgu	%icc,	%i2,	%o4
	nop
	setx	0x0C0B3455,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x8C880348,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f21,	%f14
	umulcc	%o2,	0x01A9,	%l6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x50] %asi,	%l0
	tg	%xcc,	0x3
	fbn,a	%fcc3,	loop_1295
	array32	%g3,	%i0,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g7,	0x08F7,	%l1
loop_1295:
	bge,a	loop_1296
	tleu	%icc,	0x7
	sdiv	%g5,	0x184B,	%o3
	fbul,a	%fcc2,	loop_1297
loop_1296:
	lduh	[%l7 + 0x6E],	%g6
	udivcc	%i5,	0x0517,	%l4
	fmovdvs	%icc,	%f21,	%f5
loop_1297:
	tsubcctv	%i3,	%l5,	%o6
	edge8ln	%g4,	%o7,	%l3
	fmovsl	%xcc,	%f11,	%f11
	tvs	%xcc,	0x3
	addcc	%i7,	0x0E43,	%i6
	andncc	%g2,	%g1,	%o5
	fnor	%f12,	%f2,	%f6
	nop
	fitos	%f0,	%f28
	fstod	%f28,	%f14
	fexpand	%f22,	%f18
	set	0x14, %i0
	lduha	[%l7 + %i0] 0x88,	%i4
	sra	%i1,	0x1A,	%o0
	fbul,a	%fcc2,	loop_1298
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f14
	fxtod	%f14,	%f10
	sth	%i2,	[%l7 + 0x44]
	stbar
loop_1298:
	sethi	0x1F68,	%o4
	fmovdleu	%xcc,	%f24,	%f28
	fbuge,a	%fcc1,	loop_1299
	edge32	%l2,	%o2,	%l6
	fmovsvs	%xcc,	%f1,	%f6
	movne	%xcc,	%g3,	%l0
loop_1299:
	nop
	set	0x3F, %o0
	ldsba	[%l7 + %o0] 0x15,	%o1
	ldstub	[%l7 + 0x55],	%g7
	ldsw	[%l7 + 0x7C],	%l1
	fmul8x16au	%f21,	%f23,	%f22
	udiv	%i0,	0x0ED8,	%o3
	fxnor	%f10,	%f26,	%f22
	ldstub	[%l7 + 0x69],	%g6
	edge8ln	%g5,	%i5,	%i3
	tle	%xcc,	0x0
	movrlez	%l4,	%o6,	%g4
	movg	%icc,	%o7,	%l5
	bvc,a,pt	%icc,	loop_1300
	edge8ln	%i7,	%l3,	%g2
	movgu	%xcc,	%g1,	%i6
	movpos	%icc,	%o5,	%i1
loop_1300:
	tneg	%icc,	0x0
	mulx	%i4,	0x001B,	%i2
	fpsub16s	%f2,	%f20,	%f1
	fmovsgu	%xcc,	%f19,	%f23
	array8	%o4,	%l2,	%o0
	edge8	%l6,	%o2,	%g3
	tl	%xcc,	0x4
	edge32n	%o1,	%l0,	%l1
	membar	0x44
	fmovdne	%xcc,	%f6,	%f28
	fandnot2	%f16,	%f12,	%f28
	fmuld8sux16	%f14,	%f30,	%f12
	fxnors	%f16,	%f28,	%f0
	andn	%i0,	%g7,	%o3
	taddcctv	%g6,	0x1509,	%i5
	be,a	%icc,	loop_1301
	fzeros	%f8
	movl	%xcc,	%g5,	%l4
	taddcc	%i3,	%o6,	%g4
loop_1301:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x66] %asi,	%l5
	fbo	%fcc0,	loop_1302
	or	%i7,	0x05EA,	%o7
	fbu	%fcc2,	loop_1303
	tcc	%icc,	0x5
loop_1302:
	umul	%g2,	%g1,	%l3
	nop
	setx	0xAC9A7E1344DCFAAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f2
loop_1303:
	movn	%xcc,	%i6,	%i1
	bne,pt	%xcc,	loop_1304
	movrlez	%i4,	%i2,	%o4
	edge16l	%l2,	%o0,	%o5
	tsubcctv	%l6,	%o2,	%o1
loop_1304:
	srlx	%l0,	%g3,	%i0
	mulscc	%g7,	0x1A86,	%o3
	xnorcc	%g6,	%i5,	%g5
	edge8ln	%l1,	%i3,	%l4
	sra	%o6,	%g4,	%l5
	tcc	%icc,	0x7
	orcc	%o7,	0x0F05,	%g2
	sdivcc	%g1,	0x056C,	%l3
	fzeros	%f9
	udivcc	%i7,	0x0D46,	%i6
	fble	%fcc1,	loop_1305
	brnz,a	%i1,	loop_1306
	andncc	%i4,	%i2,	%l2
	fbn,a	%fcc0,	loop_1307
loop_1305:
	tsubcc	%o4,	0x1CB3,	%o5
loop_1306:
	udivx	%o0,	0x01C0,	%o2
	tpos	%icc,	0x1
loop_1307:
	fmovrdgez	%o1,	%f4,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x4
	tne	%xcc,	0x7
	ld	[%l7 + 0x60],	%f30
	mulscc	%l6,	0x10B6,	%l0
	movle	%icc,	%g3,	%g7
	alignaddrl	%i0,	%o3,	%g6
	nop
	fitos	%f14,	%f21
	fstox	%f21,	%f20
	fxtos	%f20,	%f18
	sth	%g5,	[%l7 + 0x6C]
	bl,a	%xcc,	loop_1308
	fxnors	%f13,	%f13,	%f20
	be,a	loop_1309
	tcs	%icc,	0x3
loop_1308:
	smulcc	%i5,	%l1,	%i3
	mulscc	%l4,	%g4,	%o6
loop_1309:
	sra	%o7,	0x0C,	%l5
	bcc	%xcc,	loop_1310
	fmul8ulx16	%f6,	%f6,	%f14
	fmovsvs	%icc,	%f6,	%f16
	umul	%g1,	%l3,	%g2
loop_1310:
	fmovdge	%icc,	%f14,	%f21
	mulscc	%i6,	%i7,	%i4
	fcmpeq32	%f8,	%f10,	%i1
	fmovsvs	%xcc,	%f7,	%f25
	tgu	%icc,	0x0
	fornot2	%f16,	%f18,	%f2
	fxor	%f16,	%f10,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l2,	0x0E,	%o4
	tleu	%xcc,	0x0
	movne	%xcc,	%o5,	%i2
	mova	%xcc,	%o2,	%o0
	fbg,a	%fcc0,	loop_1311
	and	%o1,	%l0,	%g3
	orncc	%l6,	%i0,	%o3
	alignaddr	%g7,	%g6,	%g5
loop_1311:
	or	%l1,	%i3,	%l4
	fbe,a	%fcc3,	loop_1312
	taddcctv	%g4,	0x0554,	%i5
	fmovrde	%o7,	%f2,	%f4
	bgu	%xcc,	loop_1313
loop_1312:
	sllx	%o6,	0x06,	%l5
	nop
	setx	0x7040A7FD1C334DAF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xE933D4D665FD4911,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f10,	%f16
	wr	%g0,	0x20,	%asi
	stxa	%l3,	[%g0 + 0x0] %asi
loop_1313:
	smulcc	%g2,	0x081A,	%g1
	bcs,pn	%icc,	loop_1314
	smulcc	%i6,	%i7,	%i1
	addccc	%l2,	0x0A41,	%o4
	bge,a,pn	%icc,	loop_1315
loop_1314:
	nop
	setx	0x5C24D3B6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f14
	andn	%o5,	0x014B,	%i4
	movn	%xcc,	%o2,	%o0
loop_1315:
	subccc	%o1,	0x1C8A,	%l0
	ldub	[%l7 + 0x63],	%g3
	nop
	set	0x40, %l4
	ldsh	[%l7 + %l4],	%l6
	fones	%f11
	sir	0x0314
	tne	%icc,	0x4
	fmul8ulx16	%f12,	%f12,	%f20
	tn	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x0
	andcc	%i2,	0x069D,	%i0
	fmovsvc	%icc,	%f16,	%f24
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o3
	movne	%xcc,	%g7,	%g6
	set	0x48, %o1
	ldsba	[%l7 + %o1] 0x18,	%l1
	fmovsvc	%xcc,	%f5,	%f14
	stw	%g5,	[%l7 + 0x7C]
	fbue,a	%fcc0,	loop_1316
	subcc	%l4,	%g4,	%i5
	fandnot2	%f2,	%f24,	%f4
	sub	%o7,	%i3,	%o6
loop_1316:
	fnegd	%f22,	%f20
	sll	%l5,	%g2,	%l3
	sth	%i6,	[%l7 + 0x2E]
	ba	%xcc,	loop_1317
	edge16ln	%i7,	%i1,	%g1
	add	%o4,	%l2,	%i4
	movrgz	%o5,	%o2,	%o1
loop_1317:
	fbe	%fcc1,	loop_1318
	umul	%l0,	0x0B0D,	%o0
	fmovsvs	%icc,	%f25,	%f12
	fones	%f12
loop_1318:
	nop
	setx	0x71CBFF23957A309A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x75354FFA417E8F92,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f14,	%f0
	edge16ln	%l6,	%g3,	%i2
	movne	%icc,	%o3,	%i0
	edge16ln	%g6,	%l1,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l4,	%g4,	%i5
	movle	%icc,	%g7,	%i3
	andncc	%o6,	%o7,	%l5
	addcc	%l3,	%g2,	%i6
	fmovdgu	%icc,	%f7,	%f1
	andcc	%i7,	%i1,	%o4
	movrlez	%l2,	0x2E6,	%i4
	nop
	setx	0x450F0BE67A0385FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x75CF19F1B16C266D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f28,	%f4
	popc	0x103F,	%o5
	tl	%xcc,	0x7
	taddcc	%g1,	0x1864,	%o2
	prefetch	[%l7 + 0x20],	 0x3
	nop
	fitod	%f18,	%f18
	set	0x40, %g6
	lda	[%l7 + %g6] 0x80,	%f6
	tsubcc	%l0,	0x19AE,	%o1
	addc	%o0,	%g3,	%i2
	fmovrdlez	%l6,	%f12,	%f18
	movneg	%xcc,	%o3,	%i0
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x16,	%f0
	array16	%g6,	%g5,	%l1
	edge16	%l4,	%g4,	%g7
	movrgez	%i5,	%o6,	%i3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l5,	%o7
	udivcc	%l3,	0x1ABA,	%g2
	edge32	%i6,	%i7,	%o4
	fbn,a	%fcc0,	loop_1319
	edge32ln	%i1,	%l2,	%i4
	fbg,a	%fcc2,	loop_1320
	bshuffle	%f0,	%f20,	%f26
loop_1319:
	bn,a	%icc,	loop_1321
	fmovrdlz	%o5,	%f28,	%f20
loop_1320:
	nop
	set	0x66, %l2
	stha	%g1,	[%l7 + %l2] 0x88
loop_1321:
	popc	0x00DB,	%o2
	movvs	%icc,	%l0,	%o1
	tg	%xcc,	0x5
	tvs	%xcc,	0x0
	tgu	%xcc,	0x0
	stx	%g3,	[%l7 + 0x70]
	popc	%o0,	%l6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x72] %asi,	%o3
	tsubcctv	%i0,	%g6,	%g5
	andcc	%l1,	%l4,	%i2
	fbne	%fcc3,	loop_1322
	stbar
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%g7,	%i5
loop_1322:
	tgu	%xcc,	0x3
	fornot2s	%f26,	%f18,	%f6
	fnot2s	%f30,	%f21
	movpos	%icc,	%g4,	%i3
	array8	%l5,	%o7,	%o6
	sll	%g2,	0x0B,	%l3
	fmovse	%icc,	%f31,	%f15
	nop
	setx	loop_1323,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%i7,	%i6,	%i1
	fmovsneg	%icc,	%f0,	%f3
	ba,a,pt	%xcc,	loop_1324
loop_1323:
	sll	%l2,	%i4,	%o4
	xnorcc	%o5,	0x077A,	%o2
	fmovdcc	%xcc,	%f2,	%f0
loop_1324:
	nop
	fitod	%f4,	%f0
	fdtos	%f0,	%f23
	fmovsle	%xcc,	%f14,	%f18
	tcs	%xcc,	0x3
	orcc	%g1,	%l0,	%o1
	fornot1	%f2,	%f30,	%f16
	movrlez	%o0,	0x114,	%l6
	set	0x44, %o4
	swapa	[%l7 + %o4] 0x18,	%g3
	tvs	%xcc,	0x7
	add	%i0,	0x1E8C,	%o3
	brnz	%g6,	loop_1325
	call	loop_1326
	bgu,pn	%xcc,	loop_1327
	subccc	%g5,	%l1,	%i2
loop_1325:
	movrne	%g7,	0x354,	%l4
loop_1326:
	movvc	%icc,	%g4,	%i5
loop_1327:
	fsrc1s	%f2,	%f3
	brgz,a	%l5,	loop_1328
	array16	%i3,	%o6,	%o7
	tg	%icc,	0x4
	orncc	%g2,	%i7,	%i6
loop_1328:
	fpack16	%f24,	%f24
	andcc	%i1,	0x0137,	%l3
	sra	%l2,	0x01,	%i4
	sdivcc	%o5,	0x1C12,	%o2
	tcs	%icc,	0x1
	sth	%o4,	[%l7 + 0x12]
	popc	%g1,	%o1
	tl	%xcc,	0x2
	srl	%l0,	0x0F,	%l6
	tvs	%icc,	0x2
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x18
	movrne	%o0,	%i0,	%o3
	subc	%g6,	%g3,	%l1
	fors	%f11,	%f29,	%f25
	movrgez	%g5,	0x29A,	%i2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x81,	%g7,	%g4
	ba,a,pt	%xcc,	loop_1329
	subcc	%i5,	%l5,	%l4
	set	0x7A, %l1
	ldsha	[%l7 + %l1] 0x15,	%o6
loop_1329:
	movge	%icc,	%i3,	%o7
	edge32	%i7,	%i6,	%g2
	srlx	%i1,	%l3,	%l2
	tsubcctv	%o5,	%o2,	%i4
	nop
	fitos	%f12,	%f23
	taddcc	%g1,	%o4,	%l0
	xnor	%l6,	0x0507,	%o0
	movcs	%xcc,	%o1,	%i0
	edge32l	%o3,	%g6,	%g3
	array32	%g5,	%i2,	%g7
	nop
	set	0x08, %l6
	std	%f18,	[%l7 + %l6]
	array16	%g4,	%i5,	%l5
	nop
	setx	loop_1330,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%l4,	0x0CB8,	%l1
	udiv	%o6,	0x1539,	%i3
	fmovsvs	%icc,	%f16,	%f17
loop_1330:
	taddcc	%i7,	%i6,	%o7
	fmovrdgz	%i1,	%f28,	%f12
	xnor	%l3,	0x1990,	%l2
	edge32ln	%o5,	%g2,	%o2
	mulx	%g1,	0x1ABD,	%i4
	fbl	%fcc2,	loop_1331
	fsrc1	%f4,	%f4
	fpadd16	%f6,	%f20,	%f24
	st	%f25,	[%l7 + 0x30]
loop_1331:
	movvc	%xcc,	%l0,	%o4
	nop
	fitos	%f7,	%f21
	fstox	%f21,	%f28
	fxtos	%f28,	%f1
	fsrc1s	%f11,	%f15
	ldstub	[%l7 + 0x7A],	%o0
	alignaddr	%l6,	%i0,	%o1
	edge16	%o3,	%g6,	%g3
	movl	%xcc,	%g5,	%g7
	or	%i2,	0x0039,	%i5
	tsubcctv	%l5,	%g4,	%l1
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x70] %asi,	%o6
	ldstub	[%l7 + 0x5B],	%l4
	and	%i7,	%i6,	%o7
	xorcc	%i3,	0x06D9,	%i1
	smul	%l2,	%o5,	%g2
	set	0x48, %g1
	stba	%l3,	[%l7 + %g1] 0xeb
	membar	#Sync
	fmovdleu	%icc,	%f9,	%f28
	tgu	%xcc,	0x0
	nop
	fitos	%f20,	%f17
	stx	%g1,	[%l7 + 0x60]
	sra	%i4,	%l0,	%o2
	fbge	%fcc1,	loop_1332
	fzeros	%f28
	fsrc2s	%f31,	%f24
	nop
	setx	0x62A15DC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x1A2907EA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f29,	%f14
loop_1332:
	tpos	%icc,	0x3
	brz	%o0,	loop_1333
	movrgz	%o4,	%l6,	%i0
	and	%o3,	%o1,	%g3
	sethi	0x04A3,	%g5
loop_1333:
	edge16	%g6,	%i2,	%g7
	movcc	%icc,	%l5,	%i5
	fmovrdgz	%g4,	%f2,	%f2
	sll	%o6,	%l1,	%i7
	tsubcc	%i6,	%l4,	%o7
	nop
	fitos	%f7,	%f23
	fstox	%f23,	%f2
	fxtos	%f2,	%f29
	movcc	%xcc,	%i1,	%i3
	addc	%l2,	0x0ED6,	%g2
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%f26
	edge32	%l3,	%g1,	%o5
	mulscc	%l0,	%i4,	%o0
	movn	%xcc,	%o2,	%l6
	fmuld8sux16	%f23,	%f2,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f28,	%f12,	%f6
	fbu	%fcc2,	loop_1334
	movvs	%icc,	%i0,	%o4
	brlz,a	%o3,	loop_1335
	movvc	%xcc,	%g3,	%g5
loop_1334:
	movcs	%icc,	%o1,	%i2
	add	%g7,	%g6,	%i5
loop_1335:
	nop
	setx	0x13FE22304D3FE532,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xCE42D1B96FF042AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f30,	%f0
	subc	%g4,	0x100B,	%l5
	sllx	%l1,	0x0B,	%o6
	movg	%xcc,	%i7,	%i6
	udivcc	%l4,	0x019F,	%o7
	fbo,a	%fcc0,	loop_1336
	fmul8x16al	%f21,	%f21,	%f0
	fsrc1	%f16,	%f14
	lduh	[%l7 + 0x72],	%i1
loop_1336:
	fcmple32	%f4,	%f6,	%i3
	movl	%xcc,	%l2,	%l3
	sub	%g1,	0x04D5,	%o5
	fmovrsgz	%l0,	%f9,	%f28
	brnz	%i4,	loop_1337
	ba,pn	%xcc,	loop_1338
	tle	%icc,	0x0
	set	0x44, %o6
	lduwa	[%l7 + %o6] 0x89,	%g2
loop_1337:
	smul	%o2,	%l6,	%o0
loop_1338:
	te	%xcc,	0x5
	membar	0x1D
	and	%o4,	%o3,	%i0
	set	0x60, %o7
	stha	%g5,	[%l7 + %o7] 0x80
	fmovdle	%xcc,	%f26,	%f7
	te	%xcc,	0x1
	movg	%icc,	%o1,	%g3
	tn	%icc,	0x6
	fsrc2	%f2,	%f8
	edge32ln	%g7,	%i2,	%i5
	fpmerge	%f23,	%f9,	%f0
	sllx	%g6,	%l5,	%g4
	xorcc	%l1,	%o6,	%i6
	nop
	fitod	%f2,	%f16
	fdtos	%f16,	%f1
	movrlz	%i7,	0x384,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1339
	tvs	%icc,	0x1
	fcmpgt32	%f12,	%f26,	%i1
	mulscc	%i3,	0x1482,	%o7
loop_1339:
	fnot1	%f2,	%f20
	fsrc2s	%f18,	%f31
	tcc	%icc,	0x6
	fblg	%fcc2,	loop_1340
	fmovrdne	%l3,	%f14,	%f4
	movne	%xcc,	%l2,	%o5
	movne	%icc,	%l0,	%g1
loop_1340:
	edge32ln	%i4,	%g2,	%o2
	array8	%l6,	%o4,	%o0
	fmovd	%f16,	%f4
	stbar
	mova	%icc,	%i0,	%g5
	subc	%o3,	%g3,	%g7
	fmovdn	%icc,	%f7,	%f3
	std	%f20,	[%l7 + 0x68]
	edge8	%i2,	%i5,	%g6
	sethi	0x1D49,	%o1
	fmovde	%xcc,	%f30,	%f26
	wr	%g0,	0x89,	%asi
	stwa	%g4,	[%l7 + 0x74] %asi
	movrgz	%l1,	%l5,	%o6
	tpos	%icc,	0x5
	movne	%xcc,	%i7,	%i6
	fmovsleu	%icc,	%f24,	%f12
	tneg	%icc,	0x4
	orcc	%l4,	0x0C60,	%i3
	fmovrdgez	%o7,	%f10,	%f0
	fbge	%fcc2,	loop_1341
	fcmpne32	%f4,	%f26,	%l3
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f2
	fxtod	%f2,	%f6
	membar	0x34
loop_1341:
	ldx	[%l7 + 0x58],	%i1
	mulscc	%l2,	%l0,	%g1
	movrgez	%i4,	0x3B3,	%g2
	lduw	[%l7 + 0x78],	%o2
	bge,a,pt	%xcc,	loop_1342
	ldstub	[%l7 + 0x2E],	%o5
	udiv	%o4,	0x0DF1,	%o0
	movrne	%i0,	%g5,	%l6
loop_1342:
	tpos	%icc,	0x6
	array16	%g3,	%o3,	%g7
	array8	%i2,	%g6,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc0,	loop_1343
	movcc	%xcc,	%g4,	%l1
	fcmple32	%f16,	%f28,	%o1
	tn	%icc,	0x2
loop_1343:
	addcc	%o6,	%l5,	%i7
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%l4
	movvc	%xcc,	%o7,	%i3
	fbue	%fcc0,	loop_1344
	udiv	%l3,	0x1DE1,	%l2
	wr	%g0,	0x22,	%asi
	stwa	%l0,	[%l7 + 0x50] %asi
	membar	#Sync
loop_1344:
	movge	%icc,	%i1,	%i4
	andncc	%g2,	%g1,	%o5
	fmul8x16al	%f25,	%f28,	%f26
	brz	%o4,	loop_1345
	fmovde	%icc,	%f22,	%f30
	fmovse	%icc,	%f21,	%f9
	set	0x38, %g2
	ldswa	[%l7 + %g2] 0x81,	%o2
loop_1345:
	fpack16	%f8,	%f23
	call	loop_1346
	nop
	setx	0x185696556059625E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	orn	%i0,	0x065A,	%o0
	xorcc	%g5,	%g3,	%l6
loop_1346:
	popc	0x1D9A,	%g7
	fmovdleu	%xcc,	%f1,	%f7
	fmovse	%icc,	%f5,	%f24
	umul	%i2,	0x1C64,	%o3
	andncc	%g6,	%i5,	%g4
	orncc	%o1,	%o6,	%l1
	tleu	%xcc,	0x5
	tcs	%xcc,	0x2
	tsubcc	%i7,	%l5,	%l4
	fmul8x16au	%f21,	%f0,	%f6
	sdivx	%i6,	0x1006,	%i3
	tsubcctv	%l3,	0x0604,	%l2
	fcmple16	%f26,	%f28,	%o7
	set	0x12, %l3
	lduha	[%l7 + %l3] 0x14,	%i1
	fbn	%fcc3,	loop_1347
	bne,pn	%xcc,	loop_1348
	fsrc1	%f20,	%f28
	sll	%l0,	%g2,	%g1
loop_1347:
	fbuge,a	%fcc2,	loop_1349
loop_1348:
	for	%f2,	%f26,	%f10
	bpos,a,pn	%icc,	loop_1350
	fbge,a	%fcc0,	loop_1351
loop_1349:
	tge	%icc,	0x6
	tneg	%xcc,	0x5
loop_1350:
	movre	%i4,	0x220,	%o5
loop_1351:
	fandnot2	%f24,	%f28,	%f24
	fbule,a	%fcc2,	loop_1352
	fmovd	%f4,	%f4
	bcs,a	%icc,	loop_1353
	smulcc	%o2,	0x0581,	%i0
loop_1352:
	nop
	setx	0xD46CCD5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x1ECBE55D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f0,	%f27
	fmovrdne	%o4,	%f8,	%f24
loop_1353:
	array32	%g5,	%g3,	%l6
	edge16l	%g7,	%i2,	%o3
	sllx	%o0,	0x1F,	%g6
	movcs	%icc,	%g4,	%o1
	movrgz	%i5,	0x1FC,	%o6
	subccc	%l1,	%l5,	%l4
	brlz	%i7,	loop_1354
	udiv	%i3,	0x0456,	%l3
	fmovsgu	%icc,	%f27,	%f10
	nop
	setx	0x6C5BC1CD33D72F40,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA45F353BB303F98B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f26,	%f28
loop_1354:
	nop
	setx loop_1355, %l0, %l1
	jmpl %l1, %i6
	tgu	%icc,	0x3
	stw	%o7,	[%l7 + 0x64]
	fnegd	%f4,	%f18
loop_1355:
	bpos,a	%xcc,	loop_1356
	srl	%i1,	%l0,	%g2
	tcs	%icc,	0x4
	fxor	%f6,	%f0,	%f20
loop_1356:
	movrlz	%l2,	0x05F,	%g1
	nop
	set	0x28, %i3
	ldstub	[%l7 + %i3],	%i4
	fcmpgt16	%f6,	%f26,	%o5
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x6C] %asi,	%o2
	array32	%o4,	%i0,	%g5
	mulscc	%g3,	%l6,	%g7
	fbne	%fcc1,	loop_1357
	bge,a	loop_1358
	fmovsgu	%xcc,	%f4,	%f19
	lduh	[%l7 + 0x5E],	%o3
loop_1357:
	fmovrslez	%o0,	%f1,	%f22
loop_1358:
	fpsub32s	%f10,	%f24,	%f24
	tpos	%icc,	0x3
	fnot1	%f24,	%f8
	mova	%xcc,	%g6,	%g4
	taddcctv	%o1,	%i2,	%o6
	fcmple32	%f14,	%f30,	%i5
	movn	%icc,	%l1,	%l5
	edge16l	%i7,	%i3,	%l3
	movcc	%icc,	%l4,	%o7
	sir	0x18A7
	movvc	%icc,	%i6,	%l0
	stbar
	smulcc	%g2,	0x0135,	%i1
	te	%icc,	0x0
	andncc	%l2,	%g1,	%i4
	call	loop_1359
	or	%o5,	%o4,	%o2
	movn	%icc,	%i0,	%g3
	fbug,a	%fcc0,	loop_1360
loop_1359:
	fnand	%f26,	%f2,	%f16
	edge32n	%l6,	%g5,	%g7
	fbne	%fcc0,	loop_1361
loop_1360:
	addccc	%o3,	%g6,	%g4
	edge8	%o0,	%o1,	%i2
	edge8l	%i5,	%l1,	%l5
loop_1361:
	xnor	%o6,	0x0467,	%i7
	set	0x08, %i7
	stha	%i3,	[%l7 + %i7] 0x14
	ldstub	[%l7 + 0x57],	%l3
	movpos	%xcc,	%o7,	%l4
	fmovrdgez	%i6,	%f8,	%f26
	fbu	%fcc0,	loop_1362
	movrlez	%l0,	%i1,	%l2
	smul	%g2,	0x1E0A,	%i4
	set	0x52, %g5
	ldsba	[%l7 + %g5] 0x19,	%g1
loop_1362:
	fmovdg	%icc,	%f17,	%f12
	fzeros	%f21
	fandnot2	%f30,	%f8,	%f8
	stw	%o5,	[%l7 + 0x2C]
	array32	%o4,	%o2,	%g3
	movrgz	%i0,	%l6,	%g5
	subccc	%o3,	%g7,	%g4
	fzero	%f10
	nop
	fitos	%f8,	%f8
	fstod	%f8,	%f24
	swap	[%l7 + 0x58],	%o0
	fbuge,a	%fcc2,	loop_1363
	fmovdle	%xcc,	%f25,	%f10
	movgu	%icc,	%g6,	%i2
	tneg	%xcc,	0x6
loop_1363:
	brgz,a	%i5,	loop_1364
	smulcc	%o1,	0x12DD,	%l5
	subccc	%o6,	%l1,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1364:
	fbl	%fcc3,	loop_1365
	sir	0x07CB
	tvc	%xcc,	0x7
	edge32n	%l3,	%i3,	%l4
loop_1365:
	brlz	%o7,	loop_1366
	nop
	setx	0x7F2583F50CA41B59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f22
	srlx	%i6,	%i1,	%l2
	ldstub	[%l7 + 0x17],	%l0
loop_1366:
	fmovdl	%icc,	%f24,	%f2
	movle	%icc,	%g2,	%i4
	sir	0x1242
	xnorcc	%g1,	0x1746,	%o5
	udivcc	%o4,	0x0FE2,	%o2
	movle	%icc,	%i0,	%l6
	lduh	[%l7 + 0x50],	%g5
	mulscc	%g3,	%o3,	%g7
	fbule	%fcc2,	loop_1367
	edge16	%o0,	%g4,	%i2
	bshuffle	%f2,	%f18,	%f28
	fbe,a	%fcc0,	loop_1368
loop_1367:
	subc	%i5,	%g6,	%o1
	fnot2s	%f24,	%f29
	fmul8x16	%f5,	%f6,	%f26
loop_1368:
	fmovspos	%xcc,	%f16,	%f0
	fbl	%fcc3,	loop_1369
	bl,pt	%icc,	loop_1370
	bge,a	%icc,	loop_1371
	movcs	%xcc,	%l5,	%o6
loop_1369:
	alignaddr	%i7,	%l3,	%i3
loop_1370:
	mulscc	%l4,	%o7,	%i6
loop_1371:
	array16	%l1,	%l2,	%l0
	ld	[%l7 + 0x6C],	%f10
	udivx	%i1,	0x0351,	%g2
	movvs	%xcc,	%i4,	%o5
	movneg	%xcc,	%o4,	%g1
	edge8l	%i0,	%o2,	%l6
	array32	%g3,	%o3,	%g5
	stbar
	nop
	setx	0x6E2F52D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xE9928A3F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f31,	%f26
	movn	%icc,	%g7,	%g4
	fbug,a	%fcc2,	loop_1372
	stx	%o0,	[%l7 + 0x48]
	fbg	%fcc3,	loop_1373
	nop
	setx	0x4075F746,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
loop_1372:
	nop
	set	0x68, %g7
	ldswa	[%l7 + %g7] 0x0c,	%i5
loop_1373:
	ldsw	[%l7 + 0x68],	%g6
	movcs	%icc,	%o1,	%i2
	addcc	%l5,	%o6,	%l3
	move	%icc,	%i7,	%l4
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x70] %asi,	%i2
	fpackfix	%f8,	%f14
	andcc	%o7,	%i6,	%l1
	andn	%l0,	%i1,	%l2
	fpack32	%f18,	%f24,	%f20
	edge16l	%i4,	%o5,	%g2
	movre	%g1,	%o4,	%i0
	fbge	%fcc2,	loop_1374
	edge16	%o2,	%l6,	%o3
	fmovsvs	%icc,	%f2,	%f7
	movle	%icc,	%g3,	%g5
loop_1374:
	bgu,a	loop_1375
	fmovsl	%xcc,	%f20,	%f11
	nop
	set	0x59, %i6
	ldstub	[%l7 + %i6],	%g7
	edge8ln	%o0,	%i5,	%g4
loop_1375:
	fble	%fcc3,	loop_1376
	sir	0x05EB
	tne	%icc,	0x0
	ta	%icc,	0x6
loop_1376:
	andncc	%g6,	%o1,	%i2
	ld	[%l7 + 0x2C],	%f20
	taddcctv	%o6,	0x0B68,	%l5
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x04,	%f16
	mova	%xcc,	%l3,	%i7
	edge8ln	%i3,	%o7,	%i6
	smulcc	%l4,	%l1,	%l0
	movle	%xcc,	%l2,	%i1
	andcc	%i4,	0x02B1,	%o5
	movne	%xcc,	%g2,	%o4
	mulx	%i0,	%g1,	%l6
	taddcctv	%o3,	0x1D69,	%g3
	wr	%g0,	0x0c,	%asi
	stwa	%o2,	[%l7 + 0x60] %asi
	movcs	%icc,	%g7,	%g5
	udiv	%i5,	0x0325,	%g4
	tvc	%icc,	0x5
	fbne,a	%fcc0,	loop_1377
	brz,a	%o0,	loop_1378
	movrlez	%g6,	0x1BB,	%i2
	nop
	fitos	%f0,	%f25
	fstox	%f25,	%f26
	fxtos	%f26,	%f23
loop_1377:
	srax	%o1,	%o6,	%l5
loop_1378:
	movn	%icc,	%i7,	%i3
	mulscc	%l3,	%o7,	%l4
	movpos	%icc,	%l1,	%l0
	movn	%icc,	%i6,	%i1
	fmovrdlez	%l2,	%f4,	%f4
	movrgez	%i4,	0x2CE,	%g2
	movcc	%icc,	%o5,	%i0
	mulx	%g1,	0x1789,	%o4
	tge	%xcc,	0x1
	srax	%l6,	%g3,	%o2
	and	%g7,	%o3,	%g5
	call	loop_1379
	fmovd	%f2,	%f24
	umulcc	%g4,	%o0,	%i5
	fpsub16s	%f20,	%f7,	%f1
loop_1379:
	fcmpgt16	%f4,	%f30,	%g6
	wr	%g0,	0x19,	%asi
	stwa	%o1,	[%l7 + 0x48] %asi
	ld	[%l7 + 0x10],	%f13
	srax	%i2,	%l5,	%o6
	te	%icc,	0x1
	fbu	%fcc2,	loop_1380
	bcs,a	%xcc,	loop_1381
	movne	%xcc,	%i7,	%i3
	fbu,a	%fcc2,	loop_1382
loop_1380:
	fzero	%f8
loop_1381:
	mulx	%l3,	0x0508,	%l4
	bge	%icc,	loop_1383
loop_1382:
	tneg	%icc,	0x6
	array16	%l1,	%o7,	%l0
	sllx	%i1,	0x1F,	%i6
loop_1383:
	orn	%l2,	0x15A3,	%i4
	or	%g2,	%o5,	%g1
	popc	0x12BE,	%o4
	fbl,a	%fcc0,	loop_1384
	taddcctv	%i0,	%l6,	%g3
	fmovsgu	%icc,	%f20,	%f17
	ta	%xcc,	0x0
loop_1384:
	edge16n	%g7,	%o3,	%o2
	tvs	%icc,	0x5
	edge16	%g5,	%g4,	%o0
	brgez,a	%g6,	loop_1385
	fbe	%fcc1,	loop_1386
	nop
	setx	0xC48636949F457353,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f14
	or	%i5,	0x0934,	%i2
loop_1385:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1386:
	movge	%icc,	%o1,	%o6
	movre	%i7,	%l5,	%l3
	fmul8x16au	%f3,	%f30,	%f2
	bvs	%xcc,	loop_1387
	movrgez	%i3,	%l1,	%l4
	movrgz	%o7,	0x2B9,	%i1
	fmovsle	%xcc,	%f9,	%f24
loop_1387:
	sll	%i6,	%l0,	%l2
	tle	%xcc,	0x2
	tsubcctv	%g2,	%i4,	%g1
	be,pt	%icc,	loop_1388
	orncc	%o5,	%i0,	%o4
	edge16n	%g3,	%l6,	%o3
	edge16l	%o2,	%g7,	%g4
loop_1388:
	nop
	set	0x4A, %o3
	ldsha	[%l7 + %o3] 0x19,	%g5
	array8	%o0,	%i5,	%g6
	and	%o1,	0x0467,	%i2
	bne,a	%icc,	loop_1389
	tcc	%xcc,	0x4
	sra	%o6,	%l5,	%i7
	fbul	%fcc3,	loop_1390
loop_1389:
	mulscc	%l3,	0x0DFC,	%i3
	fpack32	%f22,	%f26,	%f26
	stw	%l4,	[%l7 + 0x44]
loop_1390:
	movg	%xcc,	%l1,	%o7
	fmovda	%icc,	%f17,	%f27
	xor	%i1,	0x135F,	%i6
	move	%xcc,	%l0,	%g2
	wr	%g0,	0x10,	%asi
	sta	%f8,	[%l7 + 0x2C] %asi
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tl	%xcc,	0x0
	movrne	%i4,	0x0C3,	%l2
	popc	%o5,	%g1
	fmovde	%icc,	%f10,	%f17
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x81,	%i0,	%o4
	bcc,a,pn	%xcc,	loop_1391
	fmovscs	%xcc,	%f11,	%f14
	fbe,a	%fcc0,	loop_1392
	and	%l6,	%o3,	%g3
loop_1391:
	nop
	fitod	%f6,	%f10
	fdtoi	%f10,	%f13
	subc	%g7,	0x1A1E,	%g4
loop_1392:
	movpos	%icc,	%o2,	%g5
	stx	%i5,	[%l7 + 0x38]
	addcc	%o0,	0x102D,	%g6
	fmovd	%f28,	%f6
	subcc	%o1,	0x1C6E,	%i2
	fcmpgt32	%f24,	%f30,	%o6
	tpos	%xcc,	0x3
	addcc	%i7,	0x1263,	%l5
	nop
	setx	0x60408DF1,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	sllx	%l3,	0x16,	%i3
	fmovdleu	%icc,	%f31,	%f27
	tsubcctv	%l4,	%o7,	%i1
	lduw	[%l7 + 0x60],	%i6
	fmovsvc	%icc,	%f5,	%f22
	movrgez	%l1,	%g2,	%i4
	alignaddr	%l2,	%o5,	%l0
	array32	%g1,	%i0,	%o4
	fmovrdlz	%l6,	%f26,	%f24
	movgu	%xcc,	%o3,	%g7
	tvs	%xcc,	0x1
	tsubcc	%g3,	0x1F1B,	%g4
	movrne	%o2,	0x0CA,	%g5
	umulcc	%i5,	0x114C,	%g6
	movne	%xcc,	%o1,	%i2
	movl	%icc,	%o0,	%o6
	movgu	%icc,	%i7,	%l3
	fmovrslz	%i3,	%f30,	%f21
	stbar
	tcs	%xcc,	0x7
	fbule,a	%fcc3,	loop_1393
	tsubcc	%l4,	0x04A7,	%l5
	fpadd16s	%f25,	%f23,	%f9
	add	%i1,	0x157E,	%o7
loop_1393:
	movn	%icc,	%i6,	%g2
	ldx	[%l7 + 0x20],	%l1
	smulcc	%i4,	0x022F,	%l2
	fsrc1s	%f24,	%f26
	sllx	%l0,	%g1,	%o5
	nop
	setx	0x35253CB4B36D6A7A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xFAFE6A742459A129,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f16,	%f4
	umul	%i0,	0x0AED,	%l6
	edge32	%o4,	%g7,	%o3
	tn	%icc,	0x2
	tsubcctv	%g4,	0x098F,	%g3
	tneg	%xcc,	0x1
	faligndata	%f30,	%f4,	%f12
	mulscc	%g5,	%o2,	%i5
	movrgz	%g6,	%i2,	%o0
	tsubcctv	%o6,	%o1,	%l3
	edge32ln	%i7,	%i3,	%l4
	bneg,a,pn	%icc,	loop_1394
	edge16	%l5,	%i1,	%o7
	bshuffle	%f30,	%f4,	%f12
	movl	%xcc,	%i6,	%l1
loop_1394:
	tge	%xcc,	0x5
	te	%icc,	0x6
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x17
	membar	#Sync
	alignaddr	%g2,	%i4,	%l0
	set	0x64, %i2
	swapa	[%l7 + %i2] 0x19,	%g1
	srlx	%l2,	%o5,	%l6
	fbl,a	%fcc3,	loop_1395
	fbne,a	%fcc3,	loop_1396
	edge8l	%o4,	%g7,	%o3
	ba,a	loop_1397
loop_1395:
	brz	%g4,	loop_1398
loop_1396:
	fpack32	%f18,	%f2,	%f0
	edge8	%i0,	%g5,	%o2
loop_1397:
	nop
	set	0x1C, %i4
	sta	%f18,	[%l7 + %i4] 0x18
loop_1398:
	orncc	%g3,	%g6,	%i2
	taddcctv	%o0,	0x04F4,	%o6
	tleu	%icc,	0x6
	fmovdge	%xcc,	%f22,	%f4
	tsubcc	%i5,	0x0CD2,	%l3
	fmul8x16au	%f22,	%f1,	%f16
	edge32	%o1,	%i7,	%i3
	bl,a,pt	%icc,	loop_1399
	movvc	%xcc,	%l4,	%i1
	fbue	%fcc2,	loop_1400
	sdiv	%o7,	0x0B45,	%i6
loop_1399:
	movne	%xcc,	%l5,	%l1
	nop
	setx	0xD07A98E1,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
loop_1400:
	edge8n	%g2,	%i4,	%g1
	movrgez	%l0,	%o5,	%l2
	movgu	%icc,	%l6,	%g7
	sethi	0x176A,	%o3
	fmovrslez	%o4,	%f29,	%f3
	taddcctv	%g4,	0x1C00,	%g5
	te	%icc,	0x3
	tsubcctv	%o2,	%g3,	%i0
	fmovdneg	%icc,	%f1,	%f18
	fmul8sux16	%f0,	%f24,	%f28
	set	0x21, %g3
	ldstuba	[%l7 + %g3] 0x10,	%i2
	fands	%f2,	%f23,	%f8
	addc	%o0,	0x1DBC,	%g6
	fzeros	%f18
	fpsub32s	%f17,	%f16,	%f17
	tvc	%icc,	0x5
	fmovdcc	%xcc,	%f4,	%f23
	srax	%o6,	%l3,	%o1
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x5C] %asi,	%f12
	ta	%icc,	0x0
	sdiv	%i5,	0x0E17,	%i3
	edge32ln	%l4,	%i1,	%i7
	fmovdvc	%icc,	%f24,	%f9
	tsubcctv	%i6,	%l5,	%l1
	fmul8x16al	%f6,	%f12,	%f24
	edge32ln	%o7,	%g2,	%g1
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x04
	sllx	%i4,	%o5,	%l2
	tg	%icc,	0x3
	fand	%f6,	%f6,	%f28
	fmovdgu	%xcc,	%f7,	%f24
	udivx	%l6,	0x1631,	%l0
	andncc	%o3,	%o4,	%g7
	sra	%g4,	0x13,	%o2
	udivcc	%g5,	0x0BB6,	%g3
	smulcc	%i2,	%i0,	%g6
	stb	%o6,	[%l7 + 0x79]
	sir	0x1F02
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x64] %asi,	%o0
	smulcc	%o1,	%i5,	%l3
	tne	%icc,	0x4
	for	%f30,	%f24,	%f10
	set	0x20, %i0
	prefetcha	[%l7 + %i0] 0x18,	 0x1
	lduw	[%l7 + 0x64],	%i3
	tsubcc	%i7,	%i1,	%i6
	nop
	setx	0xA04BEA54,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	fbne	%fcc2,	loop_1401
	mova	%icc,	%l5,	%o7
	bge	%xcc,	loop_1402
	ldd	[%l7 + 0x40],	%f20
loop_1401:
	movrgz	%l1,	%g2,	%g1
	fmovd	%f26,	%f22
loop_1402:
	bpos	%xcc,	loop_1403
	orn	%o5,	%l2,	%i4
	udivcc	%l0,	0x1385,	%l6
	nop
	fitos	%f7,	%f17
	fstox	%f17,	%f16
loop_1403:
	fble,a	%fcc1,	loop_1404
	fmovsge	%xcc,	%f26,	%f13
	fble,a	%fcc1,	loop_1405
	fabsd	%f4,	%f28
loop_1404:
	movcs	%xcc,	%o3,	%g7
	fpsub16	%f4,	%f28,	%f4
loop_1405:
	sllx	%o4,	0x0F,	%g4
	fcmpgt32	%f0,	%f10,	%o2
	fexpand	%f21,	%f30
	edge16l	%g3,	%i2,	%i0
	xor	%g5,	%o6,	%o0
	set	0x28, %o0
	ldxa	[%l7 + %o0] 0x81,	%g6
	sub	%i5,	0x197E,	%l3
	fbue	%fcc0,	loop_1406
	tgu	%icc,	0x3
	set	0x3C, %l0
	sta	%f13,	[%l7 + %l0] 0x10
loop_1406:
	fbule	%fcc2,	loop_1407
	fornot1s	%f23,	%f1,	%f31
	movg	%icc,	%l4,	%i3
	bleu,a,pn	%icc,	loop_1408
loop_1407:
	fcmpeq16	%f20,	%f16,	%o1
	orcc	%i1,	%i6,	%i7
	fzeros	%f1
loop_1408:
	tne	%icc,	0x0
	fbn,a	%fcc1,	loop_1409
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f20
	fxtod	%f20,	%f10
	udivx	%l5,	0x0339,	%l1
	movre	%g2,	0x09E,	%o7
loop_1409:
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f2
	fxtos	%f2,	%f11
	movrne	%o5,	0x340,	%g1
	sra	%l2,	%l0,	%i4
	xnorcc	%o3,	%l6,	%o4
	set	0x78, %o1
	ldstuba	[%l7 + %o1] 0x10,	%g7
	set	0x28, %g6
	stxa	%o2,	[%l7 + %g6] 0x23
	membar	#Sync
	fexpand	%f4,	%f18
	bneg,a	%icc,	loop_1410
	srl	%g3,	0x13,	%i2
	fmovsvs	%xcc,	%f18,	%f26
	sdivx	%g4,	0x135C,	%i0
loop_1410:
	edge32ln	%o6,	%o0,	%g5
	add	%g6,	%l3,	%l4
	ble	%xcc,	loop_1411
	tgu	%xcc,	0x1
	fbo,a	%fcc2,	loop_1412
	addccc	%i5,	0x06E9,	%o1
loop_1411:
	movgu	%icc,	%i1,	%i6
	tne	%icc,	0x6
loop_1412:
	nop
	fitos	%f30,	%f10
	andn	%i7,	%i3,	%l1
	movn	%icc,	%g2,	%o7
	fmovdleu	%xcc,	%f22,	%f2
	andn	%o5,	%l5,	%l2
	tneg	%icc,	0x2
	tl	%xcc,	0x6
	umulcc	%g1,	%l0,	%o3
	alignaddrl	%i4,	%l6,	%g7
	srlx	%o2,	0x1B,	%g3
	bg	loop_1413
	udivcc	%o4,	0x1AE1,	%g4
	tcs	%xcc,	0x0
	sth	%i0,	[%l7 + 0x5E]
loop_1413:
	srl	%o6,	%i2,	%o0
	array8	%g5,	%g6,	%l4
	movpos	%xcc,	%i5,	%o1
	nop
	setx	0x88055EAC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x29ADF26F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f16,	%f11
	edge32ln	%i1,	%i6,	%l3
	andncc	%i3,	%i7,	%g2
	tneg	%xcc,	0x6
	fmovd	%f26,	%f4
	umul	%o7,	%o5,	%l1
	bvs	loop_1414
	bcs	loop_1415
	umul	%l2,	%l5,	%l0
	movgu	%xcc,	%o3,	%i4
loop_1414:
	umul	%l6,	%g7,	%g1
loop_1415:
	fmovrdgz	%g3,	%f26,	%f24
	umulcc	%o4,	%g4,	%i0
	edge32l	%o2,	%o6,	%i2
	alignaddrl	%g5,	%g6,	%l4
	array32	%o0,	%i5,	%o1
	stw	%i6,	[%l7 + 0x70]
	fble,a	%fcc1,	loop_1416
	tcc	%xcc,	0x6
	bshuffle	%f20,	%f8,	%f24
	stx	%i1,	[%l7 + 0x20]
loop_1416:
	fbu,a	%fcc3,	loop_1417
	tleu	%xcc,	0x1
	tcs	%icc,	0x3
	mova	%icc,	%i3,	%i7
loop_1417:
	tge	%xcc,	0x4
	tge	%icc,	0x5
	fmovscs	%xcc,	%f30,	%f26
	brlez,a	%l3,	loop_1418
	addccc	%g2,	%o7,	%o5
	sll	%l1,	%l2,	%l0
	fblg	%fcc2,	loop_1419
loop_1418:
	andncc	%o3,	%i4,	%l5
	edge32l	%g7,	%l6,	%g3
	or	%g1,	0x18ED,	%o4
loop_1419:
	edge8n	%i0,	%o2,	%o6
	fbge	%fcc1,	loop_1420
	tsubcc	%g4,	%g5,	%g6
	fors	%f13,	%f25,	%f1
	movcs	%icc,	%l4,	%i2
loop_1420:
	movvc	%xcc,	%i5,	%o0
	movle	%icc,	%i6,	%o1
	fmul8x16al	%f16,	%f25,	%f16
	bvs,a,pn	%icc,	loop_1421
	nop
	setx	0x216B57705629EC08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x7950EAE773BB74B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f14,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i1,	%i3
loop_1421:
	movrlz	%l3,	%g2,	%i7
	fmovdne	%xcc,	%f22,	%f10
	fabss	%f22,	%f20
	fbuge	%fcc1,	loop_1422
	movrne	%o7,	0x121,	%o5
	movvs	%icc,	%l1,	%l0
	smulcc	%o3,	0x1BAC,	%l2
loop_1422:
	fmovrsne	%l5,	%f7,	%f0
	sethi	0x0CCA,	%i4
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x22,	%g6
	nop
	setx	loop_1423,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movl	%icc,	%l6,	%g1
	movrgz	%o4,	%g3,	%o2
	set	0x22, %g4
	stba	%i0,	[%l7 + %g4] 0x0c
loop_1423:
	tle	%icc,	0x3
	std	%f2,	[%l7 + 0x70]
	fpack32	%f20,	%f12,	%f20
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x47] %asi,	%o6
	sllx	%g5,	%g4,	%l4
	tg	%icc,	0x4
	tvc	%xcc,	0x4
	movl	%xcc,	%g6,	%i5
	wr	%g0,	0x80,	%asi
	sta	%f5,	[%l7 + 0x2C] %asi
	te	%icc,	0x3
	nop
	fitos	%f20,	%f11
	sir	0x1A92
	movge	%icc,	%i2,	%i6
	nop
	setx	0xF596C7D47075F847,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	movrlz	%o1,	0x29B,	%o0
	orcc	%i3,	0x194D,	%l3
	ldsw	[%l7 + 0x20],	%g2
	nop
	setx	loop_1424,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot2	%f6,	%f20
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1424:
	addc	%i1,	%i7,	%o7
	fbge	%fcc0,	loop_1425
	edge8l	%o5,	%l0,	%l1
	xor	%o3,	0x148F,	%l2
	andncc	%l5,	%g7,	%l6
loop_1425:
	tle	%icc,	0x2
	fmovsge	%xcc,	%f2,	%f4
	orn	%i4,	%g1,	%o4
	fmovsleu	%icc,	%f26,	%f0
	sdivx	%o2,	0x09FC,	%i0
	bn	%xcc,	loop_1426
	array16	%o6,	%g5,	%g4
	and	%l4,	%g3,	%i5
	tne	%xcc,	0x4
loop_1426:
	fmovdcc	%xcc,	%f11,	%f4
	subcc	%g6,	0x0D50,	%i2
	movrlez	%o1,	%i6,	%i3
	andcc	%l3,	0x0F28,	%o0
	fpack16	%f4,	%f15
	or	%i1,	%i7,	%g2
	movrgez	%o5,	%o7,	%l1
	alignaddrl	%l0,	%l2,	%o3
	nop
	fitod	%f2,	%f0
	fdtox	%f0,	%f6
	movcs	%xcc,	%l5,	%g7
	fsrc1	%f22,	%f20
	movvs	%xcc,	%i4,	%g1
	edge16	%l6,	%o2,	%i0
	fble	%fcc2,	loop_1427
	tvs	%icc,	0x5
	ble,pn	%icc,	loop_1428
	and	%o6,	%g5,	%g4
loop_1427:
	fmovdgu	%icc,	%f2,	%f25
	tcc	%xcc,	0x4
loop_1428:
	fmovdne	%icc,	%f31,	%f8
	fbue	%fcc0,	loop_1429
	subcc	%o4,	%g3,	%l4
	edge16	%i5,	%i2,	%o1
	tvc	%icc,	0x6
loop_1429:
	tgu	%icc,	0x3
	set	0x74, %o4
	stwa	%i6,	[%l7 + %o4] 0x04
	tne	%icc,	0x5
	edge8ln	%g6,	%l3,	%o0
	flush	%l7 + 0x54
	fmovdneg	%icc,	%f5,	%f28
	sub	%i3,	%i1,	%i7
	tvs	%xcc,	0x2
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tsubcc	%o5,	0x0180,	%o7
	fsrc2s	%f1,	%f1
	umulcc	%l1,	%g2,	%l0
	movrlez	%o3,	%l5,	%l2
	fabss	%f5,	%f30
	fsrc2s	%f14,	%f14
	srl	%i4,	%g7,	%g1
	fpackfix	%f12,	%f27
	mova	%icc,	%l6,	%o2
	tsubcctv	%i0,	0x087D,	%o6
	fxnor	%f18,	%f12,	%f2
	nop
	setx	0xF0425767,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	and	%g4,	%g5,	%o4
	sllx	%g3,	0x1E,	%i5
	sra	%l4,	0x16,	%i2
	membar	0x36
	tg	%xcc,	0x3
	stb	%i6,	[%l7 + 0x6F]
	movg	%xcc,	%g6,	%o1
	fmovsgu	%icc,	%f9,	%f5
	fcmpeq32	%f0,	%f28,	%o0
	tle	%icc,	0x6
	movpos	%xcc,	%i3,	%i1
	movrne	%i7,	0x3A6,	%o5
	movrlez	%o7,	%l3,	%l1
	sdiv	%l0,	0x0766,	%g2
	fmovspos	%xcc,	%f4,	%f15
	edge32n	%l5,	%l2,	%i4
	fmovscs	%icc,	%f11,	%f14
	movcs	%xcc,	%o3,	%g1
	edge16ln	%l6,	%o2,	%i0
	movcc	%xcc,	%g7,	%g4
	st	%f8,	[%l7 + 0x08]
	movgu	%xcc,	%o6,	%o4
	orncc	%g5,	%i5,	%l4
	sethi	0x095E,	%g3
	srax	%i2,	%g6,	%i6
	movrne	%o0,	0x33F,	%i3
	tn	%icc,	0x1
	bcs,pt	%xcc,	loop_1430
	fornot1s	%f19,	%f30,	%f2
	andncc	%o1,	%i7,	%i1
	movgu	%icc,	%o7,	%o5
loop_1430:
	fbule	%fcc0,	loop_1431
	fmovdvs	%icc,	%f17,	%f31
	umul	%l1,	%l0,	%l3
	set	0x3F, %o5
	stba	%l5,	[%l7 + %o5] 0x04
loop_1431:
	movvc	%icc,	%l2,	%g2
	ldd	[%l7 + 0x68],	%f16
	xnorcc	%o3,	0x1A41,	%i4
	tl	%xcc,	0x4
	movneg	%xcc,	%l6,	%g1
	fpack32	%f2,	%f18,	%f30
	sll	%i0,	0x14,	%o2
	edge16l	%g4,	%g7,	%o6
	bl,a,pn	%icc,	loop_1432
	andncc	%o4,	%g5,	%l4
	fnot1s	%f19,	%f2
	nop
	setx	0x3AB60537D18EDEE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x4120F514F83C9D9C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f28,	%f8
loop_1432:
	srax	%g3,	%i5,	%i2
	flush	%l7 + 0x68
	stw	%i6,	[%l7 + 0x08]
	tcc	%icc,	0x4
	fbe,a	%fcc1,	loop_1433
	edge8ln	%o0,	%i3,	%o1
	addcc	%g6,	0x085A,	%i7
	popc	0x13D8,	%i1
loop_1433:
	edge8ln	%o7,	%l1,	%l0
	edge8l	%l3,	%o5,	%l5
	sra	%l2,	%o3,	%i4
	nop
	fitod	%f22,	%f12
	fmovdcs	%icc,	%f21,	%f8
	stw	%g2,	[%l7 + 0x70]
	udivcc	%l6,	0x1ADD,	%g1
	smul	%i0,	%g4,	%g7
	sll	%o2,	0x19,	%o6
	movcs	%icc,	%g5,	%o4
	edge32	%l4,	%i5,	%i2
	brz	%i6,	loop_1434
	array16	%g3,	%i3,	%o1
	umul	%g6,	0x1156,	%o0
	movn	%icc,	%i7,	%i1
loop_1434:
	tle	%xcc,	0x2
	wr	%g0,	0x18,	%asi
	stxa	%o7,	[%l7 + 0x58] %asi
	fpsub16	%f24,	%f4,	%f22
	fcmpeq16	%f14,	%f18,	%l1
	brnz,a	%l0,	loop_1435
	sub	%l3,	%l5,	%l2
	fsrc2	%f22,	%f6
	xor	%o3,	0x077B,	%i4
loop_1435:
	nop
	set	0x1C, %l2
	stha	%o5,	[%l7 + %l2] 0x88
	for	%f10,	%f0,	%f12
	fnot2	%f20,	%f24
	orncc	%g2,	0x0C53,	%g1
	bleu,pn	%icc,	loop_1436
	lduh	[%l7 + 0x68],	%i0
	edge16n	%l6,	%g4,	%o2
	tpos	%icc,	0x2
loop_1436:
	fandnot2	%f24,	%f2,	%f10
	fcmpne32	%f26,	%f0,	%g7
	brgez,a	%g5,	loop_1437
	addc	%o4,	0x00B5,	%o6
	ldd	[%l7 + 0x10],	%f26
	bpos,a	loop_1438
loop_1437:
	fbg,a	%fcc1,	loop_1439
	fblg,a	%fcc1,	loop_1440
	sub	%i5,	%l4,	%i2
loop_1438:
	fmovrdgez	%i6,	%f22,	%f20
loop_1439:
	sra	%g3,	%o1,	%g6
loop_1440:
	edge32n	%i3,	%i7,	%o0
	movrgz	%o7,	0x01D,	%i1
	sth	%l1,	[%l7 + 0x3C]
	subc	%l0,	%l5,	%l2
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	stx	%l3,	[%l7 + 0x48]
	umulcc	%i4,	0x18AC,	%o3
	movneg	%icc,	%o5,	%g2
	fmovrde	%i0,	%f10,	%f30
	addc	%l6,	%g4,	%o2
	movcc	%icc,	%g7,	%g1
	swap	[%l7 + 0x44],	%o4
	sllx	%o6,	0x17,	%g5
	ldub	[%l7 + 0x53],	%i5
	nop
	setx	loop_1441,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%xcc,	%l4,	%i6
	brlz,a	%g3,	loop_1442
	movrne	%i2,	0x2F9,	%o1
loop_1441:
	fpadd32	%f16,	%f0,	%f4
	addc	%i3,	%g6,	%i7
loop_1442:
	edge16	%o0,	%i1,	%o7
	sllx	%l1,	0x0D,	%l0
	tvc	%icc,	0x5
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x81,	%l2
	tle	%icc,	0x0
	tg	%icc,	0x0
	movleu	%icc,	%l5,	%l3
	movge	%xcc,	%o3,	%o5
	fbule	%fcc0,	loop_1443
	fbne,a	%fcc0,	loop_1444
	bn	%xcc,	loop_1445
	edge8ln	%g2,	%i0,	%i4
loop_1443:
	fbu,a	%fcc0,	loop_1446
loop_1444:
	subccc	%g4,	%l6,	%g7
loop_1445:
	movrlz	%g1,	0x0F0,	%o4
	fcmpne32	%f12,	%f24,	%o6
loop_1446:
	ba	%icc,	loop_1447
	movvc	%xcc,	%o2,	%g5
	fpackfix	%f6,	%f7
	fpsub16s	%f31,	%f11,	%f19
loop_1447:
	sdivx	%l4,	0x1E9B,	%i6
	tsubcctv	%i5,	%i2,	%g3
	sllx	%i3,	0x09,	%g6
	edge8l	%i7,	%o0,	%o1
	fbu	%fcc2,	loop_1448
	movg	%xcc,	%o7,	%l1
	edge8	%l0,	%l2,	%i1
	te	%icc,	0x3
loop_1448:
	tsubcctv	%l5,	0x0068,	%l3
	and	%o5,	%g2,	%o3
	fbge	%fcc3,	loop_1449
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f26
	movn	%xcc,	%i4,	%i0
	fandnot1s	%f14,	%f24,	%f30
loop_1449:
	fmovsvc	%xcc,	%f31,	%f13
	movrlz	%g4,	%g7,	%g1
	ta	%xcc,	0x2
	edge32ln	%o4,	%l6,	%o6
	movneg	%xcc,	%o2,	%g5
	udivx	%i6,	0x12CD,	%i5
	fmovse	%xcc,	%f18,	%f29
	edge32l	%l4,	%g3,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%i3,	loop_1450
	nop
	fitos	%f0,	%f26
	fstoi	%f26,	%f29
	alignaddr	%g6,	%o0,	%i7
	tne	%xcc,	0x4
loop_1450:
	lduw	[%l7 + 0x58],	%o7
	brnz	%l1,	loop_1451
	mulscc	%l0,	%l2,	%o1
	stbar
	fmovrde	%i1,	%f14,	%f8
loop_1451:
	fmovsg	%xcc,	%f7,	%f28
	fpadd16s	%f31,	%f31,	%f31
	edge8ln	%l5,	%l3,	%o5
	te	%xcc,	0x5
	membar	0x5F
	tle	%icc,	0x5
	ld	[%l7 + 0x60],	%f28
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o3,	%g2
	movg	%xcc,	%i4,	%i0
	tle	%xcc,	0x7
	fmovdgu	%xcc,	%f19,	%f2
	tneg	%icc,	0x7
	xnor	%g4,	%g7,	%o4
	movl	%icc,	%l6,	%g1
	or	%o2,	0x07DA,	%o6
	fpadd32s	%f9,	%f31,	%f15
	bge,a	loop_1452
	fmovrslz	%g5,	%f15,	%f16
	fpackfix	%f26,	%f13
	mulx	%i6,	%i5,	%g3
loop_1452:
	sdivx	%l4,	0x1374,	%i3
	edge32n	%i2,	%o0,	%g6
	move	%xcc,	%o7,	%l1
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xeb,	%i6
	fnegs	%f25,	%f10
	edge32ln	%l2,	%o1,	%i1
	fsrc2	%f20,	%f20
	set	0x4C, %i5
	sta	%f27,	[%l7 + %i5] 0x88
	st	%f15,	[%l7 + 0x38]
	fbg,a	%fcc1,	loop_1453
	fmovdge	%xcc,	%f10,	%f31
	movrgz	%l5,	%l0,	%l3
	udiv	%o3,	0x0E57,	%o5
loop_1453:
	sub	%g2,	%i0,	%g4
	fmovdge	%icc,	%f0,	%f19
	array16	%g7,	%i4,	%o4
	fmovrslz	%g1,	%f0,	%f10
	tg	%icc,	0x4
	fmovsneg	%icc,	%f15,	%f6
	brlz	%l6,	loop_1454
	fxor	%f24,	%f12,	%f12
	edge8l	%o2,	%o6,	%i6
	nop
	setx	0x805C6507,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
loop_1454:
	ldx	[%l7 + 0x10],	%i5
	movrlez	%g5,	%g3,	%l4
	edge32ln	%i3,	%i2,	%g6
	tleu	%icc,	0x1
	movleu	%xcc,	%o7,	%o0
	set	0x78, %g1
	stba	%i7,	[%l7 + %g1] 0x22
	membar	#Sync
	ldd	[%l7 + 0x30],	%f30
	movne	%icc,	%l2,	%o1
	bge,a	%xcc,	loop_1455
	st	%f6,	[%l7 + 0x40]
	fnot1	%f28,	%f14
	fbo,a	%fcc2,	loop_1456
loop_1455:
	stx	%i1,	[%l7 + 0x38]
	std	%f16,	[%l7 + 0x78]
	tsubcc	%l5,	0x0D8C,	%l0
loop_1456:
	ba,a	%icc,	loop_1457
	edge16l	%l3,	%l1,	%o3
	taddcctv	%g2,	%i0,	%o5
	tge	%icc,	0x1
loop_1457:
	movne	%xcc,	%g7,	%g4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x10] %asi,	%f31
	fmovdvc	%xcc,	%f15,	%f6
	srl	%i4,	0x07,	%g1
	call	loop_1458
	sdiv	%o4,	0x127E,	%l6
	nop
	set	0x0C, %o7
	ldsh	[%l7 + %o7],	%o6
	nop
	setx	loop_1459,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1458:
	subc	%i6,	%i5,	%o2
	sethi	0x040A,	%g5
	xor	%l4,	0x18FE,	%i3
loop_1459:
	movle	%xcc,	%g3,	%i2
	fabss	%f10,	%f13
	srlx	%g6,	0x1F,	%o7
	sll	%i7,	%l2,	%o0
	tg	%xcc,	0x5
	fmovse	%icc,	%f0,	%f7
	bpos	loop_1460
	movleu	%icc,	%o1,	%i1
	fbuge,a	%fcc0,	loop_1461
	movcs	%xcc,	%l0,	%l3
loop_1460:
	edge32ln	%l5,	%l1,	%o3
	ldd	[%l7 + 0x70],	%g2
loop_1461:
	srax	%i0,	%g7,	%o5
	taddcc	%g4,	0x0795,	%g1
	smulcc	%o4,	0x0F5B,	%i4
	fnot1s	%f7,	%f27
	umul	%o6,	%l6,	%i5
	movge	%xcc,	%i6,	%g5
	addc	%l4,	0x01DC,	%o2
	stb	%i3,	[%l7 + 0x0D]
	movpos	%xcc,	%i2,	%g6
	orcc	%o7,	%g3,	%l2
	sir	0x15CB
	ldx	[%l7 + 0x48],	%o0
	movrgz	%i7,	%i1,	%l0
	orn	%l3,	0x1234,	%o1
	addc	%l1,	0x1F5E,	%o3
	fbne,a	%fcc2,	loop_1462
	addccc	%l5,	0x0198,	%g2
	movge	%icc,	%i0,	%o5
	edge16	%g7,	%g1,	%o4
loop_1462:
	umulcc	%i4,	0x09FF,	%o6
	tn	%xcc,	0x0
	nop
	set	0x30, %o6
	std	%f22,	[%l7 + %o6]
	bvc,a,pt	%icc,	loop_1463
	udivcc	%g4,	0x0694,	%l6
	edge32l	%i5,	%i6,	%g5
	tcc	%icc,	0x4
loop_1463:
	sdivx	%o2,	0x100A,	%l4
	fmovsgu	%xcc,	%f19,	%f19
	sir	0x1C88
	movcc	%xcc,	%i3,	%g6
	fnot1s	%f14,	%f14
	array16	%o7,	%i2,	%l2
	movle	%xcc,	%o0,	%i7
	ldx	[%l7 + 0x38],	%i1
	bpos,a,pn	%icc,	loop_1464
	fmovdneg	%icc,	%f11,	%f8
	sub	%g3,	%l3,	%o1
	tle	%icc,	0x2
loop_1464:
	movvs	%xcc,	%l0,	%o3
	fmovdcs	%icc,	%f29,	%f7
	fors	%f13,	%f23,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x54],	%l5
	edge8l	%l1,	%g2,	%i0
	move	%xcc,	%o5,	%g1
	fmovsa	%icc,	%f21,	%f22
	lduh	[%l7 + 0x74],	%o4
	fpadd32	%f6,	%f26,	%f22
	nop
	setx	0xAC26D35685C1BCED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x61F87DAA824828AC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f30,	%f6
	nop
	setx	0xB333D0896EA916CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xCC886C53F9DEA1FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f28,	%f22
	sdiv	%g7,	0x0F4D,	%o6
	nop
	fitod	%f15,	%f8
	fbuge	%fcc3,	loop_1465
	xor	%i4,	0x167F,	%g4
	tsubcc	%i5,	0x1BD1,	%i6
	movrlz	%g5,	%o2,	%l4
loop_1465:
	bleu,a,pn	%xcc,	loop_1466
	subcc	%l6,	0x198A,	%g6
	fmovrsne	%o7,	%f7,	%f13
	fmovrde	%i3,	%f22,	%f2
loop_1466:
	te	%icc,	0x6
	movgu	%xcc,	%i2,	%o0
	fmovdne	%xcc,	%f30,	%f17
	fmovsn	%xcc,	%f8,	%f18
	movrne	%l2,	0x213,	%i7
	movrlez	%g3,	%i1,	%o1
	xnorcc	%l0,	0x1CAA,	%o3
	brlz	%l5,	loop_1467
	xnor	%l1,	0x0C43,	%l3
	andncc	%i0,	%g2,	%g1
	srax	%o4,	0x0F,	%o5
loop_1467:
	ldub	[%l7 + 0x68],	%g7
	taddcc	%i4,	0x113F,	%o6
	tn	%icc,	0x2
	set	0x58, %l3
	stxa	%g4,	[%l7 + %l3] 0x10
	array32	%i5,	%g5,	%o2
	sir	0x18C0
	movne	%icc,	%i6,	%l4
	bn,pn	%icc,	loop_1468
	xorcc	%g6,	%l6,	%o7
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%i2
loop_1468:
	movrlz	%l2,	0x070,	%o0
	umulcc	%g3,	%i7,	%o1
	fandnot1	%f28,	%f22,	%f10
	xor	%i1,	0x10ED,	%o3
	subccc	%l5,	0x0EBF,	%l1
	addc	%l0,	%i0,	%g2
	xorcc	%g1,	%o4,	%o5
	array32	%g7,	%i4,	%o6
	smulcc	%g4,	%l3,	%g5
	sethi	0x1846,	%i5
	andncc	%i6,	%o2,	%g6
	movle	%icc,	%l4,	%l6
	bne,pt	%xcc,	loop_1469
	tgu	%xcc,	0x2
	andn	%o7,	%i3,	%i2
	set	0x28, %i3
	prefetcha	[%l7 + %i3] 0x15,	 0x2
loop_1469:
	mulx	%g3,	%i7,	%l2
	alignaddrl	%o1,	%i1,	%l5
	fone	%f2
	fandnot1	%f28,	%f30,	%f26
	set	0x42, %g2
	ldstuba	[%l7 + %g2] 0x81,	%l1
	stb	%o3,	[%l7 + 0x60]
	umul	%i0,	0x0760,	%g2
	tvc	%xcc,	0x3
	fbo	%fcc2,	loop_1470
	xnorcc	%g1,	%l0,	%o5
	fbg,a	%fcc1,	loop_1471
	lduw	[%l7 + 0x3C],	%o4
loop_1470:
	fnors	%f19,	%f13,	%f23
	edge16l	%g7,	%i4,	%o6
loop_1471:
	tcs	%icc,	0x4
	srax	%l3,	%g4,	%i5
	movrlez	%i6,	%o2,	%g5
	lduh	[%l7 + 0x42],	%l4
	umul	%l6,	%g6,	%o7
	set	0x48, %i7
	lduba	[%l7 + %i7] 0x0c,	%i3
	subcc	%i2,	0x0355,	%o0
	ldsb	[%l7 + 0x44],	%g3
	edge8l	%i7,	%l2,	%o1
	fbug,a	%fcc3,	loop_1472
	fbl	%fcc1,	loop_1473
	fnor	%f12,	%f6,	%f18
	brlz,a	%i1,	loop_1474
loop_1472:
	sdivcc	%l5,	0x0107,	%l1
loop_1473:
	fcmple16	%f4,	%f30,	%o3
	fnegd	%f0,	%f4
loop_1474:
	bvc,a	loop_1475
	edge8n	%i0,	%g1,	%g2
	nop
	setx	loop_1476,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot2s	%f29,	%f23,	%f12
loop_1475:
	movneg	%icc,	%o5,	%o4
	srlx	%g7,	0x1D,	%i4
loop_1476:
	tcs	%icc,	0x5
	srax	%o6,	0x0E,	%l3
	or	%l0,	0x1765,	%g4
	edge8n	%i5,	%o2,	%i6
	taddcc	%g5,	%l4,	%l6
	fones	%f19
	subccc	%g6,	0x043B,	%i3
	array8	%i2,	%o7,	%g3
	sdivcc	%o0,	0x173E,	%l2
	orncc	%o1,	0x0478,	%i7
	fmovdl	%icc,	%f18,	%f28
	for	%f10,	%f4,	%f20
	bcs	%xcc,	loop_1477
	edge32ln	%i1,	%l5,	%o3
	movrlz	%i0,	%g1,	%l1
	srax	%o5,	0x03,	%g2
loop_1477:
	st	%f15,	[%l7 + 0x0C]
	sdivx	%o4,	0x1D87,	%g7
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f2
	sra	%i4,	%l3,	%l0
	set	0x0, %g5
	stxa	%g4,	[%g0 + %g5] 0x57
	ldd	[%l7 + 0x08],	%o6
	srax	%i5,	0x0A,	%i6
	tcs	%icc,	0x0
	udivcc	%o2,	0x1D2B,	%g5
	fcmpgt32	%f28,	%f0,	%l6
	sll	%g6,	%l4,	%i2
	ldub	[%l7 + 0x51],	%o7
	edge32l	%g3,	%o0,	%l2
	subc	%o1,	%i3,	%i7
	array8	%i1,	%o3,	%i0
	move	%icc,	%l5,	%g1
	subc	%l1,	%g2,	%o5
	sdiv	%o4,	0x196B,	%i4
	tsubcctv	%l3,	%g7,	%g4
	ldub	[%l7 + 0x32],	%o6
	sdiv	%i5,	0x0F7B,	%i6
	set	0x74, %i6
	lduwa	[%l7 + %i6] 0x14,	%o2
	tneg	%icc,	0x7
	bvs,a	loop_1478
	movvs	%xcc,	%l0,	%g5
	sll	%l6,	%l4,	%g6
	fble,a	%fcc2,	loop_1479
loop_1478:
	bcc,a,pn	%xcc,	loop_1480
	lduw	[%l7 + 0x78],	%o7
	edge32ln	%g3,	%o0,	%l2
loop_1479:
	movne	%icc,	%o1,	%i3
loop_1480:
	move	%xcc,	%i7,	%i2
	fnands	%f5,	%f9,	%f30
	xor	%o3,	%i1,	%i0
	fbul	%fcc2,	loop_1481
	sdiv	%l5,	0x0B6A,	%g1
	fmovdl	%icc,	%f3,	%f4
	edge32n	%l1,	%g2,	%o5
loop_1481:
	tcc	%icc,	0x5
	tvs	%icc,	0x5
	fbg,a	%fcc2,	loop_1482
	tne	%xcc,	0x5
	movl	%xcc,	%o4,	%l3
	and	%g7,	0x0734,	%i4
loop_1482:
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f8
	lduh	[%l7 + 0x28],	%g4
	fmovrslez	%i5,	%f6,	%f12
	nop
	setx	0x86A9D513,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xFB1D4F63,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f4,	%f1
	array16	%i6,	%o6,	%l0
	movgu	%xcc,	%o2,	%l6
	mova	%xcc,	%g5,	%l4
	orn	%o7,	%g3,	%g6
	stb	%l2,	[%l7 + 0x4F]
	nop
	setx loop_1483, %l0, %l1
	jmpl %l1, %o1
	movgu	%xcc,	%i3,	%o0
	fbuge	%fcc0,	loop_1484
	alignaddr	%i7,	%i2,	%i1
loop_1483:
	movleu	%xcc,	%o3,	%l5
	bl,a,pn	%icc,	loop_1485
loop_1484:
	fbge,a	%fcc0,	loop_1486
	nop
	setx	0x596E4DEAF13AFC49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x7B2F1E3CC6B0A697,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f12,	%f16
	edge32	%i0,	%g1,	%g2
loop_1485:
	nop
	setx	0xBE11FF2D1A72932C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD6EEC4421E3C25D5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f20,	%f2
loop_1486:
	edge16n	%l1,	%o4,	%l3
	addc	%o5,	%g7,	%i4
	fmovrslz	%i5,	%f1,	%f25
	tl	%icc,	0x1
	flush	%l7 + 0x1C
	bcc,pt	%xcc,	loop_1487
	nop
	setx	0x223CDD87D04971C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	ldsw	[%l7 + 0x14],	%i6
	fmovdn	%icc,	%f25,	%f17
loop_1487:
	xnor	%g4,	0x06DC,	%o6
	subccc	%l0,	%l6,	%g5
	faligndata	%f4,	%f0,	%f0
	taddcc	%o2,	0x074C,	%l4
	or	%g3,	%o7,	%g6
	subcc	%l2,	0x0061,	%o1
	tcc	%icc,	0x3
	fmovdpos	%icc,	%f10,	%f22
	bneg,a	%xcc,	loop_1488
	tleu	%icc,	0x1
	udivx	%i3,	0x18E7,	%o0
	orn	%i2,	%i1,	%i7
loop_1488:
	stx	%l5,	[%l7 + 0x50]
	fxnor	%f22,	%f20,	%f4
	tle	%xcc,	0x6
	array8	%i0,	%o3,	%g2
	subccc	%g1,	0x0A0A,	%l1
	edge8n	%o4,	%o5,	%g7
	tneg	%icc,	0x4
	orncc	%l3,	0x160D,	%i5
	edge16l	%i6,	%i4,	%o6
	tl	%xcc,	0x1
	srax	%g4,	%l0,	%g5
	tgu	%icc,	0x3
	tcc	%xcc,	0x5
	nop
	fitod	%f6,	%f0
	fdtos	%f0,	%f2
	fcmpeq32	%f12,	%f2,	%l6
	wr	%g0,	0x27,	%asi
	stha	%o2,	[%l7 + 0x24] %asi
	membar	#Sync
	andcc	%l4,	0x1C31,	%g3
	nop
	setx	0xD86E76FF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xB2880EAD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f24,	%f19
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%g6
	movre	%o1,	%i3,	%o0
	bcc,a,pt	%xcc,	loop_1489
	movn	%icc,	%i2,	%l2
	alignaddr	%i1,	%i7,	%i0
	edge16l	%o3,	%l5,	%g1
loop_1489:
	movn	%icc,	%l1,	%g2
	edge32	%o4,	%o5,	%l3
	tneg	%icc,	0x0
	set	0x60, %g7
	sta	%f16,	[%l7 + %g7] 0x11
	bpos,a,pt	%xcc,	loop_1490
	edge16	%g7,	%i5,	%i6
	array32	%o6,	%g4,	%l0
	bne	loop_1491
loop_1490:
	addccc	%i4,	0x01AC,	%g5
	fnegd	%f28,	%f18
	and	%o2,	0x0592,	%l4
loop_1491:
	fmovs	%f15,	%f8
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%l6,	%o7
	fmovse	%icc,	%f7,	%f6
	bn,a	loop_1492
	smul	%g6,	%o1,	%g3
	tl	%icc,	0x6
	bvc,pn	%icc,	loop_1493
loop_1492:
	tg	%xcc,	0x2
	smulcc	%i3,	0x1E93,	%i2
	srl	%o0,	%i1,	%l2
loop_1493:
	movrne	%i0,	0x00C,	%i7
	set	0x12, %i1
	stha	%o3,	[%l7 + %i1] 0x81
	te	%xcc,	0x6
	addcc	%g1,	0x1795,	%l1
	fcmple32	%f24,	%f6,	%l5
	tleu	%icc,	0x0
	bvc,a,pn	%xcc,	loop_1494
	orn	%g2,	%o4,	%o5
	movrgez	%g7,	%i5,	%l3
	nop
	setx	0xC3C96009397CB93B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xC8F3D3477E9587BA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f18,	%f16
loop_1494:
	swap	[%l7 + 0x0C],	%o6
	fmovrslz	%i6,	%f22,	%f31
	edge16l	%l0,	%i4,	%g4
	edge8	%g5,	%l4,	%o2
	orncc	%l6,	%g6,	%o1
	mulx	%g3,	0x091B,	%i3
	te	%xcc,	0x1
	srax	%o7,	%i2,	%i1
	and	%l2,	%o0,	%i7
	subccc	%o3,	%i0,	%g1
	fmuld8ulx16	%f7,	%f23,	%f26
	subc	%l1,	0x065A,	%l5
	set	0x59, %o3
	ldsba	[%l7 + %o3] 0x18,	%o4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x15] %asi,	%g2
	movle	%icc,	%g7,	%o5
	fble	%fcc3,	loop_1495
	movrlz	%i5,	0x2E8,	%l3
	edge8	%i6,	%l0,	%i4
	movcs	%icc,	%o6,	%g5
loop_1495:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	bvs	%icc,	loop_1496
	sdivcc	%o2,	0x19B6,	%l4
	swap	[%l7 + 0x74],	%g6
	movneg	%xcc,	%o1,	%l6
loop_1496:
	sth	%i3,	[%l7 + 0x68]
	movcc	%icc,	%o7,	%i2
	fnor	%f20,	%f24,	%f26
	stbar
	movrlz	%g3,	0x354,	%l2
	move	%icc,	%i1,	%o0
	fmovrdgez	%o3,	%f0,	%f20
	nop
	setx	0x9045224C,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	nop
	setx	0x1D44C4A3180FFFA3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f22
	fcmpeq32	%f24,	%f30,	%i7
	orcc	%i0,	%g1,	%l5
	sdiv	%l1,	0x1978,	%g2
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x11
	fmovdcc	%icc,	%f0,	%f23
	bge,a	loop_1497
	ldstub	[%l7 + 0x2B],	%g7
	nop
	setx	loop_1498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x3
loop_1497:
	taddcc	%o4,	0x162B,	%i5
	ldsb	[%l7 + 0x49],	%l3
loop_1498:
	mulx	%o5,	%i6,	%i4
	be,pt	%xcc,	loop_1499
	mova	%xcc,	%o6,	%g5
	fmovrdgz	%l0,	%f0,	%f0
	nop
	setx	0xB3C9D63AFD81B6F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0B336D93D663F639,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f14,	%f2
loop_1499:
	fmovrslez	%o2,	%f18,	%f12
	be	%icc,	loop_1500
	mulscc	%l4,	%g6,	%g4
	tcs	%icc,	0x7
	udiv	%o1,	0x015B,	%i3
loop_1500:
	sdivx	%l6,	0x1B0D,	%i2
	fsrc1	%f10,	%f28
	fmovda	%xcc,	%f20,	%f29
	andn	%g3,	0x0275,	%o7
	movl	%xcc,	%i1,	%o0
	ldub	[%l7 + 0x3E],	%l2
	xorcc	%o3,	0x1832,	%i0
	fbne	%fcc3,	loop_1501
	fexpand	%f9,	%f16
	call	loop_1502
	nop
	fitod	%f4,	%f12
loop_1501:
	movrgz	%g1,	0x2AB,	%i7
	ble,a	%icc,	loop_1503
loop_1502:
	brgez	%l1,	loop_1504
	call	loop_1505
	bge	loop_1506
loop_1503:
	fmovdvs	%xcc,	%f27,	%f11
loop_1504:
	bleu,a,pt	%xcc,	loop_1507
loop_1505:
	fmul8x16	%f6,	%f30,	%f24
loop_1506:
	bcs,pn	%xcc,	loop_1508
	sdivx	%l5,	0x0964,	%g2
loop_1507:
	bvs,a	loop_1509
	movrlz	%g7,	0x0BA,	%o4
loop_1508:
	nop
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
loop_1509:
	sdivcc	%l3,	0x1D00,	%i6
	movrlz	%i4,	%o6,	%o5
	sdivcc	%g5,	0x026D,	%l0
	andncc	%l4,	%g6,	%g4
	tleu	%icc,	0x6
	movrlz	%o2,	%o1,	%l6
	membar	0x13
	tne	%icc,	0x7
	udivcc	%i2,	0x1E5A,	%i3
	fmovdgu	%xcc,	%f26,	%f5
	fsrc2s	%f15,	%f4
	tsubcctv	%g3,	0x1033,	%i1
	fnot2	%f16,	%f12
	stb	%o7,	[%l7 + 0x79]
	prefetch	[%l7 + 0x10],	 0x0
	edge8ln	%l2,	%o0,	%o3
	sllx	%g1,	0x1D,	%i0
	tsubcc	%i7,	%l5,	%g2
	fmovsne	%icc,	%f18,	%f21
	stbar
	tn	%icc,	0x6
	nop
	setx	0xD247426D507B18D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	edge8ln	%g7,	%o4,	%i5
	nop
	setx	loop_1510,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%l3,	%i6,	%l1
	addcc	%o6,	0x1769,	%i4
	set	0x53, %i4
	ldstuba	[%l7 + %i4] 0x0c,	%o5
loop_1510:
	fmovrdlz	%g5,	%f18,	%f18
	orncc	%l0,	%g6,	%l4
	fbue,a	%fcc2,	loop_1511
	xnor	%o2,	%o1,	%l6
	edge8ln	%g4,	%i2,	%g3
	nop
	setx	0x711CE068F759E4E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x73DC659BF6085C80,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f30,	%f28
loop_1511:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i1,	%o7,	%l2
	fmovsn	%xcc,	%f18,	%f13
	movgu	%icc,	%i3,	%o0
	fsrc1s	%f21,	%f26
	fpsub16s	%f23,	%f27,	%f17
	swap	[%l7 + 0x44],	%g1
	tcs	%icc,	0x2
	bgu,a	loop_1512
	xorcc	%i0,	0x0CEA,	%i7
	orn	%o3,	0x0BF4,	%g2
	wr	%g0,	0x80,	%asi
	sta	%f28,	[%l7 + 0x60] %asi
loop_1512:
	st	%f22,	[%l7 + 0x2C]
	srax	%l5,	0x15,	%g7
	array8	%i5,	%l3,	%i6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o4
	fmuld8ulx16	%f19,	%f9,	%f26
	edge32ln	%l1,	%i4,	%o5
	fbuge,a	%fcc1,	loop_1513
	nop
	setx	loop_1514,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitos	%f6,	%f4
	popc	%o6,	%g5
loop_1513:
	fbu	%fcc1,	loop_1515
loop_1514:
	subccc	%g6,	0x074B,	%l4
	nop
	setx	0x2A5DCC3C9080C83A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xEA2FE394CC28EDE2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f28,	%f22
	edge8n	%l0,	%o1,	%l6
loop_1515:
	xnorcc	%g4,	0x16C6,	%i2
	fnand	%f28,	%f12,	%f20
	set	0x54, %i2
	lda	[%l7 + %i2] 0x10,	%f25
	movpos	%icc,	%g3,	%i1
	fors	%f3,	%f3,	%f1
	movn	%icc,	%o2,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x16],	%i3
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x61] %asi,	%o0
	sdiv	%l2,	0x1820,	%g1
	fmovdcs	%icc,	%f28,	%f30
	edge16n	%i7,	%i0,	%g2
	fmovd	%f26,	%f20
	movle	%icc,	%o3,	%g7
	fbuge,a	%fcc2,	loop_1516
	movrlez	%i5,	%l5,	%l3
	ldd	[%l7 + 0x68],	%o4
	lduw	[%l7 + 0x30],	%l1
loop_1516:
	sll	%i4,	0x0C,	%i6
	add	%o6,	%o5,	%g5
	fcmpeq32	%f24,	%f4,	%g6
	tvs	%icc,	0x1
	fpadd16s	%f3,	%f5,	%f19
	fmovdvc	%xcc,	%f16,	%f19
	movrlez	%l4,	%o1,	%l6
	fpadd16s	%f19,	%f16,	%f30
	set	0x08, %l5
	ldsha	[%l7 + %l5] 0x19,	%l0
	tleu	%icc,	0x2
	andncc	%g4,	%i2,	%g3
	taddcctv	%o2,	%i1,	%i3
	udivcc	%o7,	0x139D,	%l2
	alignaddrl	%o0,	%i7,	%g1
	bvs,a	loop_1517
	sll	%g2,	%o3,	%g7
	edge8n	%i5,	%i0,	%l5
	xor	%o4,	%l3,	%l1
loop_1517:
	nop
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x14] %asi,	%f15
	taddcc	%i4,	%o6,	%o5
	srl	%i6,	0x11,	%g6
	fmovsge	%icc,	%f12,	%f29
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x10,	%f0
	smul	%g5,	0x1F1E,	%l4
	edge32l	%l6,	%l0,	%o1
	or	%i2,	%g4,	%o2
	fble,a	%fcc0,	loop_1518
	srl	%g3,	0x00,	%i1
	xnor	%i3,	0x15B5,	%l2
	tle	%xcc,	0x0
loop_1518:
	fmovda	%xcc,	%f15,	%f23
	tn	%icc,	0x6
	lduw	[%l7 + 0x3C],	%o7
	fmovrdgez	%o0,	%f30,	%f6
	alignaddr	%i7,	%g2,	%o3
	edge32	%g7,	%g1,	%i5
	tpos	%icc,	0x5
	smul	%l5,	%i0,	%o4
	srl	%l1,	%l3,	%i4
	nop
	setx	0xA88459B292C56BD0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f12
	set	0x55, %g3
	stba	%o5,	[%l7 + %g3] 0x19
	fsrc2s	%f17,	%f2
	sdivx	%i6,	0x087A,	%o6
	for	%f6,	%f6,	%f4
	fpadd32	%f6,	%f24,	%f8
	edge32ln	%g5,	%l4,	%l6
	brlez	%l0,	loop_1519
	sdivx	%g6,	0x15BD,	%o1
	fmovsleu	%icc,	%f0,	%f9
	fbe,a	%fcc2,	loop_1520
loop_1519:
	nop
	setx	0x0046B22C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	edge16ln	%i2,	%o2,	%g4
	nop
	setx	0xA075549F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
loop_1520:
	srl	%i1,	%i3,	%l2
	array16	%o7,	%g3,	%o0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g2
	set	0x68, %o0
	stwa	%o3,	[%l7 + %o0] 0x18
	membar	0x01
	bge,a,pt	%icc,	loop_1521
	xnorcc	%g7,	0x0599,	%i7
	fmovrsgz	%g1,	%f28,	%f12
	orncc	%l5,	%i5,	%i0
loop_1521:
	movleu	%xcc,	%o4,	%l1
	sdivx	%l3,	0x157D,	%i4
	prefetch	[%l7 + 0x54],	 0x2
	movge	%xcc,	%i6,	%o6
	fornot1s	%f22,	%f9,	%f28
	tl	%xcc,	0x4
	alignaddrl	%o5,	%g5,	%l4
	edge32ln	%l0,	%g6,	%l6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%o1
	smulcc	%i2,	0x0DDD,	%g4
	fmovrdlz	%o2,	%f30,	%f16
	tpos	%xcc,	0x5
	tn	%icc,	0x1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x30] %asi,	%i3
	fmovsgu	%xcc,	%f29,	%f11
	tleu	%icc,	0x1
	fnands	%f2,	%f25,	%f15
	tge	%xcc,	0x4
	fbuge	%fcc1,	loop_1522
	fxor	%f28,	%f6,	%f0
	fmovsvc	%icc,	%f23,	%f18
	movrlz	%l2,	%o7,	%g3
loop_1522:
	fsrc2	%f2,	%f14
	fpack16	%f2,	%f0
	fones	%f2
	tne	%icc,	0x1
	brgz,a	%i1,	loop_1523
	edge32n	%o0,	%o3,	%g2
	edge32ln	%g7,	%g1,	%l5
	add	%i5,	%i7,	%o4
loop_1523:
	brz,a	%l1,	loop_1524
	movn	%xcc,	%i0,	%l3
	ba,a	%xcc,	loop_1525
	ta	%icc,	0x0
loop_1524:
	nop
	setx	loop_1526,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stx	%i4,	[%l7 + 0x78]
loop_1525:
	srlx	%i6,	0x1E,	%o6
	tge	%xcc,	0x5
loop_1526:
	fbg,a	%fcc3,	loop_1527
	fpadd32	%f22,	%f24,	%f28
	orncc	%g5,	%l4,	%o5
	ld	[%l7 + 0x34],	%f0
loop_1527:
	popc	%l0,	%g6
	popc	%l6,	%o1
	andcc	%g4,	%i2,	%o2
	ta	%icc,	0x6
	edge8	%l2,	%o7,	%i3
	alignaddrl	%i1,	%g3,	%o3
	edge16n	%o0,	%g2,	%g7
	andncc	%l5,	%i5,	%i7
	fmovdleu	%icc,	%f3,	%f16
	fmovrsgez	%g1,	%f4,	%f0
	movg	%icc,	%o4,	%l1
	fmovdcc	%icc,	%f28,	%f21
	movvs	%xcc,	%l3,	%i0
	sdiv	%i6,	0x0BA3,	%o6
	movle	%xcc,	%i4,	%g5
	nop
	setx	0x2ED757C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xEFFCBDF1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f10,	%f13
	sllx	%l4,	%l0,	%g6
	orcc	%l6,	%o1,	%o5
	edge16l	%i2,	%o2,	%g4
	or	%l2,	%o7,	%i1
	fxnor	%f12,	%f26,	%f2
	nop
	setx	0xF209641C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xE33E5DBF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f12,	%f6
	fbo	%fcc3,	loop_1528
	udivcc	%i3,	0x1262,	%o3
	be	loop_1529
	edge32l	%o0,	%g2,	%g7
loop_1528:
	stbar
	move	%xcc,	%l5,	%i5
loop_1529:
	udivcc	%g3,	0x0E70,	%g1
	edge16n	%o4,	%l1,	%i7
	mulscc	%i0,	0x0F18,	%i6
	alignaddr	%l3,	%i4,	%o6
	movrne	%g5,	%l0,	%g6
	fbue,a	%fcc0,	loop_1530
	mulscc	%l6,	0x0FB1,	%l4
	ld	[%l7 + 0x44],	%f28
	smulcc	%o1,	%i2,	%o2
loop_1530:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x18,	%g4,	%l2
	ba,a,pn	%xcc,	loop_1531
	sir	0x0509
	fors	%f28,	%f25,	%f26
	orcc	%o7,	0x1643,	%i1
loop_1531:
	tl	%icc,	0x1
	movrlez	%i3,	%o3,	%o5
	fbul	%fcc1,	loop_1532
	fmovrse	%g2,	%f9,	%f15
	brz	%o0,	loop_1533
	tsubcc	%l5,	0x0441,	%g7
loop_1532:
	nop
	setx	0x3F7B667A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x27B467A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f30,	%f31
	set	0x50, %l0
	lduwa	[%l7 + %l0] 0x89,	%g3
loop_1533:
	fble,a	%fcc1,	loop_1534
	fcmpne32	%f28,	%f20,	%g1
	tgu	%xcc,	0x1
	array16	%i5,	%l1,	%i7
loop_1534:
	andncc	%i0,	%o4,	%i6
	move	%icc,	%i4,	%l3
	fbo	%fcc3,	loop_1535
	or	%g5,	0x1D37,	%o6
	bn,a,pt	%icc,	loop_1536
	fandnot1	%f18,	%f0,	%f4
loop_1535:
	movle	%xcc,	%g6,	%l0
	nop
	setx	loop_1537,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1536:
	mulx	%l4,	0x066B,	%l6
	nop
	set	0x2B, %g6
	stb	%i2,	[%l7 + %g6]
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x68] %asi,	%o2
loop_1537:
	nop
	set	0x4C, %l4
	ldstuba	[%l7 + %l4] 0x81,	%o1
	movgu	%icc,	%g4,	%o7
	st	%f23,	[%l7 + 0x54]
	array8	%i1,	%l2,	%o3
	nop
	setx loop_1538, %l0, %l1
	jmpl %l1, %i3
	tge	%xcc,	0x0
	fpackfix	%f24,	%f17
	fnand	%f14,	%f26,	%f6
loop_1538:
	fmovsgu	%icc,	%f13,	%f25
	brz,a	%g2,	loop_1539
	popc	%o5,	%o0
	or	%g7,	0x0DA8,	%g3
	umulcc	%l5,	0x1E89,	%i5
loop_1539:
	nop
	setx	0x356AA18E6D14DD9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc1,	loop_1540
	udivcc	%l1,	0x0787,	%g1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i0
loop_1540:
	umulcc	%i7,	%i6,	%o4
	fbule,a	%fcc3,	loop_1541
	fbo	%fcc2,	loop_1542
	movgu	%icc,	%l3,	%g5
	udivx	%o6,	0x08D4,	%i4
loop_1541:
	fnegs	%f28,	%f17
loop_1542:
	tneg	%xcc,	0x2
	edge16l	%g6,	%l4,	%l6
	tne	%xcc,	0x3
	movrgez	%l0,	0x26E,	%i2
	umulcc	%o1,	0x044B,	%o2
	tcs	%icc,	0x7
	bne,a,pt	%icc,	loop_1543
	fbne,a	%fcc3,	loop_1544
	nop
	fitos	%f27,	%f24
	movvs	%icc,	%g4,	%o7
loop_1543:
	subccc	%i1,	0x13DB,	%o3
loop_1544:
	and	%l2,	0x1A59,	%i3
	andcc	%o5,	%g2,	%g7
	movne	%icc,	%o0,	%l5
	add	%i5,	%g3,	%g1
	ld	[%l7 + 0x5C],	%f5
	movne	%icc,	%i0,	%l1
	bl,a,pt	%xcc,	loop_1545
	nop
	setx	0xCFFB5C1B85D1ED90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x473F2F97058F4F7E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f4,	%f10
	ldd	[%l7 + 0x68],	%i6
	movvs	%icc,	%o4,	%i6
loop_1545:
	sir	0x148B
	srlx	%l3,	%g5,	%o6
	fmovd	%f4,	%f6
	xnor	%i4,	0x16B9,	%l4
	nop
	fitos	%f12,	%f9
	fstox	%f9,	%f8
	fxtos	%f8,	%f10
	nop
	setx	0xF04B45CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	bl,pn	%icc,	loop_1546
	andcc	%l6,	0x1D8F,	%g6
	smul	%i2,	%o1,	%l0
	movrne	%o2,	0x243,	%o7
loop_1546:
	brgz,a	%g4,	loop_1547
	tgu	%xcc,	0x1
	be,pn	%xcc,	loop_1548
	movg	%xcc,	%i1,	%l2
loop_1547:
	fmovdle	%icc,	%f18,	%f11
	xorcc	%i3,	0x0DCE,	%o5
loop_1548:
	udiv	%g2,	0x027E,	%o3
	tpos	%icc,	0x2
	bneg,pn	%icc,	loop_1549
	fmovsge	%xcc,	%f19,	%f28
	movrlez	%g7,	%l5,	%o0
	umul	%g3,	0x0213,	%i5
loop_1549:
	udivcc	%g1,	0x1AD6,	%l1
	nop
	fitod	%f4,	%f2
	fdtos	%f2,	%f29
	fbuge	%fcc1,	loop_1550
	orncc	%i0,	0x035D,	%i7
	movrlz	%i6,	0x28C,	%l3
	fpadd16s	%f9,	%f12,	%f20
loop_1550:
	or	%g5,	0x1852,	%o4
	tleu	%xcc,	0x0
	fmul8sux16	%f8,	%f4,	%f24
	nop
	fitos	%f3,	%f20
	fstoi	%f20,	%f1
	sdiv	%o6,	0x0E3C,	%l4
	sllx	%i4,	0x1A,	%g6
	movrgez	%i2,	%o1,	%l6
	addc	%o2,	%l0,	%g4
	membar	0x12
	bne	%xcc,	loop_1551
	fmul8sux16	%f0,	%f16,	%f2
	movl	%xcc,	%o7,	%i1
	fmovdg	%icc,	%f13,	%f0
loop_1551:
	fpsub32s	%f21,	%f5,	%f12
	udivx	%l2,	0x1A99,	%o5
	bge,pn	%icc,	loop_1552
	fabss	%f21,	%f14
	edge8n	%g2,	%i3,	%o3
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
loop_1552:
	sdivcc	%l5,	0x1F84,	%g3
	orncc	%i5,	%g1,	%o0
	ldsh	[%l7 + 0x58],	%i0
	movrne	%l1,	0x017,	%i7
	fandnot1	%f0,	%f14,	%f6
	bn,a	%xcc,	loop_1553
	fmovsneg	%icc,	%f21,	%f23
	bl,a	loop_1554
	fmovsa	%xcc,	%f25,	%f14
loop_1553:
	alignaddr	%i6,	%l3,	%g5
	andn	%o6,	0x0BDE,	%o4
loop_1554:
	flush	%l7 + 0x30
	andcc	%i4,	0x17CE,	%l4
	edge16	%i2,	%g6,	%o1
	fmovdl	%xcc,	%f30,	%f7
	bcc	%icc,	loop_1555
	sethi	0x06C2,	%o2
	popc	0x15E3,	%l0
	stx	%l6,	[%l7 + 0x48]
loop_1555:
	fsrc1s	%f23,	%f13
	brnz,a	%g4,	loop_1556
	fmovdle	%icc,	%f27,	%f14
	tle	%xcc,	0x3
	brgez,a	%i1,	loop_1557
loop_1556:
	sethi	0x16AD,	%o7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%g2
loop_1557:
	fbl	%fcc0,	loop_1558
	movvs	%xcc,	%i3,	%o3
	edge8n	%g7,	%l2,	%g3
	tcs	%xcc,	0x4
loop_1558:
	edge32n	%i5,	%g1,	%l5
	fmovdgu	%xcc,	%f18,	%f5
	movgu	%xcc,	%o0,	%i0
	nop
	setx	0x9D1F5041,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f9
	subc	%l1,	%i7,	%i6
	edge16	%g5,	%o6,	%l3
	bvc,pt	%icc,	loop_1559
	sll	%i4,	0x08,	%o4
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f9
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x19] %asi,	%l4
loop_1559:
	fnegs	%f1,	%f4
	movg	%icc,	%g6,	%o1
	ldsb	[%l7 + 0x6A],	%o2
	nop
	fitos	%f10,	%f5
	fstox	%f5,	%f4
	fxtos	%f4,	%f10
	fone	%f20
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fcmpeq32	%f18,	%f4,	%l0
	or	%i2,	%l6,	%g4
	xnorcc	%i1,	%o7,	%o5
	movrne	%g2,	0x199,	%o3
	tleu	%xcc,	0x0
	fmovrslz	%i3,	%f20,	%f19
	subcc	%g7,	0x1835,	%g3
	bvs,a	%xcc,	loop_1560
	movrne	%l2,	0x163,	%g1
	andcc	%i5,	%l5,	%o0
	srlx	%l1,	0x0C,	%i7
loop_1560:
	subcc	%i0,	%g5,	%o6
	mulx	%i6,	%i4,	%o4
	set	0x56, %o1
	ldsha	[%l7 + %o1] 0x80,	%l4
	edge32	%l3,	%o1,	%g6
	fmovspos	%xcc,	%f24,	%f11
	fcmpgt32	%f4,	%f20,	%o2
	movrlz	%l0,	%l6,	%g4
	tne	%xcc,	0x4
	xnorcc	%i1,	0x1416,	%o7
	tvs	%xcc,	0x2
	fnands	%f18,	%f18,	%f29
	flush	%l7 + 0x10
	tcc	%xcc,	0x1
	fmovscc	%icc,	%f31,	%f26
	movle	%xcc,	%o5,	%i2
	bg,pn	%xcc,	loop_1561
	edge16ln	%o3,	%i3,	%g2
	fcmple16	%f26,	%f18,	%g3
	movrgez	%l2,	0x2FD,	%g7
loop_1561:
	fands	%f12,	%f26,	%f3
	fmovrsne	%g1,	%f28,	%f26
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x64] %asi,	%l5
	movl	%icc,	%o0,	%l1
	addcc	%i5,	%i0,	%i7
	subc	%g5,	0x0E8C,	%o6
	tn	%icc,	0x6
	ld	[%l7 + 0x14],	%f29
	udiv	%i4,	0x0640,	%o4
	orcc	%i6,	0x1C7D,	%l4
	fbo	%fcc0,	loop_1562
	fmovdcc	%icc,	%f25,	%f14
	brgz	%o1,	loop_1563
	movneg	%xcc,	%g6,	%o2
loop_1562:
	tleu	%icc,	0x4
	nop
	setx	0xB07BB5E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
loop_1563:
	sdiv	%l0,	0x19CB,	%l3
	fmuld8sux16	%f3,	%f10,	%f10
	ba,a	loop_1564
	tleu	%icc,	0x0
	movcc	%icc,	%g4,	%l6
	movleu	%icc,	%i1,	%o7
loop_1564:
	fpackfix	%f4,	%f26
	movleu	%icc,	%i2,	%o3
	movgu	%xcc,	%i3,	%g2
	nop
	set	0x79, %g4
	ldstub	[%l7 + %g4],	%o5
	nop
	fitos	%f5,	%f3
	fstox	%f3,	%f16
	mova	%icc,	%g3,	%l2
	fpmerge	%f20,	%f21,	%f18
	and	%g1,	0x0462,	%l5
	fnand	%f6,	%f26,	%f4
	alignaddrl	%g7,	%o0,	%l1
	tleu	%icc,	0x5
	fmovsne	%xcc,	%f8,	%f20
	fbo,a	%fcc1,	loop_1565
	umulcc	%i5,	0x04A5,	%i0
	movrgez	%i7,	%g5,	%i4
	movpos	%icc,	%o4,	%i6
loop_1565:
	popc	%l4,	%o6
	addccc	%g6,	%o1,	%o2
	udiv	%l3,	0x0342,	%l0
	wr	%g0,	0x2a,	%asi
	stwa	%g4,	[%l7 + 0x08] %asi
	membar	#Sync
	taddcctv	%l6,	0x0D69,	%o7
	edge16	%i2,	%o3,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	edge16	%g2,	%i1,	%g3
	edge32	%l2,	%g1,	%o5
	udivcc	%l5,	0x01F8,	%g7
	ta	%icc,	0x3
	fnands	%f21,	%f0,	%f12
	fbn,a	%fcc1,	loop_1566
	fmovd	%f28,	%f30
	bvc,pt	%xcc,	loop_1567
	andncc	%o0,	%l1,	%i5
loop_1566:
	swap	[%l7 + 0x54],	%i7
	fornot1	%f14,	%f30,	%f10
loop_1567:
	fmovrde	%g5,	%f10,	%f2
	fmovdcs	%xcc,	%f24,	%f2
	wr	%g0,	0x19,	%asi
	stwa	%i4,	[%l7 + 0x34] %asi
	tge	%icc,	0x6
	edge8n	%o4,	%i0,	%i6
	fmovdn	%xcc,	%f0,	%f8
	movneg	%icc,	%o6,	%g6
	nop
	setx	loop_1568,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%l4,	0x1B15,	%o1
	tle	%icc,	0x5
	tpos	%icc,	0x0
loop_1568:
	tge	%xcc,	0x0
	tn	%xcc,	0x7
	fone	%f12
	array32	%o2,	%l0,	%l3
	wr	%g0,	0x88,	%asi
	stha	%g4,	[%l7 + 0x4E] %asi
	andncc	%l6,	%i2,	%o3
	tsubcc	%i3,	%o7,	%g2
	set	0x5C, %o5
	stwa	%g3,	[%l7 + %o5] 0xe3
	membar	#Sync
	nop
	set	0x22, %l2
	sth	%i1,	[%l7 + %l2]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovsa	%icc,	%f30,	%f18
	popc	0x17C2,	%g1
	array8	%l2,	%o5,	%g7
	sllx	%l5,	%l1,	%i5
	srlx	%i7,	0x05,	%o0
	fble,a	%fcc2,	loop_1569
	edge16ln	%i4,	%g5,	%o4
	edge8l	%i0,	%i6,	%o6
	sra	%l4,	0x08,	%g6
loop_1569:
	fpadd32	%f24,	%f2,	%f12
	fbl	%fcc0,	loop_1570
	popc	0x04B0,	%o2
	alignaddr	%o1,	%l0,	%g4
	bpos,pt	%icc,	loop_1571
loop_1570:
	udivx	%l6,	0x14FA,	%i2
	bne	loop_1572
	sdiv	%o3,	0x03E1,	%i3
loop_1571:
	tleu	%icc,	0x6
	call	loop_1573
loop_1572:
	fand	%f22,	%f28,	%f4
	sdivx	%l3,	0x00E2,	%g2
	sub	%o7,	0x1C98,	%g3
loop_1573:
	movg	%xcc,	%g1,	%l2
	udivx	%i1,	0x1B7B,	%g7
	movrgez	%l5,	0x0DE,	%o5
	fnegs	%f4,	%f1
	orn	%i5,	0x1B7C,	%i7
	fsrc1s	%f15,	%f23
	edge8	%o0,	%i4,	%l1
	orcc	%g5,	%o4,	%i0
	movrne	%i6,	0x1A9,	%l4
	fmovsne	%icc,	%f8,	%f3
	edge32	%g6,	%o6,	%o1
	edge8	%o2,	%l0,	%g4
	fsrc1s	%f8,	%f22
	movgu	%icc,	%i2,	%o3
	tvs	%xcc,	0x5
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	movvc	%xcc,	%l6,	%g2
	tgu	%xcc,	0x5
	fmul8ulx16	%f4,	%f10,	%f22
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x78] %asi,	%f24
	xor	%l3,	%o7,	%g1
	ta	%xcc,	0x2
	brgz	%g3,	loop_1574
	add	%i1,	%g7,	%l5
	or	%l2,	%i5,	%i7
	fsrc2s	%f6,	%f28
loop_1574:
	fnands	%f3,	%f5,	%f15
	movcc	%icc,	%o5,	%i4
	mulscc	%l1,	%o0,	%g5
	sth	%o4,	[%l7 + 0x36]
	move	%xcc,	%i6,	%l4
	array16	%i0,	%o6,	%g6
	alignaddr	%o2,	%l0,	%g4
	fxnors	%f27,	%f10,	%f31
	subcc	%i2,	0x153F,	%o3
	taddcctv	%i3,	0x0926,	%l6
	orn	%o1,	0x18D5,	%g2
	tgu	%icc,	0x3
	fmovdge	%icc,	%f28,	%f17
	edge16n	%o7,	%g1,	%l3
	fpackfix	%f20,	%f30
	fmovdn	%icc,	%f7,	%f18
	edge16	%g3,	%g7,	%i1
	te	%icc,	0x6
	movrgez	%l5,	0x236,	%l2
	ble,a,pt	%xcc,	loop_1575
	tcs	%xcc,	0x5
	edge16	%i7,	%o5,	%i5
	addc	%i4,	%l1,	%g5
loop_1575:
	mulscc	%o0,	%i6,	%o4
	movpos	%icc,	%l4,	%o6
	ldstub	[%l7 + 0x24],	%i0
	tg	%icc,	0x3
	tvc	%xcc,	0x2
	brgez,a	%g6,	loop_1576
	addcc	%o2,	0x1983,	%l0
	andcc	%g4,	%o3,	%i3
	tgu	%xcc,	0x6
loop_1576:
	prefetch	[%l7 + 0x34],	 0x2
	bpos	%xcc,	loop_1577
	srlx	%l6,	%o1,	%g2
	bn	loop_1578
	movpos	%icc,	%o7,	%g1
loop_1577:
	fmovrsgez	%i2,	%f19,	%f30
	edge32n	%g3,	%l3,	%i1
loop_1578:
	ldx	[%l7 + 0x68],	%g7
	set	0x64, %l6
	lduha	[%l7 + %l6] 0x80,	%l2
	subc	%i7,	%o5,	%i5
	fnands	%f5,	%f24,	%f29
	edge8n	%i4,	%l1,	%g5
	udivcc	%o0,	0x13B6,	%l5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%o4
	fbuge	%fcc0,	loop_1579
	umulcc	%l4,	0x0ADF,	%i6
	or	%o6,	0x1BF6,	%g6
	fandnot1s	%f10,	%f9,	%f31
loop_1579:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o2,	%l0
	tneg	%xcc,	0x4
	udivx	%g4,	0x1EAC,	%i0
	andncc	%o3,	%i3,	%l6
	edge32	%g2,	%o1,	%o7
	fmovrde	%i2,	%f14,	%f30
	movle	%xcc,	%g3,	%g1
	tvc	%xcc,	0x2
	ldx	[%l7 + 0x68],	%l3
	smul	%i1,	%g7,	%l2
	fnands	%f20,	%f7,	%f2
	nop
	setx	0x4079DC43,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	tle	%xcc,	0x2
	edge16n	%o5,	%i5,	%i4
	subccc	%i7,	%g5,	%l1
	edge16n	%o0,	%o4,	%l5
	movcs	%icc,	%i6,	%o6
	wr	%g0,	0x80,	%asi
	stha	%g6,	[%l7 + 0x1E] %asi
	fcmple16	%f10,	%f16,	%l4
	edge8l	%o2,	%g4,	%l0
	ld	[%l7 + 0x14],	%f19
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movrlz	%o3,	0x2CE,	%i3
	subccc	%i0,	%l6,	%g2
	popc	%o7,	%i2
	orcc	%o1,	0x1A4E,	%g3
	tleu	%icc,	0x1
	edge16ln	%g1,	%l3,	%i1
	nop
	setx	0x406873DD,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	umul	%l2,	0x0486,	%g7
	nop
	setx	0x375187BE0073E6A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	edge32l	%i5,	%i4,	%i7
	fbe,a	%fcc2,	loop_1580
	sra	%o5,	0x00,	%l1
	membar	0x6E
	fmovrsgez	%o0,	%f24,	%f4
loop_1580:
	nop
	set	0x62, %o4
	stba	%o4,	[%l7 + %o4] 0x23
	membar	#Sync
	ldsh	[%l7 + 0x58],	%l5
	edge32l	%i6,	%g5,	%o6
	movvc	%icc,	%g6,	%l4
	sll	%g4,	%o2,	%l0
	sdivx	%o3,	0x02AD,	%i0
	fmovsn	%icc,	%f0,	%f7
	popc	%l6,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1581,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%o7,	0x163B,	%i2
	be	%icc,	loop_1582
	bcc,pt	%icc,	loop_1583
loop_1581:
	ldd	[%l7 + 0x40],	%o0
	movcc	%xcc,	%g3,	%g1
loop_1582:
	tsubcc	%l3,	%i1,	%l2
loop_1583:
	movl	%xcc,	%g7,	%i5
	movrlez	%i4,	%i3,	%o5
	te	%icc,	0x4
	array32	%l1,	%i7,	%o0
	fxors	%f5,	%f17,	%f27
	orncc	%l5,	%i6,	%o4
	ldd	[%l7 + 0x18],	%f6
	tvs	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x34],	%o6
	movle	%xcc,	%g5,	%l4
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x88
	taddcctv	%g4,	0x17CB,	%g6
	edge8l	%o2,	%o3,	%i0
	fmovsg	%xcc,	%f31,	%f14
	tvs	%xcc,	0x6
	xorcc	%l0,	%g2,	%o7
	tn	%xcc,	0x7
	stw	%l6,	[%l7 + 0x44]
	tl	%xcc,	0x4
	orn	%i2,	%g3,	%o1
	movleu	%xcc,	%g1,	%i1
	nop
	set	0x58, %g1
	ldd	[%l7 + %g1],	%l2
	edge16l	%l3,	%i5,	%i4
	tcc	%xcc,	0x0
	smul	%g7,	%o5,	%i3
	array16	%i7,	%o0,	%l1
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i6
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%l5
	move	%icc,	%o6,	%o4
	membar	0x6F
	addcc	%l4,	%g5,	%g4
	sub	%o2,	%o3,	%g6
	nop
	setx	0x4A7881D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x057811C5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f8,	%f6
	movgu	%xcc,	%i0,	%g2
	ta	%icc,	0x3
	set	0x60, %o7
	ldxa	[%l7 + %o7] 0x81,	%l0
	fpsub16s	%f18,	%f29,	%f24
	nop
	setx	0x55B3886C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x39642CE6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f20,	%f30
	movpos	%xcc,	%l6,	%o7
	array8	%g3,	%o1,	%g1
	andncc	%i2,	%i1,	%l2
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0xf0
	membar	#Sync
	tleu	%xcc,	0x0
	subc	%i5,	%l3,	%i4
	tvs	%xcc,	0x4
	edge32n	%o5,	%i3,	%i7
	edge16ln	%g7,	%l1,	%i6
	fbl	%fcc2,	loop_1584
	fnot1	%f6,	%f8
	taddcc	%l5,	%o0,	%o4
	fbl,a	%fcc0,	loop_1585
loop_1584:
	movgu	%xcc,	%l4,	%o6
	fmovsleu	%xcc,	%f16,	%f13
	tsubcc	%g4,	%g5,	%o2
loop_1585:
	subcc	%g6,	0x0B9D,	%o3
	fxnor	%f8,	%f30,	%f26
	ba,pt	%icc,	loop_1586
	movrne	%g2,	%i0,	%l0
	addccc	%l6,	%g3,	%o1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1586:
	movl	%icc,	%g1,	%i2
	prefetch	[%l7 + 0x34],	 0x3
	edge32	%o7,	%i1,	%l2
	movne	%icc,	%l3,	%i5
	mulscc	%o5,	0x157F,	%i3
	taddcc	%i7,	%g7,	%l1
	popc	0x116B,	%i6
	sdivcc	%i4,	0x1C8C,	%o0
	fpsub32	%f24,	%f6,	%f8
	srl	%l5,	%l4,	%o4
	xnorcc	%o6,	%g4,	%o2
	set	0x39, %l3
	lduba	[%l7 + %l3] 0x81,	%g5
	mulx	%o3,	%g6,	%g2
	srax	%l0,	%l6,	%i0
	set	0x26, %i3
	ldsha	[%l7 + %i3] 0x10,	%g3
	membar	0x53
	edge8	%g1,	%o1,	%i2
	st	%f2,	[%l7 + 0x18]
	fmovdle	%icc,	%f7,	%f8
	tleu	%icc,	0x5
	fornot1s	%f15,	%f31,	%f9
	movgu	%icc,	%i1,	%l2
	fbue,a	%fcc2,	loop_1587
	faligndata	%f24,	%f10,	%f0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l3,	%o7
loop_1587:
	movn	%xcc,	%i5,	%o5
	tg	%xcc,	0x6
	tn	%xcc,	0x1
	fmovsn	%icc,	%f22,	%f16
	srax	%i3,	%g7,	%l1
	fornot2	%f4,	%f30,	%f24
	movge	%icc,	%i7,	%i4
	call	loop_1588
	edge16l	%o0,	%i6,	%l5
	fands	%f19,	%f15,	%f11
	set	0x44, %l1
	ldswa	[%l7 + %l1] 0x15,	%l4
loop_1588:
	tge	%icc,	0x6
	xor	%o6,	0x0EDD,	%o4
	array32	%o2,	%g5,	%g4
	movn	%icc,	%o3,	%g6
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x100] %asi,	%l0 ripped by fixASI40.pl ripped by fixASI40.pl
	movrlez	%g2,	0x08E,	%i0
	nop
	setx loop_1589, %l0, %l1
	jmpl %l1, %g3
	umulcc	%l6,	%o1,	%g1
	movre	%i1,	%l2,	%l3
	nop
	set	0x54, %g2
	prefetch	[%l7 + %g2],	 0x0
loop_1589:
	tg	%icc,	0x0
	popc	%i2,	%i5
	tcs	%xcc,	0x7
	edge16ln	%o7,	%o5,	%g7
	sub	%i3,	0x0F4F,	%i7
	movleu	%xcc,	%i4,	%l1
	brlez	%i6,	loop_1590
	brz	%o0,	loop_1591
	bgu,a,pt	%icc,	loop_1592
	tsubcc	%l5,	%o6,	%l4
loop_1590:
	ldd	[%l7 + 0x48],	%o2
loop_1591:
	fmovdpos	%icc,	%f21,	%f7
loop_1592:
	and	%o4,	%g5,	%g4
	movpos	%icc,	%o3,	%l0
	bneg,a,pn	%xcc,	loop_1593
	fmovdne	%xcc,	%f10,	%f14
	st	%f8,	[%l7 + 0x68]
	fmovscs	%icc,	%f7,	%f5
loop_1593:
	fsrc1	%f24,	%f24
	movre	%g2,	0x021,	%i0
	edge16n	%g3,	%l6,	%o1
	nop
	setx	loop_1594,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%g6,	0x092,	%g1
	movrgz	%l2,	0x11C,	%i1
	fcmple32	%f18,	%f18,	%i2
loop_1594:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x64] %asi,	%f24
	brlz	%i5,	loop_1595
	tcc	%xcc,	0x6
	bg,a,pt	%icc,	loop_1596
	stb	%l3,	[%l7 + 0x3E]
loop_1595:
	bshuffle	%f22,	%f24,	%f0
	or	%o7,	0x132F,	%g7
loop_1596:
	tn	%icc,	0x5
	edge32	%i3,	%o5,	%i7
	bpos	%xcc,	loop_1597
	subc	%l1,	0x1890,	%i6
	fblg,a	%fcc2,	loop_1598
	fandnot2s	%f24,	%f27,	%f10
loop_1597:
	alignaddr	%i4,	%l5,	%o6
	fmovsge	%xcc,	%f21,	%f0
loop_1598:
	fbuge,a	%fcc1,	loop_1599
	movg	%icc,	%l4,	%o0
	set	0x14, %i7
	sta	%f9,	[%l7 + %i7] 0x11
loop_1599:
	faligndata	%f12,	%f24,	%f4
	edge8l	%o4,	%g5,	%g4
	movgu	%icc,	%o2,	%o3
	tne	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x38] %asi,	%f29
	nop
	setx	0xDDD8873C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xBBF7BFD8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f21,	%f2
	srlx	%l0,	0x1F,	%g2
	movle	%icc,	%i0,	%l6
	tg	%icc,	0x6
	sll	%g3,	0x0F,	%g6
	movrne	%g1,	%l2,	%o1
	fpadd16	%f2,	%f20,	%f6
	xor	%i1,	0x188D,	%i5
	xnor	%l3,	%i2,	%o7
	umul	%i3,	0x0768,	%o5
	tpos	%xcc,	0x1
	brz,a	%g7,	loop_1600
	fba,a	%fcc1,	loop_1601
	movgu	%xcc,	%i7,	%i6
	fnands	%f3,	%f18,	%f27
loop_1600:
	fsrc2	%f10,	%f0
loop_1601:
	fabsd	%f20,	%f2
	smulcc	%i4,	%l5,	%l1
	movrgz	%o6,	%o0,	%l4
	set	0x78, %g5
	stxa	%o4,	[%l7 + %g5] 0x88
	udiv	%g4,	0x1F51,	%o2
	swap	[%l7 + 0x74],	%g5
	umulcc	%o3,	%g2,	%l0
	fbl,a	%fcc1,	loop_1602
	andn	%i0,	%l6,	%g3
	movpos	%icc,	%g1,	%g6
	subcc	%l2,	0x0970,	%i1
loop_1602:
	edge16l	%o1,	%i5,	%i2
	xnorcc	%o7,	0x1315,	%l3
	nop
	fitod	%f6,	%f18
	bleu,a	%xcc,	loop_1603
	tcc	%xcc,	0x0
	ldsw	[%l7 + 0x24],	%i3
	udivx	%o5,	0x0F41,	%i7
loop_1603:
	alignaddr	%g7,	%i6,	%i4
	set	0x08, %g7
	lduwa	[%l7 + %g7] 0x04,	%l5
	movg	%xcc,	%o6,	%o0
	movne	%icc,	%l4,	%l1
	movneg	%xcc,	%o4,	%o2
	edge32ln	%g5,	%g4,	%g2
	fmovdne	%icc,	%f20,	%f9
	fxors	%f16,	%f5,	%f5
	edge16	%l0,	%i0,	%l6
	fcmpgt16	%f18,	%f26,	%g3
	edge16l	%o3,	%g6,	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%i1
	tsubcctv	%o1,	0x0178,	%i5
	fmovrsgez	%i2,	%f12,	%f28
	fcmpeq32	%f8,	%f2,	%o7
	tne	%xcc,	0x6
	fmovsneg	%icc,	%f2,	%f6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x54] %asi,	%i3
	alignaddrl	%l3,	%i7,	%o5
	tcs	%icc,	0x3
	nop
	setx	loop_1604,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%g7,	%i4,	%i6
	bne,a,pn	%icc,	loop_1605
	tneg	%icc,	0x6
loop_1604:
	edge16l	%o6,	%l5,	%o0
	set	0x51, %i1
	lduba	[%l7 + %i1] 0x80,	%l4
loop_1605:
	nop
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%l1
	fmovsvc	%xcc,	%f27,	%f11
	fmovsle	%icc,	%f3,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%o4,	loop_1606
	fsrc1s	%f22,	%f3
	andcc	%g5,	0x1707,	%g4
	ldsh	[%l7 + 0x4C],	%o2
loop_1606:
	movvs	%xcc,	%l0,	%g2
	movl	%xcc,	%i0,	%l6
	edge8ln	%g3,	%g6,	%l2
	movcs	%icc,	%g1,	%i1
	stx	%o3,	[%l7 + 0x30]
	pdist	%f8,	%f8,	%f6
	tvc	%xcc,	0x4
	fand	%f10,	%f26,	%f14
	movre	%o1,	%i5,	%o7
	bgu,pn	%icc,	loop_1607
	fcmpgt16	%f0,	%f2,	%i2
	fpsub16s	%f7,	%f12,	%f29
	bvs,a,pt	%icc,	loop_1608
loop_1607:
	fbu	%fcc0,	loop_1609
	movcc	%icc,	%l3,	%i7
	tleu	%icc,	0x7
loop_1608:
	udiv	%i3,	0x124B,	%g7
loop_1609:
	array8	%i4,	%i6,	%o6
	tle	%icc,	0x6
	brlez,a	%o5,	loop_1610
	tleu	%icc,	0x0
	te	%xcc,	0x4
	edge8n	%o0,	%l4,	%l5
loop_1610:
	sdivx	%l1,	0x1A8B,	%g5
	tn	%xcc,	0x3
	tvc	%icc,	0x4
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x44] %asi,	%o4
	movne	%xcc,	%g4,	%o2
	movcc	%xcc,	%l0,	%i0
	array16	%l6,	%g2,	%g6
	tcs	%xcc,	0x2
	sir	0x0038
	fcmpne16	%f2,	%f24,	%g3
	tne	%xcc,	0x5
	udiv	%l2,	0x1C20,	%g1
	movcc	%icc,	%i1,	%o1
	tne	%xcc,	0x2
	fcmpeq16	%f10,	%f12,	%i5
	movrlz	%o7,	0x17D,	%o3
	fbue	%fcc0,	loop_1611
	sdiv	%i2,	0x0100,	%i7
	move	%xcc,	%i3,	%g7
	smul	%l3,	0x050A,	%i4
loop_1611:
	sdivcc	%o6,	0x0EA9,	%o5
	ldsh	[%l7 + 0x0E],	%o0
	fmovsn	%xcc,	%f2,	%f12
	fbne,a	%fcc2,	loop_1612
	bneg,a	loop_1613
	tneg	%icc,	0x1
	ba	%xcc,	loop_1614
loop_1612:
	mova	%icc,	%i6,	%l5
loop_1613:
	ldub	[%l7 + 0x3D],	%l4
	fmovsvs	%icc,	%f10,	%f0
loop_1614:
	taddcc	%l1,	0x1698,	%o4
	std	%f4,	[%l7 + 0x70]
	edge32n	%g5,	%g4,	%o2
	bvs,a,pt	%icc,	loop_1615
	fmovrde	%l0,	%f8,	%f22
	nop
	setx	loop_1616,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fexpand	%f17,	%f20
loop_1615:
	movge	%xcc,	%i0,	%g2
	swap	[%l7 + 0x70],	%l6
loop_1616:
	ld	[%l7 + 0x4C],	%f17
	alignaddrl	%g6,	%l2,	%g1
	taddcctv	%g3,	%i1,	%i5
	bcs	loop_1617
	std	%f28,	[%l7 + 0x78]
	andcc	%o1,	0x1887,	%o3
	sll	%o7,	0x0C,	%i2
loop_1617:
	movn	%xcc,	%i3,	%g7
	srlx	%l3,	%i7,	%i4
	nop
	setx	loop_1618,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitos	%f4,	%f10
	fstod	%f10,	%f30
	fcmpgt16	%f20,	%f6,	%o5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%o0
loop_1618:
	fbn,a	%fcc0,	loop_1619
	move	%icc,	%l5,	%i6
	sdivcc	%l1,	0x1C0F,	%o4
	faligndata	%f12,	%f24,	%f2
loop_1619:
	tvs	%xcc,	0x2
	srlx	%g5,	%l4,	%g4
	movle	%xcc,	%l0,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o2,	%l6,	%g2
	edge32	%g6,	%l2,	%g3
	sll	%i1,	0x07,	%g1
	sethi	0x16C1,	%o1
	xnorcc	%i5,	0x01FB,	%o7
	fmul8x16	%f3,	%f24,	%f30
	ldub	[%l7 + 0x59],	%i2
	movrlz	%o3,	0x289,	%g7
	fpack16	%f6,	%f24
	addccc	%i3,	%l3,	%i7
	smul	%i4,	%o6,	%o0
	set	0x54, %i6
	lda	[%l7 + %i6] 0x10,	%f12
	fsrc2s	%f2,	%f18
	ldsw	[%l7 + 0x78],	%l5
	mulscc	%i6,	%l1,	%o5
	fnot1s	%f6,	%f0
	tvc	%icc,	0x2
	or	%g5,	%o4,	%g4
	sub	%l4,	%l0,	%o2
	set	0x08, %o2
	prefetcha	[%l7 + %o2] 0x15,	 0x1
	srlx	%g2,	%g6,	%i0
	movpos	%xcc,	%g3,	%i1
	movge	%icc,	%l2,	%g1
	tg	%xcc,	0x4
	membar	0x60
	andcc	%i5,	0x08C4,	%o1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%o3
	fbul,a	%fcc3,	loop_1620
	tg	%icc,	0x3
	and	%o7,	%i3,	%g7
	nop
	fitod	%f12,	%f20
	fdtoi	%f20,	%f1
loop_1620:
	fbo,a	%fcc0,	loop_1621
	edge16ln	%i7,	%i4,	%l3
	edge32n	%o6,	%o0,	%i6
	addcc	%l1,	%o5,	%g5
loop_1621:
	ldd	[%l7 + 0x18],	%f12
	sllx	%o4,	%g4,	%l5
	fabsd	%f12,	%f8
	taddcctv	%l0,	%o2,	%l4
	edge16n	%l6,	%g6,	%g2
	fmovdle	%xcc,	%f4,	%f31
	move	%icc,	%i0,	%g3
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x71] %asi,	%i1
	set	0x57, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g1
	tcs	%xcc,	0x4
	andcc	%l2,	%o1,	%i2
	movre	%i5,	%o3,	%o7
	bgu	%xcc,	loop_1622
	movrne	%g7,	0x02E,	%i7
	andn	%i3,	%i4,	%o6
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x15,	 0x1
loop_1622:
	fbuge	%fcc2,	loop_1623
	movvs	%xcc,	%l3,	%l1
	ta	%icc,	0x0
	edge32	%i6,	%g5,	%o4
loop_1623:
	srax	%g4,	0x12,	%l5
	nop
	setx	loop_1624,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%o5,	%l0,	%o2
	ldd	[%l7 + 0x50],	%f22
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x08] %asi,	%f10
loop_1624:
	tpos	%xcc,	0x3
	sdivcc	%l4,	0x1906,	%g6
	ldsw	[%l7 + 0x6C],	%g2
	movleu	%icc,	%l6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f2,	%f16,	%f18
	movgu	%xcc,	%g3,	%g1
	wr	%g0,	0x0c,	%asi
	stwa	%l2,	[%l7 + 0x60] %asi
	fmovsleu	%xcc,	%f10,	%f16
	lduw	[%l7 + 0x3C],	%o1
	set	0x08, %l5
	stba	%i1,	[%l7 + %l5] 0x04
	set	0x50, %i0
	ldda	[%l7 + %i0] 0xe3,	%i4
	taddcc	%o3,	%i2,	%g7
	fcmpgt16	%f26,	%f0,	%o7
	fmovrdlz	%i3,	%f18,	%f20
	fsrc1s	%f22,	%f10
	edge32n	%i7,	%i4,	%o0
	tne	%icc,	0x4
	movg	%xcc,	%l3,	%o6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	sub	%i6,	%g5,	%o4
	movne	%xcc,	%l5,	%g4
	andncc	%l0,	%o2,	%o5
	flush	%l7 + 0x34
	mova	%xcc,	%g6,	%l4
	edge32l	%g2,	%l6,	%i0
	edge32l	%g1,	%g3,	%o1
	array32	%l2,	%i5,	%i1
	nop
	setx loop_1625, %l0, %l1
	jmpl %l1, %o3
	fble,a	%fcc1,	loop_1626
	tne	%xcc,	0x4
	srl	%i2,	0x04,	%o7
loop_1625:
	subccc	%i3,	0x1AA0,	%g7
loop_1626:
	fmovdpos	%icc,	%f23,	%f23
	fmovsge	%icc,	%f15,	%f14
	nop
	fitod	%f20,	%f16
	srax	%i7,	%i4,	%o0
	ldd	[%l7 + 0x40],	%l2
	fones	%f12
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l1
	orn	%o6,	0x070F,	%g5
	umulcc	%i6,	0x0719,	%o4
	movrlz	%l5,	%g4,	%o2
	array16	%l0,	%g6,	%o5
	tvc	%xcc,	0x6
	movcs	%xcc,	%g2,	%l4
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i0
	set	0x20, %g3
	ldxa	[%l7 + %g3] 0x10,	%l6
	tl	%xcc,	0x6
	bvc,a,pt	%icc,	loop_1627
	tg	%xcc,	0x4
	fmovrsgez	%g1,	%f12,	%f27
	edge32	%g3,	%l2,	%o1
loop_1627:
	fnegs	%f18,	%f9
	sdivcc	%i1,	0x1BFD,	%i5
	set	0x08, %i2
	lduwa	[%l7 + %i2] 0x89,	%i2
	fpmerge	%f7,	%f1,	%f14
	edge8l	%o7,	%i3,	%g7
	fmovsvs	%icc,	%f1,	%f24
	tsubcc	%i7,	%o3,	%i4
	sdivx	%o0,	0x1707,	%l1
	tleu	%xcc,	0x0
	edge32l	%l3,	%g5,	%i6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrgz	%o4,	0x057,	%o6
	tvs	%icc,	0x1
	te	%icc,	0x5
	wr	%g0,	0x80,	%asi
	stha	%g4,	[%l7 + 0x32] %asi
	membar	0x1A
	fpsub16	%f14,	%f4,	%f26
	edge8	%l5,	%o2,	%g6
	movg	%icc,	%o5,	%g2
	fbug,a	%fcc2,	loop_1628
	orcc	%l4,	0x08F3,	%l0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x31] %asi,	%l6
loop_1628:
	orcc	%g1,	%g3,	%i0
	fbl	%fcc1,	loop_1629
	tcc	%xcc,	0x5
	fornot1	%f12,	%f8,	%f18
	edge8	%o1,	%l2,	%i1
loop_1629:
	fcmple16	%f6,	%f28,	%i2
	bcc	loop_1630
	ta	%xcc,	0x6
	subc	%i5,	0x0A62,	%i3
	edge32ln	%o7,	%g7,	%i7
loop_1630:
	edge16n	%i4,	%o0,	%o3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x26] %asi,	%l3
	fmovrslz	%l1,	%f29,	%f28
	sethi	0x0439,	%i6
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fbe,a	%fcc3,	loop_1631
	fmovsgu	%icc,	%f5,	%f27
	subc	%g5,	%o4,	%g4
	andncc	%l5,	%o6,	%g6
loop_1631:
	bshuffle	%f20,	%f26,	%f26
	alignaddrl	%o5,	%g2,	%l4
	movrlz	%o2,	%l6,	%l0
	bshuffle	%f16,	%f30,	%f14
	fmuld8sux16	%f11,	%f29,	%f14
	bl,pt	%icc,	loop_1632
	taddcc	%g3,	0x0BC5,	%g1
	movcs	%xcc,	%i0,	%l2
	addcc	%o1,	%i1,	%i5
loop_1632:
	andncc	%i3,	%i2,	%o7
	fmovscs	%icc,	%f11,	%f3
	sub	%g7,	0x14E6,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x34, %o0
	stha	%i4,	[%l7 + %o0] 0x2a
	membar	#Sync
	nop
	setx	0x1DB30F9F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x50323DC8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f6,	%f20
	movvc	%icc,	%o0,	%o3
	std	%f10,	[%l7 + 0x78]
	fnors	%f16,	%f27,	%f23
	smulcc	%l3,	%l1,	%i6
	sll	%o4,	%g5,	%l5
	lduw	[%l7 + 0x48],	%o6
	membar	0x7D
	udiv	%g4,	0x0BAB,	%o5
	tleu	%xcc,	0x7
	tcc	%xcc,	0x4
	movg	%icc,	%g6,	%g2
	movrlz	%l4,	0x045,	%l6
	fbuge	%fcc2,	loop_1633
	fmovsgu	%icc,	%f3,	%f20
	udiv	%l0,	0x1EEA,	%g3
	movrne	%g1,	%o2,	%l2
loop_1633:
	sdivcc	%i0,	0x099C,	%o1
	udivcc	%i5,	0x02B3,	%i1
	edge8l	%i2,	%o7,	%i3
	fcmple32	%f20,	%f14,	%i7
	taddcctv	%i4,	%g7,	%o0
	fbu	%fcc3,	loop_1634
	fnegd	%f12,	%f16
	srl	%l3,	%o3,	%l1
	fmovda	%icc,	%f17,	%f20
loop_1634:
	orcc	%i6,	%o4,	%g5
	edge32l	%l5,	%g4,	%o5
	bcs,a	loop_1635
	ldx	[%l7 + 0x78],	%o6
	tge	%icc,	0x0
	fbge	%fcc3,	loop_1636
loop_1635:
	fbl,a	%fcc2,	loop_1637
	fnot2s	%f15,	%f3
	mulscc	%g6,	0x0C4E,	%g2
loop_1636:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x4A] %asi,	%l6
loop_1637:
	movcs	%icc,	%l4,	%l0
	edge32l	%g3,	%g1,	%o2
	fnot1s	%f8,	%f23
	tl	%xcc,	0x7
	brz,a	%i0,	loop_1638
	tgu	%xcc,	0x1
	set	0x5A, %g6
	ldsha	[%l7 + %g6] 0x11,	%l2
loop_1638:
	udivcc	%o1,	0x010D,	%i5
	nop
	setx	0xD9E624D1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xE04C4669,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f14,	%f4
	fble	%fcc0,	loop_1639
	bneg,pt	%xcc,	loop_1640
	udiv	%i2,	0x13F6,	%o7
	fexpand	%f29,	%f30
loop_1639:
	ldsb	[%l7 + 0x4B],	%i1
loop_1640:
	lduw	[%l7 + 0x20],	%i3
	orcc	%i7,	%i4,	%o0
	addcc	%l3,	0x10E3,	%o3
	fbg	%fcc3,	loop_1641
	sdiv	%g7,	0x016C,	%l1
	brlez	%i6,	loop_1642
	fmul8x16al	%f18,	%f1,	%f14
loop_1641:
	tvc	%xcc,	0x5
	sub	%g5,	0x05D2,	%o4
loop_1642:
	mova	%icc,	%g4,	%o5
	mulx	%o6,	0x0B96,	%l5
	movre	%g6,	%g2,	%l4
	srax	%l0,	%l6,	%g1
	fmovsg	%xcc,	%f2,	%f25
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o2,	%i0
	tcs	%icc,	0x4
	fpadd16	%f14,	%f0,	%f22
	tvc	%icc,	0x7
	tsubcc	%g3,	0x18F2,	%l2
	tvc	%xcc,	0x0
	popc	%i5,	%i2
	pdist	%f22,	%f2,	%f26
	ta	%icc,	0x0
	sll	%o7,	%i1,	%o1
	andcc	%i3,	%i7,	%i4
	fmovdcs	%xcc,	%f9,	%f7
	xnor	%o0,	0x0498,	%o3
	wr	%g0,	0x89,	%asi
	stha	%l3,	[%l7 + 0x44] %asi
	edge16l	%l1,	%g7,	%i6
	umulcc	%o4,	0x0CB3,	%g5
	smulcc	%o5,	%o6,	%g4
	sir	0x1DFE
	fnands	%f25,	%f3,	%f2
	fnot2	%f14,	%f18
	nop
	setx	0x7FE6A1C47E5AC06A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x4DD0409E3C5A06D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f20,	%f16
	sub	%g6,	%l5,	%l4
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x18
	umulcc	%l0,	0x0CA8,	%l6
	fbule	%fcc1,	loop_1643
	umulcc	%g2,	%o2,	%i0
	movrgz	%g3,	0x021,	%l2
	edge16l	%i5,	%g1,	%o7
loop_1643:
	mulscc	%i1,	%o1,	%i3
	fones	%f22
	edge8l	%i2,	%i7,	%i4
	movrgz	%o0,	0x160,	%l3
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x6D] %asi,	%o3
	stx	%l1,	[%l7 + 0x68]
	sll	%g7,	0x05,	%i6
	fnot1s	%f6,	%f9
	movvc	%xcc,	%g5,	%o5
	umulcc	%o6,	%o4,	%g6
	st	%f1,	[%l7 + 0x20]
	edge8n	%l5,	%g4,	%l0
	fblg,a	%fcc0,	loop_1644
	be,pt	%icc,	loop_1645
	alignaddr	%l4,	%g2,	%o2
	addccc	%l6,	%g3,	%l2
loop_1644:
	fmovsge	%xcc,	%f29,	%f12
loop_1645:
	fcmpne32	%f2,	%f14,	%i0
	fpack16	%f14,	%f19
	ba,a,pt	%icc,	loop_1646
	andncc	%g1,	%i5,	%i1
	fmovsleu	%xcc,	%f8,	%f27
	tn	%icc,	0x6
loop_1646:
	tvs	%xcc,	0x6
	movvc	%xcc,	%o1,	%o7
	andncc	%i3,	%i2,	%i4
	edge8	%o0,	%l3,	%o3
	sub	%l1,	0x12EA,	%i7
	orn	%g7,	%i6,	%g5
	te	%xcc,	0x1
	xor	%o6,	%o5,	%g6
	tgu	%icc,	0x5
	tvs	%icc,	0x5
	subc	%l5,	0x0E0E,	%o4
	umulcc	%g4,	%l0,	%l4
	bcc	loop_1647
	edge32n	%g2,	%l6,	%g3
	tcc	%icc,	0x7
	flush	%l7 + 0x44
loop_1647:
	bl	%xcc,	loop_1648
	add	%o2,	0x1F46,	%i0
	movpos	%xcc,	%g1,	%l2
	swap	[%l7 + 0x24],	%i1
loop_1648:
	membar	0x32
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f20
	tleu	%icc,	0x4
	tleu	%xcc,	0x4
	edge16	%i5,	%o1,	%o7
	andncc	%i2,	%i3,	%i4
	for	%f16,	%f16,	%f6
	wr	%g0,	0x89,	%asi
	stha	%o0,	[%l7 + 0x34] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f6,	%f7
	fstod	%f7,	%f12
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x12] %asi,	%o3
	movne	%xcc,	%l1,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i7,	%i6
	fors	%f28,	%f2,	%f3
	andncc	%g5,	%o6,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x1
	fornot1s	%f13,	%f29,	%f17
	movcc	%icc,	%g6,	%l5
	andncc	%o4,	%g4,	%l0
	movvs	%xcc,	%l4,	%g2
	sdivx	%g7,	0x1E5D,	%l6
	alignaddr	%o2,	%g3,	%i0
	fmovsleu	%xcc,	%f0,	%f13
	move	%xcc,	%l2,	%i1
	movvs	%xcc,	%i5,	%o1
	ldsb	[%l7 + 0x1F],	%o7
	tleu	%icc,	0x6
	fnegd	%f26,	%f4
	movre	%g1,	0x15D,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i4,	0x1703,	%o0
	for	%f0,	%f10,	%f16
	nop
	setx	0x0A553EFD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xF268F9A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f4,	%f6
	fbge	%fcc0,	loop_1649
	fmovsn	%icc,	%f18,	%f4
	bn,pt	%icc,	loop_1650
	fmovsvc	%icc,	%f19,	%f30
loop_1649:
	edge32l	%i3,	%o3,	%l3
	fbug	%fcc0,	loop_1651
loop_1650:
	fbe	%fcc0,	loop_1652
	smulcc	%i7,	0x0E70,	%i6
	lduw	[%l7 + 0x50],	%l1
loop_1651:
	movle	%xcc,	%g5,	%o5
loop_1652:
	nop
	setx	loop_1653,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%o6,	%g6,	%l5
	bn,a	loop_1654
	fmovdleu	%icc,	%f16,	%f13
loop_1653:
	st	%f24,	[%l7 + 0x14]
	sdivx	%g4,	0x05F6,	%l0
loop_1654:
	srl	%o4,	0x10,	%l4
	bcs,a	loop_1655
	srax	%g2,	0x15,	%g7
	fbul	%fcc3,	loop_1656
	membar	0x79
loop_1655:
	fcmpne32	%f20,	%f4,	%o2
	prefetch	[%l7 + 0x10],	 0x0
loop_1656:
	tge	%icc,	0x3
	nop
	setx	0x41658640,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xD2D0008B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f24,	%f19
	brlz,a	%g3,	loop_1657
	nop
	setx	0x6434A25045B3D808,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x87D97DAC6B542672,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f16,	%f28
	subccc	%i0,	%l2,	%i1
	movrlz	%i5,	0x353,	%o1
loop_1657:
	fornot2	%f14,	%f20,	%f24
	sdivx	%l6,	0x154A,	%g1
	movne	%icc,	%o7,	%i4
	taddcc	%o0,	%i2,	%o3
	fbn	%fcc2,	loop_1658
	be,a,pt	%icc,	loop_1659
	fpadd16	%f24,	%f0,	%f10
	nop
	set	0x54, %l0
	prefetch	[%l7 + %l0],	 0x1
loop_1658:
	fmul8x16al	%f7,	%f5,	%f12
loop_1659:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x18,	%i3,	%l3
	subcc	%i7,	0x096E,	%l1
	set	0x3C, %o1
	sta	%f2,	[%l7 + %o1] 0x81
	bn,a	%icc,	loop_1660
	tcs	%xcc,	0x7
	sethi	0x111F,	%i6
	sll	%g5,	0x11,	%o5
loop_1660:
	ldstub	[%l7 + 0x64],	%g6
	orcc	%o6,	0x0D7B,	%l5
	fmovsleu	%icc,	%f0,	%f27
	edge8	%g4,	%o4,	%l0
	fornot1	%f24,	%f6,	%f8
	edge8n	%l4,	%g2,	%o2
	edge32	%g7,	%i0,	%l2
	prefetch	[%l7 + 0x68],	 0x3
	ldsb	[%l7 + 0x3A],	%i1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x44] %asi,	%g3
	set	0x20, %g4
	sta	%f24,	[%l7 + %g4] 0x89
	brlz	%o1,	loop_1661
	nop
	setx	0x888E12A9D4F1D09B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x3F68BF695C1FAC5A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f12,	%f10
	fbne,a	%fcc2,	loop_1662
	fxnors	%f11,	%f3,	%f18
loop_1661:
	fmovde	%xcc,	%f3,	%f29
	edge8	%i5,	%l6,	%g1
loop_1662:
	array16	%i4,	%o0,	%o7
	fnor	%f26,	%f20,	%f22
	ldd	[%l7 + 0x30],	%o2
	fxnor	%f16,	%f20,	%f4
	edge8l	%i2,	%i3,	%i7
	xnor	%l3,	0x1810,	%i6
	tvs	%xcc,	0x4
	alignaddr	%l1,	%o5,	%g5
	edge32ln	%o6,	%g6,	%l5
	tsubcc	%o4,	%l0,	%l4
	subc	%g2,	%g4,	%o2
	stw	%g7,	[%l7 + 0x74]
	sir	0x10FA
	flush	%l7 + 0x18
	movvs	%xcc,	%l2,	%i0
	nop
	setx	0xE1C7F05DE0A62B0A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x0CE4524C27FBDC99,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f8,	%f6
	swap	[%l7 + 0x58],	%g3
	add	%i1,	%i5,	%l6
	edge16l	%g1,	%i4,	%o1
	brnz	%o7,	loop_1663
	fnands	%f29,	%f0,	%f10
	edge16ln	%o0,	%o3,	%i2
	edge32l	%i3,	%i7,	%l3
loop_1663:
	tne	%xcc,	0x1
	fpadd16	%f26,	%f28,	%f4
	taddcctv	%l1,	0x1600,	%i6
	bne,a	loop_1664
	umulcc	%g5,	0x0A77,	%o5
	te	%xcc,	0x0
	brnz,a	%o6,	loop_1665
loop_1664:
	movle	%xcc,	%g6,	%o4
	fmovrslez	%l0,	%f22,	%f3
	add	%l5,	%g2,	%l4
loop_1665:
	tg	%icc,	0x0
	udivx	%o2,	0x0BA4,	%g7
	sdivcc	%g4,	0x0716,	%i0
	brgz,a	%g3,	loop_1666
	movvs	%xcc,	%i1,	%l2
	fandnot1	%f28,	%f18,	%f24
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%l6
loop_1666:
	sdivcc	%g1,	0x1695,	%i4
	fmovs	%f15,	%f14
	nop
	set	0x60, %o5
	ldx	[%l7 + %o5],	%i5
	nop
	setx	0x68F76246,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x66DC04AF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f2,	%f28
	tg	%xcc,	0x1
	fbg,a	%fcc0,	loop_1667
	stb	%o1,	[%l7 + 0x64]
	flush	%l7 + 0x20
	mova	%xcc,	%o7,	%o3
loop_1667:
	fcmpeq32	%f14,	%f30,	%o0
	xnorcc	%i2,	0x0094,	%i3
	fpackfix	%f22,	%f24
	edge8	%i7,	%l1,	%l3
	bcs,a,pt	%icc,	loop_1668
	alignaddrl	%g5,	%o5,	%i6
	bn	%icc,	loop_1669
	fabss	%f16,	%f14
loop_1668:
	nop
	setx	loop_1670,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot1s	%f20,	%f5
loop_1669:
	array32	%g6,	%o4,	%l0
	movgu	%icc,	%o6,	%g2
loop_1670:
	movneg	%xcc,	%l4,	%o2
	fmul8x16al	%f5,	%f14,	%f4
	fmovspos	%icc,	%f20,	%f24
	sllx	%g7,	%l5,	%g4
	tn	%icc,	0x4
	sethi	0x1147,	%g3
	brlz,a	%i0,	loop_1671
	fba,a	%fcc0,	loop_1672
	brgz,a	%l2,	loop_1673
	popc	%l6,	%g1
loop_1671:
	fpadd32	%f6,	%f6,	%f14
loop_1672:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1673:
	fble	%fcc3,	loop_1674
	edge16	%i1,	%i4,	%i5
	addc	%o1,	0x1827,	%o3
	fbge,a	%fcc2,	loop_1675
loop_1674:
	tge	%icc,	0x6
	movg	%xcc,	%o0,	%i2
	addc	%i3,	0x0709,	%i7
loop_1675:
	ta	%xcc,	0x2
	movrlz	%l1,	0x37B,	%l3
	taddcc	%o7,	%g5,	%o5
	fors	%f18,	%f11,	%f26
	membar	0x75
	popc	%i6,	%o4
	fbug,a	%fcc0,	loop_1676
	tle	%icc,	0x4
	movrlz	%l0,	%g6,	%g2
	tn	%icc,	0x0
loop_1676:
	edge32	%l4,	%o2,	%o6
	bge	loop_1677
	edge16l	%g7,	%l5,	%g4
	edge8	%i0,	%g3,	%l2
	or	%g1,	0x112E,	%i1
loop_1677:
	ba,pt	%xcc,	loop_1678
	array8	%l6,	%i5,	%o1
	smul	%o3,	%i4,	%o0
	lduh	[%l7 + 0x3A],	%i2
loop_1678:
	bne,a,pt	%icc,	loop_1679
	fba,a	%fcc3,	loop_1680
	edge16ln	%i3,	%i7,	%l3
	alignaddrl	%o7,	%l1,	%g5
loop_1679:
	sdivcc	%i6,	0x1CC4,	%o5
loop_1680:
	nop
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x89,	%f0
	movrgz	%o4,	0x012,	%g6
	sra	%l0,	0x1B,	%g2
	fxnor	%f30,	%f0,	%f22
	mova	%xcc,	%l4,	%o2
	edge8n	%g7,	%o6,	%g4
	addccc	%i0,	0x19FD,	%l5
	call	loop_1681
	fzero	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f18,	%f12,	%f14
loop_1681:
	brnz,a	%g3,	loop_1682
	fmovrdlz	%g1,	%f10,	%f8
	fxnor	%f16,	%f10,	%f30
	sdiv	%i1,	0x1496,	%l6
loop_1682:
	tcs	%icc,	0x4
	brgez,a	%i5,	loop_1683
	tle	%xcc,	0x3
	nop
	setx	0x2020D083D071138D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	movrlz	%o1,	0x289,	%l2
loop_1683:
	fsrc1s	%f1,	%f19
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x27] %asi,	%o3
	udivcc	%o0,	0x003D,	%i4
	taddcctv	%i3,	%i2,	%i7
	and	%l3,	0x0030,	%l1
	array8	%o7,	%g5,	%i6
	call	loop_1684
	xorcc	%o4,	0x1009,	%g6
	sdivx	%o5,	0x1C4D,	%l0
	fpadd16s	%f9,	%f14,	%f3
loop_1684:
	andncc	%l4,	%o2,	%g2
	ta	%icc,	0x5
	edge32n	%g7,	%g4,	%o6
	tcs	%icc,	0x6
	sethi	0x14BC,	%l5
	fmovrde	%i0,	%f18,	%f0
	brgez	%g3,	loop_1685
	edge8	%g1,	%i1,	%i5
	bcc,a,pn	%xcc,	loop_1686
	tvc	%icc,	0x0
loop_1685:
	movne	%xcc,	%l6,	%l2
	sir	0x0253
loop_1686:
	fpsub32s	%f9,	%f30,	%f22
	fandnot1	%f8,	%f10,	%f12
	edge8n	%o3,	%o0,	%i4
	movcc	%xcc,	%o1,	%i3
	fbl	%fcc3,	loop_1687
	srlx	%i2,	%l3,	%l1
	fmovsneg	%xcc,	%f15,	%f19
	bcc,pt	%xcc,	loop_1688
loop_1687:
	tn	%icc,	0x6
	nop
	setx	0x5ABE8B97,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f25
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f30
loop_1688:
	ldsb	[%l7 + 0x1B],	%o7
	nop
	setx	0x53979658,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xB95223E0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f10,	%f4
	ldd	[%l7 + 0x40],	%g4
	tgu	%xcc,	0x7
	sdiv	%i7,	0x0C0E,	%o4
	set	0x12, %o4
	ldsha	[%l7 + %o4] 0x81,	%i6
	nop
	fitod	%f12,	%f2
	fdtox	%f2,	%f2
	fmovspos	%icc,	%f5,	%f2
	faligndata	%f10,	%f12,	%f28
	edge8l	%g6,	%o5,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0DF0,	%l4
	tcc	%xcc,	0x7
	andncc	%o2,	%g7,	%g2
	and	%g4,	0x155D,	%l5
	movl	%xcc,	%o6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g1,	0x0D78,	%i1
	ldsb	[%l7 + 0x29],	%i5
	sth	%l6,	[%l7 + 0x7E]
	alignaddr	%g3,	%l2,	%o0
	tcc	%icc,	0x1
	tcc	%icc,	0x6
	ba	%icc,	loop_1689
	bl	%icc,	loop_1690
	brlez	%i4,	loop_1691
	membar	0x59
loop_1689:
	tvs	%xcc,	0x1
loop_1690:
	fmovsgu	%xcc,	%f2,	%f16
loop_1691:
	udivcc	%o3,	0x094C,	%o1
	and	%i3,	0x1867,	%l3
	addcc	%i2,	0x13BA,	%o7
	array32	%g5,	%i7,	%l1
	nop
	setx	0xA050559C,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	set	0x78, %i5
	lduha	[%l7 + %i5] 0x10,	%i6
	movpos	%xcc,	%o4,	%g6
	movleu	%icc,	%o5,	%l0
	bcs,a	%icc,	loop_1692
	bne,pn	%icc,	loop_1693
	movvc	%icc,	%o2,	%l4
	sdivcc	%g2,	0x1E35,	%g7
loop_1692:
	movcc	%xcc,	%g4,	%o6
loop_1693:
	bne,pn	%xcc,	loop_1694
	udivcc	%i0,	0x1BC5,	%g1
	tcs	%icc,	0x4
	bneg	loop_1695
loop_1694:
	nop
	fitos	%f14,	%f21
	fstod	%f21,	%f2
	pdist	%f0,	%f30,	%f8
	nop
	setx	0x015441E74049B0EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
loop_1695:
	flush	%l7 + 0x34
	array16	%i1,	%l5,	%i5
	tsubcc	%l6,	0x082E,	%l2
	xnor	%g3,	0x1207,	%i4
	orn	%o0,	0x03FE,	%o1
	xnor	%o3,	%i3,	%l3
	movle	%icc,	%i2,	%g5
	movl	%xcc,	%o7,	%i7
	set	0x50, %g1
	lda	[%l7 + %g1] 0x0c,	%f24
	edge8	%i6,	%l1,	%g6
	smulcc	%o4,	0x115C,	%l0
	tgu	%xcc,	0x4
	sub	%o5,	0x1F41,	%o2
	fmovrdne	%l4,	%f2,	%f10
	movrne	%g7,	0x24B,	%g2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%o6
	movg	%icc,	%i0,	%g1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x3C] %asi,	%f23
	fble	%fcc0,	loop_1696
	movre	%l5,	%i5,	%i1
	ldsw	[%l7 + 0x74],	%l6
	lduh	[%l7 + 0x0A],	%g3
loop_1696:
	fbo,a	%fcc2,	loop_1697
	fandnot2s	%f18,	%f12,	%f21
	xor	%i4,	%l2,	%o0
	srlx	%o3,	%i3,	%l3
loop_1697:
	sllx	%o1,	0x17,	%i2
	sdivcc	%o7,	0x1A90,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f24,	%f8,	%f18
	tcc	%icc,	0x4
	tne	%icc,	0x0
	movcs	%xcc,	%i6,	%l1
	swap	[%l7 + 0x10],	%g6
	fmovrde	%o4,	%f14,	%f26
	tcc	%xcc,	0x1
	nop
	setx	loop_1698,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	std	%f12,	[%l7 + 0x40]
	fmovdvc	%icc,	%f16,	%f4
	tn	%icc,	0x2
loop_1698:
	bge,a	loop_1699
	fbe	%fcc3,	loop_1700
	movge	%xcc,	%l0,	%i7
	bneg,pt	%icc,	loop_1701
loop_1699:
	tvs	%icc,	0x6
loop_1700:
	udiv	%o2,	0x08EE,	%o5
	fmovsvc	%icc,	%f5,	%f25
loop_1701:
	srl	%l4,	0x12,	%g7
	call	loop_1702
	fbug,a	%fcc0,	loop_1703
	xnorcc	%g4,	%g2,	%i0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x5F] %asi,	%o6
loop_1702:
	edge32	%g1,	%l5,	%i1
loop_1703:
	tvc	%xcc,	0x7
	alignaddr	%l6,	%g3,	%i4
	ldd	[%l7 + 0x30],	%f18
	edge8l	%i5,	%l2,	%o3
	addcc	%i3,	%l3,	%o1
	fandnot1	%f14,	%f18,	%f30
	fnand	%f24,	%f4,	%f26
	tg	%icc,	0x0
	movcc	%xcc,	%i2,	%o0
	sdivx	%g5,	0x0E94,	%i6
	fbul,a	%fcc0,	loop_1704
	fmovd	%f14,	%f28
	fba,a	%fcc1,	loop_1705
	movge	%xcc,	%l1,	%g6
loop_1704:
	edge32ln	%o4,	%o7,	%l0
	fba,a	%fcc2,	loop_1706
loop_1705:
	bleu,pn	%xcc,	loop_1707
	fbu,a	%fcc1,	loop_1708
	tpos	%xcc,	0x1
loop_1706:
	ldx	[%l7 + 0x28],	%o2
loop_1707:
	fbne	%fcc1,	loop_1709
loop_1708:
	fsrc1s	%f17,	%f9
	fbl,a	%fcc3,	loop_1710
	movgu	%xcc,	%i7,	%o5
loop_1709:
	fors	%f30,	%f2,	%f29
	stx	%g7,	[%l7 + 0x18]
loop_1710:
	fzero	%f30
	nop
	fitos	%f9,	%f8
	fmovde	%xcc,	%f6,	%f18
	orcc	%g4,	%g2,	%i0
	fbule	%fcc2,	loop_1711
	tl	%icc,	0x1
	addcc	%l4,	0x08A1,	%o6
	tcs	%icc,	0x1
loop_1711:
	subcc	%l5,	%g1,	%i1
	tle	%xcc,	0x4
	movpos	%icc,	%l6,	%i4
	ldd	[%l7 + 0x58],	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g3,	%l2,	%o3
	srl	%l3,	%o1,	%i2
	movgu	%icc,	%o0,	%i3
	bl,pn	%icc,	loop_1712
	umul	%g5,	%i6,	%l1
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f22
	movrne	%o4,	%g6,	%o7
loop_1712:
	smul	%l0,	0x0479,	%o2
	movvc	%xcc,	%i7,	%g7
	taddcctv	%o5,	%g2,	%g4
	movne	%icc,	%i0,	%l4
	movcs	%icc,	%o6,	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%l6
	brz	%i4,	loop_1713
	edge32	%l5,	%g3,	%l2
	umul	%i5,	%o3,	%l3
	udiv	%o1,	0x12A8,	%i2
loop_1713:
	umul	%i3,	0x0E92,	%o0
	fmovdvs	%xcc,	%f13,	%f12
	udivcc	%i6,	0x050B,	%l1
	fble,a	%fcc1,	loop_1714
	fxor	%f16,	%f24,	%f24
	smul	%g5,	0x1071,	%o4
	tcc	%icc,	0x7
loop_1714:
	tsubcc	%g6,	0x0782,	%o7
	movne	%icc,	%l0,	%o2
	sub	%i7,	0x196C,	%o5
	addccc	%g7,	0x1C7D,	%g4
	movrgz	%g2,	0x286,	%l4
	alignaddrl	%o6,	%g1,	%i1
	edge32	%l6,	%i0,	%l5
	fzeros	%f25
	lduh	[%l7 + 0x5C],	%g3
	nop
	fitos	%f1,	%f1
	xorcc	%l2,	%i4,	%i5
	tl	%icc,	0x6
	edge16	%l3,	%o3,	%o1
	xorcc	%i3,	0x047A,	%o0
	brnz	%i2,	loop_1715
	fabss	%f26,	%f18
	tpos	%xcc,	0x6
	fpsub32s	%f1,	%f21,	%f28
loop_1715:
	movl	%icc,	%l1,	%g5
	fbne	%fcc0,	loop_1716
	fornot1	%f6,	%f20,	%f26
	bneg,a,pn	%icc,	loop_1717
	tcc	%xcc,	0x1
loop_1716:
	nop
	fitos	%f0,	%f17
	fstox	%f17,	%f28
	fxtos	%f28,	%f31
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x89,	%o4,	%i6
loop_1717:
	sethi	0x04B8,	%o7
	edge32n	%g6,	%o2,	%i7
	nop
	fitod	%f2,	%f26
	fdtos	%f26,	%f30
	prefetch	[%l7 + 0x68],	 0x2
	fbul	%fcc1,	loop_1718
	flush	%l7 + 0x10
	set	0x30, %o7
	lda	[%l7 + %o7] 0x04,	%f24
loop_1718:
	tge	%icc,	0x4
	fbul	%fcc0,	loop_1719
	fmovrse	%o5,	%f31,	%f10
	sub	%l0,	%g4,	%g2
	stbar
loop_1719:
	nop
	setx	0xD33BCC303FE32050,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x16103A9EF45F9CB3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f14,	%f6
	tsubcc	%l4,	0x1349,	%g7
	fnegs	%f1,	%f4
	tcc	%xcc,	0x6
	tleu	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%xcc,	%f30,	%f2
	andn	%g1,	0x076E,	%o6
	tge	%icc,	0x6
	fmovdl	%xcc,	%f1,	%f10
	fmul8x16au	%f14,	%f8,	%f18
	nop
	setx	0x7055DB12,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	ta	%xcc,	0x6
	lduw	[%l7 + 0x14],	%l6
	alignaddr	%i0,	%i1,	%l5
	brlez,a	%l2,	loop_1720
	edge16	%g3,	%i5,	%l3
	or	%o3,	0x19A5,	%o1
	orncc	%i4,	0x19C1,	%o0
loop_1720:
	sub	%i3,	0x08C6,	%i2
	nop
	setx	0x2B6CAC56A3C6DB98,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x0D179380DED09F98,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f6,	%f24
	taddcc	%l1,	%g5,	%i6
	be,a	%icc,	loop_1721
	subccc	%o7,	%g6,	%o4
	movn	%xcc,	%i7,	%o2
	andcc	%o5,	0x1DE1,	%l0
loop_1721:
	tcs	%xcc,	0x7
	add	%g2,	%g4,	%g7
	tne	%xcc,	0x1
	movvc	%icc,	%g1,	%o6
	sra	%l6,	%l4,	%i1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%l5
	movleu	%xcc,	%l2,	%g3
	fba	%fcc0,	loop_1722
	movne	%icc,	%i5,	%o3
	movge	%icc,	%o1,	%i4
	fnors	%f5,	%f0,	%f2
loop_1722:
	tvc	%icc,	0x2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x0E] %asi,	%l3
	edge32ln	%o0,	%i3,	%i2
	fbge	%fcc3,	loop_1723
	tleu	%icc,	0x6
	tne	%xcc,	0x4
	udivx	%g5,	0x1700,	%l1
loop_1723:
	or	%i6,	0x0F49,	%o7
	movle	%icc,	%g6,	%i7
	movrlez	%o4,	%o5,	%l0
	array8	%o2,	%g2,	%g4
	movgu	%xcc,	%g1,	%g7
	sdivcc	%o6,	0x0FC7,	%l4
	brnz,a	%l6,	loop_1724
	sethi	0x0B95,	%i1
	fmuld8ulx16	%f17,	%f26,	%f26
	movneg	%xcc,	%l5,	%i0
loop_1724:
	fmovdge	%xcc,	%f8,	%f13
	fmovsge	%xcc,	%f26,	%f21
	tl	%xcc,	0x0
	fmovscc	%icc,	%f31,	%f6
	tne	%icc,	0x3
	fmovdne	%xcc,	%f1,	%f0
	fmovdvs	%xcc,	%f0,	%f14
	lduw	[%l7 + 0x54],	%l2
	fmovspos	%icc,	%f4,	%f10
	fbne,a	%fcc2,	loop_1725
	fmuld8sux16	%f20,	%f30,	%f14
	smul	%g3,	0x1568,	%o3
	tsubcc	%o1,	0x18E8,	%i4
loop_1725:
	popc	%i5,	%o0
	sdivcc	%l3,	0x00EB,	%i3
	movvs	%icc,	%i2,	%g5
	fpadd32s	%f14,	%f13,	%f25
	movre	%i6,	0x2C0,	%l1
	orn	%g6,	%o7,	%i7
	movrne	%o4,	%l0,	%o2
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x18] %asi,	%g2
	tleu	%icc,	0x4
	sdiv	%o5,	0x12BA,	%g1
	srl	%g7,	0x09,	%g4
	fcmple16	%f14,	%f30,	%o6
	stx	%l6,	[%l7 + 0x50]
	fnot1	%f10,	%f14
	movrlz	%l4,	0x304,	%l5
	fabss	%f3,	%f17
	array16	%i0,	%i1,	%g3
	stx	%l2,	[%l7 + 0x30]
	movn	%xcc,	%o3,	%o1
	fcmple16	%f24,	%f30,	%i4
	movneg	%icc,	%o0,	%i5
	bcc	loop_1726
	edge32l	%l3,	%i2,	%i3
	taddcctv	%g5,	%i6,	%g6
	nop
	setx	0x5C8F3A70,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x88FDE9C5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f11,	%f26
loop_1726:
	edge32ln	%l1,	%i7,	%o7
	sll	%l0,	%o4,	%o2
	umul	%o5,	0x011E,	%g2
	bg,a	loop_1727
	fbule	%fcc3,	loop_1728
	fcmple32	%f30,	%f0,	%g1
	movcs	%icc,	%g4,	%o6
loop_1727:
	subccc	%g7,	%l6,	%l4
loop_1728:
	stw	%i0,	[%l7 + 0x1C]
	bneg	loop_1729
	nop
	set	0x18, %l2
	ldx	[%l7 + %l2],	%i1
	stbar
	movg	%icc,	%l5,	%g3
loop_1729:
	fexpand	%f19,	%f20
	mulx	%o3,	%l2,	%i4
	fpadd16s	%f21,	%f7,	%f18
	movg	%icc,	%o1,	%o0
	brz	%l3,	loop_1730
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x5
	ldd	[%l7 + 0x50],	%i2
loop_1730:
	ldub	[%l7 + 0x29],	%i3
	and	%i5,	%i6,	%g6
	fbu,a	%fcc0,	loop_1731
	array8	%l1,	%i7,	%g5
	brgz,a	%o7,	loop_1732
	movcs	%icc,	%o4,	%l0
loop_1731:
	fmovdpos	%xcc,	%f3,	%f29
	alignaddr	%o2,	%g2,	%g1
loop_1732:
	bneg,a,pn	%icc,	loop_1733
	addcc	%g4,	0x030F,	%o6
	subcc	%o5,	0x1711,	%l6
	sub	%l4,	0x1F99,	%i0
loop_1733:
	fnegd	%f30,	%f12
	tneg	%icc,	0x5
	fmul8x16au	%f24,	%f26,	%f14
	srlx	%g7,	%l5,	%i1
	tcc	%icc,	0x7
	sir	0x1707
	set	0x78, %o6
	lda	[%l7 + %o6] 0x89,	%f9
	ldsw	[%l7 + 0x10],	%g3
	udivx	%l2,	0x1AAB,	%o3
	movvs	%xcc,	%i4,	%o0
	fpack16	%f30,	%f14
	ba,a	%icc,	loop_1734
	fzeros	%f23
	smulcc	%o1,	0x1E21,	%l3
	movrlz	%i3,	0x397,	%i2
loop_1734:
	fandnot1s	%f12,	%f9,	%f31
	smul	%i6,	%g6,	%l1
	orncc	%i7,	%i5,	%g5
	edge16l	%o4,	%l0,	%o7
	sdivcc	%o2,	0x0AB0,	%g2
	ldd	[%l7 + 0x78],	%g4
	fpack16	%f12,	%f14
	tsubcctv	%g1,	0x16A1,	%o5
	movl	%icc,	%l6,	%o6
	movneg	%xcc,	%l4,	%i0
	movrgz	%g7,	0x286,	%l5
	bneg,a,pn	%icc,	loop_1735
	umul	%i1,	0x06EC,	%l2
	movleu	%icc,	%o3,	%g3
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x48] %asi,	%i4
loop_1735:
	movrlz	%o0,	0x0B6,	%l3
	stbar
	sllx	%i3,	%o1,	%i2
	fnot2	%f8,	%f26
	ldsh	[%l7 + 0x3A],	%i6
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x78] %asi,	%l1
	sir	0x0968
	tne	%icc,	0x2
	fnors	%f21,	%f11,	%f0
	array8	%i7,	%i5,	%g6
	fmovrslz	%g5,	%f18,	%f19
	xor	%o4,	%o7,	%l0
	movl	%icc,	%g2,	%o2
	nop
	set	0x58, %l3
	stx	%g4,	[%l7 + %l3]
	brgz,a	%o5,	loop_1736
	fpadd32s	%f11,	%f28,	%f10
	tcs	%icc,	0x1
	sir	0x09A0
loop_1736:
	tne	%xcc,	0x6
	movg	%xcc,	%l6,	%o6
	edge16n	%l4,	%g1,	%i0
	movg	%icc,	%g7,	%i1
	brz,a	%l2,	loop_1737
	nop
	setx	loop_1738,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	prefetch	[%l7 + 0x08],	 0x1
	movn	%icc,	%l5,	%g3
loop_1737:
	array16	%o3,	%o0,	%i4
loop_1738:
	xnorcc	%l3,	0x0762,	%i3
	movgu	%icc,	%i2,	%i6
	nop
	setx	0xD053E291,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	orcc	%o1,	0x14A6,	%l1
	set	0x30, %i3
	ldxa	[%g0 + %i3] 0x4f,	%i7
	andcc	%g6,	%i5,	%g5
	set	0x09, %g2
	ldstuba	[%l7 + %g2] 0x81,	%o7
	movcs	%icc,	%l0,	%g2
	set	0x1C, %i7
	sta	%f3,	[%l7 + %i7] 0x88
	fmovdn	%xcc,	%f17,	%f25
	ble,a,pn	%icc,	loop_1739
	tne	%icc,	0x3
	andn	%o4,	%o2,	%o5
	fnegd	%f30,	%f2
loop_1739:
	nop
	set	0x7A, %g5
	lduba	[%l7 + %g5] 0x81,	%g4
	brlz,a	%o6,	loop_1740
	movn	%xcc,	%l6,	%g1
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x63] %asi,	%l4
loop_1740:
	subc	%i0,	0x0EF7,	%g7
	ba,pn	%icc,	loop_1741
	ble,pt	%icc,	loop_1742
	fbule,a	%fcc1,	loop_1743
	sll	%i1,	%l5,	%g3
loop_1741:
	brnz	%o3,	loop_1744
loop_1742:
	tgu	%icc,	0x2
loop_1743:
	addccc	%o0,	0x15FC,	%l2
	sdivcc	%l3,	0x181C,	%i4
loop_1744:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i3
	sdivx	%i6,	0x0C3E,	%i2
	taddcc	%l1,	0x02D6,	%i7
	fpadd32	%f30,	%f28,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba	%fcc3,	loop_1745
	fmul8x16au	%f6,	%f21,	%f10
	edge8	%o1,	%g6,	%i5
	edge32n	%o7,	%l0,	%g5
loop_1745:
	ld	[%l7 + 0x78],	%f17
	orn	%o4,	%o2,	%g2
	set	0x18, %l1
	stxa	%g4,	[%l7 + %l1] 0x0c
	ta	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x3E] %asi,	%o6
	edge8	%l6,	%o5,	%g1
	movvc	%icc,	%i0,	%g7
	ldsb	[%l7 + 0x57],	%i1
	fmovsne	%icc,	%f11,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l5,	0x0868,	%g3
	fnot2	%f4,	%f20
	call	loop_1746
	tcc	%xcc,	0x1
	fbl,a	%fcc3,	loop_1747
	edge8n	%o3,	%l4,	%l2
loop_1746:
	mova	%icc,	%l3,	%o0
	array32	%i4,	%i3,	%i6
loop_1747:
	fbul,a	%fcc1,	loop_1748
	movg	%xcc,	%l1,	%i7
	taddcctv	%o1,	0x1F01,	%i2
	nop
	fitod	%f0,	%f24
	fdtox	%f24,	%f24
loop_1748:
	smul	%i5,	0x1BDD,	%g6
	fandnot2s	%f24,	%f2,	%f12
	tpos	%xcc,	0x2
	sdiv	%l0,	0x15C9,	%g5
	andncc	%o7,	%o4,	%o2
	tneg	%icc,	0x0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x34] %asi,	%g2
	ldstub	[%l7 + 0x74],	%o6
	udivcc	%l6,	0x184B,	%g4
	nop
	setx	0x7677B5EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xA6936383,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f24,	%f22
	ta	%icc,	0x6
	udivcc	%o5,	0x1AD0,	%g1
	nop
	set	0x38, %g7
	stw	%i0,	[%l7 + %g7]
	movne	%icc,	%i1,	%l5
	edge16n	%g3,	%g7,	%l4
	fabss	%f14,	%f9
	tpos	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	sta	%f27,	[%l7 + 0x60] %asi
	bg	%xcc,	loop_1749
	fsrc2s	%f27,	%f21
	edge32n	%o3,	%l2,	%o0
	bpos	%xcc,	loop_1750
loop_1749:
	tl	%icc,	0x0
	fmovdl	%icc,	%f11,	%f5
	fmovsle	%xcc,	%f7,	%f2
loop_1750:
	subcc	%i4,	0x119D,	%i3
	mulscc	%l3,	0x0CB0,	%i6
	edge16n	%l1,	%i7,	%i2
	movne	%xcc,	%i5,	%o1
	stbar
	bvc,a,pn	%xcc,	loop_1751
	fones	%f24
	tgu	%xcc,	0x4
	fsrc2	%f16,	%f12
loop_1751:
	edge16n	%l0,	%g5,	%g6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x24] %asi,	%o4
	tvs	%icc,	0x7
	add	%o7,	0x1D9D,	%o2
	bneg,a	%icc,	loop_1752
	edge8	%o6,	%l6,	%g2
	stw	%g4,	[%l7 + 0x24]
	tsubcc	%o5,	%g1,	%i1
loop_1752:
	fbge	%fcc1,	loop_1753
	movg	%xcc,	%l5,	%g3
	bgu,a	%xcc,	loop_1754
	movl	%icc,	%i0,	%g7
loop_1753:
	taddcc	%l4,	0x0C17,	%l2
	srlx	%o0,	0x1A,	%i4
loop_1754:
	fmovrdgez	%i3,	%f26,	%f4
	ldx	[%l7 + 0x40],	%o3
	flush	%l7 + 0x60
	udivcc	%l3,	0x0E2E,	%l1
	fbe	%fcc0,	loop_1755
	fmovrdne	%i6,	%f28,	%f0
	fbug,a	%fcc1,	loop_1756
	xorcc	%i2,	%i5,	%i7
loop_1755:
	fandnot1s	%f12,	%f27,	%f11
	add	%l0,	%o1,	%g5
loop_1756:
	tn	%xcc,	0x1
	fmovs	%f4,	%f5
	srax	%g6,	%o7,	%o2
	alignaddrl	%o6,	%l6,	%o4
	udiv	%g2,	0x0A3B,	%g4
	mulscc	%g1,	%i1,	%l5
	brz,a	%o5,	loop_1757
	movl	%xcc,	%i0,	%g3
	tneg	%icc,	0x6
	fbne	%fcc0,	loop_1758
loop_1757:
	tsubcc	%l4,	0x0CFD,	%l2
	edge32n	%o0,	%g7,	%i4
	udivx	%i3,	0x07C0,	%o3
loop_1758:
	fnor	%f8,	%f20,	%f26
	edge8	%l3,	%i6,	%l1
	movcc	%icc,	%i5,	%i7
	fmovdge	%icc,	%f12,	%f27
	fornot2	%f14,	%f28,	%f2
	nop
	fitos	%f2,	%f17
	fstod	%f17,	%f6
	fblg,a	%fcc0,	loop_1759
	bvs	loop_1760
	fpack32	%f16,	%f0,	%f26
	fbul,a	%fcc2,	loop_1761
loop_1759:
	orcc	%l0,	%o1,	%g5
loop_1760:
	popc	0x0FA9,	%i2
	tg	%icc,	0x1
loop_1761:
	subcc	%o7,	0x0F7E,	%o2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	fitod	%f6,	%f30
	fdtos	%f30,	%f18
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f20
	subccc	%o6,	0x0839,	%g6
	tcc	%icc,	0x3
	fandnot1s	%f21,	%f28,	%f14
	movrgez	%l6,	%g2,	%g4
	nop
	setx	0x67DB141E490E95F9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x43B90B5A352B061D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f22,	%f28
	orcc	%o4,	0x1839,	%g1
	fble,a	%fcc3,	loop_1762
	fbue	%fcc1,	loop_1763
	fmovrse	%i1,	%f10,	%f12
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x26] %asi,	%l5
loop_1762:
	subcc	%o5,	0x137C,	%i0
loop_1763:
	ldsb	[%l7 + 0x6D],	%g3
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f4
	fxtod	%f4,	%f18
	ta	%icc,	0x1
	srlx	%l2,	%l4,	%g7
	fmovsne	%icc,	%f18,	%f6
	fmovsneg	%icc,	%f15,	%f10
	movneg	%xcc,	%i4,	%i3
	fones	%f0
	bg,pt	%xcc,	loop_1764
	be,pt	%xcc,	loop_1765
	sdivx	%o3,	0x0F9A,	%o0
	brlez	%i6,	loop_1766
loop_1764:
	fabss	%f28,	%f20
loop_1765:
	mulscc	%l1,	0x119A,	%i5
	bg,a	%xcc,	loop_1767
loop_1766:
	fcmple16	%f14,	%f24,	%l3
	srax	%i7,	%o1,	%g5
	movrne	%l0,	0x020,	%i2
loop_1767:
	fmovsne	%icc,	%f25,	%f24
	st	%f14,	[%l7 + 0x60]
	sdivcc	%o2,	0x14BD,	%o7
	udivx	%g6,	0x002F,	%o6
	fmovda	%xcc,	%f28,	%f11
	subccc	%l6,	%g4,	%g2
	brlez	%g1,	loop_1768
	smulcc	%i1,	%l5,	%o4
	tvc	%xcc,	0x5
	fcmpne32	%f20,	%f22,	%i0
loop_1768:
	movleu	%xcc,	%g3,	%l2
	fpadd16s	%f27,	%f16,	%f3
	tcs	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x0C] %asi,	%f1
	movrgez	%l4,	0x1D8,	%o5
	fmovdle	%xcc,	%f19,	%f6
	brnz,a	%i4,	loop_1769
	xnorcc	%i3,	%g7,	%o0
	edge8	%i6,	%o3,	%i5
	nop
	set	0x4A, %i1
	sth	%l3,	[%l7 + %i1]
loop_1769:
	alignaddrl	%l1,	%o1,	%g5
	edge16l	%i7,	%l0,	%o2
	bne,pt	%icc,	loop_1770
	andncc	%o7,	%g6,	%o6
	edge8ln	%i2,	%g4,	%g2
	addcc	%g1,	0x1485,	%l6
loop_1770:
	array32	%l5,	%i1,	%i0
	fmovrdlez	%g3,	%f8,	%f12
	sir	0x13D0
	xnorcc	%o4,	%l2,	%l4
	movneg	%icc,	%o5,	%i3
	tpos	%xcc,	0x4
	nop
	setx	loop_1771,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ld	[%l7 + 0x24],	%f7
	tcs	%icc,	0x3
	std	%f6,	[%l7 + 0x28]
loop_1771:
	fmovsg	%icc,	%f26,	%f28
	fmovdne	%xcc,	%f18,	%f16
	movn	%icc,	%i4,	%g7
	for	%f30,	%f6,	%f10
	movleu	%xcc,	%i6,	%o0
	andcc	%i5,	%l3,	%l1
	edge16l	%o3,	%g5,	%o1
	movge	%icc,	%i7,	%o2
	tcc	%icc,	0x6
	fcmpeq32	%f26,	%f18,	%l0
	array32	%o7,	%g6,	%o6
	andn	%g4,	%g2,	%i2
	srl	%l6,	%g1,	%i1
	srlx	%i0,	%g3,	%o4
	xnor	%l2,	%l5,	%l4
	edge8l	%o5,	%i4,	%i3
	edge8l	%g7,	%o0,	%i6
	fmovdcs	%xcc,	%f12,	%f8
	tg	%icc,	0x4
	fcmpgt32	%f18,	%f16,	%i5
	tge	%xcc,	0x2
	nop
	set	0x60, %o2
	ldsw	[%l7 + %o2],	%l1
	addccc	%o3,	%l3,	%g5
	edge16ln	%o1,	%o2,	%l0
	bge,a	%xcc,	loop_1772
	edge32n	%i7,	%g6,	%o6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o7,	%g2
loop_1772:
	lduw	[%l7 + 0x4C],	%g4
	sra	%i2,	%g1,	%l6
	tne	%icc,	0x0
	subcc	%i0,	0x1DE3,	%g3
	tvc	%xcc,	0x1
	alignaddr	%i1,	%l2,	%o4
	nop
	setx	0x440D694A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x76F6EB52,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f31,	%f30
	movvc	%xcc,	%l5,	%l4
	bneg	loop_1773
	movvc	%icc,	%o5,	%i4
	addcc	%i3,	%g7,	%i6
	sllx	%i5,	0x19,	%o0
loop_1773:
	nop
	set	0x48, %o3
	stha	%l1,	[%l7 + %o3] 0x23
	membar	#Sync
	sllx	%o3,	%g5,	%o1
	movrgez	%l3,	%o2,	%l0
	sdivx	%i7,	0x0D45,	%g6
	fmovdl	%icc,	%f7,	%f7
	movneg	%icc,	%o6,	%o7
	alignaddr	%g2,	%i2,	%g4
	edge16n	%g1,	%l6,	%i0
	fba	%fcc2,	loop_1774
	sra	%g3,	%i1,	%o4
	fone	%f24
	or	%l2,	0x13B6,	%l5
loop_1774:
	fmul8x16al	%f22,	%f11,	%f14
	addc	%l4,	0x1A95,	%o5
	move	%xcc,	%i3,	%i4
	for	%f14,	%f10,	%f28
	tcc	%icc,	0x6
	edge16n	%i6,	%g7,	%i5
	fcmpgt32	%f24,	%f24,	%l1
	ldsb	[%l7 + 0x3B],	%o0
	fmul8x16au	%f26,	%f19,	%f8
	fbn	%fcc3,	loop_1775
	array8	%o3,	%g5,	%o1
	or	%o2,	%l3,	%i7
	sir	0x0AD4
loop_1775:
	edge32n	%l0,	%o6,	%g6
	movrgz	%g2,	0x3F5,	%o7
	te	%xcc,	0x1
	or	%g4,	%g1,	%l6
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x218] %asi,	%i2
	tleu	%xcc,	0x1
	fmovrdgz	%g3,	%f26,	%f30
	fmul8x16al	%f10,	%f2,	%f28
	fblg	%fcc3,	loop_1776
	ldsw	[%l7 + 0x54],	%i0
	set	0x3A, %i4
	lduha	[%l7 + %i4] 0x18,	%i1
loop_1776:
	fzero	%f14
	smulcc	%l2,	%l5,	%l4
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	mulscc	%o5,	0x1DB0,	%i3
	bg,a,pn	%icc,	loop_1777
	mulx	%o4,	%i6,	%g7
	fnot2s	%f30,	%f7
	tcc	%icc,	0x3
loop_1777:
	srl	%i5,	%i4,	%l1
	bcc,a	%xcc,	loop_1778
	movge	%xcc,	%o0,	%g5
	ldsw	[%l7 + 0x28],	%o1
	set	0x20, %i6
	lduwa	[%l7 + %i6] 0x89,	%o2
loop_1778:
	ldx	[%l7 + 0x20],	%o3
	fandnot2	%f30,	%f28,	%f8
	fmovdcs	%icc,	%f17,	%f21
	nop
	setx	0x0BC8E56B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xA2387F51,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f20,	%f20
	array32	%l3,	%i7,	%l0
	subccc	%g6,	0x1126,	%g2
	nop
	setx	loop_1779,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%icc,	0x2
	nop
	set	0x56, %l5
	ldsh	[%l7 + %l5],	%o6
	movge	%xcc,	%g4,	%o7
loop_1779:
	nop
	setx	0x854531D3BD4C9DCE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f18
	fbe,a	%fcc3,	loop_1780
	xorcc	%l6,	%g1,	%g3
	umul	%i0,	0x0B89,	%i2
	movvc	%icc,	%i1,	%l5
loop_1780:
	fsrc2s	%f17,	%f20
	tne	%xcc,	0x5
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f30
	movleu	%xcc,	%l2,	%l4
	tleu	%icc,	0x7
	nop
	fitos	%f9,	%f19
	fstoi	%f19,	%f17
	taddcctv	%i3,	0x169F,	%o5
	mulx	%o4,	0x1EE3,	%g7
	nop
	set	0x14, %i0
	prefetch	[%l7 + %i0],	 0x0
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f28
	fxtod	%f28,	%f4
	fbue	%fcc2,	loop_1781
	tneg	%xcc,	0x6
	sll	%i6,	%i5,	%l1
	wr	%g0,	0x57,	%asi
	stxa	%o0,	[%g0 + 0x0] %asi
loop_1781:
	sra	%i4,	0x12,	%o1
	subc	%o2,	%g5,	%l3
	movrlez	%i7,	%o3,	%g6
	array16	%g2,	%l0,	%o6
	fbe	%fcc0,	loop_1782
	bn	loop_1783
	tcc	%xcc,	0x6
	lduw	[%l7 + 0x34],	%o7
loop_1782:
	fone	%f10
loop_1783:
	fxor	%f20,	%f6,	%f18
	xorcc	%g4,	%g1,	%l6
	smulcc	%g3,	%i2,	%i0
	fornot1s	%f19,	%f15,	%f23
	sra	%i1,	%l2,	%l4
	tne	%xcc,	0x1
	smul	%i3,	0x0498,	%l5
	popc	0x1F30,	%o4
	fbue,a	%fcc0,	loop_1784
	addc	%o5,	%g7,	%i6
	tle	%icc,	0x5
	fpackfix	%f30,	%f24
loop_1784:
	fmovrsne	%i5,	%f2,	%f19
	nop
	set	0x30, %g3
	stx	%l1,	[%l7 + %g3]
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	tpos	%icc,	0x3
	set	0x40, %i2
	ldsha	[%l7 + %i2] 0x0c,	%o1
	orcc	%o2,	%g5,	%o0
	fba	%fcc2,	loop_1785
	nop
	set	0x3C, %o0
	sth	%l3,	[%l7 + %o0]
	mulx	%i7,	%o3,	%g6
	alignaddrl	%g2,	%l0,	%o6
loop_1785:
	tneg	%xcc,	0x4
	sll	%g4,	0x0B,	%g1
	edge8n	%l6,	%g3,	%o7
	xorcc	%i2,	0x1402,	%i1
	fcmpgt16	%f14,	%f4,	%l2
	mova	%icc,	%i0,	%i3
	movleu	%icc,	%l4,	%o4
	xor	%l5,	0x0240,	%o5
	alignaddrl	%g7,	%i6,	%i5
	sdivcc	%i4,	0x05AC,	%l1
	andcc	%o1,	%o2,	%o0
	xnor	%l3,	0x1DEF,	%g5
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1a8] %asi,	%i7 ripped by fixASI40.pl ripped by fixASI40.pl
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%o3
	st	%f29,	[%l7 + 0x70]
	movre	%g2,	0x023,	%o6
	taddcc	%l0,	%g1,	%g4
	fmovscs	%xcc,	%f19,	%f19
	udivx	%g3,	0x0D43,	%o7
	fones	%f3
	edge8	%l6,	%i2,	%i1
	fpsub32	%f30,	%f0,	%f26
	brnz,a	%i0,	loop_1786
	tvc	%icc,	0x4
	movcs	%xcc,	%i3,	%l2
	set	0x54, %g6
	lduba	[%l7 + %g6] 0x0c,	%l4
loop_1786:
	nop
	set	0x2B, %l0
	ldstuba	[%l7 + %l0] 0x0c,	%o4
	movne	%xcc,	%o5,	%g7
	fandnot2	%f6,	%f0,	%f16
	edge32ln	%i6,	%i5,	%i4
	fbn	%fcc1,	loop_1787
	addc	%l1,	0x0299,	%l5
	fmovscc	%icc,	%f25,	%f2
	fmovsvs	%xcc,	%f23,	%f30
loop_1787:
	xnor	%o2,	0x0688,	%o1
	subccc	%o0,	%g5,	%i7
	fornot2s	%f2,	%f20,	%f18
	fba,a	%fcc2,	loop_1788
	udivcc	%g6,	0x08D0,	%l3
	sdivcc	%o3,	0x0403,	%o6
	smul	%l0,	%g2,	%g1
loop_1788:
	nop
	setx	0x50774836,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	edge8ln	%g4,	%g3,	%l6
	popc	%i2,	%o7
	edge8n	%i0,	%i1,	%i3
	fbge,a	%fcc3,	loop_1789
	xorcc	%l2,	%l4,	%o5
	movvs	%icc,	%g7,	%i6
	mulscc	%o4,	%i4,	%i5
loop_1789:
	edge32	%l1,	%l5,	%o2
	ldx	[%l7 + 0x40],	%o0
	edge32	%o1,	%g5,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo,a	%fcc1,	loop_1790
	tg	%icc,	0x2
	smul	%l3,	%g6,	%o6
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x2a,	%o2
loop_1790:
	edge32ln	%l0,	%g2,	%g1
	brgz,a	%g4,	loop_1791
	ldd	[%l7 + 0x40],	%i6
	edge8ln	%i2,	%g3,	%i0
	orn	%i1,	0x1C86,	%o7
loop_1791:
	taddcc	%i3,	0x1664,	%l2
	nop
	setx	0xF60F14C4E812C312,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5EB7846142E0858B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f24,	%f18
	nop
	setx	loop_1792,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg,a	%fcc1,	loop_1793
	bgu,pn	%icc,	loop_1794
	movgu	%xcc,	%l4,	%g7
loop_1792:
	nop
	setx	0x0D48FE81F6F04E73,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x187222A175E12D13,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f30,	%f18
loop_1793:
	smul	%o5,	%o4,	%i4
loop_1794:
	prefetch	[%l7 + 0x38],	 0x3
	subccc	%i6,	0x0B92,	%l1
	xnorcc	%i5,	%l5,	%o0
	xnorcc	%o1,	%o2,	%i7
	edge32	%g5,	%l3,	%g6
	xnor	%o6,	0x0733,	%o3
	movrne	%g2,	%l0,	%g1
	bleu,a,pn	%xcc,	loop_1795
	bcs,a	loop_1796
	bn	loop_1797
	movvs	%icc,	%g4,	%i2
loop_1795:
	fors	%f13,	%f31,	%f27
loop_1796:
	xnorcc	%g3,	%l6,	%i0
loop_1797:
	tne	%xcc,	0x0
	bg	loop_1798
	taddcctv	%o7,	0x0B55,	%i3
	tneg	%xcc,	0x7
	fandnot1s	%f1,	%f5,	%f4
loop_1798:
	ta	%xcc,	0x1
	sllx	%l2,	%l4,	%i1
	movrlz	%g7,	%o4,	%i4
	umulcc	%i6,	0x036F,	%l1
	movn	%xcc,	%i5,	%o5
	subccc	%o0,	%l5,	%o2
	mova	%icc,	%o1,	%g5
	fmovsleu	%icc,	%f19,	%f13
	xorcc	%l3,	%g6,	%i7
	tl	%icc,	0x0
	edge8n	%o3,	%g2,	%o6
	bcs,a,pt	%xcc,	loop_1799
	fbug,a	%fcc1,	loop_1800
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%l0,	%g4
loop_1799:
	fbul,a	%fcc3,	loop_1801
loop_1800:
	tpos	%xcc,	0x6
	bneg	loop_1802
	tle	%xcc,	0x3
loop_1801:
	nop
	set	0x0C, %g4
	ldswa	[%l7 + %g4] 0x11,	%i2
loop_1802:
	fbg,a	%fcc3,	loop_1803
	add	%g3,	%g1,	%l6
	popc	0x03E4,	%o7
	or	%i0,	0x0B01,	%l2
loop_1803:
	mova	%xcc,	%i3,	%l4
	for	%f10,	%f22,	%f26
	bgu,a,pn	%icc,	loop_1804
	movg	%xcc,	%g7,	%i1
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1804:
	nop
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x14
	edge8l	%o4,	%i6,	%i4
	popc	%l1,	%i5
	movvc	%icc,	%o0,	%l5
	ba,a	loop_1805
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	sta	%f17,	[%l7 + 0x50] %asi
loop_1805:
	fmovdne	%xcc,	%f4,	%f16
	umul	%o5,	0x047E,	%o1
	subc	%g5,	0x183A,	%o2
	tneg	%icc,	0x7
	array16	%l3,	%i7,	%g6
	fpsub32	%f20,	%f10,	%f16
	tgu	%xcc,	0x0
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x14
	alignaddrl	%o3,	%o6,	%g2
	array16	%g4,	%l0,	%i2
	fmovrdlz	%g3,	%f16,	%f22
	movrgez	%l6,	0x282,	%o7
	taddcctv	%i0,	0x18C1,	%g1
	movne	%xcc,	%l2,	%i3
	bleu,pn	%xcc,	loop_1806
	ta	%icc,	0x2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g7
loop_1806:
	fnor	%f22,	%f30,	%f30
	bcc,a	%xcc,	loop_1807
	tpos	%icc,	0x0
	edge8ln	%i1,	%o4,	%l4
	add	%i4,	0x103B,	%l1
loop_1807:
	nop
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x4D] %asi,	%i6
	nop
	fitos	%f9,	%f20
	fstox	%f20,	%f14
	ldd	[%l7 + 0x60],	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%icc,	%f22,	%f8
	fpsub32s	%f23,	%f14,	%f14
	bvs,a,pt	%xcc,	loop_1808
	bvc,a	loop_1809
	movl	%icc,	%l5,	%o0
	movcs	%xcc,	%o5,	%o1
loop_1808:
	movle	%icc,	%g5,	%o2
loop_1809:
	lduh	[%l7 + 0x54],	%l3
	fcmpgt32	%f20,	%f14,	%g6
	fmovde	%icc,	%f12,	%f28
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x10,	%o3
	fmovse	%xcc,	%f30,	%f11
	swap	[%l7 + 0x10],	%o6
	movrlez	%i7,	0x01A,	%g4
	movg	%xcc,	%g2,	%l0
	fcmpeq16	%f30,	%f18,	%i2
	movvc	%xcc,	%g3,	%o7
	subccc	%l6,	%i0,	%g1
	udivx	%i3,	0x071C,	%l2
	nop
	setx	0x8071B319,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	tneg	%icc,	0x7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x3A] %asi,	%i1
	udivx	%o4,	0x0501,	%l4
	set	0x36, %o4
	lduha	[%l7 + %o4] 0x0c,	%i4
	tge	%icc,	0x3
	fmovrde	%l1,	%f12,	%f12
	sth	%i6,	[%l7 + 0x1E]
	sdiv	%g7,	0x1D1D,	%i5
	fbue	%fcc1,	loop_1810
	fnot2s	%f8,	%f8
	fornot2s	%f14,	%f8,	%f14
	sth	%o0,	[%l7 + 0x26]
loop_1810:
	andncc	%o5,	%o1,	%l5
	add	%l7,	0x14,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x0c,	%g5,	%o2
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l3
	fbl,a	%fcc3,	loop_1811
	membar	0x1A
	fmovse	%xcc,	%f23,	%f26
	fone	%f22
loop_1811:
	movrlez	%g6,	%o6,	%o3
	movpos	%icc,	%g4,	%g2
	fcmpeq32	%f24,	%f10,	%i7
	tleu	%icc,	0x2
	orn	%l0,	%g3,	%i2
	sdiv	%l6,	0x112C,	%i0
	edge16ln	%g1,	%o7,	%i3
	subccc	%l2,	%o4,	%l4
	sra	%i4,	%i1,	%i6
	udivx	%g7,	0x1296,	%i5
	ta	%icc,	0x3
	nop
	fitos	%f3,	%f1
	and	%o0,	%o5,	%l1
	fbu,a	%fcc2,	loop_1812
	subcc	%o1,	0x148B,	%l5
	edge8	%g5,	%o2,	%g6
	orn	%l3,	0x0702,	%o3
loop_1812:
	andcc	%o6,	%g2,	%g4
	tne	%xcc,	0x0
	bcc	loop_1813
	fbe,a	%fcc1,	loop_1814
	umul	%i7,	0x1A15,	%l0
	subcc	%i2,	%g3,	%l6
loop_1813:
	bg,a	loop_1815
loop_1814:
	edge8n	%i0,	%o7,	%i3
	nop
	setx	0x0DDA33CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xDA026199,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f25,	%f23
	tne	%icc,	0x5
loop_1815:
	membar	0x7D
	movn	%icc,	%g1,	%o4
	fmovs	%f4,	%f12
	st	%f21,	[%l7 + 0x70]
	sdivcc	%l2,	0x0ADA,	%i4
	sra	%l4,	0x17,	%i6
	tneg	%icc,	0x7
	xorcc	%g7,	%i5,	%i1
	movrgz	%o5,	%l1,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f10
	ba,a,pt	%icc,	loop_1816
	edge8n	%o1,	%l5,	%g5
	sdiv	%g6,	0x1F88,	%o2
	sdivcc	%l3,	0x0102,	%o6
loop_1816:
	movcc	%xcc,	%g2,	%o3
	fbue,a	%fcc2,	loop_1817
	umulcc	%g4,	0x05E2,	%l0
	xnor	%i7,	%g3,	%l6
	tsubcctv	%i0,	%i2,	%o7
loop_1817:
	edge8n	%i3,	%o4,	%l2
	stbar
	orcc	%g1,	%i4,	%i6
	edge16l	%l4,	%i5,	%g7
	movl	%icc,	%o5,	%i1
	movpos	%icc,	%l1,	%o1
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f10
	fxtod	%f10,	%f18
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o0
	fbn,a	%fcc3,	loop_1818
	tge	%xcc,	0x2
	addcc	%l5,	0x19B2,	%g5
	subcc	%g6,	%l3,	%o2
loop_1818:
	fexpand	%f16,	%f4
	fmovdneg	%xcc,	%f28,	%f31
	fxors	%f15,	%f17,	%f7
	tge	%xcc,	0x5
	fbug,a	%fcc1,	loop_1819
	array8	%o6,	%o3,	%g4
	movgu	%xcc,	%l0,	%g2
	fmovsl	%xcc,	%f24,	%f12
loop_1819:
	udivcc	%i7,	0x144C,	%g3
	xnorcc	%l6,	0x005D,	%i2
	edge32	%o7,	%i3,	%o4
	movcc	%icc,	%l2,	%i0
	pdist	%f0,	%f14,	%f10
	subcc	%i4,	%g1,	%l4
	xor	%i6,	0x0037,	%i5
	xnorcc	%g7,	%i1,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o5,	%o0,	%l5
	andn	%o1,	%g6,	%g5
	addcc	%l3,	0x1A14,	%o6
	fand	%f18,	%f6,	%f8
	edge8n	%o2,	%g4,	%o3
	movn	%icc,	%l0,	%i7
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x26,	%g2
	orcc	%g3,	%l6,	%o7
	fexpand	%f6,	%f26
	nop
	fitos	%f2,	%f16
	fstoi	%f16,	%f16
	add	%i3,	0x03A1,	%o4
	andcc	%l2,	%i2,	%i0
	bg,a	%xcc,	loop_1820
	edge8l	%i4,	%l4,	%i6
	sdivcc	%g1,	0x0E68,	%i5
	movneg	%xcc,	%g7,	%l1
loop_1820:
	bne	loop_1821
	fornot1	%f4,	%f18,	%f2
	brgz,a	%o5,	loop_1822
	sdivx	%o0,	0x0E9D,	%i1
loop_1821:
	fbul	%fcc2,	loop_1823
	edge16ln	%l5,	%g6,	%o1
loop_1822:
	fbl	%fcc1,	loop_1824
	ldd	[%l7 + 0x58],	%l2
loop_1823:
	bneg,a	loop_1825
	mova	%icc,	%g5,	%o6
loop_1824:
	nop
	set	0x24, %o7
	lda	[%l7 + %o7] 0x88,	%f22
loop_1825:
	brlz	%o2,	loop_1826
	addc	%o3,	%g4,	%l0
	fmovdl	%icc,	%f30,	%f6
	srax	%i7,	0x15,	%g3
loop_1826:
	movrgz	%g2,	%o7,	%l6
	subccc	%o4,	%l2,	%i2
	bne,a	%xcc,	loop_1827
	orncc	%i3,	0x1F0F,	%i4
	udivx	%l4,	0x11E7,	%i0
	sethi	0x1323,	%i6
loop_1827:
	fbne	%fcc1,	loop_1828
	smulcc	%g1,	%i5,	%g7
	fors	%f15,	%f0,	%f3
	movl	%icc,	%o5,	%l1
loop_1828:
	tle	%xcc,	0x2
	edge32n	%o0,	%i1,	%l5
	orcc	%o1,	0x1703,	%l3
	fmovdneg	%icc,	%f20,	%f21
	subc	%g6,	%g5,	%o2
	umulcc	%o3,	0x06EE,	%g4
	movvs	%xcc,	%l0,	%i7
	movre	%g3,	0x2F2,	%o6
	fmovrdlez	%g2,	%f30,	%f20
	fmovsge	%xcc,	%f31,	%f7
	fmovrde	%o7,	%f28,	%f26
	fbuge	%fcc2,	loop_1829
	srlx	%l6,	%o4,	%i2
	fmovdvs	%xcc,	%f12,	%f26
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l2
loop_1829:
	subcc	%i4,	%l4,	%i3
	tneg	%xcc,	0x4
	and	%i0,	0x0445,	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i6,	%i5
	fmovsa	%xcc,	%f27,	%f10
	edge32ln	%o5,	%g7,	%o0
	fmovsge	%icc,	%f24,	%f29
	edge8n	%i1,	%l5,	%o1
	ta	%xcc,	0x7
	tvc	%icc,	0x4
	orcc	%l1,	%l3,	%g5
	fmovse	%xcc,	%f26,	%f24
	sdiv	%o2,	0x0007,	%o3
	andn	%g4,	0x1B7A,	%g6
	flush	%l7 + 0x64
	bcc	%icc,	loop_1830
	tne	%icc,	0x0
	fmul8x16au	%f13,	%f17,	%f28
	movgu	%icc,	%i7,	%g3
loop_1830:
	tpos	%xcc,	0x5
	bleu,a,pn	%xcc,	loop_1831
	movrgz	%o6,	%l0,	%g2
	andncc	%l6,	%o4,	%o7
	andcc	%l2,	0x129E,	%i4
loop_1831:
	taddcctv	%i2,	0x0789,	%l4
	brz,a	%i0,	loop_1832
	nop
	fitos	%f5,	%f23
	fstox	%f23,	%f24
	move	%xcc,	%i3,	%g1
	subcc	%i5,	%o5,	%g7
loop_1832:
	taddcc	%o0,	0x0771,	%i1
	movvc	%xcc,	%l5,	%o1
	edge8	%l1,	%i6,	%g5
	orcc	%o2,	0x039E,	%l3
	ble,a	%xcc,	loop_1833
	bcs,pt	%icc,	loop_1834
	movpos	%xcc,	%g4,	%o3
	subcc	%i7,	%g3,	%g6
loop_1833:
	fmovdle	%xcc,	%f17,	%f11
loop_1834:
	nop
	setx	0xEE5E680C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x00F7A889,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f28,	%f9
	and	%l0,	0x1613,	%o6
	edge16ln	%l6,	%g2,	%o4
	sth	%o7,	[%l7 + 0x30]
	add	%l2,	%i2,	%l4
	bge,pn	%icc,	loop_1835
	udivx	%i0,	0x1CA2,	%i3
	tge	%xcc,	0x0
	fpadd32	%f18,	%f22,	%f0
loop_1835:
	udiv	%i4,	0x0431,	%i5
	bpos,pt	%xcc,	loop_1836
	array16	%o5,	%g7,	%o0
	smulcc	%g1,	0x0982,	%l5
	fbe	%fcc3,	loop_1837
loop_1836:
	sll	%i1,	%o1,	%i6
	bshuffle	%f0,	%f8,	%f6
	edge32	%g5,	%o2,	%l1
loop_1837:
	fmovrsgez	%g4,	%f12,	%f5
	tneg	%xcc,	0x0
	bcs,a,pn	%icc,	loop_1838
	subccc	%l3,	%i7,	%o3
	fbn,a	%fcc1,	loop_1839
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f10
	fxtod	%f10,	%f2
loop_1838:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g6,	%g3,	%l0
loop_1839:
	fbu	%fcc0,	loop_1840
	nop
	setx	0xDA6C9028CDDD29B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f2
	edge8n	%o6,	%g2,	%l6
	xnor	%o4,	%l2,	%i2
loop_1840:
	bleu,pn	%icc,	loop_1841
	movge	%icc,	%o7,	%l4
	andcc	%i3,	%i4,	%i0
	bne,pt	%icc,	loop_1842
loop_1841:
	edge32l	%o5,	%i5,	%o0
	fnand	%f28,	%f24,	%f0
	fbu	%fcc3,	loop_1843
loop_1842:
	movrgz	%g7,	0x3A7,	%g1
	xnor	%i1,	%o1,	%l5
	fbge,a	%fcc3,	loop_1844
loop_1843:
	tvs	%xcc,	0x7
	andncc	%g5,	%o2,	%i6
	or	%l1,	%g4,	%i7
loop_1844:
	or	%o3,	0x0E71,	%g6
	lduw	[%l7 + 0x2C],	%l3
	edge16ln	%g3,	%o6,	%g2
	edge32	%l0,	%o4,	%l2
	andn	%l6,	0x119A,	%i2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x23] %asi,	%l4
	set	0x16, %g1
	ldsha	[%l7 + %g1] 0x80,	%o7
	fbug,a	%fcc1,	loop_1845
	fpack32	%f20,	%f0,	%f14
	addcc	%i3,	0x0619,	%i0
	array32	%o5,	%i5,	%o0
loop_1845:
	tcs	%xcc,	0x2
	andcc	%g7,	0x1E40,	%g1
	stb	%i1,	[%l7 + 0x37]
	srl	%i4,	0x16,	%o1
	fone	%f4
	sdivx	%g5,	0x081A,	%o2
	mulscc	%i6,	%l5,	%g4
	edge16	%l1,	%i7,	%o3
	tl	%icc,	0x6
	tcc	%icc,	0x2
	edge32	%g6,	%l3,	%g3
	array16	%g2,	%o6,	%o4
	fbn,a	%fcc3,	loop_1846
	movrgz	%l0,	%l6,	%l2
	bcs,a,pn	%icc,	loop_1847
	movrne	%i2,	0x253,	%l4
loop_1846:
	bvs,a,pt	%xcc,	loop_1848
	edge32l	%o7,	%i0,	%i3
loop_1847:
	edge32	%i5,	%o0,	%g7
	edge8l	%o5,	%g1,	%i1
loop_1848:
	nop
	set	0x6C, %o6
	lduwa	[%l7 + %o6] 0x14,	%o1
	ldub	[%l7 + 0x20],	%g5
	te	%icc,	0x2
	movn	%icc,	%o2,	%i6
	sll	%i4,	0x1F,	%g4
	move	%xcc,	%l1,	%i7
	movg	%xcc,	%l5,	%o3
	subc	%g6,	%l3,	%g2
	fpsub16s	%f25,	%f22,	%f23
	ldx	[%l7 + 0x50],	%o6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	movg	%icc,	%l0,	%g3
	call	loop_1849
	movgu	%icc,	%l2,	%l6
	fandnot2s	%f5,	%f23,	%f2
	mulx	%i2,	%o7,	%i0
loop_1849:
	tvs	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x50] %asi,	%i3
	movne	%icc,	%l4,	%i5
	fmovscs	%icc,	%f9,	%f1
	movre	%o0,	0x26D,	%o5
	bl,a	loop_1850
	tcs	%xcc,	0x1
	fandnot1	%f14,	%f18,	%f28
	fnand	%f12,	%f16,	%f10
loop_1850:
	popc	0x1DAC,	%g7
	ldd	[%l7 + 0x20],	%g0
	nop
	setx loop_1851, %l0, %l1
	jmpl %l1, %i1
	movcc	%icc,	%g5,	%o1
	wr	%g0,	0x19,	%asi
	sta	%f31,	[%l7 + 0x40] %asi
loop_1851:
	sethi	0x0505,	%i6
	tleu	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i4
	movle	%xcc,	%g4,	%o2
	or	%i7,	0x04F6,	%l5
	for	%f14,	%f4,	%f10
	ldd	[%l7 + 0x50],	%l0
	swap	[%l7 + 0x0C],	%o3
	fbe	%fcc1,	loop_1852
	fbne	%fcc2,	loop_1853
	popc	0x1346,	%l3
	edge8	%g2,	%o6,	%g6
loop_1852:
	edge32ln	%o4,	%l0,	%l2
loop_1853:
	tneg	%icc,	0x7
	movg	%xcc,	%g3,	%l6
	ldd	[%l7 + 0x20],	%f14
	xnorcc	%o7,	%i2,	%i0
	mulx	%i3,	%i5,	%o0
	udivx	%l4,	0x0F46,	%g7
	subccc	%o5,	%i1,	%g5
	fandnot2s	%f28,	%f21,	%f6
	fbu,a	%fcc2,	loop_1854
	andn	%g1,	%i6,	%o1
	fbge,a	%fcc0,	loop_1855
	sra	%i4,	0x07,	%g4
loop_1854:
	tg	%xcc,	0x3
	fbug	%fcc3,	loop_1856
loop_1855:
	ldsh	[%l7 + 0x12],	%o2
	nop
	fitos	%f2,	%f21
	fstoi	%f21,	%f21
	smulcc	%i7,	%l5,	%l1
loop_1856:
	edge8n	%o3,	%g2,	%o6
	fmovdvs	%icc,	%f15,	%f28
	edge16	%g6,	%o4,	%l0
	sdivx	%l3,	0x1182,	%g3
	edge8	%l6,	%o7,	%i2
	tneg	%icc,	0x4
	fblg	%fcc0,	loop_1857
	tsubcc	%i0,	0x18FE,	%l2
	fbue,a	%fcc2,	loop_1858
	array32	%i3,	%o0,	%l4
loop_1857:
	nop
	set	0x46, %l3
	stha	%i5,	[%l7 + %l3] 0x80
loop_1858:
	sir	0x158A
	nop
	setx	0x06A837255E065724,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x7346232979AF9F22,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f4,	%f14
	fornot1s	%f25,	%f11,	%f5
	sethi	0x1184,	%g7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%i1,	%o5
	nop
	setx	loop_1859,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%xcc,	%g1,	%i6
	fmovdl	%xcc,	%f14,	%f28
	fzero	%f22
loop_1859:
	sdivx	%o1,	0x0AFF,	%g5
	movcc	%xcc,	%g4,	%o2
	edge32n	%i4,	%i7,	%l5
	movge	%icc,	%o3,	%g2
	bge,a	%xcc,	loop_1860
	sll	%l1,	0x17,	%g6
	movcs	%xcc,	%o4,	%l0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x68] %asi,	%l3
loop_1860:
	nop
	setx	0xB064DD56,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	fmovsl	%xcc,	%f19,	%f10
	ldd	[%l7 + 0x08],	%f16
	fbge	%fcc2,	loop_1861
	fnot2s	%f14,	%f31
	ldx	[%l7 + 0x30],	%g3
	movcc	%xcc,	%l6,	%o6
loop_1861:
	sub	%i2,	%i0,	%l2
	tvc	%xcc,	0x4
	brnz,a	%o7,	loop_1862
	movpos	%xcc,	%i3,	%o0
	movrne	%l4,	%i5,	%i1
	tne	%icc,	0x7
loop_1862:
	bl,pn	%xcc,	loop_1863
	membar	0x6A
	movcs	%xcc,	%g7,	%o5
	fba	%fcc0,	loop_1864
loop_1863:
	tn	%icc,	0x3
	nop
	fitod	%f26,	%f2
	movvc	%xcc,	%i6,	%g1
loop_1864:
	fmovrdgz	%g5,	%f10,	%f28
	sdiv	%o1,	0x0A5F,	%o2
	subcc	%g4,	0x0B65,	%i7
	sdiv	%i4,	0x0C5F,	%o3
	andcc	%l5,	%g2,	%l1
	array16	%g6,	%l0,	%l3
	st	%f31,	[%l7 + 0x58]
	edge8	%g3,	%o4,	%l6
	subccc	%o6,	%i2,	%i0
	set	0x68, %l2
	prefetcha	[%l7 + %l2] 0x04,	 0x0
	edge8n	%i3,	%o0,	%l4
	fpadd16s	%f4,	%f10,	%f20
	ta	%icc,	0x4
	te	%xcc,	0x0
	udivcc	%i5,	0x1A28,	%l2
	fandnot2s	%f10,	%f28,	%f3
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g7
	ldd	[%l7 + 0x20],	%f16
	tgu	%icc,	0x5
	fxors	%f17,	%f2,	%f2
	ta	%xcc,	0x4
	alignaddrl	%i1,	%i6,	%g1
	array16	%g5,	%o5,	%o2
	edge16ln	%o1,	%g4,	%i7
	taddcctv	%o3,	%i4,	%g2
	and	%l5,	%g6,	%l1
	set	0x1B, %g2
	lduba	[%l7 + %g2] 0x10,	%l3
	movcs	%icc,	%g3,	%o4
	ldub	[%l7 + 0x58],	%l0
	fbug,a	%fcc3,	loop_1865
	edge32l	%l6,	%o6,	%i0
	movcc	%icc,	%o7,	%i2
	smul	%i3,	0x0ECD,	%l4
loop_1865:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i5
	or	%o0,	%l2,	%g7
	fbne,a	%fcc1,	loop_1866
	tg	%xcc,	0x2
	srl	%i6,	0x02,	%i1
	edge16ln	%g1,	%g5,	%o2
loop_1866:
	movcc	%icc,	%o5,	%o1
	bg	loop_1867
	andn	%g4,	%o3,	%i7
	alignaddrl	%g2,	%l5,	%g6
	nop
	set	0x6A, %i3
	stb	%l1,	[%l7 + %i3]
loop_1867:
	fmovscc	%icc,	%f4,	%f13
	fornot2s	%f22,	%f0,	%f11
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
	fands	%f11,	%f22,	%f4
	array8	%i4,	%o4,	%g3
	or	%l6,	0x1BD8,	%l0
	fmovsl	%icc,	%f20,	%f1
	nop
	setx	0xB20E6E90BF4D4127,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB4017A682A4CDEE7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f30,	%f0
	brlz,a	%o6,	loop_1868
	fmovdgu	%xcc,	%f1,	%f21
	fandnot1	%f18,	%f8,	%f14
	tleu	%icc,	0x4
loop_1868:
	sethi	0x1D74,	%o7
	fnot2s	%f11,	%f10
	sub	%i0,	0x1A5F,	%i2
	fbo,a	%fcc0,	loop_1869
	edge16l	%l4,	%i5,	%o0
	edge16	%i3,	%g7,	%l2
	taddcctv	%i1,	0x018E,	%i6
loop_1869:
	bne,pn	%icc,	loop_1870
	edge8ln	%g5,	%g1,	%o5
	udivcc	%o1,	0x0416,	%o2
	nop
	fitod	%f4,	%f10
	fdtoi	%f10,	%f8
loop_1870:
	ldx	[%l7 + 0x50],	%o3
	movne	%icc,	%i7,	%g4
	umulcc	%g2,	0x0C17,	%g6
	fands	%f13,	%f5,	%f0
	bshuffle	%f10,	%f28,	%f16
	call	loop_1871
	movre	%l5,	%l3,	%i4
	udivx	%l1,	0x06A9,	%g3
	array8	%l6,	%o4,	%l0
loop_1871:
	movvc	%xcc,	%o6,	%i0
	tne	%icc,	0x4
	orcc	%o7,	0x1A32,	%i2
	fbu	%fcc2,	loop_1872
	bl,pt	%icc,	loop_1873
	movrlez	%i5,	%o0,	%l4
	move	%xcc,	%i3,	%l2
loop_1872:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f19,	[%l7 + 0x30] %asi
loop_1873:
	nop
	fitod	%f8,	%f20
	fdtox	%f20,	%f30
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%i6
	movrgez	%g7,	%g5,	%g1
	movne	%icc,	%o1,	%o5
	movpos	%icc,	%o3,	%i7
	movrlez	%g4,	%g2,	%g6
	tle	%icc,	0x4
	brgez	%l5,	loop_1874
	tleu	%icc,	0x6
	fmovrdlz	%l3,	%f24,	%f28
	addccc	%o2,	0x03B1,	%i4
loop_1874:
	nop
	set	0x14, %i7
	stha	%g3,	[%l7 + %i7] 0xe2
	membar	#Sync
	te	%icc,	0x3
	mulx	%l1,	0x0484,	%l6
	subcc	%l0,	%o6,	%i0
	fbg	%fcc2,	loop_1875
	fmovsa	%icc,	%f3,	%f28
	movl	%icc,	%o4,	%o7
	nop
	set	0x50, %l1
	ldstub	[%l7 + %l1],	%i5
loop_1875:
	addccc	%o0,	0x0F9C,	%l4
	orncc	%i3,	%l2,	%i2
	ldx	[%l7 + 0x60],	%i1
	mulx	%i6,	0x1F26,	%g7
	movleu	%icc,	%g1,	%o1
	movl	%icc,	%g5,	%o3
	umulcc	%o5,	0x0C79,	%i7
	fpsub32	%f12,	%f6,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f25,	%f1,	%f10
	bge,a	loop_1876
	edge16n	%g2,	%g4,	%l5
	umulcc	%l3,	%o2,	%i4
	andncc	%g6,	%g3,	%l1
loop_1876:
	umul	%l0,	0x190C,	%o6
	bshuffle	%f24,	%f24,	%f22
	fmovdne	%icc,	%f29,	%f19
	fmul8x16	%f28,	%f8,	%f14
	bg,a,pn	%xcc,	loop_1877
	ba	loop_1878
	xnorcc	%l6,	%o4,	%i0
	movpos	%xcc,	%i5,	%o0
loop_1877:
	brz	%l4,	loop_1879
loop_1878:
	sdivx	%o7,	0x0C30,	%i3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x44] %asi,	%i2
loop_1879:
	bvc	%xcc,	loop_1880
	call	loop_1881
	fmovsle	%xcc,	%f8,	%f16
	tleu	%icc,	0x0
loop_1880:
	movle	%icc,	%l2,	%i6
loop_1881:
	fblg	%fcc1,	loop_1882
	for	%f4,	%f24,	%f24
	fmovspos	%icc,	%f9,	%f12
	tvs	%icc,	0x2
loop_1882:
	edge32ln	%g7,	%g1,	%i1
	movcc	%xcc,	%o1,	%o3
	fmovdge	%icc,	%f3,	%f31
	tgu	%icc,	0x3
	fcmpgt16	%f14,	%f10,	%o5
	tne	%xcc,	0x1
	mulx	%g5,	%i7,	%g2
	edge8l	%g4,	%l3,	%l5
	addccc	%i4,	0x1136,	%o2
	edge8n	%g6,	%g3,	%l0
	set	0x7C, %g5
	stwa	%l1,	[%l7 + %g5] 0x15
	smulcc	%l6,	%o6,	%o4
	movle	%xcc,	%i0,	%o0
	addccc	%l4,	%i5,	%o7
	movrne	%i3,	%l2,	%i6
	xnorcc	%g7,	%i2,	%i1
	xor	%g1,	%o3,	%o1
	tsubcctv	%o5,	%i7,	%g2
	nop
	setx	loop_1883,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x0E2DAC5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xD45B8A2F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f8,	%f5
	bneg,a,pn	%xcc,	loop_1884
	nop
	fitod	%f8,	%f24
	fdtos	%f24,	%f10
loop_1883:
	mulx	%g4,	0x01DA,	%l3
	movpos	%xcc,	%l5,	%i4
loop_1884:
	fcmple32	%f2,	%f28,	%o2
	tpos	%icc,	0x5
	popc	0x176D,	%g6
	movleu	%xcc,	%g5,	%l0
	ba,a,pn	%icc,	loop_1885
	fbul	%fcc3,	loop_1886
	orn	%l1,	%g3,	%l6
	fmovrslz	%o6,	%f24,	%f6
loop_1885:
	move	%icc,	%i0,	%o0
loop_1886:
	smulcc	%o4,	%i5,	%o7
	mova	%xcc,	%i3,	%l4
	tge	%xcc,	0x4
	fsrc2	%f24,	%f16
	subcc	%l2,	%i6,	%g7
	wr	%g0,	0xeb,	%asi
	stwa	%i2,	[%l7 + 0x2C] %asi
	membar	#Sync
	array32	%g1,	%i1,	%o3
	te	%xcc,	0x0
	fmovdl	%icc,	%f0,	%f21
	movn	%xcc,	%o1,	%o5
	nop
	fitos	%f1,	%f7
	tsubcc	%g2,	0x0862,	%i7
	fexpand	%f21,	%f24
	movrgez	%l3,	0x184,	%l5
	sub	%g4,	%o2,	%g6
	fands	%f25,	%f27,	%f10
	tl	%icc,	0x5
	ldd	[%l7 + 0x58],	%i4
	bgu,pn	%xcc,	loop_1887
	udivcc	%g5,	0x0F91,	%l1
	set	0x77, %i1
	stba	%l0,	[%l7 + %i1] 0x22
	membar	#Sync
loop_1887:
	tcs	%xcc,	0x7
	alignaddrl	%l6,	%o6,	%i0
	ldd	[%l7 + 0x18],	%f12
	ta	%xcc,	0x5
	stw	%g3,	[%l7 + 0x6C]
	flush	%l7 + 0x78
	std	%f26,	[%l7 + 0x10]
	movrlz	%o4,	%i5,	%o0
	movne	%icc,	%o7,	%l4
	fmovdge	%icc,	%f30,	%f26
	movleu	%xcc,	%l2,	%i3
	sub	%i6,	%i2,	%g7
	fmovspos	%xcc,	%f25,	%f30
	ble	loop_1888
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%g1,	%i1
	smul	%o3,	0x1BA1,	%o5
loop_1888:
	sth	%o1,	[%l7 + 0x60]
	movl	%icc,	%g2,	%l3
	movcc	%icc,	%i7,	%g4
	set	0x19, %g7
	stba	%o2,	[%l7 + %g7] 0x11
	bshuffle	%f6,	%f10,	%f14
	movrlz	%g6,	%i4,	%g5
	tneg	%icc,	0x4
	ldstub	[%l7 + 0x73],	%l5
	fmovrslez	%l0,	%f12,	%f6
	tneg	%xcc,	0x2
	bne,a	loop_1889
	fbn	%fcc2,	loop_1890
	stbar
	sdivcc	%l1,	0x12D2,	%l6
loop_1889:
	fble	%fcc3,	loop_1891
loop_1890:
	xorcc	%i0,	%o6,	%g3
	wr	%g0,	0x19,	%asi
	stba	%o4,	[%l7 + 0x67] %asi
loop_1891:
	membar	0x2B
	addcc	%o0,	0x1CEC,	%o7
	brgez,a	%l4,	loop_1892
	bne,a,pn	%icc,	loop_1893
	movl	%icc,	%l2,	%i5
	sethi	0x06ED,	%i6
loop_1892:
	sdivcc	%i3,	0x00E9,	%i2
loop_1893:
	nop
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tcc	%icc,	0x3
	fmovdcc	%xcc,	%f4,	%f12
	fbo,a	%fcc2,	loop_1894
	fcmpeq32	%f8,	%f18,	%g1
	sdivcc	%g7,	0x08F6,	%o3
	taddcctv	%i1,	%o5,	%g2
loop_1894:
	stw	%l3,	[%l7 + 0x5C]
	nop
	setx	0xC75627D03048A742,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movrlez	%i7,	%o1,	%g4
	fmovdg	%xcc,	%f31,	%f11
	tvc	%xcc,	0x0
	sllx	%g6,	%o2,	%i4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%l5
	movg	%icc,	%l1,	%l6
	xorcc	%i0,	0x051D,	%o6
	edge16ln	%g3,	%l0,	%o4
	array16	%o7,	%o0,	%l4
	fbn	%fcc1,	loop_1895
	tcc	%xcc,	0x6
	sdiv	%l2,	0x0D79,	%i5
	movcs	%xcc,	%i3,	%i2
loop_1895:
	fbl	%fcc1,	loop_1896
	ta	%icc,	0x5
	or	%g1,	0x144C,	%i6
	ldub	[%l7 + 0x32],	%o3
loop_1896:
	smulcc	%i1,	%o5,	%g7
	movl	%xcc,	%l3,	%g2
	fabsd	%f4,	%f10
	tpos	%xcc,	0x2
	nop
	setx	loop_1897,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sth	%o1,	[%l7 + 0x32]
	nop
	fitod	%f10,	%f2
	fdtos	%f2,	%f25
	taddcc	%g4,	%i7,	%g6
loop_1897:
	stx	%i4,	[%l7 + 0x18]
	popc	0x025D,	%g5
	edge8ln	%o2,	%l5,	%l6
	movgu	%icc,	%l1,	%i0
	movrne	%g3,	%l0,	%o6
	fands	%f31,	%f22,	%f15
	fpmerge	%f5,	%f2,	%f26
	nop
	setx	0x30ACC00A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f18
	movcs	%xcc,	%o7,	%o0
	move	%icc,	%o4,	%l2
	xor	%i5,	0x1C7B,	%l4
	fmovscs	%icc,	%f23,	%f29
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	alignaddr	%i2,	%i3,	%g1
	fmovrdne	%i6,	%f4,	%f10
	fornot2	%f6,	%f24,	%f10
	fmovrse	%o3,	%f4,	%f2
	movrlez	%i1,	%o5,	%l3
	be,pn	%icc,	loop_1898
	tneg	%xcc,	0x7
	fnot2s	%f14,	%f29
	call	loop_1899
loop_1898:
	fmul8x16	%f6,	%f14,	%f18
	bn,a	%icc,	loop_1900
	fpadd32	%f6,	%f16,	%f0
loop_1899:
	fcmpne32	%f0,	%f0,	%g2
	movrgez	%o1,	%g7,	%g4
loop_1900:
	edge32	%i7,	%g6,	%g5
	nop
	fitod	%f4,	%f20
	fdtox	%f20,	%f6
	add	%o2,	0x0DC0,	%i4
	edge8l	%l5,	%l6,	%l1
	sth	%g3,	[%l7 + 0x58]
	umulcc	%l0,	%i0,	%o7
	tg	%icc,	0x5
	movgu	%icc,	%o6,	%o4
	movrlz	%l2,	0x053,	%o0
	addcc	%l4,	0x0F6D,	%i2
	nop
	fitos	%f13,	%f10
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
	addc	%i3,	%g1,	%i6
	alignaddrl	%o3,	%i1,	%l3
	brz,a	%g2,	loop_1901
	smulcc	%o1,	%g7,	%o5
	tvc	%xcc,	0x3
	fbul	%fcc3,	loop_1902
loop_1901:
	xorcc	%g4,	%g6,	%i7
	flush	%l7 + 0x60
	nop
	setx	loop_1903,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1902:
	tl	%icc,	0x6
	fbne	%fcc3,	loop_1904
	nop
	setx	0xE0E0B6AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x4689CA64,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f29,	%f10
loop_1903:
	bl,pt	%icc,	loop_1905
	fpadd16	%f2,	%f12,	%f20
loop_1904:
	fmul8sux16	%f30,	%f10,	%f18
	bpos,a	loop_1906
loop_1905:
	subccc	%o2,	%i4,	%g5
	bvc,pt	%icc,	loop_1907
	umulcc	%l6,	%l1,	%g3
loop_1906:
	brgz,a	%l0,	loop_1908
	edge16	%l5,	%i0,	%o7
loop_1907:
	fmovdne	%xcc,	%f18,	%f26
	andcc	%o4,	%l2,	%o0
loop_1908:
	srlx	%o6,	0x01,	%l4
	add	%i2,	%i5,	%g1
	bpos,pn	%xcc,	loop_1909
	edge32ln	%i6,	%o3,	%i1
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%f4
	nop
	set	0x68, %o2
	lduh	[%l7 + %o2],	%i3
loop_1909:
	tge	%xcc,	0x3
	edge8n	%l3,	%o1,	%g7
	fmovrse	%o5,	%f0,	%f31
	addccc	%g4,	0x17DB,	%g6
	nop
	setx	0xCB32C7256E6FACAA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xAD96CD5347A258CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f28,	%f10
	faligndata	%f10,	%f6,	%f8
	fblg,a	%fcc1,	loop_1910
	xorcc	%i7,	0x1E72,	%g2
	ld	[%l7 + 0x20],	%f7
	tne	%icc,	0x4
loop_1910:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%g5
	fbue	%fcc0,	loop_1911
	tle	%icc,	0x5
	fone	%f20
	addc	%o2,	%l1,	%g3
loop_1911:
	tge	%xcc,	0x7
	te	%icc,	0x7
	movn	%icc,	%l0,	%l6
	fmovrslez	%i0,	%f8,	%f20
	array32	%l5,	%o4,	%l2
	fmovsl	%icc,	%f29,	%f4
	fmovrsgz	%o0,	%f12,	%f11
	edge8	%o6,	%l4,	%i2
	fpack32	%f26,	%f6,	%f18
	array8	%i5,	%g1,	%o7
	edge32n	%i6,	%i1,	%o3
	taddcctv	%i3,	%o1,	%l3
	tne	%icc,	0x4
	te	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g7,	%o5,	%g4
	move	%icc,	%i7,	%g6
	fabss	%f3,	%f2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge16l	%i4,	%g5,	%g2
	bleu,a,pn	%icc,	loop_1912
	membar	0x5F
	lduh	[%l7 + 0x4A],	%l1
	bcs,a,pt	%xcc,	loop_1913
loop_1912:
	movrgez	%g3,	%o2,	%l0
	movn	%xcc,	%i0,	%l5
	tvc	%icc,	0x1
loop_1913:
	andcc	%o4,	0x0E54,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x1C],	%l2
	array32	%o0,	%l4,	%o6
	taddcctv	%i5,	%g1,	%o7
	tpos	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f26
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x50] %asi,	%i2
	fmovsl	%icc,	%f17,	%f26
	fxors	%f17,	%f5,	%f16
	ldd	[%l7 + 0x60],	%f6
	subccc	%i1,	%o3,	%i3
	orncc	%i6,	%o1,	%l3
	bl,a,pt	%icc,	loop_1914
	subcc	%o5,	0x045D,	%g7
	fbge,a	%fcc2,	loop_1915
	movre	%i7,	%g4,	%i4
loop_1914:
	movg	%xcc,	%g5,	%g6
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g2
loop_1915:
	ble,a	loop_1916
	movge	%xcc,	%g3,	%l1
	fble,a	%fcc1,	loop_1917
	sra	%o2,	0x04,	%i0
loop_1916:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
loop_1917:
	fnot2s	%f30,	%f21
	orcc	%l0,	0x049E,	%l6
	taddcctv	%l2,	0x18E3,	%o4
	sllx	%o0,	0x1E,	%o6
	set	0x6A, %i6
	stha	%i5,	[%l7 + %i6] 0x23
	membar	#Sync
	movrgez	%g1,	%o7,	%l4
	addc	%i2,	0x0556,	%o3
	tg	%xcc,	0x2
	ba,a,pt	%xcc,	loop_1918
	fcmpgt16	%f24,	%f28,	%i3
	te	%icc,	0x3
	wr	%g0,	0x88,	%asi
	stwa	%i1,	[%l7 + 0x74] %asi
loop_1918:
	movvc	%icc,	%o1,	%i6
	fbuge,a	%fcc2,	loop_1919
	movre	%o5,	%g7,	%i7
	nop
	set	0x79, %i4
	ldsb	[%l7 + %i4],	%l3
	movrgz	%i4,	0x31F,	%g4
loop_1919:
	nop
	fitos	%f8,	%f17
	fstox	%f17,	%f8
	sth	%g5,	[%l7 + 0x18]
	addcc	%g2,	%g6,	%l1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x56] %asi,	%g3
	bshuffle	%f24,	%f18,	%f20
	tne	%icc,	0x4
	movrlz	%o2,	%i0,	%l5
	andncc	%l0,	%l6,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o0,	%l2
	brlez,a	%o6,	loop_1920
	sdivx	%g1,	0x1B27,	%o7
	sdivcc	%i5,	0x1A37,	%l4
	array16	%i2,	%i3,	%o3
loop_1920:
	movl	%xcc,	%o1,	%i6
	prefetch	[%l7 + 0x18],	 0x3
	fmovdcs	%icc,	%f5,	%f13
	fba	%fcc0,	loop_1921
	tgu	%xcc,	0x5
	nop
	setx	0x8CD878DC6FC0600A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f24
	edge32ln	%i1,	%g7,	%i7
loop_1921:
	sllx	%l3,	%i4,	%o5
	edge8ln	%g5,	%g4,	%g6
	movrgez	%l1,	%g2,	%g3
	fmovsg	%icc,	%f30,	%f4
	array32	%o2,	%l5,	%i0
	fpack16	%f0,	%f19
	ble,pt	%xcc,	loop_1922
	xnor	%l6,	0x0411,	%o4
	membar	0x32
	fmovrdgz	%l0,	%f16,	%f20
loop_1922:
	alignaddr	%o0,	%l2,	%g1
	wr	%g0,	0x0c,	%asi
	stba	%o6,	[%l7 + 0x22] %asi
	subccc	%o7,	%i5,	%l4
	udivcc	%i2,	0x136D,	%o3
	smulcc	%i3,	0x0A96,	%i6
	movrgez	%i1,	%g7,	%i7
	add	%l3,	%i4,	%o5
	fcmpne32	%f14,	%f18,	%o1
	nop
	fitos	%f13,	%f6
	fstod	%f6,	%f12
	fpack16	%f14,	%f21
	movrne	%g4,	%g5,	%l1
	tpos	%xcc,	0x6
	movrlez	%g2,	%g6,	%g3
	fpadd16	%f28,	%f16,	%f28
	fcmple16	%f2,	%f12,	%l5
	tn	%xcc,	0x6
	xorcc	%o2,	%i0,	%o4
	set	0x70, %i0
	lduba	[%l7 + %i0] 0x80,	%l0
	xor	%o0,	0x0D9F,	%l6
	fmovspos	%icc,	%f26,	%f23
	movle	%icc,	%l2,	%g1
	tn	%icc,	0x6
	edge32ln	%o6,	%i5,	%o7
	movrgez	%l4,	0x345,	%i2
	mulscc	%o3,	0x01EC,	%i3
	ldstub	[%l7 + 0x7D],	%i6
	mulscc	%g7,	%i7,	%i1
	movpos	%xcc,	%l3,	%i4
	fandnot2	%f6,	%f16,	%f22
	tg	%icc,	0x2
	tne	%icc,	0x0
	fbg,a	%fcc0,	loop_1923
	smul	%o5,	0x059D,	%o1
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x50] %asi,	%g4
loop_1923:
	mova	%xcc,	%g5,	%l1
	fmovrse	%g2,	%f6,	%f16
	movpos	%icc,	%g6,	%l5
	movcc	%icc,	%g3,	%o2
	brlz,a	%i0,	loop_1924
	movcs	%xcc,	%o4,	%l0
	fornot1s	%f16,	%f11,	%f12
	movrgz	%l6,	%o0,	%l2
loop_1924:
	fmovsg	%xcc,	%f21,	%f17
	bleu,pt	%icc,	loop_1925
	bneg,a,pn	%xcc,	loop_1926
	mulscc	%g1,	0x1A59,	%o6
	fmovs	%f10,	%f15
loop_1925:
	ldsh	[%l7 + 0x44],	%i5
loop_1926:
	ldstub	[%l7 + 0x5D],	%o7
	edge8l	%i2,	%o3,	%l4
	tge	%xcc,	0x1
	fbule	%fcc0,	loop_1927
	tsubcctv	%i3,	0x140B,	%i6
	taddcctv	%i7,	%g7,	%l3
	tge	%icc,	0x7
loop_1927:
	bcc,a	loop_1928
	fba	%fcc2,	loop_1929
	or	%i4,	0x1F47,	%i1
	array16	%o1,	%o5,	%g4
loop_1928:
	stbar
loop_1929:
	movrgez	%l1,	0x2C8,	%g5
	fpadd32	%f8,	%f6,	%f18
	brnz,a	%g6,	loop_1930
	ldd	[%l7 + 0x08],	%f6
	subc	%g2,	%g3,	%o2
	addccc	%i0,	0x1F14,	%l5
loop_1930:
	sethi	0x0AE0,	%l0
	brlez,a	%l6,	loop_1931
	edge8n	%o0,	%l2,	%o4
	tn	%icc,	0x0
	ldstub	[%l7 + 0x64],	%g1
loop_1931:
	edge8n	%o6,	%i5,	%o7
	nop
	setx	0x31BF13113065D9EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	alignaddrl	%o3,	%l4,	%i3
	and	%i6,	%i7,	%g7
	fmul8x16	%f29,	%f28,	%f24
	movre	%i2,	0x190,	%i4
	udivcc	%i1,	0x145F,	%o1
	fmul8sux16	%f10,	%f28,	%f10
	fnands	%f6,	%f12,	%f26
	xorcc	%l3,	0x160C,	%o5
	movl	%xcc,	%g4,	%l1
	edge16ln	%g6,	%g5,	%g3
	ld	[%l7 + 0x20],	%f13
	edge8n	%g2,	%o2,	%i0
	fsrc2s	%f29,	%f24
	nop
	setx	0xCDFA666A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x2B642793,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f9,	%f28
	subc	%l5,	0x1576,	%l6
	edge16n	%o0,	%l0,	%l2
	umulcc	%g1,	0x17A7,	%o6
	or	%o4,	%o7,	%o3
	array32	%l4,	%i5,	%i3
	set	0x30, %l5
	lduwa	[%l7 + %l5] 0x14,	%i7
	udivcc	%i6,	0x1631,	%i2
	subccc	%g7,	0x138C,	%i4
	move	%xcc,	%i1,	%l3
	sra	%o5,	%o1,	%l1
	bleu,a,pn	%xcc,	loop_1932
	fmovdne	%xcc,	%f31,	%f21
	movne	%icc,	%g4,	%g6
	edge32l	%g3,	%g2,	%g5
loop_1932:
	edge16	%o2,	%i0,	%l5
	movle	%xcc,	%o0,	%l6
	nop
	setx loop_1933, %l0, %l1
	jmpl %l1, %l0
	tge	%icc,	0x0
	fmovde	%icc,	%f8,	%f0
	bl	%xcc,	loop_1934
loop_1933:
	movle	%xcc,	%l2,	%o6
	fbo	%fcc2,	loop_1935
	fmovscs	%icc,	%f2,	%f1
loop_1934:
	array32	%o4,	%o7,	%g1
	nop
	set	0x44, %i2
	sth	%l4,	[%l7 + %i2]
loop_1935:
	addcc	%i5,	0x185E,	%o3
	fbue,a	%fcc3,	loop_1936
	tleu	%icc,	0x1
	edge16	%i3,	%i6,	%i2
	ba,pn	%xcc,	loop_1937
loop_1936:
	stbar
	sdivcc	%g7,	0x16AE,	%i7
	sll	%i4,	%i1,	%o5
loop_1937:
	tpos	%xcc,	0x3
	xnorcc	%l3,	%o1,	%g4
	orcc	%g6,	%l1,	%g3
	sth	%g2,	[%l7 + 0x18]
	movgu	%xcc,	%g5,	%o2
	bvs,a,pt	%xcc,	loop_1938
	udivcc	%i0,	0x17F5,	%o0
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f10
	fxtod	%f10,	%f14
	sdivcc	%l6,	0x016B,	%l0
loop_1938:
	edge16	%l5,	%o6,	%l2
	array32	%o4,	%g1,	%l4
	edge32	%o7,	%i5,	%o3
	srl	%i3,	0x09,	%i2
	movl	%icc,	%g7,	%i7
	xor	%i4,	%i1,	%o5
	fpsub32	%f22,	%f24,	%f18
	sllx	%i6,	%l3,	%g4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o1
	srl	%l1,	%g6,	%g3
	edge32n	%g5,	%o2,	%i0
	nop
	setx	0xE5F05194,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xA9A8F805,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f22,	%f18
	sra	%o0,	0x1D,	%g2
	nop
	setx	0x21F2D1344B1288B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x1AA10DC082AF00EC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f20,	%f14
	srlx	%l6,	0x1E,	%l5
	orn	%o6,	%l2,	%l0
	movn	%xcc,	%o4,	%l4
	tge	%xcc,	0x1
	smul	%g1,	%o7,	%o3
	fandnot2	%f4,	%f12,	%f14
	bcc,a	loop_1939
	fnegs	%f14,	%f13
	tge	%xcc,	0x2
	and	%i5,	%i2,	%i3
loop_1939:
	tle	%xcc,	0x6
	movpos	%icc,	%g7,	%i4
	movre	%i1,	0x246,	%i7
	fbule	%fcc1,	loop_1940
	fpsub32s	%f15,	%f27,	%f18
	fxors	%f1,	%f14,	%f10
	array32	%o5,	%i6,	%l3
loop_1940:
	fnot1s	%f17,	%f9
	wr	%g0,	0x22,	%asi
	stha	%o1,	[%l7 + 0x64] %asi
	membar	#Sync
	fmovdcc	%icc,	%f8,	%f22
	movrlz	%l1,	%g4,	%g3
	brnz,a	%g5,	loop_1941
	bcs,a	%icc,	loop_1942
	fbl,a	%fcc1,	loop_1943
	movge	%xcc,	%o2,	%g6
loop_1941:
	brz,a	%i0,	loop_1944
loop_1942:
	sdiv	%g2,	0x0FB5,	%o0
loop_1943:
	movl	%icc,	%l6,	%o6
	subc	%l2,	%l0,	%l5
loop_1944:
	orn	%o4,	0x08AB,	%l4
	wr	%g0,	0x80,	%asi
	stha	%o7,	[%l7 + 0x52] %asi
	set	0x20, %g3
	ldda	[%l7 + %g3] 0x04,	%o2
	fpack16	%f22,	%f23
	edge8n	%i5,	%i2,	%g1
	and	%g7,	%i3,	%i4
	nop
	fitos	%f11,	%f11
	fstoi	%f11,	%f27
	movneg	%icc,	%i1,	%o5
	andcc	%i7,	%l3,	%o1
	sir	0x1816
	smulcc	%i6,	%l1,	%g4
	fandnot1	%f24,	%f14,	%f14
	array8	%g5,	%o2,	%g6
	wr	%g0,	0x19,	%asi
	stwa	%g3,	[%l7 + 0x64] %asi
	edge16l	%g2,	%i0,	%l6
	movl	%icc,	%o6,	%l2
	fcmpne32	%f4,	%f12,	%o0
	tl	%icc,	0x3
	nop
	setx	loop_1945,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tgu	%xcc,	0x3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x47] %asi,	%l5
loop_1945:
	nop
	set	0x66, %g6
	ldsha	[%l7 + %g6] 0x81,	%l0
	tle	%xcc,	0x5
	nop
	setx	0x50B96288,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x3BABA4D5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f25,	%f2
	addcc	%o4,	0x1921,	%o7
	fpsub32	%f16,	%f16,	%f16
	fornot1s	%f25,	%f10,	%f31
	fzeros	%f29
	brnz,a	%l4,	loop_1946
	tvs	%icc,	0x1
	ble	%icc,	loop_1947
	orncc	%o3,	0x0BCF,	%i5
loop_1946:
	fbn,a	%fcc2,	loop_1948
	pdist	%f10,	%f20,	%f30
loop_1947:
	ldx	[%l7 + 0x68],	%i2
	fmovda	%xcc,	%f26,	%f27
loop_1948:
	array32	%g1,	%i3,	%i4
	srax	%i1,	0x0B,	%o5
	bn,a	%xcc,	loop_1949
	tg	%xcc,	0x5
	bvs	loop_1950
	sdiv	%g7,	0x0F68,	%i7
loop_1949:
	orncc	%o1,	%l3,	%i6
	tvs	%xcc,	0x0
loop_1950:
	fcmpeq16	%f28,	%f28,	%l1
	smulcc	%g5,	%o2,	%g6
	tneg	%xcc,	0x0
	sub	%g4,	0x1C1A,	%g2
	movge	%xcc,	%i0,	%l6
	xorcc	%g3,	%o6,	%l2
	nop
	setx	loop_1951,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovda	%icc,	%f30,	%f27
	fmovde	%icc,	%f16,	%f4
	array16	%l5,	%l0,	%o0
loop_1951:
	movgu	%icc,	%o4,	%l4
	fnors	%f6,	%f23,	%f1
	membar	0x2F
	sdivx	%o7,	0x18E0,	%o3
	andn	%i5,	0x1A3D,	%i2
	or	%i3,	%i4,	%i1
	fbo	%fcc0,	loop_1952
	bleu,a,pt	%icc,	loop_1953
	tl	%icc,	0x3
	edge8ln	%g1,	%o5,	%g7
loop_1952:
	xorcc	%i7,	0x1788,	%l3
loop_1953:
	srlx	%i6,	0x16,	%l1
	fnands	%f30,	%f22,	%f22
	subccc	%g5,	%o2,	%o1
	edge8ln	%g6,	%g2,	%g4
	flush	%l7 + 0x60
	tvc	%icc,	0x4
	prefetch	[%l7 + 0x4C],	 0x0
	addc	%i0,	%g3,	%l6
	movcc	%icc,	%l2,	%o6
	array16	%l0,	%l5,	%o4
	bne,a	loop_1954
	fnot1s	%f29,	%f16
	bleu,a	%icc,	loop_1955
	udivcc	%l4,	0x15D2,	%o0
loop_1954:
	fcmpne32	%f24,	%f18,	%o3
	movgu	%icc,	%o7,	%i5
loop_1955:
	edge32ln	%i3,	%i2,	%i4
	srax	%g1,	0x16,	%i1
	fba	%fcc1,	loop_1956
	edge32ln	%o5,	%g7,	%i7
	mulscc	%i6,	%l3,	%g5
	fmovdgu	%icc,	%f12,	%f12
loop_1956:
	tgu	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	stha	%l1,	[%l7 + 0x3E] %asi
	sdivcc	%o2,	0x16FE,	%o1
	fble,a	%fcc2,	loop_1957
	array16	%g2,	%g6,	%i0
	tcs	%xcc,	0x7
	array32	%g4,	%g3,	%l2
loop_1957:
	mulscc	%l6,	%l0,	%l5
	ldstub	[%l7 + 0x61],	%o6
	fmovse	%icc,	%f27,	%f29
	sllx	%l4,	%o4,	%o0
	set	0x31, %o0
	stba	%o7,	[%l7 + %o0] 0x10
	movrlz	%i5,	0x1E3,	%i3
	fmovrdlez	%o3,	%f26,	%f12
	fbge,a	%fcc0,	loop_1958
	tleu	%xcc,	0x5
	fbe	%fcc2,	loop_1959
	nop
	setx	0xEE8087AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xBBF6EBA6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f27,	%f11
loop_1958:
	brgez	%i2,	loop_1960
	tsubcctv	%g1,	0x0390,	%i1
loop_1959:
	xnor	%o5,	0x1B1B,	%i4
	fnot2	%f6,	%f22
loop_1960:
	umul	%g7,	%i7,	%l3
	orcc	%g5,	0x08A2,	%l1
	tne	%icc,	0x0
	fpsub16	%f26,	%f8,	%f6
	xnor	%o2,	0x03EB,	%i6
	edge32	%g2,	%g6,	%o1
	fbe,a	%fcc3,	loop_1961
	bvc,pn	%xcc,	loop_1962
	nop
	fitos	%f1,	%f15
	fstox	%f15,	%f24
	fxtos	%f24,	%f7
	nop
	setx	0x145401EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x9948740C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f17,	%f4
loop_1961:
	xorcc	%g4,	0x1476,	%i0
loop_1962:
	fmovdl	%icc,	%f9,	%f0
	fsrc1s	%f8,	%f1
	orcc	%g3,	0x0D3D,	%l2
	smul	%l0,	0x11BE,	%l6
	movcs	%icc,	%o6,	%l4
	fnand	%f26,	%f0,	%f26
	nop
	fitos	%f9,	%f29
	fstod	%f29,	%f2
	srax	%l5,	%o0,	%o7
	fbug	%fcc1,	loop_1963
	smulcc	%o4,	%i5,	%o3
	be,a	%xcc,	loop_1964
	umulcc	%i3,	0x045E,	%i2
loop_1963:
	edge8l	%i1,	%g1,	%i4
	ldstub	[%l7 + 0x5F],	%g7
loop_1964:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x78] %asi,	%o5
	ldsb	[%l7 + 0x55],	%i7
	orcc	%l3,	%g5,	%l1
	array32	%i6,	%g2,	%o2
	or	%o1,	%g4,	%g6
	smul	%g3,	0x1FED,	%l2
	fmovscs	%icc,	%f3,	%f25
	nop
	fitod	%f6,	%f6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%l0
	movrgz	%l6,	0x224,	%i0
	smul	%l4,	%o6,	%l5
	fpsub16	%f30,	%f30,	%f18
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o0,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f2,	%f18,	%f3
	tle	%xcc,	0x1
	fmovsge	%xcc,	%f19,	%f21
	taddcc	%o7,	%i5,	%i3
	edge32ln	%o3,	%i2,	%i1
	edge32ln	%g1,	%i4,	%g7
	movrgz	%o5,	%i7,	%g5
	edge8	%l1,	%i6,	%l3
	movneg	%icc,	%o2,	%o1
	movrgez	%g2,	0x107,	%g6
	nop
	set	0x4E, %l0
	ldstub	[%l7 + %l0],	%g3
	fmovsle	%icc,	%f15,	%f18
	movcc	%icc,	%l2,	%g4
	xnorcc	%l6,	%i0,	%l4
	wr	%g0,	0xe3,	%asi
	stba	%o6,	[%l7 + 0x27] %asi
	membar	#Sync
	fbe	%fcc2,	loop_1965
	popc	0x0FC2,	%l0
	mulx	%o0,	%o4,	%o7
	sdivx	%l5,	0x06B6,	%i3
loop_1965:
	xor	%i5,	0x0339,	%i2
	movneg	%xcc,	%i1,	%g1
	move	%xcc,	%i4,	%g7
	tle	%xcc,	0x3
	taddcctv	%o5,	%o3,	%i7
	edge32n	%g5,	%i6,	%l1
	nop
	setx	0xB77811B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f26
	movre	%o2,	0x0A6,	%l3
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%o1,	[%g0 + 0x3f8] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	mulx	%g6,	%g3,	%l2
	fmovdneg	%xcc,	%f28,	%f2
	tge	%xcc,	0x0
	smulcc	%g4,	0x0553,	%g2
	tge	%icc,	0x3
	tsubcc	%i0,	0x145D,	%l4
	tsubcc	%l6,	%l0,	%o6
	nop
	fitos	%f0,	%f15
	fmovsgu	%xcc,	%f27,	%f29
	swap	[%l7 + 0x0C],	%o0
	mova	%xcc,	%o7,	%o4
	fmovdneg	%xcc,	%f20,	%f14
	mulx	%l5,	%i3,	%i2
	set	0x28, %l4
	sta	%f27,	[%l7 + %l4] 0x10
	fexpand	%f12,	%f2
	fmul8sux16	%f14,	%f20,	%f26
	edge16n	%i5,	%i1,	%i4
	fzeros	%f30
	fmovsg	%xcc,	%f2,	%f3
	movcc	%xcc,	%g1,	%g7
	edge32	%o3,	%i7,	%g5
	smul	%i6,	%o5,	%l1
	umul	%l3,	%o1,	%g6
	fpmerge	%f18,	%f24,	%f14
	sra	%g3,	0x13,	%l2
	movleu	%xcc,	%g4,	%g2
	movrne	%i0,	0x0A8,	%o2
	sth	%l4,	[%l7 + 0x3E]
	xnor	%l6,	0x1273,	%o6
	subcc	%l0,	0x12A0,	%o0
	fmovscs	%icc,	%f16,	%f24
	edge16n	%o7,	%l5,	%i3
	nop
	setx	0x69E0DBB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x5A789FA8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f28,	%f2
	movge	%icc,	%i2,	%i5
	xnor	%o4,	%i4,	%i1
	movcc	%xcc,	%g1,	%o3
	movre	%g7,	0x1B3,	%g5
	movcc	%xcc,	%i6,	%i7
	ble	loop_1966
	movn	%xcc,	%l1,	%l3
	bleu,a	%xcc,	loop_1967
	brgez,a	%o5,	loop_1968
loop_1966:
	movleu	%icc,	%o1,	%g3
	movge	%icc,	%l2,	%g6
loop_1967:
	fmovrslez	%g4,	%f16,	%f3
loop_1968:
	nop
	fitos	%f10,	%f18
	fstox	%f18,	%f20
	edge32n	%g2,	%o2,	%i0
	fbl,a	%fcc1,	loop_1969
	fcmpeq32	%f24,	%f8,	%l4
	add	%l6,	0x015E,	%o6
	alignaddr	%l0,	%o7,	%l5
loop_1969:
	udiv	%i3,	0x1944,	%i2
	te	%xcc,	0x0
	srl	%o0,	0x08,	%i5
	sir	0x1AE9
	addc	%i4,	%o4,	%i1
	ldstub	[%l7 + 0x4E],	%o3
	smulcc	%g7,	0x0CDF,	%g1
	movrlez	%g5,	0x38A,	%i6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%l3
	fbl	%fcc0,	loop_1970
	alignaddrl	%o5,	%o1,	%l1
	bl,a,pn	%icc,	loop_1971
	edge8n	%l2,	%g3,	%g6
loop_1970:
	ta	%xcc,	0x2
	tsubcc	%g2,	%g4,	%o2
loop_1971:
	movn	%icc,	%i0,	%l4
	sllx	%l6,	%o6,	%l0
	tpos	%xcc,	0x2
	srl	%o7,	0x0F,	%i3
	udivcc	%i2,	0x1723,	%l5
	sdivcc	%i5,	0x18C3,	%o0
	fbuge,a	%fcc1,	loop_1972
	tge	%xcc,	0x7
	umul	%o4,	0x0AC2,	%i1
	fandnot2s	%f5,	%f1,	%f29
loop_1972:
	alignaddr	%o3,	%g7,	%g1
	tvs	%icc,	0x0
	subccc	%i4,	%i6,	%i7
	fpack16	%f20,	%f1
	popc	%l3,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o1,	%g5,	%l1
	fones	%f17
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%l2
	tvc	%xcc,	0x2
	taddcc	%g3,	0x1303,	%g2
	fmovde	%xcc,	%f15,	%f29
	fmul8x16	%f11,	%f18,	%f24
	ldd	[%l7 + 0x70],	%f16
	bge	loop_1973
	movrne	%g6,	0x228,	%o2
	fbuge,a	%fcc3,	loop_1974
	prefetch	[%l7 + 0x48],	 0x1
loop_1973:
	fornot2	%f24,	%f10,	%f20
	mulscc	%i0,	0x00D5,	%l4
loop_1974:
	fbge	%fcc1,	loop_1975
	andncc	%g4,	%l6,	%l0
	tne	%icc,	0x0
	edge16n	%o7,	%i3,	%i2
loop_1975:
	srlx	%o6,	%l5,	%i5
	fmovscs	%icc,	%f2,	%f4
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	fbug	%fcc1,	loop_1976
	sethi	0x0059,	%i1
	movn	%xcc,	%o3,	%g7
	andncc	%o0,	%i4,	%g1
loop_1976:
	bn,a	loop_1977
	smul	%i7,	%l3,	%i6
	fexpand	%f17,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1977:
	nop
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x04,	%o5
	fmovsn	%icc,	%f12,	%f3
	movcs	%xcc,	%g5,	%o1
	movrgz	%l2,	0x273,	%l1
	fmovsvs	%xcc,	%f25,	%f9
	fmuld8ulx16	%f10,	%f21,	%f2
	fmovdl	%icc,	%f4,	%f14
	mulx	%g3,	%g6,	%o2
	fpmerge	%f26,	%f1,	%f28
	fmovscs	%icc,	%f12,	%f19
	movrne	%g2,	0x3D1,	%l4
	movvs	%icc,	%i0,	%l6
	tpos	%xcc,	0x2
	tn	%icc,	0x0
	alignaddr	%g4,	%o7,	%i3
	nop
	setx	loop_1978,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%icc,	0x4
	fnot2	%f20,	%f16
	fmovrdgz	%l0,	%f12,	%f12
loop_1978:
	array32	%o6,	%l5,	%i2
	orcc	%o4,	%i1,	%o3
	addc	%g7,	%i5,	%i4
	lduh	[%l7 + 0x2A],	%o0
	xor	%i7,	%l3,	%g1
	sdivx	%i6,	0x1AF6,	%o5
	fbuge	%fcc3,	loop_1979
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f22
	fxtod	%f22,	%f22
	movg	%icc,	%o1,	%g5
	te	%xcc,	0x4
loop_1979:
	nop
	setx	0x0FDAA30A4C10B94C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x52116F00FAF18C3C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f6,	%f16
	tn	%xcc,	0x7
	sra	%l1,	%g3,	%g6
	fcmpne16	%f6,	%f4,	%o2
	fabsd	%f8,	%f28
	fba,a	%fcc0,	loop_1980
	movleu	%icc,	%l2,	%l4
	fmovde	%icc,	%f24,	%f27
	st	%f2,	[%l7 + 0x78]
loop_1980:
	fpack16	%f2,	%f29
	fandnot2	%f30,	%f12,	%f20
	sdiv	%i0,	0x06CE,	%g2
	tsubcctv	%l6,	%o7,	%g4
	fnot2	%f14,	%f4
	fpack32	%f4,	%f8,	%f8
	stbar
	edge8ln	%i3,	%l0,	%o6
	and	%l5,	0x1476,	%o4
	ldub	[%l7 + 0x1C],	%i1
	fmul8x16	%f14,	%f18,	%f2
	andncc	%i2,	%g7,	%i5
	movrgz	%i4,	%o3,	%o0
	movrlez	%l3,	0x24B,	%i7
	set	0x20, %g4
	swapa	[%l7 + %g4] 0x80,	%i6
	sdivx	%o5,	0x07E8,	%o1
	tvs	%icc,	0x1
	xorcc	%g5,	0x114C,	%g1
	fmovscc	%icc,	%f31,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f2,	%f8
	movn	%icc,	%g3,	%g6
	st	%f27,	[%l7 + 0x64]
	te	%icc,	0x6
	alignaddr	%o2,	%l1,	%l2
	pdist	%f2,	%f22,	%f26
	xor	%i0,	%l4,	%l6
	brgez,a	%o7,	loop_1981
	bgu,a	loop_1982
	fmovsn	%icc,	%f15,	%f28
	fcmpgt16	%f20,	%f6,	%g4
loop_1981:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x10] %asi,	%i3
loop_1982:
	call	loop_1983
	fbuge,a	%fcc1,	loop_1984
	fba,a	%fcc1,	loop_1985
	bneg,a	loop_1986
loop_1983:
	udiv	%l0,	0x1290,	%g2
loop_1984:
	udiv	%l5,	0x0B7D,	%o6
loop_1985:
	addcc	%o4,	%i2,	%i1
loop_1986:
	orcc	%i5,	0x18EA,	%g7
	umulcc	%i4,	%o3,	%o0
	bne,a,pt	%xcc,	loop_1987
	andncc	%l3,	%i7,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o1,	%g5
loop_1987:
	te	%xcc,	0x1
	movl	%icc,	%g1,	%g3
	srl	%i6,	%o2,	%l1
	movvs	%icc,	%l2,	%g6
	sra	%l4,	%l6,	%i0
	subccc	%g4,	%i3,	%o7
	bleu,a	%xcc,	loop_1988
	alignaddrl	%l0,	%l5,	%g2
	movrgz	%o6,	0x242,	%o4
	tle	%icc,	0x0
loop_1988:
	nop
	setx	0xF75BEABC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xBEDE2733,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f20,	%f1
	fsrc1s	%f4,	%f30
	tvs	%icc,	0x6
	fcmpgt32	%f26,	%f8,	%i1
	ldsw	[%l7 + 0x38],	%i2
	sethi	0x0445,	%g7
	fbn,a	%fcc1,	loop_1989
	lduh	[%l7 + 0x28],	%i4
	nop
	setx	0x204203F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	andcc	%i5,	0x0922,	%o3
loop_1989:
	tsubcctv	%l3,	0x10BD,	%i7
	tsubcc	%o0,	%o5,	%g5
	xnor	%o1,	0x147F,	%g3
	nop
	fitod	%f10,	%f30
	fdtoi	%f30,	%f31
	ble,a	loop_1990
	fbuge,a	%fcc0,	loop_1991
	umulcc	%i6,	%o2,	%l1
	te	%xcc,	0x7
loop_1990:
	stx	%g1,	[%l7 + 0x38]
loop_1991:
	fsrc2	%f12,	%f4
	movgu	%icc,	%g6,	%l2
	tleu	%xcc,	0x0
	tl	%icc,	0x0
	fabss	%f21,	%f5
	bg,a	%xcc,	loop_1992
	fpadd32	%f12,	%f20,	%f30
	tpos	%xcc,	0x2
	taddcctv	%l6,	%i0,	%l4
loop_1992:
	nop
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g4,	%o7
	smulcc	%l0,	0x1E43,	%i3
	xorcc	%l5,	%o6,	%g2
	fbg	%fcc2,	loop_1993
	fabsd	%f16,	%f0
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x89,	%i1
loop_1993:
	subccc	%i2,	%g7,	%i4
	fbge,a	%fcc3,	loop_1994
	orncc	%o4,	0x07D3,	%o3
	brgz	%l3,	loop_1995
	edge16ln	%i7,	%i5,	%o5
loop_1994:
	tpos	%xcc,	0x1
	nop
	setx loop_1996, %l0, %l1
	jmpl %l1, %o0
loop_1995:
	fmovsn	%icc,	%f7,	%f21
	addc	%g5,	0x007F,	%g3
	bpos,a	loop_1997
loop_1996:
	fmovdle	%xcc,	%f6,	%f26
	popc	0x1D08,	%i6
	bg	loop_1998
loop_1997:
	nop
	setx	0x16250F84F5A16E35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f24
	bvs	loop_1999
	movcc	%xcc,	%o2,	%o1
loop_1998:
	bne	%xcc,	loop_2000
	mova	%icc,	%g1,	%g6
loop_1999:
	movneg	%icc,	%l2,	%l1
	fbug,a	%fcc3,	loop_2001
loop_2000:
	fblg,a	%fcc0,	loop_2002
	smul	%l6,	%i0,	%g4
	fbo,a	%fcc2,	loop_2003
loop_2001:
	fbug,a	%fcc3,	loop_2004
loop_2002:
	nop
	set	0x50, %o4
	ldx	[%l7 + %o4],	%o7
	bleu,a,pn	%xcc,	loop_2005
loop_2003:
	movg	%xcc,	%l4,	%i3
loop_2004:
	tge	%icc,	0x3
	movvc	%icc,	%l0,	%l5
loop_2005:
	tpos	%xcc,	0x4
	sll	%g2,	%i1,	%o6
	set	0x10, %l6
	prefetcha	[%l7 + %l6] 0x11,	 0x3
	brlz	%i4,	loop_2006
	brgz	%g7,	loop_2007
	fornot1s	%f16,	%f17,	%f20
	addcc	%o4,	0x1E76,	%l3
loop_2006:
	fmovrde	%o3,	%f6,	%f24
loop_2007:
	bneg	loop_2008
	tsubcctv	%i5,	0x0C0F,	%i7
	fnands	%f11,	%f7,	%f8
	fble,a	%fcc3,	loop_2009
loop_2008:
	fbo,a	%fcc0,	loop_2010
	fmovspos	%xcc,	%f12,	%f11
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o5
loop_2009:
	movn	%icc,	%o0,	%g3
loop_2010:
	prefetch	[%l7 + 0x64],	 0x0
	fornot1s	%f31,	%f2,	%f24
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x0c,	 0x3
	movvc	%xcc,	%o2,	%i6
	add	%g1,	%g6,	%l2
	addccc	%o1,	0x0C33,	%l6
	brlz	%l1,	loop_2011
	movneg	%icc,	%g4,	%o7
	call	loop_2012
	smulcc	%i0,	%i3,	%l4
loop_2011:
	movge	%icc,	%l5,	%g2
	fsrc2	%f24,	%f0
loop_2012:
	addcc	%i1,	%o6,	%l0
	edge16	%i4,	%i2,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l3,	0x0793,	%g7
	movrgz	%o3,	%i7,	%o5
	tvs	%icc,	0x0
	sir	0x02A6
	edge32ln	%i5,	%o0,	%g3
	array16	%o2,	%g5,	%i6
	andcc	%g1,	0x0B27,	%g6
	fzero	%f28
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o1,	%l2
	ldsw	[%l7 + 0x58],	%l1
	sub	%g4,	0x0298,	%o7
	nop
	setx	0x1E9A02B0D04C022B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fcmple16	%f10,	%f18,	%i0
	fbu	%fcc3,	loop_2013
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc2,	loop_2014
	fnot1s	%f31,	%f27
loop_2013:
	fpsub16	%f26,	%f6,	%f30
	fmovrdlez	%i3,	%f0,	%f10
loop_2014:
	fpack32	%f4,	%f24,	%f4
	smulcc	%l6,	%l4,	%g2
	sub	%i1,	0x19B4,	%o6
	smulcc	%l5,	%l0,	%i2
	tgu	%icc,	0x3
	mulx	%i4,	0x0D4F,	%l3
	fmovrslez	%o4,	%f18,	%f10
	ldsh	[%l7 + 0x3A],	%g7
	udivcc	%o3,	0x0832,	%o5
	edge16n	%i5,	%o0,	%i7
	bl,a,pt	%xcc,	loop_2015
	fabsd	%f28,	%f26
	bne	loop_2016
	bneg,a	%xcc,	loop_2017
loop_2015:
	tsubcctv	%o2,	0x08BE,	%g3
	fmovscs	%icc,	%f25,	%f14
loop_2016:
	movgu	%xcc,	%g5,	%g1
loop_2017:
	bgu,a,pt	%icc,	loop_2018
	alignaddrl	%i6,	%o1,	%l2
	srax	%g6,	%g4,	%o7
	fmovdneg	%xcc,	%f1,	%f3
loop_2018:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc1,	loop_2019
	fmovsleu	%icc,	%f16,	%f0
	nop
	setx	0x206605EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	array16	%i0,	%i3,	%l6
loop_2019:
	addcc	%l1,	%g2,	%i1
	edge32ln	%o6,	%l4,	%l0
	tneg	%xcc,	0x5
	ld	[%l7 + 0x40],	%f2
	ldsw	[%l7 + 0x5C],	%i2
	faligndata	%f14,	%f24,	%f2
	fmovrsgz	%l5,	%f17,	%f14
	xor	%l3,	0x0DDA,	%i4
	srl	%g7,	%o3,	%o4
	fbne	%fcc1,	loop_2020
	st	%f15,	[%l7 + 0x3C]
	fble,a	%fcc3,	loop_2021
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f12
loop_2020:
	edge32l	%o5,	%o0,	%i7
	nop
	setx	0xF74BD33180503443,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
loop_2021:
	fba	%fcc1,	loop_2022
	bcc,a	%icc,	loop_2023
	nop
	setx	0xAE3C4006946F4FD2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xC3BF0D5F97CF5D5F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f14,	%f2
	tvs	%xcc,	0x3
loop_2022:
	ldub	[%l7 + 0x0B],	%i5
loop_2023:
	movneg	%icc,	%o2,	%g3
	fbul,a	%fcc3,	loop_2024
	xorcc	%g5,	0x151D,	%i6
	fbule,a	%fcc2,	loop_2025
	tn	%xcc,	0x6
loop_2024:
	andncc	%o1,	%l2,	%g6
	tcc	%icc,	0x6
loop_2025:
	xorcc	%g4,	0x0BA2,	%o7
	array16	%g1,	%i3,	%i0
	movcs	%xcc,	%l1,	%g2
	umulcc	%i1,	%o6,	%l4
	tvs	%xcc,	0x3
	sra	%l6,	0x07,	%i2
	std	%f14,	[%l7 + 0x70]
	movge	%xcc,	%l5,	%l0
	fbne	%fcc2,	loop_2026
	st	%f9,	[%l7 + 0x20]
	sub	%i4,	%g7,	%l3
	fmovrdlz	%o3,	%f6,	%f26
loop_2026:
	sdivx	%o5,	0x1BA8,	%o0
	fpmerge	%f24,	%f17,	%f4
	membar	0x4E
	nop
	fitod	%f2,	%f2
	fdtos	%f2,	%f24
	move	%icc,	%i7,	%o4
	udiv	%i5,	0x06C1,	%o2
	fxor	%f20,	%f8,	%f4
	bpos	%xcc,	loop_2027
	fpadd32	%f28,	%f24,	%f6
	wr	%g0,	0x0c,	%asi
	stha	%g3,	[%l7 + 0x50] %asi
loop_2027:
	pdist	%f16,	%f8,	%f28
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x04,	%g5,	%i6
	edge16n	%l2,	%g6,	%o1
	fbug	%fcc0,	loop_2028
	swap	[%l7 + 0x0C],	%g4
	nop
	fitos	%f8,	%f7
	fstox	%f7,	%f10
	fxtos	%f10,	%f8
	sir	0x14FC
loop_2028:
	nop
	set	0x2C, %i5
	lduw	[%l7 + %i5],	%o7
	fmovdpos	%xcc,	%f26,	%f2
	movl	%icc,	%i3,	%i0
	movcs	%icc,	%g1,	%l1
	edge16	%i1,	%o6,	%l4
	udiv	%l6,	0x11A6,	%g2
	srax	%i2,	%l0,	%i4
	movle	%xcc,	%g7,	%l3
	fmovdcc	%icc,	%f12,	%f16
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f16
	fxtod	%f16,	%f4
	nop
	fitod	%f8,	%f22
	fdtox	%f22,	%f28
	taddcc	%o3,	0x00A4,	%l5
	fmovrslez	%o5,	%f23,	%f24
	fbn,a	%fcc2,	loop_2029
	edge32l	%o0,	%i7,	%o4
	edge32ln	%o2,	%i5,	%g5
	set	0x78, %o6
	stxa	%g3,	[%l7 + %o6] 0x2f
	membar	#Sync
loop_2029:
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f14
	fxtod	%f14,	%f10
	fmovsg	%icc,	%f31,	%f17
	fxnors	%f27,	%f13,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i6,	0x1AF2,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l2,	%g4,	%o1
	mulx	%o7,	%i3,	%i0
	fmovse	%icc,	%f12,	%f15
	fbo	%fcc1,	loop_2030
	umulcc	%l1,	0x1BFE,	%i1
	fmovspos	%xcc,	%f10,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2030:
	pdist	%f6,	%f24,	%f28
	udiv	%o6,	0x1055,	%l4
	tcs	%icc,	0x5
	add	%g1,	%g2,	%i2
	movpos	%icc,	%l0,	%l6
	fmovdvc	%icc,	%f13,	%f4
	edge32	%i4,	%l3,	%g7
	xor	%l5,	%o5,	%o3
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	xnorcc	%o4,	%o0,	%o2
	andncc	%g5,	%g3,	%i5
	alignaddrl	%i6,	%g6,	%g4
	mulscc	%o1,	%o7,	%i3
	pdist	%f20,	%f24,	%f30
	movvc	%icc,	%l2,	%l1
	fba	%fcc3,	loop_2031
	movgu	%xcc,	%i0,	%o6
	fmovdn	%xcc,	%f19,	%f29
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x7C] %asi,	%l4
loop_2031:
	taddcc	%i1,	0x1931,	%g2
	swap	[%l7 + 0x5C],	%i2
	fmovdgu	%icc,	%f26,	%f28
	ba,pt	%xcc,	loop_2032
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
	edge8ln	%g1,	%l0,	%l6
	nop
	set	0x4E, %l3
	ldsh	[%l7 + %l3],	%i4
loop_2032:
	fmovdpos	%xcc,	%f6,	%f8
loop_2033:
	subc	%l3,	%l5,	%o5
	orcc	%g7,	0x18E8,	%o3
	array8	%o4,	%o0,	%i7
	nop
	setx	0xB057E2ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x1536C802,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f2,	%f11
	membar	0x78
	udivcc	%g5,	0x0291,	%g3
	fpadd32	%f4,	%f20,	%f30
	edge16n	%o2,	%i5,	%i6
	ldstub	[%l7 + 0x10],	%g4
	movg	%icc,	%o1,	%o7
	orcc	%i3,	0x0585,	%l2
	sdiv	%g6,	0x1A16,	%l1
	fmovrsne	%i0,	%f14,	%f7
	array32	%l4,	%o6,	%i1
	movle	%xcc,	%i2,	%g2
	popc	0x015B,	%g1
	fmovde	%xcc,	%f15,	%f12
	fandnot2	%f8,	%f20,	%f2
	brgz	%l6,	loop_2034
	flush	%l7 + 0x70
	add	%l0,	0x0A93,	%i4
	nop
	setx	0x47B14E51606DEEA0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
loop_2034:
	fornot1	%f22,	%f18,	%f10
	bshuffle	%f16,	%f22,	%f2
	edge16	%l5,	%l3,	%o5
	fpadd32	%f6,	%f28,	%f0
	brz,a	%g7,	loop_2035
	fmovsneg	%xcc,	%f29,	%f27
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%f14
	edge32	%o4,	%o0,	%i7
loop_2035:
	subcc	%g5,	%g3,	%o2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%i5
	sdivcc	%i6,	0x07D4,	%o1
	tsubcc	%g4,	%i3,	%l2
	taddcc	%o7,	0x0D2A,	%g6
	edge16l	%l1,	%i0,	%l4
	tn	%icc,	0x0
	array16	%o6,	%i1,	%g2
	fmovrdgez	%i2,	%f20,	%f26
	fpadd16s	%f10,	%f6,	%f21
	edge32n	%g1,	%l6,	%l0
	nop
	setx	0x69B9C118B84F466F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6C3084218BC6B362,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f22,	%f12
	fnot1	%f12,	%f16
	tgu	%icc,	0x3
	fmul8x16au	%f13,	%f7,	%f20
	fpadd16s	%f10,	%f10,	%f11
	fmovdvc	%icc,	%f21,	%f15
	array8	%i4,	%l3,	%l5
	bne	%icc,	loop_2036
	bpos,a,pt	%icc,	loop_2037
	tcc	%icc,	0x2
	add	%o5,	%o4,	%g7
loop_2036:
	ldd	[%l7 + 0x20],	%f0
loop_2037:
	stx	%i7,	[%l7 + 0x68]
	fsrc2s	%f12,	%f1
	edge16n	%g5,	%o0,	%o2
	movneg	%icc,	%g3,	%i5
	or	%i6,	%o3,	%o1
	and	%i3,	0x1E3A,	%l2
	tle	%xcc,	0x1
	fmovrde	%g4,	%f20,	%f12
	fbe,a	%fcc0,	loop_2038
	edge16ln	%g6,	%o7,	%l1
	fxor	%f10,	%f28,	%f6
	movn	%icc,	%i0,	%l4
loop_2038:
	xorcc	%i1,	%o6,	%g2
	fmovscs	%xcc,	%f14,	%f17
	movcc	%icc,	%g1,	%i2
	movrgz	%l0,	%i4,	%l3
	fmovrsgz	%l6,	%f10,	%f26
	tgu	%xcc,	0x0
	fmul8ulx16	%f26,	%f18,	%f14
	fmovdle	%xcc,	%f15,	%f29
	edge16n	%l5,	%o5,	%o4
	edge32n	%i7,	%g5,	%o0
	tpos	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g7,	%o2,	%i5
	movcs	%xcc,	%g3,	%i6
	movgu	%xcc,	%o3,	%o1
	udivx	%i3,	0x11A3,	%l2
	swap	[%l7 + 0x5C],	%g4
	be,a	loop_2039
	fmovdn	%icc,	%f29,	%f19
	popc	0x1B0F,	%g6
	fnor	%f12,	%f26,	%f22
loop_2039:
	movpos	%xcc,	%l1,	%i0
	movrgez	%l4,	0x3A8,	%o7
	umul	%i1,	%g2,	%g1
	fblg	%fcc2,	loop_2040
	sub	%i2,	0x16ED,	%l0
	sth	%i4,	[%l7 + 0x3C]
	brlz	%l3,	loop_2041
loop_2040:
	addcc	%l6,	%o6,	%l5
	fbge,a	%fcc3,	loop_2042
	edge8l	%o4,	%o5,	%i7
loop_2041:
	sethi	0x0218,	%o0
	for	%f12,	%f24,	%f24
loop_2042:
	fnegd	%f6,	%f10
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g7,	%g5
	fbu	%fcc0,	loop_2043
	move	%icc,	%o2,	%i5
	tvs	%xcc,	0x5
	sll	%i6,	%o3,	%g3
loop_2043:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x53] %asi,	%i3
	sethi	0x1EFA,	%o1
	fxors	%f22,	%f14,	%f18
	tl	%xcc,	0x2
	ta	%xcc,	0x3
	set	0x0E, %g2
	ldsba	[%l7 + %g2] 0x89,	%g4
	or	%l2,	%l1,	%i0
	sdivcc	%l4,	0x05FF,	%g6
	movpos	%xcc,	%i1,	%g2
	fpadd32	%f28,	%f10,	%f28
	fble,a	%fcc0,	loop_2044
	fands	%f26,	%f11,	%f28
	tpos	%xcc,	0x6
	subc	%o7,	%i2,	%l0
loop_2044:
	orncc	%g1,	0x0C94,	%l3
	tpos	%icc,	0x4
	movrgez	%l6,	%o6,	%l5
	stb	%i4,	[%l7 + 0x49]
	tsubcc	%o4,	0x033F,	%i7
	bcc,pt	%xcc,	loop_2045
	fba,a	%fcc3,	loop_2046
	and	%o5,	0x196F,	%o0
	fmovrdne	%g7,	%f0,	%f12
loop_2045:
	fcmpne32	%f20,	%f26,	%o2
loop_2046:
	smul	%g5,	0x01BB,	%i5
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x48] %asi,	%i6
	set	0x08, %g1
	lda	[%l7 + %g1] 0x15,	%f21
	bge	%xcc,	loop_2047
	tcc	%xcc,	0x2
	ldsb	[%l7 + 0x0D],	%g3
	orcc	%o3,	0x0DCA,	%o1
loop_2047:
	edge32ln	%i3,	%l2,	%g4
	orn	%i0,	%l1,	%l4
	addccc	%i1,	0x0279,	%g2
	move	%icc,	%o7,	%i2
	nop
	set	0x20, %i7
	ldsb	[%l7 + %i7],	%l0
	nop
	set	0x5A, %i3
	ldsh	[%l7 + %i3],	%g6
	tge	%icc,	0x7
	set	0x40, %l1
	ldxa	[%l7 + %l1] 0x19,	%g1
	tneg	%xcc,	0x1
	set	0x4C, %g5
	ldsha	[%l7 + %g5] 0x11,	%l6
	bvs,a	loop_2048
	movrgez	%l3,	%o6,	%l5
	fbn,a	%fcc1,	loop_2049
	edge8n	%i4,	%i7,	%o4
loop_2048:
	fmul8x16al	%f15,	%f12,	%f18
	bl,a	loop_2050
loop_2049:
	movle	%xcc,	%o0,	%o5
	sdivx	%o2,	0x1C9F,	%g7
	bpos,pt	%icc,	loop_2051
loop_2050:
	edge32n	%i5,	%g5,	%i6
	subc	%g3,	%o1,	%o3
	nop
	fitos	%f17,	%f28
loop_2051:
	srax	%l2,	0x06,	%i3
	umul	%g4,	0x135E,	%i0
	array32	%l1,	%l4,	%g2
	edge16ln	%o7,	%i1,	%l0
	fpack16	%f20,	%f10
	fbuge,a	%fcc3,	loop_2052
	taddcctv	%g6,	0x056F,	%g1
	xnor	%l6,	0x1E5A,	%i2
	fmuld8ulx16	%f5,	%f27,	%f14
loop_2052:
	addcc	%l3,	%l5,	%o6
	fpsub32	%f12,	%f20,	%f12
	movrgz	%i7,	%o4,	%o0
	andn	%o5,	0x1637,	%o2
	tl	%icc,	0x7
	movge	%icc,	%g7,	%i4
	mova	%icc,	%g5,	%i6
	edge16n	%i5,	%o1,	%g3
	fmovsne	%icc,	%f17,	%f9
	movcs	%xcc,	%o3,	%l2
	sir	0x1C85
	brgz	%g4,	loop_2053
	fmovrsgz	%i3,	%f2,	%f22
	alignaddrl	%l1,	%l4,	%i0
	movge	%xcc,	%g2,	%o7
loop_2053:
	movg	%xcc,	%i1,	%g6
	add	%l0,	%g1,	%i2
	movleu	%xcc,	%l3,	%l6
	wr	%g0,	0x18,	%asi
	stwa	%o6,	[%l7 + 0x78] %asi
	fmovdgu	%xcc,	%f13,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l5,	%i7,	%o4
	movrgz	%o0,	0x212,	%o5
	fmovdge	%icc,	%f31,	%f0
	brlez	%g7,	loop_2054
	edge8	%i4,	%g5,	%i6
	nop
	setx	loop_2055,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%icc,	0x6
loop_2054:
	edge32ln	%o2,	%i5,	%g3
	edge32l	%o3,	%l2,	%o1
loop_2055:
	ba,a,pt	%icc,	loop_2056
	nop
	fitos	%f9,	%f16
	fstox	%f16,	%f4
	subcc	%i3,	%l1,	%g4
	flush	%l7 + 0x0C
loop_2056:
	mulscc	%i0,	%g2,	%l4
	andcc	%o7,	0x0530,	%g6
	sdivcc	%i1,	0x0122,	%l0
	fpsub16	%f6,	%f16,	%f14
	tvs	%xcc,	0x0
	mova	%xcc,	%i2,	%g1
	tgu	%icc,	0x0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l6,	%o6
	edge16	%l3,	%l5,	%o4
	fnot1s	%f2,	%f10
	fmovs	%f17,	%f13
	movvc	%icc,	%o0,	%i7
	nop
	setx	0xA194211EB546EEAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x56569F0D623BD459,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f2,	%f4
	srl	%o5,	0x0F,	%i4
	bne,pn	%xcc,	loop_2057
	fmovd	%f30,	%f16
	ldub	[%l7 + 0x33],	%g7
	fblg,a	%fcc2,	loop_2058
loop_2057:
	fbn	%fcc3,	loop_2059
	movg	%icc,	%g5,	%i6
	bpos	%xcc,	loop_2060
loop_2058:
	stb	%i5,	[%l7 + 0x44]
loop_2059:
	fmuld8sux16	%f7,	%f4,	%f0
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o2
loop_2060:
	tcc	%icc,	0x7
	ldsh	[%l7 + 0x0E],	%o3
	smul	%g3,	%o1,	%l2
	andncc	%l1,	%i3,	%i0
	alignaddr	%g2,	%l4,	%g4
	andcc	%g6,	%o7,	%l0
	brz	%i2,	loop_2061
	orncc	%g1,	0x1068,	%l6
	xnorcc	%i1,	%o6,	%l5
	fandnot1s	%f24,	%f6,	%f26
loop_2061:
	nop
	setx	0x707658BB,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fnand	%f16,	%f2,	%f18
	lduw	[%l7 + 0x58],	%l3
	movrlez	%o0,	%i7,	%o4
	fmovd	%f6,	%f16
	bg,a	loop_2062
	mulscc	%o5,	%g7,	%g5
	and	%i4,	0x0998,	%i5
	nop
	setx	loop_2063,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2062:
	tle	%xcc,	0x0
	sllx	%i6,	0x0E,	%o2
	tvs	%xcc,	0x5
loop_2063:
	sra	%g3,	0x00,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l2,	0x229,	%o3
	movrgz	%i3,	0x363,	%i0
	te	%xcc,	0x2
	fpadd16s	%f15,	%f17,	%f20
	fblg	%fcc3,	loop_2064
	udivx	%l1,	0x0B8D,	%l4
	edge32l	%g4,	%g6,	%g2
	nop
	fitos	%f28,	%f3
loop_2064:
	tg	%icc,	0x4
	bleu,pn	%xcc,	loop_2065
	addccc	%o7,	%i2,	%g1
	tl	%icc,	0x1
	fmovse	%xcc,	%f22,	%f2
loop_2065:
	fmovdcc	%icc,	%f9,	%f28
	wr	%g0,	0x10,	%asi
	stwa	%l6,	[%l7 + 0x1C] %asi
	fmul8ulx16	%f14,	%f26,	%f18
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i1,	%l0
	fcmpne16	%f26,	%f24,	%l5
	tn	%xcc,	0x4
	fands	%f24,	%f23,	%f7
	brgz	%l3,	loop_2066
	xnor	%o6,	0x0087,	%o0
	fmovdcs	%xcc,	%f26,	%f0
	taddcc	%i7,	%o4,	%g7
loop_2066:
	swap	[%l7 + 0x5C],	%o5
	edge16	%g5,	%i5,	%i6
	nop
	setx	0x22269358,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xA2A9224A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f18,	%f24
	ta	%icc,	0x3
	mulscc	%i4,	%g3,	%o2
	array8	%o1,	%o3,	%l2
	mulx	%i3,	0x0958,	%i0
	tvc	%xcc,	0x6
	fbu	%fcc0,	loop_2067
	umul	%l4,	%g4,	%l1
	fmovrslz	%g2,	%f5,	%f22
	mova	%xcc,	%g6,	%i2
loop_2067:
	movvc	%icc,	%g1,	%l6
	fpadd32s	%f21,	%f15,	%f22
	tle	%icc,	0x1
	fbe,a	%fcc0,	loop_2068
	movg	%icc,	%o7,	%i1
	movge	%xcc,	%l5,	%l0
	nop
	set	0x50, %i1
	stw	%o6,	[%l7 + %i1]
loop_2068:
	st	%f12,	[%l7 + 0x34]
	ldx	[%l7 + 0x18],	%l3
	sub	%i7,	0x01E9,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g7,	%o4,	%o5
	add	%g5,	%i5,	%i6
	udiv	%g3,	0x0174,	%o2
	fxors	%f8,	%f14,	%f8
	mulscc	%i4,	%o3,	%o1
	tcc	%icc,	0x3
	fmovrdlz	%i3,	%f26,	%f14
	umul	%l2,	%i0,	%g4
	fmul8sux16	%f20,	%f8,	%f0
	movle	%xcc,	%l4,	%l1
	alignaddrl	%g6,	%g2,	%i2
	set	0x48, %g7
	prefetcha	[%l7 + %g7] 0x18,	 0x2
	bneg,pt	%icc,	loop_2069
	ta	%icc,	0x1
	smul	%g1,	0x1480,	%o7
	udiv	%l5,	0x1650,	%l0
loop_2069:
	tgu	%xcc,	0x7
	ldsw	[%l7 + 0x18],	%o6
	ba,pn	%xcc,	loop_2070
	membar	0x00
	xnorcc	%l3,	%i1,	%o0
	nop
	setx	0xCBAB5E2408A555E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x8B47447A4F201FA6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f6,	%f18
loop_2070:
	fmovdcs	%icc,	%f15,	%f3
	add	%g7,	%o4,	%o5
	wr	%g0,	0x10,	%asi
	stha	%g5,	[%l7 + 0x58] %asi
	umul	%i7,	0x19C7,	%i6
	edge32	%g3,	%o2,	%i4
	fbn,a	%fcc0,	loop_2071
	movge	%xcc,	%i5,	%o1
	tge	%xcc,	0x4
	nop
	fitos	%f12,	%f15
	fstox	%f15,	%f26
	fxtos	%f26,	%f31
loop_2071:
	bgu,a,pt	%xcc,	loop_2072
	andn	%o3,	0x1462,	%i3
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x18
loop_2072:
	edge16l	%l2,	%i0,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l1,	%g4,	%g2
	taddcctv	%g6,	%i2,	%g1
	movre	%l6,	0x3D6,	%l5
	fnegd	%f14,	%f14
	fmovrdlz	%l0,	%f4,	%f14
	sub	%o7,	0x08EF,	%o6
	fsrc1	%f16,	%f26
	nop
	setx	0x24D0BEF7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f3
	movgu	%xcc,	%i1,	%l3
	movneg	%icc,	%g7,	%o0
	tg	%icc,	0x2
	fmovsn	%xcc,	%f11,	%f14
	edge16ln	%o5,	%o4,	%i7
	fpsub16s	%f26,	%f0,	%f15
	fmovdgu	%xcc,	%f14,	%f13
	xnorcc	%g5,	0x0F50,	%i6
	tl	%icc,	0x6
	umul	%o2,	0x1539,	%i4
	edge16n	%g3,	%o1,	%o3
	addccc	%i5,	%l2,	%i3
	move	%xcc,	%l4,	%l1
	andncc	%g4,	%g2,	%g6
	edge32ln	%i2,	%g1,	%i0
	movrne	%l5,	%l0,	%o7
	sll	%l6,	%i1,	%l3
	udivx	%g7,	0x1242,	%o6
	fbge,a	%fcc1,	loop_2073
	andncc	%o5,	%o4,	%i7
	edge32ln	%o0,	%i6,	%g5
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i4
loop_2073:
	udivcc	%g3,	0x0486,	%o2
	fors	%f28,	%f15,	%f19
	movne	%xcc,	%o1,	%i5
	fnands	%f4,	%f22,	%f24
	fnands	%f14,	%f23,	%f27
	std	%f20,	[%l7 + 0x68]
	tle	%icc,	0x7
	fones	%f1
	tle	%icc,	0x7
	array32	%l2,	%o3,	%i3
	tn	%icc,	0x1
	movle	%icc,	%l4,	%l1
	ba,a	%icc,	loop_2074
	srlx	%g2,	%g4,	%i2
	addccc	%g1,	0x1C39,	%i0
	movcc	%icc,	%g6,	%l0
loop_2074:
	array16	%l5,	%o7,	%l6
	move	%icc,	%l3,	%i1
	ldsw	[%l7 + 0x78],	%o6
	orn	%o5,	0x1551,	%o4
	orn	%i7,	%o0,	%g7
	fabsd	%f6,	%f22
	bcc,a	%xcc,	loop_2075
	movn	%xcc,	%i6,	%g5
	brnz,a	%g3,	loop_2076
	movgu	%xcc,	%o2,	%o1
loop_2075:
	st	%f0,	[%l7 + 0x28]
	fandnot2	%f0,	%f20,	%f6
loop_2076:
	nop
	set	0x4C, %o2
	swapa	[%l7 + %o2] 0x89,	%i5
	fmovsn	%xcc,	%f8,	%f10
	bge,a	loop_2077
	udiv	%i4,	0x0B52,	%l2
	addcc	%i3,	%o3,	%l4
	faligndata	%f4,	%f18,	%f16
loop_2077:
	fbul	%fcc3,	loop_2078
	fbuge,a	%fcc1,	loop_2079
	addc	%l1,	0x1351,	%g2
	fmovsvc	%icc,	%f30,	%f13
loop_2078:
	brnz	%g4,	loop_2080
loop_2079:
	nop
	fitos	%f28,	%f10
	fpadd16	%f4,	%f12,	%f22
	fsrc1s	%f13,	%f15
loop_2080:
	tgu	%xcc,	0x2
	fcmpgt32	%f18,	%f4,	%g1
	edge8l	%i0,	%g6,	%i2
	flush	%l7 + 0x60
	bvs,a	loop_2081
	movcc	%icc,	%l5,	%o7
	fmul8x16al	%f28,	%f27,	%f20
	xorcc	%l0,	0x0901,	%l3
loop_2081:
	edge16ln	%l6,	%i1,	%o5
	ld	[%l7 + 0x50],	%f13
	fsrc2	%f28,	%f28
	alignaddr	%o4,	%o6,	%i7
	subcc	%g7,	0x1B10,	%o0
	popc	%i6,	%g5
	brlez	%g3,	loop_2082
	fble	%fcc3,	loop_2083
	movg	%icc,	%o2,	%o1
	add	%i5,	0x02EA,	%l2
loop_2082:
	brgez,a	%i4,	loop_2084
loop_2083:
	bpos,a	loop_2085
	membar	0x05
	edge8	%o3,	%i3,	%l1
loop_2084:
	bn,a	%icc,	loop_2086
loop_2085:
	nop
	setx	loop_2087,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brz,a	%l4,	loop_2088
	movneg	%xcc,	%g4,	%g2
loop_2086:
	nop
	setx	loop_2089,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2087:
	nop
	setx	0xEF01F69854092154,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x044E6F5473909A25,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f8,	%f30
loop_2088:
	fornot2	%f18,	%f16,	%f26
	stw	%g1,	[%l7 + 0x38]
loop_2089:
	srlx	%g6,	0x1E,	%i2
	fornot1	%f28,	%f0,	%f8
	tneg	%icc,	0x4
	srlx	%l5,	0x1A,	%i0
	andncc	%l0,	%l3,	%l6
	tl	%icc,	0x7
	movrgez	%o7,	%i1,	%o4
	orcc	%o5,	%o6,	%g7
	brz,a	%o0,	loop_2090
	tle	%xcc,	0x4
	fmovsge	%xcc,	%f26,	%f2
	bvc	loop_2091
loop_2090:
	tne	%xcc,	0x2
	fmovsn	%icc,	%f16,	%f0
	movrgz	%i6,	%g5,	%i7
loop_2091:
	fcmpgt32	%f28,	%f12,	%g3
	tgu	%xcc,	0x3
	sethi	0x1039,	%o1
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i5
	tneg	%xcc,	0x1
	fpadd32s	%f1,	%f0,	%f20
	fmul8sux16	%f4,	%f6,	%f12
	edge16ln	%o2,	%i4,	%o3
	andn	%i3,	0x103E,	%l2
	fandnot1s	%f15,	%f4,	%f18
	movge	%xcc,	%l4,	%l1
	edge16n	%g4,	%g2,	%g1
	tsubcctv	%i2,	%l5,	%i0
	tneg	%xcc,	0x4
	fnand	%f26,	%f20,	%f18
	bpos,pn	%icc,	loop_2092
	fnands	%f3,	%f9,	%f18
	bge,a,pn	%xcc,	loop_2093
	popc	0x1EB0,	%l0
loop_2092:
	fbul	%fcc0,	loop_2094
	fbule	%fcc2,	loop_2095
loop_2093:
	edge8l	%l3,	%l6,	%o7
	tgu	%icc,	0x2
loop_2094:
	add	%g6,	%i1,	%o5
loop_2095:
	subcc	%o4,	%o6,	%g7
	movleu	%xcc,	%i6,	%o0
	bgu	loop_2096
	addcc	%i7,	0x13E4,	%g3
	ldub	[%l7 + 0x5C],	%o1
	wr	%g0,	0x2a,	%asi
	stha	%i5,	[%l7 + 0x30] %asi
	membar	#Sync
loop_2096:
	movleu	%icc,	%g5,	%i4
	fbule	%fcc1,	loop_2097
	tl	%icc,	0x2
	sir	0x0BFA
	nop
	setx loop_2098, %l0, %l1
	jmpl %l1, %o3
loop_2097:
	movcc	%icc,	%o2,	%i3
	movcc	%xcc,	%l2,	%l1
	movre	%l4,	0x0CE,	%g2
loop_2098:
	udivcc	%g1,	0x031A,	%i2
	tn	%xcc,	0x2
	movrne	%g4,	%i0,	%l0
	add	%l3,	%l5,	%o7
	fmovrdlz	%l6,	%f2,	%f16
	fmovsgu	%xcc,	%f11,	%f7
	set	0x4C, %i6
	lda	[%l7 + %i6] 0x88,	%f23
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x18, %i0
	prefetcha	[%l7 + %i0] 0x15,	 0x2
	bvs,a,pn	%icc,	loop_2099
	fornot1s	%f25,	%f2,	%f2
	and	%i1,	%o5,	%o6
	edge16	%o4,	%i6,	%o0
loop_2099:
	brgez,a	%g7,	loop_2100
	movvc	%xcc,	%i7,	%g3
	movge	%icc,	%i5,	%g5
	prefetch	[%l7 + 0x20],	 0x1
loop_2100:
	fmovdneg	%xcc,	%f24,	%f4
	edge8	%i4,	%o3,	%o2
	movrlz	%i3,	0x191,	%o1
	subccc	%l2,	%l1,	%g2
	edge16ln	%g1,	%l4,	%i2
	smul	%g4,	%l0,	%l3
	fbge,a	%fcc2,	loop_2101
	lduh	[%l7 + 0x78],	%l5
	sdiv	%o7,	0x1667,	%i0
	fexpand	%f8,	%f26
loop_2101:
	sub	%g6,	%l6,	%i1
	tleu	%icc,	0x5
	fexpand	%f0,	%f6
	fmovsleu	%icc,	%f2,	%f6
	bcc,a	%icc,	loop_2102
	fmovsg	%icc,	%f10,	%f27
	bne	loop_2103
	brz,a	%o6,	loop_2104
loop_2102:
	edge32l	%o5,	%o4,	%o0
	stw	%g7,	[%l7 + 0x24]
loop_2103:
	movrlz	%i7,	0x016,	%g3
loop_2104:
	brgz	%i5,	loop_2105
	nop
	fitod	%f12,	%f30
	fdtox	%f30,	%f18
	tcc	%xcc,	0x4
	fbl	%fcc3,	loop_2106
loop_2105:
	movrlez	%i6,	0x2EC,	%g5
	addccc	%i4,	0x05C8,	%o2
	fnegd	%f14,	%f18
loop_2106:
	sdivcc	%o3,	0x0578,	%i3
	fcmpgt16	%f2,	%f22,	%l2
	bvs,a,pn	%icc,	loop_2107
	be,a	loop_2108
	fmovrsgz	%o1,	%f30,	%f1
	edge16	%l1,	%g2,	%l4
loop_2107:
	udivx	%g1,	0x0ACA,	%g4
loop_2108:
	array32	%l0,	%i2,	%l5
	bneg	loop_2109
	brz,a	%l3,	loop_2110
	movg	%xcc,	%i0,	%g6
	movrgz	%l6,	%o7,	%o6
loop_2109:
	sdivx	%i1,	0x17C6,	%o4
loop_2110:
	fmovrslz	%o0,	%f13,	%f16
	fnands	%f24,	%f27,	%f10
	fbu	%fcc1,	loop_2111
	sll	%o5,	0x09,	%g7
	xorcc	%g3,	0x0006,	%i5
	edge8l	%i6,	%i7,	%i4
loop_2111:
	mulx	%g5,	0x1881,	%o2
	bpos,a	loop_2112
	sll	%i3,	0x0C,	%l2
	fmul8x16	%f15,	%f4,	%f2
	addccc	%o1,	0x12FF,	%l1
loop_2112:
	andcc	%o3,	%l4,	%g2
	fmovsge	%icc,	%f25,	%f31
	addcc	%g1,	%l0,	%i2
	bvs,a	%xcc,	loop_2113
	fmovrsgz	%l5,	%f19,	%f20
	andn	%g4,	0x020C,	%l3
	brgz,a	%i0,	loop_2114
loop_2113:
	fcmpeq32	%f4,	%f28,	%l6
	xor	%o7,	0x1730,	%g6
	bge,pn	%xcc,	loop_2115
loop_2114:
	sethi	0x1BAC,	%o6
	xnorcc	%o4,	0x1345,	%i1
	tsubcctv	%o0,	%o5,	%g7
loop_2115:
	edge8ln	%i5,	%g3,	%i7
	movge	%icc,	%i6,	%i4
	movneg	%icc,	%g5,	%i3
	sth	%l2,	[%l7 + 0x18]
	nop
	setx loop_2116, %l0, %l1
	jmpl %l1, %o2
	popc	0x0377,	%o1
	fba,a	%fcc0,	loop_2117
	movvs	%xcc,	%o3,	%l1
loop_2116:
	sra	%g2,	0x1B,	%g1
	edge32ln	%l4,	%l0,	%l5
loop_2117:
	nop
	set	0x44, %i4
	stha	%i2,	[%l7 + %i4] 0x2f
	membar	#Sync
	tleu	%icc,	0x3
	edge32n	%g4,	%i0,	%l6
	ldsb	[%l7 + 0x5A],	%o7
	or	%g6,	0x0D92,	%o6
	sethi	0x1DB4,	%l3
	fsrc2	%f16,	%f14
	udivcc	%i1,	0x0322,	%o4
	tn	%xcc,	0x1
	sdiv	%o5,	0x09F5,	%g7
	fabsd	%f20,	%f8
	prefetch	[%l7 + 0x7C],	 0x0
	edge8	%o0,	%i5,	%i7
	ldstub	[%l7 + 0x45],	%g3
	brgz	%i6,	loop_2118
	membar	0x24
	fmovrslz	%g5,	%f23,	%f6
	popc	0x14AE,	%i3
loop_2118:
	nop
	setx	loop_2119,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%l2,	%i4
	bcc,a	loop_2120
	tne	%icc,	0x6
loop_2119:
	bg,pt	%xcc,	loop_2121
	nop
	setx	0xE88C3AC1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xF9FBD121,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f12,	%f3
loop_2120:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3B] %asi,	%o2
loop_2121:
	move	%xcc,	%o3,	%o1
	bcc,pt	%xcc,	loop_2122
	tpos	%icc,	0x6
	movrgz	%g2,	%g1,	%l4
	fmul8ulx16	%f20,	%f4,	%f24
loop_2122:
	movpos	%xcc,	%l1,	%l5
	taddcctv	%i2,	%g4,	%i0
	nop
	setx	0x0F9CF99E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x2BA81292,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f25,	%f26
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x10
	fsrc2	%f22,	%f8
	tcs	%xcc,	0x6
	call	loop_2123
	fmovdge	%xcc,	%f19,	%f29
	fbl	%fcc2,	loop_2124
	mova	%icc,	%l0,	%l6
loop_2123:
	orcc	%o7,	%g6,	%l3
	movcs	%icc,	%i1,	%o6
loop_2124:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f23,	[%l7 + 0x40] %asi
	te	%icc,	0x6
	movne	%xcc,	%o4,	%g7
	wr	%g0,	0x89,	%asi
	sta	%f3,	[%l7 + 0x68] %asi
	alignaddrl	%o0,	%i5,	%o5
	fblg	%fcc3,	loop_2125
	tvs	%xcc,	0x1
	movneg	%icc,	%i7,	%i6
	tne	%icc,	0x7
loop_2125:
	brlez	%g5,	loop_2126
	fmul8x16au	%f13,	%f21,	%f4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%i3
loop_2126:
	movneg	%xcc,	%l2,	%g3
	fmul8x16al	%f23,	%f22,	%f12
	nop
	fitos	%f5,	%f5
	fstod	%f5,	%f14
	fble	%fcc1,	loop_2127
	bleu,pt	%icc,	loop_2128
	fba	%fcc2,	loop_2129
	fbue	%fcc3,	loop_2130
loop_2127:
	fmovsvc	%xcc,	%f0,	%f3
loop_2128:
	tpos	%icc,	0x0
loop_2129:
	smul	%i4,	0x1060,	%o3
loop_2130:
	edge8n	%o2,	%g2,	%o1
	nop
	fitos	%f6,	%f9
	fstox	%f9,	%f12
	fxtos	%f12,	%f9
	fbul,a	%fcc3,	loop_2131
	orcc	%g1,	%l1,	%l4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x2C] %asi,	%f9
loop_2131:
	edge8n	%i2,	%g4,	%l5
	edge8	%l0,	%i0,	%o7
	addcc	%l6,	0x16B0,	%l3
	movpos	%icc,	%g6,	%o6
	tvs	%xcc,	0x5
	fnands	%f1,	%f20,	%f30
	movle	%xcc,	%o4,	%i1
	fbe	%fcc0,	loop_2132
	fmovsne	%icc,	%f23,	%f28
	sethi	0x1448,	%o0
	fble	%fcc0,	loop_2133
loop_2132:
	edge32n	%g7,	%o5,	%i5
	sra	%i6,	%g5,	%i3
	movge	%xcc,	%l2,	%g3
loop_2133:
	andcc	%i7,	%o3,	%i4
	movge	%icc,	%g2,	%o1
	fmovrslez	%g1,	%f8,	%f27
	bl,a,pt	%xcc,	loop_2134
	fmovda	%icc,	%f5,	%f3
	tg	%icc,	0x4
	fsrc1s	%f25,	%f5
loop_2134:
	edge8	%l1,	%l4,	%i2
	fbn,a	%fcc0,	loop_2135
	fmul8x16au	%f28,	%f2,	%f28
	orn	%g4,	%l5,	%o2
	sethi	0x0FAE,	%i0
loop_2135:
	nop
	set	0x48, %l5
	stwa	%o7,	[%l7 + %l5] 0x14
	fbug	%fcc3,	loop_2136
	edge32ln	%l6,	%l3,	%l0
	srl	%o6,	%g6,	%i1
	ld	[%l7 + 0x48],	%f2
loop_2136:
	fbg,a	%fcc3,	loop_2137
	srl	%o0,	0x17,	%g7
	movge	%xcc,	%o4,	%o5
	fbu,a	%fcc1,	loop_2138
loop_2137:
	fmovda	%xcc,	%f23,	%f30
	ldsh	[%l7 + 0x68],	%i5
	fnand	%f30,	%f26,	%f6
loop_2138:
	movrlz	%g5,	%i6,	%l2
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f14
	fxtod	%f14,	%f14
	tvs	%xcc,	0x2
	addcc	%g3,	%i7,	%o3
	movleu	%xcc,	%i4,	%g2
	pdist	%f18,	%f28,	%f6
	ldx	[%l7 + 0x10],	%o1
	sdivcc	%g1,	0x062D,	%i3
	nop
	setx	loop_2139,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnot2	%f26,	%f24
	fcmple32	%f16,	%f16,	%l4
	brgz,a	%i2,	loop_2140
loop_2139:
	movl	%xcc,	%g4,	%l1
	mulscc	%l5,	%i0,	%o7
	nop
	setx	0x7F0D3166,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x127E8865,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f9,	%f15
loop_2140:
	bcs,a	loop_2141
	edge16	%o2,	%l6,	%l3
	sra	%l0,	0x03,	%o6
	andn	%g6,	%o0,	%g7
loop_2141:
	fors	%f28,	%f16,	%f8
	srl	%o4,	%i1,	%o5
	tcs	%xcc,	0x0
	tleu	%icc,	0x4
	movn	%xcc,	%i5,	%i6
	set	0x68, %g6
	ldsha	[%l7 + %g6] 0x15,	%l2
	add	%g3,	0x07C9,	%g5
	movrlez	%i7,	0x010,	%o3
	addcc	%g2,	%o1,	%i4
	movvc	%xcc,	%g1,	%l4
	array8	%i3,	%i2,	%l1
	nop
	fitod	%f2,	%f0
	fdtoi	%f0,	%f17
	xor	%g4,	%l5,	%o7
	fors	%f16,	%f15,	%f4
	addc	%o2,	%l6,	%l3
	addccc	%l0,	%i0,	%g6
	fnegs	%f8,	%f14
	fmul8sux16	%f4,	%f10,	%f24
	movg	%icc,	%o0,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g7,	0x395,	%i1
	addcc	%o5,	0x0881,	%o4
	fbne	%fcc3,	loop_2142
	fbug	%fcc0,	loop_2143
	stx	%i6,	[%l7 + 0x78]
	sdivcc	%l2,	0x12F1,	%i5
loop_2142:
	tg	%xcc,	0x4
loop_2143:
	array32	%g5,	%i7,	%o3
	fornot2	%f22,	%f28,	%f16
	stw	%g2,	[%l7 + 0x1C]
	edge16ln	%o1,	%g3,	%g1
	sethi	0x1118,	%l4
	or	%i4,	0x15DE,	%i2
	fmovdn	%icc,	%f22,	%f2
	brgez,a	%i3,	loop_2144
	sra	%g4,	%l5,	%o7
	bneg,pn	%icc,	loop_2145
	edge8l	%l1,	%o2,	%l3
loop_2144:
	or	%l6,	%i0,	%g6
	movl	%icc,	%l0,	%o0
loop_2145:
	flush	%l7 + 0x60
	call	loop_2146
	fmovrslz	%g7,	%f24,	%f0
	fandnot2s	%f11,	%f23,	%f30
	xnorcc	%o6,	0x004A,	%o5
loop_2146:
	fornot2	%f0,	%f24,	%f10
	movleu	%icc,	%i1,	%o4
	udivx	%l2,	0x1870,	%i5
	te	%icc,	0x6
	fmovrslez	%i6,	%f14,	%f20
	xnorcc	%i7,	0x0340,	%o3
	wr	%g0,	0xe2,	%asi
	stha	%g5,	[%l7 + 0x72] %asi
	membar	#Sync
	fbue,a	%fcc3,	loop_2147
	fcmpeq32	%f12,	%f0,	%g2
	ldub	[%l7 + 0x3B],	%o1
	bvs,a,pt	%xcc,	loop_2148
loop_2147:
	orcc	%g1,	0x11FD,	%l4
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2148:
	sdivx	%g3,	0x053A,	%i2
	xor	%i3,	%i4,	%l5
	nop
	setx	0x3825835FD0D8F0E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD6886E5BC408B2C3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f22,	%f26
	umulcc	%o7,	0x0EEA,	%g4
	fnot1	%f16,	%f14
	sdiv	%l1,	0x03AD,	%o2
	movrgez	%l6,	%i0,	%l3
	tgu	%icc,	0x6
	fnands	%f14,	%f6,	%f23
	movg	%icc,	%l0,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x64],	%g6
	sdiv	%g7,	0x1F75,	%o5
	smul	%o6,	%i1,	%o4
	movleu	%icc,	%i5,	%l2
	xnorcc	%i6,	0x1B33,	%o3
	lduh	[%l7 + 0x60],	%g5
	sdiv	%i7,	0x10F5,	%o1
	tleu	%icc,	0x2
	udiv	%g2,	0x0CF4,	%l4
	nop
	fitos	%f1,	%f12
	fstoi	%f12,	%f3
	movrlz	%g1,	0x393,	%i2
	tl	%xcc,	0x7
	fmovdleu	%icc,	%f27,	%f24
	or	%g3,	%i3,	%l5
	edge8ln	%i4,	%o7,	%l1
	sll	%o2,	%l6,	%i0
	fpackfix	%f18,	%f29
	fmovdleu	%icc,	%f30,	%f29
	brz	%g4,	loop_2149
	movre	%l3,	0x08A,	%o0
	bge,pt	%xcc,	loop_2150
	nop
	fitos	%f0,	%f15
	fstox	%f15,	%f0
loop_2149:
	tsubcctv	%g6,	0x14C8,	%g7
	tvc	%xcc,	0x5
loop_2150:
	bvs,a	%icc,	loop_2151
	tle	%xcc,	0x1
	set	0x4E, %o0
	lduha	[%l7 + %o0] 0x81,	%o5
loop_2151:
	edge32l	%o6,	%l0,	%o4
	srlx	%i5,	0x06,	%l2
	sll	%i6,	%i1,	%g5
	srl	%o3,	%i7,	%o1
	sir	0x053D
	movge	%icc,	%l4,	%g2
	add	%g1,	0x082D,	%g3
	fmovsl	%icc,	%f21,	%f20
	andn	%i3,	0x0F95,	%i2
	smul	%i4,	0x0C06,	%o7
	xorcc	%l1,	0x0BCA,	%l5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x0C] %asi,	%l6
	tl	%icc,	0x6
	set	0x30, %g3
	stwa	%o2,	[%l7 + %g3] 0x81
	ta	%icc,	0x4
	sllx	%i0,	0x10,	%g4
	alignaddrl	%o0,	%l3,	%g6
	stw	%g7,	[%l7 + 0x30]
	subc	%o5,	%l0,	%o6
	array16	%i5,	%o4,	%l2
	bge	%icc,	loop_2152
	smulcc	%i1,	0x0804,	%i6
	umul	%g5,	%o3,	%o1
	andn	%i7,	%g2,	%g1
loop_2152:
	orn	%g3,	%i3,	%l4
	ta	%icc,	0x1
	movvc	%icc,	%i2,	%i4
	tgu	%icc,	0x6
	edge32n	%o7,	%l1,	%l6
	movne	%xcc,	%l5,	%o2
	orcc	%g4,	0x00AB,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x5
	sethi	0x0E1C,	%l3
	tl	%xcc,	0x2
	movvs	%xcc,	%g6,	%g7
	fpadd16	%f16,	%f14,	%f18
	edge32ln	%o0,	%l0,	%o5
	smul	%i5,	0x0EF0,	%o6
	movrgz	%l2,	%o4,	%i1
	movre	%i6,	0x208,	%g5
	fmovspos	%xcc,	%f21,	%f10
	movrgez	%o1,	0x003,	%i7
	xnorcc	%o3,	0x1CF8,	%g1
	fsrc1	%f10,	%f12
	alignaddr	%g3,	%i3,	%l4
	stx	%i2,	[%l7 + 0x60]
	tvc	%xcc,	0x7
	alignaddr	%i4,	%o7,	%l1
	std	%f30,	[%l7 + 0x58]
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x54, %l4
	lduw	[%l7 + %l4],	%l6
	bcc,pt	%xcc,	loop_2153
	ldub	[%l7 + 0x47],	%g2
	fone	%f30
	fmul8ulx16	%f28,	%f26,	%f30
loop_2153:
	bvs,a,pn	%icc,	loop_2154
	movrlz	%l5,	%g4,	%i0
	tvs	%xcc,	0x5
	tg	%icc,	0x0
loop_2154:
	orcc	%o2,	%g6,	%l3
	bleu,a	loop_2155
	movpos	%icc,	%g7,	%l0
	xorcc	%o0,	0x1FFA,	%o5
	subc	%i5,	%o6,	%l2
loop_2155:
	fnot1s	%f0,	%f0
	edge16ln	%o4,	%i1,	%i6
	array32	%o1,	%i7,	%g5
	fxors	%f9,	%f13,	%f23
	tpos	%xcc,	0x5
	movg	%icc,	%g1,	%g3
	fmovrse	%o3,	%f15,	%f7
	fbo,a	%fcc0,	loop_2156
	bneg,a,pt	%icc,	loop_2157
	tge	%icc,	0x3
	umulcc	%l4,	0x149B,	%i2
loop_2156:
	edge8l	%i3,	%o7,	%l1
loop_2157:
	bn	%icc,	loop_2158
	fone	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i4,	0x1196,	%g2
loop_2158:
	fmovdvs	%icc,	%f2,	%f14
	fandnot2s	%f15,	%f20,	%f28
	ldsb	[%l7 + 0x31],	%l5
	fzero	%f24
	lduh	[%l7 + 0x0A],	%l6
	fnand	%f26,	%f6,	%f26
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x80] %asi,	%i0
	move	%icc,	%g4,	%o2
	addc	%g6,	0x1330,	%l3
	movpos	%icc,	%g7,	%l0
	fands	%f30,	%f23,	%f18
	srlx	%o0,	0x17,	%o5
	fbuge,a	%fcc2,	loop_2159
	fpackfix	%f4,	%f28
	fpackfix	%f8,	%f20
	tneg	%icc,	0x3
loop_2159:
	tvs	%icc,	0x2
	tleu	%xcc,	0x4
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f28
	tgu	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%o4
	fmovsa	%xcc,	%f28,	%f20
	fcmpeq16	%f12,	%f14,	%l2
	movre	%i6,	0x3AD,	%o1
	brgez,a	%i1,	loop_2160
	ba,a	loop_2161
	edge16l	%i7,	%g5,	%g1
	fmovdvc	%xcc,	%f12,	%f9
loop_2160:
	fcmpeq32	%f0,	%f12,	%o3
loop_2161:
	fbne	%fcc0,	loop_2162
	or	%l4,	%g3,	%i3
	tcc	%xcc,	0x4
	fands	%f2,	%f0,	%f5
loop_2162:
	nop
	set	0x42, %l0
	ldsba	[%l7 + %l0] 0x18,	%i2
	ldub	[%l7 + 0x70],	%l1
	umul	%i4,	0x185A,	%g2
	membar	0x27
	movcc	%icc,	%l5,	%o7
	movn	%icc,	%l6,	%g4
	or	%i0,	%g6,	%l3
	nop
	fitod	%f0,	%f8
	fdtoi	%f8,	%f2
	popc	0x1B8E,	%o2
	fandnot1	%f28,	%f8,	%f30
	nop
	setx	0x907535DD,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	fsrc2s	%f22,	%f9
	xnorcc	%g7,	0x0A49,	%l0
	or	%o5,	%o0,	%i5
	set	0x64, %o1
	lduwa	[%l7 + %o1] 0x0c,	%o6
	edge32n	%o4,	%i6,	%o1
	fmovsne	%icc,	%f9,	%f23
	xnorcc	%l2,	0x0246,	%i7
	movrlz	%i1,	%g5,	%g1
	wr	%g0,	0x88,	%asi
	stba	%o3,	[%l7 + 0x29] %asi
	xnorcc	%l4,	0x0645,	%i3
	nop
	setx	0x2D7DC542E56F16D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f14
	array8	%g3,	%i2,	%l1
	umulcc	%i4,	%g2,	%o7
	movre	%l5,	%l6,	%g4
	tcs	%xcc,	0x7
	fbne	%fcc1,	loop_2163
	sdivx	%g6,	0x1AED,	%i0
	taddcctv	%l3,	%g7,	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o5,	%o2
loop_2163:
	nop
	set	0x58, %g4
	sta	%f1,	[%l7 + %g4] 0x89
	fmovdl	%icc,	%f3,	%f1
	fornot2	%f22,	%f20,	%f18
	orn	%i5,	%o6,	%o0
	fmovsneg	%icc,	%f23,	%f24
	tne	%xcc,	0x1
	bne	loop_2164
	bvc	%icc,	loop_2165
	bge,pt	%icc,	loop_2166
	fba	%fcc1,	loop_2167
loop_2164:
	ldsh	[%l7 + 0x36],	%i6
loop_2165:
	for	%f6,	%f26,	%f22
loop_2166:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2167:
	fmul8x16	%f21,	%f14,	%f30
	fbul	%fcc0,	loop_2168
	alignaddr	%o4,	%l2,	%o1
	ldd	[%l7 + 0x60],	%f22
	edge8l	%i1,	%i7,	%g1
loop_2168:
	add	%g5,	0x0402,	%o3
	call	loop_2169
	tneg	%xcc,	0x4
	bleu,a,pt	%icc,	loop_2170
	edge32n	%i3,	%l4,	%g3
loop_2169:
	fbe	%fcc1,	loop_2171
	fnot2s	%f25,	%f25
loop_2170:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l1,	%i4
loop_2171:
	movgu	%xcc,	%g2,	%i2
	fmovdneg	%icc,	%f31,	%f3
	sub	%l5,	%l6,	%o7
	stw	%g6,	[%l7 + 0x0C]
	tvs	%icc,	0x0
	addccc	%i0,	0x1F64,	%g4
	udiv	%g7,	0x0D8C,	%l0
	movpos	%xcc,	%o5,	%o2
	edge32l	%i5,	%l3,	%o0
	fbn	%fcc2,	loop_2172
	stw	%o6,	[%l7 + 0x18]
	orn	%i6,	0x1FC1,	%o4
	edge16l	%l2,	%o1,	%i1
loop_2172:
	xorcc	%g1,	0x0CE2,	%i7
	fexpand	%f20,	%f6
	tpos	%icc,	0x5
	smulcc	%o3,	%i3,	%g5
	fmovdpos	%icc,	%f5,	%f9
	udivx	%l4,	0x1A10,	%g3
	addcc	%l1,	%i4,	%i2
	sdivcc	%g2,	0x0129,	%l6
	alignaddr	%l5,	%o7,	%i0
	stx	%g4,	[%l7 + 0x28]
	edge16n	%g7,	%g6,	%l0
	nop
	fitos	%f14,	%f20
	fstox	%f20,	%f26
	udiv	%o5,	0x1BFC,	%i5
	fexpand	%f26,	%f28
	orcc	%l3,	%o0,	%o2
	fsrc2s	%f16,	%f30
	fsrc2	%f10,	%f0
	andn	%i6,	0x13C5,	%o6
	subccc	%l2,	%o1,	%i1
	movvc	%xcc,	%g1,	%i7
	xnorcc	%o3,	%o4,	%i3
	fble,a	%fcc3,	loop_2173
	sth	%l4,	[%l7 + 0x74]
	fnot2s	%f29,	%f11
	set	0x70, %o4
	stxa	%g5,	[%l7 + %o4] 0x14
loop_2173:
	andncc	%l1,	%i4,	%i2
	srl	%g3,	%g2,	%l5
	lduw	[%l7 + 0x20],	%o7
	nop
	setx	0x58560D398056064D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	xnor	%i0,	%g4,	%l6
	fbule,a	%fcc2,	loop_2174
	fnegs	%f22,	%f16
	fmovrdne	%g6,	%f22,	%f24
	tvs	%xcc,	0x0
loop_2174:
	edge8ln	%l0,	%g7,	%i5
	movge	%xcc,	%o5,	%l3
	te	%xcc,	0x5
	te	%xcc,	0x4
	tgu	%icc,	0x1
	mulscc	%o0,	%o2,	%o6
	alignaddrl	%l2,	%o1,	%i1
	andncc	%g1,	%i7,	%i6
	alignaddr	%o3,	%o4,	%l4
	fmovsle	%xcc,	%f13,	%f3
	fbuge	%fcc1,	loop_2175
	tcc	%xcc,	0x1
	nop
	setx	loop_2176,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%i3,	0x06F3,	%l1
loop_2175:
	fmovrsgz	%g5,	%f18,	%f26
	mulx	%i2,	0x0B16,	%i4
loop_2176:
	fmovrdgez	%g3,	%f2,	%f26
	movne	%icc,	%l5,	%o7
	fpack32	%f4,	%f18,	%f30
	fand	%f20,	%f28,	%f4
	wr	%g0,	0x10,	%asi
	stba	%g2,	[%l7 + 0x0A] %asi
	tneg	%icc,	0x2
	srl	%g4,	0x0D,	%i0
	fbl	%fcc3,	loop_2177
	sllx	%g6,	0x05,	%l0
	array32	%g7,	%i5,	%o5
	stbar
loop_2177:
	sub	%l6,	0x1AFF,	%o0
	array8	%l3,	%o2,	%o6
	andcc	%l2,	%o1,	%g1
	srax	%i7,	0x0F,	%i1
	sllx	%o3,	%o4,	%i6
	ldsb	[%l7 + 0x79],	%l4
	fxor	%f16,	%f20,	%f20
	ta	%icc,	0x5
	bshuffle	%f18,	%f16,	%f20
	edge8n	%i3,	%g5,	%l1
	movn	%xcc,	%i2,	%g3
	bg	%xcc,	loop_2178
	movleu	%icc,	%l5,	%o7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%g4
loop_2178:
	fbne,a	%fcc3,	loop_2179
	tsubcctv	%g2,	%i0,	%g6
	sllx	%g7,	%i5,	%l0
	fsrc1s	%f15,	%f19
loop_2179:
	edge16l	%l6,	%o5,	%o0
	tle	%icc,	0x4
	set	0x70, %l6
	lda	[%l7 + %l6] 0x14,	%f4
	movle	%xcc,	%o2,	%l3
	xnorcc	%l2,	0x16A8,	%o1
	fornot2	%f26,	%f24,	%f14
	fbuge,a	%fcc2,	loop_2180
	umul	%g1,	0x13DA,	%o6
	tcc	%icc,	0x4
	movn	%icc,	%i1,	%o3
loop_2180:
	srax	%i7,	%o4,	%i6
	orcc	%l4,	%g5,	%l1
	nop
	setx	0xEC8693B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f24
	sra	%i3,	%i2,	%g3
	fcmpne16	%f22,	%f22,	%l5
	nop
	fitos	%f12,	%f2
	fstoi	%f2,	%f25
	tneg	%xcc,	0x5
	movle	%xcc,	%i4,	%o7
	tcc	%icc,	0x6
	movvc	%icc,	%g4,	%g2
	fsrc1s	%f8,	%f30
	orcc	%i0,	0x18E6,	%g6
	wr	%g0,	0x80,	%asi
	stba	%i5,	[%l7 + 0x71] %asi
	ldsh	[%l7 + 0x1E],	%g7
	fba,a	%fcc3,	loop_2181
	fnot1	%f26,	%f30
	fmovdn	%xcc,	%f3,	%f8
	fandnot1s	%f16,	%f5,	%f24
loop_2181:
	movcc	%icc,	%l0,	%l6
	ba,pn	%icc,	loop_2182
	bcc,a	loop_2183
	movre	%o0,	0x22B,	%o5
	fmovscc	%icc,	%f28,	%f3
loop_2182:
	bg,a,pn	%xcc,	loop_2184
loop_2183:
	subcc	%l3,	%o2,	%o1
	fbue	%fcc2,	loop_2185
	fmovrsne	%g1,	%f15,	%f10
loop_2184:
	andncc	%l2,	%i1,	%o6
	srl	%o3,	0x1F,	%i7
loop_2185:
	ld	[%l7 + 0x30],	%f17
	fbn,a	%fcc1,	loop_2186
	stw	%i6,	[%l7 + 0x54]
	edge16ln	%l4,	%g5,	%l1
	movrne	%i3,	%o4,	%i2
loop_2186:
	andcc	%l5,	%i4,	%o7
	lduw	[%l7 + 0x48],	%g4
	movg	%xcc,	%g2,	%i0
	umul	%g6,	%i5,	%g3
	move	%xcc,	%l0,	%l6
	subc	%g7,	0x09CB,	%o0
	membar	0x12
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x34] %asi,	%o5
	set	0x11, %o5
	lduba	[%l7 + %o5] 0x88,	%o2
	movre	%l3,	%g1,	%o1
	fpack16	%f28,	%f2
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f30
	subccc	%l2,	0x0DCC,	%i1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x34] %asi,	%o6
	tn	%icc,	0x3
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%f8
	sll	%i7,	0x15,	%o3
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x6C] %asi,	%l4
	nop
	fitod	%f8,	%f10
	fdtoi	%f10,	%f30
	nop
	setx	0xA4E53EE5A52B8C63,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x68CDEE38E2842B6A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f20,	%f2
	sdivx	%i6,	0x0A1D,	%g5
	movrgez	%i3,	%o4,	%l1
	set	0x6B, %o6
	ldsba	[%l7 + %o6] 0x14,	%l5
	andncc	%i4,	%o7,	%i2
	nop
	setx	0xA380BEE9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xA1DF269D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f17,	%f2
	swap	[%l7 + 0x70],	%g4
	srl	%g2,	0x1F,	%i0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x6C] %asi,	%g6
	tgu	%xcc,	0x7
	set	0x3C, %l3
	lduha	[%l7 + %l3] 0x18,	%g3
	be	loop_2187
	addc	%l0,	0x0E1A,	%i5
	nop
	fitod	%f16,	%f20
	array16	%l6,	%g7,	%o5
loop_2187:
	bne,a,pn	%xcc,	loop_2188
	movne	%icc,	%o0,	%o2
	movrgez	%g1,	0x07F,	%l3
	fornot2	%f12,	%f30,	%f2
loop_2188:
	edge32	%o1,	%l2,	%i1
	orn	%i7,	%o6,	%o3
	fmovsa	%icc,	%f21,	%f10
	te	%icc,	0x1
	nop
	setx	loop_2189,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%l4,	%g5,	%i3
	movgu	%icc,	%o4,	%l1
	fornot1s	%f31,	%f6,	%f15
loop_2189:
	bg,pt	%xcc,	loop_2190
	edge8n	%i6,	%l5,	%i4
	fmovsg	%xcc,	%f23,	%f16
	movpos	%icc,	%i2,	%o7
loop_2190:
	array8	%g2,	%i0,	%g6
	bge	loop_2191
	tl	%xcc,	0x1
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
loop_2191:
	tpos	%icc,	0x2
	set	0x58, %l2
	lda	[%l7 + %l2] 0x19,	%f4
	ba,a,pt	%icc,	loop_2192
	movrlez	%g4,	0x144,	%l0
	edge8l	%l6,	%g7,	%o5
	xorcc	%o0,	%i5,	%g1
loop_2192:
	flush	%l7 + 0x18
	array32	%l3,	%o2,	%o1
	andcc	%i1,	%i7,	%l2
	udiv	%o3,	0x0D64,	%o6
	fcmpne16	%f6,	%f16,	%l4
	ldd	[%l7 + 0x78],	%i2
	taddcc	%g5,	%o4,	%i6
	fandnot1s	%f15,	%f19,	%f22
	orn	%l5,	%i4,	%i2
	tneg	%xcc,	0x4
	bcc,pt	%xcc,	loop_2193
	fnot1	%f22,	%f20
	movne	%xcc,	%l1,	%g2
	umul	%i0,	%o7,	%g6
loop_2193:
	ldd	[%l7 + 0x28],	%g2
	tgu	%icc,	0x7
	movrlez	%l0,	%l6,	%g4
	movre	%g7,	0x183,	%o5
	set	0x7A, %o7
	lduha	[%l7 + %o7] 0x89,	%o0
	bneg,a	loop_2194
	addc	%g1,	0x00D3,	%i5
	orn	%o2,	%l3,	%i1
	bne,a	%icc,	loop_2195
loop_2194:
	ba,a	%xcc,	loop_2196
	bpos,pn	%icc,	loop_2197
	nop
	setx	0x6CE6C2742F9AEC2F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x4B9348BF26D349CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f4,	%f14
loop_2195:
	orcc	%i7,	%o1,	%o3
loop_2196:
	edge32n	%o6,	%l2,	%i3
loop_2197:
	udivcc	%l4,	0x0389,	%g5
	add	%o4,	0x0FD5,	%l5
	addcc	%i4,	0x1D3B,	%i6
	xor	%l1,	0x0A63,	%g2
	movg	%icc,	%i0,	%i2
	bleu,a,pt	%xcc,	loop_2198
	edge32n	%g6,	%g3,	%l0
	edge32ln	%o7,	%l6,	%g7
	udivcc	%g4,	0x029C,	%o5
loop_2198:
	movrgz	%o0,	0x344,	%g1
	movle	%icc,	%i5,	%o2
	tneg	%xcc,	0x5
	xnor	%i1,	0x044A,	%i7
	set	0x2C, %g1
	ldswa	[%l7 + %g1] 0x14,	%l3
	wr	%g0,	0x5f,	%asi
	stxa	%o1,	[%g0 + 0x0] %asi
	ld	[%l7 + 0x2C],	%f28
	ldd	[%l7 + 0x50],	%o2
	sra	%l2,	0x0A,	%o6
	tle	%xcc,	0x7
	tpos	%xcc,	0x2
	udiv	%l4,	0x1807,	%g5
	xnorcc	%o4,	%i3,	%l5
	srl	%i6,	0x08,	%i4
	fxnors	%f16,	%f12,	%f4
	nop
	setx	loop_2199,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%l1,	%g2,	%i2
	movn	%xcc,	%i0,	%g3
	fmovdneg	%icc,	%f29,	%f15
loop_2199:
	udivx	%l0,	0x18BA,	%g6
	movleu	%icc,	%o7,	%l6
	sll	%g7,	%o5,	%g4
	fmul8ulx16	%f4,	%f24,	%f2
	te	%xcc,	0x6
	nop
	setx	0x7D71540AC04A8BCB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	ta	%xcc,	0x4
	umulcc	%o0,	0x0A11,	%i5
	be,a	loop_2200
	xnorcc	%g1,	0x066B,	%i1
	array8	%i7,	%o2,	%o1
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x27,	%o2
loop_2200:
	popc	%l2,	%o6
	umulcc	%l3,	%g5,	%l4
	taddcc	%o4,	%l5,	%i3
	movcs	%icc,	%i4,	%i6
	fpsub32	%f18,	%f28,	%f18
	tsubcctv	%l1,	%g2,	%i0
	smulcc	%i2,	%l0,	%g6
	movl	%xcc,	%o7,	%g3
	movrne	%l6,	0x3C3,	%g7
	movn	%icc,	%o5,	%g4
	tvc	%icc,	0x0
	udivx	%i5,	0x152C,	%g1
	fnot2	%f12,	%f16
	tl	%xcc,	0x7
	sdivx	%o0,	0x102D,	%i1
	taddcctv	%o2,	0x1F41,	%o1
	movrlz	%o3,	0x08B,	%l2
	fmul8ulx16	%f0,	%f6,	%f16
	array16	%i7,	%o6,	%g5
	sdiv	%l4,	0x0EC9,	%o4
	tge	%xcc,	0x6
	fpadd32	%f6,	%f26,	%f2
	subcc	%l3,	0x1776,	%l5
	edge32l	%i4,	%i3,	%i6
	orncc	%l1,	0x1720,	%i0
	fmovrslz	%i2,	%f17,	%f4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x24] %asi,	%l0
	brgez	%g2,	loop_2201
	sll	%g6,	0x01,	%g3
	xorcc	%l6,	0x09B3,	%g7
	sth	%o5,	[%l7 + 0x18]
loop_2201:
	udiv	%g4,	0x0234,	%o7
	edge8n	%g1,	%o0,	%i5
	te	%icc,	0x6
	brz	%i1,	loop_2202
	fmovrsgez	%o2,	%f17,	%f9
	movge	%icc,	%o3,	%l2
	movrlz	%i7,	%o6,	%g5
loop_2202:
	brlz	%o1,	loop_2203
	andcc	%o4,	0x044B,	%l4
	sll	%l5,	0x17,	%l3
	sub	%i3,	0x054F,	%i6
loop_2203:
	fmovsl	%xcc,	%f1,	%f28
	edge16n	%l1,	%i4,	%i0
	fmovrdgez	%i2,	%f26,	%f28
	movpos	%xcc,	%g2,	%g6
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f26
	andcc	%l0,	%g3,	%g7
	fmovrdlz	%l6,	%f26,	%f22
	movcs	%xcc,	%o5,	%g4
	tle	%icc,	0x1
	fandnot1	%f2,	%f28,	%f6
	fmovsneg	%icc,	%f5,	%f24
	udiv	%o7,	0x15BA,	%g1
	umulcc	%o0,	%i5,	%i1
	wr	%g0,	0x19,	%asi
	stba	%o3,	[%l7 + 0x1A] %asi
	srl	%l2,	0x11,	%i7
	ldd	[%l7 + 0x30],	%o6
	fcmple16	%f22,	%f4,	%g5
	add	%o1,	%o4,	%o2
	movneg	%xcc,	%l4,	%l5
	smulcc	%i3,	0x1F97,	%i6
	tsubcctv	%l3,	%l1,	%i4
	fbug	%fcc3,	loop_2204
	std	%f12,	[%l7 + 0x28]
	fandnot2s	%f25,	%f8,	%f1
	add	%i2,	%g2,	%i0
loop_2204:
	nop
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x70] %asi,	%f27
	fmovscs	%icc,	%f11,	%f16
	bge,a,pn	%xcc,	loop_2205
	fmovspos	%icc,	%f27,	%f10
	taddcc	%g6,	%g3,	%l0
	bvs,a,pn	%xcc,	loop_2206
loop_2205:
	std	%f12,	[%l7 + 0x60]
	fmovdge	%icc,	%f20,	%f11
	xorcc	%g7,	0x1D41,	%l6
loop_2206:
	popc	%g4,	%o5
	tsubcc	%o7,	0x10C4,	%g1
	udiv	%o0,	0x1D06,	%i1
	andn	%i5,	%l2,	%i7
	tsubcctv	%o6,	0x037C,	%o3
	fbug,a	%fcc1,	loop_2207
	array32	%o1,	%g5,	%o4
	movne	%icc,	%l4,	%o2
	wr	%g0,	0x81,	%asi
	sta	%f2,	[%l7 + 0x64] %asi
loop_2207:
	mulx	%i3,	%l5,	%i6
	nop
	fitos	%f7,	%f10
	fstox	%f10,	%f28
	edge8ln	%l3,	%i4,	%i2
	tpos	%xcc,	0x2
	fbu,a	%fcc3,	loop_2208
	fble,a	%fcc2,	loop_2209
	movg	%icc,	%g2,	%l1
	fmovs	%f7,	%f4
loop_2208:
	tl	%icc,	0x3
loop_2209:
	tvs	%xcc,	0x7
	movle	%icc,	%g6,	%g3
	ldd	[%l7 + 0x30],	%f30
	fcmple32	%f10,	%f6,	%l0
	fbne,a	%fcc3,	loop_2210
	movrne	%i0,	%g7,	%l6
	tle	%icc,	0x0
	edge8	%o5,	%g4,	%g1
loop_2210:
	tge	%icc,	0x5
	ldstub	[%l7 + 0x47],	%o7
	fbne,a	%fcc0,	loop_2211
	fmovsle	%xcc,	%f22,	%f19
	sdivx	%i1,	0x1BDE,	%i5
	fnot1s	%f30,	%f16
loop_2211:
	fmovdg	%icc,	%f24,	%f19
	fmovdleu	%xcc,	%f26,	%f8
	ldub	[%l7 + 0x5C],	%o0
	bvs,a,pt	%xcc,	loop_2212
	edge32	%l2,	%i7,	%o6
	flush	%l7 + 0x4C
	tleu	%icc,	0x4
loop_2212:
	fmovsn	%xcc,	%f8,	%f3
	subcc	%o3,	%g5,	%o4
	fpadd32s	%f7,	%f10,	%f2
	brgz,a	%o1,	loop_2213
	xnorcc	%l4,	%i3,	%l5
	bg,pn	%xcc,	loop_2214
	nop
	setx	loop_2215,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2213:
	nop
	fitod	%f0,	%f4
	fdtox	%f4,	%f0
	and	%o2,	%i6,	%i4
loop_2214:
	srlx	%l3,	0x0C,	%i2
loop_2215:
	nop
	set	0x34, %i3
	sta	%f13,	[%l7 + %i3] 0x18
	subc	%l1,	%g2,	%g3
	set	0x51, %l1
	stba	%l0,	[%l7 + %l1] 0x22
	membar	#Sync
	fbu,a	%fcc2,	loop_2216
	tpos	%icc,	0x4
	edge16n	%i0,	%g7,	%l6
	tvs	%icc,	0x4
loop_2216:
	fmovde	%icc,	%f29,	%f31
	nop
	setx	0xB5D0A3AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xF3B4FA31,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f2,	%f7
	movneg	%xcc,	%o5,	%g6
	tvs	%icc,	0x1
	popc	%g4,	%g1
	movrgez	%i1,	%o7,	%i5
	udivcc	%o0,	0x046B,	%i7
	edge8	%l2,	%o3,	%g5
	nop
	fitos	%f3,	%f3
	fstoi	%f3,	%f27
	movrlz	%o4,	%o1,	%l4
	tn	%icc,	0x5
	or	%i3,	0x08AF,	%l5
	tleu	%icc,	0x4
	addccc	%o6,	%i6,	%o2
	tcc	%icc,	0x5
	fbn	%fcc0,	loop_2217
	swap	[%l7 + 0x5C],	%i4
	tvc	%xcc,	0x4
	smulcc	%i2,	%l3,	%l1
loop_2217:
	udivcc	%g2,	0x01E7,	%l0
	andncc	%g3,	%g7,	%i0
	fmovsvc	%icc,	%f22,	%f21
	ta	%icc,	0x7
	fbug,a	%fcc2,	loop_2218
	nop
	setx	loop_2219,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdne	%l6,	%f22,	%f18
	tvs	%xcc,	0x4
loop_2218:
	tne	%xcc,	0x4
loop_2219:
	fmovdcs	%icc,	%f1,	%f11
	be,a,pt	%icc,	loop_2220
	movge	%xcc,	%o5,	%g6
	fsrc2s	%f21,	%f17
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x15,	%f16
loop_2220:
	fabsd	%f2,	%f4
	bg	%xcc,	loop_2221
	movrlez	%g1,	%g4,	%o7
	fmovsle	%xcc,	%f7,	%f18
	tsubcctv	%i1,	0x18B1,	%o0
loop_2221:
	movvs	%icc,	%i7,	%l2
	movl	%icc,	%i5,	%o3
	fmul8ulx16	%f4,	%f18,	%f0
	tne	%icc,	0x1
	bneg	%icc,	loop_2222
	nop
	setx	0x086A037CCD335E8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x1643AF17878165E3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f2,	%f28
	nop
	fitos	%f1,	%f19
	fstod	%f19,	%f20
	te	%icc,	0x1
loop_2222:
	fzeros	%f29
	tgu	%xcc,	0x2
	movrgz	%o4,	%o1,	%l4
	movle	%icc,	%i3,	%g5
	fnand	%f30,	%f16,	%f4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l5,	%i6
	addc	%o6,	0x19CD,	%o2
	sllx	%i4,	%l3,	%l1
	sdivx	%g2,	0x0519,	%l0
	xorcc	%g3,	0x1E1E,	%g7
	smulcc	%i0,	%i2,	%l6
	orncc	%g6,	%g1,	%g4
	fbge,a	%fcc2,	loop_2223
	bleu,a	loop_2224
	taddcc	%o5,	0x1AD0,	%o7
	st	%f1,	[%l7 + 0x78]
loop_2223:
	tvc	%icc,	0x7
loop_2224:
	subccc	%i1,	0x0ACE,	%i7
	bge,pt	%xcc,	loop_2225
	tl	%xcc,	0x3
	addcc	%o0,	0x1D67,	%l2
	udivcc	%i5,	0x1520,	%o4
loop_2225:
	fmovdn	%xcc,	%f21,	%f9
	fmovrdlez	%o3,	%f10,	%f24
	tsubcc	%l4,	0x03BE,	%i3
	tvc	%icc,	0x2
	te	%xcc,	0x5
	tle	%icc,	0x6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x60] %asi,	%g5
	fba,a	%fcc2,	loop_2226
	fbl,a	%fcc1,	loop_2227
	movne	%icc,	%l5,	%i6
	srl	%o1,	0x11,	%o6
loop_2226:
	movn	%xcc,	%i4,	%l3
loop_2227:
	tn	%icc,	0x2
	bne,pt	%xcc,	loop_2228
	movleu	%icc,	%l1,	%o2
	fexpand	%f9,	%f20
	edge32n	%g2,	%g3,	%g7
loop_2228:
	orcc	%i0,	0x117F,	%i2
	fpsub16s	%f9,	%f7,	%f5
	ldsh	[%l7 + 0x22],	%l6
	set	0x28, %g2
	lduha	[%l7 + %g2] 0x81,	%l0
	and	%g6,	0x1666,	%g4
	std	%f26,	[%l7 + 0x30]
	fbg	%fcc1,	loop_2229
	fbl,a	%fcc2,	loop_2230
	fbul,a	%fcc3,	loop_2231
	movne	%icc,	%o5,	%g1
loop_2229:
	taddcc	%o7,	%i1,	%o0
loop_2230:
	fbo,a	%fcc1,	loop_2232
loop_2231:
	array8	%l2,	%i7,	%i5
	call	loop_2233
	fmovrdne	%o4,	%f20,	%f2
loop_2232:
	lduw	[%l7 + 0x28],	%o3
	addc	%l4,	%i3,	%l5
loop_2233:
	fand	%f24,	%f22,	%f4
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x68] %asi,	%g5
	fmovdl	%icc,	%f31,	%f2
	orn	%i6,	0x0972,	%o6
	sir	0x00C0
	edge32n	%i4,	%l3,	%o1
	membar	0x12
	movpos	%icc,	%o2,	%g2
	array32	%l1,	%g7,	%g3
	alignaddr	%i0,	%i2,	%l6
	orn	%g6,	0x163B,	%l0
	pdist	%f16,	%f6,	%f6
	tge	%icc,	0x5
	tneg	%xcc,	0x3
	orncc	%g4,	%g1,	%o7
	sdivcc	%i1,	0x0A08,	%o0
	udivx	%o5,	0x0217,	%i7
	umulcc	%i5,	%l2,	%o4
	fmul8x16au	%f20,	%f29,	%f30
	tg	%xcc,	0x7
	membar	0x7D
	fbn	%fcc1,	loop_2234
	edge8ln	%l4,	%i3,	%o3
	fbn,a	%fcc2,	loop_2235
	edge32ln	%g5,	%i6,	%l5
loop_2234:
	fcmpeq16	%f18,	%f0,	%i4
	array8	%o6,	%l3,	%o2
loop_2235:
	fnors	%f16,	%f0,	%f7
	be	%xcc,	loop_2236
	fsrc2	%f10,	%f14
	fmovrslz	%g2,	%f11,	%f26
	movn	%icc,	%o1,	%g7
loop_2236:
	fmovrslz	%g3,	%f13,	%f27
	edge8n	%i0,	%i2,	%l1
	tpos	%xcc,	0x7
	stx	%l6,	[%l7 + 0x58]
	movle	%xcc,	%l0,	%g6
	fbn,a	%fcc1,	loop_2237
	addccc	%g1,	0x008A,	%g4
	edge32ln	%i1,	%o0,	%o7
	orcc	%o5,	0x12A4,	%i7
loop_2237:
	srlx	%i5,	0x09,	%l2
	fandnot2s	%f26,	%f17,	%f20
	fsrc1s	%f26,	%f22
	edge32ln	%o4,	%i3,	%l4
	ba	%icc,	loop_2238
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o3,	%g5
	udivcc	%l5,	0x0FA2,	%i4
loop_2238:
	sir	0x1A61
	bvc,a,pn	%xcc,	loop_2239
	fmovsgu	%icc,	%f15,	%f4
	sir	0x15C7
	or	%i6,	%o6,	%o2
loop_2239:
	fabss	%f21,	%f29
	pdist	%f30,	%f30,	%f18
	tneg	%icc,	0x6
	nop
	setx loop_2240, %l0, %l1
	jmpl %l1, %g2
	xnor	%l3,	0x0FAA,	%g7
	fmovdpos	%icc,	%f6,	%f9
	fblg	%fcc0,	loop_2241
loop_2240:
	tcs	%xcc,	0x2
	fmovs	%f8,	%f5
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x18,	%f16
loop_2241:
	fmovrsne	%o1,	%f23,	%f11
	tvc	%xcc,	0x4
	brlez,a	%g3,	loop_2242
	bneg,a	loop_2243
	brlz	%i0,	loop_2244
	fcmple32	%f22,	%f6,	%i2
loop_2242:
	udivx	%l6,	0x006A,	%l0
loop_2243:
	fandnot2s	%f15,	%f29,	%f17
loop_2244:
	movcs	%icc,	%g6,	%l1
	fmovdvs	%xcc,	%f11,	%f3
	set	0x1A, %o3
	ldstuba	[%l7 + %o3] 0x89,	%g1
	fcmple32	%f28,	%f20,	%i1
	tvc	%icc,	0x4
	or	%g4,	0x03AC,	%o7
	fmovdl	%xcc,	%f30,	%f8
	movrgez	%o5,	0x1A1,	%i7
	set	0x70, %g7
	swapa	[%l7 + %g7] 0x80,	%i5
	subc	%l2,	%o4,	%o0
	set	0x6C, %i6
	ldswa	[%l7 + %i6] 0x15,	%i3
	tcc	%icc,	0x0
	tne	%xcc,	0x2
	edge16	%o3,	%l4,	%g5
	set	0x18, %i0
	prefetcha	[%l7 + %i0] 0x19,	 0x0
	bl,pn	%icc,	loop_2245
	movge	%xcc,	%i6,	%o6
	sdivx	%l5,	0x0F4D,	%g2
	ble,a,pt	%icc,	loop_2246
loop_2245:
	array32	%l3,	%o2,	%o1
	tsubcctv	%g3,	%i0,	%g7
	mova	%icc,	%i2,	%l6
loop_2246:
	tcc	%icc,	0x3
	ldstub	[%l7 + 0x56],	%g6
	edge16l	%l1,	%g1,	%i1
	movrgez	%l0,	%o7,	%o5
	set	0x7E, %i4
	ldsha	[%l7 + %i4] 0x14,	%i7
	fba	%fcc3,	loop_2247
	subc	%g4,	0x0241,	%i5
	fmul8x16	%f7,	%f20,	%f30
	taddcctv	%o4,	0x1739,	%o0
loop_2247:
	taddcctv	%l2,	0x00A5,	%o3
	lduw	[%l7 + 0x44],	%i3
	edge16l	%g5,	%l4,	%i6
	fexpand	%f10,	%f6
	orn	%i4,	%o6,	%g2
	srax	%l3,	%o2,	%l5
	fmovdpos	%xcc,	%f13,	%f28
	and	%g3,	%i0,	%g7
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f20
	fxtod	%f20,	%f10
	fsrc2	%f4,	%f2
	edge8l	%i2,	%l6,	%g6
	edge32	%l1,	%o1,	%i1
	ld	[%l7 + 0x3C],	%f20
	fmovrdgez	%l0,	%f16,	%f0
	prefetch	[%l7 + 0x64],	 0x3
	tcc	%icc,	0x3
	array32	%o7,	%g1,	%o5
	bn,a,pt	%xcc,	loop_2248
	movvc	%icc,	%g4,	%i5
	udivcc	%i7,	0x1F94,	%o0
	bcs,a	loop_2249
loop_2248:
	fblg,a	%fcc2,	loop_2250
	fmovsg	%xcc,	%f18,	%f25
	array32	%o4,	%l2,	%i3
loop_2249:
	stw	%g5,	[%l7 + 0x2C]
loop_2250:
	tcs	%icc,	0x5
	te	%icc,	0x3
	umulcc	%o3,	%l4,	%i4
	tl	%icc,	0x3
	andcc	%o6,	0x0C8E,	%g2
	fmovdge	%icc,	%f9,	%f6
	set	0x0C, %o2
	sta	%f22,	[%l7 + %o2] 0x0c
	fbu	%fcc2,	loop_2251
	te	%xcc,	0x4
	xorcc	%l3,	0x1719,	%i6
	addccc	%o2,	%l5,	%i0
loop_2251:
	edge32n	%g3,	%g7,	%i2
	addc	%g6,	%l6,	%l1
	sra	%i1,	%o1,	%o7
	fmovdvc	%icc,	%f23,	%f26
	movn	%icc,	%l0,	%g1
	nop
	setx	loop_2252,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%o5,	%g4,	%i7
	popc	%o0,	%i5
	bleu,pt	%xcc,	loop_2253
loop_2252:
	edge32ln	%o4,	%l2,	%g5
	fsrc1	%f10,	%f16
	udivcc	%i3,	0x1B14,	%o3
loop_2253:
	fmovsvs	%icc,	%f4,	%f1
	orcc	%l4,	%o6,	%i4
	xorcc	%l3,	%i6,	%o2
	movrlez	%g2,	0x1E4,	%l5
	movvs	%xcc,	%g3,	%g7
	sllx	%i0,	%g6,	%l6
	bg,a,pn	%icc,	loop_2254
	fbo	%fcc2,	loop_2255
	fnor	%f26,	%f30,	%f26
	edge8	%i2,	%i1,	%l1
loop_2254:
	brlz,a	%o7,	loop_2256
loop_2255:
	move	%icc,	%o1,	%l0
	array32	%o5,	%g1,	%i7
	sir	0x0BA8
loop_2256:
	sub	%g4,	0x1EF7,	%i5
	nop
	setx	0xE393DB33F07765C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fmovdge	%icc,	%f25,	%f16
	xnor	%o4,	%o0,	%l2
	array32	%g5,	%i3,	%l4
	edge8l	%o3,	%i4,	%o6
	tleu	%icc,	0x2
	sub	%i6,	%o2,	%g2
	movneg	%icc,	%l3,	%l5
	edge16ln	%g3,	%g7,	%i0
	fnor	%f26,	%f2,	%f30
	movpos	%xcc,	%g6,	%i2
	movre	%l6,	0x3B2,	%l1
	tn	%xcc,	0x4
	subccc	%o7,	%i1,	%o1
	edge32l	%l0,	%o5,	%i7
	addcc	%g4,	%i5,	%o4
	tcc	%xcc,	0x7
	tvs	%icc,	0x5
	fba	%fcc3,	loop_2257
	fbl,a	%fcc0,	loop_2258
	udiv	%o0,	0x0A95,	%g1
	fpmerge	%f18,	%f25,	%f16
loop_2257:
	movne	%icc,	%g5,	%l2
loop_2258:
	andncc	%i3,	%l4,	%o3
	add	%o6,	0x092F,	%i6
	xnor	%i4,	0x0B47,	%o2
	fbg,a	%fcc1,	loop_2259
	fble,a	%fcc0,	loop_2260
	fnot2	%f12,	%f12
	ldd	[%l7 + 0x20],	%f30
loop_2259:
	bvs	%icc,	loop_2261
loop_2260:
	movneg	%icc,	%g2,	%l5
	smul	%g3,	0x129C,	%l3
	movn	%icc,	%g7,	%i0
loop_2261:
	movn	%icc,	%g6,	%l6
	fsrc1s	%f28,	%f3
	membar	0x36
	edge16ln	%l1,	%o7,	%i2
	sethi	0x1FDC,	%o1
	edge8	%i1,	%o5,	%l0
	and	%g4,	0x075F,	%i7
	fmul8x16au	%f12,	%f29,	%f24
	addc	%o4,	0x06D5,	%i5
	membar	0x61
	movvc	%icc,	%o0,	%g1
	fors	%f8,	%f24,	%f29
	stbar
	tle	%icc,	0x7
	fmovsl	%xcc,	%f28,	%f9
	tvc	%icc,	0x6
	fmovdcc	%icc,	%f23,	%f16
	fmovdneg	%icc,	%f8,	%f16
	set	0x1E, %l5
	lduha	[%l7 + %l5] 0x80,	%g5
	sll	%i3,	%l2,	%o3
	fandnot2	%f0,	%f6,	%f6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o6,	%i6
	tcc	%icc,	0x5
	edge16ln	%l4,	%o2,	%g2
	bgu,a	%xcc,	loop_2262
	stx	%i4,	[%l7 + 0x20]
	wr	%g0,	0x89,	%asi
	stxa	%g3,	[%l7 + 0x20] %asi
loop_2262:
	nop
	set	0x70, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0x0
	bg,a,pt	%xcc,	loop_2263
	fbl	%fcc3,	loop_2264
	tle	%xcc,	0x5
	ldsw	[%l7 + 0x40],	%l5
loop_2263:
	movvs	%xcc,	%i0,	%g7
loop_2264:
	fbg,a	%fcc3,	loop_2265
	array8	%g6,	%l1,	%l6
	fmovde	%icc,	%f14,	%f5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%i2,	%o1
loop_2265:
	or	%i1,	%o5,	%l0
	ldstub	[%l7 + 0x3E],	%g4
	movcc	%icc,	%o7,	%i7
	ldub	[%l7 + 0x2D],	%o4
	taddcc	%o0,	0x0496,	%g1
	fpadd32	%f28,	%f16,	%f12
	xnorcc	%i5,	0x064B,	%g5
	edge16ln	%i3,	%l2,	%o3
	sdivx	%i6,	0x01DB,	%o6
	ble,pt	%xcc,	loop_2266
	movpos	%xcc,	%l4,	%g2
	movl	%xcc,	%o2,	%g3
	subcc	%l3,	%i4,	%i0
loop_2266:
	tle	%xcc,	0x7
	brgez	%l5,	loop_2267
	fmul8x16au	%f30,	%f10,	%f18
	fbug	%fcc0,	loop_2268
	brz,a	%g7,	loop_2269
loop_2267:
	tleu	%icc,	0x5
	fbo	%fcc0,	loop_2270
loop_2268:
	orncc	%l1,	%g6,	%i2
loop_2269:
	movneg	%xcc,	%l6,	%o1
	sethi	0x05ED,	%i1
loop_2270:
	xor	%o5,	%l0,	%g4
	movne	%icc,	%i7,	%o4
	fcmple16	%f0,	%f18,	%o0
	subc	%o7,	%i5,	%g5
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	stb	%i3,	[%l7 + 0x7B]
	nop
	fitos	%f1,	%f23
	fstoi	%f23,	%f10
	edge8n	%l2,	%o3,	%i6
	xor	%o6,	%l4,	%g2
	sdiv	%o2,	0x023B,	%g1
	bleu,a	%xcc,	loop_2271
	add	%g3,	0x196E,	%l3
	fble	%fcc1,	loop_2272
	edge32ln	%i0,	%i4,	%g7
loop_2271:
	and	%l5,	%g6,	%i2
	ldd	[%l7 + 0x78],	%f28
loop_2272:
	movre	%l6,	%l1,	%o1
	udivx	%i1,	0x1EA9,	%l0
	taddcctv	%g4,	0x0B49,	%o5
	tl	%icc,	0x3
	set	0x20, %i2
	ldda	[%l7 + %i2] 0xe2,	%o4
	sdivx	%o0,	0x0B00,	%i7
	fnors	%f2,	%f31,	%f13
	fble,a	%fcc3,	loop_2273
	edge16l	%o7,	%i5,	%g5
	st	%f16,	[%l7 + 0x6C]
	fmovde	%icc,	%f13,	%f17
loop_2273:
	fmovdcs	%icc,	%f11,	%f26
	set	0x30, %o0
	ldswa	[%l7 + %o0] 0x04,	%l2
	brlz	%o3,	loop_2274
	fxnors	%f11,	%f8,	%f30
	brlz	%i3,	loop_2275
	andn	%o6,	%i6,	%l4
loop_2274:
	taddcctv	%g2,	0x028E,	%g1
	fone	%f12
loop_2275:
	edge16l	%o2,	%g3,	%l3
	movrlz	%i0,	0x077,	%i4
	movpos	%xcc,	%l5,	%g7
	fmovrslez	%i2,	%f11,	%f18
	movrlz	%l6,	0x01B,	%g6
	movcs	%icc,	%l1,	%o1
	movneg	%xcc,	%i1,	%l0
	tl	%xcc,	0x5
	fmovrdne	%o5,	%f10,	%f12
	edge32	%g4,	%o0,	%o4
	brgez	%o7,	loop_2276
	edge8l	%i7,	%i5,	%l2
	set	0x30, %l4
	ldda	[%l7 + %l4] 0x22,	%g4
loop_2276:
	edge16	%o3,	%i3,	%i6
	edge32n	%o6,	%l4,	%g2
	movleu	%icc,	%o2,	%g3
	movpos	%icc,	%l3,	%i0
	bl,a,pt	%xcc,	loop_2277
	fpadd32	%f24,	%f28,	%f24
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f30
	fmovse	%xcc,	%f17,	%f6
loop_2277:
	te	%xcc,	0x7
	movvc	%icc,	%i4,	%g1
	sdivx	%l5,	0x1A91,	%i2
	tleu	%icc,	0x6
	nop
	setx	loop_2278,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%l6,	0x143E,	%g7
	tgu	%xcc,	0x0
	fbul,a	%fcc1,	loop_2279
loop_2278:
	addcc	%l1,	0x032F,	%o1
	fmovrdne	%g6,	%f22,	%f18
	udivcc	%i1,	0x1B4B,	%l0
loop_2279:
	movn	%icc,	%o5,	%g4
	tge	%xcc,	0x3
	fbo,a	%fcc2,	loop_2280
	array32	%o0,	%o4,	%i7
	fmovdvs	%xcc,	%f26,	%f28
	tneg	%icc,	0x5
loop_2280:
	tvc	%xcc,	0x6
	array16	%o7,	%i5,	%g5
	bvs,a	%xcc,	loop_2281
	edge32l	%o3,	%l2,	%i6
	sdivcc	%o6,	0x0CA2,	%l4
	brlz	%i3,	loop_2282
loop_2281:
	tsubcc	%g2,	%g3,	%l3
	movvs	%icc,	%i0,	%o2
	bg	%xcc,	loop_2283
loop_2282:
	membar	0x66
	bcs,a	%xcc,	loop_2284
	te	%xcc,	0x1
loop_2283:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f22,	[%l7 + 0x14] %asi
loop_2284:
	edge8ln	%i4,	%g1,	%l5
	alignaddrl	%l6,	%g7,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x2
	sll	%i2,	%g6,	%o1
	tgu	%icc,	0x1
	bvc	%xcc,	loop_2285
	fmovrslz	%i1,	%f25,	%f15
	fmovrsne	%l0,	%f22,	%f1
	sir	0x09AC
loop_2285:
	fbue	%fcc0,	loop_2286
	mova	%icc,	%o5,	%o0
	mulscc	%o4,	0x04B9,	%i7
	addc	%o7,	%g4,	%i5
loop_2286:
	subccc	%o3,	%l2,	%i6
	movvc	%xcc,	%o6,	%g5
	tge	%xcc,	0x1
	fbn	%fcc0,	loop_2287
	fxor	%f2,	%f12,	%f30
	nop
	setx	0x00449AB1,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	movn	%xcc,	%l4,	%g2
loop_2287:
	edge32n	%g3,	%l3,	%i0
	stbar
	bcs,pt	%icc,	loop_2288
	movrne	%i3,	%o2,	%i4
	udivcc	%g1,	0x0511,	%l6
	te	%icc,	0x3
loop_2288:
	mova	%icc,	%l5,	%l1
	movcc	%icc,	%g7,	%i2
	prefetch	[%l7 + 0x08],	 0x3
	fcmpgt16	%f22,	%f16,	%g6
	fpsub32s	%f25,	%f26,	%f13
	subc	%o1,	%l0,	%o5
	fnot1	%f8,	%f30
	movrlez	%o0,	0x15D,	%i1
	nop
	fitos	%f0,	%f23
	fstoi	%f23,	%f9
	subccc	%i7,	%o7,	%o4
	and	%g4,	0x0E46,	%o3
	ble,a,pt	%xcc,	loop_2289
	fnot1	%f0,	%f26
	fbn,a	%fcc2,	loop_2290
	sub	%i5,	0x0EE8,	%i6
loop_2289:
	movvs	%xcc,	%l2,	%g5
	nop
	fitod	%f10,	%f2
	fdtoi	%f2,	%f27
loop_2290:
	nop
	setx	0x0CD024B34050A49A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fnot1s	%f9,	%f2
	fornot1	%f12,	%f14,	%f8
	fpadd16s	%f12,	%f12,	%f24
	umulcc	%l4,	0x06D4,	%o6
	fnor	%f22,	%f12,	%f0
	movrlez	%g2,	%l3,	%i0
	taddcctv	%i3,	0x0BB7,	%g3
	bgu	loop_2291
	movle	%icc,	%o2,	%i4
	tpos	%icc,	0x2
	movgu	%icc,	%g1,	%l6
loop_2291:
	fbg	%fcc1,	loop_2292
	nop
	setx	loop_2293,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%icc,	%l1,	%g7
	fbn	%fcc0,	loop_2294
loop_2292:
	bneg,a	%icc,	loop_2295
loop_2293:
	orncc	%i2,	0x1A03,	%l5
	tpos	%xcc,	0x5
loop_2294:
	addccc	%o1,	0x10AE,	%l0
loop_2295:
	ldub	[%l7 + 0x53],	%o5
	movrlez	%o0,	0x000,	%g6
	bcc,a,pn	%xcc,	loop_2296
	array16	%i1,	%i7,	%o7
	movrgz	%g4,	%o3,	%i5
	fbne	%fcc1,	loop_2297
loop_2296:
	sth	%o4,	[%l7 + 0x0A]
	orn	%i6,	%g5,	%l2
	fcmpgt32	%f2,	%f14,	%l4
loop_2297:
	edge32l	%o6,	%g2,	%l3
	movrlz	%i0,	0x1D0,	%g3
	edge16l	%i3,	%i4,	%o2
	tvs	%xcc,	0x5
	movrlez	%g1,	0x3A6,	%l1
	flush	%l7 + 0x58
	array32	%g7,	%l6,	%l5
	tle	%icc,	0x2
	bneg,pt	%icc,	loop_2298
	fpack16	%f28,	%f8
	edge8n	%o1,	%l0,	%o5
	fba	%fcc2,	loop_2299
loop_2298:
	bpos,a	%xcc,	loop_2300
	fmovs	%f27,	%f6
	edge16n	%i2,	%o0,	%g6
loop_2299:
	movneg	%icc,	%i1,	%o7
loop_2300:
	edge8ln	%g4,	%i7,	%i5
	stb	%o4,	[%l7 + 0x3D]
	fnot2s	%f8,	%f12
	tsubcctv	%i6,	%g5,	%o3
	fxnors	%f25,	%f22,	%f20
	udivcc	%l2,	0x05BB,	%o6
	tne	%icc,	0x0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x0E] %asi,	%l4
	movvc	%xcc,	%l3,	%i0
	nop
	setx	0xCBA5EC7FAE684C1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f20
	movvs	%icc,	%g2,	%i3
	orncc	%g3,	0x1644,	%i4
	fpmerge	%f31,	%f22,	%f4
	movrgz	%o2,	0x1A9,	%l1
	smulcc	%g7,	%g1,	%l6
	ldsw	[%l7 + 0x70],	%o1
	tsubcc	%l5,	0x1CB8,	%o5
	fsrc1s	%f8,	%f5
	nop
	set	0x18, %l0
	std	%f4,	[%l7 + %l0]
	udivx	%l0,	0x0DFB,	%i2
	fornot2	%f30,	%f30,	%f0
	bvc,a	%xcc,	loop_2301
	nop
	setx	0xADD7D1BA7E2A253D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f6
	udivcc	%o0,	0x0557,	%g6
	subc	%o7,	0x01A7,	%g4
loop_2301:
	bleu,pt	%xcc,	loop_2302
	ldstub	[%l7 + 0x60],	%i1
	tneg	%icc,	0x1
	tn	%icc,	0x4
loop_2302:
	bg,a	%icc,	loop_2303
	brlez	%i7,	loop_2304
	stbar
	edge16l	%i5,	%i6,	%o4
loop_2303:
	fand	%f12,	%f14,	%f8
loop_2304:
	sdiv	%g5,	0x1E67,	%l2
	movleu	%xcc,	%o3,	%o6
	tvc	%xcc,	0x4
	movcs	%xcc,	%l4,	%i0
	nop
	fitos	%f8,	%f14
	fstoi	%f14,	%f9
	ld	[%l7 + 0x40],	%f31
	fnand	%f18,	%f20,	%f12
	std	%f18,	[%l7 + 0x50]
	udiv	%l3,	0x1185,	%g2
	set	0x40, %o1
	stwa	%g3,	[%l7 + %o1] 0x15
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
	subccc	%i3,	%l1,	%o2
	set	0x46, %g3
	lduha	[%l7 + %g3] 0x19,	%g7
	fxor	%f14,	%f22,	%f20
	smulcc	%g1,	0x036D,	%o1
	fmul8x16	%f14,	%f16,	%f10
	nop
	fitos	%f0,	%f9
	fstox	%f9,	%f26
	fxtos	%f26,	%f19
	fabsd	%f0,	%f14
	andncc	%l6,	%o5,	%l5
	or	%l0,	%o0,	%g6
	set	0x28, %o4
	lduwa	[%l7 + %o4] 0x15,	%i2
	sethi	0x135B,	%o7
	fnot2s	%f27,	%f15
	orncc	%g4,	0x1528,	%i1
	fbg,a	%fcc0,	loop_2305
	xorcc	%i5,	0x1DFC,	%i7
	mulscc	%o4,	0x1BAE,	%i6
	lduh	[%l7 + 0x28],	%g5
loop_2305:
	array8	%o3,	%o6,	%l4
	or	%l2,	0x0065,	%l3
	fones	%f7
	edge16l	%g2,	%i0,	%g3
	sdivx	%i3,	0x11F1,	%l1
	fpsub16	%f16,	%f16,	%f18
	or	%i4,	%o2,	%g7
	edge32ln	%g1,	%l6,	%o1
	fbg	%fcc3,	loop_2306
	fmovde	%xcc,	%f22,	%f1
	bn,a	loop_2307
	edge32	%l5,	%o5,	%o0
loop_2306:
	smul	%l0,	0x11CB,	%g6
	fbug,a	%fcc1,	loop_2308
loop_2307:
	fbule	%fcc2,	loop_2309
	umulcc	%o7,	%g4,	%i1
	edge16	%i5,	%i2,	%o4
loop_2308:
	fble,a	%fcc1,	loop_2310
loop_2309:
	nop
	setx	0x8EB1DFEAD072BE26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovsge	%xcc,	%f19,	%f28
	fbu,a	%fcc3,	loop_2311
loop_2310:
	udivcc	%i6,	0x0393,	%g5
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x19,	%o2
loop_2311:
	movvc	%xcc,	%o6,	%l4
	movl	%xcc,	%l2,	%l3
	movrne	%i7,	%g2,	%g3
	edge32	%i3,	%l1,	%i0
	fbn	%fcc1,	loop_2312
	tg	%xcc,	0x5
	mulx	%o2,	%i4,	%g1
	movvc	%xcc,	%l6,	%g7
loop_2312:
	fba	%fcc3,	loop_2313
	movrgz	%l5,	0x21F,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x0
loop_2313:
	nop
	fitod	%f2,	%f18
	fdtoi	%f18,	%f29
	tsubcctv	%o1,	0x14EF,	%l0
	movpos	%xcc,	%g6,	%o7
	brz	%g4,	loop_2314
	bl,a	%icc,	loop_2315
	bleu,a,pn	%icc,	loop_2316
	movrne	%o0,	0x31E,	%i5
loop_2314:
	fmovsge	%icc,	%f24,	%f23
loop_2315:
	sdivx	%i2,	0x1100,	%i1
loop_2316:
	brlez	%o4,	loop_2317
	tge	%xcc,	0x3
	ld	[%l7 + 0x28],	%f19
	te	%icc,	0x6
loop_2317:
	faligndata	%f16,	%f14,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0799,	%g5
	fbn	%fcc1,	loop_2318
	tcc	%icc,	0x6
	taddcc	%o3,	0x17D1,	%o6
	tpos	%xcc,	0x0
loop_2318:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2D] %asi,	%l4
	udiv	%i6,	0x1F7E,	%l3
	subc	%l2,	%g2,	%g3
	mulx	%i7,	0x1B14,	%i3
	tsubcctv	%l1,	%i0,	%o2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x59] %asi,	%g1
	fmovsge	%xcc,	%f10,	%f22
	set	0x20, %o5
	stxa	%i4,	[%l7 + %o5] 0x81
	edge8n	%l6,	%g7,	%l5
	udiv	%o1,	0x1007,	%o5
	addc	%l0,	%o7,	%g6
	edge8	%g4,	%i5,	%o0
	set	0x2A, %i5
	stba	%i2,	[%l7 + %i5] 0xe2
	membar	#Sync
	bvs,a	loop_2319
	fmovrsgez	%i1,	%f13,	%f10
	ldsw	[%l7 + 0x7C],	%o4
	fbl,a	%fcc0,	loop_2320
loop_2319:
	movle	%icc,	%g5,	%o3
	addcc	%o6,	0x05EC,	%i6
	fmovrsne	%l3,	%f27,	%f29
loop_2320:
	fmovsne	%icc,	%f1,	%f1
	fones	%f2
	tneg	%xcc,	0x3
	tn	%xcc,	0x1
	edge16l	%l2,	%l4,	%g2
	andncc	%g3,	%i3,	%i7
	fmovde	%icc,	%f13,	%f2
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x15
	nop
	setx	0x0AE982DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x47812B82,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f20,	%f21
	tg	%icc,	0x7
	fba,a	%fcc2,	loop_2321
	fbug,a	%fcc0,	loop_2322
	movle	%xcc,	%l1,	%o2
	brnz	%i0,	loop_2323
loop_2321:
	movrgz	%g1,	0x02A,	%i4
loop_2322:
	fnot2s	%f10,	%f30
	nop
	fitos	%f16,	%f22
loop_2323:
	taddcc	%g7,	0x0899,	%l6
	stbar
	xorcc	%o1,	0x19E8,	%o5
	fbue	%fcc3,	loop_2324
	fmovrsgz	%l5,	%f31,	%f16
	nop
	fitod	%f25,	%f14
	edge32n	%l0,	%o7,	%g6
loop_2324:
	smul	%i5,	%g4,	%o0
	fcmpgt32	%f18,	%f2,	%i1
	fmovrslz	%o4,	%f15,	%f16
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%o3
	orncc	%o6,	0x17F0,	%g5
	brz,a	%i6,	loop_2325
	srax	%l3,	0x07,	%l2
	fbl	%fcc2,	loop_2326
	tcc	%xcc,	0x3
loop_2325:
	tvc	%icc,	0x4
	sub	%g2,	%g3,	%l4
loop_2326:
	mulscc	%i7,	%i3,	%l1
	edge8ln	%i0,	%o2,	%i4
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x78] %asi,	%g7
	movrlz	%g1,	0x26F,	%l6
	or	%o5,	0x0E39,	%o1
	movge	%icc,	%l0,	%l5
	add	%o7,	%g6,	%i5
	movl	%icc,	%o0,	%i1
	movgu	%xcc,	%o4,	%i2
	fabsd	%f12,	%f0
	subccc	%o3,	0x1DEF,	%g4
	fzeros	%f16
	nop
	setx	0x121BD3DEBDE71689,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x6B1045D9D9D44175,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f12,	%f18
	movvc	%xcc,	%o6,	%g5
	movpos	%xcc,	%l3,	%i6
	fba	%fcc0,	loop_2327
	brgz,a	%g2,	loop_2328
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f14
	sub	%l2,	0x0C6F,	%l4
loop_2327:
	andncc	%g3,	%i3,	%l1
loop_2328:
	movcc	%icc,	%i7,	%i0
	edge32l	%o2,	%g7,	%i4
	edge32	%l6,	%o5,	%g1
	bl,a	%icc,	loop_2329
	fmuld8ulx16	%f20,	%f30,	%f28
	fcmpeq32	%f6,	%f6,	%l0
	bpos,pn	%xcc,	loop_2330
loop_2329:
	fbg	%fcc1,	loop_2331
	fbg,a	%fcc2,	loop_2332
	nop
	fitos	%f12,	%f2
	fstox	%f2,	%f16
loop_2330:
	fpadd16s	%f22,	%f25,	%f18
loop_2331:
	st	%f25,	[%l7 + 0x64]
loop_2332:
	nop
	set	0x54, %l3
	lduwa	[%l7 + %l3] 0x0c,	%l5
	xorcc	%o7,	%g6,	%i5
	edge16l	%o1,	%i1,	%o0
	nop
	fitod	%f12,	%f12
	fdtos	%f12,	%f1
	tgu	%xcc,	0x0
	call	loop_2333
	orncc	%i2,	0x1A0C,	%o4
	tcs	%xcc,	0x5
	fmul8ulx16	%f4,	%f4,	%f20
loop_2333:
	fzero	%f20
	wr	%g0,	0xea,	%asi
	stxa	%o3,	[%l7 + 0x70] %asi
	membar	#Sync
	edge16l	%o6,	%g4,	%l3
	prefetch	[%l7 + 0x0C],	 0x1
	umul	%g5,	0x0333,	%i6
	movrgez	%g2,	0x358,	%l2
	srlx	%l4,	%g3,	%l1
	st	%f9,	[%l7 + 0x30]
	ble,a	loop_2334
	alignaddr	%i7,	%i3,	%o2
	sllx	%g7,	0x17,	%i4
	move	%icc,	%i0,	%l6
loop_2334:
	add	%o5,	%l0,	%l5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x28] %asi,	%g1
	tn	%icc,	0x2
	brlez	%g6,	loop_2335
	movcc	%xcc,	%i5,	%o7
	edge32n	%i1,	%o0,	%i2
	fornot2s	%f17,	%f26,	%f14
loop_2335:
	brgz	%o4,	loop_2336
	fnand	%f22,	%f28,	%f2
	nop
	setx loop_2337, %l0, %l1
	jmpl %l1, %o3
	umulcc	%o6,	0x0E76,	%o1
loop_2336:
	movne	%icc,	%g4,	%l3
	edge16ln	%g5,	%i6,	%l2
loop_2337:
	brgez,a	%g2,	loop_2338
	fbue,a	%fcc1,	loop_2339
	ld	[%l7 + 0x18],	%f15
	edge16	%l4,	%l1,	%i7
loop_2338:
	xnorcc	%g3,	0x0E56,	%o2
loop_2339:
	tge	%icc,	0x1
	movrne	%i3,	0x1DA,	%g7
	popc	%i4,	%l6
	edge8	%o5,	%l0,	%i0
	tsubcctv	%l5,	0x1E65,	%g1
	movre	%i5,	0x094,	%o7
	stw	%i1,	[%l7 + 0x44]
	mulx	%o0,	0x1354,	%g6
	tn	%icc,	0x1
	fmovrdlz	%o4,	%f12,	%f20
	brz	%o3,	loop_2340
	fones	%f4
	fmovrslez	%o6,	%f25,	%f3
	movle	%icc,	%o1,	%i2
loop_2340:
	sdivcc	%g4,	0x02F4,	%l3
	fmovdneg	%icc,	%f26,	%f8
	movne	%icc,	%i6,	%l2
	fmovs	%f29,	%f31
	movcc	%xcc,	%g5,	%g2
	movcs	%icc,	%l1,	%i7
	array32	%l4,	%o2,	%g3
	tle	%xcc,	0x3
	edge16	%g7,	%i4,	%i3
	tneg	%icc,	0x0
	alignaddrl	%o5,	%l6,	%l0
	sllx	%i0,	%l5,	%g1
	fsrc1s	%f12,	%f21
	taddcctv	%i5,	%o7,	%o0
	fmul8ulx16	%f24,	%f14,	%f30
	fcmple16	%f16,	%f0,	%i1
	sethi	0x00AC,	%o4
	fmovsle	%icc,	%f12,	%f0
	nop
	setx	0x81219369,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x05BF22CC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f27,	%f24
	nop
	fitod	%f28,	%f18
	set	0x32, %l2
	ldstuba	[%l7 + %l2] 0x10,	%g6
	movcs	%icc,	%o3,	%o1
	fbule,a	%fcc1,	loop_2341
	movle	%icc,	%i2,	%o6
	andncc	%g4,	%l3,	%l2
	fmovdl	%icc,	%f27,	%f17
loop_2341:
	orcc	%g5,	0x0AB8,	%g2
	tcs	%xcc,	0x4
	set	0x28, %o6
	ldxa	[%g0 + %o6] 0x4f,	%i6
	fbul	%fcc1,	loop_2342
	sethi	0x12BC,	%i7
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x11,	 0x0
loop_2342:
	sth	%l1,	[%l7 + 0x60]
	nop
	setx	0xF091320EB406667A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x63911F93BFB6D3AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f22,	%f22
	wr	%g0,	0xe3,	%asi
	stwa	%g3,	[%l7 + 0x34] %asi
	membar	#Sync
	ldstub	[%l7 + 0x3D],	%o2
	edge32ln	%i4,	%i3,	%g7
	subccc	%l6,	0x15D9,	%o5
	tneg	%icc,	0x0
	nop
	setx	0x8657A10390C46E58,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f6
	movge	%xcc,	%l0,	%l5
	movpos	%xcc,	%i0,	%i5
	tneg	%icc,	0x4
	fpadd32	%f2,	%f4,	%f28
	subccc	%g1,	0x0B99,	%o7
	movg	%icc,	%o0,	%o4
	fone	%f14
	nop
	setx	0xBD6EC1F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xE9E53030,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f16,	%f10
	umul	%i1,	0x1FD1,	%o3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x80,	%o1,	%i2
	movrlez	%o6,	0x180,	%g4
	sethi	0x1CB0,	%l3
	movrgz	%l2,	%g6,	%g5
	subc	%i6,	%g2,	%i7
	andncc	%l1,	%g3,	%l4
	fands	%f1,	%f23,	%f1
	edge16l	%i4,	%o2,	%g7
	prefetch	[%l7 + 0x58],	 0x2
	membar	0x3C
	sdiv	%l6,	0x1972,	%o5
	edge16n	%l0,	%l5,	%i0
	and	%i3,	0x11D0,	%i5
	tne	%xcc,	0x5
	xor	%o7,	0x04EF,	%g1
	sllx	%o0,	%o4,	%o3
	bg	loop_2343
	andcc	%o1,	0x03AF,	%i1
	ldd	[%l7 + 0x28],	%f28
	edge16l	%o6,	%g4,	%i2
loop_2343:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l3,	0x1258,	%g6
	nop
	setx	0xCFC5E923097CB4E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x0552F975E1978CD5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f30,	%f26
	fsrc1	%f8,	%f26
	sllx	%g5,	0x02,	%l2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x28] %asi,	%i6
	ldsh	[%l7 + 0x60],	%i7
	edge16n	%g2,	%l1,	%l4
	nop
	fitod	%f12,	%f18
	fdtoi	%f18,	%f19
	ldsh	[%l7 + 0x60],	%g3
	array16	%i4,	%g7,	%o2
	movne	%xcc,	%l6,	%l0
	set	0x10, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0x3
	tpos	%icc,	0x0
	sll	%o5,	%i0,	%i5
	nop
	setx	loop_2344,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduh	[%l7 + 0x2E],	%o7
	fbuge,a	%fcc0,	loop_2345
	popc	%i3,	%g1
loop_2344:
	xnorcc	%o4,	0x1ECC,	%o0
	fcmpgt32	%f16,	%f20,	%o1
loop_2345:
	edge32ln	%i1,	%o3,	%o6
	fmovrdlez	%g4,	%f28,	%f22
	add	%l3,	0x07C5,	%i2
	sdiv	%g5,	0x0F30,	%g6
	brlez	%l2,	loop_2346
	fmovspos	%icc,	%f23,	%f2
	nop
	setx loop_2347, %l0, %l1
	jmpl %l1, %i7
	bn,pn	%icc,	loop_2348
loop_2346:
	subccc	%g2,	0x1BDC,	%l1
	set	0x33, %i3
	ldstuba	[%l7 + %i3] 0x11,	%i6
loop_2347:
	fmovdne	%icc,	%f6,	%f4
loop_2348:
	tl	%icc,	0x5
	umul	%l4,	%g3,	%i4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o2
	edge16l	%g7,	%l6,	%l5
	movpos	%icc,	%l0,	%i0
	srlx	%i5,	%o5,	%o7
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f20
	or	%i3,	%o4,	%o0
	brz,a	%g1,	loop_2349
	sdivcc	%o1,	0x080B,	%o3
	movn	%xcc,	%o6,	%g4
	edge8l	%i1,	%i2,	%l3
loop_2349:
	sir	0x05AF
	tsubcctv	%g5,	0x00ED,	%g6
	fmovsne	%icc,	%f11,	%f19
	stb	%i7,	[%l7 + 0x72]
	fmovdl	%xcc,	%f6,	%f12
	ldsh	[%l7 + 0x3E],	%g2
	fandnot2s	%f13,	%f31,	%f28
	fcmpgt32	%f4,	%f0,	%l1
	brgz,a	%i6,	loop_2350
	nop
	fitod	%f0,	%f26
	fdtoi	%f26,	%f26
	fmovs	%f22,	%f0
	nop
	setx	0xC4E408C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f5
loop_2350:
	std	%f18,	[%l7 + 0x58]
	smul	%l4,	%l2,	%i4
	fbue,a	%fcc1,	loop_2351
	fmovdgu	%icc,	%f24,	%f2
	fpsub16	%f18,	%f10,	%f4
	edge8n	%o2,	%g3,	%l6
loop_2351:
	edge8ln	%l5,	%l0,	%g7
	subccc	%i0,	0x0489,	%o5
	sll	%i5,	0x1F,	%i3
	movrgez	%o4,	0x3FA,	%o7
	addc	%g1,	0x02A1,	%o0
	brnz	%o1,	loop_2352
	fmovrse	%o6,	%f26,	%f24
	edge16n	%o3,	%i1,	%i2
	andcc	%g4,	0x0D50,	%g5
loop_2352:
	xor	%g6,	%i7,	%g2
	sdiv	%l1,	0x0C8F,	%i6
	fcmpgt32	%f28,	%f24,	%l3
	movneg	%icc,	%l2,	%l4
	xorcc	%o2,	0x1F13,	%i4
	orncc	%g3,	0x1B12,	%l5
	xor	%l6,	%l0,	%g7
	tsubcctv	%i0,	%i5,	%i3
	tge	%icc,	0x5
	mova	%icc,	%o5,	%o7
	fmul8sux16	%f10,	%f26,	%f12
	mulx	%g1,	0x11DF,	%o4
	edge32ln	%o1,	%o0,	%o3
	stbar
	nop
	setx	0xF4E3BE2D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f22
	fmovdvc	%xcc,	%f24,	%f15
	fble,a	%fcc0,	loop_2353
	tvc	%xcc,	0x3
	brgz,a	%o6,	loop_2354
	bn,a,pt	%icc,	loop_2355
loop_2353:
	edge8l	%i1,	%i2,	%g5
	fbul,a	%fcc1,	loop_2356
loop_2354:
	tle	%xcc,	0x3
loop_2355:
	tcs	%xcc,	0x3
	movrlz	%g6,	0x06D,	%i7
loop_2356:
	fpsub16s	%f9,	%f28,	%f31
	movneg	%xcc,	%g4,	%g2
	tneg	%icc,	0x4
	array8	%i6,	%l1,	%l3
	fmovse	%xcc,	%f26,	%f0
	bvc,a	loop_2357
	nop
	fitod	%f2,	%f0
	fdtoi	%f0,	%f28
	brnz,a	%l2,	loop_2358
	fones	%f25
loop_2357:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x18] %asi,	%f6
loop_2358:
	movne	%icc,	%o2,	%i4
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x71] %asi,	%l4
	movcc	%xcc,	%l5,	%l6
	sdiv	%g3,	0x1E7C,	%g7
	flush	%l7 + 0x4C
	fpsub16	%f14,	%f4,	%f28
	fmovsleu	%xcc,	%f31,	%f11
	tcs	%xcc,	0x1
	movn	%xcc,	%l0,	%i5
	addc	%i3,	%i0,	%o5
	fmovdne	%icc,	%f13,	%f1
	srlx	%g1,	%o4,	%o7
	fbo	%fcc0,	loop_2359
	edge32ln	%o0,	%o3,	%o6
	fbe	%fcc0,	loop_2360
	fnegd	%f20,	%f8
loop_2359:
	andcc	%o1,	0x0D2A,	%i2
	tsubcctv	%g5,	%i1,	%g6
loop_2360:
	brlz	%i7,	loop_2361
	srlx	%g2,	%i6,	%l1
	sdivx	%g4,	0x06E5,	%l3
	fmovrdgez	%o2,	%f2,	%f28
loop_2361:
	movrgez	%l2,	0x37F,	%l4
	smul	%l5,	0x06E0,	%i4
	sub	%g3,	%g7,	%l0
	fmovsg	%icc,	%f1,	%f30
	sdivcc	%i5,	0x012E,	%l6
	set	0x2C, %g1
	stwa	%i3,	[%l7 + %g1] 0x23
	membar	#Sync
	tneg	%xcc,	0x5
	tsubcc	%o5,	0x0E57,	%i0
	tvs	%icc,	0x0
	fbule,a	%fcc0,	loop_2362
	ble,a,pn	%xcc,	loop_2363
	addc	%g1,	0x03D4,	%o7
	or	%o0,	%o3,	%o4
loop_2362:
	sir	0x069F
loop_2363:
	fmovdn	%icc,	%f25,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f20,	%f18,	%f0
	addcc	%o1,	0x09EB,	%i2
	smul	%g5,	%o6,	%g6
	fmovrdlz	%i7,	%f26,	%f18
	ta	%xcc,	0x1
	fnors	%f13,	%f3,	%f1
	addccc	%g2,	%i1,	%l1
	bne,pt	%icc,	loop_2364
	edge32ln	%g4,	%l3,	%i6
	popc	0x1BEE,	%l2
	pdist	%f24,	%f2,	%f8
loop_2364:
	tvs	%xcc,	0x5
	srl	%l4,	0x0A,	%o2
	andcc	%l5,	%g3,	%g7
	fbge	%fcc2,	loop_2365
	movrlz	%l0,	%i5,	%i4
	lduh	[%l7 + 0x1E],	%i3
	nop
	set	0x44, %g5
	ldsh	[%l7 + %g5],	%o5
loop_2365:
	nop
	setx loop_2366, %l0, %l1
	jmpl %l1, %l6
	move	%xcc,	%g1,	%o7
	sll	%o0,	0x18,	%o3
	fmovdcc	%icc,	%f28,	%f17
loop_2366:
	nop
	set	0x68, %l1
	swapa	[%l7 + %l1] 0x10,	%o4
	fmovs	%f10,	%f30
	tleu	%xcc,	0x7
	popc	%o1,	%i2
	fba,a	%fcc1,	loop_2367
	tge	%icc,	0x4
	ble,a	loop_2368
	srlx	%g5,	0x08,	%o6
loop_2367:
	sdiv	%i0,	0x01A7,	%g6
	sll	%g2,	%i1,	%i7
loop_2368:
	movleu	%xcc,	%l1,	%g4
	bl	%xcc,	loop_2369
	tneg	%icc,	0x6
	lduw	[%l7 + 0x3C],	%l3
	fmovdle	%xcc,	%f14,	%f18
loop_2369:
	fbe,a	%fcc0,	loop_2370
	brz	%i6,	loop_2371
	bgu	loop_2372
	movne	%xcc,	%l2,	%o2
loop_2370:
	movle	%icc,	%l5,	%l4
loop_2371:
	tgu	%xcc,	0x5
loop_2372:
	xnorcc	%g3,	%g7,	%l0
	orcc	%i5,	0x1791,	%i3
	fmovsn	%xcc,	%f10,	%f29
	set	0x50, %i1
	ldda	[%l7 + %i1] 0x0c,	%o4
	bneg,pn	%xcc,	loop_2373
	mulscc	%i4,	0x01EA,	%l6
	tsubcc	%o7,	%o0,	%o3
	fbl,a	%fcc2,	loop_2374
loop_2373:
	alignaddrl	%o4,	%o1,	%i2
	movge	%xcc,	%g1,	%o6
	edge32	%i0,	%g6,	%g2
loop_2374:
	subccc	%i1,	%g5,	%i7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%g4
	fmovdcs	%icc,	%f14,	%f4
	smul	%l3,	0x076B,	%l2
	sll	%o2,	0x09,	%l5
	mulscc	%i6,	%l4,	%g3
	movrlz	%g7,	%l0,	%i5
	popc	0x186B,	%o5
	movrlz	%i4,	0x38D,	%i3
	tle	%xcc,	0x5
	ldx	[%l7 + 0x08],	%o7
	tneg	%icc,	0x6
	movneg	%xcc,	%l6,	%o3
	fandnot1	%f12,	%f2,	%f14
	fnegs	%f1,	%f22
	brgez	%o0,	loop_2375
	tle	%icc,	0x6
	taddcc	%o1,	0x05D3,	%i2
	edge8ln	%g1,	%o6,	%i0
loop_2375:
	tvs	%icc,	0x4
	ta	%xcc,	0x2
	set	0x50, %o3
	lduha	[%l7 + %o3] 0x14,	%o4
	sra	%g6,	%i1,	%g2
	set	0x5E, %g7
	stha	%i7,	[%l7 + %g7] 0xe3
	membar	#Sync
	membar	0x66
	edge8ln	%l1,	%g4,	%g5
	ldd	[%l7 + 0x30],	%f20
	fble	%fcc3,	loop_2376
	ba	loop_2377
	edge8	%l3,	%o2,	%l2
	umul	%i6,	0x08BD,	%l4
loop_2376:
	fornot2	%f24,	%f0,	%f26
loop_2377:
	tleu	%xcc,	0x0
	ldsw	[%l7 + 0x08],	%l5
	brlez,a	%g3,	loop_2378
	sll	%g7,	0x17,	%i5
	edge16n	%o5,	%l0,	%i4
	fmovdge	%icc,	%f19,	%f30
loop_2378:
	movre	%o7,	%i3,	%l6
	membar	0x76
	alignaddrl	%o0,	%o3,	%o1
	sra	%g1,	%i2,	%o6
	fmovdcs	%icc,	%f26,	%f12
	sth	%i0,	[%l7 + 0x6A]
	movrlz	%g6,	0x2A1,	%o4
	array8	%i1,	%i7,	%l1
	or	%g2,	0x1C11,	%g5
	taddcc	%l3,	%g4,	%l2
	fbg	%fcc2,	loop_2379
	lduw	[%l7 + 0x60],	%i6
	smul	%l4,	%o2,	%l5
	edge16l	%g7,	%g3,	%i5
loop_2379:
	ta	%icc,	0x1
	orncc	%o5,	0x00EA,	%l0
	fandnot2s	%f20,	%f29,	%f8
	fpadd32	%f24,	%f12,	%f28
	tsubcc	%i4,	%i3,	%l6
	lduw	[%l7 + 0x10],	%o7
	edge32ln	%o0,	%o1,	%o3
	nop
	setx	0x2FBA7EE8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x4F88DE6C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f19,	%f4
	umulcc	%i2,	0x1BD6,	%o6
	array16	%g1,	%g6,	%i0
	bne,a	loop_2380
	fmovdl	%xcc,	%f23,	%f31
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o4,	%i1
loop_2380:
	sll	%i7,	%l1,	%g2
	fmovsle	%xcc,	%f19,	%f2
	movl	%xcc,	%g5,	%l3
	popc	0x0592,	%l2
	movre	%g4,	0x3A9,	%l4
	movg	%icc,	%i6,	%o2
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x15,	 0x2
	movgu	%icc,	%g7,	%i5
	popc	0x1A26,	%o5
	srl	%g3,	0x00,	%l0
	fnors	%f30,	%f13,	%f21
	tvc	%xcc,	0x1
	movl	%xcc,	%i4,	%i3
	andcc	%o7,	%l6,	%o1
	taddcc	%o0,	%o3,	%o6
	fbe	%fcc1,	loop_2381
	fnors	%f25,	%f26,	%f7
	wr	%g0,	0x23,	%asi
	stha	%g1,	[%l7 + 0x76] %asi
	membar	#Sync
loop_2381:
	subc	%g6,	0x18F2,	%i2
	te	%icc,	0x4
	tpos	%icc,	0x6
	movcc	%icc,	%o4,	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x0c,	%i0,	%l1
	smul	%i7,	%g2,	%g5
	fbne,a	%fcc0,	loop_2382
	orcc	%l2,	0x0574,	%g4
	or	%l3,	0x0E54,	%i6
	tvc	%xcc,	0x0
loop_2382:
	sir	0x0668
	fmuld8ulx16	%f14,	%f15,	%f0
	fmovsvc	%icc,	%f25,	%f23
	or	%o2,	0x1BE3,	%l4
	fbo,a	%fcc0,	loop_2383
	srlx	%l5,	%i5,	%o5
	fsrc1	%f18,	%f14
	lduw	[%l7 + 0x50],	%g7
loop_2383:
	fbe,a	%fcc2,	loop_2384
	and	%g3,	%i4,	%l0
	edge8n	%o7,	%l6,	%i3
	movleu	%icc,	%o1,	%o3
loop_2384:
	edge8ln	%o0,	%o6,	%g1
	array32	%g6,	%o4,	%i1
	movcs	%icc,	%i0,	%i2
	set	0x32, %i0
	ldsha	[%l7 + %i0] 0x0c,	%i7
	movcs	%xcc,	%g2,	%l1
	fmovrdgez	%l2,	%f0,	%f22
	ld	[%l7 + 0x74],	%f20
	call	loop_2385
	tle	%icc,	0x7
	set	0x79, %i6
	ldstuba	[%l7 + %i6] 0x81,	%g4
loop_2385:
	mulx	%g5,	%i6,	%o2
	tpos	%icc,	0x6
	fpsub16	%f8,	%f22,	%f18
	addc	%l4,	0x1180,	%l3
	nop
	setx	loop_2386,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc1	%f26,	%f18
	movle	%icc,	%l5,	%o5
	tgu	%icc,	0x1
loop_2386:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%g7,	%i5
	srl	%i4,	0x11,	%g3
	fmovrsgez	%l0,	%f18,	%f0
	fble	%fcc0,	loop_2387
	ldub	[%l7 + 0x4E],	%o7
	smul	%l6,	0x06B2,	%o1
	andncc	%o3,	%o0,	%i3
loop_2387:
	fxnors	%f27,	%f5,	%f24
	popc	%o6,	%g1
	move	%icc,	%o4,	%g6
	fmuld8sux16	%f14,	%f17,	%f26
	addc	%i0,	0x0BF1,	%i1
	movgu	%icc,	%i7,	%i2
	taddcctv	%l1,	%l2,	%g2
	nop
	setx	0x7EF600D152E4E3CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f16
	fxor	%f14,	%f8,	%f8
	sra	%g4,	0x1D,	%g5
	fmovsge	%icc,	%f12,	%f7
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x7C] %asi,	%f21
	addccc	%i6,	%o2,	%l3
	movn	%xcc,	%l4,	%o5
	fbug,a	%fcc0,	loop_2388
	nop
	fitos	%f7,	%f27
	fstox	%f27,	%f18
	fxtos	%f18,	%f12
	smul	%l5,	0x1E28,	%i5
	fbu	%fcc0,	loop_2389
loop_2388:
	andcc	%g7,	%i4,	%l0
	bne	%icc,	loop_2390
	taddcctv	%g3,	%o7,	%o1
loop_2389:
	nop
	set	0x6C, %o2
	ldswa	[%l7 + %o2] 0x0c,	%o3
loop_2390:
	ldd	[%l7 + 0x08],	%o0
	movrlz	%l6,	0x1C8,	%o6
	addccc	%i3,	0x18CD,	%g1
	edge32n	%g6,	%i0,	%o4
	edge32n	%i7,	%i1,	%l1
	bge	%xcc,	loop_2391
	lduh	[%l7 + 0x5A],	%i2
	udiv	%g2,	0x13E6,	%g4
	edge8l	%g5,	%l2,	%o2
loop_2391:
	udivcc	%l3,	0x03F4,	%l4
	fbne,a	%fcc3,	loop_2392
	fmovdne	%xcc,	%f0,	%f17
	fabsd	%f6,	%f12
	fsrc1	%f12,	%f10
loop_2392:
	movrgz	%o5,	%l5,	%i6
	bpos,a	%xcc,	loop_2393
	move	%xcc,	%g7,	%i5
	nop
	setx	0xDAB1777B6073AF0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	call	loop_2394
loop_2393:
	lduw	[%l7 + 0x48],	%l0
	orn	%g3,	0x1C26,	%i4
	sth	%o7,	[%l7 + 0x76]
loop_2394:
	movrlez	%o3,	%o0,	%o1
	tneg	%icc,	0x3
	edge8l	%o6,	%i3,	%l6
	fble,a	%fcc0,	loop_2395
	addc	%g1,	%i0,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f16,	%f24
loop_2395:
	orcc	%i7,	%i1,	%g6
	swap	[%l7 + 0x54],	%l1
	movl	%icc,	%g2,	%i2
	ldx	[%l7 + 0x18],	%g4
	call	loop_2396
	movneg	%icc,	%l2,	%o2
	fnot1	%f16,	%f10
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x10,	%g5,	%l4
loop_2396:
	subcc	%o5,	0x1EA5,	%l3
	andn	%l5,	%g7,	%i6
	movle	%icc,	%i5,	%g3
	mova	%xcc,	%l0,	%i4
	move	%xcc,	%o7,	%o0
	tl	%icc,	0x4
	tcs	%xcc,	0x1
	set	0x40, %l5
	ldxa	[%l7 + %l5] 0x15,	%o3
	swap	[%l7 + 0x40],	%o6
	alignaddr	%i3,	%l6,	%o1
	fmovrde	%g1,	%f26,	%f24
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	tle	%xcc,	0x6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x18,	%i0,	%i7
	addcc	%i1,	0x1E2A,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f21,	%f6
	brgez,a	%g2,	loop_2397
	smulcc	%i2,	0x0E7C,	%l1
	stbar
	movpos	%icc,	%g4,	%o2
loop_2397:
	movgu	%xcc,	%l2,	%g5
	edge32l	%o5,	%l3,	%l5
	tg	%icc,	0x3
	nop
	fitod	%f12,	%f8
	fmovsn	%xcc,	%f20,	%f18
	fnands	%f30,	%f12,	%f23
	fnot2	%f4,	%f22
	mulscc	%l4,	0x1145,	%g7
	fsrc2	%f16,	%f14
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tvc	%xcc,	0x0
	edge8l	%i5,	%i6,	%l0
	subc	%g3,	%i4,	%o0
	fnand	%f26,	%f22,	%f6
	udiv	%o3,	0x01AF,	%o6
	tsubcc	%o7,	%l6,	%i3
	sth	%g1,	[%l7 + 0x6C]
	fnot2	%f4,	%f14
	fpadd32s	%f5,	%f29,	%f10
	edge16	%o1,	%i0,	%i7
	nop
	fitos	%f8,	%f25
	fstoi	%f25,	%f5
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	bcc,a,pt	%xcc,	loop_2398
	movpos	%xcc,	%g6,	%g2
	set	0x38, %g6
	lduha	[%l7 + %g6] 0x0c,	%i2
loop_2398:
	fmovs	%f29,	%f22
	movleu	%icc,	%o4,	%g4
	fbo	%fcc0,	loop_2399
	tge	%icc,	0x6
	movrlz	%l1,	%l2,	%o2
	fbn,a	%fcc2,	loop_2400
loop_2399:
	fabss	%f1,	%f12
	sra	%g5,	%l3,	%o5
	tge	%icc,	0x5
loop_2400:
	fmuld8sux16	%f21,	%f3,	%f24
	fbe	%fcc0,	loop_2401
	fors	%f11,	%f18,	%f0
	stbar
	set	0x70, %i2
	sta	%f21,	[%l7 + %i2] 0x18
loop_2401:
	fbo	%fcc2,	loop_2402
	ld	[%l7 + 0x40],	%f21
	alignaddr	%l5,	%l4,	%i5
	srax	%g7,	0x10,	%i6
loop_2402:
	fmovrse	%l0,	%f25,	%f6
	brgez	%i4,	loop_2403
	orn	%g3,	%o3,	%o0
	sir	0x1E08
	bvs	%icc,	loop_2404
loop_2403:
	movneg	%xcc,	%o6,	%l6
	tl	%xcc,	0x1
	edge8ln	%o7,	%i3,	%o1
loop_2404:
	nop
	setx	0x9494E56D113A5D46,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x137E1E03F7933309,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f4,	%f6
	edge16ln	%i0,	%i7,	%g1
	faligndata	%f30,	%f6,	%f4
	movneg	%xcc,	%g6,	%g2
	stx	%i2,	[%l7 + 0x70]
	fmovdcc	%xcc,	%f26,	%f9
	tcs	%xcc,	0x4
	fmovda	%xcc,	%f3,	%f29
	tl	%icc,	0x6
	movrlez	%i1,	0x2DD,	%o4
	popc	0x1A3A,	%g4
	movn	%icc,	%l1,	%o2
	movvs	%xcc,	%g5,	%l3
	edge32ln	%o5,	%l5,	%l4
	tvs	%icc,	0x2
	sll	%l2,	0x08,	%i5
	nop
	set	0x50, %i4
	ldsw	[%l7 + %i4],	%g7
	fba	%fcc1,	loop_2405
	ta	%xcc,	0x2
	edge16ln	%l0,	%i4,	%g3
	fmovdpos	%icc,	%f24,	%f9
loop_2405:
	srl	%i6,	%o0,	%o3
	bvs	%icc,	loop_2406
	ta	%xcc,	0x4
	edge8l	%o6,	%l6,	%i3
	stx	%o7,	[%l7 + 0x50]
loop_2406:
	udivx	%o1,	0x0F33,	%i0
	fmovrsgz	%i7,	%f8,	%f22
	tge	%icc,	0x3
	movrlz	%g6,	0x1BE,	%g1
	orcc	%g2,	%i2,	%o4
	edge32l	%g4,	%l1,	%o2
	xnorcc	%g5,	0x1E14,	%l3
	fnegd	%f10,	%f4
	srl	%i1,	%l5,	%o5
	fbuge	%fcc0,	loop_2407
	move	%xcc,	%l4,	%i5
	edge16	%l2,	%g7,	%i4
	movg	%icc,	%g3,	%i6
loop_2407:
	fpsub16	%f20,	%f10,	%f8
	fpadd32	%f0,	%f30,	%f10
	fors	%f8,	%f31,	%f28
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o0
	ldstub	[%l7 + 0x1F],	%o3
	fmovsleu	%xcc,	%f8,	%f25
	membar	0x63
	array8	%l0,	%l6,	%o6
	edge8n	%o7,	%i3,	%o1
	ldsh	[%l7 + 0x4E],	%i7
	popc	%i0,	%g1
	movgu	%xcc,	%g6,	%g2
	wr	%g0,	0x80,	%asi
	sta	%f24,	[%l7 + 0x74] %asi
	movgu	%xcc,	%o4,	%i2
	movgu	%icc,	%g4,	%o2
	movn	%icc,	%g5,	%l3
	addccc	%l1,	%l5,	%i1
	andcc	%l4,	0x0839,	%i5
	andncc	%o5,	%l2,	%g7
	alignaddr	%g3,	%i6,	%i4
	tle	%icc,	0x1
	fmovdne	%xcc,	%f21,	%f2
	orcc	%o3,	%o0,	%l0
	andcc	%l6,	0x0573,	%o6
	subcc	%o7,	0x199B,	%i3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%i0
	ble,pn	%xcc,	loop_2408
	call	loop_2409
	bvc,pt	%icc,	loop_2410
	tl	%icc,	0x7
loop_2408:
	fxnor	%f0,	%f14,	%f8
loop_2409:
	xnor	%o1,	0x082C,	%g6
loop_2410:
	tge	%xcc,	0x3
	movrlz	%g1,	0x1E2,	%o4
	movrlez	%g2,	0x368,	%g4
	movrlez	%o2,	0x369,	%g5
	fnegs	%f13,	%f9
	movge	%xcc,	%i2,	%l3
	swap	[%l7 + 0x34],	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x6021FA791504F522,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x02809B2661CEFB94,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f14,	%f2
	movre	%i1,	0x3A6,	%l4
	nop
	fitod	%f0,	%f12
	fdtos	%f12,	%f19
	fcmpne16	%f14,	%f16,	%l5
	fmovrdlz	%i5,	%f12,	%f0
	sllx	%o5,	%g7,	%l2
	fmovrslez	%g3,	%f17,	%f12
	movre	%i6,	0x310,	%i4
	nop
	fitod	%f8,	%f16
	smul	%o3,	0x10F9,	%o0
	taddcc	%l0,	0x186A,	%o6
	movvc	%xcc,	%o7,	%l6
	taddcc	%i7,	0x150E,	%i3
	movrgz	%o1,	%i0,	%g6
	fbne,a	%fcc0,	loop_2411
	umul	%o4,	%g1,	%g4
	sir	0x01F4
	prefetch	[%l7 + 0x64],	 0x3
loop_2411:
	edge32ln	%g2,	%g5,	%i2
	orcc	%o2,	%l1,	%i1
	fones	%f21
	fpack32	%f10,	%f20,	%f24
	fbl	%fcc0,	loop_2412
	umulcc	%l3,	%l4,	%i5
	movcc	%xcc,	%l5,	%o5
	xor	%l2,	%g3,	%g7
loop_2412:
	sdivx	%i6,	0x16A9,	%i4
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f30
	fxtod	%f30,	%f2
	edge8ln	%o3,	%o0,	%o6
	movre	%l0,	0x3B7,	%l6
	fbo	%fcc0,	loop_2413
	tsubcctv	%o7,	%i3,	%i7
	tpos	%icc,	0x2
	mova	%icc,	%i0,	%o1
loop_2413:
	tle	%xcc,	0x6
	fmovsl	%xcc,	%f10,	%f24
	fmovrse	%g6,	%f31,	%f18
	movcc	%xcc,	%o4,	%g1
	edge8ln	%g2,	%g5,	%i2
	edge32n	%g4,	%l1,	%i1
	movrne	%o2,	%l4,	%i5
	fmovdle	%icc,	%f31,	%f10
	tneg	%xcc,	0x7
	nop
	setx	loop_2414,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot2	%f6,	%f22,	%f0
	subc	%l5,	0x0729,	%o5
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
loop_2414:
	mova	%icc,	%l2,	%g7
	ldd	[%l7 + 0x50],	%f0
	set	0x08, %l4
	sta	%f9,	[%l7 + %l4] 0x04
	tn	%icc,	0x2
	fblg,a	%fcc2,	loop_2415
	or	%g3,	0x15B0,	%i4
	fbg	%fcc3,	loop_2416
	mulx	%i6,	0x1815,	%o3
loop_2415:
	nop
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x42] %asi,	%o0
loop_2416:
	std	%f8,	[%l7 + 0x78]
	fmovsg	%icc,	%f10,	%f30
	ld	[%l7 + 0x74],	%f24
	ta	%icc,	0x0
	subc	%o6,	%l0,	%l6
	movl	%xcc,	%i3,	%o7
	tcs	%xcc,	0x4
	edge16ln	%i7,	%i0,	%o1
	fbo,a	%fcc1,	loop_2417
	bvs	%xcc,	loop_2418
	tsubcctv	%o4,	0x1423,	%g6
	set	0x58, %o0
	lduha	[%l7 + %o0] 0x0c,	%g1
loop_2417:
	fxnor	%f18,	%f4,	%f6
loop_2418:
	movrgez	%g5,	0x16B,	%i2
	nop
	setx	loop_2419,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bl,a,pn	%xcc,	loop_2420
	movge	%icc,	%g2,	%l1
	tpos	%icc,	0x2
loop_2419:
	orn	%g4,	0x1B6A,	%o2
loop_2420:
	sub	%i1,	0x1C98,	%i5
	set	0x69, %l0
	ldstuba	[%l7 + %l0] 0x11,	%l4
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	alignaddrl	%l5,	%l3,	%o5
	set	0x58, %g3
	lduwa	[%l7 + %g3] 0x0c,	%g7
	edge32n	%l2,	%i4,	%i6
	call	loop_2421
	stbar
	movrlz	%g3,	%o3,	%o0
	movpos	%icc,	%o6,	%l0
loop_2421:
	sllx	%i3,	0x07,	%o7
	set	0x10, %o4
	prefetcha	[%l7 + %o4] 0x04,	 0x2
	udiv	%l6,	0x0064,	%o1
	sdiv	%o4,	0x1328,	%i0
	fnors	%f26,	%f25,	%f30
	edge16	%g1,	%g6,	%g5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x55] %asi,	%i2
	sllx	%g2,	%g4,	%l1
	fabss	%f3,	%f22
	for	%f10,	%f18,	%f10
	andcc	%o2,	0x01B4,	%i5
	fpsub32s	%f8,	%f7,	%f23
	fpack16	%f4,	%f19
	swap	[%l7 + 0x34],	%l4
	movrne	%i1,	0x107,	%l5
	brz	%o5,	loop_2422
	fbug,a	%fcc3,	loop_2423
	sdiv	%g7,	0x077E,	%l2
	array32	%l3,	%i4,	%i6
loop_2422:
	movcc	%icc,	%o3,	%g3
loop_2423:
	movcs	%xcc,	%o6,	%o0
	swap	[%l7 + 0x24],	%l0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o7
	movcs	%icc,	%i3,	%i7
	xnorcc	%o1,	%o4,	%i0
	nop
	setx	0x5C8217AACAF20A13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA383AE6F75ACF300,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f14,	%f0
	edge8ln	%l6,	%g1,	%g5
	nop
	setx	0xE0641366,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	alignaddrl	%g6,	%i2,	%g4
	subc	%g2,	0x08D7,	%o2
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
	set	0x08, %o1
	prefetcha	[%l7 + %o1] 0x80,	 0x2
	fbne,a	%fcc2,	loop_2424
	udiv	%i1,	0x0AE9,	%l5
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f26
	taddcctv	%i5,	0x0D81,	%g7
loop_2424:
	fmovrsgez	%l2,	%f29,	%f15
	set	0x70, %o5
	lduwa	[%l7 + %o5] 0x89,	%l3
	ldsh	[%l7 + 0x7A],	%i4
	fmovdcc	%xcc,	%f31,	%f28
	andn	%i6,	%o3,	%o5
	movg	%xcc,	%g3,	%o6
	tne	%xcc,	0x2
	movle	%xcc,	%l0,	%o7
	fmovde	%icc,	%f30,	%f4
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x18
	nop
	fitod	%f24,	%f14
	movcs	%icc,	%o0,	%i7
	fbule,a	%fcc3,	loop_2425
	movrlez	%o1,	0x06F,	%o4
	movcs	%icc,	%i3,	%l6
	move	%icc,	%g1,	%g5
loop_2425:
	bge	loop_2426
	movcc	%icc,	%g6,	%i2
	bge,a	%xcc,	loop_2427
	fbul,a	%fcc2,	loop_2428
loop_2426:
	sra	%g4,	%i0,	%g2
	edge16ln	%o2,	%l4,	%i1
loop_2427:
	fcmpgt32	%f30,	%f16,	%l1
loop_2428:
	edge32n	%l5,	%g7,	%l2
	fmovsne	%icc,	%f4,	%f23
	tcc	%icc,	0x1
	movpos	%icc,	%i5,	%i4
	call	loop_2429
	ta	%icc,	0x3
	brlz	%i6,	loop_2430
	addcc	%o3,	%l3,	%g3
loop_2429:
	nop
	set	0x1E, %g4
	ldsha	[%l7 + %g4] 0x18,	%o6
loop_2430:
	edge8ln	%o5,	%o7,	%l0
	movcs	%icc,	%i7,	%o0
	subc	%o4,	%i3,	%o1
	fcmpeq32	%f4,	%f2,	%l6
	add	%g1,	%g5,	%i2
	mulx	%g6,	%i0,	%g4
	movvc	%icc,	%g2,	%o2
	te	%xcc,	0x5
	faligndata	%f24,	%f28,	%f6
	or	%i1,	%l1,	%l5
	movvc	%icc,	%g7,	%l4
	swap	[%l7 + 0x54],	%i5
	fmovsge	%xcc,	%f27,	%f31
	movrne	%l2,	%i6,	%o3
	set	0x78, %l6
	stxa	%i4,	[%l7 + %l6] 0x80
	tge	%xcc,	0x5
	andcc	%l3,	%o6,	%o5
	fornot2	%f20,	%f2,	%f14
	fmovdleu	%xcc,	%f27,	%f14
	fmovdvc	%xcc,	%f10,	%f19
	taddcctv	%o7,	0x05A4,	%g3
	movn	%xcc,	%l0,	%o0
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x19,	%f16
	alignaddrl	%i7,	%i3,	%o4
	edge16	%o1,	%g1,	%g5
	edge16n	%i2,	%g6,	%i0
	add	%l6,	%g2,	%g4
	fmovsvc	%xcc,	%f14,	%f19
	movrne	%i1,	%l1,	%o2
	movleu	%icc,	%g7,	%l4
	nop
	setx	0x5AB5C58924E185FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x9C5D3CB2EB16D76F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f24,	%f4
	tneg	%xcc,	0x7
	fbug	%fcc1,	loop_2431
	fmovrdlz	%l5,	%f20,	%f20
	tne	%xcc,	0x7
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf8
	membar	#Sync
loop_2431:
	fpadd16s	%f6,	%f27,	%f10
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bleu,a,pn	%xcc,	loop_2432
	movrgz	%l2,	%i6,	%o3
	subc	%i5,	0x1FA4,	%l3
	lduh	[%l7 + 0x7C],	%i4
loop_2432:
	tl	%xcc,	0x1
	popc	0x1F22,	%o6
	movrgez	%o5,	0x25E,	%o7
	sll	%l0,	%g3,	%i7
	movre	%o0,	%i3,	%o1
	edge32ln	%g1,	%o4,	%i2
	brlez,a	%g6,	loop_2433
	tsubcctv	%i0,	%l6,	%g5
	sethi	0x0EBA,	%g4
	fmovdneg	%icc,	%f18,	%f15
loop_2433:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f28,	%f1,	%f14
	movpos	%xcc,	%g2,	%i1
	orcc	%l1,	0x1BAC,	%g7
	tn	%icc,	0x1
	edge16	%l4,	%o2,	%l5
	fmovsg	%icc,	%f1,	%f24
	edge32ln	%i6,	%o3,	%l2
	nop
	setx loop_2434, %l0, %l1
	jmpl %l1, %i5
	movneg	%xcc,	%l3,	%i4
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2434:
	bleu	loop_2435
	tsubcctv	%o5,	0x09D6,	%o6
	fmovrdlz	%o7,	%f24,	%f2
	sllx	%l0,	%g3,	%i7
loop_2435:
	sir	0x0A75
	edge16	%i3,	%o0,	%g1
	be,a,pn	%icc,	loop_2436
	umul	%o4,	0x00E7,	%o1
	andn	%i2,	0x10AD,	%g6
	udivcc	%l6,	0x10A1,	%i0
loop_2436:
	sll	%g5,	0x0C,	%g2
	movrlez	%g4,	0x0BE,	%i1
	fbge,a	%fcc3,	loop_2437
	srax	%g7,	0x14,	%l1
	edge32ln	%o2,	%l4,	%l5
	tcs	%xcc,	0x3
loop_2437:
	xor	%o3,	0x0DAA,	%l2
	bg,pt	%icc,	loop_2438
	sdivx	%i6,	0x0A00,	%i5
	edge8n	%l3,	%i4,	%o6
	sra	%o7,	%o5,	%g3
loop_2438:
	fbue,a	%fcc3,	loop_2439
	sub	%i7,	0x094A,	%l0
	stx	%o0,	[%l7 + 0x48]
	add	%i3,	%o4,	%g1
loop_2439:
	tn	%icc,	0x6
	fbu,a	%fcc0,	loop_2440
	edge32ln	%o1,	%i2,	%g6
	bpos	%xcc,	loop_2441
	nop
	fitod	%f24,	%f30
loop_2440:
	movvc	%xcc,	%i0,	%l6
	nop
	fitos	%f13,	%f15
	fstox	%f15,	%f28
	fxtos	%f28,	%f2
loop_2441:
	flush	%l7 + 0x7C
	movrlz	%g2,	0x37C,	%g5
	fexpand	%f3,	%f0
	subc	%i1,	0x1742,	%g4
	bneg	loop_2442
	tvc	%icc,	0x5
	pdist	%f2,	%f30,	%f14
	tgu	%xcc,	0x1
loop_2442:
	movl	%xcc,	%l1,	%o2
	srlx	%g7,	0x09,	%l5
	bpos,pn	%icc,	loop_2443
	fmovspos	%icc,	%f26,	%f21
	nop
	setx	0x511D1970,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f23
	fmovdg	%icc,	%f16,	%f15
loop_2443:
	movgu	%xcc,	%o3,	%l4
	andcc	%i6,	0x13AA,	%i5
	movneg	%xcc,	%l3,	%i4
	xor	%l2,	%o6,	%o5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x3C] %asi,	%g3
	lduw	[%l7 + 0x60],	%i7
	fmovdl	%icc,	%f1,	%f8
	umulcc	%l0,	0x04E4,	%o7
	brnz	%i3,	loop_2444
	sir	0x0C6B
	bl	loop_2445
	fbuge,a	%fcc1,	loop_2446
loop_2444:
	array8	%o4,	%g1,	%o0
	xnorcc	%o1,	%g6,	%i0
loop_2445:
	addcc	%i2,	0x0D90,	%l6
loop_2446:
	fmovscs	%icc,	%f4,	%f2
	and	%g5,	0x1F3A,	%i1
	fbo,a	%fcc0,	loop_2447
	fbue	%fcc0,	loop_2448
	movleu	%icc,	%g2,	%l1
	sdivx	%g4,	0x03EC,	%g7
loop_2447:
	sub	%l5,	0x0590,	%o3
loop_2448:
	sethi	0x13CE,	%o2
	movneg	%icc,	%l4,	%i5
	fmovdge	%xcc,	%f25,	%f17
	edge16n	%i6,	%l3,	%l2
	ldsw	[%l7 + 0x68],	%i4
	tleu	%xcc,	0x6
	tle	%xcc,	0x6
	tcc	%xcc,	0x4
	alignaddr	%o5,	%g3,	%o6
	nop
	setx	0x407815EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	popc	0x0ABE,	%l0
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x44] %asi,	%f11
	srlx	%o7,	%i3,	%o4
	add	%i7,	0x12C8,	%o0
	stbar
	add	%l7,	0x34,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%o1,	%g6
	tle	%xcc,	0x0
	sir	0x0C5D
	fbe	%fcc2,	loop_2449
	tcs	%xcc,	0x2
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2449:
	andcc	%i0,	%g1,	%i2
	movleu	%icc,	%g5,	%i1
	addccc	%g2,	0x0F7B,	%l6
	smul	%l1,	%g7,	%l5
	srlx	%o3,	%g4,	%l4
	fpmerge	%f19,	%f3,	%f10
	movge	%icc,	%i5,	%o2
	fcmpne32	%f18,	%f28,	%i6
	edge8ln	%l2,	%l3,	%o5
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x14] %asi,	%i4
	smul	%o6,	0x1C25,	%l0
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf0
	membar	#Sync
	movleu	%icc,	%o7,	%i3
	lduw	[%l7 + 0x5C],	%o4
	sra	%g3,	0x00,	%i7
	tne	%xcc,	0x1
	fbue	%fcc2,	loop_2450
	sdiv	%o1,	0x0717,	%o0
	sir	0x0D95
	movleu	%xcc,	%i0,	%g1
loop_2450:
	movge	%xcc,	%g6,	%i2
	srax	%g5,	0x1F,	%i1
	add	%g2,	%l6,	%l1
	be,pt	%icc,	loop_2451
	fnegs	%f3,	%f8
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%l5
loop_2451:
	tn	%xcc,	0x6
	xorcc	%g4,	%l4,	%o3
	fmovrslez	%o2,	%f28,	%f7
	alignaddr	%i6,	%i5,	%l3
	tcc	%icc,	0x7
	lduw	[%l7 + 0x14],	%o5
	tne	%icc,	0x5
	sth	%i4,	[%l7 + 0x62]
	movg	%icc,	%o6,	%l2
	call	loop_2452
	fandnot2s	%f17,	%f7,	%f28
	sdivcc	%o7,	0x1ABB,	%l0
	nop
	setx	loop_2453,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2452:
	smul	%o4,	0x0073,	%i3
	movgu	%xcc,	%g3,	%i7
	smul	%o1,	0x0F43,	%o0
loop_2453:
	movne	%icc,	%i0,	%g1
	edge8ln	%g6,	%i2,	%i1
	ldub	[%l7 + 0x3B],	%g5
	fmovspos	%icc,	%f3,	%f8
	edge32	%l6,	%l1,	%g7
	udiv	%g2,	0x0E85,	%g4
	fmovrdlz	%l4,	%f30,	%f16
	ld	[%l7 + 0x4C],	%f9
	taddcctv	%l5,	0x0C98,	%o2
	nop
	setx loop_2454, %l0, %l1
	jmpl %l1, %o3
	fsrc1	%f28,	%f6
	srax	%i5,	%i6,	%o5
	fmovrse	%i4,	%f8,	%f4
loop_2454:
	movgu	%icc,	%l3,	%o6
	bne,a	%xcc,	loop_2455
	edge16	%o7,	%l0,	%l2
	tl	%icc,	0x2
	membar	0x3A
loop_2455:
	be,pt	%xcc,	loop_2456
	orn	%o4,	0x0402,	%i3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%i7
loop_2456:
	sdivx	%g3,	0x1200,	%o0
	tvs	%xcc,	0x3
	tvc	%icc,	0x1
	brgz,a	%o1,	loop_2457
	array16	%g1,	%i0,	%i2
	fmovscs	%icc,	%f12,	%f13
	mulscc	%i1,	%g5,	%l6
loop_2457:
	nop
	setx	0xA195D8DF6E4691F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD4B2092DF2B1C314,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f0,	%f4
	addcc	%l1,	%g7,	%g2
	tleu	%xcc,	0x0
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x1e
	membar	#Sync
	bpos,a	loop_2458
	addcc	%g6,	0x081F,	%g4
	fpsub16s	%f3,	%f18,	%f24
	taddcctv	%l4,	0x0A7F,	%l5
loop_2458:
	subc	%o2,	%o3,	%i6
	smulcc	%o5,	0x10A5,	%i5
	fmul8x16	%f22,	%f12,	%f6
	flush	%l7 + 0x2C
	fmovsge	%icc,	%f16,	%f28
	fpadd16s	%f2,	%f6,	%f26
	srl	%i4,	0x14,	%o6
	sra	%o7,	0x0E,	%l3
	tleu	%xcc,	0x7
	bgu,pt	%icc,	loop_2459
	fmovsneg	%icc,	%f4,	%f4
	orn	%l0,	0x0770,	%o4
	st	%f6,	[%l7 + 0x10]
loop_2459:
	edge8l	%i3,	%l2,	%i7
	sll	%o0,	%o1,	%g1
	fmovdle	%xcc,	%f31,	%f25
	stx	%i0,	[%l7 + 0x48]
	fbo	%fcc3,	loop_2460
	smulcc	%g3,	%i2,	%i1
	movl	%icc,	%g5,	%l1
	nop
	fitos	%f1,	%f7
	fstox	%f7,	%f8
	fxtos	%f8,	%f9
loop_2460:
	movvs	%icc,	%g7,	%g2
	fmovdne	%icc,	%f0,	%f6
	mulx	%g6,	%g4,	%l6
	fmovsgu	%icc,	%f7,	%f6
	subccc	%l5,	0x0349,	%l4
	tcs	%xcc,	0x1
	te	%icc,	0x6
	taddcc	%o2,	%i6,	%o3
	move	%xcc,	%i5,	%o5
	udivx	%i4,	0x0613,	%o6
	wr	%g0,	0x18,	%asi
	stwa	%o7,	[%l7 + 0x50] %asi
	sth	%l0,	[%l7 + 0x46]
	movne	%xcc,	%o4,	%i3
	mova	%icc,	%l2,	%l3
	set	0x28, %i7
	ldswa	[%l7 + %i7] 0x88,	%i7
	movre	%o0,	%o1,	%i0
	fbo,a	%fcc2,	loop_2461
	fblg	%fcc3,	loop_2462
	edge32	%g1,	%g3,	%i2
	srl	%i1,	0x08,	%g5
loop_2461:
	umul	%g7,	%l1,	%g2
loop_2462:
	addc	%g6,	%l6,	%g4
	brz	%l5,	loop_2463
	xorcc	%l4,	0x1507,	%i6
	edge32l	%o2,	%o3,	%i5
	sra	%o5,	%o6,	%o7
loop_2463:
	sdiv	%i4,	0x05EF,	%o4
	tl	%xcc,	0x5
	sra	%l0,	%l2,	%i3
	tcc	%xcc,	0x3
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x14
	st	%f6,	[%l7 + 0x48]
	brnz,a	%l3,	loop_2464
	udiv	%o0,	0x1537,	%o1
	movrgez	%i0,	0x1FC,	%g1
	tsubcc	%g3,	%i2,	%i1
loop_2464:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i7
	set	0x40, %g1
	prefetcha	[%l7 + %g1] 0x18,	 0x0
	tn	%icc,	0x7
	tvs	%icc,	0x3
	or	%l1,	%g2,	%g5
	array8	%g6,	%l6,	%l5
	nop
	set	0x34, %l1
	ldsh	[%l7 + %l1],	%l4
	array16	%i6,	%o2,	%o3
	fbe,a	%fcc3,	loop_2465
	membar	0x23
	edge32l	%g4,	%o5,	%o6
	brz,a	%o7,	loop_2466
loop_2465:
	fpsub16s	%f31,	%f21,	%f24
	tcs	%icc,	0x1
	movleu	%icc,	%i4,	%i5
loop_2466:
	andncc	%o4,	%l2,	%l0
	edge16n	%l3,	%o0,	%o1
	edge16l	%i3,	%g1,	%g3
	fbul	%fcc1,	loop_2467
	brz	%i2,	loop_2468
	tg	%xcc,	0x6
	array16	%i1,	%i0,	%i7
loop_2467:
	movgu	%xcc,	%l1,	%g7
loop_2468:
	ldd	[%l7 + 0x70],	%f14
	subc	%g2,	%g6,	%g5
	tsubcctv	%l5,	0x1EEC,	%l6
	fmovsn	%icc,	%f31,	%f5
	movcc	%icc,	%l4,	%o2
	movgu	%xcc,	%o3,	%g4
	popc	0x125E,	%o5
	fbue	%fcc1,	loop_2469
	brgz	%i6,	loop_2470
	tvs	%xcc,	0x2
	srax	%o7,	%o6,	%i5
loop_2469:
	movle	%xcc,	%o4,	%l2
loop_2470:
	smul	%l0,	%i4,	%l3
	add	%o0,	%i3,	%g1
	sub	%g3,	0x0240,	%o1
	smul	%i1,	0x09FA,	%i2
	mulx	%i0,	%i7,	%l1
	andncc	%g2,	%g6,	%g7
	fmovrsgez	%l5,	%f19,	%f4
	orn	%g5,	%l4,	%l6
	xnor	%o2,	0x14E0,	%o3
	sdivx	%g4,	0x0A44,	%o5
	wr	%g0,	0x2b,	%asi
	stxa	%o7,	[%l7 + 0x18] %asi
	membar	#Sync
	lduh	[%l7 + 0x78],	%i6
	ldub	[%l7 + 0x3D],	%i5
	wr	%g0,	0x11,	%asi
	stba	%o4,	[%l7 + 0x3A] %asi
	ldx	[%l7 + 0x70],	%o6
	brnz	%l0,	loop_2471
	movgu	%xcc,	%l2,	%i4
	brlz	%l3,	loop_2472
	tleu	%icc,	0x0
loop_2471:
	fmovrsgz	%o0,	%f27,	%f6
	movge	%icc,	%i3,	%g1
loop_2472:
	mulscc	%g3,	0x1FA5,	%i1
	tcc	%xcc,	0x5
	umulcc	%i2,	%o1,	%i0
	move	%xcc,	%i7,	%l1
	fble,a	%fcc1,	loop_2473
	bl,pt	%icc,	loop_2474
	bvc,a	loop_2475
	fble,a	%fcc2,	loop_2476
loop_2473:
	tgu	%xcc,	0x6
loop_2474:
	movrgz	%g2,	0x13E,	%g7
loop_2475:
	stw	%l5,	[%l7 + 0x7C]
loop_2476:
	movrgez	%g6,	%l4,	%g5
	movn	%icc,	%l6,	%o2
	fornot1	%f14,	%f30,	%f2
	mulx	%o3,	%o5,	%o7
	nop
	setx	loop_2477,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%i6,	%g4,	%o4
	sethi	0x0C98,	%o6
	smulcc	%i5,	0x09CF,	%l2
loop_2477:
	taddcctv	%i4,	%l0,	%o0
	movrgz	%l3,	%g1,	%g3
	orncc	%i1,	0x06ED,	%i3
	edge32l	%i2,	%i0,	%i7
	brz,a	%l1,	loop_2478
	ldx	[%l7 + 0x20],	%g2
	or	%o1,	%g7,	%l5
	array32	%l4,	%g6,	%l6
loop_2478:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x69] %asi,	%o2
	movle	%icc,	%o3,	%o5
	fmovse	%icc,	%f15,	%f8
	fxors	%f24,	%f0,	%f24
	nop
	setx	0x6BF8FF850057A617,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fbl,a	%fcc0,	loop_2479
	fmuld8sux16	%f18,	%f10,	%f4
	brz,a	%g5,	loop_2480
	sdivx	%i6,	0x0643,	%g4
loop_2479:
	udiv	%o4,	0x1B8F,	%o6
	movrlz	%i5,	0x0DA,	%l2
loop_2480:
	edge32ln	%i4,	%l0,	%o7
	fones	%f8
	fmovde	%xcc,	%f30,	%f20
	tgu	%icc,	0x3
	orn	%o0,	0x196C,	%l3
	udivx	%g3,	0x15D4,	%g1
	wr	%g0,	0x19,	%asi
	stha	%i1,	[%l7 + 0x18] %asi
	fbu	%fcc2,	loop_2481
	srax	%i2,	0x11,	%i3
	orcc	%i7,	0x169B,	%l1
	fbl,a	%fcc1,	loop_2482
loop_2481:
	edge16l	%i0,	%o1,	%g7
	fmovsgu	%icc,	%f2,	%f14
	sdivx	%l5,	0x021D,	%l4
loop_2482:
	edge8ln	%g2,	%l6,	%g6
	movcc	%icc,	%o3,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o2,	%i6,	%g5
	ldstub	[%l7 + 0x28],	%g4
	tcc	%icc,	0x0
	fbuge,a	%fcc3,	loop_2483
	addcc	%o6,	0x19BF,	%i5
	sdivcc	%o4,	0x1345,	%i4
	faligndata	%f18,	%f18,	%f4
loop_2483:
	mulx	%l2,	%l0,	%o7
	sdivx	%o0,	0x0A34,	%g3
	umul	%g1,	0x0F76,	%i1
	fpack32	%f30,	%f24,	%f10
	movleu	%xcc,	%i2,	%i3
	orcc	%i7,	0x1573,	%l1
	fsrc2	%f18,	%f12
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x2C] %asi,	%i0
	bvs,a	loop_2484
	andcc	%l3,	%o1,	%l5
	orncc	%g7,	0x16AE,	%l4
	udiv	%l6,	0x16FA,	%g6
loop_2484:
	movrne	%g2,	0x2E2,	%o3
	nop
	setx loop_2485, %l0, %l1
	jmpl %l1, %o2
	brgez	%o5,	loop_2486
	movle	%icc,	%i6,	%g5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x28] %asi,	%o6
loop_2485:
	movre	%g4,	0x335,	%i5
loop_2486:
	fzero	%f26
	umulcc	%i4,	0x17AC,	%l2
	std	%f6,	[%l7 + 0x08]
	srax	%o4,	0x13,	%l0
	tleu	%xcc,	0x3
	fpsub16s	%f1,	%f0,	%f9
	bvc,pn	%icc,	loop_2487
	swap	[%l7 + 0x38],	%o7
	movge	%icc,	%g3,	%g1
	fmovrslez	%i1,	%f12,	%f2
loop_2487:
	edge16	%i2,	%o0,	%i7
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	edge8n	%l1,	%l3,	%o1
	edge16ln	%l5,	%g7,	%l4
	smulcc	%i0,	0x1ECF,	%l6
	array16	%g6,	%g2,	%o3
	mulx	%o5,	0x0EBD,	%i6
	xorcc	%o2,	0x1DA0,	%o6
	fand	%f18,	%f22,	%f20
	lduh	[%l7 + 0x70],	%g4
	ld	[%l7 + 0x3C],	%f11
	set	0x7D, %g5
	ldsba	[%l7 + %g5] 0x81,	%i5
	sethi	0x1B3E,	%i4
	tg	%icc,	0x4
	edge8n	%l2,	%o4,	%g5
	udivcc	%o7,	0x0699,	%l0
	alignaddr	%g3,	%g1,	%i2
	movrlez	%o0,	0x24E,	%i1
	movgu	%xcc,	%i7,	%i3
	edge32l	%l1,	%o1,	%l5
	fblg,a	%fcc1,	loop_2488
	prefetch	[%l7 + 0x58],	 0x1
	subcc	%g7,	0x1E7A,	%l4
	movrlz	%i0,	0x297,	%l3
loop_2488:
	tsubcc	%l6,	0x0C52,	%g2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x14] %asi,	%f23
	sllx	%g6,	%o3,	%o5
	nop
	set	0x2B, %i1
	ldstub	[%l7 + %i1],	%o2
	fmovsa	%icc,	%f1,	%f2
	edge32n	%o6,	%i6,	%i5
	set	0x56, %g7
	ldsha	[%l7 + %g7] 0x89,	%i4
	sdivx	%g4,	0x1507,	%o4
	umulcc	%l2,	0x19BE,	%g5
	mulscc	%o7,	0x0BCE,	%g3
	sth	%l0,	[%l7 + 0x58]
	edge8	%i2,	%g1,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o0,	%i7,	%i3
	fbul,a	%fcc0,	loop_2489
	nop
	setx	0x1687DA97C081385D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xCD0EB372B0AAED15,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f0,	%f12
	fmovdn	%icc,	%f14,	%f5
	edge8	%l1,	%o1,	%g7
loop_2489:
	tge	%xcc,	0x1
	smulcc	%l5,	0x08EE,	%i0
	be,a,pt	%icc,	loop_2490
	ldub	[%l7 + 0x5B],	%l4
	bne	%xcc,	loop_2491
	tleu	%icc,	0x4
loop_2490:
	sir	0x19C3
	bn,a,pn	%xcc,	loop_2492
loop_2491:
	edge16	%l3,	%l6,	%g6
	movne	%icc,	%g2,	%o3
	sll	%o2,	0x13,	%o6
loop_2492:
	movrlez	%o5,	%i5,	%i4
	edge32	%g4,	%o4,	%i6
	ldd	[%l7 + 0x50],	%f18
	stb	%g5,	[%l7 + 0x51]
	movrne	%o7,	0x1BD,	%g3
	fzero	%f18
	or	%l0,	%l2,	%i2
	sdivx	%i1,	0x0870,	%g1
	movrgz	%o0,	%i7,	%l1
	srl	%o1,	%g7,	%i3
	tge	%icc,	0x1
	fcmpeq16	%f18,	%f22,	%l5
	fcmple32	%f10,	%f30,	%i0
	ldsw	[%l7 + 0x1C],	%l4
	brz	%l6,	loop_2493
	addc	%l3,	0x126B,	%g2
	edge32n	%o3,	%o2,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2493:
	fornot2	%f6,	%f26,	%f2
	fbuge,a	%fcc1,	loop_2494
	fmovdn	%icc,	%f28,	%f8
	ta	%icc,	0x6
	mulx	%g6,	%o5,	%i4
loop_2494:
	tge	%xcc,	0x3
	bg,a,pn	%xcc,	loop_2495
	alignaddrl	%g4,	%i5,	%i6
	fmovrdgz	%g5,	%f28,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2495:
	xor	%o7,	0x0CEA,	%g3
	fcmpne32	%f26,	%f16,	%l0
	nop
	setx loop_2496, %l0, %l1
	jmpl %l1, %o4
	xnorcc	%l2,	0x0FEF,	%i2
	movrne	%g1,	%o0,	%i1
	addcc	%l1,	0x0827,	%i7
loop_2496:
	andcc	%g7,	%o1,	%i3
	movpos	%icc,	%l5,	%i0
	fmovdvs	%xcc,	%f8,	%f20
	tsubcctv	%l6,	0x1D73,	%l4
	fmovs	%f18,	%f13
	fbo,a	%fcc1,	loop_2497
	bpos,a,pt	%icc,	loop_2498
	movvc	%icc,	%g2,	%o3
	taddcc	%l3,	0x1CA4,	%o6
loop_2497:
	st	%f8,	[%l7 + 0x7C]
loop_2498:
	orn	%o2,	%o5,	%g6
	sll	%g4,	0x1D,	%i5
	sra	%i6,	%g5,	%o7
	fbu,a	%fcc3,	loop_2499
	sir	0x0B08
	subc	%g3,	%i4,	%o4
	tneg	%icc,	0x6
loop_2499:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a,pt	%xcc,	loop_2500
	sethi	0x173D,	%l0
	fmovdneg	%xcc,	%f0,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2500:
	ta	%xcc,	0x2
	nop
	setx	0x86787E6697F15616,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x73B6B354179EAFBF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f22,	%f26
	bleu,pt	%xcc,	loop_2501
	xnor	%i2,	0x065B,	%g1
	sdiv	%o0,	0x03EC,	%l2
	movrne	%l1,	0x0E3,	%i7
loop_2501:
	ble,a	loop_2502
	fmovrse	%i1,	%f5,	%f17
	tpos	%xcc,	0x0
	fbu,a	%fcc1,	loop_2503
loop_2502:
	ble	loop_2504
	tge	%xcc,	0x1
	array16	%g7,	%o1,	%i3
loop_2503:
	srl	%l5,	0x09,	%l6
loop_2504:
	bvs	%xcc,	loop_2505
	edge8l	%l4,	%i0,	%g2
	movrlz	%l3,	%o3,	%o6
	movle	%xcc,	%o2,	%o5
loop_2505:
	sra	%g6,	0x18,	%i5
	smul	%i6,	0x1285,	%g5
	fmovrdne	%o7,	%f10,	%f20
	fnot1	%f16,	%f16
	fbge	%fcc1,	loop_2506
	tneg	%icc,	0x1
	or	%g3,	0x0137,	%i4
	bg,a,pn	%icc,	loop_2507
loop_2506:
	fmul8sux16	%f2,	%f4,	%f30
	orcc	%o4,	0x09A0,	%g4
	fpadd16	%f16,	%f0,	%f16
loop_2507:
	srlx	%i2,	0x1F,	%l0
	fbug	%fcc3,	loop_2508
	udivx	%o0,	0x183A,	%l2
	flush	%l7 + 0x4C
	sdivcc	%l1,	0x0069,	%g1
loop_2508:
	umulcc	%i7,	%i1,	%o1
	edge8n	%i3,	%g7,	%l5
	fmovsvs	%xcc,	%f5,	%f3
	movrne	%l4,	0x06B,	%i0
	fmovrse	%l6,	%f5,	%f9
	fmovda	%xcc,	%f20,	%f25
	fbo,a	%fcc3,	loop_2509
	or	%g2,	%l3,	%o3
	fmovrdne	%o6,	%f20,	%f20
	fmovdcc	%xcc,	%f21,	%f31
loop_2509:
	subcc	%o5,	0x0324,	%g6
	brz,a	%i5,	loop_2510
	movn	%icc,	%i6,	%g5
	bne,a	%icc,	loop_2511
	bcc,pt	%icc,	loop_2512
loop_2510:
	tneg	%xcc,	0x4
	tl	%icc,	0x6
loop_2511:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x3
loop_2512:
	fpsub32s	%f2,	%f18,	%f29
	edge8n	%g3,	%o2,	%o4
	movrlz	%g4,	0x077,	%i2
	fnegs	%f27,	%f17
	fandnot2	%f18,	%f6,	%f0
	edge8	%l0,	%o0,	%i4
	tcc	%icc,	0x0
	add	%l1,	%l2,	%i7
	movrgez	%g1,	0x3E4,	%i1
	fmul8x16	%f11,	%f28,	%f10
	tcc	%icc,	0x5
	sra	%i3,	0x12,	%g7
	tcs	%icc,	0x5
	tle	%xcc,	0x2
	fmovrdlz	%l5,	%f8,	%f24
	swap	[%l7 + 0x60],	%l4
	mulx	%i0,	0x1277,	%o1
	movrlez	%g2,	%l6,	%l3
	sir	0x04FB
	sllx	%o3,	%o5,	%o6
	edge8n	%g6,	%i5,	%g5
	bneg,pt	%icc,	loop_2513
	srlx	%o7,	0x03,	%g3
	flush	%l7 + 0x30
	ta	%icc,	0x2
loop_2513:
	xorcc	%o2,	%i6,	%o4
	umulcc	%g4,	%l0,	%o0
	movvs	%xcc,	%i4,	%i2
	fba,a	%fcc3,	loop_2514
	nop
	setx	0x166C02FE13E8E727,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x86B902DEB64B6FE7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f16,	%f30
	array32	%l2,	%l1,	%g1
	fmuld8ulx16	%f6,	%f29,	%f18
loop_2514:
	movre	%i1,	0x084,	%i7
	edge32ln	%g7,	%i3,	%l5
	fpsub32s	%f26,	%f26,	%f31
	andncc	%i0,	%o1,	%l4
	movcs	%icc,	%g2,	%l3
	sll	%o3,	%o5,	%l6
	umul	%g6,	%o6,	%g5
	sdivx	%i5,	0x1B16,	%g3
	tg	%xcc,	0x1
	tsubcctv	%o2,	0x15D7,	%o7
	or	%o4,	0x1573,	%i6
	ble,a	%xcc,	loop_2515
	ldd	[%l7 + 0x50],	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g4,	[%l7 + 0x3D]
loop_2515:
	or	%l0,	0x0323,	%i4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%l2
	nop
	setx loop_2516, %l0, %l1
	jmpl %l1, %i2
	bl,pn	%icc,	loop_2517
	edge16n	%l1,	%i1,	%g1
	orn	%i7,	0x0FE5,	%i3
loop_2516:
	edge8l	%l5,	%i0,	%g7
loop_2517:
	edge32	%o1,	%l4,	%l3
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g2
	be,a,pn	%icc,	loop_2518
	sllx	%o5,	%l6,	%g6
	tcs	%xcc,	0x1
	fnands	%f13,	%f10,	%f7
loop_2518:
	mulx	%o3,	%o6,	%g5
	tvc	%xcc,	0x0
	nop
	setx	0xBEDA7F479E5891C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x991000C4EACBFA43,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f16,	%f24
	movrlez	%i5,	%g3,	%o7
	edge16ln	%o2,	%i6,	%g4
	fbul,a	%fcc2,	loop_2519
	alignaddrl	%l0,	%o4,	%i4
	fbue,a	%fcc1,	loop_2520
	fmul8x16	%f22,	%f0,	%f12
loop_2519:
	andn	%l2,	%o0,	%l1
	movge	%icc,	%i2,	%i1
loop_2520:
	nop
	wr	%g0,	0xeb,	%asi
	stha	%g1,	[%l7 + 0x6A] %asi
	membar	#Sync
	tleu	%xcc,	0x3
	edge8l	%i7,	%i3,	%i0
	ba	%xcc,	loop_2521
	movvs	%xcc,	%l5,	%g7
	brnz,a	%l4,	loop_2522
	fmovdgu	%xcc,	%f13,	%f9
loop_2521:
	fands	%f12,	%f3,	%f31
	st	%f5,	[%l7 + 0x3C]
loop_2522:
	nop
	fitos	%f13,	%f30
	fstox	%f30,	%f28
	fbn	%fcc3,	loop_2523
	edge8	%o1,	%g2,	%o5
	call	loop_2524
	fmovd	%f24,	%f8
loop_2523:
	movrlez	%l6,	0x1D6,	%l3
	srax	%o3,	0x1C,	%o6
loop_2524:
	edge8	%g6,	%g5,	%g3
	nop
	setx	0xD50568592855AA6F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xFE6FDA39F46DF667,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f18,	%f24
	for	%f0,	%f24,	%f14
	tle	%xcc,	0x4
	bcc,a	%xcc,	loop_2525
	andcc	%i5,	0x09DA,	%o2
	ld	[%l7 + 0x74],	%f18
	fmovsgu	%xcc,	%f17,	%f21
loop_2525:
	fxor	%f12,	%f22,	%f16
	fmovdn	%xcc,	%f8,	%f23
	popc	%i6,	%g4
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l0
	sethi	0x072F,	%o7
	brlz,a	%i4,	loop_2526
	nop
	fitod	%f12,	%f26
	fdtoi	%f26,	%f9
	edge32l	%o4,	%l2,	%l1
	fbule,a	%fcc1,	loop_2527
loop_2526:
	fmovsneg	%icc,	%f26,	%f15
	tneg	%icc,	0x5
	subcc	%i2,	%i1,	%o0
loop_2527:
	subccc	%g1,	0x18A1,	%i3
	fbug	%fcc3,	loop_2528
	fsrc2s	%f10,	%f10
	faligndata	%f4,	%f20,	%f28
	tl	%xcc,	0x0
loop_2528:
	tle	%xcc,	0x7
	fbn,a	%fcc3,	loop_2529
	smulcc	%i7,	0x07C3,	%l5
	movl	%icc,	%i0,	%l4
	edge8n	%g7,	%o1,	%g2
loop_2529:
	nop
	set	0x47, %g2
	lduba	[%l7 + %g2] 0x0c,	%o5
	popc	0x0B91,	%l6
	brgz	%l3,	loop_2530
	edge16l	%o6,	%o3,	%g6
	ldd	[%l7 + 0x70],	%g4
	edge32l	%i5,	%o2,	%i6
loop_2530:
	edge32	%g3,	%l0,	%g4
	addc	%o7,	0x03D0,	%o4
	ldstub	[%l7 + 0x51],	%i4
	srl	%l1,	0x03,	%i2
	nop
	setx	0x34973647805A5C82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	orcc	%l2,	0x0FEB,	%o0
	nop
	fitod	%f8,	%f14
	fblg	%fcc1,	loop_2531
	fmul8ulx16	%f16,	%f16,	%f26
	movrgz	%i1,	0x246,	%g1
	tpos	%icc,	0x5
loop_2531:
	fmovspos	%icc,	%f30,	%f16
	movpos	%icc,	%i7,	%i3
	membar	0x30
	movvc	%xcc,	%l5,	%l4
	tsubcc	%i0,	0x1714,	%o1
	umulcc	%g7,	0x1EDF,	%o5
	bne,a,pt	%icc,	loop_2532
	fabsd	%f24,	%f26
	edge32	%l6,	%g2,	%l3
	xorcc	%o3,	%o6,	%g6
loop_2532:
	stb	%g5,	[%l7 + 0x7B]
	movneg	%icc,	%i5,	%i6
	nop
	fitod	%f4,	%f10
	fdtoi	%f10,	%f9
	fmovdge	%icc,	%f31,	%f18
	movne	%icc,	%g3,	%o2
	srax	%g4,	0x01,	%l0
	fnor	%f22,	%f26,	%f2
	movle	%icc,	%o4,	%o7
	set	0x60, %o3
	lda	[%l7 + %o3] 0x18,	%f31
	fbuge	%fcc3,	loop_2533
	movl	%xcc,	%l1,	%i4
	orcc	%i2,	0x063A,	%l2
	set	0x78, %i6
	lduha	[%l7 + %i6] 0x89,	%o0
loop_2533:
	nop
	setx	0xC71E63566B2BEA9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x61F16F10D54502DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f8,	%f20
	tcc	%xcc,	0x3
	edge32n	%i1,	%g1,	%i3
	orncc	%l5,	%i7,	%l4
	popc	0x0E79,	%o1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x70] %asi,	%g7
	tg	%xcc,	0x5
	tvc	%xcc,	0x4
	move	%icc,	%i0,	%l6
	fmovrdgz	%g2,	%f12,	%f26
	edge32ln	%o5,	%l3,	%o3
	fmuld8sux16	%f10,	%f29,	%f22
	fpadd16	%f2,	%f14,	%f26
	addcc	%o6,	%g6,	%g5
	srax	%i6,	0x0F,	%i5
	array8	%g3,	%g4,	%l0
	ldd	[%l7 + 0x08],	%f16
	move	%icc,	%o2,	%o7
	andcc	%o4,	%l1,	%i2
	nop
	setx	0x7CBA4B38A0450FB7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	tsubcctv	%l2,	%i4,	%o0
	nop
	setx	loop_2534,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpne32	%f18,	%f22,	%g1
	taddcc	%i3,	%i1,	%i7
	alignaddrl	%l5,	%o1,	%l4
loop_2534:
	fsrc1s	%f17,	%f11
	taddcc	%i0,	%l6,	%g7
	edge8l	%o5,	%l3,	%g2
	st	%f20,	[%l7 + 0x30]
	call	loop_2535
	fbge,a	%fcc0,	loop_2536
	orcc	%o3,	%g6,	%o6
	edge16n	%g5,	%i5,	%g3
loop_2535:
	sub	%i6,	%l0,	%g4
loop_2536:
	fmovrdne	%o2,	%f6,	%f12
	xor	%o4,	%l1,	%o7
	fmovrdlez	%l2,	%f12,	%f30
	movcc	%icc,	%i4,	%i2
	ble,pn	%icc,	loop_2537
	tsubcctv	%o0,	%i3,	%g1
	wr	%g0,	0x81,	%asi
	stba	%i7,	[%l7 + 0x10] %asi
loop_2537:
	movre	%l5,	%i1,	%l4
	fmul8sux16	%f26,	%f16,	%f2
	orcc	%i0,	0x1A45,	%l6
	edge32l	%g7,	%o5,	%l3
	udivcc	%g2,	0x1711,	%o3
	sra	%g6,	%o1,	%o6
	movvc	%icc,	%g5,	%i5
	set	0x60, %i0
	ldxa	[%l7 + %i0] 0x11,	%i6
	subc	%l0,	0x14CE,	%g3
	movrgez	%g4,	0x2FC,	%o2
	fmovrse	%o4,	%f20,	%f8
	fbge	%fcc0,	loop_2538
	movne	%xcc,	%o7,	%l1
	fbule	%fcc1,	loop_2539
	andcc	%l2,	0x11AB,	%i4
loop_2538:
	srl	%o0,	0x15,	%i3
	set	0x70, %l5
	prefetcha	[%l7 + %l5] 0x11,	 0x2
loop_2539:
	tsubcctv	%g1,	%l5,	%i7
	movrne	%l4,	0x04B,	%i1
	tvc	%xcc,	0x0
	fmovdneg	%xcc,	%f4,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l6,	0x1097,	%g7
	movn	%xcc,	%o5,	%i0
	fornot2s	%f12,	%f25,	%f19
	taddcc	%l3,	%g2,	%g6
	movcs	%icc,	%o1,	%o3
	addc	%g5,	%i5,	%i6
	wr	%g0,	0xea,	%asi
	stxa	%o6,	[%l7 + 0x10] %asi
	membar	#Sync
	tsubcc	%l0,	0x0FBB,	%g3
	movne	%icc,	%o2,	%o4
	movg	%icc,	%g4,	%o7
	fmovsg	%xcc,	%f9,	%f9
	stbar
	fmul8sux16	%f18,	%f16,	%f0
	fpmerge	%f22,	%f24,	%f6
	bleu,a,pn	%xcc,	loop_2540
	taddcctv	%l2,	%i4,	%l1
	sll	%o0,	%i2,	%g1
	tn	%icc,	0x3
loop_2540:
	nop
	set	0x1C, %o2
	swapa	[%l7 + %o2] 0x0c,	%i3
	fands	%f13,	%f1,	%f26
	tn	%xcc,	0x4
	subccc	%l5,	0x0B70,	%i7
	srl	%i1,	%l4,	%l6
	fornot1s	%f18,	%f18,	%f28
	fble,a	%fcc2,	loop_2541
	edge8l	%o5,	%g7,	%i0
	fsrc2s	%f18,	%f22
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x89,	%l3,	%g6
loop_2541:
	sll	%g2,	0x07,	%o3
	sra	%g5,	%i5,	%o1
	edge32n	%i6,	%o6,	%l0
	array8	%g3,	%o4,	%o2
	tge	%xcc,	0x5
	call	loop_2542
	tleu	%xcc,	0x3
	tcs	%icc,	0x7
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x28] %asi,	%g4
loop_2542:
	brgez,a	%o7,	loop_2543
	array8	%i4,	%l1,	%l2
	udivcc	%i2,	0x1B47,	%o0
	ta	%xcc,	0x6
loop_2543:
	edge16ln	%i3,	%g1,	%i7
	nop
	setx	0xB9628B26BB0AF87E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x5D9C43FB4C9FADE8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f22,	%f12
	te	%icc,	0x6
	fblg,a	%fcc3,	loop_2544
	andcc	%i1,	%l4,	%l6
	and	%l5,	0x10DA,	%o5
	sub	%g7,	0x1EA7,	%i0
loop_2544:
	mulscc	%l3,	%g2,	%g6
	ble,a	loop_2545
	movneg	%icc,	%g5,	%i5
	mulx	%o1,	0x1350,	%o3
	alignaddrl	%i6,	%o6,	%g3
loop_2545:
	ble,a	loop_2546
	nop
	setx	0xA332E5A580EB9A3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f22
	ld	[%l7 + 0x64],	%f1
	movpos	%xcc,	%l0,	%o2
loop_2546:
	prefetch	[%l7 + 0x14],	 0x1
	array32	%o4,	%g4,	%o7
	xorcc	%i4,	0x1B73,	%l1
	tn	%icc,	0x3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x5C] %asi,	%f22
	fble,a	%fcc2,	loop_2547
	pdist	%f6,	%f16,	%f18
	fbge,a	%fcc1,	loop_2548
	fbg	%fcc1,	loop_2549
loop_2547:
	bl,pn	%xcc,	loop_2550
	srax	%i2,	%l2,	%o0
loop_2548:
	alignaddrl	%i3,	%g1,	%i7
loop_2549:
	andn	%i1,	%l4,	%l6
loop_2550:
	stb	%l5,	[%l7 + 0x25]
	be,a	loop_2551
	nop
	setx loop_2552, %l0, %l1
	jmpl %l1, %o5
	srl	%g7,	%l3,	%g2
	movne	%icc,	%i0,	%g5
loop_2551:
	umul	%i5,	0x1973,	%g6
loop_2552:
	fbug,a	%fcc3,	loop_2553
	movvs	%xcc,	%o3,	%i6
	ldd	[%l7 + 0x18],	%o0
	edge32	%o6,	%l0,	%g3
loop_2553:
	fmovse	%xcc,	%f3,	%f5
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%f24
	brlez,a	%o2,	loop_2554
	move	%xcc,	%g4,	%o4
	array8	%o7,	%l1,	%i2
	ldd	[%l7 + 0x78],	%f0
loop_2554:
	nop
	set	0x52, %i4
	stba	%i4,	[%l7 + %i4] 0x04
	edge32l	%l2,	%o0,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%xcc,	%f1,	%f6
	edge8n	%i7,	%i1,	%l4
	fmovrdlz	%l6,	%f6,	%f26
	fornot2	%f2,	%f20,	%f16
	movg	%xcc,	%g1,	%l5
	fblg,a	%fcc2,	loop_2555
	mova	%xcc,	%g7,	%o5
	ba	loop_2556
	fbe,a	%fcc3,	loop_2557
loop_2555:
	nop
	setx	0xD118C72B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f4
	brlz,a	%g2,	loop_2558
loop_2556:
	array8	%l3,	%g5,	%i5
loop_2557:
	ta	%icc,	0x6
	tcs	%icc,	0x1
loop_2558:
	tg	%icc,	0x0
	movrlz	%i0,	%o3,	%g6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%o1
	wr	%g0,	0x04,	%asi
	sta	%f14,	[%l7 + 0x70] %asi
	sth	%i6,	[%l7 + 0x2C]
	edge32n	%o6,	%l0,	%o2
	stx	%g3,	[%l7 + 0x40]
	sdivx	%g4,	0x19BA,	%o7
	orncc	%l1,	0x18B3,	%i2
	umulcc	%o4,	%i4,	%l2
	ld	[%l7 + 0x2C],	%f8
	movpos	%xcc,	%i3,	%i7
	edge16	%i1,	%o0,	%l4
	addccc	%g1,	%l5,	%g7
	andncc	%l6,	%o5,	%l3
	be	loop_2559
	fmovrdgez	%g2,	%f30,	%f14
	array8	%i5,	%i0,	%o3
	nop
	setx	0x1F32CDD3F32CE05C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x7EC1A40E9D7CBB2A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f4,	%f2
loop_2559:
	subcc	%g6,	0x10B6,	%o1
	fba,a	%fcc3,	loop_2560
	ldsw	[%l7 + 0x50],	%i6
	taddcc	%o6,	%g5,	%l0
	edge32l	%g3,	%g4,	%o2
loop_2560:
	bneg	loop_2561
	fpack16	%f22,	%f17
	fmul8ulx16	%f26,	%f14,	%f16
	edge16l	%o7,	%i2,	%l1
loop_2561:
	xorcc	%i4,	0x0AA9,	%l2
	fmovrslez	%i3,	%f22,	%f25
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x19,	%i7
	add	%o4,	0x0905,	%o0
	fpsub16s	%f5,	%f18,	%f11
	fmuld8ulx16	%f16,	%f16,	%f16
	alignaddrl	%l4,	%g1,	%l5
	bcc,pt	%xcc,	loop_2562
	fbne,a	%fcc1,	loop_2563
	movgu	%xcc,	%g7,	%i1
	bgu	loop_2564
loop_2562:
	smulcc	%o5,	%l6,	%l3
loop_2563:
	sra	%g2,	0x00,	%i5
	taddcc	%o3,	%g6,	%i0
loop_2564:
	fmovsvs	%xcc,	%f3,	%f22
	andcc	%i6,	0x17CE,	%o1
	be,a	%xcc,	loop_2565
	nop
	setx	0x5959C6E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xF3C661A5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f25,	%f0
	edge32l	%g5,	%o6,	%l0
	mulx	%g4,	0x1BDC,	%g3
loop_2565:
	bl,a,pn	%icc,	loop_2566
	movn	%icc,	%o7,	%o2
	subc	%i2,	0x09FE,	%l1
	fmovrsgez	%i4,	%f8,	%f4
loop_2566:
	ldstub	[%l7 + 0x55],	%i3
	mova	%icc,	%i7,	%l2
	fmovda	%icc,	%f14,	%f3
	edge8	%o0,	%o4,	%l4
	bpos	loop_2567
	fbue	%fcc3,	loop_2568
	fors	%f31,	%f19,	%f22
	brz	%l5,	loop_2569
loop_2567:
	sdivx	%g7,	0x06DA,	%i1
loop_2568:
	fbg,a	%fcc3,	loop_2570
	edge8l	%o5,	%l6,	%l3
loop_2569:
	tsubcc	%g2,	0x0614,	%g1
	fabsd	%f26,	%f30
loop_2570:
	fnors	%f19,	%f26,	%f22
	array8	%i5,	%g6,	%o3
	tneg	%icc,	0x0
	srax	%i6,	0x12,	%o1
	bn	loop_2571
	brlz,a	%g5,	loop_2572
	fmovrdgez	%o6,	%f14,	%f18
	fone	%f14
loop_2571:
	fsrc1	%f14,	%f14
loop_2572:
	array32	%i0,	%g4,	%l0
	membar	0x3D
	edge32	%g3,	%o7,	%i2
	edge32l	%o2,	%i4,	%l1
	edge8l	%i7,	%l2,	%o0
	ble,a,pt	%icc,	loop_2573
	mulx	%o4,	0x1A7E,	%l4
	pdist	%f24,	%f8,	%f8
	set	0x2C, %o0
	lduwa	[%l7 + %o0] 0x04,	%l5
loop_2573:
	addc	%g7,	0x1674,	%i3
	nop
	setx	0x5042D218,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	sdivcc	%o5,	0x1E1B,	%i1
	nop
	setx	0xE50F7B3ED0624143,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fmul8x16au	%f29,	%f26,	%f8
	add	%l6,	0x035A,	%l3
	fabss	%f28,	%f6
	array32	%g2,	%g1,	%g6
	wr	%g0,	0x18,	%asi
	stba	%o3,	[%l7 + 0x7D] %asi
	movrlz	%i5,	0x323,	%i6
	nop
	setx	0x17B5F599,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xCB0434FE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f14,	%f9
	edge32l	%o1,	%o6,	%i0
	sra	%g4,	%g5,	%l0
	xnor	%o7,	%i2,	%o2
	array16	%g3,	%l1,	%i4
	set	0x18, %l0
	stha	%l2,	[%l7 + %l0] 0x81
	taddcctv	%i7,	%o0,	%o4
	nop
	fitos	%f7,	%f13
	fstox	%f13,	%f10
	fxtos	%f10,	%f30
	set	0x44, %l4
	swapa	[%l7 + %l4] 0x80,	%l4
	movg	%icc,	%g7,	%l5
	edge32	%o5,	%i3,	%l6
	fble	%fcc2,	loop_2574
	tvc	%xcc,	0x6
	fmovscs	%xcc,	%f4,	%f21
	edge8	%l3,	%i1,	%g2
loop_2574:
	addc	%g6,	0x1A17,	%g1
	movl	%icc,	%i5,	%i6
	set	0x54, %o4
	stwa	%o1,	[%l7 + %o4] 0xe3
	membar	#Sync
	nop
	setx	0x3183190D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x7E05AEA6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f17,	%f13
	tl	%xcc,	0x6
	addcc	%o6,	0x048E,	%i0
	andn	%g4,	%g5,	%o3
	movneg	%xcc,	%l0,	%i2
	ba,pn	%xcc,	loop_2575
	sra	%o7,	0x0F,	%g3
	ta	%xcc,	0x1
	xnorcc	%o2,	0x0BB0,	%l1
loop_2575:
	xnor	%l2,	0x0790,	%i4
	alignaddrl	%i7,	%o0,	%o4
	nop
	setx	0x912A2B0E76986194,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x9541E751270043E2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f26,	%f8
	movg	%xcc,	%g7,	%l5
	bneg	loop_2576
	edge8n	%l4,	%o5,	%i3
	nop
	setx	0x31CA37755E4D6118,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xBBC2484DA9151083,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f12,	%f16
	edge32	%l3,	%i1,	%g2
loop_2576:
	ldx	[%l7 + 0x70],	%l6
	bshuffle	%f10,	%f30,	%f30
	edge8	%g6,	%g1,	%i5
	movre	%o1,	0x3D4,	%o6
	srlx	%i6,	%g4,	%g5
	bg,a,pt	%xcc,	loop_2577
	smul	%i0,	0x0F29,	%l0
	brgez,a	%i2,	loop_2578
	std	%f30,	[%l7 + 0x28]
loop_2577:
	bvc,pt	%icc,	loop_2579
	tvc	%xcc,	0x4
loop_2578:
	bge,pt	%icc,	loop_2580
	fnands	%f26,	%f10,	%f8
loop_2579:
	tcc	%icc,	0x0
	edge32n	%o7,	%g3,	%o3
loop_2580:
	movle	%xcc,	%o2,	%l2
	mova	%xcc,	%i4,	%i7
	tcc	%xcc,	0x1
	xnorcc	%l1,	%o4,	%o0
	ble	loop_2581
	call	loop_2582
	fornot1	%f22,	%f26,	%f28
	udivcc	%l5,	0x07BB,	%l4
loop_2581:
	fba,a	%fcc2,	loop_2583
loop_2582:
	fors	%f2,	%f31,	%f27
	fmul8x16al	%f12,	%f29,	%f24
	nop
	setx	0xEFF5F3FF1054E401,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_2583:
	alignaddr	%o5,	%i3,	%g7
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x14] %asi,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%g2,	%l3
	set	0x7E, %o1
	lduba	[%l7 + %o1] 0x11,	%l6
	edge32n	%g1,	%i5,	%o1
	fmovda	%xcc,	%f17,	%f26
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x88
	umulcc	%o6,	%g6,	%i6
	udivcc	%g4,	0x1187,	%i0
	fmul8x16al	%f31,	%f12,	%f26
	nop
	setx	loop_2584,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bshuffle	%f12,	%f26,	%f10
	andncc	%g5,	%i2,	%o7
	fmovrdlz	%g3,	%f30,	%f20
loop_2584:
	movvs	%xcc,	%l0,	%o2
	umulcc	%l2,	0x1851,	%o3
	fandnot1	%f6,	%f20,	%f0
	sdivcc	%i7,	0x162A,	%l1
	edge8ln	%i4,	%o0,	%l5
	faligndata	%f8,	%f22,	%f22
	st	%f6,	[%l7 + 0x54]
	fandnot1	%f0,	%f28,	%f12
	udiv	%o4,	0x070E,	%l4
	nop
	setx	0x33D67436FFCA3043,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x30CD257B0A961074,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f12,	%f12
	subc	%o5,	%g7,	%i1
	nop
	set	0x16, %i5
	ldsh	[%l7 + %i5],	%g2
	sll	%l3,	%i3,	%l6
	fcmple32	%f18,	%f28,	%g1
	xorcc	%i5,	0x1547,	%o6
	edge32l	%g6,	%i6,	%g4
	bge,pt	%xcc,	loop_2585
	tvs	%xcc,	0x5
	xnorcc	%o1,	0x0858,	%i0
	ldd	[%l7 + 0x38],	%f24
loop_2585:
	tn	%icc,	0x5
	andncc	%i2,	%o7,	%g3
	fmovsleu	%xcc,	%f11,	%f29
	fbn	%fcc0,	loop_2586
	umul	%l0,	%o2,	%g5
	sdivcc	%o3,	0x1C4B,	%l2
	fmovse	%xcc,	%f30,	%f6
loop_2586:
	fands	%f2,	%f0,	%f12
	tvs	%icc,	0x6
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x16,	%f16
	fsrc2s	%f17,	%f4
	ta	%xcc,	0x6
	fmovsneg	%icc,	%f17,	%f5
	fandnot2	%f6,	%f22,	%f24
	sllx	%l1,	0x05,	%i4
	udivcc	%o0,	0x15CD,	%l5
	bleu,a	loop_2587
	tne	%icc,	0x6
	subc	%i7,	%o4,	%o5
	tneg	%icc,	0x0
loop_2587:
	movneg	%icc,	%l4,	%g7
	fcmpne16	%f14,	%f8,	%g2
	sub	%i1,	0x15D4,	%i3
	fornot1	%f4,	%f8,	%f18
	bgu,pt	%icc,	loop_2588
	tleu	%icc,	0x1
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x42] %asi,	%l3
loop_2588:
	tl	%icc,	0x0
	tcs	%icc,	0x6
	wr	%g0,	0x81,	%asi
	sta	%f21,	[%l7 + 0x74] %asi
	array8	%l6,	%g1,	%i5
	mulx	%o6,	%i6,	%g6
	set	0x64, %g3
	sta	%f28,	[%l7 + %g3] 0x15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo,a	%fcc3,	loop_2589
	tsubcctv	%g4,	0x1567,	%i0
	tn	%xcc,	0x1
	edge32n	%o1,	%o7,	%i2
loop_2589:
	edge32l	%g3,	%l0,	%o2
	fmovrsne	%o3,	%f25,	%f31
	mulscc	%g5,	%l2,	%l1
	tpos	%xcc,	0x4
	bn	loop_2590
	taddcctv	%o0,	%i4,	%i7
	fnegs	%f4,	%f21
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f22
	fxtod	%f22,	%f2
loop_2590:
	umul	%o4,	0x090D,	%l5
	popc	0x1CCD,	%o5
	subccc	%l4,	%g2,	%g7
	fmovsvc	%xcc,	%f14,	%f1
	umulcc	%i1,	%l3,	%i3
	ldsh	[%l7 + 0x5A],	%l6
	tvs	%icc,	0x3
	nop
	fitod	%f4,	%f26
	fdtos	%f26,	%f29
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f2
	fxtos	%f2,	%f20
	nop
	setx	loop_2591,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	faligndata	%f28,	%f0,	%f26
	fxnors	%f22,	%f3,	%f7
	membar	0x25
loop_2591:
	movre	%g1,	%i5,	%o6
	sethi	0x0D53,	%g6
	tge	%icc,	0x6
	tge	%xcc,	0x2
	taddcc	%g4,	0x1B56,	%i6
	ldstub	[%l7 + 0x4F],	%i0
	fmovrsgez	%o7,	%f4,	%f11
	edge16ln	%i2,	%o1,	%l0
	tg	%icc,	0x2
	brgez,a	%g3,	loop_2592
	stw	%o3,	[%l7 + 0x0C]
	fbg,a	%fcc2,	loop_2593
	movrne	%o2,	0x34D,	%g5
loop_2592:
	stbar
	tneg	%xcc,	0x3
loop_2593:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x89,	%l1,	%l2
	fmovsle	%icc,	%f13,	%f7
	fmovsleu	%xcc,	%f18,	%f19
	flush	%l7 + 0x58
	fmovsl	%xcc,	%f27,	%f11
	nop
	fitod	%f2,	%f10
	fdtos	%f10,	%f6
	srlx	%o0,	0x01,	%i7
	brnz,a	%i4,	loop_2594
	ble	%xcc,	loop_2595
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_2596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2594:
	tg	%xcc,	0x2
loop_2595:
	fbn,a	%fcc0,	loop_2597
	fbo,a	%fcc0,	loop_2598
loop_2596:
	movpos	%icc,	%o4,	%o5
	set	0x1C, %l6
	stha	%l5,	[%l7 + %l6] 0x18
loop_2597:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g2,	%l4
loop_2598:
	xorcc	%i1,	%g7,	%i3
	call	loop_2599
	smulcc	%l6,	0x06E0,	%g1
	set	0x40, %l2
	stxa	%l3,	[%l7 + %l2] 0x2f
	membar	#Sync
loop_2599:
	ld	[%l7 + 0x64],	%f6
	xorcc	%i5,	%o6,	%g4
	edge32	%g6,	%i0,	%i6
	te	%icc,	0x1
	tn	%xcc,	0x2
	movrgz	%o7,	%i2,	%o1
	movcc	%xcc,	%g3,	%o3
	brgez	%o2,	loop_2600
	brlez	%l0,	loop_2601
	tvc	%xcc,	0x3
	fbo	%fcc2,	loop_2602
loop_2600:
	st	%f26,	[%l7 + 0x64]
loop_2601:
	edge16n	%l1,	%l2,	%g5
	tgu	%xcc,	0x2
loop_2602:
	nop
	set	0x16, %l3
	stba	%o0,	[%l7 + %l3] 0xe2
	membar	#Sync
	sdiv	%i7,	0x00BD,	%o4
	srl	%i4,	0x1E,	%o5
	udivcc	%l5,	0x0436,	%l4
	subc	%i1,	%g7,	%g2
	fpmerge	%f15,	%f3,	%f22
	fmul8sux16	%f28,	%f12,	%f0
	edge16ln	%l6,	%g1,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i3,	%i5,	%g4
	brgz	%g6,	loop_2603
	movge	%xcc,	%i0,	%o6
	tsubcc	%i6,	0x04EA,	%o7
	be,pn	%icc,	loop_2604
loop_2603:
	edge16l	%i2,	%g3,	%o1
	tle	%xcc,	0x7
	edge16	%o2,	%o3,	%l1
loop_2604:
	nop
	set	0x64, %o6
	ldsha	[%l7 + %o6] 0x10,	%l2
	bcs,pn	%xcc,	loop_2605
	fbg	%fcc2,	loop_2606
	or	%l0,	%g5,	%i7
	fmovsle	%xcc,	%f4,	%f23
loop_2605:
	brgez	%o0,	loop_2607
loop_2606:
	andcc	%i4,	%o4,	%o5
	std	%f18,	[%l7 + 0x40]
	fpmerge	%f1,	%f27,	%f2
loop_2607:
	nop
	fitod	%f0,	%f10
	fnegd	%f16,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%l4
	brz,a	%l5,	loop_2608
	tn	%xcc,	0x1
	edge8ln	%i1,	%g7,	%g2
	fmovsvc	%icc,	%f12,	%f21
loop_2608:
	sth	%l6,	[%l7 + 0x48]
	movleu	%icc,	%g1,	%i3
	fors	%f30,	%f18,	%f31
	array32	%l3,	%i5,	%g4
	movneg	%icc,	%g6,	%o6
	fbn	%fcc2,	loop_2609
	andncc	%i6,	%i0,	%o7
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2609:
	nop
	set	0x54, %o7
	ldsha	[%l7 + %o7] 0x19,	%i2
	tcc	%icc,	0x4
	xorcc	%g3,	0x04D1,	%o1
	tneg	%icc,	0x3
	movrlz	%o2,	0x0AD,	%o3
	tn	%xcc,	0x0
	tsubcctv	%l1,	0x09E6,	%l2
	fcmpne16	%f10,	%f20,	%l0
	fpadd32s	%f30,	%f20,	%f20
	xorcc	%i7,	0x191C,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i4,	%g5,	%o4
	bn,pt	%xcc,	loop_2610
	fmuld8sux16	%f3,	%f0,	%f30
	fbl	%fcc2,	loop_2611
	sth	%o5,	[%l7 + 0x1E]
loop_2610:
	tcc	%xcc,	0x4
	bne,pt	%icc,	loop_2612
loop_2611:
	orncc	%l5,	%i1,	%g7
	sethi	0x07E5,	%g2
	sir	0x0E43
loop_2612:
	movneg	%icc,	%l4,	%g1
	bvs	loop_2613
	fmuld8sux16	%f0,	%f27,	%f26
	fmovsne	%xcc,	%f24,	%f10
	smul	%i3,	%l3,	%l6
loop_2613:
	sdivx	%i5,	0x0799,	%g6
	nop
	setx	0x35273D29,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f1
	bvc,a	%icc,	loop_2614
	brgez,a	%g4,	loop_2615
	fnegs	%f29,	%f30
	movleu	%icc,	%i6,	%o6
loop_2614:
	edge32ln	%o7,	%i0,	%i2
loop_2615:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o1,	0x0597,	%o2
	edge8ln	%o3,	%g3,	%l1
	ldx	[%l7 + 0x08],	%l2
	movl	%icc,	%i7,	%o0
	tvc	%icc,	0x4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x38] %asi,	%f4
	edge32n	%i4,	%l0,	%o4
	array8	%o5,	%g5,	%i1
	sra	%l5,	0x02,	%g2
	ld	[%l7 + 0x64],	%f18
	fbge	%fcc3,	loop_2616
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l4,	%g1,	%i3
	be	%xcc,	loop_2617
loop_2616:
	movgu	%xcc,	%g7,	%l6
	fmovsa	%xcc,	%f11,	%f25
	mulscc	%l3,	%g6,	%g4
loop_2617:
	fbne,a	%fcc1,	loop_2618
	stbar
	fone	%f10
	sir	0x1F0C
loop_2618:
	tne	%icc,	0x0
	swap	[%l7 + 0x70],	%i6
	tle	%xcc,	0x2
	tle	%xcc,	0x2
	smulcc	%o6,	0x0215,	%o7
	nop
	fitos	%f3,	%f5
	fstod	%f5,	%f6
	fcmpgt16	%f12,	%f16,	%i5
	sth	%i0,	[%l7 + 0x48]
	mulscc	%i2,	0x0FA7,	%o1
	edge8	%o3,	%g3,	%o2
	popc	%l1,	%i7
	tsubcctv	%l2,	%i4,	%o0
	lduh	[%l7 + 0x24],	%l0
	sdivx	%o4,	0x014F,	%o5
	tcc	%icc,	0x4
	movne	%xcc,	%g5,	%i1
	fmovsvc	%icc,	%f13,	%f9
	addc	%l5,	0x0982,	%l4
	fmovdl	%xcc,	%f27,	%f18
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fnot1	%f26,	%f14
	fbg	%fcc3,	loop_2619
	tleu	%xcc,	0x1
	std	%f18,	[%l7 + 0x28]
	bl,a,pt	%icc,	loop_2620
loop_2619:
	sll	%g1,	0x02,	%i3
	nop
	setx	0x3859E84AE8A0F672,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x618DFAEB204AE061,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f8,	%f22
	set	0x6C, %i7
	ldsha	[%l7 + %i7] 0x80,	%g2
loop_2620:
	fblg	%fcc0,	loop_2621
	sir	0x1351
	tg	%icc,	0x0
	tne	%icc,	0x3
loop_2621:
	sub	%l6,	%l3,	%g7
	edge32n	%g4,	%i6,	%o6
	edge32	%g6,	%o7,	%i5
	edge16ln	%i0,	%o1,	%o3
	fsrc1s	%f7,	%f12
	add	%l7,	0x14,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i2,	%o2
	udivcc	%g3,	0x198A,	%i7
	tn	%xcc,	0x4
	tle	%xcc,	0x3
	nop
	setx	0x5F9AB437,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x0CB47B38,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f27,	%f19
	tleu	%xcc,	0x5
	membar	0x31
	sdiv	%l1,	0x12AA,	%i4
	sethi	0x14A5,	%o0
	ta	%icc,	0x0
	edge16l	%l0,	%l2,	%o5
	fone	%f26
	ldsw	[%l7 + 0x2C],	%g5
	movne	%icc,	%i1,	%l5
	stx	%l4,	[%l7 + 0x30]
	tsubcc	%o4,	0x1A35,	%i3
	andcc	%g2,	%l6,	%g1
	nop
	setx loop_2622, %l0, %l1
	jmpl %l1, %g7
	add	%l3,	0x038E,	%i6
	tcs	%xcc,	0x3
	xorcc	%g4,	0x028C,	%g6
loop_2622:
	alignaddr	%o6,	%o7,	%i5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%o3
	fmovsvc	%xcc,	%f18,	%f25
	nop
	setx	0x22621D42405A039F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%i0
	fmovdn	%icc,	%f6,	%f29
	edge8n	%i2,	%o2,	%g3
	fbne,a	%fcc0,	loop_2623
	nop
	setx	loop_2624,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sth	%l1,	[%l7 + 0x3C]
	sdivx	%i7,	0x1E1B,	%o0
loop_2623:
	bcs,pt	%icc,	loop_2625
loop_2624:
	tn	%xcc,	0x7
	tle	%icc,	0x6
	nop
	setx	0x00A760BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f6
loop_2625:
	movrgez	%l0,	0x121,	%l2
	udivx	%i4,	0x1241,	%g5
	fone	%f8
	sdiv	%o5,	0x0C3E,	%l5
	tpos	%icc,	0x2
	fmovsleu	%xcc,	%f21,	%f9
	bl	%icc,	loop_2626
	alignaddrl	%l4,	%o4,	%i3
	fone	%f18
	addccc	%i1,	0x09D9,	%l6
loop_2626:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x24] %asi,	%g1
	movrgez	%g2,	0x3E6,	%g7
	movge	%xcc,	%i6,	%l3
	ldd	[%l7 + 0x30],	%f14
	fmovrse	%g4,	%f31,	%f25
	fsrc1	%f8,	%f12
	tpos	%xcc,	0x5
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%o6
	srl	%o7,	%i5,	%o1
	movleu	%icc,	%o3,	%g6
	orcc	%i2,	0x16C3,	%o2
	sub	%g3,	0x1D40,	%i0
	tvc	%icc,	0x6
	bvs,pn	%xcc,	loop_2627
	be,a	loop_2628
	srl	%i7,	%o0,	%l1
	addccc	%l0,	%i4,	%g5
loop_2627:
	movne	%icc,	%o5,	%l5
loop_2628:
	tpos	%xcc,	0x6
	edge8ln	%l2,	%l4,	%i3
	ta	%xcc,	0x4
	orcc	%i1,	%o4,	%l6
	movl	%xcc,	%g1,	%g7
	tvs	%xcc,	0x5
	membar	0x5D
	mulscc	%g2,	%l3,	%g4
	nop
	setx	0x493AE0AD487101FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x7579F5A66F068EA1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f24,	%f26
	udivcc	%o6,	0x10FC,	%i6
	nop
	setx	loop_2629,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_2630,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	flush	%l7 + 0x6C
	sra	%o7,	%o1,	%i5
loop_2629:
	tgu	%xcc,	0x2
loop_2630:
	addc	%o3,	%g6,	%i2
	movrlez	%o2,	%i0,	%g3
	nop
	setx	loop_2631,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	lduh	[%l7 + 0x74],	%i7
	movcc	%icc,	%o0,	%l0
	fnegd	%f26,	%f30
loop_2631:
	tvs	%icc,	0x3
	orcc	%l1,	%i4,	%o5
	movcc	%xcc,	%l5,	%g5
	movrlz	%l2,	%l4,	%i3
	te	%xcc,	0x3
	wr	%g0,	0x10,	%asi
	stwa	%i1,	[%l7 + 0x60] %asi
	nop
	setx loop_2632, %l0, %l1
	jmpl %l1, %l6
	fmul8x16	%f17,	%f2,	%f18
	set	0x58, %i3
	ldsha	[%l7 + %i3] 0x0c,	%o4
loop_2632:
	nop
	fitos	%f0,	%f13
	fstox	%f13,	%f26
	fbul	%fcc1,	loop_2633
	sub	%g1,	0x16DE,	%g2
	st	%f17,	[%l7 + 0x7C]
	fmovdneg	%icc,	%f11,	%f5
loop_2633:
	tcs	%xcc,	0x3
	sra	%g7,	0x1D,	%g4
	add	%l3,	0x1AA2,	%i6
	fmovsvs	%icc,	%f18,	%f14
	movn	%xcc,	%o7,	%o6
	fornot1	%f22,	%f4,	%f30
	tsubcc	%o1,	0x03F4,	%o3
	edge16n	%g6,	%i5,	%i2
	fbo,a	%fcc0,	loop_2634
	st	%f14,	[%l7 + 0x30]
	array32	%i0,	%o2,	%i7
	fmovsle	%xcc,	%f1,	%f0
loop_2634:
	subc	%o0,	0x011B,	%l0
	bgu	%xcc,	loop_2635
	udivcc	%l1,	0x01F7,	%g3
	edge16	%o5,	%l5,	%g5
	movrne	%i4,	%l2,	%i3
loop_2635:
	movneg	%xcc,	%l4,	%l6
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f24
	fxtod	%f24,	%f26
	sdivx	%i1,	0x0BEF,	%o4
	brz	%g1,	loop_2636
	tg	%icc,	0x7
	stw	%g7,	[%l7 + 0x60]
	fandnot1s	%f23,	%f19,	%f28
loop_2636:
	fsrc2s	%f14,	%f5
	ta	%icc,	0x1
	movg	%icc,	%g4,	%l3
	edge16ln	%i6,	%o7,	%o6
	tle	%xcc,	0x2
	fmovsg	%xcc,	%f22,	%f22
	edge16l	%g2,	%o3,	%g6
	movpos	%xcc,	%o1,	%i5
	fmovdl	%icc,	%f11,	%f12
	fmovrdgez	%i2,	%f20,	%f10
	fbule	%fcc2,	loop_2637
	fpackfix	%f18,	%f3
	move	%xcc,	%i0,	%o2
	edge16n	%o0,	%i7,	%l0
loop_2637:
	fbule,a	%fcc2,	loop_2638
	srlx	%g3,	%o5,	%l5
	udiv	%l1,	0x1BFA,	%i4
	fmovdcc	%xcc,	%f21,	%f27
loop_2638:
	edge32n	%l2,	%i3,	%g5
	fcmpgt32	%f14,	%f22,	%l4
	edge16n	%i1,	%l6,	%g1
	nop
	setx	0x9C79912264E36DEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x7F8D09D96F88F347,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f18,	%f18
	addc	%o4,	0x0209,	%g7
	srax	%g4,	0x1D,	%l3
	tpos	%xcc,	0x6
	fxnors	%f23,	%f30,	%f7
	udiv	%i6,	0x0C24,	%o7
	tneg	%icc,	0x1
	fbl,a	%fcc0,	loop_2639
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f28
	fxtod	%f28,	%f26
	tcs	%xcc,	0x4
	smul	%o6,	%o3,	%g6
loop_2639:
	nop
	fitos	%f14,	%f1
	fstox	%f1,	%f20
	fxtos	%f20,	%f24
	stx	%o1,	[%l7 + 0x18]
	nop
	setx	0x6306C8698118CE2B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xE0C77593BD899E98,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f26,	%f12
	nop
	setx	0x1F379F97982D25A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x23D0C857A0A8D122,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f22,	%f6
	move	%xcc,	%g2,	%i5
	andcc	%i2,	%i0,	%o0
	subcc	%o2,	0x02EF,	%i7
	st	%f14,	[%l7 + 0x24]
	stw	%l0,	[%l7 + 0x18]
	tpos	%xcc,	0x4
	sdivcc	%o5,	0x1BDF,	%l5
	sllx	%l1,	0x19,	%g3
	taddcc	%l2,	0x19F8,	%i3
	edge16l	%g5,	%i4,	%l4
	sllx	%l6,	0x18,	%i1
	movg	%icc,	%o4,	%g7
	xor	%g4,	0x1877,	%l3
	subcc	%g1,	%o7,	%o6
	bge,pn	%icc,	loop_2640
	xor	%i6,	%o3,	%o1
	alignaddrl	%g6,	%i5,	%i2
	movre	%i0,	%g2,	%o0
loop_2640:
	bgu,a,pt	%xcc,	loop_2641
	move	%icc,	%o2,	%l0
	edge8	%o5,	%l5,	%i7
	nop
	setx	0x20451042,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
loop_2641:
	brz,a	%g3,	loop_2642
	movrlz	%l1,	%l2,	%i3
	sir	0x0890
	subccc	%i4,	%g5,	%l6
loop_2642:
	tcc	%xcc,	0x6
	tne	%xcc,	0x3
	alignaddrl	%i1,	%l4,	%o4
	tn	%icc,	0x1
	fpsub16	%f12,	%f26,	%f0
	fzero	%f18
	tg	%icc,	0x4
	addc	%g4,	%g7,	%g1
	nop
	setx	loop_2643,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x0B63,	%o7
	bl	loop_2644
	popc	0x0282,	%l3
loop_2643:
	array8	%i6,	%o6,	%o3
	fmovsleu	%xcc,	%f8,	%f6
loop_2644:
	andncc	%o1,	%i5,	%i2
	movvc	%xcc,	%i0,	%g2
	xnorcc	%o0,	%o2,	%g6
	fble	%fcc1,	loop_2645
	ble,pn	%xcc,	loop_2646
	andcc	%l0,	0x156E,	%o5
	srlx	%i7,	%l5,	%g3
loop_2645:
	sdivx	%l1,	0x18B1,	%l2
loop_2646:
	fbo	%fcc1,	loop_2647
	fmovdneg	%xcc,	%f19,	%f31
	stb	%i4,	[%l7 + 0x5B]
	addccc	%g5,	0x0AAC,	%l6
loop_2647:
	edge8n	%i3,	%i1,	%l4
	smul	%o4,	0x107E,	%g4
	swap	[%l7 + 0x4C],	%g7
	sdivcc	%o7,	0x115B,	%g1
	nop
	setx loop_2648, %l0, %l1
	jmpl %l1, %l3
	tsubcctv	%i6,	%o6,	%o3
	alignaddr	%o1,	%i5,	%i2
	set	0x2C, %g1
	ldsha	[%l7 + %g1] 0x04,	%g2
loop_2648:
	bvs	loop_2649
	nop
	setx	0x42B793AA3FE05F16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xEC045B0918E3A1B2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f10,	%f24
	fbue,a	%fcc1,	loop_2650
	subc	%o0,	0x1CA7,	%i0
loop_2649:
	movrgez	%o2,	%l0,	%o5
	stw	%g6,	[%l7 + 0x14]
loop_2650:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	add	%i7,	%g3,	%l1
	tneg	%icc,	0x6
	edge32ln	%l2,	%i4,	%l6
	fmovrde	%i3,	%f30,	%f6
	sethi	0x1463,	%g5
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%i1
	nop
	setx	loop_2651,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%xcc,	0x5
	fmovdcs	%xcc,	%f9,	%f10
	tsubcc	%g4,	0x1D3D,	%g7
loop_2651:
	fsrc1	%f6,	%f6
	move	%icc,	%o4,	%g1
	nop
	fitod	%f4,	%f24
	fdtoi	%f24,	%f22
	addc	%l3,	0x1513,	%i6
	fandnot1	%f28,	%f12,	%f12
	nop
	setx	loop_2652,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdne	%icc,	%f19,	%f12
	xnor	%o6,	0x08A8,	%o7
	movrgez	%o3,	0x090,	%i5
loop_2652:
	sir	0x1160
	sdivcc	%o1,	0x05B3,	%g2
	std	%f12,	[%l7 + 0x48]
	smul	%o0,	%i0,	%o2
	fmovsn	%xcc,	%f21,	%f16
	udivx	%i2,	0x17A7,	%o5
	tle	%icc,	0x0
	fnot1	%f10,	%f28
	movrlez	%l0,	0x171,	%g6
	brlz	%i7,	loop_2653
	fmovdvs	%icc,	%f19,	%f9
	tge	%icc,	0x5
	fblg,a	%fcc3,	loop_2654
loop_2653:
	movpos	%xcc,	%l5,	%l1
	fbn,a	%fcc1,	loop_2655
	fmovdle	%xcc,	%f11,	%f15
loop_2654:
	bne	loop_2656
	mulscc	%g3,	0x0AF4,	%l2
loop_2655:
	membar	0x16
	add	%l6,	0x05DA,	%i4
loop_2656:
	tl	%icc,	0x7
	mova	%icc,	%g5,	%i3
	mulx	%i1,	%l4,	%g4
	movn	%icc,	%g7,	%o4
	movvs	%xcc,	%g1,	%l3
	popc	%o6,	%o7
	stbar
	tgu	%icc,	0x3
	udivx	%o3,	0x0870,	%i6
	orcc	%o1,	%i5,	%g2
	fpsub32	%f22,	%f22,	%f8
	movcs	%icc,	%o0,	%i0
	bg,a,pn	%icc,	loop_2657
	subcc	%i2,	0x15D6,	%o5
	movge	%xcc,	%o2,	%g6
	brgez,a	%i7,	loop_2658
loop_2657:
	subcc	%l0,	%l5,	%l1
	fzero	%f10
	bvs	%icc,	loop_2659
loop_2658:
	sll	%l2,	%l6,	%i4
	or	%g5,	%i3,	%i1
	fbe,a	%fcc2,	loop_2660
loop_2659:
	movneg	%icc,	%l4,	%g4
	xor	%g3,	%o4,	%g1
	movvs	%xcc,	%g7,	%o6
loop_2660:
	edge8	%o7,	%l3,	%o3
	fone	%f6
	tgu	%icc,	0x4
	tle	%xcc,	0x4
	tneg	%xcc,	0x3
	movg	%icc,	%o1,	%i5
	nop
	setx	0x549866E24C4BC9A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x5BCD3C294DC3DACA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f30,	%f10
	set	0x68, %l1
	prefetcha	[%l7 + %l1] 0x18,	 0x0
	sllx	%o0,	0x19,	%g2
	bgu	%icc,	loop_2661
	fbn	%fcc1,	loop_2662
	movneg	%xcc,	%i2,	%i0
	fzero	%f22
loop_2661:
	fones	%f1
loop_2662:
	andncc	%o2,	%o5,	%i7
	fpadd32s	%f1,	%f1,	%f21
	movge	%xcc,	%l0,	%g6
	set	0x30, %i1
	ldsba	[%l7 + %i1] 0x10,	%l5
	fabss	%f22,	%f1
	ldd	[%l7 + 0x40],	%f18
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x18] %asi,	%l2
	fsrc2s	%f8,	%f1
	fmovsvc	%icc,	%f16,	%f25
	bcc,a	%icc,	loop_2663
	movcc	%icc,	%l6,	%i4
	tsubcctv	%g5,	%i3,	%i1
	nop
	setx	0xA057F0B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
loop_2663:
	array32	%l1,	%g4,	%l4
	udiv	%g3,	0x1635,	%o4
	fbge,a	%fcc0,	loop_2664
	movvc	%icc,	%g1,	%g7
	bgu,pn	%icc,	loop_2665
	sdiv	%o7,	0x0242,	%l3
loop_2664:
	ldsb	[%l7 + 0x71],	%o6
	edge16	%o3,	%i5,	%i6
loop_2665:
	movrlz	%o0,	0x150,	%g2
	and	%i2,	0x19AA,	%i0
	fpack16	%f8,	%f27
	edge16l	%o1,	%o2,	%i7
	mulx	%l0,	0x1F84,	%o5
	subccc	%l5,	0x1255,	%g6
	fba	%fcc3,	loop_2666
	edge8ln	%l2,	%l6,	%i4
	movle	%icc,	%i3,	%i1
	array8	%l1,	%g4,	%g5
loop_2666:
	edge8ln	%l4,	%o4,	%g1
	call	loop_2667
	nop
	fitos	%f12,	%f6
	fstox	%f6,	%f2
	set	0x76, %g5
	lduha	[%l7 + %g5] 0x81,	%g3
loop_2667:
	fmovscc	%icc,	%f26,	%f31
	movrne	%g7,	0x23B,	%l3
	edge16l	%o6,	%o7,	%o3
	udivcc	%i6,	0x11F6,	%o0
	mulscc	%i5,	0x157C,	%g2
	umul	%i0,	0x05B0,	%i2
	ldx	[%l7 + 0x70],	%o1
	movvc	%xcc,	%o2,	%l0
	tneg	%icc,	0x0
	set	0x37, %g2
	lduba	[%l7 + %g2] 0x80,	%i7
	fmovsleu	%icc,	%f14,	%f27
	call	loop_2668
	edge16ln	%o5,	%g6,	%l2
	edge8n	%l6,	%l5,	%i4
	fnand	%f22,	%f14,	%f4
loop_2668:
	fblg	%fcc3,	loop_2669
	nop
	setx	0x5E37218B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xEBDC805C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f11,	%f19
	ldx	[%l7 + 0x40],	%i3
	movl	%icc,	%l1,	%i1
loop_2669:
	xor	%g5,	%g4,	%o4
	ldsb	[%l7 + 0x24],	%g1
	fmovdvc	%xcc,	%f5,	%f23
	fmovrslz	%g3,	%f12,	%f12
	fmovdvc	%icc,	%f17,	%f27
	bne	%xcc,	loop_2670
	te	%icc,	0x4
	movneg	%icc,	%g7,	%l3
	fornot1	%f12,	%f24,	%f2
loop_2670:
	xorcc	%l4,	0x0FED,	%o7
	move	%xcc,	%o6,	%o3
	addccc	%o0,	%i5,	%i6
	xnor	%i0,	0x0DCC,	%i2
	movrlez	%o1,	0x042,	%g2
	ldd	[%l7 + 0x18],	%l0
	stx	%i7,	[%l7 + 0x28]
	brlz	%o5,	loop_2671
	andn	%g6,	0x143D,	%l2
	fornot2	%f28,	%f30,	%f24
	tneg	%xcc,	0x5
loop_2671:
	fmovdg	%icc,	%f18,	%f2
	fbu,a	%fcc0,	loop_2672
	fzero	%f0
	umul	%o2,	0x016C,	%l6
	edge16ln	%i4,	%i3,	%l5
loop_2672:
	fmovdpos	%icc,	%f10,	%f22
	ldsb	[%l7 + 0x6E],	%l1
	edge32l	%g5,	%i1,	%g4
	movn	%icc,	%o4,	%g3
	orcc	%g1,	%l3,	%l4
	alignaddrl	%g7,	%o6,	%o7
	nop
	fitod	%f15,	%f16
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x6C] %asi,	%o0
	edge8	%o3,	%i6,	%i0
	swap	[%l7 + 0x54],	%i2
	ldsh	[%l7 + 0x4C],	%i5
	alignaddr	%g2,	%o1,	%l0
	tg	%xcc,	0x3
	fcmpeq16	%f16,	%f8,	%o5
	subc	%i7,	%l2,	%g6
	edge8l	%l6,	%i4,	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o2,	%l5
	movcs	%icc,	%l1,	%i1
	subccc	%g5,	0x0A8B,	%g4
	array8	%g3,	%o4,	%g1
	edge8	%l3,	%g7,	%o6
	tvs	%xcc,	0x6
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x20] %asi,	%o7
	tge	%xcc,	0x7
	fcmple32	%f8,	%f18,	%l4
	taddcc	%o0,	0x19EE,	%i6
	prefetch	[%l7 + 0x50],	 0x2
	fmul8x16al	%f26,	%f31,	%f0
	tneg	%xcc,	0x5
	movpos	%icc,	%i0,	%i2
	fbul,a	%fcc1,	loop_2673
	nop
	fitos	%f1,	%f1
	fstoi	%f1,	%f26
	movgu	%icc,	%o3,	%i5
	fbl,a	%fcc0,	loop_2674
loop_2673:
	edge32ln	%o1,	%l0,	%g2
	movpos	%icc,	%o5,	%l2
	fba	%fcc0,	loop_2675
loop_2674:
	lduw	[%l7 + 0x50],	%g6
	edge32l	%i7,	%l6,	%i3
	tsubcctv	%o2,	%l5,	%l1
loop_2675:
	fpack32	%f26,	%f8,	%f12
	srl	%i4,	%i1,	%g5
	movrlz	%g4,	0x1B1,	%g3
	fornot2	%f26,	%f28,	%f24
	udivcc	%o4,	0x174A,	%l3
	bneg	%icc,	loop_2676
	sethi	0x1A91,	%g1
	fpadd32s	%f4,	%f15,	%f29
	lduw	[%l7 + 0x64],	%o6
loop_2676:
	lduw	[%l7 + 0x34],	%g7
	or	%l4,	0x0AC9,	%o0
	taddcctv	%o7,	0x1A03,	%i6
	tsubcc	%i0,	%i2,	%i5
	sir	0x1A3B
	movrlez	%o1,	0x390,	%l0
	tcs	%xcc,	0x0
	edge16	%o3,	%g2,	%o5
	ldd	[%l7 + 0x60],	%g6
	tne	%icc,	0x5
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%l2
	fmovdcc	%xcc,	%f13,	%f31
	nop
	setx	0x80630094,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	edge16n	%l6,	%i3,	%o2
	fbg,a	%fcc1,	loop_2677
	edge16n	%i7,	%l5,	%l1
	srlx	%i4,	%g5,	%g4
	movrne	%g3,	%o4,	%i1
loop_2677:
	movne	%icc,	%g1,	%l3
	sra	%g7,	%o6,	%l4
	wr	%g0,	0x04,	%asi
	stba	%o7,	[%l7 + 0x73] %asi
	fbg	%fcc0,	loop_2678
	fpsub16	%f18,	%f24,	%f30
	set	0x0, %g7
	stxa	%o0,	[%g0 + %g7] 0x5f
loop_2678:
	fmovsne	%icc,	%f16,	%f2
	array16	%i0,	%i6,	%i5
	fmovrdlez	%i2,	%f2,	%f4
	subc	%o1,	%l0,	%o3
	movrgez	%o5,	%g2,	%g6
	be,a	loop_2679
	movne	%xcc,	%l6,	%l2
	movre	%o2,	%i7,	%l5
	lduw	[%l7 + 0x3C],	%i3
loop_2679:
	addcc	%i4,	%l1,	%g5
	edge8n	%g3,	%o4,	%i1
	array8	%g1,	%l3,	%g4
	udivcc	%o6,	0x149B,	%l4
	fmovrde	%g7,	%f14,	%f30
	addccc	%o7,	%i0,	%o0
	fmovsn	%icc,	%f7,	%f17
	edge32	%i6,	%i5,	%i2
	edge16l	%l0,	%o3,	%o5
	alignaddr	%g2,	%g6,	%o1
	fbo	%fcc1,	loop_2680
	std	%f16,	[%l7 + 0x68]
	fbue,a	%fcc0,	loop_2681
	mova	%xcc,	%l2,	%o2
loop_2680:
	edge32n	%l6,	%l5,	%i7
	set	0x60, %i6
	lduha	[%l7 + %i6] 0x81,	%i4
loop_2681:
	sdivx	%i3,	0x0819,	%l1
	bcs,a	loop_2682
	fnot2s	%f13,	%f1
	udiv	%g3,	0x17B4,	%o4
	edge8n	%i1,	%g1,	%l3
loop_2682:
	stw	%g5,	[%l7 + 0x08]
	add	%o6,	0x0277,	%l4
	set	0x44, %o3
	lduha	[%l7 + %o3] 0x11,	%g4
	fmul8x16al	%f25,	%f7,	%f16
	smul	%g7,	0x02A2,	%i0
	fmovscs	%xcc,	%f3,	%f16
	ldsh	[%l7 + 0x40],	%o0
	fmovsa	%icc,	%f28,	%f22
	nop
	setx	loop_2683,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbule	%fcc1,	loop_2684
	edge16n	%i6,	%o7,	%i2
	edge16	%l0,	%o3,	%o5
loop_2683:
	edge32ln	%g2,	%i5,	%g6
loop_2684:
	tneg	%icc,	0x6
	movn	%icc,	%o1,	%l2
	srax	%o2,	0x1D,	%l6
	fnor	%f20,	%f6,	%f2
	brz	%i7,	loop_2685
	orn	%i4,	%l5,	%l1
	lduh	[%l7 + 0x5E],	%g3
	fpsub16	%f22,	%f6,	%f6
loop_2685:
	movgu	%icc,	%o4,	%i1
	ldub	[%l7 + 0x0C],	%g1
	fpack16	%f12,	%f31
	orn	%l3,	0x03E9,	%g5
	fmovdcc	%xcc,	%f22,	%f13
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%o6
	swap	[%l7 + 0x54],	%l4
	mulscc	%g7,	%i0,	%o0
	fsrc2s	%f19,	%f3
	movg	%xcc,	%g4,	%o7
	tcc	%xcc,	0x7
	srl	%i6,	%i2,	%l0
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movrlz	%o5,	%g2,	%o3
	tneg	%xcc,	0x4
	fmuld8ulx16	%f8,	%f15,	%f30
	membar	0x1C
	xorcc	%g6,	0x0D5D,	%i5
	fmovsg	%icc,	%f24,	%f16
	fcmple32	%f22,	%f22,	%o1
	set	0x10, %l5
	stxa	%l2,	[%l7 + %l5] 0x88
	fmovsneg	%xcc,	%f22,	%f4
	sdiv	%o2,	0x08D0,	%l6
	movle	%icc,	%i7,	%l5
	movn	%xcc,	%l1,	%i4
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f14
	fmovspos	%xcc,	%f25,	%f7
	taddcc	%o4,	%i1,	%g1
	fbul,a	%fcc0,	loop_2686
	fbue,a	%fcc2,	loop_2687
	array16	%g3,	%l3,	%g5
	ldsb	[%l7 + 0x62],	%o6
loop_2686:
	nop
	fitod	%f8,	%f30
	fdtox	%f30,	%f14
loop_2687:
	std	%f28,	[%l7 + 0x28]
	std	%f6,	[%l7 + 0x50]
	set	0x5C, %o2
	ldsha	[%l7 + %o2] 0x15,	%l4
	movn	%icc,	%g7,	%i3
	fmovspos	%xcc,	%f8,	%f4
	stb	%i0,	[%l7 + 0x50]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f20,	%f6,	%f16
	movrgez	%g4,	0x121,	%o7
	movrgz	%o0,	%i6,	%i2
	fnor	%f14,	%f14,	%f6
	andn	%o5,	0x0BD7,	%l0
	edge8n	%o3,	%g2,	%i5
	fmovdgu	%icc,	%f8,	%f14
	fpsub16s	%f21,	%f5,	%f20
	srlx	%g6,	%o1,	%o2
	movvc	%icc,	%l2,	%i7
	array8	%l6,	%l1,	%i4
	udivx	%o4,	0x0F47,	%i1
	xnor	%g1,	%l5,	%l3
	andcc	%g3,	0x1409,	%g5
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	popc	0x1DB3,	%o6
	bcc,a	loop_2688
	tvs	%icc,	0x7
	set	0x1C, %i0
	sta	%f16,	[%l7 + %i0] 0x10
loop_2688:
	nop
	set	0x0E, %i4
	ldstuba	[%l7 + %i4] 0x89,	%l4
	xorcc	%g7,	%i3,	%i0
	smulcc	%g4,	0x1BAE,	%o0
	subccc	%i6,	0x08F1,	%i2
	smulcc	%o7,	0x0A2E,	%o5
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x04,	%f16
	udiv	%l0,	0x11D8,	%g2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x3C] %asi,	%f9
	movrne	%o3,	0x2BA,	%g6
	fnegd	%f6,	%f22
	st	%f31,	[%l7 + 0x7C]
	mulx	%o1,	0x0122,	%o2
	movge	%xcc,	%l2,	%i7
	fmovd	%f16,	%f6
	fpackfix	%f14,	%f6
	movvs	%icc,	%i5,	%l1
	umulcc	%i4,	%l6,	%i1
	fbl	%fcc0,	loop_2689
	stx	%g1,	[%l7 + 0x18]
	srax	%o4,	0x13,	%l5
	orncc	%g3,	0x0A6F,	%g5
loop_2689:
	fcmpne16	%f18,	%f30,	%l3
	movne	%xcc,	%l4,	%o6
	udivcc	%i3,	0x1B3C,	%i0
	movcc	%xcc,	%g7,	%g4
	sll	%o0,	0x1F,	%i2
	for	%f8,	%f10,	%f0
	tl	%icc,	0x1
	xorcc	%o7,	0x1C1A,	%i6
	array32	%l0,	%o5,	%o3
	lduw	[%l7 + 0x64],	%g6
	smulcc	%o1,	%g2,	%l2
	array32	%i7,	%o2,	%l1
	bn,pt	%xcc,	loop_2690
	tpos	%xcc,	0x6
	subcc	%i5,	%i4,	%i1
	nop
	setx	0x713BF860606480A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f20
loop_2690:
	edge16n	%l6,	%g1,	%o4
	fabsd	%f10,	%f8
	bl,pt	%icc,	loop_2691
	fmul8x16al	%f0,	%f16,	%f4
	bne	%xcc,	loop_2692
	bvc	loop_2693
loop_2691:
	xor	%g3,	%g5,	%l3
	add	%l4,	0x0FC6,	%l5
loop_2692:
	srax	%o6,	0x08,	%i0
loop_2693:
	smul	%i3,	0x18E7,	%g4
	smul	%o0,	%g7,	%o7
	tvc	%icc,	0x6
	movcs	%icc,	%i6,	%i2
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f28
	fxtod	%f28,	%f0
	andn	%l0,	%o3,	%g6
	nop
	fitos	%f2,	%f17
	fstoi	%f17,	%f4
	fmovdvs	%xcc,	%f29,	%f0
	sra	%o5,	%o1,	%g2
	fbuge,a	%fcc1,	loop_2694
	bneg,pn	%xcc,	loop_2695
	nop
	setx	0x096F75F9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xA7B39758,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f17,	%f2
	edge32l	%l2,	%o2,	%i7
loop_2694:
	udiv	%l1,	0x1279,	%i5
loop_2695:
	edge16	%i4,	%l6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%o4,	loop_2696
	nop
	setx	loop_2697,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%g3,	%i1,	%l3
	brgz	%g5,	loop_2698
loop_2696:
	fmovdleu	%icc,	%f11,	%f17
loop_2697:
	smulcc	%l4,	%l5,	%i0
	udivcc	%o6,	0x191F,	%i3
loop_2698:
	bneg,pt	%icc,	loop_2699
	xnorcc	%g4,	0x182A,	%o0
	alignaddr	%o7,	%g7,	%i2
	brz	%i6,	loop_2700
loop_2699:
	ba,pt	%xcc,	loop_2701
	bge,a	%icc,	loop_2702
	movrgz	%o3,	%l0,	%o5
loop_2700:
	fornot1	%f14,	%f22,	%f10
loop_2701:
	flush	%l7 + 0x08
loop_2702:
	ta	%icc,	0x6
	taddcctv	%o1,	0x1711,	%g6
	fcmpgt16	%f6,	%f18,	%g2
	fmovs	%f15,	%f5
	movrlez	%o2,	%l2,	%l1
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x55] %asi,	%i7
	fbuge,a	%fcc1,	loop_2703
	fpadd32	%f6,	%f4,	%f26
	tle	%icc,	0x3
	mulscc	%i4,	0x0BE1,	%l6
loop_2703:
	mulscc	%g1,	%o4,	%i5
	edge32l	%i1,	%g3,	%g5
	movrlez	%l4,	%l3,	%i0
	fbu,a	%fcc0,	loop_2704
	fnegd	%f24,	%f12
	fnand	%f14,	%f8,	%f8
	popc	%o6,	%l5
loop_2704:
	udiv	%i3,	0x13D4,	%o0
	udivx	%g4,	0x1773,	%o7
	fmovrse	%g7,	%f3,	%f3
	ldsh	[%l7 + 0x74],	%i2
	tg	%icc,	0x2
	fmovda	%xcc,	%f9,	%f3
	edge32	%o3,	%i6,	%l0
	tle	%icc,	0x4
	ble,a	loop_2705
	mova	%xcc,	%o1,	%g6
	popc	0x1150,	%o5
	tg	%icc,	0x1
loop_2705:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g2,	%l2,	%o2
	subccc	%l1,	0x1692,	%i7
	orn	%l6,	0x096F,	%g1
	fba	%fcc0,	loop_2706
	movleu	%xcc,	%i4,	%o4
	addc	%i5,	0x06AA,	%g3
	fba,a	%fcc1,	loop_2707
loop_2706:
	bpos	%icc,	loop_2708
	umul	%g5,	0x1577,	%i1
	movrgz	%l4,	0x320,	%l3
loop_2707:
	movge	%icc,	%i0,	%l5
loop_2708:
	fbul,a	%fcc3,	loop_2709
	fandnot1	%f0,	%f24,	%f0
	fbug	%fcc2,	loop_2710
	nop
	fitod	%f0,	%f12
	fdtos	%f12,	%f1
loop_2709:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f2,	%f3
loop_2710:
	fors	%f15,	%f9,	%f8
	mulx	%i3,	0x10A5,	%o0
	call	loop_2711
	udivx	%o6,	0x04B4,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g4,	%g7,	%i2
loop_2711:
	movle	%xcc,	%o3,	%i6
	fandnot1	%f20,	%f22,	%f22
	edge8ln	%o1,	%l0,	%g6
	fcmpne16	%f6,	%f0,	%g2
	tn	%icc,	0x2
	movge	%icc,	%l2,	%o2
	add	%o5,	0x108F,	%i7
	brgez,a	%l6,	loop_2712
	sth	%g1,	[%l7 + 0x6C]
	xnor	%i4,	0x14F1,	%o4
	fbn	%fcc2,	loop_2713
loop_2712:
	tsubcc	%l1,	0x1025,	%g3
	move	%xcc,	%i5,	%g5
	andncc	%l4,	%i1,	%l3
loop_2713:
	edge8ln	%i0,	%l5,	%o0
	edge16n	%o6,	%i3,	%g4
	nop
	fitos	%f31,	%f26
	fbug	%fcc3,	loop_2714
	movn	%icc,	%o7,	%g7
	stx	%i2,	[%l7 + 0x40]
	edge8l	%o3,	%o1,	%l0
loop_2714:
	movne	%xcc,	%i6,	%g2
	brz,a	%l2,	loop_2715
	fpack32	%f2,	%f22,	%f30
	brlz	%g6,	loop_2716
	fbo	%fcc3,	loop_2717
loop_2715:
	bne	%icc,	loop_2718
	sethi	0x19CB,	%o2
loop_2716:
	tcs	%xcc,	0x5
loop_2717:
	alignaddr	%o5,	%l6,	%i7
loop_2718:
	nop
	setx	0xEE840B16,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f13
	movne	%icc,	%g1,	%i4
	tgu	%icc,	0x3
	fble	%fcc0,	loop_2719
	andncc	%l1,	%o4,	%i5
	edge8	%g3,	%l4,	%g5
	nop
	fitos	%f1,	%f14
loop_2719:
	fmovdl	%xcc,	%f13,	%f16
	fbul	%fcc0,	loop_2720
	smulcc	%i1,	0x0761,	%l3
	ldx	[%l7 + 0x28],	%i0
	orn	%l5,	0x04B6,	%o6
loop_2720:
	call	loop_2721
	add	%o0,	0x02AF,	%i3
	fbg,a	%fcc3,	loop_2722
	tle	%xcc,	0x7
loop_2721:
	fones	%f19
	stb	%g4,	[%l7 + 0x30]
loop_2722:
	edge32n	%g7,	%i2,	%o3
	set	0x34, %o0
	stba	%o1,	[%l7 + %o0] 0x89
	tsubcc	%o7,	%i6,	%g2
	ble,pt	%xcc,	loop_2723
	fmul8x16	%f11,	%f22,	%f16
	udiv	%l2,	0x16C3,	%l0
	array16	%g6,	%o5,	%o2
loop_2723:
	tcs	%icc,	0x5
	movneg	%icc,	%i7,	%g1
	fbe	%fcc0,	loop_2724
	andn	%i4,	0x0693,	%l6
	fmovsl	%xcc,	%f12,	%f24
	set	0x7C, %l0
	lduwa	[%l7 + %l0] 0x89,	%o4
loop_2724:
	tneg	%icc,	0x5
	edge8ln	%l1,	%i5,	%g3
	andncc	%l4,	%i1,	%l3
	sdiv	%i0,	0x0D03,	%l5
	edge32l	%o6,	%o0,	%i3
	smul	%g4,	0x012C,	%g7
	fmovsle	%icc,	%f27,	%f30
	movpos	%xcc,	%g5,	%o3
	call	loop_2725
	sllx	%i2,	0x0C,	%o7
	fpadd32s	%f22,	%f16,	%f17
	fmovrdgez	%o1,	%f26,	%f20
loop_2725:
	fsrc2s	%f0,	%f27
	sdivx	%i6,	0x128A,	%g2
	subccc	%l0,	0x05D2,	%l2
	st	%f29,	[%l7 + 0x7C]
	xorcc	%o5,	0x0049,	%g6
	srl	%o2,	%i7,	%i4
	edge32ln	%l6,	%o4,	%l1
	sdivcc	%i5,	0x1490,	%g3
	edge8l	%g1,	%i1,	%l4
	movvs	%xcc,	%l3,	%i0
	fble	%fcc3,	loop_2726
	fbo,a	%fcc2,	loop_2727
	nop
	fitos	%f1,	%f3
	fstox	%f3,	%f28
	nop
	set	0x18, %i2
	prefetch	[%l7 + %i2],	 0x3
loop_2726:
	edge16l	%l5,	%o0,	%i3
loop_2727:
	addc	%o6,	%g4,	%g5
	st	%f30,	[%l7 + 0x44]
	fmovrde	%g7,	%f18,	%f0
	movgu	%icc,	%i2,	%o3
	edge32n	%o1,	%i6,	%g2
	fpadd16	%f14,	%f14,	%f10
	fpackfix	%f14,	%f31
	nop
	setx loop_2728, %l0, %l1
	jmpl %l1, %l0
	be,a	loop_2729
	movvs	%xcc,	%l2,	%o7
	xnorcc	%o5,	%g6,	%i7
loop_2728:
	andn	%i4,	0x15D5,	%o2
loop_2729:
	brnz	%o4,	loop_2730
	edge16	%l6,	%i5,	%l1
	set	0x74, %l4
	swapa	[%l7 + %l4] 0x88,	%g1
loop_2730:
	fba,a	%fcc1,	loop_2731
	movleu	%icc,	%i1,	%g3
	movle	%xcc,	%l4,	%l3
	fsrc1s	%f21,	%f4
loop_2731:
	subccc	%i0,	%l5,	%o0
	sdiv	%i3,	0x15F2,	%g4
	taddcc	%g5,	%g7,	%i2
	alignaddr	%o3,	%o1,	%o6
	move	%xcc,	%g2,	%l0
	umulcc	%i6,	%o7,	%o5
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x89
	udiv	%l2,	0x076B,	%i7
	fbule,a	%fcc0,	loop_2732
	membar	0x7A
	nop
	setx	loop_2733,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2732:
	bge	%icc,	loop_2734
	brlez,a	%i4,	loop_2735
loop_2733:
	addcc	%o2,	%o4,	%g6
	edge32n	%i5,	%l1,	%l6
loop_2734:
	tpos	%xcc,	0x4
loop_2735:
	edge8	%i1,	%g1,	%g3
	swap	[%l7 + 0x5C],	%l3
	fmovdcc	%icc,	%f15,	%f4
	fornot2s	%f31,	%f3,	%f10
	andn	%l4,	0x0A91,	%l5
	fsrc2	%f20,	%f10
	subccc	%i0,	0x1A80,	%o0
	fba,a	%fcc2,	loop_2736
	edge32n	%i3,	%g5,	%g4
	fornot1s	%f10,	%f1,	%f16
	xor	%i2,	0x0B75,	%o3
loop_2736:
	fnors	%f0,	%f4,	%f18
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x74] %asi,	%g7
	ba	loop_2737
	tge	%xcc,	0x4
	tneg	%icc,	0x6
	tvc	%xcc,	0x3
loop_2737:
	subccc	%o1,	%g2,	%o6
	movrgez	%l0,	0x07D,	%i6
	stb	%o5,	[%l7 + 0x6C]
	nop
	fitod	%f0,	%f12
	orcc	%l2,	%o7,	%i7
	fabss	%f2,	%f14
	udiv	%o2,	0x080F,	%i4
	fpsub32s	%f31,	%f26,	%f31
	movleu	%xcc,	%g6,	%i5
	addcc	%l1,	%l6,	%i1
	fexpand	%f6,	%f10
	tg	%icc,	0x6
	sll	%o4,	0x10,	%g3
	ta	%icc,	0x3
	sir	0x03C3
	array32	%g1,	%l4,	%l5
	movrgez	%i0,	%l3,	%o0
	wr	%g0,	0x2b,	%asi
	stxa	%g5,	[%l7 + 0x28] %asi
	membar	#Sync
	sdivx	%g4,	0x1915,	%i3
	bge,a,pn	%icc,	loop_2738
	edge8n	%i2,	%o3,	%g7
	udivx	%o1,	0x1C53,	%g2
	taddcctv	%l0,	%o6,	%o5
loop_2738:
	tn	%icc,	0x5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%l2
	fmovdl	%icc,	%f27,	%f6
	movleu	%xcc,	%i7,	%o7
	fmovdle	%xcc,	%f2,	%f6
	orn	%o2,	%g6,	%i4
	sdivcc	%l1,	0x1FB3,	%i5
	mulx	%l6,	0x161F,	%o4
	fpackfix	%f8,	%f20
	movl	%icc,	%i1,	%g1
	movn	%icc,	%g3,	%l5
	fmovsle	%icc,	%f19,	%f4
	movcc	%xcc,	%i0,	%l4
	movn	%xcc,	%o0,	%g5
	edge32	%g4,	%l3,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o3,	%g7
	nop
	setx	0xC5777D83FCCF698A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x88EF76458A7473E8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f12,	%f24
	fmul8x16al	%f20,	%f15,	%f4
	bcc,pn	%icc,	loop_2739
	tne	%icc,	0x6
	sdivx	%i2,	0x1705,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2739:
	edge16l	%l0,	%g2,	%o6
	tge	%icc,	0x1
	fcmpgt32	%f26,	%f0,	%i6
	nop
	setx	0x37F48852,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x9ACCF534,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f20,	%f23
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x60] %asi,	%o5
	andn	%l2,	%i7,	%o2
	move	%icc,	%o7,	%i4
	andncc	%l1,	%i5,	%l6
	ldstub	[%l7 + 0x72],	%o4
	edge8ln	%i1,	%g1,	%g6
	fornot2	%f20,	%f10,	%f24
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x10,	%f16
	or	%l5,	%g3,	%l4
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x70] %asi,	%o0
	andcc	%i0,	%g4,	%l3
	ba,pn	%xcc,	loop_2740
	fmovdcc	%xcc,	%f17,	%f19
	array32	%i3,	%o3,	%g5
	fexpand	%f11,	%f20
loop_2740:
	udiv	%g7,	0x19E3,	%o1
	wr	%g0,	0x81,	%asi
	stba	%l0,	[%l7 + 0x3C] %asi
	udiv	%g2,	0x1893,	%o6
	ldub	[%l7 + 0x4D],	%i2
	fsrc2s	%f26,	%f12
	tgu	%icc,	0x5
	nop
	setx	loop_2741,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%i6,	0x12,	%o5
	sdivx	%l2,	0x08D6,	%i7
	umulcc	%o2,	%o7,	%l1
loop_2741:
	fbe,a	%fcc1,	loop_2742
	and	%i5,	0x1C6B,	%l6
	fmovsne	%icc,	%f14,	%f10
	ble,pt	%xcc,	loop_2743
loop_2742:
	nop
	setx	0xA6F03F0DA6087CC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xE3B06B1C80363627,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f26,	%f4
	sdiv	%i4,	0x0F1B,	%i1
	brgz,a	%g1,	loop_2744
loop_2743:
	sdiv	%o4,	0x1BD3,	%l5
	fmovrsgez	%g6,	%f23,	%f24
	alignaddr	%l4,	%g3,	%o0
loop_2744:
	tne	%xcc,	0x5
	bgu,a	loop_2745
	bshuffle	%f24,	%f28,	%f8
	fmovda	%icc,	%f28,	%f23
	tsubcc	%i0,	0x1075,	%g4
loop_2745:
	movre	%l3,	%i3,	%o3
	tpos	%xcc,	0x0
	tsubcctv	%g5,	%g7,	%o1
	xnorcc	%g2,	0x02D8,	%o6
	ba,a	%xcc,	loop_2746
	addcc	%l0,	%i6,	%i2
	sth	%o5,	[%l7 + 0x70]
	fmovsgu	%xcc,	%f30,	%f0
loop_2746:
	tl	%xcc,	0x1
	movcc	%icc,	%i7,	%l2
	tvc	%xcc,	0x0
	andncc	%o7,	%l1,	%i5
	alignaddr	%l6,	%o2,	%i1
	fandnot1	%f16,	%f10,	%f26
	fpsub32s	%f11,	%f2,	%f9
	movcc	%xcc,	%g1,	%i4
	orncc	%l5,	%o4,	%g6
	fmovde	%xcc,	%f29,	%f20
	fpackfix	%f24,	%f31
	movvs	%xcc,	%g3,	%l4
	addcc	%i0,	0x18A8,	%g4
	ta	%icc,	0x3
	edge8ln	%o0,	%l3,	%o3
	swap	[%l7 + 0x48],	%g5
	flush	%l7 + 0x7C
	fbu	%fcc1,	loop_2747
	fmovscc	%xcc,	%f17,	%f27
	movle	%xcc,	%g7,	%i3
	stbar
loop_2747:
	movne	%xcc,	%g2,	%o6
	prefetch	[%l7 + 0x24],	 0x1
	brlz	%l0,	loop_2748
	ldsb	[%l7 + 0x40],	%i6
	mulx	%o1,	%o5,	%i7
	udivcc	%l2,	0x0758,	%i2
loop_2748:
	fands	%f11,	%f7,	%f4
	edge32n	%l1,	%i5,	%o7
	fbg,a	%fcc1,	loop_2749
	movcs	%icc,	%l6,	%o2
	orncc	%g1,	0x075E,	%i1
	wr	%g0,	0x19,	%asi
	sta	%f6,	[%l7 + 0x7C] %asi
loop_2749:
	stb	%l5,	[%l7 + 0x45]
	bvs,a,pn	%icc,	loop_2750
	taddcc	%o4,	0x17EB,	%i4
	fmovrsne	%g3,	%f10,	%f3
	fbul	%fcc2,	loop_2751
loop_2750:
	andncc	%g6,	%i0,	%l4
	sra	%o0,	0x09,	%l3
	edge32	%g4,	%g5,	%o3
loop_2751:
	pdist	%f12,	%f26,	%f18
	umulcc	%g7,	%i3,	%o6
	nop
	setx	0x770B34BD1EBF5D67,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x13C0AA88CD939660,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f26,	%f4
	edge16ln	%l0,	%i6,	%g2
	xor	%o5,	%i7,	%o1
	movge	%icc,	%i2,	%l2
	movleu	%icc,	%i5,	%o7
	fbg	%fcc3,	loop_2752
	for	%f22,	%f30,	%f14
	tgu	%icc,	0x6
	edge8ln	%l1,	%o2,	%l6
loop_2752:
	tsubcctv	%g1,	0x08C8,	%i1
	andn	%l5,	0x05AF,	%o4
	movrgz	%g3,	%i4,	%g6
	edge32n	%l4,	%o0,	%l3
	fmovsg	%xcc,	%f22,	%f16
	fmovrdne	%i0,	%f28,	%f28
	flush	%l7 + 0x18
	fbul	%fcc3,	loop_2753
	mulx	%g4,	0x03C4,	%o3
	fbuge	%fcc2,	loop_2754
	movvs	%xcc,	%g7,	%g5
loop_2753:
	sdivcc	%o6,	0x1E11,	%i3
	tl	%xcc,	0x7
loop_2754:
	udivx	%l0,	0x0958,	%g2
	udivcc	%o5,	0x1133,	%i6
	smul	%o1,	%i7,	%l2
	prefetch	[%l7 + 0x64],	 0x0
	nop
	setx	0xCC35630F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xA8F5C9D3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f3,	%f7
	bn	%xcc,	loop_2755
	sth	%i2,	[%l7 + 0x0C]
	srlx	%i5,	0x08,	%o7
	smul	%o2,	%l1,	%g1
loop_2755:
	movle	%icc,	%i1,	%l6
	sir	0x0B9C
	tne	%icc,	0x2
	array8	%o4,	%l5,	%g3
	brnz	%i4,	loop_2756
	fmovrslez	%g6,	%f31,	%f24
	tneg	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2756:
	bleu	%icc,	loop_2757
	umul	%l4,	%o0,	%l3
	fbu,a	%fcc0,	loop_2758
	fmovsvc	%icc,	%f30,	%f24
loop_2757:
	movvs	%xcc,	%g4,	%o3
	movre	%i0,	0x2FA,	%g5
loop_2758:
	mova	%icc,	%o6,	%i3
	fmovsleu	%xcc,	%f9,	%f1
	swap	[%l7 + 0x3C],	%l0
	bg,a	%icc,	loop_2759
	movpos	%xcc,	%g7,	%g2
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f16
loop_2759:
	edge32l	%i6,	%o1,	%o5
	brlez,a	%i7,	loop_2760
	fmovdn	%icc,	%f21,	%f28
	edge32ln	%l2,	%i5,	%o7
	tge	%icc,	0x5
loop_2760:
	fcmpeq32	%f24,	%f28,	%i2
	ldd	[%l7 + 0x30],	%f0
	add	%o2,	%l1,	%i1
	andncc	%g1,	%l6,	%o4
	edge8ln	%g3,	%l5,	%g6
	ldsb	[%l7 + 0x48],	%i4
	fbue,a	%fcc2,	loop_2761
	tge	%xcc,	0x4
	popc	0x1B0C,	%l4
	fmovrslz	%l3,	%f23,	%f28
loop_2761:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	fbn	%fcc3,	loop_2762
	fandnot1	%f18,	%f24,	%f2
	edge16l	%g4,	%i0,	%o3
	ldstub	[%l7 + 0x74],	%g5
loop_2762:
	edge32	%o6,	%i3,	%l0
	fandnot1s	%f0,	%f28,	%f27
	array16	%g2,	%i6,	%o1
	array16	%o5,	%g7,	%l2
	bge,a,pt	%xcc,	loop_2763
	tg	%xcc,	0x3
	fnot2s	%f26,	%f3
	nop
	set	0x30, %i5
	stw	%i7,	[%l7 + %i5]
loop_2763:
	nop
	fitos	%f2,	%f16
	fstod	%f16,	%f8
	bl,a	%icc,	loop_2764
	nop
	setx	0xDED605F4C60CA5A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC1F1F30E651E5090,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f30,	%f14
	udivcc	%o7,	0x1A98,	%i2
	wr	%g0,	0x27,	%asi
	stba	%o2,	[%l7 + 0x3E] %asi
	membar	#Sync
loop_2764:
	swap	[%l7 + 0x74],	%l1
	fmovsneg	%icc,	%f12,	%f7
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x30, %g4
	stxa	%i5,	[%l7 + %g4] 0x88
	array16	%g1,	%l6,	%o4
	bne,pt	%icc,	loop_2765
	smul	%g3,	%l5,	%i1
	bn,pn	%xcc,	loop_2766
	bn,a,pt	%icc,	loop_2767
loop_2765:
	subcc	%g6,	0x12A7,	%l4
	movle	%icc,	%l3,	%i4
loop_2766:
	movrgz	%g4,	%o0,	%o3
loop_2767:
	andn	%g5,	%i0,	%o6
	edge8l	%i3,	%g2,	%i6
	fmovsne	%icc,	%f26,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%o1,	%f13,	%f17
	umul	%o5,	0x0564,	%g7
	edge16ln	%l0,	%l2,	%o7
	movre	%i2,	%o2,	%i7
	edge8	%l1,	%g1,	%i5
	fnor	%f4,	%f10,	%f26
	srax	%o4,	0x07,	%g3
	wr	%g0,	0x2a,	%asi
	stha	%l6,	[%l7 + 0x40] %asi
	membar	#Sync
	tle	%icc,	0x0
	fmovsl	%icc,	%f0,	%f0
	sth	%l5,	[%l7 + 0x4C]
	be,pt	%xcc,	loop_2768
	orcc	%g6,	0x1854,	%i1
	fmul8ulx16	%f24,	%f22,	%f2
	movn	%icc,	%l4,	%i4
loop_2768:
	movrlz	%l3,	0x0B5,	%g4
	tvc	%xcc,	0x3
	edge8	%o0,	%o3,	%i0
	membar	0x65
	fpadd16s	%f25,	%f11,	%f27
	orncc	%o6,	%i3,	%g5
	fcmpgt32	%f30,	%f14,	%i6
	sub	%g2,	0x19B7,	%o5
	movge	%icc,	%o1,	%g7
	nop
	setx	0x3F0E52A9A64887E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f4
	edge8l	%l0,	%l2,	%i2
	fmovrdlz	%o7,	%f6,	%f20
	bpos,a,pn	%xcc,	loop_2769
	array32	%i7,	%o2,	%g1
	tg	%xcc,	0x4
	fmovdge	%xcc,	%f23,	%f18
loop_2769:
	tle	%xcc,	0x0
	orncc	%i5,	%l1,	%o4
	edge32n	%g3,	%l5,	%l6
	orncc	%g6,	%l4,	%i1
	fmuld8ulx16	%f4,	%f20,	%f18
	edge8ln	%i4,	%l3,	%g4
	fcmple16	%f8,	%f22,	%o3
	fxors	%f14,	%f22,	%f21
	edge32l	%i0,	%o6,	%i3
	srlx	%g5,	0x06,	%i6
	fandnot1	%f26,	%f2,	%f18
	fcmpgt32	%f20,	%f24,	%g2
	bvc,pn	%xcc,	loop_2770
	movrgz	%o5,	%o1,	%o0
	movne	%xcc,	%g7,	%l0
	fbg,a	%fcc2,	loop_2771
loop_2770:
	tn	%xcc,	0x7
	edge32	%i2,	%l2,	%o7
	fxors	%f18,	%f23,	%f14
loop_2771:
	fbul,a	%fcc1,	loop_2772
	ldd	[%l7 + 0x08],	%i6
	nop
	setx	0x9053D56C,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	fmovdvs	%xcc,	%f11,	%f20
loop_2772:
	movcc	%xcc,	%o2,	%i5
	ldstub	[%l7 + 0x29],	%l1
	edge16l	%o4,	%g3,	%l5
	srax	%g1,	0x1B,	%l6
	fble,a	%fcc0,	loop_2773
	sdivx	%l4,	0x1A28,	%i1
	fbe,a	%fcc3,	loop_2774
	bg,a	loop_2775
loop_2773:
	fpadd16	%f4,	%f20,	%f0
	movleu	%icc,	%i4,	%g6
loop_2774:
	brnz	%g4,	loop_2776
loop_2775:
	ba	loop_2777
	fmovde	%icc,	%f17,	%f12
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x38] %asi,	%f24
loop_2776:
	edge8n	%o3,	%i0,	%o6
loop_2777:
	alignaddr	%l3,	%g5,	%i3
	mulx	%g2,	0x0739,	%i6
	fmovdleu	%icc,	%f1,	%f24
	sra	%o1,	0x15,	%o0
	andn	%g7,	%l0,	%i2
	movrgez	%l2,	%o7,	%o5
	stw	%i7,	[%l7 + 0x58]
	fmovs	%f24,	%f14
	subccc	%i5,	%o2,	%o4
	tcc	%xcc,	0x5
	movn	%icc,	%g3,	%l1
	movcs	%xcc,	%l5,	%g1
	fbul	%fcc2,	loop_2778
	array8	%l4,	%i1,	%i4
	orcc	%l6,	0x19B0,	%g4
	subc	%g6,	0x1198,	%i0
loop_2778:
	smul	%o6,	%l3,	%o3
	tne	%xcc,	0x3
	fba,a	%fcc1,	loop_2779
	edge32	%g5,	%i3,	%i6
	nop
	fitod	%f6,	%f28
	fdtox	%f28,	%f20
	movvc	%xcc,	%o1,	%g2
loop_2779:
	nop
	set	0x58, %l6
	lduwa	[%l7 + %l6] 0x81,	%o0
	andncc	%g7,	%l0,	%i2
	ldsw	[%l7 + 0x38],	%o7
	ldd	[%l7 + 0x50],	%l2
	mulscc	%i7,	0x0377,	%i5
	bvc,pt	%xcc,	loop_2780
	orncc	%o5,	0x1B38,	%o2
	xor	%o4,	0x1A74,	%l1
	umul	%l5,	%g3,	%g1
loop_2780:
	brlz,a	%l4,	loop_2781
	nop
	setx	0xF0441FB7,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	ldub	[%l7 + 0x31],	%i4
	movg	%xcc,	%l6,	%i1
loop_2781:
	fblg	%fcc3,	loop_2782
	edge8n	%g4,	%g6,	%o6
	addc	%l3,	%o3,	%g5
	be,a,pt	%xcc,	loop_2783
loop_2782:
	umul	%i3,	0x17E2,	%i6
	add	%i0,	%g2,	%o1
	bpos,a,pt	%icc,	loop_2784
loop_2783:
	bl,a	%icc,	loop_2785
	tne	%icc,	0x0
	fpack32	%f16,	%f30,	%f30
loop_2784:
	nop
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x5C] %asi,	%f3
loop_2785:
	membar	0x61
	andcc	%o0,	%g7,	%i2
	brlz	%o7,	loop_2786
	flush	%l7 + 0x74
	tleu	%xcc,	0x0
	movn	%xcc,	%l2,	%l0
loop_2786:
	bleu,pt	%xcc,	loop_2787
	movrlez	%i7,	0x196,	%i5
	movgu	%icc,	%o2,	%o4
	mulscc	%l1,	0x1B25,	%o5
loop_2787:
	movcc	%icc,	%l5,	%g1
	movge	%icc,	%g3,	%i4
	fnegd	%f12,	%f14
	fmovsne	%icc,	%f18,	%f29
	smulcc	%l4,	%l6,	%g4
	brlz,a	%g6,	loop_2788
	sth	%i1,	[%l7 + 0x2C]
	nop
	setx	0x375330922A869011,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x9593E9C8E39DDA19,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f30,	%f30
	bcc,a,pt	%icc,	loop_2789
loop_2788:
	membar	0x42
	movne	%xcc,	%l3,	%o6
	movneg	%icc,	%g5,	%o3
loop_2789:
	sdivx	%i3,	0x0CF0,	%i0
	andncc	%i6,	%o1,	%g2
	nop
	setx	0x9E86B342B765013B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF27B4B12A3C9DC77,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f0,	%f0
	alignaddr	%g7,	%i2,	%o0
	movpos	%icc,	%o7,	%l2
	movrgez	%l0,	%i7,	%i5
	andncc	%o4,	%l1,	%o5
	fmul8x16	%f21,	%f2,	%f28
	std	%f12,	[%l7 + 0x60]
	call	loop_2790
	addcc	%l5,	%g1,	%o2
	addc	%i4,	0x1175,	%g3
	tge	%icc,	0x3
loop_2790:
	fmovscc	%icc,	%f4,	%f3
	nop
	fitos	%f3,	%f2
	fstod	%f2,	%f2
	tg	%icc,	0x1
	edge32l	%l6,	%g4,	%l4
	nop
	setx	loop_2791,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%icc,	%g6,	%l3
	brlez	%o6,	loop_2792
	tg	%xcc,	0x6
loop_2791:
	sra	%g5,	%i1,	%o3
	orncc	%i3,	%i0,	%o1
loop_2792:
	edge32l	%i6,	%g7,	%g2
	subccc	%i2,	%o7,	%o0
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x6A] %asi,	%l0
	movrlz	%l2,	%i7,	%o4
	fmovde	%xcc,	%f21,	%f0
	tg	%xcc,	0x7
	brgez,a	%l1,	loop_2793
	andn	%i5,	%l5,	%o5
	tl	%icc,	0x6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g1
loop_2793:
	nop
	set	0x38, %l2
	lduba	[%l7 + %l2] 0x89,	%i4
	edge32ln	%o2,	%l6,	%g4
	fxnors	%f9,	%f13,	%f20
	nop
	set	0x28, %g3
	std	%f4,	[%l7 + %g3]
	movleu	%icc,	%g3,	%l4
	alignaddr	%l3,	%g6,	%o6
	subc	%i1,	%g5,	%i3
	umul	%o3,	0x1E20,	%o1
	fzero	%f6
	edge8ln	%i0,	%i6,	%g7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i2,	%o7
	swap	[%l7 + 0x08],	%g2
	fbne	%fcc3,	loop_2794
	sdiv	%o0,	0x1CCA,	%l0
	tleu	%icc,	0x7
	or	%i7,	%l2,	%o4
loop_2794:
	fpack32	%f12,	%f30,	%f18
	fmovdn	%icc,	%f14,	%f20
	sir	0x024A
	fandnot1s	%f3,	%f7,	%f29
	movrlz	%l1,	0x02A,	%i5
	fnor	%f20,	%f4,	%f0
	movle	%icc,	%o5,	%l5
	movl	%icc,	%g1,	%o2
	te	%icc,	0x6
	bne,pn	%icc,	loop_2795
	prefetch	[%l7 + 0x48],	 0x3
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%i4,	[%g0 + 0x3a0] %asi ripped by fixASI40.pl ripped by fixASI40.pl
loop_2795:
	fnegs	%f25,	%f2
	fmovsge	%xcc,	%f7,	%f1
	edge8ln	%g4,	%l6,	%l4
	xnor	%l3,	0x1B66,	%g3
	ta	%xcc,	0x2
	nop
	setx	0x851B5865,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x7E52B5BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f9,	%f13
	bpos,a	%icc,	loop_2796
	subcc	%o6,	0x0CA3,	%i1
	umul	%g6,	%i3,	%o3
	tvc	%xcc,	0x4
loop_2796:
	movne	%xcc,	%g5,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x6
	nop
	setx	0x15C85EAB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xBA15489D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f5,	%f17
	sdiv	%i0,	0x17CE,	%i6
	umulcc	%i2,	%g7,	%o7
	set	0x7A, %l3
	lduba	[%l7 + %l3] 0x19,	%g2
	movrgz	%l0,	%o0,	%i7
	orncc	%o4,	%l2,	%i5
	fmovdneg	%xcc,	%f11,	%f5
	mulx	%l1,	%o5,	%l5
	sir	0x1F17
	andn	%g1,	0x1A6D,	%i4
	movg	%xcc,	%o2,	%l6
	fmovrdlez	%l4,	%f30,	%f28
	orncc	%g4,	0x1572,	%l3
	xnor	%g3,	0x0FCA,	%o6
	movge	%icc,	%g6,	%i1
	fmovsle	%icc,	%f8,	%f22
	movle	%xcc,	%o3,	%g5
	wr	%g0,	0x27,	%asi
	stwa	%o1,	[%l7 + 0x3C] %asi
	membar	#Sync
	tgu	%xcc,	0x5
	fmovsn	%xcc,	%f28,	%f15
	sir	0x1A2E
	xnorcc	%i3,	%i6,	%i2
	mulx	%i0,	0x0155,	%g7
	edge8ln	%g2,	%o7,	%l0
	array32	%o0,	%i7,	%o4
	srlx	%i5,	%l2,	%o5
	fmovrdgez	%l1,	%f18,	%f4
	edge16	%l5,	%g1,	%o2
	fones	%f10
	tne	%xcc,	0x2
	movleu	%icc,	%l6,	%l4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%i4
	fmovrdgez	%g3,	%f18,	%f12
	ldsh	[%l7 + 0x28],	%o6
	fba	%fcc2,	loop_2797
	bgu,a	%icc,	loop_2798
	movgu	%xcc,	%l3,	%i1
	umulcc	%g6,	%o3,	%o1
loop_2797:
	umulcc	%g5,	%i6,	%i2
loop_2798:
	faligndata	%f30,	%f18,	%f24
	edge16ln	%i0,	%g7,	%g2
	fba	%fcc0,	loop_2799
	sra	%o7,	0x1A,	%i3
	xnorcc	%l0,	%o0,	%i7
	array16	%o4,	%l2,	%o5
loop_2799:
	movn	%xcc,	%i5,	%l1
	nop
	set	0x7F, %o6
	ldsb	[%l7 + %o6],	%g1
	stw	%l5,	[%l7 + 0x14]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l6,	0x0A5B,	%l4
	movrlez	%g4,	0x28D,	%i4
	nop
	setx loop_2800, %l0, %l1
	jmpl %l1, %o2
	fpsub32s	%f11,	%f20,	%f27
	sdivx	%o6,	0x06A0,	%l3
	brgz,a	%i1,	loop_2801
loop_2800:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%g3,	%o3
	taddcc	%g6,	%g5,	%o1
loop_2801:
	array8	%i6,	%i0,	%g7
	umul	%g2,	%i2,	%o7
	fble	%fcc0,	loop_2802
	tneg	%xcc,	0x2
	movrlz	%i3,	%l0,	%i7
	movleu	%icc,	%o4,	%o0
loop_2802:
	tle	%xcc,	0x3
	movpos	%icc,	%o5,	%i5
	tleu	%xcc,	0x4
	popc	0x0FA0,	%l2
	subc	%l1,	0x1624,	%l5
	fmul8x16au	%f24,	%f19,	%f14
	edge16	%l6,	%g1,	%l4
	fpackfix	%f20,	%f10
	subccc	%i4,	0x0118,	%g4
	add	%o2,	0x072B,	%o6
	ldsb	[%l7 + 0x4E],	%i1
	sll	%g3,	0x00,	%l3
	popc	0x09C9,	%g6
	udivcc	%g5,	0x1047,	%o1
	edge8l	%i6,	%i0,	%g7
	faligndata	%f28,	%f28,	%f30
	sdivcc	%o3,	0x0975,	%g2
	umulcc	%o7,	%i3,	%l0
	tl	%xcc,	0x1
	srlx	%i7,	%o4,	%o0
	sir	0x007F
	array16	%o5,	%i2,	%l2
	tle	%icc,	0x6
	edge32l	%i5,	%l1,	%l5
	set	0x30, %i7
	ldswa	[%l7 + %i7] 0x81,	%l6
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8l	%g1,	%l4,	%i4
	set	0x38, %i3
	prefetcha	[%l7 + %i3] 0x0c,	 0x2
	umul	%o2,	%i1,	%g3
	tneg	%xcc,	0x0
	movvc	%xcc,	%l3,	%o6
	add	%g6,	%o1,	%g5
	sdiv	%i0,	0x024C,	%i6
	swap	[%l7 + 0x18],	%o3
	fsrc1	%f24,	%f24
	movg	%icc,	%g7,	%o7
	tsubcc	%g2,	0x1964,	%l0
	xnor	%i7,	%o4,	%i3
	andncc	%o0,	%i2,	%o5
	sll	%i5,	0x13,	%l1
	movl	%xcc,	%l5,	%l6
	fbo	%fcc3,	loop_2803
	sethi	0x1FE4,	%g1
	tgu	%icc,	0x3
	fbl,a	%fcc2,	loop_2804
loop_2803:
	tleu	%xcc,	0x5
	sll	%l2,	0x0B,	%i4
	fsrc2	%f16,	%f24
loop_2804:
	fsrc1	%f28,	%f12
	movle	%icc,	%l4,	%g4
	tsubcc	%i1,	%o2,	%l3
	movneg	%xcc,	%g3,	%g6
	andn	%o6,	%g5,	%i0
	fmovdge	%xcc,	%f19,	%f0
	nop
	fitos	%f11,	%f5
	fstod	%f5,	%f14
	mova	%icc,	%o1,	%i6
	orcc	%o3,	0x1598,	%g7
	edge16n	%o7,	%g2,	%l0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x7C] %asi,	%f1
	nop
	setx	0x4BBBF209,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xD9BED922,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f1,	%f17
	addcc	%o4,	0x0082,	%i3
	nop
	setx	0xB1E5B366206029C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	movpos	%xcc,	%o0,	%i7
	fbge	%fcc3,	loop_2805
	fmovdcc	%icc,	%f7,	%f14
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x3
loop_2805:
	movn	%icc,	%i5,	%o5
	tsubcctv	%l1,	%l6,	%l5
	srax	%l2,	%i4,	%l4
	array8	%g4,	%i1,	%o2
	move	%xcc,	%l3,	%g1
	nop
	setx	0x004513A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	subccc	%g3,	0x1D58,	%o6
	fmul8x16	%f30,	%f14,	%f8
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xnor	%g5,	%g6,	%o1
	xor	%i0,	%o3,	%g7
	nop
	setx	loop_2806,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bl,a	loop_2807
	fcmpne32	%f10,	%f30,	%i6
	taddcc	%g2,	%o7,	%o4
loop_2806:
	movn	%icc,	%i3,	%l0
loop_2807:
	fbu	%fcc3,	loop_2808
	edge8n	%o0,	%i7,	%i2
	fmovscc	%xcc,	%f11,	%f4
	umul	%o5,	%i5,	%l1
loop_2808:
	popc	0x0040,	%l5
	tl	%icc,	0x4
	sdiv	%l2,	0x07DD,	%l6
	ldstub	[%l7 + 0x3C],	%i4
	edge16l	%l4,	%i1,	%o2
	edge8	%g4,	%l3,	%g1
	edge32	%o6,	%g5,	%g3
	xor	%g6,	0x11EA,	%i0
	tle	%icc,	0x7
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0xf1,	%f16
	srl	%o1,	%g7,	%i6
	movn	%xcc,	%g2,	%o3
	nop
	setx	0x05E3C4A5062F8B56,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xDF34A1824117712D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f4,	%f10
	bl,a	loop_2809
	movrgz	%o4,	0x074,	%i3
	umulcc	%l0,	%o7,	%i7
	orcc	%i2,	%o0,	%o5
loop_2809:
	movrlez	%i5,	%l1,	%l5
	fmovde	%xcc,	%f4,	%f31
	mova	%icc,	%l6,	%l2
	movle	%xcc,	%l4,	%i1
	brnz,a	%i4,	loop_2810
	mulx	%g4,	0x1CC4,	%l3
	edge16ln	%o2,	%g1,	%g5
	movrne	%o6,	%g3,	%g6
loop_2810:
	srl	%o1,	%i0,	%i6
	tne	%xcc,	0x0
	fmovsvc	%icc,	%f30,	%f26
	bleu,pt	%icc,	loop_2811
	fnot2	%f10,	%f2
	brgez,a	%g2,	loop_2812
	fmovdcc	%xcc,	%f21,	%f5
loop_2811:
	mulscc	%o3,	%o4,	%g7
	wr	%g0,	0x2b,	%asi
	stba	%l0,	[%l7 + 0x41] %asi
	membar	#Sync
loop_2812:
	fcmpeq16	%f16,	%f2,	%i3
	fmovsg	%icc,	%f30,	%f24
	fors	%f31,	%f19,	%f21
	movvs	%xcc,	%i7,	%o7
	addccc	%i2,	%o0,	%o5
	bvc	loop_2813
	fmovsg	%xcc,	%f30,	%f20
	nop
	fitod	%f12,	%f4
	fdtos	%f4,	%f5
	andncc	%l1,	%l5,	%i5
loop_2813:
	ld	[%l7 + 0x40],	%f9
	stb	%l6,	[%l7 + 0x3A]
	fmovdpos	%xcc,	%f19,	%f9
	bcs,a	loop_2814
	xnor	%l4,	%l2,	%i4
	subccc	%g4,	%i1,	%o2
	bgu,pn	%xcc,	loop_2815
loop_2814:
	fbue,a	%fcc3,	loop_2816
	movle	%xcc,	%g1,	%g5
	xnorcc	%o6,	0x1A9E,	%g3
loop_2815:
	bcs,pt	%icc,	loop_2817
loop_2816:
	edge16l	%g6,	%l3,	%i0
	srlx	%i6,	0x1A,	%g2
	movl	%icc,	%o1,	%o4
loop_2817:
	fbe,a	%fcc1,	loop_2818
	movvs	%icc,	%g7,	%o3
	edge8n	%i3,	%l0,	%i7
	andncc	%o7,	%i2,	%o5
loop_2818:
	brgez,a	%l1,	loop_2819
	fmovdle	%xcc,	%f13,	%f13
	movrgez	%l5,	%o0,	%l6
	taddcc	%l4,	0x1C83,	%i5
loop_2819:
	udivcc	%l2,	0x1046,	%i4
	fpsub16s	%f4,	%f30,	%f10
	membar	0x0B
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x76] %asi,	%i1
	set	0x4C, %o7
	stwa	%o2,	[%l7 + %o7] 0xe3
	membar	#Sync
	fba	%fcc2,	loop_2820
	fmul8x16al	%f9,	%f2,	%f20
	fmovrde	%g1,	%f6,	%f16
	fcmpne32	%f28,	%f28,	%g4
loop_2820:
	tne	%xcc,	0x4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%g5
	fcmple32	%f12,	%f22,	%g3
	set	0x1C, %i1
	ldsba	[%l7 + %i1] 0x19,	%g6
	set	0x50, %l1
	ldda	[%l7 + %l1] 0xeb,	%i0
	be,a,pt	%xcc,	loop_2821
	sllx	%l3,	0x10,	%i6
	tn	%xcc,	0x0
	bvc	%icc,	loop_2822
loop_2821:
	tvs	%xcc,	0x2
	array8	%o1,	%o4,	%g2
	set	0x79, %g5
	stba	%o3,	[%l7 + %g5] 0x89
loop_2822:
	sll	%g7,	%l0,	%i3
	tsubcc	%o7,	%i7,	%i2
	bvc	%xcc,	loop_2823
	movrgz	%l1,	%o5,	%o0
	fcmpne32	%f8,	%f24,	%l5
	sdiv	%l6,	0x0376,	%l4
loop_2823:
	nop
	setx	0xB0F00AAC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f28
	andn	%l2,	%i4,	%i1
	wr	%g0,	0x0c,	%asi
	sta	%f10,	[%l7 + 0x48] %asi
	udivx	%i5,	0x1D97,	%g1
	sdivx	%o2,	0x1747,	%o6
	movcc	%xcc,	%g4,	%g5
	fmovrdlez	%g6,	%f26,	%f26
	fmovrslz	%g3,	%f0,	%f29
	set	0x14, %g2
	swapa	[%l7 + %g2] 0x81,	%l3
	alignaddr	%i0,	%o1,	%o4
	fbu,a	%fcc0,	loop_2824
	for	%f10,	%f30,	%f8
	tge	%icc,	0x1
	fblg,a	%fcc3,	loop_2825
loop_2824:
	move	%xcc,	%g2,	%o3
	edge16	%g7,	%i6,	%l0
	movrgez	%i3,	0x203,	%i7
loop_2825:
	stbar
	movre	%i2,	%o7,	%l1
	tg	%icc,	0x7
	movl	%icc,	%o5,	%o0
	nop
	setx loop_2826, %l0, %l1
	jmpl %l1, %l6
	nop
	setx	0x515C8E3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xA0B7896E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f28,	%f11
	for	%f24,	%f22,	%f16
	alignaddrl	%l5,	%l4,	%i4
loop_2826:
	array32	%i1,	%l2,	%g1
	fmovsgu	%xcc,	%f16,	%f27
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i5
	fbl,a	%fcc0,	loop_2827
	fmovde	%icc,	%f17,	%f30
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x5B] %asi,	%o2
loop_2827:
	movrgez	%g4,	%g5,	%o6
	fpadd32	%f0,	%f4,	%f18
	tg	%icc,	0x1
	orncc	%g6,	%g3,	%l3
	movne	%icc,	%i0,	%o4
	add	%g2,	0x19AB,	%o3
	movg	%icc,	%o1,	%g7
	sra	%l0,	0x12,	%i3
	edge32ln	%i6,	%i2,	%o7
	xorcc	%l1,	%o5,	%i7
	fmovscc	%icc,	%f23,	%f28
	nop
	setx	0xE077AD08,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	tn	%icc,	0x7
	brz,a	%o0,	loop_2828
	fmovrslez	%l6,	%f17,	%f16
	movne	%icc,	%l5,	%l4
	bne,pn	%xcc,	loop_2829
loop_2828:
	movrne	%i4,	%i1,	%l2
	movrgez	%g1,	0x145,	%i5
	bshuffle	%f20,	%f16,	%f8
loop_2829:
	array16	%g4,	%g5,	%o2
	addccc	%o6,	%g3,	%g6
	xor	%l3,	0x1ECD,	%o4
	fpadd32s	%f15,	%f6,	%f10
	nop
	fitod	%f6,	%f30
	fdtos	%f30,	%f11
	brlz,a	%i0,	loop_2830
	movge	%icc,	%g2,	%o3
	fbn	%fcc3,	loop_2831
	edge16n	%o1,	%l0,	%g7
loop_2830:
	fmovrdgz	%i3,	%f12,	%f20
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i6
loop_2831:
	movrgez	%o7,	%l1,	%o5
	add	%i2,	%o0,	%i7
	subccc	%l5,	%l6,	%i4
	movne	%xcc,	%i1,	%l2
	lduw	[%l7 + 0x40],	%l4
	fpsub32s	%f3,	%f1,	%f24
	fcmple32	%f12,	%f4,	%i5
	srl	%g4,	%g5,	%o2
	fmovrdgez	%o6,	%f10,	%f12
	tcc	%xcc,	0x0
	udivcc	%g1,	0x0E26,	%g3
	brlz	%g6,	loop_2832
	umulcc	%o4,	0x0E09,	%i0
	nop
	setx	0x4D73AFC5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xCA23811F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f1,	%f31
	sllx	%g2,	0x0C,	%o3
loop_2832:
	fornot1	%f30,	%f14,	%f28
	edge16n	%o1,	%l0,	%g7
	fpsub32	%f8,	%f12,	%f18
	fcmpgt16	%f16,	%f4,	%l3
	sub	%i6,	%i3,	%l1
	addccc	%o7,	%o5,	%i2
	fnot2	%f4,	%f0
	edge8n	%i7,	%o0,	%l6
	movn	%xcc,	%i4,	%i1
	ldd	[%l7 + 0x48],	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f10,	%f6
	fdtoi	%f6,	%f10
	bneg,a	loop_2833
	movrne	%l5,	%l2,	%i5
	brlz,a	%g4,	loop_2834
	movcs	%icc,	%l4,	%g5
loop_2833:
	edge8ln	%o2,	%o6,	%g3
	tgu	%icc,	0x2
loop_2834:
	edge32n	%g1,	%g6,	%o4
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g2
	movne	%icc,	%o3,	%o1
	prefetch	[%l7 + 0x20],	 0x2
	orcc	%i0,	0x0B34,	%l0
	edge8n	%l3,	%g7,	%i3
	fbge,a	%fcc2,	loop_2835
	fmovsle	%xcc,	%f26,	%f2
	brlz,a	%i6,	loop_2836
	nop
	fitos	%f12,	%f15
	fstox	%f15,	%f2
loop_2835:
	tgu	%xcc,	0x4
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x89,	%o6
loop_2836:
	stb	%o5,	[%l7 + 0x5F]
	udiv	%l1,	0x0202,	%i2
	sra	%o0,	0x0B,	%l6
	sub	%i4,	0x12F0,	%i1
	subccc	%i7,	%l5,	%i5
	bleu,a	%xcc,	loop_2837
	edge8ln	%l2,	%g4,	%g5
	fbo	%fcc1,	loop_2838
	fbule,a	%fcc2,	loop_2839
loop_2837:
	fmovdneg	%xcc,	%f30,	%f20
	edge8l	%l4,	%o6,	%g3
loop_2838:
	movvs	%icc,	%g1,	%o2
loop_2839:
	brlz	%o4,	loop_2840
	st	%f16,	[%l7 + 0x4C]
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
loop_2840:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o3
	orncc	%g2,	%i0,	%l0
	edge16l	%l3,	%o1,	%g7
	nop
	setx loop_2841, %l0, %l1
	jmpl %l1, %i3
	fba,a	%fcc2,	loop_2842
	orcc	%i6,	%o7,	%l1
	xorcc	%o5,	0x1E07,	%i2
loop_2841:
	movrne	%o0,	%l6,	%i4
loop_2842:
	addccc	%i7,	0x0D5D,	%l5
	tleu	%xcc,	0x2
	udiv	%i5,	0x0D29,	%l2
	mulx	%g4,	0x00B6,	%i1
	array8	%l4,	%o6,	%g5
	fcmpne32	%f22,	%f14,	%g3
	movne	%xcc,	%g1,	%o2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x24] %asi,	%g6
	taddcc	%o3,	0x10FF,	%o4
	tcs	%xcc,	0x2
	movg	%icc,	%g2,	%i0
	xnorcc	%l0,	0x11EC,	%o1
	ldx	[%l7 + 0x58],	%g7
	array8	%i3,	%l3,	%o7
	alignaddrl	%l1,	%i6,	%i2
	tn	%xcc,	0x7
	orn	%o0,	0x1755,	%o5
	orncc	%i4,	%i7,	%l6
	fpadd32s	%f11,	%f17,	%f15
	tle	%icc,	0x5
	tge	%icc,	0x6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%i5
	fmovrdlz	%l5,	%f24,	%f4
	set	0x1C, %g7
	lda	[%l7 + %g7] 0x18,	%f2
	movvc	%xcc,	%l2,	%g4
	edge16n	%l4,	%i1,	%o6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g3,	%g1
	smul	%o2,	%g6,	%g5
	fandnot2s	%f14,	%f16,	%f17
	tg	%xcc,	0x1
	edge16l	%o3,	%o4,	%i0
	edge8l	%g2,	%o1,	%g7
	fmovdneg	%icc,	%f22,	%f25
	tne	%icc,	0x3
	call	loop_2843
	edge32l	%i3,	%l3,	%o7
	fmovrslz	%l0,	%f30,	%f2
	edge32l	%i6,	%l1,	%i2
loop_2843:
	edge8l	%o0,	%i4,	%o5
	tleu	%xcc,	0x2
	andn	%i7,	0x0E7D,	%l6
	nop
	setx loop_2844, %l0, %l1
	jmpl %l1, %l5
	subccc	%l2,	0x0F49,	%g4
	tleu	%xcc,	0x6
	tsubcc	%i5,	0x1302,	%l4
loop_2844:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i1
	subc	%g3,	0x11D5,	%g1
	fmovspos	%icc,	%f19,	%f6
	alignaddrl	%o2,	%o6,	%g6
	movg	%xcc,	%g5,	%o3
	fbue,a	%fcc0,	loop_2845
	alignaddrl	%o4,	%i0,	%o1
	and	%g7,	0x0A32,	%g2
	addcc	%i3,	0x05F0,	%o7
loop_2845:
	fbu	%fcc3,	loop_2846
	fmovdcs	%icc,	%f3,	%f27
	subccc	%l3,	%l0,	%l1
	movrlez	%i6,	0x239,	%o0
loop_2846:
	movge	%xcc,	%i4,	%o5
	ldsb	[%l7 + 0x15],	%i7
	orncc	%l6,	0x03A5,	%i2
	addcc	%l2,	%g4,	%i5
	taddcctv	%l5,	%i1,	%g3
	brgez,a	%l4,	loop_2847
	movrgez	%o2,	%g1,	%g6
	fcmple16	%f28,	%f0,	%o6
	nop
	set	0x18, %l5
	ldx	[%l7 + %l5],	%o3
loop_2847:
	nop
	setx	0xD6A82FB2607569B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	nop
	setx	0x305E4049,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	fbe	%fcc1,	loop_2848
	tne	%xcc,	0x2
	sub	%o4,	%g5,	%i0
	tvs	%xcc,	0x7
loop_2848:
	fmovsgu	%icc,	%f16,	%f6
	fmul8sux16	%f8,	%f2,	%f10
	fones	%f14
	ta	%icc,	0x0
	andcc	%o1,	0x0991,	%g7
	tsubcc	%g2,	%i3,	%l3
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%o7
	xor	%l0,	0x0AA1,	%l1
	ldsh	[%l7 + 0x6C],	%o0
	mova	%xcc,	%i4,	%i6
	add	%o5,	0x10B1,	%l6
	tcs	%icc,	0x6
	be,pt	%icc,	loop_2849
	brlez,a	%i7,	loop_2850
	addcc	%i2,	0x0829,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2849:
	mulx	%i5,	0x1EB8,	%l5
loop_2850:
	movne	%xcc,	%l2,	%g3
	fcmpgt16	%f20,	%f0,	%l4
	ldsb	[%l7 + 0x3C],	%o2
	edge16	%g1,	%g6,	%o6
	movg	%icc,	%i1,	%o4
	edge8ln	%g5,	%i0,	%o1
	nop
	setx	0x37E0E1D8C06F802B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	set	0x70, %o2
	swapa	[%l7 + %o2] 0x18,	%o3
	tl	%xcc,	0x0
	subccc	%g7,	%g2,	%i3
	fmovsg	%icc,	%f6,	%f14
	xnor	%l3,	%o7,	%l0
	movre	%l1,	%o0,	%i6
	tgu	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x3F],	%i4
	nop
	fitos	%f1,	%f11
	fstox	%f11,	%f0
	fxtos	%f0,	%f23
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x89,	%o5,	%l6
	add	%i7,	0x1776,	%i2
	edge8	%i5,	%g4,	%l5
	edge32n	%g3,	%l2,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a,pt	%icc,	loop_2851
	edge16l	%g1,	%l4,	%g6
	tle	%icc,	0x0
	smul	%o6,	%o4,	%g5
loop_2851:
	nop
	setx	0xD9805F4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x85624C3E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f24,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez,a	%i0,	loop_2852
	taddcc	%o1,	0x0C30,	%o3
	movrlez	%g7,	0x254,	%g2
	fmovsvs	%xcc,	%f4,	%f7
loop_2852:
	nop
	setx	0x2B5EDD48E042636E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	flush	%l7 + 0x78
	bne,pn	%xcc,	loop_2853
	edge32l	%i1,	%l3,	%i3
	movle	%xcc,	%o7,	%l1
	fbue	%fcc0,	loop_2854
loop_2853:
	fornot1	%f0,	%f2,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o0,	%l0,	%i6
loop_2854:
	fmovrsgez	%o5,	%f9,	%f30
	fmul8ulx16	%f6,	%f30,	%f18
	fble	%fcc0,	loop_2855
	edge32ln	%i4,	%i7,	%i2
	alignaddr	%l6,	%i5,	%l5
	addccc	%g4,	0x01FD,	%g3
loop_2855:
	tn	%icc,	0x3
	edge32	%l2,	%o2,	%g1
	movrgez	%g6,	0x360,	%o6
	set	0x18, %o3
	prefetcha	[%l7 + %o3] 0x19,	 0x1
	xorcc	%g5,	%o4,	%i0
	call	loop_2856
	fbo	%fcc0,	loop_2857
	stw	%o1,	[%l7 + 0x34]
	sdivx	%o3,	0x07AF,	%g7
loop_2856:
	tneg	%icc,	0x0
loop_2857:
	xnor	%g2,	0x127E,	%l3
	edge8ln	%i1,	%o7,	%l1
	movle	%icc,	%i3,	%o0
	addccc	%l0,	0x09F2,	%i6
	movn	%icc,	%o5,	%i7
	udivx	%i2,	0x16ED,	%l6
	or	%i4,	%l5,	%i5
	tle	%xcc,	0x4
	edge32n	%g4,	%l2,	%g3
	fmul8x16al	%f0,	%f8,	%f26
	edge8l	%g1,	%o2,	%g6
	sethi	0x05C1,	%l4
	smulcc	%g5,	0x0D8D,	%o4
	smul	%o6,	%i0,	%o1
	edge8	%o3,	%g7,	%g2
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f26
	fxtod	%f26,	%f4
	tpos	%icc,	0x6
	fzeros	%f21
	srlx	%i1,	0x0A,	%l3
	edge16	%o7,	%l1,	%i3
	addccc	%l0,	%i6,	%o5
	bne,a,pt	%xcc,	loop_2858
	bn,pt	%icc,	loop_2859
	move	%xcc,	%i7,	%o0
	edge8n	%l6,	%i4,	%l5
loop_2858:
	fnot1s	%f3,	%f10
loop_2859:
	fmovdle	%icc,	%f18,	%f22
	fmovrslez	%i2,	%f19,	%f24
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x64] %asi,	%g4
	brgez,a	%l2,	loop_2860
	brnz	%i5,	loop_2861
	fandnot2	%f12,	%f2,	%f20
	membar	0x70
loop_2860:
	fcmpne16	%f14,	%f26,	%g3
loop_2861:
	xnorcc	%o2,	0x0206,	%g6
	srax	%l4,	0x19,	%g5
	xorcc	%o4,	%o6,	%g1
	movrlz	%i0,	%o1,	%g7
	nop
	setx	loop_2862,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%g2,	%i1,	%l3
	xorcc	%o7,	0x1C40,	%o3
	edge8l	%i3,	%l0,	%l1
loop_2862:
	stw	%o5,	[%l7 + 0x14]
	umul	%i6,	%i7,	%l6
	edge16	%o0,	%l5,	%i2
	sdivcc	%i4,	0x14EF,	%l2
	edge16ln	%g4,	%i5,	%o2
	fxnors	%f18,	%f29,	%f4
	ba,pt	%icc,	loop_2863
	tgu	%icc,	0x3
	fbge,a	%fcc2,	loop_2864
	fbge,a	%fcc3,	loop_2865
loop_2863:
	ldsw	[%l7 + 0x78],	%g6
	fzeros	%f2
loop_2864:
	fpsub16s	%f9,	%f28,	%f26
loop_2865:
	sllx	%g3,	%l4,	%o4
	wr	%g0,	0x89,	%asi
	sta	%f29,	[%l7 + 0x28] %asi
	bneg	loop_2866
	fmovrdne	%o6,	%f28,	%f24
	fnot2s	%f26,	%f20
	fba	%fcc3,	loop_2867
loop_2866:
	bgu,pn	%icc,	loop_2868
	alignaddrl	%g1,	%i0,	%o1
	bg,pn	%xcc,	loop_2869
loop_2867:
	tvs	%icc,	0x5
loop_2868:
	xnor	%g7,	0x062E,	%g2
	tcc	%icc,	0x0
loop_2869:
	fbge	%fcc0,	loop_2870
	tleu	%icc,	0x5
	ldd	[%l7 + 0x78],	%g4
	fsrc2s	%f15,	%f1
loop_2870:
	movne	%xcc,	%l3,	%i1
	alignaddrl	%o7,	%o3,	%i3
	edge16l	%l1,	%o5,	%l0
	addcc	%i7,	%i6,	%l6
	sdivcc	%o0,	0x16B3,	%l5
	edge32ln	%i4,	%i2,	%g4
	tcs	%icc,	0x2
	bne,a,pt	%icc,	loop_2871
	swap	[%l7 + 0x78],	%l2
	std	%f24,	[%l7 + 0x08]
	xorcc	%o2,	%g6,	%i5
loop_2871:
	smul	%g3,	0x1280,	%o4
	fandnot2	%f20,	%f20,	%f10
	pdist	%f10,	%f24,	%f20
	fbue,a	%fcc2,	loop_2872
	or	%l4,	0x0626,	%g1
	fbge,a	%fcc1,	loop_2873
	sub	%o6,	0x1D2F,	%o1
loop_2872:
	bneg	%icc,	loop_2874
	udivcc	%i0,	0x0E9A,	%g7
loop_2873:
	fmovsvs	%xcc,	%f8,	%f23
	fmovrse	%g5,	%f20,	%f27
loop_2874:
	sra	%l3,	%i1,	%o7
	fpsub16	%f18,	%f0,	%f20
	movneg	%xcc,	%g2,	%o3
	andncc	%l1,	%o5,	%l0
	movleu	%icc,	%i7,	%i6
	fzeros	%f22
	xnor	%l6,	0x0357,	%i3
	xor	%o0,	0x090B,	%l5
	fnands	%f18,	%f12,	%f2
	movne	%icc,	%i4,	%g4
	nop
	setx	loop_2875,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x70],	%f16
	edge32n	%i2,	%o2,	%g6
	pdist	%f4,	%f12,	%f14
loop_2875:
	movle	%xcc,	%i5,	%g3
	set	0x50, %i4
	ldswa	[%l7 + %i4] 0x19,	%o4
	ldstub	[%l7 + 0x37],	%l2
	swap	[%l7 + 0x54],	%g1
	tsubcctv	%l4,	%o1,	%i0
	fmovrse	%g7,	%f0,	%f31
	brlez	%g5,	loop_2876
	xorcc	%l3,	%o6,	%i1
	brgez,a	%o7,	loop_2877
	movrgz	%o3,	%l1,	%o5
loop_2876:
	fxors	%f0,	%f18,	%f5
	andcc	%g2,	%l0,	%i7
loop_2877:
	fbule,a	%fcc0,	loop_2878
	call	loop_2879
	umul	%l6,	0x10DC,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2878:
	umul	%o0,	%i3,	%i4
loop_2879:
	edge8	%l5,	%i2,	%g4
	fbug,a	%fcc3,	loop_2880
	tcc	%xcc,	0x0
	set	0x58, %g6
	swapa	[%l7 + %g6] 0x81,	%g6
loop_2880:
	addccc	%o2,	%g3,	%o4
	fbl	%fcc3,	loop_2881
	smul	%i5,	%l2,	%g1
	fbo,a	%fcc3,	loop_2882
	movvc	%xcc,	%l4,	%i0
loop_2881:
	edge16l	%g7,	%o1,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2882:
	fbule	%fcc3,	loop_2883
	nop
	setx	0x55BBABE645DD13CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9DB250349947CDE7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f0,	%f2
	fzeros	%f16
	tge	%xcc,	0x1
loop_2883:
	fpmerge	%f14,	%f30,	%f0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g5,	%o6
	and	%o7,	0x0B55,	%o3
	nop
	setx	0x42B97627,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f26
	bge,a	loop_2884
	udivcc	%l1,	0x0BA0,	%o5
	add	%g2,	0x05E1,	%i1
	brlz	%l0,	loop_2885
loop_2884:
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f20
	fxtod	%f20,	%f4
	nop
	setx	loop_2886,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbule,a	%fcc1,	loop_2887
loop_2885:
	sdivcc	%l6,	0x1AFB,	%i7
	movle	%xcc,	%o0,	%i3
loop_2886:
	fpadd32s	%f20,	%f12,	%f16
loop_2887:
	membar	0x53
	taddcctv	%i6,	0x0403,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%xcc,	%f16,	%f21
	nop
	fitod	%f2,	%f22
	fdtox	%f22,	%f26
	sllx	%i2,	%g4,	%l5
	fands	%f8,	%f23,	%f12
	stx	%o2,	[%l7 + 0x40]
	fmovdge	%icc,	%f23,	%f9
	orn	%g3,	%g6,	%i5
	array16	%l2,	%g1,	%o4
	fbn	%fcc3,	loop_2888
	movvc	%xcc,	%l4,	%i0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
loop_2888:
	move	%xcc,	%l3,	%g5
	te	%icc,	0x0
	fmovrdgez	%g7,	%f6,	%f0
	edge8	%o7,	%o6,	%l1
	set	0x2C, %o0
	stwa	%o5,	[%l7 + %o0] 0x2b
	membar	#Sync
	fmovdge	%icc,	%f29,	%f13
	xor	%g2,	%o3,	%i1
	subccc	%l0,	%i7,	%l6
	umulcc	%o0,	%i6,	%i3
	sllx	%i2,	%g4,	%l5
	bvc,a,pt	%icc,	loop_2889
	movrgez	%i4,	%o2,	%g6
	nop
	setx	loop_2890,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovda	%icc,	%f15,	%f30
loop_2889:
	fbge	%fcc3,	loop_2891
	nop
	fitos	%f6,	%f31
	fstoi	%f31,	%f16
loop_2890:
	ta	%icc,	0x1
	call	loop_2892
loop_2891:
	fbul	%fcc1,	loop_2893
	fba	%fcc1,	loop_2894
	mulscc	%g3,	0x1548,	%i5
loop_2892:
	fbu,a	%fcc1,	loop_2895
loop_2893:
	fpadd32s	%f21,	%f29,	%f11
loop_2894:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%g1
loop_2895:
	nop
	setx	0x00547AF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	tn	%xcc,	0x5
	nop
	fitos	%f13,	%f17
	fstoi	%f17,	%f13
	movle	%icc,	%l4,	%i0
	fpsub32s	%f28,	%f18,	%f20
	popc	%o1,	%o4
	addcc	%l3,	0x0826,	%g5
	fbe,a	%fcc1,	loop_2896
	umul	%g7,	0x0A89,	%o6
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2896:
	array8	%o7,	%l1,	%o5
	tvc	%xcc,	0x3
	ldx	[%l7 + 0x68],	%g2
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f6
	fpsub32	%f12,	%f8,	%f26
	set	0x0C, %i0
	sta	%f28,	[%l7 + %i0] 0x10
	array8	%i1,	%l0,	%o3
	sra	%l6,	%o0,	%i7
	smulcc	%i6,	%i3,	%i2
	bne,a,pn	%icc,	loop_2897
	tcs	%xcc,	0x0
	umul	%l5,	%i4,	%g4
	tcc	%icc,	0x6
loop_2897:
	and	%g6,	0x155E,	%g3
	fsrc2s	%f20,	%f31
	addcc	%o2,	%i5,	%g1
	srax	%l2,	%l4,	%o1
	movre	%i0,	0x156,	%l3
	orn	%g5,	%o4,	%g7
	te	%xcc,	0x2
	move	%xcc,	%o7,	%l1
	brlz	%o5,	loop_2898
	ldstub	[%l7 + 0x43],	%o6
	smul	%g2,	0x1101,	%i1
	xnorcc	%o3,	0x104C,	%l0
loop_2898:
	tgu	%icc,	0x0
	tneg	%xcc,	0x6
	movgu	%icc,	%l6,	%o0
	for	%f10,	%f8,	%f14
	edge16	%i7,	%i3,	%i2
	fzero	%f20
	fmovsne	%xcc,	%f19,	%f31
	tge	%icc,	0x2
	fmovdvs	%icc,	%f2,	%f5
	sir	0x09AA
	set	0x40, %i2
	ldxa	[%l7 + %i2] 0x14,	%l5
	bshuffle	%f6,	%f14,	%f28
	edge32	%i4,	%g4,	%g6
	fmul8x16	%f15,	%f14,	%f20
	nop
	setx	0xC01B1F7F321BC896,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x03669A4107C3F76C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f18,	%f0
	nop
	fitod	%f10,	%f22
	fdtox	%f22,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f26,	%f11
	srax	%g3,	%o2,	%i5
	xnorcc	%i6,	%l2,	%g1
	umul	%l4,	%i0,	%o1
	fornot1s	%f7,	%f9,	%f26
	fmovrdgez	%l3,	%f14,	%f26
	udivx	%g5,	0x0A99,	%o4
	udivcc	%o7,	0x1C20,	%g7
	fnot2s	%f31,	%f27
	movrlz	%o5,	0x077,	%l1
	bne,a	loop_2899
	lduw	[%l7 + 0x7C],	%g2
	sll	%i1,	0x04,	%o6
	tgu	%icc,	0x1
loop_2899:
	fandnot1s	%f14,	%f9,	%f1
	bpos,a,pt	%icc,	loop_2900
	subc	%l0,	0x1406,	%o3
	stbar
	umulcc	%o0,	0x030D,	%i7
loop_2900:
	sethi	0x0444,	%l6
	fandnot1	%f24,	%f20,	%f24
	bg,pt	%icc,	loop_2901
	srl	%i2,	%i3,	%i4
	fmovdleu	%xcc,	%f18,	%f26
	tl	%icc,	0x7
loop_2901:
	tgu	%icc,	0x3
	edge16n	%l5,	%g4,	%g6
	taddcc	%o2,	%i5,	%g3
	tg	%icc,	0x6
	edge16n	%l2,	%i6,	%l4
	fmovsn	%xcc,	%f31,	%f18
	edge16l	%g1,	%i0,	%o1
	edge16l	%l3,	%o4,	%o7
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f16
	fxtod	%f16,	%f2
	sllx	%g5,	0x0F,	%o5
	bvc,pt	%icc,	loop_2902
	bge	loop_2903
	nop
	setx	0xF6E167DE70659F70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	move	%xcc,	%g7,	%l1
loop_2902:
	umulcc	%g2,	%i1,	%l0
loop_2903:
	lduh	[%l7 + 0x4C],	%o6
	taddcc	%o3,	%o0,	%i7
	fmovdl	%icc,	%f13,	%f9
	subc	%l6,	%i2,	%i3
	fsrc1	%f6,	%f18
	fmovdg	%icc,	%f23,	%f3
	movcc	%xcc,	%i4,	%g4
	fbu,a	%fcc0,	loop_2904
	umulcc	%g6,	%l5,	%o2
	fmovda	%xcc,	%f15,	%f12
	sdiv	%g3,	0x0C9A,	%i5
loop_2904:
	movneg	%xcc,	%l2,	%i6
	ld	[%l7 + 0x44],	%f20
	fble	%fcc2,	loop_2905
	tpos	%icc,	0x5
	sdiv	%l4,	0x1553,	%i0
	set	0x63, %l4
	stba	%o1,	[%l7 + %l4] 0xe3
	membar	#Sync
loop_2905:
	bge	%xcc,	loop_2906
	tcc	%icc,	0x5
	tpos	%icc,	0x0
	movleu	%icc,	%l3,	%g1
loop_2906:
	ble,pn	%icc,	loop_2907
	nop
	setx loop_2908, %l0, %l1
	jmpl %l1, %o7
	tvc	%icc,	0x2
	orncc	%o4,	0x1EFC,	%o5
loop_2907:
	and	%g7,	0x1E12,	%l1
loop_2908:
	movvs	%xcc,	%g2,	%g5
	srax	%l0,	0x0F,	%i1
	fexpand	%f23,	%f22
	set	0x17, %l0
	stba	%o3,	[%l7 + %l0] 0x27
	membar	#Sync
	tne	%xcc,	0x7
	edge16ln	%o0,	%o6,	%i7
	flush	%l7 + 0x50
	mova	%xcc,	%i2,	%i3
	orn	%i4,	%l6,	%g4
	fmovsvs	%xcc,	%f26,	%f31
	tvs	%icc,	0x1
	ble,pn	%icc,	loop_2909
	fsrc1s	%f3,	%f17
	fabsd	%f6,	%f24
	prefetch	[%l7 + 0x30],	 0x3
loop_2909:
	membar	0x0B
	fmovsn	%icc,	%f2,	%f28
	edge32n	%g6,	%l5,	%o2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	fmuld8sux16	%f22,	%f24,	%f0
	umul	%g3,	%i6,	%l2
	xnor	%i0,	%l4,	%l3
	tgu	%xcc,	0x0
	brnz	%o1,	loop_2910
	addc	%g1,	%o4,	%o7
	ldub	[%l7 + 0x76],	%o5
	fnegd	%f16,	%f20
loop_2910:
	fmovdcs	%icc,	%f17,	%f28
	orn	%g7,	0x1E27,	%g2
	nop
	setx	0xA04D740F,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	stb	%l1,	[%l7 + 0x34]
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x74] %asi,	%g5
	tsubcctv	%l0,	%i1,	%o3
	xnor	%o6,	0x1C8A,	%i7
	xor	%i2,	0x08D3,	%i3
	add	%o0,	0x1D1A,	%l6
	udiv	%g4,	0x1EFD,	%g6
	set	0x78, %o4
	ldswa	[%l7 + %o4] 0x19,	%i4
	udivcc	%l5,	0x15D9,	%o2
	set	0x34, %o5
	sta	%f12,	[%l7 + %o5] 0x04
	tn	%xcc,	0x5
	xor	%g3,	0x072E,	%i5
	fsrc1s	%f24,	%f10
	movrgz	%i6,	0x28F,	%i0
	fbo	%fcc3,	loop_2911
	fmovdge	%icc,	%f30,	%f8
	movleu	%icc,	%l2,	%l4
	movn	%xcc,	%o1,	%g1
loop_2911:
	nop
	fitos	%f7,	%f17
	fstoi	%f17,	%f7
	udiv	%l3,	0x0F2B,	%o7
	fbue	%fcc3,	loop_2912
	fpsub16	%f10,	%f4,	%f26
	bgu	loop_2913
	edge32n	%o4,	%g7,	%g2
loop_2912:
	nop
	set	0x10, %i5
	stxa	%o5,	[%l7 + %i5] 0x14
loop_2913:
	tpos	%xcc,	0x4
	orncc	%g5,	0x1B24,	%l1
	fcmpne32	%f26,	%f12,	%i1
	mulscc	%l0,	%o3,	%o6
	fpadd32	%f18,	%f4,	%f2
	fmovsleu	%icc,	%f30,	%f5
	fcmpeq16	%f6,	%f26,	%i2
	movne	%xcc,	%i3,	%i7
	fpmerge	%f3,	%f27,	%f8
	xnor	%l6,	0x18DD,	%o0
	fcmple32	%f28,	%f14,	%g6
	swap	[%l7 + 0x1C],	%i4
	tn	%xcc,	0x7
	fmovdge	%xcc,	%f3,	%f28
	ldub	[%l7 + 0x6D],	%l5
	orcc	%o2,	0x02B9,	%g3
	alignaddrl	%i5,	%g4,	%i6
	or	%l2,	%l4,	%i0
	array8	%o1,	%g1,	%o7
	for	%f30,	%f26,	%f26
	xnorcc	%l3,	%o4,	%g2
	wr	%g0,	0x23,	%asi
	stha	%o5,	[%l7 + 0x0E] %asi
	membar	#Sync
	call	loop_2914
	sdivcc	%g5,	0x0320,	%l1
	fmovrsgez	%i1,	%f0,	%f28
	set	0x40, %o1
	stba	%l0,	[%l7 + %o1] 0x80
loop_2914:
	movgu	%xcc,	%g7,	%o6
	set	0x38, %g4
	stha	%i2,	[%l7 + %g4] 0x89
	bne,a,pn	%icc,	loop_2915
	edge16ln	%o3,	%i7,	%i3
	tge	%xcc,	0x3
	alignaddrl	%l6,	%g6,	%o0
loop_2915:
	tpos	%icc,	0x3
	movrlz	%i4,	0x0E1,	%o2
	fmovrdgz	%l5,	%f16,	%f18
	fxor	%f14,	%f4,	%f24
	tn	%icc,	0x5
	movl	%xcc,	%g3,	%i5
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f14
	fxtod	%f14,	%f14
	movne	%xcc,	%i6,	%g4
	fmovde	%xcc,	%f18,	%f22
	tcc	%xcc,	0x6
	sethi	0x02B3,	%l4
	movl	%xcc,	%l2,	%i0
	brlz	%o1,	loop_2916
	array32	%g1,	%o7,	%o4
	smul	%l3,	%g2,	%o5
	addcc	%g5,	%i1,	%l1
loop_2916:
	nop
	setx	0xE062B058004D46F3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	subccc	%l0,	0x1A98,	%o6
	movneg	%icc,	%i2,	%o3
	mova	%xcc,	%g7,	%i7
	popc	0x0BBA,	%l6
	movrlz	%i3,	%o0,	%i4
	and	%g6,	0x0BDB,	%l5
	bg	%icc,	loop_2917
	fmovdcs	%xcc,	%f28,	%f31
	movrlz	%o2,	%g3,	%i6
	fbu	%fcc3,	loop_2918
loop_2917:
	nop
	setx loop_2919, %l0, %l1
	jmpl %l1, %i5
	smulcc	%l4,	0x1BD7,	%l2
	addccc	%g4,	0x1777,	%i0
loop_2918:
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f12
loop_2919:
	and	%o1,	%g1,	%o7
	edge8n	%l3,	%o4,	%o5
	srax	%g5,	%g2,	%i1
	fbule,a	%fcc2,	loop_2920
	fmovdvc	%xcc,	%f27,	%f13
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x51] %asi,	%l0
loop_2920:
	fsrc1s	%f18,	%f5
	smulcc	%l1,	%o6,	%o3
	tcs	%xcc,	0x1
	fxnors	%f31,	%f10,	%f22
	udivcc	%i2,	0x0331,	%g7
	nop
	set	0x50, %l2
	lduw	[%l7 + %l2],	%i7
	xorcc	%l6,	0x079B,	%i3
	movcc	%xcc,	%i4,	%o0
	set	0x6C, %l6
	sta	%f7,	[%l7 + %l6] 0x14
	xnorcc	%l5,	%o2,	%g3
	fsrc1	%f0,	%f26
	sdiv	%g6,	0x1A1F,	%i6
	edge32n	%l4,	%l2,	%i5
	std	%f30,	[%l7 + 0x08]
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	be,pt	%icc,	loop_2921
	tgu	%icc,	0x0
	fmovdne	%icc,	%f26,	%f15
	udivx	%g4,	0x01D3,	%g1
loop_2921:
	popc	%o7,	%o1
	brnz,a	%l3,	loop_2922
	alignaddr	%o4,	%g5,	%o5
	subcc	%g2,	0x0733,	%i1
	fmovsge	%icc,	%f16,	%f18
loop_2922:
	stx	%l0,	[%l7 + 0x18]
	movrgz	%o6,	%l1,	%o3
	srax	%i2,	%g7,	%i7
	and	%l6,	0x1D6A,	%i4
	add	%o0,	%l5,	%o2
	sllx	%g3,	0x17,	%i3
	tg	%icc,	0x0
	fmovspos	%xcc,	%f24,	%f21
	tleu	%xcc,	0x7
	array32	%g6,	%l4,	%i6
	nop
	setx	0xE73ADA530C6FA7BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xE49BB1601EF71A27,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f4,	%f26
	movne	%icc,	%i5,	%l2
	srax	%g4,	0x12,	%g1
	tcs	%xcc,	0x4
	tcc	%icc,	0x5
	fmovsle	%icc,	%f21,	%f21
	stb	%i0,	[%l7 + 0x7D]
	and	%o7,	0x16DB,	%l3
	udivcc	%o1,	0x0B61,	%o4
	tneg	%xcc,	0x2
	subcc	%g5,	%o5,	%i1
	edge32n	%g2,	%l0,	%l1
	ldsb	[%l7 + 0x3C],	%o6
	nop
	fitos	%f7,	%f20
	fnot2s	%f20,	%f16
	movne	%icc,	%i2,	%o3
	addcc	%i7,	0x1419,	%g7
	movrgez	%i4,	0x2DC,	%l6
	edge32l	%l5,	%o2,	%g3
	addccc	%o0,	0x13F5,	%g6
	movne	%icc,	%i3,	%i6
	smulcc	%l4,	0x1134,	%l2
	fnot2s	%f25,	%f15
	sethi	0x0828,	%i5
	sra	%g4,	0x1A,	%g1
	ldsb	[%l7 + 0x16],	%i0
	sra	%o7,	0x07,	%l3
	orncc	%o1,	%o4,	%g5
	tcs	%xcc,	0x6
	tne	%icc,	0x4
	tsubcc	%i1,	%o5,	%g2
	fmovrse	%l1,	%f22,	%f28
	movvc	%xcc,	%l0,	%o6
	sra	%o3,	%i2,	%i7
	movvs	%icc,	%i4,	%g7
	set	0x78, %g3
	prefetcha	[%l7 + %g3] 0x80,	 0x0
	fmovrde	%o2,	%f22,	%f24
	fbge	%fcc0,	loop_2923
	movneg	%xcc,	%l5,	%o0
	set	0x10, %l3
	swapa	[%l7 + %l3] 0x0c,	%g3
loop_2923:
	tleu	%xcc,	0x6
	set	0x38, %o6
	sta	%f31,	[%l7 + %o6] 0x80
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	umul	%i3,	%g6,	%l4
	movgu	%xcc,	%l2,	%i6
	movleu	%icc,	%i5,	%g1
	fbule,a	%fcc0,	loop_2924
	movcs	%xcc,	%g4,	%i0
	fnot1	%f18,	%f2
	stx	%l3,	[%l7 + 0x18]
loop_2924:
	membar	0x79
	andn	%o7,	%o1,	%o4
	xnor	%i1,	0x0476,	%o5
	fabsd	%f26,	%f18
	tn	%xcc,	0x3
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x89
	tcc	%xcc,	0x1
	tgu	%xcc,	0x4
	tcc	%xcc,	0x0
	fabsd	%f22,	%f22
	add	%g5,	0x00CB,	%g2
	set	0x5A, %i3
	ldstuba	[%l7 + %i3] 0x18,	%l1
	bvc	loop_2925
	umulcc	%l0,	%o3,	%o6
	fmovsn	%icc,	%f20,	%f21
	fbne	%fcc1,	loop_2926
loop_2925:
	udivcc	%i7,	0x029D,	%i2
	fbug,a	%fcc2,	loop_2927
	lduw	[%l7 + 0x38],	%i4
loop_2926:
	bn	loop_2928
	fandnot1s	%f25,	%f11,	%f10
loop_2927:
	addcc	%l6,	0x0B5E,	%g7
	smul	%o2,	%o0,	%g3
loop_2928:
	edge32	%l5,	%g6,	%i3
	tgu	%icc,	0x6
	edge16	%l4,	%l2,	%i5
	smul	%i6,	0x0964,	%g1
	edge32	%g4,	%i0,	%l3
	andn	%o7,	%o4,	%o1
	pdist	%f0,	%f8,	%f0
	fbn	%fcc1,	loop_2929
	movrne	%o5,	0x1F1,	%i1
	array32	%g2,	%l1,	%l0
	fmovrsgez	%g5,	%f25,	%f2
loop_2929:
	tg	%xcc,	0x6
	movg	%xcc,	%o6,	%o3
	edge8l	%i7,	%i2,	%l6
	fbu,a	%fcc2,	loop_2930
	mulx	%g7,	0x00BE,	%i4
	fpackfix	%f24,	%f8
	nop
	fitos	%f9,	%f26
	fstox	%f26,	%f2
loop_2930:
	tn	%icc,	0x0
	bn,pn	%xcc,	loop_2931
	movge	%xcc,	%o0,	%o2
	fbuge	%fcc3,	loop_2932
	te	%icc,	0x6
loop_2931:
	nop
	setx	0xA4C7AD50,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xDA599499,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f15,	%f18
	mulscc	%g3,	0x1528,	%l5
loop_2932:
	subcc	%g6,	0x1240,	%i3
	addcc	%l2,	%l4,	%i6
	mulx	%i5,	%g4,	%i0
	fba,a	%fcc3,	loop_2933
	edge32ln	%l3,	%o7,	%o4
	smulcc	%g1,	%o1,	%i1
	nop
	setx	loop_2934,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2933:
	edge8n	%g2,	%l1,	%o5
	fbne	%fcc3,	loop_2935
	tcs	%xcc,	0x2
loop_2934:
	fmovd	%f18,	%f14
	addccc	%l0,	0x0953,	%g5
loop_2935:
	edge16n	%o3,	%i7,	%i2
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf9
	membar	#Sync
	sth	%o6,	[%l7 + 0x7E]
	nop
	setx	loop_2936,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%l6,	0x0700,	%i4
	nop
	fitod	%f0,	%f6
	fdtos	%f6,	%f28
	bleu,a,pn	%icc,	loop_2937
loop_2936:
	movcc	%icc,	%g7,	%o2
	smul	%g3,	%o0,	%l5
	fandnot2s	%f11,	%f9,	%f23
loop_2937:
	fnot1	%f2,	%f24
	tle	%icc,	0x6
	fblg	%fcc1,	loop_2938
	xor	%g6,	%i3,	%l4
	be,pt	%icc,	loop_2939
	subccc	%i6,	%l2,	%i5
loop_2938:
	stw	%g4,	[%l7 + 0x10]
	brz	%i0,	loop_2940
loop_2939:
	xorcc	%o7,	0x1CB5,	%l3
	movl	%xcc,	%g1,	%o4
	set	0x70, %g1
	prefetcha	[%l7 + %g1] 0x0c,	 0x1
loop_2940:
	nop
	fitod	%f10,	%f24
	fdtos	%f24,	%f30
	fxor	%f16,	%f18,	%f16
	ldd	[%l7 + 0x48],	%o0
	edge32	%g2,	%o5,	%l0
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f12
	fxtod	%f12,	%f4
	ldub	[%l7 + 0x4F],	%g5
	andn	%o3,	%l1,	%i7
	andn	%o6,	%l6,	%i2
	nop
	setx	0x7C024CAC68B003DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x16F1FF87C70CC8A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f14,	%f24
	fbne,a	%fcc2,	loop_2941
	movneg	%xcc,	%g7,	%i4
	nop
	setx	0x22EA43462556C565,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x6AD0A56F820C4DB7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f0,	%f14
	lduw	[%l7 + 0x50],	%g3
loop_2941:
	fcmpne16	%f20,	%f18,	%o0
	smul	%o2,	0x0707,	%l5
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmul8ulx16	%f8,	%f30,	%f0
	array32	%g6,	%i3,	%l4
	mulx	%l2,	%i6,	%i5
	subccc	%i0,	%g4,	%l3
	smul	%g1,	%o4,	%o7
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x4E] %asi,	%o1
	nop
	setx	0xD30AC31FB6242322,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x0D318FD60AEFF0A5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f0,	%f20
	movre	%i1,	0x378,	%o5
	addccc	%l0,	%g2,	%o3
	sra	%g5,	0x01,	%i7
	ldx	[%l7 + 0x48],	%l1
	sir	0x0A48
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc3,	loop_2942
	addcc	%l6,	%i2,	%g7
	bn,a	loop_2943
	sethi	0x026C,	%i4
loop_2942:
	fmul8x16au	%f12,	%f6,	%f0
	fmovse	%icc,	%f11,	%f18
loop_2943:
	array32	%g3,	%o0,	%o6
	sir	0x0B6B
	set	0x60, %i1
	lda	[%l7 + %i1] 0x15,	%f11
	movg	%icc,	%o2,	%l5
	nop
	setx	loop_2944,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%g6,	%i3,	%l2
	subcc	%l4,	0x03FD,	%i5
	movrne	%i6,	0x1FD,	%g4
loop_2944:
	fmovspos	%icc,	%f2,	%f29
	ble	%xcc,	loop_2945
	xor	%l3,	0x0513,	%g1
	fcmpne16	%f12,	%f2,	%i0
	nop
	setx	0xC9067AD9477AE755,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x915FC574A0F123B4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f4,	%f8
loop_2945:
	fabsd	%f14,	%f0
	brlez,a	%o4,	loop_2946
	movleu	%xcc,	%o7,	%i1
	array32	%o5,	%o1,	%l0
	sir	0x0FBF
loop_2946:
	orn	%o3,	%g5,	%g2
	ldsw	[%l7 + 0x54],	%l1
	fnands	%f4,	%f0,	%f7
	srl	%l6,	%i7,	%g7
	wr	%g0,	0x89,	%asi
	stxa	%i2,	[%l7 + 0x48] %asi
	movl	%xcc,	%i4,	%o0
	fors	%f18,	%f14,	%f15
	orcc	%o6,	0x1C68,	%g3
	fzeros	%f27
	fbn	%fcc1,	loop_2947
	edge16l	%o2,	%g6,	%l5
	fnands	%f19,	%f31,	%f19
	edge8n	%l2,	%i3,	%i5
loop_2947:
	nop
	set	0x36, %g5
	ldstub	[%l7 + %g5],	%i6
	add	%l4,	0x0D22,	%l3
	fbo	%fcc0,	loop_2948
	ldsh	[%l7 + 0x3A],	%g1
	lduw	[%l7 + 0x58],	%i0
	mova	%icc,	%o4,	%o7
loop_2948:
	prefetch	[%l7 + 0x24],	 0x1
	set	0x50, %l1
	ldda	[%l7 + %l1] 0x2b,	%g4
	xnor	%i1,	%o1,	%o5
	smul	%l0,	0x1853,	%o3
	tneg	%icc,	0x5
	sllx	%g5,	%l1,	%g2
	edge8	%i7,	%g7,	%l6
	xor	%i4,	%i2,	%o6
	st	%f19,	[%l7 + 0x38]
	movcs	%xcc,	%o0,	%o2
	prefetch	[%l7 + 0x68],	 0x1
	fmovda	%icc,	%f23,	%f30
	bne,pt	%icc,	loop_2949
	mulscc	%g6,	%l5,	%l2
	movvs	%icc,	%g3,	%i3
	edge32ln	%i6,	%l4,	%l3
loop_2949:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g1,	%i5,	%i0
	sdivx	%o7,	0x0082,	%o4
	fabsd	%f0,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x31, %i6
	ldsba	[%l7 + %i6] 0x15,	%g4
	edge8l	%i1,	%o5,	%l0
	fxnor	%f2,	%f28,	%f12
	srl	%o1,	%o3,	%l1
	brgz,a	%g2,	loop_2950
	movcc	%icc,	%i7,	%g5
	sth	%g7,	[%l7 + 0x46]
	edge32n	%i4,	%i2,	%l6
loop_2950:
	sllx	%o0,	0x03,	%o2
	ld	[%l7 + 0x24],	%f0
	taddcctv	%g6,	0x1807,	%l5
	nop
	setx	0x907E2D93,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	sllx	%l2,	%o6,	%g3
	set	0x50, %g7
	ldswa	[%l7 + %g7] 0x81,	%i6
	array8	%i3,	%l3,	%l4
	orcc	%g1,	0x1272,	%i5
	stbar
	array16	%i0,	%o4,	%o7
	fmovsvs	%xcc,	%f23,	%f22
	fxnors	%f0,	%f6,	%f7
	smul	%i1,	0x19CF,	%g4
	set	0x18, %g2
	lda	[%l7 + %g2] 0x14,	%f8
	ta	%icc,	0x7
	movl	%xcc,	%l0,	%o5
	edge16ln	%o1,	%l1,	%g2
	tpos	%icc,	0x2
	fcmpgt16	%f10,	%f30,	%i7
	sdivcc	%o3,	0x197C,	%g5
	tvs	%xcc,	0x7
	array16	%i4,	%g7,	%l6
	fmovdpos	%xcc,	%f6,	%f26
	fnands	%f11,	%f18,	%f21
	bvc,pt	%xcc,	loop_2951
	nop
	setx	0x504577A43074555A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	tcc	%icc,	0x6
	movre	%o0,	%i2,	%g6
loop_2951:
	fmovsneg	%xcc,	%f0,	%f2
	fmovrsne	%o2,	%f5,	%f29
	st	%f24,	[%l7 + 0x7C]
	brz	%l2,	loop_2952
	sll	%l5,	%g3,	%o6
	fmovdn	%xcc,	%f30,	%f5
	tvs	%xcc,	0x6
loop_2952:
	edge16	%i3,	%l3,	%i6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g1,	%l4
	fmovsneg	%icc,	%f14,	%f25
	movvs	%icc,	%i0,	%o4
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%i5
	movrgz	%i1,	%l0,	%g4
	alignaddrl	%o1,	%l1,	%g2
	tsubcc	%i7,	0x02F2,	%o5
	tge	%xcc,	0x4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%g5
	mulscc	%i4,	%g7,	%o0
	fsrc1s	%f5,	%f27
	fcmple32	%f10,	%f2,	%l6
	and	%i2,	%o2,	%g6
	pdist	%f12,	%f26,	%f24
	fpadd16s	%f6,	%f10,	%f15
	fnot1s	%f9,	%f10
	xor	%l2,	%g3,	%o6
	movle	%xcc,	%l5,	%l3
	array32	%i6,	%i3,	%l4
	tsubcc	%i0,	%g1,	%o7
	movrne	%i5,	0x0FB,	%o4
	edge32n	%l0,	%g4,	%i1
	tl	%xcc,	0x1
	movne	%xcc,	%o1,	%g2
	alignaddr	%l1,	%o5,	%o3
	udiv	%g5,	0x10D5,	%i4
	movn	%icc,	%g7,	%o0
	fmul8x16	%f1,	%f2,	%f2
	set	0x28, %o2
	stxa	%l6,	[%g0 + %o2] 0x20
	tn	%xcc,	0x1
	fmovsne	%xcc,	%f22,	%f29
	movvs	%xcc,	%i7,	%i2
	fpack16	%f22,	%f21
	orcc	%g6,	0x0536,	%o2
	fsrc1s	%f29,	%f22
	xnor	%g3,	0x140C,	%l2
	xnor	%o6,	0x053D,	%l3
	udiv	%i6,	0x12CF,	%i3
	ble,pt	%icc,	loop_2953
	bneg,a	%icc,	loop_2954
	fmovrdne	%l5,	%f24,	%f16
	edge8ln	%i0,	%l4,	%g1
loop_2953:
	fexpand	%f3,	%f24
loop_2954:
	movleu	%xcc,	%o7,	%i5
	subccc	%l0,	0x17EA,	%o4
	movneg	%xcc,	%g4,	%o1
	tg	%icc,	0x1
	xnorcc	%i1,	%g2,	%l1
	movleu	%xcc,	%o3,	%g5
	taddcctv	%o5,	%g7,	%i4
	fmul8x16	%f29,	%f10,	%f30
	fmul8x16au	%f25,	%f15,	%f18
	fmuld8ulx16	%f12,	%f6,	%f2
	subcc	%o0,	0x1581,	%l6
	edge16n	%i7,	%g6,	%o2
	nop
	setx	0xB6D23F4C841C6EC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x8B814F3C32E4A61A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f14,	%f6
	tne	%xcc,	0x6
	fmovscs	%xcc,	%f0,	%f28
	bpos	loop_2955
	nop
	setx	0x9D5F9F8DB417F086,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x765B9C60DC8EC395,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f24,	%f28
	fbn,a	%fcc2,	loop_2956
	movpos	%xcc,	%i2,	%l2
loop_2955:
	swap	[%l7 + 0x60],	%o6
	addc	%g3,	%l3,	%i6
loop_2956:
	popc	%i3,	%i0
	stbar
	fmovdpos	%xcc,	%f23,	%f9
	sra	%l4,	%l5,	%o7
	bg,a	loop_2957
	call	loop_2958
	brlz	%g1,	loop_2959
	movrlz	%i5,	%l0,	%o4
loop_2957:
	brlez,a	%g4,	loop_2960
loop_2958:
	movre	%i1,	%o1,	%g2
loop_2959:
	orncc	%l1,	%g5,	%o3
	subcc	%o5,	%g7,	%i4
loop_2960:
	nop
	set	0x7E, %o3
	lduha	[%l7 + %o3] 0x04,	%l6
	fmovrdlz	%i7,	%f0,	%f18
	mova	%icc,	%o0,	%g6
	fxnors	%f11,	%f16,	%f31
	subc	%i2,	%o2,	%l2
	brgez	%g3,	loop_2961
	fmovsvs	%xcc,	%f31,	%f18
	edge8n	%l3,	%i6,	%i3
	ba	%icc,	loop_2962
loop_2961:
	addc	%i0,	0x199B,	%l4
	srlx	%o6,	0x15,	%l5
	fmovsn	%xcc,	%f2,	%f10
loop_2962:
	tvs	%icc,	0x1
	sll	%g1,	%o7,	%i5
	edge16n	%o4,	%l0,	%i1
	addc	%o1,	0x1CB6,	%g2
	fbn	%fcc0,	loop_2963
	st	%f22,	[%l7 + 0x70]
	tneg	%xcc,	0x1
	andn	%g4,	0x027B,	%g5
loop_2963:
	tgu	%xcc,	0x2
	fcmpeq32	%f24,	%f0,	%o3
	movl	%icc,	%o5,	%g7
	popc	%i4,	%l1
	array8	%l6,	%o0,	%i7
	nop
	fitos	%f12,	%f14
	fstoi	%f14,	%f13
	sdiv	%i2,	0x0770,	%g6
	or	%o2,	%l2,	%l3
	edge16l	%i6,	%g3,	%i0
	bn,pt	%icc,	loop_2964
	movre	%l4,	%o6,	%l5
	movn	%icc,	%g1,	%i3
	movrgz	%o7,	0x28E,	%o4
loop_2964:
	bg	%xcc,	loop_2965
	edge16	%l0,	%i1,	%i5
	flush	%l7 + 0x24
	fornot2	%f6,	%f26,	%f18
loop_2965:
	tle	%xcc,	0x2
	tg	%icc,	0x6
	bneg,a,pt	%icc,	loop_2966
	movcs	%xcc,	%o1,	%g2
	sra	%g5,	0x19,	%o3
	bgu,a,pn	%xcc,	loop_2967
loop_2966:
	tge	%icc,	0x4
	xnorcc	%g4,	0x1C96,	%o5
	for	%f20,	%f2,	%f2
loop_2967:
	edge32n	%i4,	%l1,	%g7
	fpsub32s	%f3,	%f9,	%f9
	array8	%o0,	%i7,	%i2
	tsubcctv	%g6,	0x018E,	%l6
	brz,a	%o2,	loop_2968
	addcc	%l2,	0x1419,	%i6
	tcs	%icc,	0x3
	movge	%icc,	%g3,	%l3
loop_2968:
	udivx	%l4,	0x0603,	%o6
	tsubcc	%l5,	0x1EA9,	%i0
	andn	%g1,	%o7,	%i3
	sra	%l0,	0x1F,	%o4
	tpos	%icc,	0x0
	brlz	%i5,	loop_2969
	andncc	%i1,	%o1,	%g5
	movvc	%icc,	%g2,	%o3
	fnot2	%f14,	%f6
loop_2969:
	xnor	%o5,	0x0A2D,	%g4
	tcs	%icc,	0x4
	orcc	%i4,	%g7,	%o0
	set	0x44, %i4
	stwa	%l1,	[%l7 + %i4] 0xe3
	membar	#Sync
	sra	%i2,	0x00,	%i7
	movre	%g6,	0x165,	%l6
	movn	%icc,	%l2,	%i6
	fmovrdne	%o2,	%f2,	%f12
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g3,	%l4
	edge16	%l3,	%o6,	%l5
	tne	%icc,	0x1
	fbn,a	%fcc1,	loop_2970
	nop
	setx	0x8EEFDFF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x84AB1A80,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f4,	%f7
	edge8ln	%i0,	%o7,	%i3
	ldx	[%l7 + 0x40],	%g1
loop_2970:
	edge16n	%o4,	%i5,	%i1
	bne,a,pt	%xcc,	loop_2971
	fbug,a	%fcc1,	loop_2972
	sdivcc	%l0,	0x1EF9,	%g5
	movcc	%icc,	%g2,	%o3
loop_2971:
	addcc	%o5,	%o1,	%i4
loop_2972:
	nop
	setx	0xD16C3FF22C23AA3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xEE6E7D3B95F17154,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f16,	%f26
	movpos	%icc,	%g4,	%g7
	bpos,pn	%xcc,	loop_2973
	tsubcctv	%o0,	%i2,	%i7
	bl,a,pn	%icc,	loop_2974
	subc	%g6,	%l6,	%l2
loop_2973:
	srlx	%l1,	%o2,	%i6
	andncc	%l4,	%g3,	%l3
loop_2974:
	edge32	%l5,	%o6,	%o7
	membar	0x6C
	movcs	%xcc,	%i3,	%g1
	fnegs	%f24,	%f26
	stbar
	fmovse	%xcc,	%f8,	%f10
	movrne	%i0,	%o4,	%i5
	membar	0x27
	nop
	set	0x6C, %g6
	stw	%l0,	[%l7 + %g6]
	movrlez	%g5,	0x0EA,	%g2
	fzeros	%f23
	wr	%g0,	0xea,	%asi
	stwa	%i1,	[%l7 + 0x18] %asi
	membar	#Sync
	tne	%icc,	0x5
	fbul	%fcc2,	loop_2975
	membar	0x29
	tleu	%icc,	0x6
	and	%o5,	%o1,	%o3
loop_2975:
	movrlz	%g4,	%g7,	%o0
	movneg	%icc,	%i4,	%i7
	array16	%g6,	%l6,	%i2
	call	loop_2976
	ba,a,pn	%xcc,	loop_2977
	fnands	%f16,	%f7,	%f2
	fpadd16	%f0,	%f16,	%f8
loop_2976:
	andncc	%l1,	%l2,	%o2
loop_2977:
	bneg	loop_2978
	taddcctv	%l4,	0x1C4E,	%i6
	orncc	%g3,	0x062C,	%l5
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x1A] %asi,	%l3
loop_2978:
	sdiv	%o6,	0x0B4D,	%o7
	addccc	%i3,	0x0D75,	%g1
	edge16ln	%o4,	%i5,	%l0
	ld	[%l7 + 0x34],	%f7
	sdivcc	%i0,	0x0553,	%g5
	sdiv	%g2,	0x1D93,	%i1
	lduh	[%l7 + 0x08],	%o5
	sth	%o3,	[%l7 + 0x4E]
	fmul8x16au	%f27,	%f28,	%f4
	edge32l	%g4,	%g7,	%o0
	tcc	%icc,	0x7
	xorcc	%o1,	%i7,	%g6
	taddcctv	%l6,	%i4,	%i2
	sethi	0x071D,	%l2
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x1C] %asi,	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x10,	%l4,	%i6
	movrlez	%l1,	%g3,	%l5
	movl	%icc,	%l3,	%o7
	fblg,a	%fcc2,	loop_2979
	smul	%o6,	0x1AFE,	%i3
	prefetch	[%l7 + 0x30],	 0x2
	fbne	%fcc0,	loop_2980
loop_2979:
	tcs	%icc,	0x1
	fmovdl	%icc,	%f1,	%f16
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%i5
loop_2980:
	movn	%xcc,	%l0,	%i0
	movvc	%xcc,	%g1,	%g2
	fnor	%f12,	%f14,	%f22
	addcc	%i1,	0x0CFA,	%o5
	fmovdcs	%icc,	%f19,	%f3
	ble	%xcc,	loop_2981
	tcs	%icc,	0x2
	subc	%o3,	0x0378,	%g5
	fone	%f16
loop_2981:
	array16	%g7,	%o0,	%g4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%i7
	sllx	%g6,	0x0C,	%l6
	fmul8x16au	%f18,	%f24,	%f12
	xnor	%o1,	0x08BB,	%i4
	taddcctv	%i2,	0x0DFA,	%l2
	orncc	%o2,	0x1AE6,	%i6
	addc	%l4,	0x09CA,	%l1
	subc	%l5,	%g3,	%l3
	and	%o7,	0x1853,	%o6
	brgez	%o4,	loop_2982
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i5,	%l0,	%i3
	set	0x68, %o0
	prefetcha	[%l7 + %o0] 0x0c,	 0x1
loop_2982:
	subccc	%g2,	0x1F09,	%i1
	orncc	%o5,	%o3,	%i0
	sdivcc	%g7,	0x1808,	%g5
	nop
	setx	0x893822CD4997162A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x927A701261A69204,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f2,	%f6
	fandnot1	%f4,	%f0,	%f30
	fbue	%fcc2,	loop_2983
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f0
	fxtod	%f0,	%f12
	taddcctv	%g4,	%o0,	%i7
	fmovrsne	%g6,	%f17,	%f16
loop_2983:
	sll	%l6,	%o1,	%i2
	xorcc	%l2,	0x034A,	%o2
	addccc	%i6,	0x0F92,	%i4
	fmovdvc	%xcc,	%f15,	%f24
	tgu	%xcc,	0x0
	fands	%f14,	%f28,	%f8
	movrgz	%l4,	0x184,	%l1
	xnorcc	%g3,	%l5,	%l3
	brlez	%o7,	loop_2984
	tvc	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	sta	%f3,	[%l7 + 0x38] %asi
loop_2984:
	fbg	%fcc1,	loop_2985
	movrgz	%o4,	0x2F6,	%i5
	smul	%l0,	0x1841,	%i3
	srl	%o6,	0x11,	%g1
loop_2985:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tl	%xcc,	0x6
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x04,	%f16
	fmovrdlz	%g2,	%f6,	%f16
	fbue	%fcc1,	loop_2986
	move	%icc,	%o5,	%i1
	movpos	%xcc,	%o3,	%g7
	andncc	%g5,	%i0,	%g4
loop_2986:
	nop
	set	0x50, %i2
	stwa	%i7,	[%l7 + %i2] 0x27
	membar	#Sync
	sra	%g6,	%l6,	%o0
	bg,a	loop_2987
	andn	%i2,	0x0D7C,	%l2
	tl	%icc,	0x0
	addc	%o1,	%i6,	%i4
loop_2987:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o2,	0x0FC0,	%l4
	edge16ln	%g3,	%l5,	%l1
	movrlez	%o7,	0x213,	%o4
	mulscc	%i5,	0x1B74,	%l0
	fmovrslz	%i3,	%f27,	%f9
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x39] %asi,	%o6
	tsubcctv	%g1,	0x06E7,	%l3
	tg	%xcc,	0x2
	srax	%g2,	%i1,	%o5
	movvc	%xcc,	%o3,	%g5
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x23,	%g6
	fnands	%f23,	%f7,	%f17
	movpos	%icc,	%g4,	%i7
	movleu	%xcc,	%g6,	%i0
	orncc	%l6,	0x0FA7,	%o0
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sllx	%i2,	%o1,	%i6
	udivx	%l2,	0x1C82,	%o2
	brnz,a	%i4,	loop_2988
	udivx	%g3,	0x12EB,	%l5
	addc	%l4,	%l1,	%o7
	edge8n	%i5,	%o4,	%i3
loop_2988:
	edge8ln	%l0,	%g1,	%o6
	tle	%xcc,	0x7
	fbue,a	%fcc3,	loop_2989
	fbue,a	%fcc1,	loop_2990
	fbule	%fcc2,	loop_2991
	fmovrde	%l3,	%f18,	%f6
loop_2989:
	fornot1s	%f18,	%f28,	%f16
loop_2990:
	subcc	%i1,	0x0E8C,	%g2
loop_2991:
	flush	%l7 + 0x58
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%o4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x81,	%f0
	brnz	%o3,	loop_2992
	fmovrsgz	%g7,	%f13,	%f23
	sdivcc	%g5,	0x02A2,	%i7
	sll	%g4,	%i0,	%l6
loop_2992:
	srlx	%g6,	0x09,	%i2
	fbu,a	%fcc0,	loop_2993
	fmovrslz	%o0,	%f21,	%f15
	st	%f7,	[%l7 + 0x78]
	fpsub16s	%f0,	%f24,	%f22
loop_2993:
	membar	0x27
	sdivcc	%i6,	0x08E9,	%o1
	edge16ln	%o2,	%l2,	%g3
	movrgz	%l5,	%i4,	%l1
	fornot1	%f20,	%f22,	%f2
	xnorcc	%l4,	%i5,	%o7
	stb	%o4,	[%l7 + 0x31]
	udiv	%i3,	0x1908,	%g1
	edge16	%l0,	%o6,	%l3
	tcc	%icc,	0x3
	movrlz	%g2,	%i1,	%o5
	movl	%xcc,	%o3,	%g5
	std	%f20,	[%l7 + 0x30]
	movg	%icc,	%i7,	%g4
	bshuffle	%f6,	%f22,	%f2
	prefetch	[%l7 + 0x58],	 0x0
	sdiv	%g7,	0x1CE9,	%i0
	wr	%g0,	0x18,	%asi
	sta	%f28,	[%l7 + 0x70] %asi
	taddcc	%g6,	%i2,	%o0
	popc	%i6,	%o1
	tneg	%icc,	0x7
	bneg,pn	%xcc,	loop_2994
	andncc	%o2,	%l6,	%g3
	nop
	setx	loop_2995,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tleu	%xcc,	0x1
loop_2994:
	and	%l5,	%i4,	%l1
	fmovrdlz	%l4,	%f6,	%f20
loop_2995:
	srlx	%i5,	%l2,	%o4
	tneg	%xcc,	0x0
	brlez	%i3,	loop_2996
	fandnot1	%f6,	%f30,	%f30
	ldsh	[%l7 + 0x76],	%g1
	tle	%icc,	0x7
loop_2996:
	mulx	%o7,	0x1A7F,	%o6
	movrgz	%l3,	0x110,	%l0
	tsubcc	%i1,	%o5,	%o3
	tsubcctv	%g2,	%g5,	%i7
	tsubcc	%g7,	0x1D7D,	%i0
	smul	%g6,	%i2,	%o0
	tg	%xcc,	0x3
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x18,	%i6
	swap	[%l7 + 0x3C],	%o1
	tge	%icc,	0x0
	fmovd	%f24,	%f24
	fmovs	%f1,	%f25
	fexpand	%f19,	%f8
	nop
	setx	0x8DE120A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x58E35C2B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f30,	%f17
	sra	%o2,	0x01,	%l6
	fmovrde	%g4,	%f20,	%f16
	tneg	%xcc,	0x0
	brlez,a	%g3,	loop_2997
	andn	%i4,	%l5,	%l4
	set	0x6C, %l0
	lduha	[%l7 + %l0] 0x88,	%l1
loop_2997:
	sra	%l2,	%i5,	%o4
	movl	%icc,	%i3,	%o7
	ldx	[%l7 + 0x30],	%o6
	set	0x46, %i5
	stha	%g1,	[%l7 + %i5] 0x19
	fbule,a	%fcc1,	loop_2998
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f18,	%f8,	%f3
	mova	%xcc,	%l0,	%l3
loop_2998:
	taddcc	%o5,	0x1DBE,	%o3
	tvc	%icc,	0x6
	bg,a	%icc,	loop_2999
	bge,a	loop_3000
	sub	%i1,	0x0B3C,	%g2
	srax	%g5,	0x1C,	%g7
loop_2999:
	fmovda	%icc,	%f7,	%f6
loop_3000:
	movvs	%icc,	%i7,	%i0
	sub	%i2,	%g6,	%o0
	tl	%xcc,	0x1
	fandnot2	%f30,	%f10,	%f20
	edge32l	%o1,	%i6,	%l6
	tge	%icc,	0x3
	sub	%o2,	0x08EB,	%g3
	nop
	setx	loop_3001,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%xcc,	%g4,	%i4
	xnorcc	%l4,	%l5,	%l2
	fnor	%f28,	%f28,	%f22
loop_3001:
	sdivx	%l1,	0x152B,	%o4
	nop
	setx	0xC6508E5A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x64CD13D8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f10,	%f25
	udiv	%i5,	0x1E3E,	%o7
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x04
	tg	%xcc,	0x2
	movrne	%i3,	%g1,	%o6
	movrgz	%l3,	0x341,	%o5
	brlz	%l0,	loop_3002
	nop
	fitod	%f31,	%f6
	movle	%icc,	%i1,	%g2
	fblg,a	%fcc1,	loop_3003
loop_3002:
	edge16n	%g5,	%o3,	%i7
	fble	%fcc1,	loop_3004
	fpmerge	%f16,	%f31,	%f22
loop_3003:
	array8	%i0,	%g7,	%i2
	nop
	setx	0x766ED6FE405A9CA0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_3004:
	sdivcc	%o0,	0x0FE3,	%g6
	nop
	setx	loop_3005,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%icc,	0x5
	sub	%i6,	%o1,	%o2
	tcc	%xcc,	0x4
loop_3005:
	or	%l6,	%g3,	%g4
	fmovrsgz	%l4,	%f24,	%f16
	tne	%xcc,	0x5
	fnot2	%f12,	%f4
	set	0x54, %o1
	lduha	[%l7 + %o1] 0x10,	%l5
	fmovdvs	%icc,	%f28,	%f24
	subccc	%i4,	%l1,	%l2
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x3B] %asi,	%o4
	std	%f16,	[%l7 + 0x30]
	fbuge,a	%fcc1,	loop_3006
	and	%o7,	0x1031,	%i5
	fornot1	%f20,	%f28,	%f2
	tne	%xcc,	0x6
loop_3006:
	smul	%i3,	%o6,	%g1
	movre	%o5,	0x0BC,	%l3
	fandnot2	%f22,	%f26,	%f6
	xnor	%l0,	%g2,	%i1
	nop
	setx	0xC973AD58A0555982,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	sdivx	%o3,	0x11B9,	%g5
	edge16l	%i0,	%i7,	%i2
	movg	%xcc,	%o0,	%g7
	edge16l	%g6,	%o1,	%o2
	bne,pt	%icc,	loop_3007
	srax	%l6,	0x11,	%g3
	membar	0x08
	andn	%g4,	%l4,	%i6
loop_3007:
	bn,pn	%icc,	loop_3008
	edge32l	%i4,	%l5,	%l1
	tgu	%xcc,	0x5
	movrlez	%o4,	%l2,	%o7
loop_3008:
	ldx	[%l7 + 0x08],	%i3
	movrne	%i5,	0x009,	%o6
	fcmple32	%f2,	%f20,	%g1
	edge32l	%o5,	%l3,	%l0
	movvs	%icc,	%i1,	%g2
	mulscc	%g5,	%i0,	%o3
	movrgz	%i2,	%o0,	%i7
	alignaddrl	%g7,	%o1,	%g6
	alignaddr	%l6,	%g3,	%o2
	fnands	%f23,	%f29,	%f5
	srax	%g4,	%i6,	%l4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x54] %asi,	%f14
	fornot1s	%f22,	%f14,	%f7
	fbo	%fcc2,	loop_3009
	sra	%l5,	%l1,	%o4
	tge	%xcc,	0x4
	smulcc	%i4,	0x168D,	%o7
loop_3009:
	movl	%icc,	%l2,	%i5
	xnor	%o6,	%i3,	%g1
	fnot2	%f20,	%f26
	movvs	%xcc,	%o5,	%l3
	edge32l	%i1,	%l0,	%g5
	andcc	%g2,	%o3,	%i0
	membar	0x32
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x18,	%i2,	%i7
	nop
	setx	0xD4D7636497C85907,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xBE4DC4947B6A258F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f24,	%f8
	nop
	set	0x28, %l6
	ldsw	[%l7 + %l6],	%o0
	wr	%g0,	0x81,	%asi
	stwa	%g7,	[%l7 + 0x18] %asi
	fmovsgu	%icc,	%f24,	%f18
	mova	%icc,	%g6,	%o1
	fbl	%fcc0,	loop_3010
	ta	%xcc,	0x5
	tvs	%xcc,	0x7
	alignaddr	%g3,	%o2,	%g4
loop_3010:
	movge	%xcc,	%l6,	%i6
	nop
	setx	0x10BEDD54,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x72619D8F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f20,	%f16
	bgu	loop_3011
	fsrc1s	%f29,	%f6
	st	%f31,	[%l7 + 0x34]
	fpsub32s	%f13,	%f0,	%f22
loop_3011:
	membar	0x1B
	fzero	%f12
	fnegd	%f14,	%f16
	tne	%icc,	0x5
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f6
	fxtod	%f6,	%f22
	andncc	%l5,	%l4,	%l1
	fpack16	%f14,	%f4
	array32	%o4,	%i4,	%l2
	mova	%icc,	%i5,	%o6
	sdiv	%i3,	0x0567,	%o7
	sdivcc	%g1,	0x196B,	%o5
	nop
	setx	loop_3012,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsle	%icc,	%f9,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x1C],	%i1
loop_3012:
	edge8	%l3,	%g5,	%g2
	set	0x30, %g3
	ldsba	[%l7 + %g3] 0x81,	%l0
	addc	%o3,	%i0,	%i7
	movrlz	%i2,	0x24E,	%o0
	ldstub	[%l7 + 0x42],	%g7
	movge	%xcc,	%o1,	%g3
	nop
	setx	0xF558FD3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x0331AE47,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f31,	%f3
	fnand	%f8,	%f10,	%f2
	subc	%o2,	%g4,	%g6
	fexpand	%f25,	%f6
	sll	%i6,	%l5,	%l6
	swap	[%l7 + 0x0C],	%l1
	xor	%l4,	0x1277,	%o4
	tle	%icc,	0x0
	membar	0x2C
	tcs	%xcc,	0x0
	nop
	set	0x62, %l2
	ldstub	[%l7 + %l2],	%l2
	fpack32	%f4,	%f2,	%f20
	add	%i5,	%o6,	%i3
	wr	%g0,	0xe2,	%asi
	stwa	%o7,	[%l7 + 0x58] %asi
	membar	#Sync
	tl	%icc,	0x2
	fcmpne32	%f14,	%f10,	%g1
	swap	[%l7 + 0x10],	%o5
	set	0x28, %o6
	ldsha	[%l7 + %o6] 0x0c,	%i1
	brgz,a	%i4,	loop_3013
	movvc	%xcc,	%g5,	%g2
	faligndata	%f24,	%f0,	%f20
	nop
	fitod	%f10,	%f28
	fdtoi	%f28,	%f15
loop_3013:
	membar	0x49
	fxor	%f24,	%f18,	%f12
	tl	%icc,	0x4
	fmovspos	%icc,	%f23,	%f31
	fbule	%fcc2,	loop_3014
	mova	%xcc,	%l3,	%l0
	be	%xcc,	loop_3015
	udivx	%i0,	0x0D80,	%i7
loop_3014:
	bvs,a	%icc,	loop_3016
	popc	%i2,	%o0
loop_3015:
	smul	%o3,	0x17B2,	%o1
	tvc	%icc,	0x3
loop_3016:
	movrlez	%g7,	0x049,	%g3
	bl	%xcc,	loop_3017
	srlx	%o2,	0x0F,	%g6
	edge32n	%i6,	%g4,	%l5
	orcc	%l1,	%l4,	%l6
loop_3017:
	ta	%xcc,	0x7
	tl	%icc,	0x0
	addcc	%o4,	0x18CC,	%l2
	fpadd32	%f14,	%f24,	%f22
	bl,pt	%xcc,	loop_3018
	tcs	%icc,	0x1
	fmovda	%icc,	%f12,	%f17
	array8	%i5,	%o6,	%i3
loop_3018:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o7
	taddcctv	%o5,	%i1,	%g1
	orcc	%g5,	0x1201,	%g2
	tne	%xcc,	0x0
	smul	%i4,	%l3,	%i0
	sethi	0x0629,	%i7
	edge16	%i2,	%o0,	%o3
	std	%f18,	[%l7 + 0x50]
	nop
	setx	0xDB0A54976D078D35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f20
	membar	0x78
	fandnot1s	%f9,	%f24,	%f31
	fcmpeq16	%f0,	%f6,	%l0
	fbe,a	%fcc1,	loop_3019
	nop
	setx	loop_3020,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subccc	%o1,	0x1014,	%g7
	nop
	setx	0x1AE525DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x6B695987,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f27,	%f23
loop_3019:
	subcc	%g3,	%o2,	%g6
loop_3020:
	swap	[%l7 + 0x7C],	%i6
	movle	%xcc,	%g4,	%l5
	umulcc	%l4,	%l6,	%l1
	ldx	[%l7 + 0x58],	%l2
	ldx	[%l7 + 0x48],	%i5
	nop
	setx	0xBBB9F82C715F376F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f18
	movne	%xcc,	%o6,	%i3
	or	%o4,	%o7,	%i1
	nop
	fitod	%f6,	%f28
	fdtox	%f28,	%f10
	bneg,a,pt	%icc,	loop_3021
	nop
	setx	0x19B6A4A0805C1239,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	wr	%g0,	0x80,	%asi
	stwa	%o5,	[%l7 + 0x0C] %asi
loop_3021:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g1,	%g2
	tleu	%xcc,	0x0
	fbo,a	%fcc1,	loop_3022
	tvs	%icc,	0x0
	orncc	%i4,	%l3,	%i0
	edge32	%i7,	%g5,	%i2
loop_3022:
	edge8ln	%o3,	%o0,	%o1
	nop
	setx	0x5A92FEA909E2E1F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f26
	fcmpeq16	%f26,	%f16,	%g7
	xnor	%l0,	%o2,	%g3
	sethi	0x13F6,	%i6
	sll	%g4,	%l5,	%l4
	movrlez	%g6,	0x3B4,	%l1
	movne	%icc,	%l2,	%i5
	bpos,a	%icc,	loop_3023
	lduh	[%l7 + 0x76],	%l6
	andcc	%o6,	%i3,	%o7
	edge32ln	%o4,	%o5,	%i1
loop_3023:
	fmovdge	%icc,	%f0,	%f17
	taddcc	%g1,	0x10E8,	%g2
	tg	%xcc,	0x2
	subc	%l3,	%i4,	%i7
	fmovdle	%xcc,	%f29,	%f6
	addccc	%g5,	%i2,	%o3
	movneg	%xcc,	%o0,	%o1
	alignaddr	%i0,	%g7,	%l0
	movre	%o2,	%i6,	%g4
	te	%xcc,	0x2
	fmovdpos	%xcc,	%f19,	%f8
	udiv	%l5,	0x1709,	%l4
	fmovdcs	%xcc,	%f21,	%f2
	addcc	%g6,	%l1,	%g3
	movre	%l2,	%i5,	%l6
	tcs	%xcc,	0x7
	andn	%i3,	%o7,	%o4
	subcc	%o6,	0x1625,	%o5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x10,	%g1,	%g2
	fmovsneg	%icc,	%f19,	%f27
	membar	0x4E
	fand	%f4,	%f14,	%f20
	be,pn	%xcc,	loop_3024
	fmul8x16	%f24,	%f22,	%f24
	nop
	setx	0x48E43665A2D83A5C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f6
	tneg	%icc,	0x4
loop_3024:
	fpack16	%f6,	%f28
	fbug	%fcc1,	loop_3025
	fpadd32	%f14,	%f14,	%f4
	taddcc	%l3,	0x135C,	%i4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x80,	%i1,	%i7
loop_3025:
	fmul8x16al	%f19,	%f0,	%f24
	subccc	%g5,	%o3,	%o0
	xnorcc	%i2,	%i0,	%g7
	tn	%icc,	0x6
	udivcc	%o1,	0x1219,	%o2
	andncc	%l0,	%g4,	%i6
	movge	%xcc,	%l5,	%l4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%l1
	fmovsge	%xcc,	%f22,	%f26
	fbuge	%fcc3,	loop_3026
	nop
	setx	loop_3027,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%g3,	%g6,	%l2
	fcmpne16	%f30,	%f14,	%l6
loop_3026:
	edge16	%i5,	%o7,	%i3
loop_3027:
	te	%xcc,	0x1
	fzero	%f12
	fbo	%fcc1,	loop_3028
	bshuffle	%f22,	%f22,	%f30
	tsubcctv	%o6,	0x1D49,	%o4
	sethi	0x0BDF,	%o5
loop_3028:
	fbule	%fcc3,	loop_3029
	tvc	%icc,	0x0
	and	%g1,	%g2,	%l3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%i4,	%i7
loop_3029:
	addc	%i1,	%o3,	%g5
	addcc	%i2,	0x05F3,	%i0
	nop
	setx	0x4BB6FBD6DD81AB47,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f28
	fmovsle	%xcc,	%f0,	%f4
	fbug	%fcc1,	loop_3030
	fbo	%fcc2,	loop_3031
	te	%icc,	0x0
	sdiv	%g7,	0x1AC2,	%o0
loop_3030:
	tle	%icc,	0x5
loop_3031:
	movrgz	%o2,	0x3C3,	%l0
	fmovrdlez	%o1,	%f28,	%f18
	sra	%i6,	%l5,	%l4
	smul	%l1,	%g4,	%g6
	array16	%l2,	%g3,	%l6
	edge8l	%o7,	%i3,	%i5
	ldsw	[%l7 + 0x7C],	%o6
	ta	%xcc,	0x7
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x10] %asi,	%o4
	fmovrde	%g1,	%f30,	%f22
	edge16n	%g2,	%l3,	%o5
	movneg	%xcc,	%i7,	%i1
	fpsub32	%f16,	%f6,	%f28
	brnz,a	%o3,	loop_3032
	array32	%g5,	%i2,	%i4
	nop
	set	0x39, %i7
	ldsb	[%l7 + %i7],	%g7
	xnorcc	%o0,	%i0,	%l0
loop_3032:
	fornot1s	%f27,	%f18,	%f16
	addc	%o2,	%i6,	%o1
	nop
	setx	0x51E7D3AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x5F8B944F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f25,	%f20
	tcc	%icc,	0x4
	fbu,a	%fcc1,	loop_3033
	bleu,a	loop_3034
	nop
	setx	0xD18AE390,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f22
	tleu	%icc,	0x0
loop_3033:
	membar	0x63
loop_3034:
	ldd	[%l7 + 0x18],	%l4
	fnors	%f23,	%f17,	%f24
	movgu	%icc,	%l4,	%g4
	bneg,a	%icc,	loop_3035
	tleu	%icc,	0x7
	fbe,a	%fcc1,	loop_3036
	movl	%xcc,	%l1,	%g6
loop_3035:
	fmovsn	%xcc,	%f6,	%f6
	nop
	setx	loop_3037,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_3036:
	smul	%l2,	%l6,	%g3
	movrlez	%i3,	0x07B,	%i5
	bcc,pt	%xcc,	loop_3038
loop_3037:
	movvc	%xcc,	%o7,	%o6
	fpadd32	%f2,	%f26,	%f0
	sdivcc	%o4,	0x1B42,	%g2
loop_3038:
	fzero	%f0
	tn	%icc,	0x2
	andcc	%l3,	0x0197,	%o5
	nop
	setx	0x51753473314FDA1A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x1E7C8179EBDE45A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f2,	%f8
	tcc	%xcc,	0x1
	fnand	%f12,	%f0,	%f6
	fpsub32	%f10,	%f0,	%f8
	movge	%icc,	%i7,	%i1
	tl	%icc,	0x1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%g5
	fbue,a	%fcc1,	loop_3039
	udivcc	%i2,	0x1130,	%o3
	fandnot2	%f6,	%f4,	%f14
	fpadd32	%f20,	%f30,	%f6
loop_3039:
	call	loop_3040
	tn	%icc,	0x4
	fbge,a	%fcc2,	loop_3041
	fandnot2s	%f24,	%f11,	%f6
loop_3040:
	ba,a	%icc,	loop_3042
	stw	%g7,	[%l7 + 0x1C]
loop_3041:
	alignaddrl	%o0,	%i0,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3042:
	movvc	%xcc,	%l0,	%i6
	srax	%o2,	%l5,	%l4
	set	0x58, %l3
	ldswa	[%l7 + %l3] 0x89,	%g4
	movrgz	%o1,	%l1,	%g6
	fmovsgu	%icc,	%f6,	%f9
	sethi	0x0240,	%l6
	nop
	setx	0xC991E6A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xB8F943C5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f15,	%f21
	movleu	%icc,	%l2,	%g3
	movn	%icc,	%i5,	%o7
	sra	%o6,	0x1E,	%i3
	movleu	%icc,	%o4,	%l3
	edge32l	%o5,	%i7,	%g2
	fmovscc	%xcc,	%f17,	%f11
	subccc	%i1,	%g5,	%g1
	movg	%icc,	%i2,	%o3
	sethi	0x1B10,	%g7
	array8	%i0,	%i4,	%o0
	tleu	%icc,	0x7
	sdivx	%i6,	0x0AF7,	%o2
	swap	[%l7 + 0x70],	%l0
	movrlez	%l5,	0x250,	%g4
	sth	%l4,	[%l7 + 0x72]
	subcc	%l1,	0x17AF,	%o1
	wr	%g0,	0x18,	%asi
	stba	%g6,	[%l7 + 0x3B] %asi
	fbn,a	%fcc3,	loop_3043
	tcc	%xcc,	0x0
	set	0x8, %i3
	ldxa	[%g0 + %i3] 0x4f,	%l2
loop_3043:
	addc	%g3,	0x196F,	%i5
	umul	%l6,	0x14C3,	%o6
	set	0x72, %g1
	stba	%o7,	[%l7 + %g1] 0x27
	membar	#Sync
	bn,a	%xcc,	loop_3044
	smul	%o4,	%i3,	%o5
	mova	%icc,	%i7,	%l3
	fmovsg	%xcc,	%f11,	%f16
loop_3044:
	edge32l	%i1,	%g5,	%g2
	movcc	%xcc,	%g1,	%i2
	fbl	%fcc2,	loop_3045
	or	%g7,	%i0,	%o3
	movrlz	%i4,	%o0,	%o2
	brz,a	%i6,	loop_3046
loop_3045:
	taddcctv	%l5,	%l0,	%g4
	ta	%xcc,	0x0
	alignaddr	%l4,	%o1,	%g6
loop_3046:
	srlx	%l2,	0x14,	%g3
	bvc,a,pt	%xcc,	loop_3047
	udivcc	%l1,	0x1B46,	%i5
	smulcc	%l6,	0x04C6,	%o6
	smulcc	%o4,	%o7,	%i3
loop_3047:
	add	%o5,	%i7,	%l3
	addcc	%g5,	%g2,	%g1
	edge8	%i1,	%i2,	%g7
	udivcc	%i0,	0x029C,	%o3
	nop
	set	0x25, %o7
	ldstub	[%l7 + %o7],	%o0
	tg	%icc,	0x1
	movrgez	%i4,	%i6,	%o2
	tge	%icc,	0x2
	umul	%l5,	%l0,	%l4
	ldsh	[%l7 + 0x44],	%o1
	move	%icc,	%g4,	%g6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x36] %asi,	%g3
	fmovdpos	%icc,	%f28,	%f21
	brgez,a	%l2,	loop_3048
	fbuge,a	%fcc1,	loop_3049
	subc	%l1,	0x17F0,	%i5
	fmovdneg	%icc,	%f13,	%f2
loop_3048:
	tgu	%xcc,	0x6
loop_3049:
	fnegd	%f10,	%f8
	te	%xcc,	0x2
	edge8ln	%l6,	%o6,	%o4
	movrgez	%i3,	%o5,	%o7
	lduh	[%l7 + 0x1E],	%l3
	stx	%i7,	[%l7 + 0x30]
	orcc	%g2,	%g5,	%i1
	tneg	%xcc,	0x1
	fmovs	%f1,	%f6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x70] %asi,	%g1
	move	%xcc,	%i2,	%g7
	brlez	%o3,	loop_3050
	bgu	%icc,	loop_3051
	fpack16	%f12,	%f20
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%i4
loop_3050:
	fmovsvc	%icc,	%f27,	%f19
loop_3051:
	edge32n	%i6,	%i0,	%o2
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x50] %asi,	%l0
	movge	%xcc,	%l5,	%l4
	fbne,a	%fcc1,	loop_3052
	fmovrdlz	%g4,	%f26,	%f0
	bcc,pt	%icc,	loop_3053
	tpos	%xcc,	0x4
loop_3052:
	xnorcc	%o1,	%g3,	%l2
	fbuge,a	%fcc3,	loop_3054
loop_3053:
	movgu	%xcc,	%l1,	%g6
	set	0x68, %i1
	prefetcha	[%l7 + %i1] 0x19,	 0x3
loop_3054:
	udiv	%i5,	0x15AB,	%o4
	nop
	setx	0x92CCE876B1097730,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xDBBF2BE46DC70F1F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f2,	%f8
	bleu,pn	%icc,	loop_3055
	fmovdvs	%icc,	%f9,	%f31
	orncc	%o6,	%i3,	%o7
	fpackfix	%f12,	%f7
loop_3055:
	membar	0x6E
	array32	%o5,	%i7,	%g2
	fmovscs	%icc,	%f2,	%f14
	be,pn	%icc,	loop_3056
	array32	%g5,	%l3,	%i1
	bcc,a,pt	%icc,	loop_3057
	edge8	%g1,	%i2,	%o3
loop_3056:
	movge	%icc,	%o0,	%g7
	and	%i4,	%i0,	%o2
loop_3057:
	orncc	%i6,	%l5,	%l0
	array32	%l4,	%o1,	%g3
	nop
	setx	0x98644EB4F0468F52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fpsub16	%f18,	%f20,	%f28
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l2,	%g4
	mulx	%l1,	0x02B8,	%l6
	popc	0x10F6,	%i5
	umulcc	%g6,	%o4,	%o6
	sir	0x03B3
	bg,pn	%icc,	loop_3058
	fcmpgt32	%f2,	%f14,	%i3
	tg	%xcc,	0x3
	movrne	%o5,	0x083,	%o7
loop_3058:
	nop
	fitos	%f4,	%f29
	alignaddr	%i7,	%g2,	%l3
	movgu	%xcc,	%g5,	%g1
	alignaddr	%i2,	%i1,	%o3
	bn,a,pt	%xcc,	loop_3059
	fbug	%fcc1,	loop_3060
	edge32	%g7,	%o0,	%i4
	fbl	%fcc1,	loop_3061
loop_3059:
	fmul8x16au	%f30,	%f22,	%f8
loop_3060:
	mova	%icc,	%o2,	%i0
	brgz,a	%i6,	loop_3062
loop_3061:
	sir	0x1974
	edge8l	%l5,	%l0,	%l4
	movvs	%xcc,	%o1,	%g3
loop_3062:
	nop
	setx	0x5041D049,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	fpack16	%f26,	%f26
	srl	%g4,	%l1,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%i5
	tgu	%icc,	0x5
	pdist	%f0,	%f4,	%f30
	alignaddrl	%g6,	%l6,	%o4
	movle	%icc,	%o6,	%i3
	brnz	%o5,	loop_3063
	ldsh	[%l7 + 0x5C],	%o7
	sra	%i7,	%g2,	%l3
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x15,	%f16
loop_3063:
	tsubcctv	%g1,	%g5,	%i2
	fbne	%fcc1,	loop_3064
	taddcc	%i1,	%g7,	%o0
	bn,a,pt	%icc,	loop_3065
	fmovdne	%icc,	%f16,	%f13
loop_3064:
	srax	%i4,	%o2,	%o3
	smulcc	%i0,	%l5,	%i6
loop_3065:
	nop
	wr	%g0,	0x2a,	%asi
	stwa	%l4,	[%l7 + 0x14] %asi
	membar	#Sync
	addccc	%l0,	%o1,	%g3
	bcs,pn	%icc,	loop_3066
	te	%icc,	0x4
	sdivx	%g4,	0x0D52,	%l1
	movn	%icc,	%l2,	%i5
loop_3066:
	fmovsgu	%icc,	%f23,	%f29
	tvc	%icc,	0x4
	fmovscs	%icc,	%f10,	%f8
	sllx	%l6,	0x12,	%g6
	fmovrdgez	%o6,	%f14,	%f12
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%o4
	brz	%o5,	loop_3067
	taddcctv	%o7,	0x1E03,	%i3
	fcmpgt16	%f2,	%f14,	%i7
	alignaddrl	%l3,	%g1,	%g2
loop_3067:
	fmovrslz	%i2,	%f9,	%f14
	subcc	%i1,	0x1A1F,	%g5
	orn	%g7,	0x09AA,	%o0
	tsubcctv	%i4,	0x0FAF,	%o3
	fmul8x16au	%f14,	%f12,	%f24
	tge	%xcc,	0x7
	ldstub	[%l7 + 0x24],	%o2
	edge8	%i0,	%l5,	%i6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%l0
	set	0x0C, %l1
	swapa	[%l7 + %l1] 0x81,	%l4
	movl	%icc,	%o1,	%g4
	edge32l	%l1,	%g3,	%i5
	sub	%l2,	%g6,	%l6
	fand	%f18,	%f22,	%f10
	movrlz	%o4,	%o5,	%o6
	fnand	%f4,	%f30,	%f24
	movge	%xcc,	%o7,	%i7
	movre	%i3,	%l3,	%g1
	movl	%icc,	%i2,	%g2
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x89,	%g4
	subcc	%g7,	0x00D0,	%i1
	sdivx	%o0,	0x1628,	%o3
	stx	%i4,	[%l7 + 0x20]
	fmovdle	%icc,	%f24,	%f29
	nop
	setx loop_3068, %l0, %l1
	jmpl %l1, %i0
	ldd	[%l7 + 0x28],	%l4
	tsubcctv	%o2,	0x1223,	%l0
	ldsw	[%l7 + 0x3C],	%i6
loop_3068:
	edge16n	%l4,	%o1,	%g4
	movvs	%icc,	%l1,	%i5
	wr	%g0,	0x23,	%asi
	stwa	%l2,	[%l7 + 0x10] %asi
	membar	#Sync
	sdiv	%g3,	0x05CC,	%g6
	nop
	setx	loop_3069,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ta	%icc,	0x6
	edge32ln	%o4,	%o5,	%o6
	movcs	%icc,	%o7,	%l6
loop_3069:
	array8	%i3,	%i7,	%l3
	addccc	%g1,	%i2,	%g2
	fmovdcc	%icc,	%f0,	%f25
	movpos	%xcc,	%g5,	%i1
	tge	%icc,	0x6
	bl,a,pt	%icc,	loop_3070
	nop
	set	0x28, %g7
	ldsb	[%l7 + %g7],	%g7
	bg	%icc,	loop_3071
	addccc	%o3,	0x02AA,	%i4
loop_3070:
	add	%i0,	0x1329,	%o0
	orn	%o2,	0x068A,	%l5
loop_3071:
	tge	%xcc,	0x4
	subcc	%l0,	%l4,	%i6
	edge32l	%g4,	%l1,	%o1
	movleu	%icc,	%l2,	%i5
	popc	%g3,	%o4
	movgu	%icc,	%o5,	%g6
	mulx	%o6,	0x1D99,	%o7
	fmovdgu	%xcc,	%f11,	%f15
	subc	%i3,	%l6,	%l3
	or	%g1,	0x12EA,	%i7
	movgu	%icc,	%i2,	%g5
	fnand	%f28,	%f0,	%f14
	mulx	%i1,	%g7,	%g2
	orn	%o3,	%i4,	%o0
	fmovdg	%xcc,	%f14,	%f26
	nop
	setx	0x25D6A1F9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f3
	subccc	%i0,	%o2,	%l5
	sra	%l0,	0x11,	%i6
	orncc	%l4,	%g4,	%o1
	nop
	setx	0x09D5F53E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xD6656908,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f20,	%f29
	array32	%l2,	%i5,	%g3
	fba	%fcc0,	loop_3072
	tcc	%xcc,	0x4
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_3072:
	array32	%l1,	%o4,	%g6
	addccc	%o5,	0x0FF4,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i3,	0x1A63,	%l6
	bpos,a,pt	%xcc,	loop_3073
	bge,a,pt	%xcc,	loop_3074
	alignaddr	%l3,	%o7,	%i7
	nop
	setx	0xB415012F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f1
loop_3073:
	sll	%g1,	%g5,	%i1
loop_3074:
	call	loop_3075
	fbl,a	%fcc2,	loop_3076
	fxnors	%f4,	%f28,	%f0
	tsubcctv	%g7,	%g2,	%i2
loop_3075:
	or	%o3,	0x0F3C,	%o0
loop_3076:
	fbo,a	%fcc1,	loop_3077
	movrgez	%i4,	%o2,	%l5
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x08] %asi,	%l0
loop_3077:
	bpos,a	%xcc,	loop_3078
	sth	%i0,	[%l7 + 0x30]
	add	%i6,	0x0CDB,	%g4
	edge32	%l4,	%l2,	%o1
loop_3078:
	tvc	%icc,	0x7
	umul	%i5,	%g3,	%l1
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tg	%icc,	0x6
	mova	%icc,	%g6,	%o4
	fmovda	%xcc,	%f21,	%f29
	mova	%xcc,	%o5,	%i3
	fmul8sux16	%f30,	%f12,	%f0
	tg	%icc,	0x7
	movpos	%icc,	%o6,	%l3
	srl	%l6,	0x1C,	%i7
	xnor	%o7,	%g5,	%g1
	sir	0x130A
	fbe	%fcc1,	loop_3079
	subccc	%g7,	0x057F,	%i1
	fmovrdgez	%g2,	%f2,	%f8
	srax	%o3,	%i2,	%i4
loop_3079:
	bcc,a,pt	%icc,	loop_3080
	nop
	set	0x28, %g2
	ldstub	[%l7 + %g2],	%o0
	fbge	%fcc2,	loop_3081
	movneg	%xcc,	%l5,	%l0
loop_3080:
	andcc	%o2,	0x0B7D,	%i0
	nop
	setx	0x93BD0DBA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f4
loop_3081:
	movneg	%icc,	%i6,	%g4
	udiv	%l2,	0x1657,	%o1
	array8	%l4,	%g3,	%i5
	sir	0x1B95
	sethi	0x0942,	%g6
	call	loop_3082
	fnand	%f20,	%f26,	%f6
	movneg	%xcc,	%o4,	%o5
	bvc,a,pt	%icc,	loop_3083
loop_3082:
	fbo	%fcc3,	loop_3084
	ba	loop_3085
	taddcc	%i3,	0x0714,	%l1
loop_3083:
	edge32ln	%o6,	%l6,	%l3
loop_3084:
	sra	%o7,	0x17,	%g5
loop_3085:
	movrgez	%i7,	0x1E0,	%g1
	movrgz	%g7,	0x0E2,	%i1
	nop
	fitos	%f6,	%f29
	fstox	%f29,	%f10
	fxtos	%f10,	%f22
	fmovrde	%g2,	%f22,	%f14
	tneg	%icc,	0x6
	bcc	loop_3086
	fmovscs	%icc,	%f0,	%f19
	movrlez	%o3,	%i4,	%i2
	xorcc	%o0,	%l0,	%o2
loop_3086:
	fmovdneg	%icc,	%f12,	%f30
	fmuld8ulx16	%f15,	%f4,	%f24
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2826
!	Type cti   	: 3086
!	Type x   	: 1269
!	Type f   	: 4463
!	Type i   	: 13356
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x4D564889
.word 0x131C54FB
.word 0x048F9163
.word 0xD1C4D73C
.word 0xC96FFE50
.word 0xCFF5A93A
.word 0x98C2D9AD
.word 0xB606546A
.word 0xE2CDDC63
.word 0x03F3AB21
.word 0x8AB76914
.word 0xBC274379
.word 0xDBE741F8
.word 0xE64CE34E
.word 0x2E23EAD8
.word 0x31C6E981
.word 0x07759E6F
.word 0x63AA8C0F
.word 0x310EB90F
.word 0x962C0365
.word 0x4AFB272E
.word 0xDB19D53E
.word 0x15B9F7D2
.word 0xED8F3361
.word 0x560E6C2E
.word 0x0ECB8CD9
.word 0xBF08FD28
.word 0xF87D81B5
.word 0x0EB6423B
.word 0xC45D0B81
.word 0xD867731D
.word 0xB74C1AEE
.word 0xA5683774
.word 0xB17968EA
.word 0x64266714
.word 0xC521F462
.word 0x44B2B244
.word 0x1145EBFB
.word 0xB46BBE84
.word 0xC263BA50
.word 0xF6210C23
.word 0x23B3B4C3
.word 0x6C40A15A
.word 0x8F591F76
.word 0xB1482278
.word 0x940B9184
.word 0xE9F48365
.word 0x9D4CCBCE
.word 0x6838BF72
.word 0x75548A6E
.word 0x09EA12FC
.word 0x4BA06E01
.word 0x8E844442
.word 0xF4E12EEF
.word 0x8BDBD173
.word 0x968E3D7A
.word 0x14269EAB
.word 0xCA8344ED
.word 0x645D2DCF
.word 0x53732B6D
.word 0x1B4EDC07
.word 0xADB4CFD6
.word 0xE36C3058
.word 0xA2456BAC
.end
