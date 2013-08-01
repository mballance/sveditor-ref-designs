/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f18.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f18.s,v 1.1 2007/05/11 17:22:27 drp Exp $"
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
	setx	0x1C4AC25E805C012D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xB,	%g1
	set	0xC,	%g2
	set	0x7,	%g3
	set	0x3,	%g4
	set	0xB,	%g5
	set	0x6,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0xD,	%i1
	set	-0x9,	%i2
	set	-0xC,	%i3
	set	-0x3,	%i4
	set	-0xE,	%i5
	set	-0xE,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x205DA500,	%l0
	set	0x43457004,	%l1
	set	0x1067F420,	%l2
	set	0x3EAB686C,	%l3
	set	0x5D448560,	%l4
	set	0x6EA9E123,	%l5
	set	0x6A5A37C9,	%l6
	!# Output registers
	set	-0x0678,	%o0
	set	-0x1474,	%o1
	set	0x12BD,	%o2
	set	0x0E72,	%o3
	set	-0x145A,	%o4
	set	-0x0849,	%o5
	set	-0x102D,	%o6
	set	-0x0B26,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x7BB1205F76F24449)
	INIT_TH_FP_REG(%l7,%f2,0x0DAA3C46C233A159)
	INIT_TH_FP_REG(%l7,%f4,0x52ECBFEFB92941AF)
	INIT_TH_FP_REG(%l7,%f6,0xB20B1F21242EE541)
	INIT_TH_FP_REG(%l7,%f8,0x6B5E860EA00CCEE6)
	INIT_TH_FP_REG(%l7,%f10,0x84C2F8F84CE4DDD4)
	INIT_TH_FP_REG(%l7,%f12,0x30EA8728FFFC49F4)
	INIT_TH_FP_REG(%l7,%f14,0x024BCCA28BE230D6)
	INIT_TH_FP_REG(%l7,%f16,0xE81F91B88983EB5B)
	INIT_TH_FP_REG(%l7,%f18,0x1D6DA4F4940EDEB8)
	INIT_TH_FP_REG(%l7,%f20,0x15AC9D1D7139B230)
	INIT_TH_FP_REG(%l7,%f22,0x5E54B19C2E58E0A6)
	INIT_TH_FP_REG(%l7,%f24,0xA310B539DBBF4772)
	INIT_TH_FP_REG(%l7,%f26,0x00D97E852186F893)
	INIT_TH_FP_REG(%l7,%f28,0xB05F02C69A6FA7EB)
	INIT_TH_FP_REG(%l7,%f30,0x19A8B973A77B758D)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xD77, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	nop
	setx	loop_1,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ld	[%l7 + 0x24],	%f3
	movn	%icc,	%i4,	%i1
	movrlz	%g1,	0x35F,	%l5
loop_1:
	fbl	%fcc1,	loop_2
	tsubcc	%g2,	%i7,	%o1
	tpos	%xcc,	0x5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o7,	%g7
loop_2:
	movre	%o3,	0x10D,	%o5
	tge	%icc,	0x5
	fbn,a	%fcc1,	loop_3
	ldsh	[%l7 + 0x46],	%i6
	edge32l	%g5,	%o4,	%l6
	bleu,a,pn	%icc,	loop_4
loop_3:
	orncc	%l4,	%o0,	%i2
	sra	%l2,	0x18,	%l0
	pdist	%f10,	%f10,	%f24
loop_4:
	udivx	%g3,	0x12F7,	%i5
	fbl	%fcc1,	loop_5
	subc	%o6,	0x0E43,	%i0
	srax	%l3,	%g6,	%o2
	movvc	%xcc,	%l1,	%i3
loop_5:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x53] %asi,	%i4
	flush	%l7 + 0x2C
	call	loop_6
	fnors	%f29,	%f6,	%f19
	xor	%g4,	%i1,	%g1
	taddcctv	%g2,	%l5,	%o1
loop_6:
	andcc	%o7,	0x11F6,	%g7
	bneg	loop_7
	fmovrdlz	%o3,	%f16,	%f6
	sllx	%o5,	%i7,	%g5
	bge,a	%xcc,	loop_8
loop_7:
	fmovsne	%xcc,	%f13,	%f29
	fmovrdlz	%o4,	%f6,	%f6
	sllx	%l6,	%l4,	%i6
loop_8:
	brgz,a	%i2,	loop_9
	call	loop_10
	lduw	[%l7 + 0x10],	%l2
	tn	%icc,	0x0
loop_9:
	ldsh	[%l7 + 0x6C],	%o0
loop_10:
	fmovdl	%icc,	%f10,	%f16
	std	%f22,	[%l7 + 0x18]
	bcc,a	loop_11
	fsrc2s	%f15,	%f30
	array32	%l0,	%g3,	%o6
	xnorcc	%i0,	0x060C,	%l3
loop_11:
	srlx	%i5,	0x07,	%o2
	fxors	%f24,	%f24,	%f31
	ta	%icc,	0x3
	fbuge	%fcc0,	loop_12
	fbo,a	%fcc2,	loop_13
	nop
	setx	0x63A2DD9310431B42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	nop
	fitod	%f12,	%f14
loop_12:
	edge16n	%g6,	%l1,	%i3
loop_13:
	nop
	wr	%g0,	0x88,	%asi
	stwa	%g4,	[%l7 + 0x38] %asi
	umulcc	%i1,	%i4,	%g2
	fbug,a	%fcc0,	loop_14
	fmovrse	%g1,	%f10,	%f13
	edge32n	%l5,	%o1,	%o7
	st	%f8,	[%l7 + 0x64]
loop_14:
	orncc	%g7,	0x0FC7,	%o5
	nop
	setx	0x92C6DF2320565300,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	smul	%i7,	%g5,	%o4
	sra	%o3,	0x1B,	%l4
	addcc	%l6,	%i6,	%l2
	mulx	%i2,	%o0,	%g3
	nop
	setx loop_15, %l0, %l1
	jmpl %l1, %o6
	edge8	%i0,	%l0,	%i5
	fmovrse	%o2,	%f29,	%f14
	xnor	%g6,	0x0C75,	%l3
loop_15:
	fzeros	%f24
	subccc	%i3,	0x1C08,	%g4
	tl	%xcc,	0x4
	edge16ln	%i1,	%i4,	%l1
	wr	%g0,	0x57,	%asi
	stxa	%g2,	[%g0 + 0x0] %asi
	sllx	%g1,	0x1D,	%o1
	bg	%xcc,	loop_16
	movrne	%l5,	0x190,	%o7
	fbn	%fcc3,	loop_17
	sub	%g7,	0x1E33,	%o5
loop_16:
	subc	%g5,	%o4,	%i7
	fmovrse	%l4,	%f26,	%f6
loop_17:
	te	%xcc,	0x1
	edge8n	%l6,	%i6,	%o3
	sllx	%l2,	%o0,	%g3
	fpack16	%f24,	%f20
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i2,	%i0
	fpsub16	%f24,	%f28,	%f14
	fandnot1s	%f4,	%f7,	%f22
	edge8n	%o6,	%l0,	%i5
	movpos	%icc,	%g6,	%o2
	ldsw	[%l7 + 0x78],	%i3
	fnegd	%f18,	%f22
	and	%l3,	0x0B09,	%g4
	edge16ln	%i4,	%l1,	%i1
	edge16	%g2,	%o1,	%g1
	std	%f2,	[%l7 + 0x28]
	addc	%l5,	0x07AF,	%o7
	edge8	%o5,	%g7,	%o4
	std	%f0,	[%l7 + 0x38]
	sllx	%i7,	0x01,	%l4
	edge8l	%g5,	%l6,	%i6
	fmovdneg	%icc,	%f17,	%f0
	tsubcc	%l2,	0x0871,	%o3
	edge32n	%o0,	%g3,	%i2
	udiv	%i0,	0x1250,	%o6
	xor	%i5,	0x1922,	%g6
	or	%o2,	%i3,	%l3
	movg	%icc,	%g4,	%i4
	fmovrdlez	%l1,	%f18,	%f6
	addcc	%l0,	0x07C8,	%g2
	xor	%o1,	0x1D55,	%g1
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf0
	membar	#Sync
	edge8l	%i1,	%l5,	%o7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o5,	%o4
	xorcc	%g7,	0x14C9,	%i7
	fbuge,a	%fcc0,	loop_18
	movleu	%xcc,	%l4,	%g5
	brgz,a	%l6,	loop_19
	edge16n	%i6,	%l2,	%o3
loop_18:
	nop
	setx loop_20, %l0, %l1
	jmpl %l1, %o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19:
	tne	%xcc,	0x1
	fbe	%fcc1,	loop_21
loop_20:
	movn	%xcc,	%g3,	%i0
	fbe	%fcc1,	loop_22
	sra	%i2,	0x09,	%i5
loop_21:
	orcc	%o6,	%g6,	%i3
	movleu	%icc,	%o2,	%l3
loop_22:
	alignaddr	%g4,	%l1,	%l0
	movrne	%g2,	0x287,	%i4
	fbue	%fcc0,	loop_23
	andncc	%o1,	%g1,	%i1
	fmovsvs	%xcc,	%f14,	%f17
	array8	%l5,	%o7,	%o5
loop_23:
	subcc	%g7,	%i7,	%l4
	edge8	%g5,	%l6,	%i6
	sra	%l2,	%o3,	%o4
	fsrc1s	%f13,	%f7
	fba	%fcc0,	loop_24
	tgu	%xcc,	0x2
	tg	%icc,	0x6
	edge32	%o0,	%g3,	%i2
loop_24:
	stw	%i0,	[%l7 + 0x18]
	bcc,a,pn	%icc,	loop_25
	prefetch	[%l7 + 0x28],	 0x3
	edge16	%o6,	%i5,	%i3
	udiv	%o2,	0x0EFA,	%g6
loop_25:
	nop
	set	0x0C, %o7
	lduwa	[%l7 + %o7] 0x0c,	%l3
	fabsd	%f14,	%f24
	lduw	[%l7 + 0x08],	%l1
	fnegd	%f10,	%f6
	fmovdl	%xcc,	%f24,	%f1
	prefetch	[%l7 + 0x44],	 0x3
	ta	%icc,	0x0
	ld	[%l7 + 0x24],	%f29
	fmovrse	%g4,	%f0,	%f27
	fnands	%f12,	%f3,	%f29
	sethi	0x142D,	%l0
	popc	0x07E3,	%g2
	sub	%i4,	0x0403,	%o1
	edge16l	%i1,	%l5,	%o7
	tcc	%icc,	0x7
	add	%o5,	%g1,	%i7
	fmovsa	%xcc,	%f9,	%f21
	andn	%l4,	%g7,	%l6
	ldsh	[%l7 + 0x42],	%i6
	array8	%l2,	%o3,	%g5
	andncc	%o0,	%g3,	%o4
	ldsh	[%l7 + 0x1E],	%i2
	movrgz	%o6,	0x274,	%i0
	brnz	%i5,	loop_26
	orcc	%o2,	0x17C9,	%i3
	edge16n	%g6,	%l3,	%l1
	fmovdge	%xcc,	%f29,	%f25
loop_26:
	movn	%icc,	%l0,	%g4
	set	0x68, %l3
	stwa	%g2,	[%l7 + %l3] 0x80
	fmul8x16al	%f7,	%f19,	%f2
	or	%i4,	%i1,	%o1
	movrlz	%o7,	%o5,	%g1
	addccc	%l5,	%l4,	%i7
	tne	%xcc,	0x0
	fbue,a	%fcc3,	loop_27
	smulcc	%l6,	0x0F53,	%i6
	ldsw	[%l7 + 0x14],	%g7
	or	%o3,	0x1970,	%l2
loop_27:
	fmovdleu	%icc,	%f16,	%f22
	fbge,a	%fcc2,	loop_28
	movgu	%icc,	%g5,	%o0
	fmovsne	%xcc,	%f12,	%f13
	fbug,a	%fcc3,	loop_29
loop_28:
	fnot1s	%f21,	%f12
	fpsub16s	%f26,	%f15,	%f29
	srax	%o4,	0x00,	%i2
loop_29:
	fmovrdlz	%g3,	%f14,	%f28
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x10,	%f0
	taddcctv	%o6,	%i5,	%o2
	fzero	%f30
	movrlez	%i3,	%i0,	%g6
	tvs	%icc,	0x4
	nop
	fitod	%f6,	%f2
	fdtox	%f2,	%f16
	ldsb	[%l7 + 0x7D],	%l3
	fmovda	%xcc,	%f6,	%f6
	and	%l0,	%l1,	%g2
	and	%g4,	%i1,	%i4
	sllx	%o7,	0x0D,	%o5
	bge	%xcc,	loop_30
	fmovdvc	%xcc,	%f15,	%f10
	sth	%g1,	[%l7 + 0x40]
	bg,pn	%icc,	loop_31
loop_30:
	array8	%o1,	%l4,	%l5
	set	0x50, %o5
	lda	[%l7 + %o5] 0x80,	%f1
loop_31:
	movrlz	%i7,	%l6,	%g7
	fmovdle	%icc,	%f16,	%f11
	sll	%i6,	%o3,	%g5
	tle	%icc,	0x7
	pdist	%f12,	%f10,	%f12
	bcc,pt	%icc,	loop_32
	prefetch	[%l7 + 0x68],	 0x0
	and	%o0,	%l2,	%i2
	fnot2s	%f0,	%f31
loop_32:
	srax	%g3,	0x14,	%o4
	tle	%xcc,	0x7
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x10
	movle	%xcc,	%o6,	%i5
	nop
	setx	0xBB37EA9F09C0CC55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x21BAA59A4AF7BD75,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f16,	%f16
	edge16n	%o2,	%i0,	%i3
	stx	%g6,	[%l7 + 0x18]
	fxors	%f27,	%f23,	%f11
	fpsub16s	%f15,	%f16,	%f12
	tcc	%icc,	0x7
	nop
	setx	loop_33,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%l3,	%l1,	%g2
	andcc	%g4,	0x0F28,	%i1
	tsubcc	%i4,	0x18D8,	%o7
loop_33:
	fnot2s	%f12,	%f13
	fcmpgt16	%f26,	%f4,	%l0
	ba,a,pn	%icc,	loop_34
	popc	%g1,	%o5
	fbu,a	%fcc0,	loop_35
	std	%f20,	[%l7 + 0x58]
loop_34:
	orcc	%l4,	0x1F12,	%l5
	fbo	%fcc2,	loop_36
loop_35:
	umulcc	%i7,	%l6,	%g7
	fmovscc	%xcc,	%f6,	%f14
	nop
	setx	loop_37,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_36:
	nop
	setx	0x93F468B0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc1,	loop_38
loop_37:
	fbe,a	%fcc2,	loop_39
	fmovdgu	%icc,	%f11,	%f5
	fmovrsgz	%i6,	%f2,	%f5
loop_38:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39:
	umulcc	%o1,	%o3,	%g5
	udivx	%o0,	0x0F5E,	%l2
	flush	%l7 + 0x48
	edge32n	%i2,	%g3,	%o4
	array32	%i5,	%o6,	%o2
	edge32ln	%i3,	%i0,	%g6
	te	%xcc,	0x3
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x0c
	addccc	%l1,	0x0551,	%l3
	ba,a	%icc,	loop_40
	smulcc	%g4,	0x15A7,	%i1
	sra	%i4,	%o7,	%g2
	tgu	%icc,	0x0
loop_40:
	movleu	%xcc,	%l0,	%g1
	tg	%icc,	0x2
	fbug,a	%fcc0,	loop_41
	srax	%o5,	%l4,	%i7
	movl	%icc,	%l5,	%g7
	fandnot1s	%f28,	%f21,	%f26
loop_41:
	fabsd	%f30,	%f20
	edge16	%i6,	%l6,	%o3
	movge	%icc,	%g5,	%o0
	edge16ln	%l2,	%i2,	%g3
	xnor	%o1,	0x0D5E,	%o4
	sdiv	%i5,	0x107B,	%o2
	edge16n	%o6,	%i0,	%g6
	sub	%l1,	0x0503,	%i3
	edge8n	%g4,	%l3,	%i1
	tpos	%xcc,	0x1
	faligndata	%f8,	%f10,	%f30
	fmovsg	%xcc,	%f29,	%f30
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%g2
	fmovsge	%xcc,	%f15,	%f5
	fba	%fcc2,	loop_42
	edge16ln	%l0,	%g1,	%o7
	fxnor	%f20,	%f18,	%f30
	xor	%o5,	%i7,	%l4
loop_42:
	edge32	%g7,	%l5,	%l6
	fmovsvs	%icc,	%f7,	%f18
	mova	%xcc,	%i6,	%g5
	fmovdleu	%icc,	%f12,	%f8
	movrlez	%o3,	%l2,	%o0
	movneg	%xcc,	%g3,	%o1
	fbue,a	%fcc1,	loop_43
	ba,a,pn	%xcc,	loop_44
	tgu	%xcc,	0x3
	fmovsneg	%icc,	%f29,	%f29
loop_43:
	ldub	[%l7 + 0x09],	%i2
loop_44:
	brgez,a	%o4,	loop_45
	tcs	%xcc,	0x4
	fandnot2	%f8,	%f6,	%f26
	taddcc	%i5,	0x160B,	%o2
loop_45:
	pdist	%f0,	%f26,	%f8
	movleu	%icc,	%o6,	%g6
	sll	%i0,	0x17,	%l1
	srax	%i3,	0x09,	%g4
	sethi	0x0C23,	%i1
	or	%l3,	0x18D7,	%g2
	srlx	%l0,	0x0C,	%i4
	edge32l	%o7,	%o5,	%i7
	alignaddr	%g1,	%g7,	%l5
	fmul8x16au	%f27,	%f3,	%f28
	xor	%l4,	%i6,	%g5
	move	%xcc,	%l6,	%o3
	sir	0x0EFB
	brnz,a	%l2,	loop_46
	fmovde	%xcc,	%f4,	%f14
	udiv	%o0,	0x0F2C,	%o1
	fblg,a	%fcc0,	loop_47
loop_46:
	movl	%icc,	%i2,	%o4
	smul	%i5,	0x0369,	%g3
	brnz	%o2,	loop_48
loop_47:
	edge8ln	%g6,	%o6,	%i0
	smulcc	%i3,	%l1,	%i1
	fbne	%fcc3,	loop_49
loop_48:
	fmovrsne	%g4,	%f7,	%f25
	sethi	0x0B28,	%g2
	nop
	setx	0xC4DF56F190643C49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_49:
	mova	%icc,	%l0,	%i4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	fandnot1	%f30,	%f4,	%f8
	taddcctv	%o5,	%o7,	%i7
	edge32l	%g1,	%l5,	%l4
	nop
	setx	0xDF971AAFD870C6F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f18
	nop
	setx	0xF162A5ADD0704C41,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fabss	%f16,	%f29
	subccc	%g7,	0x1156,	%i6
	fmovdvs	%xcc,	%f5,	%f5
	edge32	%l6,	%g5,	%l2
	ldsb	[%l7 + 0x7A],	%o0
	orncc	%o1,	0x0B90,	%o3
	movge	%xcc,	%i2,	%i5
	orncc	%o4,	0x1C63,	%o2
	fmovrdgz	%g3,	%f22,	%f10
	edge16ln	%o6,	%g6,	%i3
	movle	%icc,	%l1,	%i0
	sub	%g4,	0x172F,	%g2
	tne	%icc,	0x6
	fpsub16	%f4,	%f26,	%f22
	fbug	%fcc0,	loop_50
	edge32l	%l0,	%i1,	%i4
	srax	%o5,	%l3,	%o7
	set	0x3C, %i7
	ldsha	[%l7 + %i7] 0x81,	%i7
loop_50:
	tg	%icc,	0x7
	edge32l	%l5,	%l4,	%g1
	xorcc	%i6,	0x1AB4,	%l6
	set	0x0A, %l6
	lduha	[%l7 + %l6] 0x15,	%g7
	movre	%g5,	0x083,	%l2
	fmovdn	%icc,	%f23,	%f0
	xorcc	%o0,	%o1,	%o3
	edge8ln	%i5,	%o4,	%o2
	fbu	%fcc2,	loop_51
	bcc,pt	%icc,	loop_52
	or	%g3,	%o6,	%g6
	brgez,a	%i2,	loop_53
loop_51:
	movre	%i3,	0x2DB,	%i0
loop_52:
	mulscc	%g4,	%l1,	%g2
	nop
	setx	0x6D7FDA78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xB7EDFF9A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f21,	%f28
loop_53:
	addcc	%l0,	%i4,	%o5
	fpsub32	%f30,	%f2,	%f12
	movvc	%xcc,	%i1,	%l3
	fbule	%fcc2,	loop_54
	edge8n	%i7,	%o7,	%l5
	fpsub32s	%f12,	%f31,	%f14
	bcs,a	%xcc,	loop_55
loop_54:
	andncc	%l4,	%g1,	%i6
	nop
	fitos	%f4,	%f5
	fble	%fcc2,	loop_56
loop_55:
	taddcctv	%l6,	%g7,	%l2
	nop
	setx	loop_57,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%o0,	0x1543,	%o1
loop_56:
	fornot2s	%f25,	%f8,	%f30
	bvs,a	loop_58
loop_57:
	bvs	loop_59
	fbu	%fcc3,	loop_60
	call	loop_61
loop_58:
	udiv	%o3,	0x0571,	%g5
loop_59:
	fmovrse	%o4,	%f15,	%f2
loop_60:
	ldx	[%l7 + 0x20],	%i5
loop_61:
	sir	0x06CE
	call	loop_62
	nop
	setx	0x2A15A1CB1CF77038,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD40927E574CE2BD9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f28,	%f30
	udivx	%o2,	0x1E1C,	%o6
	ld	[%l7 + 0x28],	%f18
loop_62:
	alignaddr	%g3,	%i2,	%g6
	ldub	[%l7 + 0x74],	%i0
	taddcctv	%i3,	%g4,	%g2
	nop
	fitod	%f4,	%f28
	edge32	%l1,	%i4,	%o5
	umulcc	%i1,	0x17F8,	%l3
	nop
	set	0x6C, %g4
	stw	%l0,	[%l7 + %g4]
	movrgez	%o7,	0x2FE,	%l5
	fpack32	%f26,	%f14,	%f28
	ldsb	[%l7 + 0x0E],	%i7
	sllx	%l4,	%g1,	%i6
	movrlez	%l6,	0x24F,	%l2
	fzero	%f12
	edge32l	%o0,	%g7,	%o3
	fsrc1s	%f6,	%f15
	edge8ln	%g5,	%o1,	%i5
	nop
	setx	0xC0DCF9D13D8B2AFA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xB8DC5F7061269B36,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f20,	%f30
	sth	%o2,	[%l7 + 0x56]
	xnorcc	%o4,	0x088D,	%g3
	alignaddrl	%i2,	%g6,	%o6
	fandnot1s	%f0,	%f29,	%f4
	tcs	%xcc,	0x1
	fnors	%f25,	%f0,	%f7
	movvc	%xcc,	%i0,	%g4
	ldsb	[%l7 + 0x5F],	%g2
	sdivcc	%i3,	0x1EDC,	%l1
	fnand	%f26,	%f8,	%f2
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	edge8l	%i1,	%o5,	%l3
	fbug	%fcc2,	loop_63
	fbl,a	%fcc2,	loop_64
	smul	%l0,	%o7,	%i7
	udivx	%l4,	0x1B6B,	%g1
loop_63:
	fxnor	%f10,	%f26,	%f14
loop_64:
	nop
	setx	loop_65,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%i6,	%l5,	%l6
	fpadd32s	%f8,	%f4,	%f17
	sra	%l2,	%g7,	%o0
loop_65:
	smul	%o3,	0x127E,	%g5
	nop
	setx	0xE6FFA2D772AD2B9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA036EC904DA55195,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f30,	%f4
	sdivx	%o1,	0x1B64,	%i5
	sir	0x0D36
	fornot2	%f22,	%f2,	%f4
	tn	%xcc,	0x5
	andcc	%o4,	%g3,	%o2
	fmovrsne	%i2,	%f1,	%f4
	movneg	%icc,	%g6,	%i0
	edge32	%o6,	%g2,	%i3
	and	%l1,	0x0073,	%i4
	sub	%g4,	0x1083,	%i1
	prefetch	[%l7 + 0x08],	 0x3
	edge32l	%o5,	%l3,	%o7
	alignaddr	%i7,	%l0,	%g1
	movrgez	%l4,	0x0F7,	%l5
	prefetch	[%l7 + 0x68],	 0x2
	te	%xcc,	0x2
	movrgz	%i6,	0x034,	%l2
	array8	%l6,	%g7,	%o3
	nop
	fitod	%f12,	%f14
	fdtoi	%f14,	%f3
	sub	%o0,	%g5,	%i5
	xnor	%o1,	%o4,	%o2
	movrgez	%i2,	%g6,	%i0
	brgez	%o6,	loop_66
	edge16n	%g2,	%i3,	%l1
	stbar
	tsubcc	%i4,	0x1778,	%g4
loop_66:
	membar	0x56
	move	%xcc,	%g3,	%o5
	tcs	%xcc,	0x3
	fmul8sux16	%f24,	%f20,	%f20
	fpadd16s	%f31,	%f26,	%f7
	fnegs	%f23,	%f21
	movl	%icc,	%i1,	%o7
	edge8ln	%l3,	%l0,	%i7
	and	%l4,	%g1,	%i6
	edge32n	%l2,	%l6,	%l5
	fbu	%fcc1,	loop_67
	move	%icc,	%g7,	%o0
	brgez,a	%g5,	loop_68
	faligndata	%f28,	%f20,	%f30
loop_67:
	fbule	%fcc1,	loop_69
	fcmpne16	%f8,	%f24,	%i5
loop_68:
	ldsb	[%l7 + 0x3C],	%o1
	tpos	%icc,	0x2
loop_69:
	udiv	%o3,	0x0FCE,	%o2
	flush	%l7 + 0x2C
	movneg	%xcc,	%o4,	%g6
	add	%i0,	%i2,	%g2
	lduh	[%l7 + 0x74],	%o6
	ldsh	[%l7 + 0x56],	%i3
	edge16ln	%l1,	%i4,	%g4
	movneg	%icc,	%o5,	%g3
	umul	%o7,	%i1,	%l0
	sethi	0x1E4E,	%l3
	set	0x5E, %g3
	lduha	[%l7 + %g3] 0x11,	%l4
	bgu,pn	%xcc,	loop_70
	nop
	setx	0x3D7B6D65,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x70B3FDEE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f14,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x48],	%g1
loop_70:
	movleu	%xcc,	%i6,	%i7
	tg	%xcc,	0x7
	mulx	%l6,	0x01A5,	%l5
	xorcc	%l2,	%o0,	%g7
	movneg	%icc,	%i5,	%o1
	subccc	%g5,	0x0F1D,	%o3
	fbuge	%fcc1,	loop_71
	sll	%o2,	0x13,	%o4
	bleu,a,pn	%icc,	loop_72
	smul	%i0,	%g6,	%g2
loop_71:
	fmovdl	%icc,	%f5,	%f3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i2,	%o6
loop_72:
	fone	%f10
	andn	%i3,	%l1,	%i4
	move	%xcc,	%o5,	%g3
	nop
	setx	0xFF13023A9447BC0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f16
	or	%g4,	0x1B7D,	%o7
	set	0x7E, %o2
	ldstuba	[%l7 + %o2] 0x10,	%l0
	fcmpne16	%f8,	%f18,	%i1
	tg	%icc,	0x7
	edge16l	%l4,	%l3,	%g1
	andncc	%i6,	%l6,	%i7
	nop
	setx	0x8D809620B05F5632,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	movpos	%icc,	%l5,	%o0
	tn	%icc,	0x7
	tvs	%icc,	0x3
	be,a	%xcc,	loop_73
	sdivx	%l2,	0x0F8B,	%i5
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x72] %asi,	%o1
loop_73:
	edge16l	%g7,	%o3,	%g5
	ld	[%l7 + 0x78],	%f9
	fmovsl	%xcc,	%f27,	%f25
	movne	%icc,	%o2,	%i0
	edge8l	%g6,	%g2,	%o4
	sra	%i2,	0x1E,	%o6
	udivcc	%l1,	0x17F2,	%i3
	tcs	%icc,	0x2
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x78] %asi,	%o5
	movne	%xcc,	%i4,	%g4
	edge8ln	%g3,	%o7,	%l0
	bne	%icc,	loop_74
	movrlz	%i1,	%l4,	%l3
	fbge,a	%fcc0,	loop_75
	edge8l	%i6,	%g1,	%i7
loop_74:
	fcmpgt16	%f12,	%f2,	%l5
	fnand	%f16,	%f28,	%f2
loop_75:
	tneg	%icc,	0x0
	tne	%icc,	0x3
	nop
	setx	0x8D6C1179,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x5BA3DFA2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f29,	%f21
	taddcc	%l6,	0x1AC5,	%l2
	fnot2	%f20,	%f2
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i5
	brnz,a	%o0,	loop_76
	ta	%icc,	0x5
	fnot2s	%f31,	%f22
	brlz	%g7,	loop_77
loop_76:
	bcs,a,pt	%icc,	loop_78
	te	%icc,	0x2
	fpadd32	%f6,	%f8,	%f30
loop_77:
	fbge,a	%fcc1,	loop_79
loop_78:
	flush	%l7 + 0x18
	fnegd	%f0,	%f12
	ldstub	[%l7 + 0x22],	%o1
loop_79:
	popc	%g5,	%o2
	tge	%xcc,	0x4
	fmovdvs	%xcc,	%f11,	%f24
	sllx	%i0,	0x16,	%o3
	tcs	%icc,	0x1
	set	0x50, %i4
	stha	%g6,	[%l7 + %i4] 0x88
	ble,a	%xcc,	loop_80
	edge8ln	%o4,	%i2,	%g2
	fbg,a	%fcc0,	loop_81
	smul	%o6,	%l1,	%i3
loop_80:
	taddcc	%i4,	0x05DB,	%o5
	orcc	%g3,	0x03B7,	%o7
loop_81:
	movcs	%icc,	%l0,	%i1
	tsubcc	%g4,	%l3,	%i6
	fandnot1s	%f6,	%f11,	%f22
	edge32n	%g1,	%i7,	%l5
	movrgez	%l6,	%l4,	%l2
	tsubcc	%o0,	%g7,	%i5
	subc	%g5,	0x00EA,	%o2
	mova	%xcc,	%i0,	%o3
	fba	%fcc0,	loop_82
	sub	%g6,	%o4,	%o1
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x1f
	membar	#Sync
loop_82:
	tpos	%icc,	0x4
	fcmple16	%f18,	%f6,	%g2
	wr	%g0,	0x04,	%asi
	sta	%f24,	[%l7 + 0x78] %asi
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i2,	%o6
	edge32	%l1,	%i4,	%i3
	ldd	[%l7 + 0x48],	%f8
	fble	%fcc3,	loop_83
	fabss	%f12,	%f18
	fnands	%f3,	%f2,	%f18
	nop
	set	0x2C, %i3
	prefetch	[%l7 + %i3],	 0x2
loop_83:
	lduw	[%l7 + 0x78],	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_84,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitos	%f5,	%f26
	fstoi	%f26,	%f29
	set	0x54, %l1
	stha	%o7,	[%l7 + %l1] 0x2b
	membar	#Sync
loop_84:
	edge16l	%o5,	%i1,	%l0
	mulx	%g4,	0x04FB,	%i6
	movg	%xcc,	%l3,	%i7
	movvc	%xcc,	%l5,	%l6
	ldub	[%l7 + 0x15],	%l4
	fmovsg	%icc,	%f23,	%f3
	fbge	%fcc0,	loop_85
	edge16	%g1,	%l2,	%o0
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x10] %asi,	%f25
loop_85:
	tcc	%xcc,	0x0
	edge8n	%i5,	%g5,	%o2
	ble,a,pn	%icc,	loop_86
	tl	%icc,	0x4
	sethi	0x06F6,	%g7
	movvs	%icc,	%o3,	%g6
loop_86:
	brnz	%i0,	loop_87
	alignaddrl	%o4,	%g2,	%o1
	fbo,a	%fcc1,	loop_88
	tcc	%xcc,	0x5
loop_87:
	sdivcc	%i2,	0x128F,	%o6
	andncc	%l1,	%i4,	%g3
loop_88:
	nop
	setx	0x607EA4F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	nop
	setx	loop_89,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bne	loop_90
	array16	%o7,	%i3,	%i1
	srl	%l0,	%o5,	%i6
loop_89:
	membar	0x11
loop_90:
	udiv	%g4,	0x1451,	%l3
	andn	%i7,	%l6,	%l5
	movre	%g1,	0x143,	%l2
	array8	%l4,	%i5,	%g5
	edge16n	%o0,	%g7,	%o3
	movg	%icc,	%o2,	%i0
	fnegd	%f26,	%f8
	fmovse	%icc,	%f6,	%f24
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	tneg	%icc,	0x2
	sdiv	%g6,	0x0B6B,	%o1
	fpack16	%f10,	%f20
	add	%i2,	0x1BB1,	%g2
	mulscc	%o6,	%i4,	%g3
	edge32ln	%o7,	%l1,	%i1
	subcc	%i3,	0x0922,	%o5
	stx	%i6,	[%l7 + 0x18]
	srlx	%g4,	0x00,	%l0
	taddcc	%i7,	%l6,	%l5
	alignaddr	%g1,	%l2,	%l3
	set	0x20, %g1
	ldsha	[%l7 + %g1] 0x81,	%l4
	for	%f16,	%f4,	%f30
	fbul,a	%fcc1,	loop_91
	fxnors	%f9,	%f28,	%f20
	tgu	%icc,	0x0
	fbl	%fcc2,	loop_92
loop_91:
	umul	%i5,	0x0B7D,	%g5
	fnors	%f25,	%f31,	%f2
	fmovdcc	%icc,	%f2,	%f16
loop_92:
	fpadd32	%f14,	%f0,	%f20
	fnands	%f26,	%f30,	%f25
	edge16n	%g7,	%o3,	%o2
	std	%f0,	[%l7 + 0x20]
	brnz,a	%o0,	loop_93
	sethi	0x18EA,	%i0
	fmul8x16au	%f23,	%f24,	%f22
	fexpand	%f29,	%f18
loop_93:
	nop
	setx	0x46C255A9405F5453,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fble,a	%fcc0,	loop_94
	and	%g6,	%o1,	%i2
	umul	%g2,	0x0E66,	%o6
	srax	%o4,	0x04,	%g3
loop_94:
	fbuge	%fcc0,	loop_95
	stw	%o7,	[%l7 + 0x58]
	tge	%icc,	0x4
	fmovdleu	%icc,	%f12,	%f19
loop_95:
	smul	%i4,	%l1,	%i3
	edge8n	%i1,	%o5,	%i6
	popc	0x0C27,	%l0
	fmovsl	%icc,	%f19,	%f29
	udivx	%i7,	0x0E98,	%g4
	tle	%icc,	0x3
	fmul8x16al	%f26,	%f11,	%f20
	edge16n	%l5,	%l6,	%l2
	tleu	%xcc,	0x1
	fand	%f22,	%f26,	%f22
	fsrc2s	%f0,	%f10
	smul	%g1,	0x09B8,	%l3
	edge32	%l4,	%g5,	%i5
	array8	%o3,	%o2,	%o0
	membar	0x1F
	membar	0x76
	add	%g7,	0x0723,	%g6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x7A] %asi,	%o1
	udiv	%i2,	0x119D,	%i0
	orcc	%o6,	%g2,	%g3
	ldd	[%l7 + 0x50],	%f0
	edge8n	%o4,	%o7,	%l1
	and	%i4,	%i1,	%o5
	orncc	%i6,	%i3,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a	%xcc,	loop_96
	subcc	%i7,	%g4,	%l5
	nop
	setx	loop_97,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitos	%f3,	%f28
loop_96:
	srl	%l2,	%l6,	%l3
	movvs	%icc,	%g1,	%l4
loop_97:
	fbl	%fcc0,	loop_98
	fone	%f18
	fbo	%fcc3,	loop_99
	array8	%i5,	%o3,	%o2
loop_98:
	andcc	%g5,	%g7,	%g6
	bcs,pn	%xcc,	loop_100
loop_99:
	move	%xcc,	%o0,	%i2
	edge8ln	%i0,	%o1,	%g2
	tsubcc	%o6,	0x1476,	%o4
loop_100:
	fmovdle	%icc,	%f14,	%f31
	bgu,a,pn	%icc,	loop_101
	andn	%o7,	0x1683,	%g3
	membar	0x0E
	movneg	%xcc,	%i4,	%l1
loop_101:
	movleu	%icc,	%i1,	%i6
	ld	[%l7 + 0x54],	%f21
	nop
	setx	0x070B3028207C63E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	brnz	%i3,	loop_102
	tvc	%icc,	0x2
	fbe	%fcc3,	loop_103
	fnors	%f18,	%f5,	%f12
loop_102:
	srlx	%o5,	0x09,	%l0
	fmovsg	%icc,	%f13,	%f14
loop_103:
	movrgz	%i7,	0x326,	%g4
	stw	%l5,	[%l7 + 0x1C]
	or	%l2,	%l3,	%l6
	fandnot2s	%f7,	%f10,	%f17
	movl	%icc,	%g1,	%i5
	membar	0x2A
	edge32n	%l4,	%o2,	%g5
	subccc	%g7,	%g6,	%o0
	fone	%f18
	edge32	%o3,	%i0,	%i2
	sir	0x1575
	stb	%o1,	[%l7 + 0x08]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o6,	0x1FCF,	%g2
	fbo	%fcc0,	loop_104
	lduh	[%l7 + 0x18],	%o4
	xnorcc	%g3,	%o7,	%i4
	orncc	%i1,	%l1,	%i3
loop_104:
	brz	%i6,	loop_105
	sub	%o5,	0x0645,	%i7
	fpmerge	%f31,	%f2,	%f16
	move	%icc,	%l0,	%g4
loop_105:
	nop
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x18,	 0x0
	srl	%l2,	0x14,	%l3
	movrgz	%l6,	0x1A3,	%g1
	fbul,a	%fcc3,	loop_106
	movl	%icc,	%i5,	%l4
	edge32ln	%o2,	%g7,	%g6
	srlx	%o0,	0x09,	%g5
loop_106:
	ba,a,pt	%xcc,	loop_107
	movrne	%i0,	0x30F,	%i2
	fzero	%f6
	edge8n	%o1,	%o6,	%g2
loop_107:
	bvs,a	%xcc,	loop_108
	fxors	%f22,	%f3,	%f10
	fmul8x16au	%f3,	%f6,	%f10
	fbne	%fcc0,	loop_109
loop_108:
	movrlz	%o3,	%g3,	%o7
	bcs,a	%icc,	loop_110
	ldx	[%l7 + 0x58],	%o4
loop_109:
	movleu	%xcc,	%i4,	%i1
	movrgz	%i3,	0x206,	%i6
loop_110:
	fblg	%fcc3,	loop_111
	ldub	[%l7 + 0x35],	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%o5
loop_111:
	fnot1s	%f17,	%f31
	array16	%l0,	%g4,	%l5
	be,pt	%icc,	loop_112
	addc	%i7,	0x129C,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f10
loop_112:
	tsubcctv	%l6,	0x0436,	%g1
	or	%l3,	0x1334,	%i5
	bgu	%xcc,	loop_113
	sdivx	%l4,	0x1AF3,	%g7
	bge,pn	%xcc,	loop_114
	nop
	setx	0x90595FF9,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
loop_113:
	movrgz	%g6,	%o2,	%g5
	bshuffle	%f24,	%f12,	%f14
loop_114:
	fsrc2	%f14,	%f12
	bge,pn	%icc,	loop_115
	xorcc	%o0,	%i2,	%i0
	sethi	0x1511,	%o1
	fmovrdgez	%g2,	%f20,	%f24
loop_115:
	tcc	%xcc,	0x4
	edge16l	%o6,	%o3,	%o7
	bvs,pt	%xcc,	loop_116
	movre	%o4,	0x1E1,	%g3
	array8	%i4,	%i3,	%i6
	sdivcc	%l1,	0x0B1A,	%i1
loop_116:
	movrlz	%o5,	0x108,	%g4
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%l5
	sdiv	%i7,	0x0DA3,	%l2
	addcc	%l6,	%g1,	%l0
	bg,a,pt	%xcc,	loop_117
	movvs	%icc,	%i5,	%l3
	array32	%g7,	%g6,	%o2
	orcc	%l4,	0x1640,	%g5
loop_117:
	call	loop_118
	fmovsn	%icc,	%f10,	%f26
	addcc	%i2,	0x014D,	%o0
	fmovsvs	%icc,	%f25,	%f3
loop_118:
	fmovdl	%icc,	%f16,	%f16
	ldsw	[%l7 + 0x54],	%o1
	sdivcc	%i0,	0x028A,	%g2
	bpos,a,pt	%icc,	loop_119
	tle	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o6,	0x10B5,	%o3
loop_119:
	tvc	%xcc,	0x1
	alignaddr	%o7,	%g3,	%o4
	fnand	%f8,	%f14,	%f12
	movrlez	%i4,	%i6,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l1,	%i1
	sir	0x0F01
	edge32ln	%o5,	%l5,	%g4
	fbug,a	%fcc3,	loop_120
	fmovspos	%icc,	%f0,	%f30
	ldsw	[%l7 + 0x40],	%l2
	taddcc	%l6,	%g1,	%l0
loop_120:
	lduh	[%l7 + 0x20],	%i5
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x1F] %asi,	%l3
	te	%xcc,	0x4
	xor	%i7,	%g7,	%o2
	movre	%g6,	%g5,	%i2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x3C] %asi,	%l4
	smul	%o1,	0x1BDF,	%i0
	ldd	[%l7 + 0x10],	%o0
	movrne	%g2,	0x330,	%o6
	alignaddrl	%o7,	%o3,	%g3
	edge32	%i4,	%i6,	%i3
	fba	%fcc2,	loop_121
	edge16n	%o4,	%i1,	%o5
	srax	%l1,	%l5,	%l2
	fcmpgt16	%f18,	%f16,	%l6
loop_121:
	edge16ln	%g1,	%g4,	%i5
	umulcc	%l0,	%i7,	%g7
	nop
	fitod	%f12,	%f10
	fdtoi	%f10,	%f16
	smul	%l3,	0x1DBE,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_122
	tle	%icc,	0x6
	mulx	%o2,	0x04E8,	%i2
	bvs,a	loop_123
loop_122:
	xnorcc	%l4,	%o1,	%g5
	nop
	setx loop_124, %l0, %l1
	jmpl %l1, %i0
	movre	%o0,	0x04B,	%g2
loop_123:
	fmovsne	%icc,	%f24,	%f21
	nop
	setx	0xBC91D85E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x6F2F951C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f28,	%f7
loop_124:
	fbl,a	%fcc3,	loop_125
	edge16	%o7,	%o6,	%g3
	xnor	%i4,	%o3,	%i6
	fbule,a	%fcc2,	loop_126
loop_125:
	srl	%o4,	0x19,	%i1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%f16
loop_126:
	tcs	%icc,	0x5
	call	loop_127
	movne	%icc,	%o5,	%l1
	fbuge	%fcc2,	loop_128
	addc	%i3,	0x1757,	%l2
loop_127:
	bleu,pt	%xcc,	loop_129
	tleu	%xcc,	0x3
loop_128:
	bneg,pt	%xcc,	loop_130
	ldsb	[%l7 + 0x1A],	%l6
loop_129:
	fcmple16	%f6,	%f8,	%g1
	movrlz	%g4,	0x26E,	%i5
loop_130:
	tne	%xcc,	0x3
	brgz	%l5,	loop_131
	edge8n	%i7,	%g7,	%l3
	brz,a	%g6,	loop_132
	xnor	%l0,	%o2,	%l4
loop_131:
	nop
	set	0x63, %i6
	stba	%i2,	[%l7 + %i6] 0x0c
loop_132:
	bpos,a	loop_133
	fbul,a	%fcc0,	loop_134
	array16	%g5,	%o1,	%o0
	srax	%i0,	%g2,	%o6
loop_133:
	tvs	%icc,	0x7
loop_134:
	srax	%g3,	%i4,	%o3
	bvc,a	%icc,	loop_135
	tleu	%icc,	0x6
	sra	%i6,	0x19,	%o7
	fnegd	%f30,	%f18
loop_135:
	movleu	%icc,	%i1,	%o5
	edge8n	%l1,	%o4,	%i3
	udivcc	%l2,	0x12CA,	%g1
	edge8	%g4,	%l6,	%l5
	tleu	%xcc,	0x7
	fandnot2	%f0,	%f0,	%f26
	sra	%i5,	0x1B,	%i7
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x3B] %asi,	%l3
	movn	%xcc,	%g6,	%g7
	mova	%icc,	%l0,	%o2
	movleu	%icc,	%i2,	%l4
	subcc	%g5,	0x0DD7,	%o0
	movn	%xcc,	%i0,	%g2
	nop
	set	0x7A, %g7
	lduh	[%l7 + %g7],	%o6
	tvc	%icc,	0x2
	movgu	%icc,	%o1,	%i4
	tgu	%xcc,	0x6
	te	%icc,	0x6
	nop
	setx	0x395A1AFFA9934977,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x81D2C5230555F4AC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f0,	%f14
	fbu,a	%fcc0,	loop_136
	udiv	%o3,	0x163D,	%i6
	set	0x20, %o6
	prefetcha	[%l7 + %o6] 0x89,	 0x0
loop_136:
	fmovrse	%i1,	%f23,	%f29
	nop
	fitod	%f2,	%f26
	fdtoi	%f26,	%f15
	move	%xcc,	%g3,	%o5
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x38] %asi,	%l1
	taddcctv	%i3,	0x1732,	%l2
	bpos,a	loop_137
	fmuld8sux16	%f16,	%f13,	%f10
	movleu	%xcc,	%o4,	%g1
	udivx	%g4,	0x19E1,	%l5
loop_137:
	fpsub16s	%f21,	%f31,	%f18
	fblg	%fcc2,	loop_138
	nop
	setx	0x877674BD662E91BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x00A5512BF9812DCA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f10,	%f16
	tne	%icc,	0x3
	membar	0x18
loop_138:
	subcc	%i5,	%l6,	%l3
	edge16ln	%i7,	%g6,	%g7
	tl	%icc,	0x2
	tge	%icc,	0x7
	umul	%o2,	%i2,	%l0
	smul	%l4,	0x0F7B,	%g5
	udivcc	%o0,	0x0929,	%g2
	sdivx	%o6,	0x1551,	%o1
	set	0x44, %o1
	lduha	[%l7 + %o1] 0x89,	%i4
	fbuge,a	%fcc0,	loop_139
	fmovdl	%xcc,	%f15,	%f3
	sir	0x1E6E
	andn	%i0,	0x171A,	%o3
loop_139:
	edge32n	%i6,	%i1,	%g3
	tpos	%icc,	0x0
	orncc	%o5,	%o7,	%i3
	tcs	%xcc,	0x2
	sdivx	%l1,	0x030D,	%o4
	edge16l	%l2,	%g1,	%g4
	tn	%xcc,	0x4
	movle	%xcc,	%l5,	%l6
	stw	%i5,	[%l7 + 0x50]
	movrlz	%l3,	%g6,	%g7
	fors	%f8,	%f28,	%f30
	taddcc	%o2,	%i2,	%l0
	tl	%xcc,	0x4
	udivcc	%l4,	0x0AC2,	%g5
	tn	%xcc,	0x4
	tsubcc	%o0,	0x04AB,	%i7
	fmovdle	%xcc,	%f10,	%f26
	swap	[%l7 + 0x7C],	%g2
	nop
	set	0x50, %g5
	lduh	[%l7 + %g5],	%o6
	movn	%icc,	%i4,	%o1
	andncc	%o3,	%i6,	%i0
	tl	%icc,	0x6
	bleu	loop_140
	nop
	setx	0x641A562676A5B1FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE6C2340B8EA2FE49,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f14,	%f8
	mova	%icc,	%i1,	%o5
	array32	%o7,	%g3,	%i3
loop_140:
	nop
	setx	0xB646EEBC0E78F730,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xFC012E50D77A0601,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f14,	%f12
	fcmpne16	%f14,	%f22,	%o4
	bshuffle	%f8,	%f4,	%f22
	movleu	%icc,	%l1,	%g1
	movle	%xcc,	%g4,	%l5
	lduw	[%l7 + 0x08],	%l2
	movrgz	%i5,	0x100,	%l6
	fcmpgt16	%f16,	%f30,	%l3
	edge32	%g6,	%g7,	%o2
	set	0x28, %i2
	ldswa	[%l7 + %i2] 0x15,	%l0
	movgu	%xcc,	%i2,	%g5
	ba	loop_141
	sub	%l4,	0x12C9,	%o0
	udivx	%i7,	0x1F2D,	%o6
	movn	%xcc,	%g2,	%o1
loop_141:
	srax	%o3,	%i4,	%i6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i0,	%o5
	movl	%icc,	%o7,	%g3
	fandnot1s	%f19,	%f26,	%f11
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%i1
	tleu	%xcc,	0x1
	edge16n	%i3,	%o4,	%g1
	membar	0x7E
	tsubcc	%g4,	0x0958,	%l5
	orn	%l1,	%l2,	%l6
	brlz	%i5,	loop_142
	udivcc	%g6,	0x07BD,	%l3
	fpsub16	%f8,	%f26,	%f18
	fbn,a	%fcc0,	loop_143
loop_142:
	srax	%o2,	0x00,	%g7
	ta	%xcc,	0x0
	brlez	%i2,	loop_144
loop_143:
	nop
	setx	0x852BA17F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f22
	subcc	%l0,	0x1E72,	%g5
	add	%l4,	%o0,	%i7
loop_144:
	te	%xcc,	0x2
	and	%o6,	%g2,	%o1
	umulcc	%i4,	%o3,	%i0
	bne	loop_145
	udivcc	%o5,	0x1827,	%o7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%i1
loop_145:
	edge8ln	%g3,	%i3,	%g1
	fornot2s	%f8,	%f24,	%f10
	nop
	fitod	%f9,	%f30
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x44] %asi,	%f5
	nop
	setx	loop_146,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%icc,	%o4,	%l5
	fbule	%fcc3,	loop_147
	array8	%l1,	%g4,	%l2
loop_146:
	nop
	setx loop_148, %l0, %l1
	jmpl %l1, %l6
	lduh	[%l7 + 0x6C],	%g6
loop_147:
	nop
	fitos	%f31,	%f22
	fmovdcc	%icc,	%f26,	%f29
loop_148:
	edge32l	%i5,	%l3,	%o2
	alignaddr	%g7,	%i2,	%g5
	edge16n	%l0,	%o0,	%i7
	udiv	%o6,	0x1068,	%l4
	nop
	set	0x40, %o3
	stx	%o1,	[%l7 + %o3]
	fbug	%fcc2,	loop_149
	udiv	%i4,	0x1EC7,	%o3
	tneg	%icc,	0x2
	fmovrdgz	%g2,	%f2,	%f22
loop_149:
	movrlz	%i0,	%o7,	%o5
	fmovsgu	%icc,	%f6,	%f13
	sll	%i6,	%i1,	%i3
	nop
	set	0x0B, %l2
	ldub	[%l7 + %l2],	%g1
	tg	%xcc,	0x7
	tcc	%xcc,	0x1
	fmovsleu	%xcc,	%f8,	%f17
	fcmpne32	%f0,	%f30,	%o4
	movneg	%icc,	%l5,	%l1
	orn	%g4,	0x1362,	%l2
	sdivx	%g3,	0x1A6E,	%l6
	fornot1s	%f9,	%f7,	%f16
	fpsub32s	%f27,	%f9,	%f6
	smulcc	%i5,	0x0E23,	%l3
	xnorcc	%g6,	0x00D5,	%o2
	nop
	setx	0x5F1743E3A0686602,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	wr	%g0,	0x19,	%asi
	stxa	%g7,	[%l7 + 0x58] %asi
	fnot1	%f18,	%f0
	smul	%g5,	%l0,	%o0
	fbug	%fcc0,	loop_150
	tgu	%xcc,	0x4
	tle	%icc,	0x4
	add	%i7,	%o6,	%i2
loop_150:
	movrgz	%l4,	%i4,	%o3
	sir	0x13F2
	srl	%o1,	0x16,	%g2
	sethi	0x059A,	%o7
	srlx	%i0,	%i6,	%i1
	nop
	setx	loop_151,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%o5,	%i3,	%o4
	edge32l	%g1,	%l5,	%g4
	fmovda	%xcc,	%f9,	%f16
loop_151:
	xor	%l2,	%l1,	%l6
	fbul,a	%fcc2,	loop_152
	nop
	fitod	%f27,	%f20
	set	0x63, %l5
	stba	%g3,	[%l7 + %l5] 0xe2
	membar	#Sync
loop_152:
	fandnot2s	%f23,	%f10,	%f4
	movvs	%xcc,	%i5,	%g6
	andn	%l3,	%g7,	%g5
	umulcc	%l0,	0x0C7D,	%o0
	movvs	%xcc,	%i7,	%o2
	set	0x10, %i1
	ldda	[%l7 + %i1] 0x24,	%o6
	movgu	%xcc,	%l4,	%i2
	sdivcc	%i4,	0x0F7A,	%o1
	array32	%o3,	%g2,	%o7
	fbl,a	%fcc3,	loop_153
	movrgez	%i0,	0x036,	%i1
	addc	%i6,	%o5,	%i3
	fpadd32s	%f9,	%f10,	%f29
loop_153:
	edge32ln	%g1,	%o4,	%l5
	movcc	%xcc,	%l2,	%g4
	sll	%l1,	%g3,	%i5
	fandnot1s	%f19,	%f9,	%f20
	edge32n	%g6,	%l3,	%l6
	edge32ln	%g5,	%l0,	%g7
	tvs	%icc,	0x5
	fba	%fcc3,	loop_154
	ba,pn	%xcc,	loop_155
	subcc	%i7,	%o2,	%o0
	movre	%o6,	%l4,	%i4
loop_154:
	fbule,a	%fcc0,	loop_156
loop_155:
	movn	%icc,	%i2,	%o1
	udiv	%o3,	0x1749,	%g2
	ldstub	[%l7 + 0x5B],	%o7
loop_156:
	nop
	set	0x61, %o0
	ldub	[%l7 + %o0],	%i1
	fmul8sux16	%f24,	%f24,	%f6
	fbne	%fcc2,	loop_157
	tge	%xcc,	0x0
	fcmple32	%f14,	%f16,	%i6
	swap	[%l7 + 0x7C],	%o5
loop_157:
	st	%f29,	[%l7 + 0x08]
	tvc	%icc,	0x2
	ldx	[%l7 + 0x08],	%i0
	alignaddrl	%i3,	%o4,	%g1
	addccc	%l5,	%g4,	%l1
	fbn	%fcc2,	loop_158
	tsubcc	%l2,	%g3,	%g6
	edge8ln	%l3,	%l6,	%i5
	sdivx	%l0,	0x1ABA,	%g7
loop_158:
	tcc	%icc,	0x7
	subcc	%i7,	%o2,	%o0
	array8	%g5,	%l4,	%i4
	fone	%f16
	movvs	%xcc,	%i2,	%o1
	fbug,a	%fcc0,	loop_159
	movcs	%icc,	%o6,	%o3
	mulscc	%g2,	0x1BB5,	%o7
	udiv	%i6,	0x0863,	%i1
loop_159:
	popc	%i0,	%i3
	ldx	[%l7 + 0x10],	%o5
	sir	0x12C8
	fmovscc	%xcc,	%f11,	%f20
	wr	%g0,	0x11,	%asi
	stha	%o4,	[%l7 + 0x16] %asi
	fpack16	%f2,	%f7
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tgu	%icc,	0x4
	xnor	%g1,	0x17BC,	%g4
	sllx	%l1,	%l2,	%g3
	movn	%xcc,	%g6,	%l5
	srl	%l6,	%l3,	%l0
	edge32l	%g7,	%i5,	%i7
	fmovdgu	%icc,	%f9,	%f6
	fmovdvc	%icc,	%f31,	%f5
	tsubcctv	%o2,	%o0,	%l4
	wr	%g0,	0x19,	%asi
	stba	%g5,	[%l7 + 0x50] %asi
	addc	%i4,	%i2,	%o1
	movge	%xcc,	%o6,	%g2
	fbn	%fcc0,	loop_160
	edge16n	%o7,	%o3,	%i1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%i6,	%i0
loop_160:
	fble,a	%fcc3,	loop_161
	edge8l	%o5,	%i3,	%g1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
loop_161:
	fbg,a	%fcc1,	loop_162
	taddcctv	%o4,	%l1,	%g3
	sra	%l2,	%g6,	%l6
	set	0x63, %l0
	ldstuba	[%l7 + %l0] 0x19,	%l3
loop_162:
	smul	%l5,	%g7,	%i5
	tleu	%icc,	0x2
	tsubcc	%l0,	0x1A90,	%i7
	stb	%o0,	[%l7 + 0x6E]
	ta	%icc,	0x7
	fbne	%fcc2,	loop_163
	bg,a	%icc,	loop_164
	fpack16	%f4,	%f30
	srax	%o2,	0x0D,	%g5
loop_163:
	bl	loop_165
loop_164:
	ldub	[%l7 + 0x27],	%i4
	umul	%i2,	%l4,	%o6
	taddcctv	%o1,	%g2,	%o3
loop_165:
	edge16n	%i1,	%i6,	%o7
	edge8ln	%o5,	%i3,	%g1
	movleu	%icc,	%g4,	%i0
	set	0x57, %l3
	ldsba	[%l7 + %l3] 0x88,	%o4
	brlz,a	%l1,	loop_166
	and	%g3,	0x10EF,	%g6
	array16	%l2,	%l3,	%l6
	fbul,a	%fcc0,	loop_167
loop_166:
	fbu,a	%fcc0,	loop_168
	movne	%icc,	%l5,	%g7
	ldsh	[%l7 + 0x7E],	%l0
loop_167:
	fnands	%f6,	%f2,	%f15
loop_168:
	fpsub16	%f22,	%f6,	%f22
	orncc	%i5,	%o0,	%i7
	nop
	set	0x32, %o4
	ldub	[%l7 + %o4],	%o2
	fsrc1s	%f6,	%f23
	movleu	%icc,	%g5,	%i2
	movvc	%xcc,	%l4,	%o6
	tn	%xcc,	0x5
	fcmpne16	%f2,	%f12,	%i4
	fmovrslez	%g2,	%f13,	%f23
	xnorcc	%o1,	0x089E,	%o3
	fmovdpos	%xcc,	%f21,	%f17
	movrgz	%i6,	0x157,	%i1
	movn	%xcc,	%o7,	%o5
	orn	%i3,	%g1,	%g4
	tsubcc	%o4,	0x1EB2,	%l1
	flush	%l7 + 0x38
	movneg	%icc,	%i0,	%g6
	movne	%icc,	%l2,	%g3
	tgu	%icc,	0x4
	orcc	%l6,	%l3,	%g7
	ldx	[%l7 + 0x18],	%l0
	subcc	%i5,	%o0,	%l5
	tvc	%xcc,	0x1
	add	%i7,	0x0269,	%g5
	tge	%icc,	0x7
	fblg	%fcc1,	loop_169
	srax	%i2,	0x1E,	%l4
	subccc	%o2,	0x11BC,	%i4
	bcc,a,pn	%icc,	loop_170
loop_169:
	edge8n	%o6,	%g2,	%o3
	tg	%xcc,	0x4
	bcc	loop_171
loop_170:
	fmovdvs	%xcc,	%f18,	%f25
	movpos	%icc,	%o1,	%i6
	edge32n	%o7,	%i1,	%i3
loop_171:
	nop
	fitod	%f0,	%f16
	fdtoi	%f16,	%f9
	subccc	%g1,	%o5,	%g4
	mulx	%o4,	%l1,	%g6
	edge8ln	%i0,	%l2,	%g3
	nop
	fitos	%f13,	%f12
	fstod	%f12,	%f6
	fmovdcc	%icc,	%f17,	%f19
	addccc	%l3,	%g7,	%l0
	udivcc	%i5,	0x15EC,	%o0
	subccc	%l5,	0x07DD,	%l6
	stbar
	array8	%g5,	%i2,	%l4
	brlz,a	%o2,	loop_172
	tsubcctv	%i4,	%o6,	%i7
	fabss	%f8,	%f31
	stx	%g2,	[%l7 + 0x28]
loop_172:
	movrlz	%o1,	0x038,	%o3
	tpos	%xcc,	0x1
	tleu	%icc,	0x5
	edge16l	%i6,	%i1,	%o7
	tg	%xcc,	0x4
	sdivx	%g1,	0x03D0,	%o5
	fbuge	%fcc2,	loop_173
	tcs	%xcc,	0x7
	fmovsgu	%xcc,	%f19,	%f22
	tcc	%xcc,	0x4
loop_173:
	fbuge,a	%fcc2,	loop_174
	nop
	fitos	%f0,	%f18
	fstox	%f18,	%f8
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x16,	%f0
loop_174:
	ldd	[%l7 + 0x68],	%f26
	sra	%i3,	%g4,	%o4
	edge8l	%l1,	%g6,	%i0
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tpos	%icc,	0x7
	nop
	setx	0x953A191E698A468C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f22
	fmovsgu	%xcc,	%f22,	%f29
	array32	%g3,	%l3,	%l2
	movneg	%icc,	%l0,	%i5
	edge16ln	%g7,	%l5,	%o0
	edge8ln	%l6,	%g5,	%i2
	movne	%icc,	%l4,	%o2
	te	%xcc,	0x5
	nop
	setx	0x6360E14CC1297C4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x9EDF6108F03B7664,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f26,	%f30
	add	%i4,	%i7,	%o6
	udivcc	%g2,	0x1E15,	%o1
	movleu	%xcc,	%o3,	%i1
	xnorcc	%o7,	0x0083,	%g1
	bvs	%icc,	loop_175
	ldx	[%l7 + 0x60],	%o5
	brz,a	%i3,	loop_176
	bne	%xcc,	loop_177
loop_175:
	movvs	%icc,	%i6,	%o4
	tge	%icc,	0x0
loop_176:
	andn	%l1,	%g6,	%i0
loop_177:
	movrne	%g3,	%g4,	%l2
	movn	%xcc,	%l3,	%i5
	taddcctv	%l0,	%l5,	%o0
	tne	%icc,	0x7
	edge32ln	%l6,	%g5,	%g7
	sir	0x148B
	fbule	%fcc2,	loop_178
	edge8l	%i2,	%l4,	%i4
	fmovdpos	%xcc,	%f1,	%f21
	fmovsle	%xcc,	%f15,	%f27
loop_178:
	edge8n	%i7,	%o6,	%g2
	sir	0x1E30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o2,	%o1,	%o3
	wr	%g0,	0xe2,	%asi
	stha	%o7,	[%l7 + 0x76] %asi
	membar	#Sync
	brlz	%g1,	loop_179
	movneg	%icc,	%i1,	%o5
	sll	%i6,	0x1E,	%i3
	andcc	%l1,	%g6,	%o4
loop_179:
	xnorcc	%i0,	%g3,	%g4
	sth	%l2,	[%l7 + 0x6E]
	tg	%icc,	0x1
	faligndata	%f20,	%f30,	%f16
	wr	%g0,	0x22,	%asi
	stba	%l3,	[%l7 + 0x3C] %asi
	membar	#Sync
	tpos	%xcc,	0x1
	tcc	%xcc,	0x7
	movcs	%xcc,	%i5,	%l0
	fmovdl	%xcc,	%f6,	%f22
	taddcc	%l5,	%o0,	%g5
	movn	%xcc,	%g7,	%l6
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f1
	xor	%l4,	%i2,	%i7
	or	%i4,	0x174F,	%g2
	sethi	0x1A6F,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc0,	loop_180
	subcc	%o2,	%o1,	%o3
	xnor	%o7,	0x0194,	%i1
	lduh	[%l7 + 0x28],	%g1
loop_180:
	tcc	%icc,	0x3
	udiv	%o5,	0x12A5,	%i3
	edge8	%l1,	%i6,	%o4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x60] %asi,	%g6
	tl	%xcc,	0x5
	tgu	%xcc,	0x7
	fsrc2	%f10,	%f20
	ldd	[%l7 + 0x10],	%i0
	movle	%icc,	%g3,	%g4
	sethi	0x13AF,	%l3
	tcc	%xcc,	0x3
	fmovdg	%icc,	%f24,	%f17
	fmovsg	%icc,	%f15,	%f24
	tleu	%xcc,	0x7
	addcc	%l2,	0x0D14,	%i5
	xor	%l5,	0x14B6,	%o0
	stbar
	edge32l	%g5,	%g7,	%l0
	edge8l	%l4,	%l6,	%i2
	ldsw	[%l7 + 0x10],	%i4
	edge8ln	%g2,	%o6,	%o2
	fbl,a	%fcc3,	loop_181
	tn	%icc,	0x2
	fpadd16s	%f13,	%f30,	%f19
	fxnors	%f16,	%f0,	%f6
loop_181:
	edge32ln	%o1,	%o3,	%i7
	fornot2s	%f22,	%f30,	%f6
	movpos	%icc,	%i1,	%o7
	tgu	%icc,	0x5
	array16	%g1,	%o5,	%l1
	sdivx	%i3,	0x0B41,	%o4
	xor	%g6,	%i0,	%g3
	edge8ln	%i6,	%l3,	%l2
	subcc	%g4,	0x141C,	%i5
	sra	%o0,	%g5,	%l5
	tvc	%icc,	0x3
	set	0x47, %o7
	ldsba	[%l7 + %o7] 0x80,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g7,	%l6
	ble,a,pn	%xcc,	loop_182
	edge32ln	%l4,	%i4,	%i2
	te	%icc,	0x7
	and	%g2,	%o2,	%o6
loop_182:
	edge32	%o1,	%i7,	%o3
	fmovrdgz	%o7,	%f10,	%f24
	srax	%i1,	0x09,	%o5
	tpos	%icc,	0x3
	movpos	%icc,	%g1,	%i3
	smul	%l1,	%g6,	%o4
	ld	[%l7 + 0x20],	%f19
	movcc	%icc,	%g3,	%i0
	sub	%l3,	%i6,	%l2
	srlx	%g4,	0x11,	%i5
	edge32l	%o0,	%l5,	%l0
	tl	%icc,	0x5
	sethi	0x0D4B,	%g5
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x58] %asi,	%g7
	sll	%l4,	%i4,	%l6
	xor	%g2,	%o2,	%o6
	movl	%icc,	%i2,	%i7
	tcs	%icc,	0x5
	movleu	%icc,	%o3,	%o1
	tcs	%icc,	0x1
	bpos,a,pt	%icc,	loop_183
	subc	%i1,	%o5,	%o7
	movrlz	%g1,	0x0B9,	%i3
	fmovdge	%xcc,	%f14,	%f4
loop_183:
	edge16	%l1,	%o4,	%g3
	alignaddr	%i0,	%l3,	%g6
	te	%xcc,	0x4
	ldstub	[%l7 + 0x7B],	%i6
	fmovsvc	%icc,	%f11,	%f30
	srlx	%g4,	0x1A,	%i5
	set	0x58, %g2
	lda	[%l7 + %g2] 0x19,	%f12
	alignaddrl	%l2,	%l5,	%o0
	umul	%l0,	0x1CB7,	%g5
	fpack32	%f8,	%f2,	%f30
	movne	%xcc,	%l4,	%g7
	tvs	%xcc,	0x5
	sll	%l6,	%i4,	%g2
	edge8l	%o2,	%i2,	%o6
	udivcc	%o3,	0x18FA,	%i7
	udiv	%o1,	0x1804,	%i1
	movleu	%xcc,	%o5,	%o7
	set	0x24, %l4
	stha	%i3,	[%l7 + %l4] 0x2a
	membar	#Sync
	movvc	%icc,	%l1,	%g1
	edge16	%g3,	%o4,	%i0
	ldsw	[%l7 + 0x6C],	%l3
	set	0x18, %l6
	ldswa	[%l7 + %l6] 0x14,	%g6
	tge	%xcc,	0x6
	sra	%g4,	0x1F,	%i6
	edge32ln	%i5,	%l5,	%o0
	prefetch	[%l7 + 0x74],	 0x2
	fmovdgu	%xcc,	%f12,	%f14
	sub	%l0,	%g5,	%l4
	fmovsvc	%xcc,	%f28,	%f31
	movgu	%icc,	%g7,	%l2
	ta	%xcc,	0x3
	movg	%xcc,	%i4,	%g2
	fbul,a	%fcc3,	loop_184
	movg	%icc,	%o2,	%l6
	srax	%o6,	%i2,	%o3
	ta	%icc,	0x5
loop_184:
	tl	%xcc,	0x7
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f16
	udivcc	%i7,	0x0401,	%o1
	fabss	%f18,	%f15
	nop
	setx	0xD93A85E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f10
	fmovrdgz	%i1,	%f20,	%f18
	movrgz	%o5,	%i3,	%o7
	te	%icc,	0x1
	edge32l	%g1,	%l1,	%g3
	array32	%i0,	%l3,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x6
	fmovsn	%xcc,	%f4,	%f16
	bvc,pt	%xcc,	loop_185
	movrgez	%g6,	0x395,	%g4
	edge32l	%i6,	%i5,	%l5
	orn	%o0,	%l0,	%l4
loop_185:
	tge	%xcc,	0x7
	movg	%xcc,	%g5,	%l2
	orn	%g7,	0x070A,	%g2
	tg	%icc,	0x5
	srlx	%i4,	0x03,	%o2
	nop
	setx	0xEB97F449D06104F0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	ba	loop_186
	tsubcc	%o6,	%l6,	%i2
	fmul8x16au	%f12,	%f7,	%f24
	bcs,a	loop_187
loop_186:
	fbl,a	%fcc0,	loop_188
	ld	[%l7 + 0x78],	%f7
	tle	%icc,	0x2
loop_187:
	mulx	%o3,	%o1,	%i1
loop_188:
	brz,a	%i7,	loop_189
	move	%xcc,	%i3,	%o5
	movrgez	%g1,	0x34B,	%l1
	movneg	%icc,	%o7,	%i0
loop_189:
	movre	%g3,	0x2A1,	%l3
	orncc	%g6,	%g4,	%i6
	orn	%i5,	%o4,	%l5
	fbo	%fcc2,	loop_190
	fbe	%fcc1,	loop_191
	bg,a	%icc,	loop_192
	tl	%xcc,	0x3
loop_190:
	movrgez	%l0,	0x3BA,	%o0
loop_191:
	tne	%xcc,	0x5
loop_192:
	call	loop_193
	fxnors	%f8,	%f22,	%f5
	movle	%icc,	%l4,	%g5
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x0C] %asi,	%g7
loop_193:
	andncc	%l2,	%g2,	%i4
	edge8	%o6,	%o2,	%i2
	fmovde	%xcc,	%f7,	%f2
	movne	%icc,	%l6,	%o3
	addccc	%o1,	%i1,	%i3
	umul	%i7,	0x0CEA,	%o5
	movn	%xcc,	%l1,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o7,	[%l7 + 0x54]
	tg	%icc,	0x0
	srlx	%g3,	0x19,	%l3
	movrlz	%g6,	0x2EC,	%i0
	set	0x70, %g3
	stxa	%i6,	[%l7 + %g3] 0x11
	smulcc	%i5,	%g4,	%o4
	movvc	%xcc,	%l5,	%o0
	movge	%xcc,	%l0,	%g5
	set	0x70, %o2
	prefetcha	[%l7 + %o2] 0x11,	 0x3
	set	0x08, %i4
	prefetcha	[%l7 + %i4] 0x18,	 0x3
	fmovsgu	%icc,	%f17,	%f21
	fbue,a	%fcc1,	loop_194
	andncc	%l2,	%g2,	%o6
	fblg,a	%fcc2,	loop_195
	movneg	%xcc,	%i4,	%o2
loop_194:
	fmovdn	%xcc,	%f9,	%f14
	bl,a	%xcc,	loop_196
loop_195:
	brnz	%i2,	loop_197
	stx	%l6,	[%l7 + 0x58]
	xor	%o1,	%i1,	%o3
loop_196:
	fone	%f0
loop_197:
	nop
	set	0x48, %i7
	sta	%f24,	[%l7 + %i7] 0x0c
	movneg	%xcc,	%i7,	%o5
	umulcc	%l1,	0x130A,	%i3
	fmovsvc	%xcc,	%f10,	%f12
	nop
	fitod	%f6,	%f28
	fdtos	%f28,	%f8
	fandnot1	%f28,	%f8,	%f24
	fbu	%fcc0,	loop_198
	lduw	[%l7 + 0x18],	%o7
	edge8ln	%g1,	%g3,	%l3
	fmovdcs	%icc,	%f22,	%f14
loop_198:
	movrlez	%g6,	0x283,	%i0
	srl	%i6,	%g4,	%i5
	movrlz	%o4,	0x1F5,	%l5
	fcmpeq32	%f14,	%f30,	%l0
	tvs	%icc,	0x1
	nop
	setx	0x6A60D0368009041A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xC42807AE47ECEAD8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f6,	%f22
	andncc	%g5,	%g7,	%o0
	bne,pn	%icc,	loop_199
	fmovsge	%xcc,	%f5,	%f12
	tn	%icc,	0x2
	xnorcc	%l2,	0x12AD,	%g2
loop_199:
	fmovsne	%icc,	%f28,	%f27
	nop
	setx	loop_200,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%o6,	%l4,	%o2
	tcc	%icc,	0x4
	fbuge,a	%fcc3,	loop_201
loop_200:
	prefetch	[%l7 + 0x20],	 0x0
	orn	%i2,	%i4,	%o1
	udiv	%l6,	0x03D8,	%i1
loop_201:
	sir	0x116F
	edge8ln	%o3,	%o5,	%i7
	tpos	%icc,	0x2
	fmovrslez	%l1,	%f26,	%f18
	bcc,a,pt	%xcc,	loop_202
	movvs	%xcc,	%i3,	%o7
	edge16ln	%g3,	%g1,	%g6
	ldub	[%l7 + 0x0E],	%i0
loop_202:
	movg	%icc,	%l3,	%i6
	sdivx	%g4,	0x02BE,	%o4
	fcmple16	%f22,	%f2,	%i5
	brlez,a	%l5,	loop_203
	orn	%g5,	%g7,	%o0
	ba	loop_204
	add	%l0,	0x0BE2,	%g2
loop_203:
	srax	%o6,	0x09,	%l2
	sdivx	%l4,	0x130A,	%o2
loop_204:
	fnot1	%f28,	%f22
	andcc	%i2,	%o1,	%i4
	movle	%icc,	%i1,	%l6
	array32	%o5,	%o3,	%l1
	movpos	%xcc,	%i3,	%o7
	movcs	%icc,	%i7,	%g3
	or	%g6,	0x1CE7,	%g1
	movcs	%icc,	%l3,	%i0
	set	0x6C, %i3
	lduwa	[%l7 + %i3] 0x10,	%i6
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%g4
	umul	%o4,	%i5,	%g5
	fmuld8ulx16	%f9,	%f5,	%f30
	movgu	%xcc,	%g7,	%o0
	edge16ln	%l5,	%l0,	%o6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g2
	tpos	%icc,	0x4
	nop
	set	0x2A, %l1
	ldsb	[%l7 + %l1],	%l2
	fcmpne32	%f2,	%f30,	%o2
	fandnot2s	%f17,	%f21,	%f24
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x6D] %asi,	%i2
	xnorcc	%l4,	%i4,	%o1
	nop
	fitos	%f10,	%f11
	fstox	%f11,	%f8
	fcmpgt32	%f16,	%f2,	%l6
	bg,a,pt	%icc,	loop_205
	fxors	%f26,	%f24,	%f26
	udivcc	%o5,	0x0808,	%i1
	array32	%o3,	%i3,	%l1
loop_205:
	xorcc	%o7,	0x0EEB,	%i7
	fbg	%fcc1,	loop_206
	sth	%g3,	[%l7 + 0x42]
	movrlez	%g1,	0x0FA,	%l3
	tsubcc	%i0,	%i6,	%g4
loop_206:
	fmovrsne	%g6,	%f15,	%f29
	fsrc1s	%f29,	%f13
	nop
	setx loop_207, %l0, %l1
	jmpl %l1, %i5
	flush	%l7 + 0x2C
	edge8ln	%o4,	%g5,	%g7
	fnot2s	%f2,	%f21
loop_207:
	tge	%icc,	0x5
	set	0x56, %g1
	lduha	[%l7 + %g1] 0x81,	%l5
	ta	%icc,	0x0
	edge16	%o0,	%l0,	%o6
	fble,a	%fcc1,	loop_208
	st	%f10,	[%l7 + 0x28]
	fbl	%fcc0,	loop_209
	movne	%xcc,	%l2,	%g2
loop_208:
	movle	%icc,	%i2,	%l4
	mulscc	%i4,	%o2,	%l6
loop_209:
	movleu	%icc,	%o1,	%o5
	fcmpne32	%f16,	%f22,	%i1
	orcc	%i3,	%l1,	%o3
	ta	%xcc,	0x2
	tsubcctv	%i7,	%o7,	%g1
	fandnot1s	%f0,	%f3,	%f10
	edge8l	%l3,	%i0,	%i6
	srax	%g3,	%g4,	%i5
	movvs	%xcc,	%o4,	%g5
	fpsub16s	%f17,	%f13,	%f22
	mulscc	%g7,	%l5,	%o0
	fmovda	%xcc,	%f27,	%f18
	edge16	%g6,	%o6,	%l0
	ldd	[%l7 + 0x40],	%f12
	stb	%l2,	[%l7 + 0x75]
	tvc	%icc,	0x4
	taddcc	%i2,	0x04BE,	%l4
	tcc	%xcc,	0x0
	and	%g2,	0x15BE,	%o2
	movleu	%icc,	%i4,	%l6
	movcc	%xcc,	%o1,	%i1
	fmovsleu	%xcc,	%f27,	%f11
	brlz,a	%o5,	loop_210
	bge,a,pt	%xcc,	loop_211
	bleu,pn	%icc,	loop_212
	movneg	%xcc,	%l1,	%i3
loop_210:
	st	%f3,	[%l7 + 0x60]
loop_211:
	addcc	%o3,	%o7,	%i7
loop_212:
	nop
	setx	0x4856AE3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x148AF945,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f20,	%f29
	sdivx	%l3,	0x167F,	%g1
	bl	%xcc,	loop_213
	mulscc	%i0,	%i6,	%g3
	edge8n	%g4,	%i5,	%g5
	edge8	%o4,	%l5,	%o0
loop_213:
	bvc,a,pt	%icc,	loop_214
	fmovsle	%icc,	%f13,	%f21
	fones	%f23
	movgu	%icc,	%g7,	%g6
loop_214:
	edge8	%l0,	%l2,	%i2
	ta	%icc,	0x4
	tneg	%xcc,	0x0
	fnot1	%f8,	%f22
	andcc	%o6,	%g2,	%o2
	fmovsne	%xcc,	%f0,	%f25
	te	%icc,	0x6
	xnor	%i4,	%l6,	%l4
	fsrc1	%f0,	%f2
	fmovda	%icc,	%f31,	%f31
	fmovrde	%o1,	%f2,	%f18
	fors	%f1,	%f25,	%f9
	fmovrslz	%o5,	%f8,	%f14
	nop
	setx	0xC44BE018,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x808BEDFF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f8,	%f26
	membar	0x54
	movre	%i1,	%l1,	%o3
	array8	%i3,	%i7,	%l3
	movg	%icc,	%g1,	%o7
	bleu,pt	%xcc,	loop_215
	fnors	%f20,	%f18,	%f0
	nop
	setx	0xE9696059,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xBDBD7284,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f27,	%f25
	array8	%i0,	%i6,	%g3
loop_215:
	flush	%l7 + 0x68
	ldub	[%l7 + 0x22],	%g4
	array32	%i5,	%g5,	%o4
	addcc	%l5,	0x10D7,	%g7
	fbg	%fcc1,	loop_216
	subc	%g6,	0x077C,	%o0
	taddcc	%l0,	%i2,	%o6
	xor	%l2,	0x1733,	%o2
loop_216:
	alignaddr	%i4,	%g2,	%l6
	alignaddrl	%l4,	%o5,	%i1
	movcc	%xcc,	%o1,	%o3
	movcs	%icc,	%l1,	%i7
	sll	%l3,	0x11,	%g1
	membar	0x62
	add	%o7,	0x1EC2,	%i3
	fbge	%fcc2,	loop_217
	st	%f11,	[%l7 + 0x60]
	sir	0x0CE2
	tcc	%icc,	0x1
loop_217:
	ble,pn	%icc,	loop_218
	fnot1s	%f31,	%f11
	alignaddrl	%i0,	%i6,	%g3
	xnorcc	%i5,	0x0464,	%g4
loop_218:
	edge8	%g5,	%l5,	%o4
	fmovse	%icc,	%f26,	%f18
	subcc	%g6,	%g7,	%l0
	fblg	%fcc0,	loop_219
	fsrc1	%f18,	%f30
	te	%icc,	0x6
	fmovda	%xcc,	%f0,	%f10
loop_219:
	fandnot2s	%f19,	%f19,	%f6
	tgu	%icc,	0x6
	wr	%g0,	0x21,	%asi
	stxa	%i2,	[%g0 + 0x108] %asi
	sub	%o6,	0x1745,	%o0
	fblg,a	%fcc3,	loop_220
	tge	%xcc,	0x5
	andn	%o2,	%l2,	%g2
	edge8ln	%l6,	%l4,	%o5
loop_220:
	edge32n	%i1,	%o1,	%i4
	tl	%icc,	0x6
	ble	%xcc,	loop_221
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x6
	srl	%o3,	%i7,	%l3
loop_221:
	umulcc	%l1,	%g1,	%i3
	sdiv	%o7,	0x0626,	%i6
	fmovsn	%xcc,	%f12,	%f22
	movvs	%xcc,	%i0,	%g3
	fbug	%fcc1,	loop_222
	andncc	%g4,	%i5,	%l5
	fbn	%fcc3,	loop_223
	fbe	%fcc0,	loop_224
loop_222:
	ldsh	[%l7 + 0x62],	%g5
	fnands	%f24,	%f1,	%f5
loop_223:
	movleu	%icc,	%g6,	%g7
loop_224:
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
	tge	%icc,	0x1
	fcmpne16	%f28,	%f0,	%l0
	fpack32	%f22,	%f22,	%f2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i2,	%o4
	nop
	setx	0x20672839,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	set	0x68, %g6
	ldsha	[%l7 + %g6] 0x14,	%o6
	subc	%o0,	%l2,	%o2
	edge32l	%l6,	%l4,	%o5
	movrlez	%i1,	0x24D,	%g2
	addcc	%i4,	0x0FDC,	%o1
	tvc	%icc,	0x4
	bgu	%icc,	loop_225
	movvs	%icc,	%o3,	%l3
	tsubcctv	%i7,	%g1,	%l1
	fmovsvc	%xcc,	%f3,	%f3
loop_225:
	fmovsn	%icc,	%f20,	%f28
	tsubcc	%i3,	0x19DA,	%o7
	flush	%l7 + 0x74
	movcc	%icc,	%i0,	%i6
	fmovsg	%icc,	%f0,	%f9
	nop
	fitos	%f4,	%f29
	fstoi	%f29,	%f18
	andcc	%g4,	%g3,	%l5
	sllx	%g5,	0x11,	%g6
	tvs	%icc,	0x2
	tge	%xcc,	0x4
	tgu	%xcc,	0x3
	nop
	setx	loop_226,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpgt16	%f8,	%f2,	%i5
	udiv	%g7,	0x1E2C,	%l0
	tvc	%icc,	0x4
loop_226:
	movge	%xcc,	%i2,	%o6
	andcc	%o0,	%l2,	%o2
	edge32l	%o4,	%l4,	%l6
	te	%xcc,	0x4
	orn	%i1,	%g2,	%i4
	add	%o5,	0x16A5,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x08],	%l2
	subcc	%i7,	0x18D1,	%o3
	fmovdn	%xcc,	%f24,	%f16
	move	%xcc,	%g1,	%i3
	sub	%o7,	%i0,	%i6
	brlez,a	%g4,	loop_227
	prefetch	[%l7 + 0x70],	 0x3
	mulscc	%l1,	0x1DDF,	%l5
	movcc	%xcc,	%g5,	%g6
loop_227:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g3,	%g7
	add	%l0,	0x0B3E,	%i5
	bn	loop_228
	movvc	%icc,	%o6,	%i2
	tvc	%icc,	0x2
	add	%o0,	%l2,	%o2
loop_228:
	movrlz	%o4,	%l6,	%i1
	set	0x14, %i5
	lduwa	[%l7 + %i5] 0x11,	%l4
	tsubcc	%i4,	%o5,	%g2
	sth	%o1,	[%l7 + 0x08]
	xor	%l3,	0x076D,	%i7
	bge,a	loop_229
	fmovdvc	%icc,	%f29,	%f10
	fsrc2	%f28,	%f12
	sdiv	%o3,	0x05AD,	%g1
loop_229:
	add	%o7,	0x09AF,	%i0
	and	%i6,	0x0E58,	%g4
	nop
	setx	0x7A2AA164,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x1F8D9B91,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f27,	%f17
	edge32l	%i3,	%l5,	%g5
	edge16	%g6,	%l1,	%g3
	movne	%icc,	%g7,	%i5
	fbu,a	%fcc2,	loop_230
	fabss	%f6,	%f3
	tneg	%icc,	0x6
	xnor	%o6,	0x1389,	%l0
loop_230:
	fbu	%fcc1,	loop_231
	movvs	%xcc,	%i2,	%l2
	set	0x20, %i0
	prefetcha	[%l7 + %i0] 0x80,	 0x0
loop_231:
	or	%o4,	0x0AB7,	%l6
	tl	%icc,	0x5
	sdiv	%i1,	0x00D8,	%o2
	movpos	%xcc,	%i4,	%l4
	movvs	%xcc,	%g2,	%o1
	ldx	[%l7 + 0x28],	%o5
	fxors	%f11,	%f6,	%f3
	array16	%i7,	%o3,	%g1
	sdiv	%o7,	0x006B,	%i0
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	move	%icc,	%i6,	%l3
	fsrc1	%f12,	%f28
	ld	[%l7 + 0x48],	%f21
	fmovdvs	%xcc,	%f22,	%f30
	fxnor	%f24,	%f10,	%f24
	sra	%i3,	0x0C,	%l5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x68] %asi,	%g5
	ld	[%l7 + 0x40],	%f31
	tpos	%icc,	0x3
	nop
	set	0x6E, %i6
	ldstub	[%l7 + %i6],	%g4
	movleu	%icc,	%g6,	%l1
	fnot2s	%f1,	%f26
	movrgez	%g7,	0x2C4,	%g3
	fpsub32	%f26,	%f24,	%f8
	set	0x3E, %g7
	ldsba	[%l7 + %g7] 0x14,	%o6
	edge8l	%i5,	%i2,	%l2
	ba	loop_232
	fmovsgu	%xcc,	%f29,	%f12
	fble,a	%fcc2,	loop_233
	fmovrslez	%l0,	%f22,	%f29
loop_232:
	udivx	%o4,	0x044C,	%o0
	ldd	[%l7 + 0x38],	%i6
loop_233:
	bl,a,pt	%xcc,	loop_234
	fmovsvc	%xcc,	%f18,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o2,	%i1,	%l4
loop_234:
	tl	%xcc,	0x5
	edge16	%i4,	%o1,	%g2
	umulcc	%o5,	%o3,	%i7
	tle	%icc,	0x0
	nop
	setx	0x0F57550F2052F064,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fcmpne16	%f2,	%f26,	%o7
	sllx	%g1,	%i0,	%i6
	bvc	loop_235
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i3,	0x0A9F,	%l3
	bne,a	%icc,	loop_236
loop_235:
	fmovrdgez	%l5,	%f0,	%f0
	edge16	%g4,	%g6,	%l1
	nop
	fitos	%f7,	%f7
	fstod	%f7,	%f10
loop_236:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
	fxnor	%f28,	%f16,	%f16
	sll	%g5,	%g3,	%i5
	add	%i2,	0x04CB,	%o6
	flush	%l7 + 0x2C
	umulcc	%l2,	%l0,	%o4
	set	0x70, %o1
	prefetcha	[%l7 + %o1] 0x18,	 0x2
	movvc	%icc,	%l6,	%o2
	tl	%xcc,	0x6
	movleu	%icc,	%l4,	%i4
	membar	0x03
	tvs	%xcc,	0x2
	movrlez	%i1,	%o1,	%g2
	xorcc	%o3,	%o5,	%i7
	nop
	setx	0xB702C80780F65679,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x42A850CB0C38D582,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f0,	%f24
	tcs	%icc,	0x1
	nop
	setx	loop_237,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%icc,	%o7,	%g1
	xorcc	%i6,	0x1977,	%i3
	fmuld8sux16	%f6,	%f31,	%f30
loop_237:
	fmovdvs	%icc,	%f15,	%f28
	nop
	fitos	%f9,	%f11
	fstod	%f11,	%f2
	subc	%l3,	0x1408,	%i0
	fmul8ulx16	%f30,	%f8,	%f14
	addccc	%g4,	0x0A56,	%l5
	fbug,a	%fcc3,	loop_238
	fsrc1	%f16,	%f4
	fmovrdgz	%g6,	%f30,	%f12
	ldd	[%l7 + 0x48],	%g6
loop_238:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbuge	%fcc3,	loop_239
	tpos	%xcc,	0x5
	tsubcctv	%g5,	%l1,	%i5
	fmul8sux16	%f0,	%f22,	%f10
loop_239:
	tge	%xcc,	0x0
	ble,pt	%xcc,	loop_240
	fbl,a	%fcc0,	loop_241
	tn	%xcc,	0x2
	ldx	[%l7 + 0x18],	%i2
loop_240:
	fba,a	%fcc1,	loop_242
loop_241:
	ldstub	[%l7 + 0x23],	%g3
	edge8ln	%o6,	%l2,	%o4
	stb	%l0,	[%l7 + 0x68]
loop_242:
	fmovrde	%o0,	%f6,	%f0
	tneg	%xcc,	0x5
	movcs	%icc,	%l6,	%o2
	fpmerge	%f24,	%f31,	%f24
	fbe,a	%fcc1,	loop_243
	prefetch	[%l7 + 0x30],	 0x0
	umul	%i4,	%l4,	%o1
	fmuld8sux16	%f21,	%f16,	%f4
loop_243:
	movle	%icc,	%g2,	%i1
	fandnot1s	%f19,	%f28,	%f28
	set	0x30, %o6
	lduwa	[%l7 + %o6] 0x81,	%o3
	movge	%icc,	%i7,	%o7
	sdiv	%g1,	0x1BDC,	%i6
	fba	%fcc0,	loop_244
	andncc	%o5,	%l3,	%i0
	fnegs	%f13,	%f6
	fcmple32	%f12,	%f8,	%g4
loop_244:
	ble,a,pn	%icc,	loop_245
	fmul8x16	%f21,	%f0,	%f26
	nop
	setx	0x9E08AC2C101E1D4E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x665E3E993F9F3110,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f0,	%f26
	edge16	%l5,	%i3,	%g6
loop_245:
	tvs	%xcc,	0x0
	fnegs	%f6,	%f8
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x74] %asi,	%g5
	faligndata	%f20,	%f18,	%f24
	add	%l1,	0x1B53,	%g7
	bl,a	loop_246
	alignaddrl	%i5,	%i2,	%g3
	nop
	fitod	%f0,	%f28
	fdtox	%f28,	%f12
	movleu	%icc,	%l2,	%o4
loop_246:
	movgu	%icc,	%o6,	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x04,	%l0,	%o2
	set	0x58, %g5
	lda	[%l7 + %g5] 0x81,	%f15
	tn	%icc,	0x7
	ldsb	[%l7 + 0x4E],	%l6
	sra	%i4,	%o1,	%g2
	ld	[%l7 + 0x3C],	%f5
	movrne	%l4,	%o3,	%i1
	movre	%i7,	0x24E,	%o7
	tsubcctv	%i6,	0x0596,	%o5
	taddcctv	%g1,	%l3,	%g4
	mulscc	%i0,	%i3,	%l5
	ldsb	[%l7 + 0x53],	%g6
	movvs	%icc,	%l1,	%g7
	tgu	%xcc,	0x5
	fornot1	%f30,	%f12,	%f6
	addcc	%g5,	%i5,	%g3
	array32	%l2,	%i2,	%o6
	andncc	%o4,	%o0,	%l0
	tgu	%xcc,	0x3
	bgu	%xcc,	loop_247
	smul	%l6,	%i4,	%o2
	brlez	%o1,	loop_248
	movrgez	%l4,	%g2,	%o3
loop_247:
	fcmpgt16	%f10,	%f6,	%i1
	stw	%i7,	[%l7 + 0x14]
loop_248:
	fbge	%fcc2,	loop_249
	edge32n	%i6,	%o7,	%o5
	stx	%g1,	[%l7 + 0x48]
	addccc	%l3,	%g4,	%i3
loop_249:
	movrlez	%i0,	0x390,	%g6
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x0c
	nop
	setx	0x60CA000BE3424238,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xDA63262A03F3E8BF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f22,	%f8
	movne	%xcc,	%l5,	%g7
	movge	%xcc,	%g5,	%l1
	std	%f22,	[%l7 + 0x50]
	fcmpne16	%f8,	%f2,	%i5
	brgez,a	%g3,	loop_250
	movn	%icc,	%i2,	%o6
	fmovdl	%icc,	%f4,	%f10
	subcc	%l2,	%o4,	%l0
loop_250:
	mulx	%o0,	0x11F1,	%l6
	fmovsn	%xcc,	%f8,	%f11
	fbule	%fcc2,	loop_251
	stw	%o2,	[%l7 + 0x40]
	sdiv	%o1,	0x1B50,	%i4
	smul	%g2,	0x0893,	%l4
loop_251:
	fmovspos	%xcc,	%f22,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%i1,	loop_252
	movre	%i7,	%i6,	%o7
	tneg	%xcc,	0x4
	andcc	%o3,	%o5,	%g1
loop_252:
	tl	%icc,	0x3
	brnz	%g4,	loop_253
	fmovrdgz	%i3,	%f22,	%f26
	fnot1	%f22,	%f6
	nop
	setx	0x77689563CED05BF2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6A57EAF9EEA95673,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f20,	%f10
loop_253:
	nop
	setx	loop_254,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%l3,	%i0,	%g6
	subcc	%l5,	%g7,	%l1
	fmovsn	%xcc,	%f16,	%f24
loop_254:
	movle	%icc,	%i5,	%g3
	edge8	%i2,	%g5,	%o6
	sub	%l2,	0x1863,	%l0
	movcc	%icc,	%o4,	%l6
	addcc	%o0,	%o2,	%i4
	movcc	%xcc,	%g2,	%l4
	edge32ln	%o1,	%i7,	%i1
	brgz	%i6,	loop_255
	tl	%xcc,	0x1
	fpadd32s	%f31,	%f10,	%f9
	tvs	%icc,	0x3
loop_255:
	xor	%o7,	0x1073,	%o3
	andncc	%o5,	%g1,	%i3
	ldx	[%l7 + 0x78],	%l3
	movvs	%icc,	%i0,	%g4
	tvs	%icc,	0x3
	fpmerge	%f11,	%f0,	%f2
	nop
	set	0x61, %i2
	ldub	[%l7 + %i2],	%l5
	fmovscc	%xcc,	%f6,	%f27
	membar	0x64
	add	%l7,	0x30,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%g6
	fnegd	%f16,	%f0
	move	%icc,	%l1,	%g3
	flush	%l7 + 0x64
	flush	%l7 + 0x68
	brlez	%i5,	loop_256
	orncc	%g5,	%i2,	%l2
	tne	%icc,	0x5
	ldsb	[%l7 + 0x39],	%l0
loop_256:
	alignaddr	%o4,	%l6,	%o0
	add	%o6,	0x0A06,	%o2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%l4
	addccc	%o1,	%i4,	%i1
	tvc	%xcc,	0x3
	udivcc	%i7,	0x1EFE,	%i6
	subccc	%o3,	0x0080,	%o7
	mulscc	%g1,	0x1C41,	%o5
	fmovsle	%icc,	%f19,	%f6
	tge	%xcc,	0x1
	popc	0x0452,	%l3
	tle	%xcc,	0x2
	tn	%icc,	0x7
	movrlz	%i3,	0x046,	%i0
	smulcc	%l5,	0x1C97,	%g4
	udivcc	%g7,	0x136B,	%l1
	fmovde	%xcc,	%f31,	%f5
	orncc	%g3,	%i5,	%g6
	movleu	%icc,	%i2,	%g5
	tcc	%icc,	0x3
	alignaddr	%l2,	%o4,	%l6
	tcs	%icc,	0x1
	udivcc	%o0,	0x13AD,	%l0
	fmul8sux16	%f16,	%f20,	%f26
	addc	%o2,	0x1BCA,	%g2
	brz,a	%o6,	loop_257
	mulx	%l4,	0x1CD0,	%o1
	sethi	0x0108,	%i1
	umulcc	%i7,	%i6,	%i4
loop_257:
	movvc	%xcc,	%o3,	%o7
	sethi	0x09AA,	%o5
	fmovrsgz	%l3,	%f3,	%f19
	fmovdg	%xcc,	%f31,	%f28
	set	0x50, %l2
	swapa	[%l7 + %l2] 0x81,	%g1
	set	0x2C, %l5
	lduwa	[%l7 + %l5] 0x88,	%i0
	alignaddrl	%l5,	%i3,	%g7
	fble	%fcc0,	loop_258
	fnegs	%f16,	%f21
	bge,a,pn	%icc,	loop_259
	ta	%xcc,	0x6
loop_258:
	movre	%g4,	%l1,	%i5
	fmovsneg	%xcc,	%f18,	%f31
loop_259:
	faligndata	%f22,	%f16,	%f12
	fexpand	%f2,	%f8
	fmovrdne	%g6,	%f4,	%f6
	ldd	[%l7 + 0x30],	%i2
	edge8l	%g3,	%l2,	%g5
	fbge,a	%fcc3,	loop_260
	add	%o4,	0x14F1,	%o0
	fmovsl	%xcc,	%f23,	%f20
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x45] %asi,	%l6
loop_260:
	fcmple16	%f24,	%f0,	%l0
	subcc	%g2,	0x0A4E,	%o2
	fbuge,a	%fcc1,	loop_261
	fba,a	%fcc2,	loop_262
	movvc	%icc,	%l4,	%o6
	edge32n	%i1,	%i7,	%o1
loop_261:
	srax	%i6,	0x0B,	%o3
loop_262:
	tvc	%icc,	0x6
	movvc	%icc,	%o7,	%o5
	tgu	%icc,	0x7
	edge16n	%l3,	%g1,	%i4
	sdiv	%l5,	0x1671,	%i3
	fmovdcs	%xcc,	%f14,	%f20
	addc	%g7,	0x1386,	%i0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x38] %asi,	%g4
	addc	%i5,	%g6,	%i2
	fmul8x16al	%f12,	%f7,	%f0
	fbl	%fcc3,	loop_263
	subc	%g3,	%l2,	%g5
	fmovrdgez	%o4,	%f24,	%f20
	edge16n	%l1,	%o0,	%l0
loop_263:
	ldstub	[%l7 + 0x4A],	%g2
	umul	%l6,	0x14E9,	%o2
	xnorcc	%o6,	0x0338,	%i1
	set	0x2B, %i1
	stba	%i7,	[%l7 + %i1] 0x2b
	membar	#Sync
	movrgz	%l4,	0x2BF,	%i6
	array32	%o1,	%o3,	%o5
	fornot1s	%f25,	%f4,	%f14
	fba,a	%fcc0,	loop_264
	nop
	setx	0x0C4A26CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x8BB9EEB1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f3,	%f6
	fbge,a	%fcc3,	loop_265
	brlez	%o7,	loop_266
loop_264:
	fmul8x16au	%f23,	%f22,	%f10
	tleu	%icc,	0x3
loop_265:
	edge8n	%g1,	%i4,	%l5
loop_266:
	nop
	setx	0xE6E7F83793CE719B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x3666C0F18336FBCB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f18,	%f10
	sdivx	%l3,	0x0BD0,	%i3
	sdivcc	%g7,	0x132E,	%g4
	subcc	%i5,	0x0B9C,	%i0
	sir	0x1578
	subc	%i2,	0x128F,	%g6
	bcc,a,pt	%xcc,	loop_267
	fornot2s	%f9,	%f18,	%f22
	nop
	set	0x10, %o0
	stw	%g3,	[%l7 + %o0]
	brlez	%g5,	loop_268
loop_267:
	movn	%xcc,	%l2,	%l1
	fmovrslez	%o0,	%f25,	%f20
	bpos,a	loop_269
loop_268:
	edge16l	%o4,	%g2,	%l6
	bvc	%icc,	loop_270
	nop
	fitos	%f9,	%f2
	fstox	%f2,	%f8
loop_269:
	bcc,pt	%icc,	loop_271
	edge32	%o2,	%l0,	%i1
loop_270:
	movrne	%i7,	0x134,	%o6
	fxnors	%f4,	%f4,	%f12
loop_271:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x54] %asi,	%i6
	ldstub	[%l7 + 0x4B],	%l4
	mulx	%o1,	0x0F54,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o3,	%g1
	umul	%o7,	%l5,	%i4
	smul	%l3,	0x09ED,	%g7
	fmovdle	%icc,	%f15,	%f8
	fmovrdgez	%i3,	%f4,	%f0
	mulx	%i5,	0x0D34,	%g4
	fbu	%fcc0,	loop_272
	nop
	setx	0xE8F02791,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f18
	edge16n	%i2,	%i0,	%g3
	edge32ln	%g5,	%l2,	%l1
loop_272:
	movne	%icc,	%o0,	%o4
	smulcc	%g2,	%l6,	%o2
	addcc	%l0,	%g6,	%i7
	movg	%icc,	%i1,	%o6
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%i6
	movvs	%xcc,	%o1,	%o5
	tleu	%icc,	0x2
	movrgez	%o3,	0x329,	%g1
	movvc	%icc,	%l4,	%o7
	smulcc	%l5,	0x00DC,	%i4
	fmovscc	%xcc,	%f19,	%f2
	edge16n	%l3,	%g7,	%i3
	umulcc	%i5,	0x1F9C,	%g4
	bg,a,pt	%icc,	loop_273
	fnot1s	%f12,	%f12
	sth	%i0,	[%l7 + 0x28]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%g3
loop_273:
	brnz	%l2,	loop_274
	nop
	setx	loop_275,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16al	%f9,	%f13,	%f26
	fbul	%fcc2,	loop_276
loop_274:
	edge8	%l1,	%g5,	%o0
loop_275:
	sub	%o4,	0x0121,	%g2
	edge32ln	%l6,	%l0,	%o2
loop_276:
	sir	0x1E35
	sdivx	%g6,	0x09DB,	%i7
	ldsb	[%l7 + 0x45],	%o6
	ldsh	[%l7 + 0x5E],	%i6
	fmovdg	%icc,	%f4,	%f20
	membar	0x73
	movle	%xcc,	%i1,	%o1
	fmovdgu	%icc,	%f31,	%f12
	orncc	%o3,	%o5,	%l4
	nop
	setx	loop_277,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x79, %l0
	ldub	[%l7 + %l0],	%g1
	fmovrdgz	%o7,	%f0,	%f22
	fmovrdgz	%i4,	%f18,	%f20
loop_277:
	fxor	%f28,	%f20,	%f30
	brgez,a	%l5,	loop_278
	edge16	%g7,	%l3,	%i3
	nop
	setx	0xBF498463804E3D0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fzeros	%f24
loop_278:
	fpack16	%f4,	%f2
	bcc,a,pn	%xcc,	loop_279
	brgz	%i5,	loop_280
	udivcc	%g4,	0x1DB7,	%i0
	edge8ln	%i2,	%l2,	%l1
loop_279:
	ta	%icc,	0x1
loop_280:
	faligndata	%f18,	%f22,	%f30
	tl	%icc,	0x1
	tvc	%icc,	0x7
	srlx	%g3,	%g5,	%o4
	movn	%xcc,	%g2,	%o0
	ldx	[%l7 + 0x78],	%l6
	tsubcctv	%o2,	%g6,	%l0
	fbuge,a	%fcc1,	loop_281
	sdivx	%o6,	0x0560,	%i6
	srax	%i7,	0x00,	%i1
	fmovsn	%xcc,	%f8,	%f23
loop_281:
	movrlez	%o3,	%o1,	%o5
	wr	%g0,	0x88,	%asi
	stwa	%g1,	[%l7 + 0x30] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l4,	%o7,	%l5
	fsrc2	%f6,	%f0
	edge16l	%g7,	%l3,	%i4
	udiv	%i3,	0x062C,	%g4
	fcmpeq16	%f0,	%f14,	%i5
	std	%f14,	[%l7 + 0x68]
	bneg,a	%icc,	loop_282
	orncc	%i2,	0x099B,	%i0
	addcc	%l2,	%g3,	%g5
	edge32	%o4,	%g2,	%l1
loop_282:
	fmovdvs	%icc,	%f16,	%f30
	tle	%icc,	0x1
	fmovrslez	%o0,	%f8,	%f29
	sethi	0x09EA,	%l6
	edge8	%g6,	%l0,	%o2
	wr	%g0,	0x11,	%asi
	sta	%f4,	[%l7 + 0x28] %asi
	bge,pn	%icc,	loop_283
	mulscc	%o6,	%i7,	%i6
	ldsb	[%l7 + 0x74],	%i1
	array8	%o1,	%o5,	%o3
loop_283:
	srl	%g1,	0x0F,	%l4
	bn,a,pn	%xcc,	loop_284
	call	loop_285
	lduw	[%l7 + 0x2C],	%l5
	brlz,a	%g7,	loop_286
loop_284:
	fba,a	%fcc2,	loop_287
loop_285:
	brz	%o7,	loop_288
	edge32l	%l3,	%i3,	%g4
loop_286:
	sra	%i5,	%i2,	%i4
loop_287:
	tl	%xcc,	0x7
loop_288:
	srl	%i0,	0x02,	%l2
	movpos	%icc,	%g3,	%g5
	srlx	%o4,	%g2,	%o0
	xorcc	%l6,	%g6,	%l1
	umul	%o2,	0x0220,	%o6
	umul	%l0,	0x12F3,	%i7
	bn,pt	%icc,	loop_289
	fzeros	%f2
	fnors	%f31,	%f6,	%f11
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f22
loop_289:
	nop
	setx	0xBA6347A435753B9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x3F3C96F2D2556448,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f24,	%f28
	fnot1	%f30,	%f14
	te	%icc,	0x1
	ldsw	[%l7 + 0x74],	%i6
	andcc	%o1,	0x02DA,	%o5
	bg,pn	%icc,	loop_290
	popc	%o3,	%i1
	tcs	%icc,	0x0
	nop
	setx	0xE49A0193,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xB8667E18,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f1,	%f30
loop_290:
	ble,pt	%xcc,	loop_291
	edge8l	%l4,	%l5,	%g1
	xnor	%g7,	0x0341,	%l3
	array16	%o7,	%i3,	%i5
loop_291:
	movpos	%icc,	%g4,	%i2
	movrgz	%i4,	0x300,	%l2
	ta	%icc,	0x3
	fba,a	%fcc3,	loop_292
	umul	%g3,	%i0,	%o4
	sra	%g2,	0x1E,	%g5
	taddcctv	%o0,	%l6,	%l1
loop_292:
	sir	0x16F1
	umul	%g6,	%o6,	%o2
	movrgz	%l0,	0x17A,	%i7
	set	0x44, %l3
	lduha	[%l7 + %l3] 0x0c,	%i6
	movn	%icc,	%o1,	%o3
	nop
	setx loop_293, %l0, %l1
	jmpl %l1, %o5
	orn	%i1,	0x1B60,	%l5
	movvc	%icc,	%g1,	%l4
	fpack16	%f26,	%f24
loop_293:
	movpos	%icc,	%l3,	%g7
	tne	%icc,	0x3
	flush	%l7 + 0x1C
	mulscc	%i3,	0x01F5,	%i5
	nop
	fitod	%f12,	%f2
	fdtos	%f2,	%f18
	array32	%g4,	%i2,	%i4
	fbuge	%fcc1,	loop_294
	srl	%o7,	%l2,	%g3
	movrlz	%i0,	%o4,	%g5
	add	%g2,	0x1C43,	%l6
loop_294:
	tne	%icc,	0x1
	taddcc	%l1,	%g6,	%o6
	tleu	%icc,	0x2
	be,a	loop_295
	movn	%icc,	%o0,	%l0
	stb	%o2,	[%l7 + 0x7D]
	fmovrse	%i6,	%f8,	%f19
loop_295:
	addc	%o1,	0x13D8,	%i7
	for	%f0,	%f24,	%f2
	umulcc	%o5,	%o3,	%l5
	addccc	%g1,	0x035E,	%i1
	orcc	%l4,	%g7,	%i3
	fmovsa	%xcc,	%f20,	%f11
	te	%xcc,	0x0
	stx	%i5,	[%l7 + 0x40]
	subc	%l3,	%i2,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f8,	%f4,	%o7
	nop
	setx	0xC7FCFB3102C4DDCD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x965E98434FDE162B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f10,	%f0
	fnot2s	%f11,	%f6
	srlx	%g4,	0x15,	%g3
	mulscc	%l2,	0x0226,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%o4,	%g5
	fbuge,a	%fcc3,	loop_296
	movn	%xcc,	%g2,	%l1
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_296:
	and	%l6,	0x03CD,	%o6
	mova	%xcc,	%o0,	%g6
	te	%icc,	0x1
	udivx	%l0,	0x016A,	%o2
	array16	%i6,	%o1,	%i7
	sethi	0x114D,	%o3
	stb	%l5,	[%l7 + 0x0A]
	ldx	[%l7 + 0x10],	%o5
	set	0x6D, %o4
	lduba	[%l7 + %o4] 0x88,	%i1
	fmovdle	%icc,	%f3,	%f11
	nop
	set	0x68, %o7
	stx	%l4,	[%l7 + %o7]
	fpsub32	%f0,	%f16,	%f0
	fmovrde	%g7,	%f2,	%f12
	nop
	fitod	%f12,	%f6
	fdtos	%f6,	%f15
	tpos	%icc,	0x5
	tcs	%icc,	0x6
	fmovsle	%xcc,	%f27,	%f26
	set	0x3C, %g2
	swapa	[%l7 + %g2] 0x88,	%i3
	subcc	%g1,	%i5,	%i2
	movre	%l3,	0x056,	%o7
	brgez	%i4,	loop_297
	fnot1s	%f6,	%f23
	ta	%xcc,	0x2
	edge32n	%g4,	%l2,	%i0
loop_297:
	fmovrdlz	%g3,	%f10,	%f4
	tle	%icc,	0x5
	movcc	%xcc,	%o4,	%g2
	srlx	%l1,	0x1D,	%l6
	addc	%g5,	0x0F29,	%o6
	fands	%f31,	%f26,	%f27
	tne	%xcc,	0x3
	ta	%xcc,	0x2
	edge8n	%g6,	%l0,	%o0
	edge16l	%i6,	%o2,	%i7
	sdivx	%o1,	0x10C6,	%o3
	xnorcc	%l5,	%o5,	%l4
	set	0x10, %l4
	lduwa	[%l7 + %l4] 0x80,	%g7
	fornot2	%f6,	%f16,	%f24
	addcc	%i1,	%g1,	%i5
	or	%i3,	%l3,	%o7
	tsubcc	%i2,	0x1DA8,	%i4
	array8	%l2,	%g4,	%i0
	move	%xcc,	%o4,	%g2
	fmuld8ulx16	%f1,	%f26,	%f16
	orncc	%l1,	0x113D,	%g3
	fmovdvc	%xcc,	%f22,	%f13
	array32	%g5,	%l6,	%o6
	tg	%icc,	0x4
	edge32l	%l0,	%g6,	%o0
	movrgz	%i6,	%i7,	%o1
	fmovs	%f12,	%f29
	fcmpeq32	%f14,	%f14,	%o3
	umulcc	%l5,	%o2,	%o5
	tleu	%xcc,	0x0
	tg	%icc,	0x5
	prefetch	[%l7 + 0x78],	 0x2
	tpos	%xcc,	0x6
	fmovsgu	%icc,	%f19,	%f22
	smulcc	%g7,	0x0353,	%i1
	fzeros	%f2
	ld	[%l7 + 0x24],	%f2
	movgu	%icc,	%l4,	%g1
	tvc	%icc,	0x5
	sllx	%i3,	%i5,	%o7
	udiv	%i2,	0x0E11,	%l3
	edge8l	%i4,	%g4,	%l2
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%i0
	tle	%icc,	0x7
	sth	%g2,	[%l7 + 0x64]
	movge	%icc,	%o4,	%g3
	nop
	setx	0xACF36189819CDF43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x5EDD12759BF70FF2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f8,	%f8
	fpadd32	%f8,	%f22,	%f6
	andn	%g5,	0x015F,	%l1
	fand	%f26,	%f4,	%f26
	movneg	%icc,	%l6,	%o6
	nop
	set	0x6A, %l6
	lduh	[%l7 + %l6],	%g6
	fmovspos	%icc,	%f31,	%f31
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f16
	bge	loop_298
	ta	%icc,	0x2
	tge	%icc,	0x6
	movcs	%icc,	%l0,	%o0
loop_298:
	stx	%i7,	[%l7 + 0x18]
	brz	%i6,	loop_299
	tpos	%icc,	0x6
	nop
	setx	0x2222470B041ADB71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xE9DF5E7E22C0F5FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f24,	%f28
	movne	%xcc,	%o3,	%o1
loop_299:
	movgu	%xcc,	%l5,	%o2
	bn	loop_300
	fornot2s	%f26,	%f19,	%f6
	fmovspos	%icc,	%f22,	%f23
	bl,pt	%xcc,	loop_301
loop_300:
	subcc	%g7,	0x137B,	%o5
	fbne,a	%fcc1,	loop_302
	edge8ln	%i1,	%g1,	%i3
loop_301:
	movrlz	%i5,	0x1DF,	%l4
	edge8	%i2,	%o7,	%i4
loop_302:
	ld	[%l7 + 0x40],	%f12
	bcs,pt	%xcc,	loop_303
	popc	0x0EFB,	%l3
	fmovdvs	%xcc,	%f13,	%f19
	fmovdvc	%icc,	%f3,	%f20
loop_303:
	movpos	%xcc,	%l2,	%g4
	tge	%icc,	0x1
	swap	[%l7 + 0x20],	%i0
	udivcc	%g2,	0x13D8,	%g3
	fpack32	%f6,	%f4,	%f22
	ba,a,pt	%xcc,	loop_304
	orcc	%g5,	0x0AA2,	%o4
	fmovrdlez	%l1,	%f26,	%f24
	edge16	%l6,	%o6,	%l0
loop_304:
	udiv	%g6,	0x1915,	%i7
	fpadd16s	%f19,	%f15,	%f9
	nop
	fitod	%f4,	%f4
	fdtoi	%f4,	%f18
	brgez,a	%o0,	loop_305
	mova	%xcc,	%i6,	%o3
	nop
	set	0x14, %g4
	ldsw	[%l7 + %g4],	%o1
	fbuge	%fcc0,	loop_306
loop_305:
	movcc	%icc,	%l5,	%g7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o2,	%i1
loop_306:
	smulcc	%o5,	0x0435,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x6E, %g3
	ldstuba	[%l7 + %g3] 0x80,	%i5
	nop
	fitod	%f4,	%f28
	fdtoi	%f28,	%f31
	movne	%xcc,	%i3,	%i2
	tne	%xcc,	0x2
	tl	%xcc,	0x2
	fzero	%f18
	and	%o7,	%i4,	%l3
	mova	%icc,	%l4,	%g4
	fsrc2s	%f14,	%f9
	movle	%icc,	%l2,	%i0
	tge	%icc,	0x4
	movrlz	%g2,	0x2A7,	%g3
	ldd	[%l7 + 0x48],	%g4
	bl,pt	%icc,	loop_307
	prefetch	[%l7 + 0x70],	 0x0
	movrgez	%o4,	%l6,	%l1
	addc	%l0,	0x1BFD,	%g6
loop_307:
	fmovsg	%icc,	%f2,	%f24
	subcc	%o6,	%o0,	%i7
	nop
	setx	0xCC3A16AA292DFAE9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x84DCE254420444BC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f16,	%f24
	umulcc	%i6,	%o1,	%l5
	fbue	%fcc3,	loop_308
	nop
	fitos	%f9,	%f5
	fstod	%f5,	%f0
	movrne	%o3,	0x081,	%o2
	fnors	%f16,	%f0,	%f0
loop_308:
	addc	%g7,	0x1193,	%o5
	bpos	%xcc,	loop_309
	fblg,a	%fcc0,	loop_310
	edge16n	%g1,	%i5,	%i1
	orcc	%i3,	0x0E38,	%o7
loop_309:
	fmovs	%f28,	%f24
loop_310:
	ldd	[%l7 + 0x30],	%i2
	nop
	setx	0xB3E2C843,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x412F0862,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f10,	%f18
	fmul8x16au	%f10,	%f31,	%f12
	tl	%icc,	0x2
	smulcc	%l3,	%i4,	%g4
	bcs,a,pn	%xcc,	loop_311
	tleu	%xcc,	0x7
	fmovsne	%xcc,	%f8,	%f18
	move	%icc,	%l4,	%l2
loop_311:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc2,	loop_312
	fxnor	%f24,	%f16,	%f0
	movneg	%icc,	%i0,	%g3
	tne	%xcc,	0x5
loop_312:
	fba	%fcc1,	loop_313
	ldsb	[%l7 + 0x5E],	%g5
	fbug	%fcc0,	loop_314
	nop
	fitos	%f4,	%f18
	fstox	%f18,	%f24
loop_313:
	te	%xcc,	0x5
	mulx	%g2,	%l6,	%l1
loop_314:
	fzero	%f8
	sra	%o4,	0x09,	%g6
	mulx	%o6,	0x08D6,	%o0
	edge8l	%l0,	%i7,	%o1
	xnorcc	%l5,	%o3,	%i6
	fnegs	%f10,	%f17
	tcc	%icc,	0x7
	bcs,a	%icc,	loop_315
	xorcc	%o2,	%g7,	%g1
	wr	%g0,	0xea,	%asi
	stha	%o5,	[%l7 + 0x2A] %asi
	membar	#Sync
loop_315:
	fbn,a	%fcc1,	loop_316
	nop
	fitod	%f4,	%f18
	fdtos	%f18,	%f1
	bgu	%xcc,	loop_317
	fpmerge	%f10,	%f20,	%f8
loop_316:
	sub	%i5,	0x1926,	%i1
	fmovdcc	%xcc,	%f23,	%f31
loop_317:
	movle	%icc,	%i3,	%i2
	fbe,a	%fcc3,	loop_318
	nop
	setx loop_319, %l0, %l1
	jmpl %l1, %l3
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f26
	movrne	%o7,	0x3C4,	%g4
loop_318:
	ble,a	loop_320
loop_319:
	fmuld8ulx16	%f28,	%f5,	%f2
	sub	%l4,	0x0390,	%i4
	stx	%i0,	[%l7 + 0x68]
loop_320:
	tvs	%xcc,	0x2
	subc	%g3,	%g5,	%l2
	edge32ln	%l6,	%l1,	%g2
	movpos	%xcc,	%o4,	%g6
	tl	%icc,	0x5
	fmovsvc	%xcc,	%f19,	%f20
	tne	%icc,	0x3
	array16	%o0,	%o6,	%i7
	bvc,a,pt	%xcc,	loop_321
	fmovdpos	%icc,	%f31,	%f0
	ldstub	[%l7 + 0x64],	%o1
	orcc	%l0,	0x1927,	%l5
loop_321:
	fmovrsne	%i6,	%f17,	%f14
	subc	%o2,	%g7,	%g1
	nop
	setx	0xF3E1E8EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x382ECABD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f6,	%f18
	fmovrse	%o5,	%f13,	%f27
	edge8l	%i5,	%o3,	%i1
	nop
	fitod	%f10,	%f0
	fdtoi	%f0,	%f18
	add	%i2,	%l3,	%o7
	smulcc	%i3,	0x06F1,	%l4
	ld	[%l7 + 0x34],	%f15
	fmovrde	%g4,	%f20,	%f22
	ldsb	[%l7 + 0x37],	%i4
	edge16n	%i0,	%g3,	%g5
	srl	%l2,	%l6,	%g2
	fpadd32s	%f25,	%f2,	%f3
	set	0x55, %o2
	ldstuba	[%l7 + %o2] 0x04,	%o4
	movrlez	%l1,	%g6,	%o6
	tleu	%icc,	0x4
	nop
	setx loop_322, %l0, %l1
	jmpl %l1, %i7
	bleu,a	%icc,	loop_323
	ldd	[%l7 + 0x58],	%f22
	edge16l	%o0,	%l0,	%o1
loop_322:
	stb	%l5,	[%l7 + 0x35]
loop_323:
	fone	%f18
	tvs	%xcc,	0x7
	tcc	%icc,	0x5
	movpos	%icc,	%i6,	%o2
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f18
	fxtod	%f18,	%f18
	udiv	%g7,	0x1BA9,	%g1
	ldstub	[%l7 + 0x47],	%i5
	fpackfix	%f14,	%f26
	addcc	%o3,	0x1858,	%o5
	tle	%xcc,	0x1
	mulx	%i2,	0x05DD,	%l3
	ba,a,pn	%icc,	loop_324
	smulcc	%o7,	%i3,	%l4
	fbn,a	%fcc1,	loop_325
	tvc	%xcc,	0x7
loop_324:
	or	%g4,	0x13CA,	%i4
	movrgz	%i0,	%i1,	%g3
loop_325:
	fbg	%fcc1,	loop_326
	te	%icc,	0x3
	orncc	%g5,	0x101B,	%l2
	fbn,a	%fcc2,	loop_327
loop_326:
	nop
	setx	0x3E7E4086,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x43212C70,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f9,	%f18
	tgu	%xcc,	0x5
	movvc	%icc,	%l6,	%g2
loop_327:
	brlez,a	%l1,	loop_328
	smulcc	%o4,	%o6,	%g6
	orncc	%i7,	0x0148,	%o0
	fmovsneg	%icc,	%f31,	%f0
loop_328:
	fxnor	%f6,	%f14,	%f30
	fbug	%fcc3,	loop_329
	movn	%xcc,	%l0,	%o1
	brz,a	%l5,	loop_330
	fbge	%fcc0,	loop_331
loop_329:
	bcc	%xcc,	loop_332
	movpos	%xcc,	%i6,	%o2
loop_330:
	addc	%g7,	0x1326,	%g1
loop_331:
	stw	%i5,	[%l7 + 0x24]
loop_332:
	xor	%o5,	0x075B,	%o3
	fsrc1s	%f27,	%f29
	fmovdgu	%icc,	%f23,	%f6
	edge16l	%i2,	%l3,	%i3
	xnorcc	%l4,	%o7,	%i4
	orcc	%i0,	%g4,	%i1
	nop
	fitos	%f25,	%f26
	movneg	%icc,	%g5,	%l2
	tvc	%icc,	0x7
	wr	%g0,	0x80,	%asi
	stba	%l6,	[%l7 + 0x13] %asi
	xnorcc	%g2,	0x1007,	%l1
	move	%xcc,	%o4,	%g3
	fmovrslz	%g6,	%f26,	%f1
	fmovdpos	%xcc,	%f8,	%f15
	fmovrsgez	%o6,	%f16,	%f6
	fzero	%f6
	subc	%o0,	0x0F23,	%l0
	fmul8x16al	%f10,	%f3,	%f2
	taddcc	%i7,	%o1,	%i6
	movne	%icc,	%l5,	%o2
	fxors	%f3,	%f26,	%f14
	xorcc	%g7,	0x1369,	%g1
	fmovd	%f28,	%f26
	movrlz	%i5,	%o5,	%i2
	fmovsleu	%xcc,	%f7,	%f4
	edge8ln	%o3,	%i3,	%l3
	tne	%xcc,	0x3
	sdivcc	%l4,	0x1E06,	%i4
	tl	%xcc,	0x1
	std	%f22,	[%l7 + 0x40]
	andncc	%i0,	%g4,	%i1
	fbe	%fcc2,	loop_333
	fbul	%fcc2,	loop_334
	udivcc	%o7,	0x136C,	%l2
	umul	%g5,	0x0F48,	%g2
loop_333:
	nop
	setx	0x1FAF203C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x98C4D20B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f29,	%f17
loop_334:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l6
	mova	%icc,	%l1,	%g3
	edge32n	%o4,	%o6,	%g6
	sir	0x1637
	subc	%l0,	%i7,	%o1
	fnot2	%f14,	%f30
	orncc	%i6,	0x16BF,	%o0
	nop
	setx	0xE39E2308CEEF4DCD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x7F77673A488DB58C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f22,	%f22
	nop
	setx	0x57CD6446,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x1D704D44,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f13,	%f17
	srlx	%o2,	%l5,	%g7
	edge32n	%g1,	%o5,	%i2
	umulcc	%i5,	0x071A,	%i3
	andn	%l3,	0x04D7,	%l4
	tle	%icc,	0x2
	edge32	%o3,	%i0,	%g4
	fbg,a	%fcc2,	loop_335
	nop
	setx	loop_336,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%i1,	%i4,	%l2
	movvs	%xcc,	%g5,	%o7
loop_335:
	orcc	%l6,	%l1,	%g3
loop_336:
	tcc	%icc,	0x5
	edge8n	%g2,	%o4,	%o6
	ldsb	[%l7 + 0x52],	%g6
	brgez	%i7,	loop_337
	srl	%o1,	%i6,	%l0
	tgu	%icc,	0x0
	fnot2	%f28,	%f22
loop_337:
	nop
	setx	0x4D0624F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f11
	fbn,a	%fcc1,	loop_338
	tpos	%icc,	0x7
	for	%f2,	%f12,	%f14
	fmovrdlez	%o2,	%f26,	%f4
loop_338:
	tn	%xcc,	0x1
	movne	%xcc,	%l5,	%o0
	be	loop_339
	fmuld8sux16	%f11,	%f18,	%f4
	fmovspos	%icc,	%f23,	%f30
	ldsh	[%l7 + 0x46],	%g7
loop_339:
	stw	%o5,	[%l7 + 0x58]
	movleu	%icc,	%i2,	%g1
	sth	%i3,	[%l7 + 0x44]
	smul	%l3,	0x0FDF,	%l4
	fbne	%fcc3,	loop_340
	addcc	%o3,	0x1465,	%i5
	movle	%icc,	%i0,	%g4
	tn	%xcc,	0x2
loop_340:
	nop
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x80
	edge16n	%i4,	%l2,	%i1
	fcmpgt16	%f8,	%f18,	%o7
	edge16n	%g5,	%l6,	%l1
	edge8n	%g3,	%o4,	%g2
	fmovspos	%xcc,	%f31,	%f31
	fpackfix	%f26,	%f1
	alignaddr	%g6,	%o6,	%i7
	set	0x78, %i4
	stxa	%o1,	[%l7 + %i4] 0x22
	membar	#Sync
	or	%i6,	0x0142,	%l0
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x338] %asi,	%l5 ripped by fixASI40.pl ripped by fixASI40.pl
	andn	%o2,	%o0,	%o5
	orncc	%i2,	%g7,	%g1
	mulx	%l3,	0x1538,	%l4
	fsrc1s	%f24,	%f28
	movle	%xcc,	%o3,	%i3
	fmovrsgz	%i0,	%f27,	%f0
	movne	%xcc,	%i5,	%i4
	udivx	%g4,	0x15F8,	%l2
	nop
	setx	0xCE94AD16DC43E81B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4BEEA3DC6FEC1FEC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f2,	%f6
	membar	0x7A
	fmovrdne	%i1,	%f20,	%f6
	tg	%xcc,	0x5
	edge32n	%o7,	%g5,	%l1
	set	0x2C, %i7
	lda	[%l7 + %i7] 0x89,	%f20
	tn	%icc,	0x7
	popc	%l6,	%o4
	brgz,a	%g3,	loop_341
	nop
	setx	0xDC0195E3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x16D0C02F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f3,	%f8
	orncc	%g6,	%o6,	%g2
	nop
	fitod	%f15,	%f16
loop_341:
	tsubcctv	%o1,	0x1693,	%i6
	fmovde	%icc,	%f21,	%f4
	xor	%l0,	0x1F6C,	%l5
	bl,a,pn	%xcc,	loop_342
	tneg	%icc,	0x3
	st	%f9,	[%l7 + 0x2C]
	fpadd32s	%f13,	%f16,	%f1
loop_342:
	nop
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i7
	ldx	[%l7 + 0x68],	%o2
	fabsd	%f18,	%f10
	fsrc2s	%f23,	%f10
	tsubcctv	%o5,	%i2,	%g7
	xor	%g1,	%o0,	%l3
	orncc	%l4,	%o3,	%i3
	fba,a	%fcc1,	loop_343
	andncc	%i5,	%i0,	%g4
	nop
	fitod	%f12,	%f24
	fdtox	%f24,	%f2
	lduw	[%l7 + 0x1C],	%i4
loop_343:
	tcc	%xcc,	0x7
	fnegs	%f8,	%f8
	tcs	%xcc,	0x1
	fba	%fcc2,	loop_344
	array32	%i1,	%o7,	%g5
	set	0x7F, %l1
	ldstuba	[%l7 + %l1] 0x19,	%l1
loop_344:
	nop
	setx	loop_345,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnor	%l2,	0x0CF6,	%o4
	fnot2s	%f8,	%f5
	srlx	%l6,	0x13,	%g3
loop_345:
	nop
	fitod	%f4,	%f30
	fdtox	%f30,	%f30
	tl	%icc,	0x6
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x08] %asi,	%g6
	fcmpgt16	%f20,	%f8,	%g2
	movleu	%icc,	%o1,	%i6
	fmovdn	%icc,	%f15,	%f13
	ldd	[%l7 + 0x28],	%f24
	movl	%xcc,	%o6,	%l5
	nop
	fitod	%f8,	%f6
	fdtos	%f6,	%f13
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l0
	stb	%i7,	[%l7 + 0x56]
	tcc	%icc,	0x6
	andncc	%o2,	%i2,	%g7
	array32	%o5,	%o0,	%l3
	mulx	%g1,	0x04D7,	%o3
	popc	%i3,	%i5
	sdivcc	%i0,	0x193B,	%l4
	fbne,a	%fcc1,	loop_346
	fbe,a	%fcc1,	loop_347
	andn	%g4,	0x1339,	%i1
	sdivcc	%i4,	0x1A0D,	%g5
loop_346:
	fmovrdgz	%l1,	%f28,	%f14
loop_347:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l2,	%o7
	movgu	%xcc,	%l6,	%g3
	tleu	%icc,	0x0
	fones	%f17
	fbug,a	%fcc2,	loop_348
	movneg	%xcc,	%g6,	%g2
	nop
	setx	0x6503403C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f23
	nop
	set	0x3C, %g1
	lduw	[%l7 + %g1],	%o1
loop_348:
	movl	%icc,	%o4,	%o6
	andncc	%i6,	%l0,	%l5
	set	0x62, %g6
	stba	%i7,	[%l7 + %g6] 0x14
	edge32ln	%o2,	%i2,	%g7
	mulscc	%o0,	%l3,	%o5
	nop
	setx	loop_349,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	prefetch	[%l7 + 0x54],	 0x2
	lduh	[%l7 + 0x3E],	%o3
	edge16ln	%i3,	%g1,	%i5
loop_349:
	alignaddr	%i0,	%g4,	%l4
	tge	%icc,	0x2
	tvc	%icc,	0x5
	udivcc	%i4,	0x060E,	%i1
	tle	%xcc,	0x7
	edge16ln	%g5,	%l1,	%o7
	alignaddr	%l2,	%g3,	%g6
	udivcc	%l6,	0x0A45,	%o1
	fmovrdne	%o4,	%f8,	%f4
	nop
	set	0x3B, %i5
	ldstub	[%l7 + %i5],	%o6
	ldd	[%l7 + 0x78],	%g2
	movcc	%icc,	%i6,	%l0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%i7
	movgu	%icc,	%o2,	%i2
	edge16	%g7,	%l5,	%l3
	edge32l	%o5,	%o0,	%o3
	edge32	%g1,	%i5,	%i3
	be	%xcc,	loop_350
	tge	%icc,	0x0
	fpsub32	%f28,	%f4,	%f8
	te	%icc,	0x6
loop_350:
	tpos	%icc,	0x6
	movne	%xcc,	%i0,	%g4
	taddcctv	%l4,	%i4,	%g5
	mulx	%l1,	%i1,	%o7
	for	%f10,	%f30,	%f22
	fnot1s	%f5,	%f11
	taddcc	%l2,	0x12EF,	%g6
	fbge,a	%fcc0,	loop_351
	sllx	%g3,	0x0A,	%l6
	movrlz	%o4,	0x270,	%o6
	movl	%xcc,	%o1,	%i6
loop_351:
	movrne	%g2,	0x270,	%l0
	ta	%icc,	0x3
	edge16l	%o2,	%i7,	%i2
	swap	[%l7 + 0x34],	%g7
	set	0x1D, %i0
	stba	%l5,	[%l7 + %i0] 0x27
	membar	#Sync
	fnegs	%f27,	%f14
	move	%xcc,	%o5,	%o0
	fmuld8ulx16	%f0,	%f22,	%f20
	fmovrdlez	%o3,	%f22,	%f0
	fands	%f21,	%f29,	%f2
	nop
	setx	0x0A7BFD15,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xC2C46B23,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f19,	%f31
	bvc,a	%xcc,	loop_352
	tle	%icc,	0x4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x80,	%f16
loop_352:
	sdiv	%g1,	0x1F30,	%l3
	smul	%i3,	0x0AAA,	%i5
	membar	0x66
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f8
	bg,pn	%icc,	loop_353
	tne	%icc,	0x0
	add	%i0,	0x00CE,	%l4
	bvc	loop_354
loop_353:
	brz	%g4,	loop_355
	nop
	fitod	%f8,	%f0
	fdtos	%f0,	%f17
	nop
	setx	0x53D1B6F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x3CFCEB2A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f19,	%f11
loop_354:
	tge	%xcc,	0x3
loop_355:
	fmovsvc	%icc,	%f31,	%f18
	edge16ln	%i4,	%g5,	%l1
	set	0x34, %g7
	swapa	[%l7 + %g7] 0x10,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	%icc,	loop_356
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i1,	%l2,	%g3
	fmovd	%f0,	%f10
loop_356:
	fors	%f18,	%f20,	%f22
	umul	%l6,	0x1461,	%o4
	mulx	%o6,	%g6,	%i6
	movpos	%icc,	%o1,	%l0
	udiv	%g2,	0x0D45,	%i7
	sdivx	%i2,	0x12FA,	%g7
	nop
	set	0x09, %o1
	ldub	[%l7 + %o1],	%o2
	fmovdge	%icc,	%f20,	%f3
	xorcc	%o5,	0x16E2,	%l5
	smul	%o0,	%o3,	%g1
	ta	%icc,	0x0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i3
	fba	%fcc2,	loop_357
	fpadd16s	%f30,	%f23,	%f29
	set	0x16, %i3
	lduha	[%l7 + %i3] 0x14,	%l3
loop_357:
	edge16ln	%i0,	%l4,	%i5
	fmovdvc	%xcc,	%f7,	%f4
	tsubcctv	%i4,	%g5,	%l1
	fmovsl	%icc,	%f1,	%f7
	fmovsle	%xcc,	%f15,	%f14
	ldd	[%l7 + 0x58],	%o6
	udiv	%i1,	0x19A1,	%g4
	fexpand	%f1,	%f6
	brnz,a	%g3,	loop_358
	fcmpeq16	%f8,	%f28,	%l6
	sethi	0x08C1,	%o4
	tpos	%icc,	0x5
loop_358:
	nop
	setx	0x5489674C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x45E5E5A6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f25,	%f27
	set	0x76, %o6
	ldstuba	[%l7 + %o6] 0x10,	%l2
	brlz	%g6,	loop_359
	tcs	%icc,	0x5
	srl	%o6,	0x0B,	%i6
	fcmple32	%f8,	%f20,	%o1
loop_359:
	fbo,a	%fcc2,	loop_360
	lduw	[%l7 + 0x40],	%g2
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x10,	%i6
loop_360:
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f24
	fxtod	%f24,	%f6
	mulx	%l0,	0x104E,	%i2
	andncc	%o2,	%g7,	%l5
	orcc	%o5,	0x0EB5,	%o3
	sllx	%g1,	%i3,	%l3
	edge16	%i0,	%l4,	%i5
	prefetch	[%l7 + 0x5C],	 0x2
	fble,a	%fcc3,	loop_361
	and	%i4,	%o0,	%g5
	mulscc	%l1,	0x0F05,	%o7
	tvs	%xcc,	0x2
loop_361:
	fmovsvc	%xcc,	%f12,	%f22
	fsrc1	%f28,	%f24
	udivcc	%g4,	0x1991,	%g3
	bvs,a	%icc,	loop_362
	fmovsgu	%icc,	%f22,	%f5
	movrlz	%l6,	0x299,	%i1
	sub	%o4,	%l2,	%o6
loop_362:
	edge32	%i6,	%o1,	%g2
	tsubcctv	%i7,	%l0,	%g6
	tg	%icc,	0x6
	ldub	[%l7 + 0x50],	%o2
	sllx	%i2,	0x15,	%g7
	fbug	%fcc3,	loop_363
	mova	%xcc,	%o5,	%l5
	ldd	[%l7 + 0x38],	%f2
	fzeros	%f22
loop_363:
	bl,pt	%icc,	loop_364
	udivcc	%o3,	0x168A,	%i3
	xnor	%g1,	%l3,	%i0
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x66] %asi,	%l4
loop_364:
	sllx	%i5,	0x01,	%o0
	brlz	%g5,	loop_365
	fmovdvc	%icc,	%f21,	%f27
	fmovse	%icc,	%f28,	%f29
	nop
	setx	0x8DAF33BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xE796FC94,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f31,	%f23
loop_365:
	fmovdcc	%icc,	%f18,	%f23
	stw	%i4,	[%l7 + 0x5C]
	sir	0x07E1
	fsrc2s	%f27,	%f4
	orncc	%o7,	0x0A3E,	%l1
	tle	%xcc,	0x4
	sdivcc	%g3,	0x0D76,	%l6
	smul	%i1,	0x0A7B,	%g4
	movpos	%icc,	%l2,	%o4
	fabss	%f26,	%f1
	brz,a	%o6,	loop_366
	xnorcc	%i6,	0x0CE3,	%g2
	fornot1s	%f31,	%f25,	%f9
	edge32l	%i7,	%o1,	%l0
loop_366:
	umulcc	%o2,	%i2,	%g6
	sra	%g7,	0x19,	%o5
	fpack32	%f26,	%f0,	%f20
	nop
	setx loop_367, %l0, %l1
	jmpl %l1, %l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f3,	%f22
	tle	%icc,	0x5
loop_367:
	edge8n	%o3,	%g1,	%i3
	add	%l3,	%i0,	%l4
	fmuld8sux16	%f21,	%f4,	%f6
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x81,	%f16
	sub	%o0,	%i5,	%i4
	xorcc	%g5,	%l1,	%o7
	bleu,a	loop_368
	taddcc	%g3,	%l6,	%i1
	mulscc	%l2,	0x19D4,	%g4
	fbug	%fcc3,	loop_369
loop_368:
	fpadd32s	%f19,	%f2,	%f9
	edge32	%o6,	%o4,	%i6
	xnorcc	%i7,	0x04CF,	%o1
loop_369:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l0
	sth	%g2,	[%l7 + 0x52]
	tle	%xcc,	0x6
	for	%f0,	%f4,	%f14
	sdivcc	%o2,	0x08B9,	%g6
	fmovsleu	%icc,	%f31,	%f24
	mova	%icc,	%g7,	%i2
	movg	%xcc,	%o5,	%o3
	orcc	%g1,	0x0A33,	%i3
	edge8n	%l3,	%l5,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o0,	%i0
	fornot2	%f4,	%f2,	%f22
	tpos	%xcc,	0x3
	fmul8x16al	%f13,	%f24,	%f2
	umulcc	%i4,	0x1BFB,	%i5
	brlez	%g5,	loop_370
	movrlez	%o7,	%g3,	%l1
	fba,a	%fcc0,	loop_371
	bshuffle	%f26,	%f14,	%f0
loop_370:
	udivx	%l6,	0x04F4,	%l2
	movneg	%xcc,	%i1,	%o6
loop_371:
	fzero	%f16
	fpack16	%f30,	%f19
	fmovspos	%xcc,	%f14,	%f10
	movle	%icc,	%g4,	%o4
	nop
	fitod	%f12,	%f20
	fdtoi	%f20,	%f10
	andcc	%i7,	0x0453,	%o1
	set	0x62, %i2
	ldsha	[%l7 + %i2] 0x18,	%l0
	andncc	%g2,	%i6,	%o2
	nop
	fitos	%f9,	%f1
	fstox	%f1,	%f8
	fxtos	%f8,	%f25
	tl	%xcc,	0x2
	edge32n	%g7,	%g6,	%o5
	orncc	%o3,	0x1F1A,	%i2
	fandnot2s	%f4,	%f26,	%f12
	tgu	%xcc,	0x3
	movleu	%xcc,	%g1,	%i3
	and	%l3,	%l4,	%o0
	movn	%xcc,	%l5,	%i0
	tle	%xcc,	0x1
	edge32	%i5,	%i4,	%g5
	fabss	%f0,	%f15
	brgz,a	%o7,	loop_372
	movrlz	%g3,	0x083,	%l1
	edge8n	%l2,	%l6,	%i1
	fnors	%f5,	%f6,	%f14
loop_372:
	fornot2	%f30,	%f6,	%f12
	edge16ln	%o6,	%g4,	%o4
	ble,a	loop_373
	nop
	fitos	%f3,	%f9
	fstox	%f9,	%f2
	fxtos	%f2,	%f14
	tcs	%icc,	0x4
	movn	%xcc,	%i7,	%o1
loop_373:
	smul	%g2,	0x15F9,	%i6
	taddcctv	%o2,	%g7,	%g6
	xnorcc	%l0,	0x0D43,	%o5
	pdist	%f8,	%f22,	%f14
	fmovsa	%icc,	%f5,	%f7
	udiv	%o3,	0x03D8,	%g1
	tcc	%xcc,	0x1
	fmovsge	%icc,	%f31,	%f3
	bleu,a,pt	%xcc,	loop_374
	stbar
	sll	%i2,	%i3,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_374:
	tle	%xcc,	0x1
	membar	0x3E
	nop
	setx	0xD6DB1BF4446351A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x10BE20A94E2805DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f14,	%f18
	movrne	%o0,	0x034,	%l4
	fornot2s	%f25,	%f18,	%f7
	and	%l5,	%i0,	%i5
	fbu	%fcc0,	loop_375
	fmovsvs	%xcc,	%f26,	%f30
	bcs	%xcc,	loop_376
	fmovrslez	%i4,	%f10,	%f16
loop_375:
	mulscc	%g5,	0x1F36,	%o7
	ldub	[%l7 + 0x5E],	%l1
loop_376:
	subcc	%l2,	0x1F67,	%l6
	ldstub	[%l7 + 0x46],	%i1
	smul	%o6,	0x0B7E,	%g4
	ta	%xcc,	0x6
	taddcctv	%o4,	%g3,	%i7
	set	0x58, %l2
	prefetcha	[%l7 + %l2] 0x10,	 0x0
	move	%xcc,	%i6,	%o2
	mulx	%g2,	%g6,	%l0
	movgu	%icc,	%o5,	%g7
	orcc	%g1,	0x13F8,	%o3
	udivx	%i2,	0x15AB,	%l3
	edge8l	%o0,	%i3,	%l4
	popc	0x0313,	%i0
	brlz	%i5,	loop_377
	movleu	%icc,	%i4,	%g5
	stb	%l5,	[%l7 + 0x22]
	sub	%o7,	%l2,	%l1
loop_377:
	nop
	set	0x0A, %l5
	lduba	[%l7 + %l5] 0x88,	%l6
	fbug,a	%fcc0,	loop_378
	edge8ln	%i1,	%o6,	%o4
	bcs	%icc,	loop_379
	subcc	%g3,	0x09A4,	%g4
loop_378:
	movleu	%icc,	%o1,	%i6
	edge16	%i7,	%o2,	%g2
loop_379:
	smul	%l0,	0x1CC5,	%o5
	bl,a,pn	%icc,	loop_380
	fbug,a	%fcc0,	loop_381
	sub	%g7,	0x0C8A,	%g1
	for	%f2,	%f20,	%f30
loop_380:
	alignaddr	%o3,	%g6,	%i2
loop_381:
	tcs	%xcc,	0x0
	alignaddr	%l3,	%o0,	%l4
	edge16n	%i3,	%i0,	%i5
	fbuge	%fcc2,	loop_382
	mulscc	%i4,	0x16A8,	%g5
	tvc	%icc,	0x4
	fpmerge	%f8,	%f6,	%f6
loop_382:
	bshuffle	%f22,	%f6,	%f10
	st	%f10,	[%l7 + 0x1C]
	movpos	%icc,	%o7,	%l5
	fbu,a	%fcc2,	loop_383
	fbl	%fcc0,	loop_384
	umulcc	%l1,	%l6,	%i1
	mulscc	%l2,	0x1FF9,	%o6
loop_383:
	sdivcc	%g3,	0x01C0,	%g4
loop_384:
	edge8ln	%o4,	%i6,	%i7
	tne	%xcc,	0x6
	edge32l	%o2,	%g2,	%l0
	srl	%o1,	%o5,	%g1
	nop
	set	0x7D, %i1
	stb	%o3,	[%l7 + %i1]
	movne	%xcc,	%g6,	%i2
	sdivcc	%g7,	0x1860,	%o0
	alignaddrl	%l4,	%l3,	%i3
	alignaddrl	%i5,	%i0,	%i4
	orn	%g5,	0x0683,	%o7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x70] %asi,	%l5
	brnz,a	%l1,	loop_385
	std	%f30,	[%l7 + 0x70]
	ldd	[%l7 + 0x50],	%f14
	ta	%icc,	0x2
loop_385:
	udivcc	%l6,	0x1A9F,	%l2
	fmovdgu	%icc,	%f27,	%f11
	xorcc	%i1,	%g3,	%g4
	fbg,a	%fcc2,	loop_386
	fcmpne16	%f20,	%f22,	%o4
	fornot2	%f26,	%f16,	%f22
	edge16ln	%o6,	%i6,	%i7
loop_386:
	srax	%g2,	%l0,	%o1
	tn	%xcc,	0x3
	fbge	%fcc1,	loop_387
	and	%o5,	0x0393,	%g1
	bcc	%xcc,	loop_388
	fmul8sux16	%f16,	%f22,	%f20
loop_387:
	bshuffle	%f26,	%f16,	%f26
	umul	%o3,	%o2,	%g6
loop_388:
	tleu	%xcc,	0x7
	membar	0x5B
	umulcc	%g7,	%o0,	%l4
	movrlz	%l3,	0x2EC,	%i2
	subc	%i5,	0x04AB,	%i0
	mulx	%i3,	%i4,	%g5
	fandnot1s	%f25,	%f6,	%f4
	fmovrslz	%o7,	%f12,	%f11
	brgz	%l1,	loop_389
	tneg	%xcc,	0x5
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x0c
loop_389:
	edge8n	%l5,	%l2,	%i1
	array8	%g3,	%l6,	%o4
	set	0x4E, %l3
	lduba	[%l7 + %l3] 0x0c,	%o6
	fmul8x16	%f25,	%f12,	%f22
	orn	%i6,	0x0565,	%g4
	sethi	0x08D7,	%i7
	subccc	%l0,	0x17EE,	%o1
	fsrc1	%f16,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g2,	%o5,	%g1
	fbuge	%fcc0,	loop_390
	orncc	%o3,	%o2,	%g7
	membar	0x6D
	movvs	%icc,	%o0,	%l4
loop_390:
	fmovsleu	%xcc,	%f26,	%f3
	alignaddrl	%l3,	%g6,	%i5
	fmovda	%xcc,	%f25,	%f6
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f22
	fxtod	%f22,	%f26
	umul	%i0,	%i2,	%i4
	movneg	%xcc,	%i3,	%g5
	movl	%icc,	%o7,	%l1
	fmul8x16au	%f23,	%f13,	%f28
	fcmpgt16	%f22,	%f26,	%l5
	edge16ln	%i1,	%l2,	%l6
	bgu,a	%icc,	loop_391
	fmovdl	%xcc,	%f2,	%f24
	movgu	%icc,	%g3,	%o6
	movn	%xcc,	%i6,	%g4
loop_391:
	edge16l	%o4,	%i7,	%l0
	ld	[%l7 + 0x30],	%f28
	orn	%o1,	%g2,	%o5
	fmovd	%f12,	%f6
	orn	%o3,	%g1,	%g7
	ldsb	[%l7 + 0x64],	%o0
	tn	%xcc,	0x4
	fmovsneg	%xcc,	%f15,	%f6
	tgu	%xcc,	0x3
	fmovsvs	%xcc,	%f27,	%f21
	xnorcc	%l4,	%l3,	%o2
	fsrc1s	%f16,	%f19
	movn	%icc,	%i5,	%g6
	nop
	setx	0x6CAFD86D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xC8E59EA3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f28,	%f0
	popc	%i2,	%i0
	tcc	%icc,	0x0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x1A] %asi,	%i3
	tl	%xcc,	0x2
	tvc	%xcc,	0x5
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x89,	%i4
	te	%xcc,	0x2
	bn,pt	%icc,	loop_392
	fba	%fcc2,	loop_393
	tsubcctv	%o7,	%l1,	%g5
	subccc	%l5,	%l2,	%i1
loop_392:
	movne	%icc,	%g3,	%o6
loop_393:
	add	%i6,	0x1023,	%g4
	wr	%g0,	0x89,	%asi
	sta	%f18,	[%l7 + 0x34] %asi
	fmovsneg	%icc,	%f16,	%f2
	movg	%xcc,	%o4,	%i7
	tgu	%icc,	0x0
	fmul8sux16	%f18,	%f2,	%f10
	fmovscc	%xcc,	%f15,	%f8
	nop
	setx	loop_394,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subc	%l0,	%o1,	%l6
	bne	%icc,	loop_395
	array32	%g2,	%o5,	%o3
loop_394:
	fmovsneg	%xcc,	%f5,	%f0
	andn	%g7,	0x01E1,	%o0
loop_395:
	std	%f18,	[%l7 + 0x20]
	movgu	%icc,	%g1,	%l3
	nop
	setx	0x2996011E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x20A60C08,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f28,	%f11
	fmovsvc	%icc,	%f6,	%f13
	subccc	%o2,	0x0F7C,	%i5
	smulcc	%l4,	0x0EF7,	%g6
	edge16l	%i0,	%i3,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i2,	%l1,	%g5
	orn	%l5,	%o7,	%l2
	lduh	[%l7 + 0x32],	%i1
	nop
	setx	0xC0612CC2,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	fands	%f12,	%f11,	%f18
	tl	%xcc,	0x0
	fmovsneg	%icc,	%f21,	%f26
	bge,a	loop_396
	nop
	setx	loop_397,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot1	%f16,	%f4,	%f8
	fmovs	%f4,	%f26
loop_396:
	movrgz	%g3,	0x28D,	%i6
loop_397:
	sdivcc	%g4,	0x1029,	%o6
	andn	%i7,	%l0,	%o1
	movle	%icc,	%o4,	%g2
	bshuffle	%f28,	%f14,	%f2
	tcs	%icc,	0x1
	movn	%xcc,	%o5,	%l6
	fandnot1s	%f9,	%f1,	%f7
	sdivx	%g7,	0x1197,	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x11,	%o0,	%g1
	fbl,a	%fcc1,	loop_398
	brlz,a	%o2,	loop_399
	bl,a,pt	%xcc,	loop_400
	fbge	%fcc0,	loop_401
loop_398:
	stbar
loop_399:
	tl	%icc,	0x4
loop_400:
	fmovrdlz	%i5,	%f2,	%f28
loop_401:
	tvc	%icc,	0x2
	fbne	%fcc0,	loop_402
	bvc,a,pt	%xcc,	loop_403
	nop
	set	0x20, %o7
	ldx	[%l7 + %o7],	%l4
	tgu	%icc,	0x6
loop_402:
	fcmpeq16	%f18,	%f22,	%g6
loop_403:
	nop
	setx loop_404, %l0, %l1
	jmpl %l1, %i0
	bleu,a,pn	%icc,	loop_405
	udiv	%l3,	0x09A2,	%i4
	addc	%i3,	0x1349,	%i2
loop_404:
	movrlz	%g5,	0x134,	%l1
loop_405:
	fzero	%f28
	udiv	%o7,	0x100D,	%l2
	edge8n	%l5,	%g3,	%i1
	fcmpeq16	%f4,	%f26,	%g4
	brgez,a	%o6,	loop_406
	fmovrdne	%i7,	%f6,	%f20
	addcc	%l0,	0x0F57,	%i6
	taddcc	%o1,	%g2,	%o4
loop_406:
	edge8n	%l6,	%o5,	%o3
	ldsb	[%l7 + 0x33],	%o0
	tsubcc	%g1,	%o2,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x3
	xnor	%l4,	0x04DF,	%g6
	edge32	%i0,	%g7,	%i4
	fbug	%fcc3,	loop_407
	edge32n	%i3,	%i2,	%g5
	tcs	%xcc,	0x2
	edge32n	%l1,	%o7,	%l2
loop_407:
	fmovrsgz	%l3,	%f15,	%f14
	membar	0x06
	fmovrslez	%l5,	%f6,	%f20
	fmovrde	%i1,	%f28,	%f28
	set	0x2C, %g2
	lda	[%l7 + %g2] 0x0c,	%f7
	fornot1s	%f22,	%f0,	%f6
	fmovrslez	%g3,	%f2,	%f25
	fmovdle	%xcc,	%f24,	%f25
	fmovdcc	%xcc,	%f8,	%f11
	taddcc	%g4,	%i7,	%l0
	sethi	0x1BD8,	%o6
	edge8	%o1,	%i6,	%o4
	subc	%l6,	0x0FCE,	%g2
	sir	0x04BC
	edge8ln	%o3,	%o5,	%g1
	add	%o0,	0x0620,	%i5
	andcc	%l4,	%o2,	%g6
	umulcc	%g7,	0x0AF1,	%i4
	fbule,a	%fcc0,	loop_408
	fxnors	%f26,	%f17,	%f29
	set	0x1C, %o4
	ldstuba	[%l7 + %o4] 0x04,	%i0
loop_408:
	bneg,pt	%icc,	loop_409
	andcc	%i3,	0x1181,	%g5
	fbo	%fcc3,	loop_410
	edge32n	%i2,	%l1,	%o7
loop_409:
	ble,a,pn	%xcc,	loop_411
	movg	%icc,	%l3,	%l5
loop_410:
	ldsh	[%l7 + 0x4C],	%l2
	fmovrsgez	%g3,	%f13,	%f4
loop_411:
	fbug	%fcc2,	loop_412
	fandnot1s	%f21,	%f9,	%f19
	tl	%xcc,	0x6
	fpadd32s	%f12,	%f20,	%f27
loop_412:
	ta	%xcc,	0x3
	add	%i1,	%g4,	%i7
	bne,a	%icc,	loop_413
	sllx	%l0,	0x06,	%o1
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x0c,	%f16
loop_413:
	fmovrdlez	%i6,	%f30,	%f8
	movn	%icc,	%o4,	%o6
	movrlez	%g2,	0x160,	%o3
	ldd	[%l7 + 0x70],	%i6
	sdivx	%o5,	0x1EB5,	%g1
	tcc	%icc,	0x4
	fmovrsgez	%o0,	%f29,	%f26
	smulcc	%i5,	0x050E,	%o2
	fmovsneg	%icc,	%f14,	%f21
	edge8l	%l4,	%g6,	%i4
	tne	%icc,	0x0
	fnot2	%f24,	%f8
	bl	loop_414
	array16	%g7,	%i3,	%i0
	brz	%i2,	loop_415
	stx	%l1,	[%l7 + 0x58]
loop_414:
	smulcc	%o7,	0x07D2,	%g5
	andncc	%l5,	%l3,	%g3
loop_415:
	alignaddrl	%l2,	%i1,	%i7
	fmovdcs	%icc,	%f8,	%f20
	array8	%l0,	%g4,	%o1
	bl,a,pn	%xcc,	loop_416
	alignaddrl	%i6,	%o6,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a,pt	%icc,	loop_417
loop_416:
	nop
	setx loop_418, %l0, %l1
	jmpl %l1, %o4
	edge8l	%o3,	%o5,	%l6
	sdivx	%o0,	0x0D40,	%i5
loop_417:
	sllx	%o2,	0x1B,	%l4
loop_418:
	tleu	%xcc,	0x7
	fmovsa	%icc,	%f26,	%f13
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x58] %asi,	%g6
	fmovsgu	%icc,	%f13,	%f8
	tsubcc	%i4,	%g1,	%g7
	movrlez	%i0,	%i3,	%l1
	ldd	[%l7 + 0x28],	%o6
	fcmpne16	%f12,	%f8,	%i2
	smul	%l5,	0x11B5,	%g5
	fmul8ulx16	%f30,	%f8,	%f8
	tg	%xcc,	0x4
	fcmpeq32	%f4,	%f0,	%g3
	nop
	fitos	%f11,	%f7
	fstoi	%f7,	%f8
	tleu	%icc,	0x4
	xor	%l3,	%l2,	%i7
	movn	%xcc,	%l0,	%i1
	array32	%g4,	%i6,	%o6
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x39] %asi,	%o1
	srlx	%g2,	0x0C,	%o3
	tge	%xcc,	0x3
	fmovsleu	%xcc,	%f29,	%f10
	fmovs	%f7,	%f16
	brz,a	%o4,	loop_419
	edge8ln	%l6,	%o5,	%i5
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_419:
	edge16l	%o2,	%l4,	%g6
	nop
	setx	0x70D265C06921DE50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE712253A5A93FE3B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f12,	%f20
	bg,a,pt	%icc,	loop_420
	bcc,pn	%icc,	loop_421
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f24
	fxtod	%f24,	%f26
	movcc	%xcc,	%i4,	%g1
loop_420:
	tcc	%xcc,	0x2
loop_421:
	movg	%icc,	%o0,	%g7
	addcc	%i3,	0x12E2,	%l1
	fnot1	%f8,	%f20
	smul	%o7,	0x17D1,	%i0
	movg	%xcc,	%l5,	%g5
	tn	%icc,	0x0
	movcs	%xcc,	%g3,	%i2
	movvs	%icc,	%l3,	%l2
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x48] %asi,	%l0
	tleu	%icc,	0x7
	mulscc	%i7,	%g4,	%i6
	fbule,a	%fcc2,	loop_422
	ldsb	[%l7 + 0x53],	%o6
	brlz	%i1,	loop_423
	tn	%xcc,	0x6
loop_422:
	sth	%o1,	[%l7 + 0x0E]
	tge	%icc,	0x1
loop_423:
	sllx	%g2,	%o4,	%o3
	fpmerge	%f25,	%f25,	%f20
	taddcctv	%l6,	%i5,	%o5
	movcc	%xcc,	%o2,	%l4
	array16	%i4,	%g6,	%g1
	fbu,a	%fcc1,	loop_424
	mulscc	%o0,	%i3,	%g7
	xnorcc	%o7,	0x0F17,	%l1
	fbne	%fcc3,	loop_425
loop_424:
	nop
	setx	0x6052EE9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	fandnot2	%f20,	%f8,	%f6
	bl,a	loop_426
loop_425:
	std	%f0,	[%l7 + 0x68]
	movrlez	%i0,	%g5,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_426:
	fmovsgu	%xcc,	%f5,	%f22
	umul	%i2,	%g3,	%l3
	movgu	%xcc,	%l0,	%i7
	fbl	%fcc2,	loop_427
	fone	%f22
	mulscc	%g4,	0x1E99,	%l2
	movrne	%i6,	%i1,	%o6
loop_427:
	fxor	%f16,	%f6,	%f16
	fnot2s	%f30,	%f16
	addc	%o1,	%g2,	%o4
	bleu,pt	%icc,	loop_428
	nop
	setx	0x205DD6BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	fcmpne32	%f30,	%f20,	%o3
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x2
loop_428:
	tne	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc1,	loop_429
	movne	%icc,	%i5,	%o2
	tleu	%xcc,	0x3
	xnorcc	%o5,	%l4,	%g6
loop_429:
	mova	%icc,	%g1,	%i4
	bcc,a	%icc,	loop_430
	fbe	%fcc3,	loop_431
	brz	%o0,	loop_432
	bgu,a,pt	%xcc,	loop_433
loop_430:
	movrgz	%i3,	0x1F6,	%o7
loop_431:
	fmovrsgez	%g7,	%f0,	%f11
loop_432:
	taddcc	%i0,	%g5,	%l5
loop_433:
	fornot2s	%f1,	%f29,	%f11
	smul	%l1,	0x0967,	%i2
	fbug,a	%fcc0,	loop_434
	fone	%f10
	fcmpeq16	%f30,	%f24,	%g3
	fbe	%fcc1,	loop_435
loop_434:
	tle	%icc,	0x2
	bvs,a	loop_436
	fmovsneg	%icc,	%f8,	%f11
loop_435:
	brlez,a	%l0,	loop_437
	fbo	%fcc2,	loop_438
loop_436:
	bg,a,pt	%icc,	loop_439
	bleu,a	%xcc,	loop_440
loop_437:
	sth	%i7,	[%l7 + 0x08]
loop_438:
	xnor	%l3,	%l2,	%i6
loop_439:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%i1
loop_440:
	fbu,a	%fcc1,	loop_441
	fors	%f11,	%f20,	%f13
	popc	0x1DA2,	%o1
	stbar
loop_441:
	popc	%g2,	%o4
	nop
	setx	0x1076E2C1,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	array16	%o6,	%o3,	%i5
	array8	%l6,	%o2,	%o5
	movgu	%xcc,	%g6,	%g1
	fsrc1	%f24,	%f4
	umulcc	%i4,	0x0A98,	%o0
	fbuge	%fcc2,	loop_442
	movre	%i3,	%o7,	%g7
	xorcc	%l4,	0x0082,	%g5
	edge32ln	%l5,	%l1,	%i0
loop_442:
	fmovsn	%xcc,	%f26,	%f2
	smulcc	%g3,	0x05E4,	%l0
	fzero	%f12
	srax	%i7,	0x09,	%i2
	smul	%l3,	0x1BF2,	%i6
	bgu,pn	%xcc,	loop_443
	fmovspos	%xcc,	%f3,	%f4
	tcc	%xcc,	0x4
	movrgez	%l2,	%g4,	%i1
loop_443:
	popc	0x0462,	%o1
	set	0x3E, %g4
	ldstuba	[%l7 + %g4] 0x89,	%o4
	fxnors	%f9,	%f4,	%f4
	fmovsleu	%icc,	%f12,	%f20
	fnot2s	%f18,	%f9
	alignaddrl	%o6,	%g2,	%o3
	tvs	%icc,	0x6
	orncc	%l6,	%o2,	%i5
	fornot1s	%f17,	%f19,	%f7
	sethi	0x1444,	%g6
	fmovsgu	%xcc,	%f19,	%f28
	udivx	%o5,	0x0589,	%i4
	fpsub16	%f10,	%f10,	%f2
	fandnot2	%f26,	%f14,	%f6
	subccc	%g1,	0x1D5F,	%o0
	sub	%o7,	0x0905,	%g7
	fcmpeq32	%f24,	%f8,	%i3
	xor	%l4,	0x0591,	%g5
	tg	%icc,	0x4
	movvc	%icc,	%l5,	%l1
	sdivx	%i0,	0x06F4,	%g3
	bcc,a	%xcc,	loop_444
	subc	%i7,	0x1164,	%l0
	set	0x44, %g3
	swapa	[%l7 + %g3] 0x89,	%l3
loop_444:
	bvs,a	%xcc,	loop_445
	tcs	%icc,	0x3
	popc	%i2,	%l2
	mulscc	%i6,	0x00CD,	%g4
loop_445:
	edge8	%i1,	%o4,	%o1
	fmovdcs	%xcc,	%f20,	%f26
	tn	%xcc,	0x0
	orncc	%g2,	%o6,	%o3
	tsubcctv	%l6,	0x0D5E,	%o2
	movcs	%icc,	%i5,	%o5
	fmovrdne	%i4,	%f26,	%f0
	fmuld8sux16	%f17,	%f13,	%f24
	sllx	%g6,	0x12,	%g1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o0,	%o7
	te	%icc,	0x6
	movrlz	%g7,	%i3,	%g5
	fmovdneg	%xcc,	%f22,	%f31
	xnorcc	%l4,	0x000F,	%l5
	nop
	setx	0x264D43C015D1B6F9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x071203AE5B86F95C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f20,	%f24
	movrgez	%l1,	%i0,	%g3
	set	0x30, %o2
	lda	[%l7 + %o2] 0x15,	%f1
	lduw	[%l7 + 0x18],	%l0
	srax	%i7,	%i2,	%l3
	movcs	%xcc,	%i6,	%g4
	edge32n	%i1,	%o4,	%o1
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
	fnor	%f18,	%f20,	%f2
	andcc	%o6,	0x1D2E,	%l2
	xnor	%l6,	%o3,	%i5
	orn	%o2,	0x1B22,	%i4
	orncc	%o5,	0x19D0,	%g6
	addc	%o0,	0x0DA5,	%g1
	alignaddr	%o7,	%i3,	%g7
	fcmple32	%f16,	%f2,	%g5
	brnz,a	%l5,	loop_446
	edge32	%l4,	%i0,	%l1
	fandnot2	%f28,	%f30,	%f20
	orn	%g3,	%i7,	%l0
loop_446:
	tcc	%xcc,	0x7
	sra	%l3,	0x1E,	%i2
	fornot1s	%f31,	%f15,	%f8
	tl	%icc,	0x2
	tvc	%xcc,	0x1
	taddcc	%i6,	0x0BB5,	%g4
	fmovdcc	%icc,	%f1,	%f5
	bne	loop_447
	popc	%i1,	%o4
	orn	%o1,	0x008E,	%o6
	sdivx	%g2,	0x0A23,	%l2
loop_447:
	addcc	%l6,	%o3,	%o2
	fmovd	%f30,	%f30
	swap	[%l7 + 0x38],	%i5
	orcc	%o5,	0x00C4,	%g6
	array32	%i4,	%o0,	%g1
	orn	%i3,	0x1E91,	%o7
	sdivcc	%g5,	0x1AF0,	%g7
	edge8l	%l4,	%i0,	%l5
	movgu	%xcc,	%l1,	%i7
	set	0x68, %l6
	stxa	%l0,	[%l7 + %l6] 0xeb
	membar	#Sync
	tg	%icc,	0x4
	st	%f22,	[%l7 + 0x28]
	tneg	%icc,	0x7
	srlx	%l3,	%g3,	%i2
	fzero	%f10
	tge	%xcc,	0x5
	udivcc	%i6,	0x0529,	%g4
	move	%xcc,	%i1,	%o4
	ba	loop_448
	orn	%o6,	0x13AF,	%o1
	xor	%g2,	0x1CCB,	%l2
	movvs	%xcc,	%o3,	%o2
loop_448:
	fba	%fcc1,	loop_449
	smul	%i5,	0x14F2,	%l6
	move	%xcc,	%g6,	%i4
	fmovdcc	%icc,	%f11,	%f24
loop_449:
	flush	%l7 + 0x08
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f4
	fxtod	%f4,	%f22
	movle	%xcc,	%o0,	%g1
	edge16l	%i3,	%o5,	%g5
	addcc	%g7,	0x1DBC,	%o7
	fbge	%fcc3,	loop_450
	tcc	%xcc,	0x1
	movcc	%xcc,	%l4,	%i0
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x60] %asi,	%l4
loop_450:
	nop
	set	0x58, %o5
	sta	%f1,	[%l7 + %o5] 0x11
	nop
	fitos	%f14,	%f8
	fstox	%f8,	%f18
	set	0x65, %i7
	ldsba	[%l7 + %i7] 0x10,	%i7
	movl	%icc,	%l1,	%l0
	fbg	%fcc1,	loop_451
	move	%icc,	%g3,	%l3
	set	0x38, %i4
	lduha	[%l7 + %i4] 0x89,	%i6
loop_451:
	fandnot2	%f22,	%f18,	%f8
	fpadd32	%f20,	%f18,	%f10
	ble	loop_452
	bgu	%icc,	loop_453
	tcc	%xcc,	0x6
	tvs	%icc,	0x4
loop_452:
	smul	%g4,	0x14FF,	%i1
loop_453:
	fornot1	%f0,	%f30,	%f24
	stbar
	fbo	%fcc3,	loop_454
	nop
	setx	0x0734E681,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x8A8EB86A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f10,	%f14
	bshuffle	%f14,	%f12,	%f22
	fba	%fcc1,	loop_455
loop_454:
	fmul8ulx16	%f26,	%f24,	%f20
	sra	%i2,	0x1F,	%o4
	tsubcctv	%o1,	%g2,	%o6
loop_455:
	sdiv	%l2,	0x1437,	%o2
	nop
	setx	0x1AEF2DC88DFD66F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2C6E3E46DBFCD0D4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f26,	%f20
	fmuld8sux16	%f28,	%f30,	%f22
	nop
	fitod	%f4,	%f2
	fdtoi	%f2,	%f18
	orn	%i5,	0x1992,	%l6
	orncc	%g6,	0x13F7,	%o3
	fbue	%fcc3,	loop_456
	fmovde	%xcc,	%f23,	%f24
	fbue	%fcc1,	loop_457
	brlez	%o0,	loop_458
loop_456:
	bvs,a,pn	%xcc,	loop_459
	tn	%xcc,	0x6
loop_457:
	fmovd	%f0,	%f22
loop_458:
	edge32	%i4,	%g1,	%o5
loop_459:
	movne	%icc,	%i3,	%g7
	fmovdne	%icc,	%f27,	%f0
	movvc	%icc,	%g5,	%o7
	sra	%i0,	%l5,	%i7
	movgu	%icc,	%l4,	%l0
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x89,	 0x2
	edge8ln	%l3,	%l1,	%g4
	ldsw	[%l7 + 0x78],	%i6
	movl	%xcc,	%i2,	%o4
	swap	[%l7 + 0x6C],	%i1
	bcs,pt	%xcc,	loop_460
	movrlz	%g2,	%o1,	%l2
	alignaddr	%o2,	%o6,	%i5
	nop
	setx	loop_461,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_460:
	tgu	%icc,	0x4
	fmovrdlez	%g6,	%f10,	%f20
	edge32l	%o3,	%o0,	%l6
loop_461:
	fmovdle	%xcc,	%f20,	%f0
	udiv	%g1,	0x1DAC,	%o5
	xnorcc	%i3,	%i4,	%g5
	sth	%o7,	[%l7 + 0x7C]
	movcs	%icc,	%g7,	%l5
	stx	%i7,	[%l7 + 0x18]
	movcs	%icc,	%l4,	%l0
	movpos	%xcc,	%i0,	%l3
	addc	%g3,	%l1,	%g4
	fandnot2	%f24,	%f2,	%f14
	xnorcc	%i6,	0x036E,	%o4
	subccc	%i2,	0x0CAA,	%g2
	brgz,a	%o1,	loop_462
	srax	%l2,	0x09,	%o2
	edge8l	%o6,	%i1,	%g6
	movle	%xcc,	%o3,	%o0
loop_462:
	movcc	%icc,	%l6,	%i5
	stb	%g1,	[%l7 + 0x6B]
	sdivcc	%i3,	0x1573,	%o5
	fble,a	%fcc1,	loop_463
	fmovrsgez	%i4,	%f11,	%f21
	udivcc	%g5,	0x064D,	%g7
	ta	%icc,	0x3
loop_463:
	tg	%xcc,	0x5
	fnors	%f0,	%f0,	%f23
	fbe,a	%fcc3,	loop_464
	nop
	setx	0x1BC1A8C6F6903220,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x54281A1619BF9755,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f20,	%f30
	fmovsl	%xcc,	%f25,	%f29
	edge16	%l5,	%i7,	%l4
loop_464:
	bge,a	loop_465
	subc	%l0,	%i0,	%l3
	tge	%xcc,	0x5
	ldsh	[%l7 + 0x2C],	%o7
loop_465:
	fbne,a	%fcc1,	loop_466
	tne	%xcc,	0x1
	tpos	%icc,	0x2
	edge16n	%l1,	%g3,	%i6
loop_466:
	tgu	%icc,	0x2
	call	loop_467
	te	%xcc,	0x5
	or	%g4,	0x1888,	%o4
	call	loop_468
loop_467:
	sth	%g2,	[%l7 + 0x42]
	fors	%f13,	%f5,	%f25
	fmovrsgez	%i2,	%f8,	%f1
loop_468:
	fmul8x16au	%f25,	%f31,	%f20
	edge8l	%l2,	%o1,	%o6
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x80,	%o2
	nop
	fitos	%f5,	%f19
	fstox	%f19,	%f14
	fxtos	%f14,	%f2
	fbug,a	%fcc2,	loop_469
	orncc	%g6,	0x0310,	%o3
	taddcc	%o0,	%l6,	%i1
	fmovsn	%icc,	%f9,	%f20
loop_469:
	fbe	%fcc0,	loop_470
	fexpand	%f2,	%f8
	movge	%xcc,	%g1,	%i3
	edge16	%i5,	%o5,	%g5
loop_470:
	mova	%xcc,	%i4,	%l5
	set	0x20, %i5
	lduha	[%l7 + %i5] 0x11,	%g7
	addcc	%i7,	0x03C2,	%l0
	edge8l	%l4,	%i0,	%l3
	andn	%l1,	0x0006,	%o7
	nop
	fitos	%f22,	%f19
	fmovrsgez	%g3,	%f31,	%f1
	smulcc	%g4,	0x149D,	%o4
	taddcc	%g2,	0x15D3,	%i6
	fpadd32s	%f19,	%f26,	%f18
	tsubcctv	%i2,	%o1,	%o6
	sub	%l2,	%g6,	%o3
	brlez,a	%o2,	loop_471
	movcc	%icc,	%l6,	%o0
	movrlz	%g1,	%i1,	%i5
	tge	%xcc,	0x6
loop_471:
	movpos	%icc,	%i3,	%g5
	srl	%i4,	%o5,	%g7
	fba,a	%fcc0,	loop_472
	movre	%l5,	%i7,	%l4
	fone	%f8
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x19,	%l0,	%i0
loop_472:
	popc	0x1828,	%l1
	tgu	%xcc,	0x5
	lduw	[%l7 + 0x24],	%l3
	edge8	%o7,	%g4,	%o4
	ldsb	[%l7 + 0x40],	%g2
	fcmple32	%f20,	%f4,	%g3
	fmuld8sux16	%f2,	%f29,	%f12
	srl	%i2,	%o1,	%o6
	lduh	[%l7 + 0x62],	%l2
	edge16	%g6,	%i6,	%o3
	bn,a	%xcc,	loop_473
	fmovd	%f2,	%f16
	std	%f26,	[%l7 + 0x40]
	std	%f30,	[%l7 + 0x10]
loop_473:
	movvs	%xcc,	%o2,	%o0
	fbl	%fcc0,	loop_474
	fbug,a	%fcc0,	loop_475
	ta	%xcc,	0x5
	edge32	%g1,	%i1,	%i5
loop_474:
	fnot1	%f20,	%f14
loop_475:
	brgz	%i3,	loop_476
	movrne	%g5,	0x1E2,	%l6
	add	%o5,	%g7,	%i4
	membar	0x6D
loop_476:
	tpos	%xcc,	0x4
	sub	%l5,	0x0D43,	%i7
	lduw	[%l7 + 0x40],	%l4
	fexpand	%f8,	%f26
	nop
	setx	0x85FC2510,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x0D378A25,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f21,	%f23
	set	0x08, %g1
	prefetcha	[%l7 + %g1] 0x10,	 0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l1,	%l3,	%l0
	fbne,a	%fcc1,	loop_477
	nop
	set	0x28, %i6
	ldx	[%l7 + %i6],	%g4
	movrne	%o7,	0x3B3,	%g2
	flush	%l7 + 0x34
loop_477:
	fpsub32s	%f28,	%f19,	%f11
	bpos	%xcc,	loop_478
	fmovrdgez	%o4,	%f12,	%f10
	orn	%i2,	%g3,	%o6
	tvs	%icc,	0x5
loop_478:
	ble	loop_479
	edge16	%o1,	%g6,	%l2
	ta	%icc,	0x1
	mulx	%o3,	%i6,	%o0
loop_479:
	movrne	%o2,	%g1,	%i1
	movrlez	%i3,	%g5,	%l6
	tg	%xcc,	0x2
	movrne	%i5,	0x3CE,	%g7
	array16	%o5,	%i4,	%l5
	ta	%icc,	0x6
	mulscc	%i7,	%l4,	%l1
	fnand	%f30,	%f26,	%f4
	fmovdle	%icc,	%f1,	%f4
	tg	%xcc,	0x6
	fbn	%fcc1,	loop_480
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f16
	fxtod	%f16,	%f12
	wr	%g0,	0xea,	%asi
	stwa	%i0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_480:
	nop
	setx	0x9BD7C7B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x9576FE17,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f31,	%f31
	fnot1	%f16,	%f18
	wr	%g0,	0x19,	%asi
	stwa	%l0,	[%l7 + 0x58] %asi
	tpos	%xcc,	0x2
	movvc	%icc,	%g4,	%l3
	and	%g2,	0x1027,	%o7
	andn	%i2,	0x1BDF,	%o4
	fmul8x16	%f13,	%f26,	%f28
	fmovdcs	%icc,	%f21,	%f21
	andn	%g3,	0x0C9D,	%o6
	movrgz	%g6,	%o1,	%o3
	fnegd	%f8,	%f24
	andn	%i6,	%l2,	%o2
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%g1
	fmovrde	%i1,	%f6,	%f16
	bcs	%xcc,	loop_481
	ldsh	[%l7 + 0x08],	%i3
	bneg	%icc,	loop_482
	movg	%xcc,	%o0,	%g5
loop_481:
	movne	%icc,	%i5,	%g7
	std	%f28,	[%l7 + 0x40]
loop_482:
	bvc	loop_483
	sll	%l6,	0x01,	%o5
	array8	%l5,	%i7,	%l4
	movgu	%xcc,	%l1,	%i0
loop_483:
	tle	%xcc,	0x3
	tl	%xcc,	0x5
	orcc	%i4,	0x01E9,	%g4
	srax	%l0,	%l3,	%o7
	and	%i2,	%o4,	%g3
	tle	%icc,	0x7
	movle	%icc,	%o6,	%g6
	alignaddr	%o1,	%o3,	%g2
	andcc	%l2,	%i6,	%g1
	array32	%o2,	%i3,	%i1
	array32	%o0,	%i5,	%g7
	fpadd32	%f18,	%f10,	%f2
	nop
	setx	loop_484,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdvs	%xcc,	%f26,	%f5
	set	0x74, %i0
	lduwa	[%l7 + %i0] 0x89,	%g5
loop_484:
	edge16l	%l6,	%o5,	%i7
	fcmpeq32	%f26,	%f4,	%l5
	movgu	%xcc,	%l4,	%l1
	subcc	%i4,	0x107A,	%i0
	popc	0x1E38,	%g4
	tn	%xcc,	0x0
	movl	%icc,	%l3,	%o7
	taddcctv	%i2,	%l0,	%o4
	fpack16	%f20,	%f20
	tsubcctv	%g3,	%o6,	%o1
	ldx	[%l7 + 0x58],	%g6
	smulcc	%g2,	%o3,	%l2
	fpackfix	%f24,	%f22
	fmovdvc	%icc,	%f5,	%f13
	tpos	%xcc,	0x3
	andncc	%g1,	%o2,	%i6
	movneg	%icc,	%i3,	%o0
	nop
	setx	0x2E121BD4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f25
	fxnor	%f18,	%f30,	%f30
	edge8ln	%i5,	%i1,	%g7
	xor	%g5,	0x065D,	%o5
	movrlez	%l6,	0x194,	%l5
	movg	%icc,	%l4,	%l1
	edge32n	%i7,	%i0,	%g4
	taddcctv	%i4,	0x05F4,	%o7
	nop
	set	0x74, %g7
	lduh	[%l7 + %g7],	%l3
	edge16n	%i2,	%o4,	%g3
	fandnot1	%f10,	%f14,	%f2
	fba,a	%fcc0,	loop_485
	ba,pn	%icc,	loop_486
	srlx	%o6,	0x0E,	%o1
	subcc	%l0,	0x1E11,	%g2
loop_485:
	fabss	%f11,	%f24
loop_486:
	bg,a,pt	%xcc,	loop_487
	nop
	fitos	%f9,	%f18
	fstod	%f18,	%f26
	umulcc	%o3,	0x05CE,	%l2
	tsubcctv	%g1,	%g6,	%i6
loop_487:
	movneg	%icc,	%i3,	%o2
	fmovrse	%o0,	%f28,	%f28
	set	0x78, %i3
	stwa	%i1,	[%l7 + %i3] 0xeb
	membar	#Sync
	movpos	%icc,	%g7,	%g5
	set	0x54, %o6
	lduwa	[%l7 + %o6] 0x0c,	%o5
	swap	[%l7 + 0x70],	%i5
	edge8n	%l6,	%l5,	%l4
	fba	%fcc1,	loop_488
	sllx	%i7,	0x0F,	%i0
	bleu	loop_489
	membar	0x25
loop_488:
	movvs	%icc,	%g4,	%l1
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f0
	fxtod	%f0,	%f16
loop_489:
	orn	%o7,	%i4,	%i2
	movl	%xcc,	%l3,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x62],	%g3
	bvs,pn	%icc,	loop_490
	sth	%o1,	[%l7 + 0x54]
	fsrc2s	%f24,	%f4
	tvs	%xcc,	0x2
loop_490:
	call	loop_491
	xor	%l0,	%g2,	%o6
	tge	%icc,	0x0
	edge16ln	%l2,	%g1,	%o3
loop_491:
	nop
	set	0x4E, %o3
	ldsha	[%l7 + %o3] 0x15,	%i6
	tleu	%icc,	0x5
	for	%f6,	%f8,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x48, %g5
	stw	%g6,	[%l7 + %g5]
	fmovrsgz	%i3,	%f31,	%f17
	movgu	%icc,	%o2,	%o0
	set	0x12, %i2
	stba	%i1,	[%l7 + %i2] 0x0c
	addcc	%g7,	0x13AF,	%o5
	udivcc	%i5,	0x0186,	%g5
	tle	%icc,	0x4
	tcc	%icc,	0x7
	fblg,a	%fcc3,	loop_492
	fcmpgt16	%f26,	%f22,	%l6
	array8	%l4,	%l5,	%i7
	nop
	set	0x65, %l2
	ldub	[%l7 + %l2],	%g4
loop_492:
	bg	loop_493
	fpmerge	%f9,	%f12,	%f14
	fmovsgu	%icc,	%f9,	%f20
	mulx	%l1,	%i0,	%o7
loop_493:
	movrlez	%i2,	%i4,	%o4
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x23,	%g2
	movle	%xcc,	%o1,	%l3
	movvs	%icc,	%l0,	%o6
	set	0x70, %o1
	lduwa	[%l7 + %o1] 0x80,	%g2
	set	0x70, %i1
	lduwa	[%l7 + %i1] 0x15,	%l2
	subc	%g1,	%o3,	%i6
	movl	%icc,	%g6,	%i3
	tleu	%icc,	0x4
	brgez,a	%o0,	loop_494
	ldd	[%l7 + 0x58],	%i0
	taddcc	%g7,	0x0726,	%o2
	fmovsg	%icc,	%f19,	%f6
loop_494:
	be,pn	%icc,	loop_495
	orncc	%i5,	0x1B39,	%g5
	mova	%icc,	%o5,	%l4
	fbu	%fcc0,	loop_496
loop_495:
	st	%f13,	[%l7 + 0x48]
	taddcctv	%l6,	0x0097,	%l5
	edge8l	%i7,	%l1,	%g4
loop_496:
	smulcc	%i0,	%o7,	%i2
	xor	%i4,	%o4,	%o1
	smul	%g3,	%l3,	%o6
	andn	%g2,	0x0A08,	%l0
	set	0x60, %o0
	stwa	%l2,	[%l7 + %o0] 0x04
	fpadd32s	%f5,	%f29,	%f4
	sethi	0x0810,	%o3
	edge8ln	%i6,	%g1,	%g6
	fpack32	%f6,	%f14,	%f18
	xnorcc	%o0,	%i1,	%g7
	fbo,a	%fcc2,	loop_497
	ba,a	%xcc,	loop_498
	stx	%o2,	[%l7 + 0x20]
	sll	%i3,	0x1C,	%i5
loop_497:
	fpsub16s	%f26,	%f17,	%f14
loop_498:
	xor	%g5,	%l4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%o5
	movre	%l5,	%i7,	%l1
	nop
	set	0x10, %l0
	ldx	[%l7 + %l0],	%i0
	tl	%icc,	0x0
	fbug	%fcc2,	loop_499
	for	%f12,	%f8,	%f14
	movre	%g4,	0x23C,	%o7
	edge16l	%i2,	%i4,	%o1
loop_499:
	nop
	setx	loop_500,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x1016,	%o4
	udivx	%g3,	0x1669,	%o6
	fmovrsne	%g2,	%f5,	%f2
loop_500:
	bge,a,pt	%xcc,	loop_501
	fpadd16	%f14,	%f30,	%f20
	fnot2	%f14,	%f20
	ldstub	[%l7 + 0x4F],	%l3
loop_501:
	edge8ln	%l2,	%l0,	%o3
	andn	%g1,	0x0135,	%i6
	edge8	%g6,	%o0,	%g7
	movge	%xcc,	%i1,	%o2
	or	%i3,	0x1798,	%g5
	fbul,a	%fcc1,	loop_502
	fmovsne	%icc,	%f7,	%f28
	xnor	%i5,	%l6,	%o5
	stw	%l5,	[%l7 + 0x10]
loop_502:
	fzeros	%f27
	fxnor	%f24,	%f0,	%f16
	fexpand	%f11,	%f10
	movle	%xcc,	%l4,	%i7
	movg	%xcc,	%i0,	%l1
	tgu	%xcc,	0x7
	fmovdn	%icc,	%f10,	%f6
	set	0x49, %o7
	ldsba	[%l7 + %o7] 0x89,	%o7
	nop
	setx	0x99A56EFA088ED6A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x63142B2BB1E4483D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f14,	%f30
	fcmpeq16	%f20,	%f2,	%i2
	nop
	setx	0xB3C453E1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xF804FE87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f4,	%f2
	stx	%g4,	[%l7 + 0x60]
	fbo,a	%fcc3,	loop_503
	fbge	%fcc3,	loop_504
	fabss	%f19,	%f16
	tsubcctv	%i4,	%o4,	%g3
loop_503:
	edge32n	%o1,	%o6,	%l3
loop_504:
	nop
	set	0x25, %g2
	stba	%g2,	[%l7 + %g2] 0x81
	fpack32	%f28,	%f2,	%f2
	sllx	%l2,	%o3,	%g1
	fmovdleu	%icc,	%f17,	%f24
	taddcc	%l0,	%g6,	%o0
	fnor	%f24,	%f14,	%f24
	sdiv	%i6,	0x0376,	%i1
	nop
	fitos	%f8,	%f25
	fstoi	%f25,	%f5
	tge	%icc,	0x0
	fnot2	%f0,	%f2
	fmovsne	%xcc,	%f11,	%f14
	sllx	%g7,	0x14,	%i3
	subc	%g5,	%i5,	%l6
	bge	%icc,	loop_505
	sll	%o2,	%l5,	%o5
	tne	%icc,	0x4
	set	0x40, %o4
	prefetcha	[%l7 + %o4] 0x10,	 0x0
loop_505:
	movcs	%xcc,	%i0,	%i7
	edge32	%l1,	%i2,	%o7
	udivcc	%g4,	0x1345,	%i4
	set	0x28, %l4
	lduwa	[%l7 + %l4] 0x89,	%g3
	udiv	%o4,	0x1FF5,	%o6
	nop
	set	0x70, %l3
	stx	%o1,	[%l7 + %l3]
	tcc	%xcc,	0x0
	movne	%xcc,	%g2,	%l2
	bg,a,pt	%icc,	loop_506
	nop
	setx loop_507, %l0, %l1
	jmpl %l1, %o3
	bl,pt	%icc,	loop_508
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_506:
	fmovrde	%l3,	%f22,	%f16
loop_507:
	nop
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x18,	 0x2
loop_508:
	srax	%l0,	%g6,	%i6
	fba	%fcc3,	loop_509
	fblg,a	%fcc1,	loop_510
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i1,	%o0,	%g7
loop_509:
	nop
	setx	0xDBA63BF680E57D18,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x644AA061A637D516,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f6,	%f8
loop_510:
	ba,a,pn	%xcc,	loop_511
	fmovd	%f8,	%f28
	xor	%i3,	0x12B7,	%i5
	movcc	%xcc,	%l6,	%o2
loop_511:
	movvc	%icc,	%g5,	%o5
	tleu	%xcc,	0x1
	fandnot2	%f8,	%f22,	%f4
	mulx	%l5,	0x14BE,	%l4
	tne	%xcc,	0x6
	nop
	setx	0xA6C003E91F0247FC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f12
	xnorcc	%i0,	%i7,	%i2
	tsubcctv	%l1,	0x06C3,	%o7
	edge16	%g4,	%i4,	%o4
	movcs	%xcc,	%o6,	%g3
	array8	%o1,	%l2,	%g2
	bg	%xcc,	loop_512
	tvs	%xcc,	0x5
	addc	%l3,	0x0C82,	%g1
	xnorcc	%o3,	%g6,	%l0
loop_512:
	bleu,a,pn	%icc,	loop_513
	tl	%xcc,	0x2
	edge32l	%i1,	%o0,	%g7
	nop
	fitos	%f1,	%f17
	fstox	%f17,	%f28
	fxtos	%f28,	%f17
loop_513:
	fmovdleu	%xcc,	%f14,	%f22
	fnegs	%f20,	%f12
	alignaddr	%i3,	%i6,	%l6
	fmovrdlez	%i5,	%f12,	%f28
	orcc	%o2,	%o5,	%l5
	nop
	set	0x78, %o2
	lduh	[%l7 + %o2],	%g5
	tvs	%icc,	0x3
	tvs	%icc,	0x6
	bg	%icc,	loop_514
	fnegd	%f2,	%f22
	fmovrsgez	%i0,	%f29,	%f22
	orcc	%i7,	0x0A81,	%i2
loop_514:
	fxnors	%f11,	%f25,	%f12
	fnot1	%f28,	%f2
	tge	%icc,	0x7
	fmovdcc	%xcc,	%f27,	%f18
	fpadd16s	%f14,	%f14,	%f16
	ldsw	[%l7 + 0x28],	%l1
	bpos	loop_515
	tl	%xcc,	0x7
	fmovrdgez	%o7,	%f16,	%f22
	sdiv	%l4,	0x0B6D,	%g4
loop_515:
	srax	%o4,	0x08,	%o6
	fnot1s	%f19,	%f11
	mulscc	%i4,	0x0882,	%o1
	nop
	setx	0x40675BC5,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	edge32l	%l2,	%g2,	%l3
	subcc	%g3,	%o3,	%g6
	fmovsne	%xcc,	%f17,	%f22
	mulscc	%g1,	%l0,	%o0
	edge32ln	%i1,	%i3,	%i6
	mova	%icc,	%g7,	%l6
	add	%o2,	%i5,	%l5
	membar	0x3A
	fpsub32	%f0,	%f22,	%f8
	fmul8x16al	%f14,	%f29,	%f10
	edge8n	%g5,	%i0,	%i7
	ldd	[%l7 + 0x60],	%f26
	sdiv	%i2,	0x0D7E,	%o5
	taddcctv	%l1,	0x143B,	%o7
	mova	%xcc,	%g4,	%l4
	fmovse	%icc,	%f13,	%f16
	edge32l	%o6,	%i4,	%o4
	ldsb	[%l7 + 0x62],	%l2
	mova	%xcc,	%o1,	%l3
	movrlez	%g3,	0x3C2,	%o3
	movvs	%xcc,	%g6,	%g2
	fmovsl	%icc,	%f16,	%f12
	fandnot1s	%f0,	%f30,	%f15
	fmovsvs	%icc,	%f20,	%f9
	popc	0x048A,	%g1
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f4
	fxtod	%f4,	%f16
	andncc	%o0,	%l0,	%i3
	movvc	%icc,	%i1,	%g7
	movg	%xcc,	%i6,	%o2
	or	%i5,	0x1281,	%l5
	set	0x68, %l6
	ldxa	[%l7 + %l6] 0x10,	%l6
	andn	%i0,	%g5,	%i7
	bpos,a,pt	%icc,	loop_516
	movneg	%xcc,	%i2,	%l1
	tl	%xcc,	0x6
	taddcctv	%o7,	0x1545,	%o5
loop_516:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x22] %asi,	%g4
	edge8ln	%l4,	%i4,	%o4
	movrlez	%o6,	0x385,	%l2
	flush	%l7 + 0x44
	brlez,a	%l3,	loop_517
	movn	%icc,	%o1,	%o3
	fmovsn	%icc,	%f30,	%f16
	edge16	%g3,	%g2,	%g6
loop_517:
	srl	%o0,	0x0A,	%l0
	nop
	set	0x0B, %g3
	ldub	[%l7 + %g3],	%g1
	fmovdvc	%xcc,	%f27,	%f19
	fbge,a	%fcc2,	loop_518
	udiv	%i3,	0x0F73,	%g7
	fcmpgt16	%f14,	%f10,	%i1
	prefetch	[%l7 + 0x6C],	 0x0
loop_518:
	nop
	fitos	%f8,	%f9
	tvc	%icc,	0x4
	subcc	%o2,	%i5,	%i6
	tn	%xcc,	0x0
	mulscc	%l6,	%l5,	%i0
	bge,pt	%xcc,	loop_519
	srlx	%g5,	0x18,	%i7
	edge16n	%l1,	%o7,	%o5
	fmovrsgz	%g4,	%f28,	%f27
loop_519:
	sethi	0x1C46,	%i2
	nop
	setx	loop_520,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbn	%fcc1,	loop_521
	sll	%l4,	%i4,	%o6
	srl	%l2,	0x1C,	%l3
loop_520:
	ld	[%l7 + 0x0C],	%f2
loop_521:
	add	%o1,	0x16D6,	%o3
	tsubcctv	%o4,	%g3,	%g2
	xnorcc	%o0,	%l0,	%g1
	faligndata	%f18,	%f26,	%f26
	sdivx	%i3,	0x0689,	%g6
	movneg	%icc,	%g7,	%o2
	ldx	[%l7 + 0x30],	%i1
	movrlz	%i5,	%l6,	%l5
	fnors	%f14,	%f15,	%f24
	tsubcctv	%i0,	%i6,	%i7
	fbg,a	%fcc0,	loop_522
	movrlez	%l1,	%o7,	%o5
	movgu	%xcc,	%g4,	%g5
	tsubcctv	%l4,	%i2,	%i4
loop_522:
	tsubcctv	%l2,	0x09CE,	%l3
	tcs	%icc,	0x3
	fbuge	%fcc2,	loop_523
	edge8n	%o1,	%o3,	%o4
	tpos	%xcc,	0x0
	mulscc	%o6,	%g3,	%g2
loop_523:
	nop
	setx	0x9534B170C04D232C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	ta	%xcc,	0x5
	tg	%icc,	0x4
	edge8ln	%o0,	%g1,	%l0
	fmovrde	%i3,	%f12,	%f10
	tcc	%icc,	0x3
	wr	%g0,	0x22,	%asi
	stxa	%g7,	[%l7 + 0x58] %asi
	membar	#Sync
	edge16l	%o2,	%g6,	%i1
	movleu	%xcc,	%l6,	%i5
	ta	%icc,	0x5
	andncc	%i0,	%l5,	%i6
	set	0x18, %o5
	ldstuba	[%l7 + %o5] 0x81,	%i7
	movpos	%icc,	%l1,	%o7
	xnor	%g4,	%g5,	%o5
	membar	0x3A
	movn	%icc,	%i2,	%l4
	movrlez	%l2,	0x051,	%i4
	tneg	%xcc,	0x7
	fmovdcc	%xcc,	%f0,	%f14
	alignaddrl	%l3,	%o1,	%o3
	bgu,pn	%icc,	loop_524
	ldx	[%l7 + 0x50],	%o4
	fornot1	%f24,	%f22,	%f12
	smul	%g3,	0x0B46,	%o6
loop_524:
	ldsh	[%l7 + 0x6A],	%o0
	movvc	%xcc,	%g2,	%g1
	lduh	[%l7 + 0x58],	%i3
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tvs	%xcc,	0x5
	wr	%g0,	0x04,	%asi
	stba	%l0,	[%l7 + 0x2F] %asi
	nop
	setx	0xF7EA8D8F361235BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE0064151DB110F74,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f2,	%f10
	umul	%o2,	%g6,	%g7
	edge8n	%l6,	%i5,	%i1
	sdivcc	%i0,	0x1D2F,	%i6
	sdivcc	%i7,	0x0F75,	%l5
	brlz,a	%o7,	loop_525
	edge8	%l1,	%g5,	%g4
	sllx	%o5,	%i2,	%l2
	fmovse	%icc,	%f6,	%f8
loop_525:
	addccc	%l4,	0x10AF,	%i4
	fcmpeq16	%f20,	%f10,	%o1
	call	loop_526
	sdivx	%o3,	0x01CA,	%l3
	fmuld8sux16	%f18,	%f31,	%f2
	bneg,a	%icc,	loop_527
loop_526:
	udiv	%g3,	0x17EE,	%o6
	stb	%o0,	[%l7 + 0x6A]
	lduw	[%l7 + 0x68],	%o4
loop_527:
	brgz,a	%g1,	loop_528
	fpadd32s	%f28,	%f16,	%f5
	edge8	%i3,	%g2,	%o2
	tsubcc	%l0,	0x0B7A,	%g7
loop_528:
	array16	%g6,	%l6,	%i5
	set	0x18, %i7
	lduwa	[%l7 + %i7] 0x0c,	%i1
	add	%i6,	%i7,	%l5
	fmovsgu	%icc,	%f16,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x7
	tvc	%xcc,	0x1
	fbug	%fcc3,	loop_529
	movcs	%xcc,	%o7,	%i0
	for	%f8,	%f14,	%f20
	movvc	%icc,	%g5,	%g4
loop_529:
	nop
	setx	0x7C4857227059FB0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	faligndata	%f22,	%f28,	%f24
	edge8	%o5,	%l1,	%l2
	nop
	fitos	%f13,	%f10
	fstoi	%f10,	%f0
	sllx	%i2,	%i4,	%o1
	fmovsvc	%icc,	%f14,	%f24
	edge16ln	%o3,	%l3,	%g3
	movcs	%icc,	%o6,	%o0
	bvc	%xcc,	loop_530
	taddcc	%o4,	%g1,	%l4
	wr	%g0,	0x11,	%asi
	sta	%f19,	[%l7 + 0x4C] %asi
loop_530:
	tn	%xcc,	0x1
	edge16n	%i3,	%g2,	%l0
	movcc	%xcc,	%g7,	%o2
	nop
	setx	0x41C5755FC0712A90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	nop
	setx	0x919706EDE061DEAA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	tne	%xcc,	0x4
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movrne	%l6,	%g6,	%i5
	fmovd	%f6,	%f2
	for	%f8,	%f16,	%f28
	add	%i6,	0x023A,	%i1
	movre	%l5,	0x03D,	%i7
	bneg,a,pn	%xcc,	loop_531
	xnor	%o7,	%i0,	%g5
	orncc	%o5,	%g4,	%l1
	prefetch	[%l7 + 0x24],	 0x1
loop_531:
	movn	%icc,	%i2,	%l2
	fpsub32	%f6,	%f14,	%f30
	fsrc1	%f18,	%f16
	fmovscs	%xcc,	%f27,	%f15
	fpadd32s	%f13,	%f3,	%f19
	tle	%xcc,	0x4
	stbar
	movvs	%icc,	%i4,	%o3
	nop
	fitos	%f1,	%f21
	fstod	%f21,	%f6
	edge8n	%l3,	%o1,	%g3
	taddcc	%o6,	%o0,	%o4
	array32	%g1,	%l4,	%g2
	fbg	%fcc3,	loop_532
	ta	%icc,	0x1
	flush	%l7 + 0x70
	membar	0x26
loop_532:
	edge8	%l0,	%g7,	%i3
	movrlez	%l6,	%g6,	%o2
	fpsub32	%f24,	%f26,	%f14
	fmul8sux16	%f14,	%f12,	%f22
	orn	%i5,	%i1,	%l5
	movre	%i7,	0x0A6,	%o7
	orncc	%i6,	%i0,	%o5
	fbl,a	%fcc2,	loop_533
	sub	%g4,	0x0F3E,	%l1
	edge32l	%g5,	%i2,	%i4
	fblg,a	%fcc3,	loop_534
loop_533:
	fmovs	%f18,	%f23
	subcc	%l2,	%o3,	%l3
	orncc	%o1,	0x07FD,	%o6
loop_534:
	bg	%icc,	loop_535
	fble,a	%fcc1,	loop_536
	fmovdneg	%icc,	%f2,	%f22
	sra	%g3,	%o4,	%o0
loop_535:
	andcc	%g1,	%l4,	%l0
loop_536:
	addc	%g7,	%g2,	%i3
	add	%g6,	%o2,	%i5
	fcmple32	%f30,	%f0,	%l6
	andcc	%i1,	%l5,	%i7
	lduw	[%l7 + 0x64],	%i6
	fcmpne16	%f4,	%f12,	%i0
	bl,a,pt	%xcc,	loop_537
	ld	[%l7 + 0x54],	%f27
	edge32n	%o7,	%g4,	%o5
	ldsw	[%l7 + 0x68],	%g5
loop_537:
	movvs	%icc,	%l1,	%i2
	fbge,a	%fcc1,	loop_538
	fmovspos	%icc,	%f18,	%f22
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x3C] %asi,	%l2
loop_538:
	edge32n	%o3,	%l3,	%o1
	edge8l	%o6,	%g3,	%o4
	movle	%icc,	%i4,	%o0
	edge16	%g1,	%l0,	%g7
	movgu	%xcc,	%l4,	%g2
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x0c
	taddcctv	%g6,	%i3,	%o2
	stw	%l6,	[%l7 + 0x7C]
	movl	%xcc,	%i1,	%l5
	edge32	%i5,	%i6,	%i7
	alignaddrl	%i0,	%g4,	%o5
	edge8ln	%g5,	%o7,	%l1
	nop
	setx	0x17F6F299B2FF18F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f6
	nop
	setx loop_539, %l0, %l1
	jmpl %l1, %i2
	tle	%xcc,	0x7
	sdivx	%l2,	0x07D9,	%l3
	edge32l	%o1,	%o3,	%o6
loop_539:
	subc	%o4,	0x0B49,	%g3
	std	%f4,	[%l7 + 0x60]
	movl	%icc,	%i4,	%o0
	andn	%l0,	0x1328,	%g1
	ldsh	[%l7 + 0x3C],	%l4
	andn	%g7,	%g2,	%i3
	brz	%o2,	loop_540
	fornot1	%f24,	%f26,	%f20
	umulcc	%l6,	0x0876,	%g6
	edge16ln	%l5,	%i5,	%i6
loop_540:
	fpsub32s	%f26,	%f0,	%f29
	movgu	%icc,	%i1,	%i0
	std	%f22,	[%l7 + 0x70]
	array8	%i7,	%o5,	%g4
	subc	%g5,	0x0CAE,	%l1
	nop
	setx	0x366A42BA6FA45B32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x9981DFC01CCE7A2E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f2,	%f4
	ldd	[%l7 + 0x60],	%i2
	set	0x1A, %i4
	lduha	[%l7 + %i4] 0x88,	%l2
	fmovsneg	%icc,	%f14,	%f19
	movrne	%o7,	%o1,	%o3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o6,	%l3
	fbl	%fcc1,	loop_541
	tneg	%xcc,	0x4
	edge32	%g3,	%o4,	%o0
	movrlez	%i4,	%g1,	%l0
loop_541:
	bn,a,pn	%icc,	loop_542
	bcs,a,pt	%xcc,	loop_543
	fmovsn	%xcc,	%f4,	%f9
	movgu	%icc,	%l4,	%g7
loop_542:
	movpos	%icc,	%i3,	%o2
loop_543:
	bl,a	%icc,	loop_544
	movrgz	%l6,	0x114,	%g2
	ta	%icc,	0x7
	lduw	[%l7 + 0x78],	%l5
loop_544:
	movcc	%icc,	%i5,	%g6
	tvs	%xcc,	0x0
	movrgz	%i1,	%i6,	%i7
	tg	%xcc,	0x3
	call	loop_545
	brgz,a	%i0,	loop_546
	udivcc	%g4,	0x1BA6,	%o5
	tcc	%icc,	0x7
loop_545:
	addc	%l1,	0x0EEE,	%g5
loop_546:
	sll	%i2,	%l2,	%o1
	andncc	%o3,	%o7,	%o6
	fmovscs	%xcc,	%f22,	%f1
	ta	%icc,	0x3
	membar	0x2D
	nop
	setx loop_547, %l0, %l1
	jmpl %l1, %g3
	flush	%l7 + 0x28
	smulcc	%l3,	0x0AFB,	%o4
	fmovdleu	%icc,	%f27,	%f5
loop_547:
	movrlez	%o0,	%g1,	%l0
	move	%icc,	%i4,	%l4
	fmovdcc	%xcc,	%f23,	%f0
	tsubcc	%i3,	%g7,	%o2
	srax	%g2,	0x03,	%l5
	fmovdge	%xcc,	%f13,	%f9
	fmovdvc	%xcc,	%f8,	%f31
	sra	%l6,	0x09,	%i5
	orncc	%i1,	0x1136,	%i6
	movle	%xcc,	%i7,	%g6
	movneg	%icc,	%i0,	%g4
	ldsw	[%l7 + 0x10],	%o5
	srl	%g5,	0x14,	%l1
	movn	%icc,	%l2,	%i2
	movvc	%icc,	%o1,	%o7
	tcc	%icc,	0x7
	prefetch	[%l7 + 0x70],	 0x0
	tg	%icc,	0x3
	tn	%icc,	0x1
	fbe	%fcc2,	loop_548
	srax	%o3,	0x0C,	%g3
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x04,	 0x1
loop_548:
	tvs	%xcc,	0x3
	edge32ln	%l3,	%o4,	%o0
	movl	%icc,	%g1,	%l0
	membar	0x6F
	fands	%f14,	%f16,	%f28
	sir	0x1830
	smul	%i4,	%l4,	%i3
	movrgez	%g7,	%o2,	%g2
	movleu	%icc,	%l5,	%l6
	fornot1	%f16,	%f10,	%f6
	movrgz	%i5,	%i1,	%i7
	sub	%g6,	0x0FA2,	%i0
	andn	%i6,	0x0703,	%g4
	sub	%g5,	0x1409,	%o5
	nop
	fitos	%f4,	%f7
	fstod	%f7,	%f22
	movcs	%xcc,	%l1,	%l2
	tg	%xcc,	0x0
	andcc	%i2,	0x1897,	%o7
	edge16	%o1,	%o3,	%g3
	fmovdpos	%xcc,	%f12,	%f2
	bge,a	%icc,	loop_549
	ld	[%l7 + 0x64],	%f16
	fmovdpos	%icc,	%f5,	%f30
	mulx	%l3,	%o6,	%o0
loop_549:
	tne	%xcc,	0x4
	nop
	set	0x46, %g1
	ldsh	[%l7 + %g1],	%o4
	st	%f15,	[%l7 + 0x68]
	orn	%g1,	%i4,	%l0
	tneg	%icc,	0x6
	fbule,a	%fcc0,	loop_550
	brlez	%i3,	loop_551
	alignaddrl	%g7,	%l4,	%g2
	and	%o2,	0x0F50,	%l5
loop_550:
	sub	%i5,	%l6,	%i1
loop_551:
	bne,a,pn	%icc,	loop_552
	fpsub32	%f8,	%f24,	%f28
	ble,pn	%xcc,	loop_553
	fmovrslz	%g6,	%f17,	%f14
loop_552:
	taddcc	%i7,	0x0139,	%i6
	nop
	setx	0x14FE7ACCA05EB02D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x887CC862F24A805E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f0,	%f8
loop_553:
	tneg	%icc,	0x5
	edge8l	%i0,	%g5,	%o5
	fnot1	%f2,	%f0
	edge16l	%l1,	%g4,	%i2
	tcs	%xcc,	0x2
	tne	%icc,	0x7
	fmovspos	%icc,	%f13,	%f17
	fbo	%fcc1,	loop_554
	brlez	%o7,	loop_555
	edge32n	%o1,	%l2,	%g3
	wr	%g0,	0x81,	%asi
	sta	%f28,	[%l7 + 0x60] %asi
loop_554:
	or	%o3,	%o6,	%o0
loop_555:
	tgu	%xcc,	0x7
	sllx	%o4,	0x04,	%g1
	fbul	%fcc1,	loop_556
	move	%xcc,	%l3,	%i4
	udiv	%i3,	0x140C,	%g7
	alignaddr	%l0,	%g2,	%o2
loop_556:
	fsrc2s	%f23,	%f23
	sub	%l5,	0x1D60,	%i5
	fand	%f24,	%f12,	%f10
	set	0x37, %i6
	lduba	[%l7 + %i6] 0x15,	%l6
	movcs	%xcc,	%l4,	%i1
	smul	%i7,	0x1E5C,	%i6
	tg	%icc,	0x5
	fbge	%fcc0,	loop_557
	fpsub16	%f4,	%f10,	%f2
	tg	%xcc,	0x4
	nop
	setx loop_558, %l0, %l1
	jmpl %l1, %i0
loop_557:
	edge8ln	%g6,	%g5,	%l1
	taddcctv	%o5,	0x0B94,	%g4
	movleu	%icc,	%o7,	%o1
loop_558:
	fsrc1	%f24,	%f20
	fmuld8ulx16	%f9,	%f0,	%f8
	movneg	%icc,	%i2,	%l2
	brz	%o3,	loop_559
	movrlez	%g3,	%o0,	%o4
	edge8	%o6,	%g1,	%l3
	addcc	%i4,	%i3,	%g7
loop_559:
	fornot2	%f18,	%f26,	%f2
	movcc	%icc,	%g2,	%l0
	movne	%xcc,	%l5,	%i5
	fmovsle	%icc,	%f24,	%f28
	umul	%o2,	0x11C1,	%l6
	xor	%l4,	%i7,	%i1
	orncc	%i6,	%g6,	%g5
	movcc	%xcc,	%l1,	%o5
	stb	%g4,	[%l7 + 0x51]
	xnorcc	%o7,	%o1,	%i2
	movpos	%icc,	%i0,	%o3
	tpos	%icc,	0x4
	move	%icc,	%l2,	%o0
	or	%g3,	%o4,	%o6
	subcc	%l3,	0x102F,	%g1
	array16	%i3,	%g7,	%g2
	movle	%xcc,	%l0,	%l5
	fzero	%f14
	fmovscc	%xcc,	%f27,	%f21
	fmovdcc	%icc,	%f3,	%f10
	nop
	setx	0x5E1D255D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x469B2C6D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f6,	%f9
	fba,a	%fcc1,	loop_560
	sra	%i4,	%o2,	%l6
	subc	%i5,	%l4,	%i7
	movrne	%i6,	%g6,	%g5
loop_560:
	sethi	0x1BB0,	%l1
	tneg	%icc,	0x2
	addcc	%i1,	0x17F0,	%g4
	sra	%o7,	%o5,	%i2
	sub	%o1,	%o3,	%i0
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x17] %asi,	%l2
	fmovrse	%g3,	%f13,	%f13
	movgu	%icc,	%o0,	%o6
	tne	%xcc,	0x4
	sdivx	%o4,	0x0AA4,	%l3
	sir	0x15F4
	fsrc2	%f20,	%f0
	and	%g1,	0x1AF6,	%i3
	xorcc	%g7,	0x002D,	%l0
	orn	%g2,	%l5,	%o2
	mulscc	%l6,	0x1EF6,	%i5
	tle	%xcc,	0x6
	orncc	%i4,	0x063A,	%i7
	movg	%icc,	%l4,	%g6
	umul	%g5,	0x1746,	%i6
	addc	%i1,	0x1EEB,	%l1
	movvc	%icc,	%g4,	%o5
	movrlez	%o7,	%o1,	%i2
	fbne	%fcc1,	loop_561
	fbne	%fcc1,	loop_562
	brz	%i0,	loop_563
	fsrc2	%f26,	%f0
loop_561:
	and	%l2,	%g3,	%o3
loop_562:
	sth	%o6,	[%l7 + 0x7C]
loop_563:
	fpsub16	%f6,	%f14,	%f0
	movl	%xcc,	%o4,	%l3
	andncc	%g1,	%i3,	%g7
	edge8	%l0,	%g2,	%l5
	nop
	setx	0x6A7CAA07,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xE3A9FAF4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f11,	%f24
	tgu	%icc,	0x0
	nop
	fitos	%f11,	%f28
	fstod	%f28,	%f4
	movle	%xcc,	%o0,	%l6
	membar	0x04
	mulscc	%i5,	0x1F5D,	%i4
	movrgz	%i7,	%o2,	%g6
	addccc	%g5,	%i6,	%i1
	set	0x14, %i0
	swapa	[%l7 + %i0] 0x80,	%l1
	movrgz	%g4,	0x12D,	%l4
	subcc	%o5,	%o7,	%i2
	ldsw	[%l7 + 0x18],	%o1
	sethi	0x068B,	%i0
	mova	%icc,	%l2,	%g3
	tneg	%xcc,	0x6
	edge8ln	%o6,	%o3,	%o4
	fmul8sux16	%f10,	%f10,	%f20
	subcc	%g1,	0x0BEE,	%i3
	movre	%g7,	%l3,	%g2
	fmovda	%xcc,	%f27,	%f30
	fmovsle	%icc,	%f9,	%f0
	taddcctv	%l0,	%l5,	%o0
	movrgz	%l6,	%i4,	%i7
	movvc	%xcc,	%i5,	%o2
	ldd	[%l7 + 0x40],	%g4
	edge32n	%g6,	%i1,	%i6
	or	%g4,	%l1,	%l4
	flush	%l7 + 0x10
	xnor	%o5,	%i2,	%o7
	andcc	%i0,	0x0F57,	%o1
	fmovdvs	%xcc,	%f27,	%f8
	fnor	%f30,	%f26,	%f0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%g3
	edge8l	%o6,	%l2,	%o4
	udivcc	%g1,	0x123F,	%o3
	fmovrdgz	%i3,	%f2,	%f24
	orncc	%l3,	0x0C28,	%g2
	ldsh	[%l7 + 0x0A],	%l0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g7,	%o0
	srl	%l5,	0x04,	%l6
	tn	%xcc,	0x3
	fbe	%fcc0,	loop_564
	movle	%xcc,	%i4,	%i5
	movvs	%xcc,	%o2,	%g5
	fcmpeq16	%f12,	%f4,	%i7
loop_564:
	fxnor	%f30,	%f28,	%f10
	orcc	%i1,	0x00A4,	%g6
	nop
	setx	loop_565,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge,a,pt	%xcc,	loop_566
	movpos	%xcc,	%i6,	%g4
	wr	%g0,	0x0c,	%asi
	stwa	%l1,	[%l7 + 0x08] %asi
loop_565:
	tg	%xcc,	0x6
loop_566:
	movgu	%xcc,	%l4,	%o5
	wr	%g0,	0x0c,	%asi
	stwa	%i2,	[%l7 + 0x10] %asi
	tneg	%xcc,	0x0
	fmovdn	%xcc,	%f29,	%f28
	brlez,a	%o7,	loop_567
	stx	%o1,	[%l7 + 0x18]
	sth	%i0,	[%l7 + 0x54]
	edge8n	%g3,	%l2,	%o4
loop_567:
	bshuffle	%f4,	%f0,	%f20
	fpackfix	%f26,	%f13
	fbue	%fcc0,	loop_568
	be,pt	%xcc,	loop_569
	movle	%icc,	%g1,	%o3
	add	%o6,	%i3,	%g2
loop_568:
	fmovsl	%xcc,	%f29,	%f26
loop_569:
	fbo,a	%fcc0,	loop_570
	movpos	%icc,	%l0,	%g7
	set	0x10, %g6
	ldda	[%l7 + %g6] 0x18,	%l2
loop_570:
	popc	%o0,	%l6
	movpos	%xcc,	%i4,	%l5
	ldx	[%l7 + 0x20],	%i5
	or	%g5,	%o2,	%i1
	std	%f12,	[%l7 + 0x58]
	fnegd	%f6,	%f16
	tneg	%xcc,	0x7
	fmovrsgez	%g6,	%f2,	%f22
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	fone	%f14
	sll	%i6,	0x07,	%l1
	movrlez	%l4,	0x0F2,	%o5
	movpos	%xcc,	%i2,	%o7
	ba,pt	%xcc,	loop_571
	array8	%o1,	%i0,	%g3
	movle	%icc,	%g4,	%l2
	te	%icc,	0x0
loop_571:
	mova	%xcc,	%g1,	%o3
	movrgz	%o6,	%i3,	%g2
	array32	%l0,	%o4,	%l3
	stbar
	orncc	%g7,	%o0,	%i4
	edge16l	%l5,	%l6,	%g5
	fble,a	%fcc1,	loop_572
	tgu	%icc,	0x3
	fmovrdne	%i5,	%f10,	%f18
	add	%o2,	0x1542,	%i1
loop_572:
	fmovsne	%xcc,	%f5,	%f28
	sra	%i7,	0x0D,	%g6
	ldsh	[%l7 + 0x76],	%i6
	tvs	%xcc,	0x5
	wr	%g0,	0x88,	%asi
	sta	%f21,	[%l7 + 0x30] %asi
	edge16n	%l1,	%l4,	%o5
	movle	%icc,	%i2,	%o7
	nop
	fitod	%f8,	%f26
	fdtox	%f26,	%f18
	edge32	%o1,	%i0,	%g3
	ldsh	[%l7 + 0x5C],	%l2
	sub	%g4,	0x115A,	%o3
	set	0x210, %i3
	ldxa	[%g0 + %i3] 0x52,	%g1
	edge16ln	%o6,	%g2,	%i3
	movge	%icc,	%o4,	%l0
	fmovrse	%l3,	%f3,	%f13
	fmovrslz	%o0,	%f13,	%f9
	wr	%g0,	0xea,	%asi
	stba	%i4,	[%l7 + 0x17] %asi
	membar	#Sync
	mova	%icc,	%g7,	%l6
	stx	%l5,	[%l7 + 0x48]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x70, %o6
	swapa	[%l7 + %o6] 0x04,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o2,	0x1417,	%i5
	set	0x110, %g7
	ldxa	[%g0 + %g7] 0x21,	%i1
	addccc	%g6,	0x08A4,	%i6
	sub	%l1,	%l4,	%o5
	for	%f20,	%f10,	%f8
	sra	%i2,	%o7,	%o1
	set	0x28, %o3
	stxa	%i0,	[%l7 + %o3] 0xea
	membar	#Sync
	subc	%g3,	%i7,	%l2
	movg	%xcc,	%g4,	%g1
	movre	%o6,	0x073,	%o3
	stbar
	movn	%xcc,	%g2,	%o4
	movrne	%i3,	%l0,	%l3
	tge	%xcc,	0x3
	tne	%xcc,	0x6
	tsubcctv	%i4,	%o0,	%g7
	andcc	%l5,	%g5,	%o2
	addcc	%i5,	0x033B,	%i1
	edge16l	%g6,	%i6,	%l1
	nop
	setx	loop_573,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orcc	%l6,	0x157D,	%o5
	fmovrdgez	%l4,	%f20,	%f4
	udivx	%i2,	0x04A7,	%o7
loop_573:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i0
	ba,pn	%xcc,	loop_574
	edge32l	%g3,	%o1,	%i7
	brgz	%l2,	loop_575
	fmovrsgez	%g4,	%f11,	%f1
loop_574:
	movle	%icc,	%g1,	%o3
	umulcc	%o6,	0x0644,	%o4
loop_575:
	nop
	set	0x10, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0x1
	movcs	%icc,	%i3,	%l0
	set	0x72, %g5
	stba	%l3,	[%l7 + %g5] 0x14
	xor	%i4,	0x05D2,	%g7
	movpos	%xcc,	%l5,	%g5
	fble,a	%fcc0,	loop_576
	nop
	setx	0x10703D4C,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	movne	%xcc,	%o2,	%o0
	fbug	%fcc2,	loop_577
loop_576:
	bleu,a,pt	%xcc,	loop_578
	fmul8ulx16	%f14,	%f0,	%f28
	tl	%icc,	0x3
loop_577:
	edge8	%i5,	%g6,	%i1
loop_578:
	sdiv	%l1,	0x10CB,	%l6
	movcs	%xcc,	%o5,	%l4
	set	0x30, %l2
	ldxa	[%g0 + %l2] 0x20,	%i2
	bcs	%icc,	loop_579
	ldsw	[%l7 + 0x78],	%i6
	edge8ln	%o7,	%i0,	%o1
	fmovscc	%xcc,	%f9,	%f27
loop_579:
	smulcc	%g3,	%l2,	%g4
	fxnor	%f8,	%f12,	%f14
	subcc	%g1,	%i7,	%o6
	edge8l	%o4,	%g2,	%o3
	movvs	%xcc,	%l0,	%i3
	sdiv	%i4,	0x197D,	%l3
	fmovsge	%icc,	%f16,	%f20
	edge32	%g7,	%l5,	%g5
	nop
	setx loop_580, %l0, %l1
	jmpl %l1, %o0
	movneg	%xcc,	%i5,	%o2
	fmovdcc	%icc,	%f30,	%f12
	movvs	%xcc,	%g6,	%l1
loop_580:
	nop
	setx loop_581, %l0, %l1
	jmpl %l1, %i1
	umulcc	%l6,	0x09EE,	%o5
	nop
	setx	0xD3EAD73A307C5FEB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	lduw	[%l7 + 0x60],	%i2
loop_581:
	movge	%icc,	%i6,	%l4
	sdivx	%o7,	0x1DCC,	%o1
	movn	%icc,	%g3,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%icc,	%f21,	%f19
	taddcc	%g4,	0x14C4,	%i0
	array32	%i7,	%o6,	%g1
	or	%o4,	0x0CF2,	%o3
	array32	%g2,	%l0,	%i4
	sra	%l3,	0x1F,	%g7
	bcc,pt	%xcc,	loop_582
	sdivx	%l5,	0x1426,	%i3
	fbue	%fcc1,	loop_583
	movrgez	%g5,	0x247,	%o0
loop_582:
	mulx	%i5,	%g6,	%l1
	wr	%g0,	0x88,	%asi
	stxa	%i1,	[%l7 + 0x38] %asi
loop_583:
	srl	%o2,	%l6,	%o5
	orn	%i2,	%i6,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,pt	%icc,	loop_584
	mova	%icc,	%l4,	%o1
	movre	%l2,	0x30C,	%g4
	ble	%xcc,	loop_585
loop_584:
	movn	%xcc,	%g3,	%i7
	xnor	%o6,	%g1,	%o4
	sll	%i0,	%o3,	%l0
loop_585:
	ldsb	[%l7 + 0x6A],	%g2
	addcc	%i4,	0x08B1,	%g7
	movle	%xcc,	%l5,	%i3
	addc	%g5,	0x17EF,	%o0
	nop
	setx	loop_586,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%l3,	%g6,	%i5
	srlx	%l1,	%o2,	%l6
	umul	%o5,	0x00DE,	%i1
loop_586:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f9,	[%l7 + 0x20] %asi
	tgu	%xcc,	0x6
	brlez,a	%i6,	loop_587
	tvs	%xcc,	0x5
	nop
	fitos	%f17,	%f5
	movgu	%xcc,	%o7,	%l4
loop_587:
	fornot1s	%f4,	%f24,	%f22
	bleu	loop_588
	fbo,a	%fcc1,	loop_589
	stw	%i2,	[%l7 + 0x4C]
	movvs	%icc,	%l2,	%o1
loop_588:
	nop
	setx	0x0497FAAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xF5E4677A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f21,	%f8
loop_589:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x54] %asi,	%g4
	tleu	%xcc,	0x7
	nop
	setx	0xA94C5954005D93AD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	bvs	%icc,	loop_590
	te	%xcc,	0x7
	movcs	%xcc,	%i7,	%g3
	fblg,a	%fcc3,	loop_591
loop_590:
	fcmpeq16	%f10,	%f14,	%o6
	ldsh	[%l7 + 0x70],	%g1
	movrlez	%o4,	0x0BB,	%o3
loop_591:
	xorcc	%i0,	%l0,	%g2
	or	%g7,	%i4,	%l5
	fors	%f15,	%f2,	%f31
	fpack32	%f2,	%f2,	%f16
	movre	%g5,	%i3,	%l3
	fbo	%fcc0,	loop_592
	mulscc	%o0,	%g6,	%l1
	nop
	setx	0xC06E806E,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fmovrsne	%i5,	%f17,	%f11
loop_592:
	nop
	setx	0xF04355AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	movrne	%o2,	%o5,	%i1
	umulcc	%l6,	0x1A2B,	%i6
	fmovscc	%xcc,	%f27,	%f7
	edge8l	%o7,	%i2,	%l4
	tneg	%xcc,	0x1
	tsubcctv	%o1,	%l2,	%g4
	flush	%l7 + 0x40
	movvc	%xcc,	%g3,	%i7
	orn	%o6,	%o4,	%o3
	movrlez	%g1,	0x3CA,	%l0
	fpadd32	%f30,	%f16,	%f26
	mova	%icc,	%g2,	%i0
	add	%i4,	0x1B1D,	%l5
	tvs	%icc,	0x3
	fpmerge	%f30,	%f30,	%f14
	fnot2	%f8,	%f8
	brgz,a	%g5,	loop_593
	membar	0x5A
	sth	%i3,	[%l7 + 0x52]
	subc	%l3,	%o0,	%g7
loop_593:
	nop
	set	0x30, %l5
	ldda	[%l7 + %l5] 0x2a,	%l0
	orncc	%i5,	%g6,	%o5
	nop
	setx	loop_594,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bl,a	loop_595
	stx	%i1,	[%l7 + 0x70]
	movn	%xcc,	%l6,	%i6
loop_594:
	movgu	%xcc,	%o2,	%i2
loop_595:
	tneg	%xcc,	0x7
	sir	0x0D2C
	ldstub	[%l7 + 0x10],	%l4
	nop
	set	0x74, %i1
	stb	%o1,	[%l7 + %i1]
	bgu,a	%icc,	loop_596
	tle	%xcc,	0x3
	movre	%l2,	%g4,	%o7
	xorcc	%g3,	%o6,	%i7
loop_596:
	nop
	set	0x45, %o0
	stba	%o3,	[%l7 + %o0] 0xe3
	membar	#Sync
	edge32	%o4,	%l0,	%g2
	std	%f30,	[%l7 + 0x28]
	tpos	%icc,	0x5
	edge16n	%g1,	%i0,	%l5
	fmovrdlez	%i4,	%f18,	%f26
	set	0x68, %o1
	swapa	[%l7 + %o1] 0x0c,	%g5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ta	%icc,	0x2
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l3
	movre	%i3,	%g7,	%l1
	nop
	setx	0xF82427C43817300D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xD93B87BE52B89C8C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f14,	%f4
	set	0x60, %o7
	stwa	%i5,	[%l7 + %o7] 0x15
	orn	%o0,	0x03EF,	%o5
	srlx	%i1,	0x0D,	%l6
	movgu	%icc,	%i6,	%o2
	movrlez	%g6,	%l4,	%o1
	tne	%xcc,	0x4
	xorcc	%i2,	%g4,	%l2
	movgu	%icc,	%o7,	%o6
	tsubcctv	%g3,	%o3,	%i7
	lduh	[%l7 + 0x10],	%o4
	edge8n	%l0,	%g1,	%i0
	movvs	%xcc,	%l5,	%g2
	and	%i4,	0x0EA2,	%g5
	fblg,a	%fcc2,	loop_597
	orn	%l3,	0x0715,	%i3
	fbn	%fcc1,	loop_598
	nop
	setx	0xD4A06A450054EA8E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_597:
	fmovdge	%icc,	%f24,	%f0
	movrgez	%g7,	0x3FF,	%l1
loop_598:
	fmovse	%xcc,	%f30,	%f20
	fblg,a	%fcc2,	loop_599
	sll	%o0,	%o5,	%i1
	xnorcc	%l6,	%i5,	%i6
	brnz,a	%g6,	loop_600
loop_599:
	movg	%icc,	%l4,	%o1
	fornot2	%f26,	%f18,	%f10
	popc	%o2,	%i2
loop_600:
	nop
	setx loop_601, %l0, %l1
	jmpl %l1, %l2
	tleu	%xcc,	0x3
	addccc	%o7,	%g4,	%o6
	flush	%l7 + 0x68
loop_601:
	fmul8sux16	%f12,	%f14,	%f4
	movneg	%icc,	%o3,	%g3
	fbg,a	%fcc2,	loop_602
	ld	[%l7 + 0x70],	%f19
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f2,	%f15,	%f13
loop_602:
	andcc	%o4,	%l0,	%i7
	fmovdvc	%icc,	%f29,	%f26
	movn	%xcc,	%g1,	%l5
	movleu	%icc,	%i0,	%i4
	fnot1s	%f8,	%f31
	fblg	%fcc1,	loop_603
	and	%g5,	%g2,	%l3
	fmovrsgz	%g7,	%f4,	%f21
	wr	%g0,	0x89,	%asi
	sta	%f28,	[%l7 + 0x6C] %asi
loop_603:
	sdivx	%l1,	0x1849,	%i3
	sllx	%o5,	0x03,	%i1
	tg	%icc,	0x0
	nop
	setx	0x004FEA1D,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	edge16n	%l6,	%i5,	%i6
	fmovsl	%icc,	%f27,	%f28
	bne,a,pn	%icc,	loop_604
	movge	%xcc,	%o0,	%g6
	fbo,a	%fcc3,	loop_605
	stbar
loop_604:
	fnot1s	%f17,	%f2
	array16	%l4,	%o1,	%i2
loop_605:
	fbul	%fcc0,	loop_606
	stw	%l2,	[%l7 + 0x48]
	movvc	%xcc,	%o7,	%g4
	bvc,a,pn	%xcc,	loop_607
loop_606:
	ble,a,pt	%icc,	loop_608
	bneg,a	%icc,	loop_609
	fbue	%fcc3,	loop_610
loop_607:
	movcc	%xcc,	%o6,	%o3
loop_608:
	movne	%xcc,	%o2,	%g3
loop_609:
	move	%xcc,	%o4,	%l0
loop_610:
	srax	%i7,	0x0E,	%l5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%i4
	nop
	setx	0x333BDBA1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x97D6E6F1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f19,	%f27
	addcc	%i0,	%g5,	%l3
	movre	%g2,	0x2B0,	%g7
	xor	%i3,	%o5,	%i1
	addcc	%l1,	%i5,	%l6
	xorcc	%o0,	0x003E,	%i6
	fmovrdlez	%g6,	%f12,	%f26
	fmovrdgez	%l4,	%f26,	%f18
	movl	%xcc,	%i2,	%l2
	brlz	%o1,	loop_611
	lduw	[%l7 + 0x2C],	%g4
	sethi	0x13FB,	%o6
	xnor	%o3,	%o2,	%g3
loop_611:
	alignaddrl	%o4,	%o7,	%i7
	movneg	%icc,	%l5,	%g1
	tsubcctv	%i4,	0x0133,	%l0
	fbn,a	%fcc2,	loop_612
	sll	%i0,	0x15,	%l3
	tcs	%icc,	0x7
	fmovsleu	%xcc,	%f25,	%f20
loop_612:
	addc	%g5,	%g7,	%g2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x88,	%o5,	%i3
	movneg	%icc,	%l1,	%i5
	be,a	%icc,	loop_613
	udivcc	%l6,	0x1B09,	%i1
	tvs	%icc,	0x0
	fmovrdlz	%o0,	%f24,	%f24
loop_613:
	edge16n	%g6,	%l4,	%i2
	tvs	%xcc,	0x2
	edge16ln	%l2,	%i6,	%g4
	bvc,pn	%xcc,	loop_614
	brz,a	%o6,	loop_615
	fmovsa	%xcc,	%f1,	%f13
	sir	0x0D52
loop_614:
	fnegd	%f16,	%f16
loop_615:
	stw	%o1,	[%l7 + 0x20]
	swap	[%l7 + 0x34],	%o2
	subc	%o3,	%g3,	%o7
	taddcctv	%o4,	%l5,	%g1
	nop
	setx	0xD4A07CBBF41FAB84,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f20
	fpsub16	%f0,	%f10,	%f26
	edge32ln	%i7,	%i4,	%l0
	fmovsleu	%xcc,	%f13,	%f13
	xor	%i0,	%g5,	%l3
	andcc	%g2,	%o5,	%i3
	set	0x10, %g2
	ldswa	[%l7 + %g2] 0x89,	%g7
	udiv	%i5,	0x1310,	%l1
	ldx	[%l7 + 0x18],	%i1
	fmovdvs	%icc,	%f23,	%f1
	set	0x0, %o4
	ldxa	[%g0 + %o4] 0x58,	%o0
	edge8	%l6,	%l4,	%i2
	movleu	%xcc,	%g6,	%l2
	ldd	[%l7 + 0x10],	%g4
	fandnot1s	%f8,	%f9,	%f27
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	orn	%o1,	%o6,	%o3
	srlx	%g3,	0x09,	%o7
	movgu	%icc,	%o4,	%o2
	add	%g1,	%i7,	%i4
	array8	%l0,	%l5,	%g5
	brz	%i0,	loop_616
	movgu	%icc,	%l3,	%o5
	fbl,a	%fcc0,	loop_617
	tle	%icc,	0x5
loop_616:
	fpadd32s	%f29,	%f4,	%f5
	movrlez	%i3,	%g2,	%g7
loop_617:
	fsrc2s	%f0,	%f18
	tleu	%xcc,	0x0
	fmovse	%xcc,	%f3,	%f8
	edge16n	%i5,	%i1,	%o0
	movvs	%icc,	%l6,	%l1
	edge32	%l4,	%i2,	%g6
	edge32	%l2,	%g4,	%i6
	movneg	%xcc,	%o1,	%o3
	mova	%icc,	%g3,	%o6
	add	%o4,	%o7,	%o2
	pdist	%f26,	%f30,	%f8
	ble,pt	%icc,	loop_618
	nop
	setx loop_619, %l0, %l1
	jmpl %l1, %i7
	edge8ln	%i4,	%l0,	%l5
	orcc	%g1,	0x0DA8,	%i0
loop_618:
	udivcc	%g5,	0x1F7B,	%o5
loop_619:
	fba,a	%fcc2,	loop_620
	array8	%i3,	%g2,	%l3
	bpos,a	loop_621
	movre	%g7,	%i5,	%i1
loop_620:
	fmovdcc	%icc,	%f15,	%f13
	fbg,a	%fcc2,	loop_622
loop_621:
	fcmpgt32	%f24,	%f20,	%l6
	te	%icc,	0x1
	alignaddr	%o0,	%l4,	%i2
loop_622:
	tvc	%icc,	0x6
	fones	%f14
	sub	%l1,	%g6,	%l2
	edge8	%i6,	%g4,	%o3
	nop
	setx	0x7A17EC3E102E4E87,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xA00FF54C085811C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f24,	%f0
	tvc	%xcc,	0x0
	bpos	%xcc,	loop_623
	addccc	%o1,	0x07E1,	%o6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
loop_623:
	fbo,a	%fcc3,	loop_624
	subcc	%o4,	0x05F8,	%o7
	andncc	%i7,	%i4,	%o2
	fbne	%fcc2,	loop_625
loop_624:
	tleu	%icc,	0x7
	sllx	%l0,	0x02,	%g1
	subc	%i0,	0x09CC,	%l5
loop_625:
	movrgez	%g5,	0x0C6,	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g2,	%l3
	ldsw	[%l7 + 0x58],	%g7
	fxnor	%f20,	%f2,	%f22
	popc	%o5,	%i1
	movneg	%xcc,	%l6,	%o0
	smul	%i5,	0x12D9,	%l4
	movrgz	%i2,	%l1,	%l2
	movre	%g6,	0x32F,	%i6
	fandnot1	%f10,	%f10,	%f4
	umul	%o3,	%o1,	%o6
	movre	%g4,	%g3,	%o7
	xnorcc	%i7,	0x09F8,	%i4
	wr	%g0,	0x2b,	%asi
	stha	%o2,	[%l7 + 0x7E] %asi
	membar	#Sync
	ldub	[%l7 + 0x1E],	%o4
	xor	%g1,	0x1C46,	%i0
	movre	%l0,	0x0F7,	%l5
	movpos	%icc,	%i3,	%g5
	nop
	fitos	%f11,	%f24
	fstod	%f24,	%f30
	smulcc	%l3,	0x0CD6,	%g7
	mulx	%g2,	0x1D22,	%i1
	andcc	%o5,	0x19F3,	%l6
	andncc	%o0,	%i5,	%l4
	fbo,a	%fcc1,	loop_626
	nop
	setx loop_627, %l0, %l1
	jmpl %l1, %l1
	tleu	%xcc,	0x6
	edge16l	%i2,	%l2,	%i6
loop_626:
	nop
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x04,	%f16
loop_627:
	umulcc	%g6,	%o1,	%o6
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
	tge	%icc,	0x3
	udivx	%g3,	0x0528,	%o7
	sllx	%i7,	0x1A,	%o3
	be,a	loop_628
	edge16l	%i4,	%o4,	%o2
	udivcc	%g1,	0x1BAF,	%l0
	udivx	%i0,	0x1B75,	%i3
loop_628:
	fmovdn	%icc,	%f30,	%f13
	addc	%l5,	%g5,	%g7
	set	0x60, %l0
	prefetcha	[%l7 + %l0] 0x89,	 0x1
	fpadd16	%f16,	%f24,	%f28
	tvc	%icc,	0x2
	sllx	%i1,	%g2,	%l6
	sdiv	%o5,	0x0C47,	%i5
	sdiv	%l4,	0x1DF8,	%o0
	fbul,a	%fcc2,	loop_629
	ta	%icc,	0x3
	movcc	%xcc,	%l1,	%i2
	fzero	%f12
loop_629:
	array32	%i6,	%g6,	%o1
	sub	%o6,	%l2,	%g4
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x52] %asi,	%o7
	brlz	%i7,	loop_630
	swap	[%l7 + 0x74],	%g3
	subccc	%i4,	0x17A5,	%o3
	tcc	%xcc,	0x6
loop_630:
	andcc	%o2,	0x013F,	%g1
	tneg	%xcc,	0x0
	srax	%o4,	0x1B,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f30,	%f4,	%f6
	movn	%icc,	%l0,	%l5
	movrgez	%i3,	0x300,	%g5
	tpos	%xcc,	0x0
	edge16l	%g7,	%l3,	%i1
	udivx	%g2,	0x0603,	%o5
	nop
	setx	0x277DD631,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x84E2D98A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f16,	%f15
	fcmpeq16	%f8,	%f4,	%i5
	andn	%l6,	0x1EC1,	%o0
	udiv	%l4,	0x04DD,	%l1
	movl	%icc,	%i2,	%i6
	tsubcctv	%g6,	0x0E6A,	%o1
	taddcctv	%l2,	0x0197,	%g4
	movrgz	%o6,	0x01D,	%o7
	subcc	%g3,	%i4,	%o3
	array8	%o2,	%i7,	%o4
	nop
	setx	loop_631,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdgu	%icc,	%f19,	%f29
	stbar
	bvs,pn	%xcc,	loop_632
loop_631:
	srax	%g1,	0x07,	%l0
	mulscc	%l5,	%i3,	%i0
	sdivcc	%g5,	0x033E,	%l3
loop_632:
	mulx	%g7,	%i1,	%g2
	tpos	%xcc,	0x3
	stw	%i5,	[%l7 + 0x34]
	fcmpeq16	%f24,	%f22,	%l6
	tl	%icc,	0x2
	srl	%o0,	%o5,	%l1
	add	%i2,	%i6,	%l4
	sdiv	%o1,	0x0744,	%g6
	sdivx	%l2,	0x1582,	%o6
	andcc	%o7,	0x1AF9,	%g3
	movn	%xcc,	%i4,	%g4
	lduw	[%l7 + 0x24],	%o3
	fexpand	%f5,	%f16
	tvc	%xcc,	0x0
	mulx	%o2,	0x1F34,	%o4
	set	0x2E, %l3
	lduha	[%l7 + %l3] 0x89,	%g1
	alignaddrl	%i7,	%l5,	%i3
	orcc	%i0,	0x031E,	%l0
	movvc	%icc,	%g5,	%g7
	alignaddrl	%l3,	%i1,	%g2
	udiv	%l6,	0x1C70,	%i5
	bshuffle	%f8,	%f20,	%f24
	andn	%o5,	%o0,	%i2
	sll	%l1,	%i6,	%l4
	brgz	%o1,	loop_633
	fpsub16	%f10,	%f28,	%f28
	swap	[%l7 + 0x1C],	%g6
	brlez,a	%o6,	loop_634
loop_633:
	fmul8x16	%f13,	%f0,	%f20
	ldsh	[%l7 + 0x7E],	%o7
	nop
	fitos	%f1,	%f9
loop_634:
	nop
	setx	0x55EF5826306AB59F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	set	0x3A, %g4
	ldsha	[%l7 + %g4] 0x18,	%l2
	sdiv	%g3,	0x080C,	%i4
	movneg	%icc,	%o3,	%g4
	sdiv	%o2,	0x076F,	%o4
	fxors	%f2,	%f8,	%f0
	xnor	%g1,	%i7,	%i3
	tcc	%icc,	0x0
	tcs	%xcc,	0x2
	bcs,a	%xcc,	loop_635
	tle	%icc,	0x6
	smulcc	%i0,	0x0A0C,	%l0
	edge16	%g5,	%g7,	%l3
loop_635:
	add	%i1,	0x017F,	%g2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l5
	fmovsg	%xcc,	%f3,	%f25
	movvc	%icc,	%l6,	%o5
	fxnor	%f22,	%f14,	%f12
	bge	loop_636
	edge16ln	%o0,	%i5,	%l1
	fmovspos	%icc,	%f1,	%f26
	edge32	%i6,	%l4,	%o1
loop_636:
	fmuld8sux16	%f22,	%f22,	%f4
	tne	%icc,	0x1
	nop
	setx	0x704E203D,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	subcc	%i2,	%o6,	%o7
	fcmpne16	%f26,	%f28,	%l2
	set	0x08, %l6
	prefetcha	[%l7 + %l6] 0x80,	 0x2
	add	%g3,	0x0FC3,	%i4
	fpadd16s	%f14,	%f19,	%f0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x28] %asi,	%o3
	set	0x65, %o2
	lduba	[%l7 + %o2] 0x0c,	%o2
	array16	%o4,	%g1,	%g4
	or	%i7,	%i0,	%l0
	tge	%icc,	0x2
	movvc	%xcc,	%i3,	%g5
	edge32ln	%g7,	%i1,	%g2
	membar	0x4B
	tl	%xcc,	0x3
	bg	%xcc,	loop_637
	edge32l	%l5,	%l6,	%o5
	smul	%o0,	%l3,	%i5
	edge16ln	%i6,	%l4,	%o1
loop_637:
	st	%f1,	[%l7 + 0x60]
	fblg,a	%fcc1,	loop_638
	movn	%xcc,	%l1,	%o6
	andcc	%i2,	0x1847,	%l2
	fandnot2	%f12,	%f24,	%f28
loop_638:
	edge32l	%o7,	%g3,	%g6
	sdivx	%o3,	0x0A4B,	%o2
	add	%i4,	0x1B14,	%g1
	tcc	%xcc,	0x2
	srlx	%g4,	0x15,	%i7
	nop
	fitos	%f1,	%f26
	fstod	%f26,	%f16
	movneg	%xcc,	%o4,	%l0
	mova	%icc,	%i0,	%g5
	fpmerge	%f3,	%f8,	%f24
	set	0x48, %g3
	sta	%f15,	[%l7 + %g3] 0x88
	movrlz	%g7,	0x099,	%i3
	smulcc	%i1,	0x04EA,	%g2
	tn	%icc,	0x1
	bg,a,pn	%icc,	loop_639
	fpsub32	%f16,	%f8,	%f2
	sir	0x0084
	fmovscc	%xcc,	%f2,	%f2
loop_639:
	fsrc2s	%f4,	%f22
	fnot2	%f14,	%f4
	tn	%xcc,	0x0
	fmovdneg	%icc,	%f17,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l6,	0x04B9,	%o5
	bne,pn	%xcc,	loop_640
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%l5
	movn	%xcc,	%o0,	%l3
	movrgez	%i5,	0x2C0,	%i6
loop_640:
	fbu,a	%fcc3,	loop_641
	sdivx	%o1,	0x0C5D,	%l1
	fcmpeq16	%f0,	%f30,	%o6
	nop
	fitos	%f5,	%f6
	fstod	%f6,	%f16
loop_641:
	taddcctv	%i2,	0x1738,	%l2
	fbo	%fcc3,	loop_642
	fandnot2s	%f26,	%f25,	%f24
	tvs	%xcc,	0x4
	fbne	%fcc0,	loop_643
loop_642:
	tcc	%xcc,	0x2
	subcc	%l4,	%g3,	%g6
	sllx	%o7,	%o3,	%i4
loop_643:
	fnegd	%f28,	%f14
	taddcctv	%o2,	%g4,	%i7
	mulx	%g1,	0x15A9,	%o4
	and	%l0,	%i0,	%g5
	or	%g7,	0x15A8,	%i1
	tsubcctv	%i3,	%g2,	%o5
	movrgz	%l6,	%o0,	%l5
	nop
	setx	0x74048F69,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f13
	tcc	%icc,	0x5
	movrlez	%l3,	%i5,	%o1
	movrlez	%l1,	%o6,	%i2
	movgu	%xcc,	%i6,	%l2
	movrlz	%g3,	%g6,	%l4
	taddcc	%o3,	0x0846,	%i4
	mulscc	%o7,	0x1D46,	%o2
	tcc	%xcc,	0x2
	sdivx	%g4,	0x0E6D,	%i7
	movrne	%g1,	%l0,	%i0
	edge16	%o4,	%g5,	%i1
	tneg	%icc,	0x3
	subccc	%i3,	%g2,	%g7
	tl	%icc,	0x2
	subc	%o5,	0x0C64,	%o0
	bl,pn	%xcc,	loop_644
	movre	%l6,	%l3,	%l5
	tg	%xcc,	0x6
	edge32l	%o1,	%l1,	%o6
loop_644:
	bgu,pt	%icc,	loop_645
	fmovrslz	%i5,	%f10,	%f27
	orncc	%i2,	%i6,	%g3
	nop
	fitod	%f0,	%f16
	fdtoi	%f16,	%f23
loop_645:
	movge	%icc,	%g6,	%l4
	ba,a,pn	%xcc,	loop_646
	edge32n	%o3,	%i4,	%o7
	taddcc	%o2,	0x0D57,	%l2
	fmovrsne	%i7,	%f18,	%f4
loop_646:
	edge8	%g4,	%g1,	%l0
	fmovdcc	%xcc,	%f3,	%f26
	sub	%i0,	0x04D1,	%g5
	fmovdpos	%icc,	%f17,	%f10
	membar	0x61
	fmovsg	%xcc,	%f24,	%f7
	andn	%i1,	0x017F,	%o4
	set	0x18, %l1
	ldxa	[%g0 + %l1] 0x50,	%i3
	subc	%g7,	%g2,	%o0
	movrlez	%o5,	%l6,	%l3
	umulcc	%l5,	%o1,	%l1
	edge8n	%i5,	%o6,	%i2
	call	loop_647
	ta	%icc,	0x4
	fpsub32	%f4,	%f4,	%f0
	bpos,a	%icc,	loop_648
loop_647:
	edge32n	%i6,	%g3,	%l4
	edge32l	%o3,	%i4,	%o7
	fsrc2s	%f24,	%f30
loop_648:
	fmul8x16al	%f26,	%f16,	%f26
	addcc	%g6,	%l2,	%i7
	smul	%o2,	%g1,	%l0
	stbar
	ldx	[%l7 + 0x08],	%i0
	fbue,a	%fcc0,	loop_649
	movg	%xcc,	%g4,	%g5
	tleu	%xcc,	0x0
	edge8n	%i1,	%i3,	%g7
loop_649:
	xnorcc	%o4,	0x16BF,	%g2
	or	%o5,	0x07C0,	%o0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x20] %asi,	%l6
	bn	%xcc,	loop_650
	tn	%xcc,	0x4
	subccc	%l5,	0x147A,	%o1
	orncc	%l1,	0x15C6,	%i5
loop_650:
	edge16n	%o6,	%i2,	%l3
	fnor	%f16,	%f12,	%f8
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f20
	smul	%i6,	%l4,	%o3
	bne,a,pt	%xcc,	loop_651
	nop
	fitod	%f8,	%f26
	fdtox	%f26,	%f22
	movge	%xcc,	%g3,	%o7
	edge32	%g6,	%i4,	%i7
loop_651:
	addcc	%o2,	%l2,	%l0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%i0
	popc	%g1,	%g5
	movpos	%xcc,	%i1,	%i3
	fxors	%f26,	%f30,	%f26
	fpsub32	%f12,	%f10,	%f8
	brnz	%g4,	loop_652
	edge8ln	%o4,	%g2,	%o5
	movpos	%icc,	%g7,	%l6
	fandnot2s	%f14,	%f2,	%f25
loop_652:
	tsubcctv	%l5,	0x1734,	%o1
	movrgz	%l1,	0x056,	%o0
	fmovsg	%icc,	%f26,	%f31
	array32	%o6,	%i5,	%i2
	tgu	%icc,	0x3
	fcmpgt16	%f14,	%f0,	%l3
	fors	%f16,	%f1,	%f25
	add	%i6,	%l4,	%o3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x74] %asi,	%g3
	edge16l	%g6,	%i4,	%o7
	fzero	%f26
	tsubcctv	%i7,	0x0CBA,	%o2
	ldx	[%l7 + 0x60],	%l2
	tl	%icc,	0x5
	st	%f28,	[%l7 + 0x70]
	subc	%l0,	%i0,	%g5
	movrgz	%g1,	0x1D2,	%i3
	movvc	%icc,	%g4,	%o4
	te	%xcc,	0x5
	alignaddr	%i1,	%o5,	%g2
	add	%l6,	0x015B,	%g7
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf0,	%f0
	faligndata	%f24,	%f8,	%f18
	fnegs	%f22,	%f24
	edge8n	%o1,	%l5,	%o0
	movgu	%xcc,	%o6,	%i5
	fornot2s	%f10,	%f20,	%f3
	movrne	%l1,	0x0D6,	%l3
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	ble	%icc,	loop_653
	nop
	setx	0xAEBBA015E7605B61,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x3A07462A52A681D6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f22,	%f30
	movrlez	%i6,	%i2,	%l4
	srl	%g3,	%o3,	%i4
loop_653:
	tn	%icc,	0x7
	or	%o7,	%i7,	%g6
	prefetch	[%l7 + 0x64],	 0x2
	umul	%o2,	%l2,	%l0
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x66] %asi,	%i0
	movrne	%g1,	%g5,	%i3
	add	%g4,	0x11DC,	%i1
	ldsh	[%l7 + 0x32],	%o5
	smulcc	%g2,	%l6,	%g7
	fmovrdgez	%o1,	%f10,	%f12
	nop
	set	0x78, %i5
	sth	%l5,	[%l7 + %i5]
	addcc	%o4,	%o6,	%o0
	fmovdcc	%icc,	%f23,	%f31
	movn	%xcc,	%i5,	%l1
	and	%i6,	%i2,	%l4
	bleu	%icc,	loop_654
	tsubcctv	%g3,	0x0CD5,	%l3
	bcc,a	%icc,	loop_655
	edge16l	%o3,	%o7,	%i4
loop_654:
	fbn,a	%fcc0,	loop_656
	move	%icc,	%g6,	%o2
loop_655:
	tsubcc	%l2,	%i7,	%i0
	ldstub	[%l7 + 0x51],	%g1
loop_656:
	fmovdge	%xcc,	%f17,	%f20
	movrlez	%g5,	0x29F,	%l0
	tsubcctv	%i3,	0x1C37,	%g4
	fbl,a	%fcc0,	loop_657
	movg	%icc,	%o5,	%g2
	sdivx	%l6,	0x1361,	%i1
	fcmple32	%f18,	%f16,	%g7
loop_657:
	fble,a	%fcc0,	loop_658
	movl	%xcc,	%l5,	%o1
	tsubcctv	%o4,	%o0,	%o6
	fbule,a	%fcc2,	loop_659
loop_658:
	fexpand	%f13,	%f12
	fmuld8sux16	%f14,	%f13,	%f22
	sdiv	%l1,	0x17CB,	%i6
loop_659:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i5,	0x1A81,	%i2
	edge16l	%g3,	%l3,	%o3
	tleu	%xcc,	0x4
	movrgz	%l4,	0x386,	%i4
	addc	%o7,	0x0E32,	%o2
	fnot2	%f24,	%f16
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f18
	mulx	%l2,	0x0755,	%i7
	fpmerge	%f14,	%f11,	%f24
	add	%i0,	%g6,	%g1
	movvc	%icc,	%l0,	%i3
	fornot2s	%f0,	%f4,	%f15
	tge	%xcc,	0x3
	fmovsgu	%xcc,	%f20,	%f17
	edge32l	%g4,	%o5,	%g5
	fmovde	%xcc,	%f9,	%f18
	sethi	0x155D,	%l6
	movgu	%icc,	%i1,	%g2
	bneg,a	%icc,	loop_660
	std	%f0,	[%l7 + 0x08]
	alignaddrl	%l5,	%o1,	%o4
	udivcc	%o0,	0x01A0,	%g7
loop_660:
	fbul,a	%fcc1,	loop_661
	fmovsgu	%icc,	%f14,	%f1
	edge16l	%o6,	%i6,	%i5
	movle	%icc,	%i2,	%l1
loop_661:
	movl	%xcc,	%g3,	%o3
	taddcctv	%l3,	0x023A,	%i4
	fmovdge	%icc,	%f30,	%f15
	edge16	%o7,	%l4,	%o2
	std	%f24,	[%l7 + 0x10]
	addccc	%l2,	%i0,	%i7
	srax	%g1,	0x18,	%g6
	tpos	%icc,	0x4
	movcs	%xcc,	%i3,	%g4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x58] %asi,	%o5
	popc	%l0,	%g5
	brlez,a	%l6,	loop_662
	andn	%g2,	%i1,	%o1
	tle	%xcc,	0x3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%l5,	%o4
loop_662:
	fabss	%f26,	%f25
	movneg	%xcc,	%g7,	%o0
	tle	%icc,	0x5
	fpadd32	%f0,	%f20,	%f18
	mulscc	%o6,	0x1B98,	%i5
	wr	%g0,	0x10,	%asi
	stba	%i2,	[%l7 + 0x50] %asi
	edge8n	%l1,	%g3,	%o3
	movvs	%icc,	%l3,	%i4
	orn	%i6,	%o7,	%l4
	movgu	%icc,	%o2,	%i0
	orn	%i7,	%l2,	%g6
	movcc	%icc,	%i3,	%g4
	fbn	%fcc2,	loop_663
	sra	%g1,	0x0D,	%o5
	edge8ln	%g5,	%l6,	%l0
	edge32	%i1,	%g2,	%o1
loop_663:
	or	%o4,	0x0991,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o0,	%o6
	movneg	%icc,	%i5,	%l5
	movgu	%xcc,	%l1,	%g3
	nop
	setx	loop_664,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbo	%fcc1,	loop_665
	fbg	%fcc2,	loop_666
	tvc	%xcc,	0x3
loop_664:
	nop
	set	0x42, %g1
	lduha	[%l7 + %g1] 0x81,	%i2
loop_665:
	xnor	%o3,	%i4,	%i6
loop_666:
	movcc	%xcc,	%l3,	%l4
	mova	%icc,	%o7,	%o2
	ldd	[%l7 + 0x48],	%i6
	fmovscc	%xcc,	%f0,	%f24
	movg	%icc,	%i0,	%l2
	movrgz	%i3,	0x2AC,	%g6
	fmovrslz	%g4,	%f0,	%f3
	bneg,a	loop_667
	stw	%o5,	[%l7 + 0x40]
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f12
	movn	%icc,	%g1,	%g5
loop_667:
	subccc	%l6,	0x14FB,	%l0
	brgz	%g2,	loop_668
	fpmerge	%f1,	%f23,	%f4
	ldub	[%l7 + 0x31],	%o1
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x7B] %asi,	%i1
loop_668:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x44] %asi,	%g7
	fpackfix	%f16,	%f21
	andcc	%o0,	0x16BB,	%o4
	umul	%i5,	0x17D1,	%l5
	edge8	%l1,	%o6,	%i2
	movcs	%icc,	%o3,	%g3
	fbug	%fcc1,	loop_669
	tcs	%icc,	0x0
	nop
	setx	0xBA37E138406C647A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x5945DD6B8CAE12C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f30,	%f28
	lduh	[%l7 + 0x2C],	%i4
loop_669:
	movrlez	%l3,	%l4,	%i6
	ldstub	[%l7 + 0x1A],	%o7
	umul	%o2,	%i7,	%i0
	srl	%i3,	%l2,	%g6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x6D] %asi,	%o5
	tgu	%icc,	0x3
	subcc	%g4,	%g1,	%g5
	faligndata	%f0,	%f20,	%f28
	taddcctv	%l0,	0x050C,	%l6
	tneg	%xcc,	0x2
	move	%icc,	%o1,	%g2
	mulx	%i1,	%g7,	%o4
	nop
	setx	loop_670,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%o0,	0x1835,	%l5
	orcc	%l1,	0x02CF,	%o6
	subcc	%i2,	0x09C5,	%o3
loop_670:
	or	%i5,	%g3,	%l3
	set	0x0, %i7
	ldxa	[%g0 + %i7] 0x4f,	%i4
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	nop
	fitos	%f8,	%f21
	fstox	%f21,	%f24
	fxtos	%f24,	%f12
	fmovsvc	%xcc,	%f3,	%f29
	prefetch	[%l7 + 0x60],	 0x1
	bge	loop_671
	fcmpeq32	%f4,	%f26,	%i6
	tleu	%icc,	0x6
	fmovrdgez	%o2,	%f4,	%f26
loop_671:
	movne	%icc,	%i7,	%o7
	ble	loop_672
	umul	%i3,	0x0FC5,	%l2
	brlez,a	%g6,	loop_673
	bge,pn	%icc,	loop_674
loop_672:
	fbule	%fcc1,	loop_675
	edge32	%o5,	%g4,	%g1
loop_673:
	mulscc	%g5,	%i0,	%l6
loop_674:
	taddcc	%o1,	%g2,	%l0
loop_675:
	add	%g7,	%i1,	%o4
	fmovrdne	%o0,	%f4,	%f24
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x11] %asi,	%l5
	fmovrdgz	%l1,	%f20,	%f0
	fmovse	%icc,	%f5,	%f24
	edge16n	%i2,	%o3,	%o6
	edge8n	%i5,	%l3,	%i4
	and	%g3,	0x158B,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o2,	[%l7 + 0x30]
	bg,a	loop_676
	movle	%icc,	%l4,	%o7
	orn	%i7,	%l2,	%g6
	taddcc	%i3,	0x007D,	%g4
loop_676:
	ldsb	[%l7 + 0x7B],	%g1
	tle	%icc,	0x3
	array8	%g5,	%o5,	%l6
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x56] %asi,	%o1
	swap	[%l7 + 0x78],	%g2
	taddcctv	%i0,	%g7,	%l0
	stx	%i1,	[%l7 + 0x40]
	nop
	setx	0xC0501EC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	movpos	%xcc,	%o0,	%o4
	xnorcc	%l1,	%l5,	%o3
	smul	%i2,	%i5,	%o6
	and	%i4,	0x0168,	%g3
	fmovrslez	%i6,	%f28,	%f31
	ble,a,pt	%icc,	loop_677
	flush	%l7 + 0x68
	alignaddr	%l3,	%o2,	%o7
	tleu	%icc,	0x3
loop_677:
	fzero	%f4
	edge16ln	%i7,	%l4,	%l2
	bcc,pn	%xcc,	loop_678
	nop
	setx	0x8C496F2A58D9DE3D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f28
	taddcctv	%g6,	0x0138,	%g4
	fmovsle	%icc,	%f13,	%f6
loop_678:
	edge16ln	%g1,	%g5,	%i3
	bcs	loop_679
	tge	%xcc,	0x3
	edge16ln	%l6,	%o1,	%o5
	nop
	setx	0xEA348625E7D2AE57,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x846E3DE20A609645,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f28,	%f24
loop_679:
	or	%g2,	%g7,	%i0
	brz	%l0,	loop_680
	movcs	%icc,	%i1,	%o4
	fxor	%f26,	%f8,	%f28
	fmovsn	%icc,	%f2,	%f29
loop_680:
	brgez	%o0,	loop_681
	addccc	%l5,	0x1046,	%o3
	fones	%f12
	udivcc	%l1,	0x16A4,	%i2
loop_681:
	fbug	%fcc0,	loop_682
	edge8l	%i5,	%i4,	%g3
	ldstub	[%l7 + 0x4B],	%o6
	bn,a	%xcc,	loop_683
loop_682:
	umul	%l3,	%i6,	%o7
	edge16n	%o2,	%l4,	%l2
	tne	%icc,	0x4
loop_683:
	sdiv	%i7,	0x0AF5,	%g4
	tcs	%xcc,	0x0
	fbl,a	%fcc2,	loop_684
	edge32	%g1,	%g6,	%i3
	sir	0x08F9
	fmovsvc	%xcc,	%f10,	%f25
loop_684:
	fxors	%f2,	%f19,	%f27
	set	0x50, %i0
	stxa	%l6,	[%l7 + %i0] 0x11
	edge16l	%g5,	%o5,	%o1
	bvc,a,pt	%icc,	loop_685
	fnot2s	%f12,	%f27
	movrgz	%g2,	0x36A,	%g7
	movrlez	%l0,	%i0,	%i1
loop_685:
	movpos	%xcc,	%o0,	%o4
	sdivx	%l5,	0x046E,	%l1
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x50] %asi,	%i2
	srlx	%i5,	0x10,	%o3
	tsubcctv	%i4,	0x1A33,	%o6
	swap	[%l7 + 0x50],	%g3
	prefetch	[%l7 + 0x74],	 0x1
	tn	%icc,	0x7
	edge16ln	%l3,	%i6,	%o7
	fmovsa	%xcc,	%f6,	%f11
	sdiv	%o2,	0x0033,	%l2
	srl	%i7,	%l4,	%g4
	tne	%xcc,	0x7
	orcc	%g6,	%i3,	%g1
	edge16	%g5,	%l6,	%o1
	set	0x38, %g6
	ldxa	[%g0 + %g6] 0x20,	%o5
	st	%f14,	[%l7 + 0x64]
	andncc	%g2,	%l0,	%g7
	brz	%i1,	loop_686
	ta	%xcc,	0x1
	srl	%o0,	%o4,	%l5
	fpadd16s	%f24,	%f26,	%f24
loop_686:
	brgez	%i0,	loop_687
	sir	0x062C
	edge16ln	%i2,	%l1,	%i5
	nop
	setx loop_688, %l0, %l1
	jmpl %l1, %o3
loop_687:
	alignaddr	%o6,	%i4,	%g3
	bvs,a	%xcc,	loop_689
	fmovdge	%xcc,	%f14,	%f8
loop_688:
	udivx	%i6,	0x00C7,	%o7
	xorcc	%l3,	0x0844,	%o2
loop_689:
	nop
	setx	0x3969128C94EAFF45,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x5FD40760BB31AFF8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f0,	%f22
	orcc	%i7,	%l2,	%g4
	bleu,a	%xcc,	loop_690
	udivcc	%l4,	0x1EAA,	%i3
	andn	%g1,	0x1A7A,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_690:
	taddcc	%l6,	0x0193,	%o1
	subccc	%o5,	0x185A,	%g6
	ba,pn	%icc,	loop_691
	tg	%icc,	0x5
	fba	%fcc3,	loop_692
	fmovrsgez	%g2,	%f0,	%f8
loop_691:
	subc	%l0,	%g7,	%i1
	bne,a,pn	%xcc,	loop_693
loop_692:
	add	%o0,	%l5,	%o4
	ld	[%l7 + 0x74],	%f29
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x52] %asi,	%i0
loop_693:
	edge8	%l1,	%i5,	%i2
	movleu	%icc,	%o3,	%o6
	xor	%i4,	0x11AF,	%g3
	alignaddrl	%i6,	%o7,	%l3
	fandnot1s	%f27,	%f0,	%f10
	srlx	%o2,	0x08,	%l2
	edge8l	%g4,	%l4,	%i3
	fpsub16s	%f7,	%f19,	%f19
	fmovrdne	%i7,	%f12,	%f28
	fbo,a	%fcc0,	loop_694
	array32	%g5,	%g1,	%o1
	addcc	%o5,	%g6,	%l6
	nop
	setx	0x22ABDF38F11975DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC11331256C942B70,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f30,	%f16
loop_694:
	bg,pt	%icc,	loop_695
	sdiv	%g2,	0x196B,	%l0
	ld	[%l7 + 0x38],	%f1
	nop
	setx	loop_696,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_695:
	ta	%xcc,	0x3
	fmovscs	%xcc,	%f2,	%f17
	fands	%f11,	%f31,	%f18
loop_696:
	sllx	%g7,	%i1,	%l5
	movn	%icc,	%o4,	%o0
	membar	0x19
	edge32ln	%i0,	%i5,	%l1
	tcs	%icc,	0x0
	edge32	%i2,	%o6,	%i4
	movrlez	%g3,	0x37E,	%i6
	tge	%icc,	0x1
	flush	%l7 + 0x34
	andcc	%o7,	%l3,	%o3
	fcmpgt16	%f30,	%f30,	%l2
	mulx	%g4,	%o2,	%i3
	andn	%i7,	0x0A1B,	%l4
	sub	%g5,	%o1,	%g1
	fcmpgt16	%f16,	%f6,	%g6
	alignaddrl	%l6,	%g2,	%o5
	fmovdn	%icc,	%f2,	%f14
	tleu	%icc,	0x1
	fbn,a	%fcc0,	loop_697
	movn	%icc,	%g7,	%i1
	and	%l0,	%l5,	%o0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%i5
loop_697:
	addcc	%o4,	%i2,	%o6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i4
	fmovdgu	%xcc,	%f16,	%f13
	and	%l1,	0x144E,	%i6
	fexpand	%f0,	%f14
	udivcc	%g3,	0x16F7,	%o7
	subccc	%o3,	0x1C4A,	%l2
	bg,a,pt	%xcc,	loop_698
	fsrc1	%f30,	%f2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g4,	%l3
loop_698:
	nop
	setx	0xF0536501,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x42] %asi,	%i3
	tn	%xcc,	0x6
	mulscc	%i7,	%l4,	%o2
	edge8	%g5,	%o1,	%g6
	fsrc2	%f4,	%f2
	bne,a,pt	%xcc,	loop_699
	tge	%icc,	0x3
	bl,pt	%icc,	loop_700
	subcc	%g1,	%l6,	%o5
loop_699:
	fbule,a	%fcc1,	loop_701
	orn	%g2,	0x0361,	%g7
loop_700:
	tcs	%icc,	0x2
	sub	%l0,	%l5,	%i1
loop_701:
	smulcc	%o0,	%i0,	%o4
	movrlz	%i5,	%i2,	%i4
	nop
	fitos	%f0,	%f12
	fstox	%f12,	%f18
	stx	%l1,	[%l7 + 0x78]
	sdivcc	%o6,	0x0915,	%i6
	sra	%g3,	%o3,	%o7
	xor	%l2,	%g4,	%i3
	bneg	loop_702
	udivcc	%l3,	0x07C7,	%i7
	tn	%xcc,	0x7
	sdiv	%l4,	0x1F49,	%g5
loop_702:
	sdivx	%o2,	0x1287,	%g6
	brz	%o1,	loop_703
	bg,a	%xcc,	loop_704
	tle	%xcc,	0x3
	sll	%g1,	%o5,	%g2
loop_703:
	movrgez	%l6,	0x11D,	%l0
loop_704:
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f24
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x0c,	%l5,	%i1
	fblg,a	%fcc1,	loop_705
	bn,a	loop_706
	movg	%xcc,	%g7,	%o0
	edge8l	%o4,	%i5,	%i2
loop_705:
	udivx	%i0,	0x14B1,	%l1
loop_706:
	fbge	%fcc1,	loop_707
	bcs,pn	%xcc,	loop_708
	stw	%i4,	[%l7 + 0x3C]
	fcmpgt16	%f12,	%f12,	%o6
loop_707:
	addcc	%g3,	%o3,	%o7
loop_708:
	umul	%i6,	0x0BE5,	%g4
	bleu,a,pn	%icc,	loop_709
	be	%icc,	loop_710
	fmovrdlez	%l2,	%f2,	%f2
	orn	%i3,	%i7,	%l3
loop_709:
	fmovdleu	%xcc,	%f17,	%f31
loop_710:
	nop
	set	0x3C, %o6
	swapa	[%l7 + %o6] 0x80,	%l4
	fmovdn	%xcc,	%f18,	%f7
	fmovrse	%o2,	%f30,	%f18
	fba	%fcc2,	loop_711
	xor	%g5,	0x1BFB,	%g6
	membar	0x02
	tle	%icc,	0x6
loop_711:
	fba,a	%fcc3,	loop_712
	add	%o1,	%o5,	%g1
	bvc,pt	%icc,	loop_713
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_712:
	tl	%xcc,	0x1
	xorcc	%l6,	%g2,	%l0
loop_713:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x14] %asi,	%f22
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x81,	%i1,	%g7
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%o0
	movcc	%icc,	%o4,	%i5
	movvc	%xcc,	%i2,	%l5
	fba,a	%fcc0,	loop_714
	fornot1s	%f22,	%f12,	%f8
	nop
	fitos	%f29,	%f0
	fxor	%f6,	%f30,	%f18
loop_714:
	ta	%icc,	0x0
	fmovrdne	%i0,	%f28,	%f14
	movpos	%icc,	%l1,	%i4
	fmovde	%icc,	%f5,	%f18
	sdivx	%g3,	0x131F,	%o6
	xnor	%o3,	0x0201,	%i6
	brlz	%g4,	loop_715
	fmovse	%xcc,	%f23,	%f13
	add	%o7,	%l2,	%i3
	bneg,pt	%xcc,	loop_716
loop_715:
	umul	%l3,	0x19C5,	%i7
	fmuld8sux16	%f31,	%f17,	%f12
	movrlez	%o2,	0x1D0,	%g5
loop_716:
	orn	%l4,	%g6,	%o1
	xorcc	%g1,	%l6,	%g2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x68] %asi,	%o5
	fabsd	%f16,	%f6
	ldsb	[%l7 + 0x16],	%l0
	fble,a	%fcc1,	loop_717
	movre	%i1,	0x3D9,	%o0
	brz,a	%o4,	loop_718
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_717:
	movcs	%icc,	%i5,	%g7
	sub	%l5,	0x078A,	%i2
loop_718:
	movre	%i0,	%l1,	%g3
	andncc	%o6,	%i4,	%i6
	tn	%xcc,	0x3
	movg	%icc,	%o3,	%o7
	edge32l	%g4,	%l2,	%i3
	set	0x14, %g7
	lduba	[%l7 + %g7] 0x04,	%i7
	taddcc	%l3,	%o2,	%g5
	movrlz	%l4,	0x040,	%g6
	mulx	%o1,	0x0296,	%l6
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%g2,	[%g0 + 0x180] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	movle	%icc,	%g1,	%l0
	fmovrslz	%i1,	%f11,	%f22
	fmovd	%f14,	%f30
	stbar
	tcc	%icc,	0x7
	ldsh	[%l7 + 0x26],	%o0
	tn	%icc,	0x0
	movcs	%xcc,	%o4,	%o5
	nop
	setx	0x705C403F,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	fmovdg	%icc,	%f24,	%f24
	and	%g7,	%i5,	%l5
	fba,a	%fcc0,	loop_719
	alignaddrl	%i0,	%l1,	%g3
	umul	%i2,	%o6,	%i6
	fbug	%fcc2,	loop_720
loop_719:
	fble	%fcc3,	loop_721
	fmovsl	%xcc,	%f10,	%f30
	smul	%o3,	0x181B,	%i4
loop_720:
	udiv	%o7,	0x1355,	%l2
loop_721:
	andn	%g4,	0x17DF,	%i7
	tne	%xcc,	0x0
	nop
	setx	0x97BECCE5164E99C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x4ACC9E92A4AB8BBC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f26,	%f14
	andncc	%i3,	%l3,	%o2
	sethi	0x10ED,	%l4
	fbule	%fcc0,	loop_722
	brlez,a	%g6,	loop_723
	nop
	fitod	%f10,	%f10
	fdtos	%f10,	%f28
	taddcc	%g5,	%o1,	%l6
loop_722:
	prefetch	[%l7 + 0x30],	 0x1
loop_723:
	nop
	fitos	%f2,	%f27
	fstox	%f27,	%f16
	edge32n	%g1,	%l0,	%g2
	movpos	%xcc,	%i1,	%o4
	edge8l	%o0,	%o5,	%g7
	fnor	%f10,	%f30,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i5,	%i0,	%l1
	alignaddrl	%g3,	%i2,	%o6
	fmovs	%f30,	%f23
	sra	%i6,	0x12,	%o3
	brz	%l5,	loop_724
	edge16n	%i4,	%o7,	%l2
	ld	[%l7 + 0x14],	%f28
	membar	0x18
loop_724:
	fbuge	%fcc2,	loop_725
	movl	%icc,	%g4,	%i3
	bpos,a	%xcc,	loop_726
	and	%l3,	%o2,	%i7
loop_725:
	udiv	%g6,	0x12A9,	%l4
	edge16	%g5,	%o1,	%g1
loop_726:
	ldsw	[%l7 + 0x6C],	%l6
	array32	%l0,	%i1,	%o4
	movne	%icc,	%o0,	%g2
	bg	%xcc,	loop_727
	fpack32	%f30,	%f26,	%f2
	fmul8x16al	%f8,	%f29,	%f28
	ldsw	[%l7 + 0x7C],	%o5
loop_727:
	fornot1s	%f24,	%f30,	%f27
	sra	%g7,	0x09,	%i5
	tl	%xcc,	0x7
	subccc	%i0,	%l1,	%g3
	std	%f30,	[%l7 + 0x70]
	sra	%i2,	0x06,	%o6
	fones	%f21
	movle	%xcc,	%i6,	%l5
	movvs	%icc,	%i4,	%o3
	mova	%xcc,	%l2,	%g4
	or	%o7,	0x0115,	%l3
	edge16	%o2,	%i7,	%g6
	edge32	%i3,	%g5,	%l4
	fmovdneg	%icc,	%f8,	%f6
	andncc	%g1,	%l6,	%l0
	movleu	%xcc,	%i1,	%o4
	tpos	%icc,	0x3
	umulcc	%o1,	0x12EC,	%g2
	udiv	%o0,	0x0EE2,	%g7
	swap	[%l7 + 0x48],	%i5
	nop
	setx loop_728, %l0, %l1
	jmpl %l1, %o5
	edge8ln	%l1,	%g3,	%i0
	movn	%xcc,	%o6,	%i6
	fpsub32s	%f16,	%f4,	%f10
loop_728:
	movvc	%xcc,	%l5,	%i4
	bvs,a,pt	%icc,	loop_729
	bvs,a,pt	%icc,	loop_730
	ldub	[%l7 + 0x1D],	%o3
	tsubcctv	%l2,	%i2,	%o7
loop_729:
	taddcc	%l3,	0x14D5,	%o2
loop_730:
	brz	%i7,	loop_731
	udiv	%g6,	0x0FBC,	%i3
	edge32n	%g5,	%l4,	%g1
	srlx	%l6,	0x14,	%g4
loop_731:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x2
	nop
	setx	0x0611C5C573C95FD2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x7DD28D8F488F037A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f24,	%f10
	ta	%icc,	0x2
	fmovde	%xcc,	%f4,	%f20
	fmovscc	%icc,	%f4,	%f22
	alignaddr	%i1,	%l0,	%o1
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%g2,	%o0
	tneg	%icc,	0x1
	popc	0x1372,	%o4
	xnorcc	%g7,	0x0453,	%o5
	set	0x68, %o3
	stha	%i5,	[%l7 + %o3] 0x80
	udivcc	%l1,	0x057B,	%i0
	movn	%icc,	%o6,	%g3
	srlx	%l5,	%i4,	%i6
	wr	%g0,	0x22,	%asi
	stwa	%o3,	[%l7 + 0x6C] %asi
	membar	#Sync
	edge8l	%i2,	%l2,	%o7
	xnorcc	%l3,	0x1CD5,	%i7
	stbar
	tcc	%xcc,	0x1
	xorcc	%g6,	0x166C,	%i3
	fmovdvs	%icc,	%f28,	%f2
	subcc	%o2,	0x1987,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g1,	0x1E2A,	%l4
	tn	%xcc,	0x7
	movgu	%icc,	%g4,	%i1
	orcc	%l0,	%o1,	%l6
	udivcc	%o0,	0x0EC0,	%g2
	tvc	%xcc,	0x2
	smul	%o4,	0x1E80,	%g7
	mulscc	%o5,	0x040E,	%l1
	alignaddrl	%i0,	%i5,	%g3
	bge,a,pt	%icc,	loop_732
	addc	%l5,	0x0085,	%o6
	bcs,a,pt	%icc,	loop_733
	sra	%i6,	%i4,	%i2
loop_732:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
loop_733:
	movl	%xcc,	%o7,	%l3
	fbul	%fcc0,	loop_734
	for	%f26,	%f0,	%f20
	subc	%o3,	0x1F12,	%g6
	fbu	%fcc2,	loop_735
loop_734:
	ble,a	%icc,	loop_736
	array32	%i3,	%o2,	%i7
	fmovdg	%icc,	%f24,	%f24
loop_735:
	sll	%g5,	%g1,	%l4
loop_736:
	movge	%xcc,	%i1,	%g4
	edge8n	%o1,	%l0,	%o0
	st	%f20,	[%l7 + 0x48]
	mulx	%g2,	%l6,	%g7
	sdivx	%o5,	0x16DA,	%l1
	fbl,a	%fcc1,	loop_737
	fmovdgu	%xcc,	%f30,	%f28
	fmovsa	%xcc,	%f24,	%f8
	brnz,a	%i0,	loop_738
loop_737:
	brnz,a	%i5,	loop_739
	bgu	loop_740
	movrgez	%o4,	0x1DA,	%g3
loop_738:
	mova	%xcc,	%l5,	%i6
loop_739:
	ld	[%l7 + 0x18],	%f29
loop_740:
	call	loop_741
	mulx	%i4,	%i2,	%l2
	sth	%o7,	[%l7 + 0x30]
	andncc	%l3,	%o6,	%g6
loop_741:
	mulscc	%i3,	%o3,	%i7
	fnegd	%f30,	%f28
	fbg,a	%fcc2,	loop_742
	edge8	%o2,	%g5,	%l4
	udivcc	%g1,	0x1C10,	%i1
	mulscc	%g4,	%l0,	%o0
loop_742:
	ldub	[%l7 + 0x0C],	%g2
	fands	%f23,	%f16,	%f31
	tn	%xcc,	0x6
	movne	%xcc,	%o1,	%l6
	movrlz	%o5,	0x335,	%l1
	orn	%g7,	0x00E7,	%i5
	stbar
	tvs	%xcc,	0x3
	tsubcc	%o4,	0x0D3F,	%g3
	fmovsleu	%icc,	%f26,	%f5
	ta	%xcc,	0x2
	and	%i0,	%i6,	%l5
	brgz	%i4,	loop_743
	fbg	%fcc3,	loop_744
	addccc	%l2,	%o7,	%i2
	be,a,pn	%xcc,	loop_745
loop_743:
	subccc	%l3,	%g6,	%i3
loop_744:
	mulx	%o3,	%o6,	%o2
	mulx	%i7,	%g5,	%l4
loop_745:
	tleu	%icc,	0x5
	ldsw	[%l7 + 0x40],	%g1
	movneg	%xcc,	%i1,	%l0
	fmovsleu	%xcc,	%f20,	%f7
	bn,pn	%icc,	loop_746
	orncc	%o0,	0x0F17,	%g2
	andcc	%o1,	%l6,	%o5
	edge16ln	%g4,	%g7,	%i5
loop_746:
	tsubcctv	%l1,	0x08C9,	%o4
	nop
	setx	loop_747,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%xcc,	0x2
	edge8n	%g3,	%i0,	%l5
	movcs	%icc,	%i4,	%l2
loop_747:
	edge8n	%i6,	%o7,	%i2
	movcc	%xcc,	%l3,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i3,	%o3,	%o2
	sub	%o6,	0x17EC,	%g5
	bg,a	%icc,	loop_748
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f14
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f12
	fxtod	%f12,	%f6
	movn	%icc,	%l4,	%i7
loop_748:
	sethi	0x01C9,	%i1
	sethi	0x0848,	%l0
	tgu	%icc,	0x0
	bcs	loop_749
	std	%f28,	[%l7 + 0x48]
	movg	%icc,	%g1,	%g2
	fmovrse	%o1,	%f9,	%f23
loop_749:
	fornot2	%f14,	%f28,	%f26
	movge	%icc,	%l6,	%o5
	edge8n	%g4,	%o0,	%g7
	sdivcc	%l1,	0x04AF,	%o4
	mulx	%g3,	0x0FE1,	%i0
	tl	%xcc,	0x7
	nop
	setx	0x9A917A735CF6BC00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x12AD3315E1F5252F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f12,	%f12
	bshuffle	%f30,	%f6,	%f16
	array32	%i5,	%i4,	%l2
	bge,pt	%xcc,	loop_750
	popc	%l5,	%i6
	smul	%o7,	%l3,	%g6
	fmovsl	%icc,	%f15,	%f17
loop_750:
	fmovsn	%icc,	%f24,	%f15
	orncc	%i3,	%i2,	%o3
	fabss	%f1,	%f9
	add	%l7,	0x54,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%o6,	%o2
	subcc	%l4,	0x0771,	%i7
	fbu,a	%fcc1,	loop_751
	fmovsvs	%xcc,	%f22,	%f27
	edge16ln	%i1,	%g5,	%l0
	tcc	%icc,	0x5
loop_751:
	fxnor	%f18,	%f16,	%f2
	array16	%g2,	%o1,	%l6
	fnot1	%f4,	%f6
	umul	%o5,	0x1635,	%g1
	ldub	[%l7 + 0x5A],	%g4
	brlz,a	%g7,	loop_752
	fbe,a	%fcc0,	loop_753
	ldd	[%l7 + 0x20],	%l0
	te	%xcc,	0x5
loop_752:
	srl	%o0,	0x1E,	%g3
loop_753:
	fxnor	%f0,	%f8,	%f10
	fpadd16	%f10,	%f16,	%f10
	sdivcc	%o4,	0x0D8E,	%i5
	movcs	%xcc,	%i4,	%l2
	pdist	%f30,	%f16,	%f30
	alignaddr	%l5,	%i0,	%i6
	sdivx	%o7,	0x08B6,	%g6
	udivx	%l3,	0x1066,	%i3
	faligndata	%f10,	%f26,	%f26
	tpos	%icc,	0x5
	fmovsneg	%icc,	%f15,	%f18
	udiv	%o3,	0x0C22,	%o6
	tl	%xcc,	0x7
	edge16	%o2,	%l4,	%i7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x14] %asi,	%i2
	sdiv	%g5,	0x1AB5,	%l0
	ta	%icc,	0x7
	and	%i1,	0x130E,	%o1
	umulcc	%g2,	0x0FD6,	%l6
	sub	%g1,	0x1332,	%g4
	fexpand	%f0,	%f30
	brnz,a	%g7,	loop_754
	edge32ln	%o5,	%o0,	%l1
	orncc	%o4,	%g3,	%i4
	edge32ln	%i5,	%l5,	%i0
loop_754:
	movpos	%xcc,	%l2,	%o7
	movrlez	%i6,	%g6,	%i3
	fbu	%fcc2,	loop_755
	fmovsgu	%icc,	%f31,	%f11
	fpackfix	%f16,	%f8
	tge	%icc,	0x4
loop_755:
	fbule,a	%fcc0,	loop_756
	movcc	%icc,	%l3,	%o6
	nop
	set	0x0E, %i2
	lduh	[%l7 + %i2],	%o2
	fblg,a	%fcc3,	loop_757
loop_756:
	nop
	setx	loop_758,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tle	%xcc,	0x4
	xorcc	%o3,	%i7,	%l4
loop_757:
	nop
	fitod	%f27,	%f0
loop_758:
	andn	%i2,	%l0,	%i1
	fcmpeq16	%f12,	%f28,	%g5
	bvc,a	loop_759
	subcc	%g2,	%o1,	%l6
	bg,a,pn	%xcc,	loop_760
	tsubcc	%g1,	0x14D4,	%g4
loop_759:
	movn	%xcc,	%o5,	%g7
	bcc,a,pt	%xcc,	loop_761
loop_760:
	alignaddr	%o0,	%o4,	%g3
	sllx	%l1,	%i5,	%l5
	sth	%i4,	[%l7 + 0x24]
loop_761:
	tvc	%icc,	0x3
	movl	%xcc,	%l2,	%o7
	array16	%i0,	%g6,	%i6
	xnor	%i3,	%l3,	%o6
	movg	%icc,	%o3,	%i7
	fsrc2	%f20,	%f8
	udivcc	%o2,	0x1C40,	%l4
	fone	%f16
	movle	%xcc,	%i2,	%l0
	brnz	%i1,	loop_762
	fpack32	%f20,	%f0,	%f24
	fzero	%f14
	movgu	%icc,	%g2,	%o1
loop_762:
	mulscc	%g5,	%l6,	%g1
	fblg,a	%fcc1,	loop_763
	fmovrsgz	%g4,	%f0,	%f27
	udivx	%g7,	0x0B06,	%o5
	andcc	%o4,	%g3,	%l1
loop_763:
	sdivcc	%i5,	0x01BF,	%l5
	edge16	%o0,	%l2,	%o7
	edge32l	%i0,	%g6,	%i6
	fpackfix	%f14,	%f28
	or	%i3,	%i4,	%o6
	tgu	%xcc,	0x7
	set	0x70, %g5
	swapa	[%l7 + %g5] 0x0c,	%l3
	ta	%xcc,	0x2
	popc	%o3,	%i7
	fmovda	%icc,	%f8,	%f8
	movle	%icc,	%o2,	%i2
	array8	%l0,	%l4,	%g2
	sdiv	%i1,	0x119A,	%g5
	subcc	%o1,	%g1,	%g4
	nop
	set	0x74, %i3
	lduh	[%l7 + %i3],	%g7
	set	0x50, %l2
	stxa	%o5,	[%l7 + %l2] 0x80
	fmovsneg	%icc,	%f25,	%f13
	fcmpgt16	%f10,	%f16,	%o4
	udivx	%l6,	0x1732,	%l1
	fbue,a	%fcc1,	loop_764
	nop
	fitod	%f8,	%f2
	fdtox	%f2,	%f30
	movvs	%xcc,	%g3,	%l5
	sir	0x1D2F
loop_764:
	movn	%icc,	%o0,	%l2
	sdivx	%i5,	0x02DF,	%o7
	set	0x34, %l5
	lda	[%l7 + %l5] 0x81,	%f16
	edge16l	%i0,	%i6,	%g6
	std	%f12,	[%l7 + 0x58]
	nop
	setx	0xD54D8F36,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xC65DA88A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f31,	%f25
	movle	%icc,	%i3,	%i4
	membar	0x79
	fmovrde	%o6,	%f14,	%f8
	membar	0x4D
	edge32l	%l3,	%i7,	%o2
	nop
	setx	0xBDD4E17BE69FD0B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x69258F237E1AB04B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f16,	%f0
	bn,pt	%icc,	loop_765
	bleu,a	loop_766
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x5
loop_765:
	fmovdleu	%icc,	%f1,	%f12
loop_766:
	movne	%icc,	%o3,	%l0
	sllx	%i2,	%l4,	%g2
	mulx	%i1,	0x1728,	%g5
	sra	%g1,	0x07,	%g4
	fnand	%f22,	%f26,	%f12
	array8	%o1,	%g7,	%o4
	edge32ln	%o5,	%l6,	%g3
	movrgez	%l5,	%o0,	%l1
	movrlz	%l2,	0x266,	%i5
	subccc	%i0,	0x006F,	%o7
	fcmpgt16	%f14,	%f8,	%i6
	srl	%g6,	%i3,	%i4
	tvs	%icc,	0x7
	tle	%xcc,	0x2
	wr	%g0,	0x21,	%asi
	stxa	%o6,	[%g0 + 0x8] %asi
	movle	%xcc,	%l3,	%i7
	bne,a	loop_767
	tleu	%icc,	0x7
	fble,a	%fcc1,	loop_768
	sub	%o3,	0x11EC,	%o2
loop_767:
	nop
	set	0x78, %i1
	ldsha	[%l7 + %i1] 0x19,	%l0
loop_768:
	bvs,a,pn	%icc,	loop_769
	taddcc	%i2,	0x1715,	%l4
	tvc	%icc,	0x6
	udiv	%g2,	0x1FAF,	%i1
loop_769:
	nop
	setx	0x86BB82D6D06DA347,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	edge8l	%g1,	%g4,	%g5
	tpos	%xcc,	0x4
	subccc	%o1,	%g7,	%o4
	nop
	fitos	%f10,	%f9
	fstod	%f9,	%f22
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	orn	%l6,	0x083D,	%o5
	swap	[%l7 + 0x2C],	%g3
	brgz	%l5,	loop_770
	tcs	%icc,	0x1
	tcs	%icc,	0x0
	fnot1s	%f6,	%f29
loop_770:
	edge16	%l1,	%o0,	%l2
	edge32	%i5,	%i0,	%i6
	set	0x6F, %o0
	ldsba	[%l7 + %o0] 0x19,	%o7
	st	%f1,	[%l7 + 0x6C]
	fbule,a	%fcc3,	loop_771
	tpos	%icc,	0x0
	stb	%g6,	[%l7 + 0x42]
	movleu	%icc,	%i3,	%o6
loop_771:
	array16	%l3,	%i4,	%i7
	fmovdgu	%icc,	%f14,	%f17
	bl,pt	%xcc,	loop_772
	ldd	[%l7 + 0x38],	%f20
	tle	%icc,	0x6
	ldsh	[%l7 + 0x18],	%o2
loop_772:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x35] %asi,	%l0
	udivcc	%o3,	0x0D07,	%l4
	set	0x3A, %o7
	ldsha	[%l7 + %o7] 0x11,	%i2
	ldstub	[%l7 + 0x48],	%i1
	fba	%fcc0,	loop_773
	movg	%xcc,	%g1,	%g2
	fandnot2s	%f15,	%f6,	%f12
	set	0x54, %g2
	ldswa	[%l7 + %g2] 0x04,	%g4
loop_773:
	fcmpeq16	%f22,	%f10,	%g5
	movleu	%icc,	%g7,	%o4
	movl	%icc,	%o1,	%o5
	movpos	%icc,	%g3,	%l5
	sub	%l1,	%l6,	%o0
	smul	%l2,	%i5,	%i6
	wr	%g0,	0x2a,	%asi
	stxa	%i0,	[%l7 + 0x58] %asi
	membar	#Sync
	edge8ln	%o7,	%i3,	%g6
	edge32ln	%o6,	%l3,	%i7
	fsrc2s	%f17,	%f8
	movrlz	%o2,	0x0BE,	%i4
	movrlez	%o3,	0x2AB,	%l4
	sdivx	%i2,	0x018A,	%l0
	fmovdpos	%xcc,	%f11,	%f6
	bn	%xcc,	loop_774
	tpos	%icc,	0x7
	tcc	%xcc,	0x6
	fabss	%f22,	%f28
loop_774:
	tcs	%icc,	0x4
	nop
	setx	0xA9CBC0CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x96B487C3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f8,	%f25
	fmovsne	%icc,	%f16,	%f1
	membar	0x2D
	set	0x48, %o4
	sta	%f24,	[%l7 + %o4] 0x18
	fmul8x16al	%f24,	%f20,	%f12
	edge8n	%g1,	%i1,	%g4
	fones	%f11
	tn	%icc,	0x0
	edge16	%g2,	%g7,	%o4
	fbn	%fcc2,	loop_775
	edge8l	%o1,	%o5,	%g3
	srlx	%g5,	0x10,	%l5
	edge8n	%l6,	%l1,	%o0
loop_775:
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%l2
	movpos	%xcc,	%i6,	%i5
	sllx	%i0,	0x1A,	%o7
	mulscc	%g6,	%i3,	%o6
	alignaddr	%l3,	%i7,	%o2
	fbe,a	%fcc0,	loop_776
	sllx	%o3,	0x14,	%l4
	subc	%i4,	0x17BE,	%l0
	xor	%g1,	0x0700,	%i1
loop_776:
	nop
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i2
	sra	%g4,	0x16,	%g2
	movvc	%xcc,	%o4,	%o1
	fcmpgt16	%f22,	%f8,	%o5
	umulcc	%g7,	0x1568,	%g3
	movneg	%xcc,	%g5,	%l6
	edge16n	%l5,	%l1,	%o0
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%i6
	tpos	%icc,	0x7
	set	0x3A, %l4
	stba	%l2,	[%l7 + %l4] 0x2f
	membar	#Sync
	taddcctv	%i0,	%i5,	%g6
	alignaddrl	%i3,	%o6,	%o7
	movl	%icc,	%l3,	%o2
	fba,a	%fcc3,	loop_777
	sra	%i7,	0x15,	%o3
	fmovdl	%icc,	%f7,	%f1
	sll	%i4,	0x0D,	%l4
loop_777:
	stb	%g1,	[%l7 + 0x34]
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x40] %asi,	%i1
	nop
	setx	loop_778,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlz	%l0,	loop_779
	fmul8x16au	%f28,	%f5,	%f18
	fxors	%f7,	%f15,	%f11
loop_778:
	fpack16	%f4,	%f20
loop_779:
	xor	%i2,	0x121D,	%g4
	sethi	0x1408,	%o4
	fmul8x16	%f31,	%f14,	%f28
	xorcc	%g2,	%o1,	%o5
	fbge	%fcc2,	loop_780
	edge32n	%g3,	%g5,	%l6
	tpos	%icc,	0x7
	fbule,a	%fcc2,	loop_781
loop_780:
	swap	[%l7 + 0x40],	%g7
	lduw	[%l7 + 0x1C],	%l1
	udiv	%l5,	0x1328,	%i6
loop_781:
	fbge	%fcc3,	loop_782
	st	%f2,	[%l7 + 0x7C]
	movleu	%xcc,	%l2,	%o0
	nop
	fitod	%f0,	%f14
	fdtos	%f14,	%f16
loop_782:
	membar	0x7E
	taddcctv	%i0,	0x0CA0,	%g6
	andcc	%i5,	%o6,	%o7
	popc	0x17E5,	%i3
	sra	%l3,	0x0E,	%o2
	fmuld8ulx16	%f22,	%f30,	%f2
	tg	%icc,	0x5
	subc	%i7,	0x1FDA,	%o3
	edge8ln	%l4,	%g1,	%i4
	sdivx	%l0,	0x0F3D,	%i1
	fbn	%fcc0,	loop_783
	alignaddr	%g4,	%o4,	%g2
	movgu	%icc,	%i2,	%o5
	tcs	%icc,	0x2
loop_783:
	bne,a	loop_784
	fmovdpos	%icc,	%f14,	%f0
	tvs	%xcc,	0x7
	movg	%icc,	%g3,	%g5
loop_784:
	brgez,a	%l6,	loop_785
	andcc	%g7,	0x1450,	%o1
	smulcc	%l1,	0x1C88,	%i6
	sub	%l2,	0x0BB4,	%l5
loop_785:
	movrgez	%o0,	0x2B0,	%g6
	fornot2s	%f10,	%f9,	%f18
	movleu	%xcc,	%i5,	%o6
	movcc	%icc,	%i0,	%i3
	fmovdl	%icc,	%f25,	%f14
	movrlez	%o7,	0x109,	%l3
	ldd	[%l7 + 0x38],	%f2
	fand	%f24,	%f12,	%f0
	umul	%o2,	%o3,	%i7
	brnz	%g1,	loop_786
	movrgez	%l4,	%l0,	%i1
	set	0x40, %l3
	lda	[%l7 + %l3] 0x10,	%f26
loop_786:
	movrgez	%g4,	0x113,	%o4
	mulx	%g2,	%i4,	%i2
	sll	%g3,	%g5,	%l6
	xorcc	%o5,	0x0A99,	%g7
	andncc	%l1,	%o1,	%l2
	fmovde	%xcc,	%f1,	%f14
	taddcc	%l5,	0x19B3,	%o0
	set	0x20, %l0
	stxa	%i6,	[%g0 + %l0] 0x4f
	set	0x54, %g4
	ldstuba	[%l7 + %g4] 0x89,	%i5
	fbge	%fcc3,	loop_787
	call	loop_788
	array8	%g6,	%i0,	%i3
	array32	%o7,	%l3,	%o2
loop_787:
	pdist	%f18,	%f14,	%f16
loop_788:
	movg	%xcc,	%o6,	%o3
	brlez,a	%g1,	loop_789
	nop
	setx loop_790, %l0, %l1
	jmpl %l1, %i7
	movrlz	%l4,	%l0,	%i1
	addcc	%g4,	%g2,	%o4
loop_789:
	movcs	%icc,	%i4,	%g3
loop_790:
	fbn,a	%fcc2,	loop_791
	movre	%g5,	%i2,	%o5
	sir	0x056A
	te	%icc,	0x6
loop_791:
	brgez,a	%g7,	loop_792
	edge8ln	%l1,	%l6,	%l2
	movg	%xcc,	%o1,	%l5
	sdivx	%i6,	0x1997,	%i5
loop_792:
	movle	%icc,	%g6,	%o0
	tn	%xcc,	0x1
	tvc	%icc,	0x6
	tgu	%xcc,	0x5
	pdist	%f0,	%f20,	%f24
	nop
	setx	0x0BBBBB3880E00377,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xFC8DE42D9E5F418B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f2,	%f8
	sub	%i0,	0x0999,	%i3
	andn	%l3,	%o2,	%o6
	fmul8x16	%f31,	%f6,	%f8
	umul	%o3,	0x0046,	%g1
	umul	%o7,	%l4,	%l0
	fbue	%fcc0,	loop_793
	smul	%i1,	0x02E6,	%g4
	set	0x69, %l6
	ldsba	[%l7 + %l6] 0x0c,	%g2
loop_793:
	or	%o4,	%i7,	%g3
	edge16n	%i4,	%g5,	%i2
	nop
	setx	0x37328C22,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f29
	nop
	setx	loop_794,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tg	%xcc,	0x2
	umulcc	%g7,	%o5,	%l6
	edge8l	%l1,	%o1,	%l5
loop_794:
	brlz	%l2,	loop_795
	andncc	%i6,	%g6,	%i5
	fbuge,a	%fcc3,	loop_796
	fandnot1	%f16,	%f4,	%f0
loop_795:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%i0
loop_796:
	bn,a,pt	%icc,	loop_797
	mova	%icc,	%o0,	%l3
	membar	0x28
	ble,a	loop_798
loop_797:
	movn	%xcc,	%i3,	%o2
	fbul,a	%fcc2,	loop_799
	movpos	%xcc,	%o3,	%g1
loop_798:
	mova	%xcc,	%o6,	%l4
	edge16ln	%o7,	%l0,	%g4
loop_799:
	tleu	%xcc,	0x1
	edge32l	%i1,	%o4,	%g2
	movre	%i7,	0x01D,	%i4
	movcs	%xcc,	%g3,	%i2
	add	%g7,	0x15F5,	%g5
	and	%l6,	0x0548,	%l1
	popc	0x0CA5,	%o5
	edge32l	%l5,	%o1,	%i6
	fmovrdgz	%g6,	%f0,	%f24
	fbul,a	%fcc0,	loop_800
	movge	%icc,	%l2,	%i5
	fmovrslz	%o0,	%f11,	%f10
	fones	%f7
loop_800:
	movg	%icc,	%l3,	%i0
	fnors	%f4,	%f2,	%f26
	orn	%i3,	%o3,	%o2
	movrlez	%g1,	0x0DF,	%l4
	fmovdl	%xcc,	%f27,	%f18
	sdivx	%o7,	0x198A,	%o6
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l0,	%g4
	nop
	fitos	%f14,	%f11
	fstoi	%f11,	%f13
	fbge	%fcc3,	loop_801
	fxnor	%f0,	%f14,	%f14
	fone	%f26
	movneg	%xcc,	%o4,	%i1
loop_801:
	movcc	%icc,	%i7,	%i4
	set	0x78, %g3
	stha	%g3,	[%l7 + %g3] 0x88
	smul	%g2,	%i2,	%g5
	ldsb	[%l7 + 0x0F],	%g7
	andcc	%l6,	%o5,	%l5
	membar	0x08
	alignaddrl	%o1,	%l1,	%i6
	movvs	%xcc,	%g6,	%l2
	fors	%f25,	%f28,	%f23
	set	0x74, %o2
	lduwa	[%l7 + %o2] 0x80,	%i5
	fmovdvs	%xcc,	%f16,	%f14
	tvs	%icc,	0x6
	smul	%o0,	%i0,	%i3
	tcs	%xcc,	0x4
	ba,a,pt	%xcc,	loop_802
	xorcc	%o3,	%o2,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l4,	%o7,	%l3
loop_802:
	fmovspos	%icc,	%f27,	%f10
	movrgz	%o6,	0x252,	%l0
	tneg	%xcc,	0x4
	movneg	%xcc,	%g4,	%o4
	edge8	%i1,	%i7,	%i4
	taddcctv	%g2,	%i2,	%g3
	ldsb	[%l7 + 0x0F],	%g5
	movle	%xcc,	%g7,	%o5
	ldub	[%l7 + 0x6B],	%l5
	edge32l	%o1,	%l1,	%l6
	orncc	%g6,	0x026C,	%l2
	srax	%i5,	0x04,	%i6
	andcc	%i0,	0x159E,	%o0
	faligndata	%f24,	%f18,	%f14
	sra	%i3,	%o3,	%o2
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x18] %asi,	%l4
	fsrc2	%f14,	%f10
	taddcctv	%o7,	0x15F4,	%g1
	fnot2s	%f3,	%f23
	ble	%icc,	loop_803
	fbul	%fcc1,	loop_804
	bneg	%xcc,	loop_805
	tvs	%icc,	0x5
loop_803:
	and	%o6,	0x1E95,	%l0
loop_804:
	fbge,a	%fcc1,	loop_806
loop_805:
	sra	%l3,	0x1A,	%o4
	tleu	%xcc,	0x6
	or	%g4,	0x0212,	%i1
loop_806:
	sub	%i7,	0x0AAD,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i2,	%g3
	edge8n	%g5,	%g7,	%g2
	edge16l	%o5,	%l5,	%l1
	bg,a	loop_807
	sra	%l6,	0x06,	%g6
	xnor	%o1,	%i5,	%i6
	smulcc	%i0,	%o0,	%l2
loop_807:
	fcmpne32	%f0,	%f16,	%i3
	andncc	%o2,	%o3,	%l4
	fbuge	%fcc2,	loop_808
	edge32	%o7,	%o6,	%g1
	fmovrsgez	%l3,	%f30,	%f2
	fmovspos	%xcc,	%f26,	%f2
loop_808:
	andcc	%o4,	0x1E93,	%l0
	fbge,a	%fcc2,	loop_809
	brlez	%g4,	loop_810
	movleu	%xcc,	%i7,	%i1
	fxor	%f8,	%f12,	%f10
loop_809:
	array16	%i2,	%i4,	%g5
loop_810:
	tcc	%xcc,	0x4
	fbu,a	%fcc0,	loop_811
	nop
	fitos	%f3,	%f9
	nop
	fitod	%f12,	%f28
	fdtoi	%f28,	%f18
	sdivx	%g3,	0x17FD,	%g7
loop_811:
	bvc,a	loop_812
	orcc	%g2,	%l5,	%o5
	tg	%xcc,	0x6
	movn	%icc,	%l1,	%g6
loop_812:
	bn,a,pn	%icc,	loop_813
	fmovrdlz	%l6,	%f20,	%f20
	andncc	%o1,	%i5,	%i6
	movrlz	%i0,	0x0DB,	%o0
loop_813:
	andcc	%i3,	0x0F34,	%l2
	movrne	%o2,	0x3CA,	%o3
	fcmpeq16	%f18,	%f30,	%o7
	xnorcc	%l4,	0x069E,	%g1
	tsubcc	%l3,	%o6,	%o4
	tcs	%icc,	0x5
	fcmpgt16	%f8,	%f26,	%l0
	edge8l	%i7,	%i1,	%g4
	bn,pt	%xcc,	loop_814
	stbar
	fcmpne16	%f22,	%f24,	%i4
	mova	%icc,	%g5,	%i2
loop_814:
	fxnors	%f21,	%f17,	%f29
	fmovs	%f16,	%f8
	fbg,a	%fcc2,	loop_815
	fmovrslez	%g3,	%f8,	%f15
	fmovd	%f24,	%f22
	tcs	%xcc,	0x4
loop_815:
	nop
	set	0x1C, %l1
	sta	%f1,	[%l7 + %l1] 0x80
	membar	0x7F
	movg	%icc,	%g7,	%l5
	mulscc	%g2,	%o5,	%l1
	movle	%xcc,	%l6,	%o1
	tle	%icc,	0x5
	lduw	[%l7 + 0x1C],	%g6
	movrne	%i5,	%i6,	%i0
	fones	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i3,	0x1B,	%o0
	nop
	setx	0x468AFFA4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x5F6E79F5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f20,	%f31
	be,pn	%xcc,	loop_816
	popc	%l2,	%o3
	sub	%o2,	%o7,	%g1
	ta	%icc,	0x5
loop_816:
	movcc	%icc,	%l3,	%l4
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x43] %asi,	%o4
	andncc	%l0,	%o6,	%i1
	srlx	%i7,	%g4,	%g5
	fpadd16	%f22,	%f16,	%f2
	brlez	%i4,	loop_817
	tg	%xcc,	0x3
	andncc	%i2,	%g3,	%g7
	st	%f8,	[%l7 + 0x50]
loop_817:
	smul	%g2,	0x18B0,	%l5
	fmovrse	%o5,	%f6,	%f25
	nop
	setx loop_818, %l0, %l1
	jmpl %l1, %l6
	sllx	%l1,	0x10,	%o1
	movvc	%xcc,	%g6,	%i5
	tsubcctv	%i0,	%i6,	%o0
loop_818:
	ldsh	[%l7 + 0x10],	%l2
	bcc,a,pn	%icc,	loop_819
	umulcc	%i3,	0x1C0C,	%o2
	alignaddrl	%o3,	%g1,	%o7
	array8	%l3,	%l4,	%o4
loop_819:
	nop
	setx	0xF04B0EEF,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	smulcc	%o6,	%l0,	%i7
	and	%i1,	0x1783,	%g4
	edge16	%i4,	%g5,	%i2
	fsrc1s	%f13,	%f8
	tsubcc	%g7,	0x170E,	%g3
	udivcc	%g2,	0x106F,	%o5
	fmovdn	%xcc,	%f27,	%f24
	movge	%xcc,	%l5,	%l6
	swap	[%l7 + 0x4C],	%l1
	umul	%g6,	%i5,	%o1
	smulcc	%i6,	%o0,	%l2
	fble,a	%fcc0,	loop_820
	movrlz	%i0,	0x127,	%o2
	movneg	%xcc,	%i3,	%o3
	set	0x08, %o5
	stxa	%o7,	[%l7 + %o5] 0xe3
	membar	#Sync
loop_820:
	and	%l3,	0x0F31,	%l4
	movle	%icc,	%o4,	%o6
	lduw	[%l7 + 0x18],	%l0
	stb	%g1,	[%l7 + 0x7D]
	ldd	[%l7 + 0x48],	%i0
	fbule	%fcc3,	loop_821
	nop
	setx	0xE14E82F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x5F85B2E4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f28,	%f7
	fmovdl	%icc,	%f15,	%f29
	movl	%xcc,	%i7,	%g4
loop_821:
	subccc	%g5,	%i2,	%g7
	xor	%g3,	0x1B62,	%g2
	edge32ln	%i4,	%l5,	%o5
	fmovs	%f14,	%f17
	sdiv	%l1,	0x1C6B,	%g6
	nop
	setx	0xACFC3913,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x267EF3F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f3,	%f13
	fmul8x16au	%f21,	%f4,	%f22
	for	%f2,	%f16,	%f24
	fpadd32	%f6,	%f16,	%f28
	movrlz	%l6,	0x18C,	%i5
	bne	%icc,	loop_822
	brnz,a	%o1,	loop_823
	fmul8x16au	%f17,	%f6,	%f18
	fcmpne32	%f20,	%f12,	%i6
loop_822:
	movrne	%l2,	%o0,	%o2
loop_823:
	nop
	setx loop_824, %l0, %l1
	jmpl %l1, %i0
	fmovsle	%xcc,	%f12,	%f13
	xnorcc	%i3,	0x010A,	%o7
	brz,a	%o3,	loop_825
loop_824:
	tpos	%icc,	0x2
	andn	%l4,	%l3,	%o4
	movrlez	%l0,	%g1,	%o6
loop_825:
	ldsh	[%l7 + 0x76],	%i7
	xnorcc	%i1,	0x09D5,	%g5
	fmovdleu	%xcc,	%f29,	%f2
	movg	%icc,	%i2,	%g4
	taddcctv	%g7,	0x0E03,	%g2
	sra	%g3,	0x0B,	%l5
	taddcc	%o5,	%l1,	%i4
	array8	%g6,	%l6,	%i5
	edge8n	%o1,	%l2,	%i6
	sir	0x0114
	nop
	setx	loop_826,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%o2,	0x1BE4,	%i0
	subcc	%i3,	0x1E41,	%o0
	or	%o3,	%o7,	%l3
loop_826:
	alignaddr	%o4,	%l0,	%g1
	call	loop_827
	tcc	%icc,	0x6
	bneg,a	%xcc,	loop_828
	edge32n	%l4,	%i7,	%o6
loop_827:
	orcc	%g5,	0x1CAE,	%i2
	bleu	loop_829
loop_828:
	xor	%g4,	0x126E,	%g7
	set	0x30, %i4
	swapa	[%l7 + %i4] 0x80,	%g2
loop_829:
	fmovde	%icc,	%f29,	%f17
	srlx	%g3,	%i1,	%l5
	fmovsvc	%xcc,	%f23,	%f3
	fblg,a	%fcc3,	loop_830
	fbo	%fcc3,	loop_831
	umul	%l1,	0x0AAA,	%o5
	mulscc	%i4,	0x0BEA,	%g6
loop_830:
	udiv	%l6,	0x1A10,	%i5
loop_831:
	subccc	%o1,	%l2,	%i6
	bpos	%xcc,	loop_832
	movg	%xcc,	%o2,	%i3
	sdivcc	%i0,	0x1A16,	%o0
	fmovrsgez	%o3,	%f3,	%f12
loop_832:
	nop
	setx	0x9064B845,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	fnands	%f19,	%f13,	%f10
	nop
	fitos	%f3,	%f24
	fstod	%f24,	%f16
	fbug,a	%fcc2,	loop_833
	sth	%l3,	[%l7 + 0x26]
	sth	%o4,	[%l7 + 0x10]
	addccc	%l0,	%g1,	%o7
loop_833:
	bn,a	%xcc,	loop_834
	tsubcc	%i7,	0x1DB6,	%o6
	edge16ln	%g5,	%i2,	%l4
	ldstub	[%l7 + 0x68],	%g4
loop_834:
	bgu	loop_835
	popc	%g7,	%g2
	fcmpeq32	%f20,	%f14,	%i1
	set	0x44, %i5
	lduwa	[%l7 + %i5] 0x15,	%l5
loop_835:
	movcc	%icc,	%l1,	%o5
	movrgz	%g3,	%i4,	%g6
	movge	%icc,	%i5,	%o1
	tsubcctv	%l2,	0x1514,	%i6
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x0c
	tneg	%xcc,	0x6
	ld	[%l7 + 0x7C],	%f20
	brlz,a	%l6,	loop_836
	fmul8x16au	%f23,	%f15,	%f6
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x58] %asi,	%o2
loop_836:
	nop
	set	0x58, %g1
	std	%f2,	[%l7 + %g1]
	brlz	%i3,	loop_837
	fcmpgt32	%f8,	%f28,	%o0
	edge16	%o3,	%l3,	%o4
	ldsw	[%l7 + 0x2C],	%l0
loop_837:
	brgez	%g1,	loop_838
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o7,	[%l7 + 0x50]
	movge	%xcc,	%i7,	%i0
loop_838:
	movleu	%xcc,	%o6,	%i2
	tgu	%icc,	0x2
	nop
	setx	0x2857BD8F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xF981CBFB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f4,	%f27
	array16	%g5,	%l4,	%g7
	edge32l	%g2,	%g4,	%l5
	tle	%xcc,	0x1
	srax	%l1,	0x1E,	%o5
	brnz	%i1,	loop_839
	movrlz	%i4,	%g6,	%i5
	tge	%xcc,	0x4
	bvc,pt	%xcc,	loop_840
loop_839:
	fmovdg	%icc,	%f30,	%f12
	set	0x4D, %i0
	ldstuba	[%l7 + %i0] 0x10,	%g3
loop_840:
	nop
	set	0x40, %i7
	stda	%f0,	[%l7 + %i7] 0x10
	edge16l	%l2,	%i6,	%o1
	mulscc	%l6,	0x1E32,	%o2
	tne	%xcc,	0x1
	movl	%icc,	%o0,	%o3
	fbue,a	%fcc0,	loop_841
	movle	%icc,	%l3,	%i3
	movcs	%icc,	%l0,	%o4
	ldd	[%l7 + 0x28],	%g0
loop_841:
	bcs	%xcc,	loop_842
	nop
	set	0x2C, %o6
	lduh	[%l7 + %o6],	%o7
	nop
	set	0x15, %g6
	stb	%i7,	[%l7 + %g6]
	fmovrsgz	%i0,	%f24,	%f3
loop_842:
	andncc	%o6,	%g5,	%l4
	tpos	%icc,	0x0
	nop
	fitos	%f9,	%f9
	fstox	%f9,	%f16
	fxtos	%f16,	%f31
	fnot2	%f6,	%f10
	alignaddr	%i2,	%g2,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f13,	%f1,	%f29
	tl	%icc,	0x2
	fmovdneg	%icc,	%f13,	%f14
	fsrc1	%f26,	%f16
	movrne	%g4,	0x146,	%l5
	fmovdleu	%xcc,	%f3,	%f9
	umul	%l1,	0x1912,	%i1
	fbl	%fcc2,	loop_843
	edge32	%o5,	%i4,	%i5
	sub	%g6,	0x053E,	%g3
	udivx	%l2,	0x123F,	%i6
loop_843:
	andn	%l6,	%o2,	%o1
	bge,a,pt	%icc,	loop_844
	nop
	setx	0xF06731E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	call	loop_845
	sth	%o3,	[%l7 + 0x5C]
loop_844:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x48] %asi,	%f19
loop_845:
	fcmpne32	%f30,	%f24,	%l3
	movg	%xcc,	%i3,	%o0
	xor	%l0,	0x0E4A,	%o4
	set	0x310, %g7
	nop 	! 	nop 	! 	ldxa	[%g0 + %g7] 0x40,	%o7 ripped by fixASI40.pl ripped by fixASI40.pl
	edge8n	%g1,	%i7,	%i0
	fmovrdlz	%g5,	%f12,	%f8
	edge16n	%l4,	%i2,	%g2
	taddcc	%g7,	%g4,	%o6
	fmovsne	%xcc,	%f29,	%f25
	edge16ln	%l5,	%l1,	%o5
	xnorcc	%i1,	%i5,	%g6
	swap	[%l7 + 0x18],	%i4
	array8	%g3,	%i6,	%l6
	ble,pt	%xcc,	loop_846
	fmovdle	%xcc,	%f28,	%f27
	stx	%l2,	[%l7 + 0x38]
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x52] %asi,	%o2
loop_846:
	sdivcc	%o1,	0x10BA,	%o3
	set	0x31, %i2
	stba	%i3,	[%l7 + %i2] 0x80
	st	%f0,	[%l7 + 0x24]
	edge8ln	%o0,	%l0,	%l3
	fmovse	%xcc,	%f11,	%f11
	xorcc	%o4,	0x10CF,	%g1
	movcc	%xcc,	%i7,	%i0
	for	%f10,	%f4,	%f20
	addcc	%g5,	0x1367,	%o7
	movl	%icc,	%l4,	%g2
	move	%xcc,	%i2,	%g7
	subccc	%o6,	0x1A97,	%l5
	nop
	setx	0x41F2E3FF205DEE16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	fitod	%f4,	%f4
	fdtox	%f4,	%f18
	smul	%g4,	0x0F01,	%o5
	fandnot1	%f16,	%f4,	%f6
	ble,a,pt	%xcc,	loop_847
	srax	%l1,	%i1,	%i5
	movpos	%xcc,	%i4,	%g6
	fmovsn	%icc,	%f29,	%f10
loop_847:
	fmul8sux16	%f28,	%f14,	%f28
	tneg	%icc,	0x4
	smulcc	%g3,	%l6,	%i6
	fmovrdlz	%l2,	%f20,	%f2
	set	0x0E, %g5
	lduba	[%l7 + %g5] 0x89,	%o1
	edge32	%o2,	%o3,	%i3
	fba,a	%fcc1,	loop_848
	move	%icc,	%l0,	%o0
	tne	%icc,	0x1
	bneg,pn	%xcc,	loop_849
loop_848:
	edge32n	%l3,	%o4,	%g1
	fornot2	%f22,	%f26,	%f12
	array32	%i7,	%g5,	%o7
loop_849:
	nop
	fitos	%f13,	%f26
	fstox	%f26,	%f24
	fandnot2	%f14,	%f0,	%f10
	srax	%i0,	%l4,	%i2
	fmovrdgez	%g7,	%f26,	%f10
	subccc	%g2,	%o6,	%l5
	movrlez	%g4,	%o5,	%l1
	movn	%icc,	%i1,	%i5
	alignaddr	%g6,	%i4,	%g3
	fnor	%f2,	%f20,	%f22
	tne	%icc,	0x3
	tneg	%icc,	0x7
	movvs	%icc,	%i6,	%l6
	tsubcctv	%o1,	0x1615,	%l2
	tvc	%icc,	0x0
	fmul8ulx16	%f28,	%f0,	%f20
	set	0x4E, %i3
	stha	%o3,	[%l7 + %i3] 0x2f
	membar	#Sync
	movge	%icc,	%i3,	%o2
	fnegd	%f12,	%f12
	movneg	%icc,	%l0,	%o0
	nop
	setx	0x8642B2CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x68EFF083,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f24,	%f26
	fabss	%f5,	%f4
	fmovdvc	%xcc,	%f14,	%f16
	movrlez	%l3,	0x183,	%g1
	popc	0x0D43,	%i7
	srax	%g5,	%o7,	%i0
	udiv	%l4,	0x0C7A,	%i2
	tsubcc	%o4,	0x0BFB,	%g2
	nop
	setx	0xCA46738C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x061433F2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f4,	%f1
	tne	%xcc,	0x1
	fmovsn	%icc,	%f27,	%f12
	subcc	%g7,	%o6,	%l5
	edge8	%g4,	%o5,	%i1
	nop
	set	0x58, %o3
	sth	%l1,	[%l7 + %o3]
	tvc	%icc,	0x5
	ta	%xcc,	0x3
	bl,pt	%xcc,	loop_850
	xnor	%g6,	0x0618,	%i5
	bpos,a,pt	%xcc,	loop_851
	udivcc	%i4,	0x19B3,	%g3
loop_850:
	ble,pn	%icc,	loop_852
	st	%f2,	[%l7 + 0x08]
loop_851:
	fmuld8sux16	%f24,	%f9,	%f24
	sdivcc	%i6,	0x0DC7,	%l6
loop_852:
	brgez	%l2,	loop_853
	fnot2	%f12,	%f10
	fpsub16	%f6,	%f10,	%f4
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x14,	%f16
loop_853:
	tsubcctv	%o1,	0x1A81,	%o3
	fcmpne32	%f0,	%f30,	%i3
	orcc	%o2,	0x16B0,	%l0
	umul	%l3,	%g1,	%o0
	movge	%xcc,	%i7,	%o7
	sethi	0x037D,	%g5
	sir	0x16F3
	orcc	%l4,	%i2,	%i0
	lduw	[%l7 + 0x14],	%g2
	smulcc	%o4,	%o6,	%g7
	brlz,a	%l5,	loop_854
	movvc	%xcc,	%o5,	%g4
	movne	%xcc,	%i1,	%l1
	addcc	%g6,	0x04AB,	%i4
loop_854:
	sth	%i5,	[%l7 + 0x7C]
	fblg,a	%fcc2,	loop_855
	smulcc	%g3,	%i6,	%l6
	addcc	%o1,	0x06E3,	%l2
	movvs	%icc,	%i3,	%o3
loop_855:
	fbg	%fcc2,	loop_856
	tvc	%icc,	0x3
	fmul8x16	%f5,	%f22,	%f14
	sethi	0x09E9,	%o2
loop_856:
	fcmpgt32	%f20,	%f16,	%l3
	fmovda	%xcc,	%f24,	%f30
	movvc	%xcc,	%l0,	%o0
	orn	%g1,	%i7,	%g5
	fexpand	%f21,	%f16
	smulcc	%l4,	0x08C9,	%i2
	movne	%icc,	%o7,	%i0
	taddcctv	%g2,	%o4,	%o6
	movneg	%xcc,	%g7,	%l5
	fnot2	%f6,	%f20
	umulcc	%g4,	%o5,	%l1
	tneg	%icc,	0x2
	fmovrslz	%g6,	%f28,	%f16
	set	0x0C, %l2
	stwa	%i1,	[%l7 + %l2] 0x04
	bcc,a	loop_857
	fcmpgt16	%f16,	%f24,	%i5
	taddcctv	%i4,	%g3,	%i6
	edge16ln	%o1,	%l2,	%l6
loop_857:
	udivcc	%o3,	0x096E,	%o2
	fsrc2	%f22,	%f4
	edge32n	%l3,	%i3,	%l0
	andncc	%g1,	%o0,	%g5
	mulx	%i7,	0x1A8E,	%i2
	movge	%icc,	%l4,	%i0
	fbl	%fcc3,	loop_858
	fmovrdlez	%o7,	%f14,	%f4
	umulcc	%o4,	%g2,	%g7
	nop
	setx	0x614D8AFD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x23486DE4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f4,	%f11
loop_858:
	movvs	%icc,	%o6,	%g4
	movvs	%icc,	%o5,	%l5
	xor	%l1,	0x1C3F,	%i1
	fbe,a	%fcc2,	loop_859
	edge8l	%i5,	%i4,	%g6
	fbg,a	%fcc3,	loop_860
	ldsb	[%l7 + 0x0B],	%g3
loop_859:
	movre	%o1,	0x23E,	%l2
	array8	%l6,	%o3,	%o2
loop_860:
	ld	[%l7 + 0x30],	%f20
	movleu	%xcc,	%l3,	%i3
	tpos	%xcc,	0x5
	xor	%i6,	%g1,	%l0
	bvc	%icc,	loop_861
	fmovrdne	%g5,	%f18,	%f28
	smul	%i7,	%i2,	%o0
	movvs	%icc,	%i0,	%o7
loop_861:
	fmovdvs	%icc,	%f22,	%f18
	alignaddrl	%o4,	%g2,	%g7
	sdiv	%l4,	0x1FBD,	%g4
	movl	%icc,	%o5,	%l5
	popc	0x168D,	%l1
	bge	loop_862
	add	%i1,	0x1EBF,	%o6
	tvc	%icc,	0x2
	fbge,a	%fcc1,	loop_863
loop_862:
	udivx	%i4,	0x0DCB,	%g6
	edge32	%g3,	%o1,	%l2
	movcs	%xcc,	%i5,	%l6
loop_863:
	fexpand	%f13,	%f16
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x18,	%o3,	%o2
	array32	%i3,	%i6,	%l3
	nop
	setx	0xE06E9D53,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fors	%f15,	%f24,	%f13
	fmul8x16al	%f5,	%f12,	%f14
	tsubcc	%g1,	0x1CFC,	%l0
	sll	%g5,	0x0F,	%i7
	subc	%i2,	0x0936,	%o0
	fmovdcc	%icc,	%f1,	%f26
	addc	%i0,	%o7,	%o4
	smulcc	%g2,	%l4,	%g4
	fmovdneg	%xcc,	%f10,	%f28
	fmovrslez	%o5,	%f4,	%f30
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x70] %asi,	%l4
	ba	loop_864
	fmovdvc	%icc,	%f12,	%f1
	fxors	%f13,	%f2,	%f28
	xorcc	%l1,	%i1,	%o6
loop_864:
	smul	%g7,	%i4,	%g6
	nop
	set	0x5C, %o0
	lduw	[%l7 + %o0],	%g3
	orn	%l2,	%o1,	%l6
	fbne	%fcc3,	loop_865
	smulcc	%o3,	%i5,	%o2
	tg	%icc,	0x5
	te	%icc,	0x1
loop_865:
	move	%icc,	%i3,	%l3
	sdivx	%g1,	0x00DD,	%l0
	orn	%i6,	%g5,	%i7
	fmovrse	%o0,	%f13,	%f31
	ta	%icc,	0x6
	set	0x28, %o7
	prefetcha	[%l7 + %o7] 0x14,	 0x0
	movvc	%xcc,	%i2,	%o4
	ble	%xcc,	loop_866
	fcmpgt32	%f8,	%f30,	%g2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x60] %asi,	%l4
loop_866:
	fbn,a	%fcc0,	loop_867
	udivx	%o7,	0x0D80,	%g4
	movvc	%xcc,	%o5,	%l1
	fcmple32	%f12,	%f10,	%l5
loop_867:
	movrgez	%i1,	0x38C,	%g7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i4,	%g6
	subc	%o6,	0x036D,	%l2
	fbo,a	%fcc1,	loop_868
	movrgez	%o1,	0x2CD,	%l6
	sra	%g3,	%o3,	%o2
	sllx	%i3,	%l3,	%g1
loop_868:
	nop
	set	0x60, %g2
	swapa	[%l7 + %g2] 0x80,	%i5
	fmovrse	%l0,	%f16,	%f14
	movrgez	%i6,	%i7,	%g5
	edge32n	%o0,	%i2,	%i0
	smulcc	%g2,	%l4,	%o4
	bpos,a	loop_869
	xor	%g4,	%o5,	%l1
	wr	%g0,	0x04,	%asi
	stha	%o7,	[%l7 + 0x1A] %asi
loop_869:
	sdivx	%i1,	0x0FCB,	%g7
	mova	%icc,	%i4,	%l5
	orcc	%g6,	%l2,	%o1
	movrlez	%o6,	%g3,	%l6
	wr	%g0,	0x89,	%asi
	stxa	%o2,	[%l7 + 0x28] %asi
	udiv	%i3,	0x05A6,	%l3
	movge	%icc,	%o3,	%i5
	nop
	setx loop_870, %l0, %l1
	jmpl %l1, %g1
	ble,a	loop_871
	edge16n	%i6,	%i7,	%g5
	brz	%o0,	loop_872
loop_870:
	nop
	setx	0xFAF2095F504A3E5F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_871:
	sra	%l0,	0x0E,	%i2
	stw	%i0,	[%l7 + 0x6C]
loop_872:
	mulx	%l4,	%o4,	%g4
	andcc	%g2,	%o5,	%l1
	ta	%xcc,	0x6
	fmovdn	%icc,	%f8,	%f15
	fbe,a	%fcc1,	loop_873
	nop
	setx	0x2857E953,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x34911370,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f8,	%f6
	edge16	%o7,	%i1,	%g7
	sll	%l5,	%g6,	%i4
loop_873:
	taddcctv	%l2,	%o6,	%o1
	orn	%g3,	0x0588,	%l6
	fmovrdlez	%o2,	%f6,	%f8
	movpos	%icc,	%i3,	%l3
	ta	%icc,	0x2
	ldsw	[%l7 + 0x2C],	%i5
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o3
	smul	%i6,	%g1,	%g5
	fbul	%fcc2,	loop_874
	udivcc	%o0,	0x0441,	%i7
	movrne	%i2,	0x0EC,	%i0
	mulx	%l0,	0x0D89,	%o4
loop_874:
	tcs	%icc,	0x4
	fbule,a	%fcc1,	loop_875
	movvc	%xcc,	%g4,	%l4
	and	%o5,	0x147F,	%l1
	edge32	%o7,	%i1,	%g7
loop_875:
	sir	0x1D09
	bneg	loop_876
	be,a,pt	%icc,	loop_877
	tsubcctv	%g2,	0x173C,	%l5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_876:
	fbne,a	%fcc1,	loop_878
loop_877:
	fmovdne	%xcc,	%f2,	%f15
	movl	%xcc,	%i4,	%g6
	fmovrsgez	%o6,	%f7,	%f15
loop_878:
	movcc	%icc,	%o1,	%l2
	sub	%g3,	0x1E1C,	%l6
	ldd	[%l7 + 0x78],	%i2
	edge32ln	%l3,	%i5,	%o2
	fpack32	%f10,	%f28,	%f16
	bvs,pn	%xcc,	loop_879
	fbug,a	%fcc3,	loop_880
	fbl	%fcc1,	loop_881
	fmovrslez	%i6,	%f30,	%f2
loop_879:
	bvs,a	%xcc,	loop_882
loop_880:
	mulx	%g1,	%o3,	%o0
loop_881:
	fba,a	%fcc1,	loop_883
	sub	%i7,	0x0EE5,	%i2
loop_882:
	fmovsge	%xcc,	%f24,	%f31
	ldstub	[%l7 + 0x63],	%g5
loop_883:
	sethi	0x1862,	%i0
	subcc	%o4,	%l0,	%l4
	nop
	setx	0x127CDAD3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xA9DA45B1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f7,	%f22
	fmovdvc	%xcc,	%f20,	%f9
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x54] %asi,	%o5
	set	0x6A, %o4
	stha	%l1,	[%l7 + %o4] 0xe2
	membar	#Sync
	tle	%xcc,	0x3
	set	0x74, %o1
	lda	[%l7 + %o1] 0x19,	%f19
	bg,a	%icc,	loop_884
	smul	%o7,	%g4,	%i1
	udivcc	%g7,	0x1FF8,	%g2
	addccc	%i4,	0x079A,	%g6
loop_884:
	ldd	[%l7 + 0x68],	%f14
	movneg	%icc,	%l5,	%o1
	tsubcc	%o6,	%l2,	%g3
	subccc	%l6,	0x17CA,	%l3
	tcc	%icc,	0x6
	fbule	%fcc3,	loop_885
	bn,pt	%icc,	loop_886
	ldsb	[%l7 + 0x1B],	%i5
	xorcc	%o2,	%i6,	%g1
loop_885:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_886:
	fmovdl	%xcc,	%f1,	%f8
	tcs	%xcc,	0x5
	mulscc	%o3,	0x16E3,	%o0
	srl	%i3,	%i7,	%i2
	taddcc	%g5,	%i0,	%o4
	fpadd32	%f30,	%f16,	%f6
	udiv	%l0,	0x16CE,	%o5
	fmovsvc	%xcc,	%f12,	%f5
	movrlez	%l1,	%o7,	%g4
	andcc	%i1,	0x1352,	%g7
	andn	%g2,	0x1AF4,	%i4
	alignaddr	%g6,	%l4,	%l5
	fmuld8ulx16	%f29,	%f11,	%f16
	bneg,a,pn	%xcc,	loop_887
	ldsh	[%l7 + 0x78],	%o1
	fmovdg	%icc,	%f26,	%f20
	tcc	%icc,	0x6
loop_887:
	udiv	%l2,	0x1811,	%g3
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%o6
	brz	%l6,	loop_888
	edge32ln	%l3,	%i5,	%o2
	set	0x38, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0x3
loop_888:
	be,a	loop_889
	addcc	%o3,	0x1ADB,	%o0
	nop
	fitos	%f9,	%f30
	fstox	%f30,	%f26
	umulcc	%i3,	0x17CF,	%g1
loop_889:
	bvc,a	loop_890
	xnorcc	%i2,	0x0908,	%g5
	edge32ln	%i0,	%i7,	%o4
	movle	%icc,	%o5,	%l0
loop_890:
	srl	%l1,	0x1A,	%o7
	fcmpeq32	%f14,	%f30,	%i1
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x74] %asi,	%g4
	fzeros	%f12
	fmovrdlez	%g2,	%f24,	%f12
	brgz	%i4,	loop_891
	movneg	%xcc,	%g6,	%l4
	fones	%f30
	srax	%g7,	%o1,	%l5
loop_891:
	bpos,pt	%icc,	loop_892
	andncc	%g3,	%o6,	%l6
	sra	%l2,	%i5,	%o2
	swap	[%l7 + 0x64],	%l3
loop_892:
	subccc	%i6,	%o0,	%i3
	sdiv	%g1,	0x1E73,	%o3
	fmovrdlez	%i2,	%f30,	%f6
	fnands	%f17,	%f3,	%f20
	xnor	%g5,	%i7,	%o4
	tg	%icc,	0x5
	st	%f25,	[%l7 + 0x0C]
	movge	%icc,	%o5,	%i0
	fnegd	%f16,	%f8
	mova	%icc,	%l1,	%l0
	fmovsa	%xcc,	%f9,	%f24
	set	0x64, %l3
	ldswa	[%l7 + %l3] 0x80,	%i1
	tleu	%icc,	0x1
	array16	%g4,	%o7,	%i4
	tcs	%xcc,	0x1
	edge32ln	%g6,	%l4,	%g7
	mulscc	%g2,	%o1,	%g3
	fmovscc	%xcc,	%f24,	%f5
	set	0x48, %l4
	stwa	%o6,	[%l7 + %l4] 0x04
	fpmerge	%f12,	%f4,	%f12
	edge8l	%l6,	%l5,	%i5
	tn	%xcc,	0x6
	tsubcc	%l2,	0x0894,	%o2
	fmovrdlz	%l3,	%f26,	%f14
	fmovdg	%icc,	%f14,	%f25
	fornot2s	%f31,	%f22,	%f31
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbule,a	%fcc2,	loop_893
	udiv	%i6,	0x1797,	%i3
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_893:
	edge32l	%o0,	%o3,	%g1
	ldsh	[%l7 + 0x18],	%g5
	fabsd	%f24,	%f14
	tpos	%icc,	0x4
	fmovsleu	%xcc,	%f5,	%f24
	movrne	%i7,	%i2,	%o5
	add	%o4,	0x15C4,	%l1
	edge8ln	%l0,	%i1,	%g4
	move	%icc,	%o7,	%i0
	stx	%g6,	[%l7 + 0x68]
	fbu	%fcc0,	loop_894
	movrgez	%l4,	0x3BB,	%i4
	movge	%xcc,	%g2,	%g7
	movvs	%icc,	%o1,	%g3
loop_894:
	tn	%xcc,	0x1
	movneg	%icc,	%l6,	%o6
	edge8ln	%l5,	%i5,	%l2
	sth	%o2,	[%l7 + 0x68]
	st	%f14,	[%l7 + 0x5C]
	tvs	%xcc,	0x1
	srlx	%l3,	0x12,	%i6
	udiv	%i3,	0x1BF2,	%o0
	fmovrde	%o3,	%f26,	%f2
	alignaddr	%g5,	%g1,	%i2
	sll	%i7,	0x00,	%o5
	edge16l	%l1,	%o4,	%l0
	sll	%i1,	0x1F,	%g4
	edge32l	%o7,	%g6,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f18,	%f14,	%f16
	andn	%l4,	%g2,	%g7
	fmovsvs	%xcc,	%f28,	%f15
	fxors	%f29,	%f24,	%f0
	orn	%o1,	%i4,	%g3
	fabss	%f21,	%f4
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fands	%f23,	%f14,	%f7
	xnorcc	%o6,	0x1938,	%l5
	fbue,a	%fcc2,	loop_895
	sllx	%l6,	0x09,	%l2
	udivx	%i5,	0x0754,	%o2
	fmovrdne	%i6,	%f2,	%f24
loop_895:
	tl	%xcc,	0x5
	fxor	%f12,	%f24,	%f22
	movcc	%xcc,	%i3,	%o0
	andn	%o3,	%g5,	%l3
	edge32l	%i2,	%i7,	%o5
	fmuld8ulx16	%f14,	%f4,	%f12
	sethi	0x1FBB,	%l1
	udivcc	%o4,	0x0980,	%g1
	edge8l	%i1,	%l0,	%o7
	fmovd	%f16,	%f10
	movcc	%xcc,	%g4,	%g6
	tl	%icc,	0x0
	nop
	setx	0x2630CFB445597C33,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x51D10240F19E9BA7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f4,	%f20
	tg	%icc,	0x7
	fsrc1	%f22,	%f30
	mulx	%l4,	0x1DF2,	%g2
	sub	%g7,	0x10D1,	%o1
	movge	%xcc,	%i4,	%g3
	umul	%o6,	%l5,	%l6
	brnz,a	%l2,	loop_896
	tn	%xcc,	0x5
	tleu	%icc,	0x5
	bvs,a,pn	%icc,	loop_897
loop_896:
	srl	%i5,	%o2,	%i0
	ldd	[%l7 + 0x60],	%f20
	wr	%g0,	0x80,	%asi
	stxa	%i6,	[%l7 + 0x48] %asi
loop_897:
	nop
	set	0x18, %l0
	prefetcha	[%l7 + %l0] 0x81,	 0x0
	ble,pn	%icc,	loop_898
	edge16l	%i3,	%g5,	%o3
	srl	%i2,	%i7,	%o5
	srax	%l3,	%o4,	%l1
loop_898:
	sdiv	%i1,	0x0534,	%l0
	stx	%g1,	[%l7 + 0x40]
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x34] %asi,	%f16
	edge8n	%g4,	%g6,	%o7
	fpsub32s	%f19,	%f19,	%f6
	smul	%g2,	%g7,	%l4
	alignaddr	%i4,	%g3,	%o6
	tvs	%icc,	0x5
	tvs	%xcc,	0x5
	call	loop_899
	ld	[%l7 + 0x5C],	%f31
	movcs	%xcc,	%o1,	%l5
	flush	%l7 + 0x1C
loop_899:
	ldsw	[%l7 + 0x1C],	%l2
	tl	%xcc,	0x1
	udivcc	%l6,	0x07C3,	%i5
	movrgez	%o2,	%i0,	%i6
	movrlz	%i3,	%g5,	%o3
	and	%i2,	%i7,	%o0
	fmovsg	%xcc,	%f24,	%f22
	sethi	0x14D6,	%l3
	brnz,a	%o4,	loop_900
	fmovrde	%o5,	%f2,	%f2
	and	%i1,	%l0,	%l1
	sllx	%g4,	%g6,	%o7
loop_900:
	move	%icc,	%g2,	%g1
	brlez	%g7,	loop_901
	fbul	%fcc0,	loop_902
	movvc	%icc,	%l4,	%i4
	lduw	[%l7 + 0x70],	%g3
loop_901:
	edge8l	%o1,	%l5,	%l2
loop_902:
	nop
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x78] %asi,	%l6
	tpos	%icc,	0x3
	bneg,pt	%icc,	loop_903
	edge32n	%i5,	%o2,	%i0
	set	0x10, %g4
	ldxa	[%l7 + %g4] 0x15,	%o6
loop_903:
	move	%xcc,	%i6,	%i3
	add	%o3,	%g5,	%i2
	movneg	%icc,	%i7,	%o0
	ldd	[%l7 + 0x28],	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o4,	0x0B,	%l3
	pdist	%f18,	%f22,	%f28
	edge16	%o5,	%l0,	%l1
	srax	%g4,	0x09,	%i1
	tcc	%xcc,	0x7
	tgu	%xcc,	0x1
	fcmpne16	%f30,	%f10,	%g6
	fornot1	%f2,	%f16,	%f24
	fbge,a	%fcc3,	loop_904
	fble,a	%fcc0,	loop_905
	fandnot2s	%f9,	%f6,	%f0
	tneg	%icc,	0x6
loop_904:
	orn	%g2,	0x0E51,	%g1
loop_905:
	mulscc	%g7,	%l4,	%i4
	sra	%o7,	%g3,	%o1
	umulcc	%l5,	0x04F4,	%l2
	fba	%fcc0,	loop_906
	nop
	fitos	%f3,	%f9
	fstod	%f9,	%f10
	edge32n	%i5,	%l6,	%i0
	taddcctv	%o6,	0x1BFE,	%i6
loop_906:
	add	%i3,	%o2,	%o3
	sir	0x044F
	xnorcc	%i2,	0x1B27,	%i7
	tgu	%icc,	0x1
	tne	%xcc,	0x7
	movn	%xcc,	%g5,	%o0
	tl	%xcc,	0x6
	fmovsne	%xcc,	%f10,	%f21
	udivx	%l3,	0x109E,	%o4
	tgu	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o5,	0x06CC,	%l1
	bgu	%xcc,	loop_907
	fmovrse	%l0,	%f11,	%f24
	mulx	%i1,	%g6,	%g2
	fornot2	%f14,	%f24,	%f24
loop_907:
	or	%g4,	0x009D,	%g7
	sdivcc	%g1,	0x0B5E,	%i4
	edge8	%o7,	%g3,	%o1
	fzero	%f12
	te	%xcc,	0x5
	edge32	%l4,	%l5,	%l2
	nop
	setx loop_908, %l0, %l1
	jmpl %l1, %i5
	mulx	%i0,	%l6,	%i6
	fandnot1s	%f31,	%f30,	%f31
	movne	%xcc,	%o6,	%i3
loop_908:
	movcc	%icc,	%o2,	%i2
	srlx	%o3,	0x00,	%g5
	fba	%fcc3,	loop_909
	subccc	%i7,	%l3,	%o0
	taddcctv	%o4,	%o5,	%l1
	ldsw	[%l7 + 0x64],	%i1
loop_909:
	fornot1	%f26,	%f10,	%f26
	udivx	%l0,	0x1AA0,	%g2
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x18
	std	%f2,	[%l7 + 0x30]
	addcc	%g4,	0x07BC,	%g7
	sdiv	%g6,	0x03B1,	%i4
	fnands	%f12,	%f12,	%f12
	tcs	%icc,	0x0
	fblg	%fcc3,	loop_910
	movne	%xcc,	%g1,	%g3
	fmovdleu	%xcc,	%f24,	%f13
	set	0x42, %l6
	stba	%o7,	[%l7 + %l6] 0x88
loop_910:
	andcc	%l4,	0x1375,	%o1
	nop
	fitod	%f0,	%f4
	fdtos	%f4,	%f22
	tvc	%icc,	0x3
	movre	%l5,	%l2,	%i0
	move	%icc,	%i5,	%i6
	movn	%icc,	%l6,	%i3
	fmovdne	%xcc,	%f0,	%f20
	fmovdneg	%icc,	%f8,	%f12
	movpos	%icc,	%o2,	%i2
	nop
	setx	loop_911,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdcc	%xcc,	%f3,	%f26
	srl	%o6,	0x07,	%o3
	fmovdle	%xcc,	%f15,	%f11
loop_911:
	nop
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x68] %asi,	%g5
	fbn	%fcc1,	loop_912
	fzero	%f26
	movle	%icc,	%l3,	%o0
	tcs	%xcc,	0x5
loop_912:
	and	%i7,	0x1BF2,	%o5
	movrlz	%o4,	%i1,	%l0
	movrlz	%l1,	0x2D8,	%g2
	movn	%icc,	%g4,	%g6
	fmul8sux16	%f14,	%f24,	%f20
	nop
	setx	0x549B6B96B072F7B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	subccc	%g7,	%g1,	%g3
	sra	%i4,	%o7,	%l4
	fbul	%fcc0,	loop_913
	fbne	%fcc0,	loop_914
	bcc	%icc,	loop_915
	addccc	%l5,	0x1B38,	%o1
loop_913:
	ldsb	[%l7 + 0x0B],	%l2
loop_914:
	edge32n	%i0,	%i6,	%l6
loop_915:
	bvc,a	loop_916
	andn	%i3,	%o2,	%i2
	fbg	%fcc3,	loop_917
	fbge	%fcc3,	loop_918
loop_916:
	fbne,a	%fcc3,	loop_919
	ld	[%l7 + 0x40],	%f6
loop_917:
	bpos	%xcc,	loop_920
loop_918:
	movleu	%icc,	%i5,	%o6
loop_919:
	tsubcctv	%o3,	0x0FD4,	%l3
	movl	%icc,	%o0,	%i7
loop_920:
	addcc	%g5,	0x15BC,	%o4
	set	0x30, %o2
	stxa	%i1,	[%g0 + %o2] 0x4f
	mulx	%o5,	0x0AA9,	%l0
	taddcctv	%g2,	%l1,	%g6
	taddcctv	%g4,	0x0C61,	%g1
	movle	%icc,	%g3,	%i4
	edge32n	%o7,	%g7,	%l4
	movgu	%xcc,	%l5,	%o1
	tvc	%icc,	0x6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x58] %asi,	%i0
	edge16	%i6,	%l2,	%l6
	or	%i3,	0x0E4B,	%o2
	subc	%i5,	%o6,	%i2
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o3
	bneg	loop_921
	fmovrdgz	%l3,	%f28,	%f6
	edge8l	%o0,	%i7,	%g5
	fbl	%fcc2,	loop_922
loop_921:
	addccc	%o4,	0x19A2,	%o5
	xorcc	%l0,	%g2,	%i1
	orncc	%g6,	%l1,	%g4
loop_922:
	array32	%g3,	%i4,	%g1
	fxor	%f4,	%f12,	%f18
	set	0x1C, %o5
	stwa	%o7,	[%l7 + %o5] 0x0c
	xorcc	%g7,	%l5,	%o1
	fbuge,a	%fcc0,	loop_923
	srax	%l4,	0x17,	%i0
	bge,a	loop_924
	srlx	%i6,	%l2,	%i3
loop_923:
	fmul8x16au	%f2,	%f19,	%f6
	sth	%l6,	[%l7 + 0x34]
loop_924:
	fmovsn	%icc,	%f6,	%f19
	movleu	%xcc,	%i5,	%o6
	movleu	%icc,	%i2,	%o2
	andn	%l3,	0x1DB7,	%o0
	set	0x0E, %i4
	ldsha	[%l7 + %i4] 0x81,	%i7
	brgez	%o3,	loop_925
	fpack16	%f30,	%f25
	stb	%g5,	[%l7 + 0x42]
	smulcc	%o4,	0x01FF,	%l0
loop_925:
	fmovscs	%xcc,	%f13,	%f19
	movpos	%xcc,	%o5,	%i1
	ldstub	[%l7 + 0x55],	%g6
	tle	%xcc,	0x0
	sdiv	%g2,	0x19CA,	%l1
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x34] %asi,	%g4
	taddcctv	%i4,	0x0A78,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x2
	fbge	%fcc1,	loop_926
	movvc	%icc,	%o7,	%g3
	xnor	%l5,	%g7,	%o1
	movle	%icc,	%l4,	%i6
loop_926:
	lduh	[%l7 + 0x0C],	%i0
	fmul8x16au	%f15,	%f2,	%f14
	edge16l	%i3,	%l2,	%i5
	movrne	%o6,	%i2,	%l6
	bn,a,pt	%xcc,	loop_927
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f12
	ldsw	[%l7 + 0x48],	%o2
	movrlez	%l3,	0x296,	%o0
loop_927:
	nop
	wr	%g0,	0x18,	%asi
	stha	%i7,	[%l7 + 0x1C] %asi
	alignaddrl	%o3,	%g5,	%l0
	orn	%o5,	0x0453,	%o4
	movre	%i1,	0x370,	%g2
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	orn	%g6,	%g4,	%i4
	fbn	%fcc1,	loop_928
	tcc	%icc,	0x5
	movn	%icc,	%g1,	%l1
	edge32ln	%g3,	%o7,	%g7
loop_928:
	flush	%l7 + 0x14
	ta	%xcc,	0x6
	nop
	setx loop_929, %l0, %l1
	jmpl %l1, %o1
	ldub	[%l7 + 0x4F],	%l4
	edge16l	%l5,	%i0,	%i6
	array32	%i3,	%i5,	%o6
loop_929:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x0E] %asi,	%i2
	fbn	%fcc2,	loop_930
	nop
	setx	loop_931,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	std	%f24,	[%l7 + 0x70]
	bvs,a,pn	%xcc,	loop_932
loop_930:
	fble	%fcc3,	loop_933
loop_931:
	popc	0x0FE5,	%l6
	nop
	setx	0x12E0DCCA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x560E1756,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f5,	%f20
loop_932:
	bneg,a	%xcc,	loop_934
loop_933:
	add	%o2,	%l3,	%o0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x58] %asi,	%f5
loop_934:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x1E] %asi,	%i7
	sdivx	%l2,	0x0EAD,	%g5
	edge16ln	%l0,	%o5,	%o3
	sethi	0x09AC,	%o4
	fmovdl	%xcc,	%f9,	%f9
	move	%xcc,	%i1,	%g2
	fpsub16	%f18,	%f28,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f8,	%f8,	%f12
	movl	%icc,	%g6,	%g4
	bl,a,pn	%xcc,	loop_935
	subc	%g1,	0x008F,	%l1
	movrgez	%g3,	0x17D,	%i4
	tg	%xcc,	0x6
loop_935:
	edge32l	%g7,	%o1,	%o7
	sdivcc	%l5,	0x0E62,	%i0
	smulcc	%l4,	0x018C,	%i6
	fandnot1s	%f4,	%f2,	%f15
	fandnot1	%f18,	%f6,	%f24
	nop
	setx	0xB1F5CC86,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xC3A095A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f9,	%f6
	bne,a,pt	%icc,	loop_936
	movl	%xcc,	%i5,	%o6
	edge8	%i3,	%i2,	%o2
	tvc	%icc,	0x4
loop_936:
	umulcc	%l3,	%l6,	%o0
	fnot2	%f30,	%f12
	set	0x10, %l1
	stha	%i7,	[%l7 + %l1] 0x22
	membar	#Sync
	movle	%xcc,	%l2,	%g5
	bcs,pn	%xcc,	loop_937
	move	%xcc,	%o5,	%o3
	tsubcc	%o4,	0x1A69,	%l0
	fbne	%fcc2,	loop_938
loop_937:
	bleu,a	%icc,	loop_939
	smul	%g2,	%g6,	%g4
	movrlz	%i1,	0x330,	%g1
loop_938:
	movcs	%icc,	%l1,	%i4
loop_939:
	orn	%g3,	0x0738,	%o1
	edge8	%o7,	%l5,	%i0
	tleu	%xcc,	0x4
	srax	%g7,	0x04,	%i6
	brnz,a	%l4,	loop_940
	andn	%i5,	%i3,	%i2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%o2
loop_940:
	movvc	%xcc,	%l6,	%l3
	te	%icc,	0x2
	alignaddr	%o0,	%i7,	%l2
	and	%o5,	%g5,	%o4
	andncc	%o3,	%g2,	%g6
	fbug,a	%fcc2,	loop_941
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x18
	bcc,a,pt	%icc,	loop_942
loop_941:
	fmovdle	%xcc,	%f6,	%f2
	sub	%g4,	%l0,	%g1
	nop
	setx	0xD19D7FA9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x2541032E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f22,	%f0
loop_942:
	edge32l	%i1,	%i4,	%l1
	alignaddrl	%o1,	%g3,	%o7
	tpos	%xcc,	0x3
	alignaddrl	%l5,	%i0,	%g7
	umulcc	%i6,	0x0A96,	%l4
	set	0x56, %i6
	stha	%i5,	[%l7 + %i6] 0xea
	membar	#Sync
	fabsd	%f0,	%f22
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%i2
	tge	%xcc,	0x6
	fnands	%f14,	%f23,	%f9
	tvc	%xcc,	0x3
	fmovsvs	%xcc,	%f3,	%f6
	fmovsgu	%icc,	%f6,	%f27
	std	%f8,	[%l7 + 0x68]
	fabss	%f3,	%f24
	orncc	%o2,	0x1AFB,	%l6
	or	%l3,	%o0,	%o6
	orcc	%l2,	%o5,	%g5
	taddcc	%i7,	0x19B8,	%o3
	andn	%g2,	0x1E49,	%o4
	set	0x58, %g1
	prefetcha	[%l7 + %g1] 0x18,	 0x1
	fxors	%f2,	%f15,	%f18
	fandnot1	%f14,	%f18,	%f18
	sll	%l0,	%g1,	%i1
	andn	%g6,	%l1,	%o1
	andcc	%i4,	0x0792,	%g3
	srl	%l5,	%i0,	%g7
	edge8l	%o7,	%i6,	%i5
	fmovrsne	%i3,	%f31,	%f30
	membar	0x54
	fmovrdlz	%i2,	%f14,	%f26
	edge32	%o2,	%l6,	%l4
	edge32ln	%o0,	%l3,	%l2
	array32	%o6,	%g5,	%o5
	taddcctv	%i7,	0x0E3E,	%o3
	and	%o4,	0x10FB,	%g2
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x58] %asi,	%g4
	fmovsvs	%icc,	%f11,	%f2
	tcs	%xcc,	0x5
	edge16l	%l0,	%g1,	%g6
	tne	%xcc,	0x1
	xorcc	%l1,	0x07AD,	%i1
	ldstub	[%l7 + 0x7A],	%o1
	fmovsleu	%icc,	%f26,	%f28
	ldsb	[%l7 + 0x27],	%g3
	srax	%l5,	%i4,	%i0
	movrne	%g7,	0x3D7,	%o7
	fmovspos	%icc,	%f17,	%f6
	fmovsneg	%xcc,	%f31,	%f23
	fmovsvc	%icc,	%f27,	%f16
	mulscc	%i6,	0x1BA4,	%i3
	fmovdne	%xcc,	%f5,	%f22
	fpsub32	%f18,	%f14,	%f10
	bg,pn	%xcc,	loop_943
	smulcc	%i2,	0x0781,	%i5
	mulx	%l6,	%o2,	%o0
	andncc	%l3,	%l2,	%o6
loop_943:
	andncc	%l4,	%o5,	%g5
	prefetch	[%l7 + 0x24],	 0x0
	movgu	%xcc,	%o3,	%o4
	fmovrdgz	%i7,	%f6,	%f20
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%g4
	taddcctv	%l0,	%g6,	%g1
	brgz	%l1,	loop_944
	movl	%xcc,	%i1,	%o1
	movpos	%xcc,	%g3,	%l5
	fmovdcc	%icc,	%f0,	%f20
loop_944:
	fpadd32s	%f26,	%f15,	%f6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%i4
	movpos	%xcc,	%g7,	%i0
	fzeros	%f5
	bvs,a,pn	%icc,	loop_945
	mulscc	%i6,	0x0FFC,	%i3
	movvc	%icc,	%i2,	%o7
	movl	%icc,	%i5,	%o2
loop_945:
	fpmerge	%f10,	%f27,	%f6
	ble,a	%xcc,	loop_946
	and	%o0,	%l3,	%l6
	tle	%icc,	0x0
	fnegd	%f18,	%f6
loop_946:
	fcmple16	%f18,	%f30,	%o6
	addc	%l2,	%o5,	%g5
	sll	%o3,	%l4,	%o4
	tpos	%xcc,	0x4
	tn	%icc,	0x5
	array16	%i7,	%g2,	%l0
	add	%g4,	0x180F,	%g1
	fcmpeq16	%f0,	%f10,	%l1
	fnegs	%f29,	%f19
	fexpand	%f30,	%f8
	nop
	fitos	%f9,	%f15
	fstox	%f15,	%f26
	fxtos	%f26,	%f11
	movrlez	%i1,	%o1,	%g6
	tsubcctv	%l5,	0x0C6C,	%g3
	ble	%icc,	loop_947
	brz	%g7,	loop_948
	be,pn	%icc,	loop_949
	edge32	%i0,	%i6,	%i4
loop_947:
	stx	%i2,	[%l7 + 0x60]
loop_948:
	lduw	[%l7 + 0x68],	%i3
loop_949:
	bne,a,pn	%icc,	loop_950
	smul	%o7,	0x1AA5,	%i5
	movge	%xcc,	%o0,	%o2
	add	%l6,	%l3,	%l2
loop_950:
	nop
	wr	%g0,	0x81,	%asi
	sta	%f13,	[%l7 + 0x0C] %asi
	fmovrdlz	%o6,	%f16,	%f8
	tn	%xcc,	0x4
	tgu	%icc,	0x5
	std	%f30,	[%l7 + 0x28]
	tcs	%icc,	0x4
	tcs	%icc,	0x2
	and	%g5,	0x10EE,	%o5
	fpadd16s	%f17,	%f16,	%f11
	brgz	%o3,	loop_951
	xnorcc	%o4,	0x16F0,	%i7
	lduh	[%l7 + 0x08],	%g2
	xnorcc	%l4,	0x14F1,	%l0
loop_951:
	srax	%g1,	0x13,	%l1
	xnor	%i1,	0x0137,	%g4
	set	0x30, %i5
	ldxa	[%l7 + %i5] 0x10,	%o1
	fmovdvs	%icc,	%f11,	%f28
	te	%icc,	0x4
	movcc	%xcc,	%l5,	%g3
	ldd	[%l7 + 0x20],	%g6
	tge	%xcc,	0x1
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x4D] %asi,	%i0
	xorcc	%i6,	%g6,	%i4
	fble,a	%fcc0,	loop_952
	swap	[%l7 + 0x0C],	%i2
	fmovdg	%xcc,	%f6,	%f22
	bpos,pn	%icc,	loop_953
loop_952:
	fmovdleu	%xcc,	%f17,	%f19
	set	0x4E, %i7
	lduha	[%l7 + %i7] 0x04,	%o7
loop_953:
	ble,a,pn	%xcc,	loop_954
	edge32n	%i3,	%o0,	%o2
	tvc	%icc,	0x4
	xnor	%i5,	0x1C79,	%l3
loop_954:
	movrlez	%l6,	0x0CE,	%o6
	fmovsge	%icc,	%f18,	%f18
	subcc	%l2,	0x02B7,	%o5
	tl	%xcc,	0x6
	udiv	%o3,	0x0023,	%o4
	nop
	setx loop_955, %l0, %l1
	jmpl %l1, %g5
	mova	%icc,	%i7,	%l4
	bleu,a,pt	%xcc,	loop_956
	tcs	%xcc,	0x2
loop_955:
	nop
	fitod	%f6,	%f0
	fdtos	%f0,	%f29
	subccc	%g2,	0x03CE,	%l0
loop_956:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f2,	%f16
	add	%l1,	%i1,	%g1
	xnorcc	%o1,	%g4,	%l5
	orncc	%g7,	%i0,	%g3
	movn	%xcc,	%g6,	%i6
	prefetch	[%l7 + 0x6C],	 0x0
	orcc	%i4,	%i2,	%i3
	movneg	%xcc,	%o0,	%o7
	movvs	%xcc,	%o2,	%l3
	nop
	setx	0xA61CACDC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x3ED7D5EC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f4,	%f15
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x15,	 0x0
	movrgz	%i5,	%l2,	%o6
	edge8l	%o5,	%o3,	%g5
	movg	%xcc,	%o4,	%l4
	tne	%icc,	0x6
	alignaddr	%g2,	%i7,	%l0
	fmovdge	%icc,	%f10,	%f29
	movneg	%icc,	%l1,	%i1
	alignaddrl	%o1,	%g4,	%g1
	tsubcctv	%l5,	%g7,	%g3
	array16	%i0,	%i6,	%g6
	sethi	0x1E46,	%i2
	fbu	%fcc2,	loop_957
	movrlez	%i3,	0x0F0,	%i4
	movre	%o7,	%o0,	%l3
	xor	%o2,	%l6,	%i5
loop_957:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x0A] %asi,	%l2
	movcc	%xcc,	%o6,	%o3
	alignaddr	%g5,	%o4,	%o5
	andcc	%g2,	%l4,	%l0
	bpos,a,pt	%xcc,	loop_958
	edge8	%i7,	%i1,	%l1
	xnorcc	%o1,	0x1B20,	%g1
	bvs	%icc,	loop_959
loop_958:
	tge	%icc,	0x7
	lduw	[%l7 + 0x48],	%l5
	array8	%g7,	%g4,	%i0
loop_959:
	movrgz	%g3,	%g6,	%i6
	ba,a,pn	%icc,	loop_960
	tcc	%icc,	0x1
	set	0x60, %g6
	ldswa	[%l7 + %g6] 0x18,	%i3
loop_960:
	bcc	%icc,	loop_961
	add	%i2,	0x14C7,	%o7
	nop
	fitos	%f11,	%f30
	fstox	%f30,	%f28
	nop
	setx	0x323CA667,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xA1E4C512,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f19,	%f18
loop_961:
	tleu	%icc,	0x2
	array16	%o0,	%l3,	%o2
	nop
	fitos	%f12,	%f27
	fstoi	%f27,	%f30
	fcmpne16	%f20,	%f22,	%l6
	sdivcc	%i4,	0x139C,	%l2
	udivcc	%o6,	0x03A6,	%o3
	sth	%i5,	[%l7 + 0x58]
	sir	0x039B
	sdivcc	%g5,	0x0B8C,	%o4
	srl	%g2,	0x06,	%o5
	nop
	setx	0x1CB5D79C66903AD9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x7F9BCD9529693D47,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f18,	%f12
	bgu,a	%icc,	loop_962
	edge8ln	%l4,	%i7,	%i1
	movne	%icc,	%l0,	%l1
	movrlz	%g1,	0x356,	%l5
loop_962:
	fbug	%fcc0,	loop_963
	ta	%xcc,	0x3
	ta	%xcc,	0x5
	sir	0x0686
loop_963:
	fcmpgt32	%f22,	%f22,	%g7
	fbu,a	%fcc2,	loop_964
	orcc	%o1,	0x064E,	%i0
	movcs	%xcc,	%g3,	%g6
	fmovrse	%i6,	%f30,	%f14
loop_964:
	andncc	%i3,	%g4,	%i2
	bne,a	%icc,	loop_965
	tn	%icc,	0x7
	nop
	fitos	%f6,	%f2
	fstod	%f2,	%f2
	movgu	%xcc,	%o7,	%l3
loop_965:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%o0
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x22] %asi,	%o2
	movne	%xcc,	%i4,	%l2
	te	%xcc,	0x4
	tsubcctv	%o6,	0x182D,	%o3
	udivcc	%i5,	0x113F,	%g5
	sth	%o4,	[%l7 + 0x22]
	ldsw	[%l7 + 0x10],	%g2
	tvc	%icc,	0x3
	nop
	setx loop_966, %l0, %l1
	jmpl %l1, %l6
	edge32	%l4,	%i7,	%o5
	movge	%icc,	%l0,	%l1
	tvc	%xcc,	0x7
loop_966:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x18] %asi,	%g1
	ba	%icc,	loop_967
	mulscc	%i1,	%l5,	%o1
	srl	%g7,	0x05,	%g3
	alignaddrl	%i0,	%i6,	%i3
loop_967:
	ble,a	%icc,	loop_968
	fmovsa	%icc,	%f10,	%f14
	xorcc	%g6,	0x185A,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_968:
	ldx	[%l7 + 0x38],	%o7
	stx	%i2,	[%l7 + 0x18]
	fmovdcs	%xcc,	%f22,	%f9
	subccc	%l3,	%o0,	%i4
	movrlz	%l2,	%o6,	%o2
	taddcc	%o3,	0x094C,	%i5
	andn	%g5,	%g2,	%l6
	fmovsgu	%xcc,	%f30,	%f24
	popc	%l4,	%i7
	edge8	%o4,	%o5,	%l1
	fmovd	%f16,	%f26
	sll	%g1,	0x1A,	%l0
	mova	%icc,	%l5,	%i1
	tl	%xcc,	0x3
	orncc	%o1,	0x0441,	%g3
	xnor	%g7,	%i0,	%i3
	subc	%g6,	%g4,	%o7
	tl	%xcc,	0x7
	fcmpeq32	%f12,	%f26,	%i6
	and	%l3,	0x123D,	%i2
	edge8ln	%o0,	%i4,	%o6
	movrlez	%l2,	%o3,	%o2
	fmovsa	%xcc,	%f1,	%f3
	fbul,a	%fcc0,	loop_969
	nop
	setx	loop_970,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%icc,	0x0
	movg	%icc,	%g5,	%i5
loop_969:
	sll	%g2,	0x15,	%l6
loop_970:
	fcmpeq16	%f26,	%f14,	%l4
	or	%i7,	0x1C21,	%o5
	bneg,pt	%xcc,	loop_971
	te	%xcc,	0x2
	ble,pn	%icc,	loop_972
	tsubcc	%l1,	0x0EF1,	%o4
loop_971:
	sth	%g1,	[%l7 + 0x1E]
	srax	%l0,	%i1,	%o1
loop_972:
	tsubcc	%g3,	0x0D63,	%g7
	bneg,a,pt	%icc,	loop_973
	bvc	loop_974
	edge8n	%i0,	%l5,	%i3
	be,a	%xcc,	loop_975
loop_973:
	brgez	%g6,	loop_976
loop_974:
	fmovrdgz	%o7,	%f4,	%f6
	edge8ln	%i6,	%g4,	%i2
loop_975:
	andncc	%o0,	%l3,	%o6
loop_976:
	orcc	%i4,	%o3,	%l2
	andn	%g5,	0x1019,	%i5
	edge32	%g2,	%l6,	%l4
	fornot2s	%f0,	%f8,	%f6
	ble	%xcc,	loop_977
	sdiv	%i7,	0x1744,	%o5
	stx	%o2,	[%l7 + 0x28]
	alignaddrl	%l1,	%g1,	%o4
loop_977:
	movrlz	%l0,	%o1,	%i1
	fmovdpos	%xcc,	%f10,	%f0
	set	0x12, %g7
	ldsha	[%l7 + %g7] 0x18,	%g3
	fors	%f3,	%f10,	%f31
	movleu	%icc,	%g7,	%l5
	bne	loop_978
	udivx	%i0,	0x03AF,	%g6
	lduh	[%l7 + 0x3A],	%o7
	te	%icc,	0x0
loop_978:
	xnorcc	%i3,	%i6,	%g4
	edge8ln	%o0,	%i2,	%o6
	mova	%xcc,	%l3,	%o3
	sra	%l2,	%i4,	%g5
	and	%g2,	0x07DF,	%l6
	movg	%icc,	%l4,	%i5
	smulcc	%i7,	%o2,	%o5
	tsubcctv	%g1,	%o4,	%l1
	faligndata	%f26,	%f8,	%f30
	brgz	%l0,	loop_979
	nop
	setx	0x34E297DC219AD6CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f24
	taddcc	%o1,	%i1,	%g7
	movneg	%xcc,	%l5,	%i0
loop_979:
	nop
	fitod	%f2,	%f4
	fdtox	%f4,	%f14
	tpos	%icc,	0x2
	edge16ln	%g6,	%o7,	%i3
	stbar
	sra	%g3,	%g4,	%o0
	set	0x26, %i2
	stha	%i6,	[%l7 + %i2] 0x23
	membar	#Sync
	edge8n	%o6,	%l3,	%o3
	edge32	%i2,	%l2,	%g5
	nop
	setx	0x36C88C23,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x40DD49B5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f1,	%f12
	sub	%g2,	0x1D8B,	%i4
	bg,pn	%icc,	loop_980
	edge16l	%l6,	%l4,	%i7
	fmovsvc	%xcc,	%f12,	%f20
	fnand	%f6,	%f20,	%f24
loop_980:
	ble,a	%icc,	loop_981
	taddcc	%o2,	0x1ABB,	%o5
	tgu	%xcc,	0x2
	movrgez	%i5,	%o4,	%l1
loop_981:
	fmovsneg	%icc,	%f11,	%f18
	bn	%xcc,	loop_982
	ldx	[%l7 + 0x38],	%l0
	movcs	%xcc,	%o1,	%i1
	fbule	%fcc2,	loop_983
loop_982:
	bvs,a,pt	%icc,	loop_984
	fexpand	%f24,	%f20
	andncc	%g1,	%g7,	%l5
loop_983:
	nop
	wr	%g0,	0x0c,	%asi
	stba	%i0,	[%l7 + 0x4D] %asi
loop_984:
	taddcc	%o7,	0x076D,	%i3
	bcc,a	%icc,	loop_985
	fbul	%fcc1,	loop_986
	fnor	%f8,	%f24,	%f26
	xorcc	%g3,	0x1B70,	%g6
loop_985:
	nop
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x2C] %asi,	%g4
loop_986:
	tcc	%icc,	0x1
	nop
	setx loop_987, %l0, %l1
	jmpl %l1, %o0
	tvc	%icc,	0x6
	nop
	setx	0x735A5E8E7071780C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	add	%i6,	%o6,	%l3
loop_987:
	tle	%icc,	0x3
	brz,a	%i2,	loop_988
	brgz	%l2,	loop_989
	bne,a,pt	%icc,	loop_990
	xnor	%g5,	%g2,	%i4
loop_988:
	fmovrsgz	%l6,	%f30,	%f3
loop_989:
	sethi	0x066E,	%l4
loop_990:
	fmul8x16au	%f17,	%f12,	%f18
	fmovsvs	%xcc,	%f13,	%f4
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x1A] %asi,	%o3
	call	loop_991
	xorcc	%i7,	%o2,	%o5
	fmovsl	%xcc,	%f3,	%f23
	movle	%xcc,	%i5,	%o4
loop_991:
	tsubcctv	%l1,	%o1,	%l0
	xnorcc	%i1,	%g7,	%g1
	sub	%l5,	%o7,	%i3
	te	%xcc,	0x5
	mulx	%g3,	0x1A22,	%g6
	bl,pt	%icc,	loop_992
	movgu	%icc,	%g4,	%o0
	movcc	%xcc,	%i6,	%i0
	tge	%icc,	0x2
loop_992:
	nop
	setx	0x1042D369,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	subc	%l3,	%i2,	%l2
	orcc	%g5,	%o6,	%g2
	edge32ln	%i4,	%l4,	%o3
	bge,a	loop_993
	fxnor	%f26,	%f20,	%f8
	mova	%xcc,	%l6,	%i7
	move	%xcc,	%o5,	%i5
loop_993:
	tneg	%icc,	0x7
	srlx	%o2,	%l1,	%o1
	bn,pt	%xcc,	loop_994
	alignaddrl	%o4,	%i1,	%g7
	nop
	setx	loop_995,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovda	%xcc,	%f19,	%f4
loop_994:
	nop
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x1f
	membar	#Sync
loop_995:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x3E] %asi,	%l0
	bvc,pn	%xcc,	loop_996
	array32	%l5,	%o7,	%g1
	alignaddrl	%g3,	%g6,	%g4
	srax	%o0,	%i6,	%i3
loop_996:
	popc	%i0,	%l3
	brnz,a	%i2,	loop_997
	andncc	%l2,	%o6,	%g5
	tpos	%xcc,	0x1
	set	0x58, %o6
	lduwa	[%l7 + %o6] 0x88,	%g2
loop_997:
	fbule	%fcc1,	loop_998
	movneg	%xcc,	%i4,	%l4
	movcs	%xcc,	%l6,	%o3
	movneg	%xcc,	%i7,	%o5
loop_998:
	movre	%i5,	0x230,	%l1
	andn	%o1,	%o4,	%i1
	fpsub32	%f28,	%f0,	%f14
	sub	%o2,	%g7,	%l0
	fsrc2s	%f0,	%f14
	te	%icc,	0x2
	fbug,a	%fcc3,	loop_999
	stbar
	fmul8x16au	%f2,	%f15,	%f2
	sra	%l5,	0x14,	%g1
loop_999:
	fba,a	%fcc2,	loop_1000
	bge,pn	%xcc,	loop_1001
	be,a	%xcc,	loop_1002
	sdivx	%o7,	0x05F2,	%g6
loop_1000:
	fmovsleu	%xcc,	%f4,	%f2
loop_1001:
	edge32	%g4,	%o0,	%g3
loop_1002:
	edge16ln	%i6,	%i3,	%l3
	sdivcc	%i2,	0x0349,	%l2
	set	0x28, %i3
	swapa	[%l7 + %i3] 0x88,	%i0
	movrlz	%o6,	%g5,	%g2
	movgu	%xcc,	%l4,	%l6
	std	%f18,	[%l7 + 0x40]
	fpackfix	%f4,	%f4
	set	0x78, %l5
	prefetcha	[%l7 + %l5] 0x81,	 0x2
	mova	%icc,	%i4,	%i7
	edge16l	%o5,	%l1,	%o1
	andcc	%o4,	0x0B7D,	%i5
	fpadd16s	%f7,	%f18,	%f0
	fbo	%fcc2,	loop_1003
	movrgez	%i1,	0x390,	%o2
	edge32l	%g7,	%l5,	%l0
	xnor	%o7,	%g1,	%g4
loop_1003:
	orncc	%o0,	%g3,	%g6
	nop
	fitod	%f6,	%f10
	fdtoi	%f10,	%f10
	fsrc2	%f20,	%f12
	sth	%i3,	[%l7 + 0x7C]
	srl	%l3,	%i2,	%i6
	movne	%icc,	%i0,	%l2
	sdiv	%g5,	0x08CA,	%o6
	xorcc	%g2,	%l4,	%o3
	fmovsa	%icc,	%f16,	%f9
	and	%l6,	0x1804,	%i4
	taddcctv	%i7,	0x0FEF,	%o5
	fbuge	%fcc3,	loop_1004
	std	%f6,	[%l7 + 0x20]
	fmul8x16al	%f30,	%f14,	%f14
	bneg	%xcc,	loop_1005
loop_1004:
	tle	%icc,	0x3
	movleu	%icc,	%o1,	%o4
	set	0x52, %o3
	ldsha	[%l7 + %o3] 0x11,	%i5
loop_1005:
	sub	%l1,	0x1FD5,	%i1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x04,	%o2,	%l5
	nop
	setx	0xBC071DAC68EDD452,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f26
	fmovdgu	%icc,	%f4,	%f22
	st	%f9,	[%l7 + 0x74]
	tleu	%icc,	0x2
	tl	%xcc,	0x1
	fmovdneg	%icc,	%f25,	%f29
	andcc	%l0,	0x0DCE,	%o7
	fcmpne32	%f6,	%f4,	%g1
	orncc	%g4,	%g7,	%o0
	movcs	%xcc,	%g6,	%g3
	tsubcc	%i3,	0x1130,	%l3
	subcc	%i6,	0x050F,	%i0
	fxnors	%f19,	%f23,	%f7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%g5
	smulcc	%o6,	0x11F9,	%i2
	xorcc	%g2,	%l4,	%l6
	tpos	%xcc,	0x2
	fmovrsne	%i4,	%f28,	%f12
	movleu	%xcc,	%o3,	%i7
	edge16n	%o5,	%o4,	%o1
	movre	%i5,	0x3D3,	%i1
	edge16l	%l1,	%l5,	%o2
	movre	%l0,	%o7,	%g4
	bge,pn	%xcc,	loop_1006
	mulx	%g7,	%g1,	%g6
	brlez,a	%g3,	loop_1007
	fpmerge	%f28,	%f18,	%f28
loop_1006:
	fbue,a	%fcc0,	loop_1008
	movge	%xcc,	%o0,	%l3
loop_1007:
	brgez	%i3,	loop_1009
	stb	%i6,	[%l7 + 0x58]
loop_1008:
	move	%icc,	%l2,	%g5
	or	%i0,	%i2,	%o6
loop_1009:
	fpack16	%f18,	%f18
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	fcmpgt16	%f12,	%f0,	%l4
	tvc	%icc,	0x0
	movg	%xcc,	%l6,	%g2
	sir	0x1043
	sub	%o3,	%i4,	%i7
	brlz	%o4,	loop_1010
	fmovdcc	%icc,	%f4,	%f15
	umul	%o1,	0x16CA,	%o5
	or	%i5,	%l1,	%i1
loop_1010:
	movl	%icc,	%o2,	%l0
	nop
	setx	0x2E3B66C8D85656EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x15F0AEC1639C531C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f20,	%f28
	movpos	%xcc,	%l5,	%o7
	array16	%g7,	%g1,	%g4
	movrlez	%g6,	0x023,	%g3
	fnors	%f16,	%f21,	%f10
	tcs	%xcc,	0x0
	fpack32	%f28,	%f8,	%f30
	brgez	%o0,	loop_1011
	subc	%l3,	%i6,	%l2
	or	%i3,	%i0,	%g5
	nop
	fitod	%f0,	%f0
	fdtox	%f0,	%f6
loop_1011:
	fpsub32	%f22,	%f0,	%f12
	edge16l	%o6,	%l4,	%l6
	fpsub32	%f28,	%f30,	%f18
	ta	%xcc,	0x6
	tsubcctv	%g2,	%o3,	%i2
	tneg	%icc,	0x0
	set	0x65, %o0
	stba	%i7,	[%l7 + %o0] 0x15
	set	0x8, %o7
	stxa	%o4,	[%g0 + %o7] 0x21
	fnegs	%f1,	%f27
	fmovsa	%icc,	%f2,	%f29
	subcc	%i4,	0x0FC2,	%o5
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f0
	edge16n	%o1,	%i5,	%l1
	sdivx	%i1,	0x1C71,	%o2
	movn	%icc,	%l0,	%l5
	udivcc	%g7,	0x1752,	%o7
	movre	%g1,	0x325,	%g6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x32] %asi,	%g4
	tle	%icc,	0x4
	smul	%g3,	0x0129,	%l3
	fbg,a	%fcc2,	loop_1012
	tge	%xcc,	0x4
	set	0x2C, %g2
	swapa	[%l7 + %g2] 0x11,	%i6
loop_1012:
	popc	%o0,	%i3
	subccc	%i0,	0x0C67,	%l2
	set	0x25, %o4
	lduba	[%l7 + %o4] 0x18,	%o6
	nop
	setx	0x16DE2EB7184A3425,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8BD1D5AACDBD04C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f20,	%f0
	movvs	%icc,	%g5,	%l6
	tgu	%xcc,	0x3
	sdiv	%l4,	0x14A8,	%o3
	orn	%g2,	%i2,	%o4
	sir	0x1CF0
	tl	%icc,	0x0
	for	%f24,	%f0,	%f8
	bn,a,pn	%icc,	loop_1013
	movge	%icc,	%i7,	%i4
	or	%o5,	0x1D32,	%o1
	xnorcc	%l1,	0x04A7,	%i5
loop_1013:
	move	%icc,	%o2,	%i1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	orncc	%l5,	0x009C,	%o7
	set	0x40, %i1
	sta	%f12,	[%l7 + %i1] 0x04
	taddcc	%g7,	%g6,	%g1
	subcc	%g3,	%g4,	%l3
	smulcc	%i6,	%i3,	%o0
	fbe,a	%fcc0,	loop_1014
	stx	%i0,	[%l7 + 0x48]
	lduw	[%l7 + 0x18],	%o6
	fbue	%fcc1,	loop_1015
loop_1014:
	tneg	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	sta	%f17,	[%l7 + 0x48] %asi
loop_1015:
	movrlz	%l2,	%l6,	%l4
	mulx	%o3,	0x1437,	%g2
	fpsub16s	%f25,	%f25,	%f10
	fmul8sux16	%f2,	%f8,	%f24
	udiv	%g5,	0x0CA2,	%i2
	ldd	[%l7 + 0x08],	%f20
	nop
	setx	0x2E0D423A4C4BF501,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6FBBB25284545249,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f20,	%f30
	fmovsl	%xcc,	%f30,	%f13
	movneg	%icc,	%i7,	%o4
	movvc	%icc,	%o5,	%i4
	movrlez	%l1,	0x05C,	%i5
	tl	%xcc,	0x4
	smul	%o2,	0x0DE0,	%i1
	fbuge	%fcc3,	loop_1016
	fand	%f2,	%f8,	%f24
	fnot1	%f4,	%f8
	srax	%o1,	0x15,	%l0
loop_1016:
	bvc,pn	%icc,	loop_1017
	taddcctv	%l5,	%o7,	%g7
	fandnot2s	%f0,	%f14,	%f8
	fcmpeq16	%f14,	%f30,	%g6
loop_1017:
	sll	%g3,	0x1D,	%g1
	brlez,a	%g4,	loop_1018
	edge32n	%i6,	%i3,	%o0
	subccc	%i0,	%l3,	%l2
	sdivx	%o6,	0x12E6,	%l4
loop_1018:
	array16	%l6,	%o3,	%g2
	fbo	%fcc2,	loop_1019
	fmul8x16al	%f13,	%f9,	%f10
	taddcc	%i2,	0x1CF8,	%i7
	lduw	[%l7 + 0x6C],	%o4
loop_1019:
	xor	%g5,	%i4,	%l1
	alignaddr	%i5,	%o2,	%o5
	fcmpne16	%f22,	%f2,	%i1
	brz,a	%o1,	loop_1020
	edge32n	%l0,	%o7,	%l5
	tsubcc	%g7,	0x1C12,	%g3
	bl,a	loop_1021
loop_1020:
	tleu	%icc,	0x0
	mulscc	%g6,	%g4,	%i6
	call	loop_1022
loop_1021:
	fornot2	%f6,	%f14,	%f22
	mova	%icc,	%g1,	%i3
	fpsub32	%f10,	%f4,	%f0
loop_1022:
	orcc	%o0,	0x1C36,	%l3
	sub	%i0,	%o6,	%l2
	fmovsl	%xcc,	%f17,	%f20
	ldub	[%l7 + 0x0D],	%l4
	alignaddr	%l6,	%o3,	%i2
	edge16ln	%i7,	%o4,	%g5
	array32	%i4,	%l1,	%i5
	array32	%g2,	%o5,	%i1
	taddcc	%o1,	0x0C5D,	%o2
	fblg,a	%fcc0,	loop_1023
	sdivcc	%o7,	0x0EFE,	%l0
	fmovsgu	%icc,	%f27,	%f25
	move	%icc,	%l5,	%g7
loop_1023:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x57] %asi,	%g6
	edge16n	%g4,	%g3,	%i6
	orn	%g1,	0x1B25,	%i3
	mova	%xcc,	%o0,	%l3
	tl	%xcc,	0x6
	ldsh	[%l7 + 0x62],	%i0
	fmovdl	%icc,	%f13,	%f27
	fmovdl	%icc,	%f12,	%f14
	fmovdl	%icc,	%f27,	%f29
	movrlez	%l2,	%l4,	%l6
	movleu	%xcc,	%o3,	%o6
	ta	%xcc,	0x4
	fpadd32	%f10,	%f16,	%f28
	set	0x5C, %l3
	ldswa	[%l7 + %l3] 0x15,	%i7
	fmovs	%f24,	%f10
	orncc	%i2,	0x05E8,	%g5
	sdivcc	%i4,	0x19B2,	%l1
	movcc	%icc,	%i5,	%g2
	ld	[%l7 + 0x48],	%f6
	wr	%g0,	0x2a,	%asi
	stwa	%o4,	[%l7 + 0x48] %asi
	membar	#Sync
	move	%xcc,	%o5,	%o1
	move	%icc,	%i1,	%o2
	move	%xcc,	%o7,	%l0
	tgu	%xcc,	0x2
	fnands	%f8,	%f23,	%f19
	alignaddr	%g7,	%l5,	%g6
	tgu	%icc,	0x6
	sdivx	%g3,	0x1D78,	%g4
	tge	%icc,	0x3
	nop
	set	0x39, %l4
	stb	%i6,	[%l7 + %l4]
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	sub	%i3,	0x153B,	%g1
	orncc	%l3,	%i0,	%o0
	fmovdle	%icc,	%f10,	%f23
	fcmpne16	%f6,	%f22,	%l2
	fmovsgu	%icc,	%f5,	%f17
	ldd	[%l7 + 0x08],	%f14
	edge8	%l4,	%l6,	%o6
	fmul8sux16	%f16,	%f30,	%f14
	fmovrdlz	%i7,	%f0,	%f8
	nop
	fitos	%f0,	%f0
	fstoi	%f0,	%f23
	ba	loop_1024
	nop
	setx	0x48B0D2077B9B0D2E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x25343FD8E27B82A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f28,	%f18
	tgu	%icc,	0x0
	orncc	%o3,	%g5,	%i4
loop_1024:
	tcs	%xcc,	0x6
	subc	%i2,	%l1,	%g2
	xorcc	%i5,	0x1430,	%o4
	nop
	fitod	%f5,	%f10
	ldd	[%l7 + 0x48],	%o0
	tle	%xcc,	0x1
	movpos	%icc,	%o5,	%i1
	tneg	%xcc,	0x2
	flush	%l7 + 0x70
	nop
	setx	0x8120F7C01CF2A918,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xB19C80F7AFCF8999,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f8,	%f24
	st	%f30,	[%l7 + 0x44]
	fandnot2s	%f15,	%f27,	%f25
	edge8n	%o2,	%o7,	%l0
	sllx	%g7,	%g6,	%g3
	tle	%xcc,	0x7
	fbu	%fcc0,	loop_1025
	nop
	setx	0xA2293E17,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f19
	tvc	%xcc,	0x6
	ldd	[%l7 + 0x68],	%f14
loop_1025:
	movvc	%xcc,	%l5,	%i6
	sethi	0x1436,	%i3
	movge	%icc,	%g1,	%l3
	mulscc	%i0,	%o0,	%g4
	subc	%l2,	%l6,	%l4
	tsubcc	%o6,	0x0CC5,	%i7
	fmovrsgez	%g5,	%f2,	%f10
	ld	[%l7 + 0x44],	%f28
	fmovs	%f13,	%f0
	fnands	%f14,	%f11,	%f23
	smulcc	%i4,	0x16A9,	%i2
	ldx	[%l7 + 0x50],	%l1
	bshuffle	%f26,	%f12,	%f30
	movl	%xcc,	%g2,	%i5
	brgz,a	%o4,	loop_1026
	fnegs	%f1,	%f9
	fbue,a	%fcc2,	loop_1027
	srlx	%o1,	%o5,	%i1
loop_1026:
	smul	%o3,	0x0245,	%o7
	set	0x20, %o1
	sta	%f31,	[%l7 + %o1] 0x88
loop_1027:
	sethi	0x044D,	%l0
	sethi	0x18DE,	%o2
	xorcc	%g6,	%g3,	%g7
	umul	%i6,	%i3,	%l5
	ldsh	[%l7 + 0x52],	%l3
	brz	%g1,	loop_1028
	tsubcctv	%o0,	%i0,	%l2
	andn	%l6,	%g4,	%l4
	xor	%o6,	%g5,	%i7
loop_1028:
	movrgez	%i4,	0x22F,	%i2
	nop
	fitod	%f4,	%f0
	fdtos	%f0,	%f30
	nop
	setx	0x45E3619D711AE910,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xBD13D2AE80E7BBD8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f16,	%f8
	flush	%l7 + 0x18
	fsrc2	%f4,	%f18
	fbue	%fcc0,	loop_1029
	fcmpne16	%f26,	%f0,	%g2
	mulx	%l1,	0x1908,	%o4
	bl,a,pn	%xcc,	loop_1030
loop_1029:
	subc	%i5,	%o5,	%o1
	tn	%icc,	0x5
	umul	%i1,	%o7,	%o3
loop_1030:
	ta	%icc,	0x2
	srl	%l0,	0x16,	%g6
	membar	0x17
	faligndata	%f28,	%f20,	%f30
	movrgez	%g3,	%o2,	%i6
	tcs	%xcc,	0x3
	umulcc	%i3,	0x175D,	%g7
	bge,pn	%xcc,	loop_1031
	swap	[%l7 + 0x0C],	%l3
	ldd	[%l7 + 0x70],	%f0
	subccc	%g1,	%o0,	%i0
loop_1031:
	fnot2	%f26,	%f4
	add	%l2,	0x12FA,	%l5
	bcc,pn	%xcc,	loop_1032
	smul	%g4,	0x0A89,	%l6
	smul	%l4,	0x1C01,	%o6
	brnz	%i7,	loop_1033
loop_1032:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a,pn	%xcc,	loop_1034
	fmovs	%f3,	%f3
loop_1033:
	movvc	%xcc,	%g5,	%i2
	tge	%xcc,	0x7
loop_1034:
	fmovdl	%xcc,	%f9,	%f3
	movne	%xcc,	%g2,	%l1
	fbule	%fcc0,	loop_1035
	addcc	%o4,	0x0A30,	%i5
	fbug	%fcc2,	loop_1036
	fandnot1	%f30,	%f28,	%f14
loop_1035:
	movgu	%xcc,	%i4,	%o5
	tge	%icc,	0x6
loop_1036:
	orncc	%o1,	0x05E5,	%i1
	brgez,a	%o7,	loop_1037
	nop
	fitos	%f10,	%f9
	fstod	%f9,	%f6
	for	%f12,	%f20,	%f26
	smul	%l0,	%o3,	%g3
loop_1037:
	sra	%o2,	%i6,	%i3
	edge16ln	%g6,	%g7,	%g1
	mulscc	%o0,	0x0898,	%i0
	alignaddr	%l2,	%l5,	%l3
	tcs	%xcc,	0x2
	movgu	%xcc,	%l6,	%l4
	nop
	setx	0x710BBB84,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xD7C89A8B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f30,	%f10
	movl	%icc,	%o6,	%i7
	stx	%g4,	[%l7 + 0x28]
	udivx	%g5,	0x06E0,	%i2
	set	0x5C, %l0
	lduwa	[%l7 + %l0] 0x80,	%g2
	fones	%f11
	and	%o4,	0x1894,	%i5
	fmovdne	%xcc,	%f18,	%f14
	movre	%l1,	0x118,	%o5
	fsrc2	%f8,	%f28
	popc	%o1,	%i1
	movg	%icc,	%i4,	%o7
	fmul8x16au	%f11,	%f26,	%f26
	movg	%xcc,	%l0,	%o3
	sdivcc	%o2,	0x0993,	%g3
	subccc	%i6,	0x1E7A,	%i3
	sdivcc	%g6,	0x1D80,	%g7
	ldsw	[%l7 + 0x14],	%o0
	mova	%xcc,	%g1,	%i0
	movvc	%icc,	%l2,	%l5
	movrlez	%l6,	0x385,	%l4
	fcmpeq32	%f0,	%f8,	%l3
	sdivcc	%i7,	0x091F,	%o6
	nop
	setx	0x904D13D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	sllx	%g5,	0x0E,	%i2
	xor	%g4,	0x05FE,	%o4
	movl	%icc,	%g2,	%i5
	movcs	%xcc,	%o5,	%o1
	move	%icc,	%l1,	%i4
	fmovrdlz	%i1,	%f2,	%f10
	movle	%icc,	%l0,	%o3
	tle	%icc,	0x6
	smulcc	%o2,	0x0E71,	%o7
	array16	%g3,	%i3,	%g6
	movrgz	%g7,	0x17D,	%i6
	add	%g1,	%i0,	%o0
	fmovrslez	%l2,	%f30,	%f10
	popc	%l6,	%l5
	tcc	%icc,	0x0
	fcmpne16	%f14,	%f20,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0500,	%l3
	bvs,a	%icc,	loop_1038
	tn	%xcc,	0x3
	edge16n	%i7,	%o6,	%i2
	fbe,a	%fcc1,	loop_1039
loop_1038:
	sir	0x039A
	fmovrslz	%g4,	%f2,	%f18
	taddcctv	%g5,	%o4,	%g2
loop_1039:
	bcc	%icc,	loop_1040
	addc	%o5,	%o1,	%l1
	movleu	%icc,	%i4,	%i5
	movge	%xcc,	%i1,	%o3
loop_1040:
	subccc	%o2,	%l0,	%o7
	movg	%xcc,	%i3,	%g6
	movleu	%icc,	%g3,	%i6
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x69] %asi,	%g7
	nop
	setx	loop_1041,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx loop_1042, %l0, %l1
	jmpl %l1, %g1
	bg,pt	%icc,	loop_1043
	brlez	%o0,	loop_1044
loop_1041:
	udivx	%l2,	0x062D,	%i0
loop_1042:
	movcs	%icc,	%l6,	%l5
loop_1043:
	movrgz	%l3,	0x2D8,	%i7
loop_1044:
	movgu	%xcc,	%l4,	%o6
	edge8n	%g4,	%g5,	%i2
	movne	%icc,	%g2,	%o5
	fmovdcc	%xcc,	%f5,	%f26
	fmovsneg	%xcc,	%f6,	%f11
	fnot2	%f20,	%f14
	sdivx	%o1,	0x14C9,	%l1
	tne	%icc,	0x2
	bpos,a,pt	%xcc,	loop_1045
	add	%o4,	%i5,	%i4
	srax	%o3,	0x02,	%o2
	xnor	%i1,	0x0C10,	%o7
loop_1045:
	ldsw	[%l7 + 0x3C],	%l0
	fmovsg	%icc,	%f25,	%f21
	edge32	%g6,	%g3,	%i6
	fnot1	%f6,	%f8
	taddcc	%g7,	0x09E5,	%g1
	fone	%f30
	fmovse	%icc,	%f29,	%f13
	edge16	%o0,	%l2,	%i0
	andncc	%i3,	%l6,	%l3
	fsrc1s	%f11,	%f30
	fmovrdne	%i7,	%f6,	%f4
	fands	%f17,	%f7,	%f15
	move	%icc,	%l4,	%o6
	edge16n	%g4,	%g5,	%l5
	mulx	%g2,	0x0049,	%o5
	ldsw	[%l7 + 0x0C],	%o1
	bge,a,pn	%xcc,	loop_1046
	fsrc2	%f30,	%f2
	tvs	%icc,	0x4
	edge16n	%l1,	%o4,	%i2
loop_1046:
	tvc	%icc,	0x0
	add	%i4,	%o3,	%i5
	fble	%fcc3,	loop_1047
	movrne	%i1,	%o2,	%l0
	and	%g6,	0x0EE8,	%o7
	ldsw	[%l7 + 0x18],	%g3
loop_1047:
	taddcctv	%g7,	%i6,	%g1
	movcs	%icc,	%l2,	%o0
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x1E] %asi,	%i3
	tcs	%xcc,	0x5
	popc	0x1482,	%l6
	bvs,a,pn	%xcc,	loop_1048
	tg	%xcc,	0x7
	bg,pt	%icc,	loop_1049
	movge	%xcc,	%i0,	%i7
loop_1048:
	mulx	%l3,	0x12CF,	%o6
	fbo	%fcc3,	loop_1050
loop_1049:
	sth	%l4,	[%l7 + 0x4A]
	movrne	%g5,	0x2EA,	%l5
	sllx	%g2,	0x0B,	%o5
loop_1050:
	mova	%xcc,	%o1,	%g4
	flush	%l7 + 0x20
	be,a	loop_1051
	fbule,a	%fcc0,	loop_1052
	prefetch	[%l7 + 0x64],	 0x2
	movre	%l1,	%o4,	%i2
loop_1051:
	array32	%o3,	%i4,	%i1
loop_1052:
	ta	%icc,	0x5
	ba,a,pt	%icc,	loop_1053
	ldsh	[%l7 + 0x60],	%o2
	sdivcc	%i5,	0x0EFC,	%l0
	mulx	%g6,	0x017B,	%g3
loop_1053:
	tneg	%xcc,	0x6
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x36] %asi,	%g7
	and	%o7,	0x0D6F,	%i6
	sdiv	%l2,	0x1B4E,	%g1
	ta	%icc,	0x6
	ldsb	[%l7 + 0x67],	%o0
	movg	%icc,	%i3,	%i0
	taddcctv	%l6,	%i7,	%l3
	fpadd32	%f10,	%f18,	%f14
	membar	0x57
	fmovsleu	%icc,	%f26,	%f2
	bn	loop_1054
	taddcctv	%o6,	%g5,	%l4
	edge16ln	%g2,	%o5,	%l5
	addc	%o1,	%l1,	%o4
loop_1054:
	brlez	%i2,	loop_1055
	sllx	%o3,	%g4,	%i4
	smulcc	%o2,	%i5,	%l0
	movrne	%g6,	%i1,	%g7
loop_1055:
	orn	%o7,	%g3,	%l2
	movrlez	%g1,	%o0,	%i3
	set	0x7A, %g4
	stha	%i0,	[%l7 + %g4] 0x2f
	membar	#Sync
	fnegs	%f13,	%f29
	bpos	loop_1056
	fcmpne32	%f28,	%f28,	%l6
	lduw	[%l7 + 0x58],	%i6
	array32	%i7,	%l3,	%g5
loop_1056:
	sethi	0x06AF,	%l4
	movrgz	%o6,	0x3AF,	%g2
	smulcc	%l5,	%o1,	%o5
	edge8n	%l1,	%i2,	%o4
	movrlz	%o3,	0x0F5,	%g4
	movl	%icc,	%i4,	%o2
	fornot1s	%f19,	%f18,	%f10
	fmovd	%f12,	%f10
	set	0x36, %l6
	stha	%l0,	[%l7 + %l6] 0x2b
	membar	#Sync
	or	%g6,	0x0A29,	%i1
	movrgz	%g7,	%i5,	%o7
	andcc	%l2,	%g3,	%o0
	fmovspos	%xcc,	%f27,	%f8
	std	%f8,	[%l7 + 0x10]
	edge8	%g1,	%i0,	%i3
	movcs	%icc,	%l6,	%i6
	add	%i7,	%g5,	%l4
	movvs	%icc,	%o6,	%g2
	movrgz	%l5,	%l3,	%o5
	srax	%o1,	0x16,	%i2
	andcc	%l1,	%o3,	%g4
	tcs	%icc,	0x3
	bneg,a	%icc,	loop_1057
	swap	[%l7 + 0x6C],	%o4
	bg,a	%xcc,	loop_1058
	fabss	%f6,	%f25
loop_1057:
	fnor	%f26,	%f10,	%f16
	subccc	%o2,	0x107E,	%i4
loop_1058:
	nop
	setx	0x606AC823,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	movrgez	%l0,	%i1,	%g7
	andncc	%i5,	%g6,	%l2
	ldsb	[%l7 + 0x5D],	%g3
	stbar
	sth	%o7,	[%l7 + 0x42]
	xorcc	%o0,	0x12B4,	%g1
	fmovrdgez	%i0,	%f18,	%f22
	bge	%xcc,	loop_1059
	movcs	%icc,	%i3,	%i6
	edge32n	%i7,	%l6,	%g5
	sra	%o6,	0x1A,	%l4
loop_1059:
	andncc	%l5,	%g2,	%o5
	tpos	%xcc,	0x0
	bcc,a	%xcc,	loop_1060
	ldsh	[%l7 + 0x18],	%l3
	swap	[%l7 + 0x74],	%i2
	edge16	%l1,	%o3,	%g4
loop_1060:
	movpos	%icc,	%o4,	%o1
	and	%o2,	0x0B44,	%i4
	taddcc	%l0,	%i1,	%g7
	nop
	fitos	%f6,	%f16
	fstod	%f16,	%f18
	tn	%xcc,	0x6
	tneg	%icc,	0x7
	edge8ln	%g6,	%l2,	%i5
	set	0x13, %o2
	lduba	[%l7 + %o2] 0x18,	%g3
	set	0x6A, %o5
	lduha	[%l7 + %o5] 0x80,	%o0
	tne	%xcc,	0x5
	nop
	setx	0xB6AA6C4B4053D075,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	xor	%o7,	0x1B8E,	%g1
	fpmerge	%f5,	%f12,	%f30
	nop
	fitod	%f9,	%f18
	edge16ln	%i0,	%i3,	%i6
	movcc	%icc,	%i7,	%l6
	fmovdpos	%xcc,	%f30,	%f25
	fnegd	%f28,	%f10
	xnor	%g5,	0x0177,	%l4
	tgu	%icc,	0x0
	fbg,a	%fcc2,	loop_1061
	movge	%icc,	%o6,	%l5
	xnorcc	%o5,	%l3,	%i2
	movg	%icc,	%g2,	%l1
loop_1061:
	movne	%icc,	%o3,	%g4
	fmovd	%f16,	%f16
	addc	%o1,	%o4,	%i4
	fmovrsgez	%o2,	%f22,	%f28
	mulscc	%l0,	%i1,	%g7
	fblg,a	%fcc2,	loop_1062
	movl	%xcc,	%l2,	%g6
	fpadd32s	%f11,	%f31,	%f26
	fmul8ulx16	%f16,	%f26,	%f4
loop_1062:
	edge8l	%g3,	%o0,	%i5
	fandnot2	%f6,	%f18,	%f12
	mulx	%o7,	%i0,	%g1
	srl	%i3,	0x09,	%i7
	fornot1	%f2,	%f18,	%f30
	fxnors	%f12,	%f27,	%f21
	fand	%f8,	%f10,	%f2
	fbn,a	%fcc0,	loop_1063
	orcc	%i6,	0x1F62,	%l6
	edge32l	%g5,	%o6,	%l5
	brgz,a	%o5,	loop_1064
loop_1063:
	move	%xcc,	%l3,	%l4
	movrgez	%g2,	0x393,	%l1
	flush	%l7 + 0x2C
loop_1064:
	fmovdle	%xcc,	%f25,	%f11
	subcc	%i2,	%g4,	%o1
	set	0x37, %i4
	lduba	[%l7 + %i4] 0x89,	%o3
	bleu,a	%xcc,	loop_1065
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o4,	0x00B7,	%o2
	ldub	[%l7 + 0x35],	%i4
loop_1065:
	call	loop_1066
	stb	%l0,	[%l7 + 0x51]
	sll	%g7,	%i1,	%g6
	tleu	%icc,	0x7
loop_1066:
	xnor	%g3,	%l2,	%o0
	bvs,pt	%xcc,	loop_1067
	sll	%i5,	%o7,	%i0
	bvc	%xcc,	loop_1068
	nop
	fitod	%f8,	%f12
	fdtoi	%f12,	%f5
loop_1067:
	srl	%i3,	%i7,	%i6
	movcc	%icc,	%l6,	%g1
loop_1068:
	fcmpne16	%f26,	%f4,	%g5
	fnot2s	%f6,	%f7
	set	0x0E, %l1
	lduha	[%l7 + %l1] 0x0c,	%o6
	sdivx	%l5,	0x1BCE,	%l3
	bpos	loop_1069
	sir	0x05B1
	edge16n	%o5,	%g2,	%l1
	sir	0x190C
loop_1069:
	st	%f13,	[%l7 + 0x70]
	fcmpgt16	%f10,	%f16,	%i2
	udiv	%l4,	0x1781,	%g4
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f0
	xnorcc	%o3,	0x18A5,	%o4
	nop
	setx	0x4F57C00FBAF73E41,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f10
	taddcctv	%o2,	0x01F0,	%i4
	move	%xcc,	%l0,	%g7
	sllx	%i1,	%o1,	%g3
	fmovd	%f4,	%f6
	movleu	%icc,	%g6,	%o0
	and	%l2,	%i5,	%o7
	alignaddr	%i0,	%i3,	%i6
	mulscc	%i7,	0x182F,	%l6
	fpack32	%f0,	%f24,	%f2
	tge	%icc,	0x7
	ta	%icc,	0x6
	fbo	%fcc3,	loop_1070
	srlx	%g1,	0x19,	%o6
	movleu	%xcc,	%l5,	%g5
	fpadd16	%f24,	%f2,	%f22
loop_1070:
	array32	%l3,	%o5,	%l1
	set	0x0C, %g3
	lda	[%l7 + %g3] 0x0c,	%f30
	fmovsleu	%xcc,	%f1,	%f27
	udivx	%i2,	0x1448,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g4,	0x18E5,	%l4
	array8	%o4,	%o2,	%o3
	movgu	%xcc,	%l0,	%g7
	bvs,a,pt	%xcc,	loop_1071
	tge	%icc,	0x2
	ldx	[%l7 + 0x60],	%i1
	set	0x24, %g1
	stwa	%i4,	[%l7 + %g1] 0x11
loop_1071:
	xorcc	%g3,	0x0481,	%o1
	movpos	%icc,	%g6,	%o0
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%l2
	tvc	%icc,	0x7
	movvs	%xcc,	%i5,	%i0
	bvs,pn	%xcc,	loop_1072
	movvs	%xcc,	%i3,	%o7
	tn	%xcc,	0x6
	movneg	%icc,	%i7,	%i6
loop_1072:
	nop
	set	0x0B, %i5
	lduba	[%l7 + %i5] 0x80,	%l6
	edge32	%g1,	%o6,	%g5
	ldstub	[%l7 + 0x13],	%l3
	mova	%xcc,	%l5,	%l1
	stw	%o5,	[%l7 + 0x0C]
	subcc	%i2,	0x0681,	%g4
	stbar
	fbge	%fcc1,	loop_1073
	nop
	setx loop_1074, %l0, %l1
	jmpl %l1, %l4
	tneg	%xcc,	0x0
	tg	%icc,	0x3
loop_1073:
	nop
	setx	0xF07DD053,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
loop_1074:
	ld	[%l7 + 0x0C],	%f13
	movle	%icc,	%g2,	%o4
	sir	0x0E00
	sub	%o2,	%o3,	%l0
	fbule,a	%fcc3,	loop_1075
	movneg	%icc,	%i1,	%g7
	ble	loop_1076
	movrne	%g3,	%i4,	%g6
loop_1075:
	fmovdl	%icc,	%f3,	%f3
	mulx	%o0,	%o1,	%i5
loop_1076:
	srax	%i0,	0x14,	%i3
	alignaddr	%o7,	%i7,	%l2
	fpack16	%f6,	%f9
	fmovsleu	%icc,	%f10,	%f15
	sethi	0x0092,	%l6
	nop
	setx	loop_1077,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%xcc,	%i6,	%g1
	fmovsgu	%icc,	%f30,	%f28
	xor	%g5,	%o6,	%l5
loop_1077:
	fble,a	%fcc1,	loop_1078
	fbul,a	%fcc0,	loop_1079
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l1,	%o5,	%l3
loop_1078:
	fzeros	%f4
loop_1079:
	udiv	%g4,	0x1348,	%l4
	xorcc	%i2,	%o4,	%o2
	edge8ln	%o3,	%g2,	%i1
	tl	%icc,	0x2
	brgez	%g7,	loop_1080
	popc	0x0E57,	%g3
	popc	0x0E45,	%l0
	fpadd16	%f30,	%f26,	%f6
loop_1080:
	smul	%g6,	%o0,	%o1
	movn	%icc,	%i5,	%i0
	subc	%i4,	%i3,	%o7
	fbule,a	%fcc3,	loop_1081
	brz	%l2,	loop_1082
	smul	%l6,	%i6,	%g1
	movcs	%xcc,	%g5,	%i7
loop_1081:
	movgu	%icc,	%l5,	%o6
loop_1082:
	fnot2	%f22,	%f12
	edge8n	%l1,	%l3,	%g4
	brnz,a	%o5,	loop_1083
	smul	%i2,	0x128B,	%o4
	movrne	%o2,	%o3,	%l4
	edge32ln	%i1,	%g2,	%g7
loop_1083:
	udivcc	%g3,	0x02C4,	%l0
	mulscc	%g6,	0x1FDC,	%o0
	set	0x5C, %i7
	stwa	%i5,	[%l7 + %i7] 0x2f
	membar	#Sync
	fmovd	%f22,	%f18
	edge8l	%o1,	%i0,	%i4
	nop
	fitos	%f9,	%f31
	stbar
	or	%i3,	%o7,	%l2
	edge32	%l6,	%i6,	%g1
	ble,pn	%xcc,	loop_1084
	movg	%icc,	%g5,	%l5
	fbule,a	%fcc0,	loop_1085
	tl	%icc,	0x6
loop_1084:
	sdiv	%i7,	0x0757,	%l1
	andncc	%o6,	%g4,	%o5
loop_1085:
	edge8	%i2,	%l3,	%o2
	wr	%g0,	0x11,	%asi
	stba	%o4,	[%l7 + 0x56] %asi
	sdivx	%l4,	0x09B0,	%i1
	subcc	%g2,	0x09C7,	%o3
	array32	%g7,	%g3,	%g6
	tl	%icc,	0x1
	nop
	fitos	%f9,	%f0
	fstoi	%f0,	%f9
	fnands	%f27,	%f27,	%f9
	ldx	[%l7 + 0x48],	%l0
	add	%i5,	0x1809,	%o1
	and	%i0,	0x03B0,	%o0
	fbue,a	%fcc3,	loop_1086
	bpos,a	loop_1087
	edge16ln	%i4,	%i3,	%l2
	edge32l	%l6,	%o7,	%i6
loop_1086:
	membar	0x1E
loop_1087:
	fbne,a	%fcc3,	loop_1088
	xnorcc	%g1,	0x1009,	%l5
	alignaddrl	%i7,	%g5,	%l1
	fbu,a	%fcc0,	loop_1089
loop_1088:
	fbu,a	%fcc0,	loop_1090
	taddcc	%o6,	%g4,	%i2
	udivcc	%o5,	0x0146,	%l3
loop_1089:
	orcc	%o4,	0x00AC,	%o2
loop_1090:
	edge32l	%l4,	%i1,	%o3
	movrlez	%g7,	0x0D0,	%g2
	edge32n	%g6,	%l0,	%i5
	or	%o1,	%g3,	%o0
	subccc	%i0,	0x08FC,	%i4
	set	0x2C, %i6
	swapa	[%l7 + %i6] 0x89,	%i3
	fmovdneg	%xcc,	%f30,	%f5
	set	0x4C, %g6
	stwa	%l6,	[%l7 + %g6] 0x81
	tleu	%icc,	0x5
	fmovsne	%xcc,	%f7,	%f18
	fpackfix	%f20,	%f23
	nop
	setx	0x4FE71357,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x76AD2C61,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f28,	%f6
	movrlz	%o7,	0x243,	%l2
	srl	%i6,	%l5,	%i7
	movleu	%xcc,	%g5,	%l1
	fmovs	%f22,	%f2
	fmovsg	%xcc,	%f13,	%f26
	andn	%o6,	0x0008,	%g4
	movl	%xcc,	%i2,	%o5
	sra	%g1,	0x0F,	%o4
	movcs	%xcc,	%o2,	%l4
	subc	%i1,	0x1DBE,	%l3
	fbl	%fcc3,	loop_1091
	fmovdg	%xcc,	%f18,	%f14
	umulcc	%g7,	%g2,	%o3
	mova	%icc,	%g6,	%i5
loop_1091:
	fsrc2	%f18,	%f6
	tcc	%icc,	0x7
	for	%f20,	%f0,	%f10
	fmovrdlez	%o1,	%f28,	%f18
	st	%f17,	[%l7 + 0x0C]
	sllx	%g3,	%l0,	%i0
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	andn	%o0,	%i3,	%o7
	fmovrdne	%l2,	%f4,	%f22
	tsubcc	%l6,	%l5,	%i7
	smulcc	%g5,	%i6,	%l1
	sub	%g4,	%i2,	%o5
	set	0x48, %g7
	lduwa	[%l7 + %g7] 0x14,	%g1
	srlx	%o4,	0x0E,	%o6
	fblg	%fcc0,	loop_1092
	alignaddrl	%l4,	%i1,	%o2
	fabsd	%f24,	%f26
	smul	%l3,	%g7,	%g2
loop_1092:
	tcs	%icc,	0x3
	udivcc	%g6,	0x1FE2,	%i5
	tl	%xcc,	0x2
	bvs	loop_1093
	fpsub16	%f4,	%f4,	%f10
	ldstub	[%l7 + 0x1B],	%o3
	bgu,pn	%icc,	loop_1094
loop_1093:
	fmovrdlz	%g3,	%f20,	%f24
	addccc	%o1,	%i0,	%l0
	tcc	%icc,	0x4
loop_1094:
	mulscc	%i4,	%i3,	%o0
	fbge	%fcc2,	loop_1095
	fmovdvs	%xcc,	%f2,	%f6
	tn	%icc,	0x4
	sra	%o7,	0x08,	%l2
loop_1095:
	bne,a,pn	%icc,	loop_1096
	edge32	%l5,	%i7,	%g5
	tcc	%xcc,	0x1
	fbue,a	%fcc3,	loop_1097
loop_1096:
	fmovsne	%icc,	%f19,	%f30
	movre	%l6,	0x257,	%i6
	array32	%g4,	%i2,	%o5
loop_1097:
	fnot2	%f0,	%f4
	fbo,a	%fcc2,	loop_1098
	brz	%l1,	loop_1099
	movpos	%icc,	%g1,	%o6
	sub	%o4,	%l4,	%i1
loop_1098:
	tn	%icc,	0x7
loop_1099:
	xnorcc	%l3,	%g7,	%o2
	movle	%xcc,	%g6,	%i5
	xorcc	%o3,	%g3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%icc,	%f9,	%f0
	movleu	%xcc,	%i0,	%l0
	array32	%i4,	%o1,	%i3
	srax	%o7,	0x13,	%l2
	fands	%f29,	%f9,	%f31
	nop
	setx	0x1DD7BDD34045C687,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movvs	%icc,	%o0,	%l5
	fbuge,a	%fcc3,	loop_1100
	brlez,a	%g5,	loop_1101
	sub	%i7,	%i6,	%g4
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1100:
	fmovsvc	%icc,	%f27,	%f0
loop_1101:
	prefetch	[%l7 + 0x7C],	 0x1
	addcc	%i2,	%l6,	%o5
	andcc	%g1,	%l1,	%o6
	bn,pn	%xcc,	loop_1102
	fmovde	%icc,	%f14,	%f23
	nop
	setx	0x9077A963,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	orncc	%o4,	%i1,	%l4
loop_1102:
	sethi	0x124B,	%l3
	movrne	%g7,	%o2,	%i5
	smul	%o3,	0x145C,	%g6
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g3
	nop
	fitos	%f5,	%f5
	fstod	%f5,	%f24
	ble,a	loop_1103
	movne	%xcc,	%i0,	%l0
	array8	%i4,	%g2,	%o1
	tcs	%icc,	0x6
loop_1103:
	sdivx	%o7,	0x0C1D,	%l2
	flush	%l7 + 0x18
	xnorcc	%i3,	0x0DCB,	%l5
	fnot2s	%f22,	%f10
	subcc	%o0,	%g5,	%i7
	stw	%i6,	[%l7 + 0x2C]
	movle	%icc,	%g4,	%l6
	andcc	%o5,	0x117C,	%g1
	tleu	%icc,	0x5
	or	%i2,	0x17E0,	%o6
	edge8l	%l1,	%i1,	%o4
	fnot2s	%f7,	%f25
	movpos	%xcc,	%l3,	%l4
	movre	%g7,	%i5,	%o3
	nop
	setx loop_1104, %l0, %l1
	jmpl %l1, %g6
	fxors	%f17,	%f11,	%f5
	fbl,a	%fcc1,	loop_1105
	fabss	%f11,	%f14
loop_1104:
	movvs	%icc,	%g3,	%i0
	fmovdn	%xcc,	%f11,	%f19
loop_1105:
	movrlz	%l0,	0x378,	%o2
	addccc	%i4,	%o1,	%o7
	alignaddrl	%l2,	%i3,	%l5
	stx	%g2,	[%l7 + 0x78]
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%i7
	fpsub32	%f10,	%f22,	%f10
	fabss	%f24,	%f15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o0,	0x00,	%g4
	fnot1s	%f29,	%f19
	nop
	fitos	%f12,	%f31
	fstox	%f31,	%f18
	udiv	%i6,	0x1CF9,	%o5
	set	0x60, %i0
	stha	%g1,	[%l7 + %i0] 0x23
	membar	#Sync
	orn	%i2,	%l6,	%o6
	sdivx	%i1,	0x0DF2,	%l1
	tneg	%xcc,	0x2
	edge8n	%l3,	%o4,	%g7
	fmuld8ulx16	%f9,	%f10,	%f2
	sdiv	%l4,	0x1B24,	%i5
	edge32l	%g6,	%o3,	%g3
	udiv	%i0,	0x1CF4,	%l0
	fsrc2	%f12,	%f30
	fmovrde	%i4,	%f10,	%f10
	fmovdleu	%icc,	%f0,	%f28
	ta	%icc,	0x3
	xnor	%o1,	0x1496,	%o2
	movvc	%icc,	%l2,	%o7
	ldstub	[%l7 + 0x19],	%l5
	brgz	%i3,	loop_1106
	te	%xcc,	0x3
	array8	%g5,	%i7,	%o0
	bleu,a,pt	%xcc,	loop_1107
loop_1106:
	mulscc	%g4,	0x109C,	%g2
	sethi	0x004F,	%i6
	and	%o5,	%i2,	%g1
loop_1107:
	bpos,a,pt	%icc,	loop_1108
	std	%f28,	[%l7 + 0x50]
	fpsub16s	%f29,	%f7,	%f18
	movle	%xcc,	%o6,	%l6
loop_1108:
	edge32ln	%i1,	%l3,	%l1
	fmul8x16al	%f4,	%f11,	%f26
	fmovdg	%icc,	%f30,	%f24
	orcc	%o4,	0x1A86,	%g7
	te	%icc,	0x6
	fabss	%f21,	%f23
	edge8	%l4,	%g6,	%i5
	sra	%o3,	%g3,	%i0
	addccc	%i4,	0x15ED,	%o1
	wr	%g0,	0x89,	%asi
	stha	%l0,	[%l7 + 0x2C] %asi
	movrgz	%l2,	%o7,	%l5
	fmovdne	%xcc,	%f11,	%f24
	tle	%icc,	0x3
	te	%icc,	0x6
	sdivx	%o2,	0x13F2,	%g5
	fbne	%fcc1,	loop_1109
	nop
	setx	0x18EB889D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xCEB5E5ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f17,	%f9
	bleu,a	%icc,	loop_1110
	fpsub32s	%f7,	%f7,	%f14
loop_1109:
	movg	%icc,	%i3,	%o0
	umul	%i7,	%g2,	%i6
loop_1110:
	tleu	%icc,	0x2
	sdiv	%o5,	0x1FCE,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g1,	0x1104,	%o6
	tcc	%icc,	0x0
	movge	%icc,	%i2,	%l6
	nop
	set	0x16, %i2
	sth	%l3,	[%l7 + %i2]
	tvc	%xcc,	0x6
	movrlz	%l1,	%i1,	%g7
	bne,a	loop_1111
	edge32l	%l4,	%g6,	%o4
	move	%xcc,	%i5,	%g3
	xorcc	%i0,	%i4,	%o1
loop_1111:
	sll	%o3,	0x00,	%l0
	subcc	%o7,	0x13D0,	%l5
	fbuge	%fcc2,	loop_1112
	alignaddr	%l2,	%g5,	%o2
	movg	%icc,	%o0,	%i7
	bvs,a	%icc,	loop_1113
loop_1112:
	tsubcctv	%g2,	0x0F9B,	%i3
	fandnot2	%f0,	%f28,	%f12
	fbuge	%fcc0,	loop_1114
loop_1113:
	edge16ln	%i6,	%g4,	%o5
	nop
	fitod	%f0,	%f2
	fdtos	%f2,	%f16
	lduh	[%l7 + 0x0A],	%g1
loop_1114:
	movl	%xcc,	%o6,	%i2
	nop
	fitos	%f12,	%f14
	fstox	%f14,	%f12
	udiv	%l3,	0x190A,	%l6
	subccc	%i1,	%g7,	%l1
	or	%g6,	%o4,	%i5
	movrgz	%g3,	%i0,	%i4
	edge8	%l4,	%o3,	%o1
	ldsw	[%l7 + 0x2C],	%l0
	tcs	%icc,	0x5
	xnorcc	%o7,	0x1BBE,	%l2
	edge32n	%l5,	%g5,	%o0
	wr	%g0,	0x10,	%asi
	stwa	%i7,	[%l7 + 0x5C] %asi
	lduh	[%l7 + 0x7E],	%g2
	nop
	setx	loop_1115,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	membar	0x0F
	edge8	%o2,	%i6,	%g4
	umulcc	%o5,	0x002F,	%i3
loop_1115:
	nop
	setx	0x10C04F9D215A6993,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x3C3AEE6DE2686D3D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f12,	%f18
	fmovdle	%icc,	%f17,	%f12
	alignaddrl	%o6,	%i2,	%l3
	add	%g1,	%l6,	%i1
	subccc	%l1,	0x133A,	%g6
	popc	0x06FF,	%o4
	fmovsneg	%icc,	%f4,	%f7
	nop
	setx	loop_1116,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	stxa	%i5,	[%l7 + 0x78] %asi
loop_1116:
	fbn,a	%fcc2,	loop_1117
	fornot1	%f22,	%f30,	%f14
	tgu	%icc,	0x5
	edge8	%g3,	%i0,	%g7
loop_1117:
	nop
	fitos	%f10,	%f29
	fstox	%f29,	%f22
	fxtos	%f22,	%f7
	tvc	%icc,	0x0
	stb	%i4,	[%l7 + 0x4C]
	orcc	%l4,	0x0508,	%o1
	edge32	%o3,	%o7,	%l2
	edge32n	%l5,	%g5,	%o0
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x20] %asi,	%i7
	xorcc	%l0,	%g2,	%o2
	tg	%xcc,	0x7
	srax	%i6,	%g4,	%i3
	sllx	%o5,	0x1B,	%i2
	stw	%l3,	[%l7 + 0x58]
	array32	%g1,	%o6,	%i1
	edge32n	%l6,	%g6,	%l1
	movne	%icc,	%i5,	%g3
	fmovsleu	%icc,	%f5,	%f22
	membar	0x67
	alignaddrl	%i0,	%o4,	%g7
	ldx	[%l7 + 0x30],	%i4
	add	%l4,	%o3,	%o1
	nop
	setx	0x779E422C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x22BD8E67,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f2,	%f6
	tcs	%xcc,	0x1
	taddcc	%l2,	%o7,	%g5
	movn	%xcc,	%o0,	%i7
	swap	[%l7 + 0x64],	%l0
	udiv	%g2,	0x1E9A,	%o2
	addcc	%i6,	%g4,	%i3
	addc	%l5,	%o5,	%i2
	bgu	loop_1118
	udiv	%l3,	0x1786,	%g1
	add	%o6,	0x0933,	%l6
	te	%xcc,	0x4
loop_1118:
	fmovdge	%xcc,	%f11,	%f16
	tpos	%xcc,	0x2
	edge8ln	%g6,	%l1,	%i1
	movvc	%xcc,	%i5,	%g3
	fpack16	%f0,	%f28
	addccc	%i0,	0x1FA2,	%o4
	fmovsle	%icc,	%f0,	%f22
	lduw	[%l7 + 0x5C],	%g7
	edge16	%i4,	%l4,	%o3
	addcc	%o1,	0x02F9,	%l2
	bn,pt	%xcc,	loop_1119
	fmovrsne	%o7,	%f21,	%f28
	addcc	%g5,	0x0D44,	%i7
	fors	%f31,	%f24,	%f26
loop_1119:
	taddcc	%o0,	%l0,	%o2
	xnorcc	%i6,	%g4,	%g2
	umul	%l5,	0x1EC9,	%i3
	edge32	%i2,	%o5,	%g1
	fmovse	%xcc,	%f23,	%f14
	movl	%xcc,	%o6,	%l6
	tsubcc	%g6,	%l1,	%i1
	udivcc	%i5,	0x0B76,	%g3
	udivx	%l3,	0x0E9F,	%i0
	nop
	setx	0x2A95A72A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x617ACBFD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f9,	%f9
	orncc	%g7,	0x1B40,	%i4
	fpsub32	%f6,	%f10,	%f22
	sdivx	%o4,	0x196F,	%l4
	tvc	%icc,	0x5
	fbe	%fcc1,	loop_1120
	movvs	%xcc,	%o1,	%l2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%o3
loop_1120:
	fsrc1	%f12,	%f30
	fnot2s	%f26,	%f22
	ba	loop_1121
	and	%i7,	0x0311,	%o0
	set	0x5C, %g5
	stwa	%l0,	[%l7 + %g5] 0xea
	membar	#Sync
loop_1121:
	movrlez	%o2,	0x35E,	%g5
	movrlz	%i6,	0x043,	%g4
	movcs	%xcc,	%g2,	%l5
	xnor	%i3,	0x0EB4,	%i2
	move	%xcc,	%g1,	%o6
	move	%xcc,	%o5,	%g6
	tneg	%xcc,	0x6
	sllx	%l6,	0x05,	%i1
	tg	%icc,	0x7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8ln	%l1,	%g3,	%i5
	ta	%xcc,	0x2
	tvs	%xcc,	0x0
	edge32ln	%l3,	%i0,	%g7
	movpos	%icc,	%o4,	%i4
	movre	%o1,	%l4,	%l2
	array32	%o3,	%o7,	%o0
	addccc	%i7,	0x14F3,	%l0
	movvs	%icc,	%o2,	%g5
	bg,a	loop_1122
	movrgez	%i6,	%g4,	%l5
	fpsub16	%f26,	%f0,	%f26
	sub	%g2,	0x1D27,	%i2
loop_1122:
	tle	%xcc,	0x3
	udivx	%i3,	0x1C88,	%o6
	srax	%g1,	%g6,	%o5
	addc	%l6,	%i1,	%l1
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x30] %asi,	%i4
	nop
	fitod	%f10,	%f22
	fdtoi	%f22,	%f30
	movre	%g3,	0x003,	%l3
	taddcctv	%g7,	0x1400,	%i0
	flush	%l7 + 0x74
	movre	%o4,	%i4,	%l4
	addcc	%o1,	%l2,	%o3
	xor	%o7,	0x0A9F,	%o0
	fbug	%fcc0,	loop_1123
	alignaddrl	%i7,	%o2,	%l0
	movneg	%icc,	%g5,	%g4
	orncc	%i6,	%g2,	%i2
loop_1123:
	fmovrsgez	%i3,	%f8,	%f19
	fbug,a	%fcc2,	loop_1124
	tcc	%icc,	0x5
	fnands	%f26,	%f26,	%f22
	bgu,pn	%xcc,	loop_1125
loop_1124:
	tvs	%icc,	0x4
	tle	%xcc,	0x6
	orn	%o6,	%l5,	%g1
loop_1125:
	fnot2s	%f6,	%f26
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x54] %asi,	%f20
	bne,a	loop_1126
	popc	0x1C14,	%g6
	fxnor	%f8,	%f14,	%f2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l6,	%o5
loop_1126:
	ldsw	[%l7 + 0x7C],	%l1
	nop
	fitos	%f2,	%f2
	fstoi	%f2,	%f22
	sllx	%i1,	%i5,	%g3
	fpack32	%f8,	%f10,	%f14
	ldd	[%l7 + 0x58],	%g6
	edge16	%i0,	%o4,	%l3
	bpos	loop_1127
	tle	%xcc,	0x2
	nop
	setx	0x40404AD480627AE7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	tne	%xcc,	0x5
loop_1127:
	std	%f22,	[%l7 + 0x58]
	taddcctv	%i4,	0x13BE,	%l4
	sethi	0x0BD3,	%o1
	udivx	%o3,	0x0520,	%l2
	movcs	%icc,	%o0,	%i7
	fbue,a	%fcc3,	loop_1128
	stb	%o7,	[%l7 + 0x19]
	sdivcc	%o2,	0x0C94,	%g5
	movneg	%icc,	%l0,	%g4
loop_1128:
	alignaddrl	%g2,	%i6,	%i3
	ba,a,pt	%icc,	loop_1129
	fpsub16s	%f14,	%f10,	%f31
	movne	%xcc,	%o6,	%l5
	ta	%xcc,	0x7
loop_1129:
	swap	[%l7 + 0x18],	%g1
	movcs	%icc,	%g6,	%i2
	fmovrde	%o5,	%f26,	%f28
	udivx	%l6,	0x1ECB,	%l1
	tg	%xcc,	0x2
	tcc	%xcc,	0x5
	move	%icc,	%i1,	%i5
	taddcctv	%g3,	%i0,	%g7
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x80,	%o4
	fpmerge	%f10,	%f30,	%f22
	sdivcc	%i4,	0x1F7E,	%l4
	edge32ln	%l3,	%o1,	%l2
	lduh	[%l7 + 0x1A],	%o0
	movgu	%xcc,	%o3,	%i7
	stb	%o2,	[%l7 + 0x48]
	sll	%o7,	%g5,	%l0
	fmovscs	%icc,	%f16,	%f5
	popc	0x1DE8,	%g4
	srax	%i6,	%g2,	%i3
	sethi	0x182B,	%l5
	move	%xcc,	%o6,	%g6
	nop
	fitos	%f11,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f17,	%f29,	%f14
	fpadd32	%f24,	%f26,	%f22
	movle	%xcc,	%g1,	%o5
	movneg	%icc,	%l6,	%l1
	movneg	%xcc,	%i2,	%i1
	fmovsleu	%xcc,	%f17,	%f25
	nop
	setx	loop_1130,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ble,a,pt	%xcc,	loop_1131
	fmovrde	%g3,	%f24,	%f14
	smul	%i5,	%g7,	%i0
loop_1130:
	nop
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1131:
	fandnot2s	%f26,	%f26,	%f7
	edge8n	%o4,	%i4,	%l3
	set	0x38, %o6
	sta	%f30,	[%l7 + %o6] 0x10
	popc	0x051D,	%l4
	tleu	%icc,	0x0
	movvs	%xcc,	%o1,	%o0
	tleu	%xcc,	0x1
	ba,pn	%icc,	loop_1132
	brnz	%l2,	loop_1133
	fnand	%f22,	%f16,	%f26
	nop
	setx	loop_1134,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1132:
	edge8	%i7,	%o3,	%o2
loop_1133:
	movrlez	%o7,	%g5,	%l0
	brgz,a	%g4,	loop_1135
loop_1134:
	fpackfix	%f12,	%f5
	movrgz	%i6,	0x3D6,	%g2
	stx	%i3,	[%l7 + 0x08]
loop_1135:
	srlx	%o6,	0x01,	%g6
	edge32ln	%g1,	%o5,	%l5
	nop
	set	0x38, %l5
	ldx	[%l7 + %l5],	%l6
	tg	%xcc,	0x0
	xorcc	%l1,	%i2,	%i1
	fbule,a	%fcc0,	loop_1136
	taddcctv	%i5,	%g3,	%g7
	array8	%i0,	%i4,	%l3
	edge8n	%o4,	%l4,	%o1
loop_1136:
	movrlez	%l2,	0x227,	%i7
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	fbu,a	%fcc2,	loop_1137
	udivx	%o0,	0x0613,	%o7
	or	%g5,	0x048E,	%l0
	subc	%g4,	0x1B4C,	%i6
loop_1137:
	tg	%icc,	0x1
	alignaddr	%o2,	%i3,	%o6
	nop
	setx	0x2905DC8C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xDA822CBC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f22,	%f16
	fmovdgu	%xcc,	%f26,	%f7
	fzeros	%f23
	udivx	%g2,	0x0287,	%g6
	array16	%o5,	%l5,	%l6
	movleu	%icc,	%l1,	%i2
	smulcc	%g1,	0x0EA5,	%i1
	te	%xcc,	0x1
	sllx	%g3,	%i5,	%i0
	movvc	%icc,	%g7,	%l3
	movrgz	%i4,	0x113,	%l4
	xor	%o4,	%l2,	%o1
	bneg	loop_1138
	bvc	loop_1139
	umulcc	%i7,	%o3,	%o7
	sdivx	%o0,	0x15C4,	%g5
loop_1138:
	fmovdleu	%icc,	%f2,	%f17
loop_1139:
	umul	%g4,	0x0910,	%i6
	fmuld8sux16	%f19,	%f6,	%f0
	fpsub32s	%f12,	%f27,	%f10
	stx	%l0,	[%l7 + 0x38]
	orncc	%i3,	%o2,	%g2
	alignaddrl	%o6,	%g6,	%o5
	fbue	%fcc0,	loop_1140
	udiv	%l6,	0x08E4,	%l5
	or	%i2,	%l1,	%g1
	nop
	setx	loop_1141,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1140:
	sra	%g3,	0x02,	%i5
	fmovrsgez	%i1,	%f1,	%f7
	srax	%g7,	0x1C,	%l3
loop_1141:
	subccc	%i4,	0x1CD5,	%l4
	fmovrsne	%o4,	%f0,	%f20
	fmovrsgz	%l2,	%f13,	%f24
	andcc	%o1,	%i0,	%i7
	fblg,a	%fcc0,	loop_1142
	tge	%icc,	0x2
	movn	%xcc,	%o7,	%o3
	fcmpne16	%f20,	%f20,	%g5
loop_1142:
	nop
	setx	0xEFE18583CAD76921,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xD0D5D00358ADBF78,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f26,	%f28
	edge16	%g4,	%o0,	%l0
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x88,	%i6
	movcc	%xcc,	%i3,	%o2
	fxors	%f16,	%f6,	%f20
	fandnot2	%f4,	%f8,	%f20
	taddcc	%o6,	%g6,	%o5
	fmovdcs	%icc,	%f24,	%f27
	bvs,a,pt	%xcc,	loop_1143
	movrlz	%g2,	%l6,	%i2
	fsrc2	%f24,	%f30
	sth	%l5,	[%l7 + 0x66]
loop_1143:
	tsubcctv	%l1,	0x169D,	%g3
	sethi	0x06F3,	%i5
	alignaddr	%g1,	%g7,	%i1
	movre	%l3,	%l4,	%o4
	popc	0x1911,	%l2
	fcmpgt16	%f10,	%f26,	%i4
	fxors	%f27,	%f0,	%f21
	brlez	%o1,	loop_1144
	tcs	%xcc,	0x5
	fbug	%fcc0,	loop_1145
	nop
	fitod	%f4,	%f14
	fdtoi	%f14,	%f2
loop_1144:
	andncc	%i0,	%o7,	%o3
	fpadd32	%f4,	%f8,	%f22
loop_1145:
	umul	%i7,	%g5,	%g4
	fbe	%fcc0,	loop_1146
	fbg	%fcc0,	loop_1147
	orn	%o0,	0x1FF0,	%i6
	subccc	%l0,	0x10D1,	%i3
loop_1146:
	nop
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x16,	%f16
loop_1147:
	andncc	%o6,	%g6,	%o2
	udiv	%o5,	0x0AB1,	%l6
	edge8n	%g2,	%l5,	%l1
	lduw	[%l7 + 0x1C],	%g3
	fbe,a	%fcc0,	loop_1148
	andn	%i2,	0x1FAD,	%g1
	orcc	%g7,	0x115B,	%i5
	edge8n	%l3,	%l4,	%i1
loop_1148:
	tcc	%icc,	0x2
	movvc	%icc,	%l2,	%i4
	lduh	[%l7 + 0x58],	%o1
	sir	0x06F6
	fba	%fcc2,	loop_1149
	stbar
	brgz,a	%i0,	loop_1150
	edge32	%o4,	%o7,	%i7
loop_1149:
	bl,a	%icc,	loop_1151
	tvs	%xcc,	0x0
loop_1150:
	edge8ln	%o3,	%g4,	%o0
	and	%i6,	%g5,	%l0
loop_1151:
	orcc	%i3,	0x10D0,	%o6
	fmovrse	%o2,	%f7,	%f21
	sub	%g6,	%o5,	%l6
	tge	%icc,	0x7
	udivx	%l5,	0x06C2,	%l1
	udiv	%g2,	0x0E68,	%g3
	fabsd	%f26,	%f0
	taddcctv	%i2,	0x1241,	%g1
	movrgz	%i5,	%l3,	%g7
	addc	%l4,	0x1032,	%l2
	mulscc	%i1,	%i4,	%o1
	nop
	fitos	%f13,	%f26
	fstox	%f26,	%f12
	sethi	0x1E1D,	%i0
	fmovdneg	%xcc,	%f15,	%f24
	edge16ln	%o7,	%o4,	%o3
	fpmerge	%f4,	%f29,	%f4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%o0
	tgu	%xcc,	0x5
	array32	%i7,	%i6,	%l0
	bge	loop_1152
	fbge,a	%fcc2,	loop_1153
	fbne	%fcc3,	loop_1154
	mulscc	%g5,	0x12AC,	%i3
loop_1152:
	udiv	%o6,	0x04F0,	%o2
loop_1153:
	udivx	%o5,	0x0E83,	%l6
loop_1154:
	fcmple16	%f10,	%f16,	%l5
	fabss	%f28,	%f22
	fnand	%f22,	%f2,	%f10
	fands	%f15,	%f26,	%f12
	addcc	%l1,	0x006E,	%g2
	tg	%icc,	0x3
	fbug,a	%fcc0,	loop_1155
	move	%xcc,	%g3,	%i2
	set	0x48, %l2
	stba	%g6,	[%l7 + %l2] 0x0c
loop_1155:
	edge32	%g1,	%i5,	%l3
	xor	%l4,	%l2,	%i1
	sub	%g7,	%o1,	%i4
	movvc	%icc,	%o7,	%i0
	edge32n	%o3,	%o4,	%g4
	edge8	%o0,	%i7,	%l0
	tsubcctv	%i6,	%g5,	%i3
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o2
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	fmul8x16al	%f12,	%f17,	%f20
	nop
	setx loop_1156, %l0, %l1
	jmpl %l1, %l6
	bneg,a,pn	%xcc,	loop_1157
	movrne	%l5,	0x0D9,	%o5
	ld	[%l7 + 0x2C],	%f30
loop_1156:
	tsubcctv	%l1,	0x0DC4,	%g2
loop_1157:
	fxors	%f24,	%f23,	%f18
	nop
	setx	0x0B28E0DA8AA8D38D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xCBAD37FA2940AA28,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f30,	%f28
	movrne	%i2,	0x299,	%g6
	bshuffle	%f30,	%f2,	%f6
	mova	%xcc,	%g3,	%g1
	fandnot2	%f8,	%f26,	%f28
	membar	0x7E
	fsrc2s	%f6,	%f28
	tl	%xcc,	0x2
	taddcc	%l3,	%i5,	%l4
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x1f,	%f0
	movgu	%xcc,	%l2,	%i1
	ldub	[%l7 + 0x48],	%o1
	fblg,a	%fcc3,	loop_1158
	fornot1	%f12,	%f30,	%f30
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x50] %asi,	%i4
loop_1158:
	fmovdneg	%xcc,	%f13,	%f21
	movge	%icc,	%o7,	%g7
	movrne	%o3,	0x2AA,	%o4
	movvs	%xcc,	%g4,	%o0
	srlx	%i7,	0x0A,	%i0
	movre	%i6,	%g5,	%i3
	fmovde	%xcc,	%f13,	%f4
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x41] %asi,	%l0
	andcc	%o2,	0x1B5A,	%l6
	set	0x70, %o4
	ldsha	[%l7 + %o4] 0x11,	%l5
	edge16ln	%o5,	%o6,	%l1
	fbue,a	%fcc3,	loop_1159
	array8	%g2,	%g6,	%i2
	xorcc	%g1,	0x1EDA,	%g3
	edge8n	%l3,	%l4,	%i5
loop_1159:
	movl	%icc,	%l2,	%i1
	fornot1s	%f4,	%f26,	%f5
	fpadd32	%f22,	%f12,	%f6
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o1
	fcmple16	%f16,	%f26,	%o7
	or	%i4,	%o3,	%o4
	bn,a	loop_1160
	edge16	%g7,	%o0,	%i7
	fbg,a	%fcc0,	loop_1161
	fornot2s	%f30,	%f7,	%f24
loop_1160:
	sub	%g4,	0x0C37,	%i6
	array32	%i0,	%g5,	%l0
loop_1161:
	swap	[%l7 + 0x64],	%i3
	fors	%f7,	%f20,	%f21
	tcs	%icc,	0x4
	edge16ln	%o2,	%l5,	%o5
	stw	%o6,	[%l7 + 0x54]
	sdivcc	%l1,	0x118F,	%g2
	xnorcc	%l6,	0x1E70,	%g6
	sdiv	%g1,	0x0098,	%g3
	nop
	setx	0xC7D8B49B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x2D1FF388,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f28,	%f3
	brgz,a	%l3,	loop_1162
	srlx	%i2,	%i5,	%l2
	mulscc	%i1,	0x1E7C,	%l4
	bleu	loop_1163
loop_1162:
	fandnot2s	%f4,	%f0,	%f15
	taddcctv	%o1,	0x1765,	%o7
	movne	%xcc,	%i4,	%o3
loop_1163:
	tcs	%xcc,	0x3
	fbl,a	%fcc1,	loop_1164
	taddcctv	%o4,	%g7,	%o0
	fmovrsgz	%g4,	%f15,	%f19
	fmuld8sux16	%f20,	%f6,	%f30
loop_1164:
	tsubcctv	%i6,	%i7,	%i0
	fmuld8sux16	%f24,	%f13,	%f12
	smul	%g5,	0x0EA7,	%i3
	bleu,a	loop_1165
	tleu	%icc,	0x4
	movre	%o2,	0x02F,	%l5
	umulcc	%o5,	0x195B,	%o6
loop_1165:
	bvc	loop_1166
	fbo	%fcc1,	loop_1167
	fmul8x16au	%f22,	%f9,	%f16
	nop
	fitos	%f1,	%f4
	fstoi	%f4,	%f19
loop_1166:
	fnors	%f7,	%f6,	%f27
loop_1167:
	fmovrdne	%l0,	%f22,	%f12
	edge16	%l1,	%g2,	%l6
	tl	%icc,	0x5
	umulcc	%g6,	0x1424,	%g1
	fpadd16s	%f18,	%f29,	%f10
	fmovsgu	%xcc,	%f31,	%f28
	fmovsgu	%icc,	%f3,	%f8
	mulx	%g3,	0x06A9,	%l3
	std	%f22,	[%l7 + 0x68]
	tn	%xcc,	0x6
	alignaddr	%i5,	%l2,	%i2
	prefetch	[%l7 + 0x1C],	 0x3
	subcc	%l4,	0x07DA,	%i1
	alignaddr	%o1,	%i4,	%o7
	edge8ln	%o3,	%g7,	%o0
	fba	%fcc2,	loop_1168
	brgz,a	%o4,	loop_1169
	movle	%icc,	%i6,	%g4
	tneg	%icc,	0x7
loop_1168:
	nop
	setx	0xC964C813,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x71853B02,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f21,	%f29
loop_1169:
	taddcctv	%i0,	%g5,	%i7
	fbne	%fcc3,	loop_1170
	mova	%xcc,	%o2,	%l5
	movg	%icc,	%i3,	%o6
	ldd	[%l7 + 0x48],	%f24
loop_1170:
	tne	%xcc,	0x5
	fornot1	%f2,	%f2,	%f30
	movrne	%o5,	%l1,	%l0
	bcs,a	%icc,	loop_1171
	tcs	%icc,	0x0
	movrgez	%l6,	0x248,	%g2
	bn,pn	%icc,	loop_1172
loop_1171:
	sethi	0x1C2B,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g3,	%f16,	%f20
loop_1172:
	fpadd32s	%f16,	%f23,	%f16
	tcs	%icc,	0x1
	tleu	%icc,	0x4
	movrlez	%l3,	%g6,	%i5
	ldstub	[%l7 + 0x4C],	%l2
	udiv	%i2,	0x0646,	%i1
	bvs	loop_1173
	srax	%l4,	0x1F,	%o1
	membar	0x71
	popc	%i4,	%o7
loop_1173:
	nop
	setx	loop_1174,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbug,a	%fcc0,	loop_1175
	ba,pn	%xcc,	loop_1176
	sll	%g7,	%o0,	%o3
loop_1174:
	stw	%i6,	[%l7 + 0x48]
loop_1175:
	movpos	%xcc,	%g4,	%i0
loop_1176:
	mulx	%g5,	0x0DC5,	%i7
	movneg	%xcc,	%o4,	%o2
	fzero	%f24
	nop
	setx	0xEB5F30CF0D58AE98,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6510A89C1A15A6D0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f22,	%f24
	srl	%l5,	0x01,	%o6
	orncc	%i3,	0x0782,	%l1
	flush	%l7 + 0x0C
	xor	%l0,	%l6,	%o5
	srl	%g1,	%g2,	%l3
	faligndata	%f10,	%f28,	%f26
	ldub	[%l7 + 0x2C],	%g3
	xor	%g6,	%i5,	%i2
	edge8l	%l2,	%i1,	%o1
	brlz,a	%l4,	loop_1177
	fbg,a	%fcc1,	loop_1178
	movre	%i4,	%g7,	%o7
	srax	%o3,	%i6,	%o0
loop_1177:
	edge8n	%i0,	%g4,	%g5
loop_1178:
	brgz,a	%i7,	loop_1179
	srax	%o4,	%l5,	%o2
	subc	%o6,	0x03EF,	%l1
	fmovscs	%icc,	%f20,	%f11
loop_1179:
	sra	%l0,	0x15,	%l6
	fpadd32s	%f12,	%f8,	%f28
	or	%o5,	%g1,	%g2
	movgu	%xcc,	%l3,	%g3
	bcc	%icc,	loop_1180
	orcc	%i3,	0x12D1,	%i5
	movrlz	%i2,	0x3F6,	%g6
	faligndata	%f24,	%f10,	%f16
loop_1180:
	nop
	fitos	%f2,	%f19
	fstox	%f19,	%f18
	fxtos	%f18,	%f7
	orncc	%i1,	0x1D29,	%o1
	array16	%l2,	%l4,	%i4
	fbug	%fcc2,	loop_1181
	andn	%g7,	%o3,	%i6
	movge	%icc,	%o0,	%i0
	fornot2s	%f18,	%f25,	%f22
loop_1181:
	subccc	%o7,	0x01A3,	%g4
	set	0x4C, %i1
	stha	%g5,	[%l7 + %i1] 0x2b
	membar	#Sync
	movpos	%xcc,	%i7,	%l5
	sdiv	%o2,	0x0F64,	%o6
	call	loop_1182
	fbug	%fcc1,	loop_1183
	fpadd32s	%f29,	%f0,	%f4
	udivx	%o4,	0x1E6B,	%l1
loop_1182:
	fmovsvs	%icc,	%f30,	%f14
loop_1183:
	fornot1	%f4,	%f14,	%f2
	bne,pt	%icc,	loop_1184
	mulx	%l0,	%l6,	%g1
	movle	%xcc,	%o5,	%g2
	nop
	fitod	%f6,	%f6
loop_1184:
	alignaddrl	%g3,	%i3,	%i5
	movg	%icc,	%l3,	%i2
	sll	%g6,	0x15,	%o1
	stb	%i1,	[%l7 + 0x30]
	andn	%l2,	0x0DBC,	%l4
	tge	%icc,	0x3
	call	loop_1185
	movcs	%xcc,	%i4,	%o3
	set	0x28, %o7
	lduwa	[%l7 + %o7] 0x14,	%i6
loop_1185:
	sll	%o0,	0x06,	%g7
	sir	0x0CB3
	movrlz	%o7,	0x242,	%i0
	stw	%g5,	[%l7 + 0x20]
	edge32n	%i7,	%l5,	%g4
	movre	%o2,	%o4,	%o6
	ba,a,pn	%xcc,	loop_1186
	fpsub32	%f4,	%f12,	%f0
	nop
	set	0x0C, %l3
	lduw	[%l7 + %l3],	%l1
	edge16n	%l0,	%g1,	%o5
loop_1186:
	ldsb	[%l7 + 0x34],	%l6
	fcmpeq32	%f28,	%f26,	%g3
	movgu	%icc,	%i3,	%g2
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x20] %asi,	%i5
	st	%f5,	[%l7 + 0x7C]
	mova	%xcc,	%l3,	%g6
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i2
	fnand	%f26,	%f12,	%f20
	for	%f6,	%f30,	%f2
	movrlz	%i1,	%o1,	%l4
	sllx	%i4,	%l2,	%i6
	or	%o0,	%o3,	%g7
	or	%i0,	0x1850,	%g5
	lduw	[%l7 + 0x18],	%i7
	nop
	setx	0xBF92110947F2FD7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x4EA50C824F5B851E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f12,	%f6
	tcs	%xcc,	0x2
	movcc	%xcc,	%l5,	%o7
	nop
	set	0x3D, %o1
	stb	%g4,	[%l7 + %o1]
	fpackfix	%f18,	%f7
	fsrc1s	%f3,	%f9
	srl	%o4,	%o2,	%l1
	or	%l0,	%g1,	%o6
	tvc	%icc,	0x5
	nop
	setx	0x705C471D,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	movg	%xcc,	%l6,	%g3
	set	0x4E, %l0
	stha	%o5,	[%l7 + %l0] 0xeb
	membar	#Sync
	tsubcctv	%g2,	%i5,	%i3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x81,	%l3,	%i2
	ldstub	[%l7 + 0x18],	%g6
	sllx	%o1,	%l4,	%i1
	fmovrdgez	%l2,	%f18,	%f12
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f20
	tl	%icc,	0x3
	movpos	%xcc,	%i4,	%i6
	fpack16	%f4,	%f11
	fmovs	%f27,	%f14
	srax	%o3,	0x05,	%g7
	srlx	%o0,	0x06,	%i0
	umulcc	%g5,	0x1F1F,	%l5
	array32	%i7,	%o7,	%g4
	sdivcc	%o4,	0x1A1F,	%l1
	nop
	fitos	%f14,	%f24
	sub	%o2,	0x1ED6,	%l0
	tle	%xcc,	0x5
	udivx	%o6,	0x1E4C,	%g1
	taddcc	%g3,	%o5,	%l6
	sth	%g2,	[%l7 + 0x6E]
	fsrc2s	%f24,	%f31
	fcmpeq16	%f2,	%f20,	%i5
	fbule,a	%fcc2,	loop_1187
	tcs	%icc,	0x3
	tsubcctv	%i3,	%i2,	%l3
	fbl,a	%fcc0,	loop_1188
loop_1187:
	mulx	%g6,	0x078E,	%l4
	srlx	%o1,	%i1,	%l2
	tge	%icc,	0x7
loop_1188:
	array8	%i4,	%o3,	%i6
	nop
	setx	0xA041249C,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	alignaddrl	%g7,	%o0,	%g5
	edge16	%l5,	%i7,	%o7
	movpos	%xcc,	%g4,	%i0
	nop
	setx	loop_1189,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrsgz	%o4,	%f9,	%f21
	orcc	%o2,	0x05A1,	%l1
	fnands	%f8,	%f31,	%f16
loop_1189:
	tsubcc	%l0,	%o6,	%g3
	fmovsge	%icc,	%f8,	%f14
	wr	%g0,	0x11,	%asi
	sta	%f8,	[%l7 + 0x7C] %asi
	fmovsneg	%icc,	%f23,	%f2
	edge16ln	%g1,	%o5,	%g2
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movpos	%icc,	%l6,	%i3
	bpos,a,pt	%xcc,	loop_1190
	smul	%i5,	%i2,	%g6
	xnorcc	%l4,	0x095F,	%o1
	srlx	%l3,	0x11,	%i1
loop_1190:
	fabsd	%f22,	%f4
	addccc	%i4,	%l2,	%i6
	bvs,a	loop_1191
	sdivcc	%g7,	0x03D3,	%o0
	bl,a,pt	%icc,	loop_1192
	tne	%icc,	0x3
loop_1191:
	edge8ln	%o3,	%g5,	%l5
	add	%i7,	0x03B3,	%g4
loop_1192:
	ldd	[%l7 + 0x28],	%o6
	fmovrsne	%i0,	%f0,	%f16
	set	0x30, %g4
	ldxa	[%g0 + %g4] 0x4f,	%o2
	xor	%o4,	%l0,	%l1
	brnz,a	%g3,	loop_1193
	array8	%o6,	%o5,	%g2
	or	%g1,	0x0555,	%i3
	ldsh	[%l7 + 0x64],	%l6
loop_1193:
	fnot2s	%f27,	%f14
	fpmerge	%f4,	%f16,	%f2
	bvs,a	%xcc,	loop_1194
	fmovsneg	%xcc,	%f24,	%f29
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x15
loop_1194:
	tge	%icc,	0x6
	fmovdneg	%icc,	%f0,	%f8
	sdivcc	%i5,	0x1368,	%g6
	movleu	%xcc,	%i2,	%o1
	nop
	setx	0x307C0335,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	ba	%xcc,	loop_1195
	fmul8x16au	%f12,	%f14,	%f0
	fsrc1s	%f23,	%f26
	edge8ln	%l4,	%i1,	%i4
loop_1195:
	umul	%l3,	0x105B,	%l2
	st	%f11,	[%l7 + 0x6C]
	set	0x40, %o2
	prefetcha	[%l7 + %o2] 0x04,	 0x0
	tne	%icc,	0x6
	movvc	%xcc,	%o0,	%o3
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movrlez	%i6,	0x174,	%g5
	tge	%xcc,	0x3
	brz	%i7,	loop_1196
	add	%g4,	0x069E,	%l5
	addc	%o7,	0x075D,	%i0
	movrgez	%o4,	0x05B,	%o2
loop_1196:
	andncc	%l0,	%l1,	%o6
	ldd	[%l7 + 0x50],	%o4
	nop
	setx	0x1A9C68071B24F42B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x504680036AA9AEEA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f24,	%f28
	sra	%g3,	%g1,	%i3
	movn	%icc,	%l6,	%i5
	xor	%g6,	%i2,	%g2
	tge	%xcc,	0x0
	add	%l4,	0x0909,	%i1
	edge32l	%o1,	%i4,	%l3
	fbge,a	%fcc3,	loop_1197
	sethi	0x1D21,	%l2
	fmovsg	%xcc,	%f21,	%f12
	alignaddrl	%g7,	%o3,	%o0
loop_1197:
	call	loop_1198
	edge8l	%g5,	%i6,	%i7
	brgz	%l5,	loop_1199
	tle	%xcc,	0x2
loop_1198:
	tl	%xcc,	0x3
	udiv	%g4,	0x10B0,	%i0
loop_1199:
	move	%xcc,	%o4,	%o2
	nop
	setx	0x187026F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC4F42111,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f30,	%f5
	array16	%o7,	%l0,	%o6
	fnot1	%f10,	%f28
	movcc	%icc,	%o5,	%l1
	ba	loop_1200
	sethi	0x19F9,	%g3
	tle	%icc,	0x2
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x2C] %asi,	%f4
loop_1200:
	tl	%icc,	0x1
	sllx	%g1,	%l6,	%i5
	stb	%g6,	[%l7 + 0x31]
	sethi	0x01F3,	%i2
	alignaddr	%g2,	%l4,	%i1
	nop
	fitos	%f29,	%f22
	udivcc	%o1,	0x0DFF,	%i3
	fors	%f27,	%f5,	%f27
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%i4
	sdivcc	%g7,	0x1C32,	%o3
	edge16l	%o0,	%l2,	%g5
	movne	%icc,	%i6,	%l5
	fbug,a	%fcc0,	loop_1201
	fbo	%fcc0,	loop_1202
	tsubcctv	%i7,	%g4,	%i0
	srl	%o2,	%o7,	%o4
loop_1201:
	fones	%f5
loop_1202:
	movrgz	%l0,	0x052,	%o6
	fnot1	%f4,	%f14
	nop
	setx	0x206869BD,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	set	0x68, %o5
	stha	%o5,	[%l7 + %o5] 0x22
	membar	#Sync
	te	%xcc,	0x4
	flush	%l7 + 0x78
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	for	%f12,	%f12,	%f2
	tvc	%icc,	0x2
	add	%l1,	%g3,	%l6
	movcs	%icc,	%g1,	%i5
	tn	%xcc,	0x4
	tpos	%xcc,	0x6
	umul	%i2,	0x179C,	%g6
	te	%xcc,	0x2
	mova	%icc,	%l4,	%i1
	tgu	%icc,	0x3
	edge8ln	%g2,	%o1,	%i3
	movleu	%icc,	%l3,	%g7
	subccc	%o3,	0x19B1,	%i4
	ldstub	[%l7 + 0x7C],	%l2
	edge16l	%o0,	%i6,	%l5
	call	loop_1203
	mulx	%i7,	0x0B53,	%g4
	fmovsg	%xcc,	%f19,	%f14
	andn	%i0,	0x077D,	%g5
loop_1203:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%o2,	%f22,	%f4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x15] %asi,	%o4
	xor	%l0,	%o6,	%o7
	add	%o5,	0x03AE,	%g3
	movne	%xcc,	%l6,	%g1
	nop
	setx	0x7EF91D7104656855,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f0
	sdiv	%l1,	0x06D6,	%i2
	movrlz	%i5,	%l4,	%g6
	mova	%icc,	%i1,	%o1
	fpmerge	%f13,	%f13,	%f8
	fbug,a	%fcc1,	loop_1204
	fbge,a	%fcc3,	loop_1205
	nop
	setx	0x2F5EBCBA9306181F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE72C2A2D47B67E0E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f12,	%f18
	movrlez	%i3,	%l3,	%g7
loop_1204:
	nop
	fitod	%f11,	%f22
loop_1205:
	edge16n	%g2,	%o3,	%l2
	sdiv	%i4,	0x17DF,	%o0
	movne	%icc,	%i6,	%l5
	sra	%i7,	0x0F,	%i0
	bshuffle	%f0,	%f22,	%f30
	fbn,a	%fcc1,	loop_1206
	ld	[%l7 + 0x20],	%f18
	andcc	%g5,	0x116C,	%o2
	tpos	%icc,	0x2
loop_1206:
	nop
	wr	%g0,	0x18,	%asi
	stwa	%o4,	[%l7 + 0x50] %asi
	movvc	%xcc,	%g4,	%o6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l0
	andn	%o7,	%o5,	%g3
	fcmpeq32	%f8,	%f14,	%g1
	fbe	%fcc0,	loop_1207
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l1,	%i2,	%i5
	taddcc	%l4,	%l6,	%i1
loop_1207:
	te	%xcc,	0x7
	ba	loop_1208
	fbule,a	%fcc0,	loop_1209
	fbg	%fcc3,	loop_1210
	nop
	fitos	%f3,	%f27
	fstox	%f27,	%f6
loop_1208:
	fmovsvc	%icc,	%f15,	%f31
loop_1209:
	xnorcc	%o1,	0x02D1,	%i3
loop_1210:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%l3
	fzero	%f12
	orcc	%g7,	0x014D,	%g2
	umul	%o3,	%g6,	%l2
	movcc	%icc,	%o0,	%i6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] %asi,	%l5,	%i7
	bcs,pt	%icc,	loop_1211
	array32	%i0,	%g5,	%o2
	fors	%f9,	%f0,	%f2
	movrgez	%o4,	%g4,	%i4
loop_1211:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x61] %asi,	%l0
	tneg	%xcc,	0x5
	ldx	[%l7 + 0x28],	%o6
	tpos	%xcc,	0x3
	prefetch	[%l7 + 0x44],	 0x0
	sll	%o5,	%o7,	%g3
	sdiv	%l1,	0x0275,	%g1
	fcmpeq32	%f12,	%f24,	%i5
	tsubcc	%l4,	%l6,	%i1
	edge32n	%o1,	%i2,	%i3
	set	0x4C, %l6
	stwa	%g7,	[%l7 + %l6] 0x19
	fmovrsgz	%l3,	%f27,	%f21
	fble,a	%fcc1,	loop_1212
	fnot2	%f18,	%f8
	orncc	%g2,	%o3,	%l2
	brgez,a	%g6,	loop_1213
loop_1212:
	edge32n	%o0,	%l5,	%i6
	fbue	%fcc2,	loop_1214
	fbo,a	%fcc0,	loop_1215
loop_1213:
	fornot2s	%f5,	%f18,	%f17
	fba,a	%fcc1,	loop_1216
loop_1214:
	fmovsl	%xcc,	%f1,	%f3
loop_1215:
	alignaddrl	%i0,	%i7,	%o2
	fcmpgt32	%f20,	%f18,	%o4
loop_1216:
	xorcc	%g4,	%i4,	%l0
	alignaddr	%g5,	%o6,	%o5
	nop
	setx	0x3AA1CCBBA81FA2EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f20
	fblg	%fcc2,	loop_1217
	tle	%icc,	0x3
	addccc	%g3,	0x0482,	%o7
	subc	%g1,	0x1C86,	%i5
loop_1217:
	tg	%xcc,	0x5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x3B] %asi,	%l4
	mulx	%l1,	0x0351,	%i1
	ldsb	[%l7 + 0x55],	%o1
	and	%l6,	%i3,	%g7
	xorcc	%l3,	%i2,	%o3
	sll	%g2,	0x01,	%l2
	fmovrsgez	%g6,	%f6,	%f22
	sll	%o0,	%l5,	%i0
	sdiv	%i6,	0x1BD8,	%o2
	sra	%o4,	0x13,	%g4
	sllx	%i4,	0x16,	%i7
	move	%icc,	%l0,	%o6
	sethi	0x1B63,	%g5
	fxor	%f20,	%f22,	%f26
	edge8	%o5,	%o7,	%g3
	movgu	%xcc,	%g1,	%l4
	nop
	fitos	%f10,	%f27
	fstoi	%f27,	%f17
	sethi	0x1D2B,	%i5
	fzero	%f4
	movl	%icc,	%i1,	%l1
	smulcc	%l6,	0x0114,	%o1
	brz	%g7,	loop_1218
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f26
	fmovse	%icc,	%f19,	%f17
	movre	%l3,	0x13C,	%i3
loop_1218:
	popc	%o3,	%i2
	edge32l	%l2,	%g2,	%g6
	tsubcctv	%o0,	0x199D,	%i0
	sllx	%i6,	0x06,	%l5
	membar	0x3C
	umul	%o2,	%g4,	%i4
	addcc	%o4,	0x0DC3,	%l0
	movpos	%xcc,	%i7,	%g5
	stw	%o6,	[%l7 + 0x60]
	fbug	%fcc1,	loop_1219
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o5,	%g3,	%o7
	fmovdpos	%icc,	%f26,	%f31
loop_1219:
	nop
	fitos	%f1,	%f5
	fstox	%f5,	%f22
	fxtos	%f22,	%f17
	orn	%g1,	0x0EBF,	%l4
	tneg	%xcc,	0x6
	st	%f26,	[%l7 + 0x40]
	bvs,a	loop_1220
	fornot2s	%f15,	%f8,	%f4
	movge	%xcc,	%i5,	%l1
	tgu	%xcc,	0x6
loop_1220:
	movvc	%icc,	%i1,	%o1
	tleu	%xcc,	0x7
	subc	%l6,	0x05F5,	%g7
	movle	%icc,	%i3,	%l3
	movle	%xcc,	%i2,	%o3
	smulcc	%l2,	%g2,	%o0
	fbg,a	%fcc2,	loop_1221
	array8	%i0,	%i6,	%l5
	subcc	%o2,	%g4,	%i4
	nop
	fitos	%f9,	%f26
	fstox	%f26,	%f30
loop_1221:
	nop
	set	0x46, %l1
	sth	%g6,	[%l7 + %l1]
	tsubcctv	%l0,	%o4,	%i7
	brz,a	%o6,	loop_1222
	be,a	loop_1223
	tsubcc	%o5,	%g5,	%g3
	bvc,a	%xcc,	loop_1224
loop_1222:
	nop
	setx loop_1225, %l0, %l1
	jmpl %l1, %o7
loop_1223:
	sethi	0x06A5,	%g1
	tgu	%icc,	0x2
loop_1224:
	call	loop_1226
loop_1225:
	alignaddrl	%l4,	%l1,	%i5
	move	%xcc,	%o1,	%i1
	and	%l6,	0x025D,	%g7
loop_1226:
	bcc,a	%xcc,	loop_1227
	ba,a,pt	%xcc,	loop_1228
	fpadd16	%f8,	%f12,	%f18
	udiv	%i3,	0x0F1A,	%i2
loop_1227:
	te	%xcc,	0x5
loop_1228:
	tleu	%xcc,	0x5
	tvc	%xcc,	0x5
	sllx	%o3,	0x16,	%l3
	fbug,a	%fcc0,	loop_1229
	udiv	%l2,	0x0EFC,	%o0
	nop
	set	0x10, %g3
	ldsh	[%l7 + %g3],	%g2
	stbar
loop_1229:
	edge32n	%i0,	%l5,	%i6
	and	%g4,	%i4,	%g6
	udivx	%o2,	0x1E3D,	%l0
	addccc	%i7,	0x0C24,	%o6
	edge32n	%o5,	%o4,	%g3
	sir	0x1E4F
	movg	%xcc,	%o7,	%g1
	tne	%icc,	0x3
	ldsb	[%l7 + 0x20],	%g5
	tpos	%icc,	0x0
	movgu	%icc,	%l4,	%l1
	fornot2s	%f19,	%f16,	%f5
	edge16l	%o1,	%i1,	%l6
	subc	%i5,	%g7,	%i3
	taddcc	%i2,	0x1866,	%o3
	fmovspos	%icc,	%f5,	%f16
	mulscc	%l2,	%o0,	%g2
	movne	%xcc,	%l3,	%l5
	movpos	%xcc,	%i0,	%i6
	fmovsa	%icc,	%f2,	%f28
	movle	%xcc,	%g4,	%g6
	nop
	fitod	%f12,	%f4
	fdtos	%f4,	%f4
	andncc	%o2,	%l0,	%i7
	lduh	[%l7 + 0x56],	%o6
	brgez,a	%o5,	loop_1230
	taddcc	%i4,	%o4,	%o7
	tle	%icc,	0x3
	wr	%g0,	0xea,	%asi
	stwa	%g1,	[%l7 + 0x48] %asi
	membar	#Sync
loop_1230:
	edge16	%g5,	%l4,	%l1
	mulx	%g3,	0x16CD,	%i1
	array32	%l6,	%i5,	%g7
	sdivx	%i3,	0x1E19,	%i2
	movvc	%xcc,	%o3,	%l2
	fble	%fcc1,	loop_1231
	move	%xcc,	%o1,	%o0
	move	%icc,	%l3,	%l5
	tg	%xcc,	0x7
loop_1231:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%g2,	%i6
	fbe,a	%fcc2,	loop_1232
	movrgz	%i0,	0x0DA,	%g4
	taddcc	%g6,	%o2,	%i7
	fmovdcc	%icc,	%f13,	%f10
loop_1232:
	movg	%icc,	%o6,	%l0
	edge16l	%o5,	%i4,	%o4
	fmovrdgez	%o7,	%f4,	%f10
	alignaddr	%g5,	%l4,	%l1
	mulscc	%g1,	%g3,	%l6
	sdivx	%i5,	0x0797,	%g7
	ldsw	[%l7 + 0x50],	%i1
	fandnot2	%f4,	%f4,	%f4
	move	%icc,	%i2,	%o3
	fbl	%fcc3,	loop_1233
	fmovdn	%xcc,	%f6,	%f13
	xor	%i3,	0x1169,	%l2
	fands	%f10,	%f27,	%f21
loop_1233:
	xorcc	%o0,	%l3,	%l5
	mulscc	%g2,	%o1,	%i6
	bleu,a,pn	%icc,	loop_1234
	tcs	%icc,	0x7
	edge16	%g4,	%g6,	%o2
	and	%i0,	0x0C12,	%o6
loop_1234:
	te	%icc,	0x0
	edge16	%l0,	%i7,	%i4
	movleu	%xcc,	%o4,	%o5
	bgu,a	loop_1235
	mulx	%o7,	%l4,	%l1
	brgz,a	%g5,	loop_1236
	edge16n	%g3,	%l6,	%i5
loop_1235:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
loop_1236:
	subc	%i1,	%g1,	%i2
	fcmple16	%f20,	%f4,	%o3
	sir	0x18BE
	edge16n	%l2,	%o0,	%l3
	fbug,a	%fcc3,	loop_1237
	fbule,a	%fcc2,	loop_1238
	sdivx	%l5,	0x1EF8,	%g2
	edge8l	%o1,	%i3,	%i6
loop_1237:
	fornot2	%f22,	%f2,	%f30
loop_1238:
	smulcc	%g6,	%o2,	%g4
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbn,a	%fcc3,	loop_1239
	smul	%o6,	%l0,	%i0
	sir	0x0EA2
	wr	%g0,	0x11,	%asi
	stba	%i4,	[%l7 + 0x58] %asi
loop_1239:
	lduw	[%l7 + 0x30],	%i7
	umulcc	%o4,	%o5,	%o7
	tleu	%xcc,	0x1
	nop
	setx loop_1240, %l0, %l1
	jmpl %l1, %l1
	movrgz	%g5,	%g3,	%l4
	subccc	%i5,	%l6,	%g7
	edge8	%g1,	%i1,	%o3
loop_1240:
	fbug,a	%fcc0,	loop_1241
	taddcctv	%l2,	%o0,	%i2
	fmovd	%f26,	%f20
	andn	%l3,	0x06D9,	%g2
loop_1241:
	fmovdcc	%icc,	%f23,	%f24
	andcc	%o1,	%l5,	%i3
	fnors	%f9,	%f23,	%f7
	movneg	%xcc,	%i6,	%g6
	addcc	%g4,	0x0FA1,	%o6
	fnors	%f28,	%f21,	%f22
	fmovdne	%xcc,	%f16,	%f14
	movgu	%icc,	%o2,	%l0
	edge16l	%i4,	%i7,	%i0
	array8	%o4,	%o7,	%o5
	movleu	%xcc,	%g5,	%l1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	andcc	%g3,	0x0165,	%l6
	bvc,pn	%xcc,	loop_1242
	andn	%i5,	%g1,	%i1
	move	%icc,	%g7,	%o3
	ldd	[%l7 + 0x20],	%f6
loop_1242:
	tn	%xcc,	0x0
	fmovspos	%icc,	%f15,	%f11
	movneg	%xcc,	%o0,	%i2
	edge32	%l3,	%g2,	%o1
	fbug,a	%fcc2,	loop_1243
	movl	%icc,	%l2,	%l5
	ldx	[%l7 + 0x20],	%i6
	andcc	%g6,	%g4,	%i3
loop_1243:
	mova	%xcc,	%o6,	%l0
	ble,pn	%icc,	loop_1244
	fmovsg	%xcc,	%f7,	%f16
	tge	%icc,	0x4
	ldub	[%l7 + 0x4B],	%i4
loop_1244:
	fmovrdlz	%o2,	%f18,	%f24
	alignaddrl	%i7,	%o4,	%i0
	stw	%o5,	[%l7 + 0x74]
	edge8	%g5,	%o7,	%l4
	sdivcc	%l1,	0x0055,	%l6
	movne	%icc,	%g3,	%g1
	popc	%i1,	%i5
	fmovrdgez	%g7,	%f12,	%f22
	te	%xcc,	0x4
	edge8ln	%o3,	%o0,	%l3
	tle	%icc,	0x2
	fbu,a	%fcc1,	loop_1245
	edge8l	%g2,	%i2,	%l2
	mulscc	%l5,	%i6,	%o1
	sll	%g4,	%g6,	%o6
loop_1245:
	movrgez	%l0,	0x329,	%i3
	fbe	%fcc3,	loop_1246
	edge16n	%i4,	%o2,	%o4
	set	0x12, %g1
	lduha	[%l7 + %g1] 0x0c,	%i7
loop_1246:
	sub	%i0,	0x1A3F,	%o5
	movge	%xcc,	%g5,	%l4
	udivx	%l1,	0x128F,	%l6
	edge8ln	%g3,	%o7,	%i1
	movrlez	%i5,	0x0EA,	%g7
	tsubcc	%o3,	0x1C8D,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o0,	%g2
	edge8	%l3,	%i2,	%l2
	tg	%xcc,	0x5
	stx	%l5,	[%l7 + 0x48]
	bcs,a,pn	%xcc,	loop_1247
	tcc	%xcc,	0x7
	xnorcc	%i6,	0x18CC,	%g4
	ta	%xcc,	0x7
loop_1247:
	edge8n	%o1,	%g6,	%o6
	movrlz	%l0,	0x0AA,	%i3
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	fbue,a	%fcc0,	loop_1248
	fmovsne	%xcc,	%f31,	%f0
	fornot1s	%f20,	%f14,	%f30
	sethi	0x109C,	%i4
loop_1248:
	fmuld8ulx16	%f14,	%f0,	%f26
	smul	%o4,	0x0C27,	%i7
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x15,	 0x2
	edge32ln	%g5,	%l4,	%o5
	fors	%f0,	%f10,	%f26
	brnz,a	%l1,	loop_1249
	edge16	%l6,	%g3,	%o7
	set	0x1A, %i5
	ldstuba	[%l7 + %i5] 0x81,	%i5
loop_1249:
	nop
	set	0x70, %i6
	ldda	[%l7 + %i6] 0x15,	%g6
	edge32	%i1,	%g1,	%o3
	addcc	%g2,	0x0DD9,	%l3
	bl	%xcc,	loop_1250
	movvc	%xcc,	%i2,	%o0
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1250:
	bg,a,pn	%icc,	loop_1251
	edge16n	%l2,	%l5,	%i6
	orcc	%o1,	0x184B,	%g4
	fpadd32	%f28,	%f0,	%f2
loop_1251:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x3E] %asi,	%g6
	edge8l	%l0,	%i3,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x5
	for	%f14,	%f28,	%f12
	mulx	%o2,	%i4,	%i7
	srl	%o4,	0x14,	%i0
	faligndata	%f18,	%f30,	%f6
	be,pn	%xcc,	loop_1252
	nop
	set	0x1D, %i7
	ldub	[%l7 + %i7],	%l4
	taddcc	%g5,	0x19C3,	%o5
	tge	%icc,	0x0
loop_1252:
	tcs	%icc,	0x2
	fornot1	%f30,	%f14,	%f12
	sdiv	%l1,	0x1004,	%l6
	tl	%icc,	0x7
	andn	%g3,	%i5,	%o7
	nop
	setx	0xC08D2A85,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xC47C8BD7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f5,	%f19
	edge8l	%g7,	%g1,	%o3
	sir	0x0747
	taddcc	%i1,	%l3,	%g2
	movge	%icc,	%i2,	%o0
	be,a,pn	%xcc,	loop_1253
	nop
	fitod	%f5,	%f26
	orncc	%l2,	%i6,	%o1
	movne	%icc,	%l5,	%g4
loop_1253:
	smul	%l0,	%g6,	%o6
	taddcctv	%o2,	%i3,	%i4
	smulcc	%i7,	0x0B56,	%o4
	addc	%l4,	%g5,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f24,	%f10,	%f18
	swap	[%l7 + 0x38],	%o5
	fmovdleu	%icc,	%f14,	%f16
	add	%l6,	0x0488,	%g3
	fpadd32s	%f13,	%f25,	%f10
	sub	%i5,	0x1015,	%o7
	fbuge	%fcc1,	loop_1254
	fmovsle	%xcc,	%f31,	%f10
	fmovscs	%xcc,	%f1,	%f31
	bge,a	%xcc,	loop_1255
loop_1254:
	stbar
	fmovscc	%xcc,	%f1,	%f5
	fnegd	%f28,	%f20
loop_1255:
	nop
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%g7
	movg	%xcc,	%g1,	%l1
	fornot1	%f2,	%f30,	%f18
	smulcc	%i1,	%o3,	%g2
	xorcc	%l3,	0x1068,	%o0
	ldstub	[%l7 + 0x71],	%i2
	edge32l	%l2,	%o1,	%l5
	xnor	%g4,	%i6,	%g6
	ldsw	[%l7 + 0x50],	%l0
	movg	%icc,	%o2,	%i3
	fmovrdne	%i4,	%f12,	%f12
	tn	%icc,	0x5
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x1f
	membar	#Sync
	fbu,a	%fcc3,	loop_1256
	fbu	%fcc1,	loop_1257
	movre	%i7,	0x0B3,	%o4
	fmovscs	%icc,	%f2,	%f1
loop_1256:
	sdiv	%o6,	0x1A4F,	%g5
loop_1257:
	edge8l	%i0,	%o5,	%l6
	nop
	set	0x10, %g7
	stx	%g3,	[%l7 + %g7]
	fbug	%fcc0,	loop_1258
	sllx	%l4,	%i5,	%g7
	tne	%icc,	0x0
	fmovdleu	%icc,	%f23,	%f25
loop_1258:
	edge8n	%g1,	%o7,	%i1
	movne	%xcc,	%o3,	%l1
	bn,a	%xcc,	loop_1259
	fmovrdlez	%g2,	%f10,	%f26
	bleu,pn	%xcc,	loop_1260
	nop
	fitos	%f2,	%f11
	fstox	%f11,	%f26
	fxtos	%f26,	%f17
loop_1259:
	movne	%icc,	%l3,	%o0
	edge32n	%l2,	%o1,	%l5
loop_1260:
	movne	%xcc,	%i2,	%i6
	fone	%f26
	srlx	%g6,	0x10,	%g4
	sdiv	%o2,	0x1976,	%l0
	tg	%icc,	0x6
	sdiv	%i3,	0x18F8,	%i4
	taddcc	%i7,	0x029E,	%o4
	tsubcctv	%g5,	%i0,	%o5
	sir	0x0AA6
	nop
	setx	0xF62DF0C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f26
	fmovsleu	%xcc,	%f2,	%f31
	tsubcctv	%o6,	%g3,	%l6
	fmovdgu	%icc,	%f13,	%f5
	fxnor	%f24,	%f6,	%f24
	array32	%i5,	%l4,	%g1
	add	%o7,	%i1,	%g7
	tge	%xcc,	0x6
	movneg	%icc,	%o3,	%g2
	edge32l	%l1,	%l3,	%l2
	tpos	%icc,	0x5
	fmovsn	%icc,	%f31,	%f15
	tl	%xcc,	0x1
	set	0x5A, %i0
	ldsha	[%l7 + %i0] 0x80,	%o0
	ld	[%l7 + 0x2C],	%f20
	sir	0x1424
	xnorcc	%o1,	0x1D5D,	%i2
	movn	%icc,	%i6,	%g6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%l5
	mulscc	%o2,	0x0892,	%l0
	sllx	%i3,	0x19,	%i4
	alignaddrl	%g4,	%o4,	%g5
	edge32n	%i0,	%o5,	%i7
	edge8ln	%o6,	%g3,	%i5
	fmovrdlez	%l4,	%f12,	%f24
	edge8l	%g1,	%l6,	%o7
	edge32n	%i1,	%o3,	%g2
	udivcc	%l1,	0x1299,	%g7
	tle	%icc,	0x4
	set	0x58, %g5
	stxa	%l2,	[%l7 + %g5] 0x15
	movge	%xcc,	%o0,	%l3
	fcmple16	%f16,	%f12,	%o1
	stx	%i6,	[%l7 + 0x30]
	srlx	%g6,	0x1E,	%i2
	fxors	%f19,	%f9,	%f5
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f6
	srl	%o2,	0x05,	%l0
	srlx	%i3,	%i4,	%g4
	fmovs	%f5,	%f1
	movrne	%l5,	0x19B,	%g5
	tn	%xcc,	0x6
	edge16l	%i0,	%o5,	%i7
	edge16	%o4,	%g3,	%i5
	wr	%g0,	0x88,	%asi
	stxa	%l4,	[%l7 + 0x68] %asi
	orcc	%o6,	%l6,	%g1
	fblg	%fcc1,	loop_1261
	edge8n	%o7,	%i1,	%g2
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l1
loop_1261:
	tsubcctv	%o3,	%l2,	%g7
	add	%o0,	0x12A7,	%o1
	movrlz	%l3,	0x166,	%i6
	edge16	%i2,	%o2,	%l0
	udiv	%g6,	0x118A,	%i3
	tcc	%icc,	0x0
	addccc	%i4,	%l5,	%g4
	call	loop_1262
	orncc	%g5,	0x1720,	%o5
	addc	%i0,	%i7,	%g3
	st	%f0,	[%l7 + 0x24]
loop_1262:
	membar	0x3D
	nop
	setx	0xC375130B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x7218EA39,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f0,	%f25
	array16	%o4,	%i5,	%l4
	nop
	setx	0x6CB60664,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f25
	andn	%o6,	0x123B,	%g1
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	nop
	setx	0xCD312994407AB651,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	bgu	%xcc,	loop_1263
	orn	%i1,	%l6,	%g2
	fbo	%fcc2,	loop_1264
	add	%l1,	%l2,	%g7
loop_1263:
	fbge,a	%fcc0,	loop_1265
	sethi	0x1E45,	%o0
loop_1264:
	orncc	%o1,	%o3,	%i6
	udivcc	%l3,	0x05FD,	%o2
loop_1265:
	xnor	%l0,	0x10FF,	%i2
	movrlez	%g6,	%i3,	%i4
	subcc	%l5,	0x1514,	%g5
	tneg	%xcc,	0x1
	array8	%g4,	%i0,	%i7
	andcc	%o5,	0x00A6,	%g3
	fmovrsne	%o4,	%f15,	%f26
	fbne	%fcc3,	loop_1266
	subc	%l4,	0x11A8,	%o6
	udivcc	%i5,	0x1B81,	%g1
	edge8ln	%i1,	%o7,	%g2
loop_1266:
	umulcc	%l1,	%l2,	%g7
	alignaddr	%o0,	%l6,	%o1
	sllx	%o3,	%l3,	%o2
	movleu	%icc,	%i6,	%l0
	subccc	%i2,	0x11F5,	%i3
	fbo	%fcc0,	loop_1267
	xnorcc	%g6,	0x14D7,	%i4
	sll	%l5,	0x03,	%g4
	fbg	%fcc3,	loop_1268
loop_1267:
	addccc	%i0,	%g5,	%o5
	fmul8x16	%f9,	%f30,	%f10
	nop
	setx	0xE99FA552,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xEFC66414,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f6,	%f4
loop_1268:
	movrlez	%g3,	%i7,	%o4
	movrgez	%l4,	%i5,	%g1
	srl	%i1,	0x1F,	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o7,	%l1
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x54] %asi,	%g2
	addcc	%l2,	%g7,	%l6
	edge8ln	%o1,	%o0,	%o3
	ldsb	[%l7 + 0x68],	%o2
	subccc	%i6,	%l0,	%l3
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x6A] %asi,	%i3
	edge32ln	%i2,	%i4,	%g6
	andcc	%l5,	0x01DE,	%g4
	ldd	[%l7 + 0x48],	%i0
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f0
	tle	%icc,	0x1
	mulx	%o5,	0x0AF3,	%g5
	fnor	%f28,	%f24,	%f28
	fnands	%f21,	%f31,	%f4
	movrgz	%g3,	%i7,	%l4
	fmovdgu	%icc,	%f23,	%f17
	srax	%i5,	0x0C,	%g1
	fmovsvc	%xcc,	%f1,	%f14
	ta	%xcc,	0x2
	nop
	setx	0x5828E214204024D8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	orncc	%o4,	0x00D8,	%i1
	xnorcc	%o6,	0x1C60,	%l1
	fmovsvs	%xcc,	%f31,	%f10
	edge32	%g2,	%l2,	%g7
	movrgz	%o7,	0x1C9,	%o1
	addcc	%o0,	0x0BC2,	%l6
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x14,	%o2
	xnor	%i6,	0x1D78,	%o3
	ble,a,pn	%xcc,	loop_1269
	tg	%xcc,	0x2
	add	%l0,	0x1453,	%i3
	edge32	%l3,	%i2,	%g6
loop_1269:
	bne,a,pn	%icc,	loop_1270
	fnors	%f30,	%f17,	%f25
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%l5
loop_1270:
	edge32n	%g4,	%i4,	%o5
	ldd	[%l7 + 0x68],	%f2
	sub	%i0,	%g3,	%i7
	sra	%g5,	0x0A,	%l4
	brlz	%g1,	loop_1271
	movcs	%xcc,	%i5,	%i1
	add	%o6,	%o4,	%l1
	tsubcc	%l2,	0x0731,	%g7
loop_1271:
	movrlez	%g2,	0x325,	%o1
	tsubcc	%o0,	%l6,	%o2
	tcc	%xcc,	0x7
	sub	%i6,	%o7,	%l0
	set	0x0D, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i3
	edge32	%l3,	%o3,	%g6
	mulscc	%l5,	0x02E2,	%i2
	stw	%g4,	[%l7 + 0x5C]
	tg	%icc,	0x1
	srlx	%i4,	0x18,	%i0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x58] %asi,	%g3
	xorcc	%o5,	0x0CC0,	%g5
	movrne	%i7,	%g1,	%i5
	fnot1s	%f28,	%f7
	sub	%l4,	0x1AE8,	%i1
	sth	%o4,	[%l7 + 0x7E]
	addccc	%o6,	0x0F87,	%l1
	nop
	setx	loop_1272,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fblg	%fcc1,	loop_1273
	for	%f12,	%f22,	%f30
	fbne,a	%fcc2,	loop_1274
loop_1272:
	fornot1	%f4,	%f10,	%f12
loop_1273:
	tl	%xcc,	0x7
	ldd	[%l7 + 0x18],	%f28
loop_1274:
	fble	%fcc3,	loop_1275
	tcc	%xcc,	0x7
	andcc	%l2,	0x03F8,	%g7
	edge16	%o1,	%g2,	%l6
loop_1275:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o2,	%o0,	%i6
	fbule,a	%fcc3,	loop_1276
	fcmpeq16	%f30,	%f6,	%o7
	movcs	%icc,	%i3,	%l0
	fble,a	%fcc0,	loop_1277
loop_1276:
	umulcc	%o3,	%l3,	%g6
	tl	%xcc,	0x3
	edge32n	%i2,	%l5,	%i4
loop_1277:
	bneg,a,pn	%xcc,	loop_1278
	fpmerge	%f26,	%f0,	%f12
	xnor	%i0,	0x1AAF,	%g4
	smulcc	%o5,	%g5,	%i7
loop_1278:
	edge32	%g1,	%g3,	%i5
	subcc	%i1,	0x0804,	%l4
	bge,pt	%xcc,	loop_1279
	srl	%o4,	0x08,	%o6
	alignaddr	%l2,	%l1,	%g7
	bg	loop_1280
loop_1279:
	fmovrslz	%g2,	%f7,	%f29
	nop
	setx	0x629BF95FE0533A57,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tleu	%icc,	0x4
loop_1280:
	fandnot2s	%f0,	%f28,	%f10
	subc	%l6,	%o2,	%o1
	movrlz	%o0,	%o7,	%i6
	for	%f8,	%f14,	%f8
	sir	0x15A1
	tsubcctv	%i3,	0x0389,	%o3
	srlx	%l3,	0x09,	%l0
	fmovda	%icc,	%f15,	%f14
	bpos,a	loop_1281
	addccc	%i2,	0x01EE,	%l5
	sub	%g6,	%i4,	%g4
	movrlez	%i0,	%g5,	%i7
loop_1281:
	orcc	%o5,	%g1,	%g3
	array32	%i1,	%l4,	%i5
	udivcc	%o4,	0x0693,	%l2
	movrlez	%o6,	%l1,	%g7
	fpsub16s	%f18,	%f24,	%f29
	movvs	%icc,	%l6,	%o2
	nop
	setx	0x111F80688B8CF037,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0DDA8ED858736F94,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f14,	%f14
	fmul8sux16	%f10,	%f16,	%f30
	brgz	%o1,	loop_1282
	sdivx	%g2,	0x0625,	%o0
	nop
	set	0x70, %i2
	lduh	[%l7 + %i2],	%i6
	movrne	%i3,	%o7,	%o3
loop_1282:
	bl,pn	%icc,	loop_1283
	xnorcc	%l3,	%l0,	%i2
	taddcctv	%l5,	0x14B2,	%i4
	move	%xcc,	%g4,	%i0
loop_1283:
	addc	%g6,	0x0279,	%i7
	udivx	%g5,	0x06A8,	%g1
	ldub	[%l7 + 0x1F],	%o5
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	set	0x4F, %o3
	stba	%g3,	[%l7 + %o3] 0x2a
	membar	#Sync
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x40] %asi,	%i5
	tcc	%xcc,	0x0
	srlx	%o4,	%l2,	%o6
	tsubcc	%l1,	0x0D45,	%g7
	movl	%xcc,	%l4,	%l6
	edge16n	%o1,	%o2,	%g2
	edge8n	%o0,	%i3,	%i6
	srlx	%o3,	0x15,	%o7
	bleu,a,pt	%icc,	loop_1284
	nop
	setx	0x9637DF616AAAE7E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF26E1D3ACDE61D70,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f0,	%f22
	be	%icc,	loop_1285
	fbu,a	%fcc2,	loop_1286
loop_1284:
	andcc	%l3,	0x184C,	%i2
	andcc	%l0,	0x1B1E,	%l5
loop_1285:
	fzero	%f16
loop_1286:
	fbo	%fcc2,	loop_1287
	xnorcc	%i4,	%g4,	%g6
	movle	%xcc,	%i7,	%i0
	movrne	%g1,	0x3F4,	%g5
loop_1287:
	edge16ln	%i1,	%g3,	%o5
	edge8l	%o4,	%l2,	%o6
	te	%xcc,	0x3
	fornot1	%f18,	%f26,	%f18
	bgu,pt	%icc,	loop_1288
	movrlez	%l1,	0x29E,	%i5
	tpos	%xcc,	0x5
	fones	%f28
loop_1288:
	xnorcc	%l4,	0x0820,	%l6
	or	%g7,	0x1585,	%o2
	movrne	%o1,	0x2CD,	%o0
	orcc	%g2,	0x121D,	%i6
	udivcc	%o3,	0x1C75,	%o7
	orncc	%l3,	%i3,	%l0
	movrgz	%i2,	0x10F,	%i4
	fmovrslz	%l5,	%f9,	%f27
	alignaddrl	%g6,	%g4,	%i0
	sub	%i7,	0x1033,	%g5
	sub	%g1,	0x0485,	%g3
	movl	%icc,	%o5,	%o4
	move	%xcc,	%i1,	%o6
	udiv	%l1,	0x1431,	%l2
	udivx	%i5,	0x1770,	%l4
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	addc	%o2,	0x0BB8,	%g7
	fxors	%f8,	%f29,	%f31
	tge	%icc,	0x0
	tl	%icc,	0x5
	fpadd32	%f14,	%f0,	%f12
	tpos	%xcc,	0x0
	nop
	fitos	%f13,	%f2
	fstox	%f2,	%f10
	brgz	%o1,	loop_1289
	edge16n	%g2,	%o0,	%o3
	fcmpne32	%f12,	%f12,	%o7
	edge8ln	%l3,	%i3,	%l0
loop_1289:
	edge32ln	%i2,	%i6,	%l5
	ldsw	[%l7 + 0x40],	%i4
	sth	%g4,	[%l7 + 0x78]
	umulcc	%g6,	%i0,	%g5
	fmovd	%f10,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x5
	edge16	%i7,	%g1,	%o5
	tne	%icc,	0x3
	srl	%o4,	%i1,	%g3
	nop
	fitos	%f20,	%f21
	fbne,a	%fcc1,	loop_1290
	bneg,a	%icc,	loop_1291
	nop
	set	0x64, %l5
	ldsw	[%l7 + %l5],	%o6
	taddcctv	%l1,	%i5,	%l2
loop_1290:
	tvc	%xcc,	0x1
loop_1291:
	for	%f16,	%f0,	%f14
	movne	%xcc,	%l4,	%l6
	tl	%icc,	0x5
	fnot2s	%f3,	%f8
	ta	%xcc,	0x6
	move	%xcc,	%g7,	%o1
	sll	%g2,	%o2,	%o3
	tvs	%xcc,	0x4
	fmovdcs	%icc,	%f7,	%f29
	fnand	%f20,	%f6,	%f12
	tl	%xcc,	0x7
	set	0x3E, %l2
	lduba	[%l7 + %l2] 0x14,	%o0
	fones	%f25
	nop
	fitos	%f2,	%f11
	fstod	%f11,	%f8
	ba,pt	%xcc,	loop_1292
	sdiv	%l3,	0x1210,	%i3
	mulscc	%o7,	0x0FE3,	%l0
	fcmpgt32	%f12,	%f16,	%i2
loop_1292:
	udiv	%i6,	0x1023,	%i4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x6D] %asi,	%g4
	fsrc1s	%f10,	%f7
	te	%icc,	0x4
	fbl	%fcc2,	loop_1293
	fsrc2s	%f1,	%f10
	fmovrse	%l5,	%f29,	%f18
	fbug,a	%fcc2,	loop_1294
loop_1293:
	fone	%f6
	orncc	%i0,	%g5,	%g6
	fmovrde	%g1,	%f0,	%f4
loop_1294:
	membar	0x69
	alignaddr	%i7,	%o5,	%i1
	nop
	fitos	%f6,	%f23
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tn	%xcc,	0x6
	smulcc	%g3,	0x1C82,	%o6
	bne,pn	%xcc,	loop_1295
	nop
	setx	0xEF602F82B340EF5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f18
	xor	%l1,	%o4,	%i5
	sdivx	%l4,	0x0C1D,	%l2
loop_1295:
	movvs	%icc,	%g7,	%l6
	wr	%g0,	0x18,	%asi
	sta	%f21,	[%l7 + 0x2C] %asi
	set	0x5C, %o0
	sta	%f13,	[%l7 + %o0] 0x15
	tne	%xcc,	0x3
	nop
	fitod	%f10,	%f28
	fdtoi	%f28,	%f25
	fbg	%fcc2,	loop_1296
	array8	%g2,	%o1,	%o2
	alignaddr	%o0,	%l3,	%i3
	fmovrslez	%o7,	%f4,	%f9
loop_1296:
	tle	%xcc,	0x1
	tge	%xcc,	0x1
	alignaddrl	%o3,	%i2,	%i6
	taddcc	%i4,	%g4,	%l5
	tcs	%icc,	0x0
	movrlez	%l0,	0x011,	%i0
	fcmple16	%f12,	%f2,	%g6
	sub	%g1,	0x0C93,	%g5
	edge16n	%i7,	%o5,	%i1
	umul	%o6,	0x0342,	%g3
	tg	%icc,	0x5
	taddcctv	%o4,	%l1,	%i5
	membar	0x76
	udiv	%l2,	0x0644,	%g7
	fmovrdne	%l4,	%f28,	%f14
	movl	%icc,	%g2,	%l6
	fnand	%f22,	%f0,	%f18
	move	%xcc,	%o1,	%o0
	nop
	setx	0x3B7E7A752E796F93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xDF7479A273C8CED8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f18,	%f22
	subcc	%l3,	0x171B,	%o2
	edge16	%o7,	%i3,	%i2
	edge16ln	%i6,	%o3,	%i4
	fmovsge	%xcc,	%f7,	%f27
	orn	%g4,	%l0,	%l5
	fbu,a	%fcc1,	loop_1297
	tge	%xcc,	0x7
	set	0x7C, %g2
	stwa	%g6,	[%l7 + %g2] 0x11
loop_1297:
	andn	%g1,	%i0,	%g5
	fmovrsne	%i7,	%f4,	%f10
	fmovsvc	%xcc,	%f20,	%f11
	array16	%o5,	%o6,	%g3
	te	%icc,	0x3
	umulcc	%o4,	0x149C,	%l1
	addcc	%i5,	%i1,	%l2
	bg,pn	%icc,	loop_1298
	movre	%g7,	0x25F,	%g2
	orn	%l4,	%l6,	%o0
	tneg	%icc,	0x5
loop_1298:
	srlx	%l3,	0x02,	%o1
	movrlez	%o2,	%i3,	%i2
	bcc,pt	%xcc,	loop_1299
	flush	%l7 + 0x54
	movrgez	%o7,	%i6,	%i4
	stbar
loop_1299:
	andncc	%g4,	%l0,	%o3
	alignaddr	%l5,	%g1,	%g6
	set	0x30, %i1
	sta	%f31,	[%l7 + %i1] 0x80
	taddcctv	%i0,	%i7,	%o5
	xor	%g5,	0x0864,	%g3
	ba,pt	%xcc,	loop_1300
	movn	%xcc,	%o6,	%l1
	bge,a	%icc,	loop_1301
	fxor	%f20,	%f6,	%f8
loop_1300:
	fmovrdgez	%i5,	%f20,	%f18
	srlx	%i1,	%l2,	%g7
loop_1301:
	nop
	set	0x70, %o7
	swapa	[%l7 + %o7] 0x80,	%g2
	tvs	%xcc,	0x3
	mulx	%o4,	0x0E30,	%l6
	or	%l4,	%l3,	%o0
	fpmerge	%f26,	%f11,	%f16
	tle	%xcc,	0x0
	bcs,a	%xcc,	loop_1302
	edge16l	%o1,	%i3,	%o2
	fmovsa	%xcc,	%f18,	%f21
	fmovdvc	%icc,	%f5,	%f2
loop_1302:
	movrgz	%o7,	0x126,	%i6
	tn	%icc,	0x6
	lduh	[%l7 + 0x1C],	%i4
	alignaddrl	%g4,	%l0,	%o3
	tg	%xcc,	0x1
	xor	%i2,	0x06BB,	%l5
	fnor	%f22,	%f4,	%f12
	bn,a	%icc,	loop_1303
	edge16l	%g6,	%i0,	%i7
	set	0x52, %l3
	lduha	[%l7 + %l3] 0x80,	%o5
loop_1303:
	ba,a,pn	%icc,	loop_1304
	subcc	%g1,	%g3,	%g5
	nop
	setx	loop_1305,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsvc	%icc,	%f21,	%f15
loop_1304:
	movre	%l1,	%o6,	%i1
	andn	%l2,	0x08CF,	%i5
loop_1305:
	movpos	%xcc,	%g7,	%o4
	fbue	%fcc0,	loop_1306
	fmovsn	%icc,	%f2,	%f2
	array16	%l6,	%l4,	%l3
	andncc	%g2,	%o0,	%o1
loop_1306:
	array8	%i3,	%o2,	%i6
	fpsub32	%f10,	%f30,	%f14
	edge16	%i4,	%o7,	%g4
	fmovse	%icc,	%f0,	%f9
	umul	%o3,	%l0,	%i2
	array8	%g6,	%i0,	%l5
	xnorcc	%i7,	%g1,	%o5
	orcc	%g3,	0x081D,	%g5
	fpsub16s	%f24,	%f17,	%f16
	movl	%icc,	%o6,	%l1
	udivcc	%i1,	0x1CF1,	%l2
	tle	%icc,	0x0
	fblg,a	%fcc1,	loop_1307
	tne	%xcc,	0x3
	sth	%g7,	[%l7 + 0x72]
	or	%i5,	%o4,	%l4
loop_1307:
	edge16	%l3,	%g2,	%l6
	fpadd16	%f20,	%f22,	%f20
	set	0x50, %o1
	ldxa	[%l7 + %o1] 0x0c,	%o1
	udivx	%o0,	0x0008,	%o2
	fbu	%fcc3,	loop_1308
	tg	%xcc,	0x7
	edge32ln	%i6,	%i3,	%i4
	sub	%g4,	%o7,	%o3
loop_1308:
	fornot1	%f2,	%f6,	%f14
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f10
	fpadd32	%f12,	%f8,	%f20
	tpos	%icc,	0x1
	xorcc	%i2,	%g6,	%i0
	nop
	fitod	%f8,	%f4
	fdtos	%f4,	%f21
	tn	%xcc,	0x2
	fmovdneg	%icc,	%f19,	%f3
	set	0x68, %o4
	ldswa	[%l7 + %o4] 0x19,	%l0
	movgu	%icc,	%i7,	%g1
	tg	%icc,	0x0
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o5
	fmovsgu	%icc,	%f2,	%f15
	fcmpgt16	%f16,	%f10,	%g3
	ble,a	%xcc,	loop_1309
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f10
	fxtod	%f10,	%f24
	ldstub	[%l7 + 0x4E],	%l5
	nop
	fitod	%f27,	%f30
loop_1309:
	edge16n	%o6,	%l1,	%g5
	fbne	%fcc0,	loop_1310
	tne	%xcc,	0x5
	nop
	set	0x24, %g4
	lduh	[%l7 + %g4],	%i1
	mulscc	%g7,	%i5,	%l2
loop_1310:
	and	%o4,	%l4,	%l3
	ta	%icc,	0x0
	brnz,a	%l6,	loop_1311
	brz,a	%g2,	loop_1312
	fpadd16s	%f14,	%f24,	%f18
	popc	0x0B44,	%o0
loop_1311:
	alignaddr	%o1,	%i6,	%i3
loop_1312:
	subcc	%i4,	0x0AAB,	%o2
	tpos	%xcc,	0x5
	subc	%g4,	0x0973,	%o7
	orn	%i2,	%o3,	%g6
	edge32ln	%i0,	%l0,	%g1
	edge32	%o5,	%i7,	%l5
	fmovscc	%icc,	%f17,	%f8
	subc	%o6,	%l1,	%g3
	set	0x3F, %l4
	stba	%g5,	[%l7 + %l4] 0x80
	movrgez	%g7,	0x20F,	%i5
	subcc	%i1,	0x1DC7,	%l2
	tpos	%xcc,	0x1
	fmovrdne	%l4,	%f28,	%f6
	srax	%o4,	%l3,	%g2
	tsubcctv	%o0,	0x06B3,	%o1
	udiv	%l6,	0x099B,	%i6
	sir	0x1EC8
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x0c,	%i2
	movrlz	%o2,	%i4,	%o7
	tg	%xcc,	0x7
	xor	%i2,	%g4,	%g6
	edge32ln	%i0,	%l0,	%o3
	movcs	%icc,	%g1,	%o5
	xnorcc	%l5,	0x0DED,	%o6
	udiv	%l1,	0x11D6,	%g3
	fornot2	%f30,	%f8,	%f10
	sllx	%g5,	%i7,	%i5
	fornot1	%f4,	%f30,	%f4
	fmovrdlez	%g7,	%f14,	%f26
	xnor	%l2,	0x1EED,	%i1
	udivx	%l4,	0x0695,	%l3
	taddcc	%o4,	%o0,	%o1
	smulcc	%g2,	%i6,	%i3
	movpos	%xcc,	%o2,	%i4
	xnorcc	%o7,	0x112E,	%l6
	tvc	%icc,	0x1
	fone	%f16
	sethi	0x1727,	%i2
	nop
	setx	0x67259463038AC3C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xB6BB66EE5289EDD8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f0,	%f2
	tsubcc	%g4,	%i0,	%l0
	movg	%xcc,	%g6,	%o3
	fnor	%f26,	%f16,	%f14
	fornot1s	%f20,	%f29,	%f17
	tn	%icc,	0x7
	movle	%icc,	%g1,	%l5
	movrgz	%o6,	%l1,	%o5
	tge	%xcc,	0x3
	sra	%g3,	%g5,	%i5
	tpos	%xcc,	0x0
	sethi	0x1348,	%g7
	movrlz	%i7,	%l2,	%l4
	movleu	%xcc,	%l3,	%i1
	orncc	%o4,	%o0,	%g2
	movne	%xcc,	%o1,	%i6
	bvc	loop_1313
	orcc	%i3,	%i4,	%o7
	for	%f22,	%f22,	%f0
	fones	%f31
loop_1313:
	fandnot2s	%f29,	%f31,	%f17
	fmovdcc	%icc,	%f24,	%f17
	addcc	%l6,	0x17D9,	%o2
	movleu	%icc,	%i2,	%g4
	lduw	[%l7 + 0x78],	%l0
	edge8ln	%i0,	%g6,	%g1
	alignaddr	%o3,	%o6,	%l1
	fbue	%fcc3,	loop_1314
	umul	%l5,	%o5,	%g5
	xorcc	%i5,	0x0639,	%g7
	nop
	setx	0x65AECB39DC8ABD0A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x437742498F9CF93C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f24,	%f22
loop_1314:
	edge32l	%i7,	%g3,	%l4
	movne	%xcc,	%l3,	%l2
	movrlez	%i1,	%o4,	%o0
	mova	%xcc,	%o1,	%g2
	sra	%i3,	%i6,	%o7
	fands	%f28,	%f22,	%f8
	fnot1s	%f23,	%f10
	fmovrdgez	%i4,	%f16,	%f8
	sdivcc	%o2,	0x034F,	%l6
	lduw	[%l7 + 0x0C],	%g4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i0
	edge8l	%l0,	%g6,	%g1
	tvc	%icc,	0x2
	subc	%o3,	0x1D5E,	%l1
	fmovde	%xcc,	%f24,	%f4
	fblg,a	%fcc0,	loop_1315
	tle	%icc,	0x6
	tl	%xcc,	0x2
	smulcc	%o6,	0x008A,	%o5
loop_1315:
	fmovrslez	%l5,	%f23,	%f5
	fmovrde	%g5,	%f16,	%f24
	xor	%g7,	0x15BB,	%i5
	addc	%g3,	%i7,	%l3
	fpsub32s	%f19,	%f7,	%f4
	fmovde	%icc,	%f10,	%f14
	fornot2	%f26,	%f18,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l4,	%i1,	%l2
	movcc	%icc,	%o0,	%o4
	edge8ln	%o1,	%g2,	%i3
	umulcc	%o7,	0x085F,	%i6
	fmovsleu	%icc,	%f26,	%f0
	tne	%icc,	0x1
	nop
	setx	loop_1316,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnand	%f10,	%f18,	%f22
	fones	%f18
	fmovrslz	%i4,	%f7,	%f7
loop_1316:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x6C] %asi,	%f21
	wr	%g0,	0x0c,	%asi
	stxa	%o2,	[%l7 + 0x30] %asi
	nop
	fitos	%f0,	%f29
	fstod	%f29,	%f30
	tcc	%icc,	0x4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l6
	tneg	%icc,	0x0
	tvs	%icc,	0x7
	wr	%g0,	0xeb,	%asi
	stha	%i2,	[%l7 + 0x50] %asi
	membar	#Sync
	orcc	%i0,	%g4,	%l0
	edge32l	%g6,	%g1,	%l1
	edge32l	%o6,	%o3,	%o5
	movrgz	%l5,	%g7,	%i5
	umulcc	%g5,	0x0EE9,	%g3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%i7
	subcc	%l4,	%i1,	%l2
	fpsub32	%f24,	%f10,	%f6
	tpos	%xcc,	0x3
	sub	%o0,	0x0392,	%o4
	fcmple16	%f14,	%f0,	%l3
	edge8	%o1,	%i3,	%g2
	be,a,pn	%xcc,	loop_1317
	fmovdcs	%xcc,	%f25,	%f7
	fbue	%fcc0,	loop_1318
	fmovsvc	%icc,	%f22,	%f29
loop_1317:
	movne	%xcc,	%o7,	%i6
	sir	0x144B
loop_1318:
	fnegs	%f21,	%f26
	movrlez	%o2,	0x2AA,	%l6
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x64] %asi,	%i4
	bneg,a,pn	%icc,	loop_1319
	fmovdg	%icc,	%f11,	%f28
	nop
	setx	0xEBFD3AD6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xFCCFA48B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f28,	%f24
	edge32l	%i0,	%i2,	%g4
loop_1319:
	nop
	set	0x60, %l0
	prefetcha	[%l7 + %l0] 0x04,	 0x1
	tge	%xcc,	0x4
	fbe,a	%fcc3,	loop_1320
	srl	%g1,	%g6,	%o6
	array32	%o3,	%o5,	%l5
	subc	%g7,	%i5,	%g5
loop_1320:
	tl	%icc,	0x3
	array16	%g3,	%i7,	%l1
	andncc	%l4,	%i1,	%o0
	tcc	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x13] %asi,	%l2
	tsubcc	%l3,	%o1,	%i3
	fxnor	%f16,	%f6,	%f22
	set	0x09, %l6
	ldstuba	[%l7 + %l6] 0x04,	%o4
	srl	%o7,	0x06,	%g2
	fands	%f21,	%f9,	%f25
	movpos	%xcc,	%i6,	%o2
	movne	%icc,	%i4,	%l6
	nop
	setx	0x4B464A84087B0BC5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x836A56B7DFEDB809,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f16,	%f24
	sir	0x07F8
	fmovrdgez	%i0,	%f26,	%f2
	fbu,a	%fcc1,	loop_1321
	tcs	%xcc,	0x0
	fmovsg	%xcc,	%f24,	%f0
	nop
	setx	0x81D65726,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xCFB29886,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f13,	%f6
loop_1321:
	prefetch	[%l7 + 0x4C],	 0x3
	fmovdg	%xcc,	%f13,	%f5
	movcc	%icc,	%g4,	%l0
	fmovdcc	%xcc,	%f3,	%f1
	andcc	%i2,	%g6,	%g1
	srl	%o3,	%o5,	%o6
	andcc	%l5,	%g7,	%i5
	fbul	%fcc3,	loop_1322
	nop
	set	0x40, %l1
	ldsh	[%l7 + %l1],	%g3
	tsubcc	%g5,	%i7,	%l1
	wr	%g0,	0x04,	%asi
	stxa	%l4,	[%l7 + 0x18] %asi
loop_1322:
	ldstub	[%l7 + 0x57],	%i1
	movrlz	%l2,	%o0,	%o1
	sub	%l3,	%i3,	%o4
	smulcc	%o7,	0x1EAF,	%i6
	sdivcc	%o2,	0x19FE,	%g2
	fabsd	%f0,	%f20
	fmovrdgz	%i4,	%f0,	%f14
	movg	%icc,	%l6,	%i0
	fmovrsgz	%l0,	%f25,	%f10
	fandnot1s	%f31,	%f1,	%f24
	set	0x0, %g3
	stxa	%i2,	[%g0 + %g3] 0x5f
	smul	%g4,	%g1,	%o3
	nop
	fitod	%f21,	%f0
	fcmpeq16	%f16,	%f10,	%o5
	movrlez	%o6,	0x3D9,	%l5
	sdivx	%g6,	0x0AF4,	%i5
	tg	%icc,	0x6
	fnors	%f20,	%f29,	%f16
	fsrc1	%f28,	%f6
	xnor	%g3,	%g5,	%i7
	movvc	%xcc,	%l1,	%l4
	bne	loop_1323
	fone	%f0
	fmovsneg	%xcc,	%f21,	%f27
	tsubcc	%i1,	%g7,	%o0
loop_1323:
	fmovsn	%icc,	%f3,	%f1
	srlx	%o1,	%l2,	%i3
	tne	%xcc,	0x2
	movrgz	%o4,	0x242,	%l3
	sra	%i6,	%o7,	%g2
	movrgz	%o2,	%l6,	%i0
	st	%f25,	[%l7 + 0x50]
	xnor	%l0,	%i2,	%i4
	fmovrsgz	%g4,	%f30,	%f24
	fmul8x16	%f9,	%f20,	%f12
	sub	%o3,	%g1,	%o6
	fbge	%fcc2,	loop_1324
	tpos	%xcc,	0x4
	array16	%l5,	%o5,	%i5
	nop
	setx	0xF04629ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
loop_1324:
	tsubcctv	%g3,	%g6,	%g5
	fbg,a	%fcc3,	loop_1325
	nop
	set	0x18, %g1
	prefetch	[%l7 + %g1],	 0x0
	tn	%icc,	0x6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l1,	%i7
loop_1325:
	nop
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x89,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x58] %asi,	%l4
	swap	[%l7 + 0x68],	%i1
	udiv	%g7,	0x0D20,	%o1
	tcc	%icc,	0x0
	sdiv	%o0,	0x18CB,	%l2
	nop
	fitod	%f6,	%f2
	fdtos	%f2,	%f6
	alignaddr	%i3,	%l3,	%i6
	tvc	%icc,	0x3
	movn	%icc,	%o4,	%g2
	movg	%icc,	%o2,	%l6
	fmovsle	%xcc,	%f26,	%f7
	alignaddr	%i0,	%o7,	%l0
	tn	%icc,	0x2
	fmovdgu	%icc,	%f11,	%f30
	udivx	%i4,	0x0F93,	%g4
	edge32n	%o3,	%g1,	%i2
	xor	%o6,	%o5,	%l5
	fbug,a	%fcc2,	loop_1326
	mulx	%g3,	0x0224,	%g6
	bge,pt	%xcc,	loop_1327
	udivx	%i5,	0x071A,	%l1
loop_1326:
	edge32l	%i7,	%g5,	%l4
	array8	%i1,	%o1,	%o0
loop_1327:
	move	%xcc,	%l2,	%i3
	nop
	setx	loop_1328,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%xcc,	0x3
	flush	%l7 + 0x5C
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x0F] %asi,	%l3
loop_1328:
	tsubcc	%g7,	0x0E35,	%i6
	umulcc	%o4,	0x08EE,	%g2
	wr	%g0,	0x81,	%asi
	stwa	%l6,	[%l7 + 0x08] %asi
	edge32	%i0,	%o7,	%o2
	fmovrsgez	%i4,	%f21,	%f11
	edge8l	%l0,	%g4,	%g1
	addccc	%o3,	0x0833,	%i2
	udivx	%o6,	0x0AC3,	%o5
	movle	%icc,	%l5,	%g6
	set	0x30, %o5
	ldda	[%l7 + %o5] 0x88,	%i4
	wr	%g0,	0x19,	%asi
	stwa	%g3,	[%l7 + 0x34] %asi
	stx	%i7,	[%l7 + 0x20]
	movcs	%icc,	%l1,	%l4
	movn	%icc,	%i1,	%g5
	te	%xcc,	0x4
	fbu,a	%fcc0,	loop_1329
	movvc	%icc,	%o1,	%o0
	movn	%xcc,	%i3,	%l2
	tn	%xcc,	0x5
loop_1329:
	movvs	%xcc,	%l3,	%i6
	ldd	[%l7 + 0x10],	%o4
	nop
	setx	0x749AC406,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xFFC4E62B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f24,	%f23
	smul	%g7,	%l6,	%i0
	fbu,a	%fcc0,	loop_1330
	movn	%icc,	%o7,	%g2
	edge8	%i4,	%l0,	%o2
	edge16n	%g1,	%o3,	%g4
loop_1330:
	alignaddr	%o6,	%o5,	%l5
	movgu	%xcc,	%g6,	%i2
	movg	%xcc,	%i5,	%g3
	set	0x2D, %i5
	lduba	[%l7 + %i5] 0x80,	%i7
	sra	%l4,	0x09,	%l1
	st	%f16,	[%l7 + 0x58]
	fnot1	%f16,	%f30
	addcc	%i1,	%o1,	%g5
	orn	%i3,	0x18C3,	%l2
	taddcctv	%l3,	0x148F,	%o0
	membar	0x4B
	fbne,a	%fcc1,	loop_1331
	sethi	0x1103,	%o4
	tvs	%icc,	0x5
	udivx	%g7,	0x1975,	%i6
loop_1331:
	edge8ln	%l6,	%i0,	%o7
	sdivcc	%g2,	0x1DFC,	%l0
	umul	%o2,	%g1,	%o3
	fpadd16	%f20,	%f8,	%f18
	fmovdleu	%xcc,	%f0,	%f15
	ldx	[%l7 + 0x40],	%g4
	fmovrdlez	%i4,	%f12,	%f24
	addccc	%o6,	%o5,	%l5
	bl,pn	%icc,	loop_1332
	and	%g6,	0x128B,	%i5
	mulx	%g3,	0x09BF,	%i7
	edge8ln	%i2,	%l1,	%l4
loop_1332:
	bvs,pt	%icc,	loop_1333
	taddcc	%i1,	0x14C3,	%o1
	tl	%xcc,	0x2
	nop
	setx	loop_1334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1333:
	fpsub32s	%f29,	%f5,	%f27
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g5
loop_1334:
	andncc	%l2,	%i3,	%o0
	movrne	%o4,	%l3,	%i6
	fbul,a	%fcc2,	loop_1335
	edge32ln	%l6,	%i0,	%g7
	fbu,a	%fcc1,	loop_1336
	movl	%xcc,	%g2,	%o7
loop_1335:
	fmuld8sux16	%f4,	%f25,	%f18
	fpadd16s	%f18,	%f0,	%f11
loop_1336:
	bl,a	%icc,	loop_1337
	subcc	%l0,	%o2,	%o3
	array16	%g1,	%g4,	%i4
	brgz,a	%o6,	loop_1338
loop_1337:
	movvc	%xcc,	%o5,	%l5
	movg	%icc,	%i5,	%g3
	tcc	%xcc,	0x2
loop_1338:
	addc	%i7,	%g6,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l4,	0x0909,	%i2
	stb	%o1,	[%l7 + 0x5A]
	fmovsge	%icc,	%f1,	%f17
	ldd	[%l7 + 0x28],	%f18
	movvc	%icc,	%g5,	%l2
	subc	%i1,	%o0,	%o4
	set	0x70, %i7
	lda	[%l7 + %i7] 0x19,	%f8
	movrlez	%i3,	%l3,	%l6
	fbu	%fcc0,	loop_1339
	fcmpeq32	%f12,	%f24,	%i6
	udivcc	%i0,	0x1900,	%g7
	fmovrdgz	%g2,	%f4,	%f22
loop_1339:
	tgu	%icc,	0x3
	call	loop_1340
	ldstub	[%l7 + 0x16],	%o7
	fpadd16s	%f17,	%f1,	%f2
	fmovdgu	%icc,	%f28,	%f21
loop_1340:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a	loop_1341
	movcc	%xcc,	%o2,	%l0
	tcc	%icc,	0x7
	fmul8x16au	%f30,	%f30,	%f2
loop_1341:
	sll	%g1,	%o3,	%g4
	nop
	setx	loop_1342,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%xcc,	0x2
	umulcc	%o6,	%i4,	%o5
	fcmple16	%f4,	%f6,	%i5
loop_1342:
	movcs	%xcc,	%l5,	%g3
	taddcc	%g6,	0x1FDA,	%i7
	sir	0x1C35
	ta	%xcc,	0x2
	fbge,a	%fcc1,	loop_1343
	movneg	%xcc,	%l1,	%l4
	fsrc1s	%f9,	%f17
	taddcc	%o1,	0x1D7D,	%i2
loop_1343:
	edge8n	%g5,	%l2,	%o0
	ldsh	[%l7 + 0x5C],	%i1
	swap	[%l7 + 0x68],	%i3
	fmovdne	%icc,	%f10,	%f10
	edge8n	%o4,	%l6,	%i6
	fbe	%fcc0,	loop_1344
	fmovdpos	%xcc,	%f20,	%f12
	flush	%l7 + 0x64
	addccc	%i0,	0x1D80,	%g7
loop_1344:
	fbn,a	%fcc2,	loop_1345
	tneg	%xcc,	0x7
	xorcc	%g2,	0x0014,	%o7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x64] %asi,	%f25
loop_1345:
	fmovsle	%xcc,	%f16,	%f1
	taddcctv	%o2,	%l3,	%g1
	edge8l	%l0,	%g4,	%o3
	fbul,a	%fcc1,	loop_1346
	fmovrsne	%i4,	%f6,	%f8
	bpos,a	%icc,	loop_1347
	udivcc	%o5,	0x00EE,	%o6
loop_1346:
	ldd	[%l7 + 0x68],	%l4
	orncc	%i5,	0x06A5,	%g6
loop_1347:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x18] %asi,	%g3
	fandnot1	%f28,	%f14,	%f12
	edge32	%l1,	%i7,	%l4
	tge	%icc,	0x0
	fsrc1	%f2,	%f22
	array32	%o1,	%g5,	%i2
	tcs	%icc,	0x7
	orncc	%o0,	%i1,	%i3
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0xf0
	membar	#Sync
	udivx	%o4,	0x106F,	%l2
	fmovrse	%i6,	%f26,	%f25
	movn	%xcc,	%i0,	%g7
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	std	%f8,	[%l7 + 0x78]
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x78] %asi,	%l6
	set	0x2C, %i6
	lduba	[%l7 + %i6] 0x04,	%o7
	movle	%xcc,	%o2,	%g1
	array8	%l0,	%g4,	%l3
	umulcc	%i4,	0x12C0,	%o5
	orn	%o6,	%o3,	%l5
	fmovda	%icc,	%f28,	%f14
	ldsb	[%l7 + 0x5D],	%i5
	or	%g6,	%g3,	%l1
	bneg,a,pn	%icc,	loop_1348
	fmovdne	%xcc,	%f18,	%f27
	ta	%xcc,	0x4
	fbge	%fcc1,	loop_1349
loop_1348:
	fbul	%fcc3,	loop_1350
	movne	%icc,	%i7,	%o1
	edge16	%g5,	%l4,	%i2
loop_1349:
	nop
	set	0x18, %g7
	stxa	%o0,	[%l7 + %g7] 0xea
	membar	#Sync
loop_1350:
	brgz	%i3,	loop_1351
	srlx	%i1,	%o4,	%i6
	taddcctv	%i0,	0x15BB,	%l2
	sethi	0x0B2C,	%g7
loop_1351:
	fcmpne16	%f18,	%f12,	%g2
	nop
	setx	0x4ECB81B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x13D40F76,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f4,	%f4
	std	%f26,	[%l7 + 0x70]
	fbl	%fcc2,	loop_1352
	bleu	loop_1353
	movge	%xcc,	%o7,	%l6
	fbe,a	%fcc3,	loop_1354
loop_1352:
	nop
	setx	0x0A482EC5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x3CF6F99D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f23,	%f12
loop_1353:
	ba,a	loop_1355
	fones	%f15
loop_1354:
	movne	%xcc,	%g1,	%o2
	movne	%icc,	%g4,	%l3
loop_1355:
	movcs	%icc,	%i4,	%l0
	movvc	%icc,	%o5,	%o6
	fcmpne16	%f18,	%f6,	%l5
	edge16	%i5,	%o3,	%g3
	fbo,a	%fcc1,	loop_1356
	nop
	fitos	%f4,	%f20
	fstod	%f20,	%f20
	tn	%xcc,	0x5
	fmovdcs	%icc,	%f16,	%f6
loop_1356:
	bgu,a	loop_1357
	brz	%g6,	loop_1358
	or	%l1,	%i7,	%g5
	fmovsne	%icc,	%f12,	%f21
loop_1357:
	alignaddr	%o1,	%l4,	%i2
loop_1358:
	movpos	%icc,	%o0,	%i1
	fbn,a	%fcc3,	loop_1359
	fba,a	%fcc2,	loop_1360
	for	%f24,	%f2,	%f2
	movle	%icc,	%o4,	%i6
loop_1359:
	movle	%icc,	%i3,	%l2
loop_1360:
	movvs	%xcc,	%i0,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,pn	%xcc,	loop_1361
	taddcc	%o7,	%g2,	%l6
	array8	%g1,	%o2,	%l3
	fornot2s	%f1,	%f23,	%f17
loop_1361:
	alignaddrl	%g4,	%l0,	%o5
	fbl	%fcc2,	loop_1362
	andn	%o6,	%i4,	%i5
	bpos,a,pn	%xcc,	loop_1363
	nop
	setx	loop_1364,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1362:
	fnot1s	%f22,	%f13
	movle	%xcc,	%l5,	%g3
loop_1363:
	brlez,a	%o3,	loop_1365
loop_1364:
	edge32l	%g6,	%l1,	%i7
	sethi	0x0E15,	%o1
	umul	%g5,	0x0670,	%i2
loop_1365:
	and	%l4,	%i1,	%o4
	membar	0x45
	brlz	%i6,	loop_1366
	edge8ln	%o0,	%l2,	%i3
	sll	%i0,	0x0C,	%o7
	nop
	setx	0x552340077BAA9B0A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xDE7A5EB1BB8B12BB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f8,	%f26
loop_1366:
	sllx	%g7,	%g2,	%g1
	fbne	%fcc0,	loop_1367
	taddcc	%o2,	0x1EBE,	%l3
	tsubcc	%g4,	0x0A93,	%l0
	mulscc	%o5,	0x13CE,	%l6
loop_1367:
	sll	%i4,	%i5,	%l5
	bleu,pt	%xcc,	loop_1368
	fxnor	%f30,	%f6,	%f0
	bl	%xcc,	loop_1369
	array32	%g3,	%o6,	%o3
loop_1368:
	fzeros	%f24
	nop
	set	0x10, %g5
	lduw	[%l7 + %g5],	%l1
loop_1369:
	fmovsle	%icc,	%f27,	%f7
	tgu	%xcc,	0x5
	fpmerge	%f3,	%f29,	%f8
	nop
	setx	loop_1370,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%i7,	%o1,	%g5
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x70] %asi,	%i2
loop_1370:
	andcc	%g6,	%l4,	%i1
	sdivcc	%i6,	0x18FA,	%o0
	movcc	%xcc,	%o4,	%l2
	brz,a	%i0,	loop_1371
	sub	%o7,	0x0161,	%g7
	movrne	%i3,	%g1,	%o2
	call	loop_1372
loop_1371:
	bshuffle	%f4,	%f6,	%f12
	prefetch	[%l7 + 0x78],	 0x0
	tn	%icc,	0x6
loop_1372:
	sth	%g2,	[%l7 + 0x0A]
	or	%l3,	%g4,	%l0
	brz,a	%o5,	loop_1373
	array32	%i4,	%l6,	%l5
	set	0x40, %i0
	lduha	[%l7 + %i0] 0x0c,	%g3
loop_1373:
	nop
	setx	0xE5F6007A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xADD39E6A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f0,	%f8
	bne	loop_1374
	tgu	%icc,	0x0
	nop
	setx	loop_1375,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovse	%icc,	%f10,	%f23
loop_1374:
	movleu	%xcc,	%o6,	%i5
	sethi	0x0BDD,	%l1
loop_1375:
	udiv	%i7,	0x1871,	%o3
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%o1
	mulx	%g5,	%g6,	%l4
	fnegd	%f18,	%f14
	sth	%i2,	[%l7 + 0x28]
	orcc	%i6,	0x1C22,	%i1
	tvs	%icc,	0x1
	movge	%xcc,	%o4,	%l2
	edge16n	%o0,	%i0,	%g7
	fmovdpos	%icc,	%f13,	%f12
	fpadd32	%f26,	%f18,	%f26
	fmovsl	%icc,	%f29,	%f17
	fbuge	%fcc3,	loop_1376
	fornot1s	%f7,	%f9,	%f13
	fmul8x16al	%f31,	%f9,	%f12
	ldsw	[%l7 + 0x28],	%o7
loop_1376:
	edge8n	%g1,	%o2,	%g2
	movrlz	%i3,	%l3,	%g4
	umul	%o5,	0x0D4E,	%i4
	fmovdcs	%icc,	%f17,	%f3
	tge	%xcc,	0x6
	fpackfix	%f8,	%f31
	movre	%l0,	%l5,	%l6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x0c
	tn	%icc,	0x0
	xnorcc	%g3,	%o6,	%i5
	taddcctv	%l1,	%o3,	%o1
	sra	%i7,	%g6,	%l4
	bn	%icc,	loop_1377
	tge	%xcc,	0x3
	tn	%xcc,	0x2
	fmovdl	%icc,	%f6,	%f15
loop_1377:
	movvs	%icc,	%g5,	%i6
	xorcc	%i1,	0x0D28,	%o4
	array8	%l2,	%o0,	%i2
	array8	%g7,	%i0,	%g1
	srlx	%o2,	%o7,	%i3
	taddcc	%g2,	0x1F09,	%g4
	ldx	[%l7 + 0x10],	%o5
	te	%xcc,	0x5
	subccc	%l3,	0x06A9,	%i4
	bgu,pt	%xcc,	loop_1378
	sra	%l0,	%l5,	%g3
	brlez,a	%o6,	loop_1379
	nop
	set	0x28, %i2
	std	%f2,	[%l7 + %i2]
loop_1378:
	alignaddrl	%l6,	%l1,	%o3
	fmovrsgz	%i5,	%f24,	%f19
loop_1379:
	fmul8x16au	%f14,	%f10,	%f20
	bg,pt	%icc,	loop_1380
	bl,pn	%icc,	loop_1381
	fors	%f31,	%f0,	%f10
	membar	0x45
loop_1380:
	edge8n	%i7,	%g6,	%l4
loop_1381:
	edge32l	%g5,	%o1,	%i1
	movrlz	%o4,	%l2,	%o0
	bge,a	%icc,	loop_1382
	movn	%icc,	%i6,	%g7
	orn	%i2,	0x109F,	%g1
	membar	0x0F
loop_1382:
	xnor	%i0,	0x0D1F,	%o7
	stw	%o2,	[%l7 + 0x78]
	bg	%icc,	loop_1383
	bcc,a	loop_1384
	edge16l	%g2,	%g4,	%o5
	fmul8x16au	%f31,	%f5,	%f4
loop_1383:
	umul	%i3,	0x11A2,	%l3
loop_1384:
	nop
	wr	%g0,	0xeb,	%asi
	stha	%l0,	[%l7 + 0x16] %asi
	membar	#Sync
	bvs,pn	%icc,	loop_1385
	tg	%icc,	0x4
	brlz	%l5,	loop_1386
	tsubcc	%g3,	%i4,	%l6
loop_1385:
	movpos	%xcc,	%o6,	%l1
	lduw	[%l7 + 0x18],	%o3
loop_1386:
	andcc	%i5,	%i7,	%g6
	tn	%xcc,	0x4
	bcs,a,pt	%icc,	loop_1387
	movg	%icc,	%g5,	%l4
	nop
	setx	loop_1388,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%o1,	0x1A7C,	%i1
loop_1387:
	prefetch	[%l7 + 0x2C],	 0x3
	xorcc	%l2,	0x0CEE,	%o0
loop_1388:
	nop
	set	0x4A, %i3
	ldsh	[%l7 + %i3],	%i6
	tcs	%icc,	0x4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%i2
	fmovdle	%icc,	%f13,	%f7
	st	%f17,	[%l7 + 0x40]
	bgu,a,pt	%xcc,	loop_1389
	xnorcc	%g1,	%g7,	%i0
	edge16ln	%o2,	%g2,	%g4
	tne	%xcc,	0x2
loop_1389:
	edge32	%o5,	%i3,	%l3
	array32	%o7,	%l0,	%l5
	and	%g3,	0x1857,	%i4
	movle	%icc,	%o6,	%l1
	addcc	%o3,	%i5,	%i7
	tcs	%xcc,	0x1
	sll	%l6,	%g6,	%l4
	edge8	%g5,	%i1,	%l2
	fexpand	%f8,	%f10
	membar	0x75
	tle	%xcc,	0x7
	fnegs	%f17,	%f23
	bvs,a	loop_1390
	orcc	%o0,	%i6,	%o4
	brnz,a	%i2,	loop_1391
	fmovspos	%icc,	%f7,	%f24
loop_1390:
	tsubcctv	%o1,	%g7,	%i0
	srl	%g1,	0x1E,	%o2
loop_1391:
	sll	%g2,	0x17,	%g4
	sdivcc	%i3,	0x173B,	%o5
	mova	%icc,	%l3,	%o7
	set	0x67, %l5
	lduba	[%l7 + %l5] 0x0c,	%l5
	prefetch	[%l7 + 0x50],	 0x2
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fbue	%fcc3,	loop_1392
	fpsub32	%f22,	%f30,	%f8
	fmovrdlz	%g3,	%f2,	%f22
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x5E] %asi,	%i4
loop_1392:
	fpadd32s	%f30,	%f5,	%f3
	tvc	%icc,	0x6
	ldsw	[%l7 + 0x3C],	%l0
	fmovdcs	%xcc,	%f5,	%f11
	nop
	fitos	%f14,	%f0
	fstox	%f0,	%f2
	movl	%xcc,	%l1,	%o6
	edge8n	%o3,	%i7,	%i5
	edge32l	%g6,	%l4,	%g5
	ldsb	[%l7 + 0x30],	%l6
	tvs	%xcc,	0x4
	bcc,a,pt	%icc,	loop_1393
	sethi	0x069A,	%i1
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f30
	sdiv	%l2,	0x12CF,	%i6
loop_1393:
	tleu	%xcc,	0x6
	edge32n	%o0,	%o4,	%i2
	tgu	%icc,	0x6
	brlez,a	%o1,	loop_1394
	movn	%icc,	%g7,	%g1
	srax	%o2,	0x11,	%i0
	edge32	%g4,	%i3,	%g2
loop_1394:
	fmovrsgz	%o5,	%f24,	%f9
	fmovrslez	%o7,	%f6,	%f6
	addccc	%l5,	0x1F35,	%l3
	srl	%i4,	%g3,	%l1
	fpackfix	%f28,	%f8
	fmovscs	%icc,	%f6,	%f23
	mova	%icc,	%l0,	%o3
	andn	%i7,	%o6,	%i5
	bg,a,pt	%xcc,	loop_1395
	edge16n	%g6,	%g5,	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] %asi,	%l4,	%i1
loop_1395:
	bneg	%xcc,	loop_1396
	stx	%l2,	[%l7 + 0x70]
	taddcctv	%i6,	0x00CD,	%o0
	fblg	%fcc1,	loop_1397
loop_1396:
	xnorcc	%o4,	0x1334,	%i2
	fxnors	%f5,	%f31,	%f19
	tsubcc	%o1,	0x0A78,	%g7
loop_1397:
	movg	%icc,	%o2,	%g1
	popc	0x1DB1,	%g4
	alignaddrl	%i0,	%i3,	%o5
	fbue	%fcc2,	loop_1398
	fmovd	%f12,	%f12
	fmovscs	%icc,	%f14,	%f6
	tgu	%icc,	0x5
loop_1398:
	sdiv	%g2,	0x1EEE,	%l5
	movpos	%icc,	%l3,	%i4
	fmovsvs	%icc,	%f13,	%f26
	ldd	[%l7 + 0x20],	%o6
	fmovsgu	%xcc,	%f14,	%f0
	tleu	%icc,	0x6
	orn	%l1,	%l0,	%o3
	tgu	%xcc,	0x2
	movcs	%xcc,	%i7,	%g3
	ldd	[%l7 + 0x68],	%f14
	popc	%o6,	%i5
	ba,a,pt	%icc,	loop_1399
	subc	%g5,	%l6,	%l4
	fpsub16s	%f26,	%f17,	%f6
	popc	%i1,	%l2
loop_1399:
	move	%xcc,	%g6,	%o0
	te	%icc,	0x6
	tleu	%icc,	0x5
	fbne,a	%fcc0,	loop_1400
	fmovsge	%icc,	%f0,	%f23
	nop
	fitos	%f1,	%f9
	fstox	%f9,	%f18
	fxtos	%f18,	%f29
	fpadd16s	%f4,	%f17,	%f10
loop_1400:
	udivx	%o4,	0x0A3B,	%i6
	sdivcc	%i2,	0x0382,	%g7
	movre	%o1,	%g1,	%g4
	addcc	%i0,	0x0609,	%i3
	fnand	%f0,	%f30,	%f8
	tne	%icc,	0x1
	movvs	%icc,	%o2,	%o5
	fxors	%f2,	%f5,	%f19
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x28] %asi,	%g2
	movrgez	%l5,	%l3,	%i4
	tg	%icc,	0x2
	tgu	%xcc,	0x5
	srl	%l1,	%l0,	%o3
	tneg	%icc,	0x2
	movle	%icc,	%i7,	%o7
	subccc	%o6,	%i5,	%g3
	set	0x30, %o3
	prefetcha	[%l7 + %o3] 0x81,	 0x2
	fors	%f9,	%f14,	%f18
	edge8	%l4,	%g5,	%i1
	srax	%g6,	0x16,	%o0
	tcs	%icc,	0x3
	sethi	0x1007,	%l2
	edge16n	%i6,	%i2,	%o4
	fmovdvs	%xcc,	%f22,	%f30
	bne,pn	%xcc,	loop_1401
	fmovdleu	%icc,	%f4,	%f3
	ldstub	[%l7 + 0x2D],	%g7
	call	loop_1402
loop_1401:
	array32	%o1,	%g4,	%g1
	sdivcc	%i0,	0x112B,	%o2
	tpos	%xcc,	0x2
loop_1402:
	addc	%o5,	%g2,	%l5
	srlx	%l3,	%i4,	%i3
	stbar
	edge32l	%l0,	%l1,	%i7
	tvc	%icc,	0x4
	edge16l	%o3,	%o6,	%i5
	edge16n	%g3,	%o7,	%l6
	fnot1s	%f21,	%f17
	tl	%xcc,	0x1
	movcs	%icc,	%g5,	%l4
	fmovdn	%xcc,	%f14,	%f1
	sub	%g6,	0x05D5,	%o0
	bl,a,pn	%icc,	loop_1403
	fors	%f9,	%f21,	%f7
	movrgez	%l2,	%i1,	%i6
	fxor	%f10,	%f26,	%f18
loop_1403:
	orncc	%i2,	%g7,	%o4
	std	%f12,	[%l7 + 0x68]
	tg	%icc,	0x6
	ldsh	[%l7 + 0x0A],	%g4
	fmovdg	%xcc,	%f6,	%f14
	tvc	%xcc,	0x1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g1,	%o1
	fnands	%f8,	%f17,	%f26
	fandnot1s	%f31,	%f19,	%f17
	movrgz	%o2,	0x2AB,	%i0
	fpsub32s	%f0,	%f12,	%f4
	fmovsn	%xcc,	%f18,	%f6
	sdiv	%o5,	0x1591,	%l5
	set	0x0A, %l2
	stha	%l3,	[%l7 + %l2] 0x15
	nop
	setx	0x2F3B3304B06F6F12,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movl	%xcc,	%g2,	%i3
	taddcc	%i4,	0x0017,	%l0
	fbule,a	%fcc1,	loop_1404
	movre	%l1,	0x373,	%o3
	ldsh	[%l7 + 0x7E],	%o6
	sll	%i7,	%i5,	%g3
loop_1404:
	addcc	%o7,	%l6,	%g5
	taddcctv	%l4,	%g6,	%l2
	fmovdvc	%icc,	%f13,	%f11
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x68] %asi,	%o0
	tvc	%xcc,	0x7
	taddcctv	%i1,	%i2,	%g7
	fandnot1s	%f28,	%f23,	%f11
	nop
	setx	loop_1405,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%i6,	%o4,	%g1
	nop
	setx	0xAD865E781B05F6BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xDFA755A7F913284E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f6,	%f6
	mova	%icc,	%g4,	%o2
loop_1405:
	fmovrslez	%i0,	%f21,	%f31
	tvc	%icc,	0x1
	srlx	%o1,	%o5,	%l3
	fnegs	%f5,	%f2
	fmovsl	%xcc,	%f27,	%f18
	tcc	%icc,	0x4
	fbne	%fcc3,	loop_1406
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f3,	%f22,	%f30
	xnorcc	%l5,	0x1348,	%g2
loop_1406:
	mova	%icc,	%i3,	%i4
	tn	%icc,	0x5
	sethi	0x1688,	%l1
	xorcc	%l0,	0x06F1,	%o6
	addcc	%i7,	%o3,	%i5
	te	%xcc,	0x3
	udivx	%g3,	0x0051,	%l6
	fmovs	%f3,	%f19
	ldsw	[%l7 + 0x40],	%g5
	brnz,a	%o7,	loop_1407
	tl	%icc,	0x3
	sdivcc	%g6,	0x0264,	%l2
	fmovsvc	%xcc,	%f13,	%f29
loop_1407:
	fmovdg	%xcc,	%f21,	%f26
	set	0x5C, %o0
	ldsha	[%l7 + %o0] 0x19,	%o0
	tl	%icc,	0x7
	movcs	%icc,	%l4,	%i1
	fbug,a	%fcc1,	loop_1408
	array8	%i2,	%g7,	%i6
	ble	loop_1409
	ta	%icc,	0x0
loop_1408:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x0A] %asi,	%o4
loop_1409:
	smul	%g1,	%g4,	%o2
	fcmpne16	%f6,	%f4,	%o1
	ldstub	[%l7 + 0x0C],	%o5
	edge8ln	%l3,	%l5,	%g2
	nop
	fitod	%f0,	%f14
	umulcc	%i3,	0x011D,	%i0
	sll	%i4,	%l1,	%l0
	movvc	%xcc,	%o6,	%i7
	fbne	%fcc1,	loop_1410
	taddcc	%o3,	%i5,	%g3
	nop
	fitod	%f12,	%f24
	fdtox	%f24,	%f22
	xnorcc	%l6,	%g5,	%g6
loop_1410:
	fbn,a	%fcc3,	loop_1411
	fnor	%f22,	%f26,	%f10
	taddcctv	%l2,	%o7,	%o0
	udivcc	%l4,	0x0294,	%i1
loop_1411:
	movrlz	%i2,	%i6,	%g7
	fexpand	%f22,	%f26
	movle	%icc,	%o4,	%g1
	taddcctv	%o2,	%o1,	%g4
	orn	%l3,	0x0BEF,	%o5
	edge32	%g2,	%l5,	%i0
	or	%i3,	0x129B,	%l1
	movn	%xcc,	%i4,	%o6
	nop
	fitos	%f3,	%f6
	fstod	%f6,	%f30
	movrgz	%l0,	0x113,	%i7
	nop
	setx	0x50564D93,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	bvs,a	loop_1412
	fmovsn	%xcc,	%f0,	%f16
	edge8n	%o3,	%i5,	%g3
	tle	%icc,	0x1
loop_1412:
	srax	%g5,	%l6,	%g6
	fmovse	%icc,	%f19,	%f23
	fornot1	%f14,	%f20,	%f16
	add	%l2,	%o7,	%l4
	edge32ln	%i1,	%i2,	%o0
	fmul8ulx16	%f20,	%f8,	%f6
	fcmpne32	%f10,	%f18,	%i6
	taddcctv	%g7,	0x0F19,	%g1
	fble	%fcc1,	loop_1413
	movn	%xcc,	%o2,	%o1
	tcs	%xcc,	0x5
	alignaddr	%g4,	%l3,	%o5
loop_1413:
	nop
	setx	0xC5AC7AA5E8B7521C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x874B8E418060A90D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f2,	%f20
	tsubcc	%g2,	0x1DF6,	%l5
	tleu	%icc,	0x0
	membar	0x00
	movrgez	%o4,	0x246,	%i3
	movn	%icc,	%l1,	%i0
	taddcctv	%i4,	%o6,	%l0
	movrgez	%i7,	0x2DF,	%o3
	movvc	%xcc,	%i5,	%g3
	alignaddr	%l6,	%g6,	%g5
	and	%o7,	0x0139,	%l4
	tne	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	flush	%l7 + 0x54
	set	0x58, %g2
	lda	[%l7 + %g2] 0x14,	%f27
	nop
	fitos	%f6,	%f1
	fstox	%f1,	%f16
	fandnot2s	%f2,	%f31,	%f28
	edge16	%i1,	%i2,	%l2
	fxnors	%f6,	%f0,	%f27
	movleu	%xcc,	%o0,	%g7
	movrne	%g1,	0x3D4,	%i6
	tg	%icc,	0x4
	fmovrslez	%o2,	%f0,	%f8
	tgu	%xcc,	0x4
	movre	%g4,	0x3A1,	%o1
	sdivx	%o5,	0x05A5,	%l3
	set	0x18, %o7
	ldxa	[%g0 + %o7] 0x50,	%l5
	sll	%g2,	%i3,	%o4
	te	%xcc,	0x3
	edge16l	%i0,	%i4,	%o6
	andcc	%l0,	%i7,	%o3
	alignaddrl	%l1,	%i5,	%l6
	orncc	%g3,	0x1EA3,	%g5
	udiv	%o7,	0x070D,	%l4
	orcc	%g6,	0x12BA,	%i2
	sll	%l2,	0x17,	%i1
	fmovsgu	%xcc,	%f12,	%f4
	fandnot1s	%f25,	%f19,	%f25
	fxors	%f16,	%f26,	%f20
	fmovsneg	%icc,	%f27,	%f19
	umulcc	%o0,	%g1,	%i6
	stbar
	stw	%o2,	[%l7 + 0x60]
	edge32l	%g7,	%g4,	%o5
	movrlez	%o1,	%l5,	%g2
	fnot1s	%f5,	%f12
	movg	%icc,	%l3,	%o4
	std	%f22,	[%l7 + 0x28]
	stx	%i0,	[%l7 + 0x68]
	movvc	%icc,	%i4,	%o6
	wr	%g0,	0x89,	%asi
	stxa	%i3,	[%l7 + 0x08] %asi
	tpos	%xcc,	0x6
	or	%l0,	%o3,	%i7
	wr	%g0,	0x88,	%asi
	stxa	%i5,	[%l7 + 0x10] %asi
	fmovsne	%xcc,	%f10,	%f25
	tcs	%xcc,	0x1
	movrne	%l6,	%g3,	%l1
	fbue	%fcc2,	loop_1414
	srl	%o7,	%l4,	%g6
	bn,a,pn	%icc,	loop_1415
	addc	%i2,	%g5,	%l2
loop_1414:
	sth	%o0,	[%l7 + 0x56]
	fbule	%fcc3,	loop_1416
loop_1415:
	tn	%icc,	0x2
	and	%i1,	%i6,	%g1
	edge16n	%g7,	%o2,	%o5
loop_1416:
	sdiv	%g4,	0x151C,	%o1
	tn	%xcc,	0x1
	tge	%icc,	0x3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x10] %asi,	%l5
	addc	%l3,	%g2,	%o4
	edge16	%i0,	%i4,	%o6
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	fmovrslez	%i3,	%f29,	%f12
	movleu	%icc,	%i7,	%i5
	fsrc1	%f28,	%f0
	fcmple32	%f12,	%f4,	%o3
	edge32ln	%g3,	%l6,	%l1
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f16
	xnorcc	%l4,	0x0A93,	%g6
	movvs	%xcc,	%i2,	%g5
	movge	%icc,	%o7,	%o0
	array8	%i1,	%l2,	%i6
	std	%f28,	[%l7 + 0x08]
	edge32n	%g7,	%o2,	%g1
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f6
	fxtod	%f6,	%f0
	tn	%xcc,	0x0
	ldx	[%l7 + 0x78],	%g4
	edge32n	%o5,	%l5,	%l3
	fmovrdgez	%o1,	%f30,	%f12
	movgu	%icc,	%o4,	%i0
	fmovdne	%icc,	%f29,	%f16
	tcs	%icc,	0x4
	membar	0x77
	movrne	%i4,	0x0FC,	%g2
	bshuffle	%f12,	%f16,	%f12
	udivx	%o6,	0x14EB,	%i3
	edge32n	%l0,	%i7,	%i5
	fmovrslz	%g3,	%f29,	%f18
	edge16n	%o3,	%l1,	%l6
	add	%l4,	0x03EE,	%g6
	subc	%g5,	%o7,	%i2
	bleu,a	%xcc,	loop_1417
	fmovda	%xcc,	%f10,	%f7
	movrlez	%i1,	0x215,	%o0
	tle	%xcc,	0x1
loop_1417:
	sllx	%l2,	%i6,	%g7
	xorcc	%g1,	%g4,	%o2
	edge16n	%l5,	%o5,	%l3
	tg	%icc,	0x7
	movneg	%xcc,	%o4,	%o1
	fandnot2	%f18,	%f8,	%f14
	movleu	%icc,	%i4,	%i0
	bneg,pt	%icc,	loop_1418
	nop
	setx	0x6BAC77C6AAB64C09,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x04CAC2730340438E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f10,	%f28
	edge32	%g2,	%i3,	%o6
	stw	%i7,	[%l7 + 0x64]
loop_1418:
	mova	%xcc,	%i5,	%g3
	orn	%o3,	0x0D76,	%l1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l6,	%l4
	nop
	setx loop_1419, %l0, %l1
	jmpl %l1, %g6
	tcc	%xcc,	0x2
	be,pn	%xcc,	loop_1420
	fbne,a	%fcc3,	loop_1421
loop_1419:
	st	%f9,	[%l7 + 0x24]
	sdivcc	%l0,	0x0E24,	%g5
loop_1420:
	addc	%o7,	%i2,	%i1
loop_1421:
	fmovrdlez	%l2,	%f12,	%f2
	nop
	setx	0xAEF2F17538D0F2F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xA5B41A612381F612,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f0,	%f18
	taddcctv	%i6,	%g7,	%g1
	bvs	loop_1422
	tsubcctv	%o0,	0x12BF,	%o2
	tne	%icc,	0x1
	bg	%icc,	loop_1423
loop_1422:
	orn	%l5,	0x0707,	%o5
	umulcc	%g4,	0x1C88,	%o4
	ldd	[%l7 + 0x08],	%f30
loop_1423:
	fpadd32s	%f2,	%f30,	%f27
	movleu	%icc,	%o1,	%l3
	brgez	%i0,	loop_1424
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
	ldsh	[%l7 + 0x76],	%i4
loop_1424:
	nop
	setx	0xA015B47D6381E005,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x278C134F95902142,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f20,	%f28
	edge8l	%i3,	%g2,	%i7
	brlez	%o6,	loop_1425
	movneg	%icc,	%g3,	%o3
	movrlz	%l1,	%l6,	%l4
	array16	%g6,	%i5,	%g5
loop_1425:
	andncc	%o7,	%i2,	%l0
	xor	%l2,	0x1E8C,	%i1
	srax	%g7,	%g1,	%o0
	fxnors	%f17,	%f30,	%f7
	orn	%i6,	0x0BB6,	%l5
	fabsd	%f2,	%f10
	fmovrdne	%o2,	%f0,	%f18
	tneg	%icc,	0x1
	fbuge,a	%fcc0,	loop_1426
	nop
	setx	0x961E4350,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xBF9E84B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f25,	%f6
	edge16n	%g4,	%o5,	%o1
	fand	%f26,	%f16,	%f2
loop_1426:
	subcc	%l3,	%o4,	%i4
	fcmpeq32	%f28,	%f4,	%i0
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f24
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x24] %asi,	%i3
	fmovda	%icc,	%f16,	%f13
	tn	%xcc,	0x2
	ta	%xcc,	0x6
	nop
	setx	0xE69FDEC6E8713B5C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x87FD7EE5E4DF66A3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f26,	%f6
	andn	%g2,	%i7,	%o6
	set	0x30, %i1
	lda	[%l7 + %i1] 0x18,	%f3
	umul	%g3,	%o3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%l4,	%f16,	%f26
	movrgez	%l1,	0x181,	%i5
	edge8	%g5,	%g6,	%i2
	taddcctv	%o7,	0x0320,	%l2
	fand	%f8,	%f28,	%f10
	nop
	setx	0x72B9FF97,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x4389B203,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f9,	%f25
	movneg	%icc,	%i1,	%l0
	ba	%xcc,	loop_1427
	nop
	setx loop_1428, %l0, %l1
	jmpl %l1, %g7
	orcc	%o0,	%g1,	%l5
	add	%o2,	%i6,	%o5
loop_1427:
	fmovrsgz	%o1,	%f15,	%f2
loop_1428:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%l3,	%o4
	fbue,a	%fcc2,	loop_1429
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f4
	fnegd	%f2,	%f20
	udivcc	%g4,	0x0CD0,	%i0
loop_1429:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x1C] %asi,	%f24
	movne	%xcc,	%i3,	%g2
	movcs	%icc,	%i7,	%o6
	tsubcctv	%i4,	0x1E59,	%g3
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x89
	fmovs	%f21,	%f4
	edge32ln	%l6,	%o3,	%l4
	tvc	%xcc,	0x6
	or	%l1,	%g5,	%i5
	fmovrdgez	%i2,	%f24,	%f14
	fmovrsgez	%o7,	%f10,	%f9
	taddcc	%l2,	0x1128,	%g6
	edge16n	%i1,	%l0,	%o0
	alignaddrl	%g1,	%g7,	%o2
	bvs,a	%xcc,	loop_1430
	nop
	setx	0xB07DAA32F41DEDB3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xEB6F571A23287F21,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f4,	%f10
	edge8l	%i6,	%o5,	%l5
	andn	%l3,	%o4,	%g4
loop_1430:
	movn	%xcc,	%o1,	%i0
	ldsh	[%l7 + 0x4C],	%g2
	tleu	%xcc,	0x1
	fmovrdgez	%i3,	%f16,	%f26
	fpsub32	%f26,	%f28,	%f30
	orncc	%i7,	%o6,	%i4
	nop
	setx	loop_1431,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%l6,	%g3,	%o3
	movrne	%l4,	0x173,	%l1
	edge16	%g5,	%i2,	%i5
loop_1431:
	orncc	%l2,	0x1956,	%g6
	set	0x80, %o4
	ldxa	[%g0 + %o4] 0x58,	%i1
	sdivx	%o7,	0x165F,	%o0
	udivx	%l0,	0x17C2,	%g1
	fbe,a	%fcc1,	loop_1432
	array8	%o2,	%g7,	%i6
	mulx	%l5,	%l3,	%o5
	edge32ln	%o4,	%o1,	%i0
loop_1432:
	fandnot2	%f8,	%f4,	%f20
	subccc	%g2,	0x1884,	%g4
	bpos	%xcc,	loop_1433
	edge32	%i7,	%i3,	%o6
	xor	%l6,	0x136D,	%g3
	ldsb	[%l7 + 0x64],	%i4
loop_1433:
	edge16ln	%l4,	%o3,	%g5
	edge8l	%i2,	%l1,	%l2
	bl,a,pn	%xcc,	loop_1434
	srax	%g6,	0x15,	%i1
	movrne	%o7,	%i5,	%l0
	tl	%icc,	0x4
loop_1434:
	tleu	%xcc,	0x2
	fnot2	%f26,	%f28
	fabsd	%f18,	%f26
	fbuge,a	%fcc2,	loop_1435
	movge	%xcc,	%o0,	%g1
	nop
	setx	0xCAFE470E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x8B884C0E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f29,	%f5
	movrne	%o2,	0x225,	%i6
loop_1435:
	edge32ln	%g7,	%l5,	%o5
	umulcc	%o4,	%l3,	%o1
	array16	%i0,	%g2,	%i7
	sra	%g4,	%o6,	%l6
	sub	%i3,	0x1BFA,	%g3
	array32	%i4,	%o3,	%l4
	movneg	%xcc,	%g5,	%l1
	tl	%xcc,	0x1
	tvs	%icc,	0x4
	fzero	%f6
	bleu	%icc,	loop_1436
	addccc	%l2,	0x0EBB,	%i2
	srax	%g6,	0x0B,	%i1
	brnz,a	%o7,	loop_1437
loop_1436:
	move	%xcc,	%l0,	%i5
	popc	%o0,	%o2
	fbu,a	%fcc3,	loop_1438
loop_1437:
	andn	%i6,	0x01EB,	%g7
	edge8	%l5,	%g1,	%o4
	andn	%l3,	%o1,	%o5
loop_1438:
	alignaddrl	%i0,	%g2,	%i7
	ldstub	[%l7 + 0x78],	%o6
	set	0x22, %g4
	lduha	[%l7 + %g4] 0x81,	%g4
	fcmpne32	%f18,	%f0,	%l6
	addc	%g3,	%i3,	%i4
	xnorcc	%l4,	0x10C5,	%o3
	alignaddr	%g5,	%l1,	%l2
	tg	%xcc,	0x4
	fmovrde	%i2,	%f16,	%f28
	mova	%icc,	%g6,	%o7
	st	%f24,	[%l7 + 0x08]
	nop
	fitos	%f9,	%f29
	fstox	%f29,	%f14
	fxtos	%f14,	%f18
	tpos	%icc,	0x0
	fmovsa	%xcc,	%f16,	%f26
	xnor	%l0,	0x001C,	%i1
	fcmpgt16	%f8,	%f8,	%i5
	fornot2	%f14,	%f16,	%f20
	array8	%o2,	%i6,	%g7
	edge32l	%o0,	%g1,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%l5,	%f25,	%f11
	movleu	%icc,	%l3,	%o1
	for	%f18,	%f12,	%f2
	movrne	%o5,	0x157,	%g2
	edge32ln	%i0,	%i7,	%o6
	brnz,a	%g4,	loop_1439
	fmovrdgez	%l6,	%f20,	%f12
	fbg,a	%fcc3,	loop_1440
	sllx	%g3,	%i3,	%l4
loop_1439:
	brz,a	%o3,	loop_1441
	mulx	%i4,	0x0168,	%l1
loop_1440:
	fandnot2	%f8,	%f16,	%f28
	xnorcc	%l2,	0x1D08,	%g5
loop_1441:
	alignaddr	%i2,	%o7,	%g6
	fbe	%fcc2,	loop_1442
	alignaddrl	%i1,	%i5,	%o2
	popc	%i6,	%l0
	sra	%o0,	%g7,	%o4
loop_1442:
	movn	%icc,	%g1,	%l3
	tne	%xcc,	0x5
	fmovdleu	%xcc,	%f20,	%f3
	fandnot1	%f26,	%f12,	%f14
	tneg	%icc,	0x4
	set	0x4C, %l4
	swapa	[%l7 + %l4] 0x10,	%l5
	ldx	[%l7 + 0x58],	%o5
	movrgz	%o1,	0x201,	%i0
	flush	%l7 + 0x24
	tgu	%xcc,	0x0
	edge32l	%g2,	%o6,	%i7
	bpos,pt	%icc,	loop_1443
	umulcc	%g4,	%g3,	%l6
	movl	%xcc,	%i3,	%o3
	fbo	%fcc1,	loop_1444
loop_1443:
	fbo,a	%fcc2,	loop_1445
	tcs	%xcc,	0x1
	edge8n	%l4,	%i4,	%l2
loop_1444:
	addccc	%l1,	0x12CA,	%g5
loop_1445:
	fbug,a	%fcc0,	loop_1446
	bvs	%xcc,	loop_1447
	orcc	%i2,	%o7,	%i1
	tge	%xcc,	0x5
loop_1446:
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f18
	fxtos	%f18,	%f12
loop_1447:
	addcc	%i5,	%o2,	%g6
	fcmple16	%f0,	%f4,	%i6
	fmovscc	%icc,	%f30,	%f11
	tle	%icc,	0x0
	xorcc	%l0,	%o0,	%g7
	subcc	%g1,	0x0772,	%o4
	fnegd	%f10,	%f24
	bg,pn	%icc,	loop_1448
	smulcc	%l5,	%l3,	%o5
	array16	%o1,	%g2,	%o6
	set	0x6E, %o2
	ldsha	[%l7 + %o2] 0x19,	%i0
loop_1448:
	edge8l	%i7,	%g4,	%g3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l6,	%i3
	xnor	%o3,	0x0190,	%l4
	membar	0x2C
	smul	%l2,	0x1C12,	%l1
	sdivx	%i4,	0x06D2,	%g5
	nop
	fitos	%f24,	%f3
	array32	%i2,	%i1,	%i5
	xorcc	%o2,	0x0B63,	%o7
	fmovrslez	%g6,	%f0,	%f31
	taddcc	%i6,	0x1428,	%l0
	orncc	%o0,	0x1AAD,	%g1
	tcs	%icc,	0x4
	movgu	%icc,	%g7,	%l5
	bcs,a	loop_1449
	srax	%o4,	0x0B,	%l3
	set	0x78, %l0
	stha	%o1,	[%l7 + %l0] 0x14
loop_1449:
	movpos	%xcc,	%g2,	%o6
	orn	%i0,	0x0023,	%o5
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%i7
	fnands	%f0,	%f4,	%f2
	fmovsg	%xcc,	%f12,	%f2
	xorcc	%g3,	%l6,	%g4
	tneg	%xcc,	0x2
	fmovdvs	%icc,	%f31,	%f25
	alignaddrl	%i3,	%o3,	%l4
	set	0x12, %l6
	ldsha	[%l7 + %l6] 0x80,	%l1
	ld	[%l7 + 0x40],	%f28
	fpsub32s	%f5,	%f22,	%f16
	set	0x28, %l1
	ldsha	[%l7 + %l1] 0x04,	%i4
	edge32n	%g5,	%i2,	%i1
	fmovsvs	%xcc,	%f27,	%f11
	or	%l2,	%i5,	%o7
	fbo	%fcc2,	loop_1450
	alignaddr	%o2,	%i6,	%l0
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1450:
	nop
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x0c
	movn	%icc,	%o0,	%g6
	sub	%g1,	0x1EE7,	%l5
	faligndata	%f24,	%f22,	%f24
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf0
	membar	#Sync
	sdivcc	%g7,	0x1A1C,	%l3
	fmovsgu	%icc,	%f26,	%f13
	bne,a	loop_1451
	umul	%o1,	%g2,	%o4
	array8	%i0,	%o5,	%o6
	movl	%icc,	%g3,	%l6
loop_1451:
	fmovdleu	%icc,	%f9,	%f4
	tl	%icc,	0x7
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x26] %asi,	%i7
	tsubcc	%g4,	0x1B7C,	%o3
	std	%f0,	[%l7 + 0x60]
	andncc	%l4,	%i3,	%i4
	movre	%g5,	%l1,	%i2
	bneg,a,pt	%icc,	loop_1452
	tn	%xcc,	0x7
	edge8	%i1,	%l2,	%o7
	fxors	%f17,	%f8,	%f3
loop_1452:
	faligndata	%f26,	%f4,	%f26
	edge16	%o2,	%i6,	%l0
	fbul,a	%fcc0,	loop_1453
	smulcc	%o0,	0x09BE,	%i5
	tvs	%xcc,	0x1
	movcs	%xcc,	%g1,	%l5
loop_1453:
	movg	%icc,	%g7,	%l3
	bg,pt	%icc,	loop_1454
	edge8ln	%g6,	%g2,	%o1
	movn	%icc,	%i0,	%o5
	nop
	set	0x3E, %i4
	ldsh	[%l7 + %i4],	%o4
loop_1454:
	fmovsleu	%xcc,	%f10,	%f19
	xnorcc	%g3,	%l6,	%o6
	fbe	%fcc3,	loop_1455
	alignaddr	%g4,	%o3,	%i7
	std	%f24,	[%l7 + 0x20]
	tl	%xcc,	0x0
loop_1455:
	edge16ln	%l4,	%i3,	%g5
	movrne	%i4,	%l1,	%i1
	orncc	%l2,	0x18EF,	%o7
	smul	%o2,	0x1166,	%i6
	set	0x4C, %o5
	stha	%i2,	[%l7 + %o5] 0x80
	brz,a	%l0,	loop_1456
	fblg,a	%fcc2,	loop_1457
	fmovdg	%icc,	%f9,	%f12
	fbue,a	%fcc1,	loop_1458
loop_1456:
	movneg	%xcc,	%o0,	%i5
loop_1457:
	fornot2s	%f21,	%f22,	%f9
	nop
	setx	0xD0402704,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
loop_1458:
	nop
	setx	0x804D0FEE,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	tne	%icc,	0x1
	movvs	%xcc,	%l5,	%g1
	tneg	%xcc,	0x3
	add	%g7,	0x1D10,	%g6
	fcmpgt32	%f2,	%f20,	%l3
	set	0x6A, %g3
	stha	%g2,	[%l7 + %g3] 0x23
	membar	#Sync
	or	%o1,	%i0,	%o5
	edge16	%g3,	%l6,	%o6
	alignaddr	%g4,	%o4,	%o3
	edge16l	%i7,	%l4,	%g5
	tsubcctv	%i4,	0x05FD,	%l1
	fpsub32	%f8,	%f22,	%f18
	sdiv	%i1,	0x10B2,	%l2
	bg,a	loop_1459
	tpos	%icc,	0x5
	add	%o7,	0x0F75,	%i3
	movrgz	%o2,	%i6,	%l0
loop_1459:
	move	%icc,	%i2,	%o0
	xor	%i5,	%l5,	%g1
	fmovrdgez	%g6,	%f22,	%f16
	fmovsne	%xcc,	%f8,	%f15
	wr	%g0,	0x88,	%asi
	stha	%g7,	[%l7 + 0x74] %asi
	andncc	%l3,	%o1,	%g2
	nop
	setx	loop_1460,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fexpand	%f1,	%f0
	taddcc	%o5,	%i0,	%g3
	sethi	0x00A3,	%o6
loop_1460:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	tge	%icc,	0x0
	umulcc	%l6,	%o3,	%i7
	mulx	%l4,	%g5,	%i4
	bpos,a,pt	%xcc,	loop_1461
	movge	%icc,	%o4,	%l1
	add	%l2,	0x07D2,	%o7
	bge	loop_1462
loop_1461:
	movleu	%icc,	%i1,	%o2
	tsubcctv	%i6,	0x1A74,	%i3
	movneg	%icc,	%l0,	%o0
loop_1462:
	sra	%i5,	%i2,	%g1
	udivcc	%l5,	0x185B,	%g7
	tn	%xcc,	0x0
	taddcctv	%g6,	%l3,	%o1
	add	%o5,	0x00E6,	%g2
	fbn	%fcc3,	loop_1463
	fmuld8sux16	%f24,	%f3,	%f8
	array32	%i0,	%o6,	%g3
	be,a,pn	%xcc,	loop_1464
loop_1463:
	popc	%g4,	%l6
	popc	%i7,	%o3
	set	0x2C, %i7
	swapa	[%l7 + %i7] 0x80,	%g5
loop_1464:
	and	%l4,	0x0695,	%o4
	smulcc	%i4,	%l2,	%l1
	tcs	%xcc,	0x5
	fmovdne	%xcc,	%f14,	%f23
	udivcc	%i1,	0x006F,	%o2
	flush	%l7 + 0x18
	fmovda	%xcc,	%f12,	%f7
	sra	%o7,	%i6,	%l0
	movre	%i3,	0x2AA,	%o0
	fmovsneg	%icc,	%f20,	%f17
	xor	%i2,	%g1,	%i5
	addc	%g7,	0x0A15,	%l5
	subcc	%l3,	%g6,	%o5
	fmovse	%xcc,	%f14,	%f25
	edge16ln	%g2,	%o1,	%i0
	fand	%f22,	%f26,	%f6
	tsubcc	%g3,	0x01E9,	%o6
	movle	%icc,	%g4,	%l6
	movne	%xcc,	%i7,	%g5
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f30
	fxtod	%f30,	%f24
	tge	%xcc,	0x3
	te	%xcc,	0x7
	fmul8x16al	%f9,	%f16,	%f18
	fxors	%f22,	%f7,	%f4
	tgu	%xcc,	0x4
	fbo	%fcc0,	loop_1465
	lduw	[%l7 + 0x7C],	%l4
	edge8ln	%o3,	%o4,	%i4
	fcmpeq16	%f12,	%f18,	%l2
loop_1465:
	andcc	%l1,	%o2,	%i1
	movrlz	%i6,	%l0,	%i3
	fbul	%fcc3,	loop_1466
	tcc	%xcc,	0x2
	fbule	%fcc3,	loop_1467
	orncc	%o0,	%i2,	%o7
loop_1466:
	smul	%g1,	%i5,	%l5
	edge32	%g7,	%g6,	%l3
loop_1467:
	nop
	set	0x38, %i5
	stxa	%o5,	[%l7 + %i5] 0xeb
	membar	#Sync
	orcc	%g2,	0x015B,	%o1
	membar	0x60
	brlez	%i0,	loop_1468
	fmovrdgez	%g3,	%f26,	%f16
	nop
	setx	0x32A5DB8A3A62DA95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xFD97096DAF25F05A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f2,	%f18
	subc	%o6,	%l6,	%i7
loop_1468:
	nop
	wr	%g0,	0xea,	%asi
	stba	%g4,	[%l7 + 0x7E] %asi
	membar	#Sync
	fbl	%fcc0,	loop_1469
	nop
	setx loop_1470, %l0, %l1
	jmpl %l1, %g5
	movre	%l4,	%o3,	%o4
	brgz	%l2,	loop_1471
loop_1469:
	fnand	%f16,	%f4,	%f4
loop_1470:
	fble	%fcc0,	loop_1472
	fmovse	%icc,	%f21,	%f14
loop_1471:
	fxnors	%f6,	%f13,	%f7
	be,pt	%xcc,	loop_1473
loop_1472:
	lduw	[%l7 + 0x0C],	%l1
	brlz	%o2,	loop_1474
	movge	%icc,	%i1,	%i6
loop_1473:
	edge32	%i4,	%i3,	%o0
	edge16n	%i2,	%l0,	%g1
loop_1474:
	movgu	%xcc,	%i5,	%l5
	movrlz	%g7,	%g6,	%l3
	ldd	[%l7 + 0x40],	%o6
	srl	%g2,	%o5,	%o1
	orcc	%g3,	0x0DA2,	%i0
	edge32n	%l6,	%i7,	%o6
	edge16	%g4,	%g5,	%o3
	srlx	%l4,	0x18,	%o4
	set	0x78, %g6
	stxa	%l2,	[%l7 + %g6] 0x89
	edge32l	%o2,	%l1,	%i1
	movne	%xcc,	%i4,	%i6
	movleu	%xcc,	%o0,	%i2
	edge8n	%l0,	%g1,	%i5
	taddcctv	%l5,	%g7,	%g6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrdne	%i3,	%f2,	%f20
	fbue,a	%fcc1,	loop_1475
	array32	%o7,	%l3,	%g2
	stw	%o1,	[%l7 + 0x3C]
	tpos	%xcc,	0x5
loop_1475:
	nop
	setx	0xF8DBF0B53B5B853D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB861511808CC612C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f4,	%f6
	fmovsne	%xcc,	%f2,	%f27
	fbe,a	%fcc1,	loop_1476
	fmovse	%xcc,	%f28,	%f21
	edge8l	%g3,	%o5,	%i0
	mulx	%i7,	0x0FB6,	%o6
loop_1476:
	nop
	setx	0xD06D184F,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fmovdgu	%xcc,	%f14,	%f12
	mulx	%g4,	%l6,	%o3
	edge8	%g5,	%l4,	%o4
	ta	%xcc,	0x0
	edge8	%l2,	%l1,	%i1
	fble,a	%fcc0,	loop_1477
	ldsh	[%l7 + 0x66],	%i4
	brnz,a	%o2,	loop_1478
	subcc	%o0,	0x1AB1,	%i2
loop_1477:
	fbu	%fcc3,	loop_1479
	fpadd16s	%f25,	%f14,	%f16
loop_1478:
	movneg	%icc,	%i6,	%g1
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x80,	%l0
loop_1479:
	alignaddr	%i5,	%l5,	%g6
	nop
	setx	0x707FBADD,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	stbar
	addcc	%g7,	%o7,	%l3
	movvc	%icc,	%i3,	%o1
	edge8l	%g2,	%o5,	%g3
	tl	%icc,	0x4
	udiv	%i7,	0x1782,	%o6
	bvc,a	%icc,	loop_1480
	movleu	%xcc,	%g4,	%l6
	udivcc	%i0,	0x1E71,	%g5
	array16	%o3,	%l4,	%o4
loop_1480:
	orncc	%l1,	0x0CFC,	%l2
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f26
	fxtod	%f26,	%f24
	umul	%i1,	%o2,	%i4
	set	0x120, %i6
	ldxa	[%g0 + %i6] 0x52,	%o0
	movne	%icc,	%i6,	%g1
	te	%xcc,	0x6
	fbl,a	%fcc2,	loop_1481
	bvs,a,pt	%icc,	loop_1482
	orcc	%l0,	0x0F38,	%i2
	fmovrsgez	%l5,	%f5,	%f27
loop_1481:
	tpos	%icc,	0x2
loop_1482:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%g6,	0x1663,	%g7
	edge16	%o7,	%l3,	%i5
	fmul8ulx16	%f2,	%f2,	%f24
	bgu	loop_1483
	fbg,a	%fcc0,	loop_1484
	srlx	%i3,	0x16,	%o1
	bgu	loop_1485
loop_1483:
	nop
	setx	0xE076F991C046F7AE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
loop_1484:
	movrgez	%o5,	%g2,	%i7
	orcc	%o6,	%g4,	%g3
loop_1485:
	flush	%l7 + 0x4C
	tneg	%icc,	0x7
	edge16l	%l6,	%g5,	%i0
	fbul	%fcc0,	loop_1486
	mulx	%l4,	%o3,	%l1
	fblg	%fcc3,	loop_1487
	fmovrdlz	%l2,	%f24,	%f20
loop_1486:
	edge32n	%o4,	%o2,	%i4
	movneg	%xcc,	%o0,	%i6
loop_1487:
	bvs,a,pn	%xcc,	loop_1488
	orcc	%i1,	0x0C8A,	%g1
	fxor	%f24,	%f22,	%f14
	smul	%i2,	%l0,	%l5
loop_1488:
	tpos	%icc,	0x4
	fmovdleu	%xcc,	%f24,	%f29
	sethi	0x1CD1,	%g7
	taddcctv	%g6,	%l3,	%i5
	movl	%xcc,	%o7,	%i3
	orcc	%o5,	%o1,	%i7
	fmovsl	%icc,	%f9,	%f8
	fbu,a	%fcc1,	loop_1489
	sra	%o6,	%g4,	%g2
	fmovsn	%xcc,	%f12,	%f14
	and	%g3,	0x0138,	%l6
loop_1489:
	sll	%g5,	0x09,	%i0
	fmovsneg	%icc,	%f23,	%f1
	wr	%g0,	0x0c,	%asi
	stxa	%o3,	[%l7 + 0x60] %asi
	fnot2	%f0,	%f26
	set	0x4C, %i0
	swapa	[%l7 + %i0] 0x89,	%l1
	movrgz	%l2,	%o4,	%l4
	nop
	setx loop_1490, %l0, %l1
	jmpl %l1, %i4
	xnor	%o0,	0x0675,	%i6
	fmovdn	%icc,	%f16,	%f26
	movn	%xcc,	%i1,	%o2
loop_1490:
	andncc	%i2,	%g1,	%l0
	set	0x28, %g5
	ldxa	[%g0 + %g5] 0x20,	%l5
	edge32n	%g6,	%l3,	%g7
	bge	%icc,	loop_1491
	andncc	%o7,	%i5,	%o5
	nop
	setx	0xDBA6EF64,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x59643008,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f24,	%f0
	or	%o1,	0x0257,	%i7
loop_1491:
	be	loop_1492
	call	loop_1493
	edge32	%o6,	%i3,	%g2
	tcs	%icc,	0x1
loop_1492:
	orn	%g4,	0x1FAA,	%l6
loop_1493:
	tcc	%icc,	0x4
	umulcc	%g5,	0x1A57,	%g3
	or	%i0,	%o3,	%l2
	movrne	%l1,	0x15C,	%l4
	bvs,a,pt	%xcc,	loop_1494
	alignaddrl	%o4,	%i4,	%i6
	movg	%xcc,	%o0,	%o2
	fmovrdgz	%i2,	%f22,	%f20
loop_1494:
	sdiv	%g1,	0x09D7,	%l0
	bvc	loop_1495
	fba,a	%fcc2,	loop_1496
	sub	%i1,	%l5,	%g6
	alignaddr	%g7,	%o7,	%i5
loop_1495:
	brz	%l3,	loop_1497
loop_1496:
	fzeros	%f2
	membar	0x39
	edge32n	%o5,	%i7,	%o6
loop_1497:
	fbl	%fcc3,	loop_1498
	fones	%f8
	tvc	%xcc,	0x3
	sra	%o1,	0x0F,	%g2
loop_1498:
	bvc,a,pt	%icc,	loop_1499
	srlx	%i3,	0x07,	%l6
	fcmpgt32	%f16,	%f20,	%g5
	nop
	setx	0x0AC3CB706B44DCDB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x054E59F7FCD2017C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f2,	%f4
loop_1499:
	movrgz	%g4,	%g3,	%o3
	movpos	%xcc,	%i0,	%l1
	tg	%icc,	0x2
	nop
	set	0x5C, %i2
	stw	%l2,	[%l7 + %i2]
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x10] %asi,	%l4
	set	0x41, %i3
	lduba	[%l7 + %i3] 0x81,	%i4
	fblg,a	%fcc2,	loop_1500
	edge16l	%o4,	%i6,	%o2
	fmovrdgez	%o0,	%f2,	%f8
	ldsb	[%l7 + 0x38],	%i2
loop_1500:
	or	%g1,	0x0826,	%i1
	fmovda	%icc,	%f18,	%f9
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l5,	%g6
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x74] %asi,	%f25
	tg	%xcc,	0x6
	fpack16	%f4,	%f31
	sethi	0x0B19,	%l0
	fsrc2s	%f11,	%f6
	fmovrdlez	%o7,	%f16,	%f8
	fbug	%fcc3,	loop_1501
	te	%icc,	0x3
	tsubcctv	%i5,	%l3,	%o5
	edge32l	%g7,	%i7,	%o1
loop_1501:
	movrgez	%g2,	%o6,	%i3
	te	%icc,	0x4
	movl	%xcc,	%g5,	%l6
	fmovrslz	%g4,	%f18,	%f26
	sdivx	%g3,	0x065E,	%o3
	srl	%i0,	%l1,	%l4
	mulx	%l2,	%o4,	%i4
	ldd	[%l7 + 0x50],	%f30
	wr	%g0,	0x10,	%asi
	stwa	%i6,	[%l7 + 0x2C] %asi
	fbuge,a	%fcc1,	loop_1502
	andn	%o0,	%o2,	%i2
	fble	%fcc2,	loop_1503
	xnorcc	%i1,	0x192A,	%l5
loop_1502:
	orcc	%g6,	0x101F,	%l0
	fones	%f30
loop_1503:
	fornot2s	%f10,	%f2,	%f1
	edge8n	%g1,	%i5,	%l3
	fmovrdlz	%o7,	%f4,	%f10
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x208] %asi,	%o5
	orncc	%g7,	0x09BC,	%i7
	tsubcctv	%o1,	%o6,	%g2
	bcc,a,pt	%icc,	loop_1504
	fmovsleu	%icc,	%f4,	%f1
	fxors	%f31,	%f23,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1504:
	nop
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%l6
	movcc	%xcc,	%g4,	%g3
	fble	%fcc0,	loop_1505
	movgu	%icc,	%g5,	%i0
	fbge	%fcc3,	loop_1506
	edge16	%o3,	%l1,	%l2
loop_1505:
	taddcctv	%l4,	%o4,	%i6
	bgu,a	%icc,	loop_1507
loop_1506:
	orncc	%i4,	%o0,	%o2
	edge32	%i1,	%i2,	%l5
	udivcc	%g6,	0x1811,	%l0
loop_1507:
	fbe,a	%fcc2,	loop_1508
	tcs	%xcc,	0x1
	fmovsl	%xcc,	%f19,	%f31
	fpsub32s	%f22,	%f14,	%f26
loop_1508:
	fmovrslez	%g1,	%f18,	%f20
	nop
	setx	0xB4D68DFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x2E4EB630,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f29,	%f8
	udiv	%l3,	0x0634,	%i5
	smul	%o7,	%o5,	%i7
	fbue	%fcc3,	loop_1509
	tge	%icc,	0x5
	tvc	%icc,	0x6
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x20] %asi,	%g6
loop_1509:
	tl	%xcc,	0x1
	srlx	%o6,	0x14,	%o1
	prefetch	[%l7 + 0x40],	 0x3
	udivcc	%i3,	0x10E8,	%g2
	fbg,a	%fcc2,	loop_1510
	fbuge,a	%fcc1,	loop_1511
	addc	%l6,	%g4,	%g3
	bne,a,pt	%xcc,	loop_1512
loop_1510:
	sub	%i0,	%g5,	%l1
loop_1511:
	stbar
	sll	%l2,	0x16,	%l4
loop_1512:
	tvc	%xcc,	0x2
	tn	%icc,	0x0
	fxors	%f15,	%f6,	%f31
	set	0x33, %l5
	ldsba	[%l7 + %l5] 0x11,	%o4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1B] %asi,	%o3
	fnegd	%f8,	%f16
	taddcc	%i4,	0x1458,	%i6
	brgez	%o0,	loop_1513
	fmovsleu	%icc,	%f28,	%f5
	taddcctv	%i1,	0x0061,	%o2
	sub	%l5,	0x17CC,	%g6
loop_1513:
	nop
	set	0x3F, %o3
	lduba	[%l7 + %o3] 0x88,	%l0
	srl	%g1,	%l3,	%i2
	edge16	%o7,	%i5,	%o5
	edge8	%g7,	%i7,	%o1
	stw	%i3,	[%l7 + 0x30]
	fexpand	%f2,	%f6
	andcc	%o6,	%g2,	%l6
	bvs,a	%xcc,	loop_1514
	bcs,a,pn	%xcc,	loop_1515
	tsubcctv	%g4,	0x1F09,	%g3
	array32	%i0,	%g5,	%l2
loop_1514:
	nop
	setx	0x5293255D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x840DD12A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f22,	%f19
loop_1515:
	swap	[%l7 + 0x50],	%l1
	fmovdcc	%icc,	%f12,	%f4
	tg	%xcc,	0x3
	andn	%o4,	0x01E6,	%l4
	set	0x28, %o6
	swapa	[%l7 + %o6] 0x19,	%i4
	movleu	%icc,	%i6,	%o3
	fmovrsgez	%i1,	%f24,	%f18
	ldub	[%l7 + 0x5C],	%o0
	fmovsvs	%icc,	%f18,	%f12
	tle	%xcc,	0x2
	nop
	setx	0x04AFC388,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x3618ADB2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f29,	%f16
	mova	%icc,	%l5,	%o2
	edge8	%g6,	%l0,	%l3
	fsrc2s	%f10,	%f20
	tcc	%icc,	0x3
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x62] %asi,	%i2
	movle	%icc,	%o7,	%g1
	bleu	loop_1516
	movrgez	%o5,	%g7,	%i5
	tpos	%xcc,	0x7
	fmuld8ulx16	%f12,	%f25,	%f24
loop_1516:
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f24
	fornot1	%f8,	%f12,	%f20
	smul	%i7,	0x0C43,	%i3
	xorcc	%o1,	0x0712,	%g2
	movrgz	%l6,	%g4,	%o6
	fmovdgu	%icc,	%f19,	%f11
	movrgez	%g3,	%i0,	%g5
	tsubcc	%l1,	0x0468,	%o4
	movrne	%l4,	0x3B3,	%l2
	fxor	%f18,	%f26,	%f2
	mulscc	%i4,	0x036C,	%o3
	prefetch	[%l7 + 0x40],	 0x3
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%i1
	edge16l	%o0,	%l5,	%i6
	movn	%icc,	%g6,	%l0
	edge8l	%o2,	%i2,	%l3
	srlx	%o7,	0x15,	%o5
	movg	%xcc,	%g7,	%g1
	edge16n	%i7,	%i5,	%o1
	movvc	%icc,	%i3,	%g2
	fsrc1s	%f9,	%f3
	movg	%xcc,	%g4,	%l6
	addccc	%o6,	%i0,	%g5
	movneg	%xcc,	%l1,	%g3
	srlx	%l4,	%l2,	%o4
	stb	%o3,	[%l7 + 0x70]
	fmovsvc	%icc,	%f3,	%f12
	fandnot1	%f26,	%f24,	%f6
	fbe	%fcc1,	loop_1517
	fmul8x16	%f20,	%f10,	%f6
	fmovdpos	%xcc,	%f15,	%f17
	sdiv	%i1,	0x0332,	%i4
loop_1517:
	fbg	%fcc3,	loop_1518
	ldd	[%l7 + 0x10],	%f16
	sllx	%o0,	%i6,	%g6
	bg,pn	%icc,	loop_1519
loop_1518:
	fmovrse	%l0,	%f4,	%f6
	movvs	%icc,	%l5,	%i2
	array8	%l3,	%o7,	%o5
loop_1519:
	orncc	%o2,	%g1,	%i7
	tpos	%xcc,	0x7
	umul	%g7,	0x061B,	%o1
	movrgez	%i3,	0x0C7,	%i5
	fornot1s	%f27,	%f6,	%f24
	sllx	%g4,	%g2,	%l6
	sub	%o6,	0x02A1,	%i0
	tsubcctv	%l1,	0x056D,	%g3
	fbul	%fcc2,	loop_1520
	fbn	%fcc2,	loop_1521
	bcc	%xcc,	loop_1522
	ble,pn	%xcc,	loop_1523
loop_1520:
	movneg	%xcc,	%l4,	%l2
loop_1521:
	alignaddr	%o4,	%o3,	%i1
loop_1522:
	sdiv	%i4,	0x1759,	%g5
loop_1523:
	bleu,pt	%xcc,	loop_1524
	mulscc	%o0,	0x1483,	%g6
	tge	%icc,	0x5
	edge16l	%l0,	%i6,	%i2
loop_1524:
	movn	%icc,	%l3,	%l5
	sra	%o7,	0x17,	%o2
	taddcctv	%g1,	0x06C7,	%o5
	tsubcctv	%i7,	0x00F6,	%o1
	sdiv	%i3,	0x1BA0,	%i5
	orcc	%g4,	%g2,	%g7
	bl,a	loop_1525
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o6,	%i0,	%l1
	st	%f24,	[%l7 + 0x34]
loop_1525:
	tvc	%xcc,	0x3
	tcs	%xcc,	0x7
	movn	%xcc,	%l6,	%l4
	fblg,a	%fcc1,	loop_1526
	movrlz	%l2,	%g3,	%o4
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1526:
	movrne	%o3,	0x1AF,	%i1
	wr	%g0,	0xe2,	%asi
	stwa	%g5,	[%l7 + 0x48] %asi
	membar	#Sync
	fmovrse	%i4,	%f16,	%f28
	nop
	fitos	%f13,	%f10
	fstox	%f10,	%f4
	bge,pn	%xcc,	loop_1527
	movne	%xcc,	%o0,	%g6
	fandnot1s	%f7,	%f5,	%f6
	sdiv	%i6,	0x0EA8,	%i2
loop_1527:
	brgez	%l3,	loop_1528
	edge8ln	%l5,	%o7,	%o2
	xor	%l0,	0x093B,	%o5
	sethi	0x18CB,	%g1
loop_1528:
	movle	%icc,	%i7,	%o1
	orcc	%i3,	0x0986,	%g4
	movcc	%xcc,	%g2,	%i5
	fmovsn	%xcc,	%f24,	%f12
	movle	%icc,	%g7,	%o6
	sdiv	%l1,	0x095B,	%l6
	movn	%icc,	%i0,	%l4
	udiv	%l2,	0x1796,	%o4
	fpsub32s	%f21,	%f0,	%f13
	set	0x4F, %o0
	lduba	[%l7 + %o0] 0x19,	%o3
	membar	0x16
	ta	%icc,	0x3
	stw	%g3,	[%l7 + 0x3C]
	tsubcctv	%i1,	0x105F,	%i4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%g5,	%o0
	bvc,pt	%xcc,	loop_1529
	bl,a	%icc,	loop_1530
	movleu	%icc,	%i6,	%i2
	tsubcctv	%g6,	%l5,	%l3
loop_1529:
	nop
	set	0x52, %l2
	ldsha	[%l7 + %l2] 0x11,	%o2
loop_1530:
	brlz,a	%o7,	loop_1531
	tsubcctv	%o5,	0x1785,	%g1
	tsubcc	%i7,	%l0,	%o1
	fpack32	%f10,	%f16,	%f2
loop_1531:
	fabsd	%f8,	%f14
	movrgez	%g4,	0x368,	%i3
	fble	%fcc2,	loop_1532
	fabsd	%f6,	%f14
	movpos	%icc,	%i5,	%g2
	fnot1	%f26,	%f8
loop_1532:
	andn	%o6,	0x11D3,	%l1
	lduw	[%l7 + 0x58],	%g7
	movn	%icc,	%l6,	%l4
	fnot1	%f0,	%f30
	nop
	set	0x78, %o7
	ldx	[%l7 + %o7],	%l2
	bl,a,pt	%icc,	loop_1533
	sethi	0x1569,	%o4
	bgu,a,pn	%icc,	loop_1534
	fmovsgu	%xcc,	%f30,	%f28
loop_1533:
	fpackfix	%f14,	%f31
	tge	%icc,	0x1
loop_1534:
	fands	%f18,	%f11,	%f0
	udivcc	%o3,	0x087D,	%g3
	wr	%g0,	0x11,	%asi
	sta	%f11,	[%l7 + 0x34] %asi
	brgz	%i1,	loop_1535
	nop
	fitos	%f12,	%f21
	fstox	%f21,	%f14
	umul	%i4,	0x0071,	%g5
	edge32	%i0,	%o0,	%i2
loop_1535:
	movn	%xcc,	%g6,	%l5
	st	%f9,	[%l7 + 0x68]
	bn,a,pn	%icc,	loop_1536
	andncc	%l3,	%o2,	%o7
	wr	%g0,	0x18,	%asi
	stba	%i6,	[%l7 + 0x61] %asi
loop_1536:
	edge32l	%g1,	%o5,	%i7
	lduh	[%l7 + 0x58],	%l0
	edge32n	%o1,	%i3,	%g4
	sra	%i5,	%g2,	%o6
	set	0x49, %g2
	lduba	[%l7 + %g2] 0x15,	%l1
	ldd	[%l7 + 0x30],	%f14
	addccc	%g7,	%l6,	%l4
	udiv	%o4,	0x1025,	%o3
	fmovdvs	%xcc,	%f5,	%f28
	andncc	%g3,	%i1,	%l2
	srl	%g5,	%i0,	%o0
	ldd	[%l7 + 0x38],	%f18
	tcc	%xcc,	0x4
	set	0x70, %i1
	stwa	%i4,	[%l7 + %i1] 0xea
	membar	#Sync
	movre	%g6,	0x3C4,	%l5
	taddcc	%i2,	0x135B,	%o2
	tvs	%icc,	0x0
	movg	%xcc,	%l3,	%o7
	bl	loop_1537
	fandnot1	%f30,	%f28,	%f20
	fba,a	%fcc2,	loop_1538
	xnor	%i6,	0x1C23,	%o5
loop_1537:
	fmovdvs	%icc,	%f25,	%f30
	movrlz	%i7,	%g1,	%l0
loop_1538:
	udivx	%i3,	0x04D2,	%o1
	nop
	setx	0x104884A8,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	or	%g4,	%i5,	%o6
	nop
	setx loop_1539, %l0, %l1
	jmpl %l1, %l1
	subccc	%g2,	%g7,	%l4
	set	0x28, %l3
	stxa	%l6,	[%g0 + %l3] 0x4f
loop_1539:
	movcs	%xcc,	%o4,	%g3
	movre	%i1,	0x079,	%o3
	movne	%xcc,	%l2,	%g5
	edge32l	%i0,	%i4,	%o0
	movl	%xcc,	%l5,	%i2
	movrne	%g6,	%l3,	%o7
	ldx	[%l7 + 0x30],	%i6
	movrlz	%o2,	%o5,	%i7
	brz	%g1,	loop_1540
	movgu	%icc,	%i3,	%l0
	nop
	setx	0xAB628D6E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x7A47F52A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f9,	%f22
	nop
	fitos	%f19,	%f11
loop_1540:
	edge32	%o1,	%g4,	%i5
	tg	%xcc,	0x2
	brz	%l1,	loop_1541
	ba,a,pn	%icc,	loop_1542
	tsubcctv	%o6,	%g7,	%g2
	addc	%l6,	%l4,	%g3
loop_1541:
	movre	%i1,	0x203,	%o4
loop_1542:
	brgz,a	%o3,	loop_1543
	move	%xcc,	%g5,	%l2
	smulcc	%i4,	0x1A39,	%i0
	movn	%xcc,	%l5,	%o0
loop_1543:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	or	%i2,	%l3,	%o7
	bleu,a,pt	%xcc,	loop_1544
	sethi	0x1FE3,	%o2
	tle	%xcc,	0x1
	udivx	%i6,	0x0C38,	%i7
loop_1544:
	udivx	%o5,	0x1BF1,	%g1
	nop
	setx	0x0D2A1057C06FC73C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	bcs,pn	%icc,	loop_1545
	fmovrdlez	%i3,	%f2,	%f14
	bl	loop_1546
	fbn	%fcc1,	loop_1547
loop_1545:
	bcs,pt	%xcc,	loop_1548
	movvc	%xcc,	%o1,	%l0
loop_1546:
	srlx	%g4,	0x1E,	%i5
loop_1547:
	fpadd32	%f12,	%f28,	%f22
loop_1548:
	sllx	%o6,	0x1C,	%g7
	movpos	%xcc,	%l1,	%l6
	mulx	%l4,	%g2,	%i1
	sth	%o4,	[%l7 + 0x68]
	set	0x57, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o3
	tle	%icc,	0x3
	fpmerge	%f3,	%f8,	%f30
	bvc	%icc,	loop_1549
	mova	%xcc,	%g3,	%l2
	fbge	%fcc3,	loop_1550
	fcmpeq32	%f20,	%f20,	%g5
loop_1549:
	edge16ln	%i0,	%i4,	%o0
	fbg	%fcc1,	loop_1551
loop_1550:
	bvs,a	loop_1552
	tpos	%icc,	0x1
	subcc	%l5,	%i2,	%g6
loop_1551:
	sir	0x08F6
loop_1552:
	udiv	%o7,	0x0F69,	%o2
	edge8n	%l3,	%i7,	%o5
	brnz	%g1,	loop_1553
	fcmple16	%f4,	%f6,	%i3
	ld	[%l7 + 0x4C],	%f2
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf8
	membar	#Sync
loop_1553:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7C] %asi,	%o1
	tcs	%icc,	0x6
	tsubcc	%l0,	0x14E7,	%g4
	sethi	0x122C,	%i5
	srl	%o6,	%g7,	%l1
	bl	%icc,	loop_1554
	fblg	%fcc1,	loop_1555
	taddcctv	%i6,	%l4,	%g2
	xnor	%i1,	%l6,	%o4
loop_1554:
	fsrc1s	%f22,	%f17
loop_1555:
	fones	%f13
	nop
	fitod	%f2,	%f10
	fdtoi	%f10,	%f21
	std	%f8,	[%l7 + 0x38]
	ta	%icc,	0x2
	fbl,a	%fcc0,	loop_1556
	nop
	setx	0x51A72CEBD59A04C2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE09517CEA62FF81E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f8,	%f20
	ta	%icc,	0x2
	sdivx	%o3,	0x0681,	%l2
loop_1556:
	subcc	%g5,	0x1494,	%i0
	umulcc	%g3,	0x0A47,	%o0
	fnot1s	%f21,	%f30
	alignaddrl	%l5,	%i2,	%g6
	tvc	%xcc,	0x7
	stw	%o7,	[%l7 + 0x24]
	fcmpeq32	%f12,	%f20,	%o2
	andn	%l3,	0x0915,	%i4
	sll	%o5,	0x03,	%g1
	sdiv	%i3,	0x1E27,	%i7
	nop
	setx	0x0F8CDCB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x15FE8D7E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f28,	%f22
	tsubcc	%l0,	0x1D4A,	%o1
	fzeros	%f23
	brz	%g4,	loop_1557
	bcs,a,pn	%xcc,	loop_1558
	udiv	%o6,	0x070C,	%i5
	edge16l	%g7,	%i6,	%l1
loop_1557:
	ldstub	[%l7 + 0x76],	%g2
loop_1558:
	edge32n	%i1,	%l4,	%o4
	fpsub32	%f2,	%f28,	%f22
	tn	%xcc,	0x1
	set	0x1E, %g4
	ldsha	[%l7 + %g4] 0x04,	%l6
	addcc	%o3,	%l2,	%i0
	edge16n	%g3,	%o0,	%g5
	smulcc	%l5,	0x10C8,	%i2
	edge32ln	%g6,	%o7,	%o2
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x57] %asi,	%i4
	edge32ln	%o5,	%l3,	%g1
	popc	%i3,	%i7
	movrgz	%o1,	0x142,	%l0
	movcs	%xcc,	%g4,	%o6
	movpos	%xcc,	%g7,	%i5
	fmovsleu	%icc,	%f2,	%f5
	mulscc	%l1,	%g2,	%i1
	fmovsl	%xcc,	%f28,	%f23
	tsubcctv	%l4,	%i6,	%l6
	ldx	[%l7 + 0x18],	%o3
	andcc	%l2,	0x047E,	%i0
	tsubcc	%o4,	0x173C,	%g3
	smul	%g5,	0x111F,	%o0
	membar	0x18
	sdivx	%i2,	0x12AB,	%g6
	ldstub	[%l7 + 0x52],	%l5
	xnor	%o2,	%o7,	%o5
	movre	%l3,	0x253,	%i4
	subccc	%g1,	%i7,	%i3
	movrgz	%l0,	%o1,	%g4
	fandnot2s	%f7,	%f18,	%f27
	fzero	%f12
	fmovsl	%xcc,	%f25,	%f19
	ta	%xcc,	0x6
	fsrc1s	%f0,	%f20
	movneg	%icc,	%g7,	%o6
	nop
	fitod	%f0,	%f28
	fdtox	%f28,	%f2
	stw	%l1,	[%l7 + 0x7C]
	fmuld8sux16	%f13,	%f24,	%f24
	tgu	%xcc,	0x3
	fpack16	%f12,	%f3
	xnorcc	%g2,	%i1,	%i5
	subccc	%l4,	%l6,	%i6
	stw	%l2,	[%l7 + 0x10]
	fbge,a	%fcc3,	loop_1559
	andn	%o3,	%o4,	%i0
	fmuld8sux16	%f26,	%f14,	%f2
	fmovdvc	%icc,	%f28,	%f29
loop_1559:
	nop
	setx	loop_1560,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%g5,	0x0CDE,	%g3
	mulscc	%i2,	%o0,	%g6
	fmovda	%xcc,	%f12,	%f0
loop_1560:
	tg	%xcc,	0x4
	mulscc	%l5,	%o2,	%o5
	tneg	%icc,	0x6
	sra	%o7,	0x04,	%l3
	sub	%i4,	%i7,	%i3
	movrlez	%g1,	%l0,	%g4
	sub	%g7,	%o1,	%l1
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x76] %asi,	%g2
	tsubcc	%o6,	%i5,	%l4
	ble	loop_1561
	smulcc	%i1,	%i6,	%l6
	and	%l2,	0x1F31,	%o3
	addc	%i0,	%g5,	%g3
loop_1561:
	bne,pn	%xcc,	loop_1562
	orn	%o4,	0x0CED,	%i2
	sll	%g6,	0x16,	%l5
	fones	%f19
loop_1562:
	fpadd32s	%f3,	%f21,	%f15
	fmovsg	%xcc,	%f23,	%f28
	sdiv	%o2,	0x0E2A,	%o5
	tne	%icc,	0x3
	fbne,a	%fcc1,	loop_1563
	orncc	%o7,	0x0794,	%o0
	tvs	%icc,	0x4
	edge16l	%i4,	%l3,	%i3
loop_1563:
	movvs	%icc,	%g1,	%l0
	tcs	%xcc,	0x3
	set	0x40, %o2
	swapa	[%l7 + %o2] 0x11,	%g4
	addcc	%g7,	0x04F9,	%o1
	fmuld8ulx16	%f16,	%f4,	%f6
	set	0x6C, %l6
	ldswa	[%l7 + %l6] 0x14,	%i7
	nop
	fitod	%f8,	%f6
	fdtoi	%f6,	%f30
	movrgez	%g2,	0x34F,	%o6
	sir	0x1B36
	orcc	%i5,	%l1,	%l4
	popc	0x1F82,	%i1
	mulscc	%i6,	%l6,	%o3
	movle	%icc,	%l2,	%g5
	set	0x3C, %l0
	lduwa	[%l7 + %l0] 0x88,	%i0
	addc	%o4,	%g3,	%i2
	edge16	%l5,	%g6,	%o5
	for	%f10,	%f8,	%f24
	nop
	setx	0x7B3CD88B7FBF392E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x62CBFD18096928DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f8,	%f20
	set	0x6B, %l1
	lduba	[%l7 + %l1] 0x0c,	%o7
	movrne	%o2,	0x316,	%o0
	fbuge,a	%fcc3,	loop_1564
	xnor	%i4,	0x14E2,	%l3
	nop
	fitos	%f11,	%f7
	fstod	%f7,	%f16
	orncc	%g1,	%l0,	%g4
loop_1564:
	bcs	%xcc,	loop_1565
	fmul8x16	%f9,	%f8,	%f22
	fbl,a	%fcc1,	loop_1566
	nop
	fitos	%f6,	%f26
loop_1565:
	fble,a	%fcc3,	loop_1567
	ldx	[%l7 + 0x60],	%i3
loop_1566:
	brnz,a	%o1,	loop_1568
	add	%g7,	0x0765,	%g2
loop_1567:
	array16	%o6,	%i7,	%l1
	ldub	[%l7 + 0x6E],	%l4
loop_1568:
	fbug,a	%fcc0,	loop_1569
	fmovse	%xcc,	%f26,	%f10
	mulx	%i1,	%i6,	%l6
	fmovrdne	%i5,	%f8,	%f20
loop_1569:
	subccc	%o3,	0x0041,	%g5
	fbl	%fcc2,	loop_1570
	subccc	%i0,	0x1DAA,	%l2
	fpackfix	%f20,	%f26
	sdivx	%o4,	0x130C,	%g3
loop_1570:
	edge16ln	%l5,	%i2,	%g6
	tvc	%xcc,	0x1
	movrlez	%o5,	%o2,	%o7
	nop
	fitos	%f5,	%f3
	bge,a	%icc,	loop_1571
	fcmpne16	%f8,	%f12,	%i4
	movne	%icc,	%o0,	%l3
	nop
	setx loop_1572, %l0, %l1
	jmpl %l1, %g1
loop_1571:
	flush	%l7 + 0x24
	subcc	%l0,	0x16FE,	%g4
	fbg	%fcc0,	loop_1573
loop_1572:
	sub	%i3,	%o1,	%g2
	tleu	%xcc,	0x2
	smul	%o6,	0x1CF6,	%g7
loop_1573:
	fcmpeq32	%f20,	%f16,	%i7
	fbe	%fcc0,	loop_1574
	nop
	setx loop_1575, %l0, %l1
	jmpl %l1, %l4
	fble,a	%fcc3,	loop_1576
	nop
	set	0x21, %g1
	stb	%i1,	[%l7 + %g1]
loop_1574:
	edge32l	%i6,	%l1,	%l6
loop_1575:
	fmovdn	%icc,	%f27,	%f6
loop_1576:
	movvc	%icc,	%i5,	%o3
	ldsw	[%l7 + 0x74],	%i0
	nop
	fitod	%f10,	%f6
	fdtos	%f6,	%f28
	st	%f0,	[%l7 + 0x78]
	srl	%l2,	%g5,	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%l5,	%i2
	fbl	%fcc3,	loop_1577
	addc	%g6,	%o5,	%o2
	fbne	%fcc1,	loop_1578
	add	%o7,	%o4,	%i4
loop_1577:
	fbue,a	%fcc0,	loop_1579
	edge32	%l3,	%o0,	%l0
loop_1578:
	and	%g1,	0x0BA3,	%i3
	mova	%xcc,	%o1,	%g4
loop_1579:
	fzero	%f8
	set	0x30, %i4
	prefetcha	[%l7 + %i4] 0x80,	 0x2
	bleu	%icc,	loop_1580
	fnand	%f6,	%f26,	%f16
	ba,pt	%xcc,	loop_1581
	fmovspos	%icc,	%f20,	%f26
loop_1580:
	movvs	%xcc,	%o6,	%g7
	fmovrsne	%l4,	%f10,	%f17
loop_1581:
	ldsw	[%l7 + 0x24],	%i7
	srax	%i6,	0x0F,	%l1
	sethi	0x03C5,	%l6
	sdivcc	%i1,	0x0796,	%i5
	bge	loop_1582
	xnor	%o3,	0x0C64,	%l2
	fcmpne16	%f4,	%f10,	%i0
	movge	%xcc,	%g5,	%g3
loop_1582:
	bcc,a	loop_1583
	umulcc	%l5,	0x0415,	%g6
	te	%xcc,	0x2
	be,a	%icc,	loop_1584
loop_1583:
	bg,pn	%icc,	loop_1585
	or	%o5,	%o2,	%i2
	tgu	%xcc,	0x4
loop_1584:
	fone	%f26
loop_1585:
	andn	%o4,	0x039C,	%i4
	wr	%g0,	0x22,	%asi
	stxa	%l3,	[%l7 + 0x40] %asi
	membar	#Sync
	fbue	%fcc2,	loop_1586
	edge8n	%o7,	%l0,	%o0
	movneg	%xcc,	%i3,	%o1
	taddcc	%g4,	0x1A0C,	%g1
loop_1586:
	brlz	%o6,	loop_1587
	tleu	%xcc,	0x3
	movne	%icc,	%g7,	%g2
	umulcc	%i7,	0x002E,	%i6
loop_1587:
	movne	%xcc,	%l4,	%l6
	fmuld8ulx16	%f11,	%f16,	%f26
	mulscc	%i1,	0x1C14,	%l1
	ldstub	[%l7 + 0x60],	%i5
	tsubcc	%l2,	0x0AC1,	%i0
	srax	%g5,	0x02,	%o3
	fnot1	%f8,	%f16
	bn,a,pt	%xcc,	loop_1588
	sdiv	%g3,	0x0F76,	%l5
	fbuge	%fcc0,	loop_1589
	andncc	%o5,	%o2,	%i2
loop_1588:
	brz,a	%o4,	loop_1590
	fpsub16	%f30,	%f8,	%f10
loop_1589:
	sdiv	%g6,	0x1F28,	%i4
	fornot2	%f20,	%f16,	%f14
loop_1590:
	movleu	%xcc,	%o7,	%l3
	st	%f24,	[%l7 + 0x5C]
	alignaddr	%o0,	%l0,	%i3
	brgz,a	%o1,	loop_1591
	bgu	%icc,	loop_1592
	fandnot2	%f0,	%f30,	%f16
	fmovrde	%g4,	%f16,	%f0
loop_1591:
	subc	%o6,	%g7,	%g1
loop_1592:
	sdiv	%i7,	0x0A7D,	%g2
	fone	%f16
	bgu,pn	%icc,	loop_1593
	edge16l	%l4,	%l6,	%i1
	or	%i6,	%i5,	%l2
	fmuld8ulx16	%f10,	%f11,	%f24
loop_1593:
	tg	%icc,	0x6
	fzeros	%f7
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x10] %asi,	%i0
	nop
	fitod	%f10,	%f24
	fdtox	%f24,	%f22
	addc	%g5,	%l1,	%o3
	bpos	loop_1594
	tvc	%icc,	0x5
	faligndata	%f12,	%f24,	%f22
	lduh	[%l7 + 0x4A],	%l5
loop_1594:
	tl	%xcc,	0x3
	ldsh	[%l7 + 0x1E],	%g3
	sdiv	%o2,	0x1F5B,	%o5
	fornot2	%f2,	%f0,	%f8
	xnor	%i2,	0x1ED3,	%o4
	fmovsvc	%icc,	%f2,	%f9
	fmul8sux16	%f18,	%f4,	%f10
	movgu	%xcc,	%i4,	%g6
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x1C] %asi,	%l3
	add	%o0,	0x11B7,	%o7
	fmovspos	%icc,	%f9,	%f7
	orcc	%i3,	0x18E2,	%o1
	sra	%g4,	%l0,	%o6
	nop
	setx	loop_1595,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%g1,	%i7,	%g2
	srlx	%g7,	0x16,	%l4
	fmovrdgez	%i1,	%f30,	%f10
loop_1595:
	sub	%l6,	%i6,	%i5
	fmul8x16au	%f29,	%f8,	%f16
	fmovdleu	%icc,	%f14,	%f8
	movpos	%icc,	%i0,	%l2
	fmovsleu	%icc,	%f27,	%f4
	tgu	%xcc,	0x4
	fxnors	%f28,	%f23,	%f6
	movn	%icc,	%g5,	%o3
	movle	%xcc,	%l1,	%g3
	movn	%xcc,	%l5,	%o2
	edge32l	%o5,	%i2,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x0
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%i4
	movrgez	%g6,	%o0,	%l3
	fbuge	%fcc2,	loop_1596
	addcc	%o7,	0x0AC5,	%o1
	fmovrslez	%g4,	%f26,	%f12
	fmovsg	%xcc,	%f13,	%f21
loop_1596:
	nop
	fitod	%f10,	%f18
	edge32ln	%l0,	%o6,	%g1
	tgu	%icc,	0x0
	alignaddrl	%i3,	%i7,	%g2
	fbg	%fcc3,	loop_1597
	movvs	%icc,	%l4,	%g7
	movge	%xcc,	%i1,	%l6
	fmovsgu	%icc,	%f24,	%f4
loop_1597:
	movrgez	%i6,	0x050,	%i0
	st	%f15,	[%l7 + 0x30]
	fbo	%fcc2,	loop_1598
	andcc	%i5,	%l2,	%g5
	srax	%o3,	%g3,	%l1
	movrlz	%o2,	0x2E3,	%l5
loop_1598:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o5,	%i2
	fmovrsgz	%i4,	%f4,	%f1
	edge8ln	%o4,	%g6,	%o0
	sll	%o7,	%o1,	%l3
	tn	%icc,	0x2
	fnot1	%f26,	%f0
	movvs	%icc,	%g4,	%l0
	mulscc	%g1,	%o6,	%i3
	tcc	%xcc,	0x3
	and	%i7,	%g2,	%g7
	fmovrsne	%i1,	%f0,	%f13
	bleu,a	%icc,	loop_1599
	ldsh	[%l7 + 0x54],	%l6
	udivx	%i6,	0x0E52,	%l4
	movvs	%icc,	%i0,	%i5
loop_1599:
	movre	%g5,	%l2,	%g3
	movge	%xcc,	%l1,	%o2
	edge16ln	%l5,	%o3,	%i2
	taddcctv	%o5,	0x0085,	%i4
	tgu	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g6,	0x1CE9,	%o0
	array32	%o7,	%o1,	%l3
	bcc	loop_1600
	array32	%o4,	%l0,	%g4
	call	loop_1601
	add	%g1,	0x016A,	%o6
loop_1600:
	te	%icc,	0x2
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x10] %asi,	%i3
loop_1601:
	tneg	%icc,	0x6
	bne,a	%xcc,	loop_1602
	tsubcctv	%g2,	0x0718,	%g7
	umulcc	%i1,	0x1B67,	%l6
	taddcctv	%i6,	0x17BE,	%l4
loop_1602:
	movrgez	%i0,	0x2D5,	%i7
	tvc	%icc,	0x3
	tcs	%xcc,	0x5
	movn	%icc,	%g5,	%l2
	ldsw	[%l7 + 0x4C],	%i5
	fands	%f1,	%f2,	%f1
	and	%l1,	0x1C6B,	%o2
	stbar
	sdivcc	%g3,	0x07BE,	%o3
	addc	%i2,	0x17D2,	%l5
	set	0x58, %o5
	stha	%i4,	[%l7 + %o5] 0x22
	membar	#Sync
	stb	%o5,	[%l7 + 0x0B]
	set	0x48, %o1
	stxa	%o0,	[%l7 + %o1] 0xe2
	membar	#Sync
	fbug,a	%fcc2,	loop_1603
	xnor	%g6,	0x156C,	%o7
	fmovrslez	%o1,	%f15,	%f0
	lduw	[%l7 + 0x70],	%l3
loop_1603:
	fnegs	%f24,	%f19
	tsubcctv	%o4,	%g4,	%l0
	fmovda	%icc,	%f3,	%f19
	movrgez	%o6,	0x163,	%g1
	fmovsne	%xcc,	%f8,	%f27
	tvs	%xcc,	0x3
	popc	0x1C34,	%g2
	sllx	%i3,	0x1D,	%i1
	tcc	%icc,	0x2
	fbul	%fcc3,	loop_1604
	movcc	%icc,	%g7,	%l6
	te	%xcc,	0x6
	xnor	%l4,	0x0D45,	%i0
loop_1604:
	bneg	%icc,	loop_1605
	sra	%i6,	0x01,	%g5
	srlx	%i7,	%i5,	%l2
	tpos	%icc,	0x6
loop_1605:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x7
	fnot2s	%f18,	%f15
	movcs	%xcc,	%l1,	%o2
	sll	%o3,	%i2,	%l5
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i4
	fmul8x16au	%f27,	%f11,	%f4
	movrlez	%o5,	%g3,	%o0
	orn	%g6,	%o7,	%o1
	nop
	setx	0x35AA3101,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f8
	movneg	%xcc,	%l3,	%o4
	fcmpne16	%f28,	%f20,	%g4
	te	%icc,	0x0
	fmovsl	%icc,	%f3,	%f31
	tg	%xcc,	0x5
	fpsub32	%f10,	%f0,	%f22
	wr	%g0,	0x80,	%asi
	stxa	%o6,	[%l7 + 0x18] %asi
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x22] %asi,	%g1
	fbn	%fcc3,	loop_1606
	xor	%g2,	%i3,	%i1
	wr	%g0,	0x2a,	%asi
	stha	%g7,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_1606:
	edge32	%l6,	%l0,	%l4
	bpos,a	%icc,	loop_1607
	movrne	%i6,	0x0C0,	%g5
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
loop_1607:
	udivx	%i5,	0x1F6D,	%i0
	array16	%l1,	%o2,	%l2
	brgz,a	%o3,	loop_1608
	movg	%icc,	%l5,	%i2
	fmovd	%f20,	%f22
	fpmerge	%f22,	%f18,	%f30
loop_1608:
	movg	%icc,	%i4,	%o5
	udivcc	%g3,	0x1957,	%g6
	addcc	%o0,	%o1,	%o7
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o4
	bcs	loop_1609
	bcs,a	loop_1610
	or	%g4,	%l3,	%o6
	fbne	%fcc0,	loop_1611
loop_1609:
	tcc	%xcc,	0x4
loop_1610:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g2,	%g1,	%i3
loop_1611:
	sethi	0x1131,	%g7
	fcmpgt32	%f24,	%f18,	%i1
	fmovsle	%icc,	%f24,	%f22
	mulx	%l6,	0x066C,	%l4
	array16	%i6,	%l0,	%g5
	add	%i7,	%i5,	%l1
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x79] %asi,	%i0
	movrgez	%l2,	%o2,	%l5
	edge16	%o3,	%i4,	%i2
	fzeros	%f6
	movneg	%icc,	%g3,	%g6
	movre	%o5,	0x20F,	%o1
	edge16n	%o0,	%o7,	%o4
	tvs	%icc,	0x3
	movre	%l3,	%g4,	%o6
	tl	%icc,	0x5
	tle	%icc,	0x0
	subcc	%g1,	0x075E,	%g2
	fmovsa	%icc,	%f18,	%f0
	xnorcc	%g7,	0x00AF,	%i1
	edge16n	%i3,	%l6,	%i6
	bcs	%xcc,	loop_1612
	fba	%fcc1,	loop_1613
	fxnor	%f18,	%f6,	%f2
	move	%xcc,	%l4,	%l0
loop_1612:
	lduw	[%l7 + 0x5C],	%i7
loop_1613:
	subcc	%i5,	%g5,	%l1
	andn	%l2,	%o2,	%l5
	add	%o3,	0x0163,	%i4
	fbg,a	%fcc0,	loop_1614
	movl	%xcc,	%i2,	%g3
	fba,a	%fcc3,	loop_1615
	fmovsgu	%icc,	%f20,	%f29
loop_1614:
	ldsb	[%l7 + 0x67],	%g6
	wr	%g0,	0xeb,	%asi
	stha	%o5,	[%l7 + 0x5C] %asi
	membar	#Sync
loop_1615:
	fbu,a	%fcc2,	loop_1616
	nop
	fitod	%f4,	%f24
	fdtos	%f24,	%f27
	edge8n	%o1,	%i0,	%o0
	mulscc	%o4,	%o7,	%g4
loop_1616:
	movvc	%icc,	%l3,	%g1
	popc	0x15E6,	%o6
	taddcc	%g7,	%g2,	%i1
	edge16	%l6,	%i3,	%i6
	edge32ln	%l4,	%l0,	%i7
	andncc	%i5,	%l1,	%l2
	addcc	%g5,	%o2,	%o3
	edge8n	%l5,	%i2,	%g3
	alignaddr	%g6,	%o5,	%i4
	subccc	%o1,	%i0,	%o4
	nop
	set	0x08, %i7
	ldx	[%l7 + %i7],	%o7
	tcs	%icc,	0x6
	ldsh	[%l7 + 0x3E],	%o0
	fmovrdne	%g4,	%f22,	%f20
	tge	%icc,	0x0
	prefetch	[%l7 + 0x4C],	 0x2
	add	%l3,	0x1D3C,	%o6
	tn	%xcc,	0x6
	fnegd	%f22,	%f0
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%g1
	array16	%g2,	%l6,	%i3
	movneg	%icc,	%i6,	%l4
	tcs	%icc,	0x0
	edge8n	%i1,	%i7,	%i5
	orncc	%l1,	0x03C8,	%l2
	movrgez	%g5,	0x047,	%l0
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f12
	fxtod	%f12,	%f14
	fmovrslz	%o2,	%f22,	%f12
	popc	0x1E7B,	%o3
	movcc	%xcc,	%i2,	%l5
	fnot2	%f14,	%f12
	taddcctv	%g3,	0x06BC,	%g6
	fnegd	%f22,	%f6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%i4
	edge16ln	%i0,	%o1,	%o4
	tsubcctv	%o7,	0x1CCF,	%o0
	nop
	fitos	%f8,	%f12
	fstoi	%f12,	%f28
	movn	%icc,	%g4,	%l3
	tle	%icc,	0x1
	fmovdvs	%xcc,	%f28,	%f20
	orn	%g7,	0x180A,	%o6
	taddcctv	%g1,	0x0962,	%l6
	nop
	set	0x5B, %i5
	ldsb	[%l7 + %i5],	%i3
	tsubcc	%g2,	0x12E7,	%l4
	ld	[%l7 + 0x3C],	%f12
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovscc	%icc,	%f11,	%f14
	tne	%xcc,	0x5
	fmovsleu	%icc,	%f15,	%f29
	movne	%icc,	%i6,	%i7
	edge32n	%i5,	%l1,	%i1
	umul	%l2,	%g5,	%o2
	bneg	%icc,	loop_1617
	fmovrdgez	%l0,	%f8,	%f4
	fpack16	%f2,	%f20
	movvs	%icc,	%o3,	%i2
loop_1617:
	nop
	set	0x5E, %g3
	stha	%g3,	[%l7 + %g3] 0x81
	fbg	%fcc1,	loop_1618
	smulcc	%l5,	%g6,	%o5
	movge	%icc,	%i4,	%o1
	udivcc	%i0,	0x0AAA,	%o7
loop_1618:
	movcc	%icc,	%o0,	%o4
	nop
	setx	loop_1619,	%l0,	%l1
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
	fmovdpos	%xcc,	%f16,	%f27
	tne	%icc,	0x1
loop_1619:
	nop
	setx	0xA07759C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	fbue,a	%fcc0,	loop_1620
	sethi	0x1697,	%l3
	stbar
	nop
	setx loop_1621, %l0, %l1
	jmpl %l1, %g7
loop_1620:
	movrlz	%o6,	%g4,	%l6
	umulcc	%i3,	%g2,	%g1
	and	%i6,	%i7,	%l4
loop_1621:
	sdivx	%i5,	0x0CE0,	%i1
	edge8ln	%l1,	%g5,	%l2
	mova	%xcc,	%o2,	%l0
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i2
	sdivx	%g3,	0x05BD,	%l5
	tn	%xcc,	0x4
	movrgez	%g6,	%o3,	%o5
	movpos	%icc,	%i4,	%o1
	sllx	%o7,	%o0,	%i0
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f16
	mulx	%o4,	0x0199,	%l3
	sethi	0x0BC1,	%g7
	addc	%o6,	0x014E,	%l6
	fbl,a	%fcc3,	loop_1622
	sra	%i3,	%g4,	%g2
	udivcc	%g1,	0x0E62,	%i6
	fbug,a	%fcc2,	loop_1623
loop_1622:
	fmul8x16au	%f14,	%f17,	%f14
	tvc	%xcc,	0x4
	edge8l	%i7,	%l4,	%i1
loop_1623:
	array32	%l1,	%i5,	%l2
	nop
	fitos	%f2,	%f29
	fstox	%f29,	%f18
	fxtos	%f18,	%f25
	fbug,a	%fcc3,	loop_1624
	fmovsg	%xcc,	%f26,	%f18
	edge8n	%g5,	%l0,	%i2
	addccc	%o2,	%g3,	%g6
loop_1624:
	fbuge,a	%fcc0,	loop_1625
	fmovdle	%icc,	%f7,	%f20
	movl	%icc,	%o3,	%o5
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%i4,	%o1
loop_1625:
	bvc	%xcc,	loop_1626
	movvc	%xcc,	%o7,	%l5
	movle	%icc,	%o0,	%i0
	lduh	[%l7 + 0x1E],	%l3
loop_1626:
	fmovrsgez	%o4,	%f2,	%f24
	array8	%g7,	%l6,	%i3
	ldd	[%l7 + 0x68],	%o6
	fba,a	%fcc2,	loop_1627
	array32	%g4,	%g1,	%g2
	ldx	[%l7 + 0x78],	%i6
	movrlez	%i7,	%i1,	%l4
loop_1627:
	movleu	%xcc,	%i5,	%l1
	tvc	%icc,	0x4
	movgu	%xcc,	%l2,	%g5
	fbe,a	%fcc2,	loop_1628
	prefetch	[%l7 + 0x70],	 0x1
	sdivcc	%l0,	0x1F4F,	%i2
	andn	%o2,	%g3,	%o3
loop_1628:
	movcc	%xcc,	%g6,	%o5
	edge8l	%i4,	%o7,	%o1
	nop
	set	0x10, %g7
	ldsw	[%l7 + %g7],	%o0
	sethi	0x134A,	%i0
	smul	%l5,	0x03DA,	%l3
	fnegd	%f12,	%f20
	mulx	%g7,	0x197E,	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%o6
	bshuffle	%f28,	%f18,	%f4
	tleu	%icc,	0x1
	brlez	%o4,	loop_1629
	bpos,a,pn	%xcc,	loop_1630
	tsubcc	%g1,	%g4,	%g2
	brgz	%i7,	loop_1631
loop_1629:
	ldstub	[%l7 + 0x0A],	%i6
loop_1630:
	andcc	%i1,	0x16C7,	%l4
	nop
	fitos	%f10,	%f21
	fstox	%f21,	%f18
loop_1631:
	bcs	loop_1632
	nop
	fitos	%f13,	%f16
	fstoi	%f16,	%f6
	edge8	%i5,	%l1,	%l2
	udiv	%l0,	0x0510,	%i2
loop_1632:
	nop
	setx	0xC929DEC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x160117E2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f11,	%f25
	subccc	%o2,	0x06A0,	%g5
	edge32ln	%g3,	%o3,	%o5
	sir	0x03B5
	flush	%l7 + 0x78
	fnegs	%f30,	%f5
	andcc	%i4,	0x08C2,	%o7
	andncc	%g6,	%o1,	%i0
	nop
	set	0x2C, %i6
	ldsh	[%l7 + %i6],	%o0
	nop
	setx	loop_1633,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot2s	%f13,	%f18,	%f31
	edge32n	%l5,	%l3,	%g7
	fxnors	%f17,	%f7,	%f12
loop_1633:
	fmovdvc	%xcc,	%f22,	%f7
	ldsb	[%l7 + 0x57],	%i3
	bleu,a,pn	%xcc,	loop_1634
	edge16ln	%o6,	%o4,	%l6
	orcc	%g4,	%g2,	%g1
	fpadd16s	%f14,	%f26,	%f22
loop_1634:
	nop
	set	0x20, %g6
	ldswa	[%l7 + %g6] 0x88,	%i6
	bg	%xcc,	loop_1635
	tpos	%xcc,	0x0
	nop
	fitod	%f8,	%f30
	fdtoi	%f30,	%f24
	array8	%i1,	%l4,	%i7
loop_1635:
	taddcc	%i5,	0x1CBF,	%l2
	tgu	%xcc,	0x6
	fpadd16s	%f25,	%f4,	%f9
	movneg	%xcc,	%l1,	%l0
	tn	%icc,	0x3
	movg	%icc,	%i2,	%o2
	bge,a,pt	%icc,	loop_1636
	tne	%icc,	0x1
	fbue,a	%fcc2,	loop_1637
	tg	%icc,	0x0
loop_1636:
	or	%g5,	%g3,	%o5
	tvc	%xcc,	0x3
loop_1637:
	fone	%f12
	fmovdneg	%icc,	%f19,	%f9
	bgu,a	%xcc,	loop_1638
	sllx	%i4,	0x06,	%o7
	movcs	%xcc,	%o3,	%o1
	edge8	%i0,	%o0,	%l5
loop_1638:
	srax	%g6,	%l3,	%g7
	bshuffle	%f22,	%f16,	%f22
	movneg	%icc,	%o6,	%o4
	fcmpne16	%f12,	%f16,	%i3
	tsubcc	%l6,	%g2,	%g1
	movgu	%xcc,	%i6,	%i1
	nop
	setx	0x5552D6EB5F8BB4B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xAFA11AA69D928F59,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f24,	%f18
	tn	%icc,	0x2
	taddcc	%l4,	0x103B,	%g4
	andcc	%i7,	%l2,	%l1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x11,	%l0,	%i5
	edge16n	%o2,	%i2,	%g5
	fornot1	%f0,	%f4,	%f14
	fexpand	%f22,	%f0
	mova	%icc,	%o5,	%g3
	movg	%xcc,	%o7,	%o3
	fbg,a	%fcc3,	loop_1639
	tge	%icc,	0x5
	fmovrde	%i4,	%f2,	%f14
	udivx	%i0,	0x1B54,	%o1
loop_1639:
	fmovrsgz	%l5,	%f10,	%f1
	fmul8x16	%f6,	%f16,	%f20
	fmovsl	%icc,	%f6,	%f19
	tleu	%xcc,	0x4
	set	0x15, %g5
	lduba	[%l7 + %g5] 0x19,	%g6
	and	%l3,	%o0,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o6,	%i3,	%o4
	bneg,a,pt	%icc,	loop_1640
	fnor	%f28,	%f22,	%f6
	std	%f30,	[%l7 + 0x08]
	prefetch	[%l7 + 0x08],	 0x2
loop_1640:
	movg	%icc,	%g2,	%g1
	ldub	[%l7 + 0x6A],	%i6
	mulscc	%i1,	0x17FA,	%l4
	movl	%xcc,	%l6,	%i7
	fpack32	%f10,	%f0,	%f6
	andn	%l2,	%l1,	%l0
	tg	%xcc,	0x7
	srax	%g4,	0x05,	%o2
	nop
	setx	0x66CBDD8187CAF3DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x41949EC16F718CA9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f12,	%f2
	fmovrsgz	%i2,	%f17,	%f11
	xnor	%i5,	0x058C,	%g5
	fmovdle	%icc,	%f29,	%f9
	fmovrsne	%o5,	%f13,	%f24
	movre	%g3,	0x3FC,	%o7
	movrlz	%o3,	0x0A5,	%i4
	andncc	%i0,	%o1,	%g6
	movn	%icc,	%l5,	%o0
	fmovsvc	%icc,	%f1,	%f24
	taddcc	%l3,	0x1F56,	%o6
	fpsub16	%f22,	%f20,	%f4
	add	%i3,	%o4,	%g2
	nop
	setx loop_1641, %l0, %l1
	jmpl %l1, %g7
	edge8n	%g1,	%i6,	%i1
	tpos	%xcc,	0x3
	tn	%icc,	0x7
loop_1641:
	tge	%xcc,	0x6
	movvs	%xcc,	%l4,	%l6
	addccc	%i7,	0x16E3,	%l1
	fbuge,a	%fcc0,	loop_1642
	nop
	set	0x61, %i0
	stb	%l2,	[%l7 + %i0]
	movrne	%g4,	0x0B6,	%l0
	tcs	%icc,	0x5
loop_1642:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x0F] %asi,	%o2
	bcs,a	loop_1643
	fnors	%f2,	%f20,	%f10
	fmovdn	%icc,	%f1,	%f8
	sll	%i2,	%i5,	%g5
loop_1643:
	fblg,a	%fcc0,	loop_1644
	nop
	setx	0x368FCA3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x3AF14049,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f14,	%f0
	tcc	%xcc,	0x5
	ldsh	[%l7 + 0x12],	%o5
loop_1644:
	fbug	%fcc3,	loop_1645
	fmovdne	%xcc,	%f15,	%f20
	movge	%xcc,	%g3,	%o7
	xorcc	%o3,	%i4,	%i0
loop_1645:
	srax	%o1,	%l5,	%o0
	fors	%f3,	%f31,	%f23
	edge8l	%g6,	%l3,	%o6
	tvc	%xcc,	0x0
	udivcc	%i3,	0x1C9E,	%o4
	movre	%g2,	0x0F3,	%g1
	fbug	%fcc0,	loop_1646
	edge32n	%g7,	%i1,	%i6
	movneg	%icc,	%l6,	%i7
	fmovdn	%xcc,	%f8,	%f6
loop_1646:
	edge8ln	%l4,	%l1,	%g4
	bshuffle	%f12,	%f22,	%f30
	srax	%l2,	0x13,	%o2
	array8	%i2,	%l0,	%i5
	fmovsgu	%icc,	%f16,	%f17
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o5
	mulx	%g5,	0x026B,	%o7
	brgz,a	%g3,	loop_1647
	sra	%o3,	%i0,	%o1
	sdiv	%i4,	0x00C9,	%l5
	fmovdcs	%xcc,	%f9,	%f19
loop_1647:
	smul	%o0,	%l3,	%g6
	umul	%o6,	%o4,	%g2
	mova	%xcc,	%i3,	%g7
	tsubcctv	%g1,	%i1,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i7,	%l6,	%l4
	edge32ln	%l1,	%g4,	%o2
	tsubcc	%i2,	%l0,	%l2
	tleu	%xcc,	0x0
	fmovdg	%xcc,	%f28,	%f13
	fmovdneg	%xcc,	%f10,	%f28
	movleu	%icc,	%i5,	%o5
	orncc	%g5,	0x10D5,	%o7
	addcc	%o3,	0x1F2E,	%i0
	popc	0x062F,	%o1
	ldsw	[%l7 + 0x14],	%i4
	set	0x74, %i3
	ldswa	[%l7 + %i3] 0x11,	%l5
	be	%xcc,	loop_1648
	fmovrse	%g3,	%f18,	%f23
	nop
	fitos	%f7,	%f21
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o0,	%g6
loop_1648:
	tcs	%xcc,	0x4
	edge32ln	%l3,	%o4,	%o6
	mulx	%i3,	%g2,	%g1
	sir	0x1A12
	sdivcc	%i1,	0x1E59,	%g7
	bne,a	loop_1649
	movle	%icc,	%i7,	%l6
	addccc	%i6,	%l1,	%g4
	nop
	setx	0xF1A63F34586E44C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f4
loop_1649:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o2,	%i2
	fpsub16	%f4,	%f12,	%f0
	faligndata	%f20,	%f30,	%f16
	flush	%l7 + 0x70
	movvs	%xcc,	%l0,	%l2
	sir	0x1E59
	movn	%icc,	%l4,	%i5
	alignaddr	%g5,	%o5,	%o7
	fnand	%f22,	%f30,	%f14
	edge32ln	%i0,	%o3,	%i4
	fbuge,a	%fcc0,	loop_1650
	fcmpne32	%f20,	%f22,	%l5
	ld	[%l7 + 0x34],	%f27
	set	0x3C, %l5
	sta	%f12,	[%l7 + %l5] 0x18
loop_1650:
	alignaddrl	%o1,	%o0,	%g3
	move	%xcc,	%l3,	%o4
	edge16n	%g6,	%i3,	%o6
	tcs	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%g0
	movcs	%xcc,	%i1,	%g7
	fzero	%f12
	edge32ln	%i7,	%g2,	%i6
	fbug	%fcc0,	loop_1651
	fbge,a	%fcc2,	loop_1652
	fpack32	%f26,	%f6,	%f14
	fbug,a	%fcc1,	loop_1653
loop_1651:
	bvc,a,pn	%icc,	loop_1654
loop_1652:
	stbar
	movcs	%xcc,	%l6,	%l1
loop_1653:
	tpos	%xcc,	0x1
loop_1654:
	popc	0x12E1,	%g4
	swap	[%l7 + 0x6C],	%o2
	smulcc	%i2,	%l2,	%l4
	tneg	%icc,	0x3
	fbue	%fcc1,	loop_1655
	nop
	setx loop_1656, %l0, %l1
	jmpl %l1, %i5
	mova	%icc,	%g5,	%l0
	nop
	setx	loop_1657,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1655:
	move	%xcc,	%o5,	%o7
loop_1656:
	fmovsvs	%icc,	%f10,	%f13
	srlx	%o3,	%i4,	%i0
loop_1657:
	tn	%icc,	0x6
	movge	%icc,	%l5,	%o1
	edge8ln	%g3,	%l3,	%o0
	movge	%xcc,	%g6,	%i3
	sir	0x167C
	nop
	set	0x21, %i2
	stb	%o4,	[%l7 + %i2]
	smulcc	%o6,	%i1,	%g7
	edge32n	%i7,	%g2,	%g1
	and	%i6,	0x05ED,	%l6
	sllx	%g4,	%o2,	%i2
	fble,a	%fcc3,	loop_1658
	fbe,a	%fcc0,	loop_1659
	sll	%l1,	%l4,	%i5
	sllx	%l2,	0x0E,	%l0
loop_1658:
	ta	%xcc,	0x5
loop_1659:
	fmovdge	%icc,	%f26,	%f16
	movrlz	%o5,	0x0E6,	%o7
	and	%o3,	%i4,	%i0
	brlez,a	%g5,	loop_1660
	addccc	%o1,	%l5,	%g3
	array16	%l3,	%g6,	%o0
	fmovsl	%xcc,	%f10,	%f8
loop_1660:
	edge8l	%i3,	%o6,	%i1
	popc	%o4,	%g7
	movl	%icc,	%g2,	%i7
	movg	%icc,	%g1,	%i6
	fmovdcc	%xcc,	%f1,	%f14
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	fand	%f0,	%f10,	%f0
	bge,a	loop_1661
	tpos	%xcc,	0x5
	fbn,a	%fcc3,	loop_1662
	movne	%icc,	%l6,	%o2
loop_1661:
	fnands	%f8,	%f27,	%f4
	alignaddrl	%l1,	%l4,	%i2
loop_1662:
	nop
	setx	0x665BC63B92AA7794,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6BB8B3C1C2FE6376,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f22,	%f20
	ta	%icc,	0x3
	edge8n	%l2,	%l0,	%o5
	orncc	%o7,	0x0FE7,	%i5
	fzero	%f28
	fnegs	%f18,	%f2
	fcmpne32	%f14,	%f20,	%i4
	edge8	%o3,	%g5,	%o1
	tvc	%icc,	0x2
	tleu	%xcc,	0x4
	subcc	%l5,	0x1A31,	%i0
	sdivcc	%g3,	0x0F4B,	%g6
	edge32l	%l3,	%i3,	%o6
	addccc	%o0,	%i1,	%g7
	movg	%icc,	%o4,	%g2
	bge,a,pn	%xcc,	loop_1663
	orn	%g1,	%i7,	%g4
	nop
	fitod	%f24,	%f4
	bpos,a,pn	%icc,	loop_1664
loop_1663:
	ldsb	[%l7 + 0x5E],	%l6
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x0c
loop_1664:
	orcc	%i6,	%o2,	%l4
	fmovrde	%i2,	%f14,	%f18
	nop
	setx	loop_1665,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%l2,	%l1,	%o5
	movneg	%xcc,	%l0,	%o7
	set	0x7C, %o0
	ldsha	[%l7 + %o0] 0x11,	%i4
loop_1665:
	brgez,a	%o3,	loop_1666
	brlez,a	%i5,	loop_1667
	alignaddr	%o1,	%g5,	%l5
	ta	%icc,	0x4
loop_1666:
	movrgz	%g3,	0x364,	%g6
loop_1667:
	nop
	fitod	%f12,	%f14
	fdtoi	%f14,	%f14
	mulx	%i0,	0x18E8,	%i3
	move	%xcc,	%l3,	%o0
	array16	%o6,	%i1,	%g7
	movne	%icc,	%o4,	%g1
	orcc	%i7,	0x19E4,	%g2
	sra	%l6,	%i6,	%o2
	nop
	setx	0x106C9CCF,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	tvc	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a,pn	%icc,	loop_1668
	taddcctv	%g4,	0x0E87,	%i2
	subccc	%l4,	%l2,	%l1
	fones	%f19
loop_1668:
	taddcctv	%l0,	%o7,	%o5
	mova	%icc,	%i4,	%o3
	stw	%i5,	[%l7 + 0x3C]
	fmovsge	%xcc,	%f1,	%f0
	tcc	%xcc,	0x5
	nop
	setx	0x920D53029A90C71F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xA1A7DC6F7BE4F9E5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f18,	%f2
	array32	%g5,	%l5,	%g3
	fmovsne	%xcc,	%f11,	%f6
	orncc	%g6,	0x0A7A,	%i0
	membar	0x0C
	fbul,a	%fcc3,	loop_1669
	pdist	%f14,	%f26,	%f28
	tle	%xcc,	0x3
	array8	%i3,	%l3,	%o0
loop_1669:
	nop
	fitos	%f2,	%f26
	fstod	%f26,	%f14
	fpack32	%f8,	%f4,	%f12
	xorcc	%o6,	%i1,	%g7
	fmovsa	%xcc,	%f24,	%f28
	array32	%o1,	%o4,	%i7
	nop
	setx	0xF1B0095410478D6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	tne	%xcc,	0x5
	brgez,a	%g2,	loop_1670
	tsubcctv	%g1,	%l6,	%i6
	bshuffle	%f6,	%f30,	%f6
	bvs,pn	%xcc,	loop_1671
loop_1670:
	fmovrdgez	%o2,	%f16,	%f10
	fnand	%f22,	%f18,	%f18
	addcc	%i2,	0x175E,	%g4
loop_1671:
	nop
	fitos	%f21,	%f18
	movvc	%icc,	%l4,	%l1
	fmul8x16	%f17,	%f12,	%f28
	fpadd16	%f18,	%f4,	%f30
	movrlez	%l2,	0x22E,	%o7
	fble	%fcc0,	loop_1672
	fbul	%fcc3,	loop_1673
	fmovsle	%xcc,	%f2,	%f16
	wr	%g0,	0xea,	%asi
	stwa	%l0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1672:
	edge32	%i4,	%o5,	%o3
loop_1673:
	fmovsvs	%icc,	%f0,	%f13
	fmovsneg	%xcc,	%f29,	%f27
	fzeros	%f9
	tneg	%xcc,	0x6
	xnor	%g5,	%i5,	%g3
	fpsub32s	%f27,	%f24,	%f16
	udiv	%g6,	0x02F0,	%l5
	fmovdneg	%xcc,	%f1,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x3
	bcc	%icc,	loop_1674
	stw	%i0,	[%l7 + 0x3C]
	edge8	%l3,	%i3,	%o6
	set	0x3C, %l2
	lduba	[%l7 + %l2] 0x0c,	%o0
loop_1674:
	fcmple32	%f16,	%f28,	%g7
	tcc	%icc,	0x6
	movvc	%icc,	%o1,	%i1
	edge8	%i7,	%g2,	%g1
	array32	%o4,	%i6,	%o2
	xnor	%i2,	0x0837,	%g4
	add	%l6,	%l4,	%l2
	alignaddr	%l1,	%l0,	%i4
	ba	loop_1675
	nop
	setx	0xD8E9B0B567E2511C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x1B7E4E3A1F323045,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f30,	%f2
	te	%xcc,	0x2
	movpos	%xcc,	%o7,	%o3
loop_1675:
	fmovrse	%g5,	%f31,	%f27
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%o5
	te	%icc,	0x3
	brgz	%i5,	loop_1676
	tcc	%xcc,	0x5
	edge8n	%g6,	%l5,	%g3
	tn	%xcc,	0x0
loop_1676:
	orcc	%l3,	%i3,	%o6
	fcmpeq16	%f10,	%f16,	%i0
	movge	%xcc,	%g7,	%o0
	wr	%g0,	0x0c,	%asi
	sta	%f14,	[%l7 + 0x1C] %asi
	movpos	%icc,	%i1,	%o1
	andcc	%g2,	0x09EE,	%g1
	srax	%i7,	%o4,	%o2
	fmovrdne	%i6,	%f8,	%f30
	fmovdg	%icc,	%f31,	%f14
	ldd	[%l7 + 0x58],	%g4
	bne,pt	%xcc,	loop_1677
	xnor	%i2,	0x0A23,	%l6
	tcc	%icc,	0x3
	movleu	%icc,	%l4,	%l2
loop_1677:
	smulcc	%l1,	%i4,	%l0
	edge16l	%o3,	%g5,	%o7
	fbl	%fcc0,	loop_1678
	array32	%o5,	%i5,	%g6
	umul	%l5,	0x036B,	%l3
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x30] %asi,	%i2
loop_1678:
	ldstub	[%l7 + 0x38],	%o6
	edge8n	%i0,	%g3,	%g7
	tne	%xcc,	0x2
	alignaddr	%i1,	%o1,	%o0
	nop
	setx	0x172E37448F7F20DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x9B906B1FA8A7BF07,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f20,	%f0
	bcc,pn	%xcc,	loop_1679
	tvc	%xcc,	0x4
	nop
	setx	0x1DE8F105C7009A4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f26
	edge16ln	%g1,	%g2,	%i7
loop_1679:
	st	%f1,	[%l7 + 0x28]
	fmovrdgez	%o4,	%f30,	%f20
	array32	%o2,	%i6,	%i2
	fpackfix	%f30,	%f11
	movgu	%icc,	%g4,	%l6
	call	loop_1680
	movl	%xcc,	%l4,	%l2
	tl	%icc,	0x3
	edge8ln	%l1,	%i4,	%o3
loop_1680:
	movl	%icc,	%l0,	%g5
	nop
	set	0x24, %o3
	ldsw	[%l7 + %o3],	%o5
	fbl,a	%fcc1,	loop_1681
	nop
	setx	0x2E3C77CCE5783C3C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x6943BBE54DCC07DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f24,	%f30
	movpos	%xcc,	%o7,	%g6
	tsubcc	%l5,	%i5,	%l3
loop_1681:
	fmovrsgez	%i3,	%f2,	%f15
	addc	%i0,	0x068C,	%g3
	orcc	%g7,	%o6,	%o1
	edge8	%o0,	%g1,	%g2
	tneg	%xcc,	0x6
	set	0x1C, %g2
	stwa	%i7,	[%l7 + %g2] 0x19
	ta	%icc,	0x1
	bg,a,pn	%icc,	loop_1682
	fblg,a	%fcc2,	loop_1683
	subccc	%i1,	0x0E7D,	%o2
	xnor	%o4,	%i2,	%i6
loop_1682:
	edge8n	%l6,	%l4,	%g4
loop_1683:
	fcmple16	%f4,	%f18,	%l1
	xor	%l2,	%o3,	%l0
	alignaddr	%g5,	%o5,	%i4
	fmovs	%f0,	%f2
	smulcc	%o7,	%g6,	%l5
	edge8l	%l3,	%i3,	%i0
	tsubcctv	%i5,	0x112F,	%g7
	movpos	%icc,	%o6,	%g3
	smul	%o0,	0x055C,	%g1
	tsubcctv	%g2,	0x105D,	%i7
	srax	%i1,	0x07,	%o2
	fbu	%fcc1,	loop_1684
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o1,	%o4
	orcc	%i2,	0x0782,	%i6
loop_1684:
	fpadd16s	%f25,	%f11,	%f6
	movcc	%icc,	%l4,	%l6
	subc	%g4,	%l1,	%o3
	addc	%l2,	0x13F8,	%l0
	movrne	%o5,	0x0A4,	%g5
	movgu	%xcc,	%o7,	%g6
	movg	%icc,	%i4,	%l3
	nop
	setx	0x48C486D900590950,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fmovdg	%xcc,	%f2,	%f3
	smul	%i3,	%l5,	%i5
	edge16l	%g7,	%i0,	%g3
	tpos	%xcc,	0x6
	set	0x2C, %i1
	lda	[%l7 + %i1] 0x80,	%f5
	movrne	%o0,	0x0F0,	%g1
	edge16ln	%o6,	%g2,	%i7
	fblg,a	%fcc0,	loop_1685
	fmul8x16al	%f10,	%f3,	%f8
	movrne	%i1,	0x2F7,	%o2
	movl	%icc,	%o4,	%o1
loop_1685:
	movrlz	%i2,	0x08F,	%l4
	smul	%i6,	%g4,	%l6
	subccc	%o3,	%l2,	%l0
	flush	%l7 + 0x50
	sdivx	%o5,	0x03E1,	%g5
	ldsw	[%l7 + 0x3C],	%l1
	st	%f7,	[%l7 + 0x0C]
	tpos	%xcc,	0x0
	alignaddr	%o7,	%g6,	%i4
	fnot1	%f14,	%f16
	fsrc1s	%f23,	%f13
	edge32n	%i3,	%l5,	%i5
	addc	%g7,	%i0,	%l3
	edge16ln	%g3,	%g1,	%o0
	sth	%g2,	[%l7 + 0x24]
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o6,	%i7
	bne,pt	%xcc,	loop_1686
	xnorcc	%o2,	%o4,	%o1
	tleu	%xcc,	0x3
	smulcc	%i2,	%l4,	%i1
loop_1686:
	fbo	%fcc0,	loop_1687
	edge32	%g4,	%l6,	%i6
	ldd	[%l7 + 0x68],	%f6
	xorcc	%o3,	%l0,	%o5
loop_1687:
	edge32l	%l2,	%g5,	%o7
	tne	%icc,	0x0
	nop
	setx	0xC72E26BAFF6A3EAC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f8
	udivcc	%l1,	0x1729,	%g6
	sllx	%i3,	0x10,	%l5
	sllx	%i4,	0x1E,	%g7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x0B] %asi,	%i0
	sra	%i5,	%g3,	%g1
	mulscc	%o0,	0x1CBB,	%g2
	tpos	%xcc,	0x0
	sdivcc	%l3,	0x1A9A,	%i7
	edge8ln	%o2,	%o6,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f20,	%f24,	%f16
	umul	%i2,	%l4,	%i1
	alignaddr	%g4,	%l6,	%o1
	st	%f7,	[%l7 + 0x4C]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i6,	%l0
	movneg	%icc,	%o3,	%l2
	fpsub16s	%f28,	%f0,	%f24
	array8	%g5,	%o7,	%l1
	bpos,a	%xcc,	loop_1688
	addc	%o5,	%g6,	%i3
	tge	%icc,	0x2
	fnot1	%f20,	%f20
loop_1688:
	sub	%l5,	%g7,	%i4
	fbul	%fcc1,	loop_1689
	lduh	[%l7 + 0x5C],	%i0
	addc	%i5,	0x05A5,	%g1
	edge16ln	%o0,	%g3,	%l3
loop_1689:
	orn	%g2,	0x019D,	%i7
	andcc	%o2,	0x0BAB,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o4,	%i2,	%i1
	orncc	%l4,	0x1895,	%l6
	sdivcc	%o1,	0x19B5,	%i6
	wr	%g0,	0xe3,	%asi
	stxa	%g4,	[%l7 + 0x18] %asi
	membar	#Sync
	orncc	%l0,	0x0996,	%o3
	nop
	fitod	%f12,	%f8
	fdtos	%f8,	%f14
	prefetch	[%l7 + 0x7C],	 0x1
	sdivx	%g5,	0x1421,	%l2
	fbo	%fcc0,	loop_1690
	fxnors	%f10,	%f13,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l1,	0x153B,	%o7
loop_1690:
	sll	%o5,	0x0A,	%i3
	andncc	%g6,	%g7,	%i4
	bneg,pt	%icc,	loop_1691
	orcc	%l5,	%i5,	%g1
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1691:
	mulx	%o0,	%g3,	%l3
	movgu	%xcc,	%i0,	%g2
	tg	%icc,	0x0
	movrne	%i7,	%o2,	%o4
	fxor	%f12,	%f12,	%f10
	fmuld8ulx16	%f28,	%f17,	%f0
	tne	%icc,	0x0
	edge8l	%i2,	%o6,	%i1
	edge16ln	%l6,	%o1,	%l4
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x88,	%g4
	tvc	%icc,	0x1
	bleu,a	%xcc,	loop_1692
	popc	0x1227,	%l0
	xorcc	%i6,	%o3,	%l2
	set	0x64, %o7
	lduwa	[%l7 + %o7] 0x89,	%l1
loop_1692:
	umulcc	%g5,	0x1CB9,	%o5
	nop
	setx	0x7CD763D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x4583448B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f14,	%f22
	movge	%icc,	%i3,	%o7
	srl	%g7,	0x13,	%i4
	tle	%icc,	0x0
	edge32l	%l5,	%i5,	%g6
	srl	%g1,	0x16,	%g3
	sll	%l3,	%o0,	%g2
	subccc	%i7,	0x1D80,	%i0
	tle	%xcc,	0x0
	ta	%xcc,	0x3
	orncc	%o4,	%o2,	%o6
	fzero	%f0
	edge16	%i1,	%i2,	%l6
	ld	[%l7 + 0x78],	%f22
	tl	%xcc,	0x0
	edge8ln	%l4,	%g4,	%o1
	fbue	%fcc0,	loop_1693
	sir	0x0E6B
	sth	%l0,	[%l7 + 0x12]
	ld	[%l7 + 0x2C],	%f17
loop_1693:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o3
	fexpand	%f16,	%f24
	tge	%icc,	0x3
	bvs,pt	%icc,	loop_1694
	andn	%i6,	0x0A0D,	%l2
	call	loop_1695
	fmul8ulx16	%f2,	%f10,	%f4
loop_1694:
	flush	%l7 + 0x50
	sdivcc	%g5,	0x12B3,	%l1
loop_1695:
	umulcc	%i3,	%o7,	%g7
	movre	%i4,	0x198,	%l5
	fxnor	%f2,	%f18,	%f28
	fnegs	%f28,	%f21
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x89
	ta	%xcc,	0x0
	andcc	%i5,	0x0CF1,	%o5
	fpsub16	%f16,	%f0,	%f28
	movn	%xcc,	%g1,	%g3
	srax	%l3,	0x0C,	%o0
	mova	%icc,	%g2,	%i7
	tg	%xcc,	0x0
	bpos	%icc,	loop_1696
	xorcc	%g6,	0x1E74,	%o4
	fornot1s	%f10,	%f13,	%f21
	tg	%icc,	0x6
loop_1696:
	andncc	%i0,	%o6,	%o2
	movle	%icc,	%i2,	%i1
	orcc	%l6,	0x1410,	%l4
	umul	%o1,	0x0A8A,	%l0
	movcc	%xcc,	%g4,	%o3
	fmovsl	%xcc,	%f0,	%f24
	bvc	loop_1697
	fmovdne	%icc,	%f21,	%f26
	bne,pn	%xcc,	loop_1698
	edge32n	%l2,	%i6,	%g5
loop_1697:
	fbe	%fcc1,	loop_1699
	umulcc	%l1,	%o7,	%i3
loop_1698:
	subccc	%g7,	%l5,	%i4
	fmovsge	%icc,	%f0,	%f19
loop_1699:
	orncc	%i5,	0x0AA8,	%g1
	fors	%f2,	%f23,	%f26
	and	%o5,	0x16A7,	%l3
	move	%xcc,	%g3,	%o0
	ldsw	[%l7 + 0x14],	%i7
	ldstub	[%l7 + 0x46],	%g6
	fmovdcs	%xcc,	%f11,	%f6
	sub	%o4,	0x0AD7,	%g2
	fmovsg	%icc,	%f28,	%f4
	mova	%xcc,	%i0,	%o6
	edge32n	%o2,	%i2,	%l6
	bne,a,pt	%icc,	loop_1700
	bpos	%xcc,	loop_1701
	brz,a	%i1,	loop_1702
	nop
	setx	0xFBE85733F89E7EF7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xE14263D329B8A922,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f20,	%f12
loop_1700:
	fmul8sux16	%f20,	%f0,	%f4
loop_1701:
	fmovdge	%xcc,	%f28,	%f17
loop_1702:
	edge32n	%l4,	%o1,	%l0
	tpos	%xcc,	0x6
	sth	%g4,	[%l7 + 0x72]
	movre	%o3,	0x0D3,	%l2
	fbule,a	%fcc1,	loop_1703
	andn	%g5,	%l1,	%i6
	stbar
	sub	%i3,	%g7,	%o7
loop_1703:
	mova	%icc,	%l5,	%i4
	sethi	0x054B,	%i5
	fxnor	%f4,	%f26,	%f26
	edge32ln	%o5,	%g1,	%g3
	fble	%fcc0,	loop_1704
	edge32l	%l3,	%i7,	%g6
	movcc	%icc,	%o0,	%o4
	fmovdle	%icc,	%f18,	%f7
loop_1704:
	edge8n	%g2,	%o6,	%i0
	movcs	%icc,	%i2,	%o2
	smul	%i1,	0x1EF7,	%l4
	udiv	%l6,	0x05F7,	%o1
	edge32ln	%l0,	%o3,	%g4
	movl	%xcc,	%l2,	%l1
	fxnors	%f8,	%f14,	%f11
	tcs	%xcc,	0x2
	tne	%icc,	0x6
	fnors	%f15,	%f21,	%f9
	fones	%f17
	fandnot1	%f20,	%f20,	%f14
	nop
	setx	loop_1705,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%i6,	%g5,	%g7
	addcc	%i3,	%o7,	%l5
	movne	%xcc,	%i4,	%o5
loop_1705:
	edge8n	%g1,	%g3,	%i5
	srl	%l3,	0x0A,	%i7
	ldd	[%l7 + 0x78],	%g6
	udivcc	%o4,	0x0D72,	%o0
	set	0x63, %o4
	ldsba	[%l7 + %o4] 0x80,	%g2
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x13] %asi,	%i0
	add	%i2,	%o2,	%o6
	fcmpgt16	%f20,	%f0,	%i1
	movvs	%xcc,	%l6,	%o1
	addccc	%l0,	%l4,	%o3
	fmovda	%xcc,	%f17,	%f7
	membar	0x4C
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x81,	%f0
	fpadd16s	%f13,	%f12,	%f5
	subccc	%l2,	%l1,	%i6
	stw	%g4,	[%l7 + 0x3C]
	udivx	%g7,	0x198C,	%g5
	popc	0x1A15,	%i3
	nop
	setx	0xE7C0C94EE49B47A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xDA6645FDF7F1B9EA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f20,	%f4
	fsrc1	%f30,	%f6
	prefetch	[%l7 + 0x50],	 0x2
	fbu	%fcc1,	loop_1706
	membar	0x57
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l5,	%i4
loop_1706:
	fmul8x16al	%f21,	%f1,	%f14
	fmuld8ulx16	%f3,	%f31,	%f0
	set	0x30, %o2
	ldda	[%l7 + %o2] 0x19,	%o6
	umul	%g1,	%o5,	%g3
	fcmpeq16	%f0,	%f14,	%i5
	swap	[%l7 + 0x40],	%i7
	movg	%icc,	%g6,	%l3
	stbar
	andn	%o0,	%o4,	%g2
	tsubcctv	%i2,	%i0,	%o6
	sdivcc	%i1,	0x1622,	%o2
	srl	%l6,	%l0,	%o1
	movrgez	%l4,	0x027,	%l2
	tge	%icc,	0x3
	alignaddrl	%l1,	%o3,	%g4
	movcc	%xcc,	%g7,	%i6
	array8	%g5,	%i3,	%l5
	xor	%o7,	0x1E5E,	%g1
	fpsub16	%f20,	%f18,	%f24
	movpos	%icc,	%o5,	%i4
	smul	%i5,	0x028C,	%i7
	movgu	%icc,	%g3,	%g6
	xorcc	%l3,	0x024E,	%o4
	movrne	%o0,	0x33E,	%g2
	nop
	fitos	%f14,	%f17
	fbn	%fcc2,	loop_1707
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i0
loop_1707:
	fmuld8sux16	%f0,	%f9,	%f26
	xor	%o6,	0x1262,	%i1
	xnor	%i2,	%l6,	%l0
	movleu	%xcc,	%o2,	%o1
	move	%xcc,	%l2,	%l4
	mulscc	%l1,	0x0F66,	%o3
	mulscc	%g4,	0x12AF,	%g7
	te	%icc,	0x6
	sll	%i6,	0x0F,	%i3
	edge8n	%g5,	%l5,	%o7
	addcc	%o5,	%g1,	%i5
	bne,a,pn	%icc,	loop_1708
	movgu	%xcc,	%i7,	%g3
	sdivx	%i4,	0x1AC6,	%l3
	fmuld8ulx16	%f30,	%f25,	%f4
loop_1708:
	orn	%o4,	0x1AE9,	%o0
	ba,a,pt	%icc,	loop_1709
	sra	%g6,	%g2,	%i0
	array32	%o6,	%i2,	%i1
	edge8ln	%l0,	%l6,	%o1
loop_1709:
	fexpand	%f4,	%f6
	addcc	%l2,	0x0EFE,	%l4
	andcc	%l1,	0x147E,	%o2
	fzero	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%o3,	%g4
	fmul8ulx16	%f26,	%f10,	%f22
	fbu,a	%fcc2,	loop_1710
	sub	%g7,	0x1A10,	%i6
	prefetch	[%l7 + 0x7C],	 0x2
	tgu	%xcc,	0x7
loop_1710:
	addc	%g5,	%l5,	%i3
	fbug	%fcc2,	loop_1711
	edge16	%o5,	%g1,	%o7
	tcc	%xcc,	0x1
	bpos,a	%icc,	loop_1712
loop_1711:
	movre	%i5,	0x354,	%i7
	fornot2	%f12,	%f22,	%f26
	alignaddrl	%i4,	%l3,	%o4
loop_1712:
	ble,a,pn	%icc,	loop_1713
	tneg	%icc,	0x3
	membar	0x3A
	smulcc	%o0,	0x0314,	%g6
loop_1713:
	tcc	%xcc,	0x0
	mova	%xcc,	%g2,	%i0
	tg	%xcc,	0x4
	movvc	%icc,	%o6,	%g3
	mova	%xcc,	%i2,	%l0
	addcc	%l6,	%o1,	%i1
	addc	%l4,	%l2,	%l1
	or	%o2,	0x0ADB,	%g4
	sdivx	%o3,	0x05AA,	%g7
	bl	%icc,	loop_1714
	ld	[%l7 + 0x34],	%f26
	fmovrdne	%i6,	%f28,	%f10
	nop
	fitos	%f5,	%f13
	fstox	%f13,	%f18
	fxtos	%f18,	%f24
loop_1714:
	fzero	%f22
	nop
	setx	0xB4752461,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xF6DC5463,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f29,	%f27
	or	%g5,	%l5,	%o5
	udiv	%i3,	0x1859,	%g1
	taddcctv	%o7,	%i5,	%i4
	fcmpeq16	%f16,	%f10,	%l3
	array8	%i7,	%o0,	%g6
	te	%xcc,	0x3
	fbug,a	%fcc3,	loop_1715
	orcc	%o4,	0x0A27,	%g2
	xor	%o6,	%g3,	%i0
	nop
	fitod	%f10,	%f24
	fdtoi	%f24,	%f31
loop_1715:
	ldsw	[%l7 + 0x0C],	%i2
	fsrc1s	%f14,	%f31
	te	%icc,	0x0
	edge16n	%l0,	%o1,	%l6
	fbn,a	%fcc3,	loop_1716
	fbo,a	%fcc0,	loop_1717
	movrlez	%l4,	%i1,	%l2
	edge32n	%o2,	%l1,	%o3
loop_1716:
	fornot1s	%f16,	%f24,	%f14
loop_1717:
	bl	loop_1718
	edge32	%g4,	%g7,	%g5
	tge	%xcc,	0x2
	edge32n	%l5,	%i6,	%o5
loop_1718:
	stw	%i3,	[%l7 + 0x10]
	movvc	%xcc,	%g1,	%o7
	movleu	%xcc,	%i5,	%l3
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x14
	fabss	%f10,	%f30
	mova	%icc,	%i4,	%i7
	tpos	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	stha	%g6,	[%l7 + 0x6E] %asi
	movle	%icc,	%o4,	%g2
	tle	%xcc,	0x6
	fpsub16s	%f2,	%f13,	%f3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%o0,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o6,	%i2,	%i0
	srlx	%o1,	%l6,	%l4
	bvs,a,pn	%icc,	loop_1719
	stb	%i1,	[%l7 + 0x4F]
	udivcc	%l0,	0x1D53,	%o2
	movrgz	%l1,	0x341,	%o3
loop_1719:
	nop
	setx	0xB5235C36,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f12
	bcs,a,pt	%xcc,	loop_1720
	bpos,a	loop_1721
	bneg	%xcc,	loop_1722
	fbo	%fcc2,	loop_1723
loop_1720:
	fnot2s	%f20,	%f11
loop_1721:
	orncc	%g4,	0x11BD,	%l2
loop_1722:
	nop
	wr	%g0,	0x11,	%asi
	stxa	%g7,	[%l7 + 0x18] %asi
loop_1723:
	movle	%icc,	%g5,	%l5
	and	%i6,	0x0F6F,	%i3
	movne	%icc,	%o5,	%g1
	andncc	%o7,	%l3,	%i4
	fmul8x16	%f27,	%f8,	%f18
	udiv	%i5,	0x1AD2,	%i7
	tvs	%xcc,	0x4
	xorcc	%g6,	%g2,	%o4
	or	%g3,	0x01EF,	%o6
	alignaddrl	%i2,	%i0,	%o1
	tsubcctv	%o0,	0x1AB6,	%l4
	edge8ln	%l6,	%l0,	%o2
	edge16n	%i1,	%l1,	%g4
	sra	%o3,	%l2,	%g7
	fmul8x16	%f20,	%f30,	%f22
	orn	%g5,	%i6,	%l5
	fpsub16	%f10,	%f0,	%f20
	add	%o5,	%g1,	%o7
	fblg,a	%fcc0,	loop_1724
	bne,a,pt	%xcc,	loop_1725
	fmovspos	%xcc,	%f5,	%f22
	andn	%i3,	0x196D,	%l3
loop_1724:
	nop
	set	0x0C, %l1
	ldswa	[%l7 + %l1] 0x14,	%i5
loop_1725:
	sdiv	%i7,	0x05DD,	%i4
	sdiv	%g6,	0x07C1,	%o4
	bgu,a	loop_1726
	edge32	%g3,	%o6,	%g2
	sdiv	%i0,	0x0BFD,	%i2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%o1,	%o0
loop_1726:
	and	%l4,	%l0,	%l6
	edge16n	%o2,	%i1,	%l1
	fxnors	%f29,	%f7,	%f30
	movvs	%xcc,	%o3,	%l2
	flush	%l7 + 0x1C
	fbug	%fcc0,	loop_1727
	fbge,a	%fcc1,	loop_1728
	movrgz	%g4,	%g7,	%i6
	umul	%l5,	%o5,	%g1
loop_1727:
	mulx	%g5,	0x1FAA,	%i3
loop_1728:
	movl	%xcc,	%l3,	%i5
	edge32n	%o7,	%i7,	%g6
	fmovscc	%icc,	%f3,	%f22
	sdiv	%i4,	0x0FCD,	%g3
	sra	%o4,	0x13,	%g2
	nop
	setx	0x65D9141364853D16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x94BC3D3E891BA787,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f22,	%f18
	fpsub32	%f10,	%f28,	%f28
	movrlez	%i0,	0x24A,	%o6
	umul	%i2,	%o0,	%l4
	ldx	[%l7 + 0x68],	%o1
	tn	%icc,	0x3
	tcs	%xcc,	0x6
	brgez	%l6,	loop_1729
	smul	%l0,	%i1,	%l1
	fmovsneg	%xcc,	%f30,	%f15
	movvc	%xcc,	%o3,	%o2
loop_1729:
	movrlez	%g4,	%g7,	%i6
	sra	%l5,	%l2,	%o5
	tcc	%xcc,	0x6
	orcc	%g1,	0x1467,	%g5
	fandnot2	%f10,	%f2,	%f8
	nop
	setx	loop_1730,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tne	%xcc,	0x6
	sllx	%l3,	0x12,	%i3
	tle	%xcc,	0x1
loop_1730:
	addcc	%i5,	0x05FB,	%o7
	stbar
	ble,pt	%xcc,	loop_1731
	srax	%g6,	0x01,	%i7
	edge8ln	%i4,	%g3,	%g2
	sra	%o4,	%o6,	%i0
loop_1731:
	udivcc	%i2,	0x185B,	%l4
	nop
	setx	0x8F173C825F547EEA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xBDFB0C0D2C0324F3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f6,	%f30
	fone	%f14
	alignaddrl	%o1,	%l6,	%o0
	fbe	%fcc1,	loop_1732
	fbge,a	%fcc0,	loop_1733
	fmovrsgz	%l0,	%f28,	%f28
	taddcctv	%l1,	0x036E,	%o3
loop_1732:
	tge	%xcc,	0x5
loop_1733:
	tg	%icc,	0x4
	set	0x22, %g1
	stha	%i1,	[%l7 + %g1] 0x27
	membar	#Sync
	sll	%g4,	0x0B,	%o2
	stb	%i6,	[%l7 + 0x3C]
	mulx	%g7,	%l2,	%l5
	nop
	setx	0x30986E09C96945DE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xEAA0C850E9205654,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f20,	%f14
	movleu	%xcc,	%o5,	%g5
	sll	%g1,	0x19,	%i3
	array32	%i5,	%o7,	%g6
	movcc	%xcc,	%i7,	%i4
	movneg	%icc,	%l3,	%g3
	edge16l	%g2,	%o4,	%o6
	tpos	%xcc,	0x0
	fmovrsgz	%i0,	%f18,	%f22
	movcs	%xcc,	%i2,	%o1
	edge16n	%l6,	%o0,	%l4
	tvc	%xcc,	0x7
	te	%icc,	0x6
	edge8ln	%l0,	%o3,	%i1
	popc	%l1,	%g4
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x18,	 0x1
	nop
	setx	0x1A95CCB49BC1207E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f14
	udiv	%o2,	0x0B67,	%l2
	brgez	%l5,	loop_1734
	umul	%o5,	0x1FF4,	%g7
	fmovrsne	%g5,	%f2,	%f16
	and	%g1,	0x043F,	%i3
loop_1734:
	tcs	%xcc,	0x7
	tvc	%icc,	0x7
	movpos	%icc,	%i5,	%g6
	stbar
	fcmpne16	%f14,	%f0,	%i7
	xor	%i4,	%o7,	%g3
	tne	%icc,	0x4
	movcc	%icc,	%l3,	%o4
	tg	%icc,	0x1
	subcc	%g2,	%i0,	%o6
	mulscc	%o1,	%l6,	%o0
	move	%icc,	%i2,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%l0,	loop_1735
	ldd	[%l7 + 0x28],	%f6
	tcc	%xcc,	0x3
	srlx	%o3,	0x1A,	%i1
loop_1735:
	tgu	%icc,	0x5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g4,	%l1
	bn,pt	%xcc,	loop_1736
	movne	%icc,	%o2,	%i6
	xor	%l2,	%o5,	%g7
	popc	0x02E9,	%g5
loop_1736:
	tsubcc	%l5,	%g1,	%i5
	movl	%icc,	%g6,	%i3
	fnor	%f8,	%f10,	%f2
	fpsub32	%f12,	%f18,	%f30
	fmovd	%f12,	%f22
	bl,a,pt	%icc,	loop_1737
	fnot2s	%f20,	%f19
	bvc	%xcc,	loop_1738
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f2
loop_1737:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i4,	0x03,	%i7
loop_1738:
	bge	loop_1739
	fands	%f6,	%f30,	%f3
	nop
	fitod	%f5,	%f12
	movg	%icc,	%o7,	%l3
loop_1739:
	addc	%o4,	%g2,	%i0
	tl	%icc,	0x4
	fmovdneg	%xcc,	%f8,	%f18
	nop
	setx	0xD450D9A3CC92CB4C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD50F56CA4DEADB16,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f6,	%f2
	fone	%f16
	mulx	%g3,	%o1,	%o6
	sub	%l6,	%o0,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l4,	%l0,	%i1
	move	%xcc,	%o3,	%l1
	fbge,a	%fcc2,	loop_1740
	movne	%icc,	%o2,	%g4
	fcmpne32	%f8,	%f26,	%l2
	set	0x78, %l0
	ldsha	[%l7 + %l0] 0x04,	%o5
loop_1740:
	fmovse	%xcc,	%f9,	%f28
	xnor	%g7,	%i6,	%l5
	xor	%g1,	0x0E16,	%g5
	fmovsa	%xcc,	%f25,	%f28
	sdivx	%i5,	0x0C5E,	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%i7
	movneg	%xcc,	%i3,	%o7
	ldsb	[%l7 + 0x0C],	%l3
	alignaddr	%g2,	%o4,	%g3
	movvc	%icc,	%i0,	%o6
	fmovsvs	%icc,	%f26,	%f17
	nop
	set	0x60, %o1
	std	%f16,	[%l7 + %o1]
	edge8l	%l6,	%o0,	%i2
	fmovsle	%xcc,	%f20,	%f23
	edge16ln	%o1,	%l4,	%i1
	smul	%o3,	0x0170,	%l0
	edge32n	%o2,	%g4,	%l2
	nop
	setx	loop_1741,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbne	%fcc2,	loop_1742
	movrlez	%o5,	0x107,	%g7
	umul	%l1,	0x0A58,	%l5
loop_1741:
	edge16l	%i6,	%g5,	%g1
loop_1742:
	nop
	set	0x30, %o5
	ldxa	[%g0 + %o5] 0x20,	%i5
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x24] %asi,	%i4
	or	%g6,	%i3,	%i7
	edge16	%l3,	%g2,	%o4
	fmovdgu	%xcc,	%f3,	%f26
	movrgez	%o7,	%g3,	%i0
	stx	%o6,	[%l7 + 0x68]
	fmovse	%icc,	%f6,	%f28
	orn	%l6,	0x0DBE,	%o0
	and	%i2,	0x1C5B,	%l4
	umulcc	%o1,	%i1,	%l0
	fnot2s	%f26,	%f27
	movvc	%xcc,	%o3,	%o2
	fpadd32	%f24,	%f12,	%f26
	fpsub32	%f20,	%f24,	%f10
	fcmpgt16	%f0,	%f20,	%g4
	xnorcc	%l2,	0x1F53,	%o5
	nop
	setx	0x0B45F5020DEC7102,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x0161785DE786F70A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f28,	%f20
	sra	%g7,	%l5,	%l1
	fbug	%fcc0,	loop_1743
	srlx	%g5,	0x0A,	%g1
	tg	%icc,	0x2
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
loop_1743:
	array32	%i5,	%g6,	%i3
	nop
	setx	0x6DA5E9BC606608C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i4,	%l3,	%i7
	fblg,a	%fcc3,	loop_1744
	tg	%xcc,	0x1
	tcc	%icc,	0x7
	fpsub32	%f12,	%f22,	%f10
loop_1744:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fpadd16	%f4,	%f26,	%f12
	bleu,a	loop_1745
	nop
	setx	0xF6E41BD3502AD196,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xFBCEEF9E0B9DB8EC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f2,	%f4
	fpadd32s	%f29,	%f1,	%f17
	nop
	set	0x59, %i5
	ldsb	[%l7 + %i5],	%g2
loop_1745:
	tcs	%xcc,	0x6
	tleu	%xcc,	0x3
	orcc	%o7,	%g3,	%o4
	fblg,a	%fcc3,	loop_1746
	movl	%icc,	%i0,	%l6
	xnorcc	%o0,	0x1BC0,	%i2
	fmovse	%icc,	%f27,	%f21
loop_1746:
	movpos	%xcc,	%l4,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o1,	0x168,	%l0
	stbar
	fnegs	%f26,	%f1
	edge16l	%o3,	%o2,	%i1
	edge32	%l2,	%o5,	%g4
	andn	%l5,	0x0258,	%l1
	fone	%f8
	andcc	%g5,	0x1DF6,	%g1
	sdiv	%i6,	0x0E0F,	%i5
	fmul8x16au	%f29,	%f21,	%f18
	fmovdl	%xcc,	%f24,	%f25
	fmovs	%f4,	%f4
	movcs	%xcc,	%g7,	%g6
	movrgz	%i3,	0x11C,	%i4
	bne,a	%xcc,	loop_1747
	fpsub32s	%f15,	%f22,	%f18
	fmovs	%f27,	%f30
	ldx	[%l7 + 0x60],	%i7
loop_1747:
	popc	%g2,	%l3
	edge32	%o7,	%o4,	%g3
	tpos	%icc,	0x1
	fxor	%f24,	%f4,	%f14
	fmovdl	%xcc,	%f14,	%f29
	fmovsge	%xcc,	%f6,	%f22
	tgu	%xcc,	0x3
	brz,a	%i0,	loop_1748
	array32	%o0,	%i2,	%l6
	ba,pt	%xcc,	loop_1749
	taddcctv	%o6,	%o1,	%l4
loop_1748:
	tpos	%xcc,	0x6
	sethi	0x00E2,	%l0
loop_1749:
	bvs,a	loop_1750
	lduh	[%l7 + 0x6A],	%o3
	alignaddrl	%i1,	%o2,	%o5
	bgu,a	loop_1751
loop_1750:
	nop
	set	0x30, %g3
	stw	%g4,	[%l7 + %g3]
	bshuffle	%f28,	%f4,	%f8
	nop
	setx	0x47807A095976687E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f24
loop_1751:
	edge8l	%l5,	%l2,	%g5
	fzero	%f26
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf8
	membar	#Sync
	or	%l1,	0x08DD,	%g1
	add	%i6,	%g7,	%g6
	movvc	%xcc,	%i5,	%i3
	array8	%i4,	%g2,	%i7
	move	%icc,	%l3,	%o4
	subc	%g3,	%i0,	%o0
	fmovdge	%xcc,	%f12,	%f9
	nop
	setx	0xCCA865A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xDCD3708E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f16,	%f17
	fbge	%fcc2,	loop_1752
	st	%f18,	[%l7 + 0x34]
	mulx	%o7,	0x0541,	%l6
	alignaddrl	%o6,	%o1,	%l4
loop_1752:
	movgu	%icc,	%l0,	%i2
	srl	%i1,	0x1B,	%o3
	sdivcc	%o5,	0x11DB,	%g4
	fmovs	%f9,	%f25
	fpack32	%f6,	%f0,	%f10
	movneg	%icc,	%o2,	%l5
	lduw	[%l7 + 0x08],	%g5
	fpack16	%f4,	%f10
	nop
	setx	loop_1753,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umulcc	%l2,	0x145F,	%l1
	fzero	%f18
	fbug	%fcc3,	loop_1754
loop_1753:
	brlez,a	%g1,	loop_1755
	addcc	%g7,	0x0FA6,	%i6
	movre	%i5,	%g6,	%i4
loop_1754:
	fmovdle	%xcc,	%f11,	%f2
loop_1755:
	movn	%xcc,	%i3,	%i7
	fpsub32	%f14,	%f2,	%f0
	and	%l3,	%g2,	%g3
	fmovdvs	%xcc,	%f27,	%f2
	set	0x0C, %i6
	sta	%f15,	[%l7 + %i6] 0x19
	edge32	%i0,	%o0,	%o7
	sllx	%l6,	0x0B,	%o6
	call	loop_1756
	subcc	%o1,	0x1282,	%l4
	brnz	%l0,	loop_1757
	bgu	%icc,	loop_1758
loop_1756:
	nop
	setx	0x605D696B,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	fmovdle	%icc,	%f27,	%f5
loop_1757:
	fandnot1	%f26,	%f22,	%f6
loop_1758:
	movpos	%icc,	%i2,	%i1
	movge	%xcc,	%o3,	%o4
	movvs	%icc,	%g4,	%o5
	mova	%xcc,	%o2,	%g5
	movrlz	%l2,	0x3AA,	%l1
	orncc	%l5,	%g1,	%g7
	andn	%i6,	%g6,	%i5
	addc	%i4,	%i7,	%l3
	fmul8sux16	%f30,	%f12,	%f8
	fmovsa	%xcc,	%f17,	%f11
	fandnot1	%f4,	%f12,	%f10
	tn	%xcc,	0x5
	fpsub32s	%f23,	%f14,	%f22
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	lduh	[%l7 + 0x6C],	%g3
	tneg	%icc,	0x3
	edge8l	%g2,	%o0,	%i0
	edge8	%o7,	%l6,	%o6
	sir	0x1C01
	movrgez	%l4,	0x3FB,	%l0
	tpos	%icc,	0x3
	fmovrse	%o1,	%f23,	%f10
	smul	%i2,	%i1,	%o3
	udiv	%o4,	0x1F3D,	%g4
	taddcctv	%o2,	0x086A,	%g5
	mova	%xcc,	%o5,	%l2
	bn,pn	%xcc,	loop_1759
	tn	%xcc,	0x6
	fsrc2s	%f0,	%f10
	fnot1s	%f7,	%f27
loop_1759:
	andncc	%l1,	%g1,	%g7
	fsrc2s	%f7,	%f20
	mulscc	%l5,	0x16D4,	%g6
	umul	%i5,	0x1D10,	%i4
	sth	%i6,	[%l7 + 0x4A]
	edge8ln	%i7,	%l3,	%i3
	fmovde	%icc,	%f6,	%f28
	fpsub16s	%f23,	%f14,	%f19
	smul	%g3,	%o0,	%i0
	tvc	%icc,	0x5
	fmovdg	%icc,	%f18,	%f7
	edge32	%g2,	%o7,	%l6
	movl	%icc,	%o6,	%l0
	nop
	setx	0x0B8A82E4806341E1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	popc	0x1A4B,	%o1
	xor	%l4,	0x0F32,	%i2
	tcs	%xcc,	0x4
	ta	%xcc,	0x6
	srl	%o3,	0x0A,	%i1
	fmovde	%xcc,	%f17,	%f10
	edge32ln	%g4,	%o2,	%g5
	st	%f2,	[%l7 + 0x3C]
	fmovsl	%icc,	%f9,	%f0
	fpadd32s	%f10,	%f17,	%f15
	movgu	%xcc,	%o5,	%l2
	addc	%l1,	%g1,	%g7
	fnors	%f14,	%f22,	%f18
	te	%icc,	0x2
	array32	%o4,	%g6,	%i5
	edge16ln	%i4,	%i6,	%l5
	alignaddr	%l3,	%i3,	%i7
	array8	%g3,	%o0,	%g2
	movrne	%o7,	%i0,	%o6
	nop
	setx	loop_1760,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsvs	%xcc,	%f11,	%f1
	add	%l0,	%o1,	%l6
	fandnot2	%f4,	%f26,	%f20
loop_1760:
	fmovdvc	%xcc,	%f24,	%f1
	movleu	%xcc,	%l4,	%i2
	fmul8sux16	%f30,	%f2,	%f22
	sub	%o3,	%i1,	%o2
	edge32	%g5,	%o5,	%l2
	edge16l	%l1,	%g1,	%g4
	nop
	setx	0xF092F386B049EAB5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fmovdge	%icc,	%f6,	%f4
	fmul8x16au	%f20,	%f20,	%f22
	brlz,a	%g7,	loop_1761
	fmovdgu	%xcc,	%f21,	%f18
	fnegs	%f19,	%f5
	movvc	%icc,	%o4,	%i5
loop_1761:
	movvs	%xcc,	%i4,	%g6
	fmuld8sux16	%f28,	%f4,	%f30
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x16
	membar	#Sync
	fbule	%fcc2,	loop_1762
	fpmerge	%f0,	%f2,	%f2
	fbul,a	%fcc3,	loop_1763
	sethi	0x15CE,	%i6
loop_1762:
	movleu	%xcc,	%l3,	%l5
	mulx	%i7,	%g3,	%i3
loop_1763:
	orn	%o0,	%g2,	%o7
	fpsub32	%f26,	%f28,	%f20
	fbn,a	%fcc3,	loop_1764
	array32	%i0,	%o6,	%l0
	movre	%o1,	%l4,	%i2
	mova	%icc,	%o3,	%i1
loop_1764:
	taddcctv	%o2,	0x0CB8,	%g5
	fmovdpos	%icc,	%f7,	%f10
	movre	%o5,	0x215,	%l2
	array8	%l6,	%l1,	%g4
	edge8	%g1,	%g7,	%o4
	movrgez	%i5,	0x3A6,	%g6
	nop
	setx	0xD6BEC25B10761A95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	pdist	%f2,	%f8,	%f22
	bcs,a,pn	%icc,	loop_1765
	brlez	%i6,	loop_1766
	sir	0x05E4
	fors	%f30,	%f22,	%f16
loop_1765:
	srax	%i4,	%l3,	%i7
loop_1766:
	movrgz	%l5,	0x1A0,	%g3
	brgz,a	%o0,	loop_1767
	andncc	%g2,	%o7,	%i3
	subc	%i0,	0x0994,	%o6
	nop
	setx	0x41D2ACD3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xEB205D9D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f20,	%f25
loop_1767:
	tpos	%icc,	0x2
	fbug	%fcc2,	loop_1768
	add	%o1,	0x046B,	%l0
	tvc	%icc,	0x2
	sethi	0x0091,	%i2
loop_1768:
	fnot1s	%f26,	%f28
	fcmpne16	%f20,	%f24,	%l4
	edge32n	%o3,	%o2,	%g5
	movleu	%xcc,	%i1,	%l2
	or	%l6,	%l1,	%g4
	tne	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x30] %asi,	%o5
	mulx	%g1,	%g7,	%i5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x10,	%o4,	%i6
	tl	%icc,	0x5
	smulcc	%i4,	%l3,	%g6
	add	%i7,	0x0EE6,	%l5
	movgu	%icc,	%g3,	%g2
	udivx	%o7,	0x01F9,	%o0
	tsubcctv	%i3,	0x0432,	%o6
	ba,a	loop_1769
	movrlez	%o1,	0x077,	%i0
	sdivcc	%l0,	0x0D5B,	%i2
	movl	%xcc,	%l4,	%o2
loop_1769:
	array8	%o3,	%i1,	%l2
	fornot2s	%f14,	%f2,	%f26
	nop
	setx	0x9DD74ECA80481A2A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	movvs	%xcc,	%l6,	%g5
	edge32ln	%l1,	%g4,	%g1
	tgu	%icc,	0x1
	fbge,a	%fcc2,	loop_1770
	tvc	%xcc,	0x2
	edge8	%o5,	%i5,	%g7
	movneg	%icc,	%i6,	%o4
loop_1770:
	fmovdneg	%icc,	%f8,	%f16
	sdivcc	%i4,	0x03D2,	%g6
	tle	%xcc,	0x4
	edge8n	%i7,	%l3,	%g3
	or	%l5,	%o7,	%g2
	movcc	%icc,	%o0,	%i3
	bvc	loop_1771
	membar	0x5D
	nop
	setx	0xA41BC0DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x6537B083,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f10,	%f26
	movgu	%xcc,	%o1,	%o6
loop_1771:
	movrne	%i0,	%i2,	%l0
	alignaddr	%o2,	%o3,	%i1
	brlez,a	%l2,	loop_1772
	orncc	%l6,	0x1AFC,	%l4
	nop
	fitos	%f30,	%f3
	fcmple16	%f12,	%f30,	%l1
loop_1772:
	popc	0x1649,	%g5
	set	0x50, %g6
	ldda	[%l7 + %g6] 0xe2,	%g4
	brgez,a	%g1,	loop_1773
	fbo	%fcc0,	loop_1774
	udivcc	%o5,	0x0CFB,	%i5
	nop
	fitod	%f2,	%f8
	fdtos	%f8,	%f7
loop_1773:
	stbar
loop_1774:
	nop
	setx	0xF041FDCC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	set	0x40, %i0
	stxa	%g7,	[%l7 + %i0] 0xea
	membar	#Sync
	movrne	%o4,	0x3DD,	%i4
	edge16	%i6,	%i7,	%l3
	fnegd	%f10,	%f20
	wr	%g0,	0xe2,	%asi
	stxa	%g3,	[%l7 + 0x20] %asi
	membar	#Sync
	smulcc	%g6,	%l5,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g2,	%i3,	%o0
	udivcc	%o1,	0x11CD,	%i0
	movrlez	%o6,	%l0,	%i2
	fones	%f3
	fcmple16	%f22,	%f0,	%o2
	edge16l	%o3,	%i1,	%l2
	tle	%xcc,	0x7
	tcc	%xcc,	0x3
	tpos	%xcc,	0x3
	orcc	%l4,	%l6,	%l1
	fmovsleu	%icc,	%f5,	%f14
	brgz	%g5,	loop_1775
	fmovscc	%xcc,	%f2,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%icc,	%f28,	%f11
loop_1775:
	fcmple16	%f30,	%f20,	%g4
	array8	%o5,	%g1,	%i5
	taddcctv	%g7,	%o4,	%i6
	tgu	%icc,	0x2
	fcmpeq32	%f22,	%f20,	%i7
	fmovrdgz	%i4,	%f0,	%f16
	swap	[%l7 + 0x40],	%l3
	addcc	%g6,	%l5,	%g3
	brnz,a	%o7,	loop_1776
	tl	%icc,	0x6
	ldd	[%l7 + 0x50],	%g2
	bgu	%xcc,	loop_1777
loop_1776:
	bcs,a,pn	%icc,	loop_1778
	ldx	[%l7 + 0x38],	%o0
	move	%xcc,	%i3,	%i0
loop_1777:
	nop
	setx loop_1779, %l0, %l1
	jmpl %l1, %o6
loop_1778:
	orcc	%o1,	%i2,	%l0
	fmul8sux16	%f4,	%f4,	%f0
	tsubcctv	%o3,	%o2,	%i1
loop_1779:
	tcs	%xcc,	0x0
	edge8n	%l4,	%l2,	%l6
	taddcctv	%g5,	%l1,	%o5
	tvs	%xcc,	0x2
	ldsh	[%l7 + 0x76],	%g4
	ld	[%l7 + 0x44],	%f4
	movrgez	%g1,	0x3B5,	%g7
	andncc	%i5,	%i6,	%o4
	brnz	%i7,	loop_1780
	movrgz	%l3,	%i4,	%g6
	nop
	fitos	%f9,	%f2
	fstoi	%f2,	%f14
	fzero	%f14
loop_1780:
	fmovrde	%l5,	%f6,	%f20
	array32	%g3,	%g2,	%o0
	andncc	%o7,	%i3,	%o6
	ldsh	[%l7 + 0x4C],	%i0
	tge	%icc,	0x1
	bl	%xcc,	loop_1781
	fcmpeq16	%f6,	%f18,	%o1
	alignaddrl	%i2,	%o3,	%l0
	st	%f9,	[%l7 + 0x10]
loop_1781:
	edge16l	%i1,	%o2,	%l4
	nop
	setx	0xFE1DA177941EE8AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x3ED8090850B84CE5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f2,	%f16
	movn	%icc,	%l2,	%g5
	set	0x38, %i3
	prefetcha	[%l7 + %i3] 0x15,	 0x1
	edge32ln	%o5,	%g4,	%l6
	fcmple16	%f4,	%f6,	%g7
	faligndata	%f4,	%f12,	%f10
	edge16l	%i5,	%g1,	%i6
	edge8l	%o4,	%i7,	%i4
	movrne	%g6,	0x202,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%xcc,	%f22,	%f7
	and	%g3,	%g2,	%o0
	movrlz	%o7,	0x141,	%i3
	orncc	%o6,	0x087B,	%i0
	movg	%xcc,	%l3,	%o1
	xnorcc	%i2,	%l0,	%i1
	tg	%xcc,	0x4
	tle	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f12,	%f26,	%o3
	edge8	%o2,	%l2,	%l4
	movge	%icc,	%l1,	%g5
	fornot1	%f0,	%f6,	%f20
	movle	%xcc,	%o5,	%l6
	movle	%icc,	%g7,	%g4
	nop
	setx loop_1782, %l0, %l1
	jmpl %l1, %i5
	sll	%g1,	%o4,	%i7
	andncc	%i4,	%g6,	%i6
	fexpand	%f10,	%f0
loop_1782:
	xnor	%g3,	%l5,	%o0
	sll	%g2,	%i3,	%o7
	addc	%i0,	0x13F0,	%l3
	nop
	setx	loop_1783,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot1s	%f25,	%f4
	edge32l	%o6,	%o1,	%i2
	brlez,a	%i1,	loop_1784
loop_1783:
	edge16ln	%l0,	%o2,	%l2
	addccc	%o3,	%l4,	%g5
	fbl,a	%fcc3,	loop_1785
loop_1784:
	andn	%l1,	0x142D,	%o5
	set	0x38, %g5
	stxa	%g7,	[%g0 + %g5] 0x4f
loop_1785:
	tleu	%icc,	0x3
	be,a,pn	%icc,	loop_1786
	nop
	setx	0xA5E21849,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x3E74D466,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f18,	%f7
	sllx	%g4,	0x09,	%i5
	fmovdgu	%xcc,	%f27,	%f8
loop_1786:
	tsubcc	%l6,	0x1C3D,	%o4
	edge32n	%i7,	%i4,	%g6
	andcc	%g1,	%i6,	%g3
	fble	%fcc0,	loop_1787
	nop
	setx loop_1788, %l0, %l1
	jmpl %l1, %l5
	fexpand	%f5,	%f18
	movrgez	%o0,	0x0F3,	%g2
loop_1787:
	brnz	%o7,	loop_1789
loop_1788:
	srax	%i3,	0x18,	%i0
	tge	%icc,	0x0
	swap	[%l7 + 0x70],	%o6
loop_1789:
	tsubcctv	%l3,	%i2,	%o1
	udivx	%i1,	0x05F1,	%l0
	fnegd	%f26,	%f10
	tleu	%icc,	0x2
	orn	%o2,	%o3,	%l2
	fnegd	%f12,	%f12
	andncc	%l4,	%l1,	%o5
	nop
	fitos	%f3,	%f6
	fstod	%f6,	%f24
	tle	%xcc,	0x3
	bpos,pt	%icc,	loop_1790
	edge16	%g7,	%g5,	%i5
	pdist	%f6,	%f28,	%f22
	movcs	%icc,	%g4,	%l6
loop_1790:
	array32	%i7,	%i4,	%g6
	tne	%icc,	0x1
	set	0x210, %l5
	ldxa	[%g0 + %l5] 0x52,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i6,	0x0CD5,	%g3
	ld	[%l7 + 0x70],	%f3
	move	%icc,	%l5,	%o0
	fands	%f19,	%f12,	%f5
	membar	0x49
	add	%g1,	0x0828,	%g2
	set	0x54, %o6
	swapa	[%l7 + %o6] 0x04,	%o7
	addcc	%i0,	%i3,	%o6
	fpadd16	%f16,	%f20,	%f24
	edge16n	%i2,	%o1,	%i1
	movl	%icc,	%l3,	%l0
	sdivx	%o3,	0x19DF,	%l2
	tgu	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l4,	%l1
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x6C] %asi,	%o2
	subccc	%g7,	%g5,	%o5
	fpsub32s	%f27,	%f11,	%f7
	edge32ln	%g4,	%i5,	%l6
	nop
	setx	0xB63D891D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xF0808295,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f8,	%f10
	edge8ln	%i7,	%g6,	%i4
	xorcc	%o4,	0x1332,	%g3
	sllx	%i6,	%l5,	%o0
	te	%xcc,	0x2
	movcc	%xcc,	%g2,	%g1
	tvc	%icc,	0x4
	popc	0x1D73,	%i0
	edge8l	%i3,	%o7,	%o6
	fxnor	%f20,	%f4,	%f28
	ta	%xcc,	0x1
	edge8n	%i2,	%i1,	%l3
	array8	%o1,	%l0,	%o3
	movrgez	%l2,	%l4,	%o2
	set	0x38, %i2
	ldsba	[%l7 + %i2] 0x19,	%l1
	brlez	%g5,	loop_1791
	nop
	set	0x48, %l2
	ldsw	[%l7 + %l2],	%o5
	movvc	%icc,	%g4,	%g7
	orncc	%l6,	%i7,	%g6
loop_1791:
	tneg	%xcc,	0x6
	tg	%xcc,	0x5
	ld	[%l7 + 0x50],	%f2
	fmovdleu	%xcc,	%f21,	%f31
	bgu,pt	%icc,	loop_1792
	movneg	%xcc,	%i4,	%i5
	sdiv	%g3,	0x0B19,	%o4
	sethi	0x179B,	%i6
loop_1792:
	edge16	%o0,	%l5,	%g1
	std	%f18,	[%l7 + 0x18]
	movneg	%xcc,	%i0,	%i3
	bcs,a	%icc,	loop_1793
	fbn	%fcc3,	loop_1794
	fpackfix	%f10,	%f7
	or	%o7,	0x0082,	%g2
loop_1793:
	subc	%o6,	%i1,	%i2
loop_1794:
	fbue	%fcc2,	loop_1795
	edge8	%l3,	%o1,	%l0
	brnz,a	%l2,	loop_1796
	xorcc	%o3,	%l4,	%l1
loop_1795:
	fmuld8ulx16	%f1,	%f24,	%f30
	tneg	%icc,	0x6
loop_1796:
	tsubcctv	%g5,	%o2,	%g4
	nop
	setx	0x00498DF0,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%o5
	nop
	setx	0x4D57055F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x4E88E65E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f10,	%f4
	tvs	%icc,	0x6
	movrne	%l6,	0x1CC,	%i7
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x6C] %asi,	%f6
	alignaddrl	%g7,	%i4,	%i5
	fmovsvs	%xcc,	%f30,	%f31
	movgu	%icc,	%g6,	%g3
	wr	%g0,	0x19,	%asi
	stba	%i6,	[%l7 + 0x7D] %asi
	subc	%o0,	0x0248,	%o4
	fbuge,a	%fcc0,	loop_1797
	fpadd32s	%f12,	%f18,	%f30
	edge32n	%g1,	%i0,	%i3
	set	0x7C, %o3
	lduba	[%l7 + %o3] 0x14,	%o7
loop_1797:
	movleu	%icc,	%l5,	%o6
	set	0x78, %g2
	ldswa	[%l7 + %g2] 0x10,	%i1
	movleu	%icc,	%i2,	%l3
	te	%icc,	0x5
	fmovsge	%icc,	%f4,	%f14
	udivx	%g2,	0x111E,	%o1
	set	0x10, %o0
	stxa	%l2,	[%l7 + %o0] 0x2f
	membar	#Sync
	movcc	%icc,	%o3,	%l0
	fmovs	%f22,	%f30
	brz,a	%l1,	loop_1798
	sdivx	%g5,	0x1A3C,	%o2
	fbe	%fcc2,	loop_1799
	pdist	%f0,	%f24,	%f18
loop_1798:
	fpadd32s	%f15,	%f4,	%f12
	edge32	%l4,	%o5,	%l6
loop_1799:
	tcs	%xcc,	0x2
	fnor	%f16,	%f28,	%f4
	subc	%i7,	0x18A9,	%g7
	set	0x2E, %l3
	lduha	[%l7 + %l3] 0x10,	%g4
	xnor	%i4,	0x006E,	%i5
	nop
	setx	0xC987CF6F4BB2A0A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f28
	tle	%icc,	0x5
	membar	0x60
	set	0x10, %o7
	lduwa	[%l7 + %o7] 0x04,	%g3
	edge16ln	%i6,	%g6,	%o4
	bcs	loop_1800
	umulcc	%o0,	0x0188,	%g1
	fbn,a	%fcc2,	loop_1801
	srlx	%i3,	%i0,	%o7
loop_1800:
	alignaddrl	%o6,	%l5,	%i1
	movpos	%xcc,	%l3,	%g2
loop_1801:
	nop
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	ble,a	%xcc,	loop_1802
	movl	%icc,	%o1,	%i2
	fornot1s	%f9,	%f16,	%f19
	srax	%l2,	0x1C,	%o3
loop_1802:
	movle	%icc,	%l1,	%l0
	fmovsgu	%xcc,	%f26,	%f29
	set	0x13, %i1
	ldsba	[%l7 + %i1] 0x0c,	%o2
	stx	%g5,	[%l7 + 0x70]
	fmovrse	%o5,	%f20,	%f8
	movleu	%icc,	%l6,	%l4
	xor	%g7,	0x0AB2,	%i7
	movle	%icc,	%g4,	%i5
	sdivcc	%i4,	0x1B2E,	%i6
	addc	%g6,	%o4,	%g3
	taddcctv	%o0,	%i3,	%g1
	tvc	%icc,	0x3
	fmovsvc	%icc,	%f22,	%f7
	addc	%o7,	%i0,	%l5
	orn	%o6,	0x0602,	%l3
	move	%icc,	%g2,	%o1
	bgu	loop_1803
	srlx	%i1,	%i2,	%l2
	tleu	%icc,	0x7
	fmovdl	%xcc,	%f3,	%f17
loop_1803:
	srl	%o3,	0x14,	%l0
	fmul8ulx16	%f26,	%f30,	%f8
	subcc	%l1,	0x1CF5,	%o2
	srl	%g5,	0x04,	%o5
	bleu,a	%icc,	loop_1804
	nop
	setx	loop_1805,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%l4,	%g7,	%l6
	sdivcc	%g4,	0x0A30,	%i7
loop_1804:
	membar	0x06
loop_1805:
	udivx	%i5,	0x086F,	%i4
	fmovsg	%xcc,	%f12,	%f31
	movvs	%xcc,	%g6,	%i6
	sllx	%o4,	0x1E,	%g3
	movrgz	%o0,	%g1,	%i3
	nop
	setx	0xEC73C385,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xBCF8C237,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f15,	%f25
	taddcc	%o7,	%l5,	%i0
	array16	%l3,	%g2,	%o1
	edge16	%i1,	%o6,	%l2
	udiv	%i2,	0x18F5,	%l0
	bvs,a	loop_1806
	movn	%icc,	%l1,	%o2
	edge32n	%g5,	%o3,	%l4
	alignaddr	%o5,	%l6,	%g4
loop_1806:
	fmovsl	%icc,	%f12,	%f21
	fbl	%fcc2,	loop_1807
	sir	0x0A85
	ldsw	[%l7 + 0x60],	%i7
	subc	%i5,	0x058C,	%g7
loop_1807:
	nop
	wr	%g0,	0x0c,	%asi
	stxa	%g6,	[%l7 + 0x30] %asi
	and	%i6,	%o4,	%i4
	tleu	%icc,	0x4
	fxnors	%f3,	%f4,	%f27
	fmovsle	%xcc,	%f19,	%f21
	subc	%o0,	0x191D,	%g3
	sra	%g1,	0x02,	%o7
	call	loop_1808
	mova	%xcc,	%i3,	%i0
	orcc	%l5,	0x1B19,	%g2
	movn	%icc,	%l3,	%o1
loop_1808:
	prefetch	[%l7 + 0x30],	 0x0
	movcc	%icc,	%o6,	%i1
	addccc	%i2,	%l2,	%l1
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	orncc	%l0,	0x19BF,	%g5
	fmovsa	%xcc,	%f13,	%f14
	fcmpgt32	%f24,	%f12,	%o2
	edge32	%l4,	%o3,	%l6
	movge	%icc,	%o5,	%g4
	nop
	setx	0x27D91B83,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x1ADF2C55,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f2,	%f20
	fmovrdgz	%i7,	%f12,	%f12
	nop
	setx	0xA0577BCF,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	srax	%g7,	0x15,	%i5
	tge	%xcc,	0x3
	nop
	fitos	%f13,	%f13
	fstod	%f13,	%f30
	bneg,pn	%icc,	loop_1809
	sll	%i6,	0x12,	%g6
	sll	%i4,	0x01,	%o4
	fsrc2	%f24,	%f0
loop_1809:
	call	loop_1810
	fmovrde	%g3,	%f20,	%f30
	array32	%o0,	%o7,	%g1
	xnor	%i0,	%l5,	%g2
loop_1810:
	sll	%i3,	0x07,	%o1
	edge8ln	%l3,	%i1,	%i2
	addcc	%o6,	0x07D8,	%l1
	alignaddrl	%l0,	%l2,	%g5
	te	%icc,	0x1
	ta	%icc,	0x3
	movre	%o2,	%l4,	%o3
	fcmple16	%f24,	%f4,	%l6
	fmovsgu	%icc,	%f30,	%f10
	nop
	setx loop_1811, %l0, %l1
	jmpl %l1, %o5
	fbo,a	%fcc3,	loop_1812
	fmovdn	%icc,	%f14,	%f15
	fmul8x16au	%f26,	%f5,	%f16
loop_1811:
	addc	%i7,	%g7,	%i5
loop_1812:
	fmovdg	%xcc,	%f3,	%f22
	edge16	%g4,	%i6,	%g6
	be,a	%xcc,	loop_1813
	fpmerge	%f17,	%f13,	%f2
	fbo	%fcc2,	loop_1814
	alignaddrl	%o4,	%g3,	%o0
loop_1813:
	brlez,a	%o7,	loop_1815
	array32	%i4,	%g1,	%i0
loop_1814:
	fmovrdlez	%g2,	%f20,	%f14
	xnorcc	%l5,	%o1,	%i3
loop_1815:
	movn	%icc,	%i1,	%i2
	call	loop_1816
	sdiv	%l3,	0x14DB,	%o6
	fsrc1s	%f25,	%f4
	movne	%xcc,	%l1,	%l0
loop_1816:
	tleu	%xcc,	0x3
	fcmpeq32	%f28,	%f10,	%g5
	xnorcc	%l2,	%l4,	%o3
	fornot1s	%f14,	%f0,	%f13
	fbne,a	%fcc1,	loop_1817
	movgu	%xcc,	%o2,	%l6
	bvc,a,pn	%xcc,	loop_1818
	ldd	[%l7 + 0x68],	%f0
loop_1817:
	bcc,a	%xcc,	loop_1819
	fbul	%fcc2,	loop_1820
loop_1818:
	movrgz	%o5,	%i7,	%g7
	tvs	%icc,	0x0
loop_1819:
	movl	%xcc,	%i5,	%i6
loop_1820:
	edge32l	%g4,	%o4,	%g3
	fpadd32s	%f17,	%f13,	%f22
	fands	%f9,	%f30,	%f21
	movgu	%icc,	%o0,	%o7
	fbue	%fcc2,	loop_1821
	movneg	%icc,	%g6,	%g1
	brlez	%i4,	loop_1822
	subc	%i0,	%g2,	%l5
loop_1821:
	brgz	%i3,	loop_1823
	alignaddr	%i1,	%i2,	%o1
loop_1822:
	fmovda	%xcc,	%f10,	%f25
	fmovdvs	%xcc,	%f15,	%f7
loop_1823:
	fmovrse	%l3,	%f23,	%f24
	andncc	%l1,	%o6,	%l0
	fbule	%fcc3,	loop_1824
	addcc	%l2,	%g5,	%l4
	movcs	%icc,	%o2,	%l6
	ldd	[%l7 + 0x78],	%f2
loop_1824:
	add	%o3,	0x1488,	%i7
	mova	%icc,	%o5,	%i5
	tleu	%xcc,	0x0
	udiv	%g7,	0x1D7F,	%g4
	movneg	%icc,	%o4,	%i6
	edge32	%g3,	%o7,	%g6
	udiv	%o0,	0x0C8A,	%i4
	ld	[%l7 + 0x14],	%f20
	nop
	setx	0x8907F3A1C01E1B7C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x6EF027D04552E22C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f28,	%f14
	nop
	setx	0x12F33572,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f18
	ldsh	[%l7 + 0x68],	%g1
	srlx	%i0,	0x16,	%l5
	bg,pn	%icc,	loop_1825
	call	loop_1826
	orcc	%g2,	%i1,	%i2
	movrlz	%i3,	%o1,	%l3
loop_1825:
	mulx	%o6,	%l1,	%l2
loop_1826:
	edge32ln	%l0,	%g5,	%l4
	movcs	%icc,	%l6,	%o3
	lduh	[%l7 + 0x2A],	%o2
	fba	%fcc0,	loop_1827
	srl	%o5,	%i7,	%i5
	udivcc	%g7,	0x0845,	%o4
	edge32l	%i6,	%g4,	%g3
loop_1827:
	fcmpeq16	%f28,	%f2,	%g6
	ldsb	[%l7 + 0x6E],	%o7
	stx	%o0,	[%l7 + 0x20]
	movrgez	%i4,	0x316,	%g1
	brnz,a	%i0,	loop_1828
	edge8n	%l5,	%i1,	%g2
	bcs,pn	%icc,	loop_1829
	movcs	%xcc,	%i3,	%i2
loop_1828:
	fcmpne16	%f24,	%f14,	%o1
	fmul8sux16	%f12,	%f10,	%f10
loop_1829:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l3,	%l1
	fmovsge	%xcc,	%f17,	%f11
	edge8	%l2,	%o6,	%g5
	fzeros	%f23
	fmovdleu	%xcc,	%f17,	%f6
	movge	%xcc,	%l4,	%l0
	edge16l	%l6,	%o2,	%o3
	tpos	%xcc,	0x2
	movpos	%icc,	%i7,	%i5
	taddcc	%o5,	0x0075,	%o4
	movn	%icc,	%g7,	%g4
	std	%f10,	[%l7 + 0x60]
	fcmpgt16	%f2,	%f14,	%g3
	fblg,a	%fcc3,	loop_1830
	fbne	%fcc3,	loop_1831
	movl	%icc,	%i6,	%o7
	fmovrdne	%g6,	%f2,	%f26
loop_1830:
	edge16	%i4,	%g1,	%o0
loop_1831:
	fsrc1s	%f19,	%f11
	movvc	%xcc,	%l5,	%i1
	fpack16	%f10,	%f28
	movpos	%xcc,	%g2,	%i3
	andncc	%i2,	%i0,	%o1
	tcs	%xcc,	0x1
	movl	%icc,	%l1,	%l2
	fba,a	%fcc1,	loop_1832
	fmovse	%icc,	%f16,	%f14
	fmovdgu	%icc,	%f31,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1832:
	srax	%l3,	0x0C,	%g5
	tsubcctv	%o6,	%l4,	%l0
	call	loop_1833
	tvc	%icc,	0x7
	fpackfix	%f4,	%f21
	fbue,a	%fcc2,	loop_1834
loop_1833:
	sdivx	%o2,	0x017F,	%l6
	movneg	%xcc,	%i7,	%o3
	xor	%o5,	0x1F18,	%o4
loop_1834:
	fmovdvs	%xcc,	%f21,	%f28
	movg	%icc,	%g7,	%g4
	fmovscs	%xcc,	%f21,	%f5
	fcmple32	%f20,	%f12,	%i5
	tg	%icc,	0x4
	addc	%i6,	%o7,	%g3
	tleu	%xcc,	0x3
	tle	%xcc,	0x0
	tsubcctv	%i4,	%g6,	%o0
	sllx	%l5,	0x0C,	%g1
	fmovsge	%icc,	%f13,	%f8
	fmovrdne	%g2,	%f8,	%f20
	srl	%i3,	0x04,	%i1
	sll	%i0,	%i2,	%o1
	tpos	%icc,	0x7
	taddcctv	%l2,	%l3,	%g5
	addcc	%o6,	%l1,	%l4
	mova	%xcc,	%l0,	%l6
	brlez	%i7,	loop_1835
	orncc	%o2,	0x0E6A,	%o5
	set	0x50, %o4
	ldstuba	[%l7 + %o4] 0x81,	%o4
loop_1835:
	taddcctv	%o3,	0x081D,	%g7
	movl	%icc,	%g4,	%i6
	edge32l	%i5,	%g3,	%i4
	tcs	%icc,	0x1
	fsrc1s	%f12,	%f20
	stb	%o7,	[%l7 + 0x50]
	andcc	%o0,	0x0AC2,	%g6
	sth	%l5,	[%l7 + 0x70]
	stx	%g1,	[%l7 + 0x28]
	addccc	%i3,	0x01DA,	%i1
	edge8	%i0,	%g2,	%i2
	srl	%o1,	0x04,	%l3
	fmovdvc	%icc,	%f31,	%f10
	ldub	[%l7 + 0x39],	%g5
	ldx	[%l7 + 0x68],	%l2
	tneg	%icc,	0x4
	fcmpne16	%f2,	%f18,	%o6
	tpos	%xcc,	0x0
	set	0x60, %l4
	lda	[%l7 + %l4] 0x11,	%f16
	fpadd16	%f18,	%f20,	%f30
	tgu	%xcc,	0x6
	mova	%xcc,	%l1,	%l4
	udivx	%l0,	0x10E7,	%l6
	edge16ln	%i7,	%o2,	%o5
	lduh	[%l7 + 0x5C],	%o4
	sethi	0x03F4,	%o3
	movleu	%icc,	%g7,	%g4
	bgu,pn	%icc,	loop_1836
	edge32ln	%i5,	%i6,	%i4
	srlx	%o7,	%o0,	%g3
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f30
	fxtod	%f30,	%f12
loop_1836:
	edge8ln	%l5,	%g6,	%g1
	nop
	setx	0x646B3FB6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f20
	popc	%i1,	%i0
	movrne	%g2,	0x1EC,	%i3
	tl	%icc,	0x1
	smul	%i2,	0x07DA,	%o1
	nop
	fitos	%f10,	%f21
	fstod	%f21,	%f16
	fcmpgt32	%f18,	%f10,	%g5
	xorcc	%l2,	%l3,	%l1
	sll	%o6,	0x0B,	%l0
	fpsub16	%f2,	%f0,	%f24
	tle	%icc,	0x5
	srlx	%l4,	0x1E,	%i7
	umulcc	%l6,	%o2,	%o4
	tvc	%icc,	0x4
	tl	%xcc,	0x5
	be,a	loop_1837
	edge32n	%o5,	%o3,	%g7
	sdivcc	%i5,	0x0FDB,	%i6
	sdivx	%g4,	0x1081,	%i4
loop_1837:
	sra	%o7,	%g3,	%l5
	edge32	%o0,	%g1,	%i1
	set	0x27, %g4
	stba	%i0,	[%l7 + %g4] 0x27
	membar	#Sync
	edge32	%g2,	%i3,	%g6
	fmul8x16al	%f17,	%f1,	%f6
	tne	%xcc,	0x0
	edge8l	%i2,	%o1,	%l2
	nop
	fitod	%f12,	%f28
	fdtoi	%f28,	%f26
	sth	%l3,	[%l7 + 0x74]
	ble,a	%xcc,	loop_1838
	tcs	%icc,	0x5
	bl,pn	%xcc,	loop_1839
	subc	%g5,	%l1,	%o6
loop_1838:
	brlez,a	%l0,	loop_1840
	stx	%l4,	[%l7 + 0x18]
loop_1839:
	fmul8x16au	%f19,	%f7,	%f16
	bn,a,pn	%xcc,	loop_1841
loop_1840:
	xor	%i7,	0x0DE4,	%o2
	edge8	%o4,	%l6,	%o5
	movleu	%icc,	%o3,	%i5
loop_1841:
	fmovdg	%icc,	%f17,	%f10
	edge32	%i6,	%g7,	%i4
	andn	%g4,	0x083F,	%g3
	bpos,pn	%icc,	loop_1842
	ldsh	[%l7 + 0x18],	%o7
	bg,pn	%icc,	loop_1843
	movle	%xcc,	%l5,	%o0
loop_1842:
	fnors	%f3,	%f8,	%f30
	set	0x70, %o2
	stxa	%i1,	[%l7 + %o2] 0x04
loop_1843:
	fmovrdlez	%i0,	%f16,	%f10
	srlx	%g2,	%g1,	%i3
	fmovdg	%xcc,	%f6,	%f25
	addc	%g6,	%i2,	%l2
	taddcc	%l3,	0x1686,	%g5
	fbuge,a	%fcc2,	loop_1844
	fmul8sux16	%f20,	%f24,	%f16
	bg,pn	%xcc,	loop_1845
	bcs,pn	%icc,	loop_1846
loop_1844:
	sir	0x1EF5
	fxor	%f6,	%f22,	%f26
loop_1845:
	movneg	%xcc,	%o1,	%l1
loop_1846:
	ble,pn	%xcc,	loop_1847
	tpos	%xcc,	0x1
	srlx	%o6,	0x10,	%l0
	tn	%icc,	0x6
loop_1847:
	nop
	set	0x10, %l6
	ldsha	[%l7 + %l6] 0x0c,	%l4
	mulx	%o2,	%o4,	%l6
	movgu	%xcc,	%o5,	%i7
	ble,pn	%xcc,	loop_1848
	bvs	%xcc,	loop_1849
	fornot1	%f26,	%f18,	%f10
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x22] %asi,	%i5
loop_1848:
	sdiv	%o3,	0x1F47,	%g7
loop_1849:
	sllx	%i4,	0x09,	%g4
	smul	%g3,	%i6,	%o7
	tg	%xcc,	0x0
	movrlz	%l5,	%i1,	%i0
	edge16l	%o0,	%g2,	%g1
	andcc	%i3,	%i2,	%g6
	stw	%l3,	[%l7 + 0x08]
	movvs	%icc,	%l2,	%o1
	fmovrsgz	%l1,	%f13,	%f7
	orncc	%g5,	0x10A4,	%l0
	movcs	%xcc,	%o6,	%o2
	subc	%o4,	%l4,	%l6
	bvc,pn	%xcc,	loop_1850
	ldd	[%l7 + 0x58],	%i6
	nop
	setx	0x011A1EFA3B43412D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x2C5F90069E4FC1D6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f4,	%f24
	set	0x43, %g1
	ldstuba	[%l7 + %g1] 0x0c,	%o5
loop_1850:
	fmul8ulx16	%f20,	%f10,	%f30
	edge8l	%o3,	%i5,	%i4
	array16	%g4,	%g3,	%i6
	fmovdge	%icc,	%f4,	%f1
	edge32	%g7,	%o7,	%l5
	edge16	%i1,	%o0,	%i0
	addccc	%g2,	0x1FD3,	%g1
	andcc	%i2,	0x09FE,	%g6
	udivcc	%i3,	0x0B4F,	%l3
	tne	%icc,	0x1
	fpackfix	%f12,	%f0
	srlx	%l2,	0x02,	%l1
	array16	%o1,	%g5,	%o6
	be,pt	%icc,	loop_1851
	addccc	%l0,	%o4,	%l4
	tn	%xcc,	0x1
	nop
	setx	0x6CEAAC4D60610194,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_1851:
	array32	%o2,	%i7,	%o5
	fmovdvs	%icc,	%f23,	%f10
	umul	%o3,	%l6,	%i5
	fmovdg	%xcc,	%f2,	%f17
	array16	%g4,	%i4,	%i6
	ldub	[%l7 + 0x5F],	%g3
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xe2,	%g6
	movrne	%o7,	0x093,	%i1
	lduw	[%l7 + 0x4C],	%l5
	edge16ln	%i0,	%o0,	%g1
	taddcctv	%g2,	%i2,	%i3
	movrlz	%g6,	0x260,	%l2
	addccc	%l1,	0x0D65,	%l3
	lduh	[%l7 + 0x64],	%o1
	fbge,a	%fcc2,	loop_1852
	movvs	%xcc,	%o6,	%g5
	edge16n	%o4,	%l4,	%o2
	umulcc	%i7,	%l0,	%o3
loop_1852:
	smul	%l6,	0x0E2C,	%i5
	mova	%icc,	%o5,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%icc,	%f21,	%f20
	movvs	%xcc,	%i6,	%g3
	edge16	%i4,	%g7,	%o7
	tcc	%xcc,	0x4
	tleu	%xcc,	0x1
	movcs	%xcc,	%i1,	%l5
	set	0x16, %l1
	stha	%o0,	[%l7 + %l1] 0x81
	sir	0x1194
	brnz,a	%g1,	loop_1853
	edge32l	%g2,	%i2,	%i0
	nop
	fitos	%f3,	%f16
	fstod	%f16,	%f4
	movge	%icc,	%g6,	%l2
loop_1853:
	nop
	set	0x20, %o1
	ldxa	[%l7 + %o1] 0x88,	%i3
	udivx	%l1,	0x18D5,	%l3
	addccc	%o1,	%o6,	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x0c,	%o4,	%o2
	edge8n	%l4,	%i7,	%o3
	edge32n	%l0,	%i5,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a	loop_1854
	prefetch	[%l7 + 0x34],	 0x2
	movrlez	%g4,	%i6,	%g3
	edge32	%l6,	%i4,	%g7
loop_1854:
	fbe	%fcc1,	loop_1855
	nop
	setx	0xDD1AFC82B9B66231,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xD550DC3F6570AA40,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f26,	%f2
	ldsh	[%l7 + 0x0A],	%o7
	bcc,a,pn	%xcc,	loop_1856
loop_1855:
	umul	%i1,	%o0,	%l5
	add	%g1,	0x1AC8,	%i2
	tcs	%icc,	0x6
loop_1856:
	srlx	%g2,	%i0,	%g6
	tne	%icc,	0x5
	alignaddrl	%i3,	%l1,	%l2
	tsubcc	%o1,	0x159D,	%o6
	fmul8x16	%f17,	%f16,	%f20
	nop
	setx	0x2B0D73B95066E2B8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	brgez,a	%g5,	loop_1857
	mulscc	%o4,	0x1CF1,	%l3
	fcmpeq16	%f14,	%f10,	%o2
	alignaddr	%l4,	%i7,	%o3
loop_1857:
	nop
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xea,	%i4
	fbue	%fcc0,	loop_1858
	bpos,a,pt	%xcc,	loop_1859
	brgz,a	%l0,	loop_1860
	subc	%o5,	%i6,	%g4
loop_1858:
	fandnot2	%f0,	%f4,	%f2
loop_1859:
	srax	%l6,	%g3,	%g7
loop_1860:
	fmovdcs	%icc,	%f7,	%f23
	tge	%xcc,	0x5
	fpsub16	%f24,	%f0,	%f30
	udivx	%i4,	0x0DE0,	%i1
	ld	[%l7 + 0x2C],	%f16
	fmovscs	%xcc,	%f24,	%f11
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o0
	ta	%icc,	0x0
	movre	%o7,	%l5,	%g1
	orncc	%g2,	0x05B8,	%i2
	udivx	%i0,	0x1EF4,	%g6
	edge16n	%i3,	%l2,	%l1
	sub	%o1,	0x03FC,	%o6
	edge16ln	%o4,	%g5,	%l3
	nop
	fitos	%f28,	%f6
	set	0x60, %i5
	ldswa	[%l7 + %i5] 0x11,	%l4
	fbuge	%fcc2,	loop_1861
	tle	%icc,	0x5
	movcs	%icc,	%o2,	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i5,	%o3
loop_1861:
	movg	%xcc,	%o5,	%l0
	stb	%i6,	[%l7 + 0x60]
	edge32	%g4,	%g3,	%l6
	array32	%g7,	%i4,	%o0
	srl	%i1,	%o7,	%g1
	tgu	%xcc,	0x0
	smul	%l5,	%i2,	%i0
	bcs,a,pt	%icc,	loop_1862
	ld	[%l7 + 0x08],	%f4
	addcc	%g2,	%g6,	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x81,	%l2,	%l1
loop_1862:
	stw	%o1,	[%l7 + 0x78]
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	srax	%o4,	0x0F,	%o6
	bg	loop_1863
	sub	%l3,	%g5,	%l4
	sdivx	%i7,	0x03BD,	%o2
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x46] %asi,	%i5
loop_1863:
	nop
	setx	0x70EB452B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x91FF0AB1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f5,	%f5
	lduw	[%l7 + 0x1C],	%o5
	addc	%o3,	%l0,	%g4
	fsrc2	%f20,	%f24
	membar	0x3A
	xorcc	%g3,	0x1C40,	%i6
	mova	%icc,	%l6,	%i4
	lduw	[%l7 + 0x24],	%g7
	movgu	%icc,	%o0,	%o7
	fbl,a	%fcc3,	loop_1864
	fbe,a	%fcc1,	loop_1865
	tcs	%icc,	0x5
	edge8l	%g1,	%l5,	%i1
loop_1864:
	srl	%i0,	0x0C,	%g2
loop_1865:
	stx	%g6,	[%l7 + 0x18]
	subcc	%i2,	%i3,	%l2
	fble	%fcc1,	loop_1866
	tpos	%xcc,	0x6
	udivx	%o1,	0x0448,	%l1
	movrlz	%o6,	%o4,	%g5
loop_1866:
	nop
	set	0x30, %l0
	stba	%l4,	[%l7 + %l0] 0x80
	movneg	%icc,	%l3,	%i7
	fbo,a	%fcc1,	loop_1867
	std	%f20,	[%l7 + 0x10]
	srax	%o2,	0x07,	%i5
	bge,pn	%icc,	loop_1868
loop_1867:
	movcs	%xcc,	%o3,	%o5
	bcs	loop_1869
	movpos	%xcc,	%g4,	%g3
loop_1868:
	movle	%xcc,	%l0,	%l6
	sllx	%i4,	0x17,	%i6
loop_1869:
	subcc	%o0,	%o7,	%g1
	fba,a	%fcc1,	loop_1870
	umul	%l5,	0x04F0,	%g7
	fzeros	%f15
	movleu	%xcc,	%i0,	%i1
loop_1870:
	lduh	[%l7 + 0x7A],	%g6
	fmovsvs	%xcc,	%f23,	%f14
	for	%f6,	%f8,	%f0
	tpos	%xcc,	0x3
	fbl,a	%fcc1,	loop_1871
	faligndata	%f14,	%f0,	%f2
	andcc	%i2,	0x00A8,	%i3
	bneg,a,pt	%icc,	loop_1872
loop_1871:
	fmovdne	%icc,	%f14,	%f22
	pdist	%f14,	%f8,	%f16
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%f24
loop_1872:
	flush	%l7 + 0x28
	sdivx	%g2,	0x0C52,	%l2
	tcc	%icc,	0x6
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
	fmovsne	%xcc,	%f10,	%f24
	movg	%xcc,	%l1,	%o1
	bn,pt	%icc,	loop_1874
loop_1873:
	or	%o6,	0x0945,	%o4
	edge16l	%l4,	%g5,	%l3
	srlx	%i7,	0x1E,	%i5
loop_1874:
	fnands	%f27,	%f1,	%f25
	tneg	%xcc,	0x1
	edge16n	%o2,	%o5,	%o3
	te	%xcc,	0x0
	bcs,a	loop_1875
	alignaddrl	%g4,	%l0,	%g3
	edge32	%i4,	%i6,	%o0
	xnor	%o7,	%l6,	%l5
loop_1875:
	movpos	%xcc,	%g1,	%g7
	set	0x20, %i6
	sta	%f3,	[%l7 + %i6] 0x0c
	andncc	%i0,	%g6,	%i2
	sll	%i3,	%g2,	%l2
	swap	[%l7 + 0x60],	%l1
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
	movl	%xcc,	%i1,	%o1
	fnand	%f26,	%f6,	%f26
	wr	%g0,	0xe2,	%asi
	stwa	%o6,	[%l7 + 0x78] %asi
	membar	#Sync
	movvs	%xcc,	%o4,	%g5
	fmovda	%icc,	%f0,	%f8
	stbar
	fxnor	%f2,	%f0,	%f16
	bg,a	loop_1876
	movn	%xcc,	%l4,	%i7
	fmovrdlz	%i5,	%f10,	%f30
	srlx	%l3,	%o2,	%o3
loop_1876:
	sdivx	%g4,	0x07FB,	%l0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x17] %asi,	%g3
	nop
	fitod	%f6,	%f26
	fdtos	%f26,	%f10
	xor	%i4,	0x15E4,	%o5
	movre	%o0,	%o7,	%l6
	udivcc	%l5,	0x14FB,	%g1
	fmovrdgez	%g7,	%f6,	%f14
	andcc	%i0,	%g6,	%i6
	membar	0x32
	fmul8x16au	%f17,	%f12,	%f8
	ldsw	[%l7 + 0x30],	%i2
	edge8l	%g2,	%i3,	%l1
	fpadd32s	%f23,	%f9,	%f2
	andcc	%l2,	%i1,	%o6
	for	%f4,	%f6,	%f6
	movrne	%o4,	0x1B8,	%g5
	nop
	fitos	%f0,	%f9
	fstod	%f9,	%f22
	nop
	setx	0xE5DE73CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x5B5272F7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f1,	%f31
	subccc	%o1,	%l4,	%i7
	mova	%icc,	%l3,	%o2
	umulcc	%i5,	0x1D4C,	%o3
	membar	0x7D
	sdiv	%g4,	0x16C8,	%l0
	fands	%f23,	%f23,	%f23
	fpsub16	%f14,	%f28,	%f12
	tle	%icc,	0x6
	edge16	%i4,	%g3,	%o5
	ldsw	[%l7 + 0x64],	%o7
	nop
	setx	0x0235A467,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f16
	edge32l	%l6,	%o0,	%l5
	tneg	%xcc,	0x2
	fmul8ulx16	%f6,	%f30,	%f22
	fbg,a	%fcc1,	loop_1877
	movge	%xcc,	%g7,	%g1
	add	%g6,	%i0,	%i6
	xnor	%i2,	%g2,	%i3
loop_1877:
	andncc	%l1,	%i1,	%l2
	movge	%xcc,	%o4,	%o6
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f26
	fxtod	%f26,	%f20
	fbge	%fcc1,	loop_1878
	mova	%xcc,	%g5,	%l4
	tsubcctv	%i7,	0x0D35,	%l3
	movpos	%xcc,	%o2,	%i5
loop_1878:
	movvs	%xcc,	%o1,	%o3
	alignaddrl	%g4,	%i4,	%g3
	smul	%l0,	%o7,	%l6
	udiv	%o5,	0x0C30,	%l5
	call	loop_1879
	fmovde	%icc,	%f26,	%f13
	tcs	%icc,	0x5
	nop
	setx	0xA7410975,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x5F631CD9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f6,	%f3
loop_1879:
	fmovsvs	%icc,	%f27,	%f2
	movne	%xcc,	%o0,	%g1
	edge32n	%g7,	%g6,	%i0
	stb	%i6,	[%l7 + 0x7C]
	movrlz	%i2,	%i3,	%l1
	popc	0x1A92,	%g2
	tgu	%xcc,	0x3
	fmovscs	%icc,	%f30,	%f15
	membar	0x00
	mulx	%i1,	0x148F,	%o4
	movcs	%xcc,	%l2,	%g5
	fpsub32s	%f10,	%f17,	%f16
	orn	%o6,	%l4,	%i7
	movrgz	%l3,	%i5,	%o1
	movre	%o2,	0x296,	%o3
	tsubcc	%g4,	%g3,	%l0
	bleu,a,pn	%xcc,	loop_1880
	fbne,a	%fcc2,	loop_1881
	fbg,a	%fcc2,	loop_1882
	alignaddrl	%i4,	%l6,	%o5
loop_1880:
	udivx	%o7,	0x0448,	%l5
loop_1881:
	subccc	%g1,	0x1333,	%o0
loop_1882:
	fabsd	%f4,	%f24
	tvs	%icc,	0x1
	set	0x78, %g7
	stwa	%g7,	[%l7 + %g7] 0x80
	fmul8sux16	%f28,	%f6,	%f28
	tge	%xcc,	0x2
	brz	%i0,	loop_1883
	mova	%xcc,	%g6,	%i2
	umulcc	%i3,	0x10CD,	%i6
	fpadd32	%f22,	%f10,	%f22
loop_1883:
	fmovsneg	%xcc,	%f29,	%f30
	edge32n	%l1,	%i1,	%g2
	nop
	setx	0xE0773E2E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xE025D910,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f28,	%f10
	fxor	%f30,	%f20,	%f18
	bleu	%icc,	loop_1884
	fmovdpos	%xcc,	%f9,	%f5
	edge8l	%l2,	%o4,	%o6
	membar	0x0A
loop_1884:
	movgu	%xcc,	%l4,	%i7
	movrgez	%g5,	0x124,	%l3
	nop
	fitod	%f10,	%f24
	fdtoi	%f24,	%f8
	brgz,a	%i5,	loop_1885
	te	%xcc,	0x4
	fpack32	%f8,	%f18,	%f26
	array8	%o1,	%o3,	%o2
loop_1885:
	alignaddr	%g3,	%l0,	%g4
	fones	%f8
	brnz,a	%i4,	loop_1886
	taddcc	%o5,	0x0CF7,	%o7
	membar	0x41
	edge8n	%l5,	%g1,	%l6
loop_1886:
	stx	%g7,	[%l7 + 0x18]
	movle	%icc,	%o0,	%i0
	fmovrdlz	%i2,	%f22,	%f12
	fmul8x16	%f27,	%f12,	%f0
	tneg	%xcc,	0x6
	set	0x24, %g6
	sta	%f0,	[%l7 + %g6] 0x04
	bcc,pt	%xcc,	loop_1887
	tleu	%icc,	0x5
	fbe	%fcc3,	loop_1888
	tgu	%icc,	0x7
loop_1887:
	ld	[%l7 + 0x3C],	%f1
	fzero	%f4
loop_1888:
	edge8l	%g6,	%i3,	%l1
	edge8ln	%i1,	%g2,	%i6
	set	0x70, %g3
	lda	[%l7 + %g3] 0x80,	%f1
	sethi	0x15D3,	%l2
	srl	%o4,	%o6,	%i7
	fmovrdgz	%g5,	%f14,	%f26
	ble,pn	%xcc,	loop_1889
	fbn,a	%fcc0,	loop_1890
	prefetch	[%l7 + 0x68],	 0x2
	ldsw	[%l7 + 0x4C],	%l4
loop_1889:
	nop
	set	0x08, %i0
	ldswa	[%l7 + %i0] 0x15,	%l3
loop_1890:
	fmovrdlz	%o1,	%f2,	%f16
	smulcc	%i5,	0x1802,	%o3
	movle	%icc,	%g3,	%o2
	umulcc	%g4,	%l0,	%o5
	fabsd	%f2,	%f12
	sethi	0x0FFC,	%i4
	tl	%xcc,	0x4
	fnot1	%f2,	%f14
	set	0x47, %i3
	ldsba	[%l7 + %i3] 0x81,	%l5
	smul	%o7,	%l6,	%g7
	umulcc	%o0,	0x179C,	%g1
	fnand	%f12,	%f16,	%f28
	fmovrdne	%i2,	%f12,	%f24
	movrlz	%g6,	0x02D,	%i0
	sethi	0x0E36,	%i3
	xor	%l1,	0x18DD,	%i1
	ta	%icc,	0x6
	sdivx	%g2,	0x07DE,	%l2
	ldd	[%l7 + 0x48],	%o4
	movleu	%icc,	%i6,	%i7
	sra	%o6,	%l4,	%g5
	tn	%xcc,	0x0
	tn	%xcc,	0x4
	movcc	%xcc,	%o1,	%l3
	tn	%icc,	0x5
	fandnot1s	%f9,	%f30,	%f13
	sth	%i5,	[%l7 + 0x46]
	bg,a	loop_1891
	movgu	%icc,	%g3,	%o2
	bvs,pn	%xcc,	loop_1892
	ldd	[%l7 + 0x48],	%f26
loop_1891:
	orcc	%g4,	0x17BB,	%l0
	xnor	%o3,	0x0559,	%i4
loop_1892:
	tsubcc	%l5,	0x1D18,	%o5
	fnors	%f26,	%f11,	%f30
	ba	%xcc,	loop_1893
	edge16	%o7,	%g7,	%l6
	srlx	%o0,	0x14,	%g1
	fmovrsgez	%g6,	%f19,	%f16
loop_1893:
	fbge,a	%fcc0,	loop_1894
	tsubcc	%i2,	%i0,	%i3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7E] %asi,	%i1
loop_1894:
	udiv	%l1,	0x0804,	%l2
	srlx	%o4,	0x08,	%i6
	edge16ln	%i7,	%g2,	%o6
	movrlez	%l4,	%g5,	%l3
	fxnor	%f16,	%f10,	%f16
	fors	%f9,	%f22,	%f12
	umul	%i5,	%o1,	%o2
	movrlez	%g4,	0x3C2,	%l0
	srlx	%g3,	%i4,	%o3
	fpsub32s	%f8,	%f11,	%f12
	fsrc2s	%f5,	%f29
	ta	%icc,	0x2
	tl	%icc,	0x7
	fble	%fcc2,	loop_1895
	faligndata	%f26,	%f24,	%f6
	set	0x64, %g5
	lduwa	[%l7 + %g5] 0x81,	%o5
loop_1895:
	fandnot1s	%f22,	%f11,	%f13
	tcc	%icc,	0x1
	mulscc	%l5,	0x0692,	%o7
	addc	%g7,	%l6,	%g1
	movcc	%xcc,	%o0,	%g6
	xor	%i0,	%i2,	%i1
	fmovdgu	%xcc,	%f9,	%f15
	srlx	%i3,	0x0E,	%l2
	movne	%icc,	%o4,	%i6
	fmovrslez	%l1,	%f18,	%f2
	bl,a	loop_1896
	addcc	%i7,	0x053E,	%g2
	fmul8ulx16	%f18,	%f18,	%f26
	sir	0x0E51
loop_1896:
	bge,pn	%xcc,	loop_1897
	bvc	%icc,	loop_1898
	edge16	%l4,	%g5,	%l3
	fmovdl	%icc,	%f10,	%f25
loop_1897:
	smulcc	%o6,	0x05C4,	%o1
loop_1898:
	membar	0x1F
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x64] %asi,	%o2
	membar	0x56
	tle	%icc,	0x6
	edge16ln	%g4,	%i5,	%g3
	fors	%f7,	%f20,	%f9
	movrgez	%i4,	%o3,	%l0
	addccc	%o5,	%l5,	%o7
	set	0x33, %l5
	ldsba	[%l7 + %l5] 0x0c,	%g7
	movrlez	%l6,	0x27F,	%o0
	move	%icc,	%g6,	%g1
	faligndata	%f18,	%f28,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc0,	loop_1899
	fble	%fcc1,	loop_1900
	sll	%i0,	%i2,	%i1
	tpos	%icc,	0x4
loop_1899:
	ld	[%l7 + 0x50],	%f27
loop_1900:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	tne	%icc,	0x3
	movpos	%xcc,	%i3,	%i6
	edge32ln	%o4,	%l1,	%g2
	fbge,a	%fcc3,	loop_1901
	subc	%l4,	0x0626,	%g5
	movrlz	%l3,	0x0B3,	%i7
	sll	%o6,	0x19,	%o2
loop_1901:
	addc	%g4,	0x004F,	%o1
	movvs	%xcc,	%i5,	%i4
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x16
	membar	#Sync
	ldstub	[%l7 + 0x47],	%g3
	bne	%icc,	loop_1902
	tsubcctv	%o3,	0x026F,	%l0
	brlz,a	%o5,	loop_1903
	array32	%l5,	%o7,	%l6
loop_1902:
	movn	%icc,	%g7,	%o0
	fbo	%fcc2,	loop_1904
loop_1903:
	orn	%g1,	0x0723,	%i0
	tne	%xcc,	0x6
	fandnot1	%f24,	%f18,	%f16
loop_1904:
	nop
	set	0x50, %o6
	stxa	%g6,	[%l7 + %o6] 0xe2
	membar	#Sync
	movre	%i1,	0x2E2,	%l2
	fmovrde	%i3,	%f14,	%f18
	umulcc	%i6,	0x0BBD,	%o4
	fmovse	%xcc,	%f8,	%f23
	smul	%l1,	%i2,	%l4
	nop
	setx	0xA76827555BB4B6C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD0FA7C0CCC3B79F6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f22,	%f10
	edge8l	%g2,	%l3,	%i7
	movcs	%icc,	%g5,	%o2
	smul	%o6,	%g4,	%i5
	fbe,a	%fcc3,	loop_1905
	srax	%i4,	0x1E,	%g3
	edge32n	%o3,	%o1,	%o5
	fornot1s	%f22,	%f16,	%f14
loop_1905:
	fmul8x16al	%f14,	%f26,	%f20
	popc	%l5,	%l0
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x7B] %asi,	%o7
	bneg,a	loop_1906
	mulscc	%g7,	%l6,	%o0
	fandnot1s	%f0,	%f28,	%f9
	tpos	%xcc,	0x2
loop_1906:
	tleu	%xcc,	0x6
	be,pn	%xcc,	loop_1907
	flush	%l7 + 0x3C
	subc	%g1,	%g6,	%i0
	sub	%l2,	0x09D4,	%i1
loop_1907:
	movvc	%icc,	%i3,	%o4
	set	0x70, %l2
	ldsha	[%l7 + %l2] 0x18,	%l1
	array8	%i2,	%i6,	%l4
	tne	%xcc,	0x0
	ldx	[%l7 + 0x08],	%g2
	movleu	%icc,	%i7,	%l3
	fbo,a	%fcc3,	loop_1908
	movn	%icc,	%o2,	%g5
	fmovsgu	%xcc,	%f8,	%f27
	lduh	[%l7 + 0x7A],	%o6
loop_1908:
	fmovrdgez	%g4,	%f28,	%f26
	movrgz	%i4,	0x086,	%g3
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x40] %asi,	%o3
	movg	%icc,	%i5,	%o1
	xnorcc	%l5,	0x015A,	%l0
	tsubcctv	%o7,	%g7,	%l6
	membar	0x60
	smulcc	%o5,	%g1,	%o0
	sir	0x10B6
	fabss	%f3,	%f23
	set	0x78, %g2
	sta	%f22,	[%l7 + %g2] 0x88
	or	%g6,	0x0FD2,	%i0
	tcc	%xcc,	0x2
	array16	%l2,	%i1,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x63],	%l1
	ldub	[%l7 + 0x7F],	%i2
	tg	%xcc,	0x7
	subc	%i6,	%i3,	%l4
	fmul8x16	%f13,	%f26,	%f28
	movgu	%xcc,	%g2,	%i7
	xnor	%o2,	0x1F49,	%l3
	nop
	setx	0xB7BAEDB4304A10AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	edge16l	%o6,	%g5,	%i4
	tle	%icc,	0x5
	fcmpgt16	%f18,	%f20,	%g4
	sdiv	%g3,	0x1FB8,	%o3
	fbug,a	%fcc2,	loop_1909
	fornot2s	%f10,	%f6,	%f4
	edge8ln	%o1,	%l5,	%i5
	stx	%l0,	[%l7 + 0x70]
loop_1909:
	taddcc	%g7,	%l6,	%o5
	fone	%f28
	addc	%o7,	0x1847,	%o0
	fbuge	%fcc1,	loop_1910
	tneg	%xcc,	0x5
	movrne	%g1,	0x127,	%g6
	set	0x0E, %o0
	lduha	[%l7 + %o0] 0x88,	%i0
loop_1910:
	fxors	%f11,	%f29,	%f14
	fcmpgt32	%f12,	%f2,	%l2
	smul	%o4,	%l1,	%i1
	alignaddr	%i2,	%i3,	%l4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sll	%i6,	%i7,	%o2
	andn	%l3,	0x0B64,	%g2
	alignaddrl	%o6,	%i4,	%g5
	sdivx	%g3,	0x0D9F,	%g4
	taddcctv	%o3,	%o1,	%l5
	tcc	%xcc,	0x0
	fpadd32s	%f20,	%f15,	%f24
	tgu	%xcc,	0x2
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x89,	%i5,	%l0
	movgu	%xcc,	%l6,	%g7
	sethi	0x1A59,	%o5
	fmovdcs	%icc,	%f16,	%f30
	xor	%o0,	0x003C,	%g1
	smul	%g6,	%o7,	%l2
	fcmpeq32	%f8,	%f16,	%i0
	fmovsne	%icc,	%f3,	%f18
	taddcc	%l1,	0x07A4,	%o4
	movg	%xcc,	%i2,	%i3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i1,	%l4
	movge	%icc,	%i7,	%i6
	nop
	setx	0x35BE6B68,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x19F5394E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f26,	%f22
	addcc	%l3,	0x14A4,	%o2
	movre	%o6,	0x12B,	%i4
	movcc	%xcc,	%g2,	%g3
	fmovdneg	%xcc,	%f13,	%f14
	fmovscs	%xcc,	%f30,	%f12
	bgu	%xcc,	loop_1911
	nop
	set	0x08, %l3
	lduw	[%l7 + %l3],	%g5
	be,pt	%icc,	loop_1912
	edge8ln	%o3,	%o1,	%l5
loop_1911:
	nop
	setx	0xE31E6A71,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x0FDB585A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f30,	%f2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x40] %asi,	%g4
loop_1912:
	sdivx	%i5,	0x1625,	%l6
	fmovdpos	%icc,	%f3,	%f13
	fmovdl	%icc,	%f11,	%f20
	movneg	%xcc,	%g7,	%o5
	fnand	%f28,	%f6,	%f18
	tsubcc	%l0,	%o0,	%g6
	movrlz	%g1,	0x3C1,	%l2
	addc	%i0,	0x01F3,	%o7
	alignaddr	%o4,	%i2,	%l1
	movvs	%icc,	%i1,	%l4
	tle	%xcc,	0x2
	nop
	setx	0xB91B0BF718E953D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xF504B8729F01049D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f2,	%f30
	tleu	%icc,	0x3
	edge16ln	%i7,	%i6,	%i3
	edge8l	%l3,	%o6,	%i4
	subccc	%g2,	0x0C4D,	%o2
	edge8ln	%g5,	%g3,	%o1
	movre	%l5,	0x29F,	%g4
	fnor	%f18,	%f22,	%f4
	tvs	%icc,	0x0
	movn	%icc,	%o3,	%i5
	sll	%l6,	%o5,	%g7
	addcc	%o0,	0x0006,	%l0
	fmovdl	%icc,	%f26,	%f0
	bneg	loop_1913
	nop
	setx	0x673C0B3725B63898,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xFFED0C6C2ADDCCE2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f26,	%f4
	fcmple32	%f30,	%f2,	%g1
	wr	%g0,	0x89,	%asi
	stwa	%g6,	[%l7 + 0x1C] %asi
loop_1913:
	ld	[%l7 + 0x24],	%f19
	set	0x10, %o7
	prefetcha	[%l7 + %o7] 0x80,	 0x1
	set	0x20, %i1
	ldsha	[%l7 + %i1] 0x80,	%l2
	and	%o7,	%i2,	%o4
	ldstub	[%l7 + 0x74],	%i1
	fabss	%f16,	%f8
	fand	%f28,	%f20,	%f30
	te	%icc,	0x2
	fbuge,a	%fcc0,	loop_1914
	stb	%l1,	[%l7 + 0x30]
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x0c,	 0x2
loop_1914:
	udivx	%i7,	0x1A2F,	%i6
	ble,a	loop_1915
	movrlez	%l3,	0x22D,	%i3
	move	%icc,	%i4,	%g2
	fbl	%fcc1,	loop_1916
loop_1915:
	ldub	[%l7 + 0x23],	%o2
	fcmpne32	%f22,	%f10,	%g5
	edge32n	%o6,	%g3,	%l5
loop_1916:
	popc	%o1,	%o3
	fzero	%f10
	array8	%g4,	%i5,	%l6
	addccc	%g7,	%o0,	%l0
	popc	%o5,	%g1
	tgu	%xcc,	0x2
	sub	%g6,	%i0,	%o7
	fcmpgt16	%f2,	%f0,	%i2
	brnz	%o4,	loop_1917
	stbar
	array32	%l2,	%i1,	%l4
	bg	loop_1918
loop_1917:
	fbue,a	%fcc1,	loop_1919
	tgu	%xcc,	0x6
	srax	%i7,	%i6,	%l1
loop_1918:
	udivcc	%i3,	0x147F,	%l3
loop_1919:
	fmul8ulx16	%f22,	%f6,	%f26
	tsubcctv	%i4,	0x0128,	%o2
	tcs	%icc,	0x1
	bpos,a	loop_1920
	udiv	%g2,	0x0221,	%g5
	tsubcc	%o6,	0x10DB,	%l5
	movcs	%xcc,	%g3,	%o1
loop_1920:
	xnorcc	%g4,	%i5,	%l6
	fornot1	%f14,	%f4,	%f20
	tne	%icc,	0x7
	srlx	%g7,	0x05,	%o3
	nop
	fitos	%f13,	%f23
	fstoi	%f23,	%f5
	fbuge	%fcc2,	loop_1921
	fcmpeq32	%f22,	%f26,	%l0
	ld	[%l7 + 0x40],	%f31
	fbne,a	%fcc2,	loop_1922
loop_1921:
	tvs	%icc,	0x0
	xnor	%o0,	0x14E7,	%o5
	wr	%g0,	0x18,	%asi
	stwa	%g6,	[%l7 + 0x20] %asi
loop_1922:
	orncc	%i0,	%g1,	%i2
	fabss	%f6,	%f11
	nop
	fitos	%f13,	%f5
	fstox	%f5,	%f12
	fxtos	%f12,	%f22
	fmovrslez	%o4,	%f18,	%f5
	brlez	%o7,	loop_1923
	bn	loop_1924
	nop
	setx	0x20F6C078,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f28
	tpos	%xcc,	0x6
loop_1923:
	edge8n	%l2,	%l4,	%i7
loop_1924:
	ba,a,pn	%icc,	loop_1925
	bneg,a	loop_1926
	array32	%i1,	%l1,	%i6
	nop
	setx	0xADCD1C81,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f10
loop_1925:
	edge8n	%l3,	%i4,	%i3
loop_1926:
	xnorcc	%g2,	0x1BE2,	%g5
	fnot1	%f0,	%f12
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x4D] %asi,	%o6
	fnors	%f4,	%f22,	%f16
	mulscc	%l5,	%o2,	%o1
	fmovsl	%xcc,	%f22,	%f4
	fcmpne16	%f22,	%f6,	%g3
	brgz	%g4,	loop_1927
	fabss	%f24,	%f11
	fbe,a	%fcc3,	loop_1928
	movpos	%icc,	%i5,	%l6
loop_1927:
	nop
	fitod	%f10,	%f20
	fdtoi	%f20,	%f27
	nop
	setx loop_1929, %l0, %l1
	jmpl %l1, %g7
loop_1928:
	nop
	setx	0x1395E3A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x305BF852,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f9,	%f13
	fbul	%fcc2,	loop_1930
	bcs,pt	%xcc,	loop_1931
loop_1929:
	fxnor	%f8,	%f12,	%f14
	ldub	[%l7 + 0x63],	%o3
loop_1930:
	move	%icc,	%o0,	%l0
loop_1931:
	faligndata	%f2,	%f10,	%f24
	udivx	%g6,	0x1FCA,	%o5
	umulcc	%g1,	0x1301,	%i0
	movleu	%xcc,	%i2,	%o7
	prefetch	[%l7 + 0x0C],	 0x2
	nop
	setx	0xC04145FF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x96457AE7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f22,	%f25
	fpack32	%f2,	%f2,	%f4
	udivcc	%o4,	0x164F,	%l4
	fmovda	%icc,	%f14,	%f23
	andcc	%l2,	0x04C4,	%i7
	and	%l1,	%i1,	%l3
	edge16n	%i6,	%i4,	%i3
	tcc	%xcc,	0x7
	sdivcc	%g2,	0x039A,	%g5
	fmovsneg	%xcc,	%f19,	%f19
	movrlz	%o6,	%o2,	%l5
	nop
	setx loop_1932, %l0, %l1
	jmpl %l1, %o1
	bshuffle	%f22,	%f22,	%f22
	stbar
	orn	%g4,	0x0933,	%i5
loop_1932:
	edge16n	%g3,	%g7,	%l6
	fbn,a	%fcc1,	loop_1933
	nop
	setx	0xF05395C8,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	tl	%xcc,	0x7
	bg,a,pt	%xcc,	loop_1934
loop_1933:
	subccc	%o3,	%o0,	%l0
	xnor	%o5,	%g6,	%i0
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x6D] %asi,	%g1
loop_1934:
	alignaddr	%i2,	%o7,	%o4
	st	%f1,	[%l7 + 0x64]
	tleu	%xcc,	0x2
	fpsub32	%f2,	%f4,	%f2
	andcc	%l4,	0x1D21,	%i7
	movrne	%l2,	%l1,	%l3
	bl,a	%xcc,	loop_1935
	movleu	%xcc,	%i6,	%i4
	fxors	%f5,	%f25,	%f19
	fbl	%fcc2,	loop_1936
loop_1935:
	brgez	%i1,	loop_1937
	ldsw	[%l7 + 0x38],	%g2
	subccc	%g5,	%o6,	%i3
loop_1936:
	fbul,a	%fcc1,	loop_1938
loop_1937:
	edge16	%l5,	%o1,	%g4
	tn	%icc,	0x6
	tle	%xcc,	0x6
loop_1938:
	orn	%i5,	0x170B,	%g3
	xor	%o2,	0x0C45,	%l6
	movg	%xcc,	%g7,	%o3
	orn	%l0,	0x0182,	%o5
	nop
	setx	0x0FCFB700F045C8CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	movne	%icc,	%g6,	%i0
	bge,a,pt	%xcc,	loop_1939
	subccc	%g1,	%o0,	%i2
	and	%o7,	%l4,	%i7
	subcc	%o4,	0x1684,	%l1
loop_1939:
	call	loop_1940
	movrgz	%l2,	0x2C7,	%l3
	brnz,a	%i4,	loop_1941
	subcc	%i6,	0x0860,	%g2
loop_1940:
	fmovrdgez	%i1,	%f30,	%f14
	std	%f20,	[%l7 + 0x70]
loop_1941:
	fcmple32	%f22,	%f20,	%o6
	movrgz	%g5,	%i3,	%o1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%l5
	ble	%icc,	loop_1942
	fmovd	%f18,	%f10
	movrgz	%g3,	%i5,	%l6
	addcc	%g7,	%o2,	%o3
loop_1942:
	sir	0x1699
	sllx	%l0,	%g6,	%i0
	srl	%o5,	%g1,	%o0
	ld	[%l7 + 0x50],	%f10
	movge	%icc,	%i2,	%l4
	umul	%i7,	0x04D0,	%o4
	movcc	%icc,	%l1,	%l2
	fpmerge	%f30,	%f26,	%f26
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l3
	tg	%icc,	0x6
	stx	%o7,	[%l7 + 0x68]
	sra	%i4,	0x00,	%g2
	tcc	%xcc,	0x2
	stw	%i6,	[%l7 + 0x7C]
	set	0x50, %l4
	stxa	%i1,	[%l7 + %l4] 0x2f
	membar	#Sync
	alignaddr	%g5,	%o6,	%i3
	add	%g4,	0x09E3,	%l5
	array8	%g3,	%i5,	%l6
	fandnot2s	%f21,	%f21,	%f2
	fmovsn	%icc,	%f1,	%f24
	bvc,pn	%icc,	loop_1943
	fbe,a	%fcc1,	loop_1944
	nop
	setx	0x482BA4293794DE59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xD5602B5FA96DB98C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f8,	%f18
	fmovsne	%icc,	%f0,	%f25
loop_1943:
	movne	%icc,	%o1,	%g7
loop_1944:
	fmovdcc	%icc,	%f20,	%f4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%l0
	lduh	[%l7 + 0x0E],	%o3
	edge16l	%g6,	%i0,	%o5
	tle	%icc,	0x2
	movre	%g1,	%i2,	%o0
	fnegd	%f28,	%f8
	movleu	%xcc,	%l4,	%o4
	movneg	%xcc,	%i7,	%l2
	movrgz	%l1,	0x069,	%l3
	sdiv	%o7,	0x0970,	%g2
	nop
	fitos	%f9,	%f21
	fstox	%f21,	%f30
	nop
	setx	0xC0CC861E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x16BBDE99,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f7,	%f15
	fnot2s	%f31,	%f24
	movleu	%icc,	%i6,	%i1
	sllx	%i4,	0x15,	%o6
	tsubcctv	%g5,	%i3,	%g4
	tge	%icc,	0x0
	tcs	%icc,	0x6
	movre	%g3,	%l5,	%l6
	and	%i5,	%g7,	%o1
	addccc	%l0,	%o3,	%o2
	addccc	%g6,	%o5,	%g1
	nop
	setx loop_1945, %l0, %l1
	jmpl %l1, %i0
	ble,pt	%icc,	loop_1946
	movle	%icc,	%i2,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1945:
	ldsw	[%l7 + 0x74],	%l4
loop_1946:
	bg,a	%icc,	loop_1947
	tleu	%icc,	0x7
	alignaddrl	%o4,	%i7,	%l1
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x16,	%f16
loop_1947:
	lduh	[%l7 + 0x70],	%l2
	bpos,pt	%xcc,	loop_1948
	edge8	%o7,	%l3,	%i6
	bgu	%icc,	loop_1949
	orcc	%i1,	0x1712,	%g2
loop_1948:
	fbul,a	%fcc0,	loop_1950
	edge16l	%i4,	%g5,	%o6
loop_1949:
	udivcc	%i3,	0x0738,	%g4
	lduw	[%l7 + 0x40],	%g3
loop_1950:
	fba	%fcc0,	loop_1951
	tle	%icc,	0x6
	fmovrdlez	%l5,	%f0,	%f28
	tn	%xcc,	0x0
loop_1951:
	sethi	0x0470,	%i5
	sub	%g7,	%l6,	%l0
	edge8ln	%o3,	%o2,	%g6
	fmovscs	%icc,	%f24,	%f25
	fexpand	%f17,	%f18
	st	%f26,	[%l7 + 0x08]
	movrgez	%o5,	0x2D1,	%g1
	set	0x10, %o2
	swapa	[%l7 + %o2] 0x11,	%i0
	movl	%xcc,	%o1,	%i2
	andn	%o0,	%l4,	%o4
	movvs	%xcc,	%i7,	%l2
	ldx	[%l7 + 0x08],	%o7
	array8	%l3,	%i6,	%i1
	movg	%xcc,	%l1,	%i4
	fmovrdne	%g5,	%f12,	%f28
	smul	%o6,	%g2,	%i3
	bge	loop_1952
	fmovsl	%icc,	%f22,	%f0
	edge16n	%g3,	%g4,	%l5
	fmovdn	%icc,	%f14,	%f29
loop_1952:
	bshuffle	%f6,	%f0,	%f12
	prefetch	[%l7 + 0x6C],	 0x0
	stb	%g7,	[%l7 + 0x79]
	movrgz	%i5,	0x1A5,	%l0
	sth	%o3,	[%l7 + 0x70]
	xor	%l6,	%o2,	%g6
	set	0x0, %o4
	ldxa	[%g0 + %o4] 0x58,	%o5
	subcc	%g1,	0x1863,	%i0
	xorcc	%i2,	%o0,	%o1
	srl	%o4,	%l4,	%l2
	lduw	[%l7 + 0x58],	%o7
	tvs	%icc,	0x1
	fbug,a	%fcc0,	loop_1953
	fmovdvc	%icc,	%f16,	%f15
	tcc	%xcc,	0x5
	fnot1s	%f24,	%f5
loop_1953:
	edge8l	%l3,	%i6,	%i7
	add	%i1,	%i4,	%g5
	movcc	%xcc,	%l1,	%g2
	tcs	%icc,	0x4
	movl	%icc,	%i3,	%g3
	fpsub16s	%f17,	%f10,	%f8
	fmovsneg	%icc,	%f28,	%f3
	fmovrdgez	%o6,	%f20,	%f10
	stbar
	movl	%xcc,	%g4,	%l5
	edge32n	%g7,	%l0,	%i5
	fbne,a	%fcc2,	loop_1954
	fornot1s	%f20,	%f16,	%f29
	add	%o3,	0x09E7,	%l6
	movrlz	%g6,	0x023,	%o5
loop_1954:
	lduh	[%l7 + 0x7C],	%o2
	taddcctv	%i0,	0x1977,	%g1
	brlz	%o0,	loop_1955
	fmovrslz	%o1,	%f31,	%f31
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f30
	fxtod	%f30,	%f28
	set	0x78, %g1
	stxa	%i2,	[%l7 + %g1] 0x15
loop_1955:
	tn	%icc,	0x5
	edge8l	%l4,	%o4,	%o7
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%l2
	movpos	%icc,	%l3,	%i6
	fmovdvc	%icc,	%f23,	%f9
	fmul8sux16	%f24,	%f4,	%f12
	movrne	%i7,	0x099,	%i4
	udivcc	%g5,	0x17E3,	%l1
	tleu	%xcc,	0x5
	tneg	%icc,	0x7
	fbne	%fcc2,	loop_1956
	fands	%f8,	%f11,	%f11
	subccc	%g2,	%i1,	%i3
	subc	%g3,	%o6,	%g4
loop_1956:
	fmovsvs	%icc,	%f24,	%f4
	fzero	%f4
	movcc	%xcc,	%g7,	%l5
	xnor	%l0,	%o3,	%i5
	movneg	%xcc,	%g6,	%o5
	edge16ln	%l6,	%o2,	%i0
	tge	%xcc,	0x6
	movge	%xcc,	%g1,	%o1
	stw	%o0,	[%l7 + 0x64]
	subccc	%l4,	%i2,	%o7
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x38] %asi,	%o4
	nop
	setx	loop_1957,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brgez,a	%l2,	loop_1958
	umulcc	%l3,	0x1101,	%i7
	xnor	%i6,	%i4,	%l1
loop_1957:
	orn	%g5,	0x1396,	%i1
loop_1958:
	edge32n	%i3,	%g3,	%o6
	movrgz	%g2,	0x025,	%g7
	edge32ln	%l5,	%g4,	%l0
	sir	0x072B
	umulcc	%i5,	0x00B1,	%o3
	srl	%g6,	0x1D,	%l6
	edge32l	%o2,	%i0,	%o5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x50] %asi,	%o1
	fors	%f18,	%f7,	%f13
	te	%icc,	0x4
	mulscc	%o0,	%l4,	%g1
	brlz,a	%o7,	loop_1959
	tle	%icc,	0x0
	or	%o4,	%i2,	%l2
	subcc	%i7,	0x0AAF,	%l3
loop_1959:
	fzeros	%f19
	movg	%xcc,	%i6,	%l1
	nop
	set	0x72, %l6
	ldsh	[%l7 + %l6],	%g5
	sethi	0x1ABD,	%i1
	movg	%icc,	%i4,	%g3
	andncc	%i3,	%g2,	%o6
	taddcc	%l5,	0x19A3,	%g4
	orn	%l0,	0x0BA7,	%i5
	fbge	%fcc3,	loop_1960
	bleu,a	%xcc,	loop_1961
	addc	%g7,	%g6,	%l6
	bcs,pn	%xcc,	loop_1962
loop_1960:
	fcmpgt16	%f0,	%f18,	%o2
loop_1961:
	ldsw	[%l7 + 0x34],	%o3
	xnor	%i0,	%o1,	%o5
loop_1962:
	fnot1s	%f9,	%f24
	edge8ln	%o0,	%g1,	%o7
	fmovdle	%xcc,	%f0,	%f2
	srax	%o4,	0x01,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	sta	%f25,	[%l7 + 0x3C] %asi
	and	%l2,	%i7,	%l4
	movvs	%icc,	%l3,	%i6
	movcs	%xcc,	%l1,	%g5
	addccc	%i1,	0x0B7D,	%g3
	udiv	%i4,	0x1121,	%g2
	edge8	%o6,	%l5,	%i3
	tcc	%xcc,	0x4
	movcs	%xcc,	%l0,	%i5
	fzeros	%f27
	sir	0x09C1
	umul	%g7,	%g4,	%g6
	set	0x5E, %l1
	ldsba	[%l7 + %l1] 0x04,	%o2
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
	fmovrdne	%l6,	%f22,	%f16
	nop
	setx	loop_1964,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fblg	%fcc3,	loop_1965
loop_1963:
	fmovsn	%xcc,	%f15,	%f24
	fmovd	%f0,	%f2
loop_1964:
	movge	%xcc,	%o3,	%i0
loop_1965:
	nop
	setx	0x6386E93B3067C541,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	bg,a,pn	%icc,	loop_1966
	fmuld8sux16	%f29,	%f30,	%f20
	edge32n	%o1,	%o5,	%g1
	prefetch	[%l7 + 0x10],	 0x3
loop_1966:
	fmovdgu	%xcc,	%f1,	%f31
	or	%o7,	0x00D6,	%o4
	udivx	%o0,	0x127D,	%l2
	brz	%i7,	loop_1967
	fcmpeq32	%f16,	%f30,	%l4
	orncc	%l3,	0x11F2,	%i6
	tgu	%xcc,	0x6
loop_1967:
	nop
	setx	0x7DF0A5EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f16
	sdiv	%i2,	0x0616,	%g5
	movg	%icc,	%i1,	%l1
	sdiv	%g3,	0x0EE3,	%i4
	bcc,pt	%xcc,	loop_1968
	stx	%o6,	[%l7 + 0x48]
	edge32l	%l5,	%i3,	%l0
	nop
	setx	0x8B940F6E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x3395499A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f2,	%f30
loop_1968:
	orncc	%g2,	%g7,	%g4
	movrlz	%i5,	0x35B,	%o2
	fbg,a	%fcc2,	loop_1969
	bge,a	loop_1970
	movrne	%l6,	%o3,	%i0
	edge32l	%o1,	%g6,	%o5
loop_1969:
	tneg	%xcc,	0x4
loop_1970:
	edge32ln	%g1,	%o4,	%o0
	fands	%f10,	%f21,	%f31
	bshuffle	%f28,	%f8,	%f0
	tvc	%xcc,	0x2
	xnor	%o7,	%l2,	%i7
	fpsub32	%f14,	%f28,	%f8
	set	0x44, %o5
	stba	%l4,	[%l7 + %o5] 0xe3
	membar	#Sync
	sll	%i6,	%l3,	%i2
	ta	%xcc,	0x2
	nop
	fitos	%f10,	%f4
	fstoi	%f4,	%f14
	tvc	%xcc,	0x1
	ldsh	[%l7 + 0x26],	%g5
	srl	%l1,	%i1,	%g3
	fmovdge	%icc,	%f7,	%f16
	movn	%icc,	%i4,	%o6
	bvs,pn	%icc,	loop_1971
	brgez,a	%l5,	loop_1972
	tgu	%icc,	0x1
	udivx	%l0,	0x02F2,	%g2
loop_1971:
	nop
	setx	loop_1973,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1972:
	nop
	fitos	%f14,	%f7
	fstoi	%f7,	%f24
	subcc	%g7,	%i3,	%i5
	subccc	%g4,	0x121E,	%o2
loop_1973:
	edge16l	%o3,	%i0,	%l6
	fmovrsgz	%g6,	%f10,	%f26
	movcs	%xcc,	%o1,	%g1
	bge,a	loop_1974
	bvs,a	%icc,	loop_1975
	tne	%icc,	0x3
	fbge	%fcc2,	loop_1976
loop_1974:
	nop
	setx	0x1D731A3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xBAA7926C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f30,	%f8
loop_1975:
	bl,pn	%xcc,	loop_1977
	movneg	%xcc,	%o4,	%o0
loop_1976:
	fbu	%fcc3,	loop_1978
	movre	%o7,	%l2,	%i7
loop_1977:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f28,	%f6,	%f8
loop_1978:
	xnorcc	%l4,	0x04CD,	%i6
	bneg,pn	%xcc,	loop_1979
	lduh	[%l7 + 0x10],	%o5
	fornot1	%f4,	%f26,	%f8
	popc	%i2,	%g5
loop_1979:
	movrlz	%l1,	0x0E5,	%i1
	tsubcctv	%g3,	%i4,	%l3
	alignaddrl	%o6,	%l5,	%g2
	movg	%icc,	%g7,	%i3
	subccc	%i5,	%l0,	%o2
	brgez	%g4,	loop_1980
	edge8n	%i0,	%l6,	%o3
	fornot1s	%f5,	%f4,	%f26
	nop
	setx	0xF04A2003,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
loop_1980:
	andn	%o1,	0x111E,	%g1
	tneg	%xcc,	0x4
	movneg	%icc,	%g6,	%o0
	movne	%icc,	%o7,	%l2
	srlx	%o4,	0x09,	%i7
	fmovdcs	%xcc,	%f4,	%f6
	tneg	%icc,	0x6
	andn	%l4,	0x084F,	%o5
	addcc	%i2,	%g5,	%i6
	fcmpne16	%f2,	%f4,	%l1
	edge32l	%i1,	%g3,	%l3
	fbg	%fcc0,	loop_1981
	tn	%xcc,	0x4
	fbge	%fcc2,	loop_1982
	fmovd	%f10,	%f22
loop_1981:
	movle	%xcc,	%i4,	%l5
	ta	%icc,	0x7
loop_1982:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g2,	%o6
	set	0x48, %o1
	lduha	[%l7 + %o1] 0x10,	%g7
	fcmpeq16	%f20,	%f26,	%i5
	movrgz	%l0,	0x272,	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%g4
	fmovrdlez	%i0,	%f14,	%f28
	movleu	%xcc,	%l6,	%o1
	fmovscc	%xcc,	%f2,	%f24
	movneg	%xcc,	%g1,	%g6
	edge16	%o3,	%o0,	%o7
	alignaddrl	%o4,	%l2,	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%i7,	%o5
	nop
	setx	0xDC9C77381C6E25EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f8
	fmul8x16	%f1,	%f24,	%f10
	tne	%xcc,	0x2
	set	0x20, %i5
	lduwa	[%l7 + %i5] 0x80,	%g5
	alignaddr	%i2,	%i6,	%l1
	fnegs	%f19,	%f0
	edge16	%i1,	%g3,	%i4
	ldstub	[%l7 + 0x60],	%l3
	fmuld8sux16	%f0,	%f31,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g2,	0x13FC,	%o6
	movne	%xcc,	%l5,	%g7
	sll	%i5,	0x13,	%l0
	movn	%icc,	%o2,	%i3
	nop
	setx	0x9624159E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x1F9718EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f18,	%f8
	nop
	setx	0x5A24C4C3BC6E8D56,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x856076B53EB19003,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f22,	%f12
	subc	%g4,	%i0,	%l6
	fmovsl	%icc,	%f18,	%f17
	fmovrse	%o1,	%f3,	%f1
	xor	%g6,	%g1,	%o3
	fmovscs	%xcc,	%f12,	%f11
	fbul,a	%fcc2,	loop_1983
	fnands	%f16,	%f4,	%f7
	movg	%xcc,	%o7,	%o0
	alignaddrl	%l2,	%o4,	%l4
loop_1983:
	fbug	%fcc3,	loop_1984
	nop
	setx	loop_1985,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%icc,	%i7,	%g5
	bl,pn	%xcc,	loop_1986
loop_1984:
	addcc	%o5,	%i6,	%i2
loop_1985:
	nop
	setx loop_1987, %l0, %l1
	jmpl %l1, %l1
	move	%icc,	%i1,	%g3
loop_1986:
	brz	%i4,	loop_1988
	srax	%l3,	%o6,	%g2
loop_1987:
	ba,pt	%icc,	loop_1989
	fmovscs	%icc,	%f1,	%f4
loop_1988:
	nop
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x89,	 0x0
loop_1989:
	bvs	loop_1990
	movvs	%icc,	%l5,	%i5
	xorcc	%o2,	%i3,	%l0
	set	0x42, %l0
	ldsba	[%l7 + %l0] 0x11,	%g4
loop_1990:
	edge8n	%i0,	%l6,	%g6
	fornot2	%f2,	%f6,	%f6
	taddcc	%o1,	%o3,	%o7
	fmovs	%f26,	%f13
	edge32	%o0,	%g1,	%o4
	orncc	%l4,	%l2,	%g5
	fpsub32	%f12,	%f4,	%f8
	fmovrdgz	%i7,	%f8,	%f26
	movne	%icc,	%i6,	%i2
	srlx	%o5,	0x02,	%i1
	sdiv	%g3,	0x0936,	%i4
	or	%l3,	0x1925,	%l1
	ldub	[%l7 + 0x54],	%o6
	array32	%g7,	%g2,	%l5
	set	0x10, %i6
	stha	%o2,	[%l7 + %i6] 0x15
	movpos	%xcc,	%i3,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble	%icc,	loop_1991
	movl	%icc,	%g4,	%i0
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
loop_1991:
	sra	%i5,	0x1E,	%g6
	udivcc	%o3,	0x1720,	%o7
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2A] %asi,	%o1
	movpos	%icc,	%g1,	%o0
	xnorcc	%l4,	0x0D26,	%o4
	movcs	%xcc,	%l2,	%g5
	bcs,a,pn	%icc,	loop_1992
	fmovscs	%xcc,	%f29,	%f1
	prefetch	[%l7 + 0x38],	 0x3
	fmul8x16al	%f3,	%f3,	%f0
loop_1992:
	tcs	%xcc,	0x6
	smul	%i6,	0x1DD9,	%i2
	ldsw	[%l7 + 0x50],	%i7
	be,a,pn	%xcc,	loop_1993
	fbe	%fcc2,	loop_1994
	fbl	%fcc2,	loop_1995
	orncc	%i1,	0x1067,	%o5
loop_1993:
	st	%f14,	[%l7 + 0x7C]
loop_1994:
	lduh	[%l7 + 0x1E],	%g3
loop_1995:
	fands	%f25,	%f0,	%f28
	movne	%icc,	%l3,	%i4
	brgz	%o6,	loop_1996
	nop
	fitod	%f0,	%f22
	fdtox	%f22,	%f0
	udivcc	%g7,	0x0787,	%g2
	fzeros	%f20
loop_1996:
	brnz	%l5,	loop_1997
	sll	%o2,	%i3,	%l1
	set	0x0C, %g7
	sta	%f31,	[%l7 + %g7] 0x88
loop_1997:
	fmovsleu	%xcc,	%f0,	%f15
	tneg	%xcc,	0x1
	movrgz	%l0,	%i0,	%g4
	fandnot2s	%f19,	%f16,	%f12
	fpack16	%f2,	%f5
	wr	%g0,	0x2b,	%asi
	stba	%l6,	[%l7 + 0x67] %asi
	membar	#Sync
	movrne	%i5,	0x304,	%o3
	be,a	%icc,	loop_1998
	alignaddrl	%g6,	%o7,	%o1
	addc	%o0,	0x1FF9,	%l4
	xor	%o4,	%l2,	%g1
loop_1998:
	sll	%g5,	%i2,	%i7
	movpos	%icc,	%i6,	%o5
	alignaddrl	%i1,	%g3,	%i4
	sub	%l3,	%g7,	%g2
	fba,a	%fcc2,	loop_1999
	nop
	fitod	%f0,	%f22
	fdtos	%f22,	%f8
	tg	%xcc,	0x7
	sra	%o6,	%o2,	%l5
loop_1999:
	movne	%xcc,	%l1,	%l0
	edge8	%i3,	%g4,	%i0
	fones	%f5
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f28
	fxtod	%f28,	%f6
	membar	0x51
	popc	%l6,	%o3
	popc	%g6,	%o7
	nop
	setx	0x44285E2D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xC5B8B8FF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f20,	%f4
	movrne	%i5,	0x33C,	%o1
	faligndata	%f16,	%f2,	%f16
	mulscc	%o0,	%o4,	%l2
	srax	%g1,	%l4,	%i2
	brlez,a	%g5,	loop_2000
	ld	[%l7 + 0x14],	%f24
	movrlez	%i7,	0x372,	%i6
	smulcc	%i1,	%o5,	%g3
loop_2000:
	sdivx	%l3,	0x03AF,	%g7
	movvs	%icc,	%g2,	%o6
	movrgez	%o2,	%i4,	%l5
	smul	%l1,	%l0,	%g4
	set	0x3C, %g3
	swapa	[%l7 + %g3] 0x18,	%i3
	xorcc	%i0,	%o3,	%l6
	fbul,a	%fcc0,	loop_2001
	edge32n	%g6,	%o7,	%i5
	and	%o1,	%o0,	%o4
	andn	%g1,	%l4,	%i2
loop_2001:
	array32	%g5,	%l2,	%i6
	tg	%xcc,	0x6
	xnorcc	%i1,	%o5,	%g3
	tge	%icc,	0x7
	fbn	%fcc1,	loop_2002
	orn	%l3,	%i7,	%g7
	fmuld8ulx16	%f8,	%f8,	%f4
	tvc	%xcc,	0x5
loop_2002:
	bvc,a,pn	%xcc,	loop_2003
	movvc	%icc,	%g2,	%o6
	tcc	%xcc,	0x5
	tge	%icc,	0x2
loop_2003:
	array8	%o2,	%i4,	%l5
	edge32	%l0,	%l1,	%g4
	movrlz	%i0,	0x093,	%o3
	array32	%i3,	%l6,	%o7
	tleu	%xcc,	0x4
	srl	%i5,	0x10,	%o1
	edge8	%g6,	%o0,	%o4
	sethi	0x1259,	%l4
	nop
	setx	0x5BD294BC2B498840,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x16EA44F3B8A5A98A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f18,	%f14
	tneg	%xcc,	0x4
	udiv	%i2,	0x0E09,	%g5
	fmovspos	%xcc,	%f11,	%f12
	fmovsgu	%xcc,	%f8,	%f10
	movg	%xcc,	%g1,	%l2
	fcmpne16	%f14,	%f12,	%i1
	bge,a	loop_2004
	edge32ln	%o5,	%i6,	%g3
	fbue	%fcc0,	loop_2005
	ldd	[%l7 + 0x68],	%f10
loop_2004:
	andn	%i7,	0x1728,	%l3
	fmul8x16	%f26,	%f20,	%f18
loop_2005:
	move	%icc,	%g2,	%g7
	brlz	%o2,	loop_2006
	movleu	%icc,	%i4,	%l5
	stbar
	fcmpne16	%f12,	%f0,	%o6
loop_2006:
	alignaddr	%l1,	%l0,	%g4
	fbn,a	%fcc2,	loop_2007
	xnorcc	%i0,	0x15CF,	%o3
	popc	0x169E,	%i3
	edge32n	%l6,	%o7,	%o1
loop_2007:
	bshuffle	%f8,	%f4,	%f12
	movn	%icc,	%i5,	%o0
	fbul,a	%fcc2,	loop_2008
	tsubcctv	%g6,	0x126A,	%l4
	tcc	%icc,	0x5
	membar	0x78
loop_2008:
	fxor	%f0,	%f26,	%f8
	tvs	%xcc,	0x4
	set	0x76, %g6
	ldsba	[%l7 + %g6] 0x10,	%i2
	orncc	%o4,	0x1925,	%g5
	movne	%icc,	%g1,	%i1
	tsubcctv	%o5,	%i6,	%l2
	fbn	%fcc2,	loop_2009
	fpadd32	%f8,	%f22,	%f4
	wr	%g0,	0x5f,	%asi
	stxa	%i7,	[%g0 + 0x0] %asi
loop_2009:
	movle	%icc,	%l3,	%g2
	fpmerge	%f8,	%f1,	%f0
	bgu,pn	%icc,	loop_2010
	brlez,a	%g7,	loop_2011
	ldub	[%l7 + 0x7C],	%g3
	tgu	%xcc,	0x7
loop_2010:
	edge8l	%i4,	%o2,	%o6
loop_2011:
	srlx	%l5,	0x1B,	%l0
	edge8l	%g4,	%l1,	%o3
	bleu,a,pt	%xcc,	loop_2012
	movl	%icc,	%i0,	%i3
	fbul,a	%fcc1,	loop_2013
	sethi	0x00A7,	%o7
loop_2012:
	bvc,a	loop_2014
	nop
	fitos	%f6,	%f17
	fstox	%f17,	%f26
	fxtos	%f26,	%f28
loop_2013:
	subc	%l6,	%o1,	%i5
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x50] %asi,	%o0
loop_2014:
	nop
	add	%l7,	0x14,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%g6,	%l4
	te	%icc,	0x4
	sdivx	%o4,	0x010D,	%g5
	xnor	%i2,	%i1,	%g1
	nop
	setx	0xC2A110563BE7B34B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x31DEDF47C167D5DF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f20,	%f28
	fmovdge	%xcc,	%f28,	%f21
	brlz	%i6,	loop_2015
	fbe	%fcc0,	loop_2016
	fbn	%fcc3,	loop_2017
	sllx	%o5,	%l2,	%l3
loop_2015:
	sllx	%i7,	%g2,	%g7
loop_2016:
	tgu	%icc,	0x0
loop_2017:
	stw	%i4,	[%l7 + 0x68]
	sll	%g3,	%o2,	%l5
	sub	%o6,	%g4,	%l1
	array16	%l0,	%i0,	%o3
	bleu,pn	%icc,	loop_2018
	movl	%xcc,	%i3,	%l6
	movrgz	%o7,	%o1,	%o0
	tne	%icc,	0x7
loop_2018:
	tge	%icc,	0x1
	umulcc	%i5,	%l4,	%g6
	nop
	setx	0x915F4B57,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f16
	fmovdvc	%icc,	%f30,	%f22
	addcc	%g5,	0x0A13,	%o4
	brnz	%i2,	loop_2019
	orcc	%i1,	0x0502,	%i6
	tvs	%xcc,	0x0
	tsubcctv	%g1,	0x161A,	%o5
loop_2019:
	movrgz	%l3,	%i7,	%g2
	brlz	%l2,	loop_2020
	sdivcc	%g7,	0x1A93,	%g3
	bl	loop_2021
	array32	%o2,	%l5,	%i4
loop_2020:
	movrne	%o6,	0x007,	%g4
	fandnot1s	%f17,	%f16,	%f13
loop_2021:
	udivx	%l1,	0x1A94,	%i0
	nop
	setx	0x6CC0596E18756502,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x017C6F2DBD34D6D5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f28,	%f14
	movg	%icc,	%o3,	%l0
	fmovdle	%icc,	%f15,	%f0
	faligndata	%f12,	%f0,	%f28
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f4
	fxtos	%f4,	%f21
	fmul8x16al	%f26,	%f22,	%f8
	tl	%xcc,	0x1
	fzeros	%f9
	movvs	%xcc,	%i3,	%o7
	movre	%o1,	0x3F2,	%o0
	subcc	%i5,	0x0AD7,	%l6
	fpsub16	%f30,	%f30,	%f0
	edge8	%l4,	%g6,	%o4
	srlx	%i2,	0x17,	%i1
	movleu	%icc,	%i6,	%g1
	edge16	%o5,	%l3,	%i7
	sth	%g5,	[%l7 + 0x28]
	smul	%g2,	%g7,	%g3
	addccc	%o2,	%l2,	%l5
	fmovsneg	%icc,	%f26,	%f25
	tpos	%xcc,	0x5
	ldsw	[%l7 + 0x6C],	%o6
	fbule	%fcc2,	loop_2022
	ldd	[%l7 + 0x78],	%i4
	edge32	%l1,	%i0,	%g4
	te	%icc,	0x3
loop_2022:
	udiv	%o3,	0x067C,	%i3
	edge32ln	%l0,	%o7,	%o1
	array8	%o0,	%i5,	%l6
	andn	%l4,	%g6,	%o4
	movcc	%xcc,	%i1,	%i2
	ba,pt	%icc,	loop_2023
	udivx	%g1,	0x0C28,	%i6
	edge8ln	%l3,	%i7,	%g5
	fmovdvs	%xcc,	%f31,	%f15
loop_2023:
	edge8	%g2,	%g7,	%o5
	fba	%fcc1,	loop_2024
	movvc	%xcc,	%o2,	%g3
	set	0x64, %i0
	ldswa	[%l7 + %i0] 0x10,	%l2
loop_2024:
	nop
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x11,	%o6
	ldsb	[%l7 + 0x39],	%i4
	mulscc	%l1,	%i0,	%g4
	orcc	%o3,	%i3,	%l0
	nop
	fitos	%f17,	%f18
	movpos	%xcc,	%o7,	%o1
	andn	%l5,	0x1E67,	%i5
	set	0x10, %g5
	ldswa	[%l7 + %g5] 0x11,	%l6
	move	%icc,	%l4,	%g6
	fxors	%f17,	%f2,	%f19
	fbne	%fcc1,	loop_2025
	sll	%o4,	%i1,	%o0
	movneg	%xcc,	%i2,	%g1
	array32	%l3,	%i7,	%i6
loop_2025:
	movg	%icc,	%g5,	%g2
	array32	%o5,	%o2,	%g3
	addccc	%l2,	%o6,	%i4
	bleu,a,pn	%xcc,	loop_2026
	fble,a	%fcc2,	loop_2027
	tn	%xcc,	0x2
	edge16ln	%g7,	%l1,	%g4
loop_2026:
	xnorcc	%o3,	%i0,	%l0
loop_2027:
	or	%o7,	%i3,	%o1
	fbg,a	%fcc3,	loop_2028
	sll	%l5,	%i5,	%l6
	brz,a	%g6,	loop_2029
	addcc	%l4,	0x08B2,	%o4
loop_2028:
	flush	%l7 + 0x58
	tpos	%icc,	0x7
loop_2029:
	fmovdvc	%xcc,	%f7,	%f18
	edge8l	%o0,	%i2,	%g1
	fbuge,a	%fcc3,	loop_2030
	lduh	[%l7 + 0x6C],	%i1
	fzero	%f24
	tn	%icc,	0x4
loop_2030:
	fmovdgu	%xcc,	%f27,	%f15
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x14] %asi,	%f18
	fone	%f18
	nop
	setx	loop_2031,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxnors	%f2,	%f3,	%f18
	movcs	%xcc,	%i7,	%i6
	nop
	setx	0xAA7340F8F05298E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_2031:
	edge32l	%g5,	%l3,	%g2
	andn	%o2,	%o5,	%g3
	andn	%l2,	%o6,	%i4
	bneg,a	%icc,	loop_2032
	movrlez	%l1,	%g4,	%g7
	set	0x16, %i2
	stha	%o3,	[%l7 + %i2] 0xe3
	membar	#Sync
loop_2032:
	fsrc2	%f14,	%f24
	edge32l	%i0,	%o7,	%l0
	xnorcc	%i3,	%o1,	%i5
	or	%l6,	0x1CF7,	%l5
	fnot1s	%f8,	%f12
	movleu	%icc,	%g6,	%l4
	mulx	%o4,	0x1958,	%i2
	edge16l	%o0,	%g1,	%i7
	addc	%i6,	0x0211,	%g5
	edge8ln	%i1,	%l3,	%g2
	movgu	%icc,	%o5,	%o2
	fbul,a	%fcc2,	loop_2033
	bneg,a,pt	%xcc,	loop_2034
	fands	%f0,	%f25,	%f8
	andn	%g3,	0x0EEE,	%l2
loop_2033:
	fbl	%fcc1,	loop_2035
loop_2034:
	swap	[%l7 + 0x7C],	%i4
	ldsh	[%l7 + 0x3C],	%o6
	edge8ln	%g4,	%l1,	%g7
loop_2035:
	bleu	loop_2036
	fmovsleu	%xcc,	%f18,	%f12
	set	0x68, %o6
	lda	[%l7 + %o6] 0x88,	%f26
loop_2036:
	udiv	%o3,	0x159A,	%i0
	udivx	%o7,	0x0B34,	%i3
	mova	%icc,	%o1,	%i5
	nop
	fitos	%f14,	%f5
	fstox	%f5,	%f8
	fmovrsgez	%l6,	%f21,	%f26
	fmovsn	%xcc,	%f7,	%f10
	edge8l	%l0,	%g6,	%l5
	xorcc	%l4,	%o4,	%o0
	edge32l	%i2,	%i7,	%i6
	fbue,a	%fcc0,	loop_2037
	tvs	%xcc,	0x2
	sdiv	%g1,	0x141E,	%i1
	umul	%l3,	0x1FCF,	%g5
loop_2037:
	fmuld8ulx16	%f18,	%f27,	%f28
	edge8l	%o5,	%o2,	%g3
	fnot1	%f14,	%f24
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%l2
	srlx	%i4,	0x08,	%g2
	add	%g4,	0x1360,	%l1
	array8	%g7,	%o6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f4,	%f23,	%f26
	nop
	setx	loop_2038,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
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
	pdist	%f10,	%f8,	%f14
	movre	%o3,	%i3,	%o1
loop_2038:
	movn	%xcc,	%i5,	%o7
loop_2039:
	movne	%icc,	%l6,	%l0
	fxnors	%f13,	%f30,	%f1
	tne	%icc,	0x4
	brgz	%g6,	loop_2040
	fmovsne	%xcc,	%f25,	%f0
	fcmpgt16	%f0,	%f10,	%l5
	smul	%l4,	%o0,	%o4
loop_2040:
	movvs	%icc,	%i2,	%i7
	stbar
	xorcc	%i6,	%i1,	%g1
	set	0x64, %l5
	stwa	%l3,	[%l7 + %l5] 0xe2
	membar	#Sync
	udivcc	%g5,	0x0C86,	%o2
	nop
	setx	loop_2041,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stw	%g3,	[%l7 + 0x0C]
	sll	%l2,	0x09,	%i4
	fmovrsgez	%o5,	%f2,	%f27
loop_2041:
	stb	%g2,	[%l7 + 0x47]
	tsubcctv	%g4,	0x1F96,	%l1
	sub	%o6,	0x12C8,	%i0
	stx	%g7,	[%l7 + 0x18]
	ldsh	[%l7 + 0x10],	%i3
	srlx	%o3,	0x02,	%i5
	popc	%o1,	%l6
	stb	%o7,	[%l7 + 0x5D]
	movleu	%xcc,	%g6,	%l0
	movcc	%xcc,	%l5,	%l4
	tpos	%xcc,	0x1
	fsrc2s	%f21,	%f17
	movgu	%xcc,	%o4,	%o0
	tvs	%xcc,	0x3
	movrlz	%i2,	0x001,	%i6
	subc	%i7,	0x0B78,	%g1
	swap	[%l7 + 0x08],	%l3
	tsubcctv	%g5,	0x1E7E,	%i1
	faligndata	%f10,	%f6,	%f26
	movrne	%g3,	0x0D5,	%o2
	movg	%xcc,	%i4,	%o5
	tneg	%icc,	0x0
	sth	%g2,	[%l7 + 0x20]
	fabsd	%f16,	%f14
	nop
	fitos	%f3,	%f7
	fstox	%f7,	%f10
	fbl,a	%fcc0,	loop_2042
	subccc	%l2,	0x1E4B,	%l1
	bvc	%icc,	loop_2043
	fandnot2	%f12,	%f22,	%f2
loop_2042:
	tne	%xcc,	0x4
	stx	%g4,	[%l7 + 0x78]
loop_2043:
	edge16	%i0,	%o6,	%g7
	nop
	set	0x28, %l2
	ldx	[%l7 + %l2],	%i3
	wr	%g0,	0x89,	%asi
	stba	%o3,	[%l7 + 0x28] %asi
	nop
	setx	loop_2044,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bge	%xcc,	loop_2045
	fbe,a	%fcc0,	loop_2046
	edge8ln	%i5,	%o1,	%l6
loop_2044:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x7B] %asi,	%g6
loop_2045:
	sll	%l0,	%l5,	%l4
loop_2046:
	fbe	%fcc3,	loop_2047
	nop
	fitos	%f12,	%f1
	fstox	%f1,	%f26
	bshuffle	%f14,	%f24,	%f14
	bg,pn	%xcc,	loop_2048
loop_2047:
	tleu	%xcc,	0x3
	fandnot1	%f2,	%f22,	%f10
	taddcctv	%o4,	0x06CA,	%o7
loop_2048:
	nop
	set	0x35, %o0
	stba	%i2,	[%l7 + %o0] 0x2b
	membar	#Sync
	bge,a,pn	%xcc,	loop_2049
	flush	%l7 + 0x6C
	edge16l	%o0,	%i7,	%g1
	ldub	[%l7 + 0x29],	%l3
loop_2049:
	movneg	%icc,	%g5,	%i1
	umul	%g3,	0x1A84,	%o2
	movrgz	%i4,	0x1E0,	%i6
	tleu	%icc,	0x3
	orncc	%g2,	0x16C8,	%l2
	fmovsneg	%icc,	%f23,	%f29
	fornot2s	%f11,	%f13,	%f24
	tpos	%icc,	0x4
	edge8	%l1,	%g4,	%o5
	mova	%icc,	%i0,	%g7
	movl	%xcc,	%i3,	%o3
	ldstub	[%l7 + 0x61],	%o6
	edge8ln	%o1,	%l6,	%i5
	te	%icc,	0x5
	movrgez	%g6,	0x386,	%l0
	nop
	setx	0xB04F9303,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	bcc,a	loop_2050
	fmovdcs	%icc,	%f7,	%f14
	movl	%icc,	%l5,	%l4
	tg	%xcc,	0x3
loop_2050:
	ta	%xcc,	0x3
	fmovrdlez	%o7,	%f8,	%f4
	edge16ln	%i2,	%o0,	%o4
	te	%icc,	0x0
	movleu	%icc,	%g1,	%i7
	move	%icc,	%l3,	%g5
	set	0x60, %g2
	sta	%f14,	[%l7 + %g2] 0x88
	sra	%g3,	%o2,	%i1
	fbul,a	%fcc3,	loop_2051
	add	%i4,	%g2,	%i6
	fcmpgt16	%f4,	%f4,	%l1
	movrgez	%g4,	%l2,	%o5
loop_2051:
	srlx	%g7,	0x0D,	%i3
	for	%f22,	%f0,	%f2
	smulcc	%o3,	0x13C8,	%i0
	sdivcc	%o1,	0x0F36,	%o6
	fbg	%fcc3,	loop_2052
	ldd	[%l7 + 0x68],	%i6
	tneg	%icc,	0x2
	andn	%g6,	0x1580,	%i5
loop_2052:
	fpsub16	%f10,	%f28,	%f20
	subcc	%l0,	0x14FB,	%l5
	taddcctv	%o7,	0x0553,	%l4
	edge16	%o0,	%i2,	%g1
	bvs,a,pt	%icc,	loop_2053
	andcc	%o4,	0x13D7,	%i7
	fmovsvs	%icc,	%f10,	%f20
	edge32	%g5,	%g3,	%o2
loop_2053:
	fnor	%f0,	%f16,	%f30
	fmovdle	%xcc,	%f0,	%f11
	fmovscc	%xcc,	%f6,	%f11
	edge32n	%l3,	%i4,	%i1
	movge	%xcc,	%g2,	%l1
	flush	%l7 + 0x78
	smulcc	%i6,	0x1D82,	%l2
	fble	%fcc2,	loop_2054
	fbue	%fcc2,	loop_2055
	addccc	%o5,	0x1425,	%g7
	andcc	%i3,	0x165C,	%o3
loop_2054:
	edge8	%i0,	%g4,	%o1
loop_2055:
	bcs,pn	%xcc,	loop_2056
	bvs,a,pn	%icc,	loop_2057
	udivcc	%l6,	0x17BC,	%g6
	fmovscs	%icc,	%f27,	%f24
loop_2056:
	tsubcc	%o6,	0x1951,	%l0
loop_2057:
	taddcc	%l5,	%i5,	%l4
	nop
	setx	0x2F53723C80685C31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	movrlz	%o0,	0x251,	%i2
	fpsub32	%f6,	%f18,	%f2
	movrlez	%o7,	0x054,	%g1
	tgu	%icc,	0x0
	subccc	%o4,	%g5,	%g3
	for	%f26,	%f4,	%f22
	and	%o2,	0x0C5B,	%i7
	fmovsl	%xcc,	%f30,	%f8
	nop
	fitod	%f1,	%f6
	addccc	%i4,	%l3,	%g2
	movrlz	%i1,	0x270,	%i6
	andn	%l1,	0x193B,	%o5
	add	%g7,	0x0073,	%l2
	fmovdgu	%icc,	%f31,	%f0
	bn,a,pn	%xcc,	loop_2058
	fmul8x16	%f15,	%f26,	%f14
	fornot2	%f16,	%f30,	%f6
	movge	%icc,	%o3,	%i0
loop_2058:
	edge32ln	%g4,	%o1,	%i3
	xnor	%l6,	%g6,	%l0
	smul	%o6,	0x0BE0,	%i5
	mulscc	%l4,	%l5,	%i2
	edge16ln	%o0,	%g1,	%o4
	taddcc	%g5,	0x111B,	%g3
	bne,pt	%icc,	loop_2059
	fmuld8ulx16	%f15,	%f31,	%f16
	fcmpeq32	%f28,	%f4,	%o7
	xnor	%o2,	%i4,	%l3
loop_2059:
	edge8n	%i7,	%i1,	%g2
	set	0x6A, %o7
	lduha	[%l7 + %o7] 0x0c,	%l1
	mova	%icc,	%i6,	%g7
	orncc	%l2,	%o5,	%o3
	array16	%g4,	%i0,	%o1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l6,	%i3
	sra	%g6,	0x11,	%l0
	movcc	%xcc,	%o6,	%l4
	ldd	[%l7 + 0x48],	%f0
	tvc	%icc,	0x6
	udivx	%l5,	0x034F,	%i2
	tsubcctv	%o0,	0x15D9,	%g1
	sub	%o4,	%i5,	%g3
	addcc	%o7,	%g5,	%o2
	tleu	%icc,	0x3
	sllx	%i4,	0x09,	%i7
	ldsw	[%l7 + 0x30],	%l3
	bcs,pn	%xcc,	loop_2060
	popc	0x1FAA,	%i1
	set	0x76, %i1
	ldsha	[%l7 + %i1] 0x11,	%l1
loop_2060:
	be,a,pt	%xcc,	loop_2061
	tne	%icc,	0x3
	mova	%icc,	%i6,	%g2
	add	%l2,	%o5,	%o3
loop_2061:
	fbl,a	%fcc1,	loop_2062
	sethi	0x0A50,	%g7
	edge16l	%g4,	%i0,	%o1
	fmul8ulx16	%f24,	%f30,	%f10
loop_2062:
	be,a,pn	%icc,	loop_2063
	movrlez	%i3,	0x124,	%l6
	stbar
	fmovsa	%xcc,	%f2,	%f11
loop_2063:
	xorcc	%g6,	0x16B7,	%o6
	brnz	%l0,	loop_2064
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x5
	set	0x50, %l3
	prefetcha	[%l7 + %l3] 0x18,	 0x0
loop_2064:
	call	loop_2065
	popc	0x025C,	%i2
	fmovrdlz	%l4,	%f10,	%f6
	fmovrde	%o0,	%f2,	%f6
loop_2065:
	movcs	%icc,	%o4,	%i5
	brgez	%g1,	loop_2066
	orn	%o7,	0x1F4E,	%g5
	fmovsa	%xcc,	%f26,	%f8
	srl	%g3,	%o2,	%i4
loop_2066:
	fblg	%fcc1,	loop_2067
	array32	%i7,	%i1,	%l1
	fsrc2	%f10,	%f30
	edge16ln	%l3,	%g2,	%i6
loop_2067:
	nop
	wr	%g0,	0x04,	%asi
	stha	%o5,	[%l7 + 0x0C] %asi
	fxor	%f20,	%f10,	%f24
	and	%o3,	%l2,	%g4
	subccc	%i0,	%g7,	%i3
	udivcc	%o1,	0x156A,	%l6
	set	0x70, %o3
	prefetcha	[%l7 + %o3] 0x18,	 0x0
	edge16	%l0,	%l5,	%i2
	movn	%icc,	%g6,	%l4
	movrlz	%o4,	0x229,	%o0
	bpos,pn	%xcc,	loop_2068
	nop
	setx	0xF8818788,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f15
	alignaddr	%i5,	%o7,	%g5
	subccc	%g1,	0x0EBD,	%g3
loop_2068:
	movg	%xcc,	%i4,	%o2
	array16	%i1,	%l1,	%l3
	tvs	%icc,	0x0
	subc	%g2,	%i7,	%i6
	movre	%o5,	%l2,	%o3
	movcs	%icc,	%g4,	%i0
	xnorcc	%g7,	%o1,	%l6
	fornot2	%f16,	%f30,	%f12
	subccc	%i3,	0x1FB2,	%l0
	nop
	setx	loop_2069,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%l5,	%o6,	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x89,	%i2,	%o4
loop_2069:
	movvs	%icc,	%l4,	%o0
	fmovrse	%o7,	%f22,	%f13
	bne,pt	%xcc,	loop_2070
	fmul8x16au	%f7,	%f0,	%f20
	movvs	%icc,	%g5,	%i5
	tsubcctv	%g1,	0x162A,	%g3
loop_2070:
	sra	%o2,	0x10,	%i1
	movrne	%l1,	%l3,	%g2
	nop
	fitos	%f11,	%f29
	fstox	%f29,	%f22
	taddcc	%i4,	0x11D6,	%i6
	bne,pt	%xcc,	loop_2071
	subc	%o5,	%l2,	%o3
	set	0x65, %l4
	lduba	[%l7 + %l4] 0x81,	%g4
loop_2071:
	udivx	%i0,	0x1694,	%i7
	movleu	%xcc,	%g7,	%l6
	and	%i3,	%l0,	%l5
	smulcc	%o1,	0x1A4F,	%o6
	mova	%icc,	%g6,	%i2
	fnot1s	%f13,	%f13
	addcc	%l4,	%o0,	%o7
	udiv	%g5,	0x1A62,	%o4
	fbu,a	%fcc0,	loop_2072
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f4
	fxnor	%f6,	%f8,	%f14
	addc	%g1,	%i5,	%g3
loop_2072:
	tgu	%icc,	0x1
	udiv	%i1,	0x0630,	%l1
	fblg	%fcc0,	loop_2073
	tcc	%xcc,	0x2
	add	%o2,	%g2,	%i4
	bshuffle	%f20,	%f6,	%f24
loop_2073:
	nop
	setx	0x163133898061802E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	bvc,a,pt	%icc,	loop_2074
	fba,a	%fcc2,	loop_2075
	brz,a	%i6,	loop_2076
	mova	%icc,	%o5,	%l3
loop_2074:
	fbe,a	%fcc3,	loop_2077
loop_2075:
	fmovsg	%xcc,	%f22,	%f12
loop_2076:
	sir	0x049F
	fxnors	%f3,	%f31,	%f23
loop_2077:
	nop
	setx	0xBB017FE2705850D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fornot1	%f30,	%f18,	%f10
	fmovspos	%icc,	%f12,	%f0
	set	0x10, %g4
	lda	[%l7 + %g4] 0x04,	%f2
	fmovsne	%xcc,	%f0,	%f19
	edge16ln	%l2,	%o3,	%g4
	add	%i7,	0x0E56,	%g7
	add	%i0,	%i3,	%l0
	alignaddrl	%l5,	%l6,	%o6
	movg	%icc,	%o1,	%i2
	movg	%icc,	%l4,	%g6
	fble,a	%fcc1,	loop_2078
	xnor	%o0,	%g5,	%o7
	tcs	%xcc,	0x6
	sdivcc	%g1,	0x0C2A,	%o4
loop_2078:
	nop
	setx	0x4A89A828FC9E47D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f4
	tge	%icc,	0x7
	movpos	%icc,	%i5,	%g3
	udivx	%l1,	0x03B1,	%i1
	bshuffle	%f0,	%f8,	%f16
	edge32	%g2,	%o2,	%i4
	bleu,pn	%icc,	loop_2079
	edge16n	%i6,	%l3,	%o5
	bpos,pn	%xcc,	loop_2080
	tneg	%icc,	0x4
loop_2079:
	movle	%xcc,	%l2,	%o3
	tpos	%icc,	0x7
loop_2080:
	tl	%icc,	0x6
	sir	0x067B
	fmovsg	%xcc,	%f22,	%f31
	tvc	%icc,	0x4
	movrgez	%g4,	%g7,	%i0
	movrne	%i7,	0x071,	%l0
	fmovde	%icc,	%f31,	%f14
	subc	%l5,	%i3,	%o6
	nop
	fitos	%f11,	%f3
	fstox	%f3,	%f2
	fpsub16s	%f4,	%f2,	%f24
	movcc	%icc,	%o1,	%i2
	subc	%l4,	0x0A0C,	%g6
	bge,a	loop_2081
	sub	%o0,	0x1145,	%l6
	edge8n	%o7,	%g1,	%g5
	tsubcctv	%i5,	0x0DF6,	%o4
loop_2081:
	faligndata	%f8,	%f30,	%f22
	fmovrsne	%l1,	%f25,	%f2
	fmovdge	%icc,	%f24,	%f25
	sdivcc	%g3,	0x057C,	%g2
	fmovsvc	%xcc,	%f22,	%f22
	ta	%icc,	0x0
	tsubcctv	%i1,	0x123D,	%o2
	nop
	setx	loop_2082,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andncc	%i4,	%i6,	%o5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l2,	%o3
loop_2082:
	fpsub16s	%f12,	%f24,	%f19
	set	0x0C, %o2
	ldsha	[%l7 + %o2] 0x80,	%l3
	ldub	[%l7 + 0x7E],	%g4
	edge16l	%g7,	%i0,	%l0
	flush	%l7 + 0x18
	sdivx	%l5,	0x0647,	%i7
	wr	%g0,	0x2a,	%asi
	stha	%i3,	[%l7 + 0x76] %asi
	membar	#Sync
	edge32ln	%o6,	%o1,	%i2
	edge32l	%g6,	%l4,	%o0
	fcmple16	%f26,	%f14,	%o7
	addcc	%g1,	%l6,	%i5
	edge32n	%g5,	%o4,	%g3
	fbg	%fcc2,	loop_2083
	edge16l	%l1,	%i1,	%o2
	tn	%xcc,	0x4
	bneg,a	loop_2084
loop_2083:
	sllx	%g2,	%i6,	%o5
	fsrc2s	%f10,	%f15
	subcc	%l2,	%i4,	%l3
loop_2084:
	fpsub32	%f8,	%f30,	%f22
	tge	%xcc,	0x2
	movcs	%icc,	%o3,	%g7
	or	%i0,	%g4,	%l0
	smul	%l5,	0x1823,	%i3
	taddcctv	%o6,	0x11AE,	%i7
	edge32	%o1,	%g6,	%i2
	subcc	%o0,	%o7,	%g1
	nop
	set	0x18, %o4
	stx	%l6,	[%l7 + %o4]
	stbar
	addc	%i5,	0x00DC,	%g5
	movvc	%xcc,	%o4,	%l4
	smulcc	%g3,	%l1,	%o2
	set	0x10, %i4
	lda	[%l7 + %i4] 0x10,	%f10
	xor	%g2,	0x1EE1,	%i6
	udivx	%i1,	0x1EAB,	%o5
	addccc	%i4,	%l3,	%o3
	fand	%f14,	%f20,	%f6
	edge32l	%g7,	%l2,	%g4
	swap	[%l7 + 0x14],	%l0
	tleu	%xcc,	0x4
	bn,a	loop_2085
	fbule,a	%fcc0,	loop_2086
	xorcc	%l5,	%i0,	%i3
	edge8ln	%i7,	%o1,	%g6
loop_2085:
	bl,a	%xcc,	loop_2087
loop_2086:
	tge	%xcc,	0x3
	fnegd	%f18,	%f0
	sra	%i2,	%o6,	%o7
loop_2087:
	umul	%g1,	%o0,	%l6
	bge,a,pn	%icc,	loop_2088
	bgu	loop_2089
	nop
	setx	0x9E85E0CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x05B7B57E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f2,	%f2
	te	%icc,	0x0
loop_2088:
	movcc	%icc,	%i5,	%o4
loop_2089:
	movrne	%g5,	0x2B6,	%g3
	edge16ln	%l1,	%l4,	%g2
	movneg	%icc,	%o2,	%i6
	fmovd	%f16,	%f22
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%f0
	edge16ln	%i1,	%o5,	%l3
	brz	%o3,	loop_2090
	movneg	%icc,	%i4,	%g7
	tleu	%xcc,	0x2
	tge	%xcc,	0x7
loop_2090:
	movg	%icc,	%l2,	%l0
	movgu	%icc,	%g4,	%l5
	membar	0x33
	bge,a	%xcc,	loop_2091
	popc	0x122F,	%i3
	sllx	%i7,	0x18,	%i0
	fbug,a	%fcc1,	loop_2092
loop_2091:
	movneg	%xcc,	%o1,	%i2
	fbug	%fcc3,	loop_2093
	udiv	%o6,	0x048C,	%g6
loop_2092:
	nop
	wr	%g0,	0x21,	%asi
	stxa	%g1,	[%g0 + 0x108] %asi
loop_2093:
	movrgz	%o7,	%l6,	%o0
	or	%i5,	%o4,	%g5
	fbue,a	%fcc1,	loop_2094
	array8	%l1,	%l4,	%g2
	movl	%xcc,	%o2,	%g3
	fbu,a	%fcc0,	loop_2095
loop_2094:
	andcc	%i1,	%i6,	%l3
	edge32n	%o5,	%o3,	%g7
	tcs	%xcc,	0x7
loop_2095:
	movl	%xcc,	%l2,	%i4
	tsubcc	%g4,	%l0,	%l5
	taddcctv	%i7,	%i0,	%o1
	mova	%icc,	%i3,	%i2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	udivcc	%o6,	0x170C,	%g1
	bge,a,pn	%xcc,	loop_2096
	movrgez	%o7,	%l6,	%o0
	fbue,a	%fcc0,	loop_2097
	tge	%icc,	0x1
loop_2096:
	fbne,a	%fcc1,	loop_2098
	brgez	%i5,	loop_2099
loop_2097:
	fcmple32	%f8,	%f28,	%g5
	fmovsa	%icc,	%f7,	%f12
loop_2098:
	bgu,a	%icc,	loop_2100
loop_2099:
	srlx	%l1,	%l4,	%g2
	tl	%xcc,	0x3
	movle	%xcc,	%o2,	%g3
loop_2100:
	nop
	set	0x78, %l1
	lduwa	[%l7 + %l1] 0x14,	%o4
	sdivcc	%i6,	0x116C,	%i1
	array32	%o5,	%o3,	%l3
	brgez,a	%l2,	loop_2101
	lduh	[%l7 + 0x0A],	%i4
	tn	%icc,	0x5
	sra	%g7,	0x1B,	%l0
loop_2101:
	fbo,a	%fcc0,	loop_2102
	be	%xcc,	loop_2103
	umul	%l5,	%i7,	%i0
	addccc	%o1,	%i3,	%g4
loop_2102:
	fbuge,a	%fcc3,	loop_2104
loop_2103:
	orcc	%i2,	0x1B1F,	%o6
	fbe	%fcc3,	loop_2105
	fbl	%fcc1,	loop_2106
loop_2104:
	nop
	setx	0xC3B9232F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xB3196256,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f30,	%f7
	fpadd16s	%f27,	%f16,	%f9
loop_2105:
	movpos	%icc,	%g6,	%o7
loop_2106:
	edge8	%g1,	%l6,	%o0
	addcc	%i5,	%g5,	%l4
	bne,pn	%xcc,	loop_2107
	movre	%g2,	0x30E,	%l1
	taddcctv	%o2,	%o4,	%i6
	bvs	%xcc,	loop_2108
loop_2107:
	mova	%xcc,	%g3,	%o5
	movn	%icc,	%i1,	%o3
	addccc	%l2,	0x0282,	%l3
loop_2108:
	movcs	%xcc,	%i4,	%g7
	fcmpeq32	%f2,	%f18,	%l5
	move	%icc,	%l0,	%i7
	andcc	%o1,	0x03F0,	%i3
	orn	%g4,	0x1946,	%i2
	fmovrsne	%o6,	%f10,	%f1
	movpos	%xcc,	%g6,	%i0
	fsrc1s	%f30,	%f29
	subccc	%o7,	0x1ECA,	%l6
	movg	%icc,	%o0,	%g1
	bg	%xcc,	loop_2109
	srlx	%g5,	0x0D,	%i5
	brnz	%g2,	loop_2110
	movne	%xcc,	%l1,	%l4
loop_2109:
	bvs,pn	%icc,	loop_2111
	ldd	[%l7 + 0x50],	%o4
loop_2110:
	udiv	%o2,	0x053C,	%g3
	ba	%icc,	loop_2112
loop_2111:
	addccc	%o5,	0x054F,	%i1
	fbue,a	%fcc3,	loop_2113
	fmovs	%f17,	%f2
loop_2112:
	edge16ln	%o3,	%i6,	%l2
	bn,pn	%xcc,	loop_2114
loop_2113:
	ble,pt	%icc,	loop_2115
	fmovrsne	%l3,	%f14,	%f30
	mulx	%g7,	0x0205,	%l5
loop_2114:
	fble,a	%fcc1,	loop_2116
loop_2115:
	tcc	%icc,	0x2
	move	%xcc,	%l0,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2116:
	te	%xcc,	0x7
	umul	%o1,	%i3,	%g4
	fbge,a	%fcc3,	loop_2117
	fbule,a	%fcc0,	loop_2118
	move	%xcc,	%i2,	%i4
	ldsb	[%l7 + 0x20],	%o6
loop_2117:
	movl	%xcc,	%i0,	%g6
loop_2118:
	taddcctv	%l6,	0x144F,	%o0
	swap	[%l7 + 0x4C],	%o7
	lduh	[%l7 + 0x22],	%g1
	smulcc	%i5,	%g2,	%g5
	tvs	%icc,	0x3
	fbne	%fcc2,	loop_2119
	fand	%f12,	%f10,	%f12
	mulx	%l1,	%l4,	%o4
	ba,pn	%xcc,	loop_2120
loop_2119:
	edge32l	%o2,	%g3,	%i1
	movrlz	%o5,	0x3A3,	%o3
	swap	[%l7 + 0x64],	%l2
loop_2120:
	fcmpne16	%f24,	%f14,	%i6
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f8
	edge16n	%l3,	%g7,	%l0
	flush	%l7 + 0x18
	bvs,a,pt	%xcc,	loop_2121
	fpsub32	%f10,	%f16,	%f2
	sdivcc	%i7,	0x0F71,	%o1
	tleu	%xcc,	0x1
loop_2121:
	edge16n	%i3,	%l5,	%g4
	sth	%i2,	[%l7 + 0x4A]
	tge	%icc,	0x3
	edge16l	%o6,	%i0,	%i4
	fmovrsne	%l6,	%f4,	%f30
	nop
	set	0x72, %g1
	sth	%g6,	[%l7 + %g1]
	edge8l	%o7,	%g1,	%o0
	fnegd	%f28,	%f18
	movne	%icc,	%g2,	%g5
	fblg,a	%fcc3,	loop_2122
	tvs	%icc,	0x1
	fpack16	%f14,	%f26
	fandnot2	%f14,	%f6,	%f4
loop_2122:
	nop
	setx	0xC98F6979,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xE8BE5CAF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f11,	%f21
	xnorcc	%i5,	%l4,	%l1
	edge16n	%o4,	%o2,	%g3
	movl	%xcc,	%o5,	%i1
	fmovrsgez	%l2,	%f4,	%f19
	nop
	set	0x30, %i5
	ldx	[%l7 + %i5],	%o3
	fpack16	%f8,	%f8
	ldsw	[%l7 + 0x78],	%l3
	move	%xcc,	%i6,	%l0
	edge8l	%g7,	%i7,	%i3
	brz,a	%o1,	loop_2123
	movrne	%g4,	0x124,	%l5
	fzero	%f10
	fblg,a	%fcc0,	loop_2124
loop_2123:
	ldub	[%l7 + 0x4B],	%o6
	fcmpgt16	%f14,	%f10,	%i0
	movn	%icc,	%i4,	%i2
loop_2124:
	fpadd32s	%f29,	%f26,	%f30
	sdivcc	%l6,	0x05D0,	%o7
	movrlez	%g6,	0x0BB,	%g1
	set	0x20, %i7
	sta	%f17,	[%l7 + %i7] 0x89
	xorcc	%o0,	%g5,	%g2
	fmovdpos	%icc,	%f3,	%f9
	orn	%i5,	%l4,	%o4
	fpsub32	%f6,	%f2,	%f14
	fmovdpos	%icc,	%f31,	%f22
	fandnot1	%f26,	%f24,	%f24
	orcc	%l1,	0x1A2D,	%o2
	umulcc	%g3,	%i1,	%o5
	fmovdneg	%icc,	%f25,	%f24
	alignaddrl	%o3,	%l3,	%i6
	movne	%icc,	%l0,	%l2
	subccc	%g7,	%i7,	%o1
	fxnor	%f24,	%f6,	%f26
	fbge,a	%fcc0,	loop_2125
	fbn	%fcc1,	loop_2126
	movrlez	%g4,	%i3,	%l5
	movrlez	%i0,	%o6,	%i4
loop_2125:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x44] %asi,	%l6
loop_2126:
	bpos,a	%icc,	loop_2127
	taddcctv	%o7,	%g6,	%g1
	edge32ln	%o0,	%g5,	%i2
	fpsub16	%f12,	%f26,	%f18
loop_2127:
	nop
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf9
	membar	#Sync
	edge32l	%g2,	%l4,	%i5
	or	%l1,	0x1DDC,	%o2
	wr	%g0,	0x22,	%asi
	stba	%g3,	[%l7 + 0x35] %asi
	membar	#Sync
	xor	%i1,	%o5,	%o3
	movvs	%xcc,	%o4,	%l3
	fmovdpos	%icc,	%f0,	%f28
	smulcc	%l0,	0x19F8,	%l2
	fmovrdlez	%g7,	%f26,	%f28
	tne	%xcc,	0x7
	fmovdpos	%icc,	%f14,	%f21
	set	0x68, %l0
	stha	%i6,	[%l7 + %l0] 0x88
	movpos	%xcc,	%o1,	%g4
	fmovda	%xcc,	%f21,	%f8
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x38] %asi,	%f29
	edge16ln	%i7,	%i3,	%i0
	lduh	[%l7 + 0x3E],	%o6
	fmovrsgz	%i4,	%f1,	%f5
	movl	%xcc,	%l6,	%o7
	add	%l5,	0x171C,	%g1
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x14,	%o0
	fmovrslz	%g6,	%f12,	%f28
	sdiv	%i2,	0x0795,	%g2
	nop
	setx	0x3F1AC3D0F06E9A33,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	xorcc	%l4,	%g5,	%l1
	movvs	%icc,	%o2,	%i5
	fbug,a	%fcc2,	loop_2128
	movvs	%icc,	%g3,	%o5
	alignaddrl	%o3,	%o4,	%l3
	movrlz	%i1,	0x0DF,	%l2
loop_2128:
	srlx	%g7,	%l0,	%o1
	srlx	%i6,	0x15,	%i7
	tn	%icc,	0x4
	array8	%i3,	%i0,	%o6
	movrgez	%g4,	%i4,	%l6
	or	%o7,	%g1,	%l5
	movre	%g6,	0x3D0,	%i2
	movrlz	%g2,	%o0,	%g5
	fsrc2s	%f14,	%f10
	array32	%l4,	%o2,	%i5
	fnegd	%f14,	%f6
	sethi	0x1268,	%l1
	te	%icc,	0x7
	nop
	setx	0x8DADDFD6B360F29E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xB3D652DFA5AE233C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f20,	%f0
	nop
	setx	0x262B04C2888B1E8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x2951787AA7E6F069,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f6,	%f30
	movvs	%xcc,	%g3,	%o3
	nop
	set	0x60, %i6
	sth	%o4,	[%l7 + %i6]
	andncc	%l3,	%i1,	%o5
	or	%g7,	%l2,	%o1
	tsubcctv	%l0,	%i7,	%i6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%i3
	edge32	%i0,	%g4,	%o6
	for	%f10,	%f16,	%f16
	tneg	%xcc,	0x0
	add	%l6,	%o7,	%i4
	xorcc	%g1,	0x15A3,	%l5
	alignaddrl	%g6,	%i2,	%o0
	fnot1s	%f1,	%f21
	edge8l	%g5,	%l4,	%g2
	orn	%i5,	%l1,	%o2
	fble	%fcc1,	loop_2129
	orcc	%g3,	0x1F2E,	%o3
	addcc	%l3,	%i1,	%o5
	tge	%icc,	0x2
loop_2129:
	tsubcctv	%o4,	%g7,	%l2
	alignaddr	%o1,	%l0,	%i6
	orn	%i3,	%i0,	%g4
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i7
	edge32n	%l6,	%o6,	%i4
	ba,a,pt	%icc,	loop_2130
	fmovrsgz	%o7,	%f5,	%f29
	bleu,pn	%xcc,	loop_2131
	movle	%icc,	%l5,	%g1
loop_2130:
	fbue	%fcc1,	loop_2132
	fpmerge	%f0,	%f24,	%f18
loop_2131:
	orcc	%i2,	%o0,	%g5
	bneg	%icc,	loop_2133
loop_2132:
	srlx	%l4,	0x1C,	%g6
	orncc	%i5,	0x1002,	%l1
	andncc	%g2,	%o2,	%g3
loop_2133:
	edge16l	%o3,	%i1,	%l3
	add	%o5,	0x1DE9,	%g7
	fabss	%f30,	%f4
	fmovdleu	%icc,	%f24,	%f14
	orncc	%o4,	%o1,	%l0
	subccc	%i6,	0x1C99,	%i3
	pdist	%f24,	%f28,	%f22
	fsrc2	%f10,	%f18
	edge16n	%l2,	%g4,	%i0
	fsrc1s	%f8,	%f25
	movrne	%i7,	%l6,	%i4
	fbl	%fcc0,	loop_2134
	brz,a	%o7,	loop_2135
	lduw	[%l7 + 0x14],	%l5
	tvs	%xcc,	0x7
loop_2134:
	sll	%o6,	0x09,	%g1
loop_2135:
	array16	%i2,	%g5,	%l4
	fpadd16	%f28,	%f2,	%f6
	edge32	%g6,	%i5,	%l1
	fmovsneg	%xcc,	%f23,	%f28
	tleu	%icc,	0x4
	array8	%o0,	%g2,	%o2
	and	%o3,	%i1,	%g3
	movl	%icc,	%l3,	%g7
	tg	%xcc,	0x5
	and	%o5,	0x0481,	%o1
	sir	0x092A
	fba,a	%fcc0,	loop_2136
	movneg	%icc,	%l0,	%o4
	tgu	%icc,	0x1
	ble,pt	%xcc,	loop_2137
loop_2136:
	fmovscc	%icc,	%f21,	%f7
	tne	%xcc,	0x0
	fbne	%fcc2,	loop_2138
loop_2137:
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
	std	%f10,	[%l7 + 0x70]
	ta	%xcc,	0x2
loop_2138:
	nop
	setx	loop_2140,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2139:
	fbuge,a	%fcc0,	loop_2141
	fmul8x16al	%f4,	%f24,	%f8
	movgu	%xcc,	%i6,	%l2
loop_2140:
	pdist	%f20,	%f12,	%f14
loop_2141:
	fbul,a	%fcc3,	loop_2142
	bl,a,pt	%xcc,	loop_2143
	movcc	%icc,	%i3,	%g4
	orn	%i0,	%l6,	%i7
loop_2142:
	fmovdle	%xcc,	%f7,	%f27
loop_2143:
	fble,a	%fcc1,	loop_2144
	sllx	%o7,	0x14,	%i4
	edge16ln	%o6,	%l5,	%i2
	fmovrdlez	%g1,	%f18,	%f10
loop_2144:
	edge16l	%l4,	%g5,	%i5
	fmovsg	%icc,	%f20,	%f18
	bcs,pn	%icc,	loop_2145
	movrlz	%l1,	%o0,	%g6
	addc	%g2,	%o3,	%o2
	stw	%g3,	[%l7 + 0x40]
loop_2145:
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f14
	tpos	%icc,	0x6
	umul	%l3,	%i1,	%g7
	fpadd32s	%f5,	%f9,	%f4
	movrgez	%o1,	%o5,	%l0
	udiv	%i6,	0x0A46,	%l2
	fsrc2	%f16,	%f8
	fornot1s	%f16,	%f8,	%f24
	andn	%i3,	%g4,	%i0
	orn	%o4,	0x0B4A,	%i7
	popc	0x0E28,	%l6
	edge32n	%o7,	%o6,	%i4
	ldub	[%l7 + 0x11],	%i2
	fmovsl	%xcc,	%f14,	%f0
	fmovdne	%icc,	%f0,	%f12
	sdivcc	%g1,	0x14C4,	%l5
	set	0x0C, %g6
	ldstuba	[%l7 + %g6] 0x80,	%l4
	subc	%g5,	%l1,	%o0
	movgu	%xcc,	%g6,	%i5
	set	0x30, %g3
	ldda	[%l7 + %g3] 0x26,	%g2
	xnor	%o3,	%g3,	%o2
	edge32ln	%l3,	%g7,	%o1
	movrgez	%i1,	0x2E6,	%l0
	fblg	%fcc2,	loop_2146
	fmovse	%icc,	%f24,	%f12
	sethi	0x14A1,	%i6
	fcmpgt16	%f22,	%f28,	%o5
loop_2146:
	movne	%icc,	%l2,	%g4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x32] %asi,	%i0
	brnz	%i3,	loop_2147
	edge16ln	%o4,	%l6,	%i7
	fpsub32	%f10,	%f30,	%f16
	edge16n	%o7,	%i4,	%o6
loop_2147:
	fsrc1s	%f18,	%f20
	alignaddr	%g1,	%l5,	%i2
	ta	%icc,	0x1
	nop
	setx	0x1AB4FF09,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f8
	smulcc	%l4,	%l1,	%o0
	fbug	%fcc0,	loop_2148
	tle	%xcc,	0x4
	fmovrdlez	%g5,	%f10,	%f16
	fornot2s	%f19,	%f30,	%f7
loop_2148:
	bcs,a,pt	%icc,	loop_2149
	sllx	%g6,	0x1B,	%i5
	tcc	%icc,	0x5
	sub	%o3,	%g2,	%o2
loop_2149:
	tcc	%icc,	0x5
	smulcc	%l3,	0x097B,	%g7
	smul	%g3,	%o1,	%l0
	fble	%fcc2,	loop_2150
	movrlez	%i1,	%i6,	%o5
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x24] %asi,	%l2
loop_2150:
	fmovrsgz	%g4,	%f27,	%f11
	subccc	%i3,	0x0088,	%i0
	fpadd16s	%f17,	%f13,	%f28
	edge16ln	%l6,	%i7,	%o4
	sdivcc	%o7,	0x1F89,	%i4
	tsubcc	%o6,	%g1,	%l5
	bvs,pn	%icc,	loop_2151
	udivcc	%l4,	0x0CE0,	%i2
	alignaddrl	%o0,	%g5,	%g6
	set	0x4C, %i3
	ldswa	[%l7 + %i3] 0x88,	%l1
loop_2151:
	lduh	[%l7 + 0x12],	%o3
	st	%f9,	[%l7 + 0x5C]
	subccc	%g2,	0x1745,	%o2
	tle	%xcc,	0x4
	movn	%xcc,	%i5,	%g7
	udiv	%g3,	0x1E6B,	%l3
	xor	%o1,	%l0,	%i6
	move	%xcc,	%i1,	%o5
	fmovscc	%icc,	%f7,	%f21
	fba	%fcc2,	loop_2152
	nop
	setx	0xD0EAF9F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x8C810EB7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f3,	%f3
	fxor	%f24,	%f22,	%f8
	movn	%icc,	%g4,	%i3
loop_2152:
	movcc	%icc,	%i0,	%l6
	tcc	%xcc,	0x2
	subcc	%l2,	%i7,	%o7
	edge32ln	%o4,	%o6,	%i4
	or	%l5,	%l4,	%g1
	srax	%o0,	%g5,	%g6
	bcs,pn	%xcc,	loop_2153
	fbg	%fcc0,	loop_2154
	movrgez	%i2,	0x2C3,	%l1
	nop
	setx	0x53236D753CD3DCC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF632D134F91753DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f12,	%f2
loop_2153:
	alignaddrl	%o3,	%o2,	%i5
loop_2154:
	fornot2	%f20,	%f6,	%f26
	orcc	%g2,	0x1B6A,	%g3
	umul	%g7,	%o1,	%l3
	wr	%g0,	0x18,	%asi
	stba	%l0,	[%l7 + 0x77] %asi
	fmovsne	%icc,	%f24,	%f5
	fbl	%fcc1,	loop_2155
	fmovsvc	%icc,	%f7,	%f5
	tge	%xcc,	0x1
	edge32	%i6,	%i1,	%o5
loop_2155:
	ta	%icc,	0x1
	movrne	%i3,	%g4,	%i0
	nop
	setx	0xB3399E622963D8ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xCEF0626CED368120,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f12,	%f20
	movrgez	%l6,	0x0F5,	%l2
	nop
	fitod	%f4,	%f16
	fdtoi	%f16,	%f9
	edge16	%o7,	%o4,	%o6
	udiv	%i7,	0x12D2,	%i4
	xor	%l5,	0x1465,	%l4
	fbg,a	%fcc1,	loop_2156
	tgu	%icc,	0x1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x24] %asi,	%g1
loop_2156:
	stb	%o0,	[%l7 + 0x77]
	tne	%xcc,	0x7
	nop
	setx	0x9942FE0EB0732697,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	movvc	%icc,	%g5,	%g6
	fnors	%f29,	%f23,	%f23
	movvc	%xcc,	%l1,	%o3
	movcs	%icc,	%i2,	%o2
	ldd	[%l7 + 0x40],	%i4
	mulx	%g2,	%g7,	%o1
	nop
	setx	0x4B6AEB4FB8054E5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xA4AF84FE3207FA3A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f10,	%f16
	sub	%l3,	0x163B,	%l0
	movrne	%g3,	%i6,	%i1
	set	0x3A, %i0
	lduha	[%l7 + %i0] 0x89,	%i3
	mova	%icc,	%o5,	%g4
	nop
	fitod	%f10,	%f6
	fdtos	%f6,	%f22
	set	0x30, %i2
	ldda	[%l7 + %i2] 0x81,	%i0
	tpos	%xcc,	0x6
	nop
	set	0x42, %g5
	sth	%l2,	[%l7 + %g5]
	tle	%xcc,	0x3
	movge	%icc,	%o7,	%o4
	mulx	%o6,	0x086C,	%i7
	alignaddr	%i4,	%l5,	%l6
	fors	%f6,	%f18,	%f11
	tsubcctv	%g1,	0x16FB,	%o0
	bleu,pt	%icc,	loop_2157
	tleu	%xcc,	0x6
	addccc	%l4,	0x09C2,	%g5
	wr	%g0,	0x21,	%asi
	stxa	%g6,	[%g0 + 0x8] %asi
loop_2157:
	tpos	%icc,	0x5
	bg,a	%icc,	loop_2158
	tl	%icc,	0x4
	srax	%l1,	0x1B,	%o3
	lduw	[%l7 + 0x64],	%o2
loop_2158:
	fbl	%fcc1,	loop_2159
	bneg,a,pn	%xcc,	loop_2160
	movre	%i5,	%g2,	%g7
	brgez	%o1,	loop_2161
loop_2159:
	tcs	%xcc,	0x4
loop_2160:
	alignaddr	%l3,	%l0,	%i2
	set	0x70, %o6
	swapa	[%l7 + %o6] 0x88,	%g3
loop_2161:
	nop
	set	0x70, %l5
	prefetcha	[%l7 + %l5] 0x0c,	 0x3
	udivx	%i3,	0x1065,	%o5
	bpos	loop_2162
	fbne,a	%fcc3,	loop_2163
	subc	%g4,	%i0,	%l2
	or	%o7,	0x08A8,	%o4
loop_2162:
	and	%i1,	0x1458,	%o6
loop_2163:
	movrgez	%i4,	%l5,	%i7
	nop
	setx	loop_2164,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%icc,	%l6,	%o0
	subccc	%g1,	%g5,	%g6
	bcc,pt	%icc,	loop_2165
loop_2164:
	fmovdne	%xcc,	%f11,	%f20
	fbl,a	%fcc1,	loop_2166
	mulscc	%l4,	0x03E6,	%o3
loop_2165:
	tcs	%icc,	0x6
	fbe	%fcc0,	loop_2167
loop_2166:
	edge8n	%l1,	%i5,	%o2
	fmovdvc	%icc,	%f13,	%f16
	ldub	[%l7 + 0x24],	%g7
loop_2167:
	popc	0x0C4A,	%o1
	srax	%g2,	%l3,	%i2
	bvc	%icc,	loop_2168
	edge8n	%l0,	%g3,	%i6
	popc	0x1DCC,	%o5
	ldub	[%l7 + 0x16],	%i3
loop_2168:
	ld	[%l7 + 0x20],	%f19
	popc	0x1A55,	%i0
	array32	%g4,	%o7,	%o4
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x50] %asi,	%l2
	movge	%xcc,	%i1,	%i4
	sdivcc	%l5,	0x08B0,	%i7
	edge32	%l6,	%o0,	%o6
	fmovrsne	%g1,	%f16,	%f27
	movrne	%g6,	0x2FC,	%g5
	smul	%o3,	0x0CCA,	%l1
	nop
	set	0x08, %o0
	ldx	[%l7 + %o0],	%l4
	fmovdpos	%icc,	%f26,	%f23
	fba	%fcc3,	loop_2169
	fmovsge	%icc,	%f9,	%f27
	edge16l	%i5,	%o2,	%o1
	orcc	%g7,	0x1902,	%l3
loop_2169:
	fmovdgu	%icc,	%f26,	%f30
	xnorcc	%g2,	0x1FD4,	%l0
	tn	%xcc,	0x4
	movrne	%g3,	%i2,	%i6
	fbl	%fcc0,	loop_2170
	fnot1	%f16,	%f10
	flush	%l7 + 0x2C
	fmovsneg	%icc,	%f14,	%f27
loop_2170:
	fmovdgu	%xcc,	%f20,	%f18
	tsubcc	%i3,	%i0,	%g4
	nop
	fitod	%f4,	%f4
	fdtox	%f4,	%f2
	addc	%o7,	%o5,	%o4
	edge16n	%l2,	%i1,	%i4
	tge	%xcc,	0x7
	sethi	0x1D24,	%l5
	umulcc	%i7,	%o0,	%o6
	edge16l	%l6,	%g1,	%g5
	bgu,a,pt	%icc,	loop_2171
	taddcc	%g6,	%l1,	%o3
	ldsb	[%l7 + 0x7E],	%i5
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2171:
	fmul8x16au	%f7,	%f1,	%f2
	tsubcc	%l4,	0x14CF,	%o1
	edge16ln	%o2,	%l3,	%g2
	fpackfix	%f14,	%f22
	nop
	setx	0x13F9F5E082A21858,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x23F123946E2B166E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f0,	%f0
	set	0x66, %g2
	lduha	[%l7 + %g2] 0x80,	%l0
	nop
	setx	0x104C8FA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	alignaddr	%g3,	%i2,	%i6
	bn,a,pt	%icc,	loop_2172
	flush	%l7 + 0x6C
	fpsub16s	%f11,	%f10,	%f16
	sll	%i3,	0x10,	%i0
loop_2172:
	add	%g4,	%o7,	%g7
	fnegs	%f22,	%f26
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x74] %asi,	%o4
	brlez,a	%o5,	loop_2173
	taddcc	%i1,	%l2,	%l5
	taddcctv	%i4,	%i7,	%o0
	fba	%fcc1,	loop_2174
loop_2173:
	fmovrslz	%o6,	%f2,	%f17
	fnot2	%f8,	%f0
	add	%g1,	0x0296,	%g5
loop_2174:
	tge	%xcc,	0x0
	fmovdcs	%xcc,	%f14,	%f11
	fmovdvs	%icc,	%f5,	%f19
	popc	0x08C7,	%l6
	fmovdge	%icc,	%f12,	%f30
	fmovsa	%icc,	%f3,	%f28
	tleu	%xcc,	0x7
	tcc	%xcc,	0x7
	fmovdvs	%icc,	%f28,	%f0
	mulscc	%g6,	%l1,	%o3
	edge8l	%l4,	%o1,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l3,	0x1275,	%g2
	udivcc	%o2,	0x0016,	%l0
	fmovsleu	%icc,	%f23,	%f11
	movrlez	%i2,	%i6,	%i3
	wr	%g0,	0x80,	%asi
	sta	%f5,	[%l7 + 0x40] %asi
	fcmpgt32	%f12,	%f8,	%g3
	movpos	%icc,	%g4,	%i0
	nop
	setx	0xC9EAADB1B07CB626,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	tle	%icc,	0x0
	xnorcc	%o7,	0x09A3,	%o4
	swap	[%l7 + 0x58],	%g7
	subc	%i1,	%o5,	%l5
	edge16	%i4,	%i7,	%l2
	tleu	%icc,	0x7
	movcc	%xcc,	%o6,	%g1
	sir	0x01C2
	movre	%o0,	%l6,	%g5
	orn	%g6,	%o3,	%l4
	fbue	%fcc0,	loop_2175
	pdist	%f18,	%f28,	%f6
	andcc	%l1,	0x1A5B,	%o1
	orcc	%l3,	0x0871,	%g2
loop_2175:
	edge16l	%o2,	%i5,	%i2
	subccc	%l0,	%i3,	%g3
	xorcc	%i6,	0x169E,	%i0
	edge8l	%o7,	%o4,	%g4
	edge16n	%g7,	%o5,	%i1
	popc	%l5,	%i4
	set	0x78, %o7
	ldswa	[%l7 + %o7] 0x0c,	%l2
	fmuld8sux16	%f6,	%f10,	%f8
	alignaddr	%o6,	%g1,	%i7
	fpsub32s	%f7,	%f21,	%f4
	tsubcc	%o0,	%g5,	%l6
	edge8	%g6,	%l4,	%o3
	edge8ln	%o1,	%l1,	%l3
	movne	%xcc,	%g2,	%o2
	tcs	%xcc,	0x3
	fbul	%fcc3,	loop_2176
	fmovsleu	%xcc,	%f24,	%f3
	udiv	%i5,	0x19FA,	%i2
	tneg	%xcc,	0x6
loop_2176:
	fcmpgt32	%f30,	%f20,	%l0
	smul	%g3,	%i3,	%i6
	set	0x73, %l2
	stba	%i0,	[%l7 + %l2] 0x14
	and	%o7,	0x001B,	%g4
	umul	%g7,	%o5,	%i1
	stw	%o4,	[%l7 + 0x28]
	ldsh	[%l7 + 0x62],	%i4
	xorcc	%l2,	%o6,	%l5
	swap	[%l7 + 0x3C],	%g1
	movg	%xcc,	%o0,	%i7
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%g5
	fbg,a	%fcc2,	loop_2177
	nop
	setx	loop_2178,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvc,pt	%icc,	loop_2179
	movrlez	%g6,	%l4,	%o3
loop_2177:
	fmovdg	%xcc,	%f5,	%f21
loop_2178:
	udivx	%o1,	0x1F9E,	%l1
loop_2179:
	ldd	[%l7 + 0x58],	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l6,	%l3,	%o2
	fbul,a	%fcc2,	loop_2180
	orncc	%g2,	%i5,	%i2
	tgu	%icc,	0x1
	be	loop_2181
loop_2180:
	fnor	%f28,	%f10,	%f18
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x53] %asi,	%l0
loop_2181:
	mulx	%i3,	%g3,	%i0
	array8	%o7,	%g4,	%g7
	nop
	fitos	%f2,	%f9
	fmovrde	%o5,	%f2,	%f8
	movn	%xcc,	%i6,	%i1
	tl	%xcc,	0x7
	sth	%i4,	[%l7 + 0x64]
	bn	%xcc,	loop_2182
	edge16	%l2,	%o4,	%l5
	movcs	%icc,	%g1,	%o6
	fcmpne16	%f8,	%f16,	%o0
loop_2182:
	sth	%g5,	[%l7 + 0x7A]
	edge8n	%i7,	%l4,	%o3
	fble,a	%fcc1,	loop_2183
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f21,	%f23,	%f6
	movre	%g6,	%o1,	%l1
loop_2183:
	brgez	%l3,	loop_2184
	fmovsgu	%icc,	%f20,	%f5
	movrlz	%o2,	%g2,	%i5
	movvs	%xcc,	%l6,	%i2
loop_2184:
	nop
	fitos	%f10,	%f17
	fstox	%f17,	%f26
	fxtos	%f26,	%f21
	fands	%f26,	%f24,	%f9
	fpsub32s	%f31,	%f0,	%f18
	sll	%i3,	%l0,	%i0
	fbule	%fcc3,	loop_2185
	srax	%o7,	%g4,	%g7
	call	loop_2186
	ldsw	[%l7 + 0x20],	%o5
loop_2185:
	array32	%i6,	%i1,	%g3
	movgu	%xcc,	%i4,	%l2
loop_2186:
	movre	%o4,	0x2FB,	%g1
	membar	0x59
	edge8l	%l5,	%o0,	%g5
	tvs	%xcc,	0x5
	edge16ln	%o6,	%l4,	%i7
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x57] %asi,	%g6
	nop
	set	0x52, %l3
	ldsb	[%l7 + %l3],	%o3
	nop
	setx	0x335EC71D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xA2DE7FBF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f0,	%f19
	fpsub16	%f0,	%f22,	%f16
	smulcc	%o1,	%l3,	%o2
	nop
	setx	0x0DD881EFB0751FC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	andn	%g2,	%i5,	%l6
	edge16ln	%l1,	%i2,	%i3
	nop
	fitod	%f10,	%f20
	fdtoi	%f20,	%f9
	edge8	%i0,	%o7,	%l0
	movre	%g7,	0x0A8,	%g4
	edge32n	%i6,	%o5,	%i1
	set	0x6C, %i1
	stwa	%i4,	[%l7 + %i1] 0x23
	membar	#Sync
	edge32	%l2,	%g3,	%o4
	stb	%l5,	[%l7 + 0x41]
	fmovdvs	%xcc,	%f5,	%f30
	for	%f30,	%f14,	%f14
	movge	%icc,	%g1,	%g5
	tge	%icc,	0x6
	umulcc	%o0,	%o6,	%l4
	subcc	%i7,	0x0558,	%g6
	mova	%icc,	%o3,	%l3
	ta	%xcc,	0x2
	nop
	fitos	%f12,	%f12
	edge8ln	%o1,	%o2,	%g2
	brlez	%l6,	loop_2187
	add	%l1,	%i2,	%i5
	bg,pn	%xcc,	loop_2188
	movg	%icc,	%i3,	%i0
loop_2187:
	fmovdpos	%xcc,	%f11,	%f20
	move	%icc,	%o7,	%g7
loop_2188:
	fpack32	%f20,	%f8,	%f28
	fble	%fcc1,	loop_2189
	fblg,a	%fcc2,	loop_2190
	movleu	%icc,	%g4,	%l0
	ld	[%l7 + 0x08],	%f2
loop_2189:
	subcc	%o5,	%i1,	%i6
loop_2190:
	umulcc	%l2,	%g3,	%i4
	wr	%g0,	0x80,	%asi
	sta	%f12,	[%l7 + 0x20] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l5,	0x0D4B,	%o4
	fmul8ulx16	%f14,	%f0,	%f22
	tvc	%xcc,	0x0
	fmovrdlez	%g1,	%f12,	%f0
	bcs,a,pn	%icc,	loop_2191
	smul	%g5,	0x0A9D,	%o0
	fmovsle	%icc,	%f8,	%f30
	andn	%l4,	%i7,	%o6
loop_2191:
	srlx	%g6,	%o3,	%l3
	ta	%xcc,	0x7
	ldub	[%l7 + 0x7E],	%o1
	edge32	%g2,	%o2,	%l1
	movgu	%xcc,	%l6,	%i5
	taddcc	%i2,	0x0D55,	%i0
	fbn	%fcc2,	loop_2192
	nop
	fitos	%f21,	%f28
	movvs	%icc,	%o7,	%i3
	bshuffle	%f20,	%f24,	%f6
loop_2192:
	nop
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x44] %asi,	%g4
	movn	%xcc,	%g7,	%o5
	movleu	%icc,	%l0,	%i1
	tn	%icc,	0x3
	pdist	%f14,	%f6,	%f24
	addccc	%l2,	%g3,	%i4
	fpsub32s	%f24,	%f19,	%f14
	smul	%l5,	%o4,	%i6
	fmovdg	%xcc,	%f24,	%f27
	alignaddrl	%g5,	%g1,	%o0
	swap	[%l7 + 0x64],	%i7
	sra	%l4,	0x16,	%g6
	edge32	%o3,	%o6,	%l3
	fmovsge	%icc,	%f19,	%f21
	srl	%g2,	%o1,	%l1
	movl	%icc,	%l6,	%i5
	fbe,a	%fcc1,	loop_2193
	fmovspos	%xcc,	%f7,	%f1
	fcmpeq16	%f4,	%f16,	%i2
	tle	%icc,	0x5
loop_2193:
	fnot2s	%f23,	%f17
	wr	%g0,	0x22,	%asi
	stha	%o2,	[%l7 + 0x3C] %asi
	membar	#Sync
	fbl,a	%fcc3,	loop_2194
	bl	%xcc,	loop_2195
	edge32l	%i0,	%o7,	%g4
	fmul8sux16	%f6,	%f28,	%f22
loop_2194:
	fmovrdgez	%i3,	%f30,	%f8
loop_2195:
	addc	%o5,	%g7,	%i1
	edge32	%l2,	%l0,	%g3
	movre	%i4,	0x175,	%l5
	addc	%o4,	0x0065,	%i6
	fnot2s	%f16,	%f6
	sdivcc	%g5,	0x0F4F,	%g1
	tcc	%icc,	0x2
	tvc	%xcc,	0x0
	movl	%icc,	%o0,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a	loop_2196
	bgu,a	%xcc,	loop_2197
	ldub	[%l7 + 0x67],	%g6
	sir	0x0793
loop_2196:
	fmovrdgz	%o3,	%f12,	%f20
loop_2197:
	fmovde	%xcc,	%f30,	%f28
	movrlz	%l4,	0x221,	%o6
	andn	%g2,	%o1,	%l1
	ldsh	[%l7 + 0x56],	%l6
	movrlz	%l3,	%i5,	%o2
	tg	%xcc,	0x0
	ld	[%l7 + 0x3C],	%f22
	edge32l	%i0,	%o7,	%i2
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x1e
	membar	#Sync
	ldd	[%l7 + 0x10],	%i2
	bcs,pn	%xcc,	loop_2198
	fmovrdgez	%o5,	%f8,	%f2
	mulscc	%g4,	0x0205,	%g7
	sll	%l2,	0x05,	%l0
loop_2198:
	nop
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%i1
	bpos,a,pt	%icc,	loop_2199
	addc	%i4,	%l5,	%g3
	movcs	%xcc,	%i6,	%g5
	stbar
loop_2199:
	tge	%xcc,	0x2
	brz,a	%o4,	loop_2200
	add	%o0,	0x014F,	%i7
	umulcc	%g1,	0x081B,	%g6
	xnorcc	%o3,	%l4,	%g2
loop_2200:
	fpsub32s	%f23,	%f2,	%f25
	addc	%o6,	0x022A,	%o1
	array32	%l6,	%l3,	%i5
	fbge,a	%fcc3,	loop_2201
	fbuge,a	%fcc0,	loop_2202
	tn	%xcc,	0x6
	fone	%f2
loop_2201:
	addc	%l1,	0x102C,	%o2
loop_2202:
	nop
	setx	loop_2203,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movneg	%xcc,	%o7,	%i2
	fandnot2s	%f12,	%f15,	%f31
	xnorcc	%i0,	%o5,	%i3
loop_2203:
	tvc	%icc,	0x4
	fcmple32	%f10,	%f16,	%g7
	sethi	0x152F,	%g4
	and	%l2,	%i1,	%l0
	ldd	[%l7 + 0x10],	%f6
	edge16l	%l5,	%i4,	%i6
	srax	%g3,	0x08,	%o4
	movvs	%icc,	%o0,	%g5
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x59] %asi,	%g1
	addc	%i7,	%g6,	%o3
	swap	[%l7 + 0x78],	%g2
	sdiv	%l4,	0x1ED2,	%o1
	and	%l6,	%l3,	%i5
	udiv	%l1,	0x139E,	%o6
	fmovdle	%xcc,	%f2,	%f1
	nop
	fitod	%f0,	%f2
	fdtos	%f2,	%f6
	movne	%icc,	%o2,	%i2
	orcc	%i0,	0x096D,	%o7
	tcc	%icc,	0x0
	smul	%i3,	%g7,	%g4
	movpos	%icc,	%o5,	%i1
	tcc	%icc,	0x1
	nop
	setx	0x56105C059D1DF4FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x21AAA856C8BE55AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f0,	%f6
	bl	loop_2204
	tn	%xcc,	0x2
	nop
	setx	0x0712516B204643A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	bvc,pn	%icc,	loop_2205
loop_2204:
	tle	%xcc,	0x4
	tcc	%xcc,	0x0
	fmovrslez	%l0,	%f22,	%f21
loop_2205:
	fornot2	%f10,	%f18,	%f30
	movle	%icc,	%l5,	%l2
	tcs	%xcc,	0x3
	prefetch	[%l7 + 0x50],	 0x3
	fcmpgt32	%f14,	%f22,	%i6
	or	%i4,	%o4,	%g3
	sdivcc	%g5,	0x1CC6,	%o0
	mulx	%g1,	0x1770,	%g6
	fbn,a	%fcc0,	loop_2206
	lduw	[%l7 + 0x3C],	%i7
	sub	%g2,	0x0AB1,	%o3
	nop
	fitos	%f0,	%f27
	fstoi	%f27,	%f3
loop_2206:
	fmovde	%icc,	%f14,	%f7
	srlx	%l4,	%l6,	%o1
	sdivx	%l3,	0x0D49,	%l1
	sir	0x15D7
	movne	%xcc,	%o6,	%o2
	alignaddr	%i5,	%i0,	%i2
	bleu,pn	%icc,	loop_2207
	fmovspos	%xcc,	%f6,	%f26
	fmovsg	%icc,	%f13,	%f17
	bneg,a	%icc,	loop_2208
loop_2207:
	movgu	%icc,	%o7,	%i3
	wr	%g0,	0x89,	%asi
	stwa	%g7,	[%l7 + 0x68] %asi
loop_2208:
	movg	%xcc,	%g4,	%i1
	fmul8sux16	%f28,	%f26,	%f28
	umul	%l0,	0x15D3,	%o5
	te	%xcc,	0x6
	nop
	setx	0xC052FD02450E3956,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE466FB0D275CAB0C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f16,	%f28
	move	%xcc,	%l5,	%l2
	membar	0x2E
	fmovdvs	%icc,	%f2,	%f2
	tl	%xcc,	0x6
	nop
	setx	0xEF85E9CDE6290D59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xABA816FC63C44494,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f6,	%f0
	fpackfix	%f4,	%f28
	fandnot1	%f2,	%f24,	%f20
	tgu	%xcc,	0x0
	edge8	%i4,	%i6,	%g3
	ldsb	[%l7 + 0x0D],	%o4
	fzeros	%f20
	fmovsgu	%icc,	%f7,	%f0
	fmovscs	%xcc,	%f25,	%f8
	fandnot2	%f4,	%f6,	%f10
	xnor	%g5,	0x1F40,	%g1
	tle	%icc,	0x0
	bvs	loop_2209
	xnor	%o0,	0x0D8A,	%g6
	movrgez	%g2,	0x2BD,	%o3
	movgu	%icc,	%l4,	%l6
loop_2209:
	tsubcctv	%o1,	0x10A7,	%l3
	wr	%g0,	0x89,	%asi
	stwa	%i7,	[%l7 + 0x14] %asi
	movrgz	%l1,	0x35E,	%o6
	mova	%icc,	%o2,	%i0
	fmul8x16	%f19,	%f18,	%f20
	tsubcc	%i5,	0x117F,	%o7
	sll	%i3,	0x1F,	%i2
	fmovscs	%icc,	%f22,	%f5
	edge32l	%g7,	%i1,	%l0
	tcc	%xcc,	0x0
	fpadd16s	%f6,	%f30,	%f22
	fcmpgt16	%f0,	%f8,	%o5
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l5
	te	%xcc,	0x3
	st	%f31,	[%l7 + 0x1C]
	subc	%l2,	%i4,	%g4
	bvs,a	loop_2210
	tne	%xcc,	0x2
	edge32l	%i6,	%g3,	%g5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2A] %asi,	%g1
loop_2210:
	ble,a,pn	%icc,	loop_2211
	xnorcc	%o4,	0x1636,	%g6
	andcc	%g2,	%o3,	%o0
	fble,a	%fcc2,	loop_2212
loop_2211:
	movcs	%xcc,	%l6,	%o1
	fmovda	%icc,	%f1,	%f25
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%l4
loop_2212:
	nop
	fitos	%f26,	%f18
	movn	%icc,	%i7,	%l1
	bn,pt	%icc,	loop_2213
	membar	0x12
	edge16ln	%o6,	%o2,	%l3
	fnors	%f31,	%f23,	%f6
loop_2213:
	nop
	set	0x14, %g4
	sta	%f17,	[%l7 + %g4] 0x81
	sdivx	%i5,	0x0A20,	%o7
	tvc	%xcc,	0x2
	movcs	%icc,	%i0,	%i2
	edge8l	%i3,	%i1,	%l0
	stbar
	fmovrdgz	%o5,	%f0,	%f16
	tl	%xcc,	0x6
	tne	%xcc,	0x3
	movgu	%icc,	%g7,	%l5
	brlz,a	%i4,	loop_2214
	mulscc	%l2,	0x0167,	%i6
	mulx	%g3,	%g4,	%g5
	sub	%o4,	0x0DB1,	%g6
loop_2214:
	movneg	%xcc,	%g1,	%g2
	subc	%o0,	0x0232,	%o3
	xnor	%o1,	%l6,	%l4
	fbule	%fcc1,	loop_2215
	tsubcctv	%i7,	0x0800,	%o6
	srl	%l1,	0x18,	%l3
	membar	0x00
loop_2215:
	fcmple32	%f16,	%f10,	%i5
	tn	%xcc,	0x0
	ld	[%l7 + 0x20],	%f17
	array16	%o2,	%o7,	%i2
	umul	%i0,	0x0B45,	%i3
	set	0x6B, %o2
	lduba	[%l7 + %o2] 0x88,	%i1
	fnot1s	%f4,	%f25
	alignaddrl	%o5,	%l0,	%g7
	fmovrdlez	%i4,	%f24,	%f30
	subcc	%l2,	0x1AE9,	%l5
	lduw	[%l7 + 0x28],	%g3
	xor	%i6,	0x0F7F,	%g4
	orncc	%g5,	%g6,	%o4
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x1f
	membar	#Sync
	edge16ln	%g1,	%g2,	%o0
	set	0x4C, %o4
	stba	%o1,	[%l7 + %o4] 0x19
	add	%l6,	%l4,	%o3
	fbg,a	%fcc0,	loop_2216
	nop
	setx	0x391F84A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f8
	alignaddr	%i7,	%l1,	%o6
	tg	%xcc,	0x4
loop_2216:
	fcmpgt16	%f22,	%f6,	%i5
	ldsh	[%l7 + 0x36],	%o2
	tsubcctv	%o7,	0x151F,	%l3
	fmovda	%xcc,	%f0,	%f28
	set	0x68, %l6
	ldsba	[%l7 + %l6] 0x88,	%i0
	umulcc	%i3,	%i1,	%i2
	move	%xcc,	%l0,	%o5
	taddcc	%g7,	%l2,	%l5
	for	%f2,	%f0,	%f24
	alignaddrl	%g3,	%i6,	%g4
	movrlez	%g5,	%g6,	%i4
	tsubcc	%o4,	%g2,	%o0
	tneg	%icc,	0x3
	nop
	set	0x24, %i4
	sth	%o1,	[%l7 + %i4]
	ldsw	[%l7 + 0x3C],	%g1
	fmovdgu	%icc,	%f16,	%f18
	udivx	%l6,	0x0208,	%l4
	tne	%xcc,	0x2
	tvs	%xcc,	0x0
	orncc	%i7,	%o3,	%l1
	wr	%g0,	0x04,	%asi
	stba	%i5,	[%l7 + 0x31] %asi
	tleu	%xcc,	0x3
	nop
	setx	0xFB6C7688,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x943CB58B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f12,	%f5
	edge32n	%o2,	%o6,	%l3
	tsubcc	%o7,	0x0625,	%i0
	bne,a,pn	%icc,	loop_2217
	srl	%i1,	0x0D,	%i2
	fmovdge	%icc,	%f0,	%f26
	mulx	%l0,	%i3,	%g7
loop_2217:
	bneg	%xcc,	loop_2218
	tg	%icc,	0x1
	fmovsa	%icc,	%f11,	%f17
	orncc	%o5,	0x1FC1,	%l2
loop_2218:
	movneg	%xcc,	%l5,	%g3
	fmovdgu	%icc,	%f25,	%f6
	brlz,a	%i6,	loop_2219
	fors	%f1,	%f12,	%f18
	fsrc1s	%f21,	%f16
	movrlz	%g5,	%g6,	%i4
loop_2219:
	prefetch	[%l7 + 0x40],	 0x2
	sllx	%g4,	0x00,	%g2
	ldsh	[%l7 + 0x7E],	%o4
	movrne	%o1,	%g1,	%l6
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x30] %asi,	%l4
	bleu	loop_2220
	edge16	%o0,	%i7,	%o3
	fblg,a	%fcc0,	loop_2221
	fmovsge	%icc,	%f29,	%f3
loop_2220:
	sdiv	%i5,	0x1AD3,	%o2
	xor	%o6,	0x16FF,	%l3
loop_2221:
	sra	%l1,	%o7,	%i1
	tsubcctv	%i0,	0x11D1,	%l0
	edge32ln	%i3,	%i2,	%o5
	tpos	%xcc,	0x7
	fbue	%fcc2,	loop_2222
	movre	%l2,	0x1F1,	%g7
	sir	0x1424
	nop
	setx	0x006178C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
loop_2222:
	fsrc2s	%f25,	%f17
	sth	%l5,	[%l7 + 0x56]
	sllx	%g3,	%i6,	%g5
	movcc	%xcc,	%i4,	%g4
	fxnor	%f8,	%f22,	%f0
	fandnot2s	%f10,	%f6,	%f30
	fbn	%fcc0,	loop_2223
	sir	0x1FD4
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f4
	fmul8ulx16	%f6,	%f4,	%f26
loop_2223:
	movre	%g2,	0x283,	%g6
	subc	%o4,	%o1,	%l6
	tpos	%icc,	0x3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x5C] %asi,	%l4
	sdiv	%g1,	0x1506,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o3,	%i5,	%o2
	movpos	%icc,	%o0,	%l3
	array16	%l1,	%o6,	%o7
	andcc	%i1,	%l0,	%i3
	fmovsn	%xcc,	%f24,	%f21
	alignaddr	%i2,	%o5,	%i0
	fzeros	%f21
	tvc	%xcc,	0x6
	subc	%g7,	%l2,	%l5
	taddcctv	%g3,	%g5,	%i6
	fbne	%fcc0,	loop_2224
	bcc,a,pt	%icc,	loop_2225
	edge16ln	%i4,	%g4,	%g6
	fors	%f9,	%f6,	%f5
loop_2224:
	tn	%icc,	0x4
loop_2225:
	fsrc1s	%f2,	%f20
	mulscc	%g2,	%o4,	%l6
	fcmpgt16	%f16,	%f2,	%l4
	fandnot2s	%f7,	%f1,	%f6
	sdiv	%o1,	0x0F22,	%g1
	fmul8x16al	%f9,	%f5,	%f4
	xor	%o3,	%i5,	%i7
	nop
	fitos	%f16,	%f22
	nop
	fitod	%f10,	%f22
	fdtoi	%f22,	%f4
	brz,a	%o2,	loop_2226
	bleu	loop_2227
	edge16ln	%l3,	%o0,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2226:
	tn	%icc,	0x3
loop_2227:
	andncc	%o6,	%i1,	%l0
	fsrc2s	%f16,	%f11
	array8	%o7,	%i2,	%o5
	fbn,a	%fcc3,	loop_2228
	tneg	%icc,	0x6
	stb	%i3,	[%l7 + 0x5C]
	andcc	%i0,	%g7,	%l2
loop_2228:
	stb	%g3,	[%l7 + 0x30]
	tpos	%xcc,	0x6
	udivcc	%l5,	0x1085,	%i6
	movgu	%xcc,	%g5,	%i4
	and	%g4,	%g2,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l6,	[%l7 + 0x62]
	edge32n	%g6,	%l4,	%o1
	set	0x18, %l1
	sta	%f20,	[%l7 + %l1] 0x10
	ldsh	[%l7 + 0x3E],	%g1
	andncc	%o3,	%i7,	%o2
	set	0x4D, %g1
	lduba	[%l7 + %g1] 0x04,	%l3
	umulcc	%o0,	0x17E7,	%l1
	fmovrsgez	%i5,	%f28,	%f27
	brgez,a	%o6,	loop_2229
	bge,a	%icc,	loop_2230
	taddcc	%l0,	%o7,	%i2
	edge8l	%o5,	%i1,	%i3
loop_2229:
	fbug,a	%fcc3,	loop_2231
loop_2230:
	bne,a	loop_2232
	sllx	%i0,	0x09,	%g7
	bl,a	loop_2233
loop_2231:
	addccc	%g3,	0x19B3,	%l2
loop_2232:
	fmovdcc	%xcc,	%f13,	%f7
	udivcc	%l5,	0x0C14,	%g5
loop_2233:
	umulcc	%i4,	%i6,	%g4
	tne	%xcc,	0x3
	fabss	%f13,	%f1
	sra	%o4,	0x15,	%g2
	swap	[%l7 + 0x0C],	%g6
	bne,pt	%icc,	loop_2234
	tne	%icc,	0x2
	fxor	%f10,	%f26,	%f4
	addccc	%l4,	0x13F1,	%l6
loop_2234:
	ldsh	[%l7 + 0x7E],	%g1
	nop
	setx loop_2235, %l0, %l1
	jmpl %l1, %o1
	mulscc	%o3,	%i7,	%o2
	fands	%f16,	%f29,	%f26
	and	%l3,	0x1060,	%o0
loop_2235:
	tg	%xcc,	0x0
	addccc	%l1,	0x114E,	%o6
	brnz,a	%l0,	loop_2236
	lduh	[%l7 + 0x6A],	%o7
	nop
	fitos	%f7,	%f27
	fstox	%f27,	%f16
	fxtos	%f16,	%f15
	fone	%f18
loop_2236:
	tleu	%icc,	0x1
	tvc	%xcc,	0x5
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%i2
	fbul,a	%fcc0,	loop_2237
	udivx	%i5,	0x1E58,	%i1
	tgu	%xcc,	0x1
	fbo	%fcc3,	loop_2238
loop_2237:
	fandnot2	%f0,	%f28,	%f6
	taddcctv	%o5,	%i0,	%g7
	sra	%g3,	0x1A,	%l2
loop_2238:
	nop
	fitos	%f2,	%f11
	lduw	[%l7 + 0x78],	%l5
	movle	%xcc,	%g5,	%i4
	edge16n	%i3,	%i6,	%o4
	edge32	%g2,	%g6,	%g4
	add	%l4,	0x0DBE,	%l6
	tl	%xcc,	0x2
	fpsub32s	%f24,	%f20,	%f3
	edge8	%g1,	%o1,	%o3
	ldsw	[%l7 + 0x20],	%o2
	move	%icc,	%l3,	%i7
	fsrc1s	%f24,	%f4
	xnor	%l1,	0x023B,	%o0
	movge	%xcc,	%l0,	%o6
	movgu	%xcc,	%i2,	%o7
	movrne	%i1,	0x169,	%i5
	edge8ln	%i0,	%o5,	%g3
	tsubcctv	%g7,	%l2,	%g5
	tneg	%xcc,	0x6
	ldd	[%l7 + 0x60],	%f20
	tpos	%xcc,	0x6
	fornot1	%f2,	%f26,	%f24
	fnegs	%f10,	%f26
	movleu	%xcc,	%i4,	%l5
	orncc	%i6,	0x12EC,	%i3
	mova	%xcc,	%o4,	%g2
	mulx	%g6,	%l4,	%l6
	tsubcctv	%g4,	%g1,	%o3
	subccc	%o2,	0x0CC6,	%l3
	movcs	%icc,	%o1,	%i7
	movre	%o0,	%l0,	%o6
	mulscc	%l1,	%o7,	%i1
	fmovdle	%icc,	%f0,	%f12
	fabsd	%f24,	%f20
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i5
	addc	%i0,	%o5,	%g3
	edge8ln	%i2,	%g7,	%l2
	nop
	setx loop_2239, %l0, %l1
	jmpl %l1, %i4
	fcmpeq32	%f26,	%f24,	%l5
	fmovda	%icc,	%f0,	%f6
	brgz	%i6,	loop_2240
loop_2239:
	bl,a	%icc,	loop_2241
	ldd	[%l7 + 0x08],	%g4
	ldsb	[%l7 + 0x18],	%o4
loop_2240:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2241:
	bneg	%icc,	loop_2242
	fpackfix	%f0,	%f0
	movre	%i3,	%g6,	%l4
	movrgz	%l6,	0x362,	%g4
loop_2242:
	tsubcc	%g2,	%o3,	%g1
	lduw	[%l7 + 0x18],	%o2
	fmovd	%f12,	%f22
	movpos	%xcc,	%o1,	%l3
	sethi	0x09D2,	%o0
	sdiv	%l0,	0x1CD2,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l1,	%o7,	%i1
	sll	%o6,	%i0,	%o5
	mulscc	%i5,	0x14C0,	%i2
	smulcc	%g3,	%g7,	%i4
	movpos	%xcc,	%l5,	%l2
	tne	%xcc,	0x0
	fnand	%f26,	%f28,	%f6
	bg,a	%xcc,	loop_2243
	membar	0x71
	orn	%i6,	0x0A52,	%g5
	fxors	%f14,	%f29,	%f16
loop_2243:
	brgz,a	%o4,	loop_2244
	ta	%xcc,	0x6
	membar	0x3D
	set	0x66, %i5
	lduha	[%l7 + %i5] 0x18,	%i3
loop_2244:
	edge8l	%l4,	%l6,	%g4
	ldd	[%l7 + 0x48],	%g2
	movn	%icc,	%o3,	%g1
	xnor	%g6,	%o1,	%l3
	orncc	%o2,	0x10ED,	%o0
	sllx	%i7,	0x15,	%l1
	sdiv	%o7,	0x1206,	%l0
	nop
	set	0x48, %o1
	ldstub	[%l7 + %o1],	%o6
	tg	%icc,	0x0
	nop
	setx	loop_2245,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%icc,	0x5
	taddcc	%i0,	0x0797,	%i1
	movneg	%icc,	%i5,	%o5
loop_2245:
	tgu	%xcc,	0x6
	xnorcc	%i2,	%g3,	%i4
	umulcc	%g7,	0x175A,	%l5
	movrgez	%i6,	0x392,	%l2
	tgu	%xcc,	0x5
	movl	%icc,	%g5,	%o4
	fmovrse	%l4,	%f8,	%f15
	sub	%i3,	0x1944,	%g4
	fbule,a	%fcc0,	loop_2246
	brz	%l6,	loop_2247
	brlez,a	%o3,	loop_2248
	taddcctv	%g1,	0x0003,	%g2
loop_2246:
	sra	%g6,	0x01,	%o1
loop_2247:
	nop
	setx	0x40528969,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
loop_2248:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%l3,	[%l7 + 0x24] %asi
	or	%o0,	0x1AF6,	%i7
	bg,a	%xcc,	loop_2249
	fbue	%fcc3,	loop_2250
	movrgez	%l1,	0x3C1,	%o2
	xnor	%l0,	0x0F48,	%o6
loop_2249:
	orn	%i0,	0x0DA2,	%i1
loop_2250:
	fmovscc	%xcc,	%f16,	%f4
	fmovsgu	%xcc,	%f8,	%f23
	edge16ln	%o7,	%o5,	%i2
	addc	%i5,	0x0E46,	%i4
	fpack32	%f4,	%f24,	%f24
	fcmpne32	%f16,	%f0,	%g7
	set	0x0E, %l0
	stha	%l5,	[%l7 + %l0] 0xe3
	membar	#Sync
	ba,a,pt	%icc,	loop_2251
	fpadd32s	%f24,	%f25,	%f16
	tcs	%icc,	0x6
	swap	[%l7 + 0x48],	%g3
loop_2251:
	sub	%i6,	%l2,	%o4
	movpos	%xcc,	%g5,	%i3
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x70] %asi,	%l4
	tneg	%xcc,	0x7
	ldsw	[%l7 + 0x4C],	%g4
	edge32ln	%l6,	%o3,	%g1
	addccc	%g2,	%o1,	%l3
	edge32l	%o0,	%i7,	%l1
	or	%o2,	0x071A,	%g6
	nop
	fitod	%f26,	%f0
	ldd	[%l7 + 0x68],	%f8
	fbg,a	%fcc3,	loop_2252
	tge	%icc,	0x1
	orncc	%l0,	%o6,	%i1
	andcc	%i0,	0x021A,	%o5
loop_2252:
	edge32ln	%o7,	%i5,	%i4
	sethi	0x043D,	%g7
	xnorcc	%l5,	0x1785,	%i2
	movne	%xcc,	%i6,	%g3
	edge8l	%o4,	%g5,	%l2
	fbug,a	%fcc3,	loop_2253
	fmovdcs	%icc,	%f1,	%f4
	for	%f2,	%f18,	%f18
	fabsd	%f28,	%f14
loop_2253:
	mulscc	%l4,	%g4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x2f,	%i2
	tle	%icc,	0x6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] %asi,	%g1,	%o3
	move	%xcc,	%g2,	%l3
	tle	%xcc,	0x1
	addcc	%o1,	0x1C39,	%i7
	movleu	%icc,	%o0,	%o2
	orn	%l1,	0x162E,	%l0
	tge	%xcc,	0x6
	sdiv	%o6,	0x185C,	%i1
	set	0x75, %i6
	stba	%g6,	[%l7 + %i6] 0x19
	andcc	%o5,	0x104C,	%i0
	fpsub32s	%f4,	%f1,	%f27
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x30] %asi,	%o6
	fmovsvs	%xcc,	%f20,	%f22
	tgu	%xcc,	0x5
	set	0x2E, %g7
	ldsba	[%l7 + %g7] 0x89,	%i5
	tcs	%icc,	0x5
	nop
	fitod	%f10,	%f30
	fdtos	%f30,	%f29
	movrlz	%g7,	%i4,	%i2
	andcc	%l5,	%g3,	%o4
	nop
	fitod	%f7,	%f12
	orcc	%g5,	0x0578,	%l2
	edge8ln	%l4,	%g4,	%l6
	bvc,pn	%icc,	loop_2254
	fble,a	%fcc3,	loop_2255
	array8	%i3,	%i6,	%g1
	movle	%icc,	%g2,	%o3
loop_2254:
	taddcc	%o1,	%i7,	%o0
loop_2255:
	st	%f15,	[%l7 + 0x58]
	mulx	%o2,	%l1,	%l0
	orn	%o6,	%l3,	%g6
	fzero	%f30
	fpsub16s	%f11,	%f10,	%f10
	fzeros	%f25
	fsrc2	%f4,	%f0
	fcmpgt32	%f0,	%f24,	%o5
	andncc	%i0,	%i1,	%i5
	srlx	%o7,	%i4,	%i2
	movrgz	%g7,	0x07D,	%g3
	fbl	%fcc3,	loop_2256
	movne	%icc,	%l5,	%g5
	nop
	setx	0x40A8E1BA77B2A7E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x39062B86A37DDACB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f14,	%f14
	srlx	%o4,	%l2,	%l4
loop_2256:
	fmovsle	%icc,	%f21,	%f28
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x38] %asi,	%l6
	tpos	%icc,	0x3
	move	%icc,	%i3,	%g4
	st	%f25,	[%l7 + 0x4C]
	fmovdn	%icc,	%f22,	%f12
	fsrc1s	%f13,	%f10
	movpos	%xcc,	%i6,	%g2
	ba,a,pt	%xcc,	loop_2257
	movrlez	%o3,	%g1,	%i7
	fmovde	%icc,	%f24,	%f12
	movcs	%icc,	%o1,	%o2
loop_2257:
	popc	%o0,	%l0
	edge16n	%l1,	%o6,	%l3
	tg	%icc,	0x7
	tvc	%icc,	0x1
	taddcctv	%g6,	0x1B23,	%o5
	edge16n	%i1,	%i0,	%i5
	fmovsne	%xcc,	%f12,	%f29
	movpos	%icc,	%o7,	%i4
	tgu	%icc,	0x4
	smul	%i2,	%g3,	%g7
	fnegd	%f10,	%f0
	andncc	%g5,	%o4,	%l2
	addc	%l5,	0x1092,	%l4
	sll	%i3,	0x19,	%g4
	nop
	setx	0x091C0B88,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x07D23F54,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f14,	%f17
	edge32l	%l6,	%g2,	%o3
	tg	%xcc,	0x5
	edge32l	%g1,	%i6,	%o1
	tgu	%xcc,	0x1
	std	%f28,	[%l7 + 0x30]
	fmovse	%icc,	%f29,	%f3
	srlx	%o2,	0x02,	%o0
	sethi	0x1F97,	%l0
	edge32l	%l1,	%i7,	%l3
	mova	%xcc,	%g6,	%o6
	bcs,a,pn	%xcc,	loop_2258
	bneg,pt	%xcc,	loop_2259
	tpos	%xcc,	0x6
	membar	0x44
loop_2258:
	ldd	[%l7 + 0x28],	%f16
loop_2259:
	tleu	%xcc,	0x7
	popc	0x1B60,	%o5
	fbl,a	%fcc0,	loop_2260
	array16	%i1,	%i0,	%i5
	tgu	%icc,	0x0
	edge16ln	%i4,	%i2,	%o7
loop_2260:
	edge8l	%g7,	%g3,	%g5
	mulscc	%o4,	0x0A7C,	%l5
	andncc	%l4,	%i3,	%l2
	ldx	[%l7 + 0x40],	%g4
	nop
	setx	0x3077F02F,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	edge8ln	%l6,	%o3,	%g2
	move	%xcc,	%i6,	%g1
	movle	%icc,	%o2,	%o0
	fands	%f5,	%f11,	%f26
	xor	%l0,	0x07B7,	%o1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%l3
	sllx	%l1,	0x15,	%g6
	ldsw	[%l7 + 0x10],	%o6
	brgez,a	%o5,	loop_2261
	andn	%i0,	%i1,	%i4
	fmovdg	%icc,	%f5,	%f8
	movrgez	%i2,	0x051,	%o7
loop_2261:
	ta	%xcc,	0x6
	fbul,a	%fcc1,	loop_2262
	fones	%f20
	tcc	%icc,	0x6
	sdivx	%i5,	0x03D3,	%g3
loop_2262:
	fxnors	%f18,	%f15,	%f28
	orn	%g7,	%g5,	%l5
	edge16	%l4,	%i3,	%l2
	xnorcc	%o4,	0x1230,	%l6
	tvs	%xcc,	0x1
	andncc	%g4,	%o3,	%i6
	edge8	%g2,	%o2,	%o0
	ld	[%l7 + 0x18],	%f26
	movcc	%xcc,	%l0,	%g1
	movle	%xcc,	%i7,	%o1
	fbe	%fcc3,	loop_2263
	tsubcctv	%l1,	%l3,	%o6
	movcc	%xcc,	%g6,	%o5
	tleu	%icc,	0x6
loop_2263:
	fnor	%f6,	%f16,	%f22
	wr	%g0,	0x19,	%asi
	sta	%f0,	[%l7 + 0x6C] %asi
	mulx	%i0,	%i1,	%i4
	tleu	%xcc,	0x1
	fbule	%fcc0,	loop_2264
	fbul	%fcc3,	loop_2265
	edge8	%i2,	%o7,	%g3
	tsubcc	%i5,	%g5,	%l5
loop_2264:
	movre	%g7,	0x0FE,	%i3
loop_2265:
	fmovrdne	%l4,	%f28,	%f2
	fbo,a	%fcc0,	loop_2266
	smul	%o4,	0x1A39,	%l6
	nop
	setx	0x0FD0E1A877DFBB33,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f16
	taddcctv	%l2,	%g4,	%o3
loop_2266:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%g2
	movvc	%xcc,	%i6,	%o0
	tvs	%icc,	0x7
	fmovsne	%xcc,	%f13,	%f17
	alignaddr	%l0,	%g1,	%i7
	sra	%o2,	0x17,	%l1
	fbne	%fcc2,	loop_2267
	tgu	%icc,	0x6
	bcs,a	loop_2268
	tvs	%icc,	0x1
loop_2267:
	movpos	%xcc,	%o1,	%l3
	tpos	%icc,	0x4
loop_2268:
	srax	%o6,	0x15,	%o5
	te	%icc,	0x0
	smul	%g6,	%i1,	%i4
	srl	%i2,	%o7,	%i0
	subc	%g3,	0x1BAA,	%g5
	andncc	%l5,	%i5,	%i3
	tl	%icc,	0x1
	set	0x26, %g3
	lduba	[%l7 + %g3] 0x14,	%g7
	srax	%l4,	0x05,	%l6
	xorcc	%l2,	%g4,	%o3
	alignaddr	%g2,	%o4,	%i6
	tle	%xcc,	0x5
	tl	%icc,	0x0
	bn,pt	%icc,	loop_2269
	fsrc2s	%f1,	%f1
	edge32l	%l0,	%o0,	%g1
	movcs	%icc,	%i7,	%o2
loop_2269:
	lduw	[%l7 + 0x44],	%l1
	fmovsl	%xcc,	%f19,	%f27
	edge32l	%l3,	%o6,	%o5
	fsrc1s	%f12,	%f28
	taddcc	%o1,	0x1E65,	%i1
	movne	%icc,	%g6,	%i4
	ldsb	[%l7 + 0x67],	%o7
	bg	loop_2270
	swap	[%l7 + 0x0C],	%i0
	add	%g3,	%g5,	%l5
	flush	%l7 + 0x10
loop_2270:
	brgez,a	%i2,	loop_2271
	tsubcc	%i3,	%g7,	%l4
	tvs	%icc,	0x6
	xor	%l6,	0x0777,	%i5
loop_2271:
	pdist	%f12,	%f30,	%f8
	fmovrsgez	%l2,	%f10,	%f11
	ba,a,pn	%icc,	loop_2272
	fpsub16	%f4,	%f2,	%f8
	bn,pn	%xcc,	loop_2273
	fandnot1s	%f16,	%f24,	%f21
loop_2272:
	nop
	set	0x3C, %i3
	lduha	[%l7 + %i3] 0x89,	%g4
loop_2273:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	tsubcctv	%g2,	0x02BB,	%o4
	tne	%xcc,	0x1
	fbuge,a	%fcc2,	loop_2274
	ld	[%l7 + 0x58],	%f11
	mulx	%l0,	0x087D,	%i6
	movrne	%o0,	0x2D1,	%i7
loop_2274:
	movg	%xcc,	%g1,	%l1
	fmovdcs	%xcc,	%f26,	%f6
	edge32n	%o2,	%o6,	%o5
	fand	%f8,	%f24,	%f22
	orncc	%l3,	0x1B54,	%i1
	array8	%g6,	%i4,	%o1
	sdivcc	%i0,	0x1D52,	%g3
	edge16	%g5,	%o7,	%i2
	tvc	%xcc,	0x5
	fble	%fcc2,	loop_2275
	array8	%i3,	%l5,	%l4
	fbge	%fcc2,	loop_2276
	ta	%xcc,	0x3
loop_2275:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g7,	%i5,	%l6
loop_2276:
	movgu	%icc,	%l2,	%g4
	array16	%g2,	%o3,	%o4
	fcmpgt16	%f8,	%f26,	%i6
	bne,a	%xcc,	loop_2277
	nop
	setx	0x4F2CDC24,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xEED67F65,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f18,	%f30
	fxnor	%f30,	%f0,	%f12
	movn	%icc,	%l0,	%o0
loop_2277:
	smulcc	%g1,	%i7,	%o2
	sdivx	%l1,	0x030B,	%o6
	edge8l	%l3,	%o5,	%i1
	fbg	%fcc3,	loop_2278
	andncc	%i4,	%o1,	%i0
	movneg	%icc,	%g3,	%g6
	tge	%xcc,	0x7
loop_2278:
	alignaddrl	%o7,	%g5,	%i2
	mulscc	%i3,	%l4,	%l5
	stx	%g7,	[%l7 + 0x28]
	movleu	%xcc,	%i5,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g4,	%g2,	%o3
	movvs	%xcc,	%l6,	%o4
	fmul8sux16	%f28,	%f20,	%f28
	sra	%l0,	%o0,	%i6
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bneg	loop_2279
	brlz	%g1,	loop_2280
	movge	%icc,	%i7,	%l1
	xorcc	%o6,	0x123A,	%o2
loop_2279:
	fmovrse	%l3,	%f10,	%f22
loop_2280:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%o5
	fmovsa	%icc,	%f20,	%f0
	ldsw	[%l7 + 0x74],	%i4
	sir	0x1BD1
	alignaddr	%o1,	%i0,	%g3
	fmovsa	%xcc,	%f1,	%f0
	mova	%icc,	%g6,	%i1
	addc	%o7,	%i2,	%i3
	udiv	%g5,	0x07A4,	%l4
	popc	%g7,	%i5
	mova	%xcc,	%l2,	%g4
	fmuld8ulx16	%f4,	%f5,	%f0
	sdivcc	%g2,	0x19A9,	%l5
	udiv	%l6,	0x13D5,	%o3
	edge8ln	%o4,	%l0,	%i6
	subccc	%g1,	0x1DEB,	%i7
	brlz,a	%o0,	loop_2281
	stb	%l1,	[%l7 + 0x4B]
	popc	%o2,	%l3
	tgu	%icc,	0x3
loop_2281:
	fmovsle	%xcc,	%f11,	%f29
	tg	%icc,	0x0
	fpack16	%f14,	%f12
	andncc	%o6,	%o5,	%o1
	tge	%icc,	0x0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i0
	sra	%i4,	0x04,	%g3
	fmovdvs	%icc,	%f22,	%f18
	array32	%i1,	%o7,	%g6
	movcs	%xcc,	%i3,	%i2
	edge32ln	%g5,	%g7,	%l4
	edge16ln	%i5,	%l2,	%g4
	udiv	%l5,	0x0358,	%l6
	udivcc	%g2,	0x0DA0,	%o4
	edge8ln	%l0,	%o3,	%g1
	sethi	0x0F4C,	%i7
	movcc	%xcc,	%o0,	%l1
	udiv	%o2,	0x0941,	%l3
	edge16ln	%i6,	%o5,	%o1
	bcs,a,pn	%icc,	loop_2282
	popc	0x1AD6,	%o6
	xnor	%i0,	%g3,	%i1
	movcs	%xcc,	%o7,	%i4
loop_2282:
	nop
	setx	0x20767003,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	umul	%g6,	0x05F9,	%i3
	udivx	%i2,	0x1A64,	%g5
	fbuge	%fcc0,	loop_2283
	movge	%icc,	%l4,	%i5
	set	0x78, %g6
	ldxa	[%l7 + %g6] 0x11,	%l2
loop_2283:
	fmovdneg	%icc,	%f1,	%f27
	popc	%g7,	%g4
	udivcc	%l5,	0x1F0F,	%g2
	edge8	%o4,	%l6,	%o3
	fand	%f14,	%f18,	%f0
	move	%icc,	%l0,	%i7
	movgu	%xcc,	%o0,	%l1
	fmovscs	%xcc,	%f20,	%f26
	fpsub32	%f28,	%f20,	%f14
	tvc	%xcc,	0x2
	edge32	%o2,	%g1,	%l3
	udiv	%i6,	0x15FD,	%o1
	subccc	%o5,	%i0,	%g3
	movl	%icc,	%i1,	%o6
	tvc	%icc,	0x0
	tle	%icc,	0x5
	array16	%o7,	%i4,	%i3
	orn	%g6,	0x0AFD,	%i2
	membar	0x1C
	xnor	%g5,	%i5,	%l4
	fba,a	%fcc3,	loop_2284
	orn	%l2,	0x1738,	%g7
	ldd	[%l7 + 0x30],	%g4
	tleu	%icc,	0x2
loop_2284:
	addccc	%g2,	0x136D,	%o4
	fzeros	%f14
	addcc	%l6,	0x0812,	%o3
	edge32ln	%l5,	%i7,	%l0
	movrgez	%o0,	0x047,	%o2
	fmul8x16	%f2,	%f6,	%f26
	subcc	%l1,	0x02AC,	%g1
	edge8ln	%l3,	%o1,	%i6
	nop
	fitos	%f4,	%f12
	fstod	%f12,	%f14
	tcc	%xcc,	0x2
	sll	%o5,	0x0A,	%i0
	fbg,a	%fcc0,	loop_2285
	edge16l	%i1,	%o6,	%o7
	tleu	%xcc,	0x6
	movge	%xcc,	%g3,	%i4
loop_2285:
	addc	%g6,	%i3,	%g5
	movne	%xcc,	%i2,	%l4
	call	loop_2286
	orncc	%l2,	%g7,	%g4
	umul	%g2,	%i5,	%o4
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%l5
loop_2286:
	andncc	%l6,	%l0,	%o0
	movrgez	%i7,	0x20D,	%o2
	orncc	%g1,	%l3,	%o1
	mova	%icc,	%l1,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i6,	%i1,	%i0
	movleu	%icc,	%o6,	%o7
	array32	%i4,	%g6,	%g3
	ba,a	%xcc,	loop_2287
	movvc	%icc,	%i3,	%g5
	movrne	%i2,	0x28D,	%l4
	tn	%xcc,	0x0
loop_2287:
	nop
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x18,	 0x3
	edge32l	%g4,	%g2,	%i5
	udivcc	%o4,	0x16E4,	%o3
	tvc	%xcc,	0x3
	ldsb	[%l7 + 0x0D],	%l5
	addccc	%l2,	0x01B5,	%l6
	fmovdvs	%icc,	%f5,	%f24
	edge32l	%l0,	%o0,	%o2
	fsrc1s	%f31,	%f4
	nop
	setx	0xE061A4D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	tcc	%icc,	0x2
	edge16	%i7,	%l3,	%o1
	tg	%icc,	0x6
	fcmpne16	%f14,	%f2,	%l1
	fbo	%fcc0,	loop_2288
	orcc	%o5,	0x0983,	%i6
	tl	%xcc,	0x4
	ldx	[%l7 + 0x30],	%i1
loop_2288:
	alignaddr	%g1,	%i0,	%o7
	fpadd16	%f26,	%f16,	%f24
	nop
	setx loop_2289, %l0, %l1
	jmpl %l1, %o6
	tvc	%xcc,	0x4
	tleu	%icc,	0x5
	udiv	%i4,	0x0F0B,	%g6
loop_2289:
	bne,a	loop_2290
	fmul8sux16	%f24,	%f26,	%f12
	fmovdvs	%icc,	%f8,	%f6
	fsrc1	%f6,	%f20
loop_2290:
	sir	0x1700
	fexpand	%f14,	%f6
	movge	%icc,	%g3,	%i3
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f20
	fxtod	%f20,	%f22
	udiv	%i2,	0x0C49,	%l4
	movpos	%xcc,	%g7,	%g5
	fmovda	%icc,	%f13,	%f0
	stbar
	tsubcctv	%g4,	%g2,	%o4
	fpsub32	%f22,	%f10,	%f8
	tvs	%icc,	0x2
	set	0x34, %g5
	sta	%f2,	[%l7 + %g5] 0x0c
	sethi	0x07ED,	%i5
	set	0x28, %o6
	stba	%o3,	[%l7 + %o6] 0x11
	tcs	%xcc,	0x0
	ldd	[%l7 + 0x10],	%f22
	stbar
	tvs	%icc,	0x1
	ldub	[%l7 + 0x7D],	%l2
	edge32n	%l5,	%l6,	%l0
	fmovdcc	%xcc,	%f9,	%f11
	movn	%icc,	%o0,	%i7
	edge32	%l3,	%o2,	%l1
	tsubcctv	%o1,	0x0721,	%o5
	call	loop_2291
	ldd	[%l7 + 0x50],	%f24
	tl	%icc,	0x4
	fmovdle	%xcc,	%f4,	%f26
loop_2291:
	xorcc	%i6,	%g1,	%i1
	nop
	setx loop_2292, %l0, %l1
	jmpl %l1, %o7
	umul	%i0,	0x0504,	%i4
	mova	%xcc,	%o6,	%g6
	movne	%icc,	%i3,	%g3
loop_2292:
	ba,a	%xcc,	loop_2293
	movne	%icc,	%l4,	%i2
	nop
	setx	0xE0C9010B805F2500,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	addc	%g5,	0x011C,	%g7
loop_2293:
	ble,pt	%icc,	loop_2294
	prefetch	[%l7 + 0x10],	 0x1
	subccc	%g2,	0x0519,	%o4
	udivx	%g4,	0x0063,	%o3
loop_2294:
	movl	%icc,	%i5,	%l2
	array16	%l5,	%l0,	%l6
	smulcc	%i7,	0x1FE4,	%l3
	bpos,pn	%icc,	loop_2295
	tcc	%xcc,	0x6
	edge8	%o2,	%l1,	%o1
	bgu	loop_2296
loop_2295:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o5,	%o0,	%g1
	movne	%xcc,	%i1,	%o7
loop_2296:
	movpos	%icc,	%i6,	%i4
	movneg	%icc,	%i0,	%o6
	edge32l	%i3,	%g3,	%l4
	tcc	%xcc,	0x0
	tsubcc	%g6,	%g5,	%g7
	movle	%icc,	%i2,	%o4
	fmovsge	%xcc,	%f0,	%f29
	fmovdgu	%icc,	%f19,	%f19
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%g2
	subcc	%g4,	0x1AF2,	%o3
	movre	%l2,	0x2A3,	%i5
	fcmple32	%f2,	%f26,	%l0
	fxnor	%f28,	%f6,	%f2
	movvs	%xcc,	%l5,	%l6
	edge16ln	%i7,	%o2,	%l3
	tsubcctv	%l1,	%o1,	%o0
	ldd	[%l7 + 0x38],	%o4
	fxors	%f10,	%f24,	%f13
	stbar
	movl	%icc,	%i1,	%g1
	fmovse	%xcc,	%f1,	%f10
	movle	%xcc,	%o7,	%i4
	set	0x20, %o0
	lduwa	[%l7 + %o0] 0x89,	%i0
	fbu,a	%fcc0,	loop_2297
	alignaddrl	%o6,	%i6,	%g3
	sll	%i3,	0x0E,	%g6
	movrgz	%g5,	0x0BE,	%g7
loop_2297:
	fnot2	%f2,	%f12
	srl	%i2,	%l4,	%o4
	xnorcc	%g2,	%g4,	%l2
	tge	%icc,	0x2
	tvc	%xcc,	0x4
	fbue	%fcc3,	loop_2298
	fbe,a	%fcc1,	loop_2299
	edge8	%o3,	%l0,	%i5
	edge32l	%l5,	%l6,	%o2
loop_2298:
	tneg	%icc,	0x6
loop_2299:
	tle	%xcc,	0x5
	te	%xcc,	0x6
	add	%l3,	%i7,	%o1
	movn	%icc,	%o0,	%l1
	movg	%icc,	%o5,	%i1
	sth	%g1,	[%l7 + 0x56]
	fbo	%fcc1,	loop_2300
	tcc	%xcc,	0x2
	movre	%i4,	%o7,	%o6
	fpack32	%f26,	%f22,	%f24
loop_2300:
	sdivx	%i6,	0x13AC,	%g3
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x17
	membar	#Sync
	andn	%i3,	0x1CB4,	%i0
	fmovrslez	%g6,	%f22,	%f31
	umulcc	%g7,	0x198B,	%g5
	nop
	fitos	%f13,	%f21
	fstoi	%f21,	%f14
	orcc	%i2,	0x1BCC,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g2,	%g4,	%o4
	nop
	set	0x24, %o7
	ldsb	[%l7 + %o7],	%o3
	brlz,a	%l2,	loop_2301
	fmovsle	%icc,	%f16,	%f17
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x50] %asi,	%f16
loop_2301:
	edge8l	%l0,	%i5,	%l5
	tcc	%xcc,	0x7
	bvs,pn	%xcc,	loop_2302
	udivx	%l6,	0x1DB5,	%l3
	srlx	%o2,	0x16,	%i7
	srax	%o0,	%l1,	%o5
loop_2302:
	edge16n	%o1,	%g1,	%i4
	fbe	%fcc3,	loop_2303
	fbe	%fcc2,	loop_2304
	fcmpgt16	%f26,	%f16,	%o7
	ldstub	[%l7 + 0x53],	%o6
loop_2303:
	movn	%icc,	%i1,	%g3
loop_2304:
	swap	[%l7 + 0x70],	%i6
	bne,a,pn	%xcc,	loop_2305
	fmovrslz	%i0,	%f11,	%f16
	set	0x60, %l2
	ldsba	[%l7 + %l2] 0x89,	%i3
loop_2305:
	fbl	%fcc3,	loop_2306
	fmovrsgz	%g6,	%f13,	%f24
	fsrc2	%f14,	%f28
	ldub	[%l7 + 0x62],	%g7
loop_2306:
	ba,a	%icc,	loop_2307
	edge32n	%i2,	%l4,	%g5
	fbue	%fcc1,	loop_2308
	sir	0x0BAC
loop_2307:
	addc	%g4,	%o4,	%o3
	fandnot1	%f16,	%f0,	%f24
loop_2308:
	bn,a	loop_2309
	fsrc2	%f14,	%f30
	mova	%icc,	%g2,	%l2
	umulcc	%l0,	0x0360,	%i5
loop_2309:
	smulcc	%l5,	0x04F8,	%l3
	bcs,a	%xcc,	loop_2310
	fmovse	%icc,	%f11,	%f12
	move	%icc,	%o2,	%l6
	movleu	%xcc,	%i7,	%o0
loop_2310:
	fmovsvs	%icc,	%f14,	%f19
	sll	%l1,	0x1E,	%o5
	ta	%icc,	0x6
	taddcc	%g1,	%i4,	%o7
	pdist	%f2,	%f10,	%f4
	tvc	%xcc,	0x5
	tvc	%icc,	0x3
	tg	%icc,	0x5
	bcs	loop_2311
	fabsd	%f8,	%f20
	orcc	%o6,	%i1,	%o1
	faligndata	%f18,	%f22,	%f2
loop_2311:
	addc	%i6,	0x0403,	%i0
	tpos	%xcc,	0x1
	bl,pn	%xcc,	loop_2312
	fbe	%fcc2,	loop_2313
	fbge,a	%fcc2,	loop_2314
	subccc	%g3,	%i3,	%g6
loop_2312:
	nop
	setx	0xCBA03027A0770026,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_2313:
	ba,pn	%icc,	loop_2315
loop_2314:
	alignaddrl	%g7,	%l4,	%i2
	bleu,a,pn	%xcc,	loop_2316
	fnot2s	%f10,	%f20
loop_2315:
	add	%g4,	%g5,	%o3
	edge32	%g2,	%o4,	%l2
loop_2316:
	andn	%l0,	%l5,	%l3
	sir	0x0407
	fsrc2	%f4,	%f24
	addcc	%o2,	0x1186,	%i5
	sethi	0x122C,	%l6
	fmovdl	%icc,	%f12,	%f4
	call	loop_2317
	sdiv	%o0,	0x0F3A,	%i7
	swap	[%l7 + 0x38],	%l1
	fxnors	%f19,	%f15,	%f23
loop_2317:
	edge32n	%g1,	%i4,	%o5
	fbge	%fcc2,	loop_2318
	ldd	[%l7 + 0x50],	%o6
	fmovrslz	%o6,	%f22,	%f26
	fpsub16s	%f30,	%f1,	%f31
loop_2318:
	movpos	%icc,	%o1,	%i6
	sdivcc	%i0,	0x1046,	%g3
	movrgz	%i3,	%i1,	%g6
	ld	[%l7 + 0x14],	%f28
	brz	%l4,	loop_2319
	nop
	setx	0x806878A2,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	xorcc	%i2,	0x1A20,	%g7
	fmuld8ulx16	%f5,	%f7,	%f4
loop_2319:
	bgu	loop_2320
	subc	%g5,	%o3,	%g4
	array8	%g2,	%l2,	%l0
	edge32l	%o4,	%l5,	%o2
loop_2320:
	taddcc	%l3,	0x02A8,	%i5
	fble	%fcc3,	loop_2321
	tn	%icc,	0x6
	fbuge,a	%fcc1,	loop_2322
	edge16	%l6,	%o0,	%l1
loop_2321:
	move	%icc,	%i7,	%i4
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2322:
	tn	%xcc,	0x7
	movl	%xcc,	%g1,	%o7
	fnot1	%f16,	%f28
	bcc	loop_2323
	edge32l	%o5,	%o1,	%i6
	set	0x7E, %g2
	stha	%i0,	[%l7 + %g2] 0x18
loop_2323:
	stbar
	wr	%g0,	0x89,	%asi
	stba	%o6,	[%l7 + 0x15] %asi
	nop
	setx	loop_2324,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bl	%icc,	loop_2325
	movrgz	%g3,	0x168,	%i1
	ble	loop_2326
loop_2324:
	addccc	%i3,	0x1CA6,	%g6
loop_2325:
	tle	%icc,	0x2
	umulcc	%l4,	0x1777,	%i2
loop_2326:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	edge16l	%g5,	%o3,	%g2
	edge8ln	%l2,	%l0,	%g4
	fbuge	%fcc1,	loop_2327
	addccc	%l5,	%o2,	%l3
	fmovrdgez	%o4,	%f6,	%f6
	xorcc	%l6,	0x0907,	%o0
loop_2327:
	nop
	setx	0x0048747C,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	sdivcc	%l1,	0x1B67,	%i7
	fsrc2s	%f19,	%f7
	bg,a	%icc,	loop_2328
	sra	%i5,	0x15,	%i4
	sdiv	%g1,	0x1D73,	%o7
	fpadd32s	%f10,	%f18,	%f14
loop_2328:
	orcc	%o1,	%o5,	%i0
	movne	%icc,	%o6,	%g3
	array32	%i6,	%i3,	%i1
	membar	0x54
	ldsw	[%l7 + 0x08],	%g6
	movvc	%icc,	%i2,	%l4
	sdivcc	%g7,	0x091B,	%g5
	movleu	%icc,	%g2,	%o3
	edge32	%l0,	%g4,	%l2
	fmul8x16al	%f23,	%f6,	%f12
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	setx	loop_2329,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovs	%f5,	%f27
	fpadd32s	%f12,	%f9,	%f2
	fcmple16	%f10,	%f28,	%l5
loop_2329:
	fpadd16	%f6,	%f24,	%f6
	udiv	%l3,	0x06C7,	%o2
	std	%f18,	[%l7 + 0x38]
	fmovsg	%xcc,	%f22,	%f1
	array8	%l6,	%o4,	%l1
	lduw	[%l7 + 0x54],	%i7
	edge32	%o0,	%i4,	%g1
	fmuld8sux16	%f17,	%f0,	%f10
	bcs,pn	%icc,	loop_2330
	smulcc	%o7,	%o1,	%o5
	array8	%i5,	%o6,	%g3
	movrne	%i0,	0x367,	%i6
loop_2330:
	fnot1s	%f7,	%f10
	nop
	setx	loop_2331,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%i3,	0x06D4,	%g6
	fnot1	%f6,	%f24
	fmovdn	%xcc,	%f18,	%f12
loop_2331:
	nop
	wr	%g0,	0xe2,	%asi
	stha	%i2,	[%l7 + 0x40] %asi
	membar	#Sync
	fpsub16	%f12,	%f20,	%f2
	fba,a	%fcc3,	loop_2332
	sdivx	%i1,	0x1D9F,	%l4
	fmovrsgz	%g7,	%f28,	%f8
	ldstub	[%l7 + 0x22],	%g5
loop_2332:
	alignaddr	%g2,	%l0,	%g4
	addcc	%l2,	%o3,	%l3
	tcc	%xcc,	0x6
	bge,pt	%icc,	loop_2333
	ldsw	[%l7 + 0x6C],	%l5
	fmovdge	%icc,	%f19,	%f31
	fbg,a	%fcc0,	loop_2334
loop_2333:
	smul	%l6,	%o2,	%l1
	xor	%o4,	0x074B,	%i7
	movvc	%xcc,	%o0,	%i4
loop_2334:
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x42] %asi,	%g1
	stx	%o7,	[%l7 + 0x08]
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x0c,	%o4
	tl	%icc,	0x6
	mulscc	%i5,	%o1,	%g3
	mova	%icc,	%o6,	%i0
	tgu	%icc,	0x0
	array32	%i6,	%i3,	%i2
	fmul8x16al	%f18,	%f29,	%f10
	flush	%l7 + 0x64
	sra	%g6,	%i1,	%l4
	array8	%g5,	%g2,	%l0
	set	0x60, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0x3
	bg,pt	%icc,	loop_2335
	movre	%g4,	0x039,	%l2
	array32	%l3,	%l5,	%o3
	tsubcctv	%l6,	%l1,	%o4
loop_2335:
	fmovdvc	%icc,	%f28,	%f17
	sdivcc	%o2,	0x011B,	%o0
	fpackfix	%f4,	%f5
	sllx	%i7,	0x08,	%g1
	fpsub32s	%f9,	%f21,	%f21
	tvs	%xcc,	0x3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i4,	%o7
	flush	%l7 + 0x4C
	swap	[%l7 + 0x60],	%i5
	alignaddrl	%o1,	%o5,	%o6
	bcs,a,pt	%xcc,	loop_2336
	ta	%xcc,	0x3
	array8	%g3,	%i0,	%i3
	fzeros	%f27
loop_2336:
	tl	%icc,	0x2
	brlz	%i2,	loop_2337
	fbne,a	%fcc0,	loop_2338
	fbuge	%fcc2,	loop_2339
	array16	%g6,	%i6,	%l4
loop_2337:
	subccc	%i1,	%g5,	%g2
loop_2338:
	fnands	%f3,	%f3,	%f31
loop_2339:
	tcc	%icc,	0x5
	array16	%l0,	%g7,	%l2
	fornot2s	%f20,	%f27,	%f13
	fbule	%fcc0,	loop_2340
	tsubcctv	%g4,	%l3,	%l5
	pdist	%f20,	%f14,	%f10
	tg	%icc,	0x6
loop_2340:
	addc	%l6,	%l1,	%o3
	fzeros	%f20
	movn	%icc,	%o2,	%o4
	fmovsg	%icc,	%f6,	%f19
	fmovdneg	%icc,	%f12,	%f7
	for	%f14,	%f28,	%f26
	edge8l	%i7,	%g1,	%o0
	movn	%icc,	%o7,	%i4
	udiv	%o1,	0x0548,	%i5
	te	%xcc,	0x7
	fmovrslez	%o6,	%f17,	%f18
	brlz	%o5,	loop_2341
	ble	%xcc,	loop_2342
	subc	%i0,	%i3,	%i2
	bn,a,pn	%xcc,	loop_2343
loop_2341:
	fxors	%f6,	%f9,	%f16
loop_2342:
	tneg	%icc,	0x7
	subccc	%g6,	0x1506,	%g3
loop_2343:
	ldd	[%l7 + 0x70],	%f24
	brlez	%l4,	loop_2344
	sir	0x03D6
	fmovdvs	%xcc,	%f4,	%f5
	movle	%xcc,	%i6,	%g5
loop_2344:
	array16	%g2,	%i1,	%l0
	ta	%icc,	0x6
	movrlez	%g7,	0x2A5,	%g4
	movneg	%xcc,	%l2,	%l3
	bg	%xcc,	loop_2345
	and	%l5,	%l1,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x1C],	%l6
loop_2345:
	fmovrsgz	%o2,	%f12,	%f4
	fcmpne16	%f30,	%f2,	%i7
	bcs,pt	%icc,	loop_2346
	fmovdpos	%xcc,	%f29,	%f11
	bne	%icc,	loop_2347
	addc	%g1,	%o4,	%o0
loop_2346:
	umul	%i4,	0x05DF,	%o7
	movleu	%xcc,	%i5,	%o1
loop_2347:
	nop
	setx	0x2069E1A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	movcc	%xcc,	%o6,	%i0
	sdiv	%i3,	0x1E78,	%o5
	bcc	loop_2348
	subc	%g6,	%i2,	%l4
	srlx	%i6,	%g3,	%g5
	movvc	%xcc,	%i1,	%g2
loop_2348:
	edge8	%l0,	%g4,	%g7
	movgu	%icc,	%l2,	%l3
	nop
	setx	0x2044DF2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x1E] %asi,	%l1
	movleu	%icc,	%l5,	%l6
	fone	%f14
	bne,a,pt	%xcc,	loop_2349
	fbl,a	%fcc2,	loop_2350
	fmovrdlez	%o2,	%f6,	%f20
	movrlz	%i7,	%o3,	%o4
loop_2349:
	ldd	[%l7 + 0x50],	%g0
loop_2350:
	edge8ln	%o0,	%o7,	%i5
	fbuge,a	%fcc0,	loop_2351
	tsubcc	%o1,	0x1095,	%o6
	set	0x10, %i1
	ldxa	[%l7 + %i1] 0x81,	%i4
loop_2351:
	for	%f4,	%f16,	%f24
	sra	%i3,	0x1E,	%o5
	fble,a	%fcc0,	loop_2352
	movrlez	%i0,	%i2,	%l4
	bpos	loop_2353
	fmul8sux16	%f8,	%f0,	%f12
loop_2352:
	udivx	%g6,	0x01B0,	%g3
	fnot2	%f6,	%f30
loop_2353:
	fmovsne	%icc,	%f21,	%f18
	smul	%i6,	%g5,	%i1
	edge16n	%l0,	%g4,	%g2
	tcc	%icc,	0x2
	sth	%l2,	[%l7 + 0x22]
	edge16n	%l3,	%l1,	%g7
	fcmpgt16	%f0,	%f18,	%l5
	nop
	setx	0xCB667A081C09FC09,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x99A660ADE766D544,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f6,	%f12
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x04,	%i6
	tn	%xcc,	0x5
	array8	%o2,	%o3,	%o4
	nop
	fitod	%f0,	%f26
	fdtoi	%f26,	%f4
	set	0x0C, %g4
	ldstuba	[%l7 + %g4] 0x10,	%i7
	tsubcc	%g1,	%o7,	%o0
	andncc	%i5,	%o1,	%o6
	movg	%icc,	%i4,	%o5
	fors	%f26,	%f0,	%f14
	fmovsleu	%xcc,	%f7,	%f3
	movneg	%xcc,	%i0,	%i3
	wr	%g0,	0x81,	%asi
	stba	%l4,	[%l7 + 0x4F] %asi
	fmovrdlz	%i2,	%f0,	%f4
	fbug,a	%fcc1,	loop_2354
	fble	%fcc0,	loop_2355
	edge16	%g3,	%i6,	%g6
	xnorcc	%i1,	0x1D19,	%g5
loop_2354:
	be,a,pt	%icc,	loop_2356
loop_2355:
	edge8	%l0,	%g2,	%g4
	sdivx	%l3,	0x0F54,	%l2
	udivx	%g7,	0x0832,	%l1
loop_2356:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%l5,	%l6
	fnands	%f19,	%f16,	%f28
	ldsb	[%l7 + 0x63],	%o3
	ldsw	[%l7 + 0x58],	%o4
	edge8n	%i7,	%o2,	%o7
	brgez,a	%g1,	loop_2357
	fabss	%f31,	%f30
	sll	%i5,	%o1,	%o6
	fbn,a	%fcc2,	loop_2358
loop_2357:
	sth	%i4,	[%l7 + 0x2E]
	prefetch	[%l7 + 0x7C],	 0x3
	movge	%icc,	%o0,	%i0
loop_2358:
	orncc	%i3,	0x0089,	%o5
	fsrc1s	%f7,	%f6
	mova	%icc,	%i2,	%l4
	fmovdg	%icc,	%f25,	%f9
	edge8ln	%i6,	%g6,	%i1
	ldd	[%l7 + 0x78],	%f10
	fmovdpos	%icc,	%f18,	%f24
	movg	%icc,	%g5,	%l0
	array32	%g3,	%g2,	%g4
	nop
	fitod	%f4,	%f14
	fdtos	%f14,	%f12
	smul	%l3,	0x0852,	%l2
	movleu	%xcc,	%l1,	%g7
	subc	%l5,	0x0CFA,	%l6
	mulscc	%o3,	0x1B0E,	%o4
	ldstub	[%l7 + 0x6C],	%i7
	fmovrdgez	%o7,	%f6,	%f14
	edge8	%o2,	%i5,	%g1
	alignaddrl	%o1,	%o6,	%o0
	fblg,a	%fcc3,	loop_2359
	nop
	setx	0x8767011A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xB486A2A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f22,	%f14
	udiv	%i0,	0x0473,	%i3
	move	%xcc,	%o5,	%i4
loop_2359:
	nop
	setx	0x897C47BEAA81AD9F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x3A4E2F698847000C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f24,	%f30
	movne	%icc,	%l4,	%i6
	fbo	%fcc3,	loop_2360
	ldx	[%l7 + 0x60],	%g6
	ldd	[%l7 + 0x58],	%f16
	movneg	%xcc,	%i1,	%g5
loop_2360:
	sra	%l0,	%i2,	%g3
	fpsub32	%f30,	%f4,	%f4
	movcc	%xcc,	%g2,	%g4
	brlz,a	%l2,	loop_2361
	fbl,a	%fcc3,	loop_2362
	udivcc	%l1,	0x13DE,	%g7
	movrlez	%l3,	%l5,	%l6
loop_2361:
	sll	%o3,	0x03,	%o4
loop_2362:
	edge32n	%o7,	%i7,	%i5
	fbo,a	%fcc2,	loop_2363
	mulx	%o2,	0x1A16,	%g1
	set	0x5C, %l4
	stha	%o1,	[%l7 + %l4] 0x19
loop_2363:
	fba	%fcc0,	loop_2364
	orn	%o0,	%i0,	%i3
	fmovdg	%icc,	%f9,	%f20
	movvc	%icc,	%o6,	%o5
loop_2364:
	tn	%icc,	0x4
	fmovscs	%icc,	%f28,	%f6
	set	0x1D, %l6
	ldstuba	[%l7 + %l6] 0x88,	%i4
	umul	%l4,	0x191A,	%g6
	set	0x38, %i4
	ldxa	[%l7 + %i4] 0x18,	%i6
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x39] %asi,	%i1
	stx	%g5,	[%l7 + 0x20]
	stx	%i2,	[%l7 + 0x20]
	set	0x08, %l1
	ldswa	[%l7 + %l1] 0x81,	%g3
	brgz,a	%l0,	loop_2365
	ta	%icc,	0x6
	bgu	loop_2366
	fmovrsne	%g4,	%f19,	%f23
loop_2365:
	nop
	set	0x4A, %g1
	stba	%l2,	[%l7 + %g1] 0x81
loop_2366:
	tl	%icc,	0x3
	sdivx	%g2,	0x1CA8,	%l1
	mulx	%g7,	%l5,	%l3
	movre	%l6,	%o3,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i7,	%i5
	tneg	%icc,	0x6
	fbge,a	%fcc0,	loop_2367
	tsubcc	%o4,	%g1,	%o1
	fmovse	%xcc,	%f6,	%f15
	fpadd32	%f20,	%f8,	%f24
loop_2367:
	lduw	[%l7 + 0x10],	%o0
	addccc	%o2,	0x175C,	%i0
	fmul8sux16	%f4,	%f22,	%f16
	movle	%icc,	%o6,	%i3
	smul	%o5,	%i4,	%l4
	tsubcc	%g6,	%i6,	%i1
	edge8n	%i2,	%g3,	%l0
	set	0x4C, %o4
	swapa	[%l7 + %o4] 0x80,	%g4
	movrne	%g5,	0x00A,	%l2
	movrlz	%g2,	0x372,	%l1
	sll	%l5,	%g7,	%l6
	sll	%l3,	%o7,	%o3
	nop
	setx	0xCF8B57FF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f28
	tg	%xcc,	0x2
	tneg	%icc,	0x2
	edge16ln	%i5,	%i7,	%g1
	fba	%fcc0,	loop_2368
	sub	%o1,	0x0D6A,	%o0
	alignaddr	%o2,	%o4,	%o6
	bcs,a	%xcc,	loop_2369
loop_2368:
	orcc	%i0,	0x0873,	%o5
	tpos	%icc,	0x1
	fbule,a	%fcc2,	loop_2370
loop_2369:
	movne	%icc,	%i4,	%l4
	subccc	%g6,	0x0596,	%i3
	movn	%icc,	%i6,	%i2
loop_2370:
	mova	%xcc,	%i1,	%g3
	edge32n	%g4,	%g5,	%l2
	fmovrse	%g2,	%f8,	%f16
	and	%l0,	0x0B69,	%l1
	edge8l	%l5,	%l6,	%g7
	bl	loop_2371
	udiv	%l3,	0x06BD,	%o3
	and	%o7,	%i7,	%g1
	fxors	%f29,	%f17,	%f18
loop_2371:
	sdivx	%i5,	0x1B4F,	%o1
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x7A] %asi,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o4,	%o2,	%o6
	movle	%icc,	%i0,	%o5
	tl	%icc,	0x2
	fmovrse	%l4,	%f18,	%f2
	mulscc	%g6,	%i3,	%i6
	tvc	%xcc,	0x0
	nop
	setx	0x809BE314,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f20
	fbul	%fcc3,	loop_2372
	ldx	[%l7 + 0x58],	%i4
	fmovspos	%icc,	%f31,	%f10
	sdiv	%i2,	0x141E,	%i1
loop_2372:
	xor	%g3,	%g4,	%g5
	edge16	%l2,	%g2,	%l0
	fbu,a	%fcc1,	loop_2373
	alignaddr	%l5,	%l1,	%l6
	edge16n	%l3,	%g7,	%o7
	andcc	%o3,	0x0046,	%g1
loop_2373:
	fpsub16	%f2,	%f4,	%f0
	nop
	fitos	%f28,	%f1
	edge16n	%i7,	%i5,	%o1
	edge8ln	%o4,	%o2,	%o6
	tvc	%xcc,	0x1
	brz	%i0,	loop_2374
	fnot1s	%f25,	%f7
	orncc	%o5,	0x0ADF,	%o0
	tge	%icc,	0x1
loop_2374:
	movrgez	%g6,	0x336,	%i3
	fnot1	%f16,	%f0
	fbne,a	%fcc3,	loop_2375
	brgez,a	%l4,	loop_2376
	sra	%i6,	%i2,	%i1
	fcmpeq16	%f30,	%f12,	%i4
loop_2375:
	nop
	fitos	%f10,	%f5
	fstod	%f5,	%f6
loop_2376:
	fmovsneg	%icc,	%f13,	%f10
	movleu	%icc,	%g4,	%g3
	taddcctv	%l2,	0x0643,	%g5
	fmovsgu	%xcc,	%f8,	%f3
	movcs	%icc,	%g2,	%l0
	tcs	%xcc,	0x6
	fmovrdgez	%l5,	%f0,	%f30
	movl	%icc,	%l6,	%l3
	movrlez	%g7,	0x260,	%o7
	fabss	%f25,	%f7
	faligndata	%f6,	%f8,	%f26
	fmovsvs	%icc,	%f4,	%f7
	xorcc	%o3,	%g1,	%i7
	call	loop_2377
	xnor	%l1,	0x13A4,	%i5
	nop
	setx	0x70080789205FA034,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	andn	%o4,	0x094B,	%o1
loop_2377:
	orn	%o2,	%o6,	%o5
	bvs,pt	%icc,	loop_2378
	addccc	%i0,	%g6,	%i3
	movcc	%icc,	%l4,	%i6
	bleu	loop_2379
loop_2378:
	sll	%o0,	0x19,	%i1
	srlx	%i2,	0x1D,	%g4
	sub	%g3,	0x1F7F,	%l2
loop_2379:
	fmovsl	%icc,	%f10,	%f7
	edge8l	%g5,	%g2,	%i4
	array32	%l5,	%l6,	%l0
	tge	%xcc,	0x2
	add	%g7,	0x194A,	%o7
	movleu	%icc,	%l3,	%o3
	movleu	%xcc,	%i7,	%g1
	be,a,pt	%icc,	loop_2380
	orncc	%i5,	%l1,	%o4
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f16
loop_2380:
	alignaddr	%o1,	%o6,	%o5
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x23] %asi,	%i0
	srax	%g6,	0x0A,	%i3
	movpos	%icc,	%o2,	%i6
	nop
	setx	0x3CA7DE2A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x0DFB200A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f22,	%f7
	nop
	fitos	%f1,	%f11
	fstox	%f11,	%f22
	fxtos	%f22,	%f8
	xnor	%l4,	0x06B2,	%o0
	nop
	setx loop_2381, %l0, %l1
	jmpl %l1, %i1
	srlx	%i2,	%g3,	%l2
	movvc	%xcc,	%g5,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2381:
	fand	%f12,	%f18,	%f8
	alignaddrl	%i4,	%l5,	%g2
	andcc	%l0,	%l6,	%g7
	tge	%icc,	0x5
	smulcc	%o7,	0x14E0,	%o3
	smulcc	%i7,	%l3,	%g1
	tg	%xcc,	0x6
	fmovrslz	%l1,	%f23,	%f9
	tleu	%icc,	0x6
	fmovsa	%icc,	%f0,	%f3
	movrgz	%i5,	0x0EA,	%o1
	movcc	%icc,	%o4,	%o6
	umulcc	%o5,	%i0,	%i3
	flush	%l7 + 0x54
	movgu	%icc,	%g6,	%o2
	movge	%xcc,	%l4,	%i6
	xor	%i1,	0x12D8,	%i2
	fcmpgt16	%f6,	%f8,	%g3
	nop
	setx	0x26921C78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xBE3E9473,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f24,	%f31
	sub	%l2,	0x1654,	%g5
	nop
	fitos	%f1,	%f0
	fstoi	%f0,	%f10
	nop
	setx	0x3EEC5EA102875B3C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x137FADB9F19FE70E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f26,	%f14
	fpack16	%f16,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o0,	%i4,	%l5
	popc	0x032A,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn	%fcc0,	loop_2382
	fsrc1	%f20,	%f16
	tne	%icc,	0x1
	wr	%g0,	0x04,	%asi
	stxa	%l0,	[%l7 + 0x60] %asi
loop_2382:
	bge	loop_2383
	tle	%xcc,	0x5
	addcc	%g2,	%g7,	%o7
	ble,pn	%icc,	loop_2384
loop_2383:
	movre	%l6,	0x3E4,	%i7
	tsubcctv	%o3,	0x0E78,	%l3
	movleu	%icc,	%l1,	%g1
loop_2384:
	fbne	%fcc1,	loop_2385
	ld	[%l7 + 0x4C],	%f16
	fornot2s	%f13,	%f9,	%f1
	udivcc	%i5,	0x0648,	%o1
loop_2385:
	tcs	%xcc,	0x0
	sub	%o6,	0x1926,	%o5
	or	%i0,	%i3,	%g6
	addccc	%o2,	0x1E57,	%l4
	movvc	%xcc,	%i6,	%o4
	smul	%i1,	%i2,	%l2
	xnor	%g3,	0x1B83,	%g5
	edge8ln	%o0,	%l5,	%g4
	orn	%i4,	0x1E65,	%g2
	movge	%xcc,	%g7,	%o7
	srlx	%l6,	0x15,	%i7
	sth	%o3,	[%l7 + 0x6A]
	sra	%l3,	%l1,	%g1
	ta	%xcc,	0x4
	edge16l	%i5,	%l0,	%o1
	set	0x78, %o5
	ldxa	[%l7 + %o5] 0x14,	%o6
	tl	%xcc,	0x7
	fandnot2s	%f24,	%f11,	%f6
	tcs	%xcc,	0x6
	flush	%l7 + 0x64
	bpos,a	%xcc,	loop_2386
	subc	%i0,	%i3,	%o5
	subc	%g6,	0x0F21,	%l4
	edge32ln	%i6,	%o4,	%i1
loop_2386:
	taddcc	%o2,	0x0402,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x7
	orcc	%g3,	0x0F9E,	%l2
	sll	%g5,	0x16,	%l5
	udiv	%o0,	0x088D,	%i4
	or	%g4,	%g7,	%o7
	add	%l7,	0x24,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%g2,	%i7
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x89,	 0x3
	sethi	0x046F,	%l3
	taddcc	%l6,	%g1,	%l1
	nop
	setx	0x5DD5564D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f21
	ldx	[%l7 + 0x28],	%l0
	edge32l	%o1,	%o6,	%i5
	andncc	%i3,	%i0,	%o5
	taddcc	%l4,	%i6,	%g6
	movne	%xcc,	%i1,	%o2
	bcs,a	%icc,	loop_2387
	std	%f4,	[%l7 + 0x40]
	tg	%icc,	0x2
	movg	%icc,	%i2,	%g3
loop_2387:
	bleu,pt	%icc,	loop_2388
	movrlz	%l2,	%o4,	%g5
	taddcc	%o0,	%i4,	%l5
	sdivx	%g7,	0x1F7E,	%g4
loop_2388:
	fmovspos	%icc,	%f25,	%f14
	set	0x15, %i7
	ldstuba	[%l7 + %i7] 0x89,	%o7
	tvc	%icc,	0x0
	st	%f17,	[%l7 + 0x60]
	fbne,a	%fcc0,	loop_2389
	call	loop_2390
	array8	%i7,	%g2,	%l3
	nop
	fitos	%f13,	%f23
	fstoi	%f23,	%f9
loop_2389:
	edge32	%o3,	%g1,	%l1
loop_2390:
	addccc	%l6,	0x0E94,	%l0
	stx	%o1,	[%l7 + 0x38]
	xorcc	%i5,	%i3,	%i0
	andncc	%o5,	%o6,	%l4
	srax	%g6,	0x14,	%i6
	movge	%icc,	%i1,	%o2
	xorcc	%g3,	0x008C,	%i2
	srlx	%o4,	%l2,	%o0
	nop
	setx	loop_2391,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%i4,	%l5,	%g7
	movneg	%icc,	%g5,	%o7
	set	0x50, %l0
	stwa	%i7,	[%l7 + %l0] 0x81
loop_2391:
	ble,pt	%xcc,	loop_2392
	nop
	setx	0xAEE1ABE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f22
	brnz	%g4,	loop_2393
	fcmpgt32	%f2,	%f28,	%l3
loop_2392:
	fcmpgt32	%f14,	%f28,	%g2
	movneg	%icc,	%g1,	%o3
loop_2393:
	tcs	%xcc,	0x5
	movrne	%l1,	%l6,	%l0
	for	%f0,	%f4,	%f26
	wr	%g0,	0x80,	%asi
	stwa	%i5,	[%l7 + 0x7C] %asi
	fcmpne32	%f26,	%f28,	%o1
	mova	%icc,	%i0,	%o5
	orncc	%o6,	%l4,	%g6
	tpos	%icc,	0x7
	edge16n	%i3,	%i6,	%i1
	ldsb	[%l7 + 0x61],	%g3
	fmovdle	%xcc,	%f26,	%f21
	sdivx	%o2,	0x187A,	%o4
	nop
	setx	0x393680DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x47BB57E7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f8,	%f15
	fmovde	%icc,	%f21,	%f6
	set	0x3A, %g7
	lduba	[%l7 + %g7] 0x80,	%l2
	edge32ln	%o0,	%i4,	%i2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x60] %asi,	%g7
	edge16	%l5,	%g5,	%i7
	bgu,pt	%xcc,	loop_2394
	bleu,a,pt	%xcc,	loop_2395
	movle	%icc,	%o7,	%l3
	fpackfix	%f14,	%f19
loop_2394:
	sdiv	%g4,	0x0303,	%g2
loop_2395:
	sdivx	%g1,	0x1955,	%o3
	sra	%l1,	0x06,	%l6
	movleu	%xcc,	%i5,	%o1
	fbg,a	%fcc3,	loop_2396
	andn	%l0,	0x0885,	%o5
	movrlz	%o6,	0x26E,	%l4
	movle	%xcc,	%g6,	%i0
loop_2396:
	swap	[%l7 + 0x20],	%i6
	or	%i1,	%i3,	%g3
	bgu,pn	%icc,	loop_2397
	fornot2	%f30,	%f26,	%f18
	bgu,a,pn	%xcc,	loop_2398
	nop
	setx	0xAA6B2012,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x71C0BCC2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f14,	%f9
loop_2397:
	fxor	%f10,	%f28,	%f8
	bg	loop_2399
loop_2398:
	fbo	%fcc2,	loop_2400
	brz	%o4,	loop_2401
	subcc	%l2,	0x0299,	%o0
loop_2399:
	nop
	fitod	%f23,	%f2
loop_2400:
	lduw	[%l7 + 0x30],	%i4
loop_2401:
	nop
	setx	loop_2402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x1BDE
	tne	%xcc,	0x7
	movge	%icc,	%o2,	%g7
loop_2402:
	membar	0x4A
	ldstub	[%l7 + 0x09],	%l5
	movvs	%icc,	%g5,	%i2
	wr	%g0,	0x10,	%asi
	sta	%f24,	[%l7 + 0x10] %asi
	movl	%icc,	%i7,	%o7
	movrne	%l3,	0x1EE,	%g4
	sub	%g2,	%o3,	%l1
	tvs	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x6C] %asi,	%f17
	fbg	%fcc2,	loop_2403
	movleu	%icc,	%g1,	%l6
	srax	%i5,	%l0,	%o5
	fmul8sux16	%f8,	%f18,	%f22
loop_2403:
	addccc	%o6,	0x1314,	%o1
	fblg,a	%fcc3,	loop_2404
	bvs,a,pt	%icc,	loop_2405
	fmovsgu	%icc,	%f9,	%f23
	movrlez	%g6,	%l4,	%i0
loop_2404:
	stb	%i6,	[%l7 + 0x13]
loop_2405:
	fzero	%f10
	andn	%i3,	%g3,	%o4
	and	%l2,	%i1,	%o0
	nop
	setx	loop_2406,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%o2,	%i4,	%g7
	fnegs	%f29,	%f7
	fmovda	%xcc,	%f23,	%f21
loop_2406:
	edge8	%l5,	%g5,	%i2
	tl	%xcc,	0x2
	bcc,pt	%icc,	loop_2407
	tsubcctv	%i7,	%o7,	%g4
	tne	%icc,	0x7
	tg	%xcc,	0x4
loop_2407:
	brnz,a	%g2,	loop_2408
	fmovrsne	%o3,	%f10,	%f22
	srax	%l3,	%l1,	%l6
	brlz	%g1,	loop_2409
loop_2408:
	subc	%i5,	0x18B2,	%o5
	nop
	fitod	%f6,	%f18
	bneg,a	loop_2410
loop_2409:
	edge8l	%o6,	%o1,	%g6
	movge	%xcc,	%l0,	%i0
	stw	%l4,	[%l7 + 0x70]
loop_2410:
	fbn,a	%fcc0,	loop_2411
	lduw	[%l7 + 0x1C],	%i6
	fornot2s	%f29,	%f26,	%f30
	nop
	setx	0x719AA5FFA8CE0952,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x4D1F8A5C2205A0FC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f4,	%f10
loop_2411:
	fmovdcs	%xcc,	%f16,	%f23
	brz	%g3,	loop_2412
	tl	%icc,	0x3
	fcmpne32	%f16,	%f12,	%o4
	fbuge,a	%fcc3,	loop_2413
loop_2412:
	nop
	setx	loop_2414,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcs	%xcc,	%i3,	%i1
	fsrc1	%f0,	%f18
loop_2413:
	ba,a,pn	%icc,	loop_2415
loop_2414:
	nop
	setx	0x406C1F2F,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	edge32	%l2,	%o2,	%i4
	and	%o0,	%l5,	%g7
loop_2415:
	xor	%g5,	%i2,	%o7
	ble,a,pt	%icc,	loop_2416
	add	%i7,	0x13EF,	%g4
	alignaddr	%o3,	%l3,	%l1
	set	0x70, %g3
	lduwa	[%l7 + %g3] 0x10,	%l6
loop_2416:
	fbug,a	%fcc2,	loop_2417
	umulcc	%g1,	0x0740,	%i5
	movn	%xcc,	%o5,	%g2
	fnot2s	%f28,	%f22
loop_2417:
	addc	%o1,	%o6,	%l0
	bne	%xcc,	loop_2418
	move	%icc,	%g6,	%l4
	taddcctv	%i0,	%g3,	%o4
	fba,a	%fcc2,	loop_2419
loop_2418:
	mova	%icc,	%i3,	%i6
	fmovrsgz	%l2,	%f8,	%f0
	set	0x6D, %i6
	ldstuba	[%l7 + %i6] 0x80,	%i1
loop_2419:
	edge16l	%o2,	%o0,	%i4
	fcmpgt32	%f12,	%f28,	%g7
	movcc	%icc,	%g5,	%l5
	movge	%icc,	%o7,	%i7
	nop
	fitos	%f13,	%f10
	fstox	%f10,	%f2
	fbu,a	%fcc1,	loop_2420
	movleu	%xcc,	%i2,	%g4
	fmul8x16	%f20,	%f4,	%f18
	brnz	%o3,	loop_2421
loop_2420:
	subccc	%l1,	0x13F7,	%l3
	tge	%icc,	0x2
	andn	%l6,	0x0B3D,	%i5
loop_2421:
	fmovse	%xcc,	%f9,	%f24
	tvc	%icc,	0x7
	fxnor	%f12,	%f20,	%f22
	movcs	%xcc,	%g1,	%g2
	subcc	%o5,	%o1,	%o6
	brgez,a	%l0,	loop_2422
	fcmpeq16	%f0,	%f26,	%g6
	movg	%icc,	%i0,	%g3
	tsubcctv	%o4,	%l4,	%i3
loop_2422:
	sethi	0x0EA1,	%l2
	fblg	%fcc3,	loop_2423
	te	%xcc,	0x4
	movvs	%icc,	%i1,	%i6
	sll	%o0,	%o2,	%i4
loop_2423:
	fbl	%fcc1,	loop_2424
	xorcc	%g5,	%l5,	%g7
	fpadd32s	%f20,	%f12,	%f30
	edge16ln	%i7,	%i2,	%o7
loop_2424:
	tvs	%icc,	0x0
	fbug	%fcc0,	loop_2425
	tne	%xcc,	0x6
	fbul,a	%fcc1,	loop_2426
	te	%icc,	0x6
loop_2425:
	edge8l	%o3,	%l1,	%g4
	array32	%l6,	%i5,	%l3
loop_2426:
	fmovrdne	%g1,	%f14,	%f18
	fmovdle	%icc,	%f29,	%f25
	tle	%icc,	0x0
	fbg,a	%fcc0,	loop_2427
	and	%o5,	%o1,	%o6
	movre	%l0,	0x2B2,	%g2
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x18] %asi,	%i0
loop_2427:
	movleu	%xcc,	%g6,	%g3
	alignaddrl	%l4,	%o4,	%i3
	fbl	%fcc0,	loop_2428
	alignaddr	%i1,	%i6,	%l2
	movre	%o2,	0x2C3,	%i4
	add	%o0,	%l5,	%g5
loop_2428:
	st	%f21,	[%l7 + 0x64]
	ld	[%l7 + 0x1C],	%f15
	bgu,a	loop_2429
	faligndata	%f16,	%f0,	%f26
	subcc	%i7,	%g7,	%o7
	tleu	%xcc,	0x4
loop_2429:
	movne	%icc,	%i2,	%l1
	set	0x24, %i3
	stwa	%o3,	[%l7 + %i3] 0x22
	membar	#Sync
	fcmple32	%f20,	%f6,	%g4
	xor	%i5,	0x18A4,	%l6
	xnor	%g1,	%l3,	%o1
	movrne	%o6,	%o5,	%l0
	bne,a	loop_2430
	edge16l	%g2,	%g6,	%i0
	movvs	%icc,	%l4,	%g3
	andn	%i3,	%i1,	%i6
loop_2430:
	sethi	0x1A57,	%l2
	fbg	%fcc2,	loop_2431
	udivcc	%o4,	0x19DC,	%o2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x11] %asi,	%i4
loop_2431:
	movgu	%icc,	%o0,	%l5
	sllx	%g5,	%g7,	%i7
	tcc	%xcc,	0x7
	fmovrsne	%o7,	%f27,	%f3
	andcc	%l1,	0x1A64,	%o3
	srlx	%i2,	%g4,	%l6
	fmovdcs	%xcc,	%f27,	%f6
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bvs,a,pt	%xcc,	loop_2432
	swap	[%l7 + 0x48],	%i5
	fmul8x16au	%f16,	%f27,	%f18
	set	0x38, %i2
	stxa	%l3,	[%l7 + %i2] 0x22
	membar	#Sync
loop_2432:
	fbne	%fcc3,	loop_2433
	stw	%g1,	[%l7 + 0x34]
	tsubcc	%o1,	0x0BCA,	%o5
	nop
	fitos	%f31,	%f20
loop_2433:
	mova	%xcc,	%o6,	%l0
	set	0x1A, %g6
	lduha	[%l7 + %g6] 0x14,	%g6
	movgu	%xcc,	%i0,	%g2
	movrgz	%l4,	0x01C,	%g3
	srl	%i1,	0x05,	%i6
	edge32ln	%i3,	%o4,	%l2
	fmul8x16au	%f11,	%f31,	%f10
	movrgez	%o2,	0x1AC,	%o0
	fmovrdlz	%i4,	%f28,	%f22
	edge16	%g5,	%g7,	%l5
	addcc	%o7,	0x0EE1,	%l1
	lduw	[%l7 + 0x10],	%i7
	edge8l	%o3,	%i2,	%l6
	st	%f30,	[%l7 + 0x34]
	tvc	%xcc,	0x1
	edge32ln	%i5,	%g4,	%g1
	movneg	%icc,	%o1,	%o5
	fmul8x16al	%f23,	%f13,	%f28
	movl	%icc,	%l3,	%o6
	andn	%g6,	%l0,	%g2
	movrgz	%i0,	%g3,	%i1
	fmuld8ulx16	%f6,	%f5,	%f18
	nop
	setx	0xB5255ED7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x0E0C8076,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f1,	%f14
	nop
	set	0x54, %g5
	ldsw	[%l7 + %g5],	%i6
	fmovdcs	%xcc,	%f31,	%f21
	fsrc1	%f26,	%f14
	addc	%i3,	%l4,	%l2
	edge16ln	%o2,	%o4,	%o0
	tvs	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x37] %asi,	%g5
	edge16	%g7,	%l5,	%o7
	membar	0x26
	brz,a	%i4,	loop_2434
	fmovdvc	%xcc,	%f8,	%f13
	fbul	%fcc1,	loop_2435
	fmovdn	%xcc,	%f5,	%f5
loop_2434:
	nop
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x11,	%l0
loop_2435:
	fmovsle	%icc,	%f13,	%f12
	edge8	%i7,	%o3,	%i2
	orcc	%l6,	0x1758,	%i5
	fblg,a	%fcc0,	loop_2436
	ldx	[%l7 + 0x70],	%g1
	nop
	setx	0x7FE442BCF04D1E65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	ldd	[%l7 + 0x38],	%o0
loop_2436:
	tvs	%icc,	0x5
	fbul,a	%fcc2,	loop_2437
	add	%o5,	%l3,	%o6
	movne	%xcc,	%g4,	%l0
	movpos	%icc,	%g6,	%i0
loop_2437:
	fble	%fcc0,	loop_2438
	nop
	setx	0x56E406EF7053FA13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	bne,pn	%xcc,	loop_2439
	fxor	%f22,	%f18,	%f16
loop_2438:
	ble,a	%icc,	loop_2440
	st	%f1,	[%l7 + 0x2C]
loop_2439:
	tn	%xcc,	0x7
	fcmpgt32	%f0,	%f8,	%g3
loop_2440:
	orcc	%g2,	0x0DE0,	%i6
	tneg	%xcc,	0x1
	fmovdcc	%icc,	%f20,	%f23
	fandnot1s	%f27,	%f5,	%f6
	bvc,a	%xcc,	loop_2441
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f20,	%f20,	%i1
	fornot1s	%f14,	%f20,	%f25
loop_2441:
	fbe,a	%fcc0,	loop_2442
	fmovsne	%icc,	%f2,	%f11
	nop
	setx	loop_2443,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot1	%f18,	%f4
loop_2442:
	srl	%l4,	0x00,	%l2
	fmovrdne	%i3,	%f8,	%f16
loop_2443:
	movneg	%xcc,	%o2,	%o4
	tcc	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g5,	%o0
	mulscc	%l5,	0x1CB9,	%o7
	umulcc	%i4,	0x0EB1,	%g7
	movne	%xcc,	%l1,	%o3
	subccc	%i2,	0x1F6B,	%i7
	ba,a,pt	%xcc,	loop_2444
	sdiv	%l6,	0x062D,	%g1
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x36] %asi,	%o1
loop_2444:
	movle	%icc,	%o5,	%i5
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x78] %asi,	%f4
	tle	%icc,	0x4
	or	%o6,	0x0463,	%l3
	movn	%xcc,	%g4,	%l0
	tge	%xcc,	0x7
	tgu	%xcc,	0x5
	alignaddr	%g6,	%g3,	%g2
	tgu	%icc,	0x6
	sdiv	%i0,	0x1C44,	%i1
	tn	%icc,	0x2
	movg	%icc,	%l4,	%i6
	subccc	%l2,	0x05FD,	%i3
	movrne	%o2,	0x1AF,	%g5
	fmovrsgez	%o4,	%f3,	%f17
	subcc	%l5,	0x1A20,	%o0
	nop
	setx	0xD048B88B,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	membar	0x2D
	taddcctv	%i4,	%o7,	%g7
	be,pt	%xcc,	loop_2445
	brgez	%o3,	loop_2446
	fmovsn	%icc,	%f19,	%f24
	smulcc	%l1,	0x0AED,	%i2
loop_2445:
	srax	%i7,	0x07,	%g1
loop_2446:
	ba,pn	%icc,	loop_2447
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%xcc,	%f25,	%f25
	movgu	%xcc,	%o1,	%o5
loop_2447:
	fmovsl	%icc,	%f19,	%f17
	nop
	setx	0x2C2F8FA9A0734BA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	orcc	%i5,	%l6,	%o6
	movvs	%icc,	%g4,	%l0
	andn	%l3,	%g6,	%g2
	tne	%xcc,	0x2
	udivx	%g3,	0x09B9,	%i0
	te	%icc,	0x3
	stw	%l4,	[%l7 + 0x2C]
	movle	%xcc,	%i6,	%i1
	andncc	%i3,	%o2,	%l2
	fbne,a	%fcc2,	loop_2448
	tcs	%xcc,	0x0
	smul	%o4,	%g5,	%l5
	bgu	%xcc,	loop_2449
loop_2448:
	movne	%icc,	%o0,	%o7
	lduw	[%l7 + 0x38],	%g7
	bneg,a	loop_2450
loop_2449:
	fmovrdlz	%i4,	%f2,	%f14
	tcc	%xcc,	0x5
	bl,pt	%icc,	loop_2451
loop_2450:
	orn	%l1,	%o3,	%i7
	fba,a	%fcc3,	loop_2452
	fmovdneg	%icc,	%f21,	%f4
loop_2451:
	bcs,a,pt	%icc,	loop_2453
	fmovsleu	%icc,	%f26,	%f7
loop_2452:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i2,	%o1
loop_2453:
	alignaddr	%g1,	%o5,	%l6
	edge8	%o6,	%i5,	%l0
	nop
	setx	0x017217DAB06B13C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tcs	%xcc,	0x0
	bleu,a	%icc,	loop_2454
	fcmpne32	%f28,	%f4,	%l3
	set	0x70, %o0
	swapa	[%l7 + %o0] 0x81,	%g6
loop_2454:
	tg	%icc,	0x1
	nop
	set	0x48, %l5
	stx	%g4,	[%l7 + %l5]
	fbo,a	%fcc3,	loop_2455
	taddcc	%g2,	%i0,	%l4
	nop
	setx	0x9BF97B09BA8D52BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xA2D042B7B3237A8D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f6,	%f0
	wr	%g0,	0x80,	%asi
	stxa	%i6,	[%l7 + 0x70] %asi
loop_2455:
	array8	%i1,	%g3,	%i3
	fcmpeq16	%f30,	%f28,	%l2
	srax	%o2,	%o4,	%l5
	tle	%icc,	0x3
	sth	%g5,	[%l7 + 0x62]
	movleu	%icc,	%o7,	%g7
	udivx	%o0,	0x1883,	%i4
	orcc	%l1,	%o3,	%i7
	movg	%xcc,	%o1,	%i2
	movgu	%xcc,	%o5,	%l6
	xnorcc	%g1,	0x1D61,	%o6
	ble,a	%icc,	loop_2456
	edge8l	%l0,	%i5,	%g6
	sth	%l3,	[%l7 + 0x66]
	srax	%g4,	0x0B,	%g2
loop_2456:
	fxnors	%f6,	%f7,	%f2
	fbge,a	%fcc0,	loop_2457
	fbe,a	%fcc0,	loop_2458
	fmovrslz	%i0,	%f15,	%f18
	tg	%xcc,	0x0
loop_2457:
	tne	%xcc,	0x5
loop_2458:
	movge	%xcc,	%i6,	%i1
	movge	%xcc,	%l4,	%g3
	sdivx	%l2,	0x0D95,	%o2
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x318] %asi,	%i3 ripped by fixASI40.pl ripped by fixASI40.pl
	bpos,pt	%icc,	loop_2459
	sir	0x096D
	xor	%o4,	0x17CE,	%g5
	add	%l5,	%o7,	%g7
loop_2459:
	edge16ln	%o0,	%i4,	%o3
	udiv	%l1,	0x19B6,	%i7
	movg	%icc,	%i2,	%o5
	andcc	%o1,	0x06D1,	%l6
	nop
	fitos	%f26,	%f6
	ldstub	[%l7 + 0x68],	%g1
	tle	%icc,	0x4
	fbule,a	%fcc2,	loop_2460
	sdivx	%l0,	0x0296,	%o6
	movleu	%icc,	%g6,	%l3
	fmovrdgez	%g4,	%f10,	%f0
loop_2460:
	tpos	%icc,	0x3
	tl	%xcc,	0x6
	bvc,a	loop_2461
	fmovdvc	%xcc,	%f28,	%f27
	fone	%f22
	pdist	%f16,	%f12,	%f26
loop_2461:
	tpos	%xcc,	0x1
	movrgez	%g2,	%i0,	%i6
	fbe	%fcc2,	loop_2462
	fmovsleu	%xcc,	%f11,	%f11
	sdivcc	%i1,	0x1018,	%i5
	std	%f22,	[%l7 + 0x78]
loop_2462:
	movre	%g3,	0x34E,	%l4
	xorcc	%o2,	0x1E9A,	%i3
	tcs	%icc,	0x2
	tl	%icc,	0x6
	movrne	%o4,	%l2,	%g5
	andn	%o7,	0x038C,	%l5
	movrgez	%o0,	%g7,	%o3
	membar	0x10
	bl,pt	%xcc,	loop_2463
	fpsub32	%f6,	%f30,	%f22
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l1
loop_2463:
	ldd	[%l7 + 0x48],	%i4
	nop
	setx	0x9B2643819E795441,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x5C7E4C1589A9A625,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f20,	%f2
	popc	0x074E,	%i2
	sth	%o5,	[%l7 + 0x32]
	fbg	%fcc2,	loop_2464
	movleu	%icc,	%i7,	%o1
	fmovdl	%xcc,	%f31,	%f17
	bg,a	loop_2465
loop_2464:
	stx	%g1,	[%l7 + 0x08]
	brgez,a	%l6,	loop_2466
	orn	%l0,	0x1F45,	%g6
loop_2465:
	tsubcc	%l3,	0x1DBD,	%g4
	fmovdne	%xcc,	%f2,	%f15
loop_2466:
	tcs	%icc,	0x0
	edge16ln	%o6,	%g2,	%i0
	fornot1	%f2,	%f8,	%f16
	tl	%icc,	0x2
	wr	%g0,	0x23,	%asi
	stwa	%i1,	[%l7 + 0x5C] %asi
	membar	#Sync
	subcc	%i6,	0x0EF7,	%i5
	st	%f4,	[%l7 + 0x0C]
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x04
	bne,a	loop_2467
	srax	%g3,	%o2,	%l4
	taddcctv	%o4,	0x0A97,	%i3
	fmovrsne	%g5,	%f27,	%f31
loop_2467:
	ldd	[%l7 + 0x70],	%o6
	fmovdvc	%icc,	%f31,	%f24
	nop
	setx	0x6CB7F4B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xB7227DD6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f17,	%f15
	movleu	%icc,	%l2,	%l5
	tcc	%icc,	0x2
	ta	%icc,	0x5
	array16	%o0,	%o3,	%l1
	tge	%icc,	0x6
	edge32	%i4,	%g7,	%o5
	alignaddr	%i2,	%i7,	%o1
	movgu	%xcc,	%l6,	%g1
	fmovdcs	%xcc,	%f30,	%f1
	edge16n	%l0,	%l3,	%g6
	ldd	[%l7 + 0x50],	%f24
	fbn	%fcc1,	loop_2468
	fxnor	%f20,	%f30,	%f10
	nop
	set	0x38, %o6
	ldstub	[%l7 + %o6],	%g4
	movpos	%icc,	%o6,	%g2
loop_2468:
	tle	%icc,	0x2
	edge8l	%i0,	%i1,	%i6
	orn	%g3,	0x1FBE,	%i5
	fsrc1s	%f20,	%f8
	edge8ln	%l4,	%o4,	%o2
	smulcc	%i3,	%g5,	%o7
	sll	%l5,	0x19,	%o0
	edge8n	%l2,	%o3,	%l1
	tg	%icc,	0x2
	tne	%icc,	0x4
	movg	%icc,	%i4,	%o5
	tvc	%icc,	0x5
	movpos	%icc,	%i2,	%i7
	fxnor	%f30,	%f4,	%f22
	movrlz	%g7,	0x32A,	%o1
	move	%icc,	%l6,	%g1
	sra	%l0,	%l3,	%g6
	andncc	%g4,	%g2,	%i0
	nop
	setx	0xF05ADB71,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fbue,a	%fcc0,	loop_2469
	fmovdn	%icc,	%f25,	%f14
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x28] %asi,	%o6
loop_2469:
	edge32l	%i1,	%g3,	%i6
	tcs	%icc,	0x1
	fmovdpos	%xcc,	%f17,	%f8
	ba	%icc,	loop_2470
	for	%f26,	%f28,	%f24
	or	%l4,	%i5,	%o4
	fnors	%f23,	%f10,	%f12
loop_2470:
	movrlz	%o2,	%g5,	%i3
	movn	%xcc,	%l5,	%o7
	subcc	%o0,	%o3,	%l2
	movge	%icc,	%l1,	%i4
	ldsh	[%l7 + 0x50],	%o5
	fcmpeq32	%f26,	%f28,	%i2
	fmovdvc	%xcc,	%f5,	%f13
	movg	%xcc,	%g7,	%i7
	mova	%xcc,	%o1,	%g1
	fmovsne	%icc,	%f18,	%f27
	add	%l6,	0x09EF,	%l0
	pdist	%f8,	%f22,	%f14
	array8	%l3,	%g6,	%g4
	array32	%g2,	%i0,	%i1
	orncc	%o6,	0x1C14,	%g3
	stx	%i6,	[%l7 + 0x58]
	andncc	%l4,	%i5,	%o4
	sdivx	%g5,	0x0D91,	%o2
	fpsub16	%f14,	%f12,	%f12
	nop
	setx	0xB05ECC6E,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	bvs,a	loop_2471
	fmovdle	%xcc,	%f25,	%f29
	fandnot2s	%f9,	%f6,	%f5
	fmovrdlz	%l5,	%f24,	%f30
loop_2471:
	subc	%i3,	0x1CEF,	%o0
	mova	%xcc,	%o7,	%l2
	tsubcc	%l1,	0x0CAC,	%i4
	tvc	%icc,	0x1
	fble	%fcc1,	loop_2472
	taddcctv	%o5,	%o3,	%i2
	movvc	%icc,	%i7,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2472:
	fmovdcs	%xcc,	%f5,	%f31
	set	0x46, %l2
	ldstuba	[%l7 + %l2] 0x04,	%g7
	stbar
	movpos	%icc,	%g1,	%l6
	fpadd16	%f4,	%f12,	%f18
	fmovscs	%xcc,	%f7,	%f11
	prefetch	[%l7 + 0x60],	 0x3
	tge	%icc,	0x7
	fpack16	%f30,	%f2
	fcmpeq16	%f8,	%f8,	%l3
	tneg	%xcc,	0x3
	sub	%l0,	0x02A1,	%g6
	sdivx	%g2,	0x052E,	%i0
	movgu	%xcc,	%i1,	%g4
	edge32ln	%o6,	%g3,	%l4
	addccc	%i6,	0x1368,	%i5
	addcc	%o4,	0x0380,	%g5
	nop
	setx	loop_2473,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%l5,	0x0AFD,	%i3
	fpsub16	%f30,	%f2,	%f0
	taddcctv	%o2,	%o7,	%o0
loop_2473:
	brlez	%l1,	loop_2474
	movrgz	%l2,	0x1BF,	%o5
	fbn,a	%fcc2,	loop_2475
	fmovsl	%icc,	%f0,	%f21
loop_2474:
	movre	%i4,	%o3,	%i2
	nop
	setx	loop_2476,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2475:
	tcs	%icc,	0x5
	srlx	%i7,	%g7,	%g1
	array8	%l6,	%o1,	%l0
loop_2476:
	movrgez	%l3,	0x006,	%g2
	nop
	setx loop_2477, %l0, %l1
	jmpl %l1, %g6
	ld	[%l7 + 0x64],	%f29
	movn	%icc,	%i1,	%g4
	taddcctv	%i0,	%g3,	%o6
loop_2477:
	edge16	%l4,	%i5,	%i6
	add	%o4,	0x0231,	%g5
	move	%icc,	%l5,	%o2
	set	0x34, %l3
	sta	%f1,	[%l7 + %l3] 0x04
	fmovdgu	%icc,	%f20,	%f11
	flush	%l7 + 0x4C
	movge	%xcc,	%o7,	%o0
	edge16n	%i3,	%l2,	%l1
	nop
	fitos	%f6,	%f4
	fstox	%f4,	%f2
	edge8l	%i4,	%o5,	%o3
	movl	%icc,	%i7,	%i2
	edge8l	%g1,	%l6,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g7,	0x1690,	%l3
	ba,a,pn	%icc,	loop_2478
	fmovdne	%icc,	%f0,	%f18
	movleu	%xcc,	%g2,	%l0
	xnorcc	%i1,	%g6,	%i0
loop_2478:
	sir	0x13CB
	fnegs	%f12,	%f16
	set	0x46, %g2
	stha	%g4,	[%l7 + %g2] 0xe3
	membar	#Sync
	set	0x50, %i1
	sta	%f2,	[%l7 + %i1] 0x15
	flush	%l7 + 0x1C
	movvs	%icc,	%o6,	%l4
	taddcc	%i5,	%i6,	%o4
	stw	%g3,	[%l7 + 0x18]
	edge32n	%l5,	%o2,	%g5
	brnz,a	%o0,	loop_2479
	movrgz	%i3,	%o7,	%l1
	tsubcctv	%l2,	%i4,	%o5
	fcmpne32	%f14,	%f30,	%i7
loop_2479:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3B] %asi,	%i2
	movn	%icc,	%g1,	%o3
	nop
	fitod	%f6,	%f8
	udivcc	%l6,	0x0185,	%o1
	edge16l	%l3,	%g2,	%g7
	fpadd32	%f6,	%f20,	%f4
	nop
	fitos	%f0,	%f0
	fstoi	%f0,	%f18
	fmovrslez	%l0,	%f3,	%f8
	udiv	%i1,	0x1326,	%i0
	movrne	%g6,	%g4,	%l4
	brgz	%o6,	loop_2480
	nop
	set	0x3C, %o3
	stw	%i6,	[%l7 + %o3]
	movvc	%icc,	%i5,	%g3
	xnor	%l5,	0x097F,	%o4
loop_2480:
	movrlz	%o2,	%g5,	%i3
	brnz,a	%o0,	loop_2481
	movre	%o7,	0x03F,	%l2
	movcs	%icc,	%i4,	%l1
	movcc	%icc,	%o5,	%i2
loop_2481:
	array16	%i7,	%o3,	%g1
	mulscc	%o1,	0x1224,	%l3
	nop
	fitod	%f15,	%f28
	addccc	%g2,	0x1641,	%g7
	sdivx	%l0,	0x0C88,	%i1
	sdivx	%l6,	0x0027,	%i0
	stb	%g4,	[%l7 + 0x76]
	array32	%g6,	%l4,	%i6
	fmovse	%icc,	%f8,	%f2
	xorcc	%i5,	%g3,	%l5
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o4,	%o2,	%o6
	stb	%i3,	[%l7 + 0x1E]
	fmovsneg	%icc,	%f28,	%f7
	srax	%o0,	0x09,	%o7
	tsubcc	%l2,	%i4,	%l1
	xnor	%g5,	%o5,	%i7
	edge16ln	%o3,	%g1,	%i2
	bge,pt	%icc,	loop_2482
	fornot1	%f22,	%f6,	%f8
	srax	%o1,	%g2,	%l3
	fbue,a	%fcc3,	loop_2483
loop_2482:
	orcc	%l0,	0x0880,	%i1
	orcc	%g7,	0x15D3,	%i0
	movrlz	%l6,	0x0FD,	%g4
loop_2483:
	fmul8x16au	%f19,	%f11,	%f10
	tge	%xcc,	0x2
	brlez	%g6,	loop_2484
	edge16ln	%l4,	%i6,	%i5
	fmovsge	%icc,	%f29,	%f23
	addc	%l5,	%o4,	%o2
loop_2484:
	movrne	%g3,	0x053,	%o6
	fabss	%f11,	%f3
	udiv	%i3,	0x018C,	%o0
	fbne	%fcc0,	loop_2485
	umulcc	%o7,	0x16B7,	%i4
	xor	%l1,	%l2,	%o5
	fmovsvc	%xcc,	%f8,	%f24
loop_2485:
	alignaddrl	%i7,	%o3,	%g5
	edge32ln	%g1,	%o1,	%i2
	bcc,a,pt	%icc,	loop_2486
	or	%g2,	%l3,	%l0
	movrlz	%g7,	0x29A,	%i0
	brnz	%l6,	loop_2487
loop_2486:
	tvs	%xcc,	0x2
	tgu	%icc,	0x4
	fpmerge	%f12,	%f19,	%f22
loop_2487:
	nop
	set	0x30, %g4
	std	%f30,	[%l7 + %g4]
	edge8ln	%i1,	%g6,	%l4
	add	%l7,	0x24,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x89,	%g4,	%i5
	taddcc	%l5,	%o4,	%i6
	or	%g3,	%o6,	%o2
	add	%i3,	0x1234,	%o7
	smul	%i4,	0x1DA6,	%l1
	move	%xcc,	%l2,	%o0
	bvs,pt	%xcc,	loop_2488
	stbar
	fcmpne32	%f10,	%f18,	%o5
	tne	%xcc,	0x7
loop_2488:
	movre	%i7,	0x383,	%o3
	movne	%icc,	%g5,	%o1
	ld	[%l7 + 0x50],	%f29
	tgu	%icc,	0x7
	movrgz	%g1,	%g2,	%l3
	set	0x34, %o2
	lduba	[%l7 + %o2] 0x14,	%l0
	nop
	setx loop_2489, %l0, %l1
	jmpl %l1, %i2
	stbar
	addcc	%g7,	%i0,	%l6
	fbu,a	%fcc2,	loop_2490
loop_2489:
	movne	%icc,	%g6,	%i1
	movneg	%xcc,	%l4,	%i5
	mulscc	%g4,	0x06A3,	%o4
loop_2490:
	bleu,a,pn	%xcc,	loop_2491
	udiv	%l5,	0x0500,	%g3
	nop
	fitos	%f8,	%f2
	fstox	%f2,	%f0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o6
loop_2491:
	fmovrdgez	%i6,	%f22,	%f12
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o7
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x0c,	%f16
	fcmpeq32	%f26,	%f28,	%i4
	stw	%o2,	[%l7 + 0x38]
	udivcc	%l2,	0x0522,	%o0
	movrlz	%o5,	0x0EB,	%l1
	tvs	%xcc,	0x6
	bne	%icc,	loop_2492
	andn	%i7,	%o3,	%g5
	edge8ln	%g1,	%g2,	%o1
	edge8	%l0,	%i2,	%g7
loop_2492:
	edge16ln	%l3,	%i0,	%l6
	bgu,a	loop_2493
	fmovrsgz	%g6,	%f4,	%f24
	set	0x20, %i4
	stxa	%l4,	[%l7 + %i4] 0x2b
	membar	#Sync
loop_2493:
	membar	0x1E
	subcc	%i5,	0x136F,	%i1
	andn	%g4,	%o4,	%g3
	edge16n	%o6,	%l5,	%i3
	movre	%o7,	%i6,	%i4
	sllx	%o2,	%l2,	%o5
	umul	%o0,	%l1,	%o3
	addcc	%g5,	%g1,	%g2
	sdiv	%i7,	0x0B53,	%o1
	lduh	[%l7 + 0x34],	%l0
	lduh	[%l7 + 0x32],	%i2
	movne	%icc,	%g7,	%l3
	movle	%xcc,	%l6,	%i0
	bpos,a	loop_2494
	xnor	%g6,	%i5,	%i1
	tsubcctv	%l4,	0x1B88,	%g4
	fbo,a	%fcc1,	loop_2495
loop_2494:
	for	%f22,	%f28,	%f6
	stbar
	bneg	%xcc,	loop_2496
loop_2495:
	umulcc	%o4,	%g3,	%o6
	tl	%xcc,	0x6
	tn	%icc,	0x7
loop_2496:
	edge16n	%i3,	%o7,	%i6
	movrlez	%i4,	0x18F,	%o2
	umul	%l5,	%o5,	%l2
	edge8ln	%o0,	%o3,	%l1
	sth	%g1,	[%l7 + 0x5A]
	nop
	set	0x45, %l4
	ldub	[%l7 + %l4],	%g2
	movcs	%icc,	%i7,	%g5
	ta	%icc,	0x4
	tneg	%icc,	0x7
	stx	%o1,	[%l7 + 0x40]
	bshuffle	%f2,	%f20,	%f22
	nop
	setx	0x9215D7C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x5FAA4988,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f30,	%f29
	xnor	%l0,	%g7,	%i2
	fpack16	%f20,	%f10
	tle	%icc,	0x3
	movvs	%icc,	%l3,	%l6
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x60] %asi,	%i0
	andcc	%g6,	0x12B4,	%i1
	edge8ln	%i5,	%g4,	%o4
	fabsd	%f8,	%f12
	edge8l	%g3,	%l4,	%i3
	sll	%o6,	0x07,	%i6
	fblg,a	%fcc1,	loop_2497
	tn	%xcc,	0x4
	edge16	%o7,	%i4,	%o2
	tpos	%icc,	0x4
loop_2497:
	movrgez	%o5,	%l2,	%l5
	nop
	setx	loop_2498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stx	%o0,	[%l7 + 0x18]
	fble	%fcc3,	loop_2499
	xnorcc	%l1,	0x02D3,	%o3
loop_2498:
	stw	%g2,	[%l7 + 0x10]
	movrgz	%g1,	%i7,	%g5
loop_2499:
	sll	%l0,	%g7,	%i2
	sethi	0x15FE,	%l3
	orcc	%l6,	%i0,	%g6
	tleu	%icc,	0x4
	fcmpeq16	%f8,	%f26,	%i1
	srl	%i5,	%g4,	%o4
	srl	%o1,	%l4,	%g3
	mulx	%o6,	%i6,	%i3
	mulscc	%o7,	0x06BD,	%o2
	call	loop_2500
	or	%o5,	%i4,	%l2
	sir	0x1DD8
	edge8l	%o0,	%l1,	%o3
loop_2500:
	nop
	setx	0x4B3B9E89C0510F2E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	tge	%icc,	0x6
	movge	%icc,	%l5,	%g2
	movrgz	%g1,	0x239,	%g5
	ldd	[%l7 + 0x40],	%l0
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f16
	fxtod	%f16,	%f18
	edge16ln	%g7,	%i7,	%i2
	edge32	%l3,	%i0,	%g6
	xnor	%i1,	0x0F13,	%i5
	ldub	[%l7 + 0x54],	%l6
	fcmpgt32	%f2,	%f12,	%g4
	movvc	%icc,	%o1,	%o4
	fmul8ulx16	%f2,	%f14,	%f20
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x54] %asi,	%f4
	edge32l	%l4,	%o6,	%i6
	brlz,a	%g3,	loop_2501
	stb	%o7,	[%l7 + 0x46]
	udivcc	%o2,	0x17C3,	%i3
	movrlz	%o5,	0x3D1,	%l2
loop_2501:
	tsubcc	%o0,	0x095F,	%i4
	sllx	%l1,	0x0A,	%l5
	for	%f18,	%f8,	%f20
	sub	%g2,	0x11A9,	%o3
	umul	%g5,	0x174B,	%g1
	movneg	%icc,	%g7,	%i7
	nop
	fitos	%f14,	%f30
	fstod	%f30,	%f0
	srlx	%i2,	0x04,	%l0
	fmovsvs	%xcc,	%f11,	%f14
	membar	0x1A
	tsubcc	%i0,	0x05DB,	%g6
	stbar
	tg	%xcc,	0x4
	fble	%fcc0,	loop_2502
	bleu,pn	%xcc,	loop_2503
	brnz	%i1,	loop_2504
	alignaddr	%l3,	%i5,	%l6
loop_2502:
	bne,a,pn	%xcc,	loop_2505
loop_2503:
	bshuffle	%f18,	%f20,	%f6
loop_2504:
	mulx	%g4,	%o1,	%l4
	nop
	setx	0x6E1271B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f24
loop_2505:
	flush	%l7 + 0x7C
	subc	%o4,	%i6,	%o6
	fbe,a	%fcc2,	loop_2506
	movrgz	%o7,	%g3,	%o2
	ld	[%l7 + 0x2C],	%f13
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o5,	%l2
loop_2506:
	fmovdne	%xcc,	%f18,	%f6
	fmovsge	%icc,	%f13,	%f11
	fbuge	%fcc2,	loop_2507
	edge32ln	%i3,	%i4,	%o0
	brgz	%l1,	loop_2508
	bne,pt	%xcc,	loop_2509
loop_2507:
	st	%f11,	[%l7 + 0x5C]
	movre	%l5,	%g2,	%g5
loop_2508:
	tsubcctv	%g1,	%g7,	%i7
loop_2509:
	fandnot2	%f28,	%f24,	%f4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i2
	st	%f28,	[%l7 + 0x60]
	srlx	%o3,	%i0,	%g6
	edge32	%i1,	%l0,	%l3
	movrgez	%i5,	%l6,	%g4
	fbue,a	%fcc1,	loop_2510
	tge	%xcc,	0x0
	popc	0x0D62,	%l4
	udiv	%o1,	0x1474,	%i6
loop_2510:
	mulscc	%o4,	0x14AA,	%o6
	taddcc	%o7,	%o2,	%o5
	fsrc2	%f26,	%f16
	udivcc	%g3,	0x156D,	%i3
	ldsh	[%l7 + 0x62],	%i4
	fornot2s	%f14,	%f6,	%f21
	bvs,a,pn	%icc,	loop_2511
	fmovsvs	%xcc,	%f16,	%f10
	nop
	setx	0x2DCDC404,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f28
	movrne	%l2,	%l1,	%l5
loop_2511:
	nop
	setx	0xA41857E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x162659D8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f10,	%f26
	bcc,a,pn	%icc,	loop_2512
	array32	%g2,	%o0,	%g5
	nop
	setx	0x83F0787989AFBF3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE50D25FD42688757,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f16,	%f26
	ldsh	[%l7 + 0x0A],	%g7
loop_2512:
	nop
	setx	0xE2FCB0F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x42BB4FA9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f16,	%f27
	nop
	setx	loop_2513,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%i7,	%g1,	%i2
	addcc	%i0,	0x18B1,	%g6
	alignaddr	%o3,	%i1,	%l3
loop_2513:
	fbug	%fcc1,	loop_2514
	fmovsge	%icc,	%f4,	%f19
	alignaddrl	%l0,	%i5,	%g4
	orncc	%l4,	%l6,	%i6
loop_2514:
	nop
	wr	%g0,	0x88,	%asi
	stba	%o4,	[%l7 + 0x77] %asi
	subccc	%o1,	%o6,	%o2
	ldsw	[%l7 + 0x78],	%o5
	movn	%xcc,	%o7,	%i3
	bshuffle	%f2,	%f12,	%f18
	udivx	%g3,	0x091A,	%i4
	movrlez	%l2,	0x00E,	%l1
	set	0x38, %g1
	lduwa	[%l7 + %g1] 0x19,	%g2
	edge16	%l5,	%o0,	%g7
	umulcc	%g5,	0x1BB2,	%i7
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f30
	fxtod	%f30,	%f10
	fmul8x16al	%f2,	%f16,	%f28
	movvs	%xcc,	%g1,	%i2
	popc	%i0,	%g6
	wr	%g0,	0xe3,	%asi
	stwa	%i1,	[%l7 + 0x08] %asi
	membar	#Sync
	fbe	%fcc1,	loop_2515
	add	%l3,	0x0C9A,	%l0
	tsubcctv	%i5,	0x1467,	%o3
	movn	%icc,	%g4,	%l4
loop_2515:
	tgu	%xcc,	0x4
	udivx	%i6,	0x1E44,	%l6
	andncc	%o4,	%o6,	%o2
	edge32n	%o1,	%o5,	%o7
	fxnors	%f20,	%f17,	%f20
	movleu	%icc,	%g3,	%i3
	andcc	%l2,	0x0780,	%l1
	move	%icc,	%i4,	%g2
	ldx	[%l7 + 0x48],	%o0
	tpos	%icc,	0x7
	andcc	%g7,	0x1BF6,	%g5
	tleu	%icc,	0x7
	movneg	%icc,	%i7,	%g1
	movneg	%xcc,	%l5,	%i0
	xor	%i2,	%g6,	%l3
	ta	%xcc,	0x5
	fones	%f30
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x60] %asi,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i1,	%o3,	%i5
	tvs	%xcc,	0x0
	fmul8ulx16	%f4,	%f0,	%f16
	tn	%icc,	0x6
	srl	%l4,	%g4,	%i6
	fmovdl	%xcc,	%f20,	%f29
	movpos	%xcc,	%o4,	%l6
	srlx	%o6,	0x08,	%o2
	fornot2s	%f30,	%f0,	%f6
	array8	%o1,	%o5,	%o7
	fandnot1	%f0,	%f4,	%f4
	bn,a,pn	%icc,	loop_2516
	fzeros	%f31
	orcc	%i3,	0x1DE2,	%l2
	ldstub	[%l7 + 0x66],	%l1
loop_2516:
	nop
	setx	0xA3B08DCD506F120D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	nop
	setx	0x4712647E16AF5C57,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xB117CFF56E9ADA56,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f12,	%f26
	stw	%i4,	[%l7 + 0x58]
	tge	%icc,	0x5
	movneg	%xcc,	%g2,	%g3
	addccc	%o0,	0x0F60,	%g7
	swap	[%l7 + 0x30],	%i7
	edge32ln	%g5,	%l5,	%g1
	edge8ln	%i2,	%g6,	%i0
	nop
	setx	loop_2517,	%l0,	%l1
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
	fmovspos	%icc,	%f20,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2517:
	ldstub	[%l7 + 0x5C],	%l3
	sll	%l0,	%i1,	%o3
	nop
	setx	0x5D91FB4BF0E83F20,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x7186D6D9FC8235AB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f2,	%f8
	membar	0x27
	fmovdn	%icc,	%f18,	%f9
	sub	%i5,	%l4,	%g4
	smulcc	%o4,	0x10E4,	%i6
	edge16l	%l6,	%o2,	%o6
	tcc	%icc,	0x3
	array32	%o5,	%o1,	%o7
	swap	[%l7 + 0x28],	%l2
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x40] %asi,	%l1
	fmovdn	%icc,	%f18,	%f25
	ldub	[%l7 + 0x76],	%i4
	popc	0x029C,	%g2
	tsubcc	%g3,	%i3,	%g7
	edge32n	%o0,	%i7,	%g5
	tle	%xcc,	0x4
	ldsb	[%l7 + 0x42],	%g1
	sra	%i2,	0x03,	%l5
	fpackfix	%f12,	%f17
	fmovdl	%xcc,	%f21,	%f15
	sethi	0x0F16,	%i0
	set	0x3C, %o4
	ldswa	[%l7 + %o4] 0x88,	%g6
	nop
	setx	0x0CCB9C594075CD76,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fmovdn	%icc,	%f25,	%f16
	bvc,pt	%icc,	loop_2518
	edge16n	%l0,	%i1,	%l3
	set	0x32, %l1
	lduba	[%l7 + %l1] 0x19,	%o3
loop_2518:
	edge32l	%l4,	%g4,	%o4
	nop
	setx	0xF53FD1F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xB21C03E7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f27,	%f6
	movvs	%xcc,	%i6,	%i5
	fmovrde	%l6,	%f20,	%f4
	movvs	%xcc,	%o6,	%o5
	subccc	%o2,	%o1,	%o7
	stb	%l2,	[%l7 + 0x1C]
	smul	%l1,	0x0149,	%g2
	subcc	%i4,	0x0F14,	%i3
	fmovrdne	%g3,	%f8,	%f30
	pdist	%f22,	%f30,	%f24
	fnands	%f10,	%f18,	%f6
	movrgez	%o0,	%i7,	%g5
	stw	%g7,	[%l7 + 0x3C]
	movre	%i2,	0x2C9,	%l5
	popc	0x1D48,	%i0
	fandnot1s	%f19,	%f29,	%f13
	udiv	%g1,	0x088D,	%g6
	xorcc	%i1,	0x1A8C,	%l3
	tpos	%icc,	0x1
	andcc	%o3,	%l4,	%l0
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x60] %asi,	%f7
	bgu,pn	%icc,	loop_2519
	movcc	%icc,	%o4,	%i6
	sir	0x08EC
	swap	[%l7 + 0x34],	%g4
loop_2519:
	addcc	%i5,	%l6,	%o5
	fcmple32	%f16,	%f28,	%o6
	bcc	loop_2520
	membar	0x2D
	fbue	%fcc1,	loop_2521
	ta	%icc,	0x6
loop_2520:
	taddcctv	%o1,	0x1AB3,	%o2
	fmovdle	%icc,	%f10,	%f18
loop_2521:
	alignaddr	%l2,	%o7,	%l1
	alignaddrl	%g2,	%i3,	%i4
	wr	%g0,	0xea,	%asi
	stwa	%g3,	[%l7 + 0x18] %asi
	membar	#Sync
	fcmpeq16	%f22,	%f14,	%o0
	xorcc	%i7,	%g7,	%i2
	sdivcc	%g5,	0x08D1,	%l5
	tcs	%icc,	0x2
	srax	%i0,	%g1,	%g6
	tsubcctv	%l3,	%i1,	%l4
	sethi	0x1198,	%o3
	tl	%xcc,	0x2
	sub	%l0,	%i6,	%o4
	move	%icc,	%g4,	%i5
	array32	%o5,	%o6,	%l6
	tleu	%icc,	0x1
	set	0x6D, %o5
	ldsba	[%l7 + %o5] 0x88,	%o2
	bshuffle	%f16,	%f26,	%f24
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l2,	%o7
	stbar
	fmovrdne	%o1,	%f12,	%f20
	sdiv	%l1,	0x05AB,	%g2
	sethi	0x1918,	%i4
	for	%f6,	%f20,	%f22
	set	0x6A, %i5
	stha	%g3,	[%l7 + %i5] 0x18
	edge16	%o0,	%i7,	%i3
	or	%g7,	%g5,	%l5
	addcc	%i2,	%i0,	%g1
	subc	%l3,	%g6,	%i1
	fornot2	%f12,	%f26,	%f4
	fbuge	%fcc1,	loop_2522
	edge32	%o3,	%l0,	%l4
	movgu	%xcc,	%i6,	%g4
	nop
	fitos	%f13,	%f12
	fstox	%f12,	%f28
loop_2522:
	movcs	%icc,	%i5,	%o4
	sethi	0x1077,	%o5
	fmovspos	%xcc,	%f11,	%f29
	orn	%l6,	%o2,	%l2
	andncc	%o7,	%o6,	%l1
	fabss	%f7,	%f31
	edge16	%g2,	%o1,	%g3
	fbl,a	%fcc0,	loop_2523
	srl	%i4,	%o0,	%i3
	movvs	%xcc,	%i7,	%g7
	fmovrdlez	%g5,	%f16,	%f14
loop_2523:
	tpos	%icc,	0x7
	edge32ln	%l5,	%i0,	%g1
	edge8l	%i2,	%l3,	%i1
	tn	%xcc,	0x1
	andncc	%g6,	%l0,	%l4
	nop
	fitod	%f12,	%f26
	fdtoi	%f26,	%f12
	and	%o3,	0x0128,	%g4
	edge32ln	%i6,	%o4,	%i5
	nop
	setx	0x840D1F3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xD56610CC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f11,	%f4
	smul	%o5,	0x0859,	%l6
	edge32l	%o2,	%o7,	%l2
	set	0x74, %i7
	swapa	[%l7 + %i7] 0x10,	%o6
	nop
	setx	0x4B251D22,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xE0325A16,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f21,	%f4
	edge8	%l1,	%o1,	%g2
	movre	%g3,	%i4,	%i3
	tsubcc	%i7,	%g7,	%o0
	movcc	%icc,	%g5,	%i0
	array8	%l5,	%g1,	%l3
	fxnor	%f18,	%f2,	%f24
	fmul8ulx16	%f30,	%f0,	%f20
	orncc	%i1,	0x13B7,	%g6
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x81,	%f0
	fbe	%fcc3,	loop_2524
	fbule,a	%fcc0,	loop_2525
	fmovsle	%xcc,	%f10,	%f26
	sra	%i2,	0x1B,	%l4
loop_2524:
	andcc	%o3,	%g4,	%l0
loop_2525:
	xor	%i6,	%o4,	%o5
	addcc	%l6,	0x1141,	%i5
	mulscc	%o7,	%l2,	%o2
	tcc	%icc,	0x3
	wr	%g0,	0xeb,	%asi
	stha	%o6,	[%l7 + 0x44] %asi
	membar	#Sync
	taddcctv	%o1,	0x143A,	%g2
	movre	%l1,	0x10F,	%i4
	array8	%i3,	%i7,	%g7
	fbe,a	%fcc0,	loop_2526
	fcmpgt32	%f26,	%f0,	%o0
	srl	%g5,	%g3,	%i0
	fmovdne	%icc,	%f9,	%f5
loop_2526:
	movcc	%xcc,	%l5,	%g1
	subccc	%l3,	%g6,	%i1
	nop
	setx	0x30574153,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	tl	%xcc,	0x2
	orn	%l4,	%i2,	%o3
	tcc	%xcc,	0x1
	bneg,a	loop_2527
	fmovsg	%icc,	%f28,	%f0
	smulcc	%l0,	0x0491,	%i6
	movrgez	%g4,	0x20D,	%o5
loop_2527:
	popc	0x14BA,	%l6
	brgz	%o4,	loop_2528
	movrlz	%i5,	0x16B,	%l2
	set	0x300, %g7
	nop 	! 	stxa	%o7,	[%g0 + %g7] 0x40 ripped by fixASI40.pl
loop_2528:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x80,	%o6,	%o1
	tle	%xcc,	0x5
	edge16l	%g2,	%o2,	%i4
	st	%f26,	[%l7 + 0x14]
	fsrc1s	%f27,	%f5
	fpadd16	%f30,	%f14,	%f10
	fones	%f9
	alignaddrl	%i3,	%l1,	%g7
	sra	%o0,	%g5,	%i7
	wr	%g0,	0x80,	%asi
	stha	%g3,	[%l7 + 0x7E] %asi
	sdivx	%l5,	0x1A9A,	%i0
	addccc	%l3,	0x0BE4,	%g6
	tvs	%icc,	0x4
	ldsb	[%l7 + 0x32],	%g1
	movneg	%icc,	%i1,	%i2
	addcc	%o3,	0x0B75,	%l4
	mulscc	%i6,	0x10D0,	%l0
	fpackfix	%f2,	%f27
	edge16	%g4,	%o5,	%l6
	subcc	%i5,	0x1C1A,	%o4
	edge32ln	%o7,	%o6,	%l2
	movne	%icc,	%g2,	%o1
	subc	%i4,	0x0FE8,	%i3
	fpadd32s	%f8,	%f22,	%f16
	taddcc	%o2,	0x1DFA,	%g7
	andncc	%l1,	%g5,	%o0
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f8
	xor	%g3,	0x0874,	%i7
	edge16n	%l5,	%l3,	%g6
	bvc,a,pn	%xcc,	loop_2529
	nop
	setx loop_2530, %l0, %l1
	jmpl %l1, %i0
	tn	%icc,	0x1
	movrgez	%i1,	%i2,	%o3
loop_2529:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%g1
loop_2530:
	tcc	%icc,	0x7
	movrlz	%l4,	0x2C6,	%l0
	udivx	%g4,	0x13D0,	%i6
	subccc	%o5,	%i5,	%o4
	set	0x08, %g3
	stwa	%l6,	[%l7 + %g3] 0x11
	fbge	%fcc1,	loop_2531
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x1
	nop
	setx	0xE0AB6FD8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x75A3598A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f2,	%f2
loop_2531:
	movl	%icc,	%o6,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l2,	%g2,	%i4
	fmovrdlez	%o1,	%f30,	%f30
	bl	loop_2532
	taddcctv	%i3,	%g7,	%l1
	movne	%icc,	%o2,	%g5
	movcs	%xcc,	%g3,	%i7
loop_2532:
	fmovsleu	%xcc,	%f19,	%f13
	array32	%o0,	%l3,	%g6
	and	%i0,	0x16F6,	%i1
	fpackfix	%f6,	%f30
	movg	%xcc,	%i2,	%o3
	srax	%l5,	0x12,	%g1
	sethi	0x1A8B,	%l4
	fble	%fcc3,	loop_2533
	movgu	%icc,	%g4,	%l0
	fba,a	%fcc1,	loop_2534
	movn	%xcc,	%i6,	%i5
loop_2533:
	fornot2	%f28,	%f22,	%f22
	xnorcc	%o4,	%l6,	%o5
loop_2534:
	tg	%icc,	0x0
	movrgz	%o7,	%o6,	%l2
	membar	0x49
	set	0x48, %l0
	prefetcha	[%l7 + %l0] 0x04,	 0x2
	andncc	%o1,	%i3,	%i4
	sub	%l1,	%o2,	%g5
	fmovrde	%g7,	%f22,	%f2
	fble	%fcc1,	loop_2535
	movl	%xcc,	%g3,	%o0
	movre	%i7,	%l3,	%g6
	tle	%icc,	0x1
loop_2535:
	alignaddrl	%i0,	%i1,	%i2
	fmovsge	%xcc,	%f19,	%f24
	tpos	%xcc,	0x3
	bn	%icc,	loop_2536
	fmovrsgez	%o3,	%f16,	%f13
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x23] %asi,	%l5
loop_2536:
	fmovscs	%icc,	%f0,	%f0
	tn	%icc,	0x6
	movgu	%icc,	%l4,	%g4
	fcmple32	%f10,	%f14,	%g1
	subccc	%i6,	0x03D1,	%l0
	ta	%icc,	0x7
	srlx	%o4,	%i5,	%o5
	udivcc	%o7,	0x1A7E,	%l6
	ta	%icc,	0x4
	subcc	%l2,	0x166B,	%g2
	fbe	%fcc3,	loop_2537
	tneg	%icc,	0x4
	nop
	setx	0xCC4A5CAF30749B94,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	tsubcctv	%o6,	0x10FB,	%o1
loop_2537:
	fmovrdgz	%i4,	%f20,	%f10
	edge8ln	%i3,	%o2,	%l1
	flush	%l7 + 0x60
	fcmpne32	%f14,	%f30,	%g7
	fsrc2	%f26,	%f0
	srax	%g5,	%g3,	%i7
	edge16n	%l3,	%o0,	%i0
	sub	%i1,	%i2,	%g6
	sir	0x1CCC
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x15,	 0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos	loop_2538
	xorcc	%l4,	0x0C23,	%o3
	sdivx	%g1,	0x09FD,	%g4
	ldd	[%l7 + 0x68],	%f16
loop_2538:
	movvs	%icc,	%l0,	%i6
	set	0x0A, %i2
	lduba	[%l7 + %i2] 0x0c,	%i5
	array8	%o4,	%o7,	%o5
	sllx	%l2,	%g2,	%o6
	edge16n	%l6,	%o1,	%i4
	orcc	%i3,	0x12B2,	%l1
	nop
	fitod	%f0,	%f0
	fdtoi	%f0,	%f24
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g7
	sra	%g5,	%g3,	%i7
	tvc	%xcc,	0x6
	udiv	%o2,	0x1A14,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f8,	%f28,	%f30
	nop
	fitos	%f23,	%f14
	sra	%i0,	%i1,	%l3
	fmovsleu	%icc,	%f20,	%f24
	nop
	setx	0xCD6D91B50F8FA216,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x1116EAB275AC8B39,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f14,	%f0
	andn	%i2,	%g6,	%l5
	fxnors	%f21,	%f26,	%f25
	fmovrslez	%o3,	%f4,	%f18
	subccc	%l4,	%g4,	%l0
	array8	%g1,	%i5,	%i6
	fpsub32	%f28,	%f2,	%f18
	fpadd32s	%f27,	%f10,	%f22
	edge16n	%o4,	%o5,	%l2
	addcc	%g2,	%o7,	%l6
	xnor	%o6,	0x153C,	%i4
	subccc	%i3,	%o1,	%l1
	movrne	%g5,	0x1B1,	%g7
	udivcc	%g3,	0x094D,	%i7
	sllx	%o2,	%i0,	%o0
	andncc	%i1,	%l3,	%i2
	nop
	setx	0x3991D837,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f25
	tleu	%icc,	0x4
	sir	0x100B
	fmul8x16	%f19,	%f22,	%f6
	movrgez	%g6,	0x360,	%o3
	movgu	%icc,	%l4,	%g4
	nop
	setx	0x11A5D3617886B4D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xC2A87189A5EF066D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f20,	%f20
	array16	%l0,	%l5,	%i5
	fmovse	%xcc,	%f24,	%f26
	and	%i6,	0x0E65,	%o4
	fmovdn	%xcc,	%f14,	%f6
	fzero	%f16
	subc	%o5,	%g1,	%g2
	prefetch	[%l7 + 0x4C],	 0x0
	bgu	%xcc,	loop_2539
	std	%f14,	[%l7 + 0x10]
	srax	%l2,	0x1A,	%o7
	be,a	%xcc,	loop_2540
loop_2539:
	fmovse	%xcc,	%f26,	%f10
	fbo,a	%fcc3,	loop_2541
	bgu,pt	%xcc,	loop_2542
loop_2540:
	movvc	%icc,	%l6,	%i4
	nop
	setx	loop_2543,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2541:
	nop
	setx	0x707FDCA5,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
loop_2542:
	nop
	set	0x58, %g6
	prefetcha	[%l7 + %g6] 0x19,	 0x1
loop_2543:
	movge	%xcc,	%o1,	%l1
	tcc	%xcc,	0x2
	fpsub32s	%f5,	%f31,	%f31
	fnot1s	%f10,	%f21
	popc	%o6,	%g7
	xnor	%g3,	0x19A2,	%i7
	fmovrslz	%o2,	%f9,	%f23
	umul	%i0,	0x1953,	%o0
	movn	%xcc,	%g5,	%l3
	fsrc2	%f22,	%f30
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i1
	nop
	setx loop_2544, %l0, %l1
	jmpl %l1, %o3
	addc	%g6,	0x18A4,	%l4
	movcs	%xcc,	%g4,	%l0
	be,pn	%xcc,	loop_2545
loop_2544:
	bleu,a,pn	%xcc,	loop_2546
	edge8l	%l5,	%i5,	%i6
	fble,a	%fcc0,	loop_2547
loop_2545:
	edge32ln	%o4,	%g1,	%o5
loop_2546:
	fbl	%fcc3,	loop_2548
	edge8	%g2,	%l2,	%l6
loop_2547:
	ldd	[%l7 + 0x40],	%f16
	smul	%o7,	%i4,	%o1
loop_2548:
	movl	%xcc,	%l1,	%i3
	movge	%xcc,	%o6,	%g3
	xorcc	%i7,	0x1032,	%g7
	srax	%o2,	0x16,	%i0
	fxor	%f10,	%f4,	%f26
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x1e
	membar	#Sync
	sll	%o0,	%l3,	%g5
	xnor	%i2,	%i1,	%o3
	alignaddrl	%g6,	%g4,	%l4
	fpsub16	%f8,	%f12,	%f22
	sra	%l0,	%i5,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l5,	%o4,	%g1
	stbar
	nop
	setx	0x8E6906D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xED84CB7D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f17,	%f17
	fble	%fcc2,	loop_2549
	sll	%o5,	0x04,	%l2
	fbn	%fcc0,	loop_2550
	ba,pt	%icc,	loop_2551
loop_2549:
	fmovdcs	%xcc,	%f14,	%f19
	tle	%xcc,	0x7
loop_2550:
	fornot1s	%f1,	%f22,	%f7
loop_2551:
	ldsb	[%l7 + 0x23],	%g2
	nop
	setx	0xA308FB67,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f5
	nop
	setx	loop_2552,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%o7,	0x1CE7,	%l6
	umulcc	%o1,	0x002D,	%i4
	taddcc	%l1,	0x113C,	%i3
loop_2552:
	edge32ln	%g3,	%i7,	%o6
	fxnor	%f20,	%f4,	%f0
	umul	%o2,	0x05B0,	%g7
	fble,a	%fcc2,	loop_2553
	fpsub32	%f20,	%f8,	%f14
	fmovsneg	%icc,	%f10,	%f13
	bvs,a,pn	%icc,	loop_2554
loop_2553:
	edge32n	%i0,	%o0,	%g5
	udiv	%l3,	0x1A8C,	%i1
	movvs	%icc,	%i2,	%g6
loop_2554:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc1,	loop_2555
	taddcctv	%o3,	0x0903,	%g4
	set	0x1C, %i0
	lduha	[%l7 + %i0] 0x81,	%l4
loop_2555:
	sub	%i5,	0x1E41,	%l0
	xnorcc	%i6,	%l5,	%o4
	umulcc	%o5,	%l2,	%g2
	movvc	%xcc,	%o7,	%l6
	andcc	%o1,	0x1D8A,	%i4
	tl	%icc,	0x0
	wr	%g0,	0x88,	%asi
	sta	%f27,	[%l7 + 0x74] %asi
	ldsb	[%l7 + 0x6D],	%g1
	fsrc1	%f2,	%f2
	nop
	setx	0xF06A87D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	tvc	%icc,	0x1
	bneg,pt	%xcc,	loop_2556
	sdivcc	%i3,	0x0C83,	%l1
	ldd	[%l7 + 0x10],	%f22
	fpsub32	%f22,	%f2,	%f18
loop_2556:
	movl	%xcc,	%g3,	%i7
	bpos,pn	%xcc,	loop_2557
	fmovrslz	%o2,	%f27,	%f11
	st	%f0,	[%l7 + 0x30]
	sll	%g7,	0x12,	%i0
loop_2557:
	movn	%xcc,	%o0,	%o6
	ldstub	[%l7 + 0x45],	%l3
	nop
	setx	0xE108C0678045A593,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	movge	%xcc,	%g5,	%i1
	fbg	%fcc2,	loop_2558
	nop
	fitos	%f12,	%f15
	fstoi	%f15,	%f31
	brlez,a	%g6,	loop_2559
	sll	%i2,	%o3,	%g4
loop_2558:
	nop
	set	0x3A, %o0
	lduh	[%l7 + %o0],	%i5
	fble,a	%fcc3,	loop_2560
loop_2559:
	alignaddr	%l0,	%l4,	%l5
	fnegd	%f10,	%f20
	bge	%icc,	loop_2561
loop_2560:
	sra	%o4,	%i6,	%o5
	tn	%xcc,	0x4
	fnand	%f6,	%f28,	%f6
loop_2561:
	stw	%g2,	[%l7 + 0x3C]
	edge32ln	%o7,	%l2,	%l6
	bcc,a	loop_2562
	movre	%i4,	0x041,	%o1
	fabss	%f30,	%f8
	tvs	%icc,	0x7
loop_2562:
	addcc	%i3,	%l1,	%g1
	edge16l	%g3,	%o2,	%i7
	edge16ln	%i0,	%o0,	%o6
	nop
	set	0x24, %l5
	ldsw	[%l7 + %l5],	%g7
	movle	%xcc,	%g5,	%i1
	edge16n	%l3,	%i2,	%g6
	ldx	[%l7 + 0x58],	%g4
	edge32	%o3,	%i5,	%l0
	movle	%icc,	%l5,	%o4
	nop
	setx	0xCFA00D32,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x52D091DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f1,	%f24
	smul	%l4,	0x018D,	%o5
	subc	%g2,	0x1F48,	%o7
	fbul,a	%fcc3,	loop_2563
	fmuld8ulx16	%f5,	%f2,	%f2
	fmovdvs	%xcc,	%f26,	%f17
	tg	%icc,	0x5
loop_2563:
	array16	%l2,	%l6,	%i6
	edge16n	%o1,	%i3,	%l1
	udiv	%i4,	0x0192,	%g3
	bpos	%icc,	loop_2564
	brnz,a	%g1,	loop_2565
	ldsh	[%l7 + 0x3E],	%i7
	tne	%icc,	0x7
loop_2564:
	fmovdle	%xcc,	%f28,	%f16
loop_2565:
	movg	%xcc,	%o2,	%i0
	srax	%o6,	0x1B,	%o0
	fmovdge	%icc,	%f16,	%f0
	fcmpgt16	%f0,	%f24,	%g7
	alignaddr	%i1,	%l3,	%g5
	membar	0x37
	fbue,a	%fcc0,	loop_2566
	fors	%f21,	%f14,	%f18
	movn	%icc,	%g6,	%i2
	nop
	setx loop_2567, %l0, %l1
	jmpl %l1, %o3
loop_2566:
	tne	%icc,	0x7
	fcmpeq32	%f18,	%f12,	%i5
	fnand	%f2,	%f30,	%f28
loop_2567:
	tleu	%icc,	0x5
	fcmpne32	%f8,	%f26,	%l0
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f8
	alignaddrl	%l5,	%o4,	%l4
	edge8l	%o5,	%g2,	%g4
	fbge	%fcc3,	loop_2568
	tleu	%xcc,	0x5
	nop
	setx	0xF06A256B,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	ld	[%l7 + 0x2C],	%f12
loop_2568:
	fcmple32	%f18,	%f10,	%o7
	movg	%icc,	%l2,	%l6
	set	0x34, %g5
	ldswa	[%l7 + %g5] 0x80,	%i6
	srax	%i3,	%l1,	%i4
	fbu	%fcc3,	loop_2569
	edge32l	%g3,	%o1,	%g1
	edge8ln	%i7,	%o2,	%i0
	edge16	%o6,	%o0,	%i1
loop_2569:
	nop
	fitod	%f1,	%f10
	set	0x6E, %o7
	lduha	[%l7 + %o7] 0x88,	%l3
	fbue,a	%fcc2,	loop_2570
	movle	%icc,	%g7,	%g6
	tleu	%xcc,	0x7
	bpos	%icc,	loop_2571
loop_2570:
	subcc	%i2,	%o3,	%i5
	fandnot1s	%f0,	%f9,	%f17
	nop
	setx	0x7D7E333E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xBE24F6F9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f23,	%f4
loop_2571:
	move	%xcc,	%l0,	%g5
	tcs	%xcc,	0x0
	tle	%xcc,	0x2
	addccc	%l5,	%l4,	%o4
	mulscc	%g2,	0x02AD,	%o5
	nop
	setx	0x12FFD99F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xD374915F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f30,	%f21
	edge8n	%g4,	%l2,	%l6
	fbue	%fcc3,	loop_2572
	xorcc	%o7,	0x0A87,	%i3
	ldd	[%l7 + 0x18],	%f8
	movvc	%icc,	%l1,	%i6
loop_2572:
	bneg,a,pn	%xcc,	loop_2573
	addcc	%i4,	%o1,	%g3
	brz,a	%g1,	loop_2574
	fbug,a	%fcc2,	loop_2575
loop_2573:
	srl	%i7,	0x1F,	%i0
	mova	%icc,	%o6,	%o0
loop_2574:
	fmovsneg	%icc,	%f31,	%f21
loop_2575:
	brz,a	%o2,	loop_2576
	lduw	[%l7 + 0x6C],	%l3
	xnor	%g7,	%g6,	%i1
	movrgez	%i2,	%o3,	%l0
loop_2576:
	fcmple16	%f0,	%f18,	%g5
	movrne	%l5,	0x1CF,	%l4
	tn	%icc,	0x4
	bleu,a,pn	%icc,	loop_2577
	tn	%icc,	0x6
	subccc	%i5,	0x0E65,	%o4
	xor	%g2,	%g4,	%l2
loop_2577:
	fmovdvs	%icc,	%f19,	%f13
	tneg	%icc,	0x6
	movrlez	%l6,	0x37F,	%o5
	fble,a	%fcc2,	loop_2578
	ld	[%l7 + 0x30],	%f1
	movvs	%icc,	%i3,	%l1
	sra	%o7,	%i4,	%i6
loop_2578:
	tvc	%icc,	0x7
	edge32n	%g3,	%o1,	%g1
	sllx	%i0,	%o6,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o2,	0x095E,	%i7
	andn	%g7,	%g6,	%i1
	movg	%xcc,	%i2,	%o3
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x18] %asi,	%l3
	array32	%l0,	%g5,	%l4
	fandnot1	%f8,	%f12,	%f18
	sll	%l5,	0x1C,	%o4
	sub	%i5,	0x133F,	%g4
	movrgez	%l2,	%l6,	%o5
	add	%i3,	%l1,	%o7
	nop
	fitod	%f8,	%f4
	fdtoi	%f4,	%f22
	prefetch	[%l7 + 0x54],	 0x2
	std	%f4,	[%l7 + 0x58]
	umulcc	%g2,	%i6,	%i4
	xnor	%g3,	0x0D1B,	%o1
	movcc	%xcc,	%i0,	%g1
	fbn	%fcc3,	loop_2579
	fmovdvs	%xcc,	%f27,	%f26
	movvc	%icc,	%o0,	%o2
	bshuffle	%f10,	%f16,	%f6
loop_2579:
	fors	%f27,	%f29,	%f19
	set	0x68, %o6
	prefetcha	[%l7 + %o6] 0x89,	 0x0
	taddcc	%g7,	0x1B0C,	%i7
	movne	%icc,	%g6,	%i1
	movl	%icc,	%o3,	%i2
	nop
	setx	loop_2580,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitos	%f9,	%f15
	fstox	%f15,	%f2
	orn	%l0,	%g5,	%l3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%l4
loop_2580:
	srax	%l5,	0x0E,	%i5
	xorcc	%o4,	%l2,	%g4
	sir	0x09B5
	edge32l	%o5,	%l6,	%i3
	edge8	%l1,	%g2,	%o7
	edge16n	%i4,	%g3,	%i6
	andcc	%i0,	0x0934,	%g1
	ta	%icc,	0x4
	smulcc	%o1,	0x01DE,	%o2
	sdivcc	%o0,	0x046F,	%o6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i7,	%g7
	array32	%i1,	%o3,	%g6
	movg	%xcc,	%l0,	%g5
	fandnot2s	%f18,	%f15,	%f2
	fpackfix	%f24,	%f27
	taddcctv	%i2,	%l3,	%l4
	array8	%l5,	%i5,	%l2
	sllx	%o4,	0x16,	%g4
	nop
	setx	0x607E1F7A,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	edge16	%o5,	%i3,	%l1
	umul	%l6,	%g2,	%i4
	pdist	%f0,	%f20,	%f24
	fmovsvs	%xcc,	%f5,	%f19
	pdist	%f2,	%f12,	%f22
	movre	%o7,	0x3FD,	%i6
	movvs	%xcc,	%i0,	%g1
	sdiv	%g3,	0x1DBC,	%o1
	fmovrsne	%o2,	%f28,	%f12
	brgz	%o0,	loop_2581
	tle	%icc,	0x2
	fpsub16	%f24,	%f30,	%f22
	edge8ln	%i7,	%o6,	%i1
loop_2581:
	xnor	%o3,	0x0564,	%g7
	fabsd	%f2,	%f10
	xorcc	%l0,	%g6,	%g5
	tle	%icc,	0x6
	lduh	[%l7 + 0x32],	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l4,	%l5,	%i5
	stbar
	taddcc	%i2,	%o4,	%l2
	mulx	%o5,	0x0A29,	%i3
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l1,	%g4,	%g2
	udivcc	%i4,	0x0894,	%l6
	orncc	%i6,	0x1D91,	%i0
	lduw	[%l7 + 0x74],	%o7
	bshuffle	%f6,	%f26,	%f24
	bneg,pt	%icc,	loop_2582
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%g1,	%f8,	%f2
	flush	%l7 + 0x50
loop_2582:
	edge32	%o1,	%o2,	%o0
	srax	%g3,	0x10,	%i7
	nop
	set	0x34, %l2
	prefetch	[%l7 + %l2],	 0x1
	fmovse	%xcc,	%f29,	%f6
	ldd	[%l7 + 0x20],	%f10
	ldstub	[%l7 + 0x57],	%o6
	movge	%xcc,	%o3,	%i1
	ta	%xcc,	0x4
	movge	%xcc,	%g7,	%g6
	nop
	fitod	%f9,	%f14
	bvs,a	loop_2583
	bg,a	%icc,	loop_2584
	tvc	%xcc,	0x6
	movl	%icc,	%g5,	%l0
loop_2583:
	fsrc2s	%f10,	%f8
loop_2584:
	movvs	%icc,	%l3,	%l5
	fble,a	%fcc2,	loop_2585
	movcc	%icc,	%l4,	%i5
	tne	%xcc,	0x0
	fcmpgt32	%f28,	%f16,	%o4
loop_2585:
	edge16n	%i2,	%l2,	%i3
	subc	%o5,	%l1,	%g4
	tn	%icc,	0x3
	fexpand	%f5,	%f14
	alignaddrl	%i4,	%l6,	%g2
	fbu,a	%fcc3,	loop_2586
	fmovrdlez	%i6,	%f6,	%f24
	fpack32	%f28,	%f16,	%f4
	fmovdleu	%icc,	%f25,	%f5
loop_2586:
	subcc	%o7,	0x1AE8,	%i0
	fmovsleu	%icc,	%f8,	%f6
	bleu,pn	%icc,	loop_2587
	array8	%g1,	%o2,	%o1
	fbl,a	%fcc3,	loop_2588
	movvc	%xcc,	%g3,	%o0
loop_2587:
	addcc	%i7,	%o6,	%i1
	te	%icc,	0x2
loop_2588:
	stx	%o3,	[%l7 + 0x18]
	movrne	%g6,	%g7,	%g5
	nop
	setx	loop_2589,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	%l3,	%l0
	faligndata	%f16,	%f4,	%f28
	sethi	0x023D,	%l5
loop_2589:
	move	%icc,	%i5,	%o4
	fmovrde	%i2,	%f2,	%f2
	set	0x68, %l3
	stxa	%l4,	[%l7 + %l3] 0x2f
	membar	#Sync
	fnor	%f8,	%f26,	%f22
	edge32ln	%i3,	%l2,	%o5
	movpos	%icc,	%g4,	%i4
	bl,a	loop_2590
	fmovrdne	%l6,	%f6,	%f22
	array8	%g2,	%l1,	%o7
	movgu	%icc,	%i6,	%i0
loop_2590:
	addcc	%o2,	%o1,	%g3
	fmovrdlez	%o0,	%f24,	%f0
	nop
	setx	0xED69A321DDF955B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xDF0537B20EAD6CC5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f16,	%f30
	fsrc1	%f12,	%f22
	tcs	%icc,	0x6
	brgz	%g1,	loop_2591
	nop
	setx	0x3CEBF804E06ABC61,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	smulcc	%o6,	0x084C,	%i7
	fmovdleu	%xcc,	%f6,	%f22
loop_2591:
	fmovrdlz	%o3,	%f30,	%f10
	movn	%icc,	%i1,	%g7
	tne	%xcc,	0x1
	nop
	set	0x40, %g2
	stw	%g6,	[%l7 + %g2]
	fbge,a	%fcc1,	loop_2592
	fbne,a	%fcc3,	loop_2593
	umul	%g5,	0x0DC1,	%l0
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x04
loop_2592:
	xnor	%l5,	0x0EEE,	%i5
loop_2593:
	brlz,a	%o4,	loop_2594
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x1
	mulx	%i2,	0x093E,	%l3
loop_2594:
	and	%l4,	0x0A89,	%i3
	tn	%icc,	0x6
	xnor	%l2,	%o5,	%g4
	tsubcctv	%i4,	0x1353,	%l6
	bg,pt	%icc,	loop_2595
	srax	%g2,	%l1,	%o7
	tvc	%icc,	0x7
	brgez	%i6,	loop_2596
loop_2595:
	sethi	0x1920,	%i0
	add	%o1,	%o2,	%o0
	fmovrsgz	%g3,	%f17,	%f12
loop_2596:
	edge16ln	%g1,	%o6,	%o3
	fble,a	%fcc3,	loop_2597
	xnorcc	%i7,	0x1DC7,	%i1
	umul	%g7,	0x0572,	%g6
	edge8n	%g5,	%l0,	%i5
loop_2597:
	nop
	setx	0xD0427825,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	smulcc	%l5,	0x0E9B,	%o4
	bgu,pn	%xcc,	loop_2598
	call	loop_2599
	subccc	%i2,	0x1A90,	%l4
	stw	%i3,	[%l7 + 0x5C]
loop_2598:
	taddcctv	%l2,	%l3,	%o5
loop_2599:
	fmovsneg	%xcc,	%f16,	%f0
	set	0x59, %g4
	lduba	[%l7 + %g4] 0x10,	%i4
	te	%xcc,	0x7
	andncc	%l6,	%g4,	%l1
	fmovdle	%xcc,	%f21,	%f13
	ldub	[%l7 + 0x2C],	%o7
	fbug	%fcc0,	loop_2600
	subc	%g2,	%i6,	%o1
	popc	%i0,	%o2
	andn	%g3,	0x046A,	%g1
loop_2600:
	orn	%o6,	0x1CDB,	%o0
	fmuld8ulx16	%f11,	%f26,	%f2
	fpsub32	%f28,	%f0,	%f26
	alignaddr	%o3,	%i7,	%g7
	mulscc	%g6,	%i1,	%l0
	subccc	%i5,	%g5,	%o4
	nop
	setx	0xA49D1941F56E2EDD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB77B8B6E5A44C0A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f18,	%f8
	fnor	%f28,	%f14,	%f6
	nop
	fitos	%f16,	%f6
	fbu,a	%fcc3,	loop_2601
	fbl	%fcc3,	loop_2602
	edge16ln	%l5,	%i2,	%l4
	fmovspos	%xcc,	%f31,	%f0
loop_2601:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%i3
loop_2602:
	and	%l2,	%l3,	%i4
	tgu	%xcc,	0x7
	array32	%l6,	%o5,	%l1
	bvs	loop_2603
	orn	%o7,	%g2,	%g4
	subcc	%o1,	0x1567,	%i6
	movge	%xcc,	%i0,	%o2
loop_2603:
	sll	%g3,	0x13,	%o6
	tcc	%xcc,	0x0
	edge16l	%g1,	%o3,	%i7
	mulx	%g7,	%g6,	%i1
	wr	%g0,	0x89,	%asi
	stxa	%l0,	[%l7 + 0x58] %asi
	tvs	%xcc,	0x3
	nop
	set	0x70, %o2
	ldsh	[%l7 + %o2],	%o0
	addccc	%g5,	0x0133,	%o4
	movgu	%xcc,	%l5,	%i2
	sdivcc	%l4,	0x146C,	%i5
	edge16l	%l2,	%l3,	%i4
	or	%l6,	0x13B4,	%i3
	bl,a	loop_2604
	movrgez	%o5,	%o7,	%l1
	fpadd16	%f6,	%f28,	%f2
	tvs	%icc,	0x3
loop_2604:
	nop
	fitos	%f5,	%f22
	fstox	%f22,	%f10
	orn	%g4,	%g2,	%o1
	sdiv	%i6,	0x064E,	%i0
	umulcc	%g3,	%o2,	%o6
	edge16ln	%o3,	%i7,	%g1
	fcmpne16	%f14,	%f24,	%g7
	brnz,a	%i1,	loop_2605
	stw	%g6,	[%l7 + 0x64]
	sir	0x1B7C
	be,pt	%icc,	loop_2606
loop_2605:
	edge16n	%l0,	%o0,	%o4
	brgz,a	%g5,	loop_2607
	srax	%l5,	%l4,	%i2
loop_2606:
	fmul8x16au	%f4,	%f18,	%f20
	movrgz	%i5,	0x1BC,	%l2
loop_2607:
	fors	%f2,	%f15,	%f19
	set	0x6C, %o3
	ldsha	[%l7 + %o3] 0x04,	%l3
	tleu	%icc,	0x6
	fornot2s	%f8,	%f30,	%f31
	move	%icc,	%i4,	%i3
	tpos	%xcc,	0x0
	edge8l	%l6,	%o5,	%o7
	edge8l	%g4,	%g2,	%o1
	tvc	%icc,	0x1
	fmovrslez	%l1,	%f4,	%f15
	fbule	%fcc0,	loop_2608
	fbu	%fcc2,	loop_2609
	movrgz	%i0,	0x0F1,	%i6
	subcc	%g3,	%o6,	%o3
loop_2608:
	nop
	setx	loop_2610,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2609:
	fsrc2s	%f3,	%f25
	fmovsl	%xcc,	%f9,	%f22
	movcs	%xcc,	%i7,	%g1
loop_2610:
	edge8l	%g7,	%o2,	%g6
	sdiv	%l0,	0x0C84,	%o0
	fpadd32s	%f6,	%f25,	%f3
	nop
	setx	loop_2611,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%xcc,	%o4,	%i1
	set	0x40, %l6
	lda	[%l7 + %l6] 0x19,	%f11
loop_2611:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f12,	[%l7 + 0x44] %asi
	sdiv	%g5,	0x0D7C,	%l5
	fmovrslz	%i2,	%f7,	%f20
	tleu	%icc,	0x4
	movrgez	%l4,	%l2,	%l3
	udivcc	%i5,	0x04F7,	%i3
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x7A] %asi,	%l6
	udivx	%o5,	0x1402,	%i4
	edge16l	%g4,	%g2,	%o7
	edge8	%l1,	%i0,	%i6
	tsubcctv	%g3,	0x1F1F,	%o6
	flush	%l7 + 0x30
	or	%o1,	%i7,	%o3
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%g1
	edge16n	%g7,	%o2,	%l0
	lduh	[%l7 + 0x5C],	%o0
	fmovrsgz	%g6,	%f2,	%f1
	fornot1s	%f24,	%f30,	%f23
	addc	%o4,	%g5,	%l5
	movg	%xcc,	%i1,	%i2
	movleu	%xcc,	%l2,	%l4
	bcc,a,pn	%icc,	loop_2612
	brgz,a	%l3,	loop_2613
	ba,a,pn	%icc,	loop_2614
	movle	%icc,	%i3,	%l6
loop_2612:
	addccc	%o5,	%i5,	%g4
loop_2613:
	brgez,a	%g2,	loop_2615
loop_2614:
	movl	%icc,	%o7,	%l1
	movge	%xcc,	%i4,	%i6
	fba,a	%fcc1,	loop_2616
loop_2615:
	nop
	setx	0x5AC0042CE06B2BFD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	movg	%icc,	%g3,	%i0
	fmovsle	%icc,	%f30,	%f0
loop_2616:
	fnand	%f10,	%f0,	%f6
	sdivx	%o1,	0x1574,	%o6
	bne	%xcc,	loop_2617
	movge	%xcc,	%i7,	%g1
	tg	%icc,	0x5
	subcc	%g7,	0x01A9,	%o3
loop_2617:
	brnz	%o2,	loop_2618
	tle	%icc,	0x7
	movcs	%xcc,	%o0,	%g6
	tle	%xcc,	0x1
loop_2618:
	edge16	%o4,	%g5,	%l5
	mova	%icc,	%l0,	%i2
	sir	0x1583
	fmuld8sux16	%f11,	%f14,	%f26
	set	0x50, %i4
	lda	[%l7 + %i4] 0x04,	%f7
	mova	%icc,	%i1,	%l4
	subc	%l3,	0x0B75,	%l2
	fba,a	%fcc2,	loop_2619
	movcc	%icc,	%l6,	%i3
	nop
	setx	0x8280E5E61AB16345,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2B19C0B309BEA66F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f6
	xnorcc	%i5,	0x1BF7,	%o5
loop_2619:
	edge32l	%g2,	%g4,	%o7
	movvs	%icc,	%i4,	%l1
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x3C] %asi,	%i6
	srl	%i0,	0x1C,	%g3
	edge8l	%o6,	%i7,	%g1
	sdiv	%o1,	0x151A,	%o3
	fbe,a	%fcc3,	loop_2620
	movleu	%icc,	%g7,	%o2
	ldub	[%l7 + 0x43],	%g6
	tvs	%icc,	0x6
loop_2620:
	fmovscc	%xcc,	%f0,	%f26
	tpos	%icc,	0x3
	fornot1s	%f4,	%f26,	%f31
	tn	%icc,	0x4
	ldx	[%l7 + 0x08],	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o0,	%g5,	%l5
	fmovdneg	%xcc,	%f26,	%f11
	ldd	[%l7 + 0x48],	%l0
	movle	%icc,	%i2,	%i1
	mova	%icc,	%l3,	%l4
	orcc	%l6,	0x053D,	%i3
	bl,pt	%xcc,	loop_2621
	ta	%icc,	0x7
	fmovdcs	%icc,	%f30,	%f20
	ldub	[%l7 + 0x20],	%i5
loop_2621:
	sllx	%l2,	0x09,	%g2
	alignaddr	%o5,	%o7,	%i4
	tn	%xcc,	0x3
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x37] %asi,	%i6
	bpos,pt	%xcc,	loop_2622
	smul	%g4,	0x1D90,	%i0
	bcs,pt	%xcc,	loop_2623
	stbar
loop_2622:
	edge32ln	%g3,	%o6,	%i7
	movg	%xcc,	%g1,	%o1
loop_2623:
	sir	0x07FB
	brgez,a	%o3,	loop_2624
	fpsub16	%f26,	%f20,	%f8
	edge16l	%o2,	%g7,	%o4
	tle	%xcc,	0x6
loop_2624:
	nop
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	subccc	%g6,	0x14A8,	%o0
	tl	%xcc,	0x3
	tleu	%xcc,	0x2
	xnor	%l5,	%g5,	%i2
	fsrc2	%f8,	%f26
	brlez	%l0,	loop_2625
	andn	%i1,	0x12FD,	%l3
	movpos	%icc,	%l6,	%l4
	add	%i3,	0x0389,	%l2
loop_2625:
	sll	%g2,	%i5,	%o7
	fbn,a	%fcc2,	loop_2626
	tvc	%icc,	0x2
	movrgez	%i4,	%l1,	%i6
	tvc	%xcc,	0x4
loop_2626:
	movcs	%xcc,	%o5,	%g4
	fmovde	%icc,	%f8,	%f18
	fblg,a	%fcc3,	loop_2627
	movrlz	%g3,	%i0,	%i7
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2627:
	sdivcc	%o6,	0x0304,	%o1
	nop
	setx	loop_2628,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%g1,	0x1978,	%o2
	flush	%l7 + 0x40
	alignaddrl	%g7,	%o4,	%o3
loop_2628:
	fpadd32	%f10,	%f24,	%f30
	edge32n	%o0,	%g6,	%g5
	alignaddr	%i2,	%l5,	%i1
	tsubcc	%l3,	0x130E,	%l0
	subccc	%l4,	0x1C60,	%l6
	movrlz	%i3,	%g2,	%l2
	bpos,pn	%xcc,	loop_2629
	fpadd32s	%f6,	%f15,	%f24
	for	%f10,	%f30,	%f26
	edge16ln	%i5,	%i4,	%o7
loop_2629:
	fble,a	%fcc3,	loop_2630
	movleu	%xcc,	%i6,	%l1
	fmul8ulx16	%f18,	%f28,	%f14
	subcc	%o5,	0x0767,	%g3
loop_2630:
	fpackfix	%f10,	%f9
	fmovsl	%icc,	%f17,	%f9
	addc	%g4,	%i7,	%o6
	sdivx	%i0,	0x1C5F,	%g1
	fbue	%fcc3,	loop_2631
	andn	%o1,	%o2,	%o4
	tpos	%icc,	0x7
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%o3
loop_2631:
	edge16n	%o0,	%g7,	%g5
	bge,a,pn	%xcc,	loop_2632
	swap	[%l7 + 0x68],	%g6
	addcc	%l5,	%i2,	%i1
	srax	%l0,	0x16,	%l4
loop_2632:
	tleu	%icc,	0x0
	ble	%icc,	loop_2633
	fxor	%f12,	%f20,	%f8
	xnor	%l3,	0x0C80,	%i3
	fmovspos	%icc,	%f15,	%f12
loop_2633:
	fmul8x16	%f8,	%f8,	%f6
	movge	%icc,	%g2,	%l6
	ble,a,pt	%xcc,	loop_2634
	fsrc1s	%f27,	%f5
	tleu	%icc,	0x6
	bleu,a	loop_2635
loop_2634:
	movvs	%xcc,	%i5,	%l2
	brlz,a	%i4,	loop_2636
	addccc	%i6,	0x0C3C,	%o7
loop_2635:
	srax	%o5,	%g3,	%g4
	xnorcc	%i7,	0x18BF,	%o6
loop_2636:
	fmovdle	%icc,	%f2,	%f25
	srlx	%i0,	0x0C,	%g1
	tle	%icc,	0x1
	add	%o1,	0x0A5D,	%o2
	umulcc	%l1,	%o3,	%o4
	tsubcctv	%o0,	0x1BA2,	%g7
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x50] %asi,	%g5
	subcc	%g6,	0x0DF8,	%l5
	udivcc	%i1,	0x07E9,	%l0
	or	%i2,	0x155E,	%l4
	alignaddrl	%i3,	%g2,	%l6
	fsrc1s	%f16,	%f1
	tne	%xcc,	0x5
	sethi	0x189E,	%l3
	smulcc	%i5,	0x0DB2,	%i4
	subcc	%i6,	0x12C9,	%o7
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f28
	edge16ln	%l2,	%o5,	%g4
	be	loop_2637
	fmovrsgz	%g3,	%f3,	%f14
	udivcc	%o6,	0x1102,	%i0
	fnegs	%f6,	%f0
loop_2637:
	sdivcc	%g1,	0x1EEC,	%i7
	edge16	%o2,	%l1,	%o3
	alignaddr	%o1,	%o0,	%o4
	nop
	setx	0xF8DBC575,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xBE15F268,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f6,	%f11
	xorcc	%g5,	%g6,	%g7
	move	%xcc,	%l5,	%l0
	edge32ln	%i1,	%i2,	%l4
	movpos	%icc,	%g2,	%i3
	set	0x3C, %l4
	lduha	[%l7 + %l4] 0x15,	%l3
	movg	%xcc,	%l6,	%i5
	movl	%icc,	%i4,	%o7
	set	0x14, %o4
	ldswa	[%l7 + %o4] 0x81,	%l2
	fpmerge	%f14,	%f21,	%f2
	movne	%icc,	%o5,	%i6
	xnor	%g3,	%g4,	%i0
	edge32ln	%o6,	%i7,	%g1
	tneg	%xcc,	0x6
	set	0x0E, %l1
	lduha	[%l7 + %l1] 0x11,	%l1
	add	%o3,	0x1EB5,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x3
	addc	%o2,	%o0,	%g5
	andn	%o4,	%g6,	%g7
	fmovdl	%icc,	%f6,	%f20
	ld	[%l7 + 0x40],	%f6
	movleu	%xcc,	%l5,	%i1
	sub	%l0,	0x1C9B,	%i2
	mulscc	%g2,	%i3,	%l3
	addcc	%l6,	0x1281,	%i5
	st	%f29,	[%l7 + 0x08]
	fxors	%f14,	%f23,	%f25
	movrgz	%i4,	0x12D,	%o7
	nop
	set	0x70, %g1
	std	%f30,	[%l7 + %g1]
	bgu,pn	%icc,	loop_2638
	fmovsvs	%xcc,	%f26,	%f12
	udivx	%l4,	0x1DC0,	%l2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x70] %asi,	%o5
loop_2638:
	taddcc	%g3,	0x15A7,	%i6
	edge16ln	%g4,	%o6,	%i7
	fmovs	%f25,	%f20
	fmovsn	%xcc,	%f7,	%f30
	add	%g1,	0x00D4,	%l1
	edge16	%o3,	%i0,	%o1
	set	0x78, %o5
	stwa	%o0,	[%l7 + %o5] 0x80
	edge16ln	%g5,	%o4,	%o2
	movneg	%icc,	%g7,	%g6
	fpsub32	%f8,	%f22,	%f12
	bneg,pt	%icc,	loop_2639
	sdiv	%i1,	0x042F,	%l0
	tpos	%xcc,	0x3
	udivcc	%l5,	0x0B06,	%i2
loop_2639:
	udivx	%g2,	0x0F58,	%i3
	bcc,pt	%icc,	loop_2640
	tcc	%xcc,	0x2
	edge32l	%l3,	%l6,	%i5
	movne	%xcc,	%o7,	%i4
loop_2640:
	fbg	%fcc2,	loop_2641
	fmovrdgez	%l2,	%f18,	%f20
	fba,a	%fcc0,	loop_2642
	brlez	%l4,	loop_2643
loop_2641:
	prefetch	[%l7 + 0x3C],	 0x2
	fsrc1s	%f9,	%f24
loop_2642:
	fmovsne	%icc,	%f31,	%f2
loop_2643:
	ldsw	[%l7 + 0x68],	%g3
	edge16l	%i6,	%g4,	%o5
	tcs	%xcc,	0x5
	membar	0x72
	nop
	setx	0xB1576AA8B70CCA55,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xE66CD207F2FFE3DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f26,	%f18
	lduh	[%l7 + 0x30],	%i7
	movge	%xcc,	%g1,	%l1
	sra	%o3,	0x0D,	%o6
	std	%f30,	[%l7 + 0x20]
	movrlez	%o1,	%i0,	%g5
	edge16l	%o4,	%o0,	%g7
	nop
	set	0x40, %i7
	ldx	[%l7 + %i7],	%g6
	srlx	%i1,	%l0,	%o2
	move	%xcc,	%l5,	%g2
	movcs	%xcc,	%i2,	%i3
	wr	%g0,	0x88,	%asi
	stxa	%l3,	[%l7 + 0x78] %asi
	sethi	0x053D,	%i5
	fornot1s	%f7,	%f24,	%f28
	bvc,a,pn	%icc,	loop_2644
	tpos	%icc,	0x1
	set	0x210, %i5
	stxa	%l6,	[%g0 + %i5] 0x52
loop_2644:
	srl	%o7,	0x11,	%l2
	fmovrsgz	%l4,	%f19,	%f21
	movrgez	%i4,	%i6,	%g3
	swap	[%l7 + 0x28],	%o5
	call	loop_2645
	sdivcc	%i7,	0x13FF,	%g4
	nop
	setx	0x1032913F51C9EFD4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xA94C6269E6CBC357,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f10,	%f2
	faligndata	%f22,	%f0,	%f30
loop_2645:
	nop
	setx	0xA3FBAAD2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x5C52C5D5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f0,	%f11
	edge8	%l1,	%g1,	%o3
	fxnor	%f14,	%f0,	%f24
	movpos	%icc,	%o6,	%o1
	movle	%xcc,	%i0,	%o4
	bvs,a,pt	%xcc,	loop_2646
	fble	%fcc0,	loop_2647
	fmovse	%xcc,	%f1,	%f24
	edge32ln	%g5,	%o0,	%g6
loop_2646:
	fornot1	%f24,	%f22,	%f0
loop_2647:
	sdivx	%g7,	0x11A4,	%l0
	set	0x12, %o1
	lduha	[%l7 + %o1] 0x88,	%o2
	movgu	%xcc,	%i1,	%g2
	sra	%l5,	0x14,	%i2
	subccc	%l3,	0x1D42,	%i5
	andcc	%i3,	%o7,	%l6
	tl	%xcc,	0x6
	fpmerge	%f12,	%f18,	%f24
	umul	%l4,	0x1279,	%i4
	bpos	%icc,	loop_2648
	fbug	%fcc0,	loop_2649
	sir	0x0B0A
	udiv	%i6,	0x1642,	%g3
loop_2648:
	srlx	%o5,	%l2,	%g4
loop_2649:
	orn	%i7,	%g1,	%o3
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l1
	fbl	%fcc1,	loop_2650
	subcc	%o6,	%o1,	%o4
	addccc	%g5,	0x1C43,	%o0
	fmovdpos	%icc,	%f29,	%f5
loop_2650:
	mova	%icc,	%i0,	%g7
	edge32	%l0,	%g6,	%i1
	fors	%f8,	%f10,	%f5
	movle	%icc,	%o2,	%l5
	array32	%g2,	%i2,	%l3
	tl	%icc,	0x2
	set	0x3F, %g3
	ldstuba	[%l7 + %g3] 0x04,	%i3
	set	0x40, %g7
	lduwa	[%l7 + %g7] 0x89,	%o7
	bcc,a,pt	%icc,	loop_2651
	subccc	%i5,	%l6,	%l4
	move	%xcc,	%i6,	%i4
	fcmpgt32	%f8,	%f12,	%g3
loop_2651:
	fcmple32	%f28,	%f28,	%l2
	ldd	[%l7 + 0x48],	%g4
	xorcc	%o5,	0x0BFD,	%i7
	fmovrse	%g1,	%f27,	%f8
	fmovs	%f26,	%f23
	fcmpeq32	%f6,	%f0,	%l1
	fnands	%f18,	%f21,	%f10
	fcmple16	%f4,	%f16,	%o3
	tle	%icc,	0x2
	sra	%o6,	0x19,	%o4
	movrgz	%g5,	0x264,	%o1
	xnor	%i0,	%o0,	%l0
	addc	%g6,	%i1,	%o2
	movrlz	%l5,	%g2,	%g7
	fmovdcs	%xcc,	%f29,	%f21
	movrgez	%i2,	0x050,	%l3
	srax	%i3,	0x1D,	%o7
	fmovsge	%icc,	%f23,	%f23
	andncc	%i5,	%l6,	%l4
	orn	%i4,	%g3,	%l2
	fmul8sux16	%f10,	%f22,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g4,	0x117,	%i6
	bvs	%icc,	loop_2652
	taddcc	%i7,	0x0EE5,	%o5
	subc	%l1,	%o3,	%g1
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2652:
	movvs	%xcc,	%o6,	%o4
	brgz,a	%o1,	loop_2653
	and	%g5,	0x1673,	%i0
	fmul8x16	%f25,	%f8,	%f4
	movrgz	%o0,	0x3C5,	%l0
loop_2653:
	edge16ln	%g6,	%o2,	%l5
	wr	%g0,	0x04,	%asi
	stxa	%i1,	[%l7 + 0x68] %asi
	tg	%xcc,	0x6
	bn,a,pn	%icc,	loop_2654
	fcmple16	%f10,	%f30,	%g7
	tcs	%icc,	0x5
	movge	%icc,	%g2,	%i2
loop_2654:
	fmovrslz	%i3,	%f25,	%f10
	movn	%xcc,	%l3,	%i5
	move	%xcc,	%l6,	%o7
	array8	%l4,	%i4,	%g3
	tne	%xcc,	0x4
	nop
	fitos	%f11,	%f18
	fstoi	%f18,	%f12
	fones	%f23
	movrgez	%g4,	%l2,	%i6
	fmovsneg	%icc,	%f18,	%f15
	stx	%i7,	[%l7 + 0x50]
	edge16	%l1,	%o3,	%o5
	ldstub	[%l7 + 0x4E],	%g1
	lduw	[%l7 + 0x70],	%o6
	st	%f14,	[%l7 + 0x78]
	bl,a	%xcc,	loop_2655
	movne	%icc,	%o4,	%o1
	subc	%i0,	%g5,	%l0
	brz,a	%g6,	loop_2656
loop_2655:
	tvc	%icc,	0x4
	ble	%icc,	loop_2657
	ldstub	[%l7 + 0x71],	%o0
loop_2656:
	edge32	%o2,	%i1,	%g7
	fmovdne	%xcc,	%f19,	%f28
loop_2657:
	brlez	%g2,	loop_2658
	movle	%icc,	%l5,	%i2
	wr	%g0,	0x10,	%asi
	sta	%f9,	[%l7 + 0x74] %asi
loop_2658:
	fone	%f30
	movre	%i3,	0x271,	%l3
	tvc	%xcc,	0x1
	lduw	[%l7 + 0x6C],	%l6
	sir	0x0C00
	fmovdg	%xcc,	%f28,	%f6
	tgu	%xcc,	0x3
	nop
	set	0x10, %i3
	stx	%o7,	[%l7 + %i3]
	edge16	%l4,	%i5,	%i4
	tge	%xcc,	0x0
	st	%f20,	[%l7 + 0x64]
	movn	%xcc,	%g3,	%g4
	tge	%xcc,	0x3
	set	0x70, %l0
	ldxa	[%l7 + %l0] 0x80,	%l2
	movrlez	%i6,	%l1,	%o3
	edge16ln	%i7,	%o5,	%o6
	fbu	%fcc1,	loop_2659
	ld	[%l7 + 0x60],	%f12
	stbar
	bne,pn	%icc,	loop_2660
loop_2659:
	edge8	%o4,	%g1,	%i0
	edge8n	%g5,	%o1,	%l0
	movrlz	%o0,	%g6,	%i1
loop_2660:
	fbu,a	%fcc1,	loop_2661
	tg	%icc,	0x4
	orcc	%o2,	0x120F,	%g7
	fbul	%fcc2,	loop_2662
loop_2661:
	tpos	%icc,	0x5
	array8	%g2,	%i2,	%i3
	te	%xcc,	0x2
loop_2662:
	ldsw	[%l7 + 0x68],	%l3
	std	%f2,	[%l7 + 0x78]
	ldd	[%l7 + 0x20],	%i6
	fornot2	%f20,	%f28,	%f6
	fnot1s	%f7,	%f30
	movn	%icc,	%o7,	%l5
	movrgez	%l4,	%i4,	%g3
	fzero	%f14
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x18
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%f10
	wr	%g0,	0xeb,	%asi
	stha	%g4,	[%l7 + 0x10] %asi
	membar	#Sync
	nop
	setx	0xAB1E9CFF135563DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xAC2C0711FA1270A8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f28,	%f24
	nop
	setx	loop_2663,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%icc,	%l2,	%i5
	orcc	%i6,	%o3,	%l1
	nop
	setx	0x60655EF2,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
loop_2663:
	sdiv	%o5,	0x0355,	%i7
	subccc	%o4,	%g1,	%i0
	tl	%xcc,	0x2
	movrne	%g5,	%o1,	%o6
	movrlz	%o0,	0x08B,	%l0
	fpack16	%f4,	%f24
	xnorcc	%g6,	%i1,	%g7
	movrlez	%o2,	0x153,	%i2
	taddcc	%g2,	%l3,	%i3
	popc	%o7,	%l6
	set	0x57, %i0
	lduba	[%l7 + %i0] 0x0c,	%l4
	fmovdge	%icc,	%f14,	%f31
	edge8ln	%i4,	%g3,	%l5
	set	0x20, %o0
	ldswa	[%l7 + %o0] 0x14,	%l2
	fmovdcc	%xcc,	%f21,	%f5
	set	0x14, %l5
	ldswa	[%l7 + %l5] 0x89,	%i5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%g4
	wr	%g0,	0x10,	%asi
	stwa	%o3,	[%l7 + 0x08] %asi
	movneg	%xcc,	%o5,	%i7
	fpadd16	%f26,	%f26,	%f24
	tge	%icc,	0x0
	movvc	%icc,	%l1,	%o4
	fpsub32	%f20,	%f20,	%f30
	xnorcc	%g1,	0x05F0,	%g5
	movpos	%icc,	%i0,	%o1
	brz	%o0,	loop_2664
	nop
	setx	0xC8E979E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xB655B32F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f1,	%f31
	edge8ln	%o6,	%l0,	%g6
	faligndata	%f26,	%f2,	%f12
loop_2664:
	movre	%i1,	0x1BF,	%g7
	edge8ln	%o2,	%g2,	%l3
	edge16ln	%i2,	%i3,	%o7
	movrgz	%l4,	%l6,	%g3
	movleu	%icc,	%i4,	%l2
	fcmpeq32	%f4,	%f10,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i5,	%i6,	%o3
	brnz	%o5,	loop_2665
	fornot1s	%f9,	%f9,	%f0
	sir	0x0EAC
	orcc	%g4,	0x0C82,	%l1
loop_2665:
	tg	%icc,	0x6
	stb	%i7,	[%l7 + 0x63]
	movn	%icc,	%g1,	%g5
	fmovrdne	%i0,	%f26,	%f8
	srl	%o4,	%o1,	%o6
	bvs	%icc,	loop_2666
	edge8ln	%o0,	%g6,	%i1
	sub	%g7,	0x0CB7,	%o2
	ldstub	[%l7 + 0x0B],	%l0
loop_2666:
	array32	%l3,	%i2,	%g2
	fble,a	%fcc1,	loop_2667
	lduw	[%l7 + 0x38],	%i3
	movge	%xcc,	%l4,	%l6
	tpos	%icc,	0x2
loop_2667:
	alignaddr	%o7,	%g3,	%l2
	xor	%l5,	%i4,	%i6
	subcc	%i5,	%o3,	%g4
	alignaddr	%l1,	%i7,	%g1
	orn	%o5,	0x02A5,	%i0
	bshuffle	%f12,	%f22,	%f26
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x78] %asi,	%f14
	set	0x18, %i6
	lda	[%l7 + %i6] 0x80,	%f25
	andn	%o4,	%o1,	%g5
	tle	%icc,	0x7
	edge32	%o6,	%g6,	%i1
	alignaddr	%o0,	%g7,	%l0
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f6
	fxtod	%f6,	%f16
	set	0x40, %o7
	stxa	%l3,	[%l7 + %o7] 0x2a
	membar	#Sync
	brgez	%i2,	loop_2668
	fmovde	%xcc,	%f1,	%f11
	fornot1s	%f8,	%f1,	%f24
	fpmerge	%f13,	%f12,	%f2
loop_2668:
	fcmpne16	%f16,	%f28,	%g2
	fbu	%fcc1,	loop_2669
	sdivx	%i3,	0x0156,	%l4
	fbue	%fcc1,	loop_2670
	nop
	fitos	%f13,	%f6
	fstox	%f6,	%f28
loop_2669:
	tg	%xcc,	0x1
	fmul8x16	%f2,	%f14,	%f26
loop_2670:
	fpadd16s	%f29,	%f6,	%f22
	fbuge,a	%fcc0,	loop_2671
	smulcc	%o2,	0x0F1E,	%o7
	sra	%g3,	0x0B,	%l6
	fbne	%fcc3,	loop_2672
loop_2671:
	tgu	%xcc,	0x7
	te	%icc,	0x5
	srlx	%l2,	%i4,	%i6
loop_2672:
	nop
	set	0x38, %o6
	std	%f12,	[%l7 + %o6]
	udivcc	%l5,	0x146A,	%o3
	smulcc	%g4,	0x0B74,	%l1
	tle	%icc,	0x1
	tsubcctv	%i7,	0x1EA9,	%g1
	alignaddr	%o5,	%i5,	%o4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	tle	%xcc,	0x7
	umul	%g5,	%o6,	%g6
	movge	%xcc,	%i1,	%o0
	fmovdn	%xcc,	%f25,	%f27
	movrlez	%g7,	0x1F7,	%l0
	pdist	%f24,	%f20,	%f26
	fsrc2	%f26,	%f26
	fmovrslez	%l3,	%f25,	%f22
	movvs	%icc,	%i2,	%o1
	fnegs	%f15,	%f18
	andcc	%i3,	%l4,	%g2
	array32	%o7,	%g3,	%l6
	movvc	%xcc,	%o2,	%i4
	fmovdcc	%icc,	%f16,	%f13
	swap	[%l7 + 0x10],	%l2
	movrne	%l5,	0x1D7,	%i6
	tvs	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%g4,	%l1
	fba,a	%fcc3,	loop_2673
	fcmpgt32	%f18,	%f2,	%i7
	wr	%g0,	0x81,	%asi
	stwa	%o3,	[%l7 + 0x50] %asi
loop_2673:
	fpsub32s	%f25,	%f19,	%f19
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x30] %asi,	%g1
	ldsb	[%l7 + 0x19],	%i5
	fmovrde	%o4,	%f24,	%f4
	movge	%icc,	%o5,	%g5
	set	0x18, %g5
	prefetcha	[%l7 + %g5] 0x18,	 0x0
	sethi	0x1B1E,	%o6
	fpsub32s	%f13,	%f29,	%f3
	sra	%i1,	0x00,	%g6
	addc	%g7,	%l0,	%l3
	ta	%icc,	0x4
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x10] %asi,	%i2
	movrgz	%o1,	%i3,	%o0
	fmovdpos	%xcc,	%f6,	%f7
	mulscc	%l4,	0x08E7,	%o7
	array16	%g2,	%l6,	%g3
	flush	%l7 + 0x50
	fcmple16	%f4,	%f6,	%i4
	tneg	%xcc,	0x1
	xor	%o2,	%l2,	%l5
	umulcc	%i6,	0x0CDA,	%l1
	movpos	%icc,	%g4,	%i7
	ldstub	[%l7 + 0x5A],	%o3
	fba,a	%fcc1,	loop_2674
	edge32l	%g1,	%o4,	%o5
	sdivcc	%g5,	0x07F6,	%i0
	orn	%i5,	0x0AD7,	%o6
loop_2674:
	andcc	%i1,	0x0FF2,	%g6
	umulcc	%g7,	%l3,	%i2
	nop
	setx	0xE05CBCB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	fcmpne32	%f26,	%f18,	%o1
	and	%l0,	0x128E,	%i3
	nop
	setx	0xDD38AE0155393F95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8CE1C2ABD5BA6932,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f20,	%f12
	prefetch	[%l7 + 0x34],	 0x0
	fbg	%fcc1,	loop_2675
	ta	%icc,	0x1
	nop
	setx	0x7C0C827574CDF53A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x225557CC459126AC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f12,	%f4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l4
loop_2675:
	edge8	%o7,	%o0,	%g2
	sdiv	%g3,	0x13A4,	%l6
	tleu	%icc,	0x7
	fcmpeq32	%f8,	%f0,	%i4
	wr	%g0,	0x2f,	%asi
	stba	%l2,	[%l7 + 0x19] %asi
	membar	#Sync
	edge16l	%l5,	%o2,	%l1
	fmovrdlz	%g4,	%f24,	%f30
	tvs	%xcc,	0x5
	movl	%xcc,	%i7,	%o3
	edge8l	%i6,	%o4,	%o5
	sllx	%g5,	0x05,	%i0
	tcs	%icc,	0x7
	edge16	%g1,	%o6,	%i5
	taddcctv	%i1,	0x194E,	%g6
	sth	%l3,	[%l7 + 0x4C]
	set	0x2A, %l2
	lduba	[%l7 + %l2] 0x0c,	%g7
	fmovdne	%icc,	%f17,	%f19
	xnorcc	%o1,	0x1AF4,	%i2
	fpack32	%f20,	%f10,	%f24
	flush	%l7 + 0x5C
	edge32	%i3,	%l0,	%o7
	ldsw	[%l7 + 0x24],	%l4
	tgu	%xcc,	0x5
	edge8l	%g2,	%o0,	%l6
	srlx	%i4,	%l2,	%g3
	fmovdge	%xcc,	%f25,	%f4
	tl	%icc,	0x4
	sdivcc	%l5,	0x1372,	%l1
	sdivx	%g4,	0x0DF4,	%i7
	tpos	%icc,	0x1
	tg	%icc,	0x7
	edge32l	%o2,	%o3,	%i6
	edge16l	%o4,	%g5,	%o5
	edge32ln	%i0,	%g1,	%o6
	fbuge,a	%fcc1,	loop_2676
	udivcc	%i5,	0x177E,	%i1
	fmovscs	%xcc,	%f5,	%f13
	andcc	%g6,	0x0E44,	%l3
loop_2676:
	fmovsvs	%icc,	%f7,	%f11
	bge,a	loop_2677
	lduh	[%l7 + 0x2E],	%g7
	movle	%icc,	%i2,	%o1
	movge	%xcc,	%l0,	%i3
loop_2677:
	nop
	setx	0x8F0468D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x86A41DD3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f3,	%f8
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x58] %asi,	%f1
	fnors	%f18,	%f19,	%f4
	nop
	setx	loop_2678,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdgz	%o7,	%f8,	%f8
	fcmple32	%f10,	%f16,	%l4
	stw	%g2,	[%l7 + 0x0C]
loop_2678:
	edge8ln	%l6,	%o0,	%l2
	subcc	%i4,	0x1B5D,	%g3
	bl,pt	%icc,	loop_2679
	taddcc	%l1,	%l5,	%i7
	nop
	setx	0xE873D85A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xF5A949D9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f27,	%f26
	brgz	%o2,	loop_2680
loop_2679:
	nop
	setx	0xD67191611C4A73BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xD373AFED2D220239,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f18,	%f14
	mulx	%o3,	%i6,	%g4
	movcs	%icc,	%o4,	%g5
loop_2680:
	mulscc	%i0,	0x0203,	%o5
	sir	0x1B56
	movle	%xcc,	%o6,	%i5
	and	%g1,	%i1,	%g6
	or	%g7,	0x02C7,	%l3
	ldub	[%l7 + 0x7F],	%i2
	fcmpgt32	%f22,	%f16,	%l0
	nop
	setx	0x4B1A30B0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f7
	movvs	%icc,	%i3,	%o7
	ldd	[%l7 + 0x50],	%f2
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f30
	fxtod	%f30,	%f6
	bg,a	%xcc,	loop_2681
	movrgz	%o1,	%g2,	%l4
	movvs	%xcc,	%l6,	%o0
	subcc	%i4,	%g3,	%l2
loop_2681:
	movle	%icc,	%l1,	%l5
	fmovdne	%icc,	%f24,	%f3
	fbl,a	%fcc0,	loop_2682
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f23,	%f29
	addccc	%i7,	0x0239,	%o3
loop_2682:
	movneg	%xcc,	%i6,	%o2
	brlz	%o4,	loop_2683
	smulcc	%g4,	0x1E5B,	%g5
	sethi	0x158D,	%i0
	sllx	%o6,	%i5,	%g1
loop_2683:
	fbuge	%fcc2,	loop_2684
	fnot1	%f22,	%f2
	srl	%o5,	0x1C,	%i1
	fbe	%fcc1,	loop_2685
loop_2684:
	fmovsge	%xcc,	%f31,	%f7
	fbe,a	%fcc1,	loop_2686
	mulx	%g6,	0x0487,	%l3
loop_2685:
	addcc	%i2,	0x0D9C,	%g7
	bvs	%xcc,	loop_2687
loop_2686:
	fbul	%fcc2,	loop_2688
	movge	%icc,	%i3,	%l0
	edge32ln	%o7,	%g2,	%l4
loop_2687:
	fba,a	%fcc0,	loop_2689
loop_2688:
	fmovdcs	%icc,	%f15,	%f14
	taddcctv	%l6,	0x0664,	%o1
	andn	%i4,	0x1C46,	%o0
loop_2689:
	fbu,a	%fcc2,	loop_2690
	movrgz	%g3,	0x23B,	%l1
	movvc	%icc,	%l2,	%l5
	xnor	%o3,	0x118D,	%i7
loop_2690:
	edge16	%i6,	%o4,	%g4
	movpos	%icc,	%o2,	%i0
	fbg,a	%fcc1,	loop_2691
	fnegs	%f27,	%f1
	addc	%o6,	0x1902,	%i5
	fmovdneg	%icc,	%f21,	%f14
loop_2691:
	udivcc	%g5,	0x1233,	%g1
	ldub	[%l7 + 0x7E],	%i1
	sll	%o5,	0x18,	%g6
	andn	%l3,	0x1B1A,	%i2
	bl,a,pn	%icc,	loop_2692
	lduw	[%l7 + 0x30],	%g7
	addcc	%i3,	%o7,	%l0
	fbg,a	%fcc1,	loop_2693
loop_2692:
	flush	%l7 + 0x2C
	brlez,a	%l4,	loop_2694
	bneg	loop_2695
loop_2693:
	fmovrse	%l6,	%f22,	%f25
	sll	%g2,	0x0F,	%o1
loop_2694:
	stw	%i4,	[%l7 + 0x18]
loop_2695:
	edge8l	%o0,	%l1,	%l2
	fmovscc	%xcc,	%f3,	%f25
	nop
	setx	0xF2D306E654156483,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xB2AA9F4F92DBBF5B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f6,	%f24
	edge8l	%l5,	%g3,	%i7
	fnands	%f26,	%f25,	%f22
	tl	%icc,	0x4
	nop
	setx	0x96A7E574F420B63E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x2EB462578296132B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f22,	%f26
	movrgez	%o3,	0x12F,	%o4
	tcc	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a	%xcc,	loop_2696
	fmovrsgz	%g4,	%f8,	%f13
	fmovsl	%xcc,	%f1,	%f6
	movle	%icc,	%o2,	%i6
loop_2696:
	taddcctv	%o6,	%i0,	%i5
	srlx	%g1,	%g5,	%i1
	andncc	%o5,	%g6,	%i2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x30] %asi,	%g7
	sth	%l3,	[%l7 + 0x1E]
	ldsw	[%l7 + 0x48],	%o7
	ldsh	[%l7 + 0x2A],	%i3
	brlz	%l4,	loop_2697
	ldx	[%l7 + 0x78],	%l0
	sethi	0x0233,	%g2
	ldsw	[%l7 + 0x24],	%o1
loop_2697:
	umulcc	%l6,	0x1009,	%o0
	ldd	[%l7 + 0x50],	%l0
	fbe	%fcc0,	loop_2698
	fmovrdgez	%l2,	%f4,	%f4
	ldsw	[%l7 + 0x08],	%i4
	subccc	%g3,	%i7,	%o3
loop_2698:
	tvs	%xcc,	0x0
	te	%xcc,	0x4
	swap	[%l7 + 0x70],	%o4
	xnorcc	%l5,	%g4,	%o2
	fmovrsgz	%o6,	%f30,	%f30
	alignaddrl	%i6,	%i5,	%g1
	fmovrsgez	%i0,	%f22,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i1,	%g5,	%g6
	set	0x28, %g2
	stxa	%o5,	[%g0 + %g2] 0x20
	bvc,a	loop_2699
	fbne	%fcc2,	loop_2700
	move	%xcc,	%g7,	%l3
	array8	%o7,	%i2,	%l4
loop_2699:
	move	%xcc,	%i3,	%g2
loop_2700:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a	loop_2701
	fmuld8sux16	%f26,	%f6,	%f14
	tgu	%icc,	0x5
	bcs,a,pn	%xcc,	loop_2702
loop_2701:
	tvc	%xcc,	0x6
	udiv	%l0,	0x1C2C,	%l6
	movge	%xcc,	%o1,	%o0
loop_2702:
	movrlez	%l1,	0x16A,	%i4
	fbu,a	%fcc0,	loop_2703
	edge8n	%l2,	%g3,	%o3
	st	%f4,	[%l7 + 0x30]
	tsubcc	%o4,	0x11C5,	%i7
loop_2703:
	fones	%f15
	ldd	[%l7 + 0x58],	%g4
	movrlez	%l5,	%o6,	%o2
	srax	%i6,	%i5,	%i0
	ba,a,pn	%xcc,	loop_2704
	srl	%g1,	0x1A,	%i1
	movre	%g6,	0x12D,	%o5
	fpack32	%f22,	%f16,	%f18
loop_2704:
	fbge	%fcc1,	loop_2705
	fmovsa	%icc,	%f5,	%f26
	nop
	setx	loop_2706,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot2s	%f25,	%f6,	%f27
loop_2705:
	edge16n	%g5,	%g7,	%o7
	umulcc	%l3,	%i2,	%i3
loop_2706:
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
	sra	%l4,	0x00,	%l0
	set	0x68, %l3
	lda	[%l7 + %l3] 0x10,	%f11
	fmovsgu	%icc,	%f26,	%f23
	movpos	%xcc,	%l6,	%o1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x78] %asi,	%g2
	taddcctv	%l1,	0x137B,	%o0
	fblg	%fcc3,	loop_2707
	movre	%l2,	0x31D,	%i4
	tvs	%xcc,	0x5
	tsubcc	%o3,	0x09AC,	%o4
loop_2707:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%i7,	%g4
	fnor	%f12,	%f4,	%f6
	bneg,a,pn	%xcc,	loop_2708
	brlez,a	%l5,	loop_2709
	fmovdl	%xcc,	%f9,	%f1
	fbl	%fcc2,	loop_2710
loop_2708:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2709:
	sra	%o6,	0x12,	%g3
	addccc	%i6,	%i5,	%i0
loop_2710:
	sub	%g1,	%o2,	%g6
	set	0x75, %g4
	lduba	[%l7 + %g4] 0x14,	%o5
	sllx	%i1,	0x1E,	%g7
	sdiv	%o7,	0x0855,	%g5
	movge	%xcc,	%l3,	%i2
	movre	%l4,	0x13B,	%i3
	fmuld8sux16	%f18,	%f26,	%f12
	fnot1s	%f2,	%f1
	edge8	%l0,	%l6,	%o1
	flush	%l7 + 0x2C
	edge16ln	%l1,	%o0,	%l2
	std	%f14,	[%l7 + 0x40]
	lduh	[%l7 + 0x12],	%g2
	andncc	%o3,	%o4,	%i4
	tsubcctv	%i7,	0x0D8E,	%l5
	movleu	%xcc,	%g4,	%o6
	fmul8ulx16	%f30,	%f20,	%f28
	alignaddrl	%i6,	%i5,	%g3
	fpackfix	%f16,	%f4
	fbne,a	%fcc1,	loop_2711
	fxor	%f30,	%f18,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x5
loop_2711:
	udivx	%g1,	0x0AB6,	%o2
	brlez,a	%i0,	loop_2712
	fnand	%f6,	%f6,	%f4
	movrne	%g6,	0x1CE,	%i1
	nop
	set	0x4A, %o2
	ldsb	[%l7 + %o2],	%g7
loop_2712:
	tcc	%xcc,	0x3
	tsubcctv	%o7,	%g5,	%l3
	nop
	setx	0x5693E4F6DBFCCD3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x25B1E26D00890AD6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f20,	%f12
	tn	%xcc,	0x6
	edge32	%o5,	%i2,	%i3
	subcc	%l4,	0x0ECA,	%l6
	fexpand	%f10,	%f18
	movcc	%xcc,	%o1,	%l1
	fmovsg	%xcc,	%f18,	%f30
	stb	%o0,	[%l7 + 0x7D]
	umul	%l0,	%g2,	%l2
	sdiv	%o3,	0x1EA1,	%i4
	fmovrdlez	%i7,	%f10,	%f8
	fbne,a	%fcc2,	loop_2713
	sll	%l5,	0x17,	%o4
	tcs	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2713:
	movre	%g4,	%i6,	%i5
	bne	%icc,	loop_2714
	orncc	%g3,	%o6,	%g1
	nop
	setx	0xC47F09A3A065FA45,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fsrc2s	%f10,	%f22
loop_2714:
	fmovscc	%xcc,	%f1,	%f18
	tl	%icc,	0x7
	ba,a,pt	%icc,	loop_2715
	addcc	%i0,	%g6,	%o2
	bpos,a,pn	%icc,	loop_2716
	or	%i1,	0x00DA,	%o7
loop_2715:
	sra	%g5,	0x01,	%l3
	tsubcctv	%o5,	%g7,	%i3
loop_2716:
	fmul8sux16	%f24,	%f20,	%f22
	fmovrde	%l4,	%f22,	%f24
	tvs	%xcc,	0x6
	orcc	%i2,	%o1,	%l1
	addcc	%o0,	0x0148,	%l6
	nop
	fitod	%f23,	%f12
	fmovdg	%xcc,	%f4,	%f28
	subccc	%l0,	0x0FE0,	%g2
	tcc	%xcc,	0x4
	ldstub	[%l7 + 0x58],	%l2
	andncc	%o3,	%i7,	%i4
	and	%o4,	0x1CF3,	%g4
	tl	%icc,	0x6
	ta	%xcc,	0x1
	fmovsne	%icc,	%f23,	%f2
	movn	%icc,	%l5,	%i5
	movneg	%xcc,	%g3,	%i6
	tge	%xcc,	0x7
	nop
	fitod	%f11,	%f8
	xor	%g1,	0x098F,	%o6
	movl	%xcc,	%g6,	%i0
	fbn,a	%fcc3,	loop_2717
	ldx	[%l7 + 0x20],	%i1
	brlz,a	%o2,	loop_2718
	movvs	%xcc,	%g5,	%o7
loop_2717:
	fpadd32s	%f7,	%f26,	%f3
	tne	%icc,	0x2
loop_2718:
	fbne	%fcc0,	loop_2719
	andn	%o5,	%g7,	%l3
	ldx	[%l7 + 0x48],	%l4
	bn,a,pt	%icc,	loop_2720
loop_2719:
	movgu	%icc,	%i3,	%i2
	ldsb	[%l7 + 0x4D],	%l1
	bge,a,pn	%xcc,	loop_2721
loop_2720:
	sll	%o1,	%o0,	%l0
	nop
	setx	loop_2722,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%g2,	%l2,	%l6
loop_2721:
	edge32n	%i7,	%i4,	%o3
	mulx	%o4,	0x0B4E,	%l5
loop_2722:
	tle	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f3,	%f25
	swap	[%l7 + 0x54],	%i5
	tle	%xcc,	0x7
	tsubcc	%g4,	%i6,	%g1
	nop
	setx	0xE4416913A3629970,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x0755621D01EF0889,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f2,	%f12
	fxors	%f5,	%f22,	%f20
	subc	%g3,	0x1D81,	%o6
	fpadd32s	%f25,	%f30,	%f23
	fbe,a	%fcc2,	loop_2723
	movrne	%i0,	0x389,	%g6
	sethi	0x1008,	%i1
	bvc,a	%xcc,	loop_2724
loop_2723:
	sdivx	%o2,	0x0E4A,	%g5
	andncc	%o7,	%g7,	%o5
	mova	%xcc,	%l3,	%l4
loop_2724:
	sth	%i2,	[%l7 + 0x0A]
	sdivcc	%i3,	0x0376,	%o1
	fand	%f0,	%f30,	%f30
	tleu	%icc,	0x7
	nop
	setx	0x54DD925B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xDD0A3E7B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f16,	%f1
	sll	%l1,	%o0,	%g2
	stw	%l2,	[%l7 + 0x10]
	tle	%xcc,	0x0
	ldsh	[%l7 + 0x12],	%l6
	taddcctv	%l0,	%i4,	%o3
	fbl	%fcc3,	loop_2725
	srl	%i7,	%o4,	%i5
	edge8n	%g4,	%i6,	%l5
	smulcc	%g3,	0x14EE,	%o6
loop_2725:
	addc	%i0,	0x02FD,	%g1
	movpos	%xcc,	%g6,	%i1
	edge32l	%g5,	%o7,	%g7
	tleu	%icc,	0x0
	fand	%f30,	%f8,	%f24
	fmovsge	%xcc,	%f27,	%f17
	movge	%xcc,	%o5,	%o2
	sllx	%l4,	0x05,	%i2
	fmovrsne	%l3,	%f29,	%f1
	movn	%icc,	%i3,	%o1
	nop
	setx	0xBE9C303E9E9AF533,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xAB57A0DB0B6D42E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f6,	%f20
	fmovrsne	%o0,	%f14,	%f15
	fpack16	%f6,	%f26
	or	%g2,	0x0B27,	%l2
	movrlz	%l6,	%l1,	%l0
	umul	%i4,	%i7,	%o3
	fmovrsgz	%o4,	%f25,	%f13
	bg,pt	%xcc,	loop_2726
	sir	0x1195
	fmovdge	%icc,	%f8,	%f17
	tpos	%icc,	0x3
loop_2726:
	srl	%g4,	%i5,	%l5
	movrlz	%i6,	%o6,	%g3
	smul	%g1,	%g6,	%i1
	ldub	[%l7 + 0x15],	%g5
	edge32	%o7,	%g7,	%i0
	fsrc1s	%f20,	%f24
	edge16n	%o2,	%l4,	%o5
	ldsb	[%l7 + 0x5E],	%i2
	flush	%l7 + 0x1C
	srax	%l3,	0x07,	%i3
	edge16n	%o0,	%g2,	%o1
	edge16ln	%l2,	%l1,	%l0
	flush	%l7 + 0x20
	tvs	%xcc,	0x3
	edge16ln	%i4,	%l6,	%i7
	ldx	[%l7 + 0x68],	%o4
	sth	%o3,	[%l7 + 0x3E]
	tg	%icc,	0x4
	movne	%xcc,	%g4,	%l5
	bleu,pn	%icc,	loop_2727
	nop
	setx	0x08F577FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x248C8F60,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f12,	%f24
	udivx	%i5,	0x1E83,	%i6
	movrgz	%o6,	0x008,	%g3
loop_2727:
	brz	%g6,	loop_2728
	addc	%i1,	%g5,	%g1
	andn	%o7,	0x0ABF,	%i0
	brgez	%g7,	loop_2729
loop_2728:
	sub	%o2,	0x1252,	%l4
	nop
	setx	0x51AFEE33DCB45E31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x32645631F0475F49,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f30,	%f4
	movrgz	%i2,	%l3,	%o5
loop_2729:
	xnorcc	%i3,	0x1AE8,	%g2
	xor	%o0,	0x06C2,	%o1
	bpos,a,pn	%xcc,	loop_2730
	sll	%l2,	0x0B,	%l1
	edge16	%l0,	%l6,	%i7
	srax	%i4,	%o4,	%o3
loop_2730:
	edge32n	%g4,	%i5,	%l5
	bvc,pt	%icc,	loop_2731
	umulcc	%o6,	%g3,	%i6
	fxnor	%f4,	%f18,	%f12
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x28] %asi,	%g6
loop_2731:
	tvc	%icc,	0x6
	sdiv	%i1,	0x1976,	%g5
	movrne	%o7,	0x3F3,	%g1
	lduh	[%l7 + 0x2E],	%g7
	fmul8x16au	%f26,	%f31,	%f8
	mulscc	%i0,	%o2,	%l4
	bn,a,pn	%xcc,	loop_2732
	fexpand	%f8,	%f30
	tle	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2732:
	nop
	set	0x38, %i1
	stha	%l3,	[%l7 + %i1] 0x89
	add	%o5,	0x1DFC,	%i2
	edge8ln	%i3,	%o0,	%g2
	tsubcc	%l2,	%l1,	%l0
	tvc	%xcc,	0x0
	array32	%l6,	%i7,	%o1
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x4C] %asi,	%i4
	xorcc	%o3,	0x1AF6,	%o4
	fmovsvc	%icc,	%f16,	%f5
	movrgz	%g4,	0x398,	%l5
	fnand	%f8,	%f0,	%f22
	ta	%icc,	0x0
	movleu	%icc,	%o6,	%g3
	or	%i6,	%g6,	%i1
	fmovsvs	%xcc,	%f14,	%f2
	fbule,a	%fcc0,	loop_2733
	be,pn	%xcc,	loop_2734
	fmovdpos	%icc,	%f9,	%f4
	tle	%xcc,	0x6
loop_2733:
	nop
	setx	0x504FDAD3,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
loop_2734:
	fbe	%fcc2,	loop_2735
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i5,	0x0830,	%g5
	brgez,a	%g1,	loop_2736
loop_2735:
	tsubcctv	%o7,	0x1FF1,	%g7
	array16	%o2,	%l4,	%i0
	tcs	%xcc,	0x5
loop_2736:
	movcs	%xcc,	%l3,	%i2
	fmovsge	%xcc,	%f0,	%f8
	edge32	%i3,	%o5,	%o0
	addccc	%l2,	0x060D,	%l1
	bleu	loop_2737
	edge8n	%g2,	%l6,	%i7
	sir	0x0AB3
	or	%o1,	%l0,	%i4
loop_2737:
	nop
	set	0x1E, %l6
	ldsba	[%l7 + %l6] 0x89,	%o4
	call	loop_2738
	ta	%xcc,	0x3
	te	%icc,	0x7
	taddcctv	%o3,	%g4,	%o6
loop_2738:
	fnor	%f20,	%f2,	%f0
	wr	%g0,	0x89,	%asi
	stba	%g3,	[%l7 + 0x2C] %asi
	andcc	%l5,	%i6,	%g6
	alignaddr	%i1,	%g5,	%g1
	membar	0x29
	alignaddrl	%o7,	%g7,	%i5
	mulx	%l4,	%o2,	%l3
	sethi	0x08DC,	%i0
	fbn,a	%fcc3,	loop_2739
	tvs	%icc,	0x4
	array16	%i2,	%i3,	%o0
	nop
	setx	0xF926C8E7AB73848B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4E291DBF19C54AF7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f2,	%f24
loop_2739:
	nop
	fitos	%f7,	%f21
	fstox	%f21,	%f30
	taddcc	%l2,	0x1358,	%l1
	fbuge,a	%fcc0,	loop_2740
	udivcc	%g2,	0x1A39,	%l6
	bcs	loop_2741
	popc	0x09C2,	%i7
loop_2740:
	fmovsleu	%xcc,	%f11,	%f2
	edge8	%o5,	%l0,	%o1
loop_2741:
	subccc	%i4,	%o4,	%g4
	edge8n	%o6,	%g3,	%l5
	srax	%o3,	%i6,	%g6
	fmovsa	%xcc,	%f3,	%f10
	tge	%icc,	0x6
	flush	%l7 + 0x34
	nop
	fitos	%f8,	%f5
	fstox	%f5,	%f26
	fxtos	%f26,	%f19
	fmovda	%icc,	%f1,	%f3
	movle	%icc,	%i1,	%g1
	edge8n	%o7,	%g7,	%i5
	fnand	%f6,	%f0,	%f0
	fornot1	%f12,	%f16,	%f14
	nop
	setx	0xAA5A557CA07BED3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fzeros	%f27
	fzero	%f0
	fpadd32s	%f6,	%f31,	%f31
	nop
	setx	loop_2742,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%xcc,	%l4,	%o2
	edge8	%g5,	%i0,	%l3
	bne,pn	%icc,	loop_2743
loop_2742:
	edge32n	%i3,	%o0,	%l2
	addcc	%l1,	0x1D18,	%g2
	edge32ln	%l6,	%i2,	%i7
loop_2743:
	fmovda	%xcc,	%f6,	%f10
	lduh	[%l7 + 0x4A],	%o5
	fmovdne	%icc,	%f22,	%f0
	fbl,a	%fcc2,	loop_2744
	nop
	setx	0xEA08B510,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x832ECE5B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f23,	%f16
	movrlez	%l0,	0x066,	%o1
	sethi	0x0AC1,	%o4
loop_2744:
	fcmpne32	%f8,	%f16,	%g4
	movrlez	%o6,	0x26B,	%i4
	set	0x29, %o3
	stba	%g3,	[%l7 + %o3] 0x18
	fpackfix	%f0,	%f13
	movcs	%icc,	%l5,	%o3
	xnor	%g6,	%i1,	%g1
	xnor	%o7,	0x1F0C,	%g7
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x1
	orn	%i6,	0x0258,	%l4
	sir	0x0DC4
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	fpadd32	%f26,	%f0,	%f6
	add	%o2,	%l3,	%i3
	fmovrdlz	%o0,	%f28,	%f22
	edge16l	%i0,	%l1,	%g2
	tpos	%icc,	0x4
	bshuffle	%f20,	%f4,	%f26
	fmovdneg	%xcc,	%f8,	%f29
	xnor	%l2,	0x0ED0,	%l6
	set	0x38, %l4
	stxa	%i2,	[%l7 + %l4] 0x04
	edge8n	%i7,	%o5,	%o1
	movl	%xcc,	%o4,	%g4
	umul	%l0,	0x1E9A,	%i4
	flush	%l7 + 0x70
	ldx	[%l7 + 0x50],	%o6
	srl	%g3,	0x06,	%o3
	edge32ln	%g6,	%i1,	%l5
	fbue	%fcc3,	loop_2745
	fbue,a	%fcc0,	loop_2746
	fmovsa	%icc,	%f26,	%f5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%o7,	%g7
loop_2745:
	flush	%l7 + 0x30
loop_2746:
	nop
	set	0x6A, %i4
	ldstuba	[%l7 + %i4] 0x80,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g1,	%i6,	%g5
	sll	%l4,	0x1E,	%o2
	fmovdneg	%icc,	%f11,	%f25
	addc	%l3,	%o0,	%i3
	movn	%xcc,	%l1,	%i0
	srax	%g2,	%l2,	%i2
	smulcc	%i7,	0x1110,	%o5
	movvc	%icc,	%o1,	%l6
	tge	%xcc,	0x6
	wr	%g0,	0xe2,	%asi
	stxa	%o4,	[%l7 + 0x58] %asi
	membar	#Sync
	fmovse	%icc,	%f19,	%f20
	fmovdpos	%icc,	%f6,	%f22
	tn	%icc,	0x7
	mova	%icc,	%l0,	%i4
	brgez,a	%o6,	loop_2747
	bne	loop_2748
	movpos	%icc,	%g3,	%g4
	fors	%f20,	%f14,	%f22
loop_2747:
	tg	%xcc,	0x2
loop_2748:
	fmovrsne	%g6,	%f2,	%f28
	tgu	%xcc,	0x0
	sllx	%i1,	0x19,	%l5
	fnands	%f0,	%f25,	%f11
	tn	%xcc,	0x7
	edge32l	%o3,	%o7,	%g7
	mulscc	%g1,	0x1F2C,	%i5
	movn	%icc,	%i6,	%l4
	orcc	%o2,	%l3,	%g5
	and	%o0,	%i3,	%i0
	fbuge	%fcc1,	loop_2749
	sll	%g2,	%l2,	%i2
	fmovrsgez	%l1,	%f3,	%f18
	array32	%o5,	%o1,	%l6
loop_2749:
	fabss	%f14,	%f24
	fbg,a	%fcc3,	loop_2750
	fcmpne32	%f30,	%f20,	%o4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%l0
loop_2750:
	edge8l	%i4,	%i7,	%o6
	brnz	%g3,	loop_2751
	movrlez	%g6,	0x22D,	%i1
	array8	%l5,	%o3,	%o7
	edge32n	%g7,	%g4,	%g1
loop_2751:
	alignaddr	%i6,	%i5,	%l4
	srlx	%o2,	0x09,	%l3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	set	0x42, %l1
	stba	%o0,	[%l7 + %l1] 0x81
	edge8ln	%i3,	%i0,	%g2
	edge8l	%l2,	%i2,	%l1
	tvs	%icc,	0x6
	movge	%icc,	%o5,	%l6
	membar	0x34
	edge32l	%o1,	%o4,	%l0
	alignaddrl	%i7,	%o6,	%g3
	xorcc	%i4,	0x1665,	%g6
	srlx	%i1,	%l5,	%o3
	sdivx	%o7,	0x145F,	%g4
	fcmpeq32	%f16,	%f20,	%g1
	nop
	setx	0xA0516507,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	tg	%xcc,	0x4
	sir	0x011D
	tsubcctv	%i6,	0x17C7,	%g7
	orcc	%l4,	%i5,	%o2
	tleu	%icc,	0x0
	xnorcc	%g5,	%l3,	%i3
	xor	%i0,	0x11B1,	%o0
	edge32n	%l2,	%i2,	%l1
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x55] %asi,	%g2
	sethi	0x0822,	%l6
	fpackfix	%f26,	%f2
	andn	%o5,	%o4,	%l0
	mulx	%i7,	0x0FF7,	%o6
	and	%g3,	%i4,	%g6
	subc	%i1,	%l5,	%o1
	bgu	%xcc,	loop_2752
	edge8l	%o7,	%g4,	%g1
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
loop_2752:
	tleu	%xcc,	0x5
	tl	%icc,	0x5
	popc	0x1630,	%g7
	wr	%g0,	0x80,	%asi
	stwa	%l4,	[%l7 + 0x44] %asi
	mulscc	%i5,	0x0951,	%o3
	fpackfix	%f22,	%f7
	andncc	%o2,	%g5,	%i3
	xor	%i0,	0x1CF5,	%l3
	ldub	[%l7 + 0x48],	%l2
	ba,pt	%icc,	loop_2753
	bpos	loop_2754
	and	%o0,	0x0CEE,	%l1
	fpadd32s	%f24,	%f30,	%f2
loop_2753:
	xorcc	%g2,	0x1748,	%i2
loop_2754:
	nop
	setx	0x2485148BB9123385,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xB53BBA89DC399F2E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f30,	%f0
	set	0x10, %g1
	ldda	[%l7 + %g1] 0x27,	%o4
	tvs	%icc,	0x3
	ldsb	[%l7 + 0x0D],	%o4
	movrlz	%l0,	0x272,	%i7
	srlx	%l6,	%g3,	%o6
	movneg	%xcc,	%i4,	%g6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x38] %asi,	%l5
	movleu	%xcc,	%o1,	%o7
	movrlez	%g4,	%i1,	%g1
	andncc	%g7,	%i6,	%i5
	fmovsleu	%icc,	%f4,	%f12
	edge16	%o3,	%o2,	%l4
	fexpand	%f17,	%f6
	orncc	%g5,	%i0,	%l3
	addcc	%i3,	%l2,	%l1
	tcs	%icc,	0x1
	fmovda	%xcc,	%f30,	%f2
	fpackfix	%f24,	%f2
	sethi	0x028A,	%o0
	brgz	%g2,	loop_2755
	tvs	%xcc,	0x3
	bpos,pt	%xcc,	loop_2756
	fmovdvs	%xcc,	%f22,	%f5
loop_2755:
	nop
	fitos	%f14,	%f14
	fstox	%f14,	%f4
	tvs	%xcc,	0x6
loop_2756:
	movne	%icc,	%i2,	%o4
	tge	%xcc,	0x5
	nop
	setx	0x28BF03C1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x152B1E61,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f2,	%f15
	edge8ln	%o5,	%l0,	%l6
	fmovsge	%icc,	%f10,	%f17
	fmovrdlz	%g3,	%f28,	%f6
	ldstub	[%l7 + 0x7E],	%i7
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x2E] %asi,	%o6
	fbug	%fcc3,	loop_2757
	fmul8sux16	%f20,	%f2,	%f26
	tvs	%icc,	0x3
	udivcc	%g6,	0x1BCB,	%i4
loop_2757:
	movgu	%icc,	%o1,	%l5
	tleu	%xcc,	0x2
	udivcc	%o7,	0x127C,	%i1
	movpos	%xcc,	%g1,	%g4
	movn	%icc,	%i6,	%g7
	alignaddr	%o3,	%i5,	%l4
	fnegd	%f30,	%f12
	fmovdneg	%xcc,	%f12,	%f18
	fmovrdgz	%o2,	%f2,	%f28
	array16	%i0,	%g5,	%i3
	fpadd16	%f20,	%f2,	%f12
	fbuge,a	%fcc2,	loop_2758
	movg	%icc,	%l2,	%l3
	umul	%l1,	0x10FA,	%g2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2758:
	nop
	setx	0xC1B8BD42,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xBB58BC9F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f27,	%f22
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x6D] %asi,	%i2
	membar	0x07
	fble	%fcc2,	loop_2759
	lduh	[%l7 + 0x10],	%o0
	umul	%o4,	%o5,	%l0
	alignaddr	%l6,	%i7,	%o6
loop_2759:
	tle	%icc,	0x5
	be	loop_2760
	movcs	%icc,	%g3,	%i4
	fmul8x16	%f11,	%f24,	%f28
	nop
	set	0x51, %o5
	ldstub	[%l7 + %o5],	%g6
loop_2760:
	nop
	setx	0xBD5CE1731900259C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xAB3EBAC2A791463A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f12,	%f4
	wr	%g0,	0xea,	%asi
	stba	%l5,	[%l7 + 0x2D] %asi
	membar	#Sync
	movle	%icc,	%o7,	%i1
	fmuld8sux16	%f24,	%f29,	%f26
	sethi	0x0A07,	%g1
	movvc	%xcc,	%g4,	%i6
	array8	%o1,	%o3,	%i5
	movl	%xcc,	%g7,	%o2
	tg	%xcc,	0x3
	udiv	%i0,	0x1D04,	%l4
	srax	%i3,	%g5,	%l3
	nop
	setx	0x7044C6EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	umulcc	%l2,	0x1731,	%l1
	srlx	%g2,	%i2,	%o0
	fpack32	%f26,	%f12,	%f10
	edge16	%o5,	%o4,	%l0
	movgu	%icc,	%l6,	%i7
	and	%g3,	0x0E74,	%i4
	stw	%o6,	[%l7 + 0x28]
	orn	%g6,	%o7,	%l5
	tleu	%icc,	0x0
	nop
	setx	0x60C7C188D04AF39D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fcmpgt32	%f16,	%f16,	%g1
	or	%g4,	0x0D3A,	%i1
	fmovrde	%i6,	%f26,	%f18
	sdiv	%o3,	0x05A4,	%i5
	movge	%icc,	%o1,	%o2
	tvc	%icc,	0x1
	fbue	%fcc1,	loop_2761
	fabss	%f15,	%f7
	bvc	loop_2762
	fbl	%fcc3,	loop_2763
loop_2761:
	ta	%xcc,	0x1
	set	0x38, %o4
	lduha	[%l7 + %o4] 0x04,	%i0
loop_2762:
	fble,a	%fcc1,	loop_2764
loop_2763:
	orncc	%g7,	0x099D,	%i3
	umul	%l4,	%l3,	%g5
	stw	%l2,	[%l7 + 0x5C]
loop_2764:
	movgu	%xcc,	%g2,	%i2
	orcc	%l1,	%o0,	%o5
	umul	%o4,	%l0,	%i7
	set	0x70, %i5
	ldxa	[%l7 + %i5] 0x14,	%l6
	tvs	%icc,	0x1
	movneg	%icc,	%i4,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g6,	%o7,	%o6
	edge16	%g1,	%l5,	%i1
	edge16	%g4,	%o3,	%i5
	andncc	%o1,	%i6,	%o2
	addccc	%g7,	0x1AB0,	%i3
	swap	[%l7 + 0x14],	%l4
	pdist	%f30,	%f16,	%f28
	wr	%g0,	0x18,	%asi
	stha	%i0,	[%l7 + 0x0E] %asi
	edge32l	%g5,	%l2,	%l3
	udiv	%g2,	0x0C8D,	%l1
	fnot1s	%f26,	%f19
	sllx	%o0,	%i2,	%o5
	set	0x10, %i7
	ldswa	[%l7 + %i7] 0x10,	%o4
	tle	%xcc,	0x4
	movvs	%icc,	%i7,	%l6
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x80] %asi,	%l0
	ta	%xcc,	0x7
	ldub	[%l7 + 0x24],	%i4
	pdist	%f10,	%f14,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0E0A,	%g6
	movcc	%xcc,	%o7,	%o6
	ldx	[%l7 + 0x58],	%g1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	sdiv	%i1,	0x0D07,	%g3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x2
	bpos,a	%xcc,	loop_2765
	edge8	%i5,	%g4,	%o1
	movleu	%icc,	%o2,	%g7
	fabsd	%f28,	%f22
loop_2765:
	fble,a	%fcc3,	loop_2766
	faligndata	%f12,	%f22,	%f30
	andn	%i6,	0x1BC7,	%l4
	bvc	%icc,	loop_2767
loop_2766:
	subc	%i3,	0x179F,	%i0
	mulx	%l2,	0x02BF,	%l3
	orcc	%g5,	%l1,	%g2
loop_2767:
	bshuffle	%f18,	%f14,	%f8
	taddcc	%o0,	0x010D,	%o5
	umul	%o4,	0x0F65,	%i2
	fmovdpos	%xcc,	%f23,	%f19
	taddcctv	%l6,	%l0,	%i4
	addccc	%i7,	%o7,	%o6
	tge	%xcc,	0x1
	fcmple32	%f26,	%f20,	%g1
	fbue,a	%fcc3,	loop_2768
	addcc	%g6,	%i1,	%g3
	fbl,a	%fcc3,	loop_2769
	fmovrslez	%o3,	%f7,	%f12
loop_2768:
	be,a,pt	%icc,	loop_2770
	stb	%l5,	[%l7 + 0x7E]
loop_2769:
	fmovdvc	%xcc,	%f22,	%f6
	orn	%i5,	%g4,	%o1
loop_2770:
	fxor	%f10,	%f4,	%f30
	set	0x27, %g3
	ldsba	[%l7 + %g3] 0x80,	%o2
	umulcc	%g7,	0x0DCD,	%l4
	srlx	%i3,	%i6,	%i0
	xnorcc	%l2,	%l3,	%l1
	taddcctv	%g5,	%g2,	%o0
	add	%o4,	%i2,	%o5
	movrne	%l6,	0x3AD,	%i4
	movl	%icc,	%i7,	%l0
	tgu	%icc,	0x6
	movne	%xcc,	%o7,	%o6
	fpmerge	%f1,	%f20,	%f14
	fbue,a	%fcc2,	loop_2771
	bleu,a,pt	%icc,	loop_2772
	nop
	set	0x68, %o1
	ldd	[%l7 + %o1],	%g0
	mova	%icc,	%g6,	%i1
loop_2771:
	fpackfix	%f26,	%f28
loop_2772:
	fnot2	%f14,	%f28
	nop
	setx	0xC2D17F9A186497FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f30
	popc	0x0BC9,	%o3
	set	0x54, %g7
	lduwa	[%l7 + %g7] 0x04,	%l5
	edge16l	%i5,	%g4,	%o1
	fpadd32s	%f31,	%f14,	%f5
	nop
	fitos	%f1,	%f30
	udiv	%g3,	0x0578,	%o2
	fmovdn	%xcc,	%f13,	%f2
	movrgez	%l4,	0x26F,	%g7
	brz,a	%i6,	loop_2773
	stx	%i0,	[%l7 + 0x60]
	umulcc	%l2,	%l3,	%l1
	bcs	loop_2774
loop_2773:
	tne	%icc,	0x1
	nop
	setx	loop_2775,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovd	%f20,	%f22
loop_2774:
	edge32ln	%g5,	%g2,	%o0
	fcmpne16	%f22,	%f18,	%i3
loop_2775:
	addcc	%o4,	%o5,	%i2
	bcc,pn	%icc,	loop_2776
	andncc	%i4,	%i7,	%l6
	fmovrslz	%l0,	%f11,	%f6
	fmovrslez	%o6,	%f21,	%f3
loop_2776:
	tn	%icc,	0x7
	xnorcc	%g1,	0x0A06,	%g6
	movpos	%icc,	%o7,	%i1
	ldstub	[%l7 + 0x6B],	%l5
	umul	%i5,	0x0D32,	%o3
	and	%g4,	%o1,	%g3
	andncc	%l4,	%o2,	%i6
	alignaddr	%i0,	%g7,	%l3
	call	loop_2777
	xorcc	%l2,	%g5,	%g2
	array8	%l1,	%o0,	%i3
	andcc	%o5,	0x0A69,	%i2
loop_2777:
	addccc	%i4,	0x058A,	%o4
	fcmpgt32	%f4,	%f24,	%l6
	fmovs	%f21,	%f3
	srlx	%i7,	0x17,	%o6
	lduw	[%l7 + 0x50],	%l0
	fbuge	%fcc2,	loop_2778
	fxor	%f28,	%f20,	%f8
	alignaddr	%g6,	%g1,	%o7
	sth	%i1,	[%l7 + 0x18]
loop_2778:
	brlz	%l5,	loop_2779
	movrgz	%i5,	0x33F,	%g4
	movvc	%icc,	%o3,	%g3
	movrgez	%l4,	0x3BC,	%o2
loop_2779:
	tn	%xcc,	0x2
	andncc	%i6,	%i0,	%o1
	sdivcc	%g7,	0x0483,	%l2
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x18] %asi,	%l3
	popc	%g2,	%l1
	popc	%g5,	%i3
	tvc	%xcc,	0x3
	fblg	%fcc1,	loop_2780
	nop
	set	0x38, %l0
	ldsb	[%l7 + %l0],	%o0
	tvs	%xcc,	0x4
	movne	%xcc,	%o5,	%i4
loop_2780:
	ldsh	[%l7 + 0x14],	%i2
	nop
	fitod	%f2,	%f14
	fdtos	%f14,	%f20
	xor	%l6,	0x1D21,	%i7
	tpos	%icc,	0x7
	movgu	%icc,	%o6,	%o4
	fbe,a	%fcc0,	loop_2781
	addccc	%g6,	%l0,	%g1
	tsubcc	%i1,	0x1598,	%o7
	taddcc	%i5,	0x01F5,	%l5
loop_2781:
	tle	%icc,	0x2
	addcc	%o3,	0x0EFD,	%g4
	subcc	%l4,	0x1D3E,	%g3
	fzero	%f16
	fbule	%fcc0,	loop_2782
	movcs	%icc,	%o2,	%i0
	array16	%i6,	%o1,	%g7
	fmovrse	%l3,	%f13,	%f22
loop_2782:
	add	%g2,	%l1,	%l2
	ble	loop_2783
	fpsub32	%f20,	%f4,	%f30
	tneg	%xcc,	0x1
	sub	%g5,	0x1ED0,	%o0
loop_2783:
	tleu	%xcc,	0x0
	and	%i3,	%o5,	%i4
	srax	%i2,	%i7,	%o6
	ba,pn	%xcc,	loop_2784
	tvs	%xcc,	0x6
	wr	%g0,	0x19,	%asi
	sta	%f11,	[%l7 + 0x4C] %asi
loop_2784:
	fcmpeq32	%f0,	%f10,	%l6
	udivcc	%o4,	0x03DD,	%g6
	sub	%g1,	%l0,	%i1
	movre	%i5,	%o7,	%l5
	set	0x1E, %i3
	stba	%g4,	[%l7 + %i3] 0x27
	membar	#Sync
	tcc	%xcc,	0x0
	fpadd32	%f26,	%f20,	%f14
	sdivx	%l4,	0x1DAE,	%g3
	fone	%f8
	xnor	%o3,	%o2,	%i0
	nop
	setx loop_2785, %l0, %l1
	jmpl %l1, %i6
	movre	%o1,	%g7,	%g2
	movvs	%icc,	%l3,	%l1
	prefetch	[%l7 + 0x40],	 0x2
loop_2785:
	smulcc	%g5,	%l2,	%o0
	orncc	%i3,	0x12BD,	%i4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%i2,	%i7
	srl	%o5,	%o6,	%o4
	tg	%xcc,	0x4
	fbne	%fcc0,	loop_2786
	nop
	fitod	%f30,	%f26
	fmovsl	%icc,	%f24,	%f18
	edge8ln	%g6,	%l6,	%g1
loop_2786:
	udivx	%l0,	0x154D,	%i1
	array8	%o7,	%i5,	%l5
	movgu	%xcc,	%l4,	%g3
	brgz,a	%o3,	loop_2787
	tneg	%icc,	0x2
	edge8l	%g4,	%i0,	%i6
	ldd	[%l7 + 0x30],	%o0
loop_2787:
	xor	%g7,	0x1A8D,	%o2
	movge	%icc,	%l3,	%g2
	movcs	%xcc,	%l1,	%g5
	movrgez	%l2,	%i3,	%i4
	tge	%xcc,	0x6
	stbar
	fmovsn	%icc,	%f31,	%f12
	mulscc	%o0,	0x0E4B,	%i7
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i2,	%o5
	movl	%xcc,	%o4,	%o6
	fbne	%fcc3,	loop_2788
	edge16	%g6,	%g1,	%l0
	smulcc	%l6,	0x1C72,	%i1
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o7
loop_2788:
	brlz,a	%l5,	loop_2789
	andn	%i5,	%l4,	%o3
	nop
	fitod	%f2,	%f16
	fdtoi	%f16,	%f16
	tsubcctv	%g3,	%g4,	%i0
loop_2789:
	nop
	setx loop_2790, %l0, %l1
	jmpl %l1, %i6
	bn,pt	%xcc,	loop_2791
	smul	%o1,	%g7,	%o2
	movvc	%icc,	%l3,	%g2
loop_2790:
	ld	[%l7 + 0x18],	%f11
loop_2791:
	fbuge	%fcc2,	loop_2792
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f20
	fxtod	%f20,	%f16
	tvc	%xcc,	0x4
	fbne,a	%fcc0,	loop_2793
loop_2792:
	subc	%g5,	0x126B,	%l1
	movvc	%xcc,	%i3,	%i4
	sdivx	%l2,	0x1751,	%o0
loop_2793:
	movcc	%icc,	%i2,	%i7
	ldd	[%l7 + 0x38],	%o4
	movre	%o4,	0x0E4,	%o6
	wr	%g0,	0x22,	%asi
	stxa	%g6,	[%l7 + 0x08] %asi
	membar	#Sync
	movneg	%xcc,	%l0,	%l6
	array16	%g1,	%o7,	%l5
	sdivcc	%i1,	0x163F,	%i5
	tle	%xcc,	0x1
	stbar
	umul	%l4,	%o3,	%g3
	alignaddr	%i0,	%g4,	%o1
	srl	%g7,	0x0F,	%i6
	movcs	%icc,	%o2,	%g2
	edge16ln	%l3,	%g5,	%i3
	tne	%xcc,	0x4
	fsrc2s	%f7,	%f17
	edge16	%l1,	%i4,	%o0
	bvc	%icc,	loop_2794
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i2,	%i7
	fmovrdlz	%o5,	%f28,	%f18
loop_2794:
	nop
	fitos	%f9,	%f29
	fstox	%f29,	%f14
	subcc	%l2,	0x059A,	%o4
	srax	%g6,	%l0,	%o6
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf9,	%f0
	subcc	%l6,	%g1,	%o7
	umul	%i1,	0x1CA9,	%l5
	addc	%i5,	%l4,	%o3
	srax	%g3,	0x0A,	%i0
	stbar
	edge32l	%g4,	%o1,	%i6
	srax	%o2,	0x15,	%g7
	nop
	setx loop_2795, %l0, %l1
	jmpl %l1, %g2
	tne	%xcc,	0x6
	array32	%g5,	%i3,	%l3
	tvc	%icc,	0x3
loop_2795:
	nop
	set	0x70, %i0
	lda	[%l7 + %i0] 0x11,	%f2
	ldx	[%l7 + 0x38],	%l1
	edge32l	%o0,	%i4,	%i7
	edge8	%i2,	%o5,	%l2
	fsrc2s	%f4,	%f4
	edge8l	%g6,	%l0,	%o6
	edge32	%l6,	%o4,	%o7
	tge	%xcc,	0x5
	tgu	%icc,	0x5
	tne	%xcc,	0x2
	fnot2s	%f1,	%f23
	ldstub	[%l7 + 0x18],	%g1
	fblg,a	%fcc1,	loop_2796
	std	%f12,	[%l7 + 0x68]
	tpos	%xcc,	0x0
	sir	0x08AE
loop_2796:
	fornot2s	%f8,	%f8,	%f29
	fpack16	%f0,	%f15
	fcmpgt32	%f10,	%f16,	%l5
	tpos	%xcc,	0x2
	fbne,a	%fcc2,	loop_2797
	fone	%f28
	brgez	%i1,	loop_2798
	fxors	%f29,	%f24,	%f23
loop_2797:
	nop
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x78] %asi,	%l4
loop_2798:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o3,	%i5,	%g3
	ldd	[%l7 + 0x50],	%g4
	xorcc	%o1,	0x11ED,	%i6
	fbg	%fcc1,	loop_2799
	smul	%o2,	0x17B3,	%i0
	srax	%g7,	%g5,	%i3
	tneg	%xcc,	0x1
loop_2799:
	fors	%f11,	%f14,	%f11
	movn	%icc,	%l3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1FAC,	%o0
	edge16l	%l1,	%i7,	%i4
	movvs	%icc,	%i2,	%o5
	fornot1s	%f22,	%f7,	%f28
	array32	%g6,	%l2,	%l0
	xorcc	%o6,	0x039E,	%o4
	bne,pt	%xcc,	loop_2800
	xorcc	%l6,	%o7,	%g1
	movrgz	%l5,	%l4,	%o3
	tg	%xcc,	0x4
loop_2800:
	smul	%i5,	%g3,	%i1
	fbne,a	%fcc3,	loop_2801
	fcmple32	%f6,	%f0,	%g4
	fxnors	%f16,	%f12,	%f15
	popc	%o1,	%o2
loop_2801:
	nop
	setx	0xFEB0A9E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x77547376,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f4,	%f31
	fbo,a	%fcc3,	loop_2802
	ba,pn	%icc,	loop_2803
	sllx	%i0,	0x0D,	%i6
	fmovsvc	%icc,	%f17,	%f4
loop_2802:
	movneg	%xcc,	%g7,	%i3
loop_2803:
	andcc	%l3,	0x0D2F,	%g2
	movle	%xcc,	%o0,	%g5
	sll	%i7,	0x01,	%l1
	mulx	%i4,	%i2,	%g6
	alignaddrl	%l2,	%l0,	%o5
	fble	%fcc0,	loop_2804
	fmovrdgz	%o4,	%f14,	%f20
	nop
	setx	0xD473BC0D53AE8172,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xCE2EAC8366C984C7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f12,	%f8
	sllx	%o6,	%o7,	%g1
loop_2804:
	srl	%l6,	%l4,	%l5
	orncc	%i5,	%o3,	%g3
	sth	%i1,	[%l7 + 0x48]
	nop
	set	0x20, %g6
	stb	%g4,	[%l7 + %g6]
	edge32ln	%o1,	%o2,	%i0
	edge16	%g7,	%i3,	%i6
	nop
	setx	0xEC471CE5B2C7F61C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f16
	edge32n	%l3,	%g2,	%g5
	edge8n	%o0,	%i7,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x1C],	 0x0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%i2
	edge16	%g6,	%l1,	%l2
	xor	%l0,	0x1B50,	%o5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x1D, %o0
	stba	%o6,	[%l7 + %o0] 0x15
	edge16l	%o7,	%o4,	%l6
	stb	%l4,	[%l7 + 0x67]
	bvc	%icc,	loop_2805
	lduh	[%l7 + 0x3E],	%g1
	bge,a	%xcc,	loop_2806
	fornot1	%f28,	%f12,	%f6
loop_2805:
	stb	%l5,	[%l7 + 0x7F]
	udivcc	%i5,	0x022C,	%g3
loop_2806:
	movvs	%xcc,	%i1,	%g4
	fmovrse	%o1,	%f11,	%f9
	call	loop_2807
	tne	%icc,	0x0
	edge8n	%o3,	%o2,	%i0
	stx	%i3,	[%l7 + 0x28]
loop_2807:
	fmovdle	%xcc,	%f14,	%f15
	nop
	fitos	%f10,	%f0
	fstox	%f0,	%f12
	flush	%l7 + 0x0C
	brlz,a	%i6,	loop_2808
	bn,a	%xcc,	loop_2809
	array8	%g7,	%l3,	%g5
	srax	%g2,	%o0,	%i7
loop_2808:
	fnot2s	%f10,	%f5
loop_2809:
	fmovsgu	%xcc,	%f3,	%f18
	orn	%i2,	0x1132,	%i4
	edge16	%l1,	%l2,	%g6
	tvs	%xcc,	0x6
	edge8l	%l0,	%o5,	%o7
	move	%xcc,	%o6,	%o4
	udiv	%l6,	0x0054,	%l4
	fcmpeq16	%f0,	%f10,	%l5
	nop
	setx loop_2810, %l0, %l1
	jmpl %l1, %g1
	udivx	%g3,	0x0DD9,	%i1
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x89,	 0x2
loop_2810:
	movn	%icc,	%o1,	%i5
	nop
	set	0x38, %o7
	lduw	[%l7 + %o7],	%o2
	bvs,a	loop_2811
	ldsh	[%l7 + 0x28],	%i0
	edge16l	%i3,	%o3,	%i6
	sdivx	%l3,	0x036B,	%g7
loop_2811:
	smul	%g5,	0x0531,	%g2
	ta	%icc,	0x7
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f20
	fba,a	%fcc3,	loop_2812
	movvc	%xcc,	%i7,	%i2
	fmul8x16	%f21,	%f24,	%f16
	xnor	%o0,	0x0722,	%l1
loop_2812:
	orn	%i4,	%g6,	%l0
	fnegs	%f17,	%f25
	umulcc	%l2,	%o5,	%o7
	fbu	%fcc0,	loop_2813
	or	%o6,	0x1516,	%l6
	nop
	setx	loop_2814,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsh	[%l7 + 0x20],	%l4
loop_2813:
	ldsb	[%l7 + 0x36],	%l5
	movvc	%xcc,	%g1,	%o4
loop_2814:
	fzero	%f22
	bg,a,pt	%xcc,	loop_2815
	subccc	%i1,	0x1A0F,	%g3
	tcc	%xcc,	0x0
	ldsb	[%l7 + 0x75],	%o1
loop_2815:
	tg	%icc,	0x4
	bgu,a,pt	%icc,	loop_2816
	edge16ln	%i5,	%g4,	%o2
	movle	%icc,	%i0,	%o3
	movpos	%xcc,	%i3,	%l3
loop_2816:
	fbu	%fcc1,	loop_2817
	tcc	%xcc,	0x0
	sll	%g7,	0x01,	%g5
	tvs	%icc,	0x6
loop_2817:
	movrne	%i6,	%g2,	%i7
	edge8n	%o0,	%i2,	%l1
	movvs	%icc,	%i4,	%l0
	fmuld8ulx16	%f19,	%f23,	%f12
	fmovsgu	%xcc,	%f15,	%f28
	xorcc	%g6,	%o5,	%o7
	xnor	%o6,	%l6,	%l2
	nop
	fitod	%f12,	%f2
	fdtoi	%f2,	%f10
	nop
	set	0x50, %o6
	stw	%l4,	[%l7 + %o6]
	fbl	%fcc1,	loop_2818
	movcc	%xcc,	%l5,	%o4
	add	%i1,	%g1,	%g3
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
loop_2818:
	tsubcctv	%i5,	%g4,	%o2
	movrgez	%i0,	%o3,	%i3
	nop
	setx	0xC195226CD071D3D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	movvc	%icc,	%g7,	%l3
	sllx	%i6,	0x11,	%g2
	tge	%icc,	0x5
	lduw	[%l7 + 0x2C],	%g5
	fandnot2	%f14,	%f22,	%f2
	sll	%i7,	%i2,	%l1
	movrlez	%o0,	0x29C,	%i4
	nop
	setx loop_2819, %l0, %l1
	jmpl %l1, %l0
	sdivx	%g6,	0x0C23,	%o7
	ldx	[%l7 + 0x70],	%o6
	sll	%o5,	%l2,	%l4
loop_2819:
	movpos	%xcc,	%l6,	%l5
	bl	%icc,	loop_2820
	bvs,a,pt	%icc,	loop_2821
	mulscc	%o4,	%g1,	%g3
	orncc	%i1,	%i5,	%o1
loop_2820:
	bvc,pn	%icc,	loop_2822
loop_2821:
	umulcc	%g4,	%i0,	%o2
	set	0x1A, %i6
	lduha	[%l7 + %i6] 0x15,	%o3
loop_2822:
	nop
	fitod	%f8,	%f18
	fdtoi	%f18,	%f22
	nop
	setx	0x19C62887C6CB2296,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x76FDF84C227C853A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f14,	%f18
	tcs	%xcc,	0x1
	movleu	%icc,	%i3,	%l3
	edge8	%i6,	%g7,	%g5
	fones	%f27
	fmovdle	%icc,	%f8,	%f15
	movvc	%icc,	%i7,	%i2
	edge16l	%l1,	%o0,	%g2
	sir	0x1996
	fbug	%fcc1,	loop_2823
	sethi	0x11C3,	%l0
	sra	%i4,	0x13,	%o7
	add	%o6,	%o5,	%l2
loop_2823:
	fmovde	%icc,	%f17,	%f20
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	ta	%xcc,	0x4
	fpadd32s	%f3,	%f22,	%f9
	addccc	%g6,	0x0481,	%l5
	edge32l	%o4,	%g1,	%g3
	fmovdleu	%icc,	%f3,	%f21
	alignaddr	%l6,	%i5,	%o1
	add	%g4,	%i0,	%i1
	sdiv	%o3,	0x1B7F,	%i3
	udivx	%l3,	0x1335,	%i6
	brlez,a	%o2,	loop_2824
	fandnot2	%f8,	%f30,	%f2
	tvs	%xcc,	0x4
	movvs	%xcc,	%g7,	%g5
loop_2824:
	nop
	set	0x08, %l2
	sta	%f22,	[%l7 + %l2] 0x88
	fxnors	%f19,	%f13,	%f27
	fones	%f5
	tcs	%icc,	0x4
	call	loop_2825
	movrlz	%i2,	%i7,	%o0
	alignaddrl	%l1,	%g2,	%i4
	edge32	%o7,	%l0,	%o6
loop_2825:
	movcs	%xcc,	%l2,	%l4
	fmovdcc	%icc,	%f19,	%f10
	smul	%g6,	%l5,	%o4
	mulscc	%g1,	%g3,	%l6
	taddcctv	%i5,	0x022D,	%o5
	srl	%g4,	%o1,	%i0
	add	%i1,	%i3,	%l3
	fbl,a	%fcc3,	loop_2826
	movge	%xcc,	%o3,	%o2
	edge32l	%g7,	%i6,	%g5
	ble	loop_2827
loop_2826:
	edge32	%i2,	%i7,	%o0
	edge8ln	%l1,	%g2,	%o7
	fble	%fcc1,	loop_2828
loop_2827:
	sdivcc	%i4,	0x01CE,	%o6
	fmovrsgez	%l2,	%f23,	%f8
	set	0x08, %g5
	ldstuba	[%l7 + %g5] 0x89,	%l0
loop_2828:
	fxor	%f6,	%f8,	%f14
	addccc	%g6,	0x02B9,	%l5
	fsrc1	%f16,	%f4
	udiv	%o4,	0x1694,	%l4
	edge8n	%g1,	%l6,	%i5
	fbl	%fcc3,	loop_2829
	fmovsleu	%icc,	%f10,	%f24
	subccc	%o5,	0x1D2E,	%g4
	alignaddr	%g3,	%o1,	%i0
loop_2829:
	sdiv	%i3,	0x1361,	%i1
	movvc	%xcc,	%l3,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x64
	movne	%icc,	%o2,	%g7
	edge8l	%i6,	%g5,	%i7
	addcc	%i2,	%l1,	%g2
	tge	%xcc,	0x4
	mulx	%o7,	%i4,	%o6
	sir	0x02C6
	edge16n	%l2,	%l0,	%o0
	fbg	%fcc2,	loop_2830
	ldsb	[%l7 + 0x72],	%g6
	fnot2	%f2,	%f6
	bn,pt	%xcc,	loop_2831
loop_2830:
	fmovrsgz	%l5,	%f13,	%f3
	movleu	%icc,	%l4,	%o4
	movgu	%icc,	%g1,	%l6
loop_2831:
	edge32l	%o5,	%g4,	%i5
	movrgz	%g3,	%i0,	%o1
	fones	%f31
	fmuld8sux16	%f5,	%f0,	%f24
	fandnot1	%f24,	%f2,	%f6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x3A] %asi,	%i3
	fbn	%fcc3,	loop_2832
	fxnor	%f10,	%f18,	%f6
	for	%f30,	%f24,	%f2
	fcmple16	%f10,	%f16,	%i1
loop_2832:
	udiv	%l3,	0x027F,	%o3
	movn	%xcc,	%g7,	%o2
	fmovs	%f7,	%f5
	movle	%xcc,	%g5,	%i6
	tvs	%xcc,	0x5
	ta	%xcc,	0x3
	orn	%i2,	0x1AAF,	%l1
	orn	%i7,	0x0018,	%g2
	set	0x58, %l3
	prefetcha	[%l7 + %l3] 0x80,	 0x2
	sdivcc	%o6,	0x0CCC,	%o7
	umulcc	%l0,	0x1908,	%o0
	bneg	loop_2833
	faligndata	%f24,	%f24,	%f12
	movcc	%icc,	%g6,	%l5
	fcmpne32	%f10,	%f12,	%l4
loop_2833:
	movgu	%xcc,	%o4,	%l2
	alignaddr	%l6,	%g1,	%g4
	fmovde	%icc,	%f2,	%f11
	orcc	%o5,	0x0A53,	%g3
	array16	%i5,	%i0,	%i3
	brz	%o1,	loop_2834
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x4
	wr	%g0,	0x88,	%asi
	stxa	%l3,	[%l7 + 0x30] %asi
loop_2834:
	movcc	%icc,	%i1,	%o3
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x15
	bleu,pn	%xcc,	loop_2835
	fsrc2s	%f1,	%f0
	movcc	%icc,	%g7,	%g5
	brgz,a	%i6,	loop_2836
loop_2835:
	call	loop_2837
	fnand	%f24,	%f4,	%f8
	ba	%xcc,	loop_2838
loop_2836:
	flush	%l7 + 0x24
loop_2837:
	nop
	set	0x60, %o2
	lda	[%l7 + %o2] 0x89,	%f2
loop_2838:
	movg	%xcc,	%o2,	%i2
	fxnors	%f14,	%f9,	%f8
	fmovrdlz	%l1,	%f30,	%f20
	fmul8x16al	%f19,	%f11,	%f28
	tpos	%icc,	0x1
	movgu	%xcc,	%i7,	%i4
	movl	%xcc,	%g2,	%o7
	fmovdvc	%icc,	%f7,	%f1
	edge32ln	%l0,	%o0,	%g6
	edge32l	%l5,	%l4,	%o6
	xorcc	%l2,	%l6,	%o4
	fcmple16	%f14,	%f0,	%g1
	membar	0x6F
	fbe	%fcc3,	loop_2839
	fandnot2	%f28,	%f12,	%f2
	fexpand	%f25,	%f24
	umul	%o5,	0x16BD,	%g4
loop_2839:
	array32	%g3,	%i0,	%i5
	sra	%i3,	%l3,	%i1
	fors	%f11,	%f18,	%f31
	movne	%xcc,	%o1,	%g7
	stw	%o3,	[%l7 + 0x54]
	fmovsneg	%xcc,	%f22,	%f10
	movge	%icc,	%i6,	%o2
	prefetch	[%l7 + 0x3C],	 0x2
	tge	%xcc,	0x2
	sdivcc	%i2,	0x09E5,	%g5
	ba	%icc,	loop_2840
	fone	%f30
	movrne	%i7,	0x129,	%l1
	edge32l	%i4,	%o7,	%l0
loop_2840:
	xnorcc	%g2,	0x1E0D,	%g6
	stx	%l5,	[%l7 + 0x70]
	movcs	%icc,	%l4,	%o0
	tle	%xcc,	0x3
	movle	%icc,	%l2,	%o6
	fbo	%fcc3,	loop_2841
	movrgez	%l6,	%g1,	%o5
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f12
	fmovrsgez	%o4,	%f13,	%f0
loop_2841:
	alignaddrl	%g4,	%i0,	%g3
	edge16ln	%i5,	%i3,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o1,	%i1,	%o3
	fmovdpos	%icc,	%f6,	%f4
	nop
	setx	0x24575DEFFAAD18E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x2C0DC99CEF8DAB59,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f12,	%f30
	fblg	%fcc2,	loop_2842
	tleu	%xcc,	0x2
	sethi	0x1D60,	%i6
	movrlez	%g7,	%o2,	%g5
loop_2842:
	umulcc	%i7,	0x1004,	%i2
	edge8	%l1,	%o7,	%l0
	edge32	%g2,	%i4,	%g6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%o0
	nop
	setx	loop_2843,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbug	%fcc0,	loop_2844
	movle	%xcc,	%l4,	%o6
	movg	%icc,	%l2,	%l6
loop_2843:
	ldub	[%l7 + 0x57],	%o5
loop_2844:
	addc	%o4,	0x16F3,	%g1
	tvc	%xcc,	0x7
	alignaddrl	%g4,	%i0,	%g3
	fsrc2s	%f6,	%f16
	tvs	%icc,	0x5
	addcc	%i3,	0x1F7A,	%l3
	xnorcc	%i5,	%o1,	%i1
	movpos	%xcc,	%o3,	%i6
	tcc	%icc,	0x3
	nop
	fitos	%f19,	%f24
	fbo,a	%fcc3,	loop_2845
	tge	%icc,	0x6
	movl	%xcc,	%g7,	%o2
	tle	%icc,	0x1
loop_2845:
	subccc	%i7,	0x0CF4,	%g5
	fbuge	%fcc1,	loop_2846
	fornot2	%f28,	%f6,	%f6
	tvc	%icc,	0x6
	orn	%l1,	%i2,	%l0
loop_2846:
	sir	0x0E48
	fmovd	%f22,	%f20
	nop
	setx	0x6B460B58,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f0
	fpmerge	%f17,	%f24,	%f8
	edge16n	%o7,	%i4,	%g6
	bcc	loop_2847
	fble,a	%fcc1,	loop_2848
	fbg,a	%fcc1,	loop_2849
	nop
	setx	loop_2850,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2847:
	fpack16	%f12,	%f31
loop_2848:
	nop
	setx loop_2851, %l0, %l1
	jmpl %l1, %g2
loop_2849:
	membar	0x76
loop_2850:
	nop
	fitos	%f14,	%f13
	fstox	%f13,	%f16
	fxtos	%f16,	%f29
	tcc	%icc,	0x6
loop_2851:
	nop
	fitod	%f4,	%f12
	fdtoi	%f12,	%f30
	fmovsl	%xcc,	%f3,	%f22
	brz,a	%l5,	loop_2852
	lduh	[%l7 + 0x54],	%o0
	fmovrsgez	%o6,	%f5,	%f26
	wr	%g0,	0x27,	%asi
	stba	%l2,	[%l7 + 0x64] %asi
	membar	#Sync
loop_2852:
	array32	%l4,	%o5,	%l6
	edge32n	%o4,	%g1,	%g4
	fmovdneg	%xcc,	%f20,	%f10
	edge8	%g3,	%i3,	%i0
	fnot1s	%f1,	%f21
	fmovdcs	%xcc,	%f30,	%f14
	andn	%i5,	0x0BA6,	%l3
	bpos,a,pn	%icc,	loop_2853
	orncc	%i1,	%o1,	%i6
	umul	%g7,	%o2,	%i7
	tcc	%icc,	0x5
loop_2853:
	movl	%icc,	%g5,	%l1
	fnot1s	%f8,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
	bneg,a	%xcc,	loop_2854
	nop
	set	0x38, %g2
	prefetch	[%l7 + %g2],	 0x2
	alignaddr	%o7,	%i4,	%i2
	movg	%icc,	%g2,	%l5
loop_2854:
	fandnot1	%f8,	%f4,	%f22
	membar	0x43
	fmovsn	%xcc,	%f9,	%f15
	bge,a	%xcc,	loop_2855
	bvc,pn	%xcc,	loop_2856
	movneg	%xcc,	%o0,	%o6
	fornot1s	%f22,	%f30,	%f19
loop_2855:
	st	%f3,	[%l7 + 0x38]
loop_2856:
	movge	%xcc,	%l2,	%g6
	fnands	%f24,	%f7,	%f19
	nop
	setx	0x192A9FEA3E140BC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x1BDE9A3B1962EADE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f20,	%f2
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f30
	fxtod	%f30,	%f0
	fcmple32	%f4,	%f10,	%o5
	array32	%l4,	%o4,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,pt	%icc,	loop_2857
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g4,	%g3,	%l6
	fmovrde	%i3,	%f2,	%f10
loop_2857:
	nop
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovdneg	%xcc,	%f25,	%f11
	set	0x25, %l6
	lduba	[%l7 + %l6] 0x0c,	%i5
	movg	%xcc,	%i0,	%i1
	sll	%o1,	0x0A,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%icc,	0x7
	fnot1s	%f26,	%f29
	movrlez	%l3,	0x37A,	%o2
	tcs	%icc,	0x6
	bg,a,pn	%xcc,	loop_2858
	and	%g7,	0x1B18,	%g5
	set	0x70, %o3
	ldswa	[%l7 + %o3] 0x89,	%i7
loop_2858:
	orncc	%l1,	%l0,	%o3
	fmovsg	%xcc,	%f25,	%f13
	te	%xcc,	0x3
	udivx	%o7,	0x1B1C,	%i2
	taddcc	%i4,	0x06B8,	%g2
	smulcc	%o0,	%l5,	%l2
	lduw	[%l7 + 0x34],	%o6
	edge32	%o5,	%g6,	%l4
	fmovspos	%icc,	%f6,	%f11
	bge,pn	%xcc,	loop_2859
	andn	%g1,	%o4,	%g3
	movvc	%xcc,	%l6,	%i3
	movrlez	%i5,	0x269,	%g4
loop_2859:
	nop
	set	0x5F, %l4
	stba	%i1,	[%l7 + %l4] 0xeb
	membar	#Sync
	edge32l	%o1,	%i0,	%i6
	mulx	%o2,	0x1D15,	%l3
	alignaddrl	%g7,	%g5,	%i7
	udivx	%l1,	0x0A7E,	%o3
	set	0x30, %i1
	ldxa	[%g0 + %i1] 0x50,	%o7
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	tpos	%icc,	0x0
	movg	%icc,	%i4,	%g2
	bgu,a	loop_2860
	sllx	%l0,	0x16,	%o0
	fpack32	%f8,	%f14,	%f18
	nop
	fitos	%f11,	%f15
	fstox	%f15,	%f24
	fxtos	%f24,	%f8
loop_2860:
	fbul,a	%fcc0,	loop_2861
	tsubcctv	%l5,	%l2,	%o5
	fxnor	%f12,	%f30,	%f18
	stw	%o6,	[%l7 + 0x44]
loop_2861:
	subccc	%l4,	0x13E4,	%g1
	tl	%icc,	0x0
	ba	loop_2862
	xorcc	%g6,	%o4,	%g3
	edge32	%l6,	%i3,	%g4
	membar	0x3D
loop_2862:
	edge32ln	%i5,	%i1,	%i0
	fnor	%f16,	%f26,	%f24
	brlz	%i6,	loop_2863
	tn	%icc,	0x3
	movg	%xcc,	%o1,	%o2
	edge16n	%l3,	%g5,	%i7
loop_2863:
	nop
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%g7
	tpos	%icc,	0x4
	movcc	%xcc,	%l1,	%o3
	andn	%i2,	%o7,	%i4
	set	0x4C, %l1
	ldswa	[%l7 + %l1] 0x04,	%l0
	flush	%l7 + 0x64
	swap	[%l7 + 0x60],	%o0
	orcc	%l5,	0x03DE,	%l2
	fba	%fcc1,	loop_2864
	faligndata	%f28,	%f8,	%f6
	tvc	%xcc,	0x4
	edge32n	%o5,	%o6,	%l4
loop_2864:
	fbule	%fcc2,	loop_2865
	fmovd	%f24,	%f20
	taddcctv	%g2,	%g1,	%g6
	edge8ln	%o4,	%g3,	%l6
loop_2865:
	umul	%i3,	0x0F7F,	%i5
	tpos	%icc,	0x0
	movl	%xcc,	%g4,	%i1
	sdivcc	%i0,	0x0BEF,	%o1
	umulcc	%i6,	%o2,	%g5
	tge	%xcc,	0x2
	fornot1s	%f15,	%f9,	%f24
	tle	%xcc,	0x4
	tsubcc	%i7,	%g7,	%l1
	edge16n	%l3,	%o3,	%i2
	nop
	setx	0xF7635937,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x7B1AC51F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f30,	%f6
	fpsub16s	%f27,	%f9,	%f1
	array16	%i4,	%l0,	%o7
	sth	%o0,	[%l7 + 0x5E]
	movcc	%icc,	%l5,	%l2
	fexpand	%f28,	%f0
	swap	[%l7 + 0x14],	%o5
	te	%xcc,	0x2
	fmuld8ulx16	%f14,	%f11,	%f30
	edge32l	%l4,	%g2,	%o6
	fmovsn	%xcc,	%f7,	%f31
	or	%g1,	%o4,	%g6
	mulx	%g3,	%i3,	%i5
	ldsb	[%l7 + 0x2F],	%g4
	or	%l6,	0x0F5D,	%i1
	movle	%xcc,	%o1,	%i6
	movcs	%xcc,	%i0,	%o2
	tge	%xcc,	0x0
	sll	%i7,	0x15,	%g7
	fmovda	%icc,	%f31,	%f24
	popc	0x0512,	%g5
	bpos,pn	%icc,	loop_2866
	or	%l3,	%l1,	%o3
	movrgz	%i4,	%l0,	%i2
	mova	%icc,	%o0,	%l5
loop_2866:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x0A] %asi,	%o7
	fbue	%fcc2,	loop_2867
	swap	[%l7 + 0x4C],	%o5
	ld	[%l7 + 0x64],	%f14
	tcs	%icc,	0x1
loop_2867:
	nop
	set	0x6E, %g1
	ldub	[%l7 + %g1],	%l2
	edge16	%g2,	%l4,	%g1
	movne	%xcc,	%o6,	%o4
	udiv	%g3,	0x1E9C,	%i3
	bn	%xcc,	loop_2868
	movneg	%icc,	%i5,	%g6
	movleu	%xcc,	%l6,	%g4
	tvc	%xcc,	0x0
loop_2868:
	sub	%i1,	%o1,	%i6
	tpos	%xcc,	0x4
	nop
	setx	0x8656ECB5B76CD04C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB65FC31E1E835F02,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f18,	%f8
	movrne	%o2,	%i0,	%g7
	bpos,pn	%icc,	loop_2869
	orcc	%g5,	%l3,	%l1
	movn	%xcc,	%o3,	%i4
	wr	%g0,	0xe3,	%asi
	stxa	%l0,	[%l7 + 0x70] %asi
	membar	#Sync
loop_2869:
	nop
	setx	0x5BF3B287,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xAF9DEBAD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f2,	%f4
	movvs	%icc,	%i2,	%i7
	fmovsvs	%xcc,	%f31,	%f14
	fmovsne	%xcc,	%f8,	%f11
	movgu	%icc,	%o0,	%l5
	edge32l	%o7,	%l2,	%o5
	tleu	%icc,	0x0
	tsubcc	%g2,	%l4,	%o6
	movvc	%icc,	%o4,	%g1
	fcmpne32	%f8,	%f18,	%i3
	smulcc	%i5,	%g6,	%g3
	fnands	%f6,	%f20,	%f9
	udiv	%g4,	0x026C,	%l6
	fbuge	%fcc1,	loop_2870
	sth	%o1,	[%l7 + 0x1E]
	movleu	%xcc,	%i6,	%i1
	tcc	%xcc,	0x1
loop_2870:
	udiv	%o2,	0x0451,	%i0
	fandnot1	%f2,	%f28,	%f16
	movre	%g5,	%g7,	%l1
	nop
	fitos	%f2,	%f17
	fstod	%f17,	%f10
	mulx	%l3,	0x0653,	%o3
	taddcc	%l0,	0x1295,	%i2
	fbg	%fcc2,	loop_2871
	srax	%i4,	%o0,	%l5
	sdivx	%o7,	0x0B16,	%i7
	lduw	[%l7 + 0x08],	%o5
loop_2871:
	pdist	%f4,	%f26,	%f10
	fbne	%fcc2,	loop_2872
	umulcc	%l2,	0x0890,	%l4
	tgu	%icc,	0x6
	andcc	%o6,	%o4,	%g2
loop_2872:
	fornot1s	%f19,	%f0,	%f0
	sethi	0x1FDE,	%i3
	tle	%xcc,	0x6
	fpack32	%f18,	%f8,	%f26
	movvs	%xcc,	%i5,	%g6
	fpmerge	%f11,	%f1,	%f28
	sub	%g1,	0x09E3,	%g4
	fba,a	%fcc0,	loop_2873
	tsubcc	%l6,	%g3,	%o1
	swap	[%l7 + 0x70],	%i6
	or	%i1,	0x09D2,	%o2
loop_2873:
	popc	0x1B7F,	%i0
	be,pn	%icc,	loop_2874
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%g5,	%f4,	%f28
	st	%f22,	[%l7 + 0x4C]
loop_2874:
	mulscc	%g7,	%l1,	%l3
	array16	%o3,	%l0,	%i2
	fnors	%f16,	%f13,	%f3
	taddcctv	%i4,	%l5,	%o0
	xnorcc	%i7,	0x01AD,	%o5
	fbn	%fcc0,	loop_2875
	and	%l2,	%l4,	%o6
	for	%f22,	%f22,	%f0
	movre	%o7,	%g2,	%i3
loop_2875:
	taddcctv	%o4,	0x0724,	%i5
	nop
	set	0x68, %o5
	prefetch	[%l7 + %o5],	 0x1
	nop
	setx	loop_2876,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%g1,	0x12CE,	%g4
	stw	%g6,	[%l7 + 0x30]
	nop
	setx	0x57436C6E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f30
loop_2876:
	tsubcc	%g3,	0x01D4,	%l6
	xnor	%i6,	%o1,	%o2
	move	%icc,	%i1,	%i0
	membar	0x39
	movvc	%xcc,	%g7,	%g5
	fba	%fcc0,	loop_2877
	udiv	%l3,	0x07ED,	%l1
	fmovdcs	%icc,	%f15,	%f3
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l0,	%o3
loop_2877:
	fmovrse	%i2,	%f1,	%f26
	fbg,a	%fcc3,	loop_2878
	edge8	%l5,	%o0,	%i7
	popc	%i4,	%l2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%o5
loop_2878:
	tsubcctv	%o6,	0x0A76,	%l4
	fabss	%f7,	%f15
	fnor	%f2,	%f24,	%f12
	sdivx	%o7,	0x12F4,	%g2
	stbar
	fmovdvc	%icc,	%f16,	%f24
	be,a,pn	%icc,	loop_2879
	ldub	[%l7 + 0x24],	%i3
	tgu	%icc,	0x6
	tsubcc	%o4,	%i5,	%g1
loop_2879:
	edge32n	%g4,	%g6,	%g3
	be,a,pt	%icc,	loop_2880
	andncc	%l6,	%o1,	%o2
	subccc	%i1,	0x1457,	%i6
	sdivx	%i0,	0x1C22,	%g7
loop_2880:
	mulscc	%g5,	0x1532,	%l1
	tsubcc	%l0,	%l3,	%o3
	orn	%i2,	%l5,	%i7
	movneg	%xcc,	%i4,	%l2
	array8	%o0,	%o5,	%o6
	tpos	%icc,	0x2
	tvc	%icc,	0x2
	fbul,a	%fcc1,	loop_2881
	fmovdcc	%xcc,	%f20,	%f30
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x70] %asi,	%f5
loop_2881:
	fmul8ulx16	%f24,	%f14,	%f28
	array32	%o7,	%g2,	%i3
	be,pn	%xcc,	loop_2882
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x66] %asi,	%o4
loop_2882:
	tpos	%xcc,	0x4
	movrlz	%i5,	%l4,	%g1
	membar	0x18
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f4
	smulcc	%g4,	0x1C2A,	%g3
	alignaddrl	%g6,	%l6,	%o1
	popc	%o2,	%i6
	fmovda	%icc,	%f4,	%f17
	movcs	%icc,	%i0,	%i1
	tsubcctv	%g7,	%l1,	%g5
	orn	%l0,	%l3,	%o3
	movne	%xcc,	%i2,	%i7
	fmovrdne	%l5,	%f24,	%f18
	lduw	[%l7 + 0x68],	%i4
	fpadd16	%f8,	%f30,	%f12
	fpsub32s	%f18,	%f2,	%f3
	sir	0x1802
	andcc	%l2,	%o0,	%o6
	movne	%xcc,	%o5,	%o7
	fxnor	%f16,	%f6,	%f4
	fnot2	%f30,	%f24
	array8	%g2,	%i3,	%o4
	movl	%icc,	%l4,	%i5
	brlz	%g1,	loop_2883
	fmovdg	%icc,	%f5,	%f7
	fcmpne32	%f18,	%f12,	%g3
	fpadd32	%f8,	%f24,	%f0
loop_2883:
	fmovsle	%icc,	%f13,	%f30
	mulx	%g4,	0x0ABB,	%l6
	set	0x78, %o4
	prefetcha	[%l7 + %o4] 0x81,	 0x2
	alignaddrl	%o2,	%i6,	%i0
	xnor	%o1,	0x1DDC,	%g7
	movgu	%xcc,	%l1,	%g5
	orn	%l0,	0x0B31,	%i1
	be,pt	%icc,	loop_2884
	mova	%icc,	%o3,	%i2
	tsubcc	%l3,	%i7,	%l5
	nop
	setx loop_2885, %l0, %l1
	jmpl %l1, %l2
loop_2884:
	array32	%i4,	%o6,	%o5
	fandnot1s	%f24,	%f31,	%f8
	tleu	%xcc,	0x4
loop_2885:
	addcc	%o7,	%g2,	%o0
	fmovde	%xcc,	%f26,	%f14
	fors	%f8,	%f0,	%f17
	tsubcc	%o4,	0x1DE9,	%l4
	sllx	%i5,	%g1,	%g3
	movn	%xcc,	%g4,	%l6
	tcc	%icc,	0x6
	edge16ln	%i3,	%o2,	%i6
	brgz,a	%i0,	loop_2886
	tsubcc	%o1,	%g6,	%l1
	fmovdleu	%icc,	%f20,	%f19
	popc	%g7,	%l0
loop_2886:
	fbg	%fcc2,	loop_2887
	movleu	%icc,	%i1,	%o3
	fandnot2	%f26,	%f6,	%f16
	bleu,pn	%icc,	loop_2888
loop_2887:
	addc	%g5,	0x1587,	%i2
	udivcc	%i7,	0x162F,	%l5
	movle	%icc,	%l3,	%l2
loop_2888:
	movg	%icc,	%i4,	%o6
	edge16ln	%o7,	%g2,	%o5
	tn	%icc,	0x7
	nop
	setx	loop_2889,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x0637C061,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f9
	tcc	%icc,	0x3
	movrlz	%o4,	0x097,	%o0
loop_2889:
	fmovscc	%icc,	%f12,	%f24
	edge8l	%l4,	%i5,	%g3
	nop
	fitod	%f25,	%f26
	tge	%icc,	0x3
	array32	%g4,	%l6,	%g1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	sir	0x02D4
	move	%xcc,	%i6,	%o2
	tpos	%xcc,	0x6
	bcs	%icc,	loop_2890
	subcc	%i0,	%o1,	%l1
	alignaddr	%g6,	%g7,	%i1
	fpsub32s	%f19,	%f4,	%f20
loop_2890:
	nop
	setx	loop_2891,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fexpand	%f3,	%f14
	fxnor	%f8,	%f24,	%f30
	te	%xcc,	0x2
loop_2891:
	brnz,a	%o3,	loop_2892
	fone	%f2
	fmovrslez	%g5,	%f5,	%f2
	set	0x30, %i5
	lduwa	[%l7 + %i5] 0x04,	%l0
loop_2892:
	movn	%icc,	%i7,	%l5
	addc	%i2,	0x0DC7,	%l3
	nop
	setx	0x7DE414B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x4ED711C8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f29,	%f26
	and	%l2,	%o6,	%i4
	movleu	%icc,	%o7,	%o5
	fmovsvs	%xcc,	%f23,	%f16
	movcs	%xcc,	%o4,	%o0
	move	%xcc,	%g2,	%l4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%g3,	%i5
	andncc	%l6,	%g4,	%i3
	edge16l	%i6,	%g1,	%o2
	movge	%icc,	%o1,	%i0
	fcmpne16	%f26,	%f22,	%g6
	movcs	%icc,	%l1,	%i1
	fmovdg	%icc,	%f23,	%f0
	srlx	%o3,	%g7,	%g5
	and	%i7,	0x04B8,	%l5
	fmovsvc	%xcc,	%f2,	%f10
	andncc	%l0,	%i2,	%l2
	xnorcc	%o6,	%l3,	%o7
	sll	%o5,	%i4,	%o0
	fbge,a	%fcc1,	loop_2893
	movpos	%icc,	%g2,	%l4
	fmuld8ulx16	%f6,	%f13,	%f14
	xor	%g3,	%i5,	%l6
loop_2893:
	srl	%o4,	%g4,	%i6
	edge32	%g1,	%o2,	%i3
	xnor	%o1,	%g6,	%i0
	smulcc	%i1,	0x1EED,	%l1
	fbl,a	%fcc2,	loop_2894
	movne	%icc,	%o3,	%g7
	movpos	%xcc,	%i7,	%g5
	taddcc	%l5,	%i2,	%l0
loop_2894:
	movrlez	%o6,	0x255,	%l3
	nop
	fitos	%f16,	%f14
	movpos	%icc,	%l2,	%o7
	nop
	setx loop_2895, %l0, %l1
	jmpl %l1, %i4
	nop
	setx	0x6008F73F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f2
	fmovdne	%icc,	%f26,	%f18
	srax	%o5,	0x19,	%g2
loop_2895:
	nop
	set	0x78, %i4
	ldswa	[%l7 + %i4] 0x80,	%o0
	set	0x6A, %i7
	ldstuba	[%l7 + %i7] 0x11,	%l4
	sdiv	%g3,	0x1603,	%i5
	bpos,a,pn	%xcc,	loop_2896
	udiv	%o4,	0x1177,	%l6
	edge8l	%g4,	%g1,	%o2
	movleu	%icc,	%i3,	%i6
loop_2896:
	fmovsgu	%icc,	%f31,	%f21
	edge16l	%g6,	%i0,	%o1
	sra	%l1,	0x12,	%i1
	taddcctv	%g7,	0x11D4,	%i7
	sth	%g5,	[%l7 + 0x74]
	nop
	setx	0x505F3281,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	sra	%o3,	%l5,	%l0
	stx	%i2,	[%l7 + 0x40]
	fmovdcc	%icc,	%f7,	%f29
	udiv	%o6,	0x1B4E,	%l2
	fbl	%fcc2,	loop_2897
	te	%icc,	0x2
	andn	%l3,	0x0E98,	%i4
	orn	%o7,	%g2,	%o0
loop_2897:
	edge32l	%o5,	%l4,	%g3
	tge	%icc,	0x4
	nop
	setx	0x0FAE82A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f28
	fpackfix	%f26,	%f14
	sdivx	%o4,	0x02E7,	%i5
	movrne	%g4,	%l6,	%o2
	fmovsvc	%xcc,	%f29,	%f5
	sdivcc	%g1,	0x1ECA,	%i3
	edge32n	%g6,	%i6,	%o1
	tcs	%xcc,	0x5
	or	%l1,	0x0A19,	%i0
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf9,	%f0
	bpos,pn	%xcc,	loop_2898
	std	%f12,	[%l7 + 0x38]
	tcs	%icc,	0x4
	smul	%g7,	%i1,	%g5
loop_2898:
	fbo	%fcc2,	loop_2899
	nop
	setx loop_2900, %l0, %l1
	jmpl %l1, %o3
	fbue	%fcc1,	loop_2901
	addc	%l5,	%i7,	%l0
loop_2899:
	ble,pt	%icc,	loop_2902
loop_2900:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2901:
	movneg	%icc,	%o6,	%l2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%i2
loop_2902:
	fmovsn	%xcc,	%f26,	%f1
	bn,a	%icc,	loop_2903
	srl	%l3,	%o7,	%i4
	nop
	setx loop_2904, %l0, %l1
	jmpl %l1, %g2
	srlx	%o0,	0x07,	%o5
loop_2903:
	umulcc	%l4,	%g3,	%o4
	bn,a	%icc,	loop_2905
loop_2904:
	edge16ln	%i5,	%g4,	%l6
	membar	0x68
	edge32n	%o2,	%i3,	%g6
loop_2905:
	fmovse	%xcc,	%f8,	%f25
	subcc	%i6,	%o1,	%l1
	movrne	%i0,	%g7,	%g1
	fmuld8sux16	%f25,	%f11,	%f12
	edge32l	%g5,	%o3,	%l5
	fbg	%fcc0,	loop_2906
	tcs	%xcc,	0x3
	nop
	setx	loop_2907,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%i1,	%l0,	%i7
loop_2906:
	srlx	%l2,	%i2,	%o6
	fmovdpos	%xcc,	%f11,	%f25
loop_2907:
	stbar
	fbn,a	%fcc3,	loop_2908
	fandnot1	%f22,	%f24,	%f8
	tvs	%icc,	0x4
	call	loop_2909
loop_2908:
	ldsb	[%l7 + 0x2A],	%o7
	fbge	%fcc0,	loop_2910
	ld	[%l7 + 0x48],	%f29
loop_2909:
	xnor	%i4,	0x118B,	%g2
	tvc	%icc,	0x0
loop_2910:
	brgez	%l3,	loop_2911
	bne,a,pn	%icc,	loop_2912
	edge32l	%o5,	%l4,	%o0
	fmovdne	%xcc,	%f19,	%f5
loop_2911:
	fbuge	%fcc2,	loop_2913
loop_2912:
	sll	%o4,	0x0F,	%i5
	ldub	[%l7 + 0x0A],	%g3
	movvc	%icc,	%l6,	%o2
loop_2913:
	taddcctv	%g4,	%g6,	%i3
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x1e
	membar	#Sync
	sth	%o1,	[%l7 + 0x56]
	tneg	%icc,	0x0
	edge32	%i6,	%l1,	%g7
	fmovse	%icc,	%f11,	%f19
	mulx	%g1,	%g5,	%o3
	fnot2	%f30,	%f26
	sub	%l5,	%i0,	%i1
	popc	%i7,	%l2
	edge16ln	%i2,	%o6,	%o7
	tneg	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%l0
	tneg	%icc,	0x2
	ta	%xcc,	0x4
	tn	%xcc,	0x2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x70] %asi,	%i4
	ldub	[%l7 + 0x4E],	%g2
	movge	%xcc,	%l3,	%o5
	fxnors	%f27,	%f30,	%f23
	movrgz	%l4,	%o0,	%i5
	srl	%o4,	%g3,	%l6
	ldd	[%l7 + 0x18],	%f4
	orncc	%o2,	%g4,	%i3
	sllx	%o1,	0x0F,	%i6
	nop
	setx	0x9072B2CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x14,	%f0
	bl,pt	%xcc,	loop_2914
	tvc	%xcc,	0x3
	brlz,a	%g6,	loop_2915
	umul	%g7,	0x01C4,	%l1
loop_2914:
	srax	%g5,	0x10,	%g1
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7C] %asi,	%o3
loop_2915:
	tpos	%xcc,	0x3
	subcc	%i0,	0x0DCA,	%i1
	sra	%l5,	0x00,	%l2
	fnot2s	%f19,	%f18
	andncc	%i7,	%i2,	%o6
	fbn,a	%fcc0,	loop_2916
	xor	%l0,	0x08F1,	%i4
	tle	%icc,	0x0
	movcc	%icc,	%o7,	%g2
loop_2916:
	movgu	%icc,	%o5,	%l4
	movl	%icc,	%l3,	%o0
	sdivcc	%o4,	0x058C,	%g3
	edge8n	%l6,	%i5,	%g4
	fpackfix	%f2,	%f4
	fmovsg	%xcc,	%f1,	%f12
	nop
	setx	0xBD9879B00A4CD40B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x8FEC356275AF8E94,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f18,	%f20
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
	fsrc2	%f2,	%f18
	fbul,a	%fcc0,	loop_2918
	taddcctv	%o2,	%i3,	%o1
loop_2917:
	flush	%l7 + 0x08
	fornot1s	%f17,	%f23,	%f28
loop_2918:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x38] %asi,	%f7
	fba,a	%fcc3,	loop_2919
	fmovscc	%xcc,	%f5,	%f21
	tvs	%icc,	0x0
	set	0x1A, %i3
	ldstuba	[%l7 + %i3] 0x19,	%g6
loop_2919:
	addccc	%i6,	0x1B8A,	%l1
	add	%g5,	0x16B3,	%g1
	subccc	%g7,	0x0D1B,	%i0
	edge8	%o3,	%l5,	%l2
	ba,a	loop_2920
	fsrc2	%f30,	%f28
	tcs	%xcc,	0x2
	stbar
loop_2920:
	membar	0x6D
	tg	%xcc,	0x7
	fmovdneg	%icc,	%f19,	%f31
	srlx	%i7,	0x12,	%i2
	fpmerge	%f8,	%f26,	%f20
	edge8l	%o6,	%i1,	%i4
	edge16ln	%l0,	%g2,	%o7
	edge32	%o5,	%l3,	%l4
	fcmple32	%f12,	%f22,	%o0
	tvc	%xcc,	0x3
	srax	%o4,	%l6,	%i5
	alignaddr	%g3,	%o2,	%g4
	xnorcc	%i3,	0x1E0B,	%g6
	wr	%g0,	0xea,	%asi
	stba	%o1,	[%l7 + 0x77] %asi
	membar	#Sync
	sdivx	%i6,	0x0C06,	%g5
	mulscc	%g1,	0x0641,	%g7
	alignaddr	%l1,	%i0,	%l5
	addcc	%l2,	%o3,	%i2
	set	0x68, %g7
	sta	%f4,	[%l7 + %g7] 0x88
	fmovsne	%xcc,	%f26,	%f1
	ldsb	[%l7 + 0x13],	%i7
	fmovdcc	%icc,	%f27,	%f0
	tleu	%icc,	0x4
	call	loop_2921
	movgu	%icc,	%o6,	%i1
	umul	%l0,	%g2,	%i4
	udivcc	%o7,	0x0F6F,	%l3
loop_2921:
	fbl	%fcc2,	loop_2922
	brlz	%l4,	loop_2923
	call	loop_2924
	fbo,a	%fcc2,	loop_2925
loop_2922:
	movg	%xcc,	%o5,	%o4
loop_2923:
	array16	%o0,	%i5,	%l6
loop_2924:
	sra	%o2,	0x19,	%g4
loop_2925:
	tn	%icc,	0x1
	fmovrdlez	%i3,	%f2,	%f24
	orn	%g6,	%o1,	%i6
	array8	%g3,	%g5,	%g1
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
	taddcc	%i0,	0x0551,	%l1
	fcmpeq32	%f2,	%f4,	%l2
	bne,pt	%xcc,	loop_2926
	fmovrdne	%o3,	%f0,	%f24
	movre	%l5,	%i2,	%i7
	or	%o6,	%l0,	%i1
loop_2926:
	nop
	fitod	%f6,	%f10
	fdtoi	%f10,	%f21
	tn	%icc,	0x3
	udiv	%i4,	0x17B0,	%g2
	movcs	%xcc,	%o7,	%l4
	array8	%l3,	%o4,	%o5
	movge	%xcc,	%i5,	%o0
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l6
	fcmpeq32	%f26,	%f26,	%g4
	ld	[%l7 + 0x18],	%f17
	nop
	fitos	%f4,	%f13
	fstox	%f13,	%f26
	fxtos	%f26,	%f12
	taddcc	%o2,	0x0765,	%i3
	sdivx	%o1,	0x1658,	%g6
	wr	%g0,	0x80,	%asi
	sta	%f1,	[%l7 + 0x4C] %asi
	udiv	%i6,	0x15D4,	%g5
	set	0x24, %i0
	ldstuba	[%l7 + %i0] 0x89,	%g3
	fandnot1s	%f19,	%f18,	%f12
	fmul8x16al	%f28,	%f28,	%f28
	subccc	%g1,	0x03A4,	%g7
	call	loop_2927
	orcc	%l1,	0x1D76,	%l2
	addc	%o3,	0x0860,	%l5
	set	0x1E, %g6
	lduha	[%l7 + %g6] 0x80,	%i2
loop_2927:
	subc	%i0,	0x0EB4,	%i7
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%o6
	movl	%xcc,	%i1,	%i4
	fmuld8ulx16	%f2,	%f12,	%f14
	fbn	%fcc1,	loop_2928
	fone	%f18
	tvs	%xcc,	0x4
	fmovspos	%xcc,	%f21,	%f25
loop_2928:
	nop
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x81,	%g2
	sir	0x0006
	fzeros	%f10
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	bn	%xcc,	loop_2929
	nop
	setx loop_2930, %l0, %l1
	jmpl %l1, %o7
	bneg,a,pt	%icc,	loop_2931
	tl	%icc,	0x3
loop_2929:
	fnors	%f13,	%f2,	%f19
loop_2930:
	brz	%l0,	loop_2932
loop_2931:
	sdivx	%l3,	0x124B,	%o4
	bvc,a,pt	%icc,	loop_2933
	sub	%o5,	0x184E,	%l4
loop_2932:
	st	%f23,	[%l7 + 0x0C]
	movcc	%icc,	%o0,	%i5
loop_2933:
	nop
	setx	0x9F47FB5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f15
	fcmple32	%f2,	%f8,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g4,	%i3
	andn	%o1,	%g6,	%o2
	fnor	%f26,	%f16,	%f0
	fzeros	%f26
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
	edge16n	%g5,	%g3,	%g7
	udivx	%l1,	0x10D4,	%l2
	fmovdle	%xcc,	%f1,	%f7
	fandnot2s	%f7,	%f24,	%f11
	nop
	set	0x44, %l5
	stb	%g1,	[%l7 + %l5]
	sdivx	%l5,	0x0360,	%o3
	tvc	%xcc,	0x4
	swap	[%l7 + 0x64],	%i2
	tl	%xcc,	0x0
	ta	%icc,	0x6
	tcs	%icc,	0x1
	lduw	[%l7 + 0x30],	%i0
	movn	%xcc,	%o6,	%i7
	st	%f11,	[%l7 + 0x10]
	tvc	%icc,	0x2
	set	0x74, %o7
	lda	[%l7 + %o7] 0x80,	%f15
	sdiv	%i4,	0x038A,	%g2
	fmuld8ulx16	%f4,	%f5,	%f24
	tne	%icc,	0x7
	ldsh	[%l7 + 0x0C],	%i1
	tgu	%xcc,	0x2
	fmovdcc	%icc,	%f14,	%f8
	tcs	%icc,	0x4
	sll	%o7,	%l0,	%l3
	fbo	%fcc0,	loop_2934
	fbg	%fcc2,	loop_2935
	te	%xcc,	0x7
	set	0x0C, %o6
	stha	%o5,	[%l7 + %o6] 0x23
	membar	#Sync
loop_2934:
	tne	%icc,	0x3
loop_2935:
	fbu	%fcc1,	loop_2936
	ldsw	[%l7 + 0x0C],	%l4
	edge16ln	%o0,	%o4,	%l6
	movpos	%xcc,	%i5,	%i3
loop_2936:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o1,	%g6,	%o2
	edge32ln	%g4,	%i6,	%g5
	alignaddr	%g3,	%g7,	%l1
	swap	[%l7 + 0x70],	%g1
	ldd	[%l7 + 0x58],	%f10
	fmul8x16	%f23,	%f28,	%f24
	udivcc	%l2,	0x0C78,	%l5
	alignaddr	%i2,	%i0,	%o6
	or	%o3,	%i4,	%i7
	and	%i1,	0x0203,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l0,	%l3,	%g2
	movle	%icc,	%o5,	%l4
	movleu	%icc,	%o0,	%o4
	mulscc	%l6,	%i5,	%o1
	sdivcc	%g6,	0x09CB,	%o2
	fornot2s	%f24,	%f5,	%f12
	fmovdvc	%icc,	%f1,	%f30
	std	%f22,	[%l7 + 0x68]
	set	0x4C, %o0
	stwa	%i3,	[%l7 + %o0] 0x2f
	membar	#Sync
	edge8	%g4,	%i6,	%g3
	movvc	%xcc,	%g5,	%g7
	addc	%l1,	%g1,	%l2
	taddcc	%i2,	%i0,	%o6
	sir	0x1FD2
	nop
	setx	loop_2937,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umulcc	%o3,	0x1057,	%l5
	fxnor	%f18,	%f30,	%f14
	fba,a	%fcc0,	loop_2938
loop_2937:
	taddcc	%i7,	%i1,	%o7
	umul	%l0,	%i4,	%g2
	fmovsgu	%icc,	%f5,	%f1
loop_2938:
	fmovsge	%icc,	%f27,	%f19
	taddcctv	%o5,	0x0297,	%l3
	umul	%o0,	%l4,	%l6
	edge16l	%o4,	%i5,	%o1
	tvs	%xcc,	0x3
	srl	%o2,	%g6,	%g4
	brnz	%i6,	loop_2939
	movg	%icc,	%g3,	%g5
	edge16ln	%i3,	%l1,	%g1
	orn	%g7,	0x1ECA,	%i2
loop_2939:
	tge	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x70] %asi,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg	loop_2940
	popc	0x1508,	%l2
	movn	%xcc,	%o6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2940:
	bvs,a,pt	%icc,	loop_2941
	edge32	%l5,	%i1,	%o7
	addccc	%i7,	0x1D16,	%l0
	mulx	%g2,	0x0D1B,	%o5
loop_2941:
	fbug	%fcc2,	loop_2942
	bvc,a,pn	%xcc,	loop_2943
	xor	%i4,	%l3,	%o0
	movvs	%xcc,	%l4,	%o4
loop_2942:
	nop
	setx	0xF4C84D9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xD79C122F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f21,	%f19
loop_2943:
	fnors	%f30,	%f18,	%f22
	edge8l	%i5,	%l6,	%o2
	fblg	%fcc0,	loop_2944
	fmovdg	%xcc,	%f13,	%f10
	edge16	%o1,	%g4,	%i6
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g3
loop_2944:
	andncc	%g6,	%i3,	%l1
	orncc	%g1,	0x1282,	%g5
	bg,a	loop_2945
	nop
	fitos	%f14,	%f23
	fstox	%f23,	%f20
	fxtos	%f20,	%f31
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x16,	%f0
loop_2945:
	subc	%i2,	0x031F,	%i0
	movrlz	%l2,	%o6,	%o3
	add	%g7,	%l5,	%o7
	lduh	[%l7 + 0x48],	%i1
	tsubcc	%l0,	0x070F,	%g2
	subc	%o5,	0x1085,	%i7
	movleu	%icc,	%l3,	%o0
	fbg	%fcc3,	loop_2946
	bvs,a,pt	%xcc,	loop_2947
	popc	0x0924,	%l4
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2946:
	tge	%xcc,	0x6
loop_2947:
	edge8l	%o4,	%i5,	%i4
	movg	%icc,	%o2,	%l6
	nop
	fitos	%f4,	%f11
	fstox	%f11,	%f16
	udivx	%o1,	0x13FC,	%i6
	tn	%xcc,	0x7
	xnor	%g3,	%g6,	%g4
	fmul8x16	%f31,	%f24,	%f28
	wr	%g0,	0x27,	%asi
	stha	%i3,	[%l7 + 0x5E] %asi
	membar	#Sync
	fmovdvs	%icc,	%f16,	%f17
	fmovspos	%icc,	%f28,	%f1
	sdivx	%l1,	0x0A92,	%g5
	alignaddrl	%g1,	%i0,	%l2
	tsubcc	%o6,	0x0B12,	%o3
	addcc	%g7,	%l5,	%i2
	tge	%xcc,	0x5
	set	0x30, %g5
	ldda	[%l7 + %g5] 0x19,	%i0
	subccc	%o7,	0x023A,	%l0
	tn	%xcc,	0x5
	and	%g2,	0x1E35,	%o5
	movl	%icc,	%l3,	%o0
	st	%f28,	[%l7 + 0x24]
	tneg	%xcc,	0x1
	bcs,pn	%icc,	loop_2948
	bcc	%icc,	loop_2949
	nop
	setx	0xBFB3517377A68A14,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB8588595F47C5C03,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f18,	%f6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x18] %asi,	%l4
loop_2948:
	fbu,a	%fcc3,	loop_2950
loop_2949:
	smulcc	%i7,	%i5,	%o4
	tsubcc	%i4,	0x1F93,	%l6
	fmovdpos	%icc,	%f29,	%f18
loop_2950:
	st	%f11,	[%l7 + 0x74]
	edge8n	%o1,	%o2,	%g3
	edge32l	%g6,	%g4,	%i3
	nop
	fitos	%f11,	%f7
	fstox	%f7,	%f16
	fxtos	%f16,	%f28
	movvc	%icc,	%i6,	%l1
	bgu,pt	%xcc,	loop_2951
	subccc	%g5,	0x0B6C,	%i0
	sir	0x09E9
	movcc	%icc,	%g1,	%o6
loop_2951:
	sub	%o3,	%g7,	%l5
	fmovrslz	%l2,	%f5,	%f14
	edge16	%i2,	%o7,	%i1
	wr	%g0,	0x18,	%asi
	stwa	%g2,	[%l7 + 0x58] %asi
	fmuld8sux16	%f19,	%f20,	%f12
	fmovsne	%icc,	%f29,	%f22
	tvc	%icc,	0x0
	addc	%l0,	0x1A37,	%o5
	bvs,pt	%xcc,	loop_2952
	nop
	set	0x49, %i6
	ldub	[%l7 + %i6],	%l3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
loop_2952:
	taddcc	%i7,	0x148F,	%o0
	lduh	[%l7 + 0x2A],	%o4
	fbug,a	%fcc2,	loop_2953
	orn	%i5,	%l6,	%o1
	bge,a	loop_2954
	xnorcc	%o2,	%g3,	%g6
loop_2953:
	call	loop_2955
	nop
	setx	0xC3D6B98D90C6FCE7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x9A0ACEC3ACA7D5DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f10,	%f10
loop_2954:
	srl	%i4,	%i3,	%g4
	call	loop_2956
loop_2955:
	mulscc	%i6,	0x0AB4,	%g5
	bne,pt	%xcc,	loop_2957
	fnegd	%f4,	%f24
loop_2956:
	fmovdg	%xcc,	%f7,	%f20
	alignaddr	%l1,	%g1,	%o6
loop_2957:
	xorcc	%i0,	%o3,	%g7
	fnors	%f29,	%f20,	%f14
	fpsub16	%f20,	%f2,	%f26
	nop
	set	0x40, %g4
	stb	%l5,	[%l7 + %g4]
	fmovsneg	%xcc,	%f22,	%f26
	tg	%xcc,	0x5
	sir	0x05EA
	subc	%l2,	%i2,	%o7
	fmovsleu	%icc,	%f7,	%f12
	taddcc	%i1,	0x03CC,	%l0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x25] %asi,	%o5
	sdivx	%g2,	0x148B,	%l3
	orn	%i7,	%l4,	%o0
	srlx	%o4,	%i5,	%l6
	and	%o1,	0x0819,	%g3
	srlx	%g6,	0x12,	%i4
	fpadd16s	%f5,	%f7,	%f14
	movcc	%icc,	%o2,	%g4
	bl,a	%xcc,	loop_2958
	fmovsgu	%xcc,	%f12,	%f2
	tneg	%xcc,	0x2
	smulcc	%i3,	%i6,	%l1
loop_2958:
	movn	%icc,	%g5,	%g1
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f14
	fxtod	%f14,	%f14
	fbg,a	%fcc2,	loop_2959
	popc	0x1333,	%i0
	fsrc2	%f14,	%f26
	fbe,a	%fcc0,	loop_2960
loop_2959:
	andcc	%o6,	0x1AE1,	%o3
	prefetch	[%l7 + 0x1C],	 0x1
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x18
loop_2960:
	addc	%g7,	0x1551,	%l2
	bcs,pn	%icc,	loop_2961
	fmovsne	%icc,	%f10,	%f29
	te	%xcc,	0x7
	tge	%xcc,	0x5
loop_2961:
	srlx	%l5,	0x03,	%o7
	fmovdneg	%xcc,	%f18,	%f1
	orcc	%i2,	%l0,	%i1
	movleu	%xcc,	%o5,	%g2
	movl	%icc,	%i7,	%l4
	sra	%o0,	0x1B,	%o4
	orn	%l3,	%i5,	%l6
	addcc	%o1,	%g6,	%i4
	tgu	%xcc,	0x7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o2,	%g4
	fcmple16	%f8,	%f18,	%g3
	tge	%xcc,	0x0
	set	0x40, %l3
	prefetcha	[%l7 + %l3] 0x89,	 0x2
	nop
	fitod	%f8,	%f12
	fdtos	%f12,	%f5
	tgu	%icc,	0x4
	bne,pt	%icc,	loop_2962
	edge32n	%l1,	%i6,	%g1
	udivx	%i0,	0x1F1F,	%o6
	tcs	%xcc,	0x0
loop_2962:
	bcc	loop_2963
	taddcctv	%g5,	%g7,	%o3
	stb	%l5,	[%l7 + 0x62]
	fpack32	%f24,	%f30,	%f10
loop_2963:
	tgu	%icc,	0x1
	subc	%l2,	%o7,	%i2
	edge8ln	%i1,	%l0,	%o5
	array32	%i7,	%g2,	%o0
	tvc	%xcc,	0x5
	nop
	setx	loop_2964,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitos	%f2,	%f1
	fstod	%f1,	%f26
	movg	%xcc,	%l4,	%o4
	smulcc	%l3,	0x0CBE,	%i5
loop_2964:
	tn	%xcc,	0x6
	ldsb	[%l7 + 0x58],	%l6
	ba,pt	%icc,	loop_2965
	movge	%icc,	%g6,	%o1
	umul	%i4,	0x1C86,	%g4
	tvs	%xcc,	0x7
loop_2965:
	fpack16	%f0,	%f1
	srax	%g3,	%o2,	%i3
	move	%icc,	%l1,	%g1
	fbue,a	%fcc0,	loop_2966
	tvs	%xcc,	0x5
	edge32	%i0,	%o6,	%i6
	andncc	%g7,	%o3,	%l5
loop_2966:
	movneg	%icc,	%g5,	%l2
	add	%i2,	%o7,	%i1
	fbl	%fcc3,	loop_2967
	edge16	%o5,	%i7,	%g2
	fble	%fcc0,	loop_2968
	fabsd	%f12,	%f14
loop_2967:
	fbn,a	%fcc2,	loop_2969
	addc	%o0,	0x1F39,	%l0
loop_2968:
	move	%icc,	%l4,	%l3
	fbug	%fcc3,	loop_2970
loop_2969:
	fones	%f7
	sub	%o4,	%i5,	%l6
	nop
	setx	0xFFCD1127E047B3D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_2970:
	bleu	loop_2971
	pdist	%f18,	%f22,	%f14
	edge32l	%g6,	%i4,	%g4
	edge32l	%g3,	%o1,	%o2
loop_2971:
	tle	%xcc,	0x2
	add	%l1,	0x003D,	%g1
	fnor	%f24,	%f2,	%f22
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x70] %asi,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o6,	0x17C9,	%i0
	fmovdl	%xcc,	%f27,	%f10
	brgez,a	%i6,	loop_2972
	nop
	setx	0x19B72C78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xF9FA9505,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f13,	%f4
	edge8ln	%o3,	%g7,	%g5
	nop
	setx	0xE07CC289,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
loop_2972:
	addcc	%l2,	0x140F,	%l5
	fone	%f22
	fpsub16	%f10,	%f20,	%f16
	bne,a,pt	%icc,	loop_2973
	fmovrsgez	%i2,	%f9,	%f3
	subccc	%o7,	%o5,	%i7
	te	%xcc,	0x6
loop_2973:
	fpsub16s	%f25,	%f31,	%f13
	fpadd32	%f12,	%f4,	%f14
	fcmpne32	%f28,	%f28,	%i1
	fsrc2	%f30,	%f10
	movgu	%xcc,	%o0,	%l0
	fmovrdgz	%g2,	%f4,	%f2
	array16	%l3,	%o4,	%i5
	tge	%xcc,	0x6
	and	%l4,	%g6,	%l6
	edge16ln	%g4,	%i4,	%g3
	movpos	%icc,	%o2,	%l1
	membar	0x30
	fmul8ulx16	%f16,	%f12,	%f28
	alignaddrl	%g1,	%i3,	%o6
	tl	%xcc,	0x5
	and	%i0,	%i6,	%o3
	srax	%g7,	0x11,	%o1
	smulcc	%g5,	%l2,	%i2
	edge8l	%l5,	%o5,	%o7
	fbe,a	%fcc1,	loop_2974
	andncc	%i1,	%o0,	%l0
	srax	%i7,	%l3,	%o4
	mulx	%g2,	%l4,	%i5
loop_2974:
	sir	0x1C5B
	tn	%xcc,	0x5
	nop
	set	0x24, %l6
	lduh	[%l7 + %l6],	%l6
	andn	%g4,	%i4,	%g3
	edge16ln	%o2,	%g6,	%g1
	mulscc	%i3,	0x1738,	%l1
	movpos	%xcc,	%i0,	%o6
	fbe	%fcc2,	loop_2975
	fbo,a	%fcc3,	loop_2976
	movl	%icc,	%i6,	%o3
	addccc	%g7,	%o1,	%g5
loop_2975:
	brgez	%l2,	loop_2977
loop_2976:
	fpmerge	%f16,	%f25,	%f12
	srlx	%i2,	0x1D,	%l5
	fands	%f9,	%f28,	%f31
loop_2977:
	umulcc	%o5,	%i1,	%o0
	subcc	%l0,	%o7,	%l3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o4
	fpadd32s	%f22,	%f22,	%f10
	nop
	setx	loop_2978,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%xcc,	0x1
	srlx	%g2,	%l4,	%i7
	fbuge	%fcc1,	loop_2979
loop_2978:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f18,	%f10
	orn	%i5,	0x186B,	%l6
loop_2979:
	nop
	fitos	%f1,	%f22
	fstox	%f22,	%f22
	andcc	%g4,	0x0D1C,	%g3
	te	%icc,	0x7
	movrgez	%o2,	0x262,	%i4
	brnz	%g6,	loop_2980
	nop
	setx loop_2981, %l0, %l1
	jmpl %l1, %i3
	nop
	setx	0xB628FC05604B62D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	nop
	setx	loop_2982,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2980:
	edge8l	%l1,	%g1,	%i0
loop_2981:
	lduh	[%l7 + 0x38],	%i6
	edge8ln	%o3,	%g7,	%o6
loop_2982:
	st	%f4,	[%l7 + 0x6C]
	fone	%f20
	movneg	%icc,	%o1,	%g5
	fmovrslez	%i2,	%f11,	%f24
	fmul8x16	%f29,	%f10,	%f24
	fmovsn	%xcc,	%f21,	%f1
	nop
	fitos	%f31,	%f24
	fpsub32s	%f0,	%f26,	%f13
	fbue,a	%fcc1,	loop_2983
	fbo	%fcc2,	loop_2984
	nop
	fitod	%f0,	%f4
	fdtox	%f4,	%f4
	fpadd32	%f2,	%f8,	%f10
loop_2983:
	movpos	%icc,	%l2,	%l5
loop_2984:
	srl	%i1,	0x19,	%o0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2864
!	Type x   	: 1242
!	Type cti   	: 2984
!	Type f   	: 4482
!	Type i   	: 13428
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xC4352C68
.word 0xEEB62A71
.word 0xDD67943E
.word 0xFDFCE070
.word 0xA8C37032
.word 0xD4CCF178
.word 0x660719B9
.word 0xFE263AAE
.word 0xACA0FEEA
.word 0xC0DEBE83
.word 0xC5586617
.word 0x5470C3FB
.word 0xBFA92E25
.word 0x17DD71CA
.word 0xD93535D6
.word 0xB654CB60
.word 0x52AAD8CE
.word 0xA858728E
.word 0xBB3722E0
.word 0xBAEB29D1
.word 0xA00E085B
.word 0x7F6370D5
.word 0x59722A50
.word 0x392CCCB9
.word 0x1C3244BD
.word 0xC086EE6C
.word 0x4F4985E5
.word 0x50C2F8D3
.word 0x93C18CFA
.word 0x9BFD47B2
.word 0x41A96E58
.word 0xB5CBFB12
.word 0xA41D679D
.word 0xE698CEB4
.word 0x77711342
.word 0xE4FA537A
.word 0x753B8E7D
.word 0x14E66067
.word 0xADB7FF2E
.word 0xFF909307
.word 0x7C1122A2
.word 0x1FC476F4
.word 0x47DA69AF
.word 0x5528A6D9
.word 0x6053E02E
.word 0x4387E288
.word 0x569C27A5
.word 0x4188C993
.word 0x2F3BD2E3
.word 0x64E83A1A
.word 0x89125B60
.word 0x75D438C8
.word 0xD5D30E65
.word 0xE7A2F51F
.word 0xC75A6AA8
.word 0x0BB2B720
.word 0x708BF81A
.word 0xCB229F41
.word 0xF278AA3F
.word 0xADBE2733
.word 0x90DAEC8A
.word 0x411359E7
.word 0x61227B8F
.word 0x8FF3BA70
.end
