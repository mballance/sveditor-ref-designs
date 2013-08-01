/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f8.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f8.s,v 1.1 2007/05/11 17:22:29 drp Exp $"
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
	setx	0x04A90EC14058AD75,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0xF,	%g2
	set	0x6,	%g3
	set	0xE,	%g4
	set	0x3,	%g5
	set	0xD,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x8,	%i0
	set	-0xB,	%i1
	set	-0x3,	%i2
	set	-0x7,	%i3
	set	-0xE,	%i4
	set	-0xB,	%i5
	set	-0xF,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x60D6507B,	%l0
	set	0x061DC3A9,	%l1
	set	0x5EE32D20,	%l2
	set	0x59E01E19,	%l3
	set	0x4E0C8CA0,	%l4
	set	0x685DECE6,	%l5
	set	0x366C248D,	%l6
	!# Output registers
	set	0x1C2F,	%o0
	set	0x12EE,	%o1
	set	0x13E9,	%o2
	set	-0x1101,	%o3
	set	-0x0DFB,	%o4
	set	-0x1A28,	%o5
	set	0x1E25,	%o6
	set	-0x1290,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x8B2967E5D54CC1F5)
	INIT_TH_FP_REG(%l7,%f2,0x5B79244CDA1147CE)
	INIT_TH_FP_REG(%l7,%f4,0x781A89895E98EF55)
	INIT_TH_FP_REG(%l7,%f6,0xE25436366B4F0141)
	INIT_TH_FP_REG(%l7,%f8,0xE69CD0B070CA1722)
	INIT_TH_FP_REG(%l7,%f10,0xD717DDC0418919BE)
	INIT_TH_FP_REG(%l7,%f12,0xF1D75407DC5D2D07)
	INIT_TH_FP_REG(%l7,%f14,0x9A2FC0E5E05B88DB)
	INIT_TH_FP_REG(%l7,%f16,0x0B24F0B54BF6FFEC)
	INIT_TH_FP_REG(%l7,%f18,0x74DF55DBDC2E137D)
	INIT_TH_FP_REG(%l7,%f20,0x98ADF6E6E655A080)
	INIT_TH_FP_REG(%l7,%f22,0x18E32CB40ED20126)
	INIT_TH_FP_REG(%l7,%f24,0x57503E87A770EADA)
	INIT_TH_FP_REG(%l7,%f26,0x9A7F7C881D54ADAC)
	INIT_TH_FP_REG(%l7,%f28,0xCDC61A3BCE534A34)
	INIT_TH_FP_REG(%l7,%f30,0x4390471DFAF96663)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	subccc	%l4,	%i0,	%o1
	nop
	fitod	%f10,	%f26
	fdtos	%f26,	%f4
	array32	%l1,	%o6,	%i1
	te	%icc,	0x7
	tgu	%xcc,	0x6
	ldsw	[%l7 + 0x1C],	%i7
	movle	%icc,	%o3,	%g2
	edge16ln	%g3,	%o5,	%g6
	subccc	%l6,	0x0C7F,	%o4
	movge	%xcc,	%g1,	%i3
	orcc	%i6,	0x140A,	%g7
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x14] %asi,	%l3
	brgz	%i5,	loop_1
	fbo	%fcc2,	loop_2
	fcmpeq32	%f6,	%f22,	%g5
	stx	%l0,	[%l7 + 0x70]
loop_1:
	te	%icc,	0x5
loop_2:
	pdist	%f0,	%f0,	%f20
	tle	%icc,	0x1
	fbe	%fcc3,	loop_3
	movleu	%icc,	%i2,	%o7
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%o0
loop_3:
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f22
	fxtod	%f22,	%f16
	movrne	%g4,	%i4,	%o2
	flush	%l7 + 0x60
	ta	%icc,	0x1
	movge	%icc,	%l2,	%l4
	edge16ln	%l5,	%o1,	%l1
	edge16l	%i0,	%i1,	%o6
	sll	%o3,	0x07,	%i7
	and	%g3,	%o5,	%g6
	srl	%l6,	%g2,	%o4
	movcs	%icc,	%i3,	%i6
	orn	%g1,	%g7,	%l3
	alignaddrl	%g5,	%l0,	%i5
	andcc	%o7,	0x1D7F,	%i2
	ldd	[%l7 + 0x70],	%g4
	edge8ln	%i4,	%o2,	%l2
	movle	%xcc,	%l4,	%o0
	sir	0x1503
	tcs	%xcc,	0x7
	movvc	%xcc,	%l5,	%l1
	taddcc	%o1,	0x1274,	%i1
	fandnot2	%f22,	%f28,	%f8
	srax	%i0,	0x03,	%o3
	tcs	%icc,	0x5
	xorcc	%o6,	%g3,	%i7
	fpadd32	%f24,	%f24,	%f28
	movrgz	%g6,	0x37F,	%l6
	fble	%fcc1,	loop_4
	sdivx	%g2,	0x053B,	%o4
	move	%icc,	%o5,	%i6
	fba	%fcc1,	loop_5
loop_4:
	edge16ln	%i3,	%g7,	%g1
	and	%l3,	%l0,	%i5
	edge16	%g5,	%i2,	%g4
loop_5:
	fcmple16	%f18,	%f8,	%o7
	srl	%o2,	%i4,	%l2
	movcc	%icc,	%o0,	%l5
	stbar
	movneg	%xcc,	%l4,	%l1
	nop
	setx	0x706C5B44,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	fmovsneg	%icc,	%f15,	%f7
	fand	%f0,	%f6,	%f14
	sethi	0x0BAD,	%o1
	ldx	[%l7 + 0x08],	%i1
	edge32n	%i0,	%o3,	%o6
	edge16	%g3,	%g6,	%l6
	smul	%g2,	%o4,	%o5
	nop
	fitos	%f13,	%f31
	fstod	%f31,	%f2
	andncc	%i6,	%i7,	%g7
	movleu	%xcc,	%g1,	%l3
	bl,pn	%xcc,	loop_6
	fbe	%fcc1,	loop_7
	movle	%icc,	%l0,	%i5
	xnor	%g5,	0x17ED,	%i2
loop_6:
	call	loop_8
loop_7:
	subcc	%g4,	0x1F45,	%i3
	fmovrdgz	%o7,	%f22,	%f26
	tcs	%icc,	0x5
loop_8:
	fsrc1	%f12,	%f26
	ldd	[%l7 + 0x50],	%o2
	fmovsle	%icc,	%f8,	%f28
	edge8ln	%i4,	%o0,	%l5
	tle	%xcc,	0x7
	tleu	%xcc,	0x4
	fpack32	%f6,	%f24,	%f20
	fmovsn	%icc,	%f18,	%f19
	tl	%icc,	0x6
	bpos,a,pt	%xcc,	loop_9
	edge8	%l4,	%l1,	%o1
	nop
	setx	0x6F19D17D96F5DF27,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xBB387B40ECAF8894,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f4,	%f14
	mulx	%l2,	%i0,	%o3
loop_9:
	fble,a	%fcc1,	loop_10
	fmovsg	%xcc,	%f13,	%f14
	sir	0x03FC
	nop
	fitos	%f10,	%f23
	fstod	%f23,	%f22
loop_10:
	tne	%xcc,	0x3
	and	%i1,	%o6,	%g3
	lduh	[%l7 + 0x36],	%l6
	edge32l	%g2,	%o4,	%g6
	edge8ln	%o5,	%i6,	%i7
	fand	%f2,	%f0,	%f10
	fbule,a	%fcc0,	loop_11
	andn	%g7,	0x0346,	%g1
	subcc	%l3,	0x1EFE,	%l0
	fbn	%fcc0,	loop_12
loop_11:
	fmovse	%icc,	%f29,	%f21
	smulcc	%i5,	%g5,	%g4
	nop
	setx	0x49B4C88630722362,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_12:
	fmovsge	%icc,	%f5,	%f1
	stx	%i3,	[%l7 + 0x70]
	edge32n	%o7,	%o2,	%i2
	fxnor	%f2,	%f12,	%f12
	prefetch	[%l7 + 0x08],	 0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue	%fcc2,	loop_13
	mulx	%i4,	0x1B6F,	%l5
	fsrc1	%f12,	%f20
	fmovs	%f17,	%f0
loop_13:
	movvc	%icc,	%o0,	%l4
	fmovsleu	%icc,	%f8,	%f22
	movrlez	%l1,	0x312,	%o1
	addcc	%i0,	%l2,	%i1
	tvs	%icc,	0x4
	edge32	%o6,	%o3,	%g3
	movleu	%icc,	%g2,	%l6
	fblg,a	%fcc3,	loop_14
	umulcc	%g6,	0x182C,	%o5
	bvc,a	%icc,	loop_15
	sdivx	%o4,	0x122D,	%i7
loop_14:
	alignaddrl	%i6,	%g1,	%l3
	ldsw	[%l7 + 0x78],	%g7
loop_15:
	movrlz	%i5,	%l0,	%g5
	orn	%i3,	%g4,	%o7
	movneg	%icc,	%o2,	%i4
	fmovrsgz	%l5,	%f0,	%f17
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
	edge8n	%o0,	%l4,	%i2
	movrne	%l1,	%i0,	%l2
	nop
	setx	0x05399EFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x98094AE6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f3,	%f23
loop_16:
	edge32l	%o1,	%i1,	%o3
	tpos	%icc,	0x2
	taddcctv	%g3,	0x068F,	%g2
	movrne	%o6,	0x283,	%g6
	edge8	%o5,	%o4,	%l6
	tneg	%xcc,	0x4
	movgu	%icc,	%i7,	%g1
	or	%l3,	0x0BD1,	%i6
	tg	%xcc,	0x2
	membar	0x5E
	set	0x30, %g4
	lda	[%l7 + %g4] 0x14,	%f1
	pdist	%f18,	%f16,	%f16
	fmovrdlz	%i5,	%f2,	%f20
	tneg	%icc,	0x4
	set	0x62, %g1
	stba	%g7,	[%l7 + %g1] 0x22
	membar	#Sync
	fmovdcs	%xcc,	%f9,	%f1
	edge16l	%l0,	%g5,	%i3
	ta	%xcc,	0x6
	edge8l	%g4,	%o2,	%o7
	stbar
	fbue,a	%fcc3,	loop_17
	movrgz	%i4,	0x192,	%o0
	wr	%g0,	0x80,	%asi
	sta	%f22,	[%l7 + 0x38] %asi
loop_17:
	ldd	[%l7 + 0x70],	%f0
	sth	%l5,	[%l7 + 0x30]
	movcs	%xcc,	%i2,	%l1
	sdiv	%i0,	0x1B13,	%l2
	addc	%o1,	%i1,	%o3
	fmovsleu	%xcc,	%f11,	%f3
	nop
	setx	0x2CC78442FFC20740,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f22
	orcc	%l4,	0x045B,	%g2
	fcmple32	%f20,	%f0,	%g3
	tneg	%xcc,	0x2
	movge	%xcc,	%g6,	%o6
	fmovsvc	%icc,	%f3,	%f4
	fmovdneg	%icc,	%f7,	%f2
	sdivcc	%o4,	0x0F05,	%l6
	subccc	%i7,	0x070D,	%o5
	orncc	%l3,	%i6,	%i5
	tge	%xcc,	0x3
	edge8n	%g1,	%g7,	%l0
	bvc,a	loop_18
	nop
	fitos	%f6,	%f23
	fstod	%f23,	%f6
	set	0x23, %g7
	stba	%g5,	[%l7 + %g7] 0xe3
	membar	#Sync
loop_18:
	orncc	%g4,	0x05C7,	%o2
	edge32l	%i3,	%i4,	%o7
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x18] %asi,	%o0
	orcc	%i2,	%l1,	%l5
	umul	%l2,	%i0,	%o1
	movrgez	%o3,	%i1,	%l4
	flush	%l7 + 0x20
	movle	%xcc,	%g3,	%g6
	movgu	%xcc,	%g2,	%o6
	ldd	[%l7 + 0x68],	%i6
	movg	%icc,	%o4,	%i7
	popc	%o5,	%i6
	sir	0x05DA
	andncc	%l3,	%g1,	%i5
	movgu	%xcc,	%l0,	%g7
	fcmple16	%f6,	%f14,	%g4
	tcc	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4A] %asi,	%g5
	bcs,pt	%icc,	loop_19
	movge	%xcc,	%o2,	%i3
	edge32l	%i4,	%o7,	%i2
	sub	%o0,	0x0FFB,	%l1
loop_19:
	edge8ln	%l5,	%i0,	%l2
	prefetch	[%l7 + 0x74],	 0x3
	array32	%o3,	%i1,	%l4
	fpadd16s	%f5,	%f11,	%f3
	and	%g3,	0x1BD3,	%o1
	sir	0x1B55
	sdiv	%g6,	0x1B1A,	%g2
	mova	%xcc,	%o6,	%o4
	fpsub32	%f8,	%f14,	%f30
	fmovsle	%icc,	%f31,	%f30
	tpos	%icc,	0x1
	set	0x72, %o0
	ldsha	[%l7 + %o0] 0x18,	%l6
	edge32l	%o5,	%i6,	%l3
	fxor	%f18,	%f18,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i7,	0x13F7,	%i5
	tvc	%xcc,	0x6
	tpos	%icc,	0x7
	movre	%l0,	0x2C2,	%g1
	or	%g7,	0x1ECF,	%g5
	fbug	%fcc1,	loop_20
	fbge,a	%fcc2,	loop_21
	bleu	%icc,	loop_22
	edge16n	%o2,	%g4,	%i4
loop_20:
	movrgez	%o7,	0x37E,	%i3
loop_21:
	fmovsneg	%icc,	%f23,	%f30
loop_22:
	edge8l	%o0,	%l1,	%l5
	srl	%i2,	%i0,	%l2
	addcc	%o3,	0x0229,	%i1
	movg	%icc,	%l4,	%g3
	ldsb	[%l7 + 0x63],	%g6
	mulscc	%g2,	%o1,	%o6
	edge32	%l6,	%o5,	%i6
	umulcc	%o4,	%l3,	%i5
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x1f
	membar	#Sync
	addccc	%l0,	0x125B,	%i7
	fpsub32s	%f16,	%f1,	%f25
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f16
	fxtod	%f16,	%f30
	tsubcctv	%g1,	%g5,	%o2
	ldub	[%l7 + 0x22],	%g4
	edge8l	%g7,	%o7,	%i3
	srlx	%i4,	%l1,	%o0
	edge32n	%i2,	%l5,	%i0
	edge16	%o3,	%i1,	%l2
	prefetch	[%l7 + 0x30],	 0x0
	nop
	setx	0xCF7D9410,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xE56765C3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f28,	%f12
	tcs	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
	orcc	%g6,	%l4,	%o1
	fmovdg	%icc,	%f31,	%f8
	fornot1	%f12,	%f14,	%f6
	ldsw	[%l7 + 0x64],	%g2
	tn	%xcc,	0x1
	mulscc	%l6,	0x0038,	%o6
	tg	%icc,	0x0
	fmovdg	%xcc,	%f1,	%f0
	sdivx	%o5,	0x0192,	%i6
	tsubcctv	%l3,	%o4,	%i5
	movl	%icc,	%i7,	%g1
	membar	0x23
	fbug	%fcc2,	loop_23
	nop
	setx	loop_24,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sll	%l0,	%o2,	%g4
	fcmpeq32	%f12,	%f26,	%g5
loop_23:
	edge16ln	%g7,	%o7,	%i4
loop_24:
	brgez	%l1,	loop_25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f16,	%f10,	%f6
	nop
	setx	0x45F8E7B8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xEA3F56ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f9,	%f24
loop_25:
	movrlez	%i3,	%i2,	%l5
	fbul	%fcc3,	loop_26
	fbge	%fcc0,	loop_27
	fmovdvs	%xcc,	%f15,	%f12
	array8	%o0,	%i0,	%i1
loop_26:
	movrlz	%o3,	%l2,	%g3
loop_27:
	fmovrde	%g6,	%f10,	%f14
	andn	%o1,	%l4,	%g2
	edge8n	%o6,	%o5,	%i6
	nop
	setx	loop_28,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tpos	%icc,	0x3
	fpadd32	%f26,	%f20,	%f26
	tsubcctv	%l3,	0x0360,	%l6
loop_28:
	edge32n	%i5,	%o4,	%g1
	andcc	%i7,	%l0,	%o2
	bg,a	loop_29
	bl,pt	%icc,	loop_30
	sll	%g5,	0x1B,	%g4
	umul	%g7,	%i4,	%o7
loop_29:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x88,	%l1,	%i2
loop_30:
	fbug,a	%fcc3,	loop_31
	edge16ln	%i3,	%o0,	%l5
	addcc	%i0,	%i1,	%o3
	movrlz	%g3,	%l2,	%g6
loop_31:
	movvc	%icc,	%l4,	%g2
	movpos	%icc,	%o1,	%o6
	nop
	setx	loop_32,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8	%i6,	%o5,	%l3
	umul	%i5,	0x049D,	%o4
	edge32ln	%l6,	%i7,	%g1
loop_32:
	srl	%o2,	%l0,	%g5
	sll	%g7,	0x17,	%i4
	fandnot1s	%f8,	%f22,	%f26
	tgu	%xcc,	0x4
	sethi	0x0676,	%g4
	smulcc	%o7,	%i2,	%l1
	stbar
	movgu	%xcc,	%i3,	%o0
	fbuge	%fcc0,	loop_33
	movrlz	%l5,	0x387,	%i0
	fmovrslez	%o3,	%f20,	%f14
	movvs	%xcc,	%g3,	%i1
loop_33:
	fmovdn	%icc,	%f28,	%f14
	edge32ln	%l2,	%l4,	%g2
	movrgz	%o1,	0x0E0,	%o6
	ta	%xcc,	0x4
	set	0x4A, %i1
	stha	%i6,	[%l7 + %i1] 0x2f
	membar	#Sync
	fpsub32	%f28,	%f26,	%f16
	edge32	%g6,	%l3,	%i5
	nop
	set	0x18, %i4
	ldd	[%l7 + %i4],	%f8
	smulcc	%o5,	%l6,	%i7
	tleu	%xcc,	0x7
	ldsb	[%l7 + 0x13],	%g1
	smul	%o2,	%l0,	%o4
	be,a	%xcc,	loop_34
	array16	%g5,	%i4,	%g7
	movgu	%icc,	%g4,	%i2
	fpsub16	%f22,	%f30,	%f6
loop_34:
	movrgez	%l1,	0x32D,	%o7
	bne,a,pn	%icc,	loop_35
	tne	%xcc,	0x1
	fandnot2s	%f31,	%f24,	%f22
	fble,a	%fcc1,	loop_36
loop_35:
	fpsub32s	%f5,	%f20,	%f28
	mulscc	%i3,	%l5,	%i0
	edge32ln	%o0,	%g3,	%o3
loop_36:
	movvc	%xcc,	%l2,	%i1
	addccc	%l4,	%g2,	%o1
	sdiv	%i6,	0x0568,	%o6
	fpsub16	%f28,	%f4,	%f28
	fnands	%f2,	%f21,	%f3
	fmovdcc	%icc,	%f12,	%f31
	alignaddrl	%g6,	%l3,	%o5
	sllx	%l6,	0x0E,	%i7
	fzeros	%f11
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%g1,	%i5
	edge32	%l0,	%o2,	%g5
	brz	%i4,	loop_37
	xnorcc	%g7,	%o4,	%g4
	alignaddrl	%i2,	%o7,	%i3
	edge8n	%l5,	%l1,	%o0
loop_37:
	nop
	setx	loop_38,	%l0,	%l1
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
	array32	%i0,	%o3,	%g3
	andcc	%i1,	0x1EB3,	%l2
loop_38:
	tn	%icc,	0x1
	movle	%xcc,	%l4,	%g2
	fmovdneg	%icc,	%f13,	%f11
	tvs	%icc,	0x7
	alignaddrl	%i6,	%o6,	%g6
	xnorcc	%o1,	%l3,	%l6
	srl	%o5,	%g1,	%i5
	fxor	%f6,	%f24,	%f10
	fble,a	%fcc2,	loop_39
	taddcc	%i7,	%o2,	%l0
	orncc	%g5,	0x0B0D,	%i4
	tle	%icc,	0x0
loop_39:
	edge16n	%g7,	%g4,	%o4
	move	%icc,	%i2,	%o7
	movrne	%l5,	%i3,	%l1
	fzero	%f8
	tsubcctv	%i0,	%o0,	%g3
	tl	%icc,	0x2
	popc	0x1FE7,	%i1
	ld	[%l7 + 0x5C],	%f21
	addccc	%l2,	%l4,	%o3
	movrne	%g2,	0x1D6,	%o6
	sdiv	%g6,	0x1947,	%i6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	fmovscc	%icc,	%f30,	%f16
	tvc	%xcc,	0x0
	fmul8sux16	%f22,	%f6,	%f24
	tn	%xcc,	0x1
	smul	%l6,	0x1FCF,	%o5
	sub	%l3,	0x0101,	%g1
	movne	%xcc,	%i7,	%o2
	subccc	%i5,	%l0,	%i4
	set	0x50, %l1
	stxa	%g5,	[%l7 + %l1] 0xe3
	membar	#Sync
	addcc	%g4,	%o4,	%i2
	andncc	%o7,	%g7,	%l5
	movvs	%icc,	%l1,	%i3
	fbe	%fcc1,	loop_40
	andcc	%i0,	%o0,	%g3
	fcmpeq16	%f16,	%f16,	%l2
	sllx	%i1,	0x05,	%l4
loop_40:
	mulscc	%o3,	0x0836,	%g2
	edge8n	%o6,	%i6,	%o1
	for	%f8,	%f26,	%f16
	bge,a,pn	%xcc,	loop_41
	array32	%g6,	%l6,	%l3
	alignaddr	%g1,	%i7,	%o2
	tcc	%icc,	0x3
loop_41:
	tvc	%icc,	0x1
	tle	%xcc,	0x2
	fzeros	%f4
	popc	0x114B,	%o5
	popc	0x1B6F,	%l0
	movne	%xcc,	%i4,	%i5
	movrgz	%g4,	%g5,	%o4
	tge	%xcc,	0x4
	fxnor	%f18,	%f0,	%f4
	tn	%xcc,	0x2
	edge8ln	%i2,	%g7,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x3
	nop
	setx	0xA4B4E120,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xEA3E62AE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f19,	%f10
	fbu	%fcc3,	loop_42
	fnors	%f18,	%f18,	%f15
	tn	%xcc,	0x3
	movrgez	%l1,	%o7,	%i3
loop_42:
	fmovdl	%xcc,	%f26,	%f10
	fbug	%fcc0,	loop_43
	edge16n	%i0,	%g3,	%o0
	fbue	%fcc3,	loop_44
	fmovrsne	%l2,	%f15,	%f15
loop_43:
	fmuld8ulx16	%f30,	%f13,	%f18
	bpos,a,pn	%xcc,	loop_45
loop_44:
	edge32n	%i1,	%l4,	%o3
	andn	%g2,	%o6,	%i6
	xor	%g6,	0x1F2D,	%l6
loop_45:
	bg,a	%icc,	loop_46
	fmovrslez	%o1,	%f1,	%f17
	movvs	%xcc,	%g1,	%l3
	fbg,a	%fcc1,	loop_47
loop_46:
	nop
	fitos	%f5,	%f23
	fstod	%f23,	%f16
	fmovde	%icc,	%f26,	%f0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%o5
loop_47:
	fbo,a	%fcc2,	loop_48
	stbar
	tn	%icc,	0x2
	sra	%o2,	0x0C,	%l0
loop_48:
	xorcc	%i5,	0x036B,	%i4
	ble	%icc,	loop_49
	bgu,a	%icc,	loop_50
	fbule	%fcc3,	loop_51
	tgu	%xcc,	0x0
loop_49:
	edge32l	%g5,	%o4,	%g4
loop_50:
	edge8l	%i2,	%g7,	%l5
loop_51:
	movrne	%l1,	%i3,	%i0
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f20
	nop
	setx	0xF2E4A7D50FD90EB3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x7455029C5F7ED9E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f16,	%f22
	fornot1	%f22,	%f14,	%f4
	add	%l7,	0x74,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g3,	%o7
	bpos,a,pn	%xcc,	loop_52
	ldd	[%l7 + 0x50],	%l2
	edge16ln	%i1,	%l4,	%o0
	fmul8x16	%f26,	%f28,	%f26
loop_52:
	brlez,a	%o3,	loop_53
	tcs	%xcc,	0x4
	movne	%icc,	%g2,	%i6
	fpsub16s	%f16,	%f19,	%f29
loop_53:
	edge16	%g6,	%l6,	%o1
	movgu	%xcc,	%o6,	%l3
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x23] %asi,	%i7
	fba,a	%fcc3,	loop_54
	movrlz	%o5,	0x37D,	%g1
	tle	%icc,	0x6
	st	%f25,	[%l7 + 0x24]
loop_54:
	xorcc	%l0,	0x1A08,	%i5
	fmovsa	%xcc,	%f18,	%f31
	xnorcc	%o2,	%g5,	%o4
	umul	%g4,	0x0AF9,	%i2
	udivx	%i4,	0x1493,	%l5
	udivcc	%l1,	0x0C45,	%g7
	udiv	%i3,	0x156F,	%i0
	movrgez	%g3,	0x1BB,	%o7
	taddcctv	%i1,	%l2,	%l4
	andcc	%o0,	0x1A04,	%g2
	te	%icc,	0x0
	fmovsa	%icc,	%f9,	%f24
	fmovd	%f28,	%f14
	fmovrde	%o3,	%f24,	%f4
	brgez	%i6,	loop_55
	andn	%l6,	0x17A7,	%o1
	edge8ln	%o6,	%l3,	%g6
	edge16n	%o5,	%g1,	%i7
loop_55:
	andncc	%l0,	%o2,	%g5
	umul	%i5,	%o4,	%i2
	orn	%g4,	0x0B62,	%i4
	movleu	%xcc,	%l1,	%g7
	subccc	%l5,	%i0,	%i3
	sub	%o7,	%g3,	%l2
	sth	%i1,	[%l7 + 0x30]
	subccc	%o0,	0x17F6,	%l4
	nop
	setx	0x4E82685B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f31
	wr	%g0,	0x04,	%asi
	sta	%f24,	[%l7 + 0x6C] %asi
	fbg	%fcc3,	loop_56
	array8	%o3,	%g2,	%i6
	std	%f0,	[%l7 + 0x10]
	orcc	%o1,	%o6,	%l3
loop_56:
	andcc	%l6,	%g6,	%o5
	ldx	[%l7 + 0x70],	%i7
	movl	%icc,	%g1,	%l0
	nop
	fitos	%f11,	%f11
	be	%xcc,	loop_57
	fbug	%fcc1,	loop_58
	movrgez	%o2,	0x30A,	%i5
	and	%o4,	0x069C,	%i2
loop_57:
	array16	%g4,	%i4,	%g5
loop_58:
	movn	%xcc,	%g7,	%l1
	tcc	%icc,	0x3
	edge16n	%i0,	%i3,	%l5
	ta	%icc,	0x1
	fandnot2s	%f25,	%f16,	%f25
	fmovdge	%xcc,	%f29,	%f23
	set	0x7C, %o3
	lda	[%l7 + %o3] 0x04,	%f6
	movrgz	%o7,	%g3,	%l2
	sllx	%i1,	%l4,	%o0
	movrne	%g2,	0x393,	%o3
	lduw	[%l7 + 0x2C],	%i6
	smul	%o1,	%o6,	%l6
	edge16n	%l3,	%o5,	%i7
	ta	%xcc,	0x1
	srax	%g1,	0x09,	%l0
	wr	%g0,	0x11,	%asi
	stha	%g6,	[%l7 + 0x2E] %asi
	nop
	setx	0x9D5A0C2A73F2E3D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f24
	tcs	%icc,	0x7
	ta	%xcc,	0x0
	movn	%xcc,	%i5,	%o4
	mulx	%i2,	%g4,	%i4
	sdivcc	%o2,	0x0D57,	%g7
	movrne	%l1,	%g5,	%i3
	flush	%l7 + 0x1C
	fsrc1	%f4,	%f28
	array32	%i0,	%l5,	%g3
	fmovd	%f8,	%f20
	flush	%l7 + 0x78
	tleu	%icc,	0x5
	fbue,a	%fcc3,	loop_59
	edge32n	%l2,	%i1,	%o7
	addccc	%l4,	%g2,	%o3
	edge16ln	%o0,	%i6,	%o6
loop_59:
	bvc,a,pn	%xcc,	loop_60
	orcc	%o1,	%l3,	%o5
	bcs	%xcc,	loop_61
	edge32n	%l6,	%i7,	%l0
loop_60:
	orn	%g6,	0x1E87,	%i5
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x08] %asi,	%f25
loop_61:
	bleu,a	loop_62
	popc	%g1,	%o4
	fmovrdgez	%i2,	%f4,	%f20
	and	%g4,	%o2,	%g7
loop_62:
	sra	%l1,	0x08,	%i4
	edge32l	%g5,	%i3,	%l5
	fnot1	%f10,	%f10
	fand	%f12,	%f8,	%f30
	tn	%xcc,	0x7
	fblg	%fcc3,	loop_63
	movge	%xcc,	%g3,	%l2
	umul	%i0,	0x1B98,	%o7
	fbe	%fcc2,	loop_64
loop_63:
	fmovsl	%xcc,	%f23,	%f17
	brz,a	%i1,	loop_65
	ldsb	[%l7 + 0x55],	%l4
loop_64:
	andcc	%o3,	0x00E4,	%o0
	fmovrsgez	%g2,	%f28,	%f29
loop_65:
	mulscc	%i6,	%o6,	%o1
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x50] %asi,	%l2
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o5
	tsubcctv	%i7,	0x1DD3,	%l0
	set	0x73, %l6
	lduba	[%l7 + %l6] 0x80,	%l6
	movl	%icc,	%g6,	%i5
	movneg	%icc,	%o4,	%g1
	nop
	setx	0x4B926174,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f3
	movrlez	%g4,	%o2,	%i2
	nop
	setx	0x6EDF4497,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x7AC5AB92,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f13,	%f14
	bcc,a	%icc,	loop_66
	bgu,a,pn	%xcc,	loop_67
	ldstub	[%l7 + 0x24],	%l1
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i4
loop_66:
	xorcc	%g5,	0x1997,	%g7
loop_67:
	bl,pt	%xcc,	loop_68
	tg	%xcc,	0x0
	sra	%i3,	0x13,	%l5
	alignaddrl	%l2,	%g3,	%o7
loop_68:
	fmovrsgz	%i1,	%f1,	%f15
	fbe,a	%fcc2,	loop_69
	tgu	%icc,	0x7
	set	0x60, %l3
	lduwa	[%l7 + %l3] 0x89,	%i0
loop_69:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%o0
	mova	%xcc,	%l4,	%i6
	edge32n	%g2,	%o1,	%o6
	xor	%l3,	%o5,	%l0
	edge8	%l6,	%g6,	%i7
	nop
	setx	0x381BEBB760644CAA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	movrne	%i5,	0x22F,	%g1
	udivx	%g4,	0x1B67,	%o4
	tvs	%xcc,	0x6
	stbar
	subc	%o2,	0x15F0,	%l1
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x15,	 0x1
	array32	%g5,	%i2,	%i3
	popc	%g7,	%l5
	tcs	%xcc,	0x6
	fbule,a	%fcc0,	loop_70
	tne	%icc,	0x6
	movvs	%xcc,	%l2,	%o7
	movrlez	%i1,	0x0C0,	%i0
loop_70:
	movneg	%xcc,	%o3,	%o0
	udivx	%l4,	0x0128,	%i6
	xorcc	%g2,	%g3,	%o1
	edge8	%l3,	%o6,	%l0
	edge8l	%o5,	%g6,	%i7
	fnot1s	%f21,	%f9
	orncc	%i5,	0x0F84,	%g1
	smulcc	%l6,	0x0B26,	%o4
	nop
	fitos	%f20,	%f10
	fmovrsne	%g4,	%f6,	%f29
	sethi	0x1079,	%l1
	fnor	%f24,	%f20,	%f20
	sra	%i4,	%o2,	%i2
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x7E] %asi,	%i3
	movvs	%icc,	%g5,	%l5
	mova	%xcc,	%g7,	%o7
	fmovsvc	%xcc,	%f31,	%f5
	sethi	0x1D83,	%i1
	bn	loop_71
	edge8l	%l2,	%i0,	%o3
	bn,pt	%icc,	loop_72
	fble	%fcc2,	loop_73
loop_71:
	nop
	fitod	%f12,	%f28
	fdtoi	%f28,	%f13
	edge16l	%l4,	%o0,	%g2
loop_72:
	fpmerge	%f7,	%f10,	%f8
loop_73:
	edge16n	%i6,	%o1,	%l3
	nop
	fitod	%f2,	%f22
	fdtos	%f22,	%f31
	ble,pn	%xcc,	loop_74
	and	%o6,	0x1D9F,	%l0
	fnands	%f4,	%f3,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74:
	nop
	fitod	%f0,	%f22
	subcc	%g3,	%o5,	%i7
	ba,pn	%icc,	loop_75
	andncc	%g6,	%g1,	%i5
	fcmpgt32	%f2,	%f18,	%l6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x66] %asi,	%g4
loop_75:
	array32	%l1,	%o4,	%o2
	fbl	%fcc0,	loop_76
	be,a,pn	%xcc,	loop_77
	nop
	setx	loop_78,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%xcc,	0x4
loop_76:
	andcc	%i4,	%i3,	%i2
loop_77:
	edge16	%g5,	%g7,	%o7
loop_78:
	edge32ln	%l5,	%l2,	%i0
	movvs	%icc,	%o3,	%l4
	edge8n	%i1,	%g2,	%o0
	orn	%i6,	%o1,	%l3
	orcc	%o6,	%g3,	%l0
	movrgz	%o5,	0x0C1,	%i7
	fmovdneg	%xcc,	%f6,	%f7
	edge8l	%g6,	%i5,	%l6
	wr	%g0,	0x81,	%asi
	stha	%g4,	[%l7 + 0x12] %asi
	udivcc	%l1,	0x0282,	%g1
	fmovrdlz	%o2,	%f12,	%f10
	fmul8sux16	%f24,	%f10,	%f12
	udivx	%i4,	0x0B16,	%i3
	fbge,a	%fcc1,	loop_79
	tl	%xcc,	0x7
	tle	%icc,	0x0
	fmovs	%f26,	%f20
loop_79:
	movge	%icc,	%o4,	%g5
	edge32	%g7,	%i2,	%o7
	nop
	setx	0x7E028383607A2659,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	movrgez	%l5,	0x0C6,	%i0
	fbue,a	%fcc0,	loop_80
	tg	%xcc,	0x3
	add	%l2,	%o3,	%l4
	mulx	%g2,	%i1,	%i6
loop_80:
	movrne	%o0,	%o1,	%l3
	fpadd16s	%f6,	%f30,	%f30
	nop
	setx	loop_81,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvc,a,pn	%xcc,	loop_82
	mulscc	%g3,	%l0,	%o6
	tcs	%icc,	0x0
loop_81:
	fmuld8sux16	%f27,	%f1,	%f12
loop_82:
	fmovdcs	%xcc,	%f0,	%f3
	sdivcc	%i7,	0x16AF,	%g6
	bcc,a	%xcc,	loop_83
	edge32	%i5,	%o5,	%g4
	fbug,a	%fcc3,	loop_84
	fnor	%f6,	%f26,	%f24
loop_83:
	be	%icc,	loop_85
	fbne,a	%fcc2,	loop_86
loop_84:
	orcc	%l6,	%g1,	%o2
	movvc	%xcc,	%l1,	%i4
loop_85:
	bleu,a,pt	%xcc,	loop_87
loop_86:
	or	%i3,	%g5,	%o4
	fmovrdlez	%g7,	%f2,	%f10
	fmovsvs	%xcc,	%f23,	%f8
loop_87:
	nop
	set	0x7A, %l2
	stha	%i2,	[%l7 + %l2] 0xea
	membar	#Sync
	subc	%l5,	%i0,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o3,	0x160D,	%l2
	sll	%g2,	0x1C,	%l4
	movn	%icc,	%i1,	%i6
	sub	%o1,	%o0,	%g3
	fmul8x16au	%f21,	%f6,	%f18
	edge8	%l0,	%o6,	%l3
	brnz	%i7,	loop_88
	fcmpgt16	%f22,	%f26,	%i5
	fpadd16s	%f19,	%f2,	%f10
	tne	%icc,	0x0
loop_88:
	movneg	%xcc,	%o5,	%g6
	st	%f18,	[%l7 + 0x68]
	edge8l	%l6,	%g1,	%g4
	movge	%icc,	%l1,	%i4
	fba,a	%fcc0,	loop_89
	array16	%o2,	%i3,	%g5
	movvs	%icc,	%g7,	%i2
	fmovrdlez	%l5,	%f18,	%f12
loop_89:
	orcc	%o4,	%o7,	%o3
	fmovsneg	%xcc,	%f19,	%f11
	movn	%xcc,	%l2,	%g2
	fbne	%fcc3,	loop_90
	fandnot1s	%f20,	%f2,	%f19
	fmovsl	%xcc,	%f12,	%f12
	nop
	fitos	%f12,	%f6
loop_90:
	fbo	%fcc0,	loop_91
	fsrc1s	%f24,	%f6
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f8
	orcc	%l4,	%i1,	%i0
loop_91:
	edge16ln	%o1,	%i6,	%o0
	tgu	%icc,	0x6
	edge8ln	%g3,	%l0,	%l3
	and	%i7,	0x0616,	%i5
	movg	%icc,	%o6,	%o5
	fcmple32	%f20,	%f26,	%g6
	tgu	%xcc,	0x1
	sra	%l6,	%g4,	%l1
	tpos	%xcc,	0x7
	fmovdpos	%icc,	%f13,	%f24
	fmovrdlez	%i4,	%f18,	%f20
	tneg	%xcc,	0x6
	subccc	%o2,	%i3,	%g1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g5,	%g7
	fmuld8ulx16	%f2,	%f17,	%f22
	taddcc	%i2,	0x0CFF,	%l5
	bleu,pn	%xcc,	loop_92
	flush	%l7 + 0x74
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x81,	%f16
loop_92:
	movrlz	%o7,	0x2DF,	%o4
	movleu	%icc,	%l2,	%o3
	be,pt	%icc,	loop_93
	ld	[%l7 + 0x3C],	%f6
	fmovdvs	%xcc,	%f28,	%f0
	orncc	%l4,	0x0EC4,	%i1
loop_93:
	sub	%g2,	%o1,	%i0
	nop
	setx	0xF509B17E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xC124557E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f23,	%f6
	nop
	setx	0x6F35A968AC56DA47,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xDB17B97318E81934,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f22,	%f14
	edge32n	%i6,	%o0,	%l0
	nop
	setx	0xF1FEDD139E64821D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x53320E05917D4495,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f30,	%f30
	ldsh	[%l7 + 0x68],	%g3
	ta	%xcc,	0x1
	taddcctv	%i7,	%l3,	%i5
	fbg,a	%fcc1,	loop_94
	tgu	%xcc,	0x3
	movle	%xcc,	%o6,	%g6
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x34] %asi,	%f19
loop_94:
	fbg	%fcc0,	loop_95
	ldx	[%l7 + 0x78],	%l6
	orn	%o5,	0x08CF,	%g4
	fcmple16	%f12,	%f4,	%l1
loop_95:
	mulx	%o2,	%i4,	%i3
	addcc	%g5,	%g7,	%i2
	nop
	setx	loop_96,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%l5,	%g1,	%o7
	subcc	%o4,	%o3,	%l2
	edge32n	%i1,	%l4,	%g2
loop_96:
	fmovrdlez	%o1,	%f30,	%f8
	wr	%g0,	0x0c,	%asi
	stwa	%i0,	[%l7 + 0x30] %asi
	edge8l	%o0,	%l0,	%i6
	lduh	[%l7 + 0x08],	%i7
	andn	%l3,	%g3,	%i5
	fbul	%fcc2,	loop_97
	andn	%g6,	%o6,	%l6
	tle	%xcc,	0x2
	andn	%g4,	%o5,	%o2
loop_97:
	fnot1	%f16,	%f4
	fsrc2s	%f31,	%f19
	movvc	%icc,	%i4,	%l1
	fbe,a	%fcc0,	loop_98
	edge16ln	%g5,	%i3,	%i2
	fbue	%fcc3,	loop_99
	orcc	%g7,	%g1,	%l5
loop_98:
	addcc	%o7,	%o4,	%o3
	edge16	%i1,	%l2,	%g2
loop_99:
	ldsh	[%l7 + 0x70],	%o1
	fbuge	%fcc0,	loop_100
	add	%i0,	0x18E6,	%o0
	xnor	%l4,	%i6,	%i7
	st	%f23,	[%l7 + 0x48]
loop_100:
	bl	%icc,	loop_101
	udivx	%l0,	0x1D1C,	%g3
	movrlez	%i5,	%l3,	%o6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x54] %asi,	%l6
loop_101:
	tsubcctv	%g6,	%g4,	%o2
	ldx	[%l7 + 0x30],	%o5
	orn	%l1,	0x1C14,	%g5
	pdist	%f6,	%f14,	%f30
	movre	%i4,	0x3BA,	%i2
	fbl,a	%fcc2,	loop_102
	movl	%icc,	%i3,	%g1
	movrgz	%g7,	0x227,	%l5
	mulscc	%o7,	%o3,	%i1
loop_102:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x24] %asi,	%f6
	sllx	%o4,	%l2,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%i0,	loop_103
	movrne	%o0,	%l4,	%i6
	ldub	[%l7 + 0x5D],	%i7
	sllx	%l0,	%g3,	%o1
loop_103:
	fbu	%fcc1,	loop_104
	andn	%i5,	0x02F2,	%o6
	tpos	%xcc,	0x3
	movleu	%icc,	%l3,	%l6
loop_104:
	umul	%g6,	%g4,	%o5
	lduw	[%l7 + 0x18],	%o2
	or	%l1,	0x10A9,	%i4
	orcc	%i2,	0x0EED,	%g5
	array16	%g1,	%g7,	%l5
	edge32n	%o7,	%i3,	%o3
	edge16n	%i1,	%l2,	%g2
	edge16	%o4,	%o0,	%i0
	bneg,a	%xcc,	loop_105
	add	%i6,	%l4,	%i7
	alignaddr	%g3,	%l0,	%i5
	edge32	%o1,	%l3,	%l6
loop_105:
	fandnot2	%f10,	%f6,	%f4
	tleu	%xcc,	0x6
	prefetch	[%l7 + 0x24],	 0x3
	fmul8sux16	%f26,	%f28,	%f4
	fcmpgt16	%f4,	%f12,	%g6
	prefetch	[%l7 + 0x64],	 0x1
	sethi	0x1431,	%o6
	fmovrsne	%g4,	%f30,	%f15
	move	%xcc,	%o2,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x0
	fbue,a	%fcc2,	loop_106
	nop
	setx	0x306AD957,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fcmple32	%f4,	%f2,	%i4
	edge16n	%l1,	%g5,	%i2
loop_106:
	nop
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%g7
	fmovse	%icc,	%f21,	%f0
	edge32l	%g1,	%o7,	%i3
	bn,a,pn	%icc,	loop_107
	movne	%xcc,	%l5,	%o3
	movrne	%l2,	%g2,	%i1
	nop
	setx	0xDEC30DA5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f7
loop_107:
	movneg	%icc,	%o0,	%o4
	wr	%g0,	0x2b,	%asi
	stha	%i6,	[%l7 + 0x38] %asi
	membar	#Sync
	tpos	%icc,	0x5
	edge32n	%l4,	%i0,	%g3
	movcs	%icc,	%l0,	%i7
	stb	%i5,	[%l7 + 0x57]
	fbo	%fcc1,	loop_108
	udivx	%l3,	0x1A73,	%o1
	array16	%g6,	%o6,	%l6
	brlez	%o2,	loop_109
loop_108:
	smulcc	%g4,	%o5,	%i4
	umulcc	%l1,	%g5,	%i2
	fmovdvc	%xcc,	%f18,	%f23
loop_109:
	fmovdn	%xcc,	%f3,	%f8
	edge8ln	%g1,	%o7,	%g7
	edge8l	%l5,	%i3,	%o3
	alignaddr	%l2,	%g2,	%i1
	tvc	%xcc,	0x3
	fcmpgt32	%f0,	%f24,	%o4
	subccc	%i6,	0x0D68,	%o0
	movle	%icc,	%i0,	%g3
	movg	%xcc,	%l4,	%i7
	umulcc	%l0,	0x052E,	%i5
	fmovs	%f16,	%f14
	mulscc	%l3,	%o1,	%g6
	xnor	%o6,	%l6,	%o2
	fpsub32s	%f24,	%f25,	%f4
	bvs,a	loop_110
	xorcc	%g4,	0x151B,	%i4
	edge32l	%o5,	%g5,	%l1
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_110:
	edge16l	%i2,	%o7,	%g1
	andncc	%g7,	%i3,	%l5
	movleu	%icc,	%o3,	%l2
	fmul8x16al	%f10,	%f4,	%f22
	movcc	%icc,	%g2,	%o4
	or	%i6,	0x152E,	%o0
	tvc	%icc,	0x3
	udiv	%i0,	0x1127,	%i1
	fbne,a	%fcc3,	loop_111
	fpadd16	%f28,	%f28,	%f22
	nop
	setx	0x4056B3BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	tn	%xcc,	0x0
loop_111:
	sth	%l4,	[%l7 + 0x30]
	add	%g3,	0x04A2,	%l0
	andn	%i5,	0x118D,	%i7
	sir	0x0AFE
	taddcc	%o1,	0x117C,	%g6
	movne	%xcc,	%l3,	%l6
	movrlez	%o2,	0x21C,	%g4
	fmovsl	%xcc,	%f21,	%f5
	tl	%icc,	0x3
	fmovdle	%xcc,	%f2,	%f10
	edge8ln	%o6,	%i4,	%o5
	tcc	%icc,	0x7
	lduw	[%l7 + 0x30],	%g5
	set	0x40, %g6
	lda	[%l7 + %g6] 0x11,	%f29
	fmovdvc	%icc,	%f6,	%f25
	swap	[%l7 + 0x68],	%i2
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x11,	%l0
	subcc	%g1,	%o7,	%g7
	fcmpgt32	%f0,	%f0,	%i3
	nop
	fitos	%f8,	%f19
	fstoi	%f19,	%f3
	smul	%o3,	%l2,	%l5
	movneg	%xcc,	%o4,	%i6
	nop
	fitos	%f13,	%f25
	fstox	%f25,	%f16
	fxtos	%f16,	%f30
	nop
	set	0x28, %o4
	stw	%g2,	[%l7 + %o4]
	mulscc	%o0,	%i1,	%i0
	edge16ln	%g3,	%l4,	%i5
	ble,a	%icc,	loop_112
	fpsub32s	%f6,	%f23,	%f27
	smul	%i7,	0x1D64,	%l0
	udivcc	%g6,	0x1D24,	%l3
loop_112:
	nop
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l6
	edge8n	%o1,	%g4,	%o6
	tvc	%xcc,	0x2
	movrlz	%i4,	0x245,	%o5
	movgu	%icc,	%o2,	%g5
	movl	%icc,	%l1,	%g1
	fornot2s	%f24,	%f3,	%f17
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x19,	%f0
	edge8ln	%i2,	%o7,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x0F] %asi,	%i3
	edge16l	%o3,	%l2,	%o4
	sethi	0x11A2,	%l5
	fnors	%f18,	%f12,	%f9
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g2
	fmovda	%xcc,	%f27,	%f21
	edge8	%o0,	%i6,	%i0
	fmovdn	%xcc,	%f7,	%f22
	movre	%g3,	0x3C6,	%i1
	edge16l	%l4,	%i7,	%i5
	sir	0x0569
	addcc	%l0,	%g6,	%l3
	fblg	%fcc0,	loop_113
	udivx	%l6,	0x1E34,	%g4
	xnor	%o6,	%o1,	%i4
	addc	%o2,	0x0EF7,	%o5
loop_113:
	sdivx	%l1,	0x0FD5,	%g5
	mulscc	%i2,	0x0F78,	%g1
	tl	%icc,	0x1
	or	%g7,	%i3,	%o3
	movneg	%xcc,	%o7,	%o4
	alignaddr	%l5,	%g2,	%o0
	nop
	setx	0xA6E604FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f16
	sdivx	%l2,	0x1654,	%i6
	edge16l	%i0,	%i1,	%g3
	tgu	%xcc,	0x7
	taddcctv	%i7,	%i5,	%l0
	sll	%g6,	0x12,	%l4
	call	loop_114
	or	%l3,	%l6,	%o6
	array32	%o1,	%i4,	%o2
	tleu	%xcc,	0x0
loop_114:
	mulscc	%o5,	0x12C6,	%l1
	smulcc	%g4,	0x1B6E,	%g5
	array32	%i2,	%g7,	%i3
	sllx	%o3,	%g1,	%o4
	fone	%f14
	tleu	%icc,	0x7
	udiv	%l5,	0x17F6,	%o7
	taddcc	%o0,	%l2,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%i0,	%i6
	tl	%xcc,	0x4
	fbule	%fcc1,	loop_115
	umulcc	%i1,	%i7,	%g3
	fbe	%fcc3,	loop_116
	fsrc2s	%f8,	%f0
loop_115:
	taddcc	%i5,	%g6,	%l4
	xnorcc	%l0,	%l3,	%l6
loop_116:
	fmovdle	%icc,	%f18,	%f29
	sdivcc	%o1,	0x1650,	%i4
	edge32ln	%o2,	%o5,	%l1
	faligndata	%f4,	%f6,	%f4
	fmovdl	%xcc,	%f6,	%f20
	fandnot1s	%f23,	%f27,	%f2
	tvc	%xcc,	0x5
	set	0x0C, %g5
	lda	[%l7 + %g5] 0x81,	%f8
	tneg	%icc,	0x2
	sllx	%o6,	0x10,	%g4
	addc	%i2,	%g7,	%g5
	fcmpgt32	%f26,	%f16,	%i3
	subcc	%o3,	%g1,	%l5
	array32	%o7,	%o4,	%o0
	tneg	%icc,	0x6
	tgu	%xcc,	0x7
	fmul8ulx16	%f2,	%f22,	%f12
	movvc	%xcc,	%g2,	%i0
	srl	%i6,	%l2,	%i1
	fmul8x16al	%f12,	%f29,	%f4
	mulx	%i7,	%i5,	%g3
	brgz,a	%l4,	loop_117
	movge	%icc,	%l0,	%g6
	sdiv	%l6,	0x10FD,	%l3
	nop
	set	0x50, %g3
	stw	%o1,	[%l7 + %g3]
loop_117:
	tn	%icc,	0x2
	tne	%xcc,	0x4
	movrgz	%i4,	0x2EB,	%o5
	tl	%icc,	0x0
	fnot2s	%f30,	%f1
	tvc	%icc,	0x1
	for	%f24,	%f16,	%f18
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x5A] %asi,	%l1
	fbg,a	%fcc2,	loop_118
	array8	%o2,	%g4,	%i2
	movn	%xcc,	%g7,	%o6
	sll	%g5,	0x0C,	%o3
loop_118:
	mova	%xcc,	%i3,	%l5
	xorcc	%o7,	%g1,	%o0
	addcc	%o4,	%g2,	%i0
	fmovrslz	%i6,	%f23,	%f23
	taddcctv	%i1,	0x02F6,	%l2
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x3A] %asi,	%i7
	fbug	%fcc2,	loop_119
	array16	%g3,	%l4,	%l0
	fbue	%fcc0,	loop_120
	movvs	%xcc,	%i5,	%l6
loop_119:
	mova	%icc,	%l3,	%o1
	andcc	%i4,	0x0DBB,	%o5
loop_120:
	nop
	set	0x08, %l5
	stx	%g6,	[%l7 + %l5]
	udivcc	%l1,	0x111E,	%o2
	sth	%g4,	[%l7 + 0x0A]
	movvs	%icc,	%g7,	%o6
	tcs	%icc,	0x5
	and	%i2,	0x00BB,	%g5
	fmovrsgez	%o3,	%f5,	%f6
	fone	%f8
	srax	%i3,	0x09,	%l5
	wr	%g0,	0x18,	%asi
	stxa	%g1,	[%l7 + 0x30] %asi
	fmovsneg	%xcc,	%f19,	%f27
	te	%icc,	0x7
	nop
	setx	0x0FE85D0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xC05242F1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f25,	%f2
	fbue	%fcc2,	loop_121
	edge8	%o0,	%o7,	%g2
	movl	%icc,	%o4,	%i0
	fand	%f28,	%f18,	%f18
loop_121:
	orcc	%i1,	%i6,	%l2
	sdivx	%g3,	0x1569,	%l4
	fcmpne16	%f18,	%f24,	%i7
	fmovse	%xcc,	%f7,	%f12
	nop
	setx	0xE056258E,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	tgu	%icc,	0x7
	ta	%icc,	0x5
	movrlez	%i5,	%l6,	%l3
	andncc	%o1,	%i4,	%o5
	taddcc	%g6,	0x0175,	%l0
	tcc	%xcc,	0x3
	fzeros	%f30
	udiv	%l1,	0x1452,	%g4
	fpadd32s	%f1,	%f17,	%f4
	stx	%o2,	[%l7 + 0x30]
	xnorcc	%g7,	0x1C93,	%i2
	sth	%g5,	[%l7 + 0x6E]
	fmovdcs	%xcc,	%f7,	%f28
	addccc	%o3,	0x1AEC,	%i3
	fmovsa	%icc,	%f28,	%f3
	fmovrsgez	%l5,	%f11,	%f2
	xorcc	%g1,	%o6,	%o7
	fandnot2s	%f2,	%f31,	%f23
	xnor	%o0,	%o4,	%i0
	movg	%icc,	%g2,	%i6
	movn	%icc,	%l2,	%g3
	xnor	%l4,	0x0AD7,	%i1
	fmul8x16	%f3,	%f14,	%f12
	tle	%icc,	0x6
	sll	%i7,	%l6,	%i5
	orncc	%o1,	%i4,	%l3
	movneg	%icc,	%o5,	%l0
	fcmple32	%f8,	%f26,	%g6
	bge,pt	%icc,	loop_122
	tpos	%icc,	0x0
	movne	%icc,	%l1,	%g4
	edge8	%g7,	%i2,	%g5
loop_122:
	movrlez	%o2,	0x1DA,	%o3
	movleu	%icc,	%i3,	%l5
	fmovscs	%xcc,	%f11,	%f16
	taddcc	%g1,	0x0F18,	%o7
	movgu	%icc,	%o0,	%o6
	umul	%o4,	0x07AF,	%g2
	movcs	%icc,	%i0,	%i6
	array32	%g3,	%l2,	%l4
	set	0x49, %o5
	ldstuba	[%l7 + %o5] 0x18,	%i7
	tg	%icc,	0x2
	stbar
	movleu	%icc,	%l6,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i5,	%o1,	%i4
	fmovsleu	%xcc,	%f17,	%f9
	nop
	setx	loop_123,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdpos	%icc,	%f15,	%f14
	xorcc	%o5,	%l3,	%l0
	fmovrsgz	%g6,	%f31,	%f25
loop_123:
	fmovsn	%icc,	%f14,	%f18
	popc	0x028C,	%g4
	fors	%f24,	%f2,	%f26
	tne	%icc,	0x0
	brgez,a	%g7,	loop_124
	movn	%icc,	%l1,	%i2
	bge,a	%xcc,	loop_125
	fone	%f24
loop_124:
	popc	%o2,	%g5
	edge16l	%o3,	%l5,	%g1
loop_125:
	bneg,a,pt	%icc,	loop_126
	tl	%xcc,	0x2
	orcc	%o7,	0x05A9,	%i3
	bn,a,pn	%icc,	loop_127
loop_126:
	fabss	%f21,	%f20
	movle	%xcc,	%o0,	%o6
	fpsub32s	%f28,	%f1,	%f10
loop_127:
	movge	%icc,	%g2,	%o4
	movre	%i6,	0x086,	%g3
	movre	%l2,	0x2EF,	%l4
	edge16ln	%i7,	%l6,	%i1
	udivcc	%i0,	0x00DA,	%i5
	sdivx	%i4,	0x06CB,	%o1
	fnot2s	%f25,	%f14
	edge16ln	%l3,	%o5,	%l0
	alignaddrl	%g4,	%g7,	%l1
	subc	%i2,	%g6,	%o2
	smulcc	%o3,	0x0F26,	%l5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%g1
	tne	%icc,	0x3
	fmovsleu	%xcc,	%f30,	%f8
	orncc	%i3,	0x0DA7,	%o0
	subcc	%o6,	0x12E5,	%o7
	prefetch	[%l7 + 0x5C],	 0x0
	fbl,a	%fcc0,	loop_128
	fmovrde	%o4,	%f20,	%f16
	umul	%i6,	%g3,	%l2
	fandnot1	%f10,	%f4,	%f14
loop_128:
	movleu	%icc,	%g2,	%l4
	ldd	[%l7 + 0x38],	%f30
	fnands	%f16,	%f29,	%f13
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge,a	%fcc2,	loop_129
	udiv	%i7,	0x13B9,	%i1
	sth	%i0,	[%l7 + 0x14]
	fba,a	%fcc3,	loop_130
loop_129:
	taddcctv	%l6,	0x02AF,	%i4
	movrgz	%o1,	%l3,	%o5
	movre	%l0,	0x2EE,	%i5
loop_130:
	brgez,a	%g4,	loop_131
	lduh	[%l7 + 0x28],	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x18, %g2
	sth	%i2,	[%l7 + %g2]
loop_131:
	edge8l	%g7,	%g6,	%o2
	array16	%l5,	%g5,	%g1
	fnand	%f30,	%f2,	%f2
	fmovdpos	%xcc,	%f4,	%f30
	xor	%i3,	0x1654,	%o0
	ld	[%l7 + 0x34],	%f19
	sllx	%o6,	0x1A,	%o7
	ldsb	[%l7 + 0x43],	%o3
	smul	%o4,	%g3,	%i6
	faligndata	%f2,	%f18,	%f24
	fmovrdgz	%l2,	%f6,	%f6
	bl,a,pn	%icc,	loop_132
	xorcc	%g2,	0x033E,	%i7
	fmovrse	%i1,	%f10,	%f4
	fblg	%fcc0,	loop_133
loop_132:
	fandnot2s	%f10,	%f10,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%l4,	%l6
loop_133:
	fbge,a	%fcc1,	loop_134
	edge16l	%i0,	%i4,	%l3
	tle	%icc,	0x5
	addccc	%o5,	0x0A56,	%l0
loop_134:
	tl	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i5,	%g4,	%o1
	fzero	%f18
	fmovse	%icc,	%f0,	%f7
	orcc	%i2,	0x12CC,	%l1
	fpadd16s	%f10,	%f24,	%f18
	srl	%g7,	0x11,	%g6
	move	%xcc,	%l5,	%o2
	fnor	%f18,	%f0,	%f16
	fbo	%fcc2,	loop_135
	fbue	%fcc0,	loop_136
	movl	%icc,	%g1,	%g5
	addcc	%o0,	0x1056,	%o6
loop_135:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i3
loop_136:
	taddcc	%o3,	0x130D,	%o4
	fmovsgu	%xcc,	%f23,	%f0
	xnorcc	%o7,	0x085D,	%i6
	fbu,a	%fcc2,	loop_137
	addcc	%g3,	%g2,	%i7
	fmovdpos	%xcc,	%f24,	%f2
	movneg	%xcc,	%l2,	%l4
loop_137:
	fmovdl	%icc,	%f19,	%f31
	stb	%i1,	[%l7 + 0x57]
	sdivcc	%l6,	0x1D90,	%i4
	alignaddr	%l3,	%i0,	%o5
	nop
	setx	0xEE3F6294,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xEA8A1E23,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f20,	%f13
	bleu,a,pn	%xcc,	loop_138
	xorcc	%l0,	0x1AEF,	%i5
	udivcc	%o1,	0x03E7,	%i2
	fpsub16s	%f5,	%f15,	%f19
loop_138:
	nop
	fitos	%f14,	%f25
	ldsw	[%l7 + 0x14],	%g4
	fmovrse	%g7,	%f4,	%f17
	edge8ln	%g6,	%l1,	%o2
	tpos	%icc,	0x1
	wr	%g0,	0x04,	%asi
	stba	%g1,	[%l7 + 0x33] %asi
	tpos	%xcc,	0x0
	ldx	[%l7 + 0x38],	%l5
	srax	%g5,	%o0,	%i3
	membar	0x58
	fcmpeq32	%f30,	%f10,	%o3
	set	0x55, %i6
	ldsba	[%l7 + %i6] 0x11,	%o6
	brgz,a	%o7,	loop_139
	bn,a	%icc,	loop_140
	bcc,pn	%icc,	loop_141
	array8	%i6,	%o4,	%g3
loop_139:
	sdiv	%g2,	0x0DE3,	%l2
loop_140:
	movvs	%icc,	%i7,	%i1
loop_141:
	fsrc1	%f24,	%f18
	sth	%l6,	[%l7 + 0x54]
	and	%l4,	0x0039,	%i4
	brnz,a	%i0,	loop_142
	ldd	[%l7 + 0x18],	%f8
	sllx	%l3,	0x18,	%l0
	bn,pt	%icc,	loop_143
loop_142:
	te	%icc,	0x6
	taddcc	%i5,	%o1,	%o5
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
loop_143:
	movgu	%icc,	%i2,	%g6
	tvc	%xcc,	0x5
	nop
	set	0x08, %o6
	stx	%l1,	[%l7 + %o6]
	sdivcc	%g7,	0x1BBB,	%g1
	brlez,a	%l5,	loop_144
	membar	0x1C
	faligndata	%f10,	%f28,	%f24
	mulscc	%g5,	0x1674,	%o0
loop_144:
	for	%f4,	%f28,	%f16
	movl	%icc,	%o2,	%o3
	fands	%f5,	%f10,	%f1
	stb	%i3,	[%l7 + 0x33]
	edge8n	%o6,	%i6,	%o4
	movcc	%icc,	%o7,	%g2
	taddcc	%g3,	%i7,	%l2
	udivx	%l6,	0x1334,	%l4
	fandnot2	%f24,	%f16,	%f30
	bneg,a,pt	%icc,	loop_145
	smul	%i4,	0x16C8,	%i1
	fcmpeq32	%f14,	%f30,	%i0
	sdiv	%l0,	0x09DD,	%l3
loop_145:
	edge32ln	%o1,	%i5,	%g4
	brnz	%o5,	loop_146
	fmovdle	%icc,	%f10,	%f5
	movge	%icc,	%i2,	%g6
	movpos	%xcc,	%g7,	%g1
loop_146:
	mova	%xcc,	%l1,	%g5
	fmul8x16al	%f17,	%f3,	%f20
	addccc	%o0,	%l5,	%o3
	tl	%icc,	0x2
	set	0x12, %i0
	ldsba	[%l7 + %i0] 0x15,	%i3
	fble,a	%fcc3,	loop_147
	edge16ln	%o6,	%i6,	%o4
	bl,a	loop_148
	call	loop_149
loop_147:
	tleu	%xcc,	0x2
	flush	%l7 + 0x68
loop_148:
	sdivcc	%o7,	0x0A0D,	%o2
loop_149:
	alignaddr	%g3,	%g2,	%l2
	set	0x40, %i5
	lduwa	[%l7 + %i5] 0x81,	%l6
	sethi	0x050D,	%i7
	set	0x2C, %i2
	lda	[%l7 + %i2] 0x14,	%f14
	fmovdneg	%icc,	%f13,	%f30
	edge8	%i4,	%i1,	%l4
	for	%f8,	%f28,	%f2
	tg	%xcc,	0x7
	fpadd32	%f22,	%f2,	%f24
	tg	%icc,	0x5
	orn	%l0,	0x13BE,	%i0
	fmovdl	%xcc,	%f26,	%f0
	ldstub	[%l7 + 0x2C],	%o1
	movpos	%icc,	%i5,	%g4
	fmovsa	%xcc,	%f0,	%f1
	ldsh	[%l7 + 0x2E],	%l3
	fsrc2s	%f18,	%f4
	fmovrslz	%i2,	%f8,	%f14
	add	%g6,	0x13D8,	%o5
	ld	[%l7 + 0x10],	%f0
	fandnot2	%f18,	%f10,	%f4
	edge32l	%g1,	%g7,	%l1
	edge16l	%g5,	%l5,	%o3
	movl	%xcc,	%o0,	%i3
	orncc	%i6,	0x1124,	%o4
	orncc	%o7,	%o2,	%o6
	brgz,a	%g2,	loop_150
	brnz,a	%l2,	loop_151
	fbe	%fcc1,	loop_152
	st	%f9,	[%l7 + 0x40]
loop_150:
	smul	%g3,	0x06DD,	%l6
loop_151:
	tn	%icc,	0x0
loop_152:
	orncc	%i4,	0x1D7F,	%i7
	fmovd	%f24,	%f6
	edge8n	%l4,	%i1,	%i0
	nop
	fitos	%f7,	%f6
	fstoi	%f6,	%f28
	addc	%o1,	%l0,	%i5
	fmovsvc	%icc,	%f18,	%f22
	andn	%g4,	%i2,	%l3
	movge	%icc,	%g6,	%o5
	fmul8x16	%f10,	%f12,	%f12
	orcc	%g7,	%g1,	%l1
	fcmpgt32	%f0,	%f0,	%g5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
	stb	%o0,	[%l7 + 0x66]
	tvs	%xcc,	0x2
	ldsh	[%l7 + 0x1A],	%o3
	tleu	%xcc,	0x6
	andcc	%i6,	%o4,	%o7
	fpsub32s	%f3,	%f28,	%f5
	set	0x32, %o1
	ldsha	[%l7 + %o1] 0x81,	%i3
	xorcc	%o2,	0x1B77,	%g2
	movrne	%o6,	0x1ED,	%g3
	and	%l2,	%l6,	%i4
	taddcc	%i7,	%i1,	%l4
	orn	%o1,	%l0,	%i5
	fbo,a	%fcc1,	loop_153
	bvs,a,pt	%icc,	loop_154
	addccc	%i0,	0x0280,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_153:
	fbul	%fcc1,	loop_155
loop_154:
	nop
	setx	0x17766E57,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f26
	tleu	%xcc,	0x3
	tcc	%xcc,	0x0
loop_155:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble	loop_156
	fmovrsgez	%i2,	%f30,	%f6
	movrgz	%g6,	%l3,	%o5
	movg	%xcc,	%g1,	%g7
loop_156:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l1,	%l5
	bcs,a,pn	%xcc,	loop_157
	bcs,a,pn	%xcc,	loop_158
	fbg	%fcc0,	loop_159
	sdivx	%g5,	0x0D3D,	%o3
loop_157:
	bge,a,pt	%icc,	loop_160
loop_158:
	fbul	%fcc1,	loop_161
loop_159:
	tl	%icc,	0x7
	tn	%xcc,	0x4
loop_160:
	nop
	fitos	%f7,	%f27
	fstox	%f27,	%f24
	fxtos	%f24,	%f11
loop_161:
	bleu,a	%xcc,	loop_162
	umulcc	%o0,	0x0768,	%i6
	movvs	%icc,	%o7,	%i3
	fbo,a	%fcc3,	loop_163
loop_162:
	fandnot2s	%f10,	%f25,	%f7
	fmovrslz	%o2,	%f19,	%f20
	fcmpeq16	%f8,	%f0,	%o4
loop_163:
	fbul,a	%fcc2,	loop_164
	and	%g2,	%g3,	%o6
	fmovdne	%icc,	%f3,	%f2
	lduh	[%l7 + 0x72],	%l2
loop_164:
	udiv	%l6,	0x0428,	%i4
	alignaddr	%i1,	%i7,	%o1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x04,	%l4,	%i5
	tvc	%icc,	0x2
	ld	[%l7 + 0x2C],	%f13
	fmovsgu	%icc,	%f29,	%f0
	tsubcctv	%i0,	%l0,	%i2
	smulcc	%g4,	0x07DF,	%g6
	fmovsa	%icc,	%f10,	%f6
	orn	%l3,	0x1BBD,	%g1
	brlz	%o5,	loop_165
	fmovspos	%icc,	%f1,	%f0
	alignaddr	%l1,	%l5,	%g7
	udivx	%g5,	0x0A5D,	%o3
loop_165:
	sdivx	%i6,	0x1C89,	%o0
	tge	%xcc,	0x3
	and	%o7,	0x020E,	%i3
	andcc	%o2,	%g2,	%o4
	ldsw	[%l7 + 0x78],	%o6
	nop
	fitos	%f6,	%f28
	fstox	%f28,	%f24
	udivx	%g3,	0x0B3D,	%l2
	subc	%i4,	0x1481,	%i1
	movpos	%xcc,	%i7,	%l6
	movrgez	%l4,	0x227,	%o1
	brz	%i5,	loop_166
	movgu	%xcc,	%i0,	%i2
	fpsub16	%f16,	%f14,	%f22
	fsrc1	%f20,	%f26
loop_166:
	bcs,a	loop_167
	ldd	[%l7 + 0x40],	%g4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%l0
loop_167:
	nop
	setx loop_168, %l0, %l1
	jmpl %l1, %g1
	movle	%icc,	%o5,	%l3
	fpadd16	%f18,	%f20,	%f4
	xnorcc	%l1,	0x1782,	%l5
loop_168:
	fmovrdgz	%g7,	%f22,	%f12
	xor	%g5,	%i6,	%o0
	edge32ln	%o3,	%o7,	%o2
	nop
	fitos	%f2,	%f14
	fstod	%f14,	%f12
	nop
	setx	0x3DD2CF8ED0772FC9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	tvs	%xcc,	0x6
	stw	%g2,	[%l7 + 0x1C]
	nop
	setx	0x8CF60D20,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f11
	movvc	%icc,	%i3,	%o6
	tge	%xcc,	0x5
	be	%icc,	loop_169
	tn	%icc,	0x5
	fblg,a	%fcc0,	loop_170
	fbuge,a	%fcc2,	loop_171
loop_169:
	be,a,pt	%icc,	loop_172
	edge16	%o4,	%g3,	%i4
loop_170:
	tsubcc	%l2,	%i1,	%l6
loop_171:
	bg	loop_173
loop_172:
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f9
	edge32ln	%l4,	%i7,	%i5
	movcs	%icc,	%o1,	%i2
loop_173:
	taddcc	%i0,	%g4,	%g6
	movrgz	%l0,	%o5,	%g1
	faligndata	%f24,	%f2,	%f16
	fpack16	%f24,	%f0
	fnegs	%f5,	%f8
	st	%f31,	[%l7 + 0x24]
	udiv	%l3,	0x10F2,	%l5
	ta	%icc,	0x1
	movne	%icc,	%g7,	%g5
	movrlz	%l1,	%i6,	%o0
	set	0x3C, %i7
	lduwa	[%l7 + %i7] 0x19,	%o3
	tg	%xcc,	0x3
	edge8n	%o2,	%o7,	%g2
	nop
	setx	0x82E52612499A260A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x769FB85F2CAA71FC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f22,	%f22
	edge8	%i3,	%o4,	%g3
	bpos	%xcc,	loop_174
	add	%o6,	%l2,	%i4
	movrlez	%l6,	%i1,	%i7
	subcc	%l4,	0x110A,	%i5
loop_174:
	andcc	%o1,	%i2,	%i0
	array16	%g4,	%l0,	%o5
	fmovsvc	%xcc,	%f13,	%f29
	sdivx	%g6,	0x1AB4,	%g1
	sll	%l5,	0x13,	%g7
	edge32n	%g5,	%l1,	%i6
	tsubcctv	%l3,	%o0,	%o2
	fcmpne16	%f28,	%f20,	%o3
	set	0x67, %g1
	ldstuba	[%l7 + %g1] 0x80,	%g2
	sll	%i3,	0x11,	%o7
	fandnot1	%f30,	%f18,	%f20
	bgu,a	%xcc,	loop_175
	array32	%g3,	%o6,	%l2
	for	%f10,	%f18,	%f8
	movne	%xcc,	%i4,	%o4
loop_175:
	tle	%icc,	0x0
	tge	%icc,	0x4
	array8	%i1,	%i7,	%l6
	flush	%l7 + 0x1C
	fcmpgt16	%f10,	%f6,	%i5
	sir	0x11B2
	tl	%icc,	0x4
	xnor	%l4,	%i2,	%o1
	wr	%g0,	0x2a,	%asi
	stxa	%i0,	[%l7 + 0x70] %asi
	membar	#Sync
	mulscc	%l0,	0x0728,	%g4
	fblg	%fcc1,	loop_176
	tpos	%icc,	0x7
	edge16	%g6,	%g1,	%o5
	array32	%g7,	%l5,	%g5
loop_176:
	taddcc	%i6,	0x191B,	%l1
	array16	%l3,	%o2,	%o0
	nop
	setx	0xF69E4A63D2DDA517,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2B640DEF4E147718,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f26,	%f10
	fbne,a	%fcc0,	loop_177
	sethi	0x113A,	%o3
	udivcc	%g2,	0x09DA,	%i3
	movgu	%icc,	%o7,	%g3
loop_177:
	tcc	%icc,	0x4
	array16	%o6,	%i4,	%o4
	nop
	setx	0xE5A06ECB84C66A13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x0D02C3A6C9226BBB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f12,	%f28
	brlez	%l2,	loop_178
	xnorcc	%i1,	0x159F,	%l6
	call	loop_179
	or	%i5,	%i7,	%l4
loop_178:
	andcc	%o1,	0x1BE5,	%i2
	edge8l	%l0,	%g4,	%i0
loop_179:
	movpos	%icc,	%g1,	%g6
	ba,a	loop_180
	nop
	setx	0x49FF5A27,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f10
	tneg	%xcc,	0x0
	umul	%o5,	0x1B91,	%l5
loop_180:
	edge16l	%g5,	%g7,	%i6
	fbo	%fcc2,	loop_181
	tleu	%xcc,	0x0
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
loop_181:
	edge16l	%o2,	%l1,	%o0
	sllx	%g2,	0x03,	%i3
	sir	0x0105
	set	0x28, %g4
	stwa	%o3,	[%l7 + %g4] 0x18
	move	%xcc,	%g3,	%o7
	smulcc	%o6,	%i4,	%o4
	fcmple16	%f22,	%f6,	%i1
	st	%f8,	[%l7 + 0x60]
	edge16l	%l6,	%l2,	%i5
	subccc	%i7,	0x15BC,	%l4
	xnorcc	%i2,	0x1C11,	%l0
	brlez,a	%o1,	loop_182
	movneg	%xcc,	%g4,	%i0
	membar	0x0A
	fsrc2	%f20,	%f16
loop_182:
	stw	%g6,	[%l7 + 0x70]
	fmovsvc	%xcc,	%f29,	%f7
	andcc	%g1,	%l5,	%o5
	movcc	%xcc,	%g7,	%g5
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bgu,a	loop_183
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a,pt	%xcc,	loop_184
	movg	%icc,	%l3,	%i6
loop_183:
	sir	0x1517
	nop
	setx	loop_185,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_184:
	fexpand	%f12,	%f26
	movn	%xcc,	%l1,	%o0
	fnor	%f2,	%f0,	%f10
loop_185:
	xorcc	%o2,	0x0E65,	%g2
	fmovrdne	%o3,	%f2,	%f10
	fsrc1	%f12,	%f8
	fcmpne16	%f6,	%f30,	%i3
	movvc	%xcc,	%o7,	%o6
	xnorcc	%i4,	%o4,	%i1
	lduw	[%l7 + 0x3C],	%l6
	fsrc2s	%f15,	%f25
	move	%icc,	%g3,	%l2
	mova	%icc,	%i5,	%i7
	sir	0x14B6
	xnor	%l4,	0x1FB4,	%l0
	orncc	%o1,	0x076D,	%g4
	xorcc	%i0,	%i2,	%g6
	srax	%g1,	0x1A,	%o5
	alignaddrl	%g7,	%l5,	%l3
	fpadd16	%f18,	%f18,	%f12
	edge8n	%g5,	%l1,	%i6
	be,a,pt	%xcc,	loop_186
	tpos	%xcc,	0x0
	ble	%icc,	loop_187
	xorcc	%o2,	0x1886,	%o0
loop_186:
	fmovsl	%xcc,	%f14,	%f29
	alignaddr	%o3,	%i3,	%o7
loop_187:
	tpos	%xcc,	0x3
	nop
	setx	0xDC34C99B6F908600,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x9EB9BEF0BA2F5A92,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f26,	%f10
	movle	%icc,	%o6,	%g2
	ta	%xcc,	0x6
	nop
	fitos	%f10,	%f27
	fstox	%f27,	%f30
	fxtos	%f30,	%f14
	fmovse	%xcc,	%f10,	%f6
	tneg	%xcc,	0x5
	fbo	%fcc1,	loop_188
	tle	%icc,	0x0
	alignaddr	%o4,	%i1,	%l6
	fcmpgt32	%f0,	%f6,	%g3
loop_188:
	swap	[%l7 + 0x28],	%i4
	xnorcc	%l2,	0x1529,	%i7
	tneg	%icc,	0x2
	xnorcc	%i5,	0x0ECC,	%l0
	std	%f20,	[%l7 + 0x70]
	subccc	%o1,	%l4,	%g4
	fpack16	%f26,	%f19
	fcmple32	%f6,	%f10,	%i2
	movcs	%icc,	%i0,	%g6
	movge	%icc,	%g1,	%o5
	fcmpne32	%f8,	%f30,	%g7
	membar	0x02
	st	%f7,	[%l7 + 0x1C]
	fmovdge	%xcc,	%f24,	%f1
	fand	%f0,	%f14,	%f14
	array32	%l3,	%l5,	%l1
	orncc	%i6,	%g5,	%o2
	nop
	set	0x28, %o0
	ldsw	[%l7 + %o0],	%o0
	udiv	%i3,	0x02A5,	%o3
	sllx	%o6,	%o7,	%g2
	sub	%o4,	0x0034,	%l6
	fcmple32	%f30,	%f0,	%i1
	fbu,a	%fcc3,	loop_189
	sth	%g3,	[%l7 + 0x68]
	edge8ln	%l2,	%i4,	%i5
	movleu	%xcc,	%i7,	%o1
loop_189:
	fmovde	%xcc,	%f28,	%f13
	srax	%l4,	%g4,	%l0
	fmovspos	%xcc,	%f24,	%f17
	bl	%xcc,	loop_190
	movge	%icc,	%i2,	%i0
	movg	%xcc,	%g6,	%o5
	sdivcc	%g1,	0x0F4E,	%g7
loop_190:
	add	%l3,	%l5,	%i6
	movgu	%icc,	%l1,	%o2
	umulcc	%g5,	0x0754,	%o0
	bg,a	loop_191
	andn	%o3,	0x105F,	%i3
	fmovda	%icc,	%f4,	%f0
	fcmpne16	%f6,	%f6,	%o6
loop_191:
	array8	%o7,	%g2,	%l6
	movl	%icc,	%i1,	%g3
	udivx	%l2,	0x0B58,	%o4
	fnor	%f24,	%f2,	%f24
	and	%i4,	0x1780,	%i7
	tcs	%icc,	0x5
	xor	%o1,	0x1676,	%i5
	movn	%xcc,	%l4,	%g4
	xorcc	%l0,	%i2,	%g6
	tpos	%xcc,	0x1
	movcs	%xcc,	%i0,	%g1
	fsrc1s	%f12,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%g7,	loop_192
	tneg	%xcc,	0x0
	fmovdcc	%icc,	%f16,	%f22
	prefetch	[%l7 + 0x68],	 0x3
loop_192:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	srlx	%l3,	%l5,	%o5
	tl	%icc,	0x5
	edge16ln	%l1,	%i6,	%g5
	array16	%o0,	%o2,	%o3
	fmovrsgez	%i3,	%f26,	%f13
	ld	[%l7 + 0x54],	%f23
	edge32	%o7,	%g2,	%o6
	orn	%l6,	%g3,	%l2
	tvs	%xcc,	0x6
	pdist	%f4,	%f0,	%f26
	sra	%o4,	0x04,	%i1
	fbug	%fcc3,	loop_193
	movvc	%icc,	%i4,	%i7
	bn	%icc,	loop_194
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_193:
	tcc	%icc,	0x3
	fmovdn	%icc,	%f0,	%f28
loop_194:
	bneg,a,pt	%icc,	loop_195
	udivx	%i5,	0x179A,	%l4
	set	0x08, %i3
	stxa	%o1,	[%l7 + %i3] 0x22
	membar	#Sync
loop_195:
	taddcctv	%l0,	%i2,	%g6
	srax	%g4,	%g1,	%i0
	addc	%l3,	0x128D,	%g7
	fpack16	%f14,	%f28
	andn	%l5,	0x1D7C,	%o5
	bleu,a	%icc,	loop_196
	popc	0x0F16,	%i6
	movgu	%icc,	%g5,	%l1
	fmovrsne	%o0,	%f11,	%f8
loop_196:
	fbg	%fcc2,	loop_197
	membar	0x07
	movcc	%xcc,	%o2,	%i3
	udivx	%o7,	0x1600,	%g2
loop_197:
	udivcc	%o3,	0x0701,	%o6
	subccc	%l6,	%l2,	%g3
	edge8n	%o4,	%i1,	%i4
	subc	%i5,	%i7,	%o1
	tvc	%icc,	0x1
	edge32ln	%l0,	%l4,	%g6
	fmovdne	%icc,	%f18,	%f25
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x18] %asi,	%f15
	fbul	%fcc0,	loop_198
	smulcc	%g4,	%i2,	%i0
	tn	%xcc,	0x5
	fmovdgu	%xcc,	%f8,	%f30
loop_198:
	tcc	%icc,	0x5
	fmovdcc	%xcc,	%f19,	%f23
	wr	%g0,	0x11,	%asi
	sta	%f13,	[%l7 + 0x1C] %asi
	tn	%icc,	0x4
	tpos	%icc,	0x3
	stb	%g1,	[%l7 + 0x63]
	fmovsgu	%icc,	%f13,	%f14
	edge16ln	%g7,	%l3,	%l5
	edge16ln	%i6,	%g5,	%l1
	fbule	%fcc1,	loop_199
	mulscc	%o5,	%o0,	%o2
	movrlz	%o7,	0x1DE,	%g2
	stx	%i3,	[%l7 + 0x08]
loop_199:
	movn	%icc,	%o3,	%o6
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x0C] %asi,	%f31
	taddcctv	%l6,	%l2,	%g3
	andncc	%i1,	%i4,	%o4
	mova	%xcc,	%i7,	%i5
	ldsw	[%l7 + 0x18],	%o1
	andncc	%l0,	%g6,	%g4
	sllx	%i2,	0x11,	%l4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x1F] %asi,	%g1
	ba	%xcc,	loop_200
	edge16l	%g7,	%l3,	%l5
	tvc	%icc,	0x2
	ldd	[%l7 + 0x48],	%f14
loop_200:
	sdiv	%i6,	0x11B9,	%i0
	movgu	%xcc,	%g5,	%l1
	wr	%g0,	0xea,	%asi
	stha	%o5,	[%l7 + 0x28] %asi
	membar	#Sync
	tsubcc	%o0,	0x08D6,	%o2
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o7
	sdivx	%i3,	0x10D6,	%g2
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x80,	%o6
	nop
	fitos	%f12,	%f19
	fstod	%f19,	%f8
	taddcctv	%o3,	%l2,	%l6
	fmovrse	%g3,	%f10,	%f10
	sethi	0x094D,	%i4
	movvs	%xcc,	%i1,	%i7
	tle	%icc,	0x3
	smul	%i5,	%o4,	%o1
	stb	%g6,	[%l7 + 0x66]
	fandnot1	%f24,	%f4,	%f26
	edge8n	%l0,	%i2,	%l4
	nop
	setx loop_201, %l0, %l1
	jmpl %l1, %g1
	movvc	%icc,	%g7,	%l3
	st	%f2,	[%l7 + 0x34]
	set	0x40, %i1
	ldswa	[%l7 + %i1] 0x81,	%l5
loop_201:
	stx	%g4,	[%l7 + 0x30]
	array16	%i0,	%i6,	%l1
	fmovsne	%xcc,	%f13,	%f31
	array16	%o5,	%g5,	%o2
	lduh	[%l7 + 0x30],	%o7
	edge32l	%i3,	%g2,	%o6
	fnegs	%f8,	%f6
	fpmerge	%f9,	%f6,	%f0
	te	%xcc,	0x2
	edge8l	%o0,	%o3,	%l2
	fmovrdlz	%l6,	%f24,	%f24
	membar	0x1C
	fones	%f22
	fcmpgt32	%f26,	%f28,	%g3
	brgz,a	%i4,	loop_202
	edge32ln	%i1,	%i7,	%i5
	movcc	%xcc,	%o4,	%g6
	udivx	%o1,	0x0ED9,	%i2
loop_202:
	movrlz	%l0,	%g1,	%l4
	tcs	%xcc,	0x7
	mulx	%g7,	%l3,	%l5
	movcc	%xcc,	%i0,	%i6
	smulcc	%g4,	%o5,	%g5
	movrlez	%o2,	%o7,	%l1
	bne,pt	%xcc,	loop_203
	fandnot1	%f14,	%f30,	%f22
	tsubcctv	%g2,	0x1EB8,	%i3
	ble,a	%xcc,	loop_204
loop_203:
	andn	%o6,	0x1EDB,	%o0
	fcmpeq32	%f22,	%f26,	%l2
	swap	[%l7 + 0x24],	%o3
loop_204:
	fmovsge	%icc,	%f19,	%f2
	movrgz	%g3,	0x316,	%i4
	fxnors	%f7,	%f8,	%f1
	xnorcc	%l6,	0x0E46,	%i1
	fcmpgt16	%f30,	%f26,	%i7
	taddcctv	%i5,	%g6,	%o1
	bleu,a,pt	%xcc,	loop_205
	membar	0x6B
	nop
	setx	0x906D03E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	te	%xcc,	0x7
loop_205:
	addcc	%i2,	0x0D16,	%o4
	lduh	[%l7 + 0x20],	%g1
	ldsh	[%l7 + 0x72],	%l4
	alignaddrl	%g7,	%l0,	%l3
	movre	%i0,	0x2B6,	%i6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x1
	fbge,a	%fcc2,	loop_206
	tcc	%xcc,	0x4
	edge8l	%l5,	%o5,	%o2
	movcs	%icc,	%g5,	%l1
loop_206:
	nop
	set	0x66, %i4
	lduha	[%l7 + %i4] 0x81,	%g2
	bn,a,pt	%xcc,	loop_207
	movpos	%icc,	%i3,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x62] %asi,	%o0
loop_207:
	fmovde	%icc,	%f10,	%f8
	tsubcc	%l2,	%o7,	%o3
	udivcc	%g3,	0x0297,	%i4
	alignaddrl	%l6,	%i7,	%i5
	fors	%f1,	%f18,	%f18
	movl	%icc,	%g6,	%i1
	movrne	%o1,	0x01C,	%i2
	swap	[%l7 + 0x24],	%g1
	set	0x12, %l1
	ldstuba	[%l7 + %l1] 0x11,	%o4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%l4
	add	%l0,	0x07EB,	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%i0
	ldx	[%l7 + 0x70],	%i6
	movvs	%xcc,	%l5,	%o5
	fmovde	%xcc,	%f14,	%f22
	movrgz	%o2,	0x000,	%g4
	movrlz	%l1,	0x12D,	%g2
	edge8ln	%g5,	%o6,	%i3
	sll	%l2,	0x13,	%o7
	movrgez	%o3,	0x040,	%g3
	srax	%o0,	0x12,	%i4
	tneg	%icc,	0x2
	fabss	%f29,	%f12
	nop
	setx	0xF3018DEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x80AE1B37,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f4,	%f17
	bvc,a	%xcc,	loop_208
	bgu,a	loop_209
	alignaddr	%i7,	%i5,	%g6
	edge16	%i1,	%l6,	%o1
loop_208:
	movge	%xcc,	%g1,	%i2
loop_209:
	movrlez	%l4,	0x2D0,	%o4
	set	0x16, %l6
	stha	%l0,	[%l7 + %l6] 0x23
	membar	#Sync
	fands	%f16,	%f28,	%f2
	movcs	%icc,	%g7,	%i0
	movpos	%icc,	%i6,	%l3
	fmovdcs	%icc,	%f5,	%f9
	array8	%l5,	%o5,	%o2
	sdivx	%l1,	0x1D3C,	%g4
	edge16l	%g5,	%o6,	%g2
	movrlez	%l2,	0x0D8,	%o7
	fmovsvs	%xcc,	%f12,	%f28
	nop
	setx loop_210, %l0, %l1
	jmpl %l1, %o3
	fbule	%fcc2,	loop_211
	orn	%i3,	0x0203,	%o0
	wr	%g0,	0x80,	%asi
	sta	%f12,	[%l7 + 0x34] %asi
loop_210:
	addcc	%i4,	0x03B6,	%i7
loop_211:
	mova	%xcc,	%g3,	%i5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x58] %asi,	%f14
	andncc	%i1,	%l6,	%o1
	mulx	%g6,	0x010A,	%i2
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f0
	fxtod	%f0,	%f20
	subccc	%g1,	0x0142,	%l4
	call	loop_212
	fnors	%f29,	%f24,	%f15
	sra	%o4,	%l0,	%g7
	ldsw	[%l7 + 0x48],	%i0
loop_212:
	tcc	%xcc,	0x6
	fcmple32	%f24,	%f30,	%l3
	bvc,a,pt	%xcc,	loop_213
	subccc	%i6,	0x0A17,	%l5
	std	%f30,	[%l7 + 0x38]
	movne	%icc,	%o5,	%o2
loop_213:
	nop
	fitod	%f21,	%f28
	nop
	set	0x44, %o3
	lduw	[%l7 + %o3],	%g4
	fabsd	%f6,	%f20
	fpsub16s	%f24,	%f26,	%f2
	tvs	%icc,	0x1
	alignaddrl	%g5,	%o6,	%l1
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x43] %asi,	%l2
	wr	%g0,	0x2f,	%asi
	stxa	%o7,	[%l7 + 0x30] %asi
	membar	#Sync
	xnor	%g2,	%i3,	%o0
	nop
	set	0x66, %l3
	stb	%i4,	[%l7 + %l3]
	movne	%icc,	%o3,	%g3
	fcmpeq16	%f4,	%f6,	%i7
	fmovd	%f12,	%f0
	edge32n	%i1,	%i5,	%l6
	sllx	%o1,	0x10,	%i2
	array16	%g1,	%g6,	%o4
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x1e,	%f16
	movcc	%xcc,	%l4,	%l0
	udiv	%i0,	0x1C3E,	%l3
	sll	%i6,	0x08,	%g7
	move	%icc,	%l5,	%o5
	add	%g4,	0x1D8E,	%g5
	fbue	%fcc1,	loop_214
	fbne	%fcc1,	loop_215
	tleu	%icc,	0x2
	alignaddrl	%o6,	%l1,	%l2
loop_214:
	movrgz	%o7,	0x0B5,	%g2
loop_215:
	membar	0x29
	fxnors	%f5,	%f24,	%f26
	array8	%o2,	%i3,	%i4
	bne,a	loop_216
	sllx	%o3,	0x12,	%g3
	alignaddrl	%i7,	%i1,	%i5
	tsubcc	%o0,	0x060F,	%l6
loop_216:
	srax	%i2,	0x01,	%g1
	taddcctv	%g6,	%o1,	%l4
	fcmple16	%f6,	%f8,	%o4
	array8	%i0,	%l0,	%l3
	sir	0x19F5
	udiv	%i6,	0x0260,	%g7
	stx	%l5,	[%l7 + 0x38]
	fmovrslez	%o5,	%f20,	%f9
	nop
	fitod	%f28,	%f18
	brnz,a	%g4,	loop_217
	movvs	%icc,	%g5,	%l1
	mova	%xcc,	%l2,	%o7
	fmovsg	%icc,	%f11,	%f2
loop_217:
	movcc	%xcc,	%o6,	%g2
	tleu	%xcc,	0x2
	mova	%icc,	%i3,	%i4
	taddcctv	%o2,	0x0A0E,	%o3
	swap	[%l7 + 0x60],	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i1,	%i5
	swap	[%l7 + 0x18],	%o0
	tvs	%icc,	0x6
	fmovsle	%xcc,	%f30,	%f30
	smulcc	%g3,	0x0F98,	%i2
	std	%f26,	[%l7 + 0x20]
	edge8l	%g1,	%l6,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l4,	%o4,	%o1
	fbue	%fcc2,	loop_218
	tgu	%icc,	0x4
	fblg	%fcc0,	loop_219
	and	%l0,	%i0,	%i6
loop_218:
	lduh	[%l7 + 0x6C],	%l3
	mulx	%g7,	%l5,	%o5
loop_219:
	nop
	set	0x10, %l4
	prefetcha	[%l7 + %l4] 0x15,	 0x3
	movrne	%l1,	0x080,	%l2
	mulx	%o7,	%g4,	%o6
	movle	%xcc,	%g2,	%i4
	subc	%o2,	%i3,	%i7
	nop
	setx	0xA8436B83A047D4D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fcmpne16	%f16,	%f6,	%i1
	subccc	%i5,	0x17FC,	%o0
	bvc,a	loop_220
	xnor	%o3,	%g3,	%g1
	fpsub32	%f24,	%f2,	%f28
	fbg,a	%fcc1,	loop_221
loop_220:
	fpackfix	%f12,	%f22
	alignaddr	%l6,	%i2,	%g6
	edge8l	%l4,	%o1,	%o4
loop_221:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i0,	%i6
	fblg	%fcc3,	loop_222
	fbe	%fcc0,	loop_223
	nop
	setx	0xA9209BD8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xBDD31B03,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f19,	%f12
	sth	%l0,	[%l7 + 0x20]
loop_222:
	tvs	%icc,	0x5
loop_223:
	movl	%xcc,	%g7,	%l5
	fmovdle	%icc,	%f5,	%f26
	edge8l	%o5,	%g5,	%l3
	edge16ln	%l2,	%l1,	%g4
	bg,a	%xcc,	loop_224
	fnands	%f17,	%f3,	%f27
	bvc,a,pt	%xcc,	loop_225
	fmovdgu	%icc,	%f27,	%f13
loop_224:
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f4
	ldd	[%l7 + 0x50],	%f24
loop_225:
	sllx	%o6,	%o7,	%i4
	ldub	[%l7 + 0x5B],	%g2
	fzero	%f30
	add	%i3,	0x1EE1,	%o2
	movvs	%xcc,	%i1,	%i5
	set	0x60, %g6
	lduwa	[%l7 + %g6] 0x0c,	%i7
	edge16ln	%o0,	%g3,	%o3
	nop
	fitos	%f10,	%f15
	fstox	%f15,	%f2
	fxtos	%f2,	%f1
	fmovsl	%xcc,	%f3,	%f7
	fxor	%f12,	%f16,	%f28
	set	0x2C, %o7
	stha	%g1,	[%l7 + %o7] 0xeb
	membar	#Sync
	tle	%xcc,	0x5
	movgu	%xcc,	%l6,	%i2
	be,pt	%icc,	loop_226
	fmovrdgez	%l4,	%f10,	%f8
	ldub	[%l7 + 0x5D],	%o1
	edge32l	%o4,	%i0,	%g6
loop_226:
	ldsh	[%l7 + 0x5A],	%l0
	sethi	0x169D,	%g7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x04,	%i6,	%o5
	xnor	%l5,	%g5,	%l3
	umulcc	%l2,	%g4,	%l1
	move	%xcc,	%o7,	%i4
	movle	%icc,	%o6,	%i3
	array16	%o2,	%g2,	%i1
	sra	%i7,	0x08,	%i5
	fmovdleu	%xcc,	%f27,	%f27
	nop
	fitod	%f0,	%f0
	fdtox	%f0,	%f10
	movcc	%icc,	%g3,	%o3
	tpos	%icc,	0x0
	fcmpeq32	%f18,	%f10,	%o0
	fbue,a	%fcc3,	loop_227
	nop
	fitod	%f8,	%f4
	fdtos	%f4,	%f30
	tle	%xcc,	0x7
	edge16l	%g1,	%l6,	%l4
loop_227:
	fbo,a	%fcc2,	loop_228
	fcmpeq32	%f18,	%f24,	%o1
	fbn	%fcc0,	loop_229
	tsubcc	%i2,	0x0468,	%o4
loop_228:
	fmovdle	%icc,	%f13,	%f8
	brlz,a	%g6,	loop_230
loop_229:
	fcmpne32	%f30,	%f28,	%l0
	movle	%xcc,	%i0,	%i6
	add	%g7,	0x17A8,	%l5
loop_230:
	brlz	%o5,	loop_231
	movvs	%icc,	%g5,	%l2
	popc	0x113B,	%g4
	sir	0x07E1
loop_231:
	fmul8x16al	%f6,	%f30,	%f18
	fpadd32s	%f31,	%f13,	%f26
	tgu	%xcc,	0x1
	andncc	%l3,	%o7,	%i4
	ldd	[%l7 + 0x30],	%o6
	popc	%l1,	%i3
	fandnot1	%f22,	%f12,	%f6
	srlx	%g2,	%i1,	%o2
	fmovdgu	%icc,	%f17,	%f21
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f26
	fxtod	%f26,	%f26
	brlez	%i7,	loop_232
	std	%f30,	[%l7 + 0x50]
	popc	%g3,	%o3
	fbul,a	%fcc2,	loop_233
loop_232:
	fpadd32	%f28,	%f8,	%f16
	fblg	%fcc2,	loop_234
	movvc	%icc,	%o0,	%g1
loop_233:
	fcmple16	%f0,	%f0,	%l6
	tcc	%icc,	0x2
loop_234:
	fpack16	%f22,	%f6
	edge16n	%i5,	%l4,	%i2
	fbuge	%fcc1,	loop_235
	lduw	[%l7 + 0x4C],	%o4
	addcc	%g6,	0x0D63,	%o1
	movcs	%icc,	%i0,	%i6
loop_235:
	edge32n	%l0,	%l5,	%g7
	movneg	%icc,	%o5,	%g5
	tpos	%icc,	0x5
	movrgez	%g4,	%l2,	%l3
	tg	%icc,	0x7
	movvs	%icc,	%o7,	%i4
	xnor	%l1,	0x0ECD,	%o6
	tvs	%icc,	0x7
	stb	%i3,	[%l7 + 0x6A]
	sdivcc	%i1,	0x0252,	%g2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%i7
	tl	%icc,	0x4
	udiv	%g3,	0x164D,	%o3
	fmovde	%icc,	%f16,	%f27
	movn	%icc,	%o0,	%l6
	movrne	%i5,	%g1,	%i2
	brgz,a	%o4,	loop_236
	bpos,a,pn	%icc,	loop_237
	edge8	%l4,	%o1,	%g6
	smulcc	%i6,	%l0,	%i0
loop_236:
	fnands	%f13,	%f28,	%f1
loop_237:
	tne	%icc,	0x4
	tne	%icc,	0x1
	or	%g7,	%o5,	%l5
	fmovda	%icc,	%f26,	%f1
	bge,a,pn	%icc,	loop_238
	movrgez	%g5,	0x15C,	%l2
	udivcc	%l3,	0x09C4,	%o7
	subcc	%i4,	%l1,	%g4
loop_238:
	subccc	%o6,	0x11CA,	%i3
	bvs,pt	%icc,	loop_239
	bvc,a,pt	%icc,	loop_240
	and	%g2,	0x09F5,	%o2
	fba	%fcc3,	loop_241
loop_239:
	edge16	%i1,	%i7,	%o3
loop_240:
	fmovrse	%g3,	%f20,	%f21
	set	0x7E, %o2
	ldstuba	[%l7 + %o2] 0x89,	%l6
loop_241:
	mova	%icc,	%o0,	%g1
	fnegs	%f22,	%f26
	subc	%i2,	0x1B1E,	%i5
	addcc	%l4,	%o1,	%o4
	fmovrdgez	%g6,	%f18,	%f6
	fbug	%fcc2,	loop_242
	nop
	setx	loop_243,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbn	%fcc3,	loop_244
	tcs	%icc,	0x2
loop_242:
	movg	%icc,	%i6,	%i0
loop_243:
	tl	%xcc,	0x3
loop_244:
	movrlz	%g7,	0x0F5,	%o5
	bgu	%xcc,	loop_245
	movvc	%xcc,	%l5,	%l0
	udivx	%g5,	0x198F,	%l3
	addcc	%l2,	0x0666,	%o7
loop_245:
	orncc	%i4,	0x0E76,	%g4
	tge	%xcc,	0x3
	movle	%xcc,	%o6,	%l1
	fblg,a	%fcc2,	loop_246
	fbule	%fcc1,	loop_247
	nop
	setx	0x306E1CB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	movrlez	%i3,	%o2,	%i1
loop_246:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_247:
	andncc	%g2,	%i7,	%g3
	lduh	[%l7 + 0x2A],	%o3
	tleu	%icc,	0x4
	ld	[%l7 + 0x10],	%f21
	bge,a,pn	%icc,	loop_248
	movge	%icc,	%l6,	%o0
	bg	loop_249
	tle	%xcc,	0x3
loop_248:
	addcc	%i2,	%i5,	%l4
	fmovsleu	%icc,	%f17,	%f0
loop_249:
	subc	%o1,	0x04A0,	%g1
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x69] %asi,	%o4
	fandnot2s	%f30,	%f28,	%f18
	mulx	%g6,	0x1B7F,	%i6
	nop
	setx	0xC0430193,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	tcc	%icc,	0x5
	fmul8x16au	%f21,	%f16,	%f0
	set	0x44, %l0
	sta	%f17,	[%l7 + %l0] 0x81
	fbn	%fcc1,	loop_250
	fmul8ulx16	%f6,	%f28,	%f20
	sub	%i0,	0x189F,	%o5
	edge8n	%l5,	%l0,	%g7
loop_250:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x42] %asi,	%g5
	nop
	setx	0x00694688,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	popc	%l2,	%l3
	bshuffle	%f30,	%f4,	%f12
	array32	%i4,	%o7,	%g4
	fble,a	%fcc1,	loop_251
	fbuge,a	%fcc3,	loop_252
	fabsd	%f12,	%f4
	movl	%xcc,	%o6,	%l1
loop_251:
	fmul8ulx16	%f2,	%f4,	%f26
loop_252:
	fmul8ulx16	%f6,	%f24,	%f6
	or	%i3,	0x1219,	%o2
	and	%i1,	%i7,	%g3
	fcmple32	%f4,	%f28,	%o3
	movleu	%xcc,	%l6,	%o0
	fmovsleu	%xcc,	%f4,	%f5
	movvc	%xcc,	%i2,	%i5
	edge16ln	%l4,	%g2,	%g1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o1,	%o4
	alignaddrl	%g6,	%i0,	%i6
	nop
	set	0x68, %o4
	ldd	[%l7 + %o4],	%f22
	edge32	%l5,	%o5,	%l0
	bcs,pt	%icc,	loop_253
	tpos	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x24] %asi,	%g5
loop_253:
	sth	%g7,	[%l7 + 0x32]
	srlx	%l2,	%i4,	%o7
	mova	%xcc,	%l3,	%g4
	fmovsa	%xcc,	%f12,	%f30
	fabss	%f5,	%f11
	umulcc	%o6,	0x0E4A,	%i3
	fandnot1s	%f2,	%f18,	%f30
	subcc	%l1,	%o2,	%i7
	taddcctv	%i1,	0x00AF,	%o3
	ldd	[%l7 + 0x10],	%g2
	fpsub16s	%f29,	%f21,	%f17
	ldstub	[%l7 + 0x25],	%l6
	srax	%o0,	0x17,	%i5
	fmovdn	%xcc,	%f12,	%f28
	subcc	%i2,	%g2,	%l4
	sdivcc	%g1,	0x0D1D,	%o1
	addc	%o4,	%g6,	%i0
	fmovsne	%xcc,	%f31,	%f16
	tvc	%xcc,	0x7
	fxnors	%f31,	%f20,	%f29
	popc	0x0A63,	%i6
	array8	%o5,	%l5,	%l0
	movneg	%xcc,	%g5,	%l2
	fzeros	%f19
	tne	%xcc,	0x4
	stw	%i4,	[%l7 + 0x68]
	nop
	setx	0xCA297DB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xAA1432D5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f13,	%f9
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x60] %asi,	%o6
	bvc,a	%xcc,	loop_254
	fmul8x16au	%f1,	%f29,	%f14
	fpackfix	%f30,	%f7
	xnor	%l3,	0x0F67,	%g4
loop_254:
	orncc	%g7,	0x0775,	%o6
	tle	%xcc,	0x6
	edge16l	%i3,	%l1,	%o2
	std	%f28,	[%l7 + 0x38]
	movleu	%icc,	%i1,	%i7
	fabss	%f2,	%f6
	udivx	%g3,	0x1B58,	%l6
	tsubcctv	%o3,	0x08A2,	%i5
	sdiv	%o0,	0x0AAB,	%g2
	edge32n	%l4,	%i2,	%g1
	fexpand	%f10,	%f8
	movvc	%icc,	%o1,	%g6
	move	%icc,	%i0,	%o4
	fmovrdlez	%i6,	%f30,	%f22
	fzeros	%f20
	fpadd16s	%f23,	%f12,	%f27
	ldub	[%l7 + 0x19],	%o5
	fmul8x16au	%f28,	%f22,	%f26
	fbule,a	%fcc1,	loop_255
	ldd	[%l7 + 0x30],	%f8
	sth	%l0,	[%l7 + 0x1A]
	umulcc	%l5,	%l2,	%g5
loop_255:
	membar	0x11
	addc	%o7,	%l3,	%g4
	and	%g7,	0x1CDF,	%o6
	orncc	%i3,	0x117C,	%l1
	fmovspos	%icc,	%f5,	%f23
	tl	%xcc,	0x1
	movn	%icc,	%i4,	%o2
	set	0x1C, %g3
	ldsba	[%l7 + %g3] 0x04,	%i7
	srl	%g3,	0x14,	%l6
	orn	%o3,	%i1,	%i5
	fpadd32	%f30,	%f2,	%f14
	edge16l	%g2,	%l4,	%i2
	orn	%o0,	%o1,	%g1
	movcc	%icc,	%g6,	%o4
	fpmerge	%f22,	%f18,	%f24
	sethi	0x04D5,	%i6
	subccc	%o5,	0x1773,	%i0
	bleu,a,pt	%icc,	loop_256
	edge8ln	%l5,	%l0,	%g5
	tsubcc	%o7,	%l3,	%g4
	nop
	setx	0x3043931B,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
loop_256:
	fmovsa	%xcc,	%f8,	%f24
	fpack32	%f6,	%f14,	%f10
	fbg,a	%fcc0,	loop_257
	tsubcc	%g7,	0x1A29,	%o6
	bg,a,pt	%xcc,	loop_258
	edge8ln	%l2,	%l1,	%i4
loop_257:
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f14
	fxtos	%f14,	%f31
	nop
	setx	0x9DF3D6C930430913,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
loop_258:
	bleu,a	%icc,	loop_259
	nop
	set	0x6C, %l5
	sth	%i3,	[%l7 + %l5]
	tleu	%icc,	0x6
	edge32n	%o2,	%i7,	%l6
loop_259:
	xorcc	%o3,	0x0DB9,	%i1
	fnands	%f4,	%f16,	%f0
	fcmpne16	%f28,	%f30,	%g3
	taddcctv	%i5,	%g2,	%i2
	fand	%f24,	%f26,	%f16
	alignaddrl	%l4,	%o1,	%o0
	mova	%xcc,	%g1,	%o4
	fpadd16	%f28,	%f16,	%f12
	movrlez	%i6,	0x3F8,	%g6
	tcc	%icc,	0x1
	movvc	%icc,	%i0,	%o5
	tne	%xcc,	0x6
	be	loop_260
	movrlez	%l5,	%l0,	%o7
	fbo,a	%fcc1,	loop_261
	and	%l3,	%g5,	%g7
loop_260:
	movpos	%xcc,	%g4,	%o6
	movpos	%icc,	%l2,	%l1
loop_261:
	fblg,a	%fcc2,	loop_262
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc3,	loop_263
	fnors	%f28,	%f9,	%f18
loop_262:
	movrgz	%i4,	0x009,	%o2
	array8	%i3,	%l6,	%i7
loop_263:
	nop
	set	0x24, %g5
	sta	%f13,	[%l7 + %g5] 0x14
	nop
	setx	loop_264,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%i1,	%g3,	%o3
	stbar
	fpsub16s	%f31,	%f7,	%f21
loop_264:
	nop
	setx	0xDD2927EFF07E4ACE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f16
	ldub	[%l7 + 0x24],	%g2
	subc	%i2,	0x1CC1,	%l4
	xor	%i5,	%o1,	%g1
	ldsw	[%l7 + 0x28],	%o4
	fbg	%fcc1,	loop_265
	fba	%fcc2,	loop_266
	ldsw	[%l7 + 0x54],	%i6
	bneg,a,pt	%xcc,	loop_267
loop_265:
	nop
	fitod	%f15,	%f14
loop_266:
	tleu	%icc,	0x2
	brlez,a	%g6,	loop_268
loop_267:
	fands	%f26,	%f16,	%f0
	tvc	%xcc,	0x7
	wr	%g0,	0x27,	%asi
	stxa	%i0,	[%l7 + 0x50] %asi
	membar	#Sync
loop_268:
	movn	%icc,	%o0,	%l5
	fmovrslz	%l0,	%f15,	%f4
	movn	%xcc,	%o7,	%o5
	fornot1s	%f12,	%f2,	%f1
	edge32	%l3,	%g7,	%g5
	set	0x79, %g2
	ldstuba	[%l7 + %g2] 0x10,	%g4
	fcmple16	%f6,	%f8,	%o6
	edge8ln	%l2,	%i4,	%o2
	set	0x64, %i6
	sta	%f11,	[%l7 + %i6] 0x19
	fmovda	%xcc,	%f12,	%f14
	nop
	fitos	%f4,	%f0
	fstoi	%f0,	%f0
	edge16	%l1,	%l6,	%i7
	sdiv	%i1,	0x0245,	%g3
	bn	loop_269
	alignaddrl	%i3,	%o3,	%g2
	movrlz	%l4,	0x3C2,	%i2
	sdivx	%o1,	0x1B49,	%g1
loop_269:
	srax	%o4,	%i5,	%i6
	popc	%i0,	%g6
	edge8l	%o0,	%l0,	%o7
	movl	%xcc,	%o5,	%l3
	nop
	fitos	%f30,	%f24
	nop
	set	0x46, %o6
	ldstub	[%l7 + %o6],	%g7
	edge8n	%g5,	%l5,	%o6
	fmovsvs	%icc,	%f11,	%f18
	umulcc	%g4,	0x0A0B,	%l2
	tsubcc	%o2,	%l1,	%l6
	movgu	%icc,	%i4,	%i1
	fpack16	%f24,	%f7
	tleu	%icc,	0x0
	nop
	setx loop_270, %l0, %l1
	jmpl %l1, %g3
	fxors	%f6,	%f0,	%f27
	edge16l	%i7,	%i3,	%g2
	edge16ln	%l4,	%i2,	%o3
loop_270:
	nop
	wr	%g0,	0xe2,	%asi
	stxa	%g1,	[%l7 + 0x78] %asi
	membar	#Sync
	taddcctv	%o1,	%o4,	%i6
	bcc,a	loop_271
	alignaddr	%i5,	%g6,	%i0
	fmovrsne	%o0,	%f1,	%f31
	fpsub16s	%f23,	%f5,	%f28
loop_271:
	edge8l	%o7,	%l0,	%l3
	fcmpeq16	%f2,	%f10,	%o5
	array32	%g7,	%g5,	%l5
	fone	%f22
	nop
	fitod	%f4,	%f12
	fdtos	%f12,	%f23
	mulscc	%o6,	0x148F,	%g4
	tsubcc	%o2,	0x0911,	%l1
	xnorcc	%l2,	%i4,	%i1
	fabsd	%f26,	%f8
	edge8	%l6,	%g3,	%i7
	bgu,a,pt	%icc,	loop_272
	tle	%xcc,	0x6
	movcc	%icc,	%g2,	%i3
	nop
	setx	0x2C5CD3DCC07CBFEE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_272:
	xor	%l4,	0x11B8,	%o3
	set	0x54, %o5
	swapa	[%l7 + %o5] 0x19,	%g1
	tle	%xcc,	0x7
	fxors	%f30,	%f5,	%f7
	movg	%icc,	%i2,	%o4
	alignaddrl	%i6,	%o1,	%g6
	stbar
	add	%i0,	0x0188,	%o0
	fbuge,a	%fcc3,	loop_273
	movpos	%icc,	%i5,	%o7
	orncc	%l0,	%l3,	%o5
	fble	%fcc2,	loop_274
loop_273:
	nop
	setx	0x93845D3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xF941EA4B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f23,	%f18
	movvs	%xcc,	%g7,	%g5
	wr	%g0,	0x04,	%asi
	stha	%l5,	[%l7 + 0x22] %asi
loop_274:
	sir	0x090E
	set	0x76, %i0
	lduha	[%l7 + %i0] 0x88,	%g4
	movvc	%icc,	%o2,	%o6
	tn	%xcc,	0x4
	movneg	%xcc,	%l1,	%i4
	edge32n	%l2,	%l6,	%i1
	nop
	setx	loop_275,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%i7,	%g3,	%g2
	bvc	loop_276
	movrgz	%l4,	0x021,	%i3
loop_275:
	tvc	%icc,	0x4
	ldub	[%l7 + 0x7F],	%o3
loop_276:
	movrgz	%i2,	0x0A0,	%g1
	fbuge,a	%fcc3,	loop_277
	tn	%icc,	0x0
	orn	%o4,	0x17F5,	%o1
	flush	%l7 + 0x60
loop_277:
	tne	%icc,	0x4
	subccc	%i6,	%i0,	%o0
	sub	%g6,	%i5,	%l0
	fexpand	%f18,	%f2
	edge8	%o7,	%o5,	%l3
	movrlez	%g5,	0x1DE,	%l5
	edge8l	%g7,	%g4,	%o2
	sth	%l1,	[%l7 + 0x34]
	taddcctv	%i4,	0x1E29,	%o6
	umul	%l2,	%i1,	%i7
	srax	%g3,	%g2,	%l6
	set	0x3B, %i5
	lduba	[%l7 + %i5] 0x81,	%i3
	tn	%icc,	0x6
	tpos	%xcc,	0x5
	and	%o3,	0x1B11,	%l4
	movre	%i2,	%g1,	%o1
	te	%icc,	0x1
	edge32ln	%i6,	%i0,	%o0
	sll	%g6,	0x09,	%o4
	fbl	%fcc1,	loop_278
	xor	%i5,	%l0,	%o5
	movl	%icc,	%l3,	%o7
	fbul	%fcc1,	loop_279
loop_278:
	fbuge,a	%fcc3,	loop_280
	udivx	%g5,	0x1B63,	%g7
	tleu	%xcc,	0x0
loop_279:
	srlx	%l5,	%g4,	%o2
loop_280:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i4
	edge16ln	%l1,	%o6,	%l2
	fbul	%fcc1,	loop_281
	edge32n	%i1,	%g3,	%i7
	edge8l	%l6,	%i3,	%o3
	orn	%g2,	0x121E,	%l4
loop_281:
	edge8	%i2,	%g1,	%i6
	movrne	%o1,	0x0E4,	%o0
	sllx	%i0,	0x0D,	%g6
	movrlz	%o4,	0x0C4,	%l0
	tneg	%icc,	0x1
	movcs	%icc,	%i5,	%l3
	fpsub32	%f0,	%f4,	%f20
	subc	%o5,	%o7,	%g7
	st	%f9,	[%l7 + 0x24]
	ldsh	[%l7 + 0x28],	%l5
	fbne,a	%fcc0,	loop_282
	move	%icc,	%g5,	%o2
	tle	%xcc,	0x4
	ldub	[%l7 + 0x36],	%g4
loop_282:
	array32	%i4,	%l1,	%l2
	fsrc1s	%f30,	%f2
	bpos,a,pn	%xcc,	loop_283
	subc	%o6,	%g3,	%i1
	taddcc	%l6,	%i3,	%i7
	faligndata	%f2,	%f14,	%f12
loop_283:
	sdiv	%o3,	0x0B54,	%l4
	movn	%xcc,	%g2,	%g1
	bvs,a	loop_284
	stw	%i2,	[%l7 + 0x34]
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f0
	fxtod	%f0,	%f2
	ldsh	[%l7 + 0x74],	%o1
loop_284:
	and	%o0,	0x1109,	%i6
	fands	%f7,	%f8,	%f7
	fpmerge	%f26,	%f25,	%f20
	addc	%i0,	0x0192,	%o4
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x0c
	wr	%g0,	0x27,	%asi
	stba	%l0,	[%l7 + 0x67] %asi
	membar	#Sync
	be,a,pt	%xcc,	loop_285
	or	%g6,	%l3,	%i5
	bvc,a,pt	%xcc,	loop_286
	fbug	%fcc1,	loop_287
loop_285:
	bleu,a	%xcc,	loop_288
	bneg,pn	%icc,	loop_289
loop_286:
	nop
	setx	0xF4590589,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x219790AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f0,	%f18
loop_287:
	movrne	%o5,	0x0E7,	%o7
loop_288:
	fmovdl	%icc,	%f21,	%f3
loop_289:
	nop
	set	0x5C, %i2
	stwa	%g7,	[%l7 + %i2] 0x2a
	membar	#Sync
	fpack16	%f2,	%f29
	tl	%icc,	0x7
	fmovdcs	%xcc,	%f15,	%f13
	wr	%g0,	0x2b,	%asi
	stha	%g5,	[%l7 + 0x4E] %asi
	membar	#Sync
	popc	%o2,	%g4
	bcs,a,pt	%xcc,	loop_290
	andn	%i4,	0x0CE2,	%l5
	tneg	%xcc,	0x4
	set	0x18, %g1
	ldsba	[%l7 + %g1] 0x04,	%l1
loop_290:
	membar	0x6D
	tgu	%icc,	0x3
	edge16ln	%o6,	%g3,	%l2
	fbul	%fcc0,	loop_291
	fmovda	%icc,	%f16,	%f14
	movcc	%xcc,	%i1,	%i3
	bvs,a	loop_292
loop_291:
	swap	[%l7 + 0x78],	%i7
	ldub	[%l7 + 0x57],	%o3
	brnz	%l6,	loop_293
loop_292:
	tg	%xcc,	0x5
	nop
	setx loop_294, %l0, %l1
	jmpl %l1, %l4
	taddcctv	%g2,	0x15C5,	%i2
loop_293:
	tsubcctv	%o1,	%o0,	%g1
	fbu,a	%fcc0,	loop_295
loop_294:
	sdiv	%i0,	0x0A1A,	%o4
	addc	%i6,	0x11B0,	%g6
	array32	%l0,	%i5,	%o5
loop_295:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x28] %asi,	%l3
	fmovd	%f6,	%f8
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x58] %asi,	%g7
	edge32n	%o7,	%g5,	%g4
	taddcctv	%o2,	%i4,	%l5
	sll	%l1,	0x0A,	%o6
	fmovdneg	%xcc,	%f10,	%f3
	movleu	%xcc,	%g3,	%i1
	fmovdn	%icc,	%f9,	%f5
	movneg	%icc,	%l2,	%i7
	edge16ln	%o3,	%i3,	%l4
	movcs	%icc,	%l6,	%g2
	array16	%i2,	%o0,	%g1
	bvc	%xcc,	loop_296
	movcc	%icc,	%i0,	%o1
	movneg	%icc,	%o4,	%g6
	flush	%l7 + 0x08
loop_296:
	edge32l	%l0,	%i5,	%o5
	fbu	%fcc2,	loop_297
	movvs	%xcc,	%i6,	%g7
	fzero	%f22
	flush	%l7 + 0x64
loop_297:
	fmovde	%xcc,	%f20,	%f3
	movneg	%icc,	%o7,	%g5
	nop
	setx	loop_298,	%l0,	%l1
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
	subc	%g4,	0x0771,	%o2
	brlez	%i4,	loop_299
loop_298:
	orncc	%l3,	%l1,	%l5
	nop
	setx	0x507964F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	te	%icc,	0x2
loop_299:
	mulscc	%o6,	0x19D8,	%g3
	fcmpeq32	%f26,	%f28,	%l2
	tle	%xcc,	0x7
	ld	[%l7 + 0x20],	%f28
	fmovscc	%xcc,	%f7,	%f24
	nop
	fitod	%f0,	%f24
	fdtox	%f24,	%f16
	fornot2	%f22,	%f20,	%f4
	edge32ln	%i1,	%i7,	%o3
	sir	0x1DFA
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x57] %asi,	%i3
	nop
	setx	0x9E69D4EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x823B742D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f10,	%f31
	tvs	%icc,	0x2
	srax	%l6,	0x1F,	%g2
	tcc	%icc,	0x3
	ld	[%l7 + 0x60],	%f16
	movge	%icc,	%l4,	%o0
	sub	%i2,	0x0101,	%g1
	ldd	[%l7 + 0x10],	%o0
	sll	%o4,	0x0C,	%i0
	fblg	%fcc2,	loop_300
	tneg	%icc,	0x6
	fnot2s	%f13,	%f16
	edge8n	%l0,	%g6,	%o5
loop_300:
	edge16l	%i6,	%i5,	%g7
	movvc	%xcc,	%g5,	%o7
	orn	%g4,	0x1752,	%o2
	andn	%i4,	0x161C,	%l1
	nop
	setx loop_301, %l0, %l1
	jmpl %l1, %l5
	fpadd16s	%f6,	%f21,	%f2
	fandnot2s	%f29,	%f25,	%f30
	stx	%o6,	[%l7 + 0x18]
loop_301:
	fcmpeq32	%f4,	%f30,	%l3
	umulcc	%l2,	0x0E22,	%g3
	mulscc	%i1,	0x10B4,	%o3
	orn	%i3,	0x1192,	%l6
	tle	%icc,	0x0
	smulcc	%g2,	%l4,	%i7
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f22
	fxtod	%f22,	%f0
	edge8	%o0,	%g1,	%o1
	stx	%i2,	[%l7 + 0x08]
	movg	%xcc,	%i0,	%o4
	ldd	[%l7 + 0x48],	%f10
	tsubcctv	%l0,	%o5,	%i6
	mulx	%g6,	%g7,	%g5
	sdiv	%i5,	0x15B0,	%g4
	fmovscs	%xcc,	%f13,	%f18
	fmovrsgez	%o2,	%f28,	%f12
	fmovsa	%icc,	%f23,	%f10
	fmovsge	%xcc,	%f1,	%f9
	movgu	%xcc,	%o7,	%l1
	sub	%i4,	0x0F41,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x20],	%l3
	xnorcc	%o6,	0x0AE5,	%l2
	bcc,a	%xcc,	loop_302
	move	%icc,	%g3,	%o3
	array32	%i3,	%l6,	%g2
	nop
	setx	loop_303,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_302:
	udivcc	%l4,	0x0D44,	%i7
	fmovrslz	%i1,	%f6,	%f27
	xorcc	%o0,	%o1,	%g1
loop_303:
	ldstub	[%l7 + 0x57],	%i2
	sir	0x1137
	membar	0x02
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i0,	%l0
	bvc,a,pn	%xcc,	loop_304
	smulcc	%o5,	%o4,	%i6
	movneg	%xcc,	%g7,	%g6
	edge32ln	%g5,	%g4,	%o2
loop_304:
	faligndata	%f16,	%f26,	%f28
	fmovsl	%icc,	%f29,	%f18
	andcc	%i5,	0x1864,	%l1
	alignaddr	%o7,	%i4,	%l5
	edge32l	%o6,	%l3,	%l2
	subccc	%g3,	0x0ABF,	%o3
	movl	%icc,	%i3,	%l6
	andncc	%l4,	%g2,	%i7
	brlz,a	%i1,	loop_305
	edge32n	%o0,	%g1,	%i2
	fpsub16s	%f4,	%f15,	%f27
	nop
	setx	0xEA6306B40D31E843,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x2F0DC296DAA70EF5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f30,	%f26
loop_305:
	fnands	%f8,	%f6,	%f26
	srlx	%i0,	%o1,	%l0
	tcc	%icc,	0x7
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%o4
	tge	%icc,	0x4
	udiv	%i6,	0x044A,	%g7
	fmovdge	%xcc,	%f27,	%f23
	nop
	setx	0x8E591F6C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xE40BEADD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f10,	%f23
	fpsub16	%f14,	%f0,	%f26
	edge32	%o5,	%g5,	%g4
	tgu	%xcc,	0x4
	tvs	%xcc,	0x3
	edge8n	%g6,	%i5,	%l1
	fmovdpos	%icc,	%f4,	%f19
	lduw	[%l7 + 0x18],	%o2
	subccc	%o7,	0x1A58,	%i4
	fbuge,a	%fcc2,	loop_306
	fmovdcc	%icc,	%f19,	%f2
	fbu,a	%fcc0,	loop_307
	umul	%l5,	0x03FF,	%l3
loop_306:
	orncc	%l2,	%o6,	%o3
	srlx	%g3,	%l6,	%i3
loop_307:
	orcc	%l4,	%i7,	%i1
	movge	%icc,	%o0,	%g1
	edge32n	%i2,	%i0,	%o1
	fmovrdgez	%g2,	%f14,	%f26
	tn	%icc,	0x5
	smulcc	%l0,	%o4,	%g7
	fmovdl	%icc,	%f27,	%f19
	udivcc	%i6,	0x18C6,	%g5
	fbule	%fcc2,	loop_308
	tle	%xcc,	0x2
	fble,a	%fcc0,	loop_309
	lduh	[%l7 + 0x22],	%o5
loop_308:
	stx	%g4,	[%l7 + 0x08]
	tl	%xcc,	0x4
loop_309:
	sdiv	%g6,	0x07F6,	%i5
	ldd	[%l7 + 0x48],	%f8
	tpos	%xcc,	0x7
	movvs	%icc,	%o2,	%l1
	ta	%icc,	0x6
	ble,a	loop_310
	fmovrsgz	%i4,	%f23,	%f3
	fcmple16	%f2,	%f22,	%l5
	sra	%o7,	0x11,	%l2
loop_310:
	array8	%o6,	%l3,	%o3
	movgu	%xcc,	%l6,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f30,	%f22,	%l4
	umulcc	%g3,	0x0576,	%i7
	ldsh	[%l7 + 0x44],	%o0
	nop
	setx	0xD6E4A9077C5B4963,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x58A1139B21B31298,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f26,	%f14
	tle	%icc,	0x7
	subcc	%g1,	0x0F50,	%i1
	set	0x58, %g4
	lduwa	[%l7 + %g4] 0x19,	%i0
	edge16ln	%o1,	%i2,	%g2
	fmovrdlez	%o4,	%f28,	%f12
	sdivx	%g7,	0x0077,	%i6
	fmovscc	%xcc,	%f21,	%f12
	fmovdleu	%xcc,	%f2,	%f24
	tgu	%icc,	0x2
	fmovdneg	%icc,	%f31,	%f26
	fmovsvs	%xcc,	%f17,	%f20
	set	0x78, %o0
	prefetcha	[%l7 + %o0] 0x88,	 0x0
	tn	%icc,	0x6
	brgez,a	%l0,	loop_311
	fmul8sux16	%f28,	%f16,	%f16
	fandnot2s	%f15,	%f1,	%f27
	ld	[%l7 + 0x34],	%f3
loop_311:
	umul	%g4,	%g6,	%i5
	sth	%o5,	[%l7 + 0x3E]
	bvs,a	%icc,	loop_312
	srl	%o2,	0x1D,	%l1
	edge16ln	%l5,	%o7,	%l2
	sllx	%o6,	0x0C,	%i4
loop_312:
	lduw	[%l7 + 0x18],	%o3
	xorcc	%l3,	%i3,	%l6
	udivcc	%g3,	0x1199,	%l4
	bpos,pt	%icc,	loop_313
	fmovsgu	%xcc,	%f1,	%f19
	movg	%icc,	%i7,	%g1
	sdiv	%o0,	0x1549,	%i1
loop_313:
	lduw	[%l7 + 0x50],	%i0
	xorcc	%o1,	%i2,	%g2
	andncc	%o4,	%g7,	%i6
	fmovsvs	%xcc,	%f4,	%f6
	wr	%g0,	0xea,	%asi
	stba	%g5,	[%l7 + 0x56] %asi
	membar	#Sync
	udivx	%l0,	0x09F6,	%g6
	wr	%g0,	0x18,	%asi
	stba	%i5,	[%l7 + 0x33] %asi
	edge32ln	%g4,	%o2,	%o5
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x25] %asi,	%l1
	movne	%xcc,	%l5,	%l2
	nop
	setx	0xEC2E6FDF2F1DB876,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f22
	movpos	%icc,	%o6,	%i4
	orcc	%o7,	0x0809,	%l3
	tvs	%xcc,	0x3
	bn,a,pt	%xcc,	loop_314
	fxnors	%f30,	%f22,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x14],	%i3
loop_314:
	bg,a,pt	%xcc,	loop_315
	movleu	%xcc,	%l6,	%g3
	sll	%l4,	%o3,	%g1
	ldsw	[%l7 + 0x0C],	%o0
loop_315:
	nop
	wr	%g0,	0xe2,	%asi
	stwa	%i1,	[%l7 + 0x60] %asi
	membar	#Sync
	fxnor	%f8,	%f30,	%f10
	tge	%icc,	0x4
	udivx	%i0,	0x1B27,	%o1
	set	0x48, %i3
	lduwa	[%l7 + %i3] 0x81,	%i2
	fmovsvs	%icc,	%f24,	%f20
	set	0x78, %g7
	ldswa	[%l7 + %g7] 0x0c,	%g2
	srlx	%o4,	%i7,	%g7
	movvc	%xcc,	%g5,	%l0
	tn	%xcc,	0x6
	tne	%xcc,	0x7
	andcc	%g6,	0x1D11,	%i6
	taddcc	%g4,	%i5,	%o5
	tge	%xcc,	0x6
	bl,a,pt	%icc,	loop_316
	edge16ln	%o2,	%l1,	%l5
	fmovdg	%xcc,	%f23,	%f4
	edge16n	%l2,	%o6,	%o7
loop_316:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	wr	%g0,	0xeb,	%asi
	stxa	%i4,	[%l7 + 0x58] %asi
	membar	#Sync
	fbg,a	%fcc2,	loop_317
	umul	%l3,	0x1962,	%i3
	taddcctv	%g3,	0x1EE4,	%l4
	edge32	%l6,	%o3,	%g1
loop_317:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i1,	%o0
	bgu,a	%xcc,	loop_318
	ba,pt	%icc,	loop_319
	orncc	%o1,	%i0,	%i2
	udiv	%o4,	0x17AC,	%i7
loop_318:
	bn,a	%icc,	loop_320
loop_319:
	fblg,a	%fcc0,	loop_321
	fors	%f22,	%f0,	%f30
	fbul,a	%fcc1,	loop_322
loop_320:
	brz,a	%g7,	loop_323
loop_321:
	add	%g5,	0x1194,	%g2
	andcc	%g6,	%i6,	%g4
loop_322:
	brgz,a	%l0,	loop_324
loop_323:
	fsrc1	%f2,	%f10
	taddcc	%o5,	%o2,	%i5
	ldsw	[%l7 + 0x40],	%l1
loop_324:
	subc	%l2,	0x09A5,	%l5
	movl	%xcc,	%o7,	%i4
	edge8	%o6,	%i3,	%g3
	st	%f9,	[%l7 + 0x1C]
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l4
	udiv	%l3,	0x0469,	%o3
	fmovdgu	%icc,	%f24,	%f0
	tgu	%xcc,	0x1
	tcs	%icc,	0x4
	brnz	%l6,	loop_325
	srax	%g1,	%o0,	%o1
	addccc	%i0,	%i2,	%i1
	tleu	%xcc,	0x2
loop_325:
	fmovrsgez	%i7,	%f12,	%f29
	or	%o4,	%g5,	%g7
	tgu	%icc,	0x3
	fmovdge	%xcc,	%f28,	%f31
	tne	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g6,	%g2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g4
	fbul,a	%fcc1,	loop_326
	nop
	setx	0x73AFA99860F2A22D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x765F3F4DC4040AB6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f26,	%f4
	wr	%g0,	0x10,	%asi
	stha	%i6,	[%l7 + 0x64] %asi
loop_326:
	sdivcc	%o5,	0x0713,	%l0
	movcs	%icc,	%o2,	%l1
	orncc	%l2,	0x1B46,	%i5
	smul	%o7,	%i4,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o6,	%i3,	%g3
	bgu	%xcc,	loop_327
	smul	%l4,	0x0232,	%o3
	tcs	%icc,	0x6
	wr	%g0,	0x81,	%asi
	stwa	%l6,	[%l7 + 0x30] %asi
loop_327:
	nop
	fitos	%f6,	%f16
	fstod	%f16,	%f24
	taddcctv	%g1,	0x0B95,	%o0
	fbo,a	%fcc1,	loop_328
	ldsb	[%l7 + 0x36],	%l3
	andcc	%i0,	%i2,	%i1
	fbn	%fcc1,	loop_329
loop_328:
	subc	%i7,	0x0518,	%o1
	udivx	%g5,	0x1AA2,	%o4
	edge16n	%g6,	%g7,	%g2
loop_329:
	xnorcc	%g4,	0x1CDF,	%o5
	fmovrdlez	%i6,	%f12,	%f24
	tleu	%icc,	0x0
	tvc	%icc,	0x4
	wr	%g0,	0x89,	%asi
	stxa	%l0,	[%l7 + 0x48] %asi
	tg	%xcc,	0x1
	be,a	%icc,	loop_330
	fmovdcc	%icc,	%f2,	%f26
	lduh	[%l7 + 0x58],	%l1
	movle	%icc,	%l2,	%i5
loop_330:
	tle	%icc,	0x2
	edge8	%o7,	%i4,	%l5
	addcc	%o6,	0x0215,	%i3
	te	%xcc,	0x5
	edge16l	%o2,	%l4,	%o3
	nop
	setx	0xDF584A629043BF25,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	ldub	[%l7 + 0x0F],	%g3
	fmovscc	%xcc,	%f13,	%f8
	movcc	%xcc,	%l6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f18,	%f31
	fbu	%fcc1,	loop_331
	fbo	%fcc1,	loop_332
	sir	0x035F
	mulscc	%l3,	%g1,	%i0
loop_331:
	sll	%i2,	0x14,	%i1
loop_332:
	umulcc	%o1,	%i7,	%g5
	addcc	%o4,	%g7,	%g2
	nop
	set	0x1A, %i7
	ldsh	[%l7 + %i7],	%g6
	nop
	setx	0x70540CA6,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%o4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	mulscc	%l0,	0x1C09,	%g4
	wr	%g0,	0x2b,	%asi
	stwa	%l2,	[%l7 + 0x3C] %asi
	membar	#Sync
	movn	%xcc,	%l1,	%o7
	edge8n	%i4,	%l5,	%o6
	fpsub32s	%f3,	%f23,	%f19
	movne	%xcc,	%i3,	%o2
	nop
	set	0x58, %i1
	std	%f22,	[%l7 + %i1]
	addcc	%i5,	0x1DF4,	%o3
	movleu	%xcc,	%g3,	%l4
	mulscc	%l6,	%o0,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g1,	%i2
	addccc	%i1,	0x101F,	%i0
	sdiv	%i7,	0x0F24,	%g5
	orcc	%o4,	%o1,	%g2
	fbg	%fcc2,	loop_333
	tn	%icc,	0x4
	add	%g6,	0x0934,	%g7
	ldsh	[%l7 + 0x2E],	%i6
loop_333:
	fblg,a	%fcc1,	loop_334
	brnz	%l0,	loop_335
	sethi	0x09B1,	%g4
	fand	%f24,	%f4,	%f10
loop_334:
	tsubcc	%o5,	0x1C20,	%l1
loop_335:
	edge8ln	%l2,	%o7,	%i4
	fbug	%fcc0,	loop_336
	subccc	%l5,	0x1991,	%o6
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x80,	%o2,	%i3
loop_336:
	movrgz	%i5,	0x20A,	%g3
	bpos,a,pn	%icc,	loop_337
	bpos,a,pn	%xcc,	loop_338
	fxors	%f15,	%f13,	%f27
	tvs	%icc,	0x4
loop_337:
	edge16n	%l4,	%l6,	%o0
loop_338:
	flush	%l7 + 0x14
	fba	%fcc3,	loop_339
	srlx	%l3,	%o3,	%g1
	for	%f26,	%f22,	%f10
	tleu	%xcc,	0x7
loop_339:
	nop
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i2
	sdivcc	%i0,	0x0A3F,	%i7
	orncc	%g5,	%i1,	%o1
	movl	%icc,	%g2,	%g6
	bvs,a,pn	%icc,	loop_340
	orn	%g7,	0x140F,	%o4
	ta	%xcc,	0x4
	orcc	%i6,	0x065D,	%g4
loop_340:
	alignaddrl	%l0,	%l1,	%l2
	fmovsle	%icc,	%f23,	%f30
	call	loop_341
	fnot2	%f30,	%f20
	sllx	%o5,	%i4,	%o7
	swap	[%l7 + 0x18],	%o6
loop_341:
	fmovrdlez	%o2,	%f2,	%f10
	mova	%xcc,	%i3,	%i5
	fmovdcc	%icc,	%f14,	%f15
	orcc	%l5,	0x15C7,	%l4
	nop
	set	0x20, %l1
	ldsw	[%l7 + %l1],	%l6
	popc	%g3,	%l3
	edge16n	%o0,	%o3,	%i2
	brnz	%g1,	loop_342
	xnor	%i7,	0x1278,	%g5
	subcc	%i1,	0x0334,	%o1
	move	%icc,	%g2,	%g6
loop_342:
	membar	0x73
	tleu	%xcc,	0x5
	set	0x7C, %l6
	sta	%f25,	[%l7 + %l6] 0x19
	alignaddr	%i0,	%g7,	%i6
	movrgez	%o4,	0x220,	%l0
	fmovrsgz	%g4,	%f7,	%f18
	set	0x38, %o3
	stha	%l2,	[%l7 + %o3] 0x27
	membar	#Sync
	smul	%o5,	%i4,	%o7
	sllx	%o6,	0x1E,	%l1
	set	0x58, %l3
	lduwa	[%l7 + %l3] 0x89,	%i3
	sdivx	%i5,	0x146F,	%l5
	bcs,a	%xcc,	loop_343
	movrgez	%l4,	%o2,	%g3
	edge16n	%l3,	%o0,	%l6
	flush	%l7 + 0x6C
loop_343:
	edge32ln	%i2,	%o3,	%i7
	movre	%g1,	0x017,	%i1
	addc	%o1,	0x09E1,	%g5
	array32	%g6,	%g2,	%i0
	nop
	setx	0x36931D78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xDCAAA158,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f27,	%f19
	edge16l	%i6,	%g7,	%l0
	srl	%o4,	0x11,	%g4
	movle	%xcc,	%o5,	%l2
	bge,pn	%icc,	loop_344
	nop
	fitos	%f10,	%f17
	fmovdge	%xcc,	%f26,	%f2
	movre	%o7,	0x2B0,	%i4
loop_344:
	fmovsge	%xcc,	%f27,	%f15
	popc	%l1,	%i3
	add	%i5,	0x11FD,	%l5
	alignaddrl	%o6,	%o2,	%l4
	addcc	%l3,	0x0D35,	%g3
	tg	%icc,	0x7
	edge16	%o0,	%i2,	%l6
	fpackfix	%f0,	%f20
	and	%o3,	%i7,	%i1
	fmovdg	%icc,	%f3,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,pt	%xcc,	loop_345
	fmovdpos	%xcc,	%f11,	%f11
	taddcc	%g1,	0x023D,	%g5
	set	0x10, %i4
	swapa	[%l7 + %i4] 0x0c,	%o1
loop_345:
	edge8	%g2,	%i0,	%g6
	sdiv	%g7,	0x047A,	%i6
	stb	%l0,	[%l7 + 0x7B]
	stx	%o4,	[%l7 + 0x30]
	xnorcc	%g4,	0x0DB6,	%o5
	movge	%icc,	%l2,	%o7
	wr	%g0,	0x10,	%asi
	stha	%i4,	[%l7 + 0x5A] %asi
	bneg,pn	%icc,	loop_346
	bn	%xcc,	loop_347
	fmovsneg	%xcc,	%f1,	%f12
	set	0x2C, %l2
	ldswa	[%l7 + %l2] 0x10,	%i3
loop_346:
	fpadd32s	%f15,	%f31,	%f14
loop_347:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	flush	%l7 + 0x24
	fpack32	%f2,	%f16,	%f16
	ldsh	[%l7 + 0x28],	%i5
	lduw	[%l7 + 0x0C],	%l1
	brgz,a	%o6,	loop_348
	andn	%o2,	0x1C64,	%l4
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%l5
loop_348:
	sub	%l3,	0x1DD5,	%o0
	umul	%g3,	%i2,	%l6
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
	fnot1	%f18,	%f0
	addccc	%i7,	%i1,	%g5
	movre	%g1,	%g2,	%i0
	tge	%xcc,	0x6
	tn	%icc,	0x1
	add	%o1,	0x0575,	%g7
	fba,a	%fcc1,	loop_349
	te	%xcc,	0x3
	ldsb	[%l7 + 0x57],	%g6
	bge,a	%xcc,	loop_350
loop_349:
	xorcc	%i6,	%l0,	%o4
	pdist	%f10,	%f28,	%f6
	bvs,a	loop_351
loop_350:
	movrlz	%g4,	0x0D7,	%o5
	fbge,a	%fcc2,	loop_352
	ldub	[%l7 + 0x62],	%l2
loop_351:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a,pt	%xcc,	loop_353
loop_352:
	fmovdgu	%icc,	%f2,	%f10
	fbul,a	%fcc0,	loop_354
	call	loop_355
loop_353:
	movrgez	%i4,	0x183,	%i3
	fmul8x16	%f17,	%f22,	%f24
loop_354:
	tsubcctv	%i5,	0x1D3F,	%l1
loop_355:
	movrgez	%o6,	%o2,	%l4
	edge8n	%l5,	%o7,	%l3
	tcs	%xcc,	0x2
	tl	%xcc,	0x3
	edge16n	%o0,	%i2,	%l6
	nop
	setx	0x705A92A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	movrlez	%g3,	0x02E,	%o3
	sir	0x09CC
	movrlz	%i7,	0x01A,	%g5
	edge8ln	%i1,	%g2,	%g1
	brgz,a	%i0,	loop_356
	sdivcc	%o1,	0x0F98,	%g7
	fmovs	%f10,	%f12
	ld	[%l7 + 0x30],	%f12
loop_356:
	fxors	%f6,	%f9,	%f9
	stw	%g6,	[%l7 + 0x10]
	sllx	%l0,	0x19,	%o4
	fbuge	%fcc3,	loop_357
	fbuge,a	%fcc2,	loop_358
	edge8ln	%g4,	%o5,	%l2
	fmovd	%f26,	%f26
loop_357:
	fbge	%fcc2,	loop_359
loop_358:
	edge16l	%i6,	%i3,	%i5
	movrlez	%i4,	%l1,	%o2
	move	%xcc,	%o6,	%l4
loop_359:
	fandnot1s	%f9,	%f22,	%f28
	fmuld8ulx16	%f27,	%f21,	%f0
	taddcctv	%o7,	0x0162,	%l5
	fbe	%fcc3,	loop_360
	fxors	%f23,	%f29,	%f8
	fnand	%f4,	%f18,	%f24
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x89,	%o0
loop_360:
	bg,pt	%xcc,	loop_361
	ta	%xcc,	0x4
	te	%icc,	0x7
	edge32ln	%i2,	%l6,	%l3
loop_361:
	tsubcc	%o3,	0x01E5,	%g3
	taddcc	%i7,	%g5,	%i1
	orncc	%g1,	%g2,	%o1
	ldd	[%l7 + 0x60],	%i0
	call	loop_362
	stw	%g7,	[%l7 + 0x6C]
	sir	0x16C7
	sra	%l0,	0x14,	%g6
loop_362:
	fand	%f28,	%f4,	%f22
	fbu,a	%fcc2,	loop_363
	mulscc	%o4,	0x08B8,	%o5
	set	0x38, %o7
	stwa	%g4,	[%l7 + %o7] 0x15
loop_363:
	fands	%f17,	%f7,	%f2
	andcc	%i6,	0x157F,	%l2
	fmul8ulx16	%f18,	%f16,	%f26
	addccc	%i5,	%i4,	%i3
	sll	%l1,	%o6,	%l4
	tne	%icc,	0x1
	set	0x43, %o2
	stba	%o2,	[%l7 + %o2] 0x10
	smulcc	%l5,	0x16C7,	%o0
	stbar
	subc	%i2,	0x0E84,	%o7
	fbu,a	%fcc2,	loop_364
	fcmpne32	%f0,	%f10,	%l3
	movgu	%xcc,	%l6,	%g3
	bne,pt	%icc,	loop_365
loop_364:
	tleu	%icc,	0x7
	brgez	%o3,	loop_366
	tsubcctv	%i7,	%i1,	%g5
loop_365:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%o1
loop_366:
	sdivx	%i0,	0x1DA8,	%g7
	fnot1	%f20,	%f16
	fmuld8ulx16	%f13,	%f28,	%f4
	fnot1	%f16,	%f2
	fpadd16	%f12,	%f22,	%f24
	xnorcc	%g2,	0x0FFF,	%g6
	array32	%o4,	%o5,	%l0
	nop
	setx loop_367, %l0, %l1
	jmpl %l1, %g4
	movge	%xcc,	%l2,	%i5
	membar	0x5A
	fands	%f4,	%f3,	%f24
loop_367:
	fmovrsne	%i4,	%f17,	%f10
	fsrc2	%f28,	%f30
	addc	%i6,	0x1D3C,	%l1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x10,	%i3,	%o6
	addc	%l4,	0x08E2,	%o2
	orcc	%o0,	0x006E,	%l5
	tcs	%xcc,	0x1
	sra	%o7,	%i2,	%l6
	edge8ln	%g3,	%l3,	%i7
	smulcc	%i1,	0x10D4,	%g5
	fxnors	%f15,	%f19,	%f18
	tneg	%xcc,	0x3
	alignaddr	%o3,	%g1,	%i0
	edge16n	%g7,	%g2,	%g6
	andncc	%o4,	%o1,	%l0
	ldsw	[%l7 + 0x14],	%o5
	ldstub	[%l7 + 0x73],	%g4
	array16	%i5,	%i4,	%l2
	mulx	%i6,	0x1E03,	%l1
	fmul8sux16	%f30,	%f26,	%f16
	fpadd16s	%f18,	%f23,	%f24
	fcmpne16	%f28,	%f18,	%o6
	ldd	[%l7 + 0x28],	%f16
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x81
	popc	0x0CEE,	%i3
	umulcc	%l4,	0x1A54,	%o0
	fxors	%f30,	%f9,	%f3
	movrlez	%l5,	%o2,	%i2
	bl	loop_368
	fbue,a	%fcc2,	loop_369
	fmovdvc	%icc,	%f1,	%f11
	edge16l	%o7,	%g3,	%l6
loop_368:
	movvc	%icc,	%l3,	%i1
loop_369:
	tvs	%icc,	0x6
	fbe	%fcc2,	loop_370
	movrlez	%g5,	%o3,	%g1
	andcc	%i7,	0x011A,	%i0
	edge32ln	%g2,	%g6,	%o4
loop_370:
	xor	%g7,	0x08A7,	%l0
	edge16l	%o5,	%g4,	%i5
	alignaddrl	%o1,	%i4,	%l2
	fmovsleu	%xcc,	%f30,	%f8
	bgu,a	loop_371
	ldd	[%l7 + 0x40],	%f26
	prefetch	[%l7 + 0x30],	 0x1
	brz,a	%i6,	loop_372
loop_371:
	ldsw	[%l7 + 0x48],	%l1
	wr	%g0,	0x2f,	%asi
	stxa	%o6,	[%l7 + 0x60] %asi
	membar	#Sync
loop_372:
	be	loop_373
	movrlez	%i3,	%o0,	%l4
	addcc	%o2,	0x0ABC,	%i2
	sdiv	%o7,	0x1BAA,	%l5
loop_373:
	sub	%g3,	0x006C,	%l3
	fnand	%f0,	%f4,	%f4
	fmovsgu	%xcc,	%f31,	%f31
	lduh	[%l7 + 0x4E],	%l6
	edge16l	%g5,	%i1,	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i7,	%o3
	smul	%i0,	%g6,	%o4
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brgz,a	%g2,	loop_374
	subcc	%l0,	0x058C,	%o5
	fnands	%f1,	%f29,	%f27
	fpsub16	%f8,	%f6,	%f8
loop_374:
	movrgz	%g4,	%g7,	%o1
	subcc	%i4,	%i5,	%l2
	movge	%xcc,	%i6,	%l1
	edge32n	%i3,	%o0,	%o6
	tsubcctv	%l4,	%i2,	%o2
	array8	%l5,	%g3,	%l3
	sra	%o7,	%g5,	%i1
	fmovrdgz	%g1,	%f4,	%f18
	fmovdle	%icc,	%f31,	%f20
	fmovrse	%l6,	%f21,	%f30
	fpmerge	%f30,	%f21,	%f22
	fmovsa	%icc,	%f10,	%f29
	be,a,pt	%xcc,	loop_375
	edge16	%o3,	%i7,	%g6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%o4
loop_375:
	subcc	%l0,	%g2,	%o5
	ta	%icc,	0x0
	sllx	%g7,	0x0B,	%g4
	stbar
	xnorcc	%i4,	0x1491,	%o1
	xnorcc	%i5,	%l2,	%l1
	andn	%i6,	0x0618,	%o0
	movleu	%xcc,	%o6,	%i3
	tleu	%icc,	0x3
	wr	%g0,	0x19,	%asi
	stxa	%l4,	[%l7 + 0x38] %asi
	edge16n	%i2,	%l5,	%o2
	set	0x76, %l4
	ldstuba	[%l7 + %l4] 0x19,	%g3
	bne,a	loop_376
	edge32	%l3,	%g5,	%i1
	prefetch	[%l7 + 0x3C],	 0x3
	nop
	fitos	%f3,	%f20
	fstoi	%f20,	%f24
loop_376:
	subcc	%g1,	%o7,	%l6
	set	0x0C, %g3
	ldswa	[%l7 + %g3] 0x88,	%i7
	movcs	%icc,	%o3,	%i0
	fxor	%f4,	%f24,	%f0
	mulscc	%g6,	0x1643,	%o4
	umul	%g2,	0x1885,	%o5
	fabss	%f3,	%f12
	movcc	%xcc,	%g7,	%l0
	fpsub16s	%f0,	%f4,	%f12
	set	0x6C, %l5
	stwa	%g4,	[%l7 + %l5] 0x18
	movrlz	%i4,	0x15F,	%o1
	move	%icc,	%l2,	%i5
	set	0x78, %o4
	stxa	%l1,	[%l7 + %o4] 0x19
	fmovdgu	%xcc,	%f31,	%f13
	bgu,a	%xcc,	loop_377
	bneg,pn	%icc,	loop_378
	udivcc	%i6,	0x1D44,	%o0
	smul	%o6,	0x1E46,	%i3
loop_377:
	or	%l4,	%i2,	%o2
loop_378:
	tn	%icc,	0x7
	fmovscs	%icc,	%f18,	%f18
	addcc	%l5,	0x1627,	%g3
	fxor	%f22,	%f18,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f24,	%f13,	%f14
	movrlz	%l3,	%g5,	%g1
	movcc	%icc,	%i1,	%l6
	sethi	0x07C5,	%o7
	addccc	%o3,	%i0,	%g6
	movne	%xcc,	%i7,	%o4
	movle	%icc,	%o5,	%g7
	fabsd	%f26,	%f0
	fbu,a	%fcc3,	loop_379
	movle	%xcc,	%g2,	%l0
	movvc	%xcc,	%i4,	%g4
	tpos	%icc,	0x6
loop_379:
	orn	%o1,	%l2,	%l1
	ta	%icc,	0x6
	edge8ln	%i5,	%i6,	%o0
	tleu	%icc,	0x0
	movle	%xcc,	%i3,	%l4
	ble,pn	%xcc,	loop_380
	edge8l	%o6,	%o2,	%i2
	sdivx	%l5,	0x0BD3,	%l3
	ta	%icc,	0x0
loop_380:
	nop
	set	0x78, %g5
	lduba	[%l7 + %g5] 0x19,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g3,	0x10AF,	%g1
	tneg	%icc,	0x2
	movl	%icc,	%i1,	%o7
	mova	%icc,	%o3,	%i0
	lduh	[%l7 + 0x70],	%l6
	sub	%g6,	%o4,	%o5
	array8	%g7,	%g2,	%i7
	brlz	%i4,	loop_381
	edge16n	%g4,	%l0,	%l2
	fpadd32s	%f12,	%f24,	%f7
	movrgz	%o1,	0x00B,	%l1
loop_381:
	edge16n	%i5,	%i6,	%o0
	fornot2	%f12,	%f24,	%f20
	umul	%i3,	0x0627,	%l4
	taddcctv	%o2,	%o6,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xE584B4E5ECF9A596,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9860F001BC82F4D8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f8,	%f18
	orn	%l5,	0x1E59,	%g5
	umulcc	%l3,	0x1073,	%g3
	set	0x24, %i6
	stwa	%i1,	[%l7 + %i6] 0x80
	xnor	%o7,	0x09DB,	%g1
	mulx	%i0,	0x0100,	%o3
	xorcc	%l6,	%o4,	%g6
	sir	0x1F2A
	tg	%xcc,	0x0
	subcc	%o5,	0x1130,	%g2
	add	%g7,	%i7,	%g4
	array32	%i4,	%l2,	%l0
	udiv	%l1,	0x1842,	%i5
	fbe	%fcc3,	loop_382
	addccc	%i6,	0x1743,	%o0
	movg	%xcc,	%o1,	%l4
	sdivcc	%i3,	0x1A64,	%o2
loop_382:
	fmovsg	%icc,	%f13,	%f23
	fpsub32	%f6,	%f8,	%f24
	sir	0x1F8B
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x30] %asi,	%i2
	movcs	%xcc,	%l5,	%o6
	fbl	%fcc3,	loop_383
	bleu,pn	%xcc,	loop_384
	subccc	%l3,	0x1D78,	%g3
	nop
	setx	loop_385,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_383:
	tge	%xcc,	0x5
loop_384:
	tne	%icc,	0x3
	membar	0x17
loop_385:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x18] %asi,	%i1
	smulcc	%g5,	%g1,	%i0
	movle	%xcc,	%o7,	%o3
	fmovdge	%xcc,	%f23,	%f6
	ldd	[%l7 + 0x30],	%f30
	xor	%o4,	0x1473,	%g6
	fbug,a	%fcc3,	loop_386
	fand	%f22,	%f20,	%f20
	subcc	%l6,	%o5,	%g7
	fpsub32	%f24,	%f8,	%f0
loop_386:
	fxnors	%f29,	%f14,	%f4
	movg	%xcc,	%i7,	%g2
	brnz,a	%g4,	loop_387
	movneg	%icc,	%l2,	%l0
	andcc	%i4,	%i5,	%l1
	orncc	%i6,	0x13C6,	%o1
loop_387:
	orcc	%l4,	%o0,	%o2
	edge8ln	%i2,	%i3,	%l5
	movleu	%xcc,	%l3,	%g3
	nop
	setx	0x005357C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	xor	%o6,	%i1,	%g1
	tn	%xcc,	0x6
	set	0x60, %g2
	lduwa	[%l7 + %g2] 0x88,	%g5
	st	%f10,	[%l7 + 0x68]
	array16	%i0,	%o7,	%o4
	fbo,a	%fcc2,	loop_388
	tsubcctv	%o3,	0x0E84,	%l6
	bvc,pn	%icc,	loop_389
	fbl	%fcc1,	loop_390
loop_388:
	fbge	%fcc2,	loop_391
	movge	%xcc,	%o5,	%g7
loop_389:
	ldx	[%l7 + 0x78],	%i7
loop_390:
	brlz	%g2,	loop_392
loop_391:
	lduh	[%l7 + 0x7C],	%g4
	sll	%g6,	%l0,	%i4
	fxnors	%f30,	%f29,	%f28
loop_392:
	andcc	%i5,	0x1B76,	%l1
	fornot2s	%f31,	%f13,	%f10
	fnor	%f8,	%f16,	%f28
	brz	%i6,	loop_393
	orcc	%l2,	%l4,	%o1
	movvc	%icc,	%o2,	%i2
	movge	%icc,	%o0,	%i3
loop_393:
	add	%l5,	0x12AA,	%l3
	nop
	set	0x40, %o6
	lduw	[%l7 + %o6],	%g3
	set	0x76, %i0
	lduha	[%l7 + %i0] 0x04,	%o6
	tne	%icc,	0x2
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x23,	%g0
	fcmple32	%f6,	%f30,	%i1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x64] %asi,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f31,	%f10
	udivx	%o7,	0x00E7,	%o4
	sra	%i0,	%l6,	%o3
	sdiv	%g7,	0x0CFB,	%i7
	nop
	fitod	%f12,	%f6
	fdtos	%f6,	%f6
	brgez,a	%g2,	loop_394
	fcmpne32	%f8,	%f6,	%g4
	orn	%g6,	%l0,	%i4
	sdiv	%o5,	0x0CCB,	%l1
loop_394:
	tleu	%icc,	0x5
	fbul,a	%fcc2,	loop_395
	sethi	0x0394,	%i5
	orncc	%i6,	%l4,	%o1
	fmovdvc	%icc,	%f9,	%f12
loop_395:
	taddcc	%o2,	0x0B7A,	%i2
	fmovdleu	%xcc,	%f24,	%f30
	andn	%l2,	0x0A05,	%o0
	movge	%icc,	%l5,	%i3
	orn	%g3,	0x1BB2,	%l3
	tpos	%xcc,	0x4
	tl	%xcc,	0x0
	tleu	%icc,	0x7
	nop
	setx	0xF0425D90,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fmovdn	%xcc,	%f14,	%f17
	sll	%o6,	0x05,	%g1
	fones	%f3
	andn	%g5,	0x1095,	%o7
	mulscc	%i1,	0x1C58,	%i0
	andcc	%o4,	%o3,	%l6
	set	0x10, %o1
	ldxa	[%l7 + %o1] 0x18,	%i7
	add	%g7,	0x14C4,	%g2
	tsubcctv	%g6,	%g4,	%l0
	add	%i4,	0x1967,	%o5
	alignaddr	%l1,	%i6,	%i5
	fbn,a	%fcc0,	loop_396
	edge16	%l4,	%o2,	%o1
	nop
	setx	0xC362A0B0F07FAA9A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	edge8l	%i2,	%l2,	%o0
loop_396:
	orn	%l5,	%i3,	%g3
	edge16ln	%l3,	%o6,	%g1
	tsubcc	%o7,	%i1,	%g5
	bl,a,pt	%xcc,	loop_397
	xorcc	%i0,	%o3,	%o4
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_397:
	nop
	setx	0x62AEE23CB0561BA7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	sdivx	%i7,	0x0D98,	%g7
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf0,	%f0
	tsubcc	%g2,	%l6,	%g6
	taddcctv	%g4,	0x1EBB,	%i4
	taddcc	%o5,	%l0,	%l1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	movcs	%icc,	%i6,	%o2
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o1
	bneg	%icc,	loop_398
	fmul8sux16	%f22,	%f16,	%f12
	tne	%icc,	0x5
	srlx	%i2,	%l2,	%l4
loop_398:
	nop
	set	0x0E, %g1
	ldsha	[%l7 + %g1] 0x15,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x1
	sth	%i3,	[%l7 + 0x24]
	fone	%f0
	tge	%xcc,	0x2
	tge	%xcc,	0x6
	tne	%xcc,	0x7
	fmovsne	%xcc,	%f20,	%f20
	stb	%g3,	[%l7 + 0x7C]
	smulcc	%l3,	0x0459,	%o6
	xnorcc	%g1,	%o7,	%l5
	tpos	%icc,	0x6
	andncc	%g5,	%i0,	%o3
	fmul8x16	%f0,	%f20,	%f22
	fmovrde	%i1,	%f16,	%f6
	movge	%xcc,	%i7,	%o4
	membar	0x52
	nop
	setx	0x794F385B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xA9FBB0F4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f10,	%f4
	nop
	setx	0x5396065E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x70E124B5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f30,	%f7
	tleu	%icc,	0x7
	tge	%xcc,	0x0
	popc	%g2,	%l6
	sdiv	%g6,	0x1C15,	%g7
	brgez,a	%i4,	loop_399
	call	loop_400
	for	%f22,	%f26,	%f18
	tne	%icc,	0x1
loop_399:
	movg	%xcc,	%g4,	%o5
loop_400:
	tg	%icc,	0x2
	set	0x68, %i2
	prefetcha	[%l7 + %i2] 0x11,	 0x1
	tsubcc	%l0,	0x173F,	%i6
	mova	%icc,	%o2,	%o1
	orn	%i2,	%i5,	%l2
	movle	%icc,	%o0,	%l4
	fba,a	%fcc1,	loop_401
	fmovdcs	%icc,	%f1,	%f28
	swap	[%l7 + 0x28],	%g3
	edge32ln	%l3,	%i3,	%o6
loop_401:
	bne	loop_402
	movrlez	%o7,	%g1,	%g5
	fbl,a	%fcc3,	loop_403
	movneg	%icc,	%l5,	%o3
loop_402:
	fmovsn	%xcc,	%f10,	%f20
	taddcctv	%i1,	%i0,	%o4
loop_403:
	nop
	setx loop_404, %l0, %l1
	jmpl %l1, %g2
	fpsub32	%f26,	%f8,	%f12
	fblg,a	%fcc0,	loop_405
	for	%f6,	%f12,	%f26
loop_404:
	movrlez	%l6,	%g6,	%i7
	nop
	setx	loop_406,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_405:
	sir	0x0238
	edge16	%i4,	%g4,	%g7
	tne	%icc,	0x1
loop_406:
	tg	%xcc,	0x4
	movrlez	%l1,	%o5,	%l0
	tn	%icc,	0x2
	lduw	[%l7 + 0x24],	%o2
	wr	%g0,	0x22,	%asi
	stxa	%o1,	[%l7 + 0x68] %asi
	membar	#Sync
	bne,pn	%icc,	loop_407
	sth	%i6,	[%l7 + 0x28]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i5,	0x0E70,	%l2
loop_407:
	stbar
	edge8n	%o0,	%i2,	%g3
	tne	%icc,	0x6
	fmovdg	%icc,	%f11,	%f17
	edge32n	%l4,	%l3,	%o6
	edge32l	%i3,	%g1,	%o7
	fmovsgu	%icc,	%f1,	%f11
	movrlez	%g5,	0x0BB,	%l5
	array8	%o3,	%i0,	%o4
	udiv	%i1,	0x0CB1,	%g2
	move	%xcc,	%g6,	%l6
	add	%i4,	%g4,	%i7
	nop
	set	0x64, %o0
	ldsb	[%l7 + %o0],	%l1
	and	%o5,	0x0B5C,	%l0
	bpos,a	loop_408
	mulx	%g7,	%o2,	%o1
	fbule,a	%fcc1,	loop_409
	edge32n	%i5,	%i6,	%l2
loop_408:
	smulcc	%i2,	%g3,	%l4
	movle	%xcc,	%l3,	%o0
loop_409:
	udiv	%i3,	0x1A47,	%g1
	wr	%g0,	0x19,	%asi
	stha	%o7,	[%l7 + 0x54] %asi
	taddcc	%o6,	0x1E5D,	%g5
	movrgz	%l5,	%i0,	%o3
	tl	%icc,	0x2
	fblg,a	%fcc2,	loop_410
	movn	%xcc,	%o4,	%g2
	edge32n	%i1,	%l6,	%g6
	sub	%g4,	0x1CFA,	%i4
loop_410:
	tneg	%xcc,	0x7
	movpos	%icc,	%l1,	%i7
	tcs	%icc,	0x6
	tg	%xcc,	0x4
	tcs	%icc,	0x2
	orcc	%l0,	0x1987,	%o5
	edge16n	%o2,	%g7,	%o1
	smulcc	%i5,	0x017F,	%l2
	membar	0x59
	andcc	%i6,	0x12A4,	%g3
	array32	%l4,	%i2,	%o0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x50] %asi,	%i3
	array32	%g1,	%l3,	%o6
	orncc	%g5,	0x0443,	%l5
	nop
	fitos	%f1,	%f21
	fstox	%f21,	%f16
	array8	%i0,	%o7,	%o4
	fmul8x16au	%f22,	%f9,	%f22
	xnor	%o3,	%i1,	%l6
	movre	%g6,	%g2,	%g4
	fbn,a	%fcc1,	loop_411
	bl	loop_412
	array32	%i4,	%i7,	%l1
	set	0x5C, %g4
	lduwa	[%l7 + %g4] 0x10,	%l0
loop_411:
	edge32ln	%o2,	%g7,	%o5
loop_412:
	sir	0x17AD
	tvs	%icc,	0x5
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f6
	fxtod	%f6,	%f12
	bneg,a	%xcc,	loop_413
	mova	%xcc,	%o1,	%l2
	alignaddr	%i5,	%g3,	%l4
	tne	%icc,	0x6
loop_413:
	bne,a,pn	%xcc,	loop_414
	ldub	[%l7 + 0x4F],	%i6
	edge16	%o0,	%i2,	%g1
	xorcc	%i3,	%l3,	%g5
loop_414:
	ldsw	[%l7 + 0x3C],	%l5
	swap	[%l7 + 0x14],	%o6
	tcc	%xcc,	0x0
	fmovdn	%xcc,	%f18,	%f11
	orn	%i0,	%o4,	%o7
	edge8	%o3,	%i1,	%g6
	fornot2	%f24,	%f22,	%f18
	orn	%l6,	0x1CB9,	%g2
	fcmple16	%f30,	%f28,	%i4
	movneg	%xcc,	%i7,	%g4
	edge16n	%l1,	%l0,	%g7
	xnor	%o2,	%o1,	%o5
	umulcc	%l2,	%i5,	%g3
	fbu	%fcc1,	loop_415
	fpsub16	%f12,	%f30,	%f20
	addc	%i6,	%o0,	%l4
	tge	%icc,	0x0
loop_415:
	nop
	wr	%g0,	0x2a,	%asi
	stba	%g1,	[%l7 + 0x62] %asi
	membar	#Sync
	alignaddr	%i3,	%i2,	%g5
	flush	%l7 + 0x50
	fmovsneg	%xcc,	%f3,	%f21
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f4
	fxtod	%f4,	%f16
	bcs,pn	%xcc,	loop_416
	taddcctv	%l5,	0x1061,	%l3
	movle	%icc,	%o6,	%i0
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x10] %asi,	%o7
loop_416:
	fxnor	%f0,	%f22,	%f30
	fbne,a	%fcc0,	loop_417
	bvc,a,pn	%xcc,	loop_418
	movneg	%xcc,	%o3,	%i1
	array32	%o4,	%l6,	%g6
loop_417:
	alignaddr	%i4,	%g2,	%i7
loop_418:
	movrlz	%l1,	0x02E,	%l0
	alignaddr	%g4,	%o2,	%g7
	movneg	%xcc,	%o1,	%o5
	ldx	[%l7 + 0x70],	%i5
	tl	%icc,	0x4
	movrne	%g3,	%l2,	%i6
	brgz	%o0,	loop_419
	xorcc	%l4,	%g1,	%i2
	fmovdcs	%xcc,	%f30,	%f30
	bl	loop_420
loop_419:
	tleu	%xcc,	0x0
	movrlz	%i3,	%l5,	%l3
	orcc	%g5,	%o6,	%i0
loop_420:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xnor	%o7,	0x11D7,	%i1
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x3C] %asi,	%f15
	andncc	%o4,	%l6,	%g6
	xorcc	%o3,	0x1B4D,	%i4
	popc	%g2,	%l1
	stw	%l0,	[%l7 + 0x28]
	fsrc2	%f18,	%f4
	subcc	%g4,	%i7,	%o2
	mulscc	%g7,	0x1D22,	%o1
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f16
	fxtod	%f16,	%f16
	move	%icc,	%o5,	%g3
	sdiv	%l2,	0x0838,	%i5
	orn	%i6,	0x0E9F,	%l4
	sdivx	%o0,	0x1D4F,	%i2
	edge16l	%g1,	%l5,	%i3
	movl	%icc,	%g5,	%o6
	movg	%icc,	%i0,	%l3
	tneg	%xcc,	0x1
	set	0x74, %i3
	stwa	%o7,	[%l7 + %i3] 0x81
	andncc	%i1,	%o4,	%g6
	sdivcc	%l6,	0x1CE3,	%o3
	addcc	%g2,	%i4,	%l1
	tvc	%icc,	0x3
	orn	%l0,	%i7,	%o2
	bcc,pn	%icc,	loop_421
	prefetch	[%l7 + 0x78],	 0x3
	ba,a,pn	%xcc,	loop_422
	fxors	%f3,	%f23,	%f2
loop_421:
	tn	%icc,	0x7
	movcs	%icc,	%g4,	%g7
loop_422:
	fbg	%fcc1,	loop_423
	bcs,a,pn	%xcc,	loop_424
	edge32l	%o1,	%g3,	%o5
	popc	%i5,	%i6
loop_423:
	ble,pt	%icc,	loop_425
loop_424:
	udivx	%l2,	0x15BC,	%o0
	fornot1	%f16,	%f4,	%f0
	fbne,a	%fcc3,	loop_426
loop_425:
	movn	%icc,	%i2,	%g1
	xorcc	%l4,	0x17D8,	%l5
	udiv	%g5,	0x14CD,	%o6
loop_426:
	movre	%i0,	%i3,	%l3
	fnot1s	%f1,	%f31
	fnot2s	%f10,	%f20
	brnz,a	%i1,	loop_427
	brlez,a	%o4,	loop_428
	subc	%o7,	0x11EF,	%l6
	fornot2s	%f12,	%f25,	%f12
loop_427:
	edge16ln	%g6,	%g2,	%o3
loop_428:
	ba	loop_429
	tcc	%xcc,	0x1
	tn	%icc,	0x3
	fmovsneg	%xcc,	%f31,	%f16
loop_429:
	edge32l	%i4,	%l0,	%l1
	tpos	%xcc,	0x3
	fpsub16s	%f28,	%f27,	%f31
	movle	%icc,	%i7,	%o2
	ldd	[%l7 + 0x58],	%f12
	fpackfix	%f30,	%f15
	smul	%g4,	0x1C29,	%o1
	smul	%g3,	%o5,	%g7
	fbu	%fcc0,	loop_430
	addccc	%i6,	0x0D71,	%i5
	bleu,pt	%xcc,	loop_431
	sdiv	%l2,	0x0BA3,	%o0
loop_430:
	ldsw	[%l7 + 0x64],	%i2
	nop
	setx	loop_432,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_431:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0263,	%l4
	fmovsn	%xcc,	%f14,	%f16
loop_432:
	and	%g1,	0x08F7,	%g5
	nop
	fitos	%f13,	%f23
	edge8n	%l5,	%o6,	%i3
	fbe	%fcc1,	loop_433
	fmovs	%f28,	%f26
	fmovdle	%icc,	%f9,	%f17
	tcc	%xcc,	0x0
loop_433:
	brnz,a	%l3,	loop_434
	edge32l	%i1,	%i0,	%o4
	fcmpgt32	%f22,	%f20,	%o7
	popc	%g6,	%g2
loop_434:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o3
	sdivx	%i4,	0x1823,	%l0
	movcc	%xcc,	%l6,	%l1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%i7
	array32	%o2,	%o1,	%g3
	movcc	%icc,	%o5,	%g4
	sethi	0x1ADB,	%i6
	ldd	[%l7 + 0x28],	%i4
	nop
	fitos	%f2,	%f11
	fstox	%f11,	%f14
	subcc	%g7,	0x1074,	%o0
	array32	%l2,	%i2,	%g1
	umulcc	%l4,	0x0C2D,	%l5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%o6
	srax	%l3,	0x19,	%i3
	fnot2	%f22,	%f20
	movg	%icc,	%i0,	%i1
	tpos	%xcc,	0x2
	fmovsle	%icc,	%f31,	%f26
	nop
	setx loop_435, %l0, %l1
	jmpl %l1, %o7
	xorcc	%o4,	%g6,	%o3
	nop
	setx	loop_436,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%g2,	%l0,	%i4
loop_435:
	udivx	%l1,	0x0D83,	%l6
	nop
	setx loop_437, %l0, %l1
	jmpl %l1, %i7
loop_436:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x7
	umulcc	%o2,	0x0314,	%o1
loop_437:
	tcc	%icc,	0x3
	movre	%o5,	0x362,	%g4
	tvs	%icc,	0x0
	xnorcc	%i6,	0x030C,	%g3
	popc	0x1214,	%i5
	xor	%g7,	%l2,	%i2
	tl	%xcc,	0x0
	edge32l	%o0,	%l4,	%l5
	udiv	%g5,	0x126F,	%g1
	movvc	%icc,	%l3,	%i3
	tpos	%xcc,	0x2
	movl	%xcc,	%i0,	%o6
	popc	0x0E5B,	%i1
	ldd	[%l7 + 0x18],	%f14
	fsrc1s	%f31,	%f18
	mova	%icc,	%o7,	%o4
	fbul,a	%fcc2,	loop_438
	fexpand	%f31,	%f4
	tneg	%icc,	0x2
	movre	%g6,	0x2F6,	%o3
loop_438:
	sdivcc	%g2,	0x0B2F,	%i4
	popc	%l1,	%l6
	fmul8sux16	%f30,	%f18,	%f22
	movl	%icc,	%l0,	%i7
	addcc	%o2,	%o5,	%o1
	array16	%i6,	%g3,	%g4
	nop
	setx	0xD72DDC02,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xE18F34AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f26,	%f13
	bgu,a,pn	%icc,	loop_439
	nop
	setx	loop_440,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%i5,	%l2,	%g7
	fmovdcs	%icc,	%f21,	%f9
loop_439:
	fmovrdgz	%i2,	%f0,	%f4
loop_440:
	tl	%icc,	0x2
	fbul,a	%fcc3,	loop_441
	fnor	%f20,	%f4,	%f18
	sdiv	%l4,	0x1ED4,	%o0
	fmovscs	%icc,	%f10,	%f15
loop_441:
	mulx	%l5,	0x1E7E,	%g5
	sir	0x1D8A
	tcc	%icc,	0x7
	array8	%l3,	%i3,	%g1
	ldstub	[%l7 + 0x2A],	%i0
	set	0x7C, %i7
	ldswa	[%l7 + %i7] 0x81,	%o6
	tne	%xcc,	0x2
	edge8	%o7,	%o4,	%i1
	srlx	%g6,	%g2,	%i4
	udivcc	%l1,	0x1498,	%o3
	fmul8ulx16	%f24,	%f12,	%f12
	edge32ln	%l0,	%l6,	%o2
	movrne	%o5,	0x3AE,	%o1
	ldx	[%l7 + 0x78],	%i7
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovs	%f9,	%f18
	fblg	%fcc2,	loop_442
	movle	%icc,	%i6,	%g4
	nop
	setx	loop_443,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bshuffle	%f14,	%f24,	%f20
loop_442:
	fmovdne	%xcc,	%f29,	%f16
	bl,a,pn	%xcc,	loop_444
loop_443:
	edge32ln	%i5,	%l2,	%g7
	move	%icc,	%i2,	%g3
	fexpand	%f22,	%f26
loop_444:
	alignaddrl	%o0,	%l5,	%l4
	fnot1	%f10,	%f22
	nop
	setx	loop_445,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smul	%l3,	%g5,	%g1
	set	0x73, %g7
	ldsba	[%l7 + %g7] 0x14,	%i3
loop_445:
	fone	%f8
	movneg	%icc,	%o6,	%o7
	addcc	%i0,	0x002E,	%i1
	fmovsne	%icc,	%f27,	%f14
	fbue,a	%fcc2,	loop_446
	tvc	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x1A] %asi,	%o4
loop_446:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	fitos	%f12,	%f8
	fstod	%f8,	%f16
	edge8l	%g2,	%g6,	%i4
	membar	0x5C
	movl	%icc,	%o3,	%l0
	fand	%f2,	%f2,	%f20
	addccc	%l6,	0x14FF,	%l1
	fandnot2s	%f28,	%f8,	%f24
	fmovrdgez	%o5,	%f26,	%f10
	fnand	%f12,	%f26,	%f30
	addc	%o1,	%i7,	%i6
	subc	%g4,	0x0651,	%i5
	edge16l	%l2,	%o2,	%i2
	fmovde	%xcc,	%f4,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g3,	0x16D3,	%g7
	stb	%o0,	[%l7 + 0x20]
	bgu,a	loop_447
	move	%xcc,	%l5,	%l3
	and	%l4,	0x0D44,	%g1
	movvc	%icc,	%i3,	%o6
loop_447:
	movg	%xcc,	%g5,	%o7
	fandnot1	%f18,	%f16,	%f12
	for	%f20,	%f0,	%f22
	stw	%i0,	[%l7 + 0x5C]
	fbu	%fcc3,	loop_448
	fpadd16	%f18,	%f16,	%f0
	brlz,a	%i1,	loop_449
	fand	%f10,	%f18,	%f10
loop_448:
	tvs	%xcc,	0x0
	movle	%icc,	%g2,	%g6
loop_449:
	smul	%i4,	0x1589,	%o4
	movne	%icc,	%l0,	%o3
	andncc	%l6,	%o5,	%o1
	xnor	%i7,	0x03F5,	%l1
	edge8l	%i6,	%i5,	%g4
	bge	loop_450
	taddcctv	%l2,	%o2,	%g3
	sra	%g7,	%o0,	%i2
	call	loop_451
loop_450:
	sra	%l5,	%l3,	%g1
	set	0x2C, %l1
	lda	[%l7 + %l1] 0x04,	%f3
loop_451:
	edge32ln	%l4,	%o6,	%i3
	tge	%xcc,	0x3
	movrne	%o7,	%i0,	%i1
	membar	0x26
	fmovdvc	%icc,	%f17,	%f9
	subc	%g2,	%g6,	%i4
	fnot1s	%f31,	%f31
	fornot2	%f12,	%f22,	%f26
	set	0x1A, %l6
	ldsha	[%l7 + %l6] 0x11,	%o4
	bne,a	%xcc,	loop_452
	movn	%icc,	%l0,	%o3
	udivx	%l6,	0x160C,	%o5
	movcs	%icc,	%o1,	%i7
loop_452:
	udivx	%l1,	0x0EC9,	%g5
	nop
	setx	0xE0722B1D,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	edge16l	%i6,	%g4,	%i5
	fmovdneg	%icc,	%f29,	%f24
	fmovrsgez	%l2,	%f28,	%f12
	sethi	0x0C84,	%o2
	edge32l	%g3,	%o0,	%g7
	edge32n	%l5,	%l3,	%g1
	fbg	%fcc1,	loop_453
	fmul8x16al	%f5,	%f24,	%f30
	edge32ln	%i2,	%o6,	%i3
	nop
	setx	0xC63BACF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC37624D5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f30,	%f4
loop_453:
	subc	%l4,	0x0877,	%o7
	alignaddr	%i0,	%i1,	%g6
	taddcc	%i4,	%g2,	%o4
	addc	%l0,	%l6,	%o5
	fnot1s	%f7,	%f26
	movge	%xcc,	%o1,	%i7
	movg	%icc,	%o3,	%g5
	movvc	%xcc,	%i6,	%l1
	mulscc	%g4,	%i5,	%l2
	edge8l	%o2,	%o0,	%g3
	sdiv	%g7,	0x0B0E,	%l5
	wr	%g0,	0x80,	%asi
	stha	%g1,	[%l7 + 0x08] %asi
	nop
	setx	0xB07D849C,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	edge32	%i2,	%o6,	%i3
	udivcc	%l3,	0x0BBD,	%o7
	tcs	%xcc,	0x1
	fnot2s	%f7,	%f3
	movvc	%xcc,	%l4,	%i1
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovsgu	%xcc,	%f30,	%f22
	movrgz	%i0,	%g6,	%i4
	orcc	%o4,	0x1BC5,	%g2
	bpos	loop_454
	udiv	%l6,	0x03AC,	%l0
	fpsub16	%f8,	%f12,	%f4
	orcc	%o5,	%i7,	%o3
loop_454:
	orncc	%o1,	%i6,	%l1
	tpos	%icc,	0x7
	orcc	%g4,	0x0319,	%g5
	movvc	%xcc,	%i5,	%l2
	movrlez	%o0,	0x272,	%g3
	membar	0x5A
	tsubcc	%o2,	%l5,	%g7
	fpack16	%f30,	%f31
	fand	%f0,	%f2,	%f20
	fbu	%fcc2,	loop_455
	ble,pn	%xcc,	loop_456
	edge8ln	%g1,	%i2,	%o6
	andcc	%l3,	0x079B,	%o7
loop_455:
	subc	%l4,	0x1C7C,	%i3
loop_456:
	sethi	0x1852,	%i0
	movpos	%icc,	%i1,	%g6
	edge16n	%o4,	%g2,	%l6
	mulscc	%l0,	%o5,	%i7
	fsrc2s	%f15,	%f11
	tl	%icc,	0x3
	popc	%o3,	%o1
	addc	%i6,	%l1,	%g4
	addc	%i4,	0x1274,	%i5
	fsrc2s	%f14,	%f30
	fbug	%fcc0,	loop_457
	fba,a	%fcc1,	loop_458
	umulcc	%l2,	0x0754,	%g5
	fxnor	%f16,	%f2,	%f30
loop_457:
	edge8	%o0,	%o2,	%g3
loop_458:
	xorcc	%l5,	0x1D37,	%g7
	fbge	%fcc2,	loop_459
	tcs	%xcc,	0x3
	movgu	%icc,	%i2,	%o6
	brlez	%g1,	loop_460
loop_459:
	ble,pn	%xcc,	loop_461
	fzero	%f0
	sir	0x0FDD
loop_460:
	sdivcc	%l3,	0x12A9,	%l4
loop_461:
	smul	%o7,	0x0114,	%i3
	fmovd	%f14,	%f10
	edge8n	%i1,	%g6,	%o4
	nop
	setx	0xA074E18A,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	movrgez	%i0,	%g2,	%l0
	nop
	fitos	%f5,	%f15
	fstoi	%f15,	%f16
	tne	%xcc,	0x0
	pdist	%f14,	%f14,	%f26
	fpsub16s	%f23,	%f19,	%f21
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x22,	%i6
	orn	%o5,	%o3,	%i7
	taddcctv	%i6,	0x0605,	%o1
	nop
	fitod	%f4,	%f0
	fdtos	%f0,	%f12
	bn,a,pt	%icc,	loop_462
	tneg	%icc,	0x7
	fcmple16	%f20,	%f18,	%l1
	movvc	%xcc,	%i4,	%i5
loop_462:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x70] %asi,	%g4
	movg	%xcc,	%l2,	%g5
	movrlez	%o0,	0x09D,	%o2
	mulx	%l5,	0x12F6,	%g3
	fmovsg	%xcc,	%f8,	%f14
	tpos	%icc,	0x5
	udivcc	%i2,	0x04B8,	%g7
	fmuld8sux16	%f14,	%f20,	%f16
	edge16	%g1,	%l3,	%o6
	fmovdcc	%xcc,	%f16,	%f1
	add	%l4,	%o7,	%i3
	tn	%icc,	0x2
	nop
	set	0x58, %o3
	lduh	[%l7 + %o3],	%i1
	fpackfix	%f24,	%f24
	te	%xcc,	0x5
	orncc	%o4,	0x18C9,	%i0
	udiv	%g6,	0x1520,	%g2
	sdivx	%l0,	0x084C,	%o5
	edge16ln	%l6,	%i7,	%o3
	edge8n	%i6,	%l1,	%o1
	nop
	setx	0x227CFAFB04D8EC95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f24
	or	%i4,	%g4,	%i5
	fbule,a	%fcc3,	loop_463
	stbar
	edge32	%g5,	%l2,	%o0
	set	0x48, %i4
	ldswa	[%l7 + %i4] 0x15,	%l5
loop_463:
	udiv	%g3,	0x00C6,	%i2
	fnors	%f0,	%f22,	%f9
	fmovsneg	%xcc,	%f25,	%f22
	for	%f22,	%f0,	%f26
	fandnot2s	%f26,	%f17,	%f15
	orcc	%o2,	0x1246,	%g1
	nop
	setx	0x38B915C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xCEB6458D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f13,	%f8
	sub	%g7,	%o6,	%l4
	xnorcc	%l3,	%i3,	%i1
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x80,	%f16
	ta	%xcc,	0x4
	te	%xcc,	0x3
	ldd	[%l7 + 0x30],	%f18
	set	0x50, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o7
	nop
	setx	loop_464,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%o4,	%g6,	%g2
	and	%i0,	0x0CCE,	%l0
	xor	%o5,	%i7,	%o3
loop_464:
	alignaddrl	%i6,	%l6,	%l1
	subc	%i4,	%o1,	%g4
	ta	%xcc,	0x4
	orcc	%i5,	0x0020,	%l2
	fbuge,a	%fcc0,	loop_465
	movle	%icc,	%g5,	%o0
	sub	%l5,	0x0DDF,	%i2
	movcc	%xcc,	%o2,	%g1
loop_465:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x28] %asi,	%g7
	fmovrdgez	%o6,	%f18,	%f14
	tsubcctv	%g3,	%l3,	%l4
	fmovrdlz	%i1,	%f12,	%f2
	sdivcc	%o7,	0x06FD,	%i3
	movgu	%icc,	%o4,	%g2
	movleu	%xcc,	%i0,	%l0
	fpadd16	%f2,	%f4,	%f24
	set	0x37, %l3
	lduba	[%l7 + %l3] 0x88,	%o5
	tneg	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x40] %asi,	%f17
	fmovde	%icc,	%f18,	%f15
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x4C] %asi,	%i7
	fbule	%fcc1,	loop_466
	mulscc	%o3,	%i6,	%g6
	edge16n	%l1,	%l6,	%o1
	edge8	%g4,	%i5,	%i4
loop_466:
	lduh	[%l7 + 0x4E],	%l2
	edge32	%o0,	%g5,	%l5
	fcmpeq32	%f8,	%f16,	%o2
	fbe	%fcc2,	loop_467
	fbg,a	%fcc3,	loop_468
	nop
	setx	0x6078FF2C,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	tcc	%xcc,	0x2
loop_467:
	bvs	%xcc,	loop_469
loop_468:
	sll	%i2,	%g1,	%o6
	te	%xcc,	0x4
	movvc	%icc,	%g7,	%l3
loop_469:
	taddcctv	%l4,	%i1,	%o7
	fpmerge	%f7,	%f7,	%f4
	fpadd32	%f16,	%f10,	%f26
	srlx	%i3,	0x1F,	%g3
	set	0x30, %o2
	sta	%f23,	[%l7 + %o2] 0x11
	tg	%icc,	0x0
	bge,a	%xcc,	loop_470
	movrne	%o4,	0x35E,	%i0
	ldd	[%l7 + 0x78],	%f8
	tvs	%icc,	0x2
loop_470:
	array8	%g2,	%l0,	%o5
	tn	%xcc,	0x0
	nop
	fitos	%f9,	%f20
	fstox	%f20,	%f18
	movcc	%icc,	%i7,	%i6
	xorcc	%o3,	0x16D8,	%l1
	brlez	%g6,	loop_471
	tg	%icc,	0x4
	fbl,a	%fcc3,	loop_472
	add	%l6,	0x16EF,	%o1
loop_471:
	fbul,a	%fcc2,	loop_473
	popc	0x0938,	%g4
loop_472:
	fzeros	%f13
	subccc	%i5,	0x1ECE,	%l2
loop_473:
	sra	%o0,	0x19,	%g5
	movcc	%icc,	%i4,	%o2
	movrne	%l5,	%i2,	%g1
	andncc	%g7,	%o6,	%l4
	fbge	%fcc3,	loop_474
	sra	%i1,	%l3,	%o7
	fcmple32	%f30,	%f24,	%g3
	fsrc1	%f16,	%f16
loop_474:
	orncc	%o4,	0x0E78,	%i0
	mulscc	%g2,	0x1C35,	%l0
	fornot2	%f16,	%f30,	%f30
	stw	%i3,	[%l7 + 0x68]
	movcc	%icc,	%i7,	%o5
	fmovse	%icc,	%f19,	%f18
	std	%f4,	[%l7 + 0x10]
	movvc	%xcc,	%i6,	%o3
	alignaddrl	%l1,	%g6,	%l6
	brnz	%o1,	loop_475
	movleu	%xcc,	%i5,	%g4
	ble,a	%icc,	loop_476
	mulx	%l2,	%g5,	%o0
loop_475:
	movg	%xcc,	%i4,	%l5
	nop
	fitos	%f13,	%f20
	fstox	%f20,	%f20
loop_476:
	udivx	%i2,	0x0380,	%o2
	bcc	%xcc,	loop_477
	fmovrsgez	%g1,	%f14,	%f29
	fbug	%fcc2,	loop_478
	sdivcc	%g7,	0x00FF,	%o6
loop_477:
	mova	%xcc,	%i1,	%l4
	movne	%icc,	%l3,	%g3
loop_478:
	movrne	%o4,	0x121,	%o7
	fbg,a	%fcc1,	loop_479
	addcc	%i0,	0x0705,	%l0
	set	0x08, %o7
	ldsha	[%l7 + %o7] 0x19,	%i3
loop_479:
	fors	%f25,	%f9,	%f5
	fmovdgu	%xcc,	%f10,	%f25
	fmovsgu	%xcc,	%f31,	%f5
	andn	%i7,	%o5,	%i6
	subccc	%g2,	0x0664,	%o3
	edge8	%l1,	%l6,	%o1
	sir	0x0261
	fba,a	%fcc3,	loop_480
	fnot2s	%f28,	%f0
	set	0x30, %l0
	ldsba	[%l7 + %l0] 0x04,	%i5
loop_480:
	subccc	%g6,	%g4,	%l2
	fmovrsgz	%o0,	%f21,	%f11
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x4C] %asi,	%f4
	tn	%icc,	0x7
	tne	%icc,	0x4
	add	%g5,	0x1535,	%i4
	fmovscs	%icc,	%f30,	%f14
	bgu	loop_481
	orn	%i2,	%o2,	%g1
	udiv	%g7,	0x0DF2,	%l5
	udivx	%i1,	0x04A0,	%o6
loop_481:
	movn	%icc,	%l3,	%g3
	sra	%o4,	0x00,	%o7
	nop
	setx loop_482, %l0, %l1
	jmpl %l1, %i0
	fmovsne	%icc,	%f9,	%f31
	orn	%l4,	%l0,	%i7
	set	0x78, %g3
	stwa	%o5,	[%l7 + %g3] 0x2a
	membar	#Sync
loop_482:
	fxor	%f30,	%f30,	%f6
	srl	%i6,	%g2,	%i3
	edge16ln	%l1,	%l6,	%o3
	tsubcctv	%o1,	0x1985,	%i5
	tg	%icc,	0x6
	array32	%g4,	%l2,	%o0
	xnor	%g5,	%g6,	%i2
	bneg	loop_483
	movrlez	%i4,	%g1,	%o2
	movrgez	%l5,	%i1,	%o6
	tneg	%icc,	0x7
loop_483:
	mova	%xcc,	%l3,	%g7
	fbuge,a	%fcc2,	loop_484
	fmovsg	%icc,	%f21,	%f25
	mova	%icc,	%g3,	%o7
	addc	%i0,	0x03CE,	%l4
loop_484:
	movge	%icc,	%o4,	%i7
	fmovsa	%icc,	%f28,	%f19
	be	%xcc,	loop_485
	nop
	setx	loop_486,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32	%l0,	%i6,	%o5
	tn	%xcc,	0x0
loop_485:
	stb	%g2,	[%l7 + 0x61]
loop_486:
	sdiv	%i3,	0x1850,	%l6
	bpos,a,pn	%xcc,	loop_487
	addccc	%o3,	0x045B,	%o1
	orn	%i5,	%l1,	%l2
	edge16	%g4,	%o0,	%g5
loop_487:
	tgu	%xcc,	0x6
	wr	%g0,	0xe3,	%asi
	stxa	%i2,	[%l7 + 0x28] %asi
	membar	#Sync
	andcc	%g6,	%g1,	%o2
	fpadd32	%f20,	%f14,	%f10
	tneg	%xcc,	0x1
	orncc	%l5,	0x1BFC,	%i4
	fmovda	%xcc,	%f20,	%f12
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x60] %asi,	%i1
	movrne	%o6,	0x352,	%g7
	subcc	%g3,	%o7,	%l3
	fzero	%f16
	tge	%icc,	0x5
	xnorcc	%l4,	%i0,	%o4
	nop
	setx	loop_488,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andncc	%i7,	%i6,	%l0
	edge16n	%g2,	%i3,	%l6
	tneg	%icc,	0x5
loop_488:
	sra	%o5,	%o1,	%i5
	tgu	%icc,	0x5
	set	0x26, %l4
	ldsba	[%l7 + %l4] 0x19,	%l1
	srl	%o3,	%g4,	%o0
	movrlez	%g5,	%l2,	%i2
	popc	0x1CC9,	%g6
	fmovscc	%xcc,	%f6,	%f9
	xnor	%o2,	0x1D84,	%g1
	movrgz	%l5,	%i1,	%o6
	stb	%g7,	[%l7 + 0x53]
	stw	%g3,	[%l7 + 0x14]
	edge16n	%i4,	%l3,	%l4
	alignaddr	%i0,	%o4,	%o7
	nop
	fitos	%f5,	%f5
	fstox	%f5,	%f14
	fxtos	%f14,	%f3
	fbo	%fcc2,	loop_489
	movre	%i6,	%i7,	%g2
	edge16n	%i3,	%l6,	%l0
	set	0x38, %l5
	lduwa	[%l7 + %l5] 0x0c,	%o5
loop_489:
	nop
	set	0x4C, %g5
	stwa	%i5,	[%l7 + %g5] 0x2b
	membar	#Sync
	brz	%l1,	loop_490
	xorcc	%o1,	%g4,	%o0
	fmovsl	%xcc,	%f12,	%f16
	move	%xcc,	%o3,	%l2
loop_490:
	movleu	%icc,	%i2,	%g6
	addcc	%o2,	0x0244,	%g1
	nop
	setx	0x3FC3A9B6101969B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xCCBED77263DDF4A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f24,	%f12
	fnands	%f8,	%f18,	%f17
	fba,a	%fcc1,	loop_491
	smulcc	%g5,	%i1,	%o6
	bpos,a,pt	%xcc,	loop_492
	te	%xcc,	0x6
loop_491:
	fbu,a	%fcc2,	loop_493
	taddcc	%l5,	0x060C,	%g7
loop_492:
	fmovrslz	%g3,	%f5,	%f28
	movl	%icc,	%i4,	%l4
loop_493:
	array32	%i0,	%o4,	%l3
	fmul8x16	%f27,	%f16,	%f8
	tleu	%xcc,	0x5
	fmovsgu	%xcc,	%f28,	%f18
	nop
	fitos	%f22,	%f26
	fblg	%fcc3,	loop_494
	sdiv	%o7,	0x130A,	%i7
	or	%i6,	0x0F61,	%g2
	subccc	%i3,	0x1CA9,	%l0
loop_494:
	udiv	%l6,	0x1DFB,	%o5
	array16	%i5,	%l1,	%g4
	fbge	%fcc2,	loop_495
	sra	%o0,	0x1F,	%o1
	fors	%f20,	%f9,	%f27
	fmovrslz	%l2,	%f15,	%f6
loop_495:
	ldx	[%l7 + 0x10],	%i2
	fmul8x16au	%f22,	%f18,	%f10
	movgu	%xcc,	%g6,	%o3
	movleu	%icc,	%g1,	%o2
	ldub	[%l7 + 0x63],	%g5
	nop
	setx loop_496, %l0, %l1
	jmpl %l1, %i1
	stb	%l5,	[%l7 + 0x5B]
	andcc	%o6,	%g7,	%g3
	tne	%xcc,	0x7
loop_496:
	orcc	%i4,	%i0,	%l4
	add	%o4,	0x1CB3,	%l3
	nop
	setx	loop_497,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16au	%f22,	%f22,	%f30
	bgu,pn	%icc,	loop_498
	srl	%o7,	0x1B,	%i7
loop_497:
	brgz	%i6,	loop_499
	xnor	%g2,	0x0FC6,	%l0
loop_498:
	fbuge,a	%fcc3,	loop_500
	addc	%l6,	%o5,	%i5
loop_499:
	tsubcc	%i3,	%g4,	%l1
	smulcc	%o0,	%l2,	%o1
loop_500:
	mulscc	%g6,	%o3,	%g1
	be,pn	%xcc,	loop_501
	srax	%i2,	%g5,	%i1
	bl	%icc,	loop_502
	mulx	%o2,	%o6,	%l5
loop_501:
	fbu,a	%fcc1,	loop_503
	alignaddrl	%g3,	%i4,	%i0
loop_502:
	fbl	%fcc1,	loop_504
	edge8ln	%l4,	%g7,	%o4
loop_503:
	movrgez	%l3,	%o7,	%i6
	xnorcc	%g2,	%l0,	%i7
loop_504:
	edge16n	%l6,	%i5,	%o5
	and	%g4,	0x1708,	%i3
	or	%l1,	%o0,	%l2
	movrlz	%o1,	%o3,	%g1
	movge	%icc,	%g6,	%g5
	edge16	%i2,	%i1,	%o6
	pdist	%f2,	%f26,	%f8
	fbne,a	%fcc3,	loop_505
	membar	0x47
	alignaddrl	%l5,	%o2,	%g3
	movvc	%icc,	%i0,	%l4
loop_505:
	movgu	%xcc,	%g7,	%i4
	set	0x10, %o4
	ldxa	[%l7 + %o4] 0x14,	%o4
	movl	%xcc,	%l3,	%i6
	movcs	%icc,	%g2,	%l0
	or	%i7,	%o7,	%l6
	udiv	%o5,	0x10F3,	%g4
	fandnot2	%f26,	%f2,	%f4
	xorcc	%i3,	%l1,	%o0
	fpsub16	%f2,	%f14,	%f14
	andncc	%i5,	%l2,	%o3
	wr	%g0,	0x89,	%asi
	stxa	%g1,	[%l7 + 0x58] %asi
	fandnot1	%f4,	%f24,	%f12
	array32	%o1,	%g6,	%i2
	umulcc	%g5,	%i1,	%l5
	taddcctv	%o2,	%o6,	%g3
	alignaddrl	%i0,	%l4,	%i4
	fble	%fcc2,	loop_506
	sll	%g7,	0x12,	%l3
	movpos	%icc,	%o4,	%i6
	fbn,a	%fcc0,	loop_507
loop_506:
	fcmpgt16	%f8,	%f24,	%g2
	movcs	%icc,	%i7,	%l0
	nop
	setx	0xF17661A9405031D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_507:
	tcs	%xcc,	0x5
	edge32	%o7,	%l6,	%o5
	edge32ln	%g4,	%i3,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%l1,	loop_508
	movle	%icc,	%l2,	%o3
	stb	%i5,	[%l7 + 0x08]
	edge16	%o1,	%g1,	%i2
loop_508:
	membar	0x03
	set	0x10, %i6
	lduha	[%l7 + %i6] 0x14,	%g6
	edge16l	%g5,	%i1,	%o2
	movl	%xcc,	%o6,	%l5
	fbne,a	%fcc2,	loop_509
	and	%i0,	%g3,	%l4
	nop
	setx	loop_510,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsb	[%l7 + 0x21],	%i4
loop_509:
	fmovrdgz	%g7,	%f20,	%f30
	brgz,a	%o4,	loop_511
loop_510:
	sll	%l3,	0x06,	%i6
	ldx	[%l7 + 0x50],	%g2
	tleu	%xcc,	0x5
loop_511:
	edge32ln	%l0,	%o7,	%i7
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x26] %asi,	%l6
	fmovrdlez	%o5,	%f12,	%f2
	stb	%i3,	[%l7 + 0x78]
	mulx	%o0,	%g4,	%l1
	subc	%o3,	0x0CF5,	%i5
	bcs	%icc,	loop_512
	fandnot1s	%f25,	%f13,	%f6
	fmovsvc	%xcc,	%f19,	%f2
	fbue,a	%fcc2,	loop_513
loop_512:
	tge	%xcc,	0x3
	edge16ln	%l2,	%g1,	%o1
	mulx	%g6,	%g5,	%i2
loop_513:
	andncc	%i1,	%o6,	%l5
	movn	%xcc,	%i0,	%o2
	movne	%xcc,	%g3,	%l4
	tcs	%xcc,	0x2
	ldstub	[%l7 + 0x45],	%i4
	nop
	setx	0x3EA32C99,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x7AE79ABD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f18,	%f26
	bcs,pt	%icc,	loop_514
	stx	%o4,	[%l7 + 0x58]
	fbn,a	%fcc0,	loop_515
	nop
	setx	loop_516,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_514:
	flush	%l7 + 0x58
	edge32l	%l3,	%g7,	%g2
loop_515:
	sllx	%i6,	%o7,	%l0
loop_516:
	nop
	setx	0x8048A023,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	fbule,a	%fcc3,	loop_517
	movrlz	%i7,	0x3F6,	%l6
	tcs	%xcc,	0x3
	orncc	%i3,	%o5,	%g4
loop_517:
	edge16n	%o0,	%l1,	%i5
	st	%f28,	[%l7 + 0x38]
	stx	%l2,	[%l7 + 0x58]
	swap	[%l7 + 0x18],	%g1
	fcmpne32	%f4,	%f24,	%o1
	tcs	%xcc,	0x5
	udivcc	%g6,	0x196F,	%g5
	bg,pn	%icc,	loop_518
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o3,	%i2,	%i1
	bn,pn	%icc,	loop_519
loop_518:
	subcc	%o6,	0x1F6F,	%i0
	umul	%l5,	%o2,	%l4
	swap	[%l7 + 0x74],	%i4
loop_519:
	edge32	%o4,	%g3,	%g7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%g2
	nop
	setx	0x4ACE867C30731168,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x3EA912DE52A77D64,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f10,	%f10
	taddcctv	%i6,	%l0,	%i7
	xorcc	%l6,	0x0780,	%o7
	movle	%icc,	%o5,	%g4
	xnor	%i3,	%o0,	%l1
	mulscc	%l2,	0x1A86,	%i5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x28] %asi,	%g1
	move	%xcc,	%g6,	%g5
	srax	%o3,	0x18,	%o1
	fmul8x16al	%f13,	%f0,	%f22
	bg	loop_520
	swap	[%l7 + 0x50],	%i1
	fmovsn	%icc,	%f28,	%f4
	tg	%icc,	0x2
loop_520:
	edge8l	%o6,	%i2,	%l5
	fmovsge	%icc,	%f21,	%f13
	lduh	[%l7 + 0x0C],	%i0
	swap	[%l7 + 0x10],	%o2
	movcs	%xcc,	%l4,	%o4
	movneg	%icc,	%g3,	%i4
	fands	%f29,	%f0,	%f14
	sra	%g7,	0x0A,	%l3
	udivcc	%g2,	0x170A,	%i6
	alignaddr	%l0,	%i7,	%o7
	movl	%xcc,	%l6,	%o5
	nop
	setx	0x77E47C7D766B1D3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x9D61B068D9FB8FEA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f10,	%f16
	move	%xcc,	%g4,	%i3
	tpos	%icc,	0x5
	be	%xcc,	loop_521
	udivcc	%o0,	0x0F43,	%l2
	st	%f18,	[%l7 + 0x30]
	fcmpeq32	%f0,	%f8,	%l1
loop_521:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%g6
	movre	%g1,	0x259,	%o3
	movn	%xcc,	%g5,	%o1
	tne	%icc,	0x6
	set	0x36, %g2
	stba	%i1,	[%l7 + %g2] 0x89
	srax	%o6,	0x0F,	%l5
	te	%icc,	0x3
	fsrc2	%f30,	%f8
	edge32ln	%i2,	%i0,	%l4
	nop
	fitos	%f8,	%f19
	fstox	%f19,	%f4
	fxtos	%f4,	%f26
	array16	%o2,	%g3,	%o4
	edge16ln	%i4,	%g7,	%l3
	fmul8x16	%f23,	%f2,	%f12
	tg	%xcc,	0x4
	nop
	setx	0x4649323F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x34B00E6A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f20,	%f28
	movg	%xcc,	%i6,	%g2
	subc	%i7,	0x155F,	%o7
	bg,a	%xcc,	loop_522
	edge8n	%l6,	%l0,	%o5
	fcmpeq16	%f30,	%f16,	%g4
	nop
	setx loop_523, %l0, %l1
	jmpl %l1, %i3
loop_522:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l2,	%l1,	%o0
	fmovdcs	%icc,	%f6,	%f10
loop_523:
	movrgz	%g6,	%g1,	%i5
	sll	%g5,	%o1,	%o3
	fmul8x16al	%f14,	%f31,	%f2
	ta	%xcc,	0x3
	tge	%icc,	0x2
	set	0x26, %o6
	lduha	[%l7 + %o6] 0x14,	%o6
	sra	%i1,	%i2,	%i0
	bg,pt	%icc,	loop_524
	sth	%l4,	[%l7 + 0x3C]
	nop
	setx	0x115D6B22,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x13CCFE88,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f14,	%f16
	tvc	%icc,	0x2
loop_524:
	sdiv	%o2,	0x0ED9,	%g3
	fandnot1	%f26,	%f24,	%f14
	fsrc2s	%f4,	%f26
	movre	%o4,	%i4,	%l5
	movre	%l3,	%i6,	%g2
	fmovse	%icc,	%f16,	%f30
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
	membar	0x3C
	set	0x40, %i0
	stxa	%g7,	[%l7 + %i0] 0x2f
	membar	#Sync
	movne	%xcc,	%i7,	%l6
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf9
	membar	#Sync
	ble	loop_525
	array32	%o7,	%l0,	%g4
	xorcc	%i3,	%l2,	%o5
	umulcc	%o0,	0x06CE,	%l1
loop_525:
	edge16	%g6,	%i5,	%g5
	bleu	loop_526
	movrlz	%g1,	%o3,	%o6
	add	%o1,	%i1,	%i2
	addc	%l4,	%i0,	%g3
loop_526:
	sub	%o2,	0x0D23,	%i4
	taddcc	%l5,	%l3,	%i6
	set	0x71, %i5
	ldstuba	[%l7 + %i5] 0x10,	%o4
	fnot1s	%f17,	%f10
	movrgez	%g2,	%i7,	%g7
	movne	%xcc,	%o7,	%l0
	subccc	%l6,	%g4,	%l2
	movle	%xcc,	%i3,	%o5
	smul	%o0,	%l1,	%i5
	set	0x20, %g1
	ldda	[%l7 + %g1] 0xea,	%g4
	nop
	setx	0x53B02416,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x6C4FD422,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f29,	%f14
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
	ldx	[%l7 + 0x20],	%o3
	bge,a	%icc,	loop_527
	fmovrslz	%o6,	%f18,	%f16
	tne	%xcc,	0x5
	call	loop_528
loop_527:
	fcmpne16	%f8,	%f22,	%g6
	tgu	%xcc,	0x1
	tge	%xcc,	0x6
loop_528:
	bcs,pt	%xcc,	loop_529
	edge16n	%o1,	%i2,	%l4
	wr	%g0,	0x10,	%asi
	stwa	%i0,	[%l7 + 0x3C] %asi
loop_529:
	fmovrslez	%i1,	%f11,	%f28
	umulcc	%g3,	0x1E48,	%o2
	andcc	%i4,	%l5,	%i6
	srlx	%l3,	0x19,	%g2
	alignaddr	%o4,	%g7,	%i7
	fblg	%fcc3,	loop_530
	movvs	%xcc,	%o7,	%l6
	nop
	setx	0x1426A3A392878CC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x4E536CEAB821D26B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f22,	%f26
	fba	%fcc1,	loop_531
loop_530:
	ldd	[%l7 + 0x60],	%g4
	fblg,a	%fcc3,	loop_532
	taddcc	%l2,	%l0,	%i3
loop_531:
	bvc,pn	%icc,	loop_533
	fmul8x16al	%f27,	%f2,	%f24
loop_532:
	nop
	set	0x53, %i2
	ldstuba	[%l7 + %i2] 0x89,	%o5
loop_533:
	fmovrdne	%o0,	%f28,	%f28
	movne	%xcc,	%l1,	%i5
	fmovdne	%icc,	%f11,	%f12
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%g5
	xnor	%o6,	%o3,	%g6
	edge16n	%i2,	%o1,	%l4
	faligndata	%f22,	%f14,	%f14
	sdivcc	%i1,	0x15DE,	%i0
	movrlez	%g3,	0x086,	%i4
	tne	%icc,	0x5
	movvs	%xcc,	%o2,	%i6
	fmovsleu	%icc,	%f11,	%f5
	movrgz	%l5,	%g2,	%l3
	fmovdn	%xcc,	%f23,	%f7
	fmovdle	%xcc,	%f19,	%f25
	movrlz	%g7,	%i7,	%o7
	movge	%xcc,	%o4,	%l6
	movge	%xcc,	%g4,	%l0
	subcc	%i3,	0x022B,	%o5
	movcs	%xcc,	%l2,	%o0
	fandnot1	%f20,	%f26,	%f16
	prefetch	[%l7 + 0x5C],	 0x0
	and	%l1,	0x0CED,	%g1
	bvc,a	%icc,	loop_534
	movne	%icc,	%i5,	%o6
	edge32n	%o3,	%g5,	%g6
	mulx	%o1,	0x1AFA,	%i2
loop_534:
	bge	loop_535
	subc	%i1,	0x1B11,	%i0
	fsrc2s	%f13,	%f11
	subccc	%l4,	%i4,	%o2
loop_535:
	array32	%i6,	%l5,	%g2
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f22
	edge32	%g3,	%l3,	%g7
	sir	0x1B8F
	add	%i7,	%o4,	%l6
	movne	%icc,	%o7,	%g4
	fornot2s	%f24,	%f15,	%f11
	movre	%l0,	0x08C,	%i3
	fpsub32	%f26,	%f8,	%f2
	fzeros	%f11
	set	0x23, %o5
	ldstuba	[%l7 + %o5] 0x11,	%l2
	array8	%o0,	%o5,	%l1
	sra	%g1,	%o6,	%o3
	ldsh	[%l7 + 0x36],	%g5
	array16	%g6,	%o1,	%i5
	edge16	%i1,	%i0,	%i2
	fblg	%fcc3,	loop_536
	edge32ln	%l4,	%o2,	%i4
	edge32	%l5,	%g2,	%i6
	edge32	%g3,	%g7,	%i7
loop_536:
	fandnot2s	%f17,	%f5,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o4,	0x007A,	%l6
	alignaddrl	%o7,	%l3,	%g4
	tvs	%icc,	0x5
	fxnors	%f6,	%f13,	%f0
	tn	%xcc,	0x6
	edge32l	%i3,	%l0,	%l2
	orcc	%o5,	%l1,	%o0
	nop
	fitod	%f10,	%f22
	fdtox	%f22,	%f2
	te	%icc,	0x7
	fmovdpos	%xcc,	%f12,	%f7
	edge32l	%o6,	%o3,	%g5
	tcs	%icc,	0x4
	fxnor	%f6,	%f20,	%f26
	xorcc	%g6,	%o1,	%i5
	movrgez	%g1,	%i0,	%i2
	fcmpgt32	%f26,	%f0,	%i1
	sdiv	%o2,	0x008C,	%i4
	edge16ln	%l4,	%l5,	%i6
	move	%xcc,	%g3,	%g7
	sdiv	%i7,	0x014A,	%o4
	nop
	setx	0x187FB6A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xE106C173,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f9,	%f0
	brnz,a	%l6,	loop_537
	fmovsleu	%icc,	%f20,	%f26
	addccc	%g2,	%l3,	%o7
	smulcc	%i3,	%l0,	%g4
loop_537:
	prefetch	[%l7 + 0x08],	 0x3
	movle	%xcc,	%o5,	%l1
	tgu	%xcc,	0x0
	ld	[%l7 + 0x68],	%f20
	movcc	%xcc,	%o0,	%l2
	nop
	setx	0xD5A8FD16,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x59FE231C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f8,	%f30
	tge	%icc,	0x5
	tsubcctv	%o6,	0x037E,	%g5
	nop
	fitod	%f6,	%f0
	fdtos	%f0,	%f23
	edge32n	%o3,	%g6,	%i5
	srlx	%g1,	0x0C,	%o1
	fmovda	%icc,	%f3,	%f2
	nop
	setx	loop_538,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stx	%i2,	[%l7 + 0x50]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i1,	%i0
loop_538:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x39] %asi,	%i4
	bn,a,pn	%icc,	loop_539
	bl,a,pt	%icc,	loop_540
	movg	%xcc,	%l4,	%l5
	fbuge,a	%fcc2,	loop_541
loop_539:
	sdivcc	%i6,	0x16FA,	%g3
loop_540:
	ld	[%l7 + 0x10],	%f3
	edge32	%g7,	%i7,	%o2
loop_541:
	call	loop_542
	sdivx	%o4,	0x074C,	%l6
	tg	%xcc,	0x4
	fmul8x16au	%f23,	%f11,	%f6
loop_542:
	move	%icc,	%g2,	%o7
	for	%f12,	%f26,	%f0
	edge32n	%i3,	%l3,	%l0
	movn	%icc,	%g4,	%o5
	tge	%icc,	0x5
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x64] %asi,	%l1
	movre	%l2,	%o6,	%g5
	fmovrslez	%o3,	%f8,	%f15
	fpadd16	%f18,	%f14,	%f10
	fmovsleu	%xcc,	%f5,	%f31
	srax	%g6,	0x0F,	%o0
	tle	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	stha	%i5,	[%l7 + 0x46] %asi
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o1
	udiv	%g1,	0x0A91,	%i2
	fmovrslez	%i0,	%f19,	%f9
	fmovsn	%xcc,	%f0,	%f23
	movrlz	%i1,	0x0E4,	%l4
	fpsub32	%f12,	%f18,	%f2
	xorcc	%l5,	%i4,	%i6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x80,	%g3,	%i7
	set	0x72, %o0
	ldstuba	[%l7 + %o0] 0x80,	%o2
	sir	0x12EA
	subcc	%g7,	%l6,	%g2
	fmovrse	%o4,	%f10,	%f18
	movcc	%xcc,	%i3,	%o7
	wr	%g0,	0x89,	%asi
	stba	%l0,	[%l7 + 0x1E] %asi
	edge32ln	%l3,	%o5,	%l1
	fmovsl	%xcc,	%f24,	%f0
	subc	%g4,	%o6,	%l2
	nop
	setx	0xD92196488800C660,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x74EA1282D1FB8EA0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f24,	%f12
	edge32	%o3,	%g5,	%g6
	swap	[%l7 + 0x5C],	%o0
	subc	%o1,	0x0A2C,	%g1
	fnegs	%f28,	%f7
	addc	%i2,	0x021A,	%i5
	movrlez	%i1,	0x078,	%i0
	orn	%l5,	0x1E7E,	%i4
	tvc	%xcc,	0x4
	ble,a	%icc,	loop_543
	nop
	setx loop_544, %l0, %l1
	jmpl %l1, %i6
	movl	%xcc,	%l4,	%g3
	movvs	%icc,	%o2,	%i7
loop_543:
	fbul,a	%fcc3,	loop_545
loop_544:
	edge32l	%g7,	%l6,	%g2
	add	%o4,	%i3,	%o7
	bn,a	%icc,	loop_546
loop_545:
	orncc	%l3,	%l0,	%o5
	edge16	%l1,	%o6,	%g4
	taddcctv	%o3,	%l2,	%g5
loop_546:
	umulcc	%g6,	0x176C,	%o1
	movrlz	%g1,	%i2,	%o0
	fbug,a	%fcc0,	loop_547
	xorcc	%i1,	%i5,	%l5
	taddcc	%i4,	0x1202,	%i6
	for	%f2,	%f20,	%f6
loop_547:
	orcc	%l4,	%i0,	%g3
	edge16ln	%i7,	%o2,	%g7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l6,	%g2
	movg	%icc,	%o4,	%o7
	tne	%xcc,	0x3
	fble,a	%fcc3,	loop_548
	movrlez	%l3,	0x106,	%l0
	addcc	%o5,	%i3,	%l1
	tsubcctv	%g4,	%o6,	%l2
loop_548:
	fbge	%fcc0,	loop_549
	fbne,a	%fcc3,	loop_550
	edge8	%o3,	%g6,	%g5
	fnot1s	%f26,	%f3
loop_549:
	tsubcc	%o1,	0x1152,	%g1
loop_550:
	edge8n	%o0,	%i1,	%i5
	tsubcc	%l5,	0x1E58,	%i4
	te	%icc,	0x0
	movvs	%icc,	%i2,	%i6
	fmovrslez	%l4,	%f15,	%f29
	fnor	%f0,	%f30,	%f2
	edge8ln	%i0,	%i7,	%g3
	ld	[%l7 + 0x78],	%f3
	brlz,a	%o2,	loop_551
	fandnot2	%f4,	%f8,	%f18
	fbn	%fcc1,	loop_552
	movvc	%icc,	%g7,	%g2
loop_551:
	nop
	setx	0x94284E86,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f23
	tne	%xcc,	0x3
loop_552:
	nop
	setx	loop_553,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcc	loop_554
	fands	%f30,	%f31,	%f18
	fmovsvs	%icc,	%f7,	%f20
loop_553:
	xnorcc	%o4,	0x1449,	%l6
loop_554:
	sdivcc	%l3,	0x176E,	%l0
	fmovsa	%xcc,	%f29,	%f0
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f6
	bgu	loop_555
	tsubcctv	%o7,	0x1691,	%i3
	and	%l1,	%o5,	%o6
	ldsh	[%l7 + 0x74],	%g4
loop_555:
	andn	%o3,	0x1806,	%g6
	srl	%g5,	0x16,	%o1
	fba,a	%fcc0,	loop_556
	tpos	%xcc,	0x4
	movrlez	%g1,	0x380,	%l2
	tsubcc	%o0,	%i5,	%i1
loop_556:
	sth	%l5,	[%l7 + 0x62]
	move	%xcc,	%i2,	%i6
	mulscc	%i4,	%i0,	%i7
	nop
	setx	loop_557,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovda	%xcc,	%f10,	%f24
	movvc	%xcc,	%l4,	%g3
	fbne	%fcc0,	loop_558
loop_557:
	movg	%icc,	%g7,	%g2
	nop
	setx	0xB7ABE2E1F9E4FED4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x7F77DC027C1AED36,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f10,	%f0
	fones	%f5
loop_558:
	fnor	%f26,	%f30,	%f20
	and	%o4,	0x168D,	%o2
	movpos	%xcc,	%l6,	%l3
	pdist	%f4,	%f2,	%f28
	fmovrdgez	%o7,	%f4,	%f10
	fnor	%f12,	%f14,	%f14
	fandnot1	%f6,	%f16,	%f30
	tcc	%xcc,	0x1
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
	orncc	%i3,	%o5,	%l1
	tge	%icc,	0x4
	st	%f16,	[%l7 + 0x6C]
	nop
	setx	0x238DEFB2A06C8812,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	sll	%g4,	0x1E,	%o3
	fmuld8sux16	%f21,	%f2,	%f22
	udivcc	%o6,	0x15C8,	%g6
	xor	%g5,	0x0C2A,	%o1
	movre	%g1,	0x120,	%o0
	edge8ln	%i5,	%l2,	%l5
	set	0x1C, %g4
	lduwa	[%l7 + %g4] 0x89,	%i1
	xnorcc	%i2,	0x1ADE,	%i6
	fmovrslz	%i4,	%f25,	%f26
	fcmpne32	%f26,	%f16,	%i0
	sdivx	%l4,	0x1733,	%i7
	nop
	setx loop_559, %l0, %l1
	jmpl %l1, %g3
	edge8	%g2,	%o4,	%g7
	edge8ln	%o2,	%l6,	%o7
	fbne,a	%fcc0,	loop_560
loop_559:
	nop
	setx loop_561, %l0, %l1
	jmpl %l1, %l3
	edge32ln	%l0,	%o5,	%i3
	fnot2s	%f4,	%f29
loop_560:
	movg	%icc,	%l1,	%g4
loop_561:
	and	%o3,	0x1A23,	%o6
	sth	%g5,	[%l7 + 0x54]
	lduh	[%l7 + 0x74],	%o1
	sethi	0x1044,	%g6
	srax	%o0,	%i5,	%l2
	fbug,a	%fcc3,	loop_562
	popc	0x12E1,	%g1
	fblg	%fcc0,	loop_563
	taddcc	%l5,	%i2,	%i1
loop_562:
	taddcctv	%i6,	0x0D54,	%i0
	movle	%icc,	%i4,	%l4
loop_563:
	movre	%i7,	0x026,	%g2
	smulcc	%g3,	%o4,	%o2
	orncc	%g7,	%l6,	%o7
	bneg,a	%icc,	loop_564
	tvc	%xcc,	0x7
	movg	%xcc,	%l3,	%l0
	sdiv	%i3,	0x128D,	%l1
loop_564:
	be,a	loop_565
	bvc,a,pn	%icc,	loop_566
	edge32ln	%o5,	%g4,	%o6
	bleu	%xcc,	loop_567
loop_565:
	for	%f8,	%f4,	%f20
loop_566:
	nop
	fitod	%f8,	%f18
	fdtos	%f18,	%f2
	taddcc	%g5,	0x11CE,	%o1
loop_567:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f7,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o3,	0x36C,	%g6
	tneg	%icc,	0x2
	srl	%i5,	%l2,	%o0
	lduh	[%l7 + 0x28],	%l5
	sra	%g1,	%i2,	%i1
	xor	%i6,	%i0,	%i4
	brgez,a	%l4,	loop_568
	ta	%xcc,	0x6
	movre	%i7,	0x3B1,	%g3
	brnz,a	%g2,	loop_569
loop_568:
	xorcc	%o2,	0x0D84,	%o4
	tge	%xcc,	0x3
	smul	%g7,	0x0EDE,	%o7
loop_569:
	fornot2s	%f31,	%f22,	%f10
	lduh	[%l7 + 0x14],	%l3
	movpos	%xcc,	%l6,	%l0
	alignaddrl	%i3,	%l1,	%g4
	fbn	%fcc1,	loop_570
	edge16	%o6,	%g5,	%o1
	fmovsn	%icc,	%f23,	%f6
	set	0x58, %i7
	prefetcha	[%l7 + %i7] 0x80,	 0x0
loop_570:
	movvs	%xcc,	%o5,	%i5
	fnand	%f30,	%f10,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l2,	0x0797,	%g6
	mulscc	%o0,	0x0853,	%l5
	move	%icc,	%i2,	%g1
	umulcc	%i6,	%i1,	%i4
	nop
	setx	0xF0542699,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	edge8n	%l4,	%i0,	%g3
	andncc	%i7,	%g2,	%o4
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fnor	%f24,	%f30,	%f8
	ldd	[%l7 + 0x78],	%f6
	andn	%g7,	0x12A7,	%o7
	sllx	%o2,	%l6,	%l3
	fabss	%f5,	%f25
	sth	%i3,	[%l7 + 0x18]
	fbn	%fcc0,	loop_571
	movrne	%l1,	0x138,	%l0
	tleu	%xcc,	0x1
	fmovdg	%xcc,	%f0,	%f12
loop_571:
	ba,a,pn	%icc,	loop_572
	fmovrdgez	%o6,	%f24,	%f20
	umul	%g5,	0x003B,	%o1
	or	%g4,	0x0A8D,	%o3
loop_572:
	nop
	set	0x78, %g7
	lduwa	[%l7 + %g7] 0x18,	%i5
	set	0x10, %l1
	stxa	%o5,	[%l7 + %l1] 0x88
	sethi	0x15C2,	%g6
	fbge	%fcc0,	loop_573
	fandnot2	%f26,	%f30,	%f14
	addcc	%l2,	0x1564,	%l5
	orncc	%i2,	%g1,	%i6
loop_573:
	popc	%i1,	%o0
	tvs	%xcc,	0x2
	mova	%xcc,	%l4,	%i4
	fnegs	%f4,	%f27
	ba,a	%xcc,	loop_574
	bneg,a,pt	%xcc,	loop_575
	movre	%i0,	%g3,	%g2
	alignaddr	%o4,	%g7,	%o7
loop_574:
	smulcc	%i7,	0x1D17,	%l6
loop_575:
	fmovdcs	%icc,	%f7,	%f18
	fba	%fcc0,	loop_576
	sth	%o2,	[%l7 + 0x72]
	tneg	%xcc,	0x5
	fabss	%f6,	%f5
loop_576:
	nop
	fitos	%f14,	%f7
	fstox	%f7,	%f16
	tneg	%xcc,	0x5
	tleu	%icc,	0x0
	nop
	setx	0x8B14BCB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f14
	edge32l	%i3,	%l3,	%l1
	sdivx	%o6,	0x01D4,	%l0
	fmovdne	%icc,	%f9,	%f12
	ta	%xcc,	0x3
	nop
	setx	loop_577,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bge,a	loop_578
	fmul8sux16	%f4,	%f30,	%f4
	set	0x50, %i3
	stha	%g5,	[%l7 + %i3] 0xe3
	membar	#Sync
loop_577:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_578:
	tvc	%icc,	0x7
	addccc	%g4,	0x1E88,	%o1
	edge16n	%o3,	%i5,	%o5
	tcc	%xcc,	0x6
	orncc	%l2,	%l5,	%i2
	sdivx	%g6,	0x1C26,	%i6
	tg	%xcc,	0x7
	tsubcctv	%i1,	%o0,	%g1
	sth	%l4,	[%l7 + 0x70]
	movcc	%icc,	%i4,	%g3
	fornot2	%f12,	%f30,	%f24
	udivx	%g2,	0x068B,	%i0
	fabsd	%f30,	%f24
	brnz	%g7,	loop_579
	fmovrdgz	%o4,	%f16,	%f16
	array32	%o7,	%i7,	%l6
	array16	%i3,	%l3,	%o2
loop_579:
	bpos,a	%icc,	loop_580
	movrlez	%l1,	%o6,	%l0
	fmovrsgez	%g5,	%f6,	%f19
	fmovrslez	%o1,	%f0,	%f16
loop_580:
	nop
	set	0x7E, %l6
	ldstuba	[%l7 + %l6] 0x11,	%g4
	array16	%i5,	%o3,	%o5
	movvs	%xcc,	%l5,	%l2
	fpackfix	%f10,	%f1
	edge16ln	%i2,	%i6,	%i1
	fmovdleu	%xcc,	%f28,	%f27
	edge8l	%g6,	%g1,	%o0
	fmovdneg	%xcc,	%f14,	%f1
	array16	%i4,	%l4,	%g2
	fsrc1	%f6,	%f12
	nop
	setx loop_581, %l0, %l1
	jmpl %l1, %g3
	addc	%g7,	0x016A,	%i0
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f10
	fmovrslz	%o7,	%f28,	%f24
loop_581:
	xnorcc	%i7,	%l6,	%o4
	lduw	[%l7 + 0x54],	%l3
	fpsub16	%f30,	%f20,	%f26
	edge16n	%i3,	%l1,	%o2
	sllx	%l0,	0x02,	%g5
	fnands	%f1,	%f28,	%f13
	movgu	%xcc,	%o1,	%o6
	andn	%g4,	0x15FA,	%i5
	fone	%f28
	fpack16	%f24,	%f18
	fbo,a	%fcc3,	loop_582
	membar	0x43
	set	0x34, %o3
	swapa	[%l7 + %o3] 0x88,	%o3
loop_582:
	array32	%o5,	%l5,	%l2
	fabsd	%f0,	%f16
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f12
	array32	%i2,	%i6,	%g6
	bcc,a,pt	%icc,	loop_583
	edge8	%g1,	%i1,	%o0
	fands	%f5,	%f3,	%f17
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_583:
	std	%f16,	[%l7 + 0x50]
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sll	%l4,	%i4,	%g2
	edge32	%g3,	%i0,	%g7
	array8	%o7,	%l6,	%o4
	movn	%icc,	%i7,	%i3
	orcc	%l1,	%o2,	%l0
	xorcc	%l3,	0x0381,	%o1
	subccc	%g5,	0x0FF0,	%o6
	smulcc	%i5,	0x0B3A,	%o3
	udivx	%g4,	0x1EA0,	%o5
	fornot2	%f26,	%f30,	%f0
	edge32n	%l5,	%l2,	%i6
	swap	[%l7 + 0x48],	%g6
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x81,	%f0
	fbul	%fcc1,	loop_584
	fpackfix	%f10,	%f4
	fmuld8ulx16	%f16,	%f30,	%f8
	fnor	%f12,	%f20,	%f22
loop_584:
	bshuffle	%f26,	%f20,	%f16
	taddcc	%g1,	0x1381,	%i2
	ldd	[%l7 + 0x38],	%i0
	fsrc2	%f16,	%f4
	movle	%icc,	%l4,	%o0
	movrgz	%i4,	0x3CD,	%g2
	lduw	[%l7 + 0x0C],	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%g7,	%g3
	be,pn	%icc,	loop_585
	sdivx	%o7,	0x07DA,	%o4
	fbl	%fcc1,	loop_586
	flush	%l7 + 0x4C
loop_585:
	movneg	%xcc,	%l6,	%i7
	addc	%l1,	0x12B3,	%i3
loop_586:
	array16	%o2,	%l0,	%l3
	edge8ln	%g5,	%o1,	%i5
	andncc	%o3,	%g4,	%o5
	tsubcc	%o6,	%l5,	%i6
	movrgz	%g6,	%g1,	%i2
	bcc	loop_587
	tpos	%icc,	0x5
	tl	%icc,	0x6
	tneg	%icc,	0x3
loop_587:
	sdivcc	%l2,	0x0E9F,	%i1
	alignaddrl	%o0,	%i4,	%l4
	movpos	%icc,	%g2,	%i0
	fpmerge	%f21,	%f29,	%f10
	srlx	%g7,	0x05,	%o7
	movleu	%icc,	%g3,	%l6
	xnor	%o4,	%l1,	%i7
	movrne	%o2,	0x21C,	%l0
	bvc	%icc,	loop_588
	fmovsg	%xcc,	%f2,	%f8
	bg,a	%icc,	loop_589
	ta	%xcc,	0x2
loop_588:
	tne	%icc,	0x0
	movvs	%xcc,	%i3,	%l3
loop_589:
	mulscc	%g5,	%o1,	%o3
	array32	%g4,	%i5,	%o5
	edge8ln	%l5,	%o6,	%i6
	fmovrdne	%g1,	%f0,	%f2
	alignaddrl	%i2,	%g6,	%i1
	movn	%icc,	%o0,	%i4
	fbu,a	%fcc1,	loop_590
	fmovdgu	%xcc,	%f12,	%f15
	fpadd32	%f6,	%f4,	%f28
	mova	%icc,	%l4,	%g2
loop_590:
	fmovsne	%xcc,	%f7,	%f25
	nop
	setx	0xB6483B58,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f27
	fands	%f21,	%f23,	%f4
	smul	%i0,	%l2,	%o7
	udivx	%g7,	0x1373,	%l6
	nop
	setx	0xCFFF9C68,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x74495BEB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f1,	%f13
	sllx	%g3,	%o4,	%i7
	sub	%o2,	0x1DB2,	%l0
	fmul8x16au	%f19,	%f25,	%f18
	fmovda	%icc,	%f9,	%f22
	array8	%l1,	%i3,	%g5
	sethi	0x1DEB,	%o1
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x10] %asi,	%o2
	ldsh	[%l7 + 0x22],	%g4
	fxor	%f20,	%f4,	%f10
	fandnot2	%f28,	%f8,	%f28
	sdivx	%i5,	0x1C8C,	%l3
	fbge	%fcc2,	loop_591
	fexpand	%f9,	%f4
	tg	%xcc,	0x7
	tge	%icc,	0x0
loop_591:
	movn	%xcc,	%l5,	%o5
	edge8ln	%i6,	%o6,	%g1
	bge,a,pn	%icc,	loop_592
	nop
	fitos	%f14,	%f5
	fstod	%f5,	%f2
	alignaddrl	%i2,	%g6,	%o0
	movvs	%icc,	%i1,	%l4
loop_592:
	tsubcctv	%i4,	0x107B,	%g2
	tvs	%xcc,	0x2
	fmul8x16	%f9,	%f26,	%f2
	array8	%l2,	%o7,	%g7
	set	0x50, %i4
	lda	[%l7 + %i4] 0x88,	%f21
	sll	%i0,	%g3,	%l6
	tge	%icc,	0x3
	flush	%l7 + 0x24
	sethi	0x166B,	%i7
	edge8n	%o4,	%o2,	%l0
	fmovrslez	%l1,	%f28,	%f7
	andcc	%i3,	%o1,	%g5
	ld	[%l7 + 0x30],	%f21
	set	0x64, %l2
	lduba	[%l7 + %l2] 0x11,	%g4
	edge16l	%o3,	%l3,	%i5
	movle	%icc,	%l5,	%o5
	fblg	%fcc2,	loop_593
	nop
	setx	0x5ABE90CD506EAA43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	tl	%icc,	0x1
	mova	%icc,	%o6,	%i6
loop_593:
	move	%icc,	%i2,	%g1
	edge16l	%o0,	%i1,	%g6
	movneg	%xcc,	%l4,	%g2
	umul	%i4,	%o7,	%g7
	brz	%l2,	loop_594
	fmovdcs	%icc,	%f31,	%f27
	fmovda	%xcc,	%f12,	%f7
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x19
loop_594:
	orncc	%g3,	%l6,	%i7
	bcs,a,pt	%xcc,	loop_595
	fxnor	%f0,	%f12,	%f12
	bneg,a	loop_596
	stb	%o4,	[%l7 + 0x55]
loop_595:
	alignaddr	%o2,	%l0,	%i0
	movg	%xcc,	%l1,	%i3
loop_596:
	std	%f18,	[%l7 + 0x18]
	umulcc	%g5,	%o1,	%g4
	popc	%l3,	%o3
	movg	%xcc,	%i5,	%o5
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f16
	xnorcc	%l5,	%o6,	%i2
	fmovrdne	%g1,	%f6,	%f10
	tleu	%xcc,	0x0
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x52] %asi,	%o0
	movpos	%icc,	%i1,	%g6
	tleu	%xcc,	0x7
	fba	%fcc1,	loop_597
	movne	%xcc,	%l4,	%i6
	bge,a	loop_598
	movrlz	%i4,	0x369,	%g2
loop_597:
	fnot2s	%f22,	%f29
	edge32l	%g7,	%o7,	%g3
loop_598:
	movne	%icc,	%l6,	%l2
	tgu	%xcc,	0x6
	tle	%icc,	0x3
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbue	%fcc0,	loop_599
	fmovrde	%o4,	%f12,	%f2
	movleu	%icc,	%i7,	%o2
	alignaddr	%l0,	%l1,	%i3
loop_599:
	edge16	%i0,	%o1,	%g4
	tcc	%xcc,	0x7
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f26
	nop
	set	0x24, %g6
	ldsh	[%l7 + %g6],	%l3
	smul	%o3,	%g5,	%i5
	fxnor	%f24,	%f18,	%f20
	stb	%l5,	[%l7 + 0x09]
	tsubcc	%o6,	%i2,	%o5
	fpsub32	%f24,	%f0,	%f2
	movcs	%icc,	%o0,	%i1
	sllx	%g1,	%l4,	%i6
	add	%i4,	%g2,	%g7
	ble,pt	%xcc,	loop_600
	movrne	%o7,	0x378,	%g3
	tcc	%xcc,	0x5
	brnz,a	%g6,	loop_601
loop_600:
	be,a,pt	%xcc,	loop_602
	fmovdleu	%xcc,	%f20,	%f30
	tcc	%icc,	0x5
loop_601:
	andn	%l6,	0x151F,	%l2
loop_602:
	andn	%o4,	0x1EA4,	%o2
	subc	%i7,	%l1,	%l0
	fmovrdgez	%i3,	%f8,	%f0
	fpadd32	%f8,	%f6,	%f16
	movneg	%xcc,	%o1,	%i0
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x38] %asi,	%l3
	fandnot1	%f18,	%f16,	%f8
	fmovdne	%icc,	%f13,	%f17
	fbe,a	%fcc3,	loop_603
	be	%xcc,	loop_604
	tn	%xcc,	0x2
	fpadd16s	%f27,	%f20,	%f26
loop_603:
	tg	%xcc,	0x4
loop_604:
	bvc,a	loop_605
	orcc	%o3,	%g5,	%i5
	movrlz	%l5,	%g4,	%o6
	edge32n	%o5,	%o0,	%i2
loop_605:
	fpsub32	%f12,	%f0,	%f6
	ldsh	[%l7 + 0x40],	%g1
	fnot2	%f18,	%f0
	tcc	%xcc,	0x0
	tne	%icc,	0x3
	addcc	%l4,	0x0A43,	%i1
	be,a,pt	%icc,	loop_606
	fbn	%fcc0,	loop_607
	fcmpgt16	%f6,	%f30,	%i6
	fmovdg	%icc,	%f9,	%f5
loop_606:
	subcc	%g2,	0x1F6A,	%i4
loop_607:
	movneg	%icc,	%g7,	%g3
	taddcc	%g6,	0x1A4C,	%o7
	movne	%xcc,	%l6,	%l2
	movle	%xcc,	%o2,	%o4
	movgu	%icc,	%l1,	%i7
	fand	%f6,	%f14,	%f2
	andcc	%l0,	0x1E3F,	%i3
	movne	%xcc,	%o1,	%l3
	membar	0x76
	fcmple32	%f24,	%f2,	%i0
	addc	%o3,	%i5,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc0,	loop_608
	andn	%g5,	%o6,	%g4
	xnor	%o5,	%o0,	%i2
	nop
	setx	0x7F1BE36A03D56F8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f18
loop_608:
	membar	0x11
	edge16	%g1,	%i1,	%l4
	xor	%g2,	0x0FD0,	%i4
	fbu,a	%fcc2,	loop_609
	edge16ln	%g7,	%i6,	%g6
	fmovsg	%xcc,	%f17,	%f8
	ldsh	[%l7 + 0x08],	%g3
loop_609:
	tleu	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x44] %asi,	%l6
	fmul8x16al	%f17,	%f11,	%f2
	sdivcc	%o7,	0x116A,	%o2
	tgu	%icc,	0x7
	subc	%o4,	0x037B,	%l2
	tne	%icc,	0x2
	movleu	%xcc,	%i7,	%l1
	fsrc2	%f14,	%f0
	st	%f13,	[%l7 + 0x08]
	popc	%l0,	%i3
	fmovrdgez	%o1,	%f0,	%f18
	fmovrde	%i0,	%f4,	%f6
	edge32ln	%l3,	%i5,	%o3
	bvc	%icc,	loop_610
	tne	%xcc,	0x0
	fmovsa	%xcc,	%f13,	%f22
	movl	%xcc,	%g5,	%l5
loop_610:
	movrlez	%o6,	0x1E8,	%o5
	fmovsn	%icc,	%f26,	%f23
	movvc	%icc,	%g4,	%o0
	fpackfix	%f14,	%f25
	tgu	%icc,	0x1
	smulcc	%g1,	0x1747,	%i2
	movre	%l4,	0x10D,	%g2
	or	%i4,	%g7,	%i6
	tg	%icc,	0x3
	edge16	%g6,	%i1,	%g3
	nop
	setx	0xDD360B4A0DDD7756,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x1D4885831FA6D3D0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f24,	%f22
	srl	%o7,	0x0D,	%l6
	tvs	%xcc,	0x7
	fblg,a	%fcc2,	loop_611
	brgz,a	%o2,	loop_612
	sethi	0x1D85,	%l2
	fpack32	%f14,	%f8,	%f4
loop_611:
	fbue	%fcc3,	loop_613
loop_612:
	bpos,pt	%icc,	loop_614
	fxnor	%f10,	%f12,	%f10
	nop
	setx	loop_615,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_613:
	fand	%f0,	%f4,	%f30
loop_614:
	tcc	%icc,	0x7
	lduw	[%l7 + 0x0C],	%i7
loop_615:
	fpadd32	%f24,	%f30,	%f0
	sll	%l1,	%o4,	%l0
	umulcc	%o1,	0x0301,	%i3
	bgu,pn	%xcc,	loop_616
	fpadd16s	%f1,	%f5,	%f17
	nop
	set	0x18, %l0
	stw	%i0,	[%l7 + %l0]
	fpadd32s	%f31,	%f17,	%f4
loop_616:
	lduh	[%l7 + 0x42],	%l3
	udiv	%i5,	0x00C9,	%g5
	udivx	%o3,	0x0A01,	%o6
	brlez	%l5,	loop_617
	array32	%g4,	%o5,	%o0
	xorcc	%i2,	%g1,	%l4
	wr	%g0,	0x81,	%asi
	stwa	%i4,	[%l7 + 0x44] %asi
loop_617:
	movn	%icc,	%g7,	%g2
	tvc	%xcc,	0x6
	add	%g6,	%i6,	%i1
	membar	0x59
	andncc	%g3,	%l6,	%o2
	addc	%l2,	%i7,	%l1
	for	%f0,	%f12,	%f14
	brgz,a	%o4,	loop_618
	bvc	loop_619
	fnot1	%f10,	%f10
	bcs,a	%icc,	loop_620
loop_618:
	movleu	%xcc,	%l0,	%o1
loop_619:
	movrgz	%o7,	%i0,	%l3
	std	%f28,	[%l7 + 0x38]
loop_620:
	tsubcc	%i5,	%g5,	%i3
	edge8l	%o3,	%l5,	%o6
	fbul	%fcc1,	loop_621
	fcmpeq16	%f22,	%f18,	%g4
	bcc	loop_622
	movge	%xcc,	%o0,	%o5
loop_621:
	edge32n	%g1,	%i2,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_622:
	movne	%icc,	%g7,	%g2
	ldd	[%l7 + 0x20],	%f2
	movcc	%icc,	%g6,	%i6
	orcc	%i1,	%g3,	%l4
	fsrc1s	%f31,	%f13
	edge32n	%o2,	%l6,	%i7
	fmovsa	%xcc,	%f16,	%f30
	movpos	%icc,	%l1,	%l2
	bl,pt	%xcc,	loop_623
	tsubcc	%l0,	%o1,	%o7
	te	%xcc,	0x2
	sub	%o4,	0x05B1,	%i0
loop_623:
	srax	%i5,	%g5,	%i3
	fzero	%f10
	mulscc	%o3,	0x07DA,	%l3
	nop
	setx	0xB006AF2D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x4475FA27,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f4,	%f2
	fmovsn	%xcc,	%f18,	%f21
	udivcc	%o6,	0x0B6E,	%g4
	fmovsle	%icc,	%f23,	%f18
	sir	0x0986
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l5,	%o5
	bneg,pt	%icc,	loop_624
	andcc	%g1,	0x0392,	%o0
	movrgz	%i4,	0x0FB,	%g7
	add	%i2,	%g6,	%g2
loop_624:
	srax	%i1,	%g3,	%l4
	fbu,a	%fcc2,	loop_625
	nop
	set	0x1E, %o7
	sth	%i6,	[%l7 + %o7]
	st	%f22,	[%l7 + 0x64]
	stb	%o2,	[%l7 + 0x38]
loop_625:
	array32	%l6,	%l1,	%i7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x43] %asi,	%l2
	fmovdl	%xcc,	%f5,	%f27
	edge16	%l0,	%o7,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%i5
	fmovscc	%xcc,	%f28,	%f28
	fmovscc	%icc,	%f23,	%f6
	set	0x67, %l4
	ldstuba	[%l7 + %l4] 0x04,	%i0
	fbe	%fcc2,	loop_626
	andn	%i3,	0x0E2D,	%o3
	srax	%g5,	0x0E,	%l3
	tsubcc	%g4,	%o6,	%l5
loop_626:
	array8	%o5,	%o0,	%i4
	lduw	[%l7 + 0x10],	%g1
	tsubcc	%g7,	0x1B8D,	%g6
	edge32n	%g2,	%i1,	%g3
	set	0x40, %g3
	lduwa	[%l7 + %g3] 0x15,	%l4
	tle	%icc,	0x4
	wr	%g0,	0x19,	%asi
	stxa	%i6,	[%l7 + 0x48] %asi
	orncc	%o2,	0x194E,	%l6
	sethi	0x1DEB,	%i2
	sub	%l1,	0x08CF,	%l2
	fbuge	%fcc2,	loop_627
	fone	%f20
	mulscc	%i7,	%l0,	%o7
	movcc	%xcc,	%o4,	%i5
loop_627:
	fpadd32s	%f18,	%f31,	%f19
	fcmpeq32	%f0,	%f26,	%o1
	movgu	%icc,	%i3,	%i0
	fmovdleu	%xcc,	%f14,	%f15
	fmovdvc	%xcc,	%f23,	%f4
	fmovdvs	%xcc,	%f11,	%f1
	set	0x28, %l5
	lda	[%l7 + %l5] 0x89,	%f6
	movrlz	%o3,	0x082,	%l3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g4,	%g5
	fbue,a	%fcc1,	loop_628
	bge,a,pt	%xcc,	loop_629
	nop
	setx	0x23E09C3E72707934,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x64050B2FB8856473,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f2,	%f0
	sllx	%o6,	%l5,	%o0
loop_628:
	andn	%i4,	0x14C9,	%o5
loop_629:
	fands	%f23,	%f8,	%f1
	fmovrsgz	%g1,	%f13,	%f6
	fors	%f17,	%f17,	%f1
	alignaddrl	%g7,	%g2,	%i1
	fbo,a	%fcc3,	loop_630
	udiv	%g3,	0x1FC0,	%g6
	fbo	%fcc2,	loop_631
	fbg,a	%fcc0,	loop_632
loop_630:
	ldsw	[%l7 + 0x30],	%l4
	nop
	set	0x7E, %o4
	ldstub	[%l7 + %o4],	%o2
loop_631:
	movrgez	%l6,	%i2,	%l1
loop_632:
	udiv	%l2,	0x03C4,	%i6
	edge32n	%l0,	%i7,	%o7
	brz	%o4,	loop_633
	subc	%i5,	%i3,	%o1
	edge32n	%i0,	%l3,	%o3
	smulcc	%g4,	%o6,	%g5
loop_633:
	fsrc1	%f2,	%f26
	edge16n	%l5,	%i4,	%o0
	edge16ln	%g1,	%g7,	%o5
	subc	%g2,	%i1,	%g6
	fmovs	%f15,	%f3
	edge32	%g3,	%l4,	%o2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%l6
	bg,a	loop_634
	edge32ln	%l1,	%l2,	%i6
	nop
	fitod	%f8,	%f10
	fdtos	%f10,	%f30
	fmovdn	%xcc,	%f10,	%f4
loop_634:
	nop
	set	0x78, %i6
	stxa	%l0,	[%l7 + %i6] 0x11
	bg,a,pt	%icc,	loop_635
	te	%xcc,	0x6
	movgu	%xcc,	%o7,	%i7
	bvc,pt	%xcc,	loop_636
loop_635:
	fxnors	%f22,	%f31,	%f24
	subcc	%o4,	%i3,	%o1
	flush	%l7 + 0x08
loop_636:
	movle	%xcc,	%i0,	%i5
	tvc	%icc,	0x6
	umul	%l3,	%g4,	%o6
	mulscc	%o3,	0x0FEF,	%g5
	subcc	%l5,	%i4,	%o0
	fmovsne	%icc,	%f6,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f27,	%f6
	call	loop_637
	flush	%l7 + 0x0C
	fbul	%fcc1,	loop_638
	bcc,pn	%xcc,	loop_639
loop_637:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g7,	%o5,	%g2
loop_638:
	edge8l	%i1,	%g1,	%g6
loop_639:
	fmovsl	%xcc,	%f19,	%f26
	fmovdn	%xcc,	%f14,	%f0
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	swap	[%l7 + 0x44],	%l4
	xorcc	%o2,	0x1722,	%i2
	nop
	setx	0x97CF63DB38C3A2F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f2
	tsubcctv	%g3,	0x03F7,	%l1
	fbn	%fcc0,	loop_640
	fmovdle	%icc,	%f11,	%f5
	andcc	%l6,	%i6,	%l2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x88,	%l0,	%i7
loop_640:
	edge8	%o4,	%i3,	%o7
	bne	loop_641
	bn	loop_642
	xorcc	%i0,	0x1144,	%i5
	fnegd	%f6,	%f24
loop_641:
	subccc	%o1,	%l3,	%o6
loop_642:
	alignaddr	%o3,	%g4,	%l5
	ldsh	[%l7 + 0x3A],	%g5
	tcs	%xcc,	0x6
	smul	%o0,	%i4,	%o5
	bleu,a	%icc,	loop_643
	array32	%g2,	%i1,	%g1
	fbn,a	%fcc0,	loop_644
	nop
	setx	0x2639503C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f31
loop_643:
	fbl,a	%fcc2,	loop_645
	sth	%g6,	[%l7 + 0x1A]
loop_644:
	nop
	setx	0x188FBB94F14FA280,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f16
	fone	%f14
loop_645:
	ble,a,pt	%xcc,	loop_646
	fnor	%f6,	%f2,	%f26
	array16	%l4,	%g7,	%i2
	tn	%xcc,	0x0
loop_646:
	mulx	%g3,	%o2,	%l6
	addccc	%l1,	%i6,	%l2
	tcc	%xcc,	0x1
	fmul8x16	%f3,	%f28,	%f12
	set	0x10, %g2
	stxa	%i7,	[%g0 + %g2] 0x20
	edge16l	%l0,	%o4,	%i3
	nop
	setx loop_647, %l0, %l1
	jmpl %l1, %i0
	fornot2	%f30,	%f20,	%f20
	tsubcctv	%i5,	%o7,	%o1
	lduw	[%l7 + 0x7C],	%o6
loop_647:
	movre	%o3,	%g4,	%l5
	brlez	%g5,	loop_648
	sir	0x1769
	array16	%o0,	%i4,	%o5
	array32	%l3,	%i1,	%g2
loop_648:
	membar	0x63
	fors	%f26,	%f4,	%f29
	fbuge,a	%fcc2,	loop_649
	fcmple32	%f30,	%f30,	%g1
	sdiv	%g6,	0x0863,	%l4
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_649:
	fmovrsne	%i2,	%f21,	%f7
	edge32	%g7,	%g3,	%l6
	edge32l	%l1,	%i6,	%l2
	fmovdcs	%icc,	%f24,	%f13
	alignaddrl	%i7,	%o2,	%l0
	fbul	%fcc0,	loop_650
	array32	%o4,	%i0,	%i5
	orn	%o7,	%i3,	%o1
	bg,a,pn	%icc,	loop_651
loop_650:
	addccc	%o3,	0x0F48,	%o6
	tneg	%xcc,	0x3
	flush	%l7 + 0x58
loop_651:
	movge	%icc,	%l5,	%g4
	brgz	%o0,	loop_652
	be,a,pt	%xcc,	loop_653
	tg	%icc,	0x7
	fbg,a	%fcc2,	loop_654
loop_652:
	alignaddr	%i4,	%o5,	%l3
loop_653:
	bn,a	%xcc,	loop_655
	fnor	%f20,	%f30,	%f16
loop_654:
	movrlz	%g5,	0x2B7,	%g2
	fcmpne16	%f14,	%f28,	%g1
loop_655:
	bvs,pn	%xcc,	loop_656
	fbn,a	%fcc3,	loop_657
	array16	%i1,	%g6,	%l4
	umul	%i2,	%g3,	%g7
loop_656:
	mulscc	%l1,	%i6,	%l2
loop_657:
	fmovrslz	%i7,	%f28,	%f18
	movcc	%icc,	%o2,	%l0
	for	%f14,	%f10,	%f6
	movrgz	%l6,	%o4,	%i5
	lduh	[%l7 + 0x24],	%i0
	sdiv	%i3,	0x0746,	%o7
	tgu	%xcc,	0x4
	tsubcctv	%o1,	%o3,	%o6
	fmuld8ulx16	%f20,	%f13,	%f26
	edge8ln	%g4,	%o0,	%i4
	tl	%icc,	0x7
	umul	%o5,	0x03EC,	%l5
	smulcc	%g5,	0x1A4B,	%l3
	fnors	%f0,	%f25,	%f8
	nop
	setx	0xF1054F22,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x2C767625,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f4,	%f23
	fble	%fcc1,	loop_658
	tl	%xcc,	0x7
	stb	%g1,	[%l7 + 0x44]
	fmovscs	%xcc,	%f10,	%f11
loop_658:
	movre	%i1,	0x1A0,	%g6
	call	loop_659
	movrlez	%g2,	%i2,	%l4
	bl	%xcc,	loop_660
	nop
	setx	0x9EF9820C2597AD8C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x1B7EE1ACB22DD34C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f8,	%f2
loop_659:
	movrne	%g7,	%g3,	%i6
	fbue,a	%fcc3,	loop_661
loop_660:
	smul	%l2,	%l1,	%i7
	fpsub16s	%f8,	%f27,	%f8
	fxor	%f16,	%f28,	%f24
loop_661:
	fmovrsgez	%l0,	%f30,	%f14
	fmul8x16au	%f1,	%f24,	%f0
	fmovrsne	%o2,	%f25,	%f19
	movge	%icc,	%o4,	%l6
	fmovs	%f13,	%f11
	movrlez	%i5,	0x051,	%i3
	fcmpeq16	%f0,	%f10,	%o7
	movgu	%icc,	%i0,	%o1
	fcmple32	%f24,	%f10,	%o3
	brgz	%o6,	loop_662
	mova	%icc,	%o0,	%g4
	movleu	%xcc,	%o5,	%i4
	movvs	%icc,	%l5,	%g5
loop_662:
	sdivx	%l3,	0x1975,	%i1
	array32	%g1,	%g2,	%i2
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xe2,	%g6
	movrgez	%l4,	%g3,	%g7
	addcc	%i6,	0x0CDE,	%l1
	array16	%l2,	%i7,	%o2
	srl	%o4,	%l0,	%l6
	fpsub16s	%f3,	%f23,	%f17
	edge32l	%i5,	%o7,	%i3
	xnorcc	%o1,	0x07D0,	%o3
	set	0x60, %o6
	ldda	[%l7 + %o6] 0xe2,	%i0
	edge16n	%o6,	%g4,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc1,	loop_663
	sdivcc	%i4,	0x0A8A,	%o5
	movrlz	%l5,	0x057,	%g5
	ta	%icc,	0x1
loop_663:
	movge	%icc,	%l3,	%g1
	fmovrslez	%i1,	%f3,	%f20
	fnands	%f5,	%f13,	%f28
	ld	[%l7 + 0x40],	%f20
	bgu,a,pt	%icc,	loop_664
	movne	%xcc,	%g2,	%g6
	tcs	%icc,	0x4
	fexpand	%f15,	%f0
loop_664:
	udiv	%i2,	0x0730,	%g3
	tne	%xcc,	0x7
	fexpand	%f30,	%f28
	fnands	%f13,	%f10,	%f26
	bgu,a	loop_665
	srax	%g7,	%i6,	%l4
	fbge,a	%fcc3,	loop_666
	nop
	setx	0xBBF03BE6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xBE9B1485,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f28,	%f7
loop_665:
	ldsb	[%l7 + 0x2C],	%l2
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
loop_666:
	edge16ln	%o2,	%l1,	%o4
	bvc,pn	%icc,	loop_667
	xor	%l0,	%i5,	%o7
	smulcc	%l6,	0x1581,	%i3
	fmovdcs	%icc,	%f4,	%f19
loop_667:
	tsubcc	%o1,	0x0393,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xC7E82211,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x0724B60C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f19,	%f1
	fnor	%f12,	%f24,	%f0
	fblg	%fcc3,	loop_668
	xor	%o3,	0x063D,	%o6
	xnorcc	%o0,	0x012A,	%g4
	movneg	%icc,	%o5,	%i4
loop_668:
	bvs,a	loop_669
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f22,	%f10,	%g5
	tleu	%icc,	0x7
loop_669:
	ldsw	[%l7 + 0x50],	%l3
	andncc	%l5,	%g1,	%g2
	movrlez	%g6,	0x3B0,	%i2
	tgu	%xcc,	0x1
	std	%f22,	[%l7 + 0x38]
	tle	%icc,	0x4
	fbul,a	%fcc3,	loop_670
	fbul,a	%fcc0,	loop_671
	movge	%icc,	%i1,	%g3
	sdivcc	%g7,	0x06D6,	%i6
loop_670:
	fmovdn	%icc,	%f9,	%f20
loop_671:
	nop
	set	0x09, %o1
	stba	%l2,	[%l7 + %o1] 0x10
	sub	%l4,	0x0CDF,	%i7
	sdiv	%o2,	0x00A9,	%o4
	tcc	%icc,	0x3
	xnor	%l0,	0x18FA,	%l1
	fmovdcs	%icc,	%f10,	%f3
	array16	%o7,	%l6,	%i5
	flush	%l7 + 0x58
	edge8l	%o1,	%i3,	%i0
	fbge,a	%fcc2,	loop_672
	subcc	%o6,	0x1579,	%o0
	ldd	[%l7 + 0x68],	%g4
	xnor	%o5,	0x1487,	%i4
loop_672:
	mulscc	%o3,	%l3,	%l5
	movvc	%xcc,	%g1,	%g2
	fsrc1s	%f27,	%f3
	fand	%f22,	%f26,	%f26
	srlx	%g6,	0x00,	%i2
	flush	%l7 + 0x48
	subcc	%i1,	0x1154,	%g3
	addcc	%g7,	0x02D2,	%i6
	orcc	%g5,	0x0D81,	%l2
	ldsw	[%l7 + 0x78],	%l4
	bne,a,pn	%xcc,	loop_673
	edge8ln	%i7,	%o2,	%o4
	nop
	setx	0x7F06A7F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xFDBE2B0B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f23,	%f28
	fmovrdgz	%l1,	%f0,	%f18
loop_673:
	orncc	%o7,	0x10BF,	%l6
	edge32ln	%l0,	%o1,	%i3
	orcc	%i5,	%i0,	%o0
	popc	%o6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o5,	%o3
	addccc	%i4,	0x0F59,	%l5
	fmovrslz	%g1,	%f30,	%f12
	movrne	%g2,	%l3,	%i2
	tcs	%icc,	0x7
	andcc	%i1,	0x13FB,	%g3
	mulx	%g7,	%g6,	%i6
	edge32n	%l2,	%g5,	%l4
	fbuge,a	%fcc1,	loop_674
	udivx	%o2,	0x17D7,	%o4
	subcc	%i7,	%l1,	%l6
	movrlz	%o7,	0x071,	%l0
loop_674:
	stx	%i3,	[%l7 + 0x20]
	fcmpne32	%f14,	%f8,	%i5
	array32	%o1,	%o0,	%o6
	edge16ln	%g4,	%i0,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o5,	0x12D5,	%l5
	tg	%xcc,	0x2
	ldsh	[%l7 + 0x78],	%g1
	movrne	%i4,	%g2,	%l3
	fbul	%fcc1,	loop_675
	umul	%i2,	0x1113,	%i1
	stbar
	ldx	[%l7 + 0x18],	%g3
loop_675:
	tne	%icc,	0x5
	andncc	%g6,	%i6,	%g7
	tge	%icc,	0x3
	fzeros	%f11
	orncc	%l2,	0x051C,	%l4
	tvc	%icc,	0x4
	fexpand	%f11,	%f20
	array32	%g5,	%o2,	%i7
	array16	%o4,	%l6,	%o7
	edge16n	%l0,	%l1,	%i5
	tpos	%icc,	0x1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x53] %asi,	%i3
	tcc	%xcc,	0x2
	ld	[%l7 + 0x34],	%f16
	fpsub32	%f28,	%f10,	%f6
	movcc	%icc,	%o1,	%o0
	fornot2s	%f5,	%f18,	%f28
	fmovsne	%icc,	%f28,	%f7
	popc	%g4,	%o6
	srl	%i0,	%o5,	%o3
	brlez	%l5,	loop_676
	brnz	%i4,	loop_677
	movgu	%icc,	%g2,	%l3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_676:
	tvc	%xcc,	0x4
loop_677:
	xnor	%g1,	0x0D9C,	%i2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%g3,	%i1
	movcc	%xcc,	%g6,	%i6
	ld	[%l7 + 0x34],	%f20
	umul	%l2,	%l4,	%g5
	edge8l	%g7,	%o2,	%i7
	movg	%xcc,	%o4,	%o7
	tg	%xcc,	0x6
	movgu	%xcc,	%l0,	%l1
	taddcc	%l6,	0x1E29,	%i5
	tsubcc	%o1,	0x010A,	%i3
	orn	%o0,	%o6,	%g4
	alignaddr	%i0,	%o5,	%o3
	sethi	0x1D92,	%i4
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f22
	alignaddrl	%g2,	%l3,	%l5
	movcc	%icc,	%g1,	%i2
	tle	%icc,	0x0
	movle	%icc,	%g3,	%i1
	umulcc	%g6,	%l2,	%l4
	orn	%i6,	0x1A03,	%g7
	sethi	0x1EB3,	%o2
	movrgez	%g5,	0x262,	%o4
	tvc	%xcc,	0x5
	sub	%o7,	0x13E0,	%i7
	xnorcc	%l0,	0x15D0,	%l1
	taddcc	%l6,	%o1,	%i3
	subccc	%o0,	%o6,	%i5
	bcc,pn	%xcc,	loop_678
	udivx	%i0,	0x1182,	%o5
	alignaddrl	%g4,	%i4,	%o3
	tn	%xcc,	0x6
loop_678:
	fornot1s	%f17,	%f16,	%f4
	lduh	[%l7 + 0x44],	%l3
	movrlez	%g2,	0x24C,	%l5
	brgez	%g1,	loop_679
	fands	%f3,	%f10,	%f27
	stb	%i2,	[%l7 + 0x2B]
	subcc	%g3,	0x0E62,	%g6
loop_679:
	fbu	%fcc1,	loop_680
	fmovrsgez	%l2,	%f18,	%f29
	tvc	%icc,	0x0
	tpos	%xcc,	0x0
loop_680:
	tg	%xcc,	0x1
	tl	%xcc,	0x7
	bl,a	loop_681
	andcc	%i1,	0x01C0,	%l4
	and	%i6,	%g7,	%o2
	fandnot1	%f22,	%f22,	%f22
loop_681:
	fcmple32	%f30,	%f20,	%g5
	movrgez	%o7,	0x1DF,	%i7
	fone	%f20
	movpos	%xcc,	%o4,	%l1
	edge16	%l6,	%o1,	%i3
	udivx	%o0,	0x043A,	%o6
	bcc	loop_682
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f26,	%f16
	fmovdge	%icc,	%f22,	%f14
loop_682:
	tn	%xcc,	0x1
	fsrc2s	%f2,	%f1
	movge	%xcc,	%l0,	%i5
	ldsw	[%l7 + 0x54],	%i0
	srax	%g4,	0x0B,	%o5
	movn	%icc,	%i4,	%o3
	fblg,a	%fcc3,	loop_683
	movne	%icc,	%g2,	%l3
	brgez,a	%g1,	loop_684
	udivcc	%l5,	0x122C,	%i2
loop_683:
	be,pt	%icc,	loop_685
	tle	%icc,	0x6
loop_684:
	movrgez	%g6,	%l2,	%g3
	fpadd16s	%f27,	%f23,	%f20
loop_685:
	tcs	%xcc,	0x7
	movcs	%icc,	%l4,	%i1
	fone	%f0
	mulscc	%i6,	0x0511,	%o2
	fnegs	%f26,	%f11
	fmovsleu	%icc,	%f6,	%f8
	set	0x1C, %i5
	ldsha	[%l7 + %i5] 0x81,	%g7
	movvs	%xcc,	%o7,	%i7
	tvc	%xcc,	0x2
	array32	%o4,	%l1,	%g5
	andn	%l6,	%i3,	%o0
	tgu	%icc,	0x6
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f30
	fmovdge	%xcc,	%f0,	%f18
	sir	0x1660
	movl	%icc,	%o1,	%l0
	smul	%i5,	%o6,	%i0
	edge32l	%g4,	%o5,	%o3
	sdiv	%i4,	0x1DC2,	%l3
	fble,a	%fcc1,	loop_686
	nop
	fitod	%f10,	%f4
	fdtos	%f4,	%f4
	edge16ln	%g2,	%g1,	%l5
	edge16n	%g6,	%l2,	%i2
loop_686:
	stw	%l4,	[%l7 + 0x44]
	subc	%g3,	%i1,	%i6
	edge8	%o2,	%o7,	%i7
	bcc,a	loop_687
	fpadd32s	%f30,	%f14,	%f22
	movcc	%icc,	%g7,	%o4
	orn	%l1,	%l6,	%g5
loop_687:
	fmovrsgez	%o0,	%f7,	%f10
	fbul	%fcc0,	loop_688
	fxnor	%f2,	%f22,	%f8
	andncc	%i3,	%l0,	%o1
	fmovdle	%icc,	%f24,	%f24
loop_688:
	fcmpeq32	%f10,	%f8,	%o6
	movgu	%icc,	%i5,	%i0
	fmovde	%icc,	%f17,	%f6
	edge32ln	%o5,	%o3,	%g4
	sir	0x015D
	addc	%l3,	0x08C9,	%i4
	tge	%icc,	0x4
	fmovdpos	%icc,	%f16,	%f20
	fbn,a	%fcc3,	loop_689
	movrgz	%g2,	%l5,	%g6
	bpos,a	%icc,	loop_690
	movle	%icc,	%g1,	%i2
loop_689:
	movl	%xcc,	%l4,	%l2
	fmovrsgez	%i1,	%f6,	%f28
loop_690:
	orcc	%g3,	0x0097,	%o2
	nop
	setx	0x55EA4E28,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x55222CB9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f5,	%f29
	ld	[%l7 + 0x64],	%f28
	edge8ln	%i6,	%i7,	%g7
	tleu	%xcc,	0x0
	set	0x18, %g1
	lduwa	[%l7 + %g1] 0x19,	%o7
	set	0x16, %i0
	stha	%l1,	[%l7 + %i0] 0x11
	andn	%l6,	%g5,	%o0
	fors	%f10,	%f16,	%f27
	movre	%o4,	%l0,	%i3
	fone	%f6
	nop
	setx	0x772860165DBFD1E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xC160A36BCF036480,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f0,	%f18
	fmovdleu	%xcc,	%f29,	%f21
	sir	0x0E45
	flush	%l7 + 0x30
	fones	%f3
	xor	%o6,	0x026A,	%i5
	set	0x58, %i2
	ldswa	[%l7 + %i2] 0x14,	%i0
	sll	%o1,	0x1E,	%o5
	tvc	%xcc,	0x5
	edge8n	%o3,	%l3,	%g4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x20] %asi,	%f4
	sra	%g2,	0x17,	%i4
	fmovspos	%xcc,	%f16,	%f29
	sth	%l5,	[%l7 + 0x28]
	edge8	%g1,	%i2,	%g6
	ta	%icc,	0x5
	srlx	%l4,	%i1,	%g3
	sdiv	%l2,	0x00F7,	%i6
	bcc,a	loop_691
	movre	%o2,	%g7,	%o7
	movge	%icc,	%i7,	%l1
	sra	%g5,	0x02,	%l6
loop_691:
	smulcc	%o4,	0x069A,	%o0
	nop
	fitos	%f14,	%f5
	fstod	%f5,	%f18
	tleu	%xcc,	0x6
	udivcc	%l0,	0x1CEE,	%i3
	fpsub32	%f20,	%f26,	%f2
	fcmpeq16	%f20,	%f26,	%i5
	fblg	%fcc3,	loop_692
	subccc	%o6,	0x1B43,	%o1
	movg	%xcc,	%o5,	%i0
	movrgez	%l3,	%o3,	%g2
loop_692:
	movl	%icc,	%i4,	%g4
	sub	%l5,	%i2,	%g6
	edge8	%l4,	%g1,	%i1
	edge16ln	%l2,	%i6,	%o2
	edge8ln	%g7,	%g3,	%i7
	xor	%l1,	0x1374,	%g5
	movvs	%icc,	%l6,	%o7
	movn	%xcc,	%o4,	%l0
	fands	%f22,	%f2,	%f6
	edge32n	%o0,	%i3,	%i5
	fmovdleu	%xcc,	%f26,	%f15
	fornot2s	%f26,	%f23,	%f27
	movneg	%xcc,	%o1,	%o6
	bvs,a,pn	%xcc,	loop_693
	addccc	%o5,	0x1F9D,	%i0
	movvc	%xcc,	%l3,	%g2
	movle	%xcc,	%i4,	%g4
loop_693:
	bne,pt	%icc,	loop_694
	nop
	fitos	%f2,	%f30
	fstoi	%f30,	%f11
	addcc	%l5,	0x078C,	%i2
	bcs,a	%icc,	loop_695
loop_694:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x5C],	%o3
	bg,a,pn	%xcc,	loop_696
loop_695:
	fmovrsne	%g6,	%f11,	%f25
	prefetch	[%l7 + 0x30],	 0x1
	nop
	setx	0x004AE75D,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
loop_696:
	tsubcctv	%l4,	0x0816,	%i1
	movvc	%xcc,	%l2,	%g1
	fexpand	%f27,	%f14
	fblg	%fcc2,	loop_697
	mulscc	%o2,	0x1871,	%g7
	call	loop_698
	movcc	%icc,	%g3,	%i6
loop_697:
	fbn,a	%fcc1,	loop_699
	fpadd32	%f22,	%f2,	%f6
loop_698:
	subccc	%i7,	0x016A,	%l1
	tcc	%xcc,	0x3
loop_699:
	tle	%xcc,	0x6
	movpos	%icc,	%l6,	%g5
	fnot1s	%f27,	%f0
	tge	%xcc,	0x0
	fmovsg	%icc,	%f20,	%f20
	orcc	%o7,	0x1059,	%l0
	ldub	[%l7 + 0x09],	%o0
	orn	%o4,	%i5,	%i3
	bgu,a,pn	%xcc,	loop_700
	fmovrse	%o6,	%f11,	%f17
	nop
	setx	0x590DFEFDE04158F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movvc	%icc,	%o5,	%i0
loop_700:
	fcmpeq32	%f18,	%f0,	%o1
	be,a	%xcc,	loop_701
	movge	%xcc,	%l3,	%i4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x44] %asi,	%g4
loop_701:
	smul	%l5,	0x1D90,	%g2
	srax	%o3,	%g6,	%l4
	andcc	%i1,	0x0F9B,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l2,	%o2,	%g1
	mulx	%g7,	%g3,	%i6
	edge16n	%l1,	%l6,	%i7
	taddcctv	%o7,	0x1E95,	%l0
	fbe	%fcc0,	loop_702
	nop
	setx	0xEE45B154,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x12CBB599,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fsubs	%f7,	%f13,	%f1
	movrgez	%o0,	%o4,	%g5
	fmovdcs	%xcc,	%f24,	%f17
loop_702:
	fabsd	%f16,	%f4
	fbue,a	%fcc0,	loop_703
	movne	%xcc,	%i5,	%i3
	fmovrsgz	%o6,	%f6,	%f26
	array32	%o5,	%o1,	%i0
loop_703:
	addc	%l3,	0x13F7,	%g4
	edge8ln	%l5,	%i4,	%o3
	bl,a	loop_704
	smul	%g2,	0x0888,	%l4
	wr	%g0,	0xe2,	%asi
	stwa	%g6,	[%l7 + 0x48] %asi
	membar	#Sync
loop_704:
	srlx	%i1,	0x12,	%i2
	edge32n	%o2,	%g1,	%l2
	edge8ln	%g3,	%g7,	%i6
	fsrc1s	%f27,	%f21
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%l1
	fnot2s	%f15,	%f22
	srax	%i7,	0x0E,	%o7
	nop
	fitod	%f28,	%f6
	tvc	%xcc,	0x2
	edge16	%l0,	%o0,	%l6
	tcc	%xcc,	0x2
	ldub	[%l7 + 0x23],	%o4
	bne,a	loop_705
	tcc	%icc,	0x3
	edge32ln	%i5,	%g5,	%i3
	or	%o5,	0x1B20,	%o6
loop_705:
	fones	%f6
	addc	%o1,	0x0362,	%i0
	array32	%l3,	%g4,	%l5
	xnorcc	%i4,	%o3,	%g2
	tcs	%icc,	0x0
	sll	%g6,	0x0C,	%i1
	fpmerge	%f24,	%f10,	%f8
	bne,a	%icc,	loop_706
	std	%f10,	[%l7 + 0x68]
	ldsw	[%l7 + 0x34],	%l4
	edge8n	%i2,	%g1,	%l2
loop_706:
	ldd	[%l7 + 0x58],	%f2
	umul	%g3,	%g7,	%o2
	fsrc1	%f4,	%f24
	udivx	%l1,	0x016D,	%i7
	lduh	[%l7 + 0x12],	%o7
	bneg	%xcc,	loop_707
	subccc	%l0,	0x12B4,	%o0
	fmovrdgz	%l6,	%f0,	%f26
	tl	%icc,	0x6
loop_707:
	nop
	set	0x41, %o0
	stba	%i6,	[%l7 + %o0] 0x15
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f2
	fxtod	%f2,	%f16
	set	0x26, %g4
	ldsha	[%l7 + %g4] 0x81,	%o4
	edge16l	%i5,	%g5,	%o5
	fba,a	%fcc3,	loop_708
	bl,a,pn	%xcc,	loop_709
	fnegd	%f22,	%f30
	fmovdleu	%xcc,	%f8,	%f25
loop_708:
	nop
	fitod	%f8,	%f26
	fdtox	%f26,	%f2
loop_709:
	orcc	%i3,	%o6,	%o1
	subccc	%i0,	0x09BC,	%l3
	movvs	%xcc,	%l5,	%i4
	fmovscs	%xcc,	%f8,	%f2
	orncc	%g4,	%g2,	%g6
	brgz	%o3,	loop_710
	andn	%i1,	%i2,	%g1
	bg,a	%xcc,	loop_711
	edge16	%l4,	%l2,	%g7
loop_710:
	call	loop_712
	ldd	[%l7 + 0x20],	%g2
loop_711:
	tne	%icc,	0x1
	sra	%o2,	%l1,	%i7
loop_712:
	tl	%xcc,	0x4
	orncc	%l0,	%o0,	%o7
	fpack16	%f10,	%f17
	sdivcc	%l6,	0x1DEE,	%o4
	mulx	%i6,	0x1348,	%g5
	movrlez	%o5,	0x210,	%i5
	fblg,a	%fcc2,	loop_713
	movl	%icc,	%i3,	%o1
	nop
	setx	loop_714,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%icc,	%i0,	%o6
loop_713:
	bneg,a	loop_715
	fbu,a	%fcc0,	loop_716
loop_714:
	edge32n	%l5,	%l3,	%i4
	fbuge	%fcc2,	loop_717
loop_715:
	orcc	%g4,	0x0170,	%g2
loop_716:
	add	%g6,	0x048B,	%i1
	bge,a	%xcc,	loop_718
loop_717:
	fandnot2s	%f19,	%f18,	%f7
	andn	%o3,	0x1D5F,	%i2
	sethi	0x18E9,	%g1
loop_718:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x30] %asi,	%f17
	tne	%xcc,	0x1
	nop
	setx	loop_719,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x163D
	edge8l	%l2,	%g7,	%l4
	movcc	%icc,	%g3,	%o2
loop_719:
	ldx	[%l7 + 0x10],	%l1
	wr	%g0,	0x10,	%asi
	stha	%i7,	[%l7 + 0x6A] %asi
	tvs	%xcc,	0x4
	sra	%o0,	%l0,	%l6
	bpos,a,pt	%xcc,	loop_720
	fandnot1s	%f19,	%f10,	%f16
	sra	%o7,	%i6,	%g5
	nop
	setx	0x33763D9BF4C1837B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xF32B157A65B3BEE7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f18,	%f12
loop_720:
	fmovrsne	%o5,	%f31,	%f27
	tge	%icc,	0x4
	sethi	0x1AF4,	%o4
	movrlez	%i3,	%i5,	%i0
	movgu	%xcc,	%o1,	%o6
	array32	%l5,	%i4,	%l3
	ble,a	%xcc,	loop_721
	ld	[%l7 + 0x14],	%f20
	fsrc2s	%f28,	%f20
	fmul8x16	%f8,	%f30,	%f30
loop_721:
	fpsub32s	%f5,	%f19,	%f0
	xnorcc	%g2,	0x1492,	%g4
	tsubcc	%g6,	0x08C6,	%o3
	brlez,a	%i1,	loop_722
	edge16ln	%i2,	%l2,	%g1
	set	0x2A, %i7
	stha	%l4,	[%l7 + %i7] 0xeb
	membar	#Sync
loop_722:
	membar	0x12
	fmovsg	%xcc,	%f14,	%f28
	srax	%g3,	0x01,	%g7
	edge8ln	%l1,	%o2,	%o0
	bneg	loop_723
	fnot2	%f8,	%f6
	movpos	%xcc,	%l0,	%i7
	xorcc	%o7,	0x0FED,	%l6
loop_723:
	fmovsvs	%xcc,	%f22,	%f18
	array16	%i6,	%o5,	%o4
	flush	%l7 + 0x08
	edge8n	%i3,	%i5,	%g5
	orcc	%i0,	%o6,	%o1
	fxnor	%f24,	%f0,	%f14
	stx	%l5,	[%l7 + 0x18]
	bpos,pn	%xcc,	loop_724
	fpack32	%f24,	%f28,	%f28
	tsubcctv	%i4,	0x1256,	%g2
	movn	%xcc,	%g4,	%g6
loop_724:
	subccc	%l3,	0x0635,	%o3
	edge8n	%i1,	%i2,	%l2
	movcc	%icc,	%g1,	%g3
	call	loop_725
	tle	%xcc,	0x4
	ble,a	loop_726
	movre	%g7,	%l1,	%o2
loop_725:
	nop
	setx	loop_727,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvs	%icc,	%o0,	%l4
loop_726:
	movrne	%i7,	0x11C,	%l0
	tvs	%xcc,	0x4
loop_727:
	std	%f10,	[%l7 + 0x40]
	ldsw	[%l7 + 0x3C],	%o7
	fmovde	%icc,	%f22,	%f19
	bg	%icc,	loop_728
	fble	%fcc2,	loop_729
	nop
	setx	loop_730,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivcc	%i6,	0x111C,	%o5
loop_728:
	array16	%l6,	%i3,	%o4
loop_729:
	lduw	[%l7 + 0x68],	%g5
loop_730:
	tg	%icc,	0x5
	popc	%i0,	%i5
	movrne	%o6,	0x2DB,	%o1
	mova	%icc,	%l5,	%i4
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x80
	fpmerge	%f3,	%f31,	%f26
	fmovdn	%xcc,	%f13,	%f1
	brnz	%g2,	loop_731
	bneg,a	loop_732
	orn	%g4,	0x09B5,	%l3
	tvc	%icc,	0x4
loop_731:
	fnot1s	%f17,	%f9
loop_732:
	sir	0x00B3
	subcc	%g6,	%o3,	%i2
	nop
	setx	loop_733,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%l2,	%i1,	%g1
	ldx	[%l7 + 0x68],	%g3
	brgz,a	%l1,	loop_734
loop_733:
	movn	%xcc,	%g7,	%o2
	bn	%xcc,	loop_735
	fpadd16s	%f20,	%f2,	%f6
loop_734:
	smulcc	%l4,	%o0,	%l0
	set	0x78, %o5
	prefetcha	[%l7 + %o5] 0x80,	 0x2
loop_735:
	fabsd	%f2,	%f30
	fba	%fcc3,	loop_736
	fmuld8ulx16	%f0,	%f13,	%f18
	edge8n	%i7,	%i6,	%l6
	array8	%o5,	%i3,	%o4
loop_736:
	bneg,a,pt	%icc,	loop_737
	move	%xcc,	%g5,	%i5
	udiv	%o6,	0x0F92,	%i0
	fnegd	%f10,	%f12
loop_737:
	tle	%xcc,	0x6
	sub	%o1,	0x0C07,	%i4
	fmovdneg	%icc,	%f6,	%f15
	tvs	%xcc,	0x5
	tle	%xcc,	0x2
	movrlez	%l5,	%g4,	%l3
	mulx	%g6,	0x1118,	%o3
	mulscc	%i2,	%g2,	%i1
	stb	%g1,	[%l7 + 0x59]
	movcc	%icc,	%l2,	%g3
	edge8ln	%l1,	%g7,	%l4
	bn	%icc,	loop_738
	swap	[%l7 + 0x34],	%o2
	movle	%icc,	%o0,	%l0
	bneg,a	loop_739
loop_738:
	tsubcctv	%o7,	%i7,	%l6
	orn	%i6,	0x143B,	%i3
	fcmpeq16	%f24,	%f26,	%o5
loop_739:
	fmovdge	%xcc,	%f18,	%f21
	movrgez	%o4,	0x2A5,	%i5
	edge16l	%o6,	%g5,	%i0
	move	%xcc,	%o1,	%l5
	taddcc	%g4,	0x1901,	%i4
	xorcc	%l3,	0x07F1,	%o3
	tn	%icc,	0x1
	nop
	setx	loop_740,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnegs	%f29,	%f22
	tl	%icc,	0x5
	tvs	%icc,	0x5
loop_740:
	fpack16	%f4,	%f7
	nop
	set	0x30, %i3
	lduh	[%l7 + %i3],	%g6
	tsubcctv	%i2,	0x0BE9,	%g2
	mova	%icc,	%i1,	%g1
	or	%g3,	%l2,	%g7
	umul	%l4,	%l1,	%o0
	fbu,a	%fcc0,	loop_741
	orcc	%o2,	0x1BB4,	%l0
	mulscc	%i7,	0x1DBE,	%l6
	fmovsle	%icc,	%f19,	%f30
loop_741:
	bcc,a	loop_742
	movvs	%icc,	%o7,	%i6
	movge	%xcc,	%o5,	%i3
	add	%o4,	0x08CB,	%i5
loop_742:
	tn	%icc,	0x2
	fpsub16s	%f8,	%f8,	%f14
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%g5
	and	%o1,	%l5,	%i0
	alignaddr	%g4,	%i4,	%o3
	fcmpeq16	%f18,	%f22,	%l3
	brz	%i2,	loop_743
	fmovrdlz	%g6,	%f0,	%f24
	movrlez	%i1,	0x28C,	%g1
	edge32n	%g2,	%l2,	%g7
loop_743:
	movrlz	%l4,	0x1EE,	%g3
	fmovsvc	%xcc,	%f25,	%f29
	sdivx	%o0,	0x01B9,	%o2
	fmovda	%icc,	%f17,	%f15
	nop
	setx	loop_744,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldub	[%l7 + 0x3D],	%l1
	movcc	%icc,	%l0,	%i7
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
	movcc	%xcc,	%o7,	%l6
	udivx	%o5,	0x13E6,	%i6
	bvs,pn	%xcc,	loop_746
loop_745:
	fmovrslez	%i3,	%f27,	%f7
	nop
	set	0x28, %l1
	ldsw	[%l7 + %l1],	%i5
	ta	%xcc,	0x5
loop_746:
	bge,a	%icc,	loop_747
	tvc	%icc,	0x1
	movpos	%xcc,	%o6,	%o4
	bgu,a,pt	%icc,	loop_748
loop_747:
	sir	0x0C29
	fbl	%fcc2,	loop_749
	fmovde	%xcc,	%f29,	%f8
loop_748:
	tn	%xcc,	0x6
	te	%icc,	0x0
loop_749:
	sethi	0x1233,	%o1
	edge8	%l5,	%g5,	%i0
	movg	%icc,	%g4,	%i4
	tgu	%icc,	0x0
	brlz,a	%l3,	loop_750
	brlez,a	%o3,	loop_751
	nop
	set	0x50, %l6
	lduh	[%l7 + %l6],	%i2
	movl	%xcc,	%i1,	%g6
loop_750:
	fzero	%f4
loop_751:
	mulx	%g2,	%l2,	%g7
	add	%l4,	0x1DAF,	%g3
	for	%f12,	%f2,	%f28
	movne	%icc,	%g1,	%o2
	alignaddr	%l1,	%l0,	%o0
	bleu,a,pt	%xcc,	loop_752
	udiv	%i7,	0x0A2F,	%l6
	orcc	%o7,	%o5,	%i3
	orn	%i6,	0x119E,	%i5
loop_752:
	fmovdvs	%icc,	%f6,	%f19
	nop
	setx	loop_753,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bneg,a	%xcc,	loop_754
	tvs	%icc,	0x6
	membar	0x10
loop_753:
	bge	loop_755
loop_754:
	movg	%icc,	%o4,	%o1
	andn	%l5,	%o6,	%i0
	bn,a,pn	%icc,	loop_756
loop_755:
	movn	%icc,	%g4,	%i4
	udiv	%l3,	0x19B6,	%o3
	tle	%xcc,	0x0
loop_756:
	udivcc	%i2,	0x1A37,	%i1
	fpadd32	%f20,	%f14,	%f10
	ld	[%l7 + 0x74],	%f4
	taddcctv	%g5,	%g2,	%g6
	call	loop_757
	fbe,a	%fcc3,	loop_758
	edge16ln	%g7,	%l4,	%l2
	tsubcctv	%g1,	0x023C,	%g3
loop_757:
	movleu	%icc,	%o2,	%l0
loop_758:
	tge	%icc,	0x1
	bgu,a,pt	%xcc,	loop_759
	fbug,a	%fcc1,	loop_760
	fbule,a	%fcc3,	loop_761
	srax	%o0,	0x02,	%l1
loop_759:
	fpmerge	%f27,	%f7,	%f16
loop_760:
	sir	0x10B4
loop_761:
	edge16n	%l6,	%o7,	%o5
	fmuld8sux16	%f18,	%f14,	%f14
	alignaddrl	%i7,	%i6,	%i5
	alignaddrl	%i3,	%o4,	%l5
	andcc	%o6,	%i0,	%g4
	wr	%g0,	0x10,	%asi
	stha	%o1,	[%l7 + 0x38] %asi
	addccc	%l3,	0x0AA7,	%o3
	nop
	setx	0xDE304015ABB2EE36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x47A5BE52400D41AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f16,	%f14
	fandnot2s	%f15,	%f7,	%f4
	brgez,a	%i4,	loop_762
	nop
	setx	0xBE5BA5C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xDF17A41A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f25,	%f23
	smul	%i1,	%i2,	%g2
	udivx	%g6,	0x0584,	%g5
loop_762:
	fmovspos	%xcc,	%f18,	%f2
	edge16n	%l4,	%g7,	%l2
	sll	%g3,	%o2,	%g1
	sethi	0x1E61,	%o0
	movneg	%icc,	%l1,	%l6
	fcmpne16	%f8,	%f8,	%o7
	fmovdcc	%xcc,	%f21,	%f20
	fmovrdgz	%l0,	%f26,	%f20
	nop
	setx	0x304C2C4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	xnor	%i7,	%i6,	%i5
	movge	%icc,	%o5,	%o4
	fands	%f14,	%f19,	%f28
	stb	%i3,	[%l7 + 0x73]
	tsubcc	%o6,	0x0702,	%l5
	fbl,a	%fcc2,	loop_763
	andn	%i0,	%g4,	%l3
	edge16n	%o1,	%i4,	%i1
	fbo,a	%fcc1,	loop_764
loop_763:
	edge8	%i2,	%g2,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x7E, %o3
	ldsha	[%l7 + %o3] 0x88,	%g5
loop_764:
	fcmple32	%f26,	%f10,	%l4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x52] %asi,	%o3
	ta	%xcc,	0x0
	movgu	%xcc,	%g7,	%g3
	sra	%l2,	%o2,	%g1
	fnor	%f18,	%f10,	%f22
	edge16ln	%o0,	%l6,	%l1
	tcc	%icc,	0x0
	movle	%icc,	%o7,	%i7
	fxnor	%f14,	%f22,	%f8
	movl	%xcc,	%i6,	%l0
	fmovrdlz	%o5,	%f30,	%f30
	edge32n	%o4,	%i5,	%o6
	ldstub	[%l7 + 0x5F],	%l5
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%i0
	swap	[%l7 + 0x7C],	%g4
	movvc	%xcc,	%l3,	%i3
	fmovrse	%i4,	%f14,	%f7
	wr	%g0,	0x88,	%asi
	stxa	%o1,	[%l7 + 0x58] %asi
	tsubcc	%i1,	0x0CB7,	%i2
	andn	%g2,	%g5,	%l4
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x11,	%f16
	srlx	%g6,	%o3,	%g7
	tle	%xcc,	0x0
	edge8l	%g3,	%l2,	%o2
	array16	%g1,	%o0,	%l6
	ld	[%l7 + 0x18],	%f8
	fand	%f0,	%f6,	%f0
	tl	%xcc,	0x5
	fmovda	%icc,	%f13,	%f21
	brgez,a	%o7,	loop_765
	bcs,a	loop_766
	fmovrdlez	%i7,	%f8,	%f28
	te	%xcc,	0x4
loop_765:
	fmovde	%icc,	%f3,	%f2
loop_766:
	ble,a,pt	%icc,	loop_767
	movrlz	%l1,	0x300,	%l0
	fabsd	%f8,	%f14
	andcc	%i6,	0x13F5,	%o5
loop_767:
	tleu	%xcc,	0x0
	addcc	%o4,	%o6,	%l5
	movrlez	%i0,	0x2E4,	%i5
	orcc	%g4,	%i3,	%l3
	or	%o1,	0x0327,	%i1
	ta	%icc,	0x4
	edge8n	%i2,	%g2,	%i4
	tvs	%icc,	0x4
	fpsub32	%f20,	%f8,	%f14
	edge16	%l4,	%g6,	%o3
	taddcctv	%g5,	0x0CBD,	%g7
	flush	%l7 + 0x74
	movvs	%xcc,	%l2,	%o2
	bl,pn	%icc,	loop_768
	ba,a,pn	%xcc,	loop_769
	taddcctv	%g3,	0x0784,	%g1
	stbar
loop_768:
	fble	%fcc0,	loop_770
loop_769:
	ldub	[%l7 + 0x78],	%o0
	fbu,a	%fcc3,	loop_771
	edge32	%o7,	%i7,	%l6
loop_770:
	nop
	set	0x4C, %l2
	ldsb	[%l7 + %l2],	%l0
	addccc	%i6,	%l1,	%o5
loop_771:
	subc	%o4,	0x15DE,	%o6
	edge8n	%i0,	%i5,	%g4
	taddcc	%l5,	0x03AF,	%i3
	array32	%o1,	%i1,	%l3
	umul	%g2,	%i4,	%l4
	fsrc1s	%f3,	%f8
	tle	%icc,	0x4
	edge32ln	%g6,	%o3,	%i2
	tle	%xcc,	0x5
	alignaddr	%g7,	%g5,	%o2
	movne	%icc,	%g3,	%l2
	set	0x1C, %i1
	lduwa	[%l7 + %i1] 0x14,	%g1
	bcs,a,pt	%xcc,	loop_772
	subcc	%o7,	0x1F85,	%o0
	sdiv	%i7,	0x1C55,	%l0
	prefetch	[%l7 + 0x34],	 0x1
loop_772:
	addc	%i6,	0x1E38,	%l1
	ldsb	[%l7 + 0x4F],	%o5
	array16	%o4,	%l6,	%i0
	nop
	fitos	%f5,	%f14
	fstod	%f14,	%f4
	fmovdpos	%icc,	%f20,	%f15
	fpsub32s	%f5,	%f17,	%f14
	fones	%f29
	te	%icc,	0x4
	fmovrdgez	%o6,	%f4,	%f8
	bn,pn	%xcc,	loop_773
	srlx	%i5,	0x1C,	%g4
	fbge	%fcc3,	loop_774
	sllx	%l5,	%i3,	%o1
loop_773:
	fmovrde	%i1,	%f22,	%f30
	fabss	%f4,	%f2
loop_774:
	pdist	%f30,	%f4,	%f22
	edge16	%g2,	%l3,	%l4
	fnegs	%f13,	%f22
	tpos	%xcc,	0x3
	movvs	%xcc,	%i4,	%o3
	fbue,a	%fcc3,	loop_775
	movrgz	%g6,	0x0E7,	%i2
	movrlz	%g5,	0x0B1,	%g7
	fzeros	%f10
loop_775:
	stbar
	movleu	%xcc,	%o2,	%g3
	alignaddr	%l2,	%o7,	%o0
	udiv	%i7,	0x1DE8,	%l0
	movrgz	%i6,	%l1,	%o5
	ba,pt	%xcc,	loop_776
	ble,a,pn	%icc,	loop_777
	fbl,a	%fcc1,	loop_778
	brgez,a	%o4,	loop_779
loop_776:
	ldub	[%l7 + 0x56],	%g1
loop_777:
	movn	%xcc,	%l6,	%i0
loop_778:
	udivx	%i5,	0x1494,	%o6
loop_779:
	movrgz	%g4,	%l5,	%i3
	movpos	%xcc,	%i1,	%o1
	tl	%icc,	0x0
	membar	0x61
	taddcctv	%l3,	0x0C43,	%l4
	bl,pt	%xcc,	loop_780
	fnegd	%f20,	%f12
	fpack32	%f22,	%f8,	%f12
	fornot2s	%f9,	%f16,	%f31
loop_780:
	edge32	%g2,	%i4,	%g6
	andn	%i2,	%o3,	%g5
	udiv	%o2,	0x166C,	%g7
	brnz	%l2,	loop_781
	nop
	setx	0x46E6EBD75F1C374E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xAF07519BD0D862B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f14,	%f16
	udivcc	%o7,	0x12FC,	%o0
	fnor	%f8,	%f2,	%f14
loop_781:
	add	%i7,	0x0C88,	%l0
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f26
	tl	%xcc,	0x1
	edge16n	%i6,	%g3,	%o5
	set	0x34, %o2
	lda	[%l7 + %o2] 0x10,	%f4
	sdivx	%l1,	0x1D00,	%g1
	orn	%l6,	0x0E56,	%o4
	ldsb	[%l7 + 0x3B],	%i5
	alignaddrl	%o6,	%g4,	%i0
	array16	%l5,	%i1,	%i3
	udivx	%l3,	0x126E,	%o1
	fcmple32	%f12,	%f30,	%l4
	set	0x23, %g6
	lduba	[%l7 + %g6] 0x89,	%i4
	sub	%g2,	0x175A,	%g6
	fxor	%f6,	%f0,	%f22
	movne	%icc,	%i2,	%g5
	addcc	%o3,	%g7,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o7,	%o0,	%l2
	edge32	%l0,	%i7,	%i6
	fmovdgu	%xcc,	%f13,	%f21
	bg	loop_782
	tvs	%icc,	0x1
	addccc	%g3,	0x0517,	%l1
	nop
	fitos	%f11,	%f0
	fstoi	%f0,	%f16
loop_782:
	array32	%o5,	%l6,	%o4
	tge	%icc,	0x1
	tneg	%xcc,	0x0
	movneg	%xcc,	%i5,	%g1
	fpmerge	%f23,	%f23,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%o6,	%i0
	smulcc	%l5,	%i1,	%i3
	fmovsne	%icc,	%f4,	%f31
	nop
	fitod	%f8,	%f8
	fdtos	%f8,	%f5
	nop
	setx	0x6D0BB731558B101E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x8AA88D2E8420298C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f8,	%f24
	movrne	%g4,	0x1AD,	%o1
	fpadd32	%f14,	%f4,	%f12
	set	0x5C, %l3
	lda	[%l7 + %l3] 0x15,	%f3
	tg	%xcc,	0x1
	taddcc	%l3,	%l4,	%g2
	ldsb	[%l7 + 0x65],	%i4
	movge	%icc,	%g6,	%i2
	xnor	%o3,	%g5,	%o2
	nop
	fitod	%f2,	%f24
	tle	%xcc,	0x6
	brgez,a	%o7,	loop_783
	movneg	%icc,	%o0,	%g7
	edge32ln	%l0,	%i7,	%l2
	movcc	%xcc,	%g3,	%i6
loop_783:
	fmovdn	%xcc,	%f3,	%f23
	tsubcctv	%l1,	%l6,	%o4
	movvs	%xcc,	%i5,	%g1
	sdiv	%o5,	0x0314,	%o6
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x19,	 0x0
	fmovsa	%xcc,	%f2,	%f25
	xorcc	%i0,	%i3,	%g4
	brgez,a	%o1,	loop_784
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i1,	0x18E6,	%l3
	movg	%icc,	%g2,	%l4
loop_784:
	udivx	%i4,	0x045D,	%i2
	fba,a	%fcc2,	loop_785
	fmovrdgez	%g6,	%f4,	%f30
	tge	%icc,	0x2
	fbo	%fcc2,	loop_786
loop_785:
	array8	%g5,	%o2,	%o7
	sdivx	%o3,	0x1D06,	%o0
	bcc,a,pn	%xcc,	loop_787
loop_786:
	udiv	%l0,	0x0B89,	%g7
	fnot2	%f22,	%f22
	sdiv	%l2,	0x0983,	%i7
loop_787:
	bge,a,pt	%xcc,	loop_788
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g3,	0x16C0,	%i6
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f16
	fxtod	%f16,	%f2
loop_788:
	addc	%l6,	%o4,	%i5
	membar	0x7A
	array32	%g1,	%o5,	%o6
	movrlez	%l5,	0x036,	%l1
	fmovrde	%i0,	%f0,	%f4
	array16	%g4,	%i3,	%o1
	tle	%icc,	0x1
	fnegs	%f21,	%f14
	nop
	setx	0xBF13011F3142392B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xFBEFBE2F4F7AE94B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f10,	%f4
	subcc	%i1,	%l3,	%g2
	umul	%i4,	%i2,	%g6
	fmovsa	%icc,	%f15,	%f2
	tneg	%xcc,	0x4
	subcc	%l4,	%o2,	%g5
	nop
	set	0x70, %l4
	prefetch	[%l7 + %l4],	 0x2
	movg	%icc,	%o3,	%o7
	fbl,a	%fcc1,	loop_789
	nop
	set	0x50, %o7
	prefetch	[%l7 + %o7],	 0x0
	tcc	%icc,	0x6
	xorcc	%o0,	0x0AFD,	%g7
loop_789:
	add	%l2,	0x0051,	%l0
	fmovrdlz	%i7,	%f30,	%f16
	prefetch	[%l7 + 0x40],	 0x2
	movl	%xcc,	%g3,	%i6
	fmovrsgez	%o4,	%f8,	%f25
	fbuge,a	%fcc0,	loop_790
	add	%i5,	%g1,	%o5
	fcmpne32	%f12,	%f8,	%o6
	fmovsgu	%icc,	%f29,	%f8
loop_790:
	fbge,a	%fcc1,	loop_791
	fmovsa	%icc,	%f4,	%f28
	fmovdleu	%icc,	%f3,	%f6
	andn	%l5,	0x0FB1,	%l1
loop_791:
	edge8l	%l6,	%i0,	%i3
	movrne	%o1,	%i1,	%l3
	movrgz	%g2,	0x3BF,	%i4
	edge16	%i2,	%g4,	%g6
	fmovrde	%l4,	%f4,	%f26
	array32	%g5,	%o3,	%o7
	alignaddr	%o2,	%o0,	%g7
	sir	0x1C90
	tle	%xcc,	0x5
	nop
	fitos	%f12,	%f10
	fstoi	%f10,	%f27
	bg,pt	%icc,	loop_792
	tpos	%icc,	0x3
	ldstub	[%l7 + 0x65],	%l0
	udivx	%l2,	0x0C35,	%g3
loop_792:
	fmovrdlez	%i7,	%f28,	%f22
	edge16l	%i6,	%o4,	%i5
	xorcc	%g1,	0x00DB,	%o6
	fcmpeq16	%f12,	%f10,	%o5
	movrlz	%l5,	0x01B,	%l6
	tvc	%icc,	0x7
	umul	%l1,	0x1080,	%i0
	smulcc	%o1,	0x1ECF,	%i1
	set	0x46, %l5
	stha	%i3,	[%l7 + %l5] 0x81
	nop
	setx	0xCF20AED2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f31
	fmovda	%xcc,	%f0,	%f12
	edge8n	%g2,	%l3,	%i4
	srlx	%g4,	0x01,	%i2
	brgez	%g6,	loop_793
	andn	%l4,	%g5,	%o3
	fpadd32	%f22,	%f0,	%f16
	udivx	%o7,	0x004F,	%o0
loop_793:
	xor	%o2,	%l0,	%g7
	smulcc	%l2,	0x0389,	%i7
	fmovdcc	%icc,	%f12,	%f5
	tg	%icc,	0x4
	movgu	%icc,	%i6,	%g3
	fsrc1	%f10,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o4,	%g1,	%o6
	fbe	%fcc1,	loop_794
	addc	%i5,	%l5,	%o5
	movcc	%icc,	%l1,	%l6
	taddcc	%i0,	0x1628,	%o1
loop_794:
	movcc	%xcc,	%i1,	%i3
	addc	%g2,	%i4,	%l3
	fabsd	%f0,	%f30
	mulx	%i2,	0x0B47,	%g6
	addcc	%l4,	0x0726,	%g4
	sir	0x157E
	bl,pn	%icc,	loop_795
	fbul,a	%fcc3,	loop_796
	alignaddr	%g5,	%o3,	%o7
	alignaddr	%o2,	%l0,	%g7
loop_795:
	fsrc2	%f14,	%f8
loop_796:
	fandnot2s	%f6,	%f17,	%f10
	sethi	0x1014,	%o0
	sir	0x0F34
	membar	0x10
	array8	%l2,	%i6,	%g3
	fmovdvs	%icc,	%f29,	%f7
	sdivcc	%o4,	0x0C31,	%g1
	fpmerge	%f31,	%f30,	%f8
	fxor	%f28,	%f0,	%f26
	movleu	%xcc,	%i7,	%o6
	fmovrsgz	%i5,	%f12,	%f26
	tg	%icc,	0x1
	andncc	%l5,	%l1,	%o5
	sll	%i0,	0x1F,	%o1
	xnorcc	%i1,	%i3,	%g2
	edge32ln	%i4,	%l3,	%i2
	addc	%g6,	0x190F,	%l6
	fmovd	%f12,	%f10
	edge8	%g4,	%g5,	%l4
	ta	%xcc,	0x4
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f14
	fxtod	%f14,	%f30
	tpos	%xcc,	0x3
	fpsub16s	%f27,	%f26,	%f8
	edge8	%o7,	%o2,	%o3
	subc	%g7,	%l0,	%l2
	edge16n	%o0,	%g3,	%o4
	fmul8x16au	%f10,	%f26,	%f16
	mulscc	%g1,	%i6,	%i7
	array32	%i5,	%l5,	%l1
	edge8l	%o6,	%i0,	%o5
	ldx	[%l7 + 0x58],	%o1
	fnands	%f25,	%f27,	%f13
	nop
	setx	0x9272FC1C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xC1E7575D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f9,	%f16
	orncc	%i1,	0x1F5F,	%g2
	swap	[%l7 + 0x38],	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x5596D1126E25447E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xDDD41F449DEE9039,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f2,	%f30
	ba,pn	%xcc,	loop_797
	fbl,a	%fcc1,	loop_798
	udivcc	%i3,	0x087D,	%l3
	fbue,a	%fcc2,	loop_799
loop_797:
	sdivcc	%i2,	0x0387,	%l6
loop_798:
	movgu	%icc,	%g6,	%g5
	nop
	fitos	%f6,	%f23
	fstod	%f23,	%f18
loop_799:
	fblg	%fcc1,	loop_800
	tle	%xcc,	0x2
	fornot1s	%f19,	%f13,	%f20
	taddcc	%g4,	0x0B2C,	%l4
loop_800:
	nop
	setx	0xA971E833F06A523A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	tge	%icc,	0x2
	fmovscc	%xcc,	%f1,	%f17
	edge8l	%o2,	%o3,	%g7
	sdiv	%l0,	0x163D,	%l2
	fands	%f24,	%f18,	%f13
	fmovda	%xcc,	%f12,	%f19
	fbo	%fcc3,	loop_801
	tle	%icc,	0x3
	fmovdvs	%icc,	%f29,	%f15
	fbne,a	%fcc1,	loop_802
loop_801:
	edge8ln	%o7,	%o0,	%o4
	flush	%l7 + 0x24
	fpadd16s	%f8,	%f2,	%f17
loop_802:
	array16	%g1,	%g3,	%i7
	fbug,a	%fcc0,	loop_803
	fandnot1s	%f11,	%f16,	%f4
	fbl,a	%fcc2,	loop_804
	nop
	setx	loop_805,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_803:
	ldx	[%l7 + 0x20],	%i5
	ldd	[%l7 + 0x10],	%i6
loop_804:
	fbule,a	%fcc3,	loop_806
loop_805:
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f23
	tvc	%xcc,	0x2
	smul	%l1,	%l5,	%o6
loop_806:
	fmuld8ulx16	%f9,	%f22,	%f22
	movg	%xcc,	%o5,	%o1
	ble,a,pn	%icc,	loop_807
	fornot2s	%f22,	%f23,	%f16
	andn	%i1,	0x0BD9,	%g2
	fpsub32s	%f23,	%f20,	%f29
loop_807:
	fmovdn	%xcc,	%f15,	%f6
	fbl	%fcc0,	loop_808
	addc	%i0,	%i4,	%i3
	ta	%xcc,	0x6
	alignaddrl	%i2,	%l3,	%g6
loop_808:
	addccc	%g5,	0x108B,	%l6
	tleu	%icc,	0x2
	movl	%xcc,	%l4,	%o2
	fbuge	%fcc1,	loop_809
	subc	%g4,	%g7,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x6
loop_809:
	fbo,a	%fcc0,	loop_810
	nop
	setx	0x2B134E6A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xC9F64C8E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f27,	%f26
	sra	%l0,	0x01,	%l2
	array16	%o0,	%o7,	%o4
loop_810:
	bne,pt	%icc,	loop_811
	or	%g1,	0x0FAF,	%i7
	move	%icc,	%i5,	%g3
	brlez,a	%i6,	loop_812
loop_811:
	subccc	%l5,	%o6,	%l1
	alignaddrl	%o5,	%i1,	%o1
	fnot1	%f12,	%f14
loop_812:
	mulscc	%i0,	%g2,	%i3
	alignaddrl	%i2,	%i4,	%g6
	be,a	loop_813
	andcc	%l3,	0x166D,	%g5
	movre	%l4,	%o2,	%l6
	fcmpgt16	%f6,	%f30,	%g4
loop_813:
	nop
	set	0x78, %g3
	sta	%f23,	[%l7 + %g3] 0x04
	set	0x78, %i6
	lda	[%l7 + %i6] 0x19,	%f30
	alignaddr	%g7,	%l0,	%l2
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x60] %asi,	%o0
	tsubcc	%o3,	0x0544,	%o7
	movgu	%xcc,	%o4,	%i7
	fmovrsgez	%i5,	%f8,	%f8
	nop
	setx loop_814, %l0, %l1
	jmpl %l1, %g3
	movneg	%icc,	%g1,	%l5
	or	%i6,	0x04B1,	%l1
	movcs	%icc,	%o6,	%i1
loop_814:
	sra	%o5,	0x05,	%o1
	subcc	%i0,	0x1090,	%g2
	fxors	%f30,	%f9,	%f15
	te	%xcc,	0x6
	tneg	%xcc,	0x5
	edge8l	%i3,	%i4,	%g6
	tleu	%icc,	0x7
	fornot1s	%f24,	%f4,	%f5
	tleu	%xcc,	0x1
	movvs	%icc,	%l3,	%g5
	tvs	%icc,	0x2
	fmovsvc	%xcc,	%f12,	%f23
	array8	%l4,	%i2,	%o2
	fbl,a	%fcc1,	loop_815
	fornot2s	%f29,	%f18,	%f8
	sll	%l6,	0x05,	%g4
	movrgz	%g7,	0x392,	%l0
loop_815:
	fbl,a	%fcc2,	loop_816
	nop
	setx	0xF28EA06A0DDFC3D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xAF73F97CB4B916FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f4,	%f20
	tle	%xcc,	0x3
	addcc	%l2,	0x06E4,	%o3
loop_816:
	fnot2	%f24,	%f10
	fpack16	%f12,	%f3
	movrlz	%o0,	%o7,	%i7
	fmovrslz	%o4,	%f24,	%f19
	brnz,a	%g3,	loop_817
	fnegs	%f26,	%f1
	edge8l	%g1,	%l5,	%i6
	nop
	fitos	%f14,	%f15
	fstox	%f15,	%f0
	fxtos	%f0,	%f13
loop_817:
	subc	%i5,	0x163C,	%l1
	tpos	%icc,	0x4
	tn	%icc,	0x2
	tvc	%icc,	0x2
	sdivx	%i1,	0x13FC,	%o5
	fornot1	%f10,	%f6,	%f2
	nop
	setx	loop_818,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xorcc	%o1,	0x0362,	%i0
	fmovdgu	%icc,	%f8,	%f14
	nop
	fitod	%f6,	%f26
	fdtox	%f26,	%f20
loop_818:
	array32	%g2,	%o6,	%i3
	call	loop_819
	fmovd	%f12,	%f12
	nop
	setx	0x35485E31,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xA55C6428,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f16,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_819:
	fmovd	%f28,	%f6
	sllx	%g6,	0x1F,	%l3
	nop
	fitos	%f30,	%f18
	st	%f11,	[%l7 + 0x0C]
	movpos	%xcc,	%g5,	%l4
	xnorcc	%i2,	%i4,	%l6
	tgu	%xcc,	0x3
	tl	%xcc,	0x3
	fbu	%fcc3,	loop_820
	bgu,a	loop_821
	movcc	%xcc,	%g4,	%g7
	bleu,a	loop_822
loop_820:
	movrlez	%o2,	0x068,	%l2
loop_821:
	ta	%icc,	0x4
	edge8n	%o3,	%l0,	%o7
loop_822:
	xor	%o0,	%o4,	%g3
	set	0x43, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i7
	fmovsle	%icc,	%f24,	%f25
	srax	%l5,	0x05,	%g1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%i6
	taddcc	%l1,	%i1,	%o1
	fmovdl	%xcc,	%f28,	%f1
	xnorcc	%o5,	%g2,	%o6
	fxor	%f4,	%f14,	%f30
	orn	%i0,	%i3,	%l3
	fbg	%fcc2,	loop_823
	fbul,a	%fcc3,	loop_824
	fbge,a	%fcc1,	loop_825
	fpack16	%f30,	%f15
loop_823:
	fblg,a	%fcc1,	loop_826
loop_824:
	nop
	setx loop_827, %l0, %l1
	jmpl %l1, %g6
loop_825:
	tn	%xcc,	0x0
	brgz	%g5,	loop_828
loop_826:
	fble	%fcc0,	loop_829
loop_827:
	edge16n	%i2,	%l4,	%i4
	sll	%g4,	0x0E,	%l6
loop_828:
	addcc	%o2,	%l2,	%o3
loop_829:
	subcc	%g7,	0x007E,	%l0
	or	%o7,	%o0,	%g3
	andncc	%o4,	%l5,	%i7
	or	%g1,	0x010D,	%i6
	nop
	setx	0xC91B9392ED06ED9F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x7F850C6E14B7B4A3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f4,	%f28
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x24] %asi,	%i5
	movvs	%xcc,	%i1,	%l1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x15] %asi,	%o1
	edge8	%o5,	%o6,	%i0
	edge8	%i3,	%l3,	%g6
	fmovrsgez	%g2,	%f2,	%f22
	movgu	%xcc,	%i2,	%g5
	taddcc	%l4,	0x1009,	%i4
	te	%icc,	0x3
	edge8	%l6,	%g4,	%o2
	sll	%l2,	%g7,	%l0
	wr	%g0,	0x19,	%asi
	sta	%f31,	[%l7 + 0x58] %asi
	fors	%f6,	%f28,	%f7
	tg	%xcc,	0x3
	tneg	%icc,	0x6
	movre	%o7,	0x09E,	%o0
	fmovsa	%icc,	%f19,	%f3
	srax	%o3,	%g3,	%o4
	subccc	%i7,	%g1,	%l5
	movg	%xcc,	%i6,	%i1
	fpsub32	%f28,	%f28,	%f0
	std	%f0,	[%l7 + 0x08]
	edge32	%i5,	%l1,	%o1
	tne	%xcc,	0x6
	fpsub32s	%f2,	%f24,	%f19
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%o5
	mulx	%i0,	%i3,	%g6
	fpadd16s	%f7,	%f30,	%f26
	stw	%g2,	[%l7 + 0x3C]
	movvs	%icc,	%i2,	%l3
	set	0x2F, %g5
	ldstuba	[%l7 + %g5] 0x18,	%g5
	sdiv	%l4,	0x0B68,	%l6
	fnot2	%f8,	%f30
	fandnot1	%f30,	%f0,	%f6
	array8	%g4,	%i4,	%o2
	wr	%g0,	0x18,	%asi
	sta	%f18,	[%l7 + 0x24] %asi
	xorcc	%l2,	0x115B,	%g7
	sdivcc	%o7,	0x0BC7,	%l0
	tle	%xcc,	0x0
	edge16ln	%o3,	%o0,	%g3
	taddcc	%i7,	0x0CBA,	%o4
	tge	%xcc,	0x1
	tn	%xcc,	0x7
	fmul8x16	%f27,	%f20,	%f26
	mova	%icc,	%g1,	%l5
	umulcc	%i1,	%i6,	%l1
	movg	%icc,	%o1,	%o6
	fmovrdlz	%i5,	%f2,	%f6
	movpos	%icc,	%i0,	%o5
	movrgz	%g6,	0x070,	%g2
	fbule,a	%fcc3,	loop_830
	tg	%icc,	0x1
	fmovrdlz	%i2,	%f4,	%f6
	movpos	%icc,	%i3,	%l3
loop_830:
	fpadd32s	%f9,	%f6,	%f30
	movg	%icc,	%l4,	%l6
	tsubcctv	%g4,	0x19C5,	%g5
	stx	%i4,	[%l7 + 0x58]
	set	0x3E, %o6
	ldsba	[%l7 + %o6] 0x81,	%l2
	movrlz	%o2,	0x103,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%l0,	%o7
	te	%xcc,	0x2
	fcmpeq16	%f0,	%f4,	%o3
	tsubcc	%o0,	%g3,	%o4
	movrne	%g1,	%i7,	%i1
	fmovrdgz	%i6,	%f6,	%f30
	sll	%l5,	0x13,	%o1
	nop
	fitos	%f2,	%f11
	fstox	%f11,	%f2
	sdiv	%l1,	0x0EB8,	%o6
	edge16ln	%i0,	%i5,	%g6
	movleu	%icc,	%g2,	%o5
	mulx	%i2,	%i3,	%l4
	movrne	%l3,	0x1D9,	%g4
	fbl	%fcc3,	loop_831
	fmovdvc	%icc,	%f17,	%f30
	edge32n	%g5,	%i4,	%l6
	movvc	%xcc,	%l2,	%g7
loop_831:
	movn	%xcc,	%l0,	%o7
	bcs,pn	%xcc,	loop_832
	bpos,a,pt	%xcc,	loop_833
	tsubcctv	%o2,	0x074A,	%o0
	xorcc	%g3,	0x11A5,	%o3
loop_832:
	tneg	%xcc,	0x5
loop_833:
	edge16n	%g1,	%o4,	%i1
	fmovsge	%icc,	%f26,	%f5
	sll	%i7,	0x09,	%l5
	edge32	%o1,	%l1,	%o6
	tcc	%icc,	0x7
	and	%i6,	%i0,	%g6
	sllx	%i5,	0x18,	%g2
	srlx	%o5,	0x02,	%i2
	bl	%xcc,	loop_834
	tne	%xcc,	0x6
	bcc,a	%xcc,	loop_835
	fmovdge	%xcc,	%f5,	%f5
loop_834:
	sdivx	%i3,	0x0953,	%l4
	movl	%xcc,	%l3,	%g4
loop_835:
	move	%icc,	%i4,	%l6
	nop
	set	0x18, %g2
	prefetch	[%l7 + %g2],	 0x2
	movpos	%icc,	%l2,	%g7
	tcs	%xcc,	0x3
	nop
	setx	0x60772202,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o7,	0x020C,	%o2
	tge	%icc,	0x1
	fmovdcc	%xcc,	%f17,	%f17
	movneg	%xcc,	%o0,	%g3
	movl	%xcc,	%o3,	%g5
	wr	%g0,	0x81,	%asi
	sta	%f22,	[%l7 + 0x4C] %asi
	tcs	%xcc,	0x7
	tcs	%icc,	0x7
	ta	%xcc,	0x6
	movre	%o4,	%g1,	%i7
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x20] %asi,	%i1
	taddcctv	%o1,	%l1,	%o6
	popc	0x0CAF,	%i6
	ldx	[%l7 + 0x20],	%i0
	xnorcc	%g6,	%l5,	%g2
	movrlz	%i5,	%o5,	%i2
	tg	%xcc,	0x6
	fsrc1	%f30,	%f10
	tneg	%icc,	0x5
	tleu	%icc,	0x3
	edge16n	%l4,	%i3,	%l3
	bgu	loop_836
	tne	%xcc,	0x1
	flush	%l7 + 0x44
	bvc,pt	%xcc,	loop_837
loop_836:
	fbo	%fcc2,	loop_838
	sra	%i4,	%l6,	%g4
	movneg	%icc,	%l2,	%g7
loop_837:
	movrgez	%l0,	0x24A,	%o7
loop_838:
	sdiv	%o2,	0x13FE,	%o0
	bleu,a,pt	%icc,	loop_839
	edge8ln	%g3,	%o3,	%g5
	brz,a	%g1,	loop_840
	ldsw	[%l7 + 0x34],	%o4
loop_839:
	umul	%i7,	%o1,	%l1
	fnot1	%f22,	%f0
loop_840:
	srax	%i1,	0x00,	%o6
	fcmpne32	%f10,	%f10,	%i0
	fbule	%fcc3,	loop_841
	tgu	%xcc,	0x3
	addc	%i6,	%l5,	%g6
	fmovdcc	%icc,	%f14,	%f0
loop_841:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f29,	[%l7 + 0x1C] %asi
	umulcc	%i5,	%g2,	%i2
	bcs,pn	%icc,	loop_842
	sdivx	%o5,	0x0C70,	%i3
	fmovsneg	%icc,	%f28,	%f11
	udiv	%l4,	0x03C4,	%i4
loop_842:
	movrlez	%l3,	0x091,	%l6
	fbuge,a	%fcc1,	loop_843
	mova	%xcc,	%l2,	%g7
	sir	0x1E1E
	brz	%g4,	loop_844
loop_843:
	movleu	%xcc,	%l0,	%o7
	sll	%o2,	%o0,	%g3
	alignaddrl	%o3,	%g1,	%o4
loop_844:
	xnor	%g5,	%o1,	%i7
	andcc	%i1,	%l1,	%o6
	udivcc	%i0,	0x09D9,	%l5
	edge16	%i6,	%i5,	%g2
	fmovdne	%xcc,	%f14,	%f25
	fmovsle	%icc,	%f31,	%f14
	mova	%xcc,	%i2,	%o5
	sir	0x0EEE
	edge32ln	%g6,	%l4,	%i4
	tne	%xcc,	0x2
	orncc	%i3,	%l3,	%l6
	nop
	setx	loop_845,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tne	%icc,	0x3
	fbo	%fcc2,	loop_846
	array16	%g7,	%l2,	%g4
loop_845:
	fbuge	%fcc3,	loop_847
	fmovsneg	%xcc,	%f17,	%f9
loop_846:
	addccc	%l0,	%o2,	%o0
	fpadd16s	%f26,	%f4,	%f6
loop_847:
	std	%f0,	[%l7 + 0x20]
	set	0x0F, %o1
	stba	%o7,	[%l7 + %o1] 0x2f
	membar	#Sync
	fmul8sux16	%f6,	%f24,	%f18
	nop
	setx	loop_848,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%g3,	0x21F,	%g1
	movg	%xcc,	%o3,	%o4
	fpmerge	%f17,	%f27,	%f28
loop_848:
	movn	%icc,	%g5,	%i7
	set	0x18, %i5
	ldxa	[%l7 + %i5] 0x88,	%i1
	tle	%xcc,	0x2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o1,	%o6
	nop
	setx	loop_849,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnor	%i0,	0x1F81,	%l1
	edge32n	%l5,	%i6,	%g2
	fbue,a	%fcc2,	loop_850
loop_849:
	addccc	%i5,	%i2,	%o5
	alignaddr	%g6,	%i4,	%i3
	bcc,pn	%xcc,	loop_851
loop_850:
	udivcc	%l3,	0x0999,	%l4
	fmovdl	%icc,	%f26,	%f25
	movrgez	%l6,	%l2,	%g7
loop_851:
	sub	%g4,	0x029A,	%l0
	andncc	%o0,	%o7,	%o2
	mova	%icc,	%g3,	%o3
	xorcc	%o4,	%g1,	%g5
	stb	%i7,	[%l7 + 0x39]
	movrlez	%o1,	%i1,	%i0
	xnor	%l1,	0x10A1,	%o6
	or	%i6,	%g2,	%i5
	tleu	%icc,	0x1
	be,pt	%icc,	loop_852
	edge16	%i2,	%l5,	%o5
	movvc	%xcc,	%g6,	%i4
	movre	%l3,	0x28E,	%i3
loop_852:
	nop
	setx	0x4B8CAC1AC4380EDD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x6D09C0C69F85ECD4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f12,	%f24
	tvc	%xcc,	0x0
	srax	%l6,	%l2,	%l4
	popc	0x08D1,	%g4
	udivcc	%l0,	0x0A29,	%g7
	set	0x24, %i0
	stha	%o7,	[%l7 + %i0] 0x19
	and	%o2,	0x06BF,	%o0
	nop
	setx	0x3DAF33A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x712FE85F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f3,	%f27
	fcmpgt16	%f10,	%f22,	%g3
	bleu,pt	%xcc,	loop_853
	fpmerge	%f31,	%f31,	%f18
	fornot1	%f8,	%f12,	%f14
	smul	%o3,	%o4,	%g1
loop_853:
	te	%xcc,	0x2
	movvs	%icc,	%g5,	%i7
	tleu	%icc,	0x1
	edge32ln	%o1,	%i1,	%i0
	fbul,a	%fcc2,	loop_854
	fornot1s	%f8,	%f11,	%f6
	stbar
	movleu	%icc,	%l1,	%i6
loop_854:
	movcc	%icc,	%o6,	%i5
	move	%xcc,	%i2,	%l5
	and	%g2,	%g6,	%i4
	tleu	%xcc,	0x0
	fbu	%fcc2,	loop_855
	andcc	%o5,	%l3,	%i3
	tvc	%xcc,	0x7
	ta	%icc,	0x0
loop_855:
	tg	%xcc,	0x0
	fcmple16	%f8,	%f4,	%l6
	edge32ln	%l2,	%g4,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f16,	%f26,	%f2
	andcc	%g7,	0x1E19,	%o7
	fnand	%f16,	%f14,	%f0
	membar	0x6B
	edge16	%o2,	%l0,	%g3
	edge16n	%o0,	%o4,	%g1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x24] %asi,	%o3
	fcmple32	%f14,	%f0,	%g5
	edge32	%o1,	%i1,	%i7
	ldsw	[%l7 + 0x10],	%l1
	umulcc	%i0,	%o6,	%i6
	tsubcc	%i2,	%i5,	%g2
	move	%xcc,	%l5,	%g6
	sir	0x0FB6
	addcc	%i4,	%l3,	%o5
	tn	%xcc,	0x7
	fmovsleu	%icc,	%f5,	%f9
	fmovdcc	%icc,	%f17,	%f2
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x1A] %asi,	%l6
	xor	%l2,	%g4,	%i3
	xor	%g7,	0x0682,	%o7
	bn,a,pn	%xcc,	loop_856
	edge16ln	%o2,	%l0,	%l4
	tne	%icc,	0x4
	taddcctv	%o0,	0x1D2D,	%g3
loop_856:
	fmovrsgz	%o4,	%f3,	%f22
	srlx	%g1,	0x0C,	%g5
	lduh	[%l7 + 0x62],	%o3
	te	%icc,	0x5
	mulscc	%i1,	%o1,	%l1
	fbuge	%fcc3,	loop_857
	movge	%icc,	%i0,	%i7
	tsubcctv	%i6,	%o6,	%i5
	popc	0x16B1,	%i2
loop_857:
	bvc	%xcc,	loop_858
	movvc	%xcc,	%g2,	%g6
	bg,pt	%icc,	loop_859
	nop
	setx	0x008D920B4539B9A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xF8C5B67AD4987257,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f16,	%f12
loop_858:
	popc	%l5,	%i4
	orn	%l3,	%o5,	%l6
loop_859:
	add	%g4,	%i3,	%l2
	fbe,a	%fcc0,	loop_860
	sdivcc	%o7,	0x10B2,	%o2
	fmovsneg	%icc,	%f11,	%f23
	tleu	%xcc,	0x0
loop_860:
	tg	%icc,	0x6
	fnegd	%f28,	%f8
	sub	%g7,	%l4,	%l0
	tge	%xcc,	0x6
	orncc	%g3,	%o0,	%g1
	umul	%o4,	%o3,	%i1
	sll	%o1,	%l1,	%i0
	sra	%g5,	%i6,	%o6
	fbu,a	%fcc3,	loop_861
	fand	%f14,	%f14,	%f18
	movre	%i5,	%i7,	%i2
	membar	0x2C
loop_861:
	edge32ln	%g2,	%g6,	%l5
	brlez	%l3,	loop_862
	tl	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
loop_862:
	nop
	set	0x108, %i2
	stxa	%o5,	[%g0 + %i2] 0x21
	tpos	%xcc,	0x4
	fbuge	%fcc2,	loop_863
	alignaddr	%g4,	%i3,	%l6
	movvc	%xcc,	%l2,	%o7
	xorcc	%g7,	%o2,	%l4
loop_863:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x52] %asi,	%g3
	fbug,a	%fcc0,	loop_864
	fbn,a	%fcc1,	loop_865
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o0,	%g1,	%o4
loop_864:
	movre	%o3,	%i1,	%o1
loop_865:
	fmovrdgez	%l1,	%f16,	%f4
	edge32ln	%l0,	%i0,	%g5
	movn	%icc,	%i6,	%i5
	fpadd16s	%f23,	%f10,	%f19
	mulscc	%i7,	0x10FF,	%i2
	tsubcc	%o6,	0x0742,	%g6
	brlez	%l5,	loop_866
	andncc	%l3,	%g2,	%o5
	fcmpeq16	%f12,	%f10,	%g4
	movle	%xcc,	%i3,	%l6
loop_866:
	addccc	%i4,	%l2,	%g7
	edge8	%o2,	%l4,	%g3
	tcs	%icc,	0x0
	edge32	%o0,	%g1,	%o4
	fble,a	%fcc3,	loop_867
	mova	%icc,	%o3,	%o7
	tle	%icc,	0x4
	xnorcc	%i1,	0x11ED,	%o1
loop_867:
	fmovdvs	%icc,	%f7,	%f12
	andncc	%l1,	%l0,	%i0
	edge16	%i6,	%g5,	%i7
	andn	%i2,	0x0E14,	%o6
	fnot2s	%f2,	%f10
	orcc	%g6,	%l5,	%i5
	fbg,a	%fcc0,	loop_868
	array8	%l3,	%g2,	%g4
	srl	%i3,	%l6,	%o5
	tneg	%xcc,	0x6
loop_868:
	nop
	set	0x70, %g1
	ldxa	[%l7 + %g1] 0x89,	%l2
	udiv	%g7,	0x0DB4,	%o2
	fmovrdgz	%i4,	%f10,	%f20
	lduh	[%l7 + 0x62],	%g3
	movre	%o0,	0x201,	%l4
	edge32n	%g1,	%o4,	%o3
	ble,a,pt	%icc,	loop_869
	array32	%o7,	%o1,	%i1
	fnegs	%f13,	%f27
	fmul8x16au	%f5,	%f4,	%f0
loop_869:
	edge8l	%l0,	%l1,	%i6
	membar	0x73
	movn	%xcc,	%g5,	%i7
	movvc	%icc,	%i0,	%i2
	xor	%o6,	%g6,	%l5
	movvs	%xcc,	%l3,	%i5
	xnor	%g4,	%g2,	%i3
	movpos	%icc,	%o5,	%l6
	tcs	%icc,	0x6
	ldsb	[%l7 + 0x5D],	%l2
	tpos	%icc,	0x7
	st	%f2,	[%l7 + 0x50]
	movg	%xcc,	%o2,	%g7
	fnot1s	%f31,	%f7
	subcc	%g3,	%o0,	%l4
	fmovsne	%xcc,	%f19,	%f20
	fmovdg	%icc,	%f29,	%f16
	fmovrdgez	%i4,	%f18,	%f20
	movl	%xcc,	%g1,	%o3
	xnor	%o4,	%o7,	%i1
	set	0x3F, %o0
	lduba	[%l7 + %o0] 0x19,	%l0
	movgu	%icc,	%o1,	%l1
	fsrc1s	%f31,	%f14
	subcc	%g5,	%i6,	%i0
	fbuge,a	%fcc1,	loop_870
	fbu	%fcc1,	loop_871
	movge	%icc,	%i2,	%i7
	sth	%o6,	[%l7 + 0x64]
loop_870:
	fba	%fcc0,	loop_872
loop_871:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc3,	loop_873
	movg	%xcc,	%g6,	%l3
loop_872:
	xorcc	%l5,	0x127B,	%g4
	sethi	0x0A84,	%g2
loop_873:
	fmovsneg	%xcc,	%f23,	%f19
	tcs	%icc,	0x4
	movn	%xcc,	%i5,	%i3
	set	0x4A, %g4
	stha	%o5,	[%l7 + %g4] 0x11
	fmovsvs	%xcc,	%f29,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l6,	0x15,	%o2
	bge,a,pt	%icc,	loop_874
	movrgz	%g7,	%g3,	%l2
	andncc	%o0,	%i4,	%g1
	sll	%l4,	0x10,	%o3
loop_874:
	and	%o7,	0x1ACB,	%i1
	andcc	%o4,	%l0,	%l1
	subccc	%o1,	%g5,	%i0
	alignaddrl	%i6,	%i2,	%o6
	umulcc	%g6,	0x0F8A,	%i7
	sth	%l5,	[%l7 + 0x1A]
	xnorcc	%l3,	0x12C9,	%g2
	nop
	set	0x74, %i7
	prefetch	[%l7 + %i7],	 0x1
	wr	%g0,	0x23,	%asi
	stha	%g4,	[%l7 + 0x44] %asi
	membar	#Sync
	fmovdg	%xcc,	%f27,	%f13
	movneg	%xcc,	%i5,	%o5
	edge16ln	%l6,	%i3,	%o2
	movvs	%icc,	%g7,	%g3
	movcc	%icc,	%o0,	%i4
	fbn	%fcc2,	loop_875
	tl	%xcc,	0x0
	and	%l2,	0x19E9,	%l4
	ldx	[%l7 + 0x70],	%g1
loop_875:
	edge32l	%o3,	%o7,	%i1
	bpos,pn	%icc,	loop_876
	fmovsne	%xcc,	%f30,	%f11
	fmovrslz	%l0,	%f25,	%f22
	tge	%xcc,	0x4
loop_876:
	movcs	%xcc,	%l1,	%o4
	fandnot1s	%f15,	%f29,	%f14
	brz	%o1,	loop_877
	subccc	%i0,	%g5,	%i6
	add	%i2,	%g6,	%i7
	st	%f20,	[%l7 + 0x30]
loop_877:
	te	%icc,	0x1
	nop
	setx	loop_878,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%icc,	%l5,	%o6
	movrlez	%g2,	%l3,	%g4
	nop
	fitod	%f12,	%f28
	fdtoi	%f28,	%f9
loop_878:
	taddcctv	%o5,	%i5,	%l6
	and	%o2,	0x0940,	%i3
	fmovdg	%icc,	%f12,	%f22
	fnor	%f10,	%f12,	%f10
	alignaddr	%g7,	%g3,	%i4
	edge8n	%l2,	%l4,	%g1
	be,a	%icc,	loop_879
	ldstub	[%l7 + 0x7A],	%o0
	fbl,a	%fcc2,	loop_880
	nop
	setx	loop_881,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_879:
	fba	%fcc2,	loop_882
	movrgz	%o3,	%o7,	%l0
loop_880:
	orn	%l1,	0x1C6A,	%i1
loop_881:
	xor	%o4,	%i0,	%g5
loop_882:
	fornot1s	%f28,	%f7,	%f13
	bcs,a	loop_883
	nop
	fitod	%f4,	%f4
	fdtos	%f4,	%f19
	udiv	%i6,	0x0137,	%i2
	udivx	%o1,	0x1DCB,	%g6
loop_883:
	bn	loop_884
	movgu	%xcc,	%i7,	%o6
	brz	%l5,	loop_885
	brgz,a	%l3,	loop_886
loop_884:
	movpos	%icc,	%g2,	%g4
	tsubcc	%i5,	%o5,	%o2
loop_885:
	fnot1s	%f21,	%f21
loop_886:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%l6,	[%l7 + 0x20] %asi
	movre	%g7,	0x011,	%i3
	sllx	%g3,	%l2,	%i4
	brgez	%g1,	loop_887
	fnands	%f2,	%f3,	%f26
	tl	%icc,	0x6
	movre	%l4,	0x0E3,	%o0
loop_887:
	tpos	%xcc,	0x1
	addcc	%o7,	0x07C7,	%o3
	bvs	loop_888
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%l0
	bcs,a	loop_889
	bvs,a	loop_890
loop_888:
	array32	%l1,	%i1,	%o4
	fbne,a	%fcc0,	loop_891
loop_889:
	tge	%icc,	0x2
loop_890:
	edge16n	%g5,	%i6,	%i2
	mova	%icc,	%i0,	%o1
loop_891:
	movvc	%xcc,	%i7,	%o6
	edge32l	%g6,	%l3,	%l5
	fnegd	%f18,	%f16
	tge	%icc,	0x5
	xnorcc	%g4,	%i5,	%o5
	andn	%g2,	%o2,	%g7
	tsubcc	%l6,	0x1624,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l2,	%i4,	%g3
	bcc,a,pn	%icc,	loop_892
	tgu	%icc,	0x7
	fcmple32	%f6,	%f30,	%g1
	xnorcc	%o0,	0x117A,	%o7
loop_892:
	fbue	%fcc1,	loop_893
	sdiv	%l4,	0x0E2E,	%o3
	fbo	%fcc0,	loop_894
	fxnor	%f16,	%f26,	%f18
loop_893:
	bne,pn	%xcc,	loop_895
	te	%icc,	0x6
loop_894:
	brgz	%l1,	loop_896
	bg,a	loop_897
loop_895:
	tgu	%icc,	0x4
	wr	%g0,	0x04,	%asi
	sta	%f30,	[%l7 + 0x5C] %asi
loop_896:
	fbn	%fcc2,	loop_898
loop_897:
	tgu	%icc,	0x6
	brnz	%l0,	loop_899
	mulscc	%i1,	%g5,	%i6
loop_898:
	fbge,a	%fcc1,	loop_900
	movrgez	%o4,	0x373,	%i2
loop_899:
	sra	%o1,	%i0,	%o6
	popc	0x0231,	%i7
loop_900:
	ba,pt	%xcc,	loop_901
	andn	%g6,	0x15CE,	%l5
	sllx	%l3,	0x05,	%i5
	andcc	%o5,	0x1BCA,	%g4
loop_901:
	edge16l	%o2,	%g2,	%g7
	fmovdle	%xcc,	%f5,	%f8
	bne,pn	%icc,	loop_902
	ldd	[%l7 + 0x28],	%i2
	membar	0x19
	fone	%f22
loop_902:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movgu	%icc,	%l6,	%l2
	fmovrde	%g3,	%f20,	%f28
	tneg	%icc,	0x0
	ldstub	[%l7 + 0x38],	%i4
	fnot1	%f14,	%f4
	mulx	%o0,	%g1,	%l4
	nop
	set	0x58, %i3
	stx	%o3,	[%l7 + %i3]
	fmovrslz	%o7,	%f0,	%f1
	stw	%l0,	[%l7 + 0x5C]
	fmovsle	%icc,	%f27,	%f17
	bcc	%icc,	loop_903
	brlez,a	%i1,	loop_904
	be	loop_905
	tsubcc	%l1,	%g5,	%o4
loop_903:
	fnegd	%f2,	%f26
loop_904:
	fmovdcs	%icc,	%f19,	%f13
loop_905:
	mulscc	%i6,	0x1338,	%i2
	te	%xcc,	0x6
	fxors	%f14,	%f18,	%f31
	srax	%i0,	0x01,	%o1
	sdivcc	%i7,	0x0374,	%g6
	movge	%icc,	%o6,	%l5
	fzero	%f24
	brlz,a	%i5,	loop_906
	sub	%o5,	0x1E7F,	%g4
	movcc	%xcc,	%l3,	%o2
	movcc	%icc,	%g7,	%i3
loop_906:
	nop
	setx loop_907, %l0, %l1
	jmpl %l1, %g2
	edge16n	%l2,	%g3,	%i4
	fmovdpos	%icc,	%f5,	%f22
	srl	%o0,	0x08,	%l6
loop_907:
	udiv	%l4,	0x085A,	%g1
	edge32ln	%o3,	%l0,	%i1
	sll	%l1,	0x02,	%o7
	fbue	%fcc3,	loop_908
	bvc,pt	%xcc,	loop_909
	xor	%g5,	%i6,	%o4
	tleu	%xcc,	0x6
loop_908:
	movrgez	%i0,	0x220,	%i2
loop_909:
	bpos,a,pt	%icc,	loop_910
	umul	%i7,	%g6,	%o6
	fmovs	%f21,	%f14
	tge	%icc,	0x6
loop_910:
	add	%o1,	%i5,	%o5
	fbo	%fcc2,	loop_911
	tle	%xcc,	0x4
	edge32ln	%l5,	%g4,	%o2
	pdist	%f30,	%f10,	%f24
loop_911:
	tpos	%xcc,	0x7
	smul	%l3,	%g7,	%i3
	movne	%icc,	%l2,	%g2
	tvc	%xcc,	0x3
	lduh	[%l7 + 0x76],	%i4
	smulcc	%g3,	0x1C7B,	%o0
	fpack32	%f26,	%f20,	%f22
	nop
	set	0x34, %l1
	ldsb	[%l7 + %l1],	%l6
	bne,a,pt	%xcc,	loop_912
	fsrc1	%f22,	%f8
	orncc	%l4,	0x1F78,	%o3
	fpadd32s	%f14,	%f27,	%f1
loop_912:
	nop
	wr	%g0,	0x80,	%asi
	stba	%g1,	[%l7 + 0x2D] %asi
	array32	%l0,	%i1,	%o7
	edge16l	%l1,	%i6,	%o4
	nop
	setx	loop_913,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%g5,	%i2,	%i7
	tsubcc	%i0,	0x1F2F,	%o6
	movl	%icc,	%o1,	%i5
loop_913:
	andncc	%o5,	%g6,	%g4
	addcc	%o2,	0x18A4,	%l5
	edge32ln	%g7,	%l3,	%l2
	array32	%g2,	%i4,	%i3
	movrlz	%g3,	%o0,	%l6
	fpackfix	%f16,	%f12
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l4,	%g1
	fmovrsgez	%o3,	%f5,	%f5
	nop
	setx	0x246BD6ED68313599,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x49AABC8E26984B5B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f10,	%f20
	sll	%l0,	0x0A,	%o7
	te	%xcc,	0x6
	sdivcc	%l1,	0x10CE,	%i6
	and	%o4,	0x182E,	%i1
	edge16ln	%i2,	%g5,	%i0
	set	0x10, %g7
	prefetcha	[%l7 + %g7] 0x04,	 0x0
	orn	%o1,	0x12D5,	%o6
	fbue,a	%fcc2,	loop_914
	udiv	%i5,	0x1DE7,	%g6
	sdivx	%o5,	0x16D1,	%o2
	umul	%g4,	%l5,	%g7
loop_914:
	fmovsne	%xcc,	%f17,	%f16
	subccc	%l2,	%l3,	%g2
	fmul8sux16	%f2,	%f14,	%f28
	edge32	%i4,	%g3,	%o0
	edge16	%l6,	%i3,	%l4
	tsubcc	%o3,	0x0622,	%l0
	xor	%g1,	%l1,	%o7
	smul	%o4,	%i6,	%i1
	fornot2s	%f18,	%f23,	%f21
	fornot2s	%f13,	%f28,	%f16
	addccc	%i2,	0x19E2,	%i0
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fands	%f16,	%f9,	%f16
	sth	%g5,	[%l7 + 0x2A]
	fcmpeq32	%f14,	%f0,	%i7
	bneg,pt	%icc,	loop_915
	prefetch	[%l7 + 0x14],	 0x0
	edge32	%o6,	%o1,	%i5
	wr	%g0,	0x89,	%asi
	stha	%o5,	[%l7 + 0x62] %asi
loop_915:
	flush	%l7 + 0x5C
	set	0x7C, %l6
	stba	%g6,	[%l7 + %l6] 0x80
	sethi	0x1A83,	%g4
	fpackfix	%f20,	%f10
	movvs	%xcc,	%l5,	%o2
	tne	%xcc,	0x4
	movre	%g7,	%l3,	%l2
	ld	[%l7 + 0x0C],	%f1
	fmovsg	%xcc,	%f1,	%f15
	alignaddr	%i4,	%g3,	%g2
	fornot2s	%f29,	%f21,	%f21
	nop
	setx	0x0A0663FA30672A49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	sllx	%l6,	0x04,	%o0
	tneg	%xcc,	0x0
	set	0x50, %o3
	stxa	%i3,	[%l7 + %o3] 0x88
	ldd	[%l7 + 0x10],	%f24
	udiv	%o3,	0x0B20,	%l0
	ldub	[%l7 + 0x30],	%g1
	tn	%xcc,	0x3
	fnot1	%f14,	%f4
	edge32l	%l1,	%o7,	%o4
	andcc	%i6,	%i1,	%l4
	edge32l	%i0,	%g5,	%i2
	fors	%f15,	%f17,	%f1
	xnorcc	%i7,	0x068D,	%o1
	edge32ln	%i5,	%o5,	%o6
	fmovsleu	%xcc,	%f28,	%f10
	ba,a	loop_916
	array32	%g4,	%g6,	%l5
	sllx	%g7,	0x0F,	%o2
	bg,a	loop_917
loop_916:
	ta	%icc,	0x5
	fbge,a	%fcc3,	loop_918
	and	%l2,	0x1A7E,	%l3
loop_917:
	edge32n	%i4,	%g2,	%g3
	tn	%xcc,	0x4
loop_918:
	movn	%xcc,	%o0,	%i3
	movg	%xcc,	%o3,	%l0
	movrgz	%l6,	0x391,	%l1
	nop
	setx	0x1A4E0E06,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x69F2D454,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f18,	%f21
	fcmpeq32	%f14,	%f18,	%g1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	movn	%icc,	%o7,	%i6
	fmovrse	%i1,	%f4,	%f24
	sllx	%i0,	0x18,	%g5
	srax	%i2,	0x13,	%i7
	fnands	%f26,	%f25,	%f8
	fmovde	%xcc,	%f24,	%f22
	addcc	%o1,	%i5,	%o5
	add	%o6,	%l4,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f5,	%f8,	%f25
	add	%l7,	0x54,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x11,	%g4,	%l5
	nop
	setx	loop_919,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivcc	%o2,	0x1347,	%g7
	tle	%xcc,	0x3
	srl	%l3,	%i4,	%l2
loop_919:
	fornot1	%f14,	%f18,	%f28
	udivx	%g2,	0x1B16,	%o0
	ta	%icc,	0x2
	popc	0x0113,	%i3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o3
	set	0x44, %l2
	lduba	[%l7 + %l2] 0x14,	%g3
	edge8n	%l6,	%l0,	%g1
	fbuge	%fcc0,	loop_920
	fnor	%f4,	%f0,	%f8
	tg	%xcc,	0x3
	add	%o4,	0x00CB,	%l1
loop_920:
	sra	%o7,	0x07,	%i6
	orncc	%i0,	0x0605,	%i1
	nop
	set	0x53, %i4
	ldub	[%l7 + %i4],	%g5
	movre	%i7,	0x2C8,	%o1
	set	0x3C, %i1
	ldswa	[%l7 + %i1] 0x18,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o5,	0x13C6,	%i5
	movrlez	%l4,	%o6,	%g4
	movvs	%xcc,	%g6,	%l5
	movcs	%xcc,	%g7,	%o2
	swap	[%l7 + 0x6C],	%i4
	add	%l2,	0x0FF8,	%l3
	addccc	%o0,	%g2,	%i3
	udivcc	%o3,	0x0ECA,	%g3
	addccc	%l0,	%l6,	%g1
	tne	%xcc,	0x6
	std	%f2,	[%l7 + 0x48]
	nop
	setx	0xF30C5848,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x2E13513D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f26,	%f14
	sir	0x0DE3
	set	0x30, %g6
	ldda	[%l7 + %g6] 0x27,	%o4
	nop
	fitos	%f13,	%f2
	fstod	%f2,	%f16
	fbe,a	%fcc3,	loop_921
	edge32ln	%l1,	%i6,	%o7
	movl	%icc,	%i1,	%i0
	udivcc	%i7,	0x0A5E,	%g5
loop_921:
	andncc	%o1,	%i2,	%i5
	fmovdcc	%xcc,	%f23,	%f5
	fbu,a	%fcc2,	loop_922
	ta	%xcc,	0x5
	ldd	[%l7 + 0x60],	%f12
	movl	%icc,	%o5,	%o6
loop_922:
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
	edge32n	%g4,	%l4,	%g6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l5
loop_923:
	bl,a,pn	%xcc,	loop_924
	fabss	%f30,	%f0
	fsrc2s	%f28,	%f14
	sub	%g7,	%o2,	%i4
loop_924:
	tg	%icc,	0x2
	ta	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a,pn	%xcc,	loop_925
	fcmple32	%f24,	%f12,	%l2
	andn	%l3,	%o0,	%g2
	mulscc	%i3,	0x029F,	%o3
loop_925:
	nop
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x16
	membar	#Sync
	subccc	%l0,	0x1624,	%g3
	tcs	%xcc,	0x7
	nop
	setx	0xA4C0D687,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xF52A1858,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f0,	%f14
	edge32ln	%g1,	%l6,	%o4
	fnors	%f27,	%f23,	%f7
	set	0x36, %l0
	ldsha	[%l7 + %l0] 0x10,	%i6
	srl	%l1,	%i1,	%o7
	fbug,a	%fcc2,	loop_926
	movvc	%xcc,	%i0,	%g5
	bne	loop_927
	tsubcc	%i7,	0x0CD1,	%i2
loop_926:
	popc	0x1951,	%o1
	swap	[%l7 + 0x60],	%o5
loop_927:
	fxors	%f29,	%f3,	%f2
	smul	%o6,	0x1E8E,	%i5
	tne	%icc,	0x0
	mova	%xcc,	%l4,	%g6
	tleu	%icc,	0x1
	movg	%xcc,	%g4,	%l5
	orcc	%g7,	%i4,	%l2
	udivcc	%o2,	0x0BF8,	%o0
	edge32ln	%g2,	%i3,	%l3
	fmovdne	%xcc,	%f11,	%f4
	alignaddr	%l0,	%g3,	%g1
	fbul,a	%fcc0,	loop_928
	nop
	fitos	%f1,	%f11
	fstox	%f11,	%f30
	bge	%icc,	loop_929
	movvs	%icc,	%o3,	%o4
loop_928:
	bge,a	%icc,	loop_930
	srlx	%l6,	%l1,	%i1
loop_929:
	fmovsge	%icc,	%f6,	%f29
	fbn,a	%fcc2,	loop_931
loop_930:
	or	%i6,	%o7,	%g5
	taddcc	%i7,	0x1A08,	%i0
	fpsub32s	%f19,	%f14,	%f7
loop_931:
	bg,a,pt	%icc,	loop_932
	fones	%f31
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
loop_932:
	nop
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x54] %asi,	%f17
	addc	%o5,	0x0172,	%o6
	andn	%i2,	0x0F59,	%i5
	sra	%g6,	0x05,	%g4
	fmovdcs	%icc,	%f12,	%f8
	fbne,a	%fcc3,	loop_933
	brlz	%l4,	loop_934
	fmul8x16	%f7,	%f10,	%f30
	tcc	%icc,	0x1
loop_933:
	subc	%l5,	0x1F75,	%g7
loop_934:
	stbar
	edge8l	%i4,	%l2,	%o2
	edge16l	%o0,	%g2,	%l3
	fbu	%fcc2,	loop_935
	ldsb	[%l7 + 0x50],	%i3
	movl	%xcc,	%l0,	%g3
	array32	%o3,	%g1,	%l6
loop_935:
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f10
	fxtod	%f10,	%f8
	and	%o4,	%l1,	%i1
	smulcc	%i6,	%o7,	%i7
	membar	0x2B
	edge8n	%g5,	%o1,	%i0
	sethi	0x0E8E,	%o5
	fbo,a	%fcc3,	loop_936
	udiv	%i2,	0x1451,	%i5
	flush	%l7 + 0x58
	xorcc	%g6,	0x0D59,	%o6
loop_936:
	tg	%xcc,	0x1
	set	0x5C, %o2
	swapa	[%l7 + %o2] 0x80,	%g4
	fornot1s	%f31,	%f22,	%f2
	fpmerge	%f13,	%f10,	%f6
	sllx	%l4,	%g7,	%i4
	tsubcc	%l5,	%o2,	%l2
	mova	%icc,	%g2,	%l3
	sra	%i3,	0x1A,	%o0
	fmovdgu	%xcc,	%f16,	%f1
	addc	%l0,	%g3,	%o3
	wr	%g0,	0x27,	%asi
	stha	%l6,	[%l7 + 0x58] %asi
	membar	#Sync
	andcc	%g1,	%o4,	%i1
	movcc	%icc,	%i6,	%o7
	srlx	%l1,	%i7,	%g5
	fpadd16	%f2,	%f16,	%f20
	fsrc1s	%f1,	%f20
	fmovdg	%xcc,	%f30,	%f2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%o1,	%i0
	smul	%o5,	%i2,	%g6
	movneg	%icc,	%o6,	%i5
	fmovdvs	%icc,	%f5,	%f24
	movle	%icc,	%g4,	%l4
	fexpand	%f14,	%f2
	tle	%xcc,	0x5
	array8	%i4,	%l5,	%o2
	brgz	%l2,	loop_937
	nop
	setx	0x25078B27,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f9
	fbg	%fcc3,	loop_938
	fpadd32s	%f10,	%f18,	%f10
loop_937:
	srax	%g2,	%g7,	%i3
	set	0x34, %o7
	sta	%f21,	[%l7 + %o7] 0x18
loop_938:
	taddcc	%o0,	0x0C71,	%l0
	fmuld8sux16	%f15,	%f8,	%f26
	set	0x4C, %l4
	sta	%f17,	[%l7 + %l4] 0x15
	edge32n	%g3,	%o3,	%l6
	fbg,a	%fcc1,	loop_939
	smulcc	%g1,	%o4,	%i1
	addccc	%l3,	0x0808,	%i6
	movg	%xcc,	%l1,	%i7
loop_939:
	tneg	%icc,	0x3
	fbug	%fcc0,	loop_940
	ldx	[%l7 + 0x38],	%o7
	fbu	%fcc2,	loop_941
	fornot1s	%f31,	%f23,	%f28
loop_940:
	nop
	setx	0x647B0C9A269EF0D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f14
	fpmerge	%f8,	%f10,	%f0
loop_941:
	edge8l	%o1,	%i0,	%g5
	bn	loop_942
	tg	%icc,	0x2
	fmovdpos	%icc,	%f18,	%f20
	fmovdpos	%icc,	%f3,	%f0
loop_942:
	lduw	[%l7 + 0x44],	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g6,	%o5
	sra	%i5,	%g4,	%o6
	fmovrdlz	%i4,	%f14,	%f8
	tpos	%icc,	0x3
	st	%f22,	[%l7 + 0x54]
	ld	[%l7 + 0x6C],	%f10
	brz,a	%l5,	loop_943
	fmovdleu	%icc,	%f17,	%f29
	tcs	%icc,	0x2
	sll	%l4,	0x0C,	%o2
loop_943:
	popc	0x04CE,	%l2
	bn	loop_944
	movn	%icc,	%g2,	%i3
	tg	%xcc,	0x0
	edge16ln	%o0,	%g7,	%g3
loop_944:
	fpadd32s	%f3,	%f18,	%f12
	nop
	fitos	%f8,	%f25
	fstox	%f25,	%f20
	fxtos	%f20,	%f20
	edge8l	%l0,	%l6,	%g1
	ldstub	[%l7 + 0x21],	%o3
	sub	%o4,	%i1,	%l3
	andn	%l1,	0x0697,	%i6
	nop
	fitos	%f8,	%f1
	fstod	%f1,	%f26
	edge8l	%i7,	%o1,	%i0
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f0
	edge32ln	%o7,	%i2,	%g6
	andn	%o5,	%i5,	%g5
	umul	%o6,	%i4,	%g4
	movg	%icc,	%l5,	%o2
	udiv	%l2,	0x1580,	%l4
	bg,a,pn	%icc,	loop_945
	fnor	%f12,	%f10,	%f12
	edge8ln	%g2,	%o0,	%i3
	srax	%g3,	%l0,	%g7
loop_945:
	fbge,a	%fcc2,	loop_946
	nop
	setx	loop_947,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxnor	%f12,	%f0,	%f16
	smulcc	%g1,	0x0D83,	%o3
loop_946:
	addcc	%o4,	0x11CA,	%l6
loop_947:
	umulcc	%l3,	%i1,	%i6
	wr	%g0,	0x11,	%asi
	sta	%f17,	[%l7 + 0x18] %asi
	tsubcctv	%l1,	%i7,	%i0
	subcc	%o1,	0x0139,	%i2
	fands	%f16,	%f27,	%f18
	nop
	fitos	%f10,	%f3
	fstox	%f3,	%f22
	fxtos	%f22,	%f27
	tne	%icc,	0x7
	movrne	%g6,	0x2D5,	%o7
	move	%icc,	%i5,	%g5
	fmovspos	%xcc,	%f9,	%f1
	bleu,a,pt	%icc,	loop_948
	fcmple32	%f6,	%f4,	%o6
	set	0x48, %g3
	prefetcha	[%l7 + %g3] 0x15,	 0x0
loop_948:
	tvs	%icc,	0x1
	edge8n	%i4,	%g4,	%l5
	ta	%icc,	0x0
	udivx	%o2,	0x1522,	%l2
	addccc	%g2,	0x054D,	%o0
	faligndata	%f4,	%f0,	%f2
	tcs	%icc,	0x3
	edge32l	%i3,	%l4,	%l0
	umul	%g7,	%g1,	%o3
	fmovdl	%xcc,	%f30,	%f21
	pdist	%f16,	%f18,	%f14
	fmovse	%icc,	%f7,	%f3
	ta	%xcc,	0x3
	flush	%l7 + 0x70
	orcc	%o4,	%g3,	%l6
	edge32	%i1,	%i6,	%l3
	edge32l	%l1,	%i0,	%o1
	srlx	%i7,	%g6,	%o7
	tle	%icc,	0x1
	tvs	%icc,	0x0
	tn	%xcc,	0x5
	sdivx	%i5,	0x1D22,	%i2
	fandnot2	%f24,	%f4,	%f28
	fbo,a	%fcc2,	loop_949
	fbug	%fcc3,	loop_950
	subccc	%g5,	%o6,	%i4
	nop
	setx	0xB240BDD690FD00E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xF308A3CA1F8D0794,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f20,	%f26
loop_949:
	movn	%icc,	%g4,	%l5
loop_950:
	lduh	[%l7 + 0x38],	%o5
	udivx	%l2,	0x18B4,	%g2
	tcc	%icc,	0x2
	srl	%o0,	0x10,	%i3
	fmovsneg	%xcc,	%f14,	%f27
	edge16l	%o2,	%l4,	%l0
	sub	%g7,	%g1,	%o4
	mulscc	%g3,	%o3,	%i1
	or	%i6,	0x0C5C,	%l6
	movrlez	%l1,	%l3,	%i0
	fmovsleu	%xcc,	%f28,	%f1
	sllx	%o1,	%i7,	%o7
	fble,a	%fcc0,	loop_951
	mova	%xcc,	%g6,	%i2
	fmovrdgz	%g5,	%f6,	%f4
	srax	%i5,	0x05,	%o6
loop_951:
	movrne	%i4,	0x24D,	%l5
	mulscc	%g4,	0x166D,	%l2
	fmovs	%f14,	%f12
	fornot2s	%f21,	%f0,	%f0
	edge32ln	%g2,	%o5,	%i3
	fcmpgt32	%f6,	%f10,	%o2
	movre	%l4,	0x004,	%l0
	fmul8x16al	%f20,	%f23,	%f4
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
	fpsub32	%f6,	%f24,	%f24
	stbar
	bpos,a	loop_953
loop_952:
	fbg	%fcc3,	loop_954
	fmovrse	%g7,	%f2,	%f27
	stb	%g1,	[%l7 + 0x61]
loop_953:
	fmovdge	%icc,	%f19,	%f13
loop_954:
	lduw	[%l7 + 0x50],	%o4
	call	loop_955
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
	nop
	fitos	%f2,	%f23
	fstoi	%f23,	%f0
	movle	%icc,	%g3,	%o0
loop_955:
	tn	%xcc,	0x0
loop_956:
	addccc	%o3,	%i1,	%l6
	edge8l	%l1,	%l3,	%i0
	brnz	%o1,	loop_957
	srl	%i6,	0x02,	%i7
	movvc	%icc,	%o7,	%g6
	fcmpeq16	%f24,	%f26,	%g5
loop_957:
	fors	%f30,	%f4,	%f31
	alignaddrl	%i2,	%o6,	%i5
	nop
	setx	0xB8968D15EB3A7EE6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x95A4A7BFEC6F86CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f8,	%f30
	bvs,pn	%xcc,	loop_958
	be,a,pn	%xcc,	loop_959
	subccc	%l5,	0x011B,	%i4
	andn	%g4,	0x0D43,	%l2
loop_958:
	bne,a	%icc,	loop_960
loop_959:
	xnorcc	%g2,	0x1ABE,	%o5
	mova	%xcc,	%o2,	%i3
	ldsh	[%l7 + 0x52],	%l4
loop_960:
	movn	%icc,	%l0,	%g7
	smulcc	%o4,	0x0B9F,	%g1
	fpackfix	%f4,	%f26
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%g2
	fmovrde	%o0,	%f10,	%f8
	bne,a	%xcc,	loop_961
	fbug,a	%fcc0,	loop_962
	edge16l	%o3,	%l6,	%l1
	fmovrsgz	%l3,	%f0,	%f11
loop_961:
	edge16l	%i0,	%i1,	%i6
loop_962:
	movl	%xcc,	%i7,	%o1
	ldsh	[%l7 + 0x0C],	%o7
	fmovsvc	%icc,	%f30,	%f14
	movneg	%icc,	%g5,	%i2
	mulscc	%o6,	%g6,	%i5
	fnand	%f0,	%f0,	%f2
	tne	%xcc,	0x6
	fbo,a	%fcc0,	loop_963
	mova	%xcc,	%l5,	%i4
	fbu	%fcc1,	loop_964
	andn	%l2,	%g4,	%o5
loop_963:
	fbuge	%fcc0,	loop_965
	orn	%o2,	0x1F37,	%g2
loop_964:
	bgu,pn	%xcc,	loop_966
	fmul8sux16	%f26,	%f12,	%f6
loop_965:
	tcs	%xcc,	0x0
	srlx	%l4,	0x10,	%i3
loop_966:
	udivx	%l0,	0x0256,	%o4
	edge32n	%g1,	%g3,	%g7
	orn	%o0,	0x0B92,	%l6
	st	%f28,	[%l7 + 0x30]
	fmovdvc	%xcc,	%f28,	%f6
	fmovdge	%xcc,	%f26,	%f17
	srax	%l1,	%l3,	%i0
	bvc,pn	%xcc,	loop_967
	sir	0x0219
	fmul8ulx16	%f8,	%f10,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_967:
	movgu	%xcc,	%o3,	%i6
	fcmple16	%f24,	%f14,	%i1
	alignaddrl	%i7,	%o7,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o1,	%i2,	%o6
	ta	%xcc,	0x4
	edge8	%i5,	%l5,	%g6
	andn	%i4,	0x1116,	%g4
	tcs	%xcc,	0x7
	movvs	%xcc,	%l2,	%o2
	tvc	%xcc,	0x6
	addc	%g2,	%l4,	%i3
	sub	%o5,	%l0,	%g1
	or	%o4,	%g3,	%g7
	umul	%o0,	%l6,	%l1
	umul	%i0,	%o3,	%i6
	andcc	%i1,	%l3,	%i7
	tn	%xcc,	0x6
	bg,a,pt	%icc,	loop_968
	nop
	setx	loop_969,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%g5,	%o7,	%i2
	fmovsne	%xcc,	%f18,	%f30
loop_968:
	bcs	%xcc,	loop_970
loop_969:
	fmovdvs	%xcc,	%f2,	%f24
	nop
	setx	0x93F227BEA1D39167,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f28
	orn	%o1,	0x0507,	%o6
loop_970:
	movgu	%xcc,	%l5,	%i5
	fmovscc	%xcc,	%f14,	%f21
	brgz	%g6,	loop_971
	udivcc	%i4,	0x10F3,	%l2
	fnot1s	%f10,	%f3
	movneg	%icc,	%g4,	%o2
loop_971:
	fmovd	%f8,	%f14
	fmuld8ulx16	%f23,	%f22,	%f0
	fzeros	%f23
	fpack32	%f4,	%f4,	%f28
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	move	%icc,	%l4,	%o5
	faligndata	%f4,	%f18,	%f12
	sdiv	%i3,	0x10AD,	%l0
	fmovspos	%icc,	%f31,	%f19
	te	%icc,	0x2
	fnot1s	%f5,	%f17
	umul	%g1,	0x0089,	%g3
	nop
	fitod	%f4,	%f14
	fdtoi	%f14,	%f0
	orcc	%o4,	0x0D38,	%g7
	movleu	%xcc,	%l6,	%o0
	andcc	%l1,	0x0D20,	%o3
	smul	%i6,	%i1,	%l3
	movle	%xcc,	%i7,	%g5
	brlz,a	%o7,	loop_972
	nop
	setx	0x70B912C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f18
	nop
	fitos	%f4,	%f11
	fstox	%f11,	%f10
	fxtos	%f10,	%f19
	array32	%i2,	%i0,	%o6
loop_972:
	or	%o1,	%i5,	%g6
	tneg	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i4
	array16	%l2,	%g4,	%o2
	movrne	%l5,	0x2F0,	%l4
	array8	%o5,	%g2,	%l0
	fbg	%fcc3,	loop_973
	movge	%icc,	%i3,	%g1
	wr	%g0,	0x89,	%asi
	stwa	%g3,	[%l7 + 0x64] %asi
loop_973:
	movrne	%g7,	0x1FB,	%o4
	edge32l	%l6,	%l1,	%o3
	tleu	%icc,	0x3
	orn	%o0,	%i1,	%i6
	edge32	%l3,	%i7,	%o7
	bcc	loop_974
	movleu	%xcc,	%g5,	%i2
	mulx	%i0,	%o6,	%i5
	fpmerge	%f4,	%f30,	%f28
loop_974:
	fmovrdlez	%o1,	%f26,	%f2
	xnor	%g6,	%l2,	%i4
	orcc	%o2,	%l5,	%l4
	swap	[%l7 + 0x1C],	%g4
	tge	%xcc,	0x7
	subcc	%g2,	0x022B,	%o5
	tl	%icc,	0x7
	movpos	%xcc,	%i3,	%g1
	nop
	setx	0x4CE7BCFCCC5F616B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x61F8A3CE52F7839B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f10,	%f4
	fmovdne	%xcc,	%f16,	%f9
	fmovsge	%xcc,	%f15,	%f17
	umul	%l0,	%g3,	%o4
	ldsw	[%l7 + 0x7C],	%l6
	edge16	%g7,	%o3,	%l1
	fmovrslz	%o0,	%f15,	%f2
	fcmpgt32	%f28,	%f14,	%i1
	tgu	%xcc,	0x1
	tg	%icc,	0x3
	or	%i6,	%l3,	%o7
	fmovdcs	%xcc,	%f2,	%f19
	fnot2	%f6,	%f26
	movne	%xcc,	%g5,	%i2
	fmovsa	%icc,	%f30,	%f10
	nop
	setx	0x8A38805661B9EE4E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f26
	orn	%i7,	%o6,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x80,	%i5,	%g6
	sll	%o1,	%i4,	%o2
	ldd	[%l7 + 0x58],	%l2
	fmovd	%f14,	%f10
	bn,pt	%icc,	loop_975
	fmovda	%xcc,	%f22,	%f8
	edge32ln	%l5,	%l4,	%g4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x54] %asi,	%g2
loop_975:
	fbn	%fcc1,	loop_976
	subccc	%o5,	0x1100,	%i3
	udivcc	%g1,	0x0BBB,	%g3
	tcs	%icc,	0x2
loop_976:
	fmovdvs	%xcc,	%f11,	%f15
	tneg	%icc,	0x7
	udivx	%l0,	0x0F9D,	%o4
	fbge,a	%fcc1,	loop_977
	fbn	%fcc1,	loop_978
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x4E, %o4
	lduh	[%l7 + %o4],	%g7
loop_977:
	nop
	setx	0xBA12668440C67237,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x47454AF6E451B69A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f20,	%f30
loop_978:
	sth	%l6,	[%l7 + 0x48]
	movneg	%xcc,	%o3,	%l1
	fmovspos	%xcc,	%f12,	%f18
	movle	%icc,	%o0,	%i1
	sdivx	%l3,	0x01BD,	%i6
	nop
	setx loop_979, %l0, %l1
	jmpl %l1, %g5
	fbne,a	%fcc3,	loop_980
	movvs	%xcc,	%o7,	%i7
	xorcc	%i2,	0x14B1,	%i0
loop_979:
	te	%icc,	0x6
loop_980:
	ldsw	[%l7 + 0x14],	%i5
	fmovrslz	%o6,	%f22,	%f2
	ta	%xcc,	0x6
	membar	0x53
	bcs,pn	%icc,	loop_981
	fmovde	%icc,	%f0,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f24,	%f22,	%f26
loop_981:
	orncc	%g6,	%o1,	%o2
	fands	%f12,	%f7,	%f21
	fnand	%f24,	%f18,	%f14
	stb	%i4,	[%l7 + 0x3E]
	mova	%xcc,	%l5,	%l4
	movre	%g4,	%l2,	%o5
	stx	%i3,	[%l7 + 0x08]
	for	%f10,	%f4,	%f2
	nop
	setx	0x8058F41F,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	set	0x08, %i6
	lduwa	[%l7 + %i6] 0x11,	%g2
	fpmerge	%f8,	%f20,	%f16
	array16	%g3,	%g1,	%l0
	fbg,a	%fcc3,	loop_982
	tleu	%icc,	0x6
	edge32	%o4,	%l6,	%g7
	orcc	%o3,	0x1813,	%o0
loop_982:
	movrlz	%l1,	%l3,	%i1
	fcmpgt32	%f12,	%f18,	%g5
	movrlez	%o7,	0x29C,	%i7
	nop
	fitos	%f2,	%f0
	fstoi	%f0,	%f13
	nop
	setx	0x45DEB57B77C4ADAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x805056FC738DC333,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f6,	%f0
	fpsub32s	%f2,	%f2,	%f17
	umul	%i6,	%i2,	%i5
	for	%f12,	%f30,	%f12
	fmovrdgez	%o6,	%f6,	%f28
	xorcc	%g6,	0x05C5,	%i0
	movrgez	%o2,	0x016,	%i4
	tg	%xcc,	0x2
	movpos	%icc,	%o1,	%l4
	stw	%g4,	[%l7 + 0x5C]
	xnorcc	%l2,	%o5,	%i3
	bcc,pt	%xcc,	loop_983
	srax	%l5,	%g2,	%g3
	ldstub	[%l7 + 0x4E],	%l0
	sllx	%o4,	%l6,	%g1
loop_983:
	stbar
	fbul,a	%fcc0,	loop_984
	fand	%f16,	%f2,	%f2
	array32	%o3,	%o0,	%g7
	fba	%fcc3,	loop_985
loop_984:
	movcc	%icc,	%l1,	%l3
	nop
	fitos	%f5,	%f15
	fstox	%f15,	%f14
	fxtos	%f14,	%f6
	brnz,a	%i1,	loop_986
loop_985:
	alignaddrl	%o7,	%i7,	%i6
	tg	%icc,	0x2
	sra	%i2,	%i5,	%g5
loop_986:
	brz,a	%o6,	loop_987
	nop
	setx	0x30423536,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	ldstub	[%l7 + 0x54],	%i0
	fmovdpos	%xcc,	%f12,	%f7
loop_987:
	fbne	%fcc0,	loop_988
	fba	%fcc2,	loop_989
	srlx	%o2,	0x11,	%i4
	sth	%o1,	[%l7 + 0x42]
loop_988:
	add	%l4,	%g6,	%g4
loop_989:
	nop
	set	0x3F, %g5
	ldsba	[%l7 + %g5] 0x19,	%l2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%l5
	brgez	%o5,	loop_990
	srlx	%g2,	%l0,	%o4
	fmovrse	%l6,	%f30,	%f24
	fbuge	%fcc0,	loop_991
loop_990:
	movge	%icc,	%g3,	%o3
	add	%o0,	%g7,	%l1
	fba,a	%fcc2,	loop_992
loop_991:
	fmovdpos	%icc,	%f5,	%f12
	addccc	%g1,	0x0110,	%i1
	fpsub16s	%f29,	%f31,	%f31
loop_992:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%o7
	faligndata	%f8,	%f30,	%f12
	wr	%g0,	0x22,	%asi
	stha	%i6,	[%l7 + 0x44] %asi
	membar	#Sync
	fmovdne	%icc,	%f27,	%f10
	umul	%i7,	%i5,	%i2
	array32	%g5,	%o6,	%i0
	fors	%f21,	%f18,	%f16
	fbl	%fcc3,	loop_993
	movcs	%icc,	%o2,	%o1
	movg	%icc,	%l4,	%g6
	udivx	%i4,	0x13E6,	%l2
loop_993:
	nop
	setx loop_994, %l0, %l1
	jmpl %l1, %i3
	tvc	%xcc,	0x7
	tgu	%xcc,	0x7
	mulscc	%l5,	%g4,	%g2
loop_994:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x3C] %asi,	%o5
	nop
	fitos	%f15,	%f22
	edge32n	%l0,	%l6,	%g3
	edge16	%o4,	%o0,	%o3
	bneg,a,pt	%icc,	loop_995
	array8	%g7,	%g1,	%l1
	edge8ln	%i1,	%l3,	%o7
	movcc	%xcc,	%i6,	%i5
loop_995:
	srax	%i2,	%g5,	%i7
	array8	%o6,	%o2,	%o1
	sdiv	%i0,	0x07C0,	%l4
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0x80
	movrne	%i4,	0x306,	%g6
	tle	%xcc,	0x6
	andn	%l2,	0x1B26,	%l5
	fone	%f4
	nop
	setx	0xE0408F35,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	movrgz	%i3,	0x21A,	%g2
	movle	%xcc,	%g4,	%l0
	faligndata	%f30,	%f0,	%f22
	ldd	[%l7 + 0x48],	%f10
	tge	%icc,	0x2
	array8	%l6,	%o5,	%o4
	popc	%o0,	%g3
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%g6
	ta	%icc,	0x6
	movneg	%icc,	%o3,	%l1
	sdiv	%g1,	0x1DFD,	%i1
	fmul8x16al	%f31,	%f26,	%f8
	tvs	%icc,	0x0
	fbul	%fcc2,	loop_996
	pdist	%f10,	%f12,	%f18
	tpos	%xcc,	0x5
	brgez	%l3,	loop_997
loop_996:
	ldsw	[%l7 + 0x14],	%i6
	set	0x34, %o1
	swapa	[%l7 + %o1] 0x10,	%i5
loop_997:
	edge32ln	%o7,	%g5,	%i2
	nop
	fitos	%f8,	%f6
	ldsw	[%l7 + 0x64],	%o6
	umulcc	%o2,	%i7,	%i0
	nop
	setx	0xA05F3D05,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	bl,pn	%icc,	loop_998
	movrne	%o1,	0x17B,	%i4
	xor	%l4,	0x1452,	%g6
	addcc	%l2,	0x1B3B,	%l5
loop_998:
	fands	%f18,	%f20,	%f28
	edge16	%i3,	%g2,	%l0
	subccc	%g4,	%o5,	%l6
	orn	%o0,	0x1EBB,	%o4
	fble	%fcc0,	loop_999
	fmovdcc	%icc,	%f27,	%f0
	fzero	%f16
	ldub	[%l7 + 0x65],	%g3
loop_999:
	fmovscs	%xcc,	%f25,	%f27
	tcc	%icc,	0x2
	nop
	set	0x3C, %i5
	stb	%o3,	[%l7 + %i5]
	st	%f4,	[%l7 + 0x64]
	xorcc	%g7,	0x1C11,	%l1
	movrne	%i1,	0x1C3,	%g1
	udivcc	%l3,	0x1189,	%i5
	mova	%icc,	%o7,	%g5
	nop
	setx	0x7F494CFD5B831503,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x778AFF7670F7C2D2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f6,	%f0
	fbuge,a	%fcc3,	loop_1000
	fxor	%f16,	%f18,	%f30
	srax	%i6,	0x17,	%i2
	orncc	%o6,	0x1E1A,	%o2
loop_1000:
	mulscc	%i0,	%i7,	%o1
	set	0x0C, %i0
	ldsba	[%l7 + %i0] 0x88,	%l4
	tne	%xcc,	0x1
	fmovdcs	%icc,	%f14,	%f29
	alignaddrl	%i4,	%g6,	%l5
	movrgz	%i3,	0x2C8,	%l2
	pdist	%f14,	%f18,	%f22
	xnorcc	%g2,	%l0,	%g4
	fcmple16	%f30,	%f14,	%o5
	sth	%l6,	[%l7 + 0x2C]
	nop
	setx	0xF982CD41,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xB97CA4A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f31,	%f21
	udiv	%o0,	0x1E16,	%g3
	edge32l	%o3,	%o4,	%l1
	sra	%i1,	0x0D,	%g1
	sethi	0x026B,	%g7
	orn	%l3,	0x1D96,	%i5
	array8	%g5,	%i6,	%o7
	array32	%i2,	%o2,	%i0
	orn	%o6,	%i7,	%l4
	nop
	setx	loop_1001,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fand	%f6,	%f0,	%f26
	tl	%xcc,	0x0
	srlx	%o1,	%g6,	%l5
loop_1001:
	umul	%i4,	%i3,	%g2
	tsubcctv	%l0,	0x079E,	%g4
	edge32	%l2,	%l6,	%o0
	ldstub	[%l7 + 0x0B],	%g3
	array16	%o5,	%o4,	%o3
	tvc	%icc,	0x7
	xnorcc	%l1,	0x0326,	%i1
	fandnot1s	%f5,	%f29,	%f8
	edge8n	%g1,	%g7,	%l3
	call	loop_1002
	bleu,a	loop_1003
	membar	0x01
	nop
	setx	0xADA568F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x0F579466,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f2,	%f13
loop_1002:
	bvc,pn	%xcc,	loop_1004
loop_1003:
	movrlez	%i5,	0x00B,	%g5
	set	0x7C, %g1
	stwa	%i6,	[%l7 + %g1] 0x10
loop_1004:
	movrgez	%o7,	%i2,	%o2
	sethi	0x004F,	%o6
	fbue	%fcc2,	loop_1005
	tn	%xcc,	0x4
	fbue,a	%fcc3,	loop_1006
	add	%i0,	0x13AB,	%l4
loop_1005:
	te	%icc,	0x1
	tl	%xcc,	0x5
loop_1006:
	lduh	[%l7 + 0x18],	%o1
	xnorcc	%g6,	%l5,	%i4
	movpos	%icc,	%i3,	%i7
	ba,a,pn	%icc,	loop_1007
	orcc	%g2,	%l0,	%l2
	xnor	%g4,	%o0,	%g3
	sdiv	%o5,	0x1E62,	%l6
loop_1007:
	srax	%o4,	0x00,	%l1
	fbo	%fcc1,	loop_1008
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x129CA461A07E7906,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	edge32n	%o3,	%i1,	%g7
loop_1008:
	movre	%g1,	%l3,	%g5
	sdiv	%i5,	0x01B3,	%i6
	tg	%icc,	0x7
	nop
	set	0x3A, %i2
	ldstub	[%l7 + %i2],	%i2
	movrgz	%o2,	%o7,	%i0
	popc	0x1E59,	%o6
	bn	%icc,	loop_1009
	fmovsvc	%icc,	%f8,	%f27
	andcc	%l4,	0x0293,	%g6
	srl	%l5,	%o1,	%i4
loop_1009:
	tle	%xcc,	0x7
	ldsb	[%l7 + 0x70],	%i3
	srl	%i7,	0x05,	%l0
	fble,a	%fcc2,	loop_1010
	udiv	%l2,	0x1556,	%g4
	fmovrdne	%g2,	%f24,	%f14
	bgu	%xcc,	loop_1011
loop_1010:
	addc	%g3,	%o0,	%l6
	bpos,pn	%xcc,	loop_1012
	movrgz	%o4,	%l1,	%o5
loop_1011:
	tvc	%xcc,	0x7
	fmovdvs	%xcc,	%f11,	%f19
loop_1012:
	brgz	%i1,	loop_1013
	tcc	%xcc,	0x0
	bcc,pn	%icc,	loop_1014
	move	%xcc,	%g7,	%g1
loop_1013:
	edge32ln	%o3,	%g5,	%l3
	udivcc	%i5,	0x0A2F,	%i6
loop_1014:
	and	%i2,	0x0676,	%o2
	mulx	%i0,	0x1CB0,	%o7
	fmovrslz	%l4,	%f25,	%f20
	edge8n	%g6,	%o6,	%o1
	fmovrslez	%i4,	%f22,	%f8
	smulcc	%i3,	%l5,	%i7
	umul	%l2,	%g4,	%l0
	ldstub	[%l7 + 0x1C],	%g3
	movrlz	%g2,	0x198,	%l6
	orn	%o4,	0x08DF,	%l1
	andcc	%o5,	%o0,	%i1
	bleu,a,pn	%icc,	loop_1015
	movcc	%xcc,	%g7,	%g1
	array16	%o3,	%g5,	%l3
	bleu,a	loop_1016
loop_1015:
	orncc	%i5,	%i2,	%o2
	sll	%i0,	%o7,	%i6
	nop
	set	0x08, %o0
	ldsw	[%l7 + %o0],	%g6
loop_1016:
	udivx	%o6,	0x10B6,	%o1
	fpack16	%f18,	%f11
	sir	0x0B54
	smul	%i4,	0x0ED9,	%i3
	sethi	0x1790,	%l5
	nop
	fitos	%f2,	%f2
	fstox	%f2,	%f8
	sethi	0x1EFE,	%l4
	ldd	[%l7 + 0x60],	%f10
	movn	%icc,	%i7,	%l2
	ldstub	[%l7 + 0x74],	%l0
	fmul8sux16	%f16,	%f16,	%f14
	subc	%g3,	%g2,	%l6
	fmovrdne	%g4,	%f20,	%f8
	xnorcc	%o4,	%l1,	%o5
	fbug	%fcc0,	loop_1017
	bl	loop_1018
	edge32l	%i1,	%o0,	%g7
	addc	%g1,	0x1796,	%o3
loop_1017:
	membar	0x4A
loop_1018:
	te	%icc,	0x3
	edge8n	%g5,	%i5,	%i2
	ldub	[%l7 + 0x60],	%l3
	orncc	%i0,	0x0F89,	%o7
	nop
	setx	0x523559042B09439C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xF0E5AD111565EAAE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f18,	%f0
	fmovdvs	%xcc,	%f17,	%f28
	sll	%o2,	%g6,	%i6
	tl	%xcc,	0x1
	tn	%xcc,	0x5
	array16	%o1,	%i4,	%i3
	bcc,a	loop_1019
	bge	loop_1020
	fornot2	%f10,	%f8,	%f20
	movrgez	%o6,	%l5,	%i7
loop_1019:
	nop
	setx	0xD0734C8C,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
loop_1020:
	tle	%icc,	0x0
	edge32ln	%l4,	%l2,	%l0
	fmovsg	%icc,	%f21,	%f28
	addcc	%g3,	0x1BED,	%l6
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sdiv	%g4,	0x06E6,	%g2
	edge16ln	%l1,	%o5,	%o4
	set	0x10, %g4
	stxa	%o0,	[%l7 + %g4] 0x04
	tvc	%xcc,	0x1
	tneg	%xcc,	0x6
	nop
	fitos	%f13,	%f8
	fstoi	%f8,	%f22
	bpos,a,pn	%icc,	loop_1021
	alignaddr	%g7,	%g1,	%o3
	fbl,a	%fcc1,	loop_1022
	sir	0x01D3
loop_1021:
	nop
	wr	%g0,	0x04,	%asi
	stba	%g5,	[%l7 + 0x37] %asi
loop_1022:
	tsubcc	%i1,	%i5,	%l3
	sll	%i2,	0x02,	%o7
	mulx	%o2,	%i0,	%g6
	stb	%o1,	[%l7 + 0x40]
	movrlez	%i6,	0x302,	%i3
	edge8ln	%o6,	%i4,	%i7
	tg	%icc,	0x3
	bvs,pt	%xcc,	loop_1023
	xnor	%l4,	%l2,	%l5
	bvc,pt	%icc,	loop_1024
	edge16n	%l0,	%l6,	%g3
loop_1023:
	movrlz	%g2,	%g4,	%o5
	fblg,a	%fcc1,	loop_1025
loop_1024:
	srax	%o4,	0x14,	%o0
	movrlez	%g7,	0x0E3,	%g1
	smul	%o3,	0x025C,	%l1
loop_1025:
	edge8n	%i1,	%i5,	%g5
	alignaddr	%i2,	%o7,	%o2
	movrlz	%l3,	%i0,	%o1
	movvc	%xcc,	%i6,	%i3
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x78] %asi,	%o6
	movvc	%icc,	%g6,	%i7
	fnand	%f26,	%f4,	%f6
	ldd	[%l7 + 0x28],	%l4
	fnors	%f2,	%f1,	%f26
	fmovdg	%xcc,	%f20,	%f4
	nop
	set	0x50, %i7
	ldd	[%l7 + %i7],	%f28
	movleu	%icc,	%i4,	%l2
	fxors	%f26,	%f5,	%f4
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	xnorcc	%l5,	0x1A35,	%l6
	fornot1s	%f9,	%f28,	%f29
	tleu	%xcc,	0x2
	fsrc1s	%f8,	%f26
	subcc	%l0,	%g2,	%g4
	fmovsle	%icc,	%f21,	%f19
	tpos	%icc,	0x2
	and	%g3,	%o5,	%o0
	umul	%g7,	%g1,	%o4
	alignaddrl	%l1,	%o3,	%i5
	set	0x18, %o5
	stxa	%g5,	[%l7 + %o5] 0x88
	bcc,a	%icc,	loop_1026
	nop
	setx	0x705863BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	tne	%icc,	0x0
	movcs	%icc,	%i2,	%i1
loop_1026:
	tvs	%icc,	0x4
	brlez,a	%o7,	loop_1027
	fmovdn	%icc,	%f24,	%f22
	movvs	%icc,	%l3,	%i0
	fpsub32	%f20,	%f2,	%f22
loop_1027:
	array32	%o1,	%i6,	%i3
	subc	%o6,	%o2,	%g6
	edge8l	%i7,	%l4,	%i4
	umul	%l5,	%l6,	%l0
	movcs	%xcc,	%g2,	%g4
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	taddcctv	%o5,	0x0336,	%l2
	prefetch	[%l7 + 0x48],	 0x0
	umul	%o0,	0x1986,	%g7
	fsrc2s	%f12,	%f7
	fandnot1	%f24,	%f18,	%f4
	or	%o4,	%g1,	%l1
	addc	%i5,	%o3,	%g5
	movn	%xcc,	%i1,	%o7
	move	%icc,	%l3,	%i0
	edge8l	%o1,	%i2,	%i6
	movrgz	%o6,	%o2,	%g6
	brnz,a	%i7,	loop_1028
	bpos,a	loop_1029
	movrlez	%i3,	0x17A,	%l4
	te	%icc,	0x4
loop_1028:
	edge16ln	%i4,	%l5,	%l0
loop_1029:
	te	%xcc,	0x5
	edge16	%g2,	%g4,	%l6
	smulcc	%o5,	%l2,	%g3
	fnot2	%f30,	%f10
	nop
	fitos	%f1,	%f16
	fstox	%f16,	%f14
	sllx	%o0,	0x13,	%g7
	taddcctv	%o4,	0x01D1,	%g1
	ldstub	[%l7 + 0x48],	%l1
	andcc	%o3,	%g5,	%i1
	stbar
	array16	%i5,	%l3,	%i0
	tleu	%xcc,	0x2
	fbule,a	%fcc2,	loop_1030
	fpsub32s	%f30,	%f19,	%f15
	fnor	%f2,	%f24,	%f4
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f28
	fxtod	%f28,	%f20
loop_1030:
	add	%o7,	%i2,	%o1
	mulscc	%i6,	%o2,	%o6
	tpos	%icc,	0x4
	fones	%f9
	fmovsgu	%icc,	%f25,	%f29
	fmovrdgz	%g6,	%f28,	%f0
	subccc	%i7,	0x0D91,	%l4
	fbl	%fcc3,	loop_1031
	udivx	%i3,	0x1331,	%l5
	ldd	[%l7 + 0x40],	%f28
	nop
	setx	0xD918EF3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xBAF13A0F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f23,	%f3
loop_1031:
	fmovdle	%icc,	%f13,	%f24
	mova	%xcc,	%i4,	%g2
	movrgez	%g4,	%l0,	%l6
	movvc	%icc,	%o5,	%g3
	movge	%xcc,	%l2,	%o0
	fpadd16s	%f17,	%f11,	%f1
	membar	0x0F
	tgu	%xcc,	0x0
	edge16ln	%g7,	%g1,	%l1
	fmuld8sux16	%f5,	%f26,	%f24
	movvs	%icc,	%o4,	%o3
	taddcctv	%i1,	0x1E14,	%g5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x18,	%i5,	%l3
	membar	0x67
	set	0x72, %l1
	stba	%i0,	[%l7 + %l1] 0x88
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f28
	fxtod	%f28,	%f4
	taddcctv	%i2,	0x032B,	%o1
	nop
	setx	0x80893077,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x82621F67,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f4,	%f11
	set	0x40, %i3
	ldsba	[%l7 + %i3] 0x81,	%i6
	tne	%xcc,	0x4
	smulcc	%o7,	%o2,	%o6
	sdivcc	%i7,	0x0BC8,	%g6
	fblg	%fcc1,	loop_1032
	movge	%icc,	%i3,	%l4
	tcc	%xcc,	0x5
	mulscc	%i4,	0x11D3,	%l5
loop_1032:
	sethi	0x038C,	%g2
	tle	%icc,	0x0
	ba,pn	%xcc,	loop_1033
	fbg	%fcc1,	loop_1034
	ld	[%l7 + 0x70],	%f5
	bl	%icc,	loop_1035
loop_1033:
	edge8n	%l0,	%g4,	%o5
loop_1034:
	for	%f0,	%f14,	%f28
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x10
loop_1035:
	fmovdn	%xcc,	%f21,	%f9
	movg	%icc,	%g3,	%l2
	sdivx	%l6,	0x15FF,	%g7
	movrlez	%g1,	%l1,	%o0
	fnands	%f12,	%f23,	%f0
	orn	%o3,	%o4,	%i1
	ldx	[%l7 + 0x08],	%i5
	udivx	%g5,	0x1072,	%l3
	andcc	%i0,	%o1,	%i2
	movpos	%icc,	%i6,	%o2
	edge16ln	%o6,	%i7,	%o7
	andcc	%i3,	%g6,	%l4
	brgez	%i4,	loop_1036
	mulscc	%l5,	%g2,	%g4
	fmuld8sux16	%f8,	%f12,	%f16
	movg	%icc,	%l0,	%g3
loop_1036:
	edge8	%l2,	%l6,	%o5
	fmovde	%icc,	%f31,	%f1
	srlx	%g1,	%l1,	%o0
	movge	%xcc,	%g7,	%o4
	movre	%o3,	%i5,	%i1
	xnor	%l3,	0x0416,	%g5
	alignaddr	%i0,	%i2,	%o1
	alignaddr	%i6,	%o2,	%i7
	tl	%icc,	0x0
	fzero	%f18
	te	%icc,	0x3
	sub	%o6,	%i3,	%o7
	move	%icc,	%l4,	%g6
	fmovdpos	%xcc,	%f10,	%f15
	movrlez	%i4,	%l5,	%g2
	addc	%g4,	0x1FBB,	%l0
	fmovrdlz	%g3,	%f12,	%f12
	fba,a	%fcc1,	loop_1037
	fone	%f12
	tn	%xcc,	0x1
	ta	%xcc,	0x3
loop_1037:
	fbg,a	%fcc0,	loop_1038
	edge16n	%l6,	%l2,	%o5
	edge16ln	%l1,	%g1,	%o0
	fmul8x16al	%f24,	%f11,	%f24
loop_1038:
	fbu	%fcc3,	loop_1039
	fmovdcs	%xcc,	%f25,	%f5
	brgz,a	%o4,	loop_1040
	and	%g7,	0x0451,	%o3
loop_1039:
	sdivx	%i5,	0x0914,	%l3
	set	0x68, %o3
	swapa	[%l7 + %o3] 0x10,	%i1
loop_1040:
	andn	%i0,	0x0644,	%i2
	fbe,a	%fcc1,	loop_1041
	and	%g5,	%i6,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg,a	%fcc1,	loop_1042
loop_1041:
	srlx	%i7,	0x14,	%o6
	ldsb	[%l7 + 0x4D],	%o2
	fbuge	%fcc2,	loop_1043
loop_1042:
	tn	%xcc,	0x1
	bshuffle	%f10,	%f22,	%f18
	fble	%fcc1,	loop_1044
loop_1043:
	subc	%o7,	0x1B29,	%l4
	alignaddr	%i3,	%g6,	%i4
	movcs	%icc,	%g2,	%g4
loop_1044:
	subccc	%l0,	%l5,	%l6
	xnorcc	%g3,	%l2,	%l1
	set	0x5B, %l6
	stba	%o5,	[%l7 + %l6] 0x2f
	membar	#Sync
	brnz	%g1,	loop_1045
	xor	%o4,	%o0,	%o3
	fmovdn	%icc,	%f29,	%f0
	wr	%g0,	0xe2,	%asi
	stba	%i5,	[%l7 + 0x64] %asi
	membar	#Sync
loop_1045:
	mova	%xcc,	%l3,	%i1
	nop
	fitos	%f12,	%f15
	fstox	%f15,	%f30
	fxtos	%f30,	%f11
	brlez	%g7,	loop_1046
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x4
	udiv	%i0,	0x1918,	%i2
loop_1046:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x74] %asi,	%i6
	tn	%icc,	0x3
	movpos	%xcc,	%o1,	%g5
	array8	%i7,	%o6,	%o2
	fbue	%fcc0,	loop_1047
	bge,a	loop_1048
	tg	%xcc,	0x5
	ldsb	[%l7 + 0x0C],	%o7
loop_1047:
	nop
	setx	0xBE3C4EE3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x478C99D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f13,	%f0
loop_1048:
	tle	%icc,	0x7
	tpos	%icc,	0x4
	movvc	%icc,	%l4,	%i3
	fmovrslez	%i4,	%f27,	%f18
	movre	%g6,	0x033,	%g2
	fmovsg	%icc,	%f16,	%f4
	nop
	fitod	%f2,	%f2
	fdtos	%f2,	%f22
	movpos	%xcc,	%l0,	%g4
	movrlez	%l6,	%g3,	%l5
	fnot1s	%f11,	%f26
	smulcc	%l2,	%o5,	%g1
	fmovrslz	%o4,	%f3,	%f3
	udivx	%o0,	0x0A66,	%o3
	tcc	%xcc,	0x0
	sub	%i5,	0x0710,	%l1
	movcc	%icc,	%l3,	%g7
	xorcc	%i0,	%i2,	%i1
	movgu	%icc,	%i6,	%o1
	movneg	%icc,	%g5,	%o6
	movcs	%icc,	%i7,	%o2
	sethi	0x1591,	%l4
	ldsb	[%l7 + 0x26],	%i3
	popc	%o7,	%i4
	movrlez	%g2,	0x174,	%l0
	edge32ln	%g6,	%l6,	%g3
	fcmpne16	%f6,	%f2,	%l5
	udivcc	%g4,	0x1037,	%o5
	tpos	%icc,	0x4
	sdiv	%l2,	0x1843,	%g1
	or	%o0,	0x0C7B,	%o3
	taddcc	%i5,	0x1488,	%l1
	tg	%xcc,	0x7
	set	0x30, %i4
	ldda	[%l7 + %i4] 0xe2,	%o4
	fpadd16s	%f15,	%f3,	%f5
	sdivx	%g7,	0x049F,	%l3
	umulcc	%i0,	%i2,	%i6
	swap	[%l7 + 0x64],	%i1
	orncc	%g5,	%o6,	%o1
	subccc	%i7,	%o2,	%l4
	sllx	%o7,	0x08,	%i3
	stbar
	fone	%f28
	movge	%xcc,	%i4,	%g2
	movvc	%xcc,	%g6,	%l6
	srl	%l0,	0x1F,	%g3
	fpsub16s	%f21,	%f26,	%f20
	add	%g4,	0x0DFB,	%o5
	ldsb	[%l7 + 0x79],	%l5
	movre	%g1,	%l2,	%o3
	edge32	%o0,	%i5,	%l1
	fbul	%fcc0,	loop_1049
	nop
	setx	0x24844762,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xF6D975DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f31,	%f15
	brlz,a	%g7,	loop_1050
	brlez	%l3,	loop_1051
loop_1049:
	fbul	%fcc0,	loop_1052
	movl	%xcc,	%i0,	%i2
loop_1050:
	move	%xcc,	%i6,	%o4
loop_1051:
	sra	%g5,	%o6,	%i1
loop_1052:
	edge32n	%o1,	%i7,	%l4
	edge16ln	%o2,	%i3,	%i4
	movne	%xcc,	%g2,	%g6
	fmovdge	%icc,	%f17,	%f21
	fbul	%fcc2,	loop_1053
	be,a,pn	%icc,	loop_1054
	edge16l	%l6,	%o7,	%g3
	tcc	%xcc,	0x5
loop_1053:
	edge8n	%g4,	%o5,	%l5
loop_1054:
	ld	[%l7 + 0x58],	%f29
	umul	%l0,	0x08B3,	%l2
	fbe,a	%fcc0,	loop_1055
	sll	%o3,	%o0,	%g1
	fcmple32	%f12,	%f8,	%i5
	mulx	%g7,	%l3,	%i0
loop_1055:
	orn	%l1,	%i2,	%o4
	swap	[%l7 + 0x2C],	%g5
	subcc	%o6,	0x0127,	%i1
	udivcc	%o1,	0x17FD,	%i7
	ta	%xcc,	0x6
	set	0x20, %i1
	swapa	[%l7 + %i1] 0x88,	%l4
	nop
	fitos	%f11,	%f15
	addc	%o2,	0x17B0,	%i3
	tsubcctv	%i6,	%i4,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%o7
	fmovsvc	%icc,	%f16,	%f7
	movl	%icc,	%l6,	%g4
	fpsub16s	%f13,	%f23,	%f7
	fmovrdlez	%o5,	%f10,	%f2
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge32ln	%l5,	%g3,	%l0
	alignaddr	%o3,	%o0,	%g1
	srax	%l2,	%g7,	%l3
	ldstub	[%l7 + 0x26],	%i5
	wr	%g0,	0x22,	%asi
	stwa	%l1,	[%l7 + 0x4C] %asi
	membar	#Sync
	edge8ln	%i0,	%o4,	%i2
	and	%g5,	0x1C92,	%o6
	array8	%i1,	%o1,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0A33,	%o2
	tneg	%icc,	0x7
	fbe,a	%fcc3,	loop_1056
	tle	%xcc,	0x7
	set	0x24, %g6
	stwa	%i3,	[%l7 + %g6] 0x81
loop_1056:
	fmovrde	%i7,	%f14,	%f2
	nop
	setx	0xEF043ADC24A5C91C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xC7130F7DADB0743F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f4,	%f26
	wr	%g0,	0x22,	%asi
	stwa	%i6,	[%l7 + 0x44] %asi
	membar	#Sync
	xnorcc	%g6,	%i4,	%o7
	movrgez	%g2,	0x3F5,	%l6
	nop
	setx	loop_1057,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%g4,	%o5,	%l5
	tsubcc	%g3,	%o3,	%o0
	srlx	%l0,	0x0D,	%g1
loop_1057:
	xor	%l2,	%l3,	%i5
	edge32n	%l1,	%g7,	%o4
	fmovrdne	%i2,	%f14,	%f30
	sdivcc	%g5,	0x0A46,	%i0
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	edge8	%i1,	%l4,	%o1
	fpack32	%f18,	%f16,	%f24
	fbne,a	%fcc2,	loop_1058
	fmovdpos	%xcc,	%f10,	%f3
	srax	%i3,	0x19,	%i7
	fmovdn	%icc,	%f15,	%f31
loop_1058:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x72] %asi,	%o2
	movleu	%icc,	%g6,	%i6
	movvc	%icc,	%i4,	%g2
	addc	%l6,	%g4,	%o5
	addc	%o7,	0x1C50,	%l5
	edge32l	%o3,	%g3,	%l0
	sdiv	%o0,	0x0EE6,	%g1
	set	0x54, %l3
	lduba	[%l7 + %l3] 0x11,	%l2
	ld	[%l7 + 0x60],	%f21
	bne	loop_1059
	flush	%l7 + 0x34
	fmovdneg	%icc,	%f31,	%f0
	tsubcctv	%l3,	%i5,	%g7
loop_1059:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,a,pn	%xcc,	loop_1060
	edge32	%l1,	%i2,	%g5
	ble,a	%xcc,	loop_1061
	edge32	%o4,	%i0,	%i1
loop_1060:
	movl	%icc,	%l4,	%o1
	subcc	%o6,	%i7,	%i3
loop_1061:
	srl	%g6,	%o2,	%i4
	movvs	%xcc,	%g2,	%i6
	move	%xcc,	%l6,	%g4
	fmovsl	%icc,	%f6,	%f11
	fnot1s	%f25,	%f7
	fmovdg	%icc,	%f27,	%f31
	tge	%icc,	0x7
	bg,a,pn	%icc,	loop_1062
	srlx	%o7,	%o5,	%o3
	fmovsleu	%xcc,	%f29,	%f0
	fpmerge	%f25,	%f21,	%f20
loop_1062:
	brlez	%g3,	loop_1063
	fba,a	%fcc1,	loop_1064
	fcmpne32	%f12,	%f30,	%l0
	move	%icc,	%l5,	%o0
loop_1063:
	nop
	wr	%g0,	0x80,	%asi
	stha	%g1,	[%l7 + 0x0E] %asi
loop_1064:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f4,	[%l7 + 0x3C] %asi
	movne	%xcc,	%l3,	%l2
	tsubcc	%g7,	%l1,	%i2
	addccc	%g5,	%o4,	%i0
	sllx	%i1,	0x03,	%l4
	movle	%xcc,	%i5,	%o6
	fabss	%f27,	%f4
	andn	%o1,	0x1428,	%i3
	fcmpgt32	%f14,	%f0,	%g6
	fone	%f18
	movcc	%icc,	%i7,	%o2
	smulcc	%g2,	%i4,	%l6
	bg,a,pt	%xcc,	loop_1065
	ldub	[%l7 + 0x1C],	%i6
	fblg,a	%fcc2,	loop_1066
	or	%g4,	%o5,	%o3
loop_1065:
	tneg	%icc,	0x5
	std	%f20,	[%l7 + 0x08]
loop_1066:
	nop
	fitos	%f10,	%f15
	fstod	%f15,	%f4
	fmovdpos	%icc,	%f7,	%f23
	fands	%f22,	%f4,	%f23
	or	%g3,	0x14A0,	%o7
	swap	[%l7 + 0x2C],	%l0
	fsrc2s	%f15,	%f17
	fzeros	%f20
	sll	%l5,	0x04,	%g1
	ldd	[%l7 + 0x78],	%l2
	nop
	setx	0x4F79C12B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xABECAE73,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f14,	%f18
	sll	%o0,	0x05,	%g7
	movvs	%xcc,	%l2,	%l1
	sdivcc	%i2,	0x0B31,	%o4
	bge,a	loop_1067
	edge16l	%i0,	%i1,	%l4
	brlez	%i5,	loop_1068
	ld	[%l7 + 0x24],	%f12
loop_1067:
	edge16ln	%o6,	%g5,	%i3
	set	0x10, %l0
	prefetcha	[%l7 + %l0] 0x19,	 0x3
loop_1068:
	edge8	%i7,	%o1,	%g2
	fnegs	%f1,	%f14
	fba	%fcc0,	loop_1069
	fmul8x16au	%f16,	%f2,	%f24
	xnor	%i4,	0x00F3,	%l6
	ta	%icc,	0x0
loop_1069:
	subcc	%i6,	%g4,	%o2
	andcc	%o5,	%o3,	%o7
	fmovsgu	%xcc,	%f13,	%f17
	sdivx	%l0,	0x1B68,	%l5
	fnot1s	%f7,	%f4
	tgu	%icc,	0x6
	bne,pn	%xcc,	loop_1070
	movvc	%xcc,	%g1,	%g3
	bcs	loop_1071
	movle	%xcc,	%l3,	%g7
loop_1070:
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f8
	fxtod	%f8,	%f28
	movne	%icc,	%o0,	%l1
loop_1071:
	srl	%l2,	0x08,	%o4
	nop
	setx	0x5F2AF09A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x9926CA31,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f24,	%f1
	fzeros	%f24
	movcc	%icc,	%i2,	%i1
	sdiv	%i0,	0x1BD0,	%i5
	brlez	%o6,	loop_1072
	fmovdleu	%icc,	%f27,	%f11
	fpsub16s	%f31,	%f26,	%f25
	add	%g5,	%i3,	%l4
loop_1072:
	movleu	%xcc,	%g6,	%o1
	edge16n	%i7,	%i4,	%l6
	set	0x74, %o2
	ldswa	[%l7 + %o2] 0x14,	%g2
	fxors	%f8,	%f14,	%f17
	fandnot2	%f22,	%f0,	%f20
	set	0x130, %l2
	nop 	! 	nop 	! 	ldxa	[%g0 + %l2] 0x40,	%g4 ripped by fixASI40.pl ripped by fixASI40.pl
	tvc	%icc,	0x6
	tcc	%icc,	0x3
	array16	%o2,	%o5,	%o3
	edge8	%i6,	%l0,	%l5
	sir	0x1F69
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x0c,	%f0
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x36] %asi,	%o7
	fands	%f29,	%f27,	%f29
	xnor	%g1,	0x10BB,	%l3
	fbg,a	%fcc3,	loop_1073
	sir	0x039C
	fand	%f0,	%f20,	%f26
	move	%icc,	%g3,	%o0
loop_1073:
	fnands	%f19,	%f28,	%f14
	brnz,a	%g7,	loop_1074
	fmovrde	%l2,	%f6,	%f18
	add	%o4,	%i2,	%l1
	fble	%fcc1,	loop_1075
loop_1074:
	fzeros	%f0
	fnand	%f6,	%f28,	%f12
	edge8l	%i1,	%i0,	%o6
loop_1075:
	sethi	0x0239,	%g5
	tg	%icc,	0x7
	srax	%i5,	%i3,	%l4
	tcc	%xcc,	0x5
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%o1
	fnors	%f31,	%f22,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x4
	udivx	%i7,	0x165A,	%i4
	movrgez	%l6,	%g6,	%g4
	mulscc	%g2,	%o2,	%o3
	nop
	set	0x17, %o7
	stb	%i6,	[%l7 + %o7]
	edge8	%o5,	%l5,	%o7
	tne	%icc,	0x3
	fmul8x16	%f5,	%f26,	%f22
	stbar
	or	%l0,	%l3,	%g1
	std	%f14,	[%l7 + 0x18]
	nop
	fitos	%f17,	%f12
	andcc	%o0,	%g3,	%g7
	move	%xcc,	%l2,	%o4
	ldstub	[%l7 + 0x40],	%i2
	ldstub	[%l7 + 0x7B],	%i1
	xnor	%i0,	%o6,	%g5
	xnorcc	%i5,	0x0C01,	%i3
	fbg,a	%fcc3,	loop_1076
	fpack16	%f24,	%f30
	sra	%l4,	0x1B,	%l1
	tl	%icc,	0x1
loop_1076:
	movne	%xcc,	%o1,	%i4
	lduw	[%l7 + 0x64],	%l6
	umulcc	%i7,	%g6,	%g2
	bge,a	%icc,	loop_1077
	array8	%g4,	%o3,	%o2
	tsubcc	%i6,	%o5,	%o7
	set	0x74, %l5
	lduba	[%l7 + %l5] 0x81,	%l5
loop_1077:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%l0,	[%l7 + 0x54] %asi
	brlez	%g1,	loop_1078
	mulx	%o0,	%l3,	%g3
	bvc,pn	%xcc,	loop_1079
	xnor	%l2,	%o4,	%g7
loop_1078:
	fand	%f4,	%f22,	%f8
	sll	%i2,	%i1,	%o6
loop_1079:
	nop
	set	0x22, %o4
	ldsba	[%l7 + %o4] 0x80,	%g5
	orn	%i5,	%i3,	%l4
	nop
	setx	0xB916E52FF05E782A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%l1,	%i0
	swap	[%l7 + 0x60],	%o1
	and	%i4,	0x1B3C,	%l6
	fbn,a	%fcc0,	loop_1080
	movl	%icc,	%i7,	%g2
	edge32	%g6,	%g4,	%o2
	tsubcctv	%i6,	%o5,	%o7
loop_1080:
	tn	%xcc,	0x3
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x44] %asi,	%f30
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	tne	%icc,	0x1
	fmovrsne	%o3,	%f16,	%f13
	xnorcc	%g1,	0x08E1,	%o0
	fabss	%f9,	%f5
	array32	%l3,	%l0,	%l2
	fcmple32	%f28,	%f14,	%g3
	srax	%g7,	0x1C,	%i2
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f12
	fxtod	%f12,	%f18
	ldub	[%l7 + 0x44],	%i1
	fnegs	%f20,	%f22
	edge32ln	%o6,	%g5,	%o4
	tgu	%icc,	0x0
	wr	%g0,	0x04,	%asi
	sta	%f6,	[%l7 + 0x70] %asi
	fbg	%fcc3,	loop_1081
	fandnot2	%f12,	%f28,	%f30
	fmul8ulx16	%f6,	%f4,	%f24
	sra	%i5,	0x0A,	%l4
loop_1081:
	edge32	%i3,	%l1,	%i0
	fmul8ulx16	%f22,	%f22,	%f28
	bpos,pn	%xcc,	loop_1082
	ldstub	[%l7 + 0x55],	%i4
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
	array32	%l6,	%i7,	%o1
loop_1082:
	edge32n	%g2,	%g6,	%g4
	fmul8ulx16	%f10,	%f22,	%f0
loop_1083:
	movge	%icc,	%i6,	%o5
	fblg	%fcc0,	loop_1084
	fcmple16	%f8,	%f16,	%o2
	fnands	%f20,	%f24,	%f13
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l5
loop_1084:
	fmovsle	%xcc,	%f27,	%f20
	movcs	%xcc,	%o3,	%o7
	edge32l	%g1,	%o0,	%l0
	ba	loop_1085
	movrgz	%l2,	%l3,	%g3
	fxnor	%f20,	%f30,	%f0
	sdiv	%i2,	0x0C5D,	%g7
loop_1085:
	fmovrde	%i1,	%f16,	%f14
	fcmple16	%f28,	%f20,	%o6
	xnor	%o4,	0x1A1F,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%g5,	0x1F54,	%l4
	set	0x40, %g3
	stwa	%l1,	[%l7 + %g3] 0x10
	subccc	%i3,	%i4,	%i0
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l6
	array8	%i7,	%o1,	%g6
	ldsh	[%l7 + 0x42],	%g2
	tneg	%icc,	0x4
	fbuge	%fcc2,	loop_1086
	movle	%icc,	%g4,	%o5
	xorcc	%o2,	%i6,	%o3
	fmovse	%icc,	%f23,	%f9
loop_1086:
	ba,a	%icc,	loop_1087
	tvs	%xcc,	0x0
	orncc	%o7,	%l5,	%o0
	movrlez	%g1,	0x071,	%l0
loop_1087:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x34],	%l2
	nop
	setx	0x21F44206,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x6D408B6E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f7,	%f9
	addc	%g3,	0x1997,	%i2
	sdivcc	%g7,	0x068C,	%i1
	tg	%icc,	0x4
	andncc	%l3,	%o6,	%i5
	sth	%g5,	[%l7 + 0x6A]
	sdivx	%l4,	0x0DAB,	%l1
	movcc	%xcc,	%i3,	%i4
	be,pt	%xcc,	loop_1088
	andcc	%o4,	%l6,	%i0
	fcmple32	%f4,	%f24,	%o1
	tg	%xcc,	0x5
loop_1088:
	nop
	setx	0x5FDA2B2CE0561B12,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x80,	%g6,	%g2
	tleu	%xcc,	0x2
	movre	%g4,	%i7,	%o5
	smul	%i6,	0x054F,	%o2
	tleu	%icc,	0x3
	edge8	%o7,	%o3,	%o0
	popc	%l5,	%g1
	edge32l	%l2,	%g3,	%i2
	subccc	%l0,	0x18F1,	%i1
	nop
	fitod	%f12,	%f28
	fdtox	%f28,	%f20
	sll	%g7,	0x0E,	%l3
	edge32n	%o6,	%i5,	%l4
	set	0x13, %i6
	ldstuba	[%l7 + %i6] 0x89,	%l1
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f16
	fxtod	%f16,	%f6
	fand	%f0,	%f10,	%f26
	st	%f25,	[%l7 + 0x50]
	sdiv	%g5,	0x0972,	%i4
	edge16l	%i3,	%o4,	%i0
	fba,a	%fcc2,	loop_1089
	fnot2s	%f28,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o1,	0x04B1,	%l6
loop_1089:
	fbge,a	%fcc3,	loop_1090
	smul	%g2,	%g6,	%i7
	stw	%o5,	[%l7 + 0x4C]
	flush	%l7 + 0x24
loop_1090:
	stw	%i6,	[%l7 + 0x3C]
	brlz,a	%o2,	loop_1091
	fone	%f4
	edge32	%o7,	%o3,	%o0
	smulcc	%g4,	0x094C,	%g1
loop_1091:
	fbu	%fcc3,	loop_1092
	brgz,a	%l5,	loop_1093
	array32	%l2,	%g3,	%l0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x77] %asi,	%i2
loop_1092:
	umulcc	%i1,	0x10B7,	%g7
loop_1093:
	tne	%xcc,	0x3
	brz,a	%o6,	loop_1094
	fmul8x16al	%f21,	%f3,	%f6
	udivx	%l3,	0x1BD8,	%i5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x77] %asi,	%l4
loop_1094:
	mulx	%g5,	%l1,	%i4
	alignaddrl	%i3,	%i0,	%o1
	edge32l	%o4,	%g2,	%g6
	bgu,pn	%xcc,	loop_1095
	movrlez	%l6,	%i7,	%o5
	ldd	[%l7 + 0x20],	%f22
	movn	%xcc,	%o2,	%i6
loop_1095:
	nop
	wr	%g0,	0xeb,	%asi
	stxa	%o3,	[%l7 + 0x60] %asi
	membar	#Sync
	brz,a	%o0,	loop_1096
	movrgez	%o7,	%g4,	%g1
	be	%icc,	loop_1097
	stb	%l2,	[%l7 + 0x50]
loop_1096:
	edge16ln	%l5,	%l0,	%g3
	edge16ln	%i1,	%g7,	%o6
loop_1097:
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f30
	fxtod	%f30,	%f10
	fpsub16s	%f19,	%f19,	%f26
	alignaddrl	%l3,	%i2,	%l4
	fmovsgu	%xcc,	%f31,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%i5,	%g5,	%i4
	move	%xcc,	%l1,	%i0
	fbu,a	%fcc3,	loop_1098
	array32	%i3,	%o4,	%g2
	tcs	%icc,	0x0
	xnor	%g6,	0x140C,	%l6
loop_1098:
	edge32ln	%i7,	%o5,	%o2
	fmovde	%xcc,	%f28,	%f5
	wr	%g0,	0xe2,	%asi
	stba	%o1,	[%l7 + 0x65] %asi
	membar	#Sync
	fpadd16	%f20,	%f26,	%f28
	fmovsneg	%icc,	%f25,	%f27
	brgz	%o3,	loop_1099
	fmul8x16	%f14,	%f26,	%f6
	edge32n	%o0,	%o7,	%i6
	sdivx	%g4,	0x1CFB,	%l2
loop_1099:
	brlz,a	%g1,	loop_1100
	addccc	%l0,	0x035E,	%g3
	st	%f13,	[%l7 + 0x6C]
	sllx	%i1,	%g7,	%l5
loop_1100:
	fandnot2	%f26,	%f6,	%f8
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o6,	%i2,	%l4
	fmovrdne	%i5,	%f10,	%f20
	movgu	%icc,	%g5,	%i4
	set	0x38, %g5
	prefetcha	[%l7 + %g5] 0x10,	 0x2
	edge16n	%i0,	%i3,	%o4
	edge32l	%g6,	%g2,	%l6
	movcs	%icc,	%i7,	%o2
	bshuffle	%f30,	%f14,	%f16
	fmovse	%icc,	%f14,	%f12
	tcc	%icc,	0x0
	fone	%f26
	bg,a	loop_1101
	alignaddrl	%o1,	%o3,	%o0
	be,a,pt	%icc,	loop_1102
	fcmple16	%f30,	%f20,	%o5
loop_1101:
	nop
	set	0x3e0, %g2
	nop 	! 	stxa	%i6,	[%g0 + %g2] 0x40 ripped by fixASI40.pl
loop_1102:
	bne	%icc,	loop_1103
	smul	%o7,	0x1076,	%l2
	wr	%g0,	0xe3,	%asi
	stha	%g4,	[%l7 + 0x6C] %asi
	membar	#Sync
loop_1103:
	orcc	%l0,	%g3,	%g1
	edge8n	%g7,	%l5,	%i1
	fabss	%f14,	%f13
	nop
	setx	loop_1104,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fone	%f22
	fones	%f26
	fornot2	%f6,	%f16,	%f28
loop_1104:
	movrgez	%o6,	0x0DC,	%i2
	andcc	%l4,	0x017A,	%i5
	prefetch	[%l7 + 0x1C],	 0x0
	fpsub32	%f8,	%f26,	%f10
	edge8ln	%l3,	%i4,	%l1
	movpos	%xcc,	%i0,	%i3
	fmovdne	%icc,	%f6,	%f28
	taddcc	%g5,	%o4,	%g2
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
	fbge	%fcc1,	loop_1106
	fands	%f17,	%f31,	%f6
	fmovdvc	%xcc,	%f19,	%f19
loop_1105:
	sra	%g6,	0x18,	%i7
loop_1106:
	bpos,a,pn	%xcc,	loop_1107
	mulscc	%o2,	%o1,	%l6
	mova	%icc,	%o0,	%o3
	umulcc	%o5,	0x1C10,	%i6
loop_1107:
	fmovs	%f25,	%f7
	movcc	%icc,	%l2,	%o7
	sdivcc	%l0,	0x17E3,	%g4
	tcs	%xcc,	0x4
	movpos	%icc,	%g3,	%g7
	fzeros	%f13
	be,a,pn	%icc,	loop_1108
	fbg,a	%fcc3,	loop_1109
	edge8ln	%g1,	%i1,	%o6
	set	0x3C, %o1
	ldsha	[%l7 + %o1] 0x88,	%i2
loop_1108:
	tgu	%icc,	0x4
loop_1109:
	orcc	%l4,	%i5,	%l5
	array32	%i4,	%l1,	%i0
	movpos	%icc,	%i3,	%l3
	fbu,a	%fcc2,	loop_1110
	fcmpeq16	%f22,	%f0,	%g5
	movgu	%icc,	%o4,	%g2
	sll	%i7,	0x03,	%o2
loop_1110:
	nop
	fitos	%f10,	%f27
	fstox	%f27,	%f14
	ld	[%l7 + 0x08],	%f7
	fmul8x16au	%f0,	%f23,	%f20
	tg	%xcc,	0x7
	flush	%l7 + 0x28
	fpadd16	%f18,	%f28,	%f6
	fones	%f29
	membar	0x5A
	xnorcc	%g6,	%l6,	%o0
	movleu	%xcc,	%o3,	%o1
	fandnot1	%f4,	%f12,	%f12
	brgz,a	%i6,	loop_1111
	array8	%l2,	%o5,	%l0
	fblg	%fcc3,	loop_1112
	brgez,a	%o7,	loop_1113
loop_1111:
	orncc	%g3,	0x1350,	%g4
	mulx	%g7,	0x169B,	%i1
loop_1112:
	fsrc1	%f30,	%f2
loop_1113:
	edge8l	%o6,	%i2,	%g1
	movg	%icc,	%l4,	%i5
	tsubcctv	%l5,	0x0BD6,	%l1
	udiv	%i4,	0x1349,	%i0
	movvc	%icc,	%i3,	%l3
	edge8l	%o4,	%g5,	%g2
	ta	%icc,	0x4
	membar	0x5D
	nop
	fitos	%f8,	%f0
	fstox	%f0,	%f16
	fabsd	%f24,	%f22
	bpos,pt	%icc,	loop_1114
	edge8l	%i7,	%g6,	%l6
	edge32	%o0,	%o2,	%o3
	tsubcctv	%i6,	0x1610,	%o1
loop_1114:
	movleu	%xcc,	%l2,	%l0
	nop
	set	0x35, %o6
	ldsb	[%l7 + %o6],	%o5
	fmovdgu	%xcc,	%f2,	%f26
	ldx	[%l7 + 0x48],	%g3
	umulcc	%g4,	%g7,	%o7
	fmovdgu	%xcc,	%f22,	%f14
	movge	%icc,	%o6,	%i2
	brnz,a	%i1,	loop_1115
	ta	%icc,	0x2
	bgu,a,pn	%xcc,	loop_1116
	taddcc	%l4,	0x0E0D,	%g1
loop_1115:
	array16	%i5,	%l1,	%l5
	fmovdn	%icc,	%f2,	%f7
loop_1116:
	fcmpeq32	%f24,	%f0,	%i4
	bpos,a	%icc,	loop_1117
	fmovrsgz	%i3,	%f10,	%f18
	tgu	%xcc,	0x2
	subccc	%l3,	0x0E21,	%o4
loop_1117:
	addc	%i0,	%g2,	%g5
	fmovdg	%xcc,	%f9,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1118
	fmul8sux16	%f8,	%f22,	%f24
	ldub	[%l7 + 0x0D],	%i7
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x04,	 0x2
loop_1118:
	fmovsle	%icc,	%f19,	%f17
	movrlz	%o0,	%l6,	%o2
	bg,pt	%xcc,	loop_1119
	nop
	fitos	%f1,	%f11
	fstox	%f11,	%f10
	sdivcc	%o3,	0x02C7,	%o1
	bcc,a,pt	%xcc,	loop_1120
loop_1119:
	fpackfix	%f24,	%f12
	addccc	%i6,	%l2,	%o5
	subc	%l0,	%g4,	%g3
loop_1120:
	orn	%g7,	%o7,	%o6
	umulcc	%i1,	%l4,	%g1
	fmovda	%xcc,	%f29,	%f1
	subc	%i2,	0x1DCD,	%l1
	edge32ln	%i5,	%l5,	%i3
	edge8ln	%l3,	%o4,	%i4
	bgu,pn	%icc,	loop_1121
	andncc	%g2,	%i0,	%i7
	movcs	%xcc,	%g6,	%o0
	movle	%xcc,	%l6,	%o2
loop_1121:
	bl,a	%icc,	loop_1122
	tvs	%xcc,	0x5
	stbar
	ta	%xcc,	0x7
loop_1122:
	sdiv	%o3,	0x0B4F,	%o1
	fbule	%fcc1,	loop_1123
	addcc	%i6,	0x0A20,	%g5
	nop
	setx	loop_1124,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%o5,	%l0
loop_1123:
	fmovrdgez	%g4,	%f30,	%f20
	fbn	%fcc2,	loop_1125
loop_1124:
	alignaddr	%l2,	%g3,	%g7
	nop
	setx	0x4DB2281A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xA21CE233,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f9,	%f5
	fnot2	%f6,	%f22
loop_1125:
	tle	%icc,	0x6
	fabss	%f16,	%f25
	std	%f16,	[%l7 + 0x60]
	nop
	fitod	%f2,	%f22
	fdtox	%f22,	%f26
	set	0x18, %g1
	prefetcha	[%l7 + %g1] 0x18,	 0x0
	tg	%xcc,	0x6
	nop
	fitos	%f6,	%f21
	fstox	%f21,	%f2
	fxtos	%f2,	%f0
	umulcc	%i1,	%o6,	%l4
	stx	%g1,	[%l7 + 0x60]
	movvs	%xcc,	%i2,	%i5
	wr	%g0,	0x11,	%asi
	sta	%f20,	[%l7 + 0x50] %asi
	subccc	%l1,	%i3,	%l5
	tvc	%xcc,	0x4
	tsubcc	%l3,	0x1659,	%o4
	brlz,a	%i4,	loop_1126
	edge16l	%i0,	%g2,	%g6
	fble,a	%fcc1,	loop_1127
	bvc,pn	%icc,	loop_1128
loop_1126:
	membar	0x0A
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1127:
	fmovdvs	%icc,	%f20,	%f6
loop_1128:
	movrgz	%o0,	0x252,	%i7
	subcc	%o2,	%o3,	%o1
	sub	%l6,	%g5,	%o5
	sir	0x0734
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] 0x89,	%i6,	%l0
	edge16n	%g4,	%g3,	%l2
	fones	%f0
	st	%f24,	[%l7 + 0x44]
	nop
	setx	0xB04345FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	te	%icc,	0x7
	fmul8sux16	%f20,	%f30,	%f12
	movle	%icc,	%g7,	%o7
	edge8	%i1,	%l4,	%g1
	movrlez	%o6,	%i2,	%l1
	fmovsne	%icc,	%f23,	%f22
	tcc	%icc,	0x0
	fmovsleu	%icc,	%f12,	%f1
	srlx	%i3,	0x16,	%i5
	brgez,a	%l5,	loop_1129
	fba	%fcc3,	loop_1130
	popc	%o4,	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%g2
loop_1129:
	sub	%g6,	%i0,	%i7
loop_1130:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o0,	0x153F,	%o2
	edge32	%o1,	%l6,	%g5
	edge8n	%o5,	%i6,	%l0
	fbuge	%fcc0,	loop_1131
	subc	%o3,	0x1475,	%g4
	movvs	%icc,	%l2,	%g3
	for	%f24,	%f8,	%f28
loop_1131:
	fpadd32s	%f4,	%f22,	%f24
	movrlz	%g7,	0x0DD,	%o7
	tn	%xcc,	0x6
	set	0x30, %i2
	ldxa	[%g0 + %i2] 0x20,	%i1
	taddcc	%l4,	0x099E,	%o6
	xnor	%i2,	%l1,	%g1
	taddcctv	%i5,	%i3,	%o4
	membar	0x2C
	fornot1	%f30,	%f4,	%f0
	taddcc	%l5,	0x07C4,	%l3
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x18,	%f0
	subcc	%i4,	0x04F4,	%g6
	array16	%g2,	%i0,	%o0
	movne	%xcc,	%i7,	%o1
	nop
	setx	0x0E983B10DA52468E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC8A36D718DA07148,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f30,	%f6
	edge32l	%o2,	%l6,	%o5
	array8	%i6,	%l0,	%o3
	udivcc	%g5,	0x1CD7,	%g4
	xnor	%g3,	%g7,	%l2
	brnz	%o7,	loop_1132
	call	loop_1133
	edge8	%l4,	%o6,	%i1
	bl,a	%icc,	loop_1134
loop_1132:
	edge32ln	%l1,	%g1,	%i2
loop_1133:
	tcc	%icc,	0x7
	tn	%icc,	0x0
loop_1134:
	bne,a,pt	%xcc,	loop_1135
	movvs	%icc,	%i3,	%i5
	subcc	%o4,	0x17A8,	%l5
	and	%l3,	0x1011,	%g6
loop_1135:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%i0
	fmovsle	%xcc,	%f21,	%f14
	sra	%o0,	0x0F,	%i7
	st	%f27,	[%l7 + 0x1C]
	movvs	%icc,	%o1,	%g2
	pdist	%f0,	%f18,	%f28
	tl	%xcc,	0x1
	fmuld8sux16	%f26,	%f7,	%f10
	brgez	%o2,	loop_1136
	orncc	%o5,	0x19DE,	%l6
	taddcc	%l0,	%i6,	%g5
	udivcc	%g4,	0x1769,	%g3
loop_1136:
	tleu	%xcc,	0x0
	subccc	%o3,	%l2,	%g7
	bcc,a,pn	%xcc,	loop_1137
	fmovrdgz	%o7,	%f0,	%f30
	movrgez	%l4,	0x091,	%o6
	fmovrde	%i1,	%f18,	%f18
loop_1137:
	fbn,a	%fcc3,	loop_1138
	ld	[%l7 + 0x08],	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l1,	0x0051,	%i2
loop_1138:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g1,	%i3
	movrgez	%o4,	0x306,	%i5
	movleu	%icc,	%l5,	%l3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%i4,	%g6
	bge,pt	%xcc,	loop_1139
	popc	0x04AC,	%o0
	popc	%i0,	%i7
	edge32n	%o1,	%o2,	%g2
loop_1139:
	bcc,a,pt	%xcc,	loop_1140
	tge	%xcc,	0x4
	bneg	loop_1141
	tgu	%xcc,	0x2
loop_1140:
	umulcc	%l6,	0x04F3,	%l0
	ldsb	[%l7 + 0x3C],	%i6
loop_1141:
	nop
	set	0x2A, %g4
	lduha	[%l7 + %g4] 0x19,	%g5
	movg	%xcc,	%g4,	%o5
	set	0x108, %i0
	ldxa	[%g0 + %i0] 0x21,	%g3
	fsrc1s	%f6,	%f31
	udivx	%l2,	0x1E23,	%g7
	nop
	setx	0x37CC7B7B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f7
	fmovdpos	%xcc,	%f10,	%f12
	movl	%icc,	%o3,	%o7
	fmovd	%f8,	%f6
	addccc	%o6,	%l4,	%l1
	sra	%i2,	%i1,	%i3
	andn	%g1,	0x1AB1,	%o4
	move	%xcc,	%l5,	%l3
	and	%i4,	%g6,	%o0
	tvs	%xcc,	0x7
	ldstub	[%l7 + 0x2A],	%i5
	tsubcc	%i0,	0x0AB0,	%i7
	tvs	%icc,	0x4
	tne	%icc,	0x3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%o1,	%o2
	movcc	%xcc,	%g2,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x0C] %asi,	%f3
	array32	%l0,	%g5,	%i6
	fmovrse	%g4,	%f8,	%f29
	nop
	setx	loop_1142,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlez	%o5,	loop_1143
	brlez	%g3,	loop_1144
	tpos	%icc,	0x4
loop_1142:
	nop
	fitod	%f2,	%f24
	fdtoi	%f24,	%f5
loop_1143:
	bn,a,pt	%icc,	loop_1145
loop_1144:
	bcs,a	loop_1146
	fbge	%fcc2,	loop_1147
	fmovsn	%xcc,	%f24,	%f10
loop_1145:
	tvc	%icc,	0x6
loop_1146:
	stbar
loop_1147:
	subc	%l2,	%g7,	%o7
	sir	0x0DBA
	brgez,a	%o3,	loop_1148
	fmovrsgz	%o6,	%f24,	%f2
	edge16	%l4,	%i2,	%l1
	movne	%xcc,	%i3,	%g1
loop_1148:
	fbuge,a	%fcc2,	loop_1149
	fmovdgu	%xcc,	%f11,	%f29
	movrlz	%i1,	%o4,	%l5
	tvc	%xcc,	0x2
loop_1149:
	movcc	%xcc,	%i4,	%l3
	movrne	%g6,	%o0,	%i0
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f6
	fxtod	%f6,	%f26
	xor	%i7,	0x1605,	%i5
	tneg	%xcc,	0x2
	fmovrsgez	%o1,	%f28,	%f3
	tcc	%xcc,	0x6
	xor	%o2,	%l6,	%g2
	popc	%l0,	%i6
	fmovsvs	%icc,	%f20,	%f15
	or	%g5,	0x1A46,	%g4
	fbge	%fcc1,	loop_1150
	addccc	%o5,	0x00A8,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x6
loop_1150:
	tgu	%xcc,	0x5
	ldsh	[%l7 + 0x36],	%g7
	nop
	set	0x4C, %o5
	ldsh	[%l7 + %o5],	%o7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l2,	%o3
	sdivcc	%l4,	0x1A3A,	%o6
	edge32ln	%l1,	%i3,	%g1
	set	0x5F, %i7
	ldsba	[%l7 + %i7] 0x80,	%i2
	add	%o4,	%l5,	%i4
	set	0x60, %l1
	prefetcha	[%l7 + %l1] 0x15,	 0x0
	tcc	%xcc,	0x6
	sth	%l3,	[%l7 + 0x38]
	fmovsg	%icc,	%f18,	%f0
	add	%o0,	0x1B98,	%i0
	bvs,a	loop_1151
	bcc,a	%xcc,	loop_1152
	sllx	%i7,	0x0F,	%g6
	tge	%xcc,	0x4
loop_1151:
	udiv	%o1,	0x1989,	%o2
loop_1152:
	ta	%icc,	0x7
	srl	%l6,	%i5,	%g2
	smul	%i6,	0x00C0,	%g5
	movrgz	%l0,	%g4,	%o5
	fabsd	%f8,	%f22
	subccc	%g3,	0x02B1,	%o7
	movleu	%xcc,	%g7,	%o3
	sra	%l4,	%o6,	%l2
	array8	%l1,	%i3,	%i2
	xorcc	%o4,	0x0B6F,	%l5
	xorcc	%g1,	%i1,	%i4
	mulscc	%l3,	%o0,	%i0
	srlx	%g6,	0x14,	%i7
	xnorcc	%o2,	0x1308,	%o1
	sth	%i5,	[%l7 + 0x74]
	fxors	%f16,	%f18,	%f3
	fand	%f24,	%f0,	%f26
	nop
	setx	0xF053AE06,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	movleu	%xcc,	%g2,	%l6
	movn	%icc,	%g5,	%i6
	set	0x16, %i3
	lduba	[%l7 + %i3] 0x89,	%l0
	nop
	setx	0xDC644BF389B631D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4E3E3F498CCC1CC2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f24,	%f24
	brlz,a	%o5,	loop_1153
	srax	%g4,	0x1D,	%o7
	subc	%g7,	%o3,	%l4
	bleu,a	%xcc,	loop_1154
loop_1153:
	movn	%icc,	%g3,	%l2
	subc	%o6,	0x11ED,	%l1
	smul	%i3,	%i2,	%l5
loop_1154:
	fandnot2	%f14,	%f10,	%f6
	tl	%xcc,	0x4
	ldd	[%l7 + 0x08],	%f8
	edge16l	%g1,	%o4,	%i1
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x38] %asi
	addc	%i4,	%l3,	%i0
	srl	%g6,	%o0,	%i7
	fmovsle	%xcc,	%f17,	%f26
	brgz,a	%o1,	loop_1155
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i5,	%o2,	%g2
	movl	%icc,	%l6,	%i6
loop_1155:
	array32	%g5,	%o5,	%l0
	movre	%o7,	0x0E0,	%g7
	movcc	%xcc,	%o3,	%l4
	nop
	setx	0x4078ED6B,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	fnot1	%f4,	%f16
	tsubcctv	%g4,	0x1D9A,	%l2
	tne	%xcc,	0x0
	andcc	%o6,	%g3,	%l1
	ldsb	[%l7 + 0x0A],	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i2,	0x0D21,	%g1
	fcmple16	%f16,	%f4,	%o4
	array8	%l5,	%i4,	%l3
	sdiv	%i0,	0x15FD,	%i1
	mulscc	%g6,	0x071E,	%i7
	tsubcctv	%o0,	0x10B5,	%i5
	movvc	%xcc,	%o1,	%g2
	or	%o2,	0x1FC7,	%l6
	flush	%l7 + 0x50
	edge8ln	%i6,	%g5,	%l0
	tsubcctv	%o7,	%o5,	%g7
	subcc	%o3,	%l4,	%l2
	fbge,a	%fcc2,	loop_1156
	fnor	%f14,	%f30,	%f6
	stbar
	tsubcc	%g4,	0x0E3B,	%o6
loop_1156:
	fmovsle	%icc,	%f28,	%f20
	andncc	%g3,	%i3,	%i2
	tleu	%icc,	0x4
	movrlz	%l1,	0x3E7,	%o4
	subc	%g1,	0x062C,	%l5
	movgu	%xcc,	%l3,	%i4
	move	%icc,	%i1,	%i0
	ldd	[%l7 + 0x30],	%f2
	movleu	%icc,	%g6,	%i7
	fornot1	%f18,	%f12,	%f26
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] %asi,	%i5,	%o1
	andcc	%o0,	0x1BF2,	%o2
	tge	%icc,	0x5
	fsrc2	%f28,	%f16
	edge32n	%l6,	%g2,	%i6
	fbn	%fcc2,	loop_1157
	fmovrslz	%l0,	%f10,	%f2
	edge32n	%g5,	%o7,	%g7
	xnor	%o3,	0x1544,	%o5
loop_1157:
	movge	%icc,	%l2,	%g4
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%o6
	sll	%g3,	0x06,	%i3
	srlx	%l1,	%i2,	%o4
	set	0x18, %o3
	ldsha	[%l7 + %o3] 0x14,	%l5
	pdist	%f28,	%f28,	%f14
	fandnot1	%f16,	%f20,	%f30
	xor	%g1,	%i4,	%l3
	bl	%xcc,	loop_1158
	sub	%i0,	%g6,	%i7
	xnor	%i1,	%i5,	%o0
	fzeros	%f4
loop_1158:
	nop
	setx	0x1EB5A793A075A81B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	nop
	setx	0xBF2CB5CA6E8B8F65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x628BD170973B01C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f16,	%f6
	nop
	fitos	%f1,	%f25
	fstox	%f25,	%f6
	fxtos	%f6,	%f4
	bgu	%icc,	loop_1159
	fands	%f15,	%f4,	%f29
	taddcctv	%o1,	0x03AC,	%o2
	fnegs	%f0,	%f31
loop_1159:
	subcc	%l6,	0x0EB5,	%i6
	srl	%g2,	%l0,	%g5
	tge	%xcc,	0x2
	edge32n	%o7,	%o3,	%g7
	nop
	setx	0xDC0474C21CF37F54,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x00F33BE5BFCEE5E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f0,	%f8
	umulcc	%o5,	%g4,	%l2
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x20] %asi,	%l4
	movge	%icc,	%g3,	%i3
	mulscc	%o6,	%i2,	%l1
	tneg	%xcc,	0x5
	fba	%fcc1,	loop_1160
	fcmpne32	%f6,	%f6,	%o4
	ta	%icc,	0x2
	bvc,a,pn	%xcc,	loop_1161
loop_1160:
	nop
	setx	0x1C761B7B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xB4C965BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f6,	%f16
	edge16n	%g1,	%l5,	%i4
	ld	[%l7 + 0x40],	%f22
loop_1161:
	nop
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x1f,	%f0
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x33] %asi,	%i0
	movrgz	%g6,	%l3,	%i7
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	popc	%i1,	%o0
	popc	0x1ADE,	%i5
	fbn	%fcc2,	loop_1162
	movrgz	%o1,	0x290,	%l6
	xorcc	%o2,	%g2,	%i6
	tsubcc	%l0,	%g5,	%o7
loop_1162:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%o5
	nop
	set	0x20, %g7
	std	%f18,	[%l7 + %g7]
	nop
	fitod	%f4,	%f24
	fdtos	%f24,	%f18
	umulcc	%g7,	0x087D,	%g4
	brz,a	%l2,	loop_1163
	tsubcc	%l4,	0x0E5B,	%g3
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x59] %asi,	%i3
loop_1163:
	or	%i2,	0x14A5,	%o6
	sdiv	%o4,	0x144B,	%g1
	tleu	%icc,	0x1
	ldx	[%l7 + 0x38],	%l5
	ldsb	[%l7 + 0x6C],	%l1
	flush	%l7 + 0x24
	fbl,a	%fcc2,	loop_1164
	movvs	%xcc,	%i4,	%i0
	smulcc	%l3,	%g6,	%i7
	movge	%icc,	%o0,	%i5
loop_1164:
	mova	%xcc,	%i1,	%l6
	wr	%g0,	0x81,	%asi
	stba	%o2,	[%l7 + 0x2A] %asi
	tsubcctv	%o1,	0x1761,	%i6
	fornot1s	%f11,	%f9,	%f23
	alignaddrl	%g2,	%g5,	%l0
	fnor	%f28,	%f22,	%f30
	tpos	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x70] %asi,	%o7
	te	%icc,	0x4
	alignaddrl	%o3,	%o5,	%g7
	bcs	loop_1165
	edge8ln	%g4,	%l4,	%l2
	umul	%g3,	0x0EB2,	%i2
	srax	%o6,	0x00,	%o4
loop_1165:
	subcc	%i3,	%l5,	%l1
	fmovse	%xcc,	%f27,	%f16
	fcmpne32	%f30,	%f6,	%g1
	sdiv	%i0,	0x0CB0,	%l3
	srax	%g6,	%i4,	%o0
	set	0x4C, %i1
	sta	%f17,	[%l7 + %i1] 0x18
	fpack32	%f24,	%f22,	%f30
	bvc,a,pt	%icc,	loop_1166
	fsrc1	%f8,	%f28
	bl,a,pt	%icc,	loop_1167
	tvc	%xcc,	0x2
loop_1166:
	xorcc	%i5,	0x094C,	%i1
	bshuffle	%f10,	%f20,	%f8
loop_1167:
	fnand	%f8,	%f26,	%f2
	sll	%i7,	%l6,	%o2
	set	0x28, %i4
	ldxa	[%g0 + %i4] 0x20,	%i6
	fmovdne	%xcc,	%f8,	%f27
	mulscc	%o1,	0x090A,	%g2
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l0
	sll	%o7,	0x18,	%o3
	be	loop_1168
	brgz	%g5,	loop_1169
	fmovsge	%icc,	%f1,	%f19
	fabss	%f27,	%f24
loop_1168:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1169:
	fmovsge	%xcc,	%f10,	%f22
	nop
	setx	0x55C26322D07E21E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g7,	%o5
	orn	%g4,	0x12D2,	%l2
	movvc	%icc,	%g3,	%l4
	sth	%i2,	[%l7 + 0x10]
	fbu	%fcc0,	loop_1170
	movrlez	%o4,	%o6,	%l5
	fnot2	%f10,	%f28
	sdiv	%i3,	0x12F4,	%g1
loop_1170:
	nop
	setx	0x339CA2FEC48FE6F0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x945C972EEC59555B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f12,	%f30
	edge32ln	%i0,	%l3,	%g6
	fmovsleu	%icc,	%f13,	%f11
	movle	%icc,	%i4,	%o0
	xor	%i5,	%i1,	%i7
	tvs	%icc,	0x7
	andn	%l1,	%l6,	%i6
	andn	%o1,	0x14A4,	%g2
	sllx	%l0,	0x15,	%o7
	edge32ln	%o2,	%g5,	%g7
	orcc	%o5,	0x179A,	%o3
	brnz,a	%l2,	loop_1171
	fornot2s	%f8,	%f21,	%f15
	sdiv	%g3,	0x0E1B,	%g4
	alignaddr	%i2,	%l4,	%o4
loop_1171:
	fpsub16s	%f27,	%f10,	%f8
	ldstub	[%l7 + 0x0E],	%o6
	te	%icc,	0x1
	nop
	fitod	%f6,	%f8
	fdtos	%f8,	%f30
	tn	%xcc,	0x1
	fcmpgt32	%f12,	%f26,	%l5
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	edge32	%g1,	%i0,	%g6
	orcc	%l3,	0x11B3,	%i4
	edge8	%i5,	%o0,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i7,	%l6,	%l1
	edge8ln	%i6,	%g2,	%o1
	bn,pt	%xcc,	loop_1172
	fpack16	%f8,	%f13
	fcmpne16	%f24,	%f18,	%o7
	add	%o2,	0x13B8,	%l0
loop_1172:
	subccc	%g5,	%o5,	%o3
	prefetch	[%l7 + 0x1C],	 0x0
	nop
	setx	loop_1173,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x5
	lduh	[%l7 + 0x28],	%g7
	addccc	%l2,	0x1F85,	%g4
loop_1173:
	movneg	%icc,	%i2,	%g3
	nop
	setx	0x85329C1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x2627B231,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f15,	%f4
	fnot1s	%f4,	%f14
	nop
	setx	0x9052A14A,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	array32	%l4,	%o4,	%o6
	srax	%i3,	0x18,	%g1
	fcmpgt16	%f26,	%f18,	%i0
	andncc	%l5,	%g6,	%l3
	addccc	%i5,	0x0E1B,	%o0
	orn	%i4,	%i7,	%l6
	fbge	%fcc0,	loop_1174
	sdiv	%l1,	0x1C2D,	%i1
	std	%f16,	[%l7 + 0x60]
	movcs	%xcc,	%i6,	%o1
loop_1174:
	movrlez	%g2,	%o2,	%o7
	set	0x6C, %l3
	sta	%f22,	[%l7 + %l3] 0x15
	mulx	%g5,	0x0193,	%l0
	fmovdn	%icc,	%f22,	%f4
	tle	%icc,	0x0
	tn	%icc,	0x5
	bleu	loop_1175
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x5
	fbue	%fcc2,	loop_1176
loop_1175:
	brgz	%o5,	loop_1177
	fbu,a	%fcc1,	loop_1178
	fmovsa	%xcc,	%f19,	%f14
loop_1176:
	xorcc	%o3,	0x103B,	%g7
loop_1177:
	edge16l	%g4,	%i2,	%l2
loop_1178:
	edge32l	%l4,	%o4,	%o6
	sllx	%i3,	0x1A,	%g3
	nop
	fitod	%f18,	%f12
	nop
	set	0x38, %l0
	prefetch	[%l7 + %l0],	 0x2
	tle	%xcc,	0x6
	move	%icc,	%i0,	%l5
	tpos	%xcc,	0x5
	movg	%xcc,	%g6,	%l3
	movpos	%icc,	%i5,	%o0
	taddcctv	%g1,	0x01B5,	%i7
	and	%i4,	0x1576,	%l6
	srax	%l1,	0x0C,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i6,	%g2
	sdivcc	%o2,	0x1662,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x3
	addccc	%o7,	%g5,	%o5
	orcc	%o3,	%g7,	%l0
	fbu,a	%fcc1,	loop_1179
	fmovsvc	%xcc,	%f23,	%f25
	srlx	%i2,	%g4,	%l2
	tle	%xcc,	0x2
loop_1179:
	fblg	%fcc0,	loop_1180
	movle	%xcc,	%l4,	%o6
	nop
	setx	0x1F10A9C7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x71384594,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f28,	%f16
	movcs	%xcc,	%o4,	%i3
loop_1180:
	tg	%icc,	0x2
	fmovsneg	%icc,	%f16,	%f0
	wr	%g0,	0x80,	%asi
	stwa	%g3,	[%l7 + 0x50] %asi
	sethi	0x13E8,	%i0
	addccc	%g6,	%l5,	%l3
	sub	%o0,	0x1582,	%i5
	fmovrdne	%i7,	%f28,	%f2
	movn	%xcc,	%g1,	%i4
	fmovrslez	%l1,	%f14,	%f28
	movn	%icc,	%i1,	%i6
	edge16ln	%g2,	%l6,	%o2
	nop
	setx	0xA74CA16B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x9D1FC3BE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f15,	%f12
	ta	%xcc,	0x2
	udivcc	%o1,	0x10D3,	%o7
	edge8	%o5,	%o3,	%g5
	tleu	%xcc,	0x4
	andcc	%l0,	0x1850,	%i2
	fcmple16	%f24,	%f4,	%g4
	tle	%icc,	0x3
	tsubcctv	%g7,	0x07AE,	%l4
	taddcc	%l2,	%o6,	%i3
	umul	%o4,	0x0CA5,	%i0
	set	0x70, %o2
	lduwa	[%l7 + %o2] 0x88,	%g6
	tle	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	sth	%l5,	[%l7 + 0x0C]
	bg,a,pt	%xcc,	loop_1181
	fpadd32	%f10,	%f22,	%f30
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x76] %asi,	%l3
loop_1181:
	movpos	%icc,	%o0,	%g3
	fcmpeq16	%f30,	%f6,	%i5
	mulscc	%g1,	0x1D55,	%i4
	xnor	%l1,	%i7,	%i1
	bneg	loop_1182
	fpsub16	%f6,	%f16,	%f30
	fmovdneg	%xcc,	%f25,	%f2
	set	0x75, %g6
	ldsba	[%l7 + %g6] 0x81,	%i6
loop_1182:
	nop
	setx	0x8F3FB1E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x8AD6417C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f22,	%f30
	tgu	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g2,	%o2,	%o1
	subc	%l6,	%o7,	%o5
	edge32n	%g5,	%l0,	%o3
	tcs	%icc,	0x6
	edge32l	%i2,	%g4,	%l4
	tg	%xcc,	0x2
	nop
	setx	0xEB5FC8AFC0638C72,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fxors	%f4,	%f4,	%f29
	tl	%xcc,	0x7
	edge8ln	%g7,	%o6,	%i3
	tsubcc	%o4,	0x09F1,	%l2
	tvc	%xcc,	0x5
	bl,a	%icc,	loop_1183
	edge16	%g6,	%i0,	%l5
	movl	%icc,	%o0,	%l3
	movcc	%xcc,	%g3,	%i5
loop_1183:
	fbo	%fcc1,	loop_1184
	movl	%icc,	%i4,	%l1
	edge32n	%g1,	%i7,	%i6
	edge32l	%g2,	%i1,	%o2
loop_1184:
	sra	%o1,	%l6,	%o5
	fmovsge	%xcc,	%f10,	%f12
	array16	%o7,	%g5,	%o3
	movleu	%icc,	%i2,	%l0
	fbl	%fcc2,	loop_1185
	taddcc	%l4,	%g4,	%g7
	xnorcc	%i3,	0x186C,	%o4
	bvs,a	loop_1186
loop_1185:
	lduw	[%l7 + 0x10],	%o6
	nop
	setx	0x25E86C85,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x863210AC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f15,	%f29
	nop
	setx	0x24909C67,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f8
loop_1186:
	udiv	%g6,	0x1889,	%l2
	edge8l	%i0,	%o0,	%l5
	sdiv	%g3,	0x1B33,	%l3
	xnor	%i4,	0x1D6D,	%l1
	alignaddr	%g1,	%i7,	%i5
	fbn	%fcc1,	loop_1187
	alignaddr	%i6,	%i1,	%o2
	mulx	%g2,	%o1,	%o5
	tvs	%xcc,	0x6
loop_1187:
	tleu	%xcc,	0x6
	mulx	%l6,	%g5,	%o3
	fmovd	%f0,	%f0
	sdiv	%o7,	0x0F29,	%l0
	movle	%icc,	%i2,	%l4
	movge	%icc,	%g4,	%g7
	fbule,a	%fcc3,	loop_1188
	alignaddr	%o4,	%i3,	%g6
	taddcc	%l2,	0x0CCF,	%o6
	edge16l	%o0,	%i0,	%g3
loop_1188:
	fbne	%fcc0,	loop_1189
	tle	%icc,	0x2
	movrgz	%l5,	%i4,	%l3
	ba,pn	%icc,	loop_1190
loop_1189:
	movcc	%xcc,	%l1,	%g1
	ldsw	[%l7 + 0x3C],	%i5
	taddcctv	%i6,	%i7,	%i1
loop_1190:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
	nop
	setx	0xE0423970,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	movrne	%o1,	0x214,	%o2
	fxnor	%f6,	%f24,	%f16
	movcc	%xcc,	%o5,	%l6
	tsubcc	%o3,	0x1E78,	%g5
	brgz,a	%l0,	loop_1191
	tle	%icc,	0x6
	addcc	%i2,	%o7,	%l4
	andn	%g4,	0x1361,	%o4
loop_1191:
	fnor	%f8,	%f24,	%f28
	andcc	%g7,	%g6,	%i3
	fxor	%f26,	%f28,	%f6
	add	%o6,	0x0673,	%l2
	bpos,a	loop_1192
	sethi	0x0635,	%i0
	be,pn	%icc,	loop_1193
	movcs	%icc,	%g3,	%l5
loop_1192:
	nop
	fitod	%f4,	%f16
	fdtoi	%f16,	%f13
	fandnot2s	%f3,	%f26,	%f13
loop_1193:
	udiv	%o0,	0x1D94,	%i4
	fblg,a	%fcc2,	loop_1194
	fones	%f19
	nop
	setx loop_1195, %l0, %l1
	jmpl %l1, %l3
	array32	%g1,	%i5,	%l1
loop_1194:
	te	%xcc,	0x1
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%i6
loop_1195:
	ldx	[%l7 + 0x68],	%i1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%g2
	bcc,pn	%icc,	loop_1196
	sdivx	%o2,	0x003B,	%o1
	srax	%l6,	0x1A,	%o5
	movcc	%xcc,	%g5,	%l0
loop_1196:
	sra	%o3,	%o7,	%i2
	mulx	%l4,	0x041B,	%g4
	subccc	%o4,	0x16D4,	%g7
	movre	%i3,	%g6,	%o6
	fmovdneg	%icc,	%f26,	%f1
	ld	[%l7 + 0x18],	%f28
	ta	%icc,	0x7
	edge16	%i0,	%g3,	%l2
	fmovrdlz	%o0,	%f30,	%f0
	membar	0x65
	sdiv	%i4,	0x0BFF,	%l3
	addccc	%l5,	0x0292,	%i5
	addccc	%g1,	0x0C26,	%i6
	fnands	%f0,	%f25,	%f9
	movn	%icc,	%l1,	%i1
	st	%f5,	[%l7 + 0x64]
	srl	%i7,	%o2,	%g2
	nop
	setx	loop_1197,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%l6,	%o1,	%o5
	tleu	%xcc,	0x5
	fmovdpos	%icc,	%f23,	%f12
loop_1197:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l0,	%g5,	%o3
	move	%xcc,	%i2,	%l4
	popc	%g4,	%o7
	smul	%g7,	%i3,	%o4
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x30] %asi,	%g6
	edge16l	%i0,	%g3,	%o6
	brnz,a	%l2,	loop_1198
	fexpand	%f19,	%f6
	sdiv	%o0,	0x10AA,	%l3
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x7E] %asi,	%i4
loop_1198:
	sub	%i5,	0x1695,	%l5
	movg	%xcc,	%i6,	%g1
	edge32l	%i1,	%i7,	%o2
	movvs	%xcc,	%g2,	%l1
	movne	%icc,	%l6,	%o5
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf0,	%f16
	tl	%xcc,	0x3
	sll	%l0,	0x0E,	%g5
	wr	%g0,	0x04,	%asi
	stba	%o3,	[%l7 + 0x20] %asi
	movle	%icc,	%i2,	%l4
	xor	%g4,	0x189F,	%o1
	addcc	%o7,	0x0835,	%i3
	edge32	%g7,	%g6,	%o4
	edge8n	%i0,	%g3,	%l2
	tvs	%icc,	0x5
	fmul8x16al	%f20,	%f11,	%f10
	brgz,a	%o6,	loop_1199
	fmovsg	%xcc,	%f30,	%f7
	nop
	setx	loop_1200,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movgu	%icc,	%o0,	%l3
loop_1199:
	ldd	[%l7 + 0x50],	%f8
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f2
	fxtod	%f2,	%f10
loop_1200:
	subccc	%i5,	0x09B8,	%i4
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x22] %asi,	%l5
	nop
	fitod	%f1,	%f26
	edge8	%g1,	%i1,	%i7
	movle	%xcc,	%i6,	%g2
	edge32n	%l1,	%o2,	%o5
	fmovspos	%icc,	%f29,	%f19
	movle	%xcc,	%l6,	%l0
	edge16l	%o3,	%i2,	%g5
	fxors	%f8,	%f0,	%f26
	srl	%l4,	0x18,	%o1
	fcmpgt16	%f4,	%f16,	%g4
	movrlz	%o7,	%i3,	%g6
	movrgz	%g7,	0x199,	%o4
	ldsb	[%l7 + 0x6B],	%g3
	tcc	%icc,	0x5
	edge16ln	%i0,	%o6,	%o0
	tgu	%xcc,	0x5
	edge16l	%l3,	%i5,	%i4
	and	%l5,	%g1,	%i1
	tcc	%icc,	0x1
	edge8ln	%i7,	%l2,	%g2
	edge16ln	%l1,	%i6,	%o2
	tn	%xcc,	0x2
	orcc	%o5,	0x0130,	%l0
	nop
	set	0x63, %o7
	ldsb	[%l7 + %o7],	%l6
	popc	%i2,	%o3
	sth	%l4,	[%l7 + 0x58]
	alignaddrl	%o1,	%g5,	%o7
	sethi	0x12C1,	%g4
	fmovrdgez	%i3,	%f22,	%f26
	addccc	%g6,	%o4,	%g3
	movle	%xcc,	%g7,	%o6
	sllx	%o0,	%i0,	%l3
	fsrc2	%f16,	%f14
	fmovde	%icc,	%f21,	%f22
	udivx	%i5,	0x113C,	%i4
	brlz	%g1,	loop_1201
	addccc	%i1,	0x0ED8,	%i7
	mulscc	%l2,	%l5,	%l1
	tgu	%icc,	0x3
loop_1201:
	fbug	%fcc2,	loop_1202
	fandnot1	%f20,	%f8,	%f20
	edge8	%g2,	%i6,	%o5
	tcs	%icc,	0x0
loop_1202:
	movgu	%icc,	%o2,	%l0
	movvc	%icc,	%l6,	%o3
	udiv	%i2,	0x12D7,	%o1
	edge32ln	%g5,	%o7,	%l4
	set	0x30, %l2
	prefetcha	[%l7 + %l2] 0x0c,	 0x2
	xorcc	%g4,	%g6,	%o4
	fbuge,a	%fcc0,	loop_1203
	xor	%g7,	0x1A1E,	%o6
	tg	%xcc,	0x7
	movvs	%icc,	%o0,	%g3
loop_1203:
	fmul8sux16	%f28,	%f20,	%f12
	fzeros	%f26
	subc	%i0,	%l3,	%i4
	sllx	%g1,	0x08,	%i1
	nop
	setx	0x20754FDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	movrgz	%i5,	0x0DF,	%i7
	movpos	%icc,	%l5,	%l1
	fpadd32s	%f5,	%f9,	%f11
	srax	%g2,	0x18,	%i6
	swap	[%l7 + 0x28],	%o5
	fmovsn	%xcc,	%f10,	%f10
	tl	%icc,	0x0
	bshuffle	%f0,	%f18,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f26,	%f10,	%f24
	udivcc	%l2,	0x0E52,	%o2
	movrlz	%l0,	0x253,	%l6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%o3
	andcc	%i2,	%g5,	%o1
	tle	%xcc,	0x4
	sir	0x1B6C
	fexpand	%f18,	%f12
	stx	%l4,	[%l7 + 0x48]
	array8	%i3,	%g4,	%g6
	set	0x7C, %l5
	stwa	%o7,	[%l7 + %l5] 0x89
	nop
	setx	0x340D4B5D17680540,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xBD5E26C9D2D08049,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f16,	%f4
	fpadd16	%f26,	%f10,	%f28
	tn	%icc,	0x0
	movcs	%xcc,	%o4,	%o6
	set	0x0F, %g3
	ldsba	[%l7 + %g3] 0x14,	%g7
	edge32n	%o0,	%i0,	%g3
	fmovrslz	%i4,	%f30,	%f7
	movgu	%xcc,	%g1,	%i1
	fmovsleu	%icc,	%f31,	%f23
	tg	%icc,	0x7
	addcc	%i5,	%l3,	%i7
	set	0x14, %o4
	lduwa	[%l7 + %o4] 0x88,	%l1
	or	%g2,	0x1B56,	%l5
	fbul,a	%fcc0,	loop_1204
	movvc	%xcc,	%i6,	%l2
	brgez,a	%o5,	loop_1205
	fbue	%fcc3,	loop_1206
loop_1204:
	tne	%icc,	0x0
	sir	0x1B6A
loop_1205:
	fpack16	%f22,	%f25
loop_1206:
	and	%o2,	%l6,	%l0
	edge16ln	%o3,	%i2,	%g5
	fnegs	%f20,	%f13
	fbge,a	%fcc2,	loop_1207
	sll	%o1,	0x1A,	%i3
	edge8n	%g4,	%g6,	%o7
	tne	%xcc,	0x6
loop_1207:
	tg	%xcc,	0x4
	movge	%icc,	%l4,	%o6
	edge32ln	%g7,	%o0,	%o4
	prefetch	[%l7 + 0x7C],	 0x3
	movne	%xcc,	%i0,	%g3
	edge16ln	%g1,	%i4,	%i1
	array32	%i5,	%i7,	%l1
	andncc	%g2,	%l5,	%l3
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x60] %asi,	%l2
	fnot1	%f16,	%f20
	fmovdcs	%icc,	%f9,	%f22
	edge32l	%i6,	%o2,	%l6
	andncc	%o5,	%l0,	%o3
	movrgez	%g5,	%i2,	%i3
	srlx	%o1,	0x0A,	%g6
	movge	%xcc,	%g4,	%l4
	ta	%icc,	0x2
	movgu	%xcc,	%o7,	%g7
	array16	%o6,	%o0,	%i0
	fcmpeq32	%f0,	%f0,	%o4
	wr	%g0,	0x80,	%asi
	stxa	%g1,	[%l7 + 0x10] %asi
	fabsd	%f2,	%f24
	movgu	%icc,	%i4,	%i1
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f10
	fxtod	%f10,	%f28
	udiv	%i5,	0x1A0B,	%i7
	tcc	%xcc,	0x7
	set	0x5A, %i6
	stba	%g3,	[%l7 + %i6] 0x2a
	membar	#Sync
	sub	%l1,	0x1101,	%l5
	fbule,a	%fcc3,	loop_1208
	array32	%l3,	%g2,	%l2
	fexpand	%f10,	%f18
	fmovrslez	%o2,	%f5,	%f25
loop_1208:
	and	%l6,	%i6,	%l0
	faligndata	%f22,	%f20,	%f0
	tneg	%icc,	0x4
	bg,a	loop_1209
	stx	%o3,	[%l7 + 0x30]
	fmul8x16au	%f18,	%f17,	%f0
	srl	%o5,	0x0D,	%i2
loop_1209:
	array32	%i3,	%o1,	%g6
	umul	%g4,	0x0E94,	%g5
	flush	%l7 + 0x70
	fmovsge	%xcc,	%f27,	%f29
	nop
	setx	loop_1210,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%xcc,	0x3
	move	%xcc,	%l4,	%o7
	fmovdg	%icc,	%f20,	%f16
loop_1210:
	edge16n	%g7,	%o0,	%o6
	movg	%xcc,	%o4,	%i0
	fand	%f18,	%f12,	%f6
	bn,a,pt	%xcc,	loop_1211
	tcc	%icc,	0x0
	alignaddr	%i4,	%i1,	%i5
	bvs,a,pn	%xcc,	loop_1212
loop_1211:
	fnot1	%f0,	%f24
	addccc	%g1,	0x1160,	%g3
	flush	%l7 + 0x70
loop_1212:
	fcmple16	%f26,	%f20,	%l1
	fmovscs	%xcc,	%f15,	%f14
	tne	%xcc,	0x0
	fnot2	%f24,	%f16
	fcmple32	%f24,	%f2,	%i7
	movrgz	%l5,	%l3,	%g2
	movrgez	%o2,	0x201,	%l2
	srax	%i6,	0x16,	%l0
	addcc	%o3,	0x1D87,	%l6
	fmovdvs	%xcc,	%f14,	%f31
	stx	%o5,	[%l7 + 0x60]
	movn	%xcc,	%i3,	%o1
	nop
	setx	0x305AB650,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	fand	%f22,	%f24,	%f6
	edge16	%g6,	%g4,	%i2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l4
	te	%icc,	0x5
	ldsw	[%l7 + 0x28],	%o7
	fmovsn	%xcc,	%f6,	%f9
	fabsd	%f14,	%f20
	fbo	%fcc0,	loop_1213
	bneg,a	loop_1214
	fpmerge	%f4,	%f27,	%f2
	xnor	%g7,	0x1FD9,	%g5
loop_1213:
	ldsw	[%l7 + 0x64],	%o6
loop_1214:
	fmovde	%icc,	%f8,	%f5
	addccc	%o4,	0x09B6,	%o0
	for	%f2,	%f26,	%f12
	fbuge	%fcc0,	loop_1215
	movvs	%xcc,	%i4,	%i1
	brgz	%i0,	loop_1216
	tcc	%icc,	0x0
loop_1215:
	fnand	%f28,	%f30,	%f4
	fandnot2	%f28,	%f22,	%f22
loop_1216:
	addc	%i5,	%g3,	%l1
	movg	%xcc,	%i7,	%g1
	set	0x5B, %g2
	ldstuba	[%l7 + %g2] 0x04,	%l3
	orncc	%l5,	0x08C6,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l2,	0x080E,	%g2
	subcc	%i6,	%o3,	%l6
	edge8	%o5,	%l0,	%i3
	mulscc	%g6,	0x1F58,	%g4
	brnz,a	%o1,	loop_1217
	umul	%l4,	0x038A,	%i2
	edge32n	%o7,	%g7,	%g5
	tsubcc	%o6,	%o4,	%o0
loop_1217:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i1,	%i4
	array16	%i0,	%i5,	%l1
	and	%g3,	0x127E,	%i7
	fabss	%f16,	%f25
	fmovdleu	%icc,	%f0,	%f17
	fbe	%fcc2,	loop_1218
	andncc	%l3,	%l5,	%o2
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x1f
	membar	#Sync
loop_1218:
	edge16l	%g1,	%g2,	%l2
	fxors	%f20,	%f1,	%f11
	fpack32	%f12,	%f28,	%f12
	fzero	%f4
	fmovrse	%i6,	%f8,	%f1
	movl	%xcc,	%o3,	%o5
	xnorcc	%l6,	%l0,	%i3
	fmovdne	%icc,	%f16,	%f4
	movn	%xcc,	%g4,	%o1
	ldd	[%l7 + 0x78],	%f24
	edge32	%g6,	%l4,	%o7
	edge8n	%i2,	%g7,	%g5
	movn	%xcc,	%o6,	%o0
	mova	%icc,	%i1,	%i4
	udiv	%i0,	0x0A26,	%i5
	fmovdneg	%icc,	%f9,	%f11
	fors	%f23,	%f13,	%f13
	st	%f22,	[%l7 + 0x3C]
	fmul8ulx16	%f18,	%f2,	%f26
	taddcctv	%o4,	%l1,	%g3
	fbe	%fcc1,	loop_1219
	brz	%i7,	loop_1220
	fnot2s	%f28,	%f2
	movneg	%icc,	%l5,	%o2
loop_1219:
	bne,a	%icc,	loop_1221
loop_1220:
	ldstub	[%l7 + 0x08],	%l3
	xnor	%g1,	%g2,	%l2
	sdiv	%o3,	0x1CA6,	%o5
loop_1221:
	taddcc	%i6,	%l0,	%l6
	fmovdge	%icc,	%f19,	%f12
	bvs,a	%xcc,	loop_1222
	tneg	%xcc,	0x4
	tvc	%xcc,	0x7
	orncc	%i3,	0x0FD0,	%o1
loop_1222:
	movcc	%xcc,	%g6,	%g4
	lduh	[%l7 + 0x68],	%o7
	fbe	%fcc3,	loop_1223
	sdiv	%i2,	0x04DD,	%l4
	movge	%icc,	%g7,	%g5
	fmovrdgez	%o6,	%f6,	%f2
loop_1223:
	edge16	%i1,	%i4,	%i0
	edge32ln	%o0,	%i5,	%l1
	taddcc	%o4,	0x1BB0,	%g3
	fmovrsne	%i7,	%f21,	%f7
	movneg	%icc,	%l5,	%o2
	tcc	%icc,	0x0
	array16	%l3,	%g2,	%g1
	movvs	%xcc,	%l2,	%o5
	sdivcc	%o3,	0x1FD7,	%l0
	te	%icc,	0x1
	fmul8x16	%f27,	%f28,	%f10
	orcc	%l6,	0x1733,	%i3
	brgz	%i6,	loop_1224
	tvs	%xcc,	0x6
	edge16	%o1,	%g4,	%o7
	andn	%i2,	0x1CC4,	%l4
loop_1224:
	mova	%xcc,	%g6,	%g7
	orn	%g5,	0x0A9D,	%i1
	fcmple32	%f26,	%f12,	%i4
	alignaddr	%o6,	%i0,	%i5
	orcc	%o0,	%o4,	%g3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x0c,	%i7,	%l5
	move	%icc,	%o2,	%l3
	movn	%xcc,	%g2,	%g1
	te	%icc,	0x2
	sra	%l1,	0x17,	%l2
	mulscc	%o3,	%o5,	%l6
	fmovrdlz	%i3,	%f26,	%f20
	movvs	%xcc,	%i6,	%o1
	fbu,a	%fcc2,	loop_1225
	nop
	setx	0xF8BF6DF36C8644B7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xFE9FF8EFDB3CBC66,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f18,	%f2
	sethi	0x1B45,	%l0
	bgu,a	%xcc,	loop_1226
loop_1225:
	lduw	[%l7 + 0x18],	%o7
	fxnor	%f22,	%f18,	%f20
	edge32l	%g4,	%l4,	%g6
loop_1226:
	fnot1s	%f21,	%f12
	ldsh	[%l7 + 0x10],	%g7
	movle	%icc,	%g5,	%i2
	movleu	%xcc,	%i1,	%o6
	popc	%i0,	%i4
	movvs	%icc,	%i5,	%o4
	bleu,pt	%xcc,	loop_1227
	tvs	%icc,	0x5
	fcmpgt16	%f6,	%f30,	%o0
	nop
	setx	0x29C2DE36605C5043,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_1227:
	fexpand	%f25,	%f4
	fpsub16	%f28,	%f16,	%f18
	srax	%g3,	0x08,	%l5
	fbo,a	%fcc3,	loop_1228
	sllx	%o2,	0x00,	%i7
	udiv	%g2,	0x17AB,	%l3
	nop
	fitod	%f0,	%f12
	fdtoi	%f12,	%f29
loop_1228:
	alignaddrl	%l1,	%g1,	%l2
	ble	%icc,	loop_1229
	fmovrsgz	%o5,	%f23,	%f14
	fcmpne16	%f8,	%f28,	%l6
	edge16	%o3,	%i3,	%o1
loop_1229:
	brgez	%i6,	loop_1230
	movg	%xcc,	%o7,	%l0
	ldd	[%l7 + 0x20],	%f18
	ldub	[%l7 + 0x38],	%l4
loop_1230:
	nop
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrgz	%g4,	%g7,	%g6
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f0
	fmul8sux16	%f2,	%f24,	%f6
	edge32l	%g5,	%i1,	%i2
	tgu	%xcc,	0x5
	tgu	%icc,	0x6
	fmul8sux16	%f18,	%f28,	%f28
	movcc	%icc,	%i0,	%o6
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x19,	%f0
	fbge,a	%fcc0,	loop_1231
	array32	%i5,	%o4,	%i4
	fmovrsgez	%o0,	%f5,	%f29
	mulscc	%g3,	0x0C2A,	%o2
loop_1231:
	smul	%l5,	0x1BDC,	%i7
	sllx	%l3,	%g2,	%g1
	sdivcc	%l2,	0x1A39,	%o5
	ldd	[%l7 + 0x38],	%f14
	set	0x50, %i5
	swapa	[%l7 + %i5] 0x18,	%l1
	fmovsleu	%icc,	%f13,	%f6
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
	subc	%o3,	%i3,	%l6
	wr	%g0,	0xeb,	%asi
	stba	%i6,	[%l7 + 0x73] %asi
	membar	#Sync
	movpos	%icc,	%o7,	%l0
	fbne,a	%fcc2,	loop_1232
	movl	%icc,	%o1,	%l4
	tsubcc	%g4,	%g6,	%g5
	srax	%i1,	%g7,	%i0
loop_1232:
	subccc	%i2,	0x1B21,	%i5
	bvs	loop_1233
	movcc	%icc,	%o4,	%i4
	movl	%icc,	%o0,	%o6
	edge8	%g3,	%o2,	%i7
loop_1233:
	orcc	%l5,	0x0069,	%l3
	sir	0x1D00
	nop
	setx	0x8E2161BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f1
	taddcc	%g1,	%g2,	%o5
	smulcc	%l1,	0x1CB7,	%l2
	tneg	%icc,	0x2
	brlz,a	%o3,	loop_1234
	sll	%l6,	0x1F,	%i6
	movne	%xcc,	%i3,	%o7
	sll	%o1,	%l0,	%l4
loop_1234:
	umul	%g4,	0x0971,	%g5
	nop
	setx loop_1235, %l0, %l1
	jmpl %l1, %i1
	movleu	%xcc,	%g6,	%i0
	movl	%xcc,	%i2,	%g7
	fmovdge	%icc,	%f5,	%f9
loop_1235:
	fnands	%f9,	%f26,	%f22
	fmovdg	%icc,	%f4,	%f21
	set	0x20, %o1
	lda	[%l7 + %o1] 0x10,	%f0
	fbg,a	%fcc0,	loop_1236
	movl	%icc,	%o4,	%i5
	tleu	%xcc,	0x5
	fbul	%fcc2,	loop_1237
loop_1236:
	add	%i4,	%o0,	%o6
	edge8ln	%g3,	%o2,	%l5
	fmovdge	%icc,	%f22,	%f15
loop_1237:
	be,pt	%icc,	loop_1238
	tcc	%icc,	0x0
	alignaddrl	%i7,	%l3,	%g2
	movle	%icc,	%g1,	%o5
loop_1238:
	edge16	%l2,	%o3,	%l1
	smulcc	%l6,	%i3,	%i6
	fandnot1s	%f10,	%f21,	%f22
	fmovdg	%icc,	%f2,	%f20
	prefetch	[%l7 + 0x7C],	 0x0
	tsubcc	%o7,	%l0,	%o1
	array16	%g4,	%l4,	%i1
	set	0x5C, %i2
	sta	%f2,	[%l7 + %i2] 0x89
	tsubcctv	%g6,	%g5,	%i2
	srax	%i0,	0x11,	%g7
	fnot1	%f4,	%f22
	movge	%xcc,	%i5,	%o4
	tcs	%xcc,	0x1
	sllx	%o0,	0x11,	%o6
	orcc	%g3,	0x1981,	%i4
	edge32n	%o2,	%l5,	%i7
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
	fnors	%f22,	%f7,	%f21
	tcc	%icc,	0x7
	add	%g1,	0x1669,	%o5
	bcs	loop_1239
	fsrc2s	%f8,	%f25
	movg	%icc,	%g2,	%o3
	movl	%xcc,	%l2,	%l6
loop_1239:
	addcc	%i3,	%l1,	%i6
	alignaddrl	%o7,	%o1,	%g4
	tl	%icc,	0x4
	set	0x40, %o0
	stxa	%l0,	[%l7 + %o0] 0x2a
	membar	#Sync
	alignaddrl	%l4,	%g6,	%i1
	tleu	%xcc,	0x6
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g5
	nop
	setx	0x8DDA4CF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f23
	taddcctv	%i2,	%i0,	%i5
	tsubcc	%o4,	0x10AB,	%o0
	fandnot2	%f4,	%f18,	%f12
	brlz,a	%o6,	loop_1240
	bvs,a,pn	%xcc,	loop_1241
	brgez,a	%g3,	loop_1242
	tle	%xcc,	0x0
loop_1240:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%i4
loop_1241:
	xorcc	%o2,	%g7,	%l5
loop_1242:
	fpackfix	%f8,	%f21
	bcs,a,pn	%xcc,	loop_1243
	subccc	%l3,	0x132E,	%g1
	nop
	set	0x5C, %g4
	ldsh	[%l7 + %g4],	%o5
	tvc	%xcc,	0x3
loop_1243:
	andncc	%i7,	%o3,	%g2
	xnor	%l6,	0x1475,	%i3
	fbe	%fcc0,	loop_1244
	tg	%xcc,	0x4
	fbule,a	%fcc1,	loop_1245
	fmovs	%f31,	%f9
loop_1244:
	fands	%f27,	%f25,	%f0
	sir	0x0375
loop_1245:
	fsrc2	%f28,	%f8
	umulcc	%l2,	0x0528,	%l1
	addcc	%o7,	0x10DA,	%o1
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x18,	%g4
	fcmpgt32	%f26,	%f22,	%i6
	nop
	setx	0xE078151B,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	movrlz	%l0,	0x0B4,	%g6
	bg	%xcc,	loop_1246
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i1,	%l4,	%g5
	sdivx	%i2,	0x0849,	%i0
loop_1246:
	nop
	set	0x13, %g1
	ldstuba	[%l7 + %g1] 0x0c,	%o4
	tsubcctv	%i5,	%o6,	%g3
	fmovdleu	%xcc,	%f12,	%f8
	orncc	%o0,	%o2,	%i4
	fbu,a	%fcc1,	loop_1247
	subccc	%l5,	0x05AD,	%g7
	xor	%l3,	%g1,	%o5
	tpos	%icc,	0x3
loop_1247:
	array16	%i7,	%g2,	%o3
	orn	%i3,	0x06EB,	%l6
	tleu	%icc,	0x0
	taddcc	%l2,	%l1,	%o1
	tvc	%xcc,	0x2
	ta	%xcc,	0x6
	udivcc	%o7,	0x07B2,	%i6
	taddcc	%l0,	%g4,	%i1
	and	%g6,	0x16C0,	%l4
	set	0x57, %i7
	lduba	[%l7 + %i7] 0x11,	%g5
	and	%i0,	%o4,	%i2
	fmovrsgz	%i5,	%f19,	%f29
	bgu,a,pt	%icc,	loop_1248
	std	%f6,	[%l7 + 0x10]
	array8	%o6,	%g3,	%o0
	alignaddrl	%o2,	%l5,	%i4
loop_1248:
	movcs	%icc,	%l3,	%g1
	nop
	setx	0x3545A3EEB5DE275A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x8CD69A38B0485ABD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f12,	%f14
	andn	%o5,	%i7,	%g7
	andcc	%o3,	%i3,	%l6
	mulscc	%l2,	0x1BD2,	%g2
	add	%o1,	%o7,	%i6
	fmovrdne	%l0,	%f18,	%f18
	sra	%l1,	%g4,	%i1
	srl	%l4,	%g5,	%i0
	ta	%icc,	0x4
	and	%g6,	%i2,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o4,	%g3,	%o6
	orcc	%o2,	%l5,	%o0
	taddcc	%l3,	%g1,	%o5
	nop
	setx	0x66147C965AF4FD83,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xA4DB5110D6B19FD4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f24,	%f16
	fbuge,a	%fcc0,	loop_1249
	bneg,pt	%xcc,	loop_1250
	edge32ln	%i7,	%i4,	%o3
	sdiv	%i3,	0x0145,	%l6
loop_1249:
	edge16l	%g7,	%l2,	%g2
loop_1250:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o7,	0x1CEF,	%o1
	tvs	%icc,	0x1
	tge	%xcc,	0x1
	tne	%xcc,	0x7
	movgu	%icc,	%i6,	%l0
	movrne	%g4,	%l1,	%l4
	taddcc	%g5,	%i1,	%g6
	srax	%i0,	%i5,	%i2
	srax	%o4,	0x12,	%o6
	umul	%o2,	%l5,	%o0
	movvc	%icc,	%g3,	%g1
	fnot2s	%f19,	%f3
	array16	%l3,	%o5,	%i7
	edge8ln	%i4,	%o3,	%l6
	sdiv	%g7,	0x073F,	%i3
	sll	%g2,	%l2,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o1,	%l0
	fbue	%fcc1,	loop_1251
	fpsub16	%f28,	%f6,	%f18
	fmovrsgz	%i6,	%f31,	%f27
	fmovdcs	%xcc,	%f1,	%f11
loop_1251:
	sll	%l1,	0x18,	%g4
	wr	%g0,	0x04,	%asi
	sta	%f21,	[%l7 + 0x24] %asi
	movrlez	%g5,	%i1,	%g6
	movrgz	%i0,	%l4,	%i5
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x10] %asi,	%o4
	orcc	%o6,	0x11A4,	%i2
	fmuld8ulx16	%f30,	%f29,	%f8
	nop
	setx loop_1252, %l0, %l1
	jmpl %l1, %o2
	tsubcc	%o0,	0x0200,	%l5
	movvc	%xcc,	%g1,	%l3
	tl	%xcc,	0x7
loop_1252:
	sdivx	%o5,	0x088E,	%g3
	xnor	%i7,	%o3,	%i4
	andcc	%g7,	0x1DD9,	%l6
	andn	%i3,	%l2,	%o7
	umulcc	%g2,	%l0,	%o1
	pdist	%f28,	%f26,	%f2
	ldsb	[%l7 + 0x1C],	%l1
	nop
	fitod	%f10,	%f8
	fdtos	%f8,	%f20
	tvs	%xcc,	0x5
	fble,a	%fcc1,	loop_1253
	edge8ln	%g4,	%i6,	%g5
	fmovd	%f10,	%f8
	ta	%icc,	0x4
loop_1253:
	tcc	%icc,	0x5
	xnor	%i1,	0x1905,	%i0
	fands	%f9,	%f28,	%f3
	movg	%icc,	%l4,	%i5
	bpos	loop_1254
	xorcc	%o4,	0x1B45,	%o6
	fornot2	%f0,	%f14,	%f16
	movrgez	%g6,	0x135,	%o2
loop_1254:
	edge32	%o0,	%l5,	%g1
	fmovrdgz	%i2,	%f20,	%f16
	and	%o5,	0x17AD,	%l3
	movrlz	%i7,	0x0E5,	%g3
	movle	%xcc,	%i4,	%o3
	tsubcctv	%g7,	0x176A,	%i3
	array32	%l6,	%l2,	%o7
	orn	%g2,	0x1E30,	%l0
	andn	%l1,	0x01D5,	%o1
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	and	%i6,	0x12D9,	%g5
	sdivx	%g4,	0x0352,	%i1
	fmovsvs	%xcc,	%f11,	%f20
	tne	%icc,	0x3
	tneg	%xcc,	0x6
	movre	%l4,	0x11B,	%i0
	tleu	%icc,	0x4
	stb	%i5,	[%l7 + 0x4E]
	xnor	%o4,	%o6,	%o2
	orncc	%g6,	0x119D,	%o0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%l5
	tvc	%xcc,	0x3
	umulcc	%g1,	0x0F25,	%i2
	addc	%o5,	0x1525,	%l3
	fmovrslz	%g3,	%f9,	%f31
	srl	%i7,	0x1A,	%o3
	xnor	%i4,	%i3,	%g7
	stb	%l6,	[%l7 + 0x5A]
	movcs	%xcc,	%o7,	%g2
	fmovdn	%xcc,	%f19,	%f2
	sdivcc	%l0,	0x1A4F,	%l2
	move	%icc,	%l1,	%i6
	srlx	%g5,	%g4,	%o1
	faligndata	%f10,	%f30,	%f6
	movvc	%icc,	%l4,	%i1
	tleu	%xcc,	0x2
	fexpand	%f5,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i0,	0x02,	%i5
	movneg	%icc,	%o6,	%o2
	umulcc	%g6,	0x0F8F,	%o0
	srax	%o4,	%g1,	%i2
	bg	%xcc,	loop_1255
	ld	[%l7 + 0x30],	%f14
	movneg	%icc,	%o5,	%l5
	fors	%f15,	%f10,	%f3
loop_1255:
	nop
	set	0x68, %o5
	lda	[%l7 + %o5] 0x81,	%f14
	movcs	%icc,	%l3,	%i7
	fmovrsne	%o3,	%f24,	%f27
	tgu	%xcc,	0x5
	movge	%icc,	%i4,	%g3
	set	0x4C, %i3
	lda	[%l7 + %i3] 0x0c,	%f21
	tg	%xcc,	0x2
	tpos	%xcc,	0x2
	taddcc	%g7,	%i3,	%l6
	edge8	%o7,	%l0,	%g2
	nop
	setx	loop_1256,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%l1,	%i6,	%g5
	edge32l	%l2,	%o1,	%l4
	fpadd16s	%f29,	%f22,	%f29
loop_1256:
	fmovscs	%icc,	%f8,	%f27
	fbul	%fcc0,	loop_1257
	movgu	%icc,	%g4,	%i1
	tvc	%xcc,	0x6
	movpos	%icc,	%i5,	%i0
loop_1257:
	tpos	%icc,	0x6
	umul	%o6,	0x147A,	%g6
	fmovsle	%icc,	%f7,	%f23
	stbar
	stbar
	tcc	%icc,	0x7
	movre	%o2,	%o0,	%o4
	movge	%icc,	%i2,	%o5
	tl	%icc,	0x7
	fmul8x16au	%f20,	%f20,	%f28
	fbuge,a	%fcc2,	loop_1258
	udivx	%g1,	0x19F8,	%l3
	wr	%g0,	0x0c,	%asi
	stba	%i7,	[%l7 + 0x72] %asi
loop_1258:
	smul	%o3,	0x1DF4,	%l5
	tg	%icc,	0x3
	edge16ln	%i4,	%g3,	%i3
	tcs	%icc,	0x4
	fsrc1	%f4,	%f2
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x18] %asi,	%g7
	fornot2	%f24,	%f8,	%f4
	fsrc2	%f18,	%f4
	fcmpgt32	%f8,	%f6,	%l6
	te	%icc,	0x5
	fba,a	%fcc3,	loop_1259
	fbg	%fcc2,	loop_1260
	edge16l	%o7,	%l0,	%g2
	tg	%icc,	0x6
loop_1259:
	fnors	%f16,	%f1,	%f20
loop_1260:
	tpos	%xcc,	0x0
	ldub	[%l7 + 0x61],	%l1
	fba,a	%fcc1,	loop_1261
	tleu	%icc,	0x2
	st	%f16,	[%l7 + 0x38]
	fandnot2s	%f22,	%f18,	%f0
loop_1261:
	fmovsn	%xcc,	%f22,	%f6
	movgu	%xcc,	%g5,	%i6
	alignaddr	%o1,	%l2,	%l4
	swap	[%l7 + 0x78],	%i1
	movvc	%icc,	%i5,	%i0
	orn	%g4,	%g6,	%o2
	nop
	setx	0xC5728F25,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x4CE97D95,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f6,	%f3
	sir	0x194F
	flush	%l7 + 0x38
	fcmple32	%f8,	%f22,	%o6
	fbug,a	%fcc0,	loop_1262
	udiv	%o0,	0x15BF,	%o4
	set	0x24, %l1
	stha	%o5,	[%l7 + %l1] 0x11
loop_1262:
	fmovdneg	%xcc,	%f1,	%f7
	brlz	%i2,	loop_1263
	bvc,pn	%icc,	loop_1264
	ldx	[%l7 + 0x50],	%g1
	edge16	%i7,	%l3,	%o3
loop_1263:
	xnor	%i4,	0x1FDB,	%l5
loop_1264:
	nop
	setx	0x57EE075B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x40CADF66,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f18,	%f26
	fbo	%fcc3,	loop_1265
	fbue,a	%fcc1,	loop_1266
	movle	%icc,	%i3,	%g7
	brlez	%l6,	loop_1267
loop_1265:
	edge32	%g3,	%o7,	%g2
loop_1266:
	movleu	%icc,	%l1,	%l0
	movrlz	%g5,	0x149,	%i6
loop_1267:
	udivx	%l2,	0x0C21,	%l4
	mulscc	%o1,	0x0CB1,	%i1
	fmovrse	%i5,	%f13,	%f2
	tleu	%xcc,	0x0
	tge	%icc,	0x1
	srl	%i0,	%g4,	%g6
	orn	%o2,	%o6,	%o0
	umul	%o5,	%o4,	%g1
	sethi	0x01DC,	%i2
	addcc	%i7,	%o3,	%i4
	fnot1	%f20,	%f22
	andn	%l3,	%i3,	%g7
	tvc	%icc,	0x3
	addcc	%l5,	%g3,	%o7
	fones	%f24
	fmovsvs	%xcc,	%f7,	%f12
	srlx	%l6,	0x11,	%g2
	nop
	fitos	%f10,	%f14
	ldstub	[%l7 + 0x42],	%l0
	sub	%l1,	%i6,	%g5
	sllx	%l2,	%o1,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i5,	%i0,	%i1
	fblg	%fcc3,	loop_1268
	nop
	set	0x30, %o3
	sth	%g6,	[%l7 + %o3]
	tsubcctv	%o2,	0x197D,	%g4
	fcmpne32	%f0,	%f20,	%o6
loop_1268:
	mova	%icc,	%o0,	%o5
	movrgez	%g1,	%i2,	%o4
	fnegd	%f14,	%f12
	fmovsg	%xcc,	%f9,	%f14
	tvc	%icc,	0x3
	subcc	%o3,	%i4,	%i7
	addcc	%l3,	%i3,	%l5
	smulcc	%g3,	%g7,	%o7
	tsubcc	%g2,	%l0,	%l1
	srax	%i6,	0x13,	%l6
	fbg	%fcc2,	loop_1269
	and	%g5,	0x1D7B,	%o1
	fmovrdne	%l2,	%f2,	%f24
	bl,a	%icc,	loop_1270
loop_1269:
	bgu,a,pt	%icc,	loop_1271
	mulscc	%i5,	%i0,	%i1
	nop
	setx	0x154FC814,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xCAC39B1C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f28,	%f5
loop_1270:
	brgz	%l4,	loop_1272
loop_1271:
	movrlez	%g6,	0x2A9,	%o2
	smulcc	%g4,	%o6,	%o0
	fmovdl	%icc,	%f31,	%f13
loop_1272:
	tsubcctv	%o5,	%g1,	%o4
	sdiv	%i2,	0x01B7,	%o3
	sll	%i4,	0x07,	%l3
	movneg	%xcc,	%i7,	%l5
	tsubcctv	%g3,	0x1BD5,	%i3
	wr	%g0,	0x18,	%asi
	stha	%o7,	[%l7 + 0x08] %asi
	udiv	%g2,	0x1D7F,	%g7
	smulcc	%l0,	%i6,	%l1
	sub	%l6,	%g5,	%l2
	movvc	%icc,	%i5,	%o1
	movvc	%icc,	%i0,	%i1
	sdivcc	%g6,	0x1811,	%o2
	stb	%g4,	[%l7 + 0x3F]
	std	%f4,	[%l7 + 0x50]
	sll	%l4,	%o0,	%o6
	ble	loop_1273
	sra	%g1,	%o5,	%o4
	tg	%xcc,	0x5
	srax	%i2,	%i4,	%l3
loop_1273:
	sdivx	%i7,	0x0DDA,	%l5
	fcmpgt16	%f10,	%f0,	%g3
	sethi	0x126D,	%o3
	movvs	%icc,	%o7,	%i3
	ldsb	[%l7 + 0x63],	%g2
	fbo	%fcc0,	loop_1274
	fmovspos	%icc,	%f14,	%f6
	orn	%g7,	%i6,	%l0
	udivcc	%l6,	0x0D2B,	%g5
loop_1274:
	fbl,a	%fcc3,	loop_1275
	orcc	%l2,	0x1329,	%i5
	udivx	%o1,	0x0EE5,	%l1
	movrlz	%i1,	0x2E5,	%i0
loop_1275:
	fmovsa	%icc,	%f18,	%f26
	fcmpeq32	%f0,	%f22,	%g6
	fmovrdgez	%o2,	%f4,	%f20
	and	%g4,	0x187B,	%l4
	nop
	setx	loop_1276,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%o6,	%o0,	%g1
	movle	%icc,	%o5,	%o4
	ldsh	[%l7 + 0x0A],	%i4
loop_1276:
	fbe,a	%fcc1,	loop_1277
	udivcc	%l3,	0x03A9,	%i2
	andn	%i7,	%l5,	%o3
	mulscc	%o7,	%g3,	%g2
loop_1277:
	fmovsge	%icc,	%f20,	%f12
	array16	%i3,	%i6,	%g7
	movrlz	%l0,	0x297,	%l6
	sdivcc	%l2,	0x1CAA,	%g5
	brlz	%i5,	loop_1278
	fbue,a	%fcc3,	loop_1279
	srl	%o1,	0x04,	%l1
	bleu,pn	%xcc,	loop_1280
loop_1278:
	srax	%i0,	%i1,	%o2
loop_1279:
	subcc	%g4,	%l4,	%g6
	tgu	%icc,	0x2
loop_1280:
	edge8l	%o0,	%g1,	%o5
	edge32n	%o6,	%o4,	%i4
	tn	%icc,	0x4
	fbuge	%fcc1,	loop_1281
	tle	%xcc,	0x1
	tcc	%icc,	0x0
	array8	%i2,	%l3,	%l5
loop_1281:
	fcmpne16	%f30,	%f24,	%o3
	nop
	setx	0x4AD0D633B4BBC95D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x0BA6369A0E754782,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f0,	%f14
	addccc	%o7,	%g3,	%g2
	set	0x4C, %l6
	lduwa	[%l7 + %l6] 0x89,	%i7
	movrlz	%i3,	0x1CE,	%g7
	fbul	%fcc3,	loop_1282
	brgz,a	%l0,	loop_1283
	fbge	%fcc2,	loop_1284
	bge	%icc,	loop_1285
loop_1282:
	stx	%i6,	[%l7 + 0x70]
loop_1283:
	tle	%xcc,	0x2
loop_1284:
	andcc	%l2,	0x10A7,	%g5
loop_1285:
	taddcc	%i5,	%o1,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x68, %g7
	ldswa	[%l7 + %g7] 0x04,	%l6
	ldstub	[%l7 + 0x34],	%i1
	tsubcctv	%o2,	%i0,	%l4
	edge16ln	%g6,	%g4,	%o0
	udivx	%g1,	0x09CF,	%o6
	xorcc	%o4,	0x0BA3,	%i4
	sll	%o5,	%i2,	%l3
	fpackfix	%f0,	%f24
	andncc	%l5,	%o3,	%o7
	andn	%g3,	%i7,	%g2
	std	%f2,	[%l7 + 0x50]
	sth	%i3,	[%l7 + 0x78]
	movge	%xcc,	%l0,	%i6
	bge,a,pn	%xcc,	loop_1286
	fzero	%f22
	fbl,a	%fcc1,	loop_1287
	fmovrdlz	%g7,	%f10,	%f6
loop_1286:
	smul	%g5,	0x039C,	%i5
	mova	%icc,	%o1,	%l2
loop_1287:
	and	%l1,	0x18A6,	%i1
	ld	[%l7 + 0x78],	%f9
	sir	0x0CDA
	membar	0x23
	fbo	%fcc2,	loop_1288
	fbo,a	%fcc0,	loop_1289
	fbo	%fcc2,	loop_1290
	sdiv	%o2,	0x13B8,	%i0
loop_1288:
	fmovsl	%xcc,	%f19,	%f13
loop_1289:
	taddcctv	%l6,	%g6,	%g4
loop_1290:
	ba,pn	%icc,	loop_1291
	fbe	%fcc0,	loop_1292
	edge16	%l4,	%g1,	%o0
	fmovdgu	%xcc,	%f11,	%f10
loop_1291:
	subc	%o6,	0x076F,	%i4
loop_1292:
	movre	%o4,	%i2,	%l3
	tl	%xcc,	0x3
	add	%o5,	%o3,	%l5
	fmovrde	%g3,	%f28,	%f14
	tn	%xcc,	0x6
	tcs	%icc,	0x0
	fmovrse	%o7,	%f30,	%f31
	tvs	%xcc,	0x4
	be,a	%icc,	loop_1293
	xnor	%g2,	%i3,	%i7
	edge8ln	%l0,	%g7,	%g5
	bcc	loop_1294
loop_1293:
	sethi	0x0BCE,	%i6
	addc	%o1,	0x1E4A,	%l2
	mulscc	%i5,	0x0B0B,	%i1
loop_1294:
	fmovsvs	%xcc,	%f17,	%f26
	array16	%o2,	%l1,	%l6
	bpos,a	%icc,	loop_1295
	umulcc	%i0,	%g6,	%g4
	edge16	%l4,	%o0,	%g1
	addcc	%o6,	0x0F51,	%o4
loop_1295:
	orncc	%i2,	%i4,	%o5
	brnz	%o3,	loop_1296
	fmovrdlz	%l5,	%f26,	%f2
	alignaddrl	%g3,	%l3,	%g2
	fmovrdne	%i3,	%f20,	%f0
loop_1296:
	udiv	%i7,	0x1C88,	%l0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x24] %asi,	%f16
	edge32	%o7,	%g7,	%i6
	subc	%o1,	%g5,	%l2
	edge32	%i1,	%i5,	%o2
	sdiv	%l1,	0x0289,	%i0
	fornot1s	%f30,	%f7,	%f9
	ldx	[%l7 + 0x20],	%l6
	and	%g6,	%g4,	%o0
	fnegs	%f16,	%f4
	prefetch	[%l7 + 0x50],	 0x1
	fandnot2	%f26,	%f2,	%f10
	fblg,a	%fcc1,	loop_1297
	fmovrse	%g1,	%f2,	%f19
	fmovdle	%icc,	%f27,	%f26
	fmuld8sux16	%f18,	%f7,	%f0
loop_1297:
	xorcc	%o6,	0x14A7,	%o4
	srlx	%l4,	%i4,	%o5
	nop
	setx	0x647047D83A933D46,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x7049582D1E1FBB9B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f26,	%f28
	srl	%o3,	0x01,	%i2
	movrgez	%g3,	0x061,	%l5
	movcc	%xcc,	%l3,	%g2
	fmovrsgz	%i7,	%f26,	%f18
	movne	%icc,	%i3,	%o7
	movleu	%icc,	%g7,	%i6
	movrlez	%l0,	0x1DF,	%g5
	tvc	%icc,	0x7
	set	0x20, %i1
	ldxa	[%l7 + %i1] 0x15,	%l2
	movre	%i1,	0x28A,	%o1
	bne,a	%xcc,	loop_1298
	tle	%icc,	0x4
	movl	%icc,	%i5,	%l1
	andncc	%i0,	%o2,	%g6
loop_1298:
	sethi	0x09E1,	%l6
	nop
	setx	0xEE06F0C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x1CDCFF55,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f17,	%f10
	set	0x73, %i4
	ldstuba	[%l7 + %i4] 0x18,	%g4
	andcc	%o0,	0x1D34,	%o6
	subc	%g1,	0x1E31,	%l4
	stb	%o4,	[%l7 + 0x4E]
	fmovdvc	%icc,	%f5,	%f22
	fbne	%fcc1,	loop_1299
	fnot1s	%f14,	%f8
	ta	%xcc,	0x3
	nop
	setx	0x992484CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x09344746,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f7,	%f12
loop_1299:
	lduw	[%l7 + 0x5C],	%o5
	alignaddr	%i4,	%o3,	%i2
	edge32n	%l5,	%l3,	%g3
	prefetch	[%l7 + 0x20],	 0x1
	movcs	%icc,	%i7,	%i3
	set	0x20, %l3
	ldda	[%l7 + %l3] 0x2e,	%g2
	mova	%xcc,	%g7,	%o7
	edge8n	%i6,	%l0,	%l2
	xnorcc	%i1,	0x13FA,	%g5
	fmovsge	%xcc,	%f18,	%f31
	add	%o1,	0x1037,	%l1
	fpadd32s	%f23,	%f29,	%f25
	add	%l7,	0x28,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x19,	%i0,	%o2
	fornot1	%f4,	%f12,	%f14
	movleu	%icc,	%g6,	%i5
	call	loop_1300
	srax	%l6,	0x05,	%o0
	umul	%o6,	%g4,	%g1
	tvs	%icc,	0x3
loop_1300:
	tneg	%icc,	0x5
	tne	%xcc,	0x5
	nop
	setx	0xC36ADDA6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x25C899B1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f11,	%f27
	fornot1s	%f17,	%f23,	%f7
	movrlez	%o4,	%o5,	%l4
	fmovrdgez	%i4,	%f18,	%f28
	subccc	%i2,	0x187E,	%o3
	xnor	%l3,	0x159D,	%g3
	edge32l	%l5,	%i7,	%i3
	subc	%g2,	%g7,	%i6
	fxnor	%f16,	%f4,	%f8
	fmovsge	%xcc,	%f25,	%f9
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o7
	xnorcc	%l2,	%l0,	%g5
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f20
	move	%xcc,	%i1,	%l1
	edge16l	%o1,	%o2,	%i0
	fmovdn	%xcc,	%f29,	%f9
	fexpand	%f8,	%f28
	set	0x42, %o2
	stha	%i5,	[%l7 + %o2] 0x2a
	membar	#Sync
	fbl,a	%fcc1,	loop_1301
	tcc	%xcc,	0x0
	fbe	%fcc2,	loop_1302
	nop
	setx	loop_1303,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1301:
	fbn,a	%fcc1,	loop_1304
	fbuge	%fcc2,	loop_1305
loop_1302:
	edge8ln	%l6,	%o0,	%o6
loop_1303:
	fpadd32	%f20,	%f22,	%f12
loop_1304:
	stx	%g4,	[%l7 + 0x70]
loop_1305:
	sllx	%g6,	0x09,	%o4
	sll	%g1,	%l4,	%i4
	fexpand	%f20,	%f0
	tsubcctv	%i2,	0x0C6B,	%o3
	bn,a	loop_1306
	brgez,a	%l3,	loop_1307
	move	%xcc,	%g3,	%o5
	orcc	%l5,	0x1460,	%i7
loop_1306:
	mulx	%i3,	0x00B0,	%g2
loop_1307:
	fpmerge	%f20,	%f20,	%f22
	movneg	%xcc,	%g7,	%o7
	tcc	%icc,	0x6
	tne	%xcc,	0x3
	nop
	setx	loop_1308,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsh	[%l7 + 0x4C],	%i6
	tg	%icc,	0x3
	fmovscs	%icc,	%f23,	%f27
loop_1308:
	nop
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x19,	%f0
	orcc	%l2,	%l0,	%i1
	wr	%g0,	0x0c,	%asi
	sta	%f10,	[%l7 + 0x50] %asi
	move	%icc,	%g5,	%o1
	subccc	%o2,	%i0,	%i5
	lduw	[%l7 + 0x78],	%l1
	xnorcc	%o0,	0x1A43,	%o6
	fzeros	%f24
	for	%f20,	%f16,	%f6
	movle	%icc,	%g4,	%g6
	edge16ln	%o4,	%g1,	%l4
	faligndata	%f10,	%f6,	%f14
	sdiv	%i4,	0x0695,	%i2
	bneg,pt	%icc,	loop_1309
	tl	%xcc,	0x0
	edge8ln	%l6,	%l3,	%g3
	edge32l	%o5,	%o3,	%l5
loop_1309:
	subcc	%i3,	%i7,	%g7
	membar	0x74
	fmul8sux16	%f6,	%f28,	%f30
	bvc,a	%icc,	loop_1310
	stb	%o7,	[%l7 + 0x5A]
	ld	[%l7 + 0x70],	%f29
	alignaddr	%i6,	%g2,	%l0
loop_1310:
	tge	%icc,	0x4
	nop
	fitos	%f13,	%f31
	fstox	%f31,	%f30
	set	0x08, %g6
	swapa	[%l7 + %g6] 0x11,	%i1
	tvc	%icc,	0x3
	bneg,a,pn	%icc,	loop_1311
	tne	%xcc,	0x3
	or	%g5,	%o1,	%o2
	and	%i0,	%i5,	%l2
loop_1311:
	fmovsa	%xcc,	%f27,	%f2
	bvs	%xcc,	loop_1312
	xnor	%l1,	%o0,	%o6
	or	%g4,	%o4,	%g6
	brlz,a	%l4,	loop_1313
loop_1312:
	movle	%icc,	%i4,	%i2
	fmovsl	%xcc,	%f16,	%f3
	fmovsg	%icc,	%f24,	%f7
loop_1313:
	fmovrdne	%l6,	%f20,	%f2
	movrlz	%g1,	%l3,	%g3
	tpos	%icc,	0x4
	movle	%icc,	%o5,	%o3
	ldx	[%l7 + 0x78],	%l5
	movvs	%icc,	%i3,	%g7
	nop
	setx loop_1314, %l0, %l1
	jmpl %l1, %o7
	sir	0x00E1
	flush	%l7 + 0x2C
	bpos,pt	%xcc,	loop_1315
loop_1314:
	fmovsge	%icc,	%f28,	%f27
	brlez	%i6,	loop_1316
	fmovrslez	%i7,	%f9,	%f26
loop_1315:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%g2,	%i1
loop_1316:
	sllx	%l0,	0x05,	%g5
	sdiv	%o1,	0x039E,	%i0
	fmovdvc	%icc,	%f27,	%f27
	be,pt	%xcc,	loop_1317
	bgu,a,pt	%xcc,	loop_1318
	ldx	[%l7 + 0x48],	%i5
	sra	%l2,	0x06,	%o2
loop_1317:
	nop
	setx	0x3E6817C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x33DA5B11,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f15,	%f8
loop_1318:
	orn	%o0,	0x1660,	%l1
	fmovrdlz	%o6,	%f22,	%f12
	edge32ln	%g4,	%o4,	%g6
	call	loop_1319
	fbu	%fcc3,	loop_1320
	udivx	%i4,	0x0D91,	%i2
	std	%f10,	[%l7 + 0x18]
loop_1319:
	mulscc	%l6,	0x0B9E,	%l4
loop_1320:
	movrlez	%g1,	%l3,	%o5
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%g3,	%l5
	fmovrse	%o3,	%f27,	%f6
	nop
	setx	0x6065D874,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	xor	%g7,	%o7,	%i3
	andn	%i6,	0x05E2,	%i7
	edge16	%i1,	%g2,	%g5
	ldsw	[%l7 + 0x7C],	%l0
	fbu,a	%fcc0,	loop_1321
	fmovsneg	%xcc,	%f1,	%f5
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x50] %asi,	%i0
loop_1321:
	fmovrdlez	%o1,	%f20,	%f8
	umulcc	%l2,	%i5,	%o2
	std	%f4,	[%l7 + 0x08]
	umul	%o0,	0x098B,	%l1
	fbo	%fcc0,	loop_1322
	smulcc	%o6,	0x0635,	%g4
	srl	%g6,	%o4,	%i2
	movgu	%xcc,	%l6,	%l4
loop_1322:
	nop
	fitos	%f26,	%f23
	fmovrdlez	%i4,	%f0,	%f26
	set	0x8, %l4
	stxa	%l3,	[%g0 + %l4] 0x21
	movle	%xcc,	%g1,	%o5
	addccc	%l5,	%o3,	%g3
	fbn,a	%fcc0,	loop_1323
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%f24
	ldd	[%l7 + 0x50],	%f0
	ldsw	[%l7 + 0x20],	%o7
loop_1323:
	addccc	%g7,	%i6,	%i3
	swap	[%l7 + 0x50],	%i1
	andncc	%i7,	%g5,	%l0
	subcc	%i0,	0x0731,	%g2
	fmovsge	%xcc,	%f31,	%f8
	alignaddrl	%l2,	%o1,	%o2
	fbe	%fcc0,	loop_1324
	subccc	%o0,	%l1,	%o6
	movrlz	%g4,	%g6,	%i5
	movleu	%icc,	%o4,	%i2
loop_1324:
	fmovdvs	%xcc,	%f5,	%f1
	movg	%icc,	%l6,	%l4
	movre	%l3,	%i4,	%o5
	srlx	%g1,	%l5,	%g3
	array16	%o7,	%o3,	%i6
	fcmple16	%f22,	%f14,	%i3
	bshuffle	%f16,	%f10,	%f18
	movrlez	%g7,	0x08B,	%i7
	edge8n	%g5,	%i1,	%i0
	tne	%xcc,	0x7
	orcc	%g2,	%l2,	%o1
	addccc	%l0,	%o2,	%l1
	ldx	[%l7 + 0x48],	%o6
	movcs	%xcc,	%o0,	%g4
	srl	%g6,	0x00,	%i5
	tgu	%xcc,	0x3
	std	%f22,	[%l7 + 0x10]
	tleu	%icc,	0x5
	fpadd16	%f12,	%f18,	%f20
	movrgz	%i2,	%o4,	%l4
	movne	%xcc,	%l3,	%l6
	fbuge,a	%fcc3,	loop_1325
	brgez,a	%o5,	loop_1326
	fbule	%fcc1,	loop_1327
	tcs	%xcc,	0x5
loop_1325:
	fsrc1	%f8,	%f0
loop_1326:
	tsubcc	%g1,	0x15A0,	%l5
loop_1327:
	fxnors	%f16,	%f30,	%f1
	tsubcctv	%i4,	%g3,	%o7
	move	%icc,	%o3,	%i6
	movn	%xcc,	%i3,	%g7
	be,pt	%icc,	loop_1328
	stbar
	wr	%g0,	0x10,	%asi
	stxa	%g5,	[%l7 + 0x58] %asi
loop_1328:
	nop
	setx loop_1329, %l0, %l1
	jmpl %l1, %i1
	fcmpne32	%f8,	%f22,	%i7
	fmovrslez	%i0,	%f29,	%f4
	or	%l2,	0x1513,	%g2
loop_1329:
	faligndata	%f10,	%f0,	%f2
	fmovsvc	%icc,	%f8,	%f16
	prefetch	[%l7 + 0x18],	 0x0
	edge16l	%o1,	%o2,	%l0
	tsubcc	%o6,	%o0,	%g4
	stw	%g6,	[%l7 + 0x34]
	tn	%xcc,	0x2
	tge	%xcc,	0x6
	set	0x10, %l5
	stwa	%l1,	[%l7 + %l5] 0x80
	fxnor	%f14,	%f16,	%f30
	sra	%i5,	0x06,	%i2
	fbue	%fcc2,	loop_1330
	umul	%l4,	0x133F,	%l3
	fmovdvs	%xcc,	%f2,	%f14
	fpmerge	%f26,	%f23,	%f16
loop_1330:
	nop
	set	0x59, %o7
	ldsb	[%l7 + %o7],	%o4
	fmovrdne	%l6,	%f20,	%f0
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sub	%o5,	0x1136,	%l5
	bpos	%icc,	loop_1331
	ldx	[%l7 + 0x28],	%i4
	sllx	%g1,	0x0D,	%o7
	fbn,a	%fcc1,	loop_1332
loop_1331:
	tl	%icc,	0x7
	brlez	%o3,	loop_1333
	tleu	%icc,	0x1
loop_1332:
	sll	%g3,	%i6,	%g7
	fandnot2	%f12,	%f6,	%f16
loop_1333:
	fmul8x16au	%f23,	%f12,	%f0
	fbg	%fcc1,	loop_1334
	umul	%i3,	%g5,	%i7
	subccc	%i1,	%i0,	%g2
	fcmpgt16	%f20,	%f12,	%l2
loop_1334:
	ldsb	[%l7 + 0x46],	%o1
	taddcctv	%o2,	0x145B,	%l0
	lduw	[%l7 + 0x18],	%o6
	movrgez	%o0,	0x3B4,	%g6
	flush	%l7 + 0x18
	fmovdcs	%xcc,	%f18,	%f28
	tneg	%icc,	0x7
	std	%f4,	[%l7 + 0x08]
	mulx	%l1,	0x08B1,	%i5
	srl	%i2,	%l4,	%g4
	edge8ln	%l3,	%o4,	%l6
	array8	%o5,	%i4,	%l5
	movle	%icc,	%o7,	%g1
	fabss	%f30,	%f5
	movcc	%xcc,	%o3,	%i6
	movl	%icc,	%g3,	%g7
	tpos	%xcc,	0x6
	set	0x36, %o4
	lduba	[%l7 + %o4] 0x11,	%g5
	tneg	%xcc,	0x7
	tge	%xcc,	0x1
	movcc	%xcc,	%i7,	%i3
	fcmple16	%f4,	%f18,	%i0
	edge32ln	%g2,	%l2,	%i1
	bneg,a,pn	%xcc,	loop_1335
	edge32	%o1,	%l0,	%o6
	subcc	%o0,	0x1991,	%g6
	nop
	setx	0xF76FCED97C55EFBA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xCF2178F2C50443B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f28,	%f4
loop_1335:
	fmovscc	%icc,	%f20,	%f19
	stw	%o2,	[%l7 + 0x0C]
	nop
	setx	0xAB9DA582,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x35F492DF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f4,	%f29
	call	loop_1336
	std	%f2,	[%l7 + 0x30]
	tleu	%icc,	0x0
	fmovdgu	%icc,	%f28,	%f9
loop_1336:
	fmovrslz	%i5,	%f10,	%f19
	set	0x10, %g3
	lduha	[%l7 + %g3] 0x18,	%i2
	std	%f26,	[%l7 + 0x50]
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x48] %asi,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g4,	%l3,	%o4
	subcc	%l6,	%o5,	%l1
	nop
	setx loop_1337, %l0, %l1
	jmpl %l1, %l5
	bneg,a	loop_1338
	subcc	%i4,	0x1305,	%g1
	tl	%icc,	0x5
loop_1337:
	nop
	set	0x44, %i6
	ldsha	[%l7 + %i6] 0x80,	%o3
loop_1338:
	ld	[%l7 + 0x34],	%f23
	te	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o7,	%i6,	%g3
	sra	%g7,	0x19,	%i7
	set	0x2E, %g5
	lduha	[%l7 + %g5] 0x80,	%g5
	fmovsa	%xcc,	%f20,	%f8
	movne	%icc,	%i3,	%g2
	tgu	%icc,	0x6
	edge32n	%i0,	%l2,	%i1
	movne	%icc,	%l0,	%o1
	lduh	[%l7 + 0x1A],	%o0
	tleu	%icc,	0x2
	fmovsne	%xcc,	%f16,	%f8
	udivx	%g6,	0x0F34,	%o2
	bpos,a	loop_1339
	movre	%o6,	%i2,	%i5
	edge32	%g4,	%l3,	%l4
	tvs	%xcc,	0x4
loop_1339:
	fmovda	%xcc,	%f2,	%f4
	tl	%icc,	0x7
	movrgez	%o4,	%l6,	%o5
	fbe	%fcc3,	loop_1340
	edge32l	%l1,	%l5,	%g1
	ldx	[%l7 + 0x48],	%i4
	fpackfix	%f14,	%f13
loop_1340:
	movrlz	%o3,	0x191,	%i6
	bvc	%icc,	loop_1341
	edge16	%g3,	%o7,	%g7
	sth	%g5,	[%l7 + 0x4C]
	andcc	%i7,	%i3,	%g2
loop_1341:
	tle	%xcc,	0x1
	fnot1s	%f3,	%f7
	xor	%i0,	%i1,	%l0
	ldd	[%l7 + 0x08],	%f0
	fxors	%f29,	%f3,	%f18
	set	0x64, %o6
	stwa	%l2,	[%l7 + %o6] 0xeb
	membar	#Sync
	xnor	%o1,	%o0,	%o2
	bgu,a	%xcc,	loop_1342
	fmovsg	%xcc,	%f17,	%f15
	fcmpgt32	%f12,	%f8,	%o6
	bge	%xcc,	loop_1343
loop_1342:
	tneg	%xcc,	0x5
	tvs	%icc,	0x6
	addcc	%g6,	%i2,	%g4
loop_1343:
	edge32n	%i5,	%l3,	%o4
	fmul8sux16	%f26,	%f16,	%f20
	membar	0x7F
	sdivx	%l4,	0x0991,	%o5
	edge32	%l6,	%l1,	%g1
	set	0x7E, %g2
	ldsha	[%l7 + %g2] 0x10,	%l5
	tg	%icc,	0x6
	fmovscc	%icc,	%f22,	%f14
	xorcc	%o3,	0x1B29,	%i4
	ldsh	[%l7 + 0x1A],	%g3
	srlx	%o7,	%i6,	%g5
	mulscc	%g7,	0x0221,	%i3
	bneg,a	loop_1344
	nop
	fitos	%f4,	%f5
	flush	%l7 + 0x68
	tcs	%xcc,	0x4
loop_1344:
	brz,a	%i7,	loop_1345
	fnors	%f14,	%f18,	%f19
	tge	%icc,	0x0
	set	0x6D, %o1
	stba	%i0,	[%l7 + %o1] 0x27
	membar	#Sync
loop_1345:
	nop
	setx	0xE067DBB4,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	xorcc	%g2,	0x14E2,	%l0
	sub	%i1,	0x170F,	%l2
	fors	%f14,	%f30,	%f7
	fpsub16s	%f21,	%f11,	%f17
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%o0
	fpadd16	%f22,	%f22,	%f4
	membar	0x6A
	for	%f28,	%f30,	%f26
	fmovd	%f6,	%f18
	fmovsvs	%icc,	%f15,	%f22
	fbule	%fcc0,	loop_1346
	ldsw	[%l7 + 0x3C],	%o1
	ldsw	[%l7 + 0x34],	%o6
	add	%o2,	%g6,	%g4
loop_1346:
	array16	%i2,	%l3,	%i5
	tgu	%xcc,	0x6
	movrlz	%l4,	%o5,	%l6
	edge8ln	%l1,	%g1,	%o4
	popc	%l5,	%i4
	fmovrsgez	%g3,	%f30,	%f19
	sllx	%o3,	%o7,	%i6
	movre	%g5,	%g7,	%i7
	wr	%g0,	0x81,	%asi
	stxa	%i3,	[%l7 + 0x68] %asi
	tvc	%icc,	0x7
	fbue,a	%fcc3,	loop_1347
	bg,a,pt	%xcc,	loop_1348
	array32	%g2,	%l0,	%i1
	ldub	[%l7 + 0x62],	%i0
loop_1347:
	nop
	set	0x13, %i5
	ldsba	[%l7 + %i5] 0x18,	%l2
loop_1348:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o0
	addcc	%o1,	%o2,	%o6
	bcs,a	loop_1349
	popc	%g6,	%g4
	tsubcc	%l3,	0x1531,	%i5
	and	%l4,	0x09D8,	%i2
loop_1349:
	fmul8sux16	%f28,	%f28,	%f20
	mova	%xcc,	%o5,	%l1
	tle	%xcc,	0x7
	movvs	%xcc,	%g1,	%o4
	tvc	%icc,	0x3
	movvs	%icc,	%l6,	%i4
	edge32	%g3,	%o3,	%l5
	wr	%g0,	0x89,	%asi
	stwa	%o7,	[%l7 + 0x58] %asi
	edge8ln	%g5,	%g7,	%i7
	fxors	%f10,	%f8,	%f22
	movleu	%xcc,	%i6,	%g2
	xnorcc	%l0,	0x1495,	%i1
	tleu	%xcc,	0x4
	bne	loop_1350
	fornot2s	%f21,	%f0,	%f24
	alignaddrl	%i0,	%i3,	%l2
	fmul8ulx16	%f0,	%f8,	%f30
loop_1350:
	movre	%o1,	0x0B5,	%o2
	udivx	%o6,	0x1861,	%g6
	edge16	%g4,	%l3,	%o0
	st	%f24,	[%l7 + 0x18]
	faligndata	%f18,	%f6,	%f26
	edge8ln	%l4,	%i5,	%i2
	mulx	%l1,	0x11FE,	%g1
	ldx	[%l7 + 0x48],	%o4
	prefetch	[%l7 + 0x14],	 0x1
	edge8ln	%l6,	%i4,	%g3
	or	%o5,	0x1F43,	%o3
	array32	%l5,	%g5,	%o7
	orncc	%i7,	%g7,	%i6
	edge16l	%g2,	%i1,	%l0
	movrne	%i0,	0x2E6,	%i3
	fbu,a	%fcc1,	loop_1351
	andn	%o1,	%o2,	%o6
	mulx	%g6,	%l2,	%g4
	movcs	%icc,	%o0,	%l4
loop_1351:
	subc	%i5,	0x0D4C,	%i2
	taddcctv	%l3,	0x1687,	%l1
	udiv	%g1,	0x0B71,	%l6
	edge16n	%i4,	%o4,	%g3
	for	%f2,	%f0,	%f4
	movrlez	%o3,	%o5,	%g5
	tge	%xcc,	0x6
	fbge,a	%fcc3,	loop_1352
	sdiv	%l5,	0x1788,	%i7
	fbul	%fcc2,	loop_1353
	movvc	%icc,	%o7,	%i6
loop_1352:
	movre	%g7,	%i1,	%l0
	fmovrsgez	%i0,	%f22,	%f10
loop_1353:
	and	%g2,	0x057A,	%i3
	ldx	[%l7 + 0x78],	%o1
	fbuge	%fcc3,	loop_1354
	nop
	setx	loop_1355,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%o2,	%g6,	%o6
	membar	0x29
loop_1354:
	fand	%f16,	%f24,	%f8
loop_1355:
	mulx	%l2,	%g4,	%o0
	brgez,a	%i5,	loop_1356
	brlez	%i2,	loop_1357
	smulcc	%l3,	0x18E0,	%l4
	fnot2	%f0,	%f12
loop_1356:
	tg	%icc,	0x0
loop_1357:
	udivcc	%l1,	0x1D61,	%l6
	movrlz	%g1,	%i4,	%g3
	bvs,pn	%xcc,	loop_1358
	fmovscc	%icc,	%f22,	%f5
	xorcc	%o3,	%o4,	%o5
	edge16n	%l5,	%g5,	%i7
loop_1358:
	edge32l	%i6,	%o7,	%i1
	xnor	%l0,	%g7,	%g2
	fcmpgt16	%f20,	%f28,	%i3
	tne	%icc,	0x5
	fmovsvs	%xcc,	%f9,	%f4
	fbn,a	%fcc2,	loop_1359
	sll	%o1,	0x05,	%i0
	addc	%o2,	%g6,	%l2
	sethi	0x038B,	%o6
loop_1359:
	subccc	%o0,	0x0E90,	%g4
	lduh	[%l7 + 0x4E],	%i5
	fbue,a	%fcc3,	loop_1360
	edge16ln	%i2,	%l4,	%l1
	sra	%l6,	%l3,	%g1
	edge32l	%g3,	%i4,	%o4
loop_1360:
	te	%icc,	0x4
	edge16	%o5,	%o3,	%l5
	fbuge,a	%fcc1,	loop_1361
	orncc	%i7,	0x03A7,	%i6
	orncc	%g5,	%i1,	%o7
	fmovsneg	%xcc,	%f26,	%f19
loop_1361:
	bpos	loop_1362
	fsrc2	%f30,	%f16
	and	%l0,	%g7,	%i3
	bneg	%xcc,	loop_1363
loop_1362:
	fsrc1s	%f6,	%f23
	addcc	%g2,	%o1,	%i0
	brgz	%o2,	loop_1364
loop_1363:
	bge,a	%icc,	loop_1365
	sdiv	%g6,	0x1F11,	%o6
	fmovdpos	%icc,	%f13,	%f25
loop_1364:
	edge32	%l2,	%g4,	%o0
loop_1365:
	or	%i2,	0x079D,	%i5
	umulcc	%l1,	%l4,	%l3
	popc	0x066D,	%l6
	sdivcc	%g1,	0x1D9A,	%g3
	swap	[%l7 + 0x44],	%i4
	brlz,a	%o4,	loop_1366
	tsubcctv	%o5,	%l5,	%o3
	sllx	%i7,	%g5,	%i6
	pdist	%f0,	%f28,	%f12
loop_1366:
	ldx	[%l7 + 0x68],	%o7
	taddcctv	%i1,	0x0BDE,	%l0
	sethi	0x1412,	%g7
	call	loop_1367
	addc	%g2,	%o1,	%i0
	tvs	%icc,	0x1
	sth	%o2,	[%l7 + 0x18]
loop_1367:
	udiv	%g6,	0x1F1C,	%o6
	subccc	%i3,	%l2,	%g4
	bneg	%icc,	loop_1368
	taddcc	%i2,	0x1006,	%o0
	mova	%icc,	%l1,	%i5
	edge16	%l4,	%l3,	%l6
loop_1368:
	nop
	set	0x40, %i2
	swapa	[%l7 + %i2] 0x80,	%g3
	ba	loop_1369
	umul	%g1,	%o4,	%i4
	subccc	%o5,	%o3,	%l5
	andncc	%g5,	%i7,	%o7
loop_1369:
	fmovsle	%xcc,	%f29,	%f0
	flush	%l7 + 0x60
	tle	%xcc,	0x3
	alignaddrl	%i1,	%i6,	%g7
	set	0x6C, %o0
	swapa	[%l7 + %o0] 0x19,	%l0
	fmovse	%icc,	%f7,	%f5
	st	%f20,	[%l7 + 0x4C]
	sdivx	%o1,	0x1D6A,	%i0
	udivx	%g2,	0x1B71,	%o2
	xnor	%o6,	%g6,	%l2
	tcc	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x22] %asi,	%g4
	tne	%icc,	0x3
	movne	%xcc,	%i2,	%i3
	movg	%icc,	%l1,	%o0
	movrne	%i5,	0x3AC,	%l4
	set	0x120, %i0
	stxa	%l6,	[%g0 + %i0] 0x52
	fmovsneg	%xcc,	%f2,	%f6
	movcs	%xcc,	%l3,	%g1
	xnorcc	%g3,	%o4,	%i4
	andncc	%o5,	%l5,	%o3
	sra	%i7,	0x1E,	%o7
	fmovse	%xcc,	%f9,	%f27
	lduw	[%l7 + 0x38],	%i1
	brz,a	%i6,	loop_1370
	tl	%xcc,	0x2
	andn	%g5,	0x1FB6,	%l0
	edge32	%o1,	%i0,	%g2
loop_1370:
	edge16ln	%g7,	%o2,	%o6
	fnot2s	%f22,	%f12
	fmovs	%f17,	%f24
	fbge,a	%fcc3,	loop_1371
	tneg	%icc,	0x1
	array32	%g6,	%g4,	%i2
	fmul8sux16	%f4,	%f20,	%f18
loop_1371:
	tleu	%xcc,	0x1
	tneg	%xcc,	0x5
	movneg	%icc,	%i3,	%l2
	tvc	%icc,	0x5
	move	%xcc,	%l1,	%o0
	tcc	%xcc,	0x4
	edge32n	%i5,	%l4,	%l6
	tleu	%xcc,	0x6
	brlz,a	%l3,	loop_1372
	movvc	%icc,	%g1,	%o4
	fmovsa	%xcc,	%f20,	%f10
	tn	%icc,	0x3
loop_1372:
	tn	%icc,	0x0
	mova	%xcc,	%g3,	%o5
	addccc	%l5,	0x17CE,	%i4
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i7
	fbne	%fcc2,	loop_1373
	sll	%o3,	0x1A,	%o7
	lduh	[%l7 + 0x10],	%i1
	tgu	%xcc,	0x7
loop_1373:
	fxnor	%f6,	%f16,	%f10
	fpadd32s	%f2,	%f7,	%f15
	stb	%g5,	[%l7 + 0x0B]
	brz,a	%l0,	loop_1374
	tne	%icc,	0x0
	flush	%l7 + 0x6C
	tleu	%icc,	0x2
loop_1374:
	sdiv	%i6,	0x1EEC,	%o1
	fors	%f31,	%f11,	%f31
	fmovdcc	%xcc,	%f1,	%f15
	for	%f12,	%f24,	%f12
	fandnot1	%f10,	%f12,	%f0
	fbg	%fcc3,	loop_1375
	ble,a	loop_1376
	std	%f28,	[%l7 + 0x10]
	edge32	%i0,	%g2,	%g7
loop_1375:
	bn,a,pt	%icc,	loop_1377
loop_1376:
	brgz,a	%o6,	loop_1378
	swap	[%l7 + 0x60],	%o2
	tle	%xcc,	0x6
loop_1377:
	lduw	[%l7 + 0x28],	%g6
loop_1378:
	tn	%icc,	0x6
	movcs	%icc,	%i2,	%g4
	bcs,pt	%xcc,	loop_1379
	xor	%i3,	%l2,	%l1
	lduw	[%l7 + 0x50],	%i5
	fmovsl	%icc,	%f18,	%f30
loop_1379:
	movvs	%xcc,	%o0,	%l6
	sir	0x0865
	movne	%icc,	%l4,	%g1
	nop
	set	0x48, %g4
	ldsh	[%l7 + %g4],	%l3
	movpos	%xcc,	%g3,	%o4
	addc	%o5,	%i4,	%l5
	wr	%g0,	0x04,	%asi
	sta	%f29,	[%l7 + 0x24] %asi
	be,a,pt	%xcc,	loop_1380
	tle	%xcc,	0x0
	subc	%i7,	0x06B0,	%o7
	tneg	%icc,	0x5
loop_1380:
	movcc	%xcc,	%i1,	%g5
	udiv	%l0,	0x07F2,	%o3
	srl	%o1,	0x10,	%i0
	movrne	%g2,	0x0C7,	%i6
	bne,a,pt	%xcc,	loop_1381
	umulcc	%g7,	0x0AFA,	%o6
	set	0x70, %g1
	ldda	[%l7 + %g1] 0x10,	%o2
loop_1381:
	sdiv	%g6,	0x02B3,	%g4
	fmovsn	%icc,	%f30,	%f30
	edge16n	%i2,	%i3,	%l1
	brlez	%l2,	loop_1382
	ldsb	[%l7 + 0x2B],	%i5
	movne	%icc,	%o0,	%l4
	fbug	%fcc2,	loop_1383
loop_1382:
	nop
	setx loop_1384, %l0, %l1
	jmpl %l1, %g1
	ble,a,pt	%xcc,	loop_1385
	alignaddr	%l6,	%l3,	%g3
loop_1383:
	mova	%xcc,	%o5,	%o4
loop_1384:
	andn	%i4,	0x10A4,	%i7
loop_1385:
	edge8l	%o7,	%l5,	%g5
	bgu,a,pt	%icc,	loop_1386
	swap	[%l7 + 0x34],	%l0
	nop
	fitos	%f5,	%f4
	fstoi	%f4,	%f1
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
loop_1386:
	st	%f5,	[%l7 + 0x68]
	fmovscc	%xcc,	%f29,	%f22
	addc	%i1,	%o1,	%g2
	fbul	%fcc1,	loop_1387
	movneg	%icc,	%i6,	%i0
	edge32ln	%o6,	%o2,	%g7
	addc	%g4,	%g6,	%i2
loop_1387:
	stb	%i3,	[%l7 + 0x0D]
	fmovsvc	%icc,	%f15,	%f5
	sdiv	%l1,	0x1187,	%i5
	addcc	%o0,	0x0075,	%l2
	fmovdle	%xcc,	%f1,	%f16
	bcs,a	%icc,	loop_1388
	movvc	%icc,	%l4,	%l6
	movrgez	%g1,	0x1B6,	%g3
	edge32n	%l3,	%o5,	%o4
loop_1388:
	tgu	%icc,	0x6
	bpos	%icc,	loop_1389
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i4,	0x1B50,	%o7
	mulscc	%l5,	%g5,	%i7
loop_1389:
	fpadd32	%f10,	%f6,	%f16
	nop
	fitos	%f4,	%f6
	fstox	%f6,	%f16
	tcc	%xcc,	0x3
	andn	%o3,	0x0BA4,	%i1
	set	0x68, %i7
	stwa	%l0,	[%l7 + %i7] 0xea
	membar	#Sync
	nop
	setx	0x9168B296,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xA8F2E572,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f2,	%f10
	ldd	[%l7 + 0x70],	%o0
	fbu	%fcc1,	loop_1390
	taddcctv	%g2,	0x0F94,	%i6
	xnor	%i0,	%o2,	%o6
	sdiv	%g4,	0x15F5,	%g6
loop_1390:
	move	%xcc,	%g7,	%i3
	movneg	%xcc,	%l1,	%i2
	movrgez	%o0,	0x36B,	%i5
	swap	[%l7 + 0x64],	%l4
	stb	%l2,	[%l7 + 0x31]
	fandnot2s	%f3,	%f31,	%f19
	taddcctv	%g1,	0x0443,	%l6
	fcmple32	%f20,	%f30,	%g3
	flush	%l7 + 0x7C
	fble,a	%fcc0,	loop_1391
	edge8	%l3,	%o5,	%o4
	prefetch	[%l7 + 0x3C],	 0x2
	te	%xcc,	0x7
loop_1391:
	ldd	[%l7 + 0x30],	%o6
	movcc	%xcc,	%i4,	%g5
	tsubcctv	%i7,	0x1C12,	%o3
	fornot2	%f28,	%f4,	%f26
	sdivcc	%i1,	0x1E94,	%l0
	tleu	%icc,	0x6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l5,	%g2
	tl	%xcc,	0x2
	nop
	setx	0x000192C920708146,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	nop
	setx	0x1AFF0A7B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f10
	bvc	%xcc,	loop_1392
	fmovsleu	%xcc,	%f7,	%f21
	edge8	%i6,	%i0,	%o1
	orcc	%o2,	%o6,	%g6
loop_1392:
	nop
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g4
	fmovse	%icc,	%f14,	%f18
	stw	%g7,	[%l7 + 0x50]
	mulscc	%i3,	0x1F3B,	%i2
	fzeros	%f1
	fornot2	%f6,	%f24,	%f4
	fbl,a	%fcc1,	loop_1393
	andcc	%o0,	0x09A1,	%i5
	movrgez	%l1,	0x3D8,	%l2
	fnors	%f26,	%f27,	%f1
loop_1393:
	edge16ln	%l4,	%g1,	%l6
	fbne	%fcc0,	loop_1394
	edge32n	%l3,	%g3,	%o5
	tcc	%icc,	0x0
	srax	%o4,	%o7,	%g5
loop_1394:
	fmovsleu	%xcc,	%f7,	%f5
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movle	%xcc,	%i4,	%o3
	mulx	%i7,	0x0028,	%i1
	ldstub	[%l7 + 0x66],	%l0
	sllx	%g2,	0x01,	%l5
	and	%i0,	%o1,	%o2
	fbuge	%fcc1,	loop_1395
	srax	%o6,	%i6,	%g4
	movrlz	%g7,	%g6,	%i2
	bg	%icc,	loop_1396
loop_1395:
	stw	%i3,	[%l7 + 0x48]
	ta	%xcc,	0x5
	tvc	%xcc,	0x7
loop_1396:
	sdiv	%i5,	0x0409,	%l1
	fornot1	%f30,	%f24,	%f18
	array8	%o0,	%l2,	%l4
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf1
	membar	#Sync
	pdist	%f6,	%f22,	%f14
	mulscc	%l6,	0x197A,	%g1
	fbul	%fcc1,	loop_1397
	orcc	%l3,	%o5,	%g3
	tpos	%icc,	0x4
	lduw	[%l7 + 0x10],	%o4
loop_1397:
	te	%icc,	0x6
	fmovrdlz	%g5,	%f26,	%f2
	sub	%i4,	%o3,	%i7
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
	edge8	%o7,	%i1,	%l0
	tgu	%icc,	0x4
	sdivx	%l5,	0x1016,	%g2
loop_1398:
	addc	%o1,	0x186A,	%o2
	srax	%i0,	%i6,	%o6
	movcs	%icc,	%g7,	%g4
	fandnot2	%f24,	%f14,	%f12
	movne	%xcc,	%i2,	%g6
	edge16n	%i5,	%i3,	%l1
	stx	%l2,	[%l7 + 0x18]
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x1e,	%f16
	alignaddr	%o0,	%l6,	%l4
	tvc	%icc,	0x6
	edge16l	%g1,	%l3,	%g3
	edge8l	%o5,	%o4,	%i4
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f20
	fxtod	%f20,	%f8
	fmovda	%xcc,	%f29,	%f6
	edge8n	%o3,	%i7,	%o7
	fpsub16s	%f17,	%f14,	%f23
	fblg	%fcc3,	loop_1399
	fmovse	%icc,	%f29,	%f21
	movge	%xcc,	%i1,	%g5
	brlez	%l0,	loop_1400
loop_1399:
	fexpand	%f24,	%f30
	tcc	%xcc,	0x0
	ldsw	[%l7 + 0x10],	%g2
loop_1400:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o1,	0x0C65,	%l5
	fpadd32	%f24,	%f18,	%f28
	movle	%xcc,	%i0,	%i6
	fbue,a	%fcc2,	loop_1401
	fpsub16s	%f12,	%f18,	%f20
	udiv	%o2,	0x15B1,	%g7
	fmovdcs	%xcc,	%f21,	%f13
loop_1401:
	mulscc	%o6,	%g4,	%g6
	fsrc1	%f28,	%f4
	ld	[%l7 + 0x2C],	%f12
	tcc	%icc,	0x2
	fandnot1	%f10,	%f14,	%f24
	alignaddr	%i5,	%i3,	%i2
	orn	%l2,	0x0219,	%o0
	ldsh	[%l7 + 0x10],	%l6
	fabsd	%f6,	%f0
	movrne	%l1,	%g1,	%l4
	lduw	[%l7 + 0x6C],	%l3
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf9
	membar	#Sync
	srlx	%g3,	0x1D,	%o4
	movleu	%icc,	%o5,	%o3
	sir	0x098C
	movleu	%icc,	%i4,	%i7
	fornot1s	%f20,	%f6,	%f13
	sethi	0x0E3B,	%o7
	array32	%g5,	%i1,	%g2
	set	0x3C, %o5
	stha	%o1,	[%l7 + %o5] 0xeb
	membar	#Sync
	tge	%icc,	0x2
	edge8ln	%l0,	%l5,	%i6
	ldsb	[%l7 + 0x4C],	%i0
	fbn,a	%fcc1,	loop_1402
	fbl,a	%fcc0,	loop_1403
	bn,a	%icc,	loop_1404
	fbue	%fcc1,	loop_1405
loop_1402:
	fnegs	%f4,	%f0
loop_1403:
	popc	0x199D,	%o2
loop_1404:
	tneg	%icc,	0x3
loop_1405:
	and	%g7,	%o6,	%g4
	tl	%icc,	0x4
	xnor	%i5,	%g6,	%i2
	bcs,a,pn	%icc,	loop_1406
	movrlez	%l2,	0x24E,	%o0
	tne	%xcc,	0x7
	brnz	%l6,	loop_1407
loop_1406:
	fbue,a	%fcc0,	loop_1408
	move	%xcc,	%i3,	%l1
	fmovsn	%xcc,	%f16,	%f31
loop_1407:
	movrlez	%g1,	%l4,	%l3
loop_1408:
	sub	%g3,	%o5,	%o4
	sll	%o3,	%i4,	%o7
	andn	%i7,	0x0519,	%g5
	andncc	%g2,	%i1,	%l0
	bvc	%icc,	loop_1409
	fcmpne32	%f0,	%f28,	%o1
	bge,pt	%xcc,	loop_1410
	movg	%icc,	%i6,	%l5
loop_1409:
	edge32	%o2,	%i0,	%g7
	movvc	%icc,	%o6,	%i5
loop_1410:
	fbule	%fcc1,	loop_1411
	fmovdne	%xcc,	%f21,	%f13
	bgu	loop_1412
	fpadd16s	%f2,	%f21,	%f16
loop_1411:
	edge32	%g4,	%i2,	%l2
	set	0x1C, %g7
	lduwa	[%l7 + %g7] 0x18,	%g6
loop_1412:
	movrgz	%l6,	0x2CF,	%i3
	edge8ln	%o0,	%g1,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz,a	%l3,	loop_1413
	fpadd16	%f18,	%f22,	%f6
	fmovrslz	%l4,	%f17,	%f14
	fcmpne32	%f12,	%f22,	%g3
loop_1413:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x54] %asi,	%o5
	movgu	%icc,	%o4,	%o3
	array8	%o7,	%i7,	%i4
	lduw	[%l7 + 0x48],	%g5
	ldstub	[%l7 + 0x75],	%i1
	edge8n	%l0,	%o1,	%g2
	array16	%l5,	%o2,	%i6
	tn	%xcc,	0x7
	tge	%xcc,	0x0
	ba,a,pt	%icc,	loop_1414
	fabss	%f12,	%f9
	ldub	[%l7 + 0x77],	%i0
	edge8ln	%o6,	%i5,	%g7
loop_1414:
	movgu	%xcc,	%g4,	%i2
	edge8l	%g6,	%l6,	%l2
	srax	%o0,	0x04,	%i3
	ldsh	[%l7 + 0x18],	%l1
	brnz,a	%l3,	loop_1415
	movgu	%xcc,	%l4,	%g3
	set	0x4C, %i1
	ldswa	[%l7 + %i1] 0x19,	%o5
loop_1415:
	tne	%xcc,	0x2
	movge	%xcc,	%g1,	%o4
	movg	%xcc,	%o7,	%o3
	sub	%i7,	%i4,	%i1
	fbul,a	%fcc0,	loop_1416
	movleu	%xcc,	%l0,	%o1
	movvc	%icc,	%g2,	%g5
	movrlz	%o2,	0x3E2,	%i6
loop_1416:
	udiv	%l5,	0x131C,	%i0
	sra	%o6,	%i5,	%g7
	xorcc	%i2,	0x012E,	%g6
	wr	%g0,	0x81,	%asi
	stha	%l6,	[%l7 + 0x5E] %asi
	edge32n	%l2,	%o0,	%i3
	orncc	%l1,	0x123A,	%l3
	fpackfix	%f24,	%f16
	tl	%xcc,	0x4
	faligndata	%f12,	%f8,	%f8
	taddcctv	%l4,	%g4,	%o5
	or	%g1,	%g3,	%o7
	andcc	%o4,	0x133F,	%i7
	xnorcc	%o3,	0x10BF,	%i4
	pdist	%f28,	%f2,	%f4
	ldd	[%l7 + 0x10],	%l0
	popc	%i1,	%o1
	fbl	%fcc1,	loop_1417
	mulx	%g5,	%g2,	%o2
	nop
	setx	0xF2341E62,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x0C54F054,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f27,	%f9
	edge8l	%l5,	%i6,	%o6
loop_1417:
	move	%icc,	%i0,	%g7
	set	0x2A, %l6
	stba	%i5,	[%l7 + %l6] 0x80
	movvs	%icc,	%i2,	%l6
	tcc	%xcc,	0x0
	ldstub	[%l7 + 0x36],	%g6
	fpadd16s	%f30,	%f23,	%f4
	array16	%o0,	%i3,	%l2
	srax	%l3,	0x18,	%l1
	movpos	%xcc,	%g4,	%l4
	fmovsleu	%xcc,	%f18,	%f26
	movge	%xcc,	%o5,	%g1
	tcs	%xcc,	0x0
	fsrc2s	%f6,	%f7
	fornot1s	%f4,	%f25,	%f21
	fnot2	%f30,	%f20
	edge32	%g3,	%o4,	%i7
	sdivcc	%o7,	0x1767,	%i4
	andcc	%l0,	%o3,	%o1
	taddcc	%i1,	%g5,	%g2
	xor	%l5,	0x0E5F,	%o2
	stw	%o6,	[%l7 + 0x3C]
	movn	%xcc,	%i0,	%i6
	fmovdpos	%xcc,	%f19,	%f13
	addc	%i5,	0x11F3,	%g7
	popc	0x1429,	%i2
	edge32l	%g6,	%l6,	%o0
	movvc	%xcc,	%i3,	%l3
	orncc	%l2,	0x06B4,	%l1
	be,a	%xcc,	loop_1418
	array8	%g4,	%o5,	%l4
	fcmpgt32	%f22,	%f10,	%g3
	movvc	%icc,	%g1,	%i7
loop_1418:
	fmovda	%icc,	%f23,	%f27
	movl	%icc,	%o4,	%o7
	nop
	set	0x18, %l3
	sth	%i4,	[%l7 + %l3]
	movn	%xcc,	%l0,	%o3
	te	%xcc,	0x5
	bgu	%icc,	loop_1419
	fbue	%fcc0,	loop_1420
	stb	%o1,	[%l7 + 0x30]
	tl	%icc,	0x4
loop_1419:
	srl	%g5,	0x1B,	%i1
loop_1420:
	ldd	[%l7 + 0x10],	%f24
	movg	%xcc,	%l5,	%g2
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x81,	 0x1
	sra	%o2,	0x18,	%i6
	tsubcctv	%i5,	0x1336,	%i0
	membar	0x2D
	ldd	[%l7 + 0x08],	%i2
	fmovd	%f22,	%f18
	movne	%xcc,	%g6,	%l6
	mulscc	%o0,	0x1560,	%i3
	lduw	[%l7 + 0x38],	%l3
	fpackfix	%f18,	%f5
	ldsw	[%l7 + 0x40],	%l2
	fsrc1s	%f7,	%f8
	and	%l1,	%g4,	%g7
	fmovsvs	%xcc,	%f19,	%f18
	bcs,pn	%icc,	loop_1421
	fmovdl	%xcc,	%f15,	%f7
	taddcc	%o5,	0x0BC0,	%g3
	movre	%g1,	0x338,	%l4
loop_1421:
	movrlez	%o4,	%i7,	%i4
	tn	%icc,	0x4
	xnor	%l0,	%o3,	%o1
	tle	%xcc,	0x6
	fmovdcc	%xcc,	%f9,	%f20
	and	%g5,	%o7,	%i1
	fmovdcc	%xcc,	%f3,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f24,	%f30,	%l5
	tvs	%xcc,	0x0
	ldx	[%l7 + 0x68],	%g2
	andn	%o6,	%o2,	%i5
	movvc	%xcc,	%i0,	%i6
	xorcc	%i2,	0x16C2,	%l6
	fmul8sux16	%f8,	%f24,	%f14
	srlx	%g6,	0x16,	%i3
	bleu	loop_1422
	mulx	%l3,	0x132F,	%l2
	sethi	0x1DBD,	%o0
	fpadd16	%f4,	%f4,	%f24
loop_1422:
	tl	%icc,	0x4
	ble	loop_1423
	subccc	%l1,	0x0B90,	%g7
	stw	%o5,	[%l7 + 0x68]
	fmovsle	%xcc,	%f23,	%f11
loop_1423:
	brlz,a	%g3,	loop_1424
	fbu	%fcc3,	loop_1425
	fbul,a	%fcc3,	loop_1426
	subcc	%g1,	%g4,	%o4
loop_1424:
	sll	%l4,	0x0E,	%i7
loop_1425:
	andcc	%i4,	%o3,	%o1
loop_1426:
	move	%icc,	%l0,	%g5
	srax	%i1,	0x08,	%o7
	movne	%icc,	%l5,	%g2
	sllx	%o2,	0x0A,	%o6
	fbg,a	%fcc3,	loop_1427
	nop
	setx	0x913382FE707A0C7B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	movvc	%xcc,	%i0,	%i5
	mulx	%i2,	%i6,	%l6
loop_1427:
	nop
	fitos	%f5,	%f9
	fstod	%f9,	%f8
	fble,a	%fcc2,	loop_1428
	orn	%i3,	0x16B1,	%g6
	call	loop_1429
	sdivcc	%l2,	0x1D64,	%o0
loop_1428:
	edge8n	%l3,	%l1,	%g7
	tleu	%xcc,	0x7
loop_1429:
	movvs	%icc,	%g3,	%g1
	fmovsneg	%icc,	%f11,	%f7
	fbl,a	%fcc1,	loop_1430
	xorcc	%o5,	0x0B76,	%g4
	sll	%o4,	%i7,	%l4
	or	%o3,	0x0A0C,	%i4
loop_1430:
	bvc,pt	%xcc,	loop_1431
	tpos	%xcc,	0x0
	umul	%l0,	0x1A7C,	%g5
	srl	%i1,	0x1D,	%o1
loop_1431:
	movre	%l5,	0x028,	%o7
	udiv	%g2,	0x1344,	%o2
	fnand	%f8,	%f12,	%f8
	fpsub16	%f12,	%f20,	%f8
	sethi	0x1861,	%i0
	set	0x18, %i4
	ldxa	[%g0 + %i4] 0x50,	%i5
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x81,	%f0
	bg,a	%icc,	loop_1432
	fnegs	%f26,	%f18
	fbo	%fcc3,	loop_1433
	tl	%icc,	0x1
loop_1432:
	brlz,a	%i2,	loop_1434
	movre	%o6,	0x03C,	%l6
loop_1433:
	sra	%i6,	0x0A,	%g6
	sdivcc	%l2,	0x1E9E,	%o0
loop_1434:
	tg	%xcc,	0x7
	fsrc2s	%f14,	%f5
	taddcc	%i3,	%l3,	%l1
	fsrc2s	%f22,	%f27
	nop
	setx	loop_1435,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x0853,	%g7
	fmovdle	%icc,	%f30,	%f4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%g1
loop_1435:
	fbn,a	%fcc3,	loop_1436
	fandnot2	%f14,	%f8,	%f22
	call	loop_1437
	movleu	%xcc,	%o5,	%g4
loop_1436:
	taddcc	%g3,	0x17D3,	%i7
	fbu,a	%fcc2,	loop_1438
loop_1437:
	fandnot2	%f26,	%f22,	%f6
	taddcc	%o4,	0x0EF4,	%o3
	edge16ln	%i4,	%l0,	%l4
loop_1438:
	udiv	%g5,	0x1A0D,	%o1
	taddcc	%i1,	0x0DF5,	%l5
	move	%icc,	%o7,	%o2
	fmovdn	%xcc,	%f15,	%f27
	nop
	set	0x18, %l4
	ldx	[%l7 + %l4],	%i0
	nop
	set	0x2A, %l2
	lduh	[%l7 + %l2],	%i5
	ldsw	[%l7 + 0x0C],	%i2
	alignaddrl	%g2,	%l6,	%o6
	subcc	%g6,	0x0898,	%i6
	fbl	%fcc1,	loop_1439
	nop
	setx	0x904C0CF4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f13
	andcc	%o0,	%i3,	%l3
	udivx	%l2,	0x1A91,	%l1
loop_1439:
	sdivx	%g7,	0x041E,	%g1
	xorcc	%o5,	%g4,	%g3
	movrgz	%i7,	0x32B,	%o3
	tge	%icc,	0x4
	edge16ln	%o4,	%i4,	%l4
	fpack16	%f24,	%f29
	andncc	%g5,	%o1,	%l0
	fba	%fcc2,	loop_1440
	udivx	%i1,	0x1D05,	%l5
	movrgz	%o7,	%o2,	%i5
	movrne	%i0,	0x3D2,	%g2
loop_1440:
	nop
	setx	0x005C6F59,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	add	%l6,	0x14FF,	%i2
	fnot2s	%f20,	%f11
	set	0x70, %g6
	ldswa	[%l7 + %g6] 0x14,	%o6
	fmovsg	%icc,	%f27,	%f21
	taddcctv	%g6,	%i6,	%o0
	array16	%l3,	%l2,	%i3
	st	%f19,	[%l7 + 0x74]
	tcs	%xcc,	0x2
	movpos	%xcc,	%l1,	%g7
	bl,pt	%icc,	loop_1441
	fexpand	%f27,	%f30
	orcc	%o5,	%g1,	%g3
	fnors	%f6,	%f26,	%f27
loop_1441:
	sethi	0x0AA7,	%i7
	set	0x28, %o7
	ldswa	[%l7 + %o7] 0x80,	%g4
	and	%o3,	%o4,	%i4
	ldub	[%l7 + 0x23],	%g5
	fmuld8ulx16	%f5,	%f18,	%f8
	fble,a	%fcc3,	loop_1442
	nop
	fitos	%f7,	%f7
	fstox	%f7,	%f22
	alignaddrl	%l4,	%o1,	%i1
	tcc	%icc,	0x6
loop_1442:
	xor	%l5,	%o7,	%o2
	fpadd16	%f14,	%f24,	%f10
	movvs	%xcc,	%i5,	%i0
	fornot1	%f24,	%f0,	%f22
	membar	0x4E
	sir	0x0DB8
	and	%l0,	0x00FA,	%g2
	alignaddr	%i2,	%o6,	%g6
	nop
	setx	loop_1443,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcs	%icc,	0x4
	fmul8sux16	%f28,	%f10,	%f8
	brgez	%i6,	loop_1444
loop_1443:
	orcc	%o0,	0x1831,	%l3
	udiv	%l2,	0x14B8,	%i3
	bneg	%icc,	loop_1445
loop_1444:
	andncc	%l6,	%g7,	%o5
	srl	%g1,	%g3,	%i7
	movcc	%xcc,	%l1,	%g4
loop_1445:
	add	%o4,	%i4,	%o3
	srl	%l4,	0x12,	%g5
	lduh	[%l7 + 0x72],	%o1
	be,a	%xcc,	loop_1446
	pdist	%f20,	%f16,	%f8
	bvc,pn	%xcc,	loop_1447
	fcmpne16	%f24,	%f30,	%l5
loop_1446:
	fmovsl	%xcc,	%f23,	%f29
	fxnors	%f14,	%f15,	%f21
loop_1447:
	brgez	%i1,	loop_1448
	movg	%icc,	%o7,	%o2
	tge	%xcc,	0x6
	tg	%icc,	0x7
loop_1448:
	fones	%f5
	set	0x6C, %l5
	stha	%i5,	[%l7 + %l5] 0x22
	membar	#Sync
	sethi	0x06D2,	%l0
	fone	%f12
	lduh	[%l7 + 0x5C],	%g2
	tvc	%xcc,	0x0
	ldsb	[%l7 + 0x2C],	%i2
	fmul8x16al	%f5,	%f10,	%f6
	sdivcc	%o6,	0x073A,	%g6
	movg	%icc,	%i0,	%i6
	flush	%l7 + 0x18
	movre	%l3,	0x361,	%o0
	bcs,pt	%icc,	loop_1449
	edge16n	%i3,	%l6,	%l2
	wr	%g0,	0xea,	%asi
	stxa	%g7,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1449:
	nop
	set	0x54, %o4
	stwa	%g1,	[%l7 + %o4] 0x14
	tcc	%icc,	0x0
	sdivcc	%o5,	0x1523,	%i7
	movvc	%icc,	%g3,	%l1
	tl	%icc,	0x7
	movvc	%icc,	%g4,	%i4
	udiv	%o4,	0x1EFB,	%l4
	ldub	[%l7 + 0x24],	%o3
	edge16n	%g5,	%l5,	%i1
	array16	%o1,	%o7,	%i5
	tcc	%icc,	0x6
	fnegs	%f6,	%f27
	fbul,a	%fcc1,	loop_1450
	sdiv	%l0,	0x1CE4,	%g2
	orcc	%i2,	%o2,	%g6
	tge	%xcc,	0x4
loop_1450:
	srax	%i0,	0x0E,	%i6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l3,	%o6
	sub	%o0,	%i3,	%l6
	nop
	fitos	%f30,	%f21
	sdivx	%g7,	0x18D5,	%g1
	fnot2	%f8,	%f18
	andn	%o5,	0x0476,	%i7
	nop
	set	0x20, %g3
	ldx	[%l7 + %g3],	%l2
	srl	%l1,	0x08,	%g4
	fmovs	%f17,	%f22
	edge8ln	%g3,	%i4,	%o4
	fbl	%fcc1,	loop_1451
	nop
	setx loop_1452, %l0, %l1
	jmpl %l1, %l4
	xnor	%o3,	0x1DA5,	%l5
	fmovsneg	%icc,	%f28,	%f10
loop_1451:
	xor	%i1,	0x154D,	%o1
loop_1452:
	srl	%o7,	0x17,	%i5
	fmovdleu	%icc,	%f2,	%f12
	umulcc	%g5,	%l0,	%i2
	movrlz	%g2,	0x00C,	%o2
	tneg	%xcc,	0x1
	tgu	%xcc,	0x6
	andcc	%i0,	0x1963,	%i6
	fbge,a	%fcc1,	loop_1453
	sllx	%l3,	%g6,	%o0
	fmul8sux16	%f10,	%f22,	%f2
	fpmerge	%f26,	%f0,	%f22
loop_1453:
	alignaddrl	%o6,	%l6,	%g7
	array8	%g1,	%i3,	%i7
	movge	%xcc,	%l2,	%o5
	wr	%g0,	0x88,	%asi
	stwa	%g4,	[%l7 + 0x6C] %asi
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x04,	%g3,	%l1
	brz,a	%i4,	loop_1454
	sra	%o4,	0x13,	%l4
	ldx	[%l7 + 0x70],	%l5
	edge32	%i1,	%o1,	%o7
loop_1454:
	nop
	set	0x34, %i6
	ldswa	[%l7 + %i6] 0x04,	%i5
	fpsub16	%f2,	%f14,	%f22
	movge	%icc,	%g5,	%l0
	move	%xcc,	%o3,	%i2
	fandnot2s	%f18,	%f20,	%f1
	edge32n	%g2,	%i0,	%i6
	movleu	%xcc,	%o2,	%g6
	fpadd32s	%f27,	%f10,	%f16
	ldd	[%l7 + 0x10],	%l2
	bcc	loop_1455
	edge16ln	%o6,	%o0,	%l6
	array32	%g7,	%i3,	%i7
	ld	[%l7 + 0x3C],	%f14
loop_1455:
	edge32	%g1,	%l2,	%o5
	umulcc	%g4,	%l1,	%i4
	fones	%f6
	udivx	%g3,	0x03BC,	%o4
	andncc	%l5,	%i1,	%l4
	fbule,a	%fcc0,	loop_1456
	fornot2s	%f28,	%f7,	%f7
	ldsh	[%l7 + 0x6A],	%o7
	orcc	%o1,	%i5,	%g5
loop_1456:
	movcc	%xcc,	%l0,	%o3
	edge16n	%i2,	%i0,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g2,	%g6,	%l3
	fpsub32s	%f3,	%f9,	%f20
	taddcc	%o6,	%o0,	%l6
	fbuge	%fcc2,	loop_1457
	udivx	%g7,	0x0D79,	%o2
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x15,	%f0
loop_1457:
	stbar
	fbg	%fcc3,	loop_1458
	tl	%icc,	0x7
	udiv	%i7,	0x04C1,	%g1
	mulx	%l2,	0x10FE,	%i3
loop_1458:
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f6
	fxtod	%f6,	%f20
	membar	0x18
	xnorcc	%g4,	0x0C12,	%l1
	fnot2s	%f16,	%f14
	udivx	%o5,	0x0C32,	%g3
	bgu,pn	%icc,	loop_1459
	umulcc	%i4,	%l5,	%o4
	movneg	%xcc,	%i1,	%l4
	set	0x70, %g5
	prefetcha	[%l7 + %g5] 0x14,	 0x2
loop_1459:
	taddcctv	%o7,	%g5,	%l0
	tvc	%xcc,	0x7
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o3
	fmovdpos	%xcc,	%f20,	%f13
	fmovrdlz	%i5,	%f8,	%f18
	fmovsl	%icc,	%f19,	%f25
	ldd	[%l7 + 0x40],	%i0
	movrne	%i6,	%g2,	%i2
	movne	%icc,	%g6,	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o0,	%o6
	movrlz	%l6,	%g7,	%o2
	fnand	%f4,	%f28,	%f22
	movcs	%xcc,	%i7,	%g1
	tcs	%icc,	0x0
	sethi	0x0672,	%i3
	fnands	%f23,	%f13,	%f29
	mulx	%l2,	0x0751,	%l1
	sir	0x164A
	udivx	%o5,	0x1180,	%g3
	fmovd	%f10,	%f26
	fpadd32s	%f5,	%f21,	%f22
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7D] %asi,	%i4
	tpos	%icc,	0x6
	tg	%xcc,	0x3
	brlz	%g4,	loop_1460
	movg	%icc,	%l5,	%i1
	subccc	%o4,	0x040F,	%l4
	nop
	setx loop_1461, %l0, %l1
	jmpl %l1, %o7
loop_1460:
	sll	%g5,	%l0,	%o1
	fmovrdgz	%o3,	%f20,	%f28
	sth	%i5,	[%l7 + 0x3C]
loop_1461:
	nop
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	bg,pn	%icc,	loop_1462
	fmovrslez	%g2,	%f29,	%f17
	stx	%i0,	[%l7 + 0x18]
	for	%f2,	%f6,	%f26
loop_1462:
	fxnor	%f0,	%f26,	%f6
	movneg	%icc,	%i2,	%l3
	nop
	set	0x34, %o1
	prefetch	[%l7 + %o1],	 0x0
	movvc	%icc,	%g6,	%o6
	edge32l	%l6,	%o0,	%o2
	bcc,pt	%icc,	loop_1463
	sethi	0x097F,	%i7
	fnot1	%f4,	%f0
	ldsh	[%l7 + 0x76],	%g1
loop_1463:
	fsrc2	%f4,	%f12
	fnot2	%f10,	%f28
	sll	%g7,	0x13,	%l2
	edge8l	%l1,	%o5,	%i3
	sllx	%g3,	0x01,	%i4
	fbue	%fcc3,	loop_1464
	fnor	%f0,	%f26,	%f2
	and	%l5,	0x1589,	%i1
	tcc	%xcc,	0x6
loop_1464:
	fmovrdne	%o4,	%f10,	%f12
	lduh	[%l7 + 0x60],	%l4
	bge,pn	%icc,	loop_1465
	and	%g4,	0x1378,	%o7
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x2B] %asi,	%l0
loop_1465:
	ba,a,pn	%icc,	loop_1466
	movrne	%o1,	0x091,	%g5
	srlx	%o3,	%i6,	%i5
	sir	0x1A29
loop_1466:
	edge8	%g2,	%i2,	%l3
	faligndata	%f24,	%f12,	%f8
	orncc	%i0,	%g6,	%l6
	set	0x65, %g2
	lduba	[%l7 + %g2] 0x15,	%o0
	sdivcc	%o6,	0x0B9A,	%o2
	xnor	%g1,	%g7,	%i7
	bvc,a	loop_1467
	fmovrde	%l1,	%f6,	%f30
	movrne	%l2,	0x09F,	%o5
	ta	%icc,	0x1
loop_1467:
	movgu	%xcc,	%i3,	%i4
	ldx	[%l7 + 0x28],	%l5
	array8	%g3,	%i1,	%o4
	ldd	[%l7 + 0x60],	%f8
	nop
	setx loop_1468, %l0, %l1
	jmpl %l1, %l4
	movvc	%xcc,	%g4,	%l0
	edge16	%o7,	%g5,	%o3
	fxnors	%f1,	%f8,	%f22
loop_1468:
	array32	%i6,	%i5,	%g2
	edge8ln	%i2,	%l3,	%o1
	fxor	%f4,	%f16,	%f4
	movge	%icc,	%g6,	%l6
	movrne	%i0,	%o6,	%o0
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x16
	membar	#Sync
	fmovdge	%xcc,	%f4,	%f4
	nop
	fitos	%f3,	%f26
	fstox	%f26,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f14,	%f30,	%o2
	umul	%g7,	0x0D57,	%g1
	movpos	%icc,	%i7,	%l1
	edge16ln	%o5,	%i3,	%i4
	sdivcc	%l2,	0x0A9A,	%l5
	movn	%icc,	%g3,	%o4
	fbg,a	%fcc3,	loop_1469
	tg	%xcc,	0x3
	fmuld8sux16	%f22,	%f12,	%f10
	udiv	%i1,	0x1FEE,	%l4
loop_1469:
	nop
	setx	0xEE0268CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x41AAB6A7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f15,	%f15
	or	%l0,	%g4,	%o7
	movgu	%xcc,	%o3,	%g5
	fxor	%f26,	%f12,	%f26
	fbn,a	%fcc1,	loop_1470
	tne	%xcc,	0x6
	fsrc2	%f14,	%f10
	fone	%f0
loop_1470:
	addccc	%i5,	0x05F3,	%i6
	fpmerge	%f3,	%f23,	%f28
	tvs	%xcc,	0x2
	call	loop_1471
	edge8	%g2,	%i2,	%o1
	sllx	%g6,	0x16,	%l6
	tvs	%icc,	0x4
loop_1471:
	fba	%fcc2,	loop_1472
	nop
	fitos	%f1,	%f19
	fstox	%f19,	%f0
	fxtos	%f0,	%f1
	fbul,a	%fcc2,	loop_1473
	and	%i0,	0x0D6A,	%o6
loop_1472:
	movcc	%icc,	%o0,	%o2
	fbge,a	%fcc0,	loop_1474
loop_1473:
	fone	%f0
	tsubcctv	%g7,	0x125C,	%g1
	orn	%i7,	0x173E,	%l1
loop_1474:
	edge16ln	%l3,	%o5,	%i4
	nop
	setx	0x003BD58277DC8AFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9B60E5727B9EEC95,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f8,	%f14
	ta	%icc,	0x5
	mova	%xcc,	%i3,	%l5
	bcc,a	%icc,	loop_1475
	movne	%icc,	%l2,	%g3
	fabss	%f4,	%f22
	edge8	%o4,	%i1,	%l0
loop_1475:
	movneg	%xcc,	%g4,	%l4
	edge16l	%o3,	%o7,	%i5
	fbug	%fcc1,	loop_1476
	srl	%g5,	%i6,	%i2
	smul	%o1,	0x0997,	%g6
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3F] %asi,	%g2
loop_1476:
	edge32n	%i0,	%l6,	%o0
	fbu	%fcc1,	loop_1477
	fmovdvc	%xcc,	%f0,	%f21
	bl,pt	%xcc,	loop_1478
	ldd	[%l7 + 0x60],	%o2
loop_1477:
	fcmpeq32	%f10,	%f28,	%g7
	movleu	%xcc,	%g1,	%i7
loop_1478:
	tne	%icc,	0x2
	xorcc	%l1,	%l3,	%o6
	nop
	setx	0x359AF88E42230090,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x730EAA1D6C286B1D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f6,	%f22
	srl	%i4,	%i3,	%l5
	andcc	%l2,	%g3,	%o5
	movn	%xcc,	%i1,	%o4
	andn	%l0,	0x0C0A,	%l4
	fsrc2	%f30,	%f20
	tneg	%xcc,	0x7
	edge8ln	%g4,	%o3,	%o7
	tsubcctv	%g5,	%i5,	%i6
	tne	%icc,	0x6
	edge32l	%o1,	%g6,	%i2
	subccc	%i0,	%l6,	%o0
	fmovsvc	%xcc,	%f16,	%f16
	umul	%o2,	%g2,	%g1
	stw	%i7,	[%l7 + 0x34]
	sdivcc	%g7,	0x09A7,	%l3
	bcs,pn	%icc,	loop_1479
	sdiv	%l1,	0x1BE3,	%i4
	andncc	%o6,	%i3,	%l5
	edge32l	%g3,	%l2,	%i1
loop_1479:
	bvc	%xcc,	loop_1480
	movl	%icc,	%o5,	%o4
	sdivx	%l0,	0x1B77,	%l4
	tge	%icc,	0x0
loop_1480:
	andn	%o3,	0x1B98,	%g4
	edge8ln	%o7,	%i5,	%i6
	fmovsvc	%icc,	%f13,	%f18
	array8	%o1,	%g6,	%i2
	movvs	%icc,	%i0,	%l6
	ldsb	[%l7 + 0x1A],	%o0
	movcs	%xcc,	%g5,	%g2
	tgu	%xcc,	0x2
	smul	%o2,	0x114C,	%i7
	tl	%xcc,	0x6
	edge16n	%g1,	%g7,	%l3
	movneg	%xcc,	%i4,	%l1
	bvs,a,pt	%icc,	loop_1481
	nop
	fitos	%f6,	%f23
	fstox	%f23,	%f6
	fxtos	%f6,	%f12
	ta	%xcc,	0x7
	fbg	%fcc1,	loop_1482
loop_1481:
	fmovrdgez	%i3,	%f10,	%f26
	brlz	%l5,	loop_1483
	fabsd	%f16,	%f24
loop_1482:
	movn	%icc,	%g3,	%o6
	orn	%i1,	0x0BA5,	%o5
loop_1483:
	fnot2s	%f29,	%f12
	fbuge	%fcc0,	loop_1484
	fcmple16	%f22,	%f12,	%l2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x30] %asi,	%o4
loop_1484:
	tvc	%icc,	0x3
	nop
	setx	0x0EC2FF88,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x9344136C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f11,	%f17
	swap	[%l7 + 0x3C],	%l4
	udiv	%o3,	0x1908,	%l0
	nop
	setx	0x89EC053A4EA42B90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xBAF7FE0F0400D0DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f0,	%f10
	tle	%icc,	0x1
	movvc	%xcc,	%o7,	%i5
	fpsub16	%f22,	%f22,	%f12
	sdiv	%i6,	0x0214,	%o1
	movleu	%icc,	%g6,	%i2
	fmovdne	%icc,	%f1,	%f13
	udiv	%g4,	0x1927,	%i0
	movn	%xcc,	%o0,	%g5
	edge8	%g2,	%l6,	%o2
	fmovdvc	%icc,	%f4,	%f16
	movle	%icc,	%g1,	%i7
	edge32ln	%g7,	%i4,	%l1
	and	%l3,	0x1645,	%l5
	movl	%icc,	%i3,	%o6
	fnot2s	%f7,	%f1
	movge	%icc,	%i1,	%g3
	movvc	%xcc,	%l2,	%o4
	movneg	%icc,	%l4,	%o5
	fbo,a	%fcc2,	loop_1485
	te	%icc,	0x1
	edge32	%l0,	%o7,	%i5
	orn	%i6,	%o1,	%o3
loop_1485:
	fbge	%fcc0,	loop_1486
	alignaddr	%i2,	%g4,	%i0
	orncc	%g6,	0x0FB8,	%g5
	brlez,a	%o0,	loop_1487
loop_1486:
	fpadd16s	%f29,	%f8,	%f23
	tl	%xcc,	0x2
	set	0x78, %i2
	lduwa	[%l7 + %i2] 0x81,	%g2
loop_1487:
	and	%l6,	%g1,	%i7
	sethi	0x0E74,	%g7
	andn	%i4,	0x1507,	%o2
	edge16	%l3,	%l5,	%l1
	set	0x30, %o0
	lduba	[%l7 + %o0] 0x89,	%o6
	brlz	%i1,	loop_1488
	and	%g3,	0x06AB,	%l2
	nop
	setx	0xBB26E08B8438B165,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xA06B4B06D71DC181,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f4,	%f8
	mulscc	%o4,	%i3,	%o5
loop_1488:
	tpos	%icc,	0x7
	addcc	%l0,	%o7,	%l4
	fxnors	%f10,	%f28,	%f24
	faligndata	%f4,	%f30,	%f18
	taddcctv	%i5,	%i6,	%o1
	ldd	[%l7 + 0x68],	%i2
	udiv	%o3,	0x0377,	%i0
	bpos,a	%xcc,	loop_1489
	ldsh	[%l7 + 0x2C],	%g4
	xnor	%g6,	0x14DE,	%g5
	movcs	%xcc,	%o0,	%l6
loop_1489:
	edge8ln	%g1,	%i7,	%g7
	edge32l	%g2,	%o2,	%i4
	tge	%icc,	0x6
	lduh	[%l7 + 0x58],	%l3
	faligndata	%f22,	%f14,	%f8
	alignaddrl	%l1,	%o6,	%i1
	faligndata	%f0,	%f26,	%f12
	fmovspos	%icc,	%f29,	%f30
	mova	%xcc,	%g3,	%l5
	movcc	%icc,	%o4,	%i3
	popc	0x0F28,	%l2
	movrlz	%o5,	0x219,	%o7
	bvc,a,pn	%xcc,	loop_1490
	bleu,pn	%xcc,	loop_1491
	movrlez	%l4,	%i5,	%i6
	orn	%o1,	%l0,	%i2
loop_1490:
	fcmple16	%f6,	%f14,	%i0
loop_1491:
	xor	%o3,	%g6,	%g4
	popc	0x0A2B,	%g5
	sll	%l6,	%g1,	%i7
	ldd	[%l7 + 0x78],	%o0
	nop
	setx	loop_1492,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%g7,	%o2,	%i4
	xor	%l3,	0x0C1A,	%g2
	movpos	%xcc,	%o6,	%l1
loop_1492:
	nop
	set	0x2A, %i0
	ldsha	[%l7 + %i0] 0x88,	%i1
	nop
	setx	0x4064FAFB374A79DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xA922711693561940,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f20,	%f22
	orncc	%g3,	%l5,	%o4
	tvs	%icc,	0x5
	fand	%f16,	%f14,	%f30
	tsubcc	%l2,	%i3,	%o7
	fbo	%fcc3,	loop_1493
	tne	%icc,	0x7
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x60] %asi,	%o5
loop_1493:
	tpos	%icc,	0x0
	edge32ln	%l4,	%i5,	%o1
	fxnor	%f2,	%f20,	%f18
	orn	%i6,	0x05C7,	%l0
	nop
	fitos	%f13,	%f15
	fstod	%f15,	%f12
	fblg	%fcc0,	loop_1494
	tl	%xcc,	0x2
	sir	0x01F3
	edge8l	%i2,	%o3,	%i0
loop_1494:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f4,	%f14
	fbue,a	%fcc2,	loop_1495
	fcmple32	%f0,	%f2,	%g4
	edge32l	%g6,	%g5,	%g1
	tne	%icc,	0x3
loop_1495:
	fmovrslz	%l6,	%f0,	%f28
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x88,	%i6
	movre	%o0,	0x17B,	%o2
	fpsub16s	%f12,	%f31,	%f30
	fbne	%fcc1,	loop_1496
	tne	%icc,	0x6
	subccc	%i4,	0x0BC5,	%l3
	te	%xcc,	0x1
loop_1496:
	movleu	%icc,	%g2,	%o6
	sdivcc	%g7,	0x0E90,	%i1
	stx	%g3,	[%l7 + 0x30]
	nop
	fitod	%f4,	%f8
	or	%l5,	%l1,	%l2
	fmovsleu	%icc,	%f12,	%f11
	fbule,a	%fcc2,	loop_1497
	tgu	%xcc,	0x2
	fnors	%f4,	%f0,	%f0
	fbg,a	%fcc3,	loop_1498
loop_1497:
	nop
	setx	0xE8FB250C5043093D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	udivcc	%i3,	0x18F2,	%o7
	udiv	%o5,	0x016C,	%o4
loop_1498:
	ld	[%l7 + 0x64],	%f11
	tle	%xcc,	0x6
	andn	%l4,	0x17D0,	%o1
	fandnot2	%f8,	%f12,	%f22
	movcs	%icc,	%i6,	%l0
	ldx	[%l7 + 0x10],	%i2
	fmovdpos	%xcc,	%f17,	%f6
	edge8l	%o3,	%i0,	%g4
	andcc	%i5,	%g5,	%g1
	tcc	%xcc,	0x3
	nop
	setx	0x0A4C518CF627D8A5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f0
	flush	%l7 + 0x4C
	bcs	%icc,	loop_1499
	tsubcc	%l6,	0x15EC,	%i7
	movne	%icc,	%o0,	%g6
	brz	%i4,	loop_1500
loop_1499:
	tvs	%xcc,	0x4
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f8
	fmovrdlez	%o2,	%f6,	%f8
loop_1500:
	nop
	fitos	%f2,	%f0
	fstod	%f0,	%f12
	fpsub32	%f28,	%f4,	%f24
	sllx	%g2,	%o6,	%l3
	nop
	setx	0x926D2370D7DD10F0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f26
	stw	%g7,	[%l7 + 0x38]
	fpadd16s	%f31,	%f19,	%f6
	tge	%icc,	0x6
	edge16n	%g3,	%l5,	%l1
	edge16ln	%i1,	%l2,	%i3
	brlz,a	%o5,	loop_1501
	udivcc	%o4,	0x0F3E,	%l4
	bgu,pt	%xcc,	loop_1502
	fmul8sux16	%f20,	%f22,	%f26
loop_1501:
	andncc	%o1,	%o7,	%i6
	smulcc	%l0,	%i2,	%o3
loop_1502:
	movneg	%xcc,	%i0,	%i5
	fbule	%fcc3,	loop_1503
	fmovdcs	%icc,	%f21,	%f7
	brlez	%g5,	loop_1504
	move	%icc,	%g1,	%l6
loop_1503:
	tcs	%icc,	0x7
	nop
	setx	0xB064E33F,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
loop_1504:
	movpos	%xcc,	%g4,	%i7
	movrne	%g6,	%i4,	%o2
	call	loop_1505
	fbn,a	%fcc3,	loop_1506
	fornot1	%f8,	%f0,	%f22
	alignaddr	%o0,	%o6,	%l3
loop_1505:
	sethi	0x1FCE,	%g2
loop_1506:
	alignaddr	%g3,	%g7,	%l5
	srlx	%i1,	%l1,	%i3
	edge16n	%l2,	%o5,	%o4
	udivx	%o1,	0x18E4,	%l4
	and	%i6,	0x076E,	%o7
	array16	%l0,	%i2,	%o3
	edge8ln	%i0,	%i5,	%g1
	fbl	%fcc3,	loop_1507
	nop
	setx	loop_1508,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%g5,	%l6,	%i7
	popc	0x05B7,	%g6
loop_1507:
	nop
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
loop_1508:
	fpadd32s	%f30,	%f26,	%f25
	popc	%g4,	%o2
	ld	[%l7 + 0x64],	%f10
	fpackfix	%f26,	%f20
	mova	%xcc,	%o6,	%o0
	nop
	set	0x60, %i7
	ldx	[%l7 + %i7],	%g2
	tg	%xcc,	0x6
	fmovrdne	%g3,	%f28,	%f30
	te	%xcc,	0x7
	fmul8ulx16	%f2,	%f26,	%f24
	fxnors	%f1,	%f2,	%f6
	andcc	%g7,	%l3,	%l5
	ldd	[%l7 + 0x20],	%i0
	edge16ln	%l1,	%l2,	%i3
	movre	%o4,	%o1,	%l4
	fmovsvs	%xcc,	%f21,	%f30
	xorcc	%o5,	0x14D6,	%i6
	fbg	%fcc2,	loop_1509
	edge16l	%o7,	%i2,	%o3
	xor	%i0,	0x10CA,	%i5
	fbuge,a	%fcc3,	loop_1510
loop_1509:
	brnz,a	%g1,	loop_1511
	addcc	%g5,	0x0B2A,	%l0
	orn	%i7,	%g6,	%l6
loop_1510:
	alignaddrl	%g4,	%o2,	%i4
loop_1511:
	membar	0x53
	ta	%xcc,	0x0
	tneg	%xcc,	0x3
	fmovdg	%xcc,	%f20,	%f24
	edge16n	%o6,	%o0,	%g3
	andncc	%g7,	%l3,	%g2
	fmovdle	%icc,	%f7,	%f14
	te	%icc,	0x0
	taddcc	%l5,	%i1,	%l1
	movleu	%xcc,	%i3,	%o4
	nop
	setx	0x3C6F63B938F513BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f18
	addcc	%l2,	%o1,	%o5
	tpos	%icc,	0x1
	smulcc	%l4,	%i6,	%o7
	movpos	%xcc,	%i2,	%i0
	taddcc	%i5,	%o3,	%g1
	sll	%l0,	0x1A,	%i7
	nop
	fitos	%f9,	%f26
	fstod	%f26,	%f22
	fmul8sux16	%f8,	%f10,	%f4
	array16	%g6,	%l6,	%g4
	fmovdl	%icc,	%f16,	%f31
	subcc	%g5,	%o2,	%i4
	movrne	%o6,	0x346,	%g3
	sdivx	%g7,	0x0810,	%l3
	orncc	%g2,	%o0,	%i1
	tn	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc2,	loop_1512
	bl,a	%icc,	loop_1513
	smul	%l5,	%l1,	%i3
	fmuld8sux16	%f28,	%f25,	%f20
loop_1512:
	fbne	%fcc0,	loop_1514
loop_1513:
	bl,a	loop_1515
	sir	0x07CB
	tvs	%xcc,	0x4
loop_1514:
	fmovrslz	%o4,	%f13,	%f9
loop_1515:
	edge32ln	%l2,	%o1,	%o5
	xnor	%i6,	%l4,	%i2
	fmovsne	%xcc,	%f20,	%f18
	subc	%i0,	0x0E0D,	%o7
	set	0x3A, %g4
	ldsha	[%l7 + %g4] 0x14,	%i5
	addccc	%g1,	%l0,	%i7
	edge32l	%o3,	%l6,	%g4
	mova	%icc,	%g5,	%o2
	bne,a	loop_1516
	movrlz	%i4,	%o6,	%g6
	fnand	%f2,	%f6,	%f14
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x66] %asi,	%g3
loop_1516:
	movcc	%icc,	%g7,	%l3
	fpadd16	%f6,	%f24,	%f10
	movre	%o0,	0x221,	%g2
	nop
	fitos	%f9,	%f31
	fstoi	%f31,	%f28
	ble,a,pt	%icc,	loop_1517
	fcmpeq16	%f8,	%f26,	%l5
	lduh	[%l7 + 0x56],	%i1
	movrlz	%l1,	%i3,	%l2
loop_1517:
	bg,a	%xcc,	loop_1518
	srax	%o1,	%o4,	%i6
	edge32	%l4,	%i2,	%o5
	xorcc	%i0,	0x1C17,	%i5
loop_1518:
	fabss	%f10,	%f17
	brlz,a	%o7,	loop_1519
	umul	%g1,	%l0,	%i7
	array16	%l6,	%g4,	%g5
	add	%o2,	0x1C76,	%i4
loop_1519:
	fbu	%fcc0,	loop_1520
	fmovd	%f10,	%f6
	alignaddr	%o6,	%o3,	%g3
	edge16ln	%g7,	%l3,	%o0
loop_1520:
	sdiv	%g6,	0x19B0,	%g2
	fnand	%f26,	%f12,	%f22
	fmovsneg	%icc,	%f19,	%f30
	set	0x38, %i3
	stwa	%i1,	[%l7 + %i3] 0x81
	membar	0x47
	fpsub32s	%f2,	%f10,	%f22
	tgu	%icc,	0x7
	add	%l5,	0x18F8,	%l1
	set	0x52, %l1
	lduba	[%l7 + %l1] 0x18,	%i3
	edge16ln	%l2,	%o1,	%o4
	mulx	%l4,	0x1ABB,	%i6
	subc	%i2,	%o5,	%i5
	fmovrsgez	%i0,	%f5,	%f12
	nop
	setx	loop_1521,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%o7,	0x0263,	%g1
	movrlez	%i7,	0x064,	%l6
	ldsw	[%l7 + 0x0C],	%g4
loop_1521:
	bne,a	%icc,	loop_1522
	smul	%l0,	%o2,	%i4
	st	%f25,	[%l7 + 0x30]
	xorcc	%o6,	%g5,	%g3
loop_1522:
	movrgez	%o3,	%g7,	%l3
	sdivcc	%o0,	0x1963,	%g2
	stx	%g6,	[%l7 + 0x10]
	st	%f27,	[%l7 + 0x10]
	tvs	%xcc,	0x7
	tne	%icc,	0x5
	alignaddrl	%l5,	%i1,	%l1
	addccc	%l2,	0x1DC7,	%o1
	bgu	%xcc,	loop_1523
	andncc	%i3,	%l4,	%o4
	ta	%icc,	0x1
	sth	%i6,	[%l7 + 0x72]
loop_1523:
	fors	%f6,	%f25,	%f14
	xorcc	%o5,	0x1822,	%i5
	ld	[%l7 + 0x20],	%f25
	and	%i0,	0x1E57,	%i2
	subcc	%g1,	%i7,	%l6
	movn	%icc,	%o7,	%l0
	srax	%g4,	0x1A,	%i4
	set	0x18, %o5
	lduwa	[%l7 + %o5] 0x89,	%o2
	sllx	%o6,	%g5,	%o3
	fbne	%fcc2,	loop_1524
	nop
	fitod	%f2,	%f0
	fdtox	%f0,	%f30
	taddcc	%g3,	0x17F4,	%l3
	bne,pt	%icc,	loop_1525
loop_1524:
	orncc	%o0,	0x1F14,	%g7
	bvc	loop_1526
	fblg	%fcc3,	loop_1527
loop_1525:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g2,	0x0141,	%l5
loop_1526:
	fpack32	%f26,	%f24,	%f12
loop_1527:
	orncc	%g6,	%l1,	%i1
	bn,a	loop_1528
	tvc	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f30,	%f19,	%f8
loop_1528:
	fcmpne16	%f12,	%f26,	%l2
	fxnor	%f14,	%f4,	%f12
	tpos	%xcc,	0x2
	pdist	%f18,	%f30,	%f16
	fmovsleu	%xcc,	%f17,	%f31
	nop
	setx	0x512D91D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x49C40D60,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f18,	%f13
	for	%f22,	%f24,	%f4
	array32	%i3,	%l4,	%o4
	srax	%o1,	0x05,	%o5
	udivx	%i5,	0x1CBB,	%i0
	edge16n	%i2,	%i6,	%g1
	popc	%l6,	%i7
	fabsd	%f22,	%f0
	fbu	%fcc0,	loop_1529
	sethi	0x0B52,	%l0
	movrne	%o7,	%i4,	%g4
	fmuld8ulx16	%f24,	%f8,	%f30
loop_1529:
	nop
	setx	loop_1530,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx loop_1531, %l0, %l1
	jmpl %l1, %o6
	addc	%o2,	%o3,	%g3
	ta	%icc,	0x3
loop_1530:
	orn	%l3,	%o0,	%g7
loop_1531:
	nop
	set	0x14, %g7
	ldsha	[%l7 + %g7] 0x88,	%g5
	movcc	%xcc,	%l5,	%g2
	orcc	%g6,	0x047D,	%l1
	nop
	fitod	%f6,	%f0
	fdtoi	%f0,	%f22
	swap	[%l7 + 0x4C],	%l2
	movle	%xcc,	%i3,	%l4
	tn	%xcc,	0x7
	swap	[%l7 + 0x18],	%i1
	umulcc	%o4,	0x0511,	%o1
	fones	%f4
	fmovdge	%xcc,	%f24,	%f30
	alignaddrl	%i5,	%i0,	%o5
	movcc	%xcc,	%i6,	%i2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x54] %asi,	%f27
	movvs	%icc,	%l6,	%i7
	set	0x0C, %i1
	ldswa	[%l7 + %i1] 0x14,	%g1
	srlx	%o7,	%i4,	%l0
	fmovrde	%g4,	%f18,	%f12
	bcs,a	loop_1532
	fmul8x16al	%f27,	%f1,	%f2
	for	%f0,	%f14,	%f10
	mulscc	%o2,	0x0372,	%o6
loop_1532:
	ldstub	[%l7 + 0x50],	%g3
	edge16ln	%l3,	%o3,	%g7
	bpos,a,pn	%xcc,	loop_1533
	movcc	%icc,	%g5,	%l5
	nop
	setx	0xF63126B2F620195E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x06E258F76FB9888F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f14,	%f14
	and	%o0,	0x0030,	%g2
loop_1533:
	fmovdcs	%xcc,	%f3,	%f6
	mulscc	%l1,	0x1EE8,	%l2
	edge16ln	%g6,	%i3,	%l4
	brnz	%o4,	loop_1534
	movpos	%xcc,	%o1,	%i5
	nop
	setx	0x9F03DFADD547102C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xBFA4850699AEAAD3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f24,	%f16
	sub	%i1,	%i0,	%o5
loop_1534:
	udiv	%i6,	0x1C25,	%l6
	fbg	%fcc1,	loop_1535
	movrgz	%i2,	%g1,	%o7
	tn	%icc,	0x5
	andcc	%i4,	%i7,	%g4
loop_1535:
	tle	%icc,	0x1
	fxnor	%f16,	%f18,	%f30
	lduh	[%l7 + 0x60],	%o2
	tcc	%xcc,	0x7
	edge16n	%o6,	%l0,	%l3
	andcc	%g3,	0x1FF2,	%o3
	nop
	setx	0x384B36BD0060B010,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	bcc,a	loop_1536
	edge32l	%g7,	%l5,	%g5
	nop
	fitod	%f19,	%f30
	tl	%xcc,	0x0
loop_1536:
	srl	%g2,	0x18,	%o0
	ta	%icc,	0x4
	sub	%l1,	0x1FE6,	%g6
	smul	%l2,	%l4,	%o4
	fmovrsne	%o1,	%f7,	%f4
	nop
	setx	loop_1537,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdne	%i5,	%f28,	%f10
	fmovsleu	%xcc,	%f27,	%f2
	stw	%i3,	[%l7 + 0x1C]
loop_1537:
	fbn,a	%fcc0,	loop_1538
	ta	%xcc,	0x6
	sra	%i1,	0x1C,	%i0
	tvs	%icc,	0x1
loop_1538:
	smulcc	%i6,	0x179C,	%o5
	tl	%icc,	0x2
	stbar
	mulscc	%i2,	0x080E,	%l6
	tvs	%xcc,	0x0
	orncc	%g1,	%i4,	%o7
	andcc	%g4,	%o2,	%i7
	nop
	fitod	%f7,	%f16
	edge32n	%l0,	%l3,	%g3
	fbuge	%fcc0,	loop_1539
	sdiv	%o3,	0x0813,	%o6
	tsubcctv	%g7,	0x1B76,	%g5
	andn	%l5,	0x0EEA,	%o0
loop_1539:
	fmovrsgez	%g2,	%f10,	%f2
	alignaddrl	%l1,	%l2,	%g6
	wr	%g0,	0x22,	%asi
	stha	%l4,	[%l7 + 0x68] %asi
	membar	#Sync
	move	%xcc,	%o1,	%o4
	fpadd16	%f20,	%f26,	%f8
	nop
	setx	0x8DC3F78E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f25
	ldstub	[%l7 + 0x1C],	%i5
	bgu,a	loop_1540
	andcc	%i3,	%i0,	%i6
	xnor	%i1,	0x03EC,	%o5
	nop
	setx	loop_1541,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1540:
	fbule,a	%fcc0,	loop_1542
	stbar
	movrgez	%i2,	0x266,	%g1
loop_1541:
	fpsub16s	%f22,	%f19,	%f1
loop_1542:
	fornot2s	%f7,	%f10,	%f15
	bg,a,pt	%xcc,	loop_1543
	nop
	setx	0x3C3AB1DD889BAE66,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2B719E63CA433B30,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f24,	%f22
	fpackfix	%f26,	%f14
	fmovrsgez	%i4,	%f1,	%f18
loop_1543:
	bvs,a,pt	%xcc,	loop_1544
	tneg	%xcc,	0x0
	movrlez	%l6,	0x253,	%g4
	sra	%o2,	%o7,	%i7
loop_1544:
	fmovsvc	%icc,	%f20,	%f3
	fone	%f6
	bl	%icc,	loop_1545
	subccc	%l0,	%g3,	%l3
	nop
	fitod	%f12,	%f12
	fdtoi	%f12,	%f28
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x70] %asi,	%o2
loop_1545:
	nop
	fitod	%f10,	%f30
	fdtoi	%f30,	%f25
	fmovrsne	%g7,	%f22,	%f5
	addccc	%g5,	0x0EDC,	%l5
	set	0x4F, %l6
	ldstuba	[%l7 + %l6] 0x10,	%o6
	movg	%xcc,	%g2,	%l1
	fands	%f19,	%f0,	%f12
	membar	0x12
	movle	%icc,	%l2,	%o0
	andncc	%l4,	%o1,	%o4
	movcc	%icc,	%g6,	%i5
	sethi	0x1EFD,	%i0
	edge16ln	%i3,	%i1,	%i6
	movrlez	%o5,	%i2,	%i4
	sethi	0x1829,	%g1
	movgu	%xcc,	%g4,	%l6
	fmovrse	%o7,	%f2,	%f25
	fxor	%f22,	%f10,	%f4
	sdivcc	%o2,	0x176B,	%i7
	fmovsleu	%icc,	%f20,	%f19
	movvc	%icc,	%g3,	%l0
	tle	%xcc,	0x2
	bne,a,pt	%xcc,	loop_1546
	nop
	fitos	%f1,	%f0
	fstoi	%f0,	%f18
	bneg,pn	%xcc,	loop_1547
	nop
	setx	0x509E2E738F7820C4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x86BBABA9C66EA4E5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f22,	%f22
loop_1546:
	ldsw	[%l7 + 0x1C],	%o3
	or	%g7,	%l3,	%g5
loop_1547:
	movle	%icc,	%o6,	%l5
	nop
	setx loop_1548, %l0, %l1
	jmpl %l1, %g2
	andn	%l1,	0x0409,	%l2
	set	0x7E, %o3
	ldsba	[%l7 + %o3] 0x10,	%o0
loop_1548:
	fandnot2	%f2,	%f10,	%f20
	movpos	%xcc,	%l4,	%o1
	fmovrslz	%g6,	%f13,	%f22
	edge32n	%i5,	%i0,	%i3
	movneg	%icc,	%o4,	%i1
	srlx	%i6,	0x05,	%o5
	fcmpgt32	%f10,	%f30,	%i4
	sdivx	%i2,	0x0A13,	%g1
	alignaddr	%l6,	%g4,	%o2
	fmovdvc	%icc,	%f3,	%f17
	tpos	%xcc,	0x5
	sdivx	%o7,	0x1189,	%g3
	be,pn	%xcc,	loop_1549
	tcc	%xcc,	0x5
	nop
	setx	0xA859A3DD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x2BF54BB7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f0,	%f13
	tg	%xcc,	0x1
loop_1549:
	movre	%l0,	0x0D7,	%i7
	mulx	%o3,	0x0371,	%l3
	set	0x12, %o2
	lduba	[%l7 + %o2] 0x15,	%g5
	fcmple16	%f24,	%f12,	%o6
	subcc	%l5,	0x1F42,	%g2
	fmul8ulx16	%f2,	%f10,	%f18
	fbn	%fcc2,	loop_1550
	alignaddrl	%l1,	%l2,	%o0
	fpack16	%f8,	%f14
	movvs	%icc,	%g7,	%o1
loop_1550:
	stw	%l4,	[%l7 + 0x68]
	movrlez	%i5,	0x215,	%g6
	nop
	fitos	%f3,	%f30
	membar	0x30
	sdiv	%i0,	0x18E1,	%i3
	mova	%icc,	%i1,	%i6
	srax	%o5,	0x10,	%i4
	tcc	%icc,	0x6
	edge32n	%i2,	%g1,	%l6
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%g4
	te	%icc,	0x7
	tg	%xcc,	0x0
	array8	%o2,	%o7,	%g3
	mova	%icc,	%o4,	%i7
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%l0,	%l3
	tne	%xcc,	0x7
	te	%xcc,	0x4
	te	%icc,	0x2
	movrlz	%o3,	0x25D,	%g5
	fandnot1	%f28,	%f18,	%f4
	movrgz	%o6,	0x375,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc2,	loop_1551
	movpos	%icc,	%l5,	%l2
	srl	%o0,	0x0F,	%g7
	movne	%xcc,	%l1,	%l4
loop_1551:
	add	%o1,	%i5,	%i0
	sra	%i3,	0x10,	%i1
	taddcctv	%i6,	%g6,	%i4
	sir	0x0E78
	fcmpne32	%f12,	%f18,	%i2
	addc	%g1,	0x0340,	%o5
	ta	%icc,	0x1
	nop
	set	0x28, %i4
	ldx	[%l7 + %i4],	%g4
	nop
	setx	loop_1552,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x2
	ldd	[%l7 + 0x68],	%o2
	edge32l	%l6,	%o7,	%o4
loop_1552:
	fcmpeq16	%f26,	%f18,	%g3
	smulcc	%l0,	0x0928,	%i7
	fbl	%fcc1,	loop_1553
	edge32ln	%o3,	%l3,	%g5
	nop
	set	0x17, %l3
	stb	%g2,	[%l7 + %l3]
	fmovdle	%xcc,	%f8,	%f25
loop_1553:
	mova	%icc,	%o6,	%l5
	xnorcc	%o0,	0x196F,	%g7
	xnor	%l1,	%l4,	%o1
	andn	%l2,	0x0EA0,	%i0
	fmovsvc	%icc,	%f11,	%f12
	movl	%xcc,	%i3,	%i5
	udivcc	%i1,	0x1678,	%g6
	fmovsneg	%xcc,	%f22,	%f15
	and	%i6,	%i2,	%g1
	te	%icc,	0x3
	nop
	setx	loop_1554,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x0
	movrlez	%i4,	%g4,	%o5
	fmovdl	%xcc,	%f8,	%f9
loop_1554:
	fbu	%fcc3,	loop_1555
	nop
	fitos	%f3,	%f3
	fstod	%f3,	%f2
	set	0x54, %l0
	sta	%f0,	[%l7 + %l0] 0x88
loop_1555:
	nop
	wr	%g0,	0x81,	%asi
	stxa	%l6,	[%l7 + 0x68] %asi
	membar	0x23
	fnot2	%f0,	%f4
	fpack16	%f30,	%f23
	edge16	%o7,	%o4,	%o2
	fmovdg	%xcc,	%f26,	%f15
	fmovdn	%xcc,	%f23,	%f18
	bn	%xcc,	loop_1556
	edge16n	%g3,	%i7,	%l0
	nop
	setx	0x39F9AD4042225289,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x6696BF4995C660D2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f2,	%f24
	fcmple16	%f26,	%f8,	%o3
loop_1556:
	lduh	[%l7 + 0x60],	%l3
	movcc	%xcc,	%g5,	%o6
	bvs,pn	%xcc,	loop_1557
	st	%f31,	[%l7 + 0x68]
	bcs,a,pt	%icc,	loop_1558
	fmul8ulx16	%f24,	%f0,	%f6
loop_1557:
	fornot2s	%f14,	%f25,	%f10
	brgz,a	%l5,	loop_1559
loop_1558:
	fmovrdgz	%g2,	%f26,	%f2
	fabss	%f14,	%f5
	fsrc1	%f4,	%f0
loop_1559:
	udivx	%g7,	0x18A2,	%l1
	fmul8x16	%f8,	%f14,	%f8
	fmovsvc	%icc,	%f27,	%f18
	movne	%xcc,	%o0,	%o1
	ba,a	loop_1560
	addc	%l2,	0x057F,	%l4
	tpos	%xcc,	0x4
	fcmpeq16	%f24,	%f16,	%i3
loop_1560:
	edge8ln	%i0,	%i1,	%i5
	nop
	fitos	%f13,	%f26
	fstox	%f26,	%f6
	fands	%f7,	%f7,	%f26
	set	0x7C, %l2
	lda	[%l7 + %l2] 0x81,	%f14
	array8	%g6,	%i2,	%i6
	array32	%i4,	%g1,	%o5
	fmovrdlez	%g4,	%f28,	%f12
	subcc	%l6,	%o7,	%o2
	movneg	%icc,	%g3,	%o4
	lduh	[%l7 + 0x1E],	%i7
	membar	0x05
	sdivx	%l0,	0x1398,	%l3
	set	0x08, %g6
	swapa	[%l7 + %g6] 0x88,	%g5
	fmovdpos	%xcc,	%f20,	%f22
	bleu,a	%icc,	loop_1561
	bg	loop_1562
	te	%icc,	0x6
	movneg	%xcc,	%o3,	%o6
loop_1561:
	edge16n	%g2,	%g7,	%l1
loop_1562:
	fnegs	%f0,	%f29
	movre	%l5,	%o0,	%o1
	fmovdl	%icc,	%f18,	%f22
	xorcc	%l2,	0x1EC7,	%i3
	and	%i0,	0x0E57,	%l4
	subc	%i1,	0x1E6A,	%g6
	tpos	%icc,	0x7
	movrgz	%i5,	%i2,	%i4
	ta	%xcc,	0x0
	ldub	[%l7 + 0x46],	%i6
	tsubcc	%o5,	0x1434,	%g1
	andcc	%g4,	%o7,	%l6
	nop
	setx	loop_1563,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o2,	%g3,	%i7
	movcc	%xcc,	%l0,	%o4
loop_1563:
	ldsb	[%l7 + 0x5A],	%l3
	fpackfix	%f18,	%f27
	xor	%g5,	0x0986,	%o6
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf8,	%f16
	udivcc	%o3,	0x1CF7,	%g2
	edge8ln	%g7,	%l1,	%o0
	fmovdvs	%icc,	%f9,	%f13
	fmovdcs	%icc,	%f27,	%f1
	udivx	%o1,	0x0D68,	%l2
	ldd	[%l7 + 0x68],	%f2
	nop
	setx	0x69056652,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x1611C559,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f12,	%f9
	popc	%l5,	%i0
	bg,pt	%icc,	loop_1564
	faligndata	%f28,	%f6,	%f18
	or	%l4,	0x0864,	%i1
	subccc	%i3,	%i5,	%i2
loop_1564:
	xorcc	%g6,	%i6,	%i4
	edge16l	%o5,	%g1,	%g4
	pdist	%f18,	%f22,	%f2
	movgu	%xcc,	%o7,	%l6
	nop
	setx	0x3767B66BBBBFBF3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x8B4601CFA2A8009F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f6,	%f2
	movrgz	%o2,	%i7,	%g3
	sir	0x0991
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%icc,	%f22,	%f7
	movrgz	%l0,	%l3,	%g5
	sethi	0x0E3B,	%o6
	nop
	fitod	%f12,	%f2
	fdtoi	%f2,	%f0
	movrgez	%o4,	%o3,	%g2
	tsubcctv	%l1,	%o0,	%o1
	fmovsa	%xcc,	%f25,	%f21
	tpos	%icc,	0x0
	tleu	%xcc,	0x2
	fmovscc	%icc,	%f22,	%f10
	bvs,a,pt	%xcc,	loop_1565
	bcs,a	%xcc,	loop_1566
	nop
	setx	loop_1567,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%xcc,	0x0
loop_1565:
	movge	%xcc,	%l2,	%g7
loop_1566:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x14] %asi,	%i0
loop_1567:
	fbu,a	%fcc3,	loop_1568
	sth	%l5,	[%l7 + 0x72]
	orncc	%i1,	%i3,	%i5
	movpos	%xcc,	%i2,	%l4
loop_1568:
	nop
	fitod	%f20,	%f12
	addc	%g6,	%i6,	%i4
	wr	%g0,	0x23,	%asi
	stba	%g1,	[%l7 + 0x4C] %asi
	membar	#Sync
	fone	%f18
	xorcc	%o5,	%g4,	%l6
	fzero	%f12
	array32	%o2,	%o7,	%g3
	movrne	%l0,	0x1FE,	%l3
	movrgez	%i7,	0x2E7,	%g5
	srl	%o6,	0x1F,	%o3
	fmovrde	%o4,	%f18,	%f20
	nop
	setx	loop_1569,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fabss	%f6,	%f2
	fcmpne16	%f0,	%f20,	%l1
	fmovdne	%xcc,	%f16,	%f1
loop_1569:
	xnorcc	%g2,	%o1,	%o0
	fba,a	%fcc2,	loop_1570
	tn	%xcc,	0x6
	xor	%l2,	0x1457,	%g7
	fmovsleu	%xcc,	%f15,	%f24
loop_1570:
	movn	%icc,	%i0,	%i1
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x19,	%f16
	tvc	%xcc,	0x0
	orncc	%l5,	%i3,	%i5
	tge	%xcc,	0x2
	tpos	%icc,	0x3
	for	%f16,	%f2,	%f10
	tge	%xcc,	0x6
	sir	0x1A96
	tg	%xcc,	0x1
	fbe	%fcc2,	loop_1571
	tpos	%icc,	0x1
	sub	%i2,	0x0AE2,	%g6
	orn	%l4,	%i6,	%g1
loop_1571:
	move	%icc,	%o5,	%i4
	nop
	fitod	%f6,	%f4
	fdtos	%f4,	%f21
	lduh	[%l7 + 0x64],	%g4
	edge16	%o2,	%o7,	%g3
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
	xnor	%l3,	%i7,	%g5
	fbuge	%fcc1,	loop_1572
	tpos	%xcc,	0x7
	fpadd32	%f14,	%f6,	%f14
	fandnot2	%f28,	%f2,	%f16
loop_1572:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	udivcc	%o6,	0x16C8,	%l0
	movre	%o4,	0x15F,	%o3
	fmul8ulx16	%f14,	%f2,	%f30
	movvs	%icc,	%l1,	%g2
	wr	%g0,	0x04,	%asi
	sta	%f28,	[%l7 + 0x68] %asi
	xnorcc	%o0,	%o1,	%l2
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
	fbue,a	%fcc2,	loop_1574
	tpos	%xcc,	0x2
	or	%i0,	0x18AD,	%i1
loop_1573:
	movle	%icc,	%l5,	%g7
loop_1574:
	bn	loop_1575
	tge	%xcc,	0x4
	faligndata	%f4,	%f28,	%f20
	bvs,a	%icc,	loop_1576
loop_1575:
	movle	%xcc,	%i5,	%i2
	tleu	%icc,	0x4
	fpsub32	%f8,	%f4,	%f28
loop_1576:
	brz	%i3,	loop_1577
	sdivx	%l4,	0x0583,	%i6
	edge8	%g6,	%o5,	%g1
	membar	0x55
loop_1577:
	orn	%i4,	%g4,	%o2
	tg	%xcc,	0x4
	array8	%g3,	%o7,	%l6
	edge16	%l3,	%i7,	%o6
	fbl,a	%fcc2,	loop_1578
	movle	%icc,	%l0,	%g5
	fpackfix	%f18,	%f3
	set	0x48, %o4
	ldswa	[%l7 + %o4] 0x18,	%o3
loop_1578:
	sethi	0x16C5,	%o4
	ldub	[%l7 + 0x2A],	%l1
	fmovsge	%xcc,	%f19,	%f23
	orcc	%g2,	0x1DA1,	%o1
	tne	%xcc,	0x2
	bg,pt	%icc,	loop_1579
	brlz	%l2,	loop_1580
	sdivx	%o0,	0x15EB,	%i0
	and	%i1,	0x07CA,	%g7
loop_1579:
	smulcc	%l5,	0x1D2D,	%i5
loop_1580:
	taddcctv	%i2,	%l4,	%i3
	call	loop_1581
	srlx	%i6,	%o5,	%g6
	fmovdneg	%icc,	%f18,	%f29
	andncc	%i4,	%g4,	%g1
loop_1581:
	orncc	%g3,	%o2,	%l6
	sdivcc	%o7,	0x005F,	%i7
	umul	%o6,	%l0,	%l3
	sll	%g5,	%o4,	%l1
	umul	%o3,	0x0D5E,	%o1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x08] %asi,	%g2
	fmovsa	%icc,	%f11,	%f2
	tcs	%icc,	0x3
	addccc	%l2,	%o0,	%i1
	array8	%g7,	%l5,	%i0
	movrne	%i5,	0x17B,	%l4
	or	%i3,	%i6,	%o5
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x64] %asi,	%g6
	subccc	%i2,	%i4,	%g1
	fmul8sux16	%f2,	%f18,	%f26
	bcs,a,pt	%xcc,	loop_1582
	fbg	%fcc1,	loop_1583
	ta	%icc,	0x0
	swap	[%l7 + 0x60],	%g3
loop_1582:
	popc	0x1275,	%o2
loop_1583:
	array16	%l6,	%g4,	%o7
	brnz	%i7,	loop_1584
	movleu	%xcc,	%o6,	%l0
	movvs	%icc,	%l3,	%o4
	flush	%l7 + 0x0C
loop_1584:
	stbar
	fcmpgt16	%f10,	%f0,	%l1
	movne	%icc,	%o3,	%g5
	stx	%o1,	[%l7 + 0x78]
	array32	%g2,	%l2,	%i1
	fmuld8sux16	%f31,	%f7,	%f10
	taddcc	%o0,	0x1584,	%g7
	xor	%l5,	0x06B5,	%i0
	sdiv	%i5,	0x1E2E,	%l4
	nop
	fitod	%f6,	%f4
	fdtos	%f4,	%f17
	movn	%xcc,	%i6,	%i3
	ldx	[%l7 + 0x60],	%g6
	andcc	%i2,	%o5,	%g1
	andn	%g3,	0x1E4E,	%i4
	fbuge,a	%fcc1,	loop_1585
	udivcc	%o2,	0x1DA3,	%g4
	movleu	%xcc,	%o7,	%l6
	nop
	fitod	%f2,	%f0
	fdtoi	%f0,	%f11
loop_1585:
	nop
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x13] %asi,	%o6
	subccc	%l0,	%l3,	%i7
	fsrc2s	%f7,	%f11
	andncc	%l1,	%o4,	%g5
	movneg	%icc,	%o3,	%g2
	for	%f30,	%f6,	%f12
	nop
	setx	0x822E529E1D8E92FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xB2E9FEB6D226C2F0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f22,	%f30
	edge32n	%o1,	%l2,	%o0
	fmovsg	%xcc,	%f4,	%f23
	move	%icc,	%g7,	%l5
	nop
	setx	0x53898074,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xFDC34367,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f8,	%f12
	tg	%icc,	0x2
	movl	%icc,	%i1,	%i0
	fmovdcc	%icc,	%f19,	%f10
	udivcc	%i5,	0x1037,	%l4
	tvs	%icc,	0x7
	fone	%f24
	addcc	%i3,	%i6,	%i2
	nop
	setx	0xD715F366,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xA96013EC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f16,	%f11
	fble	%fcc1,	loop_1586
	movle	%xcc,	%g6,	%g1
	fabss	%f21,	%f2
	prefetch	[%l7 + 0x10],	 0x1
loop_1586:
	nop
	setx	0xB91C959D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f30
	ld	[%l7 + 0x58],	%f27
	fbl,a	%fcc2,	loop_1587
	movne	%icc,	%g3,	%o5
	movrgz	%o2,	%i4,	%g4
	tsubcctv	%l6,	%o6,	%l0
loop_1587:
	movge	%xcc,	%o7,	%l3
	edge8n	%i7,	%o4,	%l1
	fbul,a	%fcc2,	loop_1588
	fmovdg	%xcc,	%f29,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o3,	0x06C7,	%g5
loop_1588:
	fba,a	%fcc0,	loop_1589
	fmul8ulx16	%f20,	%f16,	%f8
	fmovscc	%xcc,	%f16,	%f30
	tge	%xcc,	0x3
loop_1589:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x66, %g3
	ldsha	[%l7 + %g3] 0x88,	%g2
	set	0x10, %l5
	stwa	%o1,	[%l7 + %l5] 0x80
	tvc	%xcc,	0x4
	fmovsvc	%xcc,	%f22,	%f13
	array16	%o0,	%l2,	%g7
	fone	%f8
	smul	%l5,	%i1,	%i0
	srax	%l4,	%i3,	%i6
	st	%f17,	[%l7 + 0x28]
	set	0x74, %i6
	ldsba	[%l7 + %i6] 0x19,	%i2
	edge16	%g6,	%g1,	%g3
	bl	%icc,	loop_1590
	bn,pn	%icc,	loop_1591
	srl	%o5,	0x10,	%i5
	flush	%l7 + 0x68
loop_1590:
	add	%i4,	0x18B2,	%o2
loop_1591:
	nop
	fitos	%f13,	%f27
	fstoi	%f27,	%f29
	udivcc	%g4,	0x119B,	%o6
	wr	%g0,	0xea,	%asi
	stwa	%l6,	[%l7 + 0x60] %asi
	membar	#Sync
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l0,	%o7
	fmovdcs	%xcc,	%f31,	%f10
	fbne	%fcc0,	loop_1592
	tsubcc	%i7,	0x0D48,	%o4
	edge32n	%l3,	%l1,	%g5
	fbn,a	%fcc3,	loop_1593
loop_1592:
	fmovrdlz	%g2,	%f28,	%f12
	fnor	%f28,	%f30,	%f12
	movpos	%icc,	%o3,	%o1
loop_1593:
	for	%f14,	%f10,	%f20
	movrne	%o0,	%g7,	%l2
	mulscc	%i1,	0x10F3,	%i0
	faligndata	%f28,	%f6,	%f0
	srl	%l5,	0x1E,	%l4
	fpack16	%f22,	%f24
	ldsh	[%l7 + 0x18],	%i6
	alignaddrl	%i2,	%g6,	%g1
	nop
	setx	loop_1594,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8	%i3,	%g3,	%i5
	srlx	%i4,	0x16,	%o5
	addccc	%o2,	0x1B75,	%g4
loop_1594:
	subc	%o6,	%l6,	%o7
	fmovscc	%icc,	%f18,	%f12
	tvc	%icc,	0x4
	add	%i7,	0x171D,	%o4
	fbuge,a	%fcc1,	loop_1595
	sir	0x1D4F
	fpack16	%f2,	%f20
	andn	%l3,	0x15DE,	%l1
loop_1595:
	movn	%xcc,	%g5,	%g2
	fpackfix	%f14,	%f17
	ble,a,pt	%icc,	loop_1596
	edge32ln	%o3,	%l0,	%o0
	srlx	%g7,	0x18,	%l2
	fmovrdgz	%i1,	%f14,	%f10
loop_1596:
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f4
	ldsh	[%l7 + 0x7A],	%o1
	ta	%icc,	0x0
	edge16n	%i0,	%l4,	%l5
	movge	%icc,	%i6,	%i2
	movcs	%icc,	%g1,	%g6
	movrgez	%g3,	0x31B,	%i3
	sra	%i4,	0x01,	%o5
	addc	%i5,	0x1E22,	%g4
	alignaddrl	%o6,	%o2,	%o7
	fcmple16	%f2,	%f28,	%i7
	subcc	%o4,	0x00C6,	%l3
	fnegs	%f0,	%f0
	sub	%l1,	%g5,	%l6
	edge8l	%o3,	%g2,	%l0
	bge,a,pn	%icc,	loop_1597
	alignaddrl	%g7,	%o0,	%i1
	edge32ln	%l2,	%o1,	%l4
	sth	%i0,	[%l7 + 0x40]
loop_1597:
	nop
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l5
	andncc	%i2,	%i6,	%g6
	tleu	%icc,	0x4
	fmuld8ulx16	%f17,	%f7,	%f22
	fandnot1s	%f1,	%f11,	%f7
	mova	%icc,	%g3,	%g1
	movg	%xcc,	%i3,	%i4
	nop
	setx	0x88FBFC7B9C8196EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f14
	udivcc	%o5,	0x093C,	%i5
	stx	%o6,	[%l7 + 0x60]
	tne	%icc,	0x2
	sllx	%g4,	0x18,	%o2
	edge32l	%i7,	%o4,	%l3
	umul	%o7,	%g5,	%l1
	fbule,a	%fcc3,	loop_1598
	xor	%l6,	%o3,	%l0
	edge8n	%g2,	%g7,	%i1
	subc	%o0,	0x05CD,	%o1
loop_1598:
	brlz	%l2,	loop_1599
	fcmple16	%f18,	%f16,	%l4
	fmovrdlez	%l5,	%f16,	%f20
	nop
	fitos	%f1,	%f30
	fstoi	%f30,	%f16
loop_1599:
	taddcc	%i0,	0x07D5,	%i6
	nop
	setx	0x206AF7A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x52] %asi,	%g6
	mulscc	%g3,	%g1,	%i2
	brnz	%i4,	loop_1600
	tvc	%icc,	0x2
	movleu	%xcc,	%o5,	%i3
	movge	%xcc,	%o6,	%i5
loop_1600:
	movleu	%icc,	%g4,	%o2
	be,pn	%icc,	loop_1601
	fpsub16s	%f2,	%f0,	%f20
	sra	%o4,	%l3,	%i7
	fba	%fcc0,	loop_1602
loop_1601:
	ld	[%l7 + 0x08],	%f3
	mulx	%o7,	0x0D2E,	%l1
	movre	%l6,	%o3,	%g5
loop_1602:
	tvs	%xcc,	0x7
	subcc	%g2,	%l0,	%i1
	movle	%xcc,	%o0,	%g7
	edge16l	%o1,	%l2,	%l5
	fandnot1s	%f18,	%f31,	%f16
	fzero	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i0,	0x07,	%l4
	sir	0x064E
	nop
	set	0x44, %o6
	lduw	[%l7 + %o6],	%g6
	fornot2	%f12,	%f10,	%f28
	ldx	[%l7 + 0x48],	%g3
	tn	%xcc,	0x5
	fone	%f14
	movrlz	%i6,	0x2FC,	%i2
	mulx	%g1,	0x1D47,	%o5
	tle	%icc,	0x0
	movrlez	%i3,	0x3EA,	%o6
	subccc	%i4,	0x1C4B,	%i5
	fpadd16	%f14,	%f12,	%f28
	nop
	setx	0x4DBD7757E051E24C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fnors	%f6,	%f3,	%f1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	smul	%o4,	0x0D70,	%g4
	tneg	%icc,	0x5
	movg	%icc,	%l3,	%i7
	nop
	setx	loop_1603,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orcc	%l1,	%l6,	%o7
	fcmpeq16	%f16,	%f2,	%o3
	be,a	%xcc,	loop_1604
loop_1603:
	xnorcc	%g5,	0x0B26,	%l0
	edge16	%i1,	%g2,	%g7
	movvs	%xcc,	%o0,	%o1
loop_1604:
	edge8l	%l5,	%i0,	%l4
	sllx	%l2,	%g6,	%g3
	mulx	%i6,	0x08E1,	%g1
	popc	0x11DC,	%o5
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i2
	udivcc	%i3,	0x08FD,	%o6
	fnor	%f14,	%f12,	%f26
	std	%f18,	[%l7 + 0x40]
	nop
	setx	loop_1605,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%i4,	%i5,	%o4
	tle	%xcc,	0x1
	movvc	%icc,	%g4,	%l3
loop_1605:
	membar	0x30
	movrgez	%i7,	%o2,	%l6
	movne	%xcc,	%o7,	%o3
	movcc	%xcc,	%g5,	%l1
	move	%icc,	%i1,	%g2
	fsrc1	%f6,	%f2
	movcs	%xcc,	%g7,	%l0
	orcc	%o0,	%l5,	%o1
	sdiv	%i0,	0x095C,	%l2
	bge,pt	%xcc,	loop_1606
	nop
	setx	loop_1607,	%l0,	%l1
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
	fbe	%fcc1,	loop_1608
loop_1606:
	fbl	%fcc0,	loop_1609
loop_1607:
	fpadd16	%f4,	%f30,	%f24
	edge16l	%g6,	%l4,	%i6
loop_1608:
	orn	%g1,	0x062C,	%g3
loop_1609:
	tn	%icc,	0x5
	fmovsneg	%xcc,	%f18,	%f20
	tne	%icc,	0x3
	fxnor	%f24,	%f12,	%f8
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	add	%i2,	0x0F3B,	%i3
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%o5
	movleu	%icc,	%i4,	%i5
	nop
	setx	0x40456B2F8F7958CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x776D7D12CA62B5AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f30,	%f8
	fpsub16s	%f15,	%f3,	%f29
	move	%icc,	%o4,	%o6
	andncc	%g4,	%l3,	%i7
	tpos	%icc,	0x7
	nop
	setx loop_1610, %l0, %l1
	jmpl %l1, %l6
	movcs	%xcc,	%o2,	%o7
	set	0x54, %o1
	ldsba	[%l7 + %o1] 0x10,	%o3
loop_1610:
	alignaddrl	%l1,	%g5,	%g2
	fzero	%f30
	sdivcc	%i1,	0x1F9B,	%g7
	fmovdne	%xcc,	%f8,	%f26
	wr	%g0,	0x04,	%asi
	stba	%l0,	[%l7 + 0x77] %asi
	faligndata	%f24,	%f16,	%f28
	sllx	%o0,	0x18,	%o1
	edge16	%l5,	%l2,	%i0
	tn	%icc,	0x4
	edge16ln	%l4,	%g6,	%g1
	edge16l	%i6,	%g3,	%i3
	edge8ln	%o5,	%i4,	%i2
	tsubcctv	%o4,	0x11A1,	%o6
	set	0x44, %g5
	stwa	%i5,	[%l7 + %g5] 0xea
	membar	#Sync
	movpos	%xcc,	%g4,	%i7
	tle	%xcc,	0x1
	lduw	[%l7 + 0x34],	%l3
	addc	%o2,	%l6,	%o3
	tl	%xcc,	0x1
	array8	%o7,	%g5,	%g2
	udivx	%i1,	0x09CF,	%l1
	tcs	%xcc,	0x2
	sdivx	%g7,	0x1128,	%l0
	sdivx	%o1,	0x02F7,	%o0
	tne	%icc,	0x2
	srlx	%l2,	%i0,	%l5
	fmovdl	%icc,	%f8,	%f3
	brz,a	%l4,	loop_1611
	nop
	setx	0xB0663C2F,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	movrlez	%g1,	0x1DB,	%i6
	srlx	%g3,	0x01,	%g6
loop_1611:
	tsubcc	%i3,	%o5,	%i4
	movrlz	%i2,	0x18D,	%o4
	sdivx	%o6,	0x141E,	%i5
	xorcc	%g4,	%l3,	%o2
	array32	%l6,	%i7,	%o7
	edge16l	%g5,	%g2,	%o3
	andn	%l1,	%g7,	%l0
	xorcc	%i1,	0x074D,	%o0
	tneg	%icc,	0x5
	fmovspos	%icc,	%f14,	%f6
	andn	%o1,	0x1E00,	%i0
	or	%l2,	%l4,	%g1
	fmovrsgz	%i6,	%f31,	%f14
	xnorcc	%l5,	%g3,	%i3
	sdivcc	%g6,	0x0E69,	%i4
	edge32	%i2,	%o5,	%o4
	fmovrdlz	%o6,	%f28,	%f26
	fba,a	%fcc1,	loop_1612
	ba,pt	%xcc,	loop_1613
	movcc	%xcc,	%g4,	%i5
	orcc	%l3,	0x0134,	%o2
loop_1612:
	edge8n	%l6,	%i7,	%g5
loop_1613:
	addc	%g2,	0x08CD,	%o3
	st	%f26,	[%l7 + 0x08]
	edge32	%l1,	%g7,	%l0
	taddcctv	%i1,	0x0530,	%o0
	movpos	%xcc,	%o1,	%o7
	sdivx	%l2,	0x0FA3,	%i0
	movcc	%icc,	%l4,	%i6
	fba	%fcc1,	loop_1614
	stw	%l5,	[%l7 + 0x08]
	tvs	%xcc,	0x0
	sth	%g3,	[%l7 + 0x54]
loop_1614:
	srl	%i3,	%g1,	%i4
	addccc	%i2,	%o5,	%g6
	bne,a,pt	%xcc,	loop_1615
	mova	%xcc,	%o4,	%g4
	movrlz	%i5,	0x0D7,	%o6
	sllx	%l3,	%o2,	%l6
loop_1615:
	movrgz	%g5,	%g2,	%i7
	bneg	%icc,	loop_1616
	call	loop_1617
	movl	%xcc,	%o3,	%g7
	bpos,a	%icc,	loop_1618
loop_1616:
	tcc	%icc,	0x1
loop_1617:
	bcs	%icc,	loop_1619
	edge8ln	%l0,	%i1,	%l1
loop_1618:
	fbule,a	%fcc1,	loop_1620
	fxor	%f10,	%f30,	%f12
loop_1619:
	tge	%icc,	0x2
	fcmpne32	%f14,	%f20,	%o0
loop_1620:
	alignaddr	%o1,	%o7,	%i0
	addcc	%l4,	0x18D2,	%i6
	tn	%xcc,	0x0
	alignaddrl	%l2,	%l5,	%i3
	alignaddrl	%g1,	%g3,	%i2
	udiv	%o5,	0x0495,	%i4
	fble	%fcc2,	loop_1621
	movrlz	%g6,	0x096,	%g4
	movleu	%icc,	%i5,	%o4
	xorcc	%l3,	%o2,	%l6
loop_1621:
	brlez,a	%g5,	loop_1622
	movcc	%xcc,	%g2,	%i7
	bn,a	%icc,	loop_1623
	fmovrslez	%o6,	%f9,	%f29
loop_1622:
	movge	%xcc,	%g7,	%l0
	fandnot1s	%f6,	%f16,	%f5
loop_1623:
	stw	%i1,	[%l7 + 0x4C]
	movrgz	%o3,	0x3B7,	%l1
	or	%o1,	%o7,	%o0
	addcc	%i0,	%l4,	%i6
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0xf0
	membar	#Sync
	nop
	setx loop_1624, %l0, %l1
	jmpl %l1, %l2
	brgz,a	%l5,	loop_1625
	or	%g1,	%g3,	%i3
	fmovsa	%icc,	%f16,	%f10
loop_1624:
	sll	%o5,	%i4,	%g6
loop_1625:
	fbl,a	%fcc3,	loop_1626
	tneg	%icc,	0x6
	movvs	%xcc,	%i2,	%g4
	nop
	fitod	%f4,	%f26
	fdtox	%f26,	%f0
loop_1626:
	fmovdn	%icc,	%f13,	%f28
	fcmple16	%f30,	%f22,	%o4
	fbe,a	%fcc0,	loop_1627
	brlz,a	%l3,	loop_1628
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x7
loop_1627:
	fmul8x16au	%f21,	%f14,	%f24
loop_1628:
	sdivx	%o2,	0x0D64,	%l6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x19,	%i5,	%g5
	fpadd16s	%f8,	%f11,	%f24
	sethi	0x1BCC,	%g2
	set	0x31, %i2
	lduba	[%l7 + %i2] 0x19,	%i7
	addc	%o6,	0x0D75,	%g7
	fcmple16	%f20,	%f6,	%i1
	fbo	%fcc0,	loop_1629
	fba,a	%fcc0,	loop_1630
	tle	%icc,	0x6
	bneg,a,pn	%icc,	loop_1631
loop_1629:
	sra	%o3,	0x0E,	%l0
loop_1630:
	fandnot1	%f26,	%f22,	%f30
	te	%xcc,	0x5
loop_1631:
	tcs	%icc,	0x4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x24] %asi,	%l1
	call	loop_1632
	te	%xcc,	0x0
	nop
	setx	loop_1633,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0xC1F75B85C18A37EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x214AA4BCE11F5390,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f14,	%f28
loop_1632:
	subc	%o7,	0x094F,	%o0
	movrne	%o1,	%i0,	%l4
loop_1633:
	movrne	%i6,	0x17E,	%l5
	tsubcctv	%l2,	%g3,	%g1
	alignaddrl	%o5,	%i4,	%g6
	edge32ln	%i3,	%g4,	%o4
	movne	%icc,	%i2,	%l3
	tcs	%icc,	0x2
	tsubcctv	%o2,	0x0BC8,	%i5
	bshuffle	%f28,	%f8,	%f8
	ldsw	[%l7 + 0x10],	%l6
	fornot1	%f28,	%f28,	%f16
	movgu	%icc,	%g5,	%i7
	smulcc	%o6,	0x062B,	%g7
	sethi	0x13BE,	%i1
	movpos	%icc,	%g2,	%o3
	movvs	%icc,	%l0,	%o7
	edge32l	%o0,	%l1,	%i0
	fxnor	%f10,	%f26,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l4,	%i6,	%o1
	edge8	%l2,	%g3,	%l5
	ldx	[%l7 + 0x08],	%o5
	edge16	%g1,	%i4,	%g6
	fmuld8ulx16	%f4,	%f2,	%f8
	udivcc	%g4,	0x0444,	%i3
	tgu	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	stwa	%i2,	[%l7 + 0x58] %asi
	bgu	loop_1634
	tcs	%xcc,	0x1
	sllx	%o4,	0x05,	%o2
	tneg	%xcc,	0x6
loop_1634:
	tneg	%icc,	0x6
	alignaddrl	%l3,	%l6,	%g5
	fbge,a	%fcc1,	loop_1635
	nop
	setx	loop_1636,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%icc,	0x6
	smul	%i5,	0x1AA0,	%o6
loop_1635:
	ldd	[%l7 + 0x68],	%f26
loop_1636:
	sethi	0x1625,	%i7
	tl	%xcc,	0x2
	fmovda	%icc,	%f27,	%f30
	nop
	setx	0x97BEEF70,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x2A855F7C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f6,	%f3
	array32	%i1,	%g2,	%o3
	wr	%g0,	0x18,	%asi
	sta	%f21,	[%l7 + 0x5C] %asi
	sdivx	%g7,	0x18D7,	%l0
	call	loop_1637
	fmul8ulx16	%f18,	%f14,	%f4
	subcc	%o0,	0x1E8A,	%l1
	brnz,a	%o7,	loop_1638
loop_1637:
	srax	%i0,	0x03,	%i6
	fbe,a	%fcc3,	loop_1639
	movpos	%xcc,	%l4,	%l2
loop_1638:
	fandnot2s	%f6,	%f0,	%f28
	udivx	%g3,	0x1C04,	%l5
loop_1639:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x70] %asi,	%o5
	brgez,a	%o1,	loop_1640
	fmovdvc	%xcc,	%f29,	%f18
	movg	%icc,	%g1,	%g6
	tg	%xcc,	0x6
loop_1640:
	edge32ln	%i4,	%g4,	%i3
	movge	%xcc,	%o4,	%i2
	umul	%l3,	%l6,	%o2
	bcc,a,pn	%xcc,	loop_1641
	srlx	%g5,	%o6,	%i5
	tvc	%icc,	0x2
	std	%f24,	[%l7 + 0x68]
loop_1641:
	fmovdneg	%xcc,	%f20,	%f20
	fpsub16	%f18,	%f22,	%f10
	orcc	%i1,	0x1C2B,	%g2
	tge	%xcc,	0x4
	fsrc2	%f12,	%f28
	fpack32	%f20,	%f16,	%f0
	nop
	set	0x40, %o0
	stx	%o3,	[%l7 + %o0]
	sdivx	%i7,	0x18EF,	%l0
	move	%xcc,	%g7,	%l1
	tle	%icc,	0x5
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x54] %asi,	%o0
	nop
	setx	0xB0696DDE,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	lduh	[%l7 + 0x6C],	%i0
	umul	%o7,	%i6,	%l2
	orncc	%l4,	%g3,	%o5
	bcs,a	loop_1642
	edge32	%l5,	%g1,	%o1
	addccc	%g6,	%g4,	%i4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%i3
loop_1642:
	bge,pt	%icc,	loop_1643
	movcs	%icc,	%i2,	%l3
	tle	%xcc,	0x0
	bcs	loop_1644
loop_1643:
	nop
	fitos	%f6,	%f10
	fstoi	%f10,	%f19
	fmuld8sux16	%f17,	%f5,	%f4
	tvs	%xcc,	0x0
loop_1644:
	nop
	setx	loop_1645,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcc	loop_1646
	std	%f6,	[%l7 + 0x10]
	add	%o4,	%l6,	%o2
loop_1645:
	fmovrse	%o6,	%f22,	%f21
loop_1646:
	sdiv	%g5,	0x1267,	%i5
	array16	%i1,	%o3,	%i7
	ldsw	[%l7 + 0x14],	%l0
	bgu,a	loop_1647
	fpadd16	%f26,	%f26,	%f26
	fnot1	%f10,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1647:
	fmul8sux16	%f30,	%f6,	%f2
	sdivcc	%g7,	0x14E2,	%l1
	movl	%xcc,	%g2,	%o0
	tne	%icc,	0x6
	bcc,pn	%icc,	loop_1648
	orcc	%o7,	0x0381,	%i6
	nop
	fitod	%f0,	%f2
	fdtos	%f2,	%f20
	brnz	%l2,	loop_1649
loop_1648:
	edge8n	%l4,	%g3,	%o5
	xorcc	%i0,	0x1443,	%g1
	fmovrse	%l5,	%f29,	%f5
loop_1649:
	nop
	setx	0xF67E227E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f8
	xnor	%g6,	%o1,	%i4
	edge16ln	%i3,	%i2,	%g4
	tl	%xcc,	0x0
	ld	[%l7 + 0x4C],	%f16
	sdiv	%o4,	0x06BC,	%l3
	andn	%l6,	0x04A6,	%o6
	be,a,pt	%xcc,	loop_1650
	orncc	%g5,	%i5,	%o2
	nop
	fitod	%f8,	%f6
	fdtos	%f6,	%f13
	ld	[%l7 + 0x44],	%f9
loop_1650:
	movn	%icc,	%o3,	%i7
	bvc,a,pt	%icc,	loop_1651
	fbu	%fcc0,	loop_1652
	xnor	%i1,	0x0756,	%l0
	tcs	%icc,	0x2
loop_1651:
	fbue	%fcc3,	loop_1653
loop_1652:
	tleu	%icc,	0x2
	tne	%icc,	0x0
	bne,a,pt	%icc,	loop_1654
loop_1653:
	and	%g7,	0x181B,	%l1
	prefetch	[%l7 + 0x48],	 0x0
	fmovd	%f12,	%f4
loop_1654:
	or	%g2,	0x0314,	%o7
	movge	%icc,	%o0,	%l2
	set	0x54, %g2
	sta	%f9,	[%l7 + %g2] 0x88
	movpos	%xcc,	%l4,	%g3
	subc	%i6,	0x0428,	%o5
	tn	%xcc,	0x7
	fmovdn	%xcc,	%f9,	%f13
	fcmpgt16	%f14,	%f12,	%i0
	movle	%xcc,	%g1,	%g6
	array16	%l5,	%i4,	%o1
	fble	%fcc0,	loop_1655
	fbo,a	%fcc1,	loop_1656
	bvs,pt	%icc,	loop_1657
	edge16l	%i2,	%g4,	%i3
loop_1655:
	movvc	%icc,	%l3,	%l6
loop_1656:
	movrlez	%o4,	%g5,	%i5
loop_1657:
	fabsd	%f12,	%f8
	fmovsa	%xcc,	%f3,	%f6
	fmovse	%xcc,	%f20,	%f26
	brgez	%o6,	loop_1658
	tle	%xcc,	0x4
	fpsub16	%f6,	%f0,	%f0
	movrgez	%o2,	%i7,	%o3
loop_1658:
	and	%i1,	0x0816,	%g7
	fmovrdlez	%l0,	%f30,	%f18
	fmovdpos	%xcc,	%f2,	%f6
	fmovdleu	%xcc,	%f11,	%f27
	set	0x3f0, %i0
	nop 	! 	nop 	! 	ldxa	[%g0 + %i0] 0x40,	%l1 ripped by fixASI40.pl ripped by fixASI40.pl
	tl	%icc,	0x6
	brlz,a	%g2,	loop_1659
	srax	%o0,	0x02,	%l2
	fmovd	%f18,	%f2
	nop
	set	0x38, %g1
	lduw	[%l7 + %g1],	%o7
loop_1659:
	sllx	%g3,	0x09,	%l4
	and	%i6,	%i0,	%o5
	fpack32	%f0,	%f18,	%f24
	nop
	fitod	%f12,	%f4
	fdtos	%f4,	%f17
	bcc,a,pn	%icc,	loop_1660
	fbo,a	%fcc2,	loop_1661
	fmovrdgez	%g1,	%f18,	%f18
	stbar
loop_1660:
	srax	%g6,	%l5,	%o1
loop_1661:
	bne,a,pt	%icc,	loop_1662
	nop
	fitod	%f6,	%f12
	fdtoi	%f12,	%f7
	stx	%i2,	[%l7 + 0x48]
	fmovdcs	%icc,	%f5,	%f20
loop_1662:
	fbe,a	%fcc0,	loop_1663
	movgu	%icc,	%g4,	%i4
	stbar
	fpack32	%f0,	%f26,	%f4
loop_1663:
	umul	%l3,	0x1898,	%l6
	fors	%f23,	%f13,	%f4
	nop
	setx	0x83125044,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x237A64DA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f5,	%f6
	mova	%xcc,	%o4,	%g5
	sethi	0x1757,	%i5
	edge8ln	%i3,	%o2,	%i7
	edge16l	%o6,	%i1,	%g7
	fpsub16	%f12,	%f24,	%f18
	sethi	0x03D9,	%l0
	fblg,a	%fcc2,	loop_1664
	fxnors	%f14,	%f7,	%f11
	fble	%fcc0,	loop_1665
	nop
	setx	loop_1666,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1664:
	xnor	%l1,	0x0D79,	%o3
	fpsub32s	%f24,	%f20,	%f27
loop_1665:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
loop_1666:
	tneg	%icc,	0x4
	tge	%icc,	0x3
	array8	%l2,	%o7,	%o0
	tvc	%icc,	0x4
	edge32	%l4,	%g3,	%i0
	xorcc	%i6,	%o5,	%g6
	set	0x38, %i7
	swapa	[%l7 + %i7] 0x80,	%l5
	fbu,a	%fcc1,	loop_1667
	tg	%icc,	0x7
	fbn	%fcc1,	loop_1668
	tcc	%icc,	0x4
loop_1667:
	tsubcc	%o1,	%i2,	%g4
	mova	%icc,	%i4,	%l3
loop_1668:
	nop
	set	0x70, %g4
	ldda	[%l7 + %g4] 0xeb,	%g0
	alignaddrl	%l6,	%g5,	%o4
	fmovsg	%icc,	%f11,	%f4
	fmovrde	%i5,	%f6,	%f2
	tvs	%xcc,	0x7
	umulcc	%i3,	%o2,	%o6
	edge32l	%i1,	%g7,	%i7
	te	%xcc,	0x0
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l1
	fmovsa	%icc,	%f16,	%f14
	srax	%l0,	0x0A,	%g2
	movne	%icc,	%l2,	%o3
	set	0x40, %l1
	sta	%f24,	[%l7 + %l1] 0x18
	pdist	%f2,	%f0,	%f26
	sub	%o0,	%o7,	%l4
	nop
	setx loop_1669, %l0, %l1
	jmpl %l1, %g3
	umulcc	%i0,	0x09B0,	%o5
	tge	%xcc,	0x4
	tl	%icc,	0x5
loop_1669:
	edge8ln	%g6,	%i6,	%l5
	move	%icc,	%o1,	%g4
	fbg,a	%fcc2,	loop_1670
	fmovdg	%icc,	%f24,	%f15
	stx	%i4,	[%l7 + 0x38]
	andcc	%l3,	%g1,	%i2
loop_1670:
	nop
	setx	0x2FFBA2EC00BB70E8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x35E8C599FEB414A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f0,	%f0
	fmovrdne	%g5,	%f22,	%f28
	tn	%xcc,	0x3
	nop
	fitos	%f4,	%f6
	sra	%l6,	0x03,	%i5
	fmovdleu	%xcc,	%f6,	%f15
	fbule	%fcc3,	loop_1671
	brnz,a	%i3,	loop_1672
	tsubcc	%o4,	0x03B0,	%o2
	tle	%icc,	0x2
loop_1671:
	edge8ln	%i1,	%g7,	%o6
loop_1672:
	edge16ln	%l1,	%i7,	%l0
	movgu	%xcc,	%g2,	%o3
	edge16	%o0,	%l2,	%o7
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x40] %asi,	%l4
	tne	%icc,	0x4
	fone	%f24
	brnz,a	%i0,	loop_1673
	array16	%o5,	%g3,	%i6
	nop
	fitos	%f3,	%f12
	fstox	%f12,	%f16
	set	0x44, %o5
	lda	[%l7 + %o5] 0x81,	%f24
loop_1673:
	subc	%g6,	%l5,	%g4
	fnegd	%f28,	%f0
	stx	%o1,	[%l7 + 0x18]
	array32	%l3,	%g1,	%i4
	andncc	%g5,	%i2,	%i5
	edge16ln	%i3,	%l6,	%o2
	fornot1	%f0,	%f18,	%f28
	sdivcc	%i1,	0x157A,	%g7
	movgu	%xcc,	%o6,	%o4
	edge8	%i7,	%l0,	%g2
	movvc	%xcc,	%o3,	%l1
	orcc	%l2,	%o7,	%l4
	taddcctv	%o0,	%o5,	%g3
	brgez,a	%i6,	loop_1674
	sub	%i0,	%g6,	%g4
	fones	%f4
	orcc	%o1,	0x10BE,	%l3
loop_1674:
	fbl	%fcc0,	loop_1675
	edge8ln	%l5,	%i4,	%g5
	tleu	%icc,	0x0
	fandnot2s	%f21,	%f31,	%f13
loop_1675:
	fmovda	%xcc,	%f22,	%f25
	pdist	%f14,	%f10,	%f20
	fpadd32	%f0,	%f10,	%f6
	xnor	%g1,	%i2,	%i3
	alignaddr	%i5,	%o2,	%l6
	fxnor	%f16,	%f10,	%f2
	srax	%g7,	%o6,	%o4
	tle	%icc,	0x3
	addccc	%i7,	0x07F2,	%i1
	tcc	%xcc,	0x5
	fsrc2	%f24,	%f16
	alignaddrl	%l0,	%g2,	%l1
	and	%o3,	%l2,	%o7
	fbuge	%fcc3,	loop_1676
	ble,pn	%xcc,	loop_1677
	bcc,a	%xcc,	loop_1678
	movl	%icc,	%l4,	%o5
loop_1676:
	tvc	%xcc,	0x1
loop_1677:
	swap	[%l7 + 0x10],	%g3
loop_1678:
	orn	%o0,	%i6,	%g6
	fblg,a	%fcc1,	loop_1679
	fnot1	%f0,	%f8
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i0
loop_1679:
	bpos	loop_1680
	fbule	%fcc2,	loop_1681
	movpos	%icc,	%g4,	%l3
	fmovdne	%icc,	%f24,	%f23
loop_1680:
	sethi	0x1BB6,	%o1
loop_1681:
	ldd	[%l7 + 0x60],	%f0
	movrlez	%l5,	%i4,	%g1
	alignaddrl	%g5,	%i2,	%i3
	sdivx	%o2,	0x013B,	%l6
	orcc	%i5,	%o6,	%o4
	fmovdle	%xcc,	%f26,	%f10
	add	%i7,	0x1B75,	%g7
	and	%i1,	%g2,	%l0
	fbne,a	%fcc0,	loop_1682
	fpack16	%f18,	%f27
	sdivcc	%o3,	0x091E,	%l2
	movvs	%icc,	%o7,	%l4
loop_1682:
	addccc	%l1,	%g3,	%o5
	tcs	%icc,	0x1
	bpos	loop_1683
	movre	%i6,	%o0,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x1
loop_1683:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g6,	%g4
	tsubcctv	%o1,	0x1852,	%l3
	wr	%g0,	0x19,	%asi
	stha	%i4,	[%l7 + 0x1A] %asi
	fbg	%fcc2,	loop_1684
	andn	%l5,	0x0F1B,	%g5
	te	%icc,	0x6
	udivcc	%g1,	0x1A01,	%i3
loop_1684:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o2
	tneg	%xcc,	0x1
	set	0x34, %i3
	lda	[%l7 + %i3] 0x88,	%f2
	andncc	%i2,	%l6,	%o6
	movrlez	%o4,	%i5,	%i7
	ldx	[%l7 + 0x20],	%i1
	fpadd32s	%f26,	%f17,	%f26
	sir	0x044F
	set	0x28, %i1
	ldsha	[%l7 + %i1] 0x19,	%g2
	sll	%l0,	%o3,	%l2
	ld	[%l7 + 0x2C],	%f4
	movvc	%xcc,	%g7,	%o7
	smulcc	%l1,	%l4,	%g3
	xnorcc	%i6,	0x1B2C,	%o0
	alignaddrl	%i0,	%o5,	%g4
	fpadd16s	%f14,	%f14,	%f22
	std	%f8,	[%l7 + 0x50]
	movrlz	%g6,	%o1,	%l3
	movvs	%xcc,	%i4,	%g5
	movrgz	%g1,	%l5,	%o2
	srax	%i2,	%i3,	%l6
	wr	%g0,	0x04,	%asi
	sta	%f17,	[%l7 + 0x0C] %asi
	fsrc2	%f24,	%f12
	fpackfix	%f4,	%f3
	movneg	%icc,	%o6,	%o4
	ld	[%l7 + 0x14],	%f8
	nop
	setx	loop_1685,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%i7,	0x0679,	%i5
	subccc	%i1,	0x01C9,	%l0
	fnot2	%f28,	%f10
loop_1685:
	fble,a	%fcc2,	loop_1686
	fmovrsgez	%g2,	%f1,	%f12
	alignaddr	%o3,	%l2,	%o7
	xnorcc	%g7,	0x1666,	%l1
loop_1686:
	tvs	%xcc,	0x6
	edge8	%g3,	%l4,	%o0
	edge16ln	%i0,	%i6,	%g4
	and	%o5,	%o1,	%g6
	tvc	%icc,	0x5
	sllx	%l3,	%i4,	%g1
	sdivx	%l5,	0x0B7F,	%o2
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	bgu,pt	%icc,	loop_1687
	swap	[%l7 + 0x44],	%g5
	nop
	fitod	%f6,	%f22
	fdtoi	%f22,	%f14
	fbge	%fcc0,	loop_1688
loop_1687:
	fbu	%fcc2,	loop_1689
	udivx	%i2,	0x04E1,	%i3
	mulx	%l6,	%o6,	%i7
loop_1688:
	tneg	%xcc,	0x0
loop_1689:
	for	%f2,	%f0,	%f20
	tl	%icc,	0x6
	prefetch	[%l7 + 0x3C],	 0x2
	edge32l	%o4,	%i1,	%l0
	fsrc2s	%f27,	%f30
	srlx	%i5,	0x01,	%g2
	udivcc	%o3,	0x1925,	%o7
	lduh	[%l7 + 0x0A],	%g7
	fbn	%fcc2,	loop_1690
	sdivcc	%l1,	0x05BC,	%g3
	tcs	%xcc,	0x7
	orcc	%l4,	%l2,	%i0
loop_1690:
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f16
	fmovdvc	%xcc,	%f26,	%f13
	sdiv	%o0,	0x157A,	%i6
	sllx	%g4,	%o5,	%o1
	stbar
	movrne	%g6,	%l3,	%i4
	fblg	%fcc0,	loop_1691
	subc	%g1,	%l5,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f26,	%f28,	%i2
loop_1691:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f5,	[%l7 + 0x5C] %asi
	taddcctv	%g5,	%l6,	%i3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%o4
	fmovrdne	%i1,	%f20,	%f24
	lduw	[%l7 + 0x20],	%l0
	fble,a	%fcc0,	loop_1692
	smul	%i7,	%g2,	%o3
	sethi	0x0AC9,	%i5
	fcmpne16	%f26,	%f14,	%o7
loop_1692:
	sdivcc	%g7,	0x10A9,	%g3
	movrgz	%l4,	0x34C,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc3,	loop_1693
	tpos	%icc,	0x0
	orn	%i0,	%l2,	%i6
	umul	%g4,	0x040B,	%o5
loop_1693:
	add	%o0,	0x0022,	%g6
	sra	%o1,	0x17,	%i4
	bpos,a	%xcc,	loop_1694
	fbe,a	%fcc0,	loop_1695
	movrgz	%l3,	%g1,	%l5
	movg	%xcc,	%o2,	%g5
loop_1694:
	udivcc	%l6,	0x0F13,	%i2
loop_1695:
	fcmpeq32	%f26,	%f22,	%i3
	ta	%icc,	0x0
	fmovrslz	%o6,	%f24,	%f29
	movle	%icc,	%o4,	%i1
	fxor	%f14,	%f26,	%f22
	movne	%icc,	%i7,	%g2
	srl	%o3,	%i5,	%l0
	movvs	%xcc,	%o7,	%g7
	array8	%l4,	%l1,	%g3
	tvc	%icc,	0x0
	fble,a	%fcc2,	loop_1696
	call	loop_1697
	bl,pn	%xcc,	loop_1698
	tcc	%icc,	0x6
loop_1696:
	movrgez	%i0,	%i6,	%g4
loop_1697:
	addccc	%l2,	%o0,	%g6
loop_1698:
	edge8l	%o1,	%i4,	%o5
	tne	%xcc,	0x0
	movvs	%icc,	%l3,	%g1
	nop
	setx	loop_1699,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x067C,	%l5
	fnot2s	%f1,	%f15
	add	%o2,	%l6,	%i2
loop_1699:
	tcc	%xcc,	0x0
	fpack16	%f26,	%f28
	fpsub16s	%f29,	%f12,	%f3
	addc	%g5,	%i3,	%o6
	movl	%xcc,	%o4,	%i1
	nop
	setx	0x3CC781C7511B4573,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x34C9B6FEA517FA39,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f18,	%f14
	movrgz	%i7,	0x0A0,	%g2
	edge16ln	%o3,	%i5,	%o7
	udivcc	%l0,	0x1C77,	%l4
	movn	%xcc,	%l1,	%g7
	edge16	%g3,	%i6,	%i0
	array16	%g4,	%o0,	%l2
	pdist	%f6,	%f2,	%f18
	edge16l	%o1,	%g6,	%o5
	tcc	%icc,	0x3
	sllx	%i4,	%g1,	%l5
	ldsb	[%l7 + 0x49],	%o2
	fbe	%fcc3,	loop_1700
	tpos	%icc,	0x2
	movvs	%xcc,	%l3,	%l6
	fpmerge	%f11,	%f8,	%f4
loop_1700:
	fmuld8ulx16	%f3,	%f14,	%f28
	fsrc2s	%f27,	%f30
	movvs	%icc,	%g5,	%i3
	tle	%xcc,	0x0
	movrlez	%o6,	0x2A1,	%o4
	tsubcctv	%i2,	0x1DE7,	%i7
	tvs	%xcc,	0x3
	and	%g2,	0x0ED5,	%i1
	movcc	%icc,	%i5,	%o7
	orcc	%o3,	%l0,	%l4
	tcs	%xcc,	0x2
	fornot2	%f6,	%f2,	%f22
	orcc	%l1,	0x151B,	%g7
	nop
	setx	loop_1701,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brgez,a	%i6,	loop_1702
	smulcc	%i0,	%g4,	%o0
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x1f
	membar	#Sync
loop_1701:
	tsubcc	%l2,	0x144E,	%g3
loop_1702:
	movn	%xcc,	%g6,	%o5
	movle	%xcc,	%o1,	%g1
	udiv	%l5,	0x027B,	%o2
	edge32ln	%i4,	%l3,	%g5
	tcs	%icc,	0x3
	addc	%i3,	%o6,	%l6
	sub	%i2,	%o4,	%g2
	sdiv	%i7,	0x108F,	%i1
	xor	%i5,	0x1B48,	%o7
	te	%icc,	0x5
	subc	%o3,	%l0,	%l4
	srlx	%l1,	%i6,	%i0
	udiv	%g4,	0x1563,	%g7
	fsrc2	%f0,	%f6
	fors	%f10,	%f4,	%f17
	flush	%l7 + 0x7C
	nop
	setx	0x00588B7CF3B0B37D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x3255618A2C0D5512,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f22,	%f12
	stbar
	fbul	%fcc0,	loop_1703
	prefetch	[%l7 + 0x0C],	 0x3
	movrlz	%l2,	%g3,	%g6
	fmul8ulx16	%f30,	%f10,	%f28
loop_1703:
	nop
	set	0x10, %o3
	ldsba	[%l7 + %o3] 0x14,	%o5
	ldsh	[%l7 + 0x76],	%o0
	bcc	loop_1704
	fmovsgu	%xcc,	%f30,	%f28
	pdist	%f18,	%f12,	%f4
	set	0x30, %g7
	stxa	%g1,	[%l7 + %g7] 0x81
loop_1704:
	nop
	setx	0x25FDF7452A0BBCBC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x33B2249FAB8ADAEC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f20,	%f16
	tcs	%xcc,	0x4
	fcmple32	%f14,	%f16,	%o1
	fbg,a	%fcc3,	loop_1705
	udiv	%o2,	0x16AA,	%i4
	udiv	%l5,	0x0032,	%g5
	array16	%l3,	%i3,	%l6
loop_1705:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xe3,	%asi
	stba	%o6,	[%l7 + 0x48] %asi
	membar	#Sync
	nop
	setx	loop_1706,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdvs	%xcc,	%f3,	%f18
	sra	%i2,	0x05,	%o4
	fbu,a	%fcc3,	loop_1707
loop_1706:
	srlx	%i7,	0x1C,	%i1
	movre	%g2,	0x3A2,	%i5
	sdivx	%o3,	0x0238,	%l0
loop_1707:
	andncc	%o7,	%l1,	%i6
	nop
	fitos	%f9,	%f19
	fstox	%f19,	%f18
	fbn,a	%fcc1,	loop_1708
	bge,a	%icc,	loop_1709
	tsubcc	%i0,	0x1042,	%g4
	udiv	%g7,	0x1AE1,	%l4
loop_1708:
	tle	%icc,	0x1
loop_1709:
	nop
	setx	0x591C3A23142045D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xFCE7B2605B402866,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f26,	%f18
	ldub	[%l7 + 0x76],	%g3
	te	%xcc,	0x3
	fbne	%fcc0,	loop_1710
	movl	%icc,	%l2,	%o5
	membar	0x24
	subcc	%o0,	%g6,	%g1
loop_1710:
	sll	%o1,	0x1C,	%o2
	srl	%i4,	0x16,	%l5
	fmovscs	%icc,	%f10,	%f22
	and	%g5,	%i3,	%l6
	stx	%l3,	[%l7 + 0x48]
	fxors	%f23,	%f18,	%f2
	fabsd	%f22,	%f12
	fmovrsne	%o6,	%f29,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	udiv	%i2,	0x17DA,	%i7
	fmovsge	%xcc,	%f1,	%f20
	edge16	%o4,	%i1,	%i5
	umul	%o3,	0x0C28,	%l0
	tsubcc	%g2,	0x0096,	%l1
	subc	%i6,	0x06BA,	%o7
	smulcc	%g4,	%g7,	%i0
	edge8	%g3,	%l4,	%o5
	subccc	%l2,	0x19DD,	%o0
	xorcc	%g1,	0x01C6,	%g6
	fandnot2	%f16,	%f2,	%f22
	tleu	%icc,	0x0
	movvc	%icc,	%o2,	%i4
	nop
	fitod	%f8,	%f22
	fdtos	%f22,	%f5
	fcmple32	%f28,	%f4,	%l5
	nop
	setx	0x5FB4C0A258F76F8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x6AE4D1F843FEC753,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f6,	%f30
	fsrc2	%f0,	%f16
	fmovrdlz	%g5,	%f2,	%f24
	tvs	%icc,	0x7
	movre	%o1,	0x16E,	%l6
	bge,pn	%icc,	loop_1711
	nop
	setx	0x45DFA4EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xF1E24E18,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f13,	%f25
	ble,pn	%xcc,	loop_1712
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1711:
	tleu	%icc,	0x2
	set	0x32, %i4
	ldsha	[%l7 + %i4] 0x0c,	%i3
loop_1712:
	udiv	%l3,	0x103A,	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%o4
	smul	%o6,	%i1,	%o3
	edge16l	%l0,	%i5,	%g2
	flush	%l7 + 0x6C
	fmovda	%icc,	%f12,	%f14
	edge16ln	%i6,	%l1,	%g4
	fmovde	%icc,	%f4,	%f31
	be,a,pt	%xcc,	loop_1713
	fmul8x16	%f18,	%f0,	%f6
	movre	%o7,	%i0,	%g7
	edge8n	%l4,	%g3,	%l2
loop_1713:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%g1
	umulcc	%g6,	0x1DA2,	%o5
	ldstub	[%l7 + 0x4F],	%i4
	nop
	fitos	%f10,	%f19
	fstod	%f19,	%f22
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	tne	%icc,	0x7
	fornot2s	%f4,	%f31,	%f6
	sub	%o2,	%o1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xC2BC15FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x201E2AAC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f29,	%f11
	fcmpne32	%f24,	%f8,	%g5
	alignaddr	%i3,	%i2,	%l3
	srax	%i7,	%o6,	%o4
	array8	%o3,	%l0,	%i1
	lduw	[%l7 + 0x14],	%i5
	addc	%g2,	%i6,	%l1
	alignaddrl	%g4,	%i0,	%g7
	nop
	setx	loop_1714,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%icc,	%l4,	%o7
	sra	%l2,	0x02,	%o0
	sethi	0x1C63,	%g3
loop_1714:
	mulx	%g6,	0x1292,	%g1
	array16	%o5,	%i4,	%o2
	move	%icc,	%l5,	%l6
	fnot2	%f20,	%f14
	sir	0x09CF
	edge32l	%g5,	%o1,	%i2
	array8	%l3,	%i7,	%o6
	smulcc	%o4,	0x0C85,	%o3
	sth	%l0,	[%l7 + 0x30]
	sdiv	%i1,	0x0FE3,	%i3
	fmovsn	%xcc,	%f22,	%f20
	movl	%icc,	%i5,	%g2
	fornot1	%f18,	%f4,	%f16
	fexpand	%f2,	%f18
	tge	%xcc,	0x7
	fbl	%fcc2,	loop_1715
	stb	%i6,	[%l7 + 0x7B]
	edge32l	%g4,	%i0,	%g7
	alignaddrl	%l4,	%l1,	%l2
loop_1715:
	be,a	loop_1716
	sdivx	%o7,	0x1AF4,	%o0
	tsubcc	%g6,	0x01F0,	%g1
	tvc	%icc,	0x0
loop_1716:
	tge	%icc,	0x4
	movrgz	%g3,	%o5,	%o2
	array16	%l5,	%i4,	%g5
	edge8	%l6,	%i2,	%o1
	sethi	0x1B8A,	%l3
	fmovdcs	%icc,	%f17,	%f0
	movneg	%icc,	%i7,	%o6
	tneg	%xcc,	0x7
	srax	%o3,	0x12,	%l0
	fmovrsne	%o4,	%f3,	%f29
	movrlz	%i1,	0x2E7,	%i3
	edge8ln	%g2,	%i6,	%g4
	xorcc	%i0,	0x0143,	%i5
	fmovsleu	%icc,	%f2,	%f9
	sdivcc	%g7,	0x1786,	%l4
	fmovd	%f24,	%f28
	fpmerge	%f10,	%f7,	%f24
	fmovscs	%icc,	%f27,	%f14
	or	%l1,	%l2,	%o0
	udivx	%o7,	0x192B,	%g1
	bneg,pt	%xcc,	loop_1717
	fabss	%f2,	%f24
	subccc	%g6,	0x18A8,	%o5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
loop_1717:
	brgz,a	%o2,	loop_1718
	edge8n	%i4,	%l5,	%g5
	swap	[%l7 + 0x5C],	%i2
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1718:
	sll	%l6,	%o1,	%l3
	subccc	%o6,	%o3,	%l0
	ldx	[%l7 + 0x50],	%i7
	stb	%o4,	[%l7 + 0x69]
	movl	%xcc,	%i1,	%i3
	lduh	[%l7 + 0x16],	%g2
	and	%i6,	%i0,	%i5
	brz	%g7,	loop_1719
	tge	%xcc,	0x0
	movcs	%icc,	%g4,	%l4
	xnorcc	%l2,	%o0,	%o7
loop_1719:
	ldsb	[%l7 + 0x2D],	%l1
	movleu	%xcc,	%g6,	%o5
	udiv	%g3,	0x1C4B,	%o2
	nop
	setx	0x2052FDFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fbo,a	%fcc3,	loop_1720
	movl	%icc,	%g1,	%l5
	fones	%f21
	udivx	%i4,	0x0AB6,	%i2
loop_1720:
	addc	%g5,	%l6,	%o1
	wr	%g0,	0x19,	%asi
	sta	%f27,	[%l7 + 0x20] %asi
	xor	%o6,	%o3,	%l0
	movgu	%xcc,	%l3,	%o4
	nop
	setx	loop_1721,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	st	%f16,	[%l7 + 0x5C]
	tleu	%icc,	0x6
	tvc	%icc,	0x6
loop_1721:
	tl	%xcc,	0x1
	bvs	loop_1722
	andcc	%i7,	0x1A1E,	%i1
	xorcc	%i3,	0x0AFC,	%i6
	array32	%i0,	%i5,	%g2
loop_1722:
	mulx	%g7,	%l4,	%l2
	movre	%g4,	0x118,	%o0
	fexpand	%f13,	%f4
	movleu	%icc,	%o7,	%l1
	sllx	%g6,	0x06,	%o5
	taddcctv	%g3,	0x0555,	%g1
	array8	%o2,	%i4,	%l5
	tneg	%xcc,	0x3
	brgz	%g5,	loop_1723
	fbe,a	%fcc2,	loop_1724
	fpadd32s	%f2,	%f27,	%f10
	movle	%icc,	%l6,	%o1
loop_1723:
	tle	%icc,	0x3
loop_1724:
	brz	%i2,	loop_1725
	movgu	%icc,	%o3,	%l0
	sth	%l3,	[%l7 + 0x18]
	membar	0x0D
loop_1725:
	movneg	%icc,	%o4,	%o6
	fmovdvs	%xcc,	%f26,	%f2
	addccc	%i1,	0x12FD,	%i3
	smulcc	%i7,	%i6,	%i0
	fbe	%fcc3,	loop_1726
	move	%xcc,	%i5,	%g7
	fmovdcc	%icc,	%f10,	%f16
	edge8ln	%l4,	%l2,	%g2
loop_1726:
	tsubcc	%g4,	%o7,	%o0
	fmovdne	%xcc,	%f31,	%f5
	movneg	%xcc,	%g6,	%o5
	sub	%l1,	0x18FA,	%g1
	ldsb	[%l7 + 0x0B],	%o2
	edge32ln	%g3,	%i4,	%l5
	fmovsle	%xcc,	%f3,	%f1
	fxnors	%f22,	%f13,	%f25
	udivcc	%g5,	0x0E45,	%l6
	tn	%icc,	0x4
	fmovsge	%xcc,	%f2,	%f6
	alignaddr	%i2,	%o1,	%l0
	movn	%icc,	%o3,	%l3
	call	loop_1727
	stx	%o6,	[%l7 + 0x70]
	tg	%icc,	0x6
	fmovsg	%xcc,	%f5,	%f16
loop_1727:
	movleu	%icc,	%o4,	%i3
	sdiv	%i1,	0x1EAC,	%i6
	sub	%i7,	%i5,	%i0
	orncc	%g7,	0x1941,	%l2
	edge32	%l4,	%g2,	%g4
	st	%f10,	[%l7 + 0x64]
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o0
	tneg	%xcc,	0x7
	ldx	[%l7 + 0x30],	%o7
	movrlez	%o5,	%l1,	%g1
	tge	%xcc,	0x6
	fnot2s	%f9,	%f9
	orncc	%o2,	%g3,	%i4
	fbne	%fcc3,	loop_1728
	smulcc	%l5,	%g5,	%g6
	ldstub	[%l7 + 0x40],	%l6
	tvs	%xcc,	0x7
loop_1728:
	bcs,pt	%icc,	loop_1729
	and	%i2,	0x161D,	%o1
	bne,a,pt	%icc,	loop_1730
	fbl	%fcc0,	loop_1731
loop_1729:
	sub	%o3,	%l3,	%o6
	array32	%o4,	%i3,	%l0
loop_1730:
	movg	%xcc,	%i1,	%i7
loop_1731:
	tvs	%xcc,	0x7
	sub	%i5,	0x0694,	%i6
	tn	%icc,	0x1
	movge	%icc,	%i0,	%g7
	fmovrslz	%l4,	%f26,	%f6
	movrgez	%l2,	0x1CF,	%g2
	nop
	setx	0x2D697FA350E9F68C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f16
	xnor	%o0,	%g4,	%o5
	ldsb	[%l7 + 0x7E],	%o7
	sdivx	%l1,	0x1472,	%o2
	mulscc	%g3,	%g1,	%i4
	move	%xcc,	%l5,	%g5
	sir	0x1540
	movvs	%icc,	%g6,	%l6
	edge16n	%i2,	%o3,	%l3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x08] %asi,	%f21
	fmovdge	%icc,	%f3,	%f11
	tn	%icc,	0x4
	movrne	%o6,	%o4,	%i3
	set	0x08, %l3
	lda	[%l7 + %l3] 0x89,	%f22
	sllx	%o1,	%l0,	%i1
	umul	%i7,	0x05EC,	%i5
	sir	0x0741
	array16	%i0,	%g7,	%l4
	alignaddr	%l2,	%i6,	%o0
	fmovde	%icc,	%f10,	%f9
	movl	%xcc,	%g2,	%g4
	nop
	fitos	%f11,	%f13
	fstox	%f13,	%f2
	fcmpeq32	%f22,	%f26,	%o5
	fnands	%f28,	%f18,	%f24
	fpsub32	%f18,	%f8,	%f22
	udiv	%l1,	0x0179,	%o2
	nop
	setx	0x46974164,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x478D0F76,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f9,	%f28
	swap	[%l7 + 0x18],	%o7
	popc	%g3,	%g1
	sll	%i4,	%g5,	%l5
	umulcc	%g6,	%i2,	%l6
	lduh	[%l7 + 0x14],	%o3
	smulcc	%l3,	0x1231,	%o6
	movrne	%o4,	0x018,	%o1
	bn,pt	%icc,	loop_1732
	tne	%icc,	0x0
	edge32ln	%l0,	%i1,	%i7
	sllx	%i5,	0x1F,	%i0
loop_1732:
	fzero	%f16
	xor	%g7,	0x1C39,	%l4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%i3
	stx	%i6,	[%l7 + 0x50]
	movrlz	%l2,	0x217,	%o0
	edge32ln	%g2,	%g4,	%o5
	mulx	%l1,	%o2,	%g3
	fcmpne32	%f12,	%f4,	%g1
	fmovscs	%icc,	%f10,	%f23
	alignaddrl	%i4,	%o7,	%l5
	ldub	[%l7 + 0x64],	%g6
	movne	%icc,	%i2,	%g5
	movl	%xcc,	%l6,	%o3
	membar	0x55
	tvs	%xcc,	0x1
	fbuge,a	%fcc2,	loop_1733
	sub	%l3,	%o6,	%o1
	fnot2s	%f14,	%f4
	sethi	0x1729,	%l0
loop_1733:
	movrgez	%i1,	%i7,	%o4
	wr	%g0,	0x5f,	%asi
	stxa	%i0,	[%g0 + 0x0] %asi
	xnor	%g7,	%i5,	%i3
	fmovscc	%icc,	%f4,	%f21
	nop
	setx loop_1734, %l0, %l1
	jmpl %l1, %l4
	fsrc2s	%f23,	%f10
	xor	%l2,	0x10C8,	%i6
	movcc	%icc,	%g2,	%g4
loop_1734:
	movvs	%xcc,	%o0,	%l1
	tsubcc	%o5,	%g3,	%o2
	mulscc	%i4,	0x1D89,	%o7
	fbe,a	%fcc0,	loop_1735
	addcc	%l5,	%g6,	%i2
	prefetch	[%l7 + 0x44],	 0x2
	movle	%xcc,	%g1,	%g5
loop_1735:
	brnz	%l6,	loop_1736
	fmovsvs	%xcc,	%f13,	%f11
	movcs	%xcc,	%o3,	%l3
	be	%icc,	loop_1737
loop_1736:
	membar	0x6D
	tsubcctv	%o6,	%l0,	%o1
	fmovscs	%xcc,	%f6,	%f9
loop_1737:
	nop
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%i7
	tpos	%icc,	0x0
	sdivcc	%i1,	0x0DE2,	%o4
	orcc	%i0,	0x07C8,	%i5
	umulcc	%i3,	0x08E1,	%g7
	set	0x6C, %l0
	swapa	[%l7 + %l0] 0x89,	%l2
	movrlez	%i6,	0x22D,	%l4
	or	%g4,	%g2,	%l1
	fmovsneg	%icc,	%f4,	%f27
	taddcctv	%o5,	0x074C,	%g3
	tvc	%icc,	0x1
	alignaddrl	%o2,	%i4,	%o0
	fpsub16	%f6,	%f24,	%f2
	fmovsle	%icc,	%f29,	%f18
	taddcctv	%l5,	%g6,	%i2
	ldsb	[%l7 + 0x28],	%g1
	movrlz	%o7,	%l6,	%g5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x18,	%o3,	%l3
	edge16n	%l0,	%o1,	%o6
	set	0x34, %o2
	ldsba	[%l7 + %o2] 0x14,	%i7
	bvc,a,pn	%icc,	loop_1738
	movrlz	%i1,	%i0,	%o4
	fmovse	%xcc,	%f27,	%f3
	edge16l	%i3,	%i5,	%g7
loop_1738:
	movvs	%xcc,	%i6,	%l2
	flush	%l7 + 0x40
	ldsw	[%l7 + 0x0C],	%l4
	fmovrse	%g2,	%f31,	%f22
	ldd	[%l7 + 0x58],	%l0
	membar	0x36
	taddcctv	%g4,	%g3,	%o2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i4
	te	%xcc,	0x1
	edge8l	%o0,	%l5,	%g6
	udiv	%i2,	0x0D7A,	%o5
	wr	%g0,	0x18,	%asi
	stba	%g1,	[%l7 + 0x16] %asi
	tle	%xcc,	0x4
	movcs	%icc,	%l6,	%o7
	andncc	%g5,	%o3,	%l3
	andncc	%o1,	%o6,	%l0
	fbue,a	%fcc2,	loop_1739
	sllx	%i1,	0x08,	%i0
	fbug	%fcc3,	loop_1740
	fmovdpos	%xcc,	%f6,	%f12
loop_1739:
	ta	%icc,	0x2
	tl	%icc,	0x4
loop_1740:
	nop
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	popc	%o4,	%i5
	and	%g7,	%i6,	%l2
	mova	%xcc,	%i3,	%l4
	alignaddr	%l1,	%g4,	%g2
	orn	%o2,	%i4,	%g3
	tn	%xcc,	0x1
	std	%f24,	[%l7 + 0x30]
	fbge	%fcc0,	loop_1741
	edge16ln	%l5,	%o0,	%i2
	ldd	[%l7 + 0x60],	%g6
	umulcc	%g1,	%o5,	%l6
loop_1741:
	sir	0x02B6
	movleu	%icc,	%g5,	%o3
	smul	%o7,	%o1,	%o6
	orn	%l3,	0x1CD8,	%i1
	brlz,a	%l0,	loop_1742
	fmovd	%f10,	%f8
	nop
	setx	0xA31277BC4F1F7650,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x94A2603C6B7CE61C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f22,	%f28
	fcmpeq32	%f24,	%f30,	%i7
loop_1742:
	tne	%icc,	0x2
	orncc	%i0,	0x1B8D,	%i5
	ta	%icc,	0x6
	movgu	%xcc,	%o4,	%i6
	be,a,pt	%icc,	loop_1743
	fmovrdlez	%g7,	%f18,	%f16
	sllx	%l2,	0x10,	%l4
	bn,a	%xcc,	loop_1744
loop_1743:
	taddcctv	%i3,	%l1,	%g2
	ldd	[%l7 + 0x78],	%g4
	nop
	setx	loop_1745,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1744:
	fble,a	%fcc3,	loop_1746
	fbn,a	%fcc2,	loop_1747
	edge32n	%i4,	%g3,	%o2
loop_1745:
	bgu,a	%xcc,	loop_1748
loop_1746:
	ld	[%l7 + 0x4C],	%f5
loop_1747:
	alignaddrl	%l5,	%o0,	%g6
	alignaddr	%i2,	%o5,	%g1
loop_1748:
	smulcc	%l6,	0x1FEE,	%o3
	fmovsne	%xcc,	%f14,	%f21
	tsubcctv	%g5,	0x0126,	%o7
	sir	0x092C
	addcc	%o1,	0x19F5,	%o6
	edge8ln	%l3,	%l0,	%i7
	stb	%i1,	[%l7 + 0x1D]
	nop
	set	0x30, %l2
	stx	%i5,	[%l7 + %l2]
	tn	%icc,	0x1
	nop
	setx	0xC8337E82FD2523B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xE8D76F7CE07600C8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f4,	%f18
	edge8	%o4,	%i0,	%i6
	tn	%icc,	0x0
	nop
	set	0x34, %l4
	ldsh	[%l7 + %l4],	%g7
	tn	%icc,	0x1
	tle	%xcc,	0x5
	movcc	%xcc,	%l4,	%l2
	tsubcctv	%l1,	0x04F3,	%i3
	call	loop_1749
	movg	%icc,	%g4,	%i4
	bleu	%icc,	loop_1750
	ta	%xcc,	0x1
loop_1749:
	mulscc	%g2,	0x113F,	%o2
	movn	%xcc,	%g3,	%o0
loop_1750:
	fbue	%fcc1,	loop_1751
	call	loop_1752
	fmovrslez	%g6,	%f5,	%f20
	ldstub	[%l7 + 0x65],	%l5
loop_1751:
	fbule,a	%fcc0,	loop_1753
loop_1752:
	andncc	%o5,	%g1,	%l6
	tvs	%icc,	0x3
	subcc	%i2,	0x0CDD,	%g5
loop_1753:
	popc	0x004B,	%o3
	tcc	%xcc,	0x4
	fsrc2s	%f6,	%f8
	nop
	fitos	%f0,	%f21
	fstox	%f21,	%f30
	fxtos	%f30,	%f9
	umulcc	%o1,	%o6,	%l3
	move	%xcc,	%o7,	%i7
	udivx	%i1,	0x1EB1,	%l0
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x15,	 0x1
	tleu	%icc,	0x1
	fmovrdlez	%o4,	%f2,	%f24
	add	%i0,	0x1ECC,	%i6
	movrgez	%g7,	%l4,	%l1
	ta	%xcc,	0x4
	fba	%fcc2,	loop_1754
	movrlz	%i3,	%g4,	%i4
	taddcc	%l2,	%o2,	%g2
	fabss	%f12,	%f10
loop_1754:
	bl,a,pn	%xcc,	loop_1755
	brgez,a	%g3,	loop_1756
	tcc	%icc,	0x6
	nop
	setx	loop_1757,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1755:
	tvs	%xcc,	0x4
loop_1756:
	fmovrdgz	%o0,	%f10,	%f10
	orncc	%g6,	%l5,	%g1
loop_1757:
	edge32l	%l6,	%i2,	%o5
	stw	%g5,	[%l7 + 0x58]
	smul	%o1,	%o3,	%l3
	srl	%o7,	%o6,	%i7
	nop
	setx	0x006CC809,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	movn	%xcc,	%l0,	%i5
	move	%icc,	%o4,	%i0
	umulcc	%i6,	%i1,	%l4
	sll	%l1,	%i3,	%g7
	std	%f14,	[%l7 + 0x68]
	set	0x30, %o4
	stba	%i4,	[%l7 + %o4] 0x23
	membar	#Sync
	xor	%l2,	0x0EA0,	%g4
	lduw	[%l7 + 0x58],	%o2
	srax	%g2,	%g3,	%o0
	tcs	%xcc,	0x3
	fmovrdlz	%l5,	%f26,	%f18
	tg	%xcc,	0x0
	or	%g1,	0x1829,	%l6
	edge32n	%g6,	%o5,	%g5
	movn	%icc,	%o1,	%i2
	be,pt	%icc,	loop_1758
	edge16	%o3,	%l3,	%o6
	andn	%i7,	0x0220,	%o7
	edge32l	%l0,	%i5,	%i0
loop_1758:
	fmovdvs	%xcc,	%f22,	%f19
	st	%f22,	[%l7 + 0x6C]
	tne	%xcc,	0x7
	fmovdcc	%xcc,	%f4,	%f29
	bcc	loop_1759
	fexpand	%f10,	%f16
	andn	%i6,	0x1634,	%o4
	movl	%xcc,	%l4,	%i1
loop_1759:
	lduh	[%l7 + 0x5E],	%l1
	udiv	%i3,	0x06DA,	%i4
	smulcc	%l2,	0x0488,	%g7
	bn,a	loop_1760
	fpsub16	%f26,	%f20,	%f16
	sra	%g4,	%g2,	%o2
	st	%f6,	[%l7 + 0x28]
loop_1760:
	movle	%icc,	%g3,	%l5
	fpsub16	%f28,	%f26,	%f22
	xor	%o0,	0x1BD2,	%g1
	andncc	%g6,	%l6,	%o5
	movl	%icc,	%o1,	%g5
	brlez,a	%i2,	loop_1761
	udivx	%l3,	0x041B,	%o6
	edge16	%i7,	%o3,	%o7
	movvc	%icc,	%l0,	%i5
loop_1761:
	movleu	%icc,	%i0,	%i6
	add	%l4,	%i1,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i3,	%o4,	%i4
	ldstub	[%l7 + 0x68],	%l2
	set	0x19, %g3
	lduba	[%l7 + %g3] 0x04,	%g7
	fbl	%fcc1,	loop_1762
	fmovsvc	%xcc,	%f2,	%f15
	movleu	%xcc,	%g2,	%g4
	fmovrse	%g3,	%f3,	%f13
loop_1762:
	addccc	%l5,	0x1049,	%o0
	sdivcc	%g1,	0x13A3,	%g6
	nop
	fitos	%f7,	%f8
	fstox	%f8,	%f8
	wr	%g0,	0x88,	%asi
	stha	%l6,	[%l7 + 0x2E] %asi
	movne	%xcc,	%o5,	%o2
	ldsh	[%l7 + 0x60],	%g5
	tneg	%xcc,	0x6
	addc	%i2,	%l3,	%o1
	edge16	%o6,	%i7,	%o3
	nop
	setx	loop_1763,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%o7,	%i5,	%l0
	movcs	%xcc,	%i0,	%i6
	fmovde	%xcc,	%f19,	%f3
loop_1763:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%l4
	xnorcc	%i1,	0x103B,	%l1
	smul	%o4,	%i3,	%i4
	edge16l	%l2,	%g2,	%g7
	fbu	%fcc3,	loop_1764
	movvc	%icc,	%g3,	%g4
	fmovrde	%l5,	%f4,	%f28
	fxnor	%f6,	%f4,	%f16
loop_1764:
	or	%g1,	0x1DD0,	%g6
	udivcc	%l6,	0x0D7B,	%o5
	sdiv	%o0,	0x17E3,	%o2
	fsrc2	%f8,	%f18
	udiv	%g5,	0x031D,	%l3
	fmovsleu	%icc,	%f21,	%f5
	sethi	0x0B64,	%o1
	move	%xcc,	%o6,	%i2
	edge16	%i7,	%o7,	%i5
	addcc	%o3,	0x01A8,	%l0
	wr	%g0,	0x88,	%asi
	stba	%i0,	[%l7 + 0x31] %asi
	tvc	%icc,	0x1
	addcc	%l4,	%i6,	%l1
	edge16	%i1,	%i3,	%o4
	movle	%xcc,	%i4,	%l2
	nop
	fitod	%f6,	%f4
	fdtoi	%f4,	%f5
	movrlz	%g7,	%g2,	%g4
	tgu	%icc,	0x5
	andcc	%g3,	%g1,	%g6
	bleu,pn	%icc,	loop_1765
	movneg	%icc,	%l5,	%o5
	edge32n	%o0,	%l6,	%g5
	tne	%xcc,	0x7
loop_1765:
	orn	%l3,	%o2,	%o1
	taddcctv	%i2,	%o6,	%o7
	and	%i7,	%o3,	%l0
	fmovdl	%icc,	%f29,	%f18
	fmovdneg	%icc,	%f18,	%f20
	sethi	0x1BC3,	%i0
	fpsub16	%f26,	%f8,	%f16
	fbue,a	%fcc0,	loop_1766
	sllx	%i5,	%l4,	%l1
	ldstub	[%l7 + 0x5D],	%i6
	nop
	setx	0xCA76FBAE5BDF194E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x3B56A25BBD61A9FC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f18,	%f0
loop_1766:
	nop
	set	0x70, %g6
	stba	%i1,	[%l7 + %g6] 0x0c
	fornot2	%f18,	%f0,	%f18
	bg,a,pn	%icc,	loop_1767
	movre	%i3,	0x3DD,	%o4
	movleu	%icc,	%i4,	%g7
	sllx	%g2,	0x04,	%l2
loop_1767:
	bleu,a	loop_1768
	alignaddr	%g4,	%g1,	%g3
	bl	loop_1769
	subcc	%l5,	%o5,	%g6
loop_1768:
	bvc,pn	%icc,	loop_1770
	fba	%fcc2,	loop_1771
loop_1769:
	array16	%l6,	%o0,	%g5
	fpsub16s	%f7,	%f2,	%f27
loop_1770:
	lduw	[%l7 + 0x28],	%o2
loop_1771:
	nop
	fitod	%f4,	%f12
	fdtoi	%f12,	%f15
	udivcc	%o1,	0x02F8,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o6,	0x1A1C,	%o7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x72] %asi,	%i7
	fnor	%f12,	%f14,	%f26
	tn	%xcc,	0x1
	movre	%o3,	0x094,	%i2
	nop
	setx	loop_1772,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot1s	%f22,	%f1,	%f7
	edge16l	%i0,	%i5,	%l4
	sub	%l0,	%i6,	%i1
loop_1772:
	tgu	%xcc,	0x6
	bleu,a	loop_1773
	bn	loop_1774
	movg	%icc,	%i3,	%l1
	edge32l	%i4,	%o4,	%g2
loop_1773:
	fbul	%fcc0,	loop_1775
loop_1774:
	te	%icc,	0x5
	nop
	setx	0xB633CC67,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f28
	movrlz	%g7,	0x33C,	%g4
loop_1775:
	edge32ln	%l2,	%g1,	%l5
	fbe,a	%fcc2,	loop_1776
	popc	0x130D,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%o5,	%l6
loop_1776:
	fmovsl	%xcc,	%f21,	%f28
	nop
	fitos	%f12,	%f25
	fstox	%f25,	%f26
	fxtos	%f26,	%f0
	set	0x5C, %i6
	lduwa	[%l7 + %i6] 0x81,	%o0
	lduh	[%l7 + 0x3A],	%g6
	and	%o2,	0x0E3A,	%o1
	nop
	setx	0x969837A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x1314748C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f4,	%f11
	fpsub32s	%f17,	%f30,	%f6
	brnz,a	%l3,	loop_1777
	stw	%g5,	[%l7 + 0x58]
	subcc	%o6,	%o7,	%o3
	tcc	%xcc,	0x0
loop_1777:
	nop
	set	0x58, %l5
	prefetcha	[%l7 + %l5] 0x0c,	 0x3
	ldd	[%l7 + 0x60],	%i6
	fbl,a	%fcc3,	loop_1778
	bgu,a	%icc,	loop_1779
	prefetch	[%l7 + 0x70],	 0x3
	umulcc	%i5,	%i0,	%l0
loop_1778:
	fmovdneg	%icc,	%f3,	%f5
loop_1779:
	nop
	setx	0xCD4516C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x660EC901,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f20,	%f30
	edge32	%i6,	%l4,	%i1
	movre	%l1,	%i3,	%o4
	movre	%g2,	0x1D6,	%g7
	tneg	%xcc,	0x2
	bne,a	%xcc,	loop_1780
	sdivcc	%g4,	0x0403,	%l2
	movgu	%icc,	%i4,	%l5
	tleu	%xcc,	0x2
loop_1780:
	taddcctv	%g1,	0x0B4A,	%o5
	umulcc	%l6,	0x0159,	%o0
	set	0x08, %o1
	sta	%f12,	[%l7 + %o1] 0x88
	set	0x3C, %o6
	stwa	%g6,	[%l7 + %o6] 0x10
	sdivx	%g3,	0x1544,	%o1
	popc	0x08D8,	%o2
	movcc	%xcc,	%g5,	%o6
	ldsb	[%l7 + 0x2B],	%o7
	tneg	%icc,	0x6
	be,a	%xcc,	loop_1781
	fone	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xB2D8DD31B66FE70A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA82B01C7F8BD1300,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f16,	%f14
loop_1781:
	movre	%l3,	%i2,	%i7
	set	0x24, %i5
	ldswa	[%l7 + %i5] 0x0c,	%i5
	bn,a,pn	%xcc,	loop_1782
	tvs	%xcc,	0x5
	sub	%i0,	%l0,	%o3
	movrlez	%i6,	0x385,	%i1
loop_1782:
	array32	%l1,	%l4,	%o4
	fmul8ulx16	%f26,	%f10,	%f16
	taddcctv	%i3,	0x0B47,	%g2
	fbn	%fcc0,	loop_1783
	fmovsle	%xcc,	%f27,	%f13
	smulcc	%g4,	0x038D,	%g7
	tle	%icc,	0x2
loop_1783:
	xor	%l2,	%l5,	%g1
	sllx	%i4,	%o5,	%l6
	fcmpne16	%f8,	%f4,	%g6
	movvs	%icc,	%o0,	%g3
	xorcc	%o2,	%o1,	%g5
	nop
	setx loop_1784, %l0, %l1
	jmpl %l1, %o6
	bgu,a,pt	%icc,	loop_1785
	tvs	%icc,	0x5
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x08] %asi,	%o7
loop_1784:
	nop
	set	0x18, %g5
	ldxa	[%l7 + %g5] 0x81,	%i2
loop_1785:
	andn	%l3,	%i5,	%i7
	edge32	%i0,	%o3,	%l0
	srlx	%i6,	0x04,	%l1
	sll	%l4,	0x09,	%o4
	tpos	%xcc,	0x6
	stbar
	movpos	%icc,	%i1,	%g2
	taddcctv	%i3,	0x1ACA,	%g4
	fcmpne32	%f26,	%f18,	%l2
	fble,a	%fcc0,	loop_1786
	fcmple16	%f20,	%f8,	%l5
	subccc	%g1,	0x007F,	%i4
	andncc	%o5,	%l6,	%g7
loop_1786:
	movrgez	%g6,	%g3,	%o0
	fpadd16	%f8,	%f18,	%f18
	ldx	[%l7 + 0x68],	%o2
	edge8ln	%o1,	%g5,	%o7
	orn	%i2,	%l3,	%i5
	ldstub	[%l7 + 0x4E],	%o6
	smul	%i7,	%o3,	%l0
	movg	%xcc,	%i6,	%l1
	popc	0x1248,	%l4
	fbuge	%fcc3,	loop_1787
	lduw	[%l7 + 0x48],	%i0
	umul	%i1,	%g2,	%o4
	tvc	%xcc,	0x4
loop_1787:
	alignaddrl	%i3,	%l2,	%l5
	sra	%g1,	%g4,	%i4
	xorcc	%o5,	%l6,	%g7
	mova	%icc,	%g6,	%g3
	fmovdne	%icc,	%f10,	%f23
	movleu	%xcc,	%o0,	%o2
	mova	%xcc,	%o1,	%o7
	move	%icc,	%g5,	%i2
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
	fxnor	%f20,	%f20,	%f28
	udiv	%i5,	0x0A06,	%o6
	nop
	setx	0x1BA8593FCD039225,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x429AD012290C324F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f0,	%f10
loop_1788:
	xnorcc	%i7,	0x0C6F,	%l3
	fmovdg	%xcc,	%f3,	%f12
	tsubcc	%l0,	0x12D3,	%o3
	xorcc	%i6,	%l1,	%l4
	andn	%i1,	0x1CA6,	%g2
	tgu	%xcc,	0x7
	and	%i0,	%o4,	%l2
	movl	%xcc,	%l5,	%g1
	array8	%g4,	%i3,	%i4
	stx	%o5,	[%l7 + 0x28]
	bl	loop_1789
	fmovscs	%xcc,	%f12,	%f1
	tvs	%xcc,	0x7
	subcc	%g7,	0x10F9,	%g6
loop_1789:
	orcc	%g3,	0x0B7C,	%o0
	be,pn	%xcc,	loop_1790
	fmovrse	%o2,	%f7,	%f14
	taddcc	%o1,	%l6,	%o7
	srax	%i2,	0x1E,	%i5
loop_1790:
	popc	0x1E4E,	%g5
	subcc	%o6,	0x1D0C,	%i7
	bcc,pn	%icc,	loop_1791
	fornot2s	%f6,	%f12,	%f1
	sth	%l0,	[%l7 + 0x40]
	call	loop_1792
loop_1791:
	fbe,a	%fcc0,	loop_1793
	brgz,a	%o3,	loop_1794
	fmovdcs	%icc,	%f28,	%f30
loop_1792:
	movre	%l3,	%i6,	%l1
loop_1793:
	edge8	%l4,	%i1,	%i0
loop_1794:
	add	%o4,	0x05F5,	%g2
	ta	%icc,	0x4
	movle	%xcc,	%l2,	%l5
	edge32	%g1,	%g4,	%i3
	tneg	%xcc,	0x7
	sub	%i4,	%g7,	%o5
	tcc	%xcc,	0x2
	tne	%icc,	0x6
	lduh	[%l7 + 0x3E],	%g3
	sethi	0x1D9E,	%o0
	tneg	%xcc,	0x3
	movg	%xcc,	%g6,	%o2
	sra	%l6,	%o1,	%o7
	edge32n	%i5,	%i2,	%o6
	mulscc	%i7,	0x024C,	%l0
	fmovrdlz	%o3,	%f18,	%f16
	movl	%icc,	%l3,	%g5
	orcc	%l1,	0x0F3D,	%l4
	fbe	%fcc0,	loop_1795
	smulcc	%i6,	0x08A2,	%i0
	tcc	%xcc,	0x3
	tcs	%xcc,	0x1
loop_1795:
	fmovspos	%icc,	%f11,	%f18
	bgu,a,pt	%icc,	loop_1796
	and	%o4,	%g2,	%i1
	orcc	%l5,	%l2,	%g1
	fbe	%fcc2,	loop_1797
loop_1796:
	edge8	%g4,	%i3,	%g7
	andncc	%i4,	%g3,	%o0
	xnor	%g6,	%o2,	%o5
loop_1797:
	srax	%l6,	0x17,	%o7
	edge16l	%o1,	%i5,	%o6
	movne	%xcc,	%i7,	%i2
	taddcc	%o3,	%l0,	%g5
	sub	%l3,	%l4,	%i6
	tgu	%icc,	0x3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x46] %asi,	%i0
	movrlz	%o4,	%l1,	%g2
	tcc	%xcc,	0x7
	movleu	%icc,	%i1,	%l2
	movl	%xcc,	%g1,	%g4
	movrne	%l5,	0x176,	%i3
	fands	%f19,	%f18,	%f15
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x0c,	%g7
	faligndata	%f18,	%f8,	%f28
	tvc	%xcc,	0x7
	fble,a	%fcc0,	loop_1798
	te	%icc,	0x6
	movvs	%icc,	%i4,	%o0
	edge8ln	%g6,	%o2,	%g3
loop_1798:
	lduh	[%l7 + 0x18],	%o5
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x0c
	udivx	%l6,	0x0DCE,	%o7
	mulscc	%o1,	0x088D,	%i5
	set	0x30, %i0
	stwa	%i7,	[%l7 + %i0] 0x11
	fabsd	%f16,	%f8
	fnot1	%f20,	%f16
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%o6
	and	%i2,	0x0B4D,	%l0
	fbu,a	%fcc2,	loop_1799
	sdivcc	%g5,	0x069A,	%o3
	fmovda	%icc,	%f17,	%f31
	set	0x14, %g2
	stwa	%l3,	[%l7 + %g2] 0x0c
loop_1799:
	fmovde	%icc,	%f0,	%f7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x60] %asi,	%i6
	nop
	setx	0x6CE0643B4B8E9853,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f16
	movrgez	%l4,	%i0,	%o4
	umulcc	%l1,	%i1,	%l2
	addcc	%g2,	0x0233,	%g4
	tl	%xcc,	0x0
	subccc	%g1,	0x1267,	%i3
	movne	%xcc,	%l5,	%g7
	edge16ln	%o0,	%g6,	%o2
	fbul	%fcc1,	loop_1800
	te	%icc,	0x7
	movne	%icc,	%i4,	%g3
	tvc	%xcc,	0x1
loop_1800:
	fexpand	%f22,	%f8
	move	%xcc,	%o5,	%l6
	edge32	%o7,	%o1,	%i7
	fpadd32	%f16,	%f24,	%f24
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x76] %asi,	%o6
	addcc	%i5,	0x1FC4,	%l0
	fnot2s	%f13,	%f31
	array16	%g5,	%i2,	%o3
	udivx	%i6,	0x0F82,	%l3
	fnegs	%f16,	%f6
	xnor	%i0,	0x1E98,	%l4
	array16	%o4,	%i1,	%l1
	fcmpgt32	%f14,	%f28,	%g2
	xorcc	%g4,	%g1,	%l2
	edge16l	%i3,	%l5,	%o0
	xorcc	%g6,	%o2,	%g7
	movre	%g3,	0x13C,	%o5
	movl	%icc,	%l6,	%o7
	fbule	%fcc3,	loop_1801
	fnot1	%f18,	%f28
	movg	%xcc,	%i4,	%o1
	nop
	fitos	%f11,	%f1
	fstox	%f1,	%f18
	fxtos	%f18,	%f24
loop_1801:
	fnors	%f21,	%f28,	%f29
	movl	%icc,	%i7,	%o6
	fone	%f8
	bshuffle	%f14,	%f30,	%f6
	edge32n	%l0,	%i5,	%g5
	fbne	%fcc3,	loop_1802
	fcmple32	%f16,	%f12,	%o3
	nop
	fitos	%f7,	%f9
	fstox	%f9,	%f20
	fxtos	%f20,	%f23
	edge32	%i2,	%i6,	%l3
loop_1802:
	fbne,a	%fcc2,	loop_1803
	sll	%i0,	0x07,	%l4
	set	0x2C, %g1
	sta	%f5,	[%l7 + %g1] 0x81
loop_1803:
	ba,a,pt	%icc,	loop_1804
	fmovse	%icc,	%f15,	%f29
	edge16ln	%i1,	%l1,	%g2
	fpadd32	%f10,	%f26,	%f18
loop_1804:
	bne,a,pn	%xcc,	loop_1805
	edge32ln	%o4,	%g1,	%l2
	alignaddr	%g4,	%l5,	%i3
	nop
	set	0x44, %g4
	stw	%o0,	[%l7 + %g4]
loop_1805:
	tge	%xcc,	0x7
	be,a	loop_1806
	array32	%o2,	%g7,	%g3
	tle	%icc,	0x1
	lduh	[%l7 + 0x16],	%g6
loop_1806:
	sdivx	%o5,	0x07A3,	%l6
	fmul8x16	%f26,	%f2,	%f0
	xorcc	%o7,	%o1,	%i4
	tneg	%icc,	0x1
	fmovsvc	%xcc,	%f8,	%f1
	xnorcc	%o6,	0x0CEA,	%l0
	fmovscs	%icc,	%f25,	%f19
	subc	%i7,	%i5,	%o3
	fbug,a	%fcc1,	loop_1807
	srlx	%g5,	%i6,	%i2
	edge16	%l3,	%l4,	%i1
	sll	%i0,	%g2,	%o4
loop_1807:
	smul	%l1,	%g1,	%l2
	tcs	%icc,	0x3
	array16	%g4,	%i3,	%l5
	bpos,a,pt	%xcc,	loop_1808
	edge8l	%o0,	%o2,	%g3
	set	0x58, %i7
	prefetcha	[%l7 + %i7] 0x14,	 0x0
loop_1808:
	subccc	%g6,	%o5,	%o7
	fnot2s	%f14,	%f6
	edge16	%l6,	%i4,	%o6
	xnor	%l0,	%o1,	%i7
	fbne	%fcc0,	loop_1809
	edge16	%o3,	%i5,	%i6
	brgz,a	%i2,	loop_1810
	movvc	%icc,	%l3,	%l4
loop_1809:
	tcc	%icc,	0x6
	nop
	fitos	%f7,	%f11
	fstox	%f11,	%f16
loop_1810:
	ldsb	[%l7 + 0x11],	%g5
	tl	%icc,	0x5
	sub	%i1,	0x01A6,	%i0
	fbge	%fcc2,	loop_1811
	lduw	[%l7 + 0x70],	%g2
	edge16n	%o4,	%l1,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1811:
	ldsw	[%l7 + 0x58],	%l2
	nop
	setx	0x62C6EA9F9577312B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4CF551BFCA4BE086,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f24,	%f16
	fmovsl	%xcc,	%f31,	%f3
	alignaddr	%g4,	%i3,	%l5
	fmovdge	%xcc,	%f20,	%f26
	tge	%xcc,	0x3
	srl	%o2,	%g3,	%o0
	movneg	%xcc,	%g6,	%o5
	fmovdle	%xcc,	%f18,	%f13
	andncc	%g7,	%o7,	%l6
	tl	%icc,	0x3
	nop
	setx loop_1812, %l0, %l1
	jmpl %l1, %o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xFA6402A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x2572A04D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f21,	%f22
	for	%f18,	%f20,	%f24
loop_1812:
	nop
	fitod	%f20,	%f14
	sllx	%l0,	%o1,	%i7
	movcs	%icc,	%o3,	%i4
	fcmpeq32	%f8,	%f26,	%i6
	set	0x0A, %o5
	lduha	[%l7 + %o5] 0x10,	%i5
	addc	%l3,	0x1CE7,	%i2
	move	%icc,	%l4,	%g5
	fbl	%fcc0,	loop_1813
	fmovrdne	%i1,	%f10,	%f12
	nop
	setx	loop_1814,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcs	%xcc,	0x2
loop_1813:
	fcmple32	%f2,	%f20,	%g2
	fbule,a	%fcc2,	loop_1815
loop_1814:
	sdiv	%i0,	0x02C6,	%o4
	orn	%g1,	0x02E1,	%l2
	fmovrde	%l1,	%f28,	%f22
loop_1815:
	stbar
	fmovdcc	%icc,	%f0,	%f5
	nop
	setx	0x634BC0F0F865D5BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD9FC18DDF3F21D2E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f28,	%f10
	udivx	%g4,	0x07F6,	%i3
	fmul8x16au	%f10,	%f30,	%f24
	array16	%o2,	%l5,	%g3
	xnor	%g6,	0x1C16,	%o5
	fmovdge	%icc,	%f21,	%f0
	tle	%icc,	0x3
	movne	%icc,	%g7,	%o0
	edge32n	%l6,	%o7,	%l0
	ldsw	[%l7 + 0x54],	%o6
	movgu	%xcc,	%i7,	%o3
	fmovrsgez	%o1,	%f14,	%f13
	tg	%icc,	0x7
	fzero	%f14
	tg	%icc,	0x0
	srl	%i6,	0x10,	%i5
	bpos,a	loop_1816
	nop
	setx	0x97CF839970442A07,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	orn	%i4,	0x178C,	%l3
	stbar
loop_1816:
	alignaddr	%i2,	%g5,	%l4
	sdivx	%g2,	0x0D7B,	%i0
	addcc	%i1,	0x0A9A,	%g1
	tg	%icc,	0x6
	edge16ln	%o4,	%l2,	%g4
	movn	%xcc,	%i3,	%l1
	edge16	%l5,	%g3,	%g6
	wr	%g0,	0x18,	%asi
	stha	%o5,	[%l7 + 0x64] %asi
	orn	%g7,	%o2,	%l6
	fzeros	%f6
	st	%f30,	[%l7 + 0x7C]
	wr	%g0,	0x88,	%asi
	stwa	%o0,	[%l7 + 0x14] %asi
	fble,a	%fcc1,	loop_1817
	movneg	%icc,	%l0,	%o6
	or	%i7,	%o7,	%o3
	edge32ln	%o1,	%i5,	%i4
loop_1817:
	umulcc	%l3,	0x0667,	%i6
	xnor	%g5,	0x1CBA,	%i2
	orn	%g2,	0x0D28,	%l4
	fpadd32s	%f28,	%f22,	%f27
	edge16l	%i0,	%i1,	%g1
	tneg	%icc,	0x0
	fpadd16s	%f1,	%f22,	%f11
	edge16n	%l2,	%g4,	%o4
	umulcc	%i3,	%l1,	%l5
	edge32	%g6,	%o5,	%g3
	andncc	%g7,	%o2,	%l6
	array8	%l0,	%o0,	%o6
	taddcctv	%o7,	%i7,	%o3
	sra	%i5,	%o1,	%l3
	stbar
	movrlez	%i6,	0x03A,	%i4
	fpsub32	%f22,	%f20,	%f4
	bn,a	%icc,	loop_1818
	bge	%icc,	loop_1819
	alignaddr	%i2,	%g2,	%l4
	tge	%xcc,	0x5
loop_1818:
	edge8n	%g5,	%i0,	%g1
loop_1819:
	fzero	%f2
	fornot2s	%f21,	%f4,	%f30
	srl	%i1,	%l2,	%o4
	edge8n	%g4,	%i3,	%l5
	edge32l	%g6,	%l1,	%o5
	orcc	%g3,	%o2,	%l6
	srl	%l0,	0x02,	%g7
	wr	%g0,	0x04,	%asi
	sta	%f19,	[%l7 + 0x34] %asi
	fone	%f28
	fcmpgt32	%f4,	%f10,	%o6
	xorcc	%o0,	%i7,	%o7
	edge16ln	%o3,	%o1,	%i5
	movpos	%icc,	%i6,	%l3
	fbule,a	%fcc3,	loop_1820
	xnorcc	%i4,	%g2,	%l4
	ldd	[%l7 + 0x70],	%g4
	fmovdn	%icc,	%f8,	%f20
loop_1820:
	mulx	%i0,	%g1,	%i2
	fmovdcs	%icc,	%f17,	%f12
	movrgz	%i1,	0x253,	%o4
	movn	%icc,	%l2,	%g4
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x0c
	nop
	fitod	%f0,	%f22
	fdtoi	%f22,	%f11
	movpos	%icc,	%i3,	%l5
	taddcc	%g6,	%o5,	%l1
	orn	%g3,	%l6,	%o2
	sethi	0x0B5E,	%g7
	fmovdg	%xcc,	%f17,	%f12
	tleu	%icc,	0x2
	tvs	%icc,	0x0
	subccc	%l0,	0x1793,	%o6
	edge8n	%o0,	%o7,	%o3
	bpos,pt	%icc,	loop_1821
	and	%i7,	%o1,	%i5
	ldx	[%l7 + 0x50],	%i6
	movrlez	%l3,	0x2D8,	%g2
loop_1821:
	addc	%i4,	0x1BF9,	%g5
	movrlz	%i0,	%l4,	%i2
	movvs	%icc,	%g1,	%o4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x41] %asi,	%i1
	set	0x64, %i3
	lda	[%l7 + %i3] 0x19,	%f24
	umulcc	%g4,	%l2,	%l5
	movrgz	%i3,	0x398,	%g6
	edge32l	%o5,	%g3,	%l1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%l6
	movneg	%xcc,	%g7,	%l0
	brnz,a	%o2,	loop_1822
	movvs	%icc,	%o0,	%o6
	edge32l	%o3,	%o7,	%i7
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o1
loop_1822:
	edge32	%i6,	%i5,	%g2
	fexpand	%f10,	%f30
	tvs	%xcc,	0x0
	wr	%g0,	0x11,	%asi
	stxa	%i4,	[%l7 + 0x28] %asi
	smulcc	%g5,	0x18E0,	%l3
	nop
	fitos	%f18,	%f18
	and	%i0,	%l4,	%i2
	tsubcctv	%g1,	%i1,	%o4
	ldstub	[%l7 + 0x14],	%g4
	movleu	%xcc,	%l2,	%l5
	fbo,a	%fcc1,	loop_1823
	addcc	%g6,	%o5,	%i3
	add	%g3,	%l1,	%g7
	andncc	%l0,	%o2,	%l6
loop_1823:
	movneg	%icc,	%o0,	%o3
	fnot1	%f24,	%f22
	fmovdg	%xcc,	%f30,	%f28
	bgu,pn	%xcc,	loop_1824
	flush	%l7 + 0x68
	edge16	%o6,	%o7,	%i7
	tl	%xcc,	0x3
loop_1824:
	edge32ln	%i6,	%i5,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i4,	%g2
	bg,a,pn	%xcc,	loop_1825
	tle	%icc,	0x3
	edge32l	%g5,	%i0,	%l3
	tneg	%icc,	0x1
loop_1825:
	movneg	%icc,	%i2,	%g1
	xnorcc	%l4,	%o4,	%i1
	bvc,a	loop_1826
	movcc	%xcc,	%g4,	%l5
	brz	%l2,	loop_1827
	fmovdcc	%icc,	%f8,	%f19
loop_1826:
	st	%f28,	[%l7 + 0x28]
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x37] %asi,	%g6
loop_1827:
	ba,a,pn	%icc,	loop_1828
	fmovscs	%icc,	%f2,	%f29
	movrgez	%i3,	0x36A,	%o5
	tn	%icc,	0x0
loop_1828:
	edge16n	%g3,	%l1,	%l0
	set	0x1C, %l6
	swapa	[%l7 + %l6] 0x80,	%g7
	mova	%xcc,	%o2,	%o0
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x24] %asi,	%f27
	array8	%l6,	%o6,	%o3
	brgez	%i7,	loop_1829
	movrgez	%o7,	%i5,	%o1
	fcmpgt32	%f8,	%f26,	%i6
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
loop_1829:
	fandnot2s	%f12,	%f10,	%f0
	edge32l	%g5,	%g2,	%l3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x78] %asi,	%i0
	edge16n	%i2,	%l4,	%g1
	and	%o4,	%i1,	%g4
	array32	%l2,	%l5,	%g6
	movvs	%icc,	%o5,	%g3
	tpos	%xcc,	0x1
	sir	0x1A32
	tn	%xcc,	0x7
	std	%f12,	[%l7 + 0x48]
	fornot1s	%f4,	%f6,	%f14
	mulx	%l1,	%l0,	%g7
	sdivx	%o2,	0x0C8A,	%o0
	stx	%l6,	[%l7 + 0x10]
	ldub	[%l7 + 0x75],	%i3
	edge8n	%o3,	%i7,	%o7
	fpackfix	%f8,	%f20
	set	0x50, %o3
	ldda	[%l7 + %o3] 0x22,	%o6
	xorcc	%i5,	0x1867,	%o1
	edge32ln	%i4,	%i6,	%g5
	movvs	%icc,	%l3,	%i0
	edge16l	%g2,	%i2,	%l4
	lduh	[%l7 + 0x08],	%o4
	fbne	%fcc1,	loop_1830
	taddcctv	%g1,	0x1255,	%i1
	fbue,a	%fcc2,	loop_1831
	addc	%l2,	0x0584,	%g4
loop_1830:
	movvs	%xcc,	%l5,	%o5
	nop
	fitos	%f5,	%f11
	fstox	%f11,	%f28
	fxtos	%f28,	%f23
loop_1831:
	subccc	%g3,	0x10B5,	%l1
	fnot2s	%f29,	%f18
	nop
	setx	0xD1E748FEC83050F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x2D05140E7C4CB962,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f18,	%f16
	swap	[%l7 + 0x20],	%l0
	movleu	%icc,	%g7,	%o2
	te	%xcc,	0x7
	stb	%g6,	[%l7 + 0x75]
	sdiv	%l6,	0x1F26,	%o0
	andncc	%i3,	%i7,	%o3
	srlx	%o6,	0x18,	%i5
	fbu	%fcc0,	loop_1832
	fmovsvs	%xcc,	%f5,	%f9
	and	%o1,	%i4,	%o7
	movrgz	%i6,	%l3,	%i0
loop_1832:
	subc	%g2,	%g5,	%l4
	popc	%o4,	%g1
	mulscc	%i2,	%l2,	%i1
	tgu	%icc,	0x2
	srl	%g4,	%l5,	%g3
	fand	%f10,	%f26,	%f22
	udivx	%o5,	0x0EAC,	%l1
	fmovdvs	%icc,	%f17,	%f30
	ldsw	[%l7 + 0x74],	%l0
	array32	%g7,	%o2,	%l6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	fmovdcs	%xcc,	%f2,	%f16
	tn	%icc,	0x6
	tvc	%icc,	0x2
	fbul,a	%fcc0,	loop_1833
	tsubcctv	%i3,	%g6,	%i7
	andcc	%o6,	0x0DDD,	%o3
	nop
	setx	loop_1834,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1833:
	fcmple32	%f24,	%f30,	%o1
	fbn	%fcc3,	loop_1835
	array8	%i4,	%i5,	%o7
loop_1834:
	nop
	fitod	%f2,	%f28
	fdtos	%f28,	%f5
	fba	%fcc1,	loop_1836
loop_1835:
	nop
	fitod	%f10,	%f22
	fdtoi	%f22,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f22
loop_1836:
	flush	%l7 + 0x68
	tpos	%xcc,	0x1
	xnorcc	%l3,	%i0,	%i6
	nop
	fitod	%f4,	%f24
	fdtoi	%f24,	%f3
	nop
	setx	0xDDF102E2816BC7A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x5ADB6D21684AFFEF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f20,	%f4
	fbe	%fcc0,	loop_1837
	andncc	%g5,	%g2,	%l4
	umulcc	%o4,	0x1214,	%g1
	te	%icc,	0x2
loop_1837:
	fbul,a	%fcc0,	loop_1838
	edge16n	%i2,	%i1,	%g4
	fbule	%fcc1,	loop_1839
	movrgz	%l2,	%l5,	%o5
loop_1838:
	sdivx	%g3,	0x166E,	%l1
	fmovdleu	%xcc,	%f12,	%f25
loop_1839:
	sethi	0x1AB6,	%l0
	fmovsvc	%xcc,	%f9,	%f8
	fmovrslez	%g7,	%f2,	%f6
	bne,a	%xcc,	loop_1840
	subcc	%l6,	0x07EC,	%o0
	fpsub16	%f18,	%f8,	%f10
	brlez	%o2,	loop_1841
loop_1840:
	brlez,a	%i3,	loop_1842
	array32	%g6,	%i7,	%o6
	srax	%o3,	0x17,	%o1
loop_1841:
	orncc	%i4,	%i5,	%l3
loop_1842:
	movvs	%xcc,	%i0,	%o7
	array32	%i6,	%g2,	%l4
	bn	loop_1843
	addccc	%o4,	%g1,	%g5
	mulx	%i2,	0x0F25,	%g4
	movleu	%xcc,	%i1,	%l2
loop_1843:
	taddcc	%o5,	0x0DFA,	%g3
	fmul8x16au	%f1,	%f30,	%f0
	edge8l	%l1,	%l5,	%l0
	array8	%g7,	%l6,	%o2
	array8	%i3,	%g6,	%o0
	movvc	%icc,	%i7,	%o6
	tne	%icc,	0x3
	move	%icc,	%o1,	%i4
	xor	%i5,	%o3,	%i0
	nop
	setx	0xD7457AFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f10
	movrne	%o7,	0x0A0,	%i6
	orncc	%g2,	0x1C90,	%l3
	fbe	%fcc3,	loop_1844
	fblg	%fcc3,	loop_1845
	mulx	%l4,	%g1,	%g5
	bcc	%icc,	loop_1846
loop_1844:
	orcc	%o4,	0x0774,	%g4
loop_1845:
	ld	[%l7 + 0x6C],	%f13
	nop
	fitos	%f10,	%f30
	fstod	%f30,	%f8
loop_1846:
	array32	%i1,	%i2,	%l2
	fornot2	%f18,	%f14,	%f14
	movrgz	%g3,	0x398,	%l1
	sth	%o5,	[%l7 + 0x26]
	sdiv	%l0,	0x16D6,	%g7
	tneg	%icc,	0x0
	fmovdvs	%icc,	%f23,	%f10
	brgz	%l5,	loop_1847
	call	loop_1848
	fmovdneg	%xcc,	%f11,	%f14
	movle	%xcc,	%o2,	%i3
loop_1847:
	sth	%g6,	[%l7 + 0x40]
loop_1848:
	fmovrsgz	%l6,	%f18,	%f25
	nop
	setx	0x56912CDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x67179C4B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f17,	%f22
	fxnor	%f4,	%f2,	%f6
	fbu,a	%fcc3,	loop_1849
	nop
	setx	loop_1850,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcctv	%o0,	0x0C26,	%i7
	edge32l	%o1,	%o6,	%i4
loop_1849:
	fmovscs	%icc,	%f4,	%f24
loop_1850:
	bne,pt	%xcc,	loop_1851
	ldd	[%l7 + 0x28],	%o2
	fcmpne16	%f10,	%f20,	%i5
	lduw	[%l7 + 0x74],	%i0
loop_1851:
	tcs	%icc,	0x5
	edge8	%i6,	%o7,	%g2
	taddcc	%l4,	0x1483,	%g1
	tg	%icc,	0x3
	fxnor	%f20,	%f14,	%f20
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x5C] %asi,	%g5
	addcc	%l3,	%g4,	%o4
	taddcc	%i2,	0x0FE2,	%i1
	sethi	0x1463,	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l1,	%l2
	fmovspos	%icc,	%f1,	%f9
	ldsh	[%l7 + 0x1E],	%o5
	ldsb	[%l7 + 0x7E],	%l0
	nop
	setx	0x7B78A821,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x8E08B5A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f11,	%f15
	set	0x0A, %g7
	lduha	[%l7 + %g7] 0x04,	%g7
	fbg,a	%fcc0,	loop_1852
	movvc	%xcc,	%l5,	%o2
	movrne	%i3,	%l6,	%g6
	movgu	%xcc,	%i7,	%o1
loop_1852:
	edge16ln	%o6,	%i4,	%o3
	nop
	setx	0x6CC6C562585F9AE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x2301C924ED1CDC9E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f2,	%f4
	movvc	%xcc,	%o0,	%i5
	stb	%i0,	[%l7 + 0x53]
	addc	%o7,	%i6,	%l4
	bcs	loop_1853
	sth	%g2,	[%l7 + 0x60]
	array32	%g5,	%g1,	%l3
	fandnot1	%f28,	%f18,	%f20
loop_1853:
	nop
	wr	%g0,	0x80,	%asi
	stha	%g4,	[%l7 + 0x30] %asi
	movvc	%xcc,	%o4,	%i2
	nop
	setx	0xB07FC11D,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	edge8n	%g3,	%l1,	%l2
	addccc	%i1,	%o5,	%l0
	array8	%l5,	%g7,	%o2
	sdiv	%i3,	0x13FA,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x20] %asi,	%f16
	set	0x38, %i4
	stxa	%i7,	[%l7 + %i4] 0x19
	bleu	loop_1854
	tneg	%xcc,	0x4
	ta	%icc,	0x7
	brgez	%o1,	loop_1855
loop_1854:
	sethi	0x04A2,	%g6
	fnot1s	%f12,	%f13
	sethi	0x08DD,	%o6
loop_1855:
	membar	0x71
	movneg	%icc,	%i4,	%o3
	orcc	%o0,	%i5,	%o7
	mulx	%i6,	0x0E6E,	%l4
	array16	%g2,	%i0,	%g5
	lduh	[%l7 + 0x70],	%g1
	ldd	[%l7 + 0x40],	%f10
	srlx	%g4,	0x1E,	%o4
	or	%i2,	%l3,	%g3
	fandnot2s	%f5,	%f4,	%f31
	sll	%l2,	0x1C,	%i1
	smul	%o5,	%l0,	%l1
	orn	%l5,	0x1FBA,	%o2
	alignaddr	%g7,	%l6,	%i7
	edge8n	%o1,	%i3,	%o6
	fmovsgu	%icc,	%f8,	%f20
	smul	%g6,	%o3,	%o0
	nop
	setx	0xB243DCA32FCD3475,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x4421D01F07317C52,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f6,	%f14
	edge8	%i4,	%i5,	%o7
	nop
	fitos	%f22,	%f23
	edge16l	%i6,	%g2,	%l4
	fbn,a	%fcc2,	loop_1856
	sdivcc	%g5,	0x178E,	%i0
	fmovscs	%icc,	%f11,	%f10
	sllx	%g1,	0x1A,	%o4
loop_1856:
	srlx	%g4,	%i2,	%g3
	fba	%fcc0,	loop_1857
	movle	%icc,	%l3,	%i1
	set	0x68, %l3
	lduwa	[%l7 + %l3] 0x04,	%l2
loop_1857:
	fcmpeq32	%f2,	%f24,	%o5
	subccc	%l0,	%l5,	%o2
	fnands	%f13,	%f17,	%f13
	bvs,a,pt	%xcc,	loop_1858
	sethi	0x0D6B,	%g7
	smulcc	%l6,	0x0C8B,	%i7
	fones	%f11
loop_1858:
	ldsh	[%l7 + 0x78],	%o1
	stbar
	movrlz	%i3,	%o6,	%l1
	movrlz	%g6,	%o0,	%o3
	tsubcc	%i4,	0x18D0,	%i5
	fandnot2	%f12,	%f10,	%f10
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x20] %asi,	%i6
	fpsub16s	%f7,	%f28,	%f17
	fmovda	%icc,	%f29,	%f0
	sub	%o7,	%g2,	%l4
	fmovdge	%icc,	%f1,	%f24
	fpack32	%f26,	%f16,	%f18
	brlez,a	%g5,	loop_1859
	sra	%g1,	0x19,	%o4
	fmovsgu	%icc,	%f2,	%f13
	edge8	%g4,	%i2,	%g3
loop_1859:
	sir	0x0DEB
	fbo,a	%fcc2,	loop_1860
	alignaddrl	%l3,	%i1,	%l2
	edge32n	%i0,	%o5,	%l0
	fbuge,a	%fcc3,	loop_1861
loop_1860:
	nop
	setx	0x6BBAF0DF48984D10,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xE4947B7FE215C934,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f20,	%f18
	array16	%l5,	%g7,	%o2
	bvc,a,pn	%icc,	loop_1862
loop_1861:
	ldd	[%l7 + 0x78],	%f24
	fmovspos	%icc,	%f30,	%f15
	tcc	%xcc,	0x0
loop_1862:
	fnot1	%f12,	%f8
	edge8l	%i7,	%o1,	%l6
	srlx	%i3,	%o6,	%l1
	fmovsn	%xcc,	%f29,	%f26
	fba,a	%fcc2,	loop_1863
	popc	0x12BF,	%g6
	umulcc	%o0,	%i4,	%o3
	mulscc	%i6,	0x13BC,	%o7
loop_1863:
	fornot2s	%f23,	%f15,	%f15
	tvs	%xcc,	0x6
	tvs	%icc,	0x4
	fnegd	%f10,	%f26
	array16	%g2,	%l4,	%g5
	tvc	%icc,	0x7
	fmovrsne	%i5,	%f4,	%f17
	call	loop_1864
	nop
	setx loop_1865, %l0, %l1
	jmpl %l1, %g1
	bshuffle	%f30,	%f0,	%f18
	ta	%xcc,	0x6
loop_1864:
	mova	%xcc,	%o4,	%g4
loop_1865:
	edge16	%i2,	%g3,	%i1
	movre	%l2,	%i0,	%o5
	fmovrdgz	%l3,	%f4,	%f20
	fbu	%fcc1,	loop_1866
	fxor	%f18,	%f6,	%f22
	wr	%g0,	0x81,	%asi
	stha	%l5,	[%l7 + 0x42] %asi
loop_1866:
	fmovdn	%icc,	%f17,	%f24
	stb	%g7,	[%l7 + 0x6E]
	orn	%l0,	0x0AD9,	%o2
	addccc	%i7,	0x1650,	%l6
	fmovse	%xcc,	%f12,	%f28
	orncc	%o1,	0x0582,	%o6
	membar	0x06
	fmovdvc	%xcc,	%f5,	%f22
	bneg,pn	%xcc,	loop_1867
	ldsw	[%l7 + 0x28],	%l1
	movrlez	%g6,	%i3,	%o0
	andcc	%o3,	0x0892,	%i4
loop_1867:
	fmovrsgez	%o7,	%f22,	%f2
	movge	%icc,	%i6,	%l4
	xnorcc	%g2,	%i5,	%g1
	fnegd	%f18,	%f16
	xorcc	%o4,	%g5,	%i2
	fnegs	%f17,	%f16
	fblg	%fcc2,	loop_1868
	be,pt	%xcc,	loop_1869
	ldub	[%l7 + 0x49],	%g3
	subccc	%g4,	%i1,	%l2
loop_1868:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f30,	[%l7 + 0x74] %asi
loop_1869:
	movrgz	%o5,	0x139,	%i0
	fsrc1	%f22,	%f18
	std	%f28,	[%l7 + 0x28]
	movge	%xcc,	%l5,	%g7
	smul	%l0,	0x06D5,	%l3
	subc	%i7,	0x1A0C,	%o2
	fornot1	%f14,	%f20,	%f20
	edge8ln	%l6,	%o1,	%l1
	wr	%g0,	0x80,	%asi
	stba	%o6,	[%l7 + 0x33] %asi
	orn	%g6,	%i3,	%o3
	movrgez	%i4,	0x33F,	%o7
	fmovsvc	%icc,	%f29,	%f19
	sth	%i6,	[%l7 + 0x74]
	sdivx	%o0,	0x0A7A,	%g2
	set	0x6D, %l0
	ldsba	[%l7 + %l0] 0x11,	%l4
	fmovdle	%xcc,	%f5,	%f20
	fmovsa	%icc,	%f22,	%f19
	fmovrde	%g1,	%f22,	%f2
	xnor	%i5,	0x1D8A,	%o4
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbuge,a	%fcc0,	loop_1870
	fornot2	%f4,	%f26,	%f8
	brnz,a	%g5,	loop_1871
	tsubcctv	%g3,	%i2,	%i1
loop_1870:
	brlez,a	%l2,	loop_1872
	udivx	%g4,	0x0D6E,	%o5
loop_1871:
	fcmpeq32	%f14,	%f6,	%l5
	bge,pn	%xcc,	loop_1873
loop_1872:
	movrne	%g7,	%l0,	%l3
	ldd	[%l7 + 0x40],	%f20
	movcc	%xcc,	%i7,	%i0
loop_1873:
	tne	%xcc,	0x2
	fpadd16	%f18,	%f10,	%f20
	fsrc2s	%f2,	%f9
	set	0x6C, %o2
	stwa	%o2,	[%l7 + %o2] 0x19
	edge32n	%o1,	%l1,	%o6
	alignaddr	%l6,	%g6,	%o3
	fblg,a	%fcc2,	loop_1874
	bpos,a	loop_1875
	movvs	%xcc,	%i3,	%o7
	movneg	%icc,	%i6,	%i4
loop_1874:
	orncc	%o0,	0x092E,	%l4
loop_1875:
	smulcc	%g1,	0x02A5,	%g2
	te	%xcc,	0x2
	movge	%xcc,	%o4,	%g5
	set	0x60, %l2
	ldda	[%l7 + %l2] 0x81,	%i4
	faligndata	%f12,	%f20,	%f6
	movg	%xcc,	%i2,	%g3
	edge16ln	%l2,	%g4,	%o5
	fbuge,a	%fcc1,	loop_1876
	fbn,a	%fcc3,	loop_1877
	fbn	%fcc0,	loop_1878
	fandnot1s	%f28,	%f10,	%f4
loop_1876:
	popc	0x0BCE,	%i1
loop_1877:
	subc	%l5,	%l0,	%l3
loop_1878:
	movcs	%icc,	%i7,	%i0
	bneg	loop_1879
	edge8l	%g7,	%o2,	%l1
	and	%o6,	%o1,	%g6
	ta	%xcc,	0x1
loop_1879:
	xnor	%o3,	0x09FF,	%l6
	srlx	%o7,	0x1B,	%i6
	alignaddr	%i3,	%i4,	%l4
	fpadd16s	%f20,	%f10,	%f6
	edge32n	%o0,	%g1,	%o4
	tge	%icc,	0x4
	umulcc	%g2,	0x0A9B,	%i5
	bpos	%xcc,	loop_1880
	fpack32	%f22,	%f20,	%f12
	ldsb	[%l7 + 0x32],	%i2
	movleu	%xcc,	%g3,	%g5
loop_1880:
	fnegs	%f15,	%f31
	tpos	%xcc,	0x7
	brlez	%g4,	loop_1881
	fmovdn	%icc,	%f18,	%f0
	udiv	%o5,	0x0EB5,	%l2
	fnot1s	%f0,	%f19
loop_1881:
	fmuld8sux16	%f3,	%f8,	%f18
	edge16n	%i1,	%l0,	%l3
	sub	%l5,	0x1CAB,	%i7
	andcc	%i0,	0x092A,	%g7
	set	0x48, %l4
	stxa	%o2,	[%l7 + %l4] 0xe2
	membar	#Sync
	lduw	[%l7 + 0x28],	%l1
	set	0x78, %o7
	stxa	%o1,	[%l7 + %o7] 0x23
	membar	#Sync
	fmovsgu	%icc,	%f23,	%f15
	tl	%icc,	0x6
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x04,	%f16
	tsubcctv	%g6,	0x1808,	%o6
	add	%o3,	%l6,	%o7
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%i3
	set	0x75, %o4
	lduba	[%l7 + %o4] 0x04,	%i6
	movrne	%i4,	%l4,	%o0
	sdiv	%g1,	0x0C34,	%g2
	fcmpne32	%f28,	%f30,	%o4
	stx	%i5,	[%l7 + 0x60]
	edge16l	%g3,	%i2,	%g5
	movcs	%xcc,	%o5,	%l2
	nop
	setx	0x28A726EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f26
	edge32n	%g4,	%i1,	%l3
	add	%l5,	%l0,	%i0
	movcc	%icc,	%g7,	%i7
	stw	%l1,	[%l7 + 0x20]
	edge32	%o2,	%o1,	%o6
	subc	%o3,	0x04D1,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l6,	0x12,	%i3
	te	%icc,	0x1
	set	0x7C, %g6
	lduwa	[%l7 + %g6] 0x18,	%o7
	bcc,a	loop_1882
	tge	%xcc,	0x3
	fmovrdne	%i4,	%f20,	%f22
	fbo,a	%fcc2,	loop_1883
loop_1882:
	bgu	%xcc,	loop_1884
	fmovdl	%xcc,	%f20,	%f16
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x0c,	%l4
loop_1883:
	edge8ln	%i6,	%g1,	%o0
loop_1884:
	edge16ln	%o4,	%g2,	%g3
	sdivcc	%i5,	0x1D81,	%i2
	orn	%o5,	%l2,	%g5
	sir	0x01F1
	ba	loop_1885
	srlx	%i1,	%l3,	%g4
	array32	%l0,	%l5,	%i0
	movl	%icc,	%g7,	%i7
loop_1885:
	fmovdne	%icc,	%f27,	%f12
	array16	%l1,	%o1,	%o2
	andncc	%o6,	%o3,	%l6
	movrlz	%i3,	0x238,	%o7
	movrlz	%i4,	%l4,	%g6
	ldub	[%l7 + 0x50],	%g1
	movneg	%icc,	%i6,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f0
	xor	%o0,	0x1F88,	%g2
	fandnot2s	%f11,	%f18,	%f29
	bleu,a	loop_1886
	fbule,a	%fcc2,	loop_1887
	fbul	%fcc3,	loop_1888
	fmovsleu	%xcc,	%f28,	%f12
loop_1886:
	fnands	%f9,	%f29,	%f11
loop_1887:
	nop
	fitos	%f3,	%f31
	fstox	%f31,	%f8
loop_1888:
	tn	%icc,	0x7
	udivcc	%g3,	0x1007,	%i2
	movcs	%icc,	%o5,	%l2
	fmovsvc	%xcc,	%f17,	%f22
	fmovsn	%xcc,	%f21,	%f14
	fmovda	%icc,	%f12,	%f20
	brlez,a	%g5,	loop_1889
	tsubcctv	%i5,	0x00D8,	%i1
	nop
	setx loop_1890, %l0, %l1
	jmpl %l1, %l3
	fmovrdlz	%l0,	%f20,	%f8
loop_1889:
	lduh	[%l7 + 0x24],	%l5
	ldd	[%l7 + 0x68],	%g4
loop_1890:
	fnegd	%f22,	%f18
	subccc	%g7,	%i0,	%l1
	edge16	%o1,	%o2,	%i7
	tn	%icc,	0x3
	nop
	set	0x5C, %i6
	ldsw	[%l7 + %i6],	%o6
	bg,pn	%xcc,	loop_1891
	fbl,a	%fcc0,	loop_1892
	fbl	%fcc0,	loop_1893
	fbu,a	%fcc1,	loop_1894
loop_1891:
	fmovrslez	%l6,	%f27,	%f29
loop_1892:
	call	loop_1895
loop_1893:
	bg,a	loop_1896
loop_1894:
	movneg	%xcc,	%i3,	%o3
	nop
	fitos	%f25,	%f4
loop_1895:
	addccc	%o7,	0x0948,	%i4
loop_1896:
	subc	%l4,	%g1,	%g6
	brnz,a	%o4,	loop_1897
	fbue,a	%fcc3,	loop_1898
	sir	0x0ACC
	movge	%xcc,	%o0,	%g2
loop_1897:
	fandnot1	%f6,	%f24,	%f20
loop_1898:
	nop
	set	0x6F, %o1
	stba	%g3,	[%l7 + %o1] 0x10
	tvc	%icc,	0x7
	fbn	%fcc3,	loop_1899
	movle	%xcc,	%i6,	%i2
	bvc,pt	%icc,	loop_1900
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1899:
	bleu,a	%icc,	loop_1901
	smulcc	%o5,	0x0FE7,	%l2
loop_1900:
	membar	0x5F
	movvc	%xcc,	%g5,	%i5
loop_1901:
	brlz	%l3,	loop_1902
	tpos	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x16, %o6
	ldstuba	[%l7 + %o6] 0x81,	%i1
loop_1902:
	bvs,pt	%xcc,	loop_1903
	membar	0x65
	sll	%l0,	0x06,	%l5
	edge16	%g7,	%g4,	%l1
loop_1903:
	smul	%i0,	%o1,	%o2
	fble	%fcc0,	loop_1904
	sllx	%i7,	%o6,	%i3
	brgz	%o3,	loop_1905
	sth	%l6,	[%l7 + 0x44]
loop_1904:
	fnand	%f8,	%f22,	%f6
	nop
	setx	0xD9C42E97AFC15767,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x5BDEE2184AAC8CE8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f8,	%f0
loop_1905:
	nop
	setx	0x2CB35F00,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xBBE32409,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f4,	%f4
	movvs	%icc,	%o7,	%l4
	nop
	setx	0xDEB6B573F732137C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xCBB7FBA3B02B6650,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f2,	%f10
	udivcc	%g1,	0x10A0,	%g6
	addc	%o4,	%i4,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o0,	%i6,	%g3
	fcmpgt16	%f16,	%f4,	%i2
	movpos	%xcc,	%o5,	%l2
	fsrc2s	%f25,	%f3
	tcc	%xcc,	0x4
	srl	%g5,	%l3,	%i1
	array32	%i5,	%l5,	%l0
	sra	%g7,	0x09,	%g4
	smul	%i0,	%o1,	%o2
	tneg	%xcc,	0x3
	edge8	%l1,	%o6,	%i7
	fpadd16	%f18,	%f24,	%f16
	brgez	%i3,	loop_1906
	fpsub32s	%f28,	%f8,	%f10
	stb	%o3,	[%l7 + 0x48]
	srl	%o7,	%l6,	%l4
loop_1906:
	fmovdpos	%icc,	%f16,	%f12
	sdivcc	%g6,	0x10CE,	%o4
	movn	%icc,	%g1,	%g2
	fcmpgt16	%f26,	%f2,	%o0
	andn	%i6,	%g3,	%i4
	tneg	%xcc,	0x3
	movvc	%xcc,	%i2,	%o5
	movl	%icc,	%l2,	%g5
	fmovs	%f23,	%f10
	fnot1s	%f0,	%f8
	addc	%i1,	0x0AE1,	%l3
	nop
	fitos	%f5,	%f7
	fstox	%f7,	%f22
	fxtos	%f22,	%f4
	fbn,a	%fcc1,	loop_1907
	smul	%i5,	%l5,	%g7
	movvs	%xcc,	%l0,	%i0
	prefetch	[%l7 + 0x1C],	 0x2
loop_1907:
	orncc	%o1,	%o2,	%g4
	sra	%l1,	0x0D,	%i7
	bvc,pt	%xcc,	loop_1908
	fmovdle	%icc,	%f13,	%f25
	fblg	%fcc1,	loop_1909
	tpos	%xcc,	0x2
loop_1908:
	sdivx	%i3,	0x0D16,	%o6
	movl	%icc,	%o7,	%o3
loop_1909:
	umulcc	%l6,	%g6,	%l4
	fmovdn	%icc,	%f21,	%f26
	or	%g1,	%g2,	%o0
	popc	%o4,	%i6
	sra	%g3,	0x07,	%i2
	fmovsvs	%xcc,	%f3,	%f10
	movneg	%xcc,	%i4,	%o5
	fmovsge	%xcc,	%f3,	%f0
	fmovrdlez	%l2,	%f10,	%f4
	andn	%g5,	0x17E7,	%i1
	movg	%icc,	%i5,	%l3
	fmovdvs	%xcc,	%f23,	%f30
	fxnors	%f2,	%f31,	%f13
	popc	%g7,	%l0
	movcs	%xcc,	%l5,	%o1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o2,	%i0
	fpackfix	%f2,	%f9
	membar	0x3B
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x66, %i5
	lduha	[%l7 + %i5] 0x0c,	%g4
	fornot1	%f26,	%f20,	%f6
	fxnor	%f12,	%f24,	%f14
	movre	%i7,	0x227,	%i3
	fbl	%fcc0,	loop_1910
	mova	%icc,	%l1,	%o7
	fmovse	%xcc,	%f27,	%f5
	tg	%icc,	0x4
loop_1910:
	bcc,a,pn	%xcc,	loop_1911
	edge8ln	%o3,	%o6,	%l6
	fmovsa	%xcc,	%f7,	%f28
	movrgz	%l4,	0x3D2,	%g1
loop_1911:
	edge8l	%g6,	%o0,	%g2
	fbuge,a	%fcc3,	loop_1912
	taddcctv	%i6,	0x1DE4,	%g3
	sethi	0x090C,	%i2
	edge16l	%i4,	%o4,	%o5
loop_1912:
	fandnot2s	%f6,	%f23,	%f8
	fmovscc	%xcc,	%f12,	%f26
	ldub	[%l7 + 0x67],	%g5
	movvs	%xcc,	%i1,	%l2
	tcs	%icc,	0x1
	movle	%icc,	%i5,	%g7
	xnor	%l0,	0x0279,	%l5
	edge16n	%o1,	%l3,	%i0
	movrlz	%g4,	%i7,	%i3
	fsrc1	%f14,	%f24
	sdivcc	%o2,	0x13AE,	%l1
	nop
	setx loop_1913, %l0, %l1
	jmpl %l1, %o3
	srlx	%o7,	0x03,	%o6
	fmovsgu	%xcc,	%f4,	%f19
	udivx	%l4,	0x005F,	%g1
loop_1913:
	sethi	0x1F89,	%g6
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf0,	%f16
	lduh	[%l7 + 0x78],	%g2
	ldsb	[%l7 + 0x32],	%i6
	fmovsg	%xcc,	%f25,	%f2
	bvs,pt	%xcc,	loop_1914
	bcs	loop_1915
	and	%g3,	%i2,	%i4
	tneg	%xcc,	0x7
loop_1914:
	movne	%icc,	%o4,	%o5
loop_1915:
	fpackfix	%f2,	%f19
	fcmpgt16	%f22,	%f18,	%o0
	stx	%i1,	[%l7 + 0x08]
	movgu	%xcc,	%l2,	%g5
	udivcc	%i5,	0x04F1,	%g7
	fandnot1s	%f15,	%f24,	%f22
	alignaddrl	%l0,	%l5,	%o1
	subcc	%l3,	0x0F55,	%i0
	fxnor	%f4,	%f12,	%f26
	tgu	%xcc,	0x3
	edge8n	%g4,	%i7,	%i3
	tleu	%icc,	0x4
	movrgez	%o2,	%o3,	%l1
	edge8ln	%o6,	%l4,	%g1
	tne	%xcc,	0x5
	tne	%xcc,	0x2
	fmovdvs	%xcc,	%f6,	%f20
	fbg	%fcc0,	loop_1916
	mulscc	%o7,	%l6,	%g2
	movl	%xcc,	%g6,	%i6
	bshuffle	%f16,	%f16,	%f24
loop_1916:
	fpsub32	%f10,	%f0,	%f26
	fbug,a	%fcc2,	loop_1917
	movpos	%icc,	%i2,	%g3
	movrgez	%o4,	0x3B0,	%i4
	fmovdle	%xcc,	%f13,	%f28
loop_1917:
	be	loop_1918
	edge16	%o0,	%i1,	%l2
	fmovsle	%icc,	%f18,	%f28
	fmovsne	%xcc,	%f10,	%f17
loop_1918:
	xnor	%g5,	%o5,	%g7
	bcs	%icc,	loop_1919
	fbul,a	%fcc1,	loop_1920
	edge8l	%l0,	%l5,	%i5
	fmovscs	%icc,	%f28,	%f10
loop_1919:
	ldub	[%l7 + 0x5F],	%o1
loop_1920:
	movle	%xcc,	%l3,	%i0
	movrne	%i7,	%g4,	%i3
	edge32ln	%o2,	%o3,	%l1
	sllx	%l4,	0x03,	%o6
	fmovsg	%icc,	%f7,	%f8
	xorcc	%o7,	%l6,	%g2
	fmovsne	%xcc,	%f4,	%f15
	ldd	[%l7 + 0x10],	%f6
	edge8l	%g1,	%i6,	%i2
	set	0x3C, %l5
	ldswa	[%l7 + %l5] 0x0c,	%g6
	tge	%icc,	0x4
	addccc	%o4,	%i4,	%o0
	sdivcc	%i1,	0x05F6,	%g3
	fnot1s	%f0,	%f0
	fpsub32	%f6,	%f30,	%f18
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5D] %asi,	%l2
	sllx	%g5,	%g7,	%o5
	fmovdl	%icc,	%f29,	%f26
	sub	%l0,	%i5,	%o1
	fcmpeq16	%f12,	%f20,	%l5
	brlez	%l3,	loop_1921
	movvc	%icc,	%i0,	%g4
	fmovrslz	%i3,	%f25,	%f30
	mulscc	%i7,	%o3,	%o2
loop_1921:
	sllx	%l1,	%o6,	%o7
	udivcc	%l4,	0x0EF0,	%g2
	tsubcctv	%l6,	0x1043,	%i6
	fnor	%f28,	%f10,	%f16
	tpos	%xcc,	0x5
	tvs	%xcc,	0x7
	nop
	fitos	%f20,	%f24
	srax	%g1,	%i2,	%o4
	srax	%g6,	%i4,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i1,	%l2,	%g5
	movge	%icc,	%g3,	%o5
	taddcc	%l0,	0x0CF1,	%g7
	movrlez	%o1,	%l5,	%l3
	tle	%xcc,	0x5
	fpsub32	%f16,	%f16,	%f4
	edge16n	%i5,	%i0,	%i3
	fpadd32	%f18,	%f20,	%f14
	fmovrde	%i7,	%f28,	%f22
	movrlez	%g4,	0x3DA,	%o2
	fabsd	%f20,	%f0
	set	0x70, %o0
	prefetcha	[%l7 + %o0] 0x19,	 0x2
	fbul	%fcc2,	loop_1922
	fabsd	%f20,	%f2
	fandnot1s	%f7,	%f20,	%f14
	subccc	%o6,	0x0773,	%l1
loop_1922:
	tl	%icc,	0x4
	udivcc	%l4,	0x1625,	%o7
	xnorcc	%g2,	%l6,	%i6
	fble	%fcc0,	loop_1923
	fbg,a	%fcc0,	loop_1924
	fcmpne32	%f8,	%f2,	%g1
	fmovdn	%xcc,	%f8,	%f10
loop_1923:
	movcs	%icc,	%o4,	%g6
loop_1924:
	subc	%i2,	%i4,	%i1
	fbg,a	%fcc1,	loop_1925
	fmovscc	%icc,	%f30,	%f7
	srl	%l2,	0x12,	%o0
	movre	%g5,	%g3,	%l0
loop_1925:
	xnor	%g7,	%o1,	%o5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	movrgz	%i5,	0x253,	%i0
	subccc	%l3,	0x1DB6,	%i3
	or	%i7,	%g4,	%o3
	te	%icc,	0x1
	fmovse	%icc,	%f6,	%f1
	ldsh	[%l7 + 0x1A],	%o6
	fble	%fcc1,	loop_1926
	lduw	[%l7 + 0x08],	%l1
	fmovrdgz	%l4,	%f0,	%f4
	fbule,a	%fcc1,	loop_1927
loop_1926:
	fbue	%fcc0,	loop_1928
	edge16l	%o2,	%o7,	%g2
	fmovrdgez	%l6,	%f8,	%f14
loop_1927:
	stb	%i6,	[%l7 + 0x5F]
loop_1928:
	bne	%xcc,	loop_1929
	and	%o4,	0x0794,	%g6
	popc	%g1,	%i2
	smulcc	%i4,	%l2,	%i1
loop_1929:
	fornot1	%f30,	%f24,	%f24
	fsrc1s	%f27,	%f20
	fsrc1s	%f25,	%f1
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%f8
	and	%o0,	0x19E1,	%g3
	andncc	%l0,	%g7,	%o1
	subcc	%o5,	%g5,	%l5
	add	%i0,	%l3,	%i5
	brlz	%i7,	loop_1930
	sth	%i3,	[%l7 + 0x66]
	taddcc	%g4,	%o6,	%l1
	tsubcctv	%l4,	0x145F,	%o3
loop_1930:
	addc	%o7,	%o2,	%l6
	tleu	%icc,	0x6
	fcmpeq32	%f2,	%f18,	%i6
	fmovdneg	%xcc,	%f24,	%f19
	tl	%xcc,	0x3
	fandnot2s	%f10,	%f16,	%f8
	bpos,pn	%xcc,	loop_1931
	andn	%o4,	0x19C6,	%g2
	sir	0x112A
	addc	%g1,	%i2,	%g6
loop_1931:
	bn,pt	%xcc,	loop_1932
	fbne	%fcc2,	loop_1933
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l2,	%i4
loop_1932:
	movleu	%icc,	%i1,	%g3
loop_1933:
	mulscc	%o0,	0x15C7,	%l0
	fmovdleu	%icc,	%f30,	%f6
	edge32n	%g7,	%o5,	%o1
	orncc	%g5,	%l5,	%l3
	fnot1	%f20,	%f8
	ld	[%l7 + 0x6C],	%f14
	bn,a,pt	%icc,	loop_1934
	movrgz	%i0,	0x0DE,	%i7
	fpadd16	%f20,	%f22,	%f4
	membar	0x64
loop_1934:
	umulcc	%i3,	0x09AE,	%g4
	call	loop_1935
	movrgz	%o6,	0x3A2,	%l1
	smul	%l4,	%o3,	%o7
	tsubcc	%o2,	0x03EB,	%i5
loop_1935:
	alignaddrl	%i6,	%o4,	%g2
	call	loop_1936
	fmovdcs	%icc,	%f29,	%f13
	add	%l6,	%i2,	%g1
	fmovrdlz	%l2,	%f18,	%f22
loop_1936:
	tn	%xcc,	0x7
	tge	%icc,	0x1
	subccc	%i4,	%g6,	%i1
	sdivcc	%g3,	0x087F,	%l0
	sub	%o0,	%o5,	%o1
	mulscc	%g7,	0x160F,	%l5
	edge16	%g5,	%l3,	%i0
	srl	%i3,	0x0A,	%i7
	umulcc	%g4,	%l1,	%o6
	be,pn	%icc,	loop_1937
	andn	%o3,	%l4,	%o7
	fmovdcc	%icc,	%f15,	%f10
	brgez,a	%i5,	loop_1938
loop_1937:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i6,	[%l7 + 0x4C]
	fpsub32	%f12,	%f22,	%f2
loop_1938:
	movn	%icc,	%o4,	%o2
	movvc	%xcc,	%g2,	%l6
	sethi	0x1BFC,	%i2
	nop
	setx	0x244D0CE1106558BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tle	%icc,	0x4
	tvs	%icc,	0x5
	fpadd16s	%f22,	%f4,	%f17
	fbue	%fcc2,	loop_1939
	udivcc	%g1,	0x1F71,	%i4
	fxnors	%f17,	%f6,	%f25
	set	0x6C, %g2
	lda	[%l7 + %g2] 0x19,	%f30
loop_1939:
	nop
	set	0x7C, %i2
	stwa	%g6,	[%l7 + %i2] 0x2a
	membar	#Sync
	movre	%i1,	0x1CB,	%l2
	addc	%l0,	0x120C,	%o0
	edge32n	%o5,	%o1,	%g3
	movcs	%icc,	%l5,	%g7
	flush	%l7 + 0x30
	udivx	%g5,	0x0161,	%i0
	swap	[%l7 + 0x4C],	%l3
	movrne	%i7,	%i3,	%l1
	brlez,a	%g4,	loop_1940
	tvs	%xcc,	0x0
	sir	0x0B10
	tvs	%xcc,	0x5
loop_1940:
	bneg,pt	%xcc,	loop_1941
	movvc	%icc,	%o6,	%l4
	sdiv	%o7,	0x124B,	%o3
	set	0x70, %g4
	ldda	[%l7 + %g4] 0x26,	%i4
loop_1941:
	nop
	wr	%g0,	0x89,	%asi
	stxa	%o4,	[%l7 + 0x68] %asi
	fmuld8sux16	%f21,	%f3,	%f18
	fmovdl	%xcc,	%f1,	%f4
	orn	%o2,	%i6,	%g2
	movrlez	%l6,	%g1,	%i2
	tvs	%icc,	0x4
	tpos	%xcc,	0x7
	fmovdgu	%icc,	%f9,	%f24
	tcc	%icc,	0x1
	tsubcctv	%g6,	0x051B,	%i1
	fmovrsgz	%i4,	%f20,	%f5
	edge16n	%l0,	%o0,	%o5
	tleu	%icc,	0x6
	fmovdcc	%xcc,	%f7,	%f19
	fbne,a	%fcc2,	loop_1942
	fmovsge	%icc,	%f13,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x04,	%o1,	%g3
loop_1942:
	edge32ln	%l5,	%l2,	%g5
	sll	%g7,	0x00,	%i0
	fnot1s	%f30,	%f10
	swap	[%l7 + 0x7C],	%i7
	fbule,a	%fcc0,	loop_1943
	udiv	%i3,	0x1408,	%l1
	subc	%g4,	0x0067,	%l3
	tl	%icc,	0x4
loop_1943:
	fnors	%f10,	%f19,	%f28
	fones	%f28
	bg	%icc,	loop_1944
	tcc	%xcc,	0x1
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o6
loop_1944:
	orncc	%l4,	%o3,	%i5
	fbn,a	%fcc3,	loop_1945
	sth	%o4,	[%l7 + 0x0C]
	umul	%o2,	0x1BE7,	%i6
	nop
	fitod	%f12,	%f6
	fdtos	%f6,	%f25
loop_1945:
	nop
	setx	0x03FA0521,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x5850D2ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f25,	%f26
	fbg,a	%fcc1,	loop_1946
	movneg	%icc,	%g2,	%o7
	movge	%icc,	%g1,	%l6
	membar	0x06
loop_1946:
	ldx	[%l7 + 0x50],	%g6
	edge8n	%i2,	%i1,	%i4
	fba	%fcc3,	loop_1947
	sth	%o0,	[%l7 + 0x40]
	tcc	%xcc,	0x1
	nop
	setx	0x63B1BF51,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xADB4E3A5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f2,	%f30
loop_1947:
	fcmpne16	%f26,	%f16,	%o5
	movrgz	%l0,	%o1,	%g3
	nop
	setx	0xE3CB2F90B05F065F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	movleu	%icc,	%l2,	%g5
	sll	%g7,	%l5,	%i0
	bn,pn	%icc,	loop_1948
	subcc	%i7,	0x130F,	%l1
	fmovdl	%xcc,	%f22,	%f25
	movrlz	%g4,	0x015,	%l3
loop_1948:
	movrlez	%i3,	%o6,	%o3
	movrgez	%l4,	%i5,	%o2
	brgez	%o4,	loop_1949
	tcs	%xcc,	0x7
	movgu	%xcc,	%i6,	%o7
	brgez,a	%g1,	loop_1950
loop_1949:
	subc	%l6,	0x0B61,	%g6
	tvc	%xcc,	0x2
	wr	%g0,	0x27,	%asi
	stba	%g2,	[%l7 + 0x3C] %asi
	membar	#Sync
loop_1950:
	udivcc	%i1,	0x01B8,	%i4
	ldd	[%l7 + 0x20],	%o0
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbo	%fcc1,	loop_1951
	udivcc	%o5,	0x1EE9,	%l0
	nop
	fitod	%f8,	%f30
	fdtoi	%f30,	%f31
	fmovse	%icc,	%f14,	%f31
loop_1951:
	edge32	%i2,	%o1,	%g3
	tcc	%xcc,	0x7
	nop
	fitod	%f2,	%f28
	fdtoi	%f28,	%f10
	tsubcctv	%l2,	0x155E,	%g7
	wr	%g0,	0xe2,	%asi
	stha	%g5,	[%l7 + 0x54] %asi
	membar	#Sync
	or	%l5,	%i0,	%l1
	fmovrdlez	%i7,	%f10,	%f18
	fmovs	%f5,	%f26
	edge32	%l3,	%g4,	%o6
	xor	%o3,	0x0049,	%i3
	movne	%xcc,	%i5,	%o2
	array16	%o4,	%l4,	%o7
	taddcctv	%g1,	%l6,	%i6
	tne	%icc,	0x1
	tne	%xcc,	0x0
	fbu	%fcc1,	loop_1952
	movrlez	%g2,	0x0F3,	%g6
	fmovsne	%xcc,	%f22,	%f22
	fbue	%fcc2,	loop_1953
loop_1952:
	movleu	%icc,	%i4,	%i1
	fmovdvs	%xcc,	%f22,	%f6
	udivcc	%o0,	0x138A,	%o5
loop_1953:
	fxnors	%f31,	%f28,	%f2
	mova	%icc,	%l0,	%i2
	fbu,a	%fcc3,	loop_1954
	sllx	%o1,	%g3,	%g7
	addccc	%l2,	0x10C2,	%g5
	nop
	setx	0x56B0805DEE03E500,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f12
loop_1954:
	xnor	%i0,	0x1A1B,	%l1
	sra	%i7,	0x10,	%l5
	brlz	%l3,	loop_1955
	movcc	%icc,	%o6,	%g4
	xnorcc	%o3,	0x13F0,	%i5
	fmovrsgez	%i3,	%f31,	%f1
loop_1955:
	edge8ln	%o4,	%o2,	%o7
	mova	%icc,	%g1,	%l6
	alignaddrl	%l4,	%i6,	%g2
	movpos	%icc,	%i4,	%g6
	tgu	%xcc,	0x5
	tvc	%xcc,	0x0
	udiv	%o0,	0x0CED,	%o5
	edge8l	%l0,	%i1,	%i2
	umul	%o1,	0x1508,	%g7
	array8	%l2,	%g5,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i0,	%i7,	%l1
	sethi	0x1BAC,	%l5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%o6,	%g4
	edge8	%o3,	%i5,	%l3
	brgez,a	%o4,	loop_1956
	fnot2	%f4,	%f10
	tn	%icc,	0x5
	wr	%g0,	0x18,	%asi
	sta	%f30,	[%l7 + 0x7C] %asi
loop_1956:
	prefetch	[%l7 + 0x7C],	 0x2
	fmovrdlez	%o2,	%f0,	%f14
	fble	%fcc2,	loop_1957
	array32	%i3,	%o7,	%l6
	tpos	%icc,	0x1
	fxnor	%f6,	%f4,	%f0
loop_1957:
	bpos,pn	%icc,	loop_1958
	bne,a,pn	%icc,	loop_1959
	tn	%xcc,	0x7
	te	%icc,	0x3
loop_1958:
	edge32l	%l4,	%i6,	%g2
loop_1959:
	brlez,a	%g1,	loop_1960
	fbne	%fcc1,	loop_1961
	fmovdvs	%xcc,	%f17,	%f9
	lduw	[%l7 + 0x20],	%g6
loop_1960:
	fmovscs	%icc,	%f31,	%f31
loop_1961:
	te	%icc,	0x6
	fpmerge	%f9,	%f26,	%f0
	bgu,pn	%icc,	loop_1962
	tsubcc	%o0,	%i4,	%o5
	fblg	%fcc1,	loop_1963
	array16	%l0,	%i2,	%i1
loop_1962:
	movn	%xcc,	%o1,	%l2
	sdiv	%g5,	0x077F,	%g7
loop_1963:
	sethi	0x1652,	%g3
	fble	%fcc0,	loop_1964
	fbl,a	%fcc2,	loop_1965
	mulx	%i7,	0x10DF,	%i0
	edge16n	%l5,	%l1,	%o6
loop_1964:
	bn,a,pn	%icc,	loop_1966
loop_1965:
	bvs,pn	%icc,	loop_1967
	tcs	%xcc,	0x0
	movpos	%icc,	%g4,	%i5
loop_1966:
	stbar
loop_1967:
	be,pt	%icc,	loop_1968
	sllx	%o3,	0x0F,	%l3
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f13
	addc	%o4,	0x0531,	%o2
loop_1968:
	nop
	setx	0xC44FBE947A4C8332,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x413703466F5A4D2C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f16,	%f0
	fmovdleu	%xcc,	%f12,	%f14
	fzero	%f24
	sdiv	%i3,	0x0FEC,	%o7
	bcs,pn	%icc,	loop_1969
	subc	%l6,	%l4,	%i6
	fbe	%fcc2,	loop_1970
	addc	%g2,	%g1,	%o0
loop_1969:
	fones	%f4
	xnorcc	%g6,	%o5,	%i4
loop_1970:
	nop
	setx	0x49C4429C106AC1D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	stw	%i2,	[%l7 + 0x68]
	addccc	%i1,	0x1431,	%o1
	nop
	setx	0x04D4FFED3285CE6E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f24
	faligndata	%f14,	%f4,	%f2
	fbge,a	%fcc1,	loop_1971
	fmovsl	%xcc,	%f6,	%f4
	or	%l2,	0x0631,	%g5
	edge32l	%g7,	%g3,	%l0
loop_1971:
	edge16ln	%i0,	%l5,	%l1
	movl	%xcc,	%i7,	%g4
	sllx	%i5,	%o6,	%l3
	andncc	%o4,	%o2,	%o3
	brz,a	%o7,	loop_1972
	fones	%f28
	fmovsvc	%xcc,	%f5,	%f16
	sth	%l6,	[%l7 + 0x7C]
loop_1972:
	fmovrsgz	%i3,	%f1,	%f16
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x14,	%i6
	taddcc	%g2,	0x0F32,	%l4
	fmovdl	%icc,	%f19,	%f5
	udivcc	%g1,	0x1B0E,	%o0
	sir	0x03BE
	tpos	%xcc,	0x5
	sethi	0x0932,	%g6
	tneg	%icc,	0x7
	ble,a,pt	%xcc,	loop_1973
	srax	%o5,	0x18,	%i4
	mulx	%i1,	0x13AD,	%o1
	fone	%f20
loop_1973:
	sub	%l2,	0x0186,	%i2
	nop
	fitod	%f6,	%f16
	fdtoi	%f16,	%f17
	movrgz	%g5,	%g7,	%g3
	fcmple32	%f12,	%f14,	%i0
	movvs	%xcc,	%l0,	%l1
	edge32l	%i7,	%l5,	%i5
	brlez,a	%o6,	loop_1974
	edge32l	%l3,	%g4,	%o2
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f26
	fxtod	%f26,	%f26
	edge8	%o3,	%o7,	%o4
loop_1974:
	tpos	%xcc,	0x5
	ldstub	[%l7 + 0x24],	%i3
	movg	%icc,	%l6,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xCC6F2887B12DA4F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xD9A06CCE5963833D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f4,	%f18
	fmul8x16au	%f5,	%f25,	%f22
	fmovrsgez	%l4,	%f5,	%f22
	movg	%icc,	%g2,	%o0
	fbu,a	%fcc2,	loop_1975
	sethi	0x0BF4,	%g1
	sethi	0x0180,	%o5
	udiv	%g6,	0x09EF,	%i4
loop_1975:
	alignaddr	%i1,	%o1,	%l2
	fcmpgt32	%f6,	%f6,	%i2
	movle	%icc,	%g7,	%g5
	set	0x0, %o5
	stxa	%g3,	[%g0 + %o5] 0x5f
	array8	%i0,	%l0,	%i7
	bvc,a,pn	%xcc,	loop_1976
	nop
	set	0x50, %l1
	ldstub	[%l7 + %l1],	%l5
	faligndata	%f0,	%f22,	%f4
	fbge	%fcc0,	loop_1977
loop_1976:
	movge	%icc,	%i5,	%o6
	ld	[%l7 + 0x74],	%f23
	call	loop_1978
loop_1977:
	bn,a,pt	%xcc,	loop_1979
	fnot1	%f16,	%f6
	nop
	fitos	%f10,	%f17
	fstox	%f17,	%f24
	fxtos	%f24,	%f28
loop_1978:
	alignaddr	%l3,	%g4,	%o2
loop_1979:
	addcc	%o3,	%l1,	%o7
	fbge,a	%fcc2,	loop_1980
	fmovsne	%icc,	%f3,	%f22
	tsubcc	%o4,	%l6,	%i6
	alignaddrl	%i3,	%l4,	%o0
loop_1980:
	ld	[%l7 + 0x24],	%f22
	smulcc	%g1,	%o5,	%g2
	array16	%g6,	%i1,	%i4
	movrgz	%l2,	0x1C3,	%o1
	brgez,a	%i2,	loop_1981
	smulcc	%g7,	0x061B,	%g3
	ldd	[%l7 + 0x38],	%i0
	umulcc	%g5,	%l0,	%i7
loop_1981:
	addcc	%i5,	%l5,	%l3
	sra	%o6,	%g4,	%o3
	movcs	%xcc,	%o2,	%l1
	ldx	[%l7 + 0x08],	%o4
	bshuffle	%f14,	%f22,	%f8
	or	%l6,	%i6,	%i3
	fmul8x16al	%f28,	%f17,	%f2
	movleu	%xcc,	%o7,	%l4
	tl	%xcc,	0x6
	fbg,a	%fcc3,	loop_1982
	tpos	%xcc,	0x2
	movleu	%xcc,	%g1,	%o5
	pdist	%f6,	%f16,	%f4
loop_1982:
	alignaddrl	%o0,	%g2,	%i1
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g6
	ldd	[%l7 + 0x68],	%l2
	fmovsvc	%xcc,	%f20,	%f10
	brz	%i4,	loop_1983
	tvc	%icc,	0x6
	nop
	fitod	%f2,	%f30
	fdtox	%f30,	%f8
	ldstub	[%l7 + 0x6F],	%i2
loop_1983:
	fcmpne16	%f10,	%f10,	%g7
	movneg	%icc,	%o1,	%i0
	edge32n	%g3,	%g5,	%l0
	tg	%xcc,	0x7
	tleu	%xcc,	0x1
	fpadd16s	%f14,	%f25,	%f22
	edge16n	%i5,	%l5,	%i7
	sllx	%o6,	0x09,	%l3
	fbge,a	%fcc2,	loop_1984
	movrlz	%o3,	%g4,	%l1
	ldstub	[%l7 + 0x6C],	%o2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x80,	%o4,	%l6
loop_1984:
	subcc	%i6,	0x080F,	%i3
	orcc	%l4,	0x1F68,	%g1
	movrgz	%o7,	%o5,	%g2
	movrlz	%o0,	0x3FC,	%i1
	for	%f12,	%f10,	%f12
	edge8ln	%l2,	%g6,	%i2
	movrlez	%g7,	%o1,	%i4
	fcmple16	%f20,	%f16,	%g3
	sdivx	%i0,	0x163E,	%g5
	tneg	%xcc,	0x7
	movleu	%xcc,	%l0,	%i5
	move	%icc,	%l5,	%o6
	fmovdcs	%icc,	%f31,	%f20
	movgu	%xcc,	%i7,	%l3
	taddcc	%o3,	%g4,	%l1
	xor	%o2,	0x1C54,	%o4
	xnor	%i6,	%i3,	%l6
	taddcc	%l4,	0x10FF,	%o7
	tneg	%icc,	0x7
	brz,a	%o5,	loop_1985
	tsubcc	%g2,	%g1,	%i1
	tvc	%icc,	0x2
	taddcc	%o0,	%g6,	%i2
loop_1985:
	fblg	%fcc1,	loop_1986
	movpos	%icc,	%l2,	%g7
	sdivx	%i4,	0x094F,	%g3
	fmovdcc	%xcc,	%f25,	%f12
loop_1986:
	xnorcc	%i0,	%g5,	%l0
	nop
	setx loop_1987, %l0, %l1
	jmpl %l1, %i5
	tgu	%icc,	0x2
	fbl,a	%fcc2,	loop_1988
	fxnors	%f20,	%f24,	%f10
loop_1987:
	fmovrdgez	%o1,	%f26,	%f24
	popc	%l5,	%o6
loop_1988:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l3
	set	0x08, %i7
	prefetcha	[%l7 + %i7] 0x19,	 0x1
	sra	%g4,	%l1,	%i7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%o2,	%o4
	movvs	%xcc,	%i3,	%l6
	ldub	[%l7 + 0x66],	%i6
	edge32n	%o7,	%o5,	%g2
	udiv	%g1,	0x0227,	%i1
	sethi	0x19FF,	%l4
	fnot2	%f0,	%f26
	nop
	setx loop_1989, %l0, %l1
	jmpl %l1, %g6
	stbar
	ldsb	[%l7 + 0x2A],	%o0
	fmovdg	%xcc,	%f23,	%f12
loop_1989:
	lduw	[%l7 + 0x6C],	%i2
	ldx	[%l7 + 0x58],	%l2
	fbe,a	%fcc3,	loop_1990
	fandnot2s	%f8,	%f14,	%f26
	fbu,a	%fcc0,	loop_1991
	movn	%xcc,	%i4,	%g3
loop_1990:
	taddcctv	%g7,	%g5,	%l0
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f31
loop_1991:
	orcc	%i0,	%i5,	%l5
	movn	%xcc,	%o1,	%l3
	movcc	%icc,	%o3,	%g4
	fmovrse	%o6,	%f19,	%f23
	pdist	%f16,	%f8,	%f26
	ta	%xcc,	0x6
	fblg,a	%fcc3,	loop_1992
	movl	%xcc,	%l1,	%o2
	movgu	%xcc,	%o4,	%i7
	udivcc	%l6,	0x14D0,	%i3
loop_1992:
	edge8n	%i6,	%o7,	%g2
	fbe	%fcc0,	loop_1993
	fmuld8ulx16	%f30,	%f26,	%f6
	xorcc	%g1,	0x1CD6,	%o5
	edge16n	%l4,	%i1,	%g6
loop_1993:
	array16	%i2,	%l2,	%o0
	nop
	setx	0x236D8DBF9066EB21,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	andn	%i4,	%g7,	%g5
	fornot1s	%f26,	%f13,	%f23
	st	%f9,	[%l7 + 0x08]
	nop
	fitod	%f8,	%f26
	fdtos	%f26,	%f4
	fmovdleu	%xcc,	%f4,	%f17
	popc	%l0,	%g3
	array16	%i0,	%l5,	%o1
	bcs,a	%xcc,	loop_1994
	addc	%l3,	%o3,	%g4
	fsrc2	%f24,	%f18
	set	0x1B, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i5
loop_1994:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x40] %asi,	%o6
	mulscc	%l1,	0x0394,	%o4
	membar	0x41
	array16	%i7,	%o2,	%i3
	xnor	%l6,	0x0B15,	%o7
	fmul8x16al	%f24,	%f19,	%f30
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%i6
	xorcc	%g1,	0x0B69,	%l4
	tsubcctv	%i1,	0x171E,	%g6
	brlez,a	%i2,	loop_1995
	array8	%l2,	%o0,	%o5
	edge32	%i4,	%g7,	%g5
	membar	0x02
loop_1995:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%l0
	sethi	0x16A3,	%i0
	movrlez	%l5,	0x151,	%o1
	sra	%l3,	0x10,	%g3
	movvc	%icc,	%o3,	%i5
	movcs	%icc,	%o6,	%l1
	and	%g4,	%o4,	%i7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x35] %asi,	%i3
	sllx	%l6,	0x0E,	%o7
	edge16ln	%o2,	%i6,	%g1
	bge,a,pt	%xcc,	loop_1996
	smulcc	%g2,	%i1,	%g6
	fmovrdgez	%i2,	%f8,	%f30
	fpsub32	%f24,	%f20,	%f8
loop_1996:
	movpos	%xcc,	%l4,	%l2
	bpos	loop_1997
	fbu,a	%fcc1,	loop_1998
	fmovdg	%xcc,	%f3,	%f21
	movl	%xcc,	%o5,	%i4
loop_1997:
	prefetch	[%l7 + 0x64],	 0x1
loop_1998:
	fmovrdgez	%o0,	%f0,	%f4
	movvs	%icc,	%g7,	%l0
	set	0x1C, %i3
	sta	%f3,	[%l7 + %i3] 0x04
	nop
	fitod	%f0,	%f12
	fdtos	%f12,	%f7
	edge16	%i0,	%l5,	%g5
	fmovscs	%icc,	%f5,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l3,	%g3
	xnorcc	%o1,	%o3,	%i5
	fabsd	%f12,	%f0
	fbug	%fcc0,	loop_1999
	edge16	%l1,	%g4,	%o6
	fpack32	%f16,	%f16,	%f10
	movre	%o4,	%i3,	%l6
loop_1999:
	bcc,a,pn	%icc,	loop_2000
	nop
	setx	0xC323A9FDE2D7E44A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA03DDA6DB6AC74F8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f14,	%f28
	srl	%o7,	0x04,	%o2
	fmovse	%xcc,	%f14,	%f28
loop_2000:
	subccc	%i6,	0x1F42,	%g1
	edge16	%g2,	%i7,	%i1
	membar	0x52
	sub	%g6,	%i2,	%l4
	wr	%g0,	0x80,	%asi
	stha	%l2,	[%l7 + 0x24] %asi
	nop
	setx	0xAB92AA1FD82DAE71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xD0AA87BBF37DD5F6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f24,	%f4
	fmovdn	%xcc,	%f2,	%f28
	edge16l	%o5,	%i4,	%g7
	bpos,a,pt	%xcc,	loop_2001
	edge32l	%l0,	%o0,	%i0
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x18,	 0x2
loop_2001:
	udivcc	%l3,	0x1E1F,	%l5
	fsrc1	%f4,	%f26
	tcs	%icc,	0x7
	srl	%o1,	%g3,	%i5
	ble,a	loop_2002
	movn	%xcc,	%l1,	%g4
	movg	%icc,	%o3,	%o4
	fbn	%fcc3,	loop_2003
loop_2002:
	mova	%icc,	%o6,	%l6
	nop
	set	0x18, %g7
	ldd	[%l7 + %g7],	%i2
	tgu	%xcc,	0x2
loop_2003:
	nop
	fitos	%f6,	%f5
	fstox	%f5,	%f26
	te	%icc,	0x6
	tcc	%xcc,	0x1
	tleu	%icc,	0x6
	edge8ln	%o7,	%o2,	%g1
	swap	[%l7 + 0x1C],	%g2
	ldx	[%l7 + 0x30],	%i6
	add	%i1,	0x0846,	%i7
	nop
	setx	loop_2004,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot1	%f2,	%f0,	%f18
	array32	%g6,	%i2,	%l4
	bl,a	%icc,	loop_2005
loop_2004:
	array8	%l2,	%o5,	%i4
	taddcc	%g7,	0x05AA,	%l0
	sdivx	%o0,	0x0E6F,	%g5
loop_2005:
	fcmpeq16	%f18,	%f26,	%i0
	fpsub32s	%f14,	%f8,	%f16
	fmovsa	%xcc,	%f17,	%f31
	tleu	%icc,	0x5
	fpsub16	%f6,	%f8,	%f26
	addc	%l5,	%l3,	%g3
	movrgez	%o1,	%i5,	%g4
	and	%l1,	%o4,	%o3
	xnorcc	%l6,	%i3,	%o7
	orn	%o2,	%o6,	%g2
	fsrc1s	%f4,	%f21
	orncc	%g1,	0x0854,	%i1
	movl	%icc,	%i7,	%i6
	fcmpgt32	%f0,	%f16,	%i2
	sll	%g6,	0x0B,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o5,	0x31C,	%i4
	nop
	setx	0x5177FA1C77BE6D6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xDB53947335F8115A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f8,	%f4
	array32	%g7,	%l0,	%l2
	fcmpeq16	%f28,	%f12,	%g5
	fpack16	%f22,	%f6
	orncc	%o0,	%l5,	%l3
	alignaddr	%g3,	%i0,	%o1
	set	0x10, %l3
	ldxa	[%l7 + %l3] 0x0c,	%g4
	set	0x20, %i4
	ldda	[%l7 + %i4] 0xe3,	%l0
	fba,a	%fcc1,	loop_2006
	fcmpeq32	%f8,	%f0,	%o4
	smulcc	%i5,	0x01D2,	%o3
	andn	%i3,	0x16A2,	%o7
loop_2006:
	lduh	[%l7 + 0x76],	%o2
	udivx	%l6,	0x0025,	%g2
	edge8ln	%g1,	%o6,	%i1
	bcs,pt	%xcc,	loop_2007
	movgu	%icc,	%i7,	%i6
	sth	%g6,	[%l7 + 0x22]
	nop
	set	0x46, %o2
	ldstub	[%l7 + %o2],	%i2
loop_2007:
	addcc	%o5,	0x1366,	%l4
	mova	%icc,	%i4,	%l0
	fmovdne	%xcc,	%f24,	%f21
	tge	%icc,	0x6
	array16	%l2,	%g7,	%o0
	popc	0x1DCD,	%l5
	orncc	%l3,	0x1A2D,	%g5
	fpack32	%f14,	%f30,	%f10
	membar	0x04
	nop
	fitod	%f12,	%f22
	fdtox	%f22,	%f10
	tcc	%icc,	0x1
	fsrc1s	%f0,	%f20
	edge32	%i0,	%o1,	%g3
	tne	%icc,	0x7
	orn	%g4,	0x0D86,	%l1
	edge16ln	%i5,	%o4,	%o3
	andcc	%i3,	%o7,	%o2
	xnorcc	%g2,	%g1,	%l6
	tvc	%xcc,	0x7
	movn	%xcc,	%o6,	%i7
	tsubcctv	%i6,	0x0206,	%i1
	ldsw	[%l7 + 0x64],	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i2
	sdivx	%l4,	0x0ED7,	%o5
	edge32n	%i4,	%l2,	%l0
	movvc	%icc,	%g7,	%l5
	orcc	%o0,	0x157E,	%g5
	fnands	%f16,	%f6,	%f16
	set	0x30, %l2
	lduwa	[%l7 + %l2] 0x04,	%i0
	nop
	fitod	%f25,	%f0
	ldd	[%l7 + 0x68],	%l2
	fmovsne	%xcc,	%f27,	%f9
	fpmerge	%f27,	%f5,	%f16
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x10] %asi,	%g3
	and	%o1,	0x1C79,	%g4
	movrgz	%i5,	%l1,	%o3
	sth	%i3,	[%l7 + 0x54]
	subccc	%o4,	0x0197,	%o2
	andcc	%o7,	0x08E9,	%g2
	tgu	%xcc,	0x3
	and	%g1,	%o6,	%i7
	tle	%icc,	0x1
	movgu	%icc,	%i6,	%i1
	and	%l6,	%g6,	%l4
	fpsub32	%f6,	%f18,	%f30
	tle	%xcc,	0x7
	nop
	setx	loop_2008,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%i2,	0x122C,	%o5
	st	%f16,	[%l7 + 0x40]
	fbn	%fcc3,	loop_2009
loop_2008:
	smulcc	%i4,	%l2,	%l0
	tn	%icc,	0x5
	sethi	0x11CB,	%l5
loop_2009:
	fandnot1s	%f16,	%f19,	%f20
	fxnor	%f4,	%f2,	%f22
	tsubcctv	%o0,	%g7,	%g5
	movrgz	%l3,	%i0,	%g3
	tcc	%xcc,	0x0
	brz	%o1,	loop_2010
	addc	%g4,	%l1,	%i5
	tgu	%xcc,	0x4
	nop
	fitod	%f12,	%f2
	fdtox	%f2,	%f26
loop_2010:
	subccc	%o3,	%o4,	%o2
	movpos	%icc,	%i3,	%g2
	sdivx	%g1,	0x0FD1,	%o7
	nop
	setx	loop_2011,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrgz	%o6,	%i6,	%i1
	xnor	%l6,	0x010A,	%i7
	movrgz	%l4,	%g6,	%o5
loop_2011:
	nop
	set	0x60, %l0
	stxa	%i2,	[%l7 + %l0] 0xeb
	membar	#Sync
	edge32l	%i4,	%l0,	%l2
	movvc	%icc,	%o0,	%l5
	fmovdleu	%icc,	%f14,	%f25
	sethi	0x1B36,	%g5
	fabss	%f14,	%f29
	bvs	%xcc,	loop_2012
	fpadd32	%f8,	%f4,	%f6
	te	%icc,	0x5
	fmovrsgz	%l3,	%f10,	%f6
loop_2012:
	fxors	%f16,	%f7,	%f3
	fmul8ulx16	%f6,	%f2,	%f18
	fmovd	%f6,	%f0
	andncc	%i0,	%g7,	%g3
	popc	%o1,	%g4
	andcc	%l1,	%o3,	%o4
	set	0x7E, %l4
	ldsha	[%l7 + %l4] 0x81,	%o2
	add	%i3,	0x1D30,	%i5
	bneg,pt	%xcc,	loop_2013
	ldd	[%l7 + 0x20],	%f4
	set	0x3E, %o7
	stha	%g2,	[%l7 + %o7] 0x10
loop_2013:
	edge16	%g1,	%o7,	%i6
	brgz	%o6,	loop_2014
	nop
	fitod	%f0,	%f4
	fdtoi	%f4,	%f28
	wr	%g0,	0x10,	%asi
	stxa	%i1,	[%l7 + 0x70] %asi
loop_2014:
	movrne	%i7,	%l4,	%g6
	fbne	%fcc2,	loop_2015
	tge	%xcc,	0x2
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f27
	tvc	%xcc,	0x4
loop_2015:
	movrgz	%o5,	0x209,	%i2
	or	%l6,	0x0D39,	%l0
	fmovdcs	%xcc,	%f30,	%f6
	edge32ln	%l2,	%o0,	%l5
	fba,a	%fcc2,	loop_2016
	popc	0x1018,	%i4
	ba,a,pn	%icc,	loop_2017
	fbl,a	%fcc1,	loop_2018
loop_2016:
	edge16l	%l3,	%g5,	%i0
	orcc	%g7,	%o1,	%g4
loop_2017:
	nop
	fitos	%f0,	%f19
	fstod	%f19,	%f14
loop_2018:
	fbule,a	%fcc1,	loop_2019
	orn	%g3,	%l1,	%o3
	fbg	%fcc2,	loop_2020
	fbo	%fcc0,	loop_2021
loop_2019:
	edge16ln	%o4,	%o2,	%i5
	xnorcc	%i3,	0x1A75,	%g1
loop_2020:
	sdiv	%g2,	0x0CAB,	%o7
loop_2021:
	tgu	%icc,	0x6
	udiv	%o6,	0x0E35,	%i1
	movcs	%xcc,	%i6,	%l4
	subccc	%g6,	%o5,	%i7
	tleu	%xcc,	0x0
	addc	%l6,	%l0,	%l2
	bcs	loop_2022
	fbue,a	%fcc2,	loop_2023
	tpos	%icc,	0x5
	bge,a,pn	%xcc,	loop_2024
loop_2022:
	fmovdneg	%icc,	%f26,	%f14
loop_2023:
	umul	%o0,	0x0EA2,	%l5
	tcs	%icc,	0x5
loop_2024:
	fbe	%fcc1,	loop_2025
	fblg	%fcc2,	loop_2026
	edge8n	%i2,	%l3,	%i4
	movrne	%i0,	0x166,	%g7
loop_2025:
	movg	%icc,	%o1,	%g4
loop_2026:
	subccc	%g5,	0x0CBB,	%l1
	movle	%xcc,	%o3,	%g3
	wr	%g0,	0xe2,	%asi
	stxa	%o2,	[%l7 + 0x30] %asi
	membar	#Sync
	nop
	fitos	%f11,	%f24
	fstox	%f24,	%f28
	tpos	%icc,	0x7
	fxnors	%f12,	%f24,	%f1
	xor	%o4,	%i5,	%i3
	fmovdn	%xcc,	%f21,	%f9
	ldub	[%l7 + 0x63],	%g1
	nop
	setx	0x298DCE5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x4B351118,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f16,	%f29
	xor	%o7,	0x164F,	%g2
	wr	%g0,	0x88,	%asi
	sta	%f30,	[%l7 + 0x3C] %asi
	array32	%i1,	%o6,	%i6
	sra	%l4,	%g6,	%i7
	fands	%f22,	%f17,	%f1
	array32	%l6,	%l0,	%o5
	fmul8sux16	%f22,	%f18,	%f18
	orncc	%l2,	0x1292,	%o0
	ble,a,pt	%icc,	loop_2027
	for	%f20,	%f6,	%f14
	sra	%l5,	%i2,	%i4
	fmovdge	%xcc,	%f11,	%f22
loop_2027:
	membar	0x46
	sllx	%i0,	%g7,	%l3
	fnors	%f18,	%f1,	%f4
	mova	%xcc,	%g4,	%o1
	sll	%g5,	0x19,	%l1
	fbug,a	%fcc1,	loop_2028
	edge16	%o3,	%o2,	%g3
	sethi	0x0F08,	%i5
	tcc	%xcc,	0x4
loop_2028:
	and	%o4,	%g1,	%i3
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o7
	bge,pn	%icc,	loop_2029
	fornot1s	%f8,	%f23,	%f27
	movrne	%i1,	0x3C2,	%g2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x12] %asi,	%o6
loop_2029:
	edge16	%l4,	%i6,	%g6
	nop
	fitos	%f8,	%f14
	fstod	%f14,	%f10
	fmovsn	%xcc,	%f19,	%f16
	fmul8x16au	%f4,	%f19,	%f12
	ldub	[%l7 + 0x11],	%l6
	fornot1s	%f10,	%f28,	%f7
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x16
	membar	#Sync
	edge32	%l0,	%o5,	%l2
	edge32n	%o0,	%i7,	%l5
	fmovsne	%xcc,	%f22,	%f10
	edge8	%i4,	%i2,	%i0
	fbne,a	%fcc0,	loop_2030
	smulcc	%g7,	0x0D3C,	%l3
	alignaddrl	%g4,	%g5,	%l1
	orcc	%o1,	0x0F39,	%o2
loop_2030:
	movg	%icc,	%g3,	%o3
	bgu,a	%xcc,	loop_2031
	fba,a	%fcc3,	loop_2032
	movvs	%icc,	%o4,	%g1
	movrgz	%i5,	%i3,	%i1
loop_2031:
	fmovrslz	%o7,	%f10,	%f20
loop_2032:
	orcc	%g2,	0x0B96,	%l4
	ldub	[%l7 + 0x1B],	%o6
	udivcc	%i6,	0x1AD2,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a,pt	%icc,	loop_2033
	fbe,a	%fcc0,	loop_2034
	alignaddrl	%l0,	%l6,	%o5
	tvc	%icc,	0x2
loop_2033:
	fpack32	%f2,	%f0,	%f2
loop_2034:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l2,	%i7,	%l5
	fbg,a	%fcc1,	loop_2035
	bg,a,pt	%icc,	loop_2036
	tcs	%icc,	0x0
	fmovsn	%icc,	%f24,	%f11
loop_2035:
	stbar
loop_2036:
	fbg,a	%fcc3,	loop_2037
	fmovdvs	%xcc,	%f29,	%f29
	bpos,pt	%xcc,	loop_2038
	fsrc1	%f20,	%f0
loop_2037:
	and	%o0,	%i4,	%i0
	edge8ln	%g7,	%l3,	%g4
loop_2038:
	mulx	%g5,	%i2,	%o1
	tvc	%icc,	0x1
	xor	%l1,	%g3,	%o2
	sra	%o3,	0x0E,	%o4
	array16	%g1,	%i5,	%i1
	xor	%i3,	0x082F,	%g2
	alignaddrl	%l4,	%o6,	%i6
	movcc	%icc,	%o7,	%l0
	edge16ln	%l6,	%g6,	%o5
	edge8n	%i7,	%l5,	%l2
	alignaddr	%i4,	%o0,	%i0
	fblg	%fcc1,	loop_2039
	fbl,a	%fcc3,	loop_2040
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g7,	0x0324,	%g4
loop_2039:
	edge16n	%l3,	%i2,	%o1
loop_2040:
	alignaddrl	%l1,	%g5,	%g3
	fcmpne32	%f8,	%f20,	%o3
	fmul8sux16	%f20,	%f6,	%f30
	movcs	%icc,	%o2,	%g1
	fmuld8sux16	%f4,	%f3,	%f8
	nop
	setx	0xB118DBA3A3F1F8E8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x7E116649A28820B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f30,	%f14
	popc	%o4,	%i5
	movrgez	%i3,	0x0DF,	%i1
	edge8	%l4,	%g2,	%o6
	ldx	[%l7 + 0x38],	%i6
	andn	%l0,	0x1E95,	%o7
	edge16	%l6,	%o5,	%i7
	orn	%l5,	0x1772,	%g6
	bvc,a,pn	%icc,	loop_2041
	edge32l	%i4,	%o0,	%i0
	bcc	loop_2042
	fnors	%f11,	%f10,	%f21
loop_2041:
	fsrc2	%f16,	%f4
	taddcc	%g7,	%l2,	%g4
loop_2042:
	andcc	%l3,	%i2,	%l1
	mulscc	%o1,	%g3,	%g5
	fbuge	%fcc2,	loop_2043
	fmovrsgz	%o2,	%f18,	%f24
	sllx	%g1,	0x03,	%o3
	subcc	%o4,	0x071E,	%i3
loop_2043:
	sllx	%i1,	%l4,	%i5
	tl	%xcc,	0x0
	ta	%xcc,	0x4
	tvc	%xcc,	0x7
	edge8ln	%g2,	%o6,	%l0
	fmovscc	%icc,	%f26,	%f7
	fcmpeq16	%f30,	%f8,	%i6
	fbule,a	%fcc2,	loop_2044
	tcc	%xcc,	0x2
	fmovdgu	%xcc,	%f11,	%f7
	edge16ln	%o7,	%l6,	%o5
loop_2044:
	movvs	%icc,	%i7,	%g6
	fmovdneg	%xcc,	%f21,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l5,	%i4,	%i0
	movrgz	%o0,	0x191,	%l2
	fand	%f16,	%f30,	%f0
	lduw	[%l7 + 0x1C],	%g4
	fpmerge	%f4,	%f30,	%f22
	tle	%icc,	0x6
	fbul	%fcc2,	loop_2045
	orncc	%g7,	%i2,	%l3
	nop
	fitos	%f14,	%f8
	fstoi	%f8,	%f27
	addccc	%l1,	%g3,	%g5
loop_2045:
	fbuge,a	%fcc0,	loop_2046
	fmovde	%xcc,	%f28,	%f24
	fcmpgt32	%f12,	%f16,	%o1
	fandnot2s	%f27,	%f2,	%f24
loop_2046:
	movvc	%icc,	%o2,	%o3
	subccc	%g1,	%o4,	%i1
	fpadd32s	%f29,	%f5,	%f5
	fmovrde	%l4,	%f12,	%f26
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x30] %asi,	%i5
	ldsw	[%l7 + 0x4C],	%g2
	set	0x3D, %i1
	lduba	[%l7 + %i1] 0x18,	%o6
	tneg	%icc,	0x7
	sra	%l0,	%i3,	%i6
	movrgz	%o7,	%l6,	%o5
	movcs	%icc,	%i7,	%l5
	edge32l	%i4,	%g6,	%o0
	movcc	%icc,	%l2,	%g4
	nop
	setx	0xB738DC92,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xED29DE85,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f9,	%f27
	bn,a	%icc,	loop_2047
	udiv	%g7,	0x1B18,	%i2
	movne	%icc,	%l3,	%l1
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
loop_2047:
	movvc	%xcc,	%g3,	%g5
	taddcc	%o1,	0x013D,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f31,	%f2
	nop
	setx	0xE00B16E7907B0C43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	or	%o2,	%o4,	%i1
	nop
	fitos	%f2,	%f10
	fstoi	%f10,	%f9
	array32	%g1,	%i5,	%g2
	array32	%l4,	%o6,	%i3
	movvc	%icc,	%l0,	%i6
	tvs	%icc,	0x0
	udivcc	%o7,	0x170D,	%o5
	tleu	%xcc,	0x2
	orn	%i7,	%l6,	%i4
	smul	%g6,	%o0,	%l2
	tge	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x1A879D3BC6B50AED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xD72AC6FDFCE8E149,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f16,	%f12
	prefetch	[%l7 + 0x14],	 0x3
	nop
	setx	loop_2048,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrde	%l5,	%f30,	%f16
	prefetch	[%l7 + 0x64],	 0x0
	fmovsl	%xcc,	%f10,	%f31
loop_2048:
	fbn	%fcc0,	loop_2049
	orncc	%g7,	%i2,	%l3
	bcc,pt	%icc,	loop_2050
	tle	%xcc,	0x0
loop_2049:
	fmovda	%xcc,	%f10,	%f25
	tneg	%xcc,	0x1
loop_2050:
	nop
	setx	0xA12727543A1A5FA3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x6F11E1C4C88CAB35,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f0,	%f0
	swap	[%l7 + 0x20],	%g4
	tgu	%xcc,	0x2
	udivx	%i0,	0x1A18,	%g3
	tcs	%xcc,	0x3
	or	%g5,	0x1406,	%l1
	movcs	%icc,	%o3,	%o2
	edge16l	%o4,	%i1,	%o1
	andcc	%i5,	%g1,	%l4
	and	%g2,	%i3,	%l0
	fnegd	%f14,	%f28
	brlez	%o6,	loop_2051
	te	%icc,	0x3
	smul	%i6,	0x1729,	%o7
	sir	0x1DCC
loop_2051:
	bpos,a,pn	%icc,	loop_2052
	bvs,a,pn	%icc,	loop_2053
	umul	%o5,	%i7,	%i4
	fcmple32	%f8,	%f24,	%l6
loop_2052:
	move	%icc,	%o0,	%l2
loop_2053:
	tle	%icc,	0x2
	bcc	loop_2054
	fmovsg	%icc,	%f21,	%f26
	fnot1s	%f16,	%f24
	tn	%icc,	0x5
loop_2054:
	movgu	%xcc,	%l5,	%g7
	sir	0x1C42
	and	%g6,	0x1F2F,	%l3
	bl,pn	%xcc,	loop_2055
	fzero	%f26
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x58] %asi,	%f6
loop_2055:
	nop
	set	0x58, %g3
	ldsw	[%l7 + %g3],	%i2
	nop
	setx	0x5170D231,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xC7BCDE1A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f18,	%f28
	movgu	%icc,	%i0,	%g3
	or	%g5,	%g4,	%l1
	movcs	%icc,	%o2,	%o4
	lduw	[%l7 + 0x08],	%o3
	fpsub16s	%f7,	%f20,	%f26
	tvs	%icc,	0x6
	tle	%xcc,	0x1
	mulx	%i1,	%i5,	%o1
	movneg	%xcc,	%g1,	%g2
	xorcc	%l4,	0x1DE6,	%l0
	tle	%icc,	0x7
	orncc	%i3,	%i6,	%o6
	tsubcctv	%o7,	%o5,	%i4
	fxnor	%f28,	%f16,	%f10
	ldub	[%l7 + 0x56],	%l6
	srax	%o0,	%i7,	%l5
	array32	%l2,	%g6,	%g7
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	array32	%l3,	%i0,	%i2
	edge16	%g5,	%g4,	%g3
	udivx	%o2,	0x1EE7,	%o4
	edge16n	%o3,	%i1,	%l1
	fbne,a	%fcc2,	loop_2056
	alignaddr	%i5,	%o1,	%g1
	movvs	%xcc,	%g2,	%l0
	fmovdn	%icc,	%f12,	%f27
loop_2056:
	fblg	%fcc1,	loop_2057
	srlx	%i3,	0x0D,	%l4
	fmovrslz	%i6,	%f5,	%f30
	orn	%o7,	0x0BCB,	%o5
loop_2057:
	fmovrslz	%o6,	%f26,	%f11
	taddcctv	%i4,	0x0A1A,	%l6
	fbge	%fcc3,	loop_2058
	and	%i7,	0x11CF,	%l5
	movge	%icc,	%l2,	%g6
	fmovscc	%xcc,	%f25,	%f28
loop_2058:
	nop
	fitos	%f9,	%f15
	andn	%g7,	0x16EA,	%o0
	fbe,a	%fcc0,	loop_2059
	sdivx	%i0,	0x0EDE,	%l3
	tpos	%icc,	0x7
	call	loop_2060
loop_2059:
	taddcc	%i2,	%g5,	%g3
	edge32n	%g4,	%o4,	%o2
	edge32n	%o3,	%l1,	%i1
loop_2060:
	addccc	%i5,	%o1,	%g2
	be	%icc,	loop_2061
	move	%icc,	%l0,	%g1
	tgu	%icc,	0x0
	bcs,pt	%icc,	loop_2062
loop_2061:
	orcc	%i3,	0x166E,	%i6
	bl	%xcc,	loop_2063
	fmovdg	%icc,	%f13,	%f19
loop_2062:
	popc	%o7,	%o5
	udivx	%l4,	0x09D0,	%i4
loop_2063:
	edge32l	%o6,	%l6,	%i7
	move	%icc,	%l2,	%g6
	xorcc	%g7,	%l5,	%i0
	edge32l	%l3,	%o0,	%g5
	edge8n	%i2,	%g4,	%o4
	stw	%g3,	[%l7 + 0x3C]
	movre	%o3,	0x3B0,	%l1
	brnz	%o2,	loop_2064
	fmovdn	%xcc,	%f20,	%f26
	fba,a	%fcc1,	loop_2065
	udiv	%i1,	0x0AE6,	%i5
loop_2064:
	array32	%o1,	%g2,	%l0
	movrne	%i3,	%i6,	%g1
loop_2065:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f18,	%f14
	movge	%icc,	%o5,	%l4
	tvc	%icc,	0x3
	popc	0x029B,	%i4
	stb	%o7,	[%l7 + 0x20]
	tvs	%icc,	0x1
	movg	%icc,	%o6,	%l6
	fbge	%fcc3,	loop_2066
	edge8l	%i7,	%l2,	%g7
	add	%g6,	%i0,	%l5
	srl	%l3,	0x0E,	%o0
loop_2066:
	brz	%g5,	loop_2067
	fmovrsgez	%g4,	%f24,	%f10
	srlx	%o4,	%i2,	%g3
	edge16ln	%o3,	%o2,	%l1
loop_2067:
	edge32n	%i1,	%i5,	%g2
	fnot2	%f24,	%f10
	lduw	[%l7 + 0x58],	%o1
	nop
	fitod	%f3,	%f10
	taddcctv	%i3,	%l0,	%g1
	fands	%f25,	%f23,	%f21
	fones	%f23
	bl	%xcc,	loop_2068
	and	%i6,	0x041D,	%o5
	movvc	%icc,	%i4,	%l4
	ta	%xcc,	0x5
loop_2068:
	fcmpne32	%f28,	%f30,	%o6
	movrne	%o7,	%l6,	%l2
	udivx	%g7,	0x1F15,	%g6
	fmovdge	%xcc,	%f0,	%f12
	fnot1	%f16,	%f4
	fpadd32s	%f5,	%f10,	%f1
	movleu	%icc,	%i0,	%i7
	ldstub	[%l7 + 0x3D],	%l3
	fbg,a	%fcc3,	loop_2069
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l5,	%g5,	%o0
	sllx	%o4,	%i2,	%g4
loop_2069:
	call	loop_2070
	tneg	%xcc,	0x3
	bne,a	%xcc,	loop_2071
	tsubcc	%g3,	0x10B4,	%o2
loop_2070:
	fsrc2	%f0,	%f16
	movneg	%icc,	%o3,	%l1
loop_2071:
	movneg	%icc,	%i1,	%i5
	fmovrse	%o1,	%f31,	%f29
	mova	%icc,	%g2,	%l0
	movle	%xcc,	%i3,	%g1
	nop
	setx	0xC24EE595,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xDF51963F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f27,	%f22
	subc	%i6,	%i4,	%l4
	fmovrde	%o5,	%f26,	%f24
	tleu	%xcc,	0x4
	ldsb	[%l7 + 0x57],	%o6
	bne,a,pt	%icc,	loop_2072
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%o7,	%f24,	%f12
	sdivcc	%l2,	0x1747,	%l6
loop_2072:
	tpos	%icc,	0x7
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%g7
	ldub	[%l7 + 0x28],	%i0
	fornot2s	%f20,	%f17,	%f6
	or	%i7,	0x11EE,	%l3
	sll	%l5,	0x11,	%g6
	fabsd	%f8,	%f16
	movgu	%xcc,	%g5,	%o0
	fbul,a	%fcc3,	loop_2073
	bvs,a	%xcc,	loop_2074
	fbuge,a	%fcc1,	loop_2075
	fzeros	%f7
loop_2073:
	srl	%o4,	%i2,	%g3
loop_2074:
	fcmpeq32	%f12,	%f18,	%g4
loop_2075:
	movrne	%o2,	0x301,	%o3
	tcc	%icc,	0x7
	sllx	%i1,	0x1A,	%l1
	set	0x0E, %g6
	lduba	[%l7 + %g6] 0x11,	%o1
	tge	%xcc,	0x7
	nop
	setx	0x28F1D6672E363917,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF09CCE3965BC9654,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f0,	%f2
	bpos,a,pt	%icc,	loop_2076
	movne	%xcc,	%i5,	%l0
	sir	0x02D9
	edge16n	%i3,	%g2,	%i6
loop_2076:
	srl	%g1,	%i4,	%l4
	array32	%o6,	%o7,	%o5
	brlez	%l2,	loop_2077
	tcc	%icc,	0x6
	andn	%l6,	0x0422,	%g7
	fmovrdgz	%i7,	%f12,	%f0
loop_2077:
	fmovrdlz	%l3,	%f2,	%f4
	fbn,a	%fcc3,	loop_2078
	fsrc2s	%f19,	%f8
	fmovd	%f8,	%f30
	tleu	%icc,	0x7
loop_2078:
	ldsw	[%l7 + 0x44],	%i0
	brlez	%g6,	loop_2079
	tsubcctv	%g5,	%l5,	%o4
	andn	%o0,	0x116B,	%i2
	edge32l	%g3,	%o2,	%g4
loop_2079:
	ble,pn	%icc,	loop_2080
	brnz,a	%o3,	loop_2081
	brgz,a	%l1,	loop_2082
	fble,a	%fcc0,	loop_2083
loop_2080:
	fmovrdgez	%i1,	%f24,	%f4
loop_2081:
	tvc	%xcc,	0x1
loop_2082:
	xnorcc	%i5,	%l0,	%o1
loop_2083:
	fcmpgt16	%f16,	%f14,	%i3
	nop
	set	0x40, %i6
	lduw	[%l7 + %i6],	%i6
	te	%xcc,	0x0
	sir	0x1123
	fbne	%fcc0,	loop_2084
	fmovsneg	%xcc,	%f22,	%f10
	fmovdcs	%icc,	%f25,	%f10
	srax	%g1,	%i4,	%l4
loop_2084:
	addccc	%g2,	%o7,	%o5
	movg	%icc,	%o6,	%l2
	edge16n	%g7,	%l6,	%l3
	sethi	0x01AE,	%i0
	addccc	%g6,	%g5,	%l5
	taddcc	%o4,	0x1B29,	%i7
	tne	%xcc,	0x2
	tsubcctv	%i2,	0x0597,	%o0
	stw	%g3,	[%l7 + 0x68]
	fbe	%fcc0,	loop_2085
	edge16ln	%g4,	%o3,	%l1
	tle	%xcc,	0x1
	sir	0x0DCD
loop_2085:
	edge16	%i1,	%o2,	%i5
	st	%f4,	[%l7 + 0x20]
	bpos,a,pn	%icc,	loop_2086
	stb	%o1,	[%l7 + 0x4A]
	tgu	%xcc,	0x7
	movrlez	%i3,	%l0,	%i6
loop_2086:
	brlz,a	%g1,	loop_2087
	ta	%xcc,	0x0
	fcmpne16	%f6,	%f4,	%i4
	faligndata	%f4,	%f24,	%f8
loop_2087:
	sllx	%g2,	%l4,	%o5
	array8	%o7,	%o6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l2,	[%l7 + 0x56]
	movge	%xcc,	%l3,	%l6
	alignaddr	%i0,	%g5,	%g6
	bn,pt	%xcc,	loop_2088
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f0
	sdivcc	%l5,	0x0A92,	%i7
	tcc	%icc,	0x1
loop_2088:
	ba,a	loop_2089
	tvc	%icc,	0x7
	edge8ln	%i2,	%o0,	%o4
	movvs	%icc,	%g4,	%o3
loop_2089:
	nop
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g3
	andn	%l1,	%o2,	%i5
	fmovdgu	%xcc,	%f21,	%f8
	movrne	%i1,	0x09F,	%o1
	fbul,a	%fcc2,	loop_2090
	sdivx	%l0,	0x1EA4,	%i6
	tn	%xcc,	0x7
	fmovdne	%xcc,	%f29,	%f26
loop_2090:
	udivx	%i3,	0x08DC,	%i4
	udiv	%g2,	0x1B24,	%g1
	ta	%xcc,	0x4
	nop
	setx	0xE99E32E5507914FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	edge32ln	%l4,	%o5,	%o6
	fnor	%f0,	%f20,	%f22
	movn	%xcc,	%g7,	%l2
	edge16ln	%l3,	%l6,	%i0
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f0
	fxtod	%f0,	%f4
	movrlz	%g5,	0x0D3,	%o7
	fmovsgu	%xcc,	%f7,	%f24
	movvc	%icc,	%l5,	%i7
	nop
	setx	loop_2091,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdvs	%icc,	%f15,	%f7
	fble,a	%fcc3,	loop_2092
	fba,a	%fcc0,	loop_2093
loop_2091:
	movg	%xcc,	%i2,	%o0
	tcs	%xcc,	0x4
loop_2092:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2093:
	fsrc2s	%f26,	%f25
	movge	%xcc,	%o4,	%g6
	nop
	setx	0xD07B2DC8,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	smul	%g4,	0x1FCB,	%o3
	fmul8x16au	%f17,	%f3,	%f20
	sdiv	%g3,	0x1D97,	%o2
	swap	[%l7 + 0x34],	%l1
	nop
	setx	0xBB77F1DEB2A56A84,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x523047FE85B2B37D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f20,	%f26
	movrgez	%i5,	0x1A8,	%i1
	fnors	%f31,	%f26,	%f24
	mulscc	%o1,	%i6,	%i3
	sdivcc	%i4,	0x1BAE,	%l0
	srl	%g1,	0x01,	%l4
	edge32ln	%o5,	%o6,	%g7
	andn	%l2,	%g2,	%l6
	fblg,a	%fcc0,	loop_2094
	umulcc	%l3,	0x17D1,	%g5
	xnorcc	%i0,	0x0FB6,	%o7
	brlz	%i7,	loop_2095
loop_2094:
	or	%i2,	0x1FDF,	%l5
	ble	%xcc,	loop_2096
	tleu	%icc,	0x0
loop_2095:
	edge16ln	%o4,	%o0,	%g4
	te	%icc,	0x5
loop_2096:
	lduw	[%l7 + 0x64],	%g6
	std	%f24,	[%l7 + 0x78]
	sll	%g3,	0x1B,	%o2
	fandnot1	%f4,	%f8,	%f24
	fcmpne32	%f14,	%f22,	%o3
	fmovdle	%icc,	%f1,	%f14
	edge16ln	%l1,	%i1,	%o1
	edge16	%i6,	%i3,	%i5
	tsubcc	%i4,	0x1999,	%g1
	addccc	%l4,	0x1953,	%o5
	tg	%icc,	0x7
	movrne	%l0,	0x3BE,	%g7
	and	%o6,	%g2,	%l2
	and	%l3,	0x16A0,	%g5
	subc	%l6,	0x1273,	%i0
	subcc	%i7,	%i2,	%l5
	array16	%o7,	%o0,	%g4
	tl	%xcc,	0x6
	edge8ln	%g6,	%g3,	%o4
	tsubcc	%o3,	%o2,	%i1
	edge32ln	%l1,	%i6,	%o1
	subccc	%i3,	%i4,	%g1
	fornot1	%f2,	%f24,	%f28
	brlez	%i5,	loop_2097
	ba,a,pn	%xcc,	loop_2098
	sdivcc	%l4,	0x1CFF,	%o5
	sra	%l0,	%o6,	%g7
loop_2097:
	nop
	setx	0x799AEB2E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x08BD2276,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f13,	%f15
loop_2098:
	sll	%l2,	0x0E,	%g2
	fbul,a	%fcc0,	loop_2099
	and	%l3,	0x069E,	%l6
	subcc	%g5,	%i7,	%i2
	movrne	%l5,	%o7,	%i0
loop_2099:
	xorcc	%o0,	%g4,	%g3
	sub	%o4,	%g6,	%o2
	tleu	%icc,	0x7
	andn	%i1,	0x0846,	%o3
	fcmple16	%f6,	%f30,	%l1
	movge	%icc,	%i6,	%i3
	ble,a,pt	%icc,	loop_2100
	movrlz	%i4,	0x049,	%g1
	bvc,a,pt	%icc,	loop_2101
	taddcc	%i5,	0x1652,	%l4
loop_2100:
	umul	%o5,	%o1,	%l0
	movrlez	%g7,	0x021,	%o6
loop_2101:
	fnot1	%f16,	%f8
	nop
	set	0x29, %i5
	stb	%g2,	[%l7 + %i5]
	movleu	%xcc,	%l2,	%l3
	bvs	loop_2102
	ta	%icc,	0x6
	fmovdl	%icc,	%f7,	%f11
	edge16	%g5,	%i7,	%l6
loop_2102:
	bvs,a	%icc,	loop_2103
	tn	%xcc,	0x6
	fmovsg	%icc,	%f11,	%f21
	movre	%i2,	0x1A5,	%l5
loop_2103:
	or	%o7,	%o0,	%g4
	fabsd	%f2,	%f24
	fabss	%f4,	%f6
	tcc	%icc,	0x2
	fandnot2	%f2,	%f4,	%f28
	bl,pn	%icc,	loop_2104
	fbug,a	%fcc0,	loop_2105
	movvc	%xcc,	%g3,	%i0
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x64] %asi,	%o4
loop_2104:
	edge32l	%o2,	%i1,	%o3
loop_2105:
	movcs	%xcc,	%g6,	%i6
	udivx	%l1,	0x14D9,	%i3
	fbue,a	%fcc0,	loop_2106
	be,a	loop_2107
	nop
	setx	0x604ADCC9921E1719,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xE43F81F3FE0ADEE9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f0,	%f0
	fbn	%fcc0,	loop_2108
loop_2106:
	movleu	%xcc,	%i4,	%i5
loop_2107:
	te	%icc,	0x0
	bleu,pn	%icc,	loop_2109
loop_2108:
	fnot1	%f26,	%f18
	fble,a	%fcc2,	loop_2110
	brlz,a	%l4,	loop_2111
loop_2109:
	fpsub32s	%f0,	%f14,	%f13
	andn	%o5,	0x1C81,	%o1
loop_2110:
	ldsb	[%l7 + 0x1A],	%g1
loop_2111:
	fcmpne32	%f0,	%f6,	%l0
	mulscc	%o6,	0x1871,	%g2
	tge	%icc,	0x3
	fzero	%f30
	mulscc	%g7,	%l2,	%l3
	smulcc	%g5,	0x01B3,	%l6
	fsrc2	%f12,	%f2
	edge16	%i2,	%i7,	%l5
	ldsb	[%l7 + 0x48],	%o0
	ldsb	[%l7 + 0x5F],	%g4
	fzero	%f6
	udivx	%o7,	0x0239,	%g3
	ldd	[%l7 + 0x70],	%f18
	fcmpne16	%f10,	%f12,	%o4
	umul	%i0,	0x1341,	%o2
	fbue	%fcc2,	loop_2112
	fsrc1s	%f21,	%f17
	tn	%xcc,	0x6
	addccc	%i1,	%o3,	%i6
loop_2112:
	fmul8x16	%f26,	%f12,	%f8
	brz,a	%l1,	loop_2113
	tcs	%xcc,	0x3
	subcc	%i3,	0x0B03,	%g6
	edge16	%i5,	%i4,	%o5
loop_2113:
	tg	%xcc,	0x0
	taddcc	%o1,	0x0813,	%l4
	wr	%g0,	0x80,	%asi
	stwa	%l0,	[%l7 + 0x24] %asi
	te	%xcc,	0x7
	movn	%icc,	%g1,	%o6
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x35] %asi,	%g7
	movle	%xcc,	%g2,	%l2
	bgu,a,pn	%icc,	loop_2114
	fble,a	%fcc1,	loop_2115
	xorcc	%l3,	0x1988,	%g5
	movpos	%xcc,	%l6,	%i7
loop_2114:
	fzero	%f4
loop_2115:
	addcc	%i2,	%o0,	%g4
	taddcc	%o7,	0x0ED2,	%g3
	movleu	%xcc,	%l5,	%o4
	sra	%i0,	%i1,	%o2
	udivcc	%i6,	0x0D6F,	%o3
	alignaddr	%l1,	%i3,	%g6
	brnz,a	%i5,	loop_2116
	xorcc	%i4,	0x0499,	%o1
	smulcc	%l4,	0x0E38,	%l0
	set	0x60, %g5
	stxa	%o5,	[%l7 + %g5] 0x04
loop_2116:
	popc	0x1AE2,	%g1
	umulcc	%g7,	0x1B6A,	%g2
	tl	%xcc,	0x2
	fbu,a	%fcc3,	loop_2117
	brgez,a	%l2,	loop_2118
	fzero	%f10
	umul	%o6,	0x1F4F,	%g5
loop_2117:
	bne,a	loop_2119
loop_2118:
	sth	%l3,	[%l7 + 0x7A]
	subcc	%l6,	0x07F0,	%i7
	lduw	[%l7 + 0x2C],	%o0
loop_2119:
	edge8l	%i2,	%g4,	%g3
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l5
	tpos	%icc,	0x5
	ldd	[%l7 + 0x58],	%o4
	fcmpne32	%f22,	%f6,	%i0
	movcc	%icc,	%o7,	%i1
	movrne	%i6,	0x161,	%o3
	move	%icc,	%o2,	%i3
	movrgz	%l1,	%i5,	%i4
	membar	0x58
	orn	%g6,	%l4,	%l0
	mulx	%o1,	%g1,	%g7
	fnot2s	%f3,	%f17
	xor	%g2,	%l2,	%o6
	srl	%o5,	%l3,	%l6
	edge32ln	%i7,	%o0,	%i2
	tg	%xcc,	0x7
	tge	%icc,	0x6
	umulcc	%g5,	0x128A,	%g3
	fble,a	%fcc1,	loop_2120
	fmovrde	%g4,	%f4,	%f12
	fmovrsgez	%l5,	%f24,	%f23
	alignaddrl	%o4,	%i0,	%o7
loop_2120:
	smulcc	%i6,	%o3,	%i1
	fmovda	%xcc,	%f24,	%f11
	udivx	%i3,	0x1F8C,	%o2
	set	0x50, %o1
	stxa	%l1,	[%l7 + %o1] 0x18
	bge	%icc,	loop_2121
	sub	%i4,	0x1D0E,	%g6
	array32	%i5,	%l4,	%l0
	fbul	%fcc1,	loop_2122
loop_2121:
	sra	%g1,	0x16,	%o1
	fmovrde	%g7,	%f18,	%f10
	bne,pn	%xcc,	loop_2123
loop_2122:
	ta	%icc,	0x2
	nop
	setx	0x11345987,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x8368C189,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f10,	%f20
	movrlez	%g2,	0x261,	%o6
loop_2123:
	edge16ln	%o5,	%l3,	%l6
	fmovd	%f10,	%f2
	fbe	%fcc3,	loop_2124
	brgz	%l2,	loop_2125
	taddcctv	%o0,	0x0683,	%i7
	nop
	fitod	%f9,	%f2
loop_2124:
	mulscc	%g5,	%i2,	%g4
loop_2125:
	fmovdpos	%xcc,	%f10,	%f16
	andn	%l5,	%g3,	%i0
	smulcc	%o7,	0x1692,	%o4
	fba	%fcc2,	loop_2126
	tvs	%icc,	0x0
	sdivx	%o3,	0x158F,	%i6
	addc	%i3,	0x1848,	%i1
loop_2126:
	brz	%l1,	loop_2127
	fmul8x16	%f28,	%f14,	%f2
	xorcc	%o2,	0x14F4,	%i4
	movneg	%icc,	%g6,	%i5
loop_2127:
	nop
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x89,	%f0
	fcmpgt32	%f24,	%f16,	%l0
	tsubcc	%l4,	%o1,	%g7
	bl,a	loop_2128
	brgez,a	%g1,	loop_2129
	tg	%xcc,	0x2
	edge32ln	%g2,	%o6,	%o5
loop_2128:
	orcc	%l6,	%l2,	%l3
loop_2129:
	fmovsa	%icc,	%f27,	%f3
	fmovdleu	%xcc,	%f27,	%f4
	fpsub32	%f2,	%f30,	%f8
	fornot1	%f16,	%f4,	%f10
	tcs	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f14,	%f2
	std	%f8,	[%l7 + 0x18]
	ta	%xcc,	0x1
	sra	%i7,	%g5,	%i2
	alignaddr	%o0,	%l5,	%g3
	edge16l	%i0,	%g4,	%o7
	array8	%o4,	%o3,	%i3
	fzeros	%f6
	ldd	[%l7 + 0x78],	%f22
	fpadd16s	%f0,	%f13,	%f3
	movn	%icc,	%i6,	%l1
	andcc	%i1,	0x0706,	%i4
	alignaddr	%o2,	%i5,	%g6
	srax	%l0,	%o1,	%g7
	fbn	%fcc2,	loop_2130
	ld	[%l7 + 0x74],	%f4
	fbo	%fcc1,	loop_2131
	stw	%g1,	[%l7 + 0x7C]
loop_2130:
	fbule,a	%fcc2,	loop_2132
	edge8ln	%l4,	%g2,	%o6
loop_2131:
	xorcc	%o5,	%l6,	%l3
	stbar
loop_2132:
	faligndata	%f28,	%f4,	%f20
	brlz	%i7,	loop_2133
	nop
	fitos	%f6,	%f21
	fstox	%f21,	%f10
	fxtos	%f10,	%f8
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
loop_2133:
	fmovsle	%xcc,	%f13,	%f1
	movrgz	%l2,	0x1B3,	%o0
	wr	%g0,	0x2b,	%asi
	stha	%i2,	[%l7 + 0x62] %asi
	membar	#Sync
	fmovsge	%icc,	%f31,	%f2
	fbuge,a	%fcc0,	loop_2134
	taddcc	%g3,	0x08DF,	%l5
	ta	%xcc,	0x6
	udiv	%g4,	0x0876,	%o7
loop_2134:
	movvs	%icc,	%i0,	%o4
	edge8ln	%o3,	%i3,	%l1
	movcc	%icc,	%i6,	%i4
	nop
	fitos	%f29,	%f16
	xnorcc	%i1,	0x0870,	%o2
	tge	%xcc,	0x7
	udivx	%i5,	0x1D99,	%g6
	edge8n	%o1,	%l0,	%g1
	sdiv	%g7,	0x048D,	%g2
	bgu,pn	%xcc,	loop_2135
	fornot1	%f22,	%f6,	%f12
	ld	[%l7 + 0x18],	%f6
	umulcc	%l4,	%o6,	%o5
loop_2135:
	or	%l3,	%i7,	%g5
	st	%f2,	[%l7 + 0x1C]
	movne	%xcc,	%l6,	%l2
	alignaddr	%i2,	%g3,	%o0
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f24
	fxtod	%f24,	%f8
	tleu	%xcc,	0x6
	array16	%l5,	%o7,	%g4
	edge16ln	%i0,	%o4,	%i3
	fmovsne	%icc,	%f29,	%f27
	srlx	%l1,	%i6,	%o3
	edge32	%i4,	%i1,	%o2
	wr	%g0,	0x04,	%asi
	stba	%g6,	[%l7 + 0x62] %asi
	move	%icc,	%i5,	%l0
	fsrc2	%f28,	%f26
	be,pt	%xcc,	loop_2136
	brlz	%o1,	loop_2137
	bpos,pt	%xcc,	loop_2138
	fmovdvs	%icc,	%f31,	%f24
loop_2136:
	fmovdvs	%xcc,	%f6,	%f19
loop_2137:
	fbue,a	%fcc3,	loop_2139
loop_2138:
	subccc	%g1,	%g2,	%l4
	bvc,pn	%icc,	loop_2140
	fmovsvs	%icc,	%f30,	%f9
loop_2139:
	fbule,a	%fcc2,	loop_2141
	edge32	%o6,	%o5,	%g7
loop_2140:
	sir	0x1FA8
	srlx	%i7,	0x1D,	%l3
loop_2141:
	fbul,a	%fcc0,	loop_2142
	sra	%g5,	%l6,	%l2
	tvs	%xcc,	0x2
	and	%i2,	0x1F92,	%o0
loop_2142:
	fbg,a	%fcc3,	loop_2143
	edge32n	%l5,	%g3,	%g4
	and	%i0,	%o7,	%i3
	bg,a,pt	%xcc,	loop_2144
loop_2143:
	alignaddrl	%o4,	%i6,	%o3
	edge32ln	%l1,	%i1,	%o2
	tsubcc	%i4,	%g6,	%i5
loop_2144:
	srl	%l0,	%g1,	%g2
	fnors	%f4,	%f5,	%f23
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l4,	%o6
	edge8l	%o1,	%g7,	%o5
	fcmpeq32	%f12,	%f22,	%i7
	fnot2s	%f30,	%f18
	tgu	%xcc,	0x1
	mulscc	%l3,	0x1C99,	%l6
	tcs	%xcc,	0x6
	fble,a	%fcc2,	loop_2145
	tsubcctv	%g5,	0x1367,	%l2
	tsubcctv	%o0,	%i2,	%l5
	fbg,a	%fcc2,	loop_2146
loop_2145:
	fxnor	%f28,	%f26,	%f26
	or	%g3,	%g4,	%o7
	tle	%xcc,	0x1
loop_2146:
	nop
	fitos	%f3,	%f5
	fstox	%f5,	%f20
	fxtos	%f20,	%f11
	tvs	%xcc,	0x2
	movge	%xcc,	%i3,	%o4
	nop
	setx	0x51B69F76DCB073BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x47B8E38A399DB1C7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f22,	%f18
	set	0x7D, %i0
	ldstuba	[%l7 + %i0] 0x11,	%i0
	tne	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz	%i6,	loop_2147
	tsubcctv	%l1,	%i1,	%o2
	sdivcc	%o3,	0x0095,	%i4
	brgz	%g6,	loop_2148
loop_2147:
	for	%f6,	%f12,	%f10
	udivx	%l0,	0x1D18,	%g1
	fnegd	%f10,	%f6
loop_2148:
	taddcc	%g2,	%l4,	%o6
	stbar
	sdiv	%o1,	0x1C62,	%g7
	sdivcc	%o5,	0x127A,	%i5
	fmovrdlz	%i7,	%f16,	%f18
	fmuld8ulx16	%f29,	%f17,	%f18
	add	%l3,	%l6,	%l2
	popc	0x0E1B,	%o0
	sub	%g5,	%i2,	%g3
	nop
	fitod	%f8,	%f20
	fdtoi	%f20,	%f24
	movcc	%icc,	%g4,	%l5
	brnz	%i3,	loop_2149
	umulcc	%o4,	0x1144,	%o7
	tvc	%xcc,	0x2
	fmovsvc	%xcc,	%f30,	%f5
loop_2149:
	bneg,a,pt	%xcc,	loop_2150
	nop
	fitod	%f22,	%f14
	sir	0x0F82
	tsubcctv	%i0,	%i6,	%i1
loop_2150:
	movg	%xcc,	%l1,	%o3
	brgz,a	%i4,	loop_2151
	nop
	setx	0xF053B99A,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	edge8n	%g6,	%o2,	%l0
	orn	%g2,	0x1500,	%l4
loop_2151:
	fzeros	%f30
	addccc	%o6,	%g1,	%g7
	fabsd	%f2,	%f26
	addccc	%o5,	0x17A0,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a,pn	%xcc,	loop_2152
	fmovdvc	%xcc,	%f29,	%f2
	set	0x20, %l5
	ldda	[%l7 + %l5] 0xea,	%o0
loop_2152:
	movne	%xcc,	%l3,	%l6
	fmovrsgez	%l2,	%f20,	%f6
	fbne,a	%fcc2,	loop_2153
	fbn,a	%fcc1,	loop_2154
	fmovrde	%o0,	%f28,	%f14
	membar	0x66
loop_2153:
	xnor	%i7,	0x0EFE,	%i2
loop_2154:
	stw	%g5,	[%l7 + 0x74]
	stbar
	tle	%xcc,	0x3
	ldsw	[%l7 + 0x54],	%g4
	fabsd	%f16,	%f0
	bn,a	%icc,	loop_2155
	fornot2	%f22,	%f30,	%f8
	nop
	setx	0xD886AC06F057083F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	movn	%icc,	%l5,	%i3
loop_2155:
	fbu	%fcc1,	loop_2156
	fble	%fcc1,	loop_2157
	tleu	%xcc,	0x6
	nop
	fitod	%f6,	%f20
	fdtoi	%f20,	%f11
loop_2156:
	movrgez	%g3,	%o7,	%o4
loop_2157:
	movvc	%icc,	%i6,	%i1
	tl	%icc,	0x4
	bcs,a	%xcc,	loop_2158
	bvc,pt	%icc,	loop_2159
	fble,a	%fcc3,	loop_2160
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f6
	fxtod	%f6,	%f6
loop_2158:
	umulcc	%i0,	0x0DE0,	%o3
loop_2159:
	edge32	%l1,	%i4,	%o2
loop_2160:
	std	%f8,	[%l7 + 0x40]
	fmuld8ulx16	%f22,	%f27,	%f20
	udivx	%g6,	0x1C5A,	%g2
	std	%f10,	[%l7 + 0x68]
	wr	%g0,	0x27,	%asi
	stba	%l4,	[%l7 + 0x08] %asi
	membar	#Sync
	ba,pt	%icc,	loop_2161
	tge	%icc,	0x4
	tg	%icc,	0x2
	sdivcc	%o6,	0x11F1,	%g1
loop_2161:
	brz	%g7,	loop_2162
	add	%l0,	%o5,	%o1
	nop
	fitos	%f7,	%f28
	fstox	%f28,	%f14
	fmovda	%xcc,	%f31,	%f16
loop_2162:
	nop
	setx	0xD7A94EBE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x37128F73,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f3,	%f19
	taddcctv	%l3,	0x1CA9,	%i5
	edge16	%l6,	%l2,	%o0
	set	0x10, %g2
	sta	%f10,	[%l7 + %g2] 0x81
	edge32	%i2,	%g5,	%g4
	ldstub	[%l7 + 0x54],	%i7
	fble	%fcc3,	loop_2163
	fbn,a	%fcc1,	loop_2164
	tl	%xcc,	0x2
	bneg,pt	%icc,	loop_2165
loop_2163:
	fexpand	%f7,	%f0
loop_2164:
	tvs	%icc,	0x4
	smulcc	%l5,	%g3,	%o7
loop_2165:
	popc	%o4,	%i6
	umul	%i3,	%i1,	%o3
	nop
	setx	0x1050F319,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	bge,a,pt	%icc,	loop_2166
	st	%f0,	[%l7 + 0x3C]
	ta	%icc,	0x3
	sir	0x15CB
loop_2166:
	tvc	%icc,	0x4
	nop
	set	0x14, %g4
	prefetch	[%l7 + %g4],	 0x1
	movre	%l1,	0x1D9,	%i0
	movleu	%xcc,	%i4,	%o2
	edge16ln	%g6,	%g2,	%o6
	bleu,a,pn	%icc,	loop_2167
	sub	%l4,	0x166B,	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%l0
loop_2167:
	movg	%xcc,	%o1,	%o5
	sir	0x1B56
	call	loop_2168
	sub	%l3,	0x1897,	%i5
	wr	%g0,	0x89,	%asi
	sta	%f2,	[%l7 + 0x10] %asi
loop_2168:
	fbe	%fcc3,	loop_2169
	fandnot2	%f0,	%f12,	%f20
	fcmpeq16	%f20,	%f20,	%l6
	bgu	%xcc,	loop_2170
loop_2169:
	for	%f24,	%f2,	%f10
	sdiv	%o0,	0x16C6,	%i2
	movneg	%xcc,	%l2,	%g5
loop_2170:
	fmovde	%icc,	%f25,	%f24
	tle	%xcc,	0x4
	tleu	%icc,	0x1
	subccc	%i7,	%g4,	%l5
	fandnot1s	%f19,	%f28,	%f3
	nop
	fitos	%f9,	%f22
	fstod	%f22,	%f26
	orncc	%o7,	%o4,	%i6
	fba	%fcc3,	loop_2171
	edge16l	%i3,	%i1,	%g3
	bne	%icc,	loop_2172
	fmovse	%icc,	%f5,	%f14
loop_2171:
	movrlz	%l1,	%i0,	%o3
	movpos	%xcc,	%i4,	%o2
loop_2172:
	tneg	%icc,	0x6
	sra	%g2,	%g6,	%l4
	sdivcc	%g1,	0x1021,	%g7
	fnors	%f6,	%f28,	%f6
	fcmpeq32	%f22,	%f20,	%o6
	st	%f13,	[%l7 + 0x60]
	tneg	%icc,	0x4
	fmovsleu	%xcc,	%f19,	%f13
	subc	%o1,	0x1029,	%l0
	andn	%o5,	%i5,	%l6
	udiv	%o0,	0x1292,	%i2
	sra	%l2,	0x10,	%g5
	ldub	[%l7 + 0x36],	%i7
	xnor	%l3,	%l5,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o4,	%o7
	edge8ln	%i6,	%i1,	%i3
	mova	%xcc,	%g3,	%l1
	xnor	%o3,	0x15D5,	%i4
	nop
	setx	0x719969C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xE2B90CDA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f25,	%f20
	tne	%xcc,	0x3
	edge16l	%o2,	%g2,	%g6
	fexpand	%f26,	%f30
	te	%icc,	0x2
	subccc	%i0,	%g1,	%g7
	fmovsvc	%xcc,	%f25,	%f6
	nop
	setx	loop_2173,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fsrc1	%f2,	%f6
	movcc	%icc,	%o6,	%l4
	srl	%l0,	%o1,	%i5
loop_2173:
	sth	%o5,	[%l7 + 0x2C]
	nop
	fitos	%f5,	%f18
	udiv	%l6,	0x189A,	%i2
	fbue,a	%fcc2,	loop_2174
	edge8l	%l2,	%g5,	%i7
	movrlez	%o0,	%l5,	%g4
	fbge	%fcc2,	loop_2175
loop_2174:
	array8	%l3,	%o7,	%i6
	sir	0x0697
	bvc,a	loop_2176
loop_2175:
	fpmerge	%f7,	%f16,	%f8
	movrne	%i1,	%o4,	%i3
	array8	%l1,	%o3,	%g3
loop_2176:
	movl	%icc,	%i4,	%g2
	xorcc	%o2,	0x0544,	%i0
	sethi	0x1C32,	%g6
	movcc	%icc,	%g7,	%o6
	bvc,a,pn	%xcc,	loop_2177
	srl	%g1,	%l4,	%o1
	movvs	%xcc,	%l0,	%i5
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2177:
	fzero	%f26
	movge	%icc,	%o5,	%i2
	andcc	%l2,	0x1D13,	%g5
	movne	%icc,	%i7,	%l6
	movrgz	%o0,	0x235,	%g4
	udivx	%l5,	0x0790,	%o7
	and	%i6,	0x1433,	%i1
	fornot2s	%f11,	%f21,	%f16
	tsubcctv	%o4,	0x01F0,	%i3
	or	%l3,	%l1,	%g3
	andn	%i4,	%o3,	%o2
	fpackfix	%f24,	%f7
	udivx	%g2,	0x140E,	%g6
	tg	%xcc,	0x5
	addc	%g7,	0x1751,	%i0
	bpos,a,pt	%icc,	loop_2178
	fabss	%f0,	%f25
	fnands	%f14,	%f13,	%f0
	stb	%g1,	[%l7 + 0x3D]
loop_2178:
	alignaddrl	%o6,	%l4,	%l0
	fmul8x16au	%f22,	%f11,	%f8
	bcs,a	loop_2179
	tn	%xcc,	0x0
	subcc	%i5,	0x0DC1,	%o1
	edge32n	%o5,	%i2,	%l2
loop_2179:
	tpos	%icc,	0x3
	taddcc	%i7,	%g5,	%l6
	fmovsa	%xcc,	%f27,	%f14
	srlx	%g4,	%l5,	%o7
	smulcc	%o0,	0x1520,	%i6
	fmovspos	%xcc,	%f10,	%f3
	tleu	%xcc,	0x2
	andncc	%o4,	%i3,	%l3
	tsubcctv	%i1,	0x1091,	%g3
	fbug	%fcc2,	loop_2180
	bcs	loop_2181
	tpos	%icc,	0x2
	lduw	[%l7 + 0x24],	%l1
loop_2180:
	nop
	set	0x3C, %i2
	lduwa	[%l7 + %i2] 0x81,	%o3
loop_2181:
	brgez,a	%i4,	loop_2182
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xA44B7ACD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x795CBD46,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f21,	%f11
	addccc	%o2,	0x0D3E,	%g2
loop_2182:
	edge32n	%g6,	%g7,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f13,	%f16,	%f17
	fbge	%fcc3,	loop_2183
	xnorcc	%o6,	0x06E5,	%g1
	tneg	%xcc,	0x5
	be	loop_2184
loop_2183:
	movge	%xcc,	%l4,	%l0
	fone	%f6
	fmovsvs	%icc,	%f22,	%f14
loop_2184:
	movle	%icc,	%o1,	%o5
	edge32n	%i5,	%l2,	%i7
	ldd	[%l7 + 0x68],	%f22
	ldsb	[%l7 + 0x5E],	%i2
	edge16ln	%g5,	%l6,	%g4
	edge8n	%o7,	%o0,	%l5
	umul	%i6,	%o4,	%i3
	prefetch	[%l7 + 0x2C],	 0x1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x69] %asi,	%l3
	edge8	%i1,	%g3,	%o3
	tpos	%icc,	0x7
	tgu	%icc,	0x3
	ba,a,pn	%xcc,	loop_2185
	bge,pt	%xcc,	loop_2186
	fmovrse	%i4,	%f20,	%f31
	movre	%l1,	%o2,	%g2
loop_2185:
	fones	%f14
loop_2186:
	fandnot2s	%f22,	%f11,	%f19
	fnand	%f12,	%f12,	%f0
	nop
	setx	0xE3D217B3F5097302,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA472589395362CCE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f26,	%f0
	nop
	setx	0xFE08B70C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xED8C10B6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f6,	%f0
	fbl,a	%fcc1,	loop_2187
	orn	%g6,	%g7,	%o6
	fmovda	%xcc,	%f6,	%f9
	fbg	%fcc0,	loop_2188
loop_2187:
	xor	%g1,	%l4,	%i0
	xnor	%o1,	0x100E,	%o5
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
loop_2188:
	movneg	%icc,	%l2,	%l0
	lduh	[%l7 + 0x14],	%i2
	srl	%g5,	0x1B,	%l6
	bshuffle	%f28,	%f16,	%f2
	fbue	%fcc3,	loop_2189
	brgez	%i7,	loop_2190
	umul	%o7,	0x16AF,	%g4
	tpos	%xcc,	0x7
loop_2189:
	fmovdle	%icc,	%f7,	%f6
loop_2190:
	fone	%f14
	nop
	fitod	%f6,	%f6
	fdtoi	%f6,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l5,	%o0,	%i6
	nop
	setx	loop_2191,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%xcc,	0x2
	sdivcc	%o4,	0x0193,	%i3
	brlz	%l3,	loop_2192
loop_2191:
	fbue,a	%fcc2,	loop_2193
	smulcc	%i1,	0x0ADA,	%o3
	movne	%xcc,	%i4,	%g3
loop_2192:
	array32	%o2,	%l1,	%g2
loop_2193:
	popc	0x1E78,	%g7
	mova	%xcc,	%o6,	%g6
	movrgez	%l4,	%g1,	%i0
	swap	[%l7 + 0x18],	%o5
	subcc	%o1,	0x15F5,	%l2
	fmovrslez	%l0,	%f1,	%f1
	bn,a,pn	%xcc,	loop_2194
	st	%f15,	[%l7 + 0x20]
	fmovrsgz	%i2,	%f20,	%f15
	and	%i5,	%l6,	%g5
loop_2194:
	fmovrsgz	%o7,	%f23,	%f19
	bcs	%xcc,	loop_2195
	array16	%i7,	%l5,	%g4
	tcc	%xcc,	0x3
	fbe	%fcc1,	loop_2196
loop_2195:
	sdiv	%o0,	0x00A7,	%o4
	edge8ln	%i6,	%i3,	%l3
	umul	%o3,	%i4,	%g3
loop_2196:
	edge16n	%i1,	%o2,	%g2
	fmovsn	%xcc,	%f26,	%f4
	bvs,a	%icc,	loop_2197
	edge16l	%l1,	%g7,	%o6
	fcmpne16	%f26,	%f18,	%g6
	stw	%g1,	[%l7 + 0x68]
loop_2197:
	edge8ln	%l4,	%o5,	%o1
	tn	%xcc,	0x5
	sdiv	%l2,	0x0C65,	%l0
	tl	%icc,	0x6
	fbule	%fcc0,	loop_2198
	fnor	%f10,	%f18,	%f22
	fbl,a	%fcc3,	loop_2199
	fbe	%fcc0,	loop_2200
loop_2198:
	fbl	%fcc1,	loop_2201
	bcc,a	%xcc,	loop_2202
loop_2199:
	fbug,a	%fcc3,	loop_2203
loop_2200:
	tle	%xcc,	0x7
loop_2201:
	addccc	%i2,	0x1EDF,	%i5
loop_2202:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%l6
loop_2203:
	edge16ln	%g5,	%i7,	%l5
	tvs	%icc,	0x3
	movvc	%icc,	%g4,	%o0
	xnorcc	%o4,	%o7,	%i3
	udivx	%l3,	0x1E26,	%o3
	bvc,a,pt	%icc,	loop_2204
	tn	%icc,	0x0
	faligndata	%f22,	%f26,	%f4
	alignaddrl	%i6,	%i4,	%g3
loop_2204:
	bgu,pn	%xcc,	loop_2205
	movg	%xcc,	%o2,	%g2
	xnorcc	%l1,	0x1561,	%i1
	alignaddrl	%o6,	%g6,	%g1
loop_2205:
	std	%f0,	[%l7 + 0x48]
	tpos	%xcc,	0x6
	xnorcc	%g7,	%o5,	%l4
	movrgez	%l2,	0x2FF,	%o1
	and	%l0,	%i2,	%i5
	edge32ln	%l6,	%i0,	%i7
	sll	%g5,	%g4,	%o0
	ldstub	[%l7 + 0x43],	%o4
	brz,a	%o7,	loop_2206
	stw	%l5,	[%l7 + 0x54]
	orncc	%l3,	0x069C,	%o3
	mulscc	%i3,	%i4,	%i6
loop_2206:
	tcs	%icc,	0x0
	tneg	%icc,	0x5
	edge16n	%g3,	%o2,	%l1
	orncc	%i1,	%o6,	%g6
	and	%g1,	%g7,	%o5
	brgez,a	%g2,	loop_2207
	lduw	[%l7 + 0x54],	%l2
	andn	%o1,	%l4,	%l0
	andncc	%i2,	%l6,	%i0
loop_2207:
	nop
	set	0x0, %g1
	ldxa	[%g0 + %g1] 0x58,	%i5
	movneg	%xcc,	%g5,	%g4
	fble,a	%fcc2,	loop_2208
	fbne	%fcc3,	loop_2209
	fmovsne	%icc,	%f24,	%f3
	fpadd16	%f6,	%f22,	%f6
loop_2208:
	udivcc	%o0,	0x07AD,	%o4
loop_2209:
	edge16l	%o7,	%i7,	%l3
	fornot2	%f22,	%f10,	%f6
	fbg	%fcc3,	loop_2210
	fbule	%fcc0,	loop_2211
	array32	%o3,	%i3,	%i4
	fbe	%fcc1,	loop_2212
loop_2210:
	tl	%icc,	0x1
loop_2211:
	fornot2	%f6,	%f8,	%f10
	fbn,a	%fcc0,	loop_2213
loop_2212:
	orcc	%i6,	0x0E83,	%g3
	set	0x46, %l1
	stha	%l5,	[%l7 + %l1] 0xea
	membar	#Sync
loop_2213:
	subc	%o2,	0x1CE0,	%l1
	addcc	%i1,	%o6,	%g6
	edge16n	%g1,	%g7,	%o5
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%l2
	or	%g2,	%o1,	%l0
	movne	%icc,	%i2,	%l4
	edge32n	%l6,	%i5,	%i0
	sra	%g4,	%o0,	%g5
	array32	%o4,	%o7,	%i7
	fzeros	%f19
	orn	%o3,	0x0833,	%i3
	fmul8x16	%f4,	%f26,	%f2
	tgu	%xcc,	0x6
	ldsh	[%l7 + 0x1A],	%l3
	edge16	%i6,	%g3,	%i4
	movgu	%icc,	%o2,	%l5
	brlez,a	%i1,	loop_2214
	orcc	%l1,	%g6,	%g1
	alignaddr	%o6,	%o5,	%g7
	bl,a,pt	%xcc,	loop_2215
loop_2214:
	udiv	%g2,	0x1DF7,	%l2
	taddcc	%l0,	0x0C54,	%i2
	movrne	%o1,	%l4,	%i5
loop_2215:
	fmovsl	%icc,	%f13,	%f7
	srl	%i0,	0x08,	%l6
	movn	%xcc,	%o0,	%g5
	udiv	%o4,	0x0C71,	%o7
	edge16l	%g4,	%i7,	%i3
	ble,a,pt	%xcc,	loop_2216
	fcmpeq32	%f12,	%f24,	%o3
	fmovdle	%icc,	%f13,	%f1
	fmovsvs	%icc,	%f27,	%f12
loop_2216:
	bn,a,pt	%icc,	loop_2217
	ta	%xcc,	0x3
	alignaddr	%l3,	%g3,	%i4
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2217:
	movn	%icc,	%i6,	%o2
	tge	%xcc,	0x4
	nop
	setx	0xD1FAEA44,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f1
	stw	%i1,	[%l7 + 0x2C]
	fbu,a	%fcc1,	loop_2218
	tsubcctv	%l1,	%g6,	%g1
	smul	%o6,	%l5,	%o5
	edge8n	%g2,	%l2,	%g7
loop_2218:
	brgz	%l0,	loop_2219
	tvs	%xcc,	0x4
	xorcc	%i2,	0x1BD5,	%l4
	bcc	%xcc,	loop_2220
loop_2219:
	fmovd	%f20,	%f10
	andn	%i5,	0x0679,	%i0
	fnand	%f12,	%f16,	%f16
loop_2220:
	fbn,a	%fcc2,	loop_2221
	fzeros	%f13
	flush	%l7 + 0x3C
	udivcc	%o1,	0x0DDE,	%o0
loop_2221:
	tl	%xcc,	0x7
	taddcc	%l6,	%g5,	%o7
	fmovdn	%xcc,	%f1,	%f17
	fmovsneg	%xcc,	%f20,	%f12
	fbge,a	%fcc2,	loop_2222
	sub	%g4,	0x19ED,	%i7
	edge16ln	%o4,	%o3,	%l3
	movneg	%icc,	%g3,	%i4
loop_2222:
	tleu	%xcc,	0x5
	ta	%xcc,	0x1
	fbue,a	%fcc2,	loop_2223
	edge8l	%i6,	%o2,	%i1
	movle	%icc,	%i3,	%l1
	tg	%icc,	0x1
loop_2223:
	nop
	wr	%g0,	0xe2,	%asi
	stba	%g1,	[%l7 + 0x2E] %asi
	membar	#Sync
	movrne	%g6,	0x088,	%l5
	sdivx	%o6,	0x0DC3,	%g2
	add	%l2,	0x0577,	%g7
	edge8ln	%o5,	%i2,	%l0
	set	0x31, %o5
	lduba	[%l7 + %o5] 0x18,	%l4
	fbe,a	%fcc3,	loop_2224
	edge16n	%i5,	%i0,	%o0
	subccc	%o1,	0x1192,	%l6
	edge32l	%g5,	%o7,	%g4
loop_2224:
	fpsub16s	%f22,	%f13,	%f23
	array16	%o4,	%o3,	%l3
	movge	%icc,	%g3,	%i7
	faligndata	%f6,	%f16,	%f6
	taddcc	%i4,	0x1C38,	%o2
	mulscc	%i1,	%i3,	%i6
	addc	%l1,	0x1D6E,	%g1
	fzeros	%f29
	move	%icc,	%g6,	%o6
	edge16n	%l5,	%l2,	%g2
	array32	%g7,	%o5,	%i2
	edge32	%l0,	%i5,	%l4
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
	add	%o1,	0x01ED,	%l6
	umulcc	%o0,	0x0503,	%g5
	mova	%icc,	%g4,	%o4
	set	0x53, %l6
	lduba	[%l7 + %l6] 0x80,	%o3
	fnot1	%f2,	%f28
	bl	loop_2225
	fcmple16	%f20,	%f18,	%o7
	brgz,a	%g3,	loop_2226
	edge8l	%i7,	%i4,	%o2
loop_2225:
	fmovsle	%xcc,	%f0,	%f10
	ldub	[%l7 + 0x5B],	%l3
loop_2226:
	fnand	%f16,	%f30,	%f22
	movge	%xcc,	%i1,	%i6
	mulscc	%l1,	%i3,	%g1
	fpmerge	%f29,	%f21,	%f26
	fbule	%fcc3,	loop_2227
	fpack32	%f18,	%f24,	%f14
	movvs	%xcc,	%o6,	%l5
	tl	%xcc,	0x4
loop_2227:
	movleu	%xcc,	%g6,	%l2
	fbe,a	%fcc1,	loop_2228
	sth	%g2,	[%l7 + 0x0C]
	movneg	%icc,	%g7,	%o5
	array32	%l0,	%i2,	%l4
loop_2228:
	subcc	%i5,	%o1,	%l6
	edge16ln	%i0,	%g5,	%g4
	sra	%o4,	%o0,	%o3
	fmovdn	%xcc,	%f24,	%f7
	movrgz	%g3,	0x194,	%o7
	movrlz	%i7,	%o2,	%l3
	sir	0x10F4
	nop
	set	0x48, %i7
	stx	%i4,	[%l7 + %i7]
	fpsub32	%f10,	%f30,	%f20
	fmovdg	%icc,	%f13,	%f16
	ble,a	loop_2229
	edge32l	%i6,	%l1,	%i3
	nop
	fitos	%f12,	%f25
	fstox	%f25,	%f24
	fxtos	%f24,	%f24
	tl	%xcc,	0x4
loop_2229:
	tl	%xcc,	0x6
	tne	%icc,	0x4
	bneg	%xcc,	loop_2230
	sth	%i1,	[%l7 + 0x66]
	fnot2	%f12,	%f28
	addcc	%g1,	0x0FC4,	%l5
loop_2230:
	fmovrse	%g6,	%f3,	%f28
	nop
	fitod	%f24,	%f14
	edge8	%l2,	%g2,	%o6
	fmovrde	%g7,	%f20,	%f16
	nop
	fitos	%f6,	%f19
	fstox	%f19,	%f20
	fxtos	%f20,	%f14
	fabss	%f7,	%f10
	orn	%o5,	0x1260,	%l0
	fbue,a	%fcc1,	loop_2231
	edge8	%i2,	%l4,	%o1
	or	%i5,	0x17FA,	%i0
	fcmpgt16	%f18,	%f14,	%g5
loop_2231:
	ld	[%l7 + 0x40],	%f28
	udivcc	%g4,	0x0328,	%l6
	set	0x0F, %o3
	ldsba	[%l7 + %o3] 0x15,	%o4
	fpsub16	%f10,	%f0,	%f14
	movgu	%icc,	%o3,	%o0
	fcmpgt16	%f20,	%f10,	%g3
	fand	%f26,	%f30,	%f0
	fmovde	%xcc,	%f27,	%f12
	edge8	%i7,	%o7,	%l3
	movrlez	%o2,	0x28E,	%i6
	tl	%xcc,	0x4
	set	0x08, %i3
	stxa	%l1,	[%l7 + %i3] 0x10
	edge32ln	%i4,	%i1,	%g1
	mulscc	%l5,	%i3,	%l2
	movge	%xcc,	%g2,	%o6
	stw	%g6,	[%l7 + 0x40]
	fmovda	%icc,	%f13,	%f17
	edge8ln	%g7,	%l0,	%i2
	te	%xcc,	0x3
	fmuld8sux16	%f9,	%f12,	%f14
	subcc	%o5,	0x1987,	%l4
	tneg	%icc,	0x5
	sllx	%o1,	%i0,	%i5
	fpadd16s	%f19,	%f10,	%f31
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x42] %asi,	%g5
	array32	%l6,	%g4,	%o3
	tcs	%icc,	0x6
	subccc	%o0,	0x03F6,	%g3
	orn	%i7,	0x0FD1,	%o7
	tne	%icc,	0x1
	tle	%xcc,	0x6
	fmovsl	%icc,	%f13,	%f12
	edge8	%l3,	%o2,	%i6
	nop
	setx loop_2232, %l0, %l1
	jmpl %l1, %o4
	xorcc	%i4,	%l1,	%i1
	fbg,a	%fcc1,	loop_2233
	sllx	%g1,	0x16,	%i3
loop_2232:
	xnor	%l2,	0x03FC,	%g2
	fpackfix	%f12,	%f3
loop_2233:
	bge,a,pt	%icc,	loop_2234
	edge8ln	%l5,	%o6,	%g6
	subcc	%l0,	0x076F,	%i2
	tvc	%xcc,	0x1
loop_2234:
	fmovsgu	%icc,	%f28,	%f12
	array8	%o5,	%l4,	%g7
	te	%icc,	0x4
	movleu	%icc,	%o1,	%i5
	mulx	%g5,	0x071D,	%l6
	movvc	%icc,	%i0,	%o3
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x3C] %asi,	%o0
	tleu	%icc,	0x1
	fmovdneg	%icc,	%f25,	%f1
	nop
	setx	0x50648F09,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	call	loop_2235
	fmovspos	%xcc,	%f10,	%f4
	sra	%g4,	%g3,	%o7
	xor	%l3,	%i7,	%o2
loop_2235:
	bshuffle	%f22,	%f8,	%f28
	fzero	%f0
	call	loop_2236
	nop
	fitos	%f2,	%f23
	fstox	%f23,	%f20
	fxtos	%f20,	%f20
	udivx	%o4,	0x14B6,	%i4
	nop
	setx	0xC49618278D37DDCC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f0
loop_2236:
	ldub	[%l7 + 0x6E],	%i6
	bvc	loop_2237
	fmovrdgz	%i1,	%f16,	%f20
	swap	[%l7 + 0x5C],	%g1
	fornot2s	%f8,	%f16,	%f30
loop_2237:
	movrne	%l1,	%l2,	%i3
	nop
	setx	0xB31D7483,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x09CC98C8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f4,	%f11
	sdiv	%l5,	0x1768,	%g2
	alignaddr	%o6,	%g6,	%l0
	movne	%icc,	%i2,	%l4
	movgu	%xcc,	%o5,	%g7
	tsubcc	%i5,	%o1,	%g5
	movle	%xcc,	%i0,	%o3
	tneg	%icc,	0x0
	array16	%o0,	%l6,	%g4
	edge32n	%g3,	%o7,	%i7
	tcc	%xcc,	0x7
	sdiv	%o2,	0x004D,	%l3
	movre	%o4,	%i6,	%i4
	edge16	%i1,	%g1,	%l2
	movcs	%xcc,	%i3,	%l5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%g2,	%o6
	fbe,a	%fcc0,	loop_2238
	movgu	%xcc,	%g6,	%l0
	edge32ln	%l1,	%l4,	%o5
	te	%icc,	0x3
loop_2238:
	movg	%icc,	%i2,	%i5
	movvs	%icc,	%o1,	%g5
	movgu	%icc,	%g7,	%o3
	movvc	%icc,	%o0,	%i0
	fbg,a	%fcc0,	loop_2239
	smul	%g4,	%l6,	%g3
	fnegd	%f30,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2239:
	movl	%xcc,	%o7,	%i7
	bcc,a,pt	%icc,	loop_2240
	fxors	%f6,	%f7,	%f25
	fmul8ulx16	%f30,	%f10,	%f0
	addc	%o2,	0x0082,	%o4
loop_2240:
	fmuld8ulx16	%f7,	%f5,	%f6
	tpos	%icc,	0x7
	subc	%i6,	0x1C45,	%l3
	edge32ln	%i1,	%g1,	%i4
	ldd	[%l7 + 0x48],	%f28
	fmovrdlez	%l2,	%f2,	%f2
	edge16	%l5,	%g2,	%o6
	array32	%g6,	%i3,	%l1
	edge8l	%l0,	%o5,	%l4
	fabss	%f21,	%f13
	brlz	%i5,	loop_2241
	fbe	%fcc2,	loop_2242
	subc	%o1,	%g5,	%g7
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%i2
loop_2241:
	sir	0x19CC
loop_2242:
	movcc	%icc,	%o3,	%o0
	fbue,a	%fcc2,	loop_2243
	movcc	%icc,	%g4,	%i0
	fbge,a	%fcc0,	loop_2244
	ldstub	[%l7 + 0x46],	%l6
loop_2243:
	andn	%o7,	0x0CC9,	%g3
	sub	%o2,	0x0DA7,	%o4
loop_2244:
	edge32	%i7,	%i6,	%l3
	pdist	%f0,	%f16,	%f26
	tsubcctv	%g1,	%i1,	%l2
	bg	loop_2245
	edge32	%i4,	%g2,	%l5
	movn	%icc,	%g6,	%o6
	movvs	%xcc,	%l1,	%i3
loop_2245:
	and	%o5,	%l0,	%l4
	movre	%i5,	%g5,	%o1
	lduh	[%l7 + 0x10],	%g7
	tn	%xcc,	0x2
	fnot1	%f16,	%f24
	movg	%xcc,	%o3,	%i2
	set	0x5E, %l3
	ldsba	[%l7 + %l3] 0x18,	%g4
	alignaddr	%o0,	%i0,	%o7
	fexpand	%f16,	%f10
	bvc	loop_2246
	bneg,pt	%xcc,	loop_2247
	fnot1	%f6,	%f2
	fornot1	%f10,	%f10,	%f18
loop_2246:
	nop
	setx loop_2248, %l0, %l1
	jmpl %l1, %l6
loop_2247:
	mulx	%g3,	%o2,	%i7
	movrlez	%i6,	%o4,	%l3
	andncc	%i1,	%g1,	%l2
loop_2248:
	srax	%g2,	0x19,	%i4
	wr	%g0,	0x89,	%asi
	stba	%l5,	[%l7 + 0x29] %asi
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f26
	fxtod	%f26,	%f0
	set	0x20, %g7
	lduwa	[%l7 + %g7] 0x88,	%o6
	xnor	%g6,	0x1C46,	%l1
	edge32	%o5,	%l0,	%l4
	fbu	%fcc3,	loop_2249
	sth	%i3,	[%l7 + 0x3A]
	fabss	%f16,	%f7
	set	0x48, %o2
	ldxa	[%l7 + %o2] 0x80,	%g5
loop_2249:
	sdivx	%i5,	0x0794,	%o1
	edge8ln	%g7,	%o3,	%g4
	be,a,pt	%icc,	loop_2250
	te	%icc,	0x1
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
loop_2250:
	tne	%xcc,	0x5
	fxor	%f14,	%f14,	%f10
	lduw	[%l7 + 0x6C],	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f6,	%f16,	%f16
	movpos	%xcc,	%o0,	%o7
	movg	%icc,	%l6,	%g3
	fmul8x16al	%f17,	%f30,	%f10
	fmovrdgez	%o2,	%f0,	%f24
	fmuld8sux16	%f15,	%f3,	%f16
	movvs	%icc,	%i6,	%o4
	srlx	%l3,	%i1,	%g1
	fxors	%f14,	%f22,	%f14
	tg	%icc,	0x1
	mova	%icc,	%l2,	%g2
	bgu	%icc,	loop_2251
	fmovdcs	%icc,	%f14,	%f24
	andcc	%i4,	%i7,	%o6
	xnor	%g6,	%l1,	%o5
loop_2251:
	addccc	%l5,	%l4,	%l0
	xorcc	%i3,	0x1ECB,	%g5
	movle	%icc,	%i5,	%o1
	wr	%g0,	0x89,	%asi
	stha	%g7,	[%l7 + 0x10] %asi
	lduh	[%l7 + 0x6A],	%g4
	sll	%o3,	%i0,	%o0
	fmovsg	%icc,	%f7,	%f7
	bne,pt	%icc,	loop_2252
	fone	%f6
	be,pt	%xcc,	loop_2253
	movleu	%icc,	%i2,	%o7
loop_2252:
	array16	%l6,	%o2,	%g3
	tl	%xcc,	0x4
loop_2253:
	xor	%i6,	%o4,	%i1
	array8	%g1,	%l3,	%g2
	fbge,a	%fcc2,	loop_2254
	subcc	%i4,	0x1B3C,	%i7
	andncc	%l2,	%o6,	%l1
	sdivcc	%g6,	0x0C60,	%o5
loop_2254:
	movrne	%l4,	0x1BD,	%l0
	fnegd	%f22,	%f0
	movrne	%i3,	0x192,	%g5
	addcc	%l5,	%o1,	%i5
	movrne	%g7,	%o3,	%g4
	fpack32	%f12,	%f30,	%f30
	movrlz	%o0,	%i0,	%o7
	nop
	setx loop_2255, %l0, %l1
	jmpl %l1, %i2
	and	%l6,	0x018C,	%o2
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g3
loop_2255:
	fbg,a	%fcc0,	loop_2256
	te	%xcc,	0x4
	orcc	%i6,	%o4,	%g1
	edge16ln	%l3,	%i1,	%g2
loop_2256:
	ldsb	[%l7 + 0x24],	%i7
	array8	%i4,	%o6,	%l2
	fcmpgt32	%f24,	%f16,	%g6
	fcmpeq32	%f20,	%f24,	%o5
	tne	%icc,	0x7
	array32	%l4,	%l0,	%l1
	fcmpne16	%f18,	%f12,	%g5
	st	%f29,	[%l7 + 0x3C]
	tvs	%xcc,	0x3
	and	%i3,	%o1,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a	%icc,	loop_2257
	subcc	%i5,	0x05F5,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f26,	%f11
loop_2257:
	orncc	%o3,	0x1FF5,	%o0
	fmovse	%xcc,	%f22,	%f10
	udivx	%g4,	0x08FA,	%o7
	sdivcc	%i2,	0x1BA1,	%i0
	fexpand	%f8,	%f10
	fmovse	%xcc,	%f2,	%f19
	fbo,a	%fcc2,	loop_2258
	fblg	%fcc2,	loop_2259
	subccc	%o2,	0x18C3,	%g3
	fmovsgu	%xcc,	%f2,	%f19
loop_2258:
	alignaddr	%i6,	%l6,	%g1
loop_2259:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o4,	%l3
	bg,pt	%xcc,	loop_2260
	udivx	%i1,	0x04F8,	%g2
	stw	%i4,	[%l7 + 0x2C]
	nop
	setx	0x606399EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
loop_2260:
	popc	0x1F77,	%o6
	tneg	%xcc,	0x2
	movleu	%icc,	%l2,	%g6
	umul	%i7,	%o5,	%l0
	sdivcc	%l1,	0x1FC2,	%l4
	tgu	%icc,	0x7
	lduw	[%l7 + 0x28],	%i3
	fbge	%fcc3,	loop_2261
	bpos,pt	%xcc,	loop_2262
	udivx	%g5,	0x1DBD,	%o1
	tne	%xcc,	0x3
loop_2261:
	fandnot1	%f16,	%f8,	%f16
loop_2262:
	movleu	%xcc,	%i5,	%g7
	movg	%xcc,	%l5,	%o0
	mova	%xcc,	%g4,	%o7
	edge32l	%o3,	%i0,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,pn	%icc,	loop_2263
	subcc	%i2,	%i6,	%l6
	nop
	setx	0x6045E960,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	fornot2	%f6,	%f10,	%f12
loop_2263:
	umulcc	%g1,	%g3,	%l3
	ldx	[%l7 + 0x28],	%o4
	mulx	%i1,	%i4,	%g2
	fmovscs	%xcc,	%f0,	%f18
	xorcc	%l2,	%g6,	%i7
	brgz	%o6,	loop_2264
	ldd	[%l7 + 0x68],	%o4
	fbe	%fcc3,	loop_2265
	fcmpne32	%f28,	%f8,	%l0
loop_2264:
	fors	%f25,	%f17,	%f27
	fmovrdgez	%l4,	%f20,	%f8
loop_2265:
	xorcc	%l1,	%i3,	%o1
	for	%f10,	%f0,	%f4
	fnand	%f10,	%f22,	%f2
	movvs	%xcc,	%i5,	%g5
	fpmerge	%f10,	%f18,	%f26
	tg	%icc,	0x5
	tcc	%xcc,	0x1
	fcmple32	%f18,	%f26,	%g7
	mova	%icc,	%o0,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g4,	%o3,	%i0
	add	%o7,	0x1F44,	%o2
	std	%f16,	[%l7 + 0x50]
	fmovrslz	%i6,	%f3,	%f17
	tgu	%xcc,	0x5
	edge16	%i2,	%g1,	%l6
	nop
	setx	0xBDD02624204CA3CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	movpos	%xcc,	%l3,	%g3
	stw	%i1,	[%l7 + 0x64]
	subc	%o4,	0x19EA,	%i4
	fpsub32s	%f24,	%f20,	%f2
	smul	%g2,	0x02FC,	%l2
	mulscc	%g6,	0x1551,	%o6
	fcmpgt32	%f16,	%f0,	%o5
	fmovsvs	%xcc,	%f16,	%f22
	bneg,a,pn	%icc,	loop_2266
	fsrc1s	%f20,	%f7
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x30] %asi,	%i7
loop_2266:
	taddcc	%l0,	%l1,	%l4
	nop
	setx loop_2267, %l0, %l1
	jmpl %l1, %i3
	movpos	%icc,	%o1,	%g5
	std	%f24,	[%l7 + 0x30]
	array8	%g7,	%o0,	%l5
loop_2267:
	tcc	%icc,	0x1
	fpack16	%f22,	%f15
	movvs	%icc,	%i5,	%g4
	orn	%o3,	0x1AA1,	%i0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	tne	%xcc,	0x4
	udivx	%i6,	0x1409,	%i2
	fmovdcs	%xcc,	%f14,	%f12
	edge16n	%o2,	%g1,	%l6
	fmuld8sux16	%f5,	%f22,	%f6
	ta	%icc,	0x6
	alignaddrl	%g3,	%l3,	%i1
	movrlez	%i4,	0x242,	%g2
	flush	%l7 + 0x74
	umul	%o4,	%g6,	%o6
	tl	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,pn	%icc,	loop_2268
	be,a	loop_2269
	fmovrde	%o5,	%f12,	%f22
	bvs,a,pt	%icc,	loop_2270
loop_2268:
	stw	%l2,	[%l7 + 0x24]
loop_2269:
	edge8l	%i7,	%l1,	%l4
	sdivcc	%l0,	0x0610,	%i3
loop_2270:
	fcmpeq32	%f30,	%f30,	%o1
	edge16	%g5,	%g7,	%l5
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x24] %asi,	%f5
	subcc	%i5,	0x0853,	%g4
	andcc	%o0,	0x0992,	%o3
	fbne	%fcc1,	loop_2271
	fnot2	%f2,	%f12
	subcc	%o7,	0x0710,	%i0
	ld	[%l7 + 0x70],	%f8
loop_2271:
	movleu	%icc,	%i6,	%i2
	fblg	%fcc0,	loop_2272
	nop
	setx	0xD6570638,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xDBAE3CAB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f28,	%f19
	xnor	%g1,	0x0344,	%l6
	fbe	%fcc3,	loop_2273
loop_2272:
	membar	0x0B
	sdiv	%o2,	0x0B3A,	%l3
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
loop_2273:
	fmovdvs	%icc,	%f6,	%f21
	edge16	%i4,	%g2,	%o4
	edge32ln	%g6,	%i1,	%o5
	fbu	%fcc0,	loop_2274
	fmovspos	%xcc,	%f8,	%f29
	nop
	set	0x2C, %i4
	stw	%l2,	[%l7 + %i4]
	mulx	%i7,	0x14C9,	%o6
loop_2274:
	nop
	fitos	%f3,	%f7
	fstox	%f7,	%f6
	fxtos	%f6,	%f12
	fmovrsne	%l4,	%f28,	%f30
	mova	%xcc,	%l0,	%i3
	nop
	fitod	%f28,	%f28
	andncc	%l1,	%o1,	%g5
	movpos	%xcc,	%g7,	%l5
	orcc	%g4,	0x12B2,	%o0
	movg	%xcc,	%o3,	%i5
	movrlez	%i0,	0x3BF,	%o7
	movrgz	%i2,	0x36E,	%i6
	nop
	setx	0xC0616B65,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	movrgez	%l6,	0x250,	%g1
	srax	%o2,	0x13,	%g3
	tn	%xcc,	0x4
	xnor	%i4,	0x1E8E,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l3,	0x13,	%g6
	fbuge,a	%fcc1,	loop_2275
	fbul	%fcc1,	loop_2276
	addcc	%i1,	0x19B3,	%o5
	tneg	%icc,	0x1
loop_2275:
	call	loop_2277
loop_2276:
	fmovdleu	%icc,	%f23,	%f29
	movneg	%xcc,	%o4,	%i7
	xorcc	%l2,	%o6,	%l4
loop_2277:
	ta	%icc,	0x2
	brz	%i3,	loop_2278
	movvs	%xcc,	%l1,	%o1
	mova	%xcc,	%g5,	%l0
	movvc	%xcc,	%g7,	%l5
loop_2278:
	nop
	set	0x3D, %l0
	lduba	[%l7 + %l0] 0x0c,	%o0
	udivx	%o3,	0x0B7C,	%i5
	taddcc	%i0,	%g4,	%i2
	fmovsn	%icc,	%f29,	%f19
	fpackfix	%f6,	%f18
	tneg	%icc,	0x6
	mulx	%i6,	%o7,	%g1
	udivcc	%l6,	0x0354,	%g3
	movcs	%icc,	%o2,	%i4
	tle	%icc,	0x6
	mulscc	%l3,	0x0BCF,	%g6
	mulx	%i1,	0x1A47,	%g2
	edge8l	%o4,	%i7,	%o5
	array8	%l2,	%l4,	%i3
	movvc	%icc,	%o6,	%o1
	edge8l	%g5,	%l0,	%g7
	sra	%l1,	0x16,	%l5
	edge16l	%o0,	%o3,	%i5
	fnand	%f6,	%f16,	%f26
	popc	%g4,	%i2
	set	0x28, %l4
	lda	[%l7 + %l4] 0x14,	%f16
	movleu	%icc,	%i0,	%i6
	sub	%g1,	%l6,	%g3
	movg	%xcc,	%o2,	%o7
	movpos	%xcc,	%l3,	%i4
	alignaddr	%i1,	%g6,	%g2
	sdivx	%i7,	0x1EBD,	%o5
	membar	0x24
	tgu	%xcc,	0x6
	srax	%l2,	%o4,	%l4
	orncc	%i3,	%o6,	%o1
	addccc	%g5,	0x0AAE,	%g7
	wr	%g0,	0x0c,	%asi
	stba	%l0,	[%l7 + 0x3C] %asi
	and	%l1,	0x0A88,	%l5
	srlx	%o3,	%i5,	%g4
	udivcc	%o0,	0x197A,	%i2
	fexpand	%f24,	%f14
	brgez,a	%i6,	loop_2279
	tg	%xcc,	0x6
	ta	%xcc,	0x1
	add	%g1,	%i0,	%g3
loop_2279:
	ble,a	loop_2280
	fandnot1	%f16,	%f16,	%f6
	movrgz	%o2,	0x282,	%l6
	sethi	0x16D8,	%o7
loop_2280:
	tne	%icc,	0x3
	movle	%xcc,	%l3,	%i4
	and	%i1,	0x16D1,	%g2
	mulscc	%i7,	0x0618,	%o5
	array16	%g6,	%l2,	%l4
	sethi	0x1A60,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o6,	0x1997,	%o4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x5B] %asi,	%o1
	sra	%g5,	0x01,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x3
	fblg,a	%fcc0,	loop_2281
	fmul8sux16	%f12,	%f22,	%f0
	edge8l	%l1,	%l5,	%o3
	movvs	%xcc,	%g7,	%g4
loop_2281:
	nop
	set	0x7D, %l2
	lduba	[%l7 + %l2] 0x80,	%o0
	fmovsleu	%icc,	%f12,	%f3
	tgu	%xcc,	0x5
	edge16ln	%i5,	%i2,	%i6
	tneg	%xcc,	0x3
	movl	%icc,	%i0,	%g1
	bn,pt	%xcc,	loop_2282
	sdivcc	%g3,	0x17C0,	%o2
	set	0x26, %o4
	ldsba	[%l7 + %o4] 0x11,	%o7
loop_2282:
	nop
	setx	0x32EDD2230D0B60FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f0
	fbn,a	%fcc1,	loop_2283
	fornot1	%f26,	%f10,	%f4
	brnz	%l6,	loop_2284
	taddcctv	%l3,	%i1,	%g2
loop_2283:
	stbar
	movleu	%xcc,	%i7,	%o5
loop_2284:
	nop
	set	0x0C, %o7
	ldsha	[%l7 + %o7] 0x0c,	%g6
	bvs,pn	%xcc,	loop_2285
	fands	%f6,	%f29,	%f10
	alignaddr	%l2,	%l4,	%i4
	alignaddrl	%o6,	%i3,	%o4
loop_2285:
	movcc	%icc,	%o1,	%l0
	xnorcc	%l1,	%g5,	%o3
	smul	%l5,	0x1A10,	%g4
	taddcctv	%g7,	%i5,	%o0
	fmovsneg	%icc,	%f1,	%f10
	fbuge,a	%fcc3,	loop_2286
	bvc,a	%xcc,	loop_2287
	ble,a,pt	%xcc,	loop_2288
	array8	%i6,	%i0,	%i2
loop_2286:
	membar	0x0E
loop_2287:
	fmovrsne	%g3,	%f27,	%f9
loop_2288:
	fbg,a	%fcc2,	loop_2289
	edge16ln	%o2,	%o7,	%g1
	umulcc	%l3,	%l6,	%i1
	nop
	setx	0xD2EDD7D7F05D6045,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA18818021DF33CE4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f16,	%f4
loop_2289:
	nop
	setx	0x10ABA6A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f2
	and	%i7,	0x0AE1,	%g2
	movrgz	%g6,	0x262,	%o5
	movneg	%xcc,	%l4,	%l2
	ldsh	[%l7 + 0x2C],	%i4
	fmovsne	%icc,	%f4,	%f4
	edge32l	%i3,	%o6,	%o1
	wr	%g0,	0x80,	%asi
	stha	%o4,	[%l7 + 0x36] %asi
	movvs	%xcc,	%l0,	%g5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0F] %asi,	%l1
	orncc	%o3,	%g4,	%l5
	edge32n	%i5,	%g7,	%i6
	tsubcctv	%i0,	0x093A,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f31,	%f0
	xorcc	%g3,	0x0A24,	%o2
	bneg,a,pn	%icc,	loop_2290
	fbug,a	%fcc1,	loop_2291
	mulscc	%o0,	0x07D1,	%g1
	srl	%l3,	0x0A,	%o7
loop_2290:
	taddcc	%l6,	0x07DC,	%i1
loop_2291:
	fpsub16	%f22,	%f24,	%f22
	addcc	%i7,	%g2,	%g6
	taddcc	%o5,	0x18FA,	%l2
	tsubcc	%i4,	0x0031,	%l4
	te	%icc,	0x6
	fmovsgu	%xcc,	%f3,	%f9
	move	%icc,	%i3,	%o1
	fsrc2	%f24,	%f10
	fbuge,a	%fcc3,	loop_2292
	sdiv	%o4,	0x00CA,	%o6
	fbue	%fcc0,	loop_2293
	fcmpeq16	%f4,	%f12,	%g5
loop_2292:
	movrne	%l0,	%o3,	%g4
	movle	%icc,	%l1,	%i5
loop_2293:
	edge8	%g7,	%l5,	%i6
	fnegd	%f14,	%f22
	xor	%i0,	0x1ADC,	%g3
	fpadd16	%f26,	%f0,	%f16
	movrgez	%o2,	%o0,	%i2
	tsubcctv	%g1,	%o7,	%l6
	edge32ln	%i1,	%l3,	%i7
	or	%g2,	%g6,	%o5
	xnorcc	%l2,	0x0177,	%i4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x34] %asi,	%f31
	edge8l	%i3,	%l4,	%o4
	array32	%o1,	%o6,	%l0
	movre	%g5,	0x022,	%o3
	ta	%icc,	0x5
	and	%g4,	0x0458,	%l1
	taddcc	%g7,	%l5,	%i6
	set	0x70, %g3
	sta	%f30,	[%l7 + %g3] 0x10
	fblg	%fcc0,	loop_2294
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i0,	%g3
	swap	[%l7 + 0x78],	%o2
loop_2294:
	brgez	%o0,	loop_2295
	fxors	%f14,	%f27,	%f31
	set	0x64, %i1
	stha	%i2,	[%l7 + %i1] 0x89
loop_2295:
	bleu,a,pt	%icc,	loop_2296
	tcs	%xcc,	0x0
	fpsub32s	%f12,	%f9,	%f0
	fmovrdgz	%g1,	%f6,	%f26
loop_2296:
	fbuge	%fcc2,	loop_2297
	edge16l	%i5,	%o7,	%l6
	brgez	%l3,	loop_2298
	fbo,a	%fcc3,	loop_2299
loop_2297:
	sir	0x1816
	edge16l	%i1,	%i7,	%g2
loop_2298:
	bleu,a,pt	%xcc,	loop_2300
loop_2299:
	fbug,a	%fcc3,	loop_2301
	tcc	%xcc,	0x4
	movrlz	%g6,	0x39B,	%l2
loop_2300:
	sra	%i4,	0x05,	%i3
loop_2301:
	andn	%l4,	0x0346,	%o4
	set	0x38, %g6
	stxa	%o1,	[%l7 + %g6] 0x2a
	membar	#Sync
	sir	0x073F
	orcc	%o5,	0x1FFF,	%l0
	nop
	setx	loop_2302,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stbar
	fpack16	%f18,	%f13
	orncc	%g5,	0x05A1,	%o6
loop_2302:
	sir	0x01A2
	ldub	[%l7 + 0x75],	%g4
	movvs	%icc,	%o3,	%g7
	mova	%icc,	%l1,	%i6
	movn	%icc,	%l5,	%i0
	edge8n	%g3,	%o2,	%o0
	edge8	%i2,	%g1,	%i5
	alignaddr	%o7,	%l6,	%i1
	movrlz	%i7,	0x0B5,	%g2
	set	0x74, %o6
	ldsba	[%l7 + %o6] 0x18,	%g6
	fbul,a	%fcc2,	loop_2303
	nop
	fitod	%f6,	%f8
	fdtos	%f8,	%f8
	umul	%l3,	%i4,	%l2
	movrne	%i3,	0x287,	%l4
loop_2303:
	brz	%o4,	loop_2304
	mova	%xcc,	%o1,	%l0
	movvc	%xcc,	%g5,	%o6
	ldub	[%l7 + 0x3D],	%o5
loop_2304:
	popc	%o3,	%g4
	st	%f3,	[%l7 + 0x64]
	xor	%l1,	0x08BB,	%g7
	mulx	%i6,	%i0,	%l5
	prefetch	[%l7 + 0x48],	 0x2
	movg	%xcc,	%g3,	%o2
	srl	%i2,	%o0,	%g1
	edge8	%i5,	%o7,	%i1
	movn	%xcc,	%i7,	%g2
	edge32l	%g6,	%l6,	%l3
	fmovrde	%l2,	%f2,	%f24
	nop
	setx	0xE7C93E693FBB6BCC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF2A539333626FA92,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f30,	%f0
	set	0x30, %i5
	ldda	[%l7 + %i5] 0x2e,	%i2
	umul	%l4,	0x06EA,	%i4
	fbg	%fcc0,	loop_2305
	fbg,a	%fcc3,	loop_2306
	srax	%o4,	%l0,	%g5
	tg	%icc,	0x1
loop_2305:
	orcc	%o6,	0x1BE0,	%o1
loop_2306:
	fmovrdgz	%o3,	%f22,	%f26
	fbule,a	%fcc3,	loop_2307
	swap	[%l7 + 0x54],	%o5
	udiv	%l1,	0x0965,	%g7
	addc	%i6,	0x0993,	%i0
loop_2307:
	orn	%l5,	%g4,	%o2
	stx	%g3,	[%l7 + 0x50]
	edge32l	%i2,	%g1,	%o0
	sdivx	%i5,	0x1947,	%i1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%g2
	set	0x60, %i6
	ldswa	[%l7 + %i6] 0x19,	%o7
	nop
	setx	loop_2308,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%l6,	0x1498,	%g6
	edge32l	%l2,	%i3,	%l3
	edge16	%l4,	%i4,	%l0
loop_2308:
	fnot2	%f2,	%f22
	udivx	%g5,	0x1B96,	%o6
	stb	%o1,	[%l7 + 0x6D]
	set	0x1A, %o1
	lduba	[%l7 + %o1] 0x15,	%o3
	tleu	%icc,	0x6
	nop
	setx	loop_2309,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge,pt	%xcc,	loop_2310
	tne	%icc,	0x1
	sll	%o5,	%o4,	%g7
loop_2309:
	fcmple16	%f12,	%f20,	%l1
loop_2310:
	edge16l	%i0,	%l5,	%g4
	tpos	%icc,	0x0
	fors	%f5,	%f3,	%f3
	fpsub16	%f10,	%f22,	%f8
	tg	%icc,	0x6
	fpadd32	%f18,	%f14,	%f10
	movrlez	%i6,	0x26F,	%g3
	andncc	%o2,	%i2,	%g1
	sdiv	%i5,	0x0A01,	%o0
	fpsub32	%f12,	%f28,	%f26
	for	%f30,	%f22,	%f30
	orn	%i1,	%g2,	%i7
	fmovdn	%xcc,	%f5,	%f15
	fzero	%f30
	srl	%o7,	%g6,	%l6
	movle	%xcc,	%l2,	%i3
	tle	%icc,	0x4
	tg	%xcc,	0x0
	nop
	fitos	%f1,	%f29
	fstox	%f29,	%f8
	fxtos	%f8,	%f21
	addc	%l3,	%l4,	%i4
	fxors	%f26,	%f20,	%f0
	array32	%l0,	%o6,	%g5
	smul	%o3,	0x10A1,	%o5
	ldx	[%l7 + 0x30],	%o1
	udivcc	%g7,	0x01F5,	%o4
	movcc	%icc,	%l1,	%l5
	stx	%i0,	[%l7 + 0x20]
	tne	%xcc,	0x6
	sll	%i6,	%g4,	%o2
	srl	%i2,	%g3,	%g1
	fcmple16	%f6,	%f16,	%o0
	srl	%i5,	0x1E,	%g2
	fpadd16	%f26,	%f14,	%f18
	edge16ln	%i1,	%o7,	%g6
	or	%i7,	0x040A,	%l2
	bcc,pt	%icc,	loop_2311
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l6,	%l3,	%l4
	fmovdleu	%xcc,	%f0,	%f29
loop_2311:
	fmovdn	%icc,	%f30,	%f26
	alignaddr	%i4,	%l0,	%o6
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x44] %asi,	%f18
	be	loop_2312
	bvs,a,pt	%xcc,	loop_2313
	ble,a,pn	%xcc,	loop_2314
	call	loop_2315
loop_2312:
	tle	%icc,	0x4
loop_2313:
	srl	%i3,	%o3,	%o5
loop_2314:
	fpadd32	%f0,	%f22,	%f26
loop_2315:
	brgez,a	%o1,	loop_2316
	tg	%xcc,	0x0
	addc	%g5,	0x1115,	%o4
	alignaddrl	%g7,	%l5,	%i0
loop_2316:
	tcs	%xcc,	0x0
	andcc	%i6,	0x0C9E,	%g4
	edge32	%o2,	%i2,	%l1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g3
	fexpand	%f24,	%f18
	edge8n	%g1,	%i5,	%o0
	tl	%xcc,	0x3
	ta	%icc,	0x5
	brz,a	%g2,	loop_2317
	movn	%icc,	%o7,	%g6
	movrgz	%i1,	%i7,	%l2
	edge16n	%l6,	%l4,	%i4
loop_2317:
	swap	[%l7 + 0x58],	%l3
	and	%l0,	%i3,	%o6
	fpack32	%f18,	%f16,	%f10
	array32	%o3,	%o1,	%o5
	movl	%icc,	%o4,	%g5
	mulx	%g7,	%l5,	%i6
	set	0x1E, %o0
	lduha	[%l7 + %o0] 0x11,	%g4
	movrgez	%i0,	0x18D,	%i2
	tg	%icc,	0x6
	set	0x1C, %g5
	lda	[%l7 + %g5] 0x15,	%f14
	addc	%l1,	0x0B75,	%g3
	tcs	%xcc,	0x4
	fpsub16s	%f8,	%f17,	%f25
	fmovde	%icc,	%f29,	%f22
	mulx	%o2,	0x18D3,	%i5
	nop
	set	0x18, %l5
	stw	%o0,	[%l7 + %l5]
	xnorcc	%g2,	%g1,	%g6
	sllx	%i1,	0x16,	%i7
	edge8ln	%l2,	%l6,	%l4
	sll	%o7,	%l3,	%i4
	andn	%i3,	0x02A8,	%l0
	array16	%o6,	%o1,	%o3
	fmovrdlez	%o4,	%f18,	%f22
	movn	%icc,	%o5,	%g5
	fmovsleu	%icc,	%f2,	%f8
	movvc	%icc,	%l5,	%i6
	tvs	%xcc,	0x7
	edge8l	%g7,	%i0,	%g4
	smulcc	%l1,	0x0439,	%g3
	sllx	%o2,	%i5,	%o0
	fpsub32	%f16,	%f8,	%f4
	ldd	[%l7 + 0x78],	%f4
	fnegs	%f2,	%f28
	array32	%i2,	%g2,	%g6
	movleu	%icc,	%g1,	%i7
	fbule	%fcc0,	loop_2318
	tne	%icc,	0x2
	bl,a,pn	%icc,	loop_2319
	fmovdn	%xcc,	%f12,	%f30
loop_2318:
	movle	%xcc,	%l2,	%i1
	brnz,a	%l6,	loop_2320
loop_2319:
	stbar
	sir	0x135C
	movle	%xcc,	%o7,	%l3
loop_2320:
	fmuld8ulx16	%f17,	%f17,	%f0
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x1B] %asi,	%l4
	bcc,a,pn	%xcc,	loop_2321
	lduw	[%l7 + 0x68],	%i4
	tvc	%xcc,	0x3
	sll	%l0,	0x03,	%o6
loop_2321:
	for	%f16,	%f2,	%f22
	add	%i3,	%o3,	%o1
	mova	%xcc,	%o5,	%g5
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x81,	 0x1
	move	%icc,	%l5,	%g7
	edge8l	%i6,	%i0,	%l1
	fmovdge	%icc,	%f3,	%f31
	taddcc	%g4,	%g3,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i5,	%o0,	%i2
	srl	%g6,	%g2,	%i7
	stx	%g1,	[%l7 + 0x38]
	fnot1s	%f17,	%f19
	fornot2s	%f1,	%f7,	%f22
	array32	%i1,	%l2,	%l6
	edge32n	%o7,	%l3,	%i4
	fmovsg	%xcc,	%f29,	%f21
	sir	0x112A
	bneg	loop_2322
	umulcc	%l0,	%l4,	%i3
	taddcc	%o6,	0x0751,	%o3
	sub	%o5,	0x099A,	%o1
loop_2322:
	bn,a,pn	%xcc,	loop_2323
	movne	%icc,	%g5,	%l5
	or	%g7,	%o4,	%i0
	tg	%icc,	0x6
loop_2323:
	fmovdg	%icc,	%f11,	%f18
	addccc	%i6,	%g4,	%g3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%i5
	alignaddr	%o0,	%l1,	%g6
	wr	%g0,	0x23,	%asi
	stxa	%i2,	[%l7 + 0x70] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%i7,	%g1
	edge32n	%g2,	%i1,	%l6
	movcs	%xcc,	%o7,	%l3
	set	0x18, %g4
	sta	%f11,	[%l7 + %g4] 0x19
	brgz,a	%l2,	loop_2324
	srax	%i4,	0x1D,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%i3
loop_2324:
	fbge,a	%fcc0,	loop_2325
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f10,	%f18,	%f28
	movgu	%icc,	%o6,	%o3
loop_2325:
	nop
	setx	0xA5E1220B6064F6D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	stbar
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x70] %asi,	%o1
	fbo,a	%fcc2,	loop_2326
	smul	%g5,	0x0D0C,	%o5
	tleu	%xcc,	0x1
	movrlz	%l5,	0x258,	%g7
loop_2326:
	nop
	setx	0x084B439310492112,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	te	%icc,	0x4
	umulcc	%i0,	0x1BC9,	%o4
	fcmple16	%f12,	%f14,	%i6
	tneg	%xcc,	0x1
	movneg	%icc,	%g4,	%g3
	tle	%xcc,	0x3
	array8	%o2,	%i5,	%l1
	edge16n	%o0,	%i2,	%g6
	fmovrslez	%g1,	%f21,	%f7
	fmovsle	%xcc,	%f0,	%f20
	sir	0x1215
	sth	%i7,	[%l7 + 0x2E]
	wr	%g0,	0x80,	%asi
	stxa	%g2,	[%l7 + 0x18] %asi
	edge16ln	%l6,	%o7,	%l3
	tpos	%icc,	0x4
	fxors	%f22,	%f11,	%f0
	fcmpgt32	%f4,	%f2,	%l2
	bn,pt	%icc,	loop_2327
	sdivcc	%i4,	0x1498,	%i1
	orncc	%l4,	0x0E92,	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%o3
loop_2327:
	fpadd16	%f0,	%f14,	%f10
	fpsub16s	%f12,	%f0,	%f26
	brnz,a	%o1,	loop_2328
	fexpand	%f4,	%f14
	prefetch	[%l7 + 0x3C],	 0x3
	sdivcc	%g5,	0x1948,	%o5
loop_2328:
	bne,a	%icc,	loop_2329
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f30
	fxtod	%f30,	%f20
	fbg	%fcc1,	loop_2330
	nop
	setx	0x9DBA6499,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x66266720,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f13,	%f5
loop_2329:
	smulcc	%l5,	0x1279,	%o6
	andn	%i0,	0x0469,	%g7
loop_2330:
	movrlz	%o4,	%g4,	%i6
	movleu	%xcc,	%g3,	%o2
	orcc	%l1,	%i5,	%o0
	fpadd16s	%f6,	%f14,	%f4
	set	0x7C, %i2
	stwa	%i2,	[%l7 + %i2] 0x0c
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%i7
	sdiv	%g6,	0x0880,	%g2
	bcc,pt	%icc,	loop_2331
	addc	%l6,	%l3,	%l2
	tvc	%icc,	0x7
	ta	%xcc,	0x1
loop_2331:
	or	%i4,	%o7,	%l4
	fpsub32s	%f15,	%f16,	%f6
	movge	%icc,	%i1,	%i3
	sdivx	%l0,	0x13F8,	%o1
	set	0x50, %g1
	ldda	[%l7 + %g1] 0x04,	%g4
	fmovdle	%xcc,	%f7,	%f22
	udivcc	%o5,	0x02C0,	%o3
	fmovdl	%xcc,	%f1,	%f22
	tl	%xcc,	0x7
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0xf1
	membar	#Sync
	fpsub16s	%f29,	%f17,	%f18
	fbe	%fcc1,	loop_2332
	mulscc	%o6,	0x0812,	%i0
	brlz,a	%l5,	loop_2333
	subc	%o4,	0x0DB4,	%g7
loop_2332:
	nop
	setx	0x5AC0CFCA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x2FFF4E49,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f17,	%f30
	ldsh	[%l7 + 0x32],	%i6
loop_2333:
	brlz	%g4,	loop_2334
	udivx	%o2,	0x1B1C,	%g3
	fbug	%fcc1,	loop_2335
	and	%i5,	%l1,	%i2
loop_2334:
	bgu	%icc,	loop_2336
	umul	%g1,	%o0,	%g6
loop_2335:
	fbug	%fcc3,	loop_2337
	mulx	%i7,	0x0433,	%g2
loop_2336:
	array16	%l6,	%l3,	%i4
	udiv	%l2,	0x07BF,	%l4
loop_2337:
	fones	%f30
	set	0x48, %o5
	prefetcha	[%l7 + %o5] 0x19,	 0x2
	edge8n	%o7,	%l0,	%i3
	umulcc	%g5,	%o5,	%o1
	fnands	%f13,	%f5,	%f21
	srlx	%o3,	%o6,	%l5
	tcc	%xcc,	0x3
	edge16l	%o4,	%g7,	%i6
	nop
	setx	loop_2338,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%g4,	%o2,	%g3
	sdiv	%i5,	0x16CD,	%i0
	or	%i2,	%l1,	%o0
loop_2338:
	tsubcctv	%g6,	%i7,	%g2
	fcmple16	%f16,	%f28,	%l6
	udiv	%l3,	0x0924,	%g1
	tgu	%xcc,	0x6
	sdivx	%i4,	0x08D9,	%l4
	fxor	%f8,	%f10,	%f6
	fbu,a	%fcc0,	loop_2339
	subcc	%i1,	%o7,	%l0
	fzeros	%f22
	fmovspos	%xcc,	%f21,	%f18
loop_2339:
	fcmple32	%f30,	%f20,	%i3
	movvc	%xcc,	%g5,	%o5
	fxnors	%f27,	%f14,	%f15
	fbg,a	%fcc3,	loop_2340
	fmovscs	%icc,	%f13,	%f22
	mova	%icc,	%o1,	%l2
	wr	%g0,	0x18,	%asi
	stha	%o3,	[%l7 + 0x5A] %asi
loop_2340:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x21] %asi,	%o6
	movpos	%xcc,	%o4,	%g7
	fble	%fcc3,	loop_2341
	ldsb	[%l7 + 0x39],	%l5
	movrne	%g4,	0x1B9,	%o2
	bshuffle	%f10,	%f30,	%f16
loop_2341:
	tpos	%xcc,	0x7
	membar	0x2F
	andncc	%g3,	%i5,	%i0
	bcs	loop_2342
	fsrc2	%f20,	%f18
	or	%i6,	%l1,	%i2
	tle	%icc,	0x7
loop_2342:
	fmovdne	%icc,	%f25,	%f15
	fnands	%f30,	%f29,	%f22
	bvs,pt	%icc,	loop_2343
	movleu	%xcc,	%g6,	%i7
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f22
	fxtos	%f22,	%f8
	srlx	%o0,	%l6,	%l3
loop_2343:
	array16	%g2,	%i4,	%l4
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	fmovdle	%icc,	%f3,	%f23
	edge8ln	%o7,	%g1,	%i3
	tcs	%xcc,	0x2
	subccc	%l0,	0x1B85,	%g5
	bn,pn	%xcc,	loop_2344
	fbo	%fcc0,	loop_2345
	tcc	%xcc,	0x2
	alignaddrl	%o5,	%l2,	%o1
loop_2344:
	fxnors	%f10,	%f16,	%f8
loop_2345:
	tneg	%xcc,	0x2
	lduw	[%l7 + 0x0C],	%o3
	sir	0x1DF4
	te	%xcc,	0x5
	fbne	%fcc2,	loop_2346
	stb	%o6,	[%l7 + 0x7B]
	movl	%icc,	%o4,	%l5
	tg	%icc,	0x6
loop_2346:
	brgz,a	%g4,	loop_2347
	fmovdleu	%xcc,	%f11,	%f7
	movle	%xcc,	%o2,	%g3
	tvc	%icc,	0x3
loop_2347:
	add	%i5,	0x0F54,	%g7
	fand	%f28,	%f18,	%f14
	fba,a	%fcc2,	loop_2348
	ldd	[%l7 + 0x58],	%i6
	bg,a,pn	%icc,	loop_2349
	movre	%i0,	%i2,	%l1
loop_2348:
	tsubcc	%i7,	%g6,	%o0
	edge32ln	%l6,	%l3,	%i4
loop_2349:
	swap	[%l7 + 0x68],	%g2
	fnand	%f2,	%f26,	%f16
	brz,a	%l4,	loop_2350
	bgu	%icc,	loop_2351
	movre	%i1,	0x133,	%o7
	tneg	%icc,	0x2
loop_2350:
	nop
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x10
loop_2351:
	movre	%g1,	0x260,	%i3
	orn	%g5,	%o5,	%l0
	fbo,a	%fcc0,	loop_2352
	fmul8sux16	%f16,	%f0,	%f30
	brgez	%l2,	loop_2353
	xnorcc	%o3,	0x1504,	%o1
loop_2352:
	ld	[%l7 + 0x08],	%f0
	st	%f10,	[%l7 + 0x14]
loop_2353:
	xor	%o6,	%l5,	%g4
	tpos	%icc,	0x2
	edge32l	%o2,	%o4,	%i5
	tn	%xcc,	0x1
	fabsd	%f2,	%f8
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%g3
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x68] %asi,	%i0
	srax	%i6,	%i2,	%l1
	array32	%g6,	%o0,	%l6
	xorcc	%i7,	%l3,	%i4
	fmovspos	%icc,	%f25,	%f0
	prefetch	[%l7 + 0x50],	 0x2
	edge32ln	%g2,	%l4,	%o7
	popc	%i1,	%i3
	nop
	setx	0xF07C752B,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fmovd	%f16,	%f6
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f6
	fxtod	%f6,	%f10
	nop
	fitos	%f8,	%f25
	fstox	%f25,	%f8
	movgu	%icc,	%g1,	%o5
	ldsw	[%l7 + 0x2C],	%l0
	bvs,pn	%xcc,	loop_2354
	ld	[%l7 + 0x24],	%f11
	tneg	%icc,	0x3
	tl	%xcc,	0x4
loop_2354:
	movcs	%xcc,	%g5,	%l2
	edge16n	%o1,	%o6,	%l5
	movl	%icc,	%g4,	%o3
	tne	%icc,	0x0
	nop
	setx	0x1101AB31FD508B5E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xA9FBC1DC7CA1F61C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f22,	%f0
	andn	%o4,	0x037F,	%o2
	st	%f25,	[%l7 + 0x18]
	bl	loop_2355
	ba	%icc,	loop_2356
	orncc	%i5,	%g7,	%g3
	nop
	setx	loop_2357,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2355:
	array8	%i6,	%i2,	%i0
loop_2356:
	sdivcc	%g6,	0x0A03,	%o0
	tvs	%icc,	0x2
loop_2357:
	fblg,a	%fcc2,	loop_2358
	subccc	%l1,	0x0917,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x7C] %asi,	%f14
loop_2358:
	movvc	%xcc,	%i7,	%i4
	fmovda	%icc,	%f12,	%f25
	fbue,a	%fcc1,	loop_2359
	nop
	fitod	%f12,	%f24
	fdtox	%f24,	%f22
	lduh	[%l7 + 0x7A],	%g2
	orcc	%l3,	%o7,	%i1
loop_2359:
	mova	%icc,	%i3,	%l4
	nop
	setx	0x0BD3DB454A239EDB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xC3E802E67E0A1CC3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f6,	%f12
	umulcc	%g1,	%l0,	%g5
	fbg	%fcc0,	loop_2360
	fmovdl	%xcc,	%f6,	%f10
	umul	%l2,	%o1,	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%l5,	%g4
loop_2360:
	nop
	fitos	%f3,	%f25
	fstox	%f25,	%f16
	fmovse	%xcc,	%f26,	%f26
	addcc	%o3,	0x0728,	%o4
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o2
	ld	[%l7 + 0x40],	%f13
	array8	%o6,	%g7,	%i5
	sra	%i6,	%g3,	%i2
	nop
	setx	0x4797F6F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xB8AB7398,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f13,	%f7
	edge8ln	%g6,	%i0,	%o0
	tneg	%xcc,	0x1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l1,	%i7
	tvs	%xcc,	0x0
	movg	%xcc,	%i4,	%g2
	edge16	%l6,	%o7,	%l3
	movvs	%icc,	%i1,	%l4
	ldd	[%l7 + 0x58],	%i2
	ld	[%l7 + 0x34],	%f13
	fmovsne	%xcc,	%f26,	%f13
	fmovdpos	%icc,	%f15,	%f23
	bshuffle	%f26,	%f2,	%f20
	array32	%g1,	%g5,	%l0
	tsubcc	%l2,	%o1,	%l5
	movrlz	%g4,	%o3,	%o5
	fmovsa	%xcc,	%f29,	%f23
	movl	%xcc,	%o2,	%o6
	fbul,a	%fcc1,	loop_2361
	movrgez	%g7,	%i5,	%i6
	fpadd16s	%f20,	%f25,	%f11
	udiv	%g3,	0x067F,	%i2
loop_2361:
	andncc	%o4,	%g6,	%o0
	fabsd	%f22,	%f20
	tcs	%xcc,	0x7
	popc	%i0,	%i7
	movcc	%icc,	%i4,	%g2
	movrlez	%l1,	%l6,	%o7
	array16	%i1,	%l3,	%i3
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x67] %asi,	%l4
	sdivx	%g1,	0x0B52,	%l0
	ble,a,pn	%xcc,	loop_2362
	fmovrdgz	%g5,	%f20,	%f12
	movcc	%icc,	%o1,	%l2
	andcc	%g4,	%o3,	%o5
loop_2362:
	fmuld8ulx16	%f10,	%f19,	%f28
	fnot1s	%f30,	%f6
	tneg	%icc,	0x0
	fandnot2s	%f7,	%f0,	%f7
	sllx	%l5,	0x02,	%o2
	popc	0x1717,	%g7
	sra	%o6,	0x1A,	%i6
	edge16n	%i5,	%g3,	%i2
	subcc	%g6,	%o4,	%i0
	brlez,a	%o0,	loop_2363
	nop
	fitod	%f10,	%f2
	fdtoi	%f2,	%f2
	tsubcctv	%i7,	0x0668,	%i4
	addc	%l1,	%l6,	%g2
loop_2363:
	tneg	%xcc,	0x7
	fand	%f2,	%f26,	%f20
	tneg	%xcc,	0x0
	movrgz	%o7,	0x033,	%l3
	fblg,a	%fcc0,	loop_2364
	subc	%i3,	0x0088,	%l4
	movle	%xcc,	%g1,	%l0
	movrlz	%g5,	%i1,	%l2
loop_2364:
	nop
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x10] %asi,	%o0
	edge32l	%o3,	%g4,	%o5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%o2
	stbar
	edge16n	%l5,	%o6,	%g7
	fmovrde	%i5,	%f10,	%f20
	sir	0x0683
	fnor	%f8,	%f8,	%f10
	fpadd16	%f16,	%f4,	%f8
	tsubcc	%g3,	0x02BF,	%i6
	wr	%g0,	0x2b,	%asi
	stha	%i2,	[%l7 + 0x5E] %asi
	membar	#Sync
	fnors	%f26,	%f21,	%f24
	orncc	%o4,	0x1CF3,	%i0
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%g6
	srax	%o0,	%i4,	%l1
	bneg,a	loop_2365
	edge8n	%l6,	%g2,	%i7
	andcc	%l3,	0x0138,	%o7
	tne	%xcc,	0x5
loop_2365:
	tvc	%icc,	0x0
	addcc	%l4,	0x0DDC,	%g1
	udivx	%l0,	0x0F46,	%g5
	andn	%i3,	0x182D,	%l2
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f8
	stx	%i1,	[%l7 + 0x48]
	movcc	%xcc,	%o3,	%o1
	array8	%o5,	%o2,	%g4
	ldd	[%l7 + 0x68],	%f8
	xorcc	%o6,	0x0D17,	%g7
	fnot1s	%f11,	%f30
	fsrc1	%f22,	%f22
	xnor	%i5,	0x0FFE,	%g3
	fandnot1s	%f7,	%f4,	%f1
	fmovrdgz	%l5,	%f20,	%f18
	sdivx	%i6,	0x0463,	%i2
	popc	0x0BC0,	%i0
	udivcc	%o4,	0x0EB9,	%o0
	nop
	fitos	%f8,	%f27
	fstoi	%f27,	%f17
	movcs	%xcc,	%g6,	%i4
	edge16ln	%l1,	%l6,	%i7
	taddcctv	%l3,	%g2,	%l4
	fxnors	%f8,	%f5,	%f14
	movrne	%o7,	0x076,	%g1
	fmovrdlez	%g5,	%f18,	%f8
	fbug,a	%fcc2,	loop_2366
	popc	0x1B03,	%l0
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x26] %asi,	%i3
loop_2366:
	te	%xcc,	0x7
	umulcc	%i1,	0x1EFE,	%o3
	xorcc	%l2,	%o5,	%o1
	sdiv	%o2,	0x028E,	%o6
	edge16ln	%g4,	%i5,	%g3
	fnand	%f16,	%f0,	%f10
	fba	%fcc1,	loop_2367
	tleu	%icc,	0x3
	nop
	setx	0xA0793F66,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fmovde	%xcc,	%f28,	%f17
loop_2367:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x7C] %asi,	%f18
	tvs	%icc,	0x2
	edge16l	%g7,	%l5,	%i6
	movrgz	%i0,	%i2,	%o4
	stb	%o0,	[%l7 + 0x1E]
	ldd	[%l7 + 0x10],	%f28
	xnorcc	%i4,	0x118B,	%l1
	fbl	%fcc3,	loop_2368
	lduw	[%l7 + 0x14],	%g6
	ldsb	[%l7 + 0x43],	%i7
	movrlez	%l3,	%l6,	%g2
loop_2368:
	fmovrslez	%o7,	%f28,	%f20
	fbg	%fcc1,	loop_2369
	movg	%icc,	%l4,	%g1
	set	0x54, %i0
	lda	[%l7 + %i0] 0x88,	%f30
loop_2369:
	nop
	fitos	%f10,	%f15
	fstox	%f15,	%f16
	fxtos	%f16,	%f20
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%i3
	taddcc	%l0,	%i1,	%o3
	nop
	fitod	%f23,	%f28
	movge	%xcc,	%o5,	%l2
	fmovrsne	%o2,	%f11,	%f12
	alignaddrl	%o6,	%g4,	%o1
	fpadd32	%f4,	%f10,	%f4
	sir	0x0F18
	ldd	[%l7 + 0x48],	%f4
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x88,	%f0
	movg	%xcc,	%i5,	%g7
	movle	%xcc,	%l5,	%g3
	smulcc	%i0,	%i6,	%o4
	edge32	%o0,	%i2,	%l1
	fbug,a	%fcc3,	loop_2370
	edge8	%i4,	%i7,	%l3
	edge8l	%g6,	%l6,	%g2
	sra	%o7,	0x15,	%g1
loop_2370:
	taddcc	%g5,	%l4,	%l0
	edge16	%i3,	%o3,	%i1
	edge32ln	%l2,	%o5,	%o6
	tsubcc	%g4,	0x0704,	%o2
	nop
	setx	0x8F7F1A35,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xEFDA7CCF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f30,	%f0
	andn	%i5,	%g7,	%l5
	movvs	%xcc,	%o1,	%g3
	set	0x34, %i7
	sta	%f7,	[%l7 + %i7] 0x04
	array32	%i6,	%o4,	%i0
	wr	%g0,	0x81,	%asi
	stwa	%i2,	[%l7 + 0x5C] %asi
	andncc	%o0,	%l1,	%i4
	sra	%l3,	%g6,	%i7
	fnor	%f24,	%f14,	%f16
	tcs	%icc,	0x2
	xnor	%g2,	%l6,	%o7
	ldd	[%l7 + 0x30],	%f28
	taddcctv	%g5,	0x09DC,	%l4
	fornot2	%f24,	%f4,	%f10
	fpack32	%f14,	%f12,	%f16
	fand	%f6,	%f6,	%f10
	te	%xcc,	0x3
	xor	%l0,	%g1,	%i3
	edge32l	%i1,	%l2,	%o3
	tcs	%icc,	0x0
	wr	%g0,	0x27,	%asi
	stha	%o5,	[%l7 + 0x48] %asi
	membar	#Sync
	smulcc	%g4,	0x072D,	%o2
	tg	%xcc,	0x7
	taddcc	%i5,	0x02BB,	%g7
	srax	%l5,	0x0F,	%o6
	movn	%icc,	%o1,	%g3
	xor	%i6,	%o4,	%i2
	brlez	%o0,	loop_2371
	movgu	%icc,	%l1,	%i4
	movrne	%l3,	0x1D4,	%i0
	movneg	%icc,	%g6,	%g2
loop_2371:
	nop
	set	0x30, %l3
	lduba	[%l7 + %l3] 0x88,	%l6
	taddcctv	%i7,	0x0A77,	%o7
	movle	%icc,	%g5,	%l0
	alignaddrl	%g1,	%i3,	%l4
	fbge	%fcc0,	loop_2372
	movrne	%l2,	%i1,	%o3
	ta	%icc,	0x7
	smulcc	%g4,	%o2,	%i5
loop_2372:
	ldd	[%l7 + 0x68],	%f2
	fandnot2s	%f20,	%f14,	%f9
	fmul8x16au	%f26,	%f27,	%f18
	fone	%f0
	movrlz	%o5,	%l5,	%o6
	nop
	setx loop_2373, %l0, %l1
	jmpl %l1, %g7
	tsubcctv	%o1,	%i6,	%o4
	tg	%icc,	0x2
	andncc	%i2,	%g3,	%o0
loop_2373:
	nop
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x80,	%f16
	movrne	%l1,	%i4,	%l3
	array8	%i0,	%g2,	%g6
	fble	%fcc3,	loop_2374
	movneg	%icc,	%i7,	%o7
	orn	%g5,	%l6,	%l0
	tvs	%icc,	0x3
loop_2374:
	call	loop_2375
	for	%f16,	%f28,	%f12
	alignaddrl	%i3,	%g1,	%l4
	sdiv	%i1,	0x06C2,	%l2
loop_2375:
	movre	%g4,	%o3,	%o2
	fpadd32	%f18,	%f2,	%f26
	srl	%o5,	0x12,	%i5
	addccc	%o6,	%g7,	%o1
	fcmpne32	%f26,	%f16,	%l5
	movge	%icc,	%o4,	%i2
	movrne	%i6,	0x12A,	%g3
	membar	0x51
	movl	%icc,	%o0,	%l1
	sethi	0x0459,	%i4
	bl	%icc,	loop_2376
	sllx	%i0,	0x0E,	%l3
	and	%g6,	0x11F3,	%i7
	fmovsle	%icc,	%f21,	%f20
loop_2376:
	movvs	%icc,	%g2,	%o7
	edge32l	%g5,	%l6,	%l0
	tl	%icc,	0x7
	movrgez	%i3,	0x265,	%l4
	tvs	%icc,	0x7
	movneg	%xcc,	%g1,	%l2
	xnorcc	%i1,	%o3,	%g4
	edge32l	%o2,	%i5,	%o6
	sdivcc	%o5,	0x1297,	%o1
	or	%g7,	0x1616,	%o4
	fpack32	%f28,	%f10,	%f18
	umulcc	%i2,	%i6,	%g3
	taddcc	%o0,	0x0824,	%l5
	fcmpgt16	%f18,	%f20,	%l1
	edge8	%i0,	%i4,	%l3
	tsubcc	%i7,	%g2,	%g6
	tle	%icc,	0x3
	fblg	%fcc2,	loop_2377
	movge	%xcc,	%o7,	%l6
	tl	%icc,	0x3
	set	0x40, %i3
	sta	%f17,	[%l7 + %i3] 0x15
loop_2377:
	brlz,a	%g5,	loop_2378
	nop
	set	0x78, %o2
	prefetch	[%l7 + %o2],	 0x2
	set	0x16, %l0
	stha	%l0,	[%l7 + %l0] 0x81
loop_2378:
	nop
	wr	%g0,	0xe2,	%asi
	stwa	%l4,	[%l7 + 0x1C] %asi
	membar	#Sync
	tcs	%icc,	0x0
	fandnot1	%f6,	%f30,	%f30
	ldsw	[%l7 + 0x68],	%g1
	movvc	%icc,	%l2,	%i1
	popc	%i3,	%g4
	tge	%xcc,	0x7
	fmovsne	%icc,	%f6,	%f22
	ba,a	loop_2379
	brz	%o3,	loop_2380
	fbue	%fcc1,	loop_2381
	move	%xcc,	%o2,	%o6
loop_2379:
	sll	%i5,	%o1,	%o5
loop_2380:
	membar	0x08
loop_2381:
	mulx	%o4,	0x1EDD,	%g7
	xnor	%i2,	0x1941,	%g3
	fcmpgt32	%f10,	%f14,	%i6
	smul	%l5,	%l1,	%i0
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x15,	%i4
	movleu	%xcc,	%l3,	%o0
	sir	0x1146
	fmovdneg	%xcc,	%f31,	%f14
	tpos	%icc,	0x0
	smulcc	%i7,	0x15F9,	%g6
	tne	%xcc,	0x2
	fmovde	%xcc,	%f27,	%f16
	alignaddrl	%g2,	%o7,	%l6
	sethi	0x1CC5,	%g5
	movleu	%xcc,	%l0,	%g1
	nop
	fitos	%f6,	%f13
	fstox	%f13,	%f2
	bcc	loop_2382
	fbu,a	%fcc2,	loop_2383
	xnorcc	%l2,	%l4,	%i3
	fcmpgt16	%f10,	%f30,	%i1
loop_2382:
	nop
	setx	0xCF01616530D428B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x47D46A9C058F2EFB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f22,	%f0
loop_2383:
	srl	%o3,	%g4,	%o6
	add	%i5,	0x0316,	%o2
	brlez	%o5,	loop_2384
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x52] %asi,	%o1
loop_2384:
	nop
	set	0x74, %i4
	lduwa	[%l7 + %i4] 0x89,	%g7
	fsrc2s	%f19,	%f21
	andn	%o4,	%i2,	%g3
	membar	0x58
	tle	%icc,	0x4
	edge32	%l5,	%i6,	%l1
	taddcc	%i0,	%l3,	%o0
	stb	%i7,	[%l7 + 0x78]
	edge16n	%i4,	%g2,	%g6
	edge8ln	%o7,	%l6,	%l0
	stw	%g5,	[%l7 + 0x58]
	fblg	%fcc1,	loop_2385
	ldd	[%l7 + 0x40],	%f14
	srl	%l2,	%g1,	%l4
	sth	%i3,	[%l7 + 0x20]
loop_2385:
	fbl,a	%fcc0,	loop_2386
	smul	%o3,	%i1,	%o6
	udiv	%i5,	0x1DC6,	%g4
	fexpand	%f15,	%f6
loop_2386:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x5F] %asi,	%o5
	and	%o2,	%o1,	%o4
	xnorcc	%i2,	0x0E34,	%g7
	mulx	%g3,	0x1CA9,	%i6
	fmovsvs	%icc,	%f2,	%f17
	addccc	%l5,	%i0,	%l3
	edge8n	%o0,	%l1,	%i7
	fmul8sux16	%f14,	%f14,	%f0
	sir	0x180E
	te	%xcc,	0x4
	fblg	%fcc0,	loop_2387
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%icc,	%f20,	%f8
	fcmpgt32	%f20,	%f6,	%g2
loop_2387:
	nop
	setx	0xF617900AB8873D7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f12
	nop
	fitod	%f9,	%f6
	set	0x32, %l2
	ldstuba	[%l7 + %l2] 0x18,	%i4
	addc	%o7,	%l6,	%g6
	add	%l7,	0x34,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] 0x0c,	%g5,	%l2
	bvc,a	loop_2388
	movpos	%icc,	%l0,	%g1
	srax	%l4,	0x12,	%i3
	edge16	%i1,	%o6,	%o3
loop_2388:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i5,	%g4
	movneg	%icc,	%o2,	%o1
	addccc	%o5,	%o4,	%i2
	andcc	%g3,	0x0BBF,	%i6
	fxnors	%f28,	%f7,	%f7
	alignaddrl	%g7,	%i0,	%l5
	sub	%o0,	%l1,	%i7
	fmovrdne	%l3,	%f22,	%f10
	sdiv	%i4,	0x1D20,	%o7
	sir	0x14BD
	movcs	%icc,	%g2,	%g6
	movcc	%icc,	%g5,	%l6
	swap	[%l7 + 0x3C],	%l2
	te	%xcc,	0x0
	mulscc	%l0,	%l4,	%i3
	fmovda	%xcc,	%f7,	%f19
	te	%xcc,	0x1
	tsubcc	%g1,	%i1,	%o3
	edge16l	%i5,	%o6,	%g4
	andn	%o2,	%o5,	%o1
	ldub	[%l7 + 0x4E],	%o4
	tvs	%icc,	0x1
	orcc	%i2,	%i6,	%g3
	taddcc	%i0,	%g7,	%l5
	andcc	%l1,	0x1E26,	%i7
	srax	%l3,	%i4,	%o7
	and	%g2,	0x07C1,	%g6
	ld	[%l7 + 0x7C],	%f12
	nop
	set	0x74, %o7
	lduw	[%l7 + %o7],	%o0
	fbu,a	%fcc2,	loop_2389
	addcc	%l6,	0x1302,	%l2
	fba	%fcc0,	loop_2390
	sir	0x1B0E
loop_2389:
	edge16n	%g5,	%l4,	%l0
	tle	%icc,	0x3
loop_2390:
	array32	%i3,	%i1,	%o3
	xnor	%i5,	0x1940,	%o6
	edge8l	%g4,	%o2,	%o5
	nop
	setx loop_2391, %l0, %l1
	jmpl %l1, %o1
	movleu	%xcc,	%o4,	%g1
	movg	%xcc,	%i6,	%g3
	tpos	%icc,	0x5
loop_2391:
	fmovrslez	%i0,	%f24,	%f23
	call	loop_2392
	tl	%xcc,	0x6
	fmuld8ulx16	%f30,	%f2,	%f0
	udivx	%i2,	0x021A,	%g7
loop_2392:
	nop
	setx	loop_2393,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0xE01800426733C871,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x66BD49B3E13B5A0F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f2,	%f14
	edge32l	%l5,	%i7,	%l3
	movne	%icc,	%l1,	%o7
loop_2393:
	movrlez	%i4,	0x381,	%g6
	brgez,a	%g2,	loop_2394
	sll	%l6,	%l2,	%o0
	fbuge	%fcc3,	loop_2395
	movcc	%icc,	%l4,	%g5
loop_2394:
	umulcc	%i3,	0x138B,	%i1
	nop
	setx	0xF07F13A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
loop_2395:
	brnz,a	%l0,	loop_2396
	udivcc	%i5,	0x11A2,	%o3
	movrlez	%o6,	0x300,	%g4
	fmovda	%xcc,	%f20,	%f27
loop_2396:
	nop
	setx	0xC64CEF6B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f15
	fmovsge	%xcc,	%f1,	%f21
	xor	%o5,	0x1093,	%o1
	movne	%icc,	%o2,	%o4
	pdist	%f14,	%f12,	%f4
	fmovscc	%xcc,	%f17,	%f16
	fsrc2s	%f7,	%f5
	edge16n	%g1,	%i6,	%g3
	array32	%i2,	%g7,	%l5
	movvs	%icc,	%i0,	%l3
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x53] %asi,	%i7
	fsrc2	%f14,	%f10
	sir	0x043D
	bl,a,pn	%xcc,	loop_2397
	movvs	%xcc,	%o7,	%l1
	fcmpgt32	%f20,	%f14,	%i4
	bvs,a,pt	%xcc,	loop_2398
loop_2397:
	bcs,pn	%xcc,	loop_2399
	array8	%g6,	%l6,	%l2
	ldsh	[%l7 + 0x4C],	%g2
loop_2398:
	fmovrslez	%o0,	%f30,	%f20
loop_2399:
	tneg	%icc,	0x5
	movrgez	%l4,	0x22A,	%g5
	tg	%icc,	0x4
	membar	0x19
	smul	%i1,	%l0,	%i5
	fmovdgu	%icc,	%f11,	%f11
	sethi	0x093A,	%o3
	movge	%xcc,	%i3,	%g4
	xor	%o5,	0x1425,	%o6
	tne	%xcc,	0x0
	xorcc	%o1,	0x12DA,	%o4
	membar	0x02
	tcc	%icc,	0x7
	ldd	[%l7 + 0x08],	%f24
	bne	%xcc,	loop_2400
	fpadd16	%f24,	%f4,	%f2
	fnegd	%f4,	%f18
	orcc	%o2,	%g1,	%g3
loop_2400:
	umulcc	%i6,	0x008E,	%g7
	tn	%xcc,	0x5
	fbue	%fcc2,	loop_2401
	fmovrslz	%l5,	%f29,	%f18
	movn	%xcc,	%i0,	%l3
	movneg	%icc,	%i2,	%i7
loop_2401:
	fnot2s	%f30,	%f28
	nop
	setx	0xCBC5699D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f18
	tleu	%icc,	0x7
	nop
	fitos	%f13,	%f23
	fstox	%f23,	%f10
	fxtos	%f10,	%f21
	fmovrslez	%l1,	%f1,	%f5
	subc	%o7,	0x0195,	%i4
	edge16l	%l6,	%l2,	%g6
	ldub	[%l7 + 0x69],	%g2
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x1C] %asi,	%l4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x2A] %asi,	%o0
	tsubcctv	%g5,	0x1BEA,	%i1
	sth	%l0,	[%l7 + 0x16]
	movpos	%xcc,	%o3,	%i5
	ldsw	[%l7 + 0x2C],	%g4
	edge16	%o5,	%o6,	%o1
	lduh	[%l7 + 0x62],	%o4
	nop
	setx	loop_2402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpsub32	%f20,	%f16,	%f18
	st	%f19,	[%l7 + 0x68]
	sllx	%i3,	0x1E,	%g1
loop_2402:
	fmovsvs	%xcc,	%f9,	%f30
	swap	[%l7 + 0x3C],	%o2
	movrlz	%g3,	%i6,	%l5
	ldsb	[%l7 + 0x4B],	%g7
	movpos	%icc,	%i0,	%i2
	movge	%icc,	%l3,	%l1
	fmovdgu	%icc,	%f28,	%f6
	array32	%o7,	%i7,	%l6
	set	0x59, %o4
	stba	%l2,	[%l7 + %o4] 0x89
	wr	%g0,	0x19,	%asi
	stba	%i4,	[%l7 + 0x77] %asi
	sethi	0x1EF1,	%g6
	set	0x62, %g3
	ldsha	[%l7 + %g3] 0x88,	%l4
	addccc	%g2,	0x0076,	%g5
	fbo,a	%fcc0,	loop_2403
	tne	%xcc,	0x1
	edge16	%i1,	%l0,	%o3
	movre	%i5,	%o0,	%g4
loop_2403:
	fornot2	%f10,	%f12,	%f0
	fpsub16s	%f5,	%f9,	%f18
	wr	%g0,	0x04,	%asi
	stxa	%o6,	[%l7 + 0x78] %asi
	edge32n	%o5,	%o1,	%i3
	fmovdvc	%icc,	%f10,	%f14
	fbo,a	%fcc0,	loop_2404
	tvs	%xcc,	0x6
	ta	%icc,	0x3
	fbge	%fcc2,	loop_2405
loop_2404:
	fmovsvc	%xcc,	%f19,	%f24
	mova	%xcc,	%o4,	%o2
	ld	[%l7 + 0x70],	%f11
loop_2405:
	addc	%g3,	0x0CA7,	%i6
	ldd	[%l7 + 0x60],	%g0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%l5,	%f30,	%f16
	nop
	setx	0xCCC571D5B2D8544A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x25349D683CD7920B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f2,	%f18
	brgz	%i0,	loop_2406
	bshuffle	%f22,	%f30,	%f16
	xnorcc	%i2,	%g7,	%l3
	movcs	%xcc,	%o7,	%i7
loop_2406:
	fbge,a	%fcc1,	loop_2407
	movneg	%xcc,	%l1,	%l2
	fmovdne	%xcc,	%f25,	%f6
	tg	%xcc,	0x0
loop_2407:
	xor	%l6,	%g6,	%i4
	ldub	[%l7 + 0x61],	%l4
	mulx	%g5,	0x0011,	%i1
	fpadd32	%f24,	%f0,	%f24
	fnot2	%f22,	%f30
	set	0x78, %i1
	prefetcha	[%l7 + %i1] 0x15,	 0x1
	fnors	%f5,	%f14,	%f10
	fmovsl	%icc,	%f29,	%f30
	udivx	%o3,	0x0190,	%g2
	nop
	setx	0x43974B3B08D1F815,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD584FA80BDAC992D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f20,	%f6
	udivcc	%i5,	0x06F1,	%g4
	fbue	%fcc1,	loop_2408
	movleu	%icc,	%o0,	%o5
	tle	%xcc,	0x6
	edge16n	%o1,	%o6,	%o4
loop_2408:
	fnands	%f13,	%f19,	%f3
	bge,a	%xcc,	loop_2409
	tn	%icc,	0x6
	edge32ln	%i3,	%o2,	%i6
	and	%g3,	0x0C87,	%g1
loop_2409:
	and	%l5,	0x0727,	%i2
	xnorcc	%g7,	0x0825,	%l3
	movle	%xcc,	%i0,	%o7
	movn	%xcc,	%i7,	%l2
	fpsub16	%f18,	%f6,	%f28
	edge16	%l6,	%l1,	%i4
	ldsw	[%l7 + 0x0C],	%g6
	fexpand	%f13,	%f8
	fpsub32	%f4,	%f0,	%f22
	move	%icc,	%g5,	%l4
	xorcc	%l0,	%i1,	%o3
	xorcc	%g2,	%i5,	%g4
	fmovda	%icc,	%f10,	%f10
	add	%o5,	0x1DDC,	%o0
	fmul8x16au	%f3,	%f21,	%f30
	tsubcctv	%o1,	%o4,	%i3
	fbule,a	%fcc0,	loop_2410
	fpadd16s	%f20,	%f8,	%f5
	mulx	%o2,	0x0EAE,	%i6
	addcc	%o6,	%g1,	%g3
loop_2410:
	movcc	%icc,	%l5,	%g7
	wr	%g0,	0x57,	%asi
	stxa	%i2,	[%g0 + 0x0] %asi
	nop
	setx	0x2BEC7B3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x3556F630,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f24,	%f3
	edge16l	%i0,	%l3,	%i7
	nop
	fitod	%f6,	%f26
	fdtox	%f26,	%f2
	edge16l	%l2,	%o7,	%l6
	stbar
	bgu	%xcc,	loop_2411
	movle	%xcc,	%i4,	%g6
	fone	%f6
	xnorcc	%g5,	0x1A76,	%l4
loop_2411:
	fmul8ulx16	%f26,	%f26,	%f20
	tsubcctv	%l1,	0x10B8,	%l0
	mulscc	%o3,	0x178E,	%i1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x58] %asi,	%g2
	taddcc	%g4,	%i5,	%o5
	and	%o0,	0x1359,	%o1
	stx	%o4,	[%l7 + 0x78]
	addcc	%o2,	%i3,	%o6
	andn	%i6,	%g1,	%l5
	smulcc	%g3,	0x19EB,	%g7
	fcmpne16	%f8,	%f26,	%i0
	alignaddrl	%i2,	%i7,	%l3
	tne	%icc,	0x0
	fbo	%fcc2,	loop_2412
	nop
	setx	0x2FC5AFDEA691F8B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x5695C3E0D935A0C8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f18,	%f4
	tleu	%xcc,	0x5
	bneg,a	%icc,	loop_2413
loop_2412:
	bvs,pt	%icc,	loop_2414
	fbule	%fcc0,	loop_2415
	alignaddr	%o7,	%l6,	%l2
loop_2413:
	movg	%xcc,	%g6,	%i4
loop_2414:
	brz,a	%l4,	loop_2416
loop_2415:
	movpos	%icc,	%l1,	%l0
	nop
	setx	0x9D2DDD7B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x179C4F7F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f19,	%f9
	sdiv	%g5,	0x0080,	%o3
loop_2416:
	fbl	%fcc1,	loop_2417
	fmovrsgez	%g2,	%f29,	%f31
	tneg	%icc,	0x1
	taddcc	%g4,	0x0045,	%i1
loop_2417:
	bcs	loop_2418
	subccc	%o5,	%i5,	%o0
	fmovdvs	%xcc,	%f24,	%f4
	edge16ln	%o4,	%o1,	%i3
loop_2418:
	fxor	%f28,	%f2,	%f4
	movrne	%o2,	0x17F,	%i6
	move	%icc,	%o6,	%l5
	std	%f4,	[%l7 + 0x40]
	xor	%g3,	%g1,	%i0
	edge32ln	%i2,	%i7,	%l3
	tgu	%icc,	0x1
	xnor	%g7,	0x15E7,	%o7
	movge	%xcc,	%l6,	%l2
	mova	%icc,	%i4,	%g6
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x15,	%l4
	array16	%l0,	%l1,	%g5
	tge	%icc,	0x0
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0xf0
	membar	#Sync
	subcc	%g2,	%o3,	%g4
	movrne	%o5,	%i5,	%i1
	fbul	%fcc0,	loop_2419
	umulcc	%o4,	0x14D7,	%o1
	udiv	%o0,	0x078E,	%i3
	nop
	fitod	%f10,	%f26
	fdtoi	%f26,	%f22
loop_2419:
	swap	[%l7 + 0x20],	%o2
	movvc	%xcc,	%i6,	%o6
	fmovrdlz	%l5,	%f12,	%f24
	bge,a	loop_2420
	tle	%xcc,	0x5
	sethi	0x0186,	%g3
	tvs	%xcc,	0x7
loop_2420:
	fmovsleu	%icc,	%f10,	%f13
	movn	%xcc,	%g1,	%i0
	call	loop_2421
	bleu,a,pt	%xcc,	loop_2422
	subccc	%i7,	0x0D16,	%i2
	nop
	setx	0xA8E8993C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x0C650F5E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f15,	%f22
loop_2421:
	fsrc2	%f8,	%f22
loop_2422:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x38] %asi,	%l3
	fpadd16s	%f29,	%f25,	%f22
	or	%g7,	0x1B43,	%o7
	ta	%icc,	0x3
	movpos	%xcc,	%l6,	%i4
	edge32ln	%l2,	%g6,	%l0
	movle	%xcc,	%l1,	%g5
	edge16n	%l4,	%o3,	%g4
	sdivx	%g2,	0x1E52,	%o5
	fbl	%fcc3,	loop_2423
	array16	%i1,	%i5,	%o4
	edge8l	%o0,	%o1,	%i3
	movpos	%xcc,	%o2,	%i6
loop_2423:
	bcc,pn	%icc,	loop_2424
	nop
	setx	0x3962D062,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xBD67F482,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f6,	%f10
	movge	%xcc,	%l5,	%o6
	tcc	%xcc,	0x4
loop_2424:
	std	%f18,	[%l7 + 0x48]
	array32	%g3,	%g1,	%i0
	fbul	%fcc1,	loop_2425
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i7,	%l3,	%g7
	fxnor	%f30,	%f10,	%f26
loop_2425:
	srlx	%i2,	%o7,	%i4
	xor	%l2,	0x1A6B,	%l6
	movrgez	%g6,	0x1BF,	%l1
	array8	%l0,	%g5,	%o3
	mova	%xcc,	%l4,	%g2
	smulcc	%g4,	%i1,	%o5
	fbl	%fcc2,	loop_2426
	fmovsg	%icc,	%f21,	%f10
	fandnot1	%f16,	%f2,	%f8
	set	0x2A, %i6
	ldsba	[%l7 + %i6] 0x10,	%o4
loop_2426:
	edge8ln	%o0,	%i5,	%i3
	fzero	%f6
	nop
	setx	loop_2427,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	call	loop_2428
	movg	%icc,	%o2,	%i6
	tle	%xcc,	0x2
loop_2427:
	fmovde	%icc,	%f30,	%f6
loop_2428:
	smulcc	%l5,	%o6,	%o1
	nop
	setx	loop_2429,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitos	%f11,	%f15
	fstox	%f15,	%f10
	fxtos	%f10,	%f8
	lduh	[%l7 + 0x5E],	%g3
	orn	%i0,	%g1,	%i7
loop_2429:
	tl	%xcc,	0x2
	and	%l3,	%i2,	%o7
	sra	%g7,	%i4,	%l2
	tpos	%icc,	0x4
	andncc	%g6,	%l1,	%l0
	fmovda	%icc,	%f13,	%f14
	te	%icc,	0x3
	orn	%g5,	%l6,	%l4
	fbn,a	%fcc1,	loop_2430
	ldub	[%l7 + 0x1E],	%g2
	fbe,a	%fcc3,	loop_2431
	tsubcctv	%g4,	%i1,	%o5
loop_2430:
	edge32n	%o3,	%o0,	%o4
	nop
	setx	0x4074C62F,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
loop_2431:
	tne	%xcc,	0x4
	fmovrslz	%i3,	%f17,	%f9
	xor	%i5,	0x0070,	%o2
	xorcc	%l5,	0x04E2,	%i6
	orcc	%o6,	%g3,	%i0
	array32	%o1,	%g1,	%l3
	movle	%xcc,	%i7,	%o7
	te	%icc,	0x1
	fmovsgu	%icc,	%f19,	%f17
	fbug	%fcc0,	loop_2432
	swap	[%l7 + 0x38],	%i2
	bg	%icc,	loop_2433
	brgz,a	%g7,	loop_2434
loop_2432:
	movrlez	%i4,	%l2,	%l1
	edge16l	%g6,	%g5,	%l6
loop_2433:
	fble	%fcc2,	loop_2435
loop_2434:
	sll	%l0,	0x1E,	%l4
	fbl,a	%fcc2,	loop_2436
	fnegd	%f20,	%f16
loop_2435:
	fpsub32s	%f5,	%f27,	%f24
	sdiv	%g2,	0x0D17,	%g4
loop_2436:
	edge8ln	%o5,	%o3,	%o0
	fmovsne	%xcc,	%f31,	%f31
	tge	%icc,	0x3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x74] %asi,	%i1
	or	%o4,	0x02F5,	%i5
	sra	%i3,	%o2,	%l5
	sdivcc	%o6,	0x1CF3,	%g3
	fmovsvs	%xcc,	%f22,	%f25
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%i0
	nop
	setx	0x34F6BFEEF201B4BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD1B42DF141BBFE40,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f6,	%f0
	fornot1	%f14,	%f16,	%f28
	xorcc	%i6,	%g1,	%o1
	fbl,a	%fcc3,	loop_2437
	fmovse	%icc,	%f6,	%f13
	alignaddr	%l3,	%i7,	%o7
	tsubcc	%i2,	%g7,	%i4
loop_2437:
	tvc	%xcc,	0x2
	stx	%l2,	[%l7 + 0x08]
	ldsw	[%l7 + 0x5C],	%g6
	fzero	%f22
	fmovsne	%icc,	%f7,	%f27
	tg	%xcc,	0x7
	movre	%l1,	0x0FE,	%g5
	xor	%l0,	%l4,	%g2
	te	%icc,	0x4
	fpadd16	%f28,	%f14,	%f10
	fbug	%fcc1,	loop_2438
	bleu,pn	%icc,	loop_2439
	movrne	%l6,	0x1E0,	%g4
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2438:
	nop
	setx	0xD5336AF4F47506EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xDDCD724284D2E1F8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f28,	%f0
loop_2439:
	edge32	%o5,	%o0,	%o3
	tvc	%icc,	0x6
	fbo	%fcc3,	loop_2440
	array16	%i1,	%o4,	%i3
	orn	%i5,	0x165F,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2440:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x39] %asi,	%o6
	bneg,a	%xcc,	loop_2441
	popc	%g3,	%l5
	fblg	%fcc3,	loop_2442
	fpsub32	%f18,	%f26,	%f10
loop_2441:
	fzero	%f22
	movrgz	%i0,	0x305,	%g1
loop_2442:
	udivcc	%i6,	0x0B64,	%o1
	addc	%i7,	%l3,	%i2
	set	0x20, %i5
	ldxa	[%l7 + %i5] 0x0c,	%g7
	fmovsl	%xcc,	%f12,	%f14
	nop
	fitos	%f0,	%f10
	fstod	%f10,	%f0
	edge16n	%o7,	%l2,	%g6
	movne	%icc,	%l1,	%i4
	sll	%g5,	%l0,	%l4
	movg	%icc,	%l6,	%g2
	alignaddr	%g4,	%o0,	%o5
	be,a	%xcc,	loop_2443
	nop
	setx	loop_2444,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbul	%fcc3,	loop_2445
	fand	%f16,	%f28,	%f26
loop_2443:
	add	%o3,	0x071F,	%i1
loop_2444:
	fpackfix	%f2,	%f26
loop_2445:
	fbug,a	%fcc1,	loop_2446
	movleu	%icc,	%o4,	%i5
	fmovrsne	%i3,	%f7,	%f13
	sdivcc	%o6,	0x0E8D,	%g3
loop_2446:
	nop
	set	0x40, %o0
	ldswa	[%l7 + %o0] 0x18,	%o2
	movvs	%icc,	%l5,	%i0
	tleu	%icc,	0x5
	movpos	%icc,	%g1,	%o1
	movrlez	%i7,	%l3,	%i2
	sir	0x0EAC
	popc	%i6,	%g7
	movre	%l2,	%o7,	%l1
	or	%g6,	%g5,	%i4
	ta	%xcc,	0x1
	srlx	%l0,	%l6,	%g2
	fmuld8ulx16	%f1,	%f30,	%f30
	nop
	setx	0xC687F6C1180FF2E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x729A1878425FF0EE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f18,	%f14
	set	0x22, %g5
	ldstuba	[%l7 + %g5] 0x80,	%l4
	set	0x24, %o1
	stwa	%g4,	[%l7 + %o1] 0x15
	tne	%xcc,	0x6
	movrne	%o5,	%o0,	%i1
	fnegd	%f22,	%f18
	ldstub	[%l7 + 0x4A],	%o3
	bne,a,pn	%icc,	loop_2447
	array8	%o4,	%i5,	%i3
	tpos	%xcc,	0x4
	sll	%g3,	%o6,	%l5
loop_2447:
	nop
	wr	%g0,	0xe2,	%asi
	stwa	%i0,	[%l7 + 0x60] %asi
	membar	#Sync
	fmovrsgez	%o2,	%f9,	%f25
	fmovsgu	%icc,	%f17,	%f31
	udivx	%g1,	0x004B,	%i7
	edge32	%l3,	%o1,	%i2
	wr	%g0,	0x27,	%asi
	stha	%i6,	[%l7 + 0x46] %asi
	membar	#Sync
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x80,	%l2,	%o7
	tsubcc	%l1,	%g7,	%g5
	smulcc	%g6,	%i4,	%l0
	ta	%icc,	0x3
	subc	%l6,	0x1256,	%g2
	sethi	0x18A1,	%l4
	membar	0x4C
	xor	%g4,	0x0670,	%o0
	srlx	%o5,	0x1F,	%i1
	sllx	%o3,	%o4,	%i5
	edge8l	%i3,	%g3,	%l5
	fmuld8ulx16	%f8,	%f10,	%f8
	fbg,a	%fcc2,	loop_2448
	alignaddr	%i0,	%o2,	%g1
	tne	%icc,	0x0
	bcs,a,pt	%icc,	loop_2449
loop_2448:
	fmovdle	%icc,	%f11,	%f26
	andcc	%o6,	%l3,	%i7
	tpos	%xcc,	0x6
loop_2449:
	brlz	%o1,	loop_2450
	fcmpeq32	%f10,	%f30,	%i2
	mova	%icc,	%l2,	%i6
	tsubcctv	%l1,	%o7,	%g5
loop_2450:
	fmovrde	%g6,	%f4,	%f2
	ldd	[%l7 + 0x78],	%f20
	sll	%i4,	0x1D,	%g7
	sdivx	%l0,	0x1A9D,	%g2
	bg	%xcc,	loop_2451
	tneg	%icc,	0x0
	or	%l4,	%l6,	%o0
	fmovdl	%xcc,	%f26,	%f29
loop_2451:
	ld	[%l7 + 0x78],	%f18
	sub	%g4,	0x159A,	%i1
	edge8ln	%o3,	%o4,	%o5
	tn	%xcc,	0x5
	orn	%i5,	%g3,	%i3
	brgez,a	%l5,	loop_2452
	xor	%i0,	0x05A7,	%o2
	fornot1s	%f18,	%f9,	%f6
	fnot1s	%f28,	%f10
loop_2452:
	fmovsge	%xcc,	%f10,	%f13
	subcc	%o6,	%l3,	%g1
	tneg	%xcc,	0x5
	ldub	[%l7 + 0x72],	%i7
	fsrc1	%f10,	%f8
	mulx	%o1,	0x08A3,	%l2
	edge32n	%i6,	%i2,	%o7
	bcs,a	loop_2453
	nop
	fitos	%f12,	%f29
	fstox	%f29,	%f2
	fxtos	%f2,	%f14
	movrlez	%g5,	0x3D6,	%l1
	edge32l	%g6,	%g7,	%i4
loop_2453:
	fmuld8sux16	%f9,	%f2,	%f2
	umulcc	%l0,	%g2,	%l6
	srl	%o0,	0x00,	%g4
	udivx	%i1,	0x1ED0,	%o3
	fba	%fcc2,	loop_2454
	edge8n	%l4,	%o5,	%i5
	bneg,pn	%xcc,	loop_2455
	taddcctv	%g3,	0x1E34,	%i3
loop_2454:
	fble,a	%fcc0,	loop_2456
	fblg,a	%fcc2,	loop_2457
loop_2455:
	fmovrdgz	%o4,	%f16,	%f20
	movl	%icc,	%i0,	%l5
loop_2456:
	edge32ln	%o6,	%o2,	%g1
loop_2457:
	addccc	%i7,	0x0A51,	%l3
	movn	%xcc,	%o1,	%i6
	sdivcc	%l2,	0x10C6,	%o7
	bn,a,pt	%xcc,	loop_2458
	tleu	%xcc,	0x5
	fblg,a	%fcc1,	loop_2459
	edge32ln	%g5,	%l1,	%i2
loop_2458:
	bg	loop_2460
	fbg	%fcc1,	loop_2461
loop_2459:
	andn	%g7,	0x13DE,	%i4
	brlz,a	%l0,	loop_2462
loop_2460:
	brgez,a	%g6,	loop_2463
loop_2461:
	taddcctv	%l6,	%g2,	%o0
	orcc	%g4,	%o3,	%l4
loop_2462:
	fcmpeq16	%f16,	%f2,	%o5
loop_2463:
	nop
	setx	0x95F1F40F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xB24AF28E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f19,	%f10
	mulscc	%i5,	0x0833,	%g3
	andcc	%i1,	%i3,	%i0
	taddcc	%o4,	%o6,	%l5
	edge16	%o2,	%g1,	%l3
	xnor	%o1,	0x11CB,	%i7
	bcs	loop_2464
	edge32n	%l2,	%i6,	%g5
	be,a	loop_2465
	fblg,a	%fcc3,	loop_2466
loop_2464:
	sub	%l1,	0x1522,	%o7
	movrne	%i2,	0x282,	%i4
loop_2465:
	prefetch	[%l7 + 0x48],	 0x3
loop_2466:
	sll	%g7,	%g6,	%l6
	movrgz	%g2,	%l0,	%g4
	fxnors	%f0,	%f23,	%f7
	fmovde	%icc,	%f4,	%f18
	fandnot2s	%f21,	%f6,	%f20
	fbul	%fcc1,	loop_2467
	stbar
	tpos	%xcc,	0x2
	movg	%xcc,	%o0,	%o3
loop_2467:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	call	loop_2468
	edge8ln	%l4,	%g3,	%i5
	taddcctv	%i1,	0x1A32,	%i3
	fbu,a	%fcc0,	loop_2469
loop_2468:
	fand	%f6,	%f22,	%f2
	fmovs	%f16,	%f5
	edge16	%o4,	%i0,	%l5
loop_2469:
	udivcc	%o6,	0x0DF7,	%o2
	stbar
	fbue,a	%fcc1,	loop_2470
	fmovsvc	%icc,	%f15,	%f31
	brlz	%l3,	loop_2471
	movre	%g1,	%i7,	%l2
loop_2470:
	flush	%l7 + 0x54
	tge	%icc,	0x2
loop_2471:
	fcmpne32	%f8,	%f22,	%i6
	subc	%o1,	%g5,	%o7
	bgu,a	loop_2472
	movge	%icc,	%i2,	%l1
	nop
	setx	0x5A58A22B7E24BFED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f8
	fzeros	%f28
loop_2472:
	movcc	%icc,	%i4,	%g6
	bg,pt	%icc,	loop_2473
	fmovsgu	%icc,	%f0,	%f26
	fcmpeq16	%f26,	%f10,	%l6
	orncc	%g7,	0x127F,	%g2
loop_2473:
	fbn,a	%fcc3,	loop_2474
	umulcc	%g4,	%l0,	%o3
	fabss	%f11,	%f31
	movgu	%icc,	%o5,	%l4
loop_2474:
	fmovrsgz	%o0,	%f29,	%f3
	edge8l	%g3,	%i1,	%i3
	fors	%f20,	%f24,	%f9
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x42] %asi,	%i5
	bvc,a,pn	%xcc,	loop_2475
	bg,a,pn	%icc,	loop_2476
	sir	0x0C92
	nop
	setx loop_2477, %l0, %l1
	jmpl %l1, %i0
loop_2475:
	fcmpne16	%f22,	%f2,	%l5
loop_2476:
	movcs	%xcc,	%o4,	%o2
	edge8	%o6,	%g1,	%l3
loop_2477:
	fcmpgt32	%f28,	%f8,	%i7
	tge	%xcc,	0x2
	udivx	%i6,	0x18A4,	%o1
	fbl,a	%fcc2,	loop_2478
	nop
	setx	loop_2479,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%g5,	%o7,	%l2
	sir	0x18F0
loop_2478:
	fpackfix	%f8,	%f0
loop_2479:
	tg	%xcc,	0x1
	array16	%i2,	%l1,	%g6
	addcc	%l6,	0x0107,	%g7
	edge32n	%i4,	%g2,	%g4
	andn	%l0,	0x1024,	%o5
	tvc	%xcc,	0x3
	sll	%o3,	%l4,	%g3
	stb	%i1,	[%l7 + 0x0D]
	movcc	%xcc,	%o0,	%i5
	subcc	%i0,	0x03CB,	%i3
	orncc	%l5,	0x11B4,	%o2
	fmovsvc	%xcc,	%f6,	%f11
	subc	%o4,	%o6,	%g1
	tleu	%icc,	0x6
	edge8l	%i7,	%i6,	%o1
	ta	%icc,	0x6
	andcc	%l3,	%g5,	%l2
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%i2
	movrlz	%l1,	%g6,	%o7
	taddcctv	%l6,	0x0E62,	%g7
	and	%i4,	%g4,	%l0
	addccc	%g2,	0x0D17,	%o3
	bleu,pt	%icc,	loop_2480
	fmul8ulx16	%f14,	%f20,	%f0
	membar	0x60
	fmovdne	%icc,	%f30,	%f14
loop_2480:
	nop
	setx	0xDFD75005,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xC19AABC7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f24,	%f20
	movgu	%xcc,	%l4,	%o5
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f20
	subcc	%i1,	0x0C2A,	%g3
	nop
	fitod	%f4,	%f22
	fdtoi	%f22,	%f13
	bgu	loop_2481
	lduh	[%l7 + 0x18],	%o0
	fmovde	%icc,	%f4,	%f18
	fbue,a	%fcc3,	loop_2482
loop_2481:
	movvc	%xcc,	%i0,	%i5
	tvc	%icc,	0x0
	fcmpeq16	%f26,	%f8,	%l5
loop_2482:
	edge16	%i3,	%o2,	%o4
	fnot2	%f2,	%f2
	tvc	%xcc,	0x6
	subcc	%o6,	0x1733,	%g1
	andcc	%i7,	%o1,	%i6
	movpos	%icc,	%g5,	%l2
	sdiv	%i2,	0x0AC5,	%l3
	fmovspos	%xcc,	%f12,	%f29
	xor	%g6,	%l1,	%o7
	edge16n	%g7,	%l6,	%g4
	faligndata	%f16,	%f28,	%f12
	tl	%icc,	0x6
	sllx	%i4,	0x0E,	%g2
	tvs	%icc,	0x0
	movpos	%xcc,	%l0,	%l4
	bpos,a,pn	%icc,	loop_2483
	fbn,a	%fcc0,	loop_2484
	fsrc1	%f16,	%f16
	ble,a	loop_2485
loop_2483:
	fcmpgt16	%f8,	%f14,	%o3
loop_2484:
	ldub	[%l7 + 0x56],	%i1
	set	0x20, %g2
	ldda	[%l7 + %g2] 0x11,	%o4
loop_2485:
	brgz,a	%o0,	loop_2486
	mulx	%i0,	%i5,	%l5
	andncc	%i3,	%g3,	%o4
	edge16ln	%o6,	%g1,	%i7
loop_2486:
	tsubcc	%o1,	0x01B9,	%o2
	fmovsleu	%xcc,	%f27,	%f3
	fbge,a	%fcc0,	loop_2487
	smulcc	%i6,	%g5,	%l2
	sra	%l3,	0x1B,	%i2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%l1
loop_2487:
	bleu,a	loop_2488
	fcmpne16	%f26,	%f14,	%o7
	nop
	fitos	%f6,	%f1
	fstod	%f1,	%f20
	fpsub16	%f28,	%f12,	%f26
loop_2488:
	fmovrslez	%g7,	%f15,	%f11
	nop
	fitod	%f2,	%f14
	fdtos	%f14,	%f25
	bg,a	%xcc,	loop_2489
	fble,a	%fcc0,	loop_2490
	movle	%icc,	%l6,	%i4
	tsubcc	%g4,	0x1F0D,	%g2
loop_2489:
	sra	%l0,	%o3,	%i1
loop_2490:
	movgu	%xcc,	%l4,	%o0
	array16	%o5,	%i0,	%i5
	fcmple16	%f30,	%f10,	%i3
	edge16ln	%g3,	%l5,	%o6
	bn	%icc,	loop_2491
	array32	%o4,	%i7,	%g1
	andcc	%o1,	0x0CCC,	%i6
	brgz	%o2,	loop_2492
loop_2491:
	movgu	%xcc,	%g5,	%l2
	fexpand	%f30,	%f30
	umulcc	%l3,	%i2,	%g6
loop_2492:
	fmovdn	%xcc,	%f6,	%f16
	brlez,a	%o7,	loop_2493
	fmovsa	%icc,	%f30,	%f10
	movrgez	%l1,	%g7,	%i4
	edge32n	%g4,	%l6,	%l0
loop_2493:
	mova	%icc,	%o3,	%g2
	fpmerge	%f9,	%f4,	%f24
	movleu	%xcc,	%l4,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc2,	loop_2494
	andn	%o5,	%i1,	%i5
	mulscc	%i3,	%g3,	%i0
	bneg,a	%icc,	loop_2495
loop_2494:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x44, %l5
	lda	[%l7 + %l5] 0x15,	%f2
loop_2495:
	fxnor	%f30,	%f6,	%f16
	movleu	%icc,	%o6,	%o4
	movvc	%icc,	%i7,	%l5
	nop
	fitos	%f5,	%f13
	edge32l	%g1,	%o1,	%o2
	fbul	%fcc1,	loop_2496
	fmovdvc	%icc,	%f13,	%f27
	sdivcc	%i6,	0x1064,	%l2
	edge32	%l3,	%i2,	%g5
loop_2496:
	orn	%g6,	0x1038,	%l1
	tgu	%icc,	0x2
	brnz,a	%o7,	loop_2497
	movpos	%xcc,	%i4,	%g7
	fcmple16	%f22,	%f26,	%g4
	orn	%l6,	%l0,	%o3
loop_2497:
	edge16n	%l4,	%o0,	%g2
	srax	%o5,	%i5,	%i3
	fbue,a	%fcc1,	loop_2498
	nop
	fitos	%f10,	%f27
	edge16ln	%g3,	%i1,	%i0
	array32	%o6,	%o4,	%i7
loop_2498:
	movrgz	%g1,	%l5,	%o2
	nop
	setx loop_2499, %l0, %l1
	jmpl %l1, %i6
	movl	%icc,	%o1,	%l2
	stbar
	bg,a	loop_2500
loop_2499:
	xnorcc	%l3,	%g5,	%g6
	array16	%i2,	%o7,	%l1
	fpack16	%f28,	%f22
loop_2500:
	and	%g7,	%g4,	%l6
	array32	%l0,	%i4,	%o3
	edge8ln	%o0,	%l4,	%o5
	smulcc	%g2,	%i3,	%g3
	umul	%i1,	%i0,	%i5
	for	%f14,	%f26,	%f22
	tleu	%icc,	0x3
	udivx	%o4,	0x17BA,	%i7
	udivx	%g1,	0x0933,	%o6
	fmovda	%xcc,	%f31,	%f23
	edge8ln	%o2,	%i6,	%l5
	fmovsvs	%icc,	%f30,	%f7
	fmovdneg	%icc,	%f3,	%f25
	xnorcc	%o1,	%l2,	%g5
	fbg	%fcc0,	loop_2501
	fpsub32	%f28,	%f0,	%f16
	tpos	%xcc,	0x7
	movrlz	%g6,	0x085,	%i2
loop_2501:
	nop
	set	0x54, %i2
	lduh	[%l7 + %i2],	%l3
	udiv	%o7,	0x1E5A,	%g7
	membar	0x5A
	move	%xcc,	%l1,	%l6
	fmovrde	%g4,	%f14,	%f0
	fbg,a	%fcc0,	loop_2502
	mulx	%l0,	%i4,	%o3
	fbue,a	%fcc1,	loop_2503
	movne	%xcc,	%l4,	%o0
loop_2502:
	tn	%icc,	0x2
	fbuge,a	%fcc2,	loop_2504
loop_2503:
	brlz	%o5,	loop_2505
	fmovscc	%icc,	%f8,	%f15
	movle	%xcc,	%i3,	%g2
loop_2504:
	movrgez	%i1,	0x133,	%i0
loop_2505:
	nop
	fitod	%f0,	%f18
	fdtos	%f18,	%f11
	sll	%g3,	%i5,	%o4
	tge	%icc,	0x5
	ldx	[%l7 + 0x28],	%g1
	udivx	%i7,	0x0495,	%o6
	taddcc	%o2,	%l5,	%o1
	fmovspos	%icc,	%f12,	%f29
	xorcc	%i6,	%g5,	%l2
	subc	%i2,	%l3,	%o7
	srax	%g6,	%l1,	%l6
	fornot2	%f0,	%f18,	%f26
	addcc	%g4,	0x0FD4,	%l0
	edge32ln	%i4,	%g7,	%l4
	bgu,pn	%xcc,	loop_2506
	edge32n	%o0,	%o5,	%i3
	tcc	%xcc,	0x1
	smulcc	%g2,	%i1,	%o3
loop_2506:
	sra	%g3,	%i5,	%o4
	fxors	%f21,	%f3,	%f3
	edge16n	%g1,	%i0,	%i7
	andcc	%o2,	0x1171,	%o6
	sethi	0x14C8,	%l5
	fbule,a	%fcc1,	loop_2507
	fpadd32	%f28,	%f0,	%f20
	add	%o1,	0x1E36,	%i6
	movrlz	%g5,	%i2,	%l2
loop_2507:
	fmovdleu	%xcc,	%f0,	%f7
	fabss	%f14,	%f9
	edge16	%l3,	%g6,	%o7
	tvs	%xcc,	0x5
	fbu	%fcc2,	loop_2508
	mulscc	%l6,	%g4,	%l1
	fmovrsgez	%i4,	%f31,	%f31
	taddcctv	%l0,	%l4,	%g7
loop_2508:
	fnor	%f6,	%f6,	%f2
	fnor	%f2,	%f18,	%f22
	udiv	%o5,	0x1F5E,	%o0
	movrgz	%g2,	%i3,	%o3
	movrlz	%g3,	0x2AB,	%i5
	set	0x20, %g4
	stwa	%i1,	[%l7 + %g4] 0x81
	orcc	%o4,	0x172B,	%g1
	mulscc	%i0,	%o2,	%o6
	fbu,a	%fcc2,	loop_2509
	brlz,a	%i7,	loop_2510
	sir	0x117D
	tsubcc	%o1,	0x03D8,	%l5
loop_2509:
	addc	%i6,	%i2,	%l2
loop_2510:
	bne,a,pn	%icc,	loop_2511
	fmovrsgez	%l3,	%f20,	%f1
	mulx	%g6,	0x0EF6,	%g5
	edge8	%l6,	%g4,	%l1
loop_2511:
	nop
	fitos	%f3,	%f25
	fcmpne16	%f4,	%f22,	%i4
	sll	%o7,	%l0,	%l4
	movleu	%icc,	%g7,	%o0
	movpos	%xcc,	%g2,	%o5
	addc	%o3,	%g3,	%i5
	movneg	%xcc,	%i3,	%o4
	smulcc	%g1,	%i1,	%i0
	tg	%xcc,	0x2
	xnor	%o2,	%o6,	%o1
	sdivcc	%l5,	0x0133,	%i7
	fmovdne	%icc,	%f7,	%f10
	add	%i2,	0x151A,	%l2
	bl,a,pn	%xcc,	loop_2512
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l3,	%g6,	%g5
	te	%icc,	0x3
loop_2512:
	sdiv	%i6,	0x114A,	%l6
	subccc	%g4,	0x0BE5,	%i4
	tvc	%xcc,	0x6
	srlx	%o7,	%l1,	%l4
	ta	%xcc,	0x0
	fxnors	%f20,	%f16,	%f21
	tsubcc	%l0,	%o0,	%g2
	andncc	%o5,	%o3,	%g3
	mulscc	%i5,	0x0DB9,	%i3
	tsubcctv	%o4,	0x1720,	%g7
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x7C] %asi,	%f29
	fmovdne	%xcc,	%f14,	%f18
	ta	%xcc,	0x4
	movne	%icc,	%i1,	%i0
	tg	%icc,	0x2
	set	0x36, %l1
	ldsba	[%l7 + %l1] 0x15,	%g1
	st	%f29,	[%l7 + 0x6C]
	xorcc	%o6,	%o2,	%l5
	movrlez	%i7,	0x1B2,	%i2
	alignaddrl	%o1,	%l2,	%l3
	ldd	[%l7 + 0x78],	%g6
	ldd	[%l7 + 0x38],	%f24
	tvs	%xcc,	0x5
	movge	%icc,	%i6,	%l6
	ldd	[%l7 + 0x68],	%f12
	fmovsa	%icc,	%f12,	%f1
	movleu	%xcc,	%g4,	%g5
	fmuld8ulx16	%f17,	%f29,	%f6
	nop
	fitod	%f24,	%f24
	movn	%xcc,	%o7,	%l1
	movge	%xcc,	%l4,	%l0
	brgz,a	%o0,	loop_2513
	tcc	%xcc,	0x5
	movle	%icc,	%g2,	%o5
	set	0x28, %o5
	swapa	[%l7 + %o5] 0x18,	%o3
loop_2513:
	smul	%i4,	%g3,	%i5
	faligndata	%f14,	%f0,	%f8
	addcc	%i3,	0x0E4E,	%o4
	fbg	%fcc0,	loop_2514
	edge8	%i1,	%i0,	%g7
	movle	%icc,	%g1,	%o6
	tcs	%icc,	0x5
loop_2514:
	tl	%icc,	0x4
	andn	%l5,	%o2,	%i7
	tsubcctv	%i2,	0x0B2E,	%o1
	wr	%g0,	0x18,	%asi
	stwa	%l2,	[%l7 + 0x60] %asi
	set	0x60, %l6
	lduwa	[%l7 + %l6] 0x80,	%g6
	nop
	setx	0x1E01918A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x53A342EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f1,	%f4
	bne,a	loop_2515
	fmovsle	%icc,	%f19,	%f1
	edge8l	%i6,	%l3,	%l6
	ta	%icc,	0x0
loop_2515:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x7C],	%g4
	lduh	[%l7 + 0x0A],	%o7
	movle	%xcc,	%g5,	%l4
	fandnot2s	%f27,	%f29,	%f7
	tgu	%xcc,	0x2
	bn	%icc,	loop_2516
	tcc	%icc,	0x0
	brlez	%l1,	loop_2517
	nop
	set	0x28, %g1
	stb	%o0,	[%l7 + %g1]
loop_2516:
	ld	[%l7 + 0x3C],	%f14
	stb	%g2,	[%l7 + 0x48]
loop_2517:
	mova	%xcc,	%l0,	%o5
	movge	%xcc,	%o3,	%i4
	taddcc	%g3,	%i5,	%o4
	fmovsg	%xcc,	%f25,	%f27
	movpos	%xcc,	%i3,	%i1
	umul	%i0,	%g1,	%g7
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x22] %asi,	%o6
	movgu	%xcc,	%l5,	%i7
	edge16l	%o2,	%i2,	%o1
	ldd	[%l7 + 0x70],	%g6
	orn	%i6,	%l2,	%l6
	fpmerge	%f16,	%f4,	%f24
	srlx	%g4,	0x13,	%l3
	stw	%o7,	[%l7 + 0x28]
	ldsb	[%l7 + 0x20],	%g5
	move	%icc,	%l4,	%l1
	smulcc	%g2,	%o0,	%o5
	tsubcctv	%l0,	%o3,	%i4
	movvs	%icc,	%i5,	%o4
	sra	%i3,	0x12,	%i1
	sra	%i0,	%g3,	%g7
	tsubcc	%o6,	0x1C2C,	%l5
	te	%xcc,	0x1
	edge16	%g1,	%i7,	%o2
	sir	0x0D9A
	wr	%g0,	0x23,	%asi
	stba	%o1,	[%l7 + 0x59] %asi
	membar	#Sync
	set	0x10, %i0
	ldda	[%l7 + %i0] 0x11,	%g6
	movpos	%xcc,	%i6,	%i2
	tvc	%xcc,	0x4
	or	%l6,	0x15C8,	%l2
	smul	%l3,	0x0F04,	%g4
	popc	%o7,	%l4
	array8	%g5,	%g2,	%l1
	sdiv	%o0,	0x00C5,	%l0
	andncc	%o5,	%o3,	%i4
	fmovdl	%xcc,	%f22,	%f26
	tvs	%xcc,	0x7
	sdiv	%o4,	0x09B9,	%i3
	edge16l	%i5,	%i1,	%g3
	tsubcc	%g7,	0x0241,	%i0
	movle	%xcc,	%o6,	%g1
	edge8ln	%l5,	%i7,	%o1
	edge16n	%g6,	%i6,	%i2
	movcs	%icc,	%o2,	%l6
	movvc	%xcc,	%l3,	%g4
	nop
	fitod	%f4,	%f0
	fdtox	%f0,	%f28
	bcc,a,pn	%icc,	loop_2518
	xnor	%o7,	%l2,	%l4
	alignaddr	%g2,	%l1,	%g5
	fsrc2	%f14,	%f2
loop_2518:
	nop
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x6A] %asi,	%o0
	sdiv	%l0,	0x1AE0,	%o3
	brnz	%i4,	loop_2519
	sdiv	%o5,	0x1CD1,	%o4
	fone	%f24
	tl	%icc,	0x2
loop_2519:
	subc	%i5,	%i3,	%g3
	nop
	fitod	%f21,	%f0
	srax	%i1,	%i0,	%g7
	taddcctv	%g1,	0x1E39,	%l5
	tcc	%xcc,	0x5
	membar	0x60
	mova	%icc,	%o6,	%o1
	edge16ln	%g6,	%i6,	%i2
	mova	%icc,	%i7,	%o2
	ta	%icc,	0x6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%l3
	bge,pn	%icc,	loop_2520
	movre	%l6,	%o7,	%l2
	movneg	%xcc,	%l4,	%g4
	stw	%l1,	[%l7 + 0x44]
loop_2520:
	sll	%g2,	0x1D,	%o0
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f6
	tneg	%xcc,	0x5
	orcc	%g5,	0x1358,	%o3
	tcs	%xcc,	0x5
	fzero	%f4
	sir	0x0D6A
	umul	%l0,	0x188E,	%i4
	movl	%icc,	%o4,	%i5
	fmovsg	%icc,	%f2,	%f17
	ld	[%l7 + 0x28],	%f7
	fornot1	%f30,	%f22,	%f28
	fpadd16	%f4,	%f30,	%f18
	set	0x64, %i7
	lda	[%l7 + %i7] 0x0c,	%f29
	fmovda	%xcc,	%f7,	%f26
	ba	%icc,	loop_2521
	andn	%o5,	0x028C,	%g3
	fmovsne	%icc,	%f23,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2521:
	smulcc	%i1,	0x1348,	%i0
	alignaddrl	%g7,	%g1,	%l5
	xnor	%i3,	0x1FFF,	%o6
	stw	%o1,	[%l7 + 0x3C]
	addccc	%i6,	0x0FAC,	%i2
	fmovsge	%icc,	%f25,	%f6
	subc	%i7,	%o2,	%g6
	edge32l	%l6,	%l3,	%l2
	movrlz	%o7,	%l4,	%g4
	popc	%g2,	%o0
	nop
	setx	0x2373E923505D53A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	udivx	%g5,	0x17EE,	%l1
	bcc,a,pt	%xcc,	loop_2522
	bvs,a,pn	%xcc,	loop_2523
	mulx	%l0,	0x18BB,	%i4
	ble,a	%icc,	loop_2524
loop_2522:
	fmovrdgez	%o4,	%f24,	%f30
loop_2523:
	fcmpne16	%f8,	%f8,	%o3
	fxor	%f8,	%f2,	%f14
loop_2524:
	fbl	%fcc0,	loop_2525
	fbuge	%fcc2,	loop_2526
	movrgz	%o5,	%g3,	%i1
	tcs	%icc,	0x6
loop_2525:
	ble,a,pn	%xcc,	loop_2527
loop_2526:
	udivx	%i0,	0x15DF,	%g7
	set	0x4C, %o3
	lduwa	[%l7 + %o3] 0x88,	%g1
loop_2527:
	andcc	%l5,	0x1E2C,	%i3
	edge8ln	%i5,	%o6,	%i6
	brgz,a	%o1,	loop_2528
	sethi	0x18AA,	%i7
	fpadd16	%f16,	%f8,	%f30
	brgez	%o2,	loop_2529
loop_2528:
	bcc,a	loop_2530
	xnorcc	%g6,	0x19A5,	%l6
	sdivcc	%l3,	0x02C6,	%l2
loop_2529:
	ta	%xcc,	0x6
loop_2530:
	udiv	%i2,	0x1EE5,	%l4
	tg	%icc,	0x0
	movgu	%xcc,	%g4,	%g2
	smulcc	%o7,	0x1F61,	%g5
	subccc	%o0,	%l1,	%i4
	fmovrslez	%o4,	%f22,	%f14
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x26,	%l0
	edge8	%o5,	%g3,	%o3
	add	%i1,	%i0,	%g1
	fmovscc	%xcc,	%f0,	%f29
	sdivcc	%g7,	0x14BA,	%l5
	fbn,a	%fcc0,	loop_2531
	movle	%icc,	%i5,	%i3
	tn	%icc,	0x2
	alignaddrl	%i6,	%o6,	%i7
loop_2531:
	fmovsge	%icc,	%f23,	%f26
	wr	%g0,	0xeb,	%asi
	stwa	%o2,	[%l7 + 0x34] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x70A8F6250D49BFFC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xCB6ACA2CBC82DFD0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f10,	%f30
	or	%g6,	0x02FF,	%l6
	nop
	setx loop_2532, %l0, %l1
	jmpl %l1, %l3
	srl	%l2,	0x1C,	%i2
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2532:
	nop
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x18,	%f0
	te	%icc,	0x0
	fbul,a	%fcc3,	loop_2533
	edge8l	%o1,	%g4,	%l4
	bgu,pt	%xcc,	loop_2534
	fbu,a	%fcc2,	loop_2535
loop_2533:
	edge32ln	%o7,	%g5,	%g2
	fpsub32s	%f21,	%f23,	%f4
loop_2534:
	brgez	%l1,	loop_2536
loop_2535:
	fbule,a	%fcc3,	loop_2537
	fblg,a	%fcc1,	loop_2538
	taddcctv	%o0,	%o4,	%l0
loop_2536:
	movn	%icc,	%o5,	%g3
loop_2537:
	te	%xcc,	0x7
loop_2538:
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f20
	fxtod	%f20,	%f26
	orncc	%o3,	0x00D8,	%i1
	fmovrslz	%i4,	%f1,	%f12
	tcc	%icc,	0x4
	sir	0x199D
	tvs	%xcc,	0x7
	taddcc	%g1,	0x19BF,	%g7
	fnegs	%f1,	%f11
	sdiv	%i0,	0x1889,	%l5
	bcs	loop_2539
	fbue	%fcc2,	loop_2540
	movrlez	%i3,	0x38F,	%i5
	smul	%i6,	0x0B9F,	%i7
loop_2539:
	smulcc	%o2,	%o6,	%l6
loop_2540:
	fsrc1s	%f12,	%f13
	set	0x0, %o2
	stxa	%l3,	[%g0 + %o2] 0x5f
	subccc	%g6,	%l2,	%o1
	fsrc1	%f20,	%f4
	alignaddrl	%i2,	%g4,	%l4
	fone	%f18
	movre	%g5,	%o7,	%g2
	edge8	%l1,	%o0,	%o4
	orncc	%l0,	0x1E13,	%g3
	movleu	%icc,	%o3,	%i1
	fbl	%fcc0,	loop_2541
	xor	%i4,	0x1BD4,	%o5
	bge	%icc,	loop_2542
	fbul,a	%fcc3,	loop_2543
loop_2541:
	fbl,a	%fcc2,	loop_2544
	brgez,a	%g7,	loop_2545
loop_2542:
	sdivx	%g1,	0x1DB1,	%l5
loop_2543:
	nop
	setx	loop_2546,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2544:
	ldx	[%l7 + 0x48],	%i0
loop_2545:
	xnorcc	%i3,	0x1425,	%i5
	addccc	%i7,	%o2,	%o6
loop_2546:
	edge8l	%l6,	%l3,	%g6
	lduh	[%l7 + 0x60],	%l2
	movne	%xcc,	%o1,	%i6
	bcc,a,pt	%icc,	loop_2547
	xor	%i2,	0x0137,	%g4
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2547:
	movvc	%xcc,	%g5,	%l4
	nop
	setx	0x607BB4CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	fmovdle	%icc,	%f23,	%f27
	edge8n	%o7,	%g2,	%o0
	ldsb	[%l7 + 0x18],	%o4
	fbge,a	%fcc0,	loop_2548
	nop
	setx	0xB5CED6A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f14
	tvc	%icc,	0x2
	fblg	%fcc2,	loop_2549
loop_2548:
	array8	%l0,	%l1,	%o3
	ldd	[%l7 + 0x58],	%f4
	tpos	%icc,	0x0
loop_2549:
	tle	%icc,	0x2
	fmul8x16au	%f22,	%f13,	%f20
	taddcctv	%i1,	%g3,	%o5
	and	%g7,	%i4,	%l5
	edge16l	%g1,	%i0,	%i3
	nop
	setx	0x2D08E5368E5E8353,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f20
	nop
	setx	loop_2550,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot1s	%f5,	%f2,	%f17
	movcs	%icc,	%i5,	%i7
	movgu	%xcc,	%o2,	%l6
loop_2550:
	fpadd32	%f24,	%f26,	%f2
	nop
	setx	loop_2551,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcc,a,pn	%icc,	loop_2552
	bcc	%xcc,	loop_2553
	movge	%xcc,	%l3,	%o6
loop_2551:
	te	%icc,	0x2
loop_2552:
	fxnor	%f22,	%f6,	%f22
loop_2553:
	bleu,a,pn	%xcc,	loop_2554
	sdiv	%g6,	0x09E8,	%l2
	mulx	%i6,	%o1,	%g4
	movrlz	%g5,	%l4,	%o7
loop_2554:
	movrgz	%i2,	0x1C0,	%o0
	subccc	%o4,	0x1EE6,	%g2
	subc	%l0,	0x15AC,	%o3
	fsrc2s	%f23,	%f8
	movleu	%icc,	%i1,	%l1
	ldx	[%l7 + 0x20],	%g3
	fmovdleu	%xcc,	%f3,	%f8
	ble,a	%xcc,	loop_2555
	tpos	%xcc,	0x4
	stbar
	fandnot1	%f24,	%f8,	%f10
loop_2555:
	fnegd	%f24,	%f4
	tneg	%xcc,	0x1
	edge8ln	%g7,	%i4,	%l5
	fbe,a	%fcc0,	loop_2556
	tcc	%xcc,	0x7
	edge32ln	%g1,	%i0,	%i3
	movl	%icc,	%o5,	%i7
loop_2556:
	fbul	%fcc3,	loop_2557
	subc	%i5,	%l6,	%o2
	edge16ln	%o6,	%g6,	%l3
	and	%i6,	%o1,	%l2
loop_2557:
	tn	%xcc,	0x6
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
	edge8n	%g4,	%l4,	%o7
	edge16n	%g5,	%i2,	%o0
	umulcc	%o4,	%l0,	%o3
loop_2558:
	brlez,a	%i1,	loop_2559
	move	%icc,	%l1,	%g2
	movleu	%icc,	%g3,	%g7
	brlz,a	%l5,	loop_2560
loop_2559:
	nop
	setx	loop_2561,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%i4,	%g1,	%i0
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x14
loop_2560:
	fmovsleu	%icc,	%f31,	%f26
loop_2561:
	fmovrdlz	%i3,	%f22,	%f14
	ta	%xcc,	0x2
	addcc	%i7,	%o5,	%l6
	xnorcc	%i5,	%o6,	%o2
	fmovsl	%icc,	%f9,	%f0
	edge32l	%g6,	%i6,	%o1
	srax	%l2,	%l3,	%g4
	addcc	%o7,	0x1724,	%l4
	fandnot2s	%f1,	%f13,	%f27
	nop
	setx	loop_2562,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%i2,	%g5,	%o0
	edge32n	%l0,	%o4,	%o3
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
loop_2562:
	mova	%xcc,	%g2,	%l1
	fmovsle	%xcc,	%f23,	%f23
	sllx	%g3,	0x0F,	%l5
	tcs	%xcc,	0x4
	nop
	setx	0xBC2B40FCC04B724A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	subc	%i4,	%g7,	%i0
	fmovscc	%xcc,	%f22,	%f1
	movcc	%xcc,	%i3,	%i7
	udiv	%g1,	0x0B61,	%o5
	fcmpeq32	%f20,	%f6,	%l6
	addcc	%i5,	%o6,	%g6
	movrne	%o2,	0x207,	%o1
	tneg	%icc,	0x6
	sra	%i6,	%l2,	%l3
	set	0x7E, %l4
	ldsha	[%l7 + %l4] 0x81,	%g4
	sethi	0x12CD,	%o7
	ld	[%l7 + 0x08],	%f14
	fmovda	%icc,	%f20,	%f12
	orncc	%l4,	0x1A6F,	%i2
	tsubcctv	%o0,	0x04CD,	%l0
	or	%g5,	%o3,	%o4
	std	%f26,	[%l7 + 0x70]
	brnz,a	%i1,	loop_2563
	smul	%g2,	%l1,	%g3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%l5
loop_2563:
	edge16ln	%i4,	%g7,	%i3
	fblg,a	%fcc2,	loop_2564
	movrgz	%i0,	0x3C4,	%g1
	movvs	%xcc,	%i7,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2564:
	ldstub	[%l7 + 0x1E],	%i5
	bleu,a,pn	%icc,	loop_2565
	mulscc	%o5,	0x0D45,	%o6
	sll	%g6,	%o2,	%o1
	udiv	%l2,	0x13BD,	%l3
loop_2565:
	bn	loop_2566
	fmuld8ulx16	%f17,	%f14,	%f6
	smul	%g4,	%o7,	%l4
	addc	%i2,	%o0,	%i6
loop_2566:
	nop
	setx	0xA05B54C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	fmovdvc	%xcc,	%f2,	%f4
	swap	[%l7 + 0x78],	%l0
	tn	%xcc,	0x2
	xor	%o3,	0x0426,	%g5
	fcmpeq32	%f18,	%f30,	%i1
	addc	%o4,	%l1,	%g2
	brz	%l5,	loop_2567
	udivcc	%i4,	0x05C1,	%g3
	fornot2s	%f21,	%f10,	%f9
	stw	%i3,	[%l7 + 0x70]
loop_2567:
	nop
	set	0x2C, %i4
	lduwa	[%l7 + %i4] 0x11,	%g7
	fmovscs	%icc,	%f20,	%f28
	subc	%g1,	0x08BF,	%i7
	movpos	%icc,	%i0,	%l6
	udivx	%o5,	0x0C66,	%i5
	andncc	%o6,	%o2,	%g6
	movrlz	%l2,	0x31D,	%o1
	tcs	%xcc,	0x6
	tn	%icc,	0x4
	fnot1s	%f0,	%f21
	ba,a,pt	%xcc,	loop_2568
	tge	%icc,	0x5
	orncc	%l3,	0x0986,	%g4
	nop
	setx	loop_2569,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2568:
	edge32ln	%o7,	%i2,	%o0
	fnegd	%f20,	%f26
	sra	%i6,	%l0,	%o3
loop_2569:
	alignaddrl	%l4,	%g5,	%i1
	movrgz	%l1,	%o4,	%l5
	srlx	%i4,	%g2,	%i3
	movge	%icc,	%g3,	%g1
	tleu	%xcc,	0x4
	tcs	%xcc,	0x6
	fmovrdlz	%g7,	%f4,	%f18
	brgez	%i0,	loop_2570
	array8	%l6,	%o5,	%i5
	movcs	%xcc,	%i7,	%o2
	fmul8x16al	%f2,	%f16,	%f24
loop_2570:
	tcc	%xcc,	0x4
	fmuld8ulx16	%f18,	%f11,	%f16
	fpadd32s	%f18,	%f7,	%f11
	fmovsn	%icc,	%f31,	%f17
	edge8n	%o6,	%g6,	%l2
	be,a	loop_2571
	movge	%xcc,	%o1,	%g4
	srlx	%l3,	0x16,	%i2
	stx	%o7,	[%l7 + 0x70]
loop_2571:
	fsrc1s	%f22,	%f29
	tcs	%xcc,	0x2
	addc	%i6,	%o0,	%l0
	fmovrsgz	%l4,	%f5,	%f27
	add	%g5,	%o3,	%i1
	fmuld8sux16	%f28,	%f18,	%f2
	andncc	%o4,	%l5,	%i4
	edge16ln	%l1,	%i3,	%g3
	edge16ln	%g1,	%g2,	%i0
	nop
	set	0x70, %l0
	stx	%l6,	[%l7 + %l0]
	nop
	fitos	%f5,	%f19
	fstox	%f19,	%f2
	movrlz	%o5,	0x277,	%g7
	nop
	fitos	%f0,	%f15
	fstox	%f15,	%f30
	fxtos	%f30,	%f20
	edge8n	%i5,	%i7,	%o6
	movvs	%xcc,	%o2,	%l2
	nop
	setx	0x2D95C03C315525EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f0
	andcc	%g6,	%o1,	%g4
	bpos,a,pt	%xcc,	loop_2572
	fones	%f25
	edge16l	%i2,	%o7,	%i6
	tgu	%icc,	0x2
loop_2572:
	ldub	[%l7 + 0x12],	%l3
	edge8n	%o0,	%l0,	%l4
	wr	%g0,	0x27,	%asi
	stba	%o3,	[%l7 + 0x2E] %asi
	membar	#Sync
	edge32	%i1,	%g5,	%o4
	stw	%l5,	[%l7 + 0x58]
	srl	%i4,	%l1,	%g3
	set	0x68, %o7
	lduwa	[%l7 + %o7] 0x19,	%i3
	edge8ln	%g2,	%g1,	%l6
	subcc	%o5,	%i0,	%g7
	fmovdg	%icc,	%f12,	%f13
	movne	%xcc,	%i7,	%i5
	nop
	fitos	%f4,	%f17
	fstox	%f17,	%f12
	te	%xcc,	0x1
	edge32l	%o2,	%l2,	%g6
	nop
	setx	0xA28AA7D387E62E43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xA65F05DF41E63496,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f28,	%f20
	std	%f28,	[%l7 + 0x78]
	fnand	%f22,	%f0,	%f24
	tvs	%xcc,	0x7
	movgu	%xcc,	%o1,	%o6
	movcc	%icc,	%g4,	%i2
	fmovrdgz	%o7,	%f16,	%f28
	srax	%l3,	%o0,	%l0
	fsrc2	%f22,	%f6
	stw	%i6,	[%l7 + 0x24]
	ldsw	[%l7 + 0x0C],	%l4
	array8	%o3,	%i1,	%g5
	fmovrde	%o4,	%f24,	%f4
	andcc	%l5,	%l1,	%i4
	movcc	%icc,	%i3,	%g2
	xnor	%g3,	0x00A4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%o5,	loop_2573
	lduw	[%l7 + 0x40],	%l6
	bne,pn	%icc,	loop_2574
	fble	%fcc2,	loop_2575
loop_2573:
	sub	%i0,	0x0786,	%i7
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%g7
loop_2574:
	alignaddr	%o2,	%l2,	%g6
loop_2575:
	edge8ln	%o1,	%o6,	%i5
	tne	%icc,	0x1
	set	0x10, %o4
	stwa	%g4,	[%l7 + %o4] 0x15
	fsrc2s	%f22,	%f0
	bg,a,pt	%icc,	loop_2576
	movneg	%xcc,	%o7,	%l3
	fmovsg	%icc,	%f12,	%f20
	tvs	%xcc,	0x5
loop_2576:
	ta	%xcc,	0x1
	fcmpne32	%f14,	%f16,	%i2
	mulx	%o0,	0x176C,	%l0
	movpos	%xcc,	%i6,	%l4
	bcs,pt	%icc,	loop_2577
	movvs	%icc,	%o3,	%g5
	edge16l	%o4,	%l5,	%i1
	and	%l1,	0x07E9,	%i3
loop_2577:
	st	%f8,	[%l7 + 0x24]
	set	0x38, %g3
	prefetcha	[%l7 + %g3] 0x14,	 0x0
	fmovdvs	%icc,	%f3,	%f29
	addcc	%g2,	%g3,	%o5
	popc	0x08EB,	%g1
	bge	loop_2578
	fmovrslz	%i0,	%f27,	%f25
	umul	%i7,	%g7,	%o2
	fand	%f20,	%f20,	%f4
loop_2578:
	array16	%l2,	%g6,	%o1
	array16	%l6,	%i5,	%o6
	smul	%o7,	%l3,	%g4
	set	0x0A, %l2
	ldsha	[%l7 + %l2] 0x0c,	%o0
	andcc	%i2,	0x1BF2,	%l0
	movn	%xcc,	%i6,	%l4
	fbge,a	%fcc0,	loop_2579
	movrgz	%g5,	0x1EE,	%o3
	andn	%l5,	0x1152,	%o4
	tneg	%xcc,	0x7
loop_2579:
	srax	%l1,	%i3,	%i1
	fmuld8sux16	%f17,	%f24,	%f10
	andncc	%g2,	%i4,	%o5
	addcc	%g3,	0x07B3,	%g1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x52] %asi,	%i7
	tge	%xcc,	0x7
	fmovda	%xcc,	%f28,	%f15
	edge16	%i0,	%g7,	%o2
	bg	loop_2580
	movl	%xcc,	%g6,	%o1
	stx	%l6,	[%l7 + 0x20]
	orncc	%i5,	0x13BA,	%o6
loop_2580:
	xorcc	%o7,	%l2,	%l3
	movleu	%icc,	%g4,	%o0
	smulcc	%l0,	%i6,	%l4
	srax	%i2,	0x06,	%o3
	mulx	%g5,	0x01B8,	%l5
	movcc	%icc,	%l1,	%i3
	fmovrsne	%o4,	%f29,	%f3
	addcc	%g2,	0x01E6,	%i4
	smul	%o5,	0x1FD2,	%i1
	movleu	%icc,	%g3,	%g1
	fbul	%fcc3,	loop_2581
	edge32n	%i0,	%i7,	%o2
	edge8n	%g6,	%g7,	%o1
	movge	%xcc,	%i5,	%o6
loop_2581:
	bgu,pt	%xcc,	loop_2582
	and	%o7,	%l6,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_2583,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2582:
	call	loop_2584
	taddcctv	%l3,	0x14F7,	%g4
	mulscc	%o0,	%i6,	%l4
loop_2583:
	fnot1	%f0,	%f6
loop_2584:
	membar	0x36
	fbn	%fcc1,	loop_2585
	srlx	%l0,	%o3,	%g5
	udiv	%i2,	0x015E,	%l1
	st	%f22,	[%l7 + 0x40]
loop_2585:
	addc	%l5,	0x13B9,	%i3
	edge32	%g2,	%i4,	%o5
	orncc	%i1,	0x1D6E,	%o4
	ldub	[%l7 + 0x58],	%g1
	bneg,a,pn	%icc,	loop_2586
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i0,	0x189F,	%i7
	fnands	%f16,	%f2,	%f16
loop_2586:
	array8	%g3,	%g6,	%o2
	set	0x56, %o6
	ldsha	[%l7 + %o6] 0x19,	%o1
	lduh	[%l7 + 0x50],	%g7
	srl	%o6,	%o7,	%l6
	brgz,a	%i5,	loop_2587
	fbg,a	%fcc1,	loop_2588
	nop
	setx	0xF9CBCB2707DA67EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xFB13AF6AEF538CFF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f24,	%f28
	movre	%l3,	0x23D,	%l2
loop_2587:
	bn,pn	%xcc,	loop_2589
loop_2588:
	fmovrdlez	%o0,	%f4,	%f30
	mova	%xcc,	%g4,	%i6
	mova	%icc,	%l0,	%l4
loop_2589:
	edge16ln	%o3,	%g5,	%i2
	tle	%xcc,	0x1
	tne	%icc,	0x5
	smulcc	%l5,	0x1505,	%l1
	addccc	%i3,	0x1BA2,	%g2
	fbge	%fcc1,	loop_2590
	movrne	%i4,	%o5,	%o4
	be,a	loop_2591
	array8	%i1,	%g1,	%i7
loop_2590:
	sethi	0x0D84,	%i0
	bvc,a,pn	%xcc,	loop_2592
loop_2591:
	fmovdneg	%icc,	%f10,	%f23
	fmovse	%xcc,	%f19,	%f17
	movrgez	%g3,	0x33D,	%o2
loop_2592:
	fsrc2	%f28,	%f28
	xorcc	%o1,	0x1C1A,	%g6
	nop
	set	0x58, %i1
	std	%f6,	[%l7 + %i1]
	edge16n	%g7,	%o6,	%o7
	srax	%i5,	0x01,	%l3
	srax	%l6,	%l2,	%o0
	fbl	%fcc0,	loop_2593
	fmovda	%icc,	%f17,	%f22
	edge32ln	%g4,	%l0,	%i6
	umulcc	%l4,	%g5,	%i2
loop_2593:
	udiv	%o3,	0x0EDD,	%l1
	bleu,pn	%icc,	loop_2594
	fmovsvc	%icc,	%f3,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x4
loop_2594:
	fmovsneg	%icc,	%f8,	%f2
	edge32ln	%i3,	%l5,	%i4
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f24
	fxtod	%f24,	%f2
	fmovdn	%icc,	%f19,	%f27
	edge8n	%g2,	%o5,	%i1
	fbug	%fcc0,	loop_2595
	array16	%o4,	%i7,	%g1
	or	%i0,	0x0B98,	%g3
	edge16n	%o1,	%o2,	%g6
loop_2595:
	movrgz	%o6,	0x1E7,	%o7
	nop
	setx	loop_2596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdgu	%xcc,	%f18,	%f23
	fcmple32	%f30,	%f0,	%g7
	tg	%icc,	0x5
loop_2596:
	array16	%l3,	%i5,	%l2
	membar	0x01
	fbue,a	%fcc1,	loop_2597
	smul	%l6,	%o0,	%l0
	bpos,a	%icc,	loop_2598
	fmovrslez	%i6,	%f14,	%f12
loop_2597:
	nop
	fitos	%f12,	%f23
	fstod	%f23,	%f2
	fmovdvc	%xcc,	%f10,	%f4
loop_2598:
	tle	%icc,	0x0
	ldub	[%l7 + 0x31],	%l4
	tcs	%icc,	0x7
	bpos,a	loop_2599
	movvc	%xcc,	%g4,	%g5
	movle	%icc,	%i2,	%l1
	ld	[%l7 + 0x08],	%f7
loop_2599:
	bleu,a	loop_2600
	alignaddr	%i3,	%o3,	%l5
	taddcc	%i4,	%g2,	%o5
	ldd	[%l7 + 0x58],	%f22
loop_2600:
	tvc	%icc,	0x1
	set	0x5A, %g6
	stha	%o4,	[%l7 + %g6] 0xeb
	membar	#Sync
	fmul8sux16	%f28,	%f22,	%f24
	umulcc	%i7,	%g1,	%i1
	addc	%g3,	0x1933,	%i0
	alignaddr	%o1,	%g6,	%o2
	movcc	%icc,	%o7,	%g7
	addc	%o6,	%i5,	%l2
	nop
	fitos	%f1,	%f21
	fstox	%f21,	%f2
	fxtos	%f2,	%f16
	fmovsle	%xcc,	%f24,	%f19
	bgu,a,pn	%icc,	loop_2601
	fnand	%f30,	%f22,	%f10
	udiv	%l6,	0x1497,	%l3
	stbar
loop_2601:
	tsubcctv	%l0,	%i6,	%l4
	tvs	%xcc,	0x6
	andncc	%g4,	%g5,	%i2
	ldd	[%l7 + 0x30],	%l0
	st	%f16,	[%l7 + 0x10]
	addccc	%i3,	%o0,	%l5
	nop
	setx	0xA6FD9648,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xE2BDA15D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f23,	%f30
	fcmpne16	%f14,	%f28,	%i4
	fpadd16s	%f24,	%f19,	%f10
	tcs	%icc,	0x5
	xnor	%o3,	%g2,	%o5
	srlx	%i7,	0x01,	%o4
	orcc	%i1,	0x0F29,	%g1
	movleu	%xcc,	%i0,	%o1
	tneg	%icc,	0x5
	edge16l	%g3,	%g6,	%o7
	edge16n	%g7,	%o2,	%i5
	tne	%icc,	0x6
	fmovsle	%icc,	%f6,	%f12
	fbuge,a	%fcc2,	loop_2602
	fbuge,a	%fcc1,	loop_2603
	taddcc	%l2,	0x0CDE,	%o6
	fpsub32	%f20,	%f18,	%f20
loop_2602:
	fnors	%f24,	%f3,	%f31
loop_2603:
	taddcc	%l6,	%l3,	%l0
	edge8l	%l4,	%i6,	%g4
	nop
	setx	0x25354E9FD04E3C61,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	taddcc	%i2,	0x0658,	%l1
	nop
	fitod	%f8,	%f0
	fdtos	%f0,	%f8
	sra	%i3,	%g5,	%o0
	fmovrsne	%i4,	%f27,	%f5
	edge32	%l5,	%g2,	%o3
	faligndata	%f26,	%f12,	%f30
	bvc,a,pn	%xcc,	loop_2604
	nop
	setx	loop_2605,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%xcc,	%o5,	%i7
	movl	%icc,	%o4,	%g1
loop_2604:
	sll	%i1,	%o1,	%i0
loop_2605:
	nop
	set	0x42, %i6
	ldsba	[%l7 + %i6] 0x18,	%g6
	brgez	%g3,	loop_2606
	udivcc	%g7,	0x1C7E,	%o7
	sllx	%i5,	%l2,	%o2
	movgu	%xcc,	%l6,	%l3
loop_2606:
	faligndata	%f8,	%f0,	%f0
	xor	%l0,	0x056E,	%o6
	ba,a,pn	%icc,	loop_2607
	move	%icc,	%i6,	%l4
	xor	%i2,	%l1,	%g4
	edge8ln	%i3,	%o0,	%i4
loop_2607:
	nop
	wr	%g0,	0x80,	%asi
	stha	%l5,	[%l7 + 0x1A] %asi
	addcc	%g5,	%o3,	%o5
	brnz,a	%g2,	loop_2608
	sdiv	%o4,	0x13C3,	%i7
	taddcctv	%g1,	0x0336,	%o1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i1
loop_2608:
	fnot2s	%f10,	%f13
	orcc	%g6,	0x0BF1,	%i0
	fxnor	%f8,	%f6,	%f22
	fnors	%f13,	%f12,	%f31
	srl	%g7,	0x03,	%o7
	movcc	%xcc,	%g3,	%l2
	set	0x20, %o0
	ldda	[%l7 + %o0] 0x88,	%i4
	movleu	%xcc,	%l6,	%o2
	tge	%xcc,	0x5
	movpos	%icc,	%l3,	%l0
	nop
	setx loop_2609, %l0, %l1
	jmpl %l1, %o6
	fexpand	%f8,	%f20
	fmovrdgez	%l4,	%f10,	%f26
	move	%xcc,	%i6,	%i2
loop_2609:
	edge32n	%l1,	%g4,	%i3
	edge8ln	%o0,	%l5,	%g5
	array8	%i4,	%o3,	%g2
	fandnot2s	%f12,	%f6,	%f23
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f8,	%f14,	%o4
	srax	%i7,	0x1A,	%o5
	fmovrsgez	%o1,	%f16,	%f15
	udiv	%g1,	0x127A,	%i1
	tpos	%xcc,	0x5
	fxors	%f13,	%f27,	%f20
	subc	%g6,	%i0,	%o7
	tg	%xcc,	0x0
	brgz	%g3,	loop_2610
	smulcc	%g7,	0x0F65,	%l2
	tl	%icc,	0x5
	fmovsa	%xcc,	%f4,	%f18
loop_2610:
	or	%l6,	0x113A,	%i5
	tge	%xcc,	0x0
	and	%o2,	%l3,	%o6
	srax	%l0,	%l4,	%i2
	xorcc	%i6,	0x0581,	%g4
	fbul	%fcc0,	loop_2611
	fmovdpos	%xcc,	%f28,	%f7
	movneg	%icc,	%l1,	%i3
	set	0x70, %g5
	stwa	%o0,	[%l7 + %g5] 0x2a
	membar	#Sync
loop_2611:
	fmuld8sux16	%f19,	%f16,	%f6
	nop
	setx	0xE02B6AD5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x30F4ACBD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f4,	%f31
	movrgz	%g5,	0x30E,	%i4
	ldstub	[%l7 + 0x5D],	%l5
	fone	%f4
	movvs	%icc,	%o3,	%g2
	fxor	%f8,	%f6,	%f2
	nop
	set	0x0C, %o1
	ldstub	[%l7 + %o1],	%i7
	movleu	%icc,	%o5,	%o4
	andn	%o1,	%i1,	%g6
	taddcc	%g1,	0x1D6E,	%i0
	fmul8ulx16	%f28,	%f26,	%f20
	taddcc	%o7,	%g3,	%l2
	membar	0x6E
	fandnot1	%f28,	%f12,	%f24
	movvs	%xcc,	%l6,	%g7
	fmovdvs	%xcc,	%f15,	%f11
	nop
	setx	0xB062D207,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	orn	%o2,	0x19F2,	%l3
	movcc	%xcc,	%o6,	%l0
	nop
	setx	loop_2612,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stb	%l4,	[%l7 + 0x33]
	edge16l	%i5,	%i2,	%g4
	edge16	%i6,	%i3,	%l1
loop_2612:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x88,	%g5,	%i4
	movcs	%xcc,	%l5,	%o3
	fbu,a	%fcc1,	loop_2613
	bpos	%icc,	loop_2614
	mulx	%g2,	%i7,	%o0
	edge8l	%o4,	%o1,	%o5
loop_2613:
	edge8l	%i1,	%g1,	%g6
loop_2614:
	tge	%icc,	0x2
	movl	%xcc,	%i0,	%o7
	movne	%icc,	%g3,	%l2
	move	%xcc,	%g7,	%o2
	set	0x48, %g2
	lduha	[%l7 + %g2] 0x88,	%l3
	tcc	%xcc,	0x3
	set	0x54, %l5
	ldswa	[%l7 + %l5] 0x0c,	%o6
	fmovdneg	%icc,	%f6,	%f1
	tle	%icc,	0x1
	bl	%icc,	loop_2615
	orncc	%l0,	0x06CD,	%l4
	movrgez	%i5,	%i2,	%g4
	edge32ln	%l6,	%i3,	%i6
loop_2615:
	movneg	%icc,	%g5,	%i4
	fbule,a	%fcc1,	loop_2616
	taddcctv	%l5,	0x1CFB,	%o3
	fpsub32s	%f11,	%f27,	%f1
	movn	%icc,	%l1,	%g2
loop_2616:
	st	%f0,	[%l7 + 0x74]
	edge32	%i7,	%o4,	%o0
	tvc	%xcc,	0x6
	bg	loop_2617
	movrgz	%o5,	0x280,	%o1
	fxnor	%f12,	%f18,	%f10
	umulcc	%g1,	%g6,	%i1
loop_2617:
	nop
	setx	loop_2618,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8ulx16	%f6,	%f6,	%f22
	tneg	%xcc,	0x0
	edge32n	%i0,	%g3,	%o7
loop_2618:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l2,	%g7
	fmovdneg	%xcc,	%f9,	%f25
	nop
	setx	loop_2619,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%l3,	%o2,	%l0
	movcs	%xcc,	%l4,	%o6
	orcc	%i5,	%g4,	%l6
loop_2619:
	tsubcctv	%i2,	%i6,	%g5
	fmul8x16al	%f15,	%f20,	%f10
	smul	%i4,	%i3,	%o3
	fmul8x16	%f12,	%f12,	%f22
	nop
	setx	0x4E820B4B5B980435,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x68013336F44BC94E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f4,	%f20
	addcc	%l5,	%g2,	%i7
	movre	%o4,	0x29D,	%o0
	movl	%xcc,	%l1,	%o5
	edge8	%g1,	%g6,	%o1
	fmovdleu	%icc,	%f22,	%f2
	brgez,a	%i0,	loop_2620
	edge32	%g3,	%o7,	%l2
	fmovda	%xcc,	%f18,	%f9
	nop
	fitos	%f2,	%f3
	fstoi	%f3,	%f3
loop_2620:
	edge8n	%g7,	%l3,	%i1
	subccc	%o2,	0x1F4A,	%l0
	lduh	[%l7 + 0x4C],	%o6
	tcs	%xcc,	0x1
	fmovrde	%l4,	%f2,	%f0
	move	%icc,	%i5,	%l6
	fmovsvs	%xcc,	%f30,	%f0
	tcs	%xcc,	0x5
	fmovspos	%xcc,	%f11,	%f22
	srl	%i2,	%g4,	%i6
	movvc	%icc,	%i4,	%i3
	taddcctv	%o3,	0x1EF3,	%g5
	alignaddrl	%l5,	%i7,	%g2
	srax	%o4,	0x15,	%l1
	fbug,a	%fcc2,	loop_2621
	movcs	%xcc,	%o5,	%o0
	sllx	%g6,	%g1,	%o1
	nop
	setx	0x3C5B86C2104018AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
loop_2621:
	tn	%xcc,	0x3
	edge16l	%i0,	%o7,	%l2
	ta	%xcc,	0x7
	movrgez	%g3,	0x3E2,	%g7
	bneg,a	%icc,	loop_2622
	edge16n	%l3,	%o2,	%i1
	edge32n	%o6,	%l4,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2622:
	fbu	%fcc2,	loop_2623
	umulcc	%i5,	0x1FF1,	%i2
	addcc	%l6,	%i6,	%g4
	array32	%i3,	%o3,	%i4
loop_2623:
	tvs	%icc,	0x7
	fbu	%fcc2,	loop_2624
	alignaddrl	%g5,	%l5,	%g2
	movrgez	%i7,	%o4,	%l1
	tcs	%xcc,	0x6
loop_2624:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%o5
	fba,a	%fcc1,	loop_2625
	fornot1s	%f25,	%f13,	%f28
	addcc	%o0,	0x0EF0,	%g6
	ldd	[%l7 + 0x18],	%g0
loop_2625:
	fmovdcs	%xcc,	%f18,	%f3
	srax	%i0,	%o7,	%l2
	alignaddrl	%o1,	%g7,	%l3
	for	%f12,	%f22,	%f10
	movrlz	%g3,	%o2,	%i1
	edge16	%o6,	%l0,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i2,	%l4,	%l6
	edge32n	%g4,	%i3,	%i6
	movleu	%icc,	%o3,	%i4
	fmovd	%f16,	%f26
	fmovrdgez	%g5,	%f18,	%f6
	wr	%g0,	0x04,	%asi
	sta	%f28,	[%l7 + 0x28] %asi
	tleu	%icc,	0x6
	fmovsvc	%icc,	%f29,	%f20
	edge8n	%l5,	%i7,	%o4
	bge,pn	%xcc,	loop_2626
	xorcc	%l1,	0x113A,	%g2
	movcc	%xcc,	%o5,	%o0
	tl	%icc,	0x0
loop_2626:
	tsubcc	%g6,	0x0E1E,	%i0
	alignaddr	%o7,	%g1,	%l2
	tge	%icc,	0x5
	fcmpne32	%f16,	%f6,	%g7
	tcs	%xcc,	0x2
	membar	0x3E
	move	%icc,	%l3,	%g3
	move	%xcc,	%o2,	%o1
	sub	%o6,	0x1157,	%i1
	xor	%i5,	%i2,	%l4
	edge32ln	%l0,	%l6,	%g4
	call	loop_2627
	fmovrdne	%i3,	%f22,	%f24
	xnor	%o3,	%i6,	%g5
	nop
	fitod	%f26,	%f6
loop_2627:
	fmovs	%f0,	%f1
	movrgz	%i4,	%l5,	%i7
	alignaddrl	%o4,	%g2,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o0,	%l1,	%g6
	movvc	%xcc,	%o7,	%g1
	array8	%i0,	%l2,	%g7
	ld	[%l7 + 0x44],	%f11
	fbug,a	%fcc1,	loop_2628
	sra	%l3,	0x14,	%o2
	subccc	%o1,	0x0669,	%o6
	edge8	%g3,	%i5,	%i2
loop_2628:
	mova	%xcc,	%l4,	%l0
	tcc	%icc,	0x7
	membar	0x2B
	nop
	set	0x20, %i5
	std	%f24,	[%l7 + %i5]
	edge32ln	%i1,	%l6,	%g4
	sdivcc	%o3,	0x1BE4,	%i6
	tpos	%icc,	0x3
	set	0x78, %i2
	stha	%g5,	[%l7 + %i2] 0x19
	movrne	%i4,	0x007,	%i3
	tl	%icc,	0x7
	mulx	%i7,	0x0F96,	%l5
	bpos,pt	%icc,	loop_2629
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
	edge32l	%g2,	%o5,	%o4
	movrlez	%l1,	0x0FC,	%g6
loop_2629:
	movcc	%xcc,	%o7,	%o0
loop_2630:
	brgz	%g1,	loop_2631
	nop
	setx	0xB05D53A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	movle	%xcc,	%l2,	%i0
	fxor	%f30,	%f22,	%f16
loop_2631:
	fbul	%fcc1,	loop_2632
	bg,pn	%icc,	loop_2633
	fmovscc	%icc,	%f15,	%f11
	edge16ln	%g7,	%l3,	%o2
loop_2632:
	edge8ln	%o1,	%o6,	%g3
loop_2633:
	ba,a	%xcc,	loop_2634
	srax	%i2,	%i5,	%l4
	lduh	[%l7 + 0x7A],	%i1
	sdivx	%l0,	0x0D2C,	%l6
loop_2634:
	movge	%icc,	%g4,	%o3
	bcs,pt	%xcc,	loop_2635
	tneg	%icc,	0x2
	edge32	%g5,	%i6,	%i4
	stx	%i7,	[%l7 + 0x38]
loop_2635:
	xor	%i3,	%g2,	%l5
	umul	%o4,	%o5,	%l1
	set	0x36, %g4
	stha	%g6,	[%l7 + %g4] 0x14
	taddcctv	%o7,	%g1,	%o0
	tvc	%xcc,	0x3
	fnot2	%f2,	%f4
	ldsb	[%l7 + 0x3B],	%i0
	sub	%l2,	0x1AA1,	%l3
	brlz,a	%o2,	loop_2636
	mulx	%o1,	0x0781,	%o6
	udivx	%g3,	0x0D34,	%g7
	fmovrdlez	%i5,	%f30,	%f20
loop_2636:
	movle	%xcc,	%l4,	%i1
	array32	%l0,	%l6,	%i2
	ldx	[%l7 + 0x60],	%o3
	and	%g5,	0x0E48,	%g4
	ldstub	[%l7 + 0x61],	%i6
	ldstub	[%l7 + 0x4A],	%i7
	bvs,a,pn	%xcc,	loop_2637
	faligndata	%f12,	%f28,	%f28
	fmovsg	%icc,	%f18,	%f13
	tg	%xcc,	0x5
loop_2637:
	movrlez	%i3,	0x32B,	%i4
	smul	%l5,	0x145C,	%g2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	fmul8x16	%f10,	%f26,	%f2
	fbn,a	%fcc2,	loop_2638
	edge16	%o4,	%g6,	%o7
	addc	%g1,	%l1,	%i0
	umulcc	%l2,	%o0,	%l3
loop_2638:
	edge8	%o1,	%o2,	%g3
	movre	%g7,	0x18E,	%i5
	fsrc2	%f26,	%f0
	ld	[%l7 + 0x48],	%f13
	movpos	%icc,	%o6,	%l4
	sra	%i1,	%l0,	%i2
	fpsub16s	%f15,	%f7,	%f29
	tcs	%xcc,	0x6
	addcc	%l6,	%o3,	%g4
	sir	0x1203
	edge8n	%g5,	%i7,	%i3
	nop
	fitos	%f5,	%f8
	fstod	%f8,	%f8
	flush	%l7 + 0x74
	set	0x5C, %l1
	lduwa	[%l7 + %l1] 0x11,	%i6
	orcc	%l5,	%g2,	%o5
	sll	%o4,	%i4,	%g6
	bvs,a	%xcc,	loop_2639
	ldd	[%l7 + 0x48],	%g0
	fmovrsne	%o7,	%f22,	%f26
	orcc	%l1,	%l2,	%i0
loop_2639:
	udivcc	%l3,	0x05FC,	%o1
	membar	0x76
	fba	%fcc3,	loop_2640
	orn	%o2,	%g3,	%o0
	andn	%g7,	%o6,	%l4
	tl	%icc,	0x3
loop_2640:
	fmovsvs	%icc,	%f17,	%f9
	andn	%i1,	%l0,	%i5
	movl	%xcc,	%i2,	%o3
	ldd	[%l7 + 0x30],	%i6
	tvc	%xcc,	0x2
	fmovrdne	%g5,	%f2,	%f14
	sll	%i7,	%i3,	%i6
	movpos	%icc,	%l5,	%g4
	movcs	%icc,	%o5,	%g2
	addccc	%o4,	%i4,	%g1
	fmul8sux16	%f12,	%f6,	%f8
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x10] %asi,	%o7
	andcc	%g6,	0x0B08,	%l1
	fpsub16s	%f23,	%f2,	%f11
	umulcc	%l2,	0x1E0F,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o1,	0x052E,	%o2
	ta	%xcc,	0x6
	udivx	%g3,	0x0697,	%i0
	stx	%o0,	[%l7 + 0x10]
	edge16l	%o6,	%g7,	%i1
	fmovrslz	%l0,	%f12,	%f12
	udivx	%l4,	0x17E2,	%i2
	addccc	%o3,	0x015B,	%i5
	tcc	%icc,	0x2
	for	%f12,	%f14,	%f14
	nop
	setx	loop_2641,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlez	%g5,	loop_2642
	te	%xcc,	0x4
	fmovrde	%l6,	%f6,	%f0
loop_2641:
	addc	%i3,	%i6,	%l5
loop_2642:
	fand	%f2,	%f4,	%f18
	movpos	%xcc,	%i7,	%g4
	ldub	[%l7 + 0x45],	%g2
	fbo,a	%fcc0,	loop_2643
	fmovrdlz	%o4,	%f18,	%f26
	fandnot1s	%f27,	%f4,	%f23
	fmul8sux16	%f26,	%f26,	%f12
loop_2643:
	move	%xcc,	%o5,	%i4
	tge	%xcc,	0x4
	movcc	%xcc,	%g1,	%g6
	nop
	fitos	%f12,	%f11
	movrlz	%l1,	%l2,	%l3
	fbne,a	%fcc0,	loop_2644
	sllx	%o1,	%o7,	%g3
	bgu	%icc,	loop_2645
	be	loop_2646
loop_2644:
	srax	%i0,	0x08,	%o2
	movrlz	%o0,	%g7,	%i1
loop_2645:
	smulcc	%l0,	0x01C2,	%o6
loop_2646:
	xnorcc	%l4,	0x0B5E,	%o3
	fpack32	%f18,	%f12,	%f0
	andncc	%i5,	%i2,	%l6
	movrlz	%i3,	%g5,	%i6
	movrgz	%i7,	%l5,	%g4
	movvs	%icc,	%o4,	%g2
	sdiv	%i4,	0x0F8E,	%g1
	movcs	%icc,	%g6,	%l1
	movle	%icc,	%o5,	%l3
	edge32n	%l2,	%o1,	%g3
	fandnot2s	%f20,	%f25,	%f29
	ldstub	[%l7 + 0x61],	%o7
	fmovdvc	%xcc,	%f3,	%f2
	edge16n	%i0,	%o2,	%o0
	edge16n	%i1,	%g7,	%o6
	bge,a	loop_2647
	fmovsleu	%icc,	%f18,	%f23
	movgu	%icc,	%l4,	%o3
	fzeros	%f15
loop_2647:
	tleu	%xcc,	0x1
	xor	%l0,	0x171E,	%i5
	movrlez	%i2,	%l6,	%g5
	addccc	%i3,	0x0BB0,	%i6
	srl	%l5,	%i7,	%g4
	movneg	%xcc,	%o4,	%i4
	ldd	[%l7 + 0x30],	%f22
	bgu	loop_2648
	ldx	[%l7 + 0x78],	%g2
	smulcc	%g6,	%l1,	%g1
	orncc	%l3,	%o5,	%l2
loop_2648:
	fexpand	%f11,	%f2
	movgu	%icc,	%o1,	%g3
	set	0x68, %l6
	stwa	%o7,	[%l7 + %l6] 0x89
	movvc	%icc,	%o2,	%i0
	movre	%i1,	0x34A,	%g7
	nop
	setx	0xE12747DD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x29F3B1AA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f18,	%f31
	movpos	%xcc,	%o0,	%o6
	ldd	[%l7 + 0x30],	%o2
	popc	0x14A6,	%l4
	edge16	%l0,	%i2,	%i5
	add	%g5,	%i3,	%i6
	set	0x38, %g1
	prefetcha	[%l7 + %g1] 0x15,	 0x0
	fmovdcc	%icc,	%f1,	%f7
	movge	%xcc,	%i7,	%g4
	fbug	%fcc1,	loop_2649
	addcc	%l5,	0x0FCE,	%i4
	swap	[%l7 + 0x30],	%g2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x54] %asi,	%f24
loop_2649:
	tcs	%icc,	0x4
	sllx	%g6,	0x09,	%l1
	srlx	%o4,	0x19,	%g1
	fmovspos	%icc,	%f30,	%f15
	movpos	%xcc,	%o5,	%l3
	array16	%l2,	%o1,	%o7
	udiv	%o2,	0x191C,	%i0
	xnorcc	%i1,	%g3,	%o0
	fmovsa	%xcc,	%f15,	%f10
	fnor	%f28,	%f12,	%f14
	tneg	%xcc,	0x1
	movn	%xcc,	%o6,	%o3
	brgez	%l4,	loop_2650
	movge	%icc,	%l0,	%i2
	or	%g7,	0x0E18,	%g5
	edge32l	%i3,	%i6,	%i5
loop_2650:
	umul	%i7,	0x098F,	%l6
	tvc	%xcc,	0x5
	movg	%icc,	%g4,	%l5
	faligndata	%f14,	%f10,	%f6
	prefetch	[%l7 + 0x20],	 0x0
	be,a,pt	%icc,	loop_2651
	subcc	%i4,	0x0BD3,	%g2
	bneg,pt	%xcc,	loop_2652
	movle	%icc,	%g6,	%l1
loop_2651:
	tsubcctv	%o4,	%g1,	%l3
	fpadd16s	%f11,	%f11,	%f11
loop_2652:
	fmovsgu	%icc,	%f19,	%f15
	fmovsl	%icc,	%f26,	%f25
	popc	%o5,	%o1
	edge16ln	%o7,	%l2,	%i0
	tvc	%icc,	0x5
	sllx	%o2,	0x1C,	%g3
	ta	%icc,	0x6
	fmovdg	%icc,	%f12,	%f11
	taddcc	%i1,	%o0,	%o3
	tl	%icc,	0x3
	fand	%f30,	%f28,	%f26
	udivcc	%l4,	0x1B6F,	%o6
	nop
	set	0x66, %i0
	lduh	[%l7 + %i0],	%l0
	ble	loop_2653
	andcc	%g7,	%i2,	%i3
	brlez	%g5,	loop_2654
	ta	%xcc,	0x5
loop_2653:
	nop
	setx	0x27BECF1090FB83EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x5936360D50691D10,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f20,	%f22
	fnand	%f24,	%f8,	%f4
loop_2654:
	udivcc	%i6,	0x0E82,	%i5
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x59] %asi,	%l6
	edge16ln	%g4,	%i7,	%i4
	tvs	%xcc,	0x7
	sdivcc	%g2,	0x1DB3,	%g6
	xnorcc	%l1,	0x0121,	%o4
	tleu	%xcc,	0x6
	andn	%g1,	%l5,	%o5
	fcmpgt16	%f26,	%f28,	%l3
	orn	%o7,	%o1,	%i0
	mova	%icc,	%l2,	%o2
	movvc	%xcc,	%g3,	%i1
	array32	%o0,	%o3,	%l4
	tl	%xcc,	0x0
	udivx	%l0,	0x17D1,	%g7
	smul	%o6,	%i3,	%g5
	tvs	%icc,	0x0
	stw	%i6,	[%l7 + 0x7C]
	membar	0x28
	edge16l	%i5,	%l6,	%g4
	sethi	0x0142,	%i7
	array8	%i4,	%i2,	%g6
	edge16ln	%l1,	%o4,	%g1
	fbuge	%fcc2,	loop_2655
	array8	%g2,	%l5,	%o5
	nop
	fitod	%f8,	%f30
	fdtoi	%f30,	%f4
	sethi	0x0EF6,	%l3
loop_2655:
	udiv	%o7,	0x1655,	%o1
	addc	%i0,	0x1B72,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x6
	nop
	setx	loop_2656,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%xcc,	%g3,	%o2
	tcc	%icc,	0x1
	ldsb	[%l7 + 0x24],	%o0
loop_2656:
	tg	%xcc,	0x5
	set	0x10, %i7
	prefetcha	[%l7 + %i7] 0x10,	 0x0
	edge16	%o3,	%l0,	%l4
	movrgz	%g7,	0x3C2,	%o6
	udiv	%g5,	0x1B34,	%i3
	taddcctv	%i6,	0x1CED,	%l6
	bn,a,pt	%icc,	loop_2657
	array8	%g4,	%i7,	%i4
	edge32l	%i2,	%i5,	%l1
	nop
	setx	0xF4D71FB8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f21
loop_2657:
	udivcc	%g6,	0x1739,	%g1
	fmovsne	%icc,	%f4,	%f14
	movne	%icc,	%g2,	%l5
	fpadd16s	%f3,	%f16,	%f6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	andcc	%o4,	0x149E,	%l3
	set	0x54, %o3
	swapa	[%l7 + %o3] 0x18,	%o7
	movne	%xcc,	%o5,	%i0
	movneg	%xcc,	%o1,	%g3
	alignaddrl	%l2,	%o0,	%i1
	xnorcc	%o2,	0x1D5C,	%o3
	movvc	%xcc,	%l4,	%l0
	fbul,a	%fcc2,	loop_2658
	fnegd	%f4,	%f10
	fands	%f15,	%f24,	%f0
	sdiv	%o6,	0x1BA0,	%g5
loop_2658:
	std	%f6,	[%l7 + 0x20]
	popc	%g7,	%i3
	movpos	%icc,	%i6,	%l6
	srax	%g4,	0x05,	%i7
	set	0x50, %o5
	ldda	[%l7 + %o5] 0x19,	%i4
	move	%icc,	%i5,	%l1
	fpack32	%f26,	%f30,	%f18
	fmovrdgez	%g6,	%f10,	%f0
	nop
	setx	0xE31BBB03,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f17
	alignaddr	%i2,	%g2,	%g1
	tpos	%xcc,	0x2
	fmovde	%icc,	%f15,	%f3
	fbul,a	%fcc1,	loop_2659
	fbn,a	%fcc3,	loop_2660
	fbn,a	%fcc0,	loop_2661
	brlez	%o4,	loop_2662
loop_2659:
	tg	%icc,	0x2
loop_2660:
	bneg,a,pt	%xcc,	loop_2663
loop_2661:
	xor	%l3,	%o7,	%l5
loop_2662:
	bleu,a	%icc,	loop_2664
	nop
	setx	0xD0536CAA,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
loop_2663:
	membar	0x2D
	add	%i0,	0x1D99,	%o1
loop_2664:
	edge16ln	%g3,	%l2,	%o5
	movrne	%i1,	%o2,	%o3
	udivcc	%o0,	0x054C,	%l4
	te	%icc,	0x7
	fandnot1s	%f14,	%f15,	%f15
	orncc	%o6,	0x1C75,	%l0
	ta	%icc,	0x0
	fmovdcc	%icc,	%f21,	%f18
	alignaddr	%g7,	%g5,	%i6
	movpos	%xcc,	%i3,	%l6
	edge16ln	%g4,	%i4,	%i5
	set	0x50, %i3
	stha	%i7,	[%l7 + %i3] 0x11
	nop
	fitos	%f4,	%f19
	fstox	%f19,	%f26
	bshuffle	%f16,	%f12,	%f20
	stbar
	movrlez	%l1,	%i2,	%g6
	movleu	%xcc,	%g2,	%o4
	tle	%xcc,	0x5
	andncc	%g1,	%l3,	%l5
	tvc	%icc,	0x4
	fornot1s	%f28,	%f20,	%f18
	fors	%f31,	%f24,	%f24
	nop
	setx	0xCE1BB76C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x5297B680,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f5,	%f25
	ta	%icc,	0x5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x1f
	membar	#Sync
	xnor	%o7,	%o1,	%i0
	movrne	%l2,	%g3,	%i1
	xnorcc	%o5,	0x089F,	%o2
	fzeros	%f7
	stb	%o3,	[%l7 + 0x7B]
	array16	%l4,	%o0,	%o6
	edge16ln	%l0,	%g5,	%g7
	sllx	%i6,	%i3,	%g4
	udivcc	%l6,	0x15DE,	%i5
	xor	%i4,	0x1DB8,	%i7
	sdiv	%i2,	0x07E3,	%g6
	fmovrdlz	%g2,	%f16,	%f18
	sll	%l1,	0x02,	%o4
	edge16	%l3,	%g1,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o1,	%i0,	%l2
	tcs	%xcc,	0x6
	tg	%xcc,	0x3
	fnand	%f10,	%f8,	%f0
	tneg	%icc,	0x1
	nop
	setx	0xD7596FA52A1E824D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x93AA0AD9C91C70B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f4,	%f14
	fnegs	%f1,	%f21
	set	0x5E, %o2
	stha	%l5,	[%l7 + %o2] 0x22
	membar	#Sync
	fmovrdgz	%i1,	%f12,	%f14
	set	0x7B, %l3
	stba	%g3,	[%l7 + %l3] 0x2a
	membar	#Sync
	subccc	%o5,	0x0639,	%o3
	set	0x18, %i4
	lduha	[%l7 + %i4] 0x80,	%l4
	movvs	%xcc,	%o0,	%o6
	edge8n	%o2,	%g5,	%l0
	ldstub	[%l7 + 0x6C],	%i6
	udivcc	%i3,	0x0CA6,	%g4
	alignaddrl	%l6,	%i5,	%g7
	fbule,a	%fcc2,	loop_2665
	bgu,a,pt	%icc,	loop_2666
	alignaddr	%i7,	%i4,	%i2
	movne	%xcc,	%g6,	%l1
loop_2665:
	nop
	set	0x25, %l4
	ldstuba	[%l7 + %l4] 0x0c,	%o4
loop_2666:
	add	%l3,	%g2,	%o7
	set	0x28, %o7
	swapa	[%l7 + %o7] 0x80,	%g1
	fxnors	%f14,	%f1,	%f8
	tn	%xcc,	0x4
	tvc	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x5
	movl	%icc,	%i0,	%l2
	alignaddr	%o1,	%i1,	%g3
	movrgz	%l5,	%o5,	%l4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%o6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%o2
	bshuffle	%f6,	%f6,	%f18
	subc	%g5,	0x0DE2,	%o3
	bn,a,pn	%icc,	loop_2667
	fnot2s	%f21,	%f9
	orncc	%i6,	%l0,	%i3
	fbul	%fcc0,	loop_2668
loop_2667:
	mova	%icc,	%g4,	%l6
	nop
	fitod	%f26,	%f26
	movrne	%i5,	0x18B,	%g7
loop_2668:
	smul	%i7,	0x1CA0,	%i2
	movn	%icc,	%i4,	%g6
	orcc	%l1,	%l3,	%o4
	stx	%g2,	[%l7 + 0x48]
	ble,a,pt	%icc,	loop_2669
	movvs	%xcc,	%o7,	%g1
	tleu	%xcc,	0x0
	taddcctv	%l2,	0x1E75,	%i0
loop_2669:
	fblg,a	%fcc0,	loop_2670
	orncc	%o1,	0x02FA,	%g3
	fbg	%fcc0,	loop_2671
	fpmerge	%f3,	%f14,	%f18
loop_2670:
	edge32l	%l5,	%i1,	%o5
	movre	%l4,	%o6,	%o2
loop_2671:
	tle	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g5,	0x1FBD,	%o3
	bne,pt	%xcc,	loop_2672
	array32	%i6,	%l0,	%i3
	brgz,a	%o0,	loop_2673
	fxnors	%f4,	%f20,	%f20
loop_2672:
	tsubcctv	%l6,	%i5,	%g4
	edge32l	%i7,	%i2,	%g7
loop_2673:
	edge32	%i4,	%l1,	%l3
	tsubcctv	%o4,	%g2,	%g6
	prefetch	[%l7 + 0x18],	 0x2
	mulx	%g1,	%o7,	%i0
	movgu	%icc,	%o1,	%g3
	edge8	%l2,	%l5,	%i1
	nop
	fitos	%f26,	%f27
	movneg	%xcc,	%o5,	%o6
	fmovsn	%icc,	%f5,	%f24
	orncc	%o2,	%g5,	%l4
	umulcc	%o3,	0x01E6,	%i6
	movn	%icc,	%i3,	%l0
	and	%o0,	0x0431,	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g4,	%i5
	fmovdl	%icc,	%f14,	%f1
	movpos	%xcc,	%i2,	%g7
	fba,a	%fcc3,	loop_2674
	orncc	%i7,	0x0879,	%l1
	tcs	%xcc,	0x5
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f21
loop_2674:
	flush	%l7 + 0x54
	tcc	%icc,	0x0
	fxor	%f0,	%f6,	%f16
	ldx	[%l7 + 0x70],	%l3
	fmovrsne	%o4,	%f16,	%f18
	edge8l	%i4,	%g6,	%g1
	movgu	%icc,	%o7,	%i0
	edge16	%o1,	%g2,	%l2
	sllx	%g3,	0x1D,	%i1
	ldsw	[%l7 + 0x38],	%l5
	tcc	%xcc,	0x2
	subc	%o5,	0x16FA,	%o2
	tle	%xcc,	0x4
	lduw	[%l7 + 0x20],	%o6
	xnorcc	%l4,	0x120A,	%o3
	tleu	%icc,	0x3
	tvc	%xcc,	0x7
	fmul8sux16	%f22,	%f26,	%f30
	nop
	fitos	%f10,	%f30
	fstox	%f30,	%f0
	edge32	%i6,	%g5,	%l0
	tsubcc	%o0,	0x1E8F,	%i3
	umulcc	%g4,	0x0D0B,	%i5
	tneg	%icc,	0x5
	orn	%i2,	0x1105,	%l6
	bvc,pn	%icc,	loop_2675
	srax	%g7,	%i7,	%l3
	xor	%l1,	0x0E19,	%i4
	movn	%xcc,	%g6,	%o4
loop_2675:
	tgu	%icc,	0x2
	movrne	%o7,	0x04B,	%g1
	orn	%o1,	%i0,	%g2
	edge32n	%l2,	%g3,	%i1
	fbo	%fcc0,	loop_2676
	edge16n	%l5,	%o2,	%o6
	andncc	%l4,	%o5,	%i6
	fbe	%fcc1,	loop_2677
loop_2676:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f14,	%f12
	edge8ln	%g5,	%l0,	%o0
loop_2677:
	move	%icc,	%o3,	%g4
	taddcctv	%i5,	0x14FF,	%i3
	tsubcctv	%i2,	%l6,	%i7
	st	%f28,	[%l7 + 0x58]
	movn	%icc,	%l3,	%g7
	be,pn	%icc,	loop_2678
	movvc	%icc,	%i4,	%l1
	movl	%icc,	%g6,	%o7
	nop
	setx	loop_2679,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2678:
	orcc	%g1,	%o1,	%o4
	wr	%g0,	0x22,	%asi
	stba	%g2,	[%l7 + 0x1C] %asi
	membar	#Sync
loop_2679:
	nop
	set	0x0E, %o4
	ldsha	[%l7 + %o4] 0x89,	%l2
	fmovdg	%xcc,	%f1,	%f24
	fbg,a	%fcc0,	loop_2680
	addc	%i0,	0x1377,	%i1
	movle	%xcc,	%g3,	%l5
	fbl	%fcc0,	loop_2681
loop_2680:
	movpos	%icc,	%o6,	%o2
	movvc	%xcc,	%l4,	%i6
	movle	%icc,	%g5,	%l0
loop_2681:
	taddcctv	%o0,	0x08D5,	%o3
	bne	loop_2682
	fbul	%fcc0,	loop_2683
	fmovd	%f0,	%f30
	fabsd	%f18,	%f26
loop_2682:
	sra	%o5,	%g4,	%i5
loop_2683:
	tvs	%xcc,	0x2
	fbn,a	%fcc1,	loop_2684
	fbo	%fcc2,	loop_2685
	nop
	fitos	%f13,	%f1
	fstox	%f1,	%f24
	fxtos	%f24,	%f14
	bcs,a,pt	%xcc,	loop_2686
loop_2684:
	fpackfix	%f2,	%f8
loop_2685:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f18,	[%l7 + 0x1C] %asi
loop_2686:
	fbug	%fcc3,	loop_2687
	movvc	%icc,	%i2,	%i3
	fmovrdlez	%l6,	%f4,	%f18
	fxors	%f19,	%f4,	%f1
loop_2687:
	array8	%l3,	%i7,	%g7
	fpadd16	%f6,	%f26,	%f20
	nop
	setx	loop_2688,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%i4,	0x12DC,	%g6
	fbge,a	%fcc3,	loop_2689
	udivx	%o7,	0x0B17,	%l1
loop_2688:
	sir	0x1A5E
	wr	%g0,	0x11,	%asi
	sta	%f8,	[%l7 + 0x50] %asi
loop_2689:
	umul	%g1,	%o4,	%g2
	fornot1	%f8,	%f2,	%f16
	edge8ln	%l2,	%i0,	%o1
	movre	%i1,	0x300,	%g3
	srax	%l5,	%o2,	%l4
	tn	%icc,	0x0
	edge32n	%i6,	%o6,	%l0
	sethi	0x1217,	%g5
	sll	%o0,	%o3,	%o5
	fcmpne16	%f6,	%f24,	%g4
	taddcctv	%i5,	%i2,	%l6
	edge16l	%l3,	%i3,	%i7
	fmovrsgz	%i4,	%f28,	%f18
	fpmerge	%f6,	%f19,	%f12
	fnands	%f17,	%f11,	%f15
	sub	%g7,	0x1FB5,	%g6
	tle	%xcc,	0x4
	bvc,a,pn	%icc,	loop_2690
	pdist	%f14,	%f14,	%f10
	fmovdvs	%xcc,	%f16,	%f6
	sethi	0x0D51,	%l1
loop_2690:
	fnor	%f14,	%f20,	%f0
	movgu	%xcc,	%o7,	%o4
	udiv	%g2,	0x1027,	%g1
	fmul8sux16	%f10,	%f18,	%f14
	ldd	[%l7 + 0x10],	%i0
	xnorcc	%l2,	0x1848,	%o1
	nop
	setx	0x016E003E455B95B3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x6E3AD63315EFB949,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f12,	%f2
	taddcc	%g3,	%i1,	%o2
	nop
	setx	0x4EE81083DF4B7280,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x848B5C7AA4AA33A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f18,	%f8
	movpos	%icc,	%l5,	%i6
	edge32l	%o6,	%l0,	%g5
	fbl,a	%fcc2,	loop_2691
	tvc	%xcc,	0x6
	bpos,a	%xcc,	loop_2692
	sethi	0x156E,	%l4
loop_2691:
	edge32n	%o3,	%o0,	%o5
	fmovdne	%icc,	%f10,	%f13
loop_2692:
	tne	%icc,	0x3
	te	%icc,	0x5
	faligndata	%f10,	%f12,	%f0
	alignaddr	%g4,	%i2,	%i5
	bg,a	%icc,	loop_2693
	fpsub16s	%f8,	%f1,	%f11
	umulcc	%l3,	0x157A,	%l6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%i7
loop_2693:
	tn	%icc,	0x0
	and	%i4,	%i3,	%g7
	fzeros	%f29
	set	0x20, %l0
	prefetcha	[%l7 + %l0] 0x81,	 0x1
	fbn,a	%fcc0,	loop_2694
	fmovdge	%xcc,	%f26,	%f27
	fabss	%f5,	%f11
	fabss	%f30,	%f24
loop_2694:
	tl	%xcc,	0x6
	tvs	%xcc,	0x3
	st	%f15,	[%l7 + 0x54]
	bgu,pn	%xcc,	loop_2695
	fand	%f16,	%f20,	%f24
	xor	%o7,	0x1B65,	%o4
	brz,a	%l1,	loop_2696
loop_2695:
	srl	%g1,	%g2,	%i0
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2696:
	movneg	%icc,	%o1,	%l2
	smulcc	%i1,	%o2,	%l5
	movvs	%xcc,	%g3,	%i6
	fmovrsgz	%o6,	%f8,	%f24
	orncc	%l0,	%l4,	%o3
	movg	%xcc,	%g5,	%o0
	addc	%o5,	%i2,	%g4
	popc	%i5,	%l3
	andcc	%l6,	0x0706,	%i7
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x70] %asi,	%i4
	fmovrslez	%i3,	%f22,	%f3
	tvs	%icc,	0x0
	xnor	%g6,	0x1BE3,	%g7
	movcc	%xcc,	%o4,	%o7
	movcs	%xcc,	%l1,	%g2
	tvc	%icc,	0x6
	movge	%xcc,	%i0,	%g1
	edge16	%l2,	%o1,	%o2
	subccc	%l5,	0x0E8C,	%i1
	sdiv	%i6,	0x1137,	%g3
	sllx	%l0,	0x02,	%o6
	array32	%l4,	%g5,	%o0
	edge16l	%o5,	%o3,	%g4
	ldub	[%l7 + 0x11],	%i5
	tpos	%xcc,	0x5
	movrne	%i2,	%l6,	%l3
	ldd	[%l7 + 0x30],	%i6
	fpadd16	%f22,	%f16,	%f24
	movg	%xcc,	%i3,	%i4
	array16	%g6,	%o4,	%g7
	orcc	%o7,	0x0BE1,	%l1
	nop
	fitod	%f31,	%f14
	sethi	0x1A3E,	%i0
	fmovdvs	%icc,	%f20,	%f16
	bcc,a	loop_2697
	alignaddr	%g2,	%l2,	%g1
	subcc	%o2,	%o1,	%l5
	ldd	[%l7 + 0x70],	%i6
loop_2697:
	ldd	[%l7 + 0x68],	%i0
	movleu	%icc,	%g3,	%o6
	fbn	%fcc3,	loop_2698
	srlx	%l0,	0x10,	%g5
	ldsh	[%l7 + 0x50],	%o0
	sir	0x1FC8
loop_2698:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x4
	fcmpne16	%f4,	%f18,	%l4
	movrlz	%o5,	%g4,	%i5
	movvc	%icc,	%i2,	%l6
	fnegs	%f20,	%f28
	add	%l7,	0x54,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x18,	%o3,	%i7
	fmovdpos	%xcc,	%f21,	%f29
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
	tsubcc	%l3,	0x1C14,	%i4
	fpackfix	%f6,	%f22
	sethi	0x1901,	%g6
	be	%icc,	loop_2699
	sdivx	%i3,	0x07D3,	%g7
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%o4
loop_2699:
	and	%l1,	%i0,	%l2
	bcc,pn	%xcc,	loop_2700
	xor	%g2,	%g1,	%o1
	fbe,a	%fcc2,	loop_2701
	nop
	setx	loop_2702,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2700:
	fbg	%fcc1,	loop_2703
	edge16ln	%o2,	%l5,	%i1
loop_2701:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2702:
	fbge	%fcc2,	loop_2704
loop_2703:
	faligndata	%f26,	%f26,	%f18
	sll	%i6,	%o6,	%l0
	mulx	%g3,	0x116B,	%o0
loop_2704:
	edge8	%g5,	%l4,	%g4
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f10
	subcc	%i5,	%i2,	%o5
	subc	%l6,	%o3,	%i7
	fmovsvs	%icc,	%f12,	%f24
	tne	%icc,	0x0
	nop
	set	0x38, %g3
	stx	%i4,	[%l7 + %g3]
	fmul8x16au	%f0,	%f13,	%f0
	array8	%g6,	%i3,	%l3
	xorcc	%o7,	0x1C8E,	%g7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x66] %asi,	%l1
	mulx	%o4,	%i0,	%l2
	fbge,a	%fcc3,	loop_2705
	udivx	%g2,	0x078B,	%o1
	ta	%icc,	0x6
	andncc	%g1,	%l5,	%o2
loop_2705:
	bn,a	loop_2706
	fsrc2	%f26,	%f0
	nop
	setx	0x7ABD67157055ED1D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fbu,a	%fcc0,	loop_2707
loop_2706:
	sll	%i1,	0x0D,	%o6
	nop
	setx	0x269B1C156BF25621,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x304BCC7B2FCA0C99,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f4,	%f16
	subccc	%l0,	0x1751,	%i6
loop_2707:
	nop
	setx	0x691F5ADB506CCEBA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	movpos	%xcc,	%o0,	%g3
	movgu	%icc,	%l4,	%g4
	brnz	%g5,	loop_2708
	edge8n	%i2,	%i5,	%l6
	wr	%g0,	0x88,	%asi
	stba	%o5,	[%l7 + 0x44] %asi
loop_2708:
	movle	%icc,	%o3,	%i7
	mova	%icc,	%i4,	%g6
	fandnot2s	%f15,	%f27,	%f7
	fmovsa	%xcc,	%f26,	%f2
	movge	%icc,	%i3,	%l3
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x18] %asi,	%g7
	fmovrdlz	%o7,	%f2,	%f2
	bvc	%icc,	loop_2709
	umulcc	%l1,	0x1633,	%o4
	movre	%i0,	0x26F,	%g2
	set	0x66, %o6
	lduba	[%l7 + %o6] 0x14,	%l2
loop_2709:
	or	%g1,	0x0120,	%o1
	fbge	%fcc2,	loop_2710
	xnorcc	%l5,	0x0635,	%i1
	nop
	setx	0x4952E127,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB04D9DA9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f11,	%f8
	bn,a,pn	%icc,	loop_2711
loop_2710:
	edge16n	%o6,	%l0,	%i6
	sllx	%o0,	%g3,	%l4
	fnand	%f10,	%f4,	%f28
loop_2711:
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f26
	sub	%g4,	0x1EA2,	%g5
	edge8n	%i2,	%o2,	%i5
	fand	%f30,	%f14,	%f18
	orcc	%o5,	%l6,	%o3
	edge16l	%i7,	%g6,	%i4
	tsubcc	%l3,	0x1536,	%g7
	udivx	%o7,	0x0630,	%i3
	fandnot2s	%f14,	%f17,	%f27
	nop
	fitos	%f14,	%f23
	fstoi	%f23,	%f13
	fpack32	%f14,	%f4,	%f10
	andcc	%l1,	%o4,	%g2
	nop
	setx	loop_2712,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x20],	%i0
	fbu	%fcc2,	loop_2713
	fbg,a	%fcc2,	loop_2714
loop_2712:
	move	%icc,	%g1,	%o1
	andn	%l5,	%i1,	%l2
loop_2713:
	brlez	%o6,	loop_2715
loop_2714:
	fsrc2	%f24,	%f28
	fones	%f12
	swap	[%l7 + 0x74],	%i6
loop_2715:
	movpos	%xcc,	%l0,	%o0
	stx	%g3,	[%l7 + 0x08]
	orncc	%g4,	0x110C,	%l4
	andncc	%g5,	%i2,	%o2
	fone	%f8
	tsubcc	%o5,	%i5,	%l6
	subc	%o3,	%i7,	%g6
	xnorcc	%l3,	%g7,	%o7
	set	0x2C, %i1
	swapa	[%l7 + %i1] 0x19,	%i3
	xnorcc	%i4,	%l1,	%g2
	fcmpgt32	%f18,	%f6,	%o4
	sub	%i0,	0x04B9,	%g1
	udiv	%l5,	0x0C18,	%o1
	edge16	%i1,	%o6,	%i6
	fmovsne	%xcc,	%f18,	%f14
	fmovrdlz	%l2,	%f28,	%f22
	bcc	loop_2716
	fands	%f26,	%f26,	%f18
	array16	%o0,	%l0,	%g3
	sll	%g4,	0x0B,	%l4
loop_2716:
	srlx	%g5,	0x0E,	%o2
	mova	%xcc,	%i2,	%i5
	fandnot1s	%f24,	%f22,	%f1
	or	%o5,	%l6,	%i7
	bcs,pt	%xcc,	loop_2717
	bne	%xcc,	loop_2718
	sir	0x02AD
	tneg	%xcc,	0x0
loop_2717:
	fpack32	%f26,	%f26,	%f26
loop_2718:
	ta	%icc,	0x6
	fbg	%fcc0,	loop_2719
	tcc	%icc,	0x1
	wr	%g0,	0x80,	%asi
	stha	%o3,	[%l7 + 0x7A] %asi
loop_2719:
	sth	%g6,	[%l7 + 0x18]
	fandnot1	%f0,	%f12,	%f4
	nop
	setx	0xE5F6E839,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f15
	andcc	%g7,	0x106F,	%l3
	array16	%i3,	%o7,	%i4
	fcmple32	%f10,	%f6,	%g2
	xorcc	%l1,	0x0432,	%o4
	fbe,a	%fcc2,	loop_2720
	sdivx	%i0,	0x12A7,	%g1
	bvc,pn	%xcc,	loop_2721
	movl	%icc,	%l5,	%i1
loop_2720:
	fpmerge	%f16,	%f20,	%f20
	tg	%xcc,	0x5
loop_2721:
	movrlez	%o6,	0x297,	%i6
	alignaddrl	%o1,	%l2,	%l0
	fble,a	%fcc2,	loop_2722
	bleu,pt	%icc,	loop_2723
	srl	%g3,	0x02,	%g4
	taddcctv	%l4,	%g5,	%o0
loop_2722:
	tne	%icc,	0x4
loop_2723:
	orcc	%i2,	0x0315,	%i5
	ldd	[%l7 + 0x78],	%f2
	lduw	[%l7 + 0x60],	%o2
	subccc	%o5,	0x0C8B,	%l6
	fmovdvs	%xcc,	%f6,	%f16
	fpackfix	%f6,	%f19
	sethi	0x1F5A,	%o3
	mulx	%i7,	%g6,	%l3
	sll	%i3,	0x19,	%g7
	bcs,pt	%icc,	loop_2724
	fbne	%fcc0,	loop_2725
	movle	%xcc,	%i4,	%o7
	fbe	%fcc3,	loop_2726
loop_2724:
	brz	%g2,	loop_2727
loop_2725:
	edge16ln	%l1,	%i0,	%o4
	fsrc1s	%f23,	%f16
loop_2726:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x62] %asi,	%g1
loop_2727:
	nop
	set	0x34, %g6
	stwa	%l5,	[%l7 + %g6] 0x22
	membar	#Sync
	addccc	%o6,	0x0EE6,	%i1
	movleu	%xcc,	%i6,	%o1
	srlx	%l0,	%g3,	%g4
	fmovsle	%xcc,	%f24,	%f19
	bge,a,pn	%xcc,	loop_2728
	sra	%l4,	%g5,	%l2
	tcs	%icc,	0x4
	movrne	%o0,	0x305,	%i5
loop_2728:
	edge16	%o2,	%i2,	%o5
	fble,a	%fcc0,	loop_2729
	edge16ln	%o3,	%l6,	%i7
	bcc	loop_2730
	stw	%g6,	[%l7 + 0x70]
loop_2729:
	tcc	%xcc,	0x7
	mova	%icc,	%l3,	%i3
loop_2730:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x7
	xnor	%g7,	%i4,	%o7
	ld	[%l7 + 0x44],	%f17
	fmovd	%f26,	%f4
	subcc	%l1,	0x089A,	%g2
	subccc	%i0,	0x0B78,	%o4
	nop
	setx	loop_2731,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bleu,a	%icc,	loop_2732
	udivx	%g1,	0x0F4F,	%o6
	smulcc	%l5,	%i6,	%o1
loop_2731:
	movne	%xcc,	%i1,	%l0
loop_2732:
	fbl,a	%fcc0,	loop_2733
	bcs,pt	%xcc,	loop_2734
	orcc	%g3,	0x085E,	%g4
	membar	0x0D
loop_2733:
	edge32ln	%g5,	%l4,	%o0
loop_2734:
	bl,pn	%icc,	loop_2735
	edge16l	%i5,	%o2,	%i2
	and	%o5,	0x0BFA,	%l2
	fmovda	%xcc,	%f20,	%f28
loop_2735:
	addccc	%o3,	0x0E9F,	%l6
	edge32n	%i7,	%l3,	%g6
	orncc	%i3,	%g7,	%o7
	sir	0x1DD4
	sth	%i4,	[%l7 + 0x38]
	fmovrdne	%l1,	%f14,	%f18
	fsrc1	%f30,	%f18
	fpsub16	%f26,	%f26,	%f12
	edge8n	%i0,	%g2,	%o4
	udiv	%o6,	0x09EC,	%g1
	tsubcctv	%i6,	%o1,	%l5
	tsubcc	%i1,	0x1480,	%g3
	brnz	%g4,	loop_2736
	andncc	%g5,	%l4,	%o0
	set	0x14, %i6
	stwa	%l0,	[%l7 + %i6] 0x19
loop_2736:
	movre	%o2,	%i5,	%o5
	sir	0x0BFD
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tpos	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%xcc,	%f19,	%f1
	taddcc	%i2,	0x1BB1,	%l2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%i7
	edge32l	%l6,	%g6,	%i3
	edge8	%l3,	%g7,	%i4
	bg,a	%icc,	loop_2737
	edge32ln	%l1,	%o7,	%i0
	mulscc	%g2,	0x0883,	%o6
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2737:
	swap	[%l7 + 0x28],	%o4
	array32	%g1,	%o1,	%i6
	bgu	loop_2738
	fbule,a	%fcc2,	loop_2739
	movn	%xcc,	%i1,	%g3
	fmovrsgez	%g4,	%f2,	%f28
loop_2738:
	orncc	%g5,	%l4,	%o0
loop_2739:
	tsubcc	%l0,	0x0129,	%l5
	nop
	setx	loop_2740,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%i5,	%o2,	%o5
	fcmpeq32	%f4,	%f26,	%i2
	edge16l	%o3,	%l2,	%l6
loop_2740:
	edge8n	%i7,	%g6,	%i3
	brlez,a	%g7,	loop_2741
	sdivcc	%l3,	0x0C08,	%i4
	movgu	%icc,	%l1,	%o7
	fbn	%fcc2,	loop_2742
loop_2741:
	fsrc1s	%f13,	%f6
	edge8n	%g2,	%o6,	%i0
	set	0x3C, %o0
	swapa	[%l7 + %o0] 0x80,	%g1
loop_2742:
	fpsub32s	%f28,	%f0,	%f6
	wr	%g0,	0x2b,	%asi
	stba	%o1,	[%l7 + 0x6D] %asi
	membar	#Sync
	membar	0x6E
	movrgz	%i6,	%o4,	%i1
	fbg	%fcc0,	loop_2743
	fmovdg	%icc,	%f21,	%f26
	alignaddrl	%g4,	%g5,	%g3
	umulcc	%o0,	%l4,	%l0
loop_2743:
	fmovdl	%xcc,	%f26,	%f31
	udivx	%l5,	0x1CA9,	%i5
	movl	%icc,	%o2,	%i2
	srl	%o5,	%l2,	%o3
	edge32ln	%l6,	%i7,	%g6
	bcs,a,pt	%xcc,	loop_2744
	fbuge	%fcc0,	loop_2745
	subccc	%i3,	%g7,	%l3
	lduh	[%l7 + 0x52],	%i4
loop_2744:
	add	%o7,	0x110A,	%g2
loop_2745:
	ba,pn	%xcc,	loop_2746
	ldsb	[%l7 + 0x39],	%o6
	xor	%i0,	%l1,	%o1
	srl	%g1,	0x13,	%i6
loop_2746:
	nop
	setx	0x62B7695B75FF211A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xF07A52C743988C80,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f16,	%f12
	edge8ln	%o4,	%g4,	%g5
	subcc	%g3,	%i1,	%o0
	fmovsl	%xcc,	%f9,	%f27
	edge32n	%l4,	%l0,	%l5
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf8
	membar	#Sync
	bvc	%xcc,	loop_2747
	fmovrdgez	%o2,	%f2,	%f22
	smulcc	%i5,	0x0AC4,	%i2
	alignaddr	%o5,	%o3,	%l2
loop_2747:
	edge32n	%l6,	%g6,	%i3
	ba,pt	%xcc,	loop_2748
	orncc	%i7,	%g7,	%l3
	fpsub16	%f0,	%f12,	%f20
	taddcc	%i4,	0x1772,	%o7
loop_2748:
	movrgez	%g2,	%i0,	%l1
	mova	%icc,	%o1,	%g1
	movne	%icc,	%o6,	%i6
	andncc	%g4,	%o4,	%g3
	edge32ln	%g5,	%i1,	%l4
	bg,a	loop_2749
	popc	%l0,	%l5
	fmovscs	%xcc,	%f28,	%f0
	fbg,a	%fcc2,	loop_2750
loop_2749:
	subcc	%o0,	0x0946,	%i5
	edge32ln	%i2,	%o2,	%o3
	set	0x20, %g5
	ldda	[%l7 + %g5] 0x88,	%l2
loop_2750:
	movrne	%l6,	0x0F9,	%o5
	movcc	%xcc,	%i3,	%g6
	edge8l	%g7,	%l3,	%i7
	fble,a	%fcc0,	loop_2751
	bvc,a,pn	%xcc,	loop_2752
	andcc	%o7,	0x0341,	%g2
	sth	%i0,	[%l7 + 0x24]
loop_2751:
	brgez	%i4,	loop_2753
loop_2752:
	subccc	%o1,	%l1,	%o6
	edge32n	%i6,	%g1,	%g4
	movleu	%xcc,	%o4,	%g3
loop_2753:
	fbug	%fcc2,	loop_2754
	bge,a	loop_2755
	lduw	[%l7 + 0x60],	%i1
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
loop_2754:
	taddcctv	%l4,	0x1111,	%l0
loop_2755:
	movneg	%icc,	%l5,	%i5
	tvc	%xcc,	0x7
	xnor	%i2,	%o0,	%o3
	tle	%xcc,	0x0
	fpmerge	%f22,	%f21,	%f18
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x88
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x32] %asi,	%l2
	udiv	%l6,	0x0BEC,	%o5
	te	%xcc,	0x3
	edge16n	%o2,	%g6,	%g7
	fnegd	%f12,	%f8
	fblg,a	%fcc0,	loop_2756
	nop
	setx loop_2757, %l0, %l1
	jmpl %l1, %l3
	alignaddr	%i7,	%i3,	%o7
	sth	%i0,	[%l7 + 0x42]
loop_2756:
	stbar
loop_2757:
	bshuffle	%f26,	%f12,	%f20
	fnors	%f29,	%f23,	%f1
	or	%i4,	%g2,	%o1
	fnor	%f30,	%f30,	%f8
	edge8	%l1,	%o6,	%i6
	tne	%xcc,	0x2
	or	%g1,	%g4,	%o4
	movleu	%xcc,	%i1,	%g3
	bcs,a	%xcc,	loop_2758
	fmovsl	%xcc,	%f3,	%f29
	fmovrse	%g5,	%f24,	%f28
	bpos,a,pn	%xcc,	loop_2759
loop_2758:
	add	%l4,	0x0367,	%l0
	bcs,a,pt	%icc,	loop_2760
	bneg	%xcc,	loop_2761
loop_2759:
	movgu	%icc,	%l5,	%i2
	movg	%icc,	%i5,	%o3
loop_2760:
	tg	%icc,	0x0
loop_2761:
	tle	%xcc,	0x5
	alignaddr	%o0,	%l6,	%l2
	set	0x67, %l5
	ldstuba	[%l7 + %l5] 0x80,	%o2
	fbe,a	%fcc2,	loop_2762
	fzeros	%f26
	tgu	%icc,	0x4
	xor	%g6,	%o5,	%g7
loop_2762:
	edge8l	%l3,	%i7,	%i3
	edge16ln	%o7,	%i0,	%g2
	movl	%icc,	%o1,	%l1
	xnor	%o6,	0x0922,	%i6
	tneg	%xcc,	0x7
	movpos	%icc,	%g1,	%i4
	srax	%g4,	0x00,	%o4
	fba,a	%fcc0,	loop_2763
	sra	%i1,	0x05,	%g3
	sdiv	%l4,	0x0930,	%g5
	umulcc	%l5,	%l0,	%i5
loop_2763:
	fbue	%fcc2,	loop_2764
	array32	%o3,	%i2,	%o0
	mulx	%l2,	%o2,	%l6
	nop
	fitos	%f2,	%f27
	fstox	%f27,	%f16
loop_2764:
	udivx	%o5,	0x08DB,	%g7
	bvs	loop_2765
	fmovdleu	%xcc,	%f18,	%f15
	sub	%l3,	%i7,	%i3
	movl	%icc,	%o7,	%i0
loop_2765:
	tvs	%xcc,	0x0
	sllx	%g2,	%o1,	%l1
	fmovsge	%icc,	%f24,	%f10
	movrne	%g6,	0x238,	%o6
	addc	%i6,	%g1,	%g4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i4
	array32	%i1,	%g3,	%l4
	fmul8x16	%f15,	%f8,	%f24
	xor	%o4,	0x169C,	%l5
	tneg	%icc,	0x5
	sth	%g5,	[%l7 + 0x52]
	ld	[%l7 + 0x10],	%f1
	movg	%xcc,	%i5,	%l0
	set	0x58, %i5
	ldstuba	[%l7 + %i5] 0x89,	%o3
	srax	%i2,	%l2,	%o2
	or	%l6,	0x117F,	%o5
	movcs	%xcc,	%o0,	%l3
	ldsw	[%l7 + 0x74],	%g7
	edge16n	%i7,	%i3,	%i0
	fblg	%fcc0,	loop_2766
	array32	%o7,	%o1,	%g2
	flush	%l7 + 0x28
	fnegd	%f24,	%f12
loop_2766:
	bgu,a,pt	%icc,	loop_2767
	umulcc	%g6,	%o6,	%l1
	tl	%icc,	0x7
	tcs	%xcc,	0x0
loop_2767:
	andncc	%i6,	%g1,	%g4
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f14
	edge32l	%i1,	%i4,	%g3
	bshuffle	%f8,	%f26,	%f16
	movleu	%xcc,	%l4,	%l5
	fble	%fcc0,	loop_2768
	xorcc	%o4,	%g5,	%i5
	tleu	%xcc,	0x0
	edge16n	%o3,	%i2,	%l0
loop_2768:
	bvs,pt	%xcc,	loop_2769
	membar	0x43
	flush	%l7 + 0x0C
	wr	%g0,	0x10,	%asi
	sta	%f4,	[%l7 + 0x44] %asi
loop_2769:
	movre	%o2,	0x2E1,	%l2
	popc	0x0858,	%l6
	bge	%xcc,	loop_2770
	edge8l	%o5,	%o0,	%g7
	movge	%xcc,	%l3,	%i3
	nop
	set	0x3E, %g2
	lduh	[%l7 + %g2],	%i0
loop_2770:
	fornot1s	%f17,	%f4,	%f12
	move	%xcc,	%i7,	%o7
	fmovdvc	%xcc,	%f27,	%f11
	fpsub16	%f24,	%f18,	%f22
	ldd	[%l7 + 0x18],	%f16
	movcs	%xcc,	%g2,	%o1
	move	%xcc,	%g6,	%o6
	umul	%l1,	%i6,	%g1
	andncc	%i1,	%i4,	%g3
	movrlz	%l4,	0x056,	%g4
	fmovse	%xcc,	%f12,	%f26
	bg,a	loop_2771
	edge32	%o4,	%g5,	%i5
	nop
	setx	0x29869BA07074C981,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	nop
	fitos	%f6,	%f19
	fstoi	%f19,	%f15
loop_2771:
	tsubcc	%o3,	%l5,	%i2
	fmovdvs	%icc,	%f17,	%f9
	orcc	%l0,	0x1466,	%l2
	movge	%xcc,	%l6,	%o2
	set	0x38, %g4
	sta	%f7,	[%l7 + %g4] 0x80
	andncc	%o0,	%g7,	%o5
	edge32l	%i3,	%l3,	%i0
	fzeros	%f7
	fsrc2	%f22,	%f14
	move	%xcc,	%o7,	%i7
	movcc	%icc,	%g2,	%g6
	ldsw	[%l7 + 0x08],	%o1
	tsubcc	%o6,	%i6,	%g1
	edge8n	%i1,	%l1,	%i4
	ldsw	[%l7 + 0x54],	%g3
	sll	%g4,	0x07,	%o4
	movle	%xcc,	%l4,	%g5
	nop
	setx	0x10733FD0,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	srlx	%o3,	%l5,	%i2
	fmovdgu	%xcc,	%f14,	%f6
	tne	%xcc,	0x3
	umulcc	%l0,	0x0862,	%i5
	brz,a	%l6,	loop_2772
	bleu,a	%xcc,	loop_2773
	fbge	%fcc0,	loop_2774
	sra	%o2,	%o0,	%g7
loop_2772:
	fpsub32	%f6,	%f8,	%f16
loop_2773:
	edge8	%o5,	%i3,	%l2
loop_2774:
	orcc	%i0,	0x0D69,	%o7
	ldub	[%l7 + 0x45],	%l3
	fzero	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g2,	%g6,	%i7
	fmul8x16al	%f15,	%f31,	%f0
	array8	%o1,	%o6,	%g1
	fcmpeq16	%f26,	%f30,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x4
	bcc	loop_2775
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x0
	set	0x2A, %l1
	stha	%l1,	[%l7 + %l1] 0xe3
	membar	#Sync
loop_2775:
	tcc	%icc,	0x6
	movne	%xcc,	%i1,	%i4
	addccc	%g4,	%o4,	%g3
	fnegd	%f18,	%f12
	array8	%g5,	%l4,	%l5
	movgu	%icc,	%i2,	%o3
	ldsw	[%l7 + 0x64],	%i5
	andncc	%l0,	%l6,	%o2
	tge	%icc,	0x2
	movrlz	%g7,	0x1FC,	%o5
	movrne	%o0,	0x391,	%i3
	udivcc	%i0,	0x076D,	%o7
	fmovrsgz	%l3,	%f31,	%f27
	tge	%icc,	0x3
	fbn	%fcc2,	loop_2776
	udivcc	%g2,	0x04F4,	%g6
	fxnors	%f26,	%f6,	%f7
	tl	%icc,	0x4
loop_2776:
	movrne	%i7,	0x250,	%o1
	tvs	%icc,	0x3
	movcs	%icc,	%l2,	%g1
	fexpand	%f0,	%f30
	array8	%i6,	%o6,	%l1
	fexpand	%f28,	%f0
	edge8	%i1,	%g4,	%i4
	edge8ln	%o4,	%g3,	%g5
	edge16l	%l4,	%i2,	%l5
	fmovrdgez	%o3,	%f20,	%f22
	tcc	%icc,	0x5
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i5
	taddcc	%l6,	%l0,	%o2
	fbg,a	%fcc2,	loop_2777
	sth	%o5,	[%l7 + 0x6A]
	set	0x7A, %l6
	stha	%g7,	[%l7 + %l6] 0x22
	membar	#Sync
loop_2777:
	popc	0x021C,	%i3
	sdivcc	%o0,	0x0896,	%i0
	alignaddr	%o7,	%g2,	%g6
	edge8l	%i7,	%l3,	%o1
	ble,a	loop_2778
	pdist	%f26,	%f28,	%f26
	sll	%l2,	0x0A,	%i6
	set	0x4C, %i2
	stwa	%o6,	[%l7 + %i2] 0x23
	membar	#Sync
loop_2778:
	sir	0x06D0
	or	%g1,	%l1,	%i1
	bpos	loop_2779
	ldd	[%l7 + 0x20],	%f0
	ldsh	[%l7 + 0x0A],	%i4
	fpmerge	%f17,	%f17,	%f30
loop_2779:
	taddcctv	%g4,	0x1D46,	%g3
	movpos	%icc,	%o4,	%l4
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x70] %asi,	%g5
	for	%f28,	%f12,	%f28
	addcc	%i2,	0x0966,	%o3
	andcc	%l5,	%i5,	%l0
	tle	%icc,	0x2
	movg	%xcc,	%o2,	%l6
	fpack16	%f0,	%f8
	edge8l	%g7,	%o5,	%i3
	ldx	[%l7 + 0x10],	%o0
	xnorcc	%o7,	%i0,	%g6
	fornot2	%f0,	%f24,	%f26
	movrlz	%g2,	%l3,	%i7
	fmovdge	%xcc,	%f11,	%f7
	stb	%o1,	[%l7 + 0x6D]
	fandnot1s	%f19,	%f2,	%f22
	fmovsg	%xcc,	%f22,	%f27
	tpos	%icc,	0x6
	edge16n	%l2,	%i6,	%g1
	fpsub16	%f18,	%f2,	%f14
	array16	%o6,	%i1,	%l1
	fone	%f12
	ld	[%l7 + 0x7C],	%f8
	edge8n	%g4,	%g3,	%o4
	udiv	%i4,	0x1F34,	%g5
	srlx	%i2,	0x19,	%o3
	movpos	%icc,	%l4,	%i5
	edge8	%l5,	%l0,	%o2
	brgez	%l6,	loop_2780
	nop
	setx	loop_2781,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srax	%o5,	%i3,	%o0
	bneg,a,pn	%xcc,	loop_2782
loop_2780:
	brgz	%g7,	loop_2783
loop_2781:
	edge16n	%o7,	%g6,	%i0
	membar	0x24
loop_2782:
	bg,pt	%icc,	loop_2784
loop_2783:
	orn	%g2,	%i7,	%o1
	addc	%l3,	0x10E7,	%l2
	movvc	%xcc,	%g1,	%i6
loop_2784:
	umul	%i1,	0x1318,	%l1
	fmovspos	%xcc,	%f19,	%f19
	movcc	%xcc,	%g4,	%o6
	movcs	%icc,	%o4,	%i4
	bcc,pt	%icc,	loop_2785
	umul	%g3,	0x1CC2,	%i2
	fble,a	%fcc0,	loop_2786
	popc	0x118E,	%g5
loop_2785:
	taddcc	%l4,	%i5,	%o3
	movpos	%icc,	%l5,	%o2
loop_2786:
	fmovdcs	%icc,	%f22,	%f22
	fands	%f1,	%f7,	%f25
	lduh	[%l7 + 0x4C],	%l0
	mova	%icc,	%l6,	%o5
	addccc	%i3,	%o0,	%o7
	fnors	%f9,	%f16,	%f1
	stw	%g7,	[%l7 + 0x64]
	taddcctv	%i0,	0x1C35,	%g2
	nop
	setx	0xD8024E88207E8711,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	set	0x20, %i0
	ldswa	[%l7 + %i0] 0x88,	%g6
	fcmpne16	%f18,	%f4,	%i7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	fbo	%fcc1,	loop_2787
	fba,a	%fcc3,	loop_2788
	bpos,a,pn	%xcc,	loop_2789
	tl	%xcc,	0x4
loop_2787:
	fornot1	%f18,	%f6,	%f18
loop_2788:
	tleu	%icc,	0x3
loop_2789:
	nop
	setx	0x5E6F1B7E4F893216,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f18
	udivx	%l3,	0x14A8,	%l2
	tge	%xcc,	0x2
	andn	%g1,	0x1B15,	%i1
	subccc	%i6,	%g4,	%l1
	tleu	%icc,	0x3
	fand	%f24,	%f8,	%f18
	movle	%icc,	%o4,	%o6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%i4
	xnor	%g3,	%i2,	%g5
	taddcc	%l4,	0x1C5A,	%o3
	be,a,pt	%icc,	loop_2790
	nop
	fitod	%f12,	%f0
	fdtoi	%f0,	%f9
	fmovdg	%icc,	%f28,	%f28
	addcc	%i5,	%o2,	%l5
loop_2790:
	sub	%l0,	%o5,	%l6
	edge16n	%o0,	%i3,	%g7
	std	%f6,	[%l7 + 0x48]
	movrlez	%o7,	%g2,	%g6
	fmovrde	%i0,	%f26,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc2,	loop_2791
	edge32ln	%i7,	%l3,	%o1
	tvs	%xcc,	0x5
	subc	%l2,	0x0AFF,	%g1
loop_2791:
	edge8ln	%i1,	%g4,	%i6
	bn,a,pn	%xcc,	loop_2792
	movge	%xcc,	%o4,	%o6
	movrgz	%l1,	0x37B,	%g3
	tne	%icc,	0x6
loop_2792:
	movle	%xcc,	%i2,	%i4
	array16	%g5,	%l4,	%i5
	fmovdleu	%icc,	%f18,	%f3
	tsubcctv	%o2,	0x06E9,	%l5
	fbg,a	%fcc1,	loop_2793
	fcmpne16	%f28,	%f8,	%o3
	taddcc	%l0,	0x0BE8,	%o5
	sub	%o0,	0x16A5,	%i3
loop_2793:
	fmovdvc	%xcc,	%f11,	%f25
	orn	%g7,	0x1115,	%o7
	mulx	%g2,	0x069E,	%g6
	sub	%l6,	%i7,	%i0
	xnor	%l3,	%o1,	%g1
	movl	%xcc,	%l2,	%g4
	movleu	%icc,	%i1,	%o4
	srl	%o6,	0x08,	%l1
	array8	%g3,	%i2,	%i4
	fmovrsne	%i6,	%f14,	%f24
	srl	%g5,	%l4,	%i5
	brlez,a	%o2,	loop_2794
	bne,a,pt	%icc,	loop_2795
	fbug	%fcc0,	loop_2796
	fpackfix	%f10,	%f0
loop_2794:
	edge16l	%l5,	%l0,	%o5
loop_2795:
	orn	%o0,	%o3,	%i3
loop_2796:
	fmovsvs	%icc,	%f19,	%f13
	popc	0x1864,	%o7
	fmul8sux16	%f30,	%f16,	%f2
	move	%xcc,	%g7,	%g6
	orncc	%l6,	%i7,	%g2
	alignaddrl	%l3,	%o1,	%i0
	edge16l	%l2,	%g1,	%i1
	smulcc	%o4,	%g4,	%l1
	sll	%g3,	%o6,	%i4
	nop
	setx	loop_2797,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%xcc,	0x5
	umulcc	%i2,	%g5,	%i6
	edge16n	%l4,	%o2,	%i5
loop_2797:
	nop
	set	0x20, %i7
	ldxa	[%l7 + %i7] 0x10,	%l0
	wr	%g0,	0x18,	%asi
	stwa	%o5,	[%l7 + 0x68] %asi
	andn	%l5,	0x1EC9,	%o0
	movcs	%icc,	%o3,	%i3
	fmovdge	%icc,	%f4,	%f19
	fcmpeq16	%f14,	%f20,	%g7
	fmovde	%icc,	%f20,	%f15
	movleu	%icc,	%o7,	%g6
	xor	%l6,	%g2,	%l3
	fmovrsgez	%i7,	%f9,	%f30
	tgu	%icc,	0x5
	wr	%g0,	0x80,	%asi
	stwa	%o1,	[%l7 + 0x5C] %asi
	tcs	%icc,	0x0
	subc	%l2,	%i0,	%g1
	brgez	%o4,	loop_2798
	movrgez	%g4,	%l1,	%g3
	udiv	%i1,	0x1557,	%i4
	tgu	%xcc,	0x1
loop_2798:
	array16	%o6,	%i2,	%i6
	sra	%g5,	0x19,	%o2
	movre	%l4,	%i5,	%l0
	fmovspos	%xcc,	%f12,	%f22
	movleu	%xcc,	%o5,	%l5
	move	%icc,	%o3,	%i3
	st	%f17,	[%l7 + 0x10]
	st	%f22,	[%l7 + 0x08]
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%o0
	movn	%xcc,	%o7,	%g7
	sdivcc	%l6,	0x097E,	%g6
	tle	%xcc,	0x4
	fzeros	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x4
	alignaddrl	%l3,	%g2,	%i7
	tg	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l2,	%i0,	%g1
	prefetch	[%l7 + 0x0C],	 0x2
	fmovdvs	%icc,	%f20,	%f12
	stb	%o1,	[%l7 + 0x24]
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x15] %asi,	%o4
	tle	%icc,	0x7
	movneg	%xcc,	%g4,	%g3
	mulx	%i1,	0x0A02,	%l1
	fmovd	%f4,	%f0
	fmovdn	%icc,	%f29,	%f31
	edge8l	%i4,	%o6,	%i2
	fmovrslz	%g5,	%f12,	%f30
	fbn	%fcc3,	loop_2799
	tgu	%icc,	0x0
	movneg	%xcc,	%i6,	%l4
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x10,	%o2
loop_2799:
	fmovscc	%xcc,	%f10,	%f11
	fcmple16	%f4,	%f8,	%i5
	fmovsa	%icc,	%f25,	%f21
	edge32ln	%o5,	%l0,	%o3
	ldx	[%l7 + 0x50],	%l5
	udiv	%i3,	0x1356,	%o0
	fbule	%fcc2,	loop_2800
	flush	%l7 + 0x58
	umulcc	%g7,	%l6,	%o7
	udivcc	%l3,	0x073B,	%g6
loop_2800:
	sdivx	%g2,	0x1B0C,	%i7
	brz,a	%l2,	loop_2801
	fpmerge	%f25,	%f26,	%f6
	addc	%g1,	0x1DA8,	%i0
	edge16	%o1,	%g4,	%g3
loop_2801:
	lduh	[%l7 + 0x20],	%o4
	orn	%l1,	0x043A,	%i4
	srlx	%o6,	0x12,	%i1
	set	0x24, %o3
	lduba	[%l7 + %o3] 0x81,	%i2
	movrgez	%i6,	0x031,	%g5
	edge16ln	%l4,	%o2,	%o5
	udivcc	%i5,	0x0B5D,	%o3
	fbg	%fcc1,	loop_2802
	movrlz	%l0,	0x2D3,	%i3
	array32	%l5,	%g7,	%l6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
loop_2802:
	bneg,a	%icc,	loop_2803
	edge16	%o7,	%g6,	%g2
	fmul8x16au	%f4,	%f12,	%f12
	fbul	%fcc0,	loop_2804
loop_2803:
	tsubcc	%l3,	%i7,	%g1
	fmovdcc	%icc,	%f20,	%f10
	movle	%xcc,	%i0,	%o1
loop_2804:
	fbg	%fcc0,	loop_2805
	fcmpgt32	%f18,	%f10,	%g4
	movcs	%icc,	%l2,	%g3
	orcc	%o4,	%i4,	%o6
loop_2805:
	sll	%l1,	0x16,	%i2
	fbn,a	%fcc0,	loop_2806
	fmovrslz	%i1,	%f6,	%f23
	fnot2	%f24,	%f10
	sra	%g5,	0x0C,	%i6
loop_2806:
	flush	%l7 + 0x60
	edge32l	%o2,	%o5,	%l4
	tge	%icc,	0x0
	fbe,a	%fcc2,	loop_2807
	edge32l	%o3,	%i5,	%i3
	sdiv	%l5,	0x05AC,	%g7
	taddcc	%l0,	%l6,	%o0
loop_2807:
	fmovd	%f20,	%f16
	tvc	%icc,	0x2
	fnot2	%f10,	%f6
	edge8n	%g6,	%o7,	%l3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x72] %asi,	%g2
	movcc	%xcc,	%g1,	%i0
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x88,	%i7,	%g4
	ldub	[%l7 + 0x57],	%o1
	fornot2	%f24,	%f26,	%f28
	tvc	%xcc,	0x0
	nop
	setx	0x21CD70B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x30534542,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f1,	%f16
	nop
	set	0x42, %i3
	lduh	[%l7 + %i3],	%g3
	array32	%o4,	%l2,	%i4
	movne	%icc,	%o6,	%l1
	movrne	%i2,	0x187,	%g5
	movne	%xcc,	%i6,	%o2
	fone	%f4
	umulcc	%o5,	%l4,	%i1
	movl	%xcc,	%i5,	%o3
	movn	%icc,	%i3,	%g7
	fzero	%f6
	fbule	%fcc2,	loop_2808
	movl	%icc,	%l0,	%l6
	stb	%o0,	[%l7 + 0x2E]
	addccc	%g6,	0x1641,	%l5
loop_2808:
	fblg	%fcc1,	loop_2809
	movrlz	%l3,	0x009,	%g2
	edge32l	%o7,	%g1,	%i0
	taddcctv	%i7,	0x1B20,	%o1
loop_2809:
	udivx	%g4,	0x12A3,	%g3
	fnegd	%f12,	%f24
	edge8	%o4,	%l2,	%i4
	tpos	%icc,	0x1
	nop
	setx loop_2810, %l0, %l1
	jmpl %l1, %o6
	umulcc	%l1,	%g5,	%i2
	bl,a,pn	%icc,	loop_2811
	fpadd16	%f18,	%f18,	%f26
loop_2810:
	umul	%o2,	0x0FCC,	%i6
	nop
	setx	loop_2812,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2811:
	movrgez	%o5,	0x125,	%l4
	xnor	%i1,	0x10CF,	%i5
	ta	%icc,	0x2
loop_2812:
	fornot1	%f20,	%f0,	%f10
	or	%o3,	%g7,	%l0
	andn	%l6,	%i3,	%o0
	fmovrslz	%l5,	%f2,	%f3
	fmovrslz	%g6,	%f8,	%f23
	bn,pn	%xcc,	loop_2813
	bl	loop_2814
	movrlz	%l3,	0x37E,	%g2
	nop
	setx loop_2815, %l0, %l1
	jmpl %l1, %o7
loop_2813:
	edge16ln	%i0,	%g1,	%i7
loop_2814:
	movvs	%icc,	%o1,	%g4
	movn	%icc,	%o4,	%g3
loop_2815:
	fmovsg	%xcc,	%f7,	%f16
	fmovrse	%i4,	%f6,	%f25
	srlx	%l2,	%l1,	%o6
	ba,pn	%xcc,	loop_2816
	ldd	[%l7 + 0x28],	%g4
	xor	%i2,	%o2,	%o5
	srl	%i6,	0x01,	%i1
loop_2816:
	fornot2s	%f30,	%f15,	%f20
	udivcc	%l4,	0x1E6A,	%o3
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x20, %o5
	ldsha	[%l7 + %o5] 0x18,	%i5
	sdiv	%g7,	0x1153,	%l0
	move	%icc,	%i3,	%o0
	fmovdle	%icc,	%f6,	%f25
	ldsw	[%l7 + 0x20],	%l5
	fornot2s	%f0,	%f14,	%f16
	edge32n	%g6,	%l3,	%l6
	ldstub	[%l7 + 0x10],	%o7
	fxnor	%f18,	%f14,	%f20
	mulx	%i0,	%g2,	%i7
	bshuffle	%f20,	%f26,	%f30
	tvc	%icc,	0x7
	popc	%o1,	%g1
	movpos	%icc,	%g4,	%o4
	fmovsg	%xcc,	%f24,	%f23
	fandnot1	%f6,	%f4,	%f18
	alignaddrl	%g3,	%i4,	%l2
	xorcc	%o6,	%g5,	%l1
	edge16ln	%o2,	%i2,	%i6
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i1
	edge16ln	%l4,	%o3,	%i5
	srl	%o5,	0x1B,	%l0
	ldsh	[%l7 + 0x0C],	%i3
	andn	%g7,	%l5,	%o0
	fbl	%fcc1,	loop_2817
	movrgez	%l3,	%g6,	%o7
	bgu,a	%xcc,	loop_2818
	nop
	setx	0xE70973F1F0543665,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_2817:
	fmovdge	%icc,	%f5,	%f24
	edge8l	%i0,	%l6,	%g2
loop_2818:
	fandnot2s	%f7,	%f20,	%f16
	movre	%o1,	0x07A,	%i7
	movcc	%xcc,	%g4,	%g1
	orcc	%g3,	%i4,	%l2
	tle	%xcc,	0x3
	tsubcc	%o4,	0x042B,	%o6
	andncc	%l1,	%o2,	%i2
	ba,a	%icc,	loop_2819
	movcc	%icc,	%i6,	%i1
	fcmple32	%f2,	%f16,	%l4
	sll	%o3,	0x19,	%g5
loop_2819:
	sethi	0x1020,	%i5
	fmovrdne	%o5,	%f24,	%f24
	movrlez	%l0,	%i3,	%l5
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g7
	movl	%xcc,	%l3,	%g6
	ble,a,pt	%icc,	loop_2820
	nop
	setx	0x6C28E16B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x9AC58956,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f7,	%f0
	xor	%o7,	0x138B,	%o0
	move	%icc,	%i0,	%l6
loop_2820:
	mulx	%g2,	0x18D0,	%i7
	edge8ln	%o1,	%g4,	%g3
	xorcc	%g1,	0x084C,	%i4
	orn	%o4,	0x134F,	%o6
	ldub	[%l7 + 0x35],	%l1
	mulscc	%l2,	0x0589,	%i2
	tcs	%xcc,	0x7
	movre	%i6,	%o2,	%l4
	udiv	%o3,	0x107C,	%g5
	tgu	%xcc,	0x3
	tne	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x66] %asi,	%i1
	ba,a	%icc,	loop_2821
	bneg,pn	%xcc,	loop_2822
	ldsb	[%l7 + 0x6A],	%i5
	movle	%icc,	%o5,	%l0
loop_2821:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x1D] %asi,	%i3
loop_2822:
	array32	%l5,	%g7,	%g6
	movrlz	%l3,	%o0,	%i0
	addc	%l6,	0x1586,	%o7
	be	%xcc,	loop_2823
	andn	%g2,	%i7,	%o1
	nop
	setx	0xD06BF653,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	bpos	loop_2824
loop_2823:
	edge32	%g4,	%g3,	%g1
	edge32n	%i4,	%o6,	%l1
	tleu	%xcc,	0x0
loop_2824:
	array16	%o4,	%i2,	%i6
	addc	%l2,	0x17C2,	%l4
	edge16l	%o2,	%o3,	%i1
	pdist	%f24,	%f0,	%f0
	tgu	%icc,	0x2
	andcc	%g5,	%i5,	%o5
	fmovrdlez	%l0,	%f30,	%f4
	lduh	[%l7 + 0x22],	%l5
	move	%icc,	%i3,	%g6
	srax	%g7,	0x1D,	%l3
	alignaddr	%i0,	%o0,	%o7
	fmovrde	%l6,	%f4,	%f2
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0xf8,	%f16
	movne	%xcc,	%i7,	%g2
	smul	%g4,	%o1,	%g3
	tl	%icc,	0x6
	edge16l	%i4,	%o6,	%l1
	edge8l	%o4,	%i2,	%g1
	mulx	%i6,	%l2,	%l4
	movle	%xcc,	%o3,	%o2
	fpsub16	%f10,	%f2,	%f24
	orn	%g5,	0x18A2,	%i1
	mulx	%i5,	0x1435,	%o5
	fmovda	%xcc,	%f28,	%f14
	nop
	setx	loop_2825,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%l0,	0x1342,	%i3
	umul	%l5,	0x1DCC,	%g6
	bl,pt	%icc,	loop_2826
loop_2825:
	edge16ln	%l3,	%g7,	%o0
	set	0x60, %l3
	prefetcha	[%l7 + %l3] 0x10,	 0x3
loop_2826:
	be,a	loop_2827
	fmul8x16au	%f15,	%f14,	%f24
	xnor	%i0,	%i7,	%g2
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l6
loop_2827:
	tle	%xcc,	0x3
	edge16ln	%g4,	%g3,	%o1
	tpos	%icc,	0x5
	fxors	%f1,	%f1,	%f25
	tsubcctv	%i4,	%l1,	%o4
	nop
	setx	0x010DFA236311291B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f22
	sll	%i2,	0x05,	%o6
	udivx	%i6,	0x0A1F,	%l2
	udivcc	%g1,	0x0964,	%l4
	fornot2	%f24,	%f12,	%f10
	sll	%o2,	%g5,	%o3
	fmovdvc	%xcc,	%f18,	%f17
	nop
	setx	0xDEAFE6A6F07797AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x20BC875734758395,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f20,	%f10
	andn	%i5,	%o5,	%l0
	fmovsleu	%xcc,	%f27,	%f19
	orcc	%i3,	%l5,	%g6
	udiv	%i1,	0x0603,	%g7
	addcc	%l3,	0x1C89,	%o0
	tsubcc	%i0,	0x166C,	%o7
	movvc	%icc,	%i7,	%l6
	movvs	%xcc,	%g4,	%g3
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x0F] %asi,	%g2
	mova	%icc,	%o1,	%l1
	set	0x48, %i4
	stba	%o4,	[%l7 + %i4] 0x0c
	and	%i2,	0x107D,	%i4
	addcc	%o6,	0x16BF,	%l2
	xnor	%g1,	0x0731,	%i6
	fmovrde	%o2,	%f2,	%f20
	call	loop_2828
	sllx	%l4,	%g5,	%o3
	tpos	%icc,	0x6
	fbul	%fcc0,	loop_2829
loop_2828:
	tcs	%icc,	0x3
	bgu	%icc,	loop_2830
	sllx	%o5,	%i5,	%i3
loop_2829:
	movpos	%icc,	%l5,	%l0
	nop
	setx	0x928B69DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xD5F72589,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f23,	%f8
loop_2830:
	edge32ln	%g6,	%i1,	%l3
	sdivx	%g7,	0x1522,	%i0
	mulx	%o0,	0x1144,	%i7
	set	0x74, %g7
	sta	%f22,	[%l7 + %g7] 0x0c
	tcc	%icc,	0x7
	movrgez	%l6,	%g4,	%g3
	membar	0x1B
	bvs,a,pn	%xcc,	loop_2831
	fbg	%fcc2,	loop_2832
	movrlz	%g2,	%o7,	%l1
	fbue	%fcc1,	loop_2833
loop_2831:
	edge32n	%o4,	%i2,	%i4
loop_2832:
	fand	%f4,	%f30,	%f28
	edge32l	%o6,	%o1,	%l2
loop_2833:
	fmovrdlez	%g1,	%f12,	%f4
	fandnot2s	%f15,	%f25,	%f25
	bgu,a	%xcc,	loop_2834
	fornot1s	%f19,	%f6,	%f24
	srlx	%i6,	%l4,	%g5
	bvs,a	loop_2835
loop_2834:
	edge8	%o2,	%o3,	%i5
	movneg	%xcc,	%i3,	%l5
	movrlez	%l0,	0x308,	%o5
loop_2835:
	movne	%xcc,	%i1,	%l3
	std	%f6,	[%l7 + 0x68]
	swap	[%l7 + 0x40],	%g7
	fmovdg	%xcc,	%f21,	%f22
	movne	%icc,	%i0,	%g6
	movre	%o0,	0x3C1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i7,	%g3,	%g4
	ldsw	[%l7 + 0x58],	%o7
	fbg,a	%fcc0,	loop_2836
	tneg	%icc,	0x0
	xorcc	%l1,	%g2,	%o4
	nop
	setx loop_2837, %l0, %l1
	jmpl %l1, %i2
loop_2836:
	movrne	%o6,	0x1E5,	%i4
	movle	%icc,	%l2,	%o1
	fmovsn	%xcc,	%f5,	%f20
loop_2837:
	fcmpne16	%f28,	%f22,	%i6
	mulx	%g1,	0x1F14,	%l4
	edge8l	%g5,	%o2,	%o3
	ldstub	[%l7 + 0x44],	%i5
	fbl,a	%fcc3,	loop_2838
	sethi	0x09F1,	%i3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x80,	%l5,	%l0
loop_2838:
	nop
	setx	loop_2839,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpsub32	%f10,	%f26,	%f20
	addc	%o5,	%i1,	%g7
	mulx	%i0,	0x07CB,	%g6
loop_2839:
	nop
	setx loop_2840, %l0, %l1
	jmpl %l1, %o0
	or	%l3,	0x16DD,	%i7
	mova	%xcc,	%g3,	%g4
	fnand	%f20,	%f16,	%f22
loop_2840:
	udivcc	%l6,	0x1759,	%o7
	sll	%l1,	0x18,	%o4
	edge32n	%i2,	%o6,	%g2
	fornot2	%f22,	%f12,	%f10
	tsubcctv	%i4,	%l2,	%o1
	movpos	%icc,	%i6,	%g1
	sdiv	%l4,	0x13AA,	%o2
	movrne	%o3,	%g5,	%i5
	stbar
	tgu	%icc,	0x0
	fmovdgu	%icc,	%f30,	%f14
	fpack16	%f22,	%f16
	xorcc	%i3,	%l5,	%o5
	ldstub	[%l7 + 0x7B],	%i1
	andncc	%l0,	%g7,	%i0
	fba	%fcc3,	loop_2841
	nop
	setx	0x5DFC3D59868ADB7F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD4FDD72DB701C9B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f0,	%f8
	movrgz	%g6,	%o0,	%l3
	faligndata	%f2,	%f6,	%f18
loop_2841:
	movrlz	%g3,	%g4,	%l6
	fnot1	%f10,	%f8
	fmovsg	%icc,	%f16,	%f15
	sub	%o7,	%i7,	%o4
	xnorcc	%l1,	0x041A,	%i2
	fandnot2	%f12,	%f24,	%f18
	fmovrsne	%o6,	%f15,	%f25
	sdivcc	%g2,	0x136D,	%i4
	addc	%l2,	0x0E8D,	%i6
	fble	%fcc0,	loop_2842
	tcc	%icc,	0x5
	xnor	%g1,	0x17DE,	%o1
	tgu	%icc,	0x2
loop_2842:
	movre	%o2,	%l4,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o3,	%i3,	%i5
	udivx	%l5,	0x1126,	%o5
	movvc	%xcc,	%i1,	%g7
	array32	%l0,	%i0,	%o0
	fbl,a	%fcc1,	loop_2843
	fble	%fcc2,	loop_2844
	nop
	setx	0x58B9EB1C2138FCA7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f0
	tl	%icc,	0x3
loop_2843:
	fnot2s	%f10,	%f8
loop_2844:
	alignaddr	%g6,	%g3,	%g4
	movrgez	%l6,	0x2CE,	%l3
	movrlez	%o7,	0x165,	%i7
	andn	%l1,	%i2,	%o4
	fmovsne	%xcc,	%f2,	%f24
	movl	%icc,	%g2,	%o6
	andn	%l2,	%i6,	%g1
	tvs	%xcc,	0x1
	orn	%o1,	%o2,	%i4
	movpos	%xcc,	%g5,	%o3
	fnot2	%f0,	%f2
	fbne,a	%fcc3,	loop_2845
	alignaddrl	%i3,	%i5,	%l4
	fmovsle	%xcc,	%f9,	%f9
	call	loop_2846
loop_2845:
	tle	%icc,	0x6
	fbue,a	%fcc2,	loop_2847
	orcc	%o5,	0x06F9,	%l5
loop_2846:
	nop
	set	0x2C, %o7
	sth	%g7,	[%l7 + %o7]
	movcs	%icc,	%l0,	%i0
loop_2847:
	movgu	%xcc,	%o0,	%i1
	ldsh	[%l7 + 0x4C],	%g6
	tpos	%icc,	0x4
	tgu	%xcc,	0x5
	stx	%g4,	[%l7 + 0x58]
	membar	0x1D
	fpmerge	%f27,	%f10,	%f10
	ta	%xcc,	0x4
	fmovsg	%icc,	%f25,	%f9
	fbge,a	%fcc1,	loop_2848
	nop
	setx	0x5111534D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x64C804A5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f21,	%f30
	fnegd	%f12,	%f18
	andncc	%l6,	%l3,	%o7
loop_2848:
	and	%g3,	%i7,	%i2
	edge16l	%o4,	%g2,	%l1
	membar	0x3F
	ld	[%l7 + 0x34],	%f23
	call	loop_2849
	smulcc	%o6,	0x0345,	%i6
	movrne	%g1,	0x294,	%l2
	move	%icc,	%o2,	%o1
loop_2849:
	tvs	%icc,	0x4
	edge32n	%i4,	%g5,	%o3
	movneg	%icc,	%i3,	%l4
	brgez,a	%i5,	loop_2850
	bleu	loop_2851
	array32	%o5,	%g7,	%l5
	movvc	%icc,	%l0,	%o0
loop_2850:
	fmovscs	%icc,	%f2,	%f12
loop_2851:
	mulscc	%i0,	0x1F9F,	%i1
	orn	%g6,	%l6,	%l3
	stb	%o7,	[%l7 + 0x26]
	tsubcctv	%g4,	0x048B,	%g3
	taddcctv	%i7,	0x0D18,	%o4
	brz,a	%g2,	loop_2852
	fmovrdgz	%l1,	%f8,	%f0
	movvs	%xcc,	%i2,	%i6
	udivx	%g1,	0x14E4,	%o6
loop_2852:
	tle	%icc,	0x1
	sdiv	%o2,	0x01C7,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i4,	0x08C6,	%g5
	fbu	%fcc3,	loop_2853
	movneg	%icc,	%l2,	%i3
	fpmerge	%f30,	%f8,	%f8
	mova	%xcc,	%l4,	%o3
loop_2853:
	movrgz	%i5,	%g7,	%l5
	membar	0x6A
	movleu	%xcc,	%o5,	%o0
	andcc	%l0,	%i0,	%i1
	edge32l	%g6,	%l3,	%o7
	movl	%xcc,	%g4,	%g3
	prefetch	[%l7 + 0x48],	 0x0
	andcc	%i7,	%l6,	%g2
	movrlz	%o4,	%i2,	%i6
	movn	%icc,	%l1,	%g1
	xor	%o2,	%o6,	%o1
	bcs	loop_2854
	movcs	%xcc,	%i4,	%g5
	nop
	setx	0xBCFF2D0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xFEBC941C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f12,	%f21
	mulscc	%i3,	0x1267,	%l4
loop_2854:
	tg	%xcc,	0x0
	set	0x44, %o4
	stwa	%o3,	[%l7 + %o4] 0xe3
	membar	#Sync
	xor	%l2,	0x1CC2,	%i5
	ldsb	[%l7 + 0x56],	%l5
	ld	[%l7 + 0x3C],	%f6
	movrne	%g7,	0x1CB,	%o5
	nop
	setx	0x1EDD43D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xB192BA30,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f3,	%f10
	array16	%l0,	%o0,	%i0
	sub	%g6,	%l3,	%i1
	array32	%o7,	%g4,	%g3
	fpadd32	%f20,	%f6,	%f24
	array8	%l6,	%i7,	%g2
	nop
	fitod	%f10,	%f30
	fdtos	%f30,	%f21
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x74] %asi,	%o4
	fmul8x16	%f15,	%f14,	%f4
	edge16	%i6,	%l1,	%g1
	fandnot2s	%f12,	%f3,	%f31
	tn	%xcc,	0x5
	udivx	%o2,	0x19E2,	%o6
	edge32n	%o1,	%i2,	%i4
	movcc	%xcc,	%i3,	%l4
	ba	loop_2855
	popc	0x1AD9,	%o3
	sllx	%l2,	%g5,	%l5
	subccc	%g7,	0x172E,	%i5
loop_2855:
	nop
	fitos	%f8,	%f30
	fstod	%f30,	%f16
	fbue	%fcc2,	loop_2856
	sir	0x070A
	fbn,a	%fcc0,	loop_2857
	nop
	setx	0xA7207327,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f9
loop_2856:
	lduh	[%l7 + 0x6A],	%o5
	xor	%l0,	0x122F,	%o0
loop_2857:
	movrne	%i0,	%l3,	%g6
	stx	%i1,	[%l7 + 0x68]
	set	0x5C, %l4
	lduha	[%l7 + %l4] 0x0c,	%o7
	be	%icc,	loop_2858
	mulscc	%g4,	%g3,	%l6
	udivx	%g2,	0x1F11,	%o4
	mulx	%i7,	0x1A53,	%l1
loop_2858:
	xnorcc	%g1,	0x1B7B,	%i6
	movrne	%o6,	%o2,	%i2
	fmovscc	%icc,	%f17,	%f18
	fnot1s	%f18,	%f25
	fbg,a	%fcc3,	loop_2859
	udivx	%i4,	0x1D4C,	%i3
	wr	%g0,	0x18,	%asi
	stha	%l4,	[%l7 + 0x26] %asi
loop_2859:
	fmovdneg	%xcc,	%f27,	%f6
	movg	%icc,	%o1,	%o3
	sllx	%g5,	0x05,	%l5
	movrlz	%g7,	%l2,	%i5
	array16	%l0,	%o5,	%o0
	tn	%xcc,	0x3
	tvs	%icc,	0x7
	fxor	%f2,	%f24,	%f22
	popc	0x0ABD,	%i0
	sll	%g6,	0x08,	%i1
	movle	%icc,	%l3,	%g4
	fmovd	%f20,	%f0
	array32	%g3,	%l6,	%g2
	tgu	%icc,	0x7
	udivcc	%o4,	0x0D4D,	%o7
	be	loop_2860
	movrgez	%l1,	0x0FC,	%i7
	movne	%icc,	%i6,	%g1
	fcmpeq32	%f20,	%f20,	%o2
loop_2860:
	movl	%icc,	%i2,	%i4
	movcc	%icc,	%o6,	%i3
	movneg	%icc,	%o1,	%l4
	faligndata	%f28,	%f16,	%f16
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x68] %asi,	%o3
	te	%xcc,	0x0
	tn	%xcc,	0x3
	fnor	%f4,	%f4,	%f28
	udivx	%g5,	0x14DB,	%l5
	movpos	%xcc,	%l2,	%i5
	tvc	%icc,	0x3
	sth	%l0,	[%l7 + 0x0A]
	sdiv	%g7,	0x0DA9,	%o5
	fand	%f12,	%f12,	%f24
	subccc	%i0,	%o0,	%g6
	fmovrsne	%l3,	%f20,	%f16
	fexpand	%f25,	%f22
	movge	%xcc,	%g4,	%i1
	sdivx	%g3,	0x04AC,	%l6
	movg	%xcc,	%o4,	%g2
	st	%f10,	[%l7 + 0x3C]
	sdiv	%o7,	0x1BC2,	%l1
	fmul8sux16	%f18,	%f0,	%f12
	udivx	%i7,	0x10FB,	%g1
	xorcc	%o2,	%i2,	%i4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x15,	%f16
	sra	%i6,	%i3,	%o6
	udivx	%o1,	0x178D,	%l4
	movcc	%icc,	%g5,	%l5
	edge32n	%l2,	%o3,	%l0
	fsrc2	%f30,	%f26
	te	%xcc,	0x7
	membar	0x04
	movgu	%icc,	%g7,	%i5
	movrlez	%i0,	0x397,	%o0
	edge32l	%g6,	%o5,	%g4
	fcmple16	%f20,	%f16,	%i1
	orn	%l3,	%g3,	%o4
	and	%g2,	0x0836,	%l6
	movre	%o7,	%i7,	%l1
	movneg	%icc,	%o2,	%g1
	fzeros	%f23
	movvc	%xcc,	%i4,	%i6
	movrgez	%i2,	%o6,	%o1
	umulcc	%l4,	0x11B8,	%i3
	mova	%xcc,	%g5,	%l2
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
	movvs	%icc,	%o3,	%l0
	movrlz	%l5,	%i5,	%i0
	lduw	[%l7 + 0x30],	%o0
	fmovrse	%g6,	%f25,	%f13
	tvs	%xcc,	0x7
	nop
	setx	0x815186AAAC23A16C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f2
	sllx	%o5,	%g4,	%i1
	xnorcc	%l3,	%g7,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%g2,	%l6
	fcmpeq32	%f28,	%f0,	%g3
	orcc	%i7,	%l1,	%o7
	tgu	%icc,	0x3
	fcmpgt16	%f10,	%f22,	%g1
	fmovdneg	%xcc,	%f15,	%f4
	fbule	%fcc3,	loop_2861
	alignaddrl	%i4,	%o2,	%i6
	bcs,pn	%icc,	loop_2862
	movneg	%icc,	%o6,	%i2
loop_2861:
	tcc	%icc,	0x0
	te	%icc,	0x1
loop_2862:
	nop
	set	0x41, %g3
	ldstuba	[%l7 + %g3] 0x04,	%o1
	set	0x38, %o6
	ldswa	[%l7 + %o6] 0x15,	%l4
	fbue	%fcc3,	loop_2863
	ldsb	[%l7 + 0x78],	%i3
	fmovrsne	%l2,	%f29,	%f15
	stb	%g5,	[%l7 + 0x38]
loop_2863:
	fbug,a	%fcc2,	loop_2864
	movneg	%xcc,	%l0,	%l5
	sethi	0x0E5F,	%i5
	orn	%o3,	%o0,	%i0
loop_2864:
	andn	%g6,	%g4,	%i1
	movge	%xcc,	%l3,	%g7
	edge8ln	%o4,	%o5,	%l6
	tn	%icc,	0x4
	umul	%g3,	%g2,	%l1
	tl	%icc,	0x0
	edge32l	%i7,	%o7,	%g1
	fmovdle	%icc,	%f25,	%f11
	set	0x1C, %g6
	lda	[%l7 + %g6] 0x19,	%f14
	movge	%xcc,	%o2,	%i4
	udivcc	%i6,	0x1C57,	%o6
	tcs	%icc,	0x7
	xorcc	%i2,	%l4,	%o1
	wr	%g0,	0x23,	%asi
	stba	%i3,	[%l7 + 0x1D] %asi
	membar	#Sync
	movneg	%xcc,	%l2,	%g5
	subccc	%l5,	0x0D70,	%l0
	movrlez	%i5,	%o3,	%i0
	fmovse	%xcc,	%f15,	%f27
	bn,a	loop_2865
	movg	%icc,	%g6,	%g4
	tle	%xcc,	0x2
	fbue,a	%fcc3,	loop_2866
loop_2865:
	fcmpne32	%f8,	%f2,	%i1
	umul	%o0,	%l3,	%o4
	edge32n	%g7,	%l6,	%g3
loop_2866:
	fmovsn	%xcc,	%f21,	%f6
	fors	%f27,	%f14,	%f15
	taddcctv	%o5,	0x1862,	%g2
	movvs	%xcc,	%l1,	%o7
	fnegd	%f8,	%f16
	or	%i7,	0x0C8C,	%g1
	udiv	%o2,	0x1D08,	%i6
	smul	%o6,	0x1563,	%i4
	tcs	%xcc,	0x3
	movleu	%icc,	%i2,	%l4
	srlx	%i3,	%l2,	%o1
	fmovsgu	%xcc,	%f18,	%f1
	andn	%l5,	0x05DF,	%g5
	ta	%icc,	0x2
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f16
	edge16n	%l0,	%o3,	%i5
	tn	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i0,	%g4,	%i1
	or	%o0,	%l3,	%g6
	tn	%xcc,	0x0
	te	%xcc,	0x4
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o4
	membar	0x21
	fmul8ulx16	%f4,	%f26,	%f12
	xnor	%l6,	%g3,	%g7
	sir	0x0690
	sir	0x1DF4
	fmovdpos	%xcc,	%f16,	%f14
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x36] %asi,	%g2
	fbne	%fcc3,	loop_2867
	nop
	set	0x38, %o0
	ldstub	[%l7 + %o0],	%o5
	ldstub	[%l7 + 0x78],	%l1
	sllx	%i7,	%g1,	%o2
loop_2867:
	sdivx	%i6,	0x1A6B,	%o6
	movrgez	%i4,	0x29F,	%i2
	movre	%o7,	0x112,	%i3
	sll	%l2,	%o1,	%l4
	andcc	%g5,	%l5,	%o3
	fmovrse	%i5,	%f19,	%f10
	fmovd	%f24,	%f12
	lduw	[%l7 + 0x28],	%l0
	orcc	%g4,	%i0,	%o0
	wr	%g0,	0x04,	%asi
	stwa	%i1,	[%l7 + 0x14] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g6,	0x1202,	%o4
	subcc	%l6,	%g3,	%g7
	array8	%g2,	%o5,	%l1
	lduh	[%l7 + 0x4A],	%l3
	set	0x6C, %i1
	lduba	[%l7 + %i1] 0x11,	%i7
	fones	%f27
	sdiv	%o2,	0x167D,	%g1
	xorcc	%i6,	0x0996,	%o6
	movvc	%xcc,	%i4,	%o7
	ldsw	[%l7 + 0x0C],	%i3
	nop
	fitos	%f3,	%f12
	fstoi	%f12,	%f26
	edge16ln	%i2,	%l2,	%l4
	tneg	%xcc,	0x0
	bn,a,pt	%xcc,	loop_2868
	tl	%icc,	0x7
	tg	%icc,	0x6
	bcc,a	loop_2869
loop_2868:
	tvc	%icc,	0x7
	add	%o1,	0x14AB,	%l5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g5,	%o3
loop_2869:
	fmovrdne	%i5,	%f24,	%f22
	fmovsleu	%icc,	%f26,	%f22
	orn	%l0,	%g4,	%o0
	nop
	setx	0x3D300D9C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f1
	movrne	%i1,	0x101,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f10,	%f1
	fstox	%f1,	%f0
	fxtos	%f0,	%f0
	swap	[%l7 + 0x68],	%o4
	orn	%l6,	0x14EA,	%g3
	lduw	[%l7 + 0x30],	%g6
	edge16l	%g2,	%o5,	%l1
	array16	%l3,	%g7,	%i7
	tne	%icc,	0x7
	edge8l	%o2,	%i6,	%o6
	edge32n	%i4,	%g1,	%o7
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i3
	fmovrdlz	%l2,	%f4,	%f4
	movg	%xcc,	%i2,	%l4
	sdivcc	%o1,	0x1AF3,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o3,	%g5,	%l0
	fmovdneg	%xcc,	%f13,	%f30
	tneg	%xcc,	0x3
	udiv	%g4,	0x1EE2,	%i5
	movle	%xcc,	%o0,	%i1
	array8	%o4,	%i0,	%l6
	tleu	%xcc,	0x1
	movne	%icc,	%g6,	%g2
	tsubcc	%o5,	%g3,	%l3
	subc	%g7,	0x185B,	%i7
	fmovrdgz	%o2,	%f6,	%f22
	fcmpgt32	%f28,	%f4,	%l1
	sethi	0x138A,	%o6
	tgu	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i4,	%i6,	%o7
	fandnot2s	%f30,	%f0,	%f10
	sdiv	%i3,	0x05DE,	%l2
	movleu	%icc,	%g1,	%l4
	nop
	setx loop_2870, %l0, %l1
	jmpl %l1, %i2
	movne	%icc,	%l5,	%o3
	fbn	%fcc1,	loop_2871
	subcc	%g5,	%o1,	%l0
loop_2870:
	st	%f10,	[%l7 + 0x40]
	tl	%icc,	0x6
loop_2871:
	fpmerge	%f18,	%f3,	%f26
	set	0x3D, %g5
	ldstuba	[%l7 + %g5] 0x80,	%i5
	srax	%g4,	%o0,	%o4
	lduw	[%l7 + 0x10],	%i1
	sir	0x0962
	srl	%i0,	%l6,	%g2
	brz	%o5,	loop_2872
	ld	[%l7 + 0x24],	%f28
	sra	%g3,	%l3,	%g6
	fmovrslz	%g7,	%f29,	%f26
loop_2872:
	array8	%i7,	%o2,	%o6
	xor	%l1,	%i4,	%i6
	xnor	%i3,	%l2,	%o7
	mulscc	%l4,	0x1B40,	%i2
	fmovse	%xcc,	%f1,	%f2
	std	%f22,	[%l7 + 0x28]
	fmovrsgez	%g1,	%f4,	%f10
	movl	%xcc,	%o3,	%g5
	addc	%o1,	%l0,	%l5
	bneg,pt	%xcc,	loop_2873
	stb	%g4,	[%l7 + 0x26]
	bvs,pn	%icc,	loop_2874
	edge32l	%i5,	%o0,	%o4
loop_2873:
	tpos	%icc,	0x4
	xorcc	%i0,	%i1,	%g2
loop_2874:
	nop
	set	0x48, %o1
	ldxa	[%l7 + %o1] 0x18,	%l6
	fmuld8sux16	%f5,	%f7,	%f22
	movrgz	%g3,	%o5,	%l3
	bgu,a,pt	%xcc,	loop_2875
	xorcc	%g7,	%i7,	%o2
	array32	%g6,	%o6,	%l1
	nop
	fitod	%f1,	%f20
loop_2875:
	bne	%xcc,	loop_2876
	edge16n	%i6,	%i3,	%l2
	tgu	%xcc,	0x6
	fors	%f1,	%f17,	%f24
loop_2876:
	alignaddrl	%o7,	%i4,	%i2
	fnegs	%f30,	%f13
	edge8	%l4,	%o3,	%g5
	nop
	set	0x40, %l5
	lduw	[%l7 + %l5],	%g1
	addccc	%o1,	0x082D,	%l0
	subccc	%g4,	%i5,	%o0
	ta	%xcc,	0x1
	umulcc	%o4,	0x0439,	%i0
	bn	loop_2877
	movrne	%l5,	%g2,	%i1
	movleu	%xcc,	%l6,	%o5
	tne	%icc,	0x7
loop_2877:
	udivcc	%g3,	0x14C8,	%l3
	set	0x80, %l2
	ldxa	[%g0 + %l2] 0x58,	%i7
	fcmpgt16	%f20,	%f10,	%g7
	fbne,a	%fcc0,	loop_2878
	fba	%fcc0,	loop_2879
	taddcc	%g6,	%o6,	%l1
	brz	%o2,	loop_2880
loop_2878:
	fmovdneg	%xcc,	%f14,	%f20
loop_2879:
	edge32	%i3,	%i6,	%o7
	set	0x42, %i5
	ldsba	[%l7 + %i5] 0x80,	%l2
loop_2880:
	srlx	%i4,	%i2,	%o3
	wr	%g0,	0x0c,	%asi
	stba	%l4,	[%l7 + 0x2B] %asi
	array32	%g5,	%o1,	%l0
	tneg	%icc,	0x4
	pdist	%f30,	%f22,	%f0
	nop
	setx	0x207CC728,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	edge8n	%g4,	%i5,	%g1
	fpsub32	%f4,	%f8,	%f30
	ta	%icc,	0x3
	udivcc	%o4,	0x1601,	%i0
	fpadd32s	%f28,	%f23,	%f11
	bg,pn	%icc,	loop_2881
	fxor	%f14,	%f0,	%f14
	srlx	%o0,	0x03,	%g2
	array32	%i1,	%l6,	%o5
loop_2881:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%l5,	loop_2882
	fzero	%f10
	ld	[%l7 + 0x3C],	%f20
	edge8n	%l3,	%i7,	%g7
loop_2882:
	subcc	%g3,	%g6,	%l1
	edge32n	%o2,	%i3,	%o6
	fornot1	%f8,	%f4,	%f18
	fone	%f0
	subccc	%i6,	0x1EF9,	%o7
	edge32n	%i4,	%l2,	%i2
	fmovse	%xcc,	%f8,	%f7
	bcc,a	loop_2883
	srax	%l4,	%o3,	%o1
	movrlz	%g5,	%g4,	%i5
	xorcc	%l0,	%g1,	%o4
loop_2883:
	edge32	%o0,	%i0,	%i1
	fmovsl	%icc,	%f14,	%f28
	array16	%g2,	%l6,	%l5
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movrgez	%o5,	0x0A0,	%l3
	edge8	%i7,	%g7,	%g3
	fzeros	%f2
	tpos	%icc,	0x2
	fcmpgt16	%f12,	%f18,	%g6
	edge32	%l1,	%o2,	%o6
	bcs,a,pn	%icc,	loop_2884
	tle	%xcc,	0x6
	sir	0x0736
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%i3,	%i6
loop_2884:
	fmovsneg	%icc,	%f27,	%f9
	be,pn	%icc,	loop_2885
	mulx	%i4,	%l2,	%i2
	nop
	set	0x78, %g4
	ldx	[%l7 + %g4],	%o7
	nop
	set	0x68, %l1
	stx	%o3,	[%l7 + %l1]
loop_2885:
	ldsb	[%l7 + 0x13],	%l4
	stb	%o1,	[%l7 + 0x39]
	nop
	setx	0xD5619FAED43D0559,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4F11182D25E7F687,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f2,	%f0
	edge32n	%g4,	%g5,	%l0
	fmovdle	%xcc,	%f17,	%f29
	fpadd16	%f14,	%f16,	%f30
	subccc	%g1,	0x082F,	%o4
	nop
	setx	0x46610A21,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x42F8E92B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f18,	%f24
	fmovsvc	%xcc,	%f23,	%f22
	fmovrsgz	%i5,	%f31,	%f6
	movg	%icc,	%i0,	%i1
	tcs	%icc,	0x1
	nop
	setx	0xBD2A56F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f17
	udiv	%o0,	0x19A6,	%g2
	taddcctv	%l6,	%l5,	%l3
	edge8ln	%i7,	%o5,	%g7
	edge16l	%g3,	%l1,	%g6
	fmovscs	%icc,	%f3,	%f25
	edge8l	%o2,	%i3,	%i6
	mulx	%i4,	%l2,	%o6
	fnegs	%f10,	%f11
	smulcc	%i2,	%o3,	%l4
	tne	%icc,	0x3
	tcs	%xcc,	0x6
	nop
	setx loop_2886, %l0, %l1
	jmpl %l1, %o7
	tne	%xcc,	0x3
	ldsh	[%l7 + 0x1C],	%g4
	nop
	setx	loop_2887,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2886:
	fmovdvc	%icc,	%f26,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o1,	%g5
loop_2887:
	move	%icc,	%l0,	%o4
	movvs	%icc,	%i5,	%g1
	and	%i0,	0x1EB8,	%i1
	nop
	setx	0x206B801A,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	sdivcc	%g2,	0x1C38,	%o0
	fba	%fcc2,	loop_2888
	movrlz	%l6,	%l3,	%l5
	fmovde	%icc,	%f0,	%f0
	movrne	%o5,	0x1CC,	%i7
loop_2888:
	movrne	%g7,	0x354,	%l1
	subccc	%g6,	0x08BF,	%o2
	move	%icc,	%g3,	%i3
	st	%f2,	[%l7 + 0x70]
	nop
	setx loop_2889, %l0, %l1
	jmpl %l1, %i6
	sll	%i4,	0x10,	%l2
	stb	%i2,	[%l7 + 0x36]
	fmovsgu	%icc,	%f18,	%f30
loop_2889:
	movrgez	%o3,	0x14E,	%l4
	add	%o6,	%o7,	%g4
	edge16ln	%o1,	%l0,	%g5
	sdivcc	%o4,	0x12FB,	%i5
	tle	%xcc,	0x3
	tneg	%xcc,	0x4
	udiv	%i0,	0x1829,	%g1
	sra	%g2,	%o0,	%l6
	nop
	fitos	%f9,	%f15
	fstox	%f15,	%f2
	fxtos	%f2,	%f11
	fmovdpos	%icc,	%f3,	%f25
	sth	%l3,	[%l7 + 0x4C]
	movpos	%xcc,	%l5,	%i1
	tpos	%icc,	0x7
	set	0x54, %l6
	ldswa	[%l7 + %l6] 0x89,	%o5
	bge,a,pt	%xcc,	loop_2890
	subccc	%g7,	%i7,	%l1
	set	0x74, %i2
	ldsha	[%l7 + %i2] 0x88,	%o2
loop_2890:
	ta	%icc,	0x1
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x48] %asi,	%g3
	brlz,a	%g6,	loop_2891
	membar	0x01
	edge8n	%i3,	%i6,	%l2
	andn	%i2,	0x0772,	%i4
loop_2891:
	movvs	%xcc,	%o3,	%o6
	movle	%icc,	%o7,	%l4
	edge32l	%o1,	%g4,	%l0
	movle	%icc,	%g5,	%o4
	orncc	%i5,	0x1947,	%g1
	ba	%xcc,	loop_2892
	movge	%icc,	%g2,	%o0
	alignaddrl	%i0,	%l3,	%l5
	edge32	%l6,	%i1,	%o5
loop_2892:
	nop
	fitod	%f8,	%f2
	fdtos	%f2,	%f18
	tsubcc	%i7,	0x0ED4,	%g7
	nop
	setx	0x5140E3B23F230FE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f28
	srl	%l1,	%g3,	%g6
	fone	%f14
	fornot1s	%f21,	%f12,	%f31
	fmovs	%f2,	%f2
	fbu,a	%fcc3,	loop_2893
	umul	%o2,	%i3,	%l2
	xnorcc	%i6,	%i2,	%o3
	edge32l	%o6,	%o7,	%i4
loop_2893:
	movneg	%icc,	%l4,	%g4
	movleu	%xcc,	%o1,	%l0
	orcc	%o4,	0x0630,	%g5
	mulx	%i5,	%g2,	%g1
	movvc	%icc,	%i0,	%o0
	fba,a	%fcc0,	loop_2894
	movvc	%icc,	%l5,	%l3
	st	%f16,	[%l7 + 0x50]
	addcc	%i1,	0x0193,	%o5
loop_2894:
	movvc	%icc,	%l6,	%g7
	movre	%l1,	%i7,	%g3
	andcc	%g6,	0x124E,	%o2
	fpack32	%f16,	%f0,	%f24
	tpos	%xcc,	0x5
	fmovs	%f10,	%f31
	addcc	%l2,	%i3,	%i6
	move	%xcc,	%o3,	%o6
	tvc	%xcc,	0x3
	sdiv	%o7,	0x1498,	%i2
	addc	%l4,	0x05B3,	%i4
	sdiv	%g4,	0x0CCA,	%o1
	fzeros	%f5
	udivcc	%o4,	0x14A3,	%l0
	array32	%i5,	%g5,	%g2
	sra	%i0,	0x0D,	%g1
	fpadd16	%f28,	%f2,	%f12
	movpos	%xcc,	%o0,	%l3
	movvs	%icc,	%l5,	%o5
	fmovdvc	%xcc,	%f0,	%f21
	movrgez	%l6,	0x158,	%i1
	movgu	%xcc,	%l1,	%g7
	orcc	%g3,	0x1F54,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc0,	loop_2895
	add	%g6,	%o2,	%l2
	movrgez	%i3,	%i6,	%o3
	nop
	setx	0x5CA0DD72B076E121,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_2895:
	ldsh	[%l7 + 0x7C],	%o7
	movrgz	%i2,	%o6,	%l4
	ldub	[%l7 + 0x5B],	%g4
	movg	%icc,	%o1,	%o4
	fcmpgt32	%f30,	%f6,	%l0
	movvc	%xcc,	%i5,	%g5
	ldsb	[%l7 + 0x18],	%g2
	fnand	%f12,	%f10,	%f20
	mulscc	%i0,	%i4,	%o0
	fxor	%f22,	%f4,	%f28
	tcc	%icc,	0x2
	fandnot2s	%f5,	%f28,	%f3
	fmovdg	%xcc,	%f16,	%f19
	movgu	%xcc,	%g1,	%l3
	bn,a	%xcc,	loop_2896
	array16	%l5,	%o5,	%i1
	tvs	%icc,	0x0
	set	0x3C, %i0
	stwa	%l1,	[%l7 + %i0] 0xe2
	membar	#Sync
loop_2896:
	tle	%icc,	0x3
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x16
	membar	#Sync
	movgu	%xcc,	%g7,	%g3
	andncc	%l6,	%g6,	%o2
	membar	0x6D
	nop
	set	0x57, %g1
	ldub	[%l7 + %g1],	%i7
	mulscc	%i3,	%l2,	%o3
	edge8n	%i6,	%o7,	%o6
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x0] %asi,	%i2
	bn	loop_2897
	fbug,a	%fcc2,	loop_2898
	sir	0x1C79
	fmuld8ulx16	%f19,	%f27,	%f26
loop_2897:
	sdivx	%l4,	0x123B,	%o1
loop_2898:
	fbule,a	%fcc1,	loop_2899
	fxors	%f15,	%f31,	%f21
	udivx	%o4,	0x0031,	%g4
	fbl	%fcc1,	loop_2900
loop_2899:
	udiv	%i5,	0x0E47,	%g5
	nop
	setx	0x3F7CE30D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x0B264395,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f6,	%f14
	and	%g2,	%l0,	%i4
loop_2900:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o0,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %o3
	lduwa	[%l7 + %o3] 0x89,	%g1
	array16	%l5,	%l3,	%i1
	pdist	%f6,	%f30,	%f16
	membar	0x71
	flush	%l7 + 0x70
	taddcc	%l1,	%g7,	%g3
	set	0x44, %g2
	swapa	[%l7 + %g2] 0x18,	%l6
	fbn	%fcc1,	loop_2901
	ldd	[%l7 + 0x30],	%f6
	andn	%o5,	%o2,	%i7
	wr	%g0,	0xe3,	%asi
	stxa	%g6,	[%l7 + 0x28] %asi
	membar	#Sync
loop_2901:
	mulscc	%i3,	%o3,	%i6
	flush	%l7 + 0x20
	fornot2	%f30,	%f22,	%f12
	taddcctv	%o7,	0x1CA7,	%o6
	set	0x26, %o5
	ldstuba	[%l7 + %o5] 0x19,	%i2
	edge16n	%l2,	%l4,	%o4
	fmovdl	%xcc,	%f24,	%f9
	ta	%xcc,	0x2
	fpadd32s	%f13,	%f5,	%f28
	fpackfix	%f8,	%f0
	call	loop_2902
	umulcc	%g4,	0x06C8,	%i5
	or	%o1,	0x0175,	%g5
	fmovrse	%g2,	%f10,	%f24
loop_2902:
	tvc	%icc,	0x7
	tne	%xcc,	0x2
	orn	%l0,	0x079D,	%i4
	addccc	%i0,	%g1,	%l5
	fornot1s	%f2,	%f29,	%f6
	edge16n	%o0,	%i1,	%l1
	set	0x10, %i3
	ldsha	[%l7 + %i3] 0x11,	%g7
	sdiv	%g3,	0x0BFB,	%l3
	movre	%l6,	0x0F6,	%o5
	wr	%g0,	0x23,	%asi
	stba	%i7,	[%l7 + 0x1C] %asi
	membar	#Sync
	fcmpgt32	%f14,	%f24,	%o2
	tne	%xcc,	0x4
	fmovdne	%xcc,	%f7,	%f10
	smulcc	%i3,	0x0663,	%g6
	array32	%i6,	%o3,	%o7
	udivcc	%i2,	0x12C5,	%o6
	movcs	%xcc,	%l4,	%o4
	fmovscs	%xcc,	%f0,	%f4
	mulx	%l2,	%g4,	%i5
	fbg,a	%fcc3,	loop_2903
	tcc	%icc,	0x7
	movpos	%xcc,	%g5,	%g2
	fsrc1	%f30,	%f8
loop_2903:
	sdiv	%o1,	0x09ED,	%i4
	addccc	%i0,	0x1DD4,	%g1
	sethi	0x026B,	%l0
	fmul8sux16	%f2,	%f10,	%f8
	movg	%xcc,	%l5,	%i1
	edge8n	%l1,	%o0,	%g3
	fxnor	%f0,	%f18,	%f2
	sub	%g7,	%l3,	%l6
	taddcc	%i7,	%o2,	%o5
	tneg	%xcc,	0x4
	movrlez	%i3,	0x370,	%i6
	set	0x35, %l3
	lduba	[%l7 + %l3] 0x81,	%o3
	fandnot1	%f28,	%f8,	%f22
	sllx	%o7,	%g6,	%o6
	ldub	[%l7 + 0x39],	%l4
	membar	0x0E
	taddcc	%o4,	0x1F9D,	%l2
	array8	%g4,	%i2,	%i5
	bl,pn	%icc,	loop_2904
	movleu	%xcc,	%g5,	%o1
	bneg,pt	%icc,	loop_2905
	ldsb	[%l7 + 0x57],	%g2
loop_2904:
	movge	%xcc,	%i4,	%g1
	array32	%l0,	%l5,	%i1
loop_2905:
	fcmpeq32	%f12,	%f16,	%l1
	mulx	%o0,	%g3,	%g7
	smulcc	%i0,	%l3,	%l6
	ldub	[%l7 + 0x0A],	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o5,	0x152,	%i7
	movvs	%icc,	%i3,	%o3
	edge16n	%o7,	%i6,	%g6
	fbue,a	%fcc2,	loop_2906
	udiv	%l4,	0x0E32,	%o6
	swap	[%l7 + 0x7C],	%o4
	orn	%l2,	%g4,	%i5
loop_2906:
	fpsub16	%f6,	%f2,	%f10
	addc	%g5,	%i2,	%o1
	fbule	%fcc2,	loop_2907
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
	fmovrde	%g2,	%f30,	%f12
loop_2907:
	fsrc2	%f16,	%f12
	stw	%i4,	[%l7 + 0x2C]
	subcc	%l0,	0x1A4F,	%g1
	movcs	%icc,	%l5,	%i1
	fbne	%fcc2,	loop_2908
	membar	0x16
	bn,a	loop_2909
	fnot2	%f24,	%f26
loop_2908:
	nop
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%o0,	%l1
loop_2909:
	array16	%g7,	%i0,	%l3
	mulx	%g3,	%o2,	%l6
	ba	%xcc,	loop_2910
	tg	%icc,	0x4
	nop
	fitos	%f8,	%f20
	fstox	%f20,	%f12
	move	%icc,	%i7,	%i3
loop_2910:
	sethi	0x1C19,	%o5
	movg	%xcc,	%o3,	%i6
	fsrc1	%f0,	%f2
	movge	%icc,	%o7,	%g6
	edge16l	%l4,	%o6,	%o4
	fxors	%f3,	%f14,	%f11
	movvs	%xcc,	%g4,	%i5
	sllx	%g5,	%l2,	%i2
	fba	%fcc3,	loop_2911
	addccc	%o1,	%g2,	%l0
	andncc	%g1,	%l5,	%i4
	fexpand	%f31,	%f18
loop_2911:
	alignaddr	%i1,	%o0,	%l1
	andn	%i0,	%g7,	%l3
	tleu	%icc,	0x5
	alignaddr	%o2,	%l6,	%i7
	fpack16	%f8,	%f13
	fnor	%f10,	%f0,	%f26
	movpos	%xcc,	%g3,	%i3
	fpsub16	%f28,	%f0,	%f8
	edge8	%o3,	%i6,	%o7
	set	0x58, %i4
	ldswa	[%l7 + %i4] 0x11,	%g6
	fcmpne16	%f18,	%f18,	%o5
	fbl,a	%fcc0,	loop_2912
	fbue,a	%fcc3,	loop_2913
	sub	%o6,	%o4,	%l4
	xnorcc	%g4,	0x105B,	%g5
loop_2912:
	edge32ln	%i5,	%l2,	%i2
loop_2913:
	fmovdcs	%xcc,	%f3,	%f29
	taddcctv	%g2,	0x13AD,	%o1
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fpsub32	%f22,	%f8,	%f16
	array16	%g1,	%l0,	%l5
	subc	%i1,	%o0,	%i4
	tg	%xcc,	0x5
	nop
	setx	0x1226ED8DEA2BAEF2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xFF6A4DF45FA9B63F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f30,	%f30
	stx	%l1,	[%l7 + 0x60]
	movn	%icc,	%i0,	%l3
	set	0x50, %g7
	stxa	%o2,	[%l7 + %g7] 0x80
	fnot1	%f4,	%f12
	tle	%xcc,	0x4
	addcc	%g7,	%i7,	%g3
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	taddcc	%l6,	%i3,	%i6
	nop
	fitos	%f8,	%f14
	fmovrdgez	%o7,	%f4,	%f24
	te	%xcc,	0x1
	sub	%o3,	%o5,	%g6
	movvc	%xcc,	%o6,	%o4
	st	%f10,	[%l7 + 0x40]
	fbue,a	%fcc1,	loop_2914
	fbo,a	%fcc3,	loop_2915
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x1
loop_2914:
	sir	0x01EE
loop_2915:
	movrlz	%g4,	%l4,	%i5
	move	%xcc,	%g5,	%i2
	xnor	%l2,	0x01AA,	%g2
	movvs	%icc,	%o1,	%l0
	udivx	%l5,	0x1905,	%g1
	set	0x76, %o2
	stha	%i1,	[%l7 + %o2] 0x15
	or	%i4,	%l1,	%o0
	swap	[%l7 + 0x50],	%i0
	fmovd	%f22,	%f8
	smul	%l3,	0x17D6,	%o2
	fbul,a	%fcc3,	loop_2916
	taddcc	%g7,	0x162B,	%i7
	fbge	%fcc0,	loop_2917
	edge8n	%g3,	%l6,	%i3
loop_2916:
	tneg	%xcc,	0x5
	nop
	setx	0x0F7189B155E8C415,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x7B5462B8228533E2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f16,	%f4
loop_2917:
	array32	%o7,	%o3,	%o5
	ba,a	loop_2918
	add	%i6,	%g6,	%o6
	nop
	setx	0x3D5303632A29064F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f12
	movgu	%icc,	%g4,	%o4
loop_2918:
	array32	%l4,	%i5,	%g5
	addcc	%l2,	%g2,	%i2
	stw	%l0,	[%l7 + 0x0C]
	nop
	setx loop_2919, %l0, %l1
	jmpl %l1, %l5
	nop
	fitod	%f0,	%f10
	fdtoi	%f10,	%f29
	edge16l	%o1,	%i1,	%g1
	alignaddrl	%l1,	%i4,	%o0
loop_2919:
	fmovrde	%l3,	%f24,	%f2
	edge32	%o2,	%i0,	%g7
	mova	%icc,	%i7,	%l6
	fpsub32s	%f18,	%f9,	%f25
	edge8l	%g3,	%i3,	%o3
	mulscc	%o7,	%o5,	%g6
	fbo,a	%fcc1,	loop_2920
	fxnors	%f25,	%f14,	%f7
	edge32l	%i6,	%o6,	%g4
	movrgz	%o4,	0x3BF,	%i5
loop_2920:
	sra	%g5,	%l4,	%l2
	movge	%icc,	%i2,	%g2
	set	0x51, %o7
	stba	%l0,	[%l7 + %o7] 0x04
	move	%xcc,	%o1,	%i1
	prefetch	[%l7 + 0x38],	 0x2
	fpsub32s	%f20,	%f13,	%f27
	membar	0x38
	edge8l	%g1,	%l5,	%l1
	sllx	%o0,	%l3,	%i4
	movrlz	%o2,	0x1AC,	%g7
	srlx	%i7,	%i0,	%l6
	tge	%xcc,	0x0
	set	0x70, %l4
	lda	[%l7 + %l4] 0x18,	%f1
	srl	%i3,	%o3,	%g3
	tcs	%icc,	0x5
	fmovdleu	%icc,	%f11,	%f0
	movrgez	%o7,	%o5,	%g6
	ldd	[%l7 + 0x48],	%f24
	andcc	%o6,	%i6,	%o4
	wr	%g0,	0xea,	%asi
	stba	%i5,	[%l7 + 0x43] %asi
	membar	#Sync
	tneg	%icc,	0x7
	movleu	%icc,	%g5,	%g4
	set	0x4B, %l0
	ldstuba	[%l7 + %l0] 0x19,	%l4
	fmovsneg	%icc,	%f21,	%f20
	tsubcctv	%i2,	%g2,	%l0
	set	0x24, %g3
	ldsba	[%l7 + %g3] 0x15,	%o1
	sll	%i1,	%g1,	%l5
	fsrc1s	%f7,	%f11
	nop
	set	0x70, %o6
	sth	%l2,	[%l7 + %o6]
	movrgz	%o0,	0x0E1,	%l1
	movl	%xcc,	%i4,	%l3
	tg	%xcc,	0x4
	andcc	%g7,	%i7,	%o2
	orn	%i0,	%l6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x7
	fandnot2	%f8,	%f28,	%f0
	membar	0x2C
	movcs	%xcc,	%g3,	%o7
	edge16l	%o5,	%i3,	%g6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o6
	mulx	%i6,	%o4,	%g5
	edge16n	%g4,	%l4,	%i5
	tcs	%icc,	0x6
	movneg	%xcc,	%g2,	%l0
	fbu	%fcc2,	loop_2921
	edge16l	%i2,	%i1,	%g1
	fmovs	%f26,	%f8
	fbl,a	%fcc2,	loop_2922
loop_2921:
	tge	%xcc,	0x0
	fcmpne16	%f20,	%f14,	%l5
	st	%f7,	[%l7 + 0x64]
loop_2922:
	nop
	setx loop_2923, %l0, %l1
	jmpl %l1, %o1
	nop
	setx	loop_2924,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movneg	%xcc,	%o0,	%l2
	orcc	%l1,	%i4,	%l3
loop_2923:
	sra	%i7,	%o2,	%g7
loop_2924:
	udivcc	%i0,	0x15DE,	%o3
	movne	%xcc,	%l6,	%o7
	srlx	%g3,	0x19,	%i3
	ta	%xcc,	0x6
	mulx	%g6,	0x072E,	%o6
	movvs	%xcc,	%i6,	%o4
	orn	%o5,	0x05AF,	%g5
	fmovsne	%xcc,	%f4,	%f21
	add	%l4,	%i5,	%g2
	lduw	[%l7 + 0x30],	%g4
	sub	%l0,	0x0994,	%i2
	fandnot2s	%f18,	%f1,	%f15
	tgu	%icc,	0x0
	addc	%i1,	0x0E09,	%g1
	wr	%g0,	0x04,	%asi
	stwa	%o1,	[%l7 + 0x50] %asi
	edge8	%o0,	%l5,	%l1
	smul	%i4,	0x0E75,	%l3
	tgu	%icc,	0x7
	nop
	setx	0x3237BB86EB5DCDAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f6
	brlz,a	%i7,	loop_2925
	brgez,a	%o2,	loop_2926
	popc	%g7,	%i0
	movre	%o3,	0x1C8,	%l6
loop_2925:
	ldsb	[%l7 + 0x0B],	%l2
loop_2926:
	nop
	set	0x48, %g6
	prefetcha	[%l7 + %g6] 0x88,	 0x1
	array16	%i3,	%g6,	%o6
	tpos	%xcc,	0x3
	mulscc	%i6,	0x0427,	%g3
	set	0x58, %o4
	lduha	[%l7 + %o4] 0x19,	%o4
	and	%g5,	0x0887,	%l4
	tleu	%xcc,	0x2
	flush	%l7 + 0x64
	edge16ln	%o5,	%g2,	%g4
	brz	%i5,	loop_2927
	movge	%xcc,	%i2,	%l0
	tcc	%icc,	0x1
	movge	%icc,	%g1,	%i1
loop_2927:
	fands	%f9,	%f29,	%f0
	sllx	%o0,	%l5,	%o1
	edge8n	%i4,	%l3,	%i7
	fpadd32	%f26,	%f14,	%f28
	tne	%xcc,	0x0
	movvc	%xcc,	%o2,	%l1
	fbu	%fcc2,	loop_2928
	fmovsge	%xcc,	%f30,	%f4
	movn	%xcc,	%g7,	%i0
	fmovdne	%icc,	%f5,	%f28
loop_2928:
	fbul	%fcc0,	loop_2929
	ta	%icc,	0x1
	fmovdgu	%xcc,	%f22,	%f28
	fornot1	%f26,	%f0,	%f24
loop_2929:
	fble	%fcc2,	loop_2930
	fbn,a	%fcc1,	loop_2931
	stx	%o3,	[%l7 + 0x10]
	srax	%l6,	0x0D,	%l2
loop_2930:
	edge16l	%o7,	%g6,	%o6
loop_2931:
	fba,a	%fcc3,	loop_2932
	tleu	%xcc,	0x5
	fblg,a	%fcc3,	loop_2933
	fnegs	%f22,	%f26
loop_2932:
	edge32n	%i6,	%i3,	%g3
	fbge	%fcc1,	loop_2934
loop_2933:
	xnor	%g5,	0x162C,	%l4
	tneg	%xcc,	0x7
	edge16n	%o5,	%o4,	%g2
loop_2934:
	movrlz	%g4,	0x0F5,	%i2
	andn	%l0,	0x16B7,	%i5
	fmovrslez	%g1,	%f17,	%f9
	fzero	%f20
	tn	%icc,	0x7
	movgu	%icc,	%i1,	%o0
	sdiv	%o1,	0x1575,	%i4
	fnors	%f2,	%f24,	%f29
	fcmpne16	%f6,	%f28,	%l5
	orncc	%l3,	%i7,	%l1
	fmovdge	%xcc,	%f13,	%f4
	bn,pn	%xcc,	loop_2935
	nop
	setx	loop_2936,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%icc,	%g7,	%i0
	nop
	setx	0x00730BE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
loop_2935:
	alignaddrl	%o3,	%l6,	%l2
loop_2936:
	fmovdleu	%xcc,	%f0,	%f5
	fmovdcs	%icc,	%f12,	%f19
	wr	%g0,	0x89,	%asi
	stba	%o2,	[%l7 + 0x23] %asi
	fmovdn	%xcc,	%f31,	%f21
	movcs	%icc,	%o7,	%g6
	fmovrse	%i6,	%f17,	%f30
	ldx	[%l7 + 0x78],	%o6
	movleu	%icc,	%g3,	%g5
	lduw	[%l7 + 0x50],	%i3
	fba	%fcc0,	loop_2937
	ldx	[%l7 + 0x70],	%o5
	movne	%xcc,	%l4,	%o4
	subcc	%g2,	0x1781,	%g4
loop_2937:
	tvs	%icc,	0x6
	tleu	%icc,	0x1
	movrlz	%i2,	%i5,	%l0
	andncc	%i1,	%g1,	%o1
	srl	%o0,	%i4,	%l5
	nop
	fitos	%f27,	%f24
	te	%icc,	0x4
	swap	[%l7 + 0x28],	%i7
	sdiv	%l3,	0x1660,	%g7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%i0
	tle	%xcc,	0x2
	lduw	[%l7 + 0x48],	%o3
	movre	%l1,	0x371,	%l2
	fmovrse	%l6,	%f24,	%f20
	fba	%fcc3,	loop_2938
	bge,pn	%icc,	loop_2939
	addc	%o7,	0x0FFA,	%g6
	fsrc2	%f0,	%f6
loop_2938:
	xnor	%o2,	%i6,	%g3
loop_2939:
	fmovdleu	%xcc,	%f9,	%f1
	addc	%o6,	%i3,	%g5
	fsrc1	%f30,	%f14
	mova	%icc,	%l4,	%o5
	fmovdpos	%xcc,	%f5,	%f2
	fornot2s	%f19,	%f7,	%f31
	fmovdle	%icc,	%f21,	%f7
	fpadd32	%f16,	%f14,	%f10
	fmovscc	%icc,	%f24,	%f20
	set	0x0C, %o0
	stha	%o4,	[%l7 + %o0] 0x19
	movcc	%xcc,	%g2,	%i2
	fmovscs	%icc,	%f13,	%f24
	array16	%g4,	%l0,	%i1
	movl	%icc,	%i5,	%g1
	fmovsn	%xcc,	%f30,	%f0
	fmovrslz	%o1,	%f29,	%f7
	std	%f26,	[%l7 + 0x78]
	movn	%xcc,	%o0,	%l5
	tneg	%icc,	0x3
	orncc	%i7,	0x0715,	%i4
	fzeros	%f17
	ldsh	[%l7 + 0x14],	%g7
	set	0x7C, %i1
	lduha	[%l7 + %i1] 0x18,	%i0
	movne	%icc,	%l3,	%o3
	addccc	%l1,	%l2,	%l6
	fmovsle	%xcc,	%f23,	%f21
	tl	%icc,	0x0
	edge32l	%o7,	%g6,	%o2
	fba	%fcc3,	loop_2940
	sir	0x10BE
	tvs	%icc,	0x1
	tle	%icc,	0x1
loop_2940:
	nop
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x30] %asi,	%g3
	bvs	loop_2941
	orn	%i6,	0x06CF,	%i3
	movge	%xcc,	%o6,	%l4
	tge	%icc,	0x6
loop_2941:
	edge8ln	%g5,	%o5,	%g2
	ta	%xcc,	0x0
	edge32	%i2,	%o4,	%g4
	movg	%xcc,	%l0,	%i5
	udivcc	%i1,	0x0D3E,	%o1
	brz,a	%g1,	loop_2942
	fcmpgt32	%f10,	%f14,	%l5
	sllx	%i7,	0x1F,	%o0
	or	%g7,	%i0,	%i4
loop_2942:
	movrne	%o3,	0x3DA,	%l1
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x80
	set	0x4A, %i6
	ldsha	[%l7 + %i6] 0x19,	%l2
	xnorcc	%l6,	%l3,	%o7
	set	0x65, %l5
	stba	%o2,	[%l7 + %l5] 0x80
	set	0x1E, %o1
	ldstuba	[%l7 + %o1] 0x81,	%g6
	fabsd	%f12,	%f16
	set	0x3C, %i5
	ldswa	[%l7 + %i5] 0x89,	%g3
	fmovsge	%icc,	%f4,	%f20
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf8
	membar	#Sync
	nop
	setx loop_2943, %l0, %l1
	jmpl %l1, %i6
	edge32ln	%i3,	%o6,	%g5
	edge16	%l4,	%o5,	%g2
	set	0x55, %l1
	stba	%o4,	[%l7 + %l1] 0xea
	membar	#Sync
loop_2943:
	fmovrslez	%g4,	%f9,	%f21
	bl,a	loop_2944
	movpos	%icc,	%i2,	%l0
	movcs	%icc,	%i1,	%o1
	edge8l	%g1,	%l5,	%i7
loop_2944:
	popc	0x10D2,	%i5
	fmovrse	%o0,	%f12,	%f29
	xorcc	%i0,	%g7,	%o3
	edge8	%i4,	%l2,	%l1
	tsubcc	%l6,	0x1CD7,	%l3
	movvc	%xcc,	%o7,	%g6
	sethi	0x01AE,	%g3
	set	0x64, %g4
	stha	%i6,	[%l7 + %g4] 0x15
	fandnot2	%f2,	%f22,	%f0
	tgu	%icc,	0x5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x19,	%i3,	%o6
	fornot2	%f0,	%f10,	%f22
	fpsub16s	%f30,	%f12,	%f20
	set	0x0D, %l6
	ldsba	[%l7 + %l6] 0x15,	%o2
	set	0x70, %i2
	lduwa	[%l7 + %i2] 0x81,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g5,	%g2
	sll	%o4,	%g4,	%i2
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x74] %asi,	%f26
	fsrc1s	%f19,	%f23
	smul	%o5,	%i1,	%l0
	orncc	%o1,	%l5,	%i7
	alignaddrl	%g1,	%o0,	%i0
	fmovdgu	%icc,	%f0,	%f5
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f23
	tsubcc	%i5,	0x0509,	%o3
	movvc	%xcc,	%g7,	%l2
	tsubcc	%i4,	0x036F,	%l1
	lduh	[%l7 + 0x7A],	%l6
	movvs	%xcc,	%o7,	%g6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x11,	%l3,	%i6
	xnorcc	%g3,	%i3,	%o6
	edge8l	%l4,	%g5,	%g2
	fmovspos	%icc,	%f25,	%f5
	bvc,pt	%icc,	loop_2945
	array16	%o2,	%o4,	%i2
	movpos	%icc,	%g4,	%o5
	movl	%xcc,	%l0,	%i1
loop_2945:
	brgz,a	%l5,	loop_2946
	nop
	setx	0x7A02553FDEEB96DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x01FAD3BAFFBA403B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f22,	%f22
	tgu	%icc,	0x5
	movrgz	%o1,	0x226,	%i7
loop_2946:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%o0,	%g1
	brnz	%i5,	loop_2947
	subcc	%i0,	%o3,	%l2
	tne	%icc,	0x6
	edge8	%g7,	%i4,	%l6
loop_2947:
	nop
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x38] %asi,	%o7
	fsrc1	%f22,	%f24
	subcc	%g6,	%l3,	%i6
	fornot1s	%f3,	%f12,	%f4
	sir	0x025E
	brgez	%g3,	loop_2948
	movle	%xcc,	%l1,	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] 0x04,	%i3,	%l4
loop_2948:
	movleu	%icc,	%g2,	%g5
	fbn,a	%fcc3,	loop_2949
	sdiv	%o2,	0x069D,	%i2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x2D] %asi,	%g4
loop_2949:
	addc	%o4,	%l0,	%o5
	orncc	%l5,	0x05D7,	%o1
	sdivcc	%i1,	0x1C14,	%o0
	fmovrslz	%i7,	%f21,	%f24
	std	%f24,	[%l7 + 0x48]
	movn	%xcc,	%i5,	%i0
	alignaddr	%g1,	%l2,	%g7
	addccc	%o3,	%i4,	%o7
	mova	%xcc,	%l6,	%l3
	tg	%icc,	0x6
	mulscc	%g6,	%i6,	%l1
	tgu	%icc,	0x4
	orcc	%g3,	0x04A4,	%o6
	popc	0x0FDE,	%i3
	sub	%l4,	0x025E,	%g5
	mulscc	%g2,	%o2,	%g4
	set	0x34, %i0
	stwa	%i2,	[%l7 + %i0] 0x18
	fmovrsne	%l0,	%f24,	%f11
	ta	%xcc,	0x0
	tge	%icc,	0x5
	umulcc	%o5,	%l5,	%o1
	stbar
	alignaddrl	%o4,	%o0,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i5,	%i0,	%g1
	add	%i7,	%l2,	%g7
	edge8l	%i4,	%o3,	%l6
	nop
	setx	0xB0A3C42B7003D627,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xA875618F12C53B84,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f8,	%f0
	edge16ln	%l3,	%g6,	%o7
	fbo,a	%fcc2,	loop_2950
	call	loop_2951
	edge32ln	%l1,	%g3,	%i6
	movleu	%xcc,	%i3,	%l4
loop_2950:
	fble	%fcc0,	loop_2952
loop_2951:
	addc	%g5,	0x1A9B,	%g2
	movle	%xcc,	%o2,	%o6
	ldstub	[%l7 + 0x54],	%i2
loop_2952:
	orn	%g4,	0x0094,	%l0
	movrgez	%o5,	%l5,	%o1
	tl	%xcc,	0x1
	movn	%xcc,	%o4,	%o0
	fmovrsgz	%i5,	%f4,	%f25
	fbu	%fcc2,	loop_2953
	tpos	%icc,	0x2
	edge8ln	%i0,	%i1,	%g1
	fmovrdlz	%i7,	%f0,	%f8
loop_2953:
	tpos	%xcc,	0x0
	fbe,a	%fcc0,	loop_2954
	movge	%xcc,	%g7,	%l2
	membar	0x52
	fmovda	%icc,	%f9,	%f8
loop_2954:
	fbule	%fcc1,	loop_2955
	subccc	%o3,	0x0619,	%i4
	set	0x78, %g1
	ldsha	[%l7 + %g1] 0x88,	%l3
loop_2955:
	edge16ln	%l6,	%o7,	%g6
	addc	%g3,	0x1FB5,	%l1
	andcc	%i3,	%i6,	%g5
	fbo	%fcc1,	loop_2956
	sir	0x0CD0
	addcc	%g2,	%l4,	%o2
	tgu	%icc,	0x2
loop_2956:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x76] %asi,	%i2
	popc	0x0731,	%o6
	set	0x50, %i7
	ldswa	[%l7 + %i7] 0x19,	%g4
	ble,pt	%icc,	loop_2957
	movcs	%xcc,	%o5,	%l0
	taddcctv	%l5,	%o1,	%o4
	fnand	%f0,	%f6,	%f26
loop_2957:
	fmovrslz	%o0,	%f3,	%f13
	xor	%i0,	0x1DA6,	%i5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x14] %asi,	%g1
	orn	%i7,	%i1,	%l2
	nop
	setx	0xFEF361F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f2
	smul	%g7,	0x12E0,	%i4
	movneg	%xcc,	%l3,	%l6
	sra	%o3,	%o7,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%l1,	loop_2958
	stw	%i3,	[%l7 + 0x64]
	brgz	%i6,	loop_2959
	tneg	%xcc,	0x1
loop_2958:
	fmovdcc	%icc,	%f14,	%f4
	edge8ln	%g3,	%g5,	%g2
loop_2959:
	edge32ln	%l4,	%o2,	%o6
	orncc	%i2,	%g4,	%l0
	bvc,a,pt	%xcc,	loop_2960
	tgu	%icc,	0x5
	fmovsne	%xcc,	%f27,	%f29
	movn	%xcc,	%o5,	%l5
loop_2960:
	movrlez	%o4,	%o1,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i5,	%g1,	%i7
	brlez	%o0,	loop_2961
	brgez	%i1,	loop_2962
	fblg	%fcc3,	loop_2963
	or	%g7,	%i4,	%l2
loop_2961:
	fmuld8sux16	%f22,	%f9,	%f18
loop_2962:
	edge16l	%l6,	%l3,	%o3
loop_2963:
	edge32	%o7,	%g6,	%i3
	movre	%l1,	%g3,	%i6
	movl	%xcc,	%g5,	%l4
	sllx	%o2,	0x06,	%o6
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f24
	fxtod	%f24,	%f8
	edge32l	%i2,	%g4,	%l0
	movl	%icc,	%o5,	%l5
	sra	%g2,	%o1,	%o4
	fornot1s	%f9,	%f22,	%f23
	udiv	%i0,	0x0973,	%i5
	movre	%g1,	0x1C8,	%o0
	nop
	setx	loop_2964,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%icc,	%i7,	%g7
	tleu	%icc,	0x0
	bpos	loop_2965
loop_2964:
	edge16ln	%i4,	%i1,	%l6
	fnot2	%f20,	%f30
	wr	%g0,	0x27,	%asi
	stxa	%l2,	[%l7 + 0x58] %asi
	membar	#Sync
loop_2965:
	tcs	%xcc,	0x5
	bl,a,pn	%icc,	loop_2966
	tg	%xcc,	0x4
	fzeros	%f27
	lduh	[%l7 + 0x24],	%o3
loop_2966:
	nop
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x0c
	fcmpgt32	%f4,	%f0,	%l3
	sll	%g6,	%i3,	%o7
	fba,a	%fcc2,	loop_2967
	sth	%g3,	[%l7 + 0x3A]
	tne	%icc,	0x6
	bleu,a	%xcc,	loop_2968
loop_2967:
	bl,a,pn	%icc,	loop_2969
	edge8ln	%l1,	%g5,	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%o6
loop_2968:
	alignaddr	%o2,	%i2,	%l0
loop_2969:
	nop
	setx	loop_2970,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpsub32s	%f26,	%f24,	%f26
	tsubcctv	%g4,	%l5,	%o5
	fmovrdlz	%o1,	%f28,	%f6
loop_2970:
	brlz	%o4,	loop_2971
	nop
	fitod	%f0,	%f24
	fdtoi	%f24,	%f0
	movneg	%icc,	%i0,	%g2
	edge32l	%i5,	%o0,	%i7
loop_2971:
	fmovsle	%xcc,	%f13,	%f28
	nop
	setx	0x62E518187DE487EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x22240F0B724CE572,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f4,	%f4
	fmovrsgez	%g1,	%f28,	%f17
	edge32ln	%g7,	%i1,	%i4
	tn	%xcc,	0x5
	tsubcctv	%l6,	%o3,	%l3
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f10
	fxtod	%f10,	%f22
	fmuld8sux16	%f18,	%f5,	%f8
	std	%f20,	[%l7 + 0x78]
	fmovde	%xcc,	%f22,	%f5
	ldd	[%l7 + 0x38],	%g6
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	mulx	%i3,	%o7,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g3,	%g5,	%l1
	edge32n	%i6,	%l4,	%o6
	xnor	%i2,	0x0D26,	%l0
	fmovrsgz	%o2,	%f11,	%f10
	edge16l	%l5,	%o5,	%g4
	tne	%icc,	0x4
	popc	0x0F4D,	%o4
	movre	%i0,	0x1D0,	%g2
	fbug,a	%fcc2,	loop_2972
	fnegd	%f12,	%f4
	brnz,a	%i5,	loop_2973
	tcc	%xcc,	0x5
loop_2972:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x12] %asi,	%o1
loop_2973:
	bneg,pn	%xcc,	loop_2974
	tne	%xcc,	0x1
	array8	%i7,	%o0,	%g1
	fmovdvc	%icc,	%f6,	%f5
loop_2974:
	sdiv	%g7,	0x0641,	%i1
	sllx	%l6,	0x12,	%o3
	andcc	%i4,	0x0A15,	%g6
	edge16n	%i3,	%l3,	%l2
	tcc	%icc,	0x5
	taddcctv	%o7,	0x0110,	%g5
	tvc	%xcc,	0x7
	popc	%l1,	%g3
	fnot2	%f10,	%f22
	membar	0x4D
	orn	%l4,	%o6,	%i2
	tneg	%xcc,	0x4
	fbule	%fcc0,	loop_2975
	xorcc	%i6,	%o2,	%l0
	fpack32	%f12,	%f24,	%f16
	edge8l	%l5,	%g4,	%o4
loop_2975:
	subccc	%o5,	%g2,	%i5
	mulx	%i0,	0x17B9,	%o1
	brnz	%i7,	loop_2976
	mulx	%o0,	%g1,	%i1
	fbge	%fcc1,	loop_2977
	mulx	%l6,	%o3,	%i4
loop_2976:
	brgz	%g6,	loop_2978
	fones	%f25
loop_2977:
	membar	0x4C
	nop
	fitos	%f4,	%f10
	fstox	%f10,	%f12
loop_2978:
	sdivcc	%i3,	0x0405,	%l3
	fabss	%f9,	%f14
	array32	%g7,	%l2,	%o7
	orcc	%l1,	0x01A3,	%g5
	orncc	%l4,	0x081C,	%g3
	movgu	%icc,	%i2,	%o6
	movleu	%xcc,	%o2,	%l0
	movneg	%icc,	%l5,	%i6
	flush	%l7 + 0x2C
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%o5
	fnot2	%f10,	%f24
	tge	%xcc,	0x4
	mova	%xcc,	%g2,	%i5
	taddcc	%i0,	0x111F,	%o1
	fcmpgt32	%f18,	%f26,	%i7
	xnorcc	%o0,	0x1AA2,	%g1
	move	%icc,	%g4,	%i1
	set	0x26, %g2
	stba	%l6,	[%l7 + %g2] 0xeb
	membar	#Sync
	fmovs	%f7,	%f9
	brlz,a	%o3,	loop_2979
	fcmpne32	%f16,	%f2,	%g6
	bl	%icc,	loop_2980
	edge8ln	%i3,	%i4,	%g7
loop_2979:
	tsubcc	%l2,	0x1F6D,	%l3
	sra	%o7,	%l1,	%l4
loop_2980:
	bpos,a	loop_2981
	edge32ln	%g5,	%g3,	%i2
	edge32l	%o2,	%l0,	%o6
	sir	0x1BD9
loop_2981:
	movleu	%xcc,	%i6,	%o4
	movrlez	%l5,	%o5,	%i5
	for	%f8,	%f18,	%f10
	movpos	%xcc,	%i0,	%g2
	fzero	%f26
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o1,	%i7
	stbar
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	tne	%icc,	0x5
	ldd	[%l7 + 0x68],	%f30
	fpsub16s	%f29,	%f27,	%f20
	sra	%o0,	%g4,	%l6
	popc	0x0B37,	%i1
	tleu	%icc,	0x0
	sethi	0x0D16,	%g6
	tn	%icc,	0x2
	andcc	%i3,	%o3,	%g7
	set	0x66, %i3
	lduha	[%l7 + %i3] 0x81,	%i4
	fmovsgu	%xcc,	%f26,	%f29
	array16	%l3,	%l2,	%o7
	srax	%l1,	0x10,	%l4
	fcmpne16	%f12,	%f30,	%g5
	movrlez	%i2,	%o2,	%g3
	alignaddr	%l0,	%o6,	%o4
	udiv	%l5,	0x1859,	%o5
	tcs	%xcc,	0x2
	tle	%icc,	0x1
	orcc	%i6,	0x07A7,	%i5
	xorcc	%g2,	%i0,	%i7
	movrlz	%g1,	0x3A2,	%o1
	edge16	%g4,	%o0,	%i1
	taddcctv	%g6,	0x1721,	%l6
	movgu	%xcc,	%i3,	%o3
	fnot1s	%f11,	%f21
	bl,a,pt	%xcc,	loop_2982
	movre	%g7,	%i4,	%l3
	ldub	[%l7 + 0x7C],	%l2
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2982:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%l1
	movrgz	%l4,	0x1A2,	%g5
	fmovsl	%icc,	%f12,	%f30
	fcmpgt32	%f28,	%f10,	%o2
	tn	%xcc,	0x1
	edge32ln	%g3,	%l0,	%i2
	nop
	setx	0x3A18D78A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x99C96FE6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f20,	%f7
	smul	%o4,	%l5,	%o5
	tcc	%icc,	0x4
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x38] %asi,	%o6
	xorcc	%i6,	%g2,	%i5
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i0,	%i7
	sethi	0x14B9,	%g1
	mulscc	%g4,	%o1,	%o0
	srlx	%i1,	%g6,	%l6
	tle	%xcc,	0x5
	movleu	%icc,	%i3,	%g7
	bne	%xcc,	loop_2983
	membar	0x6F
	sdiv	%i4,	0x0026,	%o3
	xor	%l3,	%l2,	%l1
loop_2983:
	movne	%icc,	%o7,	%l4
	movleu	%xcc,	%g5,	%g3
	or	%l0,	0x1EEC,	%o2
	movcc	%icc,	%o4,	%i2
	fpack32	%f28,	%f4,	%f24
	mulx	%l5,	0x1AB1,	%o6
	fbu,a	%fcc2,	loop_2984
	mulscc	%o5,	%g2,	%i6
	and	%i5,	%i7,	%i0
	nop
	setx	0x8594FA8E106C4193,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
loop_2984:
	fbug,a	%fcc0,	loop_2985
	movneg	%icc,	%g4,	%o1
	wr	%g0,	0x80,	%asi
	stha	%g1,	[%l7 + 0x24] %asi
loop_2985:
	taddcc	%i1,	%g6,	%o0
	fpmerge	%f31,	%f7,	%f18
	sir	0x0B17
	ld	[%l7 + 0x20],	%f29
	fmovdcc	%icc,	%f0,	%f29
	ta	%xcc,	0x3
	tneg	%xcc,	0x5
	fbue	%fcc0,	loop_2986
	fmuld8ulx16	%f31,	%f11,	%f2
	sra	%i3,	%g7,	%i4
	fmovsleu	%xcc,	%f4,	%f25
loop_2986:
	nop
	set	0x50, %l3
	ldda	[%l7 + %l3] 0x11,	%o2
	subccc	%l6,	%l3,	%l1
	nop
	fitos	%f23,	%f23
	srl	%o7,	0x19,	%l4
	edge32	%l2,	%g5,	%l0
	movrgez	%g3,	%o4,	%o2
	movleu	%xcc,	%l5,	%o6
	movre	%o5,	0x077,	%g2
	fpsub16s	%f29,	%f6,	%f6
	xorcc	%i6,	%i5,	%i7
	xnorcc	%i0,	0x1AA1,	%i2
	edge32n	%g4,	%o1,	%g1
	edge32l	%i1,	%o0,	%i3
	tsubcctv	%g7,	%i4,	%o3
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge32ln	%l6,	%l3,	%g6
	add	%l1,	0x136D,	%o7
	stbar
	mulscc	%l4,	0x0633,	%l2
	movle	%xcc,	%g5,	%g3
	sub	%o4,	0x119B,	%o2
	wr	%g0,	0x89,	%asi
	stwa	%l5,	[%l7 + 0x28] %asi
	tl	%xcc,	0x3
	movge	%icc,	%l0,	%o5
	fmul8x16al	%f12,	%f19,	%f16
	tge	%icc,	0x4
	sdivcc	%o6,	0x099D,	%i6
	movvs	%xcc,	%g2,	%i5
	subc	%i7,	0x0D4F,	%i0
	fbe	%fcc0,	loop_2987
	sll	%i2,	0x0B,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g1,	%g4
loop_2987:
	movl	%xcc,	%o0,	%i3
	movrlez	%g7,	0x092,	%i1
	movrne	%i4,	0x073,	%l6
	wr	%g0,	0x89,	%asi
	stba	%l3,	[%l7 + 0x6D] %asi
	nop
	setx	0xD1369F12,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xA87A423A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f13,	%f11
	fmovrsgz	%o3,	%f4,	%f14
	fmovsleu	%xcc,	%f16,	%f13
	fpmerge	%f22,	%f20,	%f10
	nop
	setx	loop_2988,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitod	%f17,	%f30
	umul	%l1,	0x09DC,	%o7
	xnorcc	%l4,	%l2,	%g6
loop_2988:
	tl	%xcc,	0x6
	fornot2s	%f12,	%f21,	%f20
	movrgz	%g3,	%o4,	%o2
	movrgz	%l5,	%g5,	%l0
	stbar
	smul	%o6,	%o5,	%g2
	membar	0x44
	edge32l	%i6,	%i5,	%i0
	xnor	%i7,	%i2,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %o5
	swapa	[%l7 + %o5] 0x19,	%o1
	fbg,a	%fcc0,	loop_2989
	bpos	%xcc,	loop_2990
	xorcc	%g4,	%i3,	%o0
	nop
	setx	loop_2991,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2989:
	add	%g7,	%i4,	%l6
loop_2990:
	array8	%i1,	%o3,	%l1
	fbe	%fcc1,	loop_2992
loop_2991:
	array32	%l3,	%o7,	%l2
	fbo	%fcc3,	loop_2993
	edge8n	%g6,	%l4,	%o4
loop_2992:
	add	%o2,	%l5,	%g5
	fmovsn	%xcc,	%f26,	%f30
loop_2993:
	fnegd	%f26,	%f0
	edge16n	%l0,	%g3,	%o6
	brgz	%o5,	loop_2994
	movgu	%icc,	%i6,	%g2
	movneg	%xcc,	%i0,	%i5
	movleu	%icc,	%i2,	%i7
loop_2994:
	nop
	set	0x21, %i4
	ldstuba	[%l7 + %i4] 0x11,	%o1
	fmovsn	%xcc,	%f6,	%f30
	bcc,pt	%xcc,	loop_2995
	te	%icc,	0x6
	ldstub	[%l7 + 0x6F],	%g1
	stb	%g4,	[%l7 + 0x0F]
loop_2995:
	nop
	set	0x70, %o2
	lduha	[%l7 + %o2] 0x80,	%i3
	subc	%g7,	%o0,	%l6
	popc	0x01F3,	%i1
	edge32l	%i4,	%l1,	%o3
	movrlez	%o7,	0x1B4,	%l3
	movge	%xcc,	%l2,	%l4
	and	%g6,	0x152B,	%o4
	movre	%o2,	0x073,	%g5
	bcc,a,pn	%xcc,	loop_2996
	sdiv	%l0,	0x1C45,	%g3
	nop
	setx	0x76FDF232,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x8477D331,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f1,	%f1
	sdivx	%o6,	0x1DB0,	%l5
loop_2996:
	movrne	%o5,	0x3B4,	%g2
	andncc	%i6,	%i0,	%i5
	sir	0x1EB3
	ld	[%l7 + 0x7C],	%f24
	fpack32	%f8,	%f0,	%f26
	movrgz	%i2,	%o1,	%i7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2781
!	Type cti   	: 2996
!	Type x   	: 1226
!	Type f   	: 4550
!	Type i   	: 13447
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xAA02F932
.word 0x905E0353
.word 0xD1AA7ECE
.word 0x37572D8E
.word 0x21131946
.word 0x011B9804
.word 0xE85B4B48
.word 0xFC64CAFF
.word 0xD7D2B47F
.word 0x7FC34882
.word 0xA04B7D6E
.word 0x18AC0DC5
.word 0x4E85BB7B
.word 0x4E094C27
.word 0x00230810
.word 0xD6C30BED
.word 0x85628BF4
.word 0xD4F0D18E
.word 0x6B70D51F
.word 0xBEFB3D36
.word 0x9CD2B4F9
.word 0xE7DF6E8C
.word 0x5BC1A955
.word 0xF3B85972
.word 0x79B37F8F
.word 0x5E4B4123
.word 0xECE965B9
.word 0xC2E0CA4F
.word 0xE747CED1
.word 0x4010C881
.word 0x6E13BA96
.word 0x954373DC
.word 0x36574065
.word 0xCCA75F5B
.word 0x8386B032
.word 0x7905AF5A
.word 0xD19D5B45
.word 0x31DBBC4C
.word 0x780CA2F8
.word 0xF80FF3F2
.word 0x0DA4DAAA
.word 0x95195E32
.word 0x7FA5C03C
.word 0x6F2CE904
.word 0x3985A91D
.word 0x51A8B1AB
.word 0x928C5B97
.word 0x6AD0C9F2
.word 0xC06C6BB7
.word 0xD814E736
.word 0x7FC615AA
.word 0xB29A2499
.word 0xD72726FC
.word 0x35E3AE75
.word 0x0B899AD3
.word 0x3A124F39
.word 0x8D02C109
.word 0xEB33A84A
.word 0xA7ED6476
.word 0x82D46E37
.word 0x332D3380
.word 0xB3939EB3
.word 0x38A96A6E
.word 0x87E0B678
.end
