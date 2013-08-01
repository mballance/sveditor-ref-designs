/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f9.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f9.s,v 1.1 2007/05/11 17:22:29 drp Exp $"
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
	setx	0x6407D9B0804D687C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x0,	%g1
	set	0x7,	%g2
	set	0xA,	%g3
	set	0xC,	%g4
	set	0xC,	%g5
	set	0xC,	%g6
	set	0x5,	%g7
	!# Input registers
	set	-0x1,	%i0
	set	-0x0,	%i1
	set	-0xA,	%i2
	set	-0xE,	%i3
	set	-0x8,	%i4
	set	-0x1,	%i5
	set	-0x9,	%i6
	set	-0x8,	%i7
	!# Local registers
	set	0x212DA995,	%l0
	set	0x60F64072,	%l1
	set	0x4552CB57,	%l2
	set	0x47D250A4,	%l3
	set	0x795293C3,	%l4
	set	0x0F88326E,	%l5
	set	0x2345544E,	%l6
	!# Output registers
	set	-0x17BD,	%o0
	set	0x1488,	%o1
	set	-0x1424,	%o2
	set	0x1AEC,	%o3
	set	-0x0A5F,	%o4
	set	-0x15E5,	%o5
	set	0x1CA4,	%o6
	set	0x11F8,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x93CBF3E9EB1A9515)
	INIT_TH_FP_REG(%l7,%f2,0x65C516C9BA652288)
	INIT_TH_FP_REG(%l7,%f4,0xEA06CC272D5D915A)
	INIT_TH_FP_REG(%l7,%f6,0x7BA274AE70159E9F)
	INIT_TH_FP_REG(%l7,%f8,0x0B929CE8D259F486)
	INIT_TH_FP_REG(%l7,%f10,0x22F12C853B8C79BF)
	INIT_TH_FP_REG(%l7,%f12,0xCEA58214E217DA6B)
	INIT_TH_FP_REG(%l7,%f14,0x56A9EF6CF3F37C27)
	INIT_TH_FP_REG(%l7,%f16,0x5FCF93389686F691)
	INIT_TH_FP_REG(%l7,%f18,0x43E46CB1787A2B2F)
	INIT_TH_FP_REG(%l7,%f20,0x974CC8B883B07BE2)
	INIT_TH_FP_REG(%l7,%f22,0x535A1D43CB1A2CDD)
	INIT_TH_FP_REG(%l7,%f24,0x336B06EAD59F0C70)
	INIT_TH_FP_REG(%l7,%f26,0xB7FE7A4C1FC5553D)
	INIT_TH_FP_REG(%l7,%f28,0xB3D8708B79BBFAC8)
	INIT_TH_FP_REG(%l7,%f30,0x177CEDDE23D13D7C)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x5F4, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	nop
	setx	0xF4A5220787484F0B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xA53A195E9C0AE784,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f0,	%f30
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
	bvs	%xcc,	loop_1
	xorcc	%g2,	%o4,	%l2
	movrlez	%o6,	%l6,	%l5
	movne	%icc,	%g1,	%g5
loop_1:
	ldsw	[%l7 + 0x28],	%g3
	udivcc	%g6,	0x1651,	%o2
	fbu,a	%fcc0,	loop_2
	edge16n	%i3,	%i6,	%g7
	movg	%xcc,	%i1,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2:
	brnz	%i2,	loop_3
	movleu	%icc,	%i4,	%o5
	bvs,a	%icc,	loop_4
	array8	%o1,	%l4,	%o3
loop_3:
	movl	%xcc,	%l0,	%i7
	set	0x70, %l3
	ldda	[%l7 + %l3] 0x80,	%i4
loop_4:
	movcc	%xcc,	%o7,	%l1
	ldsh	[%l7 + 0x58],	%o0
	taddcc	%g4,	0x0ED2,	%g2
	movcc	%xcc,	%i0,	%l2
	xnorcc	%o4,	%o6,	%l5
	xorcc	%g1,	0x03A7,	%l6
	bge,a	loop_5
	ble	%xcc,	loop_6
	tsubcc	%g3,	0x05E4,	%g5
	fmovsvs	%xcc,	%f12,	%f23
loop_5:
	fornot2s	%f21,	%f19,	%f17
loop_6:
	bne,a,pn	%icc,	loop_7
	tpos	%xcc,	0x0
	fmovdpos	%icc,	%f1,	%f7
	srlx	%o2,	%i3,	%g6
loop_7:
	nop
	set	0x08, %o0
	swapa	[%l7 + %o0] 0x11,	%g7
	move	%icc,	%i1,	%l3
	movl	%icc,	%i6,	%i4
	edge16	%o5,	%i2,	%l4
	move	%xcc,	%o3,	%o1
	nop
	setx	loop_8,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brgz,a	%i7,	loop_9
	edge8ln	%i5,	%l0,	%l1
	smul	%o7,	0x15E2,	%g4
loop_8:
	ta	%xcc,	0x2
loop_9:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x68] %asi,	%o0
	fmovs	%f29,	%f5
	movrlz	%i0,	%g2,	%l2
	sdivx	%o6,	0x0D68,	%o4
	movcs	%icc,	%g1,	%l6
	nop
	fitos	%f2,	%f5
	fstox	%f5,	%f8
	fxtos	%f8,	%f10
	fnors	%f17,	%f31,	%f17
	movg	%icc,	%g3,	%g5
	mulx	%o2,	%i3,	%l5
	for	%f6,	%f2,	%f22
	bneg,pt	%xcc,	loop_10
	srl	%g7,	%i1,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc2,	loop_11
loop_10:
	tcs	%xcc,	0x7
	fmovsne	%icc,	%f22,	%f6
	fmovsg	%icc,	%f7,	%f21
loop_11:
	fsrc1	%f6,	%f22
	tn	%xcc,	0x1
	set	0x28, %o2
	prefetcha	[%l7 + %o2] 0x15,	 0x1
	movrlz	%i4,	0x1A6,	%o5
	movge	%icc,	%l3,	%l4
	addccc	%o3,	0x10FE,	%i2
	fpadd16s	%f15,	%f5,	%f13
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x11] %asi,	%i7
	udiv	%o1,	0x1127,	%i5
	addccc	%l1,	%l0,	%o7
	swap	[%l7 + 0x7C],	%g4
	wr	%g0,	0x18,	%asi
	sta	%f20,	[%l7 + 0x48] %asi
	fmovda	%xcc,	%f0,	%f18
	brnz	%i0,	loop_12
	fcmpeq16	%f8,	%f10,	%g2
	fmovdl	%icc,	%f30,	%f16
	nop
	setx	0xC7F8A8FAC05A2BAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_12:
	orncc	%o0,	0x11D5,	%o6
	edge32	%o4,	%l2,	%l6
	sub	%g3,	%g1,	%g5
	subcc	%o2,	%i3,	%g7
	xorcc	%i1,	0x0A18,	%l5
	movle	%xcc,	%i6,	%g6
	mulx	%o5,	0x023B,	%l3
	xorcc	%l4,	0x0EB0,	%o3
	sethi	0x07C6,	%i4
	edge32l	%i7,	%o1,	%i5
	mova	%icc,	%i2,	%l1
	nop
	setx	0xE15B213F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xCD5CD7EF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f23,	%f23
	array16	%o7,	%l0,	%g4
	tgu	%xcc,	0x5
	fmovd	%f6,	%f20
	movcs	%xcc,	%g2,	%o0
	fexpand	%f28,	%f10
	edge16n	%o6,	%o4,	%i0
	srlx	%l2,	%g3,	%g1
	sdivcc	%l6,	0x0CFA,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g5,	%i3,	%i1
	tl	%icc,	0x5
	fsrc1	%f20,	%f18
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x4C] %asi,	%f18
	movcs	%xcc,	%g7,	%i6
	fmovsleu	%icc,	%f19,	%f16
	movrlez	%l5,	%o5,	%g6
	addc	%l3,	%o3,	%l4
	subc	%i7,	0x1A86,	%o1
	movle	%icc,	%i5,	%i4
	udivx	%l1,	0x1987,	%o7
	set	0x70, %i3
	ldda	[%l7 + %i3] 0x14,	%l0
	alignaddr	%g4,	%g2,	%i2
	andcc	%o0,	0x0EF7,	%o4
	fbule,a	%fcc0,	loop_13
	fmovdle	%icc,	%f25,	%f20
	movneg	%icc,	%o6,	%l2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x28] %asi,	%i0
loop_13:
	flush	%l7 + 0x40
	andcc	%g1,	%l6,	%g3
	fpackfix	%f18,	%f21
	edge32n	%o2,	%i3,	%i1
	fbge,a	%fcc3,	loop_14
	bn,a	%icc,	loop_15
	fmovrsgez	%g5,	%f16,	%f15
	sra	%i6,	%g7,	%l5
loop_14:
	subccc	%g6,	%o5,	%l3
loop_15:
	umul	%l4,	%o3,	%i7
	udiv	%i5,	0x0EB6,	%i4
	srlx	%o1,	%l1,	%l0
	movne	%xcc,	%o7,	%g4
	and	%i2,	0x10D2,	%g2
	nop
	fitos	%f9,	%f13
	fstox	%f13,	%f4
	smul	%o4,	0x0CCD,	%o0
	srlx	%l2,	%o6,	%i0
	orn	%g1,	0x1CF3,	%l6
	fmul8ulx16	%f2,	%f22,	%f30
	umul	%o2,	%g3,	%i1
	fmovdvc	%xcc,	%f8,	%f31
	lduw	[%l7 + 0x1C],	%g5
	mulscc	%i3,	%g7,	%i6
	stw	%g6,	[%l7 + 0x34]
	taddcc	%o5,	0x16C3,	%l5
	tleu	%icc,	0x1
	fnot1	%f22,	%f30
	movrgz	%l4,	0x16B,	%l3
	orncc	%i7,	%o3,	%i4
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x14] %asi,	%o1
	xnorcc	%i5,	%l0,	%l1
	fble,a	%fcc3,	loop_16
	array32	%g4,	%i2,	%g2
	nop
	setx	loop_17,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mova	%xcc,	%o7,	%o4
loop_16:
	fmuld8sux16	%f15,	%f28,	%f18
	tsubcctv	%o0,	%o6,	%i0
loop_17:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l2,	0x008C,	%l6
	fmovrsgez	%g1,	%f25,	%f6
	sir	0x0529
	mulx	%o2,	0x1BCA,	%i1
	xnorcc	%g5,	0x1544,	%g3
	andcc	%g7,	0x1362,	%i3
	tsubcctv	%i6,	%g6,	%l5
	edge8ln	%l4,	%l3,	%i7
	brgez,a	%o3,	loop_18
	fmul8x16al	%f30,	%f26,	%f10
	fbne,a	%fcc3,	loop_19
	andncc	%o5,	%i4,	%o1
loop_18:
	movre	%i5,	0x275,	%l1
	ba,a,pt	%xcc,	loop_20
loop_19:
	movleu	%xcc,	%g4,	%i2
	fbn,a	%fcc0,	loop_21
	bcc	loop_22
loop_20:
	srlx	%g2,	0x16,	%l0
	edge8n	%o4,	%o0,	%o6
loop_21:
	ta	%xcc,	0x3
loop_22:
	movg	%icc,	%o7,	%i0
	tneg	%icc,	0x6
	fmovdl	%xcc,	%f26,	%f9
	movne	%xcc,	%l2,	%g1
	tne	%xcc,	0x2
	edge32l	%l6,	%i1,	%o2
	set	0x3C, %g1
	sta	%f29,	[%l7 + %g1] 0x81
	ldsw	[%l7 + 0x34],	%g3
	sth	%g5,	[%l7 + 0x0E]
	movg	%icc,	%i3,	%i6
	fpadd32s	%f21,	%f11,	%f28
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fba,a	%fcc2,	loop_23
	ldx	[%l7 + 0x70],	%g6
	movpos	%icc,	%g7,	%l5
	bl,a,pn	%xcc,	loop_24
loop_23:
	xnor	%l3,	%l4,	%i7
	movvc	%xcc,	%o3,	%o5
	andn	%o1,	0x13CC,	%i4
loop_24:
	movpos	%icc,	%i5,	%l1
	fmovrslz	%g4,	%f12,	%f13
	xor	%i2,	%g2,	%l0
	sdivcc	%o0,	0x0DF0,	%o4
	ldsw	[%l7 + 0x64],	%o7
	bg,a,pn	%xcc,	loop_25
	edge16	%o6,	%i0,	%g1
	tgu	%icc,	0x0
	nop
	fitos	%f10,	%f1
	fstoi	%f1,	%f28
loop_25:
	movne	%xcc,	%l6,	%l2
	tsubcc	%i1,	%g3,	%g5
	sethi	0x12F6,	%i3
	fpack16	%f16,	%f26
	ldd	[%l7 + 0x38],	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1BA0
	fbo	%fcc0,	loop_26
	edge16n	%o2,	%g6,	%g7
	fmovsa	%xcc,	%f2,	%f23
	fbn	%fcc2,	loop_27
loop_26:
	bge,a,pn	%xcc,	loop_28
	tneg	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27:
	alignaddr	%l5,	%l3,	%i6
loop_28:
	fmovsgu	%icc,	%f16,	%f15
	fzeros	%f17
	fbuge,a	%fcc1,	loop_29
	fxnor	%f2,	%f0,	%f14
	nop
	setx	0xF0950AF03070F5C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	brlez,a	%i7,	loop_30
loop_29:
	edge16n	%l4,	%o3,	%o5
	bn,pn	%xcc,	loop_31
	st	%f21,	[%l7 + 0x2C]
loop_30:
	nop
	setx loop_32, %l0, %l1
	jmpl %l1, %i4
	fand	%f16,	%f28,	%f28
loop_31:
	edge32ln	%o1,	%l1,	%g4
	tge	%icc,	0x1
loop_32:
	srl	%i5,	%i2,	%g2
	array8	%l0,	%o0,	%o4
	ldx	[%l7 + 0x38],	%o7
	fbn	%fcc3,	loop_33
	sethi	0x1006,	%o6
	smul	%i0,	%g1,	%l2
	fzeros	%f23
loop_33:
	fmovsne	%xcc,	%f1,	%f13
	ldub	[%l7 + 0x65],	%i1
	srax	%g3,	0x08,	%l6
	udivx	%g5,	0x0DE4,	%o2
	nop
	setx	0x8FAE2EDF206436B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	movvs	%xcc,	%g6,	%g7
	movvc	%xcc,	%i3,	%l3
	edge8l	%l5,	%i6,	%i7
	sir	0x016A
	ta	%xcc,	0x6
	bl,a	loop_34
	sdivcc	%o3,	0x1B55,	%l4
	ta	%xcc,	0x4
	tne	%icc,	0x0
loop_34:
	tvs	%icc,	0x4
	nop
	setx	0x369D7ADF13A11E57,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x3D3FE71490B9704C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f26,	%f12
	subcc	%i4,	0x0394,	%o1
	brgz,a	%l1,	loop_35
	add	%o5,	%i5,	%g4
	wr	%g0,	0x18,	%asi
	stba	%g2,	[%l7 + 0x78] %asi
loop_35:
	fmovsa	%xcc,	%f11,	%f25
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ldub	[%l7 + 0x70],	%i2
	edge16	%o0,	%o4,	%l0
	movn	%xcc,	%o7,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge	loop_36
	edge16l	%g1,	%l2,	%i0
	be,a	loop_37
	smulcc	%g3,	%l6,	%g5
loop_36:
	nop
	set	0x54, %l1
	ldswa	[%l7 + %l1] 0x81,	%o2
loop_37:
	alignaddrl	%g6,	%g7,	%i3
	xorcc	%l3,	0x08E0,	%l5
	movl	%icc,	%i1,	%i7
	xnorcc	%o3,	%l4,	%i4
	fpadd16s	%f28,	%f1,	%f3
	nop
	setx	0x10491CF8,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	sub	%l1,	%i6,	%o5
	movre	%g4,	0x322,	%i5
	orn	%g2,	%o0,	%i2
	tle	%icc,	0x2
	sdivx	%l0,	0x141E,	%o7
	orncc	%o6,	%o4,	%l2
	xnorcc	%g1,	%g3,	%i0
	sdivcc	%l6,	0x0AED,	%o2
	tgu	%icc,	0x5
	add	%g5,	0x18AA,	%g6
	movrlz	%g7,	0x1F0,	%l3
	sdiv	%i3,	0x0B17,	%l5
	brz,a	%i1,	loop_38
	movrgz	%i7,	0x07E,	%l4
	fmovdpos	%xcc,	%f3,	%f15
	subccc	%i4,	0x1CEC,	%o3
loop_38:
	movneg	%icc,	%o1,	%l1
	ba,a,pn	%xcc,	loop_39
	tsubcc	%o5,	%i6,	%g4
	fornot1s	%f28,	%f15,	%f19
	movvs	%xcc,	%i5,	%g2
loop_39:
	fpackfix	%f20,	%f31
	xorcc	%i2,	0x1288,	%l0
	taddcctv	%o7,	%o6,	%o4
	tsubcctv	%o0,	%g1,	%l2
	bneg,a,pn	%icc,	loop_40
	taddcc	%g3,	0x0BEF,	%i0
	bcs,a	%xcc,	loop_41
	tne	%icc,	0x5
loop_40:
	fble	%fcc0,	loop_42
	movrgez	%o2,	0x2CC,	%g5
loop_41:
	edge16ln	%g6,	%l6,	%l3
	alignaddrl	%i3,	%g7,	%i1
loop_42:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fpmerge	%f2,	%f9,	%f28
	mulx	%i7,	%l4,	%i4
	fbn,a	%fcc1,	loop_43
	sethi	0x1155,	%o3
	fzeros	%f20
	edge8ln	%l5,	%l1,	%o1
loop_43:
	fpack32	%f20,	%f14,	%f4
	array32	%o5,	%i6,	%g4
	srl	%g2,	%i2,	%i5
	fpadd16s	%f21,	%f12,	%f19
	nop
	setx	loop_44,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivcc	%o7,	0x0019,	%l0
	taddcctv	%o6,	%o4,	%o0
	movrgz	%l2,	0x1C3,	%g1
loop_44:
	fxor	%f20,	%f12,	%f28
	xnor	%i0,	0x02CE,	%o2
	sdiv	%g3,	0x1037,	%g6
	nop
	setx	0x8C6C6F268E23680D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x7E0822B56644BCAC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f22,	%f24
	orn	%l6,	%l3,	%i3
	lduw	[%l7 + 0x1C],	%g7
	edge8	%i1,	%i7,	%g5
	fbuge,a	%fcc3,	loop_45
	edge16n	%i4,	%l4,	%o3
	sdivx	%l1,	0x0528,	%l5
	movl	%xcc,	%o1,	%i6
loop_45:
	st	%f10,	[%l7 + 0x7C]
	srlx	%g4,	0x19,	%o5
	wr	%g0,	0x18,	%asi
	sta	%f3,	[%l7 + 0x34] %asi
	fba	%fcc0,	loop_46
	taddcctv	%i2,	%g2,	%i5
	movrgz	%o7,	%o6,	%l0
	udivx	%o4,	0x0E18,	%o0
loop_46:
	sll	%l2,	%i0,	%o2
	edge8l	%g1,	%g3,	%l6
	fbge,a	%fcc0,	loop_47
	fmovsge	%icc,	%f2,	%f25
	sir	0x10A0
	bcs,a	loop_48
loop_47:
	nop
	setx loop_49, %l0, %l1
	jmpl %l1, %g6
	sethi	0x1492,	%i3
	umulcc	%g7,	0x011F,	%i1
loop_48:
	fpadd32	%f26,	%f2,	%f18
loop_49:
	ldd	[%l7 + 0x68],	%f30
	fmovrdgz	%l3,	%f12,	%f10
	fmul8sux16	%f6,	%f0,	%f30
	tne	%xcc,	0x1
	ta	%xcc,	0x6
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	fpadd32	%f28,	%f4,	%f14
	tpos	%xcc,	0x7
	mulx	%i4,	0x0669,	%g5
	tg	%icc,	0x5
	movne	%xcc,	%l4,	%o3
	set	0x3C, %l5
	ldsha	[%l7 + %l5] 0x15,	%l1
	sllx	%o1,	0x09,	%i6
	nop
	setx	0x6C528DCFA166C1E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xBB71A96B2149F687,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f6,	%f16
	stw	%l5,	[%l7 + 0x24]
	ldsw	[%l7 + 0x4C],	%g4
	ldsh	[%l7 + 0x22],	%i2
	umul	%o5,	0x1E71,	%g2
	edge32l	%i5,	%o6,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l0,	[%l7 + 0x0B]
	xnorcc	%o0,	0x148E,	%o4
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x78] %asi,	%l2
	movre	%i0,	0x0EF,	%o2
	taddcctv	%g3,	0x12A0,	%l6
	set	0x61, %o5
	ldstuba	[%l7 + %o5] 0x04,	%g1
	membar	0x4F
	wr	%g0,	0x11,	%asi
	sta	%f19,	[%l7 + 0x34] %asi
	set	0x08, %i2
	lda	[%l7 + %i2] 0x10,	%f2
	subccc	%i3,	%g6,	%g7
	nop
	setx	loop_50,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fble	%fcc0,	loop_51
	bn,a,pt	%xcc,	loop_52
	fmovsn	%icc,	%f31,	%f3
loop_50:
	fmovde	%icc,	%f4,	%f11
loop_51:
	fmovrslez	%i1,	%f6,	%f27
loop_52:
	fbg,a	%fcc2,	loop_53
	udiv	%i7,	0x17BE,	%i4
	taddcc	%g5,	%l4,	%o3
	edge16l	%l1,	%o1,	%l3
loop_53:
	tle	%icc,	0x5
	edge16n	%i6,	%l5,	%i2
	sllx	%g4,	%o5,	%g2
	andn	%o6,	%i5,	%o7
	movrgez	%l0,	0x33E,	%o0
	membar	0x10
	brlez	%l2,	loop_54
	smul	%o4,	%o2,	%g3
	fbo	%fcc1,	loop_55
	movcs	%xcc,	%i0,	%g1
loop_54:
	udivcc	%l6,	0x044C,	%i3
	fblg	%fcc2,	loop_56
loop_55:
	sethi	0x0F32,	%g6
	fmovdvc	%xcc,	%f6,	%f23
	movrgez	%i1,	%g7,	%i4
loop_56:
	bgu,a	loop_57
	nop
	set	0x32, %l4
	ldub	[%l7 + %l4],	%i7
	edge16ln	%l4,	%o3,	%l1
	fmovdleu	%icc,	%f0,	%f22
loop_57:
	move	%icc,	%o1,	%g5
	fmovrdlz	%l3,	%f26,	%f12
	alignaddr	%l5,	%i2,	%g4
	swap	[%l7 + 0x68],	%i6
	movl	%xcc,	%o5,	%o6
	tgu	%xcc,	0x7
	fnors	%f23,	%f24,	%f17
	edge32	%g2,	%i5,	%l0
	fbul	%fcc0,	loop_58
	subc	%o0,	0x0316,	%l2
	edge32n	%o4,	%o2,	%o7
	stx	%g3,	[%l7 + 0x78]
loop_58:
	tne	%xcc,	0x0
	edge8ln	%g1,	%l6,	%i0
	srax	%i3,	0x14,	%g6
	sethi	0x1C91,	%g7
	nop
	setx	0x4FCBE8843617ACBB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xDA6AA313542DCBAA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f8,	%f28
	fnand	%f8,	%f12,	%f20
	alignaddr	%i1,	%i4,	%l4
	tle	%xcc,	0x1
	addcc	%i7,	0x04CD,	%l1
	taddcctv	%o1,	%o3,	%g5
	tgu	%icc,	0x3
	tle	%xcc,	0x1
	movrne	%l3,	0x3BD,	%l5
	tgu	%xcc,	0x6
	bvs,pt	%xcc,	loop_59
	edge8ln	%i2,	%g4,	%o5
	alignaddrl	%i6,	%g2,	%o6
	orncc	%l0,	0x007D,	%i5
loop_59:
	call	loop_60
	movg	%icc,	%l2,	%o4
	fzero	%f24
	fsrc1s	%f28,	%f6
loop_60:
	tle	%icc,	0x3
	edge16n	%o0,	%o7,	%g3
	std	%f4,	[%l7 + 0x28]
	movvs	%icc,	%g1,	%l6
	array16	%i0,	%o2,	%g6
	subccc	%i3,	%i1,	%i4
	mulscc	%l4,	%i7,	%g7
	srl	%l1,	%o3,	%g5
	tne	%xcc,	0x7
	sllx	%l3,	%l5,	%o1
	set	0x44, %o3
	lduwa	[%l7 + %o3] 0x88,	%i2
	fcmpeq16	%f18,	%f20,	%g4
	tpos	%icc,	0x6
	tle	%icc,	0x1
	fmovdneg	%icc,	%f9,	%f13
	tleu	%icc,	0x3
	edge8n	%o5,	%i6,	%o6
	movre	%l0,	%i5,	%l2
	fmovd	%f14,	%f4
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%g2
	movge	%icc,	%o0,	%o4
	srlx	%g3,	%o7,	%l6
	smulcc	%i0,	%o2,	%g6
	movn	%icc,	%g1,	%i1
	fmovsvc	%xcc,	%f6,	%f20
	mulx	%i3,	0x16FA,	%i4
	for	%f22,	%f14,	%f26
	movg	%icc,	%i7,	%g7
	edge32ln	%l4,	%l1,	%o3
	add	%l3,	%l5,	%g5
	fmovdgu	%icc,	%f26,	%f23
	nop
	setx	0x8842E635,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x0EBE781E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f28,	%f12
	movrgz	%i2,	0x280,	%g4
	fmovspos	%xcc,	%f7,	%f19
	xnor	%o1,	%o5,	%o6
	array8	%l0,	%i6,	%l2
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f14
	tvc	%xcc,	0x2
	fxnor	%f6,	%f14,	%f6
	srax	%i5,	%g2,	%o0
	movrlez	%o4,	%g3,	%o7
	orn	%i0,	%l6,	%g6
	edge32n	%g1,	%i1,	%o2
	fandnot1	%f26,	%f30,	%f18
	nop
	setx	loop_61,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	st	%f28,	[%l7 + 0x0C]
	ldd	[%l7 + 0x60],	%i4
	ble	%icc,	loop_62
loop_61:
	nop
	setx	0x505FC8CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	ldub	[%l7 + 0x23],	%i7
	subc	%i3,	0x155C,	%l4
loop_62:
	srl	%g7,	0x1A,	%o3
	fmovdl	%icc,	%f17,	%f1
	tvc	%xcc,	0x5
	edge8l	%l1,	%l5,	%l3
	wr	%g0,	0x81,	%asi
	stba	%g5,	[%l7 + 0x53] %asi
	taddcctv	%i2,	%o1,	%o5
	fble,a	%fcc0,	loop_63
	tpos	%xcc,	0x0
	nop
	setx	loop_64,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%o6,	0x1B49,	%l0
loop_63:
	movcc	%xcc,	%i6,	%g4
	tg	%xcc,	0x0
loop_64:
	fxors	%f31,	%f0,	%f27
	lduh	[%l7 + 0x0C],	%i5
	array8	%l2,	%g2,	%o0
	or	%o4,	%g3,	%i0
	subc	%l6,	0x0C75,	%g6
	nop
	setx	0x0C44DEEB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x6C7E1F6B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f25,	%f14
	fmovsle	%icc,	%f21,	%f20
	lduw	[%l7 + 0x38],	%o7
	fbug	%fcc2,	loop_65
	ldsw	[%l7 + 0x6C],	%g1
	fmovdge	%xcc,	%f13,	%f19
	fcmpgt32	%f26,	%f10,	%i1
loop_65:
	movrne	%o2,	0x15C,	%i4
	movrne	%i7,	0x276,	%l4
	udivcc	%i3,	0x0C36,	%g7
	edge16ln	%o3,	%l1,	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l3,	%i2
	tsubcctv	%o1,	0x1176,	%o5
	edge8l	%o6,	%g5,	%i6
	sir	0x081B
	fmovsn	%xcc,	%f12,	%f4
	srax	%l0,	%g4,	%i5
	movn	%icc,	%l2,	%g2
	movrlz	%o0,	%g3,	%o4
	fble,a	%fcc0,	loop_66
	bcs,a	%icc,	loop_67
	brnz,a	%i0,	loop_68
	tsubcctv	%g6,	%o7,	%l6
loop_66:
	nop
	setx	0xD41D10BB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x1F6B26F7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f26,	%f19
loop_67:
	fnot2	%f28,	%f26
loop_68:
	subccc	%g1,	0x1979,	%i1
	te	%xcc,	0x3
	xnor	%i4,	0x1E0F,	%o2
	fnegd	%f28,	%f8
	nop
	setx loop_69, %l0, %l1
	jmpl %l1, %i7
	brlz,a	%i3,	loop_70
	tvs	%icc,	0x2
	subc	%l4,	%g7,	%l1
loop_69:
	fpadd16	%f20,	%f2,	%f14
loop_70:
	tsubcc	%l5,	0x1998,	%l3
	nop
	fitod	%f23,	%f30
	tl	%xcc,	0x6
	tge	%icc,	0x1
	fone	%f30
	addccc	%o3,	0x0F0E,	%o1
	wr	%g0,	0x0c,	%asi
	sta	%f9,	[%l7 + 0x74] %asi
	fbl	%fcc3,	loop_71
	orcc	%o5,	0x077F,	%i2
	bl,a,pt	%icc,	loop_72
	fmovde	%xcc,	%f15,	%f9
loop_71:
	movre	%o6,	0x33B,	%g5
	pdist	%f20,	%f16,	%f4
loop_72:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i6,	%g4
	fnot1	%f24,	%f26
	srax	%i5,	%l0,	%g2
	movrgz	%o0,	%g3,	%o4
	sdivcc	%i0,	0x1DE2,	%g6
	fmovscs	%icc,	%f4,	%f31
	fmovdcs	%icc,	%f30,	%f4
	andcc	%l2,	0x17A9,	%l6
	mova	%icc,	%o7,	%i1
	fmovspos	%xcc,	%f26,	%f6
	nop
	setx	0x7FAEB97AFEC70B2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f26
	array32	%g1,	%o2,	%i7
	brlz	%i4,	loop_73
	fmovdg	%xcc,	%f17,	%f7
	movrlez	%l4,	%g7,	%l1
	addcc	%i3,	%l5,	%l3
loop_73:
	fabss	%f22,	%f8
	tpos	%xcc,	0x5
	edge32	%o1,	%o5,	%i2
	bg,pn	%icc,	loop_74
	fornot2	%f16,	%f6,	%f20
	mova	%icc,	%o6,	%o3
	xor	%i6,	0x0A86,	%g5
loop_74:
	udivcc	%g4,	0x1DBE,	%i5
	sllx	%l0,	%g2,	%g3
	edge16	%o4,	%o0,	%g6
	fandnot2	%f22,	%f22,	%f12
	set	0x3A, %g2
	stba	%i0,	[%l7 + %g2] 0x88
	fbge	%fcc0,	loop_75
	be	%icc,	loop_76
	fbg,a	%fcc2,	loop_77
	bge,a,pn	%icc,	loop_78
loop_75:
	movge	%icc,	%l6,	%l2
loop_76:
	sra	%o7,	0x1E,	%i1
loop_77:
	nop
	setx	0xD0618624,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
loop_78:
	fmovs	%f4,	%f30
	stx	%g1,	[%l7 + 0x18]
	subc	%o2,	%i7,	%i4
	brgz,a	%l4,	loop_79
	array8	%g7,	%i3,	%l5
	movn	%xcc,	%l3,	%l1
	fmovdcs	%xcc,	%f26,	%f1
loop_79:
	fmovrsgz	%o5,	%f19,	%f12
	sdivcc	%i2,	0x01E3,	%o6
	srax	%o1,	0x18,	%o3
	fcmpgt16	%f14,	%f16,	%g5
	edge16ln	%g4,	%i5,	%i6
	fba,a	%fcc1,	loop_80
	fmul8x16al	%f16,	%f10,	%f28
	fands	%f20,	%f30,	%f13
	tleu	%icc,	0x2
loop_80:
	array32	%g2,	%g3,	%o4
	fbue,a	%fcc2,	loop_81
	fbu	%fcc2,	loop_82
	edge8n	%l0,	%g6,	%i0
	alignaddr	%l6,	%l2,	%o7
loop_81:
	movcs	%xcc,	%o0,	%i1
loop_82:
	addccc	%o2,	0x0FEF,	%i7
	addc	%i4,	0x0A9A,	%g1
	movle	%icc,	%l4,	%i3
	for	%f16,	%f12,	%f0
	udivcc	%l5,	0x0924,	%l3
	set	0x30, %i4
	sta	%f13,	[%l7 + %i4] 0x0c
	fcmple32	%f30,	%f22,	%l1
	fxor	%f8,	%f14,	%f30
	mova	%xcc,	%g7,	%o5
	move	%xcc,	%i2,	%o1
	nop
	fitod	%f10,	%f22
	fdtox	%f22,	%f30
	st	%f2,	[%l7 + 0x38]
	fxnor	%f0,	%f6,	%f2
	fandnot1	%f10,	%f12,	%f20
	fsrc2	%f6,	%f10
	tsubcctv	%o6,	%g5,	%o3
	fandnot1	%f20,	%f6,	%f10
	nop
	fitod	%f4,	%f2
	fdtos	%f2,	%f17
	nop
	set	0x54, %g6
	lduw	[%l7 + %g6],	%i5
	sethi	0x1880,	%i6
	taddcc	%g4,	0x1306,	%g3
	nop
	setx loop_83, %l0, %l1
	jmpl %l1, %o4
	mulx	%l0,	0x1387,	%g2
	movge	%icc,	%i0,	%l6
	sethi	0x02A3,	%g6
loop_83:
	fmovdcc	%icc,	%f12,	%f11
	srlx	%l2,	0x02,	%o0
	bvs,pt	%icc,	loop_84
	sth	%i1,	[%l7 + 0x52]
	fornot1s	%f20,	%f29,	%f27
	fcmpeq32	%f2,	%f28,	%o2
loop_84:
	movle	%xcc,	%i7,	%o7
	srax	%i4,	0x0B,	%l4
	popc	0x0D67,	%g1
	ta	%xcc,	0x0
	movgu	%xcc,	%l5,	%l3
	fpadd32s	%f31,	%f10,	%f29
	fones	%f15
	or	%i3,	%l1,	%g7
	subcc	%i2,	0x1A82,	%o1
	alignaddr	%o5,	%g5,	%o6
	srlx	%i5,	0x0D,	%o3
	sdivx	%g4,	0x0401,	%g3
	stw	%o4,	[%l7 + 0x5C]
	xor	%l0,	0x1B8D,	%g2
	edge8ln	%i6,	%l6,	%i0
	bleu,pn	%icc,	loop_85
	array32	%l2,	%o0,	%g6
	andcc	%o2,	0x1147,	%i1
	movcs	%icc,	%i7,	%i4
loop_85:
	fcmpne16	%f6,	%f28,	%l4
	fbne	%fcc0,	loop_86
	fmul8x16	%f3,	%f0,	%f6
	ba,pt	%xcc,	loop_87
	fpadd32	%f22,	%f30,	%f4
loop_86:
	nop
	setx	0xE6ECC1BD9D4C479F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x7CE64827B6578A55,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f28,	%f16
	sethi	0x052B,	%g1
loop_87:
	fsrc1	%f2,	%f16
	nop
	fitos	%f7,	%f11
	fstox	%f11,	%f24
	fxtos	%f24,	%f12
	fmovrdlz	%o7,	%f24,	%f18
	edge32n	%l3,	%l5,	%i3
	edge8	%l1,	%i2,	%g7
	tsubcctv	%o1,	0x0A49,	%o5
	movre	%g5,	%o6,	%i5
	array16	%o3,	%g4,	%o4
	nop
	setx	0x4051F160,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	fmovrdgez	%l0,	%f28,	%f20
	te	%icc,	0x7
	sub	%g3,	0x0262,	%i6
	umul	%g2,	0x171F,	%l6
	tle	%xcc,	0x3
	movrne	%l2,	%i0,	%o0
	tneg	%xcc,	0x2
	fmovdl	%icc,	%f11,	%f14
	add	%o2,	0x17B9,	%g6
	array8	%i7,	%i1,	%l4
	addc	%i4,	0x183D,	%g1
	and	%o7,	0x10B1,	%l3
	prefetch	[%l7 + 0x0C],	 0x3
	tpos	%icc,	0x5
	fbg,a	%fcc2,	loop_88
	movvs	%icc,	%l5,	%i3
	nop
	setx	loop_89,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%i2,	%g7,	%o1
loop_88:
	sdiv	%o5,	0x1394,	%l1
	srl	%g5,	0x06,	%i5
loop_89:
	edge32l	%o3,	%g4,	%o4
	fbne	%fcc2,	loop_90
	sdivcc	%o6,	0x1651,	%g3
	bneg	%xcc,	loop_91
	fmovdcc	%xcc,	%f6,	%f12
loop_90:
	tvc	%xcc,	0x6
	popc	0x15F8,	%l0
loop_91:
	bneg,a,pt	%xcc,	loop_92
	bn,a,pn	%icc,	loop_93
	fxors	%f25,	%f26,	%f6
	tne	%xcc,	0x4
loop_92:
	nop
	setx	0x204EE0D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
loop_93:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x1E] %asi,	%g2
	sdivcc	%l6,	0x1F21,	%l2
	fpack32	%f18,	%f4,	%f16
	srax	%i0,	%o0,	%o2
	srlx	%g6,	0x1B,	%i7
	brnz	%i6,	loop_94
	srlx	%i1,	%l4,	%g1
	fpadd32	%f4,	%f0,	%f6
	fmovsa	%icc,	%f28,	%f14
loop_94:
	membar	0x2A
	tg	%icc,	0x4
	movvs	%xcc,	%o7,	%i4
	array32	%l5,	%i3,	%l3
	movne	%icc,	%i2,	%g7
	brlez	%o5,	loop_95
	fmovsvs	%icc,	%f18,	%f5
	movvs	%icc,	%o1,	%l1
	fble	%fcc0,	loop_96
loop_95:
	movre	%i5,	%o3,	%g4
	fmovscs	%icc,	%f26,	%f20
	ble,a,pt	%icc,	loop_97
loop_96:
	fmovsg	%icc,	%f4,	%f2
	set	0x42, %l2
	lduha	[%l7 + %l2] 0x89,	%g5
loop_97:
	sub	%o4,	0x0091,	%g3
	ldsb	[%l7 + 0x2C],	%l0
	fnegd	%f22,	%f16
	tvs	%icc,	0x5
	fsrc2s	%f10,	%f1
	taddcctv	%g2,	0x1DA9,	%l6
	stbar
	add	%l2,	0x1580,	%o6
	fmovrsne	%i0,	%f25,	%f16
	fcmple16	%f14,	%f12,	%o2
	stw	%g6,	[%l7 + 0x1C]
	fpadd16s	%f21,	%f24,	%f24
	nop
	fitod	%f0,	%f6
	fdtoi	%f6,	%f27
	bg,a,pn	%xcc,	loop_98
	xnor	%i7,	%o0,	%i1
	smul	%i6,	0x1BA3,	%g1
	fone	%f28
loop_98:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x42] %asi,	%l4
	tsubcc	%i4,	%l5,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%l3,	%i2
	fmovda	%xcc,	%f12,	%f12
	tcs	%icc,	0x4
	movge	%icc,	%g7,	%o7
	nop
	set	0x4C, %g7
	stb	%o1,	[%l7 + %g7]
	sth	%o5,	[%l7 + 0x4C]
	edge8ln	%l1,	%o3,	%g4
	movvc	%icc,	%i5,	%o4
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x10] %asi,	%g5
	fmul8x16	%f13,	%f2,	%f30
	alignaddrl	%l0,	%g3,	%l6
	srl	%g2,	0x03,	%o6
	sethi	0x0F42,	%l2
	srax	%o2,	%g6,	%i0
	umulcc	%o0,	%i7,	%i1
	bcc,pn	%icc,	loop_99
	fcmpgt16	%f14,	%f8,	%g1
	st	%f6,	[%l7 + 0x38]
	or	%i6,	%l4,	%i4
loop_99:
	movle	%icc,	%i3,	%l3
	edge16ln	%i2,	%g7,	%l5
	tsubcctv	%o1,	0x09DC,	%o5
	movl	%icc,	%o7,	%o3
	tg	%icc,	0x3
	sll	%l1,	%g4,	%o4
	bcc,pt	%icc,	loop_100
	srl	%g5,	%i5,	%l0
	movre	%l6,	0x1FB,	%g2
	fbug	%fcc0,	loop_101
loop_100:
	nop
	fitos	%f2,	%f13
	fstod	%f13,	%f18
	orncc	%o6,	%l2,	%o2
	fabsd	%f30,	%f12
loop_101:
	nop
	setx	0x004046A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	movre	%g3,	0x01B,	%g6
	te	%icc,	0x6
	edge8ln	%o0,	%i7,	%i1
	fmovsge	%xcc,	%f31,	%f27
	movrlz	%i0,	%g1,	%l4
	subcc	%i6,	%i4,	%i3
	fcmpeq32	%f8,	%f16,	%i2
	fbug	%fcc3,	loop_102
	movn	%icc,	%g7,	%l3
	udiv	%l5,	0x0A4E,	%o1
	movpos	%xcc,	%o5,	%o3
loop_102:
	fnot2	%f14,	%f22
	movrgz	%l1,	%o7,	%g4
	ta	%icc,	0x0
	sub	%o4,	0x0535,	%i5
	andcc	%g5,	%l6,	%g2
	bne,a	%xcc,	loop_103
	bleu,a,pn	%icc,	loop_104
	stx	%l0,	[%l7 + 0x10]
	sllx	%l2,	0x05,	%o2
loop_103:
	udivcc	%o6,	0x044D,	%g3
loop_104:
	movg	%icc,	%g6,	%o0
	nop
	setx	0xE73E443E3C7DD5C2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x206177685DAF25A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f12,	%f20
	udivx	%i7,	0x1452,	%i0
	move	%xcc,	%g1,	%l4
	sdivx	%i6,	0x0146,	%i4
	orn	%i3,	%i1,	%i2
	bcc,a	%icc,	loop_105
	fmovda	%icc,	%f22,	%f3
	movcs	%icc,	%g7,	%l5
	udiv	%l3,	0x0A18,	%o1
loop_105:
	move	%xcc,	%o5,	%l1
	fornot1s	%f4,	%f0,	%f31
	andcc	%o7,	0x17B5,	%g4
	sdivcc	%o3,	0x18F6,	%i5
	brlz,a	%o4,	loop_106
	addc	%g5,	0x192F,	%g2
	sllx	%l6,	0x13,	%l2
	nop
	setx	0xE07B12C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
loop_106:
	tn	%icc,	0x0
	smul	%l0,	0x0C8C,	%o6
	srl	%o2,	0x12,	%g6
	movrlz	%o0,	0x0F3,	%i7
	fbo,a	%fcc3,	loop_107
	fmovs	%f19,	%f10
	subcc	%g3,	0x09FD,	%i0
	addcc	%g1,	0x0727,	%i6
loop_107:
	nop
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%i4
	tn	%icc,	0x6
	te	%icc,	0x7
	movrgez	%i3,	0x15D,	%i1
	movneg	%xcc,	%i2,	%l5
	fabsd	%f12,	%f10
	nop
	fitos	%f2,	%f12
	fstoi	%f12,	%f5
	fmovrsgz	%l3,	%f4,	%f19
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g7
	bvc,pn	%icc,	loop_108
	movvs	%icc,	%o1,	%l1
	addccc	%o5,	%o7,	%g4
	umul	%i5,	%o4,	%g5
loop_108:
	edge16	%o3,	%l6,	%g2
	fmovrde	%l0,	%f10,	%f0
	fmovsl	%icc,	%f4,	%f22
	movcc	%xcc,	%l2,	%o2
	sll	%o6,	0x0E,	%g6
	tneg	%icc,	0x4
	fornot2s	%f19,	%f22,	%f25
	taddcc	%o0,	0x0E84,	%i7
	fbge,a	%fcc1,	loop_109
	te	%xcc,	0x2
	ldstub	[%l7 + 0x19],	%g3
	edge8ln	%i0,	%i6,	%g1
loop_109:
	lduh	[%l7 + 0x2E],	%l4
	movpos	%xcc,	%i4,	%i1
	array8	%i3,	%i2,	%l3
	movrlz	%g7,	%l5,	%o1
	tsubcc	%l1,	%o7,	%g4
	sub	%o5,	%o4,	%i5
	sra	%g5,	0x0E,	%l6
	set	0x20, %g4
	ldda	[%l7 + %g4] 0x11,	%g2
	tneg	%xcc,	0x7
	ldub	[%l7 + 0x39],	%o3
	orncc	%l0,	0x110A,	%o2
	movrne	%l2,	0x00D,	%o6
	fmovrdgez	%g6,	%f18,	%f16
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x10
	fmuld8sux16	%f27,	%f6,	%f2
	fmovs	%f29,	%f17
	fbl	%fcc0,	loop_110
	ldx	[%l7 + 0x30],	%o0
	fmovrdgz	%g3,	%f12,	%f14
	tvs	%xcc,	0x0
loop_110:
	faligndata	%f16,	%f12,	%f8
	brgez,a	%i0,	loop_111
	tl	%icc,	0x4
	stb	%i7,	[%l7 + 0x6A]
	edge16n	%g1,	%i6,	%i4
loop_111:
	array16	%l4,	%i3,	%i1
	tne	%icc,	0x5
	lduw	[%l7 + 0x74],	%i2
	edge16	%l3,	%l5,	%g7
	tn	%xcc,	0x7
	ble,a	loop_112
	movpos	%xcc,	%l1,	%o7
	fmovdle	%xcc,	%f5,	%f28
	sethi	0x0A7C,	%o1
loop_112:
	smulcc	%o5,	%g4,	%i5
	fmovdl	%xcc,	%f21,	%f31
	tne	%xcc,	0x0
	fbug,a	%fcc2,	loop_113
	edge16ln	%o4,	%g5,	%g2
	umulcc	%l6,	%o3,	%l0
	move	%xcc,	%l2,	%o6
loop_113:
	tcs	%icc,	0x0
	addccc	%o2,	0x1DBB,	%o0
	umul	%g6,	%i0,	%g3
	nop
	setx	0x79238254A05D2F42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fbul,a	%fcc1,	loop_114
	addc	%g1,	0x1A0B,	%i6
	orncc	%i7,	0x04A4,	%i4
	std	%f6,	[%l7 + 0x30]
loop_114:
	xorcc	%l4,	0x0CFC,	%i3
	edge16ln	%i2,	%i1,	%l3
	fcmpeq32	%f2,	%f6,	%l5
	edge32l	%g7,	%o7,	%o1
	tne	%xcc,	0x4
	sub	%l1,	%o5,	%i5
	sll	%o4,	0x0C,	%g5
	udivcc	%g4,	0x00BF,	%g2
	set	0x7B, %i6
	stba	%o3,	[%l7 + %i6] 0xe2
	membar	#Sync
	andncc	%l6,	%l2,	%o6
	sdivcc	%o2,	0x14EA,	%l0
	fmovdgu	%xcc,	%f14,	%f7
	fbg	%fcc2,	loop_115
	fxnors	%f13,	%f23,	%f17
	or	%g6,	0x1B46,	%o0
	movrlz	%g3,	0x031,	%g1
loop_115:
	lduw	[%l7 + 0x34],	%i0
	fmovdg	%xcc,	%f6,	%f16
	ba,a	loop_116
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i7,	0x1D72,	%i6
	fmovde	%icc,	%f17,	%f8
loop_116:
	ldd	[%l7 + 0x50],	%f10
	fnegs	%f22,	%f17
	add	%i4,	0x01EA,	%l4
	bneg,pt	%xcc,	loop_117
	fmovdvc	%icc,	%f24,	%f23
	bne,pn	%xcc,	loop_118
	fxors	%f18,	%f0,	%f5
loop_117:
	te	%xcc,	0x3
	sll	%i3,	%i2,	%l3
loop_118:
	edge16l	%l5,	%i1,	%o7
	fnors	%f1,	%f8,	%f24
	array8	%o1,	%l1,	%o5
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f20
	fxtod	%f20,	%f0
	set	0x2B, %o4
	ldsba	[%l7 + %o4] 0x80,	%g7
	edge8l	%o4,	%g5,	%i5
	fbge,a	%fcc3,	loop_119
	fpackfix	%f26,	%f18
	ldstub	[%l7 + 0x43],	%g4
	fcmpne32	%f16,	%f14,	%g2
loop_119:
	alignaddr	%o3,	%l2,	%l6
	edge8n	%o6,	%o2,	%g6
	addcc	%o0,	0x1F16,	%g3
	bcs,pn	%icc,	loop_120
	sethi	0x0B77,	%l0
	popc	%g1,	%i7
	fmovspos	%icc,	%f17,	%f7
loop_120:
	tcc	%xcc,	0x6
	tl	%icc,	0x7
	movrlz	%i0,	0x229,	%i4
	move	%icc,	%i6,	%l4
	array16	%i2,	%i3,	%l3
	fmovdcs	%icc,	%f15,	%f25
	fmovdvc	%icc,	%f24,	%f7
	sll	%l5,	%i1,	%o7
	tvc	%icc,	0x2
	fmovdne	%xcc,	%f5,	%f28
	set	0x08, %g5
	ldsha	[%l7 + %g5] 0x15,	%l1
	move	%icc,	%o1,	%g7
	movge	%icc,	%o4,	%g5
	edge16ln	%i5,	%o5,	%g2
	srlx	%g4,	%l2,	%o3
	xorcc	%l6,	%o6,	%g6
	array32	%o0,	%o2,	%g3
	and	%l0,	%i7,	%g1
	popc	0x18C7,	%i0
	array16	%i4,	%i6,	%l4
	tle	%icc,	0x3
	udiv	%i3,	0x1532,	%l3
	fmovsvs	%icc,	%f10,	%f1
	movcs	%icc,	%i2,	%l5
	subcc	%i1,	0x0C8A,	%o7
	fmovsge	%icc,	%f8,	%f29
	fmovrdgz	%o1,	%f0,	%f0
	fornot1s	%f26,	%f24,	%f3
	xor	%l1,	0x0914,	%o4
	subcc	%g5,	%i5,	%g7
	fpack16	%f10,	%f25
	tvs	%xcc,	0x0
	orcc	%g2,	0x17EA,	%g4
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x78] %asi,	%o5
	fcmpgt16	%f8,	%f30,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l6,	0x13CB,	%o3
	tneg	%icc,	0x7
	umulcc	%o6,	0x10E4,	%g6
	fnot1	%f4,	%f2
	fcmple32	%f30,	%f16,	%o0
	fmovdvs	%icc,	%f4,	%f5
	addccc	%o2,	0x04B7,	%l0
	stw	%i7,	[%l7 + 0x58]
	orncc	%g3,	0x0A1D,	%i0
	nop
	fitos	%f6,	%f6
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x76] %asi,	%i4
	fmovsa	%xcc,	%f10,	%f11
	bvs,a,pt	%icc,	loop_121
	edge32n	%g1,	%l4,	%i6
	fmul8x16au	%f21,	%f20,	%f6
	movg	%xcc,	%i3,	%l3
loop_121:
	nop
	set	0x1E, %i0
	lduba	[%l7 + %i0] 0x10,	%l5
	popc	%i1,	%i2
	nop
	setx	0xB03D2614DC82A72F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x704D588239EAD154,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f16,	%f4
	taddcctv	%o7,	0x1963,	%o1
	andn	%l1,	0x06CF,	%o4
	fxors	%f9,	%f13,	%f15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%g5,	loop_122
	xnorcc	%g7,	%i5,	%g4
	addccc	%g2,	0x10D3,	%l2
	subccc	%o5,	0x04D0,	%l6
loop_122:
	edge16	%o3,	%g6,	%o0
	bl,a,pn	%icc,	loop_123
	stbar
	edge32ln	%o2,	%l0,	%o6
	popc	0x0E6F,	%g3
loop_123:
	fors	%f2,	%f21,	%f11
	membar	0x1D
	bpos,a,pn	%icc,	loop_124
	ldub	[%l7 + 0x72],	%i7
	ldsw	[%l7 + 0x74],	%i4
	xnorcc	%i0,	%g1,	%l4
loop_124:
	movpos	%xcc,	%i6,	%i3
	wr	%g0,	0xe2,	%asi
	stha	%l3,	[%l7 + 0x72] %asi
	membar	#Sync
	st	%f30,	[%l7 + 0x40]
	flush	%l7 + 0x54
	tgu	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l5,	%i2,	%o7
	fmovsge	%xcc,	%f25,	%f4
	edge8ln	%o1,	%i1,	%l1
	ldsb	[%l7 + 0x6F],	%o4
	tsubcctv	%g7,	%i5,	%g4
	fba	%fcc3,	loop_125
	movre	%g2,	0x049,	%l2
	sra	%g5,	%l6,	%o3
	fbl,a	%fcc2,	loop_126
loop_125:
	fone	%f2
	tgu	%xcc,	0x6
	subccc	%o5,	0x0B7F,	%o0
loop_126:
	edge16l	%g6,	%o2,	%o6
	sethi	0x0F7E,	%g3
	edge16l	%i7,	%l0,	%i4
	bleu,a	%xcc,	loop_127
	movrgz	%i0,	%g1,	%i6
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x2A] %asi,	%l4
loop_127:
	fornot2	%f2,	%f0,	%f2
	smulcc	%l3,	0x08BB,	%i3
	fands	%f31,	%f31,	%f5
	nop
	setx	0x2F247776904E391B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fmovdpos	%icc,	%f7,	%f15
	fble,a	%fcc3,	loop_128
	tl	%xcc,	0x6
	bpos	%icc,	loop_129
	bneg,a,pt	%xcc,	loop_130
loop_128:
	edge8	%i2,	%l5,	%o7
	subcc	%o1,	%l1,	%o4
loop_129:
	sub	%i1,	%g7,	%i5
loop_130:
	movge	%xcc,	%g2,	%l2
	sir	0x08FE
	fmovsneg	%icc,	%f30,	%f17
	nop
	fitos	%f9,	%f30
	fstod	%f30,	%f26
	array32	%g4,	%l6,	%o3
	orcc	%g5,	%o0,	%g6
	fpackfix	%f2,	%f0
	fcmpeq32	%f18,	%f18,	%o2
	umul	%o5,	%o6,	%g3
	fbn	%fcc2,	loop_131
	andcc	%l0,	%i7,	%i4
	edge8ln	%i0,	%i6,	%l4
	fnot2	%f12,	%f8
loop_131:
	movge	%xcc,	%g1,	%i3
	fmovs	%f13,	%f20
	nop
	setx loop_132, %l0, %l1
	jmpl %l1, %l3
	ld	[%l7 + 0x78],	%f6
	srax	%i2,	0x0F,	%o7
	tcs	%icc,	0x6
loop_132:
	udivcc	%o1,	0x013C,	%l1
	tge	%icc,	0x6
	bne,a,pt	%icc,	loop_133
	mova	%xcc,	%o4,	%i1
	fmovscc	%icc,	%f0,	%f1
	srlx	%l5,	0x1F,	%i5
loop_133:
	fandnot1s	%f8,	%f23,	%f4
	sdivx	%g2,	0x11E9,	%l2
	tleu	%xcc,	0x0
	srlx	%g7,	%l6,	%o3
	fmovde	%icc,	%f14,	%f4
	fbge,a	%fcc0,	loop_134
	movge	%icc,	%g5,	%o0
	be,pt	%icc,	loop_135
	tl	%xcc,	0x7
loop_134:
	brnz	%g4,	loop_136
	nop
	fitos	%f4,	%f27
loop_135:
	movg	%xcc,	%o2,	%g6
	set	0x78, %l6
	sta	%f19,	[%l7 + %l6] 0x0c
loop_136:
	andn	%o5,	0x041A,	%g3
	edge16	%o6,	%l0,	%i4
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x50] %asi,	%i7
	edge32n	%i0,	%i6,	%g1
	fmuld8ulx16	%f4,	%f3,	%f4
	nop
	setx loop_137, %l0, %l1
	jmpl %l1, %l4
	ldub	[%l7 + 0x75],	%i3
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i2
loop_137:
	brlz	%l3,	loop_138
	fbul	%fcc3,	loop_139
	fba	%fcc2,	loop_140
	ld	[%l7 + 0x10],	%f14
loop_138:
	fmovsl	%xcc,	%f27,	%f25
loop_139:
	movcc	%icc,	%o7,	%o1
loop_140:
	prefetch	[%l7 + 0x50],	 0x3
	fmovrdne	%l1,	%f26,	%f10
	tg	%icc,	0x3
	andncc	%o4,	%i1,	%i5
	movrlez	%l5,	%l2,	%g7
	fnot2s	%f30,	%f25
	fcmpne32	%f16,	%f22,	%l6
	tvs	%xcc,	0x3
	tpos	%xcc,	0x0
	sub	%o3,	0x1572,	%g2
	fexpand	%f2,	%f14
	fbue	%fcc3,	loop_141
	fmovdvs	%xcc,	%f8,	%f8
	fbe	%fcc3,	loop_142
	taddcctv	%o0,	0x18BE,	%g5
loop_141:
	lduw	[%l7 + 0x6C],	%g4
	sra	%g6,	0x19,	%o2
loop_142:
	movvc	%xcc,	%o5,	%g3
	tn	%icc,	0x7
	array16	%l0,	%i4,	%i7
	brz,a	%i0,	loop_143
	membar	0x6D
	and	%o6,	%i6,	%g1
	tg	%icc,	0x6
loop_143:
	tleu	%icc,	0x2
	ldd	[%l7 + 0x68],	%l4
	movpos	%icc,	%i2,	%i3
	xorcc	%o7,	%l3,	%l1
	nop
	fitod	%f8,	%f6
	fdtoi	%f6,	%f26
	fcmpgt32	%f2,	%f2,	%o4
	subccc	%i1,	%o1,	%l5
	ldub	[%l7 + 0x45],	%i5
	fpack32	%f28,	%f22,	%f14
	fornot1s	%f18,	%f8,	%f18
	fbl,a	%fcc0,	loop_144
	fmovrdlez	%l2,	%f20,	%f4
	movrlez	%l6,	0x2FC,	%o3
	movg	%xcc,	%g7,	%g2
loop_144:
	tl	%xcc,	0x6
	sdivcc	%g5,	0x1271,	%g4
	movrgz	%o0,	%o2,	%g6
	nop
	set	0x61, %o7
	ldub	[%l7 + %o7],	%o5
	movvs	%icc,	%g3,	%l0
	set	0x2C, %i5
	ldsha	[%l7 + %i5] 0x19,	%i7
	addcc	%i0,	%o6,	%i6
	tn	%icc,	0x1
	set	0x0, %i7
	stxa	%i4,	[%g0 + %i7] 0x57
	edge32n	%l4,	%g1,	%i2
	nop
	setx	0x93A0E336F136CCDC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x0F1B7F58CA342369,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f28,	%f26
	movpos	%icc,	%o7,	%l3
	set	0x58, %o1
	ldsha	[%l7 + %o1] 0x81,	%l1
	bcc,a,pt	%xcc,	loop_145
	brnz	%i3,	loop_146
	addcc	%i1,	0x13B9,	%o4
	edge8l	%o1,	%i5,	%l2
loop_145:
	fmovdleu	%icc,	%f29,	%f8
loop_146:
	edge32l	%l5,	%o3,	%l6
	movne	%icc,	%g2,	%g7
	addccc	%g5,	%g4,	%o0
	nop
	setx loop_147, %l0, %l1
	jmpl %l1, %o2
	nop
	setx	0x3706F8A3A0593152,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	taddcctv	%o5,	0x066F,	%g3
	bgu	loop_148
loop_147:
	sub	%l0,	%i7,	%g6
	movpos	%xcc,	%o6,	%i0
	fmovsgu	%xcc,	%f21,	%f2
loop_148:
	bvc	loop_149
	sdivx	%i4,	0x0E7D,	%i6
	sub	%l4,	0x002A,	%i2
	te	%xcc,	0x6
loop_149:
	mulscc	%g1,	0x1837,	%l3
	set	0x49, %o6
	ldstuba	[%l7 + %o6] 0x11,	%o7
	alignaddr	%l1,	%i3,	%i1
	array8	%o1,	%o4,	%l2
	movl	%xcc,	%i5,	%l5
	smulcc	%l6,	%o3,	%g7
	set	0x68, %g3
	prefetcha	[%l7 + %g3] 0x88,	 0x2
	tsubcc	%g4,	0x0E48,	%g2
	be	loop_150
	orn	%o2,	%o5,	%o0
	tl	%xcc,	0x0
	fmovdneg	%xcc,	%f8,	%f5
loop_150:
	umulcc	%l0,	%i7,	%g3
	fmovrdlez	%o6,	%f30,	%f2
	edge8l	%i0,	%i4,	%g6
	tvs	%xcc,	0x6
	tl	%icc,	0x4
	bl,pt	%xcc,	loop_151
	umulcc	%i6,	0x1C40,	%l4
	movgu	%xcc,	%i2,	%l3
	movleu	%icc,	%g1,	%l1
loop_151:
	edge8l	%i3,	%o7,	%i1
	orn	%o4,	0x0AC9,	%l2
	tcc	%xcc,	0x4
	bneg,a,pt	%xcc,	loop_152
	ta	%icc,	0x4
	edge8l	%i5,	%l5,	%l6
	addcc	%o1,	%g7,	%o3
loop_152:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x50] %asi,	%g4
	alignaddr	%g5,	%g2,	%o2
	xorcc	%o5,	%l0,	%o0
	bpos,a	%xcc,	loop_153
	fbug	%fcc2,	loop_154
	movne	%xcc,	%g3,	%o6
	movrne	%i7,	0x12C,	%i0
loop_153:
	edge16	%i4,	%i6,	%g6
loop_154:
	sethi	0x1747,	%l4
	tsubcc	%i2,	%l3,	%l1
	stb	%i3,	[%l7 + 0x36]
	fpsub16s	%f3,	%f10,	%f13
	fsrc2	%f20,	%f6
	movrlz	%o7,	%i1,	%g1
	movrgz	%l2,	0x3EF,	%i5
	sll	%o4,	0x14,	%l6
	bne,a,pt	%icc,	loop_155
	sir	0x005B
	brlez	%l5,	loop_156
	edge32n	%o1,	%g7,	%o3
loop_155:
	edge32	%g4,	%g2,	%o2
	stbar
loop_156:
	fmul8x16	%f10,	%f10,	%f10
	fblg,a	%fcc3,	loop_157
	edge32	%g5,	%l0,	%o0
	nop
	set	0x74, %o0
	lduw	[%l7 + %o0],	%g3
	movvc	%xcc,	%o5,	%i7
loop_157:
	movrne	%i0,	0x230,	%i4
	fbue	%fcc1,	loop_158
	ldub	[%l7 + 0x65],	%i6
	sub	%g6,	0x1E72,	%l4
	movcc	%xcc,	%o6,	%l3
loop_158:
	bneg,a	%xcc,	loop_159
	movleu	%icc,	%l1,	%i2
	fmovrslz	%i3,	%f6,	%f6
	bneg	%xcc,	loop_160
loop_159:
	edge16n	%o7,	%i1,	%g1
	movrgz	%i5,	0x023,	%l2
	ldd	[%l7 + 0x68],	%f22
loop_160:
	nop
	set	0x27, %l3
	stb	%o4,	[%l7 + %l3]
	bl,a	loop_161
	bgu,a,pn	%xcc,	loop_162
	fxnor	%f10,	%f28,	%f2
	tg	%xcc,	0x3
loop_161:
	tge	%xcc,	0x6
loop_162:
	fpack32	%f14,	%f8,	%f6
	tneg	%icc,	0x5
	movge	%icc,	%l5,	%o1
	fones	%f0
	fbuge,a	%fcc3,	loop_163
	tpos	%icc,	0x1
	orcc	%g7,	%o3,	%l6
	faligndata	%f4,	%f14,	%f8
loop_163:
	subc	%g4,	%o2,	%g2
	fmovdg	%xcc,	%f4,	%f9
	addcc	%g5,	0x0433,	%l0
	mova	%icc,	%o0,	%g3
	tne	%xcc,	0x3
	fcmpeq16	%f30,	%f26,	%i7
	fbo,a	%fcc1,	loop_164
	movge	%icc,	%o5,	%i0
	andcc	%i4,	0x194A,	%g6
	stbar
loop_164:
	xnorcc	%l4,	0x18DC,	%o6
	bvc,pt	%icc,	loop_165
	xnorcc	%l3,	%i6,	%i2
	tleu	%icc,	0x4
	mulscc	%l1,	0x10DC,	%i3
loop_165:
	stbar
	fornot2	%f4,	%f22,	%f22
	fone	%f8
	andn	%o7,	%i1,	%g1
	bn,pt	%xcc,	loop_166
	tvs	%icc,	0x1
	sll	%i5,	0x1C,	%o4
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f28
loop_166:
	alignaddrl	%l2,	%o1,	%l5
	nop
	setx	0xD8F7C635,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x007FC866,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f9,	%f18
	mulscc	%o3,	%g7,	%g4
	tneg	%icc,	0x1
	andn	%o2,	0x1388,	%l6
	xor	%g5,	%g2,	%o0
	fmovrslez	%l0,	%f29,	%f28
	bcc	%xcc,	loop_167
	umulcc	%i7,	0x0CDF,	%o5
	fmul8x16al	%f25,	%f1,	%f18
	and	%g3,	0x1366,	%i0
loop_167:
	smulcc	%g6,	%l4,	%i4
	taddcc	%o6,	0x0551,	%i6
	movrgez	%l3,	%l1,	%i3
	subccc	%o7,	0x0DCF,	%i2
	edge8	%g1,	%i5,	%i1
	tne	%xcc,	0x0
	smulcc	%l2,	%o1,	%l5
	taddcc	%o4,	0x1E21,	%o3
	tl	%icc,	0x0
	fbn	%fcc3,	loop_168
	stb	%g4,	[%l7 + 0x34]
	sllx	%g7,	0x1B,	%o2
	tsubcc	%g5,	0x1896,	%g2
loop_168:
	ldstub	[%l7 + 0x63],	%l6
	mova	%xcc,	%l0,	%i7
	fandnot1	%f4,	%f18,	%f24
	movleu	%xcc,	%o0,	%g3
	fmuld8sux16	%f9,	%f6,	%f10
	tleu	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	sta	%f19,	[%l7 + 0x60] %asi
	xorcc	%i0,	%g6,	%o5
	fmovsvs	%icc,	%f25,	%f20
	tcc	%icc,	0x7
	fmovsg	%icc,	%f22,	%f11
	sdivcc	%l4,	0x0A96,	%o6
	andcc	%i6,	0x1826,	%i4
	tvc	%xcc,	0x3
	andncc	%l1,	%i3,	%l3
	fsrc2s	%f23,	%f14
	fmovrde	%o7,	%f6,	%f24
	fnors	%f31,	%f21,	%f19
	orcc	%g1,	0x043E,	%i5
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x60] %asi,	%i2
	fmovdle	%xcc,	%f14,	%f8
	fandnot1s	%f1,	%f1,	%f16
	fsrc1	%f14,	%f28
	ta	%icc,	0x0
	fmovs	%f24,	%f17
	fmovsa	%icc,	%f2,	%f26
	popc	0x1C26,	%i1
	andn	%l2,	0x1952,	%o1
	fmul8x16au	%f8,	%f27,	%f16
	tsubcctv	%l5,	0x0A3C,	%o4
	fsrc1s	%f1,	%f26
	taddcctv	%o3,	%g4,	%o2
	movrgz	%g7,	%g2,	%g5
	brnz,a	%l6,	loop_169
	tsubcc	%l0,	%o0,	%g3
	fpadd16	%f4,	%f8,	%f6
	membar	0x20
loop_169:
	fmovsvc	%xcc,	%f21,	%f24
	movge	%icc,	%i0,	%g6
	xnorcc	%i7,	0x0AD1,	%o5
	or	%o6,	0x02E3,	%l4
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x48] %asi,	%f3
	tcs	%xcc,	0x3
	srax	%i4,	0x06,	%i6
	movneg	%icc,	%i3,	%l1
	mova	%icc,	%o7,	%l3
	movgu	%icc,	%g1,	%i5
	bl,a	loop_170
	mulscc	%i2,	%l2,	%i1
	fmovrdlez	%l5,	%f22,	%f16
	mulx	%o1,	0x0B13,	%o4
loop_170:
	bge,a	%xcc,	loop_171
	fmovsge	%xcc,	%f31,	%f12
	fmovsne	%xcc,	%f29,	%f28
	addccc	%g4,	%o2,	%g7
loop_171:
	fandnot2s	%f3,	%f29,	%f11
	edge32l	%o3,	%g5,	%g2
	stx	%l6,	[%l7 + 0x58]
	movn	%xcc,	%l0,	%o0
	fba,a	%fcc0,	loop_172
	tn	%icc,	0x2
	subccc	%g3,	%g6,	%i7
	tsubcc	%i0,	0x1920,	%o6
loop_172:
	movleu	%icc,	%l4,	%o5
	nop
	setx	loop_173,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbl,a	%fcc1,	loop_174
	alignaddr	%i4,	%i3,	%i6
	edge32	%l1,	%l3,	%o7
loop_173:
	tvs	%icc,	0x4
loop_174:
	fbule,a	%fcc0,	loop_175
	fmovrde	%i5,	%f2,	%f28
	tg	%icc,	0x7
	edge32l	%g1,	%l2,	%i2
loop_175:
	andncc	%l5,	%o1,	%o4
	flush	%l7 + 0x30
	movcs	%icc,	%g4,	%i1
	ldsh	[%l7 + 0x20],	%o2
	smul	%o3,	%g5,	%g2
	bpos,a	loop_176
	sra	%l6,	0x05,	%l0
	fbo,a	%fcc3,	loop_177
	mulx	%o0,	0x118B,	%g3
loop_176:
	fmovde	%icc,	%f22,	%f12
	flush	%l7 + 0x14
loop_177:
	tpos	%xcc,	0x3
	fble	%fcc0,	loop_178
	sra	%g7,	%g6,	%i0
	movn	%xcc,	%o6,	%i7
	tpos	%xcc,	0x5
loop_178:
	xorcc	%l4,	%i4,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f0,	%f16
	tne	%icc,	0x1
	bge,pn	%icc,	loop_179
	prefetch	[%l7 + 0x24],	 0x1
	fmovrsne	%i6,	%f25,	%f11
	movrne	%l1,	0x280,	%i3
loop_179:
	fsrc2	%f10,	%f26
	nop
	setx	0x76CADB5C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xAC54729A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f20,	%f13
	taddcctv	%o7,	0x081B,	%i5
	fpackfix	%f30,	%f13
	array16	%g1,	%l3,	%i2
	fones	%f16
	udivcc	%l5,	0x198B,	%l2
	edge8	%o1,	%g4,	%o4
	fabss	%f18,	%f6
	tgu	%icc,	0x3
	edge16l	%i1,	%o3,	%o2
	orn	%g5,	%g2,	%l0
	srlx	%l6,	%g3,	%g7
	movrne	%g6,	0x2D0,	%o0
	tgu	%xcc,	0x3
	smulcc	%o6,	%i0,	%i7
	array8	%i4,	%o5,	%l4
	stb	%l1,	[%l7 + 0x51]
	bleu,pt	%xcc,	loop_180
	xnorcc	%i6,	%o7,	%i3
	or	%g1,	0x10BB,	%i5
	and	%i2,	%l3,	%l2
loop_180:
	sub	%o1,	0x17A6,	%l5
	umulcc	%o4,	0x196C,	%g4
	or	%o3,	%o2,	%g5
	movvc	%icc,	%g2,	%l0
	sdivcc	%i1,	0x1537,	%g3
	movcs	%xcc,	%g7,	%g6
	tneg	%icc,	0x6
	movrne	%l6,	0x27A,	%o0
	udivcc	%i0,	0x0198,	%o6
	udivcc	%i7,	0x1A7F,	%o5
	swap	[%l7 + 0x6C],	%i4
	array32	%l1,	%l4,	%i6
	bneg,a	%xcc,	loop_181
	stw	%i3,	[%l7 + 0x6C]
	fpsub16	%f0,	%f20,	%f10
	smulcc	%o7,	0x1184,	%i5
loop_181:
	tge	%xcc,	0x0
	brnz	%i2,	loop_182
	srl	%g1,	%l3,	%o1
	brlz	%l5,	loop_183
	move	%icc,	%o4,	%g4
loop_182:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2C] %asi,	%o3
loop_183:
	bg,a	loop_184
	movrgz	%l2,	0x383,	%g5
	call	loop_185
	edge8ln	%g2,	%o2,	%i1
loop_184:
	sdiv	%l0,	0x0B9D,	%g7
	sra	%g6,	%g3,	%o0
loop_185:
	fandnot1	%f22,	%f24,	%f16
	srlx	%l6,	%o6,	%i0
	bne,pt	%xcc,	loop_186
	alignaddr	%o5,	%i4,	%l1
	orn	%l4,	0x0A35,	%i6
	stx	%i3,	[%l7 + 0x58]
loop_186:
	orn	%o7,	0x122E,	%i5
	bge,a	%icc,	loop_187
	orncc	%i7,	0x0165,	%i2
	sub	%l3,	%o1,	%g1
	tneg	%xcc,	0x4
loop_187:
	brlz,a	%o4,	loop_188
	movrne	%g4,	0x124,	%o3
	movne	%icc,	%l2,	%l5
	orn	%g5,	%g2,	%o2
loop_188:
	addccc	%i1,	%l0,	%g7
	movrne	%g6,	%g3,	%l6
	set	0x0C, %o2
	lduha	[%l7 + %o2] 0x80,	%o6
	tcc	%xcc,	0x4
	movpos	%xcc,	%i0,	%o5
	srl	%i4,	0x00,	%l1
	fbg	%fcc2,	loop_189
	tpos	%xcc,	0x2
	fbl,a	%fcc3,	loop_190
	tgu	%icc,	0x2
loop_189:
	fpadd32	%f30,	%f18,	%f22
	fnot1	%f26,	%f8
loop_190:
	sir	0x076E
	nop
	fitos	%f8,	%f25
	fstod	%f25,	%f20
	tn	%icc,	0x3
	move	%xcc,	%o0,	%l4
	and	%i6,	0x0D5F,	%i3
	brlz	%i5,	loop_191
	bneg,a,pn	%xcc,	loop_192
	sllx	%i7,	%i2,	%o7
	edge32n	%l3,	%g1,	%o4
loop_191:
	fbuge	%fcc0,	loop_193
loop_192:
	mova	%xcc,	%g4,	%o1
	subccc	%o3,	%l5,	%l2
	subccc	%g5,	0x150A,	%o2
loop_193:
	tle	%xcc,	0x2
	tne	%xcc,	0x7
	set	0x08, %i3
	ldxa	[%l7 + %i3] 0x80,	%g2
	tne	%icc,	0x1
	fpadd32	%f30,	%f30,	%f8
	fmovspos	%icc,	%f20,	%f24
	brlez,a	%l0,	loop_194
	edge16ln	%g7,	%g6,	%g3
	edge32ln	%l6,	%o6,	%i1
	movrne	%i0,	%i4,	%l1
loop_194:
	edge8ln	%o0,	%o5,	%i6
	wr	%g0,	0x19,	%asi
	sta	%f23,	[%l7 + 0x58] %asi
	bcc,pt	%xcc,	loop_195
	bleu,pt	%icc,	loop_196
	fsrc1	%f10,	%f30
	tl	%icc,	0x1
loop_195:
	tsubcctv	%l4,	0x1705,	%i5
loop_196:
	udivx	%i3,	0x0779,	%i7
	fands	%f0,	%f0,	%f27
	movcs	%xcc,	%i2,	%o7
	fba,a	%fcc1,	loop_197
	udivcc	%l3,	0x152A,	%g1
	pdist	%f16,	%f6,	%f30
	smul	%g4,	0x0643,	%o1
loop_197:
	fmovdg	%icc,	%f17,	%f15
	move	%xcc,	%o4,	%l5
	ldd	[%l7 + 0x08],	%f26
	or	%o3,	%g5,	%o2
	movrgz	%l2,	%l0,	%g7
	movl	%xcc,	%g2,	%g6
	fnor	%f16,	%f2,	%f16
	subc	%g3,	%l6,	%o6
	popc	%i1,	%i4
	fbge,a	%fcc3,	loop_198
	tge	%icc,	0x2
	andcc	%i0,	0x19AB,	%o0
	srl	%o5,	0x16,	%i6
loop_198:
	edge16	%l4,	%l1,	%i3
	movgu	%icc,	%i7,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o7,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g1,	%l3,	%o1
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	udiv	%o4,	0x03B1,	%l5
	xorcc	%g4,	%o3,	%o2
	addccc	%l2,	%l0,	%g5
	edge8l	%g7,	%g2,	%g6
	subcc	%l6,	0x0FEA,	%g3
	movrgez	%o6,	%i1,	%i4
	taddcc	%o0,	%o5,	%i0
	tpos	%xcc,	0x3
	ldd	[%l7 + 0x30],	%f26
	movrgez	%i6,	0x158,	%l4
	ldd	[%l7 + 0x60],	%f8
	movge	%icc,	%l1,	%i3
	subc	%i7,	%i2,	%o7
	fmovdge	%xcc,	%f4,	%f24
	fmovrde	%g1,	%f28,	%f8
	tg	%icc,	0x6
	ta	%icc,	0x5
	edge16n	%i5,	%o1,	%o4
	tne	%xcc,	0x5
	taddcc	%l5,	0x075F,	%l3
	movn	%icc,	%g4,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l2,	%l0,	%g5
	tne	%xcc,	0x3
	fbn,a	%fcc3,	loop_199
	fnot2	%f20,	%f16
	fnot1s	%f19,	%f22
	andncc	%o3,	%g2,	%g6
loop_199:
	ldsb	[%l7 + 0x25],	%g7
	fone	%f26
	bvc	%xcc,	loop_200
	nop
	setx	0x76F558B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x8753D602,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f23,	%f9
	stbar
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x24] %asi,	%l6
loop_200:
	fabsd	%f0,	%f10
	brnz,a	%o6,	loop_201
	fsrc1	%f10,	%f10
	fmul8ulx16	%f6,	%f10,	%f2
	fmovdpos	%xcc,	%f24,	%f11
loop_201:
	ldsb	[%l7 + 0x43],	%g3
	sdivx	%i4,	0x1763,	%i1
	sdiv	%o0,	0x14D4,	%o5
	movrne	%i6,	%i0,	%l1
	membar	0x08
	nop
	setx	0x23B463CE4538A3E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f28
	tpos	%xcc,	0x4
	ldsb	[%l7 + 0x7A],	%i3
	sdivx	%l4,	0x1175,	%i7
	movcc	%icc,	%i2,	%g1
	array32	%i5,	%o7,	%o4
	srl	%o1,	0x0E,	%l5
	fsrc2s	%f15,	%f0
	movre	%g4,	%l3,	%o2
	fmovrdlz	%l2,	%f30,	%f30
	edge8l	%l0,	%g5,	%g2
	mova	%icc,	%o3,	%g7
	edge16n	%l6,	%g6,	%o6
	fmovdvs	%icc,	%f5,	%f7
	movrlz	%g3,	%i1,	%i4
	nop
	fitod	%f13,	%f10
	xor	%o5,	0x09E3,	%o0
	movre	%i0,	%i6,	%l1
	fbug,a	%fcc3,	loop_202
	ble	%icc,	loop_203
	alignaddr	%l4,	%i7,	%i3
	tsubcc	%g1,	0x0B42,	%i2
loop_202:
	fbge,a	%fcc3,	loop_204
loop_203:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%i5,	%o7
	ldx	[%l7 + 0x70],	%o1
loop_204:
	fandnot2s	%f5,	%f27,	%f5
	srlx	%l5,	0x01,	%g4
	fmovrsgez	%l3,	%f27,	%f17
	sethi	0x0D0D,	%o2
	fpsub32	%f10,	%f4,	%f4
	fcmpeq32	%f12,	%f12,	%l2
	addc	%o4,	%l0,	%g5
	stbar
	tsubcc	%o3,	%g7,	%l6
	movneg	%icc,	%g6,	%g2
	taddcc	%o6,	%i1,	%i4
	xorcc	%g3,	0x071E,	%o0
	stw	%i0,	[%l7 + 0x6C]
	edge16ln	%i6,	%l1,	%l4
	fmovdcc	%icc,	%f15,	%f15
	edge32	%i7,	%o5,	%g1
	movge	%xcc,	%i2,	%i5
	edge8n	%o7,	%i3,	%l5
	tpos	%xcc,	0x0
	fnands	%f19,	%f24,	%f13
	tn	%xcc,	0x4
	array8	%o1,	%l3,	%g4
	popc	%o2,	%l2
	ld	[%l7 + 0x1C],	%f25
	tge	%xcc,	0x3
	movl	%icc,	%l0,	%o4
	set	0x48, %g1
	ldsba	[%l7 + %g1] 0x80,	%g5
	andn	%o3,	%l6,	%g7
	ta	%icc,	0x7
	alignaddr	%g6,	%g2,	%o6
	add	%i4,	0x1113,	%i1
	movgu	%icc,	%o0,	%i0
	movcs	%icc,	%i6,	%l1
	stw	%g3,	[%l7 + 0x14]
	fmovsvc	%xcc,	%f25,	%f13
	fandnot1s	%f31,	%f29,	%f6
	fmovscs	%icc,	%f21,	%f5
	bvc,a	%icc,	loop_205
	fnot2s	%f4,	%f6
	nop
	setx	0x905459B8,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	edge16	%i7,	%l4,	%o5
loop_205:
	ldub	[%l7 + 0x0D],	%i2
	movre	%g1,	0x158,	%o7
	fba,a	%fcc2,	loop_206
	srl	%i3,	0x1A,	%i5
	fnors	%f6,	%f16,	%f24
	edge8	%l5,	%l3,	%g4
loop_206:
	fmovrdgz	%o2,	%f26,	%f10
	movrgez	%o1,	0x0B1,	%l0
	sllx	%l2,	0x0F,	%g5
	tsubcc	%o3,	%l6,	%g7
	nop
	fitos	%f7,	%f11
	fstox	%f11,	%f30
	fmovsvc	%xcc,	%f31,	%f23
	alignaddr	%o4,	%g6,	%o6
	te	%icc,	0x2
	tvc	%xcc,	0x7
	bpos,a	loop_207
	srax	%g2,	0x12,	%i1
	movrlez	%o0,	0x0E1,	%i0
	tsubcctv	%i6,	0x0838,	%i4
loop_207:
	nop
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x80
	movneg	%xcc,	%g3,	%l1
	lduh	[%l7 + 0x56],	%l4
	movgu	%xcc,	%o5,	%i2
	fmovscc	%icc,	%f15,	%f28
	srax	%g1,	%i7,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%i5,	%f11,	%f4
	wr	%g0,	0x27,	%asi
	stha	%l5,	[%l7 + 0x40] %asi
	membar	#Sync
	subc	%l3,	%o7,	%o2
	edge16n	%g4,	%o1,	%l0
	bn,a,pn	%icc,	loop_208
	srlx	%g5,	0x0C,	%o3
	smulcc	%l6,	0x00DF,	%g7
	umulcc	%o4,	%g6,	%o6
loop_208:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x64] %asi,	%l2
	tge	%icc,	0x1
	or	%i1,	%o0,	%i0
	fmovrdne	%i6,	%f2,	%f24
	ble,pt	%xcc,	loop_209
	fone	%f12
	nop
	setx	0x093BAFB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x38DA21AC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f2,	%f1
	movvc	%xcc,	%g2,	%g3
loop_209:
	fcmple16	%f18,	%f4,	%l1
	fcmpne16	%f26,	%f0,	%i4
	brlz	%l4,	loop_210
	tsubcc	%o5,	0x0BA6,	%g1
	sra	%i7,	%i2,	%i5
	call	loop_211
loop_210:
	movrne	%i3,	0x3AE,	%l5
	smul	%l3,	%o7,	%g4
	fandnot1	%f28,	%f10,	%f22
loop_211:
	and	%o1,	0x13D6,	%o2
	tne	%icc,	0x6
	movvc	%icc,	%g5,	%o3
	ldstub	[%l7 + 0x13],	%l0
	addcc	%g7,	%l6,	%o4
	edge8n	%g6,	%l2,	%o6
	fmovsvc	%icc,	%f15,	%f1
	fones	%f5
	fbue,a	%fcc1,	loop_212
	te	%xcc,	0x6
	orcc	%i1,	0x020C,	%o0
	orncc	%i6,	%g2,	%i0
loop_212:
	sllx	%l1,	%g3,	%l4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0C] %asi,	%o5
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f26
	fxtod	%f26,	%f20
	fmovsneg	%xcc,	%f14,	%f12
	fpackfix	%f30,	%f21
	nop
	fitod	%f10,	%f28
	fdtos	%f28,	%f7
	ldx	[%l7 + 0x10],	%i4
	fbne	%fcc2,	loop_213
	lduw	[%l7 + 0x20],	%g1
	edge8n	%i7,	%i5,	%i3
	movcs	%xcc,	%l5,	%l3
loop_213:
	addcc	%o7,	0x05B3,	%i2
	fbule,a	%fcc2,	loop_214
	sub	%g4,	%o2,	%o1
	orncc	%o3,	%g5,	%g7
	ta	%xcc,	0x6
loop_214:
	nop
	setx	0xC3E5ABBF20548140,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	ta	%icc,	0x6
	fmovrsgz	%l0,	%f30,	%f21
	bgu,a	loop_215
	fsrc1	%f20,	%f8
	subc	%o4,	%l6,	%l2
	movcs	%icc,	%o6,	%i1
loop_215:
	te	%xcc,	0x4
	fandnot2	%f10,	%f10,	%f24
	fbug	%fcc1,	loop_216
	ba,pt	%xcc,	loop_217
	xnorcc	%o0,	%g6,	%i6
	tvs	%icc,	0x7
loop_216:
	alignaddr	%g2,	%i0,	%g3
loop_217:
	mulx	%l4,	0x03CF,	%o5
	sdivx	%l1,	0x04D1,	%i4
	fmovdcc	%icc,	%f1,	%f0
	movleu	%icc,	%i7,	%g1
	std	%f14,	[%l7 + 0x20]
	addccc	%i5,	0x09CD,	%l5
	smul	%l3,	0x15B5,	%i3
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movg	%icc,	%o7,	%g4
	bvc,pn	%icc,	loop_218
	movre	%o2,	0x2E1,	%o1
	fba	%fcc3,	loop_219
	movcs	%icc,	%i2,	%g5
loop_218:
	tcc	%icc,	0x2
	nop
	setx	loop_220,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_219:
	nop
	fitod	%f12,	%f10
	fdtoi	%f10,	%f17
	fmovsa	%xcc,	%f17,	%f18
	fpsub32s	%f24,	%f13,	%f18
loop_220:
	movrlz	%o3,	0x264,	%g7
	edge16	%l0,	%o4,	%l6
	fmovrdne	%o6,	%f16,	%f30
	brgz	%i1,	loop_221
	orcc	%o0,	0x1CA5,	%g6
	movvc	%xcc,	%i6,	%g2
	andcc	%i0,	%l2,	%g3
loop_221:
	fmovsleu	%icc,	%f25,	%f23
	fmovda	%icc,	%f9,	%f11
	fbn	%fcc2,	loop_222
	ble	loop_223
	tn	%xcc,	0x5
	movcc	%xcc,	%l4,	%o5
loop_222:
	edge8	%i4,	%i7,	%l1
loop_223:
	fxor	%f30,	%f6,	%f4
	edge8n	%g1,	%i5,	%l5
	orcc	%l3,	%o7,	%i3
	tleu	%icc,	0x4
	fmovdle	%icc,	%f26,	%f30
	ldub	[%l7 + 0x21],	%g4
	edge16ln	%o1,	%o2,	%g5
	movg	%icc,	%o3,	%i2
	tge	%icc,	0x6
	bg,pn	%xcc,	loop_224
	taddcctv	%g7,	0x13B1,	%o4
	move	%xcc,	%l6,	%o6
	st	%f26,	[%l7 + 0x38]
loop_224:
	fmovdn	%icc,	%f16,	%f18
	sll	%l0,	0x00,	%o0
	or	%g6,	%i6,	%g2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x2C] %asi,	%i1
	orcc	%l2,	0x10DC,	%i0
	fcmpeq16	%f12,	%f16,	%g3
	umul	%l4,	%i4,	%o5
	srax	%i7,	0x01,	%l1
	fmovsleu	%icc,	%f3,	%f2
	fzeros	%f16
	udivcc	%i5,	0x064F,	%g1
	xorcc	%l5,	0x1B96,	%o7
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x88
	tl	%xcc,	0x5
	tsubcctv	%l3,	%i3,	%o1
	fmovrdlz	%g4,	%f8,	%f8
	movvs	%xcc,	%g5,	%o2
	fmovrdgez	%o3,	%f12,	%f28
	edge8	%g7,	%o4,	%l6
	tvc	%icc,	0x6
	wr	%g0,	0x22,	%asi
	stha	%i2,	[%l7 + 0x14] %asi
	membar	#Sync
	faligndata	%f10,	%f8,	%f18
	movrgz	%o6,	0x33B,	%o0
	sdivx	%g6,	0x08CB,	%i6
	xnor	%g2,	0x0562,	%i1
	ldstub	[%l7 + 0x18],	%l2
	fmovdcc	%icc,	%f16,	%f21
	nop
	set	0x65, %i2
	stb	%i0,	[%l7 + %i2]
	fbl,a	%fcc2,	loop_225
	bleu,a,pn	%icc,	loop_226
	nop
	fitos	%f11,	%f6
	fstox	%f6,	%f6
	sdivx	%g3,	0x0099,	%l4
loop_225:
	movgu	%xcc,	%i4,	%o5
loop_226:
	fbuge	%fcc2,	loop_227
	edge16	%l0,	%i7,	%l1
	subcc	%g1,	%i5,	%l5
	fmovdpos	%icc,	%f26,	%f20
loop_227:
	fpadd32	%f10,	%f20,	%f10
	alignaddr	%l3,	%i3,	%o7
	movrlz	%g4,	0x3D4,	%o1
	sethi	0x093F,	%o2
	or	%g5,	0x031D,	%g7
	alignaddrl	%o4,	%l6,	%i2
	edge8n	%o3,	%o0,	%g6
	swap	[%l7 + 0x58],	%o6
	fbne,a	%fcc2,	loop_228
	fmovrdlez	%g2,	%f20,	%f26
	orncc	%i1,	0x0CEE,	%i6
	movg	%icc,	%i0,	%l2
loop_228:
	alignaddr	%l4,	%i4,	%o5
	taddcctv	%l0,	%g3,	%l1
	nop
	setx	0x92D85D16,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f17
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x70] %asi,	%g1
	bleu,pn	%xcc,	loop_229
	fbo,a	%fcc1,	loop_230
	edge8n	%i7,	%i5,	%l5
	tvs	%icc,	0x4
loop_229:
	bne,pn	%icc,	loop_231
loop_230:
	movrne	%i3,	%o7,	%l3
	tneg	%xcc,	0x0
	fandnot2	%f24,	%f8,	%f12
loop_231:
	array16	%o1,	%g4,	%o2
	fmovdneg	%xcc,	%f25,	%f15
	xnorcc	%g5,	%g7,	%o4
	sethi	0x18E7,	%l6
	fandnot2s	%f20,	%f14,	%f14
	umulcc	%i2,	%o0,	%o3
	nop
	fitos	%f1,	%f22
	fstox	%f22,	%f14
	udiv	%g6,	0x0FA5,	%o6
	tg	%xcc,	0x1
	smulcc	%g2,	%i1,	%i6
	subcc	%i0,	%l4,	%i4
	fba	%fcc2,	loop_232
	fornot1s	%f19,	%f11,	%f23
	taddcc	%l2,	0x05A7,	%o5
	fbu,a	%fcc2,	loop_233
loop_232:
	brlz	%l0,	loop_234
	orncc	%g3,	0x14D8,	%g1
	movrlez	%l1,	0x07E,	%i5
loop_233:
	fpack32	%f0,	%f12,	%f22
loop_234:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x10] %asi,	%i7
	bg,a	loop_235
	alignaddrl	%i3,	%l5,	%o7
	umul	%o1,	0x0270,	%g4
	sdivx	%l3,	0x0450,	%o2
loop_235:
	tvc	%xcc,	0x2
	subc	%g7,	0x1A66,	%o4
	nop
	setx	0x5CBD270B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xD4B478BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f28,	%f27
	movpos	%xcc,	%g5,	%l6
	movrlez	%o0,	%o3,	%g6
	popc	0x1D5E,	%o6
	xnorcc	%i2,	%g2,	%i6
	movneg	%xcc,	%i0,	%l4
	smul	%i4,	%i1,	%o5
	sra	%l0,	0x12,	%l2
	fmovsvs	%xcc,	%f11,	%f9
	bcc,pt	%icc,	loop_236
	umul	%g3,	0x0D0F,	%l1
	sdivcc	%i5,	0x1611,	%g1
	movrlz	%i3,	%i7,	%o7
loop_236:
	sdivcc	%l5,	0x0225,	%o1
	ldd	[%l7 + 0x58],	%f4
	umulcc	%l3,	0x0CEF,	%o2
	orn	%g7,	%o4,	%g5
	tl	%icc,	0x7
	sir	0x1728
	srax	%l6,	%o0,	%g4
	st	%f21,	[%l7 + 0x54]
	andcc	%o3,	0x10AE,	%g6
	xorcc	%o6,	0x0F02,	%g2
	fmul8x16	%f6,	%f12,	%f22
	membar	0x36
	bgu,pt	%icc,	loop_237
	fnot2	%f0,	%f4
	subccc	%i6,	%i2,	%l4
	movpos	%icc,	%i0,	%i4
loop_237:
	andn	%i1,	%o5,	%l0
	movrlz	%l2,	%l1,	%i5
	prefetch	[%l7 + 0x48],	 0x3
	edge16ln	%g1,	%g3,	%i7
	edge16n	%i3,	%o7,	%o1
	tsubcctv	%l3,	0x0F87,	%l5
	fpmerge	%f23,	%f4,	%f4
	movpos	%xcc,	%o2,	%g7
	nop
	fitod	%f4,	%f14
	fdtos	%f14,	%f28
	movrne	%o4,	0x0CB,	%g5
	movgu	%xcc,	%o0,	%l6
	tvs	%icc,	0x2
	fmovd	%f14,	%f12
	bn,a,pt	%icc,	loop_238
	movn	%xcc,	%g4,	%o3
	tcc	%xcc,	0x3
	xorcc	%g6,	%o6,	%i6
loop_238:
	subcc	%i2,	0x1C29,	%g2
	edge32ln	%i0,	%i4,	%l4
	array32	%o5,	%l0,	%l2
	move	%xcc,	%i1,	%l1
	fmovda	%icc,	%f23,	%f12
	tneg	%icc,	0x7
	tle	%xcc,	0x2
	xnor	%i5,	0x0712,	%g3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i7
	nop
	setx	0x55EDDF6D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f7
	nop
	setx	0x05104D9F2387CCE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x61E806365D8999AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f14,	%f12
	umulcc	%g1,	0x1CC3,	%i3
	movn	%xcc,	%o7,	%o1
	fmul8ulx16	%f20,	%f6,	%f24
	ble,pt	%xcc,	loop_239
	udiv	%l5,	0x136B,	%o2
	smulcc	%l3,	0x1CC6,	%g7
	edge8l	%g5,	%o4,	%l6
loop_239:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%icc,	%f29,	%f22
	sth	%o0,	[%l7 + 0x56]
	fcmpne32	%f0,	%f14,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g4,	%o6,	%g6
	fmul8ulx16	%f2,	%f16,	%f6
	array32	%i6,	%g2,	%i0
	tvc	%xcc,	0x3
	fmovdvc	%xcc,	%f18,	%f20
	tvc	%xcc,	0x2
	movle	%xcc,	%i4,	%i2
	ta	%xcc,	0x0
	fba,a	%fcc0,	loop_240
	fmovsneg	%xcc,	%f4,	%f3
	srax	%l4,	%l0,	%l2
	mulscc	%o5,	%l1,	%i5
loop_240:
	fandnot2	%f18,	%f30,	%f30
	fmovrdlz	%g3,	%f4,	%f14
	fmovrsne	%i7,	%f0,	%f19
	edge16	%i1,	%i3,	%g1
	addccc	%o1,	%o7,	%l5
	fpmerge	%f10,	%f3,	%f0
	alignaddrl	%o2,	%g7,	%l3
	nop
	fitod	%f12,	%f2
	fdtoi	%f2,	%f1
	be,a	loop_241
	ldub	[%l7 + 0x77],	%g5
	set	0x74, %l1
	lduwa	[%l7 + %l1] 0x19,	%l6
loop_241:
	sethi	0x1063,	%o0
	andn	%o4,	0x049E,	%o3
	orn	%g4,	%g6,	%i6
	tsubcctv	%o6,	0x1A49,	%i0
	std	%f16,	[%l7 + 0x40]
	stx	%g2,	[%l7 + 0x08]
	udivcc	%i4,	0x118A,	%l4
	ble	loop_242
	fmovrse	%l0,	%f9,	%f10
	fmovrslz	%i2,	%f22,	%f1
	array32	%l2,	%o5,	%i5
loop_242:
	srlx	%l1,	0x19,	%i7
	fmovdpos	%xcc,	%f0,	%f8
	sdivcc	%i1,	0x025A,	%g3
	smulcc	%i3,	%o1,	%o7
	fones	%f25
	subcc	%g1,	0x1242,	%l5
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x16,	%f0
	fornot1s	%f18,	%f13,	%f11
	fmovrdlez	%g7,	%f26,	%f24
	fsrc2	%f12,	%f18
	subc	%l3,	0x0D05,	%o2
	fpsub32s	%f22,	%f18,	%f31
	udivx	%g5,	0x0650,	%o0
	lduh	[%l7 + 0x3A],	%l6
	edge8l	%o3,	%g4,	%g6
	movne	%icc,	%i6,	%o4
	fcmpgt16	%f20,	%f0,	%o6
	bg,a,pn	%xcc,	loop_243
	tg	%xcc,	0x1
	bcc	loop_244
	fble	%fcc2,	loop_245
loop_243:
	nop
	fitos	%f3,	%f13
	fstox	%f13,	%f20
	fxtos	%f20,	%f4
	stx	%g2,	[%l7 + 0x08]
loop_244:
	subc	%i4,	0x068C,	%l4
loop_245:
	nop
	fitod	%f0,	%f24
	fdtoi	%f24,	%f3
	bgu,pt	%xcc,	loop_246
	alignaddrl	%i0,	%l0,	%l2
	sra	%i2,	0x1A,	%o5
	fbule	%fcc3,	loop_247
loop_246:
	fbuge	%fcc3,	loop_248
	tle	%xcc,	0x2
	fabss	%f13,	%f2
loop_247:
	srlx	%i5,	0x03,	%l1
loop_248:
	brz	%i7,	loop_249
	nop
	setx	loop_250,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%xcc,	%i1,	%i3
	xnorcc	%o1,	%g3,	%o7
loop_249:
	fbu,a	%fcc1,	loop_251
loop_250:
	udiv	%g1,	0x0685,	%l5
	te	%xcc,	0x1
	edge16n	%l3,	%o2,	%g5
loop_251:
	edge8	%g7,	%l6,	%o3
	brz	%g4,	loop_252
	fmovdl	%xcc,	%f20,	%f3
	edge8	%o0,	%i6,	%g6
	edge16l	%o4,	%g2,	%o6
loop_252:
	edge16	%i4,	%l4,	%i0
	udiv	%l0,	0x1EFB,	%i2
	tle	%xcc,	0x3
	subccc	%l2,	%i5,	%o5
	and	%i7,	%i1,	%i3
	fmovrdgz	%l1,	%f24,	%f2
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x89
	fornot2	%f28,	%f0,	%f4
	fbug,a	%fcc1,	loop_253
	fornot1	%f2,	%f10,	%f20
	lduw	[%l7 + 0x44],	%o1
	tgu	%xcc,	0x6
loop_253:
	movne	%xcc,	%g3,	%o7
	srlx	%l5,	0x15,	%g1
	smul	%l3,	0x094F,	%o2
	movvs	%xcc,	%g5,	%g7
	ldd	[%l7 + 0x78],	%f20
	fsrc2s	%f1,	%f27
	array32	%l6,	%g4,	%o0
	mova	%xcc,	%i6,	%g6
	fmovrdne	%o4,	%f10,	%f10
	edge32n	%o3,	%o6,	%g2
	edge16l	%l4,	%i4,	%l0
	taddcctv	%i0,	0x1FE3,	%l2
	taddcctv	%i5,	%i2,	%i7
	edge16	%o5,	%i1,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o1,	%g3,	%l1
	mulx	%l5,	%g1,	%o7
	alignaddr	%o2,	%g5,	%l3
	movne	%xcc,	%l6,	%g4
	fmovsvc	%xcc,	%f14,	%f28
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x64] %asi,	%o0
	stbar
	bvc,pn	%icc,	loop_254
	tcc	%xcc,	0x2
	edge8n	%g7,	%g6,	%o4
	xnor	%o3,	0x032B,	%i6
loop_254:
	movle	%xcc,	%g2,	%l4
	xorcc	%o6,	0x1AB9,	%l0
	fabss	%f23,	%f2
	fpadd32s	%f17,	%f6,	%f20
	movneg	%xcc,	%i0,	%l2
	fpsub16	%f30,	%f24,	%f26
	tneg	%icc,	0x6
	fbuge	%fcc1,	loop_255
	tvs	%xcc,	0x6
	srax	%i4,	0x00,	%i5
	lduw	[%l7 + 0x74],	%i2
loop_255:
	ldd	[%l7 + 0x70],	%f28
	tl	%xcc,	0x4
	and	%i7,	0x19A4,	%o5
	fmul8x16au	%f18,	%f29,	%f24
	movrlez	%i1,	0x17E,	%o1
	orn	%i3,	0x18D4,	%g3
	edge8ln	%l5,	%g1,	%l1
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%o7
	brnz,a	%g5,	loop_256
	fmovdvc	%icc,	%f19,	%f19
	bvs,a	%xcc,	loop_257
	fnot1s	%f4,	%f22
loop_256:
	tl	%icc,	0x6
	mulx	%o2,	%l3,	%l6
loop_257:
	array32	%o0,	%g7,	%g4
	move	%xcc,	%g6,	%o3
	fcmpgt32	%f0,	%f24,	%o4
	fsrc2	%f2,	%f16
	movne	%icc,	%g2,	%l4
	xnorcc	%i6,	0x1F6A,	%o6
	fand	%f16,	%f30,	%f20
	movrne	%l0,	%l2,	%i0
	edge32	%i4,	%i2,	%i7
	bcs	%icc,	loop_258
	edge16ln	%o5,	%i5,	%i1
	sdivcc	%o1,	0x01DF,	%g3
	tcs	%icc,	0x0
loop_258:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x70] %asi,	%i3
	edge8n	%l5,	%l1,	%g1
	fsrc1s	%f31,	%f1
	addc	%g5,	0x1F3F,	%o7
	tge	%xcc,	0x1
	andcc	%o2,	%l6,	%o0
	sth	%l3,	[%l7 + 0x24]
	tcc	%xcc,	0x1
	fornot1	%f26,	%f14,	%f24
	fnands	%f17,	%f2,	%f27
	nop
	setx	0x6B3B8FBC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x4AAA7717,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f13,	%f16
	alignaddrl	%g7,	%g6,	%o3
	tl	%icc,	0x3
	fnand	%f24,	%f4,	%f14
	ldd	[%l7 + 0x38],	%f26
	umul	%o4,	0x11FE,	%g2
	popc	0x07DD,	%l4
	edge32ln	%i6,	%o6,	%g4
	fbe	%fcc3,	loop_259
	edge8	%l2,	%l0,	%i4
	fmovrdlz	%i0,	%f10,	%f26
	fnegs	%f28,	%f31
loop_259:
	move	%icc,	%i2,	%i7
	bpos,a	loop_260
	movrgez	%o5,	0x266,	%i5
	mova	%xcc,	%i1,	%o1
	tg	%xcc,	0x5
loop_260:
	lduh	[%l7 + 0x56],	%g3
	tleu	%xcc,	0x0
	movleu	%xcc,	%i3,	%l5
	fmovdvc	%icc,	%f5,	%f27
	set	0x74, %g2
	stwa	%g1,	[%l7 + %g2] 0xeb
	membar	#Sync
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%g5
	alignaddr	%o7,	%l6,	%o2
	fba,a	%fcc0,	loop_261
	fnegd	%f20,	%f16
	tvc	%xcc,	0x4
	ldd	[%l7 + 0x20],	%f30
loop_261:
	sir	0x171F
	te	%icc,	0x1
	sll	%l3,	0x03,	%g7
	orn	%o0,	0x11B7,	%g6
	addcc	%o3,	%g2,	%o4
	sll	%l4,	%i6,	%o6
	tge	%icc,	0x5
	fcmpgt16	%f2,	%f12,	%l2
	fmovdgu	%icc,	%f7,	%f17
	bpos,a,pn	%xcc,	loop_262
	movne	%icc,	%g4,	%i4
	addccc	%i0,	%i2,	%l0
	alignaddrl	%i7,	%i5,	%o5
loop_262:
	fmovdcc	%xcc,	%f30,	%f28
	tl	%icc,	0x2
	movl	%icc,	%i1,	%o1
	ldsh	[%l7 + 0x52],	%g3
	fornot2	%f2,	%f16,	%f16
	nop
	setx	0x8AB36C33,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x4061E3CF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f17,	%f14
	srl	%l5,	0x14,	%g1
	or	%i3,	%l1,	%g5
	fnot1	%f16,	%f14
	fmovrsgez	%o7,	%f17,	%f18
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o2
	fmovsn	%icc,	%f0,	%f30
	fone	%f16
	andncc	%l6,	%l3,	%o0
	fmovrdlez	%g7,	%f16,	%f2
	wr	%g0,	0x0c,	%asi
	sta	%f27,	[%l7 + 0x18] %asi
	movne	%icc,	%g6,	%g2
	brgz	%o4,	loop_263
	xnor	%l4,	0x07D9,	%i6
	xnorcc	%o6,	0x17F2,	%o3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%i4
loop_263:
	smul	%i0,	%l2,	%i2
	movl	%icc,	%l0,	%i5
	fbl	%fcc1,	loop_264
	fmovsvs	%icc,	%f13,	%f12
	ldx	[%l7 + 0x38],	%i7
	or	%o5,	0x06B0,	%o1
loop_264:
	edge16l	%g3,	%l5,	%i1
	fbue	%fcc0,	loop_265
	nop
	fitod	%f12,	%f16
	fdtoi	%f16,	%f12
	mulx	%i3,	%g1,	%l1
	bge	%icc,	loop_266
loop_265:
	bneg,a,pt	%icc,	loop_267
	movpos	%icc,	%o7,	%g5
	fbule	%fcc1,	loop_268
loop_266:
	edge16	%o2,	%l6,	%l3
loop_267:
	udivcc	%o0,	0x10DF,	%g6
	fmovdg	%xcc,	%f4,	%f6
loop_268:
	fsrc1s	%f20,	%f30
	tsubcctv	%g2,	0x015B,	%g7
	sethi	0x1399,	%l4
	movrlz	%i6,	0x1BD,	%o4
	bge,a	loop_269
	array32	%o3,	%o6,	%i4
	array8	%i0,	%l2,	%g4
	tneg	%xcc,	0x0
loop_269:
	nop
	wr	%g0,	0x11,	%asi
	stha	%l0,	[%l7 + 0x0A] %asi
	edge8n	%i5,	%i2,	%i7
	wr	%g0,	0x80,	%asi
	sta	%f30,	[%l7 + 0x64] %asi
	array8	%o1,	%g3,	%o5
	edge16n	%i1,	%l5,	%g1
	srax	%i3,	%o7,	%g5
	ldstub	[%l7 + 0x31],	%o2
	andncc	%l1,	%l3,	%o0
	bl	loop_270
	nop
	setx	0x13E219465D3C4D39,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x1263A16AC7A1469F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f22,	%f30
	tleu	%icc,	0x4
	taddcctv	%g6,	%g2,	%g7
loop_270:
	fbl,a	%fcc2,	loop_271
	fmovdg	%icc,	%f28,	%f0
	set	0x24, %i4
	lduha	[%l7 + %i4] 0x14,	%l4
loop_271:
	tne	%xcc,	0x4
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x48] %asi,	%l6
	tge	%xcc,	0x5
	umulcc	%i6,	0x162C,	%o3
	orcc	%o4,	0x026E,	%o6
	lduw	[%l7 + 0x78],	%i4
	add	%l2,	0x0808,	%g4
	fbuge,a	%fcc2,	loop_272
	ta	%icc,	0x2
	fbuge,a	%fcc2,	loop_273
	tcs	%icc,	0x1
loop_272:
	nop
	set	0x55, %g6
	ldstuba	[%l7 + %g6] 0x11,	%l0
loop_273:
	tsubcctv	%i5,	%i0,	%i2
	movneg	%icc,	%o1,	%g3
	edge8l	%i7,	%i1,	%o5
	nop
	setx	0xD059285C,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	fmovsle	%icc,	%f30,	%f16
	alignaddrl	%g1,	%l5,	%o7
	fones	%f7
	array32	%i3,	%o2,	%g5
	fmovrde	%l1,	%f8,	%f20
	tge	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l3,	0x1287,	%o0
	tcc	%icc,	0x7
	movge	%icc,	%g6,	%g7
	fmovsg	%icc,	%f26,	%f7
	fnot1s	%f28,	%f21
	fmovrsgez	%l4,	%f27,	%f4
	tge	%icc,	0x0
	edge8l	%l6,	%i6,	%o3
	bcs,a,pn	%xcc,	loop_274
	st	%f21,	[%l7 + 0x18]
	fcmple32	%f30,	%f0,	%g2
	sub	%o4,	0x0BDC,	%i4
loop_274:
	edge16n	%o6,	%g4,	%l0
	te	%xcc,	0x3
	bn,pn	%xcc,	loop_275
	tvs	%xcc,	0x3
	udiv	%i5,	0x138E,	%i0
	addc	%l2,	%o1,	%i2
loop_275:
	fpsub32s	%f29,	%f13,	%f10
	fnand	%f28,	%f30,	%f8
	udivx	%g3,	0x1A23,	%i1
	sub	%o5,	%g1,	%l5
	movg	%icc,	%i7,	%o7
	tleu	%xcc,	0x2
	edge32l	%i3,	%o2,	%l1
	alignaddrl	%g5,	%o0,	%g6
	andncc	%l3,	%g7,	%l4
	edge8ln	%l6,	%i6,	%o3
	tleu	%xcc,	0x6
	movge	%xcc,	%o4,	%g2
	nop
	setx	loop_276,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orcc	%i4,	0x0959,	%g4
	mova	%xcc,	%l0,	%o6
	fmovrslez	%i5,	%f9,	%f6
loop_276:
	bge	loop_277
	fcmpgt16	%f14,	%f10,	%l2
	movne	%xcc,	%o1,	%i0
	nop
	setx	0xB790940A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x95E7EE53,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f9,	%f21
loop_277:
	fmovsg	%icc,	%f31,	%f0
	bg,pn	%xcc,	loop_278
	array16	%g3,	%i2,	%o5
	addc	%g1,	%i1,	%l5
	fbne	%fcc0,	loop_279
loop_278:
	movrlz	%o7,	0x137,	%i7
	orn	%i3,	%l1,	%g5
	set	0x74, %o3
	stha	%o2,	[%l7 + %o3] 0x14
loop_279:
	and	%o0,	%g6,	%l3
	andncc	%g7,	%l4,	%i6
	edge16	%l6,	%o4,	%o3
	tge	%xcc,	0x4
	nop
	setx	0x166EBCA2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f2
	addcc	%g2,	%g4,	%l0
	bl,pn	%icc,	loop_280
	nop
	fitod	%f10,	%f8
	fdtoi	%f8,	%f14
	edge8ln	%o6,	%i5,	%l2
	movg	%xcc,	%i4,	%i0
loop_280:
	mulscc	%o1,	%i2,	%g3
	std	%f16,	[%l7 + 0x30]
	swap	[%l7 + 0x78],	%g1
	movgu	%icc,	%i1,	%o5
	sth	%l5,	[%l7 + 0x6A]
	sra	%i7,	0x17,	%i3
	subccc	%o7,	%g5,	%o2
	flush	%l7 + 0x24
	andcc	%l1,	%o0,	%l3
	fbge,a	%fcc3,	loop_281
	bne,pn	%icc,	loop_282
	fmovdle	%xcc,	%f13,	%f12
	bgu,a,pn	%icc,	loop_283
loop_281:
	movvs	%xcc,	%g6,	%g7
loop_282:
	movl	%xcc,	%l4,	%l6
	fornot2s	%f16,	%f8,	%f30
loop_283:
	movrlez	%o4,	%i6,	%g2
	fmovrdgz	%g4,	%f6,	%f26
	array16	%o3,	%l0,	%o6
	fxors	%f30,	%f8,	%f28
	nop
	setx	0xEAE6DC3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xD8C91212,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f29,	%f9
	sethi	0x07D2,	%l2
	brlez,a	%i4,	loop_284
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f3,	%f22
	fstod	%f22,	%f14
	fbule,a	%fcc0,	loop_285
loop_284:
	smulcc	%i0,	0x16DE,	%i5
	sllx	%o1,	0x00,	%i2
	umul	%g1,	0x1B3B,	%i1
loop_285:
	movvc	%icc,	%g3,	%l5
	fcmpgt32	%f22,	%f18,	%i7
	edge16l	%o5,	%i3,	%g5
	movvc	%icc,	%o7,	%l1
	brlez	%o0,	loop_286
	edge8ln	%l3,	%g6,	%o2
	ldx	[%l7 + 0x28],	%g7
	movrgz	%l4,	0x3DB,	%l6
loop_286:
	addccc	%i6,	0x0B23,	%o4
	fcmple16	%f6,	%f10,	%g2
	brlz	%o3,	loop_287
	nop
	set	0x58, %l2
	ldsh	[%l7 + %l2],	%g4
	tne	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_287:
	fmovsa	%xcc,	%f23,	%f10
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x17] %asi,	%o6
	umul	%l2,	0x0B2F,	%l0
	sdivx	%i4,	0x0CE8,	%i0
	movcs	%xcc,	%o1,	%i2
	sdivx	%i5,	0x0106,	%i1
	brgez	%g1,	loop_288
	nop
	setx	0x32DF7765A1F0BAB7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x928485AFA6774B83,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f20,	%f0
	andncc	%l5,	%g3,	%o5
	fmovdne	%icc,	%f26,	%f24
loop_288:
	movcs	%icc,	%i3,	%i7
	bn	loop_289
	tvc	%xcc,	0x2
	edge16n	%g5,	%l1,	%o0
	edge8ln	%o7,	%g6,	%o2
loop_289:
	movcs	%xcc,	%l3,	%g7
	movpos	%xcc,	%l4,	%l6
	movne	%icc,	%o4,	%g2
	tpos	%icc,	0x6
	tle	%icc,	0x7
	tvs	%xcc,	0x7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i6,	%g4
	brz,a	%o6,	loop_290
	sub	%l2,	0x1F2E,	%o3
	st	%f11,	[%l7 + 0x18]
	srlx	%l0,	0x1C,	%i0
loop_290:
	bleu,pt	%xcc,	loop_291
	ta	%icc,	0x5
	tsubcc	%o1,	%i2,	%i4
	sir	0x1F85
loop_291:
	srlx	%i1,	%i5,	%l5
	fmovdcc	%xcc,	%f16,	%f4
	andncc	%g3,	%g1,	%o5
	movgu	%icc,	%i7,	%g5
	movcc	%xcc,	%l1,	%o0
	bgu,pn	%xcc,	loop_292
	bl,a,pt	%icc,	loop_293
	andncc	%i3,	%o7,	%o2
	alignaddrl	%g6,	%l3,	%g7
loop_292:
	movneg	%xcc,	%l4,	%o4
loop_293:
	movneg	%xcc,	%g2,	%l6
	addccc	%g4,	0x0124,	%i6
	tcc	%xcc,	0x4
	smul	%l2,	0x0ECE,	%o3
	movl	%xcc,	%o6,	%l0
	bvc,a	%icc,	loop_294
	ba,a	loop_295
	movrlz	%i0,	0x23A,	%i2
	edge16	%o1,	%i1,	%i4
loop_294:
	orn	%i5,	%g3,	%g1
loop_295:
	fsrc2s	%f6,	%f12
	prefetch	[%l7 + 0x40],	 0x0
	brlez,a	%l5,	loop_296
	edge32	%o5,	%g5,	%l1
	tsubcc	%i7,	%o0,	%o7
	alignaddrl	%i3,	%o2,	%l3
loop_296:
	sethi	0x126D,	%g6
	set	0x54, %g4
	lduwa	[%l7 + %g4] 0x89,	%l4
	movle	%icc,	%o4,	%g7
	array16	%l6,	%g2,	%i6
	nop
	fitos	%f3,	%f27
	fstox	%f27,	%f30
	fxtos	%f30,	%f3
	xnor	%l2,	%g4,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%o6,	0x107E,	%l0
	nop
	setx	loop_297,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%i2,	0x1611,	%o1
	bshuffle	%f26,	%f10,	%f28
	edge32l	%i1,	%i0,	%i5
loop_297:
	edge8	%i4,	%g1,	%g3
	tpos	%xcc,	0x5
	edge8ln	%o5,	%g5,	%l5
	movge	%icc,	%l1,	%o0
	movgu	%icc,	%i7,	%i3
	fmovsg	%icc,	%f10,	%f20
	fbue	%fcc0,	loop_298
	mulx	%o2,	0x0A4D,	%l3
	bgu	loop_299
	subccc	%o7,	0x049A,	%g6
loop_298:
	srax	%o4,	0x1A,	%l4
	fmovsneg	%icc,	%f22,	%f10
loop_299:
	nop
	fitod	%f8,	%f18
	fdtos	%f18,	%f23
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f10,	%f22,	%f8
	edge8ln	%l6,	%g2,	%i6
	addcc	%l2,	0x1796,	%g7
	orncc	%o3,	0x043F,	%g4
	fmovrdne	%l0,	%f26,	%f28
	edge16l	%o6,	%o1,	%i1
	edge8l	%i2,	%i5,	%i0
	movrgez	%g1,	0x13B,	%i4
	bn,pt	%xcc,	loop_300
	andcc	%o5,	0x054B,	%g3
	movcc	%xcc,	%l5,	%g5
	fmovrdne	%o0,	%f26,	%f8
loop_300:
	alignaddr	%l1,	%i3,	%i7
	orncc	%l3,	%o7,	%g6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x34] %asi,	%o4
	sdivcc	%o2,	0x1BF8,	%l6
	andcc	%g2,	0x04F2,	%l4
	fbuge	%fcc3,	loop_301
	fpmerge	%f5,	%f0,	%f8
	fmovdvs	%icc,	%f12,	%f27
	ldsb	[%l7 + 0x46],	%l2
loop_301:
	fmul8sux16	%f8,	%f4,	%f12
	sethi	0x1D74,	%i6
	xorcc	%g7,	%g4,	%l0
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x19,	%f0
	fpackfix	%f10,	%f9
	bvs,a,pn	%xcc,	loop_302
	movcs	%icc,	%o3,	%o1
	array16	%o6,	%i1,	%i2
	srl	%i0,	%i5,	%g1
loop_302:
	movg	%icc,	%i4,	%o5
	ld	[%l7 + 0x08],	%f11
	nop
	setx	0xD04A03CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	array8	%g3,	%g5,	%l5
	fands	%f18,	%f17,	%f16
	edge32ln	%l1,	%i3,	%i7
	addcc	%o0,	%l3,	%o7
	taddcctv	%g6,	0x0EA2,	%o4
	wr	%g0,	0x88,	%asi
	stba	%l6,	[%l7 + 0x54] %asi
	fabss	%f3,	%f19
	edge8n	%o2,	%g2,	%l4
	ldd	[%l7 + 0x48],	%l2
	tg	%icc,	0x4
	fmovdcs	%icc,	%f1,	%f4
	popc	%g7,	%g4
	move	%xcc,	%i6,	%l0
	edge8ln	%o3,	%o1,	%o6
	call	loop_303
	fcmpne16	%f20,	%f4,	%i1
	nop
	setx loop_304, %l0, %l1
	jmpl %l1, %i2
	fnors	%f23,	%f27,	%f10
loop_303:
	sll	%i0,	0x19,	%g1
	fmovdne	%icc,	%f11,	%f21
loop_304:
	andncc	%i5,	%i4,	%o5
	movcs	%icc,	%g5,	%g3
	bcc	%xcc,	loop_305
	addc	%l5,	0x1E95,	%l1
	sethi	0x1791,	%i7
	nop
	fitod	%f2,	%f2
	fdtoi	%f2,	%f27
loop_305:
	orn	%i3,	%o0,	%o7
	fnegs	%f22,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l3,	%g6,	%l6
	movne	%icc,	%o2,	%g2
	nop
	set	0x68, %i6
	ldx	[%l7 + %i6],	%l4
	tl	%xcc,	0x3
	movle	%xcc,	%o4,	%l2
	tneg	%icc,	0x2
	mulscc	%g4,	%i6,	%l0
	edge16n	%g7,	%o1,	%o6
	edge16	%o3,	%i2,	%i0
	movle	%icc,	%i1,	%i5
	fbl,a	%fcc1,	loop_306
	tsubcc	%i4,	0x1BE6,	%o5
	movgu	%xcc,	%g5,	%g3
	edge32l	%g1,	%l1,	%i7
loop_306:
	sdivx	%l5,	0x0AF7,	%i3
	ta	%icc,	0x5
	subcc	%o7,	0x18F4,	%o0
	mova	%icc,	%g6,	%l6
	array8	%o2,	%l3,	%g2
	edge8ln	%o4,	%l2,	%g4
	tg	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x24
	movcs	%xcc,	%i6,	%l4
	bcs	%xcc,	loop_307
	smul	%g7,	%l0,	%o1
	edge32l	%o6,	%i2,	%o3
	bge,a,pt	%xcc,	loop_308
loop_307:
	fexpand	%f7,	%f20
	nop
	fitos	%f9,	%f15
	fstox	%f15,	%f4
	alignaddrl	%i1,	%i0,	%i4
loop_308:
	bn,pt	%xcc,	loop_309
	bvs,pt	%icc,	loop_310
	or	%o5,	%i5,	%g5
	fmul8x16	%f5,	%f8,	%f24
loop_309:
	te	%xcc,	0x4
loop_310:
	fmul8x16	%f23,	%f12,	%f14
	edge32n	%g1,	%g3,	%l1
	array16	%l5,	%i3,	%i7
	movl	%xcc,	%o0,	%g6
	prefetch	[%l7 + 0x0C],	 0x0
	be,a	loop_311
	fpackfix	%f10,	%f12
	xnorcc	%o7,	%o2,	%l3
	fbo,a	%fcc2,	loop_312
loop_311:
	swap	[%l7 + 0x74],	%g2
	alignaddr	%o4,	%l6,	%l2
	lduh	[%l7 + 0x64],	%g4
loop_312:
	sethi	0x1D39,	%l4
	movl	%xcc,	%g7,	%l0
	edge8ln	%i6,	%o6,	%o1
	fblg,a	%fcc3,	loop_313
	fmovsneg	%icc,	%f3,	%f24
	sll	%o3,	0x13,	%i1
	sir	0x1CC4
loop_313:
	fmovdvc	%xcc,	%f13,	%f2
	tge	%icc,	0x7
	te	%icc,	0x3
	brlz,a	%i2,	loop_314
	fpadd16	%f2,	%f10,	%f18
	popc	0x0F89,	%i0
	fmovrdgz	%o5,	%f2,	%f10
loop_314:
	taddcc	%i4,	0x0ACC,	%g5
	sethi	0x041C,	%g1
	stw	%g3,	[%l7 + 0x20]
	lduh	[%l7 + 0x46],	%i5
	edge8l	%l5,	%i3,	%i7
	fnot1s	%f10,	%f14
	mova	%xcc,	%l1,	%o0
	nop
	setx loop_315, %l0, %l1
	jmpl %l1, %g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o7,	0x168D,	%o2
	ldsw	[%l7 + 0x18],	%g2
loop_315:
	sdivcc	%l3,	0x195D,	%o4
	set	0x51, %o4
	ldsba	[%l7 + %o4] 0x18,	%l2
	movvc	%xcc,	%g4,	%l6
	array32	%g7,	%l4,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l0,	0x1BD8,	%o1
	movneg	%xcc,	%o3,	%i1
	nop
	set	0x14, %g5
	ldub	[%l7 + %g5],	%o6
	swap	[%l7 + 0x50],	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o5,	%i0
	sub	%g5,	%g1,	%i4
	ldsh	[%l7 + 0x3E],	%i5
	sir	0x06F8
	sdivx	%g3,	0x1BAE,	%i3
	call	loop_316
	popc	0x109F,	%i7
	movrlz	%l1,	%l5,	%o0
	smulcc	%o7,	%o2,	%g6
loop_316:
	fxnors	%f27,	%f19,	%f16
	edge32	%g2,	%l3,	%o4
	nop
	setx	0xB9754965D61873DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x7FB97EB9345A68FA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f6,	%f0
	umul	%l2,	0x1969,	%g4
	wr	%g0,	0xe3,	%asi
	stha	%g7,	[%l7 + 0x56] %asi
	membar	#Sync
	umul	%l4,	%l6,	%i6
	addcc	%o1,	0x1F6A,	%o3
	sra	%l0,	0x0B,	%i1
	xorcc	%o6,	%i2,	%o5
	popc	%g5,	%g1
	ldsb	[%l7 + 0x48],	%i4
	fornot1	%f16,	%f30,	%f6
	edge8l	%i0,	%g3,	%i3
	fmovrdlz	%i7,	%f26,	%f22
	sll	%i5,	0x05,	%l5
	tpos	%xcc,	0x0
	ldsw	[%l7 + 0x3C],	%l1
	alignaddrl	%o7,	%o2,	%g6
	popc	%g2,	%l3
	smul	%o0,	0x0666,	%l2
	sdivx	%o4,	0x0045,	%g4
	edge8n	%g7,	%l4,	%l6
	tg	%xcc,	0x5
	umulcc	%i6,	%o1,	%l0
	orcc	%i1,	%o3,	%i2
	nop
	setx	0xECEEC61D20750D87,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	edge32ln	%o5,	%g5,	%o6
	stb	%i4,	[%l7 + 0x25]
	edge8n	%g1,	%i0,	%i3
	edge32	%i7,	%g3,	%l5
	fbne,a	%fcc3,	loop_317
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i5,	0x183E,	%l1
	be,a,pn	%xcc,	loop_318
loop_317:
	xorcc	%o2,	%g6,	%o7
	alignaddr	%l3,	%o0,	%g2
	udiv	%l2,	0x1232,	%g4
loop_318:
	brlez	%g7,	loop_319
	tl	%xcc,	0x1
	orn	%l4,	%l6,	%i6
	fcmple16	%f8,	%f0,	%o4
loop_319:
	alignaddrl	%l0,	%o1,	%o3
	set	0x64, %i0
	ldswa	[%l7 + %i0] 0x11,	%i1
	sll	%i2,	0x1A,	%g5
	set	0x68, %l6
	ldsba	[%l7 + %l6] 0x0c,	%o5
	swap	[%l7 + 0x24],	%o6
	te	%xcc,	0x5
	bl,pt	%icc,	loop_320
	lduh	[%l7 + 0x22],	%g1
	fpadd16	%f2,	%f24,	%f16
	ba,pn	%xcc,	loop_321
loop_320:
	sllx	%i0,	%i3,	%i4
	ld	[%l7 + 0x38],	%f9
	edge32	%i7,	%g3,	%i5
loop_321:
	array32	%l5,	%l1,	%o2
	fand	%f30,	%f12,	%f6
	nop
	fitod	%f10,	%f16
	fdtos	%f16,	%f17
	nop
	setx	0x0BCD57C9506367FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	movg	%icc,	%g6,	%l3
	mulx	%o0,	%o7,	%l2
	add	%g2,	%g4,	%l4
	mova	%xcc,	%l6,	%g7
	tneg	%icc,	0x4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%i6
	addcc	%l0,	0x0C68,	%o1
	fbug,a	%fcc2,	loop_322
	orcc	%o3,	0x19F7,	%i1
	fcmpeq16	%f18,	%f22,	%i2
	bcs,pt	%icc,	loop_323
loop_322:
	stb	%o5,	[%l7 + 0x4C]
	tg	%xcc,	0x4
	set	0x08, %i1
	ldswa	[%l7 + %i1] 0x88,	%g5
loop_323:
	fcmpeq32	%f28,	%f30,	%o6
	add	%g1,	0x1240,	%i0
	umulcc	%i3,	0x0EE6,	%i7
	edge32ln	%g3,	%i5,	%i4
	fmovsle	%xcc,	%f21,	%f2
	move	%icc,	%l5,	%o2
	bvs,a	loop_324
	movrne	%l1,	0x29B,	%g6
	fmovrdgz	%o0,	%f26,	%f6
	fbge,a	%fcc0,	loop_325
loop_324:
	fblg,a	%fcc2,	loop_326
	swap	[%l7 + 0x18],	%l3
	fbn,a	%fcc0,	loop_327
loop_325:
	xnor	%o7,	0x0CD0,	%l2
loop_326:
	fmovdle	%icc,	%f2,	%f25
	fpadd32	%f24,	%f6,	%f24
loop_327:
	array32	%g2,	%l4,	%l6
	fmovdle	%icc,	%f15,	%f21
	xnor	%g4,	0x007F,	%o4
	edge32n	%i6,	%l0,	%o1
	tsubcc	%o3,	0x0D5D,	%g7
	ldstub	[%l7 + 0x3D],	%i1
	orn	%o5,	0x1B5A,	%i2
	fmuld8sux16	%f30,	%f30,	%f26
	movleu	%xcc,	%o6,	%g1
	fmovrsgez	%i0,	%f6,	%f15
	fpadd32	%f16,	%f8,	%f14
	bne,a	loop_328
	sethi	0x1DF7,	%i3
	subc	%g5,	%g3,	%i7
	tleu	%xcc,	0x2
loop_328:
	ldsh	[%l7 + 0x48],	%i4
	andcc	%l5,	0x0837,	%o2
	tsubcc	%l1,	%g6,	%o0
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x7B] %asi,	%i5
	sdivcc	%o7,	0x1F0C,	%l3
	add	%l2,	%l4,	%g2
	fbug,a	%fcc2,	loop_329
	movg	%xcc,	%g4,	%l6
	set	0x7C, %o7
	lda	[%l7 + %o7] 0x89,	%f17
loop_329:
	fbo	%fcc1,	loop_330
	tge	%icc,	0x3
	wr	%g0,	0x21,	%asi
	stxa	%o4,	[%g0 + 0x108] %asi
loop_330:
	edge8ln	%i6,	%l0,	%o1
	nop
	fitod	%f2,	%f22
	fdtos	%f22,	%f21
	pdist	%f6,	%f8,	%f24
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x04
	tvc	%xcc,	0x0
	orn	%o3,	0x18FC,	%g7
	fbe,a	%fcc0,	loop_331
	nop
	setx	0x43ADEEBF41CC58CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x84DFE7CF8CEBEB69,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f2,	%f20
	sllx	%o5,	0x1D,	%i1
	fors	%f4,	%f10,	%f25
loop_331:
	taddcctv	%i2,	%g1,	%i0
	fpsub32s	%f1,	%f17,	%f1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x58] %asi,	%f19
	fcmpeq16	%f12,	%f28,	%i3
	udiv	%g5,	0x09BD,	%o6
	tcs	%icc,	0x4
	sll	%g3,	0x0F,	%i7
	fxor	%f28,	%f30,	%f2
	nop
	setx	loop_332,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovscs	%icc,	%f8,	%f28
	movrgez	%i4,	0x312,	%l5
	fpadd32	%f6,	%f30,	%f20
loop_332:
	taddcc	%l1,	%g6,	%o2
	fbo,a	%fcc3,	loop_333
	sethi	0x0572,	%i5
	udiv	%o0,	0x09AE,	%o7
	alignaddr	%l2,	%l4,	%l3
loop_333:
	edge8l	%g4,	%g2,	%l6
	smulcc	%o4,	%i6,	%o1
	sethi	0x1B39,	%l0
	call	loop_334
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe,a	%fcc1,	loop_335
	alignaddrl	%o3,	%g7,	%o5
loop_334:
	nop
	fitos	%f3,	%f3
	fstod	%f3,	%f4
	bcc,pn	%xcc,	loop_336
loop_335:
	subccc	%i2,	%g1,	%i1
	ldd	[%l7 + 0x30],	%i2
	tn	%icc,	0x1
loop_336:
	fmovrdne	%g5,	%f28,	%f22
	tgu	%icc,	0x0
	fmovrdlez	%i0,	%f16,	%f0
	ldsw	[%l7 + 0x3C],	%o6
	edge32ln	%i7,	%g3,	%i4
	bne,pn	%icc,	loop_337
	fnand	%f0,	%f20,	%f2
	sra	%l5,	%g6,	%o2
	edge32l	%i5,	%l1,	%o7
loop_337:
	fmovrsne	%o0,	%f3,	%f5
	mulx	%l2,	0x1459,	%l3
	fabss	%f23,	%f1
	brz	%l4,	loop_338
	nop
	setx	0x793F091252746A25,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f2
	tgu	%icc,	0x7
	fmovdle	%icc,	%f4,	%f1
loop_338:
	xorcc	%g4,	%g2,	%l6
	movne	%xcc,	%i6,	%o4
	tn	%xcc,	0x6
	bpos,pn	%icc,	loop_339
	movle	%xcc,	%o1,	%o3
	sdiv	%l0,	0x166D,	%g7
	movrne	%i2,	0x28C,	%g1
loop_339:
	movrgz	%i1,	0x1F0,	%o5
	addc	%i3,	%g5,	%o6
	movleu	%xcc,	%i0,	%i7
	or	%i4,	%g3,	%l5
	fmul8x16au	%f3,	%f8,	%f6
	addc	%o2,	0x0D11,	%i5
	array32	%g6,	%o7,	%l1
	fnot1s	%f7,	%f15
	nop
	setx	0xCB449C84,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x549F6695,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f9,	%f15
	sra	%l2,	%o0,	%l3
	subccc	%l4,	0x1B73,	%g4
	fmovrsgz	%g2,	%f0,	%f23
	array32	%l6,	%o4,	%o1
	fpack16	%f12,	%f4
	nop
	fitos	%f17,	%f2
	tge	%icc,	0x3
	movg	%icc,	%i6,	%o3
	udivcc	%l0,	0x0E3F,	%g7
	mulscc	%i2,	0x0C53,	%g1
	nop
	setx	0x8039C57E71A43DC1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xB431FAF5A33CCEBB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f12,	%f20
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f20
	fxtod	%f20,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x38, %o1
	sta	%f23,	[%l7 + %o1] 0x14
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%f28
	fxor	%f10,	%f30,	%f12
	sll	%i1,	%o5,	%i3
	sdivcc	%g5,	0x181E,	%o6
	ta	%xcc,	0x2
	ldd	[%l7 + 0x38],	%i6
	fmovscc	%xcc,	%f30,	%f20
	movge	%xcc,	%i4,	%g3
	fmovrslez	%i0,	%f14,	%f21
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x39] %asi,	%l5
	fmovsvc	%xcc,	%f17,	%f15
	fpsub16	%f24,	%f12,	%f4
	tleu	%icc,	0x1
	fbl	%fcc0,	loop_340
	fmovde	%icc,	%f2,	%f18
	xnor	%o2,	%g6,	%i5
	fors	%f25,	%f0,	%f17
loop_340:
	sllx	%o7,	0x1D,	%l1
	umulcc	%l2,	%l3,	%l4
	ldub	[%l7 + 0x74],	%o0
	taddcc	%g2,	0x0B12,	%g4
	fnor	%f14,	%f6,	%f16
	fba	%fcc0,	loop_341
	addc	%o4,	0x0E99,	%o1
	fbge,a	%fcc1,	loop_342
	andncc	%l6,	%o3,	%l0
loop_341:
	movn	%xcc,	%g7,	%i2
	nop
	setx	loop_343,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_342:
	ldd	[%l7 + 0x48],	%i6
	subccc	%g1,	0x04FE,	%i1
	tl	%icc,	0x3
loop_343:
	fmovsle	%xcc,	%f24,	%f15
	tgu	%xcc,	0x7
	addc	%o5,	%i3,	%g5
	andncc	%o6,	%i4,	%g3
	udivcc	%i7,	0x071F,	%l5
	sub	%o2,	%i0,	%g6
	nop
	setx	0xE9949734,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f6
	bpos,a,pn	%xcc,	loop_344
	smul	%o7,	%l1,	%i5
	fpsub16	%f30,	%f16,	%f10
	edge8l	%l2,	%l4,	%l3
loop_344:
	fbne,a	%fcc3,	loop_345
	movleu	%xcc,	%o0,	%g2
	fbue	%fcc1,	loop_346
	sllx	%o4,	0x05,	%g4
loop_345:
	stw	%l6,	[%l7 + 0x44]
	tg	%icc,	0x7
loop_346:
	ldub	[%l7 + 0x6A],	%o3
	fmovrsgez	%o1,	%f7,	%f14
	subc	%g7,	0x1D4F,	%i2
	ldsh	[%l7 + 0x12],	%i6
	movg	%xcc,	%g1,	%i1
	and	%o5,	0x02DA,	%i3
	fbn,a	%fcc3,	loop_347
	fpack32	%f14,	%f28,	%f10
	movre	%g5,	0x0D4,	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x89,	%l0,	%i4
loop_347:
	nop
	setx	0xCDF910E6FEC4BEFD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x70787D0A443982A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f14,	%f26
	tn	%icc,	0x2
	fpsub32	%f28,	%f4,	%f20
	for	%f8,	%f20,	%f22
	fand	%f24,	%f18,	%f12
	mulscc	%g3,	%l5,	%o2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4A] %asi,	%i0
	udiv	%g6,	0x0A4D,	%o7
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
	movvs	%icc,	%i5,	%l2
	movrgez	%i7,	0x340,	%l4
	fmovrse	%o0,	%f19,	%f15
	smulcc	%g2,	%o4,	%g4
	xor	%l6,	0x0E45,	%o3
	taddcc	%o1,	0x0A09,	%g7
	sir	0x0E90
	movrgez	%l3,	0x21E,	%i6
	nop
	setx	loop_348,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bg,a	%xcc,	loop_349
	orn	%i2,	%g1,	%i1
	fcmpne32	%f10,	%f16,	%i3
loop_348:
	fble	%fcc0,	loop_350
loop_349:
	orcc	%g5,	%o5,	%o6
	prefetch	[%l7 + 0x0C],	 0x3
	taddcctv	%i4,	0x11B5,	%l0
loop_350:
	bpos,a	loop_351
	ldd	[%l7 + 0x08],	%f10
	sub	%g3,	%l5,	%i0
	or	%o2,	0x0364,	%o7
loop_351:
	edge16ln	%g6,	%i5,	%l1
	taddcctv	%i7,	0x1C90,	%l4
	subc	%l2,	%g2,	%o0
	tg	%xcc,	0x7
	addccc	%g4,	%o4,	%l6
	fzero	%f20
	brgz	%o3,	loop_352
	movg	%xcc,	%g7,	%l3
	fandnot2s	%f31,	%f26,	%f15
	edge16ln	%o1,	%i2,	%i6
loop_352:
	fmul8x16	%f28,	%f10,	%f0
	nop
	fitos	%f9,	%f29
	edge32n	%g1,	%i3,	%i1
	movvc	%xcc,	%o5,	%o6
	mulscc	%g5,	%l0,	%g3
	fmovsneg	%icc,	%f10,	%f2
	edge8n	%l5,	%i0,	%i4
	membar	0x02
	fexpand	%f15,	%f8
	bn,pt	%xcc,	loop_353
	subccc	%o2,	%o7,	%g6
	subcc	%l1,	0x045D,	%i7
	fmovdgu	%xcc,	%f3,	%f2
loop_353:
	fmovdle	%icc,	%f28,	%f5
	movcs	%icc,	%i5,	%l4
	edge8n	%g2,	%o0,	%l2
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f6
	tsubcc	%o4,	%l6,	%o3
	taddcctv	%g7,	0x045D,	%g4
	srlx	%o1,	0x1A,	%l3
	bneg,pt	%xcc,	loop_354
	fcmpne16	%f24,	%f30,	%i6
	fcmpne16	%f22,	%f12,	%g1
	brlz,a	%i3,	loop_355
loop_354:
	fmuld8sux16	%f19,	%f13,	%f26
	fnands	%f4,	%f25,	%f17
	fmovsvc	%xcc,	%f12,	%f9
loop_355:
	andn	%i1,	%i2,	%o6
	movne	%xcc,	%g5,	%o5
	addc	%g3,	0x1278,	%l5
	edge32	%i0,	%l0,	%o2
	movcc	%icc,	%o7,	%g6
	mulx	%l1,	%i7,	%i4
	fpadd32	%f6,	%f2,	%f0
	tcs	%xcc,	0x5
	fbo,a	%fcc2,	loop_356
	smulcc	%i5,	%g2,	%o0
	te	%icc,	0x0
	nop
	setx	0x8D5FE816,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xC475FA00,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fadds	%f2,	%f0,	%f4
loop_356:
	subcc	%l2,	0x18A3,	%l4
	fpsub32	%f4,	%f26,	%f18
	fblg,a	%fcc2,	loop_357
	umulcc	%l6,	%o4,	%g7
	nop
	setx	0xB715E62E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xE6A46ED2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f23,	%f25
	tg	%xcc,	0x2
loop_357:
	fmovsg	%icc,	%f24,	%f18
	fxor	%f20,	%f30,	%f4
	udiv	%o3,	0x1CC2,	%g4
	movne	%icc,	%l3,	%o1
	nop
	setx	loop_358,	%l0,	%l1
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
	subcc	%g1,	0x15C4,	%i3
	orncc	%i6,	0x02FB,	%i1
loop_358:
	fbn	%fcc2,	loop_359
	add	%o6,	%g5,	%o5
	ta	%xcc,	0x7
	udivx	%g3,	0x15E4,	%l5
loop_359:
	tgu	%xcc,	0x6
	sllx	%i2,	0x03,	%l0
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7E] %asi,	%i0
	edge16n	%o2,	%g6,	%o7
	ldub	[%l7 + 0x61],	%l1
	fmovscs	%icc,	%f30,	%f25
	fmul8x16au	%f8,	%f23,	%f12
	bcc,pn	%icc,	loop_360
	fornot2	%f24,	%f18,	%f8
	xnorcc	%i4,	%i7,	%g2
	sethi	0x11EF,	%o0
loop_360:
	nop
	setx	loop_361,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvs	%xcc,	0x1
	fbule,a	%fcc1,	loop_362
	array16	%l2,	%l4,	%l6
loop_361:
	umul	%i5,	%o4,	%o3
	fmovdpos	%icc,	%f28,	%f20
loop_362:
	edge16ln	%g7,	%l3,	%g4
	fmovrse	%g1,	%f0,	%f22
	addc	%o1,	%i6,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o6,	0x005B,	%i1
	brgez	%o5,	loop_363
	bvc,pn	%icc,	loop_364
	fmovsa	%icc,	%f19,	%f31
	sethi	0x0F4B,	%g5
loop_363:
	udivcc	%g3,	0x1059,	%i2
loop_364:
	nop
	wr	%g0,	0x81,	%asi
	stba	%l0,	[%l7 + 0x79] %asi
	sdivx	%i0,	0x1AEF,	%o2
	fbge,a	%fcc0,	loop_365
	movrgz	%l5,	0x052,	%g6
	add	%l1,	0x0203,	%i4
	edge32	%i7,	%g2,	%o0
loop_365:
	fmovsn	%xcc,	%f13,	%f27
	prefetch	[%l7 + 0x60],	 0x1
	bgu,a	loop_366
	andcc	%l2,	0x0430,	%o7
	membar	0x6C
	edge8	%l6,	%l4,	%i5
loop_366:
	edge8l	%o3,	%o4,	%l3
	edge8	%g4,	%g1,	%o1
	tvs	%icc,	0x6
	tleu	%icc,	0x5
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	sdivcc	%g7,	0x091D,	%o6
	bneg,pt	%icc,	loop_367
	edge16n	%i3,	%o5,	%i1
	movrlz	%g5,	%g3,	%i2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_367:
	orncc	%l0,	%i0,	%l5
	move	%icc,	%g6,	%o2
	membar	0x1C
	ba	loop_368
	alignaddr	%i4,	%i7,	%g2
	tg	%xcc,	0x1
	movne	%icc,	%l1,	%l2
loop_368:
	fxors	%f31,	%f6,	%f3
	array16	%o7,	%o0,	%l6
	sra	%i5,	0x16,	%o3
	brgz	%l4,	loop_369
	tgu	%icc,	0x4
	nop
	fitod	%f0,	%f24
	fdtos	%f24,	%f5
	tcc	%xcc,	0x0
loop_369:
	fandnot2	%f22,	%f22,	%f16
	addcc	%o4,	0x040D,	%g4
	orncc	%l3,	%o1,	%g1
	nop
	setx	0xCA3D408A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x10F3C675,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f13,	%f5
	brlez,a	%g7,	loop_370
	bleu,a	loop_371
	smul	%i6,	0x05E9,	%o6
	fpack16	%f10,	%f20
loop_370:
	bge	%xcc,	loop_372
loop_371:
	ldub	[%l7 + 0x51],	%i3
	fblg	%fcc2,	loop_373
	bcc,a,pt	%xcc,	loop_374
loop_372:
	fcmple16	%f6,	%f18,	%o5
	bne,a,pn	%xcc,	loop_375
loop_373:
	fmovdvc	%xcc,	%f15,	%f3
loop_374:
	fmovdleu	%icc,	%f20,	%f14
	brlez,a	%g5,	loop_376
loop_375:
	movneg	%xcc,	%i1,	%i2
	fmovrdgez	%g3,	%f26,	%f26
	pdist	%f0,	%f0,	%f20
loop_376:
	srax	%l0,	0x19,	%l5
	fbuge,a	%fcc1,	loop_377
	array8	%i0,	%g6,	%i4
	sir	0x0BE6
	stb	%i7,	[%l7 + 0x79]
loop_377:
	alignaddr	%g2,	%l1,	%l2
	edge16ln	%o7,	%o0,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%i5,	%o3
	fmovdgu	%icc,	%f20,	%f9
	mova	%icc,	%l6,	%o4
	fmovsa	%icc,	%f4,	%f14
	fbe	%fcc1,	loop_378
	fpsub32	%f0,	%f22,	%f16
	fmul8x16al	%f12,	%f28,	%f2
	tneg	%xcc,	0x4
loop_378:
	std	%f6,	[%l7 + 0x60]
	fsrc1s	%f15,	%f11
	ldstub	[%l7 + 0x34],	%l4
	wr	%g0,	0x80,	%asi
	stba	%g4,	[%l7 + 0x24] %asi
	udiv	%l3,	0x184E,	%o1
	fsrc1	%f22,	%f26
	orn	%g7,	0x0018,	%i6
	nop
	setx	0xF6251401,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x70CBD9F7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f29,	%f4
	bleu,a,pn	%xcc,	loop_379
	fornot2	%f14,	%f22,	%f10
	fmovsg	%icc,	%f24,	%f5
	udivcc	%g1,	0x1358,	%o6
loop_379:
	xnor	%i3,	%o5,	%g5
	edge16l	%i1,	%i2,	%l0
	fpsub16	%f14,	%f20,	%f20
	fsrc2	%f14,	%f0
	fmovdg	%icc,	%f28,	%f19
	orcc	%g3,	%l5,	%i0
	set	0x4C, %g3
	sta	%f12,	[%l7 + %g3] 0x0c
	fba	%fcc0,	loop_380
	udivcc	%i4,	0x0F81,	%g6
	movre	%i7,	%l1,	%g2
	movrlz	%o7,	%o0,	%o2
loop_380:
	bshuffle	%f18,	%f12,	%f24
	edge16n	%l2,	%o3,	%i5
	fnot1s	%f1,	%f15
	tleu	%xcc,	0x1
	ldd	[%l7 + 0x58],	%f6
	movvs	%icc,	%o4,	%l6
	and	%l4,	%l3,	%o1
	fnegs	%f27,	%f11
	fmovsgu	%xcc,	%f23,	%f26
	movcs	%icc,	%g4,	%i6
	fmovdn	%xcc,	%f1,	%f20
	fmovdvs	%xcc,	%f17,	%f5
	movpos	%icc,	%g7,	%g1
	movcs	%xcc,	%i3,	%o5
	movg	%xcc,	%o6,	%i1
	nop
	fitos	%f3,	%f6
	fstox	%f6,	%f8
	and	%i2,	0x0FC3,	%l0
	fcmpne32	%f20,	%f6,	%g3
	tleu	%xcc,	0x6
	sllx	%l5,	0x17,	%i0
	bg,a,pn	%xcc,	loop_381
	ldstub	[%l7 + 0x7D],	%g5
	sll	%i4,	0x18,	%i7
	edge32	%g6,	%l1,	%o7
loop_381:
	edge16ln	%o0,	%o2,	%l2
	tne	%xcc,	0x7
	bneg	loop_382
	bleu,pt	%icc,	loop_383
	edge8	%g2,	%o3,	%o4
	tle	%icc,	0x5
loop_382:
	popc	0x0C93,	%i5
loop_383:
	mova	%xcc,	%l6,	%l3
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%l4
	membar	0x4E
	stb	%o1,	[%l7 + 0x16]
	set	0x70, %o6
	ldda	[%l7 + %o6] 0xe2,	%i6
	udivx	%g4,	0x0B2E,	%g7
	array32	%g1,	%o5,	%i3
	subcc	%o6,	%i2,	%l0
	wr	%g0,	0x2a,	%asi
	stxa	%g3,	[%l7 + 0x70] %asi
	membar	#Sync
	edge32	%l5,	%i1,	%g5
	srax	%i4,	0x06,	%i7
	brgez	%g6,	loop_384
	orn	%i0,	%l1,	%o7
	tgu	%xcc,	0x0
	movrlz	%o0,	0x135,	%o2
loop_384:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l2,	%o3
	tsubcctv	%o4,	0x04CC,	%i5
	subc	%g2,	%l6,	%l4
	fmovsg	%icc,	%f24,	%f17
	nop
	setx	loop_385,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%l3,	%i6,	%g4
	mulscc	%g7,	%g1,	%o1
	fnors	%f19,	%f17,	%f22
loop_385:
	sll	%i3,	%o6,	%i2
	nop
	setx	loop_386,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x374D45A32079E6E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	call	loop_387
	fmul8sux16	%f14,	%f2,	%f28
loop_386:
	movgu	%xcc,	%o5,	%g3
	fmovdcs	%xcc,	%f11,	%f12
loop_387:
	addcc	%l0,	0x0595,	%l5
	fmovrdgz	%i1,	%f6,	%f10
	edge8	%i4,	%i7,	%g6
	edge16	%i0,	%l1,	%o7
	movge	%icc,	%o0,	%o2
	tleu	%xcc,	0x3
	set	0x38, %o0
	stxa	%l2,	[%l7 + %o0] 0x10
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x18,	%f0
	tg	%icc,	0x4
	xor	%g5,	%o3,	%o4
	addc	%g2,	%l6,	%i5
	tpos	%xcc,	0x0
	nop
	setx	0x90F878565572CD1F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xFF7F60955E4ADE8C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f14,	%f2
	fabss	%f25,	%f25
	tg	%icc,	0x3
	tvc	%icc,	0x7
	fble	%fcc0,	loop_388
	fmovrdne	%l4,	%f0,	%f16
	mova	%icc,	%i6,	%g4
	be,a,pt	%xcc,	loop_389
loop_388:
	tgu	%xcc,	0x7
	umul	%g7,	%l3,	%o1
	tge	%xcc,	0x3
loop_389:
	tn	%xcc,	0x6
	fba	%fcc2,	loop_390
	edge8n	%i3,	%g1,	%o6
	tvc	%xcc,	0x6
	movle	%xcc,	%i2,	%o5
loop_390:
	udivcc	%l0,	0x1559,	%l5
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x58] %asi,	%i1
	srax	%g3,	0x10,	%i4
	wr	%g0,	0x80,	%asi
	sta	%f22,	[%l7 + 0x28] %asi
	fpadd16s	%f23,	%f30,	%f3
	te	%icc,	0x1
	movn	%xcc,	%i7,	%g6
	tpos	%xcc,	0x4
	sir	0x1326
	brlz	%i0,	loop_391
	tvs	%xcc,	0x1
	bn,pt	%xcc,	loop_392
	tg	%icc,	0x0
loop_391:
	srl	%l1,	%o0,	%o2
	xnorcc	%l2,	0x1A03,	%o7
loop_392:
	tn	%xcc,	0x7
	tle	%xcc,	0x4
	fpackfix	%f10,	%f5
	fors	%f19,	%f14,	%f16
	prefetch	[%l7 + 0x6C],	 0x2
	fmovsge	%xcc,	%f27,	%f10
	bshuffle	%f22,	%f2,	%f14
	movcs	%icc,	%g5,	%o3
	tl	%icc,	0x3
	tle	%xcc,	0x3
	fmovrslez	%o4,	%f7,	%f10
	fxor	%f24,	%f0,	%f26
	umul	%l6,	0x025F,	%g2
	tvc	%icc,	0x6
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf8
	membar	#Sync
	movpos	%xcc,	%l4,	%i5
	sdivx	%g4,	0x1F5B,	%i6
	set	0x56, %g1
	lduha	[%l7 + %g1] 0x15,	%l3
	fone	%f8
	nop
	setx	loop_393,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%o1,	0x1559,	%g7
	tsubcc	%i3,	0x18FF,	%g1
	set	0x7B, %l5
	ldsba	[%l7 + %l5] 0x81,	%i2
loop_393:
	fbl,a	%fcc3,	loop_394
	add	%o5,	0x0657,	%l0
	edge8ln	%l5,	%i1,	%o6
	nop
	setx	0xA3FC2C071242AA59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x80DDFDDA2C06D54A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f6,	%f20
loop_394:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%i4,	loop_395
	tsubcctv	%g3,	0x17A7,	%i7
	movneg	%icc,	%i0,	%g6
	fpadd16s	%f10,	%f10,	%f13
loop_395:
	ldsh	[%l7 + 0x36],	%l1
	tneg	%icc,	0x1
	bne	loop_396
	brlez	%o0,	loop_397
	tge	%xcc,	0x1
	tvc	%xcc,	0x1
loop_396:
	nop
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
loop_397:
	orcc	%o2,	0x1E3B,	%o7
	swap	[%l7 + 0x1C],	%g5
	mova	%xcc,	%o3,	%o4
	fmovsvc	%icc,	%f24,	%f21
	movrlez	%g2,	0x287,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a	%icc,	loop_398
	movrlz	%l4,	%g4,	%i6
	fmovs	%f8,	%f28
	umul	%l3,	%i5,	%g7
loop_398:
	nop
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x89,	%f0
	edge32	%i3,	%g1,	%i2
	movge	%xcc,	%o1,	%o5
	fbg,a	%fcc2,	loop_399
	fand	%f10,	%f0,	%f8
	tle	%icc,	0x3
	bpos,a,pt	%icc,	loop_400
loop_399:
	tcc	%xcc,	0x6
	membar	0x5F
	tneg	%icc,	0x6
loop_400:
	mulscc	%l5,	%l0,	%o6
	ldsh	[%l7 + 0x48],	%i4
	addcc	%i1,	0x0569,	%g3
	fmovsvs	%xcc,	%f19,	%f3
	array16	%i0,	%g6,	%l1
	edge8l	%o0,	%i7,	%o2
	andn	%l2,	%o7,	%g5
	fcmple32	%f24,	%f0,	%o3
	udivcc	%g2,	0x0C51,	%o4
	fmovrdgz	%l4,	%f26,	%f0
	movcc	%xcc,	%g4,	%i6
	fmovs	%f25,	%f4
	edge32ln	%l3,	%i5,	%g7
	orncc	%l6,	%g1,	%i3
	brgz,a	%o1,	loop_401
	nop
	setx	0xD069E2FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	nop
	setx	0x603DF843A24283CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x079EEA87C3068730,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f4,	%f0
	fmovdgu	%icc,	%f19,	%f28
loop_401:
	bneg	loop_402
	umul	%o5,	%i2,	%l5
	movrgz	%l0,	%o6,	%i1
	alignaddrl	%i4,	%g3,	%g6
loop_402:
	nop
	set	0x62, %l3
	ldsba	[%l7 + %l3] 0x10,	%i0
	srl	%o0,	0x17,	%l1
	bn,pn	%icc,	loop_403
	fmovrdlez	%i7,	%f24,	%f10
	fcmple16	%f26,	%f20,	%o2
	array8	%l2,	%o7,	%g5
loop_403:
	brgez	%o3,	loop_404
	fbule,a	%fcc0,	loop_405
	fcmpeq16	%f16,	%f4,	%g2
	nop
	setx	0xE9CE3CAA7068994A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_404:
	taddcctv	%l4,	%g4,	%o4
loop_405:
	tsubcctv	%i6,	0x0EC0,	%i5
	movrne	%l3,	0x2AE,	%g7
	brz	%l6,	loop_406
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f20,	%f8
	stb	%i3,	[%l7 + 0x34]
loop_406:
	nop
	set	0x38, %i2
	sta	%f16,	[%l7 + %i2] 0x81
	fcmpeq32	%f4,	%f18,	%g1
	fmovrdgez	%o1,	%f6,	%f26
	tleu	%icc,	0x5
	movrne	%o5,	0x2B9,	%i2
	fbn	%fcc1,	loop_407
	fblg	%fcc2,	loop_408
	brnz,a	%l0,	loop_409
	umul	%o6,	0x0451,	%i1
loop_407:
	xor	%l5,	%g3,	%i4
loop_408:
	brz,a	%i0,	loop_410
loop_409:
	bg,a,pn	%icc,	loop_411
	movrlez	%g6,	0x25E,	%o0
	umulcc	%l1,	%o2,	%l2
loop_410:
	nop
	set	0x67, %l4
	stb	%i7,	[%l7 + %l4]
loop_411:
	fbu	%fcc3,	loop_412
	sllx	%o7,	%o3,	%g5
	nop
	setx	0x4A674FB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xAFE29942,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f26,	%f23
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_412:
	movrgez	%l4,	0x147,	%g4
	xor	%g2,	0x0042,	%i6
	edge32n	%i5,	%l3,	%o4
	set	0x12, %l1
	lduba	[%l7 + %l1] 0x14,	%g7
	movvs	%xcc,	%l6,	%g1
	udivx	%o1,	0x0F1B,	%o5
	fnand	%f18,	%f6,	%f24
	smulcc	%i2,	%i3,	%l0
	set	0x36, %l0
	ldstuba	[%l7 + %l0] 0x04,	%i1
	edge16ln	%l5,	%g3,	%i4
	fnot2s	%f18,	%f19
	set	0x58, %i4
	stxa	%i0,	[%l7 + %i4] 0x2f
	membar	#Sync
	fmovs	%f27,	%f26
	edge8ln	%g6,	%o6,	%l1
	bvc	%icc,	loop_413
	or	%o2,	0x0596,	%o0
	tcc	%xcc,	0x6
	tle	%icc,	0x2
loop_413:
	edge8ln	%i7,	%o7,	%l2
	fbg	%fcc0,	loop_414
	bge,a	%xcc,	loop_415
	array16	%g5,	%o3,	%l4
	movne	%icc,	%g2,	%i6
loop_414:
	bvc,a	%icc,	loop_416
loop_415:
	fmul8x16au	%f8,	%f22,	%f30
	movneg	%icc,	%g4,	%i5
	fmovsne	%xcc,	%f4,	%f28
loop_416:
	fsrc1	%f28,	%f18
	mulx	%l3,	%o4,	%l6
	movrgz	%g7,	0x086,	%o1
	fpmerge	%f1,	%f20,	%f14
	nop
	setx loop_417, %l0, %l1
	jmpl %l1, %o5
	tle	%xcc,	0x1
	alignaddr	%i2,	%i3,	%g1
	fbue,a	%fcc2,	loop_418
loop_417:
	or	%l0,	0x0C29,	%i1
	alignaddrl	%g3,	%i4,	%i0
	fnegs	%f12,	%f8
loop_418:
	ta	%xcc,	0x6
	fandnot1	%f26,	%f30,	%f18
	subc	%l5,	0x1891,	%g6
	set	0x30, %g2
	ldda	[%l7 + %g2] 0xe3,	%l0
	edge32ln	%o6,	%o0,	%i7
	array32	%o7,	%l2,	%g5
	stw	%o2,	[%l7 + 0x54]
	movrlz	%o3,	0x0FF,	%l4
	brlz,a	%i6,	loop_419
	tsubcc	%g2,	%g4,	%i5
	brlz,a	%l3,	loop_420
	udivx	%o4,	0x0FC0,	%l6
loop_419:
	udivx	%o1,	0x14DF,	%g7
	fornot1s	%f18,	%f29,	%f1
loop_420:
	nop
	fitos	%f14,	%f20
	fstox	%f20,	%f18
	fmuld8ulx16	%f21,	%f11,	%f20
	fmovrse	%o5,	%f0,	%f17
	stb	%i2,	[%l7 + 0x55]
	movpos	%icc,	%g1,	%i3
	fexpand	%f23,	%f22
	nop
	setx	0x8BFC3247B071CC85,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	orn	%i1,	%g3,	%l0
	fpadd32s	%f5,	%f28,	%f31
	xnorcc	%i0,	0x0BBC,	%i4
	array16	%g6,	%l1,	%o6
	fcmple32	%f12,	%f30,	%l5
	ldsh	[%l7 + 0x4C],	%o0
	fornot2	%f24,	%f6,	%f12
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	0x1F
	stx	%i7,	[%l7 + 0x78]
	orcc	%o7,	0x16BE,	%g5
	taddcctv	%l2,	0x043A,	%o3
	mulx	%l4,	%i6,	%o2
	brnz,a	%g2,	loop_421
	popc	%g4,	%l3
	fmovsvc	%xcc,	%f21,	%f16
	fbl,a	%fcc1,	loop_422
loop_421:
	edge8ln	%o4,	%l6,	%i5
	mulx	%g7,	%o1,	%i2
	xorcc	%g1,	%i3,	%i1
loop_422:
	xnor	%g3,	0x0D79,	%l0
	nop
	setx	0xFA004351F4F64F03,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x90844E18791F737F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f10,	%f0
	sll	%o5,	0x0D,	%i0
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x04,	%f0
	edge8ln	%g6,	%i4,	%o6
	movge	%xcc,	%l1,	%o0
	tn	%icc,	0x6
	nop
	setx	0x7AF517EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x0F3CD59F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f5,	%f22
	andcc	%i7,	0x0C64,	%o7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%l5
	bleu,a	%xcc,	loop_423
	te	%xcc,	0x1
	smulcc	%o3,	%l2,	%i6
	ldd	[%l7 + 0x18],	%f24
loop_423:
	tneg	%xcc,	0x7
	alignaddr	%o2,	%g2,	%g4
	tne	%xcc,	0x7
	movn	%icc,	%l4,	%o4
	edge32l	%l3,	%l6,	%g7
	brgez,a	%i5,	loop_424
	sethi	0x07DB,	%i2
	tne	%xcc,	0x4
	fmovdvc	%icc,	%f29,	%f31
loop_424:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o1,	%i3,	%g1
	tle	%xcc,	0x4
	fmovdcs	%icc,	%f15,	%f25
	te	%xcc,	0x3
	tl	%icc,	0x6
	alignaddr	%g3,	%l0,	%i1
	sdivcc	%o5,	0x15D2,	%i0
	fmovdneg	%icc,	%f2,	%f16
	xor	%g6,	%i4,	%l1
	edge16n	%o6,	%o0,	%i7
	tcc	%icc,	0x2
	nop
	setx	loop_425,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbn	%fcc0,	loop_426
	tn	%xcc,	0x1
	mulx	%g5,	%o7,	%l5
loop_425:
	movle	%xcc,	%l2,	%o3
loop_426:
	tgu	%icc,	0x4
	sll	%o2,	0x13,	%i6
	or	%g4,	%l4,	%g2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x36] %asi,	%o4
	or	%l6,	0x0D6F,	%g7
	tle	%xcc,	0x0
	fone	%f28
	xor	%i5,	%i2,	%l3
	xnor	%i3,	%g1,	%g3
	nop
	fitod	%f10,	%f10
	fdtoi	%f10,	%f8
	edge16n	%l0,	%i1,	%o5
	array16	%o1,	%g6,	%i4
	orn	%i0,	0x1AA3,	%l1
	edge32	%o0,	%i7,	%g5
	tpos	%xcc,	0x1
	flush	%l7 + 0x54
	andn	%o7,	%o6,	%l2
	alignaddrl	%l5,	%o2,	%o3
	edge8	%g4,	%i6,	%l4
	ld	[%l7 + 0x28],	%f21
	lduw	[%l7 + 0x70],	%g2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%o4
	tsubcc	%i5,	%i2,	%l3
	ldsh	[%l7 + 0x6A],	%i3
	sdivx	%g1,	0x18B4,	%g7
	edge8	%g3,	%i1,	%o5
	call	loop_427
	edge16n	%o1,	%l0,	%g6
	srlx	%i0,	%i4,	%l1
	add	%i7,	%g5,	%o0
loop_427:
	tne	%xcc,	0x1
	udivcc	%o7,	0x0014,	%l2
	fnot2	%f12,	%f20
	te	%icc,	0x2
	bleu,a	%xcc,	loop_428
	fmovdvc	%icc,	%f27,	%f12
	udivx	%o6,	0x1C3B,	%l5
	set	0x75, %o3
	stba	%o2,	[%l7 + %o3] 0x2a
	membar	#Sync
loop_428:
	fmovdgu	%icc,	%f7,	%f24
	brnz	%o3,	loop_429
	umulcc	%i6,	%l4,	%g4
	movrlz	%g2,	%o4,	%i5
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x14] %asi,	%l6
loop_429:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a	loop_430
	ldd	[%l7 + 0x28],	%f24
	tle	%icc,	0x7
	set	0x12, %g4
	lduha	[%l7 + %g4] 0x81,	%i2
loop_430:
	tneg	%xcc,	0x1
	bcs,a	loop_431
	alignaddr	%l3,	%i3,	%g7
	tle	%xcc,	0x2
	fnot1s	%f18,	%f10
loop_431:
	bne,a	%icc,	loop_432
	nop
	setx	loop_433,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array16	%g1,	%g3,	%o5
	movrgez	%o1,	0x211,	%l0
loop_432:
	fmovdleu	%xcc,	%f23,	%f28
loop_433:
	fbn,a	%fcc1,	loop_434
	srlx	%g6,	0x0C,	%i0
	bpos,a	loop_435
	tsubcc	%i1,	0x0788,	%i4
loop_434:
	mova	%icc,	%l1,	%i7
	taddcc	%g5,	%o7,	%o0
loop_435:
	ldsb	[%l7 + 0x5A],	%o6
	fors	%f17,	%f25,	%f17
	fmovsg	%xcc,	%f11,	%f27
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	edge32l	%l5,	%o3,	%i6
	move	%xcc,	%o2,	%g4
	movl	%xcc,	%g2,	%l4
	sllx	%i5,	%l6,	%o4
	fcmpgt32	%f30,	%f16,	%l3
	movpos	%xcc,	%i3,	%i2
	fnot2s	%f7,	%f13
	smul	%g1,	0x0C8E,	%g7
	bcs	loop_436
	tle	%xcc,	0x0
	tvs	%icc,	0x1
	fmul8ulx16	%f22,	%f8,	%f26
loop_436:
	nop
	setx	0x1C2CF232,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x86DE3BD0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f6,	%f21
	tvs	%xcc,	0x6
	taddcc	%o5,	0x1182,	%o1
	movrne	%g3,	%l0,	%i0
	movvs	%icc,	%i1,	%i4
	smulcc	%l1,	0x063E,	%i7
	srax	%g5,	0x09,	%o7
	nop
	set	0x5C, %g7
	stw	%g6,	[%l7 + %g7]
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o6,	%o0
	mulscc	%l2,	%l5,	%i6
	edge16	%o2,	%g4,	%o3
	edge32	%l4,	%g2,	%l6
	fmul8x16au	%f30,	%f15,	%f14
	orn	%o4,	0x080A,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%l3,	%i3
	wr	%g0,	0x81,	%asi
	stwa	%i2,	[%l7 + 0x6C] %asi
	bg	%icc,	loop_437
	movrgez	%g1,	0x367,	%g7
	bgu,a	loop_438
	fmovdvs	%icc,	%f18,	%f13
loop_437:
	ta	%xcc,	0x4
	xorcc	%o5,	%o1,	%g3
loop_438:
	tcs	%xcc,	0x5
	movleu	%xcc,	%l0,	%i0
	movle	%xcc,	%i4,	%i1
	udiv	%l1,	0x1B8C,	%g5
	array16	%i7,	%o7,	%o6
	movl	%xcc,	%o0,	%l2
	movleu	%xcc,	%g6,	%i6
	fcmpne32	%f0,	%f14,	%l5
	edge8l	%g4,	%o3,	%l4
	sir	0x11BB
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x70, %l2
	ldda	[%l7 + %l2] 0x2e,	%o2
	movpos	%icc,	%l6,	%o4
	bneg	%xcc,	loop_439
	srlx	%g2,	0x0C,	%l3
	xnor	%i3,	%i5,	%i2
	set	0x3E, %i6
	lduba	[%l7 + %i6] 0x80,	%g7
loop_439:
	nop
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x17
	membar	#Sync
	move	%xcc,	%g1,	%o5
	lduh	[%l7 + 0x6C],	%o1
	sir	0x0998
	bneg,a	loop_440
	te	%xcc,	0x6
	fcmpgt16	%f30,	%f30,	%g3
	array16	%l0,	%i0,	%i1
loop_440:
	bshuffle	%f6,	%f24,	%f8
	addcc	%l1,	%i4,	%g5
	array32	%o7,	%o6,	%o0
	addccc	%l2,	%i7,	%g6
	fornot2	%f18,	%f14,	%f6
	ldstub	[%l7 + 0x24],	%i6
	nop
	setx	0xE05146CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	taddcc	%g4,	%l5,	%l4
	nop
	fitos	%f1,	%f26
	fstoi	%f26,	%f8
	fpackfix	%f16,	%f15
	subc	%o3,	0x12C9,	%l6
	addccc	%o4,	%o2,	%g2
	nop
	setx	0xD28F1C04,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x31FD90C7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f20,	%f6
	fmovsge	%xcc,	%f19,	%f28
	ldx	[%l7 + 0x60],	%l3
	prefetch	[%l7 + 0x54],	 0x3
	fabsd	%f20,	%f12
	brnz,a	%i5,	loop_441
	movge	%icc,	%i2,	%i3
	bg	%icc,	loop_442
	edge32	%g7,	%g1,	%o1
loop_441:
	fble	%fcc1,	loop_443
	andcc	%g3,	0x1D46,	%l0
loop_442:
	tcc	%icc,	0x2
	andncc	%i0,	%i1,	%o5
loop_443:
	tg	%icc,	0x5
	movcs	%xcc,	%i4,	%g5
	fmovrdgz	%o7,	%f18,	%f20
	tcs	%icc,	0x6
	fbul	%fcc0,	loop_444
	subcc	%o6,	0x08A5,	%l1
	ta	%xcc,	0x4
	fmovdcc	%xcc,	%f13,	%f17
loop_444:
	sethi	0x1815,	%o0
	bleu	loop_445
	movpos	%xcc,	%l2,	%g6
	fmul8sux16	%f16,	%f2,	%f28
	umul	%i7,	%g4,	%i6
loop_445:
	stx	%l4,	[%l7 + 0x48]
	bvc	loop_446
	and	%o3,	%l5,	%o4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x150] %asi,	%l6 ripped by fixASI40.pl ripped by fixASI40.pl
loop_446:
	array16	%g2,	%l3,	%o2
	tgu	%icc,	0x6
	movleu	%icc,	%i5,	%i2
	fpsub16s	%f12,	%f21,	%f0
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x2C] %asi,	%f21
	srax	%g7,	0x13,	%i3
	fpadd16	%f20,	%f8,	%f8
	subcc	%g1,	%o1,	%g3
	ta	%icc,	0x0
	sdivcc	%i0,	0x00B1,	%i1
	edge32	%o5,	%l0,	%g5
	fbl	%fcc0,	loop_447
	movpos	%xcc,	%i4,	%o6
	subcc	%l1,	%o7,	%l2
	umulcc	%g6,	%o0,	%g4
loop_447:
	xnor	%i7,	0x03B4,	%i6
	tcc	%xcc,	0x0
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x28] %asi,	%f22
	taddcctv	%l4,	0x10F9,	%o3
	fmovsn	%xcc,	%f7,	%f31
	nop
	set	0x78, %i0
	prefetch	[%l7 + %i0],	 0x2
	subc	%l5,	0x16D4,	%o4
	tl	%icc,	0x5
	movgu	%xcc,	%l6,	%g2
	fpsub16s	%f21,	%f18,	%f31
	lduw	[%l7 + 0x64],	%l3
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x5A] %asi,	%i5
	fmovrdgez	%i2,	%f28,	%f8
	tpos	%icc,	0x6
	taddcc	%g7,	%i3,	%o2
	tne	%icc,	0x5
	fba	%fcc2,	loop_448
	tge	%icc,	0x6
	alignaddr	%o1,	%g1,	%g3
	tvc	%icc,	0x7
loop_448:
	nop
	fitos	%f12,	%f28
	fstoi	%f28,	%f31
	fmovdpos	%icc,	%f28,	%f9
	ble	%xcc,	loop_449
	movrgez	%i1,	0x385,	%i0
	swap	[%l7 + 0x50],	%l0
	swap	[%l7 + 0x48],	%g5
loop_449:
	tgu	%icc,	0x5
	orcc	%o5,	%i4,	%o6
	ta	%xcc,	0x4
	subccc	%o7,	0x0DFB,	%l2
	fandnot2s	%f25,	%f19,	%f29
	movvc	%xcc,	%l1,	%g6
	movpos	%xcc,	%g4,	%i7
	movl	%icc,	%i6,	%o0
	fbule	%fcc1,	loop_450
	tsubcctv	%l4,	0x0BBE,	%o3
	bn,a	%xcc,	loop_451
	tsubcctv	%l5,	%l6,	%g2
loop_450:
	tcc	%xcc,	0x2
	xnor	%l3,	%o4,	%i5
loop_451:
	tcs	%icc,	0x1
	fcmple32	%f12,	%f8,	%i2
	nop
	setx	0x40FE6696C046840D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fsrc1s	%f30,	%f28
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i3,	%o2
	edge32ln	%g7,	%g1,	%o1
	fmovsgu	%icc,	%f11,	%f10
	fble,a	%fcc1,	loop_452
	movn	%xcc,	%g3,	%i0
	brlez,a	%i1,	loop_453
	edge8l	%l0,	%g5,	%i4
loop_452:
	mulx	%o6,	%o5,	%o7
	udivcc	%l2,	0x0825,	%g6
loop_453:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x20, %g5
	ldx	[%l7 + %g5],	%g4
	ldx	[%l7 + 0x78],	%i7
	fbul,a	%fcc1,	loop_454
	fsrc1	%f20,	%f26
	or	%l1,	0x156C,	%o0
	orcc	%l4,	0x1DE0,	%i6
loop_454:
	srax	%l5,	0x0A,	%o3
	brgez,a	%g2,	loop_455
	ble,a	%icc,	loop_456
	and	%l6,	%l3,	%i5
	fsrc1	%f22,	%f10
loop_455:
	array8	%o4,	%i3,	%o2
loop_456:
	nop
	set	0x7C, %l6
	stha	%i2,	[%l7 + %l6] 0x10
	fble	%fcc2,	loop_457
	fmovdvs	%icc,	%f5,	%f2
	xor	%g7,	0x05F1,	%o1
	te	%icc,	0x7
loop_457:
	tvs	%xcc,	0x6
	edge8l	%g3,	%i0,	%g1
	fmovrdgz	%l0,	%f8,	%f16
	fnot1s	%f15,	%f15
	fmovrslz	%g5,	%f2,	%f16
	be,a,pn	%xcc,	loop_458
	ta	%xcc,	0x5
	popc	%i4,	%o6
	xor	%i1,	%o5,	%o7
loop_458:
	nop
	wr	%g0,	0x81,	%asi
	stha	%g6,	[%l7 + 0x66] %asi
	tl	%icc,	0x3
	srl	%g4,	%l2,	%l1
	tg	%xcc,	0x6
	tvc	%xcc,	0x6
	tn	%xcc,	0x6
	umul	%i7,	%o0,	%i6
	fsrc1s	%f22,	%f28
	tsubcctv	%l4,	%o3,	%g2
	edge16n	%l6,	%l3,	%l5
	tne	%icc,	0x4
	subcc	%i5,	0x0A49,	%i3
	edge8n	%o4,	%i2,	%o2
	smul	%g7,	%o1,	%i0
	xor	%g1,	0x14F1,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g5,	%l0
	taddcctv	%o6,	0x1D16,	%i1
	andncc	%i4,	%o7,	%g6
	orncc	%o5,	0x0890,	%g4
	fbo	%fcc2,	loop_459
	fcmpeq32	%f24,	%f2,	%l2
	movvc	%icc,	%i7,	%l1
	tcs	%xcc,	0x5
loop_459:
	nop
	set	0x20, %i1
	ldda	[%l7 + %i1] 0xe3,	%o0
	movpos	%xcc,	%l4,	%o3
	udiv	%i6,	0x04E7,	%l6
	nop
	setx	0x410D2C3856D5DF7E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f12
	tn	%icc,	0x4
	set	0x68, %o7
	sta	%f30,	[%l7 + %o7] 0x18
	fzeros	%f24
	set	0x68, %i5
	swapa	[%l7 + %i5] 0x80,	%l3
	popc	%l5,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i3,	%o4,	%i2
	fpsub32	%f12,	%f16,	%f10
	movvc	%xcc,	%o2,	%i5
	movle	%icc,	%o1,	%i0
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	xnor	%g1,	%g3,	%g5
	fzeros	%f9
	fnand	%f6,	%f8,	%f8
	fbl,a	%fcc2,	loop_460
	pdist	%f30,	%f24,	%f30
	sth	%g7,	[%l7 + 0x5E]
	popc	%l0,	%o6
loop_460:
	smul	%i1,	0x1070,	%o7
	bcs	%icc,	loop_461
	tl	%xcc,	0x3
	fmovdl	%xcc,	%f10,	%f25
	sir	0x1969
loop_461:
	sllx	%g6,	0x03,	%o5
	movvc	%xcc,	%i4,	%g4
	mova	%icc,	%l2,	%l1
	fmovrdne	%o0,	%f24,	%f30
	fmovsge	%icc,	%f16,	%f28
	fmovdpos	%icc,	%f11,	%f21
	ldsw	[%l7 + 0x08],	%i7
	membar	0x1B
	nop
	setx	0x5B7BBA78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x4823DFC8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f5,	%f14
	prefetch	[%l7 + 0x7C],	 0x2
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%f10
	fmovsle	%xcc,	%f31,	%f29
	fmovsvs	%xcc,	%f27,	%f13
	sll	%o3,	0x00,	%i6
	nop
	set	0x6A, %g3
	lduh	[%l7 + %g3],	%l6
	array16	%l3,	%l4,	%l5
	movvs	%icc,	%i3,	%g2
	andcc	%i2,	%o2,	%i5
	sir	0x0C9E
	fmovscs	%icc,	%f21,	%f18
	set	0x3A, %o6
	ldstuba	[%l7 + %o6] 0x89,	%o1
	fbl,a	%fcc3,	loop_462
	tl	%xcc,	0x0
	and	%i0,	%o4,	%g1
	edge32	%g5,	%g3,	%g7
loop_462:
	orn	%l0,	0x0D68,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i1,	%o7
	sethi	0x0B9B,	%o5
	stbar
	fmul8x16al	%f26,	%f9,	%f16
	edge32l	%g6,	%i4,	%l2
	ld	[%l7 + 0x44],	%f0
	nop
	fitos	%f10,	%f31
	brz	%g4,	loop_463
	movle	%xcc,	%o0,	%l1
	mulscc	%i7,	%i6,	%o3
	fble,a	%fcc0,	loop_464
loop_463:
	fmovdcs	%xcc,	%f5,	%f11
	alignaddrl	%l3,	%l4,	%l6
	set	0x38, %o0
	prefetcha	[%l7 + %o0] 0x88,	 0x1
loop_464:
	ldsb	[%l7 + 0x12],	%i3
	sllx	%i2,	0x02,	%o2
	addc	%g2,	%i5,	%i0
	fmul8ulx16	%f0,	%f26,	%f10
	edge8n	%o1,	%g1,	%o4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x10,	%g5,	%g3
	alignaddr	%l0,	%g7,	%o6
	ldstub	[%l7 + 0x57],	%o7
	edge16ln	%o5,	%g6,	%i4
	fmul8ulx16	%f16,	%f14,	%f2
	fpack16	%f26,	%f22
	subc	%i1,	0x1508,	%g4
	ld	[%l7 + 0x5C],	%f24
	move	%xcc,	%l2,	%l1
	fbl,a	%fcc1,	loop_465
	fmovrsgz	%o0,	%f28,	%f9
	fmovrde	%i7,	%f28,	%f8
	fmovse	%xcc,	%f13,	%f3
loop_465:
	movgu	%icc,	%o3,	%l3
	xor	%l4,	0x06FB,	%l6
	fpsub32s	%f1,	%f10,	%f29
	fpack32	%f12,	%f4,	%f24
	fbule	%fcc1,	loop_466
	fmovdpos	%xcc,	%f12,	%f16
	edge32	%i6,	%l5,	%i3
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x68] %asi,	%f26
loop_466:
	te	%xcc,	0x1
	movg	%icc,	%i2,	%g2
	or	%o2,	0x05E1,	%i0
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x0c
	fble,a	%fcc2,	loop_467
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs	%xcc,	loop_468
	xnor	%o1,	%i5,	%o4
loop_467:
	edge16n	%g5,	%g1,	%l0
	tne	%xcc,	0x5
loop_468:
	tcs	%xcc,	0x1
	taddcctv	%g3,	0x06E9,	%g7
	mulscc	%o6,	0x132B,	%o5
	movleu	%icc,	%o7,	%g6
	fcmpne16	%f28,	%f18,	%i1
	fmovse	%xcc,	%f22,	%f24
	nop
	setx	0x31B5CF57,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x91AF7E32,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f5,	%f1
	edge8	%i4,	%g4,	%l1
	smul	%l2,	%i7,	%o0
	xnor	%o3,	0x007C,	%l3
	movcs	%icc,	%l4,	%l6
	fpadd32s	%f10,	%f18,	%f26
	fxnors	%f0,	%f14,	%f8
	tsubcc	%i6,	%l5,	%i2
	set	0x50, %o2
	sta	%f27,	[%l7 + %o2] 0x18
	srax	%i3,	%o2,	%g2
	bcs,a	%icc,	loop_469
	lduw	[%l7 + 0x6C],	%o1
	tsubcc	%i5,	%o4,	%g5
	tcc	%icc,	0x5
loop_469:
	edge16ln	%i0,	%g1,	%l0
	edge16ln	%g7,	%o6,	%g3
	fsrc1s	%f3,	%f9
	movge	%icc,	%o7,	%g6
	fmovs	%f29,	%f11
	subccc	%i1,	%i4,	%o5
	ble,pn	%xcc,	loop_470
	brlz	%g4,	loop_471
	fmovrde	%l1,	%f22,	%f16
	subccc	%i7,	%o0,	%o3
loop_470:
	tvc	%icc,	0x1
loop_471:
	array32	%l2,	%l4,	%l6
	fornot1s	%f24,	%f15,	%f1
	array32	%l3,	%i6,	%l5
	fsrc2	%f10,	%f20
	std	%f26,	[%l7 + 0x08]
	edge16l	%i2,	%i3,	%o2
	bl,a,pn	%xcc,	loop_472
	movpos	%icc,	%o1,	%g2
	fxnors	%f21,	%f30,	%f17
	edge8n	%o4,	%i5,	%g5
loop_472:
	fbe,a	%fcc0,	loop_473
	edge32n	%i0,	%l0,	%g1
	fba	%fcc3,	loop_474
	fbule	%fcc1,	loop_475
loop_473:
	tvs	%icc,	0x3
	movre	%g7,	%o6,	%g3
loop_474:
	subccc	%o7,	0x0327,	%g6
loop_475:
	tl	%icc,	0x1
	xor	%i1,	0x156F,	%i4
	array32	%g4,	%o5,	%i7
	xnor	%o0,	%l1,	%o3
	and	%l4,	0x1CAD,	%l6
	fmovdvs	%icc,	%f18,	%f9
	brgz	%l2,	loop_476
	sllx	%i6,	0x1E,	%l3
	sdivcc	%i2,	0x094C,	%i3
	fornot2	%f0,	%f16,	%f22
loop_476:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x3A] %asi,	%l5
	nop
	setx	0xEE70CE26206CCF7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	movge	%xcc,	%o1,	%g2
	fbg	%fcc3,	loop_477
	and	%o4,	0x00F3,	%o2
	fsrc1	%f18,	%f0
	sir	0x0D91
loop_477:
	nop
	set	0x1A, %g1
	ldsha	[%l7 + %g1] 0x11,	%g5
	ldx	[%l7 + 0x38],	%i5
	fmovsgu	%icc,	%f26,	%f17
	set	0x3C, %i3
	sta	%f28,	[%l7 + %i3] 0x0c
	movre	%i0,	%l0,	%g1
	movrlez	%o6,	%g3,	%o7
	popc	%g6,	%i1
	fmovrsgez	%g7,	%f0,	%f9
	or	%i4,	%g4,	%o5
	tl	%icc,	0x4
	movcc	%icc,	%i7,	%o0
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x2e,	%o2
	ld	[%l7 + 0x5C],	%f27
	fmuld8sux16	%f11,	%f4,	%f26
	fmovdpos	%icc,	%f15,	%f27
	movvc	%xcc,	%l4,	%l6
	call	loop_478
	edge8n	%l2,	%i6,	%l1
	fmovspos	%xcc,	%f26,	%f10
	edge32	%i2,	%i3,	%l5
loop_478:
	movvc	%xcc,	%l3,	%o1
	fbule	%fcc3,	loop_479
	tn	%icc,	0x6
	fbne	%fcc0,	loop_480
	fpadd32s	%f14,	%f20,	%f0
loop_479:
	sir	0x1563
	movn	%xcc,	%o4,	%g2
loop_480:
	fxnor	%f18,	%f10,	%f30
	fandnot2	%f8,	%f18,	%f24
	edge16ln	%g5,	%i5,	%o2
	array8	%i0,	%l0,	%g1
	umul	%g3,	%o6,	%g6
	add	%i1,	%g7,	%o7
	edge16l	%i4,	%g4,	%i7
	bcs,a,pt	%icc,	loop_481
	fnors	%f13,	%f21,	%f3
	move	%xcc,	%o0,	%o3
	fnand	%f2,	%f6,	%f26
loop_481:
	orncc	%o5,	%l6,	%l4
	movcs	%xcc,	%i6,	%l1
	array16	%i2,	%l2,	%l5
	edge32n	%l3,	%o1,	%o4
	fandnot2s	%f25,	%f25,	%f14
	movcs	%icc,	%i3,	%g2
	popc	%g5,	%o2
	tvc	%icc,	0x0
	fpsub16	%f0,	%f6,	%f10
	ldd	[%l7 + 0x50],	%i4
	sra	%l0,	0x15,	%g1
	movrgz	%g3,	0x076,	%o6
	movcs	%xcc,	%g6,	%i0
	nop
	fitos	%f11,	%f21
	nop
	fitod	%f25,	%f10
	movg	%xcc,	%g7,	%i1
	movl	%icc,	%i4,	%o7
	sdiv	%g4,	0x0E99,	%i7
	fxors	%f15,	%f19,	%f2
	srlx	%o0,	%o3,	%l6
	fmovrsgz	%o5,	%f13,	%f18
	orncc	%i6,	%l4,	%l1
	brnz	%l2,	loop_482
	udiv	%i2,	0x054F,	%l3
	movre	%l5,	%o4,	%o1
	fcmpne16	%f4,	%f30,	%g2
loop_482:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f30
	mulscc	%i3,	0x002D,	%g5
	bg	loop_483
	tcc	%icc,	0x1
	ba,a,pt	%icc,	loop_484
	tvs	%xcc,	0x2
loop_483:
	movne	%xcc,	%o2,	%l0
	fmovda	%icc,	%f9,	%f2
loop_484:
	fcmpne16	%f0,	%f2,	%i5
	sub	%g3,	0x1B04,	%g1
	sethi	0x039B,	%o6
	alignaddrl	%i0,	%g7,	%g6
	edge16	%i4,	%i1,	%g4
	add	%i7,	%o7,	%o3
	fbne,a	%fcc1,	loop_485
	mova	%icc,	%l6,	%o5
	popc	0x0C02,	%i6
	edge16ln	%l4,	%l1,	%o0
loop_485:
	udivcc	%i2,	0x1D8D,	%l2
	nop
	setx	0x09324E4E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f7
	fbo	%fcc0,	loop_486
	tgu	%icc,	0x2
	ta	%xcc,	0x5
	brnz,a	%l5,	loop_487
loop_486:
	fbge	%fcc3,	loop_488
	call	loop_489
	bvs	%xcc,	loop_490
loop_487:
	nop
	setx	loop_491,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_488:
	sir	0x1A7B
loop_489:
	sth	%o4,	[%l7 + 0x60]
loop_490:
	fpsub16s	%f12,	%f18,	%f4
loop_491:
	popc	0x1DCA,	%o1
	mova	%icc,	%l3,	%i3
	andcc	%g2,	%o2,	%l0
	tl	%icc,	0x1
	fmovda	%icc,	%f10,	%f16
	subcc	%i5,	%g5,	%g1
	movcs	%xcc,	%o6,	%i0
	ldsw	[%l7 + 0x64],	%g7
	fmovsa	%icc,	%f18,	%f21
	fzeros	%f31
	edge16ln	%g3,	%g6,	%i4
	sir	0x12F4
	set	0x18, %l3
	lduwa	[%l7 + %l3] 0x18,	%g4
	movne	%xcc,	%i1,	%i7
	add	%o3,	%o7,	%l6
	fmovsvc	%icc,	%f22,	%f19
	fbo,a	%fcc0,	loop_492
	edge8	%i6,	%o5,	%l4
	andcc	%l1,	0x11BB,	%i2
	orn	%o0,	%l2,	%l5
loop_492:
	movvc	%icc,	%o1,	%l3
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
	edge16l	%o4,	%g2,	%i3
	fblg	%fcc2,	loop_494
	array16	%l0,	%i5,	%o2
loop_493:
	xorcc	%g5,	0x1E1C,	%o6
	orcc	%i0,	%g1,	%g7
loop_494:
	subcc	%g3,	%i4,	%g4
	edge8	%g6,	%i7,	%o3
	srax	%i1,	0x09,	%l6
	udivx	%i6,	0x1A56,	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x10,	%l4,	%l1
	fblg	%fcc1,	loop_495
	fmovdle	%xcc,	%f22,	%f20
	bge	loop_496
	fpmerge	%f23,	%f8,	%f0
loop_495:
	orn	%i2,	%o7,	%o0
	srlx	%l5,	%o1,	%l3
loop_496:
	fcmpeq16	%f0,	%f4,	%o4
	edge8l	%g2,	%l2,	%i3
	set	0x50, %i2
	lduwa	[%l7 + %i2] 0x81,	%i5
	edge32	%o2,	%g5,	%l0
	movle	%icc,	%i0,	%o6
	edge16	%g7,	%g1,	%g3
	bneg	%icc,	loop_497
	smul	%g4,	0x1AEB,	%i4
	movrne	%g6,	0x211,	%o3
	edge8l	%i1,	%i7,	%l6
loop_497:
	edge32ln	%o5,	%i6,	%l1
	fbuge,a	%fcc2,	loop_498
	edge8ln	%i2,	%o7,	%o0
	fblg	%fcc1,	loop_499
	fblg,a	%fcc0,	loop_500
loop_498:
	movne	%xcc,	%l4,	%l5
	bleu,a	loop_501
loop_499:
	andcc	%o1,	%o4,	%l3
loop_500:
	subcc	%g2,	0x01FF,	%i3
	fmovrsne	%i5,	%f31,	%f8
loop_501:
	tleu	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,pn	%icc,	loop_502
	bvs,a	loop_503
	tl	%icc,	0x4
	nop
	setx	0x284C9274,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x21FBAEC2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f30,	%f23
loop_502:
	nop
	wr	%g0,	0xe3,	%asi
	stha	%o2,	[%l7 + 0x4C] %asi
	membar	#Sync
loop_503:
	alignaddr	%l2,	%g5,	%l0
	tle	%xcc,	0x2
	movneg	%icc,	%o6,	%g7
	edge32l	%i0,	%g3,	%g4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x32] %asi,	%g1
	movvc	%icc,	%g6,	%i4
	smulcc	%o3,	%i7,	%i1
	smul	%o5,	%l6,	%l1
	bpos,a	loop_504
	fmovrdlz	%i2,	%f0,	%f6
	fnegd	%f16,	%f8
	orn	%i6,	0x034E,	%o7
loop_504:
	tneg	%icc,	0x6
	andcc	%o0,	%l5,	%l4
	ble	loop_505
	edge8n	%o4,	%l3,	%o1
	swap	[%l7 + 0x5C],	%g2
	nop
	fitos	%f15,	%f7
loop_505:
	movne	%icc,	%i5,	%i3
	fmovdge	%icc,	%f24,	%f23
	srl	%l2,	0x14,	%g5
	subccc	%o2,	%o6,	%l0
	fbule,a	%fcc3,	loop_506
	xorcc	%i0,	0x0D0B,	%g7
	fmovscs	%icc,	%f4,	%f5
	movle	%icc,	%g4,	%g1
loop_506:
	brlez	%g6,	loop_507
	or	%g3,	%o3,	%i7
	movvs	%icc,	%i1,	%i4
	nop
	setx	0x7C13661B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xC5EE3796,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f19,	%f23
loop_507:
	alignaddr	%o5,	%l1,	%i2
	fbu	%fcc0,	loop_508
	srlx	%i6,	0x13,	%o7
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l6
loop_508:
	fbge,a	%fcc2,	loop_509
	movleu	%xcc,	%l5,	%o0
	fmovsle	%xcc,	%f4,	%f9
	nop
	setx	loop_510,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_509:
	fmovdcs	%xcc,	%f22,	%f28
	movgu	%xcc,	%o4,	%l4
	fpsub32s	%f16,	%f28,	%f30
loop_510:
	taddcc	%l3,	%o1,	%g2
	xorcc	%i5,	0x13D1,	%l2
	lduw	[%l7 + 0x44],	%i3
	bg,a,pt	%xcc,	loop_511
	sdivcc	%o2,	0x003D,	%g5
	tl	%xcc,	0x0
	sll	%l0,	0x19,	%o6
loop_511:
	bgu,a	%xcc,	loop_512
	movleu	%icc,	%g7,	%g4
	sethi	0x0F0D,	%i0
	fandnot1	%f24,	%f12,	%f28
loop_512:
	udiv	%g6,	0x1756,	%g3
	tgu	%xcc,	0x1
	tcc	%icc,	0x1
	array8	%g1,	%i7,	%i1
	subccc	%i4,	%o3,	%l1
	and	%o5,	%i2,	%i6
	fzero	%f14
	nop
	setx	0xE39D737E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xFBD0D502,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fadds	%f8,	%f6,	%f1
	fsrc1s	%f27,	%f19
	fbl,a	%fcc3,	loop_513
	fmovsg	%xcc,	%f28,	%f2
	bcc,a,pt	%icc,	loop_514
	bvc	%icc,	loop_515
loop_513:
	tne	%icc,	0x6
	wr	%g0,	0x2f,	%asi
	stba	%l6,	[%l7 + 0x59] %asi
	membar	#Sync
loop_514:
	brgez,a	%o7,	loop_516
loop_515:
	umulcc	%o0,	0x0CEF,	%l5
	fxnors	%f30,	%f16,	%f16
	movrgz	%l4,	%l3,	%o1
loop_516:
	nop
	setx	0xD064B857,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	ld	[%l7 + 0x34],	%f28
	movrlez	%o4,	%i5,	%g2
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f8
	fxtod	%f8,	%f2
	edge16l	%i3,	%o2,	%g5
	nop
	setx	loop_517,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvc	%xcc,	%l2,	%o6
	popc	0x0AD8,	%g7
	fmovdleu	%xcc,	%f26,	%f25
loop_517:
	taddcc	%l0,	0x1C09,	%g4
	sdivx	%i0,	0x02BC,	%g3
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g6,	0x1F,	%i7
	movgu	%icc,	%g1,	%i1
	ta	%xcc,	0x0
	nop
	setx	0xD85382445D9BF713,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f8
	udivcc	%o3,	0x0338,	%i4
	bge,a	%icc,	loop_518
	bvc,a	%xcc,	loop_519
	movneg	%icc,	%o5,	%l1
	and	%i6,	0x1122,	%l6
loop_518:
	fabss	%f16,	%f16
loop_519:
	srlx	%i2,	%o0,	%l5
	fbue	%fcc2,	loop_520
	bvc,pn	%xcc,	loop_521
	fmovdge	%icc,	%f29,	%f12
	fmovdleu	%icc,	%f20,	%f7
loop_520:
	brgz,a	%l4,	loop_522
loop_521:
	tleu	%xcc,	0x7
	set	0x68, %o5
	stwa	%l3,	[%l7 + %o5] 0x2a
	membar	#Sync
loop_522:
	mova	%xcc,	%o1,	%o4
	fandnot2s	%f19,	%f10,	%f24
	edge8	%o7,	%g2,	%i5
	fnot1	%f20,	%f20
	tgu	%xcc,	0x0
	fzeros	%f1
	tgu	%icc,	0x0
	brgz	%o2,	loop_523
	array16	%g5,	%l2,	%o6
	mulx	%i3,	%l0,	%g7
	fmovde	%xcc,	%f16,	%f30
loop_523:
	bne,a	%icc,	loop_524
	fmovrdgz	%g4,	%f2,	%f14
	bg,a,pt	%xcc,	loop_525
	fbul	%fcc2,	loop_526
loop_524:
	te	%xcc,	0x5
	udivx	%i0,	0x1960,	%g6
loop_525:
	fbne,a	%fcc0,	loop_527
loop_526:
	fones	%f12
	movle	%icc,	%g3,	%g1
	set	0x4D, %l1
	ldsba	[%l7 + %l1] 0x11,	%i1
loop_527:
	edge16	%i7,	%o3,	%o5
	tsubcc	%l1,	0x1E96,	%i6
	sll	%l6,	0x1A,	%i2
	subc	%i4,	0x182E,	%o0
	bge,a,pt	%icc,	loop_528
	st	%f16,	[%l7 + 0x48]
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l4
loop_528:
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f8
	fxtod	%f8,	%f24
	addccc	%l3,	0x172D,	%l5
	fmovdn	%xcc,	%f6,	%f22
	ble	loop_529
	bgu,a	%xcc,	loop_530
	srl	%o1,	%o4,	%o7
	edge16l	%i5,	%o2,	%g2
loop_529:
	edge16ln	%g5,	%l2,	%o6
loop_530:
	flush	%l7 + 0x60
	sdivx	%l0,	0x0F1B,	%i3
	tvs	%icc,	0x5
	sdiv	%g4,	0x0DFC,	%g7
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%g6
	set	0x3C, %l4
	stba	%i0,	[%l7 + %l4] 0x89
	sethi	0x0B45,	%g1
	srlx	%i1,	0x04,	%g3
	fmuld8ulx16	%f22,	%f19,	%f26
	add	%o3,	%i7,	%l1
	st	%f27,	[%l7 + 0x5C]
	bvs,a,pn	%xcc,	loop_531
	fmovdvc	%icc,	%f6,	%f6
	fnot2	%f18,	%f18
	array8	%o5,	%i6,	%i2
loop_531:
	fmul8x16al	%f3,	%f10,	%f2
	edge8n	%l6,	%o0,	%l4
	edge16n	%l3,	%i4,	%o1
	fbe,a	%fcc0,	loop_532
	fmovdgu	%icc,	%f5,	%f29
	orcc	%l5,	0x14F3,	%o7
	stx	%o4,	[%l7 + 0x48]
loop_532:
	nop
	set	0x4C, %i4
	lda	[%l7 + %i4] 0x04,	%f2
	fzero	%f8
	edge8l	%o2,	%g2,	%g5
	fmovrdlz	%i5,	%f30,	%f18
	membar	0x2B
	udivcc	%o6,	0x069C,	%l0
	fnands	%f19,	%f5,	%f15
	fzero	%f4
	fmul8ulx16	%f20,	%f4,	%f6
	brgz	%l2,	loop_533
	sdivcc	%g4,	0x15CA,	%i3
	movpos	%icc,	%g7,	%i0
	ta	%icc,	0x6
loop_533:
	udiv	%g1,	0x1D8C,	%g6
	array32	%i1,	%o3,	%i7
	fmovsle	%xcc,	%f15,	%f18
	fnand	%f4,	%f6,	%f4
	fbu,a	%fcc3,	loop_534
	taddcctv	%l1,	0x1A17,	%o5
	tvc	%icc,	0x4
	nop
	set	0x48, %g2
	ldd	[%l7 + %g2],	%f30
loop_534:
	faligndata	%f16,	%f28,	%f18
	udivcc	%i6,	0x1946,	%i2
	sub	%g3,	%l6,	%l4
	bg,a	%xcc,	loop_535
	lduh	[%l7 + 0x1E],	%l3
	nop
	setx	loop_536,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bpos,a,pn	%xcc,	loop_537
loop_535:
	movn	%icc,	%i4,	%o1
	edge32l	%o0,	%l5,	%o4
loop_536:
	membar	0x39
loop_537:
	edge16n	%o2,	%o7,	%g2
	fpack32	%f12,	%f8,	%f18
	sdivx	%i5,	0x016B,	%o6
	edge32l	%l0,	%g5,	%l2
	fpackfix	%f12,	%f16
	bneg,a	%xcc,	loop_538
	fmuld8ulx16	%f7,	%f9,	%f6
	bne,pn	%icc,	loop_539
	edge8n	%i3,	%g7,	%i0
loop_538:
	tcs	%xcc,	0x0
	nop
	set	0x10, %l0
	ldd	[%l7 + %l0],	%f30
loop_539:
	edge8n	%g1,	%g6,	%g4
	movcs	%icc,	%o3,	%i7
	fblg	%fcc0,	loop_540
	tpos	%xcc,	0x3
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x58] %asi,	%l1
loop_540:
	and	%o5,	0x035A,	%i1
	movn	%xcc,	%i6,	%i2
	fbug,a	%fcc1,	loop_541
	mova	%xcc,	%l6,	%g3
	smulcc	%l3,	%l4,	%o1
	stx	%o0,	[%l7 + 0x38]
loop_541:
	alignaddr	%l5,	%i4,	%o2
	nop
	setx	0xBFD0FEC1004FC83C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movn	%icc,	%o7,	%o4
	fnor	%f18,	%f4,	%f16
	edge32n	%g2,	%o6,	%i5
	fandnot2	%f18,	%f10,	%f4
	mulscc	%l0,	0x1F1B,	%l2
	addcc	%g5,	%g7,	%i3
	brlez	%i0,	loop_542
	bvc,pn	%icc,	loop_543
	fmovdgu	%xcc,	%f7,	%f30
	lduh	[%l7 + 0x5E],	%g6
loop_542:
	movre	%g4,	%g1,	%i7
loop_543:
	edge8	%o3,	%l1,	%o5
	movrlez	%i1,	0x352,	%i2
	stbar
	edge32ln	%l6,	%i6,	%l3
	or	%l4,	0x0AC6,	%g3
	smulcc	%o1,	0x0762,	%l5
	edge16	%i4,	%o0,	%o7
	fands	%f26,	%f16,	%f18
	fmul8ulx16	%f4,	%f12,	%f20
	nop
	setx	0x86661E1B48C46657,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f4
	tge	%icc,	0x7
	tvc	%xcc,	0x2
	smul	%o4,	%o2,	%o6
	move	%icc,	%g2,	%l0
	fnot1s	%f24,	%f8
	be,pt	%icc,	loop_544
	fpsub16s	%f21,	%f1,	%f28
	tge	%xcc,	0x3
	movge	%xcc,	%l2,	%g5
loop_544:
	andn	%g7,	%i3,	%i5
	fpsub32	%f8,	%f0,	%f6
	nop
	setx	0xC7F09AB1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x134C87B6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f4,	%f25
	fbe,a	%fcc3,	loop_545
	ld	[%l7 + 0x78],	%f5
	fmovrdlz	%g6,	%f22,	%f10
	edge32n	%i0,	%g4,	%g1
loop_545:
	edge8l	%o3,	%l1,	%i7
	udiv	%i1,	0x1E5C,	%o5
	edge8n	%l6,	%i6,	%i2
	move	%xcc,	%l3,	%g3
	orncc	%l4,	0x1574,	%o1
	bvs,a	%xcc,	loop_546
	fmul8x16al	%f27,	%f24,	%f4
	set	0x08, %g6
	prefetcha	[%l7 + %g6] 0x89,	 0x0
loop_546:
	movne	%xcc,	%o0,	%l5
	tleu	%icc,	0x1
	orcc	%o4,	0x10AD,	%o7
	alignaddrl	%o6,	%g2,	%l0
	fmovrde	%o2,	%f26,	%f28
	edge8n	%l2,	%g7,	%g5
	alignaddr	%i5,	%i3,	%g6
	sdivcc	%i0,	0x0A52,	%g4
	fblg	%fcc0,	loop_547
	movleu	%xcc,	%o3,	%l1
	edge8ln	%i7,	%g1,	%o5
	te	%xcc,	0x2
loop_547:
	andcc	%l6,	%i1,	%i6
	xnor	%i2,	0x1F17,	%l3
	fbn	%fcc1,	loop_548
	orn	%g3,	0x0EE9,	%o1
	brlez,a	%l4,	loop_549
	brnz,a	%o0,	loop_550
loop_548:
	movrlz	%l5,	0x30E,	%o4
	nop
	setx	loop_551,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_549:
	fmovdne	%icc,	%f4,	%f19
loop_550:
	movleu	%icc,	%i4,	%o7
	array16	%o6,	%g2,	%l0
loop_551:
	nop
	set	0x20, %o3
	swapa	[%l7 + %o3] 0x18,	%o2
	fbg,a	%fcc1,	loop_552
	movrgz	%g7,	%g5,	%l2
	fmovdg	%icc,	%f26,	%f19
	xorcc	%i3,	%i5,	%g6
loop_552:
	udivx	%i0,	0x14D1,	%g4
	sdiv	%o3,	0x0751,	%i7
	edge8ln	%l1,	%o5,	%l6
	mova	%icc,	%g1,	%i1
	fblg	%fcc2,	loop_553
	swap	[%l7 + 0x14],	%i2
	xnor	%i6,	%l3,	%g3
	movge	%icc,	%o1,	%o0
loop_553:
	taddcctv	%l5,	%o4,	%i4
	tsubcc	%o7,	0x1688,	%l4
	edge8l	%o6,	%g2,	%l0
	movcs	%icc,	%g7,	%o2
	move	%xcc,	%l2,	%i3
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x40] %asi,	%f15
	fpsub16s	%f8,	%f30,	%f20
	sdivcc	%i5,	0x1C93,	%g6
	xnorcc	%i0,	0x1022,	%g5
	fbn	%fcc2,	loop_554
	bn,pt	%xcc,	loop_555
	ldx	[%l7 + 0x20],	%g4
	sllx	%i7,	%o3,	%l1
loop_554:
	subc	%l6,	0x00A7,	%g1
loop_555:
	nop
	setx loop_556, %l0, %l1
	jmpl %l1, %o5
	umulcc	%i1,	%i2,	%i6
	ldsh	[%l7 + 0x32],	%g3
	movrgz	%l3,	0x340,	%o1
loop_556:
	array8	%l5,	%o4,	%i4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x77] %asi,	%o7
	movrgz	%o0,	0x239,	%l4
	fbu	%fcc2,	loop_557
	orcc	%o6,	0x113E,	%g2
	brz	%l0,	loop_558
	brnz	%g7,	loop_559
loop_557:
	brgez	%o2,	loop_560
	bcs	%xcc,	loop_561
loop_558:
	fbne	%fcc2,	loop_562
loop_559:
	bleu	loop_563
loop_560:
	nop
	setx	0x28C36ED5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x89B6B13F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f14,	%f2
loop_561:
	xnor	%i3,	%i5,	%g6
loop_562:
	be,a	loop_564
loop_563:
	fmovspos	%xcc,	%f17,	%f20
	edge8l	%i0,	%g5,	%l2
	orncc	%i7,	0x1B67,	%o3
loop_564:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a,pn	%icc,	loop_565
	movrgez	%g4,	0x155,	%l6
	nop
	setx	0x0AE36DFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x7D406732,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f18,	%f30
	subccc	%g1,	0x0C16,	%o5
loop_565:
	movrne	%i1,	0x266,	%l1
	lduh	[%l7 + 0x3A],	%i2
	fbu	%fcc3,	loop_566
	bneg,a,pt	%icc,	loop_567
	taddcc	%i6,	0x1908,	%g3
	umul	%o1,	%l5,	%l3
loop_566:
	ba,pt	%xcc,	loop_568
loop_567:
	nop
	setx	0x92E1A8B1204ABFE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	ldsh	[%l7 + 0x2E],	%i4
	mulx	%o7,	0x1102,	%o4
loop_568:
	tgu	%icc,	0x4
	tvc	%xcc,	0x3
	fmovsn	%icc,	%f3,	%f7
	alignaddr	%o0,	%l4,	%o6
	edge32	%g2,	%l0,	%o2
	sub	%i3,	%i5,	%g7
	sethi	0x0692,	%g6
	edge16n	%g5,	%i0,	%i7
	bcs	loop_569
	fbule,a	%fcc1,	loop_570
	fsrc2s	%f3,	%f11
	udivcc	%o3,	0x0C2F,	%l2
loop_569:
	tsubcctv	%l6,	%g1,	%g4
loop_570:
	taddcctv	%i1,	0x0A0A,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i2,	%o5,	%g3
	alignaddrl	%o1,	%l5,	%l3
	edge8ln	%i6,	%o7,	%i4
	tge	%xcc,	0x2
	fcmpgt32	%f6,	%f16,	%o0
	nop
	setx	0xEFCD4A04,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xF6E9500B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f10,	%f6
	edge16l	%l4,	%o6,	%g2
	fmovscs	%xcc,	%f25,	%f3
	array32	%l0,	%o2,	%o4
	mova	%icc,	%i5,	%i3
	wr	%g0,	0xea,	%asi
	stba	%g7,	[%l7 + 0x0E] %asi
	membar	#Sync
	tpos	%xcc,	0x0
	edge8ln	%g5,	%g6,	%i0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x89,	%i7,	%l2
	stb	%l6,	[%l7 + 0x2D]
	swap	[%l7 + 0x68],	%g1
	smulcc	%g4,	0x0046,	%o3
	xorcc	%l1,	0x01E4,	%i1
	udivcc	%o5,	0x0C9F,	%g3
	fbu	%fcc0,	loop_571
	popc	0x1FC8,	%o1
	taddcc	%l5,	0x02A2,	%l3
	andn	%i2,	%i6,	%i4
loop_571:
	fandnot1	%f20,	%f8,	%f4
	movle	%icc,	%o0,	%o7
	tcs	%icc,	0x7
	nop
	setx	0x1074A652,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	tg	%xcc,	0x2
	alignaddrl	%o6,	%l4,	%l0
	sdivx	%o2,	0x1BFA,	%g2
	set	0x78, %g4
	stxa	%i5,	[%l7 + %g4] 0x22
	membar	#Sync
	tn	%icc,	0x1
	array8	%i3,	%o4,	%g7
	edge16n	%g6,	%i0,	%g5
	pdist	%f8,	%f0,	%f26
	movpos	%icc,	%i7,	%l6
	movl	%xcc,	%g1,	%g4
	set	0x54, %g7
	ldswa	[%l7 + %g7] 0x04,	%l2
	sir	0x0BB3
	fnors	%f1,	%f31,	%f22
	move	%xcc,	%l1,	%i1
	set	0x42, %i6
	ldstuba	[%l7 + %i6] 0x89,	%o3
	movrgez	%o5,	%o1,	%l5
	tn	%icc,	0x7
	movcc	%icc,	%l3,	%i2
	sllx	%i6,	%g3,	%o0
	fbe,a	%fcc1,	loop_572
	andn	%i4,	0x0E04,	%o6
	bneg,pn	%icc,	loop_573
	call	loop_574
loop_572:
	bcc,pn	%xcc,	loop_575
	tge	%xcc,	0x7
loop_573:
	movcc	%xcc,	%l4,	%l0
loop_574:
	sll	%o2,	%g2,	%o7
loop_575:
	tsubcctv	%i3,	0x0DB6,	%o4
	bg,pt	%xcc,	loop_576
	array16	%g7,	%g6,	%i5
	subcc	%g5,	%i0,	%l6
	fnegd	%f8,	%f26
loop_576:
	bge,a,pt	%xcc,	loop_577
	orncc	%i7,	0x191B,	%g4
	movcs	%icc,	%g1,	%l2
	udiv	%l1,	0x0047,	%i1
loop_577:
	fbge,a	%fcc0,	loop_578
	orncc	%o5,	%o1,	%l5
	umulcc	%l3,	0x0BE3,	%o3
	movleu	%xcc,	%i6,	%i2
loop_578:
	call	loop_579
	or	%o0,	%g3,	%i4
	fmovsa	%icc,	%f30,	%f1
	addccc	%o6,	%l0,	%o2
loop_579:
	fmovdcc	%icc,	%f17,	%f8
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%o7
	edge8ln	%l4,	%o4,	%i3
	fmovd	%f0,	%f22
	fpack16	%f30,	%f10
	stx	%g7,	[%l7 + 0x18]
	srl	%g6,	0x11,	%g5
	smul	%i5,	0x076C,	%l6
	std	%f10,	[%l7 + 0x70]
	movpos	%xcc,	%i7,	%i0
	fmovrslez	%g1,	%f31,	%f1
	fxor	%f2,	%f20,	%f4
	tge	%icc,	0x0
	subccc	%l2,	%g4,	%l1
	xnorcc	%i1,	0x0F0A,	%o5
	andcc	%o1,	0x1649,	%l5
	ta	%icc,	0x3
	and	%l3,	0x0A40,	%i6
	orn	%o3,	0x0445,	%o0
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f28
	fxtod	%f28,	%f4
	subcc	%g3,	0x182B,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i4,	%o6,	%o2
	fzero	%f26
	fornot2s	%f0,	%f28,	%f17
	fmovsgu	%icc,	%f3,	%f20
	movre	%g2,	0x3D1,	%o7
	tge	%xcc,	0x7
	smulcc	%l4,	0x0F7C,	%o4
	tsubcc	%l0,	%i3,	%g7
	tleu	%icc,	0x5
	tcs	%icc,	0x4
	alignaddr	%g6,	%g5,	%l6
	tvs	%xcc,	0x4
	array16	%i5,	%i0,	%g1
	tvs	%icc,	0x0
	tcc	%icc,	0x3
	taddcctv	%i7,	0x14FD,	%l2
	bvs,a	%icc,	loop_580
	addcc	%g4,	%i1,	%o5
	addccc	%l1,	0x176A,	%l5
	movrgez	%o1,	0x317,	%i6
loop_580:
	st	%f14,	[%l7 + 0x38]
	edge32	%o3,	%o0,	%g3
	fmovsn	%xcc,	%f0,	%f19
	faligndata	%f14,	%f10,	%f22
	nop
	set	0x26, %l2
	ldsh	[%l7 + %l2],	%i2
	fmovrsgz	%l3,	%f24,	%f17
	xnorcc	%i4,	0x16E7,	%o2
	fmovsn	%xcc,	%f27,	%f1
	popc	%g2,	%o7
	fbue	%fcc1,	loop_581
	andcc	%o6,	0x0927,	%o4
	orncc	%l4,	0x066A,	%i3
	edge16ln	%g7,	%l0,	%g6
loop_581:
	movrgz	%l6,	%g5,	%i0
	sllx	%i5,	%i7,	%l2
	set	0x1C, %i0
	lda	[%l7 + %i0] 0x0c,	%f8
	tgu	%xcc,	0x7
	bgu,a,pn	%xcc,	loop_582
	tvs	%icc,	0x0
	sllx	%g4,	0x02,	%i1
	tsubcc	%o5,	%l1,	%l5
loop_582:
	movcs	%icc,	%g1,	%i6
	edge32n	%o1,	%o3,	%o0
	tpos	%icc,	0x7
	nop
	fitod	%f2,	%f28
	fdtos	%f28,	%f26
	fsrc1	%f20,	%f22
	fmovsg	%icc,	%f15,	%f20
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf8,	%f16
	movle	%xcc,	%i2,	%l3
	fmovsl	%icc,	%f14,	%f22
	tl	%icc,	0x5
	edge8l	%g3,	%i4,	%o2
	fmovrdne	%o7,	%f20,	%f30
	tcc	%icc,	0x6
	subcc	%o6,	0x1E31,	%g2
	sdivcc	%o4,	0x1DB4,	%i3
	fmovrdgez	%l4,	%f4,	%f22
	te	%icc,	0x6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l0,	%g7
	stb	%g6,	[%l7 + 0x68]
	bne,pn	%icc,	loop_583
	sethi	0x0374,	%g5
	sir	0x1742
	fba,a	%fcc2,	loop_584
loop_583:
	bne	loop_585
	nop
	setx	loop_586,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%xcc,	0x3
loop_584:
	movre	%i0,	%i5,	%i7
loop_585:
	tsubcc	%l2,	0x1850,	%g4
loop_586:
	fandnot2s	%f26,	%f24,	%f31
	array8	%i1,	%l6,	%o5
	smul	%l1,	0x03ED,	%g1
	udiv	%l5,	0x04DD,	%i6
	array32	%o1,	%o0,	%o3
	movvs	%xcc,	%l3,	%g3
	set	0x60, %l6
	ldswa	[%l7 + %l6] 0x15,	%i2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o2,	%o7
	tle	%icc,	0x0
	membar	0x1B
	movle	%xcc,	%i4,	%g2
	sir	0x11D4
	movl	%xcc,	%o4,	%o6
	bvs	%icc,	loop_587
	brlz,a	%l4,	loop_588
	edge32ln	%l0,	%i3,	%g6
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%g5
loop_587:
	fmovs	%f17,	%f2
loop_588:
	nop
	fitos	%f10,	%f6
	fstoi	%f6,	%f30
	ba,pn	%xcc,	loop_589
	fmovrdgez	%i0,	%f26,	%f6
	fmovdleu	%icc,	%f28,	%f25
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f8
loop_589:
	mulx	%g7,	0x19E3,	%i5
	ldsh	[%l7 + 0x34],	%l2
	edge32l	%g4,	%i1,	%i7
	movvs	%xcc,	%o5,	%l6
	fmovdvc	%icc,	%f20,	%f14
	tne	%xcc,	0x2
	fmovsvs	%xcc,	%f29,	%f27
	xnor	%l1,	%l5,	%i6
	mulx	%g1,	0x01EB,	%o0
	ldsh	[%l7 + 0x26],	%o3
	wr	%g0,	0x2b,	%asi
	stha	%l3,	[%l7 + 0x6A] %asi
	membar	#Sync
	movn	%xcc,	%g3,	%i2
	srax	%o1,	%o2,	%o7
	move	%icc,	%i4,	%o4
	fnot2	%f16,	%f4
	umulcc	%o6,	%g2,	%l0
	fbue	%fcc0,	loop_590
	array16	%l4,	%g6,	%g5
	movneg	%icc,	%i0,	%i3
	lduh	[%l7 + 0x70],	%g7
loop_590:
	sdivcc	%i5,	0x0090,	%g4
	fbne,a	%fcc1,	loop_591
	mulscc	%i1,	%i7,	%l2
	add	%l6,	%l1,	%l5
	edge8	%i6,	%g1,	%o5
loop_591:
	fsrc1	%f2,	%f18
	movrne	%o3,	0x1C6,	%l3
	nop
	fitos	%f13,	%f15
	fstod	%f15,	%f12
	movrgz	%g3,	%o0,	%i2
	movneg	%xcc,	%o2,	%o7
	orncc	%o1,	%i4,	%o4
	fmuld8sux16	%f19,	%f4,	%f22
	brz	%o6,	loop_592
	fmovdleu	%xcc,	%f29,	%f26
	subc	%g2,	0x1D7A,	%l4
	movvc	%icc,	%g6,	%g5
loop_592:
	fabsd	%f6,	%f8
	srax	%l0,	0x10,	%i0
	fmovrdlez	%i3,	%f0,	%f6
	call	loop_593
	nop
	setx	0xBDB43805,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xFDD47698,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f17,	%f1
	stbar
	membar	0x5B
loop_593:
	fcmpgt16	%f8,	%f8,	%g7
	movrgez	%g4,	0x3EA,	%i5
	edge16	%i7,	%i1,	%l2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	movcc	%icc,	%l5,	%l1
	movne	%xcc,	%g1,	%o5
	fzeros	%f22
	movleu	%icc,	%o3,	%l3
	sir	0x14A7
	fornot1	%f22,	%f28,	%f6
	array32	%g3,	%o0,	%i6
	bvc	%icc,	loop_594
	movpos	%xcc,	%i2,	%o2
	ldx	[%l7 + 0x10],	%o7
	umulcc	%o1,	%i4,	%o6
loop_594:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	array16	%g2,	%l4,	%g6
	fmovspos	%xcc,	%f25,	%f4
	brgez	%g5,	loop_595
	movg	%xcc,	%l0,	%o4
	sdivx	%i0,	0x0F85,	%i3
	ldsw	[%l7 + 0x44],	%g7
loop_595:
	edge8n	%g4,	%i7,	%i1
	fmovdcc	%icc,	%f15,	%f28
	fmovd	%f6,	%f16
	movg	%xcc,	%i5,	%l2
	tle	%icc,	0x2
	fandnot1	%f8,	%f6,	%f18
	addcc	%l5,	%l6,	%l1
	set	0x67, %i1
	ldsba	[%l7 + %i1] 0x19,	%o5
	std	%f10,	[%l7 + 0x60]
	brz	%o3,	loop_596
	array32	%g1,	%g3,	%l3
	tge	%icc,	0x6
	nop
	setx	0xF92A6BE488835A7E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x9119A9C65A578774,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f26,	%f20
loop_596:
	tn	%icc,	0x7
	srlx	%i6,	%i2,	%o0
	tneg	%icc,	0x7
	bvc,a,pt	%xcc,	loop_597
	st	%f7,	[%l7 + 0x5C]
	tcs	%icc,	0x5
	wr	%g0,	0x2f,	%asi
	stwa	%o2,	[%l7 + 0x14] %asi
	membar	#Sync
loop_597:
	andn	%o1,	%i4,	%o6
	fabss	%f21,	%f4
	bl,pt	%icc,	loop_598
	stx	%g2,	[%l7 + 0x60]
	stb	%l4,	[%l7 + 0x4B]
	ta	%xcc,	0x2
loop_598:
	sub	%o7,	%g6,	%g5
	movleu	%xcc,	%o4,	%i0
	movrne	%i3,	0x316,	%l0
	fabsd	%f30,	%f8
	movrlz	%g7,	%i7,	%i1
	nop
	setx	0x9A1AB828851B7A83,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x6A405493D679002D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f30,	%f12
	ldd	[%l7 + 0x30],	%f22
	taddcctv	%g4,	0x1F28,	%l2
	brlez	%l5,	loop_599
	nop
	setx	0x5E1F1389,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x7FC9BF2C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f16,	%f31
	subccc	%l6,	0x0AB2,	%l1
	brgez	%o5,	loop_600
loop_599:
	for	%f20,	%f10,	%f20
	orncc	%i5,	0x0A47,	%o3
	udivx	%g3,	0x08E9,	%l3
loop_600:
	xnor	%i6,	0x0D61,	%i2
	orncc	%g1,	%o0,	%o2
	and	%i4,	%o1,	%g2
	edge8l	%o6,	%o7,	%l4
	sdiv	%g5,	0x1B36,	%g6
	fmovrdgz	%i0,	%f24,	%f24
	fbne	%fcc3,	loop_601
	stw	%o4,	[%l7 + 0x14]
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_601:
	edge16ln	%i3,	%g7,	%i7
	alignaddrl	%i1,	%l0,	%g4
	edge8	%l5,	%l6,	%l2
	fnors	%f25,	%f12,	%f15
	taddcc	%o5,	%i5,	%l1
	smulcc	%o3,	%g3,	%i6
	brz	%l3,	loop_602
	movcc	%icc,	%g1,	%o0
	fmovdvc	%xcc,	%f21,	%f22
	fmovsleu	%xcc,	%f1,	%f15
loop_602:
	move	%xcc,	%i2,	%i4
	tneg	%icc,	0x7
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
	sir	0x1087
	fbn	%fcc0,	loop_603
	prefetch	[%l7 + 0x6C],	 0x2
	mulx	%g2,	0x15FD,	%o6
	sdiv	%o7,	0x1C54,	%o2
loop_603:
	nop
	setx	0xCBD323A2405C6D7E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movne	%icc,	%g5,	%l4
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x0E] %asi,	%g6
	andcc	%i0,	0x17BA,	%o4
	tcs	%xcc,	0x2
	fmovrse	%i3,	%f2,	%f10
	xorcc	%i7,	0x1A06,	%i1
	smul	%g7,	0x0A29,	%l0
	fmovsgu	%xcc,	%f31,	%f17
	fmul8sux16	%f26,	%f30,	%f8
	call	loop_604
	nop
	setx	loop_605,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%icc,	0x0
	wr	%g0,	0x18,	%asi
	stba	%g4,	[%l7 + 0x7B] %asi
loop_604:
	tne	%xcc,	0x2
loop_605:
	fbe	%fcc2,	loop_606
	tneg	%icc,	0x3
	tcs	%icc,	0x0
	nop
	setx	0x4D1D4E95829265D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xF968BE40FC952647,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f14,	%f8
loop_606:
	edge16l	%l5,	%l6,	%l2
	movcs	%xcc,	%o5,	%l1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f26
	tl	%xcc,	0x4
	udivx	%i5,	0x0F6A,	%g3
	fblg	%fcc3,	loop_607
	mova	%xcc,	%i6,	%o3
	move	%icc,	%g1,	%l3
	movl	%xcc,	%o0,	%i4
loop_607:
	tgu	%xcc,	0x2
	andcc	%i2,	0x1462,	%o1
	flush	%l7 + 0x48
	subc	%g2,	%o6,	%o2
	movneg	%icc,	%o7,	%l4
	movneg	%xcc,	%g6,	%i0
	set	0x30, %o7
	sta	%f28,	[%l7 + %o7] 0x19
	fnot1	%f12,	%f16
	movleu	%xcc,	%o4,	%g5
	udivx	%i3,	0x0F77,	%i7
	xnor	%g7,	%l0,	%i1
	mulscc	%g4,	0x0796,	%l5
	edge16l	%l6,	%o5,	%l2
	bcs,a	%icc,	loop_608
	fmovd	%f12,	%f30
	fbne	%fcc3,	loop_609
	faligndata	%f12,	%f22,	%f4
loop_608:
	ldx	[%l7 + 0x30],	%l1
	fpadd16s	%f16,	%f30,	%f12
loop_609:
	umulcc	%g3,	0x1F34,	%i5
	nop
	fitos	%f5,	%f5
	fstox	%f5,	%f6
	fxtos	%f6,	%f30
	bg,pt	%icc,	loop_610
	movrgez	%o3,	0x02C,	%g1
	fmovdcc	%xcc,	%f27,	%f30
	fabsd	%f22,	%f12
loop_610:
	xnor	%l3,	%o0,	%i6
	fpadd16	%f10,	%f16,	%f6
	edge16n	%i2,	%i4,	%g2
	taddcctv	%o6,	0x1908,	%o2
	nop
	fitos	%f6,	%f20
	fstox	%f20,	%f20
	brlez,a	%o1,	loop_611
	orcc	%l4,	0x1E1B,	%o7
	tcs	%icc,	0x7
	fpadd32	%f24,	%f18,	%f26
loop_611:
	nop
	setx	0x87547FD6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xFA01FAF4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f6,	%f18
	fmovd	%f20,	%f4
	tle	%xcc,	0x1
	movleu	%icc,	%i0,	%o4
	brlez,a	%g5,	loop_612
	fmovrdlez	%g6,	%f26,	%f18
	edge32n	%i3,	%g7,	%l0
	nop
	set	0x54, %i5
	ldsh	[%l7 + %i5],	%i7
loop_612:
	edge32n	%i1,	%l5,	%l6
	tcs	%icc,	0x4
	fbule,a	%fcc1,	loop_613
	movrgz	%o5,	%g4,	%l2
	subccc	%l1,	0x09A7,	%g3
	mulscc	%i5,	%g1,	%l3
loop_613:
	fmul8x16au	%f19,	%f31,	%f8
	fmovrsne	%o3,	%f10,	%f11
	fmovrsgz	%i6,	%f2,	%f20
	bvs,pt	%xcc,	loop_614
	alignaddrl	%o0,	%i4,	%g2
	tsubcctv	%o6,	%i2,	%o2
	movne	%xcc,	%o1,	%o7
loop_614:
	taddcc	%i0,	0x1DA8,	%l4
	tcc	%xcc,	0x1
	array32	%g5,	%o4,	%i3
	movcc	%xcc,	%g7,	%g6
	movvs	%icc,	%i7,	%l0
	edge16n	%i1,	%l6,	%o5
	edge32	%l5,	%l2,	%g4
	subcc	%l1,	0x1643,	%g3
	bleu	%xcc,	loop_615
	movne	%xcc,	%i5,	%l3
	brz,a	%g1,	loop_616
	fone	%f14
loop_615:
	stx	%o3,	[%l7 + 0x60]
	edge8	%o0,	%i6,	%i4
loop_616:
	orncc	%o6,	%i2,	%g2
	fmovdn	%icc,	%f9,	%f13
	set	0x48, %g3
	ldstuba	[%l7 + %g3] 0x18,	%o1
	movpos	%xcc,	%o2,	%i0
	tl	%xcc,	0x4
	tneg	%xcc,	0x2
	umulcc	%l4,	0x1FF8,	%g5
	st	%f7,	[%l7 + 0x70]
	edge16	%o7,	%o4,	%i3
	sll	%g6,	0x1B,	%g7
	tge	%xcc,	0x1
	movvs	%xcc,	%l0,	%i1
	srl	%l6,	0x06,	%i7
	movcs	%xcc,	%l5,	%l2
	fmovdcs	%xcc,	%f21,	%f14
	tg	%xcc,	0x6
	movvs	%xcc,	%g4,	%o5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x4B] %asi,	%l1
	edge32	%g3,	%l3,	%i5
	movvc	%icc,	%o3,	%o0
	fpackfix	%f2,	%f4
	ta	%icc,	0x5
	movneg	%icc,	%i6,	%g1
	sub	%o6,	0x1B7F,	%i2
	andcc	%g2,	%o1,	%i4
	set	0x48, %o6
	lduha	[%l7 + %o6] 0x81,	%o2
	movrlz	%l4,	%i0,	%o7
	tle	%icc,	0x4
	sub	%g5,	0x11E3,	%i3
	srl	%o4,	0x13,	%g6
	te	%icc,	0x6
	fmovsvs	%xcc,	%f21,	%f12
	stx	%l0,	[%l7 + 0x68]
	fmovspos	%xcc,	%f17,	%f25
	fmovsgu	%icc,	%f15,	%f16
	edge32ln	%i1,	%g7,	%l6
	sdivx	%i7,	0x1078,	%l5
	tge	%xcc,	0x4
	tcs	%icc,	0x4
	movl	%xcc,	%l2,	%o5
	edge32	%l1,	%g4,	%l3
	orcc	%g3,	%o3,	%i5
	movneg	%icc,	%o0,	%g1
	orncc	%o6,	0x012E,	%i2
	orncc	%i6,	%g2,	%o1
	movleu	%icc,	%i4,	%l4
	xor	%o2,	0x16C7,	%o7
	fmovdg	%icc,	%f23,	%f5
	sll	%i0,	0x06,	%i3
	fpack16	%f26,	%f25
	edge8ln	%g5,	%g6,	%o4
	movcc	%icc,	%i1,	%g7
	fmul8ulx16	%f20,	%f2,	%f14
	tcc	%xcc,	0x0
	udivcc	%l0,	0x016A,	%i7
	taddcctv	%l5,	0x179F,	%l2
	edge8n	%o5,	%l6,	%l1
	subcc	%g4,	0x1DCC,	%l3
	set	0x60, %o1
	prefetcha	[%l7 + %o1] 0x88,	 0x3
	bl,a,pn	%icc,	loop_617
	sllx	%g3,	0x02,	%i5
	edge8n	%g1,	%o0,	%o6
	movgu	%xcc,	%i6,	%g2
loop_617:
	udivx	%i2,	0x0D4C,	%o1
	movl	%icc,	%i4,	%l4
	mova	%xcc,	%o2,	%i0
	bcc,a,pn	%xcc,	loop_618
	xor	%o7,	%g5,	%g6
	set	0x1C, %i7
	stwa	%o4,	[%l7 + %i7] 0x81
loop_618:
	fmovrslez	%i3,	%f5,	%f1
	smulcc	%g7,	0x17BF,	%l0
	bn,pt	%xcc,	loop_619
	fmovrde	%i1,	%f24,	%f26
	nop
	setx loop_620, %l0, %l1
	jmpl %l1, %i7
	fmovdcs	%icc,	%f18,	%f23
loop_619:
	array8	%l2,	%o5,	%l6
	ldub	[%l7 + 0x6F],	%l5
loop_620:
	addc	%g4,	%l1,	%o3
	addcc	%l3,	0x0805,	%i5
	brlz,a	%g1,	loop_621
	stbar
	mova	%icc,	%o0,	%g3
	movle	%icc,	%i6,	%o6
loop_621:
	fbuge	%fcc3,	loop_622
	and	%i2,	0x05CA,	%o1
	movpos	%xcc,	%i4,	%g2
	taddcc	%o2,	0x05A7,	%i0
loop_622:
	fmovrdgez	%o7,	%f22,	%f6
	sth	%l4,	[%l7 + 0x20]
	fmovsle	%xcc,	%f31,	%f14
	set	0x47, %o2
	ldstuba	[%l7 + %o2] 0x80,	%g6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x1F] %asi,	%g5
	fmovrsgez	%o4,	%f11,	%f23
	fmul8sux16	%f18,	%f30,	%f28
	umul	%i3,	0x1469,	%g7
	nop
	setx	loop_623,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	prefetch	[%l7 + 0x64],	 0x2
	nop
	fitod	%f26,	%f28
	fbo,a	%fcc3,	loop_624
loop_623:
	fmovdcs	%xcc,	%f11,	%f13
	fzero	%f2
	addcc	%l0,	0x009D,	%i1
loop_624:
	xnorcc	%l2,	%i7,	%l6
	stw	%o5,	[%l7 + 0x5C]
	fbue	%fcc2,	loop_625
	alignaddr	%l5,	%g4,	%o3
	nop
	setx	0x15B45799,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x8F9E493C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f30,	%f11
	ldx	[%l7 + 0x68],	%l3
loop_625:
	sir	0x0E2A
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x1C, %g1
	ldsba	[%l7 + %g1] 0x18,	%i5
	xnor	%l1,	%o0,	%g1
	brlez,a	%i6,	loop_626
	taddcctv	%g3,	0x0EF3,	%o6
	tcs	%xcc,	0x6
	fandnot2s	%f7,	%f9,	%f20
loop_626:
	nop
	setx	0x9D35632296CECFBC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x674257F466CEE859,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f8,	%f30
	movrgez	%i2,	0x2BA,	%i4
	fmovsl	%icc,	%f19,	%f6
	ldub	[%l7 + 0x34],	%o1
	sra	%g2,	%o2,	%i0
	srl	%l4,	%g6,	%g5
	fmovdn	%xcc,	%f8,	%f10
	tg	%xcc,	0x4
	taddcctv	%o4,	0x1EE5,	%o7
	fmovsvs	%xcc,	%f17,	%f25
	andcc	%i3,	0x0F0B,	%l0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%i1
	tsubcc	%l2,	%i7,	%o5
	move	%icc,	%l6,	%l5
	fnegd	%f6,	%f24
	std	%f12,	[%l7 + 0x18]
	fbl,a	%fcc0,	loop_627
	edge8n	%g4,	%o3,	%i5
	edge32	%l1,	%o0,	%l3
	movne	%xcc,	%i6,	%g1
loop_627:
	ldsb	[%l7 + 0x4E],	%g3
	array8	%o6,	%i4,	%i2
	andcc	%g2,	0x188D,	%o1
	movrlz	%i0,	%o2,	%l4
	movre	%g6,	%o4,	%o7
	ldub	[%l7 + 0x08],	%g5
	fxor	%f12,	%f4,	%f0
	movvc	%icc,	%l0,	%g7
	xor	%i1,	%l2,	%i3
	orcc	%i7,	0x0017,	%l6
	tn	%xcc,	0x0
	movrlz	%o5,	%g4,	%o3
	array16	%l5,	%l1,	%o0
	stx	%i5,	[%l7 + 0x68]
	nop
	setx	loop_628,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tle	%icc,	0x6
	movge	%xcc,	%i6,	%l3
	set	0x38, %i3
	ldxa	[%g0 + %i3] 0x20,	%g1
loop_628:
	sethi	0x0DF2,	%g3
	sdivx	%o6,	0x1449,	%i4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x5E] %asi,	%g2
	movrne	%i2,	%i0,	%o2
	tg	%icc,	0x0
	nop
	fitos	%f10,	%f22
	fstoi	%f22,	%f2
	be,a	loop_629
	fmul8ulx16	%f8,	%f24,	%f10
	fbo	%fcc2,	loop_630
	movg	%xcc,	%l4,	%o1
loop_629:
	ldd	[%l7 + 0x70],	%g6
	addccc	%o7,	%o4,	%l0
loop_630:
	popc	%g7,	%i1
	ta	%xcc,	0x1
	udivx	%g5,	0x045B,	%l2
	tge	%icc,	0x3
	edge32l	%i3,	%i7,	%o5
	tvc	%icc,	0x5
	addccc	%g4,	%o3,	%l5
	fnot1	%f24,	%f18
	tle	%icc,	0x3
	sra	%l1,	0x17,	%o0
	fabss	%f10,	%f14
	xnor	%l6,	%i6,	%l3
	array32	%i5,	%g1,	%g3
	bvs,pn	%icc,	loop_631
	tl	%icc,	0x7
	bvs	%xcc,	loop_632
	tcc	%icc,	0x1
loop_631:
	sll	%o6,	%g2,	%i2
	tsubcctv	%i4,	0x0104,	%o2
loop_632:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x0c,	%l4,	%o1
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x36] %asi,	%i0
	fmovdneg	%xcc,	%f17,	%f24
	edge16n	%o7,	%o4,	%l0
	nop
	setx	0x961CC482,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x5E9A7F07,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f20,	%f26
	fcmpgt32	%f22,	%f26,	%g7
	movcc	%xcc,	%g6,	%g5
	udivx	%i1,	0x0A56,	%l2
	addccc	%i3,	%i7,	%g4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x1C] %asi,	%o3
	nop
	setx	loop_633,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%icc,	0x1
	bn,pt	%icc,	loop_634
	for	%f2,	%f20,	%f4
loop_633:
	movrne	%o5,	%l5,	%l1
	nop
	setx	0xE57757A4A8D81200,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xC73B5E44B22E8121,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f16,	%f4
loop_634:
	tn	%xcc,	0x2
	set	0x20, %l5
	lduwa	[%l7 + %l5] 0x89,	%l6
	tcc	%xcc,	0x3
	movrlez	%i6,	%l3,	%o0
	fbo	%fcc0,	loop_635
	tneg	%xcc,	0x2
	nop
	setx	0x3F279160,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x42DF049D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f24,	%f18
	fbn	%fcc1,	loop_636
loop_635:
	sir	0x1B9A
	bcc,pn	%xcc,	loop_637
	fble	%fcc3,	loop_638
loop_636:
	tne	%icc,	0x1
	edge8n	%i5,	%g1,	%o6
loop_637:
	alignaddrl	%g2,	%i2,	%g3
loop_638:
	tleu	%xcc,	0x2
	brgez	%i4,	loop_639
	tpos	%icc,	0x7
	te	%icc,	0x6
	sra	%l4,	0x13,	%o2
loop_639:
	fbe,a	%fcc3,	loop_640
	te	%icc,	0x3
	srlx	%i0,	0x19,	%o1
	andncc	%o7,	%l0,	%o4
loop_640:
	bshuffle	%f28,	%f12,	%f26
	fxor	%f22,	%f16,	%f12
	srl	%g6,	0x14,	%g7
	movleu	%xcc,	%g5,	%i1
	udiv	%i3,	0x163D,	%i7
	fbe	%fcc0,	loop_641
	movvc	%icc,	%l2,	%o3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x54] %asi,	%g4
loop_641:
	tleu	%icc,	0x3
	movn	%icc,	%l5,	%o5
	tvc	%xcc,	0x0
	fsrc1	%f14,	%f4
	ldsb	[%l7 + 0x58],	%l1
	fexpand	%f6,	%f14
	fnand	%f12,	%f20,	%f14
	movne	%xcc,	%l6,	%l3
	te	%icc,	0x4
	edge8ln	%o0,	%i5,	%g1
	set	0x20, %l3
	ldswa	[%l7 + %l3] 0x11,	%o6
	edge8l	%g2,	%i2,	%i6
	nop
	fitod	%f28,	%f18
	call	loop_642
	sdivx	%i4,	0x1368,	%g3
	brlez,a	%l4,	loop_643
	fbn	%fcc0,	loop_644
loop_642:
	edge8n	%o2,	%o1,	%i0
	movl	%xcc,	%o7,	%l0
loop_643:
	tsubcc	%o4,	0x081A,	%g6
loop_644:
	brgz,a	%g7,	loop_645
	movrgz	%g5,	0x02B,	%i3
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%i7
loop_645:
	fmovrsgez	%l2,	%f29,	%f12
	fxor	%f26,	%f0,	%f22
	movrlz	%i1,	0x0BF,	%g4
	fmuld8sux16	%f13,	%f19,	%f12
	subccc	%l5,	0x0544,	%o5
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%l1
	lduw	[%l7 + 0x30],	%o3
	addccc	%l3,	%o0,	%l6
	nop
	setx	0x91BD1BC0404D9CEE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	ble	loop_646
	fbule,a	%fcc3,	loop_647
	edge8n	%i5,	%g1,	%g2
	or	%i2,	0x07FB,	%i6
loop_646:
	ldd	[%l7 + 0x68],	%f18
loop_647:
	nop
	setx	loop_648,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsh	[%l7 + 0x1C],	%i4
	mova	%xcc,	%g3,	%l4
	edge8	%o6,	%o1,	%i0
loop_648:
	fcmple32	%f30,	%f0,	%o2
	bvc,pn	%xcc,	loop_649
	te	%xcc,	0x3
	tleu	%icc,	0x7
	tsubcctv	%o7,	%o4,	%g6
loop_649:
	fmovdle	%icc,	%f25,	%f1
	movn	%xcc,	%l0,	%g7
	call	loop_650
	lduw	[%l7 + 0x18],	%i3
	bcc,a,pn	%xcc,	loop_651
	fpadd32	%f18,	%f16,	%f30
loop_650:
	movcc	%icc,	%i7,	%l2
	fmovrde	%g5,	%f10,	%f10
loop_651:
	movrlez	%i1,	0x00F,	%l5
	fmovsne	%xcc,	%f29,	%f1
	fmovdcc	%icc,	%f4,	%f23
	edge32n	%g4,	%o5,	%l1
	xnor	%l3,	%o3,	%o0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l6,	%g1
	sdiv	%i5,	0x172A,	%g2
	stbar
	alignaddrl	%i2,	%i4,	%i6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l4,	%o6
	subccc	%o1,	%i0,	%g3
	orncc	%o2,	%o7,	%o4
	edge32	%l0,	%g6,	%g7
	fmovrsgz	%i3,	%f8,	%f28
	fcmpne32	%f0,	%f10,	%l2
	movvc	%icc,	%g5,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%l5,	%g4
	tne	%icc,	0x2
	andcc	%o5,	%l1,	%i7
	tsubcc	%o3,	%l3,	%l6
	fbg	%fcc3,	loop_652
	alignaddr	%g1,	%o0,	%i5
	bpos,pt	%icc,	loop_653
	sdivx	%i2,	0x05B3,	%i4
loop_652:
	tsubcc	%g2,	%i6,	%l4
	fmovsge	%icc,	%f28,	%f12
loop_653:
	nop
	set	0x60, %o0
	stba	%o1,	[%l7 + %o0] 0x11
	subc	%o6,	%g3,	%o2
	tne	%icc,	0x1
	fors	%f0,	%f1,	%f27
	fmovscs	%icc,	%f0,	%f19
	fornot2s	%f16,	%f5,	%f27
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x54] %asi,	%o7
	tg	%icc,	0x2
	fands	%f20,	%f6,	%f11
	movne	%xcc,	%i0,	%l0
	fxors	%f13,	%f17,	%f6
	move	%icc,	%o4,	%g6
	andcc	%i3,	0x1127,	%g7
	brnz,a	%g5,	loop_654
	umul	%l2,	%l5,	%g4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%o5
loop_654:
	ldd	[%l7 + 0x60],	%l0
	fmovdge	%xcc,	%f21,	%f21
	smul	%i7,	%l3,	%o3
	fmovd	%f22,	%f0
	addc	%l6,	0x0666,	%o0
	tle	%xcc,	0x4
	tvc	%icc,	0x2
	movle	%xcc,	%i5,	%g1
	brlz,a	%i2,	loop_655
	sll	%g2,	0x1E,	%i6
	bge,pt	%xcc,	loop_656
	sdivcc	%i4,	0x12B1,	%l4
loop_655:
	movneg	%icc,	%o1,	%g3
	sub	%o6,	%o2,	%i0
loop_656:
	array32	%l0,	%o7,	%g6
	fabss	%f9,	%f0
	fors	%f13,	%f21,	%f22
	ba,a,pt	%xcc,	loop_657
	andn	%o4,	0x09E8,	%i3
	movn	%xcc,	%g5,	%g7
	call	loop_658
loop_657:
	fcmpgt16	%f12,	%f20,	%l2
	popc	0x1868,	%l5
	andn	%i1,	0x13C5,	%o5
loop_658:
	bleu,a,pn	%xcc,	loop_659
	xnorcc	%g4,	0x16D5,	%i7
	fcmpgt16	%f22,	%f4,	%l3
	fmovdcs	%xcc,	%f14,	%f24
loop_659:
	fmovdle	%icc,	%f30,	%f5
	fmuld8ulx16	%f26,	%f28,	%f6
	taddcctv	%l1,	%l6,	%o0
	edge8	%i5,	%o3,	%g1
	be,a	%xcc,	loop_660
	tle	%icc,	0x1
	brlez	%i2,	loop_661
	addcc	%i6,	%g2,	%l4
loop_660:
	movrgz	%i4,	0x017,	%o1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] %asi,	%g3,	%o2
loop_661:
	fandnot2	%f10,	%f16,	%f2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	udivx	%o6,	0x1BCD,	%i0
	for	%f14,	%f6,	%f26
	movneg	%xcc,	%o7,	%l0
	tvs	%icc,	0x6
	nop
	setx	0x7F600521A06F3BA8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fzero	%f10
	ldstub	[%l7 + 0x11],	%o4
	movge	%xcc,	%g6,	%i3
	brlez,a	%g5,	loop_662
	edge32ln	%g7,	%l5,	%l2
	edge8ln	%i1,	%o5,	%i7
	fmovde	%icc,	%f20,	%f14
loop_662:
	fandnot1	%f2,	%f20,	%f20
	nop
	setx	0x2075FFFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x1AF64A61,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f4,	%f23
	movl	%xcc,	%l3,	%l1
	tge	%icc,	0x4
	edge8n	%l6,	%o0,	%i5
	fbue,a	%fcc2,	loop_663
	fmul8x16al	%f2,	%f13,	%f8
	movl	%xcc,	%g4,	%o3
	call	loop_664
loop_663:
	fcmpgt16	%f0,	%f8,	%g1
	nop
	fitos	%f7,	%f27
	fstox	%f27,	%f24
	fxtos	%f24,	%f31
	fmovde	%xcc,	%f6,	%f13
loop_664:
	nop
	setx	0x784B2CA7AE93A0BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xC27F0F47E983DDE4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f14,	%f26
	fexpand	%f17,	%f6
	subccc	%i2,	%g2,	%i6
	fbug	%fcc2,	loop_665
	addc	%i4,	0x0988,	%l4
	movre	%g3,	0x330,	%o2
	mova	%icc,	%o1,	%o6
loop_665:
	sdivcc	%i0,	0x0B48,	%l0
	stw	%o4,	[%l7 + 0x34]
	tpos	%icc,	0x7
	fcmpne16	%f16,	%f26,	%o7
	fone	%f14
	xorcc	%i3,	%g6,	%g7
	edge32l	%g5,	%l5,	%i1
	fbne,a	%fcc2,	loop_666
	tleu	%xcc,	0x5
	movl	%xcc,	%o5,	%l2
	fsrc1	%f30,	%f14
loop_666:
	edge16n	%i7,	%l1,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l6,	0x1A3F,	%o0
	set	0x24, %o5
	swapa	[%l7 + %o5] 0x89,	%g4
	nop
	setx	loop_667,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%icc,	0x5
	tn	%icc,	0x3
	fmovsg	%icc,	%f23,	%f27
loop_667:
	fands	%f9,	%f7,	%f1
	nop
	setx	0x383D65B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xD8D0864A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f29,	%f28
	addc	%i5,	0x190E,	%g1
	fmovsvc	%icc,	%f1,	%f31
	set	0x58, %i2
	stha	%o3,	[%l7 + %i2] 0x80
	bl,pn	%icc,	loop_668
	movre	%g2,	0x2F9,	%i6
	fbul,a	%fcc3,	loop_669
	fpackfix	%f24,	%f2
loop_668:
	bl,a,pt	%icc,	loop_670
	fmul8x16au	%f27,	%f22,	%f2
loop_669:
	be,a	loop_671
	fandnot1s	%f3,	%f31,	%f18
loop_670:
	sth	%i4,	[%l7 + 0x4C]
	bcs,pn	%icc,	loop_672
loop_671:
	fbue,a	%fcc0,	loop_673
	edge8n	%l4,	%i2,	%o2
	fmovdpos	%icc,	%f30,	%f22
loop_672:
	brgz,a	%o1,	loop_674
loop_673:
	movrlez	%g3,	%o6,	%i0
	brlez,a	%o4,	loop_675
	tvc	%icc,	0x3
loop_674:
	fblg	%fcc1,	loop_676
	fmovrdlez	%o7,	%f16,	%f14
loop_675:
	fbg,a	%fcc0,	loop_677
	fbu,a	%fcc0,	loop_678
loop_676:
	brgez,a	%l0,	loop_679
	orcc	%i3,	0x1806,	%g7
loop_677:
	edge16ln	%g6,	%l5,	%g5
loop_678:
	bgu	%xcc,	loop_680
loop_679:
	stbar
	subccc	%o5,	%l2,	%i7
	nop
	fitos	%f28,	%f24
loop_680:
	sth	%i1,	[%l7 + 0x14]
	movneg	%xcc,	%l3,	%l6
	movneg	%xcc,	%l1,	%o0
	orncc	%g4,	0x1AAA,	%i5
	edge16	%o3,	%g2,	%i6
	fmuld8ulx16	%f9,	%f9,	%f28
	movge	%icc,	%i4,	%l4
	movge	%icc,	%g1,	%o2
	umulcc	%o1,	%g3,	%i2
	addcc	%i0,	%o4,	%o7
	andncc	%l0,	%o6,	%g7
	smul	%g6,	0x0D50,	%i3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%l5
	swap	[%l7 + 0x2C],	%o5
	fmovdpos	%xcc,	%f19,	%f5
	fmovdle	%xcc,	%f0,	%f7
	fbu,a	%fcc2,	loop_681
	tn	%icc,	0x4
	tpos	%xcc,	0x6
	brlez,a	%l2,	loop_682
loop_681:
	tg	%xcc,	0x4
	te	%icc,	0x0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x48] %asi,	%i7
loop_682:
	bgu,pt	%icc,	loop_683
	bne	loop_684
	tvs	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_683:
	fmovrslez	%i1,	%f15,	%f20
loop_684:
	tn	%icc,	0x6
	movrgz	%l6,	0x325,	%l1
	tle	%icc,	0x1
	fbl,a	%fcc3,	loop_685
	subcc	%o0,	%g4,	%l3
	movneg	%xcc,	%i5,	%o3
	sdivx	%i6,	0x042A,	%g2
loop_685:
	sir	0x1064
	array32	%l4,	%i4,	%o2
	fmovdne	%icc,	%f3,	%f3
	andn	%g1,	%o1,	%g3
	bpos,a	%icc,	loop_686
	movre	%i2,	0x265,	%o4
	fpsub32	%f24,	%f6,	%f8
	ldd	[%l7 + 0x50],	%f18
loop_686:
	edge8n	%o7,	%l0,	%i0
	fmul8x16	%f23,	%f0,	%f22
	brlez	%g7,	loop_687
	tvs	%icc,	0x6
	mulscc	%o6,	%g6,	%g5
	movrne	%l5,	%i3,	%l2
loop_687:
	st	%f31,	[%l7 + 0x7C]
	edge32ln	%i7,	%o5,	%l6
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f22
	fxtod	%f22,	%f12
	fmovs	%f28,	%f23
	set	0x44, %l1
	ldswa	[%l7 + %l1] 0x18,	%l1
	movrlz	%o0,	0x0F4,	%g4
	movpos	%xcc,	%i1,	%i5
	movpos	%xcc,	%o3,	%i6
	ldx	[%l7 + 0x60],	%l3
	sdiv	%g2,	0x0BCE,	%l4
	fmovdvc	%icc,	%f25,	%f29
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x14,	%f0
	nop
	setx loop_688, %l0, %l1
	jmpl %l1, %o2
	fcmpeq32	%f6,	%f8,	%i4
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x52] %asi,	%g1
loop_688:
	sllx	%o1,	0x16,	%g3
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x24] %asi,	%o4
	wr	%g0,	0x11,	%asi
	sta	%f20,	[%l7 + 0x58] %asi
	edge8ln	%i2,	%l0,	%o7
	edge32l	%g7,	%o6,	%g6
	andcc	%g5,	%i0,	%l5
	movg	%icc,	%l2,	%i7
	sllx	%i3,	0x03,	%o5
	sll	%l1,	0x0D,	%o0
	bvs	%xcc,	loop_689
	fcmple32	%f4,	%f2,	%l6
	fpadd32s	%f11,	%f9,	%f10
	movre	%g4,	0x07F,	%i1
loop_689:
	sethi	0x0A69,	%o3
	edge16	%i6,	%l3,	%g2
	addcc	%i5,	%l4,	%i4
	ta	%xcc,	0x2
	movvs	%xcc,	%o2,	%o1
	fmovse	%xcc,	%f24,	%f5
	umulcc	%g3,	0x0B96,	%g1
	srl	%o4,	0x05,	%i2
	fbul	%fcc2,	loop_690
	movpos	%xcc,	%l0,	%o7
	edge32ln	%o6,	%g6,	%g5
	taddcctv	%g7,	%i0,	%l2
loop_690:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i7,	%l5,	%i3
	nop
	setx	0x8D7BFCBA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f28
	sll	%o5,	%l1,	%l6
	taddcctv	%o0,	%i1,	%o3
	mulscc	%i6,	%l3,	%g4
	movre	%g2,	%l4,	%i4
	brlez,a	%i5,	loop_691
	ldd	[%l7 + 0x38],	%o0
	tle	%xcc,	0x5
	sll	%o2,	%g1,	%o4
loop_691:
	sub	%i2,	%l0,	%o7
	movvc	%xcc,	%g3,	%g6
	edge32n	%g5,	%o6,	%g7
	movneg	%icc,	%l2,	%i0
	movpos	%icc,	%i7,	%i3
	and	%l5,	0x1DE2,	%o5
	fmovs	%f3,	%f29
	brlez,a	%l1,	loop_692
	movrgz	%l6,	%o0,	%i1
	te	%xcc,	0x4
	nop
	set	0x5C, %g2
	sth	%i6,	[%l7 + %g2]
loop_692:
	movrgez	%l3,	0x014,	%g4
	xor	%g2,	%l4,	%i4
	fmul8x16	%f2,	%f18,	%f18
	bneg,pn	%xcc,	loop_693
	srax	%i5,	%o1,	%o2
	addccc	%o3,	%o4,	%i2
	tgu	%xcc,	0x0
loop_693:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x10] %asi,	%g1
	andcc	%o7,	%g3,	%g6
	edge8l	%l0,	%g5,	%o6
	movg	%xcc,	%g7,	%i0
	set	0x30, %i4
	stha	%i7,	[%l7 + %i4] 0x10
	taddcctv	%i3,	0x0E9C,	%l2
	fbu,a	%fcc3,	loop_694
	srl	%l5,	0x1A,	%o5
	edge16ln	%l1,	%l6,	%o0
	tsubcc	%i1,	%i6,	%g4
loop_694:
	sllx	%g2,	0x17,	%l3
	subccc	%l4,	%i4,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f2,	%f5
	fstoi	%f5,	%f6
	alignaddr	%o2,	%o3,	%o1
	taddcc	%o4,	0x01B5,	%g1
	sir	0x19B2
	andcc	%o7,	0x0894,	%g3
	bneg,pt	%xcc,	loop_695
	bneg,a,pn	%icc,	loop_696
	fpadd32	%f16,	%f30,	%f30
	movrlz	%g6,	0x14D,	%l0
loop_695:
	nop
	set	0x4A, %l0
	lduha	[%l7 + %l0] 0x14,	%i2
loop_696:
	smulcc	%o6,	%g5,	%i0
	subccc	%i7,	%g7,	%l2
	tge	%icc,	0x4
	edge16ln	%i3,	%l5,	%l1
	bneg	loop_697
	edge16n	%o5,	%o0,	%i1
	nop
	setx loop_698, %l0, %l1
	jmpl %l1, %i6
	movcc	%xcc,	%g4,	%l6
loop_697:
	fmovsgu	%icc,	%f13,	%f28
	movg	%icc,	%g2,	%l4
loop_698:
	bge,pn	%icc,	loop_699
	alignaddr	%l3,	%i4,	%i5
	wr	%g0,	0x04,	%asi
	sta	%f13,	[%l7 + 0x44] %asi
loop_699:
	tcs	%xcc,	0x6
	mulscc	%o2,	0x1EC2,	%o3
	be,a,pn	%xcc,	loop_700
	fnor	%f18,	%f8,	%f8
	fnands	%f25,	%f29,	%f22
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o4,	%g1
loop_700:
	movvs	%xcc,	%o1,	%g3
	sub	%g6,	%o7,	%l0
	tvc	%xcc,	0x5
	nop
	setx	0x2B7C3F4995014029,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xCF905AD53AB3DB3B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f8,	%f30
	fbg	%fcc0,	loop_701
	tg	%icc,	0x1
	fpsub32s	%f21,	%f0,	%f25
	move	%icc,	%i2,	%g5
loop_701:
	movg	%xcc,	%o6,	%i7
	fmovsne	%icc,	%f9,	%f15
	fabsd	%f4,	%f26
	tleu	%xcc,	0x2
	fmovdneg	%xcc,	%f0,	%f31
	fpsub32	%f6,	%f14,	%f30
	bneg	loop_702
	fmovrdne	%g7,	%f6,	%f26
	edge8l	%i0,	%l2,	%l5
	andncc	%l1,	%o5,	%i3
loop_702:
	movgu	%xcc,	%i1,	%o0
	tsubcctv	%i6,	0x1EFD,	%g4
	brnz,a	%l6,	loop_703
	fpadd32	%f30,	%f26,	%f20
	movvs	%icc,	%g2,	%l3
	fbn,a	%fcc2,	loop_704
loop_703:
	brgz,a	%l4,	loop_705
	movge	%xcc,	%i4,	%o2
	ta	%xcc,	0x1
loop_704:
	nop
	set	0x3E, %g6
	ldstuba	[%l7 + %g6] 0x11,	%o3
loop_705:
	edge8ln	%i5,	%g1,	%o4
	fbue	%fcc0,	loop_706
	edge8n	%g3,	%g6,	%o7
	andncc	%l0,	%o1,	%g5
	stw	%o6,	[%l7 + 0x74]
loop_706:
	edge8ln	%i2,	%i7,	%g7
	fmul8x16au	%f7,	%f29,	%f28
	taddcc	%i0,	0x01D8,	%l2
	fone	%f8
	movcc	%icc,	%l5,	%o5
	bvc,a	loop_707
	bgu,pn	%icc,	loop_708
	srax	%l1,	0x14,	%i3
	set	0x40, %o3
	prefetcha	[%l7 + %o3] 0x19,	 0x2
loop_707:
	ba,a	%icc,	loop_709
loop_708:
	udiv	%i6,	0x1F0D,	%o0
	fmovscs	%icc,	%f14,	%f16
	and	%g4,	%l6,	%l3
loop_709:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x25] %asi,	%l4
	fcmpeq32	%f20,	%f26,	%i4
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movleu	%xcc,	%o2,	%g2
	edge8	%i5,	%g1,	%o3
	fcmpgt16	%f14,	%f16,	%o4
	tn	%xcc,	0x4
	edge8n	%g3,	%g6,	%l0
	sra	%o1,	0x10,	%o7
	movrlez	%o6,	0x135,	%g5
	movrlez	%i2,	0x3D8,	%i7
	addccc	%g7,	0x1C78,	%i0
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x0] %asi,	%l2
	brlez,a	%l5,	loop_710
	alignaddrl	%o5,	%l1,	%i3
	bn,pn	%xcc,	loop_711
	movrne	%i1,	0x351,	%i6
loop_710:
	fxors	%f19,	%f8,	%f9
	fbl,a	%fcc3,	loop_712
loop_711:
	fmuld8ulx16	%f9,	%f7,	%f28
	tn	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_712:
	addcc	%g4,	%o0,	%l6
	bge	loop_713
	taddcctv	%l4,	%i4,	%o2
	tsubcctv	%g2,	%l3,	%i5
	nop
	setx	0xE07AC6D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
loop_713:
	fmul8sux16	%f12,	%f20,	%f8
	movrlez	%o3,	0x22F,	%o4
	fmovrde	%g1,	%f4,	%f28
	ba,a	loop_714
	udivcc	%g6,	0x0D6E,	%g3
	movg	%icc,	%l0,	%o1
	tvc	%icc,	0x4
loop_714:
	sra	%o7,	0x13,	%g5
	tgu	%xcc,	0x6
	tn	%xcc,	0x2
	edge8	%i2,	%o6,	%i7
	fmuld8sux16	%f9,	%f8,	%f20
	fmovsle	%xcc,	%f31,	%f25
	fmovdvs	%icc,	%f16,	%f11
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	ldd	[%l7 + 0x50],	%l2
	tgu	%icc,	0x7
	movre	%l5,	%o5,	%l1
	alignaddrl	%g7,	%i1,	%i6
	ldub	[%l7 + 0x6F],	%i3
	movneg	%icc,	%o0,	%g4
	movle	%xcc,	%l4,	%l6
	srlx	%i4,	%g2,	%o2
	fmovdl	%icc,	%f3,	%f27
	set	0x1F, %g4
	ldsba	[%l7 + %g4] 0x88,	%l3
	xnor	%i5,	0x1475,	%o3
	edge8l	%o4,	%g6,	%g1
	movneg	%xcc,	%g3,	%o1
	edge32	%l0,	%o7,	%i2
	alignaddrl	%g5,	%o6,	%i7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x0C] %asi,	%f31
	edge32ln	%i0,	%l2,	%l5
	edge32l	%o5,	%g7,	%l1
	mova	%xcc,	%i1,	%i3
	movl	%xcc,	%o0,	%i6
	fzeros	%f27
	fmovdn	%xcc,	%f8,	%f28
	fblg,a	%fcc3,	loop_715
	ldstub	[%l7 + 0x28],	%l4
	movg	%xcc,	%g4,	%l6
	add	%g2,	0x1B7C,	%i4
loop_715:
	nop
	wr	%g0,	0x11,	%asi
	stha	%l3,	[%l7 + 0x48] %asi
	tneg	%icc,	0x7
	move	%xcc,	%o2,	%o3
	array8	%o4,	%i5,	%g6
	sethi	0x0ECC,	%g3
	fsrc1s	%f15,	%f8
	umulcc	%o1,	%g1,	%o7
	orncc	%l0,	0x1338,	%i2
	fmovdgu	%xcc,	%f11,	%f2
	fnot2s	%f10,	%f22
	alignaddr	%g5,	%o6,	%i0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%i7
	taddcctv	%o5,	%g7,	%l5
	fcmpeq32	%f16,	%f26,	%i1
	edge32l	%i3,	%l1,	%i6
	bneg,a,pn	%xcc,	loop_716
	movg	%xcc,	%l4,	%o0
	bneg,a	loop_717
	fcmpgt32	%f26,	%f2,	%l6
loop_716:
	fbue	%fcc1,	loop_718
	bn,a,pt	%icc,	loop_719
loop_717:
	movrgez	%g2,	%i4,	%g4
	smul	%o2,	0x0924,	%l3
loop_718:
	mova	%icc,	%o4,	%i5
loop_719:
	bcc,a	%xcc,	loop_720
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g6,	%g3,	%o3
	udivcc	%g1,	0x1026,	%o7
loop_720:
	movn	%xcc,	%o1,	%i2
	tn	%xcc,	0x0
	fandnot1s	%f5,	%f29,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x6
	subccc	%g5,	0x149A,	%o6
	movleu	%xcc,	%i0,	%l0
	fxor	%f0,	%f14,	%f4
	array8	%i7,	%l2,	%g7
	nop
	setx	0x298F6809B63A331F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x08304D25CB7D20FF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f8,	%f20
	ldx	[%l7 + 0x58],	%l5
	nop
	setx	loop_721,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%i1,	%i3,	%o5
	sir	0x190D
	fbn,a	%fcc1,	loop_722
loop_721:
	movrgez	%i6,	0x0DF,	%l4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%o0
loop_722:
	fmovrsgez	%g2,	%f27,	%f3
	smulcc	%l6,	0x0385,	%i4
	array16	%g4,	%o2,	%l3
	nop
	fitod	%f8,	%f16
	fdtoi	%f16,	%f19
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x0c,	%o4,	%g6
	bgu	loop_723
	srlx	%g3,	0x0B,	%o3
	movle	%xcc,	%g1,	%i5
	fzeros	%f2
loop_723:
	sdivx	%o7,	0x052E,	%o1
	fmuld8ulx16	%f11,	%f15,	%f20
	udivcc	%g5,	0x0C96,	%i2
	udiv	%i0,	0x1C31,	%o6
	ldsw	[%l7 + 0x3C],	%i7
	fand	%f30,	%f20,	%f10
	add	%l0,	%g7,	%l5
	fmovdn	%icc,	%f4,	%f24
	ldstub	[%l7 + 0x24],	%i1
	ld	[%l7 + 0x54],	%f23
	sdivx	%i3,	0x09CB,	%o5
	fxnor	%f4,	%f24,	%f24
	bleu,a	loop_724
	tcs	%icc,	0x1
	addc	%i6,	%l4,	%l1
	fbug,a	%fcc3,	loop_725
loop_724:
	bvc,a	loop_726
	movvc	%xcc,	%o0,	%l2
	taddcc	%g2,	%i4,	%l6
loop_725:
	fbul,a	%fcc2,	loop_727
loop_726:
	brnz,a	%g4,	loop_728
	mulx	%o2,	%l3,	%g6
	brlz,a	%o4,	loop_729
loop_727:
	orncc	%o3,	%g1,	%i5
loop_728:
	fcmpgt16	%f2,	%f2,	%o7
	fbg	%fcc0,	loop_730
loop_729:
	alignaddrl	%g3,	%g5,	%o1
	stx	%i2,	[%l7 + 0x38]
	movge	%xcc,	%o6,	%i0
loop_730:
	smul	%l0,	0x04B3,	%i7
	fmovdl	%xcc,	%f4,	%f6
	sdivx	%g7,	0x0EFD,	%i1
	nop
	fitos	%f14,	%f16
	fstox	%f16,	%f14
	alignaddr	%l5,	%i3,	%o5
	smulcc	%l4,	%l1,	%o0
	fcmple32	%f6,	%f2,	%i6
	tleu	%xcc,	0x7
	subcc	%g2,	0x1A52,	%i4
	andncc	%l6,	%g4,	%l2
	fandnot2	%f0,	%f28,	%f14
	edge8	%l3,	%o2,	%o4
	srax	%g6,	%o3,	%i5
	tge	%xcc,	0x5
	fblg,a	%fcc0,	loop_731
	udivcc	%o7,	0x1BE4,	%g1
	call	loop_732
	edge32l	%g5,	%g3,	%i2
loop_731:
	nop
	set	0x48, %i6
	lda	[%l7 + %i6] 0x89,	%f17
loop_732:
	movvc	%icc,	%o6,	%o1
	sdiv	%l0,	0x1E4D,	%i0
	or	%g7,	%i7,	%l5
	movleu	%icc,	%i3,	%o5
	fzero	%f14
	or	%i1,	%l1,	%l4
	fpsub32	%f2,	%f8,	%f10
	orncc	%o0,	%g2,	%i4
	fpadd32s	%f12,	%f7,	%f4
	movneg	%icc,	%l6,	%g4
	fblg	%fcc0,	loop_733
	nop
	setx	0x505557EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	fsrc1s	%f9,	%f7
	st	%f17,	[%l7 + 0x74]
loop_733:
	bl,a,pn	%xcc,	loop_734
	fmovdgu	%xcc,	%f2,	%f23
	edge32n	%l2,	%i6,	%l3
	fnegd	%f10,	%f18
loop_734:
	fmovdn	%xcc,	%f9,	%f15
	srax	%o4,	0x0D,	%g6
	fbuge	%fcc2,	loop_735
	movgu	%xcc,	%o3,	%i5
	fblg	%fcc1,	loop_736
	move	%icc,	%o7,	%o2
loop_735:
	nop
	set	0x28, %l2
	ldswa	[%l7 + %l2] 0x19,	%g1
loop_736:
	tg	%xcc,	0x6
	fbul	%fcc3,	loop_737
	fmovsgu	%icc,	%f10,	%f13
	edge16l	%g3,	%g5,	%o6
	nop
	fitos	%f12,	%f16
	fstod	%f16,	%f26
loop_737:
	array32	%i2,	%l0,	%i0
	udiv	%g7,	0x13F9,	%i7
	edge32n	%l5,	%o1,	%o5
	tvs	%icc,	0x2
	fmovde	%xcc,	%f12,	%f20
	set	0x50, %g7
	lduwa	[%l7 + %g7] 0x81,	%i1
	nop
	fitos	%f8,	%f25
	fstox	%f25,	%f30
	fxtos	%f30,	%f26
	array32	%i3,	%l4,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o0,	%i4
	movrne	%l6,	%g2,	%l2
	wr	%g0,	0x04,	%asi
	stba	%i6,	[%l7 + 0x3B] %asi
	edge8	%g4,	%o4,	%g6
	edge8l	%o3,	%i5,	%o7
	fnot1	%f16,	%f12
	fbu	%fcc3,	loop_738
	fzero	%f14
	edge16ln	%o2,	%l3,	%g1
	tcs	%xcc,	0x4
loop_738:
	fbue	%fcc2,	loop_739
	tl	%icc,	0x3
	ldsh	[%l7 + 0x76],	%g3
	srl	%o6,	%g5,	%l0
loop_739:
	movrne	%i0,	%g7,	%i2
	fxnors	%f4,	%f8,	%f30
	edge8	%i7,	%l5,	%o1
	set	0x1C, %i0
	lda	[%l7 + %i0] 0x81,	%f12
	movn	%icc,	%o5,	%i1
	tcc	%xcc,	0x3
	fnegs	%f2,	%f10
	movrgz	%i3,	0x18A,	%l4
	nop
	setx	loop_740,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitod	%f2,	%f20
	fdtoi	%f20,	%f20
	call	loop_741
	fmul8ulx16	%f14,	%f16,	%f26
loop_740:
	xnorcc	%l1,	%i4,	%o0
	nop
	fitod	%f2,	%f10
	fdtos	%f10,	%f14
loop_741:
	add	%g2,	0x0A68,	%l2
	fblg,a	%fcc3,	loop_742
	srlx	%l6,	0x12,	%g4
	edge16l	%o4,	%g6,	%o3
	bcs,a,pt	%xcc,	loop_743
loop_742:
	add	%i6,	%o7,	%o2
	movrlez	%i5,	%g1,	%l3
	array16	%o6,	%g5,	%l0
loop_743:
	array16	%i0,	%g3,	%g7
	udivcc	%i7,	0x0138,	%i2
	sdivx	%o1,	0x1AF2,	%l5
	membar	0x37
	fmovrdgez	%o5,	%f22,	%f26
	ble	%icc,	loop_744
	popc	%i3,	%l4
	addcc	%i1,	0x143B,	%l1
	membar	0x35
loop_744:
	edge32ln	%i4,	%o0,	%l2
	and	%l6,	%g4,	%o4
	or	%g2,	0x0600,	%o3
	fbue	%fcc3,	loop_745
	sra	%g6,	%i6,	%o7
	fba	%fcc2,	loop_746
	srax	%i5,	0x18,	%g1
loop_745:
	array16	%o2,	%l3,	%g5
	movcc	%icc,	%o6,	%l0
loop_746:
	umul	%g3,	%i0,	%i7
	nop
	setx	0x464B6D62,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xD7D44B98,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f0,	%f20
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x75] %asi,	%g7
	fsrc2	%f12,	%f16
	movn	%xcc,	%o1,	%i2
	movgu	%xcc,	%l5,	%i3
	movge	%xcc,	%o5,	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x18,	%i1,	%i4
	tg	%icc,	0x5
	fmovsle	%icc,	%f30,	%f18
	alignaddrl	%o0,	%l2,	%l6
	ble	loop_747
	fbug	%fcc0,	loop_748
	srl	%g4,	%l1,	%o4
	edge16	%o3,	%g2,	%i6
loop_747:
	fpmerge	%f4,	%f1,	%f4
loop_748:
	fbl	%fcc3,	loop_749
	fones	%f9
	fbug	%fcc1,	loop_750
	tgu	%xcc,	0x6
loop_749:
	orn	%g6,	%i5,	%g1
	bne,a	%xcc,	loop_751
loop_750:
	popc	%o7,	%l3
	fpack32	%f10,	%f0,	%f8
	fbuge	%fcc1,	loop_752
loop_751:
	bneg,pn	%xcc,	loop_753
	movrgez	%g5,	0x13F,	%o6
	tpos	%xcc,	0x3
loop_752:
	udivcc	%o2,	0x0CCD,	%l0
loop_753:
	addc	%i0,	0x13BD,	%i7
	sdivcc	%g7,	0x0E9E,	%g3
	nop
	set	0x50, %g5
	ldsb	[%l7 + %g5],	%i2
	fnors	%f17,	%f20,	%f25
	popc	%o1,	%i3
	smulcc	%l5,	0x1D49,	%l4
	movgu	%xcc,	%i1,	%i4
	bvc	loop_754
	add	%o5,	0x1497,	%l2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%o0
loop_754:
	fmovda	%icc,	%f1,	%f30
	umul	%l6,	0x0CFF,	%g4
	tvs	%icc,	0x4
	edge8	%o4,	%o3,	%g2
	udivx	%l1,	0x19F6,	%i6
	or	%i5,	0x14D1,	%g1
	edge32ln	%g6,	%o7,	%l3
	or	%g5,	%o6,	%o2
	brgz	%i0,	loop_755
	xnorcc	%i7,	0x07CF,	%g7
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x30] %asi,	%l0
loop_755:
	fmovspos	%xcc,	%f11,	%f13
	fmovrsgz	%i2,	%f6,	%f0
	edge16	%o1,	%i3,	%g3
	edge8l	%l4,	%l5,	%i1
	edge8	%o5,	%i4,	%l2
	fmovrdgz	%o0,	%f2,	%f14
	be	loop_756
	tgu	%xcc,	0x7
	tvs	%xcc,	0x4
	mulscc	%g4,	%l6,	%o3
loop_756:
	nop
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x17
	membar	#Sync
	fmul8ulx16	%f12,	%f20,	%f24
	nop
	setx	0xFC6766C530795B73,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	movvc	%icc,	%g2,	%l1
	fbl	%fcc0,	loop_757
	edge8	%i6,	%i5,	%o4
	nop
	setx	0x45D0F0352048DFCD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	edge32l	%g1,	%g6,	%o7
loop_757:
	fcmpne16	%f26,	%f30,	%g5
	fpsub16s	%f26,	%f11,	%f30
	tn	%icc,	0x5
	brnz,a	%l3,	loop_758
	movl	%icc,	%o6,	%o2
	udivx	%i7,	0x0B51,	%g7
	flush	%l7 + 0x74
loop_758:
	movrlez	%l0,	0x276,	%i0
	tle	%icc,	0x7
	fbu,a	%fcc2,	loop_759
	bn,pn	%xcc,	loop_760
	edge32n	%o1,	%i3,	%i2
	fmovrdne	%l4,	%f6,	%f22
loop_759:
	mulx	%l5,	%i1,	%o5
loop_760:
	fors	%f15,	%f22,	%f5
	andcc	%g3,	0x1B15,	%i4
	fexpand	%f22,	%f2
	edge8l	%o0,	%g4,	%l6
	movne	%xcc,	%l2,	%g2
	membar	0x5F
	subcc	%l1,	%o3,	%i6
	fbule,a	%fcc0,	loop_761
	fbul,a	%fcc1,	loop_762
	udivcc	%i5,	0x162C,	%o4
	edge32n	%g6,	%g1,	%o7
loop_761:
	edge8l	%l3,	%g5,	%o6
loop_762:
	andncc	%i7,	%o2,	%l0
	movneg	%icc,	%i0,	%g7
	bn,a	%xcc,	loop_763
	alignaddrl	%i3,	%o1,	%i2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l5,	%l4
loop_763:
	udivcc	%o5,	0x0559,	%i1
	fsrc1	%f10,	%f10
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7D] %asi,	%g3
	sethi	0x07F9,	%o0
	brnz,a	%g4,	loop_764
	fmul8x16au	%f18,	%f1,	%f24
	bne,pn	%icc,	loop_765
	ldsh	[%l7 + 0x2A],	%i4
loop_764:
	tvs	%xcc,	0x0
	fbug,a	%fcc0,	loop_766
loop_765:
	sdiv	%l2,	0x1FB3,	%g2
	flush	%l7 + 0x0C
	movvc	%xcc,	%l6,	%o3
loop_766:
	srax	%i6,	0x1E,	%i5
	movg	%xcc,	%o4,	%l1
	orcc	%g6,	%g1,	%o7
	tleu	%icc,	0x0
	bshuffle	%f16,	%f12,	%f12
	brgz	%g5,	loop_767
	nop
	fitos	%f17,	%f10
	edge32n	%o6,	%i7,	%o2
	fpsub32s	%f27,	%f9,	%f12
loop_767:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x4A] %asi,	%l3
	add	%i0,	0x0A96,	%l0
	fmovsne	%xcc,	%f3,	%f24
	umulcc	%g7,	0x0FAA,	%o1
	set	0x60, %i1
	lduwa	[%l7 + %i1] 0x10,	%i2
	fcmpgt32	%f22,	%f12,	%l5
	movg	%icc,	%l4,	%o5
	fmovrslez	%i1,	%f3,	%f17
	umulcc	%g3,	0x170D,	%i3
	nop
	fitos	%f2,	%f13
	fstod	%f13,	%f22
	addc	%o0,	%g4,	%l2
	edge8n	%i4,	%l6,	%g2
	tpos	%xcc,	0x7
	ble	loop_768
	tsubcctv	%o3,	%i5,	%o4
	nop
	fitos	%f29,	%f12
	stbar
loop_768:
	bcs,pt	%icc,	loop_769
	call	loop_770
	srlx	%l1,	%g6,	%i6
	mulx	%o7,	%g5,	%g1
loop_769:
	smul	%o6,	0x119E,	%o2
loop_770:
	tg	%icc,	0x5
	fmovdne	%icc,	%f1,	%f30
	xnor	%l3,	%i7,	%i0
	bleu,a	loop_771
	fbug	%fcc2,	loop_772
	fpsub16s	%f5,	%f16,	%f4
	sdivcc	%l0,	0x0A33,	%g7
loop_771:
	edge32n	%i2,	%l5,	%l4
loop_772:
	lduh	[%l7 + 0x28],	%o5
	fsrc2s	%f0,	%f17
	brz,a	%i1,	loop_773
	alignaddrl	%g3,	%o1,	%i3
	nop
	setx	0x805ECBD7,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	tneg	%icc,	0x6
loop_773:
	umulcc	%g4,	0x0963,	%o0
	orncc	%l2,	0x0B86,	%l6
	ba	%icc,	loop_774
	array8	%g2,	%i4,	%i5
	flush	%l7 + 0x28
	srl	%o3,	0x09,	%l1
loop_774:
	fandnot2	%f2,	%f10,	%f4
	fmovdl	%icc,	%f12,	%f17
	nop
	setx	0xA7B486FF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x495D81CA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f9,	%f22
	edge16n	%o4,	%g6,	%i6
	movvs	%xcc,	%o7,	%g5
	move	%icc,	%g1,	%o2
	movcc	%icc,	%o6,	%i7
	ldsw	[%l7 + 0x6C],	%l3
	set	0x2C, %o7
	swapa	[%l7 + %o7] 0x18,	%i0
	edge16ln	%l0,	%i2,	%g7
	fpack16	%f10,	%f3
	array16	%l5,	%o5,	%i1
	array32	%g3,	%o1,	%i3
	movrne	%g4,	%o0,	%l2
	fmovrsgez	%l6,	%f21,	%f19
	brlz,a	%l4,	loop_775
	sub	%i4,	%i5,	%o3
	array32	%l1,	%g2,	%g6
	movle	%xcc,	%i6,	%o7
loop_775:
	movne	%icc,	%g5,	%g1
	fbge,a	%fcc0,	loop_776
	xorcc	%o2,	0x124E,	%o6
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%o4
	set	0x28, %g3
	ldsha	[%l7 + %g3] 0x10,	%i7
loop_776:
	lduh	[%l7 + 0x20],	%i0
	umulcc	%l3,	0x18D7,	%l0
	xor	%g7,	%i2,	%o5
	tsubcctv	%i1,	0x1664,	%g3
	movvc	%icc,	%l5,	%i3
	set	0x31, %i5
	ldstuba	[%l7 + %i5] 0x0c,	%g4
	edge32ln	%o1,	%l2,	%o0
	udiv	%l6,	0x01C1,	%l4
	set	0x7C, %o1
	lda	[%l7 + %o1] 0x81,	%f29
	tle	%xcc,	0x5
	movvc	%xcc,	%i5,	%o3
	umul	%i4,	0x04EC,	%l1
	umul	%g2,	%i6,	%o7
	tl	%icc,	0x0
	nop
	setx loop_777, %l0, %l1
	jmpl %l1, %g6
	fbge	%fcc0,	loop_778
	movrne	%g1,	0x201,	%o2
	addcc	%o6,	%o4,	%g5
loop_777:
	ble	loop_779
loop_778:
	nop
	setx	loop_780,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x50],	%i6
	fsrc1	%f0,	%f18
loop_779:
	fmovdcc	%icc,	%f7,	%f12
loop_780:
	umulcc	%i0,	%l0,	%g7
	smulcc	%l3,	0x1203,	%i2
	fpadd32s	%f21,	%f2,	%f19
	bn,a,pt	%xcc,	loop_781
	fmovdn	%icc,	%f5,	%f28
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1D] %asi,	%i1
loop_781:
	fmovdgu	%xcc,	%f14,	%f13
	taddcc	%o5,	%l5,	%g3
	fbn	%fcc3,	loop_782
	addccc	%g4,	0x1CEA,	%o1
	fxnor	%f18,	%f24,	%f6
	xorcc	%i3,	%o0,	%l6
loop_782:
	edge16ln	%l2,	%i5,	%o3
	movcs	%xcc,	%l4,	%l1
	movg	%icc,	%g2,	%i4
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x64] %asi,	%o7
	fbul,a	%fcc0,	loop_783
	srax	%g6,	%i6,	%g1
	ldd	[%l7 + 0x78],	%o6
	bneg,a,pn	%icc,	loop_784
loop_783:
	fmovdpos	%icc,	%f31,	%f9
	lduw	[%l7 + 0x34],	%o4
	xnorcc	%o2,	%g5,	%i0
loop_784:
	fmovrslz	%l0,	%f6,	%f13
	movcs	%xcc,	%i7,	%l3
	edge8l	%g7,	%i1,	%i2
	subcc	%l5,	%o5,	%g4
	edge32l	%g3,	%o1,	%i3
	bg,a	%icc,	loop_785
	sllx	%l6,	0x04,	%l2
	udiv	%o0,	0x1E65,	%o3
	fba	%fcc2,	loop_786
loop_785:
	subcc	%l4,	%l1,	%g2
	fblg,a	%fcc3,	loop_787
	fpsub32	%f6,	%f16,	%f2
loop_786:
	udiv	%i4,	0x07C4,	%o7
	edge32l	%i5,	%i6,	%g1
loop_787:
	smul	%o6,	%g6,	%o4
	bvc,a	loop_788
	fbule,a	%fcc3,	loop_789
	orncc	%g5,	%o2,	%i0
	tge	%icc,	0x2
loop_788:
	fmovdpos	%xcc,	%f2,	%f27
loop_789:
	movle	%icc,	%i7,	%l3
	bne	%icc,	loop_790
	te	%xcc,	0x3
	bcs	loop_791
	srl	%l0,	0x0B,	%i1
loop_790:
	mulx	%g7,	%i2,	%l5
	pdist	%f4,	%f6,	%f26
loop_791:
	fbul	%fcc0,	loop_792
	edge32ln	%o5,	%g3,	%o1
	bge,a	%xcc,	loop_793
	edge8n	%i3,	%l6,	%l2
loop_792:
	fmovrsne	%g4,	%f13,	%f6
	addccc	%o3,	%l4,	%o0
loop_793:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fzeros	%f14
	smulcc	%l1,	0x11F9,	%i4
	fnot2	%f4,	%f20
	movge	%icc,	%g2,	%i5
	nop
	setx	loop_794,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bg,a,pt	%xcc,	loop_795
	fmovrdne	%o7,	%f6,	%f0
	edge32n	%g1,	%i6,	%o6
loop_794:
	nop
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x24] %asi,	%f12
loop_795:
	orcc	%o4,	0x063B,	%g6
	edge32l	%g5,	%i0,	%o2
	array16	%i7,	%l0,	%l3
	fbg,a	%fcc1,	loop_796
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f18,	%f8,	%f20
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x48] %asi,	%f19
loop_796:
	nop
	fitod	%f12,	%f30
	fdtoi	%f30,	%f27
	membar	0x2D
	fmovrsgz	%g7,	%f18,	%f25
	edge32l	%i2,	%l5,	%o5
	fmovrse	%i1,	%f18,	%f0
	fmovrdlz	%g3,	%f4,	%f14
	sdivcc	%i3,	0x0968,	%o1
	bcs	%icc,	loop_797
	mulx	%l6,	%g4,	%o3
	movrgz	%l4,	%o0,	%l1
	mulx	%l2,	%i4,	%g2
loop_797:
	movpos	%icc,	%i5,	%g1
	fmul8sux16	%f14,	%f6,	%f4
	xor	%o7,	0x1EF0,	%i6
	movcc	%icc,	%o4,	%o6
	fbug	%fcc1,	loop_798
	fbe,a	%fcc3,	loop_799
	edge32ln	%g5,	%i0,	%o2
	fnand	%f2,	%f26,	%f26
loop_798:
	movleu	%icc,	%g6,	%l0
loop_799:
	bl,a	%icc,	loop_800
	fnand	%f4,	%f22,	%f24
	tcc	%xcc,	0x1
	fmovsn	%xcc,	%f19,	%f19
loop_800:
	fnot2s	%f12,	%f15
	lduh	[%l7 + 0x0A],	%l3
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf0,	%f16
	fbul	%fcc2,	loop_801
	fnot1s	%f11,	%f6
	tneg	%icc,	0x1
	bg,a,pt	%icc,	loop_802
loop_801:
	tpos	%icc,	0x3
	srax	%i7,	%g7,	%i2
	movrne	%o5,	%i1,	%g3
loop_802:
	edge32ln	%l5,	%o1,	%i3
	fbg	%fcc2,	loop_803
	sdiv	%l6,	0x0779,	%g4
	tge	%xcc,	0x1
	ta	%xcc,	0x5
loop_803:
	movleu	%xcc,	%o3,	%l4
	fmovrdlez	%o0,	%f12,	%f28
	smulcc	%l1,	0x0683,	%l2
	movvs	%xcc,	%g2,	%i4
	tpos	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x58] %asi,	%g1
	fbo	%fcc2,	loop_804
	ta	%icc,	0x1
	stw	%o7,	[%l7 + 0x40]
	bgu,a,pt	%xcc,	loop_805
loop_804:
	nop
	setx	0xEAD4D32120703C22,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	tg	%icc,	0x4
	ldd	[%l7 + 0x18],	%f10
loop_805:
	fcmple16	%f10,	%f24,	%i5
	edge8	%o4,	%o6,	%g5
	bn	loop_806
	sdiv	%i6,	0x10E3,	%i0
	array32	%g6,	%l0,	%l3
	taddcc	%o2,	%g7,	%i2
loop_806:
	stx	%o5,	[%l7 + 0x78]
	movvc	%icc,	%i7,	%g3
	xorcc	%l5,	0x0DC0,	%i1
	fone	%f0
	wr	%g0,	0x10,	%asi
	stha	%i3,	[%l7 + 0x6E] %asi
	fmovsa	%xcc,	%f30,	%f9
	fbu	%fcc1,	loop_807
	brlz,a	%o1,	loop_808
	movn	%xcc,	%l6,	%g4
	tle	%icc,	0x7
loop_807:
	nop
	wr	%g0,	0x04,	%asi
	stba	%o3,	[%l7 + 0x0A] %asi
loop_808:
	bvs,a	loop_809
	ba	%icc,	loop_810
	andcc	%o0,	%l1,	%l2
	brlez,a	%l4,	loop_811
loop_809:
	fmovsge	%icc,	%f18,	%f16
loop_810:
	or	%i4,	0x1854,	%g2
	faligndata	%f10,	%f10,	%f18
loop_811:
	alignaddrl	%o7,	%g1,	%o4
	wr	%g0,	0x23,	%asi
	stwa	%o6,	[%l7 + 0x30] %asi
	membar	#Sync
	fandnot1s	%f8,	%f11,	%f15
	sub	%g5,	0x0121,	%i5
	stw	%i0,	[%l7 + 0x20]
	movvs	%xcc,	%i6,	%g6
	be,pn	%icc,	loop_812
	tgu	%xcc,	0x4
	nop
	setx	0x0563D43DD069C06A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	for	%f22,	%f16,	%f12
loop_812:
	movvs	%icc,	%l0,	%l3
	set	0x0A, %o6
	stha	%o2,	[%l7 + %o6] 0x0c
	bneg,a	%xcc,	loop_813
	andcc	%i2,	%o5,	%g7
	alignaddrl	%g3,	%l5,	%i1
	edge32n	%i7,	%i3,	%o1
loop_813:
	te	%icc,	0x1
	srl	%l6,	0x04,	%o3
	tn	%icc,	0x1
	fmovdne	%icc,	%f7,	%f1
	andncc	%o0,	%l1,	%l2
	fpsub32	%f20,	%f12,	%f16
	orncc	%g4,	%l4,	%i4
	fnegd	%f0,	%f20
	movrlz	%g2,	%o7,	%o4
	set	0x63, %o2
	stba	%o6,	[%l7 + %o2] 0x10
	ba,a	loop_814
	array16	%g5,	%i5,	%i0
	fabss	%f14,	%f18
	edge8	%i6,	%g6,	%l0
loop_814:
	nop
	setx	0x8F4B55439CF4FD8E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x9189CAFCF6688927,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f20,	%f30
	move	%icc,	%g1,	%o2
	fnot2	%f14,	%f16
	fexpand	%f28,	%f20
	sll	%i2,	%l3,	%g7
	tn	%icc,	0x7
	fands	%f18,	%f15,	%f23
	orncc	%g3,	%o5,	%i1
	bne,a,pn	%icc,	loop_815
	addc	%l5,	%i7,	%i3
	fmovs	%f23,	%f19
	udivx	%l6,	0x1E99,	%o3
loop_815:
	taddcctv	%o1,	%l1,	%l2
	tge	%icc,	0x4
	fmovrsgz	%g4,	%f9,	%f0
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movre	%l4,	0x345,	%i4
	nop
	set	0x10, %i3
	ldd	[%l7 + %i3],	%o0
	umul	%o7,	%g2,	%o6
	andcc	%o4,	0x15C8,	%g5
	set	0x30, %g1
	ldswa	[%l7 + %g1] 0x0c,	%i5
	fnot1	%f30,	%f24
	sub	%i0,	%i6,	%g6
	movrgez	%g1,	0x20D,	%o2
	tl	%icc,	0x6
	set	0x10, %l5
	stxa	%l0,	[%l7 + %l5] 0x10
	xor	%l3,	%i2,	%g3
	ldsw	[%l7 + 0x24],	%g7
	sub	%i1,	0x1627,	%l5
	fmovsgu	%xcc,	%f20,	%f24
	fxor	%f8,	%f12,	%f2
	movcc	%icc,	%o5,	%i7
	udiv	%i3,	0x098C,	%o3
	umulcc	%o1,	%l1,	%l2
	movvs	%icc,	%l6,	%g4
	tl	%icc,	0x4
	addccc	%i4,	%o0,	%l4
	ldub	[%l7 + 0x69],	%o7
	andcc	%o6,	%o4,	%g5
	tcs	%icc,	0x2
	xnor	%i5,	%i0,	%i6
	alignaddr	%g2,	%g1,	%o2
	fpadd32s	%f15,	%f13,	%f21
	ta	%icc,	0x0
	tg	%xcc,	0x7
	bcc	loop_816
	fmovrslz	%g6,	%f3,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%l3,	0x1B9D,	%i2
loop_816:
	ldsw	[%l7 + 0x7C],	%l0
	set	0x58, %l3
	prefetcha	[%l7 + %l3] 0x11,	 0x3
	movvs	%icc,	%i1,	%g7
	fpackfix	%f24,	%f28
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x3F] %asi,	%o5
	sll	%l5,	%i3,	%i7
	orncc	%o3,	0x055B,	%o1
	set	0x50, %o5
	ldswa	[%l7 + %o5] 0x81,	%l1
	sub	%l2,	%g4,	%l6
	ldx	[%l7 + 0x10],	%o0
	edge16l	%i4,	%o7,	%o6
	set	0x14, %i2
	lda	[%l7 + %i2] 0x10,	%f14
	udiv	%o4,	0x1051,	%l4
	umul	%g5,	0x1A56,	%i0
	nop
	fitos	%f3,	%f5
	fstod	%f5,	%f18
	popc	%i5,	%g2
	tg	%icc,	0x4
	set	0x2C, %l1
	lduwa	[%l7 + %l1] 0x88,	%i6
	fmovrdlez	%g1,	%f10,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g6,	%o2,	%l3
	addccc	%i2,	%l0,	%i1
	movn	%xcc,	%g3,	%g7
	udivx	%l5,	0x0A5F,	%o5
	fbue,a	%fcc2,	loop_817
	movpos	%xcc,	%i7,	%o3
	xnorcc	%o1,	%l1,	%i3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%g4,	%l2
loop_817:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x0A] %asi,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f25,	%f4
	subccc	%l6,	%o7,	%o6
	edge16ln	%o4,	%l4,	%g5
	bleu,a	loop_818
	sra	%i0,	%i4,	%g2
	fble,a	%fcc1,	loop_819
	tcc	%icc,	0x2
loop_818:
	nop
	setx	loop_820,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%xcc,	0x7
loop_819:
	movle	%icc,	%i5,	%g1
	nop
	setx	0x706375FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
loop_820:
	fmovsn	%icc,	%f21,	%f31
	ldsb	[%l7 + 0x68],	%g6
	fbu	%fcc1,	loop_821
	fornot2s	%f10,	%f30,	%f19
	fzero	%f22
	mova	%icc,	%i6,	%o2
loop_821:
	fmovsn	%xcc,	%f2,	%f24
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%l3
	fmovsg	%xcc,	%f15,	%f6
	tne	%xcc,	0x4
	bg,pt	%icc,	loop_822
	ldsb	[%l7 + 0x36],	%i1
	movgu	%xcc,	%l0,	%g3
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x40] %asi,	%g7
loop_822:
	sethi	0x1D33,	%o5
	nop
	fitod	%f17,	%f12
	add	%l5,	0x1F9F,	%o3
	addccc	%o1,	0x16C6,	%l1
	movvc	%xcc,	%i7,	%g4
	movre	%i3,	%o0,	%l6
	sdivx	%o7,	0x0938,	%o6
	srl	%o4,	%l4,	%g5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x33] %asi,	%i0
	edge32n	%i4,	%l2,	%i5
	fmovdleu	%icc,	%f1,	%f8
	fors	%f29,	%f20,	%f6
	xor	%g2,	0x0A05,	%g6
	stw	%i6,	[%l7 + 0x20]
	orcc	%g1,	%o2,	%i2
	andcc	%i1,	0x0EB5,	%l0
	fnand	%f30,	%f26,	%f4
	alignaddrl	%l3,	%g7,	%g3
	addccc	%l5,	0x05DA,	%o5
	orcc	%o3,	0x1580,	%o1
	andcc	%l1,	%i7,	%g4
	call	loop_823
	fbu,a	%fcc1,	loop_824
	fabsd	%f4,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_823:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%l6
loop_824:
	tsubcctv	%i3,	%o7,	%o4
	orncc	%o6,	0x062E,	%g5
	nop
	fitos	%f23,	%f18
	bpos	%icc,	loop_825
	movgu	%xcc,	%i0,	%i4
	udivx	%l2,	0x0726,	%l4
	fcmpne32	%f4,	%f30,	%i5
loop_825:
	sdivx	%g6,	0x1388,	%i6
	set	0x58, %l4
	ldxa	[%l7 + %l4] 0x89,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f23,	%f8,	%f8
	brz	%o2,	loop_826
	move	%icc,	%i2,	%g1
	edge32ln	%i1,	%l0,	%g7
	stbar
loop_826:
	tpos	%xcc,	0x7
	fmovda	%icc,	%f26,	%f2
	bshuffle	%f12,	%f10,	%f14
	nop
	fitos	%f6,	%f24
	fstod	%f24,	%f12
	tcc	%xcc,	0x1
	fpackfix	%f20,	%f0
	movcs	%xcc,	%g3,	%l5
	bg,pt	%xcc,	loop_827
	sub	%l3,	0x0882,	%o3
	ta	%xcc,	0x4
	fmovsg	%icc,	%f12,	%f3
loop_827:
	tleu	%icc,	0x0
	nop
	setx	0x22DD71B2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f2
	udivx	%o5,	0x06C7,	%o1
	tvs	%icc,	0x2
	or	%l1,	%g4,	%i7
	edge8ln	%l6,	%i3,	%o0
	ld	[%l7 + 0x18],	%f6
	ldstub	[%l7 + 0x79],	%o4
	fbge	%fcc0,	loop_828
	alignaddrl	%o7,	%o6,	%g5
	fabsd	%f24,	%f12
	array8	%i4,	%l2,	%l4
loop_828:
	movrgz	%i0,	0x063,	%i5
	bcc,a,pt	%xcc,	loop_829
	bgu,a	%xcc,	loop_830
	fblg	%fcc2,	loop_831
	xnor	%i6,	0x03ED,	%g6
loop_829:
	fblg	%fcc3,	loop_832
loop_830:
	alignaddrl	%o2,	%g2,	%i2
loop_831:
	andcc	%g1,	%l0,	%i1
	fbuge	%fcc0,	loop_833
loop_832:
	udivx	%g7,	0x1BB3,	%g3
	sra	%l3,	%o3,	%l5
	fbule,a	%fcc3,	loop_834
loop_833:
	movcc	%xcc,	%o1,	%o5
	move	%xcc,	%g4,	%l1
	movle	%icc,	%l6,	%i3
loop_834:
	ble,a	%xcc,	loop_835
	umulcc	%i7,	0x15F3,	%o0
	fpadd16	%f16,	%f22,	%f2
	bneg,pt	%xcc,	loop_836
loop_835:
	nop
	setx	0xF0548AD6,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	nop
	setx	0x013BB3B8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x92A7B846,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f30,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_836:
	fbn	%fcc2,	loop_837
	bneg,a	%icc,	loop_838
	fzeros	%f4
	fbul	%fcc0,	loop_839
loop_837:
	fsrc2	%f0,	%f26
loop_838:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o4,	%o7
loop_839:
	edge8ln	%o6,	%g5,	%i4
	set	0x43, %g2
	ldsba	[%l7 + %g2] 0x11,	%l4
	tneg	%xcc,	0x3
	movvs	%xcc,	%l2,	%i0
	fba,a	%fcc3,	loop_840
	edge8n	%i6,	%i5,	%g6
	bcc,pn	%icc,	loop_841
	fnot1s	%f30,	%f24
loop_840:
	movg	%xcc,	%o2,	%i2
	sdivx	%g2,	0x033F,	%l0
loop_841:
	tvc	%xcc,	0x1
	fmovscc	%icc,	%f4,	%f23
	mova	%xcc,	%i1,	%g7
	fmovdpos	%icc,	%f15,	%f23
	ldsw	[%l7 + 0x3C],	%g1
	ldx	[%l7 + 0x30],	%g3
	brlez	%l3,	loop_842
	nop
	setx	0xD56C6DE5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xD2A1ADBC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f2,	%f31
	xnorcc	%l5,	%o1,	%o3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x60] %asi,	%f19
loop_842:
	add	%g4,	%l1,	%l6
	subccc	%i3,	0x0FF9,	%o5
	andncc	%o0,	%i7,	%o7
	andncc	%o6,	%g5,	%i4
	edge32n	%l4,	%o4,	%l2
	tn	%xcc,	0x6
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%f16
	movle	%icc,	%i6,	%i5
	fornot2s	%f4,	%f18,	%f27
	nop
	setx	0x08CB316D507B13AD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movleu	%xcc,	%i0,	%o2
	bleu	%xcc,	loop_843
	ta	%icc,	0x0
	swap	[%l7 + 0x7C],	%i2
	fmovsl	%icc,	%f27,	%f0
loop_843:
	movpos	%icc,	%g2,	%l0
	addccc	%g6,	%g7,	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g3,	%l3
	tsubcctv	%i1,	%o1,	%o3
	fpmerge	%f16,	%f6,	%f28
	tvs	%icc,	0x0
	edge16l	%g4,	%l1,	%l6
	subccc	%l5,	%o5,	%o0
	fbug	%fcc2,	loop_844
	tpos	%icc,	0x6
	fmovdleu	%icc,	%f0,	%f24
	fandnot2	%f0,	%f22,	%f0
loop_844:
	movleu	%icc,	%i3,	%o7
	fbule	%fcc1,	loop_845
	movgu	%icc,	%o6,	%i7
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x18] %asi,	%i4
loop_845:
	tg	%xcc,	0x2
	bge,a,pn	%xcc,	loop_846
	ldub	[%l7 + 0x38],	%g5
	stx	%l4,	[%l7 + 0x78]
	movcs	%xcc,	%o4,	%l2
loop_846:
	tcs	%icc,	0x1
	array32	%i5,	%i6,	%i0
	movl	%icc,	%i2,	%g2
	xnorcc	%l0,	%g6,	%g7
	fnors	%f25,	%f14,	%f13
	taddcctv	%o2,	0x1F0A,	%g1
	tn	%icc,	0x6
	fblg,a	%fcc1,	loop_847
	sdiv	%l3,	0x152C,	%g3
	move	%xcc,	%i1,	%o3
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x39] %asi,	%g4
loop_847:
	sethi	0x1261,	%l1
	sll	%o1,	%l6,	%l5
	srax	%o5,	%i3,	%o0
	tsubcc	%o7,	0x000F,	%o6
	edge16l	%i4,	%i7,	%g5
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	xorcc	%o4,	0x1F6B,	%l4
	edge32n	%l2,	%i5,	%i0
	movle	%icc,	%i2,	%g2
	brgz	%l0,	loop_848
	movvs	%xcc,	%i6,	%g6
	fmovrsgez	%o2,	%f2,	%f22
	tsubcctv	%g1,	%g7,	%l3
loop_848:
	membar	0x36
	andn	%i1,	0x16F4,	%o3
	movrlz	%g4,	%l1,	%g3
	edge32ln	%o1,	%l5,	%o5
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f14
	xnorcc	%i3,	0x1845,	%l6
	xnor	%o0,	0x0776,	%o7
	popc	%i4,	%i7
	fzeros	%f14
	fmovdvc	%icc,	%f25,	%f7
	mova	%xcc,	%o6,	%o4
	edge16l	%l4,	%l2,	%i5
	fbg,a	%fcc0,	loop_849
	edge8	%g5,	%i2,	%i0
	subc	%g2,	%l0,	%g6
	edge8ln	%i6,	%o2,	%g1
loop_849:
	nop
	setx	loop_850,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x7
	bne,a,pt	%xcc,	loop_851
	mulscc	%g7,	%l3,	%i1
loop_850:
	nop
	setx loop_852, %l0, %l1
	jmpl %l1, %o3
	umulcc	%l1,	0x1563,	%g3
loop_851:
	fornot1s	%f14,	%f14,	%f11
	fbug,a	%fcc1,	loop_853
loop_852:
	tl	%icc,	0x6
	smul	%g4,	%l5,	%o1
	brgez	%o5,	loop_854
loop_853:
	nop
	setx	loop_855,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%l6,	0x1489,	%o0
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x20] %asi,	%i2
loop_854:
	brlz	%o7,	loop_856
loop_855:
	movcs	%xcc,	%i4,	%o6
	fmovrdgz	%i7,	%f6,	%f28
	ldd	[%l7 + 0x78],	%o4
loop_856:
	fmovdvs	%xcc,	%f13,	%f18
	movrgz	%l4,	0x010,	%l2
	xnorcc	%g5,	%i2,	%i5
	fmovs	%f3,	%f7
	mulscc	%g2,	%l0,	%g6
	ldub	[%l7 + 0x5B],	%i0
	movcc	%xcc,	%o2,	%i6
	fmovsgu	%xcc,	%f31,	%f17
	alignaddrl	%g7,	%l3,	%i1
	edge16l	%o3,	%l1,	%g1
	movre	%g3,	%l5,	%g4
	set	0x18, %l0
	stxa	%o1,	[%l7 + %l0] 0x19
	andcc	%l6,	0x113C,	%o5
	mulscc	%o0,	0x018B,	%o7
	andcc	%i3,	0x1E79,	%o6
	lduw	[%l7 + 0x54],	%i7
	ldd	[%l7 + 0x48],	%f12
	mulx	%o4,	0x1B3C,	%l4
	tle	%xcc,	0x2
	movre	%i4,	%l2,	%i2
	fnot2s	%f21,	%f11
	nop
	setx	0xBB007FA850689F4D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	array8	%g5,	%g2,	%i5
	andncc	%g6,	%l0,	%i0
	ldd	[%l7 + 0x60],	%o2
	andn	%i6,	%g7,	%l3
	fpsub16	%f16,	%f18,	%f24
	taddcctv	%i1,	%o3,	%g1
	ta	%icc,	0x5
	fmovrdgz	%g3,	%f10,	%f14
	srl	%l5,	%g4,	%o1
	nop
	fitod	%f31,	%f2
	nop
	set	0x64, %i4
	stw	%l1,	[%l7 + %i4]
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x14,	%f0
	tvs	%icc,	0x4
	fmovdneg	%icc,	%f13,	%f28
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	or	%o5,	%o0,	%i3
	fmovdne	%icc,	%f18,	%f1
	fmovrdlz	%o6,	%f26,	%f2
	tne	%icc,	0x3
	brgz	%o7,	loop_857
	srlx	%o4,	%i7,	%l4
	mova	%xcc,	%l2,	%i2
	movn	%icc,	%g5,	%i4
loop_857:
	call	loop_858
	tneg	%icc,	0x0
	movcs	%icc,	%i5,	%g2
	movrlez	%g6,	0x326,	%i0
loop_858:
	nop
	fitos	%f9,	%f11
	fstod	%f11,	%f0
	movg	%icc,	%o2,	%i6
	smul	%l0,	%l3,	%g7
	subccc	%i1,	%o3,	%g1
	movrgz	%l5,	0x380,	%g3
	pdist	%f4,	%f20,	%f28
	addc	%o1,	0x040C,	%l1
	edge8n	%l6,	%g4,	%o0
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f4
	wr	%g0,	0x2f,	%asi
	stha	%i3,	[%l7 + 0x52] %asi
	membar	#Sync
	call	loop_859
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f24
	fbuge	%fcc0,	loop_860
	movre	%o5,	%o7,	%o4
loop_859:
	subccc	%o6,	%i7,	%l4
	move	%icc,	%i2,	%g5
loop_860:
	edge32n	%i4,	%i5,	%g2
	subcc	%g6,	%l2,	%o2
	taddcc	%i0,	%l0,	%i6
	movrne	%g7,	0x0AD,	%i1
	nop
	setx	loop_861,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduh	[%l7 + 0x42],	%l3
	umulcc	%o3,	0x1F1C,	%g1
	fbug,a	%fcc3,	loop_862
loop_861:
	alignaddrl	%l5,	%o1,	%l1
	fmovs	%f17,	%f0
	sethi	0x1F08,	%l6
loop_862:
	edge8	%g3,	%g4,	%i3
	edge8	%o0,	%o5,	%o4
	movrgz	%o6,	0x3F7,	%o7
	movn	%xcc,	%i7,	%l4
	fmovsvc	%xcc,	%f3,	%f0
	membar	0x34
	alignaddr	%i2,	%g5,	%i4
	array16	%i5,	%g2,	%l2
	sethi	0x0B61,	%o2
	edge16l	%i0,	%g6,	%i6
	alignaddrl	%g7,	%i1,	%l0
	tge	%xcc,	0x6
	add	%l3,	0x0181,	%o3
	fmovde	%xcc,	%f9,	%f20
	wr	%g0,	0x0c,	%asi
	sta	%f12,	[%l7 + 0x64] %asi
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l5,	%o1
	alignaddr	%g1,	%l1,	%g3
	movg	%icc,	%l6,	%i3
	nop
	setx	0x94C7915855F520B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x6C98C71C21F785E3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f2,	%f12
	subcc	%o0,	0x0C78,	%g4
	fmovs	%f4,	%f21
	sir	0x1D7A
	fpsub16	%f2,	%f10,	%f16
	edge32l	%o4,	%o5,	%o6
	andn	%i7,	%l4,	%i2
	ldsh	[%l7 + 0x62],	%g5
	or	%i4,	%o7,	%i5
	te	%icc,	0x2
	edge32n	%l2,	%o2,	%i0
	array8	%g2,	%g6,	%g7
	fmovda	%xcc,	%f9,	%f0
	edge32	%i1,	%l0,	%l3
	smulcc	%o3,	0x1CBD,	%i6
	fmovdvs	%xcc,	%f3,	%f25
	nop
	setx	loop_863,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvs,a,pn	%icc,	loop_864
	brz,a	%o1,	loop_865
	edge32n	%g1,	%l1,	%l5
loop_863:
	stbar
loop_864:
	nop
	set	0x1C, %g4
	stwa	%g3,	[%l7 + %g4] 0x81
loop_865:
	nop
	setx	0xC52AE841881BB82C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xF455EAF037BE2D7B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f26,	%f4
	bg	loop_866
	nop
	setx	0x0066938E,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	nop
	fitos	%f2,	%f17
	fstod	%f17,	%f22
	fpack32	%f14,	%f20,	%f4
loop_866:
	bneg,pn	%xcc,	loop_867
	fmovrdlez	%i3,	%f30,	%f30
	movle	%xcc,	%o0,	%l6
	add	%g4,	%o5,	%o4
loop_867:
	orn	%o6,	%l4,	%i2
	array8	%i7,	%i4,	%g5
	taddcctv	%i5,	%l2,	%o7
	xnorcc	%i0,	%o2,	%g2
	movrne	%g6,	%g7,	%l0
	ldub	[%l7 + 0x19],	%l3
	bgu,a	loop_868
	fmovsneg	%icc,	%f3,	%f17
	bg,a	%icc,	loop_869
	xnorcc	%o3,	%i1,	%o1
loop_868:
	fxors	%f14,	%f28,	%f18
	bpos	%icc,	loop_870
loop_869:
	fcmpne32	%f6,	%f24,	%i6
	nop
	setx	loop_871,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tge	%icc,	0x2
loop_870:
	tsubcctv	%g1,	0x1591,	%l1
	fzero	%f10
loop_871:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l5,	0x1B48,	%g3
	movrgz	%o0,	%i3,	%l6
	movn	%xcc,	%g4,	%o5
	edge32	%o6,	%l4,	%i2
	movcs	%icc,	%o4,	%i4
	fandnot1	%f14,	%f8,	%f6
	fcmpgt16	%f12,	%f22,	%g5
	movre	%i5,	0x1C1,	%l2
	mulscc	%o7,	0x035E,	%i7
	tle	%icc,	0x3
	fblg,a	%fcc0,	loop_872
	sdivcc	%o2,	0x0EE1,	%i0
	edge16n	%g2,	%g7,	%g6
	nop
	setx	0x0AC89C084057238C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x54B9DAD847B11032,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f22,	%f10
loop_872:
	andcc	%l3,	%l0,	%o3
	nop
	setx	0xDC95F2BD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xE0CDD7DA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f1,	%f21
	set	0x7E, %i6
	stba	%i1,	[%l7 + %i6] 0x27
	membar	#Sync
	std	%f14,	[%l7 + 0x68]
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x88
	fmovrse	%o1,	%f9,	%f22
	array32	%g1,	%i6,	%l1
	and	%g3,	%o0,	%i3
	movrne	%l5,	%g4,	%o5
	tl	%icc,	0x3
	srl	%o6,	%l6,	%i2
	orcc	%l4,	0x14CC,	%i4
	movre	%g5,	0x1C0,	%i5
	fblg	%fcc2,	loop_873
	tcs	%xcc,	0x7
	fxor	%f2,	%f2,	%f16
	sdiv	%l2,	0x032C,	%o4
loop_873:
	nop
	setx	0x5719F2F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f26
	srlx	%i7,	0x00,	%o7
	sdivx	%i0,	0x0A97,	%o2
	set	0x6E, %l2
	stha	%g7,	[%l7 + %l2] 0x04
	fornot2s	%f21,	%f14,	%f24
	fpackfix	%f28,	%f5
	fpadd16s	%f31,	%f23,	%f29
	srlx	%g6,	%l3,	%l0
	membar	0x57
	tl	%xcc,	0x3
	movn	%icc,	%o3,	%g2
	set	0x20, %g7
	stwa	%i1,	[%l7 + %g7] 0x2b
	membar	#Sync
	srl	%o1,	0x06,	%i6
	alignaddr	%g1,	%l1,	%g3
	stw	%i3,	[%l7 + 0x08]
	xorcc	%l5,	%g4,	%o5
	tpos	%icc,	0x4
	movneg	%xcc,	%o0,	%o6
	srl	%l6,	0x0F,	%l4
	ld	[%l7 + 0x74],	%f9
	umulcc	%i4,	0x1F97,	%i2
	umulcc	%i5,	%l2,	%g5
	flush	%l7 + 0x4C
	taddcctv	%i7,	0x0C5D,	%o4
	sir	0x1ADE
	andncc	%i0,	%o7,	%o2
	andncc	%g7,	%l3,	%g6
	fbge	%fcc2,	loop_874
	srl	%o3,	0x02,	%l0
	alignaddrl	%g2,	%o1,	%i6
	movge	%icc,	%i1,	%l1
loop_874:
	smulcc	%g1,	0x12E5,	%g3
	taddcctv	%l5,	0x1F91,	%g4
	tvc	%xcc,	0x7
	edge8ln	%i3,	%o5,	%o6
	tge	%icc,	0x3
	set	0x70, %i0
	sta	%f15,	[%l7 + %i0] 0x88
	tvs	%icc,	0x2
	edge32ln	%l6,	%o0,	%i4
	bvc,a	loop_875
	nop
	setx	loop_876,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brnz,a	%i2,	loop_877
	edge8ln	%l4,	%i5,	%g5
loop_875:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i7,	%o4
loop_876:
	movrgez	%i0,	0x3F4,	%o7
loop_877:
	mova	%xcc,	%l2,	%g7
	set	0x58, %g5
	lduha	[%l7 + %g5] 0x11,	%l3
	movne	%xcc,	%o2,	%o3
	array32	%l0,	%g6,	%g2
	fmul8sux16	%f24,	%f30,	%f20
	tsubcc	%i6,	%i1,	%l1
	fnot2	%f28,	%f20
	nop
	setx	0xF65663834BF5DA1E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x4AAC0D89762A181A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f30,	%f6
	sth	%g1,	[%l7 + 0x24]
	fsrc1s	%f28,	%f17
	tn	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%o1,	%f6,	%f4
	subc	%g3,	0x12B4,	%l5
	fmovsa	%icc,	%f12,	%f0
	movre	%g4,	%o5,	%o6
	edge32	%i3,	%o0,	%i4
	or	%i2,	%l6,	%l4
	movvc	%xcc,	%i5,	%g5
	membar	0x60
	fmovdneg	%icc,	%f29,	%f16
	edge16ln	%i7,	%i0,	%o7
	edge32ln	%l2,	%g7,	%l3
	bshuffle	%f8,	%f0,	%f26
	nop
	setx	0x39600723,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x60AD7FD6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f22,	%f31
	fmul8x16	%f9,	%f16,	%f8
	ld	[%l7 + 0x38],	%f24
	membar	0x44
	edge16	%o2,	%o4,	%l0
	ld	[%l7 + 0x14],	%f3
	fbg	%fcc0,	loop_878
	tg	%xcc,	0x6
	stb	%o3,	[%l7 + 0x3F]
	taddcctv	%g6,	%g2,	%i1
loop_878:
	srlx	%i6,	%g1,	%o1
	fbo	%fcc1,	loop_879
	subcc	%g3,	%l1,	%l5
	fmul8ulx16	%f18,	%f4,	%f28
	fmovsne	%xcc,	%f8,	%f11
loop_879:
	tcs	%xcc,	0x4
	movrne	%o5,	0x376,	%o6
	smulcc	%i3,	%o0,	%i4
	edge32	%i2,	%l6,	%g4
	tl	%xcc,	0x3
	edge8	%i5,	%l4,	%g5
	stx	%i0,	[%l7 + 0x48]
	udivcc	%o7,	0x0431,	%i7
	nop
	fitos	%f0,	%f15
	fstox	%f15,	%f14
	fpackfix	%f2,	%f8
	umulcc	%g7,	0x0AE0,	%l2
	nop
	setx	0xABD23162,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f25
	fxnors	%f13,	%f24,	%f15
	ldd	[%l7 + 0x10],	%f0
	fmuld8sux16	%f9,	%f30,	%f30
	set	0x1C, %o4
	stba	%l3,	[%l7 + %o4] 0x22
	membar	#Sync
	te	%xcc,	0x2
	fmovdgu	%xcc,	%f14,	%f15
	stb	%o2,	[%l7 + 0x2E]
	sdiv	%l0,	0x0C3D,	%o4
	movrlz	%o3,	0x1F8,	%g2
	tle	%icc,	0x1
	ble,pn	%xcc,	loop_880
	fbge,a	%fcc2,	loop_881
	smulcc	%g6,	0x1B7E,	%i6
	sdivx	%g1,	0x0D96,	%i1
loop_880:
	sethi	0x0061,	%g3
loop_881:
	fmovdneg	%xcc,	%f4,	%f16
	movg	%icc,	%o1,	%l1
	tle	%xcc,	0x6
	nop
	setx loop_882, %l0, %l1
	jmpl %l1, %l5
	bneg,pt	%icc,	loop_883
	fcmple32	%f30,	%f30,	%o5
	fbn	%fcc1,	loop_884
loop_882:
	fnands	%f23,	%f16,	%f21
loop_883:
	fpack16	%f14,	%f26
	taddcc	%o6,	0x1CE1,	%i3
loop_884:
	tcs	%icc,	0x0
	tgu	%xcc,	0x3
	taddcc	%i4,	0x1B31,	%i2
	umulcc	%l6,	%o0,	%g4
	fnegd	%f22,	%f26
	udiv	%i5,	0x070F,	%l4
	or	%i0,	%g5,	%o7
	movrgez	%g7,	%l2,	%i7
	nop
	set	0x78, %i1
	ldsw	[%l7 + %i1],	%o2
	fzeros	%f23
	fbg,a	%fcc0,	loop_885
	movle	%xcc,	%l3,	%o4
	set	0x4F, %o7
	stba	%l0,	[%l7 + %o7] 0x88
loop_885:
	udivx	%g2,	0x0147,	%o3
	movle	%icc,	%g6,	%i6
	movge	%icc,	%i1,	%g1
	subccc	%g3,	0x1F14,	%l1
	nop
	set	0x54, %g3
	stb	%l5,	[%l7 + %g3]
	tpos	%icc,	0x1
	fble,a	%fcc0,	loop_886
	movrgez	%o1,	%o6,	%o5
	movcc	%xcc,	%i4,	%i2
	tne	%icc,	0x1
loop_886:
	or	%l6,	0x0344,	%i3
	nop
	fitos	%f4,	%f19
	fstox	%f19,	%f6
	fxtos	%f6,	%f10
	movrlz	%o0,	%i5,	%l4
	sethi	0x0219,	%g4
	popc	%i0,	%o7
	fmovdne	%icc,	%f31,	%f17
	nop
	fitod	%f4,	%f14
	fdtoi	%f14,	%f0
	xor	%g7,	%g5,	%l2
	edge16n	%o2,	%l3,	%o4
	taddcc	%i7,	%l0,	%o3
	orncc	%g6,	0x025A,	%g2
	fnot2	%f24,	%f2
	set	0x54, %i5
	swapa	[%l7 + %i5] 0x04,	%i1
	set	0x6E, %l6
	ldsba	[%l7 + %l6] 0x0c,	%i6
	nop
	fitod	%f17,	%f4
	orcc	%g3,	%l1,	%l5
	set	0x60, %o1
	stwa	%o1,	[%l7 + %o1] 0xeb
	membar	#Sync
	subc	%o6,	0x16B9,	%g1
	edge32	%o5,	%i2,	%i4
	bvc,a,pn	%xcc,	loop_887
	fmovdgu	%xcc,	%f6,	%f7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%o0
loop_887:
	srax	%i5,	%l4,	%i3
	andcc	%i0,	%g4,	%g7
	movle	%xcc,	%g5,	%l2
	bvc,a	%xcc,	loop_888
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o7,	%o2,	%l3
	sub	%i7,	%l0,	%o3
loop_888:
	udiv	%g6,	0x09E2,	%g2
	flush	%l7 + 0x20
	movrne	%i1,	%i6,	%o4
	orcc	%l1,	0x1A80,	%l5
	sth	%o1,	[%l7 + 0x20]
	fpmerge	%f31,	%f7,	%f30
	alignaddrl	%g3,	%o6,	%o5
	bn	loop_889
	tsubcctv	%g1,	0x0284,	%i2
	movre	%i4,	%l6,	%o0
	add	%i5,	%i3,	%l4
loop_889:
	fmovsl	%xcc,	%f23,	%f3
	nop
	setx loop_890, %l0, %l1
	jmpl %l1, %i0
	udivx	%g4,	0x073D,	%g7
	tne	%icc,	0x7
	fnot2	%f30,	%f2
loop_890:
	srax	%l2,	%g5,	%o7
	bge,a,pt	%xcc,	loop_891
	lduw	[%l7 + 0x54],	%l3
	andncc	%o2,	%i7,	%o3
	sdivcc	%g6,	0x068D,	%l0
loop_891:
	popc	0x1B87,	%i1
	xnor	%g2,	%i6,	%o4
	udivx	%l1,	0x1FC4,	%l5
	stx	%o1,	[%l7 + 0x28]
	fpadd16	%f24,	%f14,	%f2
	ble,a,pn	%icc,	loop_892
	bleu	loop_893
	ta	%icc,	0x2
	tle	%icc,	0x4
loop_892:
	tcs	%xcc,	0x4
loop_893:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%o6
	st	%f21,	[%l7 + 0x0C]
	mova	%icc,	%o5,	%g3
	udivx	%g1,	0x17DD,	%i2
	alignaddr	%i4,	%l6,	%i5
	ldub	[%l7 + 0x72],	%o0
	movg	%xcc,	%l4,	%i0
	tn	%icc,	0x5
	fmovdne	%xcc,	%f19,	%f27
	tcc	%xcc,	0x2
	fbg,a	%fcc3,	loop_894
	edge8n	%g4,	%i3,	%g7
	popc	%g5,	%l2
	sir	0x1059
loop_894:
	movle	%icc,	%l3,	%o7
	movne	%icc,	%o2,	%o3
	andcc	%g6,	%l0,	%i7
	movne	%xcc,	%i1,	%i6
	fmovsvc	%xcc,	%f20,	%f7
	fcmple32	%f14,	%f18,	%g2
	set	0x5C, %o6
	sta	%f3,	[%l7 + %o6] 0x88
	tcc	%xcc,	0x0
	brgz,a	%o4,	loop_895
	ldsw	[%l7 + 0x34],	%l5
	edge16n	%l1,	%o1,	%o6
	tg	%icc,	0x5
loop_895:
	movrne	%g3,	0x273,	%o5
	edge8ln	%i2,	%i4,	%g1
	xor	%l6,	0x0C39,	%i5
	movleu	%icc,	%l4,	%i0
	nop
	fitod	%f10,	%f30
	fexpand	%f3,	%f6
	sdivx	%o0,	0x0BDD,	%g4
	fmovdpos	%xcc,	%f3,	%f15
	bcc,a,pn	%xcc,	loop_896
	nop
	fitos	%f12,	%f12
	fstoi	%f12,	%f10
	add	%l7,	0x24,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%g7,	%g5
loop_896:
	edge32l	%l2,	%i3,	%o7
	ldsw	[%l7 + 0x1C],	%l3
	stw	%o2,	[%l7 + 0x4C]
	sir	0x014D
	fcmpeq16	%f14,	%f18,	%g6
	sdivcc	%o3,	0x1F83,	%i7
	tne	%xcc,	0x7
	flush	%l7 + 0x5C
	sdivcc	%i1,	0x1F72,	%l0
	fmovdl	%xcc,	%f21,	%f13
	fmovrse	%g2,	%f24,	%f20
	bn,a	%icc,	loop_897
	edge16ln	%i6,	%o4,	%l5
	mulscc	%o1,	0x14ED,	%l1
	alignaddrl	%o6,	%g3,	%i2
loop_897:
	bvs,a,pn	%icc,	loop_898
	movleu	%xcc,	%o5,	%g1
	fmovsvc	%icc,	%f2,	%f21
	movn	%icc,	%i4,	%l6
loop_898:
	movgu	%xcc,	%l4,	%i0
	call	loop_899
	tcs	%icc,	0x2
	srax	%i5,	0x04,	%o0
	sllx	%g7,	0x1D,	%g5
loop_899:
	movle	%xcc,	%l2,	%i3
	edge16ln	%g4,	%o7,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%l3,	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%i1
	xnorcc	%l0,	0x021C,	%g2
	tsubcc	%i7,	%o4,	%i6
	umul	%o1,	%l1,	%l5
	sir	0x17E2
	fmovsne	%xcc,	%f27,	%f23
	edge8n	%o6,	%i2,	%o5
	movrne	%g3,	%i4,	%l6
	tg	%xcc,	0x7
	edge16l	%g1,	%i0,	%i5
	tpos	%xcc,	0x6
	edge32n	%l4,	%g7,	%g5
	umul	%l2,	0x18CE,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f28,	%f26,	%f24
	fmovsvs	%xcc,	%f31,	%f9
	mulscc	%o0,	0x0668,	%g4
	udiv	%o2,	0x00DA,	%l3
	subccc	%o3,	0x15E6,	%o7
	set	0x6D, %o2
	ldsba	[%l7 + %o2] 0x10,	%i1
	xorcc	%g6,	%l0,	%i7
	move	%icc,	%o4,	%g2
	fmovrdgez	%o1,	%f10,	%f2
	or	%l1,	%l5,	%o6
	array16	%i6,	%i2,	%g3
	tvc	%icc,	0x0
	fbu,a	%fcc3,	loop_900
	tleu	%icc,	0x7
	movcc	%xcc,	%o5,	%l6
	tleu	%icc,	0x3
loop_900:
	nop
	setx	0x1B1E6F4CE412567B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xDB0043ABDB80816A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f8,	%f6
	tleu	%xcc,	0x4
	edge8n	%i4,	%i0,	%i5
	edge8n	%l4,	%g1,	%g5
	fbne,a	%fcc1,	loop_901
	xor	%g7,	0x1A04,	%l2
	mova	%xcc,	%i3,	%g4
	fbuge	%fcc1,	loop_902
loop_901:
	edge32ln	%o2,	%o0,	%l3
	tl	%icc,	0x4
	bgu,pn	%xcc,	loop_903
loop_902:
	movg	%xcc,	%o7,	%i1
	movcc	%xcc,	%g6,	%l0
	smul	%i7,	0x0493,	%o4
loop_903:
	edge32	%o3,	%o1,	%l1
	movcc	%xcc,	%l5,	%o6
	taddcctv	%i6,	%i2,	%g3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x04,	%g2,	%o5
	add	%l6,	0x07A6,	%i0
	bl	loop_904
	fmovdge	%xcc,	%f15,	%f27
	tcs	%xcc,	0x4
	addccc	%i4,	%i5,	%l4
loop_904:
	movcs	%xcc,	%g5,	%g1
	sdivcc	%l2,	0x1836,	%i3
	fmovdvs	%xcc,	%f19,	%f0
	addcc	%g4,	%o2,	%g7
	tne	%icc,	0x2
	mulscc	%l3,	0x1B1A,	%o0
	edge32n	%i1,	%o7,	%g6
	subc	%i7,	%o4,	%l0
	movge	%icc,	%o3,	%l1
	fones	%f9
	bn,pn	%icc,	loop_905
	tsubcctv	%l5,	0x1CBD,	%o6
	fnot1	%f24,	%f8
	bleu,pn	%xcc,	loop_906
loop_905:
	edge8n	%i6,	%o1,	%g3
	taddcc	%i2,	0x1F15,	%o5
	movvs	%icc,	%g2,	%l6
loop_906:
	nop
	setx	0xFA9E0296C6FECB01,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF4795378FC096216,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f30,	%f30
	smul	%i0,	0x1CA5,	%i4
	fbge,a	%fcc3,	loop_907
	edge8ln	%i5,	%g5,	%g1
	fbne	%fcc3,	loop_908
	umulcc	%l2,	%i3,	%g4
loop_907:
	bpos	%xcc,	loop_909
	movle	%icc,	%o2,	%l4
loop_908:
	alignaddrl	%g7,	%l3,	%o0
	fbuge	%fcc0,	loop_910
loop_909:
	add	%i1,	0x1CB1,	%g6
	fbue	%fcc1,	loop_911
	nop
	setx	loop_912,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_910:
	movpos	%icc,	%o7,	%i7
	movre	%l0,	%o4,	%l1
loop_911:
	fmovsleu	%icc,	%f3,	%f2
loop_912:
	fmovrsne	%l5,	%f9,	%f2
	andn	%o6,	0x0CB9,	%o3
	nop
	setx	loop_913,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stbar
	stb	%o1,	[%l7 + 0x78]
	xnor	%g3,	%i2,	%i6
loop_913:
	edge16n	%o5,	%g2,	%l6
	movgu	%icc,	%i4,	%i5
	fbue	%fcc3,	loop_914
	srlx	%i0,	0x10,	%g5
	mova	%icc,	%g1,	%i3
	edge16l	%g4,	%l2,	%o2
loop_914:
	fmovsgu	%icc,	%f3,	%f13
	umul	%l4,	%g7,	%l3
	andcc	%o0,	0x022F,	%g6
	ldsh	[%l7 + 0x46],	%o7
	movgu	%xcc,	%i1,	%i7
	srax	%l0,	%l1,	%l5
	mulscc	%o6,	0x0460,	%o4
	xorcc	%o3,	0x0C31,	%o1
	fbu	%fcc0,	loop_915
	subc	%g3,	%i6,	%i2
	ta	%xcc,	0x1
	subcc	%o5,	%g2,	%l6
loop_915:
	fnot1	%f8,	%f24
	sdivcc	%i5,	0x15A1,	%i4
	orn	%g5,	0x0947,	%i0
	mulx	%g1,	0x051B,	%i3
	wr	%g0,	0x2a,	%asi
	stwa	%g4,	[%l7 + 0x0C] %asi
	membar	#Sync
	mova	%icc,	%o2,	%l2
	brlz	%l4,	loop_916
	srlx	%g7,	%o0,	%l3
	fcmpeq32	%f18,	%f24,	%o7
	stx	%g6,	[%l7 + 0x38]
loop_916:
	brlez	%i7,	loop_917
	or	%l0,	%i1,	%l1
	set	0x30, %i7
	ldxa	[%l7 + %i7] 0x10,	%l5
loop_917:
	fcmpeq16	%f14,	%f20,	%o6
	umulcc	%o4,	0x0A8A,	%o3
	array16	%g3,	%i6,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x0
	bcs,a,pn	%xcc,	loop_918
	tneg	%icc,	0x0
	be,pt	%xcc,	loop_919
	movle	%icc,	%o5,	%g2
loop_918:
	stw	%l6,	[%l7 + 0x0C]
	fmuld8ulx16	%f31,	%f29,	%f26
loop_919:
	movrne	%i2,	0x0BA,	%i5
	sra	%i4,	0x1F,	%i0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7A] %asi,	%g5
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f20
	flush	%l7 + 0x14
	srlx	%i3,	%g1,	%o2
	fandnot2	%f26,	%f20,	%f12
	add	%g4,	%l4,	%l2
	array32	%g7,	%o0,	%l3
	fmovrdlz	%o7,	%f10,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i7,	0x16A3,	%g6
	movrlez	%i1,	%l1,	%l5
	array8	%o6,	%l0,	%o3
	bne,a	%xcc,	loop_920
	pdist	%f24,	%f28,	%f20
	xor	%o4,	%g3,	%i6
	edge8ln	%o1,	%g2,	%o5
loop_920:
	nop
	setx	loop_921,	%l0,	%l1
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
	for	%f0,	%f28,	%f6
	movvs	%icc,	%i2,	%l6
loop_921:
	movre	%i5,	%i0,	%i4
	fbug,a	%fcc0,	loop_922
	nop
	setx	0xAD26EFF226419173,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF1FB734A28599684,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f0,	%f4
	stw	%i3,	[%l7 + 0x3C]
	ldub	[%l7 + 0x50],	%g5
loop_922:
	fpsub32	%f6,	%f26,	%f6
	addcc	%o2,	0x1880,	%g1
	tcc	%xcc,	0x7
	subc	%g4,	%l4,	%l2
	edge16	%g7,	%o0,	%o7
	swap	[%l7 + 0x40],	%i7
	sdivcc	%g6,	0x1DA6,	%l3
	tne	%icc,	0x5
	nop
	setx	0xD16062149B3CF13C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x520E264B1F1F05B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f20,	%f30
	andn	%l1,	0x0D8C,	%l5
	smulcc	%i1,	%l0,	%o3
	edge8n	%o4,	%g3,	%i6
	fmovrsgez	%o1,	%f18,	%f24
	pdist	%f4,	%f12,	%f22
	sdiv	%o6,	0x011B,	%o5
	fbuge	%fcc2,	loop_923
	andcc	%i2,	%g2,	%i5
	fbu	%fcc3,	loop_924
	edge8n	%l6,	%i0,	%i3
loop_923:
	udiv	%g5,	0x1192,	%i4
	nop
	setx	0x00E1E6F1F049BBB2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_924:
	prefetch	[%l7 + 0x50],	 0x3
	sllx	%g1,	0x05,	%o2
	nop
	setx	0xE048A601,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	nop
	setx	0xA042783C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	bcc,a,pt	%xcc,	loop_925
	movrgz	%l4,	0x022,	%l2
	stw	%g4,	[%l7 + 0x30]
	srl	%o0,	0x18,	%g7
loop_925:
	tcs	%xcc,	0x2
	sub	%o7,	%g6,	%l3
	stx	%l1,	[%l7 + 0x20]
	mulx	%i7,	0x0AD5,	%l5
	fpsub32	%f20,	%f6,	%f16
	movleu	%xcc,	%i1,	%o3
	fcmpne16	%f22,	%f28,	%o4
	taddcctv	%g3,	%l0,	%o1
	alignaddr	%o6,	%i6,	%i2
	edge16n	%o5,	%g2,	%l6
	tsubcctv	%i0,	%i5,	%g5
	nop
	setx	loop_926,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tne	%icc,	0x3
	fbul,a	%fcc0,	loop_927
	fpadd16s	%f3,	%f11,	%f7
loop_926:
	srax	%i4,	%g1,	%i3
	udivx	%l4,	0x10BD,	%l2
loop_927:
	tvs	%icc,	0x3
	udiv	%o2,	0x0793,	%o0
	call	loop_928
	orn	%g7,	0x1028,	%g4
	fmovrsne	%g6,	%f8,	%f20
	sll	%l3,	0x1D,	%o7
loop_928:
	movre	%l1,	%l5,	%i1
	brlez	%i7,	loop_929
	xnor	%o4,	%o3,	%l0
	fbn,a	%fcc2,	loop_930
	udivcc	%g3,	0x10CF,	%o6
loop_929:
	nop
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o1,	%i6
loop_930:
	nop
	set	0x70, %i3
	ldda	[%l7 + %i3] 0x23,	%i2
	taddcc	%g2,	0x1B83,	%l6
	taddcc	%o5,	0x03D5,	%i0
	fmovdle	%icc,	%f6,	%f21
	fabsd	%f26,	%f6
	udivcc	%i5,	0x0FDF,	%i4
	bgu,a,pn	%icc,	loop_931
	ld	[%l7 + 0x24],	%f27
	tsubcctv	%g5,	0x05EB,	%i3
	popc	0x03A0,	%g1
loop_931:
	orncc	%l2,	%l4,	%o2
	tcc	%xcc,	0x3
	move	%icc,	%o0,	%g7
	edge8n	%g6,	%l3,	%o7
	swap	[%l7 + 0x08],	%l1
	umul	%g4,	0x119B,	%i1
	fmovd	%f8,	%f4
	mulscc	%i7,	0x0B3F,	%l5
	umulcc	%o3,	0x1BDD,	%l0
	fmovsvc	%icc,	%f5,	%f27
	orncc	%g3,	%o6,	%o4
	ldsh	[%l7 + 0x4E],	%o1
	fornot1	%f26,	%f26,	%f26
	umulcc	%i2,	0x0F41,	%i6
	popc	0x048F,	%g2
	ldsw	[%l7 + 0x4C],	%o5
	fmovdl	%icc,	%f2,	%f3
	andcc	%l6,	0x090F,	%i5
	movrgez	%i0,	0x385,	%i4
	st	%f0,	[%l7 + 0x50]
	tn	%xcc,	0x3
	subcc	%g5,	0x016C,	%i3
	sir	0x06CE
	smulcc	%g1,	0x0870,	%l2
	addc	%o2,	0x129D,	%l4
	bvc,a	%xcc,	loop_932
	tvs	%xcc,	0x3
	movgu	%xcc,	%o0,	%g6
	movrgz	%l3,	0x14A,	%g7
loop_932:
	srlx	%o7,	%l1,	%g4
	bneg,pn	%xcc,	loop_933
	edge8ln	%i7,	%i1,	%o3
	fmovdn	%xcc,	%f29,	%f22
	xnorcc	%l5,	0x0668,	%l0
loop_933:
	popc	%o6,	%o4
	edge32l	%o1,	%i2,	%g3
	tl	%icc,	0x4
	movneg	%xcc,	%g2,	%i6
	edge16n	%l6,	%i5,	%o5
	edge16n	%i0,	%g5,	%i4
	popc	%i3,	%g1
	nop
	fitod	%f2,	%f28
	fdtox	%f28,	%f30
	lduh	[%l7 + 0x58],	%l2
	fbue	%fcc2,	loop_934
	fbu,a	%fcc0,	loop_935
	xnor	%o2,	%o0,	%g6
	ldsb	[%l7 + 0x6A],	%l3
loop_934:
	addccc	%g7,	%l4,	%o7
loop_935:
	udiv	%l1,	0x0896,	%g4
	umulcc	%i7,	0x0ADC,	%o3
	edge32n	%l5,	%l0,	%o6
	sra	%i1,	%o1,	%i2
	fpsub16	%f30,	%f22,	%f10
	tl	%xcc,	0x3
	and	%o4,	%g2,	%g3
	fbug	%fcc2,	loop_936
	fabss	%f29,	%f27
	swap	[%l7 + 0x4C],	%l6
	fnand	%f6,	%f8,	%f8
loop_936:
	movg	%xcc,	%i5,	%i6
	sdivcc	%i0,	0x1FE4,	%o5
	tvc	%xcc,	0x6
	orn	%g5,	0x1B22,	%i3
	edge32	%g1,	%i4,	%l2
	movleu	%xcc,	%o2,	%o0
	xorcc	%l3,	0x09E2,	%g6
	set	0x42, %g1
	lduba	[%l7 + %g1] 0x14,	%l4
	set	0x50, %l5
	stwa	%g7,	[%l7 + %l5] 0x81
	orncc	%o7,	%l1,	%i7
	umulcc	%g4,	%o3,	%l0
	fbg,a	%fcc3,	loop_937
	movcs	%icc,	%l5,	%o6
	call	loop_938
	sth	%i1,	[%l7 + 0x16]
loop_937:
	edge32n	%o1,	%i2,	%o4
	ld	[%l7 + 0x28],	%f18
loop_938:
	fbue,a	%fcc1,	loop_939
	smulcc	%g2,	0x1EFA,	%g3
	fand	%f16,	%f4,	%f30
	fbu	%fcc2,	loop_940
loop_939:
	fxnors	%f0,	%f7,	%f3
	set	0x14, %o5
	stba	%l6,	[%l7 + %o5] 0x2f
	membar	#Sync
loop_940:
	addccc	%i6,	0x1A81,	%i5
	movge	%icc,	%o5,	%i0
	st	%f0,	[%l7 + 0x40]
	nop
	set	0x7E, %i2
	ldub	[%l7 + %i2],	%g5
	bshuffle	%f2,	%f18,	%f28
	st	%f21,	[%l7 + 0x2C]
	edge16l	%i3,	%g1,	%i4
	udivcc	%l2,	0x0D6B,	%o0
	xnorcc	%l3,	%o2,	%l4
	fble	%fcc0,	loop_941
	tge	%xcc,	0x7
	fcmpeq32	%f0,	%f8,	%g7
	smul	%g6,	%l1,	%o7
loop_941:
	fpsub16s	%f29,	%f8,	%f1
	nop
	setx	0x386630EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xDAFBDC45,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f7,	%f17
	tge	%icc,	0x4
	wr	%g0,	0xe3,	%asi
	stxa	%g4,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32ln	%o3,	%l0,	%l5
	fbuge,a	%fcc1,	loop_942
	edge8ln	%i7,	%i1,	%o6
	for	%f10,	%f4,	%f6
	addc	%i2,	%o1,	%o4
loop_942:
	membar	0x3C
	fpsub32s	%f2,	%f25,	%f2
	edge16ln	%g3,	%l6,	%g2
	ba,pn	%icc,	loop_943
	udivx	%i6,	0x0F43,	%i5
	nop
	fitos	%f14,	%f6
	fstox	%f6,	%f30
	movrlz	%i0,	0x269,	%g5
loop_943:
	fxors	%f9,	%f28,	%f28
	movge	%icc,	%o5,	%g1
	tleu	%xcc,	0x6
	movgu	%icc,	%i3,	%l2
	stb	%i4,	[%l7 + 0x31]
	fmovdcc	%xcc,	%f3,	%f0
	fabss	%f6,	%f31
	tne	%icc,	0x2
	udivx	%o0,	0x199D,	%l3
	fornot2	%f22,	%f20,	%f22
	fbe,a	%fcc0,	loop_944
	movrlz	%l4,	%o2,	%g6
	tcs	%xcc,	0x1
	tne	%xcc,	0x3
loop_944:
	nop
	fitod	%f31,	%f20
	brgez,a	%l1,	loop_945
	fsrc1	%f2,	%f2
	brgz	%o7,	loop_946
	subc	%g4,	0x15A6,	%o3
loop_945:
	movleu	%icc,	%l0,	%g7
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_946:
	fpadd32	%f8,	%f22,	%f18
	alignaddr	%i7,	%i1,	%o6
	orncc	%l5,	%i2,	%o4
	bne,a	%icc,	loop_947
	movpos	%icc,	%g3,	%o1
	edge32l	%g2,	%l6,	%i6
	andcc	%i0,	%i5,	%g5
loop_947:
	fblg	%fcc3,	loop_948
	fands	%f18,	%f18,	%f19
	movl	%icc,	%o5,	%i3
	fcmpgt16	%f10,	%f14,	%g1
loop_948:
	bvc,a,pn	%xcc,	loop_949
	srax	%l2,	0x0F,	%i4
	movrgez	%o0,	%l4,	%l3
	movg	%xcc,	%g6,	%o2
loop_949:
	srl	%o7,	0x0D,	%l1
	smulcc	%o3,	%l0,	%g7
	st	%f10,	[%l7 + 0x14]
	set	0x5C, %l3
	ldstuba	[%l7 + %l3] 0x0c,	%i7
	prefetch	[%l7 + 0x44],	 0x3
	fbo,a	%fcc2,	loop_950
	ldd	[%l7 + 0x10],	%g4
	srl	%i1,	0x19,	%l5
	nop
	setx	0xE36AD3BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x4C61B9B1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f13,	%f10
loop_950:
	bneg	loop_951
	tl	%xcc,	0x5
	ldsw	[%l7 + 0x48],	%o6
	nop
	setx	0xE0B0CB241060FB09,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_951:
	edge32n	%i2,	%o4,	%g3
	tg	%xcc,	0x1
	fbuge,a	%fcc1,	loop_952
	xnorcc	%g2,	0x1498,	%l6
	movne	%icc,	%i6,	%o1
	xorcc	%i5,	%i0,	%o5
loop_952:
	movneg	%icc,	%i3,	%g1
	brz,a	%g5,	loop_953
	sub	%i4,	%l2,	%l4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%g6
loop_953:
	fbug,a	%fcc2,	loop_954
	sub	%o2,	0x0435,	%o0
	mova	%icc,	%l1,	%o3
	edge16n	%l0,	%g7,	%i7
loop_954:
	fpsub32s	%f27,	%f9,	%f28
	fmovrslez	%o7,	%f30,	%f10
	fbuge,a	%fcc2,	loop_955
	fand	%f10,	%f0,	%f12
	movcs	%icc,	%i1,	%l5
	tg	%xcc,	0x3
loop_955:
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f8
	fxtod	%f8,	%f2
	ta	%icc,	0x0
	srax	%o6,	0x06,	%g4
	tn	%icc,	0x0
	fbge	%fcc1,	loop_956
	xnorcc	%i2,	%o4,	%g3
	and	%l6,	0x0D1A,	%g2
	subccc	%i6,	0x1E3C,	%o1
loop_956:
	fmovscc	%xcc,	%f6,	%f25
	umul	%i0,	%i5,	%i3
	fpadd32s	%f29,	%f17,	%f10
	movrlez	%g1,	%o5,	%i4
	bne,pt	%icc,	loop_957
	fbge	%fcc3,	loop_958
	fpadd16s	%f20,	%f21,	%f3
	tg	%xcc,	0x0
loop_957:
	sllx	%l2,	%g5,	%l3
loop_958:
	fmovsl	%icc,	%f4,	%f13
	alignaddrl	%g6,	%o2,	%o0
	edge16	%l1,	%l4,	%l0
	ble	%icc,	loop_959
	call	loop_960
	edge32	%o3,	%g7,	%i7
	set	0x10, %l1
	ldxa	[%g0 + %l1] 0x21,	%o7
loop_959:
	fbul,a	%fcc0,	loop_961
loop_960:
	mova	%icc,	%l5,	%o6
	xorcc	%i1,	0x0EA6,	%i2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x74] %asi,	%g4
loop_961:
	movl	%xcc,	%g3,	%o4
	lduw	[%l7 + 0x10],	%g2
	movvc	%icc,	%l6,	%o1
	nop
	setx	0xC04DE5A7,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	srax	%i0,	0x04,	%i6
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x11
	wr	%g0,	0x18,	%asi
	stha	%i3,	[%l7 + 0x2A] %asi
	fmovsvs	%icc,	%f2,	%f24
	flush	%l7 + 0x30
	fornot1	%f12,	%f30,	%f24
	bgu,a	loop_962
	fcmple32	%f10,	%f8,	%g1
	fnors	%f10,	%f2,	%f12
	set	0x18, %o0
	stha	%i5,	[%l7 + %o0] 0xe2
	membar	#Sync
loop_962:
	umul	%i4,	0x14A7,	%o5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%l2
	movgu	%xcc,	%g5,	%l3
	movrgz	%o2,	%g6,	%l1
	mova	%xcc,	%o0,	%l4
	fmovde	%icc,	%f17,	%f16
	brnz	%l0,	loop_963
	movneg	%xcc,	%g7,	%o3
	mulscc	%o7,	%l5,	%i7
	ldd	[%l7 + 0x60],	%i0
loop_963:
	edge16ln	%o6,	%g4,	%g3
	smul	%o4,	0x0EC7,	%i2
	nop
	fitos	%f11,	%f27
	fstoi	%f27,	%f1
	xorcc	%l6,	%g2,	%o1
	tcc	%icc,	0x4
	fbuge	%fcc0,	loop_964
	fnegs	%f16,	%f18
	nop
	fitos	%f8,	%f19
	fstox	%f19,	%f10
	pdist	%f10,	%f18,	%f8
loop_964:
	nop
	fitos	%f6,	%f22
	fstod	%f22,	%f22
	movpos	%icc,	%i0,	%i6
	set	0x70, %l0
	stxa	%i3,	[%l7 + %l0] 0x88
	addccc	%i5,	%i4,	%g1
	fands	%f15,	%f1,	%f19
	nop
	setx	0xA475FEE8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xD6D1663C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f24,	%f29
	fnegd	%f16,	%f22
	tvc	%xcc,	0x0
	fnand	%f26,	%f30,	%f14
	set	0x70, %g2
	swapa	[%l7 + %g2] 0x04,	%l2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x2E] %asi,	%o5
	umul	%g5,	%l3,	%g6
	movrgez	%o2,	0x207,	%l1
	xor	%l4,	%o0,	%l0
	fmovsleu	%xcc,	%f8,	%f6
	ta	%xcc,	0x7
	fandnot1	%f0,	%f22,	%f14
	subccc	%g7,	%o7,	%l5
	subccc	%i7,	%i1,	%o3
	fornot2s	%f22,	%f18,	%f14
	move	%icc,	%g4,	%g3
	nop
	fitos	%f13,	%f29
	fstox	%f29,	%f10
	fxtos	%f10,	%f14
	tvc	%icc,	0x2
	tneg	%icc,	0x3
	fpsub32	%f26,	%f30,	%f2
	nop
	setx loop_965, %l0, %l1
	jmpl %l1, %o4
	sra	%o6,	%i2,	%g2
	fxors	%f0,	%f15,	%f17
	tg	%xcc,	0x7
loop_965:
	subcc	%l6,	0x0768,	%o1
	andcc	%i6,	0x0A4E,	%i3
	andn	%i5,	0x08CB,	%i0
	fblg,a	%fcc1,	loop_966
	tcs	%icc,	0x4
	fbu	%fcc0,	loop_967
	fmovsgu	%icc,	%f22,	%f29
loop_966:
	srl	%i4,	0x1C,	%g1
	edge8n	%l2,	%g5,	%o5
loop_967:
	movvs	%xcc,	%l3,	%g6
	movg	%icc,	%o2,	%l4
	std	%f26,	[%l7 + 0x68]
	fmuld8ulx16	%f19,	%f7,	%f2
	tpos	%icc,	0x2
	smul	%o0,	%l0,	%g7
	sethi	0x031D,	%o7
	edge32ln	%l5,	%l1,	%i7
	fnand	%f18,	%f2,	%f10
	tsubcctv	%o3,	%i1,	%g3
	movrgz	%o4,	%g4,	%o6
	fmovdcc	%icc,	%f10,	%f5
	move	%xcc,	%g2,	%l6
	tge	%xcc,	0x5
	fmovsge	%xcc,	%f23,	%f20
	tne	%xcc,	0x0
	movne	%xcc,	%o1,	%i6
	sra	%i2,	%i5,	%i3
	movcs	%xcc,	%i4,	%i0
	and	%l2,	0x1987,	%g1
	st	%f20,	[%l7 + 0x70]
	sllx	%g5,	0x11,	%l3
	tcs	%icc,	0x4
	bvc,pn	%xcc,	loop_968
	bvs	loop_969
	edge8n	%o5,	%o2,	%l4
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x1D] %asi,	%g6
loop_968:
	bvc,a	%icc,	loop_970
loop_969:
	fmul8sux16	%f14,	%f30,	%f10
	fmovrdgez	%l0,	%f24,	%f24
	bneg,a,pn	%xcc,	loop_971
loop_970:
	fmovdcc	%icc,	%f0,	%f20
	tgu	%icc,	0x3
	ta	%icc,	0x1
loop_971:
	ldx	[%l7 + 0x18],	%o0
	tg	%xcc,	0x4
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f0
	fbl,a	%fcc3,	loop_972
	addc	%g7,	0x072F,	%l5
	fbo	%fcc2,	loop_973
	tpos	%icc,	0x0
loop_972:
	addc	%l1,	%i7,	%o3
	fmuld8sux16	%f21,	%f15,	%f0
loop_973:
	andcc	%i1,	0x0575,	%o7
	xorcc	%g3,	%g4,	%o6
	tcc	%icc,	0x4
	tn	%icc,	0x6
	edge16	%g2,	%l6,	%o4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x18] %asi,	%o1
	call	loop_974
	movgu	%xcc,	%i6,	%i5
	brgz,a	%i3,	loop_975
	movge	%xcc,	%i2,	%i0
loop_974:
	ld	[%l7 + 0x50],	%f23
	fmovdg	%xcc,	%f2,	%f18
loop_975:
	tcc	%icc,	0x0
	movrgz	%l2,	%i4,	%g1
	tge	%xcc,	0x0
	edge8n	%g5,	%l3,	%o2
	stx	%l4,	[%l7 + 0x40]
	xor	%o5,	%g6,	%o0
	lduw	[%l7 + 0x24],	%l0
	tg	%icc,	0x1
	nop
	setx	0xAB4F79B258425481,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xEE1740FFD787FBA2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f30,	%f4
	or	%l5,	0x1CCE,	%l1
	edge8n	%g7,	%i7,	%i1
	nop
	setx loop_976, %l0, %l1
	jmpl %l1, %o3
	nop
	setx	0x704C08CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	andcc	%o7,	0x0C60,	%g4
	movneg	%icc,	%o6,	%g3
loop_976:
	edge32	%l6,	%g2,	%o4
	edge16n	%i6,	%o1,	%i5
	fmovsgu	%xcc,	%f4,	%f3
	fzeros	%f25
	movrlz	%i2,	%i0,	%i3
	fmovdpos	%xcc,	%f8,	%f2
	fble	%fcc0,	loop_977
	tleu	%xcc,	0x0
	fbug	%fcc0,	loop_978
	nop
	fitos	%f3,	%f29
	fstox	%f29,	%f14
	fxtos	%f14,	%f10
loop_977:
	array8	%i4,	%g1,	%g5
	movre	%l3,	0x04D,	%o2
loop_978:
	ld	[%l7 + 0x38],	%f12
	fpadd32s	%f10,	%f15,	%f30
	edge16	%l2,	%o5,	%l4
	fandnot2s	%f9,	%f10,	%f23
	taddcc	%o0,	%l0,	%g6
	orncc	%l1,	%g7,	%l5
	tleu	%xcc,	0x4
	andcc	%i7,	0x14C7,	%o3
	tpos	%icc,	0x5
	sdivx	%o7,	0x03F8,	%i1
	umul	%g4,	%o6,	%l6
	edge16l	%g2,	%g3,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x0
	fbne	%fcc3,	loop_979
	srlx	%o1,	%o4,	%i5
	fmovrdlez	%i2,	%f16,	%f24
	edge32ln	%i0,	%i4,	%i3
loop_979:
	fpadd32	%f0,	%f16,	%f14
	subcc	%g1,	%l3,	%g5
	sir	0x0520
	edge32l	%l2,	%o2,	%o5
	bvs,a,pt	%icc,	loop_980
	edge16l	%o0,	%l4,	%l0
	fmovrdlz	%g6,	%f2,	%f8
	flush	%l7 + 0x4C
loop_980:
	fbe	%fcc3,	loop_981
	nop
	setx	0x40496DD6,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	orcc	%g7,	0x156E,	%l5
	edge32ln	%i7,	%o3,	%o7
loop_981:
	tl	%xcc,	0x0
	fsrc1	%f0,	%f8
	brnz,a	%l1,	loop_982
	umulcc	%g4,	0x03E4,	%o6
	edge8n	%i1,	%g2,	%g3
	fnands	%f15,	%f26,	%f0
loop_982:
	nop
	setx	0xADCA5C6EACBB5EE8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f24
	ble	%xcc,	loop_983
	tneg	%icc,	0x0
	sir	0x071E
	ldstub	[%l7 + 0x69],	%l6
loop_983:
	fmovrse	%i6,	%f21,	%f29
	andn	%o1,	0x1DE2,	%o4
	edge16	%i5,	%i2,	%i4
	add	%i0,	0x1500,	%g1
	mulscc	%i3,	0x0DAC,	%g5
	orncc	%l3,	0x0CF1,	%o2
	udiv	%o5,	0x0F5F,	%o0
	bpos,a	loop_984
	lduh	[%l7 + 0x6C],	%l2
	udivx	%l4,	0x0884,	%g6
	tcs	%icc,	0x2
loop_984:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x62] %asi,	%l0
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%l5
	umulcc	%i7,	0x19F9,	%g7
	movpos	%xcc,	%o7,	%o3
	fmovsa	%xcc,	%f20,	%f13
	array32	%l1,	%g4,	%o6
	movg	%xcc,	%i1,	%g2
	ldd	[%l7 + 0x50],	%g2
	tvc	%xcc,	0x0
	movrgez	%i6,	%o1,	%o4
	faligndata	%f18,	%f8,	%f10
	ble	loop_985
	nop
	setx	0x6EEAAD8C8CA173CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x838435618FBFE759,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f20,	%f12
	membar	0x6D
	movrgz	%l6,	0x132,	%i5
loop_985:
	bvc	loop_986
	fand	%f18,	%f6,	%f30
	popc	%i4,	%i0
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x5D] %asi,	%g1
loop_986:
	tneg	%xcc,	0x6
	edge16ln	%i2,	%i3,	%l3
	bvc,a	%icc,	loop_987
	xnorcc	%o2,	0x1573,	%o5
	edge16n	%g5,	%o0,	%l4
	fnor	%f24,	%f26,	%f16
loop_987:
	movpos	%icc,	%g6,	%l2
	bvc,a	%xcc,	loop_988
	bl	loop_989
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%l5,	loop_990
loop_988:
	edge16n	%l0,	%i7,	%o7
loop_989:
	sra	%o3,	0x07,	%g7
	subcc	%l1,	%o6,	%i1
loop_990:
	fnot1	%f24,	%f0
	sethi	0x0DF9,	%g2
	addc	%g4,	0x0A02,	%i6
	sethi	0x0B4A,	%o1
	sllx	%o4,	0x0A,	%l6
	movpos	%xcc,	%g3,	%i4
	fsrc1	%f16,	%f16
	fmovdcs	%icc,	%f27,	%f12
	brz	%i5,	loop_991
	tcs	%icc,	0x5
	fpack16	%f0,	%f11
	prefetch	[%l7 + 0x58],	 0x2
loop_991:
	sdivcc	%i0,	0x093E,	%g1
	tcs	%icc,	0x2
	ldx	[%l7 + 0x70],	%i3
	tg	%icc,	0x0
	umulcc	%i2,	%l3,	%o2
	sdivx	%g5,	0x034C,	%o0
	ldsb	[%l7 + 0x36],	%l4
	udivcc	%g6,	0x042F,	%l2
	te	%xcc,	0x6
	bvs,a	loop_992
	ldd	[%l7 + 0x20],	%f12
	fmovdle	%xcc,	%f0,	%f11
	fabss	%f22,	%f6
loop_992:
	nop
	setx	0xE48A4DBC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f31
	tsubcc	%l5,	0x1C21,	%l0
	fmovrse	%i7,	%f31,	%f27
	bl,a	%xcc,	loop_993
	movvs	%icc,	%o7,	%o3
	movvs	%xcc,	%g7,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_993:
	move	%xcc,	%o5,	%i1
	fcmpne32	%f0,	%f30,	%o6
	ld	[%l7 + 0x6C],	%f25
	fone	%f30
	nop
	fitod	%f0,	%f28
	fdtoi	%f28,	%f20
	call	loop_994
	fandnot2s	%f22,	%f9,	%f9
	edge8ln	%g2,	%g4,	%i6
	fcmple16	%f8,	%f12,	%o1
loop_994:
	andcc	%l6,	0x19FF,	%g3
	nop
	fitos	%f20,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x1
	tl	%xcc,	0x6
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x48] %asi,	%o4
	fbn	%fcc0,	loop_995
	umul	%i4,	0x06B2,	%i5
	fcmple16	%f4,	%f4,	%g1
	umulcc	%i0,	0x08FF,	%i3
loop_995:
	alignaddrl	%l3,	%i2,	%o2
	movrgz	%g5,	%l4,	%g6
	edge32ln	%l2,	%o0,	%l0
	set	0x20, %i4
	lduwa	[%l7 + %i4] 0x80,	%i7
	array16	%l5,	%o3,	%o7
	xnorcc	%g7,	%o5,	%l1
	set	0x61, %g4
	ldsba	[%l7 + %g4] 0x88,	%i1
	smul	%g2,	%g4,	%i6
	fmuld8sux16	%f26,	%f21,	%f24
	bg,pt	%icc,	loop_996
	tgu	%icc,	0x4
	umul	%o6,	%o1,	%l6
	fmovde	%xcc,	%f7,	%f16
loop_996:
	sir	0x16B7
	edge16ln	%o4,	%g3,	%i4
	alignaddrl	%i5,	%i0,	%i3
	fbl,a	%fcc1,	loop_997
	fmovdpos	%icc,	%f1,	%f2
	bne,pn	%icc,	loop_998
	or	%l3,	0x1363,	%i2
loop_997:
	tleu	%xcc,	0x5
	bneg,pt	%xcc,	loop_999
loop_998:
	st	%f8,	[%l7 + 0x54]
	bshuffle	%f26,	%f16,	%f22
	fbule,a	%fcc0,	loop_1000
loop_999:
	movge	%xcc,	%o2,	%g1
	edge8	%g5,	%g6,	%l4
	prefetch	[%l7 + 0x08],	 0x1
loop_1000:
	bleu	loop_1001
	smulcc	%o0,	0x08B2,	%l2
	fnor	%f24,	%f6,	%f10
	udiv	%l0,	0x17A7,	%i7
loop_1001:
	fmul8ulx16	%f2,	%f8,	%f12
	umul	%l5,	%o3,	%g7
	mulscc	%o7,	%o5,	%l1
	fnot1	%f20,	%f8
	tvc	%icc,	0x4
	sub	%g2,	0x0BFF,	%i1
	brgez	%g4,	loop_1002
	tleu	%icc,	0x3
	taddcc	%i6,	%o1,	%o6
	nop
	fitod	%f8,	%f22
	fdtox	%f22,	%f18
loop_1002:
	movcs	%xcc,	%l6,	%o4
	edge16ln	%i4,	%g3,	%i5
	ldx	[%l7 + 0x30],	%i0
	andn	%l3,	0x0B0D,	%i2
	set	0x3A, %o3
	ldsba	[%l7 + %o3] 0x89,	%i3
	array8	%g1,	%o2,	%g5
	ldub	[%l7 + 0x3B],	%l4
	edge8l	%g6,	%o0,	%l2
	umulcc	%i7,	%l0,	%l5
	tvc	%icc,	0x6
	fmovspos	%xcc,	%f24,	%f18
	fbug	%fcc2,	loop_1003
	bneg,pn	%xcc,	loop_1004
	fabsd	%f18,	%f2
	flush	%l7 + 0x08
loop_1003:
	udivcc	%o3,	0x0FEA,	%o7
loop_1004:
	nop
	set	0x28, %i6
	stxa	%o5,	[%l7 + %i6] 0xeb
	membar	#Sync
	bl	%icc,	loop_1005
	tgu	%xcc,	0x6
	fornot1s	%f6,	%f26,	%f6
	edge8n	%g7,	%g2,	%l1
loop_1005:
	fblg	%fcc3,	loop_1006
	umulcc	%i1,	0x09FA,	%i6
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1006:
	xor	%g4,	%o6,	%o1
	tge	%icc,	0x3
	set	0x72, %l2
	ldstuba	[%l7 + %l2] 0x80,	%o4
	fnot1s	%f3,	%f19
	xorcc	%l6,	0x11E1,	%g3
	tsubcctv	%i4,	%i0,	%l3
	fandnot2s	%f19,	%f12,	%f27
	andncc	%i2,	%i3,	%g1
	tneg	%icc,	0x6
	sll	%i5,	0x16,	%o2
	fpsub16s	%f0,	%f12,	%f0
	sdivx	%l4,	0x046B,	%g6
	brgez	%o0,	loop_1007
	tvs	%icc,	0x6
	fmovsne	%icc,	%f7,	%f13
	prefetch	[%l7 + 0x6C],	 0x2
loop_1007:
	tcc	%xcc,	0x5
	edge32l	%l2,	%g5,	%i7
	edge16	%l0,	%o3,	%o7
	std	%f22,	[%l7 + 0x38]
	fmovrsgz	%o5,	%f5,	%f9
	set	0x20, %g7
	ldswa	[%l7 + %g7] 0x81,	%l5
	mulscc	%g7,	%g2,	%i1
	movrlez	%l1,	%g4,	%i6
	addccc	%o1,	0x0DA0,	%o6
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o4
	movn	%icc,	%g3,	%l6
	edge16ln	%i0,	%l3,	%i4
	tsubcc	%i3,	0x17BA,	%g1
	tge	%xcc,	0x3
	bleu,a,pt	%xcc,	loop_1008
	fmovrdgz	%i2,	%f16,	%f22
	sra	%o2,	%i5,	%g6
	tge	%xcc,	0x3
loop_1008:
	movrne	%o0,	0x345,	%l4
	xnorcc	%g5,	%l2,	%i7
	tcc	%xcc,	0x4
	movrne	%l0,	%o7,	%o5
	sub	%l5,	0x1654,	%o3
	nop
	setx	loop_1009,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subccc	%g7,	0x1D8E,	%g2
	subccc	%i1,	%l1,	%g4
	set	0x30, %g5
	lda	[%l7 + %g5] 0x80,	%f15
loop_1009:
	edge8	%o1,	%o6,	%i6
	sub	%g3,	0x0906,	%o4
	movcs	%xcc,	%l6,	%i0
	fmovs	%f17,	%f7
	wr	%g0,	0x81,	%asi
	stwa	%l3,	[%l7 + 0x44] %asi
	set	0x51, %o4
	ldsba	[%l7 + %o4] 0x89,	%i4
	orn	%i3,	0x04E9,	%i2
	and	%g1,	0x1DD7,	%o2
	movrgz	%i5,	%g6,	%l4
	edge32n	%o0,	%g5,	%i7
	membar	0x19
	set	0x40, %i0
	stwa	%l0,	[%l7 + %i0] 0x04
	bleu,a	loop_1010
	mova	%xcc,	%o7,	%l2
	set	0x58, %o7
	stwa	%l5,	[%l7 + %o7] 0x19
loop_1010:
	udivcc	%o3,	0x061F,	%o5
	smulcc	%g2,	0x05FF,	%i1
	fpsub32	%f26,	%f30,	%f8
	set	0x4C, %g3
	sta	%f21,	[%l7 + %g3] 0x18
	array8	%l1,	%g7,	%g4
	tne	%xcc,	0x1
	fpadd16s	%f14,	%f19,	%f24
	tsubcctv	%o6,	0x0F70,	%o1
	movcc	%icc,	%i6,	%o4
	movpos	%icc,	%g3,	%i0
	tcc	%icc,	0x2
	nop
	setx	0x7DF7A372F056EF10,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movrne	%l3,	0x1BA,	%i4
	set	0x1F, %i5
	stba	%l6,	[%l7 + %i5] 0x04
	movleu	%icc,	%i2,	%i3
	udiv	%o2,	0x196B,	%i5
	tsubcc	%g1,	%g6,	%l4
	sub	%o0,	%g5,	%i7
	set	0x6C, %l6
	stha	%l0,	[%l7 + %l6] 0x2a
	membar	#Sync
	movre	%o7,	0x1EE,	%l2
	edge16l	%l5,	%o3,	%o5
	umul	%g2,	%l1,	%g7
	fmovsgu	%xcc,	%f25,	%f19
	tcc	%xcc,	0x1
	swap	[%l7 + 0x18],	%i1
	nop
	set	0x44, %i1
	prefetch	[%l7 + %i1],	 0x2
	fmovscs	%xcc,	%f10,	%f11
	prefetch	[%l7 + 0x70],	 0x1
	sdivcc	%g4,	0x1344,	%o1
	tl	%icc,	0x1
	fmovsg	%xcc,	%f29,	%f10
	orncc	%o6,	0x0AE7,	%o4
	array32	%g3,	%i6,	%l3
	bg,a,pt	%xcc,	loop_1011
	tleu	%icc,	0x7
	edge16	%i4,	%i0,	%l6
	ldx	[%l7 + 0x40],	%i3
loop_1011:
	be,pn	%icc,	loop_1012
	fmovrse	%i2,	%f30,	%f18
	fcmpeq16	%f10,	%f8,	%i5
	nop
	setx	loop_1013,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1012:
	fmovdcs	%xcc,	%f14,	%f30
	pdist	%f20,	%f14,	%f4
	set	0x74, %o1
	ldsha	[%l7 + %o1] 0x89,	%g1
loop_1013:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f6,	[%l7 + 0x2C] %asi
	fbe,a	%fcc2,	loop_1014
	xorcc	%o2,	0x02F1,	%l4
	andcc	%g6,	0x02F6,	%o0
	array8	%i7,	%l0,	%o7
loop_1014:
	edge32n	%l2,	%l5,	%g5
	nop
	set	0x78, %o6
	stx	%o5,	[%l7 + %o6]
	bpos,a,pt	%xcc,	loop_1015
	tsubcctv	%g2,	%l1,	%o3
	nop
	set	0x50, %o2
	stx	%i1,	[%l7 + %o2]
	fba,a	%fcc2,	loop_1016
loop_1015:
	movrne	%g7,	0x1F5,	%g4
	brlz,a	%o6,	loop_1017
	movrlez	%o1,	%o4,	%g3
loop_1016:
	sub	%l3,	%i4,	%i6
	movcs	%icc,	%i0,	%l6
loop_1017:
	tvs	%icc,	0x3
	tge	%icc,	0x1
	subc	%i3,	0x0BF3,	%i2
	movvs	%icc,	%i5,	%g1
	bl,a	%icc,	loop_1018
	taddcc	%o2,	%g6,	%o0
	movrgez	%l4,	0x158,	%l0
	tg	%icc,	0x2
loop_1018:
	edge32l	%i7,	%l2,	%l5
	add	%o7,	0x01E0,	%o5
	edge32n	%g2,	%g5,	%o3
	sdiv	%l1,	0x1674,	%g7
	bgu,a,pn	%xcc,	loop_1019
	edge8n	%g4,	%o6,	%i1
	mulx	%o1,	0x16CF,	%o4
	movgu	%icc,	%g3,	%i4
loop_1019:
	nop
	set	0x08, %i7
	lduwa	[%l7 + %i7] 0x14,	%i6
	movrne	%i0,	0x29D,	%l6
	movvc	%xcc,	%l3,	%i2
	brnz	%i5,	loop_1020
	umul	%i3,	%g1,	%o2
	sub	%o0,	0x06F7,	%l4
	edge32n	%g6,	%i7,	%l0
loop_1020:
	stb	%l2,	[%l7 + 0x19]
	stw	%o7,	[%l7 + 0x2C]
	fzero	%f28
	ba,a,pt	%xcc,	loop_1021
	fmul8x16au	%f4,	%f29,	%f12
	mulscc	%o5,	%l5,	%g5
	edge32	%o3,	%l1,	%g7
loop_1021:
	movvs	%icc,	%g4,	%g2
	movrne	%i1,	0x368,	%o6
	xor	%o4,	0x02EA,	%o1
	udivx	%i4,	0x0085,	%g3
	set	0x30, %g1
	lda	[%l7 + %g1] 0x15,	%f3
	tsubcctv	%i6,	%l6,	%l3
	nop
	setx loop_1022, %l0, %l1
	jmpl %l1, %i0
	movl	%xcc,	%i2,	%i3
	tleu	%xcc,	0x5
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x14,	%f16
loop_1022:
	umul	%i5,	%o2,	%g1
	edge8n	%o0,	%l4,	%i7
	set	0x52, %l5
	lduha	[%l7 + %l5] 0x19,	%l0
	movpos	%xcc,	%g6,	%o7
	membar	0x3F
	fbule,a	%fcc1,	loop_1023
	swap	[%l7 + 0x18],	%l2
	tsubcc	%l5,	%o5,	%o3
	nop
	setx	0xF8E61315FBE6601B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2A0A1BB0214D31AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f24,	%f4
loop_1023:
	umul	%g5,	%l1,	%g4
	tneg	%xcc,	0x6
	brnz,a	%g7,	loop_1024
	srlx	%g2,	%i1,	%o4
	movn	%xcc,	%o6,	%o1
	fmovsneg	%icc,	%f6,	%f14
loop_1024:
	fmovrdgez	%i4,	%f30,	%f10
	tne	%icc,	0x6
	bcc,a	%icc,	loop_1025
	or	%g3,	%l6,	%l3
	edge32ln	%i6,	%i0,	%i2
	fmul8sux16	%f24,	%f8,	%f6
loop_1025:
	edge16n	%i5,	%i3,	%g1
	fbuge	%fcc1,	loop_1026
	tneg	%icc,	0x7
	bleu,pn	%icc,	loop_1027
	edge8	%o2,	%l4,	%o0
loop_1026:
	sdiv	%l0,	0x1FDB,	%i7
	nop
	setx	0xBE6E01F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x44540435,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f13,	%f26
loop_1027:
	movge	%icc,	%g6,	%o7
	movcc	%xcc,	%l2,	%o5
	sdivcc	%o3,	0x17D0,	%l5
	fmovsvs	%xcc,	%f17,	%f11
	array8	%g5,	%g4,	%l1
	popc	0x1C67,	%g2
	sdivx	%g7,	0x049D,	%i1
	xnorcc	%o6,	%o1,	%o4
	xor	%g3,	0x0A42,	%l6
	move	%icc,	%l3,	%i4
	membar	0x69
	fmuld8ulx16	%f20,	%f6,	%f16
	fmovdgu	%xcc,	%f30,	%f13
	movg	%xcc,	%i0,	%i6
	movrne	%i2,	0x0E8,	%i3
	subc	%g1,	0x13F4,	%o2
	fabsd	%f14,	%f18
	movrlz	%i5,	%o0,	%l4
	edge8	%i7,	%g6,	%l0
	fmovdvs	%icc,	%f21,	%f26
	edge16l	%l2,	%o7,	%o5
	sth	%l5,	[%l7 + 0x36]
	movneg	%icc,	%g5,	%o3
	fcmpne32	%f30,	%f18,	%l1
	fpackfix	%f10,	%f29
	bne	loop_1028
	movcc	%xcc,	%g4,	%g2
	xor	%g7,	0x1A48,	%i1
	bne	loop_1029
loop_1028:
	brgez	%o6,	loop_1030
	tgu	%icc,	0x1
	te	%icc,	0x3
loop_1029:
	bcs,a	%xcc,	loop_1031
loop_1030:
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f30
	fbge	%fcc3,	loop_1032
	subccc	%o4,	%o1,	%l6
loop_1031:
	be,a	%xcc,	loop_1033
	tge	%xcc,	0x2
loop_1032:
	edge8ln	%g3,	%i4,	%i0
	xor	%l3,	%i6,	%i3
loop_1033:
	nop
	set	0x62, %l3
	lduba	[%l7 + %l3] 0x14,	%i2
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x12] %asi,	%o2
	edge32	%i5,	%o0,	%g1
	brlz,a	%i7,	loop_1034
	udivx	%l4,	0x09FC,	%g6
	fba	%fcc3,	loop_1035
	nop
	fitos	%f9,	%f24
	fstox	%f24,	%f30
loop_1034:
	udivx	%l2,	0x1DC5,	%l0
	fbuge	%fcc1,	loop_1036
loop_1035:
	sub	%o5,	0x12F3,	%o7
	fcmpne16	%f24,	%f4,	%l5
	movcs	%xcc,	%o3,	%g5
loop_1036:
	nop
	setx	loop_1037,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdne	%l1,	%f16,	%f24
	nop
	set	0x50, %o5
	lduw	[%l7 + %o5],	%g4
	fandnot1s	%f22,	%f25,	%f10
loop_1037:
	fors	%f21,	%f17,	%f22
	movneg	%xcc,	%g2,	%g7
	tleu	%icc,	0x4
	brgez,a	%i1,	loop_1038
	stb	%o4,	[%l7 + 0x13]
	tcc	%icc,	0x7
	movrgez	%o6,	%o1,	%g3
loop_1038:
	nop
	setx	0xE298EDC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x675A0A3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f1,	%f31
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x70] %asi,	%f8
	fmovsn	%xcc,	%f6,	%f31
	fornot1s	%f27,	%f10,	%f22
	fmovsvc	%icc,	%f30,	%f13
	movne	%xcc,	%l6,	%i0
	fmovd	%f16,	%f24
	edge32	%l3,	%i4,	%i6
	tne	%xcc,	0x7
	fbule,a	%fcc3,	loop_1039
	edge8l	%i3,	%o2,	%i2
	tn	%icc,	0x2
	be,a	%icc,	loop_1040
loop_1039:
	fbg	%fcc2,	loop_1041
	addc	%o0,	0x155C,	%i5
	movvc	%xcc,	%i7,	%g1
loop_1040:
	sethi	0x0F39,	%g6
loop_1041:
	fnot2	%f10,	%f14
	edge16n	%l4,	%l0,	%o5
	fmovdleu	%xcc,	%f2,	%f24
	tvs	%icc,	0x3
	sll	%l2,	%l5,	%o3
	srlx	%g5,	%l1,	%o7
	fmovsn	%xcc,	%f2,	%f7
	fsrc2	%f2,	%f14
	fbge,a	%fcc1,	loop_1042
	fmovsgu	%xcc,	%f8,	%f19
	wr	%g0,	0x18,	%asi
	stxa	%g4,	[%l7 + 0x18] %asi
loop_1042:
	array16	%g2,	%g7,	%o4
	addc	%i1,	0x083D,	%o6
	fcmpeq32	%f22,	%f16,	%o1
	movrgez	%l6,	%g3,	%i0
	ldd	[%l7 + 0x38],	%l2
	fcmpgt32	%f22,	%f8,	%i4
	fsrc2	%f28,	%f2
	or	%i6,	%i3,	%o2
	fmovdvs	%xcc,	%f11,	%f9
	fand	%f28,	%f20,	%f20
	subc	%i2,	%o0,	%i7
	popc	0x0DEB,	%g1
	tg	%xcc,	0x6
	movvc	%icc,	%g6,	%l4
	fmovrdgez	%l0,	%f22,	%f26
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x62] %asi,	%i5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%o5
	tcs	%icc,	0x7
	movle	%xcc,	%o3,	%l5
	edge32ln	%g5,	%l1,	%g4
	ldsb	[%l7 + 0x3F],	%o7
	edge16ln	%g2,	%o4,	%g7
	fpmerge	%f7,	%f28,	%f18
	tleu	%icc,	0x0
	subccc	%o6,	%o1,	%l6
	edge16ln	%i1,	%i0,	%g3
	nop
	setx	0x37A58A46,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x2749E561,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f28,	%f0
	fbge	%fcc1,	loop_1043
	tgu	%icc,	0x7
	ldstub	[%l7 + 0x3E],	%l3
	andn	%i6,	0x1BC5,	%i3
loop_1043:
	tleu	%xcc,	0x0
	sll	%o2,	0x0C,	%i2
	fpadd32	%f4,	%f4,	%f28
	movcs	%xcc,	%o0,	%i4
	movpos	%icc,	%g1,	%i7
	add	%l4,	0x0A17,	%l0
	tcc	%xcc,	0x4
	movl	%xcc,	%g6,	%i5
	nop
	setx	loop_1044,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%o5,	%l2,	%o3
	brgz	%g5,	loop_1045
	srax	%l1,	0x0E,	%l5
loop_1044:
	tn	%xcc,	0x6
	xorcc	%o7,	%g4,	%g2
loop_1045:
	pdist	%f2,	%f12,	%f30
	fbo,a	%fcc0,	loop_1046
	movrgez	%o4,	0x243,	%g7
	ldsw	[%l7 + 0x30],	%o6
	bgu,pt	%xcc,	loop_1047
loop_1046:
	edge32ln	%o1,	%i1,	%l6
	fpsub32s	%f1,	%f28,	%f13
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i0
loop_1047:
	add	%g3,	%i6,	%l3
	array8	%o2,	%i2,	%o0
	ldstub	[%l7 + 0x2C],	%i4
	movg	%xcc,	%g1,	%i3
	xor	%i7,	0x056F,	%l0
	fmovsvs	%icc,	%f20,	%f16
	edge32l	%l4,	%i5,	%o5
	xnorcc	%g6,	0x1C3E,	%l2
	nop
	setx	0x01E7173C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xC2172884,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f23,	%f5
	ldub	[%l7 + 0x67],	%g5
	fors	%f20,	%f15,	%f24
	sra	%l1,	0x06,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l5,	%o7,	%g4
	tg	%xcc,	0x4
	ld	[%l7 + 0x34],	%f31
	alignaddr	%o4,	%g7,	%o6
	alignaddr	%g2,	%o1,	%i1
	fmovdl	%icc,	%f3,	%f29
	movgu	%icc,	%l6,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a,pt	%icc,	loop_1048
	tneg	%xcc,	0x5
	nop
	fitos	%f9,	%f26
	fstod	%f26,	%f12
	move	%icc,	%i6,	%l3
loop_1048:
	movn	%icc,	%o2,	%i2
	sll	%o0,	0x06,	%i0
	fpadd16s	%f13,	%f9,	%f24
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x70] %asi,	%i4
	edge8l	%i3,	%i7,	%g1
	addccc	%l0,	%l4,	%i5
	movle	%xcc,	%o5,	%g6
	bg,a	loop_1049
	srax	%l2,	0x16,	%l1
	tl	%xcc,	0x6
	srl	%g5,	0x17,	%o3
loop_1049:
	sub	%l5,	0x0A5E,	%o7
	fble,a	%fcc2,	loop_1050
	fmul8x16	%f27,	%f26,	%f26
	fbn	%fcc2,	loop_1051
	faligndata	%f10,	%f24,	%f16
loop_1050:
	xnor	%o4,	%g4,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1051:
	fpack32	%f10,	%f4,	%f12
	std	%f18,	[%l7 + 0x40]
	sir	0x017B
	edge8ln	%g2,	%o6,	%o1
	bge,pn	%xcc,	loop_1052
	brz,a	%l6,	loop_1053
	alignaddrl	%g3,	%i1,	%l3
	edge8ln	%i6,	%o2,	%i2
loop_1052:
	fmovdge	%icc,	%f8,	%f14
loop_1053:
	fcmple16	%f24,	%f14,	%o0
	membar	0x22
	movrne	%i0,	%i4,	%i7
	sub	%i3,	%g1,	%l0
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x11
	fbn,a	%fcc3,	loop_1054
	fand	%f16,	%f18,	%f2
	mulscc	%l4,	%o5,	%i5
	fornot1s	%f7,	%f5,	%f9
loop_1054:
	fmuld8sux16	%f19,	%f2,	%f28
	andn	%g6,	0x0AB8,	%l1
	fmovdg	%icc,	%f20,	%f8
	fpadd16	%f16,	%f22,	%f28
	andn	%g5,	0x0EFA,	%o3
	mova	%icc,	%l5,	%l2
	bvc,a,pt	%icc,	loop_1055
	fmuld8sux16	%f14,	%f21,	%f10
	sethi	0x1330,	%o4
	wr	%g0,	0x52,	%asi
	stxa	%o7,	[%g0 + 0x108] %asi
loop_1055:
	orn	%g7,	0x0A6B,	%g2
	subccc	%g4,	%o6,	%o1
	popc	%g3,	%l6
	sdiv	%l3,	0x1F8A,	%i1
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	brlez,a	%o2,	loop_1056
	brgez	%i2,	loop_1057
	mulscc	%o0,	0x017A,	%i0
	orn	%i4,	%i7,	%i6
loop_1056:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x21] %asi,	%i3
loop_1057:
	edge8n	%g1,	%l4,	%l0
	nop
	setx	loop_1058,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ble,a,pt	%icc,	loop_1059
	tcs	%icc,	0x2
	tpos	%xcc,	0x7
loop_1058:
	fble	%fcc2,	loop_1060
loop_1059:
	movl	%xcc,	%i5,	%o5
	ldsh	[%l7 + 0x5A],	%l1
	tvc	%icc,	0x2
loop_1060:
	movre	%g5,	0x024,	%g6
	array16	%l5,	%l2,	%o4
	ldsw	[%l7 + 0x4C],	%o7
	membar	0x4B
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
	fmovrdgez	%o3,	%f8,	%f0
	fxors	%f9,	%f21,	%f18
	tvs	%xcc,	0x4
loop_1061:
	fxors	%f9,	%f31,	%f29
	popc	0x1000,	%g2
	subcc	%g7,	0x175E,	%g4
	movrlez	%o6,	%g3,	%l6
	fbul,a	%fcc1,	loop_1062
	popc	0x0021,	%l3
	brlz,a	%o1,	loop_1063
	edge8ln	%i1,	%i2,	%o0
loop_1062:
	sll	%i0,	%i4,	%i7
	edge8	%o2,	%i3,	%i6
loop_1063:
	array8	%g1,	%l0,	%i5
	bvs,pn	%xcc,	loop_1064
	brgez,a	%l4,	loop_1065
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f28
	alignaddrl	%l1,	%o5,	%g6
loop_1064:
	nop
	set	0x25, %o0
	stba	%l5,	[%l7 + %o0] 0x23
	membar	#Sync
loop_1065:
	nop
	set	0x64, %l1
	stwa	%g5,	[%l7 + %l1] 0x14
	fpsub32	%f2,	%f4,	%f18
	ta	%xcc,	0x6
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x18
	fmovdcs	%xcc,	%f25,	%f30
	edge8ln	%l2,	%o7,	%o3
	set	0x38, %g6
	ldxa	[%l7 + %g6] 0x81,	%g2
	fxnors	%f29,	%f31,	%f15
	movrgez	%o4,	%g4,	%g7
	fands	%f27,	%f1,	%f6
	tg	%icc,	0x7
	fmovrdne	%g3,	%f2,	%f0
	movvc	%icc,	%o6,	%l3
	subcc	%o1,	0x0D07,	%l6
	fbl,a	%fcc1,	loop_1066
	fmovsne	%icc,	%f14,	%f5
	te	%icc,	0x2
	addcc	%i2,	%i1,	%o0
loop_1066:
	nop
	setx	0xF0607AA0,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	prefetch	[%l7 + 0x78],	 0x0
	tcc	%xcc,	0x4
	tge	%icc,	0x2
	array8	%i0,	%i4,	%i7
	andcc	%i3,	%o2,	%g1
	sir	0x16C4
	stx	%i6,	[%l7 + 0x08]
	srl	%i5,	0x0E,	%l0
	xnorcc	%l4,	0x1FD7,	%l1
	movrgz	%o5,	0x259,	%g6
	movvc	%icc,	%l5,	%l2
	fmovscc	%icc,	%f14,	%f24
	bvc,a,pt	%xcc,	loop_1067
	nop
	setx	0xF4E0979FF5781D49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f14
	edge32l	%g5,	%o7,	%o3
	sllx	%g2,	%g4,	%o4
loop_1067:
	orncc	%g3,	0x0907,	%o6
	subcc	%l3,	0x17B9,	%g7
	membar	0x23
	sllx	%l6,	0x1C,	%o1
	array16	%i1,	%o0,	%i0
	umul	%i4,	0x0A44,	%i7
	fmovse	%icc,	%f16,	%f29
	andncc	%i2,	%i3,	%o2
	sdiv	%i6,	0x04CF,	%i5
	orcc	%g1,	0x1113,	%l0
	xorcc	%l1,	%o5,	%g6
	sllx	%l4,	%l2,	%l5
	xnor	%o7,	%g5,	%g2
	ldx	[%l7 + 0x48],	%o3
	fbne	%fcc1,	loop_1068
	brgz,a	%o4,	loop_1069
	fbg	%fcc3,	loop_1070
	be,a,pt	%icc,	loop_1071
loop_1068:
	ble,pt	%xcc,	loop_1072
loop_1069:
	fmovrde	%g3,	%f16,	%f22
loop_1070:
	fmovrslez	%o6,	%f6,	%f14
loop_1071:
	membar	0x33
loop_1072:
	fmovdvs	%xcc,	%f24,	%f1
	mulx	%g4,	0x13AA,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x001D0445,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f10
	fmovrdlez	%l6,	%f18,	%f26
	sethi	0x1472,	%g7
	srlx	%o1,	0x0D,	%i1
	ldd	[%l7 + 0x48],	%f12
	fbe	%fcc1,	loop_1073
	ta	%xcc,	0x6
	fones	%f3
	brgz	%i0,	loop_1074
loop_1073:
	orn	%i4,	%i7,	%i2
	subc	%o0,	0x0C97,	%o2
	bneg,a	%icc,	loop_1075
loop_1074:
	tsubcc	%i3,	0x0264,	%i5
	wr	%g0,	0x04,	%asi
	stxa	%g1,	[%l7 + 0x60] %asi
loop_1075:
	fmovs	%f24,	%f27
	nop
	setx loop_1076, %l0, %l1
	jmpl %l1, %l0
	popc	0x1DE8,	%i6
	fnegs	%f3,	%f3
	fsrc1	%f12,	%f12
loop_1076:
	ld	[%l7 + 0x08],	%f14
	movvc	%icc,	%o5,	%g6
	bcs,a,pn	%icc,	loop_1077
	tsubcctv	%l1,	%l2,	%l4
	popc	%l5,	%g5
	move	%icc,	%g2,	%o7
loop_1077:
	orn	%o3,	%o4,	%g3
	edge32	%o6,	%g4,	%l6
	tsubcctv	%g7,	%l3,	%o1
	xor	%i0,	0x0892,	%i4
	xnor	%i7,	0x08E7,	%i1
	sub	%i2,	%o0,	%i3
	ldub	[%l7 + 0x4A],	%i5
	bpos,a	loop_1078
	fmovdl	%icc,	%f25,	%f29
	edge8n	%o2,	%l0,	%i6
	fmovdgu	%icc,	%f2,	%f3
loop_1078:
	fba	%fcc3,	loop_1079
	edge8l	%g1,	%g6,	%o5
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
	fmovsle	%icc,	%f27,	%f22
loop_1079:
	tvs	%xcc,	0x0
	edge16	%l1,	%l4,	%l2
loop_1080:
	udivx	%g5,	0x19B6,	%l5
	fone	%f24
	brnz	%o7,	loop_1081
	addc	%g2,	%o4,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o6,	%o3
loop_1081:
	nop
	setx	0x2E2A9F677C80A5FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x235B5244D18CE7ED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f14,	%f28
	movrgz	%g4,	%l6,	%l3
	te	%icc,	0x3
	edge32n	%o1,	%g7,	%i0
	edge32n	%i4,	%i1,	%i7
	lduw	[%l7 + 0x54],	%i2
	movrgz	%o0,	0x177,	%i3
	fmovsgu	%xcc,	%f8,	%f13
	addcc	%o2,	%i5,	%i6
	smul	%l0,	0x1874,	%g1
	addcc	%o5,	%l1,	%l4
	fbn,a	%fcc3,	loop_1082
	edge32l	%g6,	%g5,	%l2
	orcc	%l5,	0x04B0,	%o7
	fmuld8ulx16	%f17,	%f24,	%f18
loop_1082:
	fbule,a	%fcc3,	loop_1083
	tcc	%icc,	0x0
	set	0x20, %i4
	lduwa	[%l7 + %i4] 0x15,	%o4
loop_1083:
	movle	%xcc,	%g2,	%g3
	array16	%o3,	%g4,	%l6
	fbuge	%fcc0,	loop_1084
	nop
	setx	0xD2259D6C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f1
	and	%l3,	0x193A,	%o6
	sub	%g7,	%i0,	%i4
loop_1084:
	fble	%fcc2,	loop_1085
	movle	%icc,	%i1,	%i7
	movvs	%icc,	%o1,	%i2
	ldsw	[%l7 + 0x7C],	%i3
loop_1085:
	movrgez	%o0,	%i5,	%i6
	andncc	%l0,	%o2,	%o5
	fxnors	%f27,	%f16,	%f19
	tcs	%xcc,	0x1
	movre	%l1,	0x0C1,	%l4
	fpsub32	%f24,	%f24,	%f0
	edge8n	%g6,	%g5,	%l2
	membar	0x0C
	fmul8x16al	%f5,	%f12,	%f22
	or	%g1,	0x110C,	%o7
	nop
	setx	0x0046A116,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fpmerge	%f31,	%f23,	%f30
	fbuge	%fcc3,	loop_1086
	nop
	setx	0x7069916F,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	stw	%l5,	[%l7 + 0x70]
	movrgz	%o4,	0x2B7,	%g3
loop_1086:
	ldsb	[%l7 + 0x1B],	%g2
	fxnors	%f31,	%f4,	%f16
	flush	%l7 + 0x28
	fba	%fcc0,	loop_1087
	alignaddrl	%g4,	%l6,	%o3
	tge	%xcc,	0x0
	set	0x20, %g2
	sta	%f22,	[%l7 + %g2] 0x81
loop_1087:
	fmovdge	%icc,	%f30,	%f31
	movne	%xcc,	%l3,	%o6
	xnorcc	%i0,	%g7,	%i4
	movl	%icc,	%i7,	%i1
	tcs	%xcc,	0x0
	set	0x78, %g4
	lduba	[%l7 + %g4] 0x14,	%o1
	bl,a	loop_1088
	edge32	%i2,	%o0,	%i3
	fnot1	%f4,	%f0
	tg	%icc,	0x5
loop_1088:
	fandnot1	%f20,	%f14,	%f20
	xnor	%i6,	%i5,	%l0
	ta	%xcc,	0x5
	fpsub16	%f8,	%f26,	%f4
	edge32n	%o2,	%o5,	%l1
	addcc	%g6,	0x1E29,	%l4
	tleu	%xcc,	0x4
	movrgez	%l2,	%g1,	%o7
	bshuffle	%f6,	%f2,	%f4
	bcc	%icc,	loop_1089
	movvs	%icc,	%g5,	%o4
	lduh	[%l7 + 0x3C],	%g3
	fmul8x16al	%f9,	%f16,	%f22
loop_1089:
	edge16n	%g2,	%l5,	%l6
	tneg	%icc,	0x3
	tvc	%icc,	0x4
	fornot1	%f28,	%f28,	%f4
	fmovscs	%icc,	%f21,	%f21
	edge8l	%g4,	%o3,	%o6
	fmovrslz	%l3,	%f23,	%f26
	and	%g7,	%i0,	%i7
	taddcc	%i4,	%i1,	%i2
	fmovse	%icc,	%f14,	%f3
	orncc	%o0,	%i3,	%i6
	set	0x77, %o3
	ldstuba	[%l7 + %o3] 0x88,	%i5
	movn	%icc,	%o1,	%o2
	fnands	%f14,	%f15,	%f28
	fmovdne	%xcc,	%f3,	%f13
	brz,a	%l0,	loop_1090
	bgu,pt	%icc,	loop_1091
	fmovde	%icc,	%f9,	%f11
	umul	%l1,	0x17D5,	%g6
loop_1090:
	edge16n	%l4,	%l2,	%o5
loop_1091:
	bne	loop_1092
	fcmpeq16	%f28,	%f26,	%o7
	tneg	%xcc,	0x7
	fmovsneg	%icc,	%f15,	%f3
loop_1092:
	lduh	[%l7 + 0x72],	%g5
	tle	%icc,	0x5
	mova	%icc,	%o4,	%g1
	bneg,a	loop_1093
	or	%g3,	%g2,	%l6
	tcs	%xcc,	0x3
	sllx	%g4,	0x1B,	%l5
loop_1093:
	array32	%o6,	%o3,	%g7
	ldsb	[%l7 + 0x7C],	%l3
	taddcctv	%i0,	0x031C,	%i4
	movrgz	%i7,	0x073,	%i1
	sdivcc	%o0,	0x1D36,	%i3
	set	0x3E, %l2
	lduha	[%l7 + %l2] 0x81,	%i6
	fmovrsne	%i5,	%f14,	%f18
	be	%icc,	loop_1094
	edge16	%o1,	%i2,	%o2
	set	0x0C, %i6
	lduha	[%l7 + %i6] 0x80,	%l0
loop_1094:
	and	%g6,	%l4,	%l2
	fmovsge	%xcc,	%f27,	%f24
	orcc	%l1,	%o5,	%g5
	ldsw	[%l7 + 0x30],	%o4
	alignaddr	%g1,	%o7,	%g3
	edge32ln	%l6,	%g2,	%g4
	tcc	%icc,	0x0
	movgu	%xcc,	%o6,	%o3
	edge32l	%g7,	%l3,	%l5
	movge	%xcc,	%i4,	%i7
	fandnot1s	%f22,	%f11,	%f17
	movne	%icc,	%i1,	%o0
	sdiv	%i0,	0x1F9F,	%i3
	membar	0x43
	udiv	%i5,	0x1B1A,	%o1
	fandnot1s	%f7,	%f30,	%f18
	edge8l	%i2,	%o2,	%i6
	fmovsg	%icc,	%f11,	%f16
	add	%l0,	%g6,	%l4
	bl	%icc,	loop_1095
	brz,a	%l1,	loop_1096
	umulcc	%o5,	%l2,	%o4
	orn	%g5,	%o7,	%g1
loop_1095:
	edge32n	%g3,	%l6,	%g4
loop_1096:
	xor	%o6,	0x0745,	%o3
	ldx	[%l7 + 0x50],	%g2
	set	0x08, %g7
	sta	%f12,	[%l7 + %g7] 0x88
	edge32ln	%g7,	%l3,	%l5
	taddcc	%i7,	0x0789,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	fcmple16	%f26,	%f4,	%o0
	xorcc	%i4,	%i0,	%i3
	brgz,a	%i5,	loop_1097
	tl	%xcc,	0x4
	subcc	%i2,	%o1,	%i6
	fba,a	%fcc0,	loop_1098
loop_1097:
	movrgez	%o2,	%l0,	%g6
	bgu,a	loop_1099
	bcs	loop_1100
loop_1098:
	fbug	%fcc1,	loop_1101
	nop
	setx	0xC039051B50639FC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
loop_1099:
	tl	%icc,	0x3
loop_1100:
	edge16l	%l4,	%l1,	%l2
loop_1101:
	fcmpgt16	%f12,	%f30,	%o4
	sub	%g5,	0x1DBA,	%o5
	ble,a	%icc,	loop_1102
	bneg	%icc,	loop_1103
	nop
	set	0x1C, %o4
	lduw	[%l7 + %o4],	%g1
	fmovsleu	%icc,	%f27,	%f6
loop_1102:
	tcs	%xcc,	0x0
loop_1103:
	fmovrdgez	%o7,	%f26,	%f4
	fmul8x16au	%f4,	%f23,	%f8
	sdivx	%l6,	0x1F39,	%g3
	edge8l	%o6,	%g4,	%o3
	stx	%g2,	[%l7 + 0x08]
	array16	%l3,	%g7,	%l5
	fsrc2s	%f4,	%f9
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x20] %asi,	%f27
	tcc	%xcc,	0x5
	and	%i1,	0x0793,	%o0
	nop
	setx	0x4F14A334453BAE6B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f30
	alignaddr	%i4,	%i0,	%i3
	edge8	%i5,	%i2,	%i7
	ta	%xcc,	0x7
	set	0x10, %i0
	prefetcha	[%l7 + %i0] 0x14,	 0x2
	popc	0x0169,	%i6
	stx	%o2,	[%l7 + 0x60]
	fandnot2	%f14,	%f26,	%f26
	alignaddrl	%g6,	%l0,	%l1
	tvc	%xcc,	0x5
	add	%l4,	0x1A4B,	%o4
	set	0x3E, %o7
	lduha	[%l7 + %o7] 0x10,	%l2
	ldub	[%l7 + 0x48],	%o5
	edge8	%g5,	%g1,	%o7
	tpos	%icc,	0x6
	movle	%xcc,	%l6,	%g3
	nop
	setx	0x38164E5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x78BC80AE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f30,	%f2
	nop
	setx loop_1104, %l0, %l1
	jmpl %l1, %g4
	smulcc	%o3,	0x05EB,	%g2
	xor	%o6,	%l3,	%l5
	or	%g7,	0x1AD6,	%o0
loop_1104:
	ble,a	%xcc,	loop_1105
	nop
	setx	0xD7EAFA40262628D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x60503D0F5C3E768F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f10,	%f4
	fmovde	%icc,	%f7,	%f14
	sllx	%i1,	0x17,	%i4
loop_1105:
	fors	%f21,	%f28,	%f28
	set	0x2C, %g5
	swapa	[%l7 + %g5] 0x04,	%i3
	andn	%i0,	%i5,	%i2
	ldub	[%l7 + 0x28],	%o1
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x28] %asi,	%i6
	ba,pt	%xcc,	loop_1106
	umul	%o2,	0x1751,	%i7
	addc	%g6,	0x1A45,	%l0
	fmovda	%icc,	%f31,	%f29
loop_1106:
	edge8l	%l4,	%l1,	%l2
	bshuffle	%f8,	%f16,	%f0
	tvc	%xcc,	0x2
	tpos	%icc,	0x5
	array32	%o4,	%o5,	%g1
	movl	%icc,	%o7,	%l6
	subccc	%g3,	0x0052,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g5,	%g2,	%o3
	srlx	%l3,	%l5,	%o6
	orncc	%o0,	0x0C81,	%i1
	membar	0x6F
	ldstub	[%l7 + 0x55],	%g7
	umulcc	%i3,	0x1949,	%i4
	edge8ln	%i5,	%i2,	%i0
	bleu,pn	%icc,	loop_1107
	smul	%i6,	%o2,	%i7
	fxnors	%f1,	%f11,	%f30
	movle	%xcc,	%o1,	%l0
loop_1107:
	brgez,a	%g6,	loop_1108
	array32	%l4,	%l2,	%l1
	sll	%o4,	%g1,	%o7
	fbu,a	%fcc1,	loop_1109
loop_1108:
	movn	%icc,	%l6,	%o5
	fandnot2	%f24,	%f6,	%f20
	fmovrslez	%g4,	%f29,	%f29
loop_1109:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn	%fcc3,	loop_1110
	fpmerge	%f20,	%f20,	%f2
	fbuge	%fcc1,	loop_1111
	fnor	%f6,	%f14,	%f26
loop_1110:
	movvs	%icc,	%g3,	%g2
	edge8n	%o3,	%g5,	%l3
loop_1111:
	mulx	%l5,	0x0724,	%o6
	movrne	%o0,	%g7,	%i3
	movrgz	%i1,	%i5,	%i4
	bg,pn	%xcc,	loop_1112
	te	%xcc,	0x6
	fpadd32s	%f27,	%f4,	%f24
	fxors	%f5,	%f9,	%f10
loop_1112:
	fbule,a	%fcc2,	loop_1113
	fpackfix	%f10,	%f6
	ta	%xcc,	0x6
	ld	[%l7 + 0x54],	%f6
loop_1113:
	subcc	%i0,	0x12D3,	%i2
	addcc	%i6,	%i7,	%o1
	tcc	%xcc,	0x6
	tle	%xcc,	0x4
	srax	%l0,	0x19,	%g6
	fmovspos	%xcc,	%f31,	%f28
	movre	%l4,	%l2,	%l1
	fabss	%f22,	%f5
	movrlez	%o2,	%g1,	%o4
	udivx	%l6,	0x1C6D,	%o7
	mova	%icc,	%o5,	%g4
	fmovrslz	%g2,	%f16,	%f5
	udiv	%o3,	0x1941,	%g5
	fabss	%f20,	%f17
	bn,pt	%icc,	loop_1114
	sethi	0x1B4F,	%g3
	andn	%l5,	%l3,	%o0
	set	0x30, %g3
	ldda	[%l7 + %g3] 0x89,	%o6
loop_1114:
	bge	loop_1115
	bg	%xcc,	loop_1116
	fmovrsgz	%g7,	%f14,	%f21
	set	0x64, %l6
	ldswa	[%l7 + %l6] 0x19,	%i3
loop_1115:
	ldstub	[%l7 + 0x1F],	%i1
loop_1116:
	orncc	%i4,	0x1C6F,	%i0
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i5
	smul	%i6,	0x0DA4,	%i7
	fmuld8ulx16	%f21,	%f13,	%f8
	subccc	%o1,	%i2,	%g6
	xorcc	%l4,	%l0,	%l1
	tge	%xcc,	0x7
	fmovde	%icc,	%f24,	%f4
	fmovdcs	%icc,	%f4,	%f27
	bleu	%xcc,	loop_1117
	fornot1s	%f27,	%f12,	%f30
	fmovrsgz	%l2,	%f7,	%f12
	bneg	%icc,	loop_1118
loop_1117:
	fmovsvs	%icc,	%f26,	%f20
	fmovscc	%icc,	%f31,	%f8
	orncc	%g1,	0x1129,	%o4
loop_1118:
	subccc	%l6,	0x1A3A,	%o2
	mulx	%o5,	%g4,	%o7
	fble	%fcc3,	loop_1119
	bn,a,pt	%xcc,	loop_1120
	fblg	%fcc1,	loop_1121
	fmovscc	%xcc,	%f9,	%f6
loop_1119:
	xnor	%o3,	%g5,	%g3
loop_1120:
	nop
	fitod	%f2,	%f30
	fdtos	%f30,	%f8
loop_1121:
	sdivx	%g2,	0x04E3,	%l5
	fmovrdgez	%o0,	%f2,	%f16
	tvs	%xcc,	0x1
	edge32l	%o6,	%l3,	%i3
	fbg	%fcc1,	loop_1122
	fmovdvc	%icc,	%f18,	%f19
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x50] %asi,	%i1
loop_1122:
	edge16	%g7,	%i4,	%i5
	addccc	%i0,	%i7,	%o1
	set	0x13, %i1
	stba	%i2,	[%l7 + %i1] 0xea
	membar	#Sync
	edge32ln	%i6,	%l4,	%g6
	ta	%icc,	0x7
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f28
	fxtod	%f28,	%f28
	movge	%icc,	%l1,	%l2
	edge16l	%l0,	%g1,	%l6
	fmovrslez	%o2,	%f7,	%f19
	mulx	%o4,	0x1D40,	%g4
	sll	%o7,	0x0B,	%o3
	fpsub32	%f6,	%f6,	%f12
	edge16ln	%o5,	%g3,	%g5
	ldd	[%l7 + 0x60],	%f6
	edge8	%g2,	%l5,	%o6
	addcc	%o0,	%i3,	%i1
	bcs,a	loop_1123
	edge16ln	%l3,	%i4,	%g7
	edge16	%i0,	%i5,	%o1
	fmul8x16	%f26,	%f6,	%f30
loop_1123:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x80,	%i2,	%i6
	fmovsn	%xcc,	%f23,	%f5
	stw	%l4,	[%l7 + 0x08]
	mova	%icc,	%g6,	%i7
	movle	%icc,	%l2,	%l1
	fmovrsne	%g1,	%f31,	%f14
	xnorcc	%l6,	0x1912,	%o2
	movleu	%icc,	%o4,	%g4
	set	0x3A, %o1
	stba	%o7,	[%l7 + %o1] 0xeb
	membar	#Sync
	fbue,a	%fcc3,	loop_1124
	fmovde	%xcc,	%f30,	%f23
	tgu	%icc,	0x6
	sdiv	%o3,	0x1348,	%o5
loop_1124:
	edge32n	%l0,	%g3,	%g2
	movpos	%icc,	%g5,	%o6
	fmovdne	%icc,	%f16,	%f10
	tleu	%xcc,	0x3
	fmovsg	%xcc,	%f10,	%f12
	nop
	setx	0x70178A5779BFCB10,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xEF1DB84E8E5358B3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f4,	%f14
	bl	loop_1125
	fmovdneg	%icc,	%f6,	%f8
	fbe,a	%fcc1,	loop_1126
	tvs	%xcc,	0x3
loop_1125:
	nop
	setx	0xEC7ADFA8951F4F2F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x1220D4FA2FC5D927,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f4,	%f14
	addccc	%o0,	%l5,	%i1
loop_1126:
	edge8n	%i3,	%i4,	%l3
	movrne	%i0,	0x0BE,	%i5
	addc	%o1,	0x09B8,	%i2
	sdivcc	%g7,	0x1523,	%i6
	edge32	%g6,	%l4,	%i7
	movrne	%l2,	0x165,	%l1
	bcc,pn	%xcc,	loop_1127
	or	%g1,	0x1561,	%l6
	sll	%o2,	%o4,	%g4
	pdist	%f24,	%f20,	%f14
loop_1127:
	nop
	set	0x5D, %o6
	ldsb	[%l7 + %o6],	%o3
	ldsw	[%l7 + 0x58],	%o5
	tsubcc	%l0,	%o7,	%g2
	edge16ln	%g3,	%o6,	%g5
	bvc,a	loop_1128
	fcmpgt16	%f2,	%f26,	%o0
	movne	%icc,	%l5,	%i1
	edge32n	%i3,	%l3,	%i0
loop_1128:
	fmovs	%f30,	%f5
	taddcctv	%i5,	0x18C5,	%o1
	edge8	%i4,	%i2,	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%l4
	brlez	%i6,	loop_1129
	fmul8sux16	%f6,	%f28,	%f6
	fxnor	%f4,	%f28,	%f6
	xorcc	%i7,	0x0E82,	%l2
loop_1129:
	xnor	%g1,	0x0E14,	%l1
	orcc	%o2,	0x0DBD,	%l6
	tl	%icc,	0x3
	nop
	setx	0x7BF43CB5A7EE35A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x241B05729CB8466A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f24,	%f0
	wr	%g0,	0xe3,	%asi
	stba	%g4,	[%l7 + 0x59] %asi
	membar	#Sync
	tvs	%xcc,	0x6
	movcc	%icc,	%o4,	%o3
	bvc	%icc,	loop_1130
	movvc	%icc,	%o5,	%l0
	tsubcc	%g2,	0x165D,	%g3
	ta	%xcc,	0x5
loop_1130:
	fbg	%fcc2,	loop_1131
	fcmpgt16	%f0,	%f26,	%o6
	subc	%g5,	0x1FEA,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1131:
	movrne	%o7,	%l5,	%i1
	fxors	%f17,	%f31,	%f28
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%l3
	mulx	%i3,	%i5,	%o1
	subc	%i0,	%i2,	%g7
	tne	%xcc,	0x4
	fandnot2	%f2,	%f10,	%f4
	fnot2s	%f27,	%f15
	fmovse	%xcc,	%f0,	%f25
	set	0x2C, %i5
	stwa	%g6,	[%l7 + %i5] 0x18
	movvc	%xcc,	%i4,	%l4
	movneg	%xcc,	%i7,	%i6
	fmovrdgz	%g1,	%f10,	%f16
	sllx	%l1,	%l2,	%o2
	tg	%icc,	0x4
	fcmpgt32	%f4,	%f30,	%g4
	xnor	%l6,	0x0D9C,	%o3
	sllx	%o4,	0x16,	%l0
	srl	%o5,	0x0D,	%g3
	fcmpgt32	%f2,	%f12,	%g2
	tg	%icc,	0x7
	edge32	%g5,	%o0,	%o7
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	wr	%g0,	0x89,	%asi
	stha	%l5,	[%l7 + 0x5E] %asi
	srlx	%i1,	0x02,	%o6
	fandnot1	%f26,	%f18,	%f0
	fpack16	%f28,	%f3
	fbl	%fcc0,	loop_1132
	fzero	%f22
	or	%l3,	%i3,	%i5
	fbne,a	%fcc3,	loop_1133
loop_1132:
	tpos	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f13,	%f8
loop_1133:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%i0
	fcmple16	%f18,	%f10,	%i2
	mova	%xcc,	%g7,	%g6
	fbug	%fcc1,	loop_1134
	nop
	set	0x1A, %i7
	ldstub	[%l7 + %i7],	%o1
	tcc	%xcc,	0x7
	movvs	%icc,	%l4,	%i4
loop_1134:
	tpos	%xcc,	0x6
	orcc	%i7,	%i6,	%g1
	tl	%xcc,	0x7
	sll	%l2,	%o2,	%l1
	ldsh	[%l7 + 0x22],	%l6
	tcs	%icc,	0x7
	popc	0x152C,	%g4
	sub	%o4,	%o3,	%l0
	nop
	setx	0x189B8D50,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x5DBCB3B7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f14,	%f23
	or	%o5,	%g3,	%g5
	movne	%icc,	%g2,	%o0
	movn	%icc,	%o7,	%l5
	nop
	set	0x48, %o2
	ldsw	[%l7 + %o2],	%i1
	tg	%icc,	0x2
	mulscc	%o6,	0x0D96,	%l3
	bl,a	loop_1135
	movneg	%xcc,	%i3,	%i0
	bcc,pn	%xcc,	loop_1136
	fnot2	%f14,	%f24
loop_1135:
	movleu	%icc,	%i5,	%i2
	alignaddr	%g6,	%o1,	%l4
loop_1136:
	movle	%icc,	%i4,	%g7
	edge8ln	%i7,	%g1,	%i6
	fbu	%fcc0,	loop_1137
	tgu	%xcc,	0x3
	movrlez	%o2,	%l2,	%l1
	andn	%g4,	%l6,	%o3
loop_1137:
	fmovrsne	%o4,	%f5,	%f22
	fcmpgt16	%f28,	%f28,	%o5
	taddcctv	%l0,	0x1480,	%g5
	fnot2s	%f30,	%f30
	nop
	setx	loop_1138,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%g3,	0x087C,	%g2
	or	%o7,	%o0,	%i1
	bvc,a,pt	%xcc,	loop_1139
loop_1138:
	alignaddrl	%o6,	%l5,	%l3
	subcc	%i3,	0x18C6,	%i5
	movrlez	%i2,	0x2AA,	%i0
loop_1139:
	bvs	%icc,	loop_1140
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g6,	%l4,	%o1
	movre	%g7,	%i4,	%i7
loop_1140:
	st	%f31,	[%l7 + 0x14]
	ble	%icc,	loop_1141
	bneg,pn	%icc,	loop_1142
	smul	%i6,	0x1801,	%o2
	nop
	setx	0x7C1CD6C16B3C44CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x7BDCC9D354363718,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f12,	%f12
loop_1141:
	fone	%f30
loop_1142:
	fble	%fcc2,	loop_1143
	movcc	%icc,	%g1,	%l2
	edge16ln	%l1,	%g4,	%l6
	fxnors	%f31,	%f0,	%f8
loop_1143:
	fblg	%fcc2,	loop_1144
	fbu	%fcc0,	loop_1145
	fandnot2	%f8,	%f2,	%f30
	nop
	setx	0x941E1404,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f22
loop_1144:
	tge	%xcc,	0x1
loop_1145:
	array8	%o4,	%o3,	%o5
	movrlz	%l0,	0x287,	%g3
	edge16n	%g5,	%o7,	%o0
	fmovsg	%icc,	%f5,	%f11
	tge	%icc,	0x0
	movl	%icc,	%g2,	%o6
	fmovsgu	%icc,	%f28,	%f25
	movrlz	%l5,	%l3,	%i3
	fcmple16	%f10,	%f28,	%i5
	fmovsneg	%xcc,	%f4,	%f30
	fandnot1	%f4,	%f2,	%f14
	nop
	setx	0x5B51A4FC3C22BA25,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x1E1D5D54A95EB94D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f8,	%f10
	tvc	%icc,	0x1
	edge8ln	%i1,	%i0,	%g6
	fmovrslez	%i2,	%f0,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f4,	%f23
	tneg	%icc,	0x7
	tvc	%xcc,	0x3
	fexpand	%f9,	%f20
	srax	%l4,	0x0F,	%o1
	movgu	%icc,	%g7,	%i7
	tvs	%icc,	0x2
	nop
	setx	0x95C77B27204381E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	tne	%icc,	0x3
	movre	%i4,	0x17F,	%i6
	fmovsvs	%icc,	%f3,	%f31
	array8	%o2,	%g1,	%l1
	ldstub	[%l7 + 0x0A],	%g4
	orncc	%l6,	%o4,	%l2
	fbule,a	%fcc2,	loop_1146
	swap	[%l7 + 0x10],	%o5
	fbul	%fcc1,	loop_1147
	udivx	%o3,	0x1248,	%l0
loop_1146:
	taddcc	%g5,	%o7,	%g3
	st	%f31,	[%l7 + 0x64]
loop_1147:
	bcc	%icc,	loop_1148
	tgu	%icc,	0x6
	fble	%fcc3,	loop_1149
	movrlez	%o0,	%o6,	%g2
loop_1148:
	tge	%xcc,	0x1
	xorcc	%l3,	0x1152,	%i3
loop_1149:
	fxnor	%f6,	%f22,	%f22
	andncc	%l5,	%i5,	%i1
	xor	%g6,	%i2,	%i0
	tne	%xcc,	0x6
	smulcc	%o1,	0x0E4D,	%l4
	edge16ln	%g7,	%i4,	%i7
	mulx	%o2,	0x0D97,	%i6
	for	%f20,	%f8,	%f0
	popc	0x0DDC,	%g1
	call	loop_1150
	nop
	fitos	%f1,	%f25
	fstox	%f25,	%f20
	te	%icc,	0x6
	edge32n	%l1,	%l6,	%g4
loop_1150:
	movle	%icc,	%l2,	%o5
	edge8	%o4,	%l0,	%o3
	fmovdvs	%xcc,	%f17,	%f4
	umul	%g5,	%g3,	%o7
	orcc	%o0,	%g2,	%o6
	tcs	%icc,	0x5
	fcmpeq16	%f18,	%f10,	%i3
	xnor	%l3,	%i5,	%l5
	tn	%xcc,	0x1
	fornot1s	%f16,	%f29,	%f11
	bg,pt	%xcc,	loop_1151
	fabss	%f25,	%f14
	sra	%g6,	0x10,	%i2
	tge	%icc,	0x3
loop_1151:
	bvs,a,pn	%xcc,	loop_1152
	fpsub16	%f10,	%f26,	%f18
	ldub	[%l7 + 0x45],	%i1
	fmovspos	%xcc,	%f2,	%f1
loop_1152:
	andncc	%o1,	%l4,	%g7
	edge8n	%i4,	%i7,	%o2
	tsubcctv	%i0,	%i6,	%g1
	edge16ln	%l1,	%l6,	%l2
	srlx	%g4,	0x0B,	%o5
	tle	%icc,	0x0
	subc	%l0,	%o4,	%o3
	tge	%xcc,	0x4
	and	%g3,	0x0570,	%o7
	ta	%xcc,	0x4
	orncc	%g5,	0x19AF,	%g2
	movn	%xcc,	%o6,	%o0
	movneg	%icc,	%i3,	%l3
	sir	0x1726
	fcmpeq16	%f8,	%f26,	%l5
	sth	%g6,	[%l7 + 0x36]
	fnors	%f2,	%f10,	%f6
	addcc	%i5,	0x19F3,	%i1
	fbue,a	%fcc1,	loop_1153
	tne	%xcc,	0x4
	set	0x30, %i3
	ldsha	[%l7 + %i3] 0x18,	%o1
loop_1153:
	tsubcc	%i2,	0x009F,	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i4,	%g7
	fmovsleu	%icc,	%f17,	%f10
	sethi	0x05B3,	%i7
	addccc	%i0,	0x0CAA,	%i6
	fzero	%f6
	ta	%xcc,	0x7
	addc	%o2,	0x1717,	%g1
	fnors	%f27,	%f16,	%f15
	stw	%l1,	[%l7 + 0x2C]
	edge8n	%l2,	%g4,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l0,	0x02EE,	%o4
	bge,pt	%xcc,	loop_1154
	movle	%icc,	%o3,	%g3
	movgu	%icc,	%o7,	%g5
	popc	%o5,	%g2
loop_1154:
	xnorcc	%o0,	%o6,	%l3
	fcmpgt32	%f20,	%f14,	%l5
	subc	%g6,	%i5,	%i1
	movrlez	%i3,	0x16E,	%o1
	edge16	%i2,	%i4,	%g7
	nop
	setx	loop_1155,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fxnors	%f31,	%f18,	%f19
	bvs,a	loop_1156
	orn	%i7,	0x0314,	%l4
loop_1155:
	faligndata	%f20,	%f2,	%f20
	tg	%xcc,	0x5
loop_1156:
	tcc	%xcc,	0x1
	fmul8x16al	%f30,	%f28,	%f18
	movcc	%xcc,	%i6,	%o2
	sir	0x0992
	sdiv	%i0,	0x1E35,	%l1
	ldx	[%l7 + 0x08],	%l2
	tneg	%xcc,	0x3
	te	%xcc,	0x7
	umulcc	%g1,	%g4,	%l0
	fnand	%f24,	%f24,	%f28
	edge32n	%o4,	%o3,	%g3
	fnegs	%f17,	%f10
	alignaddrl	%l6,	%o7,	%g5
	subcc	%g2,	0x141B,	%o0
	tsubcctv	%o6,	0x0A47,	%l3
	brlez	%l5,	loop_1157
	xnor	%o5,	%i5,	%g6
	ldd	[%l7 + 0x60],	%i0
	sra	%i3,	0x0B,	%o1
loop_1157:
	bcs,pt	%xcc,	loop_1158
	edge16ln	%i2,	%g7,	%i7
	edge8	%l4,	%i6,	%o2
	brgez	%i4,	loop_1159
loop_1158:
	sethi	0x071E,	%l1
	movne	%icc,	%l2,	%g1
	addc	%i0,	%l0,	%g4
loop_1159:
	fmovsgu	%icc,	%f2,	%f27
	nop
	setx	0xCE5E72C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x9AA824ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f2,	%f6
	umulcc	%o3,	0x0037,	%o4
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f18
	wr	%g0,	0x11,	%asi
	sta	%f2,	[%l7 + 0x6C] %asi
	brlz,a	%l6,	loop_1160
	lduh	[%l7 + 0x7E],	%o7
	bne	%icc,	loop_1161
	tne	%icc,	0x5
loop_1160:
	fble,a	%fcc3,	loop_1162
	edge32	%g3,	%g5,	%g2
loop_1161:
	fmovs	%f0,	%f10
	fpsub16s	%f6,	%f17,	%f13
loop_1162:
	move	%xcc,	%o6,	%o0
	fnegs	%f26,	%f28
	umulcc	%l5,	0x19C6,	%o5
	fbo,a	%fcc0,	loop_1163
	fcmpne32	%f6,	%f26,	%l3
	set	0x08, %g1
	ldswa	[%l7 + %g1] 0x89,	%g6
loop_1163:
	movne	%icc,	%i1,	%i3
	prefetch	[%l7 + 0x0C],	 0x1
	membar	0x0F
	movne	%icc,	%i5,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f14,	%f14
	movge	%xcc,	%g7,	%i2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i7
	fnegd	%f22,	%f10
	edge16l	%i6,	%o2,	%l4
	bneg,a,pt	%icc,	loop_1164
	fmuld8sux16	%f1,	%f15,	%f26
	tneg	%icc,	0x7
	movrne	%i4,	%l2,	%l1
loop_1164:
	array32	%i0,	%g1,	%g4
	fpsub16	%f18,	%f30,	%f28
	tcs	%icc,	0x0
	fmovda	%xcc,	%f11,	%f20
	fsrc2s	%f26,	%f26
	set	0x5C, %l5
	lduwa	[%l7 + %l5] 0x19,	%l0
	orcc	%o4,	0x1F19,	%l6
	fand	%f12,	%f4,	%f0
	set	0x70, %i2
	lduha	[%l7 + %i2] 0x88,	%o7
	tvs	%xcc,	0x7
	movvs	%icc,	%g3,	%o3
	fandnot1s	%f24,	%f23,	%f1
	tn	%xcc,	0x3
	movrgez	%g5,	0x226,	%g2
	edge8ln	%o6,	%o0,	%o5
	srax	%l5,	%l3,	%g6
	array8	%i3,	%i1,	%i5
	movle	%xcc,	%g7,	%i2
	edge16l	%i7,	%o1,	%i6
	xorcc	%l4,	0x0CEE,	%i4
	subcc	%l2,	0x198E,	%l1
	bg,a,pn	%icc,	loop_1165
	nop
	setx	0x54AE5FD9C2881321,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA2EBF63CD9C49D1C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f16,	%f0
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x45] %asi,	%i0
loop_1165:
	edge16ln	%g1,	%g4,	%o2
	fpsub32s	%f29,	%f25,	%f27
	orncc	%o4,	%l0,	%l6
	movleu	%xcc,	%g3,	%o7
	ble	loop_1166
	sir	0x096E
	array32	%g5,	%o3,	%o6
	tvs	%xcc,	0x4
loop_1166:
	srl	%g2,	0x15,	%o0
	movvc	%icc,	%o5,	%l3
	edge32n	%l5,	%i3,	%g6
	edge16ln	%i5,	%i1,	%i2
	te	%xcc,	0x3
	andncc	%g7,	%o1,	%i7
	udivcc	%l4,	0x1E09,	%i6
	swap	[%l7 + 0x60],	%l2
	edge16	%l1,	%i0,	%g1
	subccc	%g4,	0x0D54,	%i4
	movrgez	%o2,	0x11E,	%l0
	bn,a	loop_1167
	faligndata	%f18,	%f22,	%f8
	movle	%xcc,	%l6,	%o4
	tcs	%icc,	0x4
loop_1167:
	fbl	%fcc3,	loop_1168
	popc	%g3,	%o7
	fpadd16	%f28,	%f26,	%f26
	fmovdn	%xcc,	%f29,	%f19
loop_1168:
	fandnot1	%f20,	%f12,	%f26
	fands	%f10,	%f23,	%f24
	set	0x76, %o5
	ldsha	[%l7 + %o5] 0x89,	%o3
	te	%xcc,	0x1
	std	%f24,	[%l7 + 0x20]
	fbul,a	%fcc2,	loop_1169
	tl	%icc,	0x5
	membar	0x5A
	movrne	%o6,	0x08F,	%g5
loop_1169:
	ldd	[%l7 + 0x20],	%o0
	fexpand	%f7,	%f12
	sllx	%g2,	0x12,	%o5
	nop
	fitod	%f6,	%f0
	fdtox	%f0,	%f22
	smulcc	%l3,	0x054A,	%l5
	tvc	%xcc,	0x5
	edge16	%g6,	%i3,	%i5
	fnot1s	%f15,	%f20
	prefetch	[%l7 + 0x4C],	 0x2
	taddcctv	%i2,	0x1FBA,	%i1
	taddcc	%g7,	0x14FE,	%o1
	orncc	%l4,	%i6,	%i7
	set	0x1C, %l3
	stha	%l2,	[%l7 + %l3] 0xe3
	membar	#Sync
	set	0x30, %l4
	lda	[%l7 + %l4] 0x19,	%f3
	tleu	%icc,	0x3
	orncc	%i0,	0x1799,	%g1
	edge16l	%g4,	%i4,	%o2
	srlx	%l1,	%l0,	%l6
	move	%icc,	%o4,	%o7
	subccc	%g3,	%o6,	%o3
	fmovrdlez	%o0,	%f4,	%f16
	edge32l	%g5,	%o5,	%g2
	andn	%l3,	0x040D,	%g6
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
	ba,pt	%xcc,	loop_1171
	brlz	%l5,	loop_1172
	movrgez	%i5,	%i3,	%i2
loop_1170:
	smulcc	%i1,	%o1,	%g7
loop_1171:
	sllx	%l4,	0x17,	%i6
loop_1172:
	stx	%l2,	[%l7 + 0x58]
	fmovdg	%xcc,	%f28,	%f6
	edge8n	%i7,	%i0,	%g4
	be,a	loop_1173
	fands	%f14,	%f16,	%f29
	mulscc	%i4,	%o2,	%g1
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x68] %asi,	%l0
loop_1173:
	movge	%icc,	%l6,	%o4
	fmovsneg	%icc,	%f20,	%f12
	udiv	%o7,	0x1619,	%l1
	fmovsn	%icc,	%f12,	%f1
	orncc	%o6,	%g3,	%o3
	fmovscc	%icc,	%f22,	%f22
	tle	%xcc,	0x3
	sra	%o0,	0x05,	%o5
	edge8	%g2,	%g5,	%g6
	fmovrdlez	%l3,	%f14,	%f18
	tgu	%icc,	0x7
	tcs	%xcc,	0x3
	fmovdcc	%xcc,	%f28,	%f11
	movre	%l5,	0x1EE,	%i3
	brlz	%i5,	loop_1174
	fbg,a	%fcc2,	loop_1175
	umulcc	%i1,	%o1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1174:
	fmovs	%f18,	%f31
loop_1175:
	nop
	fitod	%f10,	%f0
	fdtos	%f0,	%f16
	tsubcctv	%l4,	0x1849,	%g7
	movvs	%icc,	%l2,	%i6
	fmovdcs	%xcc,	%f13,	%f6
	bl	%icc,	loop_1176
	fble	%fcc0,	loop_1177
	tne	%xcc,	0x5
	ldub	[%l7 + 0x1A],	%i0
loop_1176:
	srax	%g4,	0x01,	%i4
loop_1177:
	bvs,a,pt	%icc,	loop_1178
	mulscc	%o2,	0x0553,	%i7
	subcc	%l0,	0x17EF,	%g1
	movcc	%icc,	%l6,	%o4
loop_1178:
	or	%l1,	%o7,	%g3
	ta	%icc,	0x4
	nop
	fitos	%f14,	%f27
	fstoi	%f27,	%f13
	fabss	%f26,	%f18
	tle	%xcc,	0x5
	tpos	%xcc,	0x4
	fsrc1	%f22,	%f18
	andcc	%o3,	%o6,	%o5
	edge16ln	%o0,	%g2,	%g6
	fnegs	%f1,	%f29
	ta	%icc,	0x2
	fnot1	%f20,	%f24
	brgz	%l3,	loop_1179
	fble	%fcc3,	loop_1180
	tn	%icc,	0x5
	fmul8x16al	%f2,	%f18,	%f22
loop_1179:
	movre	%l5,	0x31A,	%i3
loop_1180:
	bvs,a	loop_1181
	ldd	[%l7 + 0x10],	%g4
	addc	%i5,	%o1,	%i2
	stb	%l4,	[%l7 + 0x72]
loop_1181:
	umulcc	%i1,	0x04CC,	%l2
	sllx	%g7,	%i6,	%g4
	fnot2	%f0,	%f16
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x12] %asi,	%i4
	alignaddr	%i0,	%i7,	%o2
	ba,a	loop_1182
	tge	%xcc,	0x5
	fble,a	%fcc1,	loop_1183
	array32	%l0,	%g1,	%l6
loop_1182:
	and	%l1,	0x07C7,	%o4
	fpsub16s	%f10,	%f21,	%f21
loop_1183:
	sll	%o7,	%o3,	%g3
	movrlz	%o5,	%o6,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f6,	%f0,	%g6
	move	%xcc,	%l3,	%l5
	sllx	%i3,	0x05,	%o0
	smulcc	%g5,	0x0E04,	%o1
	tvc	%icc,	0x1
	ldx	[%l7 + 0x20],	%i2
	bgu,a	%icc,	loop_1184
	tsubcc	%l4,	0x03E9,	%i1
	sdivcc	%i5,	0x0B22,	%l2
	tvc	%xcc,	0x1
loop_1184:
	srax	%g7,	0x13,	%i6
	edge32	%i4,	%i0,	%g4
	umul	%i7,	0x0332,	%o2
	edge8	%l0,	%l6,	%g1
	sra	%l1,	%o7,	%o4
	orn	%g3,	0x0C09,	%o3
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
	sll	%o5,	%g2,	%l3
	fnors	%f5,	%f5,	%f13
	movrlez	%g6,	%l5,	%i3
	umulcc	%g5,	0x1474,	%o0
	edge8l	%i2,	%l4,	%i1
	tsubcc	%o1,	%l2,	%i5
	sll	%g7,	%i6,	%i4
	movrne	%i0,	0x088,	%g4
	ldstub	[%l7 + 0x4E],	%o2
	move	%icc,	%l0,	%l6
	movcs	%xcc,	%g1,	%i7
	fbne,a	%fcc2,	loop_1185
	movle	%xcc,	%o7,	%o4
	fnors	%f30,	%f10,	%f16
	fnor	%f24,	%f18,	%f6
loop_1185:
	tcs	%xcc,	0x6
	sdivcc	%g3,	0x01BD,	%o3
	flush	%l7 + 0x18
	tcc	%icc,	0x5
	movvc	%xcc,	%o6,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l1,	0x016C,	%l3
	nop
	setx	loop_1186,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sth	%g6,	[%l7 + 0x1A]
	srl	%l5,	0x1E,	%g2
	fba,a	%fcc0,	loop_1187
loop_1186:
	membar	0x47
	sub	%g5,	%i3,	%o0
	set	0x10, %o0
	sta	%f16,	[%l7 + %o0] 0x04
loop_1187:
	bne,pt	%xcc,	loop_1188
	tcc	%icc,	0x1
	movcc	%xcc,	%i2,	%l4
	be,a	%xcc,	loop_1189
loop_1188:
	tgu	%icc,	0x7
	subccc	%i1,	%l2,	%o1
	alignaddrl	%g7,	%i5,	%i6
loop_1189:
	fnors	%f10,	%f4,	%f13
	srlx	%i4,	0x01,	%g4
	nop
	fitod	%f8,	%f4
	movre	%o2,	%l0,	%l6
	fble,a	%fcc0,	loop_1190
	tpos	%xcc,	0x0
	alignaddrl	%g1,	%i7,	%o7
	tvc	%xcc,	0x3
loop_1190:
	movgu	%xcc,	%o4,	%i0
	flush	%l7 + 0x60
	set	0x58, %l1
	swapa	[%l7 + %l1] 0x80,	%o3
	stx	%o6,	[%l7 + 0x58]
	tl	%icc,	0x3
	subccc	%o5,	%l1,	%g3
	be,pn	%xcc,	loop_1191
	array16	%l3,	%l5,	%g6
	srl	%g5,	0x19,	%i3
	movne	%xcc,	%g2,	%i2
loop_1191:
	stbar
	taddcctv	%l4,	%i1,	%o0
	andcc	%o1,	%l2,	%i5
	umulcc	%i6,	%g7,	%g4
	sub	%i4,	0x1B10,	%o2
	fmovd	%f8,	%f10
	movrgez	%l6,	%l0,	%g1
	mulscc	%o7,	0x0251,	%i7
	fmovrde	%o4,	%f30,	%f6
	movvc	%xcc,	%o3,	%o6
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x338] %asi,	%i0 ripped by fixASI40.pl ripped by fixASI40.pl
	fxors	%f5,	%f27,	%f12
	fmovrsgez	%l1,	%f1,	%f14
	tcs	%xcc,	0x0
	ldsb	[%l7 + 0x48],	%g3
	andcc	%o5,	%l3,	%l5
	fbo,a	%fcc2,	loop_1192
	pdist	%f8,	%f10,	%f20
	fnors	%f6,	%f31,	%f24
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%i3
loop_1192:
	movg	%icc,	%g2,	%g5
	edge8l	%i2,	%i1,	%l4
	sdiv	%o1,	0x004A,	%l2
	ldsw	[%l7 + 0x70],	%i5
	addcc	%i6,	0x0A3F,	%g7
	tneg	%xcc,	0x7
	fbu,a	%fcc0,	loop_1193
	fcmpgt32	%f0,	%f28,	%o0
	subcc	%i4,	%o2,	%g4
	udiv	%l0,	0x03AF,	%g1
loop_1193:
	fsrc2s	%f5,	%f23
	movrne	%l6,	0x267,	%i7
	xor	%o4,	0x141C,	%o7
	move	%xcc,	%o3,	%i0
	bge,pn	%icc,	loop_1194
	tsubcc	%l1,	0x08FB,	%g3
	fmovrse	%o5,	%f5,	%f22
	ldsh	[%l7 + 0x0C],	%o6
loop_1194:
	tgu	%xcc,	0x3
	fabsd	%f28,	%f30
	addccc	%l5,	0x0A1E,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x54],	%g6
	edge32n	%i3,	%g5,	%g2
	bvs,pt	%icc,	loop_1195
	movrgz	%i1,	%i2,	%o1
	popc	0x180E,	%l4
	sll	%i5,	0x04,	%l2
loop_1195:
	array8	%i6,	%g7,	%o0
	sdivx	%i4,	0x0F99,	%g4
	movrlez	%o2,	%g1,	%l6
	subc	%i7,	%o4,	%l0
	movrgez	%o7,	0x1E5,	%i0
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x16,	%f0
	fmovscc	%xcc,	%f23,	%f22
	fbu,a	%fcc3,	loop_1196
	fbug,a	%fcc1,	loop_1197
	stb	%l1,	[%l7 + 0x29]
	mulscc	%o3,	0x197E,	%g3
loop_1196:
	bne,pt	%icc,	loop_1198
loop_1197:
	fmovscs	%xcc,	%f21,	%f24
	fble,a	%fcc2,	loop_1199
	addcc	%o6,	%o5,	%l3
loop_1198:
	addcc	%l5,	0x161E,	%g6
	and	%g5,	%g2,	%i1
loop_1199:
	edge8l	%i3,	%o1,	%l4
	taddcctv	%i2,	0x11F6,	%i5
	for	%f8,	%f18,	%f24
	orncc	%l2,	0x04B4,	%g7
	fmul8x16al	%f0,	%f19,	%f8
	tneg	%xcc,	0x0
	subc	%o0,	%i4,	%i6
	fmovdn	%xcc,	%f30,	%f17
	edge32n	%o2,	%g1,	%g4
	or	%l6,	0x01DD,	%i7
	array16	%o4,	%l0,	%o7
	edge16ln	%i0,	%o3,	%g3
	fpsub16s	%f30,	%f29,	%f19
	fmovdleu	%xcc,	%f19,	%f5
	taddcctv	%o6,	%o5,	%l1
	taddcc	%l3,	%l5,	%g5
	fpadd32s	%f19,	%f5,	%f25
	fnot1s	%f18,	%f24
	edge16n	%g6,	%g2,	%i1
	edge32l	%o1,	%l4,	%i3
	bshuffle	%f24,	%f12,	%f0
	movne	%icc,	%i2,	%i5
	array32	%l2,	%g7,	%o0
	fbl,a	%fcc3,	loop_1200
	sll	%i6,	0x10,	%i4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%g1
loop_1200:
	tg	%icc,	0x2
	nop
	set	0x4E, %i4
	stb	%g4,	[%l7 + %i4]
	tcs	%xcc,	0x5
	bne	%icc,	loop_1201
	fornot2	%f2,	%f14,	%f22
	bneg	%xcc,	loop_1202
	addc	%l6,	%i7,	%l0
loop_1201:
	tvs	%xcc,	0x0
	sdiv	%o7,	0x186B,	%o4
loop_1202:
	brz,a	%o3,	loop_1203
	bge	loop_1204
	brlz,a	%g3,	loop_1205
	sll	%i0,	%o6,	%l1
loop_1203:
	sll	%o5,	%l5,	%l3
loop_1204:
	edge8l	%g5,	%g6,	%g2
loop_1205:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o1
	fzeros	%f12
	sth	%l4,	[%l7 + 0x30]
	fnegd	%f16,	%f26
	fands	%f10,	%f11,	%f28
	orn	%i1,	0x080B,	%i3
	tne	%icc,	0x7
	fornot1s	%f23,	%f2,	%f1
	tge	%xcc,	0x1
	sub	%i5,	%l2,	%g7
	brlez,a	%i2,	loop_1206
	fnors	%f21,	%f2,	%f1
	fors	%f18,	%f25,	%f29
	movrlz	%o0,	0x207,	%i6
loop_1206:
	fmovscs	%icc,	%f0,	%f14
	subc	%i4,	0x02B3,	%g1
	andn	%g4,	%l6,	%o2
	flush	%l7 + 0x64
	addc	%l0,	%i7,	%o7
	nop
	setx	0xC06E0AB0,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	for	%f30,	%f4,	%f14
	tcc	%icc,	0x0
	sub	%o4,	%g3,	%o3
	movre	%i0,	%o6,	%o5
	swap	[%l7 + 0x30],	%l5
	orcc	%l1,	%g5,	%l3
	smul	%g6,	%o1,	%g2
	srl	%l4,	0x11,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%i1,	%l2,	%i5
	mulx	%i2,	%g7,	%i6
	fmovd	%f0,	%f6
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f20
	movn	%xcc,	%i4,	%g1
	set	0x60, %g6
	stxa	%g4,	[%l7 + %g6] 0x19
	fxnor	%f2,	%f24,	%f28
	array32	%o0,	%o2,	%l0
	tcs	%icc,	0x1
	orcc	%i7,	%o7,	%o4
	movn	%xcc,	%g3,	%l6
	nop
	setx	0xD820976C205F00B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	bcc,pn	%icc,	loop_1207
	array16	%i0,	%o6,	%o3
	nop
	setx	0xA07B67A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	sdiv	%o5,	0x1B1F,	%l1
loop_1207:
	lduh	[%l7 + 0x1A],	%g5
	orcc	%l3,	0x015B,	%g6
	nop
	setx	loop_1208,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8l	%l5,	%o1,	%l4
	sra	%i3,	0x07,	%i1
	brlez,a	%l2,	loop_1209
loop_1208:
	fzero	%f12
	ldsw	[%l7 + 0x78],	%i5
	fbul	%fcc0,	loop_1210
loop_1209:
	sdiv	%i2,	0x0FCF,	%g7
	srax	%g2,	%i6,	%g1
	edge16	%i4,	%g4,	%o2
loop_1210:
	fmovrde	%l0,	%f24,	%f8
	srax	%o0,	0x12,	%o7
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x50] %asi,	%o4
	set	0x48, %g4
	ldsha	[%l7 + %g4] 0x89,	%i7
	umulcc	%g3,	0x1AA0,	%i0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x16] %asi,	%l6
	fmovs	%f22,	%f0
	fmovdge	%xcc,	%f28,	%f26
	stw	%o6,	[%l7 + 0x68]
	fmovdg	%icc,	%f20,	%f28
	tne	%xcc,	0x3
	nop
	fitos	%f0,	%f11
	fstox	%f11,	%f22
	fxtos	%f22,	%f9
	fmovsl	%icc,	%f16,	%f5
	tcs	%icc,	0x7
	fbg,a	%fcc3,	loop_1211
	fone	%f12
	movle	%icc,	%o3,	%l1
	st	%f13,	[%l7 + 0x3C]
loop_1211:
	ld	[%l7 + 0x38],	%f4
	movn	%xcc,	%g5,	%o5
	bvs,a	loop_1212
	fble,a	%fcc3,	loop_1213
	movrgz	%l3,	0x202,	%g6
	edge16l	%o1,	%l5,	%l4
loop_1212:
	bne,a,pn	%xcc,	loop_1214
loop_1213:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc1,	loop_1215
	mulx	%i3,	0x026C,	%l2
loop_1214:
	ldx	[%l7 + 0x10],	%i1
	fbule,a	%fcc3,	loop_1216
loop_1215:
	fmovdle	%icc,	%f5,	%f10
	nop
	fitos	%f12,	%f31
	fstoi	%f31,	%f15
	te	%xcc,	0x0
loop_1216:
	xor	%i2,	0x1BF5,	%i5
	te	%icc,	0x0
	fornot2	%f4,	%f30,	%f22
	sub	%g7,	0x09F5,	%g2
	sth	%g1,	[%l7 + 0x38]
	srax	%i4,	%i6,	%o2
	brlz	%g4,	loop_1217
	movvc	%icc,	%l0,	%o0
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x12] %asi,	%o4
loop_1217:
	edge32ln	%i7,	%g3,	%i0
	bne,a,pn	%icc,	loop_1218
	orn	%o7,	0x0CE1,	%l6
	tleu	%icc,	0x0
	smul	%o3,	%o6,	%g5
loop_1218:
	bcc,pt	%xcc,	loop_1219
	fsrc1s	%f20,	%f14
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x20] %asi,	%o5
loop_1219:
	fxors	%f21,	%f23,	%f5
	add	%l1,	%g6,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o1,	%l5
	orncc	%l4,	0x014A,	%l2
	taddcctv	%i1,	%i2,	%i5
	subccc	%g7,	0x02D6,	%i3
	tsubcc	%g2,	0x0E8B,	%g1
	bne,a,pt	%xcc,	loop_1220
	ld	[%l7 + 0x6C],	%f18
	bleu	loop_1221
	ldd	[%l7 + 0x70],	%i4
loop_1220:
	fxnor	%f22,	%f26,	%f12
	subccc	%i6,	0x1A96,	%g4
loop_1221:
	nop
	setx	0xB048DDA5,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	fblg	%fcc0,	loop_1222
	movgu	%xcc,	%o2,	%o0
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x80
loop_1222:
	mulscc	%o4,	%l0,	%g3
	stbar
	ldd	[%l7 + 0x40],	%f26
	movleu	%xcc,	%i7,	%o7
	fabsd	%f0,	%f16
	fornot1	%f8,	%f22,	%f22
	fpadd32s	%f10,	%f19,	%f6
	mova	%xcc,	%i0,	%l6
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x22] %asi,	%o3
	movpos	%xcc,	%o6,	%o5
	orn	%l1,	%g6,	%l3
	movrgz	%g5,	%o1,	%l5
	tl	%xcc,	0x0
	tvc	%xcc,	0x5
	movvc	%xcc,	%l4,	%i1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x80,	%l2,	%i2
	sll	%i5,	0x00,	%i3
	bgu,pt	%icc,	loop_1223
	fbug	%fcc0,	loop_1224
	fpack32	%f20,	%f2,	%f14
	umulcc	%g7,	%g2,	%g1
loop_1223:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x4C] %asi,	%i6
loop_1224:
	movrgez	%i4,	0x2E7,	%g4
	te	%icc,	0x3
	set	0x55, %g2
	lduba	[%l7 + %g2] 0x18,	%o0
	movpos	%icc,	%o4,	%o2
	sir	0x0E28
	tleu	%icc,	0x0
	ldub	[%l7 + 0x7D],	%l0
	orcc	%i7,	%o7,	%g3
	umul	%i0,	%l6,	%o3
	tgu	%icc,	0x3
	xorcc	%o6,	%l1,	%g6
	tle	%xcc,	0x4
	edge32ln	%l3,	%g5,	%o1
	edge8n	%o5,	%l4,	%l5
	fbul,a	%fcc2,	loop_1225
	orncc	%i1,	0x1CFA,	%l2
	fmovrdgz	%i2,	%f14,	%f6
	fmovdg	%xcc,	%f22,	%f30
loop_1225:
	popc	0x14D9,	%i5
	orncc	%g7,	%i3,	%g1
	nop
	setx	0x49EB5F64055DFE4D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x5747BB6107945218,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f14,	%f22
	swap	[%l7 + 0x08],	%i6
	ldub	[%l7 + 0x0A],	%i4
	nop
	fitos	%f13,	%f23
	fstox	%f23,	%f18
	fxtos	%f18,	%f16
	and	%g2,	0x09CB,	%g4
	sethi	0x0BD0,	%o4
	tl	%xcc,	0x5
	add	%o2,	0x1EFF,	%o0
	fsrc1	%f24,	%f18
	st	%f22,	[%l7 + 0x0C]
	bshuffle	%f8,	%f10,	%f20
	bshuffle	%f24,	%f18,	%f26
	sub	%l0,	%i7,	%o7
	movpos	%xcc,	%g3,	%l6
	fbne	%fcc2,	loop_1226
	smul	%i0,	0x122E,	%o6
	edge32ln	%o3,	%l1,	%g6
	movle	%xcc,	%g5,	%l3
loop_1226:
	subcc	%o5,	0x0A60,	%o1
	fmovdne	%xcc,	%f13,	%f13
	smul	%l5,	%i1,	%l2
	movvc	%xcc,	%i2,	%l4
	fmovsle	%icc,	%f7,	%f8
	movge	%xcc,	%g7,	%i5
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f0
	fxtod	%f0,	%f8
	fzero	%f8
	movrgez	%g1,	0x3BD,	%i6
	andcc	%i3,	0x1901,	%g2
	bneg	%icc,	loop_1227
	fcmpne16	%f18,	%f22,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f21,	%f15
loop_1227:
	nop
	set	0x3A, %i6
	lduha	[%l7 + %i6] 0x18,	%o4
	tn	%icc,	0x6
	srl	%o2,	%o0,	%i4
	nop
	setx	0x5E757C2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x6A4780BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f24,	%f25
	ldsb	[%l7 + 0x61],	%l0
	nop
	setx loop_1228, %l0, %l1
	jmpl %l1, %i7
	stw	%g3,	[%l7 + 0x44]
	fmovda	%xcc,	%f20,	%f12
	edge32	%l6,	%i0,	%o6
loop_1228:
	subc	%o3,	0x0FC9,	%o7
	xor	%l1,	0x1E6C,	%g6
	fmul8ulx16	%f4,	%f20,	%f14
	tsubcc	%g5,	0x006B,	%l3
	andn	%o5,	0x07DC,	%l5
	brgez	%o1,	loop_1229
	movn	%xcc,	%i1,	%i2
	fpsub32s	%f15,	%f14,	%f26
	movn	%xcc,	%l4,	%l2
loop_1229:
	edge8l	%g7,	%i5,	%i6
	subccc	%i3,	%g1,	%g2
	fpackfix	%f26,	%f21
	tsubcc	%o4,	0x056B,	%g4
	sub	%o2,	%i4,	%l0
	addc	%i7,	0x14F6,	%g3
	fcmpeq16	%f24,	%f14,	%o0
	fmovsg	%icc,	%f10,	%f28
	nop
	setx	0x31F9B239E02A6D34,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x258BAE058B69DC5A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f22,	%f10
	movvc	%icc,	%l6,	%i0
	tg	%xcc,	0x3
	movrgez	%o3,	0x3FE,	%o6
	tsubcctv	%l1,	%g6,	%g5
	set	0x73, %g7
	ldstuba	[%l7 + %g7] 0x81,	%l3
	srax	%o5,	%l5,	%o7
	edge32l	%i1,	%o1,	%i2
	edge8ln	%l4,	%l2,	%i5
	xor	%g7,	%i6,	%i3
	fxnors	%f26,	%f25,	%f8
	ta	%icc,	0x6
	fbule,a	%fcc0,	loop_1230
	movrgez	%g1,	%o4,	%g2
	sir	0x15E6
	addcc	%g4,	0x020C,	%i4
loop_1230:
	fsrc1s	%f7,	%f7
	sdivx	%l0,	0x1FB7,	%o2
	srax	%g3,	%i7,	%l6
	tsubcc	%o0,	%o3,	%o6
	movl	%icc,	%l1,	%g6
	set	0x4E, %l2
	stba	%g5,	[%l7 + %l2] 0x81
	edge16	%i0,	%o5,	%l5
	ldd	[%l7 + 0x38],	%f24
	fpadd32s	%f9,	%f5,	%f19
	taddcctv	%l3,	0x0F9C,	%o7
	set	0x40, %i0
	ldswa	[%l7 + %i0] 0x80,	%i1
	srlx	%o1,	0x13,	%i2
	fmovd	%f24,	%f6
	edge32	%l4,	%l2,	%i5
	edge8n	%g7,	%i3,	%i6
	fcmple32	%f8,	%f30,	%g1
	smul	%g2,	0x097E,	%g4
	nop
	setx	0x62F1E4A6F04597EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	st	%f21,	[%l7 + 0x50]
	mulx	%i4,	0x145A,	%l0
	alignaddr	%o4,	%g3,	%i7
	fbu	%fcc3,	loop_1231
	nop
	fitod	%f7,	%f22
	xnorcc	%o2,	%o0,	%l6
	xnor	%o3,	0x1843,	%l1
loop_1231:
	addccc	%o6,	0x0C8B,	%g6
	ta	%icc,	0x3
	movgu	%xcc,	%i0,	%o5
	tpos	%xcc,	0x1
	bcs	loop_1232
	nop
	setx	0xF14B735D9EF86CC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x4654262486303629,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f20,	%f22
	subc	%g5,	0x0517,	%l3
	fcmpeq16	%f6,	%f0,	%l5
loop_1232:
	fpsub16	%f10,	%f18,	%f10
	edge32l	%i1,	%o1,	%o7
	addcc	%i2,	%l2,	%l4
	taddcc	%i5,	%g7,	%i3
	ble,a	%xcc,	loop_1233
	movpos	%xcc,	%g1,	%i6
	nop
	setx	0x46EDF238,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xF3D22791,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f3,	%f24
	fmovsgu	%icc,	%f4,	%f7
loop_1233:
	taddcc	%g2,	0x0528,	%g4
	umul	%l0,	0x099A,	%i4
	tcs	%xcc,	0x7
	taddcc	%o4,	0x130F,	%g3
	sdivx	%i7,	0x03F7,	%o0
	nop
	set	0x6F, %o4
	ldub	[%l7 + %o4],	%o2
	tneg	%icc,	0x6
	tneg	%xcc,	0x0
	bpos,pn	%icc,	loop_1234
	edge8n	%o3,	%l6,	%l1
	udiv	%o6,	0x1488,	%i0
	xnorcc	%o5,	0x0CAB,	%g6
loop_1234:
	xnor	%g5,	0x0AA7,	%l5
	umulcc	%i1,	0x1410,	%o1
	edge8	%l3,	%o7,	%i2
	or	%l4,	%l2,	%i5
	movneg	%xcc,	%g7,	%i3
	brlez	%i6,	loop_1235
	addc	%g2,	0x13FF,	%g4
	fbule,a	%fcc3,	loop_1236
	fmovdleu	%icc,	%f24,	%f8
loop_1235:
	fbe,a	%fcc1,	loop_1237
	tvc	%xcc,	0x1
loop_1236:
	tn	%icc,	0x4
	xnor	%g1,	%i4,	%o4
loop_1237:
	fbule	%fcc3,	loop_1238
	bne	%icc,	loop_1239
	fmovda	%xcc,	%f20,	%f26
	array32	%g3,	%l0,	%i7
loop_1238:
	bcs	loop_1240
loop_1239:
	fpsub32s	%f9,	%f15,	%f22
	tcc	%xcc,	0x3
	fba	%fcc1,	loop_1241
loop_1240:
	addc	%o0,	%o2,	%l6
	umulcc	%l1,	%o6,	%i0
	fbuge	%fcc3,	loop_1242
loop_1241:
	addc	%o3,	%g6,	%g5
	andn	%l5,	%i1,	%o1
	tne	%xcc,	0x5
loop_1242:
	addccc	%l3,	0x08BD,	%o7
	tge	%icc,	0x6
	fpsub32	%f0,	%f30,	%f14
	movcc	%xcc,	%i2,	%l4
	bshuffle	%f16,	%f22,	%f20
	edge16l	%o5,	%i5,	%g7
	smul	%l2,	0x18B6,	%i6
	movgu	%icc,	%i3,	%g2
	st	%f29,	[%l7 + 0x78]
	sll	%g1,	%g4,	%o4
	taddcctv	%i4,	0x1277,	%l0
	tge	%xcc,	0x1
	subcc	%g3,	0x19EC,	%i7
	smul	%o2,	0x162C,	%l6
	tvc	%xcc,	0x4
	movpos	%xcc,	%l1,	%o0
	fpsub16s	%f26,	%f20,	%f2
	sdiv	%o6,	0x13EC,	%o3
	fmovrdgz	%i0,	%f10,	%f0
	popc	0x0768,	%g6
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x7A] %asi,	%g5
	tsubcc	%l5,	0x0388,	%i1
	mulx	%o1,	0x0F44,	%l3
	fbne	%fcc2,	loop_1243
	fmovscs	%xcc,	%f14,	%f4
	addccc	%i2,	%o7,	%l4
	ba,a,pt	%icc,	loop_1244
loop_1243:
	fone	%f8
	bshuffle	%f16,	%f26,	%f2
	sllx	%i5,	%o5,	%l2
loop_1244:
	movrlz	%g7,	%i6,	%i3
	fmovrdgez	%g2,	%f6,	%f24
	movcc	%icc,	%g4,	%o4
	movre	%i4,	%l0,	%g1
	fmul8ulx16	%f4,	%f16,	%f26
	fmovscs	%icc,	%f24,	%f22
	movrgez	%g3,	0x023,	%i7
	fbge,a	%fcc1,	loop_1245
	fmovrdne	%l6,	%f14,	%f22
	tcc	%xcc,	0x6
	orcc	%o2,	%o0,	%o6
loop_1245:
	movre	%l1,	%o3,	%i0
	smul	%g5,	0x1D6C,	%g6
	nop
	setx	0x3051F90F,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	nop
	fitos	%f8,	%f1
	fstod	%f1,	%f6
	fmovdneg	%xcc,	%f23,	%f19
	sir	0x0B4F
	srax	%l5,	0x06,	%i1
	nop
	set	0x50, %o7
	ldsw	[%l7 + %o7],	%l3
	tvc	%xcc,	0x0
	movge	%icc,	%o1,	%i2
	fmovdne	%xcc,	%f28,	%f12
	xorcc	%l4,	0x1584,	%i5
	bshuffle	%f28,	%f18,	%f14
	movleu	%icc,	%o5,	%l2
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fcmpgt16	%f26,	%f4,	%g7
	andn	%o7,	0x15BB,	%i3
	fmovse	%xcc,	%f29,	%f20
	fbul,a	%fcc0,	loop_1246
	sth	%i6,	[%l7 + 0x72]
	bpos,a	%icc,	loop_1247
	edge16l	%g2,	%g4,	%o4
loop_1246:
	nop
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
loop_1247:
	std	%f8,	[%l7 + 0x38]
	wr	%g0,	0x11,	%asi
	sta	%f26,	[%l7 + 0x6C] %asi
	nop
	setx	loop_1248,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcs	%icc,	0x1
	movcs	%icc,	%g1,	%l0
	movrgez	%i7,	0x00C,	%l6
loop_1248:
	tvc	%xcc,	0x3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x74] %asi,	%g3
	bcs,a,pn	%icc,	loop_1249
	fsrc1	%f28,	%f14
	udiv	%o2,	0x1227,	%o6
	fmovdne	%icc,	%f0,	%f14
loop_1249:
	edge32n	%l1,	%o3,	%o0
	movvs	%xcc,	%i0,	%g5
	ta	%icc,	0x4
	addcc	%l5,	0x1CD3,	%g6
	fmovrde	%l3,	%f8,	%f28
	sllx	%o1,	0x1E,	%i2
	fbn	%fcc0,	loop_1250
	sethi	0x1B47,	%i1
	orcc	%i5,	%l4,	%l2
	brlez	%g7,	loop_1251
loop_1250:
	nop
	setx	0x6779D85A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xD10957B8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f31,	%f24
	fbne	%fcc2,	loop_1252
	bn,pt	%icc,	loop_1253
loop_1251:
	or	%o5,	0x1B71,	%i3
	bn,a,pt	%xcc,	loop_1254
loop_1252:
	nop
	setx loop_1255, %l0, %l1
	jmpl %l1, %o7
loop_1253:
	ldstub	[%l7 + 0x33],	%i6
	edge8ln	%g4,	%o4,	%g2
loop_1254:
	fpsub16s	%f18,	%f27,	%f14
loop_1255:
	tleu	%xcc,	0x7
	fmovdl	%icc,	%f29,	%f30
	alignaddrl	%i4,	%l0,	%i7
	fmovd	%f16,	%f18
	std	%f16,	[%l7 + 0x40]
	edge8ln	%l6,	%g1,	%o2
	subccc	%g3,	0x18AA,	%l1
	sra	%o3,	0x14,	%o0
	movn	%icc,	%i0,	%o6
	fpadd32s	%f1,	%f11,	%f19
	fmovrdlz	%g5,	%f16,	%f28
	sll	%l5,	%l3,	%g6
	set	0x64, %g5
	ldswa	[%l7 + %g5] 0x04,	%o1
	fpack16	%f2,	%f27
	add	%i1,	0x13D7,	%i5
	stw	%l4,	[%l7 + 0x6C]
	membar	0x3E
	movrgez	%i2,	%l2,	%g7
	ldx	[%l7 + 0x78],	%o5
	mulscc	%i3,	%o7,	%i6
	pdist	%f0,	%f8,	%f2
	tvs	%icc,	0x5
	fpadd16s	%f27,	%f3,	%f18
	edge8l	%g4,	%g2,	%i4
	edge32	%l0,	%i7,	%o4
	movcc	%icc,	%g1,	%o2
	movleu	%icc,	%g3,	%l1
	fmovsleu	%xcc,	%f2,	%f6
	fnor	%f10,	%f4,	%f0
	addccc	%o3,	0x0136,	%l6
	ldsb	[%l7 + 0x19],	%o0
	taddcctv	%o6,	%i0,	%l5
	alignaddr	%l3,	%g5,	%g6
	movpos	%xcc,	%i1,	%i5
	fone	%f26
	alignaddr	%l4,	%i2,	%o1
	nop
	setx	0x73FC244B026F4EF9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f26
	edge8	%l2,	%g7,	%o5
	array8	%i3,	%o7,	%i6
	bvc,a	loop_1256
	fsrc2	%f2,	%f14
	bn,pn	%icc,	loop_1257
	sdivx	%g2,	0x1F9F,	%g4
loop_1256:
	movrgez	%l0,	0x3C7,	%i4
	udivx	%i7,	0x1CCD,	%o4
loop_1257:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x1
	edge8l	%g1,	%o2,	%g3
	flush	%l7 + 0x48
	movle	%icc,	%l1,	%l6
	fpadd32s	%f5,	%f16,	%f17
	ldsw	[%l7 + 0x74],	%o3
	orncc	%o6,	%i0,	%o0
	movge	%icc,	%l3,	%g5
	fmovrdgez	%l5,	%f10,	%f20
	set	0x14, %g3
	swapa	[%l7 + %g3] 0x11,	%g6
	sir	0x0333
	fsrc1s	%f5,	%f7
	taddcc	%i1,	0x0169,	%i5
	srax	%i2,	0x02,	%l4
	fpackfix	%f30,	%f13
	edge32	%l2,	%o1,	%g7
	fble,a	%fcc3,	loop_1258
	tvs	%xcc,	0x4
	movvc	%icc,	%i3,	%o5
	wr	%g0,	0x21,	%asi
	stxa	%o7,	[%g0 + 0x108] %asi
loop_1258:
	fmovrdgz	%i6,	%f4,	%f6
	stw	%g4,	[%l7 + 0x7C]
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x3C] %asi,	%f11
	tvs	%icc,	0x4
	movre	%g2,	0x109,	%l0
	movneg	%xcc,	%i4,	%o4
	sir	0x05FC
	addcc	%g1,	0x074E,	%i7
	fcmpeq32	%f10,	%f8,	%o2
	edge16l	%g3,	%l6,	%l1
	bleu,a,pn	%xcc,	loop_1259
	tvs	%icc,	0x0
	tge	%icc,	0x5
	fmovrdlz	%o6,	%f6,	%f4
loop_1259:
	fbe	%fcc2,	loop_1260
	orcc	%i0,	0x16D0,	%o3
	ldub	[%l7 + 0x70],	%l3
	wr	%g0,	0x80,	%asi
	stha	%o0,	[%l7 + 0x3A] %asi
loop_1260:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g5
	fble	%fcc3,	loop_1261
	nop
	setx	0x2E922A94,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x8C94416F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f8,	%f12
	addcc	%l5,	0x1DDF,	%g6
	ldd	[%l7 + 0x60],	%i4
loop_1261:
	array8	%i1,	%l4,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o1,	0x1D31,	%l2
	nop
	fitos	%f21,	%f25
	fpadd16	%f26,	%f18,	%f4
	swap	[%l7 + 0x44],	%i3
	tn	%icc,	0x3
	addc	%g7,	0x1E1A,	%o5
	orncc	%i6,	%g4,	%g2
	array8	%l0,	%o7,	%o4
	fmovsge	%xcc,	%f10,	%f19
	tg	%icc,	0x5
	movrgz	%g1,	%i7,	%o2
	fbn	%fcc2,	loop_1262
	addcc	%i4,	0x06B4,	%l6
	nop
	setx	0x35ECC54498E0B8C4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE30E1FD529D07A99,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f8,	%f6
	nop
	setx	0x7365564D8F400F79,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xBE33C9499942BA28,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f20,	%f10
loop_1262:
	stx	%g3,	[%l7 + 0x30]
	array8	%o6,	%i0,	%l1
	movrne	%o3,	0x046,	%l3
	array8	%g5,	%l5,	%g6
	taddcc	%i5,	0x1552,	%i1
	edge8l	%o0,	%i2,	%l4
	sub	%l2,	%o1,	%i3
	set	0x77, %l6
	stba	%o5,	[%l7 + %l6] 0x22
	membar	#Sync
	set	0x50, %o1
	stxa	%g7,	[%l7 + %o1] 0x89
	bcs,a,pt	%icc,	loop_1263
	xnor	%i6,	0x152C,	%g2
	fpsub32s	%f19,	%f2,	%f9
	movpos	%icc,	%g4,	%l0
loop_1263:
	sethi	0x027B,	%o4
	edge8ln	%o7,	%g1,	%i7
	udiv	%o2,	0x1771,	%i4
	andncc	%g3,	%l6,	%i0
	bvc,pt	%xcc,	loop_1264
	ldsw	[%l7 + 0x54],	%l1
	fpsub32s	%f2,	%f0,	%f19
	fsrc2s	%f10,	%f3
loop_1264:
	movvs	%icc,	%o6,	%l3
	alignaddr	%g5,	%o3,	%l5
	fpmerge	%f14,	%f2,	%f28
	set	0x78, %i1
	ldsha	[%l7 + %i1] 0x11,	%g6
	bne,a,pt	%icc,	loop_1265
	edge16n	%i5,	%o0,	%i1
	sra	%i2,	%l2,	%l4
	umulcc	%i3,	%o5,	%g7
loop_1265:
	st	%f16,	[%l7 + 0x08]
	sdivx	%o1,	0x1FC7,	%i6
	fpack32	%f12,	%f4,	%f0
	fpack16	%f20,	%f15
	bgu	%icc,	loop_1266
	fnors	%f25,	%f16,	%f22
	andcc	%g2,	0x1612,	%l0
	fmovrdgez	%o4,	%f20,	%f26
loop_1266:
	movle	%icc,	%o7,	%g1
	srl	%g4,	%o2,	%i4
	edge16n	%i7,	%g3,	%i0
	fbug	%fcc0,	loop_1267
	edge16n	%l1,	%l6,	%o6
	nop
	setx	0xC890C64B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x5AF2516A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f7,	%f31
	orncc	%g5,	0x0FF9,	%o3
loop_1267:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l3,	%l5
	prefetch	[%l7 + 0x5C],	 0x0
	tsubcc	%g6,	0x1FAC,	%i5
	be	loop_1268
	bne	%xcc,	loop_1269
	fbule,a	%fcc2,	loop_1270
	movleu	%icc,	%i1,	%i2
loop_1268:
	orcc	%o0,	%l4,	%l2
loop_1269:
	orn	%o5,	0x0B27,	%i3
loop_1270:
	tle	%icc,	0x4
	add	%g7,	0x1BF8,	%o1
	ldub	[%l7 + 0x72],	%i6
	ta	%xcc,	0x4
	call	loop_1271
	umul	%l0,	%o4,	%o7
	mova	%icc,	%g1,	%g2
	stbar
loop_1271:
	addccc	%o2,	%i4,	%i7
	bne	%xcc,	loop_1272
	ldsw	[%l7 + 0x70],	%g3
	edge16ln	%g4,	%i0,	%l1
	membar	0x43
loop_1272:
	fcmpne32	%f26,	%f8,	%l6
	sethi	0x1557,	%o6
	and	%o3,	%l3,	%l5
	bn,pt	%xcc,	loop_1273
	ld	[%l7 + 0x74],	%f1
	subcc	%g6,	%i5,	%g5
	addc	%i1,	0x17AA,	%o0
loop_1273:
	edge8n	%i2,	%l2,	%l4
	umul	%o5,	%i3,	%o1
	tl	%xcc,	0x5
	tvs	%icc,	0x1
	sll	%g7,	%l0,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o7,	0x0F5E,	%g1
	fnand	%f2,	%f22,	%f0
	fpmerge	%f18,	%f25,	%f26
	sdivx	%o4,	0x01DA,	%g2
	sdivcc	%i4,	0x14B0,	%i7
	fbge,a	%fcc2,	loop_1274
	edge8	%g3,	%g4,	%i0
	fabsd	%f12,	%f22
	fbne,a	%fcc1,	loop_1275
loop_1274:
	fandnot1	%f12,	%f28,	%f22
	sdivx	%o2,	0x1B6A,	%l6
	sub	%l1,	0x033C,	%o6
loop_1275:
	call	loop_1276
	bpos	%icc,	loop_1277
	edge32ln	%l3,	%l5,	%o3
	fbne,a	%fcc0,	loop_1278
loop_1276:
	movrlez	%g6,	0x306,	%i5
loop_1277:
	bvc,a,pn	%xcc,	loop_1279
	nop
	fitos	%f13,	%f22
loop_1278:
	fba,a	%fcc3,	loop_1280
	fnot1	%f30,	%f4
loop_1279:
	fbug	%fcc2,	loop_1281
	fblg,a	%fcc3,	loop_1282
loop_1280:
	brz,a	%g5,	loop_1283
	sdiv	%i1,	0x0385,	%i2
loop_1281:
	nop
	setx	loop_1284,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1282:
	fpadd32	%f24,	%f22,	%f16
loop_1283:
	tvc	%xcc,	0x3
	movn	%icc,	%l2,	%o0
loop_1284:
	fxors	%f22,	%f30,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l4,	%i3,	%o5
	sdiv	%g7,	0x1CBE,	%l0
	xorcc	%i6,	0x0622,	%o7
	smul	%o1,	0x13D6,	%o4
	te	%icc,	0x1
	movre	%g2,	%g1,	%i7
	array16	%i4,	%g3,	%i0
	movrlz	%g4,	%l6,	%o2
	fmovdcs	%icc,	%f19,	%f19
	te	%icc,	0x6
	nop
	setx	0x2F34428E7C784122,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x868ACF3604A09C62,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f0,	%f12
	edge8	%o6,	%l1,	%l5
	set	0x16, %i5
	ldsha	[%l7 + %i5] 0x18,	%l3
	fpack16	%f26,	%f30
	edge8	%g6,	%o3,	%i5
	edge8ln	%g5,	%i2,	%l2
	sdivcc	%o0,	0x1023,	%i1
	movgu	%xcc,	%i3,	%o5
	tneg	%icc,	0x3
	fbue,a	%fcc2,	loop_1285
	bvs,a	loop_1286
	xor	%l4,	%g7,	%i6
	fmovrslz	%o7,	%f4,	%f9
loop_1285:
	edge16l	%o1,	%l0,	%g2
loop_1286:
	nop
	set	0x64, %i7
	lduwa	[%l7 + %i7] 0x10,	%o4
	edge32ln	%i7,	%i4,	%g1
	movleu	%icc,	%g3,	%i0
	tl	%icc,	0x3
	fbuge,a	%fcc2,	loop_1287
	stbar
	tle	%icc,	0x5
	edge16n	%g4,	%o2,	%l6
loop_1287:
	mulscc	%l1,	0x10D9,	%o6
	fpsub16s	%f30,	%f0,	%f22
	fbn,a	%fcc0,	loop_1288
	srax	%l5,	0x14,	%g6
	edge32l	%l3,	%o3,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1288:
	nop
	fitos	%f5,	%f15
	fstox	%f15,	%f0
	fxtos	%f0,	%f7
	fandnot2s	%f10,	%f2,	%f9
	subc	%g5,	0x1EBF,	%l2
	mulscc	%o0,	0x1ABB,	%i1
	set	0x50, %o6
	stxa	%i3,	[%l7 + %o6] 0x19
	movrlz	%i2,	%l4,	%g7
	sdiv	%i6,	0x1303,	%o7
	fmovsne	%icc,	%f16,	%f22
	fbne,a	%fcc1,	loop_1289
	and	%o1,	%l0,	%o5
	brnz	%g2,	loop_1290
	sub	%i7,	%o4,	%i4
loop_1289:
	nop
	wr	%g0,	0xe3,	%asi
	stwa	%g3,	[%l7 + 0x50] %asi
	membar	#Sync
loop_1290:
	xorcc	%g1,	%i0,	%g4
	sll	%l6,	%l1,	%o6
	fnands	%f22,	%f11,	%f16
	fpack16	%f24,	%f12
	fmovrdgz	%l5,	%f12,	%f14
	array8	%g6,	%o2,	%o3
	sdivx	%i5,	0x1EF7,	%g5
	alignaddrl	%l2,	%l3,	%i1
	tg	%icc,	0x5
	smul	%o0,	0x1993,	%i2
	membar	0x6E
	edge8	%l4,	%i3,	%i6
	edge8	%g7,	%o7,	%o1
	udivcc	%l0,	0x0994,	%g2
	fzero	%f16
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%o5
	std	%f10,	[%l7 + 0x40]
	fones	%f11
	sdiv	%o4,	0x02E9,	%i4
	fbo,a	%fcc2,	loop_1291
	add	%i7,	%g1,	%g3
	fmovsge	%icc,	%f6,	%f20
	tg	%icc,	0x7
loop_1291:
	movrne	%g4,	%i0,	%l1
	fbue,a	%fcc2,	loop_1292
	bneg,pn	%xcc,	loop_1293
	subc	%o6,	%l6,	%l5
	fmovrsgez	%o2,	%f19,	%f18
loop_1292:
	movge	%xcc,	%g6,	%i5
loop_1293:
	movne	%icc,	%o3,	%g5
	set	0x60, %i3
	prefetcha	[%l7 + %i3] 0x15,	 0x2
	fxor	%f2,	%f6,	%f12
	edge32l	%l2,	%i1,	%i2
	movge	%xcc,	%o0,	%i3
	alignaddr	%l4,	%g7,	%o7
	brlz,a	%i6,	loop_1294
	edge8	%o1,	%l0,	%g2
	brgz,a	%o5,	loop_1295
	edge32	%o4,	%i7,	%g1
loop_1294:
	umul	%g3,	0x077D,	%i4
	movre	%g4,	%l1,	%o6
loop_1295:
	flush	%l7 + 0x74
	srl	%l6,	%i0,	%o2
	movrlez	%l5,	0x30A,	%i5
	movrlez	%o3,	0x235,	%g6
	fmovsvc	%icc,	%f22,	%f31
	udivcc	%l3,	0x04FF,	%l2
	srl	%g5,	0x05,	%i2
	bvs,a,pt	%xcc,	loop_1296
	edge8l	%i1,	%o0,	%l4
	movl	%icc,	%g7,	%o7
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f30
	fxtod	%f30,	%f8
loop_1296:
	fnot2	%f30,	%f10
	mulscc	%i3,	%i6,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x4
	mulscc	%l0,	0x00E5,	%g2
	fbue	%fcc0,	loop_1297
	sll	%o5,	0x19,	%i7
	brlz,a	%o4,	loop_1298
	movle	%xcc,	%g3,	%i4
loop_1297:
	ta	%xcc,	0x4
	subcc	%g4,	%l1,	%g1
loop_1298:
	nop
	set	0x20, %g1
	ldda	[%l7 + %g1] 0x04,	%i6
	mulscc	%o6,	%o2,	%l5
	fmovrse	%i5,	%f2,	%f24
	movg	%xcc,	%i0,	%g6
	edge16	%l3,	%l2,	%g5
	st	%f2,	[%l7 + 0x08]
	brgez	%o3,	loop_1299
	edge32l	%i2,	%o0,	%l4
	sllx	%g7,	%i1,	%i3
	tcs	%icc,	0x7
loop_1299:
	movg	%icc,	%o7,	%o1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ble,pt	%xcc,	loop_1300
	brgez,a	%l0,	loop_1301
	srlx	%i6,	%g2,	%o5
	nop
	setx	0x5DA0AB28,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xA6A790CB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f28,	%f28
loop_1300:
	ld	[%l7 + 0x1C],	%f15
loop_1301:
	tne	%icc,	0x4
	movne	%xcc,	%o4,	%i7
	addc	%i4,	%g3,	%g4
	edge8	%l1,	%l6,	%g1
	movneg	%icc,	%o2,	%l5
	edge16l	%i5,	%o6,	%g6
	fone	%f6
	move	%icc,	%l3,	%l2
	fmovsge	%xcc,	%f21,	%f0
	fbg,a	%fcc2,	loop_1302
	sdiv	%g5,	0x1640,	%i0
	srlx	%i2,	0x01,	%o3
	fba	%fcc0,	loop_1303
loop_1302:
	movvc	%xcc,	%o0,	%l4
	tl	%icc,	0x3
	tn	%icc,	0x2
loop_1303:
	ble,a,pt	%xcc,	loop_1304
	andcc	%g7,	0x0E90,	%i3
	ld	[%l7 + 0x64],	%f1
	edge32	%o7,	%i1,	%l0
loop_1304:
	tpos	%icc,	0x0
	movge	%icc,	%i6,	%g2
	array16	%o5,	%o1,	%o4
	array32	%i4,	%i7,	%g3
	nop
	fitos	%f3,	%f12
	fstod	%f12,	%f10
	nop
	fitos	%f5,	%f12
	fstoi	%f12,	%f17
	umulcc	%g4,	0x1A97,	%l6
	umul	%g1,	0x10C0,	%l1
	tn	%icc,	0x5
	swap	[%l7 + 0x78],	%l5
	add	%o2,	0x13A1,	%i5
	set	0x6C, %o2
	stba	%g6,	[%l7 + %o2] 0x2a
	membar	#Sync
	fmovsvs	%icc,	%f16,	%f28
	alignaddrl	%o6,	%l3,	%g5
	set	0x24, %l5
	stwa	%i0,	[%l7 + %l5] 0xe3
	membar	#Sync
	tle	%icc,	0x7
	sethi	0x0DA4,	%l2
	edge8ln	%o3,	%i2,	%l4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x89,	%o0,	%g7
	movcs	%icc,	%o7,	%i3
	add	%l0,	%i6,	%i1
	movre	%o5,	%o1,	%o4
	subccc	%i4,	%g2,	%g3
	nop
	setx	loop_1305,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%xcc,	%i7,	%g4
	te	%xcc,	0x2
	taddcctv	%g1,	0x16B9,	%l6
loop_1305:
	nop
	set	0x62, %i2
	sth	%l1,	[%l7 + %i2]
	movpos	%icc,	%o2,	%l5
	set	0x42, %l3
	lduba	[%l7 + %l3] 0x88,	%g6
	fmovrslz	%o6,	%f8,	%f10
	tcc	%xcc,	0x3
	alignaddr	%i5,	%l3,	%g5
	movcc	%xcc,	%l2,	%o3
	movn	%icc,	%i2,	%i0
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f14
	brlz,a	%l4,	loop_1306
	xnor	%g7,	0x1D26,	%o7
	smul	%o0,	%i3,	%i6
	tcc	%icc,	0x4
loop_1306:
	move	%xcc,	%i1,	%l0
	tg	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f26,	%f4,	%f18
	movvs	%icc,	%o1,	%o4
	addc	%o5,	0x11B0,	%g2
	brgz,a	%i4,	loop_1307
	nop
	setx	0xE11ED00F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x68F9B9DC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f28,	%f5
	ta	%icc,	0x4
	subccc	%i7,	0x154A,	%g4
loop_1307:
	ldub	[%l7 + 0x38],	%g1
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	tleu	%icc,	0x0
	tn	%icc,	0x1
	movgu	%icc,	%l6,	%o2
	fba,a	%fcc3,	loop_1308
	movl	%icc,	%l5,	%g6
	fnegs	%f27,	%f4
	movge	%icc,	%o6,	%l1
loop_1308:
	tvc	%xcc,	0x0
	fandnot2	%f4,	%f26,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x12
	ba,pn	%xcc,	loop_1309
	fbn	%fcc2,	loop_1310
	popc	0x18CD,	%l3
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
loop_1309:
	nop
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x220] %asi,	%g5
loop_1310:
	tsubcctv	%o3,	0x1DC2,	%l2
	bvs,pt	%icc,	loop_1311
	fmovdle	%xcc,	%f14,	%f19
	edge16l	%i0,	%l4,	%g7
	fbue,a	%fcc2,	loop_1312
loop_1311:
	mulscc	%o7,	%i2,	%o0
	prefetch	[%l7 + 0x24],	 0x2
	fbule,a	%fcc2,	loop_1313
loop_1312:
	fbuge,a	%fcc1,	loop_1314
	fmovdn	%xcc,	%f20,	%f10
	std	%f10,	[%l7 + 0x48]
loop_1313:
	fpadd32	%f30,	%f2,	%f16
loop_1314:
	edge32ln	%i6,	%i1,	%l0
	udivx	%i3,	0x0299,	%o4
	set	0x70, %l4
	sta	%f28,	[%l7 + %l4] 0x80
	edge32n	%o1,	%g2,	%i4
	add	%o5,	0x0AC8,	%i7
	bvs,pn	%xcc,	loop_1315
	bneg,a	loop_1316
	andcc	%g4,	0x11CA,	%g1
	fbu	%fcc1,	loop_1317
loop_1315:
	movle	%xcc,	%g3,	%o2
loop_1316:
	nop
	setx	loop_1318,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%l5,	0x1300,	%g6
loop_1317:
	udivx	%o6,	0x1343,	%l6
	umul	%l3,	%i5,	%l1
loop_1318:
	fmovsge	%icc,	%f9,	%f0
	and	%o3,	%l2,	%i0
	movvs	%icc,	%l4,	%g5
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f2
	srax	%o7,	0x0D,	%i2
	taddcc	%g7,	0x0AB9,	%o0
	orncc	%i1,	%i6,	%l0
	array16	%o4,	%i3,	%g2
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x50] %asi,	%f25
	sub	%o1,	0x09B6,	%i4
	for	%f30,	%f12,	%f28
	tleu	%xcc,	0x0
	ldx	[%l7 + 0x70],	%i7
	movrne	%g4,	0x13A,	%o5
	movl	%icc,	%g3,	%o2
	udiv	%l5,	0x0BCE,	%g1
	fand	%f12,	%f0,	%f26
	edge16ln	%o6,	%l6,	%l3
	set	0x44, %o0
	sta	%f24,	[%l7 + %o0] 0x10
	fmul8x16au	%f29,	%f17,	%f20
	tl	%xcc,	0x0
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x1C] %asi,	%i5
	fone	%f2
	tg	%icc,	0x7
	bvs,pn	%xcc,	loop_1319
	xorcc	%g6,	0x08CE,	%o3
	movvs	%icc,	%l2,	%i0
	fbe,a	%fcc0,	loop_1320
loop_1319:
	edge32ln	%l1,	%l4,	%g5
	orcc	%o7,	%i2,	%o0
	bn,pn	%icc,	loop_1321
loop_1320:
	fones	%f4
	tsubcctv	%i1,	%g7,	%i6
	edge32l	%l0,	%o4,	%i3
loop_1321:
	andncc	%g2,	%o1,	%i7
	movg	%xcc,	%i4,	%o5
	fbg,a	%fcc0,	loop_1322
	movvc	%xcc,	%g4,	%g3
	fmul8ulx16	%f14,	%f0,	%f24
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x10
loop_1322:
	umulcc	%o2,	0x0D16,	%g1
	edge16	%o6,	%l5,	%l3
	tleu	%icc,	0x7
	subc	%l6,	%g6,	%i5
	edge8n	%o3,	%i0,	%l1
	bneg	%icc,	loop_1323
	ldd	[%l7 + 0x38],	%l2
	ldub	[%l7 + 0x60],	%l4
	orcc	%g5,	0x1F53,	%i2
loop_1323:
	movleu	%icc,	%o0,	%o7
	ld	[%l7 + 0x10],	%f7
	fmovrsgez	%i1,	%f6,	%f22
	fxors	%f6,	%f2,	%f14
	bgu,a	%xcc,	loop_1324
	ba	loop_1325
	fsrc2s	%f25,	%f14
	popc	0x0842,	%g7
loop_1324:
	edge8ln	%l0,	%i6,	%o4
loop_1325:
	tpos	%xcc,	0x5
	fandnot2	%f16,	%f16,	%f6
	movn	%icc,	%g2,	%o1
	fmovse	%xcc,	%f4,	%f3
	nop
	set	0x1C, %l0
	lduw	[%l7 + %l0],	%i3
	tl	%xcc,	0x7
	bvs,pt	%xcc,	loop_1326
	edge16l	%i4,	%i7,	%g4
	mulx	%o5,	%g3,	%g1
	edge8n	%o2,	%l5,	%l3
loop_1326:
	sdivx	%o6,	0x0B14,	%g6
	stbar
	movrne	%l6,	%o3,	%i5
	be,a,pn	%icc,	loop_1327
	fmul8sux16	%f14,	%f16,	%f30
	tg	%xcc,	0x7
	orn	%l1,	%i0,	%l2
loop_1327:
	tneg	%xcc,	0x5
	taddcctv	%g5,	%i2,	%l4
	fbn	%fcc0,	loop_1328
	fmovsgu	%icc,	%f21,	%f1
	movre	%o0,	%o7,	%g7
	edge32l	%i1,	%l0,	%i6
loop_1328:
	movpos	%xcc,	%o4,	%o1
	udiv	%i3,	0x0374,	%i4
	orncc	%g2,	0x18CD,	%i7
	tg	%icc,	0x2
	udiv	%o5,	0x14C4,	%g3
	addcc	%g4,	0x0697,	%o2
	fbne	%fcc0,	loop_1329
	udivx	%l5,	0x1408,	%l3
	tn	%xcc,	0x0
	fornot1s	%f9,	%f1,	%f1
loop_1329:
	edge32	%o6,	%g1,	%l6
	orn	%o3,	0x0B6F,	%g6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%l1
	mova	%xcc,	%i0,	%l2
	smul	%i5,	0x0C59,	%g5
	movle	%icc,	%i2,	%l4
	fmovscs	%icc,	%f28,	%f19
	movvc	%icc,	%o0,	%g7
	ld	[%l7 + 0x64],	%f24
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o7,	%i1
	smulcc	%i6,	%l0,	%o4
	edge8ln	%i3,	%o1,	%g2
	fmovdg	%icc,	%f24,	%f31
	bl	%icc,	loop_1330
	sub	%i4,	%o5,	%g3
	movrlez	%g4,	0x2E8,	%o2
	subc	%l5,	%l3,	%o6
loop_1330:
	be	loop_1331
	xorcc	%i7,	0x03B5,	%g1
	bg	loop_1332
	tge	%xcc,	0x2
loop_1331:
	xorcc	%l6,	%g6,	%o3
	swap	[%l7 + 0x48],	%i0
loop_1332:
	be,pt	%xcc,	loop_1333
	fmovspos	%xcc,	%f29,	%f4
	subc	%l2,	%l1,	%i5
	fcmpeq32	%f22,	%f4,	%i2
loop_1333:
	srl	%l4,	%g5,	%o0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x43] %asi,	%o7
	xnor	%i1,	0x07A1,	%g7
	fnegd	%f0,	%f26
	sth	%l0,	[%l7 + 0x78]
	xor	%i6,	%o4,	%o1
	movgu	%icc,	%i3,	%g2
	fbn	%fcc0,	loop_1334
	edge8l	%i4,	%g3,	%g4
	sir	0x1F58
	fornot1	%f8,	%f8,	%f10
loop_1334:
	addc	%o2,	0x1D55,	%l5
	fmovs	%f6,	%f3
	movgu	%icc,	%l3,	%o6
	bgu,pt	%xcc,	loop_1335
	tge	%xcc,	0x7
	fbule,a	%fcc2,	loop_1336
	bge	%xcc,	loop_1337
loop_1335:
	edge32n	%o5,	%g1,	%i7
	nop
	setx	0xD17106A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xFF43F8DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f4,	%f30
loop_1336:
	ld	[%l7 + 0x14],	%f27
loop_1337:
	fbu	%fcc0,	loop_1338
	fmul8x16al	%f8,	%f5,	%f26
	mova	%icc,	%l6,	%g6
	fmul8sux16	%f4,	%f0,	%f2
loop_1338:
	st	%f8,	[%l7 + 0x50]
	orcc	%o3,	0x05D0,	%l2
	udivx	%i0,	0x0E7D,	%i5
	edge32	%l1,	%i2,	%g5
	srl	%o0,	%o7,	%i1
	movg	%icc,	%g7,	%l0
	brz	%i6,	loop_1339
	sll	%l4,	%o4,	%o1
	movge	%xcc,	%g2,	%i4
	bleu	%icc,	loop_1340
loop_1339:
	movleu	%icc,	%g3,	%g4
	nop
	setx	0x56ACF7959AFB4B21,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x64C0C0DE5E1F32A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f16,	%f0
	fpadd32	%f0,	%f18,	%f8
loop_1340:
	fblg,a	%fcc0,	loop_1341
	movrgez	%o2,	%l5,	%l3
	bne,pt	%xcc,	loop_1342
	movneg	%xcc,	%i3,	%o6
loop_1341:
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f4
	fxtod	%f4,	%f4
	wr	%g0,	0x80,	%asi
	sta	%f1,	[%l7 + 0x58] %asi
loop_1342:
	andncc	%g1,	%o5,	%l6
	tneg	%xcc,	0x5
	fsrc1s	%f8,	%f9
	ld	[%l7 + 0x4C],	%f31
	movcs	%icc,	%i7,	%o3
	taddcctv	%l2,	%g6,	%i5
	movne	%icc,	%i0,	%l1
	sdivcc	%g5,	0x078B,	%i2
	srax	%o7,	%o0,	%i1
	addccc	%g7,	0x113C,	%l0
	orcc	%i6,	%l4,	%o4
	movl	%icc,	%g2,	%o1
	orn	%g3,	0x0452,	%i4
	fands	%f11,	%f29,	%f1
	nop
	setx	0x905F325F,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	edge8	%g4,	%o2,	%l5
	edge32n	%i3,	%l3,	%g1
	bgu,a,pt	%xcc,	loop_1343
	fbug,a	%fcc1,	loop_1344
	ldsb	[%l7 + 0x0D],	%o5
	stb	%o6,	[%l7 + 0x77]
loop_1343:
	fmovsa	%xcc,	%f10,	%f28
loop_1344:
	fnand	%f2,	%f8,	%f2
	fmovsg	%icc,	%f2,	%f0
	fmovd	%f2,	%f20
	array32	%l6,	%o3,	%i7
	edge8ln	%g6,	%i5,	%i0
	fbne,a	%fcc1,	loop_1345
	brlez	%l2,	loop_1346
	fnands	%f2,	%f28,	%f18
	fmovdle	%xcc,	%f12,	%f13
loop_1345:
	tge	%xcc,	0x6
loop_1346:
	mulx	%l1,	%i2,	%o7
	tsubcctv	%o0,	0x11DF,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x2
	membar	0x11
	movneg	%xcc,	%g5,	%l0
	umulcc	%i6,	0x0885,	%g7
	set	0x08, %i4
	ldsha	[%l7 + %i4] 0x81,	%l4
	edge32	%o4,	%o1,	%g2
	fmovsa	%icc,	%f25,	%f19
	and	%g3,	0x162F,	%g4
	nop
	setx	0x35C5E122,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x0874BB6D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f14,	%f14
	brlz,a	%i4,	loop_1347
	tsubcc	%o2,	0x0772,	%i3
	edge8ln	%l3,	%l5,	%o5
	sub	%o6,	%g1,	%o3
loop_1347:
	call	loop_1348
	fbge,a	%fcc3,	loop_1349
	sdivx	%i7,	0x1A3F,	%l6
	movpos	%icc,	%i5,	%g6
loop_1348:
	taddcctv	%l2,	0x05CB,	%i0
loop_1349:
	andn	%l1,	0x016F,	%o7
	movn	%xcc,	%o0,	%i1
	fsrc2s	%f25,	%f18
	movg	%xcc,	%i2,	%l0
	add	%i6,	0x0A2A,	%g7
	tn	%icc,	0x1
	fmovsn	%icc,	%f8,	%f17
	ldsw	[%l7 + 0x68],	%g5
	bpos,a	%xcc,	loop_1350
	popc	0x17EF,	%o4
	fxnors	%f11,	%f20,	%f2
	orncc	%o1,	%g2,	%l4
loop_1350:
	movrgez	%g3,	%g4,	%o2
	bn,a,pn	%xcc,	loop_1351
	std	%f0,	[%l7 + 0x70]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i4,	%l3
loop_1351:
	bl,a,pt	%xcc,	loop_1352
	ldsh	[%l7 + 0x5A],	%i3
	fmovsneg	%xcc,	%f7,	%f4
	edge32n	%l5,	%o6,	%o5
loop_1352:
	nop
	fitos	%f14,	%f11
	fstoi	%f11,	%f23
	array32	%g1,	%i7,	%o3
	xnorcc	%i5,	%g6,	%l6
	ba,a,pt	%xcc,	loop_1353
	movle	%icc,	%i0,	%l2
	orncc	%o7,	0x19C4,	%l1
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f2
	fxtod	%f2,	%f30
loop_1353:
	ta	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%i1,	0x06ED,	%i2
	fmovdne	%xcc,	%f13,	%f18
	tleu	%icc,	0x0
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	tvs	%xcc,	0x2
	fmovsn	%xcc,	%f1,	%f1
	nop
	set	0x12, %g6
	lduh	[%l7 + %g6],	%i6
	ldsw	[%l7 + 0x34],	%l0
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge16ln	%g7,	%g5,	%o4
	fcmple16	%f6,	%f28,	%o1
	fnot1s	%f15,	%f29
	movgu	%xcc,	%g2,	%g3
	bneg,a,pn	%icc,	loop_1354
	tleu	%xcc,	0x4
	fmovdge	%icc,	%f28,	%f18
	edge16	%l4,	%g4,	%o2
loop_1354:
	sir	0x1937
	fbule	%fcc2,	loop_1355
	movle	%xcc,	%i4,	%i3
	fzeros	%f15
	nop
	setx	0x5925C419254AFA82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x723E461FC0F85A20,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f18,	%f22
loop_1355:
	edge8ln	%l5,	%l3,	%o6
	fbge	%fcc3,	loop_1356
	fmovdgu	%xcc,	%f26,	%f8
	fmovrde	%g1,	%f24,	%f10
	fone	%f26
loop_1356:
	fmovdg	%xcc,	%f31,	%f29
	udivcc	%i7,	0x0102,	%o3
	fbul	%fcc2,	loop_1357
	smulcc	%o5,	0x0895,	%i5
	srlx	%g6,	%l6,	%i0
	sethi	0x0DEF,	%o7
loop_1357:
	srlx	%l1,	%i1,	%i2
	srl	%l2,	0x12,	%o0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	alignaddr	%l0,	%g5,	%g7
	xnor	%o4,	0x1444,	%o1
	subc	%g3,	0x071E,	%g2
	movre	%g4,	%l4,	%o2
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x72] %asi,	%i3
	edge16l	%l5,	%i4,	%o6
	xor	%l3,	0x1F44,	%g1
	taddcc	%i7,	%o5,	%o3
	brlz,a	%i5,	loop_1358
	nop
	setx	0x02971BB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f6
	fmovsn	%xcc,	%f19,	%f31
	bn,a,pt	%xcc,	loop_1359
loop_1358:
	fbl	%fcc1,	loop_1360
	call	loop_1361
	tsubcctv	%g6,	%l6,	%i0
loop_1359:
	umul	%l1,	%i1,	%i2
loop_1360:
	brlez,a	%l2,	loop_1362
loop_1361:
	alignaddrl	%o7,	%o0,	%i6
	sdiv	%g5,	0x10C8,	%l0
	tvc	%icc,	0x2
loop_1362:
	nop
	setx	0x10699242,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	faligndata	%f20,	%f6,	%f14
	addc	%g7,	0x0FFF,	%o4
	nop
	fitos	%f4,	%f18
	fstod	%f18,	%f24
	movcc	%icc,	%g3,	%o1
	xnorcc	%g4,	%g2,	%o2
	ldsb	[%l7 + 0x6A],	%l4
	sub	%l5,	%i3,	%o6
	bge	%icc,	loop_1363
	fblg,a	%fcc1,	loop_1364
	srl	%l3,	%i4,	%g1
	fmul8sux16	%f10,	%f2,	%f30
loop_1363:
	sll	%o5,	%i7,	%o3
loop_1364:
	smulcc	%g6,	0x1EB0,	%l6
	edge16n	%i0,	%l1,	%i5
	alignaddr	%i2,	%i1,	%o7
	tsubcc	%o0,	%l2,	%g5
	movvc	%xcc,	%l0,	%i6
	orncc	%o4,	%g7,	%g3
	fmovsa	%xcc,	%f5,	%f0
	movrlez	%o1,	0x1D0,	%g2
	fcmpeq32	%f2,	%f20,	%o2
	mulscc	%g4,	%l5,	%l4
	nop
	set	0x68, %o5
	stx	%o6,	[%l7 + %o5]
	tgu	%icc,	0x5
	sdiv	%i3,	0x0070,	%l3
	fmovdn	%xcc,	%f3,	%f21
	stx	%i4,	[%l7 + 0x48]
	fmovrsgz	%g1,	%f22,	%f24
	orcc	%o5,	%i7,	%g6
	srlx	%l6,	%i0,	%l1
	fxor	%f30,	%f16,	%f14
	movge	%icc,	%o3,	%i5
	subc	%i1,	%o7,	%o0
	sethi	0x1D74,	%l2
	fmovrdgez	%g5,	%f14,	%f10
	fabsd	%f12,	%f22
	fblg,a	%fcc2,	loop_1365
	movrgz	%l0,	%i2,	%i6
	movg	%icc,	%g7,	%o4
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x18] %asi,	%g3
loop_1365:
	sethi	0x06B7,	%g2
	andncc	%o2,	%g4,	%l5
	udivx	%l4,	0x01F2,	%o1
	fmovsle	%xcc,	%f9,	%f8
	fmul8x16al	%f18,	%f13,	%f16
	membar	0x28
	nop
	setx	0x7CB89B5C0910045D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f18
	nop
	setx	0x9F171FF74058E8D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	tneg	%icc,	0x7
	movne	%xcc,	%o6,	%l3
	array32	%i4,	%i3,	%o5
	edge32n	%g1,	%i7,	%l6
	std	%f22,	[%l7 + 0x28]
	fcmpeq32	%f24,	%f26,	%i0
	movrgez	%l1,	0x11D,	%g6
	fmovdge	%xcc,	%f3,	%f0
	ldd	[%l7 + 0x10],	%o2
	tle	%xcc,	0x3
	mulx	%i5,	0x0108,	%i1
	addccc	%o7,	0x1352,	%o0
	nop
	fitos	%f7,	%f25
	fstod	%f25,	%f12
	fmovdleu	%xcc,	%f28,	%f10
	fmovsvs	%xcc,	%f30,	%f13
	fcmpgt32	%f30,	%f8,	%l2
	set	0x0C, %g4
	stba	%l0,	[%l7 + %g4] 0x15
	fbul	%fcc3,	loop_1366
	edge16l	%i2,	%g5,	%i6
	and	%g7,	%o4,	%g3
	movneg	%xcc,	%o2,	%g2
loop_1366:
	umulcc	%g4,	%l5,	%o1
	nop
	setx	0x954F4FB71EC67761,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f10
	andn	%o6,	0x0433,	%l3
	fone	%f20
	andcc	%l4,	0x179D,	%i3
	fbe,a	%fcc1,	loop_1367
	taddcc	%i4,	0x02AD,	%o5
	subcc	%g1,	0x00BE,	%l6
	edge32	%i7,	%l1,	%i0
loop_1367:
	fmovdpos	%icc,	%f2,	%f18
	movrgz	%o3,	0x31E,	%g6
	fmovdvs	%xcc,	%f8,	%f22
	sra	%i5,	%i1,	%o0
	nop
	setx	0xB17C4698,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x9770C8D2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f12,	%f19
	fmovsl	%xcc,	%f6,	%f18
	brlez,a	%o7,	loop_1368
	movpos	%xcc,	%l2,	%l0
	fmovsg	%xcc,	%f0,	%f23
	set	0x34, %g2
	stha	%i2,	[%l7 + %g2] 0x2a
	membar	#Sync
loop_1368:
	array16	%i6,	%g5,	%g7
	set	0x58, %o3
	ldxa	[%l7 + %o3] 0x80,	%o4
	tvc	%icc,	0x1
	edge32	%o2,	%g2,	%g4
	edge32	%g3,	%l5,	%o1
	call	loop_1369
	movpos	%xcc,	%o6,	%l3
	fmovsleu	%icc,	%f26,	%f30
	subc	%i3,	%i4,	%l4
loop_1369:
	fpack32	%f16,	%f16,	%f28
	tsubcc	%g1,	%l6,	%i7
	fnand	%f4,	%f24,	%f2
	edge16	%o5,	%i0,	%l1
	movvc	%xcc,	%o3,	%i5
	sdivx	%g6,	0x04BC,	%o0
	ld	[%l7 + 0x70],	%f2
	or	%o7,	0x1D7B,	%i1
	bne,a,pt	%icc,	loop_1370
	mova	%xcc,	%l0,	%l2
	andncc	%i2,	%g5,	%i6
	tsubcctv	%g7,	%o2,	%g2
loop_1370:
	movg	%icc,	%o4,	%g4
	nop
	setx	loop_1371,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%icc,	%g3,	%l5
	fbo	%fcc3,	loop_1372
	orn	%o1,	%o6,	%i3
loop_1371:
	addc	%i4,	%l3,	%g1
	fmul8ulx16	%f24,	%f14,	%f22
loop_1372:
	movvc	%xcc,	%l4,	%l6
	taddcc	%i7,	%i0,	%o5
	fbul,a	%fcc3,	loop_1373
	orncc	%o3,	0x19AC,	%i5
	movne	%icc,	%g6,	%o0
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x4E] %asi,	%o7
loop_1373:
	fpsub32	%f8,	%f2,	%f16
	fmovrdlz	%i1,	%f20,	%f2
	fmovdl	%xcc,	%f11,	%f2
	bg	%xcc,	loop_1374
	mulx	%l1,	0x07FF,	%l2
	and	%i2,	0x08D4,	%g5
	tle	%xcc,	0x4
loop_1374:
	tn	%xcc,	0x7
	fbne,a	%fcc2,	loop_1375
	tgu	%xcc,	0x2
	sdivcc	%l0,	0x0E4A,	%i6
	nop
	setx loop_1376, %l0, %l1
	jmpl %l1, %o2
loop_1375:
	orcc	%g2,	0x1F6A,	%g7
	mova	%icc,	%g4,	%o4
	sdivcc	%l5,	0x162E,	%g3
loop_1376:
	sir	0x05BB
	fmovscc	%icc,	%f12,	%f19
	array32	%o6,	%o1,	%i3
	addc	%i4,	0x1A46,	%g1
	tge	%xcc,	0x3
	array16	%l4,	%l3,	%i7
	movrlez	%l6,	%o5,	%i0
	mulx	%o3,	%g6,	%o0
	nop
	setx	0xA1362F4574EF9DB7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f18
	brz,a	%o7,	loop_1377
	tcs	%xcc,	0x6
	sth	%i5,	[%l7 + 0x10]
	tneg	%xcc,	0x0
loop_1377:
	fmovsl	%icc,	%f15,	%f5
	edge8	%l1,	%i1,	%i2
	fmovsneg	%xcc,	%f25,	%f31
	fnot1	%f10,	%f22
	srlx	%g5,	%l2,	%i6
	flush	%l7 + 0x54
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f22
	fxtod	%f22,	%f26
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%l0
	membar	0x3E
	sra	%g2,	0x17,	%g7
	sra	%o2,	%o4,	%g4
	te	%icc,	0x5
	fbug,a	%fcc0,	loop_1378
	movrne	%l5,	%g3,	%o6
	fors	%f8,	%f8,	%f24
	fbe	%fcc0,	loop_1379
loop_1378:
	call	loop_1380
	stb	%o1,	[%l7 + 0x49]
	edge16ln	%i3,	%i4,	%g1
loop_1379:
	addcc	%l4,	%l3,	%i7
loop_1380:
	mulx	%l6,	0x0A52,	%o5
	fbule,a	%fcc2,	loop_1381
	stw	%o3,	[%l7 + 0x08]
	movn	%icc,	%g6,	%o0
	tsubcctv	%o7,	0x1A1F,	%i0
loop_1381:
	nop
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i5
	fmovdvc	%icc,	%f16,	%f5
	udiv	%i1,	0x1058,	%i2
	nop
	setx	0x200DED9BDE0F07D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x786E4096D2EAF034,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f6,	%f24
	ld	[%l7 + 0x34],	%f29
	movvs	%icc,	%l1,	%g5
	bpos	loop_1382
	movgu	%xcc,	%l2,	%l0
	nop
	setx	0x9810C828,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x6ECA5037,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f23,	%f1
	alignaddrl	%i6,	%g7,	%g2
loop_1382:
	fcmple16	%f6,	%f6,	%o4
	ta	%icc,	0x0
	fmovs	%f20,	%f18
	movrgez	%o2,	%l5,	%g3
	tsubcctv	%g4,	%o6,	%o1
	movne	%icc,	%i4,	%i3
	lduw	[%l7 + 0x6C],	%g1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bvc,pt	%icc,	loop_1383
	movne	%icc,	%l3,	%i7
	bpos	%xcc,	loop_1384
	fmovda	%xcc,	%f22,	%f25
loop_1383:
	alignaddrl	%l4,	%o5,	%o3
	set	0x60, %g7
	prefetcha	[%l7 + %g7] 0x81,	 0x1
loop_1384:
	ldx	[%l7 + 0x40],	%g6
	wr	%g0,	0x18,	%asi
	stxa	%o0,	[%l7 + 0x40] %asi
	fmovrdlz	%i0,	%f26,	%f22
	tg	%xcc,	0x6
	fmovspos	%xcc,	%f6,	%f11
	wr	%g0,	0x80,	%asi
	sta	%f30,	[%l7 + 0x18] %asi
	taddcc	%o7,	0x1E1E,	%i5
	movne	%icc,	%i1,	%i2
	sir	0x1349
	movcs	%icc,	%l1,	%l2
	fpsub32s	%f27,	%f17,	%f0
	brlz	%l0,	loop_1385
	edge16l	%g5,	%i6,	%g2
	edge8l	%o4,	%g7,	%o2
	fbe,a	%fcc3,	loop_1386
loop_1385:
	faligndata	%f16,	%f14,	%f20
	movrlez	%g3,	0x02B,	%l5
	movrgez	%g4,	%o6,	%o1
loop_1386:
	tvs	%icc,	0x3
	andn	%i4,	%i3,	%g1
	prefetch	[%l7 + 0x64],	 0x2
	movg	%icc,	%i7,	%l3
	orn	%l4,	%o5,	%l6
	te	%xcc,	0x1
	edge16ln	%g6,	%o3,	%o0
	fbue	%fcc0,	loop_1387
	fmovdl	%icc,	%f1,	%f30
	tneg	%xcc,	0x3
	movrlez	%i0,	0x107,	%i5
loop_1387:
	movrlez	%o7,	0x148,	%i2
	fpadd16s	%f28,	%f18,	%f2
	bpos,a,pn	%icc,	loop_1388
	fxnors	%f25,	%f28,	%f1
	bcs,pt	%icc,	loop_1389
	movre	%i1,	0x39D,	%l1
loop_1388:
	edge16ln	%l2,	%g5,	%i6
	movrlz	%l0,	%o4,	%g2
loop_1389:
	fble,a	%fcc1,	loop_1390
	array8	%o2,	%g7,	%l5
	brlez	%g3,	loop_1391
	movre	%o6,	0x366,	%g4
loop_1390:
	fmovsgu	%icc,	%f29,	%f6
	edge32l	%i4,	%o1,	%g1
loop_1391:
	movcc	%xcc,	%i7,	%i3
	set	0x30, %l2
	ldsha	[%l7 + %l2] 0x81,	%l4
	stbar
	movre	%l3,	0x398,	%o5
	be	loop_1392
	brlz,a	%g6,	loop_1393
	ble,a,pt	%xcc,	loop_1394
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1392:
	fxnor	%f28,	%f10,	%f20
loop_1393:
	tvc	%icc,	0x0
loop_1394:
	orcc	%l6,	%o0,	%o3
	edge16n	%i5,	%o7,	%i2
	edge8	%i0,	%l1,	%l2
	prefetch	[%l7 + 0x38],	 0x2
	fnegs	%f23,	%f10
	movn	%icc,	%g5,	%i6
	edge8	%i1,	%l0,	%o4
	movpos	%icc,	%o2,	%g7
	sdiv	%l5,	0x0647,	%g3
	movcc	%xcc,	%o6,	%g4
	edge16	%i4,	%g2,	%o1
	addcc	%g1,	%i7,	%i3
	membar	0x05
	movrgez	%l3,	%o5,	%l4
	fmovsleu	%xcc,	%f12,	%f21
	nop
	setx	0x804DB2CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x44] %asi,	%g6
	nop
	setx	0xBC2DF6BF0FD161D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x396432F443741BEC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f0,	%f22
	fmuld8ulx16	%f23,	%f18,	%f2
	tgu	%xcc,	0x1
	brz	%l6,	loop_1395
	fabss	%f8,	%f24
	orcc	%o0,	0x0054,	%i5
	ldsb	[%l7 + 0x34],	%o3
loop_1395:
	srl	%i2,	0x0B,	%i0
	brgez	%o7,	loop_1396
	udiv	%l2,	0x1733,	%l1
	for	%f8,	%f6,	%f24
	fpsub32s	%f22,	%f9,	%f17
loop_1396:
	sub	%i6,	0x1C3F,	%g5
	movcc	%xcc,	%i1,	%o4
	add	%l0,	0x051B,	%g7
	ldub	[%l7 + 0x40],	%l5
	ldsw	[%l7 + 0x30],	%g3
	sll	%o6,	%g4,	%o2
	fbge,a	%fcc0,	loop_1397
	andn	%i4,	%o1,	%g2
	movpos	%xcc,	%i7,	%g1
	fones	%f26
loop_1397:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x20, %i0
	stx	%l3,	[%l7 + %i0]
	fabss	%f26,	%f9
	xnorcc	%o5,	0x1BE5,	%i3
	fmovs	%f30,	%f18
	nop
	fitod	%f19,	%f0
	fmovdne	%xcc,	%f2,	%f1
	set	0x7C, %o4
	lda	[%l7 + %o4] 0x04,	%f18
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%g6,	%l6
	sllx	%o0,	0x0C,	%l4
	nop
	setx	0x6984A662,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f28
	tsubcc	%o3,	%i5,	%i0
	sllx	%i2,	0x0C,	%l2
	fmovd	%f6,	%f0
	edge32ln	%l1,	%o7,	%i6
	movre	%g5,	0x2C2,	%i1
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o4
	addccc	%g7,	%l5,	%l0
	srl	%g3,	%g4,	%o6
	edge16n	%i4,	%o1,	%o2
	nop
	setx	0x5F6AE3E86DC5C418,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x3800297174AF7F55,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f12,	%f12
	orcc	%i7,	%g2,	%g1
	sllx	%o5,	0x0A,	%i3
	xnorcc	%g6,	0x107F,	%l6
	sdivx	%l3,	0x06FF,	%o0
	subc	%o3,	0x1A94,	%i5
	fmovdge	%icc,	%f14,	%f16
	andncc	%i0,	%l4,	%i2
	subccc	%l1,	%o7,	%l2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%g5
	movre	%o4,	%i1,	%g7
	popc	%l5,	%g3
	bleu	%icc,	loop_1398
	prefetch	[%l7 + 0x60],	 0x0
	sdiv	%l0,	0x0418,	%g4
	nop
	setx	0xCF7AC2CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xE6ACB956,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f5,	%f27
loop_1398:
	fmovrde	%o6,	%f10,	%f28
	fmovsvs	%xcc,	%f14,	%f16
	tg	%icc,	0x3
	array16	%o1,	%o2,	%i7
	edge8	%i4,	%g1,	%g2
	fcmpeq32	%f6,	%f2,	%o5
	fmovde	%xcc,	%f3,	%f8
	bpos,pn	%xcc,	loop_1399
	call	loop_1400
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f18
	set	0x3E, %i6
	stha	%g6,	[%l7 + %i6] 0xe3
	membar	#Sync
loop_1399:
	orncc	%l6,	0x06D9,	%l3
loop_1400:
	movcc	%icc,	%o0,	%o3
	mulx	%i3,	%i5,	%l4
	orncc	%i0,	0x0437,	%i2
	fpack32	%f8,	%f22,	%f0
	srax	%o7,	0x0D,	%l2
	edge16	%i6,	%g5,	%l1
	edge16l	%o4,	%i1,	%g7
	edge32ln	%g3,	%l5,	%g4
	umulcc	%l0,	%o1,	%o6
	fmul8x16au	%f6,	%f14,	%f28
	array32	%o2,	%i4,	%i7
	fmovrdlez	%g1,	%f8,	%f0
	taddcctv	%o5,	0x1C2E,	%g6
	tsubcc	%l6,	%l3,	%o0
	add	%g2,	0x14DC,	%o3
	bcs	%icc,	loop_1401
	bshuffle	%f24,	%f18,	%f10
	edge16n	%i3,	%l4,	%i5
	movcc	%xcc,	%i2,	%i0
loop_1401:
	fornot1s	%f3,	%f26,	%f2
	tne	%icc,	0x1
	fmuld8sux16	%f5,	%f8,	%f28
	ba,pn	%icc,	loop_1402
	movgu	%xcc,	%o7,	%i6
	sdiv	%l2,	0x1166,	%l1
	tle	%xcc,	0x1
loop_1402:
	xnor	%o4,	0x0B95,	%i1
	fcmpgt32	%f2,	%f10,	%g5
	edge32l	%g3,	%l5,	%g7
	fbne	%fcc2,	loop_1403
	fble	%fcc2,	loop_1404
	fmovsle	%icc,	%f24,	%f14
	andn	%l0,	%o1,	%g4
loop_1403:
	alignaddrl	%o2,	%i4,	%o6
loop_1404:
	fmovsg	%xcc,	%f24,	%f26
	movg	%xcc,	%i7,	%g1
	set	0x30, %g5
	lduha	[%l7 + %g5] 0x18,	%o5
	tn	%icc,	0x0
	ta	%xcc,	0x3
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%f10
	movre	%l6,	%l3,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g2,	[%l7 + 0x20]
	fpsub32s	%f16,	%f2,	%f22
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0x10
	movgu	%xcc,	%o0,	%i3
	brgez,a	%o3,	loop_1405
	sra	%i5,	0x03,	%l4
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
loop_1405:
	tne	%icc,	0x4
	edge8ln	%i2,	%i6,	%o7
	ta	%xcc,	0x7
	addccc	%l1,	%l2,	%i1
	movgu	%icc,	%g5,	%g3
	tleu	%xcc,	0x7
	fmovdvs	%icc,	%f30,	%f28
	ble,a,pt	%icc,	loop_1406
	andncc	%l5,	%g7,	%o4
	movgu	%xcc,	%o1,	%l0
	fpsub32s	%f7,	%f22,	%f15
loop_1406:
	fmovrsgz	%o2,	%f24,	%f20
	fmovdpos	%xcc,	%f5,	%f2
	fornot1	%f26,	%f18,	%f22
	tleu	%xcc,	0x1
	call	loop_1407
	andn	%g4,	0x0931,	%i4
	movrlez	%i7,	%o6,	%g1
	fbn,a	%fcc2,	loop_1408
loop_1407:
	lduw	[%l7 + 0x64],	%l6
	nop
	setx loop_1409, %l0, %l1
	jmpl %l1, %l3
	tpos	%xcc,	0x4
loop_1408:
	subc	%g6,	0x1614,	%o5
	movleu	%xcc,	%o0,	%i3
loop_1409:
	fmuld8sux16	%f31,	%f5,	%f8
	set	0x60, %l6
	lduba	[%l7 + %l6] 0x14,	%g2
	tgu	%icc,	0x4
	addc	%o3,	%i5,	%i0
	addc	%l4,	%i6,	%i2
	move	%xcc,	%o7,	%l1
	ble,pn	%icc,	loop_1410
	fmovsle	%icc,	%f30,	%f12
	sir	0x1EBA
	wr	%g0,	0x18,	%asi
	sta	%f14,	[%l7 + 0x40] %asi
loop_1410:
	tg	%icc,	0x6
	movge	%icc,	%i1,	%l2
	sdiv	%g3,	0x011A,	%l5
	stw	%g7,	[%l7 + 0x48]
	addccc	%o4,	0x14F4,	%o1
	movrne	%g5,	%l0,	%o2
	bn	loop_1411
	stw	%i4,	[%l7 + 0x1C]
	movpos	%xcc,	%g4,	%o6
	brlz,a	%i7,	loop_1412
loop_1411:
	fnot1	%f2,	%f0
	tvs	%icc,	0x1
	for	%f22,	%f0,	%f14
loop_1412:
	swap	[%l7 + 0x3C],	%g1
	edge16ln	%l3,	%g6,	%l6
	movrne	%o0,	0x35A,	%o5
	tneg	%xcc,	0x6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x40] %asi,	%g2
	bgu	%icc,	loop_1413
	ble,a	%xcc,	loop_1414
	nop
	setx	loop_1415,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xorcc	%i3,	0x1511,	%i5
loop_1413:
	or	%o3,	0x098C,	%i0
loop_1414:
	tne	%icc,	0x7
loop_1415:
	movne	%xcc,	%l4,	%i2
	swap	[%l7 + 0x20],	%o7
	bneg,a	%xcc,	loop_1416
	stbar
	edge16n	%l1,	%i6,	%l2
	movle	%icc,	%i1,	%g3
loop_1416:
	fbul	%fcc1,	loop_1417
	tn	%icc,	0x3
	sth	%l5,	[%l7 + 0x36]
	orn	%g7,	0x15D6,	%o1
loop_1417:
	nop
	set	0x390, %o1
	nop 	! 	nop 	! 	ldxa	[%g0 + %o1] 0x40,	%o4 ripped by fixASI40.pl ripped by fixASI40.pl
	movn	%icc,	%l0,	%g5
	addccc	%i4,	%g4,	%o2
	fmovsne	%xcc,	%f1,	%f0
	edge16	%i7,	%g1,	%o6
	array32	%g6,	%l3,	%l6
	taddcctv	%o0,	0x0D34,	%g2
	tle	%icc,	0x4
	srl	%o5,	%i5,	%o3
	sdiv	%i0,	0x06B8,	%l4
	edge32	%i3,	%i2,	%l1
	fmovrslez	%o7,	%f15,	%f29
	ba	%icc,	loop_1418
	umulcc	%i6,	0x0479,	%l2
	array16	%g3,	%i1,	%g7
	addcc	%o1,	0x009F,	%o4
loop_1418:
	xnorcc	%l5,	%l0,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%xcc,	%f0,	%f29
	sdivx	%g4,	0x1D1B,	%o2
	nop
	set	0x10, %i1
	ldx	[%l7 + %i1],	%i7
	nop
	setx	0x759C0801,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x103FF0D7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f8,	%f13
	edge16	%g5,	%o6,	%g6
	fmul8x16au	%f12,	%f17,	%f24
	fpadd16s	%f19,	%f2,	%f21
	ta	%icc,	0x0
	tn	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2A] %asi,	%g1
	ld	[%l7 + 0x3C],	%f30
	smulcc	%l3,	0x134F,	%o0
	edge8l	%l6,	%o5,	%i5
	add	%g2,	%i0,	%o3
	umulcc	%i3,	0x0262,	%i2
	fblg,a	%fcc0,	loop_1419
	nop
	set	0x0C, %i7
	lduh	[%l7 + %i7],	%l4
	edge32	%l1,	%i6,	%o7
	sub	%g3,	%l2,	%g7
loop_1419:
	bl	loop_1420
	fcmple16	%f14,	%f12,	%i1
	set	0x34, %i5
	lduwa	[%l7 + %i5] 0x11,	%o4
loop_1420:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a	loop_1421
	brlz	%o1,	loop_1422
	edge8	%l0,	%l5,	%i4
	bge,pn	%xcc,	loop_1423
loop_1421:
	movre	%g4,	0x01E,	%o2
loop_1422:
	orcc	%i7,	0x1AA9,	%o6
	movneg	%icc,	%g6,	%g5
loop_1423:
	tpos	%xcc,	0x3
	subc	%g1,	0x033F,	%o0
	movg	%xcc,	%l6,	%l3
	set	0x58, %o6
	stha	%o5,	[%l7 + %o6] 0x80
	alignaddr	%i5,	%i0,	%g2
	nop
	setx	0xB05D72E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x80
	tvc	%icc,	0x5
	bl,pn	%icc,	loop_1424
	tne	%xcc,	0x4
	mulx	%i3,	%o3,	%l4
	movvc	%xcc,	%l1,	%i2
loop_1424:
	bvc,a	%icc,	loop_1425
	fmovrsne	%o7,	%f20,	%f5
	sub	%g3,	%l2,	%i6
	fandnot1s	%f24,	%f20,	%f5
loop_1425:
	fbu	%fcc0,	loop_1426
	fbg	%fcc1,	loop_1427
	bgu	loop_1428
	sethi	0x01A4,	%i1
loop_1426:
	tn	%icc,	0x2
loop_1427:
	fxnors	%f27,	%f9,	%f7
loop_1428:
	fmovsne	%xcc,	%f16,	%f18
	fnors	%f31,	%f31,	%f31
	xnor	%g7,	%o4,	%l0
	fba	%fcc1,	loop_1429
	edge8l	%l5,	%o1,	%i4
	movrlz	%g4,	0x36F,	%o2
	fmul8x16al	%f20,	%f1,	%f4
loop_1429:
	taddcctv	%o6,	0x060C,	%g6
	edge32l	%g5,	%g1,	%i7
	fbne	%fcc1,	loop_1430
	fnot1	%f10,	%f6
	fbo	%fcc0,	loop_1431
	umul	%l6,	0x0D4E,	%l3
loop_1430:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o5,	%i5,	%o0
loop_1431:
	fandnot1	%f26,	%f24,	%f12
	sdivx	%g2,	0x0FC1,	%i3
	taddcc	%i0,	0x0FE8,	%o3
	or	%l4,	%i2,	%o7
	ldub	[%l7 + 0x09],	%g3
	tpos	%icc,	0x7
	brgz	%l2,	loop_1432
	orncc	%l1,	0x056B,	%i1
	tsubcc	%g7,	0x19F4,	%i6
	movl	%xcc,	%o4,	%l0
loop_1432:
	andncc	%o1,	%l5,	%i4
	call	loop_1433
	movneg	%xcc,	%g4,	%o6
	fmul8x16al	%f20,	%f9,	%f0
	umulcc	%o2,	0x04FD,	%g5
loop_1433:
	bshuffle	%f20,	%f16,	%f30
	pdist	%f4,	%f14,	%f22
	fbne,a	%fcc0,	loop_1434
	fmovrsgz	%g6,	%f1,	%f9
	prefetch	[%l7 + 0x40],	 0x0
	nop
	setx	0x80281BA350400F1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_1434:
	fmovdneg	%icc,	%f6,	%f7
	fmovdge	%xcc,	%f10,	%f5
	movle	%xcc,	%g1,	%l6
	xorcc	%l3,	0x0EAC,	%o5
	movvs	%icc,	%i5,	%o0
	fcmple32	%f6,	%f22,	%i7
	brnz	%i3,	loop_1435
	fbge	%fcc3,	loop_1436
	popc	0x1087,	%g2
	bpos,a,pt	%icc,	loop_1437
loop_1435:
	fbul	%fcc3,	loop_1438
loop_1436:
	tcc	%xcc,	0x0
	bn,pn	%icc,	loop_1439
loop_1437:
	fbn	%fcc3,	loop_1440
loop_1438:
	nop
	setx	0xA365EB22,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xD7A4E7B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f3,	%f12
	array32	%o3,	%i0,	%l4
loop_1439:
	fblg	%fcc2,	loop_1441
loop_1440:
	udivx	%o7,	0x10EB,	%i2
	ba	%icc,	loop_1442
	fpsub32	%f8,	%f30,	%f6
loop_1441:
	fnors	%f5,	%f17,	%f22
	edge16n	%g3,	%l1,	%i1
loop_1442:
	sdivx	%l2,	0x1F2B,	%g7
	membar	0x7B
	set	0x22, %o2
	stha	%o4,	[%l7 + %o2] 0x81
	srax	%l0,	%o1,	%i6
	sdiv	%l5,	0x0688,	%g4
	sll	%i4,	%o2,	%g5
	movvs	%xcc,	%o6,	%g6
	nop
	setx	0xA079AC1E,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	set	0x40, %l5
	swapa	[%l7 + %l5] 0x89,	%l6
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x140] %asi,	%g1 ripped by fixASI40.pl ripped by fixASI40.pl
	bn	loop_1443
	addccc	%o5,	0x119A,	%l3
	mulscc	%i5,	%i7,	%i3
	sth	%o0,	[%l7 + 0x1E]
loop_1443:
	srlx	%g2,	0x15,	%o3
	fpackfix	%f2,	%f9
	fabss	%f0,	%f11
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%i0
	movvc	%xcc,	%i2,	%o7
	wr	%g0,	0x81,	%asi
	stwa	%g3,	[%l7 + 0x7C] %asi
	sdivcc	%l1,	0x0B54,	%i1
	subcc	%g7,	%l2,	%l0
	fbue	%fcc1,	loop_1444
	fbne,a	%fcc2,	loop_1445
	nop
	setx	0x696243490D74EB6F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f20
	wr	%g0,	0x10,	%asi
	stwa	%o4,	[%l7 + 0x5C] %asi
loop_1444:
	nop
	setx	loop_1446,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1445:
	mulscc	%o1,	%l5,	%i6
	sll	%g4,	%i4,	%o2
	andn	%g5,	%o6,	%l6
loop_1446:
	tneg	%xcc,	0x2
	fzero	%f24
	tleu	%icc,	0x4
	tne	%xcc,	0x0
	addcc	%g6,	%g1,	%o5
	move	%icc,	%i5,	%l3
	movl	%icc,	%i7,	%i3
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	fxnors	%f4,	%f1,	%f7
	set	0x6B, %i3
	lduba	[%l7 + %i3] 0x04,	%g2
	fmul8ulx16	%f10,	%f16,	%f18
	fnegs	%f1,	%f12
	movneg	%xcc,	%o3,	%i0
	edge32ln	%i2,	%l4,	%o7
	andncc	%l1,	%g3,	%i1
	movgu	%xcc,	%l2,	%l0
	fmovdleu	%icc,	%f6,	%f7
	srax	%g7,	0x07,	%o1
	alignaddrl	%l5,	%o4,	%g4
	stx	%i6,	[%l7 + 0x38]
	smulcc	%o2,	0x044E,	%i4
	edge8n	%g5,	%l6,	%o6
	fmovdcc	%icc,	%f14,	%f19
	fmovdne	%icc,	%f26,	%f2
	orn	%g1,	%g6,	%o5
	movn	%xcc,	%i5,	%l3
	set	0x0C, %i2
	stwa	%i3,	[%l7 + %i2] 0x2f
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x18,	%f0
	set	0x54, %l4
	sta	%f13,	[%l7 + %l4] 0x18
	sll	%i7,	%o0,	%o3
	set	0x20, %l1
	lda	[%l7 + %l1] 0x88,	%f10
	fabss	%f25,	%f1
	fblg	%fcc3,	loop_1447
	sll	%g2,	0x12,	%i0
	addc	%i2,	0x1A11,	%l4
	edge8n	%l1,	%g3,	%i1
loop_1447:
	array16	%o7,	%l2,	%g7
	tgu	%icc,	0x0
	fmovscc	%xcc,	%f5,	%f4
	ldsw	[%l7 + 0x6C],	%l0
	tsubcctv	%l5,	%o1,	%g4
	movpos	%icc,	%o4,	%o2
	subc	%i4,	%i6,	%g5
	movpos	%xcc,	%l6,	%o6
	addcc	%g6,	0x178F,	%g1
	movvs	%xcc,	%i5,	%o5
	fpackfix	%f22,	%f8
	edge8n	%l3,	%i7,	%i3
	udiv	%o3,	0x1E25,	%g2
	fmovsne	%xcc,	%f12,	%f7
	fmovrse	%i0,	%f10,	%f11
	edge32l	%o0,	%l4,	%i2
	fmovspos	%icc,	%f8,	%f20
	subc	%g3,	0x16A3,	%l1
	edge8	%o7,	%i1,	%g7
	edge8ln	%l0,	%l5,	%o1
	alignaddr	%g4,	%l2,	%o2
	fzeros	%f12
	movre	%i4,	0x3FA,	%o4
	sra	%g5,	%i6,	%o6
	sub	%g6,	0x1034,	%l6
	sllx	%g1,	0x01,	%i5
	edge32l	%l3,	%i7,	%o5
	movle	%icc,	%i3,	%o3
	movle	%xcc,	%i0,	%g2
	fandnot1	%f6,	%f6,	%f4
	std	%f18,	[%l7 + 0x20]
	movrlez	%o0,	%l4,	%i2
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x88
	edge16l	%l1,	%g3,	%o7
	bneg,a,pn	%xcc,	loop_1448
	movcs	%icc,	%i1,	%g7
	array32	%l5,	%l0,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1448:
	alignaddrl	%l2,	%o2,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i4,	0x0A8E,	%o4
	sir	0x093F
	ta	%xcc,	0x0
	addc	%i6,	0x150C,	%o6
	stw	%g5,	[%l7 + 0x40]
	fnot1	%f20,	%f0
	sdivx	%g6,	0x07CC,	%g1
	sdivx	%l6,	0x1428,	%i5
	movl	%xcc,	%l3,	%o5
	fmul8x16au	%f27,	%f1,	%f6
	udivx	%i7,	0x17CB,	%i3
	std	%f28,	[%l7 + 0x40]
	subc	%i0,	%g2,	%o3
	edge16n	%o0,	%i2,	%l1
	array16	%l4,	%o7,	%g3
	srl	%g7,	%l5,	%l0
	fpadd32	%f20,	%f2,	%f20
	tne	%xcc,	0x7
	edge16	%i1,	%g4,	%o2
	fmovsvc	%xcc,	%f26,	%f12
	fbug,a	%fcc3,	loop_1449
	bvc,a,pn	%xcc,	loop_1450
	sdivx	%l2,	0x0CC7,	%o1
	subccc	%i4,	0x0C97,	%i6
loop_1449:
	tcc	%xcc,	0x6
loop_1450:
	tl	%icc,	0x4
	flush	%l7 + 0x30
	ba	%icc,	loop_1451
	edge32l	%o6,	%o4,	%g5
	array16	%g1,	%g6,	%i5
	tg	%icc,	0x7
loop_1451:
	subccc	%l6,	%l3,	%i7
	bpos,a,pt	%icc,	loop_1452
	movgu	%icc,	%i3,	%i0
	fmovsa	%xcc,	%f18,	%f11
	sdivcc	%g2,	0x0B2B,	%o5
loop_1452:
	srax	%o3,	0x06,	%i2
	bgu	loop_1453
	brlez,a	%l1,	loop_1454
	array16	%o0,	%o7,	%g3
	add	%g7,	0x09DF,	%l5
loop_1453:
	faligndata	%f30,	%f26,	%f26
loop_1454:
	nop
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movge	%xcc,	%l4,	%i1
	bl	%icc,	loop_1455
	fcmple16	%f0,	%f8,	%g4
	edge32ln	%l0,	%o2,	%o1
	flush	%l7 + 0x7C
loop_1455:
	edge32	%i4,	%i6,	%l2
	fmovsg	%icc,	%f9,	%f5
	fabss	%f13,	%f27
	tleu	%xcc,	0x4
	subcc	%o6,	%o4,	%g1
	fmovrdgz	%g5,	%f14,	%f26
	srlx	%i5,	%l6,	%l3
	fnands	%f4,	%f14,	%f29
	tvc	%xcc,	0x4
	alignaddr	%i7,	%g6,	%i3
	bg	loop_1456
	taddcctv	%g2,	%i0,	%o5
	fbo,a	%fcc3,	loop_1457
	fcmple32	%f24,	%f14,	%o3
loop_1456:
	nop
	set	0x2C, %l0
	lda	[%l7 + %l0] 0x15,	%f0
loop_1457:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx loop_1458, %l0, %l1
	jmpl %l1, %i2
	movgu	%xcc,	%l1,	%o0
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o7,	%g7
loop_1458:
	movge	%icc,	%l5,	%l4
	sir	0x1C1A
	fmovsneg	%icc,	%f0,	%f10
	fmovrsgz	%i1,	%f8,	%f14
	bpos	%xcc,	loop_1459
	andncc	%g4,	%l0,	%g3
	std	%f10,	[%l7 + 0x18]
	edge32ln	%o2,	%o1,	%i6
loop_1459:
	fmovsn	%xcc,	%f1,	%f7
	subccc	%l2,	%i4,	%o4
	sra	%g1,	0x0A,	%o6
	ldsh	[%l7 + 0x1C],	%g5
	tcs	%xcc,	0x2
	bne,a	loop_1460
	sethi	0x0B18,	%i5
	movrlez	%l3,	%l6,	%i7
	fpadd16	%f26,	%f26,	%f0
loop_1460:
	taddcctv	%g6,	%g2,	%i0
	fbule,a	%fcc2,	loop_1461
	flush	%l7 + 0x14
	fbuge,a	%fcc1,	loop_1462
	movg	%icc,	%o5,	%i3
loop_1461:
	orcc	%i2,	0x1697,	%o3
	orcc	%o0,	0x0092,	%l1
loop_1462:
	fabss	%f25,	%f1
	fsrc2s	%f26,	%f20
	fbl	%fcc3,	loop_1463
	fmovsleu	%icc,	%f8,	%f3
	fones	%f6
	movcc	%xcc,	%g7,	%o7
loop_1463:
	ldx	[%l7 + 0x38],	%l5
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
	fors	%f4,	%f24,	%f28
	bge,a	%icc,	loop_1465
	fandnot2s	%f9,	%f6,	%f22
loop_1464:
	nop
	set	0x6C, %i4
	lda	[%l7 + %i4] 0x81,	%f27
loop_1465:
	brnz,a	%i1,	loop_1466
	and	%l4,	%l0,	%g3
	movn	%xcc,	%o2,	%g4
	tn	%icc,	0x6
loop_1466:
	tg	%icc,	0x3
	edge16ln	%o1,	%l2,	%i4
	sdiv	%i6,	0x17A2,	%g1
	alignaddr	%o6,	%g5,	%o4
	tvs	%xcc,	0x2
	subccc	%i5,	0x081B,	%l6
	taddcctv	%i7,	%l3,	%g6
	edge32n	%g2,	%i0,	%i3
	lduw	[%l7 + 0x70],	%o5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x16] %asi,	%i2
	bvc,a	%xcc,	loop_1467
	alignaddrl	%o3,	%o0,	%g7
	bleu,a	%icc,	loop_1468
	edge8	%o7,	%l5,	%l1
loop_1467:
	sllx	%l4,	%l0,	%i1
	fpsub32	%f10,	%f20,	%f24
loop_1468:
	movrgez	%g3,	0x211,	%g4
	tn	%xcc,	0x5
	add	%o1,	%l2,	%i4
	movcs	%xcc,	%o2,	%g1
	fxnors	%f18,	%f26,	%f30
	tle	%icc,	0x0
	tne	%xcc,	0x4
	ldd	[%l7 + 0x10],	%f20
	brz	%i6,	loop_1469
	sir	0x117B
	set	0x60, %o5
	prefetcha	[%l7 + %o5] 0x04,	 0x1
loop_1469:
	andncc	%o4,	%i5,	%g5
	nop
	setx	loop_1470,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addcc	%i7,	%l6,	%g6
	fpsub32s	%f23,	%f11,	%f31
	fcmpne32	%f30,	%f24,	%l3
loop_1470:
	popc	%i0,	%i3
	movleu	%xcc,	%o5,	%i2
	sra	%o3,	0x01,	%g2
	sdiv	%o0,	0x0758,	%g7
	ble	loop_1471
	movl	%icc,	%o7,	%l5
	fpadd16s	%f22,	%f27,	%f5
	movrgez	%l1,	0x0AF,	%l4
loop_1471:
	tsubcc	%i1,	%g3,	%l0
	srlx	%g4,	%o1,	%l2
	movrlez	%o2,	0x14A,	%g1
	fbu	%fcc1,	loop_1472
	tne	%xcc,	0x6
	mova	%icc,	%i6,	%i4
	tsubcc	%o4,	0x1F11,	%i5
loop_1472:
	srax	%o6,	0x09,	%i7
	udiv	%l6,	0x0765,	%g5
	udivcc	%g6,	0x1AB8,	%i0
	srax	%i3,	%l3,	%o5
	andncc	%i2,	%o3,	%o0
	fblg	%fcc3,	loop_1473
	fcmple16	%f22,	%f20,	%g7
	bcs,pt	%icc,	loop_1474
	edge32	%g2,	%o7,	%l5
loop_1473:
	edge8ln	%l1,	%i1,	%l4
	sir	0x0E2F
loop_1474:
	edge32n	%g3,	%l0,	%o1
	fmovrdne	%g4,	%f18,	%f26
	fpadd16	%f30,	%f16,	%f24
	orncc	%l2,	0x150C,	%g1
	fbn	%fcc2,	loop_1475
	fpmerge	%f16,	%f30,	%f30
	fmovdleu	%icc,	%f13,	%f4
	tcc	%xcc,	0x1
loop_1475:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x37] %asi,	%i6
	fmuld8sux16	%f15,	%f18,	%f20
	array8	%i4,	%o2,	%i5
	edge16	%o4,	%o6,	%l6
	popc	0x151E,	%g5
	movl	%icc,	%i7,	%i0
	mulscc	%i3,	%g6,	%l3
	nop
	setx	loop_1476,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitod	%f4,	%f30
	fdtox	%f30,	%f22
	edge32l	%o5,	%i2,	%o3
	edge8n	%o0,	%g7,	%g2
loop_1476:
	edge32ln	%o7,	%l1,	%i1
	brgez,a	%l5,	loop_1477
	tvc	%icc,	0x7
	stx	%l4,	[%l7 + 0x40]
	srlx	%l0,	%g3,	%g4
loop_1477:
	nop
	set	0x08, %g6
	sth	%o1,	[%l7 + %g6]
	or	%l2,	0x0353,	%g1
	srax	%i4,	0x1F,	%o2
	fblg,a	%fcc0,	loop_1478
	edge32l	%i5,	%o4,	%o6
	udivx	%i6,	0x1C8A,	%l6
	add	%g5,	%i0,	%i3
loop_1478:
	bge,a	loop_1479
	tge	%icc,	0x5
	subccc	%i7,	%l3,	%o5
	brnz,a	%g6,	loop_1480
loop_1479:
	fbl	%fcc0,	loop_1481
	addccc	%o3,	0x18F1,	%i2
	sdivcc	%o0,	0x1ED3,	%g7
loop_1480:
	xnorcc	%o7,	%g2,	%l1
loop_1481:
	nop
	set	0x62, %g4
	stha	%i1,	[%l7 + %g4] 0x89
	fpadd16s	%f13,	%f10,	%f20
	mova	%icc,	%l5,	%l0
	subcc	%g3,	0x0BD4,	%g4
	nop
	setx	0x463BA13BA042CE89,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	nop
	setx	loop_1482,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%icc,	%l4,	%l2
	be,a,pn	%xcc,	loop_1483
	sdivx	%o1,	0x1186,	%g1
loop_1482:
	fmuld8ulx16	%f11,	%f30,	%f8
	addc	%i4,	0x0DB0,	%i5
loop_1483:
	tsubcctv	%o4,	0x18F4,	%o2
	for	%f4,	%f24,	%f2
	fbg	%fcc1,	loop_1484
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f2
	nop
	setx	0xD052938EAFBCF8B7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x926E205F27FD3A04,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f20,	%f2
loop_1484:
	bgu	%xcc,	loop_1485
	array16	%o6,	%l6,	%i6
	flush	%l7 + 0x0C
	srax	%g5,	0x18,	%i3
loop_1485:
	srax	%i7,	%l3,	%i0
	edge16n	%g6,	%o5,	%o3
	smulcc	%o0,	%g7,	%i2
	ta	%xcc,	0x3
	addcc	%g2,	%o7,	%l1
	fornot2	%f10,	%f22,	%f18
	fmovdne	%xcc,	%f15,	%f21
	tle	%xcc,	0x4
	edge16l	%i1,	%l5,	%l0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%g4,	%g3
	tsubcctv	%l2,	0x14C0,	%o1
	ldd	[%l7 + 0x30],	%g0
	tn	%icc,	0x2
	ld	[%l7 + 0x10],	%f10
	tle	%icc,	0x0
	nop
	setx	0x0C4F9CF3AAC9BA5C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f20
	movg	%icc,	%i4,	%l4
	fones	%f0
	orcc	%o4,	0x0F8A,	%o2
	fbue	%fcc0,	loop_1486
	subcc	%o6,	%i5,	%l6
	tg	%xcc,	0x1
	ldsh	[%l7 + 0x42],	%g5
loop_1486:
	udivx	%i3,	0x09BB,	%i7
	movvc	%xcc,	%i6,	%i0
	fnegs	%f16,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%l3,	%o5
	bne,a	loop_1487
	fpsub32	%f24,	%f16,	%f0
	move	%icc,	%o3,	%g6
	umulcc	%g7,	0x03DB,	%i2
loop_1487:
	nop
	setx	0xD0602974,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	umul	%o0,	0x1AA2,	%g2
	nop
	fitod	%f6,	%f8
	fmovdleu	%xcc,	%f10,	%f31
	nop
	setx	0x2B4D720761BE7522,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD5A000EC26C95CDE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f6,	%f18
	edge16n	%l1,	%o7,	%l5
	fblg,a	%fcc2,	loop_1488
	movcc	%xcc,	%i1,	%l0
	nop
	setx	0x8EF2E67C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x874C60AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f8,	%f22
	nop
	fitos	%f12,	%f1
	fstox	%f1,	%f30
	fxtos	%f30,	%f27
loop_1488:
	movcc	%icc,	%g3,	%g4
	tge	%icc,	0x5
	andcc	%o1,	%l2,	%g1
	fmovrsne	%l4,	%f29,	%f13
	edge16n	%i4,	%o2,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe,a	%fcc1,	loop_1489
	udivx	%o6,	0x1E64,	%i5
	be,pn	%icc,	loop_1490
	bshuffle	%f20,	%f30,	%f12
loop_1489:
	nop
	set	0x2C, %o3
	stwa	%l6,	[%l7 + %o3] 0xea
	membar	#Sync
loop_1490:
	bne,a	loop_1491
	addcc	%i3,	0x0EDC,	%i7
	fcmple16	%f18,	%f24,	%g5
	edge8l	%i0,	%i6,	%o5
loop_1491:
	fmovsvs	%xcc,	%f11,	%f0
	taddcctv	%o3,	%l3,	%g6
	movge	%icc,	%g7,	%i2
	popc	0x0770,	%o0
	sdiv	%g2,	0x0BCC,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x7
	fbn,a	%fcc1,	loop_1492
	movvc	%xcc,	%l5,	%i1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x24] %asi,	%o7
loop_1492:
	fbule	%fcc0,	loop_1493
	movrlez	%g3,	0x360,	%g4
	nop
	setx	0x9C4C2DD1106BBCF1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	addccc	%o1,	%l2,	%l0
loop_1493:
	mulscc	%g1,	0x00F8,	%l4
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x24] %asi,	%i4
	fmovdle	%icc,	%f31,	%f0
	andn	%o2,	0x0268,	%o6
	fcmple32	%f24,	%f6,	%i5
	xnorcc	%o4,	0x17C7,	%i3
	nop
	setx	0x653D7046127FC000,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xC0241959F34CB704,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f0,	%f20
	fmovsle	%xcc,	%f0,	%f31
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l6
	fandnot2s	%f18,	%f14,	%f5
	movl	%icc,	%g5,	%i7
	ld	[%l7 + 0x7C],	%f29
	udiv	%i0,	0x19C2,	%i6
	fsrc2s	%f10,	%f27
	movneg	%icc,	%o3,	%o5
	movpos	%xcc,	%l3,	%g7
	edge8	%i2,	%g6,	%g2
	tn	%xcc,	0x0
	brgez,a	%o0,	loop_1494
	movl	%icc,	%l5,	%i1
	alignaddrl	%l1,	%g3,	%g4
	udivx	%o7,	0x02C5,	%o1
loop_1494:
	bvc	loop_1495
	fbe	%fcc0,	loop_1496
	andn	%l2,	%l0,	%g1
	fpack32	%f14,	%f22,	%f18
loop_1495:
	orcc	%i4,	0x178A,	%o2
loop_1496:
	nop
	wr	%g0,	0x19,	%asi
	stha	%o6,	[%l7 + 0x5E] %asi
	set	0x2E, %g7
	stha	%l4,	[%l7 + %g7] 0x27
	membar	#Sync
	ldsb	[%l7 + 0x30],	%o4
	xnorcc	%i5,	0x056A,	%i3
	movpos	%icc,	%g5,	%l6
	bl	loop_1497
	fmovdl	%xcc,	%f15,	%f5
	movrgez	%i7,	%i6,	%o3
	addccc	%o5,	0x14FC,	%i0
loop_1497:
	tsubcc	%g7,	%l3,	%g6
	movrlz	%g2,	%i2,	%l5
	nop
	fitos	%f7,	%f9
	fstod	%f9,	%f6
	subccc	%i1,	%l1,	%g3
	sub	%o0,	%g4,	%o7
	fbu,a	%fcc2,	loop_1498
	alignaddrl	%o1,	%l2,	%g1
	udivcc	%i4,	0x0C41,	%l0
	set	0x70, %l2
	ldswa	[%l7 + %l2] 0x11,	%o2
loop_1498:
	sth	%o6,	[%l7 + 0x54]
	sllx	%o4,	0x04,	%l4
	subccc	%i3,	0x04EF,	%i5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	brnz	%l6,	loop_1499
	srax	%i6,	0x1B,	%o3
	fmovrde	%i7,	%f2,	%f16
	edge8n	%o5,	%g7,	%i0
loop_1499:
	tsubcc	%g6,	%g2,	%i2
	tgu	%xcc,	0x6
	edge16	%l3,	%i1,	%l1
	nop
	setx loop_1500, %l0, %l1
	jmpl %l1, %l5
	ldsw	[%l7 + 0x74],	%g3
	add	%o0,	0x1C06,	%g4
	bpos,a,pn	%icc,	loop_1501
loop_1500:
	smul	%o1,	%l2,	%g1
	movgu	%icc,	%o7,	%l0
	movrne	%o2,	%i4,	%o6
loop_1501:
	movle	%icc,	%o4,	%i3
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x10
	fexpand	%f21,	%f6
	movgu	%xcc,	%i5,	%l4
	wr	%g0,	0x2a,	%asi
	stba	%l6,	[%l7 + 0x1F] %asi
	membar	#Sync
	udivx	%g5,	0x101C,	%o3
	array16	%i6,	%o5,	%i7
	andncc	%i0,	%g6,	%g7
	edge8	%i2,	%g2,	%l3
	tsubcc	%l1,	%i1,	%g3
	brnz	%l5,	loop_1502
	stbar
	srlx	%o0,	0x09,	%g4
	fmovrse	%l2,	%f10,	%f31
loop_1502:
	fbu	%fcc0,	loop_1503
	fandnot1	%f24,	%f14,	%f10
	fmovrsgez	%o1,	%f9,	%f15
	fbn,a	%fcc2,	loop_1504
loop_1503:
	fpack32	%f28,	%f20,	%f2
	popc	0x084C,	%g1
	movrgez	%l0,	%o7,	%o2
loop_1504:
	nop
	fitod	%f4,	%f24
	fdtox	%f24,	%f0
	bg	loop_1505
	fsrc2	%f8,	%f6
	andncc	%o6,	%o4,	%i3
	fbug	%fcc0,	loop_1506
loop_1505:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %o4
	swapa	[%l7 + %o4] 0x11,	%i4
loop_1506:
	fmovsgu	%xcc,	%f26,	%f17
	fsrc1	%f12,	%f20
	brgz	%l4,	loop_1507
	tvc	%xcc,	0x3
	ta	%xcc,	0x6
	fbule,a	%fcc0,	loop_1508
loop_1507:
	stb	%i5,	[%l7 + 0x59]
	or	%l6,	%o3,	%g5
	udiv	%i6,	0x03C9,	%o5
loop_1508:
	ldx	[%l7 + 0x78],	%i0
	fmovdcc	%xcc,	%f12,	%f10
	movvc	%icc,	%g6,	%g7
	ldd	[%l7 + 0x58],	%i2
	nop
	setx	0x907D2AFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	movneg	%icc,	%i7,	%l3
	nop
	setx	0x7CF0C08A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f25
	set	0x24, %i0
	ldswa	[%l7 + %i0] 0x80,	%g2
	subcc	%l1,	%i1,	%l5
	orcc	%g3,	0x107F,	%o0
	srl	%l2,	%g4,	%o1
	tpos	%xcc,	0x0
	fbne,a	%fcc2,	loop_1509
	alignaddrl	%l0,	%o7,	%g1
	srl	%o6,	%o2,	%o4
	movrlez	%i4,	%l4,	%i5
loop_1509:
	bl,pt	%xcc,	loop_1510
	fcmple16	%f26,	%f6,	%i3
	nop
	setx	0x2B6F63F3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x657ACB39,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f5,	%f14
	fpadd32s	%f18,	%f28,	%f16
loop_1510:
	ldsh	[%l7 + 0x64],	%o3
	edge8n	%g5,	%l6,	%o5
	andncc	%i6,	%i0,	%g6
	nop
	setx	0xF35B01B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x15D18549,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f31,	%f12
	set	0x08, %i6
	ldswa	[%l7 + %i6] 0x14,	%g7
	tge	%xcc,	0x6
	movne	%icc,	%i2,	%l3
	tgu	%icc,	0x5
	sethi	0x086C,	%i7
	movcs	%xcc,	%g2,	%i1
	ta	%xcc,	0x6
	tne	%xcc,	0x5
	fmovs	%f10,	%f6
	set	0x5C, %g3
	sta	%f8,	[%l7 + %g3] 0x11
	bg,pt	%xcc,	loop_1511
	fmovse	%xcc,	%f11,	%f1
	tg	%icc,	0x2
	smul	%l5,	%g3,	%l1
loop_1511:
	tn	%xcc,	0x0
	fmul8x16	%f2,	%f30,	%f12
	nop
	set	0x2D, %o7
	ldstub	[%l7 + %o7],	%o0
	taddcctv	%g4,	%l2,	%l0
	fandnot2	%f30,	%f24,	%f24
	movpos	%icc,	%o1,	%g1
	orncc	%o6,	%o2,	%o7
	tge	%xcc,	0x0
	tgu	%icc,	0x1
	bn,a	loop_1512
	sllx	%i4,	%o4,	%i5
	fbuge	%fcc0,	loop_1513
	membar	0x62
loop_1512:
	mulscc	%i3,	%l4,	%o3
	popc	0x17A5,	%l6
loop_1513:
	movpos	%xcc,	%o5,	%i6
	xnorcc	%i0,	0x0568,	%g5
	nop
	set	0x20, %g5
	std	%f4,	[%l7 + %g5]
	fmovsne	%xcc,	%f1,	%f24
	udivx	%g7,	0x092A,	%i2
	sdiv	%g6,	0x1D12,	%l3
	fsrc2	%f2,	%f10
	fabss	%f18,	%f0
	nop
	setx	0xC1D40913C07A223E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fbn,a	%fcc3,	loop_1514
	fpsub16	%f24,	%f20,	%f14
	sll	%i7,	0x07,	%i1
	udiv	%g2,	0x02FD,	%g3
loop_1514:
	subc	%l1,	0x14C9,	%o0
	movvs	%xcc,	%l5,	%g4
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf9,	%f0
	fandnot1s	%f6,	%f12,	%f28
	smulcc	%l2,	0x0A41,	%l0
	edge16l	%g1,	%o6,	%o1
	bpos,a,pn	%xcc,	loop_1515
	bn,pn	%icc,	loop_1516
	fmovdcs	%xcc,	%f27,	%f28
	srax	%o7,	0x0C,	%i4
loop_1515:
	movrgez	%o2,	0x23E,	%o4
loop_1516:
	membar	0x41
	fmovdcc	%icc,	%f2,	%f26
	orncc	%i3,	%l4,	%i5
	nop
	setx	0x207C35A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	fnegs	%f30,	%f11
	fornot1s	%f8,	%f16,	%f31
	movcc	%icc,	%l6,	%o5
	fsrc2s	%f27,	%f7
	andn	%o3,	%i0,	%g5
	fmovrde	%i6,	%f30,	%f20
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x6E] %asi,	%i2
	sth	%g6,	[%l7 + 0x2C]
	subcc	%l3,	0x12B1,	%g7
	ldsh	[%l7 + 0x38],	%i1
	fmul8x16al	%f31,	%f23,	%f2
	fmovs	%f9,	%f11
	brlz,a	%g2,	loop_1517
	movle	%icc,	%g3,	%i7
	fmovsa	%xcc,	%f1,	%f29
	fmovrse	%l1,	%f1,	%f30
loop_1517:
	movne	%xcc,	%l5,	%o0
	tcs	%icc,	0x1
	tsubcctv	%l2,	%g4,	%g1
	bneg,a,pn	%icc,	loop_1518
	and	%l0,	%o1,	%o7
	set	0x14, %l6
	lduwa	[%l7 + %l6] 0x0c,	%i4
loop_1518:
	nop
	setx	0x122D20A2F07D50C4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	brnz	%o6,	loop_1519
	sra	%o4,	0x07,	%o2
	subccc	%i3,	%i5,	%l4
	addcc	%o5,	%l6,	%o3
loop_1519:
	nop
	set	0x20, %i7
	stwa	%i0,	[%l7 + %i7] 0x22
	membar	#Sync
	sll	%i6,	0x0E,	%g5
	sdivx	%g6,	0x0239,	%i2
	xor	%l3,	0x1080,	%g7
	andncc	%i1,	%g2,	%i7
	movcs	%xcc,	%g3,	%l5
	fmovdleu	%icc,	%f10,	%f18
	sdivx	%l1,	0x1039,	%l2
	movrlez	%g4,	%g1,	%l0
	sub	%o1,	0x18E0,	%o0
	fmuld8ulx16	%f13,	%f4,	%f4
	mulscc	%o7,	0x06C6,	%i4
	te	%icc,	0x7
	st	%f28,	[%l7 + 0x1C]
	movcs	%icc,	%o6,	%o2
	bl,pt	%icc,	loop_1520
	fsrc1	%f0,	%f14
	sra	%i3,	0x14,	%o4
	andn	%i5,	0x105D,	%l4
loop_1520:
	te	%icc,	0x5
	movneg	%icc,	%l6,	%o5
	edge32n	%o3,	%i6,	%i0
	set	0x70, %i1
	prefetcha	[%l7 + %i1] 0x0c,	 0x1
	popc	0x1772,	%g6
	bcs,pn	%icc,	loop_1521
	brz	%i2,	loop_1522
	fpadd32s	%f25,	%f21,	%f12
	fsrc2	%f2,	%f30
loop_1521:
	fmovsgu	%xcc,	%f22,	%f1
loop_1522:
	edge8l	%l3,	%g7,	%g2
	brz,a	%i1,	loop_1523
	te	%icc,	0x0
	fzeros	%f19
	fbge	%fcc2,	loop_1524
loop_1523:
	nop
	setx	loop_1525,	%l0,	%l1
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
	movcc	%icc,	%g3,	%l5
loop_1524:
	array8	%l1,	%l2,	%i7
loop_1525:
	brlz,a	%g1,	loop_1526
	edge8ln	%l0,	%o1,	%o0
	fnand	%f18,	%f2,	%f18
	stx	%o7,	[%l7 + 0x40]
loop_1526:
	fors	%f19,	%f18,	%f28
	fbn	%fcc1,	loop_1527
	edge8n	%g4,	%o6,	%o2
	tne	%icc,	0x1
	movrlz	%i3,	%i4,	%i5
loop_1527:
	mulscc	%l4,	%o4,	%l6
	movne	%icc,	%o3,	%o5
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbne,a	%fcc2,	loop_1528
	fcmpne16	%f12,	%f12,	%i0
	ldsh	[%l7 + 0x36],	%g5
	fpack32	%f0,	%f16,	%f28
loop_1528:
	sdivcc	%g6,	0x01E3,	%i2
	bcc	%xcc,	loop_1529
	faligndata	%f2,	%f22,	%f0
	set	0x2E, %o6
	stha	%l3,	[%l7 + %o6] 0xe3
	membar	#Sync
loop_1529:
	fmovdl	%xcc,	%f23,	%f15
	movgu	%icc,	%i6,	%g7
	popc	%g2,	%g3
	fmovscs	%icc,	%f26,	%f1
	udiv	%l5,	0x16A9,	%l1
	nop
	fitos	%f5,	%f1
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
	tcs	%xcc,	0x1
	movge	%icc,	%l2,	%i7
	edge16n	%i1,	%g1,	%l0
loop_1530:
	sll	%o1,	0x11,	%o0
	tneg	%xcc,	0x6
	sll	%o7,	0x18,	%g4
	fexpand	%f27,	%f30
	fmovrdlez	%o6,	%f22,	%f12
	alignaddr	%i3,	%o2,	%i4
	fpsub16s	%f27,	%f28,	%f29
	addc	%l4,	0x1CE7,	%i5
	fxor	%f28,	%f0,	%f28
	std	%f20,	[%l7 + 0x18]
	ble,a,pn	%icc,	loop_1531
	fnors	%f24,	%f30,	%f7
	fmovsvs	%icc,	%f30,	%f19
	movge	%xcc,	%o4,	%l6
loop_1531:
	bleu,pn	%icc,	loop_1532
	fmuld8sux16	%f29,	%f12,	%f10
	movrne	%o5,	0x1D6,	%o3
	te	%icc,	0x0
loop_1532:
	fpadd16s	%f6,	%f10,	%f6
	fbge	%fcc2,	loop_1533
	movcs	%icc,	%g5,	%g6
	subcc	%i2,	%i0,	%i6
	tne	%xcc,	0x4
loop_1533:
	tneg	%xcc,	0x5
	nop
	setx	0x83B582725A5E5959,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f26
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x63] %asi,	%g7
	set	0x78, %i5
	ldxa	[%l7 + %i5] 0x89,	%l3
	fbule	%fcc0,	loop_1534
	smulcc	%g2,	%l5,	%g3
	for	%f16,	%f18,	%f12
	and	%l2,	0x06D7,	%l1
loop_1534:
	alignaddrl	%i1,	%g1,	%l0
	movgu	%xcc,	%o1,	%i7
	mulx	%o0,	%g4,	%o7
	orcc	%i3,	%o2,	%i4
	fmovsneg	%xcc,	%f2,	%f22
	sdivcc	%l4,	0x04EF,	%o6
	bneg,a	%xcc,	loop_1535
	and	%o4,	%i5,	%o5
	movcs	%xcc,	%l6,	%g5
	faligndata	%f6,	%f22,	%f30
loop_1535:
	fsrc2s	%f18,	%f21
	swap	[%l7 + 0x70],	%o3
	movle	%xcc,	%i2,	%i0
	bcs,pt	%icc,	loop_1536
	taddcc	%g6,	0x0FCC,	%i6
	movrlz	%l3,	%g7,	%g2
	fmovsa	%icc,	%f30,	%f21
loop_1536:
	tvc	%xcc,	0x1
	fble	%fcc2,	loop_1537
	tne	%icc,	0x1
	xorcc	%g3,	0x121B,	%l2
	edge8ln	%l1,	%i1,	%l5
loop_1537:
	stx	%l0,	[%l7 + 0x18]
	bne,a,pn	%xcc,	loop_1538
	edge16ln	%g1,	%o1,	%i7
	bshuffle	%f24,	%f16,	%f20
	movvs	%xcc,	%o0,	%g4
loop_1538:
	smul	%o7,	%i3,	%o2
	wr	%g0,	0x22,	%asi
	stxa	%l4,	[%l7 + 0x40] %asi
	membar	#Sync
	orcc	%o6,	0x18E3,	%o4
	sub	%i4,	%i5,	%l6
	nop
	setx	0x7CC441B25F05DF00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x42B1FE23ACB31CD8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f0,	%f28
	addcc	%o5,	0x0F66,	%o3
	edge16ln	%g5,	%i0,	%i2
	edge8l	%i6,	%l3,	%g7
	membar	0x3A
	tneg	%icc,	0x2
	tleu	%icc,	0x7
	sllx	%g2,	0x07,	%g3
	andn	%g6,	0x1F79,	%l1
	xnor	%l2,	%l5,	%l0
	sra	%g1,	0x07,	%o1
	tleu	%icc,	0x6
	fornot1	%f26,	%f18,	%f6
	tgu	%xcc,	0x5
	fnot2s	%f27,	%f1
	tcc	%icc,	0x2
	bvc,a,pn	%icc,	loop_1539
	tcc	%icc,	0x3
	tvc	%xcc,	0x0
	sethi	0x09BE,	%i7
loop_1539:
	xor	%i1,	%o0,	%g4
	ldd	[%l7 + 0x18],	%f16
	andncc	%o7,	%o2,	%i3
	array32	%l4,	%o6,	%i4
	sub	%i5,	%l6,	%o5
	xorcc	%o4,	%o3,	%g5
	fpsub32s	%f15,	%f19,	%f20
	alignaddrl	%i0,	%i2,	%i6
	addcc	%l3,	0x1091,	%g2
	prefetch	[%l7 + 0x4C],	 0x3
	nop
	fitos	%f26,	%f8
	edge32l	%g7,	%g3,	%g6
	fbuge,a	%fcc2,	loop_1540
	smul	%l1,	%l2,	%l5
	fone	%f4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x79] %asi,	%l0
loop_1540:
	srl	%g1,	%i7,	%o1
	fmovrse	%o0,	%f6,	%f20
	andncc	%i1,	%o7,	%g4
	movrlz	%i3,	0x1BE,	%l4
	fmovsvs	%icc,	%f5,	%f23
	fpack16	%f28,	%f25
	nop
	setx	0xB740FE26,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x4198C699,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f22,	%f15
	movleu	%xcc,	%o6,	%i4
	fbge,a	%fcc2,	loop_1541
	bcs,a	%xcc,	loop_1542
	sir	0x035D
	fmovsg	%icc,	%f20,	%f30
loop_1541:
	tn	%icc,	0x7
loop_1542:
	stbar
	tn	%xcc,	0x5
	edge32n	%i5,	%l6,	%o5
	tge	%icc,	0x7
	addc	%o2,	%o4,	%g5
	movgu	%icc,	%i0,	%o3
	fbo,a	%fcc1,	loop_1543
	sdivx	%i6,	0x1C3C,	%i2
	umul	%l3,	%g7,	%g3
	tvc	%icc,	0x6
loop_1543:
	orn	%g6,	%l1,	%l2
	tcc	%icc,	0x0
	ldub	[%l7 + 0x54],	%g2
	movpos	%xcc,	%l0,	%l5
	fnand	%f10,	%f18,	%f2
	edge32ln	%g1,	%o1,	%i7
	fnegd	%f22,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o0,	%i1
	brlez,a	%o7,	loop_1544
	movgu	%icc,	%g4,	%i3
	bpos,a	%xcc,	loop_1545
	tpos	%xcc,	0x4
loop_1544:
	nop
	setx	loop_1546,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpsub32s	%f16,	%f12,	%f20
loop_1545:
	bcs,pt	%xcc,	loop_1547
	sub	%l4,	0x029D,	%o6
loop_1546:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x17] %asi,	%i4
loop_1547:
	xnor	%i5,	0x1374,	%o5
	movne	%icc,	%l6,	%o2
	edge16n	%g5,	%o4,	%i0
	sub	%o3,	0x1836,	%i2
	alignaddrl	%i6,	%l3,	%g3
	addccc	%g7,	%l1,	%l2
	stbar
	bleu,a,pt	%xcc,	loop_1548
	sub	%g2,	%l0,	%l5
	tge	%xcc,	0x2
	nop
	setx	0x153D8F33,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xA52FB1A7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f23,	%f24
loop_1548:
	stbar
	fbule,a	%fcc1,	loop_1549
	fcmpne16	%f22,	%f30,	%g1
	fnor	%f16,	%f8,	%f22
	set	0x52, %o2
	lduba	[%l7 + %o2] 0x14,	%g6
loop_1549:
	tl	%icc,	0x5
	movpos	%xcc,	%o1,	%i7
	tn	%xcc,	0x1
	nop
	setx	0x15007357,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f29
	xnorcc	%i1,	%o0,	%o7
	umul	%g4,	0x0788,	%i3
	std	%f2,	[%l7 + 0x48]
	bgu	loop_1550
	nop
	fitod	%f8,	%f28
	fdtos	%f28,	%f19
	bshuffle	%f28,	%f2,	%f16
	fbo	%fcc2,	loop_1551
loop_1550:
	movleu	%xcc,	%l4,	%i4
	fbuge	%fcc3,	loop_1552
	xnor	%o6,	%i5,	%l6
loop_1551:
	tn	%xcc,	0x1
	brgez,a	%o5,	loop_1553
loop_1552:
	nop
	set	0x4E, %g1
	ldstub	[%l7 + %g1],	%o2
	std	%f6,	[%l7 + 0x40]
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
loop_1553:
	brnz	%i0,	loop_1554
	tsubcc	%o4,	0x0620,	%i2
	tsubcctv	%o3,	%i6,	%g3
	smul	%l3,	%l1,	%l2
loop_1554:
	add	%g2,	0x0E9D,	%l0
	flush	%l7 + 0x38
	taddcc	%l5,	0x1755,	%g1
	ble,a,pn	%icc,	loop_1555
	movrlz	%g7,	%o1,	%g6
	umulcc	%i1,	%o0,	%i7
	stw	%o7,	[%l7 + 0x54]
loop_1555:
	udiv	%g4,	0x1D4C,	%l4
	sra	%i4,	0x15,	%i3
	mulx	%o6,	0x1957,	%l6
	addc	%o5,	0x02C8,	%i5
	array32	%g5,	%i0,	%o4
	fmovdvc	%xcc,	%f1,	%f9
	andncc	%i2,	%o3,	%i6
	fbge,a	%fcc3,	loop_1556
	array8	%o2,	%l3,	%l1
	fpadd16	%f22,	%f0,	%f26
	bshuffle	%f14,	%f8,	%f10
loop_1556:
	tneg	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%g2
	fmovdvs	%icc,	%f19,	%f1
	movg	%icc,	%g3,	%l0
	edge8l	%l5,	%g7,	%o1
	tsubcc	%g6,	%i1,	%g1
	udivx	%o0,	0x1B19,	%i7
	array8	%g4,	%l4,	%o7
	fmovse	%icc,	%f9,	%f15
	nop
	setx	0x8CE8EFC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xA4A3A183,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f25,	%f31
	movl	%icc,	%i3,	%i4
	xnorcc	%o6,	0x1B52,	%o5
	fmovdne	%xcc,	%f24,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i5,	%l6
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
	xnorcc	%i0,	0x144F,	%o4
	fmovsg	%xcc,	%f22,	%f28
	tsubcctv	%i2,	%o3,	%i6
loop_1557:
	faligndata	%f8,	%f10,	%f16
	fexpand	%f29,	%f14
	udivx	%g5,	0x1690,	%l3
	movle	%xcc,	%l1,	%l2
	sdivx	%g2,	0x0C2D,	%g3
	array32	%o2,	%l0,	%g7
	fcmpgt16	%f22,	%f30,	%l5
	sra	%o1,	%g6,	%g1
	smul	%o0,	%i1,	%i7
	tleu	%xcc,	0x1
	fmovsneg	%icc,	%f14,	%f20
	fcmpeq32	%f30,	%f6,	%g4
	mulscc	%o7,	%i3,	%l4
	movge	%icc,	%i4,	%o5
	ba,pt	%icc,	loop_1558
	te	%icc,	0x5
	bneg,a,pt	%icc,	loop_1559
	tsubcctv	%i5,	%l6,	%o6
loop_1558:
	mulx	%i0,	0x1C7E,	%o4
	edge32l	%i2,	%o3,	%g5
loop_1559:
	fandnot1	%f18,	%f20,	%f24
	bcc,pn	%icc,	loop_1560
	fpsub32s	%f14,	%f17,	%f4
	edge32n	%i6,	%l3,	%l1
	fxor	%f6,	%f12,	%f16
loop_1560:
	fmul8x16al	%f11,	%f24,	%f14
	fbue,a	%fcc3,	loop_1561
	sll	%l2,	%g3,	%g2
	sir	0x1A34
	andn	%l0,	%o2,	%l5
loop_1561:
	udivx	%o1,	0x0D2B,	%g6
	xor	%g7,	0x1BE7,	%g1
	lduw	[%l7 + 0x30],	%o0
	fpsub16	%f2,	%f2,	%f8
	movcs	%icc,	%i1,	%i7
	lduh	[%l7 + 0x70],	%o7
	alignaddr	%g4,	%l4,	%i3
	movrgez	%o5,	%i4,	%i5
	fbule,a	%fcc1,	loop_1562
	membar	0x5F
	subcc	%o6,	0x116F,	%i0
	nop
	fitos	%f5,	%f2
	fstod	%f2,	%f10
loop_1562:
	tvc	%icc,	0x1
	sllx	%l6,	%o4,	%o3
	fmovdpos	%xcc,	%f17,	%f17
	fmovrsgz	%g5,	%f14,	%f17
	subc	%i2,	0x12B4,	%i6
	popc	0x1191,	%l3
	fbue,a	%fcc3,	loop_1563
	call	loop_1564
	ta	%icc,	0x6
	udivx	%l1,	0x1542,	%g3
loop_1563:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%l2
loop_1564:
	movneg	%icc,	%o2,	%l5
	nop
	setx loop_1565, %l0, %l1
	jmpl %l1, %o1
	bge,pn	%icc,	loop_1566
	bne,a,pn	%icc,	loop_1567
	array16	%g6,	%l0,	%g7
loop_1565:
	umul	%g1,	0x0829,	%o0
loop_1566:
	brgez	%i1,	loop_1568
loop_1567:
	bshuffle	%f0,	%f4,	%f6
	fandnot1s	%f1,	%f31,	%f8
	fnands	%f18,	%f2,	%f11
loop_1568:
	movrlz	%o7,	%g4,	%i7
	or	%i3,	%l4,	%i4
	edge16n	%i5,	%o6,	%o5
	udivx	%i0,	0x1906,	%o4
	sdivcc	%l6,	0x12C0,	%g5
	movle	%xcc,	%i2,	%i6
	udivx	%l3,	0x0E6E,	%o3
	std	%f14,	[%l7 + 0x08]
	fbul,a	%fcc0,	loop_1569
	movge	%icc,	%g3,	%l1
	tne	%xcc,	0x0
	edge16l	%l2,	%g2,	%l5
loop_1569:
	movre	%o2,	%g6,	%l0
	tcs	%xcc,	0x0
	mulx	%g7,	0x055D,	%g1
	fmovsl	%xcc,	%f20,	%f29
	addc	%o0,	%o1,	%i1
	bgu,a	%xcc,	loop_1570
	ldd	[%l7 + 0x60],	%g4
	xnorcc	%o7,	%i7,	%l4
	movleu	%icc,	%i4,	%i5
loop_1570:
	subccc	%i3,	%o6,	%i0
	tleu	%xcc,	0x4
	te	%icc,	0x0
	fmovde	%icc,	%f10,	%f8
	be,a	%xcc,	loop_1571
	subcc	%o5,	0x1EA3,	%o4
	nop
	fitos	%f1,	%f4
	fstox	%f4,	%f16
	edge8ln	%l6,	%i2,	%i6
loop_1571:
	fblg,a	%fcc1,	loop_1572
	move	%xcc,	%l3,	%o3
	set	0x7D, %l5
	ldsba	[%l7 + %l5] 0x88,	%g5
loop_1572:
	bpos,a,pn	%xcc,	loop_1573
	sllx	%g3,	%l1,	%g2
	array32	%l5,	%o2,	%g6
	movleu	%xcc,	%l0,	%g7
loop_1573:
	movneg	%xcc,	%g1,	%o0
	tsubcctv	%l2,	0x0531,	%i1
	edge32l	%o1,	%g4,	%i7
	taddcctv	%o7,	0x10B1,	%l4
	tne	%xcc,	0x7
	orncc	%i4,	%i5,	%i3
	subc	%i0,	0x009D,	%o5
	bg	loop_1574
	sir	0x1379
	or	%o4,	0x1C01,	%o6
	ble,pt	%xcc,	loop_1575
loop_1574:
	fmovrsgz	%i2,	%f9,	%f11
	set	0x0F, %i3
	lduba	[%l7 + %i3] 0x04,	%i6
loop_1575:
	fpsub16s	%f18,	%f1,	%f17
	fmovrsne	%l3,	%f22,	%f18
	move	%icc,	%l6,	%o3
	fnegs	%f10,	%f31
	edge32ln	%g5,	%g3,	%g2
	udivcc	%l1,	0x1808,	%l5
	ba,pn	%icc,	loop_1576
	std	%f0,	[%l7 + 0x40]
	fmovsn	%icc,	%f12,	%f5
	nop
	set	0x1C, %i2
	ldsw	[%l7 + %i2],	%o2
loop_1576:
	nop
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x17,	%f0
	fnot2	%f4,	%f16
	nop
	set	0x1D, %l1
	ldub	[%l7 + %l1],	%l0
	tvc	%icc,	0x7
	mulscc	%g6,	0x0185,	%g7
	fzeros	%f4
	addcc	%o0,	0x154B,	%g1
	bg,a	%xcc,	loop_1577
	fbo,a	%fcc1,	loop_1578
	brlez,a	%l2,	loop_1579
	orcc	%o1,	0x0C0B,	%i1
loop_1577:
	membar	0x21
loop_1578:
	fbe,a	%fcc0,	loop_1580
loop_1579:
	fmovsa	%xcc,	%f30,	%f12
	nop
	setx	loop_1581,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%i7,	0x0AD1,	%o7
loop_1580:
	array16	%l4,	%g4,	%i5
	sub	%i3,	%i4,	%i0
loop_1581:
	edge16	%o4,	%o5,	%i2
	sllx	%i6,	0x1B,	%l3
	fpsub32s	%f5,	%f21,	%f27
	edge16l	%l6,	%o3,	%g5
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbo,a	%fcc1,	loop_1582
	nop
	fitos	%f1,	%f11
	fstox	%f11,	%f2
	fmovrsne	%o6,	%f24,	%f10
	sethi	0x1B11,	%g3
loop_1582:
	nop
	set	0x2C, %o0
	stwa	%g2,	[%l7 + %o0] 0x81
	bvs,a,pn	%xcc,	loop_1583
	fornot2	%f14,	%f8,	%f14
	xor	%l1,	0x0F20,	%o2
	movne	%icc,	%l0,	%l5
loop_1583:
	fbue	%fcc2,	loop_1584
	stb	%g6,	[%l7 + 0x66]
	fbne	%fcc1,	loop_1585
	tgu	%xcc,	0x3
loop_1584:
	fmovsl	%xcc,	%f17,	%f7
	fmovdcc	%icc,	%f8,	%f8
loop_1585:
	array8	%o0,	%g1,	%l2
	xnorcc	%o1,	%i1,	%i7
	xnor	%g7,	%l4,	%o7
	fmovrsgez	%g4,	%f22,	%f0
	and	%i5,	0x1EA1,	%i4
	fba	%fcc2,	loop_1586
	nop
	fitod	%f8,	%f26
	fdtoi	%f26,	%f3
	fcmpne32	%f10,	%f2,	%i3
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x75] %asi,	%o4
loop_1586:
	fmovda	%xcc,	%f0,	%f14
	fzero	%f24
	sdivx	%o5,	0x0724,	%i0
	prefetch	[%l7 + 0x0C],	 0x2
	set	0x2B, %l3
	stba	%i2,	[%l7 + %l3] 0x23
	membar	#Sync
	fmovrsgz	%l3,	%f13,	%f13
	te	%icc,	0x6
	fbo,a	%fcc1,	loop_1587
	addcc	%l6,	%o3,	%i6
	bpos,a,pt	%xcc,	loop_1588
	and	%g5,	%o6,	%g3
loop_1587:
	fmovsgu	%icc,	%f29,	%f26
	subcc	%g2,	%o2,	%l0
loop_1588:
	xnorcc	%l1,	0x09F8,	%l5
	fcmpeq16	%f2,	%f20,	%o0
	udiv	%g1,	0x1585,	%l2
	ldsh	[%l7 + 0x24],	%o1
	nop
	fitos	%f0,	%f29
	fstox	%f29,	%f22
	fxtos	%f22,	%f28
	movl	%icc,	%g6,	%i7
	fble,a	%fcc0,	loop_1589
	srlx	%i1,	0x11,	%l4
	tleu	%xcc,	0x6
	brgz,a	%g7,	loop_1590
loop_1589:
	fmovdneg	%xcc,	%f11,	%f26
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1590:
	fcmpne32	%f22,	%f8,	%g4
	brlez	%i5,	loop_1591
	movre	%i4,	%o7,	%o4
	nop
	setx	loop_1592,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdlz	%o5,	%f0,	%f30
loop_1591:
	sdiv	%i3,	0x067A,	%i0
	fmovrsne	%i2,	%f6,	%f12
loop_1592:
	fmovdpos	%xcc,	%f15,	%f15
	fbn,a	%fcc2,	loop_1593
	sdivx	%l3,	0x05B3,	%o3
	fmovsgu	%xcc,	%f4,	%f18
	sub	%l6,	%g5,	%i6
loop_1593:
	tvs	%xcc,	0x0
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f14
	fxtod	%f14,	%f24
	srax	%g3,	0x0F,	%o6
	fmovrdgz	%g2,	%f4,	%f24
	movrgz	%l0,	0x0F4,	%o2
	fxors	%f24,	%f4,	%f2
	bvs,pt	%icc,	loop_1594
	stbar
	ldd	[%l7 + 0x60],	%f30
	edge16ln	%l1,	%o0,	%l5
loop_1594:
	brnz,a	%l2,	loop_1595
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%g1,	%o1
	bvc,a,pt	%xcc,	loop_1596
loop_1595:
	stbar
	ble,pn	%xcc,	loop_1597
	movcs	%xcc,	%g6,	%i7
loop_1596:
	movrne	%l4,	0x0C1,	%i1
	srlx	%g7,	0x0E,	%i5
loop_1597:
	brgz	%i4,	loop_1598
	xorcc	%g4,	%o4,	%o5
	orn	%o7,	0x0550,	%i3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%i2
loop_1598:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x50] %asi,	%o3
	sdiv	%l3,	0x020B,	%l6
	fpadd32	%f24,	%f0,	%f0
	edge16l	%i6,	%g5,	%g3
	fble	%fcc1,	loop_1599
	sub	%g2,	0x1AF5,	%l0
	ble,a	loop_1600
	movgu	%xcc,	%o2,	%o6
loop_1599:
	fmovrdgez	%o0,	%f14,	%f12
	udivx	%l5,	0x03F3,	%l1
loop_1600:
	bneg,a	%icc,	loop_1601
	movleu	%icc,	%g1,	%l2
	fbo	%fcc3,	loop_1602
	movrne	%o1,	%i7,	%l4
loop_1601:
	bvs,pt	%icc,	loop_1603
	edge16n	%i1,	%g6,	%i5
loop_1602:
	orn	%g7,	%g4,	%o4
	fmovscs	%xcc,	%f17,	%f8
loop_1603:
	nop
	set	0x1A, %i4
	stha	%i4,	[%l7 + %i4] 0x15
	movvc	%icc,	%o5,	%i3
	tcc	%xcc,	0x3
	stw	%i0,	[%l7 + 0x24]
	edge16l	%i2,	%o3,	%l3
	fabss	%f19,	%f26
	popc	%o7,	%i6
	sdiv	%l6,	0x177A,	%g5
	std	%f8,	[%l7 + 0x18]
	fmuld8sux16	%f12,	%f12,	%f2
	sra	%g3,	%l0,	%g2
	fbe	%fcc3,	loop_1604
	array8	%o2,	%o0,	%l5
	edge16l	%o6,	%l1,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1604:
	fzero	%f6
	smul	%g1,	%i7,	%l4
	fpadd16	%f26,	%f24,	%f28
	movgu	%xcc,	%o1,	%g6
	movrgz	%i1,	0x3E0,	%i5
	movvs	%icc,	%g7,	%o4
	membar	0x1C
	fmovrdne	%i4,	%f26,	%f30
	tle	%icc,	0x1
	srlx	%g4,	%i3,	%o5
	nop
	fitos	%f22,	%f25
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%i0
	movre	%i2,	%o3,	%o7
	fpsub32	%f18,	%f4,	%f8
	tgu	%xcc,	0x2
	stw	%i6,	[%l7 + 0x1C]
	fornot1	%f30,	%f2,	%f22
	bpos	loop_1605
	smul	%l6,	%g5,	%l3
	movne	%xcc,	%l0,	%g3
	movleu	%icc,	%g2,	%o0
loop_1605:
	udivcc	%l5,	0x1AF6,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x7C],	%o2
	lduw	[%l7 + 0x68],	%l1
	fornot1	%f8,	%f2,	%f22
	or	%l2,	%g1,	%l4
	sdiv	%o1,	0x084C,	%i7
	fpack16	%f20,	%f19
	fbg	%fcc3,	loop_1606
	fmovrdlez	%g6,	%f22,	%f30
	nop
	fitos	%f9,	%f21
	fstox	%f21,	%f26
	sdivcc	%i1,	0x1DF1,	%g7
loop_1606:
	nop
	set	0x358, %g6
	nop 	! 	nop 	! 	ldxa	[%g0 + %g6] 0x40,	%o4 ripped by fixASI40.pl ripped by fixASI40.pl
	subccc	%i4,	%i5,	%g4
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x89,	%f16
	nop
	setx loop_1607, %l0, %l1
	jmpl %l1, %i3
	taddcc	%o5,	%i0,	%i2
	ldd	[%l7 + 0x60],	%f2
	fbe,a	%fcc3,	loop_1608
loop_1607:
	lduh	[%l7 + 0x4C],	%o3
	movrgez	%o7,	0x02C,	%i6
	brgz	%l6,	loop_1609
loop_1608:
	movg	%xcc,	%g5,	%l0
	movrgz	%l3,	0x3FA,	%g2
	subcc	%o0,	%g3,	%l5
loop_1609:
	fbuge	%fcc3,	loop_1610
	umulcc	%o2,	%o6,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l1,	%g1
loop_1610:
	tsubcctv	%l4,	0x0BE4,	%o1
	edge8n	%g6,	%i7,	%i1
	stb	%o4,	[%l7 + 0x4B]
	andn	%i4,	%i5,	%g4
	array8	%i3,	%o5,	%i0
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tleu	%icc,	0x1
	movrlz	%g7,	0x176,	%i2
	sra	%o3,	0x17,	%i6
	movle	%xcc,	%l6,	%g5
	tvc	%icc,	0x4
	tsubcctv	%l0,	0x14F7,	%l3
	fcmpeq16	%f0,	%f20,	%g2
	fmovsn	%xcc,	%f22,	%f4
	array8	%o0,	%g3,	%o7
	sdivcc	%o2,	0x1650,	%o6
	movg	%icc,	%l5,	%l1
	addc	%l2,	%g1,	%l4
	tl	%xcc,	0x6
	array16	%g6,	%o1,	%i7
	bl,a	%xcc,	loop_1611
	sethi	0x10D0,	%i1
	xnor	%i4,	%o4,	%g4
	edge32	%i5,	%o5,	%i3
loop_1611:
	udivx	%g7,	0x012B,	%i2
	udivx	%i0,	0x0FAC,	%o3
	fba	%fcc3,	loop_1612
	subcc	%l6,	0x024B,	%i6
	fmovdcc	%xcc,	%f10,	%f17
	smulcc	%g5,	0x0E2E,	%l0
loop_1612:
	fandnot1	%f20,	%f22,	%f4
	taddcctv	%g2,	%o0,	%l3
	brgez	%g3,	loop_1613
	tsubcc	%o2,	0x0501,	%o7
	brz	%l5,	loop_1614
	lduw	[%l7 + 0x68],	%l1
loop_1613:
	edge32ln	%l2,	%o6,	%g1
	movne	%icc,	%g6,	%l4
loop_1614:
	fbg	%fcc2,	loop_1615
	fnand	%f30,	%f10,	%f12
	bleu	loop_1616
	movcs	%xcc,	%i7,	%o1
loop_1615:
	umulcc	%i1,	0x0C20,	%o4
	std	%f26,	[%l7 + 0x38]
loop_1616:
	nop
	fitos	%f8,	%f25
	fstox	%f25,	%f24
	movpos	%xcc,	%g4,	%i5
	fsrc2s	%f0,	%f13
	stx	%i4,	[%l7 + 0x40]
	fcmpne16	%f20,	%f12,	%i3
	edge8ln	%g7,	%i2,	%i0
	sub	%o3,	%o5,	%l6
	prefetch	[%l7 + 0x0C],	 0x3
	srlx	%i6,	0x0A,	%g5
	set	0x20, %g4
	lduha	[%l7 + %g4] 0x0c,	%l0
	be,pn	%icc,	loop_1617
	fmovsl	%xcc,	%f5,	%f4
	tl	%xcc,	0x1
	bl	%icc,	loop_1618
loop_1617:
	xor	%g2,	0x0F4D,	%o0
	sll	%g3,	0x06,	%o2
	fpack32	%f22,	%f18,	%f10
loop_1618:
	subc	%o7,	%l3,	%l5
	ldsh	[%l7 + 0x3C],	%l1
	brlez,a	%l2,	loop_1619
	be,a	%xcc,	loop_1620
	tneg	%icc,	0x7
	tsubcctv	%g1,	0x1E01,	%o6
loop_1619:
	fsrc1	%f2,	%f20
loop_1620:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g6,	%l4
	fpadd16s	%f20,	%f12,	%f29
	addcc	%i7,	0x0D0F,	%i1
	nop
	fitos	%f1,	%f1
	fstox	%f1,	%f6
	fxtos	%f6,	%f3
	fmovdn	%icc,	%f26,	%f18
	sub	%o4,	%o1,	%i5
	set	0x38, %o3
	stxa	%i4,	[%l7 + %o3] 0x14
	fcmpeq32	%f6,	%f22,	%g4
	fmovsn	%xcc,	%f17,	%f18
	fmovda	%icc,	%f20,	%f19
	tsubcc	%i3,	%i2,	%i0
	fcmple32	%f0,	%f0,	%g7
	movgu	%xcc,	%o3,	%l6
	fbu,a	%fcc1,	loop_1621
	tne	%icc,	0x1
	movge	%icc,	%i6,	%o5
	taddcc	%g5,	%g2,	%l0
loop_1621:
	ld	[%l7 + 0x70],	%f22
	fandnot1s	%f21,	%f1,	%f3
	ldd	[%l7 + 0x08],	%g2
	fmovrdlez	%o0,	%f12,	%f6
	orcc	%o2,	0x14CF,	%o7
	tle	%icc,	0x6
	nop
	fitos	%f9,	%f14
	fstod	%f14,	%f8
	smulcc	%l3,	0x1682,	%l1
	nop
	fitod	%f6,	%f0
	fdtoi	%f0,	%f4
	set	0x40, %g7
	stxa	%l5,	[%l7 + %g7] 0x11
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x40] %asi,	%l2
	sir	0x0503
	andcc	%g1,	0x0376,	%g6
	tpos	%icc,	0x0
	st	%f3,	[%l7 + 0x10]
	tg	%icc,	0x1
	fands	%f19,	%f1,	%f3
	fmovrdlez	%o6,	%f12,	%f6
	movg	%icc,	%l4,	%i1
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	tneg	%icc,	0x5
	fbul,a	%fcc2,	loop_1622
	fmovrdgez	%o1,	%f14,	%f10
	fmovspos	%icc,	%f15,	%f3
	movn	%icc,	%i5,	%i4
loop_1622:
	fornot1s	%f17,	%f16,	%f3
	udivx	%g4,	0x09EE,	%i3
	mulscc	%i2,	0x137B,	%o4
	sllx	%i0,	%g7,	%o3
	fxnors	%f13,	%f7,	%f3
	taddcc	%i6,	0x0835,	%l6
	wr	%g0,	0x80,	%asi
	stxa	%g5,	[%l7 + 0x48] %asi
	fmovscs	%icc,	%f24,	%f13
	subc	%o5,	0x0908,	%g2
	bcc,a,pt	%xcc,	loop_1623
	tleu	%icc,	0x5
	movvc	%xcc,	%g3,	%o0
	lduh	[%l7 + 0x62],	%l0
loop_1623:
	movn	%xcc,	%o2,	%l3
	movl	%xcc,	%o7,	%l1
	movvc	%xcc,	%l2,	%l5
	edge16l	%g1,	%g6,	%o6
	edge16l	%i1,	%l4,	%o1
	movcs	%icc,	%i5,	%i4
	ldstub	[%l7 + 0x38],	%g4
	edge16l	%i7,	%i3,	%o4
	be,pn	%xcc,	loop_1624
	array32	%i0,	%g7,	%o3
	fpackfix	%f28,	%f4
	fbl	%fcc1,	loop_1625
loop_1624:
	edge32l	%i2,	%l6,	%g5
	xnor	%o5,	0x082D,	%g2
	orn	%g3,	0x0D74,	%o0
loop_1625:
	tl	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i6
	sllx	%l0,	0x05,	%o2
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f27
	array16	%l3,	%o7,	%l2
	ldd	[%l7 + 0x48],	%l0
	popc	%l5,	%g6
	fmovsleu	%xcc,	%f29,	%f17
	movleu	%icc,	%o6,	%i1
	tcs	%xcc,	0x4
	tvc	%icc,	0x7
	orn	%l4,	0x06B6,	%o1
	wr	%g0,	0x2f,	%asi
	stwa	%g1,	[%l7 + 0x20] %asi
	membar	#Sync
	fsrc2	%f24,	%f24
	movneg	%icc,	%i5,	%g4
	nop
	setx	loop_1626,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnor	%i7,	0x0301,	%i3
	fors	%f10,	%f23,	%f3
	mulscc	%o4,	%i4,	%g7
loop_1626:
	fcmpgt16	%f12,	%f14,	%i0
	sdivx	%o3,	0x0007,	%i2
	fmovsne	%icc,	%f14,	%f26
	umulcc	%g5,	0x1A9C,	%l6
	fpmerge	%f30,	%f8,	%f24
	bneg,pt	%icc,	loop_1627
	fbul,a	%fcc3,	loop_1628
	movvc	%xcc,	%g2,	%g3
	sll	%o5,	0x01,	%i6
loop_1627:
	tn	%xcc,	0x5
loop_1628:
	fbg,a	%fcc1,	loop_1629
	fnands	%f5,	%f14,	%f24
	prefetch	[%l7 + 0x38],	 0x3
	sll	%o0,	0x04,	%l0
loop_1629:
	nop
	setx	0x162ED90362AA8648,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x07B56B61953CB0AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f8,	%f2
	mulx	%o2,	%l3,	%o7
	nop
	fitod	%f12,	%f4
	fdtos	%f4,	%f24
	fone	%f24
	fbg	%fcc2,	loop_1630
	alignaddrl	%l2,	%l1,	%g6
	popc	0x0FC4,	%l5
	movvs	%icc,	%i1,	%l4
loop_1630:
	mulscc	%o1,	%g1,	%i5
	tleu	%xcc,	0x7
	set	0x18, %l2
	lduwa	[%l7 + %l2] 0x0c,	%o6
	movre	%i7,	%g4,	%i3
	edge16	%o4,	%i4,	%i0
	popc	0x1745,	%g7
	fnot2	%f0,	%f20
	movge	%xcc,	%i2,	%g5
	fzero	%f10
	umulcc	%o3,	0x159E,	%l6
	bvc,a,pn	%xcc,	loop_1631
	movcc	%icc,	%g3,	%g2
	ta	%icc,	0x5
	brnz	%o5,	loop_1632
loop_1631:
	udivx	%o0,	0x1B07,	%l0
	movleu	%icc,	%i6,	%o2
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1632:
	fornot1	%f22,	%f14,	%f28
	srax	%o7,	%l2,	%l3
	fmovdle	%xcc,	%f3,	%f1
	tsubcc	%l1,	0x124C,	%g6
	fcmple16	%f20,	%f0,	%i1
	wr	%g0,	0x80,	%asi
	sta	%f31,	[%l7 + 0x58] %asi
	fsrc1s	%f0,	%f15
	edge16ln	%l4,	%l5,	%g1
	fmovrse	%o1,	%f25,	%f13
	nop
	fitos	%f4,	%f3
	fstox	%f3,	%f30
	fxtos	%f30,	%f13
	edge32	%i5,	%o6,	%i7
	edge8l	%g4,	%o4,	%i4
	subcc	%i0,	0x0E47,	%g7
	tl	%icc,	0x3
	srl	%i2,	%i3,	%o3
	fba,a	%fcc1,	loop_1633
	taddcctv	%l6,	%g5,	%g3
	be,a	%xcc,	loop_1634
	tvc	%xcc,	0x5
loop_1633:
	movre	%g2,	0x2EC,	%o5
	set	0x76, %o4
	lduba	[%l7 + %o4] 0x10,	%o0
loop_1634:
	movre	%i6,	0x146,	%o2
	lduw	[%l7 + 0x54],	%l0
	fble	%fcc1,	loop_1635
	tcs	%xcc,	0x4
	fmovsgu	%xcc,	%f8,	%f22
	fsrc2s	%f29,	%f4
loop_1635:
	fmovrdne	%l2,	%f20,	%f12
	smul	%l3,	0x1E68,	%l1
	nop
	fitos	%f11,	%f21
	fstox	%f21,	%f2
	fxtos	%f2,	%f24
	fble	%fcc3,	loop_1636
	tne	%icc,	0x7
	nop
	setx	0x0F28505C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x4D8DBC08,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f19,	%f20
	umulcc	%o7,	0x0382,	%g6
loop_1636:
	mulscc	%l4,	0x11E0,	%i1
	te	%xcc,	0x1
	fmovdgu	%xcc,	%f23,	%f21
	movl	%xcc,	%g1,	%l5
	prefetch	[%l7 + 0x20],	 0x1
	wr	%g0,	0x2f,	%asi
	stxa	%i5,	[%l7 + 0x30] %asi
	membar	#Sync
	tsubcctv	%o1,	0x0C5C,	%i7
	tn	%xcc,	0x1
	tleu	%icc,	0x6
	taddcc	%o6,	%g4,	%i4
	udivx	%i0,	0x0A4C,	%g7
	tcc	%icc,	0x7
	fcmpgt32	%f24,	%f12,	%i2
	sdivx	%i3,	0x03DF,	%o3
	nop
	setx	loop_1637,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%o4,	%l6
	movneg	%xcc,	%g3,	%g5
	bl	%icc,	loop_1638
loop_1637:
	brlz,a	%g2,	loop_1639
	subcc	%o0,	0x1048,	%i6
	lduh	[%l7 + 0x1A],	%o5
loop_1638:
	xor	%o2,	%l0,	%l2
loop_1639:
	fbu	%fcc2,	loop_1640
	for	%f6,	%f8,	%f28
	movn	%icc,	%l1,	%l3
	movge	%xcc,	%o7,	%g6
loop_1640:
	srax	%i1,	0x11,	%l4
	edge8ln	%g1,	%l5,	%o1
	edge8ln	%i5,	%i7,	%g4
	fnors	%f27,	%f12,	%f22
	fmul8x16au	%f7,	%f25,	%f12
	alignaddr	%i4,	%o6,	%i0
	fpmerge	%f14,	%f13,	%f6
	edge16	%g7,	%i2,	%i3
	movl	%icc,	%o4,	%l6
	array32	%g3,	%o3,	%g5
	ldstub	[%l7 + 0x70],	%g2
	bl,a,pt	%icc,	loop_1641
	tcs	%icc,	0x3
	tle	%xcc,	0x6
	ldd	[%l7 + 0x08],	%i6
loop_1641:
	membar	0x31
	fpsub16s	%f7,	%f30,	%f23
	bg,a,pn	%xcc,	loop_1642
	addcc	%o0,	0x0871,	%o5
	umul	%l0,	%l2,	%l1
	nop
	set	0x40, %g2
	ldstub	[%l7 + %g2],	%l3
loop_1642:
	taddcctv	%o2,	%g6,	%i1
	fxnors	%f17,	%f24,	%f3
	ble,a,pn	%xcc,	loop_1643
	fmovsgu	%icc,	%f9,	%f14
	movrne	%o7,	0x006,	%l4
	tneg	%icc,	0x3
loop_1643:
	movrgez	%l5,	0x1E9,	%o1
	subc	%i5,	0x1CB5,	%i7
	movgu	%icc,	%g1,	%g4
	umul	%o6,	0x14CA,	%i4
	fbo,a	%fcc1,	loop_1644
	stbar
	fcmpgt16	%f30,	%f8,	%g7
	fcmpeq32	%f4,	%f18,	%i2
loop_1644:
	xorcc	%i0,	%i3,	%o4
	st	%f0,	[%l7 + 0x54]
	movge	%icc,	%g3,	%o3
	stx	%l6,	[%l7 + 0x58]
	tsubcctv	%g5,	0x175B,	%i6
	alignaddr	%g2,	%o5,	%o0
	taddcctv	%l0,	%l1,	%l3
	nop
	setx	0x1CD5F0B72F6846CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x0C2C0575B685CCE8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f16,	%f24
	fmovsneg	%xcc,	%f12,	%f5
	fnegs	%f7,	%f12
	fbne,a	%fcc1,	loop_1645
	nop
	fitod	%f10,	%f6
	fdtos	%f6,	%f0
	fba	%fcc1,	loop_1646
	add	%l2,	%o2,	%g6
loop_1645:
	ldub	[%l7 + 0x77],	%i1
	fbuge	%fcc3,	loop_1647
loop_1646:
	tvc	%xcc,	0x2
	edge32l	%o7,	%l4,	%o1
	andncc	%i5,	%l5,	%i7
loop_1647:
	fmovsgu	%xcc,	%f26,	%f13
	movneg	%icc,	%g4,	%g1
	or	%o6,	%i4,	%i2
	tge	%xcc,	0x5
	movpos	%xcc,	%i0,	%g7
	bne,a,pn	%icc,	loop_1648
	sll	%o4,	0x0B,	%g3
	tsubcc	%o3,	0x1273,	%l6
	stbar
loop_1648:
	move	%icc,	%i3,	%i6
	stbar
	fornot1	%f18,	%f14,	%f16
	fandnot1s	%f13,	%f4,	%f26
	andn	%g2,	0x0752,	%o5
	fmovsg	%icc,	%f8,	%f5
	andn	%g5,	%l0,	%l1
	fmul8sux16	%f14,	%f16,	%f14
	nop
	setx	0xA9C6DD023013817E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2D67F5F57D1FADBA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f26,	%f28
	fpsub16s	%f22,	%f21,	%f14
	nop
	fitod	%f6,	%f30
	fdtox	%f30,	%f6
	sdiv	%l3,	0x04F0,	%o0
	smulcc	%l2,	0x1461,	%g6
	tge	%icc,	0x4
	fmovsleu	%icc,	%f5,	%f24
	stw	%i1,	[%l7 + 0x10]
	fmovrdne	%o2,	%f18,	%f14
	wr	%g0,	0xea,	%asi
	stxa	%o7,	[%l7 + 0x68] %asi
	membar	#Sync
	sethi	0x14CD,	%o1
	addccc	%i5,	0x009A,	%l4
	movvs	%icc,	%i7,	%l5
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x28] %asi,	%g4
	fmul8sux16	%f16,	%f30,	%f28
	sllx	%o6,	%g1,	%i2
	bne,a,pt	%xcc,	loop_1649
	subccc	%i0,	0x1977,	%g7
	fsrc2s	%f28,	%f28
	xorcc	%i4,	%g3,	%o3
loop_1649:
	fble	%fcc2,	loop_1650
	fors	%f21,	%f2,	%f2
	fbug,a	%fcc3,	loop_1651
	tgu	%xcc,	0x4
loop_1650:
	ldsb	[%l7 + 0x28],	%o4
	tl	%xcc,	0x5
loop_1651:
	edge16n	%l6,	%i6,	%i3
	nop
	setx	0xB938D734,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xEAEEF186,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f17,	%f22
	fmovdle	%icc,	%f29,	%f29
	stbar
	sdivx	%g2,	0x05E4,	%g5
	te	%xcc,	0x7
	movcc	%xcc,	%l0,	%l1
	edge8n	%o5,	%o0,	%l3
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x2e,	%g6
	set	0x08, %i6
	stwa	%i1,	[%l7 + %i6] 0x89
	fbu	%fcc1,	loop_1652
	movrlez	%o2,	0x173,	%l2
	udivcc	%o7,	0x01B9,	%o1
	tcc	%xcc,	0x3
loop_1652:
	nop
	fitos	%f6,	%f17
	fstoi	%f17,	%f18
	tsubcc	%l4,	%i5,	%l5
	fbul	%fcc2,	loop_1653
	bne,a,pt	%xcc,	loop_1654
	brlez,a	%g4,	loop_1655
	edge32ln	%i7,	%g1,	%o6
loop_1653:
	movcc	%xcc,	%i2,	%i0
loop_1654:
	bn	loop_1656
loop_1655:
	bne,a	%xcc,	loop_1657
	membar	0x07
	fmovrde	%i4,	%f22,	%f20
loop_1656:
	tle	%icc,	0x0
loop_1657:
	srl	%g7,	0x1E,	%o3
	tle	%xcc,	0x4
	fbne	%fcc3,	loop_1658
	bn,a	loop_1659
	smulcc	%g3,	0x06B7,	%l6
	brnz	%o4,	loop_1660
loop_1658:
	tleu	%icc,	0x4
loop_1659:
	bg,a	%icc,	loop_1661
	stb	%i3,	[%l7 + 0x54]
loop_1660:
	sdiv	%i6,	0x086B,	%g2
	movpos	%icc,	%g5,	%l1
loop_1661:
	stbar
	movne	%xcc,	%l0,	%o5
	be,pn	%icc,	loop_1662
	andn	%o0,	%g6,	%i1
	fmovdg	%icc,	%f30,	%f3
	set	0x7C, %g3
	lduha	[%l7 + %g3] 0x04,	%l3
loop_1662:
	brz,a	%l2,	loop_1663
	sdivx	%o7,	0x008D,	%o1
	ldsb	[%l7 + 0x16],	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1663:
	brnz	%o2,	loop_1664
	fandnot1	%f0,	%f22,	%f20
	ldd	[%l7 + 0x70],	%l4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1c0] %asi,	%i5 ripped by fixASI40.pl ripped by fixASI40.pl
loop_1664:
	bvc,pn	%xcc,	loop_1665
	srl	%g4,	%g1,	%o6
	fbul	%fcc0,	loop_1666
	tne	%xcc,	0x1
loop_1665:
	orcc	%i7,	0x1931,	%i0
	fble	%fcc3,	loop_1667
loop_1666:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i2,	%g7
	fpsub16s	%f15,	%f19,	%f6
loop_1667:
	sll	%i4,	%o3,	%g3
	membar	0x7F
	bvs,pt	%xcc,	loop_1668
	popc	%o4,	%l6
	bl	%xcc,	loop_1669
	edge32l	%i6,	%g2,	%g5
loop_1668:
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f6
	umul	%i3,	0x1312,	%l1
loop_1669:
	fbl	%fcc3,	loop_1670
	orn	%l0,	0x070F,	%o5
	call	loop_1671
	fble	%fcc0,	loop_1672
loop_1670:
	sra	%o0,	%i1,	%g6
	tn	%icc,	0x5
loop_1671:
	nop
	wr	%g0,	0xe2,	%asi
	stha	%l3,	[%l7 + 0x1C] %asi
	membar	#Sync
loop_1672:
	fnot1	%f0,	%f30
	movgu	%xcc,	%o7,	%o1
	fpadd32s	%f13,	%f30,	%f30
	nop
	setx	0x699FAA3EAAFF7D80,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xDC192D2D7A1B5CC5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f28,	%f16
	fbu,a	%fcc0,	loop_1673
	xor	%l2,	%o2,	%l5
	fand	%f0,	%f2,	%f16
	sdiv	%i5,	0x0EAD,	%l4
loop_1673:
	call	loop_1674
	bcc,a	loop_1675
	orn	%g1,	0x1DD0,	%g4
	fbug,a	%fcc2,	loop_1676
loop_1674:
	tsubcctv	%i7,	0x0DC7,	%o6
loop_1675:
	fornot2	%f14,	%f8,	%f14
	tle	%xcc,	0x7
loop_1676:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%i2
	movrlz	%i4,	%o3,	%g7
	addc	%o4,	%g3,	%l6
	movne	%icc,	%i6,	%g2
	tvs	%icc,	0x4
	bvs,pt	%xcc,	loop_1677
	srl	%g5,	%l1,	%i3
	edge16n	%l0,	%o5,	%o0
	fpsub32s	%f10,	%f4,	%f25
loop_1677:
	fmovrde	%g6,	%f20,	%f16
	addcc	%l3,	%i1,	%o7
	alignaddrl	%l2,	%o1,	%o2
	popc	0x0B81,	%i5
	movvs	%xcc,	%l4,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g1,	0x175E,	%g4
	fbuge,a	%fcc2,	loop_1678
	nop
	setx	0x00662638,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	bcs	loop_1679
	ble,a,pt	%xcc,	loop_1680
loop_1678:
	tgu	%icc,	0x3
	fcmpeq32	%f30,	%f10,	%i7
loop_1679:
	taddcc	%o6,	0x00EF,	%i0
loop_1680:
	brnz,a	%i2,	loop_1681
	tl	%xcc,	0x2
	sir	0x0723
	movl	%icc,	%i4,	%o3
loop_1681:
	popc	0x081F,	%g7
	movrgz	%g3,	0x23B,	%o4
	set	0x38, %g5
	stwa	%i6,	[%l7 + %g5] 0x2b
	membar	#Sync
	mova	%icc,	%g2,	%l6
	ldx	[%l7 + 0x08],	%g5
	membar	0x3C
	udivx	%i3,	0x0D97,	%l1
	sdivcc	%l0,	0x1595,	%o5
	set	0x68, %o7
	stxa	%o0,	[%l7 + %o7] 0x04
	bcs,pt	%xcc,	loop_1682
	ldub	[%l7 + 0x09],	%l3
	fba,a	%fcc1,	loop_1683
	fmovspos	%xcc,	%f16,	%f13
loop_1682:
	alignaddr	%g6,	%i1,	%l2
	subccc	%o7,	%o1,	%o2
loop_1683:
	bn,pt	%icc,	loop_1684
	tvs	%icc,	0x4
	fnot2s	%f30,	%f26
	wr	%g0,	0x2b,	%asi
	stxa	%l4,	[%l7 + 0x38] %asi
	membar	#Sync
loop_1684:
	fors	%f6,	%f15,	%f31
	fandnot2	%f2,	%f24,	%f12
	mova	%icc,	%l5,	%i5
	nop
	setx	0xFDBAA45903148615,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x32466B3ADCA20408,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f20,	%f24
	edge16ln	%g1,	%i7,	%g4
	fandnot1s	%f16,	%f29,	%f6
	sll	%i0,	0x0A,	%i2
	sra	%o6,	%o3,	%i4
	edge8l	%g7,	%o4,	%g3
	edge16ln	%g2,	%l6,	%g5
	tg	%icc,	0x2
	orncc	%i3,	0x1B96,	%l1
	fsrc2s	%f27,	%f17
	fabsd	%f24,	%f20
	fmovspos	%icc,	%f19,	%f6
	xnorcc	%l0,	0x0679,	%i6
	edge16ln	%o5,	%l3,	%g6
	movvs	%icc,	%o0,	%i1
	movn	%icc,	%o7,	%o1
	fmovrsgez	%o2,	%f1,	%f24
	fbe	%fcc1,	loop_1685
	fexpand	%f2,	%f22
	tsubcc	%l2,	%l5,	%l4
	set	0x0C, %l6
	swapa	[%l7 + %l6] 0x18,	%i5
loop_1685:
	edge16ln	%g1,	%g4,	%i7
	array16	%i2,	%i0,	%o6
	movpos	%xcc,	%o3,	%i4
	fpack16	%f30,	%f6
	sir	0x038D
	fandnot2s	%f27,	%f3,	%f2
	array8	%g7,	%g3,	%o4
	fcmpeq32	%f18,	%f28,	%g2
	tcc	%xcc,	0x1
	swap	[%l7 + 0x78],	%l6
	movrlz	%g5,	%i3,	%l1
	bvs,pt	%xcc,	loop_1686
	tge	%icc,	0x7
	sra	%l0,	%o5,	%l3
	nop
	setx	0xF464EF396052F899,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x3D0BD304DD6F0248,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f0,	%f10
loop_1686:
	fbue	%fcc1,	loop_1687
	sdiv	%g6,	0x0C24,	%o0
	mulscc	%i6,	0x1E7E,	%i1
	stbar
loop_1687:
	nop
	setx	0x67D2C6BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xD424371A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f17,	%f22
	mulx	%o1,	0x1EA6,	%o2
	tleu	%xcc,	0x7
	tne	%xcc,	0x6
	fmovdpos	%icc,	%f26,	%f31
	tneg	%icc,	0x2
	fnot2	%f10,	%f8
	movrlz	%o7,	0x0B3,	%l2
	sdiv	%l4,	0x0335,	%i5
	or	%l5,	0x0C24,	%g1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f30
	alignaddrl	%i7,	%g4,	%i0
	fble	%fcc2,	loop_1688
	movneg	%icc,	%i2,	%o3
	xor	%o6,	0x0CA3,	%g7
	swap	[%l7 + 0x08],	%i4
loop_1688:
	brz	%o4,	loop_1689
	tcs	%xcc,	0x3
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x18] %asi,	%g2
loop_1689:
	fbl,a	%fcc1,	loop_1690
	or	%l6,	%g3,	%i3
	fsrc1	%f28,	%f2
	srl	%g5,	0x0C,	%l1
loop_1690:
	ta	%xcc,	0x6
	bvc,a,pt	%xcc,	loop_1691
	for	%f16,	%f20,	%f30
	fbo	%fcc3,	loop_1692
	fbo	%fcc2,	loop_1693
loop_1691:
	edge32	%l0,	%o5,	%l3
	fbge,a	%fcc2,	loop_1694
loop_1692:
	fble,a	%fcc2,	loop_1695
loop_1693:
	fone	%f6
	fandnot2	%f4,	%f26,	%f10
loop_1694:
	smulcc	%g6,	0x1FC6,	%i6
loop_1695:
	edge16n	%o0,	%i1,	%o1
	smulcc	%o2,	0x1DBE,	%l2
	mulscc	%l4,	%o7,	%i5
	set	0x20, %i7
	stxa	%g1,	[%l7 + %i7] 0x89
	movpos	%icc,	%i7,	%l5
	srax	%g4,	0x10,	%i2
	xnor	%i0,	0x0D08,	%o3
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x18
	fbule	%fcc0,	loop_1696
	movl	%xcc,	%g7,	%i4
	and	%o4,	0x06BC,	%o6
	tg	%icc,	0x2
loop_1696:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l6,	%g3,	%g2
	edge16n	%i3,	%g5,	%l0
	orncc	%o5,	0x0ABA,	%l1
	fnegd	%f22,	%f8
	fnand	%f10,	%f10,	%f30
	movcc	%icc,	%l3,	%g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i6,	%o0
	fmovdpos	%xcc,	%f21,	%f18
	brgz,a	%o1,	loop_1697
	fpadd32s	%f29,	%f5,	%f26
	fmovsle	%icc,	%f3,	%f20
	brgz,a	%i1,	loop_1698
loop_1697:
	sethi	0x0851,	%l2
	ldsh	[%l7 + 0x18],	%o2
	tsubcc	%l4,	0x03AE,	%o7
loop_1698:
	andncc	%g1,	%i5,	%i7
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
	bge,pn	%icc,	loop_1699
	mova	%icc,	%g4,	%i2
	fmovsvs	%xcc,	%f20,	%f27
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
loop_1699:
	fexpand	%f24,	%f6
	bge,a	loop_1700
	fpadd16s	%f3,	%f13,	%f12
	set	0x6C, %o6
	stha	%g7,	[%l7 + %o6] 0x14
loop_1700:
	edge32n	%i4,	%o4,	%i0
	brlez	%o6,	loop_1701
	movre	%l6,	0x373,	%g2
	move	%icc,	%g3,	%g5
	fmovsne	%xcc,	%f5,	%f28
loop_1701:
	fors	%f22,	%f8,	%f28
	fbo,a	%fcc0,	loop_1702
	bshuffle	%f16,	%f18,	%f8
	for	%f24,	%f16,	%f28
	fbg,a	%fcc3,	loop_1703
loop_1702:
	fmovsn	%icc,	%f8,	%f30
	fmovsa	%icc,	%f19,	%f31
	movvs	%xcc,	%l0,	%o5
loop_1703:
	alignaddrl	%l1,	%i3,	%l3
	te	%xcc,	0x0
	fpadd32s	%f10,	%f27,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x10],	%g6
	lduw	[%l7 + 0x68],	%i6
	flush	%l7 + 0x58
	alignaddr	%o0,	%i1,	%l2
	tleu	%xcc,	0x3
	sllx	%o1,	0x15,	%o2
	fornot1	%f18,	%f10,	%f2
	brz,a	%o7,	loop_1704
	addc	%l4,	0x14A9,	%i5
	nop
	fitod	%f15,	%f10
	fsrc2	%f20,	%f10
loop_1704:
	addc	%g1,	0x0E7A,	%l5
	stb	%i7,	[%l7 + 0x0E]
	movn	%xcc,	%i2,	%g4
	subcc	%o3,	0x1FB3,	%i4
	umul	%o4,	0x0053,	%g7
	edge8l	%i0,	%o6,	%g2
	taddcctv	%l6,	0x0CFA,	%g5
	sll	%g3,	%o5,	%l1
	umulcc	%i3,	%l3,	%l0
	addcc	%g6,	0x0B68,	%o0
	udiv	%i6,	0x1E4F,	%l2
	movrne	%o1,	%o2,	%i1
	tvc	%icc,	0x7
	fmuld8ulx16	%f18,	%f26,	%f6
	movre	%l4,	0x287,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc3,	loop_1705
	fmovsvs	%xcc,	%f13,	%f25
	movne	%xcc,	%i5,	%l5
	bshuffle	%f30,	%f18,	%f28
loop_1705:
	ldub	[%l7 + 0x27],	%g1
	tl	%xcc,	0x7
	tpos	%icc,	0x1
	movge	%xcc,	%i2,	%i7
	edge32ln	%o3,	%g4,	%i4
	movn	%icc,	%g7,	%o4
	fmovde	%icc,	%f16,	%f8
	sdiv	%i0,	0x06F2,	%o6
	tle	%icc,	0x3
	mova	%icc,	%g2,	%g5
	fbg,a	%fcc3,	loop_1706
	tg	%icc,	0x6
	xor	%l6,	%o5,	%l1
	movleu	%icc,	%i3,	%l3
loop_1706:
	tvc	%icc,	0x7
	ldsh	[%l7 + 0x5C],	%l0
	andn	%g3,	0x0EC1,	%o0
	brlz,a	%g6,	loop_1707
	flush	%l7 + 0x44
	edge8	%l2,	%o1,	%o2
	stbar
loop_1707:
	nop
	setx	0xFF62B4E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x96BA2BB6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f16,	%f28
	edge16l	%i6,	%l4,	%i1
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x48] %asi,	%i5
	movre	%o7,	%l5,	%g1
	tpos	%xcc,	0x3
	tvc	%xcc,	0x2
	bcs	loop_1708
	movge	%icc,	%i7,	%i2
	and	%g4,	0x0A32,	%i4
	fmovsvc	%xcc,	%f25,	%f29
loop_1708:
	movrlez	%g7,	%o4,	%i0
	udiv	%o3,	0x0E77,	%o6
	tvs	%icc,	0x6
	subc	%g2,	%g5,	%o5
	fxors	%f9,	%f29,	%f29
	tsubcctv	%l6,	0x1EA8,	%i3
	fmovrdgz	%l1,	%f26,	%f24
	fmovdgu	%icc,	%f22,	%f26
	fmovrsgez	%l3,	%f21,	%f3
	or	%g3,	%l0,	%g6
	array32	%l2,	%o1,	%o2
	srax	%i6,	%l4,	%o0
	movcs	%icc,	%i1,	%i5
	set	0x60, %o1
	lda	[%l7 + %o1] 0x11,	%f29
	movneg	%xcc,	%o7,	%l5
	nop
	fitod	%f18,	%f16
	srl	%g1,	0x02,	%i7
	fcmpgt16	%f0,	%f8,	%i2
	subccc	%g4,	0x1E40,	%i4
	fmul8x16al	%f7,	%f28,	%f28
	fnegd	%f30,	%f18
	xnor	%g7,	0x1381,	%i0
	fands	%f7,	%f26,	%f25
	nop
	fitod	%f2,	%f22
	fdtos	%f22,	%f13
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	fmovdleu	%xcc,	%f22,	%f30
	smul	%o6,	0x1026,	%o3
	movrne	%g2,	0x1F7,	%o5
	bg,a	%icc,	loop_1709
	fbl	%fcc0,	loop_1710
	sra	%l6,	0x1B,	%i3
	wr	%g0,	0x27,	%asi
	stxa	%l1,	[%l7 + 0x70] %asi
	membar	#Sync
loop_1709:
	bn,a	%icc,	loop_1711
loop_1710:
	edge32l	%l3,	%g3,	%l0
	popc	%g6,	%g5
	movre	%o1,	%o2,	%i6
loop_1711:
	sdivcc	%l4,	0x13C5,	%l2
	subccc	%o0,	%i5,	%i1
	fcmpgt16	%f0,	%f26,	%l5
	alignaddrl	%g1,	%i7,	%o7
	brlez	%g4,	loop_1712
	bcs	%icc,	loop_1713
	orcc	%i2,	0x07C2,	%g7
	fsrc2	%f6,	%f22
loop_1712:
	array8	%i4,	%i0,	%o4
loop_1713:
	mulscc	%o3,	%g2,	%o6
	fcmpeq32	%f26,	%f16,	%l6
	alignaddrl	%i3,	%o5,	%l3
	membar	0x47
	tneg	%xcc,	0x1
	movne	%icc,	%g3,	%l1
	nop
	setx	0x97DBE5E6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f12
	flush	%l7 + 0x60
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
	ldsb	[%l7 + 0x41],	%g6
	set	0x78, %o2
	swapa	[%l7 + %o2] 0x89,	%o1
	movne	%icc,	%g5,	%o2
	edge8l	%l4,	%i6,	%l2
	brlz	%o0,	loop_1714
	edge32l	%i1,	%i5,	%l5
	array32	%g1,	%i7,	%g4
	set	0x78, %i5
	prefetcha	[%l7 + %i5] 0x11,	 0x0
loop_1714:
	movne	%icc,	%o7,	%i4
	tle	%xcc,	0x6
	fba	%fcc3,	loop_1715
	srlx	%i0,	0x11,	%g7
	mulx	%o4,	%g2,	%o6
	mulx	%l6,	%o3,	%o5
loop_1715:
	fmovdn	%xcc,	%f28,	%f11
	set	0x70, %l5
	sta	%f8,	[%l7 + %l5] 0x81
	edge8	%i3,	%g3,	%l1
	ldub	[%l7 + 0x0D],	%l0
	tcc	%icc,	0x0
	fbu,a	%fcc2,	loop_1716
	bg	%xcc,	loop_1717
	movre	%g6,	%o1,	%l3
	tcs	%icc,	0x3
loop_1716:
	subcc	%o2,	%l4,	%i6
loop_1717:
	alignaddr	%g5,	%l2,	%o0
	fmovrslz	%i5,	%f22,	%f7
	fnegs	%f19,	%f7
	mulx	%i1,	0x00CA,	%g1
	addc	%l5,	%i7,	%i2
	tpos	%icc,	0x1
	bcc	loop_1718
	srax	%g4,	%o7,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i4,	%o4,	%g7
loop_1718:
	tsubcctv	%g2,	%l6,	%o6
	edge16n	%o5,	%i3,	%g3
	be	loop_1719
	sra	%o3,	%l0,	%g6
	mova	%icc,	%l1,	%l3
	bpos	loop_1720
loop_1719:
	movvs	%icc,	%o1,	%l4
	fpack32	%f26,	%f24,	%f12
	array8	%o2,	%g5,	%i6
loop_1720:
	ta	%xcc,	0x3
	fpsub32	%f10,	%f0,	%f0
	movrgz	%l2,	%i5,	%i1
	movleu	%icc,	%o0,	%g1
	bl,a,pn	%icc,	loop_1721
	pdist	%f0,	%f2,	%f18
	edge32ln	%l5,	%i2,	%i7
	brlz	%o7,	loop_1722
loop_1721:
	edge16l	%i0,	%i4,	%o4
	edge16n	%g7,	%g2,	%g4
	wr	%g0,	0x10,	%asi
	stxa	%l6,	[%l7 + 0x60] %asi
loop_1722:
	movg	%icc,	%o6,	%o5
	call	loop_1723
	movleu	%xcc,	%g3,	%i3
	andn	%l0,	0x1E00,	%g6
	andcc	%o3,	%l1,	%o1
loop_1723:
	call	loop_1724
	udivx	%l4,	0x1180,	%l3
	wr	%g0,	0x0c,	%asi
	stba	%o2,	[%l7 + 0x78] %asi
loop_1724:
	move	%icc,	%i6,	%g5
	tcs	%xcc,	0x6
	movneg	%xcc,	%i5,	%l2
	ldstub	[%l7 + 0x20],	%i1
	sdivcc	%g1,	0x15F7,	%l5
	addccc	%o0,	%i7,	%o7
	movre	%i0,	%i2,	%i4
	movrne	%g7,	%o4,	%g2
	fzero	%f6
	fxnor	%f28,	%f26,	%f22
	fpackfix	%f10,	%f14
	edge8l	%l6,	%o6,	%g4
	tsubcctv	%g3,	%i3,	%l0
	bne,pn	%xcc,	loop_1725
	fpackfix	%f28,	%f0
	movrgz	%g6,	%o5,	%o3
	bvc,pt	%xcc,	loop_1726
loop_1725:
	movgu	%xcc,	%o1,	%l4
	andn	%l3,	0x1D85,	%o2
	movpos	%xcc,	%i6,	%l1
loop_1726:
	ldsw	[%l7 + 0x38],	%g5
	fpack16	%f22,	%f5
	fmovsge	%icc,	%f7,	%f20
	fbul	%fcc1,	loop_1727
	be,a	loop_1728
	srax	%i5,	%i1,	%g1
	tsubcc	%l2,	%l5,	%o0
loop_1727:
	movg	%icc,	%o7,	%i7
loop_1728:
	nop
	set	0x3C, %g1
	lduw	[%l7 + %g1],	%i2
	nop
	setx	loop_1729,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%i0,	%g7,	%o4
	fmovdcc	%icc,	%f19,	%f19
	srl	%g2,	0x00,	%l6
loop_1729:
	taddcc	%i4,	0x1AAB,	%o6
	edge8n	%g3,	%i3,	%l0
	movleu	%xcc,	%g6,	%o5
	andncc	%g4,	%o1,	%l4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1c8] %asi,	%o3 ripped by fixASI40.pl ripped by fixASI40.pl
	fbl	%fcc1,	loop_1730
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l3,	0x0E87,	%i6
	tle	%icc,	0x1
loop_1730:
	fmovdg	%xcc,	%f11,	%f25
	tcs	%xcc,	0x3
	nop
	set	0x68, %i2
	stx	%l1,	[%l7 + %i2]
	tle	%icc,	0x5
	be	%icc,	loop_1731
	lduh	[%l7 + 0x56],	%o2
	mulx	%i5,	%i1,	%g5
	wr	%g0,	0x89,	%asi
	stba	%l2,	[%l7 + 0x18] %asi
loop_1731:
	fbue	%fcc0,	loop_1732
	addc	%l5,	0x192C,	%g1
	mulscc	%o0,	0x071C,	%i7
	tvs	%icc,	0x7
loop_1732:
	subcc	%i2,	%o7,	%g7
	fmovrdgz	%i0,	%f16,	%f0
	add	%g2,	%l6,	%i4
	tle	%icc,	0x3
	movgu	%icc,	%o6,	%o4
	srl	%i3,	%l0,	%g6
	movl	%xcc,	%o5,	%g3
	movleu	%icc,	%o1,	%l4
	udiv	%o3,	0x1124,	%l3
	movge	%xcc,	%i6,	%g4
	fblg	%fcc3,	loop_1733
	movre	%l1,	0x0E6,	%i5
	subcc	%o2,	0x0F40,	%i1
	edge16ln	%l2,	%g5,	%g1
loop_1733:
	fmovscc	%icc,	%f0,	%f24
	edge16	%o0,	%i7,	%i2
	fands	%f1,	%f4,	%f2
	xnor	%l5,	%g7,	%o7
	sdivcc	%g2,	0x093F,	%i0
	movrgez	%i4,	0x2FE,	%l6
	orncc	%o6,	0x02F7,	%o4
	sll	%i3,	%g6,	%o5
	taddcc	%g3,	0x0BEB,	%o1
	fmovrdne	%l0,	%f10,	%f16
	movne	%icc,	%l4,	%o3
	set	0x58, %i3
	lduwa	[%l7 + %i3] 0x04,	%i6
	edge8n	%g4,	%l1,	%l3
	fblg	%fcc3,	loop_1734
	tg	%xcc,	0x6
	fandnot2s	%f24,	%f20,	%f28
	movvs	%icc,	%i5,	%i1
loop_1734:
	edge8ln	%o2,	%l2,	%g1
	nop
	setx	0xA0420636,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	fmovdvc	%xcc,	%f10,	%f18
	for	%f22,	%f18,	%f30
	fxnors	%f31,	%f28,	%f27
	xnor	%g5,	%o0,	%i7
	addc	%i2,	0x119F,	%l5
	movrlz	%o7,	%g7,	%g2
	fmovsle	%xcc,	%f12,	%f10
	ld	[%l7 + 0x28],	%f28
	fbule	%fcc3,	loop_1735
	movcs	%icc,	%i4,	%i0
	edge32ln	%o6,	%l6,	%o4
	stx	%i3,	[%l7 + 0x50]
loop_1735:
	nop
	set	0x38, %l1
	ldx	[%l7 + %l1],	%o5
	ld	[%l7 + 0x70],	%f26
	movle	%icc,	%g6,	%g3
	addcc	%o1,	%l4,	%l0
	fone	%f10
	movleu	%xcc,	%i6,	%o3
	and	%l1,	0x1ECB,	%g4
	fnot1s	%f2,	%f3
	andn	%i5,	0x0766,	%l3
	fcmpeq16	%f8,	%f28,	%o2
	and	%i1,	0x0315,	%g1
	sethi	0x0293,	%l2
	tvc	%icc,	0x2
	ldub	[%l7 + 0x20],	%o0
	ldsh	[%l7 + 0x76],	%i7
	fmovsgu	%xcc,	%f6,	%f29
	for	%f16,	%f16,	%f8
	fmovsle	%xcc,	%f16,	%f24
	sub	%g5,	0x1AA5,	%i2
	tsubcctv	%l5,	%g7,	%o7
	bge,a	%xcc,	loop_1736
	fcmple32	%f18,	%f30,	%i4
	sdivcc	%g2,	0x120D,	%o6
	fmovscc	%xcc,	%f19,	%f13
loop_1736:
	sir	0x1742
	addc	%i0,	%l6,	%i3
	membar	0x5F
	fmovrse	%o4,	%f19,	%f28
	fmovsa	%xcc,	%f12,	%f11
	ta	%xcc,	0x7
	te	%icc,	0x4
	subc	%o5,	0x1D67,	%g3
	fmuld8ulx16	%f26,	%f15,	%f8
	xnorcc	%o1,	%g6,	%l0
	movl	%icc,	%i6,	%l4
	fandnot2s	%f3,	%f15,	%f20
	fmul8ulx16	%f22,	%f6,	%f10
	membar	0x69
	fmovrsgez	%l1,	%f12,	%f9
	tleu	%xcc,	0x4
	udiv	%g4,	0x18CE,	%i5
	udiv	%l3,	0x0A07,	%o3
	ldstub	[%l7 + 0x71],	%i1
	edge16ln	%o2,	%l2,	%g1
	nop
	setx	0xD05CAD5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	tle	%xcc,	0x2
	edge8ln	%i7,	%o0,	%g5
	tleu	%icc,	0x5
	fble	%fcc0,	loop_1737
	movrlez	%i2,	0x21E,	%l5
	fnand	%f20,	%f8,	%f26
	sir	0x16AA
loop_1737:
	array16	%o7,	%g7,	%i4
	fcmpne16	%f18,	%f4,	%g2
	te	%icc,	0x4
	mova	%icc,	%i0,	%o6
	bvc,a	%xcc,	loop_1738
	brgez	%i3,	loop_1739
	fmovrse	%o4,	%f16,	%f10
	tge	%icc,	0x4
loop_1738:
	andn	%o5,	%g3,	%o1
loop_1739:
	sir	0x06D4
	movrgez	%l6,	0x24F,	%g6
	fmovdpos	%xcc,	%f23,	%f21
	fbe,a	%fcc0,	loop_1740
	movrlez	%i6,	%l4,	%l0
	bl	loop_1741
	sethi	0x0959,	%g4
loop_1740:
	move	%icc,	%l1,	%l3
	mulx	%o3,	%i5,	%i1
loop_1741:
	fbne,a	%fcc3,	loop_1742
	fbule,a	%fcc3,	loop_1743
	tle	%xcc,	0x6
	subcc	%o2,	%g1,	%l2
loop_1742:
	tgu	%xcc,	0x4
loop_1743:
	fbe,a	%fcc0,	loop_1744
	mulx	%o0,	%i7,	%g5
	fpadd16s	%f28,	%f10,	%f30
	movre	%l5,	%o7,	%i2
loop_1744:
	edge16ln	%i4,	%g7,	%g2
	fcmpne16	%f24,	%f6,	%i0
	fandnot1s	%f8,	%f15,	%f22
	subccc	%i3,	%o6,	%o4
	popc	%o5,	%g3
	subcc	%o1,	0x1ECE,	%l6
	call	loop_1745
	fbn,a	%fcc1,	loop_1746
	nop
	setx	0xF49CC867A067EDD5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	edge32n	%i6,	%l4,	%g6
loop_1745:
	fmovdg	%icc,	%f24,	%f13
loop_1746:
	mova	%xcc,	%l0,	%l1
	ldd	[%l7 + 0x58],	%g4
	fmovsneg	%icc,	%f11,	%f27
	fbuge,a	%fcc2,	loop_1747
	srlx	%o3,	%i5,	%l3
	tpos	%xcc,	0x0
	mulx	%i1,	%o2,	%g1
loop_1747:
	movrne	%o0,	%l2,	%g5
	tge	%icc,	0x1
	nop
	setx	0xB2B689E93F8347EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f26
	nop
	setx	0x3BE6CA256843A3C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f20
	nop
	fitos	%f3,	%f21
	fstod	%f21,	%f12
	fbo,a	%fcc1,	loop_1748
	nop
	set	0x24, %o0
	prefetch	[%l7 + %o0],	 0x3
	movrgez	%l5,	0x259,	%o7
	fmovdcs	%xcc,	%f26,	%f27
loop_1748:
	ta	%icc,	0x4
	tle	%xcc,	0x2
	fabsd	%f12,	%f20
	fmovdpos	%icc,	%f31,	%f9
	orn	%i7,	0x1660,	%i4
	fbg	%fcc2,	loop_1749
	fabss	%f1,	%f11
	movne	%icc,	%i2,	%g7
	nop
	setx	0xE93A60FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xDC7DAFD0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f24,	%f7
loop_1749:
	movvs	%icc,	%i0,	%g2
	move	%icc,	%i3,	%o4
	fmuld8ulx16	%f10,	%f10,	%f18
	andn	%o5,	%o6,	%g3
	movrlez	%l6,	%o1,	%i6
	faligndata	%f20,	%f20,	%f28
	fbl	%fcc3,	loop_1750
	add	%l4,	0x0438,	%l0
	alignaddrl	%g6,	%g4,	%o3
	bcs	loop_1751
loop_1750:
	taddcc	%i5,	%l3,	%i1
	edge16n	%o2,	%l1,	%o0
	edge16n	%l2,	%g1,	%l5
loop_1751:
	bg,pn	%icc,	loop_1752
	fpackfix	%f20,	%f12
	ldsb	[%l7 + 0x18],	%g5
	udiv	%o7,	0x1811,	%i7
loop_1752:
	tsubcc	%i2,	%i4,	%g7
	srl	%i0,	0x08,	%g2
	brlez,a	%o4,	loop_1753
	umulcc	%i3,	%o5,	%g3
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1753:
	tgu	%xcc,	0x6
	movrlez	%o6,	0x0D2,	%o1
	mulscc	%i6,	0x1A84,	%l4
	ba,a	loop_1754
	bge,a,pt	%xcc,	loop_1755
	movrlez	%l6,	%l0,	%g4
	mulscc	%g6,	%i5,	%o3
loop_1754:
	udiv	%i1,	0x1357,	%l3
loop_1755:
	edge32ln	%o2,	%l1,	%o0
	fmovdn	%xcc,	%f17,	%f15
	fba,a	%fcc3,	loop_1756
	edge32ln	%l2,	%l5,	%g1
	movcs	%xcc,	%o7,	%i7
	array16	%g5,	%i2,	%g7
loop_1756:
	popc	0x1890,	%i4
	stb	%i0,	[%l7 + 0x26]
	bcs,a	%xcc,	loop_1757
	movrlez	%o4,	0x046,	%g2
	movn	%xcc,	%i3,	%g3
	fmovsle	%icc,	%f2,	%f31
loop_1757:
	tge	%xcc,	0x1
	set	0x30, %l4
	ldswa	[%l7 + %l4] 0x10,	%o6
	fbu	%fcc0,	loop_1758
	edge16ln	%o1,	%o5,	%l4
	fbo,a	%fcc0,	loop_1759
	ta	%icc,	0x5
loop_1758:
	movvc	%icc,	%i6,	%l6
	edge16ln	%l0,	%g4,	%i5
loop_1759:
	fmovrdne	%g6,	%f30,	%f12
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f4
	fxtod	%f4,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1760
	taddcc	%i1,	%l3,	%o3
	umul	%o2,	%l1,	%l2
	movne	%xcc,	%o0,	%g1
loop_1760:
	alignaddr	%o7,	%i7,	%g5
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x54] %asi,	%i2
	tleu	%icc,	0x6
	array8	%l5,	%i4,	%i0
	tleu	%icc,	0x2
	movl	%xcc,	%g7,	%o4
	ldd	[%l7 + 0x10],	%f8
	edge32ln	%g2,	%i3,	%g3
	fxnor	%f20,	%f2,	%f12
	movleu	%icc,	%o6,	%o1
	bvc	loop_1761
	sdiv	%o5,	0x1A62,	%i6
	brlz,a	%l6,	loop_1762
	ble,a,pt	%icc,	loop_1763
loop_1761:
	srl	%l4,	0x1B,	%g4
	fmovrdgez	%l0,	%f30,	%f18
loop_1762:
	addccc	%g6,	0x0244,	%i1
loop_1763:
	fmovs	%f8,	%f31
	movl	%xcc,	%l3,	%i5
	mulscc	%o2,	%o3,	%l2
	popc	0x0D33,	%l1
	brlz	%g1,	loop_1764
	fxor	%f4,	%f30,	%f30
	or	%o7,	%i7,	%g5
	fnegs	%f29,	%f1
loop_1764:
	orncc	%i2,	%o0,	%l5
	sll	%i0,	%i4,	%o4
	umul	%g2,	%g7,	%i3
	fbul	%fcc3,	loop_1765
	add	%g3,	%o6,	%o1
	sub	%i6,	%o5,	%l6
	edge32l	%g4,	%l0,	%g6
loop_1765:
	or	%l4,	0x0A1D,	%l3
	fbl,a	%fcc1,	loop_1766
	fbo,a	%fcc0,	loop_1767
	taddcc	%i5,	0x0A0B,	%i1
	tn	%icc,	0x7
loop_1766:
	movrgz	%o2,	0x380,	%o3
loop_1767:
	fand	%f30,	%f0,	%f16
	nop
	setx	0x7A3F2114C0531A4C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	edge8l	%l2,	%l1,	%g1
	fxor	%f2,	%f2,	%f24
	smulcc	%o7,	%g5,	%i2
	taddcc	%i7,	%o0,	%l5
	brgez,a	%i4,	loop_1768
	bl,a	%icc,	loop_1769
	sll	%o4,	%i0,	%g2
	fnot2	%f4,	%f16
loop_1768:
	swap	[%l7 + 0x48],	%i3
loop_1769:
	edge8n	%g3,	%o6,	%o1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%g7
	umulcc	%o5,	%i6,	%l6
	ldsb	[%l7 + 0x79],	%l0
	fpadd32s	%f20,	%f26,	%f17
	umul	%g4,	%g6,	%l4
	fbn,a	%fcc0,	loop_1770
	movgu	%icc,	%l3,	%i1
	bne	%xcc,	loop_1771
	subcc	%o2,	%o3,	%l2
loop_1770:
	movn	%xcc,	%i5,	%g1
	nop
	setx	0x6530E42B6056A196,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
loop_1771:
	fmovsgu	%xcc,	%f29,	%f10
	orncc	%o7,	%g5,	%i2
	ta	%xcc,	0x5
	movre	%l1,	%i7,	%l5
	or	%o0,	0x1B06,	%i4
	andncc	%o4,	%i0,	%g2
	ld	[%l7 + 0x18],	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i3,	%o6
	ld	[%l7 + 0x1C],	%f1
	mulscc	%g3,	%g7,	%o1
	add	%i6,	0x1EBE,	%l6
	fbne	%fcc3,	loop_1772
	movneg	%icc,	%o5,	%g4
	sethi	0x1FFA,	%l0
	membar	0x08
loop_1772:
	ldd	[%l7 + 0x38],	%g6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l3
	movrlz	%l4,	%i1,	%o3
	fmovsvc	%icc,	%f25,	%f29
	nop
	setx	0xFEDB7C49,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xFB1D4675,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f25,	%f7
	fbue	%fcc2,	loop_1773
	fabsd	%f30,	%f0
	fba	%fcc3,	loop_1774
	movcc	%icc,	%l2,	%o2
loop_1773:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g1,	0x1028,	%o7
loop_1774:
	ldx	[%l7 + 0x78],	%g5
	andn	%i2,	0x0148,	%i5
	nop
	setx	0x87811F97,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x7B59CA89,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f16,	%f10
	tge	%icc,	0x1
	fbul	%fcc3,	loop_1775
	fmovs	%f12,	%f2
	fmovrdne	%i7,	%f8,	%f14
	fcmple32	%f24,	%f8,	%l5
loop_1775:
	edge8n	%l1,	%i4,	%o4
	wr	%g0,	0x2f,	%asi
	stha	%o0,	[%l7 + 0x18] %asi
	membar	#Sync
	sdivcc	%i0,	0x006A,	%g2
	fsrc1s	%f24,	%f28
	flush	%l7 + 0x24
	movrne	%o6,	%g3,	%g7
	movvs	%xcc,	%i3,	%o1
	addccc	%i6,	0x17DF,	%l6
	stbar
	tg	%xcc,	0x0
	te	%xcc,	0x3
	fbul	%fcc3,	loop_1776
	sethi	0x044E,	%o5
	tsubcctv	%g4,	%l0,	%l3
	movcc	%icc,	%g6,	%l4
loop_1776:
	array8	%i1,	%o3,	%o2
	fmovdcc	%icc,	%f0,	%f6
	nop
	setx	0x39D6F91BD35434DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x96828AC1BB6222CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f2,	%f4
	movg	%icc,	%g1,	%l2
	nop
	setx	0xB3BDE3DD8493B557,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x057F5C975F111C52,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f2,	%f14
	tl	%icc,	0x3
	move	%xcc,	%g5,	%i2
	subc	%i5,	%i7,	%l5
	andn	%o7,	0x1D40,	%l1
	taddcctv	%i4,	%o4,	%o0
	array16	%g2,	%o6,	%i0
	fzeros	%f20
	fmul8x16	%f9,	%f2,	%f22
	taddcc	%g3,	0x1AD8,	%g7
	taddcctv	%o1,	0x141D,	%i3
	movrlz	%i6,	0x380,	%o5
	fmovd	%f16,	%f24
	sethi	0x1C30,	%l6
	udiv	%g4,	0x067B,	%l0
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x26] %asi,	%l3
	taddcc	%g6,	0x16D5,	%i1
	bcs,pn	%xcc,	loop_1777
	udiv	%o3,	0x1AF7,	%o2
	edge16l	%g1,	%l2,	%l4
	fnot1	%f16,	%f4
loop_1777:
	addccc	%i2,	0x1EAA,	%g5
	ldsh	[%l7 + 0x7E],	%i7
	movleu	%icc,	%i5,	%l5
	fmovsle	%xcc,	%f11,	%f31
	bg,a	%icc,	loop_1778
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f8
	fsrc2	%f4,	%f6
	tcs	%icc,	0x4
loop_1778:
	std	%f16,	[%l7 + 0x60]
	fmovdvc	%xcc,	%f13,	%f14
	fbug,a	%fcc2,	loop_1779
	for	%f26,	%f26,	%f4
	movre	%o7,	%i4,	%l1
	fba,a	%fcc0,	loop_1780
loop_1779:
	nop
	setx loop_1781, %l0, %l1
	jmpl %l1, %o0
	array32	%g2,	%o6,	%o4
	movg	%xcc,	%i0,	%g7
loop_1780:
	taddcc	%o1,	%g3,	%i6
loop_1781:
	tl	%icc,	0x3
	nop
	setx	0xA255EABFF1FEEFCC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x98F13824F46E2171,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f30,	%f8
	fornot2s	%f10,	%f4,	%f0
	fpsub16	%f10,	%f22,	%f8
	tge	%xcc,	0x7
	tge	%xcc,	0x1
	bcs,a,pt	%icc,	loop_1782
	membar	0x79
	array32	%o5,	%i3,	%g4
	tgu	%icc,	0x3
loop_1782:
	srax	%l6,	0x0E,	%l0
	prefetch	[%l7 + 0x3C],	 0x1
	bgu,a,pn	%icc,	loop_1783
	edge8ln	%g6,	%i1,	%l3
	stx	%o2,	[%l7 + 0x38]
	fbue	%fcc3,	loop_1784
loop_1783:
	tleu	%icc,	0x2
	tgu	%icc,	0x4
	tsubcc	%g1,	0x0A70,	%l2
loop_1784:
	movle	%xcc,	%o3,	%l4
	srlx	%i2,	%i7,	%g5
	wr	%g0,	0xe2,	%asi
	stba	%l5,	[%l7 + 0x37] %asi
	membar	#Sync
	tsubcctv	%o7,	0x043E,	%i4
	addccc	%l1,	%i5,	%g2
	bge	%xcc,	loop_1785
	sll	%o6,	%o4,	%i0
	movne	%icc,	%g7,	%o0
	tg	%xcc,	0x4
loop_1785:
	te	%xcc,	0x1
	tle	%xcc,	0x4
	alignaddrl	%o1,	%g3,	%o5
	movle	%xcc,	%i3,	%i6
	tge	%xcc,	0x1
	movre	%g4,	0x385,	%l0
	fmovrdlz	%g6,	%f0,	%f30
	fbge,a	%fcc0,	loop_1786
	ld	[%l7 + 0x6C],	%f18
	smul	%i1,	%l6,	%l3
	fbge,a	%fcc1,	loop_1787
loop_1786:
	fmovs	%f10,	%f1
	set	0x62, %l3
	ldsha	[%l7 + %l3] 0x14,	%o2
loop_1787:
	alignaddrl	%g1,	%l2,	%o3
	add	%i2,	0x05A6,	%i7
	tpos	%xcc,	0x1
	fmovrsgz	%g5,	%f29,	%f2
	fmovsle	%icc,	%f16,	%f30
	xnorcc	%l5,	%l4,	%o7
	sub	%i4,	%l1,	%g2
	udiv	%i5,	0x13A9,	%o4
	bcc,pn	%xcc,	loop_1788
	tle	%icc,	0x1
	tne	%icc,	0x6
	fmovdcc	%xcc,	%f11,	%f0
loop_1788:
	sdiv	%o6,	0x1421,	%i0
	tle	%icc,	0x6
	fbuge	%fcc3,	loop_1789
	sdivcc	%g7,	0x1072,	%o1
	movrlez	%o0,	0x235,	%o5
	movn	%icc,	%i3,	%i6
loop_1789:
	fcmpgt16	%f12,	%f4,	%g3
	or	%g4,	0x049F,	%g6
	set	0x64, %o5
	lduwa	[%l7 + %o5] 0x11,	%i1
	edge32ln	%l0,	%l6,	%o2
	addc	%g1,	%l3,	%l2
	movcs	%icc,	%o3,	%i7
	andn	%g5,	0x107B,	%i2
	taddcctv	%l5,	0x1412,	%o7
	ble	%xcc,	loop_1790
	srax	%l4,	0x0D,	%i4
	xor	%l1,	0x1162,	%i5
	fnand	%f10,	%f24,	%f14
loop_1790:
	fbge,a	%fcc2,	loop_1791
	fbuge	%fcc3,	loop_1792
	fnot2s	%f23,	%f24
	udiv	%o4,	0x1C3F,	%g2
loop_1791:
	taddcc	%i0,	%g7,	%o1
loop_1792:
	move	%icc,	%o6,	%o0
	bcc,a,pn	%xcc,	loop_1793
	udivx	%i3,	0x1E53,	%i6
	andcc	%g3,	%g4,	%o5
	movvc	%icc,	%i1,	%l0
loop_1793:
	movne	%icc,	%l6,	%g6
	fones	%f14
	stx	%o2,	[%l7 + 0x10]
	ldd	[%l7 + 0x68],	%f18
	set	0x54, %g6
	swapa	[%l7 + %g6] 0x81,	%g1
	nop
	set	0x0D, %i4
	ldstub	[%l7 + %i4],	%l2
	fand	%f16,	%f28,	%f30
	fcmpeq16	%f18,	%f30,	%l3
	xorcc	%o3,	%g5,	%i7
	srl	%i2,	%o7,	%l4
	movgu	%xcc,	%i4,	%l5
	udivx	%i5,	0x0C1F,	%o4
	movcc	%xcc,	%g2,	%l1
	edge32ln	%i0,	%o1,	%o6
	nop
	setx	0x1CD74FED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xA3564436,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f17,	%f27
	bcs,pn	%icc,	loop_1794
	tg	%icc,	0x6
	edge32	%g7,	%o0,	%i6
	movvs	%xcc,	%i3,	%g4
loop_1794:
	fmovdcs	%icc,	%f19,	%f10
	movrgz	%o5,	%g3,	%i1
	wr	%g0,	0x18,	%asi
	stha	%l0,	[%l7 + 0x34] %asi
	fmovsle	%xcc,	%f9,	%f5
	fmovsle	%icc,	%f16,	%f22
	udiv	%l6,	0x0836,	%g6
	movleu	%icc,	%o2,	%l2
	edge16	%g1,	%l3,	%o3
	movle	%xcc,	%g5,	%i7
	edge32l	%i2,	%o7,	%i4
	or	%l5,	0x131E,	%l4
	fbl	%fcc0,	loop_1795
	flush	%l7 + 0x20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i5,	[%l7 + 0x6E]
loop_1795:
	nop
	set	0x52, %g4
	ldsha	[%l7 + %g4] 0x81,	%o4
	tle	%icc,	0x3
	andncc	%g2,	%l1,	%o1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o6,	%g7
	sub	%i0,	%o0,	%i3
	addcc	%g4,	0x0CE4,	%o5
	fmovdne	%xcc,	%f16,	%f4
	bleu	loop_1796
	nop
	setx	0x831AC53B3934B8BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x472D5FE00AC751CD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f4,	%f24
	orn	%i6,	%i1,	%g3
	udiv	%l6,	0x0AB7,	%g6
loop_1796:
	subc	%o2,	%l2,	%l0
	sub	%g1,	%o3,	%l3
	add	%i7,	%i2,	%o7
	fmovsvc	%xcc,	%f29,	%f17
	movrgez	%i4,	0x13F,	%l5
	srl	%g5,	%l4,	%i5
	xor	%o4,	%g2,	%l1
	popc	0x1E43,	%o6
	movleu	%icc,	%o1,	%i0
	array16	%g7,	%i3,	%g4
	fpsub32	%f8,	%f0,	%f30
	fmovsl	%icc,	%f13,	%f7
	xnorcc	%o5,	0x0F91,	%o0
	movne	%icc,	%i6,	%g3
	orn	%l6,	0x1202,	%i1
	subc	%g6,	%o2,	%l0
	xorcc	%g1,	%l2,	%l3
	edge8n	%o3,	%i7,	%i2
	smul	%o7,	0x1B95,	%i4
	fpack32	%f20,	%f16,	%f30
	fmovrsne	%g5,	%f28,	%f15
	srl	%l5,	0x13,	%l4
	sth	%i5,	[%l7 + 0x26]
	ldstub	[%l7 + 0x49],	%o4
	fbule,a	%fcc2,	loop_1797
	fmovrdne	%g2,	%f8,	%f8
	edge8	%l1,	%o6,	%i0
	fzeros	%f11
loop_1797:
	subcc	%g7,	0x05F0,	%i3
	fand	%f4,	%f16,	%f10
	fxnor	%f14,	%f0,	%f12
	stbar
	tle	%icc,	0x3
	tcc	%xcc,	0x1
	fmovsle	%xcc,	%f13,	%f28
	sllx	%o1,	%g4,	%o0
	nop
	fitos	%f23,	%f28
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%o5
	fsrc2s	%f13,	%f0
	tsubcctv	%g3,	0x16DA,	%l6
	movrne	%i6,	%g6,	%o2
	movcc	%icc,	%i1,	%g1
	bl,a,pn	%xcc,	loop_1798
	membar	0x4F
	taddcctv	%l0,	0x0A4C,	%l3
	tvs	%xcc,	0x7
loop_1798:
	andcc	%o3,	0x1A8F,	%i7
	fmovsn	%icc,	%f1,	%f17
	tleu	%icc,	0x7
	movle	%xcc,	%l2,	%i2
	edge8n	%o7,	%i4,	%l5
	fmovrsne	%g5,	%f2,	%f17
	nop
	setx	0x77EE7B38,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x0FAA7AA9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fsubs	%f7,	%f15,	%f2
	movneg	%icc,	%l4,	%i5
	stw	%o4,	[%l7 + 0x0C]
	fandnot2s	%f0,	%f22,	%f14
	movne	%xcc,	%g2,	%l1
	tvs	%xcc,	0x0
	fmovdcs	%icc,	%f25,	%f24
	sll	%o6,	0x10,	%g7
	orncc	%i3,	0x0506,	%o1
	nop
	set	0x76, %o3
	ldsh	[%l7 + %o3],	%g4
	ba,pn	%xcc,	loop_1799
	fbg,a	%fcc3,	loop_1800
	movrne	%o0,	0x1DB,	%i0
	st	%f0,	[%l7 + 0x28]
loop_1799:
	orcc	%o5,	0x11D0,	%l6
loop_1800:
	sdiv	%g3,	0x1B2A,	%g6
	edge32n	%i6,	%o2,	%i1
	fba	%fcc3,	loop_1801
	fbul,a	%fcc3,	loop_1802
	fpack32	%f26,	%f26,	%f0
	movn	%xcc,	%l0,	%l3
loop_1801:
	movre	%o3,	0x06C,	%g1
loop_1802:
	fbul	%fcc2,	loop_1803
	popc	0x1F90,	%l2
	edge16l	%i2,	%o7,	%i4
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x11,	%l4
loop_1803:
	taddcctv	%g5,	0x1452,	%l4
	array8	%i5,	%o4,	%g2
	set	0x30, %g7
	ldswa	[%l7 + %g7] 0x11,	%l1
	set	0x10, %o4
	ldda	[%l7 + %o4] 0x2a,	%i6
	tge	%xcc,	0x4
	andncc	%o6,	%i3,	%o1
	movne	%xcc,	%g7,	%g4
	fcmpeq16	%f26,	%f4,	%o0
	fmovsvs	%icc,	%f9,	%f15
	taddcc	%i0,	%l6,	%g3
	call	loop_1804
	te	%icc,	0x0
	subccc	%g6,	0x1D76,	%o5
	fmovscs	%xcc,	%f27,	%f6
loop_1804:
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
	andn	%i6,	%i1,	%o2
	fornot2	%f14,	%f16,	%f14
	srax	%l0,	0x01,	%l3
loop_1805:
	nop
	setx	0x2FD73FA479D5BEA1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x113CEB0C14EB87B8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f20,	%f30
	and	%o3,	%g1,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f28,	%f26
	ble,pt	%xcc,	loop_1806
	tne	%xcc,	0x2
	edge8ln	%o7,	%i4,	%i2
	bpos	loop_1807
loop_1806:
	add	%l5,	%l4,	%g5
	tcs	%icc,	0x0
	andcc	%o4,	%i5,	%g2
loop_1807:
	movre	%i7,	0x3AE,	%o6
	fbg	%fcc3,	loop_1808
	taddcctv	%i3,	0x1C85,	%o1
	fbg,a	%fcc1,	loop_1809
	fbul,a	%fcc3,	loop_1810
loop_1808:
	fbue	%fcc1,	loop_1811
	tgu	%icc,	0x0
loop_1809:
	fmovsg	%xcc,	%f30,	%f25
loop_1810:
	tgu	%xcc,	0x0
loop_1811:
	udivx	%g7,	0x04B0,	%l1
	fornot1	%f2,	%f8,	%f26
	andn	%o0,	0x0E4D,	%g4
	and	%l6,	%g3,	%g6
	st	%f23,	[%l7 + 0x34]
	ldsw	[%l7 + 0x34],	%i0
	tpos	%icc,	0x6
	bcc,pn	%xcc,	loop_1812
	movcc	%xcc,	%i6,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i1,	0x0CB4,	%o2
loop_1812:
	fcmpgt16	%f26,	%f14,	%l3
	std	%f12,	[%l7 + 0x40]
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o3
	xnor	%g1,	%l2,	%l0
	tpos	%icc,	0x0
	fmovdn	%xcc,	%f4,	%f18
	sll	%o7,	0x00,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i4,	0x0344,	%l5
	fbl,a	%fcc2,	loop_1813
	sub	%g5,	%o4,	%l4
	tvc	%icc,	0x4
	nop
	setx	0x0AD9CB0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x70F0A51C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f24,	%f13
loop_1813:
	xnor	%g2,	0x0B77,	%i7
	lduw	[%l7 + 0x54],	%i5
	fmovrsne	%i3,	%f12,	%f26
	edge16l	%o1,	%o6,	%g7
	movcs	%xcc,	%o0,	%g4
	tvs	%icc,	0x7
	xor	%l6,	0x02CA,	%g3
	tge	%xcc,	0x3
	movl	%xcc,	%g6,	%l1
	fmovrdlez	%i6,	%f30,	%f18
	fmovdg	%xcc,	%f21,	%f30
	edge32ln	%i0,	%o5,	%i1
	tne	%xcc,	0x3
	tneg	%icc,	0x4
	bgu	%xcc,	loop_1814
	mova	%icc,	%l3,	%o2
	mulx	%g1,	%l2,	%o3
	set	0x7A, %g2
	ldsha	[%l7 + %g2] 0x88,	%o7
loop_1814:
	xor	%i2,	0x0B06,	%i4
	fmul8ulx16	%f12,	%f20,	%f20
	fmovdg	%xcc,	%f25,	%f1
	andncc	%l0,	%l5,	%o4
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	nop
	setx	0xBEA18BBFBAAAB486,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x5D3AC20929B76A41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f30,	%f0
	ldstub	[%l7 + 0x50],	%g2
	srl	%i7,	%i5,	%l4
	ta	%xcc,	0x7
	edge8ln	%o1,	%o6,	%g7
	fsrc1	%f26,	%f12
	xnorcc	%o0,	0x09D2,	%i3
	fmul8x16	%f30,	%f22,	%f20
	edge16l	%l6,	%g4,	%g6
	udivcc	%l1,	0x0D6B,	%g3
	umul	%i0,	%i6,	%o5
	edge32l	%l3,	%i1,	%o2
	fsrc1	%f12,	%f14
	tneg	%icc,	0x1
	tcs	%icc,	0x3
	nop
	set	0x30, %l2
	ldsh	[%l7 + %l2],	%l2
	movleu	%icc,	%g1,	%o7
	tpos	%icc,	0x6
	nop
	fitos	%f10,	%f8
	fstod	%f8,	%f20
	fbne,a	%fcc2,	loop_1815
	edge32ln	%i2,	%i4,	%l0
	sllx	%o3,	0x00,	%o4
	sdivcc	%g5,	0x01D5,	%l5
loop_1815:
	nop
	set	0x31, %i0
	ldsba	[%l7 + %i0] 0x0c,	%i7
	movl	%icc,	%g2,	%i5
	tsubcctv	%o1,	0x100E,	%l4
	fpack32	%f8,	%f10,	%f28
	xor	%o6,	%o0,	%i3
	fornot1	%f16,	%f0,	%f8
	orcc	%g7,	0x00E7,	%l6
	fandnot2	%f26,	%f24,	%f26
	movvs	%icc,	%g4,	%l1
	tle	%xcc,	0x6
	array8	%g6,	%i0,	%g3
	and	%o5,	0x16D9,	%l3
	taddcctv	%i6,	0x1E74,	%i1
	edge8	%o2,	%l2,	%o7
	movleu	%icc,	%g1,	%i4
	udivcc	%l0,	0x1A94,	%i2
	array8	%o3,	%o4,	%g5
	add	%i7,	%g2,	%i5
	movrlz	%o1,	0x14A,	%l5
	movneg	%xcc,	%o6,	%l4
	fand	%f2,	%f28,	%f0
	faligndata	%f6,	%f18,	%f24
	tpos	%icc,	0x2
	fmovdge	%xcc,	%f17,	%f27
	bpos	%xcc,	loop_1816
	tge	%icc,	0x4
	fmovspos	%icc,	%f11,	%f6
	bn	loop_1817
loop_1816:
	popc	%o0,	%g7
	fpsub32	%f12,	%f6,	%f4
	udivx	%l6,	0x1491,	%g4
loop_1817:
	tle	%xcc,	0x4
	set	0x44, %i6
	stwa	%l1,	[%l7 + %i6] 0x18
	nop
	setx	0xA83F0D2497DF9227,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xDC625ACE1456082E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f12,	%f12
	udiv	%g6,	0x1E28,	%i0
	brgz,a	%g3,	loop_1818
	movg	%xcc,	%i3,	%o5
	xorcc	%l3,	0x0ECC,	%i1
	fnot1s	%f22,	%f17
loop_1818:
	fmovdvc	%icc,	%f21,	%f14
	edge16	%i6,	%o2,	%o7
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x64] %asi,	%l2
	tvs	%icc,	0x7
	movgu	%icc,	%g1,	%l0
	set	0x18, %g3
	stxa	%i4,	[%l7 + %g3] 0x2b
	membar	#Sync
	lduw	[%l7 + 0x54],	%i2
	edge32l	%o3,	%o4,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x3
	subc	%g5,	0x13EE,	%g2
	udiv	%i5,	0x054D,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l5,	%l4,	%o6
	tvc	%xcc,	0x3
	set	0x54, %g5
	lduwa	[%l7 + %g5] 0x04,	%g7
	udiv	%l6,	0x1713,	%g4
	ld	[%l7 + 0x38],	%f16
	fcmpne32	%f12,	%f6,	%l1
	sra	%g6,	0x1A,	%o0
	fmovsleu	%xcc,	%f14,	%f7
	stx	%i0,	[%l7 + 0x58]
	fmovd	%f26,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g3,	0x0F48,	%i3
	subccc	%l3,	0x0E68,	%o5
	nop
	setx	0xEE572ED539C7A9C4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f30
	fbne,a	%fcc0,	loop_1819
	taddcc	%i6,	0x1440,	%o2
	tcc	%xcc,	0x2
	addccc	%o7,	0x11AF,	%i1
loop_1819:
	fpsub32	%f0,	%f6,	%f0
	for	%f30,	%f16,	%f2
	movpos	%icc,	%g1,	%l0
	alignaddrl	%i4,	%l2,	%i2
	subcc	%o4,	0x1780,	%i7
	fmovrsgz	%g5,	%f13,	%f27
	fpadd16	%f8,	%f30,	%f18
	movge	%xcc,	%g2,	%o3
	taddcctv	%i5,	0x1A8A,	%l5
	fpsub32	%f22,	%f20,	%f16
	movcs	%xcc,	%l4,	%o6
	orn	%o1,	%g7,	%l6
	te	%icc,	0x6
	movle	%icc,	%l1,	%g4
	nop
	setx	0xE05375EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	fmovrdlz	%o0,	%f18,	%f12
	st	%f1,	[%l7 + 0x58]
	nop
	setx	0x6299D7FC3788D078,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x5F2196ACFC50A2B5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f14,	%f20
	udiv	%g6,	0x150F,	%g3
	nop
	fitos	%f27,	%f13
	addccc	%i3,	0x0B22,	%i0
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x60] %asi,	%o5
	sdiv	%l3,	0x04F2,	%o2
	movpos	%xcc,	%i6,	%i1
	edge16ln	%o7,	%g1,	%i4
	bg,a	loop_1820
	array16	%l2,	%i2,	%l0
	movleu	%icc,	%i7,	%o4
	fabsd	%f22,	%f26
loop_1820:
	lduw	[%l7 + 0x3C],	%g5
	fornot1s	%f30,	%f21,	%f22
	tsubcc	%o3,	%i5,	%l5
	srl	%g2,	%l4,	%o1
	fbne,a	%fcc2,	loop_1821
	tcs	%icc,	0x3
	array16	%g7,	%o6,	%l6
	subccc	%l1,	%g4,	%o0
loop_1821:
	taddcctv	%g6,	%i3,	%i0
	srax	%g3,	%o5,	%l3
	array32	%o2,	%i6,	%o7
	tpos	%xcc,	0x1
	tge	%xcc,	0x2
	tn	%xcc,	0x3
	tcs	%icc,	0x1
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movrgz	%g1,	0x2BE,	%i1
	edge32n	%i4,	%l2,	%l0
	fzeros	%f17
	tleu	%icc,	0x6
	fzero	%f10
	movn	%xcc,	%i2,	%i7
	set	0x50, %l6
	stxa	%o4,	[%l7 + %l6] 0x2a
	membar	#Sync
	fpadd16	%f16,	%f14,	%f4
	nop
	setx	0x6C4F77CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xEF0080E8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f5,	%f14
	bcc,pt	%icc,	loop_1822
	nop
	set	0x62, %i7
	ldsh	[%l7 + %i7],	%o3
	fmovdleu	%xcc,	%f3,	%f21
	fzeros	%f4
loop_1822:
	movl	%icc,	%i5,	%g5
	fble,a	%fcc1,	loop_1823
	subccc	%g2,	%l4,	%l5
	orn	%o1,	0x0296,	%g7
	membar	0x6F
loop_1823:
	subcc	%o6,	%l1,	%l6
	sub	%g4,	0x0389,	%g6
	array32	%i3,	%o0,	%i0
	fmovscs	%icc,	%f5,	%f4
	movneg	%icc,	%g3,	%l3
	sdivx	%o2,	0x0BCE,	%i6
	set	0x58, %i1
	sta	%f5,	[%l7 + %i1] 0x11
	movrne	%o7,	0x29B,	%o5
	movge	%icc,	%i1,	%g1
	bneg,a,pn	%icc,	loop_1824
	fpadd32s	%f10,	%f5,	%f5
	fbe,a	%fcc1,	loop_1825
	movre	%i4,	%l0,	%i2
loop_1824:
	edge32	%l2,	%i7,	%o3
	fba	%fcc2,	loop_1826
loop_1825:
	edge8l	%i5,	%g5,	%g2
	movrne	%o4,	0x3E4,	%l5
	brlz	%o1,	loop_1827
loop_1826:
	tpos	%xcc,	0x2
	edge8ln	%l4,	%o6,	%l1
	brgz	%g7,	loop_1828
loop_1827:
	fbg,a	%fcc1,	loop_1829
	bpos,pt	%icc,	loop_1830
	fmovscc	%icc,	%f12,	%f21
loop_1828:
	move	%xcc,	%l6,	%g6
loop_1829:
	sub	%g4,	%i3,	%o0
loop_1830:
	movvc	%icc,	%g3,	%l3
	tleu	%xcc,	0x0
	movl	%xcc,	%o2,	%i6
	subcc	%o7,	0x0BC5,	%i0
	wr	%g0,	0xe2,	%asi
	stba	%o5,	[%l7 + 0x23] %asi
	membar	#Sync
	ba,a,pn	%icc,	loop_1831
	brgez,a	%g1,	loop_1832
	ble,a,pn	%icc,	loop_1833
	edge16ln	%i1,	%l0,	%i4
loop_1831:
	fmovdg	%icc,	%f2,	%f30
loop_1832:
	edge32n	%i2,	%l2,	%o3
loop_1833:
	edge16	%i5,	%g5,	%i7
	add	%o4,	0x11E0,	%g2
	umulcc	%o1,	0x0C19,	%l4
	tleu	%icc,	0x1
	add	%l5,	%o6,	%l1
	bcs,a	loop_1834
	movle	%xcc,	%l6,	%g6
	edge8	%g7,	%g4,	%o0
	fmul8sux16	%f6,	%f2,	%f8
loop_1834:
	movrlez	%i3,	0x0A3,	%g3
	edge32l	%l3,	%i6,	%o7
	bpos,a,pn	%xcc,	loop_1835
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
	fcmpgt32	%f24,	%f20,	%o2
	fpadd16	%f12,	%f26,	%f12
loop_1835:
	fmovrdne	%i0,	%f28,	%f10
loop_1836:
	sethi	0x1E20,	%o5
	lduh	[%l7 + 0x68],	%i1
	fpadd16	%f2,	%f28,	%f20
	tpos	%xcc,	0x4
	edge8l	%l0,	%i4,	%i2
	fnot1s	%f30,	%f29
	tcs	%icc,	0x6
	bcc,a,pt	%xcc,	loop_1837
	tneg	%icc,	0x5
	subc	%l2,	0x1ECC,	%g1
	addcc	%o3,	0x00BE,	%i5
loop_1837:
	brnz,a	%i7,	loop_1838
	fmovs	%f11,	%f21
	tg	%xcc,	0x1
	xor	%g5,	%o4,	%g2
loop_1838:
	fxnor	%f20,	%f0,	%f26
	fmovrdlez	%l4,	%f22,	%f14
	fpack16	%f22,	%f1
	xor	%o1,	0x14CB,	%l5
	and	%o6,	0x0204,	%l1
	orncc	%l6,	0x06CB,	%g6
	movleu	%icc,	%g4,	%g7
	edge16l	%o0,	%g3,	%i3
	fabss	%f21,	%f22
	tvs	%icc,	0x3
	sth	%i6,	[%l7 + 0x70]
	fbg,a	%fcc3,	loop_1839
	udivcc	%l3,	0x1958,	%o2
	srax	%i0,	%o7,	%o5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x0c,	%l0,	%i1
loop_1839:
	sdivx	%i4,	0x0D39,	%l2
	fmovse	%xcc,	%f5,	%f25
	fmuld8sux16	%f25,	%f6,	%f18
	bne,a,pn	%xcc,	loop_1840
	tl	%icc,	0x5
	swap	[%l7 + 0x38],	%i2
	array8	%g1,	%i5,	%o3
loop_1840:
	fnot2	%f8,	%f18
	fbg	%fcc1,	loop_1841
	movre	%g5,	%i7,	%o4
	movle	%xcc,	%l4,	%g2
	ba	%icc,	loop_1842
loop_1841:
	movne	%icc,	%l5,	%o1
	movre	%o6,	%l6,	%l1
	stw	%g4,	[%l7 + 0x64]
loop_1842:
	fbo,a	%fcc3,	loop_1843
	or	%g7,	0x10A3,	%g6
	edge32l	%g3,	%i3,	%o0
	addcc	%i6,	%l3,	%o2
loop_1843:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x59] %asi,	%i0
	set	0x40, %o6
	ldxa	[%l7 + %o6] 0x89,	%o7
	fbe,a	%fcc0,	loop_1844
	edge32l	%l0,	%o5,	%i4
	udivx	%l2,	0x1F64,	%i2
	sdivcc	%i1,	0x12D5,	%g1
loop_1844:
	fands	%f21,	%f26,	%f0
	edge8l	%i5,	%o3,	%i7
	mulx	%o4,	0x00BA,	%g5
	addcc	%g2,	0x0636,	%l5
	lduw	[%l7 + 0x4C],	%o1
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movre	%o6,	0x385,	%l6
	std	%f26,	[%l7 + 0x10]
	movrne	%l4,	%g4,	%l1
	tvc	%icc,	0x3
	sll	%g6,	0x06,	%g7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	sll	%g3,	0x0D,	%o0
	fmovrsgez	%i6,	%f2,	%f14
	movrne	%o2,	%l3,	%i0
	membar	0x1F
	fbue	%fcc1,	loop_1845
	nop
	setx	0x8776EB6A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x72310D45,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f22,	%f21
	movrgz	%o7,	%l0,	%i4
	fbu	%fcc0,	loop_1846
loop_1845:
	tge	%xcc,	0x4
	tvs	%icc,	0x0
	movcc	%xcc,	%l2,	%o5
loop_1846:
	tn	%icc,	0x1
	nop
	setx	loop_1847,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%icc,	0x5
	popc	0x04AB,	%i1
	and	%i2,	%i5,	%g1
loop_1847:
	movge	%icc,	%o3,	%o4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	movrlez	%g5,	0x2F1,	%l5
	taddcc	%g2,	%o6,	%l6
	movvs	%xcc,	%l4,	%o1
	subcc	%l1,	0x146B,	%g4
	bg	loop_1848
	subcc	%g7,	0x15F6,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x14, %o1
	stwa	%g3,	[%l7 + %o1] 0x11
loop_1848:
	and	%o0,	0x15B2,	%i3
	brgz,a	%o2,	loop_1849
	tvc	%xcc,	0x7
	brlz	%i6,	loop_1850
	fpadd16s	%f23,	%f13,	%f20
loop_1849:
	nop
	setx	loop_1851,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umulcc	%i0,	0x052C,	%o7
loop_1850:
	srax	%l3,	%i4,	%l0
	xorcc	%o5,	0x051A,	%l2
loop_1851:
	lduh	[%l7 + 0x70],	%i1
	brnz,a	%i2,	loop_1852
	bge	%icc,	loop_1853
	fpadd32s	%f20,	%f20,	%f6
	bvs,pt	%icc,	loop_1854
loop_1852:
	std	%f30,	[%l7 + 0x18]
loop_1853:
	movl	%xcc,	%i5,	%o3
	udiv	%g1,	0x1954,	%i7
loop_1854:
	fbe,a	%fcc1,	loop_1855
	tsubcctv	%o4,	%g5,	%g2
	fcmple16	%f22,	%f18,	%l5
	movn	%icc,	%o6,	%l4
loop_1855:
	tgu	%xcc,	0x2
	movle	%xcc,	%o1,	%l6
	ldx	[%l7 + 0x50],	%l1
	edge16ln	%g7,	%g4,	%g6
	tsubcctv	%o0,	%g3,	%i3
	movrne	%i6,	0x0B2,	%i0
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%o2
	xnor	%o7,	%i4,	%l0
	xor	%o5,	0x1EAA,	%l3
	tsubcc	%l2,	0x1F58,	%i2
	sdivcc	%i5,	0x186D,	%i1
	sllx	%g1,	0x17,	%o3
	ldsb	[%l7 + 0x48],	%o4
	movle	%icc,	%g5,	%i7
	smulcc	%g2,	%o6,	%l4
	tl	%icc,	0x5
	sub	%o1,	0x1C7B,	%l5
	wr	%g0,	0x0c,	%asi
	stha	%l6,	[%l7 + 0x7A] %asi
	fandnot1	%f8,	%f28,	%f24
	andncc	%l1,	%g7,	%g4
	fnor	%f14,	%f28,	%f0
	subc	%o0,	%g3,	%g6
	set	0x38, %o2
	sta	%f26,	[%l7 + %o2] 0x19
	set	0x8, %i5
	ldxa	[%g0 + %i5] 0x4f,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%i3,	%i0
	fxnors	%f23,	%f17,	%f29
	set	0x73, %l5
	ldsba	[%l7 + %l5] 0x11,	%o2
	fcmpeq32	%f6,	%f0,	%i4
	fmovsn	%icc,	%f27,	%f9
	set	0x10, %g1
	sta	%f11,	[%l7 + %g1] 0x18
	movpos	%icc,	%o7,	%l0
	edge32ln	%o5,	%l3,	%l2
	lduh	[%l7 + 0x4E],	%i2
	tpos	%xcc,	0x4
	sllx	%i1,	%g1,	%i5
	fandnot1	%f2,	%f18,	%f4
	alignaddr	%o3,	%g5,	%i7
	edge32l	%o4,	%g2,	%o6
	movne	%xcc,	%o1,	%l5
	movre	%l6,	%l1,	%l4
	srax	%g4,	%o0,	%g3
	udiv	%g7,	0x0374,	%i6
	smulcc	%i3,	%g6,	%i0
	addccc	%o2,	%i4,	%l0
	ldd	[%l7 + 0x70],	%o4
	srlx	%o7,	0x01,	%l3
	udiv	%i2,	0x071D,	%l2
	fbe,a	%fcc3,	loop_1856
	addcc	%g1,	0x014C,	%i5
	fmovspos	%xcc,	%f10,	%f31
	ldd	[%l7 + 0x50],	%f28
loop_1856:
	membar	0x76
	nop
	set	0x74, %o7
	lduw	[%l7 + %o7],	%i1
	nop
	fitos	%f14,	%f19
	fstox	%f19,	%f30
	fxtos	%f30,	%f29
	edge32ln	%g5,	%o3,	%o4
	sir	0x1432
	move	%icc,	%g2,	%i7
	sdiv	%o1,	0x0724,	%o6
	tl	%icc,	0x3
	movge	%icc,	%l5,	%l1
	alignaddr	%l4,	%g4,	%o0
	movrlez	%l6,	0x23B,	%g3
	umulcc	%i6,	0x0789,	%i3
	mulscc	%g6,	%g7,	%i0
	smulcc	%i4,	0x19E9,	%l0
	add	%o2,	%o7,	%l3
	ld	[%l7 + 0x2C],	%f1
	fmovde	%icc,	%f31,	%f5
	xnor	%o5,	%i2,	%g1
	sdiv	%i5,	0x0F2A,	%l2
	tpos	%icc,	0x1
	orcc	%i1,	0x0F5F,	%o3
	alignaddrl	%o4,	%g5,	%i7
	array32	%g2,	%o1,	%l5
	ldstub	[%l7 + 0x63],	%o6
	smul	%l4,	%l1,	%g4
	movrlz	%l6,	0x094,	%o0
	nop
	set	0x58, %i3
	ldub	[%l7 + %i3],	%i6
	ble,a	%icc,	loop_1857
	fpadd16s	%f0,	%f0,	%f5
	move	%icc,	%i3,	%g6
	sth	%g3,	[%l7 + 0x6C]
loop_1857:
	fmovdne	%xcc,	%f27,	%f0
	orncc	%i0,	%i4,	%g7
	movpos	%xcc,	%o2,	%l0
	te	%icc,	0x1
	fbule,a	%fcc2,	loop_1858
	sra	%l3,	0x11,	%o7
	mulscc	%i2,	0x1DEB,	%g1
	fmovdpos	%icc,	%f9,	%f12
loop_1858:
	nop
	set	0x56, %l1
	ldsha	[%l7 + %l1] 0x18,	%i5
	srax	%o5,	%l2,	%i1
	faligndata	%f20,	%f10,	%f18
	movge	%xcc,	%o4,	%g5
	movre	%o3,	%i7,	%g2
	tl	%xcc,	0x6
	nop
	fitos	%f0,	%f5
	fstox	%f5,	%f14
	fxtos	%f14,	%f25
	fbne,a	%fcc1,	loop_1859
	fbl,a	%fcc3,	loop_1860
	sra	%o1,	%o6,	%l5
	mulscc	%l4,	%l1,	%g4
loop_1859:
	nop
	set	0x20, %i2
	ldsb	[%l7 + %i2],	%l6
loop_1860:
	tvs	%xcc,	0x4
	fpadd32s	%f16,	%f19,	%f30
	wr	%g0,	0x80,	%asi
	sta	%f22,	[%l7 + 0x64] %asi
	ta	%icc,	0x0
	tne	%icc,	0x5
	mova	%icc,	%o0,	%i6
	bn	loop_1861
	bgu,a	%icc,	loop_1862
	movl	%xcc,	%i3,	%g3
	be,pn	%xcc,	loop_1863
loop_1861:
	fcmpeq32	%f28,	%f0,	%g6
loop_1862:
	sdivx	%i4,	0x1FCC,	%g7
	nop
	setx	loop_1864,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1863:
	stx	%o2,	[%l7 + 0x68]
	addccc	%l0,	0x1584,	%l3
	prefetch	[%l7 + 0x10],	 0x3
loop_1864:
	array32	%o7,	%i2,	%i0
	subc	%g1,	%o5,	%l2
	fxor	%f22,	%f22,	%f26
	fpadd32	%f4,	%f12,	%f28
	sethi	0x0F04,	%i5
	or	%i1,	%g5,	%o4
	stbar
	tcs	%xcc,	0x6
	bge,a,pn	%xcc,	loop_1865
	movrlez	%o3,	0x37D,	%g2
	movne	%icc,	%o1,	%i7
	mulx	%l5,	%o6,	%l4
loop_1865:
	array32	%g4,	%l1,	%l6
	subcc	%i6,	0x15DD,	%o0
	movrlz	%g3,	0x197,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i3,	%g7,	%i4
	tcc	%xcc,	0x2
	movleu	%icc,	%l0,	%l3
	membar	0x74
	smulcc	%o2,	%o7,	%i2
	sllx	%i0,	0x1C,	%o5
	st	%f14,	[%l7 + 0x2C]
	sllx	%l2,	%i5,	%g1
	addc	%i1,	%o4,	%g5
	fmuld8sux16	%f18,	%f7,	%f12
	ldx	[%l7 + 0x10],	%o3
	tleu	%xcc,	0x1
	edge8n	%o1,	%g2,	%l5
	edge8n	%o6,	%i7,	%l4
	wr	%g0,	0xe2,	%asi
	stwa	%l1,	[%l7 + 0x40] %asi
	membar	#Sync
	mova	%icc,	%g4,	%l6
	movrlez	%i6,	0x031,	%o0
	sdivcc	%g3,	0x1D52,	%g6
	andn	%g7,	0x0B25,	%i4
	fmovrsgz	%i3,	%f28,	%f8
	udivx	%l0,	0x0C38,	%o2
	sra	%o7,	0x16,	%i2
	xnor	%l3,	%i0,	%l2
	xnorcc	%i5,	0x02A5,	%g1
	ldsw	[%l7 + 0x1C],	%i1
	addccc	%o4,	0x0CF1,	%g5
	movrgez	%o3,	0x25C,	%o5
	movrne	%o1,	%g2,	%l5
	fmovsleu	%icc,	%f5,	%f15
	set	0x65, %l4
	ldsba	[%l7 + %l4] 0x89,	%i7
	tvc	%xcc,	0x4
	xorcc	%o6,	%l1,	%g4
	edge8	%l6,	%l4,	%o0
	srax	%g3,	%i6,	%g6
	movre	%i4,	0x237,	%i3
	movgu	%icc,	%g7,	%o2
	popc	%l0,	%i2
	sub	%l3,	%o7,	%l2
	fnegs	%f5,	%f2
	fbg,a	%fcc1,	loop_1866
	fmovdg	%icc,	%f20,	%f9
	srl	%i0,	0x03,	%i5
	sllx	%g1,	%i1,	%o4
loop_1866:
	subccc	%g5,	%o3,	%o1
	movrlz	%g2,	0x3EA,	%o5
	sub	%i7,	%l5,	%o6
	fone	%f16
	sdivx	%g4,	0x1854,	%l1
	movrne	%l4,	0x0A2,	%o0
	subcc	%g3,	%l6,	%g6
	fbl,a	%fcc2,	loop_1867
	faligndata	%f0,	%f30,	%f30
	ba,pt	%icc,	loop_1868
	movvc	%icc,	%i6,	%i3
loop_1867:
	fba,a	%fcc1,	loop_1869
	orcc	%g7,	%o2,	%l0
loop_1868:
	fpack32	%f24,	%f16,	%f20
	edge16l	%i2,	%l3,	%o7
loop_1869:
	bvs,pt	%icc,	loop_1870
	fbo,a	%fcc1,	loop_1871
	edge32n	%i4,	%l2,	%i0
	smul	%g1,	%i1,	%i5
loop_1870:
	fbue,a	%fcc1,	loop_1872
loop_1871:
	andn	%g5,	0x00B9,	%o3
	tsubcc	%o4,	%g2,	%o5
	xorcc	%o1,	%l5,	%i7
loop_1872:
	bshuffle	%f8,	%f30,	%f8
	nop
	setx	loop_1873,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_1874,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%o6,	%l1,	%g4
	xor	%l4,	0x0035,	%g3
loop_1873:
	edge32l	%l6,	%g6,	%o0
loop_1874:
	fmovdg	%xcc,	%f29,	%f21
	fpsub16	%f28,	%f24,	%f16
	fmovdcc	%icc,	%f15,	%f2
	orn	%i3,	0x1280,	%g7
	tcc	%xcc,	0x5
	fmovrdgz	%o2,	%f8,	%f12
	fmovrsgz	%i6,	%f17,	%f0
	sir	0x1AA3
	brz,a	%i2,	loop_1875
	movvs	%icc,	%l0,	%o7
	smul	%i4,	0x06CA,	%l3
	nop
	fitos	%f0,	%f23
	fstoi	%f23,	%f1
loop_1875:
	fmovrsgez	%l2,	%f22,	%f16
	ldstub	[%l7 + 0x2B],	%i0
	alignaddr	%g1,	%i1,	%i5
	brlez	%o3,	loop_1876
	fmovrde	%o4,	%f26,	%f30
	movl	%icc,	%g5,	%g2
	mulscc	%o1,	0x05CC,	%o5
loop_1876:
	sub	%i7,	0x0F3D,	%o6
	tsubcc	%l5,	0x1EF3,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l4,	%l1
	movleu	%icc,	%l6,	%g6
	move	%icc,	%g3,	%o0
	tneg	%icc,	0x7
	movgu	%xcc,	%g7,	%o2
	brgz	%i3,	loop_1877
	edge8n	%i6,	%i2,	%l0
	nop
	setx	0x43B6B088C5730BDF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF57BDC0039CAF64A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f0,	%f28
	ldsw	[%l7 + 0x70],	%o7
loop_1877:
	nop
	set	0x31, %o0
	lduba	[%l7 + %o0] 0x04,	%i4
	fpack16	%f8,	%f22
	set	0x7C, %o5
	ldswa	[%l7 + %o5] 0x18,	%l2
	fmovs	%f10,	%f30
	bcc,a	%icc,	loop_1878
	sra	%i0,	%g1,	%i1
	movleu	%icc,	%i5,	%o3
	fone	%f16
loop_1878:
	movre	%o4,	0x340,	%l3
	nop
	setx	0xF99D4CCF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f21
	fbue	%fcc1,	loop_1879
	membar	0x26
	tn	%icc,	0x0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
loop_1879:
	alignaddr	%o1,	%o5,	%g5
	std	%f4,	[%l7 + 0x68]
	fornot2	%f18,	%f6,	%f26
	te	%icc,	0x4
	fxnor	%f22,	%f10,	%f0
	sir	0x0991
	move	%icc,	%o6,	%l5
	sub	%i7,	0x131B,	%g4
	array32	%l1,	%l4,	%g6
	fsrc2s	%f4,	%f9
	movcc	%xcc,	%g3,	%o0
	bg,a,pt	%icc,	loop_1880
	fpsub16s	%f19,	%f18,	%f5
	tvc	%xcc,	0x0
	ldd	[%l7 + 0x68],	%i6
loop_1880:
	popc	0x08CC,	%g7
	movvc	%icc,	%o2,	%i6
	nop
	setx	0x62461A5F0F07AD03,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x878C72ED7A822BE8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f28,	%f22
	movgu	%icc,	%i2,	%l0
	nop
	set	0x70, %l3
	std	%f10,	[%l7 + %l3]
	tne	%icc,	0x1
	bshuffle	%f14,	%f0,	%f28
	srlx	%o7,	0x06,	%i3
	sub	%l2,	0x0E9D,	%i4
	sdivcc	%g1,	0x1EB3,	%i1
	tpos	%icc,	0x0
	addcc	%i5,	%i0,	%o4
	tcc	%icc,	0x1
	sllx	%o3,	0x0D,	%l3
	stw	%g2,	[%l7 + 0x70]
	tl	%xcc,	0x4
	fpackfix	%f8,	%f25
	nop
	setx	0x1E9AF7C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x63CFAB5A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f12,	%f22
	orncc	%o5,	%o1,	%g5
	tle	%icc,	0x4
	fbn	%fcc2,	loop_1881
	movne	%icc,	%l5,	%o6
	fble,a	%fcc3,	loop_1882
	tneg	%icc,	0x1
loop_1881:
	fbne,a	%fcc3,	loop_1883
	mulscc	%i7,	0x1E65,	%l1
loop_1882:
	ldd	[%l7 + 0x28],	%l4
	tn	%icc,	0x3
loop_1883:
	fcmple32	%f12,	%f26,	%g6
	mulscc	%g4,	0x0B1C,	%g3
	xor	%l6,	%g7,	%o0
	fnot1	%f26,	%f14
	brnz,a	%i6,	loop_1884
	nop
	setx	0x5E6569E3705B1FFD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o2,	0x25D,	%i2
loop_1884:
	sir	0x0002
	popc	%o7,	%i3
	or	%l2,	%l0,	%i4
	fmovdgu	%icc,	%f6,	%f13
	fmovrdgez	%i1,	%f2,	%f26
	fmuld8sux16	%f4,	%f5,	%f30
	sdiv	%i5,	0x0E55,	%g1
	or	%o4,	0x0A24,	%i0
	orcc	%l3,	%o3,	%o5
	umul	%o1,	0x1DDD,	%g2
	movpos	%xcc,	%l5,	%o6
	fxnor	%f22,	%f6,	%f28
	movvc	%icc,	%g5,	%i7
	xnor	%l4,	%g6,	%g4
	movgu	%icc,	%l1,	%g3
	tl	%xcc,	0x1
	edge16	%l6,	%g7,	%i6
	popc	%o0,	%o2
	movgu	%icc,	%i2,	%i3
	add	%l2,	0x0AD1,	%o7
	subccc	%l0,	%i1,	%i4
	alignaddrl	%i5,	%g1,	%o4
	udiv	%l3,	0x0DEA,	%i0
	bvc	%xcc,	loop_1885
	subcc	%o3,	%o5,	%g2
	udivx	%o1,	0x074F,	%o6
	sllx	%g5,	%i7,	%l4
loop_1885:
	orncc	%g6,	%l5,	%l1
	fnor	%f14,	%f14,	%f8
	mulscc	%g3,	%l6,	%g4
	movl	%xcc,	%g7,	%i6
	te	%icc,	0x1
	orncc	%o2,	%i2,	%i3
	tleu	%xcc,	0x3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] %asi,	%l2,	%o7
	or	%l0,	%o0,	%i1
	subc	%i4,	%g1,	%o4
	fbul	%fcc0,	loop_1886
	fandnot1s	%f24,	%f8,	%f0
	nop
	setx	0x2A925C2E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x79133C6F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f11,	%f1
	sll	%i5,	%l3,	%o3
loop_1886:
	edge16n	%i0,	%g2,	%o5
	smulcc	%o6,	0x1974,	%g5
	nop
	set	0x12, %i4
	ldsh	[%l7 + %i4],	%o1
	orn	%l4,	0x1CFC,	%g6
	xor	%l5,	0x0E74,	%l1
	smul	%i7,	%g3,	%g4
	nop
	fitod	%f10,	%f6
	fdtoi	%f6,	%f18
	movrne	%g7,	0x0D2,	%i6
	edge8	%o2,	%i2,	%l6
	ldsb	[%l7 + 0x66],	%l2
	andncc	%o7,	%l0,	%i3
	umul	%o0,	0x1326,	%i4
	bpos,pn	%xcc,	loop_1887
	movcc	%xcc,	%i1,	%o4
	fxors	%f28,	%f26,	%f9
	andcc	%g1,	%l3,	%o3
loop_1887:
	mulx	%i5,	0x091D,	%g2
	edge16l	%i0,	%o6,	%g5
	fandnot1s	%f5,	%f27,	%f10
	tcs	%xcc,	0x3
	fmovsa	%xcc,	%f29,	%f1
	umulcc	%o1,	%l4,	%g6
	fbule,a	%fcc3,	loop_1888
	mulscc	%l5,	0x1C60,	%o5
	mova	%xcc,	%i7,	%l1
	sdivcc	%g3,	0x1246,	%g4
loop_1888:
	orn	%g7,	%o2,	%i6
	movrlez	%i2,	0x08C,	%l6
	srl	%o7,	0x18,	%l2
	fbg	%fcc3,	loop_1889
	add	%i3,	%l0,	%i4
	subc	%i1,	%o0,	%g1
	movge	%xcc,	%l3,	%o3
loop_1889:
	mulx	%i5,	%g2,	%i0
	fornot1s	%f4,	%f22,	%f22
	movrlz	%o6,	0x1EC,	%o4
	and	%g5,	%l4,	%g6
	movpos	%xcc,	%l5,	%o5
	nop
	setx	0xBC231D48F046E9A5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	edge16ln	%o1,	%l1,	%g3
	movleu	%icc,	%i7,	%g7
	addc	%g4,	0x1C8B,	%o2
	orn	%i2,	0x0AE5,	%l6
	tsubcc	%o7,	%i6,	%i3
	fmovsle	%xcc,	%f19,	%f27
	array8	%l0,	%i4,	%l2
	ldx	[%l7 + 0x50],	%o0
	sdivx	%g1,	0x1E13,	%l3
	fbul,a	%fcc3,	loop_1890
	fpmerge	%f11,	%f23,	%f0
	fbule	%fcc1,	loop_1891
	orncc	%o3,	0x17AC,	%i1
loop_1890:
	fbne	%fcc2,	loop_1892
	addccc	%i5,	0x1AD2,	%g2
loop_1891:
	smul	%o6,	0x0F3E,	%i0
	fmovs	%f23,	%f22
loop_1892:
	nop
	setx	0xC7164DEB726AD9B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xDEB242A87DF28427,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f12,	%f30
	movl	%xcc,	%g5,	%l4
	tsubcctv	%g6,	%o4,	%o5
	movge	%icc,	%l5,	%l1
	edge8n	%g3,	%o1,	%i7
	subccc	%g7,	0x0E80,	%o2
	array8	%g4,	%i2,	%o7
	set	0x60, %g4
	stwa	%l6,	[%l7 + %g4] 0x2a
	membar	#Sync
	fbu,a	%fcc3,	loop_1893
	faligndata	%f26,	%f12,	%f10
	fornot2	%f16,	%f14,	%f14
	ba,a,pt	%xcc,	loop_1894
loop_1893:
	stb	%i3,	[%l7 + 0x21]
	fnot1s	%f26,	%f18
	fpadd32s	%f20,	%f3,	%f26
loop_1894:
	xnor	%i6,	%l0,	%l2
	addcc	%i4,	0x1DB1,	%o0
	move	%xcc,	%l3,	%g1
	sra	%o3,	0x1B,	%i1
	andn	%g2,	%o6,	%i5
	tsubcc	%g5,	0x0AD6,	%i0
	movvc	%icc,	%l4,	%g6
	movgu	%xcc,	%o4,	%o5
	stx	%l5,	[%l7 + 0x18]
	movn	%icc,	%g3,	%o1
	udiv	%i7,	0x01CD,	%g7
	addc	%o2,	0x0AA3,	%g4
	bvc,a	%xcc,	loop_1895
	srax	%i2,	0x1E,	%l1
	ta	%icc,	0x1
	nop
	setx	0x605CB10E90537132,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_1895:
	movcs	%icc,	%l6,	%i3
	brgez	%i6,	loop_1896
	smul	%o7,	0x02A6,	%l2
	ldx	[%l7 + 0x68],	%i4
	xor	%l0,	%o0,	%l3
loop_1896:
	edge32	%o3,	%g1,	%g2
	brnz,a	%i1,	loop_1897
	fpackfix	%f28,	%f5
	umulcc	%o6,	%i5,	%g5
	edge16	%l4,	%g6,	%o4
loop_1897:
	taddcc	%o5,	%i0,	%l5
	mulx	%o1,	0x0983,	%i7
	fcmpeq16	%f2,	%f12,	%g7
	movrgez	%o2,	0x047,	%g3
	edge32l	%i2,	%l1,	%g4
	fmul8sux16	%f8,	%f10,	%f12
	addccc	%l6,	0x088B,	%i6
	brgz	%o7,	loop_1898
	smul	%l2,	0x141A,	%i3
	array16	%i4,	%l0,	%l3
	tneg	%xcc,	0x0
loop_1898:
	ble,pt	%icc,	loop_1899
	tne	%xcc,	0x0
	fornot1s	%f10,	%f1,	%f27
	sllx	%o0,	0x1A,	%g1
loop_1899:
	bneg,a,pn	%xcc,	loop_1900
	bvs,pt	%icc,	loop_1901
	and	%g2,	0x03A6,	%o3
	sdivx	%o6,	0x1C8E,	%i5
loop_1900:
	addccc	%i1,	%l4,	%g5
loop_1901:
	array16	%o4,	%o5,	%g6
	movne	%icc,	%l5,	%o1
	or	%i7,	0x1BC4,	%g7
	array32	%o2,	%g3,	%i2
	orncc	%i0,	0x1F16,	%g4
	ble,a,pn	%xcc,	loop_1902
	movcc	%xcc,	%l6,	%l1
	set	0x60, %g6
	stxa	%o7,	[%l7 + %g6] 0x22
	membar	#Sync
loop_1902:
	fcmpgt32	%f6,	%f28,	%i6
	bl,pt	%icc,	loop_1903
	movcs	%icc,	%l2,	%i4
	tvc	%xcc,	0x2
	sth	%l0,	[%l7 + 0x1E]
loop_1903:
	nop
	set	0x20, %o3
	prefetcha	[%l7 + %o3] 0x10,	 0x2
	tg	%xcc,	0x3
	umul	%i3,	0x02C9,	%o0
	swap	[%l7 + 0x20],	%g1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x20] %asi,	%g2
	edge32l	%o6,	%o3,	%i1
	subccc	%i5,	0x1963,	%l4
	stx	%o4,	[%l7 + 0x10]
	fmovde	%xcc,	%f22,	%f4
	tvs	%xcc,	0x5
	nop
	setx	0x3DDD3DDFB706FE8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x0F6EEF9A1B7B792B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f26,	%f30
	te	%icc,	0x6
	movrne	%o5,	0x184,	%g5
	stb	%g6,	[%l7 + 0x74]
	movcc	%icc,	%o1,	%l5
	nop
	fitod	%f8,	%f26
	fdtoi	%f26,	%f29
	fbg,a	%fcc3,	loop_1904
	subcc	%g7,	0x1792,	%o2
	set	0x48, %g7
	stxa	%g3,	[%l7 + %g7] 0x89
loop_1904:
	nop
	setx	0x0757537BF078501D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fmovda	%icc,	%f23,	%f3
	call	loop_1905
	pdist	%f24,	%f12,	%f4
	bvs,a	%xcc,	loop_1906
	brlez,a	%i2,	loop_1907
loop_1905:
	subcc	%i7,	0x1A5A,	%g4
	set	0x6A, %o4
	stha	%l6,	[%l7 + %o4] 0x2f
	membar	#Sync
loop_1906:
	fmovdge	%icc,	%f23,	%f3
loop_1907:
	fmovdneg	%icc,	%f9,	%f20
	sdiv	%i0,	0x1E09,	%l1
	edge8	%i6,	%l2,	%i4
	nop
	setx	0x80D6164A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xB5A46BC9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f1,	%f0
	array16	%l0,	%o7,	%i3
	srl	%l3,	0x0E,	%g1
	movrlez	%g2,	%o0,	%o6
	movvc	%xcc,	%i1,	%o3
	fblg	%fcc0,	loop_1908
	mulscc	%l4,	0x030F,	%i5
	fnegd	%f24,	%f12
	movneg	%icc,	%o4,	%o5
loop_1908:
	subccc	%g6,	0x0C01,	%o1
	nop
	fitos	%f3,	%f10
	fexpand	%f9,	%f24
	edge32n	%g5,	%g7,	%o2
	movcs	%icc,	%g3,	%i2
	set	0x34, %g2
	lduwa	[%l7 + %g2] 0x10,	%l5
	add	%g4,	0x058B,	%l6
	bleu	loop_1909
	bshuffle	%f2,	%f22,	%f24
	stx	%i7,	[%l7 + 0x70]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1909:
	mulscc	%l1,	%i6,	%i0
	udivcc	%l2,	0x0A58,	%i4
	array16	%l0,	%i3,	%l3
	xnor	%g1,	%g2,	%o7
	alignaddr	%o0,	%o6,	%o3
	edge16	%l4,	%i5,	%o4
	fabss	%f28,	%f10
	ba	%xcc,	loop_1910
	movge	%xcc,	%i1,	%g6
	edge32	%o1,	%o5,	%g5
	movvs	%icc,	%g7,	%g3
loop_1910:
	movl	%xcc,	%o2,	%l5
	fbul	%fcc3,	loop_1911
	tsubcctv	%g4,	0x0C3E,	%i2
	fcmple32	%f26,	%f24,	%l6
	ba,pt	%icc,	loop_1912
loop_1911:
	mulscc	%i7,	%i6,	%i0
	fmovdcc	%icc,	%f9,	%f10
	fmul8x16	%f17,	%f4,	%f0
loop_1912:
	brlz,a	%l1,	loop_1913
	subcc	%i4,	0x1D96,	%l0
	edge32	%l2,	%l3,	%i3
	set	0x40, %l2
	lda	[%l7 + %l2] 0x0c,	%f6
loop_1913:
	tg	%icc,	0x1
	orncc	%g1,	%g2,	%o0
	nop
	fitos	%f1,	%f28
	fstox	%f28,	%f2
	srl	%o7,	0x0D,	%o6
	fmovrdne	%o3,	%f28,	%f28
	set	0x2A, %i0
	ldsba	[%l7 + %i0] 0x19,	%i5
	fmovrse	%l4,	%f28,	%f31
	ta	%xcc,	0x2
	nop
	setx	loop_1914,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%i1,	%o4,	%g6
	fpack32	%f16,	%f16,	%f16
	fbe,a	%fcc0,	loop_1915
loop_1914:
	sra	%o5,	0x16,	%g5
	brgez	%g7,	loop_1916
	fmovdn	%icc,	%f31,	%f23
loop_1915:
	edge8ln	%o1,	%g3,	%l5
	fbule	%fcc2,	loop_1917
loop_1916:
	addccc	%o2,	%g4,	%l6
	ta	%xcc,	0x6
	nop
	fitos	%f4,	%f20
	fstoi	%f20,	%f12
loop_1917:
	tsubcc	%i2,	%i7,	%i6
	tleu	%xcc,	0x0
	movne	%xcc,	%l1,	%i0
	fbn	%fcc3,	loop_1918
	bvc,a	loop_1919
	fmovsn	%icc,	%f25,	%f20
	fabsd	%f24,	%f2
loop_1918:
	sdivcc	%i4,	0x0C0C,	%l0
loop_1919:
	fsrc2s	%f1,	%f3
	brnz,a	%l2,	loop_1920
	fbo,a	%fcc0,	loop_1921
	addcc	%i3,	0x1828,	%g1
	fnegs	%f21,	%f30
loop_1920:
	bcs,a,pt	%icc,	loop_1922
loop_1921:
	taddcctv	%l3,	%o0,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x1
loop_1922:
	xnor	%o6,	%o7,	%i5
	nop
	setx	0x29A203D5C83792BF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f8
	addccc	%o3,	0x1BFD,	%i1
	taddcc	%o4,	%g6,	%o5
	movrgez	%l4,	%g5,	%o1
	edge16n	%g3,	%g7,	%l5
	udivcc	%o2,	0x1E2E,	%l6
	fbue,a	%fcc3,	loop_1923
	xor	%i2,	0x1DC9,	%i7
	nop
	setx	loop_1924,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvs,pt	%icc,	loop_1925
loop_1923:
	edge32n	%i6,	%g4,	%l1
	fpack32	%f4,	%f18,	%f6
loop_1924:
	sdiv	%i4,	0x14B5,	%l0
loop_1925:
	nop
	fitos	%f2,	%f12
	fstod	%f12,	%f12
	tleu	%icc,	0x7
	movge	%xcc,	%i0,	%i3
	movl	%icc,	%g1,	%l2
	and	%o0,	%l3,	%g2
	tge	%icc,	0x2
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x48] %asi,	%o6
	movre	%i5,	0x02D,	%o7
	movl	%xcc,	%o3,	%i1
	stbar
	sll	%g6,	%o5,	%l4
	edge16ln	%o4,	%o1,	%g5
	umulcc	%g3,	0x0DB4,	%g7
	sra	%o2,	%l6,	%i2
	orncc	%l5,	%i7,	%g4
	and	%l1,	%i4,	%l0
	nop
	fitos	%f28,	%f3
	tle	%icc,	0x3
	array32	%i6,	%i3,	%g1
	tsubcc	%i0,	0x0268,	%l2
	umulcc	%l3,	%g2,	%o0
	ldd	[%l7 + 0x60],	%f30
	fpsub16	%f12,	%f6,	%f4
	sir	0x0DA9
	edge8n	%i5,	%o6,	%o3
	nop
	setx	loop_1926,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%xcc,	0x3
	array32	%o7,	%g6,	%o5
	sir	0x0306
loop_1926:
	tsubcc	%i1,	0x080A,	%o4
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o1
	udiv	%l4,	0x1006,	%g5
	subc	%g3,	0x1A0A,	%o2
	bne,a,pn	%xcc,	loop_1927
	addccc	%l6,	%g7,	%i2
	fands	%f17,	%f20,	%f1
	tcs	%xcc,	0x3
loop_1927:
	fbo,a	%fcc2,	loop_1928
	tvc	%xcc,	0x1
	ld	[%l7 + 0x34],	%f26
	nop
	setx	0x10A00104F024763E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f20
loop_1928:
	fmovrdgez	%i7,	%f6,	%f0
	fmovsl	%xcc,	%f29,	%f24
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x1e,	%f16
	fmovsge	%icc,	%f4,	%f30
	mulx	%g4,	0x1F62,	%l5
	tneg	%icc,	0x4
	smul	%l1,	%i4,	%l0
	nop
	fitod	%f0,	%f12
	fdtos	%f12,	%f20
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i6,	%i3
	fmuld8ulx16	%f6,	%f31,	%f18
	xnorcc	%g1,	%i0,	%l3
	andcc	%g2,	0x1171,	%l2
	and	%o0,	0x08DB,	%o6
	fpadd16s	%f7,	%f4,	%f18
	set	0x54, %g3
	ldswa	[%l7 + %g3] 0x19,	%i5
	movne	%icc,	%o3,	%o7
	fbue,a	%fcc0,	loop_1929
	tg	%xcc,	0x4
	fbg,a	%fcc2,	loop_1930
	edge32ln	%g6,	%o5,	%i1
loop_1929:
	movl	%icc,	%o1,	%o4
	sdivcc	%g5,	0x13B5,	%g3
loop_1930:
	edge32n	%l4,	%l6,	%g7
	alignaddr	%o2,	%i7,	%i2
	bcc,a	%xcc,	loop_1931
	fcmpgt16	%f22,	%f6,	%l5
	fcmple16	%f16,	%f30,	%g4
	tne	%xcc,	0x6
loop_1931:
	nop
	setx loop_1932, %l0, %l1
	jmpl %l1, %l1
	srax	%i4,	0x10,	%i6
	edge32l	%i3,	%g1,	%l0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l3,	%i0
loop_1932:
	orncc	%g2,	0x1CCB,	%o0
	sll	%l2,	0x18,	%o6
	fble,a	%fcc3,	loop_1933
	array32	%o3,	%i5,	%o7
	movvs	%xcc,	%g6,	%i1
	fmovrdne	%o1,	%f12,	%f30
loop_1933:
	tleu	%icc,	0x6
	stw	%o5,	[%l7 + 0x6C]
	and	%g5,	0x0FBE,	%o4
	movvs	%icc,	%g3,	%l6
	fmul8x16	%f14,	%f10,	%f20
	taddcctv	%g7,	0x07BE,	%l4
	andncc	%i7,	%i2,	%l5
	fbn	%fcc0,	loop_1934
	edge8l	%o2,	%l1,	%g4
	bpos	loop_1935
	array8	%i6,	%i3,	%i4
loop_1934:
	nop
	set	0x34, %l0
	lduba	[%l7 + %l0] 0x11,	%g1
loop_1935:
	edge8ln	%l0,	%i0,	%g2
	fnot1	%f18,	%f30
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%l3
	fcmpeq32	%f18,	%f14,	%l2
	fmovde	%xcc,	%f26,	%f13
	array16	%o3,	%o6,	%o7
	andn	%i5,	0x1A36,	%i1
	orcc	%g6,	0x1771,	%o5
	brnz,a	%g5,	loop_1936
	smulcc	%o4,	%o1,	%g3
	tl	%icc,	0x2
	te	%icc,	0x4
loop_1936:
	addcc	%g7,	%l4,	%i7
	fbule,a	%fcc0,	loop_1937
	movneg	%icc,	%i2,	%l5
	fmovdg	%xcc,	%f27,	%f24
	and	%l6,	%o2,	%l1
loop_1937:
	andcc	%g4,	0x0999,	%i6
	fbn	%fcc0,	loop_1938
	popc	%i3,	%g1
	fcmpgt32	%f2,	%f18,	%i4
	fba,a	%fcc2,	loop_1939
loop_1938:
	subcc	%i0,	0x1399,	%l0
	mulx	%g2,	%o0,	%l2
	tle	%xcc,	0x6
loop_1939:
	xor	%o3,	0x1BFE,	%o6
	tl	%icc,	0x1
	tg	%icc,	0x0
	addccc	%o7,	0x0CB5,	%i5
	movpos	%xcc,	%i1,	%g6
	fabsd	%f28,	%f22
	or	%o5,	0x0219,	%g5
	mulx	%l3,	0x01D8,	%o1
	movle	%icc,	%g3,	%o4
	fmovrsgez	%l4,	%f30,	%f31
	fmovrdne	%g7,	%f6,	%f28
	movge	%xcc,	%i7,	%i2
	mova	%icc,	%l5,	%o2
	subc	%l1,	0x1E51,	%g4
	tl	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l6,	0x1CD5,	%i3
	nop
	setx loop_1940, %l0, %l1
	jmpl %l1, %i6
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f20
	fornot2s	%f31,	%f0,	%f22
	sub	%g1,	%i0,	%l0
loop_1940:
	tsubcc	%g2,	%o0,	%i4
	fxnors	%f10,	%f3,	%f1
	tl	%xcc,	0x1
	fornot2s	%f5,	%f20,	%f23
	tsubcc	%o3,	0x0C35,	%l2
	add	%o6,	%o7,	%i5
	array16	%g6,	%i1,	%o5
	addc	%g5,	%l3,	%g3
	fble,a	%fcc2,	loop_1941
	tl	%xcc,	0x4
	mulscc	%o1,	%l4,	%o4
	fmovscc	%icc,	%f0,	%f11
loop_1941:
	nop
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x04,	%g7,	%i7
	nop
	setx	0xA6051C619A2D6213,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x2887DB01BABBAB2E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f2,	%f10
	addc	%i2,	0x129A,	%o2
	fzeros	%f6
	movcc	%icc,	%l1,	%l5
	fmovsl	%xcc,	%f14,	%f11
	fmovsneg	%xcc,	%f0,	%f31
	ldsh	[%l7 + 0x64],	%l6
	andncc	%g4,	%i6,	%g1
	tneg	%icc,	0x7
	tcs	%xcc,	0x3
	movl	%xcc,	%i3,	%l0
	array32	%g2,	%o0,	%i4
	ldstub	[%l7 + 0x75],	%o3
	tvs	%xcc,	0x3
	fbug	%fcc1,	loop_1942
	tpos	%icc,	0x0
	tvc	%icc,	0x2
	faligndata	%f8,	%f18,	%f8
loop_1942:
	tvc	%xcc,	0x1
	edge8ln	%l2,	%i0,	%o7
	brz	%i5,	loop_1943
	tleu	%xcc,	0x6
	ldub	[%l7 + 0x33],	%g6
	fand	%f30,	%f18,	%f10
loop_1943:
	fbug,a	%fcc2,	loop_1944
	ldx	[%l7 + 0x28],	%i1
	movl	%icc,	%o6,	%o5
	mulx	%g5,	%g3,	%l3
loop_1944:
	movrgz	%l4,	%o1,	%g7
	add	%i7,	0x0E58,	%o4
	membar	0x52
	nop
	setx	0x6B36421B32428229,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f10
	addc	%i2,	0x1BDA,	%o2
	movre	%l5,	%l1,	%l6
	edge8ln	%g4,	%g1,	%i6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	brlz,a	%g2,	loop_1945
	tsubcc	%o0,	%i3,	%o3
	sethi	0x0AB0,	%i4
	edge16n	%i0,	%o7,	%i5
loop_1945:
	movcs	%icc,	%g6,	%l2
	be	loop_1946
	edge32ln	%i1,	%o6,	%o5
	set	0x16, %l6
	lduha	[%l7 + %l6] 0x81,	%g5
loop_1946:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x14] %asi,	%g3
	bn	loop_1947
	tcc	%icc,	0x3
	fands	%f6,	%f5,	%f2
	movvc	%icc,	%l4,	%l3
loop_1947:
	ldstub	[%l7 + 0x57],	%o1
	tcs	%xcc,	0x7
	nop
	setx	0xF1F5FF89,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x473A01DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f9,	%f27
	tvc	%icc,	0x5
	set	0x64, %g5
	stba	%i7,	[%l7 + %g5] 0x80
	fxnor	%f18,	%f8,	%f0
	tsubcc	%g7,	0x082D,	%i2
	nop
	setx	0xF04D9D4E,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	prefetch	[%l7 + 0x0C],	 0x3
	fbe	%fcc1,	loop_1948
	taddcctv	%o2,	%l5,	%l1
	edge8	%o4,	%g4,	%g1
	fbule,a	%fcc1,	loop_1949
loop_1948:
	brlez	%i6,	loop_1950
	fornot1s	%f11,	%f20,	%f27
	edge32l	%l0,	%l6,	%o0
loop_1949:
	popc	0x0DD8,	%g2
loop_1950:
	array32	%o3,	%i3,	%i0
	addcc	%o7,	%i4,	%g6
	srax	%l2,	0x13,	%i1
	edge16n	%o6,	%o5,	%g5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x18,	%g3,	%i5
	set	0x18, %i7
	ldstuba	[%l7 + %i7] 0x89,	%l4
	tvs	%xcc,	0x5
	tvs	%xcc,	0x2
	fcmpne16	%f18,	%f10,	%o1
	fmovrdlz	%i7,	%f24,	%f2
	edge8ln	%g7,	%i2,	%l3
	fabss	%f6,	%f31
	nop
	set	0x48, %o6
	ldd	[%l7 + %o6],	%f10
	umulcc	%l5,	0x1622,	%o2
	fbo	%fcc2,	loop_1951
	fsrc1s	%f16,	%f15
	fmovrse	%l1,	%f14,	%f25
	tsubcc	%o4,	0x05F1,	%g1
loop_1951:
	udivx	%g4,	0x15FD,	%i6
	fnor	%f6,	%f10,	%f26
	addc	%l0,	0x15BC,	%o0
	movl	%xcc,	%l6,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	stha	%i3,	[%l7 + 0x5A] %asi
	movge	%icc,	%i0,	%g2
	membar	0x16
	fmovsgu	%xcc,	%f25,	%f3
	array8	%i4,	%o7,	%g6
	orcc	%l2,	0x016A,	%i1
	nop
	fitos	%f1,	%f4
	fstox	%f4,	%f2
	tsubcc	%o5,	0x1B19,	%g5
	bcc	loop_1952
	udivx	%o6,	0x0834,	%i5
	tpos	%xcc,	0x4
	fsrc2s	%f13,	%f21
loop_1952:
	andncc	%l4,	%g3,	%o1
	smulcc	%i7,	%g7,	%l3
	fone	%f20
	set	0x8, %i1
	ldxa	[%g0 + %i1] 0x4f,	%i2
	fcmpgt32	%f4,	%f16,	%o2
	tle	%icc,	0x7
	edge32l	%l5,	%l1,	%g1
	fble,a	%fcc3,	loop_1953
	brlz	%o4,	loop_1954
	movrne	%i6,	%l0,	%g4
	stb	%l6,	[%l7 + 0x74]
loop_1953:
	tcc	%icc,	0x5
loop_1954:
	fandnot1s	%f26,	%f16,	%f7
	movcc	%icc,	%o3,	%i3
	srlx	%i0,	%g2,	%o0
	udiv	%o7,	0x0D7C,	%i4
	addc	%g6,	0x1297,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x7C],	%l2
	sra	%g5,	0x01,	%o6
	fsrc2	%f6,	%f2
	subc	%o5,	0x080F,	%i5
	set	0x48, %o2
	lduwa	[%l7 + %o2] 0x19,	%g3
	andcc	%l4,	%i7,	%g7
	tneg	%icc,	0x6
	te	%icc,	0x7
	popc	0x1003,	%o1
	edge32n	%i2,	%l3,	%l5
	tgu	%icc,	0x7
	fpmerge	%f21,	%f1,	%f14
	xor	%l1,	0x1EA0,	%g1
	movn	%xcc,	%o2,	%i6
	bgu	%xcc,	loop_1955
	tcs	%xcc,	0x0
	edge8	%l0,	%g4,	%o4
	set	0x6A, %o1
	ldsha	[%l7 + %o1] 0x15,	%o3
loop_1955:
	edge32n	%l6,	%i3,	%i0
	edge8	%g2,	%o0,	%o7
	fmovrdlez	%i4,	%f0,	%f24
	movvc	%icc,	%g6,	%l2
	popc	0x1FC3,	%g5
	sethi	0x1F53,	%i1
	add	%o6,	0x0203,	%i5
	ldsb	[%l7 + 0x3F],	%g3
	movge	%icc,	%o5,	%l4
	tpos	%icc,	0x2
	fblg	%fcc3,	loop_1956
	tsubcc	%i7,	0x0C1B,	%g7
	sll	%o1,	0x1F,	%l3
	nop
	setx	loop_1957,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1956:
	tsubcctv	%i2,	0x02B9,	%l1
	fmovscs	%icc,	%f30,	%f0
	fcmpeq32	%f16,	%f8,	%g1
loop_1957:
	smul	%l5,	0x052B,	%o2
	fmovsgu	%icc,	%f20,	%f20
	nop
	fitos	%f9,	%f22
	fstox	%f22,	%f16
	movge	%xcc,	%l0,	%g4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x4A] %asi,	%o4
	fcmpeq32	%f18,	%f0,	%i6
	movcc	%xcc,	%l6,	%o3
	nop
	fitod	%f8,	%f6
	fdtoi	%f6,	%f19
	fmovdneg	%icc,	%f10,	%f26
	popc	0x1823,	%i0
	xorcc	%i3,	%o0,	%o7
	movle	%xcc,	%g2,	%i4
	sethi	0x1604,	%g6
	edge8	%l2,	%i1,	%o6
	add	%g5,	0x0DFF,	%g3
	fornot1s	%f31,	%f29,	%f5
	brnz	%i5,	loop_1958
	sdivcc	%o5,	0x0A75,	%i7
	tge	%xcc,	0x2
	or	%l4,	%o1,	%l3
loop_1958:
	tcc	%xcc,	0x2
	fmovrdlez	%g7,	%f6,	%f20
	fmovdgu	%icc,	%f22,	%f1
	srax	%l1,	0x16,	%g1
	edge32	%l5,	%i2,	%l0
	sir	0x0D92
	set	0x1C, %l5
	lda	[%l7 + %l5] 0x04,	%f25
	array32	%o2,	%o4,	%i6
	fone	%f8
	edge32n	%g4,	%l6,	%o3
	tn	%icc,	0x6
	edge16l	%i3,	%i0,	%o0
	andn	%o7,	%i4,	%g2
	fabsd	%f20,	%f14
	fbl,a	%fcc2,	loop_1959
	tcs	%icc,	0x5
	bg,a	loop_1960
	sllx	%l2,	%g6,	%o6
loop_1959:
	smulcc	%g5,	%i1,	%g3
	movpos	%xcc,	%i5,	%i7
loop_1960:
	sra	%o5,	0x09,	%l4
	ldx	[%l7 + 0x40],	%l3
	movvs	%xcc,	%o1,	%g7
	and	%l1,	0x1C5F,	%g1
	fmovsa	%xcc,	%f31,	%f14
	brz,a	%l5,	loop_1961
	fxnors	%f7,	%f19,	%f23
	fzeros	%f0
	tcc	%icc,	0x0
loop_1961:
	fand	%f28,	%f30,	%f20
	membar	0x00
	sdivx	%l0,	0x1AD2,	%i2
	edge16ln	%o2,	%i6,	%g4
	tne	%xcc,	0x3
	ldd	[%l7 + 0x78],	%f16
	movgu	%icc,	%l6,	%o3
	move	%xcc,	%i3,	%i0
	mulx	%o4,	0x054F,	%o0
	movge	%icc,	%i4,	%o7
	edge32l	%g2,	%g6,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g5,	%o6,	%i1
	fzeros	%f26
	fbul,a	%fcc1,	loop_1962
	bn,a,pn	%xcc,	loop_1963
	nop
	setx	0x5CA51D9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f22
	nop
	setx	0x79C8ABAF4E7A8FC3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2F3EBD805DCC8410,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f26,	%f28
loop_1962:
	ldd	[%l7 + 0x18],	%f18
loop_1963:
	tpos	%icc,	0x4
	ta	%xcc,	0x4
	ldsw	[%l7 + 0x48],	%i5
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
	sra	%g3,	0x09,	%i7
	xor	%o5,	0x1915,	%l4
	brlz,a	%l3,	loop_1965
loop_1964:
	movne	%icc,	%o1,	%g7
	bne	%icc,	loop_1966
	fblg,a	%fcc0,	loop_1967
loop_1965:
	tvs	%xcc,	0x4
	fnegs	%f25,	%f27
loop_1966:
	nop
	wr	%g0,	0x20,	%asi
	stxa	%l1,	[%g0 + 0x8] %asi
loop_1967:
	tcs	%icc,	0x2
	wr	%g0,	0x80,	%asi
	stba	%l5,	[%l7 + 0x54] %asi
	subccc	%g1,	0x1624,	%i2
	andncc	%l0,	%o2,	%g4
	fmovsl	%xcc,	%f2,	%f1
	fornot1s	%f19,	%f1,	%f19
	addcc	%l6,	0x0761,	%o3
	udiv	%i6,	0x118A,	%i0
	addc	%o4,	%i3,	%o0
	fpack32	%f0,	%f30,	%f4
	set	0x1C, %g1
	lda	[%l7 + %g1] 0x80,	%f14
	edge16l	%i4,	%o7,	%g2
	subc	%l2,	0x0584,	%g5
	mulx	%g6,	0x06E2,	%o6
	tg	%xcc,	0x7
	tleu	%icc,	0x3
	srl	%i5,	0x11,	%i1
	addcc	%g3,	0x0DB3,	%i7
	fbge,a	%fcc2,	loop_1968
	fxnor	%f0,	%f28,	%f8
	mulscc	%o5,	0x111D,	%l3
	xor	%l4,	%g7,	%o1
loop_1968:
	nop
	set	0x6C, %i5
	lduba	[%l7 + %i5] 0x88,	%l5
	movn	%icc,	%l1,	%i2
	movvs	%xcc,	%g1,	%l0
	membar	0x09
	bgu,pt	%icc,	loop_1969
	fpadd32	%f16,	%f30,	%f10
	xorcc	%o2,	%l6,	%o3
	fpack32	%f30,	%f24,	%f20
loop_1969:
	bgu,a	loop_1970
	xorcc	%i6,	%g4,	%i0
	nop
	set	0x38, %o7
	std	%f6,	[%l7 + %o7]
	movcc	%icc,	%o4,	%i3
loop_1970:
	fmovdcc	%xcc,	%f16,	%f12
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o0
	tg	%icc,	0x2
	array16	%o7,	%g2,	%l2
	tneg	%icc,	0x6
	andncc	%g5,	%i4,	%o6
	orn	%g6,	%i5,	%i1
	bn,a,pn	%xcc,	loop_1971
	fsrc1s	%f14,	%f18
	movg	%icc,	%i7,	%o5
	bgu,pt	%xcc,	loop_1972
loop_1971:
	fnands	%f4,	%f10,	%f7
	set	0x20, %l1
	sta	%f21,	[%l7 + %l1] 0x15
loop_1972:
	nop
	fitos	%f13,	%f0
	fstox	%f0,	%f30
	movl	%xcc,	%l3,	%g3
	movcc	%icc,	%l4,	%g7
	te	%xcc,	0x6
	nop
	setx	0xA05F7787,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	addccc	%o1,	%l5,	%i2
	addccc	%l1,	%g1,	%o2
	fbug,a	%fcc2,	loop_1973
	andn	%l6,	%l0,	%i6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x18,	%g4,	%o3
loop_1973:
	edge8ln	%i0,	%o4,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o7,	%g2,	%o0
	nop
	set	0x40, %i2
	sth	%g5,	[%l7 + %i2]
	addccc	%i4,	%l2,	%g6
	lduh	[%l7 + 0x5C],	%o6
	popc	0x01B0,	%i5
	sethi	0x052C,	%i7
	nop
	setx	loop_1974,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tg	%xcc,	0x5
	udivx	%o5,	0x0919,	%i1
	xnor	%l3,	%g3,	%l4
loop_1974:
	ble,pn	%icc,	loop_1975
	nop
	setx	0x7E8792B2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x469322F4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f26,	%f0
	sll	%o1,	0x1C,	%l5
	nop
	set	0x40, %i3
	ldsw	[%l7 + %i3],	%i2
loop_1975:
	ldsw	[%l7 + 0x10],	%g7
	pdist	%f18,	%f22,	%f26
	sllx	%l1,	%o2,	%l6
	fornot2	%f10,	%f0,	%f18
	fmovrdlz	%g1,	%f6,	%f20
	sir	0x0118
	membar	0x7B
	fpackfix	%f22,	%f16
	fmovrsgz	%l0,	%f12,	%f23
	andn	%i6,	0x13AA,	%g4
	ld	[%l7 + 0x78],	%f5
	alignaddrl	%o3,	%i0,	%i3
	ldsw	[%l7 + 0x5C],	%o4
	te	%xcc,	0x5
	tl	%xcc,	0x2
	stb	%g2,	[%l7 + 0x50]
	tn	%icc,	0x1
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf9
	membar	#Sync
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x80,	%o7,	%g5
	te	%icc,	0x7
	edge32ln	%o0,	%l2,	%i4
	fand	%f10,	%f0,	%f12
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%g6
	fmuld8sux16	%f6,	%f27,	%f2
	movvs	%icc,	%i5,	%i7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x0c,	%o6,	%i1
	fmovsa	%icc,	%f7,	%f8
	tcc	%xcc,	0x1
	fmovdpos	%icc,	%f3,	%f8
	fpackfix	%f16,	%f20
	movge	%icc,	%o5,	%g3
	sdivcc	%l4,	0x0F9A,	%o1
	smul	%l3,	0x01EA,	%l5
	lduw	[%l7 + 0x1C],	%i2
	and	%g7,	0x1688,	%l1
	mulscc	%o2,	0x0EFE,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	udivcc	%g1,	0x03FB,	%i6
	fmovdl	%icc,	%f28,	%f22
	fble	%fcc1,	loop_1976
	sir	0x051C
	movl	%icc,	%g4,	%o3
	sdivcc	%l0,	0x1EB1,	%i3
loop_1976:
	fnot2s	%f6,	%f5
	tvs	%xcc,	0x2
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc0,	loop_1977
	taddcctv	%o4,	0x0090,	%g2
	sll	%g5,	0x0D,	%o0
	movg	%xcc,	%l2,	%o7
loop_1977:
	nop
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i4
	addc	%i5,	0x03CF,	%i7
	edge8l	%g6,	%o6,	%o5
	udivcc	%g3,	0x0851,	%l4
	fbo	%fcc0,	loop_1978
	movg	%xcc,	%i1,	%o1
	sra	%l5,	0x18,	%l3
	xor	%g7,	%i2,	%l1
loop_1978:
	movrgez	%l6,	0x04B,	%o2
	movge	%xcc,	%i6,	%g1
	fmovdvc	%icc,	%f6,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg	loop_1979
	fxor	%f20,	%f28,	%f24
	movvs	%xcc,	%g4,	%o3
	andn	%i3,	%i0,	%o4
loop_1979:
	movrgz	%g2,	%g5,	%o0
	or	%l2,	%l0,	%o7
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i4
	nop
	setx	0x0995D44BAD7A7200,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x303BA555EA903D8B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f4,	%f0
	mulx	%i5,	0x11A2,	%i7
	nop
	setx loop_1980, %l0, %l1
	jmpl %l1, %o6
	tvc	%xcc,	0x5
	edge8n	%o5,	%g6,	%l4
	movneg	%icc,	%i1,	%o1
loop_1980:
	movn	%xcc,	%g3,	%l5
	orcc	%g7,	0x1B4D,	%i2
	edge32ln	%l1,	%l3,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l6,	%i6,	%g4
	set	0x41, %o0
	ldsba	[%l7 + %o0] 0x81,	%g1
	movrne	%o3,	0x3D0,	%i3
	fmovdgu	%icc,	%f6,	%f18
	movvs	%xcc,	%i0,	%g2
	nop
	setx	0x8BA8FCFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f18
	fmovspos	%icc,	%f29,	%f5
	tcs	%xcc,	0x2
	movcc	%xcc,	%g5,	%o4
	movvs	%icc,	%l2,	%l0
	ldsb	[%l7 + 0x32],	%o0
	taddcc	%i4,	0x18B4,	%o7
	tvc	%xcc,	0x2
	movre	%i7,	%o6,	%o5
	nop
	fitos	%f4,	%f3
	fstox	%f3,	%f14
	fxtos	%f14,	%f6
	sethi	0x18D8,	%i5
	fsrc2	%f24,	%f0
	xnorcc	%l4,	0x18BC,	%i1
	fbg,a	%fcc3,	loop_1981
	and	%g6,	0x16C7,	%o1
	umul	%g3,	%g7,	%l5
	sllx	%l1,	%l3,	%o2
loop_1981:
	edge8	%i2,	%i6,	%l6
	umulcc	%g1,	0x0DF5,	%o3
	array32	%i3,	%g4,	%g2
	fmul8sux16	%f22,	%f8,	%f12
	sub	%i0,	0x18BC,	%o4
	fornot1	%f2,	%f8,	%f26
	bcc,a	loop_1982
	tg	%xcc,	0x3
	fmovrsgez	%g5,	%f5,	%f9
	nop
	setx	loop_1983,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1982:
	edge8	%l0,	%l2,	%o0
	bcs	loop_1984
	fpack32	%f16,	%f22,	%f8
loop_1983:
	movrne	%i4,	%o7,	%i7
	edge32l	%o6,	%i5,	%o5
loop_1984:
	fmovdvc	%xcc,	%f11,	%f26
	tg	%icc,	0x1
	mova	%xcc,	%l4,	%g6
	or	%o1,	%i1,	%g3
	wr	%g0,	0x89,	%asi
	stwa	%l5,	[%l7 + 0x30] %asi
	array8	%l1,	%l3,	%o2
	movrne	%g7,	%i2,	%i6
	andcc	%g1,	0x1351,	%l6
	nop
	setx loop_1985, %l0, %l1
	jmpl %l1, %i3
	stb	%o3,	[%l7 + 0x6D]
	edge16n	%g4,	%g2,	%i0
	fbule,a	%fcc2,	loop_1986
loop_1985:
	nop
	setx	0xF04A87F5,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	brz,a	%o4,	loop_1987
	movrgez	%g5,	%l2,	%o0
loop_1986:
	movre	%l0,	%o7,	%i4
	orncc	%o6,	%i7,	%o5
loop_1987:
	prefetch	[%l7 + 0x10],	 0x2
	bneg,a,pn	%icc,	loop_1988
	edge32n	%l4,	%g6,	%i5
	movl	%icc,	%o1,	%g3
	fmovse	%xcc,	%f19,	%f5
loop_1988:
	bneg,pt	%xcc,	loop_1989
	nop
	setx	loop_1990,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%l5,	0x0BB4,	%l1
	be,a	loop_1991
loop_1989:
	tgu	%xcc,	0x4
loop_1990:
	fmovrslez	%l3,	%f2,	%f5
	edge8ln	%i1,	%g7,	%o2
loop_1991:
	subccc	%i6,	0x0838,	%g1
	move	%xcc,	%i2,	%l6
	nop
	setx	0xC06741F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	edge16ln	%i3,	%o3,	%g2
	movgu	%xcc,	%g4,	%i0
	brgez	%o4,	loop_1992
	xor	%g5,	%l2,	%o0
	edge32	%o7,	%l0,	%o6
	move	%icc,	%i7,	%i4
loop_1992:
	addcc	%o5,	%g6,	%l4
	srlx	%i5,	0x0E,	%g3
	movg	%xcc,	%l5,	%l1
	fbu	%fcc1,	loop_1993
	movpos	%icc,	%o1,	%i1
	udivx	%g7,	0x0A66,	%l3
	movcc	%icc,	%o2,	%i6
loop_1993:
	fxors	%f9,	%f3,	%f19
	sdivx	%g1,	0x16A6,	%l6
	edge32	%i2,	%o3,	%i3
	bcc	%icc,	loop_1994
	sdivcc	%g4,	0x0C5D,	%i0
	ldsb	[%l7 + 0x18],	%o4
	brlz	%g5,	loop_1995
loop_1994:
	tsubcc	%g2,	%o0,	%o7
	edge16	%l2,	%o6,	%l0
	move	%xcc,	%i7,	%o5
loop_1995:
	alignaddr	%i4,	%l4,	%i5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x0c,	%f16
	ta	%icc,	0x3
	fblg	%fcc3,	loop_1996
	fmovrsgz	%g6,	%f8,	%f9
	subcc	%l5,	0x11B0,	%g3
	ldsh	[%l7 + 0x1E],	%o1
loop_1996:
	bn,a	loop_1997
	srlx	%i1,	%l1,	%g7
	ta	%xcc,	0x1
	subcc	%o2,	0x09CC,	%l3
loop_1997:
	nop
	setx	0xDBD6CC4E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f10
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x22,	%i6
	movcs	%icc,	%g1,	%i2
	tcs	%xcc,	0x7
	umulcc	%l6,	0x02BA,	%o3
	movre	%g4,	%i0,	%o4
	tsubcc	%i3,	%g5,	%o0
	udivcc	%g2,	0x04F2,	%l2
	taddcctv	%o6,	%l0,	%o7
	tcc	%xcc,	0x1
	subcc	%i7,	0x0BFB,	%i4
	tcs	%icc,	0x6
	ldsb	[%l7 + 0x3D],	%o5
	smul	%i5,	0x1A97,	%l4
	fxnors	%f11,	%f4,	%f25
	movre	%l5,	%g3,	%o1
	fbug,a	%fcc1,	loop_1998
	fandnot2s	%f14,	%f20,	%f22
	sdiv	%g6,	0x0D54,	%l1
	brlez	%g7,	loop_1999
loop_1998:
	srl	%o2,	%l3,	%i1
	fbule	%fcc0,	loop_2000
	st	%f23,	[%l7 + 0x1C]
loop_1999:
	bgu	loop_2001
	movg	%icc,	%i6,	%g1
loop_2000:
	brgez	%l6,	loop_2002
	fmovsleu	%xcc,	%f2,	%f12
loop_2001:
	orncc	%i2,	0x1DFE,	%o3
	tl	%xcc,	0x0
loop_2002:
	ldd	[%l7 + 0x10],	%i0
	move	%xcc,	%g4,	%i3
	smulcc	%o4,	0x1C42,	%g5
	fmovsg	%icc,	%f0,	%f27
	movg	%icc,	%g2,	%o0
	edge16n	%l2,	%o6,	%o7
	ble,pt	%icc,	loop_2003
	tge	%xcc,	0x2
	udivx	%l0,	0x0D72,	%i4
	fble,a	%fcc2,	loop_2004
loop_2003:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc3,	loop_2005
	movle	%icc,	%o5,	%i5
loop_2004:
	movvc	%icc,	%i7,	%l5
	alignaddr	%l4,	%o1,	%g6
loop_2005:
	fmovs	%f22,	%f4
	movleu	%xcc,	%l1,	%g3
	std	%f0,	[%l7 + 0x28]
	movrlz	%o2,	%l3,	%g7
	movre	%i1,	0x16E,	%i6
	movrne	%g1,	0x394,	%l6
	movn	%icc,	%i2,	%i0
	tn	%icc,	0x5
	fbg	%fcc2,	loop_2006
	andcc	%o3,	%g4,	%i3
	mulx	%g5,	0x0DDB,	%g2
	fbo,a	%fcc2,	loop_2007
loop_2006:
	sll	%o4,	%l2,	%o0
	ldx	[%l7 + 0x58],	%o6
	tsubcc	%l0,	%o7,	%i4
loop_2007:
	fbg,a	%fcc2,	loop_2008
	edge32n	%o5,	%i7,	%l5
	fba	%fcc2,	loop_2009
	orncc	%i5,	%o1,	%g6
loop_2008:
	tsubcc	%l4,	%l1,	%o2
	fmul8ulx16	%f30,	%f12,	%f12
loop_2009:
	subcc	%l3,	0x1288,	%g7
	tcc	%icc,	0x1
	array16	%g3,	%i6,	%g1
	edge8l	%i1,	%l6,	%i0
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%g4
	fmovrde	%i3,	%f8,	%f14
	tpos	%xcc,	0x7
	fmovsge	%xcc,	%f26,	%f4
	tcs	%xcc,	0x3
	tleu	%icc,	0x2
	bneg	loop_2010
	taddcc	%g5,	%i2,	%g2
	movgu	%icc,	%o4,	%o0
	brgz	%o6,	loop_2011
loop_2010:
	fmovdn	%xcc,	%f29,	%f18
	array32	%l0,	%o7,	%i4
	mova	%icc,	%l2,	%o5
loop_2011:
	smulcc	%l5,	%i5,	%i7
	sir	0x15B9
	andncc	%o1,	%g6,	%l1
	nop
	setx	0x9C2E4035D2B01E19,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x29DC115990331407,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f22,	%f20
	movne	%icc,	%o2,	%l4
	bl,pt	%xcc,	loop_2012
	fmovdle	%xcc,	%f15,	%f4
	smul	%g7,	0x1654,	%g3
	xor	%l3,	%i6,	%i1
loop_2012:
	edge32	%l6,	%i0,	%o3
	movge	%icc,	%g4,	%g1
	mulx	%g5,	0x16EE,	%i3
	edge8l	%g2,	%o4,	%i2
	sth	%o0,	[%l7 + 0x2E]
	fcmpne16	%f16,	%f2,	%l0
	smulcc	%o7,	%i4,	%l2
	brgz,a	%o5,	loop_2013
	fmuld8sux16	%f27,	%f15,	%f30
	movgu	%xcc,	%l5,	%o6
	taddcctv	%i7,	0x174F,	%o1
loop_2013:
	movcs	%xcc,	%g6,	%i5
	ld	[%l7 + 0x18],	%f14
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x74] %asi,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%icc,	%f17,	%f16
	fbg,a	%fcc1,	loop_2014
	udivcc	%l4,	0x091B,	%o2
	brz	%g7,	loop_2015
	edge16n	%l3,	%i6,	%i1
loop_2014:
	movvs	%icc,	%g3,	%i0
	fpadd32	%f28,	%f16,	%f22
loop_2015:
	taddcctv	%o3,	%g4,	%g1
	tl	%xcc,	0x4
	tvs	%xcc,	0x1
	tl	%icc,	0x0
	edge16	%g5,	%i3,	%l6
	brz,a	%o4,	loop_2016
	orcc	%i2,	%o0,	%l0
	ldsw	[%l7 + 0x78],	%o7
	fbg	%fcc1,	loop_2017
loop_2016:
	fmovdvs	%xcc,	%f27,	%f20
	nop
	setx	0xF060214E,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	tcc	%icc,	0x1
loop_2017:
	be,pt	%xcc,	loop_2018
	fmovsg	%icc,	%f15,	%f5
	alignaddr	%i4,	%l2,	%o5
	tvs	%xcc,	0x0
loop_2018:
	add	%g2,	0x1B2F,	%o6
	nop
	fitod	%f4,	%f28
	fdtoi	%f28,	%f3
	sll	%l5,	0x09,	%i7
	ld	[%l7 + 0x2C],	%f3
	andcc	%o1,	%g6,	%l1
	sll	%i5,	0x0F,	%l4
	ldd	[%l7 + 0x10],	%f22
	fpackfix	%f24,	%f9
	tl	%icc,	0x7
	nop
	setx	0xE51ED086,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x8A88BB9A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f6,	%f26
	tgu	%icc,	0x5
	nop
	setx loop_2019, %l0, %l1
	jmpl %l1, %o2
	xor	%l3,	%i6,	%g7
	edge32l	%g3,	%i1,	%o3
	bl,a	%icc,	loop_2020
loop_2019:
	fmuld8sux16	%f27,	%f11,	%f30
	fmovd	%f26,	%f12
	srax	%i0,	%g4,	%g5
loop_2020:
	movrgz	%i3,	0x22C,	%g1
	subccc	%o4,	0x0A85,	%l6
	sir	0x0936
	ta	%icc,	0x0
	swap	[%l7 + 0x6C],	%o0
	sll	%l0,	0x00,	%o7
	movcs	%icc,	%i2,	%l2
	fandnot1	%f24,	%f16,	%f20
	tcs	%xcc,	0x5
	movrlez	%i4,	0x27C,	%g2
	ta	%icc,	0x5
	addcc	%o6,	0x0936,	%l5
	edge32ln	%i7,	%o5,	%g6
	srax	%l1,	%o1,	%i5
	edge32n	%o2,	%l4,	%l3
	bg,a	%xcc,	loop_2021
	fpackfix	%f26,	%f14
	sub	%i6,	%g3,	%i1
	edge32ln	%o3,	%i0,	%g4
loop_2021:
	tl	%xcc,	0x3
	and	%g7,	0x1E32,	%g5
	ta	%xcc,	0x6
	fbn	%fcc2,	loop_2022
	movne	%xcc,	%i3,	%o4
	subcc	%l6,	%g1,	%l0
	srl	%o7,	0x14,	%o0
loop_2022:
	fmovdneg	%icc,	%f19,	%f27
	fmovs	%f15,	%f1
	nop
	fitod	%f30,	%f16
	taddcc	%l2,	0x1E89,	%i4
	tn	%xcc,	0x6
	set	0x4A, %g4
	stha	%g2,	[%l7 + %g4] 0xe2
	membar	#Sync
	fbu,a	%fcc0,	loop_2023
	movle	%icc,	%o6,	%l5
	be,a,pt	%icc,	loop_2024
	umul	%i2,	0x066A,	%i7
loop_2023:
	mova	%icc,	%g6,	%o5
	movrgez	%o1,	%l1,	%o2
loop_2024:
	addc	%l4,	0x0111,	%l3
	smul	%i5,	%g3,	%i1
	fors	%f9,	%f18,	%f15
	smul	%o3,	%i6,	%g4
	ba,pt	%icc,	loop_2025
	fnor	%f24,	%f16,	%f26
	alignaddrl	%i0,	%g7,	%g5
	orcc	%i3,	0x1E16,	%o4
loop_2025:
	movcc	%icc,	%g1,	%l6
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f0
	fxtod	%f0,	%f0
	sdivx	%l0,	0x1EA6,	%o7
	bne,a,pt	%icc,	loop_2026
	fnegs	%f20,	%f19
	orcc	%o0,	%l2,	%i4
	fbuge,a	%fcc1,	loop_2027
loop_2026:
	smulcc	%o6,	0x1C9A,	%l5
	movle	%icc,	%i2,	%g2
	fmovrse	%g6,	%f2,	%f9
loop_2027:
	fmovrdlez	%i7,	%f26,	%f6
	addc	%o5,	0x0318,	%l1
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o2
	movpos	%xcc,	%l4,	%l3
	fcmple32	%f2,	%f4,	%o1
	te	%xcc,	0x4
	bcc,a	loop_2028
	mova	%xcc,	%g3,	%i5
	movrgz	%o3,	0x26D,	%i1
	taddcc	%g4,	0x06A7,	%i0
loop_2028:
	fmul8x16	%f25,	%f2,	%f0
	set	0x58, %i4
	ldxa	[%l7 + %i4] 0x89,	%g7
	movge	%icc,	%i6,	%g5
	sdivcc	%i3,	0x07A0,	%o4
	subcc	%g1,	0x11F6,	%l6
	fmovdn	%icc,	%f2,	%f22
	movge	%xcc,	%l0,	%o7
	ldd	[%l7 + 0x78],	%o0
	sub	%l2,	0x1CAB,	%o6
	orcc	%l5,	0x0A99,	%i4
	movg	%xcc,	%i2,	%g2
	orn	%i7,	%g6,	%o5
	lduh	[%l7 + 0x12],	%l1
	movvs	%icc,	%o2,	%l3
	udivx	%o1,	0x1D49,	%l4
	ldx	[%l7 + 0x50],	%i5
	udivx	%o3,	0x04F9,	%i1
	ldd	[%l7 + 0x20],	%f30
	xnor	%g4,	0x09F3,	%g3
	srlx	%g7,	%i0,	%i6
	movrlz	%g5,	0x065,	%i3
	nop
	setx	0xF07DA20B,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	ld	[%l7 + 0x2C],	%f4
	fand	%f30,	%f16,	%f24
	movg	%icc,	%g1,	%l6
	fbuge	%fcc3,	loop_2029
	movrlz	%l0,	0x242,	%o4
	movrlz	%o0,	%o7,	%l2
	tpos	%icc,	0x0
loop_2029:
	tge	%xcc,	0x5
	fmovscs	%xcc,	%f23,	%f7
	fpsub32	%f12,	%f2,	%f8
	ble,a	%xcc,	loop_2030
	bl	loop_2031
	fba	%fcc3,	loop_2032
	tl	%xcc,	0x1
loop_2030:
	movn	%icc,	%l5,	%i4
loop_2031:
	subcc	%i2,	%o6,	%i7
loop_2032:
	prefetch	[%l7 + 0x5C],	 0x0
	srlx	%g6,	0x14,	%o5
	fsrc1	%f6,	%f6
	movcs	%xcc,	%l1,	%o2
	fmovdleu	%xcc,	%f2,	%f20
	movrlz	%g2,	0x244,	%l3
	edge32ln	%o1,	%l4,	%o3
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
	tsubcctv	%i1,	%i5,	%g4
	movpos	%xcc,	%g7,	%i0
	taddcc	%i6,	0x0704,	%g5
loop_2033:
	fmovsne	%xcc,	%f10,	%f31
	nop
	setx	0x279E52ECC35CDF8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f22
	fmul8x16al	%f12,	%f3,	%f6
	fxnor	%f14,	%f8,	%f12
	udivcc	%i3,	0x0689,	%g1
	movvc	%xcc,	%g3,	%l0
	add	%l6,	%o4,	%o0
	wr	%g0,	0x22,	%asi
	stwa	%l2,	[%l7 + 0x10] %asi
	membar	#Sync
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x35] %asi,	%o7
	set	0x78, %o3
	stwa	%l5,	[%l7 + %o3] 0x89
	tsubcctv	%i2,	%o6,	%i4
	sllx	%i7,	%g6,	%o5
	set	0x72, %g6
	ldsha	[%l7 + %g6] 0x81,	%o2
	addcc	%l1,	0x1061,	%g2
	fmovrsne	%l3,	%f14,	%f14
	movge	%icc,	%o1,	%l4
	ldub	[%l7 + 0x2E],	%o3
	xnor	%i1,	0x1D4C,	%g4
	movrgez	%g7,	%i5,	%i0
	bleu,a	loop_2034
	orn	%g5,	%i6,	%g1
	edge8	%i3,	%g3,	%l6
	ldsb	[%l7 + 0x14],	%l0
loop_2034:
	fcmpeq16	%f0,	%f8,	%o0
	alignaddrl	%o4,	%o7,	%l2
	edge8ln	%l5,	%i2,	%i4
	popc	0x1F58,	%i7
	subccc	%g6,	%o6,	%o2
	prefetch	[%l7 + 0x5C],	 0x3
	movle	%xcc,	%o5,	%l1
	edge8ln	%l3,	%g2,	%l4
	nop
	setx	0xD577B0A1DFF9F88F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x94F434F814EA183A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f2,	%f24
	fpmerge	%f1,	%f15,	%f18
	fmul8x16al	%f31,	%f11,	%f30
	array16	%o1,	%o3,	%g4
	sdivcc	%i1,	0x165C,	%i5
	sub	%i0,	%g7,	%i6
	nop
	setx	0xA75CE38EE04C0C27,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	nop
	setx	0xC8D496B40F53236C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD456DF547BD5E2A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f0,	%f6
	movge	%icc,	%g1,	%i3
	tneg	%icc,	0x5
	fxors	%f27,	%f30,	%f26
	fsrc2s	%f23,	%f9
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%g3,	%g5
	movgu	%icc,	%l6,	%o0
	andcc	%o4,	%o7,	%l0
	brgez,a	%l5,	loop_2035
	fxnor	%f0,	%f6,	%f22
	sdiv	%l2,	0x165E,	%i2
	brgz	%i4,	loop_2036
loop_2035:
	array8	%i7,	%o6,	%o2
	brgz	%g6,	loop_2037
	bcs,a,pt	%xcc,	loop_2038
loop_2036:
	mulx	%o5,	0x1792,	%l1
	bgu,pn	%icc,	loop_2039
loop_2037:
	std	%f14,	[%l7 + 0x10]
loop_2038:
	nop
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x5A] %asi,	%l3
loop_2039:
	bg	loop_2040
	taddcctv	%l4,	%g2,	%o3
	tleu	%icc,	0x7
	orcc	%o1,	%g4,	%i1
loop_2040:
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
	fmovdge	%icc,	%f24,	%f9
	addc	%i5,	0x0E5E,	%g7
	sll	%i6,	%g1,	%i3
loop_2041:
	movg	%icc,	%i0,	%g5
	set	0x23, %g7
	ldstuba	[%l7 + %g7] 0x80,	%g3
	xorcc	%l6,	%o0,	%o4
	bcs	%icc,	loop_2042
	ldsh	[%l7 + 0x52],	%l0
	subccc	%l5,	%o7,	%l2
	popc	0x1064,	%i4
loop_2042:
	tneg	%icc,	0x6
	tsubcc	%i7,	%o6,	%i2
	nop
	fitos	%f14,	%f31
	fstoi	%f31,	%f9
	movvs	%icc,	%o2,	%o5
	sub	%g6,	%l3,	%l4
	orncc	%l1,	%g2,	%o3
	movrlez	%o1,	%g4,	%i1
	bvs,a,pn	%xcc,	loop_2043
	popc	%g7,	%i6
	nop
	setx	loop_2044,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%i5,	%i3,	%i0
loop_2043:
	addccc	%g5,	0x1B1B,	%g1
	bn,a	loop_2045
loop_2044:
	xor	%g3,	0x1E3F,	%o0
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x34] %asi,	%f31
loop_2045:
	mulscc	%l6,	%o4,	%l5
	edge32l	%o7,	%l2,	%l0
	andn	%i4,	%i7,	%o6
	alignaddrl	%i2,	%o5,	%o2
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%l3
	lduw	[%l7 + 0x5C],	%g6
	taddcc	%l4,	0x1BD4,	%g2
	taddcc	%l1,	0x1A57,	%o3
	brlz,a	%g4,	loop_2046
	pdist	%f8,	%f8,	%f12
	orncc	%i1,	%o1,	%g7
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x6E] %asi,	%i6
loop_2046:
	nop
	fitod	%f18,	%f24
	tle	%xcc,	0x7
	movvs	%icc,	%i5,	%i3
	ldx	[%l7 + 0x20],	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i0,	%g3
	brlez	%o0,	loop_2047
	fbuge	%fcc0,	loop_2048
	fpack32	%f16,	%f30,	%f30
	movrgz	%l6,	%g1,	%o4
loop_2047:
	fmovsle	%xcc,	%f16,	%f7
loop_2048:
	std	%f26,	[%l7 + 0x10]
	subccc	%o7,	0x109E,	%l2
	fnegd	%f20,	%f6
	edge32n	%l0,	%i4,	%i7
	fbug	%fcc0,	loop_2049
	movrlz	%l5,	0x3B2,	%o6
	set	0x6C, %g2
	lda	[%l7 + %g2] 0x10,	%f12
loop_2049:
	sub	%o5,	%o2,	%l3
	bge,a	loop_2050
	ldd	[%l7 + 0x60],	%i2
	sra	%g6,	%l4,	%l1
	call	loop_2051
loop_2050:
	membar	0x2B
	fbn	%fcc3,	loop_2052
	fba,a	%fcc3,	loop_2053
loop_2051:
	smulcc	%g2,	%o3,	%i1
	tcs	%xcc,	0x1
loop_2052:
	ldsh	[%l7 + 0x1A],	%o1
loop_2053:
	movrlz	%g4,	%g7,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f10,	%f3
	fbuge	%fcc0,	loop_2054
	stbar
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
loop_2054:
	nop
	setx	0x90530919,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fmovrdlz	%i6,	%f30,	%f4
	edge8n	%g5,	%g3,	%i0
	srax	%l6,	0x1C,	%g1
	tsubcc	%o0,	0x1162,	%o7
	fmovrslz	%o4,	%f5,	%f18
	fmovrdne	%l0,	%f8,	%f2
	tcs	%icc,	0x6
	orcc	%l2,	%i4,	%i7
	bn	%icc,	loop_2055
	movn	%xcc,	%l5,	%o5
	andcc	%o2,	0x0891,	%o6
	addc	%i2,	0x0838,	%g6
loop_2055:
	fbul	%fcc3,	loop_2056
	tg	%xcc,	0x4
	srax	%l3,	%l4,	%g2
	fpadd32	%f4,	%f16,	%f16
loop_2056:
	add	%l1,	0x05B2,	%i1
	movrlez	%o1,	%o3,	%g7
	tg	%icc,	0x0
	mulscc	%i5,	%i3,	%i6
	tsubcctv	%g4,	%g5,	%i0
	tgu	%icc,	0x4
	fandnot2	%f6,	%f4,	%f22
	edge32ln	%l6,	%g3,	%g1
	edge32l	%o7,	%o4,	%o0
	tle	%xcc,	0x3
	nop
	setx	0xA865561E70564EB0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	nop
	fitod	%f4,	%f10
	fdtos	%f10,	%f1
	tg	%xcc,	0x3
	fnot1s	%f17,	%f14
	fmuld8sux16	%f10,	%f16,	%f22
	movrne	%l0,	0x383,	%i4
	brlez,a	%l2,	loop_2057
	movg	%icc,	%i7,	%l5
	brgez	%o2,	loop_2058
	movvs	%icc,	%o5,	%o6
loop_2057:
	fones	%f26
	movle	%icc,	%i2,	%g6
loop_2058:
	edge32l	%l4,	%g2,	%l1
	tg	%icc,	0x3
	umul	%l3,	%o1,	%i1
	edge32ln	%g7,	%o3,	%i5
	edge16ln	%i6,	%g4,	%i3
	sethi	0x1327,	%i0
	movneg	%icc,	%l6,	%g3
	nop
	fitos	%f2,	%f17
	fstox	%f17,	%f14
	fxtos	%f14,	%f0
	tne	%icc,	0x3
	movpos	%xcc,	%g5,	%g1
	srlx	%o7,	0x10,	%o0
	popc	0x1678,	%o4
	mova	%icc,	%l0,	%l2
	tgu	%xcc,	0x7
	bl	%icc,	loop_2059
	bpos,a,pn	%icc,	loop_2060
	ta	%xcc,	0x7
	tsubcc	%i4,	0x1980,	%l5
loop_2059:
	tcc	%icc,	0x5
loop_2060:
	fsrc1s	%f7,	%f7
	fmovrdne	%o2,	%f16,	%f20
	sll	%o5,	0x0D,	%i7
	sllx	%o6,	0x03,	%i2
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x2c,	%l4
	movrgz	%g6,	0x2A5,	%g2
	sub	%l3,	0x11E7,	%o1
	xnor	%i1,	%g7,	%o3
	fmovsneg	%xcc,	%f22,	%f28
	fcmpne16	%f10,	%f6,	%l1
	fbo,a	%fcc1,	loop_2061
	prefetch	[%l7 + 0x74],	 0x3
	set	0x77, %l2
	ldstuba	[%l7 + %l2] 0x0c,	%i6
loop_2061:
	edge32l	%g4,	%i5,	%i3
	movrgez	%i0,	%g3,	%l6
	subccc	%g5,	%g1,	%o7
	tn	%xcc,	0x4
	orn	%o0,	0x0EF1,	%o4
	ba,a	%icc,	loop_2062
	movrgez	%l2,	%l0,	%l5
	mova	%icc,	%o2,	%i4
	set	0x72, %i6
	ldsha	[%l7 + %i6] 0x04,	%o5
loop_2062:
	movre	%o6,	%i2,	%i7
	move	%icc,	%l4,	%g2
	edge16n	%l3,	%o1,	%g6
	xnor	%g7,	0x1C37,	%i1
	mova	%icc,	%l1,	%o3
	fxnor	%f6,	%f16,	%f0
	tne	%xcc,	0x0
	fmovse	%icc,	%f7,	%f6
	srax	%i6,	%i5,	%i3
	movneg	%xcc,	%i0,	%g4
	or	%g3,	0x1000,	%g5
	movrlez	%g1,	%l6,	%o0
	tneg	%icc,	0x3
	edge16l	%o7,	%l2,	%o4
	stbar
	tneg	%icc,	0x1
	movcc	%icc,	%l5,	%l0
	fbe,a	%fcc3,	loop_2063
	xorcc	%o2,	%i4,	%o5
	fcmpne32	%f8,	%f28,	%o6
	sir	0x0F9D
loop_2063:
	bneg,a	%icc,	loop_2064
	tne	%xcc,	0x0
	array16	%i7,	%i2,	%g2
	sub	%l3,	0x1348,	%l4
loop_2064:
	fsrc1	%f6,	%f20
	movcc	%icc,	%o1,	%g7
	sir	0x0413
	edge16l	%i1,	%g6,	%o3
	taddcctv	%i6,	0x03CB,	%i5
	fmovdvs	%xcc,	%f4,	%f4
	tl	%icc,	0x5
	tsubcc	%i3,	%i0,	%g4
	fmovd	%f10,	%f12
	bpos,a,pt	%xcc,	loop_2065
	be,a,pn	%icc,	loop_2066
	nop
	setx loop_2067, %l0, %l1
	jmpl %l1, %l1
	fmovsg	%icc,	%f18,	%f12
loop_2065:
	sllx	%g5,	%g3,	%g1
loop_2066:
	fmovrde	%o0,	%f16,	%f18
loop_2067:
	bn,pn	%xcc,	loop_2068
	movl	%icc,	%l6,	%o7
	wr	%g0,	0x0c,	%asi
	stba	%o4,	[%l7 + 0x33] %asi
loop_2068:
	ldsb	[%l7 + 0x18],	%l5
	movl	%xcc,	%l2,	%l0
	smulcc	%o2,	%o5,	%i4
	bge	%icc,	loop_2069
	bcc,pt	%xcc,	loop_2070
	tsubcctv	%i7,	0x0A40,	%o6
	movvs	%icc,	%g2,	%i2
loop_2069:
	move	%icc,	%l3,	%o1
loop_2070:
	bvc,a,pn	%xcc,	loop_2071
	fbo	%fcc0,	loop_2072
	nop
	fitod	%f14,	%f2
	set	0x3C, %g3
	ldsba	[%l7 + %g3] 0x11,	%l4
loop_2071:
	or	%g7,	%i1,	%g6
loop_2072:
	tge	%xcc,	0x2
	pdist	%f26,	%f4,	%f6
	stw	%o3,	[%l7 + 0x60]
	movle	%xcc,	%i6,	%i5
	or	%i0,	0x0CB7,	%g4
	edge16n	%i3,	%g5,	%l1
	xorcc	%g1,	0x1CCE,	%g3
	fmovdl	%icc,	%f24,	%f23
	array8	%l6,	%o7,	%o4
	fsrc2s	%f21,	%f8
	fsrc1s	%f31,	%f3
	andcc	%o0,	%l5,	%l0
	nop
	setx	0x5DC03D315048CE4C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tpos	%icc,	0x6
	edge16n	%l2,	%o5,	%i4
	umulcc	%o2,	%o6,	%g2
	nop
	set	0x38, %i0
	ldx	[%l7 + %i0],	%i7
	addcc	%l3,	%o1,	%i2
	fpsub16s	%f23,	%f19,	%f8
	edge32n	%l4,	%g7,	%i1
	fpsub16	%f28,	%f30,	%f2
	xnor	%g6,	0x1CD9,	%o3
	brgez,a	%i5,	loop_2073
	edge32l	%i0,	%i6,	%i3
	edge32	%g4,	%g5,	%g1
	nop
	fitos	%f1,	%f1
	fstod	%f1,	%f10
loop_2073:
	nop
	set	0x28, %l0
	ldxa	[%l7 + %l0] 0x81,	%g3
	srlx	%l6,	%o7,	%o4
	umul	%l1,	0x1C08,	%l5
	fnot2	%f8,	%f28
	movl	%icc,	%l0,	%l2
	fbg	%fcc3,	loop_2074
	or	%o0,	%i4,	%o5
	udivx	%o6,	0x13E1,	%o2
	tn	%xcc,	0x6
loop_2074:
	fsrc2	%f28,	%f2
	tsubcctv	%g2,	%i7,	%l3
	tsubcc	%o1,	%i2,	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%l4,	%i1
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x08] %asi,	%g6
	nop
	setx	0x1482C1D0C04DADF6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	movrgez	%i5,	0x2B9,	%o3
	fbe	%fcc0,	loop_2075
	movrne	%i0,	0x32E,	%i3
	sub	%i6,	%g4,	%g1
	fxor	%f2,	%f6,	%f24
loop_2075:
	and	%g3,	%g5,	%o7
	andcc	%o4,	0x0B13,	%l1
	bneg	%xcc,	loop_2076
	bcs,a,pt	%icc,	loop_2077
	fzeros	%f26
	fbu,a	%fcc3,	loop_2078
loop_2076:
	tcc	%xcc,	0x6
loop_2077:
	alignaddr	%l6,	%l5,	%l0
	movneg	%xcc,	%l2,	%i4
loop_2078:
	edge32	%o5,	%o0,	%o6
	fornot2	%f6,	%f10,	%f6
	ta	%xcc,	0x0
	te	%xcc,	0x2
	nop
	setx loop_2079, %l0, %l1
	jmpl %l1, %g2
	brz	%o2,	loop_2080
	sll	%i7,	0x11,	%l3
	prefetch	[%l7 + 0x24],	 0x2
loop_2079:
	movgu	%xcc,	%i2,	%g7
loop_2080:
	umulcc	%l4,	%i1,	%o1
	fbn	%fcc3,	loop_2081
	srax	%i5,	0x01,	%g6
	addcc	%o3,	%i0,	%i6
	edge16	%g4,	%g1,	%g3
loop_2081:
	addc	%g5,	%i3,	%o4
	movl	%xcc,	%l1,	%o7
	tneg	%icc,	0x7
	movcc	%xcc,	%l5,	%l0
	fbule	%fcc1,	loop_2082
	movrgez	%l6,	%l2,	%i4
	andncc	%o0,	%o6,	%g2
	tsubcctv	%o5,	0x12C5,	%o2
loop_2082:
	movcc	%icc,	%l3,	%i7
	orncc	%i2,	0x14C8,	%l4
	fzeros	%f7
	flush	%l7 + 0x54
	movn	%xcc,	%i1,	%o1
	wr	%g0,	0x2b,	%asi
	stxa	%g7,	[%l7 + 0x20] %asi
	membar	#Sync
	tsubcc	%i5,	0x1AFF,	%o3
	edge16l	%g6,	%i0,	%g4
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x56] %asi,	%i6
	pdist	%f16,	%f12,	%f18
	fmovsa	%xcc,	%f23,	%f24
	tle	%icc,	0x5
	edge16ln	%g1,	%g3,	%g5
	tleu	%icc,	0x1
	movvc	%xcc,	%o4,	%l1
	taddcctv	%o7,	%l5,	%i3
	for	%f26,	%f22,	%f2
	movvs	%icc,	%l6,	%l2
	tsubcc	%i4,	0x11D1,	%o0
	or	%o6,	0x1E09,	%g2
	tg	%xcc,	0x2
	ld	[%l7 + 0x64],	%f26
	ble,a,pt	%icc,	loop_2083
	fmovrde	%l0,	%f4,	%f10
	subc	%o5,	%o2,	%i7
	fmul8sux16	%f30,	%f8,	%f16
loop_2083:
	fmovsn	%xcc,	%f9,	%f22
	sdivcc	%i2,	0x01E7,	%l3
	array32	%i1,	%o1,	%l4
	andncc	%i5,	%g7,	%o3
	fornot1	%f18,	%f6,	%f10
	edge16n	%g6,	%g4,	%i0
	movcc	%xcc,	%i6,	%g1
	edge16l	%g3,	%o4,	%l1
	smulcc	%g5,	0x0BFD,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i3,	%l6
	and	%o7,	0x0DB9,	%l2
	sir	0x037C
	sdivcc	%o0,	0x0548,	%i4
	ld	[%l7 + 0x50],	%f8
	edge16ln	%g2,	%o6,	%l0
	nop
	setx	0x5F623FA5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f6
	fpadd16	%f10,	%f20,	%f20
	tle	%xcc,	0x5
	set	0x74, %l6
	swapa	[%l7 + %l6] 0x0c,	%o5
	tvs	%xcc,	0x2
	fandnot2	%f4,	%f6,	%f10
	fnor	%f10,	%f12,	%f14
	set	0x18, %g5
	lduha	[%l7 + %g5] 0x15,	%i7
	edge16	%i2,	%o2,	%i1
	taddcc	%l3,	0x11CC,	%o1
	or	%i5,	%l4,	%g7
	set	0x2C, %o6
	sta	%f10,	[%l7 + %o6] 0x04
	membar	0x6B
	xnorcc	%g6,	0x1A43,	%g4
	nop
	setx	0x22494CC8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x5BD76B18,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f1,	%f29
	flush	%l7 + 0x54
	sdiv	%o3,	0x0D70,	%i6
	edge16	%g1,	%g3,	%i0
	orncc	%l1,	%g5,	%l5
	bvs,a,pn	%icc,	loop_2084
	tvs	%icc,	0x7
	tvc	%icc,	0x7
	fmovrdne	%o4,	%f0,	%f18
loop_2084:
	movge	%icc,	%l6,	%o7
	umulcc	%l2,	0x072E,	%i3
	mulscc	%i4,	%o0,	%g2
	movleu	%icc,	%l0,	%o5
	fbo	%fcc0,	loop_2085
	or	%i7,	0x0316,	%i2
	orn	%o6,	%o2,	%i1
	tcc	%icc,	0x6
loop_2085:
	fmovse	%xcc,	%f6,	%f17
	tneg	%icc,	0x5
	movg	%icc,	%l3,	%o1
	addc	%l4,	%i5,	%g7
	fmovdgu	%xcc,	%f5,	%f3
	set	0x54, %i7
	ldswa	[%l7 + %i7] 0x15,	%g4
	fba,a	%fcc0,	loop_2086
	movcs	%icc,	%o3,	%i6
	tsubcc	%g1,	0x162E,	%g3
	addcc	%g6,	%l1,	%g5
loop_2086:
	nop
	fitos	%f14,	%f23
	fstox	%f23,	%f22
	fxtos	%f22,	%f18
	fandnot1s	%f28,	%f22,	%f2
	nop
	setx	0x846EAD4B0B76C551,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xEC1684491080F8B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f6,	%f28
	or	%i0,	%l5,	%l6
	edge16	%o7,	%o4,	%l2
	brnz	%i4,	loop_2087
	bgu	%icc,	loop_2088
	movcs	%icc,	%o0,	%g2
	umulcc	%i3,	0x0654,	%l0
loop_2087:
	array32	%i7,	%i2,	%o6
loop_2088:
	fsrc2s	%f22,	%f6
	std	%f22,	[%l7 + 0x28]
	fandnot1	%f4,	%f30,	%f22
	set	0x4B, %o2
	ldsba	[%l7 + %o2] 0x10,	%o2
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%o5
	fzero	%f4
	movgu	%icc,	%i1,	%o1
	fands	%f19,	%f28,	%f7
	movl	%icc,	%l3,	%i5
	fpsub16s	%f15,	%f26,	%f24
	tvc	%xcc,	0x5
	sub	%l4,	0x0CF3,	%g7
	bvc	%xcc,	loop_2089
	taddcc	%g4,	0x1C66,	%o3
	fxors	%f20,	%f7,	%f16
	nop
	setx	0xD6192502505D1487,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
loop_2089:
	brz,a	%g1,	loop_2090
	movrne	%i6,	%g6,	%g3
	movne	%icc,	%g5,	%i0
	addcc	%l1,	0x1711,	%l6
loop_2090:
	fba	%fcc1,	loop_2091
	movg	%xcc,	%o7,	%l5
	fnegs	%f28,	%f28
	fmovscs	%icc,	%f24,	%f4
loop_2091:
	array16	%l2,	%i4,	%o4
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x1e
	membar	#Sync
	xor	%o0,	0x017D,	%g2
	edge16n	%l0,	%i3,	%i2
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%i7
	taddcc	%o2,	%o5,	%i1
	edge32l	%o1,	%o6,	%i5
	sub	%l4,	%g7,	%l3
	subc	%o3,	%g4,	%i6
	fblg	%fcc3,	loop_2092
	fpackfix	%f22,	%f19
	tpos	%xcc,	0x5
	udiv	%g6,	0x1DFA,	%g1
loop_2092:
	nop
	setx	0x397720F9243CB2DC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x3B99B9C1A028D9F4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f24,	%f16
	nop
	set	0x52, %l5
	ldstub	[%l7 + %l5],	%g3
	set	0x24, %g1
	lduwa	[%l7 + %g1] 0x10,	%g5
	edge16ln	%l1,	%l6,	%o7
	sdivx	%l5,	0x1BD2,	%l2
	movrlz	%i0,	0x10F,	%o4
	set	0x8, %o7
	ldxa	[%g0 + %o7] 0x4f,	%i4
	array32	%o0,	%l0,	%g2
	tl	%icc,	0x7
	edge32n	%i3,	%i2,	%o2
	movrgz	%i7,	%o5,	%o1
	movle	%xcc,	%o6,	%i1
	edge16n	%i5,	%l4,	%g7
	tsubcctv	%l3,	0x0A3E,	%o3
	fbule	%fcc2,	loop_2093
	addc	%i6,	0x04D5,	%g6
	subcc	%g4,	0x1C4D,	%g1
	edge16	%g3,	%l1,	%g5
loop_2093:
	addcc	%o7,	0x1059,	%l5
	edge16l	%l2,	%l6,	%o4
	movrgez	%i0,	%o0,	%i4
	tcc	%xcc,	0x1
	fbn,a	%fcc2,	loop_2094
	fmovdne	%xcc,	%f1,	%f26
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x18,	%f16
loop_2094:
	nop
	setx loop_2095, %l0, %l1
	jmpl %l1, %g2
	edge16	%l0,	%i3,	%i2
	popc	%o2,	%o5
	fpack16	%f2,	%f4
loop_2095:
	fmovdle	%xcc,	%f16,	%f28
	udivx	%i7,	0x0FB6,	%o1
	tcc	%xcc,	0x6
	tne	%icc,	0x6
	fbu	%fcc1,	loop_2096
	alignaddr	%o6,	%i1,	%i5
	taddcctv	%g7,	0x1408,	%l4
	movge	%icc,	%l3,	%i6
loop_2096:
	movge	%icc,	%g6,	%g4
	fmovsl	%icc,	%f20,	%f1
	srl	%o3,	0x0D,	%g3
	sub	%g1,	0x0E6B,	%l1
	edge8n	%o7,	%g5,	%l2
	udiv	%l5,	0x0E9E,	%o4
	alignaddrl	%l6,	%i0,	%o0
	movg	%icc,	%i4,	%g2
	lduh	[%l7 + 0x18],	%l0
	fandnot2s	%f31,	%f8,	%f19
	sub	%i3,	%o2,	%o5
	tle	%xcc,	0x6
	edge16l	%i7,	%i2,	%o1
	popc	0x1569,	%o6
	fsrc1s	%f5,	%f7
	brlez	%i1,	loop_2097
	nop
	setx	loop_2098,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%xcc,	0x5
	movleu	%icc,	%g7,	%i5
loop_2097:
	taddcc	%l3,	%l4,	%i6
loop_2098:
	tvc	%xcc,	0x7
	sllx	%g4,	%o3,	%g6
	fsrc2	%f28,	%f12
	bcc,pn	%xcc,	loop_2099
	fpmerge	%f21,	%f11,	%f20
	alignaddrl	%g1,	%g3,	%l1
	fsrc2s	%f21,	%f23
loop_2099:
	brgz	%o7,	loop_2100
	lduw	[%l7 + 0x7C],	%l2
	fcmpgt32	%f16,	%f26,	%l5
	nop
	setx	0x55863D5D5469CFBA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x860BDBD9AAF77A41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f12,	%f14
loop_2100:
	movle	%icc,	%o4,	%l6
	edge32n	%i0,	%g5,	%i4
	bl,pt	%xcc,	loop_2101
	tsubcctv	%g2,	%o0,	%i3
	tcc	%icc,	0x6
	add	%l0,	%o2,	%o5
loop_2101:
	movre	%i7,	0x34A,	%i2
	set	0x2D, %i5
	lduba	[%l7 + %i5] 0x80,	%o1
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f10
	fxtod	%f10,	%f18
	array32	%i1,	%g7,	%o6
	tcc	%xcc,	0x0
	tne	%icc,	0x4
	alignaddr	%i5,	%l3,	%l4
	edge8l	%g4,	%i6,	%g6
	ld	[%l7 + 0x70],	%f23
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%g1
	edge16n	%g3,	%o3,	%l1
	edge32l	%o7,	%l2,	%l5
	flush	%l7 + 0x70
	subccc	%l6,	0x1E7C,	%o4
	sth	%g5,	[%l7 + 0x32]
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
	tl	%icc,	0x5
	sdivcc	%g2,	0x105D,	%i4
	tpos	%xcc,	0x4
	nop
	setx	0x007EA53E,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	brz	%i3,	loop_2102
	movg	%icc,	%l0,	%o0
	xnorcc	%o5,	0x0EEC,	%i7
	tgu	%xcc,	0x0
loop_2102:
	nop
	fitos	%f3,	%f11
	fstox	%f11,	%f22
	fxtos	%f22,	%f27
	ldsb	[%l7 + 0x56],	%i2
	srlx	%o1,	0x11,	%i1
	bn,pn	%icc,	loop_2103
	edge8ln	%o2,	%g7,	%i5
	fpadd16s	%f28,	%f31,	%f20
	fcmpeq16	%f28,	%f24,	%l3
loop_2103:
	stx	%o6,	[%l7 + 0x70]
	edge16	%l4,	%i6,	%g6
	tle	%xcc,	0x7
	set	0x32, %i3
	stba	%g4,	[%l7 + %i3] 0xea
	membar	#Sync
	fbug,a	%fcc2,	loop_2104
	lduh	[%l7 + 0x12],	%g3
	orncc	%g1,	%o3,	%l1
	edge8n	%o7,	%l2,	%l5
loop_2104:
	fmovdcc	%xcc,	%f11,	%f24
	tpos	%icc,	0x5
	movleu	%icc,	%o4,	%g5
	fornot2s	%f19,	%f5,	%f28
	xorcc	%i0,	%l6,	%g2
	fpsub16s	%f24,	%f1,	%f10
	tsubcc	%i3,	%i4,	%l0
	bg,a	%xcc,	loop_2105
	alignaddr	%o0,	%o5,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xeb,	%asi
	stxa	%o1,	[%l7 + 0x48] %asi
	membar	#Sync
loop_2105:
	fpack16	%f2,	%f15
	alignaddr	%i1,	%i7,	%g7
	swap	[%l7 + 0x28],	%o2
	nop
	setx	loop_2106,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%l3,	0x00E2,	%i5
	mulscc	%l4,	0x03E5,	%i6
	fpadd16s	%f25,	%f18,	%f2
loop_2106:
	smul	%o6,	%g4,	%g6
	movrgz	%g1,	%g3,	%l1
	edge32n	%o7,	%o3,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f0
	movneg	%xcc,	%o4,	%g5
	alignaddrl	%i0,	%l2,	%g2
	alignaddr	%l6,	%i3,	%l0
	brnz,a	%i4,	loop_2107
	movre	%o0,	0x3E7,	%i2
	ldub	[%l7 + 0x6E],	%o1
	edge16	%o5,	%i7,	%i1
loop_2107:
	tg	%xcc,	0x6
	ta	%icc,	0x6
	edge32l	%g7,	%o2,	%i5
	subc	%l4,	%l3,	%i6
	sdiv	%g4,	0x1F92,	%o6
	umulcc	%g1,	%g6,	%g3
	edge32ln	%l1,	%o3,	%l5
	sll	%o7,	%g5,	%o4
	movgu	%icc,	%l2,	%i0
	tneg	%xcc,	0x0
	taddcctv	%g2,	%i3,	%l0
	xorcc	%l6,	%o0,	%i4
	movgu	%xcc,	%o1,	%i2
	edge32n	%o5,	%i7,	%i1
	bge	%icc,	loop_2108
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f20
	sub	%g7,	%o2,	%l4
loop_2108:
	fornot2s	%f10,	%f30,	%f19
	movne	%icc,	%i5,	%l3
	andcc	%i6,	0x19A7,	%g4
	edge16n	%g1,	%g6,	%g3
	set	0x18, %l4
	stxa	%o6,	[%l7 + %l4] 0xe2
	membar	#Sync
	fcmple16	%f12,	%f16,	%o3
	umul	%l1,	0x06A2,	%o7
	andn	%g5,	%l5,	%l2
	sll	%i0,	0x00,	%o4
	movg	%xcc,	%i3,	%g2
	movl	%xcc,	%l0,	%o0
	alignaddr	%i4,	%o1,	%l6
	ta	%icc,	0x5
	ble	loop_2109
	fbe	%fcc0,	loop_2110
	taddcc	%o5,	%i2,	%i7
	movn	%icc,	%i1,	%g7
loop_2109:
	array8	%o2,	%i5,	%l3
loop_2110:
	swap	[%l7 + 0x4C],	%l4
	tsubcc	%g4,	0x0213,	%i6
	ldsb	[%l7 + 0x0E],	%g1
	movpos	%icc,	%g3,	%g6
	tcs	%xcc,	0x3
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x7A] %asi,	%o6
	sdivcc	%l1,	0x1921,	%o7
	stbar
	fmovrse	%g5,	%f23,	%f10
	sub	%o3,	%l5,	%i0
	lduw	[%l7 + 0x24],	%o4
	brlz,a	%l2,	loop_2111
	movrne	%i3,	%l0,	%g2
	mulx	%o0,	0x077D,	%o1
	movcc	%icc,	%l6,	%i4
loop_2111:
	movcs	%xcc,	%i2,	%i7
	smul	%o5,	%i1,	%g7
	fmovrdlz	%o2,	%f18,	%f14
	fsrc2	%f2,	%f24
	fmovdneg	%icc,	%f10,	%f21
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	fbge	%fcc0,	loop_2112
	sdivcc	%l4,	0x1A9E,	%l3
	ldub	[%l7 + 0x08],	%g4
	edge16ln	%i6,	%g3,	%g6
loop_2112:
	nop
	setx	0x76D3594BA79B8973,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xC1BD53B7620963FC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f28,	%f4
	edge32	%g1,	%o6,	%o7
	edge16	%l1,	%o3,	%g5
	fble,a	%fcc1,	loop_2113
	nop
	setx	0x27FB869D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f1
	membar	0x3A
	tgu	%xcc,	0x7
loop_2113:
	smulcc	%l5,	%i0,	%o4
	alignaddr	%l2,	%i3,	%g2
	tvs	%xcc,	0x1
	nop
	setx	0x31341C5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xEE2F30BC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f20,	%f20
	nop
	fitod	%f13,	%f28
	xorcc	%o0,	0x1089,	%o1
	andcc	%l0,	%i4,	%l6
	orncc	%i2,	%i7,	%i1
	fmovda	%icc,	%f2,	%f23
	fmovse	%xcc,	%f0,	%f8
	edge8n	%o5,	%g7,	%i5
	fcmple32	%f2,	%f4,	%l4
	nop
	setx	loop_2114,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%xcc,	%o2,	%l3
	bshuffle	%f6,	%f22,	%f24
	fmuld8ulx16	%f24,	%f15,	%f10
loop_2114:
	fxors	%f23,	%f3,	%f15
	nop
	fitos	%f13,	%f0
	fstod	%f0,	%f14
	nop
	fitos	%f6,	%f27
	fstox	%f27,	%f28
	fxtos	%f28,	%f20
	nop
	fitod	%f0,	%f26
	fdtoi	%f26,	%f7
	srax	%g4,	0x0C,	%g3
	fmovrdlz	%g6,	%f6,	%f4
	tsubcc	%g1,	0x17AB,	%o6
	srl	%i6,	0x0F,	%o7
	edge16l	%o3,	%g5,	%l1
	stw	%i0,	[%l7 + 0x18]
	udivcc	%l5,	0x070C,	%o4
	movpos	%xcc,	%i3,	%l2
	xnor	%o0,	0x19ED,	%g2
	orncc	%o1,	0x0769,	%i4
	tle	%icc,	0x2
	nop
	setx	loop_2115,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%icc,	%l0,	%l6
	fmovrdgez	%i7,	%f30,	%f28
	fandnot1	%f8,	%f0,	%f28
loop_2115:
	nop
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x20] %asi,	%f27
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x46] %asi,	%i2
	mova	%xcc,	%o5,	%i1
	ba,a,pt	%xcc,	loop_2116
	taddcc	%i5,	%g7,	%o2
	mova	%icc,	%l4,	%l3
	movcs	%xcc,	%g4,	%g6
loop_2116:
	addcc	%g1,	0x0AB2,	%o6
	edge16ln	%i6,	%o7,	%o3
	fandnot2	%f22,	%f30,	%f30
	set	0x52, %i2
	stha	%g3,	[%l7 + %i2] 0x88
	srlx	%l1,	0x12,	%i0
	bcs	loop_2117
	tg	%icc,	0x0
	tleu	%icc,	0x7
	fmovsvc	%icc,	%f5,	%f9
loop_2117:
	fnor	%f14,	%f0,	%f16
	movvc	%icc,	%g5,	%o4
	bvc,a,pt	%icc,	loop_2118
	bneg,a	%xcc,	loop_2119
	fmovrslz	%l5,	%f11,	%f7
	wr	%g0,	0x89,	%asi
	sta	%f14,	[%l7 + 0x28] %asi
loop_2118:
	edge32ln	%l2,	%o0,	%i3
loop_2119:
	fcmpgt32	%f0,	%f6,	%o1
	move	%xcc,	%i4,	%l0
	srl	%l6,	0x08,	%i7
	addc	%g2,	%o5,	%i1
	fbl,a	%fcc1,	loop_2120
	ble	loop_2121
	umul	%i2,	0x1B61,	%g7
	ta	%xcc,	0x5
loop_2120:
	fmovrdlz	%o2,	%f16,	%f18
loop_2121:
	udivcc	%l4,	0x0171,	%i5
	xorcc	%l3,	0x16F8,	%g4
	subc	%g6,	%g1,	%o6
	movvc	%xcc,	%i6,	%o3
	subc	%g3,	0x17F1,	%l1
	fsrc1	%f4,	%f20
	orn	%o7,	%i0,	%g5
	mova	%icc,	%l5,	%o4
	movrgz	%o0,	%i3,	%o1
	fzero	%f16
	brz,a	%l2,	loop_2122
	xor	%i4,	%l0,	%i7
	ldsw	[%l7 + 0x40],	%g2
	edge8	%l6,	%o5,	%i2
loop_2122:
	fandnot1s	%f3,	%f9,	%f9
	fbug	%fcc3,	loop_2123
	sdivcc	%g7,	0x134B,	%o2
	fbl,a	%fcc2,	loop_2124
	fbn,a	%fcc0,	loop_2125
loop_2123:
	tvc	%xcc,	0x3
	xnor	%i1,	%i5,	%l4
loop_2124:
	edge16n	%g4,	%g6,	%l3
loop_2125:
	movne	%icc,	%o6,	%i6
	movg	%icc,	%o3,	%g3
	fblg,a	%fcc3,	loop_2126
	array16	%g1,	%l1,	%o7
	orncc	%g5,	0x16C1,	%l5
	ldstub	[%l7 + 0x43],	%i0
loop_2126:
	umulcc	%o4,	0x06B9,	%i3
	fnand	%f20,	%f18,	%f24
	array16	%o1,	%l2,	%o0
	array16	%i4,	%l0,	%i7
	umul	%g2,	%o5,	%l6
	xorcc	%g7,	0x1830,	%i2
	stbar
	edge8n	%o2,	%i5,	%l4
	array8	%g4,	%g6,	%i1
	srl	%l3,	0x01,	%o6
	fnors	%f9,	%f4,	%f18
	tl	%xcc,	0x6
	edge32n	%o3,	%i6,	%g1
	tg	%icc,	0x5
	prefetch	[%l7 + 0x54],	 0x1
	bgu,a,pt	%xcc,	loop_2127
	nop
	setx	0x888DC39E60450002,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	edge32n	%l1,	%g3,	%g5
	set	0x20, %l3
	ldxa	[%l7 + %l3] 0x11,	%o7
loop_2127:
	tvs	%icc,	0x5
	add	%l5,	%i0,	%o4
	movne	%icc,	%o1,	%l2
	fnot1	%f24,	%f20
	fbn,a	%fcc2,	loop_2128
	tcs	%icc,	0x6
	brgez,a	%i3,	loop_2129
	prefetch	[%l7 + 0x0C],	 0x2
loop_2128:
	addc	%o0,	%l0,	%i7
	fble	%fcc2,	loop_2130
loop_2129:
	swap	[%l7 + 0x60],	%i4
	tvc	%icc,	0x3
	sir	0x0D7D
loop_2130:
	nop
	set	0x08, %o0
	stba	%g2,	[%l7 + %o0] 0xea
	membar	#Sync
	edge32n	%l6,	%o5,	%i2
	stb	%o2,	[%l7 + 0x21]
	fornot2s	%f23,	%f3,	%f7
	fmovsl	%icc,	%f11,	%f18
	tcs	%icc,	0x4
	movg	%xcc,	%i5,	%l4
	tvs	%xcc,	0x4
	fmul8x16au	%f24,	%f20,	%f24
	udiv	%g7,	0x1478,	%g4
	array8	%i1,	%g6,	%o6
	and	%o3,	%l3,	%g1
	sdivx	%i6,	0x056B,	%l1
	fbe,a	%fcc3,	loop_2131
	udiv	%g5,	0x1944,	%o7
	udiv	%g3,	0x1007,	%l5
	movgu	%xcc,	%o4,	%i0
loop_2131:
	edge32n	%o1,	%l2,	%i3
	taddcc	%l0,	%i7,	%i4
	fnot2	%f8,	%f18
	tleu	%icc,	0x1
	udivx	%o0,	0x0CCC,	%l6
	edge32l	%o5,	%g2,	%o2
	sdivx	%i2,	0x16B9,	%l4
	fzero	%f4
	sra	%i5,	%g7,	%g4
	popc	0x0EA4,	%i1
	udiv	%o6,	0x0A8A,	%g6
	set	0x22, %g4
	ldsha	[%l7 + %g4] 0x19,	%l3
	edge8	%g1,	%i6,	%l1
	fmovdvs	%xcc,	%f20,	%f12
	sir	0x1C36
	sdivcc	%o3,	0x0623,	%g5
	addc	%o7,	0x1D0A,	%g3
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	xnor	%i0,	%o1,	%l2
	ldsw	[%l7 + 0x64],	%i3
	nop
	set	0x40, %o5
	ldx	[%l7 + %o5],	%l0
	fbug,a	%fcc2,	loop_2132
	movg	%xcc,	%i7,	%o4
	fbuge	%fcc3,	loop_2133
	bvs,pn	%icc,	loop_2134
loop_2132:
	brgz,a	%i4,	loop_2135
	nop
	setx	0x105236CD,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
loop_2133:
	sub	%l6,	%o0,	%o5
loop_2134:
	nop
	setx	0xEDAF0F62C0418204,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_2135:
	fmovsge	%icc,	%f12,	%f17
	fba,a	%fcc1,	loop_2136
	edge8	%g2,	%i2,	%o2
	wr	%g0,	0xea,	%asi
	stxa	%i5,	[%l7 + 0x28] %asi
	membar	#Sync
loop_2136:
	edge16	%l4,	%g7,	%g4
	faligndata	%f20,	%f6,	%f2
	fmovd	%f8,	%f20
	movn	%xcc,	%i1,	%g6
	taddcc	%l3,	0x1627,	%o6
	bleu,a	%xcc,	loop_2137
	stw	%g1,	[%l7 + 0x7C]
	fmovdvc	%icc,	%f9,	%f10
	tge	%xcc,	0x4
loop_2137:
	srax	%l1,	0x11,	%i6
	nop
	fitod	%f24,	%f30
	xnorcc	%g5,	0x1CCC,	%o3
	fpack32	%f10,	%f28,	%f16
	flush	%l7 + 0x78
	sll	%o7,	%g3,	%i0
	set	0x4E, %o3
	ldsha	[%l7 + %o3] 0x14,	%l5
	fmovdg	%icc,	%f1,	%f13
	orn	%o1,	0x120E,	%i3
	fabss	%f20,	%f6
	umulcc	%l2,	0x167B,	%l0
	movcc	%xcc,	%i7,	%o4
	fabsd	%f8,	%f28
	tvs	%icc,	0x2
	bn,pn	%xcc,	loop_2138
	tcs	%icc,	0x6
	ta	%icc,	0x7
	fpack32	%f6,	%f26,	%f24
loop_2138:
	tgu	%xcc,	0x4
	ldsb	[%l7 + 0x3D],	%i4
	tl	%xcc,	0x6
	andncc	%l6,	%o5,	%g2
	fmul8x16al	%f14,	%f14,	%f18
	add	%i2,	%o2,	%o0
	movn	%xcc,	%i5,	%g7
	movle	%icc,	%g4,	%l4
	bneg,pn	%xcc,	loop_2139
	sub	%g6,	%l3,	%i1
	srax	%g1,	%o6,	%l1
	fcmpgt32	%f18,	%f24,	%i6
loop_2139:
	umul	%o3,	%g5,	%o7
	move	%icc,	%g3,	%l5
	nop
	fitos	%f14,	%f18
	fstoi	%f18,	%f8
	fmul8sux16	%f2,	%f10,	%f10
	xnorcc	%i0,	%o1,	%l2
	tl	%icc,	0x6
	fpsub16s	%f6,	%f0,	%f16
	fcmpeq32	%f6,	%f22,	%i3
	andncc	%i7,	%l0,	%o4
	edge32	%l6,	%o5,	%g2
	fzeros	%f9
	tne	%icc,	0x7
	movleu	%xcc,	%i2,	%i4
	fone	%f22
	fmul8sux16	%f4,	%f10,	%f30
	srlx	%o2,	0x1C,	%o0
	movneg	%xcc,	%i5,	%g4
	xnorcc	%g7,	0x006C,	%g6
	fpadd16s	%f11,	%f11,	%f24
	mulx	%l3,	%l4,	%i1
	nop
	setx	loop_2140,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bne,a,pt	%xcc,	loop_2141
	edge32ln	%g1,	%l1,	%o6
	movrgez	%i6,	%o3,	%o7
loop_2140:
	edge32n	%g5,	%g3,	%l5
loop_2141:
	movcc	%xcc,	%i0,	%l2
	ldx	[%l7 + 0x78],	%i3
	edge8l	%i7,	%o1,	%l0
	movrgz	%o4,	0x0D8,	%l6
	brz,a	%o5,	loop_2142
	fand	%f20,	%f20,	%f28
	mulscc	%i2,	0x1E79,	%g2
	nop
	fitod	%f10,	%f28
	fdtos	%f28,	%f14
loop_2142:
	fxnors	%f30,	%f0,	%f26
	set	0x4C, %i4
	stwa	%o2,	[%l7 + %i4] 0x80
	mulx	%o0,	0x19A3,	%i5
	umulcc	%i4,	%g7,	%g4
	smulcc	%l3,	%l4,	%g6
	bcc	loop_2143
	nop
	set	0x18, %g6
	stw	%g1,	[%l7 + %g6]
	ta	%icc,	0x6
	movrlez	%i1,	0x11F,	%l1
loop_2143:
	srlx	%o6,	%i6,	%o3
	bl,pt	%xcc,	loop_2144
	edge32ln	%g5,	%g3,	%l5
	fmovse	%icc,	%f5,	%f5
	fba,a	%fcc0,	loop_2145
loop_2144:
	fsrc2	%f0,	%f10
	brgez	%i0,	loop_2146
	fmovdn	%xcc,	%f2,	%f1
loop_2145:
	bneg,a	%icc,	loop_2147
	fsrc1s	%f28,	%f11
loop_2146:
	sethi	0x1FD8,	%l2
	add	%i3,	%i7,	%o7
loop_2147:
	fandnot2	%f30,	%f4,	%f6
	orncc	%o1,	0x06FD,	%l0
	smul	%l6,	0x1805,	%o4
	tpos	%icc,	0x0
	edge16n	%o5,	%i2,	%o2
	tvs	%icc,	0x7
	ta	%icc,	0x6
	bneg	loop_2148
	subc	%o0,	%i5,	%g2
	movcs	%xcc,	%i4,	%g7
	fmovrdlz	%g4,	%f16,	%f2
loop_2148:
	movcc	%icc,	%l4,	%l3
	array32	%g1,	%i1,	%g6
	sub	%l1,	%i6,	%o3
	movvc	%xcc,	%o6,	%g5
	sra	%l5,	%g3,	%l2
	fnands	%f12,	%f18,	%f20
	taddcctv	%i3,	%i7,	%o7
	set	0x60, %g7
	swapa	[%l7 + %g7] 0x88,	%i0
	fmul8sux16	%f20,	%f2,	%f6
	nop
	setx	loop_2149,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%l0,	%o1,	%l6
	edge32n	%o5,	%i2,	%o4
	pdist	%f10,	%f12,	%f26
loop_2149:
	bgu	%icc,	loop_2150
	brgez,a	%o0,	loop_2151
	movg	%xcc,	%i5,	%g2
	ldub	[%l7 + 0x66],	%o2
loop_2150:
	movrgez	%i4,	%g4,	%g7
loop_2151:
	nop
	fitos	%f9,	%f25
	fstox	%f25,	%f28
	fxtos	%f28,	%f25
	subccc	%l4,	%g1,	%i1
	nop
	setx	loop_2152,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%xcc,	%g6,	%l3
	umul	%i6,	%l1,	%o6
	tcs	%icc,	0x1
loop_2152:
	fmovd	%f16,	%f10
	brlez	%o3,	loop_2153
	sub	%g5,	0x0BF4,	%g3
	taddcc	%l2,	0x0957,	%l5
	fmovsvc	%icc,	%f29,	%f13
loop_2153:
	for	%f18,	%f22,	%f18
	udivcc	%i7,	0x089F,	%i3
	fors	%f13,	%f23,	%f12
	fmul8sux16	%f12,	%f14,	%f30
	fmovdg	%xcc,	%f30,	%f27
	movgu	%xcc,	%i0,	%o7
	addccc	%l0,	0x1198,	%l6
	movge	%icc,	%o1,	%o5
	movrne	%o4,	%i2,	%o0
	sdivx	%g2,	0x1095,	%o2
	xor	%i4,	0x17EC,	%g4
	addcc	%g7,	%i5,	%g1
	edge32	%i1,	%l4,	%l3
	fbl,a	%fcc3,	loop_2154
	movne	%xcc,	%g6,	%i6
	smulcc	%l1,	0x0CCF,	%o6
	tne	%icc,	0x7
loop_2154:
	fnot1s	%f14,	%f13
	smul	%o3,	%g3,	%g5
	edge32	%l2,	%l5,	%i3
	taddcctv	%i0,	0x170C,	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l0,	%l6
	set	0x32, %o4
	lduba	[%l7 + %o4] 0x88,	%o7
	mova	%xcc,	%o5,	%o4
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x42] %asi,	%o1
	set	0x20, %g2
	stxa	%o0,	[%l7 + %g2] 0x2a
	membar	#Sync
	fnegd	%f14,	%f28
	lduw	[%l7 + 0x18],	%g2
	xnorcc	%i2,	%o2,	%i4
	movre	%g7,	0x288,	%i5
	fbn	%fcc0,	loop_2155
	mulscc	%g1,	0x1BD7,	%i1
	fsrc2s	%f31,	%f0
	sll	%l4,	0x03,	%l3
loop_2155:
	movvc	%xcc,	%g6,	%i6
	srlx	%l1,	0x14,	%g4
	nop
	setx	0x0F56C6A5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x1D649856,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f30,	%f23
	movrgez	%o3,	0x179,	%g3
	ta	%xcc,	0x1
	be	%xcc,	loop_2156
	fbule	%fcc0,	loop_2157
	sir	0x0422
	edge32n	%o6,	%l2,	%g5
loop_2156:
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i3
loop_2157:
	addcc	%l5,	0x007A,	%i7
	fmovrslz	%l0,	%f8,	%f7
	fabss	%f15,	%f22
	bleu	%icc,	loop_2158
	movrgz	%l6,	%o7,	%o5
	fands	%f5,	%f5,	%f15
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x42] %asi,	%i0
loop_2158:
	tneg	%icc,	0x2
	tsubcc	%o4,	0x056C,	%o1
	tsubcctv	%g2,	0x1F36,	%i2
	tvs	%xcc,	0x5
	sethi	0x0A36,	%o0
	movrne	%o2,	%i4,	%g7
	fmovsne	%xcc,	%f11,	%f25
	movrne	%i5,	0x140,	%i1
	movcc	%xcc,	%g1,	%l3
	ldd	[%l7 + 0x48],	%l4
	sra	%i6,	%l1,	%g4
	movvc	%xcc,	%o3,	%g6
	tcs	%xcc,	0x4
	fmovsne	%icc,	%f3,	%f9
	fmul8ulx16	%f30,	%f16,	%f18
	srax	%o6,	0x0D,	%l2
	fandnot2s	%f16,	%f17,	%f25
	set	0x30, %l2
	sta	%f23,	[%l7 + %l2] 0x18
	fandnot2s	%f12,	%f10,	%f11
	sethi	0x0ECD,	%g5
	bn,pt	%xcc,	loop_2159
	nop
	setx	0xF4E817241E3C6332,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x1B4BFDCC2080874D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f6,	%f18
	udiv	%i3,	0x071F,	%l5
	nop
	setx	0xCC3B6D066B40E525,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f20
loop_2159:
	fmul8x16	%f16,	%f22,	%f0
	sll	%g3,	%l0,	%l6
	fand	%f30,	%f0,	%f30
	fnors	%f28,	%f29,	%f10
	bne,a,pn	%icc,	loop_2160
	sdivcc	%i7,	0x1A41,	%o5
	alignaddrl	%o7,	%i0,	%o1
	addc	%o4,	0x1169,	%i2
loop_2160:
	fpsub32s	%f8,	%f1,	%f18
	tne	%icc,	0x1
	fornot1s	%f9,	%f25,	%f18
	subc	%g2,	0x0991,	%o0
	tcc	%xcc,	0x2
	fnot2	%f8,	%f16
	tg	%icc,	0x6
	edge16n	%o2,	%g7,	%i5
	alignaddr	%i1,	%g1,	%i4
	mulscc	%l3,	%i6,	%l1
	fpadd16	%f8,	%f28,	%f30
	bneg	loop_2161
	fmovscc	%xcc,	%f8,	%f29
	movre	%l4,	%o3,	%g6
	fmovsvs	%xcc,	%f14,	%f17
loop_2161:
	fnegs	%f1,	%f25
	bcc	%xcc,	loop_2162
	fbuge,a	%fcc1,	loop_2163
	fbn,a	%fcc1,	loop_2164
	fbne,a	%fcc1,	loop_2165
loop_2162:
	fsrc1s	%f6,	%f13
loop_2163:
	mulx	%o6,	0x100F,	%g4
loop_2164:
	fornot2s	%f9,	%f9,	%f11
loop_2165:
	movge	%xcc,	%l2,	%g5
	movne	%xcc,	%i3,	%l5
	fbule	%fcc2,	loop_2166
	tn	%xcc,	0x5
	fmovsn	%icc,	%f31,	%f19
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l0
loop_2166:
	umul	%l6,	%i7,	%o5
	tg	%icc,	0x5
	udivcc	%o7,	0x0338,	%g3
	subc	%o1,	%o4,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f8,	%f3,	%f31
	flush	%l7 + 0x30
	udivx	%g2,	0x0B91,	%i0
	nop
	setx	0x9CFACCA7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x9CAFCD1B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f19,	%f17
	edge32	%o0,	%o2,	%g7
	tne	%xcc,	0x7
	movneg	%icc,	%i5,	%i1
	fmovsl	%icc,	%f3,	%f30
	tgu	%xcc,	0x6
	edge32ln	%i4,	%g1,	%l3
	tcc	%xcc,	0x5
	fones	%f15
	nop
	setx	0x6070C430,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	nop
	setx	0x20455C66,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	fornot2s	%f21,	%f17,	%f10
	andcc	%i6,	%l4,	%o3
	fmovsvs	%xcc,	%f22,	%f16
	subccc	%g6,	0x11CF,	%o6
	fone	%f8
	nop
	set	0x64, %i6
	sth	%g4,	[%l7 + %i6]
	ble,a,pn	%icc,	loop_2167
	for	%f20,	%f8,	%f12
	subccc	%l2,	%l1,	%i3
	membar	0x64
loop_2167:
	movn	%xcc,	%l5,	%l0
	edge16n	%g5,	%l6,	%o5
	lduw	[%l7 + 0x4C],	%i7
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x14,	 0x0
	stw	%o1,	[%l7 + 0x1C]
	taddcctv	%o4,	%g3,	%g2
	fmul8sux16	%f30,	%f30,	%f14
	movgu	%icc,	%i2,	%i0
	tn	%icc,	0x4
	movle	%icc,	%o2,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%o0,	loop_2168
	nop
	setx	loop_2169,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orn	%i5,	%i4,	%g1
	movleu	%icc,	%l3,	%i6
loop_2168:
	taddcc	%i1,	%o3,	%l4
loop_2169:
	tneg	%xcc,	0x3
	brnz	%o6,	loop_2170
	nop
	fitos	%f27,	%f21
	set	0x30, %l0
	sta	%f22,	[%l7 + %l0] 0x88
loop_2170:
	te	%icc,	0x7
	movne	%icc,	%g4,	%g6
	bshuffle	%f4,	%f24,	%f20
	fbn	%fcc0,	loop_2171
	fmul8x16	%f8,	%f16,	%f14
	bshuffle	%f8,	%f22,	%f28
	nop
	setx	0xC952F570BC9FECBB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x785D3E0C8B56CE5D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f30,	%f12
loop_2171:
	nop
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x15,	%f16
	edge16ln	%l1,	%i3,	%l2
	alignaddr	%l5,	%g5,	%l0
	edge8	%l6,	%o5,	%i7
	srax	%o1,	%o4,	%o7
	fmovsa	%icc,	%f11,	%f25
	brlz,a	%g2,	loop_2172
	fpadd16	%f22,	%f14,	%f24
	bg,a	%xcc,	loop_2173
	fpackfix	%f6,	%f15
loop_2172:
	sub	%i2,	%i0,	%g3
	movre	%g7,	%o0,	%i5
loop_2173:
	nop
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x17] %asi,	%o2
	sth	%i4,	[%l7 + 0x78]
	edge8l	%l3,	%g1,	%i6
	udiv	%o3,	0x0702,	%i1
	sdivx	%o6,	0x09B9,	%g4
	ldsb	[%l7 + 0x63],	%g6
	nop
	setx	0x80734C0C,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	edge16	%l4,	%l1,	%i3
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x44] %asi,	%l2
	fnands	%f30,	%f18,	%f26
	bge,pn	%icc,	loop_2174
	sth	%l5,	[%l7 + 0x42]
	fmovsneg	%xcc,	%f7,	%f23
	edge32n	%g5,	%l0,	%l6
loop_2174:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x36] %asi,	%o5
	movre	%o1,	%o4,	%i7
	srl	%g2,	0x0B,	%o7
	fba	%fcc2,	loop_2175
	srlx	%i2,	0x1C,	%i0
	edge32n	%g7,	%o0,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2175:
	movrne	%i5,	%o2,	%i4
	mova	%xcc,	%g1,	%i6
	udivcc	%o3,	0x04BD,	%l3
	xor	%i1,	0x02C5,	%g4
	tsubcc	%o6,	0x1419,	%l4
	tsubcc	%l1,	0x152F,	%i3
	sdivx	%l2,	0x0669,	%g6
	set	0x7E, %g5
	lduha	[%l7 + %g5] 0x88,	%g5
	nop
	setx	0x56A81813,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x970DD835,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f13,	%f4
	edge16n	%l0,	%l6,	%l5
	tne	%xcc,	0x1
	movrgez	%o5,	0x005,	%o4
	fmovdg	%xcc,	%f26,	%f14
	and	%o1,	0x0432,	%g2
	bpos,a	loop_2176
	bvs,a	%icc,	loop_2177
	fba	%fcc0,	loop_2178
	srax	%o7,	0x03,	%i7
loop_2176:
	nop
	setx	0xD07768D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
loop_2177:
	movvs	%xcc,	%i0,	%g7
loop_2178:
	swap	[%l7 + 0x70],	%o0
	smulcc	%i2,	0x1DE5,	%i5
	mova	%xcc,	%g3,	%i4
	nop
	set	0x15, %o6
	ldub	[%l7 + %o6],	%g1
	xnor	%o2,	%i6,	%o3
	stx	%l3,	[%l7 + 0x40]
	fbule,a	%fcc2,	loop_2179
	fpsub16	%f20,	%f24,	%f4
	set	0x0B, %i7
	ldstuba	[%l7 + %i7] 0x89,	%g4
loop_2179:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i1,	%o6
	brnz,a	%l4,	loop_2180
	sdivx	%i3,	0x17AC,	%l2
	faligndata	%f16,	%f24,	%f20
	nop
	fitod	%f10,	%f18
	fdtos	%f18,	%f4
loop_2180:
	fand	%f28,	%f16,	%f30
	edge16n	%l1,	%g6,	%l0
	fmovsneg	%icc,	%f14,	%f5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x2C] %asi,	%f17
	fsrc2s	%f12,	%f26
	tvs	%xcc,	0x5
	fzero	%f26
	fornot2s	%f8,	%f31,	%f0
	udivx	%l6,	0x0FDF,	%g5
	tne	%icc,	0x3
	movg	%icc,	%l5,	%o5
	tneg	%icc,	0x2
	srax	%o1,	%o4,	%g2
	fone	%f24
	andncc	%o7,	%i7,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f22,	%f28,	%o0
	fbu,a	%fcc2,	loop_2181
	fmul8x16al	%f15,	%f3,	%f0
	add	%i2,	%i0,	%g3
	fexpand	%f8,	%f0
loop_2181:
	fmovdgu	%xcc,	%f15,	%f13
	fcmpne16	%f4,	%f18,	%i5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i4,	%o2
	sllx	%i6,	0x00,	%o3
	sll	%l3,	0x1B,	%g4
	udivx	%g1,	0x14BE,	%i1
	fornot2s	%f10,	%f9,	%f31
	fands	%f24,	%f5,	%f12
	tgu	%icc,	0x4
	fbn	%fcc2,	loop_2182
	fnegs	%f10,	%f1
	membar	0x3E
	movcc	%xcc,	%l4,	%i3
loop_2182:
	tcs	%xcc,	0x0
	lduw	[%l7 + 0x28],	%o6
	std	%f14,	[%l7 + 0x30]
	mova	%xcc,	%l2,	%g6
	fmovrsgez	%l0,	%f14,	%f17
	srl	%l1,	0x03,	%g5
	mulx	%l6,	%o5,	%l5
	movrlez	%o4,	%g2,	%o7
	movcc	%icc,	%o1,	%i7
	stx	%g7,	[%l7 + 0x78]
	fbl,a	%fcc1,	loop_2183
	movne	%xcc,	%o0,	%i2
	array16	%g3,	%i0,	%i4
	edge16n	%i5,	%i6,	%o3
loop_2183:
	nop
	fitod	%f12,	%f10
	fdtos	%f10,	%f18
	movvc	%icc,	%o2,	%l3
	movgu	%xcc,	%g4,	%g1
	sub	%i1,	%l4,	%o6
	nop
	setx	0xAFF6E8CB5FD62650,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f14
	movcc	%icc,	%i3,	%g6
	bleu,a,pt	%icc,	loop_2184
	edge32ln	%l2,	%l0,	%g5
	movrgz	%l6,	%o5,	%l5
	fblg,a	%fcc1,	loop_2185
loop_2184:
	st	%f1,	[%l7 + 0x60]
	fmovdl	%xcc,	%f30,	%f24
	move	%xcc,	%o4,	%l1
loop_2185:
	fmovda	%xcc,	%f3,	%f7
	nop
	setx	loop_2186,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%o7,	0x02A,	%o1
	fornot2	%f30,	%f12,	%f18
	bg,a	loop_2187
loop_2186:
	ba	loop_2188
	bn	loop_2189
	alignaddrl	%i7,	%g2,	%g7
loop_2187:
	movcs	%icc,	%i2,	%o0
loop_2188:
	tne	%icc,	0x3
loop_2189:
	sir	0x18FB
	tcs	%xcc,	0x0
	orncc	%g3,	0x1B20,	%i4
	srl	%i5,	%i6,	%i0
	st	%f19,	[%l7 + 0x1C]
	orn	%o3,	%l3,	%o2
	fble,a	%fcc3,	loop_2190
	array32	%g4,	%i1,	%l4
	tleu	%icc,	0x1
	taddcctv	%o6,	%i3,	%g6
loop_2190:
	fmovsneg	%icc,	%f29,	%f18
	tpos	%xcc,	0x6
	tvc	%icc,	0x1
	mova	%icc,	%g1,	%l2
	fmovsn	%xcc,	%f2,	%f13
	fmovsvc	%xcc,	%f29,	%f20
	ble,a,pn	%xcc,	loop_2191
	tneg	%xcc,	0x6
	sra	%l0,	0x0A,	%l6
	smul	%g5,	%o5,	%l5
loop_2191:
	add	%l1,	%o7,	%o4
	fmul8x16	%f4,	%f24,	%f0
	movcc	%xcc,	%o1,	%g2
	array32	%g7,	%i2,	%o0
	srax	%i7,	0x0B,	%i4
	popc	%g3,	%i6
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x70] %asi,	%i4
	be	%icc,	loop_2192
	sdivcc	%i0,	0x1E2A,	%o3
	smul	%o2,	0x08F5,	%l3
	nop
	setx	loop_2193,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2192:
	array32	%i1,	%g4,	%o6
	movn	%xcc,	%i3,	%g6
	fnegd	%f4,	%f28
loop_2193:
	brz,a	%g1,	loop_2194
	fbe	%fcc2,	loop_2195
	fbe,a	%fcc0,	loop_2196
	prefetch	[%l7 + 0x08],	 0x0
loop_2194:
	fmuld8ulx16	%f26,	%f6,	%f10
loop_2195:
	fpsub32s	%f18,	%f17,	%f25
loop_2196:
	ldstub	[%l7 + 0x1A],	%l2
	nop
	setx	0xD0C89A5D907D375D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	tsubcc	%l0,	0x1DA2,	%l4
	fcmpgt32	%f10,	%f12,	%g5
	fbg,a	%fcc1,	loop_2197
	edge32	%o5,	%l5,	%l6
	edge16	%l1,	%o4,	%o1
	bcc,a	loop_2198
loop_2197:
	umulcc	%g2,	%g7,	%o7
	set	0x30, %o2
	stwa	%o0,	[%l7 + %o2] 0x89
loop_2198:
	bcs	loop_2199
	and	%i2,	0x1604,	%i7
	srlx	%g3,	%i6,	%i4
	sub	%i5,	%i0,	%o2
loop_2199:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o3,	%i1
	set	0x14, %o1
	ldstuba	[%l7 + %o1] 0x19,	%l3
	xnor	%o6,	0x0E33,	%i3
	fpmerge	%f25,	%f0,	%f28
	smulcc	%g6,	0x177B,	%g4
	xnorcc	%l2,	%l0,	%g1
	srl	%g5,	0x17,	%o5
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x14,	%f16
	ba	%icc,	loop_2200
	movgu	%xcc,	%l5,	%l6
	tcs	%icc,	0x5
	udivcc	%l4,	0x0CF9,	%l1
loop_2200:
	srl	%o1,	0x06,	%g2
	bleu	loop_2201
	add	%o4,	%o7,	%g7
	movcs	%xcc,	%i2,	%i7
	st	%f26,	[%l7 + 0x78]
loop_2201:
	nop
	set	0x20, %i0
	ldx	[%l7 + %i0],	%g3
	fmovdne	%icc,	%f10,	%f11
	fandnot2	%f24,	%f16,	%f16
	flush	%l7 + 0x5C
	fsrc1	%f2,	%f2
	addcc	%i6,	%i4,	%o0
	movg	%icc,	%i0,	%i5
	nop
	setx	0x8B2E1D61,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC669178B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f30,	%f2
	fmovsneg	%icc,	%f31,	%f20
	movrlez	%o3,	0x0C5,	%o2
	xorcc	%l3,	%i1,	%i3
	move	%icc,	%g6,	%o6
	array32	%l2,	%l0,	%g4
	xnorcc	%g5,	0x1292,	%o5
	tvs	%icc,	0x3
	nop
	setx	0x1075C333,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	xnorcc	%l5,	0x0592,	%l6
	add	%g1,	0x17AA,	%l1
	fbg	%fcc0,	loop_2202
	fmovrdlz	%l4,	%f24,	%f30
	std	%f6,	[%l7 + 0x60]
	tle	%icc,	0x3
loop_2202:
	bn,pt	%xcc,	loop_2203
	movpos	%xcc,	%g2,	%o1
	fmovdvs	%icc,	%f13,	%f30
	tsubcc	%o7,	%o4,	%i2
loop_2203:
	tcc	%icc,	0x0
	brnz,a	%i7,	loop_2204
	tl	%icc,	0x7
	srlx	%g7,	0x16,	%g3
	edge8n	%i6,	%o0,	%i0
loop_2204:
	sdivcc	%i5,	0x107E,	%i4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x0c,	%o2,	%l3
	movvs	%xcc,	%o3,	%i3
	move	%xcc,	%g6,	%o6
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f4
	fxtod	%f4,	%f20
	srax	%l2,	0x0F,	%i1
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l0
	fblg,a	%fcc0,	loop_2205
	andcc	%g5,	0x00F6,	%o5
	movn	%xcc,	%g4,	%l5
	and	%g1,	0x0BCF,	%l1
loop_2205:
	fnot2	%f26,	%f16
	tpos	%xcc,	0x1
	ldstub	[%l7 + 0x0F],	%l6
	brgz	%l4,	loop_2206
	fnegd	%f20,	%f8
	tcs	%icc,	0x3
	bge,a	loop_2207
loop_2206:
	te	%xcc,	0x6
	bge,a	%xcc,	loop_2208
	udivcc	%g2,	0x04B7,	%o7
loop_2207:
	movle	%icc,	%o1,	%o4
	fandnot2s	%f6,	%f12,	%f20
loop_2208:
	tg	%xcc,	0x5
	fpadd16	%f22,	%f30,	%f18
	mova	%xcc,	%i7,	%i2
	edge32n	%g3,	%i6,	%g7
	fbue,a	%fcc0,	loop_2209
	nop
	setx loop_2210, %l0, %l1
	jmpl %l1, %o0
	fmovrdlez	%i5,	%f6,	%f0
	movgu	%icc,	%i0,	%i4
loop_2209:
	stb	%o2,	[%l7 + 0x42]
loop_2210:
	te	%icc,	0x1
	xnor	%o3,	0x09E4,	%i3
	nop
	setx	0x3DAA2A29405DF8B7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	sub	%l3,	%o6,	%l2
	movpos	%xcc,	%g6,	%l0
	movg	%icc,	%g5,	%o5
	fmovdn	%icc,	%f10,	%f26
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i1,	%g4
	sub	%g1,	0x1028,	%l5
	sethi	0x04CE,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l4,	0x0D,	%g2
	edge16ln	%o7,	%o1,	%o4
	nop
	setx	loop_2211,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovde	%xcc,	%f29,	%f31
	movn	%icc,	%i7,	%l6
	tge	%icc,	0x5
loop_2211:
	sra	%i2,	%g3,	%g7
	nop
	fitos	%f1,	%f17
	fstox	%f17,	%f12
	fxtos	%f12,	%f0
	fabss	%f23,	%f29
	swap	[%l7 + 0x2C],	%i6
	fbu	%fcc0,	loop_2212
	fmovdg	%xcc,	%f26,	%f0
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x62] %asi,	%o0
loop_2212:
	edge8n	%i0,	%i4,	%o2
	sth	%i5,	[%l7 + 0x38]
	fmovrdlez	%o3,	%f26,	%f0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x19] %asi,	%l3
	bn,pn	%xcc,	loop_2213
	edge8l	%i3,	%o6,	%l2
	addcc	%g6,	0x085F,	%g5
	movl	%xcc,	%l0,	%i1
loop_2213:
	fxor	%f8,	%f20,	%f12
	bne	loop_2214
	bg,pn	%xcc,	loop_2215
	xnor	%g4,	0x1EA8,	%g1
	tvc	%icc,	0x7
loop_2214:
	xnor	%o5,	%l1,	%l5
loop_2215:
	umul	%l4,	0x0E0E,	%o7
	sll	%o1,	0x0D,	%o4
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x14] %asi,	%f12
	fpadd16s	%f20,	%f27,	%f16
	fmovsgu	%icc,	%f12,	%f7
	tsubcc	%g2,	%l6,	%i2
	orncc	%g3,	%i7,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz,a	%g7,	loop_2216
	sethi	0x0C83,	%i0
	fbuge	%fcc2,	loop_2217
	nop
	setx	0xACF20E71,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x20B1ED9E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f7,	%f6
loop_2216:
	bleu,a,pn	%xcc,	loop_2218
	xor	%i4,	%o2,	%i5
loop_2217:
	fmovrdne	%o3,	%f6,	%f16
	fmuld8sux16	%f0,	%f10,	%f22
loop_2218:
	movneg	%xcc,	%o0,	%l3
	fbe	%fcc3,	loop_2219
	tvc	%icc,	0x0
	sllx	%o6,	%i3,	%g6
	nop
	setx	loop_2220,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2219:
	orn	%g5,	%l0,	%i1
	movpos	%xcc,	%l2,	%g1
	or	%o5,	%l1,	%l5
loop_2220:
	edge8n	%l4,	%g4,	%o1
	edge16l	%o4,	%o7,	%g2
	nop
	set	0x6C, %g1
	stw	%l6,	[%l7 + %g1]
	set	0x38, %o7
	prefetcha	[%l7 + %o7] 0x15,	 0x3
	udivx	%i7,	0x03C6,	%i6
	nop
	setx	0xEFB3B34AB19253B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f16
	membar	0x5F
	bneg	loop_2221
	movrne	%g7,	0x17F,	%i0
	nop
	set	0x68, %l1
	stw	%i4,	[%l7 + %l1]
	tle	%icc,	0x3
loop_2221:
	fba	%fcc2,	loop_2222
	edge32n	%o2,	%i5,	%i2
	bn,pn	%icc,	loop_2223
	sll	%o0,	0x17,	%l3
loop_2222:
	bvs,a,pt	%xcc,	loop_2224
	edge8n	%o6,	%i3,	%g6
loop_2223:
	sllx	%o3,	0x02,	%g5
	fnands	%f28,	%f12,	%f6
loop_2224:
	sdivcc	%i1,	0x01E7,	%l0
	srl	%g1,	%o5,	%l2
	sdiv	%l1,	0x1423,	%l4
	fmovspos	%icc,	%f10,	%f30
	tpos	%xcc,	0x6
	tne	%icc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f12,	%f10
	fstoi	%f10,	%f31
	ble,pn	%xcc,	loop_2225
	andn	%g4,	%o1,	%o4
	subc	%l5,	%o7,	%l6
	srlx	%g2,	%g3,	%i7
loop_2225:
	fmovda	%xcc,	%f21,	%f30
	edge8n	%g7,	%i6,	%i0
	tvc	%xcc,	0x2
	fabss	%f14,	%f3
	orcc	%i4,	%i5,	%i2
	mulscc	%o2,	0x0813,	%l3
	udivx	%o6,	0x1233,	%o0
	tle	%xcc,	0x6
	tle	%xcc,	0x2
	fmovrdlz	%g6,	%f10,	%f8
	fmovdg	%icc,	%f5,	%f16
	orcc	%o3,	0x0BC1,	%i3
	brgez,a	%i1,	loop_2226
	movpos	%icc,	%l0,	%g1
	movvs	%icc,	%g5,	%l2
	set	0x5E, %i5
	ldstuba	[%l7 + %i5] 0x11,	%l1
loop_2226:
	call	loop_2227
	nop
	fitos	%f8,	%f8
	fstod	%f8,	%f10
	fnegd	%f14,	%f10
	fmovrsgez	%o5,	%f17,	%f12
loop_2227:
	nop
	set	0x64, %l5
	lduha	[%l7 + %l5] 0x04,	%g4
	bvs,a	loop_2228
	taddcc	%o1,	%l4,	%o4
	smulcc	%l5,	%l6,	%g2
	edge32l	%o7,	%i7,	%g7
loop_2228:
	popc	%g3,	%i6
	ldub	[%l7 + 0x09],	%i4
	edge8	%i0,	%i5,	%i2
	orn	%o2,	%l3,	%o6
	movvc	%xcc,	%o0,	%o3
	tne	%icc,	0x3
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i3
	movpos	%xcc,	%i1,	%g6
	array8	%l0,	%g1,	%g5
	fmovrsne	%l2,	%f22,	%f4
	xnorcc	%l1,	0x058D,	%g4
	fornot1	%f8,	%f4,	%f4
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%o4
	fsrc2	%f2,	%f18
	fcmpne16	%f24,	%f16,	%l4
	fmovrsne	%o1,	%f5,	%f1
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x54] %asi,	%l5
	tl	%xcc,	0x5
	nop
	setx	loop_2229,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovse	%icc,	%f16,	%f16
	alignaddrl	%o4,	%g2,	%l6
	fba	%fcc1,	loop_2230
loop_2229:
	fpadd32s	%f27,	%f16,	%f11
	fbug,a	%fcc1,	loop_2231
	smul	%o7,	%i7,	%g7
loop_2230:
	fmovsne	%icc,	%f13,	%f29
	sdivcc	%g3,	0x0D18,	%i6
loop_2231:
	edge8l	%i0,	%i5,	%i4
	tvs	%icc,	0x5
	xnorcc	%o2,	0x1F91,	%l3
	edge8ln	%o6,	%i2,	%o3
	fexpand	%f10,	%f6
	alignaddr	%o0,	%i1,	%i3
	fxnors	%f20,	%f18,	%f26
	sllx	%l0,	%g1,	%g6
	movre	%l2,	0x3B2,	%l1
	ta	%xcc,	0x5
	ldsw	[%l7 + 0x18],	%g4
	umulcc	%o5,	%l4,	%g5
	edge16	%o1,	%o4,	%g2
	movrgz	%l5,	0x06F,	%o7
	movl	%xcc,	%i7,	%l6
	nop
	setx loop_2232, %l0, %l1
	jmpl %l1, %g7
	edge16ln	%i6,	%i0,	%g3
	andn	%i5,	0x150A,	%i4
	wr	%g0,	0x11,	%asi
	stwa	%l3,	[%l7 + 0x4C] %asi
loop_2232:
	fmovsg	%icc,	%f22,	%f1
	edge16	%o6,	%i2,	%o2
	fmovdl	%xcc,	%f7,	%f15
	nop
	fitod	%f12,	%f8
	fdtoi	%f8,	%f0
	movre	%o3,	%i1,	%i3
	sll	%l0,	%g1,	%o0
	umulcc	%g6,	%l1,	%g4
	alignaddr	%l2,	%o5,	%g5
	fmovs	%f17,	%f21
	ta	%xcc,	0x7
	set	0x7C, %l4
	lda	[%l7 + %l4] 0x04,	%f17
	umulcc	%l4,	%o1,	%o4
	fcmpgt32	%f6,	%f2,	%g2
	sub	%l5,	0x157B,	%o7
	udivcc	%i7,	0x104C,	%g7
	tg	%xcc,	0x7
	fcmpne16	%f4,	%f0,	%i6
	movleu	%xcc,	%l6,	%i0
	fornot1	%f8,	%f12,	%f16
	fbu	%fcc3,	loop_2233
	ldsh	[%l7 + 0x70],	%i5
	smul	%g3,	0x00A3,	%i4
	srl	%o6,	%i2,	%l3
loop_2233:
	array8	%o3,	%i1,	%o2
	ldsb	[%l7 + 0x27],	%l0
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x51] %asi,	%i3
	udivcc	%o0,	0x1C9C,	%g6
	fmovdcs	%icc,	%f23,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g1,	0x1E,	%l1
	movrlez	%g4,	%o5,	%l2
	fmul8x16	%f17,	%f28,	%f4
	fnot1s	%f22,	%f21
	array16	%g5,	%l4,	%o4
	nop
	setx	loop_2234,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16	%o1,	%l5,	%g2
	st	%f22,	[%l7 + 0x24]
	movle	%icc,	%i7,	%g7
loop_2234:
	alignaddrl	%i6,	%l6,	%o7
	sra	%i5,	0x1B,	%g3
	prefetch	[%l7 + 0x14],	 0x1
	fpsub32	%f20,	%f22,	%f12
	fornot1s	%f9,	%f22,	%f3
	bvs,a	loop_2235
	fbne,a	%fcc3,	loop_2236
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i0,	0x07C,	%i4
loop_2235:
	nop
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x1e
	membar	#Sync
loop_2236:
	addccc	%i2,	%l3,	%o3
	fbn	%fcc0,	loop_2237
	smulcc	%o6,	0x1FEE,	%o2
	movge	%xcc,	%l0,	%i1
	stb	%o0,	[%l7 + 0x63]
loop_2237:
	tcs	%icc,	0x3
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i3,	%g6
	nop
	set	0x68, %o0
	std	%f12,	[%l7 + %o0]
	subc	%l1,	%g4,	%g1
	stbar
	fbuge,a	%fcc3,	loop_2238
	and	%l2,	%g5,	%o5
	fmovrdne	%o4,	%f12,	%f16
	edge32l	%l4,	%l5,	%o1
loop_2238:
	udiv	%i7,	0x08A2,	%g2
	bn,a	loop_2239
	fbul	%fcc1,	loop_2240
	edge32ln	%i6,	%g7,	%l6
	nop
	fitod	%f4,	%f4
	fdtoi	%f4,	%f14
loop_2239:
	ta	%xcc,	0x7
loop_2240:
	mulx	%i5,	%g3,	%o7
	movrlez	%i0,	%i2,	%l3
	andcc	%o3,	%i4,	%o2
	sdiv	%l0,	0x02DF,	%i1
	orncc	%o0,	%o6,	%g6
	bgu,pn	%xcc,	loop_2241
	brz,a	%l1,	loop_2242
	umul	%i3,	0x18D5,	%g1
	andcc	%l2,	%g5,	%o5
loop_2241:
	fbue	%fcc2,	loop_2243
loop_2242:
	tcs	%icc,	0x1
	mulx	%g4,	0x09B6,	%o4
	smul	%l4,	%o1,	%l5
loop_2243:
	edge16l	%g2,	%i6,	%g7
	subccc	%l6,	0x0DCE,	%i5
	addc	%i7,	%g3,	%i0
	tl	%xcc,	0x2
	subcc	%i2,	%o7,	%l3
	array8	%o3,	%o2,	%l0
	nop
	fitos	%f4,	%f3
	smul	%i4,	0x1FF7,	%o0
	fmovrslez	%i1,	%f30,	%f5
	movle	%xcc,	%o6,	%g6
	fcmple32	%f18,	%f24,	%l1
	bl,a	%icc,	loop_2244
	sir	0x19C6
	xorcc	%g1,	%i3,	%g5
	movrlez	%l2,	%o5,	%o4
loop_2244:
	mova	%xcc,	%l4,	%o1
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f20
	fxtod	%f20,	%f8
	fornot1s	%f1,	%f8,	%f30
	ble	loop_2245
	tge	%xcc,	0x3
	edge32ln	%l5,	%g2,	%g4
	orn	%g7,	%i6,	%l6
loop_2245:
	addcc	%i7,	0x001A,	%g3
	sdivcc	%i0,	0x03B5,	%i2
	nop
	fitod	%f31,	%f8
	nop
	setx	0x38C8D91E3E26730E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f0
	edge8l	%i5,	%l3,	%o7
	fpadd16s	%f31,	%f4,	%f22
	be	%xcc,	loop_2246
	movcs	%xcc,	%o2,	%l0
	movne	%icc,	%o3,	%i4
	edge32	%o0,	%i1,	%g6
loop_2246:
	fmovrsgz	%l1,	%f18,	%f0
	array32	%g1,	%o6,	%i3
	movleu	%xcc,	%l2,	%o5
	bn	%icc,	loop_2247
	bg,a	%xcc,	loop_2248
	brgz,a	%g5,	loop_2249
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f4
	fxtod	%f4,	%f14
loop_2247:
	array32	%l4,	%o1,	%o4
loop_2248:
	movrgz	%l5,	0x368,	%g2
loop_2249:
	sub	%g7,	0x0CC5,	%g4
	tsubcctv	%l6,	%i7,	%i6
	nop
	set	0x20, %g4
	ldd	[%l7 + %g4],	%f2
	tg	%xcc,	0x4
	umulcc	%i0,	0x18BF,	%g3
	popc	%i5,	%l3
	fble,a	%fcc0,	loop_2250
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o7,	%i2,	%o2
	nop
	fitos	%f7,	%f0
	fstod	%f0,	%f8
loop_2250:
	nop
	fitos	%f14,	%f21
	fstox	%f21,	%f2
	tpos	%xcc,	0x4
	movvc	%xcc,	%o3,	%i4
	mulx	%o0,	%i1,	%g6
	tcs	%xcc,	0x2
	fmovdcs	%xcc,	%f8,	%f4
	fblg,a	%fcc3,	loop_2251
	movgu	%icc,	%l1,	%g1
	fabsd	%f0,	%f4
	orn	%o6,	%i3,	%l2
loop_2251:
	xor	%l0,	0x0158,	%o5
	tpos	%icc,	0x5
	fmovrdgez	%l4,	%f20,	%f16
	sllx	%g5,	0x06,	%o4
	bcc,a,pn	%xcc,	loop_2252
	sethi	0x025D,	%l5
	xnor	%o1,	%g7,	%g4
	edge16n	%l6,	%g2,	%i7
loop_2252:
	movvs	%xcc,	%i0,	%i6
	subcc	%g3,	%l3,	%i5
	ta	%xcc,	0x6
	ble,a	loop_2253
	tvc	%xcc,	0x5
	brgz,a	%i2,	loop_2254
	tcs	%icc,	0x7
loop_2253:
	nop
	set	0x54, %o5
	lda	[%l7 + %o5] 0x15,	%f28
loop_2254:
	taddcctv	%o2,	0x1AFA,	%o3
	tcc	%xcc,	0x5
	subcc	%i4,	0x0C57,	%o7
	srl	%o0,	0x15,	%g6
	brlez	%l1,	loop_2255
	ldstub	[%l7 + 0x73],	%g1
	edge32	%i1,	%i3,	%l2
	set	0x50, %o3
	stwa	%l0,	[%l7 + %o3] 0x2f
	membar	#Sync
loop_2255:
	ble,a	%xcc,	loop_2256
	sub	%o6,	0x0934,	%o5
	fbn,a	%fcc3,	loop_2257
	stb	%g5,	[%l7 + 0x16]
loop_2256:
	tgu	%xcc,	0x6
	tne	%icc,	0x2
loop_2257:
	ta	%icc,	0x7
	alignaddrl	%o4,	%l5,	%o1
	fnot1	%f20,	%f2
	wr	%g0,	0x2b,	%asi
	stha	%l4,	[%l7 + 0x32] %asi
	membar	#Sync
	fmovdvs	%xcc,	%f16,	%f16
	tsubcctv	%g4,	%g7,	%l6
	add	%i7,	0x15E2,	%g2
	xnorcc	%i0,	0x19FF,	%g3
	movl	%xcc,	%i6,	%l3
	and	%i2,	%o2,	%i5
	edge16n	%i4,	%o7,	%o0
	movrlez	%g6,	%l1,	%o3
	fxor	%f26,	%f28,	%f4
	fmovdgu	%xcc,	%f8,	%f16
	tneg	%xcc,	0x0
	srax	%g1,	0x16,	%i1
	fblg	%fcc0,	loop_2258
	flush	%l7 + 0x30
	tg	%icc,	0x5
	fpsub32s	%f10,	%f24,	%f4
loop_2258:
	tcs	%xcc,	0x1
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x88
	tcs	%xcc,	0x4
	tsubcc	%l2,	%l0,	%i3
	udiv	%o5,	0x11D2,	%g5
	orn	%o4,	0x1FB1,	%o6
	orncc	%o1,	0x1423,	%l5
	andn	%g4,	0x06F6,	%l4
	nop
	setx loop_2259, %l0, %l1
	jmpl %l1, %l6
	bn,pn	%xcc,	loop_2260
	popc	%g7,	%i7
	swap	[%l7 + 0x4C],	%g2
loop_2259:
	bg	%xcc,	loop_2261
loop_2260:
	edge16n	%g3,	%i0,	%l3
	movre	%i2,	%o2,	%i6
	umul	%i5,	0x1723,	%o7
loop_2261:
	bne	%icc,	loop_2262
	udiv	%i4,	0x0793,	%o0
	be,a	loop_2263
	ld	[%l7 + 0x48],	%f8
loop_2262:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2263:
	fble	%fcc2,	loop_2264
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%g6,	%o3
	fmovdn	%icc,	%f16,	%f15
loop_2264:
	edge32n	%g1,	%i1,	%l2
	sdivcc	%l0,	0x0745,	%i3
	movleu	%icc,	%l1,	%g5
	movrlz	%o5,	%o6,	%o1
	movg	%xcc,	%o4,	%l5
	edge32n	%g4,	%l6,	%l4
	fble	%fcc1,	loop_2265
	and	%g7,	%g2,	%i7
	mova	%icc,	%i0,	%l3
	movleu	%xcc,	%i2,	%g3
loop_2265:
	udivx	%i6,	0x169F,	%i5
	set	0x5A, %i4
	ldstuba	[%l7 + %i4] 0x89,	%o2
	movn	%xcc,	%i4,	%o0
	fnegs	%f7,	%f26
	umulcc	%o7,	0x1F0E,	%g6
	lduh	[%l7 + 0x0E],	%o3
	tleu	%xcc,	0x2
	edge8l	%g1,	%i1,	%l2
	bl	loop_2266
	fzeros	%f26
	popc	%l0,	%i3
	bvs,a	%icc,	loop_2267
loop_2266:
	andcc	%g5,	0x1B70,	%o5
	popc	0x0797,	%o6
	fbe	%fcc0,	loop_2268
loop_2267:
	andn	%l1,	0x0B44,	%o4
	tle	%xcc,	0x2
	stb	%o1,	[%l7 + 0x17]
loop_2268:
	nop
	set	0x43, %g6
	stba	%g4,	[%l7 + %g6] 0x89
	te	%icc,	0x7
	orncc	%l6,	%l4,	%g7
	fbg,a	%fcc3,	loop_2269
	fbug,a	%fcc0,	loop_2270
	tne	%xcc,	0x3
	ta	%icc,	0x2
loop_2269:
	tleu	%xcc,	0x1
loop_2270:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovrsgez	%l5,	%f4,	%f19
	edge32l	%i7,	%i0,	%l3
	fmul8x16au	%f19,	%f31,	%f28
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x4F] %asi,	%i2
	fcmple16	%f8,	%f6,	%g2
	sethi	0x19CD,	%g3
	nop
	set	0x58, %o4
	std	%f20,	[%l7 + %o4]
	fbe	%fcc3,	loop_2271
	ldd	[%l7 + 0x48],	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x3C
loop_2271:
	fxor	%f18,	%f12,	%f24
	ta	%icc,	0x4
	srl	%o2,	0x1D,	%i6
	andncc	%i4,	%o7,	%o0
	tcs	%icc,	0x0
	sth	%g6,	[%l7 + 0x62]
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x44] %asi,	%f24
	tvc	%xcc,	0x2
	fmovsvs	%icc,	%f15,	%f14
	fbue	%fcc1,	loop_2272
	nop
	setx	0xE055CDC1C0467FAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	tgu	%xcc,	0x0
	edge16l	%g1,	%o3,	%i1
loop_2272:
	array32	%l0,	%i3,	%l2
	flush	%l7 + 0x64
	fba	%fcc0,	loop_2273
	fmovrse	%o5,	%f9,	%f28
	edge8l	%o6,	%l1,	%g5
	movge	%icc,	%o1,	%o4
loop_2273:
	ldub	[%l7 + 0x6C],	%g4
	fcmpne32	%f14,	%f4,	%l6
	nop
	fitos	%f12,	%f7
	fstox	%f7,	%f8
	smulcc	%g7,	0x1977,	%l5
	fabsd	%f26,	%f28
	bg,pt	%xcc,	loop_2274
	fbn,a	%fcc1,	loop_2275
	membar	0x38
	sll	%i7,	%l4,	%l3
loop_2274:
	nop
	setx	loop_2276,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2275:
	movre	%i2,	0x159,	%i0
	move	%icc,	%g3,	%g2
	sdivx	%i5,	0x0B89,	%i6
loop_2276:
	edge32n	%i4,	%o2,	%o7
	st	%f0,	[%l7 + 0x28]
	tvc	%icc,	0x0
	alignaddrl	%g6,	%g1,	%o0
	and	%o3,	%l0,	%i1
	tvs	%xcc,	0x4
	fpsub16	%f30,	%f30,	%f30
	fmovsa	%icc,	%f14,	%f21
	fba	%fcc0,	loop_2277
	tvs	%icc,	0x6
	mova	%xcc,	%l2,	%i3
	fmul8x16	%f9,	%f12,	%f16
loop_2277:
	be,a,pt	%icc,	loop_2278
	edge8ln	%o6,	%l1,	%o5
	nop
	setx loop_2279, %l0, %l1
	jmpl %l1, %o1
	tle	%xcc,	0x1
loop_2278:
	edge32n	%g5,	%g4,	%o4
	fpsub16	%f0,	%f24,	%f0
loop_2279:
	sdivcc	%g7,	0x0136,	%l5
	edge16	%i7,	%l4,	%l6
	andcc	%i2,	%l3,	%i0
	edge16ln	%g3,	%i5,	%g2
	taddcctv	%i6,	0x08B6,	%i4
	array16	%o7,	%g6,	%g1
	sethi	0x1872,	%o0
	umulcc	%o3,	0x046E,	%o2
	movgu	%icc,	%l0,	%i1
	taddcc	%l2,	0x123B,	%i3
	sra	%o6,	0x07,	%l1
	edge16ln	%o5,	%g5,	%o1
	movcs	%icc,	%g4,	%g7
	stw	%l5,	[%l7 + 0x14]
	ldsh	[%l7 + 0x50],	%i7
	bshuffle	%f26,	%f22,	%f16
	fxor	%f22,	%f16,	%f2
	bge	loop_2280
	fbge,a	%fcc1,	loop_2281
	st	%f5,	[%l7 + 0x68]
	movgu	%xcc,	%o4,	%l6
loop_2280:
	tsubcctv	%l4,	0x1773,	%l3
loop_2281:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f4,	[%l7 + 0x50] %asi
	swap	[%l7 + 0x08],	%i2
	fmovrsgz	%g3,	%f29,	%f31
	movle	%xcc,	%i0,	%i5
	set	0x6F, %g7
	ldsba	[%l7 + %g7] 0x0c,	%g2
	edge8l	%i6,	%o7,	%i4
	edge16n	%g6,	%o0,	%o3
	edge8n	%o2,	%l0,	%g1
	nop
	setx	0x95414C332FC08D1C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f14
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x56] %asi,	%i1
	subc	%i3,	0x04D9,	%l2
	edge16	%o6,	%o5,	%g5
	movrgz	%l1,	%g4,	%g7
	ldx	[%l7 + 0x18],	%o1
	or	%l5,	0x12D2,	%i7
	smulcc	%l6,	%l4,	%o4
	faligndata	%f4,	%f0,	%f22
	fmovsl	%icc,	%f18,	%f8
	movvs	%icc,	%i2,	%g3
	xnor	%l3,	0x1009,	%i5
	sdivx	%g2,	0x0F2D,	%i0
	udiv	%i6,	0x0E1D,	%o7
	srlx	%i4,	0x12,	%g6
	edge32n	%o0,	%o2,	%o3
	fmovsvs	%icc,	%f21,	%f7
	umul	%g1,	%i1,	%l0
	fandnot2	%f28,	%f24,	%f6
	fmovd	%f6,	%f30
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x62] %asi,	%i3
	set	0x34, %l2
	swapa	[%l7 + %l2] 0x89,	%o6
	fcmpgt32	%f4,	%f2,	%l2
	ldd	[%l7 + 0x30],	%o4
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l1
	st	%f16,	[%l7 + 0x48]
	move	%icc,	%g5,	%g4
	add	%g7,	%l5,	%o1
	ldstub	[%l7 + 0x19],	%l6
	edge8l	%l4,	%o4,	%i2
	tge	%xcc,	0x2
	edge32n	%g3,	%l3,	%i5
	set	0x24, %i6
	sta	%f28,	[%l7 + %i6] 0x81
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x2
	movre	%g2,	%i0,	%i7
	ta	%icc,	0x7
	brnz,a	%i6,	loop_2282
	stw	%o7,	[%l7 + 0x14]
	bgu	%xcc,	loop_2283
	orncc	%g6,	%o0,	%i4
loop_2282:
	tne	%icc,	0x6
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%o2
loop_2283:
	fpadd16	%f12,	%f26,	%f20
	fmovrdgz	%g1,	%f22,	%f28
	fornot2	%f16,	%f22,	%f30
	fmovrslz	%o3,	%f19,	%f0
	subccc	%i1,	%l0,	%i3
	movg	%icc,	%l2,	%o5
	nop
	fitod	%f5,	%f28
	bgu,a,pn	%icc,	loop_2284
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x81,	%asi
	sta	%f11,	[%l7 + 0x5C] %asi
loop_2284:
	srlx	%o6,	%l1,	%g4
	subccc	%g5,	%l5,	%o1
	alignaddr	%l6,	%l4,	%o4
	nop
	setx	0x805D4B9D,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	set	0x1C, %g2
	stwa	%i2,	[%l7 + %g2] 0x2a
	membar	#Sync
	wr	%g0,	0x18,	%asi
	stba	%g3,	[%l7 + 0x3D] %asi
	nop
	setx	0xD230E29E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x484D5680,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f30,	%f14
	bg,pt	%xcc,	loop_2285
	tcc	%xcc,	0x2
	ldub	[%l7 + 0x5A],	%l3
	fmovsle	%icc,	%f9,	%f9
loop_2285:
	fmuld8ulx16	%f18,	%f11,	%f0
	smulcc	%g7,	%i5,	%g2
	nop
	fitos	%f14,	%f28
	fstoi	%f28,	%f31
	alignaddrl	%i7,	%i6,	%i0
	alignaddr	%g6,	%o0,	%i4
	fxors	%f6,	%f22,	%f19
	fbl	%fcc3,	loop_2286
	srax	%o7,	%g1,	%o3
	fexpand	%f19,	%f28
	tgu	%icc,	0x0
loop_2286:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o2,	%i1
	fandnot2	%f20,	%f26,	%f22
	bneg	loop_2287
	sdiv	%i3,	0x15CA,	%l2
	tsubcc	%l0,	%o5,	%o6
	fba,a	%fcc0,	loop_2288
loop_2287:
	srlx	%l1,	%g4,	%g5
	nop
	set	0x10, %g3
	stw	%o1,	[%l7 + %g3]
	fbg	%fcc0,	loop_2289
loop_2288:
	array8	%l6,	%l5,	%o4
	movrgz	%l4,	0x0D0,	%g3
	taddcc	%i2,	%g7,	%i5
loop_2289:
	nop
	setx	loop_2290,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x10, %l0
	ldsw	[%l7 + %l0],	%g2
	movrgez	%i7,	%l3,	%i0
	tcc	%icc,	0x5
loop_2290:
	srax	%g6,	0x12,	%o0
	alignaddrl	%i6,	%o7,	%g1
	edge32	%i4,	%o2,	%i1
	subcc	%o3,	%i3,	%l2
	ldstub	[%l7 + 0x68],	%l0
	fmovsne	%xcc,	%f1,	%f23
	movn	%xcc,	%o6,	%o5
	umul	%l1,	%g4,	%g5
	ldsb	[%l7 + 0x76],	%o1
	tne	%xcc,	0x5
	ldsw	[%l7 + 0x6C],	%l6
	tn	%xcc,	0x2
	fcmpgt16	%f4,	%f24,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l4,	0x378,	%g3
	xorcc	%o4,	0x1180,	%g7
	wr	%g0,	0x81,	%asi
	stha	%i5,	[%l7 + 0x7E] %asi
	fands	%f28,	%f5,	%f22
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i2
	array32	%g2,	%i7,	%i0
	lduh	[%l7 + 0x08],	%g6
	srax	%l3,	0x13,	%i6
	fands	%f17,	%f2,	%f22
	lduw	[%l7 + 0x38],	%o0
	movl	%icc,	%g1,	%i4
	mulx	%o7,	%i1,	%o2
	nop
	setx loop_2291, %l0, %l1
	jmpl %l1, %i3
	nop
	setx	loop_2292,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fble	%fcc3,	loop_2293
	sra	%l2,	0x0A,	%o3
loop_2291:
	sdivx	%l0,	0x0B4E,	%o5
loop_2292:
	udivcc	%o6,	0x0494,	%g4
loop_2293:
	tcc	%xcc,	0x7
	movpos	%xcc,	%l1,	%g5
	wr	%g0,	0xe2,	%asi
	stxa	%o1,	[%l7 + 0x30] %asi
	membar	#Sync
	sethi	0x18F1,	%l6
	movvs	%xcc,	%l4,	%l5
	fnand	%f8,	%f24,	%f18
	array16	%o4,	%g3,	%i5
	xnor	%g7,	%i2,	%g2
	ldd	[%l7 + 0x40],	%i6
	movre	%i0,	%g6,	%i6
	fmovsl	%xcc,	%f20,	%f18
	tvc	%xcc,	0x1
	edge16	%o0,	%l3,	%i4
	orn	%o7,	0x188B,	%g1
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3A] %asi,	%o2
	sub	%i3,	0x1894,	%l2
	fornot1	%f18,	%f6,	%f18
	and	%i1,	%l0,	%o3
	fsrc2s	%f9,	%f12
	bne,a	%icc,	loop_2294
	nop
	setx	0x5523C04E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x58FFE13B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f28,	%f9
	udiv	%o5,	0x073B,	%g4
	fbug	%fcc0,	loop_2295
loop_2294:
	fnot1s	%f31,	%f0
	ld	[%l7 + 0x24],	%f23
	fmovrsgez	%o6,	%f31,	%f23
loop_2295:
	edge32l	%l1,	%g5,	%o1
	fbul,a	%fcc2,	loop_2296
	fbule,a	%fcc1,	loop_2297
	fand	%f26,	%f16,	%f2
	srlx	%l4,	%l5,	%l6
loop_2296:
	movg	%icc,	%o4,	%i5
loop_2297:
	popc	%g7,	%i2
	fmovrdgz	%g2,	%f6,	%f4
	movrne	%i7,	0x254,	%g3
	nop
	fitod	%f2,	%f24
	wr	%g0,	0x19,	%asi
	sta	%f4,	[%l7 + 0x30] %asi
	tn	%icc,	0x1
	sllx	%i0,	0x18,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o0,	%g6,	%l3
	sethi	0x1D53,	%o7
	array32	%i4,	%o2,	%i3
	movle	%xcc,	%g1,	%l2
	movrlz	%l0,	0x271,	%i1
	tne	%icc,	0x6
	fmovsa	%xcc,	%f22,	%f23
	fbe	%fcc3,	loop_2298
	te	%icc,	0x3
	array32	%o5,	%g4,	%o3
	st	%f23,	[%l7 + 0x40]
loop_2298:
	nop
	set	0x08, %g5
	stb	%o6,	[%l7 + %g5]
	tge	%xcc,	0x7
	fmovdne	%xcc,	%f3,	%f27
	edge32ln	%l1,	%o1,	%g5
	brnz,a	%l5,	loop_2299
	movrlez	%l4,	0x3F5,	%o4
	edge32n	%l6,	%g7,	%i2
	mulx	%g2,	%i7,	%g3
loop_2299:
	edge32ln	%i5,	%i6,	%o0
	udivcc	%i0,	0x1638,	%g6
	fmovrdlz	%o7,	%f16,	%f12
	edge32ln	%l3,	%o2,	%i3
	tvs	%xcc,	0x4
	edge8	%i4,	%l2,	%g1
	nop
	setx	loop_2300,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot2s	%f25,	%f13,	%f16
	bl,a,pt	%xcc,	loop_2301
	udiv	%i1,	0x1A8B,	%o5
loop_2300:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x88,	%g4,	%l0
loop_2301:
	nop
	setx	loop_2302,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tleu	%xcc,	0x1
	xor	%o6,	0x0D11,	%l1
	tpos	%xcc,	0x7
loop_2302:
	ld	[%l7 + 0x58],	%f25
	umul	%o1,	0x0CC7,	%g5
	fones	%f23
	bpos,pt	%xcc,	loop_2303
	bn,a,pt	%xcc,	loop_2304
	fmovrsgz	%l5,	%f24,	%f6
	fba	%fcc0,	loop_2305
loop_2303:
	fmovsgu	%icc,	%f18,	%f9
loop_2304:
	fxnors	%f12,	%f5,	%f9
	tcs	%xcc,	0x1
loop_2305:
	fmovd	%f10,	%f14
	ta	%icc,	0x4
	bleu,pn	%xcc,	loop_2306
	udivcc	%o3,	0x0F73,	%l4
	array16	%o4,	%g7,	%i2
	fornot2s	%f19,	%f28,	%f19
loop_2306:
	fble,a	%fcc3,	loop_2307
	udivcc	%g2,	0x103F,	%l6
	bcc,a	%xcc,	loop_2308
	andncc	%g3,	%i7,	%i5
loop_2307:
	movrgez	%i6,	0x316,	%o0
	fnot1	%f26,	%f28
loop_2308:
	array16	%i0,	%g6,	%o7
	set	0x3E, %l6
	lduha	[%l7 + %l6] 0x89,	%o2
	and	%i3,	%i4,	%l2
	tn	%icc,	0x1
	fmovde	%icc,	%f23,	%f10
	movrgez	%g1,	0x21F,	%l3
	movrlez	%o5,	0x093,	%g4
	ldd	[%l7 + 0x10],	%l0
	sdivcc	%o6,	0x0A7C,	%l1
	sdivcc	%i1,	0x1F23,	%o1
	fmovsvc	%xcc,	%f13,	%f13
	sdivx	%l5,	0x00AC,	%o3
	fmovdg	%icc,	%f24,	%f28
	sethi	0x02DC,	%l4
	udivx	%g5,	0x18DD,	%o4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x3C] %asi,	%f19
	fmovscs	%icc,	%f29,	%f27
	bpos	%icc,	loop_2309
	array16	%i2,	%g2,	%g7
	fbule	%fcc1,	loop_2310
	movg	%icc,	%l6,	%i7
loop_2309:
	smulcc	%g3,	0x1902,	%i6
	movcs	%xcc,	%i5,	%o0
loop_2310:
	movpos	%xcc,	%i0,	%g6
	tge	%xcc,	0x6
	tpos	%xcc,	0x2
	array8	%o2,	%i3,	%i4
	bge,pt	%icc,	loop_2311
	andcc	%l2,	%g1,	%o7
	movrne	%o5,	0x3CC,	%g4
	sll	%l0,	%o6,	%l3
loop_2311:
	tpos	%icc,	0x2
	sdivx	%l1,	0x162C,	%o1
	fxors	%f21,	%f10,	%f17
	fmovscc	%xcc,	%f7,	%f20
	edge32n	%l5,	%i1,	%l4
	movrgez	%g5,	0x071,	%o3
	set	0x78, %o6
	stxa	%o4,	[%l7 + %o6] 0x80
	tneg	%xcc,	0x3
	fbuge,a	%fcc0,	loop_2312
	fmovsg	%xcc,	%f9,	%f10
	andcc	%g2,	%g7,	%i2
	nop
	fitod	%f4,	%f28
	fdtos	%f28,	%f19
loop_2312:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l6,	%g3,	%i6
	movleu	%icc,	%i5,	%o0
	movrne	%i0,	%g6,	%i7
	nop
	setx	0x2F86919630781123,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	andcc	%i3,	0x1668,	%o2
	xnorcc	%l2,	0x1FB3,	%g1
	add	%o7,	%o5,	%g4
	tle	%xcc,	0x5
	edge8	%i4,	%l0,	%l3
	bne,pn	%icc,	loop_2313
	stb	%l1,	[%l7 + 0x7B]
	movne	%xcc,	%o6,	%o1
	movl	%xcc,	%i1,	%l4
loop_2313:
	te	%xcc,	0x0
	udivx	%g5,	0x1821,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l5,	%o4,	%g7
	xorcc	%g2,	%l6,	%i2
	fcmple32	%f16,	%f8,	%i6
	fbuge,a	%fcc3,	loop_2314
	ldd	[%l7 + 0x70],	%i4
	for	%f16,	%f26,	%f6
	srl	%o0,	0x1B,	%i0
loop_2314:
	addc	%g3,	0x1624,	%i7
	tgu	%xcc,	0x5
	edge8n	%i3,	%o2,	%l2
	orn	%g1,	0x1AED,	%o7
	sllx	%g6,	%g4,	%o5
	bpos	%icc,	loop_2315
	mova	%xcc,	%l0,	%l3
	fbule,a	%fcc2,	loop_2316
	edge32n	%l1,	%o6,	%i4
loop_2315:
	movrlz	%i1,	0x1B1,	%o1
	brlz	%g5,	loop_2317
loop_2316:
	fone	%f14
	orn	%l4,	0x0D17,	%l5
	fmovrdgz	%o3,	%f14,	%f22
loop_2317:
	bcs,a,pn	%icc,	loop_2318
	sra	%g7,	0x08,	%g2
	array16	%l6,	%o4,	%i6
	sdivcc	%i2,	0x0003,	%o0
loop_2318:
	membar	0x0F
	tvs	%xcc,	0x2
	bne,a,pt	%xcc,	loop_2319
	tne	%xcc,	0x5
	fone	%f24
	fmovsvc	%xcc,	%f16,	%f23
loop_2319:
	umulcc	%i0,	%g3,	%i5
	sdivx	%i3,	0x050F,	%i7
	fmuld8ulx16	%f21,	%f26,	%f6
	movrlez	%l2,	%g1,	%o2
	umul	%g6,	%o7,	%g4
	array32	%l0,	%o5,	%l3
	nop
	setx	0xB01E5CFF7A286E22,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x1AC3F412C6656D84,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f28,	%f28
	nop
	setx	0x59141353,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x94475AAE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f4,	%f7
	fpsub32	%f12,	%f28,	%f0
	fpack16	%f18,	%f7
	fsrc1s	%f31,	%f2
	fmovsvs	%xcc,	%f1,	%f7
	bne,pn	%icc,	loop_2320
	sub	%l1,	0x1C4A,	%i4
	wr	%g0,	0x2b,	%asi
	stha	%o6,	[%l7 + 0x6C] %asi
	membar	#Sync
loop_2320:
	ldsw	[%l7 + 0x58],	%i1
	mulx	%o1,	%g5,	%l5
	nop
	setx	0x890754F2F07D7C8E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fcmpgt16	%f20,	%f10,	%l4
	fpsub16	%f4,	%f30,	%f12
	fnegd	%f30,	%f26
	ldsw	[%l7 + 0x44],	%g7
	sra	%o3,	%g2,	%l6
	andcc	%i6,	%o4,	%i2
	sth	%i0,	[%l7 + 0x44]
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f4
	fxtod	%f4,	%f6
	movre	%g3,	%i5,	%i3
	tvs	%icc,	0x3
	te	%icc,	0x4
	sethi	0x078F,	%o0
	movpos	%xcc,	%l2,	%i7
	set	0x40, %i7
	ldsba	[%l7 + %i7] 0x11,	%g1
	set	0x28, %o2
	swapa	[%l7 + %o2] 0x18,	%o2
	mulx	%g6,	%o7,	%l0
	membar	0x07
	srl	%o5,	%g4,	%l3
	edge32l	%l1,	%i4,	%o6
	edge16l	%i1,	%o1,	%l5
	tl	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x1C] %asi,	%l4
	orncc	%g5,	%o3,	%g7
	movrgz	%l6,	%i6,	%o4
	udivcc	%g2,	0x01C2,	%i2
	fpmerge	%f18,	%f27,	%f4
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbl,a	%fcc3,	loop_2321
	movrlz	%i0,	%i5,	%i3
	fbule,a	%fcc2,	loop_2322
	addc	%o0,	%g3,	%l2
loop_2321:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i7,	%g1,	%o2
loop_2322:
	movvc	%xcc,	%g6,	%l0
	fmovsne	%xcc,	%f4,	%f7
	stbar
	fones	%f31
	tcc	%icc,	0x5
	array8	%o5,	%g4,	%o7
	fpadd32s	%f7,	%f31,	%f12
	fcmple32	%f4,	%f26,	%l1
	fbuge,a	%fcc0,	loop_2323
	fmovs	%f17,	%f1
	fcmple32	%f2,	%f0,	%l3
	movrgz	%o6,	%i4,	%o1
loop_2323:
	stb	%i1,	[%l7 + 0x64]
	ld	[%l7 + 0x6C],	%f15
	srlx	%l4,	0x1E,	%l5
	movvs	%xcc,	%o3,	%g5
	fnand	%f10,	%f14,	%f24
	movn	%icc,	%g7,	%l6
	set	0x2B, %o1
	lduba	[%l7 + %o1] 0x04,	%o4
	alignaddr	%i6,	%g2,	%i2
	srlx	%i5,	%i0,	%o0
	prefetch	[%l7 + 0x74],	 0x3
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x6C] %asi,	%i3
	smul	%g3,	0x0929,	%i7
	and	%g1,	0x0B39,	%l2
	tl	%icc,	0x0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%g6
	stb	%o5,	[%l7 + 0x5C]
	tle	%icc,	0x0
	movgu	%xcc,	%l0,	%g4
	add	%l1,	%o7,	%l3
	fbue,a	%fcc0,	loop_2324
	array32	%i4,	%o6,	%i1
	fmovrsgz	%l4,	%f0,	%f6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%l4
loop_2324:
	subc	%o1,	%g5,	%o3
	andncc	%g7,	%o4,	%i6
	edge16n	%l6,	%g2,	%i2
	fmovsgu	%xcc,	%f16,	%f17
	fmovsgu	%xcc,	%f1,	%f6
	movge	%xcc,	%i5,	%i0
	sethi	0x17C2,	%i3
	move	%icc,	%o0,	%i7
	fcmpne32	%f28,	%f4,	%g3
	nop
	fitod	%f4,	%f18
	fdtos	%f18,	%f0
	lduw	[%l7 + 0x50],	%l2
	add	%g1,	0x154A,	%o2
	movvs	%xcc,	%g6,	%o5
	tge	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f6,	[%l7 + 0x70]
	edge32	%g4,	%l1,	%o7
	fbn,a	%fcc1,	loop_2325
	swap	[%l7 + 0x18],	%l0
	nop
	set	0x28, %i1
	stx	%l3,	[%l7 + %i1]
	subccc	%o6,	0x1FCB,	%i1
loop_2325:
	orn	%l4,	%i4,	%l5
	ldub	[%l7 + 0x5C],	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%o3,	%f12,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x2
	nop
	fitos	%f7,	%f6
	fstoi	%f6,	%f10
	subccc	%g7,	0x05A9,	%o4
	or	%i6,	%o1,	%l6
	fmovrslz	%g2,	%f19,	%f30
	nop
	setx loop_2326, %l0, %l1
	jmpl %l1, %i5
	srl	%i0,	0x14,	%i2
	orcc	%i3,	%o0,	%g3
	movrne	%l2,	0x2B8,	%i7
loop_2326:
	movne	%xcc,	%o2,	%g1
	andcc	%g6,	0x1A5C,	%o5
	movrlez	%l1,	%g4,	%o7
	fandnot1	%f20,	%f10,	%f6
	movrgez	%l3,	0x15E,	%o6
	sir	0x15A8
	mova	%xcc,	%i1,	%l0
	tg	%xcc,	0x3
	nop
	setx	0x945E3F60106974B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	wr	%g0,	0x19,	%asi
	stxa	%i4,	[%l7 + 0x70] %asi
	tsubcctv	%l5,	0x1EA8,	%g5
	membar	0x7B
	sllx	%o3,	0x19,	%l4
	fandnot1s	%f10,	%f1,	%f26
	bgu,a	%icc,	loop_2327
	edge8n	%o4,	%g7,	%i6
	movpos	%xcc,	%o1,	%g2
	fpadd32s	%f14,	%f26,	%f1
loop_2327:
	tg	%icc,	0x3
	subccc	%i5,	%i0,	%i2
	stw	%l6,	[%l7 + 0x78]
	tcs	%icc,	0x5
	stw	%i3,	[%l7 + 0x14]
	fpack16	%f24,	%f14
	sll	%g3,	%l2,	%o0
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x4C] %asi,	%f10
	fmovrsgz	%o2,	%f22,	%f6
	ba,a	%icc,	loop_2328
	array32	%i7,	%g1,	%o5
	fbu,a	%fcc1,	loop_2329
	udivx	%g6,	0x0A19,	%l1
loop_2328:
	array16	%g4,	%l3,	%o7
	pdist	%f10,	%f0,	%f28
loop_2329:
	fmovspos	%icc,	%f6,	%f22
	movle	%icc,	%i1,	%l0
	umulcc	%i4,	%l5,	%g5
	tneg	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x79] %asi,	%o3
	movrne	%l4,	0x0FC,	%o6
	edge16	%o4,	%g7,	%o1
	fmul8x16au	%f31,	%f16,	%f14
	udivcc	%i6,	0x038A,	%i5
	edge16	%i0,	%i2,	%l6
	movvc	%xcc,	%i3,	%g3
	movrlz	%l2,	%o0,	%o2
	fnor	%f16,	%f22,	%f26
	umulcc	%i7,	0x1CA3,	%g2
	edge16n	%g1,	%g6,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l1,	%g4,	%l3
	fmovdpos	%icc,	%f31,	%f30
	fbo	%fcc0,	loop_2330
	fmovsa	%icc,	%f27,	%f20
	alignaddr	%i1,	%o7,	%l0
	popc	%i4,	%l5
loop_2330:
	fcmpgt32	%f30,	%f14,	%o3
	udivx	%g5,	0x0482,	%l4
	edge32ln	%o4,	%g7,	%o6
	fone	%f30
	edge32	%i6,	%o1,	%i5
	nop
	setx	0xF8106131,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f4
	xorcc	%i0,	%i2,	%i3
	bne,a,pt	%icc,	loop_2331
	movge	%xcc,	%l6,	%g3
	fmovdvs	%xcc,	%f22,	%f27
	ld	[%l7 + 0x4C],	%f17
loop_2331:
	addcc	%o0,	0x0927,	%l2
	fbule,a	%fcc2,	loop_2332
	brlz	%o2,	loop_2333
	movneg	%icc,	%i7,	%g1
	nop
	setx loop_2334, %l0, %l1
	jmpl %l1, %g2
loop_2332:
	edge16	%o5,	%l1,	%g6
loop_2333:
	stb	%l3,	[%l7 + 0x50]
	set	0x43, %g1
	ldsba	[%l7 + %g1] 0x80,	%g4
loop_2334:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x50] %asi,	%o6
	movrlz	%i1,	0x0DC,	%l0
	bpos	loop_2335
	andncc	%l5,	%o3,	%g5
	nop
	fitos	%f11,	%f29
	fstox	%f29,	%f2
	fxtos	%f2,	%f27
	tneg	%icc,	0x3
loop_2335:
	movneg	%icc,	%i4,	%o4
	udiv	%g7,	0x12DB,	%o6
	ldstub	[%l7 + 0x28],	%l4
	movrne	%i6,	0x3A7,	%o1
	tneg	%xcc,	0x2
	fpadd16	%f22,	%f24,	%f18
	andncc	%i5,	%i2,	%i0
	movle	%icc,	%l6,	%i3
	fcmpne16	%f0,	%f16,	%g3
	array8	%o0,	%l2,	%i7
	andcc	%g1,	0x0FF1,	%g2
	fmovsneg	%icc,	%f2,	%f31
	fmovsleu	%xcc,	%f22,	%f10
	fabsd	%f26,	%f30
	fbge,a	%fcc1,	loop_2336
	edge16	%o5,	%o2,	%g6
	tvs	%icc,	0x5
	tne	%icc,	0x7
loop_2336:
	brgz,a	%l1,	loop_2337
	edge8	%g4,	%o7,	%i1
	xnorcc	%l0,	%l5,	%l3
	movge	%xcc,	%o3,	%g5
loop_2337:
	nop
	set	0x1D, %i0
	lduba	[%l7 + %i0] 0x04,	%o4
	set	0x28, %o7
	sta	%f25,	[%l7 + %o7] 0x81
	bneg,pn	%icc,	loop_2338
	swap	[%l7 + 0x48],	%i4
	bn,pn	%icc,	loop_2339
	fmovdn	%icc,	%f6,	%f5
loop_2338:
	popc	%o6,	%g7
	nop
	setx loop_2340, %l0, %l1
	jmpl %l1, %l4
loop_2339:
	edge32ln	%i6,	%i5,	%i2
	udiv	%o1,	0x079C,	%l6
	tgu	%icc,	0x2
loop_2340:
	fbuge	%fcc3,	loop_2341
	movrne	%i3,	%i0,	%g3
	fmul8ulx16	%f8,	%f16,	%f2
	subc	%o0,	0x0922,	%i7
loop_2341:
	orncc	%l2,	%g1,	%o5
	fandnot1	%f14,	%f8,	%f14
	umul	%o2,	0x13DB,	%g2
	bleu,pn	%xcc,	loop_2342
	ld	[%l7 + 0x78],	%f4
	addc	%l1,	%g6,	%g4
	tgu	%icc,	0x7
loop_2342:
	umul	%o7,	0x0070,	%i1
	movrlez	%l0,	%l5,	%o3
	fmovd	%f30,	%f30
	andncc	%g5,	%o4,	%i4
	wr	%g0,	0x18,	%asi
	sta	%f0,	[%l7 + 0x38] %asi
	fpackfix	%f0,	%f25
	movn	%icc,	%l3,	%o6
	tcc	%xcc,	0x2
	sdivcc	%g7,	0x0F75,	%l4
	edge32	%i5,	%i2,	%i6
	bneg,a	%xcc,	loop_2343
	fmovdvc	%icc,	%f29,	%f8
	tpos	%icc,	0x2
	fbe,a	%fcc0,	loop_2344
loop_2343:
	bge,a,pt	%xcc,	loop_2345
	sra	%o1,	0x1F,	%l6
	sub	%i3,	%i0,	%o0
loop_2344:
	ldd	[%l7 + 0x60],	%i6
loop_2345:
	tneg	%icc,	0x1
	stb	%l2,	[%l7 + 0x55]
	add	%g3,	%o5,	%g1
	movpos	%icc,	%o2,	%g2
	ta	%xcc,	0x7
	tvs	%xcc,	0x4
	movpos	%icc,	%g6,	%l1
	sra	%o7,	0x17,	%g4
	fmovscs	%icc,	%f21,	%f18
	fornot2s	%f21,	%f5,	%f17
	xnor	%i1,	%l0,	%l5
	movrlz	%g5,	%o3,	%i4
	ldsh	[%l7 + 0x50],	%o4
	tvs	%icc,	0x4
	fmovdvs	%xcc,	%f16,	%f13
	addc	%o6,	%g7,	%l3
	brlez	%i5,	loop_2346
	array32	%i2,	%i6,	%o1
	set	0x6C, %l1
	stha	%l4,	[%l7 + %l1] 0x81
loop_2346:
	nop
	setx	loop_2347,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%xcc,	%l6,	%i0
	ble,a,pn	%xcc,	loop_2348
	movl	%xcc,	%o0,	%i7
loop_2347:
	movgu	%icc,	%i3,	%g3
	udiv	%o5,	0x19B6,	%g1
loop_2348:
	movrgez	%l2,	0x132,	%o2
	fsrc1	%f22,	%f20
	sllx	%g6,	%g2,	%l1
	fbn	%fcc0,	loop_2349
	array16	%o7,	%i1,	%g4
	sdivx	%l0,	0x1BBA,	%g5
	st	%f9,	[%l7 + 0x38]
loop_2349:
	tn	%xcc,	0x7
	fmovsleu	%xcc,	%f14,	%f29
	fpack16	%f6,	%f24
	ta	%xcc,	0x6
	movleu	%xcc,	%o3,	%i4
	smul	%l5,	%o4,	%o6
	set	0x14, %l5
	swapa	[%l7 + %l5] 0x19,	%g7
	fandnot1s	%f29,	%f27,	%f10
	sdivcc	%l3,	0x0654,	%i2
	movle	%xcc,	%i5,	%i6
	fblg	%fcc2,	loop_2350
	xor	%l4,	0x1401,	%l6
	tvs	%icc,	0x7
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2350:
	swap	[%l7 + 0x68],	%i0
	movrlz	%o0,	%i7,	%i3
	bgu	loop_2351
	fbn	%fcc1,	loop_2352
	fblg,a	%fcc0,	loop_2353
	mulx	%o1,	%o5,	%g3
loop_2351:
	bneg,a	loop_2354
loop_2352:
	andcc	%g1,	%o2,	%l2
loop_2353:
	umul	%g6,	%l1,	%g2
	andcc	%o7,	0x198F,	%g4
loop_2354:
	fxors	%f6,	%f24,	%f27
	movrgz	%l0,	%g5,	%i1
	edge8n	%i4,	%o3,	%l5
	smul	%o6,	0x1D3D,	%g7
	fmovd	%f4,	%f30
	udivx	%l3,	0x04C6,	%i2
	edge16	%o4,	%i6,	%l4
	edge32n	%l6,	%i5,	%i0
	bvc,pn	%xcc,	loop_2355
	sdiv	%o0,	0x1930,	%i3
	tpos	%xcc,	0x0
	ldsb	[%l7 + 0x2A],	%i7
loop_2355:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o5,	%g3,	%g1
	membar	0x75
	move	%icc,	%o2,	%l2
	nop
	setx	0xF8744047505ED847,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	subcc	%g6,	0x163D,	%l1
	movre	%o1,	0x3AB,	%g2
	mova	%icc,	%o7,	%g4
	fpsub16s	%f22,	%f26,	%f31
	smul	%l0,	%g5,	%i1
	add	%i4,	%l5,	%o3
	ldsh	[%l7 + 0x58],	%o6
	ldx	[%l7 + 0x08],	%l3
	tneg	%xcc,	0x3
	sir	0x06FA
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x10] %asi,	%i2
	movl	%xcc,	%g7,	%i6
	tneg	%xcc,	0x5
	fcmpgt32	%f4,	%f28,	%l4
	fcmpeq32	%f20,	%f10,	%o4
	fbg,a	%fcc1,	loop_2356
	udivx	%i5,	0x0A5C,	%i0
	udiv	%l6,	0x1021,	%i3
	edge8	%o0,	%i7,	%g3
loop_2356:
	orncc	%o5,	%o2,	%g1
	and	%g6,	0x129E,	%l2
	movneg	%icc,	%l1,	%g2
	nop
	fitos	%f0,	%f3
	fstox	%f3,	%f10
	fxtos	%f10,	%f28
	array32	%o7,	%o1,	%l0
	sdiv	%g5,	0x0292,	%i1
	fbe,a	%fcc1,	loop_2357
	mova	%xcc,	%g4,	%i4
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2357:
	bne	loop_2358
	tvs	%xcc,	0x1
	nop
	fitos	%f6,	%f27
	fstox	%f27,	%f8
	fxtos	%f8,	%f19
	fbug,a	%fcc3,	loop_2359
loop_2358:
	mulscc	%o3,	%l5,	%o6
	ba	loop_2360
	addcc	%l3,	%g7,	%i2
loop_2359:
	fbul,a	%fcc2,	loop_2361
	movvs	%icc,	%l4,	%o4
loop_2360:
	movne	%icc,	%i5,	%i6
	movgu	%icc,	%l6,	%i0
loop_2361:
	move	%xcc,	%o0,	%i7
	fcmple32	%f26,	%f28,	%i3
	bl	%icc,	loop_2362
	movvc	%xcc,	%g3,	%o5
	fmovdne	%xcc,	%f13,	%f6
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2362:
	alignaddrl	%g1,	%o2,	%l2
	nop
	fitos	%f16,	%f9
	brgez	%g6,	loop_2363
	ldub	[%l7 + 0x57],	%l1
	fcmple32	%f28,	%f6,	%o7
	tpos	%icc,	0x5
loop_2363:
	fands	%f4,	%f20,	%f18
	ld	[%l7 + 0x78],	%f11
	edge16ln	%o1,	%l0,	%g2
	fmovrslz	%i1,	%f13,	%f3
	alignaddrl	%g4,	%g5,	%o3
	andncc	%i4,	%o6,	%l3
	fmovspos	%icc,	%f17,	%f0
	movg	%xcc,	%g7,	%i2
	ldsb	[%l7 + 0x13],	%l5
	tcs	%icc,	0x3
	nop
	setx	loop_2364,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc1	%f0,	%f8
	sllx	%l4,	0x06,	%o4
	edge16ln	%i6,	%l6,	%i0
loop_2364:
	taddcctv	%o0,	0x04E9,	%i7
	subcc	%i3,	0x09EC,	%i5
	sra	%g3,	0x03,	%g1
	fmovrdgz	%o5,	%f12,	%f18
	tne	%icc,	0x0
	movcc	%xcc,	%o2,	%l2
	nop
	fitod	%f4,	%f30
	fdtoi	%f30,	%f11
	udivx	%l1,	0x1FA8,	%g6
	fble	%fcc3,	loop_2365
	xnor	%o1,	0x13E3,	%l0
	tpos	%icc,	0x0
	bne	%icc,	loop_2366
loop_2365:
	stw	%g2,	[%l7 + 0x40]
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x89,	%f16
loop_2366:
	udivcc	%i1,	0x06CA,	%g4
	alignaddrl	%o7,	%g5,	%o3
	ldsw	[%l7 + 0x70],	%o6
	st	%f12,	[%l7 + 0x3C]
	te	%icc,	0x6
	fornot2s	%f13,	%f20,	%f29
	addccc	%i4,	0x1B49,	%g7
	brz,a	%l3,	loop_2367
	fmul8x16	%f30,	%f2,	%f10
	addc	%l5,	0x02E7,	%i2
	nop
	fitod	%f8,	%f28
	fdtox	%f28,	%f8
loop_2367:
	tge	%xcc,	0x2
	srl	%o4,	%i6,	%l6
	orncc	%l4,	0x051B,	%o0
	fpadd32s	%f26,	%f20,	%f11
	set	0x24, %l4
	ldsha	[%l7 + %l4] 0x18,	%i7
	mulx	%i3,	0x1C7C,	%i5
	smulcc	%g3,	%g1,	%o5
	fmovsleu	%icc,	%f19,	%f7
	fpackfix	%f18,	%f25
	fblg,a	%fcc1,	loop_2368
	movre	%o2,	%l2,	%l1
	nop
	setx	0xC55A24DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xA3258B28,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f4,	%f17
	fba,a	%fcc0,	loop_2369
loop_2368:
	tg	%xcc,	0x1
	andn	%g6,	%o1,	%l0
	fpadd32	%f18,	%f24,	%f22
loop_2369:
	tvs	%icc,	0x2
	fsrc1	%f8,	%f16
	subcc	%g2,	0x0C08,	%i1
	subc	%i0,	%o7,	%g4
	tcs	%icc,	0x6
	fandnot2	%f6,	%f28,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_2370
	fands	%f23,	%f24,	%f16
	edge16n	%o3,	%g5,	%o6
	tle	%xcc,	0x2
loop_2370:
	orn	%i4,	%l3,	%l5
	tg	%icc,	0x1
	nop
	setx	0x784894AB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xFC09A572,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f1,	%f17
	stb	%g7,	[%l7 + 0x4F]
	tgu	%icc,	0x6
	fmovdvc	%xcc,	%f4,	%f30
	fsrc2s	%f22,	%f1
	ble,pn	%xcc,	loop_2371
	addc	%o4,	%i6,	%l6
	sdivcc	%i2,	0x0DED,	%l4
	ba,a,pt	%xcc,	loop_2372
loop_2371:
	movle	%xcc,	%i7,	%i3
	addccc	%o0,	0x1A1C,	%g3
	fnands	%f24,	%f7,	%f20
loop_2372:
	te	%xcc,	0x4
	fzero	%f30
	nop
	setx	loop_2373,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stw	%g1,	[%l7 + 0x78]
	fone	%f26
	popc	%o5,	%o2
loop_2373:
	fmovda	%xcc,	%f14,	%f16
	edge32ln	%l2,	%l1,	%g6
	stb	%o1,	[%l7 + 0x55]
	bne,a	loop_2374
	fnors	%f22,	%f14,	%f25
	fbule,a	%fcc3,	loop_2375
	udivx	%l0,	0x1058,	%i5
loop_2374:
	orncc	%g2,	%i1,	%i0
	or	%g4,	%o3,	%g5
loop_2375:
	fzeros	%f23
	smul	%o7,	%o6,	%l3
	popc	0x0863,	%i4
	sub	%l5,	0x15E9,	%o4
	fmovdgu	%icc,	%f9,	%f11
	movvc	%icc,	%i6,	%l6
	edge8l	%i2,	%g7,	%i7
	movleu	%icc,	%i3,	%l4
	movrgz	%g3,	0x304,	%o0
	set	0x0C, %i5
	stwa	%o5,	[%l7 + %i5] 0xe3
	membar	#Sync
	movle	%icc,	%o2,	%g1
	umul	%l2,	0x1077,	%g6
	set	0x10, %i2
	ldxa	[%l7 + %i2] 0x0c,	%l1
	tcs	%icc,	0x5
	tvc	%xcc,	0x5
	movl	%xcc,	%l0,	%i5
	fmovsneg	%icc,	%f3,	%f1
	fornot2	%f14,	%f16,	%f24
	edge8	%o1,	%g2,	%i0
	tneg	%icc,	0x2
	ldd	[%l7 + 0x08],	%g4
	subcc	%o3,	0x022B,	%g5
	bl,a	%xcc,	loop_2376
	edge32ln	%i1,	%o7,	%o6
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x81
loop_2376:
	array32	%i4,	%l3,	%o4
	edge16ln	%i6,	%l5,	%i2
	edge8ln	%l6,	%i7,	%g7
	tne	%xcc,	0x7
	fmovsneg	%xcc,	%f5,	%f4
	std	%f20,	[%l7 + 0x50]
	nop
	fitos	%f2,	%f29
	fstoi	%f29,	%f6
	array32	%l4,	%i3,	%g3
	brlez	%o0,	loop_2377
	movvc	%icc,	%o2,	%o5
	xor	%g1,	%g6,	%l1
	ldub	[%l7 + 0x60],	%l2
loop_2377:
	edge16n	%i5,	%l0,	%o1
	tn	%xcc,	0x0
	movrlz	%g2,	%g4,	%i0
	ta	%xcc,	0x7
	set	0x0C, %g4
	stwa	%o3,	[%l7 + %g4] 0x19
	fmovsleu	%xcc,	%f8,	%f12
	movrne	%g5,	%o7,	%o6
	brgez,a	%i4,	loop_2378
	movcc	%icc,	%l3,	%i1
	add	%i6,	%o4,	%i2
	lduh	[%l7 + 0x62],	%l5
loop_2378:
	edge8n	%i7,	%l6,	%g7
	bgu	%xcc,	loop_2379
	edge8l	%i3,	%g3,	%l4
	taddcctv	%o0,	%o2,	%g1
	fbug	%fcc0,	loop_2380
loop_2379:
	tl	%icc,	0x4
	array8	%o5,	%l1,	%l2
	tle	%xcc,	0x5
loop_2380:
	nop
	set	0x10, %o5
	ldsha	[%l7 + %o5] 0x10,	%g6
	subcc	%l0,	0x0959,	%i5
	movgu	%xcc,	%o1,	%g4
	sdivcc	%i0,	0x1167,	%g2
	addcc	%g5,	%o3,	%o6
	fnegd	%f22,	%f30
	addc	%i4,	%o7,	%l3
	edge16l	%i1,	%o4,	%i6
	edge16l	%i2,	%i7,	%l6
	taddcctv	%l5,	%i3,	%g7
	nop
	setx	loop_2381,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bg,pn	%icc,	loop_2382
	array8	%g3,	%o0,	%l4
	set	0x0E, %l3
	ldstuba	[%l7 + %l3] 0x89,	%g1
loop_2381:
	andn	%o2,	0x1564,	%o5
loop_2382:
	xnor	%l2,	0x1557,	%l1
	fmovsg	%icc,	%f12,	%f6
	array8	%g6,	%l0,	%i5
	fmovdge	%icc,	%f7,	%f10
	fandnot1s	%f4,	%f16,	%f24
	srlx	%o1,	0x06,	%g4
	fxor	%f8,	%f2,	%f2
	xnor	%g2,	0x148A,	%i0
	tge	%xcc,	0x5
	stx	%o3,	[%l7 + 0x30]
	set	0x60, %i4
	lda	[%l7 + %i4] 0x88,	%f10
	udivcc	%o6,	0x1873,	%g5
	array16	%o7,	%i4,	%i1
	movcc	%icc,	%o4,	%l3
	movvs	%icc,	%i2,	%i7
	alignaddrl	%l6,	%i6,	%l5
	movvs	%xcc,	%g7,	%i3
	nop
	setx	0x40DC7EAC00587B6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	addcc	%g3,	%l4,	%g1
	set	0x26, %o3
	stha	%o0,	[%l7 + %o3] 0xe2
	membar	#Sync
	bgu,pt	%xcc,	loop_2383
	te	%xcc,	0x4
	bn,a,pt	%icc,	loop_2384
	tcc	%icc,	0x7
loop_2383:
	brlz	%o2,	loop_2385
	tleu	%xcc,	0x4
loop_2384:
	nop
	wr	%g0,	0x57,	%asi
	stxa	%o5,	[%g0 + 0x0] %asi
loop_2385:
	udivx	%l1,	0x1AF6,	%l2
	fmovdvs	%icc,	%f20,	%f24
	st	%f23,	[%l7 + 0x74]
	tne	%icc,	0x0
	ldx	[%l7 + 0x58],	%g6
	fmovrdgez	%l0,	%f14,	%f6
	movrgez	%i5,	%g4,	%o1
	movpos	%xcc,	%i0,	%o3
	fmovsg	%xcc,	%f24,	%f18
	sra	%o6,	0x1B,	%g2
	pdist	%f12,	%f22,	%f0
	mulscc	%o7,	0x0A04,	%i4
	srlx	%i1,	%g5,	%o4
	fmovdvs	%icc,	%f4,	%f22
	sdivx	%i2,	0x0BBF,	%l3
	fmovde	%xcc,	%f31,	%f25
	nop
	setx	0x72AE1302,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f11
	fnot2s	%f26,	%f5
	umul	%i7,	0x1C86,	%i6
	nop
	setx	0xDFEB344F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x1EC24331,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f27,	%f23
	movne	%xcc,	%l5,	%g7
	fbo	%fcc0,	loop_2386
	movvs	%xcc,	%i3,	%g3
	fpadd16	%f14,	%f28,	%f22
	movg	%xcc,	%l4,	%l6
loop_2386:
	edge16n	%g1,	%o0,	%o2
	fmovsa	%xcc,	%f27,	%f7
	taddcctv	%o5,	%l2,	%g6
	umulcc	%l1,	%l0,	%g4
	movrne	%i5,	0x10F,	%i0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o1,	%o3
	or	%g2,	0x1295,	%o6
	xnorcc	%o7,	%i1,	%g5
	fandnot2s	%f29,	%f3,	%f31
	sir	0x19FF
	andncc	%i4,	%o4,	%l3
	bl,a	loop_2387
	movn	%xcc,	%i2,	%i7
	movge	%icc,	%i6,	%l5
	edge8n	%g7,	%i3,	%g3
loop_2387:
	fandnot2s	%f29,	%f19,	%f11
	fmovscs	%xcc,	%f7,	%f29
	brlez,a	%l4,	loop_2388
	stbar
	fbge	%fcc3,	loop_2389
	fnot2	%f16,	%f22
loop_2388:
	fmovdn	%xcc,	%f28,	%f19
	nop
	setx	0x7D918B2F1767816E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f2
loop_2389:
	edge16n	%g1,	%l6,	%o0
	sir	0x03FF
	nop
	setx	0x446DC8479A6B60A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x1B95F049F672EBE8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f24,	%f18
	fpack32	%f24,	%f0,	%f16
	fbg	%fcc1,	loop_2390
	fmul8x16al	%f25,	%f2,	%f22
	andcc	%o5,	%o2,	%g6
	ldsw	[%l7 + 0x10],	%l2
loop_2390:
	st	%f24,	[%l7 + 0x60]
	ble,pt	%icc,	loop_2391
	xorcc	%l0,	0x1D68,	%g4
	edge32l	%l1,	%i5,	%i0
	brnz,a	%o3,	loop_2392
loop_2391:
	edge32l	%o1,	%g2,	%o6
	andcc	%i1,	0x11EE,	%g5
	subcc	%o7,	%o4,	%i4
loop_2392:
	movrlez	%l3,	0x3D0,	%i7
	sth	%i6,	[%l7 + 0x0A]
	fzero	%f16
	membar	0x58
	wr	%g0,	0x89,	%asi
	stwa	%i2,	[%l7 + 0x5C] %asi
	movl	%xcc,	%g7,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g3,	%l4,	%i3
	tl	%xcc,	0x6
	array32	%l6,	%o0,	%o5
	fnands	%f23,	%f22,	%f19
	tneg	%xcc,	0x2
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f10
	fxtod	%f10,	%f8
	andn	%g1,	%o2,	%l2
	srlx	%l0,	0x12,	%g6
	tl	%xcc,	0x7
	tneg	%icc,	0x4
	edge16	%l1,	%g4,	%i0
	fpmerge	%f26,	%f21,	%f24
	edge32ln	%i5,	%o3,	%o1
	addcc	%o6,	%i1,	%g5
	sth	%g2,	[%l7 + 0x38]
	set	0x30, %o4
	ldswa	[%l7 + %o4] 0x81,	%o4
	tpos	%xcc,	0x3
	array32	%o7,	%l3,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i7,	%i2
	movpos	%xcc,	%i6,	%g7
	fsrc1s	%f21,	%f12
	tg	%icc,	0x4
	add	%g3,	0x11D6,	%l4
	movre	%l5,	%i3,	%l6
	fmovsn	%xcc,	%f8,	%f13
	nop
	setx loop_2393, %l0, %l1
	jmpl %l1, %o5
	fble,a	%fcc2,	loop_2394
	sdiv	%o0,	0x1E26,	%g1
	fcmpne16	%f8,	%f12,	%l2
loop_2393:
	membar	0x13
loop_2394:
	array32	%o2,	%l0,	%l1
	brgz	%g4,	loop_2395
	fbg	%fcc3,	loop_2396
	fmovsvs	%xcc,	%f2,	%f16
	edge8l	%i0,	%i5,	%o3
loop_2395:
	fbu	%fcc0,	loop_2397
loop_2396:
	fba,a	%fcc3,	loop_2398
	orn	%g6,	%o6,	%o1
	mulscc	%g5,	%g2,	%o4
loop_2397:
	tvc	%icc,	0x6
loop_2398:
	movrgz	%o7,	0x0E3,	%l3
	fba,a	%fcc1,	loop_2399
	movrgz	%i1,	%i7,	%i2
	alignaddrl	%i4,	%g7,	%g3
	edge8l	%i6,	%l5,	%l4
loop_2399:
	membar	0x1F
	edge8n	%i3,	%l6,	%o5
	bne,a,pn	%xcc,	loop_2400
	fmovrsne	%g1,	%f6,	%f29
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x08] %asi,	%o0
loop_2400:
	ldsb	[%l7 + 0x74],	%o2
	bcc,pt	%icc,	loop_2401
	fmovrsgz	%l2,	%f29,	%f19
	move	%icc,	%l0,	%g4
	bn,pt	%xcc,	loop_2402
loop_2401:
	swap	[%l7 + 0x74],	%l1
	tle	%icc,	0x4
	movre	%i5,	0x0F7,	%o3
loop_2402:
	prefetch	[%l7 + 0x14],	 0x1
	fpadd32	%f12,	%f16,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x3
	fsrc1	%f22,	%f18
	bleu,a	loop_2403
	orncc	%g6,	%o6,	%i0
	mova	%xcc,	%o1,	%g5
	movl	%xcc,	%g2,	%o7
loop_2403:
	array16	%o4,	%l3,	%i1
	edge16l	%i2,	%i4,	%i7
	sll	%g7,	%i6,	%g3
	or	%l4,	0x1C8E,	%l5
	brlz	%l6,	loop_2404
	std	%f28,	[%l7 + 0x58]
	set	0x28, %g7
	swapa	[%l7 + %g7] 0x89,	%o5
loop_2404:
	sdivx	%i3,	0x0F28,	%g1
	tl	%xcc,	0x7
	movge	%icc,	%o0,	%l2
	mulscc	%o2,	%l0,	%l1
	smul	%i5,	%o3,	%g6
	orncc	%o6,	0x1ECB,	%g4
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o1
	tl	%icc,	0x6
	fmovrse	%g5,	%f19,	%f27
	fbuge,a	%fcc2,	loop_2405
	ld	[%l7 + 0x58],	%f5
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x74] %asi,	%g2
loop_2405:
	bge,a	loop_2406
	sth	%o7,	[%l7 + 0x08]
	fmul8x16	%f11,	%f14,	%f26
	edge16n	%o4,	%i0,	%i1
loop_2406:
	ld	[%l7 + 0x58],	%f12
	edge8	%i2,	%i4,	%l3
	tvc	%xcc,	0x4
	fpadd16	%f28,	%f4,	%f0
	subc	%g7,	0x1D7C,	%i6
	fcmple16	%f8,	%f12,	%i7
	fmovrse	%l4,	%f25,	%f9
	movre	%g3,	%l6,	%l5
	fmovde	%xcc,	%f11,	%f19
	xnor	%i3,	%g1,	%o0
	fbuge	%fcc1,	loop_2407
	edge16n	%o5,	%o2,	%l2
	edge16n	%l1,	%l0,	%i5
	fmovs	%f12,	%f21
loop_2407:
	tl	%icc,	0x0
	fmovdvs	%icc,	%f6,	%f17
	movgu	%icc,	%o3,	%g6
	andcc	%o6,	%o1,	%g5
	edge32ln	%g2,	%g4,	%o4
	movre	%i0,	%i1,	%i2
	edge8l	%i4,	%l3,	%g7
	set	0x78, %l2
	sta	%f22,	[%l7 + %l2] 0x80
	bne,pt	%icc,	loop_2408
	tsubcc	%i6,	%i7,	%o7
	fmovdle	%icc,	%f24,	%f24
	edge8	%l4,	%g3,	%l6
loop_2408:
	orncc	%l5,	%g1,	%i3
	edge16l	%o5,	%o0,	%l2
	movne	%xcc,	%l1,	%l0
	sub	%o2,	%o3,	%g6
	fpack16	%f30,	%f12
	orcc	%o6,	%o1,	%g5
	movpos	%icc,	%i5,	%g2
	fandnot2s	%f4,	%f17,	%f19
	movvc	%icc,	%o4,	%g4
	nop
	setx	0x68EDA937A33AA26B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f12
	lduw	[%l7 + 0x2C],	%i1
	nop
	setx	0xD6E1CA8C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x22BA1251,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f10,	%f17
	tsubcctv	%i2,	0x0E76,	%i4
	edge16l	%l3,	%i0,	%g7
	set	0x20, %g6
	prefetcha	[%l7 + %g6] 0x04,	 0x0
	tneg	%xcc,	0x3
	srax	%o7,	%l4,	%i7
	movpos	%xcc,	%g3,	%l5
	xnorcc	%g1,	0x0628,	%i3
	edge32	%l6,	%o0,	%l2
	tg	%xcc,	0x3
	subcc	%o5,	%l1,	%l0
	nop
	setx	0x40B247EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xAEBF5068,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f21,	%f6
	srax	%o3,	%o2,	%g6
	fmovsne	%icc,	%f22,	%f12
	edge8l	%o6,	%o1,	%i5
	movcc	%icc,	%g2,	%g5
	fblg	%fcc0,	loop_2409
	fxnor	%f8,	%f24,	%f18
	mulscc	%g4,	%i1,	%o4
	mulx	%i4,	0x07EA,	%i2
loop_2409:
	nop
	set	0x3b8, %g2
	nop 	! 	nop 	! 	ldxa	[%g0 + %g2] 0x40,	%i0 ripped by fixASI40.pl ripped by fixASI40.pl
	fand	%f18,	%f26,	%f8
	nop
	setx	0x317DC71C54A545EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xFC63EBDE3C2FF0ED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f12,	%f30
	srlx	%l3,	%i6,	%o7
	sub	%l4,	0x01A3,	%i7
	sir	0x01C9
	tsubcc	%g7,	%l5,	%g3
	array32	%i3,	%l6,	%g1
	edge16	%l2,	%o0,	%l1
	movneg	%icc,	%o5,	%l0
	edge16	%o2,	%g6,	%o6
	fbu,a	%fcc1,	loop_2410
	sdivx	%o1,	0x09E2,	%i5
	sll	%o3,	0x0C,	%g5
	fbu,a	%fcc1,	loop_2411
loop_2410:
	subcc	%g2,	%g4,	%o4
	umulcc	%i1,	0x1B60,	%i2
	taddcc	%i4,	%l3,	%i6
loop_2411:
	fabss	%f7,	%f25
	orcc	%o7,	%i0,	%l4
	fba	%fcc1,	loop_2412
	orn	%i7,	%l5,	%g7
	fbu	%fcc2,	loop_2413
	fbg,a	%fcc3,	loop_2414
loop_2412:
	movl	%icc,	%i3,	%l6
	nop
	fitod	%f0,	%f0
	fdtox	%f0,	%f10
loop_2413:
	taddcctv	%g1,	%g3,	%o0
loop_2414:
	orncc	%l2,	0x1C97,	%l1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l0,	%o5
	fsrc2s	%f1,	%f9
	fmovdvs	%icc,	%f1,	%f8
	edge8ln	%o2,	%o6,	%o1
	subccc	%g6,	0x061B,	%i5
	stx	%o3,	[%l7 + 0x58]
	movrgez	%g5,	0x153,	%g4
	srl	%g2,	%o4,	%i1
	ldd	[%l7 + 0x58],	%f8
	tcc	%icc,	0x2
	brlez,a	%i2,	loop_2415
	xorcc	%l3,	%i6,	%i4
	tgu	%icc,	0x6
	fxors	%f12,	%f26,	%f8
loop_2415:
	nop
	setx	0xA5BCEF170DFA730E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xE02F1E831E367578,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f8,	%f30
	movne	%icc,	%o7,	%i0
	edge32n	%l4,	%i7,	%l5
	swap	[%l7 + 0x68],	%i3
	srlx	%l6,	%g1,	%g7
	wr	%g0,	0x11,	%asi
	stha	%g3,	[%l7 + 0x14] %asi
	xnor	%o0,	%l2,	%l0
	fmovdge	%icc,	%f31,	%f17
	or	%l1,	0x0825,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x1
	movcs	%icc,	%o6,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o2,	[%l7 + 0x40]
	srlx	%i5,	%g6,	%o3
	srl	%g5,	%g2,	%g4
	andn	%o4,	%i1,	%i2
	fmovscc	%icc,	%f26,	%f20
	andncc	%l3,	%i6,	%i4
	srax	%o7,	0x16,	%i0
	movrlz	%l4,	0x0AC,	%i7
	popc	0x1BA6,	%l5
	mulscc	%i3,	0x101D,	%l6
	movpos	%icc,	%g7,	%g1
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x2E, %i6
	stha	%g3,	[%l7 + %i6] 0x11
	xor	%l2,	0x18B7,	%l0
	addc	%o0,	%o5,	%o6
	movne	%icc,	%l1,	%o1
	alignaddrl	%o2,	%g6,	%i5
	movre	%g5,	%o3,	%g2
	ta	%xcc,	0x1
	set	0x64, %l0
	lda	[%l7 + %l0] 0x81,	%f2
	movne	%xcc,	%o4,	%g4
	bl,pn	%xcc,	loop_2416
	edge32ln	%i2,	%l3,	%i6
	movg	%icc,	%i4,	%i1
	array16	%o7,	%l4,	%i0
loop_2416:
	fmovsa	%icc,	%f17,	%f31
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fpadd32s	%f29,	%f31,	%f27
	subcc	%l5,	0x1C55,	%i7
	membar	0x74
	bneg,a,pt	%xcc,	loop_2417
	fmul8x16au	%f4,	%f10,	%f30
	movrne	%l6,	%g7,	%g1
	subc	%i3,	%l2,	%g3
loop_2417:
	nop
	fitos	%f5,	%f31
	fstox	%f31,	%f8
	nop
	fitos	%f14,	%f9
	fstox	%f9,	%f2
	fxtos	%f2,	%f26
	fmovsleu	%xcc,	%f4,	%f16
	bvc,a,pn	%xcc,	loop_2418
	movre	%o0,	0x2F3,	%l0
	sra	%o5,	%o6,	%l1
	fmovs	%f18,	%f23
loop_2418:
	tsubcc	%o1,	%g6,	%i5
	tsubcctv	%o2,	0x15F5,	%g5
	edge8n	%o3,	%g2,	%o4
	xnor	%g4,	0x1F4C,	%i2
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%l3,	%i6
	lduw	[%l7 + 0x0C],	%i4
	array8	%o7,	%i1,	%i0
	nop
	setx loop_2419, %l0, %l1
	jmpl %l1, %l5
	ta	%icc,	0x2
	fbg	%fcc1,	loop_2420
	tvc	%xcc,	0x4
loop_2419:
	sllx	%l4,	%l6,	%i7
	brgez	%g7,	loop_2421
loop_2420:
	edge8	%g1,	%l2,	%g3
	set	0x30, %g5
	prefetcha	[%l7 + %g5] 0x14,	 0x3
loop_2421:
	ldd	[%l7 + 0x40],	%l0
	array32	%o0,	%o6,	%o5
	fbn	%fcc3,	loop_2422
	fbe,a	%fcc2,	loop_2423
	fblg,a	%fcc3,	loop_2424
	subc	%o1,	%l1,	%i5
loop_2422:
	bneg,pn	%xcc,	loop_2425
loop_2423:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2424:
	smul	%g6,	0x0D65,	%o2
	tsubcc	%o3,	%g2,	%o4
loop_2425:
	movrgz	%g4,	%g5,	%l3
	array16	%i2,	%i6,	%i4
	subcc	%i1,	%o7,	%i0
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f24
	te	%icc,	0x3
	subcc	%l4,	0x1538,	%l6
	addc	%i7,	%l5,	%g1
	fmovsleu	%icc,	%f19,	%f1
	mova	%xcc,	%g7,	%g3
	movgu	%icc,	%i3,	%l2
	nop
	setx loop_2426, %l0, %l1
	jmpl %l1, %l0
	xnor	%o0,	%o5,	%o6
	array8	%o1,	%i5,	%g6
	tsubcc	%l1,	0x03C6,	%o2
loop_2426:
	mova	%icc,	%o3,	%g2
	xnor	%g4,	%g5,	%l3
	tl	%icc,	0x1
	fpmerge	%f27,	%f29,	%f4
	brgz	%i2,	loop_2427
	srax	%i6,	%o4,	%i1
	tneg	%icc,	0x2
	xorcc	%o7,	%i4,	%i0
loop_2427:
	fnand	%f10,	%f14,	%f24
	fbne	%fcc1,	loop_2428
	tgu	%icc,	0x3
	movvc	%xcc,	%l6,	%i7
	bl,pt	%icc,	loop_2429
loop_2428:
	movleu	%icc,	%l5,	%l4
	movge	%xcc,	%g1,	%g7
	tpos	%xcc,	0x5
loop_2429:
	sir	0x1610
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x14] %asi,	%g3
	udivx	%l2,	0x194E,	%l0
	fbuge,a	%fcc1,	loop_2430
	fmovspos	%icc,	%f21,	%f5
	bpos,pt	%icc,	loop_2431
	nop
	set	0x38, %g3
	std	%f16,	[%l7 + %g3]
loop_2430:
	fabsd	%f14,	%f6
	movrgez	%i3,	0x1D4,	%o0
loop_2431:
	fmovdvc	%icc,	%f28,	%f31
	fbne,a	%fcc0,	loop_2432
	and	%o5,	0x1636,	%o6
	orcc	%i5,	0x069B,	%g6
	tsubcc	%o1,	0x0914,	%o2
loop_2432:
	movleu	%icc,	%o3,	%g2
	brgz	%g4,	loop_2433
	tleu	%icc,	0x0
	movrlez	%g5,	0x30C,	%l1
	tne	%xcc,	0x2
loop_2433:
	srax	%l3,	0x13,	%i6
	mova	%icc,	%o4,	%i2
	bvc,pn	%xcc,	loop_2434
	movrne	%o7,	%i1,	%i4
	umul	%i0,	0x12B6,	%l6
	edge8	%l5,	%l4,	%i7
loop_2434:
	fmovdle	%icc,	%f31,	%f0
	fmovrse	%g7,	%f12,	%f28
	wr	%g0,	0x89,	%asi
	stwa	%g1,	[%l7 + 0x20] %asi
	movre	%g3,	%l0,	%i3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%o0,	%l2
	fandnot2	%f10,	%f18,	%f12
	move	%icc,	%o6,	%i5
	udiv	%o5,	0x0B5D,	%o1
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o2
	wr	%g0,	0x89,	%asi
	stxa	%g6,	[%l7 + 0x48] %asi
	brnz,a	%o3,	loop_2435
	ldsw	[%l7 + 0x18],	%g4
	addccc	%g5,	0x1938,	%l1
	bvs,pt	%icc,	loop_2436
loop_2435:
	brlez,a	%g2,	loop_2437
	sub	%i6,	0x1561,	%o4
	addc	%l3,	0x11C9,	%o7
loop_2436:
	ble,a,pn	%xcc,	loop_2438
loop_2437:
	and	%i1,	0x0343,	%i4
	fpadd16s	%f13,	%f21,	%f2
	tgu	%xcc,	0x3
loop_2438:
	xor	%i2,	%l6,	%i0
	smul	%l5,	%i7,	%l4
	fmovrsgez	%g7,	%f15,	%f11
	popc	%g1,	%l0
	srl	%g3,	%o0,	%i3
	edge32n	%l2,	%o6,	%o5
	fxnor	%f24,	%f6,	%f12
	flush	%l7 + 0x4C
	sra	%o1,	%i5,	%o2
	tne	%xcc,	0x6
	fmovsn	%xcc,	%f15,	%f13
	std	%f0,	[%l7 + 0x20]
	brlz	%o3,	loop_2439
	fbu	%fcc2,	loop_2440
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f26
	tsubcctv	%g4,	%g6,	%l1
loop_2439:
	move	%xcc,	%g2,	%i6
loop_2440:
	movvc	%icc,	%g5,	%l3
	fcmple16	%f8,	%f10,	%o4
	addcc	%o7,	0x1DFE,	%i4
	tgu	%xcc,	0x5
	andcc	%i2,	%l6,	%i0
	tgu	%xcc,	0x2
	alignaddr	%l5,	%i7,	%l4
	fbu,a	%fcc1,	loop_2441
	ldsw	[%l7 + 0x0C],	%i1
	stb	%g1,	[%l7 + 0x51]
	sdiv	%l0,	0x14DC,	%g3
loop_2441:
	bg	loop_2442
	addc	%o0,	%g7,	%i3
	fxor	%f22,	%f10,	%f10
	edge16	%o6,	%o5,	%l2
loop_2442:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i5,	%o2
	edge16l	%o3,	%o1,	%g6
	set	0x40, %o6
	swapa	[%l7 + %o6] 0x80,	%g4
	fmul8x16	%f30,	%f6,	%f0
	taddcctv	%g2,	0x0E01,	%i6
	movvc	%xcc,	%l1,	%l3
	fandnot2	%f26,	%f2,	%f24
	brnz	%g5,	loop_2443
	nop
	fitod	%f0,	%f22
	fdtoi	%f22,	%f12
	nop
	fitod	%f12,	%f28
	fdtox	%f28,	%f12
	xor	%o7,	%o4,	%i4
loop_2443:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i2
	fmovse	%icc,	%f22,	%f0
	tle	%xcc,	0x1
	movcs	%icc,	%i0,	%l6
	sra	%i7,	%l4,	%l5
	ldx	[%l7 + 0x60],	%i1
	tpos	%icc,	0x4
	edge8	%l0,	%g1,	%o0
	andncc	%g7,	%g3,	%i3
	wr	%g0,	0x89,	%asi
	stxa	%o5,	[%l7 + 0x20] %asi
	fbn,a	%fcc3,	loop_2444
	brlez,a	%l2,	loop_2445
	fmul8x16	%f6,	%f10,	%f8
	nop
	fitod	%f10,	%f30
	fdtoi	%f30,	%f15
loop_2444:
	sth	%o6,	[%l7 + 0x66]
loop_2445:
	fbul,a	%fcc0,	loop_2446
	array8	%i5,	%o2,	%o3
	te	%icc,	0x3
	set	0x38, %l6
	lda	[%l7 + %l6] 0x10,	%f3
loop_2446:
	xnor	%g6,	%g4,	%o1
	srlx	%g2,	0x0D,	%i6
	sll	%l1,	0x0B,	%g5
	sdivcc	%o7,	0x0C8A,	%l3
	sdiv	%o4,	0x0FC5,	%i2
	tge	%icc,	0x5
	sllx	%i0,	0x0A,	%l6
	subcc	%i4,	0x186D,	%l4
	alignaddrl	%l5,	%i7,	%i1
	tne	%icc,	0x3
	udiv	%g1,	0x1055,	%l0
	nop
	setx	loop_2447,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bgu,a,pt	%icc,	loop_2448
	fcmple32	%f28,	%f6,	%g7
	set	0x76, %i7
	ldsha	[%l7 + %i7] 0x04,	%g3
loop_2447:
	membar	0x62
loop_2448:
	subc	%o0,	0x0CC8,	%o5
	srlx	%i3,	%o6,	%l2
	movne	%icc,	%o2,	%i5
	brnz,a	%o3,	loop_2449
	orcc	%g4,	0x1D1E,	%g6
	fxor	%f4,	%f26,	%f2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x04,	%o1,	%i6
loop_2449:
	movle	%xcc,	%g2,	%l1
	tn	%icc,	0x4
	sllx	%g5,	%l3,	%o7
	fmovd	%f4,	%f20
	ldsw	[%l7 + 0x14],	%i2
	nop
	fitos	%f5,	%f1
	fstox	%f1,	%f14
	movre	%i0,	0x299,	%o4
	edge16ln	%i4,	%l6,	%l5
	fornot2s	%f4,	%f10,	%f16
	orn	%l4,	0x142F,	%i1
	bg	%xcc,	loop_2450
	movne	%xcc,	%g1,	%l0
	ld	[%l7 + 0x28],	%f23
	fabsd	%f12,	%f24
loop_2450:
	srlx	%i7,	%g3,	%o0
	nop
	setx	0x79E809FBFFA04A27,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x884458CF3ADFF436,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f0,	%f6
	brgez,a	%g7,	loop_2451
	ld	[%l7 + 0x44],	%f13
	membar	0x4C
	fmuld8sux16	%f18,	%f23,	%f8
loop_2451:
	edge8l	%i3,	%o6,	%l2
	movrne	%o2,	0x213,	%i5
	bge,a	loop_2452
	subccc	%o5,	%g4,	%g6
	bcs,a	loop_2453
	array16	%o3,	%o1,	%i6
loop_2452:
	fbg,a	%fcc2,	loop_2454
	fsrc2	%f8,	%f26
loop_2453:
	movcs	%xcc,	%g2,	%g5
	andn	%l3,	0x05CA,	%l1
loop_2454:
	sdivcc	%o7,	0x01AB,	%i0
	fbule,a	%fcc2,	loop_2455
	sub	%o4,	0x0ACC,	%i2
	nop
	fitos	%f14,	%f13
	fstoi	%f13,	%f20
	fpadd16	%f8,	%f0,	%f26
loop_2455:
	subc	%i4,	%l5,	%l6
	xnorcc	%l4,	0x118A,	%g1
	and	%i1,	0x1DEC,	%i7
	fmovrdne	%l0,	%f30,	%f10
	edge8ln	%o0,	%g7,	%g3
	udiv	%o6,	0x1DCB,	%i3
	nop
	setx	0x206FDE5A,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	edge16l	%o2,	%i5,	%l2
	movn	%xcc,	%o5,	%g6
	edge32l	%o3,	%g4,	%o1
	bvs,a,pn	%xcc,	loop_2456
	fmovdgu	%icc,	%f24,	%f1
	membar	0x7F
	fmovs	%f29,	%f5
loop_2456:
	nop
	setx	0x553509C5ED60482B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xF49245F5BE2133BD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f16,	%f14
	te	%icc,	0x6
	xorcc	%i6,	0x1E0F,	%g5
	taddcc	%l3,	%g2,	%l1
	te	%xcc,	0x1
	te	%xcc,	0x5
	bleu,a	%icc,	loop_2457
	tge	%xcc,	0x0
	bl,a	%xcc,	loop_2458
	std	%f30,	[%l7 + 0x78]
loop_2457:
	tgu	%xcc,	0x1
	nop
	setx	0x85A4F299,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x63EFC739,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f24,	%f23
loop_2458:
	movn	%xcc,	%i0,	%o4
	andcc	%o7,	0x1514,	%i2
	nop
	setx	0x385A09FDB068752C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	popc	%l5,	%i4
	movg	%xcc,	%l6,	%g1
	movrgez	%i1,	%l4,	%l0
	tsubcctv	%i7,	%g7,	%g3
	or	%o6,	0x1430,	%o0
	set	0x1C, %o1
	lda	[%l7 + %o1] 0x88,	%f25
	tvc	%xcc,	0x4
	fnegs	%f7,	%f12
	bg,pt	%xcc,	loop_2459
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
	smul	%o2,	0x06B0,	%i3
	fmovdpos	%xcc,	%f24,	%f16
loop_2459:
	fmovrslez	%l2,	%f9,	%f13
loop_2460:
	fble,a	%fcc2,	loop_2461
	bne,pn	%icc,	loop_2462
	movge	%xcc,	%i5,	%g6
	umulcc	%o5,	%g4,	%o1
loop_2461:
	and	%i6,	0x04EE,	%g5
loop_2462:
	tn	%xcc,	0x1
	sll	%l3,	0x16,	%o3
	edge8n	%l1,	%g2,	%o4
	fabss	%f18,	%f7
	movn	%xcc,	%i0,	%i2
	xnor	%l5,	0x1A75,	%o7
	fnand	%f16,	%f14,	%f28
	fzeros	%f9
	edge8l	%l6,	%g1,	%i4
	fpsub32s	%f5,	%f21,	%f27
	fblg,a	%fcc2,	loop_2463
	smul	%l4,	%l0,	%i7
	stb	%g7,	[%l7 + 0x36]
	fmovsg	%icc,	%f26,	%f25
loop_2463:
	smul	%i1,	%g3,	%o6
	fxnors	%f30,	%f10,	%f1
	edge16ln	%o2,	%o0,	%l2
	fnors	%f25,	%f26,	%f16
	edge16n	%i3,	%i5,	%o5
	fmovdge	%xcc,	%f30,	%f22
	fbe	%fcc1,	loop_2464
	udiv	%g4,	0x156A,	%o1
	movrgz	%g6,	%i6,	%g5
	fmovrslez	%o3,	%f31,	%f8
loop_2464:
	ta	%icc,	0x4
	fbl,a	%fcc0,	loop_2465
	fmovdcc	%xcc,	%f23,	%f7
	nop
	fitos	%f6,	%f19
	fstox	%f19,	%f6
	fxtos	%f6,	%f12
	fnegd	%f4,	%f2
loop_2465:
	edge8l	%l3,	%l1,	%g2
	sub	%i0,	0x04D2,	%i2
	fpsub16	%f6,	%f8,	%f30
	ldd	[%l7 + 0x60],	%f0
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x6E] %asi,	%o4
	brz,a	%o7,	loop_2466
	movrlez	%l5,	0x238,	%g1
	xor	%i4,	0x1F2C,	%l6
	movge	%xcc,	%l0,	%i7
loop_2466:
	fmovdleu	%xcc,	%f25,	%f26
	fone	%f18
	fnors	%f31,	%f16,	%f24
	ldsh	[%l7 + 0x54],	%l4
	fmovdl	%icc,	%f20,	%f21
	fpsub32	%f10,	%f14,	%f28
	movrne	%g7,	0x0AC,	%g3
	fmul8x16au	%f21,	%f30,	%f8
	array8	%i1,	%o2,	%o0
	fbge	%fcc3,	loop_2467
	mulx	%l2,	%i3,	%o6
	wr	%g0,	0x2a,	%asi
	stxa	%o5,	[%l7 + 0x48] %asi
	membar	#Sync
loop_2467:
	nop
	setx	0xFFF432F5C053FCD6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x56] %asi,	%g4
	edge32l	%o1,	%g6,	%i5
	fmovsgu	%xcc,	%f4,	%f29
	nop
	set	0x2C, %o2
	lduw	[%l7 + %o2],	%i6
	fexpand	%f24,	%f24
	udivcc	%g5,	0x00FA,	%o3
	fornot2	%f6,	%f28,	%f22
	sir	0x11D0
	fmovdneg	%icc,	%f27,	%f2
	ldstub	[%l7 + 0x32],	%l3
	array16	%g2,	%i0,	%i2
	sdivx	%l1,	0x165F,	%o4
	tpos	%xcc,	0x6
	array32	%l5,	%o7,	%g1
	set	0x1E, %i1
	ldsha	[%l7 + %i1] 0x88,	%i4
	fpsub32s	%f11,	%f8,	%f10
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l6
	fmul8ulx16	%f18,	%f4,	%f30
	prefetch	[%l7 + 0x08],	 0x1
	bne,a	%icc,	loop_2468
	faligndata	%f28,	%f28,	%f14
	smul	%l0,	%l4,	%g7
	fcmpne32	%f18,	%f6,	%i7
loop_2468:
	membar	0x5B
	array8	%i1,	%g3,	%o0
	fbo	%fcc3,	loop_2469
	fors	%f31,	%f28,	%f20
	subccc	%l2,	%o2,	%i3
	ldstub	[%l7 + 0x73],	%o5
loop_2469:
	tneg	%xcc,	0x3
	bvc,a	%xcc,	loop_2470
	xnorcc	%o6,	%o1,	%g6
	xnorcc	%g4,	0x0D1B,	%i6
	movrlez	%i5,	%g5,	%o3
loop_2470:
	membar	0x10
	nop
	setx	loop_2471,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx loop_2472, %l0, %l1
	jmpl %l1, %g2
	call	loop_2473
	srl	%l3,	%i0,	%i2
loop_2471:
	nop
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x80
loop_2472:
	movle	%xcc,	%l1,	%o4
loop_2473:
	edge16	%o7,	%g1,	%i4
	sdiv	%l6,	0x18F3,	%l5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x3B] %asi,	%l4
	set	0x20, %i0
	stwa	%g7,	[%l7 + %i0] 0xea
	membar	#Sync
	nop
	setx	0x64950700,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f20
	tcs	%xcc,	0x6
	bl,a	%xcc,	loop_2474
	sub	%l0,	%i7,	%i1
	tpos	%xcc,	0x6
	lduw	[%l7 + 0x78],	%o0
loop_2474:
	movg	%icc,	%l2,	%o2
	addc	%i3,	%o5,	%g3
	fnand	%f28,	%f18,	%f22
	andcc	%o1,	%o6,	%g4
	tsubcc	%g6,	0x12B9,	%i6
	addc	%g5,	%i5,	%g2
	nop
	fitod	%f4,	%f24
	fdtoi	%f24,	%f7
	fsrc2	%f18,	%f0
	tge	%icc,	0x1
	fandnot1s	%f27,	%f26,	%f10
	movvc	%icc,	%l3,	%o3
	fandnot2s	%f31,	%f8,	%f24
	sllx	%i0,	%l1,	%i2
	bl,a,pt	%xcc,	loop_2475
	bleu,a,pn	%icc,	loop_2476
	ldd	[%l7 + 0x18],	%o6
	tl	%icc,	0x5
loop_2475:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%g1
loop_2476:
	edge16l	%i4,	%l6,	%l5
	ta	%icc,	0x4
	sra	%l4,	0x1B,	%g7
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x2A] %asi,	%i7
	set	0x62, %l1
	lduba	[%l7 + %l1] 0x81,	%i1
	ldd	[%l7 + 0x50],	%o0
	fmovrsgz	%l2,	%f3,	%f29
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%o2
	alignaddr	%l0,	%o5,	%i3
	fbge	%fcc1,	loop_2477
	call	loop_2478
	sllx	%o1,	0x15,	%o6
	tgu	%xcc,	0x4
loop_2477:
	mova	%xcc,	%g3,	%g6
loop_2478:
	fbl	%fcc0,	loop_2479
	tne	%xcc,	0x1
	movneg	%xcc,	%g4,	%g5
	array8	%i5,	%g2,	%i6
loop_2479:
	bvs	loop_2480
	movgu	%icc,	%l3,	%o3
	ta	%icc,	0x2
	movcs	%icc,	%l1,	%i0
loop_2480:
	movneg	%xcc,	%o7,	%o4
	tsubcctv	%i2,	%i4,	%l6
	udiv	%l5,	0x15D8,	%l4
	movl	%icc,	%g7,	%g1
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f16
	fxtod	%f16,	%f4
	nop
	setx	0x9FC6DC4655AA6202,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xF0C40DE004B53635,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f24,	%f18
	fba,a	%fcc0,	loop_2481
	tsubcctv	%i1,	0x09E1,	%i7
	set	0x74, %l5
	lda	[%l7 + %l5] 0x11,	%f12
loop_2481:
	nop
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf1
	membar	#Sync
	fpadd16	%f10,	%f8,	%f0
	edge16ln	%l2,	%o2,	%o0
	fand	%f12,	%f24,	%f16
	be,a	%icc,	loop_2482
	nop
	setx	0x6D805FDF2C8CF6FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xE4FB83D3345E137D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f28,	%f20
	andncc	%o5,	%l0,	%o1
	nop
	setx	0x36614343,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xEFF92890,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f2,	%f7
loop_2482:
	movcs	%icc,	%o6,	%i3
	andncc	%g3,	%g6,	%g4
	fnands	%f5,	%f26,	%f8
	or	%g5,	%i5,	%g2
	alignaddr	%l3,	%o3,	%l1
	taddcctv	%i6,	%o7,	%i0
	movleu	%xcc,	%i2,	%i4
	orncc	%o4,	%l6,	%l4
	movrgez	%g7,	0x2FD,	%l5
	brlez,a	%i1,	loop_2483
	subc	%g1,	%i7,	%l2
	nop
	setx loop_2484, %l0, %l1
	jmpl %l1, %o2
	nop
	setx	loop_2485,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2483:
	sir	0x164B
	fbue,a	%fcc3,	loop_2486
loop_2484:
	fmovrdgez	%o5,	%f2,	%f22
loop_2485:
	bge,a	%xcc,	loop_2487
	sdiv	%o0,	0x0510,	%o1
loop_2486:
	edge8ln	%l0,	%i3,	%o6
	set	0x1D, %l4
	ldstuba	[%l7 + %l4] 0x89,	%g3
loop_2487:
	ldd	[%l7 + 0x68],	%g6
	fmovrse	%g4,	%f13,	%f14
	fnor	%f20,	%f28,	%f20
	ld	[%l7 + 0x1C],	%f24
	andncc	%g5,	%g2,	%l3
	fsrc2	%f20,	%f20
	bne,a,pn	%xcc,	loop_2488
	ld	[%l7 + 0x14],	%f25
	stb	%i5,	[%l7 + 0x3F]
	andcc	%l1,	0x19A6,	%i6
loop_2488:
	andncc	%o3,	%i0,	%o7
	udiv	%i2,	0x0061,	%o4
	xorcc	%l6,	0x0C59,	%l4
	tne	%xcc,	0x2
	movrlez	%g7,	%i4,	%i1
	movne	%icc,	%g1,	%l5
	movge	%xcc,	%l2,	%o2
	fnegd	%f12,	%f16
	umul	%i7,	%o5,	%o1
	brz,a	%l0,	loop_2489
	nop
	fitos	%f11,	%f31
	fstod	%f31,	%f22
	andcc	%i3,	%o0,	%o6
	mova	%xcc,	%g6,	%g3
loop_2489:
	fbge	%fcc1,	loop_2490
	tge	%xcc,	0x2
	movge	%icc,	%g5,	%g2
	movvc	%xcc,	%g4,	%l3
loop_2490:
	tpos	%xcc,	0x5
	fbul	%fcc3,	loop_2491
	array32	%i5,	%l1,	%o3
	nop
	setx	0xF0E8E144104FE395,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fmovrdlez	%i6,	%f4,	%f22
loop_2491:
	ld	[%l7 + 0x68],	%f15
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x27] %asi,	%o7
	fpadd16s	%f13,	%f22,	%f31
	fpmerge	%f0,	%f4,	%f10
	movrgez	%i0,	0x371,	%o4
	ldsh	[%l7 + 0x3E],	%l6
	prefetch	[%l7 + 0x38],	 0x3
	set	0x28, %i3
	prefetcha	[%l7 + %i3] 0x19,	 0x3
	srax	%g7,	0x05,	%i2
	fcmpne16	%f18,	%f6,	%i4
	brgz,a	%i1,	loop_2492
	movle	%icc,	%g1,	%l5
	xnorcc	%l2,	0x192F,	%o2
	nop
	setx	0x7D2DC0701042A4CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_2492:
	fmovspos	%icc,	%f12,	%f17
	popc	%o5,	%o1
	tleu	%icc,	0x7
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x10
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f9
	fbne,a	%fcc3,	loop_2493
	fone	%f2
	sra	%i7,	0x17,	%i3
	bvs,a,pt	%icc,	loop_2494
loop_2493:
	bn,a	%xcc,	loop_2495
	subc	%l0,	0x1CEB,	%o0
	fmovrdgez	%o6,	%f8,	%f20
loop_2494:
	udivcc	%g6,	0x0CF1,	%g3
loop_2495:
	smulcc	%g5,	0x0E5C,	%g4
	membar	0x63
	ldsw	[%l7 + 0x68],	%l3
	tgu	%xcc,	0x7
	add	%g2,	%i5,	%l1
	or	%i6,	0x0CF8,	%o3
	edge16l	%i0,	%o4,	%o7
	fmovs	%f27,	%f28
	fandnot1s	%f14,	%f13,	%f21
	set	0x0A, %i5
	stha	%l4,	[%l7 + %i5] 0xe3
	membar	#Sync
	sdivcc	%g7,	0x19BC,	%i2
	fmovrslez	%l6,	%f0,	%f3
	sra	%i4,	0x09,	%i1
	set	0x78, %o0
	stxa	%l5,	[%l7 + %o0] 0x89
	fmul8ulx16	%f0,	%f2,	%f6
	smulcc	%l2,	%g1,	%o2
	brz,a	%o1,	loop_2496
	fmovs	%f18,	%f21
	umul	%o5,	%i3,	%i7
	fpack16	%f4,	%f21
loop_2496:
	or	%o0,	0x02B9,	%l0
	movrgz	%g6,	%o6,	%g5
	set	0x73, %g4
	stba	%g3,	[%l7 + %g4] 0x14
	fbg,a	%fcc0,	loop_2497
	fmovrdlez	%l3,	%f30,	%f12
	ta	%xcc,	0x1
	tneg	%xcc,	0x5
loop_2497:
	bleu,pt	%icc,	loop_2498
	fmovscs	%xcc,	%f28,	%f10
	or	%g2,	0x1787,	%i5
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x7D] %asi,	%l1
loop_2498:
	addccc	%i6,	%g4,	%o3
	set	0x10, %o5
	lduwa	[%l7 + %o5] 0x11,	%i0
	fnegd	%f16,	%f28
	fnands	%f11,	%f30,	%f9
	flush	%l7 + 0x24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o4,	%l4
	smulcc	%g7,	%o7,	%i2
	fpsub32	%f6,	%f4,	%f26
	srax	%i4,	0x0F,	%i1
	popc	0x029C,	%l5
	andncc	%l6,	%g1,	%l2
	fpsub16	%f26,	%f18,	%f8
	fmovdle	%xcc,	%f29,	%f1
	fmovrdne	%o1,	%f4,	%f4
	edge16	%o5,	%i3,	%i7
	tsubcc	%o2,	%l0,	%g6
	fand	%f6,	%f18,	%f8
	edge16	%o0,	%g5,	%g3
	brlz,a	%o6,	loop_2499
	fmovdcs	%icc,	%f28,	%f25
	ldub	[%l7 + 0x59],	%l3
	flush	%l7 + 0x1C
loop_2499:
	movneg	%icc,	%g2,	%l1
	fcmpgt32	%f24,	%f18,	%i5
	fble	%fcc2,	loop_2500
	fmovrdgez	%g4,	%f16,	%f30
	brlz	%i6,	loop_2501
	fmovdne	%icc,	%f23,	%f14
loop_2500:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x60] %asi,	%i0
loop_2501:
	fmovdpos	%icc,	%f15,	%f25
	edge32	%o3,	%l4,	%o4
	fmovd	%f22,	%f10
	te	%xcc,	0x1
	fmovdge	%icc,	%f18,	%f22
	ba	loop_2502
	movl	%icc,	%g7,	%i2
	movgu	%xcc,	%o7,	%i1
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l5
loop_2502:
	nop
	wr	%g0,	0xe3,	%asi
	stxa	%l6,	[%l7 + 0x10] %asi
	membar	#Sync
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x15
	fmovsgu	%icc,	%f9,	%f20
	tcs	%icc,	0x5
	fbne	%fcc1,	loop_2503
	movrne	%g1,	0x293,	%i4
	movrlz	%l2,	0x23C,	%o1
	prefetch	[%l7 + 0x20],	 0x2
loop_2503:
	subcc	%o5,	0x1AB0,	%i3
	edge32	%i7,	%l0,	%o2
	nop
	setx	0xCBBC9F57B0428941,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	addccc	%o0,	0x09AF,	%g6
	movne	%icc,	%g3,	%g5
	fmovscs	%icc,	%f17,	%f0
	fmovsleu	%icc,	%f4,	%f16
	movn	%icc,	%o6,	%g2
	tle	%icc,	0x2
	andncc	%l3,	%l1,	%g4
	fcmpgt16	%f12,	%f12,	%i5
	udivcc	%i0,	0x169E,	%o3
	sll	%i6,	0x1E,	%o4
	andcc	%l4,	0x1E97,	%i2
	fcmpeq16	%f30,	%f26,	%o7
	andncc	%i1,	%g7,	%l5
	fsrc2s	%f0,	%f11
	ldstub	[%l7 + 0x49],	%l6
	srlx	%i4,	0x14,	%l2
	subccc	%o1,	0x0906,	%o5
	fba	%fcc1,	loop_2504
	fmovsvs	%xcc,	%f19,	%f10
	edge8	%g1,	%i3,	%i7
	movgu	%icc,	%o2,	%o0
loop_2504:
	bvc,a	loop_2505
	bleu,a,pn	%icc,	loop_2506
	fnot1s	%f27,	%f5
	mulx	%l0,	0x1685,	%g6
loop_2505:
	nop
	setx	0x39CDCE73CC5EEB02,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x436A00FF4B08159E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f20,	%f18
loop_2506:
	nop
	set	0x44, %o3
	lduha	[%l7 + %o3] 0x19,	%g5
	fmovsg	%xcc,	%f10,	%f3
	edge8l	%g3,	%o6,	%l3
	set	0x24, %i4
	lduha	[%l7 + %i4] 0x14,	%g2
	movrlz	%l1,	0x00C,	%g4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x0c,	%i0,	%o3
	movrgz	%i5,	0x0ED,	%i6
	fones	%f28
	bneg,a,pn	%xcc,	loop_2507
	fone	%f2
	movre	%o4,	%l4,	%o7
	swap	[%l7 + 0x74],	%i1
loop_2507:
	sethi	0x190D,	%g7
	nop
	fitos	%f11,	%f31
	fstox	%f31,	%f22
	array32	%l5,	%i2,	%i4
	fexpand	%f25,	%f8
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x18] %asi,	%f30
	srax	%l6,	0x13,	%l2
	smul	%o1,	%o5,	%g1
	orncc	%i7,	0x16F7,	%i3
	xnor	%o0,	%o2,	%g6
	edge16	%l0,	%g3,	%o6
	edge8ln	%l3,	%g5,	%g2
	sdivcc	%l1,	0x1546,	%i0
	bgu,pt	%icc,	loop_2508
	tsubcc	%g4,	%o3,	%i6
	movpos	%xcc,	%o4,	%l4
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x30] %asi,	%i5
loop_2508:
	nop
	setx	0x710A0661004407C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	tn	%xcc,	0x0
	fpsub32s	%f11,	%f9,	%f23
	movrne	%o7,	0x3B4,	%l5
	movrgz	%i2,	%g7,	%l6
	andn	%l2,	0x0C27,	%o1
	tcc	%icc,	0x3
	tleu	%icc,	0x7
	fbo	%fcc1,	loop_2509
	tle	%icc,	0x6
	edge16n	%i4,	%g1,	%i7
	prefetch	[%l7 + 0x24],	 0x1
loop_2509:
	fmovrsgz	%o5,	%f31,	%f0
	brgz	%i3,	loop_2510
	fcmpne32	%f18,	%f2,	%o2
	movneg	%xcc,	%o0,	%g6
	edge8	%l0,	%g3,	%l3
loop_2510:
	nop
	fitod	%f2,	%f24
	fdtox	%f24,	%f20
	set	0x1E, %o4
	lduha	[%l7 + %o4] 0x14,	%g5
	movpos	%icc,	%g2,	%o6
	for	%f0,	%f20,	%f26
	bvc,pt	%icc,	loop_2511
	srax	%l1,	0x0C,	%i0
	nop
	setx	0xC09E193844C1D611,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f22
	tg	%xcc,	0x5
loop_2511:
	movrgez	%g4,	%i6,	%o4
	fandnot2s	%f17,	%f0,	%f22
	bneg,a	%xcc,	loop_2512
	popc	%o3,	%l4
	ta	%icc,	0x3
	udivx	%i1,	0x1393,	%o7
loop_2512:
	edge8n	%i5,	%l5,	%g7
	tcs	%xcc,	0x5
	movgu	%xcc,	%i2,	%l2
	smulcc	%o1,	0x0F0F,	%i4
	tneg	%xcc,	0x4
	fzero	%f22
	lduw	[%l7 + 0x68],	%g1
	fsrc1s	%f10,	%f2
	xor	%i7,	0x1D30,	%l6
	nop
	setx	loop_2513,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvc,pn	%xcc,	loop_2514
	fmul8ulx16	%f26,	%f10,	%f2
	fblg	%fcc1,	loop_2515
loop_2513:
	st	%f25,	[%l7 + 0x08]
loop_2514:
	membar	0x48
	nop
	setx	loop_2516,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2515:
	stb	%o5,	[%l7 + 0x16]
	fones	%f2
	fnegs	%f16,	%f21
loop_2516:
	fbuge	%fcc1,	loop_2517
	tcs	%xcc,	0x5
	lduh	[%l7 + 0x7A],	%o2
	udiv	%i3,	0x19D7,	%o0
loop_2517:
	bn,a,pn	%icc,	loop_2518
	srlx	%l0,	%g6,	%g3
	fsrc2	%f8,	%f8
	fcmple16	%f2,	%f6,	%g5
loop_2518:
	array8	%l3,	%g2,	%l1
	edge8ln	%o6,	%g4,	%i6
	movle	%xcc,	%o4,	%o3
	srax	%l4,	0x16,	%i0
	fblg	%fcc0,	loop_2519
	sllx	%o7,	0x07,	%i5
	brgz,a	%l5,	loop_2520
	brnz	%i1,	loop_2521
loop_2519:
	and	%g7,	%i2,	%l2
	edge16l	%o1,	%i4,	%g1
loop_2520:
	xnorcc	%i7,	%o5,	%o2
loop_2521:
	fnors	%f20,	%f31,	%f17
	fpsub32	%f6,	%f12,	%f12
	subc	%l6,	%i3,	%o0
	tsubcc	%g6,	%g3,	%l0
	tpos	%xcc,	0x3
	movrlz	%l3,	%g2,	%g5
	edge16	%o6,	%g4,	%i6
	nop
	fitod	%f2,	%f22
	fdtox	%f22,	%f6
	andcc	%l1,	%o4,	%l4
	ldsb	[%l7 + 0x3C],	%o3
	ble,a	loop_2522
	bge,pn	%icc,	loop_2523
	mulscc	%o7,	%i0,	%i5
	fmovrdlz	%l5,	%f26,	%f0
loop_2522:
	fabsd	%f12,	%f4
loop_2523:
	nop
	set	0x28, %g7
	lduw	[%l7 + %g7],	%g7
	std	%f22,	[%l7 + 0x10]
	mulx	%i1,	%l2,	%i2
	bn,a	loop_2524
	edge32	%o1,	%g1,	%i7
	sra	%i4,	0x13,	%o5
	stbar
loop_2524:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f21,	%f28,	%f0
	fpsub32s	%f14,	%f30,	%f6
	xor	%l6,	%i3,	%o0
	taddcc	%o2,	%g3,	%g6
	movge	%xcc,	%l0,	%l3
	movleu	%icc,	%g5,	%g2
	smul	%o6,	0x0ED2,	%i6
	bcs,a,pt	%xcc,	loop_2525
	bpos,a	loop_2526
	array16	%l1,	%o4,	%g4
	srlx	%o3,	0x16,	%l4
loop_2525:
	fmul8ulx16	%f0,	%f20,	%f30
loop_2526:
	sethi	0x1AB9,	%o7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x81,	%i5,	%i0
	nop
	fitod	%f6,	%f24
	fdtos	%f24,	%f9
	edge8n	%l5,	%i1,	%l2
	edge16ln	%i2,	%o1,	%g7
	sir	0x19BA
	fmovs	%f31,	%f5
	tn	%xcc,	0x3
	sdivcc	%i7,	0x09E2,	%g1
	nop
	setx	0xBBB2B50F8C95B943,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x64C7CD9906101224,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f6,	%f12
	andn	%i4,	0x0DE4,	%l6
	edge8n	%o5,	%o0,	%o2
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f2
	movvc	%icc,	%g3,	%g6
	edge16	%i3,	%l0,	%l3
	fpmerge	%f6,	%f18,	%f30
	movrlez	%g5,	%g2,	%o6
	sdivcc	%l1,	0x15D4,	%i6
	umul	%o4,	0x0044,	%g4
	fbule,a	%fcc0,	loop_2527
	andcc	%l4,	%o3,	%o7
	brnz	%i5,	loop_2528
	movle	%xcc,	%l5,	%i0
loop_2527:
	for	%f4,	%f24,	%f22
	tsubcctv	%l2,	0x1A47,	%i2
loop_2528:
	fmovd	%f26,	%f30
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x0A] %asi,	%i1
	movl	%icc,	%g7,	%i7
	mova	%icc,	%o1,	%i4
	movn	%xcc,	%l6,	%g1
	move	%xcc,	%o0,	%o2
	movrne	%o5,	0x094,	%g6
	tneg	%icc,	0x5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%g3,	%l0
	taddcc	%l3,	0x1BFE,	%i3
	fbge	%fcc0,	loop_2529
	popc	%g2,	%g5
	fornot1	%f30,	%f16,	%f28
	tne	%icc,	0x3
loop_2529:
	sub	%l1,	%i6,	%o4
	addc	%g4,	0x01E5,	%o6
	tcc	%xcc,	0x7
	set	0x26, %l2
	ldsba	[%l7 + %l2] 0x18,	%o3
	brlez,a	%l4,	loop_2530
	sdivcc	%i5,	0x0FB0,	%o7
	movgu	%xcc,	%l5,	%l2
	sdivcc	%i0,	0x1469,	%i2
loop_2530:
	subc	%g7,	%i1,	%o1
	movrlez	%i4,	%l6,	%i7
	udiv	%g1,	0x15D8,	%o2
	nop
	fitod	%f2,	%f8
	fdtoi	%f8,	%f5
	fmovsge	%icc,	%f31,	%f31
	ldx	[%l7 + 0x10],	%o0
	nop
	setx	0x6F3BB753,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f25
	membar	0x23
	bgu,pt	%xcc,	loop_2531
	tl	%xcc,	0x2
	set	0x30, %g2
	prefetcha	[%l7 + %g2] 0x0c,	 0x2
loop_2531:
	and	%g3,	%o5,	%l0
	bn,pt	%icc,	loop_2532
	subc	%l3,	0x022F,	%i3
	fba	%fcc1,	loop_2533
	sdivx	%g5,	0x1945,	%g2
loop_2532:
	movg	%xcc,	%i6,	%o4
	addccc	%l1,	0x1C44,	%o6
loop_2533:
	nop
	set	0x66, %i6
	lduh	[%l7 + %i6],	%o3
	movrgez	%g4,	%l4,	%o7
	movneg	%xcc,	%i5,	%l2
	udivx	%i0,	0x0A66,	%l5
	mova	%xcc,	%i2,	%i1
	umulcc	%g7,	0x10F9,	%o1
	and	%i4,	%l6,	%g1
	fbe	%fcc3,	loop_2534
	fmovrdlez	%o2,	%f24,	%f26
	fnors	%f24,	%f9,	%f12
	and	%i7,	%o0,	%g3
loop_2534:
	subc	%o5,	0x038D,	%g6
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f6
	fxtod	%f6,	%f22
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x48] %asi,	%f15
	nop
	setx	loop_2535,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%l3,	0x04C7,	%l0
	tvs	%icc,	0x7
	movgu	%icc,	%i3,	%g5
loop_2535:
	subcc	%g2,	%i6,	%l1
	mulx	%o6,	%o3,	%o4
	udiv	%g4,	0x00ED,	%l4
	movvc	%xcc,	%i5,	%o7
	movrgz	%i0,	0x24A,	%l2
	nop
	setx	0x807F5A4B,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	movne	%icc,	%i2,	%l5
	mulscc	%g7,	%i1,	%i4
	set	0x20, %g6
	stxa	%o1,	[%l7 + %g6] 0x14
	fxor	%f14,	%f18,	%f28
	wr	%g0,	0x2a,	%asi
	stwa	%l6,	[%l7 + 0x1C] %asi
	membar	#Sync
	lduw	[%l7 + 0x54],	%o2
	smul	%g1,	%o0,	%g3
	membar	0x0E
	nop
	fitos	%f2,	%f17
	fstox	%f17,	%f26
	sdivcc	%i7,	0x1EA1,	%o5
	movre	%g6,	%l0,	%i3
	fbuge	%fcc1,	loop_2536
	fcmpne32	%f2,	%f16,	%g5
	prefetch	[%l7 + 0x34],	 0x2
	fabsd	%f14,	%f22
loop_2536:
	fmovde	%icc,	%f29,	%f3
	nop
	setx	0x1458C98E48D2DACC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f2
	orncc	%l3,	%g2,	%i6
	tneg	%icc,	0x6
	taddcc	%l1,	%o3,	%o6
	tle	%icc,	0x5
	tneg	%xcc,	0x1
	fbuge,a	%fcc2,	loop_2537
	movcc	%xcc,	%g4,	%l4
	flush	%l7 + 0x14
	nop
	set	0x54, %l0
	stw	%o4,	[%l7 + %l0]
loop_2537:
	andncc	%i5,	%o7,	%l2
	movcc	%icc,	%i0,	%l5
	movn	%xcc,	%g7,	%i2
	nop
	setx	loop_2538,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16	%f11,	%f30,	%f12
	ta	%icc,	0x1
	brgz	%i4,	loop_2539
loop_2538:
	nop
	set	0x1C, %g5
	ldsw	[%l7 + %g5],	%i1
	set	0x4E, %o6
	stha	%l6,	[%l7 + %o6] 0x15
loop_2539:
	fxnors	%f22,	%f12,	%f12
	movleu	%icc,	%o1,	%o2
	fbge	%fcc3,	loop_2540
	fmovdcs	%xcc,	%f16,	%f5
	swap	[%l7 + 0x48],	%o0
	wr	%g0,	0x23,	%asi
	stwa	%g3,	[%l7 + 0x08] %asi
	membar	#Sync
loop_2540:
	umul	%g1,	%i7,	%o5
	stbar
	fble	%fcc0,	loop_2541
	srlx	%l0,	0x10,	%i3
	edge8	%g5,	%g6,	%l3
	fmovsl	%icc,	%f15,	%f9
loop_2541:
	movvs	%xcc,	%i6,	%l1
	sdivx	%g2,	0x14A1,	%o3
	edge32	%g4,	%l4,	%o4
	andcc	%i5,	0x0192,	%o7
	xnor	%l2,	0x0256,	%o6
	fmul8x16	%f10,	%f24,	%f26
	taddcc	%l5,	0x1125,	%g7
	udivcc	%i0,	0x1BF1,	%i2
	orncc	%i4,	%i1,	%o1
	ld	[%l7 + 0x6C],	%f19
	addccc	%o2,	0x0B5E,	%l6
	set	0x44, %g3
	lda	[%l7 + %g3] 0x14,	%f4
	fcmpeq16	%f6,	%f28,	%o0
	fpsub16	%f20,	%f12,	%f8
	alignaddr	%g1,	%g3,	%o5
	fblg	%fcc1,	loop_2542
	nop
	setx	0x69DF431B960B6864,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xA4F75E735715576A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f4,	%f22
	sdivx	%i7,	0x02CC,	%l0
	addcc	%i3,	%g6,	%g5
loop_2542:
	ble	loop_2543
	smul	%l3,	0x1F3F,	%l1
	fbul	%fcc0,	loop_2544
	movcc	%xcc,	%i6,	%g2
loop_2543:
	ldx	[%l7 + 0x58],	%g4
	fba	%fcc1,	loop_2545
loop_2544:
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f6
	fxtod	%f6,	%f18
	xor	%l4,	0x1675,	%o4
	subcc	%i5,	%o7,	%o3
loop_2545:
	movvc	%icc,	%o6,	%l2
	sth	%g7,	[%l7 + 0x76]
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
	tvs	%icc,	0x1
	bneg,a,pn	%xcc,	loop_2547
	tcs	%icc,	0x5
loop_2546:
	fmovdg	%icc,	%f7,	%f4
	set	0x1E, %i7
	stha	%i0,	[%l7 + %i7] 0xe3
	membar	#Sync
loop_2547:
	fbuge	%fcc0,	loop_2548
	nop
	setx	loop_2549,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orn	%i2,	%i4,	%l5
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x58] %asi,	%f14
loop_2548:
	smulcc	%i1,	%o2,	%l6
loop_2549:
	movvs	%xcc,	%o0,	%o1
	fandnot2	%f24,	%f10,	%f4
	taddcctv	%g3,	0x1913,	%g1
	mulscc	%o5,	%l0,	%i7
	edge16	%i3,	%g6,	%l3
	st	%f10,	[%l7 + 0x38]
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x18] %asi,	%l1
	edge16	%g5,	%g2,	%g4
	bg,pn	%xcc,	loop_2550
	udivcc	%l4,	0x0995,	%i6
	fbul	%fcc1,	loop_2551
	tl	%icc,	0x3
loop_2550:
	array16	%o4,	%o7,	%o3
	smulcc	%i5,	%o6,	%g7
loop_2551:
	fnors	%f21,	%f0,	%f7
	edge8n	%i0,	%i2,	%i4
	subc	%l5,	0x0A18,	%i1
	fmovrdne	%o2,	%f6,	%f26
	edge8l	%l6,	%o0,	%o1
	edge16ln	%g3,	%g1,	%l2
	sdivx	%o5,	0x07C7,	%l0
	movcc	%icc,	%i7,	%i3
	fbe,a	%fcc0,	loop_2552
	fbul,a	%fcc1,	loop_2553
	sub	%g6,	%l3,	%l1
	mova	%xcc,	%g5,	%g2
loop_2552:
	swap	[%l7 + 0x24],	%l4
loop_2553:
	nop
	set	0x0C, %o1
	lduw	[%l7 + %o1],	%i6
	edge8l	%o4,	%g4,	%o3
	wr	%g0,	0xeb,	%asi
	stba	%o7,	[%l7 + 0x18] %asi
	membar	#Sync
	fmovsvc	%icc,	%f26,	%f20
	edge32	%i5,	%o6,	%g7
	edge8l	%i0,	%i4,	%l5
	tleu	%icc,	0x1
	movrlez	%i2,	0x23D,	%o2
	sub	%i1,	%l6,	%o1
	ble,a	loop_2554
	nop
	setx	0x0CBA0B4C55DD4650,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x91E769FAE284E81F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f26,	%f28
	edge16l	%g3,	%g1,	%o0
	sll	%l2,	0x04,	%l0
loop_2554:
	array32	%i7,	%i3,	%o5
	fcmple32	%f6,	%f28,	%g6
	fmovrsgz	%l1,	%f2,	%f10
	tl	%xcc,	0x2
	fcmpne16	%f4,	%f2,	%g5
	addcc	%g2,	0x1DD1,	%l3
	smulcc	%i6,	%o4,	%g4
	nop
	setx	0x1505173D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xDD1E3D84,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f23,	%f3
	fmovsvs	%icc,	%f26,	%f1
	nop
	set	0x0C, %o2
	lduw	[%l7 + %o2],	%o3
	movrlz	%o7,	0x1EA,	%i5
	sth	%o6,	[%l7 + 0x2C]
	wr	%g0,	0x2f,	%asi
	stha	%g7,	[%l7 + 0x60] %asi
	membar	#Sync
	tn	%xcc,	0x4
	fxnors	%f8,	%f22,	%f23
	movge	%xcc,	%l4,	%i0
	movrlez	%l5,	0x20E,	%i2
	addccc	%i4,	%o2,	%i1
	nop
	setx	loop_2555,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsneg	%xcc,	%f22,	%f2
	tvc	%xcc,	0x0
	fbo	%fcc2,	loop_2556
loop_2555:
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f20
	andcc	%o1,	%g3,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2556:
	edge32	%o0,	%g1,	%l0
	bcs,pt	%xcc,	loop_2557
	smul	%i7,	%l2,	%o5
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2557:
	ldd	[%l7 + 0x68],	%i2
	bge	loop_2558
	fexpand	%f28,	%f20
	umul	%g6,	%l1,	%g5
	andn	%l3,	%i6,	%g2
loop_2558:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%g4
	smulcc	%o7,	0x0CC5,	%o3
	movrlez	%o6,	%i5,	%l4
	andcc	%g7,	0x1E1D,	%i0
	array32	%l5,	%i4,	%o2
	subc	%i2,	%o1,	%i1
	mulscc	%l6,	0x1945,	%o0
	sra	%g3,	0x14,	%g1
	fbul	%fcc1,	loop_2559
	edge16ln	%i7,	%l2,	%o5
	brlez,a	%i3,	loop_2560
	fnot2s	%f17,	%f2
loop_2559:
	nop
	setx	0xD3390E37C05C5E64,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	movcc	%xcc,	%l0,	%g6
loop_2560:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l1,	0x04CF,	%l3
	fmovdcc	%xcc,	%f14,	%f9
	fpadd32	%f28,	%f2,	%f20
	fbule	%fcc3,	loop_2561
	nop
	fitos	%f9,	%f17
	fstox	%f17,	%f20
	fxtos	%f20,	%f2
	array32	%g5,	%i6,	%o4
	taddcctv	%g2,	%g4,	%o3
loop_2561:
	sll	%o6,	%o7,	%l4
	addc	%i5,	0x0AC0,	%i0
	sethi	0x00B5,	%g7
	nop
	fitod	%f29,	%f20
	alignaddrl	%i4,	%o2,	%l5
	tcs	%xcc,	0x5
	movcs	%xcc,	%o1,	%i2
	nop
	fitod	%f0,	%f20
	fdtox	%f20,	%f8
	fnot2s	%f27,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l6,	%o0,	%i1
	fnor	%f6,	%f24,	%f12
	brlez,a	%g1,	loop_2562
	edge16ln	%i7,	%g3,	%o5
	umulcc	%i3,	%l0,	%g6
	fbne,a	%fcc0,	loop_2563
loop_2562:
	andcc	%l1,	%l3,	%g5
	tge	%icc,	0x0
	tge	%xcc,	0x5
loop_2563:
	popc	%i6,	%o4
	orncc	%l2,	%g2,	%g4
	te	%icc,	0x6
	ta	%icc,	0x1
	fmovrdlz	%o3,	%f6,	%f10
	nop
	fitod	%f23,	%f6
	array8	%o6,	%l4,	%i5
	movrlz	%o7,	%i0,	%g7
	sethi	0x1401,	%o2
	tcc	%icc,	0x6
	subc	%l5,	%i4,	%o1
	fmovdpos	%xcc,	%f20,	%f7
	fornot1	%f12,	%f20,	%f2
	fpmerge	%f6,	%f19,	%f6
	mova	%xcc,	%i2,	%l6
	movgu	%icc,	%i1,	%g1
	umulcc	%i7,	%g3,	%o0
	and	%i3,	0x09B7,	%o5
	orcc	%l0,	0x1675,	%l1
	fbuge	%fcc3,	loop_2564
	xorcc	%g6,	%g5,	%i6
	movcc	%icc,	%l3,	%l2
	smul	%g2,	0x0FD2,	%g4
loop_2564:
	fmovdgu	%xcc,	%f26,	%f31
	mulscc	%o4,	%o6,	%l4
	set	0x36, %l6
	ldsba	[%l7 + %l6] 0x10,	%i5
	movneg	%icc,	%o3,	%o7
	sll	%g7,	0x10,	%o2
	fsrc2s	%f23,	%f4
	add	%l5,	0x1F34,	%i4
	addcc	%o1,	%i2,	%i0
	orn	%i1,	%l6,	%g1
	or	%i7,	0x0C9B,	%g3
	tgu	%xcc,	0x7
	bge,pt	%icc,	loop_2565
	fmovsne	%xcc,	%f22,	%f2
	bleu,a	loop_2566
	edge32	%o0,	%i3,	%l0
loop_2565:
	and	%l1,	0x1D6D,	%o5
	brgez,a	%g5,	loop_2567
loop_2566:
	smulcc	%i6,	0x059D,	%g6
	tge	%icc,	0x7
	wr	%g0,	0x22,	%asi
	stha	%l3,	[%l7 + 0x0A] %asi
	membar	#Sync
loop_2567:
	fmovrdgz	%g2,	%f0,	%f10
	fmovdvs	%icc,	%f19,	%f3
	tgu	%icc,	0x0
	mulx	%g4,	%l2,	%o4
	edge16n	%o6,	%l4,	%o3
	movrgz	%o7,	0x1A7,	%i5
	fmul8sux16	%f8,	%f4,	%f0
	bvc,a,pt	%xcc,	loop_2568
	smulcc	%g7,	0x0718,	%o2
	movcc	%icc,	%i4,	%l5
	fmovrde	%i2,	%f12,	%f2
loop_2568:
	srlx	%i0,	%o1,	%l6
	smulcc	%i1,	%i7,	%g3
	movge	%xcc,	%g1,	%i3
	smul	%l0,	0x1F7B,	%l1
	movl	%xcc,	%o5,	%g5
	edge32	%i6,	%o0,	%g6
	set	0x74, %g1
	swapa	[%l7 + %g1] 0x80,	%l3
	fornot1s	%f31,	%f22,	%f19
	fornot2s	%f14,	%f18,	%f7
	taddcctv	%g2,	%l2,	%o4
	brgez,a	%o6,	loop_2569
	swap	[%l7 + 0x64],	%l4
	stbar
	xnor	%o3,	%o7,	%g4
loop_2569:
	tl	%icc,	0x0
	add	%g7,	0x0538,	%i5
	fmovsa	%xcc,	%f28,	%f17
	srlx	%o2,	0x13,	%i4
	edge8l	%i2,	%l5,	%i0
	wr	%g0,	0x2b,	%asi
	stwa	%o1,	[%l7 + 0x44] %asi
	membar	#Sync
	std	%f14,	[%l7 + 0x30]
	tg	%xcc,	0x0
	sdivx	%i1,	0x1EA9,	%i7
	faligndata	%f28,	%f24,	%f30
	movn	%icc,	%g3,	%g1
	set	0x68, %i0
	lduwa	[%l7 + %i0] 0x80,	%i3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%l6,	%l0
	mulx	%o5,	%l1,	%g5
	fmovrdlz	%i6,	%f8,	%f22
	stb	%g6,	[%l7 + 0x2D]
	movcc	%xcc,	%o0,	%l3
	edge32l	%g2,	%l2,	%o4
	edge8n	%l4,	%o3,	%o7
	orn	%g4,	%o6,	%i5
	tcs	%icc,	0x7
	fpadd32	%f10,	%f24,	%f0
	udiv	%g7,	0x1D77,	%i4
	add	%i2,	0x0524,	%o2
	movrne	%i0,	0x27C,	%o1
	nop
	setx loop_2570, %l0, %l1
	jmpl %l1, %i1
	fmovrslez	%l5,	%f21,	%f21
	sdivx	%i7,	0x1314,	%g1
	wr	%g0,	0x2b,	%asi
	stha	%g3,	[%l7 + 0x4C] %asi
	membar	#Sync
loop_2570:
	movrne	%i3,	%l0,	%l6
	fmovsle	%icc,	%f21,	%f16
	srl	%l1,	0x1A,	%g5
	fbl	%fcc3,	loop_2571
	subc	%o5,	%i6,	%o0
	fbn	%fcc2,	loop_2572
	movcc	%xcc,	%g6,	%l3
loop_2571:
	edge32	%l2,	%o4,	%l4
	fbl,a	%fcc1,	loop_2573
loop_2572:
	taddcc	%o3,	0x0246,	%o7
	wr	%g0,	0xe2,	%asi
	stba	%g2,	[%l7 + 0x18] %asi
	membar	#Sync
loop_2573:
	fmovse	%icc,	%f3,	%f12
	mulscc	%g4,	0x177C,	%o6
	fmovdl	%xcc,	%f9,	%f5
	tn	%icc,	0x2
	fones	%f0
	nop
	set	0x44, %l1
	stw	%i5,	[%l7 + %l1]
	mova	%icc,	%i4,	%g7
	array16	%o2,	%i0,	%o1
	tsubcctv	%i2,	0x094B,	%i1
	fbl	%fcc3,	loop_2574
	andcc	%i7,	0x1BED,	%l5
	sdiv	%g1,	0x198E,	%g3
	tneg	%xcc,	0x5
loop_2574:
	movvs	%xcc,	%i3,	%l0
	movrlz	%l1,	%g5,	%o5
	movn	%xcc,	%l6,	%i6
	movg	%icc,	%o0,	%l3
	sir	0x04F5
	movle	%xcc,	%l2,	%g6
	set	0x66, %i1
	ldsba	[%l7 + %i1] 0x04,	%o4
	set	0x74, %l5
	sta	%f10,	[%l7 + %l5] 0x15
	fmovsgu	%xcc,	%f19,	%f7
	bcc,pt	%icc,	loop_2575
	ldsw	[%l7 + 0x08],	%l4
	tleu	%icc,	0x6
	tne	%xcc,	0x3
loop_2575:
	xnor	%o3,	0x1B20,	%o7
	movle	%icc,	%g4,	%o6
	fmovsge	%icc,	%f2,	%f18
	subccc	%g2,	0x118A,	%i5
	fmovrdgez	%g7,	%f10,	%f24
	movrne	%o2,	%i4,	%o1
	tpos	%icc,	0x7
	set	0x20, %l4
	lda	[%l7 + %l4] 0x19,	%f11
	addc	%i0,	%i2,	%i7
	bl,pt	%xcc,	loop_2576
	edge8n	%i1,	%g1,	%g3
	bcc,pn	%icc,	loop_2577
	tgu	%icc,	0x6
loop_2576:
	te	%icc,	0x4
	lduh	[%l7 + 0x6E],	%i3
loop_2577:
	fpack32	%f4,	%f10,	%f24
	prefetch	[%l7 + 0x74],	 0x3
	movn	%icc,	%l0,	%l5
	fmovsl	%xcc,	%f23,	%f21
	srl	%l1,	%g5,	%o5
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
	fnot2s	%f2,	%f12
	tcs	%icc,	0x0
	udivcc	%i6,	0x1771,	%l3
	edge8	%o0,	%g6,	%o4
	edge32ln	%l4,	%o3,	%l2
	fmovrdlz	%o7,	%f28,	%f20
	tgu	%icc,	0x3
	lduh	[%l7 + 0x4C],	%o6
	edge16	%g2,	%g4,	%g7
	movvs	%xcc,	%o2,	%i5
	addc	%i4,	%i0,	%i2
	tvs	%icc,	0x4
	movpos	%icc,	%i7,	%i1
	wr	%g0,	0x0c,	%asi
	stxa	%o1,	[%l7 + 0x40] %asi
	smul	%g1,	0x1DB3,	%i3
	movle	%xcc,	%g3,	%l0
	movle	%icc,	%l1,	%g5
	andcc	%l5,	0x1111,	%l6
	ta	%icc,	0x6
	ba,a	%xcc,	loop_2578
	bcc	loop_2579
	fmuld8ulx16	%f13,	%f8,	%f18
	edge8ln	%i6,	%l3,	%o0
loop_2578:
	sub	%g6,	0x1FB9,	%o4
loop_2579:
	nop
	setx	0x690FF1CF107DC9EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	orn	%l4,	0x0C31,	%o3
	fmul8x16	%f30,	%f0,	%f0
	fnor	%f28,	%f30,	%f2
	fnor	%f24,	%f30,	%f8
	fnand	%f18,	%f8,	%f12
	edge8	%o5,	%o7,	%l2
	wr	%g0,	0x22,	%asi
	stha	%g2,	[%l7 + 0x78] %asi
	membar	#Sync
	fbg,a	%fcc2,	loop_2580
	brgez,a	%g4,	loop_2581
	bge,pn	%icc,	loop_2582
	bvc,a,pn	%xcc,	loop_2583
loop_2580:
	sra	%g7,	0x05,	%o6
loop_2581:
	xnorcc	%o2,	%i5,	%i4
loop_2582:
	smul	%i2,	%i0,	%i7
loop_2583:
	or	%i1,	%g1,	%i3
	tvs	%icc,	0x5
	sll	%g3,	%l0,	%o1
	udiv	%l1,	0x1492,	%g5
	ldsw	[%l7 + 0x4C],	%l6
	tne	%xcc,	0x6
	movg	%xcc,	%i6,	%l3
	movre	%l5,	%g6,	%o4
	xnor	%l4,	0x1A18,	%o3
	tg	%icc,	0x3
	subcc	%o0,	%o7,	%l2
	tcs	%xcc,	0x6
	movvc	%icc,	%g2,	%o5
	sdiv	%g4,	0x144C,	%o6
	fmovdle	%xcc,	%f24,	%f17
	orncc	%o2,	%g7,	%i4
	ldub	[%l7 + 0x3D],	%i2
	tg	%xcc,	0x3
	tneg	%xcc,	0x7
	movrgez	%i0,	%i7,	%i1
	bne,a,pt	%xcc,	loop_2584
	tle	%xcc,	0x2
	tcc	%xcc,	0x6
	subccc	%i5,	%g1,	%i3
loop_2584:
	movl	%icc,	%l0,	%o1
	sir	0x1C2E
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l1,	[%l7 + 0x50]
	nop
	setx	0x477AB3FC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xDCDAFDD5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f22,	%f9
	array8	%g5,	%l6,	%g3
	movgu	%xcc,	%l3,	%l5
	smulcc	%g6,	%i6,	%l4
	fmovsl	%icc,	%f30,	%f29
	move	%icc,	%o4,	%o0
	sth	%o7,	[%l7 + 0x7E]
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x220] %asi,	%l2
	movre	%g2,	%o3,	%o5
	srlx	%g4,	%o2,	%g7
	movge	%xcc,	%o6,	%i4
	fmul8x16al	%f28,	%f0,	%f8
	sra	%i2,	0x05,	%i0
	edge16ln	%i7,	%i1,	%g1
	tsubcctv	%i3,	0x1BEF,	%i5
	tge	%icc,	0x1
	fmovsne	%xcc,	%f17,	%f6
	andncc	%o1,	%l0,	%l1
	brnz	%g5,	loop_2585
	movpos	%icc,	%g3,	%l6
	orncc	%l5,	%g6,	%i6
	nop
	set	0x22, %o7
	ldsh	[%l7 + %o7],	%l3
loop_2585:
	xnorcc	%l4,	%o4,	%o0
	nop
	set	0x6C, %i2
	ldsw	[%l7 + %i2],	%o7
	tsubcctv	%g2,	%l2,	%o5
	bvs,a,pt	%xcc,	loop_2586
	udivx	%g4,	0x1889,	%o3
	edge16l	%g7,	%o6,	%i4
	bcs,a,pn	%xcc,	loop_2587
loop_2586:
	nop
	set	0x0E, %i5
	lduh	[%l7 + %i5],	%i2
	andcc	%o2,	%i0,	%i1
	orcc	%g1,	%i3,	%i5
loop_2587:
	sub	%i7,	%l0,	%o1
	edge32n	%g5,	%g3,	%l1
	fnegs	%f19,	%f9
	edge8l	%l5,	%l6,	%i6
	movle	%xcc,	%g6,	%l4
	nop
	setx	0x7E585A07,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x829275B9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f17,	%f23
	tsubcctv	%l3,	0x1B59,	%o0
	ldub	[%l7 + 0x52],	%o4
	taddcc	%g2,	0x1CDF,	%l2
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f0
	fxtod	%f0,	%f24
	fmovrdlz	%o5,	%f16,	%f14
	fmul8ulx16	%f24,	%f30,	%f0
	bge,a	%xcc,	loop_2588
	fornot1	%f14,	%f26,	%f4
	stw	%g4,	[%l7 + 0x68]
	mulscc	%o7,	0x17A2,	%o3
loop_2588:
	bgu,a,pt	%xcc,	loop_2589
	stw	%o6,	[%l7 + 0x0C]
	and	%i4,	0x1DDE,	%i2
	movrgz	%g7,	0x054,	%o2
loop_2589:
	subcc	%i0,	%g1,	%i1
	srl	%i5,	%i7,	%i3
	nop
	setx	0xBF53C672C07BD2BE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	stbar
	fbl	%fcc0,	loop_2590
	tneg	%icc,	0x0
	edge32n	%o1,	%l0,	%g5
	fmovdg	%xcc,	%f14,	%f26
loop_2590:
	nop
	setx	loop_2591,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsg	%xcc,	%f30,	%f23
	orn	%l1,	0x09CC,	%l5
	nop
	fitos	%f11,	%f7
	fstox	%f7,	%f22
	fxtos	%f22,	%f19
loop_2591:
	sra	%l6,	0x14,	%i6
	fandnot1	%f10,	%f6,	%f4
	fbe,a	%fcc2,	loop_2592
	movvc	%icc,	%g6,	%g3
	add	%l4,	%l3,	%o4
	and	%g2,	0x0025,	%o0
loop_2592:
	subc	%l2,	0x0C4B,	%o5
	xnorcc	%o7,	0x009A,	%g4
	udiv	%o3,	0x089F,	%i4
	fmovsneg	%icc,	%f31,	%f10
	tgu	%icc,	0x7
	fmovscc	%icc,	%f28,	%f19
	stbar
	orcc	%o6,	0x1D6F,	%g7
	set	0x08, %i3
	ldswa	[%l7 + %i3] 0x11,	%o2
	lduh	[%l7 + 0x5A],	%i2
	edge16n	%i0,	%i1,	%i5
	edge8ln	%g1,	%i7,	%o1
	fmovdneg	%xcc,	%f4,	%f19
	andcc	%l0,	%i3,	%l1
	andcc	%l5,	0x00F2,	%g5
	array16	%l6,	%g6,	%i6
	sll	%g3,	0x1D,	%l4
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	addcc	%l3,	%g2,	%o0
	nop
	fitod	%f9,	%f20
	tneg	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o4,	%l2,	%o7
	tvc	%xcc,	0x5
	std	%f2,	[%l7 + 0x18]
	bvs,a,pn	%icc,	loop_2593
	ta	%xcc,	0x4
	edge32	%o5,	%o3,	%i4
	array8	%g4,	%o6,	%o2
loop_2593:
	ldub	[%l7 + 0x47],	%i2
	umul	%i0,	0x0415,	%g7
	edge8l	%i5,	%g1,	%i1
	movneg	%icc,	%i7,	%o1
	fbn	%fcc0,	loop_2594
	membar	0x44
	stb	%l0,	[%l7 + 0x4B]
	fmul8x16au	%f30,	%f9,	%f4
loop_2594:
	fmovsle	%xcc,	%f4,	%f26
	sdivx	%i3,	0x0180,	%l5
	movrgez	%l1,	0x2C7,	%g5
	tle	%xcc,	0x2
	fpsub32	%f16,	%f4,	%f22
	fxor	%f12,	%f4,	%f20
	tge	%icc,	0x5
	tvs	%icc,	0x5
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f14
	fxtod	%f14,	%f0
	edge8	%l6,	%g6,	%i6
	ble,a,pn	%xcc,	loop_2595
	udivx	%l4,	0x053B,	%l3
	fpadd32	%f18,	%f4,	%f0
	taddcctv	%g2,	%o0,	%o4
loop_2595:
	ta	%icc,	0x4
	nop
	setx	0x4CE1041AE775CD3D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f26
	tne	%icc,	0x3
	tsubcc	%l2,	0x16D4,	%o7
	umul	%o5,	%o3,	%g3
	tneg	%xcc,	0x5
	stb	%i4,	[%l7 + 0x3C]
	bg	%icc,	loop_2596
	or	%o6,	0x08AA,	%o2
	bl,pn	%icc,	loop_2597
	fmovdgu	%icc,	%f7,	%f11
loop_2596:
	alignaddrl	%i2,	%i0,	%g7
	umul	%g4,	0x0B04,	%g1
loop_2597:
	xorcc	%i1,	%i5,	%i7
	set	0x38, %g4
	stxa	%o1,	[%l7 + %g4] 0xe2
	membar	#Sync
	flush	%l7 + 0x74
	movpos	%xcc,	%l0,	%i3
	add	%l1,	0x01A8,	%l5
	fzeros	%f22
	edge32ln	%g5,	%g6,	%i6
	brgz	%l4,	loop_2598
	fsrc1s	%f0,	%f17
	fcmple16	%f6,	%f24,	%l3
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%l6
loop_2598:
	or	%g2,	0x1188,	%o0
	movne	%icc,	%o4,	%l2
	fnands	%f31,	%f11,	%f30
	orncc	%o5,	0x1653,	%o7
	taddcc	%o3,	0x0901,	%g3
	fmovdneg	%xcc,	%f22,	%f1
	ldsw	[%l7 + 0x4C],	%i4
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f30
	fxtod	%f30,	%f2
	orn	%o6,	0x0BB4,	%i2
	movgu	%icc,	%o2,	%g7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x18,	%i0,	%g4
	move	%xcc,	%i1,	%i5
	movge	%xcc,	%g1,	%i7
	tneg	%xcc,	0x3
	fbuge	%fcc0,	loop_2599
	andn	%o1,	%l0,	%l1
	move	%xcc,	%i3,	%l5
	fsrc2	%f24,	%f28
loop_2599:
	smulcc	%g5,	%g6,	%i6
	movcs	%xcc,	%l3,	%l6
	fmovsle	%xcc,	%f29,	%f27
	fnands	%f20,	%f6,	%f12
	faligndata	%f22,	%f22,	%f22
	tn	%icc,	0x2
	alignaddr	%g2,	%o0,	%l4
	movre	%l2,	%o5,	%o4
	movneg	%xcc,	%o3,	%o7
	nop
	setx	0x2B4A6013306B0B9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tcc	%xcc,	0x1
	sll	%g3,	%i4,	%i2
	ldd	[%l7 + 0x30],	%f30
	subcc	%o2,	0x171F,	%o6
	mulscc	%g7,	%g4,	%i0
	mova	%icc,	%i5,	%g1
	orncc	%i1,	0x1D72,	%i7
	sdivcc	%o1,	0x093A,	%l0
	tleu	%icc,	0x4
	bg,a,pt	%icc,	loop_2600
	fcmpne32	%f12,	%f30,	%i3
	fmovdvs	%icc,	%f16,	%f3
	addcc	%l5,	0x0CB7,	%g5
loop_2600:
	tgu	%xcc,	0x7
	ba	loop_2601
	edge32	%g6,	%l1,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x4
loop_2601:
	xorcc	%l3,	0x1813,	%g2
	fmovdn	%icc,	%f6,	%f29
	bvc	loop_2602
	sll	%l6,	%l4,	%l2
	srl	%o5,	%o4,	%o3
	nop
	fitos	%f11,	%f17
	fstox	%f17,	%f24
	fxtos	%f24,	%f14
loop_2602:
	mulx	%o0,	0x1DA7,	%g3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%i4,	%i2
	edge8n	%o2,	%o7,	%g7
	sub	%g4,	%i0,	%i5
	bne,a,pt	%icc,	loop_2603
	movcs	%icc,	%o6,	%g1
	movcc	%xcc,	%i7,	%o1
	addcc	%i1,	0x079C,	%l0
loop_2603:
	nop
	setx	0x1ED93761,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xC7C1F58F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f26,	%f23
	fmovdge	%xcc,	%f11,	%f31
	edge8n	%l5,	%i3,	%g6
	bl,pn	%icc,	loop_2604
	tcs	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x5D] %asi,	%l1
loop_2604:
	nop
	setx loop_2605, %l0, %l1
	jmpl %l1, %i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f24,	%f12,	%f22
	tne	%xcc,	0x4
loop_2605:
	tsubcc	%g5,	0x15B9,	%g2
	subc	%l6,	0x137B,	%l4
	ldsb	[%l7 + 0x12],	%l3
	bne,pt	%icc,	loop_2606
	fmovdleu	%icc,	%f24,	%f12
	fxors	%f27,	%f21,	%f24
	fmovdle	%xcc,	%f14,	%f5
loop_2606:
	sethi	0x1910,	%o5
	srl	%o4,	0x1F,	%o3
	fsrc1s	%f9,	%f11
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%o0
	fmovsg	%xcc,	%f13,	%f27
	movvs	%xcc,	%g3,	%i4
	tle	%icc,	0x1
	subccc	%i2,	0x088C,	%o2
	movleu	%icc,	%l2,	%o7
	tg	%xcc,	0x1
	nop
	setx	0x7243188E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f1
	fmovdgu	%xcc,	%f12,	%f17
	fmovsleu	%icc,	%f14,	%f29
	ldd	[%l7 + 0x48],	%g4
	subcc	%i0,	%i5,	%g7
	add	%o6,	0x1EE7,	%i7
	nop
	set	0x68, %o0
	ldx	[%l7 + %o0],	%o1
	fmovrdgez	%i1,	%f4,	%f2
	bcc	loop_2607
	sll	%g1,	%l5,	%l0
	fcmpgt32	%f6,	%f0,	%i3
	ba,pt	%xcc,	loop_2608
loop_2607:
	andcc	%l1,	0x02F3,	%i6
	ta	%xcc,	0x1
	fbuge,a	%fcc2,	loop_2609
loop_2608:
	bcs,a,pt	%icc,	loop_2610
	fmovscc	%xcc,	%f30,	%f29
	ldsh	[%l7 + 0x12],	%g6
loop_2609:
	edge16	%g2,	%l6,	%l4
loop_2610:
	umul	%g5,	0x0EE7,	%o5
	fandnot2	%f26,	%f14,	%f26
	addc	%o4,	0x188D,	%o3
	fmovsgu	%icc,	%f11,	%f8
	edge8	%o0,	%g3,	%i4
	add	%i2,	0x1208,	%o2
	ldd	[%l7 + 0x30],	%l2
	tg	%icc,	0x7
	movleu	%icc,	%o7,	%l2
	movvs	%xcc,	%i0,	%i5
	tneg	%xcc,	0x4
	fmovsvs	%xcc,	%f29,	%f31
	smul	%g4,	%o6,	%g7
	fpackfix	%f28,	%f3
	sll	%i7,	0x16,	%o1
	umulcc	%g1,	0x1D83,	%l5
	prefetch	[%l7 + 0x50],	 0x1
	movrgz	%i1,	0x226,	%i3
	umul	%l0,	%i6,	%l1
	fandnot2s	%f20,	%f3,	%f17
	movrgz	%g2,	0x2AE,	%l6
	fbue	%fcc2,	loop_2611
	srl	%g6,	0x0A,	%g5
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x16,	%f0
loop_2611:
	and	%l4,	%o5,	%o3
	xnor	%o0,	0x142F,	%g3
	wr	%g0,	0xea,	%asi
	stxa	%i4,	[%l7 + 0x68] %asi
	membar	#Sync
	xorcc	%i2,	0x0928,	%o4
	edge16l	%o2,	%l3,	%l2
	fbg,a	%fcc2,	loop_2612
	array8	%o7,	%i0,	%g4
	movvs	%xcc,	%i5,	%o6
	movgu	%xcc,	%i7,	%o1
loop_2612:
	bcs,pt	%icc,	loop_2613
	xorcc	%g1,	0x1FD2,	%g7
	ta	%icc,	0x2
	edge16ln	%i1,	%l5,	%i3
loop_2613:
	taddcctv	%l0,	%i6,	%l1
	tsubcctv	%g2,	0x19D8,	%l6
	fzeros	%f25
	fmovrsne	%g6,	%f31,	%f14
	sethi	0x105B,	%g5
	fmul8sux16	%f16,	%f16,	%f16
	fmovspos	%icc,	%f3,	%f26
	stb	%l4,	[%l7 + 0x56]
	subc	%o5,	%o3,	%g3
	bl,pt	%icc,	loop_2614
	popc	0x02EA,	%i4
	fcmpne16	%f2,	%f8,	%o0
	srax	%o4,	0x1F,	%i2
loop_2614:
	movneg	%icc,	%o2,	%l2
	mova	%icc,	%o7,	%l3
	movcs	%icc,	%g4,	%i5
	or	%i0,	0x1412,	%o6
	edge32ln	%i7,	%g1,	%o1
	andcc	%i1,	0x11F8,	%l5
	fpadd16	%f2,	%f6,	%f26
	movrgez	%i3,	%l0,	%i6
	brnz	%l1,	loop_2615
	subc	%g7,	0x1545,	%l6
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x57] %asi,	%g2
loop_2615:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%g5
	udivcc	%l4,	0x1CBD,	%o5
	bleu,a	%xcc,	loop_2616
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f4
	call	loop_2617
	srlx	%o3,	0x0C,	%g6
loop_2616:
	ta	%icc,	0x2
	te	%icc,	0x4
loop_2617:
	addccc	%g3,	0x0B73,	%o0
	smul	%o4,	%i2,	%o2
	swap	[%l7 + 0x54],	%l2
	orn	%o7,	%l3,	%i4
	fcmpne16	%f20,	%f14,	%i5
	mulx	%i0,	%o6,	%g4
	nop
	setx	0xD66FC24E78003A94,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xD517AD089BA29904,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f10,	%f12
	mova	%icc,	%i7,	%o1
	lduw	[%l7 + 0x0C],	%g1
	andcc	%l5,	%i1,	%l0
	umul	%i6,	0x0986,	%l1
	movge	%xcc,	%g7,	%i3
	mova	%icc,	%l6,	%g2
	edge16	%l4,	%o5,	%o3
	fmovdvs	%icc,	%f18,	%f23
	movrlez	%g6,	0x075,	%g3
	movl	%icc,	%o0,	%o4
	movvc	%icc,	%i2,	%o2
	or	%g5,	0x1D2F,	%l2
	xnor	%l3,	%o7,	%i5
	movleu	%icc,	%i0,	%o6
	subccc	%g4,	%i4,	%o1
	bl,pt	%xcc,	loop_2618
	addc	%g1,	0x1D2D,	%i7
	fcmpne16	%f26,	%f18,	%i1
	fbe,a	%fcc0,	loop_2619
loop_2618:
	tgu	%xcc,	0x6
	tgu	%xcc,	0x0
	fmul8x16au	%f31,	%f29,	%f12
loop_2619:
	sth	%l0,	[%l7 + 0x66]
	srlx	%l5,	0x1F,	%l1
	fbuge,a	%fcc3,	loop_2620
	fnand	%f10,	%f0,	%f12
	subc	%i6,	%g7,	%l6
	fmovsn	%icc,	%f22,	%f4
loop_2620:
	brnz	%i3,	loop_2621
	movre	%l4,	0x303,	%g2
	nop
	setx	loop_2622,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldd	[%l7 + 0x28],	%f12
loop_2621:
	stbar
	movvc	%xcc,	%o5,	%o3
loop_2622:
	nop
	fitos	%f13,	%f11
	fstoi	%f11,	%f10
	fmovrdne	%g3,	%f14,	%f22
	fornot2s	%f31,	%f4,	%f31
	taddcctv	%g6,	0x1508,	%o4
	andn	%o0,	%o2,	%g5
	fbl,a	%fcc1,	loop_2623
	movcs	%xcc,	%i2,	%l2
	nop
	setx	0x2B7EB555804309C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fba,a	%fcc2,	loop_2624
loop_2623:
	addccc	%o7,	%l3,	%i5
	edge16l	%o6,	%g4,	%i0
	xor	%i4,	%g1,	%o1
loop_2624:
	alignaddrl	%i1,	%i7,	%l5
	fblg,a	%fcc2,	loop_2625
	lduh	[%l7 + 0x20],	%l1
	fmovsle	%icc,	%f24,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2625:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	popc	%l0,	%l6
	membar	0x53
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f20
	fxtod	%f20,	%f4
	fba	%fcc3,	loop_2626
	sll	%i3,	%l4,	%g2
	move	%xcc,	%g7,	%o3
	stbar
loop_2626:
	tgu	%xcc,	0x6
	fmovdn	%xcc,	%f7,	%f16
	nop
	setx	0x6CA4873F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f5
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x89
	edge16l	%o5,	%g6,	%g3
	brgz,a	%o4,	loop_2627
	movcs	%icc,	%o0,	%g5
	ldsh	[%l7 + 0x24],	%o2
	movrgez	%l2,	%o7,	%i2
loop_2627:
	fmovrdlez	%i5,	%f28,	%f28
	fmovda	%icc,	%f14,	%f19
	movvs	%xcc,	%l3,	%g4
	set	0x4B, %l3
	ldsba	[%l7 + %l3] 0x88,	%o6
	sub	%i0,	%i4,	%g1
	sll	%i1,	%o1,	%i7
	mova	%icc,	%l1,	%i6
	fmovspos	%xcc,	%f10,	%f16
	bgu	%icc,	loop_2628
	subc	%l0,	%l5,	%i3
	orncc	%l4,	%l6,	%g2
	movcc	%icc,	%o3,	%o5
loop_2628:
	movne	%xcc,	%g7,	%g3
	fandnot1s	%f24,	%f0,	%f31
	sll	%o4,	0x12,	%o0
	andcc	%g5,	%g6,	%l2
	umulcc	%o7,	%i2,	%i5
	fbge,a	%fcc3,	loop_2629
	fornot2	%f18,	%f12,	%f0
	sdiv	%l3,	0x1EE8,	%g4
	ldsb	[%l7 + 0x4A],	%o6
loop_2629:
	fmovrdne	%i0,	%f26,	%f10
	ta	%xcc,	0x0
	movcs	%icc,	%o2,	%g1
	fmovdn	%icc,	%f8,	%f2
	taddcctv	%i1,	%i4,	%i7
	set	0x2F, %o4
	stba	%l1,	[%l7 + %o4] 0x2a
	membar	#Sync
	fmul8x16au	%f12,	%f29,	%f2
	tcc	%icc,	0x5
	sllx	%o1,	0x05,	%i6
	fnors	%f31,	%f18,	%f24
	fnegd	%f26,	%f10
	movcs	%xcc,	%l0,	%l5
	movge	%xcc,	%i3,	%l6
	fands	%f6,	%f3,	%f10
	andncc	%g2,	%l4,	%o5
	stx	%g7,	[%l7 + 0x20]
	mulscc	%g3,	%o4,	%o0
	set	0x2C, %i4
	sta	%f2,	[%l7 + %i4] 0x10
	array32	%g5,	%o3,	%g6
	bcc,a	loop_2630
	brgez,a	%l2,	loop_2631
	bpos,a,pt	%xcc,	loop_2632
	stb	%o7,	[%l7 + 0x52]
loop_2630:
	for	%f22,	%f22,	%f26
loop_2631:
	bcs,a	loop_2633
loop_2632:
	fsrc1s	%f19,	%f10
	sll	%i5,	%l3,	%i2
	ldd	[%l7 + 0x38],	%f20
loop_2633:
	fmovdvc	%icc,	%f21,	%f4
	fmovrdlez	%o6,	%f14,	%f28
	udivx	%i0,	0x0C65,	%o2
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f2
	sra	%g4,	0x07,	%i1
	smul	%i4,	0x1BA7,	%i7
	taddcctv	%l1,	0x0692,	%o1
	sth	%i6,	[%l7 + 0x78]
	fone	%f14
	tvs	%xcc,	0x3
	tcs	%icc,	0x4
	tg	%xcc,	0x4
	fabss	%f4,	%f4
	fmovrslez	%l0,	%f1,	%f5
	fbg,a	%fcc0,	loop_2634
	bneg,a,pt	%icc,	loop_2635
	brz	%g1,	loop_2636
	fxors	%f19,	%f20,	%f4
loop_2634:
	tleu	%icc,	0x3
loop_2635:
	tsubcc	%l5,	0x033A,	%i3
loop_2636:
	bpos,a,pn	%icc,	loop_2637
	or	%l6,	0x07CA,	%g2
	xnor	%o5,	%g7,	%g3
	sll	%o4,	0x0D,	%o0
loop_2637:
	srlx	%l4,	%o3,	%g6
	sllx	%g5,	%l2,	%o7
	movrlez	%i5,	%i2,	%o6
	srl	%i0,	%o2,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f26,	%f8,	%f22
	movre	%i1,	%l3,	%i4
	fpsub16s	%f12,	%f9,	%f31
	wr	%g0,	0x0c,	%asi
	stba	%l1,	[%l7 + 0x2C] %asi
	fpadd16s	%f24,	%f10,	%f10
	alignaddr	%o1,	%i7,	%i6
	wr	%g0,	0x18,	%asi
	stba	%l0,	[%l7 + 0x7C] %asi
	andncc	%l5,	%g1,	%i3
	fpack16	%f8,	%f11
	brgez,a	%l6,	loop_2638
	edge16	%o5,	%g7,	%g3
	set	0x40, %l2
	prefetcha	[%l7 + %l2] 0x0c,	 0x1
loop_2638:
	tpos	%xcc,	0x3
	movrlez	%o4,	0x304,	%o0
	sll	%l4,	%o3,	%g6
	fmovrdlez	%l2,	%f28,	%f30
	fmul8x16au	%f10,	%f31,	%f24
	movleu	%icc,	%g5,	%i5
	ld	[%l7 + 0x30],	%f3
	fors	%f30,	%f22,	%f22
	addc	%o7,	%o6,	%i2
	fpmerge	%f11,	%f19,	%f8
	smul	%o2,	0x1803,	%g4
	stx	%i0,	[%l7 + 0x18]
	mulscc	%l3,	%i1,	%l1
	tne	%xcc,	0x1
	set	0x78, %g7
	lduwa	[%l7 + %g7] 0x19,	%o1
	bcs	%icc,	loop_2639
	sdivx	%i4,	0x0E81,	%i7
	subc	%i6,	%l0,	%g1
	sethi	0x1997,	%l5
loop_2639:
	fmovdneg	%xcc,	%f5,	%f27
	array8	%l6,	%i3,	%g7
	set	0x48, %g2
	lda	[%l7 + %g2] 0x88,	%f24
	fmovrse	%g3,	%f13,	%f28
	fbn,a	%fcc3,	loop_2640
	fmovsvc	%icc,	%f6,	%f29
	nop
	fitos	%f7,	%f12
	fstoi	%f12,	%f1
	fbul	%fcc2,	loop_2641
loop_2640:
	sdiv	%g2,	0x1BFB,	%o4
	movg	%xcc,	%o5,	%l4
	fmovdcs	%xcc,	%f20,	%f0
loop_2641:
	sdiv	%o0,	0x0370,	%g6
	fmovdgu	%icc,	%f11,	%f5
	nop
	setx	0xE990D80596FD8858,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xD6D5033AA1FBC8F9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f18,	%f4
	srl	%o3,	%l2,	%i5
	set	0x5C, %g6
	swapa	[%l7 + %g6] 0x89,	%g5
	addccc	%o7,	0x0851,	%o6
	xorcc	%i2,	%g4,	%i0
	edge32l	%o2,	%l3,	%l1
	fmovsneg	%icc,	%f15,	%f19
	umulcc	%o1,	0x104D,	%i1
	fmul8x16al	%f29,	%f30,	%f30
	array32	%i7,	%i4,	%l0
	addc	%g1,	0x0EB3,	%l5
	edge32	%l6,	%i3,	%g7
	nop
	setx	loop_2642,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andcc	%g3,	%i6,	%o4
	umulcc	%o5,	0x0AEF,	%l4
	fbn	%fcc0,	loop_2643
loop_2642:
	fbe	%fcc3,	loop_2644
	fmovrde	%o0,	%f0,	%f4
	fbl	%fcc3,	loop_2645
loop_2643:
	fmovda	%xcc,	%f4,	%f2
loop_2644:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g2,	%o3,	%g6
loop_2645:
	array8	%l2,	%g5,	%i5
	fbule	%fcc1,	loop_2646
	movrlez	%o7,	%i2,	%g4
	ldsb	[%l7 + 0x3B],	%o6
	edge16	%o2,	%i0,	%l3
loop_2646:
	bl	loop_2647
	nop
	setx loop_2648, %l0, %l1
	jmpl %l1, %o1
	orn	%l1,	0x114E,	%i7
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%i1
loop_2647:
	fpsub16s	%f20,	%f11,	%f27
loop_2648:
	udivcc	%i4,	0x153B,	%g1
	subccc	%l5,	%l6,	%l0
	te	%xcc,	0x7
	nop
	setx	0x206EFE6B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	sllx	%g7,	0x17,	%i3
	pdist	%f16,	%f8,	%f26
	fbge	%fcc2,	loop_2649
	add	%g3,	0x0250,	%i6
	tcc	%xcc,	0x5
	movleu	%xcc,	%o4,	%l4
loop_2649:
	edge32	%o5,	%g2,	%o0
	tne	%icc,	0x3
	sub	%g6,	0x03F6,	%o3
	movcc	%xcc,	%g5,	%l2
	fpack16	%f24,	%f28
	ldsh	[%l7 + 0x2A],	%i5
	movrlez	%i2,	0x101,	%o7
	fornot1	%f12,	%f2,	%f30
	ld	[%l7 + 0x28],	%f12
	fmovsne	%icc,	%f10,	%f21
	bge,a	%xcc,	loop_2650
	nop
	setx loop_2651, %l0, %l1
	jmpl %l1, %o6
	movrlz	%o2,	0x25F,	%g4
	nop
	fitos	%f8,	%f13
	fstox	%f13,	%f14
	fxtos	%f14,	%f3
loop_2650:
	tcc	%xcc,	0x0
loop_2651:
	and	%i0,	%o1,	%l1
	nop
	set	0x68, %l0
	ldd	[%l7 + %l0],	%f14
	set	0x49, %g5
	stba	%l3,	[%l7 + %g5] 0x80
	orn	%i7,	%i1,	%g1
	tle	%icc,	0x2
	fbuge	%fcc3,	loop_2652
	movre	%l5,	0x3C6,	%l6
	alignaddrl	%l0,	%g7,	%i4
	sub	%i3,	%g3,	%i6
loop_2652:
	sll	%o4,	%o5,	%g2
	addcc	%l4,	0x00CD,	%o0
	fbule,a	%fcc1,	loop_2653
	sdivx	%o3,	0x1B23,	%g6
	edge8n	%l2,	%i5,	%g5
	sll	%o7,	%o6,	%i2
loop_2653:
	nop
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%g4
	brgez	%o2,	loop_2654
	nop
	fitod	%f4,	%f8
	fdtos	%f8,	%f1
	movcs	%xcc,	%i0,	%l1
	subcc	%o1,	0x1C7D,	%l3
loop_2654:
	xnor	%i1,	0x0ABA,	%g1
	tneg	%icc,	0x2
	srax	%l5,	0x17,	%l6
	sir	0x1310
	edge16	%l0,	%i7,	%g7
	sllx	%i3,	0x1D,	%i4
	nop
	setx loop_2655, %l0, %l1
	jmpl %l1, %i6
	fmovdvc	%icc,	%f24,	%f21
	ldx	[%l7 + 0x78],	%g3
	sra	%o4,	0x03,	%g2
loop_2655:
	fbul	%fcc1,	loop_2656
	movl	%xcc,	%o5,	%o0
	fmovspos	%icc,	%f7,	%f24
	fmovde	%xcc,	%f23,	%f13
loop_2656:
	edge32n	%o3,	%l4,	%l2
	sdivcc	%g6,	0x16F9,	%i5
	addcc	%g5,	0x0118,	%o6
	fbe,a	%fcc2,	loop_2657
	fbuge	%fcc1,	loop_2658
	tsubcctv	%o7,	0x165C,	%g4
	srlx	%o2,	0x00,	%i2
loop_2657:
	movl	%icc,	%l1,	%o1
loop_2658:
	nop
	set	0x24, %i6
	stw	%l3,	[%l7 + %i6]
	bcc,a,pn	%icc,	loop_2659
	fmovdcc	%icc,	%f5,	%f18
	fbue	%fcc1,	loop_2660
	sdiv	%i1,	0x1778,	%i0
loop_2659:
	array16	%g1,	%l5,	%l0
	sdiv	%l6,	0x1572,	%i7
loop_2660:
	fpack32	%f10,	%f24,	%f2
	movleu	%icc,	%i3,	%g7
	brnz,a	%i6,	loop_2661
	sdivcc	%g3,	0x062F,	%i4
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
loop_2661:
	subccc	%o5,	%o0,	%o4
	tsubcctv	%l4,	%o3,	%g6
	fmovdl	%icc,	%f15,	%f20
	sdivcc	%i5,	0x0B18,	%l2
	sth	%g5,	[%l7 + 0x14]
	nop
	setx	0x87374E33,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f27
	sir	0x0F36
	fcmple32	%f16,	%f26,	%o7
	umul	%o6,	%g4,	%o2
	alignaddrl	%l1,	%o1,	%l3
	tsubcc	%i2,	%i1,	%g1
	edge8n	%l5,	%l0,	%i0
	tgu	%icc,	0x2
	or	%l6,	%i7,	%i3
	srax	%i6,	%g7,	%i4
	bvc,a,pt	%xcc,	loop_2662
	tg	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g2,	%g3,	%o0
loop_2662:
	stw	%o5,	[%l7 + 0x50]
	movvs	%icc,	%l4,	%o4
	orncc	%g6,	0x0C5C,	%i5
	tl	%xcc,	0x7
	fmovsge	%icc,	%f24,	%f4
	movvs	%xcc,	%l2,	%o3
	edge32ln	%o7,	%o6,	%g5
	tle	%xcc,	0x1
	pdist	%f4,	%f30,	%f26
	fmovrdne	%g4,	%f0,	%f16
	movg	%icc,	%l1,	%o1
	fnot1	%f10,	%f30
	sir	0x1C52
	fmovdne	%xcc,	%f13,	%f16
	fmul8sux16	%f26,	%f0,	%f18
	fblg,a	%fcc0,	loop_2663
	fand	%f10,	%f18,	%f24
	movre	%o2,	0x289,	%i2
	tge	%icc,	0x5
loop_2663:
	edge32	%l3,	%g1,	%l5
	or	%l0,	%i0,	%i1
	movle	%xcc,	%i7,	%i3
	tpos	%xcc,	0x6
	fmovdn	%icc,	%f6,	%f28
	fbn	%fcc2,	loop_2664
	nop
	setx	0xD5BB9B7D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x30D024CF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f10,	%f24
	fnors	%f28,	%f1,	%f18
	stx	%l6,	[%l7 + 0x38]
loop_2664:
	sth	%i6,	[%l7 + 0x2C]
	alignaddrl	%g7,	%i4,	%g2
	movpos	%icc,	%g3,	%o0
	fxors	%f17,	%f18,	%f1
	movrlz	%l4,	%o4,	%g6
	fmovrde	%o5,	%f2,	%f14
	fmovrsgez	%l2,	%f0,	%f22
	popc	%i5,	%o3
	tpos	%xcc,	0x3
	nop
	setx	0xF3B8D069,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xF78B6C25,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f25,	%f0
	movcc	%icc,	%o7,	%o6
	nop
	setx	loop_2665,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%xcc,	%g4,	%l1
	tg	%icc,	0x7
	movrlez	%o1,	0x111,	%g5
loop_2665:
	sdivx	%i2,	0x08BF,	%l3
	fmovdleu	%icc,	%f26,	%f23
	add	%o2,	0x06A2,	%g1
	fbl	%fcc3,	loop_2666
	movgu	%icc,	%l5,	%i0
	fbu,a	%fcc3,	loop_2667
	movvc	%xcc,	%i1,	%l0
loop_2666:
	orncc	%i3,	%l6,	%i7
	bvs,a,pn	%xcc,	loop_2668
loop_2667:
	fmovdge	%xcc,	%f17,	%f21
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
loop_2668:
	srl	%g7,	%g2,	%g3
	set	0x1F, %g3
	stba	%o0,	[%l7 + %g3] 0x19
	or	%l4,	%o4,	%g6
	nop
	setx loop_2669, %l0, %l1
	jmpl %l1, %i4
	ba,pn	%xcc,	loop_2670
	smul	%l2,	0x174A,	%i5
	or	%o3,	%o5,	%o6
loop_2669:
	fandnot1s	%f10,	%f0,	%f12
loop_2670:
	taddcctv	%g4,	0x1148,	%o7
	movne	%icc,	%o1,	%l1
	tneg	%icc,	0x1
	array8	%i2,	%g5,	%o2
	fexpand	%f11,	%f14
	ldsh	[%l7 + 0x10],	%l3
	addcc	%l5,	%i0,	%i1
	set	0x29, %i7
	ldsba	[%l7 + %i7] 0x11,	%l0
	subc	%g1,	%l6,	%i3
	taddcc	%i7,	0x01E1,	%g7
	nop
	setx	loop_2671,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdvc	%icc,	%f20,	%f25
	set	0x38, %o1
	ldxa	[%l7 + %o1] 0x15,	%g2
loop_2671:
	st	%f5,	[%l7 + 0x58]
	flush	%l7 + 0x34
	movrgz	%g3,	%i6,	%l4
	bl,pn	%icc,	loop_2672
	fandnot2	%f6,	%f12,	%f24
	subccc	%o4,	%g6,	%o0
	sir	0x0561
loop_2672:
	ldstub	[%l7 + 0x29],	%l2
	alignaddr	%i4,	%i5,	%o3
	xor	%o5,	%g4,	%o7
	tvc	%xcc,	0x2
	fmovscc	%xcc,	%f12,	%f30
	fmovrdlz	%o6,	%f26,	%f18
	move	%icc,	%l1,	%o1
	sllx	%i2,	%g5,	%l3
	nop
	setx	0x20697EAB,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	xnor	%l5,	0x00B7,	%o2
	movneg	%xcc,	%i1,	%l0
	popc	%i0,	%g1
	fandnot1s	%f31,	%f3,	%f6
	ld	[%l7 + 0x48],	%f7
	sra	%l6,	0x09,	%i7
	orncc	%g7,	%g2,	%i3
	fmovdvs	%icc,	%f7,	%f15
	addc	%i6,	0x0F24,	%g3
	tne	%icc,	0x7
	nop
	fitod	%f4,	%f24
	fdtoi	%f24,	%f0
	add	%o4,	0x057E,	%l4
	tcs	%xcc,	0x7
	mulscc	%g6,	%l2,	%o0
	brlez	%i5,	loop_2673
	edge8l	%i4,	%o3,	%o5
	tcc	%xcc,	0x0
	fmovdne	%icc,	%f14,	%f8
loop_2673:
	swap	[%l7 + 0x78],	%g4
	movre	%o6,	0x0FF,	%o7
	xnor	%l1,	%i2,	%g5
	orn	%o1,	0x124B,	%l3
	movrne	%o2,	%i1,	%l5
	movrne	%l0,	%i0,	%l6
	stb	%g1,	[%l7 + 0x62]
	smul	%i7,	%g7,	%i3
	movle	%icc,	%g2,	%i6
	edge8ln	%g3,	%l4,	%o4
	edge16l	%l2,	%o0,	%g6
	tg	%icc,	0x1
	movl	%xcc,	%i4,	%o3
	sir	0x04D9
	fmovsgu	%icc,	%f19,	%f30
	ld	[%l7 + 0x18],	%f17
	flush	%l7 + 0x14
	orcc	%o5,	0x0A39,	%i5
	fmovrsne	%o6,	%f4,	%f10
	fmovdleu	%icc,	%f30,	%f6
	move	%xcc,	%g4,	%l1
	ld	[%l7 + 0x24],	%f21
	fmuld8sux16	%f0,	%f16,	%f28
	sll	%i2,	0x10,	%g5
	add	%o1,	0x00D7,	%l3
	tneg	%icc,	0x5
	stx	%o7,	[%l7 + 0x08]
	tn	%xcc,	0x6
	movre	%o2,	0x14B,	%l5
	edge16ln	%l0,	%i0,	%i1
	movrlz	%l6,	%g1,	%g7
	orn	%i7,	%g2,	%i3
	fnands	%f28,	%f4,	%f24
	edge16ln	%i6,	%g3,	%l4
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x2A] %asi,	%l2
	membar	0x04
	andn	%o0,	0x1697,	%g6
	umul	%o4,	0x150A,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge16l	%o5,	%i5,	%o3
	taddcc	%o6,	0x1273,	%l1
	nop
	setx	0x3CBA0AF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x5B64EE52,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f7,	%f9
	bgu	%icc,	loop_2674
	edge16n	%i2,	%g5,	%g4
	wr	%g0,	0x89,	%asi
	stba	%o1,	[%l7 + 0x4A] %asi
loop_2674:
	nop
	set	0x4C, %l6
	ldsw	[%l7 + %l6],	%l3
	fmovrdlez	%o7,	%f12,	%f20
	addc	%o2,	%l0,	%l5
	subcc	%i1,	0x12BE,	%i0
	sethi	0x0455,	%g1
	movrgz	%l6,	0x036,	%g7
	xnor	%i7,	0x0931,	%g2
	tcs	%xcc,	0x4
	ldsw	[%l7 + 0x68],	%i6
	movvc	%xcc,	%i3,	%g3
	movcs	%xcc,	%l4,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x6E
	alignaddrl	%l2,	%o4,	%g6
	tcs	%xcc,	0x6
	array16	%i4,	%i5,	%o5
	sdiv	%o6,	0x0A8A,	%o3
	movpos	%xcc,	%i2,	%l1
	sra	%g4,	0x0B,	%g5
	edge16	%o1,	%o7,	%l3
	fzero	%f6
	set	0x15, %g1
	ldstuba	[%l7 + %g1] 0x11,	%o2
	tge	%icc,	0x4
	and	%l0,	0x092B,	%i1
	subccc	%i0,	%g1,	%l6
	movneg	%icc,	%l5,	%g7
	fbule,a	%fcc3,	loop_2675
	smul	%g2,	%i7,	%i3
	sdivx	%i6,	0x14D4,	%g3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%l2
loop_2675:
	tcs	%xcc,	0x0
	fnot1	%f4,	%f28
	tge	%xcc,	0x4
	umul	%o4,	%l4,	%i4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x0B] %asi,	%g6
	edge16n	%i5,	%o5,	%o6
	movvc	%xcc,	%o3,	%i2
	tleu	%icc,	0x4
	subccc	%l1,	%g4,	%g5
	nop
	setx loop_2676, %l0, %l1
	jmpl %l1, %o1
	fmovrslz	%l3,	%f5,	%f3
	alignaddrl	%o2,	%l0,	%o7
	array8	%i0,	%g1,	%l6
loop_2676:
	movre	%l5,	0x381,	%g7
	sdivx	%i1,	0x0607,	%g2
	umul	%i3,	0x144D,	%i7
	fornot2	%f14,	%f22,	%f2
	sll	%i6,	%g3,	%l2
	fbg,a	%fcc1,	loop_2677
	fmovsl	%icc,	%f16,	%f31
	ldsb	[%l7 + 0x0C],	%o0
	add	%o4,	%i4,	%g6
loop_2677:
	fmovdcc	%icc,	%f19,	%f21
	bne,pt	%icc,	loop_2678
	fsrc1	%f12,	%f12
	fbe,a	%fcc3,	loop_2679
	movcc	%xcc,	%i5,	%o5
loop_2678:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
loop_2679:
	fbg,a	%fcc2,	loop_2680
	membar	0x57
	fmovdle	%xcc,	%f11,	%f13
	fornot2	%f14,	%f18,	%f26
loop_2680:
	movn	%xcc,	%o3,	%l4
	tl	%icc,	0x1
	movrne	%l1,	0x241,	%g4
	fpack16	%f20,	%f8
	sdivcc	%g5,	0x15AE,	%o1
	sdivcc	%l3,	0x183B,	%o2
	movg	%xcc,	%l0,	%i2
	tsubcc	%o7,	%g1,	%l6
	movcc	%icc,	%i0,	%g7
	fzero	%f0
	fmovscs	%icc,	%f19,	%f30
	srlx	%i1,	0x06,	%g2
	movrgez	%l5,	0x1E4,	%i3
	ldstub	[%l7 + 0x79],	%i6
	udiv	%i7,	0x0D62,	%g3
	movrlz	%l2,	%o0,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc1,	loop_2681
	xnor	%g6,	0x15F7,	%i5
	edge16	%i4,	%o6,	%o5
	xnorcc	%o3,	%l1,	%l4
loop_2681:
	fmovrde	%g5,	%f26,	%f4
	udivx	%o1,	0x039B,	%g4
	edge8n	%o2,	%l0,	%i2
	fsrc1s	%f8,	%f29
	edge32l	%l3,	%g1,	%o7
	bge	loop_2682
	edge16n	%l6,	%g7,	%i1
	movne	%xcc,	%i0,	%g2
	fsrc1	%f22,	%f24
loop_2682:
	mulx	%l5,	%i6,	%i7
	edge32	%i3,	%g3,	%l2
	smul	%o0,	0x082E,	%g6
	nop
	setx	0xF3752F45,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x7ABB7A3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f3,	%f17
	tsubcctv	%i5,	0x0E78,	%o4
	tcs	%xcc,	0x2
	te	%xcc,	0x4
	ldsh	[%l7 + 0x6E],	%i4
	sth	%o5,	[%l7 + 0x3E]
	sllx	%o6,	0x09,	%o3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%l1
	edge16n	%l4,	%o1,	%g4
	call	loop_2683
	umul	%o2,	%l0,	%i2
	st	%f22,	[%l7 + 0x2C]
	edge16n	%l3,	%g5,	%g1
loop_2683:
	fble	%fcc3,	loop_2684
	sll	%l6,	%o7,	%g7
	movvs	%icc,	%i0,	%g2
	taddcc	%l5,	0x0A15,	%i1
loop_2684:
	fbu	%fcc3,	loop_2685
	tne	%xcc,	0x4
	fabsd	%f18,	%f10
	subc	%i7,	%i6,	%g3
loop_2685:
	fmovrdlz	%l2,	%f0,	%f26
	movgu	%icc,	%o0,	%g6
	edge32l	%i3,	%i5,	%i4
	nop
	setx	0x20706BDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	tge	%xcc,	0x5
	addccc	%o4,	%o6,	%o3
	xnor	%o5,	%l4,	%l1
	tvs	%icc,	0x1
	smulcc	%o1,	%o2,	%l0
	xnorcc	%g4,	0x1B02,	%l3
	sdiv	%i2,	0x0E0F,	%g5
	and	%g1,	%o7,	%g7
	taddcc	%i0,	0x0A10,	%g2
	orncc	%l6,	0x0E02,	%i1
	movge	%icc,	%i7,	%i6
	fmovspos	%icc,	%f18,	%f25
	movg	%icc,	%g3,	%l2
	fble	%fcc0,	loop_2686
	fba	%fcc2,	loop_2687
	fzero	%f24
	movle	%xcc,	%l5,	%g6
loop_2686:
	subccc	%i3,	%i5,	%o0
loop_2687:
	ldd	[%l7 + 0x60],	%o4
	fmovrdlz	%i4,	%f8,	%f8
	subccc	%o3,	%o5,	%o6
	set	0x30, %o2
	ldxa	[%g0 + %o2] 0x58,	%l4
	fbge,a	%fcc1,	loop_2688
	bneg	%icc,	loop_2689
	fbug,a	%fcc3,	loop_2690
	movcc	%xcc,	%l1,	%o2
loop_2688:
	tg	%icc,	0x2
loop_2689:
	movrgez	%l0,	%g4,	%l3
loop_2690:
	fands	%f27,	%f23,	%f27
	fmovdle	%xcc,	%f7,	%f14
	andn	%i2,	0x0A9A,	%o1
	tcc	%xcc,	0x4
	fmovsneg	%xcc,	%f4,	%f8
	srlx	%g5,	0x0F,	%g1
	set	0x2E, %l1
	stba	%g7,	[%l7 + %l1] 0x19
	wr	%g0,	0x80,	%asi
	stwa	%i0,	[%l7 + 0x1C] %asi
	edge32ln	%g2,	%o7,	%i1
	ldstub	[%l7 + 0x51],	%i7
	tvs	%xcc,	0x2
	smul	%i6,	%g3,	%l6
	sir	0x09E8
	movrlz	%l2,	%l5,	%g6
	flush	%l7 + 0x1C
	xnorcc	%i3,	0x0514,	%i5
	tn	%icc,	0x2
	fmovrdgez	%o4,	%f24,	%f26
	subc	%i4,	%o0,	%o5
	fmovsneg	%xcc,	%f7,	%f11
	edge16	%o6,	%l4,	%l1
	tge	%icc,	0x3
	orcc	%o3,	%o2,	%g4
	movleu	%icc,	%l0,	%l3
	fmovdn	%icc,	%f19,	%f16
	bvs	%icc,	loop_2691
	fpack32	%f0,	%f0,	%f16
	movleu	%icc,	%i2,	%o1
	movle	%xcc,	%g5,	%g1
loop_2691:
	movrlez	%g7,	0x013,	%g2
	te	%xcc,	0x6
	ta	%icc,	0x1
	movle	%icc,	%i0,	%i1
	nop
	set	0x68, %i1
	ldsh	[%l7 + %i1],	%i7
	smulcc	%o7,	%i6,	%g3
	fzero	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l6,	%l5
	movcc	%xcc,	%g6,	%l2
	orcc	%i3,	%i5,	%i4
	bgu,pn	%xcc,	loop_2692
	tcs	%icc,	0x3
	movrne	%o4,	%o5,	%o6
	fmovsne	%xcc,	%f0,	%f20
loop_2692:
	fornot1s	%f13,	%f24,	%f6
	wr	%g0,	0xea,	%asi
	stxa	%l4,	[%l7 + 0x18] %asi
	membar	#Sync
	bg,pn	%icc,	loop_2693
	tcs	%xcc,	0x1
	movrgz	%l1,	0x0C2,	%o3
	movne	%xcc,	%o0,	%o2
loop_2693:
	fornot2	%f16,	%f16,	%f30
	fzero	%f22
	movrne	%l0,	0x199,	%g4
	add	%l3,	%o1,	%g5
	fmovsne	%xcc,	%f0,	%f21
	tl	%icc,	0x6
	edge8n	%g1,	%g7,	%g2
	fblg	%fcc1,	loop_2694
	srax	%i0,	%i2,	%i7
	fmovrde	%i1,	%f2,	%f28
	srax	%i6,	0x12,	%g3
loop_2694:
	tne	%xcc,	0x4
	sra	%o7,	%l6,	%g6
	nop
	fitos	%f14,	%f19
	fstod	%f19,	%f24
	tge	%icc,	0x6
	fblg	%fcc3,	loop_2695
	fblg,a	%fcc0,	loop_2696
	ldstub	[%l7 + 0x4D],	%l5
	fabss	%f14,	%f10
loop_2695:
	movn	%xcc,	%l2,	%i3
loop_2696:
	nop
	set	0x44, %l5
	stha	%i4,	[%l7 + %l5] 0x0c
	movvs	%icc,	%i5,	%o4
	tge	%icc,	0x5
	swap	[%l7 + 0x14],	%o6
	xnor	%l4,	0x0585,	%l1
	srlx	%o3,	%o5,	%o2
	tcc	%icc,	0x3
	fmovdcc	%icc,	%f1,	%f17
	edge16l	%o0,	%g4,	%l0
	ldd	[%l7 + 0x30],	%o0
	fornot2	%f8,	%f30,	%f6
	bg,a,pt	%icc,	loop_2697
	fsrc1s	%f19,	%f7
	fornot2s	%f4,	%f20,	%f28
	fzeros	%f16
loop_2697:
	fblg	%fcc0,	loop_2698
	sllx	%l3,	0x1E,	%g5
	fbg,a	%fcc0,	loop_2699
	movneg	%xcc,	%g7,	%g1
loop_2698:
	movleu	%icc,	%g2,	%i0
	fpack16	%f4,	%f16
loop_2699:
	tneg	%icc,	0x6
	fandnot1	%f4,	%f28,	%f4
	srlx	%i2,	%i1,	%i7
	mova	%icc,	%i6,	%o7
	tpos	%icc,	0x2
	fmovscs	%icc,	%f30,	%f15
	smulcc	%g3,	%g6,	%l6
	ldsh	[%l7 + 0x66],	%l5
	sethi	0x051C,	%l2
	and	%i3,	0x0E73,	%i4
	edge16l	%o4,	%i5,	%l4
	array8	%o6,	%o3,	%o5
	tl	%icc,	0x0
	membar	0x1F
	bg,pt	%icc,	loop_2700
	udivcc	%o2,	0x1611,	%l1
	nop
	setx	0x8474AB88,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x0B61B344,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f7,	%f25
	movrlez	%o0,	0x3A6,	%g4
loop_2700:
	edge8ln	%o1,	%l3,	%g5
	smulcc	%l0,	%g1,	%g2
	bl,a	%icc,	loop_2701
	popc	%i0,	%g7
	bn	%xcc,	loop_2702
	fbg	%fcc1,	loop_2703
loop_2701:
	orncc	%i2,	%i7,	%i1
	edge32l	%i6,	%g3,	%o7
loop_2702:
	subccc	%l6,	%l5,	%g6
loop_2703:
	fbuge	%fcc3,	loop_2704
	ldsw	[%l7 + 0x14],	%i3
	movge	%xcc,	%i4,	%l2
	tleu	%icc,	0x3
loop_2704:
	alignaddr	%o4,	%l4,	%o6
	movvc	%xcc,	%o3,	%i5
	fmovrdgz	%o2,	%f8,	%f20
	udiv	%l1,	0x1EE1,	%o5
	fcmpgt16	%f10,	%f20,	%o0
	bgu,pn	%icc,	loop_2705
	fbo,a	%fcc0,	loop_2706
	edge32ln	%g4,	%o1,	%l3
	movleu	%xcc,	%g5,	%l0
loop_2705:
	tgu	%xcc,	0x7
loop_2706:
	andncc	%g2,	%i0,	%g7
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x36] %asi,	%i2
	edge32l	%g1,	%i7,	%i6
	movle	%icc,	%g3,	%o7
	tvs	%icc,	0x1
	call	loop_2707
	ba,a,pn	%xcc,	loop_2708
	umul	%i1,	0x1FE1,	%l6
	movrgez	%g6,	%i3,	%i4
loop_2707:
	fmovrse	%l2,	%f20,	%f15
loop_2708:
	taddcctv	%o4,	0x1B0D,	%l4
	fmovdle	%icc,	%f4,	%f21
	tle	%xcc,	0x2
	umul	%l5,	%o6,	%i5
	edge32	%o3,	%o2,	%l1
	bge,a,pn	%xcc,	loop_2709
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%xcc,	%f0,	%f21
	sub	%o0,	%o5,	%g4
loop_2709:
	stx	%l3,	[%l7 + 0x48]
	fmovsne	%icc,	%f9,	%f4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%o1,	%l0
	set	0x10, %l4
	swapa	[%l7 + %l4] 0x11,	%g2
	edge32	%i0,	%g5,	%g7
	wr	%g0,	0x2f,	%asi
	stxa	%i2,	[%l7 + 0x18] %asi
	membar	#Sync
	fblg	%fcc0,	loop_2710
	alignaddr	%g1,	%i6,	%g3
	andn	%i7,	%o7,	%l6
	tpos	%xcc,	0x2
loop_2710:
	fabsd	%f4,	%f12
	edge32n	%g6,	%i1,	%i3
	fmovsvs	%xcc,	%f20,	%f16
	ldstub	[%l7 + 0x72],	%i4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x11] %asi,	%l2
	prefetch	[%l7 + 0x28],	 0x1
	orn	%o4,	%l4,	%o6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
	tsubcc	%l5,	%o2,	%o3
	edge8ln	%o0,	%l1,	%g4
	fba,a	%fcc0,	loop_2711
	xor	%o5,	%l3,	%o1
	movvc	%xcc,	%g2,	%l0
	tn	%xcc,	0x7
loop_2711:
	taddcctv	%g5,	0x13A5,	%g7
	ldsh	[%l7 + 0x6C],	%i0
	edge8ln	%g1,	%i2,	%i6
	sll	%g3,	0x06,	%i7
	fpadd32s	%f12,	%f14,	%f2
	movg	%icc,	%l6,	%g6
	stb	%i1,	[%l7 + 0x12]
	nop
	fitod	%f2,	%f16
	fdtos	%f16,	%f2
	movl	%icc,	%o7,	%i4
	fba	%fcc2,	loop_2712
	fones	%f2
	tsubcctv	%l2,	0x0DB0,	%o4
	subc	%i3,	%l4,	%i5
loop_2712:
	edge8ln	%o6,	%l5,	%o2
	movgu	%xcc,	%o0,	%l1
	xorcc	%g4,	%o5,	%o3
	movpos	%icc,	%l3,	%o1
	fmovscs	%icc,	%f24,	%f27
	alignaddrl	%g2,	%l0,	%g7
	bcs,a,pt	%icc,	loop_2713
	tl	%icc,	0x6
	fmovdcs	%xcc,	%f28,	%f22
	set	0x52, %i0
	ldsha	[%l7 + %i0] 0x88,	%g5
loop_2713:
	fpack16	%f22,	%f0
	orn	%i0,	%i2,	%i6
	brnz	%g3,	loop_2714
	flush	%l7 + 0x20
	ta	%xcc,	0x4
	sir	0x0ED6
loop_2714:
	nop
	set	0x28, %o7
	lda	[%l7 + %o7] 0x18,	%f13
	subcc	%g1,	%l6,	%i7
	ldx	[%l7 + 0x60],	%g6
	smul	%o7,	%i1,	%i4
	orcc	%o4,	%i3,	%l4
	popc	0x0EFF,	%l2
	fbu	%fcc1,	loop_2715
	movne	%icc,	%i5,	%l5
	edge32l	%o2,	%o0,	%l1
	ld	[%l7 + 0x1C],	%f24
loop_2715:
	edge32l	%o6,	%g4,	%o5
	fcmpne16	%f4,	%f12,	%l3
	array8	%o3,	%g2,	%l0
	movge	%icc,	%o1,	%g5
	fmovdl	%icc,	%f31,	%f16
	bg	loop_2716
	ldd	[%l7 + 0x18],	%g6
	fmovsge	%xcc,	%f8,	%f15
	tge	%xcc,	0x4
loop_2716:
	swap	[%l7 + 0x78],	%i2
	orncc	%i0,	%i6,	%g3
	edge32l	%g1,	%l6,	%g6
	fbge,a	%fcc1,	loop_2717
	umulcc	%o7,	%i7,	%i1
	popc	0x1B34,	%i4
	fmovsne	%xcc,	%f20,	%f4
loop_2717:
	edge8n	%i3,	%o4,	%l2
	tleu	%icc,	0x4
	edge16ln	%i5,	%l5,	%o2
	movvc	%icc,	%o0,	%l4
	fmovsle	%icc,	%f30,	%f26
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	tg	%icc,	0x0
	fnot2	%f0,	%f0
	addc	%g4,	%o5,	%l1
	fmovrsgz	%l3,	%f20,	%f4
	movn	%icc,	%g2,	%o3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%g5
	edge8	%l0,	%i2,	%i0
	ba,pt	%xcc,	loop_2718
	xnorcc	%i6,	0x08DD,	%g7
	movn	%icc,	%g3,	%l6
	tge	%xcc,	0x7
loop_2718:
	xnorcc	%g6,	0x0624,	%g1
	fmovspos	%xcc,	%f0,	%f8
	tneg	%icc,	0x3
	fcmpeq32	%f0,	%f2,	%o7
	tvc	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x61, %i2
	stba	%i7,	[%l7 + %i2] 0xea
	membar	#Sync
	andn	%i1,	0x0B3A,	%i3
	fmovse	%xcc,	%f1,	%f16
	ld	[%l7 + 0x54],	%f20
	st	%f10,	[%l7 + 0x14]
	edge16ln	%i4,	%l2,	%o4
	sdivcc	%l5,	0x1A72,	%i5
	bl,pt	%icc,	loop_2719
	brnz,a	%o0,	loop_2720
	tgu	%icc,	0x7
	sll	%o2,	%o6,	%l4
loop_2719:
	prefetch	[%l7 + 0x60],	 0x1
loop_2720:
	fmovsleu	%xcc,	%f15,	%f7
	fbge,a	%fcc0,	loop_2721
	umul	%o5,	%g4,	%l1
	fmovdg	%xcc,	%f25,	%f16
	fmovde	%xcc,	%f1,	%f29
loop_2721:
	pdist	%f26,	%f10,	%f14
	ta	%xcc,	0x4
	fbul	%fcc1,	loop_2722
	fbne	%fcc2,	loop_2723
	subcc	%l3,	0x1ED8,	%g2
	smulcc	%o3,	0x0C49,	%g5
loop_2722:
	sethi	0x0F15,	%l0
loop_2723:
	fpsub32s	%f2,	%f21,	%f27
	or	%o1,	%i2,	%i0
	movne	%xcc,	%g7,	%i6
	brlez	%g3,	loop_2724
	fandnot1s	%f13,	%f13,	%f22
	fnot1s	%f10,	%f22
	edge8	%l6,	%g6,	%g1
loop_2724:
	nop
	set	0x7C, %i3
	lduwa	[%l7 + %i3] 0x15,	%i7
	fnor	%f0,	%f8,	%f22
	edge32l	%i1,	%i3,	%i4
	xorcc	%o7,	0x0EC6,	%l2
	fpsub16s	%f7,	%f14,	%f8
	srax	%o4,	0x04,	%i5
	stw	%l5,	[%l7 + 0x7C]
	andn	%o2,	0x10E5,	%o6
	fors	%f31,	%f20,	%f3
	add	%o0,	%l4,	%g4
	array16	%l1,	%o5,	%l3
	movneg	%icc,	%o3,	%g5
	nop
	setx	0x8B774BC6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x5252A3EA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f13,	%f29
	sethi	0x1CC5,	%g2
	tleu	%icc,	0x1
	fmovsne	%icc,	%f0,	%f7
	or	%l0,	0x143E,	%i2
	subc	%i0,	%o1,	%i6
	nop
	setx	0x770DD5BD0059E4B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fmovse	%xcc,	%f26,	%f31
	fbne,a	%fcc2,	loop_2725
	orcc	%g3,	%l6,	%g7
	tsubcctv	%g6,	%i7,	%g1
	nop
	setx	0x406FE14F,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
loop_2725:
	edge32n	%i3,	%i4,	%o7
	fandnot1	%f10,	%f30,	%f30
	tge	%xcc,	0x4
	edge8l	%i1,	%l2,	%i5
	fcmple32	%f10,	%f8,	%o4
	fmovrde	%l5,	%f24,	%f2
	fmovdn	%xcc,	%f19,	%f9
	udiv	%o2,	0x01C4,	%o6
	xnorcc	%l4,	0x0E75,	%o0
	bne	loop_2726
	edge8ln	%l1,	%o5,	%g4
	udiv	%o3,	0x1896,	%l3
	fbug,a	%fcc2,	loop_2727
loop_2726:
	subc	%g5,	%g2,	%i2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%i0
loop_2727:
	umul	%l0,	0x0E62,	%i6
	membar	0x79
	udiv	%o1,	0x19CD,	%l6
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x50] %asi,	%g7
	movvs	%icc,	%g6,	%g3
	sdivcc	%i7,	0x0AE8,	%i3
	nop
	setx	0x9053E7CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	fzero	%f10
	movgu	%xcc,	%i4,	%g1
	nop
	setx	0x66BF3BA6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x75AA94EA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f24,	%f26
	tn	%xcc,	0x5
	brlz	%i1,	loop_2728
	mulscc	%o7,	0x0CCB,	%i5
	wr	%g0,	0x11,	%asi
	stha	%l2,	[%l7 + 0x4C] %asi
loop_2728:
	movne	%icc,	%l5,	%o2
	umul	%o4,	0x109C,	%l4
	ba,pt	%xcc,	loop_2729
	lduh	[%l7 + 0x72],	%o6
	sth	%o0,	[%l7 + 0x08]
	bge,a	%xcc,	loop_2730
loop_2729:
	fmovscc	%icc,	%f23,	%f16
	array8	%l1,	%g4,	%o5
	call	loop_2731
loop_2730:
	nop
	setx loop_2732, %l0, %l1
	jmpl %l1, %l3
	movre	%g5,	%o3,	%g2
	movl	%icc,	%i0,	%l0
loop_2731:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x50] %asi,	%i2
loop_2732:
	array8	%o1,	%i6,	%g7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x12] %asi,	%l6
	fmovdvs	%xcc,	%f26,	%f20
	nop
	setx	0x307D0F95,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	bpos	%xcc,	loop_2733
	brgz	%g3,	loop_2734
	fmovrdlez	%i7,	%f26,	%f6
	movre	%i3,	%g6,	%g1
loop_2733:
	tpos	%icc,	0x2
loop_2734:
	movl	%xcc,	%i4,	%i1
	taddcctv	%i5,	0x1A8A,	%l2
	sdivx	%l5,	0x163D,	%o7
	smul	%o2,	0x08BA,	%l4
	fmovdvs	%xcc,	%f23,	%f24
	fmovrdlez	%o4,	%f24,	%f18
	edge16l	%o0,	%o6,	%g4
	taddcctv	%l1,	0x1105,	%l3
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x49] %asi,	%g5
	popc	0x138D,	%o3
	tleu	%xcc,	0x4
	nop
	fitod	%f4,	%f0
	fdtox	%f0,	%f30
	tcc	%icc,	0x2
	array16	%g2,	%i0,	%o5
	andncc	%l0,	%i2,	%i6
	sdivx	%g7,	0x069C,	%o1
	movvc	%icc,	%g3,	%l6
	fands	%f15,	%f27,	%f27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%i7,	loop_2735
	bne,a,pt	%icc,	loop_2736
	umul	%i3,	0x196E,	%g6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x44] %asi,	%i4
loop_2735:
	movcs	%xcc,	%i1,	%i5
loop_2736:
	xorcc	%l2,	%l5,	%o7
	ldsw	[%l7 + 0x68],	%g1
	orncc	%l4,	0x1C1E,	%o4
	fmovdleu	%xcc,	%f18,	%f3
	fmovdn	%xcc,	%f22,	%f25
	fmovsa	%icc,	%f18,	%f6
	brlz	%o2,	loop_2737
	fnor	%f0,	%f4,	%f12
	xnorcc	%o0,	0x1EC5,	%g4
	fbue	%fcc0,	loop_2738
loop_2737:
	udiv	%o6,	0x1368,	%l1
	tne	%xcc,	0x0
	tneg	%xcc,	0x2
loop_2738:
	bge,a	loop_2739
	fmovrdgez	%l3,	%f16,	%f28
	fbo,a	%fcc1,	loop_2740
	fbo,a	%fcc0,	loop_2741
loop_2739:
	fpsub16s	%f8,	%f7,	%f31
	movle	%xcc,	%g5,	%g2
loop_2740:
	tne	%icc,	0x0
loop_2741:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x74] %asi,	%o3
	bneg,pt	%xcc,	loop_2742
	sdivx	%i0,	0x14C8,	%o5
	bcc,a,pn	%xcc,	loop_2743
	umulcc	%i2,	0x1E52,	%i6
loop_2742:
	fcmple32	%f6,	%f18,	%l0
	sllx	%g7,	%o1,	%l6
loop_2743:
	srax	%i7,	0x0A,	%g3
	sllx	%g6,	0x06,	%i4
	set	0x25, %i5
	ldsba	[%l7 + %i5] 0x0c,	%i3
	xorcc	%i1,	0x018D,	%i5
	fbu,a	%fcc1,	loop_2744
	fmovsl	%xcc,	%f3,	%f16
	array32	%l2,	%l5,	%g1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%o7,	%l4
loop_2744:
	tcs	%icc,	0x6
	orncc	%o2,	%o4,	%o0
	orcc	%o6,	%l1,	%g4
	fbule,a	%fcc2,	loop_2745
	addc	%l3,	%g2,	%o3
	ldub	[%l7 + 0x2A],	%i0
	stw	%g5,	[%l7 + 0x54]
loop_2745:
	call	loop_2746
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o5,	0x0C3C,	%i6
	xorcc	%i2,	0x1DCD,	%g7
loop_2746:
	tcs	%icc,	0x2
	fmovsa	%xcc,	%f25,	%f1
	fmovrslz	%o1,	%f16,	%f26
	fcmple32	%f28,	%f4,	%l0
	taddcc	%l6,	%i7,	%g3
	movrlz	%i4,	%i3,	%i1
	fmovsn	%icc,	%f17,	%f28
	nop
	setx	loop_2747,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%g6,	%l2,	%l5
	mulx	%i5,	%g1,	%o7
	movl	%xcc,	%l4,	%o4
loop_2747:
	fmuld8sux16	%f21,	%f31,	%f16
	set	0x4A, %g4
	ldsba	[%l7 + %g4] 0x88,	%o2
	movg	%xcc,	%o6,	%l1
	udiv	%g4,	0x15B1,	%o0
	movn	%xcc,	%g2,	%l3
	set	0x34, %o0
	stwa	%o3,	[%l7 + %o0] 0x11
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
	ldsh	[%l7 + 0x3A],	%o5
	or	%i6,	0x17DD,	%i2
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x220] %asi,	%g7
	set	0x60, %o3
	stxa	%i0,	[%l7 + %o3] 0xeb
	membar	#Sync
	tleu	%xcc,	0x5
	fbg,a	%fcc2,	loop_2748
	sllx	%o1,	0x0F,	%l0
	fandnot2	%f26,	%f26,	%f20
	fbe	%fcc1,	loop_2749
loop_2748:
	fbul	%fcc0,	loop_2750
	andn	%l6,	0x0896,	%g3
	mova	%xcc,	%i7,	%i4
loop_2749:
	tgu	%xcc,	0x2
loop_2750:
	fcmpne16	%f8,	%f22,	%i1
	sir	0x06A4
	movrgez	%g6,	%l2,	%l5
	srax	%i3,	0x09,	%g1
	std	%f20,	[%l7 + 0x60]
	move	%xcc,	%i5,	%l4
	fbue,a	%fcc1,	loop_2751
	subccc	%o7,	0x0C0C,	%o2
	tl	%xcc,	0x3
	sll	%o6,	%l1,	%o4
loop_2751:
	tcc	%xcc,	0x1
	andn	%g4,	%o0,	%g2
	movvc	%xcc,	%o3,	%g5
	sdivcc	%l3,	0x1391,	%o5
	andn	%i6,	%i2,	%i0
	popc	0x0B4D,	%g7
	movle	%icc,	%o1,	%l0
	fble	%fcc1,	loop_2752
	bvc,pt	%icc,	loop_2753
	tleu	%icc,	0x3
	alignaddrl	%l6,	%i7,	%g3
loop_2752:
	tsubcctv	%i4,	%g6,	%i1
loop_2753:
	tpos	%icc,	0x6
	movpos	%xcc,	%l2,	%i3
	movre	%l5,	0x0F5,	%i5
	edge16l	%g1,	%o7,	%o2
	bcs,a	%icc,	loop_2754
	tsubcctv	%l4,	0x1EBE,	%l1
	be,a	%icc,	loop_2755
	movpos	%icc,	%o6,	%o4
loop_2754:
	movrlz	%g4,	%g2,	%o0
	fble	%fcc2,	loop_2756
loop_2755:
	fnand	%f14,	%f2,	%f8
	fsrc2	%f24,	%f22
	ta	%xcc,	0x4
loop_2756:
	tpos	%xcc,	0x4
	srlx	%o3,	0x0D,	%g5
	udivcc	%l3,	0x1775,	%o5
	taddcc	%i2,	0x04B0,	%i0
	sll	%g7,	0x1B,	%o1
	fand	%f2,	%f18,	%f8
	xnorcc	%l0,	0x0C0D,	%l6
	fmovsg	%xcc,	%f16,	%f0
	movpos	%icc,	%i6,	%i7
	tge	%xcc,	0x7
	fones	%f22
	udivx	%g3,	0x0DA3,	%g6
	udivx	%i4,	0x0988,	%i1
	stb	%i3,	[%l7 + 0x3B]
	fone	%f14
	ldstub	[%l7 + 0x73],	%l2
	brgz	%l5,	loop_2757
	bvs,a,pt	%icc,	loop_2758
	fandnot1	%f10,	%f10,	%f28
	and	%g1,	0x1433,	%o7
loop_2757:
	umul	%i5,	%o2,	%l4
loop_2758:
	move	%icc,	%l1,	%o6
	nop
	setx	loop_2759,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%o4,	0x0C25,	%g4
	popc	0x108C,	%g2
	edge32n	%o0,	%o3,	%l3
loop_2759:
	fbge	%fcc1,	loop_2760
	bgu,pn	%icc,	loop_2761
	nop
	setx	0xA5693E23,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xF2F6DD7B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f23,	%f19
	fpack32	%f6,	%f6,	%f0
loop_2760:
	udivx	%o5,	0x1FE5,	%i2
loop_2761:
	nop
	set	0x78, %o5
	sta	%f0,	[%l7 + %o5] 0x14
	edge16n	%i0,	%g7,	%g5
	orn	%o1,	0x1B6D,	%l0
	subccc	%l6,	%i6,	%g3
	fpsub16	%f6,	%f6,	%f2
	swap	[%l7 + 0x38],	%g6
	orncc	%i7,	0x1DB9,	%i4
	edge8	%i1,	%l2,	%l5
	taddcctv	%g1,	0x0AAE,	%o7
	alignaddr	%i5,	%o2,	%i3
	sllx	%l1,	%l4,	%o4
	srlx	%o6,	%g2,	%g4
	movleu	%xcc,	%o0,	%l3
	movl	%xcc,	%o5,	%o3
	fones	%f13
	sllx	%i2,	%i0,	%g7
	taddcc	%o1,	0x0415,	%l0
	edge32n	%g5,	%i6,	%g3
	udivx	%l6,	0x1B02,	%g6
	orn	%i7,	0x069A,	%i4
	subccc	%l2,	%l5,	%g1
	smulcc	%i1,	0x180B,	%o7
	fmovsleu	%xcc,	%f11,	%f5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x30] %asi,	%o2
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x60] %asi,	%i5
	tpos	%xcc,	0x4
	subccc	%l1,	%l4,	%o4
	orncc	%o6,	0x1D43,	%i3
	edge8	%g4,	%o0,	%l3
	movpos	%icc,	%g2,	%o5
	movg	%icc,	%i2,	%i0
	tsubcc	%o3,	%o1,	%g7
	tsubcctv	%g5,	0x13CE,	%l0
	tsubcctv	%i6,	%l6,	%g6
	bpos,a,pt	%icc,	loop_2762
	fbule,a	%fcc3,	loop_2763
	fmovdpos	%xcc,	%f25,	%f17
	popc	0x0D3F,	%i7
loop_2762:
	movre	%g3,	0x1DB,	%i4
loop_2763:
	umul	%l2,	%g1,	%l5
	fmovdg	%icc,	%f9,	%f8
	movvc	%icc,	%i1,	%o2
	tgu	%xcc,	0x7
	mulscc	%i5,	0x15DA,	%o7
	bvc,a	loop_2764
	tneg	%xcc,	0x7
	andn	%l4,	0x0361,	%l1
	fbne,a	%fcc3,	loop_2765
loop_2764:
	fpadd16	%f26,	%f8,	%f24
	nop
	setx	0xAE7BF6E9CC11BD90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f22
	fnand	%f0,	%f26,	%f20
loop_2765:
	movge	%icc,	%o4,	%i3
	fmovse	%icc,	%f6,	%f28
	fcmpgt16	%f2,	%f28,	%g4
	sethi	0x115B,	%o6
	tge	%xcc,	0x1
	tsubcctv	%o0,	0x17E7,	%l3
	bg,pn	%xcc,	loop_2766
	movne	%icc,	%o5,	%i2
	fmovrsgz	%i0,	%f7,	%f17
	stx	%g2,	[%l7 + 0x60]
loop_2766:
	movvc	%xcc,	%o3,	%g7
	movrgez	%o1,	%l0,	%i6
	tvc	%xcc,	0x5
	udiv	%l6,	0x1C54,	%g5
	tpos	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i7,	0x026B,	%g6
	fand	%f26,	%f4,	%f24
	srax	%g3,	%l2,	%g1
	movle	%xcc,	%l5,	%i4
	movpos	%xcc,	%o2,	%i5
	add	%i1,	0x1801,	%o7
	fmovdn	%icc,	%f27,	%f22
	xorcc	%l4,	%l1,	%o4
	sra	%g4,	%o6,	%i3
	srlx	%o0,	0x00,	%l3
	fmovdneg	%icc,	%f13,	%f28
	fbo,a	%fcc0,	loop_2767
	mulx	%i2,	0x0198,	%i0
	fmul8x16al	%f17,	%f0,	%f20
	tsubcctv	%o5,	%g2,	%g7
loop_2767:
	movneg	%icc,	%o1,	%l0
	movre	%i6,	0x39C,	%o3
	st	%f28,	[%l7 + 0x34]
	movl	%xcc,	%l6,	%g5
	sllx	%g6,	%i7,	%l2
	nop
	setx	0xD2FF434B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x2BCC9291,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f4,	%f9
	tvs	%xcc,	0x7
	array8	%g1,	%g3,	%i4
	be	loop_2768
	movl	%icc,	%l5,	%i5
	ldsb	[%l7 + 0x41],	%i1
	tvs	%xcc,	0x2
loop_2768:
	bvc	%xcc,	loop_2769
	fbn,a	%fcc1,	loop_2770
	lduh	[%l7 + 0x7A],	%o2
	sir	0x0284
loop_2769:
	movpos	%xcc,	%o7,	%l4
loop_2770:
	edge32l	%o4,	%l1,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%i3,	0x07EF,	%o6
	membar	0x62
	alignaddr	%l3,	%i2,	%i0
	move	%icc,	%o0,	%o5
	udivcc	%g7,	0x1CDD,	%g2
	movpos	%xcc,	%o1,	%i6
	wr	%g0,	0x81,	%asi
	stha	%o3,	[%l7 + 0x60] %asi
	fblg,a	%fcc3,	loop_2771
	addccc	%l0,	%l6,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f14,	%f28,	%f11
loop_2771:
	stx	%i7,	[%l7 + 0x18]
	mova	%icc,	%l2,	%g1
	array8	%g5,	%g3,	%i4
	addcc	%l5,	0x1232,	%i1
	fand	%f24,	%f24,	%f6
	stw	%i5,	[%l7 + 0x2C]
	mulscc	%o7,	0x04C1,	%o2
	tsubcctv	%l4,	%o4,	%l1
	bshuffle	%f10,	%f4,	%f4
	andncc	%i3,	%g4,	%o6
	tsubcc	%l3,	%i2,	%i0
	fmovrdlz	%o0,	%f2,	%f0
	brgez,a	%g7,	loop_2772
	movvs	%xcc,	%g2,	%o1
	edge32l	%o5,	%o3,	%i6
	tg	%icc,	0x5
loop_2772:
	fmovrdgez	%l0,	%f18,	%f18
	sethi	0x1D25,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i7,	0x1415,	%l2
	orncc	%g6,	0x0C6F,	%g5
	andncc	%g1,	%i4,	%g3
	taddcctv	%i1,	%l5,	%o7
	fbu,a	%fcc1,	loop_2773
	xor	%o2,	%l4,	%i5
	smulcc	%l1,	0x176B,	%o4
	addccc	%i3,	%g4,	%l3
loop_2773:
	edge32n	%i2,	%o6,	%o0
	ldd	[%l7 + 0x68],	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g7,	0x09DF,	%g2
	brz	%i0,	loop_2774
	tsubcctv	%o1,	0x19AF,	%o5
	ldstub	[%l7 + 0x10],	%o3
	sth	%i6,	[%l7 + 0x64]
loop_2774:
	array16	%l0,	%l6,	%l2
	fble	%fcc2,	loop_2775
	alignaddr	%i7,	%g6,	%g5
	movvs	%xcc,	%g1,	%g3
	orcc	%i1,	%i4,	%l5
loop_2775:
	taddcc	%o2,	0x08B4,	%l4
	array8	%o7,	%i5,	%l1
	movcc	%xcc,	%i3,	%g4
	set	0x4B, %o4
	ldsba	[%l7 + %o4] 0x88,	%o4
	ldsw	[%l7 + 0x0C],	%i2
	bpos,a	%xcc,	loop_2776
	udiv	%o6,	0x09C2,	%o0
	fpadd32	%f4,	%f18,	%f20
	tsubcctv	%g7,	%l3,	%g2
loop_2776:
	movcc	%icc,	%o1,	%o5
	srl	%i0,	%o3,	%i6
	sll	%l0,	0x1A,	%l6
	nop
	fitos	%f4,	%f29
	fstod	%f29,	%f20
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x10] %asi,	%l2
	tn	%xcc,	0x7
	or	%g6,	%g5,	%i7
	ldstub	[%l7 + 0x7C],	%g3
	fmul8x16al	%f1,	%f0,	%f22
	edge32n	%g1,	%i1,	%i4
	wr	%g0,	0x22,	%asi
	stha	%o2,	[%l7 + 0x46] %asi
	membar	#Sync
	fbge	%fcc3,	loop_2777
	taddcctv	%l5,	0x195C,	%o7
	bg,a	%xcc,	loop_2778
	fmuld8ulx16	%f21,	%f3,	%f30
loop_2777:
	bleu,a,pt	%icc,	loop_2779
	sll	%l4,	%i5,	%l1
loop_2778:
	tge	%icc,	0x1
	fpadd32	%f12,	%f8,	%f16
loop_2779:
	fpack32	%f0,	%f30,	%f4
	andn	%g4,	0x04BF,	%i3
	tg	%xcc,	0x3
	edge32ln	%o4,	%o6,	%o0
	fmovdneg	%xcc,	%f14,	%f6
	xnor	%i2,	%l3,	%g2
	sllx	%g7,	%o5,	%o1
	subccc	%i0,	%i6,	%l0
	fbl	%fcc0,	loop_2780
	fabss	%f22,	%f25
	sdivcc	%l6,	0x0FF5,	%l2
	movpos	%icc,	%g6,	%o3
loop_2780:
	nop
	setx loop_2781, %l0, %l1
	jmpl %l1, %i7
	membar	0x40
	fblg	%fcc2,	loop_2782
	be,a,pt	%icc,	loop_2783
loop_2781:
	bne	loop_2784
	sllx	%g3,	%g1,	%i1
loop_2782:
	orcc	%g5,	%o2,	%i4
loop_2783:
	bcs,a,pn	%xcc,	loop_2785
loop_2784:
	nop
	setx	0x7A351B1E996DAE92,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xEB0A1E99403A0AED,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f4,	%f6
	movge	%xcc,	%l5,	%o7
	ldstub	[%l7 + 0x11],	%i5
loop_2785:
	tleu	%icc,	0x2
	fmuld8sux16	%f13,	%f3,	%f22
	movrlz	%l1,	%g4,	%l4
	nop
	fitos	%f14,	%f19
	fstod	%f19,	%f8
	xorcc	%i3,	%o4,	%o6
	fble,a	%fcc1,	loop_2786
	fmovdcs	%icc,	%f2,	%f31
	sir	0x1A89
	srax	%i2,	%o0,	%l3
loop_2786:
	edge32n	%g2,	%g7,	%o5
	sdivx	%o1,	0x07F0,	%i0
	wr	%g0,	0x89,	%asi
	stwa	%i6,	[%l7 + 0x38] %asi
	addc	%l0,	%l6,	%l2
	tne	%icc,	0x4
	sra	%g6,	0x04,	%i7
	taddcc	%g3,	%g1,	%o3
	movrgz	%i1,	%o2,	%i4
	brz,a	%g5,	loop_2787
	sll	%o7,	%l5,	%l1
	nop
	setx loop_2788, %l0, %l1
	jmpl %l1, %g4
	movrlz	%i5,	%i3,	%l4
loop_2787:
	bge,pn	%icc,	loop_2789
	xnorcc	%o6,	0x1F0D,	%i2
loop_2788:
	bge,pn	%xcc,	loop_2790
	xor	%o0,	%l3,	%g2
loop_2789:
	call	loop_2791
	movge	%xcc,	%o4,	%g7
loop_2790:
	sth	%o1,	[%l7 + 0x0E]
	ldd	[%l7 + 0x58],	%f22
loop_2791:
	sethi	0x106A,	%o5
	udivx	%i6,	0x1492,	%l0
	movvs	%xcc,	%l6,	%i0
	fmovdgu	%xcc,	%f18,	%f1
	fpmerge	%f3,	%f19,	%f28
	fmovde	%icc,	%f3,	%f8
	tle	%icc,	0x0
	bleu	loop_2792
	std	%f30,	[%l7 + 0x50]
	brz,a	%g6,	loop_2793
	brlez	%i7,	loop_2794
loop_2792:
	andncc	%g3,	%l2,	%o3
	movle	%icc,	%i1,	%o2
loop_2793:
	nop
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2794:
	fnot2s	%f15,	%f29
	fone	%f26
	nop
	set	0x14, %i4
	ldub	[%l7 + %i4],	%i4
	ldsw	[%l7 + 0x18],	%g5
	srlx	%o7,	%g1,	%l1
	edge16	%g4,	%l5,	%i5
	lduw	[%l7 + 0x08],	%i3
	set	0x20, %l3
	stxa	%o6,	[%l7 + %l3] 0x19
	orn	%l4,	%i2,	%l3
	smul	%g2,	0x157A,	%o0
	tcc	%icc,	0x1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x09] %asi,	%o4
	xnor	%g7,	%o1,	%o5
	nop
	setx	loop_2795,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbue	%fcc2,	loop_2796
	sll	%l0,	%l6,	%i0
	movleu	%icc,	%i6,	%g6
loop_2795:
	smul	%g3,	%i7,	%l2
loop_2796:
	taddcctv	%o3,	%i1,	%o2
	fcmpgt16	%f26,	%f10,	%i4
	movrlez	%o7,	%g5,	%l1
	nop
	setx	0xB626D5D0928E4343,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xCCA332D5BD5C08DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f2,	%f6
	subc	%g1,	0x1602,	%g4
	alignaddr	%i5,	%i3,	%l5
	fbge	%fcc1,	loop_2797
	tvs	%xcc,	0x2
	movl	%xcc,	%o6,	%l4
	fand	%f22,	%f28,	%f8
loop_2797:
	bne,pn	%xcc,	loop_2798
	tle	%xcc,	0x4
	set	0x08, %l2
	lda	[%l7 + %l2] 0x0c,	%f26
loop_2798:
	fmovsgu	%icc,	%f9,	%f28
	mova	%xcc,	%l3,	%i2
	nop
	setx loop_2799, %l0, %l1
	jmpl %l1, %o0
	subccc	%g2,	%g7,	%o1
	edge16l	%o5,	%l0,	%o4
	nop
	fitos	%f5,	%f30
	fstox	%f30,	%f12
loop_2799:
	fbg,a	%fcc1,	loop_2800
	addcc	%i0,	%i6,	%g6
	subccc	%l6,	%i7,	%l2
	bg,a,pn	%xcc,	loop_2801
loop_2800:
	edge8	%g3,	%o3,	%o2
	addc	%i4,	0x1A1C,	%o7
	fbule	%fcc2,	loop_2802
loop_2801:
	movne	%icc,	%i1,	%g5
	fand	%f2,	%f16,	%f0
	lduh	[%l7 + 0x48],	%l1
loop_2802:
	orncc	%g1,	0x1159,	%g4
	fxnors	%f18,	%f31,	%f22
	and	%i5,	%i3,	%l5
	fpadd32s	%f2,	%f6,	%f30
	fmovdvc	%icc,	%f30,	%f30
	tn	%xcc,	0x7
	set	0x60, %g7
	ldda	[%l7 + %g7] 0x2e,	%l4
	movrgz	%o6,	%i2,	%o0
	edge32	%l3,	%g7,	%o1
	te	%xcc,	0x7
	tl	%icc,	0x6
	edge16n	%g2,	%o5,	%l0
	brgz	%o4,	loop_2803
	fones	%f17
	xnorcc	%i0,	0x034C,	%i6
	edge16ln	%l6,	%i7,	%g6
loop_2803:
	fpadd32	%f24,	%f4,	%f12
	edge32	%l2,	%g3,	%o3
	edge8	%i4,	%o7,	%i1
	nop
	setx	0x6F5AB78EF0638C20,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	set	0x48, %g2
	stxa	%o2,	[%l7 + %g2] 0x18
	xnorcc	%l1,	0x1F0B,	%g5
	tleu	%xcc,	0x1
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x10] %asi,	%g4
	edge8ln	%g1,	%i3,	%l5
	fnegd	%f4,	%f26
	orn	%i5,	0x03C3,	%o6
	fbug	%fcc2,	loop_2804
	subccc	%l4,	%o0,	%l3
	addccc	%i2,	%o1,	%g2
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2804:
	fmovrdne	%g7,	%f12,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x3060766D,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	tsubcctv	%o5,	0x0037,	%l0
	umul	%o4,	%i0,	%i6
	tgu	%icc,	0x3
	edge8l	%l6,	%i7,	%l2
	srl	%g3,	0x03,	%g6
	tleu	%xcc,	0x1
	fba,a	%fcc0,	loop_2805
	orcc	%o3,	0x0F24,	%o7
	alignaddrl	%i4,	%o2,	%l1
	movvs	%icc,	%g5,	%g4
loop_2805:
	brlez,a	%g1,	loop_2806
	movcs	%xcc,	%i3,	%i1
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i5,	%l5
loop_2806:
	edge8ln	%o6,	%l4,	%l3
	fmovd	%f0,	%f10
	smulcc	%o0,	0x0417,	%o1
	edge8ln	%g2,	%i2,	%o5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x7E] %asi,	%l0
	fbug,a	%fcc3,	loop_2807
	fmovrse	%g7,	%f8,	%f21
	subc	%i0,	0x1B98,	%i6
	fbu	%fcc0,	loop_2808
loop_2807:
	tsubcctv	%l6,	%o4,	%i7
	fandnot1	%f16,	%f30,	%f16
	mova	%icc,	%g3,	%g6
loop_2808:
	fmovrde	%o3,	%f20,	%f2
	std	%f28,	[%l7 + 0x50]
	movre	%l2,	0x28B,	%o7
	ldd	[%l7 + 0x48],	%o2
	taddcc	%i4,	%g5,	%g4
	srlx	%g1,	0x15,	%l1
	ta	%xcc,	0x6
	movgu	%xcc,	%i1,	%i3
	and	%i5,	0x06B0,	%l5
	sllx	%l4,	%l3,	%o6
	fmovdn	%icc,	%f11,	%f25
	ldsb	[%l7 + 0x70],	%o1
	movn	%icc,	%o0,	%i2
	tg	%xcc,	0x2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g2,	%i0,	%g7
	tcs	%xcc,	0x4
	sdivcc	%l6,	0x17AA,	%o4
	brlez,a	%i6,	loop_2809
	fpackfix	%f30,	%f10
	fbug	%fcc1,	loop_2810
	fbul	%fcc1,	loop_2811
loop_2809:
	brnz	%g3,	loop_2812
	bl,a,pt	%xcc,	loop_2813
loop_2810:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2811:
	movl	%icc,	%i7,	%o3
loop_2812:
	stb	%g6,	[%l7 + 0x40]
loop_2813:
	andn	%l2,	%o7,	%o2
	addc	%i4,	%g5,	%g1
	fbu,a	%fcc1,	loop_2814
	udiv	%g4,	0x1DEF,	%l1
	fornot2	%f8,	%f10,	%f12
	tl	%icc,	0x0
loop_2814:
	sdiv	%i3,	0x115A,	%i5
	fbn,a	%fcc0,	loop_2815
	fnot2s	%f29,	%f7
	fnands	%f24,	%f30,	%f8
	ta	%icc,	0x4
loop_2815:
	edge8n	%i1,	%l5,	%l3
	smulcc	%o6,	%l4,	%o1
	alignaddrl	%o0,	%i2,	%l0
	udiv	%g2,	0x06DF,	%o5
	fmovrdlz	%g7,	%f16,	%f30
	nop
	setx	0x105818FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	movrgez	%i0,	%o4,	%i6
	movrgez	%l6,	%g3,	%o3
	fzeros	%f17
	bshuffle	%f10,	%f20,	%f8
	andn	%g6,	0x1213,	%i7
	fbge,a	%fcc0,	loop_2816
	fmovd	%f16,	%f2
	smulcc	%l2,	0x11CB,	%o7
	alignaddrl	%i4,	%o2,	%g5
loop_2816:
	tsubcctv	%g4,	0x0A79,	%g1
	movrlez	%l1,	%i3,	%i5
	array16	%l5,	%l3,	%o6
	popc	%i1,	%l4
	movcs	%icc,	%o0,	%o1
	orcc	%l0,	%i2,	%g2
	fbu	%fcc1,	loop_2817
	nop
	setx loop_2818, %l0, %l1
	jmpl %l1, %g7
	movpos	%icc,	%o5,	%o4
	nop
	setx	loop_2819,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2817:
	stbar
loop_2818:
	prefetch	[%l7 + 0x20],	 0x2
	orncc	%i6,	0x002C,	%i0
loop_2819:
	nop
	set	0x50, %g6
	ldda	[%l7 + %g6] 0x10,	%i6
	prefetch	[%l7 + 0x7C],	 0x2
	alignaddr	%o3,	%g6,	%i7
	nop
	setx	0xB3B5A094B24A4331,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xBF0B7DF8C7D70E1A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f14,	%f8
	ta	%icc,	0x7
	fornot2s	%f4,	%f4,	%f7
	umul	%l2,	%o7,	%g3
	be,a,pt	%icc,	loop_2820
	fmovdge	%xcc,	%f9,	%f16
	edge32ln	%i4,	%g5,	%o2
	sll	%g4,	%g1,	%l1
loop_2820:
	srl	%i3,	%i5,	%l5
	addc	%o6,	0x00D5,	%i1
	tle	%xcc,	0x5
	bge,a	loop_2821
	movrne	%l3,	0x259,	%o0
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o1
loop_2821:
	edge16l	%l4,	%i2,	%g2
	tcc	%xcc,	0x6
	fors	%f19,	%f6,	%f11
	xnor	%l0,	%g7,	%o4
	orcc	%o5,	0x1B3F,	%i6
	fmovdleu	%icc,	%f22,	%f14
	sll	%i0,	%o3,	%l6
	bn,a,pt	%icc,	loop_2822
	srax	%g6,	%l2,	%o7
	fbue	%fcc2,	loop_2823
	movl	%xcc,	%i7,	%g3
loop_2822:
	tcc	%icc,	0x0
	tg	%icc,	0x5
loop_2823:
	move	%icc,	%g5,	%o2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%g4
	set	0x320, %l0
	nop 	! 	stxa	%l1,	[%g0 + %l0] 0x40 ripped by fixASI40.pl
	fbn,a	%fcc0,	loop_2824
	xnorcc	%i3,	%i5,	%l5
	array16	%o6,	%g1,	%i1
	movpos	%xcc,	%l3,	%o1
loop_2824:
	nop
	set	0x60, %g5
	ldswa	[%l7 + %g5] 0x15,	%l4
	movne	%xcc,	%i2,	%o0
	movg	%xcc,	%l0,	%g7
	alignaddrl	%g2,	%o4,	%o5
	edge32n	%i6,	%i0,	%l6
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f30
	fxtod	%f30,	%f10
	fbuge,a	%fcc0,	loop_2825
	movleu	%icc,	%o3,	%g6
	addcc	%o7,	%l2,	%i7
	bl,pn	%xcc,	loop_2826
loop_2825:
	movrne	%g5,	%o2,	%g3
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i4
loop_2826:
	or	%g4,	%i3,	%l1
	fmovsge	%xcc,	%f18,	%f6
	movge	%icc,	%l5,	%o6
	stw	%g1,	[%l7 + 0x78]
	mulscc	%i5,	0x0314,	%i1
	fmovsl	%xcc,	%f29,	%f24
	movvs	%xcc,	%l3,	%l4
	fcmpne16	%f14,	%f24,	%o1
	movrlz	%i2,	0x243,	%o0
	nop
	setx	loop_2827,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	st	%f28,	[%l7 + 0x34]
	alignaddr	%l0,	%g7,	%o4
	subccc	%g2,	%i6,	%i0
loop_2827:
	movleu	%xcc,	%l6,	%o3
	bvs	loop_2828
	call	loop_2829
	xorcc	%o5,	%o7,	%g6
	fmovsne	%xcc,	%f23,	%f0
loop_2828:
	movneg	%icc,	%l2,	%g5
loop_2829:
	smul	%i7,	0x1EE3,	%g3
	nop
	fitos	%f11,	%f7
	fstod	%f7,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f24,	%f30,	%f26
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x24] %asi,	%i4
	nop
	fitos	%f6,	%f9
	fstoi	%f9,	%f7
	srl	%o2,	%g4,	%i3
	tcc	%icc,	0x2
	be	%icc,	loop_2830
	array32	%l1,	%o6,	%g1
	xorcc	%i5,	0x0B82,	%l5
	smulcc	%l3,	0x0E94,	%i1
loop_2830:
	edge32n	%o1,	%l4,	%o0
	edge32l	%l0,	%i2,	%g7
	set	0x34, %o6
	stwa	%g2,	[%l7 + %o6] 0x81
	movvc	%icc,	%o4,	%i0
	smulcc	%i6,	%l6,	%o3
	fmovdgu	%xcc,	%f30,	%f11
	fpadd16s	%f28,	%f10,	%f9
	tne	%icc,	0x6
	add	%o7,	%g6,	%o5
	movle	%icc,	%g5,	%l2
	fbl,a	%fcc2,	loop_2831
	tle	%xcc,	0x4
	bgu,a,pt	%icc,	loop_2832
	ldd	[%l7 + 0x40],	%i6
loop_2831:
	fmovrsne	%i4,	%f17,	%f5
	bge,pt	%icc,	loop_2833
loop_2832:
	movrne	%g3,	0x174,	%g4
	set	0x10, %i6
	swapa	[%l7 + %i6] 0x80,	%i3
loop_2833:
	udiv	%o2,	0x03CE,	%l1
	tg	%icc,	0x0
	mova	%xcc,	%o6,	%g1
	fpadd32s	%f9,	%f21,	%f15
	movrlz	%i5,	0x139,	%l5
	xnorcc	%i1,	%l3,	%o1
	tl	%xcc,	0x6
	edge32ln	%o0,	%l0,	%l4
	addc	%i2,	%g7,	%g2
	edge32l	%i0,	%o4,	%i6
	brlz	%o3,	loop_2834
	taddcc	%l6,	0x151E,	%g6
	fble,a	%fcc3,	loop_2835
	taddcc	%o7,	0x0FA5,	%o5
loop_2834:
	nop
	setx	0x905CFAC0,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fandnot1	%f2,	%f0,	%f16
loop_2835:
	movre	%g5,	%l2,	%i4
	ta	%icc,	0x3
	edge32n	%g3,	%i7,	%g4
	umulcc	%o2,	0x0715,	%i3
	srax	%o6,	0x1A,	%l1
	orcc	%i5,	%g1,	%l5
	wr	%g0,	0x0c,	%asi
	stwa	%l3,	[%l7 + 0x34] %asi
	xnorcc	%o1,	0x1C5A,	%o0
	bl,a	%icc,	loop_2836
	fbo	%fcc1,	loop_2837
	sllx	%l0,	%i1,	%i2
	xnor	%g7,	0x109D,	%l4
loop_2836:
	movn	%xcc,	%g2,	%o4
loop_2837:
	fbu	%fcc3,	loop_2838
	nop
	fitos	%f9,	%f27
	fstoi	%f27,	%f10
	fmul8x16au	%f4,	%f26,	%f0
	tge	%xcc,	0x1
loop_2838:
	umulcc	%i6,	0x08C7,	%i0
	movcs	%icc,	%o3,	%l6
	nop
	setx	0x132CCFC2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x2BA5DC2E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f19,	%f13
	movge	%xcc,	%g6,	%o5
	smulcc	%g5,	%l2,	%i4
	tle	%xcc,	0x6
	fbne	%fcc2,	loop_2839
	udiv	%g3,	0x03D9,	%i7
	sth	%g4,	[%l7 + 0x26]
	nop
	fitos	%f1,	%f24
	fstox	%f24,	%f28
loop_2839:
	sdiv	%o7,	0x1425,	%o2
	addcc	%i3,	0x09A8,	%l1
	fmovdle	%xcc,	%f31,	%f9
	movpos	%xcc,	%o6,	%g1
	udivx	%i5,	0x06D6,	%l5
	movrne	%o1,	0x2A9,	%l3
	fexpand	%f17,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x1A],	%l0
	umul	%o0,	%i1,	%i2
	tvs	%xcc,	0x5
	stw	%l4,	[%l7 + 0x08]
	edge16ln	%g7,	%o4,	%g2
	fsrc2s	%f25,	%f22
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sllx	%i0,	0x13,	%o3
	orcc	%i6,	0x1099,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g6,	%o5,	%g5
	edge32l	%l2,	%i4,	%g3
	srax	%i7,	%o7,	%o2
	te	%icc,	0x3
	for	%f16,	%f24,	%f16
	fcmpgt32	%f16,	%f10,	%i3
	smulcc	%l1,	%g4,	%g1
	movrne	%o6,	%i5,	%o1
	sir	0x1DFC
	bpos,pn	%icc,	loop_2840
	fones	%f4
	lduh	[%l7 + 0x62],	%l3
	fmovsneg	%icc,	%f8,	%f20
loop_2840:
	fcmpgt32	%f18,	%f0,	%l0
	movrne	%l5,	%o0,	%i1
	udivcc	%i2,	0x13D6,	%l4
	movleu	%icc,	%o4,	%g7
	membar	0x0D
	edge32n	%i0,	%o3,	%i6
	wr	%g0,	0x18,	%asi
	sta	%f30,	[%l7 + 0x6C] %asi
	fsrc1	%f16,	%f30
	fcmpne32	%f6,	%f6,	%g2
	membar	0x59
	fmovrdne	%g6,	%f0,	%f8
	bcs,pt	%icc,	loop_2841
	bge,a,pt	%icc,	loop_2842
	fpack32	%f28,	%f16,	%f30
	sll	%o5,	%l6,	%l2
loop_2841:
	addccc	%i4,	0x11B6,	%g5
loop_2842:
	tsubcctv	%g3,	%i7,	%o7
	addcc	%o2,	%i3,	%l1
	fand	%f30,	%f8,	%f2
	movl	%icc,	%g4,	%o6
	ta	%icc,	0x2
	set	0x14, %i7
	ldswa	[%l7 + %i7] 0x80,	%i5
	movne	%icc,	%g1,	%o1
	array16	%l0,	%l3,	%l5
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f16
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f0
	fxtod	%f0,	%f2
	bcs,a,pn	%xcc,	loop_2843
	sra	%o0,	%i2,	%l4
	movleu	%icc,	%o4,	%g7
	ble,pn	%icc,	loop_2844
loop_2843:
	fbug,a	%fcc1,	loop_2845
	subccc	%i1,	%i0,	%o3
	xnor	%g2,	%g6,	%i6
loop_2844:
	movrne	%l6,	0x021,	%l2
loop_2845:
	std	%f26,	[%l7 + 0x78]
	add	%o5,	0x12A4,	%i4
	brlz,a	%g5,	loop_2846
	mova	%icc,	%g3,	%o7
	bcs,a	loop_2847
	movg	%xcc,	%i7,	%i3
loop_2846:
	flush	%l7 + 0x1C
	brz,a	%o2,	loop_2848
loop_2847:
	tpos	%xcc,	0x1
	membar	0x19
	fbe,a	%fcc0,	loop_2849
loop_2848:
	tsubcc	%l1,	%o6,	%i5
	movle	%icc,	%g1,	%o1
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x26] %asi,	%l0
loop_2849:
	sethi	0x0109,	%g4
	set	0x48, %g3
	stxa	%l5,	[%l7 + %g3] 0x04
	fmovda	%icc,	%f14,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x20,	%asi
	stxa	%o0,	[%g0 + 0x20] %asi
	subccc	%i2,	%l4,	%l3
	orncc	%o4,	%g7,	%i0
	membar	0x6E
	udiv	%i1,	0x0DD0,	%o3
	movrgz	%g2,	0x3F5,	%g6
	umulcc	%l6,	%i6,	%o5
	sdiv	%l2,	0x0493,	%g5
	bvs,a	loop_2850
	nop
	setx	loop_2851,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	lduw	[%l7 + 0x74],	%i4
	movre	%g3,	%o7,	%i7
loop_2850:
	movneg	%xcc,	%o2,	%l1
loop_2851:
	sth	%o6,	[%l7 + 0x72]
	fbge,a	%fcc2,	loop_2852
	sllx	%i5,	%i3,	%g1
	movvc	%xcc,	%o1,	%g4
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f16
loop_2852:
	tleu	%xcc,	0x2
	or	%l5,	0x07D4,	%l0
	array8	%i2,	%o0,	%l3
	udivx	%l4,	0x08BA,	%g7
	fmovrdlz	%o4,	%f6,	%f28
	udivcc	%i0,	0x1C79,	%i1
	fmul8x16au	%f2,	%f14,	%f12
	for	%f24,	%f2,	%f4
	te	%icc,	0x3
	fnands	%f29,	%f2,	%f16
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%o3
	fmovsle	%icc,	%f28,	%f2
	movrgz	%g2,	0x252,	%l6
	popc	0x0A52,	%g6
	fbul,a	%fcc3,	loop_2853
	tgu	%icc,	0x7
	fmovdl	%xcc,	%f9,	%f2
	sll	%i6,	%o5,	%g5
loop_2853:
	tge	%icc,	0x7
	tne	%icc,	0x4
	srax	%i4,	%l2,	%o7
	sll	%g3,	0x17,	%i7
	lduw	[%l7 + 0x24],	%o2
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x16
	membar	#Sync
	tgu	%xcc,	0x3
	fnot1	%f6,	%f10
	fnegd	%f10,	%f22
	sdiv	%o6,	0x1EA3,	%l1
	edge8l	%i5,	%i3,	%o1
	udivcc	%g1,	0x05E5,	%g4
	fmovrde	%l5,	%f8,	%f8
	fmul8x16al	%f3,	%f21,	%f6
	taddcc	%i2,	0x04C0,	%l0
	edge32	%l3,	%l4,	%o0
	and	%o4,	0x0CDF,	%g7
	sdivcc	%i0,	0x1FE9,	%i1
	srl	%g2,	%o3,	%l6
	taddcctv	%g6,	%o5,	%g5
	edge8l	%i6,	%l2,	%o7
	nop
	setx	0xC07E11C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	alignaddrl	%g3,	%i4,	%o2
	te	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i7,	[%l7 + 0x6C]
	brgz	%o6,	loop_2854
	ble,a	%xcc,	loop_2855
	edge32ln	%l1,	%i5,	%o1
	fmovdvs	%xcc,	%f13,	%f19
loop_2854:
	sub	%i3,	%g4,	%g1
loop_2855:
	fbge,a	%fcc0,	loop_2856
	array16	%i2,	%l0,	%l5
	smulcc	%l3,	0x09C6,	%o0
	taddcc	%o4,	0x0674,	%l4
loop_2856:
	tge	%icc,	0x6
	brlz,a	%i0,	loop_2857
	edge16n	%g7,	%i1,	%o3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
loop_2857:
	fpadd16s	%f2,	%f28,	%f4
	ldub	[%l7 + 0x24],	%g6
	brlez	%o5,	loop_2858
	andcc	%g2,	%i6,	%l2
	fmovrde	%o7,	%f22,	%f0
	set	0x70, %g1
	lduwa	[%l7 + %g1] 0x89,	%g5
loop_2858:
	fbule,a	%fcc2,	loop_2859
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g3,	%i4,	%o2
	fbge	%fcc1,	loop_2860
loop_2859:
	tleu	%icc,	0x5
	fmovscc	%icc,	%f5,	%f18
	set	0x5C, %o1
	swapa	[%l7 + %o1] 0x80,	%i7
loop_2860:
	popc	%o6,	%l1
	sub	%o1,	0x1470,	%i5
	smul	%i3,	0x1EC6,	%g4
	fpsub32s	%f4,	%f17,	%f4
	addccc	%i2,	%g1,	%l5
	xorcc	%l0,	%o0,	%o4
	brlez	%l4,	loop_2861
	xnorcc	%i0,	0x1A3C,	%g7
	xor	%l3,	%o3,	%l6
	tne	%icc,	0x1
loop_2861:
	lduw	[%l7 + 0x7C],	%i1
	fbule	%fcc3,	loop_2862
	movrlez	%g6,	0x02B,	%g2
	ldsw	[%l7 + 0x5C],	%i6
	bpos,pt	%xcc,	loop_2863
loop_2862:
	fornot2	%f28,	%f2,	%f26
	bgu,a	loop_2864
	edge16	%o5,	%o7,	%g5
loop_2863:
	movcc	%xcc,	%g3,	%l2
	fbuge	%fcc2,	loop_2865
loop_2864:
	orcc	%o2,	0x00C3,	%i7
	ldsh	[%l7 + 0x3E],	%o6
	movle	%icc,	%i4,	%o1
loop_2865:
	xorcc	%i5,	0x1697,	%i3
	fmovscc	%icc,	%f1,	%f20
	tsubcctv	%l1,	%g4,	%g1
	edge16	%l5,	%l0,	%o0
	nop
	setx	0x55890AB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xF914842D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f13,	%f26
	tne	%icc,	0x3
	tneg	%xcc,	0x3
	umul	%o4,	0x10AB,	%i2
	fbo	%fcc0,	loop_2866
	brz,a	%l4,	loop_2867
	udivx	%g7,	0x16DC,	%l3
	udiv	%i0,	0x0529,	%l6
loop_2866:
	srlx	%o3,	%g6,	%g2
loop_2867:
	nop
	set	0x15, %o2
	ldsba	[%l7 + %o2] 0x04,	%i6
	sllx	%i1,	%o7,	%o5
	move	%xcc,	%g3,	%g5
	tsubcc	%l2,	%o2,	%o6
	bgu,a	%icc,	loop_2868
	sth	%i7,	[%l7 + 0x5C]
	bgu,pn	%xcc,	loop_2869
	ta	%xcc,	0x7
loop_2868:
	prefetch	[%l7 + 0x2C],	 0x2
	tsubcctv	%o1,	0x1715,	%i4
loop_2869:
	bcs	%icc,	loop_2870
	fpadd16s	%f5,	%f9,	%f18
	brz	%i3,	loop_2871
	for	%f10,	%f22,	%f30
loop_2870:
	sub	%i5,	0x0277,	%g4
	movge	%icc,	%g1,	%l5
loop_2871:
	nop
	set	0x58, %l1
	prefetch	[%l7 + %l1],	 0x1
	fsrc2	%f22,	%f4
	fcmple16	%f4,	%f0,	%l1
	nop
	setx	0x3042D39F,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	xor	%l0,	%o0,	%i2
	edge16n	%l4,	%o4,	%l3
	tcs	%xcc,	0x2
	fnegs	%f17,	%f10
	edge8ln	%g7,	%l6,	%i0
	ldsw	[%l7 + 0x44],	%g6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x30] %asi,	%g2
	andncc	%o3,	%i1,	%i6
	tvc	%icc,	0x3
	sir	0x077F
	brnz	%o7,	loop_2872
	fpsub32	%f6,	%f2,	%f4
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f7
	ldsb	[%l7 + 0x51],	%o5
loop_2872:
	fand	%f22,	%f20,	%f28
	fmovdgu	%xcc,	%f28,	%f14
	edge32ln	%g5,	%g3,	%o2
	fmovdn	%icc,	%f17,	%f22
	ba,pt	%xcc,	loop_2873
	tle	%xcc,	0x3
	std	%f24,	[%l7 + 0x58]
	set	0x4E, %i1
	ldsha	[%l7 + %i1] 0x81,	%l2
loop_2873:
	nop
	set	0x38, %l4
	ldxa	[%g0 + %l4] 0x20,	%o6
	sub	%o1,	%i7,	%i4
	fmovdneg	%icc,	%f8,	%f30
	addccc	%i5,	0x1703,	%i3
	fbug	%fcc1,	loop_2874
	nop
	fitos	%f26,	%f7
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x52] %asi,	%g4
loop_2874:
	andcc	%g1,	0x1F47,	%l1
	sth	%l5,	[%l7 + 0x3C]
	nop
	setx	0xB785F43F406C3FE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x2f,	%l0
	fbuge,a	%fcc1,	loop_2875
	fmovrsgez	%i2,	%f28,	%f9
	bge,pt	%xcc,	loop_2876
	tg	%icc,	0x4
loop_2875:
	orcc	%l4,	%o0,	%l3
	fcmpne16	%f14,	%f30,	%g7
loop_2876:
	fnand	%f10,	%f26,	%f14
	nop
	fitod	%f6,	%f28
	fdtoi	%f28,	%f0
	fmovrdgz	%o4,	%f6,	%f2
	wr	%g0,	0x2b,	%asi
	stwa	%l6,	[%l7 + 0x5C] %asi
	membar	#Sync
	movvs	%icc,	%g6,	%i0
	movcc	%icc,	%o3,	%g2
	xorcc	%i1,	0x1AE0,	%o7
	ldd	[%l7 + 0x58],	%o4
	fornot2	%f24,	%f30,	%f28
	ba,a,pt	%xcc,	loop_2877
	fnands	%f6,	%f26,	%f12
	mulscc	%g5,	0x1576,	%g3
	fors	%f14,	%f31,	%f23
loop_2877:
	edge8	%i6,	%l2,	%o6
	addccc	%o1,	0x1CC3,	%i7
	bgu,a,pt	%xcc,	loop_2878
	ldd	[%l7 + 0x20],	%f20
	movre	%o2,	0x318,	%i4
	fmovda	%xcc,	%f19,	%f7
loop_2878:
	fmovsle	%xcc,	%f0,	%f15
	nop
	set	0x20, %l5
	stx	%i3,	[%l7 + %l5]
	array32	%g4,	%i5,	%l1
	tsubcc	%g1,	0x18DC,	%l0
	movge	%icc,	%i2,	%l4
	movle	%xcc,	%l5,	%l3
	addccc	%g7,	%o0,	%l6
	smul	%o4,	0x0F51,	%i0
	movne	%icc,	%g6,	%g2
	movne	%icc,	%i1,	%o3
	sethi	0x0BF0,	%o5
	movpos	%icc,	%o7,	%g5
	fmovdleu	%icc,	%f25,	%f9
	sdivx	%g3,	0x18B5,	%l2
	movcc	%xcc,	%i6,	%o6
	add	%o1,	0x196C,	%i7
	be,a,pn	%icc,	loop_2879
	add	%i4,	%o2,	%g4
	edge32n	%i5,	%l1,	%g1
	set	0x60, %o7
	ldda	[%l7 + %o7] 0xea,	%l0
loop_2879:
	nop
	setx	0xC05B9056,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	edge16ln	%i2,	%l4,	%i3
	tcc	%xcc,	0x1
	tsubcctv	%l3,	0x0B21,	%l5
	nop
	fitod	%f15,	%f6
	fmovsleu	%xcc,	%f29,	%f11
	nop
	setx	0x304594EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	umulcc	%g7,	0x150F,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x79, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l6
	sdivcc	%i0,	0x1D2D,	%g6
	and	%o4,	0x02C2,	%g2
	tvs	%icc,	0x1
	ld	[%l7 + 0x10],	%f29
	edge32n	%i1,	%o5,	%o3
	popc	%o7,	%g5
	addccc	%l2,	0x0639,	%g3
	andncc	%o6,	%i6,	%o1
	fandnot1	%f0,	%f28,	%f20
	set	0x0D, %i5
	lduba	[%l7 + %i5] 0x19,	%i7
	movvc	%icc,	%o2,	%g4
	edge8l	%i5,	%l1,	%g1
	prefetch	[%l7 + 0x14],	 0x2
	prefetch	[%l7 + 0x60],	 0x2
	fpsub32	%f26,	%f30,	%f22
	tneg	%icc,	0x4
	fpadd16s	%f16,	%f8,	%f23
	and	%l0,	%i2,	%i4
	andn	%i3,	0x002C,	%l3
	nop
	setx	0x6102B4F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x53F82831,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f3,	%f11
	nop
	setx	loop_2880,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbule	%fcc1,	loop_2881
	tleu	%xcc,	0x6
	ta	%icc,	0x2
loop_2880:
	ldd	[%l7 + 0x30],	%f24
loop_2881:
	fabsd	%f24,	%f10
	array32	%l4,	%l5,	%o0
	tsubcctv	%g7,	%i0,	%g6
	ldsw	[%l7 + 0x5C],	%l6
	fnor	%f6,	%f10,	%f20
	fbu	%fcc3,	loop_2882
	fmovsvs	%xcc,	%f10,	%f22
	nop
	setx	0x35CB87A549B8DC9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x956C90534B01089A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f22,	%f16
	fandnot1s	%f7,	%f31,	%f29
loop_2882:
	edge8	%g2,	%o4,	%i1
	sth	%o3,	[%l7 + 0x76]
	brgz	%o7,	loop_2883
	array32	%g5,	%o5,	%l2
	movvc	%xcc,	%g3,	%i6
	sth	%o6,	[%l7 + 0x48]
loop_2883:
	fbne	%fcc2,	loop_2884
	tg	%icc,	0x3
	sethi	0x0B8E,	%i7
	tleu	%icc,	0x2
loop_2884:
	edge8l	%o1,	%g4,	%o2
	nop
	setx	0x503B604FFA39E8F3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x380501D76A818590,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f14,	%f26
	tleu	%icc,	0x5
	be,a,pn	%xcc,	loop_2885
	fbu	%fcc1,	loop_2886
	fbule	%fcc1,	loop_2887
	popc	%l1,	%g1
loop_2885:
	mulx	%l0,	%i5,	%i2
loop_2886:
	taddcc	%i3,	0x040A,	%i4
loop_2887:
	add	%l4,	%l5,	%l3
	fone	%f18
	fmul8x16	%f8,	%f18,	%f16
	edge32l	%g7,	%o0,	%i0
	udivcc	%l6,	0x0AE4,	%g2
	set	0x08, %g4
	ldswa	[%l7 + %g4] 0x80,	%g6
	movne	%xcc,	%i1,	%o4
	sdiv	%o3,	0x1210,	%g5
	ba,pt	%icc,	loop_2888
	fmuld8ulx16	%f6,	%f22,	%f24
	fmovrdne	%o5,	%f22,	%f14
	taddcctv	%l2,	0x166C,	%o7
loop_2888:
	sub	%i6,	%g3,	%i7
	xor	%o6,	0x1FC0,	%g4
	andn	%o2,	0x0B24,	%l1
	nop
	setx	0x210416959041E31C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	srlx	%o1,	0x14,	%g1
	fbue	%fcc2,	loop_2889
	edge8ln	%l0,	%i5,	%i3
	fcmpgt32	%f14,	%f8,	%i2
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xe3,	%l4
loop_2889:
	array16	%l5,	%l3,	%i4
	nop
	setx loop_2890, %l0, %l1
	jmpl %l1, %g7
	xnor	%i0,	%l6,	%g2
	movre	%g6,	0x30C,	%i1
	tcs	%icc,	0x0
loop_2890:
	edge8n	%o0,	%o4,	%g5
	ld	[%l7 + 0x40],	%f27
	bvs,a,pn	%icc,	loop_2891
	bvs,pn	%icc,	loop_2892
	edge8	%o3,	%o5,	%l2
	fcmple16	%f18,	%f12,	%o7
loop_2891:
	subccc	%g3,	0x1811,	%i6
loop_2892:
	addc	%i7,	0x09CA,	%g4
	tleu	%xcc,	0x7
	movre	%o6,	%l1,	%o2
	fmovscs	%xcc,	%f19,	%f2
	tvs	%xcc,	0x7
	tcc	%xcc,	0x0
	andn	%g1,	0x0AA3,	%l0
	wr	%g0,	0x89,	%asi
	stha	%i5,	[%l7 + 0x3A] %asi
	fones	%f14
	tsubcc	%o1,	%i3,	%l4
	bshuffle	%f12,	%f6,	%f14
	taddcc	%i2,	%l5,	%i4
	array32	%l3,	%g7,	%l6
	sir	0x0151
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8l	%i0,	%g2,	%g6
	movre	%i1,	0x282,	%o0
	edge8l	%g5,	%o3,	%o4
	tsubcc	%l2,	%o5,	%o7
	addcc	%g3,	0x07AE,	%i7
	edge32	%g4,	%o6,	%i6
	movg	%xcc,	%l1,	%g1
	xnor	%l0,	%i5,	%o2
	add	%o1,	0x12BC,	%i3
	addc	%l4,	0x012A,	%i2
	nop
	set	0x74, %o0
	ldsw	[%l7 + %o0],	%l5
	nop
	fitos	%f4,	%f28
	fstox	%f28,	%f10
	nop
	setx	loop_2893,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movre	%l3,	0x197,	%i4
	fbl,a	%fcc0,	loop_2894
	edge16n	%g7,	%i0,	%g2
loop_2893:
	fble	%fcc3,	loop_2895
	andn	%g6,	0x187E,	%l6
loop_2894:
	fmovrslz	%o0,	%f18,	%f27
	ldsh	[%l7 + 0x5E],	%i1
loop_2895:
	mulx	%o3,	0x11A5,	%o4
	ldstub	[%l7 + 0x74],	%l2
	nop
	fitod	%f2,	%f0
	fdtoi	%f0,	%f4
	swap	[%l7 + 0x4C],	%o5
	mulx	%o7,	0x01A8,	%g3
	sll	%g5,	0x07,	%g4
	fmovrdlez	%o6,	%f26,	%f28
	fbule	%fcc0,	loop_2896
	te	%icc,	0x3
	tgu	%icc,	0x3
	movge	%xcc,	%i6,	%i7
loop_2896:
	mulscc	%g1,	%l1,	%l0
	wr	%g0,	0x80,	%asi
	stba	%i5,	[%l7 + 0x56] %asi
	andn	%o1,	%i3,	%l4
	xnor	%o2,	%l5,	%i2
	nop
	fitod	%f10,	%f20
	fdtoi	%f20,	%f27
	fbe,a	%fcc2,	loop_2897
	edge8n	%i4,	%g7,	%i0
	mulx	%g2,	%g6,	%l6
	fmovsgu	%xcc,	%f19,	%f31
loop_2897:
	sll	%l3,	0x16,	%i1
	sir	0x0EB7
	movne	%icc,	%o3,	%o0
	prefetch	[%l7 + 0x08],	 0x2
	tge	%icc,	0x4
	edge32	%o4,	%o5,	%o7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x24] %asi,	%l2
	addc	%g5,	0x00EE,	%g3
	edge8n	%g4,	%i6,	%o6
	edge8n	%g1,	%l1,	%i7
	movg	%xcc,	%i5,	%l0
	movvc	%icc,	%o1,	%i3
	fmul8sux16	%f0,	%f10,	%f0
	orncc	%o2,	0x1454,	%l4
	mulx	%l5,	0x05E9,	%i2
	bgu,a	%icc,	loop_2898
	fbule,a	%fcc1,	loop_2899
	fxnors	%f16,	%f7,	%f11
	sllx	%g7,	%i0,	%i4
loop_2898:
	fone	%f18
loop_2899:
	bneg,a	loop_2900
	ldsh	[%l7 + 0x58],	%g6
	wr	%g0,	0x0c,	%asi
	stba	%l6,	[%l7 + 0x58] %asi
loop_2900:
	fmovrdlz	%g2,	%f26,	%f2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i1
	edge8n	%o3,	%l3,	%o4
	fbug,a	%fcc1,	loop_2901
	sethi	0x0A7D,	%o5
	fnor	%f2,	%f26,	%f10
	brlz,a	%o7,	loop_2902
loop_2901:
	bvc,pn	%xcc,	loop_2903
	fcmpne16	%f24,	%f30,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2902:
	orncc	%l2,	%g5,	%g4
loop_2903:
	fmul8x16au	%f13,	%f20,	%f30
	alignaddrl	%i6,	%g3,	%g1
	fmovdg	%xcc,	%f24,	%f19
	array32	%l1,	%o6,	%i5
	fmovrse	%l0,	%f24,	%f0
	edge8ln	%i7,	%i3,	%o1
	st	%f2,	[%l7 + 0x78]
	fnot2s	%f0,	%f14
	movl	%icc,	%l4,	%o2
	andn	%i2,	%g7,	%i0
	movneg	%xcc,	%l5,	%i4
	fandnot2	%f24,	%f28,	%f8
	move	%xcc,	%l6,	%g2
	tge	%icc,	0x6
	nop
	setx loop_2904, %l0, %l1
	jmpl %l1, %g6
	fpadd16	%f30,	%f6,	%f4
	movne	%icc,	%i1,	%l3
	tn	%xcc,	0x4
loop_2904:
	sir	0x0F65
	fbne,a	%fcc2,	loop_2905
	sub	%o4,	%o3,	%o5
	tne	%icc,	0x2
	tpos	%xcc,	0x7
loop_2905:
	fornot2s	%f30,	%f3,	%f29
	fbe,a	%fcc1,	loop_2906
	fabsd	%f4,	%f24
	tvc	%xcc,	0x7
	nop
	fitod	%f12,	%f20
	fdtoi	%f20,	%f16
loop_2906:
	movl	%icc,	%o0,	%o7
	fandnot1	%f18,	%f28,	%f26
	tpos	%icc,	0x1
	xnorcc	%g5,	0x14FC,	%g4
	edge16ln	%l2,	%g3,	%g1
	fabsd	%f22,	%f18
	array16	%i6,	%l1,	%i5
	movrlz	%o6,	0x381,	%i7
	ldd	[%l7 + 0x70],	%l0
	stx	%o1,	[%l7 + 0x48]
	swap	[%l7 + 0x28],	%i3
	array16	%o2,	%l4,	%g7
	tle	%icc,	0x6
	fabss	%f18,	%f11
	fbu	%fcc0,	loop_2907
	call	loop_2908
	tcs	%xcc,	0x5
	stb	%i0,	[%l7 + 0x29]
loop_2907:
	ta	%icc,	0x3
loop_2908:
	smul	%i2,	%i4,	%l5
	tg	%xcc,	0x4
	fmul8x16au	%f22,	%f29,	%f6
	taddcc	%g2,	%g6,	%i1
	fmovsle	%xcc,	%f30,	%f30
	fsrc2	%f4,	%f4
	subccc	%l6,	0x0DE5,	%o4
	smulcc	%o3,	0x0308,	%o5
	array16	%l3,	%o0,	%o7
	popc	0x0BD9,	%g5
	andn	%g4,	%g3,	%l2
	movrgez	%i6,	%l1,	%g1
	nop
	setx	0x200F9FDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x907FFDC8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f5,	%f19
	nop
	set	0x60, %o3
	ldsh	[%l7 + %o3],	%i5
	fbe	%fcc1,	loop_2909
	tge	%icc,	0x7
	fmovsge	%xcc,	%f10,	%f24
	edge8	%o6,	%i7,	%l0
loop_2909:
	nop
	setx	0x7BFD6951,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f30
	bneg,a	loop_2910
	taddcctv	%o1,	0x0265,	%o2
	brz	%l4,	loop_2911
	tgu	%icc,	0x4
loop_2910:
	nop
	fitod	%f6,	%f18
	fbge	%fcc0,	loop_2912
loop_2911:
	mova	%icc,	%i3,	%i0
	te	%icc,	0x3
	lduw	[%l7 + 0x68],	%g7
loop_2912:
	movneg	%icc,	%i4,	%l5
	fpadd16s	%f10,	%f30,	%f13
	fpadd16s	%f25,	%f3,	%f23
	edge32l	%i2,	%g2,	%i1
	tle	%icc,	0x5
	move	%xcc,	%g6,	%o4
	movrgz	%l6,	0x20C,	%o5
	fmul8x16	%f24,	%f16,	%f16
	nop
	setx	0xD2C8D32B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f26
	bcc	%icc,	loop_2913
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x3
	andcc	%l3,	0x0108,	%o3
loop_2913:
	popc	0x1EFE,	%o7
	mova	%icc,	%o0,	%g4
	tleu	%icc,	0x5
	movn	%icc,	%g3,	%l2
	fmovdle	%icc,	%f12,	%f9
	movrlez	%i6,	0x060,	%g5
	nop
	fitod	%f6,	%f12
	fdtoi	%f12,	%f21
	edge16n	%g1,	%i5,	%o6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x43] %asi,	%i7
	edge16l	%l0,	%o1,	%o2
	fbn,a	%fcc2,	loop_2914
	movrne	%l4,	0x34C,	%l1
	bvc,a	%icc,	loop_2915
	movrne	%i0,	%i3,	%i4
loop_2914:
	fabsd	%f28,	%f14
	bne,a	loop_2916
loop_2915:
	fmul8x16al	%f4,	%f17,	%f16
	mova	%icc,	%g7,	%l5
	fxors	%f25,	%f0,	%f18
loop_2916:
	fornot1s	%f29,	%f29,	%f14
	srl	%g2,	0x18,	%i1
	tle	%icc,	0x2
	tgu	%icc,	0x3
	edge8	%g6,	%i2,	%o4
	move	%icc,	%o5,	%l3
	add	%o3,	%l6,	%o7
	tge	%xcc,	0x6
	fmovda	%xcc,	%f22,	%f26
	or	%o0,	0x00B6,	%g3
	sra	%g4,	%l2,	%g5
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i6,	%i5
	fpmerge	%f15,	%f17,	%f4
	ldsw	[%l7 + 0x74],	%o6
	addccc	%g1,	0x01DF,	%l0
	tgu	%xcc,	0x3
	tvc	%xcc,	0x0
	fbge,a	%fcc2,	loop_2917
	tge	%xcc,	0x5
	fblg	%fcc3,	loop_2918
	fmul8x16	%f4,	%f10,	%f20
loop_2917:
	fmovscc	%icc,	%f19,	%f13
	tsubcc	%i7,	0x1E2B,	%o1
loop_2918:
	udivx	%o2,	0x1272,	%l1
	tgu	%icc,	0x2
	nop
	setx	0x67A5002A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x07DCB33D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f18,	%f14
	subcc	%l4,	0x1978,	%i3
	smul	%i4,	0x11F2,	%i0
	fnot2	%f14,	%f18
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f26
	fxtod	%f26,	%f30
	movrgez	%l5,	0x1E3,	%g7
	sllx	%g2,	%i1,	%i2
	sdiv	%g6,	0x0909,	%o5
	stx	%l3,	[%l7 + 0x20]
	te	%icc,	0x6
	brlez,a	%o4,	loop_2919
	fnot2	%f6,	%f8
	tsubcc	%o3,	%l6,	%o7
	tg	%icc,	0x5
loop_2919:
	and	%o0,	0x0765,	%g4
	movge	%xcc,	%l2,	%g5
	sra	%i6,	%g3,	%i5
	nop
	setx	0x574AD036F064615A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	wr	%g0,	0x80,	%asi
	stxa	%o6,	[%l7 + 0x10] %asi
	fmul8x16al	%f14,	%f6,	%f8
	fcmpgt32	%f16,	%f16,	%l0
	andcc	%g1,	%o1,	%o2
	or	%i7,	%l1,	%l4
	fmovrde	%i4,	%f24,	%f24
	tvs	%xcc,	0x0
	fmovsvc	%xcc,	%f21,	%f9
	mulx	%i3,	%l5,	%g7
	udivcc	%i0,	0x04A5,	%g2
	add	%i2,	0x05E7,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%o5,	loop_2920
	nop
	fitos	%f0,	%f25
	fstox	%f25,	%f10
	fxtos	%f10,	%f30
	tne	%xcc,	0x5
	ldsw	[%l7 + 0x18],	%l3
loop_2920:
	mulscc	%g6,	0x10A5,	%o3
	edge8	%l6,	%o4,	%o7
	taddcc	%o0,	%g4,	%l2
	set	0x38, %o4
	stha	%g5,	[%l7 + %o4] 0x2f
	membar	#Sync
	fbne	%fcc3,	loop_2921
	fbug,a	%fcc2,	loop_2922
	fmovrslez	%i6,	%f18,	%f0
	srax	%g3,	%i5,	%l0
loop_2921:
	subccc	%g1,	0x04BE,	%o1
loop_2922:
	sdivx	%o2,	0x0B6C,	%o6
	fmovrdlez	%l1,	%f10,	%f24
	mulx	%l4,	%i4,	%i7
	edge32ln	%i3,	%g7,	%i0
	brz,a	%l5,	loop_2923
	fnand	%f30,	%f16,	%f0
	movvs	%xcc,	%i2,	%i1
	udivx	%g2,	0x0A10,	%l3
loop_2923:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x5A] %asi,	%o5
	bvc	loop_2924
	brgz,a	%g6,	loop_2925
	fbge	%fcc1,	loop_2926
	brlz,a	%l6,	loop_2927
loop_2924:
	bl	%xcc,	loop_2928
loop_2925:
	nop
	setx	0xF8FAFC597813EDD4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x2B986029D3307D94,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f22,	%f10
loop_2926:
	ba	%icc,	loop_2929
loop_2927:
	movrne	%o4,	%o3,	%o7
loop_2928:
	tcs	%xcc,	0x6
	and	%g4,	%l2,	%o0
loop_2929:
	fmovsge	%icc,	%f27,	%f17
	edge16	%i6,	%g5,	%g3
	tge	%xcc,	0x7
	fbg	%fcc2,	loop_2930
	movcc	%xcc,	%l0,	%i5
	bcc,a,pt	%icc,	loop_2931
	edge8ln	%o1,	%o2,	%g1
loop_2930:
	fbl	%fcc3,	loop_2932
	movrgez	%l1,	0x13D,	%o6
loop_2931:
	ta	%xcc,	0x0
	subcc	%i4,	0x1CB4,	%i7
loop_2932:
	subcc	%l4,	0x062C,	%g7
	movneg	%xcc,	%i3,	%l5
	or	%i0,	%i2,	%i1
	xnor	%l3,	%o5,	%g6
	subc	%l6,	0x00C5,	%o4
	umul	%g2,	%o3,	%g4
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x16] %asi,	%o7
	edge32l	%l2,	%o0,	%g5
	fbg	%fcc1,	loop_2933
	bpos	loop_2934
	tvc	%xcc,	0x1
	ldx	[%l7 + 0x20],	%i6
loop_2933:
	smul	%l0,	%g3,	%o1
loop_2934:
	bleu,a	loop_2935
	movvc	%xcc,	%i5,	%g1
	andn	%l1,	0x1060,	%o6
	sll	%o2,	0x0E,	%i4
loop_2935:
	mulx	%i7,	%g7,	%l4
	movvs	%icc,	%l5,	%i0
	fors	%f29,	%f24,	%f19
	nop
	setx	0x66439A98A021B1E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6024E6769B1358FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f20,	%f2
	fmovda	%xcc,	%f23,	%f15
	bn,pn	%xcc,	loop_2936
	sdivcc	%i3,	0x1637,	%i1
	movrgz	%l3,	%i2,	%o5
	nop
	setx	0xB392B58FE08A3E90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xE0CFA67C1A4850CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f6,	%f2
loop_2936:
	movvc	%xcc,	%l6,	%o4
	tleu	%icc,	0x3
	fmovsvc	%xcc,	%f22,	%f17
	fnot2	%f14,	%f14
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x58] %asi,	%g6
	orcc	%o3,	0x0D03,	%g2
	movge	%xcc,	%o7,	%l2
	fandnot2	%f16,	%f2,	%f6
	prefetch	[%l7 + 0x2C],	 0x0
	bge	loop_2937
	srax	%o0,	%g5,	%g4
	tsubcctv	%i6,	%l0,	%g3
	taddcc	%o1,	%g1,	%l1
loop_2937:
	sdiv	%i5,	0x1C48,	%o6
	fone	%f16
	st	%f25,	[%l7 + 0x30]
	fmovsleu	%icc,	%f8,	%f21
	sll	%o2,	0x12,	%i4
	tne	%xcc,	0x1
	edge32l	%g7,	%i7,	%l5
	fmovsgu	%icc,	%f15,	%f18
	ldub	[%l7 + 0x5C],	%l4
	edge16	%i3,	%i0,	%l3
	udivcc	%i1,	0x1461,	%o5
	or	%l6,	%o4,	%i2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g6,	%o3
	alignaddrl	%g2,	%o7,	%l2
	fble	%fcc3,	loop_2938
	tge	%icc,	0x2
	tsubcctv	%g5,	0x0411,	%g4
	bcc,a,pt	%icc,	loop_2939
loop_2938:
	andn	%o0,	%l0,	%g3
	tg	%xcc,	0x7
	movn	%xcc,	%i6,	%o1
loop_2939:
	tl	%icc,	0x0
	fsrc2	%f2,	%f12
	ta	%icc,	0x4
	tcs	%icc,	0x6
	fmovrdgez	%l1,	%f14,	%f2
	nop
	fitod	%f10,	%f20
	fdtox	%f20,	%f8
	movn	%icc,	%g1,	%o6
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x08] %asi,	%i5
	flush	%l7 + 0x0C
	sdiv	%i4,	0x1B0A,	%g7
	set	0x54, %o5
	lda	[%l7 + %o5] 0x18,	%f14
	movle	%icc,	%i7,	%l5
	movgu	%xcc,	%o2,	%i3
	fbo	%fcc0,	loop_2940
	nop
	setx	loop_2941,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldstub	[%l7 + 0x50],	%l4
	tne	%icc,	0x7
loop_2940:
	stb	%i0,	[%l7 + 0x27]
loop_2941:
	nop
	fitos	%f7,	%f27
	fstox	%f27,	%f0
	movrgez	%i1,	%l3,	%l6
	fmovrsne	%o4,	%f15,	%f13
	std	%f26,	[%l7 + 0x18]
	prefetch	[%l7 + 0x74],	 0x2
	tne	%xcc,	0x3
	fmovrse	%i2,	%f22,	%f28
	edge8l	%o5,	%o3,	%g2
	nop
	fitos	%f3,	%f28
	andn	%g6,	%l2,	%g5
	stx	%g4,	[%l7 + 0x18]
	sethi	0x1869,	%o7
	membar	0x50
	orn	%l0,	0x1818,	%o0
	faligndata	%f30,	%f18,	%f8
	bg,pt	%xcc,	loop_2942
	ldx	[%l7 + 0x48],	%i6
	flush	%l7 + 0x30
	nop
	setx	0x1760BCF65A3B21CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x4FF65208E2E7E381,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f30,	%f24
loop_2942:
	fmovsl	%xcc,	%f2,	%f11
	set	0x66, %l3
	ldsha	[%l7 + %l3] 0x89,	%o1
	edge16ln	%g3,	%g1,	%o6
	sdiv	%l1,	0x0DA6,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i5,	%g7
	fbul	%fcc1,	loop_2943
	fmovsvc	%icc,	%f14,	%f7
	umul	%i7,	%l5,	%i3
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x1
loop_2943:
	bvs,a,pn	%xcc,	loop_2944
	sdivcc	%l4,	0x10C0,	%i1
	tsubcc	%i0,	0x11F9,	%l3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%l6
loop_2944:
	fnands	%f8,	%f14,	%f29
	tle	%icc,	0x3
	taddcc	%o4,	%o5,	%o3
	lduw	[%l7 + 0x6C],	%i2
	fblg	%fcc2,	loop_2945
	fmovrdgez	%g2,	%f2,	%f0
	nop
	set	0x28, %l2
	ldd	[%l7 + %l2],	%f26
	sethi	0x1A13,	%l2
loop_2945:
	fand	%f0,	%f22,	%f18
	stbar
	movne	%icc,	%g6,	%g5
	ta	%icc,	0x3
	fmovscs	%xcc,	%f27,	%f7
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0x2
	orncc	%l0,	%o7,	%o0
	edge32ln	%i6,	%g3,	%o1
	movge	%xcc,	%o6,	%g1
	edge32n	%i4,	%l1,	%g7
	fmovdge	%xcc,	%f18,	%f9
	addccc	%i7,	%i5,	%l5
	popc	0x1A5D,	%o2
	brlez	%l4,	loop_2946
	fabsd	%f22,	%f18
	set	0x7C, %g2
	stha	%i3,	[%l7 + %g2] 0xe2
	membar	#Sync
loop_2946:
	tsubcc	%i1,	%i0,	%l6
	array16	%l3,	%o5,	%o4
	subccc	%o3,	%i2,	%l2
	movne	%icc,	%g6,	%g5
	movneg	%icc,	%g4,	%g2
	fandnot1s	%f1,	%f18,	%f1
	bvc,pn	%icc,	loop_2947
	stw	%o7,	[%l7 + 0x20]
	set	0x70, %g7
	lduha	[%l7 + %g7] 0x81,	%l0
loop_2947:
	movle	%icc,	%o0,	%i6
	sdiv	%g3,	0x0711,	%o1
	edge8l	%o6,	%i4,	%g1
	fmovrdlz	%l1,	%f10,	%f24
	udivx	%g7,	0x1E36,	%i7
	fcmpne32	%f2,	%f14,	%l5
	movcs	%icc,	%o2,	%i5
	movge	%icc,	%i3,	%i1
	std	%f0,	[%l7 + 0x50]
	xorcc	%l4,	0x1C5C,	%l6
	tcs	%icc,	0x3
	movvc	%xcc,	%i0,	%o5
	edge16	%l3,	%o3,	%i2
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x20] %asi,	%l2
	srlx	%o4,	0x0A,	%g6
	array16	%g4,	%g2,	%g5
	andncc	%o7,	%l0,	%i6
	fmovrdlz	%g3,	%f16,	%f14
	addcc	%o1,	0x0CA9,	%o0
	xorcc	%i4,	%g1,	%o6
	edge8	%g7,	%i7,	%l5
	addcc	%l1,	%o2,	%i3
	edge32ln	%i5,	%i1,	%l4
	wr	%g0,	0x52,	%asi
	stxa	%l6,	[%g0 + 0x208] %asi
	umul	%i0,	0x1066,	%o5
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge16	%o3,	%i2,	%l3
	edge16l	%l2,	%g6,	%g4
	tsubcctv	%g2,	0x039E,	%g5
	subccc	%o4,	%o7,	%i6
	movrlez	%l0,	0x38B,	%g3
	sra	%o0,	%o1,	%i4
	tcc	%icc,	0x3
	movl	%xcc,	%o6,	%g1
	edge8ln	%g7,	%l5,	%i7
	popc	%l1,	%i3
	xnorcc	%o2,	%i5,	%l4
	wr	%g0,	0x89,	%asi
	sta	%f6,	[%l7 + 0x0C] %asi
	set	0x25, %g6
	stba	%i1,	[%l7 + %g6] 0x2a
	membar	#Sync
	sdivx	%i0,	0x0410,	%o5
	tsubcc	%l6,	0x1698,	%i2
	tpos	%xcc,	0x1
	fmovsneg	%xcc,	%f17,	%f9
	for	%f0,	%f24,	%f14
	udivx	%l3,	0x0905,	%l2
	tg	%xcc,	0x1
	tle	%xcc,	0x0
	andn	%g6,	0x1A44,	%o3
	sllx	%g2,	%g5,	%o4
	orn	%o7,	0x1C33,	%g4
	fmovdleu	%xcc,	%f22,	%f25
	movrlez	%i6,	%g3,	%o0
	edge16n	%l0,	%i4,	%o6
	udivcc	%o1,	0x1A5F,	%g1
	fbo	%fcc2,	loop_2948
	fblg	%fcc1,	loop_2949
	tl	%xcc,	0x2
	tge	%icc,	0x5
loop_2948:
	ldsw	[%l7 + 0x08],	%g7
loop_2949:
	call	loop_2950
	addcc	%l5,	%l1,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o2,	%i5,	%i3
loop_2950:
	udiv	%l4,	0x14F0,	%i1
	bvc,pt	%icc,	loop_2951
	movne	%icc,	%o5,	%l6
	tpos	%xcc,	0x3
	fandnot1	%f14,	%f2,	%f18
loop_2951:
	tn	%icc,	0x3
	tne	%xcc,	0x5
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x04,	 0x0
	sdiv	%i0,	0x1BED,	%l2
	edge8l	%l3,	%o3,	%g2
	fnors	%f2,	%f29,	%f31
	mulx	%g6,	%g5,	%o4
	fpack16	%f28,	%f7
	array32	%o7,	%i6,	%g4
	sra	%g3,	%l0,	%i4
	addc	%o0,	%o1,	%g1
	fand	%f30,	%f0,	%f24
	movn	%icc,	%g7,	%o6
	brlz,a	%l1,	loop_2952
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f4,	%f30,	%i7
	fexpand	%f0,	%f20
loop_2952:
	alignaddrl	%l5,	%o2,	%i5
	xorcc	%i3,	%l4,	%o5
	fsrc2s	%f28,	%f27
	subcc	%l6,	%i1,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,a,pn	%xcc,	loop_2953
	edge32l	%i2,	%l2,	%l3
	alignaddrl	%g2,	%o3,	%g6
	movneg	%icc,	%g5,	%o7
loop_2953:
	fbo	%fcc1,	loop_2954
	sdivx	%i6,	0x1EBE,	%o4
	edge32ln	%g4,	%g3,	%i4
	umulcc	%o0,	0x1397,	%o1
loop_2954:
	fmovdle	%icc,	%f14,	%f10
	xorcc	%g1,	%l0,	%o6
	stb	%g7,	[%l7 + 0x57]
	movrne	%i7,	0x2D4,	%l1
	orncc	%l5,	0x0B84,	%i5
	move	%xcc,	%o2,	%i3
	sub	%o5,	0x15FE,	%l4
	fxor	%f24,	%f10,	%f20
	stb	%i1,	[%l7 + 0x6B]
	subcc	%l6,	0x15E0,	%i0
	fzeros	%f4
	movrlz	%l2,	%l3,	%g2
	movpos	%xcc,	%i2,	%o3
	fmovrde	%g6,	%f10,	%f0
	edge8	%o7,	%i6,	%g5
	tl	%icc,	0x2
	set	0x6B, %l0
	stba	%o4,	[%l7 + %l0] 0x2a
	membar	#Sync
	bn,a,pn	%xcc,	loop_2955
	tsubcctv	%g3,	%i4,	%o0
	fmovdvs	%icc,	%f1,	%f9
	flush	%l7 + 0x28
loop_2955:
	array32	%o1,	%g1,	%g4
	tsubcctv	%o6,	0x1F2E,	%l0
	stw	%i7,	[%l7 + 0x24]
	movvs	%xcc,	%g7,	%l5
	andcc	%l1,	0x1697,	%o2
	fsrc2	%f28,	%f20
	orn	%i3,	0x0C68,	%o5
	xnorcc	%l4,	%i5,	%l6
	andcc	%i1,	%i0,	%l2
	movrne	%l3,	%i2,	%o3
	tl	%xcc,	0x5
	addc	%g6,	0x0517,	%g2
	fsrc2s	%f6,	%f30
	taddcctv	%o7,	0x02FC,	%g5
	stbar
	movn	%icc,	%o4,	%g3
	smulcc	%i6,	0x1FA0,	%i4
	nop
	setx	loop_2956,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x1FC8D93980647AD0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	ldd	[%l7 + 0x18],	%f30
	bleu,pt	%icc,	loop_2957
loop_2956:
	fmovsn	%xcc,	%f16,	%f25
	edge32n	%o1,	%o0,	%g1
	set	0x12, %o6
	stha	%g4,	[%l7 + %o6] 0xe2
	membar	#Sync
loop_2957:
	and	%o6,	%l0,	%i7
	tsubcc	%l5,	%g7,	%l1
	fbug	%fcc1,	loop_2958
	movrlz	%o2,	%o5,	%i3
	edge32n	%l4,	%l6,	%i1
	brnz	%i5,	loop_2959
loop_2958:
	xor	%i0,	%l3,	%l2
	sdivcc	%o3,	0x1EAE,	%i2
	swap	[%l7 + 0x14],	%g6
loop_2959:
	nop
	fitod	%f6,	%f20
	fdtox	%f20,	%f6
	tpos	%icc,	0x5
	addccc	%g2,	0x1965,	%g5
	fxors	%f13,	%f16,	%f22
	movg	%icc,	%o7,	%g3
	andncc	%i6,	%i4,	%o1
	sir	0x07FD
	edge8n	%o0,	%g1,	%g4
	fandnot1s	%f1,	%f3,	%f27
	movrgez	%o6,	%o4,	%l0
	fabss	%f12,	%f3
	set	0x11, %i6
	lduba	[%l7 + %i6] 0x81,	%i7
	andncc	%l5,	%l1,	%o2
	fandnot1	%f10,	%f16,	%f6
	andn	%g7,	%o5,	%i3
	edge8l	%l4,	%i1,	%i5
	andncc	%i0,	%l3,	%l2
	ldsw	[%l7 + 0x10],	%l6
	popc	0x1041,	%i2
	fmovsn	%xcc,	%f8,	%f25
	array8	%g6,	%o3,	%g5
	smulcc	%g2,	0x0C11,	%g3
	umul	%o7,	%i6,	%i4
	edge8ln	%o1,	%g1,	%o0
	nop
	setx	loop_2960,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%o6,	0x1EA7,	%g4
	xor	%o4,	%l0,	%i7
	fmovsleu	%icc,	%f19,	%f16
loop_2960:
	brnz	%l1,	loop_2961
	fcmple32	%f10,	%f12,	%o2
	bn	loop_2962
	bneg,a,pn	%icc,	loop_2963
loop_2961:
	movcc	%icc,	%l5,	%o5
	andncc	%g7,	%l4,	%i1
loop_2962:
	sra	%i5,	%i3,	%i0
loop_2963:
	ble,pn	%xcc,	loop_2964
	fexpand	%f4,	%f22
	fbo	%fcc0,	loop_2965
	bne	loop_2966
loop_2964:
	edge8ln	%l3,	%l6,	%l2
	add	%i2,	0x0DE3,	%g6
loop_2965:
	andncc	%g5,	%o3,	%g3
loop_2966:
	and	%o7,	0x1A9A,	%g2
	addc	%i6,	0x17AC,	%i4
	tpos	%xcc,	0x4
	fornot2	%f18,	%f22,	%f12
	addc	%o1,	%o0,	%o6
	tle	%icc,	0x1
	addccc	%g1,	%o4,	%g4
	movrgez	%l0,	0x3BA,	%i7
	andcc	%l1,	%l5,	%o2
	srl	%o5,	0x01,	%l4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x59] %asi,	%i1
	fmovsvs	%xcc,	%f7,	%f7
	bshuffle	%f22,	%f18,	%f16
	addcc	%i5,	0x10C4,	%i3
	fmovscs	%xcc,	%f31,	%f20
	fpsub32	%f30,	%f30,	%f30
	xnorcc	%i0,	%g7,	%l3
	fpsub32	%f24,	%f2,	%f4
	set	0x1E, %i7
	stha	%l6,	[%l7 + %i7] 0xeb
	membar	#Sync
	fmovsn	%icc,	%f27,	%f4
	nop
	fitos	%f7,	%f12
	fstod	%f12,	%f2
	edge16ln	%i2,	%g6,	%g5
	fble	%fcc0,	loop_2967
	nop
	set	0x70, %g3
	stb	%o3,	[%l7 + %g3]
	set	0x6C, %l6
	ldswa	[%l7 + %l6] 0x11,	%l2
loop_2967:
	add	%o7,	%g2,	%i6
	bg,a	loop_2968
	fbuge,a	%fcc0,	loop_2969
	bcs	%xcc,	loop_2970
	fbge	%fcc0,	loop_2971
loop_2968:
	fmuld8ulx16	%f12,	%f28,	%f16
loop_2969:
	tleu	%icc,	0x2
loop_2970:
	orcc	%g3,	0x0EA9,	%o1
loop_2971:
	stw	%o0,	[%l7 + 0x4C]
	movvc	%xcc,	%i4,	%g1
	taddcctv	%o4,	%o6,	%g4
	bneg,a,pn	%icc,	loop_2972
	edge16l	%l0,	%l1,	%i7
	fpmerge	%f22,	%f14,	%f26
	fba,a	%fcc2,	loop_2973
loop_2972:
	subc	%o2,	0x03AC,	%o5
	movgu	%icc,	%l5,	%i1
	fpmerge	%f5,	%f10,	%f6
loop_2973:
	sdivx	%i5,	0x1B61,	%i3
	nop
	setx	loop_2974,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc1	%f10,	%f24
	bcc,a	%xcc,	loop_2975
	fmovsgu	%icc,	%f16,	%f15
loop_2974:
	te	%xcc,	0x4
	sdivcc	%l4,	0x0DFB,	%i0
loop_2975:
	fbue,a	%fcc0,	loop_2976
	fcmple16	%f28,	%f30,	%g7
	stbar
	nop
	setx	0x32774B3E41B421B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f0
loop_2976:
	xor	%l6,	0x11C0,	%l3
	fnot2	%f28,	%f30
	membar	0x4A
	movre	%i2,	%g5,	%o3
	fbu	%fcc3,	loop_2977
	fbug	%fcc0,	loop_2978
	addccc	%l2,	%g6,	%o7
	edge8	%i6,	%g2,	%g3
loop_2977:
	movvc	%xcc,	%o1,	%i4
loop_2978:
	fcmpeq16	%f26,	%f28,	%o0
	bcs,a,pt	%icc,	loop_2979
	nop
	setx	0xBB6E589B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x4EEB0FBE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f1,	%f18
	fbo,a	%fcc2,	loop_2980
	nop
	set	0x74, %g1
	ldsw	[%l7 + %g1],	%o4
loop_2979:
	stw	%g1,	[%l7 + 0x08]
	nop
	setx	0xA0623C952150813C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x9B6EB45ACAB68B7C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f14,	%f4
loop_2980:
	tcs	%icc,	0x0
	for	%f28,	%f16,	%f28
	std	%f8,	[%l7 + 0x10]
	edge32n	%o6,	%l0,	%g4
	fmovrslez	%i7,	%f9,	%f15
	andncc	%l1,	%o2,	%l5
	tcs	%icc,	0x1
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x66] %asi,	%o5
	fbge,a	%fcc1,	loop_2981
	movre	%i5,	0x292,	%i3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
loop_2981:
	tne	%xcc,	0x2
	tpos	%icc,	0x7
	movneg	%xcc,	%i0,	%i1
	fbg	%fcc2,	loop_2982
	array32	%l6,	%g7,	%i2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l3,	%o3
loop_2982:
	prefetch	[%l7 + 0x74],	 0x3
	orncc	%l2,	0x092C,	%g6
	fnor	%f8,	%f30,	%f16
	movre	%g5,	0x260,	%o7
	ldd	[%l7 + 0x28],	%f2
	array8	%g2,	%i6,	%o1
	movrne	%g3,	0x0E6,	%i4
	alignaddr	%o0,	%o4,	%g1
	fbule	%fcc2,	loop_2983
	nop
	setx	0x0920A6E7A054B153,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fble,a	%fcc3,	loop_2984
	array32	%l0,	%o6,	%g4
loop_2983:
	fmovd	%f0,	%f10
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%l1
loop_2984:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x44] %asi,	%l5
	mulscc	%o5,	0x091C,	%i5
	nop
	setx	loop_2985,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x10, %o1
	ldsw	[%l7 + %o1],	%i3
	srlx	%l4,	0x12,	%o2
	tcc	%icc,	0x3
loop_2985:
	nop
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x1C] %asi,	%f0
	set	0x08, %l1
	ldxa	[%l7 + %l1] 0x89,	%i0
	fandnot1	%f8,	%f14,	%f2
	fmul8x16	%f27,	%f8,	%f26
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f6
	movrgez	%i1,	0x156,	%g7
	orcc	%i2,	%l6,	%o3
	stbar
	membar	0x59
	brz	%l3,	loop_2986
	movgu	%icc,	%g6,	%l2
	fmovdle	%xcc,	%f28,	%f19
	wr	%g0,	0x89,	%asi
	sta	%f21,	[%l7 + 0x2C] %asi
loop_2986:
	sll	%o7,	%g2,	%i6
	movvs	%icc,	%o1,	%g5
	and	%g3,	%i4,	%o0
	fbu,a	%fcc3,	loop_2987
	fbne	%fcc0,	loop_2988
	fmovsneg	%icc,	%f11,	%f5
	fmovrdlz	%g1,	%f2,	%f14
loop_2987:
	pdist	%f30,	%f16,	%f4
loop_2988:
	tn	%icc,	0x0
	smul	%o4,	%l0,	%g4
	movneg	%icc,	%o6,	%i7
	movvs	%icc,	%l1,	%l5
	popc	%i5,	%i3
	addccc	%o5,	%o2,	%l4
	edge16ln	%i1,	%i0,	%i2
	subcc	%l6,	%g7,	%l3
	bl	loop_2989
	fmovsge	%icc,	%f26,	%f10
	mulx	%o3,	0x19FA,	%g6
	array32	%o7,	%l2,	%i6
loop_2989:
	movvs	%icc,	%g2,	%g5
	fornot1s	%f29,	%f28,	%f30
	udivcc	%g3,	0x045E,	%i4
	tvc	%icc,	0x5
	movleu	%icc,	%o0,	%g1
	udivcc	%o1,	0x11BD,	%o4
	udivcc	%g4,	0x16DD,	%o6
	fmovspos	%icc,	%f15,	%f19
	ba,pn	%xcc,	loop_2990
	fmovda	%icc,	%f12,	%f21
	mova	%icc,	%l0,	%l1
	alignaddr	%l5,	%i5,	%i3
loop_2990:
	movne	%icc,	%i7,	%o5
	nop
	setx	0x8C64534E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x9E921FDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f29,	%f12
	fcmple16	%f28,	%f30,	%l4
	udiv	%o2,	0x17AE,	%i1
	movcc	%icc,	%i0,	%i2
	ble,a,pn	%xcc,	loop_2991
	movrgez	%g7,	%l3,	%o3
	fbge,a	%fcc2,	loop_2992
	edge32ln	%g6,	%l6,	%l2
loop_2991:
	sdivcc	%i6,	0x0664,	%o7
	fnand	%f0,	%f12,	%f20
loop_2992:
	array8	%g5,	%g2,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g3,	0x188B,	%o0
	fbu	%fcc3,	loop_2993
	fmovsneg	%xcc,	%f24,	%f22
	edge32ln	%o1,	%o4,	%g4
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
loop_2993:
	nop
	set	0x70, %o2
	swapa	[%l7 + %o2] 0x11,	%o6
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x4B] %asi,	%l1
	fxnors	%f29,	%f25,	%f22
	fcmpgt32	%f0,	%f12,	%l0
	tge	%xcc,	0x5
	fmovsneg	%icc,	%f3,	%f4
	brnz	%i5,	loop_2994
	lduw	[%l7 + 0x44],	%i3
	smul	%i7,	0x107E,	%l5
	movrlez	%l4,	0x312,	%o2
loop_2994:
	array8	%o5,	%i1,	%i2
	movcs	%icc,	%i0,	%l3
	tvs	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a	%xcc,	loop_2995
	fbe	%fcc3,	loop_2996
	tpos	%xcc,	0x1
	sra	%g7,	%o3,	%l6
loop_2995:
	taddcc	%l2,	%i6,	%o7
loop_2996:
	fmovdvs	%xcc,	%f1,	%f16
	brlz	%g6,	loop_2997
	sethi	0x0913,	%g2
	fmovrsgez	%i4,	%f19,	%f30
	move	%xcc,	%g5,	%g3
loop_2997:
	tge	%icc,	0x5
	movcs	%xcc,	%o1,	%o4
	smul	%g4,	0x0C5A,	%o0
	fcmple16	%f22,	%f30,	%o6
	andn	%l1,	%g1,	%i5
	andncc	%i3,	%l0,	%l5
	bvc,a	%xcc,	loop_2998
	edge32n	%i7,	%l4,	%o5
	edge8n	%i1,	%i2,	%o2
	sdivx	%i0,	0x0869,	%l3
loop_2998:
	be,a,pn	%xcc,	loop_2999
	umul	%o3,	0x1956,	%l6
	tvs	%xcc,	0x4
	fnegd	%f2,	%f4
loop_2999:
	edge32l	%l2,	%i6,	%o7
	edge16	%g6,	%g7,	%g2
	tcs	%icc,	0x4
	fmuld8ulx16	%f12,	%f1,	%f12
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g5
	fbug,a	%fcc0,	loop_3000
	sllx	%i4,	0x16,	%o1
	nop
	fitod	%f6,	%f0
	fdtos	%f0,	%f1
	fbge,a	%fcc0,	loop_3001
loop_3000:
	tleu	%icc,	0x6
	fble,a	%fcc3,	loop_3002
	srlx	%g3,	0x06,	%g4
loop_3001:
	sir	0x1E08
	mulscc	%o4,	%o6,	%o0
loop_3002:
	movne	%icc,	%g1,	%l1
	tvs	%icc,	0x0
	tne	%icc,	0x3
	add	%i3,	%l0,	%i5
	orn	%i7,	%l5,	%l4
	tgu	%xcc,	0x1
	bcs,pt	%icc,	loop_3003
	addccc	%i1,	0x045B,	%i2
	edge32n	%o2,	%i0,	%o5
	srlx	%l3,	0x17,	%o3
loop_3003:
	edge32ln	%l2,	%i6,	%l6
	sra	%o7,	0x1B,	%g7
	fmovdne	%xcc,	%f10,	%f14
	taddcc	%g2,	0x0604,	%g6
	fba,a	%fcc1,	loop_3004
	fbo	%fcc2,	loop_3005
	smul	%i4,	%o1,	%g5
	mulx	%g4,	0x1861,	%o4
loop_3004:
	subccc	%o6,	0x10FC,	%o0
loop_3005:
	subccc	%g3,	0x0B66,	%g1
	edge8ln	%i3,	%l1,	%i5
	fcmpeq16	%f24,	%f6,	%l0
	std	%f14,	[%l7 + 0x70]
	fmovspos	%icc,	%f0,	%f28
	nop
	setx	0x62018C916049C358,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l5,	%i7
	movl	%xcc,	%i1,	%l4
	bleu	%xcc,	loop_3006
	fcmpeq16	%f16,	%f10,	%i2
	andn	%i0,	0x0B35,	%o2
	fpsub32	%f0,	%f18,	%f2
loop_3006:
	fmovsge	%icc,	%f6,	%f6
	fmovsn	%icc,	%f24,	%f21
	edge16ln	%l3,	%o5,	%o3
	nop
	fitod	%f4,	%f12
	fdtoi	%f12,	%f0
	andncc	%l2,	%i6,	%o7
	movcc	%icc,	%g7,	%g2
	brlez	%g6,	loop_3007
	membar	0x7C
	movrgez	%l6,	0x05B,	%i4
	fbo	%fcc1,	loop_3008
loop_3007:
	fbl,a	%fcc1,	loop_3009
	fnot2s	%f21,	%f18
	bcs,a	loop_3010
loop_3008:
	sdivcc	%o1,	0x05A1,	%g5
loop_3009:
	alignaddrl	%g4,	%o4,	%o6
	edge16	%g3,	%o0,	%g1
loop_3010:
	fmovrdne	%i3,	%f12,	%f10
	brgez	%l1,	loop_3011
	sllx	%l0,	%i5,	%i7
	addcc	%l5,	0x10F1,	%l4
	edge16n	%i1,	%i2,	%i0
loop_3011:
	nop
	set	0x50, %l4
	ldda	[%l7 + %l4] 0x11,	%l2
	fand	%f30,	%f8,	%f24
	fmul8x16au	%f29,	%f26,	%f8
	fnot1	%f18,	%f12
	fpmerge	%f5,	%f0,	%f12
	xnorcc	%o5,	%o2,	%o3
	bcc,pn	%icc,	loop_3012
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i6,	0x1E72,	%o7
	stb	%g7,	[%l7 + 0x56]
loop_3012:
	bcs,a,pn	%icc,	loop_3013
	sll	%l2,	0x04,	%g2
	edge8l	%g6,	%l6,	%i4
	flush	%l7 + 0x3C
loop_3013:
	fornot1s	%f23,	%f29,	%f15
	sra	%g5,	%g4,	%o4
	movrne	%o1,	%g3,	%o0
	fmovscc	%icc,	%f0,	%f13
	umul	%o6,	%i3,	%g1
	subcc	%l1,	0x0865,	%i5
	ba,a	%icc,	loop_3014
	ta	%xcc,	0x7
	srlx	%l0,	%l5,	%i7
	fmovsg	%xcc,	%f11,	%f29
loop_3014:
	tvs	%icc,	0x3
	fmovda	%icc,	%f21,	%f22
	udiv	%i1,	0x1ECA,	%i2
	sir	0x1F02
	fpsub32s	%f17,	%f23,	%f4
	nop
	setx	0xC3E4D6623045147D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	movre	%l4,	%l3,	%o5
	taddcctv	%o2,	%i0,	%i6
	tcs	%icc,	0x3
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%o6
	fbul	%fcc1,	loop_3015
	be,a,pt	%xcc,	loop_3016
	srl	%g7,	%o3,	%g2
	udivcc	%g6,	0x087D,	%l2
loop_3015:
	sdiv	%i4,	0x1F77,	%g5
loop_3016:
	brz	%l6,	loop_3017
	fnot2	%f16,	%f2
	edge8	%o4,	%g4,	%o1
	nop
	setx	0x9EF464258F963113,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x025EAC25339F7BCF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f2,	%f10
loop_3017:
	movleu	%icc,	%o0,	%g3
	movge	%icc,	%i3,	%g1
	udivx	%o6,	0x1647,	%i5
	bpos,a,pt	%icc,	loop_3018
	edge8n	%l0,	%l5,	%i7
	stx	%i1,	[%l7 + 0x20]
	fnor	%f20,	%f14,	%f18
loop_3018:
	andncc	%i2,	%l4,	%l3
	edge16	%o5,	%o2,	%l1
	set	0x34, %i1
	lduba	[%l7 + %i1] 0x10,	%i0
	addcc	%o7,	%i6,	%o3
	bvs,a	%icc,	loop_3019
	movcs	%icc,	%g2,	%g7
	ta	%icc,	0x5
	ldub	[%l7 + 0x27],	%l2
loop_3019:
	fmovsge	%icc,	%f3,	%f1
	movle	%xcc,	%g6,	%i4
	fpadd32	%f4,	%f30,	%f6
	orncc	%g5,	%o4,	%l6
	andncc	%g4,	%o0,	%o1
	movre	%i3,	0x0DD,	%g3
	xnor	%o6,	0x1E51,	%i5
	addc	%g1,	%l5,	%i7
	fandnot1	%f18,	%f14,	%f8
	fbe,a	%fcc1,	loop_3020
	xnorcc	%l0,	0x089B,	%i1
	tne	%xcc,	0x7
	movle	%icc,	%l4,	%l3
loop_3020:
	mova	%icc,	%i2,	%o2
	addcc	%o5,	0x0E50,	%l1
	edge32	%o7,	%i6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x18],	%o3
	edge8	%g7,	%g2,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f12,	%f13
	umulcc	%i4,	%g5,	%o4
	edge8ln	%l6,	%g4,	%g6
	sra	%o0,	%i3,	%g3
	fornot2s	%f14,	%f4,	%f3
	nop
	setx	loop_3021,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbo,a	%fcc1,	loop_3022
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o6,	%o1,	%i5
loop_3021:
	tleu	%xcc,	0x4
loop_3022:
	ld	[%l7 + 0x44],	%f3
	brgz	%g1,	loop_3023
	tle	%icc,	0x3
	orcc	%i7,	%l5,	%l0
	tne	%xcc,	0x0
loop_3023:
	udiv	%l4,	0x1EAA,	%l3
	fmovrdlz	%i1,	%f26,	%f14
	brgez	%i2,	loop_3024
	udivcc	%o5,	0x1B5D,	%o2
	smul	%l1,	%i6,	%i0
	brnz	%o3,	loop_3025
loop_3024:
	fbl,a	%fcc1,	loop_3026
	std	%f16,	[%l7 + 0x78]
	ldd	[%l7 + 0x50],	%g6
loop_3025:
	fmovs	%f9,	%f1
loop_3026:
	fbu	%fcc3,	loop_3027
	alignaddrl	%g2,	%o7,	%i4
	or	%l2,	%g5,	%o4
	nop
	setx loop_3028, %l0, %l1
	jmpl %l1, %l6
loop_3027:
	mova	%xcc,	%g6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o0,	%g3
loop_3028:
	array16	%o6,	%o1,	%i3
	add	%i5,	0x05A6,	%i7
	edge16l	%g1,	%l5,	%l0
	fnot1s	%f10,	%f11
	sra	%l3,	0x0A,	%i1
	bcc	loop_3029
	andncc	%i2,	%l4,	%o2
	ldub	[%l7 + 0x0E],	%o5
	orncc	%l1,	%i6,	%o3
loop_3029:
	orcc	%i0,	%g2,	%g7
	fpmerge	%f24,	%f3,	%f8
	bg	%icc,	loop_3030
	brlez,a	%i4,	loop_3031
	or	%o7,	%l2,	%o4
	movcs	%icc,	%l6,	%g6
loop_3030:
	sdiv	%g5,	0x113E,	%g4
loop_3031:
	nop
	set	0x0A, %l5
	lduba	[%l7 + %l5] 0x19,	%o0
	umul	%o6,	0x1AAE,	%o1
	umulcc	%i3,	0x050F,	%g3
	be,a	%icc,	loop_3032
	fandnot1s	%f11,	%f8,	%f12
	tsubcctv	%i7,	0x0449,	%i5
	movrgez	%l5,	%g1,	%l3
loop_3032:
	subcc	%i1,	0x168D,	%i2
	stb	%l4,	[%l7 + 0x09]
	fmovdvs	%xcc,	%f10,	%f23
	tle	%icc,	0x5
	andn	%o2,	0x1B41,	%l0
	fbule,a	%fcc2,	loop_3033
	tgu	%icc,	0x5
	srlx	%o5,	%i6,	%o3
	ldx	[%l7 + 0x78],	%l1
loop_3033:
	array32	%i0,	%g2,	%i4
	edge16	%g7,	%l2,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x2
	orn	%o7,	%g6,	%g5
	ta	%xcc,	0x3
	fmovda	%icc,	%f22,	%f26
	tpos	%icc,	0x0
	bpos	loop_3034
	bvs	loop_3035
	mulscc	%g4,	0x1303,	%l6
	tn	%icc,	0x5
loop_3034:
	fbge	%fcc0,	loop_3036
loop_3035:
	swap	[%l7 + 0x64],	%o6
	nop
	fitos	%f19,	%f28
	tge	%xcc,	0x3
loop_3036:
	array32	%o0,	%o1,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x6
	movge	%xcc,	%i7,	%i5
	edge16n	%l5,	%i3,	%l3
	tvc	%icc,	0x1
	ble,pn	%icc,	loop_3037
	xnorcc	%i1,	%g1,	%l4
	sll	%i2,	%o2,	%l0
	fbl,a	%fcc2,	loop_3038
loop_3037:
	udivcc	%o5,	0x1CBB,	%i6
	swap	[%l7 + 0x5C],	%l1
	edge32l	%o3,	%g2,	%i4
loop_3038:
	stw	%g7,	[%l7 + 0x24]
	fmovdleu	%icc,	%f13,	%f25
	tne	%xcc,	0x6
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f14
	fxtod	%f14,	%f30
	tneg	%icc,	0x4
	ldd	[%l7 + 0x18],	%i0
	subccc	%l2,	%o4,	%o7
	movl	%xcc,	%g6,	%g4
	subc	%g5,	%o6,	%o0
	fmovsa	%xcc,	%f25,	%f18
	be,a	%icc,	loop_3039
	tcs	%icc,	0x0
	bne,pn	%xcc,	loop_3040
	brnz	%l6,	loop_3041
loop_3039:
	xorcc	%o1,	%i7,	%i5
	nop
	fitod	%f10,	%f2
	fdtoi	%f2,	%f21
loop_3040:
	fmul8x16al	%f23,	%f17,	%f20
loop_3041:
	nop
	setx	0xA18BFC36,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x61EC2435,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f19,	%f28
	sllx	%g3,	0x1F,	%i3
	tgu	%xcc,	0x4
	tle	%icc,	0x7
	tge	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	stha	%l5,	[%l7 + 0x34] %asi
	umulcc	%l3,	%g1,	%i1
	xnor	%i2,	%o2,	%l4
	addccc	%l0,	0x0F3D,	%o5
	fmovse	%xcc,	%f10,	%f7
	subccc	%l1,	0x18D7,	%i6
	sllx	%o3,	%i4,	%g7
	mulx	%g2,	0x14C9,	%l2
	membar	0x61
	fmul8x16au	%f14,	%f18,	%f0
	add	%i0,	0x09BD,	%o7
	xor	%o4,	0x0450,	%g6
	fmovdn	%icc,	%f22,	%f18
	fpmerge	%f26,	%f14,	%f24
	fmovdn	%xcc,	%f15,	%f3
	bgu,pt	%xcc,	loop_3042
	call	loop_3043
	nop
	setx	0x5298F10B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x87EF404F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f29,	%f19
	taddcc	%g4,	%o6,	%g5
loop_3042:
	fnot1s	%f13,	%f27
loop_3043:
	edge16n	%l6,	%o1,	%i7
	fsrc1s	%f11,	%f4
	tvc	%xcc,	0x1
	edge8ln	%o0,	%i5,	%g3
	fble	%fcc3,	loop_3044
	movrne	%l5,	0x072,	%l3
	bshuffle	%f24,	%f4,	%f10
	bcc,pn	%xcc,	loop_3045
loop_3044:
	smulcc	%g1,	%i3,	%i2
	sub	%o2,	%l4,	%i1
	bvc	loop_3046
loop_3045:
	sir	0x05D3
	tne	%icc,	0x5
	tn	%xcc,	0x5
loop_3046:
	sllx	%o5,	%l0,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f22
	ldd	[%l7 + 0x68],	%f4
	ldd	[%l7 + 0x38],	%o2
	fmovrdgez	%i6,	%f0,	%f30
	fmovsgu	%xcc,	%f30,	%f25
	fmovsneg	%icc,	%f22,	%f20
	xorcc	%g7,	0x1FD1,	%i4
	nop
	setx	0x6E4C2666,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f3
	popc	0x1803,	%g2
	xnorcc	%l2,	%i0,	%o4
	fcmpgt32	%f14,	%f16,	%o7
	sth	%g6,	[%l7 + 0x42]
	fbue	%fcc3,	loop_3047
	fmovrslez	%o6,	%f10,	%f14
	alignaddr	%g4,	%g5,	%l6
	set	0x54, %i0
	lda	[%l7 + %i0] 0x11,	%f26
loop_3047:
	fnegs	%f24,	%f30
	fbne,a	%fcc1,	loop_3048
	fbul,a	%fcc0,	loop_3049
	udivx	%o1,	0x1076,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3048:
	fsrc2s	%f26,	%f18
loop_3049:
	fmovsneg	%icc,	%f8,	%f16
	fnegs	%f18,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i5,	%g3
	movvc	%icc,	%l5,	%l3
	udivx	%i7,	0x0620,	%i3
	tvs	%xcc,	0x3
	array8	%g1,	%o2,	%l4
	bl	loop_3050
	fmul8sux16	%f28,	%f0,	%f6
	fmovrslz	%i2,	%f2,	%f1
	movne	%icc,	%i1,	%o5
loop_3050:
	popc	%l0,	%o3
	brz,a	%l1,	loop_3051
	fmovsle	%icc,	%f16,	%f28
	edge16	%g7,	%i4,	%i6
	edge16ln	%l2,	%g2,	%o4
loop_3051:
	array32	%i0,	%o7,	%g6
	alignaddr	%g4,	%g5,	%l6
	brz,a	%o1,	loop_3052
	movg	%xcc,	%o0,	%o6
	alignaddrl	%g3,	%l5,	%i5
	fnot2	%f14,	%f8
loop_3052:
	subccc	%i7,	%i3,	%g1
	movvc	%icc,	%o2,	%l3
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%i2
	movneg	%xcc,	%l4,	%o5
	movvc	%xcc,	%l0,	%o3
	fbl	%fcc2,	loop_3053
	fsrc2s	%f8,	%f13
	tpos	%icc,	0x4
	fba,a	%fcc3,	loop_3054
loop_3053:
	andn	%i1,	%g7,	%l1
	xorcc	%i4,	%l2,	%i6
	sdivx	%g2,	0x0966,	%o4
loop_3054:
	bcs,a	loop_3055
	fmul8ulx16	%f4,	%f26,	%f16
	nop
	setx	0xDD914E1C713ED138,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x2CB387D0F96BDF49,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f2,	%f24
	xor	%i0,	0x18A7,	%g6
loop_3055:
	nop
	setx	0x028EB7695CDB54B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f0
	fbge,a	%fcc2,	loop_3056
	fornot2	%f26,	%f10,	%f28
	ta	%icc,	0x1
	sdivcc	%g4,	0x178D,	%o7
loop_3056:
	subcc	%g5,	%l6,	%o0
	edge32n	%o1,	%o6,	%g3
	ldd	[%l7 + 0x10],	%f0
	fbe,a	%fcc1,	loop_3057
	fmovsg	%xcc,	%f20,	%f21
	alignaddrl	%i5,	%i7,	%i3
	movrgez	%g1,	0x234,	%o2
loop_3057:
	membar	0x41
	movcc	%xcc,	%l3,	%l5
	st	%f24,	[%l7 + 0x64]
	set	0x50, %o7
	lda	[%l7 + %o7] 0x18,	%f14
	xorcc	%l4,	0x03DF,	%i2
	taddcctv	%l0,	%o5,	%o3
	srax	%i1,	0x19,	%l1
	set	0x1C, %i2
	stha	%i4,	[%l7 + %i2] 0xeb
	membar	#Sync
	mulscc	%g7,	0x1AD3,	%i6
	fmovscs	%xcc,	%f10,	%f16
	set	0x63, %i5
	lduba	[%l7 + %i5] 0x15,	%g2
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f22
	fxtod	%f22,	%f2
	edge16l	%l2,	%o4,	%g6
	movcs	%xcc,	%g4,	%o7
	fmovsleu	%icc,	%f20,	%f14
	movvs	%icc,	%i0,	%l6
	taddcc	%o0,	%o1,	%g5
	stbar
	move	%icc,	%o6,	%i5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%i3
	nop
	setx loop_3058, %l0, %l1
	jmpl %l1, %g3
	smulcc	%g1,	%l3,	%o2
	fble	%fcc3,	loop_3059
	fbge,a	%fcc1,	loop_3060
loop_3058:
	srlx	%l5,	%l4,	%i2
	fabss	%f14,	%f6
loop_3059:
	ble	%xcc,	loop_3061
loop_3060:
	fsrc1s	%f12,	%f24
	nop
	setx	loop_3062,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fabss	%f7,	%f1
loop_3061:
	andcc	%o5,	0x129E,	%o3
	brz	%l0,	loop_3063
loop_3062:
	fornot2s	%f4,	%f20,	%f25
	bge	loop_3064
	movg	%icc,	%l1,	%i4
loop_3063:
	fmovdvc	%xcc,	%f3,	%f30
	movleu	%icc,	%i1,	%g7
loop_3064:
	stw	%g2,	[%l7 + 0x28]
	subc	%l2,	0x1815,	%o4
	fnot2s	%f17,	%f20
	fmovdleu	%xcc,	%f29,	%f16
	ldsw	[%l7 + 0x5C],	%i6
	fbne	%fcc2,	loop_3065
	movcs	%xcc,	%g4,	%g6
	orcc	%i0,	%o7,	%l6
	nop
	fitos	%f13,	%f21
	fstox	%f21,	%f6
	fxtos	%f6,	%f1
loop_3065:
	edge8l	%o1,	%g5,	%o6
	edge8n	%i5,	%o0,	%i3
	set	0x22, %i3
	lduba	[%l7 + %i3] 0x14,	%g3
	tg	%icc,	0x2
	movle	%icc,	%i7,	%l3
	orcc	%o2,	%l5,	%l4
	bleu,pt	%xcc,	loop_3066
	subc	%g1,	0x0646,	%o5
	movl	%xcc,	%i2,	%l0
	sll	%l1,	%i4,	%o3
loop_3066:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x60] %asi,	%g7
	edge32	%g2,	%i1,	%l2
	fbul	%fcc1,	loop_3067
	xorcc	%i6,	%g4,	%o4
	addc	%g6,	%o7,	%l6
	movrlez	%o1,	%g5,	%i0
loop_3067:
	fsrc2s	%f23,	%f6
	edge16l	%i5,	%o0,	%i3
	orcc	%o6,	%g3,	%i7
	movrgez	%o2,	%l5,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l4,	0x1B03,	%o5
	popc	0x142D,	%g1
	movrlez	%l0,	%l1,	%i4
	tn	%xcc,	0x7
	add	%o3,	%g7,	%i2
	tleu	%icc,	0x2
	movle	%xcc,	%i1,	%l2
	fmovrdgez	%g2,	%f6,	%f8
	movrgez	%g4,	0x356,	%o4
	tgu	%xcc,	0x6
	tsubcctv	%g6,	0x1941,	%o7
	sethi	0x0EB8,	%i6
	ld	[%l7 + 0x40],	%f24
	sdivx	%l6,	0x017A,	%g5
	srax	%i0,	%i5,	%o0
	edge8n	%i3,	%o6,	%o1
	fmovdge	%icc,	%f11,	%f22
	ble,pn	%icc,	loop_3068
	sub	%g3,	%i7,	%o2
	nop
	setx loop_3069, %l0, %l1
	jmpl %l1, %l3
	bne,pn	%icc,	loop_3070
loop_3068:
	bcc,a,pn	%xcc,	loop_3071
	sllx	%l4,	0x03,	%l5
loop_3069:
	fbule	%fcc0,	loop_3072
loop_3070:
	tn	%icc,	0x3
loop_3071:
	fmovrsgez	%o5,	%f19,	%f29
	fmovrse	%l0,	%f9,	%f24
loop_3072:
	orn	%l1,	%g1,	%o3
	fnors	%f17,	%f19,	%f3
	set	0x14, %o0
	stba	%g7,	[%l7 + %o0] 0x2b
	membar	#Sync
	tleu	%xcc,	0x2
	movre	%i4,	%i2,	%l2
	movne	%icc,	%g2,	%i1
	be,pt	%xcc,	loop_3073
	fcmple32	%f8,	%f18,	%o4
	subc	%g6,	%g4,	%o7
	brgez	%i6,	loop_3074
loop_3073:
	tleu	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g5,	0x0F56,	%i0
loop_3074:
	fmul8x16au	%f7,	%f2,	%f10
	sdivx	%l6,	0x101C,	%i5
	brgz,a	%o0,	loop_3075
	sir	0x0C49
	edge32	%i3,	%o1,	%g3
	array16	%i7,	%o2,	%o6
loop_3075:
	brgz	%l3,	loop_3076
	fones	%f9
	movg	%xcc,	%l4,	%l5
	edge8	%o5,	%l1,	%g1
loop_3076:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7C] %asi,	%o3
	addcc	%l0,	0x1741,	%i4
	tcs	%icc,	0x7
	movrlez	%i2,	0x11E,	%g7
	tvs	%xcc,	0x2
	ldsb	[%l7 + 0x20],	%g2
	nop
	fitos	%f11,	%f4
	fstod	%f4,	%f30
	tvc	%xcc,	0x0
	ta	%xcc,	0x2
	movpos	%icc,	%i1,	%o4
	fmovscc	%xcc,	%f27,	%f17
	edge32n	%g6,	%l2,	%g4
	sethi	0x096C,	%i6
	tneg	%xcc,	0x7
	fmovdvs	%icc,	%f28,	%f8
	tleu	%icc,	0x3
	srax	%o7,	%g5,	%i0
	udivcc	%l6,	0x07DF,	%o0
	move	%xcc,	%i5,	%o1
	fnot2	%f14,	%f4
	movge	%icc,	%g3,	%i7
	udivcc	%o2,	0x0E3C,	%o6
	add	%i3,	0x1C09,	%l3
	edge16ln	%l5,	%o5,	%l1
	orncc	%g1,	%l4,	%l0
	tneg	%icc,	0x0
	edge32ln	%i4,	%i2,	%o3
	edge8	%g2,	%i1,	%g7
	popc	%g6,	%l2
	fmovrdlz	%o4,	%f18,	%f28
	fpadd16	%f24,	%f28,	%f6
	tgu	%xcc,	0x5
	fcmpgt16	%f4,	%f14,	%g4
	tpos	%icc,	0x1
	smulcc	%i6,	0x0BA5,	%g5
	subc	%o7,	0x0A31,	%l6
	taddcctv	%i0,	0x02E3,	%i5
	nop
	setx	0xC062D73B,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	movleu	%xcc,	%o0,	%g3
	subcc	%o1,	%i7,	%o6
	tleu	%xcc,	0x0
	srl	%i3,	0x00,	%l3
	fmovscc	%xcc,	%f14,	%f19
	fmul8x16au	%f12,	%f25,	%f22
	fmovsg	%xcc,	%f14,	%f5
	tg	%xcc,	0x0
	udivx	%o2,	0x097B,	%l5
	fmovdcs	%xcc,	%f12,	%f15
	fand	%f8,	%f24,	%f28
	fone	%f6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x78] %asi,	%o5
	movl	%icc,	%g1,	%l1
	nop
	setx	0x77DCAF13872B5370,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x004CF85C904F8B81,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f16,	%f14
	fmovdpos	%xcc,	%f17,	%f28
	taddcctv	%l0,	%l4,	%i2
	fsrc2	%f16,	%f12
	xnorcc	%o3,	%i4,	%g2
	or	%i1,	%g6,	%l2
	tvs	%icc,	0x0
	subc	%g7,	%g4,	%i6
	fandnot1s	%f3,	%f5,	%f14
	fmovrsgez	%g5,	%f12,	%f24
	edge32	%o4,	%l6,	%i0
	movge	%icc,	%i5,	%o7
	smul	%g3,	0x08FE,	%o1
	fmovse	%xcc,	%f13,	%f1
	edge16n	%i7,	%o0,	%o6
	flush	%l7 + 0x58
	tn	%icc,	0x1
	movleu	%icc,	%l3,	%o2
	brz	%i3,	loop_3077
	smul	%o5,	0x1BCB,	%g1
	xorcc	%l1,	0x0942,	%l5
	mulx	%l4,	0x0D6C,	%i2
loop_3077:
	andncc	%l0,	%o3,	%g2
	movrne	%i4,	0x3D6,	%g6
	fands	%f25,	%f10,	%f4
	membar	0x0A
	orncc	%i1,	%l2,	%g7
	tg	%xcc,	0x0
	movvs	%xcc,	%g4,	%i6
	movrgz	%o4,	%g5,	%i0
	movpos	%xcc,	%l6,	%i5
	fsrc2	%f24,	%f4
	movrgez	%o7,	%g3,	%i7
	sra	%o1,	0x19,	%o6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2788
!	Type cti   	: 3077
!	Type x   	: 1212
!	Type f   	: 4557
!	Type i   	: 13366
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x04DE6A5B
.word 0x43907B15
.word 0x58DCFBD1
.word 0xC7CF0448
.word 0xE1B9F10A
.word 0xD1DEA7E8
.word 0x324A79AB
.word 0x6D3EB568
.word 0xEAFCD4CD
.word 0x14018441
.word 0x490D1C81
.word 0x13E66683
.word 0xE4DC3B76
.word 0x5C42D68A
.word 0xAF5668E5
.word 0x84726357
.word 0xA450AE3D
.word 0x66C6956E
.word 0x708E369D
.word 0x89E1BD32
.word 0xA29C7B3E
.word 0xA21D5E1B
.word 0x0D965A3F
.word 0xA736CDB1
.word 0xFBABB5AB
.word 0x4DC59A39
.word 0x9A1D6E9A
.word 0x00DB9834
.word 0x7B454350
.word 0x62C56F0D
.word 0x02C6EE73
.word 0x64972FD8
.word 0xE55A102E
.word 0xB2A69AAF
.word 0x1DC00206
.word 0x8B79D3BB
.word 0x30094D2D
.word 0x0068571B
.word 0x8ECC5AE3
.word 0xA9137C04
.word 0x36EAD639
.word 0x992E9EEE
.word 0x648552B0
.word 0x44E1135E
.word 0x651495C2
.word 0xF854EF35
.word 0x8DA378A8
.word 0x4CE982A4
.word 0xA9957126
.word 0xAFCD38D6
.word 0xB9B09C5F
.word 0x8C647567
.word 0x9860440A
.word 0x53263ACB
.word 0x07D21E5F
.word 0xE606B36B
.word 0x12EE55A5
.word 0xBD274253
.word 0xA8765D74
.word 0x38ECF507
.word 0x06A9FFE4
.word 0x3D9355E1
.word 0xA0DA1443
.word 0xF7C1046B
.end
