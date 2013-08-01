/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f13.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f13.s,v 1.1 2007/05/11 17:22:26 drp Exp $"
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
	setx	0xDC45D78BF04A0AA5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x6,	%g1
	set	0x5,	%g2
	set	0x1,	%g3
	set	0x1,	%g4
	set	0xC,	%g5
	set	0x3,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0xC,	%i1
	set	-0x3,	%i2
	set	-0x8,	%i3
	set	-0xF,	%i4
	set	-0x2,	%i5
	set	-0xD,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x58E2F63F,	%l0
	set	0x17F0A216,	%l1
	set	0x761E82DD,	%l2
	set	0x7217C583,	%l3
	set	0x60AD90FD,	%l4
	set	0x3C79DA57,	%l5
	set	0x006273CA,	%l6
	!# Output registers
	set	-0x1010,	%o0
	set	-0x0351,	%o1
	set	0x17F9,	%o2
	set	0x1FFB,	%o3
	set	0x1F1A,	%o4
	set	0x1A12,	%o5
	set	-0x0CD2,	%o6
	set	-0x1864,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xE3CFC28DC47C7088)
	INIT_TH_FP_REG(%l7,%f2,0x7F6A53E1A6A11DDC)
	INIT_TH_FP_REG(%l7,%f4,0x6D819C0E88E9188A)
	INIT_TH_FP_REG(%l7,%f6,0x634A2B5D68269E89)
	INIT_TH_FP_REG(%l7,%f8,0x45E2ABD2635CC49F)
	INIT_TH_FP_REG(%l7,%f10,0x56167ED8DEE9D932)
	INIT_TH_FP_REG(%l7,%f12,0xE4C858039861C673)
	INIT_TH_FP_REG(%l7,%f14,0x860BDE1C8E5F6CEC)
	INIT_TH_FP_REG(%l7,%f16,0xF95F13254CB80C76)
	INIT_TH_FP_REG(%l7,%f18,0x3D53820123FEB696)
	INIT_TH_FP_REG(%l7,%f20,0xAFA6BC7F09809BFB)
	INIT_TH_FP_REG(%l7,%f22,0x83B13DDA22B54496)
	INIT_TH_FP_REG(%l7,%f24,0x104D801EF4D737C6)
	INIT_TH_FP_REG(%l7,%f26,0xFA6831BC1D6C51D8)
	INIT_TH_FP_REG(%l7,%f28,0x2362580BC9FFE396)
	INIT_TH_FP_REG(%l7,%f30,0xE9199B38C0BB2EEA)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x4AB, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	edge16l	%g2,	%i1,	%i7
	set	0x18, %l0
	ldxa	[%g0 + %l0] 0x20,	%l5
	subccc	%i2,	0x0854,	%l3
	umulcc	%l0,	%g3,	%l6
	ldd	[%l7 + 0x78],	%o2
	brgz	%o7,	loop_1
	fcmple32	%f8,	%f4,	%i4
	tleu	%icc,	0x0
	movl	%icc,	%l4,	%i0
loop_1:
	ldsw	[%l7 + 0x7C],	%o3
	bcs	%xcc,	loop_2
	membar	0x74
	move	%icc,	%g5,	%o5
	andn	%g4,	0x0DAA,	%o6
loop_2:
	stbar
	fexpand	%f16,	%f0
	fandnot2	%f20,	%f10,	%f2
	wr	%g0,	0x0c,	%asi
	stwa	%o0,	[%l7 + 0x48] %asi
	ta	%xcc,	0x1
	edge16n	%g6,	%i6,	%o4
	tl	%xcc,	0x6
	movge	%icc,	%i3,	%g7
	fbge	%fcc0,	loop_3
	edge8	%l1,	%l2,	%i5
	nop
	setx	0xEA79CBAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xB2C5D7F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f30,	%f7
	tcc	%icc,	0x3
loop_3:
	te	%icc,	0x1
	addccc	%g1,	%g2,	%i1
	membar	0x20
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x60] %asi,	%o1
	fones	%f10
	movre	%l5,	0x14B,	%i2
	orn	%l3,	0x065C,	%i7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%l6
	ble	%icc,	loop_4
	fandnot1s	%f22,	%f0,	%f25
	edge32ln	%g3,	%o7,	%i4
	fmovrdgz	%o2,	%f30,	%f26
loop_4:
	tcc	%xcc,	0x2
	nop
	setx	0x8BAF12CA53676B16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f10
	tsubcctv	%l4,	%o3,	%i0
	edge8l	%g5,	%g4,	%o5
	movneg	%icc,	%o6,	%g6
	brgez,a	%o0,	loop_5
	ta	%icc,	0x4
	fbue	%fcc1,	loop_6
	sdiv	%o4,	0x0763,	%i3
loop_5:
	movrgez	%i6,	0x0BC,	%g7
	umulcc	%l1,	%i5,	%l2
loop_6:
	sethi	0x19FE,	%g1
	edge8	%i1,	%o1,	%l5
	fnot1	%f26,	%f10
	fbule,a	%fcc0,	loop_7
	addccc	%i2,	0x012E,	%l3
	fbg,a	%fcc0,	loop_8
	tsubcc	%i7,	0x06CB,	%l0
loop_7:
	move	%xcc,	%g2,	%g3
	bvs	%xcc,	loop_9
loop_8:
	edge16l	%o7,	%i4,	%o2
	fcmpgt16	%f0,	%f0,	%l4
	srax	%o3,	%i0,	%g5
loop_9:
	fxnor	%f2,	%f2,	%f30
	orn	%g4,	0x159F,	%l6
	movgu	%icc,	%o6,	%o5
	movcc	%icc,	%o0,	%g6
	nop
	setx	0x3B4A156F50C93A8E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f10
	brz,a	%i3,	loop_10
	movl	%xcc,	%i6,	%o4
	fpadd16s	%f23,	%f16,	%f19
	tcc	%icc,	0x1
loop_10:
	fbug,a	%fcc0,	loop_11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_12,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%l1,	%g7,	%l2
loop_11:
	tle	%icc,	0x1
	movleu	%icc,	%i5,	%i1
loop_12:
	xor	%o1,	0x0885,	%g1
	be	loop_13
	srl	%i2,	%l3,	%l5
	or	%i7,	0x0A07,	%g2
	nop
	fitos	%f7,	%f21
	fstod	%f21,	%f8
loop_13:
	edge32n	%l0,	%g3,	%o7
	set	0x78, %g7
	lda	[%l7 + %g7] 0x80,	%f7
	srax	%i4,	0x0F,	%l4
	fnot1s	%f23,	%f3
	movpos	%icc,	%o3,	%i0
	sdivcc	%o2,	0x1D3E,	%g4
	movleu	%icc,	%l6,	%o6
	xorcc	%g5,	0x16DD,	%o0
	ldub	[%l7 + 0x3C],	%g6
	brz,a	%i3,	loop_14
	taddcc	%i6,	%o5,	%o4
	tsubcc	%l1,	0x0160,	%g7
	xnorcc	%l2,	0x05BE,	%i5
loop_14:
	movrlez	%o1,	%g1,	%i1
	movcc	%icc,	%i2,	%l5
	nop
	setx	loop_15,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcs	%xcc,	0x5
	xorcc	%l3,	0x0618,	%g2
	fmovsvc	%icc,	%f29,	%f22
loop_15:
	brlez,a	%l0,	loop_16
	movne	%icc,	%i7,	%o7
	bshuffle	%f6,	%f28,	%f18
	bn,pn	%xcc,	loop_17
loop_16:
	andcc	%g3,	0x13EB,	%i4
	fpadd32s	%f9,	%f11,	%f2
	nop
	setx loop_18, %l0, %l1
	jmpl %l1, %o3
loop_17:
	te	%icc,	0x3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%i0
loop_18:
	nop
	setx	0x00A60434905CBAE1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fones	%f14
	andn	%o2,	%l6,	%g4
	orncc	%g5,	0x103A,	%o6
	movrgz	%g6,	0x03D,	%o0
	movrne	%i3,	%o5,	%o4
	tvc	%icc,	0x0
	popc	0x1477,	%l1
	faligndata	%f26,	%f28,	%f14
	fmovsg	%xcc,	%f16,	%f25
	sub	%g7,	0x09AB,	%i6
	bn,pt	%xcc,	loop_19
	fbug	%fcc1,	loop_20
	tge	%icc,	0x1
	tgu	%xcc,	0x0
loop_19:
	taddcc	%l2,	%i5,	%o1
loop_20:
	or	%g1,	0x1813,	%i1
	fmovsg	%icc,	%f14,	%f5
	fnor	%f6,	%f16,	%f0
	fcmpeq16	%f12,	%f28,	%i2
	stx	%l5,	[%l7 + 0x18]
	xor	%l3,	%g2,	%i7
	fnot1	%f28,	%f24
	movpos	%xcc,	%o7,	%l0
	movle	%xcc,	%g3,	%o3
	srax	%l4,	0x0C,	%i0
	tvc	%icc,	0x2
	mova	%xcc,	%i4,	%o2
	for	%f26,	%f2,	%f16
	nop
	setx	0xCC64261C6BA1C2D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f0
	tgu	%icc,	0x6
	orn	%l6,	%g5,	%g4
	nop
	setx	loop_21,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%o6,	0x099C,	%g6
	nop
	fitod	%f8,	%f0
	fdtos	%f0,	%f20
	move	%xcc,	%o0,	%o5
loop_21:
	ble,a	loop_22
	fsrc2	%f18,	%f26
	fbug	%fcc1,	loop_23
	movrgz	%o4,	0x38E,	%l1
loop_22:
	alignaddr	%g7,	%i3,	%i6
	mova	%icc,	%l2,	%o1
loop_23:
	movvs	%xcc,	%i5,	%g1
	addc	%i1,	0x15B3,	%l5
	ldsw	[%l7 + 0x3C],	%i2
	fbu	%fcc2,	loop_24
	edge32ln	%l3,	%g2,	%i7
	sth	%o7,	[%l7 + 0x28]
	sdiv	%l0,	0x0B0A,	%g3
loop_24:
	te	%icc,	0x2
	fmovde	%icc,	%f6,	%f22
	tpos	%xcc,	0x3
	fmul8sux16	%f24,	%f14,	%f30
	edge32ln	%l4,	%o3,	%i4
	prefetch	[%l7 + 0x5C],	 0x0
	move	%xcc,	%o2,	%l6
	subccc	%i0,	%g5,	%g4
	bpos,a	%xcc,	loop_25
	movl	%xcc,	%g6,	%o6
	edge32l	%o0,	%o4,	%l1
	tcs	%xcc,	0x6
loop_25:
	edge32l	%o5,	%g7,	%i6
	array16	%i3,	%o1,	%l2
	st	%f3,	[%l7 + 0x44]
	edge32	%g1,	%i5,	%l5
	movre	%i2,	%i1,	%g2
	tgu	%xcc,	0x0
	fblg	%fcc1,	loop_26
	array8	%i7,	%o7,	%l3
	nop
	setx	0xC127985E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x84379A7F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f25,	%f25
	fmovrdlz	%g3,	%f18,	%f16
loop_26:
	tcs	%icc,	0x1
	edge8n	%l0,	%l4,	%o3
	popc	%i4,	%o2
	movl	%xcc,	%l6,	%i0
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldstub	[%l7 + 0x5E],	%g4
	wr	%g0,	0x27,	%asi
	stha	%g5,	[%l7 + 0x56] %asi
	membar	#Sync
	bn,a,pn	%xcc,	loop_27
	movcs	%xcc,	%o6,	%g6
	fmovrslz	%o4,	%f19,	%f29
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x1
loop_27:
	tle	%xcc,	0x7
	membar	0x56
	tl	%icc,	0x3
	movrlz	%o5,	0x1F4,	%g7
	andcc	%l1,	0x07B9,	%i3
	nop
	setx	0xA0CE096B7515A58F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xB036BF1817740408,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f2,	%f28
	ld	[%l7 + 0x30],	%f15
	st	%f25,	[%l7 + 0x70]
	tleu	%icc,	0x0
	xnor	%i6,	%l2,	%o1
	set	0x10, %g2
	ldxa	[%g0 + %g2] 0x20,	%g1
	orncc	%l5,	0x16F6,	%i2
	taddcctv	%i5,	%g2,	%i1
	sllx	%i7,	%o7,	%g3
	taddcc	%l0,	0x0270,	%l3
	tvs	%xcc,	0x0
	ldub	[%l7 + 0x72],	%l4
	tleu	%xcc,	0x5
	array8	%i4,	%o2,	%l6
	addcc	%i0,	0x0010,	%o3
	xnorcc	%g5,	%g4,	%o6
	pdist	%f6,	%f26,	%f24
	andncc	%o4,	%g6,	%o0
	fba	%fcc3,	loop_28
	fcmpne16	%f18,	%f22,	%o5
	sdiv	%l1,	0x1323,	%g7
	movrne	%i3,	%l2,	%i6
loop_28:
	nop
	wr	%g0,	0x57,	%asi
	stxa	%o1,	[%g0 + 0x0] %asi
	andncc	%l5,	%g1,	%i5
	smulcc	%g2,	0x033F,	%i1
	st	%f5,	[%l7 + 0x4C]
	movvs	%xcc,	%i2,	%i7
	edge16n	%g3,	%o7,	%l0
	sllx	%l3,	0x08,	%l4
	orcc	%i4,	%l6,	%i0
	movgu	%xcc,	%o3,	%o2
	wr	%g0,	0x52,	%asi
	stxa	%g5,	[%g0 + 0x118] %asi
	umul	%g4,	%o4,	%o6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x54] %asi,	%o0
	fandnot2s	%f13,	%f22,	%f11
	fmovdpos	%xcc,	%f30,	%f22
	fmovdleu	%icc,	%f23,	%f25
	edge16	%o5,	%l1,	%g7
	orncc	%i3,	%g6,	%l2
	addc	%o1,	0x1967,	%l5
	nop
	setx	0x8157676744F34A9F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6AF821B779470351,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f20,	%f30
	ldd	[%l7 + 0x28],	%f2
	sll	%g1,	%i6,	%g2
	edge16ln	%i1,	%i5,	%i2
	sub	%i7,	%g3,	%o7
	movre	%l0,	%l3,	%l4
	ldsb	[%l7 + 0x5E],	%l6
	fmul8x16au	%f25,	%f27,	%f10
	tg	%icc,	0x0
	brz	%i4,	loop_29
	tne	%xcc,	0x7
	fpackfix	%f8,	%f10
	movl	%xcc,	%o3,	%o2
loop_29:
	popc	0x1781,	%g5
	st	%f1,	[%l7 + 0x14]
	movre	%g4,	%i0,	%o6
	edge32l	%o4,	%o5,	%l1
	fand	%f30,	%f6,	%f18
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%o0
	fmovsn	%xcc,	%f7,	%f9
	fmovs	%f0,	%f18
	addccc	%i3,	0x08F6,	%g7
	edge32n	%g6,	%o1,	%l2
	smulcc	%l5,	0x077C,	%g1
	tg	%icc,	0x2
	alignaddrl	%g2,	%i6,	%i5
	smulcc	%i2,	0x0285,	%i7
	sdiv	%g3,	0x1C3D,	%o7
	movneg	%xcc,	%l0,	%l3
	or	%i1,	0x17C9,	%l4
	fmovd	%f16,	%f0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x54] %asi,	%l6
	umul	%i4,	%o3,	%g5
	fmovsgu	%xcc,	%f4,	%f6
	fmuld8ulx16	%f16,	%f12,	%f4
	movvs	%xcc,	%o2,	%i0
	fblg	%fcc2,	loop_30
	bg,pn	%icc,	loop_31
	stx	%o6,	[%l7 + 0x50]
	nop
	setx	0x75E7BB1F0732022C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x95A6F68732B36B44,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f12,	%f16
loop_30:
	tneg	%xcc,	0x6
loop_31:
	tl	%xcc,	0x7
	tcs	%xcc,	0x5
	movge	%xcc,	%o4,	%g4
	fbl,a	%fcc3,	loop_32
	lduw	[%l7 + 0x68],	%l1
	fabsd	%f10,	%f22
	add	%l7,	0x08,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o0,	%o5
loop_32:
	fbne,a	%fcc0,	loop_33
	smul	%g7,	0x16E1,	%g6
	stw	%i3,	[%l7 + 0x60]
	fmovrdlz	%l2,	%f22,	%f30
loop_33:
	srl	%o1,	%g1,	%g2
	array16	%l5,	%i6,	%i5
	fba	%fcc1,	loop_34
	subc	%i7,	0x051C,	%g3
	edge16l	%o7,	%i2,	%l0
	fornot1s	%f15,	%f18,	%f0
loop_34:
	fmovrdgz	%l3,	%f30,	%f4
	fornot1s	%f27,	%f11,	%f17
	orn	%i1,	0x1D7F,	%l6
	alignaddrl	%i4,	%l4,	%o3
	ldd	[%l7 + 0x58],	%f0
	movge	%xcc,	%g5,	%o2
	fmovdpos	%icc,	%f29,	%f16
	faligndata	%f30,	%f22,	%f4
	fbule,a	%fcc1,	loop_35
	ta	%xcc,	0x6
	smul	%o6,	%i0,	%g4
	subccc	%l1,	0x09E1,	%o4
loop_35:
	bl	loop_36
	brgez	%o5,	loop_37
	brlez,a	%o0,	loop_38
	sir	0x11ED
loop_36:
	flush	%l7 + 0x38
loop_37:
	nop
	setx	loop_39,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_38:
	edge32ln	%g6,	%i3,	%g7
	movcc	%icc,	%l2,	%g1
	ble,a,pn	%xcc,	loop_40
loop_39:
	ba,pn	%icc,	loop_41
	nop
	setx	0x804A2355,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	ta	%xcc,	0x4
loop_40:
	tle	%xcc,	0x3
loop_41:
	edge8n	%o1,	%g2,	%l5
	mulscc	%i5,	%i6,	%g3
	nop
	setx	0xB2C00562,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xAF30DC27,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f5,	%f2
	tpos	%icc,	0x5
	tl	%icc,	0x6
	fornot2	%f8,	%f0,	%f12
	subccc	%o7,	0x0905,	%i7
	fmovsne	%xcc,	%f4,	%f31
	tgu	%xcc,	0x0
	popc	%i2,	%l3
	movpos	%icc,	%i1,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f6,	%f12
	bpos,a	loop_42
	movgu	%xcc,	%i4,	%l4
	tleu	%icc,	0x7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%o3
loop_42:
	fsrc2s	%f23,	%f28
	movgu	%xcc,	%g5,	%o2
	stb	%l0,	[%l7 + 0x2D]
	sll	%o6,	%i0,	%g4
	fmovrse	%o4,	%f17,	%f18
	tl	%icc,	0x5
	subc	%o5,	%l1,	%g6
	movne	%icc,	%i3,	%o0
	fmovrde	%l2,	%f22,	%f30
	flush	%l7 + 0x0C
	tge	%icc,	0x5
	nop
	setx	loop_43,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%g7,	0x0FA5,	%o1
	and	%g1,	%g2,	%l5
	fmovrsne	%i6,	%f15,	%f1
loop_43:
	ble,a	%icc,	loop_44
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%g3,	%f10,	%f2
	movleu	%icc,	%o7,	%i5
loop_44:
	fornot1s	%f7,	%f24,	%f11
	fpsub16	%f28,	%f6,	%f18
	fbug,a	%fcc3,	loop_45
	umulcc	%i2,	0x178E,	%l3
	brz,a	%i1,	loop_46
	tvs	%icc,	0x1
loop_45:
	tsubcctv	%i7,	0x19A9,	%i4
	umul	%l4,	%o3,	%g5
loop_46:
	movrgez	%o2,	0x2FD,	%l6
	sdiv	%o6,	0x0698,	%i0
	sra	%l0,	%g4,	%o4
	set	0x40, %o7
	stwa	%o5,	[%l7 + %o7] 0x88
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x28] %asi,	%g6
	edge16	%i3,	%o0,	%l2
	fornot1	%f12,	%f18,	%f26
	movrlz	%g7,	0x0AD,	%o1
	srax	%l1,	0x1C,	%g1
	subccc	%l5,	0x063A,	%g2
	nop
	fitos	%f14,	%f31
	fstod	%f31,	%f2
	nop
	setx	loop_47,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%g3,	%o7,	%i5
	brgez,a	%i2,	loop_48
	edge8l	%l3,	%i1,	%i6
loop_47:
	taddcctv	%i7,	0x1CC5,	%l4
	movvs	%icc,	%o3,	%i4
loop_48:
	srlx	%o2,	0x0A,	%g5
	sllx	%l6,	%i0,	%l0
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x10,	%g4
	edge8	%o4,	%o5,	%o6
	sir	0x1899
	edge16ln	%i3,	%g6,	%o0
	fmovsg	%xcc,	%f17,	%f28
	tcs	%xcc,	0x4
	ldstub	[%l7 + 0x3C],	%g7
	edge8n	%o1,	%l1,	%g1
	tle	%xcc,	0x2
	addc	%l5,	%g2,	%l2
	movleu	%xcc,	%g3,	%o7
	edge8	%i5,	%i2,	%i1
	addccc	%l3,	0x0191,	%i7
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	addc	%i6,	%i4,	%o3
	edge16n	%g5,	%o2,	%l6
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l0
	tn	%icc,	0x4
	tneg	%xcc,	0x4
	fbg,a	%fcc1,	loop_49
	sllx	%g4,	0x0F,	%o4
	array8	%o5,	%i0,	%o6
	nop
	setx	0xF042A1B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
loop_49:
	taddcc	%i3,	%g6,	%g7
	add	%o1,	%l1,	%o0
	bcs,a	loop_50
	bcs	%icc,	loop_51
	mulx	%g1,	0x0C41,	%g2
	fmovrde	%l2,	%f28,	%f26
loop_50:
	edge16	%l5,	%g3,	%o7
loop_51:
	tne	%xcc,	0x0
	edge8	%i2,	%i5,	%l3
	stbar
	mulscc	%i7,	%l4,	%i1
	nop
	set	0x30, %g5
	prefetch	[%l7 + %g5],	 0x2
	tn	%icc,	0x5
	movrgez	%i4,	0x065,	%i6
	set	0x10, %i0
	lda	[%l7 + %i0] 0x10,	%f11
	srl	%o3,	0x1C,	%g5
	set	0x0, %l4
	stxa	%l6,	[%g0 + %l4] 0x57
	fcmpne16	%f22,	%f4,	%l0
	add	%o2,	%g4,	%o4
	taddcc	%i0,	0x1C10,	%o5
	ldub	[%l7 + 0x10],	%o6
	bge,pn	%icc,	loop_52
	fmovsgu	%xcc,	%f13,	%f11
	taddcc	%g6,	0x09B1,	%i3
	srl	%o1,	0x01,	%l1
loop_52:
	sub	%g7,	%g1,	%o0
	udivx	%l2,	0x0F89,	%l5
	umulcc	%g2,	0x0225,	%o7
	fbe,a	%fcc3,	loop_53
	flush	%l7 + 0x4C
	fnot1	%f16,	%f12
	mova	%xcc,	%i2,	%g3
loop_53:
	bn,pt	%icc,	loop_54
	tcc	%icc,	0x0
	nop
	setx	0x0E1637AA50DB2DFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x5F23F802DCA7111F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f24,	%f14
	tle	%xcc,	0x0
loop_54:
	movvs	%xcc,	%l3,	%i7
	fpsub32	%f12,	%f2,	%f26
	nop
	set	0x3C, %i6
	prefetch	[%l7 + %i6],	 0x3
	edge16l	%i5,	%i1,	%l4
	fbug,a	%fcc0,	loop_55
	edge8	%i6,	%i4,	%o3
	orcc	%l6,	0x0A73,	%l0
	brz	%g5,	loop_56
loop_55:
	fbge,a	%fcc0,	loop_57
	srax	%o2,	%o4,	%g4
	edge32ln	%i0,	%o5,	%o6
loop_56:
	membar	0x3C
loop_57:
	fbge,a	%fcc0,	loop_58
	ldsw	[%l7 + 0x30],	%i3
	fmovsvc	%xcc,	%f6,	%f14
	nop
	setx	loop_59,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_58:
	add	%o1,	%l1,	%g7
	sdivx	%g1,	0x1142,	%g6
	sub	%l2,	%l5,	%o0
loop_59:
	movvs	%icc,	%g2,	%i2
	addccc	%o7,	0x0653,	%g3
	edge32n	%l3,	%i5,	%i7
	xnor	%i1,	0x0B6B,	%l4
	edge8l	%i6,	%i4,	%l6
	edge16n	%l0,	%g5,	%o2
	fcmpeq32	%f30,	%f14,	%o4
	fmovsg	%xcc,	%f8,	%f19
	movrne	%o3,	0x21E,	%i0
	fba	%fcc0,	loop_60
	edge8l	%o5,	%o6,	%i3
	sdivx	%o1,	0x147E,	%l1
	movrne	%g4,	0x30B,	%g7
loop_60:
	andn	%g6,	0x05EA,	%g1
	edge32	%l2,	%l5,	%o0
	fmovsle	%icc,	%f10,	%f3
	bne,pt	%xcc,	loop_61
	srlx	%i2,	0x06,	%g2
	orcc	%g3,	0x1892,	%l3
	movcc	%icc,	%o7,	%i7
loop_61:
	ta	%xcc,	0x2
	tn	%xcc,	0x5
	fmovrslz	%i1,	%f11,	%f22
	tn	%icc,	0x0
	tg	%icc,	0x4
	edge8n	%l4,	%i6,	%i5
	set	0x60, %o1
	ldstuba	[%l7 + %o1] 0x18,	%i4
	fmovsa	%icc,	%f1,	%f27
	fbue,a	%fcc2,	loop_62
	movre	%l6,	0x225,	%l0
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf0
	membar	#Sync
loop_62:
	sdivx	%o2,	0x0071,	%o4
	bneg	%xcc,	loop_63
	tvc	%icc,	0x7
	stb	%g5,	[%l7 + 0x69]
	stb	%i0,	[%l7 + 0x6D]
loop_63:
	ba,a	loop_64
	fmovdvc	%xcc,	%f8,	%f24
	umul	%o5,	%o3,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64:
	fba	%fcc3,	loop_65
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%xcc,	0x6
	edge32ln	%o1,	%o6,	%l1
loop_65:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g4,	%g7,	%g6
	fblg	%fcc0,	loop_66
	edge8l	%l2,	%l5,	%g1
	edge8ln	%i2,	%g2,	%o0
	tgu	%xcc,	0x7
loop_66:
	fmovdleu	%xcc,	%f28,	%f13
	addccc	%l3,	0x0AE3,	%o7
	edge8l	%g3,	%i1,	%i7
	fpsub16s	%f18,	%f14,	%f11
	taddcc	%l4,	%i5,	%i4
	smul	%i6,	0x131B,	%l6
	fcmpgt32	%f24,	%f26,	%o2
	move	%icc,	%o4,	%l0
	fsrc1s	%f26,	%f8
	smul	%g5,	%o5,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x2
	tcc	%icc,	0x3
	xnor	%i0,	0x0298,	%o1
	brgez	%o6,	loop_67
	udiv	%i3,	0x0FB0,	%l1
	fabss	%f20,	%f2
	fbl,a	%fcc1,	loop_68
loop_67:
	tgu	%icc,	0x0
	movle	%icc,	%g7,	%g4
	fbu	%fcc1,	loop_69
loop_68:
	edge16l	%l2,	%l5,	%g1
	movne	%xcc,	%i2,	%g6
	fbug,a	%fcc0,	loop_70
loop_69:
	xorcc	%o0,	0x1D66,	%g2
	edge32n	%o7,	%g3,	%i1
	bgu	loop_71
loop_70:
	nop
	fitod	%f10,	%f24
	fdtox	%f24,	%f14
	fbg	%fcc2,	loop_72
	edge16l	%l3,	%i7,	%i5
loop_71:
	edge32	%l4,	%i6,	%l6
	tcs	%icc,	0x5
loop_72:
	edge16ln	%o2,	%i4,	%o4
	and	%g5,	0x1E4F,	%l0
	udivcc	%o3,	0x1140,	%i0
	faligndata	%f4,	%f14,	%f0
	fmul8x16al	%f19,	%f4,	%f16
	nop
	setx	0x71773E771B4B0205,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x66EE60E99BD62194,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f6,	%f8
	tn	%xcc,	0x7
	edge16l	%o5,	%o1,	%o6
	ldx	[%l7 + 0x58],	%l1
	tle	%xcc,	0x4
	nop
	set	0x58, %i4
	std	%f18,	[%l7 + %i4]
	tl	%icc,	0x6
	array32	%i3,	%g7,	%g4
	stb	%l2,	[%l7 + 0x52]
	andncc	%l5,	%g1,	%g6
	subcc	%o0,	%i2,	%g2
	subccc	%g3,	0x0C47,	%i1
	ta	%icc,	0x3
	ldsh	[%l7 + 0x1C],	%o7
	tcc	%icc,	0x0
	movre	%l3,	0x36C,	%i7
	nop
	setx loop_73, %l0, %l1
	jmpl %l1, %i5
	mulx	%l4,	%i6,	%l6
	tg	%xcc,	0x2
	fmovsn	%icc,	%f12,	%f27
loop_73:
	smul	%i4,	%o4,	%o2
	bvc,pt	%icc,	loop_74
	movrgz	%g5,	%l0,	%i0
	fbule	%fcc1,	loop_75
	tg	%xcc,	0x7
loop_74:
	bgu	loop_76
	stx	%o5,	[%l7 + 0x28]
loop_75:
	add	%o3,	0x0A1E,	%o1
	ldub	[%l7 + 0x45],	%o6
loop_76:
	smul	%i3,	0x061B,	%l1
	srl	%g7,	0x08,	%g4
	bshuffle	%f30,	%f16,	%f22
	array16	%l2,	%l5,	%g1
	fmovdg	%xcc,	%f16,	%f14
	sll	%g6,	%i2,	%g2
	movge	%xcc,	%g3,	%i1
	fpsub32s	%f1,	%f18,	%f5
	movcc	%icc,	%o0,	%l3
	movre	%o7,	0x0E7,	%i7
	fmovrsgez	%i5,	%f0,	%f3
	srl	%l4,	%i6,	%i4
	set	0x68, %l6
	stha	%l6,	[%l7 + %l6] 0x10
	edge16l	%o2,	%g5,	%o4
	sllx	%i0,	%l0,	%o5
	or	%o1,	0x1E8C,	%o3
	fbule,a	%fcc2,	loop_77
	brlez	%o6,	loop_78
	fsrc1	%f30,	%f0
	nop
	setx	loop_79,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_77:
	fmuld8sux16	%f10,	%f31,	%f28
loop_78:
	fxnor	%f12,	%f18,	%f10
	taddcc	%i3,	%l1,	%g4
loop_79:
	fbge,a	%fcc0,	loop_80
	udivx	%g7,	0x0354,	%l2
	smulcc	%g1,	0x0AEC,	%l5
	tle	%icc,	0x4
loop_80:
	movpos	%xcc,	%g6,	%i2
	tsubcctv	%g3,	0x121F,	%g2
	movne	%xcc,	%i1,	%o0
	srlx	%l3,	0x02,	%i7
	ld	[%l7 + 0x68],	%f4
	edge16n	%o7,	%l4,	%i5
	movl	%icc,	%i6,	%l6
	tvs	%icc,	0x5
	movg	%icc,	%i4,	%o2
	fmul8x16	%f20,	%f20,	%f0
	fbe,a	%fcc3,	loop_81
	fmovrdgez	%o4,	%f24,	%f10
	fxnors	%f3,	%f23,	%f2
	movneg	%xcc,	%g5,	%l0
loop_81:
	fnands	%f19,	%f24,	%f13
	fzero	%f6
	movrlez	%o5,	0x33D,	%o1
	movvc	%xcc,	%i0,	%o3
	udivx	%o6,	0x0F0B,	%l1
	movneg	%xcc,	%i3,	%g7
	add	%l2,	0x14E2,	%g4
	wr	%g0,	0x80,	%asi
	stba	%l5,	[%l7 + 0x4F] %asi
	fand	%f30,	%f6,	%f16
	tvs	%icc,	0x2
	prefetch	[%l7 + 0x70],	 0x1
	sra	%g6,	%g1,	%g3
	edge16n	%i2,	%i1,	%g2
	fbug	%fcc2,	loop_82
	membar	0x41
	membar	0x23
	ldstub	[%l7 + 0x24],	%l3
loop_82:
	be	%xcc,	loop_83
	edge8l	%o0,	%o7,	%l4
	edge32n	%i5,	%i7,	%i6
	fpsub32s	%f30,	%f14,	%f22
loop_83:
	tcs	%icc,	0x6
	tneg	%icc,	0x6
	fbu	%fcc1,	loop_84
	te	%icc,	0x3
	mulscc	%l6,	0x12C0,	%i4
	movrgez	%o4,	%g5,	%l0
loop_84:
	fbuge,a	%fcc3,	loop_85
	fpadd32s	%f25,	%f5,	%f15
	movneg	%icc,	%o5,	%o1
	movg	%icc,	%i0,	%o2
loop_85:
	movge	%icc,	%o6,	%l1
	brgz	%o3,	loop_86
	bcc,a,pn	%icc,	loop_87
	addcc	%g7,	%i3,	%g4
	ldstub	[%l7 + 0x39],	%l5
loop_86:
	sll	%g6,	0x19,	%g1
loop_87:
	bpos,a,pt	%xcc,	loop_88
	and	%l2,	0x1968,	%g3
	edge8	%i2,	%g2,	%l3
	xnor	%o0,	%o7,	%l4
loop_88:
	te	%xcc,	0x5
	add	%i5,	0x00D6,	%i7
	popc	%i1,	%l6
	mulx	%i6,	0x1291,	%o4
	brlz,a	%g5,	loop_89
	movcc	%xcc,	%l0,	%i4
	fpack16	%f0,	%f11
	edge8ln	%o1,	%i0,	%o5
loop_89:
	alignaddrl	%o2,	%l1,	%o6
	array8	%o3,	%i3,	%g7
	ldsh	[%l7 + 0x24],	%g4
	movrgez	%l5,	0x092,	%g6
	orn	%g1,	%l2,	%i2
	alignaddr	%g2,	%l3,	%g3
	fxors	%f24,	%f21,	%f13
	fmovs	%f21,	%f15
	add	%o7,	%l4,	%i5
	tsubcctv	%i7,	0x089D,	%i1
	movl	%icc,	%l6,	%o0
	addcc	%o4,	%g5,	%l0
	subc	%i4,	0x1846,	%o1
	bgu,a,pt	%icc,	loop_90
	brlez,a	%i0,	loop_91
	stw	%o5,	[%l7 + 0x74]
	set	0x28, %i3
	stxa	%i6,	[%l7 + %i3] 0x2b
	membar	#Sync
loop_90:
	popc	0x17E7,	%l1
loop_91:
	nop
	setx	0x9B1B176F20506D96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	sethi	0x17B1,	%o6
	sethi	0x0FBA,	%o3
	tpos	%icc,	0x0
	set	0x18, %o3
	swapa	[%l7 + %o3] 0x0c,	%i3
	fxnors	%f8,	%f21,	%f16
	fbl	%fcc1,	loop_92
	fbg	%fcc3,	loop_93
	edge8	%g7,	%o2,	%g4
	brgz	%g6,	loop_94
loop_92:
	edge32n	%l5,	%l2,	%i2
loop_93:
	bvc,a,pn	%icc,	loop_95
	fands	%f4,	%f9,	%f27
loop_94:
	tvc	%xcc,	0x5
	fandnot2	%f4,	%f26,	%f24
loop_95:
	fmovrdne	%g2,	%f10,	%f4
	fmovsg	%icc,	%f28,	%f27
	sdivcc	%g1,	0x12B8,	%l3
	stbar
	movneg	%xcc,	%o7,	%g3
	movn	%xcc,	%l4,	%i7
	addc	%i5,	0x08DB,	%l6
	sdivx	%i1,	0x043C,	%o0
	alignaddrl	%g5,	%o4,	%l0
	tg	%xcc,	0x0
	fbul	%fcc1,	loop_96
	bleu,a,pn	%xcc,	loop_97
	smulcc	%o1,	0x16F0,	%i4
	tgu	%icc,	0x3
loop_96:
	call	loop_98
loop_97:
	ld	[%l7 + 0x5C],	%f30
	bg,a,pt	%xcc,	loop_99
	udivcc	%i0,	0x18EB,	%o5
loop_98:
	tsubcctv	%l1,	%o6,	%i6
	bne,pn	%icc,	loop_100
loop_99:
	or	%i3,	%o3,	%g7
	nop
	setx	loop_101,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdne	%g4,	%f18,	%f12
loop_100:
	sth	%o2,	[%l7 + 0x4E]
	movre	%l5,	%l2,	%g6
loop_101:
	xnorcc	%i2,	%g2,	%l3
	tsubcc	%o7,	%g1,	%l4
	tpos	%xcc,	0x0
	mova	%xcc,	%i7,	%i5
	srax	%l6,	%i1,	%g3
	sethi	0x11EA,	%g5
	ld	[%l7 + 0x78],	%f30
	fpack32	%f16,	%f28,	%f8
	movvc	%xcc,	%o0,	%l0
	smul	%o1,	0x1BCD,	%i4
	movpos	%icc,	%i0,	%o4
	fornot2s	%f6,	%f13,	%f16
	sdivx	%l1,	0x100D,	%o5
	andncc	%i6,	%o6,	%o3
	fornot1	%f12,	%f30,	%f14
	andcc	%i3,	0x17F8,	%g7
	movrlez	%g4,	0x3F6,	%l5
	tn	%icc,	0x6
	or	%l2,	%o2,	%g6
	ldsw	[%l7 + 0x4C],	%i2
	smul	%g2,	0x016C,	%l3
	edge32l	%o7,	%l4,	%g1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x60] %asi,	%i5
	srl	%l6,	%i7,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc1,	loop_102
	edge32l	%g3,	%o0,	%g5
	wr	%g0,	0xea,	%asi
	stwa	%o1,	[%l7 + 0x1C] %asi
	membar	#Sync
loop_102:
	stw	%l0,	[%l7 + 0x4C]
	mova	%icc,	%i0,	%i4
	tge	%icc,	0x0
	xnorcc	%l1,	%o5,	%o4
	movre	%o6,	0x1A8,	%i6
	array32	%i3,	%o3,	%g4
	nop
	setx	0x11D8EBD6CEDBB6EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f22
	addc	%g7,	0x0CEA,	%l5
	wr	%g0,	0x21,	%asi
	stxa	%l2,	[%g0 + 0x108] %asi
	call	loop_103
	smul	%g6,	%o2,	%i2
	edge8ln	%g2,	%l3,	%l4
	tleu	%icc,	0x4
loop_103:
	fmovdgu	%icc,	%f18,	%f3
	sdiv	%o7,	0x184F,	%g1
	sllx	%l6,	0x04,	%i7
	nop
	setx	0x36FF2C0C607C5327,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	ldub	[%l7 + 0x6B],	%i5
	wr	%g0,	0x4f,	%asi
	stxa	%i1,	[%g0 + 0x38] %asi
	sdivx	%g3,	0x18E6,	%g5
	tneg	%icc,	0x2
	umul	%o1,	0x1103,	%o0
	srl	%i0,	0x1B,	%l0
	subc	%i4,	%o5,	%l1
	xnorcc	%o4,	%o6,	%i3
	add	%o3,	0x07EA,	%g4
	nop
	fitos	%f4,	%f27
	fstox	%f27,	%f24
	movrne	%i6,	%g7,	%l2
	set	0x50, %i2
	ldsba	[%l7 + %i2] 0x89,	%g6
	umul	%o2,	%i2,	%l5
	fpsub32s	%f18,	%f31,	%f17
	te	%xcc,	0x7
	tsubcc	%g2,	0x13CE,	%l4
	bne	loop_104
	movpos	%icc,	%l3,	%g1
	edge32l	%l6,	%o7,	%i7
	movcs	%icc,	%i1,	%g3
loop_104:
	movrne	%g5,	%o1,	%i5
	tpos	%icc,	0x6
	tgu	%xcc,	0x2
	nop
	fitos	%f13,	%f6
	fstod	%f6,	%f4
	mulscc	%i0,	%l0,	%o0
	edge8ln	%o5,	%i4,	%o4
	st	%f1,	[%l7 + 0x60]
	add	%l7,	0x74,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l1,	%i3
	fmul8x16al	%f29,	%f31,	%f30
	sir	0x03B2
	edge32ln	%o3,	%o6,	%g4
	ble,a,pn	%xcc,	loop_105
	tn	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_105:
	tvs	%xcc,	0x0
	ldstub	[%l7 + 0x58],	%g7
	movrlz	%l2,	%g6,	%i6
	xnorcc	%o2,	0x0415,	%i2
	movgu	%xcc,	%g2,	%l5
	mulx	%l4,	%l3,	%g1
	sdivx	%o7,	0x1E7B,	%i7
	movrgez	%i1,	%l6,	%g3
	ldsb	[%l7 + 0x61],	%o1
	addc	%g5,	%i0,	%i5
	movcc	%icc,	%l0,	%o0
	tge	%icc,	0x1
	fbuge,a	%fcc2,	loop_106
	fnot2	%f18,	%f22
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i4
loop_106:
	fbul	%fcc0,	loop_107
	alignaddr	%o5,	%l1,	%o4
	fbge	%fcc3,	loop_108
	tg	%icc,	0x6
loop_107:
	nop
	set	0x7C, %o4
	sth	%o3,	[%l7 + %o4]
	smul	%o6,	%i3,	%g7
loop_108:
	tsubcctv	%g4,	%g6,	%l2
	sth	%i6,	[%l7 + 0x20]
	fmovdcs	%icc,	%f1,	%f0
	mova	%icc,	%i2,	%o2
	bn,a,pt	%icc,	loop_109
	xorcc	%l5,	%g2,	%l4
	sra	%l3,	%o7,	%g1
	fnor	%f26,	%f12,	%f16
loop_109:
	bl,a	%icc,	loop_110
	udiv	%i1,	0x1245,	%l6
	fbule	%fcc2,	loop_111
	fmovspos	%xcc,	%f31,	%f21
loop_110:
	st	%f0,	[%l7 + 0x18]
	edge32ln	%i7,	%o1,	%g5
loop_111:
	nop
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x24,	%g2
	tvc	%xcc,	0x3
	movcs	%xcc,	%i0,	%l0
	tn	%icc,	0x3
	lduh	[%l7 + 0x0C],	%o0
	fpadd32	%f6,	%f14,	%f30
	subcc	%i5,	0x0187,	%o5
	lduh	[%l7 + 0x32],	%l1
	fmovscc	%icc,	%f13,	%f8
	edge8	%i4,	%o3,	%o4
	subcc	%i3,	0x1DC7,	%g7
	fmovdle	%icc,	%f9,	%f0
	movcs	%xcc,	%o6,	%g6
	stbar
	subc	%l2,	%i6,	%g4
	fand	%f20,	%f14,	%f28
	brgz,a	%i2,	loop_112
	stx	%l5,	[%l7 + 0x58]
	fbu,a	%fcc3,	loop_113
	umulcc	%o2,	0x1F17,	%l4
loop_112:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g2,	%l3,	%o7
loop_113:
	tsubcctv	%g1,	0x14E5,	%i1
	smulcc	%l6,	0x051B,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be,a,pn	%icc,	loop_114
	sra	%g5,	0x18,	%i7
	xnor	%g3,	0x078D,	%i0
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x2c,	%l0
loop_114:
	nop
	set	0x10, %o2
	lduba	[%l7 + %o2] 0x0c,	%o0
	or	%o5,	0x1D01,	%l1
	movg	%icc,	%i5,	%i4
	fmovdne	%icc,	%f1,	%f10
	edge32l	%o4,	%o3,	%i3
	andncc	%o6,	%g6,	%g7
	move	%icc,	%i6,	%g4
	bvc	%icc,	loop_115
	tne	%xcc,	0x2
	or	%i2,	0x0568,	%l2
	tcc	%icc,	0x2
loop_115:
	taddcc	%l5,	0x04C1,	%l4
	tn	%icc,	0x5
	fsrc1s	%f6,	%f0
	movgu	%icc,	%o2,	%l3
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f6
	tle	%xcc,	0x6
	taddcctv	%g2,	0x1527,	%o7
	alignaddrl	%g1,	%i1,	%l6
	edge8	%g5,	%o1,	%g3
	tcc	%xcc,	0x1
	or	%i0,	%i7,	%o0
	alignaddr	%o5,	%l1,	%i5
	tvs	%icc,	0x4
	fnot1s	%f13,	%f4
	subcc	%i4,	0x0311,	%o4
	subccc	%o3,	0x175D,	%l0
	fone	%f10
	movcc	%xcc,	%i3,	%g6
	set	0x63, %g6
	ldstuba	[%l7 + %g6] 0x89,	%g7
	tcs	%icc,	0x6
	tcs	%xcc,	0x7
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x30] %asi,	%o6
	mova	%icc,	%i6,	%i2
	movne	%icc,	%g4,	%l5
	fbo,a	%fcc3,	loop_116
	andcc	%l2,	%l4,	%l3
	fmovspos	%icc,	%f22,	%f11
	edge8ln	%o2,	%g2,	%o7
loop_116:
	fandnot1	%f4,	%f22,	%f16
	smulcc	%i1,	%l6,	%g1
	umulcc	%g5,	%g3,	%i0
	umulcc	%o1,	%o0,	%i7
	tn	%xcc,	0x2
	fornot2	%f2,	%f4,	%f4
	movcs	%icc,	%l1,	%o5
	bvs,pt	%xcc,	loop_117
	fpmerge	%f7,	%f24,	%f24
	nop
	setx	loop_118,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movl	%xcc,	%i4,	%i5
loop_117:
	tsubcctv	%o4,	0x137D,	%l0
	movrgz	%o3,	0x33B,	%i3
loop_118:
	bcs,a,pn	%xcc,	loop_119
	taddcc	%g6,	%o6,	%g7
	tcc	%xcc,	0x1
	movne	%xcc,	%i2,	%i6
loop_119:
	movge	%xcc,	%l5,	%g4
	bvc,pn	%icc,	loop_120
	edge32	%l4,	%l3,	%l2
	sethi	0x1A9B,	%g2
	fmovdgu	%xcc,	%f4,	%f5
loop_120:
	nop
	setx	loop_121,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%xcc,	0x2
	nop
	setx	loop_122,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8sux16	%f18,	%f10,	%f10
loop_121:
	fble,a	%fcc0,	loop_123
	edge8	%o7,	%i1,	%o2
loop_122:
	ldd	[%l7 + 0x40],	%f12
	fsrc2s	%f10,	%f21
loop_123:
	udiv	%g1,	0x0293,	%g5
	alignaddr	%l6,	%g3,	%i0
	bleu	loop_124
	umulcc	%o0,	%o1,	%i7
	movneg	%icc,	%o5,	%l1
	tneg	%icc,	0x0
loop_124:
	sra	%i4,	0x0F,	%i5
	tneg	%xcc,	0x3
	mulscc	%o4,	0x197A,	%l0
	movle	%xcc,	%i3,	%g6
	sll	%o3,	0x1E,	%g7
	udivx	%i2,	0x0080,	%i6
	set	0x48, %l3
	sta	%f21,	[%l7 + %l3] 0x10
	bleu,pn	%icc,	loop_125
	tgu	%xcc,	0x2
	fpsub32s	%f4,	%f19,	%f29
	nop
	setx	0x23A9509860767F8A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
loop_125:
	nop
	fitos	%f11,	%f23
	fstoi	%f23,	%f28
	xorcc	%o6,	%g4,	%l4
	fpmerge	%f21,	%f14,	%f26
	fbne,a	%fcc3,	loop_126
	ble,pt	%icc,	loop_127
	fbul	%fcc3,	loop_128
	alignaddr	%l5,	%l3,	%l2
loop_126:
	fcmpne16	%f10,	%f8,	%o7
loop_127:
	srax	%g2,	%o2,	%g1
loop_128:
	addccc	%g5,	0x0FFA,	%l6
	edge32l	%i1,	%g3,	%i0
	fpackfix	%f6,	%f20
	tl	%xcc,	0x2
	ta	%icc,	0x6
	nop
	setx	0xCEB1E923,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xC1AAA7CD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f12,	%f15
	bneg	%xcc,	loop_129
	smulcc	%o1,	%o0,	%o5
	membar	0x06
	subc	%i7,	0x19E9,	%l1
loop_129:
	st	%f9,	[%l7 + 0x5C]
	nop
	setx	0x653BEA3313D4A999,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x5D88B829C85B37AC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f10,	%f4
	fmuld8ulx16	%f8,	%f29,	%f8
	orncc	%i5,	0x1B30,	%i4
	andcc	%o4,	0x035B,	%l0
	ta	%xcc,	0x3
	fbg,a	%fcc1,	loop_130
	movgu	%icc,	%g6,	%o3
	bneg	%xcc,	loop_131
	fornot2	%f18,	%f12,	%f14
loop_130:
	udivcc	%i3,	0x06E5,	%g7
	nop
	setx	0x63AA1C7CED251ECF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x212DC5E09915BC2E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f2,	%f30
loop_131:
	movleu	%icc,	%i2,	%o6
	nop
	setx	0x5EBD4FF0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f20
	fmovsl	%icc,	%f12,	%f8
	sllx	%g4,	0x19,	%i6
	fmovsa	%xcc,	%f10,	%f15
	nop
	setx	0xE7279FE280610320,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fcmpgt32	%f22,	%f26,	%l5
	lduw	[%l7 + 0x24],	%l4
	fbug,a	%fcc2,	loop_132
	movvs	%icc,	%l2,	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x19,	%o7,	%g2
loop_132:
	edge8ln	%g1,	%o2,	%l6
	fbg,a	%fcc3,	loop_133
	popc	0x1CC1,	%g5
	edge8l	%i1,	%i0,	%g3
	sub	%o0,	0x1B04,	%o5
loop_133:
	orncc	%o1,	%l1,	%i7
	movre	%i5,	0x17B,	%i4
	taddcc	%o4,	0x0840,	%g6
	orn	%l0,	0x0E39,	%o3
	alignaddrl	%g7,	%i2,	%i3
	taddcctv	%g4,	0x1691,	%i6
	and	%l5,	%l4,	%o6
	movrgz	%l2,	0x0D0,	%o7
	tgu	%xcc,	0x3
	edge8	%l3,	%g2,	%o2
	movpos	%icc,	%g1,	%l6
	tsubcctv	%g5,	0x0B55,	%i0
	movne	%icc,	%i1,	%o0
	sir	0x0813
	tvc	%icc,	0x6
	tsubcctv	%g3,	%o5,	%l1
	fpadd16	%f6,	%f12,	%f8
	sdiv	%o1,	0x1D39,	%i5
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i4
	tsubcctv	%o4,	%i7,	%l0
	std	%f4,	[%l7 + 0x38]
	te	%xcc,	0x7
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f16
	fmovsvc	%icc,	%f12,	%f20
	fxnor	%f24,	%f6,	%f12
	movrgez	%o3,	0x23F,	%g7
	edge32n	%g6,	%i2,	%g4
	or	%i3,	%l5,	%i6
	fmovsleu	%icc,	%f21,	%f20
	set	0x40, %o5
	sta	%f30,	[%l7 + %o5] 0x18
	prefetch	[%l7 + 0x58],	 0x2
	alignaddr	%l4,	%l2,	%o6
	ldd	[%l7 + 0x28],	%f0
	fzeros	%f16
	ble	%icc,	loop_134
	call	loop_135
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f11,	%f16,	%f28
loop_134:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%g2
loop_135:
	fble	%fcc1,	loop_136
	fcmple32	%f4,	%f30,	%o2
	fbn,a	%fcc1,	loop_137
	nop
	setx	0x62B845B4CD477B6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xC3D32EE1B8B4246B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f16,	%f2
loop_136:
	nop
	wr	%g0,	0x88,	%asi
	sta	%f9,	[%l7 + 0x10] %asi
loop_137:
	xorcc	%g1,	0x0731,	%l3
	srax	%l6,	%g5,	%i1
	fpadd16	%f12,	%f26,	%f2
	fmovsl	%xcc,	%f9,	%f10
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x64] %asi,	%i0
	ldx	[%l7 + 0x40],	%o0
	flush	%l7 + 0x58
	udivcc	%g3,	0x0C87,	%o5
	bcs,a	%icc,	loop_138
	addcc	%o1,	%l1,	%i5
	swap	[%l7 + 0x34],	%i4
	fmovsleu	%icc,	%f28,	%f15
loop_138:
	fbule	%fcc0,	loop_139
	orcc	%o4,	0x0FE4,	%l0
	xnorcc	%o3,	0x1DE5,	%g7
	nop
	setx	0x46638D81,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xE897A49E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f13,	%f8
loop_139:
	ldd	[%l7 + 0x60],	%f28
	smulcc	%g6,	0x0650,	%i7
	orn	%i2,	%i3,	%g4
	fcmpne16	%f24,	%f20,	%l5
	subccc	%l4,	%l2,	%o6
	add	%i6,	%g2,	%o2
	edge16	%o7,	%g1,	%l6
	tvc	%icc,	0x1
	fpadd16	%f26,	%f0,	%f26
	tcs	%icc,	0x2
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x0c,	%f0
	movrne	%g5,	0x0FA,	%i1
	bshuffle	%f0,	%f18,	%f30
	movl	%xcc,	%l3,	%i0
	set	0x10, %l2
	stwa	%g3,	[%l7 + %l2] 0xea
	membar	#Sync
	tneg	%icc,	0x3
	movcs	%icc,	%o5,	%o0
	movgu	%icc,	%l1,	%o1
	andncc	%i5,	%o4,	%l0
	sll	%i4,	%o3,	%g6
	mulx	%g7,	%i2,	%i7
	bvs,a,pn	%xcc,	loop_140
	srlx	%i3,	0x15,	%g4
	flush	%l7 + 0x5C
	srl	%l5,	0x13,	%l4
loop_140:
	movrne	%o6,	0x3C7,	%l2
	umulcc	%g2,	0x028C,	%o2
	tvc	%icc,	0x7
	fnors	%f25,	%f6,	%f4
	add	%o7,	0x0DFD,	%g1
	ldx	[%l7 + 0x60],	%i6
	movne	%icc,	%l6,	%i1
	membar	0x28
	fxor	%f22,	%f10,	%f2
	fnegs	%f24,	%f3
	nop
	setx	0xE68CAAC311ED4ECF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f24
	andncc	%l3,	%i0,	%g3
	fand	%f30,	%f28,	%f14
	array16	%o5,	%g5,	%o0
	ldsw	[%l7 + 0x44],	%o1
	fmovsg	%xcc,	%f0,	%f26
	array32	%i5,	%o4,	%l0
	mova	%icc,	%i4,	%o3
	movrlz	%g6,	0x165,	%g7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x08] %asi,	%i2
	udiv	%i7,	0x04D3,	%l1
	fornot1	%f28,	%f24,	%f22
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x58] %asi,	%f20
	sllx	%i3,	0x07,	%g4
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x15
	fabsd	%f24,	%f6
	edge32n	%l5,	%l4,	%l2
	bge,a,pt	%icc,	loop_141
	srl	%g2,	%o6,	%o2
	stw	%g1,	[%l7 + 0x4C]
	movrgez	%o7,	0x3D4,	%l6
loop_141:
	fbug,a	%fcc3,	loop_142
	edge16ln	%i6,	%i1,	%i0
	lduh	[%l7 + 0x48],	%l3
	fblg,a	%fcc3,	loop_143
loop_142:
	orncc	%g3,	0x03B4,	%g5
	udiv	%o5,	0x10E9,	%o0
	mova	%icc,	%i5,	%o1
loop_143:
	movpos	%xcc,	%o4,	%i4
	fsrc1s	%f4,	%f17
	set	0x72, %l5
	ldsha	[%l7 + %l5] 0x19,	%l0
	bvs	%xcc,	loop_144
	smulcc	%o3,	0x1364,	%g6
	fcmple16	%f22,	%f26,	%i2
	taddcc	%i7,	%l1,	%g7
loop_144:
	movgu	%xcc,	%g4,	%i3
	nop
	setx	0xBC6FC906105A7957,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fbe,a	%fcc2,	loop_145
	fmovdleu	%xcc,	%f18,	%f18
	movrgez	%l5,	%l4,	%l2
	edge32ln	%g2,	%o6,	%g1
loop_145:
	ldsb	[%l7 + 0x38],	%o7
	movcs	%xcc,	%l6,	%o2
	bg	%xcc,	loop_146
	srax	%i6,	0x00,	%i0
	edge16ln	%i1,	%l3,	%g5
	edge8ln	%o5,	%o0,	%g3
loop_146:
	fmovdg	%icc,	%f20,	%f8
	edge32	%i5,	%o4,	%i4
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
	edge8ln	%o3,	%l0,	%g6
	edge16n	%i2,	%i7,	%g7
	move	%xcc,	%g4,	%l1
	bge	%icc,	loop_147
	add	%i3,	%l5,	%l2
	fandnot2s	%f16,	%f0,	%f3
	srlx	%l4,	%o6,	%g1
loop_147:
	fmovse	%icc,	%f14,	%f8
	set	0x44, %l0
	stwa	%o7,	[%l7 + %l0] 0x80
	add	%g2,	0x1997,	%o2
	bleu,pt	%xcc,	loop_148
	xor	%l6,	0x1167,	%i6
	ldstub	[%l7 + 0x22],	%i0
	srax	%i1,	%g5,	%o5
loop_148:
	tvs	%xcc,	0x5
	fmovdleu	%xcc,	%f29,	%f27
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fsrc2	%f0,	%f24
	fmovdcc	%icc,	%f5,	%f13
	nop
	fitos	%f26,	%f12
	fbuge,a	%fcc0,	loop_149
	alignaddrl	%l3,	%o0,	%i5
	sethi	0x16ED,	%g3
	tgu	%xcc,	0x2
loop_149:
	movg	%xcc,	%o4,	%i4
	taddcc	%o1,	%o3,	%l0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%i2
	srax	%g6,	%i7,	%g7
	tcs	%icc,	0x5
	fbe,a	%fcc0,	loop_150
	tcs	%xcc,	0x0
	fcmpgt32	%f8,	%f12,	%g4
	movl	%icc,	%l1,	%i3
loop_150:
	tpos	%xcc,	0x4
	xorcc	%l5,	0x1103,	%l2
	sir	0x1EBF
	fands	%f10,	%f1,	%f9
	ldx	[%l7 + 0x78],	%o6
	set	0x54, %g3
	lda	[%l7 + %g3] 0x19,	%f9
	alignaddr	%g1,	%l4,	%o7
	tvc	%icc,	0x4
	edge8ln	%o2,	%g2,	%i6
	tcs	%xcc,	0x4
	edge16n	%i0,	%l6,	%g5
	tsubcc	%o5,	0x14FD,	%i1
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f30
	movn	%icc,	%o0,	%l3
	movleu	%xcc,	%i5,	%g3
	addccc	%o4,	0x0076,	%o1
	popc	0x1781,	%i4
	xor	%o3,	%l0,	%i2
	movpos	%xcc,	%g6,	%i7
	sdivx	%g7,	0x129B,	%l1
	fpack16	%f12,	%f30
	movg	%icc,	%i3,	%g4
	movrlez	%l2,	0x0FB,	%l5
	sdivx	%g1,	0x03B1,	%l4
	stw	%o6,	[%l7 + 0x1C]
	ble,a,pn	%icc,	loop_151
	membar	0x78
	smulcc	%o2,	0x0125,	%o7
	nop
	setx	loop_152,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_151:
	nop
	setx loop_153, %l0, %l1
	jmpl %l1, %i6
	sir	0x1559
	fmovse	%xcc,	%f8,	%f6
loop_152:
	fmovs	%f19,	%f20
loop_153:
	fbul,a	%fcc2,	loop_154
	tsubcctv	%g2,	0x1889,	%i0
	movl	%icc,	%g5,	%o5
	edge32n	%l6,	%o0,	%l3
loop_154:
	nop
	setx loop_155, %l0, %l1
	jmpl %l1, %i5
	tcc	%icc,	0x4
	sdivx	%i1,	0x03BD,	%g3
	sdivx	%o1,	0x1615,	%i4
loop_155:
	subc	%o4,	%o3,	%i2
	array32	%g6,	%i7,	%l0
	movcc	%icc,	%l1,	%i3
	fpackfix	%f2,	%f30
	tsubcctv	%g4,	0x013C,	%g7
	movpos	%xcc,	%l5,	%l2
	subc	%l4,	0x0D18,	%o6
	sdivcc	%g1,	0x1915,	%o2
	fmovdneg	%xcc,	%f22,	%f19
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x38] %asi,	%i6
	tne	%xcc,	0x0
	orn	%g2,	%o7,	%g5
	movrlez	%i0,	0x113,	%o5
	tsubcc	%o0,	0x03AE,	%l3
	movpos	%icc,	%l6,	%i5
	fbule,a	%fcc0,	loop_156
	nop
	setx	0x030B3EE290602411,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	brgz	%i1,	loop_157
	tgu	%xcc,	0x7
loop_156:
	tvs	%icc,	0x3
	set	0x1C, %g7
	lduwa	[%l7 + %g7] 0x19,	%o1
loop_157:
	nop
	fitos	%f7,	%f7
	fstoi	%f7,	%f27
	fzeros	%f12
	udivx	%g3,	0x12A0,	%o4
	movrgez	%o3,	0x1BA,	%i2
	stb	%g6,	[%l7 + 0x47]
	tn	%xcc,	0x4
	move	%xcc,	%i7,	%i4
	sllx	%l0,	%l1,	%g4
	movrlez	%g7,	%i3,	%l5
	tge	%xcc,	0x6
	fpsub16s	%f10,	%f25,	%f29
	mulscc	%l2,	0x03B1,	%l4
	nop
	set	0x28, %g2
	lduw	[%l7 + %g2],	%g1
	orn	%o6,	%o2,	%g2
	tn	%icc,	0x4
	subcc	%i6,	0x069C,	%g5
	edge32n	%i0,	%o7,	%o5
	udivcc	%l3,	0x00FE,	%l6
	ldsw	[%l7 + 0x30],	%i5
	fbn	%fcc3,	loop_158
	fbu,a	%fcc1,	loop_159
	alignaddrl	%o0,	%i1,	%o1
	edge16l	%o4,	%o3,	%i2
loop_158:
	bvs	%xcc,	loop_160
loop_159:
	fbu	%fcc0,	loop_161
	movrgez	%g3,	%g6,	%i4
	call	loop_162
loop_160:
	ta	%icc,	0x7
loop_161:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l0,	0x153F,	%l1
loop_162:
	movne	%xcc,	%i7,	%g4
	fmovrdlez	%i3,	%f18,	%f0
	ldstub	[%l7 + 0x28],	%l5
	movneg	%xcc,	%g7,	%l2
	st	%f6,	[%l7 + 0x60]
	movcc	%icc,	%g1,	%l4
	stx	%o6,	[%l7 + 0x38]
	taddcctv	%g2,	%o2,	%g5
	fmovscc	%icc,	%f18,	%f24
	addc	%i0,	0x0A0A,	%o7
	xnor	%i6,	%o5,	%l6
	edge8n	%l3,	%o0,	%i5
	fmovdcc	%icc,	%f17,	%f8
	xorcc	%i1,	%o1,	%o4
	fpack16	%f4,	%f25
	brnz	%i2,	loop_163
	tpos	%icc,	0x5
	fmovdvc	%icc,	%f26,	%f21
	addcc	%g3,	0x19E1,	%g6
loop_163:
	movcs	%icc,	%o3,	%l0
	fmovsl	%icc,	%f16,	%f17
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x1f
	membar	#Sync
	sdivcc	%l1,	0x1021,	%i4
	nop
	setx loop_164, %l0, %l1
	jmpl %l1, %i7
	alignaddr	%i3,	%g4,	%l5
	tvs	%xcc,	0x1
	xor	%g7,	%g1,	%l2
loop_164:
	subc	%l4,	%g2,	%o2
	movg	%xcc,	%o6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%g5,	%o7
	nop
	set	0x69, %o7
	ldub	[%l7 + %o7],	%i6
	movvs	%xcc,	%l6,	%l3
	movvc	%xcc,	%o0,	%o5
	movre	%i5,	0x330,	%o1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x5C] %asi,	%f4
	fzeros	%f24
	srlx	%o4,	%i1,	%i2
	move	%icc,	%g3,	%o3
	edge16l	%g6,	%l1,	%l0
	ld	[%l7 + 0x0C],	%f7
	bleu,a	%xcc,	loop_165
	popc	0x0305,	%i7
	umulcc	%i4,	0x03BD,	%g4
	set	0x48, %g1
	ldsha	[%l7 + %g1] 0x80,	%l5
loop_165:
	nop
	setx	0xF4D752F2F073CF45,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	tvs	%xcc,	0x6
	bleu,a	%xcc,	loop_166
	tvs	%icc,	0x3
	lduw	[%l7 + 0x10],	%g7
	tn	%icc,	0x5
loop_166:
	movvc	%icc,	%i3,	%l2
	bg,a,pt	%xcc,	loop_167
	array16	%g1,	%g2,	%o2
	movrlez	%o6,	%l4,	%g5
	fbule,a	%fcc2,	loop_168
loop_167:
	taddcc	%o7,	0x148E,	%i0
	st	%f4,	[%l7 + 0x3C]
	movneg	%xcc,	%l6,	%l3
loop_168:
	call	loop_169
	fmovdg	%icc,	%f16,	%f26
	sllx	%i6,	%o5,	%o0
	and	%i5,	%o4,	%o1
loop_169:
	ldd	[%l7 + 0x28],	%f12
	sdiv	%i1,	0x0EA9,	%i2
	fmovsle	%icc,	%f30,	%f2
	bl	loop_170
	or	%g3,	%g6,	%o3
	fandnot1s	%f28,	%f8,	%f11
	tn	%xcc,	0x7
loop_170:
	srl	%l0,	0x17,	%l1
	fmovspos	%xcc,	%f16,	%f31
	xnorcc	%i4,	%i7,	%g4
	ta	%icc,	0x6
	srax	%g7,	0x08,	%i3
	fmovde	%icc,	%f1,	%f23
	ldsw	[%l7 + 0x6C],	%l5
	nop
	fitos	%f12,	%f24
	fstox	%f24,	%f8
	fble,a	%fcc1,	loop_171
	mova	%xcc,	%g1,	%l2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x04,	%o2,	%o6
loop_171:
	srax	%g2,	0x16,	%g5
	edge8l	%o7,	%i0,	%l6
	mova	%xcc,	%l3,	%l4
	fmovscs	%xcc,	%f19,	%f11
	edge32	%i6,	%o5,	%i5
	fmovse	%icc,	%f27,	%f16
	array32	%o4,	%o0,	%o1
	movrlz	%i2,	%g3,	%i1
	edge32ln	%g6,	%o3,	%l1
	fpsub16	%f24,	%f2,	%f16
	tl	%icc,	0x3
	stb	%i4,	[%l7 + 0x56]
	membar	0x65
	movrne	%i7,	%l0,	%g4
	movne	%xcc,	%g7,	%i3
	fnot1	%f20,	%f6
	edge16n	%l5,	%g1,	%l2
	array16	%o2,	%o6,	%g2
	andncc	%o7,	%i0,	%l6
	alignaddr	%g5,	%l3,	%i6
	xorcc	%l4,	%i5,	%o5
	tgu	%icc,	0x6
	movvs	%xcc,	%o4,	%o1
	fexpand	%f8,	%f2
	wr	%g0,	0x23,	%asi
	stba	%i2,	[%l7 + 0x16] %asi
	membar	#Sync
	movrgez	%g3,	0x196,	%o0
	bpos,a	loop_172
	edge8n	%g6,	%o3,	%l1
	ta	%xcc,	0x4
	movcs	%icc,	%i4,	%i1
loop_172:
	movvc	%xcc,	%l0,	%i7
	tleu	%xcc,	0x7
	fmovde	%xcc,	%f19,	%f4
	flush	%l7 + 0x0C
	movg	%xcc,	%g4,	%i3
	brgz	%g7,	loop_173
	fmovrse	%l5,	%f15,	%f21
	fmovscc	%icc,	%f13,	%f20
	mulscc	%g1,	%o2,	%l2
loop_173:
	fnors	%f3,	%f9,	%f26
	smul	%g2,	0x1E5C,	%o6
	fsrc1	%f16,	%f10
	fpmerge	%f14,	%f21,	%f14
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x3A] %asi,	%i0
	alignaddrl	%o7,	%l6,	%l3
	be,pn	%icc,	loop_174
	nop
	setx	0x79155B45C5CDC7EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f10
	brnz,a	%g5,	loop_175
	ba,pn	%xcc,	loop_176
loop_174:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x5
loop_175:
	nop
	wr	%g0,	0x22,	%asi
	stwa	%l4,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_176:
	te	%xcc,	0x5
	brgez	%i6,	loop_177
	andncc	%o5,	%i5,	%o4
	movrgz	%i2,	0x3DA,	%o1
	taddcc	%g3,	0x0695,	%o0
loop_177:
	ldstub	[%l7 + 0x72],	%g6
	fmovsge	%icc,	%f11,	%f28
	array16	%l1,	%o3,	%i1
	sub	%l0,	0x1FF9,	%i7
	sth	%i4,	[%l7 + 0x44]
	fmul8x16au	%f17,	%f1,	%f12
	flush	%l7 + 0x2C
	andcc	%g4,	0x1EE0,	%g7
	movrne	%l5,	%i3,	%g1
	movcs	%xcc,	%l2,	%o2
	fcmple16	%f28,	%f6,	%g2
	xor	%i0,	%o6,	%l6
	fbule	%fcc2,	loop_178
	edge8	%o7,	%l3,	%l4
	fmovsvs	%xcc,	%f3,	%f26
	taddcctv	%i6,	%g5,	%o5
loop_178:
	movgu	%xcc,	%i5,	%i2
	srlx	%o4,	0x0F,	%g3
	srlx	%o0,	%o1,	%g6
	brnz	%l1,	loop_179
	edge16l	%o3,	%i1,	%l0
	addccc	%i7,	0x0E65,	%g4
	edge8n	%g7,	%i4,	%l5
loop_179:
	sll	%i3,	0x1D,	%l2
	edge32l	%o2,	%g2,	%i0
	srlx	%o6,	%g1,	%o7
	fmovdl	%xcc,	%f5,	%f17
	nop
	setx	loop_180,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsgu	%xcc,	%f21,	%f20
	alignaddrl	%l6,	%l3,	%i6
	edge8n	%l4,	%g5,	%i5
loop_180:
	fmovd	%f0,	%f10
	ta	%xcc,	0x7
	edge8n	%i2,	%o4,	%g3
	movvs	%xcc,	%o0,	%o5
	movvs	%icc,	%o1,	%l1
	be,pn	%icc,	loop_181
	fmovdgu	%icc,	%f3,	%f12
	addcc	%o3,	0x1A65,	%i1
	fmovsle	%xcc,	%f30,	%f26
loop_181:
	sdivx	%g6,	0x1B5C,	%l0
	udiv	%g4,	0x0C0A,	%i7
	tvc	%icc,	0x4
	nop
	setx	0x8BBB3E6C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x1B395F59,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f29,	%f27
	fbge,a	%fcc3,	loop_182
	nop
	setx	0xA071B13C,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	fxors	%f18,	%f28,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_182:
	sir	0x06E5
	set	0x54, %i0
	stha	%g7,	[%l7 + %i0] 0xeb
	membar	#Sync
	edge16l	%i4,	%i3,	%l5
	brgez,a	%l2,	loop_183
	brlz,a	%g2,	loop_184
	fbg	%fcc2,	loop_185
	movrne	%o2,	%i0,	%o6
loop_183:
	movl	%icc,	%o7,	%g1
loop_184:
	bvs,a	%icc,	loop_186
loop_185:
	movg	%icc,	%l3,	%l6
	subc	%l4,	%i6,	%g5
	andcc	%i2,	%i5,	%o4
loop_186:
	fzeros	%f5
	udivcc	%o0,	0x11ED,	%g3
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x74] %asi,	%o1
	movl	%xcc,	%o5,	%o3
	move	%icc,	%i1,	%g6
	stb	%l0,	[%l7 + 0x7B]
	bl,a,pn	%icc,	loop_187
	move	%xcc,	%g4,	%i7
	tneg	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x0F] %asi,	%g7
loop_187:
	fone	%f14
	set	0x30, %l4
	lduha	[%l7 + %l4] 0x81,	%l1
	edge32n	%i4,	%i3,	%l5
	tcs	%xcc,	0x1
	nop
	setx	0xA459F5BA08BE29C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0286CFC392CAE65B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f14,	%f28
	te	%xcc,	0x7
	tneg	%xcc,	0x4
	fpack32	%f14,	%f18,	%f12
	array16	%l2,	%o2,	%i0
	fpsub32s	%f30,	%f10,	%f28
	prefetch	[%l7 + 0x18],	 0x0
	edge16n	%g2,	%o6,	%o7
	sdivx	%l3,	0x1E57,	%l6
	fmul8x16al	%f14,	%f2,	%f0
	fsrc2	%f2,	%f16
	taddcctv	%g1,	0x186F,	%l4
	addccc	%i6,	0x07D0,	%g5
	bvs,a	%xcc,	loop_188
	edge32l	%i2,	%i5,	%o4
	fornot1	%f6,	%f12,	%f4
	alignaddrl	%g3,	%o1,	%o0
loop_188:
	bcs,a	%icc,	loop_189
	fba,a	%fcc0,	loop_190
	te	%icc,	0x1
	wr	%g0,	0x88,	%asi
	stba	%o5,	[%l7 + 0x30] %asi
loop_189:
	tn	%xcc,	0x3
loop_190:
	bg	loop_191
	fbl,a	%fcc3,	loop_192
	movrlz	%o3,	%i1,	%g6
	udivx	%l0,	0x0E2C,	%g4
loop_191:
	andcc	%i7,	%l1,	%i4
loop_192:
	sub	%g7,	%i3,	%l5
	tleu	%xcc,	0x4
	membar	0x20
	tge	%icc,	0x1
	xnor	%l2,	%o2,	%g2
	wr	%g0,	0x80,	%asi
	stha	%o6,	[%l7 + 0x1C] %asi
	addccc	%i0,	%o7,	%l6
	nop
	setx	0xF36078FA70666236,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	be,a,pn	%icc,	loop_193
	sub	%l3,	%g1,	%l4
	fsrc2s	%f1,	%f26
	bg,pt	%xcc,	loop_194
loop_193:
	xnorcc	%g5,	0x07A7,	%i2
	stw	%i5,	[%l7 + 0x50]
	fpadd32s	%f3,	%f23,	%f12
loop_194:
	tge	%xcc,	0x1
	fbg,a	%fcc3,	loop_195
	srl	%i6,	%g3,	%o4
	umul	%o0,	0x0B6D,	%o1
	nop
	setx	0xF0413EC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
loop_195:
	fmovdcc	%icc,	%f19,	%f23
	fmovrslez	%o3,	%f21,	%f14
	movgu	%xcc,	%i1,	%g6
	nop
	setx	0x42515409,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x39DAA52F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f22,	%f1
	tne	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l0,	%o5
	fpsub16	%f4,	%f22,	%f28
	tpos	%xcc,	0x5
	movpos	%xcc,	%i7,	%l1
	brlz,a	%g4,	loop_196
	fandnot2	%f22,	%f26,	%f26
	array16	%i4,	%i3,	%l5
	bvs,a	loop_197
loop_196:
	tvs	%icc,	0x4
	array16	%l2,	%o2,	%g7
	movneg	%xcc,	%g2,	%i0
loop_197:
	movge	%xcc,	%o6,	%l6
	tleu	%icc,	0x4
	edge16	%o7,	%l3,	%l4
	ta	%xcc,	0x5
	tsubcctv	%g1,	%g5,	%i2
	movrlz	%i5,	%g3,	%i6
	edge16l	%o4,	%o1,	%o3
	tcc	%xcc,	0x2
	fmovd	%f20,	%f28
	tl	%xcc,	0x3
	nop
	fitod	%f26,	%f0
	faligndata	%f18,	%f16,	%f20
	sth	%o0,	[%l7 + 0x6A]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g6,	0x0C,	%i1
	udiv	%l0,	0x0B1E,	%o5
	edge8n	%i7,	%g4,	%i4
	sir	0x0503
	tgu	%xcc,	0x3
	tne	%xcc,	0x6
	fpsub16	%f20,	%f16,	%f2
	fmovdge	%icc,	%f16,	%f9
	edge8n	%i3,	%l1,	%l2
	fble,a	%fcc2,	loop_198
	bn,a,pn	%xcc,	loop_199
	prefetch	[%l7 + 0x74],	 0x3
	nop
	setx	loop_200,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_198:
	sdiv	%o2,	0x0636,	%g7
loop_199:
	ld	[%l7 + 0x40],	%f19
	xor	%l5,	0x1922,	%i0
loop_200:
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%o6
	taddcctv	%g2,	0x1DE0,	%l6
	nop
	fitos	%f27,	%f18
	edge8l	%o7,	%l4,	%l3
	bg	%icc,	loop_201
	edge32	%g5,	%g1,	%i5
	add	%g3,	0x1C2E,	%i6
	set	0x44, %g5
	swapa	[%l7 + %g5] 0x10,	%o4
loop_201:
	sra	%o1,	0x1A,	%o3
	membar	0x78
	tpos	%icc,	0x2
	bl,pt	%xcc,	loop_202
	call	loop_203
	fcmpgt16	%f20,	%f24,	%i2
	fsrc2s	%f6,	%f31
loop_202:
	sethi	0x0917,	%o0
loop_203:
	bcs,a,pt	%icc,	loop_204
	and	%i1,	%g6,	%l0
	xnorcc	%o5,	%i7,	%g4
	alignaddr	%i4,	%i3,	%l1
loop_204:
	umulcc	%o2,	0x1724,	%g7
	ld	[%l7 + 0x10],	%f29
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x0c,	%l2,	%i0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o6,	%g2
	movleu	%xcc,	%l6,	%o7
	fmovdge	%icc,	%f8,	%f15
	tpos	%xcc,	0x1
	fmovrdlez	%l5,	%f16,	%f20
	fones	%f12
	movne	%xcc,	%l3,	%g5
	tl	%xcc,	0x4
	edge8l	%l4,	%i5,	%g1
	movre	%i6,	%o4,	%g3
	fbl	%fcc1,	loop_205
	nop
	setx	loop_206,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0x90E7323A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x83CEF779,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f21,	%f2
	fzeros	%f22
loop_205:
	brlez,a	%o3,	loop_207
loop_206:
	xorcc	%o1,	0x1C5A,	%i2
	edge16l	%i1,	%g6,	%o0
	brlz	%o5,	loop_208
loop_207:
	fmovdcs	%xcc,	%f5,	%f25
	fba,a	%fcc0,	loop_209
	fpackfix	%f8,	%f30
loop_208:
	array8	%l0,	%g4,	%i7
	edge32ln	%i3,	%i4,	%l1
loop_209:
	nop
	set	0x40, %o6
	lda	[%l7 + %o6] 0x0c,	%f25
	movrgz	%o2,	0x3A3,	%l2
	xor	%g7,	%o6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x00
	edge16	%g2,	%o7,	%l5
	and	%l6,	%l3,	%l4
	ble,a,pt	%xcc,	loop_210
	fbo	%fcc1,	loop_211
	sdivcc	%i5,	0x1BD7,	%g1
	sir	0x196C
loop_210:
	tvs	%icc,	0x7
loop_211:
	tl	%xcc,	0x5
	call	loop_212
	srax	%i6,	%o4,	%g3
	umulcc	%g5,	%o3,	%o1
	edge32l	%i1,	%g6,	%i2
loop_212:
	movg	%icc,	%o0,	%o5
	tneg	%xcc,	0x0
	nop
	setx	0x0DBC1460CE6C55FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xDF8F5836A6E9C72A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f12,	%f16
	tcs	%xcc,	0x7
	srl	%l0,	%g4,	%i7
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x70] %asi,	%i2
	nop
	fitos	%f14,	%f1
	fstox	%f1,	%f10
	fxtos	%f10,	%f10
	nop
	setx	loop_213,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%l1,	%o2,	%l2
	xor	%i4,	0x1A4B,	%o6
	bgu,a	%icc,	loop_214
loop_213:
	tvc	%icc,	0x5
	tvs	%icc,	0x5
	bpos	%xcc,	loop_215
loop_214:
	udiv	%i0,	0x16EA,	%g7
	xnorcc	%g2,	%o7,	%l5
	sdivcc	%l6,	0x1A0A,	%l3
loop_215:
	stbar
	tle	%xcc,	0x6
	tl	%icc,	0x6
	edge8ln	%i5,	%l4,	%i6
	movpos	%xcc,	%g1,	%g3
	movgu	%icc,	%o4,	%g5
	tcs	%icc,	0x1
	fpsub32s	%f24,	%f30,	%f17
	tsubcc	%o1,	0x141F,	%o3
	alignaddr	%g6,	%i2,	%o0
	movpos	%icc,	%o5,	%i1
	nop
	setx	0xDB9551A708F99593,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB6E703325ACB412A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f10,	%f24
	ldx	[%l7 + 0x60],	%g4
	smul	%i7,	%i3,	%l1
	edge32l	%l0,	%o2,	%l2
	fmul8x16au	%f14,	%f18,	%f8
	movvc	%xcc,	%o6,	%i4
	fbue	%fcc2,	loop_216
	stw	%i0,	[%l7 + 0x10]
	fmovdg	%xcc,	%f23,	%f19
	xnor	%g7,	0x0D62,	%o7
loop_216:
	orcc	%g2,	0x0CF1,	%l5
	sllx	%l6,	0x1C,	%i5
	fxor	%f18,	%f12,	%f12
	edge32ln	%l4,	%i6,	%g1
	tsubcc	%g3,	%o4,	%l3
	fmovsgu	%xcc,	%f16,	%f11
	array16	%g5,	%o3,	%g6
	movrgz	%o1,	0x183,	%i2
	sdivx	%o0,	0x06E6,	%i1
	edge32n	%o5,	%g4,	%i7
	ldd	[%l7 + 0x70],	%l0
	andcc	%i3,	0x1CE9,	%o2
	nop
	fitos	%f2,	%f26
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7B] %asi,	%l2
	sllx	%o6,	0x08,	%i4
	fmovrsgz	%i0,	%f4,	%f4
	bgu,a	loop_217
	fbuge	%fcc1,	loop_218
	fbg	%fcc2,	loop_219
	xnor	%l0,	%g7,	%g2
loop_217:
	nop
	setx	0xB976C5EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x5DC6199F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f16,	%f15
loop_218:
	call	loop_220
loop_219:
	edge8ln	%l5,	%l6,	%i5
	nop
	setx	0xF481DF3F5060B198,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	tsubcc	%o7,	0x13ED,	%i6
loop_220:
	udivx	%g1,	0x0577,	%l4
	stbar
	sethi	0x1F85,	%g3
	alignaddr	%l3,	%g5,	%o4
	and	%g6,	0x0C62,	%o3
	xnorcc	%i2,	%o0,	%o1
	fbe	%fcc1,	loop_221
	fmovrdgez	%o5,	%f16,	%f30
	addccc	%g4,	0x14CE,	%i7
	fpackfix	%f20,	%f18
loop_221:
	xor	%l1,	0x0703,	%i1
	movrgz	%o2,	%l2,	%o6
	ldd	[%l7 + 0x58],	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i0,	%l0,	%i4
	addc	%g2,	0x0847,	%g7
	or	%l5,	%i5,	%o7
	fcmple32	%f16,	%f0,	%l6
	te	%xcc,	0x6
	add	%g1,	0x09C8,	%l4
	membar	0x07
	nop
	setx	0xD26ED6B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x555A8048,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f30,	%f14
	edge32l	%i6,	%g3,	%g5
	umul	%l3,	0x1347,	%g6
	wr	%g0,	0x89,	%asi
	stba	%o3,	[%l7 + 0x27] %asi
	edge32	%o4,	%o0,	%i2
	set	0x14, %o1
	ldswa	[%l7 + %o1] 0x19,	%o5
	orn	%o1,	%i7,	%g4
	fba,a	%fcc0,	loop_222
	ldx	[%l7 + 0x70],	%l1
	sir	0x17D2
	tne	%xcc,	0x6
loop_222:
	srlx	%i1,	0x11,	%l2
	nop
	setx	0x6A44F66C503C16B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x86B07BD14C9392EF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f16,	%f16
	fexpand	%f2,	%f12
	fpsub16	%f16,	%f20,	%f18
	mulx	%o6,	%i3,	%o2
	fbo	%fcc3,	loop_223
	fmovse	%xcc,	%f16,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i0,	%l0,	%g2
loop_223:
	edge8ln	%i4,	%l5,	%i5
	tne	%icc,	0x2
	nop
	fitos	%f10,	%f23
	fstox	%f23,	%f22
	fxtos	%f22,	%f19
	bl,a,pt	%xcc,	loop_224
	nop
	setx	0x61C7089DEC296930,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xC407D036160DFE09,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f2,	%f10
	fbg,a	%fcc1,	loop_225
	tn	%icc,	0x1
loop_224:
	sdivcc	%o7,	0x0145,	%l6
	fmovdne	%icc,	%f9,	%f24
loop_225:
	smulcc	%g1,	0x1F58,	%l4
	ta	%icc,	0x4
	fsrc2s	%f28,	%f25
	subccc	%g7,	%g3,	%i6
	fmovsle	%xcc,	%f25,	%f22
	umulcc	%g5,	0x1B8D,	%g6
	orcc	%o3,	0x1BDF,	%o4
	fones	%f17
	tge	%icc,	0x1
	fors	%f17,	%f24,	%f29
	fbn	%fcc1,	loop_226
	sdivx	%o0,	0x0EE7,	%i2
	tge	%icc,	0x5
	tl	%icc,	0x2
loop_226:
	udivcc	%o5,	0x1038,	%o1
	smul	%i7,	0x0D82,	%g4
	sll	%l3,	0x12,	%l1
	move	%xcc,	%i1,	%l2
	movgu	%icc,	%o6,	%i3
	movvc	%xcc,	%o2,	%l0
	fnot2	%f24,	%f20
	fmovdge	%icc,	%f14,	%f3
	array32	%i0,	%g2,	%i4
	fzero	%f6
	tg	%icc,	0x6
	movre	%i5,	0x290,	%o7
	fbe,a	%fcc3,	loop_227
	sub	%l5,	0x1C9C,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l6,	%l4,	%g3
loop_227:
	tneg	%icc,	0x3
	fmovsge	%xcc,	%f24,	%f10
	ldsh	[%l7 + 0x68],	%i6
	fbl,a	%fcc2,	loop_228
	ldsw	[%l7 + 0x20],	%g7
	xnorcc	%g6,	%o3,	%o4
	xorcc	%g5,	0x0AE2,	%o0
loop_228:
	bn,pn	%icc,	loop_229
	xor	%o5,	0x1390,	%i2
	fnot1	%f18,	%f8
	edge16	%o1,	%i7,	%l3
loop_229:
	tge	%icc,	0x2
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%g4
	fpadd32	%f20,	%f8,	%f6
	bcs,pt	%icc,	loop_230
	udivcc	%l1,	0x046E,	%i1
	nop
	setx	loop_231,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	0x1F68,	%l2
loop_230:
	tneg	%xcc,	0x6
	fbule,a	%fcc0,	loop_232
loop_231:
	movge	%icc,	%i3,	%o2
	fand	%f16,	%f30,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_232:
	bne,a	%icc,	loop_233
	xor	%l0,	0x1429,	%o6
	addccc	%i0,	%g2,	%i5
	movre	%i4,	0x08E,	%o7
loop_233:
	fble,a	%fcc2,	loop_234
	subccc	%l5,	0x0C52,	%l6
	tvc	%xcc,	0x4
	tsubcc	%l4,	%g1,	%i6
loop_234:
	movge	%icc,	%g3,	%g6
	set	0x2A, %i4
	ldstuba	[%l7 + %i4] 0x10,	%o3
	subccc	%g7,	%g5,	%o0
	fbne,a	%fcc1,	loop_235
	tne	%xcc,	0x7
	tgu	%icc,	0x0
	ld	[%l7 + 0x50],	%f2
loop_235:
	edge8	%o4,	%i2,	%o5
	movvc	%xcc,	%i7,	%l3
	add	%o1,	0x0A2F,	%l1
	fbl,a	%fcc2,	loop_236
	bl,a	%icc,	loop_237
	fmovdpos	%icc,	%f25,	%f12
	brz	%i1,	loop_238
loop_236:
	udiv	%l2,	0x0BA0,	%i3
loop_237:
	movrne	%o2,	0x370,	%l0
	movn	%icc,	%g4,	%o6
loop_238:
	fmovscc	%xcc,	%f28,	%f6
	mova	%icc,	%g2,	%i5
	fbge	%fcc0,	loop_239
	sdivcc	%i0,	0x0F59,	%i4
	bneg	loop_240
	movleu	%xcc,	%l5,	%l6
loop_239:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f20,	%f22
loop_240:
	stb	%l4,	[%l7 + 0x4C]
	ble,a,pn	%icc,	loop_241
	movpos	%xcc,	%o7,	%g1
	tn	%icc,	0x1
	andn	%g3,	%i6,	%g6
loop_241:
	addccc	%g7,	%g5,	%o3
	tg	%xcc,	0x1
	sethi	0x0D3C,	%o4
	taddcctv	%i2,	0x1C86,	%o5
	sdiv	%o0,	0x0E74,	%i7
	edge32	%l3,	%l1,	%i1
	edge32	%l2,	%i3,	%o1
	sethi	0x0B0B,	%o2
	srlx	%g4,	%o6,	%l0
	bgu,a	loop_242
	popc	0x1BF4,	%g2
	xnorcc	%i5,	0x0483,	%i4
	brz	%l5,	loop_243
loop_242:
	fsrc2	%f26,	%f28
	movrgz	%l6,	%l4,	%i0
	tle	%xcc,	0x7
loop_243:
	movpos	%xcc,	%o7,	%g3
	alignaddrl	%i6,	%g1,	%g7
	movrlz	%g5,	0x1EA,	%g6
	fmovsgu	%icc,	%f12,	%f30
	addccc	%o3,	0x162E,	%i2
	bcc,a,pt	%icc,	loop_244
	movrlz	%o4,	0x357,	%o5
	fbug,a	%fcc1,	loop_245
	edge16ln	%i7,	%o0,	%l1
loop_244:
	smulcc	%l3,	0x0E26,	%l2
	subc	%i3,	%o1,	%i1
loop_245:
	bvc,a,pt	%xcc,	loop_246
	movcs	%xcc,	%o2,	%g4
	subc	%o6,	0x124B,	%l0
	andcc	%g2,	0x1531,	%i4
loop_246:
	srax	%i5,	0x16,	%l5
	edge32n	%l4,	%i0,	%l6
	movrgz	%g3,	%o7,	%i6
	brlez,a	%g1,	loop_247
	mova	%icc,	%g7,	%g6
	membar	0x1F
	fmovdg	%icc,	%f18,	%f29
loop_247:
	sdivcc	%g5,	0x1041,	%i2
	fmovrde	%o3,	%f22,	%f18
	tg	%xcc,	0x7
	nop
	setx	0xD9F4F9F460510EE8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	movpos	%xcc,	%o5,	%o4
	bl,a,pt	%xcc,	loop_248
	nop
	fitos	%f6,	%f9
	addccc	%o0,	0x091E,	%l1
	fmovsgu	%xcc,	%f7,	%f24
loop_248:
	sub	%l3,	0x18CF,	%l2
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f26
	orcc	%i7,	%i3,	%o1
	fbl	%fcc2,	loop_249
	fbuge	%fcc1,	loop_250
	ldstub	[%l7 + 0x7E],	%i1
	tsubcctv	%g4,	%o6,	%o2
loop_249:
	fnot2s	%f15,	%f25
loop_250:
	ldsb	[%l7 + 0x3C],	%l0
	edge32l	%g2,	%i5,	%l5
	fornot2	%f24,	%f22,	%f2
	umul	%l4,	0x12C1,	%i4
	andn	%i0,	%g3,	%o7
	te	%icc,	0x5
	sdiv	%l6,	0x0670,	%g1
	andncc	%g7,	%g6,	%i6
	movre	%g5,	%i2,	%o3
	fpackfix	%f24,	%f12
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x74] %asi,	%o4
	tneg	%xcc,	0x6
	sethi	0x19C7,	%o0
	movcs	%icc,	%l1,	%l3
	edge32l	%l2,	%o5,	%i3
	edge8n	%o1,	%i7,	%g4
	swap	[%l7 + 0x50],	%o6
	edge16l	%i1,	%o2,	%g2
	edge8l	%i5,	%l5,	%l0
	fbge,a	%fcc3,	loop_251
	nop
	setx	0x906CC912,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	tg	%xcc,	0x1
	fbul	%fcc0,	loop_252
loop_251:
	tvs	%icc,	0x7
	fnot2	%f20,	%f26
	movne	%icc,	%l4,	%i0
loop_252:
	sdivcc	%i4,	0x144C,	%o7
	subc	%l6,	%g1,	%g7
	set	0x50, %i3
	ldxa	[%l7 + %i3] 0x10,	%g3
	addc	%g6,	%i6,	%i2
	ldsh	[%l7 + 0x60],	%o3
	movl	%icc,	%g5,	%o0
	mulx	%l1,	%l3,	%o4
	fmovdcc	%xcc,	%f15,	%f20
	bpos,pt	%icc,	loop_253
	tvs	%xcc,	0x1
	sdivx	%o5,	0x186B,	%l2
	tvs	%icc,	0x7
loop_253:
	st	%f22,	[%l7 + 0x20]
	movrgez	%o1,	%i7,	%g4
	sdiv	%i3,	0x0FC8,	%o6
	bcs,a,pt	%xcc,	loop_254
	xor	%i1,	%o2,	%i5
	fmovrsgez	%l5,	%f18,	%f11
	nop
	setx	0xBED5B9F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x29D01297,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f15,	%f28
loop_254:
	andncc	%g2,	%l0,	%l4
	fabss	%f11,	%f13
	nop
	setx	0x9E50A0C8207349DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fones	%f22
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f20
	fxtod	%f20,	%f24
	orncc	%i4,	0x10E6,	%i0
	fba,a	%fcc3,	loop_255
	sra	%o7,	%g1,	%l6
	fandnot1s	%f7,	%f0,	%f19
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x60] %asi,	%g7
loop_255:
	fornot1	%f4,	%f20,	%f28
	alignaddrl	%g6,	%g3,	%i6
	andncc	%o3,	%i2,	%g5
	add	%l1,	0x14E4,	%l3
	call	loop_256
	addcc	%o0,	0x1070,	%o5
	fpackfix	%f20,	%f3
	fmovsne	%icc,	%f14,	%f31
loop_256:
	smul	%l2,	%o1,	%i7
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x62] %asi,	%g4
	movrne	%i3,	0x20B,	%o4
	sra	%i1,	0x1E,	%o2
	tleu	%icc,	0x7
	movne	%xcc,	%o6,	%l5
	bvc,a	%icc,	loop_257
	nop
	setx	0x1071B0F5807FDC27,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	nop
	setx	loop_258,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x2046675B,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
loop_257:
	add	%i5,	0x1BA9,	%g2
	movn	%xcc,	%l0,	%i4
loop_258:
	stb	%i0,	[%l7 + 0x38]
	bneg,pt	%icc,	loop_259
	taddcc	%o7,	%l4,	%l6
	movpos	%icc,	%g7,	%g6
	edge8ln	%g3,	%i6,	%o3
loop_259:
	bvc,a	%xcc,	loop_260
	bneg,a	loop_261
	fmovde	%icc,	%f14,	%f17
	fcmpne32	%f10,	%f26,	%i2
loop_260:
	mulx	%g5,	0x1E5D,	%g1
loop_261:
	ldstub	[%l7 + 0x46],	%l1
	edge8n	%l3,	%o5,	%l2
	add	%o1,	%i7,	%o0
	movn	%icc,	%g4,	%i3
	add	%o4,	%o2,	%i1
	addcc	%o6,	%i5,	%l5
	edge32n	%g2,	%i4,	%l0
	sdivcc	%o7,	0x1CB0,	%i0
	fors	%f11,	%f18,	%f5
	tpos	%xcc,	0x4
	bgu	%icc,	loop_262
	fcmpgt16	%f0,	%f8,	%l4
	xor	%g7,	%g6,	%l6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x34] %asi,	%g3
loop_262:
	edge16	%o3,	%i2,	%i6
	sir	0x1AF6
	or	%g1,	0x05EC,	%l1
	bge,a,pn	%xcc,	loop_263
	movvs	%xcc,	%g5,	%l3
	array8	%o5,	%o1,	%l2
	orcc	%o0,	%g4,	%i3
loop_263:
	ta	%icc,	0x0
	movvc	%xcc,	%i7,	%o2
	movg	%icc,	%o4,	%o6
	tge	%icc,	0x7
	movvs	%xcc,	%i1,	%i5
	udivx	%g2,	0x06AD,	%i4
	fmovsl	%xcc,	%f27,	%f31
	tsubcctv	%l0,	%l5,	%o7
	edge16	%l4,	%i0,	%g7
	set	0x30, %l6
	stxa	%g6,	[%l7 + %l6] 0x2f
	membar	#Sync
	fpack16	%f6,	%f19
	array8	%g3,	%l6,	%o3
	set	0x58, %o3
	ldxa	[%l7 + %o3] 0x88,	%i6
	fmovdvc	%xcc,	%f18,	%f8
	mova	%xcc,	%g1,	%l1
	addccc	%i2,	0x0AD4,	%g5
	nop
	setx	0x691DC5A70A992B20,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xA39DE963C1257E0F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f14,	%f8
	edge8n	%o5,	%o1,	%l2
	sllx	%o0,	0x16,	%g4
	sdiv	%i3,	0x11D7,	%l3
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
	array32	%i7,	%o4,	%o2
	edge16ln	%o6,	%i1,	%g2
	tneg	%xcc,	0x5
loop_264:
	orcc	%i5,	%i4,	%l0
	tsubcctv	%o7,	%l5,	%l4
	udiv	%i0,	0x09EB,	%g7
	fmovdge	%xcc,	%f7,	%f8
	fbule,a	%fcc3,	loop_265
	udiv	%g6,	0x01C3,	%l6
	and	%o3,	%i6,	%g3
	tsubcc	%g1,	%i2,	%g5
loop_265:
	tvs	%xcc,	0x0
	wr	%g0,	0x11,	%asi
	stha	%l1,	[%l7 + 0x56] %asi
	movcs	%xcc,	%o1,	%o5
	nop
	setx loop_266, %l0, %l1
	jmpl %l1, %l2
	edge16	%o0,	%g4,	%i3
	tcc	%xcc,	0x4
	andncc	%i7,	%l3,	%o4
loop_266:
	fnegd	%f22,	%f30
	fxor	%f0,	%f22,	%f2
	fpadd16s	%f10,	%f15,	%f30
	nop
	setx	0x704BBCD685CAE754,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x0178A5645A9A1820,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f28,	%f2
	set	0x4B, %i2
	ldsba	[%l7 + %i2] 0x10,	%o2
	tneg	%icc,	0x0
	udiv	%i1,	0x1F3F,	%o6
	stb	%g2,	[%l7 + 0x0B]
	sub	%i5,	%i4,	%l0
	fpsub32s	%f24,	%f21,	%f7
	fbn	%fcc1,	loop_267
	fmovsne	%icc,	%f20,	%f29
	sdivx	%o7,	0x0C8F,	%l5
	orn	%i0,	%l4,	%g6
loop_267:
	subc	%l6,	%g7,	%i6
	udivx	%g3,	0x0D9C,	%g1
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x33] %asi,	%o3
	edge32ln	%g5,	%i2,	%l1
	be	%icc,	loop_268
	smulcc	%o1,	%o5,	%l2
	tgu	%icc,	0x0
	fandnot2	%f24,	%f24,	%f12
loop_268:
	ble,pt	%xcc,	loop_269
	movn	%icc,	%o0,	%g4
	mulx	%i3,	%i7,	%l3
	set	0x0, %o4
	stxa	%o2,	[%g0 + %o4] 0x4f
loop_269:
	fnands	%f1,	%f14,	%f16
	orn	%o4,	%o6,	%g2
	fornot2	%f28,	%f10,	%f14
	movrgz	%i5,	0x2B1,	%i1
	sub	%i4,	%l0,	%l5
	bge,a	loop_270
	srl	%i0,	0x1B,	%o7
	fandnot2	%f26,	%f14,	%f20
	tneg	%icc,	0x1
loop_270:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f10,	%f24
	fnegs	%f12,	%f15
	edge32ln	%l4,	%l6,	%g6
	movgu	%xcc,	%i6,	%g7
	edge16l	%g1,	%g3,	%o3
	mulscc	%i2,	0x1133,	%g5
	movn	%icc,	%o1,	%o5
	fnot2s	%f2,	%f28
	bvc,a,pt	%icc,	loop_271
	tvc	%icc,	0x2
	fmovrslz	%l1,	%f18,	%f21
	movvc	%icc,	%l2,	%o0
loop_271:
	array16	%i3,	%g4,	%i7
	movleu	%icc,	%l3,	%o4
	popc	0x1101,	%o6
	fmovdgu	%icc,	%f28,	%f4
	nop
	setx	loop_272,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%xcc,	0x4
	taddcctv	%g2,	0x0A4D,	%o2
	tcs	%icc,	0x2
loop_272:
	fmovsle	%icc,	%f6,	%f28
	xnorcc	%i5,	0x0FCE,	%i4
	fbl,a	%fcc2,	loop_273
	tcc	%xcc,	0x3
	fands	%f31,	%f16,	%f5
	addcc	%i1,	%l5,	%i0
loop_273:
	fxors	%f3,	%f22,	%f22
	xorcc	%l0,	%o7,	%l4
	lduh	[%l7 + 0x10],	%g6
	tpos	%icc,	0x5
	fmuld8sux16	%f28,	%f5,	%f26
	subc	%i6,	%l6,	%g7
	movcs	%xcc,	%g1,	%g3
	subccc	%o3,	0x00E3,	%i2
	fmovsn	%xcc,	%f5,	%f18
	nop
	setx	loop_274,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%icc,	%g5,	%o5
	edge16l	%o1,	%l1,	%l2
	bpos	%icc,	loop_275
loop_274:
	addc	%i3,	0x10DB,	%o0
	nop
	fitod	%f8,	%f22
	fdtos	%f22,	%f3
	fpadd16s	%f7,	%f25,	%f14
loop_275:
	fbule	%fcc1,	loop_276
	edge32ln	%g4,	%l3,	%i7
	nop
	setx loop_277, %l0, %l1
	jmpl %l1, %o4
	nop
	set	0x0E, %i7
	ldsh	[%l7 + %i7],	%o6
loop_276:
	edge32l	%o2,	%g2,	%i5
	tsubcc	%i4,	0x16FC,	%l5
loop_277:
	umul	%i0,	%l0,	%i1
	edge32	%o7,	%l4,	%i6
	addcc	%g6,	0x0A92,	%g7
	movcc	%xcc,	%l6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f18,	%f26
	array16	%o3,	%g3,	%g5
	mulscc	%o5,	0x1DEB,	%i2
	movrlz	%l1,	%l2,	%o1
	edge16	%o0,	%i3,	%g4
	fmul8sux16	%f20,	%f26,	%f24
	fpadd16	%f12,	%f10,	%f12
	set	0x6C, %o2
	ldsha	[%l7 + %o2] 0x15,	%l3
	fblg,a	%fcc2,	loop_278
	addcc	%i7,	%o6,	%o2
	movcs	%xcc,	%o4,	%i5
	fcmpeq32	%f14,	%f12,	%i4
loop_278:
	fabss	%f12,	%f0
	subccc	%g2,	0x1E99,	%i0
	tle	%icc,	0x7
	fbn	%fcc1,	loop_279
	fmovsle	%icc,	%f24,	%f7
	edge8l	%l5,	%i1,	%o7
	sir	0x1E0A
loop_279:
	and	%l4,	%i6,	%l0
	edge16	%g7,	%g6,	%g1
	sdivcc	%o3,	0x1511,	%l6
	nop
	setx	0xC802BA9EEF4AF690,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x11319100D7539F61,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f18,	%f0
	fble	%fcc2,	loop_280
	subcc	%g3,	%g5,	%o5
	edge16l	%i2,	%l2,	%o1
	movrlz	%l1,	0x3E3,	%o0
loop_280:
	tle	%icc,	0x5
	fpack16	%f28,	%f30
	taddcc	%g4,	%i3,	%i7
	fzero	%f18
	fcmpeq16	%f28,	%f4,	%o6
	movne	%icc,	%l3,	%o2
	bgu,a	loop_281
	xor	%o4,	%i5,	%i4
	fmovdge	%xcc,	%f5,	%f21
	ble	%icc,	loop_282
loop_281:
	xnor	%i0,	0x15D4,	%l5
	prefetch	[%l7 + 0x0C],	 0x2
	array16	%g2,	%o7,	%i1
loop_282:
	edge16n	%l4,	%i6,	%l0
	fands	%f12,	%f21,	%f15
	fexpand	%f10,	%f22
	bcc,pt	%icc,	loop_283
	edge8ln	%g6,	%g1,	%g7
	ldx	[%l7 + 0x20],	%o3
	nop
	setx	0xBF84AF32,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xF8C4E782,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f16,	%f10
loop_283:
	edge16n	%l6,	%g5,	%g3
	smul	%o5,	%l2,	%i2
	fmovrdne	%o1,	%f14,	%f28
	fmovrsne	%l1,	%f24,	%f18
	tcc	%xcc,	0x6
	sllx	%o0,	0x1B,	%i3
	nop
	fitos	%f7,	%f25
	fstox	%f25,	%f0
	fxtos	%f0,	%f11
	subc	%g4,	%i7,	%o6
	fzeros	%f25
	ld	[%l7 + 0x18],	%f26
	fmovscc	%xcc,	%f13,	%f3
	ta	%xcc,	0x6
	edge8n	%l3,	%o2,	%o4
	bvs,a,pt	%xcc,	loop_284
	fcmpne32	%f24,	%f14,	%i4
	movrne	%i5,	%i0,	%l5
	set	0x08, %i5
	ldswa	[%l7 + %i5] 0x10,	%g2
loop_284:
	stbar
	movneg	%icc,	%i1,	%o7
	tle	%icc,	0x4
	fmuld8ulx16	%f16,	%f8,	%f0
	sdiv	%l4,	0x0155,	%l0
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	be,a	%xcc,	loop_285
	fmul8sux16	%f14,	%f20,	%f14
	movneg	%icc,	%i6,	%g1
	sllx	%g6,	%o3,	%l6
loop_285:
	movge	%icc,	%g7,	%g5
	sllx	%o5,	0x06,	%l2
	tcc	%icc,	0x2
	taddcctv	%i2,	0x0BB3,	%o1
	tn	%xcc,	0x1
	xnorcc	%g3,	0x0C7B,	%o0
	movleu	%icc,	%l1,	%g4
	fmuld8ulx16	%f26,	%f23,	%f6
	mulx	%i7,	0x05FC,	%i3
	move	%icc,	%l3,	%o6
	tvs	%xcc,	0x0
	orncc	%o2,	0x0D03,	%o4
	sethi	0x1912,	%i4
	sra	%i0,	%i5,	%g2
	alignaddrl	%i1,	%l5,	%o7
	tleu	%icc,	0x3
	nop
	setx	0x441BB919934CF4FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x9165294B22B83DBB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f18,	%f20
	movrgez	%l0,	0x0C9,	%i6
	movgu	%icc,	%g1,	%l4
	fcmple32	%f14,	%f30,	%o3
	movne	%icc,	%g6,	%g7
	fmovrdlz	%g5,	%f16,	%f0
	fpadd32s	%f4,	%f12,	%f17
	sdiv	%o5,	0x1E09,	%l6
	ta	%xcc,	0x5
	fnors	%f12,	%f27,	%f29
	taddcc	%l2,	0x0686,	%i2
	movn	%icc,	%g3,	%o1
	bn,a,pn	%icc,	loop_286
	movrgz	%l1,	%o0,	%g4
	movcc	%icc,	%i3,	%i7
	nop
	setx	0xE9B600B6E1FFC43C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x196A44E881AB6ED7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f16,	%f10
loop_286:
	fbl	%fcc1,	loop_287
	movrlz	%o6,	%o2,	%o4
	fmovscc	%xcc,	%f4,	%f0
	fmovrdlz	%l3,	%f2,	%f28
loop_287:
	orn	%i0,	%i4,	%g2
	brz,a	%i1,	loop_288
	nop
	fitod	%f6,	%f28
	fdtoi	%f28,	%f29
	fpsub32s	%f31,	%f11,	%f9
	ldx	[%l7 + 0x70],	%i5
loop_288:
	fbuge	%fcc1,	loop_289
	edge8ln	%o7,	%l5,	%i6
	ldstub	[%l7 + 0x15],	%l0
	nop
	setx loop_290, %l0, %l1
	jmpl %l1, %l4
loop_289:
	mulx	%g1,	0x10A5,	%o3
	movrne	%g7,	0x18A,	%g5
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%g6
loop_290:
	ldub	[%l7 + 0x2B],	%o5
	edge8l	%l2,	%l6,	%i2
	ldd	[%l7 + 0x18],	%g2
	fmovsl	%icc,	%f10,	%f27
	nop
	setx loop_291, %l0, %l1
	jmpl %l1, %l1
	nop
	setx	0x6B268C9BA3A64DAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f18
	xorcc	%o1,	0x1854,	%g4
	move	%icc,	%i3,	%i7
loop_291:
	fmovrdne	%o6,	%f8,	%f4
	edge8ln	%o2,	%o4,	%l3
	array8	%i0,	%i4,	%g2
	nop
	setx	0x2A32AFA9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x55020E78,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f30,	%f27
	fba	%fcc0,	loop_292
	fsrc1s	%f18,	%f30
	fmovdvc	%xcc,	%f29,	%f22
	movrne	%o0,	%i5,	%i1
loop_292:
	fbge,a	%fcc0,	loop_293
	and	%l5,	0x1B9E,	%i6
	edge32n	%o7,	%l4,	%l0
	nop
	fitos	%f0,	%f25
	fstox	%f25,	%f6
	fxtos	%f6,	%f22
loop_293:
	udiv	%o3,	0x19B8,	%g1
	bne,a	loop_294
	edge8ln	%g7,	%g5,	%g6
	tl	%icc,	0x7
	addc	%l2,	0x1B7F,	%o5
loop_294:
	sub	%l6,	0x1740,	%g3
	te	%icc,	0x6
	movgu	%xcc,	%i2,	%l1
	nop
	setx	0x39B5AF2C23B0759D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x51428335D491C7E4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f6,	%f22
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0xf0
	membar	#Sync
	fcmpeq32	%f4,	%f6,	%g4
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x48] %asi,	%o1
	movl	%icc,	%i3,	%o6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%o4
	edge32ln	%i7,	%l3,	%i4
	fmovdle	%xcc,	%f2,	%f15
	movvs	%icc,	%g2,	%o0
	mulscc	%i5,	%i1,	%l5
	bg,a,pn	%icc,	loop_295
	tge	%icc,	0x7
	sth	%i0,	[%l7 + 0x32]
	nop
	fitos	%f12,	%f10
	fstod	%f10,	%f12
loop_295:
	prefetch	[%l7 + 0x50],	 0x0
	ta	%icc,	0x3
	orn	%i6,	%l4,	%l0
	fnegd	%f4,	%f16
	fcmpgt16	%f6,	%f0,	%o3
	orn	%o7,	%g1,	%g7
	nop
	setx	0xB6D0D128,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x21F8131A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f6,	%f8
	tpos	%xcc,	0x2
	sethi	0x084E,	%g6
	sdiv	%l2,	0x0C82,	%o5
	fbg,a	%fcc3,	loop_296
	fmovdn	%icc,	%f28,	%f29
	fmovdl	%xcc,	%f30,	%f16
	array8	%l6,	%g3,	%g5
loop_296:
	fmovse	%icc,	%f27,	%f31
	fmul8sux16	%f30,	%f4,	%f12
	andn	%l1,	0x13EC,	%g4
	fmovrsgez	%o1,	%f21,	%f29
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x20] %asi,	%i3
	orn	%i2,	0x1DBD,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg,a	%fcc3,	loop_297
	orncc	%o6,	%i7,	%l3
	mova	%xcc,	%i4,	%g2
	fandnot2s	%f24,	%f25,	%f20
loop_297:
	ldsw	[%l7 + 0x38],	%o4
	nop
	setx	0xC5AB4B54F935F76E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x4814009D4C4B492C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f8,	%f24
	sdivcc	%o0,	0x0AFC,	%i5
	ta	%icc,	0x0
	tn	%icc,	0x7
	movleu	%xcc,	%l5,	%i0
	movcs	%icc,	%i1,	%l4
	edge8ln	%i6,	%o3,	%l0
	array8	%o7,	%g7,	%g1
	fmovdpos	%xcc,	%f2,	%f8
	taddcc	%l2,	0x0C35,	%g6
	or	%o5,	%g3,	%g5
	movn	%icc,	%l6,	%l1
	ta	%icc,	0x4
	fmovsne	%xcc,	%f11,	%f17
	sra	%g4,	%o1,	%i3
	fnot1s	%f10,	%f13
	sethi	0x1A0F,	%i2
	movl	%icc,	%o2,	%i7
	tneg	%icc,	0x3
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o6
	fmovsvs	%xcc,	%f13,	%f13
	fxnor	%f12,	%f16,	%f28
	edge32	%l3,	%g2,	%i4
	te	%icc,	0x1
	nop
	setx	0x442B7822EEDFC288,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x98DE4FA5CC31F847,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f12,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f13,	%f5
	fstox	%f5,	%f24
	fxtos	%f24,	%f5
	array16	%o4,	%i5,	%o0
	fpsub32s	%f28,	%f3,	%f1
	fmul8x16al	%f15,	%f10,	%f20
	bl,a,pn	%icc,	loop_298
	ldd	[%l7 + 0x50],	%i0
	fpadd16	%f14,	%f30,	%f30
	edge8ln	%i1,	%l5,	%i6
loop_298:
	movrne	%l4,	0x3E5,	%o3
	lduw	[%l7 + 0x48],	%l0
	fba,a	%fcc0,	loop_299
	tvs	%icc,	0x4
	fmovdneg	%xcc,	%f4,	%f31
	fmul8sux16	%f30,	%f14,	%f18
loop_299:
	bl,a	loop_300
	fbg,a	%fcc0,	loop_301
	movne	%xcc,	%g7,	%o7
	bl,a	loop_302
loop_300:
	sllx	%g1,	0x04,	%l2
loop_301:
	nop
	set	0x29, %g6
	lduba	[%l7 + %g6] 0x18,	%o5
loop_302:
	movvs	%xcc,	%g6,	%g3
	array16	%g5,	%l6,	%l1
	addcc	%o1,	%i3,	%i2
	tcc	%icc,	0x7
	mova	%xcc,	%g4,	%o2
	tneg	%icc,	0x0
	array8	%i7,	%l3,	%o6
	bleu,pn	%icc,	loop_303
	fbl,a	%fcc1,	loop_304
	movle	%icc,	%g2,	%i4
	movrne	%o4,	0x0A7,	%o0
loop_303:
	sub	%i5,	%i1,	%i0
loop_304:
	taddcctv	%i6,	0x0619,	%l5
	orncc	%l4,	0x10FF,	%o3
	set	0x70, %o5
	lda	[%l7 + %o5] 0x11,	%f11
	taddcctv	%g7,	0x086B,	%o7
	xnorcc	%g1,	0x1DA6,	%l2
	umul	%o5,	%g6,	%l0
	fbul	%fcc2,	loop_305
	fnand	%f20,	%f6,	%f30
	srax	%g5,	0x08,	%g3
	fpadd16s	%f10,	%f10,	%f23
loop_305:
	srlx	%l6,	0x0A,	%o1
	tsubcc	%l1,	0x1040,	%i2
	movrlez	%g4,	0x3B5,	%i3
	fmovrdgz	%o2,	%f6,	%f22
	membar	0x46
	bpos	loop_306
	nop
	setx	0x282EC9168D41AA69,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f30
	edge32l	%l3,	%o6,	%g2
	fabss	%f14,	%f25
loop_306:
	fmovsleu	%icc,	%f3,	%f7
	movrgz	%i4,	0x118,	%o4
	brz	%i7,	loop_307
	fmovdvc	%xcc,	%f30,	%f10
	nop
	setx	0xB6A5FBF25045AA4E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fsrc2	%f10,	%f2
loop_307:
	addc	%i5,	%i1,	%i0
	set	0x30, %l1
	stba	%o0,	[%l7 + %l1] 0x88
	tleu	%xcc,	0x1
	edge16ln	%l5,	%i6,	%l4
	taddcc	%g7,	%o3,	%o7
	movrlz	%g1,	%l2,	%o5
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f8
	fxtod	%f8,	%f12
	tneg	%icc,	0x3
	bcc,a,pn	%icc,	loop_308
	tpos	%xcc,	0x3
	movne	%icc,	%l0,	%g5
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_308:
	fmovrslez	%g3,	%f6,	%f25
	fpack16	%f14,	%f19
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g6,	%l6,	%l1
	tl	%icc,	0x4
	tleu	%icc,	0x7
	nop
	fitod	%f2,	%f26
	fdtoi	%f26,	%f5
	ba,a	%xcc,	loop_309
	array32	%o1,	%i2,	%i3
	xnorcc	%o2,	0x0976,	%g4
	edge8ln	%l3,	%o6,	%g2
loop_309:
	movgu	%xcc,	%o4,	%i4
	sll	%i7,	0x14,	%i1
	st	%f28,	[%l7 + 0x74]
	nop
	setx	0x5ABBE33D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x8E694E8D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f26,	%f9
	fxor	%f6,	%f4,	%f14
	wr	%g0,	0x81,	%asi
	stha	%i0,	[%l7 + 0x50] %asi
	fone	%f22
	fandnot2s	%f15,	%f20,	%f18
	edge16ln	%o0,	%i5,	%i6
	fnand	%f0,	%f2,	%f22
	nop
	setx	loop_310,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x60],	%l4
	sdivx	%g7,	0x0280,	%o3
	movcc	%xcc,	%l4,	%g1
loop_310:
	sllx	%o7,	0x03,	%l2
	tl	%icc,	0x6
	fxor	%f22,	%f24,	%f26
	fors	%f19,	%f9,	%f17
	nop
	setx	0xDCF3D57A2DCDC5B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x9BBEB97890B70EDC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f24,	%f26
	movrne	%l0,	%o5,	%g3
	ldd	[%l7 + 0x70],	%f14
	xorcc	%g6,	%l6,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%g5,	loop_311
	orn	%i2,	%o1,	%i3
	edge32l	%g4,	%o2,	%o6
	or	%g2,	%o4,	%i4
loop_311:
	fmovscc	%xcc,	%f18,	%f4
	movne	%icc,	%i7,	%l3
	fmovrdlz	%i1,	%f14,	%f22
	brz,a	%o0,	loop_312
	movne	%icc,	%i0,	%i6
	flush	%l7 + 0x28
	sub	%i5,	%l5,	%o3
loop_312:
	smulcc	%l4,	0x00D7,	%g1
	edge8ln	%g7,	%o7,	%l2
	fbn,a	%fcc2,	loop_313
	pdist	%f6,	%f4,	%f2
	xnorcc	%l0,	0x1A2C,	%o5
	movneg	%xcc,	%g3,	%g6
loop_313:
	swap	[%l7 + 0x70],	%l1
	flush	%l7 + 0x68
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g5,	%i2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%l6
	move	%xcc,	%i3,	%g4
	ta	%xcc,	0x5
	st	%f15,	[%l7 + 0x54]
	fmovsvc	%xcc,	%f31,	%f4
	fmovrdgez	%o6,	%f20,	%f0
	sllx	%g2,	0x10,	%o2
	swap	[%l7 + 0x74],	%i4
	alignaddrl	%o4,	%l3,	%i1
	edge32ln	%i7,	%i0,	%i6
	ta	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x60] %asi,	%i5
	addc	%o0,	%o3,	%l4
	ldsh	[%l7 + 0x26],	%l5
	movl	%icc,	%g7,	%g1
	udiv	%o7,	0x1942,	%l2
	fmovscc	%icc,	%f0,	%f27
	nop
	setx loop_314, %l0, %l1
	jmpl %l1, %l0
	add	%o5,	%g3,	%l1
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x1A] %asi,	%g5
loop_314:
	sdivx	%g6,	0x1373,	%i2
	edge8n	%o1,	%l6,	%g4
	edge8l	%o6,	%g2,	%o2
	ldstub	[%l7 + 0x2F],	%i4
	set	0x54, %g4
	stwa	%i3,	[%l7 + %g4] 0xeb
	membar	#Sync
	taddcc	%o4,	%i1,	%l3
	fandnot1	%f0,	%f8,	%f14
	movrne	%i7,	0x32C,	%i0
	tcs	%xcc,	0x5
	nop
	setx	0x00D6E7E5E9816D68,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f28
	bleu,pn	%icc,	loop_315
	edge32	%i5,	%i6,	%o0
	ta	%icc,	0x2
	umul	%l4,	0x0459,	%o3
loop_315:
	tleu	%xcc,	0x6
	set	0x38, %l2
	lduwa	[%l7 + %l2] 0x04,	%l5
	subccc	%g7,	%o7,	%l2
	movn	%icc,	%g1,	%o5
	andn	%l0,	%l1,	%g5
	edge16	%g3,	%g6,	%i2
	edge32	%o1,	%l6,	%g4
	or	%o6,	0x01F3,	%o2
	udivcc	%i4,	0x00AA,	%i3
	nop
	fitod	%f8,	%f8
	tneg	%xcc,	0x4
	sra	%o4,	0x10,	%g2
	tsubcc	%i1,	%i7,	%l3
	umul	%i0,	%i5,	%i6
	nop
	setx	0xEE2D7344,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x1938B04B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f22,	%f3
	tge	%icc,	0x0
	swap	[%l7 + 0x24],	%o0
	fpadd16s	%f13,	%f15,	%f4
	brnz	%o3,	loop_316
	edge32n	%l5,	%g7,	%o7
	st	%f6,	[%l7 + 0x08]
	edge16l	%l4,	%g1,	%l2
loop_316:
	fbg,a	%fcc3,	loop_317
	popc	%o5,	%l0
	tg	%icc,	0x6
	movne	%icc,	%g5,	%g3
loop_317:
	edge16ln	%g6,	%l1,	%o1
	ta	%xcc,	0x7
	movre	%l6,	%g4,	%o6
	popc	0x1E3D,	%o2
	edge16n	%i2,	%i4,	%i3
	edge32l	%g2,	%i1,	%o4
	movcc	%xcc,	%l3,	%i0
	movcs	%icc,	%i7,	%i5
	fmovdl	%xcc,	%f31,	%f28
	movpos	%xcc,	%i6,	%o0
	movleu	%xcc,	%l5,	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x19,	%o7,	%l4
	smulcc	%g1,	%l2,	%o3
	fbg,a	%fcc2,	loop_318
	fmul8x16	%f5,	%f16,	%f0
	fmovsvs	%icc,	%f17,	%f5
	fbug,a	%fcc0,	loop_319
loop_318:
	alignaddr	%l0,	%o5,	%g3
	edge16l	%g5,	%g6,	%l1
	bleu,a,pt	%icc,	loop_320
loop_319:
	taddcctv	%l6,	%g4,	%o6
	sra	%o2,	0x17,	%o1
	xnorcc	%i4,	0x0479,	%i3
loop_320:
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f24
	fxtod	%f24,	%f24
	tge	%icc,	0x6
	tl	%icc,	0x3
	fbule,a	%fcc3,	loop_321
	edge8ln	%g2,	%i1,	%i2
	movleu	%xcc,	%l3,	%i0
	movvc	%icc,	%o4,	%i7
loop_321:
	nop
	setx	loop_322,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%i6,	0x0949,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f20,	%f28
loop_322:
	membar	0x69
	fabsd	%f30,	%f18
	be	%icc,	loop_323
	bcs,a,pn	%xcc,	loop_324
	nop
	setx	loop_325,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd32s	%f27,	%f15,	%f12
loop_323:
	nop
	set	0x10, %l5
	ldsw	[%l7 + %l5],	%l5
loop_324:
	subc	%i5,	%g7,	%o7
loop_325:
	nop
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x30] %asi,	%l4
	bneg,pt	%xcc,	loop_326
	andcc	%l2,	%o3,	%l0
	edge32l	%g1,	%o5,	%g3
	edge16l	%g5,	%g6,	%l6
loop_326:
	movrlz	%g4,	0x116,	%o6
	bl	%icc,	loop_327
	taddcc	%o2,	0x0E86,	%o1
	movrlez	%l1,	%i3,	%i4
	movvs	%icc,	%i1,	%g2
loop_327:
	tgu	%icc,	0x5
	smul	%l3,	%i0,	%i2
	edge16ln	%o4,	%i6,	%i7
	fble	%fcc3,	loop_328
	nop
	setx	0x5F62A58263EEF859,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA4FB34D44E624E37,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f16,	%f22
	set	0x2C, %l0
	ldswa	[%l7 + %l0] 0x88,	%l5
loop_328:
	bl,a,pt	%icc,	loop_329
	mulx	%i5,	%o0,	%o7
	udiv	%g7,	0x0931,	%l4
	fmovrsgez	%l2,	%f15,	%f10
loop_329:
	tvs	%icc,	0x6
	bpos	%xcc,	loop_330
	movvs	%icc,	%l0,	%g1
	movgu	%icc,	%o3,	%o5
	fmul8sux16	%f26,	%f12,	%f18
loop_330:
	edge32	%g3,	%g6,	%g5
	tgu	%xcc,	0x2
	fcmpne32	%f16,	%f4,	%g4
	fbuge,a	%fcc2,	loop_331
	addcc	%o6,	0x0BBF,	%l6
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x55] %asi,	%o1
loop_331:
	tcc	%icc,	0x0
	bleu	loop_332
	movrlz	%l1,	0x31E,	%i3
	nop
	set	0x77, %g3
	stb	%o2,	[%l7 + %g3]
	sllx	%i4,	%g2,	%l3
loop_332:
	tvc	%icc,	0x1
	membar	0x5B
	edge8	%i1,	%i0,	%o4
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	stx	%i6,	[%l7 + 0x18]
	subcc	%l5,	%i7,	%o0
	edge32n	%o7,	%g7,	%i5
	wr	%g0,	0xe2,	%asi
	stxa	%l2,	[%l7 + 0x60] %asi
	membar	#Sync
	xor	%l0,	0x1A2A,	%g1
	array8	%o3,	%l4,	%o5
	fmovdne	%xcc,	%f19,	%f20
	edge32ln	%g6,	%g3,	%g4
	fornot1s	%f17,	%f3,	%f5
	brgz	%o6,	loop_333
	taddcctv	%g5,	0x16A3,	%l6
	nop
	setx	loop_334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stw	%o1,	[%l7 + 0x68]
loop_333:
	tle	%xcc,	0x2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o2
loop_334:
	orn	%l1,	0x0F59,	%g2
	xor	%l3,	0x14DF,	%i1
	movcc	%xcc,	%i0,	%o4
	bn,pn	%xcc,	loop_335
	smul	%i4,	0x1DF6,	%i2
	subccc	%l5,	%i7,	%i6
	brgez	%o7,	loop_336
loop_335:
	ble	%xcc,	loop_337
	ldsb	[%l7 + 0x13],	%o0
	umul	%g7,	0x0699,	%i5
loop_336:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_337:
	bneg,a,pt	%xcc,	loop_338
	fbul,a	%fcc0,	loop_339
	edge16n	%l2,	%g1,	%o3
	tneg	%icc,	0x7
loop_338:
	prefetch	[%l7 + 0x70],	 0x2
loop_339:
	sethi	0x04CB,	%l4
	call	loop_340
	add	%o5,	%g6,	%l0
	tvs	%icc,	0x7
	fbg	%fcc0,	loop_341
loop_340:
	orcc	%g4,	%o6,	%g5
	orcc	%g3,	0x1F9B,	%l6
	fand	%f24,	%f12,	%f0
loop_341:
	mulscc	%i3,	0x126F,	%o2
	movle	%icc,	%l1,	%o1
	bshuffle	%f18,	%f10,	%f2
	movl	%icc,	%g2,	%l3
	bgu,pt	%xcc,	loop_342
	tvc	%icc,	0x6
	srax	%i1,	0x1E,	%o4
	movvs	%icc,	%i4,	%i2
loop_342:
	srl	%l5,	%i7,	%i0
	array32	%i6,	%o0,	%o7
	tpos	%icc,	0x3
	sdivcc	%g7,	0x11BA,	%l2
	fbul	%fcc1,	loop_343
	nop
	fitos	%f3,	%f25
	fstoi	%f25,	%f29
	lduw	[%l7 + 0x6C],	%i5
	sdivx	%o3,	0x06C6,	%l4
loop_343:
	edge8l	%g1,	%o5,	%g6
	or	%l0,	%o6,	%g4
	edge16l	%g5,	%g3,	%l6
	addcc	%o2,	0x0F70,	%i3
	fbue	%fcc3,	loop_344
	fsrc2	%f14,	%f4
	mova	%xcc,	%o1,	%g2
	ldx	[%l7 + 0x20],	%l3
loop_344:
	tsubcctv	%l1,	0x1209,	%o4
	movge	%icc,	%i1,	%i2
	tge	%icc,	0x0
	array16	%i4,	%l5,	%i7
	srl	%i0,	0x14,	%i6
	fmovdvc	%xcc,	%f14,	%f10
	set	0x78, %o0
	swapa	[%l7 + %o0] 0x04,	%o0
	movcs	%xcc,	%o7,	%g7
	bvs,a,pn	%xcc,	loop_345
	movgu	%icc,	%l2,	%o3
	addc	%l4,	0x0CFB,	%i5
	sir	0x0033
loop_345:
	movpos	%icc,	%o5,	%g1
	nop
	setx loop_346, %l0, %l1
	jmpl %l1, %g6
	nop
	setx	loop_347,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%l0,	%o6,	%g5
	xnor	%g4,	%g3,	%l6
loop_346:
	lduh	[%l7 + 0x54],	%o2
loop_347:
	movcc	%xcc,	%i3,	%g2
	fblg,a	%fcc2,	loop_348
	nop
	fitos	%f6,	%f4
	fstod	%f4,	%f28
	subcc	%o1,	0x0C80,	%l3
	movrne	%o4,	%i1,	%l1
loop_348:
	movrlz	%i2,	%l5,	%i4
	wr	%g0,	0x2f,	%asi
	stha	%i7,	[%l7 + 0x16] %asi
	membar	#Sync
	stx	%i0,	[%l7 + 0x48]
	array8	%o0,	%o7,	%i6
	sub	%l2,	0x0273,	%o3
	movcs	%xcc,	%g7,	%i5
	fmovsg	%icc,	%f31,	%f2
	movrlez	%l4,	0x32E,	%g1
	smul	%g6,	%l0,	%o6
	edge16	%g5,	%g4,	%o5
	fmovrdlez	%l6,	%f0,	%f30
	edge32	%o2,	%g3,	%i3
	addccc	%o1,	%l3,	%o4
	fandnot1	%f26,	%f6,	%f0
	fbo	%fcc2,	loop_349
	tcs	%icc,	0x1
	sllx	%i1,	0x00,	%g2
	tsubcc	%i2,	%l5,	%i4
loop_349:
	bne,a	loop_350
	edge32	%l1,	%i7,	%o0
	orn	%i0,	0x04B2,	%i6
	srlx	%l2,	0x06,	%o3
loop_350:
	move	%icc,	%o7,	%g7
	ta	%icc,	0x0
	subccc	%i5,	%l4,	%g1
	movrlez	%g6,	%o6,	%g5
	stw	%l0,	[%l7 + 0x64]
	fbge	%fcc2,	loop_351
	stw	%o5,	[%l7 + 0x38]
	fmovdne	%icc,	%f20,	%f19
	and	%g4,	%l6,	%g3
loop_351:
	fnands	%f11,	%f18,	%f28
	nop
	setx	0x0D5211A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x08C0F57F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f8,	%f27
	edge8ln	%i3,	%o2,	%l3
	movcs	%icc,	%o1,	%i1
	add	%o4,	0x0AB0,	%g2
	movrgez	%l5,	%i4,	%i2
	set	0x0C, %g7
	stwa	%l1,	[%l7 + %g7] 0x2b
	membar	#Sync
	nop
	setx	0xE17A301AE0560F29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	bvs,pt	%xcc,	loop_352
	sra	%i7,	%o0,	%i6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_352:
	movl	%icc,	%i0,	%o3
	fxnors	%f3,	%f24,	%f29
	smulcc	%l2,	%g7,	%o7
	orncc	%i5,	%g1,	%l4
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x6A] %asi,	%o6
	fmovde	%xcc,	%f31,	%f9
	movpos	%xcc,	%g5,	%g6
	movcc	%icc,	%o5,	%l0
	pdist	%f8,	%f24,	%f2
	edge8ln	%g4,	%g3,	%l6
	tvs	%xcc,	0x0
	movleu	%xcc,	%i3,	%o2
	edge8n	%l3,	%i1,	%o4
	movrlez	%g2,	%l5,	%i4
	movvc	%icc,	%o1,	%i2
	taddcc	%l1,	%i7,	%i6
	sethi	0x11D3,	%i0
	edge16l	%o0,	%o3,	%l2
	tvc	%xcc,	0x0
	te	%icc,	0x3
	subcc	%o7,	%i5,	%g1
	fandnot2s	%f9,	%f25,	%f16
	smul	%g7,	%o6,	%l4
	brlz	%g5,	loop_353
	fmul8x16au	%f22,	%f2,	%f8
	edge8n	%g6,	%l0,	%g4
	fmovrsne	%o5,	%f21,	%f0
loop_353:
	tsubcc	%l6,	%g3,	%o2
	tg	%icc,	0x6
	tsubcc	%i3,	0x04BD,	%l3
	fmuld8sux16	%f13,	%f29,	%f22
	tsubcc	%o4,	0x07F4,	%i1
	edge8l	%l5,	%g2,	%o1
	subc	%i2,	%l1,	%i7
	ldsb	[%l7 + 0x0D],	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i6,	0x1A44,	%o0
	xnor	%i0,	%o3,	%l2
	udivx	%i5,	0x02C1,	%g1
	bl,pn	%xcc,	loop_354
	movn	%xcc,	%g7,	%o7
	movrlz	%o6,	0x230,	%g5
	subccc	%g6,	%l0,	%g4
loop_354:
	subccc	%o5,	%l4,	%g3
	movcs	%icc,	%o2,	%i3
	bvs	%icc,	loop_355
	sdiv	%l6,	0x05AD,	%l3
	sra	%i1,	%l5,	%o4
	fcmpne16	%f12,	%f22,	%o1
loop_355:
	nop
	wr	%g0,	0x81,	%asi
	stxa	%g2,	[%l7 + 0x50] %asi
	edge32l	%i2,	%i7,	%i4
	sll	%i6,	0x0B,	%o0
	orncc	%l1,	0x0884,	%o3
	andn	%i0,	%l2,	%g1
	sra	%i5,	%g7,	%o7
	brlez	%o6,	loop_356
	edge8n	%g5,	%l0,	%g6
	array8	%o5,	%l4,	%g3
	movrne	%g4,	%o2,	%l6
loop_356:
	movleu	%xcc,	%l3,	%i3
	smul	%l5,	%i1,	%o1
	fmovrdgz	%o4,	%f14,	%f28
	nop
	setx	0x28B43DA53E211E50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xD411F25480E7B376,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f16,	%f12
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i2
	fbg,a	%fcc3,	loop_357
	bcc,a	loop_358
	fnand	%f26,	%f2,	%f30
	nop
	setx	0x843F44CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xE7F15267,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f8,	%f28
loop_357:
	alignaddrl	%i7,	%i4,	%g2
loop_358:
	alignaddrl	%o0,	%i6,	%l1
	fpsub16	%f20,	%f4,	%f14
	nop
	setx	loop_359,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%i0,	%o3,	%l2
	movl	%icc,	%g1,	%i5
	edge16	%g7,	%o6,	%g5
loop_359:
	edge16ln	%l0,	%o7,	%g6
	fornot1s	%f13,	%f4,	%f27
	set	0x18, %i1
	stwa	%o5,	[%l7 + %i1] 0x10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l4,	%g4
	edge16ln	%g3,	%o2,	%l3
	tvs	%xcc,	0x5
	tleu	%icc,	0x0
	smul	%l6,	0x00BF,	%i3
	tl	%xcc,	0x3
	fmovdl	%xcc,	%f5,	%f13
	swap	[%l7 + 0x54],	%l5
	umulcc	%i1,	0x0E10,	%o1
	prefetch	[%l7 + 0x1C],	 0x0
	fandnot2	%f22,	%f18,	%f4
	movcs	%icc,	%o4,	%i7
	fbule	%fcc0,	loop_360
	xnorcc	%i4,	%i2,	%g2
	mulscc	%i6,	0x0A43,	%o0
	fmovd	%f10,	%f26
loop_360:
	fzero	%f16
	wr	%g0,	0xea,	%asi
	stwa	%i0,	[%l7 + 0x44] %asi
	membar	#Sync
	movgu	%xcc,	%l1,	%l2
	fnor	%f2,	%f16,	%f10
	andncc	%o3,	%i5,	%g1
	set	0x34, %o7
	swapa	[%l7 + %o7] 0x88,	%g7
	tge	%xcc,	0x0
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f22
	udivx	%g5,	0x03A2,	%o6
	fbug,a	%fcc3,	loop_361
	tn	%xcc,	0x4
	lduw	[%l7 + 0x2C],	%o7
	edge8n	%g6,	%o5,	%l4
loop_361:
	nop
	setx	loop_362,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%icc,	0x7
	movg	%icc,	%l0,	%g4
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_362:
	movneg	%icc,	%g3,	%o2
	sir	0x19E4
	stx	%l6,	[%l7 + 0x30]
	fbne,a	%fcc3,	loop_363
	fornot1	%f24,	%f18,	%f6
	tgu	%icc,	0x4
	array32	%l3,	%l5,	%i1
loop_363:
	xor	%i3,	%o1,	%o4
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x4E] %asi,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f10,	%f12,	%f0
	fbuge	%fcc2,	loop_364
	sub	%i2,	0x0FCA,	%i7
	ldsb	[%l7 + 0x12],	%g2
	tleu	%xcc,	0x7
loop_364:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	andn	%i0,	%l1,	%l2
	mulx	%o3,	0x0EEB,	%i5
	fnot1	%f8,	%f2
	tsubcc	%g1,	0x0FA6,	%i6
	nop
	set	0x63, %g2
	stb	%g5,	[%l7 + %g2]
	udiv	%o6,	0x06FB,	%g7
	wr	%g0,	0x2a,	%asi
	stha	%g6,	[%l7 + 0x78] %asi
	membar	#Sync
	fbg	%fcc2,	loop_365
	fabsd	%f18,	%f20
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o5
loop_365:
	andncc	%o7,	%l0,	%g4
	bcc,pn	%icc,	loop_366
	tcs	%icc,	0x7
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_366:
	edge32ln	%g3,	%l4,	%l6
	brgez	%o2,	loop_367
	stbar
	orncc	%l5,	0x064F,	%l3
	array16	%i3,	%o1,	%o4
loop_367:
	movrlz	%i1,	%i4,	%i7
	brz	%g2,	loop_368
	taddcc	%o0,	%i0,	%i2
	movl	%icc,	%l2,	%l1
	sub	%o3,	0x055A,	%g1
loop_368:
	fmovsvs	%xcc,	%f16,	%f9
	smul	%i6,	%g5,	%o6
	move	%icc,	%g7,	%g6
	tneg	%icc,	0x7
	fnot2	%f18,	%f2
	tleu	%xcc,	0x5
	popc	0x140A,	%o5
	nop
	setx	loop_369,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0xB85A8FBC404E9A36,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	edge32ln	%i5,	%o7,	%g4
	addc	%l0,	%l4,	%l6
loop_369:
	tg	%icc,	0x0
	set	0x26, %i0
	stha	%o2,	[%l7 + %i0] 0xe2
	membar	#Sync
	nop
	setx	0x94B814F5905B14A4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	orn	%l5,	%g3,	%i3
	st	%f15,	[%l7 + 0x20]
	fbue,a	%fcc3,	loop_370
	movvs	%xcc,	%o1,	%o4
	taddcc	%i1,	0x0682,	%l3
	ldx	[%l7 + 0x08],	%i7
loop_370:
	movrne	%i4,	%g2,	%o0
	or	%i2,	0x09BA,	%l2
	tvs	%icc,	0x3
	ldstub	[%l7 + 0x70],	%l1
	tvc	%xcc,	0x3
	xor	%i0,	%o3,	%i6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	tle	%xcc,	0x2
	movrgz	%o6,	0x3AA,	%g1
	sdivcc	%g6,	0x0CBD,	%o5
	call	loop_371
	andncc	%g7,	%i5,	%g4
	xor	%l0,	%l4,	%o7
	fone	%f12
loop_371:
	fmul8ulx16	%f24,	%f20,	%f10
	addccc	%o2,	0x018C,	%l6
	bl,a	loop_372
	ta	%xcc,	0x0
	addcc	%g3,	0x1862,	%i3
	nop
	setx	0x12564690,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f25
loop_372:
	addc	%l5,	0x02D6,	%o1
	smul	%o4,	%i1,	%i7
	movl	%xcc,	%l3,	%g2
	tle	%xcc,	0x4
	movl	%xcc,	%i4,	%i2
	smul	%l2,	%l1,	%i0
	array16	%o3,	%o0,	%g5
	addc	%i6,	%g1,	%g6
	smulcc	%o6,	0x1C93,	%o5
	fpmerge	%f21,	%f6,	%f2
	movne	%icc,	%i5,	%g7
	sdivcc	%l0,	0x1295,	%g4
	fsrc2	%f28,	%f26
	move	%icc,	%l4,	%o2
	xnor	%o7,	%l6,	%i3
	set	0x38, %l4
	stwa	%l5,	[%l7 + %l4] 0xeb
	membar	#Sync
	fmovdneg	%xcc,	%f15,	%f20
	fpsub32	%f10,	%f24,	%f22
	movcs	%xcc,	%o1,	%o4
	nop
	fitos	%f6,	%f2
	fstod	%f2,	%f22
	sra	%g3,	%i7,	%i1
	alignaddr	%g2,	%i4,	%i2
	edge32ln	%l3,	%l2,	%l1
	edge16l	%i0,	%o3,	%g5
	movg	%xcc,	%i6,	%g1
	tpos	%xcc,	0x4
	nop
	fitos	%f9,	%f7
	fstox	%f7,	%f26
	fxtos	%f26,	%f5
	tcc	%icc,	0x1
	ldsb	[%l7 + 0x7C],	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o6,	%o5,	%o0
	wr	%g0,	0x81,	%asi
	sta	%f10,	[%l7 + 0x4C] %asi
	umulcc	%i5,	%l0,	%g7
	movg	%icc,	%g4,	%o2
	movl	%xcc,	%l4,	%o7
	fsrc2	%f6,	%f20
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x7B] %asi,	%l6
	tpos	%xcc,	0x2
	fmovdvs	%xcc,	%f29,	%f26
	srax	%i3,	0x0F,	%o1
	fxors	%f15,	%f24,	%f12
	fmovsgu	%icc,	%f31,	%f5
	tpos	%xcc,	0x5
	movge	%xcc,	%o4,	%g3
	fmovrdlez	%l5,	%f20,	%f6
	membar	0x1F
	bcs,a	%xcc,	loop_373
	movle	%xcc,	%i7,	%i1
	xor	%g2,	0x1B25,	%i4
	fxnor	%f10,	%f6,	%f28
loop_373:
	movgu	%icc,	%l3,	%l2
	mulscc	%i2,	0x03B7,	%l1
	edge8l	%o3,	%i0,	%i6
	tneg	%icc,	0x3
	set	0x34, %g1
	sta	%f8,	[%l7 + %g1] 0x14
	bg,a,pn	%icc,	loop_374
	fbuge,a	%fcc1,	loop_375
	fornot2s	%f12,	%f10,	%f7
	tvc	%icc,	0x6
loop_374:
	sdivcc	%g1,	0x0556,	%g6
loop_375:
	fmovdge	%icc,	%f11,	%f29
	sdiv	%g5,	0x1CB5,	%o6
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x81,	%o0,	%o5
	bl,a	loop_376
	sdiv	%l0,	0x02C6,	%g7
	umulcc	%g4,	%i5,	%o2
	umul	%l4,	%o7,	%i3
loop_376:
	edge8	%l6,	%o4,	%g3
	orncc	%l5,	%o1,	%i1
	fcmpeq16	%f24,	%f24,	%g2
	fpsub16	%f24,	%f16,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc2,	loop_377
	ldsb	[%l7 + 0x11],	%i4
	edge32ln	%i7,	%l2,	%l3
	or	%l1,	0x0093,	%i2
loop_377:
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f2
	fxtod	%f2,	%f10
	set	0x18, %g5
	swapa	[%l7 + %g5] 0x88,	%i0
	subc	%i6,	0x08EA,	%o3
	alignaddr	%g1,	%g6,	%g5
	popc	0x11B7,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x1
	nop
	setx loop_378, %l0, %l1
	jmpl %l1, %o6
	umul	%o5,	0x0795,	%g7
	and	%l0,	%g4,	%i5
	movle	%icc,	%l4,	%o7
loop_378:
	sub	%o2,	0x0538,	%i3
	edge8n	%l6,	%o4,	%g3
	mulscc	%l5,	0x0109,	%o1
	wr	%g0,	0x27,	%asi
	stba	%g2,	[%l7 + 0x66] %asi
	membar	#Sync
	brlz,a	%i1,	loop_379
	fmovdneg	%icc,	%f29,	%f29
	membar	0x4F
	fcmpeq16	%f28,	%f18,	%i4
loop_379:
	fmul8x16al	%f27,	%f2,	%f4
	sir	0x12BF
	orcc	%i7,	0x0C90,	%l2
	nop
	setx	0xCE832B65,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x9C060C1A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f13,	%f28
	fmovsgu	%xcc,	%f16,	%f1
	addc	%l3,	%l1,	%i0
	nop
	setx	0x1BF5449F90717386,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	swap	[%l7 + 0x5C],	%i6
	smul	%i2,	0x0CC5,	%g1
	fpsub32	%f26,	%f18,	%f10
	orncc	%g6,	0x112B,	%g5
	ldx	[%l7 + 0x30],	%o0
	srlx	%o6,	0x0C,	%o3
	xorcc	%o5,	0x00EA,	%g7
	xnor	%g4,	%i5,	%l4
	fornot1	%f2,	%f4,	%f22
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o7
	ldstub	[%l7 + 0x3A],	%l0
	mova	%xcc,	%o2,	%i3
	nop
	setx	0x1A4B8DB0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x190FE215,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f21,	%f16
	fmovsne	%xcc,	%f7,	%f19
	fpsub16s	%f21,	%f30,	%f0
	fnot1	%f2,	%f20
	edge8l	%o4,	%l6,	%l5
	edge8l	%o1,	%g3,	%i1
	brgz,a	%g2,	loop_380
	fmovsle	%xcc,	%f2,	%f16
	for	%f0,	%f16,	%f0
	edge32l	%i7,	%i4,	%l3
loop_380:
	tvc	%xcc,	0x6
	edge32ln	%l1,	%i0,	%i6
	srl	%l2,	0x00,	%g1
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	orncc	%g6,	0x1FDC,	%g5
	nop
	setx	0x80BCCF3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xCB00287B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f28,	%f4
	edge32	%i2,	%o6,	%o0
	sub	%o5,	0x002B,	%g7
	sdivcc	%o3,	0x1426,	%i5
	and	%g4,	0x016E,	%l4
	movvc	%icc,	%o7,	%o2
	movrlz	%i3,	0x115,	%l0
	bge,a	loop_381
	movrgez	%l6,	0x071,	%l5
	fbuge	%fcc2,	loop_382
	fands	%f31,	%f4,	%f14
loop_381:
	fmovse	%xcc,	%f13,	%f20
	brlez	%o4,	loop_383
loop_382:
	fmovrde	%g3,	%f18,	%f6
	movcs	%icc,	%i1,	%o1
	fmovrdlez	%g2,	%f4,	%f0
loop_383:
	nop
	set	0x39, %o6
	lduba	[%l7 + %o6] 0x89,	%i4
	fmovd	%f8,	%f12
	subccc	%l3,	0x18DC,	%i7
	wr	%g0,	0x88,	%asi
	stxa	%i0,	[%l7 + 0x38] %asi
	fzeros	%f19
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
	edge16ln	%l1,	%i6,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f17,	%f3
loop_384:
	addcc	%g6,	%g1,	%g5
	set	0x78, %i6
	sta	%f10,	[%l7 + %i6] 0x19
	ta	%xcc,	0x2
	nop
	setx	loop_385,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnor	%i2,	%o0,	%o5
	sethi	0x10FD,	%o6
	add	%g7,	0x0CD6,	%i5
loop_385:
	udivcc	%g4,	0x0D4D,	%o3
	te	%xcc,	0x0
	fpadd16	%f6,	%f4,	%f28
	fble,a	%fcc1,	loop_386
	membar	0x4D
	stw	%l4,	[%l7 + 0x2C]
	stw	%o2,	[%l7 + 0x24]
loop_386:
	umul	%i3,	%o7,	%l6
	xnorcc	%l5,	%o4,	%g3
	sub	%l0,	0x0A75,	%i1
	xorcc	%o1,	0x03BB,	%i4
	fornot1	%f2,	%f30,	%f6
	sdiv	%g2,	0x1345,	%i7
	edge16ln	%l3,	%i0,	%i6
	sethi	0x150C,	%l2
	sethi	0x05A1,	%l1
	fmovs	%f29,	%f24
	swap	[%l7 + 0x44],	%g6
	ldub	[%l7 + 0x6F],	%g5
	lduw	[%l7 + 0x4C],	%g1
	array8	%o0,	%o5,	%i2
	fmovscc	%xcc,	%f24,	%f28
	edge32	%g7,	%o6,	%g4
	array32	%o3,	%l4,	%i5
	orncc	%i3,	0x0F52,	%o2
	bne,pt	%icc,	loop_387
	subc	%l6,	0x0647,	%l5
	andn	%o4,	0x0E20,	%g3
	xnorcc	%l0,	0x1842,	%o7
loop_387:
	srax	%o1,	0x09,	%i4
	fandnot1s	%f1,	%f0,	%f6
	brlz	%i1,	loop_388
	tge	%icc,	0x2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%l3
loop_388:
	fmovsneg	%icc,	%f12,	%f23
	sdiv	%i7,	0x00E4,	%i6
	ble,a	%xcc,	loop_389
	fbug	%fcc3,	loop_390
	std	%f0,	[%l7 + 0x28]
	nop
	fitos	%f5,	%f11
	fstoi	%f11,	%f7
loop_389:
	fandnot1	%f26,	%f0,	%f6
loop_390:
	fmovrdne	%l2,	%f24,	%f0
	fbule,a	%fcc2,	loop_391
	array32	%l1,	%i0,	%g5
	mova	%xcc,	%g6,	%o0
	bne,pn	%xcc,	loop_392
loop_391:
	addccc	%o5,	0x0555,	%i2
	edge16n	%g1,	%g7,	%o6
	addcc	%o3,	0x19DE,	%l4
loop_392:
	movneg	%icc,	%i5,	%i3
	movrne	%o2,	%l6,	%g4
	fmovsg	%xcc,	%f12,	%f30
	fmovdcc	%icc,	%f30,	%f21
	set	0x14, %o1
	stha	%o4,	[%l7 + %o1] 0x22
	membar	#Sync
	movle	%xcc,	%g3,	%l5
	movl	%xcc,	%l0,	%o7
	fsrc1	%f16,	%f16
	fmovscc	%icc,	%f27,	%f25
	tvs	%icc,	0x2
	array8	%o1,	%i1,	%g2
	addccc	%l3,	0x0E03,	%i7
	array32	%i6,	%i4,	%l2
	sdiv	%l1,	0x0282,	%g5
	orn	%i0,	0x08C6,	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x0c,	%o5,	%o0
	subc	%g1,	%i2,	%o6
	nop
	setx	loop_393,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orcc	%g7,	%l4,	%o3
	tcc	%icc,	0x5
	udivx	%i5,	0x1360,	%o2
loop_393:
	subcc	%i3,	0x1145,	%l6
	fbg	%fcc0,	loop_394
	sth	%g4,	[%l7 + 0x46]
	xorcc	%o4,	%l5,	%l0
	movle	%xcc,	%o7,	%o1
loop_394:
	nop
	set	0x20, %i3
	stxa	%g3,	[%l7 + %i3] 0x89
	tn	%icc,	0x7
	bcs,a,pn	%icc,	loop_395
	umul	%g2,	%l3,	%i7
	array32	%i1,	%i6,	%l2
	fnor	%f28,	%f14,	%f20
loop_395:
	bge	loop_396
	fmovdcc	%xcc,	%f14,	%f26
	fblg	%fcc2,	loop_397
	fors	%f15,	%f27,	%f12
loop_396:
	fmovd	%f26,	%f30
	array16	%l1,	%i4,	%g5
loop_397:
	sdiv	%g6,	0x1346,	%i0
	brz	%o0,	loop_398
	edge16	%o5,	%g1,	%o6
	movneg	%icc,	%g7,	%i2
	bge,pn	%icc,	loop_399
loop_398:
	fones	%f7
	fbug,a	%fcc3,	loop_400
	xorcc	%l4,	%o3,	%i5
loop_399:
	fpadd16	%f24,	%f22,	%f16
	movrne	%o2,	0x2F2,	%l6
loop_400:
	movrlz	%i3,	0x1A0,	%g4
	bneg,a	loop_401
	fbule	%fcc2,	loop_402
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f20
	fxtod	%f20,	%f20
	fmovdcc	%xcc,	%f27,	%f4
loop_401:
	fmovrslez	%o4,	%f5,	%f9
loop_402:
	bpos	%xcc,	loop_403
	sdivx	%l5,	0x0063,	%l0
	fors	%f2,	%f7,	%f8
	subc	%o1,	0x0332,	%o7
loop_403:
	sir	0x041A
	orn	%g2,	0x157D,	%l3
	edge16ln	%i7,	%g3,	%i6
	te	%icc,	0x5
	and	%l2,	%i1,	%i4
	tleu	%icc,	0x4
	bneg,a,pn	%xcc,	loop_404
	nop
	fitos	%f10,	%f9
	fstox	%f9,	%f14
	fxtos	%f14,	%f31
	nop
	fitod	%f23,	%f30
	fbo	%fcc2,	loop_405
loop_404:
	sdiv	%l1,	0x19F8,	%g5
	set	0x0E, %l6
	ldsba	[%l7 + %l6] 0x18,	%i0
loop_405:
	stb	%g6,	[%l7 + 0x36]
	set	0x28, %i4
	swapa	[%l7 + %i4] 0x10,	%o5
	srlx	%o0,	0x1C,	%g1
	andcc	%o6,	0x04B5,	%i2
	movvs	%icc,	%g7,	%o3
	fbule,a	%fcc2,	loop_406
	fbo	%fcc2,	loop_407
	sethi	0x06F9,	%i5
	fmovrdlez	%o2,	%f8,	%f24
loop_406:
	andncc	%l6,	%i3,	%g4
loop_407:
	movrlez	%l4,	0x268,	%l5
	ta	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o4,	%l0,	%o7
	swap	[%l7 + 0x1C],	%g2
	brlz	%o1,	loop_408
	fmovdneg	%icc,	%f30,	%f30
	tvs	%xcc,	0x4
	addccc	%l3,	%g3,	%i6
loop_408:
	tsubcc	%l2,	%i7,	%i4
	fors	%f26,	%f1,	%f17
	brgez,a	%i1,	loop_409
	fornot2	%f16,	%f22,	%f18
	movrgez	%g5,	%l1,	%i0
	andncc	%o5,	%g6,	%o0
loop_409:
	fba,a	%fcc3,	loop_410
	tg	%xcc,	0x3
	set	0x2C, %o3
	ldswa	[%l7 + %o3] 0x89,	%g1
loop_410:
	addcc	%i2,	%o6,	%g7
	edge32	%i5,	%o2,	%l6
	edge8l	%i3,	%g4,	%l4
	xorcc	%l5,	%o4,	%o3
	tle	%icc,	0x4
	fmovdvs	%icc,	%f20,	%f8
	tl	%xcc,	0x4
	fbule,a	%fcc2,	loop_411
	taddcc	%o7,	%l0,	%o1
	fmovrdgz	%g2,	%f6,	%f12
	fpsub32s	%f18,	%f11,	%f4
loop_411:
	xnor	%l3,	0x0EE8,	%i6
	xnor	%l2,	%i7,	%i4
	or	%i1,	%g3,	%g5
	orn	%i0,	0x01EE,	%o5
	bn	%xcc,	loop_412
	fbne,a	%fcc3,	loop_413
	edge16ln	%g6,	%o0,	%l1
	edge32l	%i2,	%g1,	%o6
loop_412:
	nop
	setx	loop_414,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_413:
	addc	%g7,	0x1967,	%o2
	and	%i5,	0x0620,	%l6
	movg	%icc,	%g4,	%i3
loop_414:
	edge8ln	%l4,	%o4,	%l5
	fmovsle	%xcc,	%f30,	%f0
	move	%icc,	%o7,	%o3
	movleu	%icc,	%o1,	%g2
	set	0x33, %i2
	lduba	[%l7 + %i2] 0x11,	%l0
	tcs	%xcc,	0x4
	mova	%icc,	%i6,	%l3
	edge8l	%i7,	%l2,	%i4
	tneg	%xcc,	0x2
	fpsub32	%f0,	%f30,	%f4
	tpos	%icc,	0x5
	fba,a	%fcc2,	loop_415
	bn,pn	%xcc,	loop_416
	bneg,a	loop_417
	bg	%icc,	loop_418
loop_415:
	fmovdg	%xcc,	%f3,	%f14
loop_416:
	nop
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0xf0,	%f0
loop_417:
	tne	%xcc,	0x6
loop_418:
	std	%f14,	[%l7 + 0x50]
	set	0x310, %i7
	nop 	! 	nop 	! 	ldxa	[%g0 + %i7] 0x40,	%g3 ripped by fixASI40.pl ripped by fixASI40.pl
	sdivcc	%i1,	0x15DB,	%g5
	fmovscs	%icc,	%f3,	%f19
	set	0x43, %o2
	lduba	[%l7 + %o2] 0x18,	%i0
	fbu,a	%fcc3,	loop_419
	fmovsneg	%xcc,	%f3,	%f10
	brgz,a	%o5,	loop_420
	movge	%icc,	%g6,	%l1
loop_419:
	fsrc1	%f28,	%f2
	addcc	%o0,	0x12C7,	%g1
loop_420:
	nop
	set	0x42, %l3
	ldsha	[%l7 + %l3] 0x88,	%o6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x18] %asi,	%f23
	sir	0x0786
	nop
	setx	loop_421,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdlz	%i2,	%f10,	%f24
	mova	%icc,	%o2,	%i5
	movpos	%xcc,	%l6,	%g4
loop_421:
	bshuffle	%f20,	%f30,	%f6
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f18
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x74] %asi,	%g7
	array8	%i3,	%o4,	%l4
	movre	%l5,	%o7,	%o3
	te	%icc,	0x2
	fpadd32	%f26,	%f24,	%f16
	movn	%icc,	%o1,	%g2
	array16	%i6,	%l3,	%l0
	ldsb	[%l7 + 0x0C],	%l2
	fmovdvs	%icc,	%f4,	%f30
	sdiv	%i7,	0x09C3,	%i4
	umul	%g3,	0x0932,	%g5
	fabss	%f22,	%f20
	fmuld8sux16	%f12,	%f21,	%f20
	brgz,a	%i0,	loop_422
	addc	%i1,	%o5,	%l1
	umulcc	%g6,	0x1A88,	%o0
	fmovs	%f3,	%f3
loop_422:
	tg	%icc,	0x7
	sdivcc	%o6,	0x1A69,	%g1
	move	%xcc,	%o2,	%i2
	smul	%i5,	%g4,	%g7
	prefetch	[%l7 + 0x40],	 0x1
	array16	%i3,	%o4,	%l4
	fbo,a	%fcc1,	loop_423
	tneg	%xcc,	0x2
	tsubcctv	%l5,	0x10DB,	%o7
	bleu,a,pt	%xcc,	loop_424
loop_423:
	ldstub	[%l7 + 0x4B],	%l6
	sub	%o3,	%g2,	%o1
	tge	%xcc,	0x1
loop_424:
	fandnot1	%f26,	%f28,	%f2
	edge16n	%l3,	%l0,	%i6
	fmovdcc	%icc,	%f25,	%f17
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x30] %asi,	%i7
	movvs	%xcc,	%l2,	%i4
	edge16n	%g5,	%g3,	%i1
	tpos	%xcc,	0x6
	sdivcc	%o5,	0x1A1C,	%i0
	bvs,pt	%icc,	loop_425
	addccc	%l1,	0x165F,	%g6
	orncc	%o0,	0x0D10,	%g1
	udivx	%o6,	0x054D,	%i2
loop_425:
	ldsb	[%l7 + 0x0D],	%i5
	flush	%l7 + 0x78
	nop
	setx	0x92F092DDF0454401,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	sethi	0x109D,	%g4
	subc	%g7,	0x098D,	%o2
	ldsb	[%l7 + 0x17],	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l4,	%l5
	membar	0x0D
	movneg	%icc,	%o7,	%o4
	mulx	%l6,	%g2,	%o1
	udivx	%l3,	0x1235,	%l0
	set	0x2B, %i5
	ldsba	[%l7 + %i5] 0x11,	%o3
	ldsh	[%l7 + 0x7E],	%i7
	tneg	%icc,	0x2
	tvs	%icc,	0x7
	addc	%i6,	%i4,	%g5
	fbuge	%fcc2,	loop_426
	fmovrsgz	%l2,	%f8,	%f24
	addcc	%i1,	0x06BA,	%o5
	tvc	%xcc,	0x4
loop_426:
	sllx	%g3,	%i0,	%l1
	movn	%xcc,	%o0,	%g6
	sth	%o6,	[%l7 + 0x74]
	ble,pn	%xcc,	loop_427
	fcmpne16	%f30,	%f24,	%i2
	fmovsn	%xcc,	%f14,	%f22
	tge	%icc,	0x0
loop_427:
	ldd	[%l7 + 0x70],	%f24
	alignaddr	%g1,	%g4,	%i5
	mova	%xcc,	%o2,	%i3
	xnorcc	%g7,	%l4,	%o7
	fmuld8sux16	%f6,	%f24,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o4,	0x1DEB,	%l5
	alignaddrl	%l6,	%o1,	%g2
	swap	[%l7 + 0x48],	%l0
	taddcc	%o3,	0x0335,	%i7
	ldsw	[%l7 + 0x58],	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue,a	%fcc1,	loop_428
	nop
	setx	loop_429,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg,a	%fcc1,	loop_430
	fblg,a	%fcc2,	loop_431
loop_428:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_429:
	movrne	%l3,	0x16E,	%i4
loop_430:
	mova	%xcc,	%g5,	%l2
loop_431:
	fmul8x16au	%f6,	%f16,	%f16
	movrlez	%o5,	%i1,	%g3
	fbge,a	%fcc1,	loop_432
	bg,a,pt	%xcc,	loop_433
	alignaddrl	%l1,	%o0,	%i0
	fmovdge	%xcc,	%f28,	%f14
loop_432:
	movrlez	%o6,	%g6,	%i2
loop_433:
	umulcc	%g1,	%i5,	%g4
	bne	%icc,	loop_434
	tsubcc	%o2,	0x15E4,	%g7
	tn	%icc,	0x1
	and	%l4,	0x145E,	%o7
loop_434:
	or	%o4,	%i3,	%l6
	movl	%xcc,	%o1,	%l5
	stw	%g2,	[%l7 + 0x74]
	movvs	%icc,	%l0,	%i7
	addc	%i6,	0x1519,	%o3
	movn	%icc,	%i4,	%l3
	mova	%xcc,	%g5,	%o5
	fornot1s	%f20,	%f5,	%f26
	sub	%i1,	%l2,	%g3
	bleu	loop_435
	smul	%l1,	0x0E20,	%o0
	tcc	%xcc,	0x4
	bn,pt	%icc,	loop_436
loop_435:
	smul	%i0,	%o6,	%i2
	set	0x44, %g6
	swapa	[%l7 + %g6] 0x88,	%g1
loop_436:
	orn	%i5,	%g6,	%g4
	tg	%icc,	0x2
	nop
	fitos	%f12,	%f11
	fstox	%f11,	%f10
	fxtos	%f10,	%f7
	movre	%g7,	%l4,	%o2
	nop
	setx	loop_437,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnorcc	%o7,	%o4,	%l6
	ba,a,pn	%xcc,	loop_438
	sra	%i3,	%o1,	%l5
loop_437:
	ldstub	[%l7 + 0x24],	%l0
	membar	0x25
loop_438:
	stbar
	te	%xcc,	0x1
	tl	%xcc,	0x7
	tg	%xcc,	0x2
	fcmpne16	%f12,	%f20,	%i7
	addcc	%i6,	%g2,	%o3
	tge	%icc,	0x3
	edge32n	%l3,	%i4,	%o5
	fnegs	%f28,	%f20
	nop
	setx	0xC31C6EFF40457D33,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	xorcc	%g5,	0x0673,	%i1
	nop
	set	0x1C, %o5
	prefetch	[%l7 + %o5],	 0x1
	fbug,a	%fcc0,	loop_439
	tge	%xcc,	0x0
	fmovrslez	%l2,	%f10,	%f6
	tcc	%icc,	0x7
loop_439:
	movvc	%icc,	%g3,	%l1
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x81
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	edge16ln	%i0,	%o6,	%g1
	membar	0x5E
	tne	%xcc,	0x5
	brgez,a	%i2,	loop_440
	movcs	%icc,	%g6,	%g4
	tsubcctv	%i5,	0x07A4,	%l4
	fmovsg	%icc,	%f24,	%f31
loop_440:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o2,	%o7,	%o4
	nop
	fitos	%f13,	%f0
	fstox	%f0,	%f28
	bvc,a,pn	%xcc,	loop_441
	fbne,a	%fcc0,	loop_442
	edge8	%g7,	%i3,	%l6
	fmovsne	%icc,	%f0,	%f4
loop_441:
	fbge	%fcc1,	loop_443
loop_442:
	nop
	setx	0x6537C89805D85023,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x8A7CA9C38BDFF57D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f28,	%f22
	movre	%l5,	%o1,	%l0
	orcc	%i7,	%i6,	%o3
loop_443:
	fmovrse	%l3,	%f22,	%f9
	sdiv	%g2,	0x006B,	%i4
	add	%l7,	0x14,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g5,	%i1
	srl	%o5,	%l2,	%g3
	edge16	%o0,	%l1,	%o6
	umulcc	%g1,	%i2,	%g6
	fmul8x16	%f21,	%f8,	%f4
	membar	0x58
	xnor	%i0,	0x1DCA,	%g4
	addccc	%l4,	0x1436,	%i5
	fmovdle	%xcc,	%f31,	%f11
	udiv	%o2,	0x1FF8,	%o4
	std	%f22,	[%l7 + 0x68]
	mulx	%o7,	0x1FE0,	%g7
	fpadd32	%f18,	%f4,	%f16
	flush	%l7 + 0x28
	tvc	%xcc,	0x0
	bvc,pn	%xcc,	loop_444
	tn	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%i3,	%l5
loop_444:
	tgu	%icc,	0x3
	movge	%xcc,	%o1,	%l6
	nop
	setx	0x5306374189986706,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x30599BF12205C930,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f0,	%f6
	tl	%icc,	0x5
	fexpand	%f15,	%f6
	fmovde	%icc,	%f31,	%f7
	movrgz	%l0,	%i6,	%i7
	movg	%icc,	%l3,	%g2
	addcc	%o3,	0x185F,	%i4
	fmuld8ulx16	%f0,	%f29,	%f0
	edge8ln	%g5,	%o5,	%l2
	lduh	[%l7 + 0x14],	%i1
	tn	%xcc,	0x0
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o0
	tcc	%icc,	0x2
	bvc	%xcc,	loop_445
	fpackfix	%f2,	%f8
	movrne	%l1,	0x076,	%g3
	tne	%icc,	0x1
loop_445:
	sllx	%o6,	0x1D,	%i2
	movcc	%icc,	%g6,	%g1
	set	0x36, %l2
	ldsba	[%l7 + %l2] 0x18,	%i0
	edge16ln	%g4,	%i5,	%o2
	movvs	%xcc,	%l4,	%o4
	fors	%f23,	%f31,	%f7
	umulcc	%o7,	0x10DF,	%i3
	movpos	%xcc,	%g7,	%l5
	subc	%l6,	%o1,	%l0
	mulscc	%i6,	0x10D3,	%i7
	fsrc1s	%f16,	%f30
	tleu	%xcc,	0x1
	umulcc	%g2,	%o3,	%l3
	fbne,a	%fcc1,	loop_446
	ld	[%l7 + 0x28],	%f14
	fpadd32	%f0,	%f10,	%f12
	fabsd	%f0,	%f16
loop_446:
	fnot2	%f20,	%f24
	movn	%xcc,	%g5,	%o5
	movn	%icc,	%i4,	%l2
	sll	%i1,	0x16,	%l1
	umulcc	%o0,	0x1706,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o6,	%g6,	%i2
	xnor	%g1,	0x19AE,	%g4
	tvs	%xcc,	0x7
	or	%i5,	0x1E15,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x3
	fbne,a	%fcc3,	loop_447
	mulx	%l4,	0x0C99,	%o4
	sub	%o7,	0x0720,	%i3
	fmovdcs	%icc,	%f31,	%f10
loop_447:
	movcc	%icc,	%i0,	%l5
	brgz,a	%g7,	loop_448
	sll	%o1,	0x07,	%l6
	edge16l	%i6,	%i7,	%l0
	xnor	%o3,	0x06BE,	%l3
loop_448:
	alignaddr	%g2,	%g5,	%o5
	swap	[%l7 + 0x14],	%l2
	ldub	[%l7 + 0x71],	%i1
	tvc	%icc,	0x4
	movre	%i4,	%o0,	%l1
	edge16ln	%g3,	%o6,	%g6
	bn,a,pt	%xcc,	loop_449
	stw	%g1,	[%l7 + 0x3C]
	fmovdne	%icc,	%f27,	%f16
	membar	0x2A
loop_449:
	srax	%i2,	%g4,	%o2
	edge16	%l4,	%i5,	%o7
	tge	%icc,	0x7
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
	fbule	%fcc3,	loop_450
	xor	%i3,	0x0F59,	%o4
	fmovrslez	%l5,	%f21,	%f29
	movrne	%g7,	0x3DA,	%i0
loop_450:
	alignaddrl	%o1,	%l6,	%i7
	fornot2	%f2,	%f28,	%f12
	andcc	%i6,	%o3,	%l0
	sra	%g2,	%l3,	%o5
	addccc	%l2,	%g5,	%i1
	fandnot1	%f10,	%f8,	%f24
	subc	%o0,	0x1D9D,	%l1
	fmovsgu	%xcc,	%f21,	%f31
	subcc	%i4,	0x1421,	%g3
	fcmple16	%f0,	%f12,	%g6
	movge	%xcc,	%o6,	%i2
	alignaddr	%g4,	%g1,	%o2
	bge,a	%icc,	loop_451
	fmovdl	%icc,	%f22,	%f4
	sdiv	%i5,	0x1417,	%o7
	movrlz	%l4,	0x00C,	%o4
loop_451:
	st	%f29,	[%l7 + 0x50]
	addc	%i3,	%g7,	%i0
	fcmple16	%f24,	%f26,	%o1
	ba	loop_452
	and	%l6,	%i7,	%l5
	fbul,a	%fcc1,	loop_453
	edge8ln	%i6,	%o3,	%g2
loop_452:
	edge16	%l3,	%o5,	%l0
	fmovdleu	%xcc,	%f29,	%f13
loop_453:
	fmovsg	%icc,	%f17,	%f31
	sub	%g5,	0x12D2,	%i1
	ble,a,pt	%xcc,	loop_454
	tneg	%xcc,	0x2
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf8
	membar	#Sync
loop_454:
	movvc	%icc,	%o0,	%l2
	orncc	%l1,	0x1142,	%g3
	tleu	%icc,	0x4
	brlez,a	%g6,	loop_455
	fmuld8ulx16	%f30,	%f31,	%f12
	movgu	%icc,	%o6,	%i2
	fsrc1	%f16,	%f4
loop_455:
	sdivcc	%g4,	0x0C37,	%i4
	fmul8x16au	%f29,	%f7,	%f30
	udiv	%g1,	0x1A3B,	%o2
	addccc	%o7,	0x1566,	%i5
	movleu	%xcc,	%l4,	%i3
	edge8ln	%g7,	%i0,	%o1
	stx	%o4,	[%l7 + 0x58]
	sllx	%i7,	%l6,	%i6
	tg	%icc,	0x6
	movn	%icc,	%l5,	%g2
	fpsub32s	%f15,	%f11,	%f5
	fabsd	%f16,	%f4
	andcc	%o3,	%o5,	%l0
	movcc	%xcc,	%l3,	%i1
	nop
	set	0x6C, %l0
	prefetch	[%l7 + %l0],	 0x3
	pdist	%f26,	%f18,	%f28
	tvs	%icc,	0x2
	fbge	%fcc2,	loop_456
	edge16l	%g5,	%o0,	%l1
	umulcc	%g3,	0x0CBF,	%g6
	std	%f22,	[%l7 + 0x78]
loop_456:
	ldsh	[%l7 + 0x36],	%o6
	fnors	%f1,	%f25,	%f21
	fmovsleu	%xcc,	%f10,	%f29
	umulcc	%l2,	%i2,	%g4
	tl	%icc,	0x3
	bshuffle	%f22,	%f16,	%f18
	edge16l	%i4,	%o2,	%g1
	movrlz	%o7,	0x065,	%l4
	movneg	%xcc,	%i3,	%i5
	fmovsgu	%xcc,	%f15,	%f28
	nop
	setx loop_457, %l0, %l1
	jmpl %l1, %g7
	udiv	%o1,	0x0B3E,	%i0
	edge16n	%i7,	%l6,	%i6
	movle	%xcc,	%l5,	%g2
loop_457:
	for	%f30,	%f24,	%f24
	fors	%f4,	%f0,	%f13
	movrlz	%o3,	0x08E,	%o4
	fmovsvc	%icc,	%f7,	%f31
	fabss	%f19,	%f3
	movvs	%xcc,	%l0,	%o5
	popc	0x1630,	%i1
	movrgz	%g5,	0x266,	%o0
	fbuge	%fcc2,	loop_458
	andncc	%l3,	%g3,	%l1
	sllx	%o6,	0x04,	%g6
	sir	0x1CF1
loop_458:
	nop
	fitos	%f5,	%f15
	fstox	%f15,	%f28
	fxtos	%f28,	%f2
	andncc	%i2,	%g4,	%i4
	brgez	%l2,	loop_459
	array32	%g1,	%o2,	%o7
	smul	%i3,	0x1FA4,	%i5
	fsrc1s	%f23,	%f26
loop_459:
	flush	%l7 + 0x28
	fcmpgt32	%f0,	%f24,	%l4
	tpos	%xcc,	0x7
	addc	%g7,	0x15B9,	%o1
	mulx	%i7,	%i0,	%i6
	ta	%xcc,	0x7
	stbar
	fcmpne32	%f20,	%f28,	%l5
	fcmpeq32	%f26,	%f6,	%g2
	ta	%xcc,	0x2
	subccc	%l6,	0x0F80,	%o3
	tleu	%xcc,	0x4
	orcc	%l0,	%o4,	%i1
	array16	%g5,	%o0,	%l3
	fmovsgu	%icc,	%f18,	%f4
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovsge	%xcc,	%f0,	%f16
	bg,a	loop_460
	fnors	%f4,	%f2,	%f0
	fmuld8ulx16	%f1,	%f12,	%f22
	tn	%xcc,	0x2
loop_460:
	tsubcctv	%o5,	0x0381,	%g3
	ldsw	[%l7 + 0x50],	%o6
	bvs,a,pn	%xcc,	loop_461
	swap	[%l7 + 0x60],	%g6
	fmul8x16al	%f5,	%f28,	%f30
	tcs	%icc,	0x3
loop_461:
	fpadd16	%f4,	%f18,	%f8
	movrgz	%i2,	0x395,	%l1
	alignaddrl	%i4,	%g4,	%l2
	sth	%g1,	[%l7 + 0x32]
	xnor	%o7,	0x00BB,	%i3
	orncc	%o2,	0x0A5B,	%l4
	fnot2	%f28,	%f26
	edge32n	%i5,	%o1,	%g7
	fornot1s	%f8,	%f2,	%f20
	set	0x28, %g4
	stwa	%i7,	[%l7 + %g4] 0x14
	fbne,a	%fcc3,	loop_462
	fmovsneg	%icc,	%f13,	%f8
	fpadd16	%f20,	%f14,	%f12
	fxnors	%f8,	%f28,	%f9
loop_462:
	umulcc	%i6,	%i0,	%l5
	nop
	setx	0xE05381E2541F1D48,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x8878D3D1A0B15962,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f14,	%f8
	membar	0x6D
	fmovrdgz	%l6,	%f8,	%f10
	orncc	%o3,	0x07CA,	%g2
	set	0x38, %o0
	stwa	%o4,	[%l7 + %o0] 0x22
	membar	#Sync
	tne	%xcc,	0x2
	stx	%i1,	[%l7 + 0x48]
	set	0x58, %g7
	sta	%f30,	[%l7 + %g7] 0x10
	mulx	%g5,	0x14E1,	%l0
	fcmpeq16	%f18,	%f22,	%l3
	set	0x10, %g3
	stxa	%o0,	[%l7 + %g3] 0x23
	membar	#Sync
	fpackfix	%f22,	%f26
	udivx	%g3,	0x05AF,	%o6
	edge8ln	%g6,	%i2,	%l1
	alignaddr	%i4,	%g4,	%o5
	andncc	%g1,	%o7,	%i3
	ldsh	[%l7 + 0x22],	%o2
	sethi	0x12DB,	%l2
	fsrc2s	%f11,	%f14
	fmovsa	%xcc,	%f9,	%f27
	be,a	%xcc,	loop_463
	fxor	%f6,	%f18,	%f18
	ta	%xcc,	0x1
	ta	%icc,	0x7
loop_463:
	nop
	setx loop_464, %l0, %l1
	jmpl %l1, %i5
	membar	0x5B
	fbule,a	%fcc3,	loop_465
	edge8l	%o1,	%l4,	%i7
loop_464:
	fmovrdgz	%i6,	%f8,	%f8
	fmovsle	%xcc,	%f15,	%f20
loop_465:
	nop
	setx	loop_466,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%i0,	%l5,	%g7
	popc	0x0011,	%o3
	fxor	%f8,	%f6,	%f18
loop_466:
	edge8l	%g2,	%o4,	%l6
	movcs	%xcc,	%i1,	%l0
	fbule,a	%fcc1,	loop_467
	movrlez	%l3,	0x163,	%g5
	brnz,a	%g3,	loop_468
	edge16l	%o6,	%o0,	%g6
loop_467:
	smulcc	%i2,	0x090D,	%i4
	bshuffle	%f16,	%f20,	%f12
loop_468:
	alignaddr	%l1,	%o5,	%g1
	edge16ln	%g4,	%o7,	%i3
	fors	%f17,	%f9,	%f30
	tgu	%xcc,	0x2
	fmovdneg	%xcc,	%f28,	%f15
	ldx	[%l7 + 0x78],	%o2
	fsrc2s	%f12,	%f30
	bneg,pt	%xcc,	loop_469
	edge16l	%l2,	%o1,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f26,	%f12,	%f2
loop_469:
	movgu	%xcc,	%i7,	%i6
	set	0x44, %i1
	lda	[%l7 + %i1] 0x04,	%f19
	bshuffle	%f14,	%f16,	%f12
	umul	%l4,	%l5,	%g7
	tvs	%icc,	0x7
	be,a,pn	%xcc,	loop_470
	sub	%i0,	0x1993,	%g2
	umul	%o3,	0x14B8,	%l6
	fcmpeq16	%f16,	%f16,	%i1
loop_470:
	udivx	%l0,	0x168F,	%l3
	xnorcc	%g5,	%o4,	%o6
	edge16n	%g3,	%g6,	%o0
	fpsub16s	%f19,	%f9,	%f19
	fmovsg	%icc,	%f22,	%f18
	tl	%xcc,	0x1
	fcmpgt32	%f12,	%f22,	%i4
	andcc	%l1,	%i2,	%o5
	te	%xcc,	0x0
	fmul8x16	%f12,	%f22,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g1,	%g4
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x7C] %asi,	%i3
	movvs	%icc,	%o7,	%l2
	edge16	%o2,	%i5,	%o1
	tl	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	ldub	[%l7 + 0x45],	%i6
	sra	%l5,	0x1E,	%g7
	sub	%i0,	0x1AAF,	%l4
	subcc	%o3,	0x0015,	%l6
	mulscc	%g2,	%l0,	%i1
	sllx	%l3,	%o4,	%o6
	bleu,a,pn	%xcc,	loop_471
	mulx	%g3,	%g6,	%o0
	set	0x4D, %o7
	lduba	[%l7 + %o7] 0x19,	%g5
loop_471:
	move	%xcc,	%l1,	%i4
	ldstub	[%l7 + 0x12],	%o5
	fmovrsne	%i2,	%f29,	%f14
	fmovrdlz	%g4,	%f28,	%f22
	tle	%icc,	0x3
	tleu	%xcc,	0x5
	bn,a,pt	%icc,	loop_472
	fmovscs	%xcc,	%f10,	%f14
	fmovse	%icc,	%f6,	%f29
	fnand	%f20,	%f26,	%f14
loop_472:
	fbn,a	%fcc0,	loop_473
	brgez	%g1,	loop_474
	tg	%xcc,	0x2
	xor	%o7,	0x15E8,	%i3
loop_473:
	sll	%o2,	0x0F,	%l2
loop_474:
	addcc	%i5,	%o1,	%i6
	movle	%icc,	%i7,	%l5
	ldx	[%l7 + 0x38],	%i0
	xor	%l4,	%o3,	%g7
	bvc,a	%icc,	loop_475
	sdiv	%g2,	0x1166,	%l0
	bpos,a	%xcc,	loop_476
	fsrc2s	%f23,	%f11
loop_475:
	nop
	set	0x43, %g2
	stba	%i1,	[%l7 + %g2] 0x23
	membar	#Sync
loop_476:
	bcc,a	%icc,	loop_477
	movn	%icc,	%l6,	%l3
	fmovsne	%xcc,	%f31,	%f16
	fornot1s	%f4,	%f22,	%f16
loop_477:
	udivx	%o4,	0x1480,	%o6
	fmovsleu	%icc,	%f18,	%f12
	tle	%xcc,	0x5
	tpos	%xcc,	0x7
	be,a	%xcc,	loop_478
	fpadd16s	%f3,	%f13,	%f4
	bleu,a	loop_479
	tg	%xcc,	0x3
loop_478:
	popc	%g6,	%o0
	nop
	setx	0x6E8F28F773E23547,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x0ED3905488DE4BBD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f22,	%f26
loop_479:
	alignaddrl	%g3,	%g5,	%i4
	orncc	%o5,	0x1B0A,	%i2
	edge32	%l1,	%g4,	%o7
	edge32n	%g1,	%i3,	%o2
	movrlz	%i5,	%o1,	%i6
	fmovdneg	%xcc,	%f9,	%f13
	nop
	setx	loop_480,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrsgz	%l2,	%f14,	%f28
	xorcc	%l5,	%i7,	%l4
	alignaddr	%i0,	%o3,	%g7
loop_480:
	fxnor	%f18,	%f30,	%f8
	taddcctv	%l0,	0x0FEC,	%g2
	sdiv	%l6,	0x027E,	%i1
	bcs	%icc,	loop_481
	sra	%l3,	0x1F,	%o4
	movge	%xcc,	%o6,	%o0
	nop
	setx loop_482, %l0, %l1
	jmpl %l1, %g6
loop_481:
	fmovsleu	%xcc,	%f22,	%f11
	fxor	%f0,	%f30,	%f10
	fmovdg	%icc,	%f23,	%f28
loop_482:
	mulx	%g5,	%i4,	%g3
	movrlz	%i2,	%l1,	%o5
	movcc	%xcc,	%o7,	%g1
	flush	%l7 + 0x30
	movrlez	%i3,	%g4,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o2,	%o1,	%l2
	sethi	0x1B71,	%i6
	fmul8x16au	%f15,	%f4,	%f4
	mulscc	%i7,	0x0964,	%l4
	alignaddr	%i0,	%l5,	%o3
	fmovdg	%icc,	%f29,	%f28
	fzero	%f26
	mova	%xcc,	%l0,	%g7
	std	%f16,	[%l7 + 0x40]
	movrne	%l6,	%g2,	%i1
	fsrc1	%f18,	%f30
	movl	%xcc,	%o4,	%l3
	edge8n	%o0,	%o6,	%g5
	ble,pn	%icc,	loop_483
	tne	%xcc,	0x3
	orncc	%g6,	%i4,	%i2
	nop
	setx	0x907191B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
loop_483:
	ta	%icc,	0x5
	alignaddrl	%l1,	%g3,	%o7
	fpsub16s	%f6,	%f20,	%f11
	alignaddr	%g1,	%o5,	%i3
	xnorcc	%g4,	0x126A,	%o2
	movvc	%icc,	%i5,	%l2
	fbug	%fcc3,	loop_484
	fnors	%f23,	%f28,	%f7
	and	%i6,	%o1,	%i7
	sub	%l4,	0x1F16,	%i0
loop_484:
	edge16	%l5,	%o3,	%g7
	fnot1	%f0,	%f30
	sethi	0x09B1,	%l0
	tle	%icc,	0x2
	smulcc	%l6,	%i1,	%o4
	wr	%g0,	0x10,	%asi
	sta	%f18,	[%l7 + 0x24] %asi
	addc	%g2,	%l3,	%o6
	fpadd32	%f18,	%f4,	%f8
	movre	%g5,	0x3CB,	%o0
	std	%f24,	[%l7 + 0x70]
	movcs	%xcc,	%i4,	%i2
	bvs,a	loop_485
	movrlz	%l1,	0x1A4,	%g6
	tle	%icc,	0x4
	tleu	%xcc,	0x1
loop_485:
	edge16	%g3,	%g1,	%o7
	bvc,pt	%xcc,	loop_486
	fbge,a	%fcc2,	loop_487
	and	%i3,	%o5,	%g4
	movn	%xcc,	%o2,	%l2
loop_486:
	nop
	setx	loop_488,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_487:
	edge32n	%i5,	%o1,	%i6
	subccc	%l4,	0x096E,	%i0
	sethi	0x0A25,	%i7
loop_488:
	and	%l5,	0x0C91,	%g7
	subccc	%l0,	0x121C,	%l6
	ldd	[%l7 + 0x40],	%o2
	nop
	setx	0xDE139C7E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x958D3E6F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f16,	%f14
	movvc	%xcc,	%o4,	%g2
	fbne	%fcc0,	loop_489
	fcmpne16	%f22,	%f20,	%l3
	edge8	%o6,	%g5,	%i1
	tne	%icc,	0x4
loop_489:
	orncc	%o0,	0x016B,	%i2
	lduh	[%l7 + 0x20],	%i4
	nop
	fitos	%f19,	%f25
	edge32l	%l1,	%g6,	%g1
	bne	loop_490
	srlx	%o7,	%i3,	%g3
	wr	%g0,	0x81,	%asi
	sta	%f21,	[%l7 + 0x24] %asi
loop_490:
	brgez	%o5,	loop_491
	fmovsa	%icc,	%f15,	%f21
	movrlz	%g4,	%l2,	%o2
	andn	%o1,	%i5,	%i6
loop_491:
	nop
	setx	0xD0D97CED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f26
	movrgez	%l4,	0x266,	%i7
	movleu	%icc,	%l5,	%i0
	ldstub	[%l7 + 0x27],	%l0
	udiv	%l6,	0x1448,	%g7
	tle	%xcc,	0x5
	fmovrdgz	%o4,	%f10,	%f6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x74] %asi,	%o3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x80,	%g2,	%o6
	umulcc	%g5,	0x1F0A,	%l3
	sra	%o0,	%i1,	%i2
	bcc,a	loop_492
	edge32	%i4,	%g6,	%g1
	tne	%xcc,	0x7
	fbne	%fcc0,	loop_493
loop_492:
	tgu	%xcc,	0x7
	nop
	setx loop_494, %l0, %l1
	jmpl %l1, %l1
	nop
	setx	loop_495,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_493:
	movneg	%icc,	%i3,	%g3
	fandnot2s	%f12,	%f18,	%f1
loop_494:
	movcs	%icc,	%o5,	%o7
loop_495:
	fbue	%fcc1,	loop_496
	movvs	%icc,	%g4,	%l2
	andcc	%o1,	0x0FC9,	%i5
	sll	%i6,	%l4,	%i7
loop_496:
	fmovsgu	%icc,	%f2,	%f13
	umulcc	%o2,	%l5,	%l0
	membar	0x35
	set	0x1F, %l4
	ldstuba	[%l7 + %l4] 0x80,	%l6
	ldd	[%l7 + 0x68],	%i0
	edge32	%g7,	%o3,	%o4
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x28] %asi,	%g2
	be	loop_497
	subcc	%o6,	0x117E,	%g5
	edge32l	%o0,	%i1,	%i2
	fornot1s	%f3,	%f25,	%f30
loop_497:
	movrne	%l3,	0x2C8,	%g6
	prefetch	[%l7 + 0x1C],	 0x1
	movn	%icc,	%i4,	%l1
	set	0x68, %g1
	stxa	%g1,	[%l7 + %g1] 0x81
	edge32ln	%g3,	%i3,	%o5
	tpos	%icc,	0x1
	tleu	%xcc,	0x2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%o7
	fbe,a	%fcc0,	loop_498
	movne	%xcc,	%o1,	%i5
	fxnor	%f22,	%f0,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_498:
	movrgez	%l2,	%l4,	%i7
	fbn	%fcc1,	loop_499
	stw	%o2,	[%l7 + 0x48]
	fbl,a	%fcc0,	loop_500
	sllx	%l5,	0x1D,	%l0
loop_499:
	bcc,a	loop_501
	fbl,a	%fcc0,	loop_502
loop_500:
	sdiv	%i6,	0x05FD,	%l6
	fbuge,a	%fcc1,	loop_503
loop_501:
	brlz,a	%i0,	loop_504
loop_502:
	udiv	%g7,	0x18E0,	%o3
	bg	%icc,	loop_505
loop_503:
	movrgez	%o4,	%o6,	%g2
loop_504:
	xnorcc	%g5,	%i1,	%i2
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x12] %asi,	%o0
loop_505:
	subc	%l3,	0x01BC,	%g6
	fmovrsgez	%l1,	%f15,	%f30
	movrgz	%i4,	0x00E,	%g3
	brz	%g1,	loop_506
	movne	%xcc,	%o5,	%g4
	addc	%i3,	0x1011,	%o7
	tvs	%icc,	0x2
loop_506:
	nop
	set	0x41, %i0
	ldsba	[%l7 + %i0] 0x80,	%i5
	edge8ln	%o1,	%l4,	%l2
	fxor	%f20,	%f2,	%f8
	fmovrsgz	%o2,	%f24,	%f28
	fmovdne	%icc,	%f0,	%f16
	wr	%g0,	0xeb,	%asi
	stwa	%i7,	[%l7 + 0x50] %asi
	membar	#Sync
	tpos	%xcc,	0x4
	tvc	%xcc,	0x6
	stx	%l5,	[%l7 + 0x20]
	andncc	%i6,	%l6,	%i0
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
	mova	%xcc,	%g7,	%l0
	srax	%o4,	0x04,	%o6
	mulx	%o3,	%g2,	%g5
	sra	%i2,	%i1,	%l3
	edge8ln	%g6,	%o0,	%l1
	lduh	[%l7 + 0x74],	%i4
	sdivcc	%g1,	0x0600,	%g3
	sethi	0x146E,	%g4
	sllx	%o5,	0x1D,	%i3
	sllx	%o7,	0x09,	%i5
	tle	%icc,	0x2
	fnand	%f0,	%f18,	%f6
	tg	%icc,	0x5
	movrlz	%o1,	0x269,	%l4
	fbul,a	%fcc0,	loop_507
	addcc	%o2,	%i7,	%l5
	array16	%i6,	%l6,	%i0
	fbne	%fcc3,	loop_508
loop_507:
	sethi	0x135B,	%l2
	tpos	%icc,	0x4
	taddcc	%l0,	%o4,	%o6
loop_508:
	sllx	%g7,	%o3,	%g2
	fmovsl	%xcc,	%f15,	%f20
	fbu,a	%fcc1,	loop_509
	taddcctv	%i2,	%g5,	%l3
	addc	%i1,	0x12CE,	%g6
	pdist	%f24,	%f28,	%f2
loop_509:
	move	%icc,	%o0,	%l1
	movg	%icc,	%i4,	%g1
	add	%g3,	%o5,	%i3
	xor	%g4,	%o7,	%o1
	tsubcctv	%i5,	0x17E5,	%o2
	edge16l	%i7,	%l5,	%l4
	edge16	%i6,	%i0,	%l2
	fmovscs	%xcc,	%f23,	%f8
	fcmpeq16	%f24,	%f18,	%l0
	nop
	setx	0x7E3B07FE59BFD8F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xDD323DD108548C78,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f8,	%f4
	tleu	%xcc,	0x6
	fbe,a	%fcc0,	loop_510
	edge16l	%l6,	%o6,	%g7
	fba	%fcc1,	loop_511
	sdivcc	%o3,	0x1565,	%g2
loop_510:
	smul	%i2,	%o4,	%g5
	array8	%i1,	%g6,	%o0
loop_511:
	or	%l3,	%l1,	%g1
	movrne	%g3,	%i4,	%i3
	edge16n	%g4,	%o7,	%o1
	ta	%xcc,	0x2
	fpackfix	%f26,	%f14
	subc	%o5,	0x0AE3,	%o2
	edge16l	%i5,	%l5,	%l4
	fbl,a	%fcc2,	loop_512
	movpos	%xcc,	%i6,	%i7
	fand	%f24,	%f8,	%f0
	sir	0x1060
loop_512:
	nop
	set	0x20, %o6
	ldda	[%l7 + %o6] 0x81,	%l2
	ldsb	[%l7 + 0x3A],	%i0
	edge16n	%l6,	%o6,	%g7
	fbge,a	%fcc1,	loop_513
	movle	%icc,	%o3,	%l0
	tge	%xcc,	0x7
	set	0x64, %i6
	ldsha	[%l7 + %i6] 0x88,	%g2
loop_513:
	srl	%o4,	%g5,	%i2
	movre	%g6,	0x1CB,	%o0
	nop
	set	0x51, %o1
	stb	%i1,	[%l7 + %o1]
	tcs	%xcc,	0x3
	tle	%xcc,	0x3
	alignaddrl	%l1,	%g1,	%l3
	edge32ln	%i4,	%g3,	%i3
	fmovsne	%icc,	%f13,	%f23
	orcc	%o7,	%g4,	%o1
	movge	%xcc,	%o2,	%o5
	subccc	%i5,	%l5,	%l4
	addcc	%i7,	0x0F47,	%l2
	fsrc2	%f18,	%f28
	set	0x15, %g5
	stba	%i0,	[%l7 + %g5] 0x88
	sethi	0x18ED,	%i6
	fpadd16	%f22,	%f8,	%f4
	array32	%l6,	%g7,	%o6
	fsrc1s	%f10,	%f2
	array8	%l0,	%g2,	%o3
	alignaddrl	%g5,	%o4,	%i2
	nop
	fitos	%f5,	%f14
	fstoi	%f14,	%f13
	fmul8x16au	%f25,	%f29,	%f2
	brgez,a	%g6,	loop_514
	stbar
	umul	%o0,	0x1D89,	%l1
	xorcc	%i1,	%g1,	%i4
loop_514:
	mova	%xcc,	%g3,	%i3
	brgez	%l3,	loop_515
	call	loop_516
	sir	0x03CB
	fmovsne	%icc,	%f21,	%f9
loop_515:
	tsubcctv	%o7,	%g4,	%o1
loop_516:
	movpos	%icc,	%o2,	%o5
	addcc	%l5,	%l4,	%i5
	lduh	[%l7 + 0x6A],	%i7
	xorcc	%l2,	0x1AD1,	%i6
	movcs	%icc,	%l6,	%g7
	xor	%i0,	%l0,	%o6
	fxnors	%f10,	%f4,	%f0
	movn	%xcc,	%g2,	%o3
	tl	%xcc,	0x7
	movre	%o4,	%g5,	%i2
	edge8n	%g6,	%o0,	%l1
	fnot2	%f30,	%f8
	bcs,pt	%xcc,	loop_517
	fmovrsgez	%g1,	%f4,	%f14
	sir	0x1426
	bcc	%icc,	loop_518
loop_517:
	edge16	%i4,	%i1,	%g3
	tvc	%xcc,	0x0
	array8	%l3,	%o7,	%g4
loop_518:
	fbule,a	%fcc1,	loop_519
	add	%o1,	%i3,	%o5
	fpsub32	%f4,	%f6,	%f20
	alignaddr	%o2,	%l5,	%i5
loop_519:
	xor	%l4,	%i7,	%i6
	bcc,a,pn	%icc,	loop_520
	fandnot1	%f0,	%f24,	%f8
	edge8n	%l2,	%g7,	%l6
	andcc	%l0,	%i0,	%o6
loop_520:
	fmovsn	%icc,	%f26,	%f30
	fbuge,a	%fcc2,	loop_521
	movn	%icc,	%g2,	%o3
	brgez	%o4,	loop_522
	ldsb	[%l7 + 0x37],	%i2
loop_521:
	fmovrdgez	%g6,	%f6,	%f26
	xor	%o0,	0x0432,	%g5
loop_522:
	bn,a,pt	%icc,	loop_523
	tg	%icc,	0x3
	sllx	%g1,	0x04,	%i4
	set	0x70, %i3
	ldswa	[%l7 + %i3] 0x80,	%i1
loop_523:
	movvc	%icc,	%g3,	%l3
	fpack32	%f18,	%f14,	%f6
	tcs	%icc,	0x3
	array16	%l1,	%o7,	%g4
	tle	%icc,	0x6
	movvs	%icc,	%o1,	%o5
	edge8ln	%o2,	%l5,	%i3
	fmovrdlz	%i5,	%f18,	%f0
	set	0x14, %i4
	stha	%i7,	[%l7 + %i4] 0x89
	movrne	%l4,	%l2,	%g7
	tsubcc	%i6,	0x1676,	%l0
	movne	%xcc,	%l6,	%i0
	brnz	%o6,	loop_524
	be,a,pn	%xcc,	loop_525
	bpos,a,pn	%icc,	loop_526
	movrlez	%o3,	0x38D,	%o4
loop_524:
	srlx	%i2,	%g6,	%o0
loop_525:
	ldd	[%l7 + 0x68],	%f14
loop_526:
	ta	%icc,	0x4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%g2
	mulx	%g1,	0x0E52,	%i4
	bge,a	loop_527
	fmovrdlz	%g5,	%f12,	%f24
	nop
	fitos	%f2,	%f14
	fstox	%f14,	%f18
	fmul8x16	%f31,	%f0,	%f22
loop_527:
	fnot1	%f14,	%f6
	edge8	%i1,	%l3,	%g3
	call	loop_528
	fsrc1s	%f9,	%f30
	tneg	%xcc,	0x1
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x10] %asi,	%o7
loop_528:
	subccc	%g4,	0x1A19,	%o1
	umul	%o5,	0x1B7F,	%l1
	call	loop_529
	fmovdvc	%xcc,	%f2,	%f0
	fnand	%f30,	%f26,	%f26
	smulcc	%o2,	0x1450,	%l5
loop_529:
	andn	%i5,	0x1928,	%i3
	srlx	%l4,	0x1E,	%i7
	movle	%xcc,	%l2,	%g7
	ldsb	[%l7 + 0x36],	%i6
	nop
	setx	loop_530,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvs,pn	%icc,	loop_531
	sllx	%l6,	%i0,	%l0
	ta	%icc,	0x7
loop_530:
	bcs,a	%xcc,	loop_532
loop_531:
	srlx	%o3,	0x10,	%o4
	fmovda	%xcc,	%f26,	%f25
	sir	0x01ED
loop_532:
	fmovdneg	%xcc,	%f31,	%f19
	orncc	%o6,	0x1F2D,	%i2
	edge8n	%o0,	%g6,	%g2
	fmovrsgez	%g1,	%f26,	%f14
	edge32l	%g5,	%i1,	%l3
	nop
	fitod	%f8,	%f20
	fdtoi	%f20,	%f17
	umul	%g3,	%i4,	%o7
	nop
	setx loop_533, %l0, %l1
	jmpl %l1, %o1
	fcmpeq32	%f0,	%f10,	%g4
	movleu	%icc,	%o5,	%o2
	nop
	setx	0xCA64B992,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f7
loop_533:
	fpackfix	%f0,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l5,	0x0373,	%i5
	fsrc1	%f4,	%f24
	popc	%l1,	%i3
	mulscc	%i7,	0x0A9A,	%l4
	set	0x19, %o3
	stba	%g7,	[%l7 + %o3] 0xe3
	membar	#Sync
	fmovrse	%i6,	%f13,	%f19
	popc	%l6,	%i0
	udivcc	%l0,	0x112D,	%o3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	movleu	%icc,	%l2,	%o6
	ldstub	[%l7 + 0x29],	%i2
	addc	%g6,	%o0,	%g2
	ldsh	[%l7 + 0x42],	%g1
	sir	0x1203
	tle	%icc,	0x1
	fnor	%f14,	%f6,	%f26
	addccc	%i1,	0x0E4C,	%l3
	sub	%g3,	0x17DD,	%g5
	addcc	%i4,	%o7,	%g4
	movvc	%xcc,	%o5,	%o2
	movvc	%icc,	%l5,	%i5
	fmovsle	%icc,	%f29,	%f12
	sdiv	%l1,	0x153D,	%i3
	movrne	%o1,	%l4,	%i7
	fpsub32	%f14,	%f18,	%f26
	movn	%xcc,	%g7,	%l6
	array16	%i6,	%i0,	%l0
	sdiv	%o3,	0x0BD0,	%l2
	edge8l	%o6,	%o4,	%g6
	stbar
	stx	%i2,	[%l7 + 0x58]
	sth	%g2,	[%l7 + 0x76]
	udivx	%o0,	0x164F,	%i1
	edge16ln	%l3,	%g3,	%g5
	orncc	%i4,	0x19D8,	%g1
	array16	%g4,	%o7,	%o2
	fnand	%f26,	%f0,	%f30
	movrne	%o5,	%l5,	%i5
	andn	%l1,	%o1,	%i3
	taddcctv	%i7,	%l4,	%g7
	set	0x68, %l6
	stwa	%i6,	[%l7 + %l6] 0x27
	membar	#Sync
	ldd	[%l7 + 0x18],	%f26
	set	0x68, %i2
	stwa	%l6,	[%l7 + %i2] 0x22
	membar	#Sync
	and	%l0,	%o3,	%i0
	alignaddrl	%o6,	%l2,	%g6
	tle	%icc,	0x5
	mulscc	%i2,	%g2,	%o4
	nop
	setx	0xD05DC9EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	edge8l	%o0,	%i1,	%l3
	fbl,a	%fcc1,	loop_534
	ldsh	[%l7 + 0x56],	%g5
	wr	%g0,	0x2a,	%asi
	stwa	%i4,	[%l7 + 0x70] %asi
	membar	#Sync
loop_534:
	fnands	%f3,	%f1,	%f29
	movneg	%xcc,	%g1,	%g4
	umul	%g3,	%o2,	%o7
	edge16	%l5,	%i5,	%l1
	fbul	%fcc3,	loop_535
	movrgez	%o5,	%i3,	%o1
	xor	%l4,	%i7,	%i6
	movcs	%icc,	%g7,	%l0
loop_535:
	fmovs	%f4,	%f8
	membar	0x38
	tvs	%xcc,	0x7
	andncc	%l6,	%i0,	%o3
	umulcc	%l2,	0x14E9,	%g6
	srax	%i2,	0x0A,	%o6
	nop
	fitod	%f14,	%f10
	sllx	%o4,	0x0C,	%g2
	or	%i1,	0x1769,	%l3
	fnot2	%f14,	%f0
	tle	%icc,	0x0
	fmovdn	%icc,	%f1,	%f13
	fmovsgu	%xcc,	%f23,	%f15
	fandnot2	%f22,	%f24,	%f6
	movle	%icc,	%g5,	%i4
	tne	%icc,	0x6
	smul	%o0,	%g1,	%g4
	movvc	%xcc,	%g3,	%o2
	add	%l5,	%i5,	%l1
	set	0x74, %i7
	sta	%f24,	[%l7 + %i7] 0x88
	fnors	%f4,	%f28,	%f24
	sethi	0x16D9,	%o7
	fmovrsgz	%i3,	%f4,	%f2
	movcs	%icc,	%o1,	%o5
	taddcc	%i7,	0x170B,	%i6
	movle	%icc,	%g7,	%l4
	array32	%l0,	%l6,	%i0
	edge32ln	%o3,	%l2,	%g6
	and	%i2,	0x0562,	%o6
	fnot2s	%f31,	%f17
	fmuld8sux16	%f12,	%f10,	%f22
	fnor	%f6,	%f28,	%f4
	movcs	%icc,	%o4,	%g2
	tle	%xcc,	0x6
	ldd	[%l7 + 0x40],	%l2
	fbl,a	%fcc3,	loop_536
	mova	%icc,	%i1,	%i4
	movleu	%xcc,	%o0,	%g1
	movcc	%xcc,	%g4,	%g5
loop_536:
	sdivx	%g3,	0x1F47,	%o2
	edge32l	%i5,	%l5,	%l1
	edge16n	%i3,	%o7,	%o5
	fmovsne	%icc,	%f22,	%f21
	movre	%i7,	0x0A4,	%o1
	brnz,a	%g7,	loop_537
	fsrc1	%f28,	%f0
	or	%l4,	%l0,	%l6
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f24
loop_537:
	fmovrde	%i0,	%f12,	%f20
	fcmple32	%f16,	%f4,	%o3
	taddcctv	%i6,	0x130A,	%l2
	andcc	%g6,	0x0AA5,	%o6
	movle	%xcc,	%o4,	%g2
	fandnot1s	%f18,	%f4,	%f22
	tsubcctv	%i2,	0x0192,	%l3
	fandnot1s	%f19,	%f17,	%f29
	be,a,pn	%icc,	loop_538
	fmovdcc	%xcc,	%f21,	%f27
	umul	%i1,	%i4,	%o0
	tneg	%icc,	0x2
loop_538:
	faligndata	%f16,	%f4,	%f12
	fsrc1	%f16,	%f26
	fnors	%f3,	%f31,	%f24
	tle	%icc,	0x3
	movcc	%xcc,	%g4,	%g5
	fcmpgt16	%f6,	%f24,	%g3
	bcs	%xcc,	loop_539
	tcs	%xcc,	0x5
	tg	%icc,	0x1
	srl	%g1,	%i5,	%l5
loop_539:
	fnors	%f11,	%f6,	%f31
	xorcc	%o2,	0x1F49,	%i3
	movrne	%l1,	%o5,	%o7
	addcc	%i7,	%o1,	%g7
	movg	%icc,	%l4,	%l6
	movrlz	%i0,	0x3B2,	%l0
	movrgez	%i6,	%o3,	%g6
	fsrc2s	%f8,	%f26
	edge8ln	%l2,	%o6,	%g2
	mulscc	%i2,	%l3,	%i1
	lduh	[%l7 + 0x2C],	%i4
	movrlz	%o4,	0x0FB,	%g4
	movneg	%xcc,	%g5,	%o0
	fandnot1s	%f6,	%f3,	%f27
	alignaddr	%g3,	%i5,	%g1
	edge8n	%o2,	%l5,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x7C, %o2
	swapa	[%l7 + %o2] 0x04,	%o5
	fmovdl	%xcc,	%f15,	%f0
	movcc	%xcc,	%l1,	%o7
	fbl	%fcc2,	loop_540
	fpsub32	%f28,	%f2,	%f8
	sethi	0x03AB,	%i7
	fmovsn	%xcc,	%f6,	%f12
loop_540:
	st	%f1,	[%l7 + 0x4C]
	tcs	%xcc,	0x2
	fmovdvc	%xcc,	%f29,	%f14
	tsubcc	%g7,	0x1ADE,	%o1
	movneg	%xcc,	%l6,	%i0
	tne	%icc,	0x6
	fcmpeq32	%f30,	%f30,	%l4
	smulcc	%l0,	%i6,	%g6
	udiv	%o3,	0x1383,	%o6
	tgu	%icc,	0x4
	edge16	%g2,	%l2,	%i2
	fzeros	%f14
	udiv	%l3,	0x1F03,	%i4
	srax	%i1,	%g4,	%g5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o0
	fbn,a	%fcc2,	loop_541
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o4,	%g3,	%g1
	movneg	%icc,	%o2,	%i5
loop_541:
	movre	%l5,	0x0F9,	%i3
	sdiv	%l1,	0x1514,	%o5
	mova	%icc,	%o7,	%i7
	tcs	%xcc,	0x1
	movvc	%xcc,	%g7,	%o1
	bge,pt	%icc,	loop_542
	movgu	%icc,	%l6,	%l4
	smul	%i0,	%l0,	%i6
	fmul8x16	%f8,	%f18,	%f18
loop_542:
	tl	%icc,	0x5
	orn	%o3,	0x0F9F,	%o6
	movle	%xcc,	%g6,	%l2
	subccc	%g2,	0x147F,	%l3
	movrgz	%i2,	0x13D,	%i1
	nop
	fitos	%f4,	%f3
	fstox	%f3,	%f10
	fxtos	%f10,	%f30
	udiv	%i4,	0x15DE,	%g4
	nop
	setx loop_543, %l0, %l1
	jmpl %l1, %o0
	ldub	[%l7 + 0x2A],	%o4
	movge	%icc,	%g5,	%g3
	tle	%icc,	0x6
loop_543:
	edge32	%o2,	%g1,	%i5
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l5
	sth	%i3,	[%l7 + 0x2E]
	fmovrdne	%o5,	%f0,	%f10
	fmovsl	%xcc,	%f1,	%f24
	ta	%xcc,	0x2
	array32	%l1,	%i7,	%g7
	prefetch	[%l7 + 0x0C],	 0x2
	xnor	%o1,	0x1104,	%l6
	srl	%o7,	0x0D,	%i0
	xnor	%l4,	0x1C16,	%i6
	std	%f4,	[%l7 + 0x78]
	swap	[%l7 + 0x68],	%o3
	sethi	0x0C68,	%l0
	addcc	%o6,	%g6,	%g2
	movrgez	%l3,	%i2,	%l2
	tle	%xcc,	0x7
	edge32l	%i1,	%i4,	%g4
	fbl	%fcc2,	loop_544
	orcc	%o0,	%g5,	%o4
	array32	%o2,	%g1,	%i5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4B] %asi,	%g3
loop_544:
	sdiv	%i3,	0x1F6B,	%o5
	edge32	%l1,	%i7,	%g7
	srl	%l5,	0x1D,	%l6
	tpos	%icc,	0x3
	te	%xcc,	0x7
	bn,a,pt	%xcc,	loop_545
	movl	%icc,	%o7,	%i0
	sdivx	%l4,	0x075E,	%o1
	fbl	%fcc2,	loop_546
loop_545:
	stx	%i6,	[%l7 + 0x28]
	movrlez	%o3,	%l0,	%g6
	movvs	%icc,	%g2,	%o6
loop_546:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l3,	%i2,	%l2
	subcc	%i4,	0x1C9D,	%i1
	smul	%o0,	0x084C,	%g4
	tge	%xcc,	0x5
	sir	0x0023
	udivcc	%o4,	0x0292,	%o2
	fbue,a	%fcc2,	loop_547
	ld	[%l7 + 0x10],	%f0
	fbu,a	%fcc3,	loop_548
	andn	%g5,	0x1858,	%g1
loop_547:
	nop
	wr	%g0,	0xea,	%asi
	stwa	%i5,	[%l7 + 0x1C] %asi
	membar	#Sync
loop_548:
	edge32	%g3,	%i3,	%l1
	fmul8x16al	%f11,	%f16,	%f18
	addcc	%i7,	0x0A77,	%g7
	fsrc1s	%f13,	%f3
	addc	%o5,	%l6,	%l5
	fmovd	%f28,	%f30
	tcs	%xcc,	0x0
	tsubcctv	%i0,	0x0282,	%l4
	popc	%o1,	%i6
	bcs,pn	%xcc,	loop_549
	tn	%icc,	0x4
	stw	%o7,	[%l7 + 0x58]
	fnot2s	%f22,	%f9
loop_549:
	movl	%icc,	%l0,	%g6
	fpack16	%f8,	%f29
	nop
	setx	0x49CD9ED44B92E36E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xE3003ED5C1EF418A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f4,	%f10
	tge	%icc,	0x7
	fmovrdgez	%o3,	%f16,	%f18
	array16	%o6,	%l3,	%i2
	alignaddrl	%l2,	%g2,	%i1
	tsubcc	%i4,	%o0,	%o4
	fbul,a	%fcc0,	loop_550
	edge16ln	%o2,	%g4,	%g5
	ble,pn	%xcc,	loop_551
	bgu,pn	%icc,	loop_552
loop_550:
	fcmpeq32	%f28,	%f22,	%g1
	fmovdvc	%icc,	%f8,	%f29
loop_551:
	tvs	%xcc,	0x2
loop_552:
	brgez,a	%g3,	loop_553
	movl	%xcc,	%i5,	%i3
	bvc,pn	%xcc,	loop_554
	edge8l	%l1,	%g7,	%i7
loop_553:
	or	%l6,	%l5,	%o5
	andcc	%i0,	0x0BCC,	%l4
loop_554:
	fpsub32	%f6,	%f22,	%f18
	ta	%xcc,	0x0
	fbuge	%fcc1,	loop_555
	mulscc	%o1,	%o7,	%l0
	bcs	loop_556
	movgu	%icc,	%i6,	%o3
loop_555:
	sdiv	%g6,	0x14E1,	%o6
	movpos	%xcc,	%l3,	%l2
loop_556:
	fmovsge	%icc,	%f28,	%f23
	array32	%g2,	%i1,	%i2
	tneg	%xcc,	0x1
	lduw	[%l7 + 0x20],	%o0
	edge32l	%o4,	%o2,	%g4
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x42] %asi,	%g5
	fmovdle	%icc,	%f16,	%f19
	movrne	%i4,	%g1,	%i5
	fmovsg	%xcc,	%f24,	%f28
	movvc	%icc,	%i3,	%l1
	movleu	%icc,	%g3,	%g7
	fnot2s	%f30,	%f25
	orncc	%i7,	0x0A56,	%l5
	alignaddr	%l6,	%o5,	%i0
	ldstub	[%l7 + 0x3B],	%l4
	tle	%xcc,	0x7
	fmovdn	%icc,	%f26,	%f26
	xnorcc	%o1,	%o7,	%l0
	sdiv	%o3,	0x1D42,	%g6
	set	0x0C, %l3
	ldswa	[%l7 + %l3] 0x81,	%i6
	fmovrsgz	%o6,	%f7,	%f19
	sdivx	%l3,	0x041A,	%l2
	alignaddr	%i1,	%g2,	%o0
	movre	%o4,	%o2,	%i2
	tne	%xcc,	0x0
	edge32l	%g4,	%i4,	%g5
	nop
	setx	0x199A5C44,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xAAF3F711,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f30,	%f1
	fbuge,a	%fcc0,	loop_557
	tg	%xcc,	0x6
	wr	%g0,	0x23,	%asi
	stwa	%g1,	[%l7 + 0x54] %asi
	membar	#Sync
loop_557:
	movpos	%xcc,	%i5,	%i3
	fmovsa	%icc,	%f11,	%f16
	std	%f30,	[%l7 + 0x78]
	fnor	%f0,	%f18,	%f22
	edge8ln	%l1,	%g3,	%i7
	ldx	[%l7 + 0x28],	%g7
	movg	%icc,	%l5,	%l6
	nop
	setx	loop_558,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brz	%i0,	loop_559
	umul	%l4,	0x1402,	%o5
	udivx	%o1,	0x1FC6,	%l0
loop_558:
	smul	%o7,	0x17E2,	%g6
loop_559:
	tpos	%icc,	0x2
	ba	%xcc,	loop_560
	fcmple32	%f22,	%f24,	%i6
	tvs	%xcc,	0x5
	be,a	loop_561
loop_560:
	movneg	%icc,	%o3,	%o6
	tg	%xcc,	0x4
	andcc	%l2,	0x0715,	%l3
loop_561:
	be,pn	%xcc,	loop_562
	addcc	%g2,	%o0,	%i1
	nop
	setx	0xDCA07B4C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xAC576D57,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f0,	%f9
	nop
	set	0x3C, %o4
	stw	%o2,	[%l7 + %o4]
loop_562:
	fbe,a	%fcc0,	loop_563
	tpos	%xcc,	0x7
	edge32n	%i2,	%g4,	%o4
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x11
loop_563:
	fornot1	%f0,	%f20,	%f0
	tl	%icc,	0x0
	movrlez	%i4,	0x341,	%g1
	movrne	%i5,	%i3,	%l1
	andncc	%g5,	%g3,	%i7
	bleu,a,pn	%icc,	loop_564
	fbne,a	%fcc1,	loop_565
	bg,pn	%icc,	loop_566
	andncc	%l5,	%l6,	%i0
loop_564:
	movrgz	%l4,	%g7,	%o1
loop_565:
	edge16n	%l0,	%o5,	%g6
loop_566:
	fbu	%fcc1,	loop_567
	andncc	%i6,	%o3,	%o7
	edge8n	%o6,	%l3,	%g2
	edge8l	%o0,	%i1,	%l2
loop_567:
	ldsh	[%l7 + 0x1C],	%o2
	taddcc	%i2,	0x17DD,	%g4
	fmovsa	%icc,	%f29,	%f10
	umul	%o4,	0x139F,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc1,	loop_568
	movge	%xcc,	%i5,	%i3
	nop
	setx	0xFAF25E768FF1DCAA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f26
	fpack16	%f4,	%f23
loop_568:
	nop
	set	0x40, %i5
	stxa	%i4,	[%l7 + %i5] 0x10
	movcs	%xcc,	%l1,	%g5
	fmovscs	%icc,	%f26,	%f19
	edge16l	%i7,	%g3,	%l5
	edge8l	%l6,	%i0,	%g7
	fpmerge	%f19,	%f26,	%f30
	fmovsl	%icc,	%f9,	%f1
	movre	%o1,	0x16F,	%l0
	sethi	0x038A,	%o5
	tg	%xcc,	0x6
	fbg	%fcc0,	loop_569
	movcs	%xcc,	%l4,	%g6
	array32	%i6,	%o7,	%o3
	fmovdleu	%xcc,	%f12,	%f21
loop_569:
	ba	loop_570
	xorcc	%l3,	0x1677,	%o6
	brz,a	%g2,	loop_571
	sub	%o0,	0x0D76,	%i1
loop_570:
	edge32ln	%o2,	%l2,	%g4
	fmovrse	%o4,	%f2,	%f8
loop_571:
	ta	%xcc,	0x6
	ble,pt	%icc,	loop_572
	movle	%icc,	%g1,	%i2
	bl,a,pn	%xcc,	loop_573
	orn	%i5,	%i3,	%i4
loop_572:
	tn	%icc,	0x3
	fnands	%f31,	%f7,	%f8
loop_573:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l1,	%g5
	nop
	set	0x25, %l1
	ldstub	[%l7 + %l1],	%g3
	fmul8x16	%f15,	%f8,	%f6
	wr	%g0,	0xeb,	%asi
	stha	%l5,	[%l7 + 0x58] %asi
	membar	#Sync
	nop
	fitod	%f4,	%f8
	fdtoi	%f8,	%f11
	edge8	%i7,	%l6,	%i0
	nop
	fitos	%f14,	%f31
	fstox	%f31,	%f12
	tvs	%xcc,	0x5
	fmovd	%f2,	%f28
	add	%o1,	0x19ED,	%g7
	sethi	0x1731,	%o5
	nop
	setx	0xDF293750AB68C7EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x1475AA7E7898750E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f6,	%f12
	membar	0x40
	array8	%l4,	%g6,	%l0
	or	%i6,	0x0AB6,	%o7
	xorcc	%o3,	%o6,	%g2
	edge8l	%o0,	%l3,	%i1
	lduw	[%l7 + 0x18],	%o2
	ta	%xcc,	0x6
	udivx	%l2,	0x0701,	%o4
	ta	%xcc,	0x6
	addcc	%g4,	0x0515,	%g1
	ble,a,pn	%icc,	loop_574
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f0
	fxtod	%f0,	%f2
	fbu,a	%fcc3,	loop_575
	movcc	%xcc,	%i5,	%i2
loop_574:
	nop
	set	0x4A, %l2
	lduha	[%l7 + %l2] 0x18,	%i4
loop_575:
	move	%xcc,	%i3,	%l1
	ba,pt	%icc,	loop_576
	movn	%icc,	%g3,	%g5
	addcc	%l5,	0x0578,	%i7
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l6,	%o1
loop_576:
	edge8ln	%g7,	%o5,	%l4
	tn	%xcc,	0x0
	umul	%g6,	%l0,	%i6
	fba,a	%fcc3,	loop_577
	edge32n	%o7,	%i0,	%o3
	movleu	%xcc,	%o6,	%g2
	fsrc1s	%f0,	%f16
loop_577:
	fand	%f6,	%f6,	%f22
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%l3,	%i1
	edge8n	%o2,	%l2,	%o0
	fbe	%fcc3,	loop_578
	movg	%icc,	%g4,	%g1
	bgu,a	loop_579
	tle	%icc,	0x3
loop_578:
	movvs	%icc,	%o4,	%i5
	orncc	%i2,	0x1D11,	%i4
loop_579:
	fandnot1	%f14,	%f28,	%f10
	array32	%i3,	%g3,	%l1
	set	0x38, %o5
	ldxa	[%l7 + %o5] 0x11,	%g5
	move	%icc,	%i7,	%l6
	sth	%o1,	[%l7 + 0x40]
	fnegs	%f21,	%f13
	tsubcc	%l5,	%o5,	%l4
	tcs	%icc,	0x1
	orn	%g6,	%g7,	%i6
	movre	%o7,	%i0,	%l0
	subcc	%o6,	%g2,	%l3
	brlez,a	%o3,	loop_580
	movpos	%icc,	%i1,	%o2
	fba	%fcc3,	loop_581
	fandnot1s	%f1,	%f14,	%f28
loop_580:
	ldstub	[%l7 + 0x57],	%l2
	wr	%g0,	0x2b,	%asi
	stha	%g4,	[%l7 + 0x28] %asi
	membar	#Sync
loop_581:
	bleu	%icc,	loop_582
	tne	%icc,	0x0
	umul	%g1,	0x0426,	%o0
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x1C] %asi,	%o4
loop_582:
	fmovrdne	%i2,	%f12,	%f20
	sllx	%i4,	0x00,	%i5
	udiv	%g3,	0x0AA8,	%l1
	nop
	setx	0xEAF69941E07E12F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fcmpne16	%f20,	%f14,	%i3
	tcc	%xcc,	0x7
	fmovdvs	%icc,	%f1,	%f0
	orncc	%g5,	0x1A61,	%i7
	fmovsne	%xcc,	%f6,	%f29
	tvc	%icc,	0x0
	brnz,a	%o1,	loop_583
	edge16l	%l6,	%o5,	%l5
	xor	%g6,	0x00E8,	%l4
	fmovrse	%i6,	%f16,	%f9
loop_583:
	tl	%icc,	0x7
	bge,pn	%xcc,	loop_584
	orcc	%g7,	0x036B,	%i0
	movgu	%xcc,	%o7,	%o6
	set	0x08, %l0
	stwa	%l0,	[%l7 + %l0] 0x23
	membar	#Sync
loop_584:
	fmovrdlez	%g2,	%f22,	%f18
	tne	%xcc,	0x0
	mulx	%o3,	%i1,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x6
	nop
	fitos	%f11,	%f26
	fstod	%f26,	%f20
	fmovsl	%icc,	%f11,	%f22
	tcc	%icc,	0x3
	tcs	%icc,	0x7
	fmovrse	%l2,	%f7,	%f6
	bne	%xcc,	loop_585
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f8
	fxtod	%f8,	%f6
	tle	%icc,	0x4
	movrlez	%g4,	%g1,	%o2
loop_585:
	edge16l	%o4,	%i2,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x1
	fpsub16	%f12,	%f24,	%f14
	sra	%i5,	%i4,	%l1
	movn	%icc,	%i3,	%g3
	movneg	%icc,	%g5,	%i7
	stx	%o1,	[%l7 + 0x48]
	tleu	%icc,	0x0
	wr	%g0,	0x88,	%asi
	stha	%l6,	[%l7 + 0x36] %asi
	te	%icc,	0x3
	movcs	%icc,	%l5,	%o5
	fmovdn	%icc,	%f16,	%f27
	fmovsle	%icc,	%f9,	%f5
	tsubcctv	%l4,	0x0972,	%i6
	tvs	%icc,	0x3
	sdivx	%g7,	0x0BAC,	%i0
	nop
	setx	0xA8F80B96,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xBD72D5A0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f1,	%f17
	brlz	%o7,	loop_586
	and	%g6,	0x15F2,	%l0
	array8	%o6,	%o3,	%g2
	fmovsvc	%icc,	%f23,	%f12
loop_586:
	tvc	%xcc,	0x0
	subcc	%l3,	%i1,	%g4
	ldub	[%l7 + 0x61],	%g1
	xor	%l2,	%o2,	%i2
	sethi	0x13C2,	%o0
	te	%icc,	0x2
	fnot2s	%f16,	%f15
	tneg	%xcc,	0x5
	fxors	%f31,	%f17,	%f24
	fbe,a	%fcc0,	loop_587
	movn	%xcc,	%i5,	%i4
	lduw	[%l7 + 0x64],	%o4
	stx	%l1,	[%l7 + 0x70]
loop_587:
	umul	%g3,	%g5,	%i7
	fmovscs	%icc,	%f8,	%f24
	nop
	setx	loop_588,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcctv	%i3,	%o1,	%l6
	srlx	%o5,	0x11,	%l5
	fbo,a	%fcc0,	loop_589
loop_588:
	sll	%l4,	0x17,	%i6
	fmovdle	%xcc,	%f15,	%f8
	tvc	%xcc,	0x7
loop_589:
	movrlz	%g7,	%o7,	%g6
	std	%f20,	[%l7 + 0x08]
	bcc	%icc,	loop_590
	xnorcc	%l0,	0x0E89,	%i0
	set	0x20, %g4
	stxa	%o3,	[%g0 + %g4] 0x4f
loop_590:
	edge32l	%o6,	%l3,	%i1
	edge16	%g4,	%g2,	%l2
	edge16n	%o2,	%g1,	%i2
	sethi	0x171B,	%i5
	movg	%xcc,	%o0,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%o4,	%f27,	%f28
	sra	%g3,	%l1,	%g5
	tvs	%icc,	0x5
	xor	%i7,	%o1,	%i3
	movrlez	%o5,	%l6,	%l4
	movne	%xcc,	%i6,	%g7
	movl	%icc,	%o7,	%l5
	or	%l0,	%i0,	%o3
	bvc	%xcc,	loop_591
	udivx	%g6,	0x1080,	%l3
	edge32ln	%i1,	%o6,	%g4
	fbge	%fcc2,	loop_592
loop_591:
	srl	%g2,	%l2,	%o2
	tleu	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x42] %asi,	%g1
loop_592:
	nop
	setx	0x63A04DD5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x400E1150,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f5,	%f24
	tsubcc	%i2,	0x0C3D,	%i5
	movcs	%icc,	%i4,	%o4
	stbar
	and	%g3,	0x05DA,	%l1
	movrgz	%o0,	0x3EC,	%g5
	sethi	0x0E2F,	%o1
	te	%icc,	0x2
	xorcc	%i3,	%o5,	%i7
	fmovdvc	%icc,	%f16,	%f11
	udivcc	%l4,	0x186B,	%i6
	nop
	setx	loop_593,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdl	%icc,	%f10,	%f19
	nop
	fitos	%f5,	%f3
	fstox	%f3,	%f2
	fxtos	%f2,	%f6
	movn	%xcc,	%l6,	%g7
loop_593:
	addccc	%l5,	0x1A64,	%o7
	fbue,a	%fcc1,	loop_594
	fone	%f20
	mulscc	%i0,	%l0,	%o3
	movge	%xcc,	%l3,	%i1
loop_594:
	movrlez	%g6,	0x3B0,	%o6
	movne	%xcc,	%g2,	%l2
	edge16ln	%g4,	%g1,	%o2
	sdiv	%i5,	0x0A28,	%i4
	movle	%icc,	%o4,	%i2
	fmovdne	%icc,	%f3,	%f9
	xor	%g3,	%o0,	%g5
	brgz	%l1,	loop_595
	bvs,a	loop_596
	brlez	%i3,	loop_597
	xnorcc	%o5,	0x01C1,	%o1
loop_595:
	std	%f8,	[%l7 + 0x20]
loop_596:
	bcc	loop_598
loop_597:
	edge8n	%l4,	%i7,	%l6
	fmovd	%f8,	%f20
	umulcc	%g7,	0x08CE,	%l5
loop_598:
	fbu,a	%fcc1,	loop_599
	tvs	%xcc,	0x4
	sir	0x040B
	addccc	%o7,	0x0D40,	%i0
loop_599:
	tsubcctv	%i6,	%l0,	%l3
	fmovsne	%xcc,	%f27,	%f27
	membar	0x58
	umul	%i1,	%o3,	%g6
	edge16l	%o6,	%l2,	%g2
	udivcc	%g4,	0x07B4,	%g1
	movne	%xcc,	%o2,	%i5
	fornot2s	%f12,	%f7,	%f7
	nop
	setx	0x60778485,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	movg	%icc,	%i4,	%i2
	xnor	%g3,	%o0,	%g5
	edge16l	%o4,	%l1,	%o5
	smul	%o1,	%l4,	%i3
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x49] %asi,	%i7
	fmovdge	%icc,	%f17,	%f25
	alignaddr	%g7,	%l6,	%o7
	tvc	%xcc,	0x7
	lduh	[%l7 + 0x12],	%i0
	movrlez	%l5,	0x32F,	%l0
	edge32l	%i6,	%i1,	%l3
	addccc	%o3,	%g6,	%o6
	bneg,pt	%xcc,	loop_600
	subc	%l2,	%g4,	%g1
	nop
	setx	0xDF9C6620407D27B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	movgu	%xcc,	%o2,	%g2
loop_600:
	fmovsg	%icc,	%f31,	%f24
	edge32l	%i4,	%i5,	%i2
	edge8n	%o0,	%g5,	%g3
	tcc	%xcc,	0x4
	tl	%xcc,	0x7
	movl	%xcc,	%l1,	%o4
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x0c,	%f0
	mulx	%o5,	0x0C08,	%l4
	movvs	%icc,	%i3,	%i7
	edge32	%o1,	%l6,	%g7
	fmovrse	%o7,	%f27,	%f15
	srl	%i0,	%l5,	%l0
	fbo	%fcc1,	loop_601
	fbue,a	%fcc3,	loop_602
	ldd	[%l7 + 0x40],	%i6
	ldsh	[%l7 + 0x4E],	%l3
loop_601:
	andcc	%i1,	0x02B2,	%o3
loop_602:
	umulcc	%o6,	0x10B6,	%g6
	fmovse	%xcc,	%f25,	%f15
	fbge	%fcc3,	loop_603
	nop
	setx	0xF9E2053B2895FD0A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f20
	nop
	setx	0x2B97B51B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x49E970F1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f11,	%f9
	umul	%g4,	0x1832,	%l2
loop_603:
	mulx	%g1,	%o2,	%i4
	movrgez	%g2,	%i5,	%i2
	tgu	%xcc,	0x0
	xnor	%o0,	0x1252,	%g5
	movvc	%icc,	%l1,	%o4
	nop
	setx	0xC05A677B,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	movn	%xcc,	%o5,	%g3
	array8	%i3,	%i7,	%l4
	fblg,a	%fcc1,	loop_604
	fbg	%fcc0,	loop_605
	addc	%o1,	%g7,	%o7
	fmovsg	%icc,	%f17,	%f6
loop_604:
	fbue	%fcc2,	loop_606
loop_605:
	fbug	%fcc2,	loop_607
	fmovrde	%i0,	%f12,	%f12
	set	0x67, %g7
	ldsba	[%l7 + %g7] 0x18,	%l5
loop_606:
	nop
	wr	%g0,	0x2f,	%asi
	stwa	%l0,	[%l7 + 0x38] %asi
	membar	#Sync
loop_607:
	nop
	fitos	%f4,	%f0
	fstod	%f0,	%f12
	udivcc	%l6,	0x1A27,	%l3
	nop
	fitod	%f20,	%f2
	smul	%i1,	%i6,	%o6
	movrne	%g6,	0x0E9,	%g4
	addc	%l2,	%o3,	%g1
	tle	%icc,	0x3
	fbul	%fcc0,	loop_608
	ldd	[%l7 + 0x48],	%i4
	tpos	%icc,	0x4
	movcs	%icc,	%g2,	%o2
loop_608:
	tcs	%xcc,	0x5
	tpos	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i2,	%o0,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g5,	%o4
	movrne	%o5,	0x0E4,	%l1
	smulcc	%g3,	%i7,	%i3
	tn	%xcc,	0x5
	fmovdne	%icc,	%f0,	%f2
	set	0x7A, %g3
	ldsha	[%l7 + %g3] 0x19,	%l4
	fmovrde	%o1,	%f28,	%f24
	edge8l	%o7,	%g7,	%l5
	set	0x18, %i1
	ldsha	[%l7 + %i1] 0x14,	%l0
	fmovdn	%xcc,	%f7,	%f23
	fpsub32	%f28,	%f18,	%f18
	tvs	%xcc,	0x7
	set	0x39, %l5
	ldstuba	[%l7 + %l5] 0x18,	%i0
	andncc	%l6,	%i1,	%i6
	subcc	%l3,	0x1EB8,	%g6
	movcc	%xcc,	%o6,	%l2
	sdivx	%g4,	0x1CD9,	%g1
	fpack32	%f8,	%f20,	%f26
	array8	%o3,	%g2,	%o2
	sethi	0x09EE,	%i2
	addccc	%i4,	0x01F9,	%i5
	sdivcc	%g5,	0x021F,	%o4
	tneg	%icc,	0x5
	movrne	%o0,	0x015,	%o5
	set	0x7C, %o7
	ldsha	[%l7 + %o7] 0x0c,	%l1
	edge8l	%i7,	%i3,	%l4
	prefetch	[%l7 + 0x08],	 0x2
	movcs	%icc,	%g3,	%o1
	fones	%f16
	mova	%xcc,	%o7,	%g7
	edge32ln	%l5,	%i0,	%l6
	tcs	%xcc,	0x0
	fpack32	%f10,	%f0,	%f8
	ta	%xcc,	0x2
	fmovrdlz	%i1,	%f14,	%f26
	subcc	%i6,	0x0793,	%l3
	movleu	%xcc,	%g6,	%l0
	fmovrdne	%o6,	%f26,	%f28
	tgu	%icc,	0x3
	movneg	%icc,	%g4,	%l2
	sdivcc	%g1,	0x160A,	%o3
	edge8ln	%g2,	%o2,	%i4
	fmovse	%icc,	%f12,	%f20
	movn	%icc,	%i5,	%i2
	taddcctv	%o4,	0x0934,	%g5
	edge8n	%o0,	%o5,	%i7
	array8	%i3,	%l1,	%l4
	nop
	fitos	%f5,	%f9
	fstox	%f9,	%f4
	xorcc	%o1,	%g3,	%g7
	edge8n	%o7,	%l5,	%i0
	popc	0x0448,	%l6
	fpsub32	%f12,	%f24,	%f8
	fble	%fcc1,	loop_609
	tpos	%xcc,	0x6
	addccc	%i1,	0x0692,	%i6
	bpos	loop_610
loop_609:
	movvs	%xcc,	%g6,	%l0
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f8
	fmovsn	%xcc,	%f8,	%f28
loop_610:
	fmul8sux16	%f26,	%f26,	%f26
	popc	0x15AB,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g4,	%l3,	%g1
	ldd	[%l7 + 0x28],	%o2
	smulcc	%l2,	%o2,	%i4
	brlez	%g2,	loop_611
	bvs,pn	%icc,	loop_612
	add	%i2,	0x07D6,	%o4
	fpsub16s	%f23,	%f4,	%f3
loop_611:
	movvc	%icc,	%g5,	%o0
loop_612:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o5,	0x03E9,	%i7
	ldsb	[%l7 + 0x0B],	%i3
	tvs	%icc,	0x5
	orn	%i5,	0x118E,	%l1
	edge32l	%l4,	%o1,	%g7
	fbo	%fcc1,	loop_613
	array16	%g3,	%o7,	%l5
	fandnot2	%f30,	%f12,	%f6
	sra	%l6,	0x13,	%i0
loop_613:
	fmovrde	%i6,	%f16,	%f30
	fors	%f11,	%f10,	%f0
	mova	%icc,	%g6,	%l0
	xnor	%o6,	%i1,	%l3
	tvs	%xcc,	0x4
	fbge	%fcc2,	loop_614
	fbe,a	%fcc3,	loop_615
	te	%icc,	0x0
	bshuffle	%f2,	%f14,	%f22
loop_614:
	bcc,a,pt	%icc,	loop_616
loop_615:
	nop
	set	0x68, %l4
	ldstub	[%l7 + %l4],	%g4
	tn	%xcc,	0x3
	addccc	%o3,	0x0079,	%l2
loop_616:
	edge8	%g1,	%o2,	%g2
	stb	%i2,	[%l7 + 0x1C]
	ta	%xcc,	0x3
	ta	%xcc,	0x0
	movcs	%xcc,	%o4,	%i4
	sdivx	%o0,	0x10BC,	%g5
	subcc	%i7,	0x175A,	%o5
	add	%i5,	0x1A27,	%l1
	fbul,a	%fcc0,	loop_617
	edge16l	%i3,	%o1,	%l4
	movrlz	%g3,	0x246,	%o7
	nop
	setx	0x2474F897BD0E9C70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x77324B99F46B261A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f28,	%f28
loop_617:
	sdivcc	%g7,	0x02A7,	%l5
	mulscc	%l6,	0x0486,	%i6
	fmovrdlez	%i0,	%f6,	%f20
	fmovrdne	%g6,	%f24,	%f22
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%o6
	sub	%i1,	%g4,	%o3
	brlz,a	%l3,	loop_618
	fpadd16s	%f18,	%f30,	%f12
	fpackfix	%f16,	%f29
	fbl	%fcc3,	loop_619
loop_618:
	movn	%icc,	%g1,	%o2
	taddcc	%l2,	%i2,	%o4
	bgu,a,pt	%icc,	loop_620
loop_619:
	fblg,a	%fcc3,	loop_621
	fnot2s	%f19,	%f19
	udivx	%i4,	0x1698,	%g2
loop_620:
	array8	%o0,	%i7,	%o5
loop_621:
	edge8ln	%g5,	%i5,	%l1
	fbne	%fcc0,	loop_622
	fmovrdgez	%o1,	%f10,	%f2
	for	%f12,	%f2,	%f12
	movge	%icc,	%i3,	%g3
loop_622:
	fblg,a	%fcc1,	loop_623
	fmuld8ulx16	%f5,	%f26,	%f20
	movre	%o7,	%g7,	%l5
	fpadd16s	%f14,	%f1,	%f24
loop_623:
	edge16ln	%l4,	%i6,	%i0
	fpack16	%f26,	%f26
	move	%icc,	%g6,	%l0
	tvs	%icc,	0x5
	nop
	set	0x3C, %g2
	sth	%l6,	[%l7 + %g2]
	mulscc	%i1,	%g4,	%o6
	taddcc	%l3,	%o3,	%o2
	taddcc	%g1,	0x18A8,	%l2
	edge16ln	%i2,	%i4,	%g2
	edge8ln	%o0,	%o4,	%i7
	movrlez	%o5,	0x3BF,	%g5
	subccc	%i5,	0x0B85,	%o1
	bcc,pt	%icc,	loop_624
	fnor	%f26,	%f24,	%f30
	bvc	%xcc,	loop_625
	subcc	%i3,	%g3,	%l1
loop_624:
	fmovrdne	%g7,	%f18,	%f18
	addccc	%o7,	%l5,	%i6
loop_625:
	fbn,a	%fcc2,	loop_626
	fbo	%fcc1,	loop_627
	fmovscs	%xcc,	%f2,	%f0
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%l4
loop_626:
	nop
	wr	%g0,	0x04,	%asi
	stwa	%i0,	[%l7 + 0x1C] %asi
loop_627:
	umul	%l0,	0x16F8,	%g6
	be,a	%xcc,	loop_628
	tneg	%xcc,	0x7
	mulx	%l6,	0x048F,	%i1
	movcc	%xcc,	%g4,	%l3
loop_628:
	stx	%o3,	[%l7 + 0x38]
	fand	%f28,	%f24,	%f20
	sra	%o2,	0x19,	%o6
	tge	%xcc,	0x7
	stx	%l2,	[%l7 + 0x18]
	brz	%g1,	loop_629
	fba	%fcc1,	loop_630
	bgu,a	%icc,	loop_631
	tgu	%icc,	0x1
loop_629:
	andncc	%i4,	%g2,	%o0
loop_630:
	edge8ln	%o4,	%i2,	%i7
loop_631:
	fbug,a	%fcc1,	loop_632
	array8	%g5,	%o5,	%o1
	movg	%icc,	%i3,	%i5
	nop
	setx	0x8D58C2CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f30
loop_632:
	addccc	%g3,	0x1185,	%g7
	udiv	%l1,	0x10D5,	%o7
	xnor	%l5,	0x0CFE,	%l4
	movle	%icc,	%i0,	%l0
	stx	%g6,	[%l7 + 0x40]
	tcs	%icc,	0x1
	addccc	%i6,	0x173F,	%l6
	addc	%g4,	0x11E0,	%l3
	stbar
	fbo	%fcc1,	loop_633
	fmul8x16au	%f3,	%f11,	%f10
	nop
	setx	0x4A156EC820429EB8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	bvc	%icc,	loop_634
loop_633:
	brlez	%i1,	loop_635
	and	%o2,	%o6,	%o3
	movcc	%icc,	%g1,	%i4
loop_634:
	nop
	set	0x60, %g1
	ldswa	[%l7 + %g1] 0x14,	%l2
loop_635:
	fbu,a	%fcc3,	loop_636
	addccc	%o0,	0x054D,	%o4
	mulscc	%g2,	0x0622,	%i2
	tcc	%xcc,	0x2
loop_636:
	nop
	set	0x0A, %o6
	ldsha	[%l7 + %o6] 0x14,	%g5
	fnot1	%f8,	%f12
	smul	%i7,	0x1938,	%o5
	te	%xcc,	0x4
	fmovs	%f0,	%f23
	movge	%xcc,	%o1,	%i3
	xor	%g3,	%i5,	%l1
	movrne	%g7,	0x07C,	%o7
	umulcc	%l5,	%i0,	%l0
	fmovsgu	%xcc,	%f6,	%f12
	smulcc	%l4,	%i6,	%l6
	xnorcc	%g4,	0x0520,	%g6
	orn	%i1,	0x1CEE,	%l3
	fnot1	%f10,	%f8
	edge8ln	%o6,	%o2,	%g1
	set	0x70, %i6
	lduwa	[%l7 + %i6] 0x81,	%o3
	fmovrslz	%i4,	%f8,	%f12
	movre	%l2,	%o4,	%g2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%o0,	%g5
	lduh	[%l7 + 0x38],	%i2
	nop
	setx	loop_637,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%i7,	0x062A,	%o5
	fnands	%f13,	%f6,	%f11
	tcc	%xcc,	0x0
loop_637:
	nop
	setx	0x004E268A,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	popc	%i3,	%g3
	movrlez	%o1,	%i5,	%l1
	fabss	%f6,	%f5
	nop
	setx	loop_638,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bl,pt	%icc,	loop_639
	udivcc	%o7,	0x0AB9,	%l5
	st	%f21,	[%l7 + 0x34]
loop_638:
	fpadd32s	%f5,	%f8,	%f19
loop_639:
	movn	%icc,	%g7,	%l0
	fnot2	%f26,	%f14
	movgu	%xcc,	%i0,	%l4
	fpadd16s	%f27,	%f30,	%f6
	array8	%l6,	%i6,	%g4
	move	%xcc,	%g6,	%i1
	tcs	%xcc,	0x2
	mova	%xcc,	%o6,	%o2
	addc	%l3,	%o3,	%g1
	subcc	%i4,	0x1469,	%o4
	fornot2	%f20,	%f14,	%f20
	add	%l2,	%o0,	%g2
	andcc	%i2,	0x126A,	%i7
	edge32l	%g5,	%i3,	%g3
	srl	%o5,	%i5,	%o1
	movre	%l1,	%o7,	%l5
	prefetch	[%l7 + 0x78],	 0x1
	te	%icc,	0x4
	edge32n	%g7,	%l0,	%i0
	array16	%l4,	%l6,	%g4
	edge8n	%g6,	%i1,	%o6
	xnor	%i6,	%l3,	%o3
	ta	%icc,	0x4
	edge8n	%g1,	%i4,	%o4
	umulcc	%o2,	%l2,	%o0
	set	0x19, %i0
	stba	%i2,	[%l7 + %i0] 0x0c
	fmovd	%f14,	%f30
	fpadd32s	%f20,	%f9,	%f27
	fbl	%fcc3,	loop_640
	movl	%xcc,	%i7,	%g2
	edge16	%i3,	%g3,	%g5
	std	%f2,	[%l7 + 0x38]
loop_640:
	bneg,a,pt	%icc,	loop_641
	taddcctv	%o5,	%o1,	%i5
	mulscc	%l1,	0x0EF6,	%o7
	movneg	%icc,	%l5,	%l0
loop_641:
	addc	%g7,	%l4,	%i0
	movpos	%icc,	%g4,	%g6
	mulx	%i1,	%o6,	%i6
	bn,pn	%icc,	loop_642
	movcc	%xcc,	%l3,	%o3
	or	%l6,	0x054A,	%i4
	udivcc	%g1,	0x1E4E,	%o2
loop_642:
	taddcctv	%l2,	0x111D,	%o4
	mulx	%i2,	0x0516,	%o0
	ta	%icc,	0x3
	fmovrslz	%i7,	%f22,	%f27
	fxors	%f23,	%f10,	%f24
	fmovsge	%xcc,	%f31,	%f30
	smul	%g2,	0x058F,	%i3
	fmovscs	%icc,	%f14,	%f0
	umul	%g3,	0x137E,	%g5
	fmovdvs	%xcc,	%f24,	%f7
	udiv	%o1,	0x0148,	%o5
	nop
	setx	0x4E33D94C60744B37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	ldstub	[%l7 + 0x60],	%l1
	movpos	%icc,	%i5,	%o7
	nop
	setx	0xE0AD0DBA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xAAB22C35,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f8,	%f2
	movge	%icc,	%l0,	%g7
	fmovdge	%xcc,	%f12,	%f15
	nop
	setx	0xBAD39F651EC3F1AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xC569530D5A5C11B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f16,	%f20
	fpadd16	%f12,	%f30,	%f10
	edge8	%l4,	%l5,	%g4
	andncc	%g6,	%i1,	%o6
	addccc	%i6,	%l3,	%o3
	bgu,pt	%icc,	loop_643
	array32	%l6,	%i4,	%g1
	set	0x3E, %g5
	stha	%o2,	[%l7 + %g5] 0x0c
loop_643:
	tpos	%icc,	0x6
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x7B] %asi,	%l2
	addc	%i0,	%i2,	%o0
	fbne	%fcc1,	loop_644
	movrgz	%i7,	%g2,	%i3
	nop
	setx	0x6C3D1D9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f0
	bvc,a,pt	%xcc,	loop_645
loop_644:
	fmovscc	%xcc,	%f20,	%f4
	movl	%xcc,	%g3,	%o4
	sir	0x00F4
loop_645:
	fmovrse	%o1,	%f23,	%f23
	movrgez	%g5,	%l1,	%i5
	stbar
	movpos	%xcc,	%o7,	%l0
	brnz,a	%g7,	loop_646
	sth	%o5,	[%l7 + 0x58]
	ldd	[%l7 + 0x68],	%l4
	fbu,a	%fcc3,	loop_647
loop_646:
	fandnot1	%f10,	%f4,	%f14
	bne,a,pn	%icc,	loop_648
	bcc,a	loop_649
loop_647:
	fbuge,a	%fcc3,	loop_650
	bcs,pn	%xcc,	loop_651
loop_648:
	movrgz	%l5,	0x0EE,	%g4
loop_649:
	fbug,a	%fcc0,	loop_652
loop_650:
	fbo	%fcc0,	loop_653
loop_651:
	bvc,pt	%xcc,	loop_654
	membar	0x57
loop_652:
	subccc	%i1,	0x138E,	%o6
loop_653:
	addc	%g6,	0x01DE,	%l3
loop_654:
	movne	%icc,	%i6,	%l6
	edge8	%i4,	%g1,	%o3
	edge32ln	%l2,	%o2,	%i0
	umul	%o0,	%i2,	%i7
	fmovsle	%xcc,	%f5,	%f27
	brgez	%g2,	loop_655
	smul	%i3,	%o4,	%o1
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
loop_655:
	bleu,a	loop_656
	sub	%l1,	%g5,	%o7
	fmovsne	%xcc,	%f1,	%f14
	edge16l	%i5,	%l0,	%o5
loop_656:
	smul	%g7,	%l4,	%l5
	set	0x6C, %i3
	stba	%g4,	[%l7 + %i3] 0xea
	membar	#Sync
	be,pt	%icc,	loop_657
	tgu	%icc,	0x7
	fcmpne16	%f12,	%f30,	%o6
	smul	%g6,	%i1,	%l3
loop_657:
	tvs	%xcc,	0x6
	set	0x78, %o1
	sta	%f27,	[%l7 + %o1] 0x15
	movre	%l6,	0x171,	%i6
	xnorcc	%g1,	0x010E,	%i4
	udivcc	%o3,	0x1913,	%l2
	bvs,a	loop_658
	subcc	%o2,	0x1129,	%i0
	fmul8x16al	%f10,	%f14,	%f0
	fnor	%f2,	%f26,	%f8
loop_658:
	std	%f2,	[%l7 + 0x60]
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f6
	fxtod	%f6,	%f24
	fpsub16s	%f13,	%f0,	%f20
	movcs	%xcc,	%o0,	%i2
	edge16	%i7,	%i3,	%o4
	sth	%o1,	[%l7 + 0x5A]
	ldd	[%l7 + 0x58],	%f30
	fmovdleu	%xcc,	%f16,	%f1
	tsubcctv	%g3,	0x1BA9,	%l1
	stx	%g2,	[%l7 + 0x38]
	addcc	%g5,	%i5,	%l0
	set	0x28, %o3
	stxa	%o5,	[%l7 + %o3] 0x2a
	membar	#Sync
	stbar
	xorcc	%o7,	0x0FDA,	%g7
	set	0x1D, %i4
	ldsba	[%l7 + %i4] 0x15,	%l5
	set	0x40, %i2
	ldxa	[%l7 + %i2] 0x04,	%g4
	set	0x20, %i7
	swapa	[%l7 + %i7] 0x89,	%l4
	subc	%o6,	0x0A6C,	%i1
	prefetch	[%l7 + 0x5C],	 0x2
	movrlez	%g6,	0x1B7,	%l3
	mova	%xcc,	%l6,	%i6
	fmovrsgez	%i4,	%f28,	%f26
	tgu	%xcc,	0x0
	fmovrslez	%o3,	%f21,	%f9
	bge,a,pn	%xcc,	loop_659
	tn	%xcc,	0x0
	fbge	%fcc2,	loop_660
	ba,pt	%icc,	loop_661
loop_659:
	fmovsgu	%xcc,	%f5,	%f23
	and	%g1,	%o2,	%i0
loop_660:
	nop
	setx	loop_662,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_661:
	fxnors	%f10,	%f1,	%f24
	brgez	%l2,	loop_663
	fmovrslez	%i2,	%f27,	%f8
loop_662:
	lduw	[%l7 + 0x70],	%o0
	addccc	%i3,	%o4,	%o1
loop_663:
	subcc	%g3,	%l1,	%g2
	fornot1	%f30,	%f18,	%f12
	fbe	%fcc2,	loop_664
	nop
	setx loop_665, %l0, %l1
	jmpl %l1, %g5
	fpsub16s	%f16,	%f5,	%f5
	movn	%icc,	%i5,	%l0
loop_664:
	nop
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%o7
loop_665:
	tsubcc	%g7,	%i7,	%g4
	tgu	%xcc,	0x6
	fmovdn	%xcc,	%f0,	%f8
	addcc	%l4,	0x1B74,	%o6
	movne	%icc,	%l5,	%g6
	set	0x41, %l6
	lduba	[%l7 + %l6] 0x0c,	%l3
	movrlz	%i1,	%i6,	%l6
	tcc	%xcc,	0x0
	tpos	%icc,	0x3
	tcc	%icc,	0x4
	nop
	fitod	%f23,	%f8
	fbl,a	%fcc0,	loop_666
	call	loop_667
	fmovdne	%xcc,	%f18,	%f24
	movne	%xcc,	%i4,	%g1
loop_666:
	and	%o3,	%i0,	%l2
loop_667:
	stw	%o2,	[%l7 + 0x18]
	tcc	%icc,	0x4
	bcc,a	loop_668
	bg,a	loop_669
	movre	%o0,	0x3BE,	%i2
	edge16l	%o4,	%o1,	%g3
loop_668:
	bcs,a,pn	%xcc,	loop_670
loop_669:
	tn	%icc,	0x0
	andcc	%l1,	%g2,	%g5
	bpos,pn	%icc,	loop_671
loop_670:
	fcmple32	%f8,	%f2,	%i3
	taddcctv	%l0,	0x103A,	%o5
	fmovsvc	%xcc,	%f16,	%f12
loop_671:
	nop
	setx	loop_672,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq32	%f18,	%f24,	%i5
	membar	0x74
	tne	%xcc,	0x7
loop_672:
	xnorcc	%g7,	0x0655,	%i7
	te	%xcc,	0x1
	move	%xcc,	%o7,	%g4
	mulscc	%l4,	0x1846,	%l5
	array32	%o6,	%g6,	%i1
	alignaddr	%i6,	%l6,	%l3
	sll	%i4,	%g1,	%i0
	smulcc	%l2,	0x1100,	%o3
	fbn	%fcc1,	loop_673
	fmovrsgz	%o0,	%f30,	%f3
	bpos,a,pt	%xcc,	loop_674
	movre	%o2,	%o4,	%i2
loop_673:
	ta	%icc,	0x1
	fpadd16	%f30,	%f8,	%f10
loop_674:
	fmul8sux16	%f22,	%f20,	%f8
	nop
	setx loop_675, %l0, %l1
	jmpl %l1, %g3
	andn	%o1,	%l1,	%g2
	alignaddrl	%g5,	%i3,	%o5
	alignaddrl	%i5,	%l0,	%g7
loop_675:
	fnands	%f26,	%f15,	%f26
	and	%o7,	0x08B0,	%i7
	fsrc2s	%f1,	%f27
	fornot2s	%f2,	%f30,	%f19
	edge32ln	%g4,	%l4,	%o6
	subc	%l5,	0x12A7,	%g6
	nop
	setx loop_676, %l0, %l1
	jmpl %l1, %i6
	ta	%icc,	0x3
	nop
	fitos	%f4,	%f24
	fstox	%f24,	%f28
	edge16	%l6,	%l3,	%i1
loop_676:
	te	%xcc,	0x1
	fpsub32	%f12,	%f24,	%f14
	srax	%g1,	0x03,	%i4
	subcc	%l2,	0x07B1,	%i0
	faligndata	%f4,	%f20,	%f4
	bneg,a	%xcc,	loop_677
	tsubcctv	%o0,	%o3,	%o4
	fmovsneg	%icc,	%f31,	%f28
	nop
	setx	loop_678,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_677:
	sra	%o2,	0x15,	%i2
	srl	%g3,	%o1,	%g2
	ldx	[%l7 + 0x50],	%g5
loop_678:
	srl	%i3,	0x0A,	%l1
	movre	%o5,	0x0E2,	%l0
	fbge	%fcc2,	loop_679
	alignaddr	%i5,	%o7,	%g7
	smul	%g4,	0x0420,	%i7
	tsubcctv	%l4,	0x1A08,	%l5
loop_679:
	edge8	%g6,	%i6,	%l6
	movrgz	%l3,	0x3BD,	%o6
	movcc	%icc,	%g1,	%i4
	fandnot2s	%f6,	%f3,	%f6
	nop
	setx	0x5E568BABAE4C58FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f2
	orcc	%l2,	0x0113,	%i0
	popc	%o0,	%o3
	bl	%icc,	loop_680
	nop
	fitod	%f7,	%f22
	bgu,a,pn	%icc,	loop_681
	ldsb	[%l7 + 0x11],	%i1
loop_680:
	movrne	%o4,	0x198,	%o2
	fcmple16	%f8,	%f18,	%i2
loop_681:
	movvs	%xcc,	%o1,	%g2
	movvc	%icc,	%g3,	%i3
	bpos,a,pt	%icc,	loop_682
	ble	%icc,	loop_683
	udiv	%l1,	0x15AA,	%g5
	edge32ln	%o5,	%i5,	%l0
loop_682:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_683:
	sra	%o7,	0x0E,	%g7
	udivcc	%g4,	0x0CBA,	%i7
	stw	%l4,	[%l7 + 0x6C]
	nop
	fitos	%f0,	%f23
	fstoi	%f23,	%f30
	tneg	%icc,	0x5
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x14] %asi,	%l5
	movre	%i6,	%l6,	%l3
	fmovdpos	%xcc,	%f3,	%f4
	bge,a,pt	%icc,	loop_684
	fmovdne	%icc,	%f6,	%f6
	fblg	%fcc1,	loop_685
	sdivx	%o6,	0x1327,	%g6
loop_684:
	subcc	%i4,	0x1ED5,	%l2
	membar	0x71
loop_685:
	nop
	set	0x60, %o2
	lduwa	[%l7 + %o2] 0x04,	%i0
	mova	%xcc,	%g1,	%o3
	fmuld8sux16	%f1,	%f5,	%f10
	andn	%i1,	0x0FCA,	%o0
	array32	%o2,	%i2,	%o4
	ldsb	[%l7 + 0x36],	%g2
	edge32	%g3,	%o1,	%i3
	brgz	%g5,	loop_686
	fmovdneg	%icc,	%f5,	%f18
	edge16l	%o5,	%l1,	%i5
	sdiv	%l0,	0x1056,	%g7
loop_686:
	udivx	%o7,	0x1F4A,	%g4
	edge16n	%l4,	%i7,	%i6
	fxnor	%f2,	%f2,	%f12
	movre	%l6,	%l3,	%o6
	udivcc	%g6,	0x05DB,	%l5
	sra	%i4,	0x0C,	%i0
	set	0x46, %o4
	stha	%l2,	[%l7 + %o4] 0x80
	membar	0x4E
	alignaddrl	%g1,	%i1,	%o0
	edge8ln	%o2,	%o3,	%o4
	brlez,a	%i2,	loop_687
	tneg	%icc,	0x3
	tle	%xcc,	0x3
	brnz	%g3,	loop_688
loop_687:
	edge8ln	%g2,	%o1,	%i3
	sir	0x0884
	fmul8ulx16	%f0,	%f10,	%f12
loop_688:
	fcmpgt32	%f30,	%f10,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f31,	%f14
	call	loop_689
	srl	%l1,	0x18,	%i5
	fcmpeq16	%f12,	%f12,	%l0
	movge	%xcc,	%g5,	%o7
loop_689:
	mulscc	%g7,	0x1C62,	%g4
	fmovsa	%xcc,	%f4,	%f23
	taddcctv	%i7,	%i6,	%l4
	call	loop_690
	ble,pn	%icc,	loop_691
	fnot2s	%f17,	%f16
	move	%icc,	%l6,	%o6
loop_690:
	edge16l	%g6,	%l3,	%i4
loop_691:
	fpadd32s	%f16,	%f31,	%f28
	taddcctv	%l5,	%l2,	%i0
	sllx	%g1,	%i1,	%o0
	brlz	%o3,	loop_692
	flush	%l7 + 0x08
	sllx	%o4,	%i2,	%g3
	edge32ln	%g2,	%o2,	%i3
loop_692:
	fpsub16	%f8,	%f20,	%f20
	edge16n	%o1,	%o5,	%i5
	tl	%xcc,	0x7
	movne	%icc,	%l0,	%l1
	sdiv	%g5,	0x08DF,	%o7
	fornot1s	%f12,	%f10,	%f27
	smulcc	%g4,	%g7,	%i6
	movn	%xcc,	%l4,	%l6
	edge16ln	%i7,	%g6,	%l3
	sdivx	%i4,	0x0964,	%l5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%l2
	bl	%icc,	loop_693
	fcmple16	%f4,	%f22,	%i0
	udivx	%o6,	0x0D3B,	%i1
	bneg	%icc,	loop_694
loop_693:
	movgu	%xcc,	%g1,	%o3
	fzeros	%f30
	movcc	%icc,	%o4,	%o0
loop_694:
	srl	%i2,	0x18,	%g2
	tgu	%xcc,	0x7
	stbar
	taddcctv	%g3,	%o2,	%i3
	brnz	%o5,	loop_695
	tcc	%icc,	0x1
	alignaddrl	%i5,	%o1,	%l1
	brgez,a	%g5,	loop_696
loop_695:
	xnorcc	%l0,	%g4,	%o7
	tn	%xcc,	0x6
	movne	%xcc,	%g7,	%l4
loop_696:
	sir	0x0CC7
	wr	%g0,	0x81,	%asi
	stha	%l6,	[%l7 + 0x72] %asi
	edge32l	%i7,	%g6,	%i6
	xnor	%i4,	0x0A36,	%l5
	taddcctv	%l2,	%l3,	%o6
	orn	%i0,	0x05B6,	%g1
	smulcc	%o3,	0x1A6B,	%o4
	sethi	0x04CE,	%o0
	srl	%i1,	%i2,	%g3
	membar	0x4F
	stbar
	brlz,a	%g2,	loop_697
	tneg	%icc,	0x7
	alignaddrl	%o2,	%o5,	%i3
	tsubcc	%o1,	0x1994,	%l1
loop_697:
	movge	%icc,	%i5,	%g5
	edge8n	%l0,	%g4,	%g7
	nop
	setx	loop_698,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%icc,	%o7,	%l4
	orcc	%l6,	0x1A6D,	%g6
	fmovrde	%i6,	%f6,	%f0
loop_698:
	sra	%i4,	0x12,	%l5
	movre	%i7,	0x3A7,	%l3
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movgu	%xcc,	%l2,	%i0
	tne	%xcc,	0x1
	set	0x54, %g6
	ldstuba	[%l7 + %g6] 0x18,	%o6
	xor	%o3,	%o4,	%g1
	movgu	%icc,	%o0,	%i2
	tvs	%xcc,	0x2
	subc	%g3,	%i1,	%o2
	movneg	%xcc,	%o5,	%i3
	umulcc	%o1,	0x1E72,	%g2
	set	0x12, %l3
	lduha	[%l7 + %l3] 0x80,	%l1
	taddcc	%i5,	0x0F11,	%g5
	tvc	%xcc,	0x7
	sth	%l0,	[%l7 + 0x50]
	alignaddrl	%g4,	%o7,	%l4
	ldsb	[%l7 + 0x20],	%l6
	wr	%g0,	0x0c,	%asi
	sta	%f20,	[%l7 + 0x58] %asi
	mulscc	%g6,	0x0262,	%g7
	movn	%icc,	%i4,	%l5
	alignaddrl	%i6,	%i7,	%l2
	fxnor	%f22,	%f18,	%f14
	prefetch	[%l7 + 0x58],	 0x1
	sra	%i0,	0x01,	%l3
	mulx	%o3,	0x12D5,	%o6
	movrlez	%o4,	0x2C5,	%o0
	ble	loop_699
	andncc	%i2,	%g1,	%i1
	brlz,a	%o2,	loop_700
	fnand	%f24,	%f8,	%f14
loop_699:
	brz	%o5,	loop_701
	orn	%i3,	0x146F,	%o1
loop_700:
	fornot1s	%f29,	%f29,	%f30
	nop
	fitos	%f11,	%f18
	fstox	%f18,	%f6
loop_701:
	edge16l	%g2,	%g3,	%i5
	bcs,a	%icc,	loop_702
	nop
	fitod	%f6,	%f10
	fdtoi	%f10,	%f12
	edge8ln	%l1,	%g5,	%l0
	movvs	%xcc,	%g4,	%o7
loop_702:
	addc	%l4,	%l6,	%g7
	brgz	%g6,	loop_703
	udivx	%l5,	0x091C,	%i6
	fabss	%f20,	%f16
	fmovsl	%xcc,	%f19,	%f12
loop_703:
	tvs	%xcc,	0x6
	edge32ln	%i7,	%i4,	%i0
	swap	[%l7 + 0x30],	%l3
	tge	%icc,	0x3
	movne	%xcc,	%l2,	%o3
	bge	%xcc,	loop_704
	fmovd	%f22,	%f4
	tgu	%xcc,	0x1
	edge16n	%o4,	%o0,	%i2
loop_704:
	fmovdvs	%xcc,	%f15,	%f12
	edge16n	%o6,	%g1,	%i1
	fbge	%fcc0,	loop_705
	tcc	%icc,	0x7
	bge,a	loop_706
	alignaddrl	%o2,	%o5,	%o1
loop_705:
	nop
	set	0x3B, %l1
	ldstuba	[%l7 + %l1] 0x88,	%i3
loop_706:
	prefetch	[%l7 + 0x24],	 0x2
	tpos	%xcc,	0x6
	stbar
	tneg	%xcc,	0x5
	fbuge	%fcc3,	loop_707
	edge32	%g3,	%g2,	%l1
	xor	%i5,	%l0,	%g4
	smulcc	%g5,	0x12BD,	%o7
loop_707:
	xorcc	%l6,	0x18A7,	%l4
	fxnor	%f12,	%f10,	%f14
	fmovdn	%xcc,	%f1,	%f20
	std	%f4,	[%l7 + 0x70]
	tleu	%icc,	0x6
	bvs,a	loop_708
	smulcc	%g7,	0x1E77,	%l5
	nop
	fitos	%f2,	%f12
	fstox	%f12,	%f26
	fbule,a	%fcc1,	loop_709
loop_708:
	sdivx	%i6,	0x0345,	%i7
	fbu	%fcc0,	loop_710
	swap	[%l7 + 0x14],	%g6
loop_709:
	and	%i4,	%l3,	%i0
	tpos	%xcc,	0x2
loop_710:
	movre	%l2,	%o4,	%o0
	tleu	%xcc,	0x7
	popc	%o3,	%i2
	set	0x08, %l2
	stxa	%o6,	[%l7 + %l2] 0x14
	fandnot2	%f0,	%f4,	%f4
	edge16n	%i1,	%o2,	%o5
	membar	0x10
	fmovs	%f13,	%f13
	andcc	%o1,	0x0FC0,	%g1
	nop
	setx	loop_711,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array8	%g3,	%g2,	%l1
	fmovsleu	%icc,	%f12,	%f18
	fexpand	%f0,	%f20
loop_711:
	bn	%icc,	loop_712
	ldx	[%l7 + 0x60],	%i5
	ldd	[%l7 + 0x30],	%i2
	fmovrse	%g4,	%f3,	%f13
loop_712:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	edge32ln	%l0,	%l6,	%l4
	smul	%o7,	0x0F55,	%g7
	andcc	%l5,	%i6,	%g6
	fmovrsne	%i7,	%f10,	%f24
	movrne	%i4,	%l3,	%i0
	fcmpgt16	%f0,	%f2,	%l2
	movge	%xcc,	%o4,	%o3
	fsrc2	%f12,	%f4
	movgu	%icc,	%i2,	%o0
	fmovsgu	%icc,	%f20,	%f4
	fbo,a	%fcc1,	loop_713
	array16	%o6,	%i1,	%o5
	bn,a	%icc,	loop_714
	fnot2s	%f31,	%f10
loop_713:
	st	%f2,	[%l7 + 0x30]
	fnands	%f31,	%f9,	%f1
loop_714:
	lduh	[%l7 + 0x2C],	%o2
	taddcctv	%o1,	%g1,	%g2
	nop
	setx	0xA59FDBFED070452C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fpsub16	%f20,	%f28,	%f12
	fmovrde	%g3,	%f26,	%f18
	movrlz	%l1,	0x264,	%i3
	movg	%xcc,	%i5,	%g5
	lduh	[%l7 + 0x14],	%l0
	srl	%g4,	%l6,	%o7
	movvs	%xcc,	%l4,	%g7
	fmovrslez	%l5,	%f3,	%f13
	subcc	%g6,	0x082D,	%i6
	fbn,a	%fcc2,	loop_715
	nop
	setx	0x8DF56F63,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f2
	ta	%icc,	0x2
	srlx	%i4,	%l3,	%i7
loop_715:
	edge8n	%l2,	%i0,	%o3
	subccc	%o4,	%i2,	%o6
	smul	%i1,	%o0,	%o5
	movleu	%xcc,	%o2,	%o1
	addc	%g2,	%g1,	%g3
	fmovrde	%l1,	%f26,	%f12
	addc	%i3,	%i5,	%g5
	fmovdleu	%icc,	%f14,	%f21
	movvc	%xcc,	%l0,	%l6
	bpos	loop_716
	taddcctv	%g4,	0x0AB0,	%l4
	tleu	%xcc,	0x3
	stb	%o7,	[%l7 + 0x54]
loop_716:
	bge,a	%xcc,	loop_717
	edge32ln	%g7,	%l5,	%g6
	tl	%xcc,	0x3
	tleu	%icc,	0x2
loop_717:
	sll	%i4,	%l3,	%i6
	movcc	%icc,	%l2,	%i7
	nop
	setx	0x505C1F08,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	movrlez	%i0,	%o4,	%o3
	sdivcc	%o6,	0x0DAD,	%i2
	set	0x18, %o5
	ldswa	[%l7 + %o5] 0x19,	%o0
	fmovsa	%xcc,	%f17,	%f29
	tpos	%xcc,	0x1
	movgu	%xcc,	%i1,	%o5
	tle	%xcc,	0x3
	fcmple16	%f6,	%f30,	%o2
	tl	%icc,	0x1
	smul	%o1,	0x0A6A,	%g2
	ble,pn	%xcc,	loop_718
	movgu	%icc,	%g1,	%l1
	tgu	%xcc,	0x2
	movvc	%xcc,	%g3,	%i5
loop_718:
	fmuld8ulx16	%f23,	%f0,	%f22
	swap	[%l7 + 0x40],	%g5
	brlz	%l0,	loop_719
	sll	%l6,	0x12,	%g4
	nop
	setx	0x1E0B3BB48D25750C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xE960A731C522FD88,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f0,	%f8
	bge,a,pn	%xcc,	loop_720
loop_719:
	nop
	fitos	%f6,	%f30
	add	%l4,	0x0715,	%i3
	orncc	%o7,	0x0EEC,	%g7
loop_720:
	brz	%l5,	loop_721
	move	%xcc,	%g6,	%l3
	and	%i4,	%l2,	%i7
	set	0x1a8, %i5
	nop 	! 	stxa	%i6,	[%g0 + %i5] 0x40 ripped by fixASI40.pl
loop_721:
	fpadd16s	%f21,	%f17,	%f23
	movcs	%xcc,	%o4,	%o3
	fnot2s	%f29,	%f20
	tle	%icc,	0x0
	udivx	%o6,	0x1F63,	%i0
	alignaddrl	%i2,	%i1,	%o0
	fxors	%f0,	%f18,	%f28
	tneg	%icc,	0x4
	tgu	%icc,	0x2
	sdivx	%o2,	0x06D4,	%o1
	tpos	%xcc,	0x0
	set	0x60, %l0
	lduwa	[%l7 + %l0] 0x04,	%g2
	subcc	%g1,	%o5,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i5,	%g3
	sethi	0x083C,	%g5
	fmovsn	%icc,	%f7,	%f14
	movleu	%icc,	%l6,	%g4
	fexpand	%f10,	%f18
	udivcc	%l4,	0x0ECA,	%i3
	add	%l0,	0x14DF,	%g7
	nop
	setx	0xB3E704281610D566,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xF5B5BBF9CFCC338E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f12,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%icc,	0x2
	tvs	%icc,	0x4
	sdivx	%o7,	0x0488,	%g6
	sll	%l5,	%l3,	%l2
	fnegd	%f28,	%f30
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x3F] %asi,	%i4
	sllx	%i6,	0x1A,	%o4
	fmovsa	%xcc,	%f14,	%f0
	tge	%icc,	0x3
	sra	%o3,	0x15,	%o6
	tl	%xcc,	0x2
	fandnot1	%f4,	%f18,	%f20
	sub	%i7,	0x0442,	%i2
	ld	[%l7 + 0x28],	%f7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%i0,	%i1
	fbule,a	%fcc3,	loop_722
	movrgz	%o2,	%o1,	%o0
	fxor	%f28,	%f24,	%f30
	nop
	setx	0x5DD2BC9B506CBCAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_722:
	fmovdcc	%xcc,	%f11,	%f14
	mulscc	%g1,	0x19DA,	%o5
	fnot1s	%f20,	%f9
	edge16ln	%l1,	%g2,	%g3
	fmovsl	%xcc,	%f11,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i5,	%l6,	%g5
	tvs	%icc,	0x4
	movrlz	%g4,	%l4,	%l0
	fcmpne16	%f6,	%f12,	%g7
	nop
	setx	0x093DB415,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xA464D74A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f9,	%f18
	call	loop_723
	movvs	%xcc,	%o7,	%g6
	edge32	%i3,	%l3,	%l2
	edge16l	%i4,	%l5,	%i6
loop_723:
	fmovsl	%icc,	%f31,	%f15
	fmul8ulx16	%f14,	%f20,	%f18
	xor	%o3,	%o6,	%i7
	movpos	%xcc,	%o4,	%i2
	tn	%xcc,	0x1
	wr	%g0,	0x0c,	%asi
	stba	%i0,	[%l7 + 0x5F] %asi
	sra	%i1,	0x1B,	%o2
	smulcc	%o1,	%g1,	%o5
	fmovsne	%icc,	%f17,	%f19
	sdiv	%o0,	0x0609,	%l1
	fcmpgt16	%f8,	%f8,	%g3
	fbge	%fcc3,	loop_724
	fbug,a	%fcc0,	loop_725
	fmovrdgez	%g2,	%f8,	%f28
	fxnor	%f22,	%f30,	%f16
loop_724:
	fpack16	%f14,	%f1
loop_725:
	edge16	%i5,	%l6,	%g5
	subccc	%l4,	%l0,	%g4
	tvc	%xcc,	0x2
	lduw	[%l7 + 0x74],	%o7
	movre	%g6,	%i3,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f28,	%f8,	%f2
	fmovdcs	%icc,	%f7,	%f13
	ld	[%l7 + 0x0C],	%f10
	or	%l2,	0x1CB2,	%i4
	tpos	%xcc,	0x3
	addccc	%l5,	%i6,	%l3
	swap	[%l7 + 0x78],	%o3
	addccc	%i7,	0x07B5,	%o4
	bn	%icc,	loop_726
	movcc	%xcc,	%i2,	%o6
	tcc	%icc,	0x3
	edge16	%i1,	%i0,	%o1
loop_726:
	array16	%g1,	%o2,	%o0
	tvs	%icc,	0x7
	edge32l	%l1,	%g3,	%o5
	fmovsge	%xcc,	%f30,	%f10
	fbu,a	%fcc0,	loop_727
	fblg	%fcc3,	loop_728
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg	%xcc,	loop_729
loop_727:
	mova	%xcc,	%g2,	%l6
loop_728:
	nop
	set	0x64, %o0
	stha	%i5,	[%l7 + %o0] 0x11
loop_729:
	taddcc	%g5,	%l4,	%l0
	fmovrdne	%g4,	%f30,	%f0
	fpadd32	%f18,	%f30,	%f28
	tcc	%xcc,	0x4
	and	%g6,	0x0502,	%o7
	fmovsneg	%icc,	%f19,	%f28
	movrne	%i3,	0x0AF,	%g7
	xor	%l2,	%l5,	%i6
	flush	%l7 + 0x68
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x08] %asi,	%i4
	movrlez	%o3,	0x2FC,	%l3
	tg	%icc,	0x1
	movpos	%xcc,	%i7,	%o4
	movvc	%xcc,	%i2,	%i1
	and	%o6,	%i0,	%o1
	nop
	set	0x18, %g4
	sth	%o2,	[%l7 + %g4]
	mulscc	%g1,	0x08B1,	%o0
	movle	%icc,	%l1,	%g3
	movl	%icc,	%o5,	%l6
	sethi	0x0FCA,	%g2
	movle	%xcc,	%i5,	%l4
	subcc	%g5,	0x016D,	%g4
	fblg	%fcc2,	loop_730
	tn	%xcc,	0x6
	fmovrslz	%l0,	%f29,	%f1
	andcc	%g6,	%i3,	%o7
loop_730:
	orcc	%g7,	0x1ADB,	%l2
	sllx	%i6,	0x16,	%i4
	tsubcc	%o3,	0x1FC0,	%l5
	movrgez	%i7,	0x063,	%o4
	fmovdleu	%xcc,	%f29,	%f26
	andn	%l3,	%i1,	%o6
	fbule	%fcc3,	loop_731
	brlz,a	%i2,	loop_732
	addc	%o1,	0x05E1,	%o2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x40] %asi,	%i0
loop_731:
	tne	%icc,	0x4
loop_732:
	xnorcc	%g1,	0x0135,	%l1
	bneg	%icc,	loop_733
	fbuge	%fcc1,	loop_734
	andncc	%o0,	%g3,	%o5
	edge8ln	%l6,	%g2,	%l4
loop_733:
	sethi	0x0C87,	%i5
loop_734:
	orcc	%g4,	0x0E82,	%l0
	fcmpne16	%f24,	%f26,	%g5
	movle	%xcc,	%i3,	%g6
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%g7
	brz	%l2,	loop_735
	te	%xcc,	0x5
	fbe,a	%fcc2,	loop_736
	sdiv	%i6,	0x10AB,	%o7
loop_735:
	ldstub	[%l7 + 0x54],	%i4
	sdiv	%o3,	0x12AB,	%l5
loop_736:
	fmovdpos	%xcc,	%f31,	%f2
	xnor	%o4,	%i7,	%i1
	mulscc	%o6,	%i2,	%o1
	sra	%l3,	0x12,	%i0
	movrgz	%o2,	%g1,	%o0
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f28
	fxtod	%f28,	%f16
	movrgez	%g3,	%l1,	%l6
	tgu	%xcc,	0x3
	bleu,a	%xcc,	loop_737
	fbue,a	%fcc0,	loop_738
	movn	%xcc,	%g2,	%l4
	ldx	[%l7 + 0x50],	%i5
loop_737:
	ldx	[%l7 + 0x60],	%o5
loop_738:
	mova	%icc,	%l0,	%g5
	prefetch	[%l7 + 0x40],	 0x3
	subccc	%i3,	0x0692,	%g4
	alignaddrl	%g6,	%g7,	%l2
	movrgez	%o7,	%i6,	%o3
	subc	%l5,	0x1A7A,	%i4
	movvc	%xcc,	%i7,	%i1
	movgu	%icc,	%o6,	%i2
	bneg,a,pt	%icc,	loop_739
	tl	%xcc,	0x3
	fexpand	%f5,	%f28
	move	%xcc,	%o1,	%o4
loop_739:
	stx	%l3,	[%l7 + 0x30]
	fbug,a	%fcc1,	loop_740
	tvc	%xcc,	0x1
	set	0x7C, %g7
	stwa	%o2,	[%l7 + %g7] 0x19
loop_740:
	fmuld8ulx16	%f0,	%f16,	%f28
	fmovsl	%xcc,	%f6,	%f6
	fbne,a	%fcc1,	loop_741
	andncc	%i0,	%g1,	%g3
	mulx	%l1,	0x13EF,	%o0
	tg	%xcc,	0x5
loop_741:
	bg,pt	%xcc,	loop_742
	movge	%xcc,	%g2,	%l6
	fmovrdgz	%i5,	%f16,	%f4
	udivx	%l4,	0x04B9,	%l0
loop_742:
	fbge,a	%fcc0,	loop_743
	ldx	[%l7 + 0x68],	%o5
	movrgez	%g5,	0x207,	%i3
	edge8n	%g6,	%g7,	%g4
loop_743:
	tneg	%icc,	0x4
	fmovscc	%xcc,	%f18,	%f21
	fornot1	%f10,	%f30,	%f12
	call	loop_744
	movl	%icc,	%l2,	%o7
	movle	%xcc,	%o3,	%i6
	tg	%xcc,	0x4
loop_744:
	edge8n	%i4,	%l5,	%i7
	and	%o6,	%i2,	%i1
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x19,	%f0
	fbo	%fcc3,	loop_745
	nop
	setx	0xE7DEF642D049BC88,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	movgu	%icc,	%o1,	%o4
	fandnot2	%f4,	%f26,	%f6
loop_745:
	tge	%xcc,	0x1
	edge16l	%l3,	%o2,	%i0
	movg	%xcc,	%g1,	%g3
	array16	%l1,	%o0,	%g2
	fba	%fcc1,	loop_746
	tle	%icc,	0x2
	ta	%icc,	0x7
	fmovrdlz	%i5,	%f16,	%f16
loop_746:
	addc	%l4,	0x1F19,	%l0
	stb	%o5,	[%l7 + 0x2A]
	fbne,a	%fcc0,	loop_747
	nop
	setx	0xB669F775C5DE4F19,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE3A24016D47F62D1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f12,	%f10
	fmovrdne	%l6,	%f0,	%f14
	edge32l	%i3,	%g6,	%g7
loop_747:
	te	%icc,	0x2
	fbne,a	%fcc3,	loop_748
	sll	%g5,	0x1B,	%g4
	taddcc	%o7,	%l2,	%i6
	move	%icc,	%i4,	%o3
loop_748:
	srlx	%l5,	0x08,	%i7
	fmovdge	%icc,	%f9,	%f28
	wr	%g0,	0x2f,	%asi
	stha	%o6,	[%l7 + 0x2A] %asi
	membar	#Sync
	sethi	0x0437,	%i1
	fbue	%fcc2,	loop_749
	andcc	%i2,	%o1,	%o4
	fbue,a	%fcc0,	loop_750
	mulx	%o2,	0x0C49,	%l3
loop_749:
	nop
	fitos	%f0,	%f29
	fstox	%f29,	%f14
	fxtos	%f14,	%f29
	lduh	[%l7 + 0x20],	%g1
loop_750:
	bcc,a	loop_751
	subcc	%i0,	0x1A48,	%g3
	fmovdvc	%icc,	%f25,	%f7
	set	0x70, %i1
	ldsha	[%l7 + %i1] 0x89,	%o0
loop_751:
	movrne	%g2,	0x3ED,	%i5
	prefetch	[%l7 + 0x7C],	 0x1
	brlz	%l1,	loop_752
	edge16n	%l4,	%o5,	%l0
	subcc	%i3,	0x08D4,	%g6
	fbne,a	%fcc0,	loop_753
loop_752:
	edge8ln	%g7,	%l6,	%g4
	sethi	0x02BE,	%g5
	tg	%xcc,	0x7
loop_753:
	xor	%l2,	0x0512,	%o7
	fmovsa	%xcc,	%f24,	%f20
	stw	%i6,	[%l7 + 0x24]
	tneg	%xcc,	0x7
	tcc	%xcc,	0x0
	fnand	%f18,	%f4,	%f16
	call	loop_754
	mulscc	%o3,	0x07BD,	%i4
	fbn	%fcc2,	loop_755
	edge16ln	%i7,	%l5,	%i1
loop_754:
	ble,a,pt	%xcc,	loop_756
	movre	%o6,	%o1,	%o4
loop_755:
	edge8l	%o2,	%l3,	%g1
	mulscc	%i2,	0x14F5,	%i0
loop_756:
	nop
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%g3,	%o0
	nop
	set	0x58, %o7
	stx	%i5,	[%l7 + %o7]
	edge32	%g2,	%l4,	%l1
	movle	%icc,	%o5,	%i3
	brgez	%l0,	loop_757
	fxnor	%f20,	%f2,	%f26
	brlz	%g7,	loop_758
	array16	%g6,	%l6,	%g5
loop_757:
	orcc	%g4,	0x1499,	%l2
	addccc	%o7,	0x062D,	%o3
loop_758:
	ld	[%l7 + 0x14],	%f20
	udivcc	%i6,	0x1C51,	%i7
	movleu	%icc,	%l5,	%i1
	alignaddr	%i4,	%o6,	%o1
	addccc	%o2,	0x0C61,	%l3
	subc	%g1,	%o4,	%i2
	movleu	%xcc,	%i0,	%o0
	tge	%xcc,	0x6
	movrlz	%g3,	%g2,	%l4
	movg	%xcc,	%l1,	%o5
	movleu	%xcc,	%i5,	%l0
	bgu	%xcc,	loop_759
	nop
	set	0x4C, %l4
	ldsb	[%l7 + %l4],	%i3
	movre	%g6,	%l6,	%g5
	sdivx	%g7,	0x1A60,	%g4
loop_759:
	fnot2s	%f11,	%f14
	tcs	%xcc,	0x6
	movre	%o7,	%o3,	%i6
	fpadd16	%f10,	%f14,	%f0
	fmovsl	%icc,	%f10,	%f4
	movge	%icc,	%i7,	%l2
	movpos	%xcc,	%i1,	%i4
	tsubcctv	%o6,	%o1,	%l5
	fxors	%f31,	%f1,	%f19
	tsubcctv	%l3,	%g1,	%o4
	edge8	%i2,	%i0,	%o2
	fmovdn	%xcc,	%f2,	%f20
	fmovrslez	%g3,	%f8,	%f31
	movrlz	%o0,	%l4,	%g2
	or	%l1,	%i5,	%o5
	tge	%xcc,	0x4
	alignaddr	%l0,	%g6,	%l6
	mulx	%g5,	0x1142,	%g7
	fbu,a	%fcc1,	loop_760
	andcc	%i3,	%g4,	%o3
	edge16	%i6,	%o7,	%l2
	fmovscc	%xcc,	%f31,	%f19
loop_760:
	fbu,a	%fcc2,	loop_761
	sth	%i1,	[%l7 + 0x68]
	fbe,a	%fcc1,	loop_762
	mulscc	%i4,	0x1A3A,	%o6
loop_761:
	andn	%o1,	%l5,	%i7
	array8	%l3,	%o4,	%i2
loop_762:
	tneg	%xcc,	0x4
	subccc	%i0,	%o2,	%g3
	edge8ln	%g1,	%o0,	%g2
	tvc	%xcc,	0x0
	lduh	[%l7 + 0x0A],	%l4
	edge16n	%l1,	%i5,	%o5
	andcc	%g6,	0x05A5,	%l6
	std	%f14,	[%l7 + 0x68]
	tleu	%icc,	0x5
	edge32ln	%g5,	%g7,	%l0
	edge16n	%g4,	%i3,	%o3
	orcc	%i6,	%l2,	%o7
	bpos,pt	%xcc,	loop_763
	fmovscs	%xcc,	%f17,	%f24
	edge8ln	%i1,	%i4,	%o6
	fbge	%fcc0,	loop_764
loop_763:
	alignaddrl	%l5,	%i7,	%l3
	bgu	%xcc,	loop_765
	movne	%icc,	%o4,	%o1
loop_764:
	membar	0x36
	fbue	%fcc3,	loop_766
loop_765:
	xorcc	%i2,	%o2,	%g3
	fmovscc	%xcc,	%f9,	%f11
	movneg	%icc,	%g1,	%i0
loop_766:
	fmovsg	%icc,	%f12,	%f10
	umulcc	%o0,	%g2,	%l4
	edge16	%i5,	%l1,	%o5
	edge8ln	%l6,	%g6,	%g5
	alignaddrl	%g7,	%l0,	%i3
	movrne	%g4,	%o3,	%i6
	ta	%icc,	0x6
	stx	%l2,	[%l7 + 0x10]
	xnorcc	%o7,	%i4,	%o6
	movle	%icc,	%i1,	%i7
	tvs	%icc,	0x7
	taddcc	%l5,	0x0CBE,	%l3
	movcs	%xcc,	%o4,	%o1
	tle	%icc,	0x2
	ble,a,pt	%xcc,	loop_767
	addcc	%o2,	%g3,	%i2
	tvc	%xcc,	0x7
	bg	%xcc,	loop_768
loop_767:
	edge8l	%i0,	%o0,	%g1
	addccc	%l4,	%g2,	%l1
	ldd	[%l7 + 0x20],	%f8
loop_768:
	nop
	setx	loop_769,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmul8x16	%f26,	%f30,	%f30
	fmovsg	%xcc,	%f28,	%f27
	fandnot1	%f28,	%f14,	%f18
loop_769:
	movle	%xcc,	%o5,	%i5
	fmul8x16	%f3,	%f8,	%f6
	stx	%l6,	[%l7 + 0x18]
	edge32	%g6,	%g5,	%g7
	fnot2	%f28,	%f28
	tn	%icc,	0x2
	nop
	setx	0x506FB9FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	ldub	[%l7 + 0x58],	%i3
	movrne	%g4,	0x39C,	%o3
	tl	%xcc,	0x6
	bcs,pt	%xcc,	loop_770
	tgu	%xcc,	0x2
	edge16l	%l0,	%l2,	%o7
	addcc	%i4,	0x16C2,	%i6
loop_770:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x48] %asi,	%i1
	sdivx	%i7,	0x15FF,	%l5
	edge16l	%l3,	%o4,	%o1
	alignaddr	%o2,	%g3,	%o6
	fbge,a	%fcc2,	loop_771
	fpsub32	%f22,	%f14,	%f14
	brlz,a	%i0,	loop_772
	tn	%xcc,	0x3
loop_771:
	fmovda	%icc,	%f18,	%f9
	popc	0x09BE,	%i2
loop_772:
	bn,pn	%icc,	loop_773
	sdivcc	%o0,	0x0BB9,	%l4
	swap	[%l7 + 0x7C],	%g2
	fandnot2	%f18,	%f0,	%f16
loop_773:
	xnorcc	%g1,	%l1,	%o5
	flush	%l7 + 0x6C
	sethi	0x0D25,	%l6
	fmovsvs	%icc,	%f17,	%f6
	ldx	[%l7 + 0x38],	%i5
	fmovsl	%icc,	%f2,	%f19
	sdivx	%g5,	0x0FEA,	%g7
	fble	%fcc1,	loop_774
	fsrc2	%f2,	%f10
	movn	%xcc,	%g6,	%i3
	nop
	setx	0x6829755BAFE0D771,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x7161323FC65E372E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f6,	%f18
loop_774:
	mova	%xcc,	%g4,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l2,	0x170A,	%o3
	movrgez	%i4,	0x0A7,	%i6
	fnegd	%f24,	%f16
	xor	%i1,	%i7,	%o7
	nop
	setx	0x432C67FFD88A7165,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x606E0C031FED9839,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f10,	%f4
	ldstub	[%l7 + 0x4B],	%l5
	array8	%o4,	%o1,	%o2
	udivcc	%g3,	0x0D1D,	%o6
	xor	%i0,	0x0A2B,	%l3
	smul	%i2,	%l4,	%g2
	fone	%f30
	tgu	%xcc,	0x0
	movrgez	%o0,	0x36E,	%l1
	orn	%g1,	0x00FB,	%l6
	alignaddrl	%i5,	%o5,	%g7
	tge	%xcc,	0x6
	fmovrsne	%g5,	%f20,	%f26
	fmovdvs	%xcc,	%f30,	%f1
	fmovdneg	%icc,	%f10,	%f26
	fxors	%f14,	%f10,	%f22
	movrne	%i3,	%g6,	%l0
	taddcc	%g4,	0x1E98,	%l2
	and	%o3,	%i6,	%i1
	xor	%i7,	%i4,	%l5
	edge8n	%o7,	%o4,	%o2
	edge16l	%g3,	%o1,	%o6
	stw	%l3,	[%l7 + 0x64]
	orn	%i2,	0x06FA,	%i0
	srlx	%l4,	0x05,	%g2
	nop
	fitos	%f14,	%f13
	fstoi	%f13,	%f3
	sll	%l1,	%g1,	%o0
	array8	%l6,	%i5,	%g7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%o5
	sdivcc	%g5,	0x07CA,	%g6
	bleu,pt	%icc,	loop_775
	edge32n	%l0,	%i3,	%l2
	bne,pn	%xcc,	loop_776
	movgu	%xcc,	%g4,	%i6
loop_775:
	movge	%icc,	%i1,	%o3
	subc	%i7,	%i4,	%l5
loop_776:
	fbo	%fcc3,	loop_777
	ldsw	[%l7 + 0x64],	%o7
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x30] %asi,	%o4
loop_777:
	fabss	%f28,	%f2
	sll	%g3,	%o2,	%o6
	taddcc	%o1,	0x1E27,	%l3
	and	%i0,	0x11DB,	%l4
	fnegs	%f19,	%f23
	nop
	setx	0x2A2A0B5F23A1C273,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x352FF967A545C0AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f18,	%f30
	movcc	%xcc,	%i2,	%g2
	andn	%g1,	0x023B,	%l1
	nop
	setx	0x638D7AF1307F8295,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	movrlez	%l6,	0x038,	%o0
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovsl	%xcc,	%f17,	%f22
	nop
	setx	0x96F9FD7D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xED90E3F0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f8,	%f18
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
	andn	%g7,	%o5,	%g5
	umulcc	%g6,	%l0,	%l2
	subcc	%g4,	0x17AF,	%i6
	fbue,a	%fcc2,	loop_778
	fbuge	%fcc2,	loop_779
	edge16	%i3,	%i1,	%o3
	ldd	[%l7 + 0x58],	%f10
loop_778:
	tle	%xcc,	0x5
loop_779:
	nop
	setx	0x4D89538FB793C1E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f12
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x80,	%f16
	udivx	%i4,	0x16CF,	%i7
	movleu	%icc,	%o7,	%o4
	call	loop_780
	fone	%f14
	set	0x08, %g1
	ldswa	[%l7 + %g1] 0x15,	%l5
loop_780:
	alignaddr	%o2,	%g3,	%o6
	nop
	setx	0x72846F879279C090,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xFBF75A841B6AE385,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f4,	%f0
	fone	%f6
	udiv	%l3,	0x08D2,	%o1
	fandnot1	%f2,	%f30,	%f28
	srax	%i0,	%l4,	%i2
	movrgz	%g1,	0x05F,	%l1
	movge	%icc,	%g2,	%l6
	edge16l	%o0,	%i5,	%g7
	fmovsle	%xcc,	%f24,	%f30
	alignaddrl	%o5,	%g5,	%l0
	fmul8ulx16	%f28,	%f30,	%f26
	be,pn	%xcc,	loop_781
	sdiv	%g6,	0x01B9,	%g4
	array32	%i6,	%i3,	%i1
	sethi	0x138B,	%l2
loop_781:
	fandnot1s	%f11,	%f24,	%f9
	movvs	%icc,	%i4,	%i7
	array32	%o3,	%o7,	%o4
	tsubcc	%o2,	%l5,	%o6
	flush	%l7 + 0x54
	sdiv	%l3,	0x0789,	%o1
	tn	%icc,	0x5
	set	0x60, %g2
	ldxa	[%l7 + %g2] 0x88,	%g3
	ldd	[%l7 + 0x38],	%f30
	nop
	setx	loop_782,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movl	%icc,	%l4,	%i0
	subc	%g1,	0x0CDD,	%l1
	andncc	%g2,	%l6,	%i2
loop_782:
	fnot1	%f4,	%f8
	edge16	%o0,	%g7,	%o5
	sub	%i5,	%g5,	%g6
	array32	%l0,	%g4,	%i6
	edge32n	%i1,	%i3,	%i4
	addccc	%l2,	0x1C9C,	%o3
	fbo,a	%fcc1,	loop_783
	bl	%xcc,	loop_784
	orn	%o7,	0x0618,	%o4
	mova	%icc,	%o2,	%l5
loop_783:
	tleu	%xcc,	0x3
loop_784:
	fmovrse	%i7,	%f4,	%f28
	edge16ln	%l3,	%o6,	%g3
	bshuffle	%f6,	%f10,	%f24
	tn	%icc,	0x5
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sethi	0x04B2,	%l4
	fba	%fcc3,	loop_785
	fmovsvc	%icc,	%f25,	%f4
	tgu	%xcc,	0x1
	nop
	fitos	%f14,	%f24
	fstoi	%f24,	%f0
loop_785:
	bpos,a,pn	%icc,	loop_786
	udivcc	%o1,	0x1AE1,	%i0
	swap	[%l7 + 0x20],	%l1
	tvc	%xcc,	0x1
loop_786:
	orn	%g2,	%g1,	%l6
	wr	%g0,	0xe3,	%asi
	stxa	%o0,	[%l7 + 0x28] %asi
	membar	#Sync
	fmovdle	%xcc,	%f2,	%f5
	edge16ln	%g7,	%i2,	%o5
	movvc	%xcc,	%i5,	%g5
	movl	%icc,	%g6,	%g4
	udivcc	%i6,	0x00C5,	%i1
	fmovdvc	%xcc,	%f5,	%f25
	add	%i3,	%l0,	%l2
	wr	%g0,	0x80,	%asi
	stwa	%o3,	[%l7 + 0x5C] %asi
	fmovrslez	%o7,	%f4,	%f4
	tpos	%icc,	0x4
	fxors	%f18,	%f26,	%f8
	sir	0x0B6D
	tg	%xcc,	0x0
	udiv	%o4,	0x0BEF,	%i4
	call	loop_787
	sth	%o2,	[%l7 + 0x16]
	tle	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_787:
	tle	%xcc,	0x6
	set	0x3B, %o6
	stba	%i7,	[%l7 + %o6] 0x10
	lduh	[%l7 + 0x0E],	%l3
	tgu	%icc,	0x0
	brlz,a	%l5,	loop_788
	fmovrdgz	%o6,	%f22,	%f4
	sethi	0x1266,	%l4
	fbul,a	%fcc2,	loop_789
loop_788:
	stw	%o1,	[%l7 + 0x1C]
	edge16	%i0,	%g3,	%g2
	movge	%xcc,	%l1,	%g1
loop_789:
	smulcc	%l6,	0x14B8,	%o0
	fmovsl	%icc,	%f9,	%f28
	nop
	set	0x5C, %i0
	stw	%g7,	[%l7 + %i0]
	fmovscc	%xcc,	%f2,	%f25
	tneg	%xcc,	0x3
	addcc	%o5,	%i2,	%i5
	fmuld8ulx16	%f25,	%f30,	%f4
	bl,pt	%icc,	loop_790
	subc	%g5,	%g6,	%g4
	edge16ln	%i1,	%i3,	%l0
	subccc	%l2,	0x029F,	%i6
loop_790:
	array8	%o3,	%o4,	%i4
	xor	%o7,	0x19FE,	%o2
	tn	%icc,	0x4
	fblg,a	%fcc0,	loop_791
	movgu	%icc,	%i7,	%l3
	tcc	%xcc,	0x3
	movcs	%icc,	%o6,	%l5
loop_791:
	movn	%icc,	%l4,	%o1
	movrlz	%i0,	%g3,	%g2
	nop
	fitos	%f13,	%f21
	fandnot1	%f8,	%f18,	%f0
	bleu	loop_792
	fbo,a	%fcc0,	loop_793
	fcmple32	%f10,	%f0,	%g1
	array32	%l1,	%o0,	%l6
loop_792:
	prefetch	[%l7 + 0x70],	 0x3
loop_793:
	nop
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x60] %asi,	%g6
	lduh	[%l7 + 0x6E],	%o5
	andncc	%i5,	%i2,	%g6
	bleu	%xcc,	loop_794
	edge8ln	%g5,	%g4,	%i1
	tn	%icc,	0x1
	edge8n	%i3,	%l0,	%l2
loop_794:
	nop
	setx loop_795, %l0, %l1
	jmpl %l1, %o3
	fxnors	%f31,	%f12,	%f6
	nop
	fitos	%f8,	%f29
	fstox	%f29,	%f24
	fxtos	%f24,	%f27
	edge16	%i6,	%o4,	%o7
loop_795:
	tsubcctv	%i4,	%o2,	%i7
	edge8n	%l3,	%o6,	%l5
	tl	%icc,	0x5
	movcs	%icc,	%o1,	%l4
	movre	%g3,	0x17D,	%i0
	fcmpne16	%f18,	%f12,	%g1
	bvs,a,pt	%icc,	loop_796
	mulx	%g2,	0x130E,	%o0
	wr	%g0,	0x11,	%asi
	stwa	%l6,	[%l7 + 0x68] %asi
loop_796:
	umul	%l1,	0x09FD,	%g7
	movgu	%icc,	%o5,	%i2
	ta	%icc,	0x3
	movrlez	%g6,	%i5,	%g5
	edge16	%g4,	%i3,	%i1
	set	0x46, %i6
	stba	%l0,	[%l7 + %i6] 0x2a
	membar	#Sync
	array16	%o3,	%l2,	%i6
	membar	0x6F
	movrlz	%o4,	%o7,	%o2
	alignaddr	%i7,	%i4,	%o6
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f30
	fxtod	%f30,	%f24
	srax	%l3,	%l5,	%l4
	fmovsg	%xcc,	%f28,	%f30
	fmovsl	%xcc,	%f25,	%f11
	tvc	%icc,	0x3
	fors	%f9,	%f2,	%f20
	edge16ln	%g3,	%o1,	%g1
	swap	[%l7 + 0x30],	%g2
	wr	%g0,	0x23,	%asi
	stba	%i0,	[%l7 + 0x6B] %asi
	membar	#Sync
	movleu	%xcc,	%o0,	%l6
	fexpand	%f21,	%f0
	mulx	%l1,	%o5,	%i2
	tvc	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x90477601,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fbg	%fcc0,	loop_797
	nop
	setx loop_798, %l0, %l1
	jmpl %l1, %g6
	popc	%i5,	%g5
	nop
	setx	0xB2A779EE5D099456,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f30
loop_797:
	tneg	%xcc,	0x3
loop_798:
	sir	0x17CC
	sth	%g4,	[%l7 + 0x46]
	umul	%i3,	0x1454,	%g7
	fcmpeq32	%f24,	%f6,	%l0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x68] %asi,	%o3
	fcmpne16	%f10,	%f6,	%i1
	xorcc	%l2,	0x0C79,	%o4
	bvc,pt	%xcc,	loop_799
	tleu	%icc,	0x5
	smul	%o7,	0x08A3,	%i6
	fmovsleu	%icc,	%f25,	%f15
loop_799:
	movrlz	%i7,	%i4,	%o6
	nop
	fitod	%f0,	%f26
	fdtoi	%f26,	%f12
	movcs	%icc,	%o2,	%l3
	nop
	setx	0x70780EFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	flush	%l7 + 0x54
	edge16ln	%l5,	%l4,	%g3
	fcmple32	%f8,	%f26,	%o1
	fmovsvs	%icc,	%f30,	%f1
	addc	%g1,	%i0,	%o0
	taddcctv	%l6,	0x02F2,	%g2
	addc	%l1,	0x1202,	%i2
	fbe	%fcc1,	loop_800
	tcs	%xcc,	0x4
	tn	%xcc,	0x3
	subc	%o5,	%g6,	%g5
loop_800:
	orn	%g4,	%i5,	%g7
	edge8l	%l0,	%o3,	%i1
	sra	%l2,	0x08,	%i3
	sdivcc	%o4,	0x1F26,	%i6
	bcc,a,pt	%icc,	loop_801
	stbar
	brlez	%i7,	loop_802
	movrgez	%i4,	%o6,	%o2
loop_801:
	movneg	%xcc,	%l3,	%l5
	edge16ln	%o7,	%g3,	%o1
loop_802:
	fbge,a	%fcc0,	loop_803
	movge	%xcc,	%l4,	%g1
	alignaddrl	%o0,	%l6,	%g2
	fcmpgt32	%f12,	%f18,	%i0
loop_803:
	array16	%l1,	%o5,	%i2
	alignaddr	%g5,	%g4,	%i5
	movrne	%g7,	%g6,	%l0
	srax	%i1,	0x0A,	%o3
	fmovd	%f28,	%f10
	edge8	%i3,	%o4,	%l2
	nop
	set	0x79, %i3
	stb	%i6,	[%l7 + %i3]
	tcs	%xcc,	0x3
	tpos	%xcc,	0x0
	mulx	%i4,	%i7,	%o2
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf0
	membar	#Sync
	fbuge,a	%fcc1,	loop_804
	edge16l	%o6,	%l3,	%o7
	te	%xcc,	0x3
	ble,a,pt	%icc,	loop_805
loop_804:
	orn	%g3,	%l5,	%o1
	edge8n	%l4,	%g1,	%o0
	bvc	loop_806
loop_805:
	edge8n	%l6,	%i0,	%g2
	nop
	setx	0x69EDCB7D93E44C05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x4DE264FAB5697EA0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f14,	%f28
	fbl	%fcc1,	loop_807
loop_806:
	fbu	%fcc1,	loop_808
	sir	0x1D28
	movrgez	%o5,	0x234,	%i2
loop_807:
	taddcctv	%l1,	0x07D0,	%g5
loop_808:
	udivx	%g4,	0x18BB,	%i5
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	udiv	%l0,	0x060A,	%i1
	taddcc	%o3,	0x08D5,	%i3
	subccc	%g7,	%o4,	%i6
	fbule	%fcc0,	loop_809
	move	%xcc,	%l2,	%i4
	umul	%i7,	0x1296,	%o6
	edge32n	%o2,	%l3,	%o7
loop_809:
	tleu	%icc,	0x5
	fmovse	%icc,	%f5,	%f27
	move	%icc,	%l5,	%g3
	smul	%l4,	0x024C,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu	loop_810
	subc	%o1,	0x0197,	%l6
	andncc	%o0,	%g2,	%o5
	array8	%i0,	%l1,	%g5
loop_810:
	fble	%fcc1,	loop_811
	bvc,pn	%xcc,	loop_812
	movrne	%i2,	0x37A,	%g4
	tvc	%icc,	0x3
loop_811:
	and	%g6,	0x1B8B,	%i5
loop_812:
	fbl	%fcc3,	loop_813
	fnands	%f16,	%f26,	%f25
	andcc	%l0,	0x0FF0,	%i1
	orn	%i3,	0x14F0,	%o3
loop_813:
	bneg,a,pt	%icc,	loop_814
	addc	%g7,	0x0C4F,	%i6
	ta	%icc,	0x5
	brnz,a	%o4,	loop_815
loop_814:
	fmovdn	%xcc,	%f0,	%f4
	fmovrsgz	%i4,	%f4,	%f31
	movre	%l2,	%o6,	%o2
loop_815:
	nop
	set	0x52, %g5
	ldsb	[%l7 + %g5],	%l3
	tne	%xcc,	0x6
	fmuld8sux16	%f28,	%f23,	%f10
	nop
	fitod	%f12,	%f2
	fdtoi	%f2,	%f30
	tvs	%xcc,	0x0
	sub	%o7,	0x1232,	%l5
	ldd	[%l7 + 0x78],	%f22
	bshuffle	%f24,	%f18,	%f4
	fexpand	%f8,	%f2
	srlx	%g3,	0x02,	%l4
	fandnot2	%f10,	%f14,	%f28
	nop
	setx	0x0E351294,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x9D902D2E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f20,	%f23
	fexpand	%f9,	%f18
	tleu	%icc,	0x7
	sir	0x12E8
	fmovsneg	%icc,	%f27,	%f27
	movge	%icc,	%g1,	%i7
	tg	%xcc,	0x7
	movle	%icc,	%l6,	%o1
	fmovrsgz	%g2,	%f21,	%f16
	fand	%f10,	%f20,	%f30
	fmovdvs	%icc,	%f3,	%f4
	tsubcctv	%o5,	0x069A,	%i0
	edge8	%l1,	%o0,	%i2
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x08] %asi,	%g5
	fbg,a	%fcc2,	loop_816
	subcc	%g4,	%i5,	%l0
	sdivx	%g6,	0x157B,	%i3
	edge8n	%o3,	%i1,	%g7
loop_816:
	fmovrdlz	%i6,	%f16,	%f12
	tgu	%xcc,	0x6
	fmovsne	%xcc,	%f18,	%f1
	sra	%i4,	%o4,	%l2
	alignaddr	%o6,	%l3,	%o2
	sir	0x05CC
	orncc	%l5,	0x05FB,	%o7
	sir	0x0D25
	movrlz	%g3,	%l4,	%g1
	bvs	%xcc,	loop_817
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
	ta	%icc,	0x2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%l6,	%i7
loop_817:
	tn	%icc,	0x3
loop_818:
	edge8l	%o1,	%g2,	%o5
	smul	%i0,	%l1,	%i2
	movvc	%xcc,	%g5,	%g4
	bvs	loop_819
	edge8l	%o0,	%l0,	%i5
	tleu	%xcc,	0x1
	add	%i3,	0x023D,	%o3
loop_819:
	sethi	0x1570,	%i1
	sra	%g6,	%g7,	%i6
	fmul8x16	%f3,	%f12,	%f0
	sdivx	%i4,	0x16C7,	%o4
	fbl,a	%fcc2,	loop_820
	movg	%xcc,	%l2,	%l3
	sir	0x1A48
	movcc	%icc,	%o6,	%o2
loop_820:
	udivx	%o7,	0x1A21,	%l5
	mulscc	%l4,	0x0590,	%g1
	movre	%g3,	0x15D,	%i7
	sir	0x0E1F
	nop
	fitod	%f12,	%f2
	ldsb	[%l7 + 0x5C],	%o1
	nop
	fitod	%f0,	%f30
	fdtoi	%f30,	%f17
	fpack16	%f10,	%f16
	smul	%g2,	0x053E,	%l6
	subcc	%i0,	%o5,	%i2
	andn	%g5,	0x05D9,	%g4
	xorcc	%o0,	0x0E5C,	%l0
	orcc	%i5,	%i3,	%o3
	or	%i1,	%g6,	%l1
	nop
	fitos	%f10,	%f6
	smul	%g7,	%i6,	%o4
	fmovsa	%icc,	%f7,	%f22
	fmovsle	%xcc,	%f6,	%f20
	andn	%l2,	0x19B9,	%i4
	fandnot1	%f20,	%f12,	%f4
	sub	%o6,	%o2,	%o7
	movrgz	%l3,	%l4,	%l5
	fbe,a	%fcc2,	loop_821
	bneg,pn	%xcc,	loop_822
	movcs	%xcc,	%g3,	%i7
	tne	%xcc,	0x6
loop_821:
	sethi	0x190F,	%g1
loop_822:
	movrlez	%g2,	0x02C,	%l6
	tg	%icc,	0x1
	srlx	%i0,	0x0E,	%o1
	fble	%fcc0,	loop_823
	fands	%f6,	%f15,	%f3
	set	0x60, %o3
	lduha	[%l7 + %o3] 0x88,	%i2
loop_823:
	nop
	setx	0x23B66358,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xBCBF5AF6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f24,	%f4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x44] %asi,	%g5
	movvc	%xcc,	%o5,	%g4
	popc	0x0C6D,	%o0
	bleu	loop_824
	umul	%l0,	%i3,	%i5
	tn	%xcc,	0x0
	edge16n	%o3,	%i1,	%g6
loop_824:
	movn	%xcc,	%g7,	%i6
	fmovsvc	%xcc,	%f16,	%f16
	nop
	fitos	%f23,	%f16
	movpos	%xcc,	%l1,	%l2
	movle	%icc,	%i4,	%o6
	fbuge	%fcc2,	loop_825
	fbe	%fcc2,	loop_826
	array16	%o2,	%o4,	%o7
	wr	%g0,	0x81,	%asi
	stwa	%l3,	[%l7 + 0x28] %asi
loop_825:
	movrne	%l5,	%g3,	%l4
loop_826:
	fbg,a	%fcc2,	loop_827
	xorcc	%i7,	0x0E30,	%g2
	edge8	%g1,	%l6,	%o1
	and	%i0,	%g5,	%i2
loop_827:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x4
	sir	0x0B3A
	fpmerge	%f4,	%f31,	%f6
	bvs,pn	%xcc,	loop_828
	movne	%icc,	%g4,	%o0
	fnot2	%f30,	%f14
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%o5
loop_828:
	fbge,a	%fcc2,	loop_829
	edge32	%l0,	%i5,	%i3
	fmovsvs	%icc,	%f25,	%f7
	movgu	%xcc,	%o3,	%i1
loop_829:
	edge8ln	%g6,	%i6,	%l1
	tcc	%icc,	0x4
	smul	%g7,	%i4,	%o6
	srlx	%o2,	%l2,	%o4
	xnor	%l3,	%l5,	%o7
	orcc	%l4,	0x0EA2,	%g3
	bg,a,pt	%icc,	loop_830
	tpos	%icc,	0x5
	fbue,a	%fcc2,	loop_831
	udiv	%i7,	0x017F,	%g2
loop_830:
	fcmpne16	%f4,	%f10,	%l6
	fnegd	%f2,	%f0
loop_831:
	tleu	%xcc,	0x4
	xnorcc	%g1,	%o1,	%i0
	brlz,a	%i2,	loop_832
	fmovspos	%icc,	%f31,	%f14
	orcc	%g5,	%o0,	%o5
	udiv	%l0,	0x1914,	%i5
loop_832:
	edge8	%i3,	%o3,	%g4
	xnorcc	%g6,	0x11DD,	%i6
	ldd	[%l7 + 0x50],	%i0
	umul	%l1,	%g7,	%i4
	srl	%o6,	%l2,	%o2
	edge32l	%o4,	%l5,	%o7
	fmuld8sux16	%f27,	%f7,	%f24
	udiv	%l4,	0x0D13,	%l3
	tvs	%xcc,	0x3
	fbul,a	%fcc1,	loop_833
	array16	%i7,	%g2,	%l6
	fbo,a	%fcc0,	loop_834
	fones	%f26
loop_833:
	movrgz	%g1,	%g3,	%i0
	movleu	%xcc,	%o1,	%i2
loop_834:
	umulcc	%g5,	0x1BBB,	%o5
	umulcc	%l0,	0x0921,	%o0
	nop
	setx	loop_835,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	prefetch	[%l7 + 0x0C],	 0x2
	te	%icc,	0x2
	fble,a	%fcc3,	loop_836
loop_835:
	xnorcc	%i3,	0x0223,	%i5
	smulcc	%o3,	%g6,	%i6
	subc	%g4,	0x0ECC,	%i1
loop_836:
	movpos	%xcc,	%g7,	%i4
	sir	0x0508
	movrlez	%o6,	%l2,	%o2
	mova	%icc,	%l1,	%o4
	fandnot1s	%f16,	%f27,	%f29
	movg	%xcc,	%o7,	%l5
	udivcc	%l3,	0x00EF,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f7,	%f24
	edge8l	%g2,	%i7,	%l6
	fnot2	%f2,	%f16
	tvs	%icc,	0x3
	set	0x64, %i2
	lduwa	[%l7 + %i2] 0x04,	%g1
	tsubcc	%g3,	%o1,	%i0
	fpsub32s	%f21,	%f0,	%f29
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x3B] %asi,	%i2
	movrgz	%o5,	0x332,	%g5
	sir	0x141A
	tvc	%icc,	0x2
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0x3
	fbe,a	%fcc0,	loop_837
	umulcc	%o0,	%i3,	%o3
	movrgez	%i5,	0x335,	%g6
	edge8l	%g4,	%i1,	%i6
loop_837:
	ld	[%l7 + 0x50],	%f4
	fcmpeq32	%f4,	%f8,	%g7
	bg,a	%xcc,	loop_838
	stw	%o6,	[%l7 + 0x64]
	fmovde	%xcc,	%f5,	%f5
	tpos	%xcc,	0x1
loop_838:
	edge8	%l2,	%i4,	%l1
	nop
	setx	0x07FDBDAD80530287,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	movrne	%o4,	%o2,	%o7
	for	%f0,	%f0,	%f2
	edge32n	%l5,	%l3,	%g2
	brgz,a	%i7,	loop_839
	sll	%l4,	0x0D,	%g1
	popc	0x08BA,	%l6
	ldsh	[%l7 + 0x4E],	%g3
loop_839:
	lduh	[%l7 + 0x24],	%o1
	sra	%i0,	%o5,	%g5
	nop
	set	0x1C, %i7
	stw	%i2,	[%l7 + %i7]
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x10] %asi,	%l0
	edge32n	%i3,	%o0,	%i5
	movg	%xcc,	%g6,	%o3
	nop
	setx	0x7519D23B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x3ACE0331,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f1,	%f17
	wr	%g0,	0x80,	%asi
	sta	%f26,	[%l7 + 0x6C] %asi
	brnz	%i1,	loop_840
	taddcctv	%g4,	0x1CCB,	%i6
	fmovsa	%xcc,	%f4,	%f15
	edge16	%o6,	%g7,	%l2
loop_840:
	ldsh	[%l7 + 0x42],	%i4
	fbug,a	%fcc2,	loop_841
	udivcc	%l1,	0x16FC,	%o2
	brnz	%o4,	loop_842
	fzeros	%f13
loop_841:
	movvc	%icc,	%l5,	%l3
	fmul8x16al	%f1,	%f27,	%f2
loop_842:
	fmul8ulx16	%f2,	%f26,	%f24
	taddcctv	%g2,	0x0D1F,	%o7
	nop
	setx	0x51E9E9214137A5BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x654A58C36EC0A4B3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f16,	%f14
	te	%xcc,	0x1
	fbl,a	%fcc3,	loop_843
	nop
	setx	0xE0644520,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	tcs	%icc,	0x5
	ba,a,pn	%icc,	loop_844
loop_843:
	ldub	[%l7 + 0x5F],	%l4
	xnorcc	%i7,	%l6,	%g3
	movle	%xcc,	%g1,	%i0
loop_844:
	move	%xcc,	%o1,	%g5
	srax	%o5,	0x1D,	%l0
	smul	%i2,	0x1EFC,	%i3
	tge	%xcc,	0x6
	stbar
	movrlz	%o0,	0x134,	%i5
	brnz	%o3,	loop_845
	fbuge	%fcc0,	loop_846
	edge8n	%g6,	%g4,	%i1
	mova	%xcc,	%o6,	%i6
loop_845:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x34] %asi
loop_846:
	nop
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x72] %asi,	%g7
	stw	%i4,	[%l7 + 0x2C]
	xorcc	%l2,	%l1,	%o2
	te	%icc,	0x2
	ldsw	[%l7 + 0x08],	%l5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4E] %asi,	%l3
	tpos	%xcc,	0x7
	srlx	%g2,	%o4,	%o7
	fors	%f8,	%f20,	%f30
	tle	%xcc,	0x2
	bn,a,pt	%icc,	loop_847
	fbo,a	%fcc0,	loop_848
	sll	%i7,	0x1E,	%l6
	sllx	%l4,	%g1,	%g3
loop_847:
	edge16ln	%i0,	%g5,	%o5
loop_848:
	ba,pn	%icc,	loop_849
	fandnot1s	%f22,	%f18,	%f10
	fmovrsne	%l0,	%f28,	%f24
	te	%xcc,	0x4
loop_849:
	subccc	%i2,	0x1242,	%o1
	movpos	%icc,	%o0,	%i3
	tne	%icc,	0x4
	fmovde	%icc,	%f14,	%f0
	edge16n	%i5,	%o3,	%g4
	srax	%i1,	%g6,	%o6
	movl	%icc,	%g7,	%i4
	fmovd	%f18,	%f10
	popc	%i6,	%l2
	smul	%o2,	%l1,	%l5
	ta	%xcc,	0x7
	andn	%l3,	0x053E,	%o4
	subc	%g2,	%o7,	%i7
	udivcc	%l4,	0x010B,	%l6
	tpos	%icc,	0x6
	fnot2	%f28,	%f22
	smul	%g3,	0x0561,	%g1
	fmovrdlz	%g5,	%f6,	%f18
	fmovdgu	%xcc,	%f27,	%f31
	movgu	%xcc,	%o5,	%l0
	set	0x398, %l6
	nop 	! 	nop 	! 	ldxa	[%g0 + %l6] 0x40,	%i0 ripped by fixASI40.pl ripped by fixASI40.pl
	tle	%icc,	0x1
	udivcc	%i2,	0x08E1,	%o0
	tn	%xcc,	0x7
	tl	%icc,	0x4
	subccc	%i3,	%o1,	%i5
	mulscc	%o3,	0x154D,	%i1
	brz	%g6,	loop_850
	tneg	%xcc,	0x3
	edge16ln	%o6,	%g4,	%g7
	movvc	%icc,	%i6,	%i4
loop_850:
	edge16ln	%o2,	%l2,	%l5
	sir	0x0EA9
	tpos	%icc,	0x7
	fmovdgu	%icc,	%f14,	%f29
	nop
	fitos	%f10,	%f27
	fstox	%f27,	%f26
	edge16n	%l3,	%l1,	%o4
	orcc	%o7,	%g2,	%l4
	faligndata	%f16,	%f26,	%f24
	edge16ln	%l6,	%i7,	%g3
	movge	%xcc,	%g5,	%o5
	set	0x50, %o4
	stha	%g1,	[%l7 + %o4] 0xeb
	membar	#Sync
	movle	%icc,	%l0,	%i0
	andcc	%o0,	%i3,	%i2
	wr	%g0,	0x10,	%asi
	stxa	%i5,	[%l7 + 0x10] %asi
	udiv	%o3,	0x1CA0,	%i1
	alignaddrl	%g6,	%o6,	%g4
	tpos	%icc,	0x0
	addccc	%g7,	%o1,	%i4
	move	%icc,	%o2,	%l2
	xnorcc	%i6,	%l3,	%l5
	tleu	%xcc,	0x7
	fmovsvs	%icc,	%f7,	%f0
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f16
	set	0x08, %o2
	lduwa	[%l7 + %o2] 0x81,	%l1
	andn	%o7,	%g2,	%o4
	fmovd	%f22,	%f0
	xnor	%l4,	0x17DC,	%i7
	tneg	%icc,	0x0
	sir	0x1848
	movl	%icc,	%g3,	%l6
	fmovdneg	%xcc,	%f15,	%f31
	fornot2	%f10,	%f26,	%f8
	fpmerge	%f15,	%f23,	%f2
	taddcc	%o5,	0x12FC,	%g5
	wr	%g0,	0xe3,	%asi
	stba	%g1,	[%l7 + 0x5C] %asi
	membar	#Sync
	stx	%i0,	[%l7 + 0x68]
	addcc	%o0,	0x063B,	%l0
	fbuge,a	%fcc0,	loop_851
	prefetch	[%l7 + 0x20],	 0x0
	edge16l	%i3,	%i5,	%i2
	tn	%xcc,	0x1
loop_851:
	membar	0x7F
	tge	%icc,	0x2
	edge32	%o3,	%g6,	%o6
	tcc	%xcc,	0x0
	movrgz	%g4,	%g7,	%i1
	fandnot2	%f20,	%f28,	%f2
	tcs	%icc,	0x0
	movrne	%i4,	%o2,	%o1
	sll	%i6,	0x1C,	%l3
	fbg	%fcc1,	loop_852
	sra	%l5,	0x0D,	%l2
	alignaddr	%o7,	%l1,	%g2
	fornot2s	%f3,	%f30,	%f17
loop_852:
	orncc	%l4,	0x1235,	%o4
	set	0x65, %l1
	ldsba	[%l7 + %l1] 0x88,	%g3
	st	%f25,	[%l7 + 0x34]
	nop
	fitos	%f6,	%f25
	fstox	%f25,	%f30
	fxtos	%f30,	%f0
	addcc	%l6,	%o5,	%g5
	mulx	%i7,	0x1908,	%i0
	fxors	%f16,	%f1,	%f28
	brnz,a	%g1,	loop_853
	fblg,a	%fcc0,	loop_854
	movrne	%o0,	0x26B,	%l0
	ba,pn	%xcc,	loop_855
loop_853:
	movl	%icc,	%i5,	%i3
loop_854:
	bgu	loop_856
	xor	%o3,	0x1BD8,	%g6
loop_855:
	brlez	%o6,	loop_857
	sth	%g4,	[%l7 + 0x5A]
loop_856:
	tsubcc	%i2,	0x0704,	%g7
	set	0x6C, %l3
	swapa	[%l7 + %l3] 0x11,	%i4
loop_857:
	alignaddrl	%o2,	%o1,	%i1
	call	loop_858
	fpsub32	%f26,	%f8,	%f18
	alignaddrl	%l3,	%l5,	%i6
	wr	%g0,	0x19,	%asi
	stxa	%o7,	[%l7 + 0x28] %asi
loop_858:
	movl	%xcc,	%l2,	%g2
	fba	%fcc3,	loop_859
	membar	0x2D
	edge8n	%l4,	%o4,	%l1
	tvs	%icc,	0x5
loop_859:
	edge16l	%l6,	%o5,	%g3
	fxnor	%f16,	%f28,	%f20
	udivcc	%i7,	0x1024,	%i0
	edge8n	%g5,	%o0,	%l0
	movle	%icc,	%g1,	%i3
	edge8	%o3,	%i5,	%g6
	bge,a	%icc,	loop_860
	alignaddr	%o6,	%i2,	%g4
	bg	%icc,	loop_861
	fmovrdlez	%g7,	%f28,	%f4
loop_860:
	srl	%o2,	0x02,	%i4
	mova	%xcc,	%o1,	%l3
loop_861:
	movne	%xcc,	%l5,	%i1
	nop
	setx	loop_862,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%icc,	%o7,	%l2
	fnand	%f12,	%f26,	%f6
	movg	%xcc,	%g2,	%l4
loop_862:
	nop
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x10
	edge32ln	%i6,	%o4,	%l6
	movrlez	%o5,	%g3,	%l1
	edge32n	%i0,	%i7,	%o0
	fnot2s	%f7,	%f14
	swap	[%l7 + 0x30],	%l0
	ldstub	[%l7 + 0x7E],	%g1
	wr	%g0,	0xe2,	%asi
	stwa	%g5,	[%l7 + 0x44] %asi
	membar	#Sync
	umul	%i3,	0x1F32,	%i5
	udiv	%o3,	0x12AB,	%g6
	taddcc	%i2,	%o6,	%g4
	bpos	loop_863
	fexpand	%f15,	%f26
	edge8n	%g7,	%i4,	%o1
	sir	0x16B3
loop_863:
	movvc	%icc,	%l3,	%o2
	bneg,a	%icc,	loop_864
	tneg	%icc,	0x7
	edge32l	%i1,	%l5,	%o7
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x1e,	%f0
loop_864:
	tsubcctv	%l2,	0x0ACA,	%l4
	tn	%xcc,	0x2
	sdivcc	%i6,	0x11C3,	%g2
	brgez,a	%o4,	loop_865
	nop
	set	0x6C, %l0
	prefetch	[%l7 + %l0],	 0x0
	fmovdl	%xcc,	%f0,	%f29
	tne	%icc,	0x6
loop_865:
	addcc	%l6,	%g3,	%l1
	fmul8sux16	%f4,	%f8,	%f10
	ble,pn	%xcc,	loop_866
	fmovsvc	%icc,	%f20,	%f23
	nop
	fitod	%f4,	%f10
	fdtoi	%f10,	%f1
	andn	%i0,	%o5,	%i7
loop_866:
	orn	%o0,	%l0,	%g5
	fnot2s	%f17,	%f14
	tneg	%xcc,	0x6
	fmovdcs	%icc,	%f15,	%f20
	movge	%icc,	%i3,	%g1
	add	%o3,	%g6,	%i2
	tle	%icc,	0x2
	mova	%xcc,	%i5,	%g4
	and	%g7,	%i4,	%o6
	tge	%xcc,	0x7
	array8	%l3,	%o2,	%o1
	movvs	%xcc,	%i1,	%o7
	fblg	%fcc1,	loop_867
	faligndata	%f28,	%f14,	%f24
	edge32	%l5,	%l4,	%i6
	popc	0x0B03,	%l2
loop_867:
	brlz	%g2,	loop_868
	movrgz	%l6,	0x0A0,	%g3
	fmovrslez	%l1,	%f24,	%f18
	edge32ln	%o4,	%o5,	%i7
loop_868:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%i0,	[%l7 + 0x1C] %asi
	edge16l	%o0,	%g5,	%i3
	andncc	%g1,	%l0,	%o3
	andncc	%g6,	%i5,	%i2
	fpack32	%f4,	%f8,	%f18
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x46] %asi,	%g4
	fblg	%fcc3,	loop_869
	movvs	%icc,	%i4,	%o6
	fmovd	%f8,	%f0
	movg	%xcc,	%g7,	%l3
loop_869:
	faligndata	%f14,	%f6,	%f6
	fbl	%fcc2,	loop_870
	fbul	%fcc1,	loop_871
	membar	0x73
	set	0x0C, %o0
	sta	%f6,	[%l7 + %o0] 0x10
loop_870:
	movvs	%xcc,	%o2,	%i1
loop_871:
	movle	%icc,	%o1,	%o7
	tgu	%xcc,	0x0
	bgu	%icc,	loop_872
	edge32n	%l4,	%l5,	%l2
	fmul8x16al	%f1,	%f12,	%f6
	array32	%i6,	%l6,	%g2
loop_872:
	fmovdge	%xcc,	%f20,	%f21
	tg	%xcc,	0x3
	and	%g3,	%o4,	%l1
	fmovrslez	%i7,	%f27,	%f0
	movrlez	%i0,	0x0AC,	%o0
	edge16ln	%o5,	%g5,	%g1
	fandnot2s	%f27,	%f31,	%f15
	sub	%i3,	%l0,	%o3
	tgu	%xcc,	0x7
	fbn,a	%fcc0,	loop_873
	ldd	[%l7 + 0x30],	%f16
	sllx	%g6,	%i5,	%i2
	bleu,a	%icc,	loop_874
loop_873:
	array16	%g4,	%o6,	%g7
	movre	%l3,	0x0FC,	%o2
	sllx	%i4,	%o1,	%i1
loop_874:
	fpackfix	%f4,	%f6
	tle	%xcc,	0x4
	fmovsvs	%xcc,	%f4,	%f22
	fmovsne	%xcc,	%f7,	%f21
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%o6
	movrne	%l5,	0x339,	%l4
	movcc	%icc,	%i6,	%l2
	fxors	%f19,	%f16,	%f5
	tge	%xcc,	0x6
	fcmple16	%f0,	%f28,	%l6
	flush	%l7 + 0x58
	tleu	%xcc,	0x7
	tcs	%icc,	0x2
	array16	%g3,	%o4,	%g2
	andcc	%l1,	%i7,	%o0
	nop
	set	0x30, %i5
	stx	%o5,	[%l7 + %i5]
	array8	%i0,	%g5,	%g1
	movrne	%i3,	0x3AC,	%l0
	nop
	fitod	%f6,	%f16
	fdtos	%f16,	%f9
	fpadd16	%f16,	%f14,	%f28
	ldd	[%l7 + 0x70],	%f24
	fbule	%fcc1,	loop_875
	or	%o3,	0x0592,	%i5
	lduh	[%l7 + 0x46],	%g6
	bn,pt	%icc,	loop_876
loop_875:
	tpos	%icc,	0x3
	nop
	setx	loop_877,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%i2,	0x0260,	%g4
loop_876:
	fmovda	%icc,	%f28,	%f8
	nop
	setx	0xC66828B949177550,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xBDA941C72368CC27,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f4,	%f28
loop_877:
	fba,a	%fcc3,	loop_878
	movle	%xcc,	%o6,	%g7
	movl	%icc,	%o2,	%l3
	xnorcc	%o1,	0x0001,	%i1
loop_878:
	add	%o7,	0x1D23,	%i4
	nop
	setx	loop_879,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x7E, %g3
	lduh	[%l7 + %g3],	%l5
	movgu	%icc,	%i6,	%l4
	sethi	0x1EAD,	%l2
loop_879:
	umulcc	%g3,	%o4,	%g2
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x7C] %asi,	%f4
	fbo	%fcc1,	loop_880
	subcc	%l6,	0x1FDD,	%i7
	edge16	%l1,	%o0,	%o5
	smul	%g5,	0x1C81,	%g1
loop_880:
	fmovdvs	%xcc,	%f12,	%f21
	movcc	%icc,	%i0,	%i3
	tsubcctv	%l0,	0x1647,	%o3
	fbne,a	%fcc1,	loop_881
	alignaddr	%i5,	%i2,	%g6
	edge16l	%o6,	%g7,	%o2
	edge32	%g4,	%o1,	%i1
loop_881:
	fmovdg	%icc,	%f31,	%f12
	sdivx	%l3,	0x13AE,	%i4
	fmovrsgez	%l5,	%f7,	%f29
	edge16	%o7,	%l4,	%i6
	tgu	%xcc,	0x0
	sll	%l2,	%g3,	%o4
	tsubcc	%g2,	%i7,	%l1
	nop
	setx	0xDBE544E0B0458F88,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	edge8n	%l6,	%o5,	%o0
	mulx	%g1,	%i0,	%i3
	edge16	%g5,	%l0,	%o3
	nop
	setx	0xAD408FB0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x523CE4E9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f13,	%f21
	brlz	%i2,	loop_882
	subccc	%g6,	%o6,	%g7
	fpmerge	%f10,	%f0,	%f12
	fble	%fcc2,	loop_883
loop_882:
	smul	%i5,	0x12F8,	%g4
	add	%o1,	%i1,	%l3
	fpsub32	%f12,	%f28,	%f10
loop_883:
	tgu	%icc,	0x3
	fmovsvs	%icc,	%f23,	%f4
	movrgez	%i4,	%l5,	%o7
	faligndata	%f26,	%f6,	%f8
	fnands	%f10,	%f18,	%f2
	fmovsn	%icc,	%f24,	%f5
	srl	%l4,	%i6,	%l2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	movvs	%icc,	%o4,	%g2
	movge	%icc,	%i7,	%g3
	tl	%xcc,	0x2
	be,pt	%icc,	loop_884
	sth	%l1,	[%l7 + 0x58]
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f1
	edge32	%o5,	%o0,	%g1
loop_884:
	umul	%i0,	0x19BC,	%l6
	nop
	set	0x60, %i1
	stx	%g5,	[%l7 + %i1]
	set	0x3C, %o7
	lda	[%l7 + %o7] 0x19,	%f8
	edge8n	%i3,	%o3,	%l0
	udiv	%g6,	0x1289,	%i2
	or	%o6,	0x0616,	%g7
	movleu	%xcc,	%i5,	%o1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%i1,	%g4
	bn	loop_885
	fandnot1	%f2,	%f12,	%f28
	fmovdn	%icc,	%f1,	%f19
	te	%icc,	0x1
loop_885:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x46] %asi,	%i4
	fandnot1s	%f12,	%f17,	%f19
	movrne	%l5,	0x1EA,	%l3
	sdivcc	%l4,	0x1F49,	%o7
	srax	%i6,	0x12,	%o2
	array16	%l2,	%o4,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%xcc,	%f6,	%f2
	orn	%g3,	%g2,	%l1
	and	%o0,	%o5,	%i0
	srl	%l6,	%g1,	%i3
	fmovrsne	%g5,	%f13,	%f24
	fmovrsne	%l0,	%f22,	%f11
	bvc,pn	%xcc,	loop_886
	movrlez	%g6,	%i2,	%o3
	tsubcctv	%g7,	%i5,	%o6
	nop
	setx	0xAC766D5094FAD921,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xAA7242DBC307CDB9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f10,	%f6
loop_886:
	tl	%xcc,	0x4
	brgez,a	%o1,	loop_887
	movl	%xcc,	%g4,	%i4
	andcc	%l5,	%l3,	%i1
	tge	%icc,	0x7
loop_887:
	fnegd	%f10,	%f24
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x56] %asi,	%o7
	fmovdne	%xcc,	%f15,	%f20
	movcs	%icc,	%i6,	%o2
	addc	%l4,	%l2,	%i7
	array8	%g3,	%g2,	%l1
	movrgz	%o0,	%o4,	%o5
	fbue	%fcc0,	loop_888
	fble	%fcc1,	loop_889
	tgu	%xcc,	0x2
	sth	%i0,	[%l7 + 0x60]
loop_888:
	tne	%xcc,	0x5
loop_889:
	nop
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x81
	tgu	%xcc,	0x7
	fxnor	%f14,	%f8,	%f4
	mulscc	%l6,	0x0863,	%g1
	mulscc	%i3,	0x1A14,	%l0
	movneg	%xcc,	%g5,	%g6
	brgz	%i2,	loop_890
	srlx	%o3,	%i5,	%o6
	movrlz	%g7,	0x06C,	%g4
	edge32l	%o1,	%l5,	%l3
loop_890:
	fmovdcc	%xcc,	%f0,	%f13
	movvc	%icc,	%i4,	%o7
	udivcc	%i1,	0x1043,	%o2
	movle	%xcc,	%l4,	%i6
	taddcc	%i7,	%g3,	%g2
	move	%xcc,	%l1,	%o0
	sethi	0x1901,	%l2
	nop
	fitod	%f14,	%f28
	wr	%g0,	0x11,	%asi
	sta	%f24,	[%l7 + 0x0C] %asi
	srax	%o4,	0x0A,	%i0
	movcc	%xcc,	%l6,	%o5
	umul	%g1,	0x0F47,	%l0
	set	0x20, %l4
	stxa	%i3,	[%l7 + %l4] 0x81
	or	%g5,	0x1AE7,	%g6
	fnot1s	%f12,	%f31
	addccc	%i2,	%o3,	%o6
	nop
	setx	0xFCECE0C9BC74C487,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x09ACABC6CAB53921,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f20,	%f26
	smul	%g7,	0x05A6,	%g4
	tneg	%icc,	0x6
	sll	%o1,	0x04,	%i5
	tge	%icc,	0x6
	add	%l5,	0x00EE,	%i4
	tle	%icc,	0x7
	movge	%icc,	%l3,	%i1
	fmovsvc	%xcc,	%f6,	%f20
	movrlez	%o7,	0x229,	%o2
	tg	%xcc,	0x7
	andcc	%l4,	%i6,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i7,	0x1B34,	%l1
	ldsw	[%l7 + 0x38],	%g2
	tsubcctv	%l2,	0x11E5,	%o4
	smulcc	%i0,	0x1B7B,	%o0
	movvs	%xcc,	%o5,	%g1
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x48] %asi,	%l0
	movg	%xcc,	%i3,	%g5
	subcc	%g6,	%l6,	%i2
	bg	loop_891
	movrlez	%o3,	%g7,	%g4
	smul	%o6,	0x049D,	%o1
	fpsub16	%f22,	%f0,	%f14
loop_891:
	brz	%i5,	loop_892
	movne	%icc,	%l5,	%l3
	fmul8x16al	%f1,	%f4,	%f22
	fnot2	%f18,	%f6
loop_892:
	tne	%xcc,	0x2
	lduw	[%l7 + 0x1C],	%i4
	fandnot1	%f28,	%f2,	%f4
	or	%i1,	0x1012,	%o2
	nop
	setx	0x75586BE9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x06CC45F0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f31,	%f3
	fmovda	%icc,	%f13,	%f20
	add	%l4,	%i6,	%g3
	edge8n	%o7,	%i7,	%g2
	srl	%l2,	%l1,	%o4
	umul	%i0,	0x10C0,	%o5
	edge16	%o0,	%g1,	%i3
	srlx	%g5,	%g6,	%l0
	movleu	%xcc,	%l6,	%i2
	nop
	setx loop_893, %l0, %l1
	jmpl %l1, %o3
	fandnot1	%f12,	%f2,	%f8
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g4,	%g7
loop_893:
	tge	%icc,	0x3
	fbu	%fcc0,	loop_894
	tn	%icc,	0x0
	movrlz	%o1,	%o6,	%i5
	umulcc	%l3,	%l5,	%i1
loop_894:
	bvs,a,pt	%icc,	loop_895
	tle	%icc,	0x1
	edge16n	%i4,	%o2,	%l4
	fmovsgu	%icc,	%f19,	%f0
loop_895:
	tleu	%icc,	0x3
	mova	%icc,	%g3,	%i6
	taddcctv	%o7,	0x168E,	%g2
	srlx	%l2,	%l1,	%o4
	orcc	%i0,	0x045B,	%i7
	fandnot1s	%f23,	%f19,	%f14
	orcc	%o5,	0x1031,	%g1
	fbe	%fcc1,	loop_896
	move	%icc,	%i3,	%o0
	mulscc	%g6,	%l0,	%l6
	tl	%icc,	0x3
loop_896:
	andncc	%i2,	%g5,	%g4
	move	%xcc,	%o3,	%o1
	movpos	%icc,	%g7,	%i5
	fxor	%f8,	%f30,	%f24
	tsubcc	%l3,	0x1735,	%l5
	prefetch	[%l7 + 0x14],	 0x2
	fnegs	%f23,	%f17
	add	%l7,	0x44,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] %asi,	%i1,	%o6
	add	%o2,	0x07E4,	%i4
	tn	%xcc,	0x2
	tgu	%xcc,	0x0
	nop
	fitos	%f23,	%f4
	movrlez	%g3,	0x063,	%i6
	for	%f2,	%f18,	%f26
	fcmpgt32	%f2,	%f26,	%l4
	fsrc2s	%f6,	%f3
	movge	%xcc,	%g2,	%l2
	nop
	fitos	%f9,	%f26
	fstod	%f26,	%f28
	sir	0x01F3
	mulscc	%o7,	0x0FEC,	%o4
	std	%f18,	[%l7 + 0x38]
	movle	%icc,	%l1,	%i7
	edge8ln	%i0,	%g1,	%o5
	orn	%o0,	0x1068,	%i3
	umul	%g6,	0x11F7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l6,	%g5,	%i2
	fornot1s	%f1,	%f4,	%f31
	edge8l	%o3,	%g4,	%o1
	array8	%i5,	%g7,	%l3
	sir	0x1A89
	tleu	%xcc,	0x1
	tg	%xcc,	0x2
	smul	%l5,	%i1,	%o6
	set	0x64, %g1
	lda	[%l7 + %g1] 0x15,	%f26
	fmovrsgez	%i4,	%f25,	%f27
	fmovdne	%icc,	%f30,	%f22
	fbule,a	%fcc3,	loop_897
	ldsw	[%l7 + 0x70],	%o2
	movrlez	%g3,	0x237,	%i6
	sllx	%g2,	%l4,	%l2
loop_897:
	udiv	%o7,	0x0771,	%l1
	stx	%i7,	[%l7 + 0x68]
	ldub	[%l7 + 0x30],	%o4
	movneg	%xcc,	%g1,	%i0
	fnand	%f8,	%f8,	%f8
	fbue,a	%fcc2,	loop_898
	subcc	%o0,	%o5,	%i3
	edge16	%g6,	%l6,	%l0
	fmovrse	%g5,	%f28,	%f6
loop_898:
	udiv	%i2,	0x147E,	%o3
	nop
	set	0x28, %g2
	std	%f2,	[%l7 + %g2]
	srlx	%g4,	0x07,	%i5
	te	%icc,	0x6
	bpos,a,pn	%xcc,	loop_899
	edge16	%o1,	%g7,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i1,	%o6
loop_899:
	nop
	setx	loop_900,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8l	%l3,	%i4,	%o2
	fmovsne	%icc,	%f9,	%f26
	udivx	%i6,	0x06E1,	%g3
loop_900:
	edge16ln	%g2,	%l2,	%o7
	movre	%l4,	0x3DE,	%i7
	movrgez	%o4,	%g1,	%i0
	nop
	set	0x0E, %o6
	ldsh	[%l7 + %o6],	%o0
	fabss	%f5,	%f2
	tcc	%icc,	0x5
	array16	%l1,	%o5,	%i3
	bleu,pn	%icc,	loop_901
	fcmpeq16	%f2,	%f16,	%g6
	umul	%l0,	0x0ED0,	%l6
	andn	%i2,	0x08F1,	%g5
loop_901:
	alignaddr	%g4,	%i5,	%o1
	alignaddr	%o3,	%l5,	%i1
	bvc,a	%xcc,	loop_902
	mulscc	%o6,	0x004A,	%l3
	edge8l	%g7,	%i4,	%o2
	brgz,a	%g3,	loop_903
loop_902:
	alignaddrl	%i6,	%l2,	%o7
	umul	%l4,	%i7,	%g2
	sra	%o4,	%i0,	%o0
loop_903:
	fmuld8ulx16	%f2,	%f10,	%f10
	edge8ln	%l1,	%o5,	%g1
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i3
	tsubcctv	%g6,	%l0,	%l6
	stw	%i2,	[%l7 + 0x30]
	edge16n	%g5,	%g4,	%o1
	tsubcctv	%o3,	0x007C,	%l5
	addc	%i1,	%i5,	%l3
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] %asi,	%g7,	%i4
	sethi	0x1051,	%o2
	fmovrdgez	%o6,	%f0,	%f10
	movle	%icc,	%g3,	%l2
	xnor	%i6,	0x0E2B,	%l4
	fmovsvs	%icc,	%f17,	%f8
	movrgez	%o7,	0x236,	%i7
	lduw	[%l7 + 0x08],	%g2
	set	0x28, %l5
	ldswa	[%l7 + %l5] 0x19,	%i0
	movrgez	%o4,	%l1,	%o0
	movne	%icc,	%o5,	%g1
	nop
	fitod	%f19,	%f22
	tge	%xcc,	0x2
	orncc	%g6,	%i3,	%l6
	fmuld8sux16	%f5,	%f1,	%f6
	nop
	fitod	%f0,	%f4
	fdtox	%f4,	%f24
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x27] %asi,	%i2
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x2C] %asi,	%f26
	movre	%l0,	%g4,	%o1
	nop
	setx loop_904, %l0, %l1
	jmpl %l1, %o3
	edge16n	%g5,	%l5,	%i5
	nop
	fitod	%f1,	%f24
	stbar
loop_904:
	andcc	%i1,	%g7,	%l3
	nop
	setx	0x632FEEE27A16F1F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC5280D238B7CF004,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f30,	%f16
	taddcctv	%o2,	0x148A,	%i4
	fmovrdlez	%o6,	%f16,	%f26
	xnorcc	%l2,	0x105C,	%i6
	edge32l	%l4,	%o7,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i7,	%i0
	fcmple32	%f10,	%f22,	%g2
	xnorcc	%o4,	%o0,	%l1
	movle	%xcc,	%g1,	%g6
	movle	%xcc,	%o5,	%i3
	movgu	%xcc,	%i2,	%l0
	movrlez	%l6,	%g4,	%o1
	mulx	%o3,	0x01EE,	%g5
	tpos	%icc,	0x4
	tg	%icc,	0x4
	fmovdvc	%xcc,	%f2,	%f5
	fnands	%f13,	%f27,	%f16
	smul	%i5,	0x0B43,	%l5
	fsrc1s	%f24,	%f17
	fbug	%fcc2,	loop_905
	edge16n	%i1,	%g7,	%l3
	andn	%i4,	%o6,	%o2
	ble	%xcc,	loop_906
loop_905:
	add	%i6,	0x19BA,	%l4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%l2
loop_906:
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f28
	fxtod	%f28,	%f14
	movrlez	%g3,	%i7,	%o7
	srlx	%i0,	0x0B,	%o4
	tge	%xcc,	0x3
	movn	%icc,	%g2,	%o0
	subccc	%l1,	%g1,	%o5
	edge16	%i3,	%g6,	%l0
	smulcc	%l6,	0x13DA,	%i2
	fnot2s	%f14,	%f13
	fnot1	%f4,	%f16
	stw	%o1,	[%l7 + 0x50]
	membar	0x3B
	addcc	%g4,	0x0CFD,	%o3
	fxor	%f14,	%f10,	%f28
	movcs	%icc,	%g5,	%i5
	orncc	%i1,	%g7,	%l3
	umul	%i4,	0x04BF,	%o6
	edge16ln	%o2,	%l5,	%l4
	movn	%icc,	%i6,	%g3
	addccc	%i7,	0x1B3C,	%o7
	edge8ln	%i0,	%l2,	%o4
	subc	%g2,	%o0,	%l1
	smulcc	%g1,	%o5,	%i3
	edge8l	%g6,	%l0,	%i2
	edge16l	%o1,	%g4,	%o3
	movcs	%xcc,	%g5,	%l6
	fmovsge	%icc,	%f19,	%f8
	tleu	%icc,	0x3
	nop
	set	0x30, %i0
	ldx	[%l7 + %i0],	%i1
	subc	%g7,	0x1E7E,	%l3
	taddcctv	%i5,	0x16C5,	%i4
	move	%icc,	%o2,	%o6
	fbug	%fcc1,	loop_907
	edge32ln	%l4,	%i6,	%l5
	array32	%i7,	%o7,	%i0
	nop
	setx	0x0BA4BF6A4CFBAEFE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xAA1FB61970DF130A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f22,	%f28
loop_907:
	fbu	%fcc0,	loop_908
	fcmpgt16	%f16,	%f8,	%g3
	xnorcc	%o4,	0x1FDF,	%l2
	fbge,a	%fcc0,	loop_909
loop_908:
	fmovsa	%icc,	%f4,	%f20
	nop
	set	0x40, %i6
	prefetch	[%l7 + %i6],	 0x3
	fnand	%f12,	%f26,	%f0
loop_909:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x72] %asi,	%g2
	fmovsgu	%icc,	%f3,	%f14
	edge8	%l1,	%o0,	%g1
	tsubcctv	%o5,	%i3,	%l0
	fbe	%fcc3,	loop_910
	or	%i2,	%o1,	%g4
	taddcctv	%o3,	0x0B23,	%g5
	tge	%icc,	0x4
loop_910:
	nop
	set	0x42, %i3
	stha	%g6,	[%l7 + %i3] 0x2f
	membar	#Sync
	ldstub	[%l7 + 0x0A],	%i1
	swap	[%l7 + 0x58],	%l6
	smulcc	%l3,	0x0024,	%g7
	edge32n	%i5,	%o2,	%i4
	sdiv	%o6,	0x1761,	%l4
	udivcc	%i6,	0x0DD6,	%i7
	edge32	%l5,	%i0,	%o7
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x30] %asi,	%o4
	edge16	%l2,	%g3,	%g2
	ldsb	[%l7 + 0x37],	%o0
	orncc	%l1,	%o5,	%i3
	taddcctv	%l0,	%i2,	%o1
	edge8ln	%g1,	%o3,	%g5
	ldd	[%l7 + 0x60],	%g4
	orn	%i1,	0x0BBE,	%l6
	mulscc	%l3,	0x122F,	%g7
	movpos	%icc,	%g6,	%o2
	fmuld8sux16	%f3,	%f4,	%f20
	nop
	setx	0x9E08AE73,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f2
	set	0x20, %g5
	prefetcha	[%l7 + %g5] 0x14,	 0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %o1
	prefetcha	[%l7 + %o1] 0x19,	 0x3
	taddcctv	%i5,	%l4,	%i6
	fzeros	%f22
	edge16	%l5,	%i0,	%o7
	fbue,a	%fcc0,	loop_911
	edge32l	%o4,	%l2,	%g3
	srl	%g2,	0x15,	%o0
	edge8ln	%i7,	%l1,	%o5
loop_911:
	movleu	%icc,	%i3,	%i2
	fbe,a	%fcc3,	loop_912
	edge32n	%l0,	%o1,	%o3
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%g1
loop_912:
	fone	%f2
	fbul,a	%fcc3,	loop_913
	fmovdn	%xcc,	%f2,	%f12
	fpmerge	%f4,	%f19,	%f2
	fmovrsgez	%g5,	%f3,	%f0
loop_913:
	edge8n	%i1,	%g4,	%l6
	alignaddrl	%l3,	%g7,	%o2
	fmovsneg	%xcc,	%f25,	%f17
	brlz,a	%i4,	loop_914
	fmovrdne	%g6,	%f2,	%f24
	membar	0x05
	xor	%i5,	0x05CD,	%o6
loop_914:
	faligndata	%f26,	%f14,	%f18
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f12
	fmovdle	%xcc,	%f28,	%f27
	fandnot2	%f16,	%f4,	%f0
	tsubcctv	%l4,	0x0D7A,	%i6
	array32	%l5,	%o7,	%o4
	edge8l	%l2,	%g3,	%g2
	sll	%i0,	%i7,	%l1
	sub	%o5,	%o0,	%i3
	bgu	loop_915
	movvs	%icc,	%l0,	%i2
	fmovsge	%icc,	%f5,	%f12
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%o0
loop_915:
	fpsub16s	%f22,	%f19,	%f27
	tgu	%xcc,	0x3
	wr	%g0,	0x18,	%asi
	stwa	%g1,	[%l7 + 0x70] %asi
	set	0x8, %i2
	stxa	%o3,	[%g0 + %i2] 0x21
	tcs	%xcc,	0x7
	fmovscs	%xcc,	%f9,	%f31
	andncc	%i1,	%g4,	%g5
	umulcc	%l6,	0x0BB0,	%l3
	movl	%icc,	%g7,	%o2
	bleu,pt	%xcc,	loop_916
	srlx	%g6,	%i4,	%i5
	ldstub	[%l7 + 0x34],	%o6
	edge16n	%l4,	%i6,	%o7
loop_916:
	fcmpeq32	%f18,	%f16,	%l5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%g3
	lduw	[%l7 + 0x5C],	%l2
	movge	%xcc,	%i0,	%i7
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	fpsub32s	%f6,	%f12,	%f28
	set	0x62, %i4
	stha	%l1,	[%l7 + %i4] 0x27
	membar	#Sync
	fmuld8ulx16	%f23,	%f13,	%f28
	movg	%xcc,	%o5,	%i3
	udivx	%o0,	0x07FD,	%l0
	orn	%i2,	0x15C6,	%g1
	xorcc	%o3,	0x15C7,	%i1
	bpos,a,pt	%xcc,	loop_917
	sth	%o1,	[%l7 + 0x76]
	fbe	%fcc1,	loop_918
	tvs	%icc,	0x7
loop_917:
	sdiv	%g5,	0x0EBE,	%l6
	fbule,a	%fcc3,	loop_919
loop_918:
	tpos	%icc,	0x4
	array16	%l3,	%g4,	%g7
	movge	%icc,	%g6,	%o2
loop_919:
	tl	%icc,	0x4
	sir	0x087F
	nop
	set	0x7C, %l6
	stb	%i4,	[%l7 + %l6]
	fornot2	%f12,	%f0,	%f12
	bn,a,pt	%xcc,	loop_920
	brlez,a	%i5,	loop_921
	sethi	0x0C81,	%l4
	mulscc	%i6,	%o6,	%o7
loop_920:
	nop
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o4,	%g3
loop_921:
	tcc	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x1C],	%l5
	fcmpgt32	%f26,	%f16,	%i0
	bleu,pn	%icc,	loop_922
	subccc	%l2,	0x0710,	%i7
	sub	%g2,	0x1FE1,	%l1
	movrlez	%i3,	%o5,	%o0
loop_922:
	te	%xcc,	0x3
	fbge,a	%fcc2,	loop_923
	fabsd	%f30,	%f20
	movle	%xcc,	%l0,	%i2
	tne	%xcc,	0x2
loop_923:
	edge8	%o3,	%g1,	%i1
	movrgz	%g5,	0x2D0,	%o1
	ldd	[%l7 + 0x58],	%l2
	tleu	%icc,	0x0
	fands	%f7,	%f14,	%f17
	array16	%l6,	%g4,	%g6
	movvc	%xcc,	%g7,	%i4
	ldd	[%l7 + 0x68],	%i4
	fbe	%fcc3,	loop_924
	or	%l4,	0x0038,	%i6
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x00] %asi,	%o6
loop_924:
	nop
	set	0x14, %i7
	lda	[%l7 + %i7] 0x11,	%f5
	orncc	%o7,	0x1CA2,	%o4
	ba,a	loop_925
	nop
	setx	0x204CCC0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	movre	%g3,	0x04A,	%l5
	fsrc2s	%f28,	%f31
loop_925:
	subc	%o2,	0x1F80,	%i0
	wr	%g0,	0x2f,	%asi
	stha	%l2,	[%l7 + 0x1C] %asi
	membar	#Sync
	nop
	setx loop_926, %l0, %l1
	jmpl %l1, %g2
	orcc	%i7,	0x0B00,	%i3
	fmovdgu	%xcc,	%f26,	%f22
	edge8n	%l1,	%o5,	%o0
loop_926:
	fmul8sux16	%f18,	%f30,	%f8
	tl	%xcc,	0x2
	and	%l0,	%i2,	%g1
	fmovde	%xcc,	%f12,	%f26
	subc	%i1,	0x1AA3,	%o3
	membar	0x29
	movre	%o1,	%g5,	%l6
	xor	%g4,	%l3,	%g6
	ldub	[%l7 + 0x38],	%i4
	fnot2	%f30,	%f22
	sllx	%i5,	0x1C,	%l4
	tle	%xcc,	0x5
	movne	%xcc,	%i6,	%g7
	movcs	%xcc,	%o6,	%o4
	or	%o7,	0x0635,	%l5
	sra	%o2,	%g3,	%i0
	movl	%icc,	%g2,	%i7
	udivcc	%i3,	0x0408,	%l1
	movrgz	%o5,	0x0F0,	%o0
	subcc	%l0,	0x19DE,	%i2
	addccc	%l2,	%g1,	%i1
	nop
	setx	0x66690566,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xAFD38006,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f13,	%f31
	ld	[%l7 + 0x38],	%f17
	fpadd16s	%f12,	%f10,	%f26
	edge16n	%o3,	%g5,	%o1
	edge32ln	%l6,	%g4,	%l3
	movneg	%xcc,	%g6,	%i5
	fba	%fcc1,	loop_927
	edge8n	%l4,	%i6,	%i4
	xnorcc	%o6,	0x1450,	%o4
	tg	%icc,	0x3
loop_927:
	fmovdvs	%icc,	%f16,	%f12
	fmovsleu	%xcc,	%f22,	%f16
	taddcctv	%g7,	%l5,	%o7
	ldsb	[%l7 + 0x42],	%o2
	xnor	%i0,	0x12AA,	%g3
	nop
	set	0x30, %g6
	std	%f22,	[%l7 + %g6]
	edge8n	%i7,	%i3,	%l1
	fmovdvs	%xcc,	%f27,	%f8
	fmovdge	%icc,	%f5,	%f31
	edge32	%o5,	%g2,	%l0
	add	%o0,	%l2,	%i2
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f0
	edge8n	%g1,	%o3,	%g5
	movrgez	%o1,	0x378,	%i1
	edge8	%l6,	%g4,	%l3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%i5,	%g6
	movpos	%icc,	%l4,	%i6
	udiv	%i4,	0x126D,	%o6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x2D] %asi,	%g7
	tl	%xcc,	0x3
	tvs	%xcc,	0x6
	addccc	%o4,	%l5,	%o2
	tl	%xcc,	0x0
	fba	%fcc0,	loop_928
	sra	%i0,	0x10,	%g3
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
loop_928:
	movvc	%icc,	%i3,	%i7
	array32	%l1,	%o5,	%g2
	fbl,a	%fcc0,	loop_929
	fba	%fcc0,	loop_930
	orncc	%l0,	%l2,	%o0
	tg	%xcc,	0x6
loop_929:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x18,	%g1,	%o3
loop_930:
	fcmpgt32	%f0,	%f10,	%g5
	fzeros	%f1
	and	%o1,	0x17B4,	%i2
	movrne	%l6,	0x297,	%g4
	nop
	fitod	%f13,	%f20
	and	%l3,	%i5,	%g6
	smul	%l4,	0x07B4,	%i1
	movrne	%i6,	%i4,	%o6
	edge16n	%o4,	%l5,	%o2
	tcs	%xcc,	0x3
	addcc	%i0,	%g3,	%o7
	ldsh	[%l7 + 0x62],	%i3
	call	loop_931
	fmovrse	%i7,	%f8,	%f0
	tcs	%xcc,	0x2
	movneg	%icc,	%l1,	%g7
loop_931:
	nop
	set	0x13, %o2
	ldub	[%l7 + %o2],	%o5
	bcc,pt	%icc,	loop_932
	tge	%xcc,	0x0
	tl	%xcc,	0x0
	fmovsneg	%xcc,	%f29,	%f12
loop_932:
	movcc	%xcc,	%g2,	%l0
	nop
	setx	0xC5FAD8D9CCE9756E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f10
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x10] %asi,	%f7
	ta	%xcc,	0x3
	movne	%icc,	%o0,	%l2
	fbge	%fcc1,	loop_933
	tcs	%icc,	0x2
	fandnot2s	%f31,	%f12,	%f8
	fandnot1	%f2,	%f10,	%f16
loop_933:
	srlx	%o3,	0x06,	%g5
	fmovde	%xcc,	%f26,	%f25
	fbu	%fcc2,	loop_934
	edge32l	%g1,	%o1,	%l6
	sllx	%i2,	%g4,	%i5
	set	0x18, %o4
	ldsha	[%l7 + %o4] 0x88,	%l3
loop_934:
	tgu	%icc,	0x6
	sdivx	%g6,	0x1F43,	%i1
	subcc	%i6,	%i4,	%l4
	array8	%o6,	%o4,	%l5
	nop
	setx	0x579168F3A058969B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	srlx	%o2,	0x0E,	%g3
	edge16ln	%i0,	%i3,	%o7
	nop
	setx	0xC054061C,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	movvs	%icc,	%i7,	%l1
	tg	%icc,	0x5
	ba	loop_935
	edge16n	%o5,	%g2,	%l0
	fabss	%f6,	%f28
	fblg,a	%fcc2,	loop_936
loop_935:
	ta	%icc,	0x1
	tsubcctv	%g7,	%o0,	%l2
	fcmple16	%f6,	%f2,	%o3
loop_936:
	popc	%g1,	%o1
	sub	%l6,	%i2,	%g5
	taddcc	%i5,	%l3,	%g6
	popc	%g4,	%i1
	mulx	%i4,	%l4,	%i6
	stx	%o4,	[%l7 + 0x38]
	sra	%o6,	0x1D,	%o2
	fmovsl	%icc,	%f13,	%f25
	nop
	fitos	%f0,	%f30
	fstoi	%f30,	%f27
	ta	%icc,	0x2
	fsrc1s	%f14,	%f16
	tvs	%icc,	0x2
	tsubcctv	%l5,	0x1E9C,	%i0
	tl	%xcc,	0x5
	edge32ln	%g3,	%o7,	%i7
	bvs,pn	%icc,	loop_937
	edge16l	%i3,	%l1,	%g2
	fornot2	%f6,	%f30,	%f22
	umulcc	%l0,	%g7,	%o5
loop_937:
	brlez,a	%l2,	loop_938
	fmovdle	%xcc,	%f18,	%f24
	edge16	%o0,	%g1,	%o3
	smul	%o1,	0x18CF,	%i2
loop_938:
	nop
	fitos	%f0,	%f31
	nop
	setx	0xCF945F45,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x7C4F82CC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f6,	%f14
	fble	%fcc0,	loop_939
	fzeros	%f15
	tge	%icc,	0x1
	set	0x3f0, %l3
	nop 	! 	nop 	! 	ldxa	[%g0 + %l3] 0x40,	%g5 ripped by fixASI40.pl ripped by fixASI40.pl
loop_939:
	mulx	%l6,	%i5,	%l3
	movge	%icc,	%g4,	%g6
	set	0x6C, %l1
	ldswa	[%l7 + %l1] 0x81,	%i1
	ble	%icc,	loop_940
	movcs	%xcc,	%i4,	%i6
	tvc	%icc,	0x4
	fmul8x16al	%f30,	%f29,	%f30
loop_940:
	alignaddrl	%o4,	%o6,	%l4
	tl	%xcc,	0x0
	edge16	%l5,	%i0,	%o2
	ta	%xcc,	0x7
	nop
	setx	0xCD762DB66769D8DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x5B9C8A2713EB7ABE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f2,	%f14
	fbul,a	%fcc3,	loop_941
	orcc	%g3,	0x0275,	%i7
	stw	%o7,	[%l7 + 0x34]
	edge32	%i3,	%g2,	%l1
loop_941:
	addccc	%l0,	%g7,	%l2
	addcc	%o0,	0x068C,	%o5
	tg	%icc,	0x2
	fpackfix	%f10,	%f13
	bne,pt	%icc,	loop_942
	or	%g1,	%o3,	%o1
	fornot1	%f4,	%f26,	%f16
	fornot1	%f12,	%f24,	%f6
loop_942:
	tcc	%icc,	0x6
	fmovdn	%icc,	%f9,	%f8
	fsrc2	%f18,	%f6
	te	%icc,	0x6
	fmovrsgez	%g5,	%f13,	%f15
	sra	%l6,	%i2,	%l3
	udiv	%g4,	0x0A12,	%i5
	fmovdge	%xcc,	%f4,	%f15
	fxor	%f14,	%f6,	%f6
	udiv	%i1,	0x0B3F,	%g6
	flush	%l7 + 0x6C
	fbn	%fcc3,	loop_943
	fmovrdlz	%i6,	%f20,	%f16
	edge16l	%i4,	%o6,	%o4
	alignaddr	%l4,	%l5,	%o2
loop_943:
	movleu	%icc,	%i0,	%g3
	stw	%o7,	[%l7 + 0x58]
	movg	%icc,	%i3,	%g2
	tle	%xcc,	0x5
	set	0x48, %o5
	ldxa	[%l7 + %o5] 0x11,	%i7
	std	%f30,	[%l7 + 0x78]
	st	%f1,	[%l7 + 0x44]
	fmovscc	%icc,	%f18,	%f15
	ldx	[%l7 + 0x68],	%l1
	fbge,a	%fcc3,	loop_944
	sdivx	%g7,	0x16F3,	%l0
	xorcc	%l2,	%o5,	%o0
	edge16ln	%g1,	%o3,	%g5
loop_944:
	fmovdleu	%xcc,	%f7,	%f16
	umulcc	%l6,	%o1,	%i2
	fmovrsgez	%l3,	%f13,	%f2
	nop
	setx	0xB239323F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x282C39EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f29,	%f26
	tge	%icc,	0x1
	fmovsne	%xcc,	%f23,	%f17
	brz,a	%i5,	loop_945
	nop
	fitos	%f14,	%f8
	fstod	%f8,	%f30
	edge8n	%i1,	%g4,	%i6
	tcc	%icc,	0x5
loop_945:
	movcs	%icc,	%g6,	%o6
	fmovrde	%i4,	%f26,	%f8
	fbule,a	%fcc0,	loop_946
	and	%o4,	0x024B,	%l4
	sdivx	%o2,	0x0DE7,	%l5
	wr	%g0,	0x18,	%asi
	stwa	%i0,	[%l7 + 0x3C] %asi
loop_946:
	fabss	%f8,	%f25
	movneg	%icc,	%o7,	%i3
	tleu	%icc,	0x7
	edge8n	%g3,	%i7,	%g2
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x30] %asi,	%f22
	edge16ln	%l1,	%g7,	%l2
	set	0x2C, %l0
	swapa	[%l7 + %l0] 0x88,	%o5
	ble,a	%icc,	loop_947
	tgu	%icc,	0x5
	udiv	%o0,	0x0718,	%g1
	smulcc	%o3,	%g5,	%l0
loop_947:
	fmovdle	%icc,	%f28,	%f17
	fmovsle	%xcc,	%f30,	%f5
	fandnot2	%f16,	%f26,	%f12
	wr	%g0,	0x80,	%asi
	sta	%f30,	[%l7 + 0x0C] %asi
	brgez	%o1,	loop_948
	alignaddr	%l6,	%i2,	%l3
	sdiv	%i1,	0x08AD,	%g4
	andcc	%i6,	0x1AFA,	%i5
loop_948:
	mulx	%o6,	%g6,	%o4
	tg	%icc,	0x7
	tgu	%xcc,	0x7
	call	loop_949
	smulcc	%i4,	%o2,	%l5
	fand	%f6,	%f16,	%f24
	fpack32	%f28,	%f20,	%f20
loop_949:
	tleu	%xcc,	0x5
	fpsub32s	%f2,	%f7,	%f14
	nop
	fitos	%f31,	%f7
	prefetch	[%l7 + 0x28],	 0x0
	taddcc	%i0,	%l4,	%o7
	fands	%f6,	%f17,	%f4
	nop
	setx	0x6B2FEF5692951E8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x2505E0489C2A79CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f22,	%f2
	and	%i3,	%i7,	%g3
	array16	%g2,	%l1,	%l2
	srlx	%o5,	%g7,	%o0
	movre	%o3,	%g1,	%l0
	andcc	%g5,	0x018C,	%o1
	addccc	%l6,	0x1C76,	%l3
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x005B,	%i1
	movre	%i2,	%i6,	%i5
	fmul8x16au	%f3,	%f21,	%f14
	ldx	[%l7 + 0x20],	%o6
	add	%g6,	%o4,	%g4
	movg	%icc,	%o2,	%l5
	fbge	%fcc1,	loop_950
	srl	%i0,	0x0A,	%i4
	ba,pt	%icc,	loop_951
	add	%o7,	0x0C3B,	%l4
loop_950:
	bvs,pn	%xcc,	loop_952
	sdivcc	%i7,	0x1592,	%i3
loop_951:
	fbn	%fcc0,	loop_953
	movge	%icc,	%g2,	%g3
loop_952:
	xor	%l2,	0x1F84,	%o5
	fnot1	%f0,	%f6
loop_953:
	smul	%l1,	%g7,	%o0
	sir	0x181F
	nop
	setx	0x22EE5C72,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f19
	fnors	%f3,	%f9,	%f26
	ldd	[%l7 + 0x10],	%f12
	tcs	%xcc,	0x0
	set	0x76, %l2
	lduba	[%l7 + %l2] 0x89,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g1,	0x0212,	%l0
	fbl	%fcc3,	loop_954
	bge,a,pt	%xcc,	loop_955
	movg	%xcc,	%g5,	%l6
	movrgz	%l3,	%i1,	%i2
loop_954:
	xnor	%i6,	0x1677,	%o1
loop_955:
	xnorcc	%i5,	%g6,	%o6
	nop
	setx	0x52A743AA39043FA4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f16
	tcc	%icc,	0x1
	movn	%icc,	%g4,	%o4
	nop
	setx	0x304ECEC6FA0597A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xE2C59E27E418EBA0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f20,	%f12
	movpos	%xcc,	%l5,	%i0
	nop
	fitod	%f2,	%f8
	fdtos	%f8,	%f18
	movn	%icc,	%o2,	%i4
	fmovrdgez	%o7,	%f2,	%f6
	tleu	%xcc,	0x7
	ldx	[%l7 + 0x68],	%i7
	edge16l	%i3,	%l4,	%g3
	nop
	setx	0xC5E6B36118BB3EA7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xC3D3A5F49EEBC860,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f8,	%f8
	sdivx	%g2,	0x1779,	%l2
	andcc	%o5,	0x1128,	%g7
	fbge	%fcc0,	loop_956
	fxnors	%f7,	%f7,	%f12
	fmovdg	%icc,	%f3,	%f30
	fmovrde	%o0,	%f30,	%f22
loop_956:
	nop
	fitos	%f18,	%f24
	tcc	%xcc,	0x3
	movvs	%xcc,	%o3,	%g1
	movcc	%icc,	%l0,	%g5
	fornot1	%f8,	%f4,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l6,	%l3,	%l1
	fba	%fcc3,	loop_957
	movrgz	%i1,	%i6,	%o1
	addc	%i2,	0x14FF,	%g6
	fxors	%f29,	%f10,	%f15
loop_957:
	tn	%xcc,	0x3
	fba	%fcc2,	loop_958
	fmovrslez	%o6,	%f8,	%f2
	fcmple16	%f24,	%f4,	%g4
	tsubcc	%o4,	%l5,	%i5
loop_958:
	fnot2s	%f23,	%f11
	movl	%icc,	%i0,	%i4
	brz,a	%o2,	loop_959
	nop
	fitod	%f10,	%f12
	fdtox	%f12,	%f20
	fzeros	%f31
	xnorcc	%o7,	0x14BC,	%i7
loop_959:
	fmovrsgz	%l4,	%f24,	%f22
	movpos	%icc,	%g3,	%i3
	smulcc	%l2,	0x1703,	%g2
	fmul8x16	%f23,	%f20,	%f20
	fpack32	%f2,	%f4,	%f22
	fmovs	%f22,	%f6
	movge	%xcc,	%g7,	%o5
	fpadd16	%f4,	%f28,	%f2
	fpack32	%f14,	%f12,	%f20
	wr	%g0,	0x04,	%asi
	sta	%f16,	[%l7 + 0x78] %asi
	tgu	%xcc,	0x6
	sub	%o3,	0x1B56,	%g1
	edge32ln	%o0,	%l0,	%g5
	orn	%l3,	0x12CC,	%l1
	tleu	%xcc,	0x0
	or	%l6,	%i1,	%i6
	movrlez	%i2,	0x144,	%o1
	stb	%g6,	[%l7 + 0x76]
	fmovdge	%xcc,	%f22,	%f21
	lduw	[%l7 + 0x38],	%g4
	tsubcc	%o4,	0x07B3,	%o6
	move	%icc,	%i5,	%i0
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x89
	tcs	%xcc,	0x3
	sethi	0x080C,	%l5
	fpack32	%f28,	%f20,	%f18
	mulscc	%o2,	0x1DA2,	%o7
	ldstub	[%l7 + 0x5B],	%i4
	flush	%l7 + 0x0C
	taddcc	%i7,	%l4,	%g3
	pdist	%f10,	%f8,	%f22
	set	0x60, %i5
	ldda	[%l7 + %i5] 0xe3,	%i2
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
	movle	%icc,	%g2,	%g7
	fbuge,a	%fcc0,	loop_961
	tge	%xcc,	0x4
loop_960:
	taddcctv	%l2,	%o5,	%o3
	umul	%g1,	%l0,	%o0
loop_961:
	fnot2s	%f6,	%f9
	bl,a,pt	%xcc,	loop_962
	bvs,a	loop_963
	nop
	setx	0xB93CCE68,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x1E141581,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f2,	%f19
	tsubcctv	%g5,	0x0814,	%l1
loop_962:
	fexpand	%f4,	%f20
loop_963:
	fbg,a	%fcc1,	loop_964
	fbul	%fcc2,	loop_965
	movrgz	%l3,	0x014,	%l6
	fmovrslz	%i1,	%f13,	%f11
loop_964:
	fpmerge	%f30,	%f6,	%f16
loop_965:
	fone	%f18
	set	0x28, %o0
	ldsha	[%l7 + %o0] 0x89,	%i2
	faligndata	%f18,	%f12,	%f16
	fmovrdlez	%o1,	%f20,	%f0
	fpadd16s	%f6,	%f24,	%f11
	movrlz	%i6,	%g6,	%g4
	fones	%f5
	xnorcc	%o4,	%o6,	%i5
	fmovsvc	%xcc,	%f28,	%f11
	fors	%f27,	%f15,	%f12
	tne	%icc,	0x6
	bne,a	%xcc,	loop_966
	tgu	%xcc,	0x3
	fbu	%fcc1,	loop_967
	te	%xcc,	0x0
loop_966:
	tge	%xcc,	0x0
	set	0x70, %i1
	ldda	[%l7 + %i1] 0x24,	%l4
loop_967:
	movrlez	%o2,	0x20A,	%i0
	movvs	%xcc,	%o7,	%i7
	fand	%f24,	%f2,	%f30
	fmovscc	%xcc,	%f15,	%f11
	xor	%l4,	0x0ED3,	%g3
	ld	[%l7 + 0x5C],	%f30
	fmovdle	%icc,	%f20,	%f4
	te	%icc,	0x5
	udivcc	%i3,	0x0A03,	%i4
	fbg,a	%fcc3,	loop_968
	add	%g2,	0x0DAA,	%l2
	bcs	loop_969
	srax	%g7,	0x09,	%o3
loop_968:
	subccc	%g1,	%o5,	%l0
	movrlz	%o0,	%g5,	%l3
loop_969:
	movl	%icc,	%l6,	%l1
	fors	%f30,	%f5,	%f17
	movge	%icc,	%i1,	%o1
	edge32	%i2,	%g6,	%g4
	sdiv	%i6,	0x1A60,	%o6
	mulscc	%i5,	%l5,	%o2
	set	0x5B, %o7
	ldsba	[%l7 + %o7] 0x14,	%i0
	movrlez	%o4,	0x09F,	%i7
	brlz,a	%l4,	loop_970
	subcc	%g3,	%i3,	%i4
	edge16l	%g2,	%l2,	%o7
	sub	%g7,	0x18F9,	%g1
loop_970:
	andn	%o3,	%o5,	%o0
	addc	%g5,	%l0,	%l6
	wr	%g0,	0xe2,	%asi
	stxa	%l3,	[%l7 + 0x20] %asi
	membar	#Sync
	xor	%i1,	%l1,	%o1
	tvc	%xcc,	0x2
	andn	%g6,	0x09F2,	%g4
	tvc	%icc,	0x5
	fba	%fcc0,	loop_971
	orn	%i2,	0x0793,	%i6
	movrlez	%o6,	%i5,	%l5
	umul	%o2,	%o4,	%i0
loop_971:
	sdivcc	%l4,	0x0F77,	%i7
	tcs	%icc,	0x0
	nop
	setx	0x9B914134F58C31A5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB9857AD21CBEEA9E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f18,	%f16
	mulx	%i3,	%g3,	%i4
	ldstub	[%l7 + 0x15],	%g2
	orncc	%o7,	0x1F4E,	%g7
	mova	%xcc,	%g1,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f31,	%f31
	bn,a	%icc,	loop_972
	edge8l	%l2,	%o5,	%g5
	tg	%icc,	0x1
	orncc	%o0,	%l0,	%l6
loop_972:
	mulx	%l3,	0x164D,	%l1
	bshuffle	%f16,	%f12,	%f10
	fmovscc	%xcc,	%f26,	%f5
	fmovsge	%icc,	%f13,	%f31
	fbne,a	%fcc2,	loop_973
	smulcc	%o1,	0x05D3,	%g6
	fmul8x16au	%f25,	%f22,	%f10
	taddcctv	%i1,	%i2,	%i6
loop_973:
	or	%g4,	0x15D9,	%o6
	fmovsl	%icc,	%f19,	%f8
	fbe,a	%fcc2,	loop_974
	nop
	set	0x27, %g3
	ldub	[%l7 + %g3],	%l5
	stbar
	fandnot2s	%f23,	%f9,	%f3
loop_974:
	bpos,a	loop_975
	xorcc	%i5,	%o2,	%o4
	stbar
	addc	%i0,	0x01AC,	%l4
loop_975:
	movvc	%xcc,	%i3,	%g3
	movge	%xcc,	%i7,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i4,	0x0741,	%o7
	edge32l	%g7,	%o3,	%l2
	array16	%o5,	%g5,	%o0
	srlx	%g1,	0x05,	%l0
	movvs	%xcc,	%l6,	%l3
	fnor	%f26,	%f10,	%f6
	array8	%o1,	%g6,	%i1
	ble,pn	%xcc,	loop_976
	edge16	%l1,	%i6,	%i2
	tvs	%xcc,	0x2
	fcmpeq16	%f18,	%f26,	%o6
loop_976:
	udiv	%g4,	0x0C1E,	%i5
	edge8	%l5,	%o4,	%o2
	sdivx	%i0,	0x154C,	%i3
	tl	%xcc,	0x2
	add	%l4,	%i7,	%g3
	fcmpeq16	%f0,	%f20,	%g2
	set	0x3C, %g7
	stha	%o7,	[%l7 + %g7] 0x10
	tg	%icc,	0x6
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x50] %asi,	%g7
	ldd	[%l7 + 0x08],	%i4
	umul	%o3,	%o5,	%g5
	taddcc	%l2,	%g1,	%l0
	movrlez	%l6,	0x299,	%l3
	edge32l	%o0,	%g6,	%i1
	edge32ln	%o1,	%i6,	%i2
	fands	%f27,	%f28,	%f23
	and	%o6,	%l1,	%i5
	wr	%g0,	0x23,	%asi
	stba	%g4,	[%l7 + 0x7B] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o4,	0x1AA5,	%l5
	movre	%i0,	0x350,	%i3
	nop
	setx	0xB66D64E45BC776CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x66779B405305CC06,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f20,	%f18
	fnor	%f18,	%f30,	%f2
	swap	[%l7 + 0x24],	%l4
	udivcc	%o2,	0x0B54,	%i7
	tvs	%xcc,	0x3
	tcc	%icc,	0x3
	sllx	%g3,	0x13,	%g2
	udivcc	%o7,	0x1377,	%g7
	array32	%i4,	%o3,	%o5
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f6
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	set	0x28, %g1
	ldsha	[%l7 + %g1] 0x88,	%l2
	movrgez	%g1,	%l0,	%l3
	movrgz	%o0,	0x304,	%l6
	addc	%g6,	%o1,	%i6
	bgu,a	loop_977
	and	%i2,	%o6,	%i1
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_977:
	sdiv	%l1,	0x0995,	%i5
	nop
	setx loop_978, %l0, %l1
	jmpl %l1, %o4
	fsrc2	%f28,	%f20
	edge32n	%l5,	%g4,	%i3
	brlez	%i0,	loop_979
loop_978:
	fbn,a	%fcc3,	loop_980
	smul	%o2,	%l4,	%i7
	stbar
loop_979:
	alignaddrl	%g2,	%o7,	%g3
loop_980:
	movne	%icc,	%g7,	%i4
	subcc	%o3,	%g5,	%o5
	set	0x24, %l4
	lduwa	[%l7 + %l4] 0x10,	%l2
	nop
	set	0x74, %g2
	lduw	[%l7 + %g2],	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x0
	edge32n	%g1,	%o0,	%l6
	sdivcc	%l3,	0x0AAA,	%o1
	movne	%xcc,	%g6,	%i6
	fmovscs	%xcc,	%f6,	%f13
	andcc	%i2,	0x01DD,	%i1
	fble	%fcc1,	loop_981
	edge8	%o6,	%i5,	%l1
	srax	%o4,	0x08,	%g4
	umul	%l5,	%i3,	%o2
loop_981:
	ba,pt	%icc,	loop_982
	mova	%xcc,	%l4,	%i0
	tleu	%icc,	0x4
	edge32	%i7,	%o7,	%g3
loop_982:
	movcc	%icc,	%g2,	%i4
	movge	%xcc,	%o3,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%g5,	%o5,	%l2
	fsrc2	%f20,	%f14
	umul	%g1,	%l0,	%l6
	sub	%o0,	%l3,	%g6
	movge	%icc,	%i6,	%o1
	xorcc	%i2,	0x1171,	%i1
	xorcc	%o6,	%i5,	%o4
	fbl	%fcc1,	loop_983
	andn	%g4,	0x16D6,	%l1
	array8	%l5,	%i3,	%l4
	addccc	%i0,	0x1307,	%o2
loop_983:
	nop
	set	0x08, %l5
	ldswa	[%l7 + %l5] 0x89,	%o7
	ldub	[%l7 + 0x4C],	%g3
	bn,a,pn	%icc,	loop_984
	stbar
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f18
	bn,a,pn	%xcc,	loop_985
loop_984:
	addcc	%i7,	%g2,	%o3
	edge16	%i4,	%g5,	%o5
	srl	%l2,	0x1A,	%g7
loop_985:
	movrne	%g1,	%l6,	%l0
	smul	%o0,	0x1905,	%g6
	nop
	set	0x44, %o6
	prefetch	[%l7 + %o6],	 0x1
	tgu	%xcc,	0x1
	fbug,a	%fcc2,	loop_986
	array8	%i6,	%o1,	%i2
	sub	%l3,	%o6,	%i5
	udiv	%i1,	0x1AA3,	%g4
loop_986:
	tne	%icc,	0x2
	wr	%g0,	0x27,	%asi
	stha	%l1,	[%l7 + 0x48] %asi
	membar	#Sync
	fmovsa	%xcc,	%f14,	%f27
	movvs	%xcc,	%l5,	%o4
	te	%xcc,	0x4
	fbug,a	%fcc2,	loop_987
	fbl,a	%fcc1,	loop_988
	fbu	%fcc0,	loop_989
	te	%icc,	0x5
loop_987:
	srax	%i3,	%l4,	%i0
loop_988:
	edge32	%o2,	%o7,	%g3
loop_989:
	flush	%l7 + 0x74
	array32	%g2,	%o3,	%i4
	fandnot1s	%f8,	%f4,	%f1
	umulcc	%g5,	%o5,	%l2
	bgu,a,pt	%icc,	loop_990
	movl	%xcc,	%g7,	%g1
	fmovrslz	%i7,	%f15,	%f11
	array32	%l0,	%l6,	%g6
loop_990:
	tge	%icc,	0x1
	nop
	set	0x70, %i6
	std	%f4,	[%l7 + %i6]
	tleu	%icc,	0x1
	edge8ln	%o0,	%o1,	%i2
	ldd	[%l7 + 0x08],	%i6
	popc	%l3,	%o6
	subcc	%i5,	0x0026,	%g4
	sir	0x1FD0
	set	0x3F, %i3
	lduba	[%l7 + %i3] 0x18,	%i1
	nop
	setx	0xF9F334E3448E623E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x992B98827C29FBB2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f20,	%f2
	or	%l5,	0x18D9,	%l1
	set	0x76, %i0
	ldsha	[%l7 + %i0] 0x18,	%i3
	fmovdge	%icc,	%f3,	%f3
	tge	%icc,	0x1
	fbl,a	%fcc0,	loop_991
	xnorcc	%l4,	0x1B43,	%o4
	xnorcc	%o2,	%o7,	%i0
	smul	%g3,	%g2,	%o3
loop_991:
	xnorcc	%g5,	%i4,	%l2
	tsubcctv	%g7,	%o5,	%i7
	fpackfix	%f4,	%f13
	and	%l0,	0x1BC3,	%g1
	edge8	%l6,	%g6,	%o1
	movpos	%icc,	%i2,	%o0
	nop
	fitod	%f10,	%f6
	fdtos	%f6,	%f29
	fnot1s	%f24,	%f23
	movle	%xcc,	%l3,	%o6
	and	%i6,	0x14CE,	%g4
	bge,pt	%xcc,	loop_992
	ldd	[%l7 + 0x08],	%f2
	tn	%icc,	0x4
	tsubcctv	%i5,	0x01BE,	%l5
loop_992:
	tpos	%icc,	0x7
	movrne	%l1,	%i1,	%l4
	nop
	fitod	%f19,	%f14
	or	%i3,	%o4,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x3
	movleu	%xcc,	%i0,	%o7
	fmovspos	%icc,	%f0,	%f18
	tsubcc	%g2,	%o3,	%g5
	ldub	[%l7 + 0x16],	%i4
	fcmpgt32	%f26,	%f2,	%l2
	edge16	%g3,	%o5,	%g7
	edge32n	%l0,	%i7,	%g1
	subccc	%l6,	0x051A,	%o1
	tl	%xcc,	0x5
	subcc	%g6,	%i2,	%o0
	tvs	%xcc,	0x4
	fsrc2s	%f30,	%f24
	edge32ln	%l3,	%o6,	%g4
	bcc,pt	%xcc,	loop_993
	stw	%i5,	[%l7 + 0x74]
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%l5
loop_993:
	xorcc	%i6,	%l1,	%l4
	fbg,a	%fcc2,	loop_994
	pdist	%f8,	%f28,	%f8
	srax	%i1,	%o4,	%o2
	sth	%i3,	[%l7 + 0x38]
loop_994:
	edge16n	%o7,	%i0,	%o3
	xnor	%g5,	0x09B7,	%g2
	nop
	fitos	%f11,	%f23
	fstox	%f23,	%f28
	fxtos	%f28,	%f2
	brgz,a	%i4,	loop_995
	taddcc	%g3,	0x121B,	%o5
	te	%xcc,	0x3
	addccc	%g7,	0x1928,	%l2
loop_995:
	sllx	%l0,	%i7,	%l6
	brgz	%g1,	loop_996
	movneg	%icc,	%o1,	%g6
	popc	0x1D84,	%i2
	movrlz	%o0,	0x165,	%l3
loop_996:
	fmovrsne	%o6,	%f26,	%f29
	movrlez	%i5,	%g4,	%i6
	tcs	%xcc,	0x7
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] %asi,	%l5,	%l4
	tge	%xcc,	0x5
	movle	%xcc,	%l1,	%i1
	fpackfix	%f8,	%f15
	bg,a	%xcc,	loop_997
	bshuffle	%f8,	%f18,	%f20
	fbuge,a	%fcc3,	loop_998
	mova	%icc,	%o4,	%o2
loop_997:
	bpos,a,pn	%xcc,	loop_999
	ldsh	[%l7 + 0x58],	%i3
loop_998:
	xorcc	%i0,	%o3,	%o7
	nop
	setx	0xEE2C1A4F801D8F3C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xCDC132C9005DFDE6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f24,	%f22
loop_999:
	xnor	%g2,	0x075C,	%i4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x20] %asi,	%g5
	stx	%o5,	[%l7 + 0x10]
	xor	%g3,	%g7,	%l0
	tsubcc	%l2,	%l6,	%g1
	orncc	%i7,	%g6,	%o1
	edge8n	%i2,	%l3,	%o6
	taddcctv	%i5,	%g4,	%i6
	tvc	%icc,	0x0
	fmovspos	%xcc,	%f20,	%f12
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x53] %asi,	%o0
	brlz	%l4,	loop_1000
	brgz,a	%l5,	loop_1001
	nop
	set	0x70, %o1
	stx	%i1,	[%l7 + %o1]
	srax	%o4,	%l1,	%i3
loop_1000:
	ldx	[%l7 + 0x70],	%o2
loop_1001:
	bg,pn	%icc,	loop_1002
	fzeros	%f14
	pdist	%f2,	%f16,	%f4
	fandnot1	%f16,	%f12,	%f18
loop_1002:
	movl	%xcc,	%o3,	%o7
	umulcc	%i0,	0x1CA1,	%g2
	set	0x40, %g5
	stwa	%i4,	[%l7 + %g5] 0xe3
	membar	#Sync
	fmovs	%f5,	%f13
	movne	%xcc,	%g5,	%o5
	fbug,a	%fcc2,	loop_1003
	addcc	%g3,	%g7,	%l0
	set	0x64, %i2
	lduha	[%l7 + %i2] 0x14,	%l2
loop_1003:
	nop
	set	0x70, %i4
	swapa	[%l7 + %i4] 0x89,	%g1
	bvc	loop_1004
	tg	%xcc,	0x1
	fba,a	%fcc1,	loop_1005
	bne,pt	%xcc,	loop_1006
loop_1004:
	bg	%xcc,	loop_1007
	addccc	%l6,	%g6,	%i7
loop_1005:
	srax	%i2,	0x15,	%l3
loop_1006:
	bn,a	%icc,	loop_1008
loop_1007:
	edge16	%o6,	%o1,	%g4
	udivcc	%i5,	0x1FA2,	%i6
	addc	%o0,	%l5,	%i1
loop_1008:
	udivx	%l4,	0x1980,	%o4
	movcs	%icc,	%l1,	%o2
	alignaddr	%i3,	%o3,	%i0
	fmovsne	%icc,	%f23,	%f17
	fmovscc	%xcc,	%f4,	%f7
	sub	%g2,	0x01BB,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a,pt	%icc,	loop_1009
	nop
	fitod	%f3,	%f14
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1009:
	sub	%g5,	0x1FFF,	%o5
	tn	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x4
	alignaddr	%g3,	%o7,	%l0
	movgu	%icc,	%l2,	%g7
	tsubcctv	%g1,	%l6,	%g6
	alignaddr	%i7,	%l3,	%i2
	sdiv	%o6,	0x13CA,	%o1
	bleu,a	%xcc,	loop_1010
	subc	%i5,	%i6,	%g4
	move	%icc,	%l5,	%o0
	fpadd16s	%f28,	%f20,	%f0
loop_1010:
	fmovd	%f6,	%f14
	alignaddrl	%l4,	%o4,	%i1
	edge8l	%l1,	%o2,	%o3
	bvs,a	%icc,	loop_1011
	movrgz	%i0,	0x39F,	%g2
	tleu	%xcc,	0x3
	tvc	%icc,	0x4
loop_1011:
	edge32	%i3,	%g5,	%i4
	movne	%icc,	%g3,	%o7
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0xf0
	membar	#Sync
	wr	%g0,	0xeb,	%asi
	stba	%l0,	[%l7 + 0x74] %asi
	membar	#Sync
	movn	%icc,	%l2,	%g7
	umul	%o5,	0x1EAD,	%l6
	xnorcc	%g1,	%g6,	%l3
	movrgez	%i7,	0x144,	%i2
	move	%icc,	%o6,	%i5
	edge8ln	%i6,	%o1,	%g4
	fbule,a	%fcc2,	loop_1012
	sll	%l5,	%o0,	%o4
	addcc	%i1,	0x1455,	%l1
	tle	%xcc,	0x5
loop_1012:
	fmovrdlz	%l4,	%f14,	%f2
	smul	%o2,	%o3,	%g2
	orn	%i0,	%g5,	%i3
	edge8	%g3,	%o7,	%i4
	nop
	setx	0x5F5DDD77,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f12
	edge16l	%l0,	%l2,	%o5
	movvc	%xcc,	%l6,	%g7
	fnor	%f24,	%f6,	%f20
	set	0x24, %i7
	ldsha	[%l7 + %i7] 0x88,	%g1
	fcmpgt32	%f16,	%f30,	%l3
	fnors	%f30,	%f17,	%f22
	sethi	0x12EB,	%i7
	fbo,a	%fcc3,	loop_1013
	fands	%f12,	%f10,	%f8
	nop
	setx	loop_1014,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%i2,	%o6,	%i5
loop_1013:
	movgu	%icc,	%g6,	%o1
	sir	0x1641
loop_1014:
	smul	%g4,	0x1435,	%i6
	bpos,a,pt	%xcc,	loop_1015
	movcs	%xcc,	%o0,	%l5
	movgu	%xcc,	%o4,	%i1
	sdiv	%l4,	0x00B2,	%l1
loop_1015:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o2,	%o3,	%i0
	wr	%g0,	0x80,	%asi
	stha	%g5,	[%l7 + 0x40] %asi
	nop
	fitod	%f8,	%f24
	fdtos	%f24,	%f27
	fsrc1s	%f23,	%f13
	nop
	setx	loop_1016,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%g2,	%i3,	%g3
	xnorcc	%i4,	%o7,	%l2
	fmovrdgz	%l0,	%f6,	%f8
loop_1016:
	stb	%o5,	[%l7 + 0x51]
	fmovdleu	%icc,	%f23,	%f13
	fnands	%f24,	%f10,	%f1
	nop
	setx	0xC160BBB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x8BEBD92B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f14,	%f30
	srlx	%g7,	%l6,	%l3
	brlez	%i7,	loop_1017
	stb	%g1,	[%l7 + 0x76]
	tgu	%xcc,	0x5
	movle	%xcc,	%o6,	%i2
loop_1017:
	andncc	%g6,	%o1,	%i5
	sra	%i6,	0x0F,	%o0
	movge	%xcc,	%g4,	%l5
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
	udiv	%o4,	0x0165,	%l4
	tcs	%icc,	0x4
	bleu	loop_1018
	mulscc	%l1,	0x1365,	%o3
	orcc	%i0,	%g5,	%o2
	set	0x33, %o3
	stba	%g2,	[%l7 + %o3] 0x81
loop_1018:
	tne	%xcc,	0x1
	brgz,a	%g3,	loop_1019
	andcc	%i3,	%o7,	%l2
	fmovsn	%xcc,	%f20,	%f17
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x6C] %asi,	%i4
loop_1019:
	edge16ln	%o5,	%g7,	%l0
	movrgez	%l3,	%i7,	%g1
	edge8ln	%o6,	%l6,	%i2
	tvc	%xcc,	0x7
	taddcc	%o1,	0x09A8,	%g6
	addccc	%i5,	%i6,	%o0
	ldsh	[%l7 + 0x26],	%l5
	movle	%icc,	%g4,	%o4
	orn	%l4,	0x1C40,	%i1
	bvs,a,pn	%icc,	loop_1020
	udiv	%o3,	0x00C6,	%l1
	or	%i0,	0x00A2,	%g5
	tn	%xcc,	0x4
loop_1020:
	nop
	fitod	%f0,	%f6
	fdtoi	%f6,	%f23
	subcc	%g2,	0x0952,	%g3
	fabsd	%f28,	%f28
	movrlez	%o2,	%i3,	%o7
	orn	%l2,	0x0E2D,	%i4
	sth	%g7,	[%l7 + 0x24]
	tne	%icc,	0x4
	mulscc	%l0,	0x0BA2,	%l3
	fmovdneg	%icc,	%f1,	%f18
	srlx	%i7,	0x1C,	%g1
	edge16ln	%o6,	%l6,	%o5
	fnot2	%f20,	%f30
	udiv	%i2,	0x151C,	%o1
	movvc	%icc,	%g6,	%i5
	movleu	%icc,	%o0,	%l5
	addcc	%i6,	0x1DBF,	%o4
	fmovsa	%xcc,	%f5,	%f27
	tgu	%icc,	0x7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tvs	%icc,	0x0
	tpos	%xcc,	0x5
	te	%icc,	0x7
	ldstub	[%l7 + 0x6B],	%l4
	or	%g4,	%i1,	%o3
	srl	%i0,	%l1,	%g5
	tn	%icc,	0x7
	nop
	setx loop_1021, %l0, %l1
	jmpl %l1, %g2
	tle	%xcc,	0x0
	fors	%f18,	%f31,	%f21
	movcc	%icc,	%o2,	%i3
loop_1021:
	fbge,a	%fcc1,	loop_1022
	movvs	%icc,	%g3,	%l2
	tg	%icc,	0x7
	fmovsleu	%icc,	%f31,	%f19
loop_1022:
	nop
	setx	0x5C3349E62F49595A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xCCA69590C250725C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f14,	%f18
	add	%i4,	%g7,	%o7
	alignaddr	%l3,	%i7,	%g1
	mova	%xcc,	%l0,	%o6
	edge8ln	%l6,	%o5,	%o1
	tpos	%xcc,	0x0
	movcc	%icc,	%i2,	%i5
	movleu	%xcc,	%o0,	%l5
	tleu	%xcc,	0x6
	movg	%xcc,	%i6,	%g6
	movg	%icc,	%o4,	%l4
	stbar
	nop
	fitos	%f12,	%f15
	fstox	%f15,	%f10
	movne	%icc,	%i1,	%g4
	alignaddrl	%o3,	%i0,	%g5
	fbg,a	%fcc3,	loop_1023
	fmovrdgz	%l1,	%f28,	%f14
	set	0x34, %o2
	sta	%f6,	[%l7 + %o2] 0x10
loop_1023:
	udiv	%o2,	0x1E86,	%i3
	tleu	%xcc,	0x4
	addc	%g3,	0x109A,	%l2
	movrne	%i4,	0x13F,	%g7
	orncc	%g2,	0x13C5,	%l3
	bneg,a	%icc,	loop_1024
	movne	%xcc,	%o7,	%g1
	umul	%i7,	%l0,	%o6
	fnor	%f28,	%f16,	%f2
loop_1024:
	add	%l6,	%o5,	%o1
	udivcc	%i2,	0x0DF3,	%o0
	fmovse	%xcc,	%f9,	%f31
	movl	%icc,	%i5,	%i6
	stx	%l5,	[%l7 + 0x48]
	orncc	%o4,	%g6,	%i1
	ld	[%l7 + 0x70],	%f0
	fbue,a	%fcc1,	loop_1025
	stw	%l4,	[%l7 + 0x0C]
	sdivx	%g4,	0x03FD,	%i0
	array8	%g5,	%o3,	%o2
loop_1025:
	sir	0x16A2
	bne,pt	%xcc,	loop_1026
	movpos	%xcc,	%l1,	%i3
	edge32	%g3,	%i4,	%l2
	fornot1s	%f22,	%f30,	%f9
loop_1026:
	fmovdcc	%xcc,	%f8,	%f1
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x63] %asi,	%g2
	sra	%l3,	%o7,	%g1
	array8	%i7,	%l0,	%g7
	bne,a,pn	%icc,	loop_1027
	movrgz	%l6,	0x03A,	%o5
	edge16l	%o1,	%o6,	%o0
	fmovrslz	%i2,	%f7,	%f19
loop_1027:
	srlx	%i6,	%l5,	%i5
	fcmpne32	%f30,	%f24,	%g6
	nop
	set	0x18, %g6
	ldd	[%l7 + %g6],	%o4
	srax	%l4,	%i1,	%g4
	orcc	%i0,	%o3,	%g5
	nop
	set	0x40, %o4
	std	%f14,	[%l7 + %o4]
	xnorcc	%o2,	0x0506,	%i3
	addcc	%l1,	0x108B,	%i4
	sra	%g3,	0x10,	%g2
	movcs	%xcc,	%l2,	%o7
	fnegd	%f4,	%f4
	fmovscc	%icc,	%f15,	%f21
	smulcc	%g1,	%l3,	%i7
	movneg	%icc,	%l0,	%l6
	ldx	[%l7 + 0x78],	%o5
	fpsub16s	%f31,	%f15,	%f28
	taddcc	%o1,	0x16A0,	%o6
	movne	%icc,	%g7,	%i2
	edge8l	%i6,	%l5,	%i5
	movn	%icc,	%g6,	%o4
	tne	%xcc,	0x3
	sethi	0x0310,	%l4
	movneg	%icc,	%o0,	%g4
	edge8ln	%i1,	%i0,	%g5
	brlz	%o3,	loop_1028
	nop
	setx	0x70A565C00D01AFF5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xF74370334CBF97AC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f18,	%f30
	movvc	%icc,	%i3,	%l1
	addcc	%i4,	0x04ED,	%g3
loop_1028:
	pdist	%f6,	%f6,	%f16
	orcc	%o2,	0x0C7A,	%l2
	nop
	setx	loop_1029,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xor	%g2,	%g1,	%o7
	fmovdcs	%xcc,	%f30,	%f16
	sdivx	%i7,	0x09AB,	%l0
loop_1029:
	stx	%l3,	[%l7 + 0x28]
	srax	%o5,	0x1D,	%o1
	ldd	[%l7 + 0x40],	%f10
	tvs	%xcc,	0x1
	lduh	[%l7 + 0x4A],	%o6
	movre	%l6,	0x229,	%i2
	fmovrdlez	%g7,	%f2,	%f0
	sdivx	%i6,	0x1FB6,	%l5
	ldstub	[%l7 + 0x0D],	%i5
	fmovrdgez	%g6,	%f8,	%f2
	nop
	fitod	%f2,	%f24
	fdtox	%f24,	%f8
	set	0x24, %l3
	lduwa	[%l7 + %l3] 0x80,	%o4
	subc	%l4,	0x0615,	%g4
	faligndata	%f20,	%f18,	%f14
	movrlez	%o0,	0x33E,	%i1
	tg	%icc,	0x6
	array32	%i0,	%o3,	%g5
	bcc,a,pn	%xcc,	loop_1030
	edge16l	%i3,	%i4,	%g3
	mulscc	%o2,	0x0684,	%l1
	nop
	setx	loop_1031,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1030:
	fmovdne	%icc,	%f4,	%f4
	fsrc2	%f20,	%f30
	taddcc	%l2,	%g2,	%g1
loop_1031:
	edge32l	%o7,	%i7,	%l3
	edge8ln	%l0,	%o1,	%o6
	edge16l	%o5,	%i2,	%g7
	srlx	%i6,	%l6,	%l5
	edge8n	%i5,	%g6,	%o4
	nop
	set	0x69, %o5
	ldsb	[%l7 + %o5],	%l4
	addcc	%o0,	%i1,	%g4
	fmul8x16	%f29,	%f18,	%f16
	taddcc	%o3,	0x1ECF,	%g5
	movn	%xcc,	%i3,	%i0
	set	0x58, %l1
	prefetcha	[%l7 + %l1] 0x19,	 0x0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o2,	%i4
	sub	%l1,	%g2,	%g1
	fmovsneg	%icc,	%f24,	%f20
	tsubcctv	%l2,	0x0E78,	%o7
	tn	%xcc,	0x3
	move	%xcc,	%i7,	%l3
	brgez	%o1,	loop_1032
	fmovs	%f21,	%f29
	tpos	%xcc,	0x0
	orn	%l0,	0x0121,	%o5
loop_1032:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x61] %asi,	%o6
	array32	%g7,	%i2,	%l6
	te	%icc,	0x6
	subc	%l5,	0x0BBC,	%i5
	fnegd	%f8,	%f30
	taddcc	%i6,	0x0F73,	%g6
	tvc	%icc,	0x0
	fbul	%fcc3,	loop_1033
	array32	%o4,	%o0,	%l4
	stw	%g4,	[%l7 + 0x54]
	edge16ln	%o3,	%g5,	%i3
loop_1033:
	movvc	%xcc,	%i1,	%i0
	edge8	%g3,	%i4,	%o2
	movpos	%xcc,	%l1,	%g2
	fmovdvc	%icc,	%f14,	%f18
	orcc	%l2,	0x0B75,	%o7
	sdivcc	%i7,	0x0752,	%l3
	bne	loop_1034
	movrlz	%o1,	0x2A1,	%l0
	fbl	%fcc1,	loop_1035
	smulcc	%g1,	0x1A7F,	%o6
loop_1034:
	fmovdleu	%icc,	%f28,	%f14
	tge	%icc,	0x3
loop_1035:
	xor	%o5,	0x178B,	%g7
	tg	%icc,	0x1
	fmovrdgez	%l6,	%f26,	%f6
	movvc	%icc,	%i2,	%l5
	mulscc	%i6,	0x1C43,	%i5
	movneg	%icc,	%o4,	%g6
	and	%l4,	%o0,	%g4
	sll	%g5,	%o3,	%i1
	nop
	setx	0x33ADFBBDE058BD87,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	set	0x70, %l2
	swapa	[%l7 + %l2] 0x80,	%i0
	fnand	%f6,	%f20,	%f0
	movleu	%icc,	%i3,	%g3
	nop
	setx	0xDFBC881429DE40B1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x9642AC2B0CDC644D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f28,	%f2
	bpos,pn	%xcc,	loop_1036
	fabss	%f28,	%f8
	fsrc2	%f30,	%f28
	ta	%icc,	0x4
loop_1036:
	movcs	%icc,	%o2,	%l1
	nop
	fitos	%f1,	%f16
	fstod	%f16,	%f22
	ldub	[%l7 + 0x35],	%i4
	wr	%g0,	0x22,	%asi
	stba	%l2,	[%l7 + 0x43] %asi
	membar	#Sync
	tleu	%icc,	0x5
	add	%g2,	%o7,	%l3
	movleu	%icc,	%i7,	%l0
	sllx	%g1,	0x10,	%o6
	udivx	%o5,	0x1115,	%o1
	nop
	set	0x74, %g4
	ldsh	[%l7 + %g4],	%l6
	sdiv	%i2,	0x0547,	%g7
	tsubcctv	%i6,	0x154E,	%i5
	fba,a	%fcc3,	loop_1037
	udivcc	%l5,	0x1A7E,	%o4
	tg	%xcc,	0x7
	stw	%l4,	[%l7 + 0x58]
loop_1037:
	edge16	%g6,	%g4,	%o0
	nop
	setx	loop_1038,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	be	loop_1039
	bne,a	%xcc,	loop_1040
	udiv	%g5,	0x0E1A,	%i1
loop_1038:
	movgu	%xcc,	%i0,	%o3
loop_1039:
	stx	%i3,	[%l7 + 0x78]
loop_1040:
	fsrc1s	%f3,	%f5
	fbne	%fcc1,	loop_1041
	tsubcc	%g3,	%o2,	%i4
	st	%f0,	[%l7 + 0x74]
	fbul,a	%fcc1,	loop_1042
loop_1041:
	fpsub16	%f2,	%f28,	%f28
	fornot1s	%f0,	%f11,	%f9
	subcc	%l2,	%g2,	%o7
loop_1042:
	tl	%icc,	0x3
	subccc	%l3,	%i7,	%l0
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f24
	fxtod	%f24,	%f6
	movne	%icc,	%g1,	%o6
	fbge	%fcc0,	loop_1043
	mova	%xcc,	%l1,	%o1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x15,	%f0
loop_1043:
	xor	%l6,	0x0E95,	%i2
	movvs	%xcc,	%o5,	%i6
	fblg,a	%fcc2,	loop_1044
	brlez	%i5,	loop_1045
	fpsub16	%f6,	%f4,	%f22
	fbue,a	%fcc1,	loop_1046
loop_1044:
	alignaddr	%g7,	%o4,	%l4
loop_1045:
	edge8l	%g6,	%g4,	%l5
	movrlez	%g5,	0x1A8,	%o0
loop_1046:
	sll	%i1,	0x00,	%o3
	movleu	%icc,	%i3,	%g3
	movrlz	%i0,	%o2,	%l2
	tgu	%icc,	0x4
	stb	%i4,	[%l7 + 0x33]
	fmovrdne	%o7,	%f30,	%f0
	bvc,pt	%xcc,	loop_1047
	movle	%icc,	%l3,	%i7
	udiv	%l0,	0x08EF,	%g2
	fexpand	%f6,	%f10
loop_1047:
	fcmpgt32	%f2,	%f26,	%g1
	fbu,a	%fcc3,	loop_1048
	tsubcc	%o6,	%o1,	%l1
	udivx	%l6,	0x047D,	%o5
	nop
	setx	0x5EAE43A2D52C2BBE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x380890DCF7CB90B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f18,	%f16
loop_1048:
	mulx	%i6,	0x178F,	%i2
	nop
	fitos	%f7,	%f12
	fstoi	%f12,	%f11
	fmovde	%xcc,	%f15,	%f30
	mulscc	%g7,	0x17AF,	%i5
	addcc	%o4,	%g6,	%l4
	srlx	%l5,	0x19,	%g5
	array16	%g4,	%o0,	%i1
	orn	%o3,	0x01EB,	%g3
	orcc	%i0,	0x0327,	%i3
	fnot2s	%f28,	%f4
	set	0x58, %l0
	swapa	[%l7 + %l0] 0x19,	%o2
	fones	%f30
	nop
	setx	0x7146F99280743A34,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	movneg	%xcc,	%l2,	%o7
	ldsh	[%l7 + 0x3C],	%i4
	set	0x30, %o0
	ldswa	[%l7 + %o0] 0x18,	%l3
	fpadd16	%f26,	%f16,	%f12
	srlx	%i7,	%g2,	%g1
	mova	%icc,	%l0,	%o1
	fmovrdgz	%o6,	%f10,	%f14
	edge32	%l1,	%l6,	%i6
	tvs	%xcc,	0x4
	set	0x28, %o7
	swapa	[%l7 + %o7] 0x88,	%o5
	movl	%icc,	%i2,	%i5
	movgu	%icc,	%g7,	%g6
	addcc	%o4,	0x1053,	%l4
	array8	%l5,	%g4,	%g5
	edge32	%o0,	%o3,	%i1
	tcc	%xcc,	0x0
	tne	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x60] %asi,	%i0
	edge8n	%g3,	%i3,	%l2
	set	0x40, %i1
	stda	%f16,	[%l7 + %i1] 0x0c
	edge32ln	%o7,	%o2,	%i4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movle	%icc,	%l3,	%i7
	umulcc	%g2,	%l0,	%g1
	te	%xcc,	0x3
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fornot2	%f2,	%f18,	%f26
	nop
	setx	0x843678C1432F7BB8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xFF8192A2BEF227F7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f12,	%f12
	movle	%icc,	%o6,	%o1
	movcs	%xcc,	%l6,	%i6
	tn	%xcc,	0x0
	edge8l	%l1,	%o5,	%i2
	smulcc	%g7,	%i5,	%g6
	movg	%xcc,	%l4,	%l5
	andn	%o4,	%g4,	%g5
	swap	[%l7 + 0x50],	%o3
	stw	%i1,	[%l7 + 0x08]
	array8	%i0,	%o0,	%i3
	tsubcc	%g3,	%o7,	%o2
	tle	%xcc,	0x3
	fpadd32	%f12,	%f28,	%f6
	array8	%l2,	%i4,	%i7
	movrne	%g2,	%l3,	%g1
	stx	%o6,	[%l7 + 0x48]
	movrgz	%o1,	0x1C3,	%l0
	nop
	setx	loop_1049,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%l6,	%l1,	%o5
	subc	%i2,	0x1727,	%g7
	tle	%xcc,	0x7
loop_1049:
	tne	%xcc,	0x0
	movn	%icc,	%i5,	%i6
	ld	[%l7 + 0x6C],	%f22
	tleu	%icc,	0x6
	addcc	%g6,	%l5,	%o4
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f22
	fmovrdlz	%l4,	%f10,	%f8
	fmovrdgez	%g5,	%f2,	%f8
	fand	%f0,	%f18,	%f2
	movcs	%icc,	%g4,	%i1
	tgu	%icc,	0x5
	mova	%xcc,	%i0,	%o0
	tcs	%icc,	0x4
	st	%f20,	[%l7 + 0x6C]
	ldstub	[%l7 + 0x6E],	%i3
	mova	%xcc,	%o3,	%g3
	fmovdl	%xcc,	%f1,	%f17
	smul	%o7,	%l2,	%i4
	tsubcc	%o2,	%g2,	%l3
	edge32	%g1,	%o6,	%o1
	srlx	%l0,	%l6,	%l1
	ldx	[%l7 + 0x20],	%o5
	movrne	%i7,	%i2,	%g7
	pdist	%f24,	%f28,	%f24
	edge32ln	%i5,	%i6,	%g6
	nop
	fitos	%f5,	%f17
	fstox	%f17,	%f18
	fxtos	%f18,	%f12
	brgz	%o4,	loop_1050
	movvs	%icc,	%l5,	%l4
	fornot1s	%f31,	%f28,	%f12
	mova	%xcc,	%g4,	%i1
loop_1050:
	and	%g5,	0x09B3,	%o0
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tg	%icc,	0x0
	fbu	%fcc1,	loop_1051
	or	%i3,	0x0C28,	%i0
	subc	%g3,	0x1D14,	%o3
	nop
	setx	loop_1052,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1051:
	lduw	[%l7 + 0x48],	%l2
	sir	0x0D66
	fmovscs	%xcc,	%f17,	%f13
loop_1052:
	sdivcc	%o7,	0x059F,	%i4
	bn	loop_1053
	udivx	%g2,	0x15CF,	%o2
	set	0x60, %g7
	stwa	%l3,	[%l7 + %g7] 0xe3
	membar	#Sync
loop_1053:
	sdiv	%o6,	0x17D0,	%g1
	movg	%xcc,	%l0,	%o1
	edge32l	%l6,	%o5,	%l1
	nop
	fitos	%f5,	%f30
	fstox	%f30,	%f12
	subc	%i2,	%g7,	%i7
	std	%f16,	[%l7 + 0x48]
	lduh	[%l7 + 0x1E],	%i5
	srax	%i6,	%g6,	%l5
	alignaddr	%l4,	%g4,	%o4
	umulcc	%i1,	%g5,	%o0
	movleu	%icc,	%i0,	%g3
	fmuld8sux16	%f8,	%f23,	%f24
	edge32	%o3,	%i3,	%o7
	fmovdcc	%xcc,	%f3,	%f1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x66] %asi,	%l2
	tneg	%xcc,	0x1
	edge32	%i4,	%o2,	%g2
	fmovsgu	%xcc,	%f1,	%f13
	bg,a	%xcc,	loop_1054
	sdivx	%l3,	0x0812,	%o6
	edge16n	%l0,	%o1,	%g1
	fmovsneg	%xcc,	%f5,	%f16
loop_1054:
	alignaddr	%o5,	%l6,	%i2
	movrgez	%g7,	%i7,	%i5
	movge	%icc,	%l1,	%i6
	nop
	setx	0xC080B992,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x273683EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f18,	%f1
	subccc	%g6,	0x063F,	%l4
	xnorcc	%l5,	%o4,	%i1
	nop
	setx	0x192D576A01D03F87,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f14
	tcc	%icc,	0x4
	st	%f30,	[%l7 + 0x10]
	tg	%xcc,	0x1
	fbg,a	%fcc1,	loop_1055
	fbo,a	%fcc3,	loop_1056
	movrgz	%g5,	0x11F,	%o0
	fble	%fcc1,	loop_1057
loop_1055:
	edge16n	%i0,	%g4,	%o3
loop_1056:
	movneg	%xcc,	%g3,	%i3
	fbne,a	%fcc3,	loop_1058
loop_1057:
	addcc	%o7,	%i4,	%o2
	ld	[%l7 + 0x5C],	%f8
	fmul8x16al	%f28,	%f12,	%f18
loop_1058:
	movrlez	%g2,	0x1EB,	%l2
	movcc	%icc,	%o6,	%l3
	membar	0x1C
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%l0
	fornot2	%f12,	%f14,	%f4
	brlz,a	%g1,	loop_1059
	orncc	%o1,	0x15CF,	%o5
	fmovsl	%xcc,	%f6,	%f16
	for	%f18,	%f0,	%f2
loop_1059:
	fmovsa	%icc,	%f28,	%f18
	nop
	setx	0xEA97E203,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xB711DC64,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f12,	%f7
	andncc	%i2,	%l6,	%i7
	nop
	setx	0x971676ADB06A2022,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	bcc,a	loop_1060
	srlx	%g7,	%l1,	%i6
	subc	%i5,	0x1B6F,	%l4
	fand	%f18,	%f22,	%f2
loop_1060:
	movpos	%icc,	%g6,	%o4
	bpos,a	%xcc,	loop_1061
	fornot1s	%f4,	%f19,	%f31
	array16	%i1,	%l5,	%o0
	fpsub32s	%f18,	%f19,	%f29
loop_1061:
	sub	%i0,	0x0F97,	%g5
	movcs	%icc,	%o3,	%g3
	sdivcc	%i3,	0x1CD6,	%g4
	fmovsge	%icc,	%f21,	%f21
	bg,a	loop_1062
	movcc	%xcc,	%i4,	%o2
	and	%g2,	0x1398,	%l2
	addccc	%o7,	0x1629,	%l3
loop_1062:
	ba,a,pn	%icc,	loop_1063
	fbe	%fcc1,	loop_1064
	movgu	%icc,	%o6,	%l0
	movge	%xcc,	%g1,	%o1
loop_1063:
	edge8	%o5,	%l6,	%i7
loop_1064:
	fpadd16s	%f0,	%f14,	%f19
	tgu	%icc,	0x3
	te	%icc,	0x0
	nop
	fitos	%f10,	%f31
	fstoi	%f31,	%f16
	fmovd	%f20,	%f4
	movrlz	%i2,	%g7,	%i6
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0xf8
	membar	#Sync
	fbn,a	%fcc0,	loop_1065
	orncc	%l1,	%l4,	%g6
	movg	%icc,	%i5,	%i1
	edge32l	%o4,	%o0,	%l5
loop_1065:
	sra	%g5,	0x0E,	%i0
	movrlez	%o3,	0x169,	%i3
	sra	%g3,	0x1F,	%i4
	tgu	%icc,	0x0
	tsubcc	%g4,	0x1D67,	%g2
	tpos	%icc,	0x7
	array16	%l2,	%o2,	%o7
	fand	%f26,	%f20,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x46, %l4
	lduba	[%l7 + %l4] 0x10,	%o6
	smul	%l0,	0x05EE,	%l3
	nop
	fitos	%f6,	%f7
	fstod	%f7,	%f2
	fmul8sux16	%f22,	%f24,	%f22
	edge16ln	%g1,	%o1,	%l6
	and	%o5,	%i7,	%g7
	addc	%i2,	%i6,	%l4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x48] %asi,	%f2
	tle	%xcc,	0x3
	fxnor	%f28,	%f28,	%f10
	movre	%g6,	%l1,	%i1
	membar	0x1C
	tg	%icc,	0x7
	fmovdcc	%xcc,	%f1,	%f25
	tsubcctv	%i5,	0x03BC,	%o4
	nop
	fitod	%f25,	%f12
	umulcc	%l5,	%g5,	%o0
	subccc	%i0,	%i3,	%o3
	edge16n	%i4,	%g4,	%g3
	mova	%icc,	%g2,	%o2
	tpos	%icc,	0x6
	movpos	%xcc,	%o7,	%o6
	sdivcc	%l0,	0x156C,	%l2
	tne	%xcc,	0x3
	popc	0x164B,	%g1
	edge8ln	%o1,	%l3,	%o5
	fbge	%fcc2,	loop_1066
	fmovscc	%xcc,	%f17,	%f27
	fmul8x16al	%f19,	%f14,	%f12
	popc	%i7,	%g7
loop_1066:
	tvc	%xcc,	0x6
	fnot1	%f30,	%f28
	ldsw	[%l7 + 0x40],	%l6
	move	%xcc,	%i2,	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] %asi,	%l4,	%g6
	edge16ln	%i1,	%i5,	%l1
	movrgz	%o4,	0x08D,	%l5
	fcmpeq32	%f10,	%f18,	%o0
	sethi	0x0D56,	%i0
	fmovrse	%i3,	%f9,	%f19
	andcc	%o3,	0x055C,	%g5
	movleu	%icc,	%g4,	%i4
	bvs,a,pn	%icc,	loop_1067
	nop
	setx loop_1068, %l0, %l1
	jmpl %l1, %g3
	nop
	set	0x68, %g3
	ldd	[%l7 + %g3],	%g2
	popc	%o7,	%o6
loop_1067:
	fmovde	%icc,	%f1,	%f12
loop_1068:
	fbn	%fcc2,	loop_1069
	tgu	%icc,	0x0
	bcs,a,pt	%xcc,	loop_1070
	bcc,a,pn	%icc,	loop_1071
loop_1069:
	bvs,pt	%icc,	loop_1072
	tneg	%icc,	0x4
loop_1070:
	membar	0x51
loop_1071:
	mova	%xcc,	%o2,	%l2
loop_1072:
	brnz,a	%l0,	loop_1073
	array16	%g1,	%l3,	%o5
	lduw	[%l7 + 0x1C],	%o1
	movvs	%icc,	%g7,	%i7
loop_1073:
	nop
	set	0x16, %g2
	lduha	[%l7 + %g2] 0x10,	%i2
	bvc,a	%icc,	loop_1074
	be,a,pt	%icc,	loop_1075
	nop
	setx	0x74321E79,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x031A3A1B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f13,	%f18
	fbule,a	%fcc2,	loop_1076
loop_1074:
	subc	%i6,	%l6,	%l4
loop_1075:
	popc	0x0F81,	%i1
	addccc	%i5,	%g6,	%l1
loop_1076:
	nop
	setx	0x5FBDABE46418A764,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD0305E6C582EBA80,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f20,	%f20
	sra	%l5,	%o0,	%o4
	tvc	%xcc,	0x7
	brgez,a	%i3,	loop_1077
	fmovrdlez	%i0,	%f0,	%f0
	mulx	%g5,	0x041E,	%o3
	orcc	%g4,	%g3,	%g2
loop_1077:
	movl	%xcc,	%o7,	%i4
	tg	%xcc,	0x1
	pdist	%f28,	%f20,	%f26
	fpsub32s	%f22,	%f16,	%f2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%l2
	taddcc	%l0,	0x06D7,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f12,	%f20
	flush	%l7 + 0x5C
	fbo,a	%fcc3,	loop_1078
	sdivx	%o6,	0x143A,	%l3
	set	0x43, %l5
	ldsba	[%l7 + %l5] 0x19,	%o5
loop_1078:
	movvc	%icc,	%o1,	%i7
	bneg,pt	%icc,	loop_1079
	bvs	%xcc,	loop_1080
	and	%i2,	%g7,	%l6
	ldd	[%l7 + 0x40],	%f10
loop_1079:
	fsrc2	%f2,	%f0
loop_1080:
	fmuld8sux16	%f27,	%f30,	%f2
	ldd	[%l7 + 0x30],	%i6
	tvc	%icc,	0x7
	bvc,pn	%xcc,	loop_1081
	tpos	%icc,	0x3
	sdivcc	%i1,	0x1B6D,	%i5
	nop
	setx	0x2995E1F8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x119DAE64,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f18,	%f5
loop_1081:
	tleu	%xcc,	0x2
	movre	%g6,	%l4,	%l1
	movge	%icc,	%l5,	%o0
	taddcctv	%i3,	0x00B6,	%o4
	smul	%g5,	%i0,	%g4
	set	0x08, %o6
	lda	[%l7 + %o6] 0x81,	%f31
	tcc	%icc,	0x5
	array16	%o3,	%g2,	%o7
	tl	%xcc,	0x6
	fmovrdgz	%i4,	%f14,	%f20
	fmovsvs	%icc,	%f10,	%f22
	addcc	%g3,	0x1DBB,	%l2
	tcs	%xcc,	0x2
	sub	%l0,	%g1,	%o2
	fsrc1	%f24,	%f18
	set	0x0, %i3
	stxa	%o6,	[%g0 + %i3] 0x57
	tge	%xcc,	0x2
	nop
	set	0x44, %i0
	lduw	[%l7 + %i0],	%o5
	edge16ln	%l3,	%o1,	%i2
	subccc	%g7,	%i7,	%l6
	bg,a,pn	%xcc,	loop_1082
	sdivcc	%i6,	0x0FF8,	%i5
	bge,pn	%xcc,	loop_1083
	sth	%g6,	[%l7 + 0x6E]
loop_1082:
	fblg	%fcc1,	loop_1084
	fbule,a	%fcc3,	loop_1085
loop_1083:
	sll	%l4,	0x13,	%i1
	movpos	%icc,	%l1,	%o0
loop_1084:
	ldstub	[%l7 + 0x46],	%i3
loop_1085:
	sll	%l5,	0x12,	%g5
	fpsub16	%f26,	%f8,	%f20
	tcs	%xcc,	0x3
	xnor	%i0,	%g4,	%o4
	sdivx	%o3,	0x0568,	%o7
	fmovscc	%icc,	%f20,	%f25
	tsubcc	%g2,	%i4,	%g3
	or	%l0,	0x13CE,	%g1
	tle	%icc,	0x1
	popc	0x0B23,	%o2
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x67] %asi,	%l2
	subc	%o6,	%o5,	%o1
	movrne	%l3,	%g7,	%i7
	edge32n	%l6,	%i2,	%i5
	edge8l	%i6,	%g6,	%i1
	sdiv	%l1,	0x13E3,	%o0
	fmul8sux16	%f26,	%f28,	%f6
	fpsub16	%f14,	%f10,	%f30
	tl	%icc,	0x5
	fbn	%fcc3,	loop_1086
	bvc	%icc,	loop_1087
	fornot1s	%f7,	%f1,	%f4
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x69] %asi,	%l4
loop_1086:
	xorcc	%l5,	0x1023,	%i3
loop_1087:
	fexpand	%f2,	%f4
	xorcc	%g5,	%i0,	%o4
	movvs	%icc,	%o3,	%g4
	bge	%xcc,	loop_1088
	fmovse	%icc,	%f17,	%f6
	nop
	setx	0xE06366E5,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	smul	%g2,	%i4,	%g3
loop_1088:
	sub	%o7,	%l0,	%g1
	srl	%l2,	0x03,	%o6
	nop
	setx	loop_1089,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%xcc,	%o2,	%o1
	fbg,a	%fcc3,	loop_1090
	udiv	%o5,	0x0332,	%g7
loop_1089:
	addc	%l3,	0x0B52,	%i7
	movpos	%xcc,	%i2,	%i5
loop_1090:
	movrlez	%l6,	%i6,	%i1
	smul	%g6,	0x163B,	%o0
	stbar
	bne	%xcc,	loop_1091
	sllx	%l1,	0x09,	%l4
	sethi	0x17CB,	%i3
	movvc	%icc,	%g5,	%i0
loop_1091:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l5,	%o3,	%g4
	fnot1	%f0,	%f10
	add	%g2,	0x16BE,	%o4
	nop
	setx	0x805C2F71,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	fmovsleu	%icc,	%f20,	%f8
	subc	%g3,	0x0EEC,	%o7
	fpsub16s	%f26,	%f1,	%f6
	orncc	%i4,	%g1,	%l0
	movn	%icc,	%o6,	%o2
	tne	%icc,	0x2
	edge8l	%o1,	%o5,	%g7
	edge16n	%l2,	%l3,	%i2
	ldstub	[%l7 + 0x45],	%i5
	bneg,a,pn	%xcc,	loop_1092
	fmovsvs	%icc,	%f5,	%f31
	xorcc	%i7,	0x01CD,	%i6
	tcs	%icc,	0x1
loop_1092:
	array8	%l6,	%g6,	%o0
	edge16n	%l1,	%l4,	%i1
	tn	%xcc,	0x1
	mulscc	%i3,	%i0,	%l5
	fbo	%fcc2,	loop_1093
	fmovspos	%icc,	%f3,	%f13
	edge32ln	%o3,	%g5,	%g2
	array32	%o4,	%g3,	%o7
loop_1093:
	fbn	%fcc0,	loop_1094
	xor	%g4,	0x0773,	%i4
	fble,a	%fcc2,	loop_1095
	andcc	%g1,	0x130D,	%o6
loop_1094:
	edge8ln	%l0,	%o1,	%o5
	fnors	%f22,	%f18,	%f30
loop_1095:
	tgu	%xcc,	0x3
	fornot1s	%f21,	%f15,	%f4
	movrgz	%o2,	%g7,	%l2
	stw	%i2,	[%l7 + 0x10]
	fbe	%fcc1,	loop_1096
	movgu	%xcc,	%l3,	%i5
	alignaddr	%i6,	%l6,	%g6
	set	0x1C, %i6
	stha	%o0,	[%l7 + %i6] 0xe3
	membar	#Sync
loop_1096:
	tgu	%xcc,	0x2
	edge8	%l1,	%i7,	%i1
	orn	%l4,	0x14BE,	%i0
	sub	%i3,	0x165C,	%l5
	nop
	setx	0xF6FCE4DF5661CAF7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x2B666BE0F384B66D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f30,	%f18
	edge16	%g5,	%g2,	%o3
	fmovdle	%icc,	%f6,	%f24
	fandnot1	%f20,	%f10,	%f0
	bl,pt	%xcc,	loop_1097
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x2
	addcc	%g3,	0x1E6F,	%o7
loop_1097:
	tsubcctv	%o4,	0x0677,	%g4
	fand	%f16,	%f26,	%f2
	alignaddr	%i4,	%g1,	%l0
	fmovdcc	%xcc,	%f23,	%f29
	fnand	%f4,	%f26,	%f10
	edge16n	%o1,	%o6,	%o2
	ldsh	[%l7 + 0x54],	%g7
	fands	%f21,	%f18,	%f17
	sth	%o5,	[%l7 + 0x28]
	edge16l	%l2,	%l3,	%i2
	tg	%icc,	0x6
	fmul8sux16	%f12,	%f20,	%f4
	movcc	%icc,	%i5,	%i6
	fones	%f19
	fsrc1	%f20,	%f2
	udivx	%g6,	0x0443,	%o0
	fmovdle	%xcc,	%f10,	%f24
	te	%icc,	0x7
	and	%l6,	%i7,	%l1
	nop
	set	0x78, %g5
	stx	%i1,	[%l7 + %g5]
	fnot2	%f28,	%f10
	nop
	set	0x28, %i2
	ldx	[%l7 + %i2],	%i0
	nop
	setx	0x6DBAA19E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x96ED4C42,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f12,	%f1
	tle	%icc,	0x7
	bvc,a	%xcc,	loop_1098
	edge32n	%l4,	%l5,	%g5
	xnorcc	%g2,	0x0528,	%o3
	array32	%i3,	%o7,	%o4
loop_1098:
	movpos	%xcc,	%g4,	%g3
	andn	%i4,	%l0,	%o1
	sub	%o6,	0x143B,	%g1
	fmovdgu	%icc,	%f25,	%f30
	movge	%icc,	%g7,	%o2
	subc	%l2,	%l3,	%i2
	movrgz	%o5,	%i6,	%g6
	sdiv	%i5,	0x0001,	%o0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x34] %asi,	%f24
	stw	%l6,	[%l7 + 0x40]
	xnorcc	%l1,	0x0485,	%i7
	movvs	%icc,	%i0,	%i1
	movge	%xcc,	%l5,	%l4
	movrgz	%g2,	%g5,	%o3
	fmovrde	%o7,	%f22,	%f8
	movpos	%icc,	%i3,	%g4
	fpsub32s	%f29,	%f27,	%f9
	fmovscc	%xcc,	%f21,	%f18
	smulcc	%g3,	%i4,	%l0
	fpadd16	%f20,	%f2,	%f24
	andn	%o1,	0x12EE,	%o6
	te	%xcc,	0x7
	swap	[%l7 + 0x2C],	%g1
	edge32	%g7,	%o2,	%l2
	subc	%o4,	0x026B,	%l3
	mulx	%i2,	%o5,	%g6
	popc	%i6,	%o0
	fandnot2	%f6,	%f16,	%f12
	fbue	%fcc3,	loop_1099
	movcs	%xcc,	%i5,	%l1
	movrgez	%i7,	0x34C,	%i0
	fbn	%fcc3,	loop_1100
loop_1099:
	fpsub16	%f4,	%f6,	%f30
	edge8l	%i1,	%l6,	%l5
	tg	%xcc,	0x6
loop_1100:
	movle	%xcc,	%l4,	%g5
	fandnot1	%f8,	%f28,	%f24
	edge32n	%o3,	%g2,	%i3
	movre	%o7,	0x067,	%g4
	fcmpeq16	%f30,	%f20,	%i4
	or	%l0,	0x0056,	%g3
	and	%o1,	%o6,	%g1
	tsubcctv	%g7,	%o2,	%l2
	movpos	%xcc,	%l3,	%i2
	movvc	%icc,	%o5,	%g6
	edge32ln	%o4,	%o0,	%i5
	addcc	%i6,	%l1,	%i7
	fmuld8sux16	%f8,	%f27,	%f20
	edge8l	%i1,	%l6,	%l5
	srax	%l4,	%i0,	%o3
	fmovrdne	%g5,	%f14,	%f20
	ldd	[%l7 + 0x68],	%f18
	fmovsne	%xcc,	%f24,	%f4
	tgu	%xcc,	0x3
	movcc	%xcc,	%i3,	%o7
	fcmple32	%f26,	%f14,	%g2
	nop
	setx	loop_1101,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x0733,	%g4
	umulcc	%i4,	%l0,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1101:
	edge16ln	%o1,	%g1,	%g7
	brgez	%o6,	loop_1102
	tcs	%xcc,	0x2
	brz	%o2,	loop_1103
	fmovsle	%icc,	%f31,	%f6
loop_1102:
	tcs	%icc,	0x1
	fmovdg	%xcc,	%f22,	%f6
loop_1103:
	bpos,a,pn	%icc,	loop_1104
	fmovrde	%l2,	%f14,	%f2
	stw	%l3,	[%l7 + 0x78]
	tgu	%icc,	0x7
loop_1104:
	fnot2	%f18,	%f16
	fmovdcs	%xcc,	%f25,	%f16
	for	%f10,	%f24,	%f30
	movcc	%xcc,	%o5,	%g6
	movgu	%icc,	%i2,	%o0
	fbn,a	%fcc2,	loop_1105
	bge,a	loop_1106
	movrne	%i5,	0x338,	%i6
	mova	%icc,	%o4,	%i7
loop_1105:
	alignaddr	%i1,	%l1,	%l6
loop_1106:
	fcmpgt32	%f4,	%f18,	%l4
	movpos	%icc,	%i0,	%l5
	movl	%xcc,	%o3,	%g5
	movvc	%icc,	%o7,	%i3
	fcmpne16	%f0,	%f14,	%g4
	ta	%icc,	0x1
	movpos	%xcc,	%g2,	%l0
	edge32	%g3,	%o1,	%g1
	addc	%i4,	%g7,	%o6
	movpos	%xcc,	%o2,	%l2
	tsubcc	%l3,	0x111D,	%o5
	sdiv	%g6,	0x1B2F,	%i2
	tne	%xcc,	0x0
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0xf9
	membar	#Sync
	nop
	setx	0xA50A0FD91F0C3D49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x772E726EE1F57D11,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f0,	%f18
	udivcc	%i5,	0x153B,	%i6
	set	0x70, %l6
	ldda	[%l7 + %l6] 0xea,	%o0
	udiv	%o4,	0x02DA,	%i7
	tgu	%icc,	0x1
	fnor	%f24,	%f20,	%f12
	fbu	%fcc2,	loop_1107
	std	%f6,	[%l7 + 0x78]
	for	%f26,	%f0,	%f28
	udivx	%i1,	0x0F7D,	%l1
loop_1107:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x6
	sir	0x068A
	movrgez	%l6,	%l4,	%l5
	movl	%icc,	%o3,	%i0
	movpos	%xcc,	%o7,	%i3
	alignaddr	%g4,	%g5,	%l0
	tle	%icc,	0x0
	tne	%icc,	0x4
	sethi	0x0205,	%g3
	fcmpgt16	%f22,	%f12,	%o1
	fbue	%fcc0,	loop_1108
	nop
	setx	0xF744B8BF004FC23A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movle	%xcc,	%g1,	%i4
	array16	%g7,	%g2,	%o2
loop_1108:
	nop
	setx	0x428931F0A8485711,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xA8D61574A7C50339,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f2,	%f26
	movg	%xcc,	%o6,	%l2
	fbul,a	%fcc2,	loop_1109
	addc	%o5,	%l3,	%i2
	movg	%xcc,	%g6,	%i6
	fcmpgt32	%f4,	%f8,	%i5
loop_1109:
	nop
	fitod	%f18,	%f8
	nop
	setx	0x6C07DD49C0766C29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%o0
	movrgez	%i7,	0x2E1,	%i1
	alignaddrl	%o4,	%l6,	%l1
	nop
	fitod	%f10,	%f30
	fdtox	%f30,	%f22
	udivcc	%l4,	0x1DC3,	%o3
	addccc	%l5,	0x1C57,	%i0
	stb	%i3,	[%l7 + 0x63]
	movre	%g4,	0x264,	%o7
	mulx	%l0,	0x08D7,	%g5
	fpadd32s	%f20,	%f5,	%f7
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	udivcc	%o1,	0x0684,	%g1
	edge8	%g3,	%i4,	%g2
	sllx	%o2,	%g7,	%l2
	array32	%o6,	%o5,	%l3
	edge16l	%g6,	%i6,	%i2
	sra	%o0,	%i7,	%i5
	nop
	fitos	%f13,	%f6
	fstod	%f6,	%f28
	bpos	%xcc,	loop_1110
	tsubcctv	%i1,	0x10B5,	%o4
	srl	%l1,	0x19,	%l6
	movre	%o3,	%l4,	%l5
loop_1110:
	movvs	%icc,	%i3,	%g4
	movgu	%xcc,	%i0,	%l0
	popc	0x16CD,	%o7
	tl	%xcc,	0x0
	tneg	%xcc,	0x4
	fmovdle	%icc,	%f4,	%f11
	fzeros	%f24
	fmovrsgez	%g5,	%f26,	%f10
	ba,pn	%xcc,	loop_1111
	movcc	%xcc,	%o1,	%g3
	srax	%i4,	%g1,	%o2
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
loop_1111:
	movrlz	%l2,	0x196,	%o6
	set	0x46, %i7
	stha	%o5,	[%l7 + %i7] 0x2a
	membar	#Sync
	sdivcc	%l3,	0x1083,	%g7
	sethi	0x1C90,	%g6
	set	0x6C, %i4
	stwa	%i6,	[%l7 + %i4] 0x15
	call	loop_1112
	xnorcc	%i2,	%o0,	%i5
	fabsd	%f6,	%f24
	srax	%i7,	%o4,	%i1
loop_1112:
	sdiv	%l6,	0x007D,	%o3
	edge8ln	%l4,	%l5,	%i3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x80,	%l1,	%g4
	xorcc	%l0,	0x102C,	%o7
	edge16ln	%i0,	%g5,	%g3
	edge16ln	%o1,	%g1,	%i4
	fmovsle	%xcc,	%f25,	%f28
	taddcctv	%o2,	0x09B8,	%g2
	fxnors	%f0,	%f6,	%f20
	movge	%icc,	%o6,	%l2
	sdivcc	%o5,	0x15BD,	%l3
	array16	%g7,	%g6,	%i6
	tcc	%icc,	0x3
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x24] %asi,	%o0
	srl	%i5,	0x09,	%i7
	nop
	setx	0xE04A5514,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	nop
	setx	0x97E0D008,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xE6E0A942,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f23,	%f13
	nop
	setx	0x7907E23E9AE55C43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x7D81AACFA12D42AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f30,	%f26
	edge8l	%o4,	%i2,	%i1
	ta	%xcc,	0x5
	ldx	[%l7 + 0x60],	%o3
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
	st	%f21,	[%l7 + 0x38]
	xor	%l4,	%l5,	%i3
	fba,a	%fcc2,	loop_1114
loop_1113:
	alignaddr	%l1,	%l6,	%l0
	ba,a	%xcc,	loop_1115
	addcc	%o7,	%g4,	%g5
loop_1114:
	fmovdcs	%icc,	%f12,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1115:
	orcc	%i0,	%o1,	%g3
	bcs,a	%icc,	loop_1116
	srlx	%i4,	0x18,	%g1
	alignaddrl	%o2,	%o6,	%l2
	lduw	[%l7 + 0x08],	%g2
loop_1116:
	srl	%o5,	%l3,	%g7
	movvs	%xcc,	%g6,	%o0
	andcc	%i6,	%i7,	%i5
	fmovsle	%xcc,	%f12,	%f17
	movvc	%icc,	%o4,	%i1
	udivx	%i2,	0x1A01,	%o3
	edge32n	%l4,	%i3,	%l5
	ldsw	[%l7 + 0x58],	%l1
	ta	%icc,	0x4
	edge8l	%l6,	%l0,	%o7
	edge16ln	%g4,	%g5,	%o1
	nop
	setx	0xBEC0914E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f22
	xnor	%g3,	%i4,	%g1
	fmovsneg	%xcc,	%f24,	%f13
	edge16ln	%o2,	%i0,	%o6
	nop
	fitos	%f0,	%f1
	fstoi	%f1,	%f26
	array16	%g2,	%o5,	%l3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x54] %asi,	%l2
	srlx	%g7,	0x08,	%g6
	fbg	%fcc2,	loop_1117
	fbu,a	%fcc2,	loop_1118
	ta	%xcc,	0x3
	and	%i6,	%o0,	%i7
loop_1117:
	fmovdge	%icc,	%f10,	%f17
loop_1118:
	nop
	setx loop_1119, %l0, %l1
	jmpl %l1, %o4
	alignaddr	%i1,	%i2,	%o3
	fmovrsgz	%l4,	%f29,	%f2
	movcs	%icc,	%i3,	%l5
loop_1119:
	ldd	[%l7 + 0x30],	%f24
	set	0x4C, %o2
	stwa	%l1,	[%l7 + %o2] 0x27
	membar	#Sync
	stw	%i5,	[%l7 + 0x0C]
	tleu	%icc,	0x6
	umulcc	%l0,	0x0C65,	%l6
	fbue,a	%fcc1,	loop_1120
	orcc	%o7,	0x12C5,	%g4
	tcs	%icc,	0x3
	fmovsneg	%xcc,	%f21,	%f11
loop_1120:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x0A] %asi,	%g5
	movg	%xcc,	%o1,	%i4
	movl	%xcc,	%g1,	%o2
	andncc	%i0,	%o6,	%g3
	tcc	%icc,	0x1
	edge32n	%o5,	%l3,	%l2
	mulx	%g2,	0x1C7D,	%g7
	tg	%xcc,	0x4
	movvc	%icc,	%g6,	%i6
	movn	%icc,	%i7,	%o0
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%o4
	mova	%icc,	%i2,	%i1
	fmovsne	%icc,	%f17,	%f1
	fsrc2s	%f25,	%f31
	fmovde	%xcc,	%f17,	%f25
	orcc	%o3,	%i3,	%l4
	bg	%xcc,	loop_1121
	membar	0x38
	alignaddrl	%l1,	%i5,	%l0
	fmovsgu	%xcc,	%f4,	%f2
loop_1121:
	movleu	%xcc,	%l6,	%l5
	ba	%xcc,	loop_1122
	brlez,a	%g4,	loop_1123
	movrgez	%g5,	0x275,	%o1
	subccc	%i4,	0x165D,	%o7
loop_1122:
	edge32l	%g1,	%o2,	%o6
loop_1123:
	andcc	%i0,	%o5,	%g3
	bleu,a,pn	%icc,	loop_1124
	movge	%xcc,	%l3,	%g2
	orn	%l2,	%g6,	%i6
	sdivx	%i7,	0x0AEE,	%g7
loop_1124:
	nop
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	0x67
	fbe,a	%fcc0,	loop_1125
	movrgez	%o4,	%o0,	%i1
	fmovsvs	%icc,	%f30,	%f29
	fnot1	%f14,	%f26
loop_1125:
	nop
	wr	%g0,	0x2f,	%asi
	stwa	%i2,	[%l7 + 0x34] %asi
	membar	#Sync
	bge,a	loop_1126
	movg	%xcc,	%i3,	%o3
	std	%f4,	[%l7 + 0x78]
	stw	%l1,	[%l7 + 0x20]
loop_1126:
	fbl,a	%fcc0,	loop_1127
	array16	%l4,	%i5,	%l0
	fmul8x16al	%f28,	%f10,	%f4
	andn	%l5,	0x0A9D,	%g4
loop_1127:
	fmovscs	%icc,	%f14,	%f11
	tneg	%xcc,	0x2
	movcs	%icc,	%g5,	%l6
	fmovdg	%xcc,	%f27,	%f5
	mulx	%i4,	%o1,	%o7
	sir	0x1D51
	movl	%xcc,	%g1,	%o6
	tsubcctv	%o2,	%i0,	%g3
	fmovspos	%xcc,	%f9,	%f20
	ldsh	[%l7 + 0x26],	%l3
	fmovrsgez	%g2,	%f7,	%f30
	orcc	%o5,	%g6,	%l2
	tne	%xcc,	0x6
	tcs	%icc,	0x4
	tle	%icc,	0x7
	addccc	%i6,	%i7,	%g7
	fbul	%fcc1,	loop_1128
	edge32l	%o0,	%i1,	%i2
	edge8l	%i3,	%o4,	%o3
	orcc	%l1,	%l4,	%l0
loop_1128:
	tn	%icc,	0x6
	bg	loop_1129
	movge	%icc,	%i5,	%l5
	tsubcc	%g4,	%g5,	%i4
	fbg	%fcc3,	loop_1130
loop_1129:
	edge8	%l6,	%o1,	%g1
	ldsw	[%l7 + 0x48],	%o6
	fornot2	%f12,	%f0,	%f4
loop_1130:
	tvc	%icc,	0x3
	taddcc	%o2,	%i0,	%g3
	andncc	%l3,	%o7,	%g2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x28] %asi,	%o5
	srlx	%l2,	%i6,	%g6
	tneg	%xcc,	0x5
	sethi	0x13ED,	%i7
	andncc	%o0,	%g7,	%i1
	movleu	%icc,	%i3,	%i2
	fbul	%fcc0,	loop_1131
	subcc	%o3,	0x0B02,	%o4
	nop
	setx	loop_1132,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srax	%l4,	0x00,	%l0
loop_1131:
	srl	%i5,	0x15,	%l1
	tn	%xcc,	0x6
loop_1132:
	udivcc	%g4,	0x1EA0,	%g5
	edge32	%l5,	%l6,	%i4
	set	0x42, %g6
	ldsba	[%l7 + %g6] 0x89,	%g1
	taddcctv	%o1,	0x1545,	%o2
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o6,	%i0
	subccc	%g3,	%o7,	%l3
	orncc	%o5,	%g2,	%i6
	movcs	%icc,	%l2,	%i7
	array8	%g6,	%g7,	%o0
	movrgz	%i3,	0x0FD,	%i1
	array8	%o3,	%i2,	%l4
	fbue,a	%fcc3,	loop_1133
	fmovsg	%xcc,	%f18,	%f28
	set	0x6C, %o4
	stba	%l0,	[%l7 + %o4] 0x88
loop_1133:
	and	%o4,	0x0ADC,	%i5
	smul	%l1,	0x1077,	%g4
	movre	%g5,	%l6,	%l5
	movl	%xcc,	%g1,	%i4
	edge16l	%o1,	%o2,	%o6
	movrlez	%i0,	0x37E,	%g3
	bg,a	loop_1134
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f18,	[%l7 + 0x38]
	movneg	%xcc,	%l3,	%o7
loop_1134:
	movn	%xcc,	%g2,	%o5
	fbe	%fcc2,	loop_1135
	mulx	%i6,	%i7,	%l2
	prefetch	[%l7 + 0x0C],	 0x0
	fmovs	%f1,	%f9
loop_1135:
	movrgez	%g7,	0x05B,	%o0
	array16	%i3,	%g6,	%o3
	alignaddr	%i1,	%l4,	%i2
	add	%l7,	0x74,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%o4
	tpos	%xcc,	0x5
	movpos	%xcc,	%l1,	%i5
	edge32l	%g5,	%g4,	%l6
	subcc	%g1,	0x025F,	%l5
	udivcc	%i4,	0x1CFA,	%o2
	fzero	%f16
	fandnot1	%f18,	%f30,	%f4
	ldd	[%l7 + 0x38],	%o6
	fmuld8ulx16	%f0,	%f25,	%f30
	bvc	%icc,	loop_1136
	movrgez	%i0,	0x0E9,	%o1
	movle	%icc,	%l3,	%o7
	xorcc	%g2,	%o5,	%i6
loop_1136:
	udiv	%i7,	0x179B,	%l2
	stx	%g7,	[%l7 + 0x10]
	edge8n	%g3,	%o0,	%i3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x64] %asi,	%g6
	tn	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x44] %asi,	%f7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x0c,	%o3,	%i1
	xorcc	%l4,	0x188D,	%l0
	bcc,a	%xcc,	loop_1137
	tpos	%xcc,	0x1
	smulcc	%o4,	%l1,	%i2
	edge8	%g5,	%g4,	%i5
loop_1137:
	edge16	%g1,	%l5,	%i4
	tneg	%icc,	0x4
	movleu	%icc,	%o2,	%o6
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f8
	addccc	%i0,	%o1,	%l6
	addcc	%o7,	0x176D,	%g2
	andcc	%o5,	%l3,	%i6
	tvs	%icc,	0x3
	subc	%i7,	%l2,	%g7
	fmovrde	%g3,	%f4,	%f12
	movcs	%icc,	%o0,	%i3
	sdiv	%o3,	0x0A3B,	%g6
	orncc	%i1,	%l0,	%o4
	xor	%l1,	0x1712,	%i2
	sir	0x0255
	st	%f19,	[%l7 + 0x08]
	fbu	%fcc2,	loop_1138
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f2,	%f23,	%f28
	fmul8x16au	%f12,	%f22,	%f14
loop_1138:
	fmovdvs	%xcc,	%f30,	%f30
	movl	%icc,	%g5,	%l4
	mulscc	%i5,	%g4,	%g1
	xor	%l5,	%o2,	%i4
	movl	%xcc,	%o6,	%i0
	taddcctv	%l6,	%o1,	%g2
	mulx	%o7,	0x1B32,	%o5
	array16	%i6,	%l3,	%i7
	movvs	%icc,	%g7,	%l2
	fble,a	%fcc1,	loop_1139
	smul	%o0,	%i3,	%g3
	movrgz	%o3,	0x07C,	%i1
	fnors	%f6,	%f23,	%f0
loop_1139:
	bn	%icc,	loop_1140
	movle	%icc,	%l0,	%o4
	movgu	%xcc,	%l1,	%g6
	movl	%icc,	%i2,	%l4
loop_1140:
	smulcc	%i5,	0x006C,	%g4
	swap	[%l7 + 0x18],	%g5
	fmovdle	%icc,	%f29,	%f4
	tsubcctv	%l5,	%g1,	%o2
	fmuld8ulx16	%f25,	%f12,	%f30
	fmovsle	%icc,	%f2,	%f18
	fcmpeq16	%f8,	%f0,	%i4
	edge32n	%o6,	%i0,	%o1
	tcc	%xcc,	0x4
	alignaddrl	%g2,	%l6,	%o7
	alignaddr	%i6,	%o5,	%i7
	fmovscc	%xcc,	%f5,	%f2
	add	%g7,	%l3,	%o0
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%l2
	edge16	%g3,	%i3,	%i1
	movleu	%xcc,	%l0,	%o4
	addc	%l1,	%g6,	%i2
	srax	%l4,	%o3,	%i5
	fcmpeq32	%f10,	%f0,	%g4
	sra	%l5,	0x0F,	%g5
	wr	%g0,	0x88,	%asi
	sta	%f5,	[%l7 + 0x5C] %asi
	fsrc2s	%f29,	%f18
	alignaddr	%g1,	%o2,	%o6
	smul	%i0,	0x1B3D,	%i4
	brnz,a	%g2,	loop_1141
	srl	%o1,	%l6,	%o7
	set	0x08, %o5
	stba	%i6,	[%l7 + %o5] 0x2a
	membar	#Sync
loop_1141:
	ldd	[%l7 + 0x20],	%f26
	taddcctv	%o5,	%i7,	%g7
	tneg	%xcc,	0x3
	fmul8x16al	%f16,	%f31,	%f22
	addccc	%l3,	0x1E8A,	%o0
	udiv	%l2,	0x10C2,	%g3
	orn	%i3,	%l0,	%o4
	movne	%icc,	%l1,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x2
	wr	%g0,	0x81,	%asi
	sta	%f20,	[%l7 + 0x08] %asi
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%i1
	fbug	%fcc1,	loop_1142
	andcc	%i2,	%o3,	%l4
	fmovrsne	%i5,	%f8,	%f17
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f16
	fxtod	%f16,	%f12
loop_1142:
	alignaddrl	%l5,	%g4,	%g5
	fmovrdne	%o2,	%f12,	%f20
	tvs	%icc,	0x2
	sdiv	%o6,	0x0B00,	%i0
	movgu	%icc,	%i4,	%g2
	movre	%g1,	0x12C,	%l6
	udivcc	%o7,	0x194D,	%o1
	xorcc	%i6,	%i7,	%o5
	umul	%g7,	%o0,	%l2
	edge16	%g3,	%i3,	%l0
	fblg,a	%fcc0,	loop_1143
	fbul,a	%fcc3,	loop_1144
	smulcc	%l3,	%o4,	%l1
	edge16	%i1,	%i2,	%o3
loop_1143:
	or	%l4,	%i5,	%l5
loop_1144:
	tn	%icc,	0x1
	fmovsn	%xcc,	%f27,	%f11
	mova	%xcc,	%g6,	%g5
	st	%f19,	[%l7 + 0x38]
	lduw	[%l7 + 0x60],	%o2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x74] %asi,	%f12
	xnorcc	%o6,	0x1385,	%i0
	orn	%g4,	%g2,	%i4
	mulscc	%l6,	0x09DA,	%g1
	xnor	%o7,	%o1,	%i6
	nop
	setx	0xD397A088,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xC8BD7589,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f6,	%f6
	fbue	%fcc1,	loop_1145
	tcc	%xcc,	0x2
	movpos	%xcc,	%i7,	%o5
	subccc	%o0,	%g7,	%g3
loop_1145:
	edge32l	%l2,	%i3,	%l0
	andncc	%l3,	%l1,	%i1
	brlz,a	%o4,	loop_1146
	movgu	%icc,	%o3,	%i2
	movpos	%xcc,	%i5,	%l5
	fmovdne	%icc,	%f9,	%f28
loop_1146:
	xor	%g6,	%g5,	%o2
	sir	0x1E26
	or	%l4,	%o6,	%g4
	andn	%g2,	%i4,	%l6
	subccc	%i0,	0x16C9,	%o7
	subc	%g1,	%i6,	%i7
	taddcc	%o1,	%o0,	%o5
	tsubcctv	%g7,	%l2,	%i3
	subc	%g3,	%l3,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l0,	%o4,	%o3
	alignaddr	%i2,	%i5,	%l5
	fbuge	%fcc1,	loop_1147
	smul	%g6,	%g5,	%o2
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x17
	membar	#Sync
loop_1147:
	ld	[%l7 + 0x60],	%f5
	fpackfix	%f6,	%f4
	set	0x50, %l2
	lda	[%l7 + %l2] 0x88,	%f22
	fnegd	%f2,	%f8
	fbule,a	%fcc1,	loop_1148
	movne	%xcc,	%i1,	%l4
	tge	%icc,	0x4
	movrne	%o6,	%g2,	%g4
loop_1148:
	fmovsg	%xcc,	%f18,	%f7
	fnot2	%f26,	%f20
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	xor	%i4,	%l6,	%i0
	xnor	%o7,	%i6,	%g1
	fpadd32	%f16,	%f18,	%f18
	add	%o1,	%o0,	%o5
	ld	[%l7 + 0x68],	%f15
	edge8n	%i7,	%l2,	%g7
	orn	%g3,	0x1955,	%l3
	alignaddr	%i3,	%l0,	%o4
	udiv	%o3,	0x19F2,	%l1
	tsubcc	%i5,	0x093C,	%l5
	ldx	[%l7 + 0x10],	%g6
	fbug	%fcc2,	loop_1149
	udivcc	%g5,	0x19BC,	%o2
	fbule,a	%fcc2,	loop_1150
	fbg	%fcc1,	loop_1151
loop_1149:
	edge8l	%i1,	%l4,	%o6
	fpadd16	%f12,	%f14,	%f28
loop_1150:
	taddcctv	%g2,	0x0794,	%g4
loop_1151:
	stx	%i4,	[%l7 + 0x60]
	srax	%l6,	0x0A,	%i2
	movge	%xcc,	%o7,	%i6
	subc	%i0,	%g1,	%o0
	sethi	0x0980,	%o5
	edge16n	%i7,	%o1,	%l2
	movpos	%icc,	%g3,	%g7
	nop
	setx loop_1152, %l0, %l1
	jmpl %l1, %i3
	subc	%l3,	%l0,	%o3
	set	0x08, %l3
	ldxa	[%l7 + %l3] 0x19,	%l1
loop_1152:
	tg	%icc,	0x2
	fmovsl	%icc,	%f3,	%f7
	sdivcc	%i5,	0x05E2,	%o4
	be,a	%icc,	loop_1153
	alignaddrl	%l5,	%g6,	%g5
	fnors	%f14,	%f9,	%f0
	fmovrdgez	%i1,	%f10,	%f10
loop_1153:
	mulx	%o2,	%o6,	%g2
	orn	%g4,	0x0E61,	%l4
	nop
	fitos	%f12,	%f13
	fstox	%f13,	%f2
	movvc	%xcc,	%l6,	%i2
	umulcc	%o7,	%i4,	%i0
	udiv	%g1,	0x0A2A,	%o0
	addccc	%i6,	0x08BF,	%o5
	edge16n	%i7,	%o1,	%g3
	fmul8ulx16	%f14,	%f2,	%f26
	fpadd32s	%f0,	%f28,	%f11
	tsubcc	%g7,	0x12AC,	%l2
	fornot2s	%f21,	%f1,	%f13
	ble,a,pn	%icc,	loop_1154
	srl	%l3,	0x15,	%i3
	bpos,a,pn	%xcc,	loop_1155
	alignaddrl	%l0,	%o3,	%i5
loop_1154:
	tvs	%xcc,	0x5
	tneg	%xcc,	0x5
loop_1155:
	fmovspos	%xcc,	%f17,	%f3
	tvc	%xcc,	0x1
	tg	%xcc,	0x0
	fpadd32s	%f12,	%f3,	%f14
	add	%o4,	0x1691,	%l5
	fpack16	%f16,	%f0
	set	0x6E, %g4
	ldstuba	[%l7 + %g4] 0x10,	%g6
	subcc	%l1,	%i1,	%g5
	fnegs	%f13,	%f13
	fmovsleu	%icc,	%f29,	%f11
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x27] %asi,	%o2
	nop
	set	0x0A, %l0
	lduh	[%l7 + %l0],	%o6
	mova	%xcc,	%g4,	%l4
	bcc,a,pt	%icc,	loop_1156
	fpack32	%f2,	%f8,	%f10
	fpsub16s	%f4,	%f1,	%f15
	set	0x4C, %o0
	stwa	%l6,	[%l7 + %o0] 0x89
loop_1156:
	te	%xcc,	0x6
	fmovsle	%xcc,	%f4,	%f10
	edge32l	%g2,	%i2,	%o7
	fnot2	%f18,	%f14
	nop
	setx	loop_1157,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd32	%f14,	%f18,	%f6
	fmovda	%xcc,	%f31,	%f25
	sdivx	%i0,	0x0776,	%i4
loop_1157:
	fmovrsgz	%o0,	%f3,	%f6
	movg	%xcc,	%i6,	%g1
	fmovdcc	%xcc,	%f12,	%f12
	srax	%o5,	%i7,	%g3
	swap	[%l7 + 0x14],	%g7
	movrlz	%l2,	0x17F,	%o1
	alignaddrl	%i3,	%l3,	%l0
	bneg,pt	%xcc,	loop_1158
	ldsb	[%l7 + 0x5C],	%i5
	nop
	setx loop_1159, %l0, %l1
	jmpl %l1, %o4
	fnegd	%f12,	%f2
loop_1158:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o3
loop_1159:
	edge32l	%g6,	%l1,	%l5
	fblg	%fcc1,	loop_1160
	prefetch	[%l7 + 0x20],	 0x2
	mulx	%g5,	%i1,	%o6
	ldub	[%l7 + 0x0D],	%g4
loop_1160:
	xnorcc	%l4,	%o2,	%g2
	sethi	0x068E,	%i2
	nop
	setx	0xF0AB6AE7686EBD2B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x02DB248E311CE713,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f8,	%f24
	sethi	0x091B,	%l6
	fpadd16	%f12,	%f20,	%f8
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x15,	%f16
	fblg,a	%fcc3,	loop_1161
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f0,	%f19
	stw	%o7,	[%l7 + 0x08]
loop_1161:
	bgu	%icc,	loop_1162
	be,a,pt	%icc,	loop_1163
	fbn,a	%fcc3,	loop_1164
	ldx	[%l7 + 0x10],	%i4
loop_1162:
	smul	%o0,	0x1DCF,	%i0
loop_1163:
	brlz,a	%i6,	loop_1165
loop_1164:
	fmul8x16au	%f7,	%f28,	%f4
	set	0x20, %i5
	ldswa	[%l7 + %i5] 0x04,	%o5
loop_1165:
	nop
	wr	%g0,	0x23,	%asi
	stba	%i7,	[%l7 + 0x5B] %asi
	membar	#Sync
	tvc	%xcc,	0x7
	sir	0x136E
	tpos	%xcc,	0x0
	tgu	%xcc,	0x6
	edge32n	%g3,	%g7,	%l2
	fmovsleu	%icc,	%f25,	%f29
	prefetch	[%l7 + 0x74],	 0x3
	fmovsa	%icc,	%f11,	%f10
	taddcc	%o1,	0x0D62,	%g1
	srl	%l3,	%i3,	%i5
	stx	%o4,	[%l7 + 0x58]
	fmovrdgez	%l0,	%f28,	%f24
	brlz	%g6,	loop_1166
	fnegd	%f10,	%f22
	xnorcc	%o3,	%l1,	%l5
	array16	%i1,	%o6,	%g5
loop_1166:
	xnor	%g4,	0x1FB0,	%o2
	set	0x20, %i1
	ldda	[%l7 + %i1] 0x26,	%l4
	lduw	[%l7 + 0x18],	%i2
	edge32l	%g2,	%o7,	%i4
	udiv	%l6,	0x10B0,	%i0
	movvc	%xcc,	%i6,	%o0
	fmovsne	%icc,	%f26,	%f31
	orcc	%i7,	%o5,	%g7
	subc	%l2,	0x196B,	%g3
	movge	%xcc,	%g1,	%l3
	sub	%o1,	0x1560,	%i3
	addcc	%i5,	%o4,	%g6
	fba	%fcc3,	loop_1167
	movvc	%xcc,	%l0,	%l1
	sll	%l5,	0x1F,	%o3
	stbar
loop_1167:
	tn	%xcc,	0x7
	edge8	%i1,	%g5,	%o6
	subccc	%o2,	%l4,	%g4
	xorcc	%i2,	%o7,	%g2
	edge8ln	%i4,	%l6,	%i6
	fmovde	%icc,	%f23,	%f28
	and	%o0,	%i0,	%i7
	sdivx	%g7,	0x15D5,	%l2
	fba	%fcc3,	loop_1168
	tgu	%xcc,	0x4
	sethi	0x03C2,	%o5
	fpadd16s	%f28,	%f0,	%f29
loop_1168:
	udiv	%g3,	0x1A04,	%l3
	stb	%o1,	[%l7 + 0x41]
	lduw	[%l7 + 0x5C],	%g1
	udivx	%i5,	0x11CA,	%o4
	add	%i3,	%g6,	%l0
	srl	%l1,	0x08,	%l5
	movrgz	%o3,	%i1,	%g5
	brlz,a	%o2,	loop_1169
	fnegd	%f30,	%f24
	orncc	%l4,	%g4,	%o6
	sllx	%i2,	%o7,	%i4
loop_1169:
	xor	%l6,	0x190D,	%g2
	movne	%icc,	%i6,	%o0
	xnor	%i7,	%g7,	%l2
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x6F] %asi,	%i0
	fbg,a	%fcc3,	loop_1170
	movrgez	%g3,	0x0C4,	%o5
	tpos	%xcc,	0x5
	tcs	%xcc,	0x5
loop_1170:
	movgu	%icc,	%o1,	%l3
	fba,a	%fcc1,	loop_1171
	array8	%i5,	%g1,	%i3
	sllx	%g6,	0x07,	%l0
	popc	0x15CB,	%l1
loop_1171:
	orn	%o4,	0x08C4,	%l5
	andn	%o3,	%i1,	%g5
	movleu	%xcc,	%l4,	%g4
	sethi	0x1C39,	%o6
	brlz	%o2,	loop_1172
	sdivcc	%i2,	0x14F6,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i4,	%l6,	%i6
loop_1172:
	tsubcctv	%g2,	%o0,	%i7
	fpadd16	%f14,	%f22,	%f16
	smul	%l2,	%g7,	%i0
	ldstub	[%l7 + 0x67],	%g3
	set	0x48, %g1
	lda	[%l7 + %g1] 0x81,	%f18
	fmovdpos	%icc,	%f25,	%f18
	te	%icc,	0x7
	addc	%o1,	0x1372,	%l3
	edge32ln	%o5,	%i5,	%g1
	edge32l	%g6,	%i3,	%l1
	ldx	[%l7 + 0x28],	%o4
	subccc	%l0,	%l5,	%i1
	ldsb	[%l7 + 0x5A],	%g5
	edge8	%o3,	%l4,	%o6
	movgu	%icc,	%g4,	%o2
	fbule,a	%fcc0,	loop_1173
	smulcc	%o7,	%i2,	%l6
	tn	%xcc,	0x6
	andn	%i4,	%g2,	%o0
loop_1173:
	fbul,a	%fcc1,	loop_1174
	fbge	%fcc1,	loop_1175
	fmovsn	%icc,	%f24,	%f25
	brgz	%i6,	loop_1176
loop_1174:
	mulx	%i7,	0x027A,	%g7
loop_1175:
	movvc	%icc,	%l2,	%i0
	fmul8ulx16	%f14,	%f6,	%f24
loop_1176:
	smul	%o1,	%g3,	%o5
	fnot1	%f18,	%f8
	sdivx	%i5,	0x1B3E,	%g1
	array16	%g6,	%i3,	%l1
	subcc	%l3,	%o4,	%l5
	fmovsvs	%xcc,	%f7,	%f19
	movcc	%icc,	%l0,	%i1
	fbul	%fcc3,	loop_1177
	ble,a,pn	%icc,	loop_1178
	fsrc1s	%f4,	%f24
	bvc,a	loop_1179
loop_1177:
	fmovrsgz	%o3,	%f22,	%f5
loop_1178:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x56] %asi,	%g5
loop_1179:
	tsubcc	%o6,	%g4,	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%o7,	%i2
	edge32l	%l6,	%i4,	%l4
	subc	%o0,	%i6,	%g2
	mulx	%g7,	%l2,	%i0
	membar	0x76
	nop
	setx	loop_1180,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	for	%f16,	%f0,	%f30
	fxors	%f20,	%f30,	%f22
	movrne	%o1,	0x2F2,	%g3
loop_1180:
	sdivcc	%o5,	0x15B5,	%i5
	fmovsne	%icc,	%f1,	%f1
	srl	%g1,	%g6,	%i7
	movleu	%icc,	%i3,	%l1
	movge	%xcc,	%l3,	%o4
	srl	%l0,	0x09,	%l5
	membar	0x0D
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x2C] %asi,	%o3
	subc	%i1,	%g5,	%g4
	tsubcctv	%o6,	0x0B8F,	%o7
	stx	%o2,	[%l7 + 0x08]
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x40] %asi,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x28] %asi,	%f13
	ta	%xcc,	0x0
	edge16ln	%i4,	%l4,	%o0
	bvc,a,pt	%xcc,	loop_1181
	edge8ln	%i6,	%i2,	%g7
	tg	%xcc,	0x6
	fmovsle	%xcc,	%f19,	%f18
loop_1181:
	bl,pn	%icc,	loop_1182
	fblg	%fcc0,	loop_1183
	andn	%l2,	0x142A,	%i0
	edge32	%g2,	%g3,	%o1
loop_1182:
	fcmpeq16	%f26,	%f10,	%o5
loop_1183:
	nop
	set	0x08, %g7
	lduha	[%l7 + %g7] 0x10,	%i5
	fbuge	%fcc3,	loop_1184
	xnorcc	%g1,	0x0C86,	%g6
	fbl	%fcc3,	loop_1185
	ldsb	[%l7 + 0x61],	%i3
loop_1184:
	xnor	%l1,	0x0452,	%l3
	brgz	%i7,	loop_1186
loop_1185:
	bleu,a	loop_1187
	swap	[%l7 + 0x38],	%o4
	tvc	%icc,	0x4
loop_1186:
	be,pn	%xcc,	loop_1188
loop_1187:
	umulcc	%l0,	0x1358,	%l5
	tg	%icc,	0x3
	mova	%icc,	%i1,	%o3
loop_1188:
	movge	%icc,	%g4,	%g5
	add	%o6,	0x15FC,	%o7
	fcmpne16	%f10,	%f14,	%o2
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movvs	%icc,	%i4,	%l6
	fble,a	%fcc1,	loop_1189
	addccc	%l4,	0x1E68,	%i6
	nop
	fitos	%f9,	%f13
	fstoi	%f13,	%f8
	xnorcc	%o0,	0x0024,	%g7
loop_1189:
	tleu	%icc,	0x3
	edge16ln	%l2,	%i2,	%i0
	move	%icc,	%g3,	%o1
	tl	%icc,	0x2
	brnz,a	%g2,	loop_1190
	xor	%o5,	0x1716,	%i5
	te	%xcc,	0x5
	edge32l	%g1,	%g6,	%l1
loop_1190:
	and	%l3,	%i3,	%i7
	tsubcc	%l0,	0x01D1,	%o4
	ldsb	[%l7 + 0x70],	%i1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%o3
	edge16ln	%g4,	%l5,	%g5
	movge	%icc,	%o6,	%o7
	bcs,pn	%xcc,	loop_1191
	tne	%xcc,	0x6
	membar	0x1A
	nop
	setx	0xE883E07C105F61B7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_1191:
	orncc	%o2,	0x118E,	%i4
	tle	%xcc,	0x0
	movl	%xcc,	%l6,	%l4
	move	%xcc,	%o0,	%i6
	mulx	%g7,	%i2,	%l2
	edge8ln	%g3,	%i0,	%o1
	ld	[%l7 + 0x50],	%f6
	alignaddrl	%o5,	%i5,	%g2
	udivcc	%g6,	0x1F9B,	%g1
	tn	%xcc,	0x6
	alignaddr	%l1,	%l3,	%i3
	addccc	%l0,	0x01B0,	%i7
	set	0x68, %g3
	ldsha	[%l7 + %g3] 0x89,	%i1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x10] %asi,	%o4
	edge16l	%o3,	%g4,	%g5
	add	%o6,	0x0A4A,	%o7
	membar	0x2B
	brlz	%o2,	loop_1192
	edge32ln	%i4,	%l6,	%l4
	tl	%icc,	0x0
	fbo,a	%fcc0,	loop_1193
loop_1192:
	nop
	setx	0x68259687,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xBA0616AF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f16,	%f22
	bg	%xcc,	loop_1194
	fbe	%fcc1,	loop_1195
loop_1193:
	alignaddr	%l5,	%o0,	%g7
	sdivx	%i6,	0x15F9,	%l2
loop_1194:
	sth	%i2,	[%l7 + 0x5C]
loop_1195:
	array8	%i0,	%o1,	%o5
	nop
	setx	0x728B440A336E3ECA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x40780C221C7480FC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f30,	%f26
	edge16l	%i5,	%g2,	%g3
	nop
	setx	0xBE9D2F3C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x25EC76D3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f17,	%f13
	edge16n	%g1,	%l1,	%g6
	te	%xcc,	0x3
	umulcc	%l3,	%i3,	%i7
	bvs,a	%xcc,	loop_1196
	tsubcctv	%l0,	%o4,	%i1
	movcc	%icc,	%o3,	%g4
	be	%xcc,	loop_1197
loop_1196:
	sllx	%o6,	0x17,	%o7
	movrlez	%o2,	%g5,	%l6
	stx	%l4,	[%l7 + 0x18]
loop_1197:
	movrlez	%l5,	0x1FE,	%o0
	pdist	%f16,	%f8,	%f10
	tvs	%icc,	0x0
	sra	%g7,	%i6,	%l2
	edge16ln	%i2,	%i0,	%o1
	fsrc2	%f24,	%f20
	tg	%icc,	0x1
	fbue	%fcc3,	loop_1198
	fmovs	%f21,	%f1
	edge8ln	%i4,	%o5,	%i5
	alignaddrl	%g3,	%g2,	%g1
loop_1198:
	array8	%g6,	%l3,	%l1
	taddcctv	%i7,	0x0BA9,	%i3
	tsubcctv	%l0,	0x0C2C,	%i1
	edge16n	%o4,	%o3,	%o6
	taddcctv	%g4,	0x0F30,	%o2
	tne	%xcc,	0x3
	bleu,a,pt	%icc,	loop_1199
	sra	%g5,	%l6,	%l4
	and	%l5,	%o0,	%g7
	flush	%l7 + 0x24
loop_1199:
	edge16l	%i6,	%o7,	%i2
	brnz	%l2,	loop_1200
	andncc	%o1,	%i0,	%i4
	sll	%o5,	0x16,	%i5
	movrgez	%g2,	0x153,	%g1
loop_1200:
	edge32l	%g3,	%g6,	%l3
	flush	%l7 + 0x7C
	subccc	%l1,	%i3,	%i7
	or	%l0,	%o4,	%i1
	edge8l	%o6,	%g4,	%o3
	movrgz	%g5,	0x27C,	%l6
	fmovrdgez	%l4,	%f18,	%f4
	fmovse	%icc,	%f28,	%f3
	xor	%l5,	0x1C08,	%o0
	set	0x4C, %g2
	swapa	[%l7 + %g2] 0x0c,	%o2
	array32	%i6,	%g7,	%i2
	edge32n	%o7,	%o1,	%i0
	udivcc	%i4,	0x1E57,	%l2
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f26
	fxtod	%f26,	%f28
	addccc	%i5,	%g2,	%g1
	array32	%o5,	%g6,	%l3
	edge16	%g3,	%i3,	%l1
	and	%l0,	0x14DB,	%o4
	membar	0x2E
	add	%i7,	0x0A85,	%i1
	ld	[%l7 + 0x38],	%f2
	edge8	%o6,	%o3,	%g5
	edge16ln	%g4,	%l4,	%l6
	sdivx	%o0,	0x1227,	%l5
	fmovse	%xcc,	%f9,	%f23
	sra	%i6,	0x00,	%g7
	bgu,pn	%icc,	loop_1201
	movre	%o2,	%o7,	%o1
	fabss	%f30,	%f9
	fmul8x16au	%f2,	%f21,	%f14
loop_1201:
	movcc	%xcc,	%i0,	%i2
	ldstub	[%l7 + 0x71],	%i4
	fbge	%fcc3,	loop_1202
	movrgz	%l2,	%i5,	%g1
	movre	%o5,	0x1CD,	%g2
	mova	%icc,	%g6,	%l3
loop_1202:
	taddcctv	%g3,	0x153D,	%i3
	tsubcc	%l0,	0x0CE8,	%l1
	movgu	%icc,	%o4,	%i7
	movre	%o6,	0x046,	%i1
	bleu,a,pt	%icc,	loop_1203
	sub	%o3,	%g4,	%l4
	subccc	%l6,	0x1A2B,	%o0
	bvc	%xcc,	loop_1204
loop_1203:
	nop
	setx	0x653CD894B7926B69,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4F0AB8FFFAF0A8BA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f24,	%f30
	xnor	%l5,	0x1BB9,	%g5
	swap	[%l7 + 0x18],	%g7
loop_1204:
	fblg,a	%fcc2,	loop_1205
	fnands	%f25,	%f31,	%f4
	fands	%f19,	%f30,	%f11
	nop
	setx	0x807DD5B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
loop_1205:
	call	loop_1206
	fbuge	%fcc3,	loop_1207
	bgu,a,pt	%icc,	loop_1208
	tvc	%icc,	0x1
loop_1206:
	movrlez	%o2,	0x289,	%i6
loop_1207:
	fxnors	%f20,	%f5,	%f22
loop_1208:
	ta	%xcc,	0x3
	addccc	%o7,	%o1,	%i2
	movpos	%xcc,	%i0,	%i4
	tsubcc	%l2,	%g1,	%i5
	tneg	%icc,	0x3
	fnot2	%f30,	%f22
	addccc	%o5,	0x1090,	%g6
	tcc	%xcc,	0x5
	fbe	%fcc3,	loop_1209
	tvc	%xcc,	0x7
	nop
	setx	0x106E844E,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	nop
	set	0x4C, %l5
	ldsb	[%l7 + %l5],	%g2
loop_1209:
	nop
	fitos	%f9,	%f9
	fstod	%f9,	%f22
	alignaddr	%g3,	%i3,	%l0
	edge8l	%l1,	%o4,	%i7
	fpsub32	%f4,	%f10,	%f26
	fmovse	%icc,	%f23,	%f17
	movrgez	%l3,	0x127,	%i1
	fnegs	%f20,	%f27
	ldsb	[%l7 + 0x29],	%o6
	sir	0x0787
	movleu	%icc,	%o3,	%g4
	flush	%l7 + 0x2C
	and	%l6,	%l4,	%l5
	sub	%g5,	0x0177,	%g7
	fcmple16	%f6,	%f22,	%o2
	movle	%icc,	%o0,	%i6
	sra	%o1,	0x14,	%i2
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
	fexpand	%f18,	%f30
	edge16l	%o7,	%i0,	%l2
	tgu	%icc,	0x7
loop_1210:
	orncc	%i4,	%g1,	%i5
	movpos	%xcc,	%o5,	%g6
	fand	%f26,	%f22,	%f18
	andn	%g3,	0x0EF1,	%g2
	bvc	%icc,	loop_1211
	fpmerge	%f19,	%f19,	%f10
	tg	%icc,	0x0
	subcc	%i3,	%l0,	%l1
loop_1211:
	bn,a	%xcc,	loop_1212
	ldd	[%l7 + 0x18],	%f26
	movrgez	%i7,	%o4,	%i1
	fpack16	%f4,	%f22
loop_1212:
	movn	%xcc,	%o6,	%o3
	edge32	%g4,	%l3,	%l4
	bgu,a	%icc,	loop_1213
	fmovrsgz	%l6,	%f7,	%f7
	std	%f4,	[%l7 + 0x30]
	umul	%g5,	0x19A6,	%l5
loop_1213:
	edge16	%o2,	%o0,	%i6
	move	%xcc,	%g7,	%i2
	sethi	0x0A22,	%o1
	addc	%i0,	0x0EAF,	%l2
	tgu	%xcc,	0x4
	nop
	setx loop_1214, %l0, %l1
	jmpl %l1, %o7
	sir	0x0191
	fmovsleu	%xcc,	%f10,	%f26
	add	%g1,	0x052B,	%i5
loop_1214:
	add	%o5,	0x0745,	%i4
	edge8n	%g3,	%g6,	%g2
	fba,a	%fcc0,	loop_1215
	alignaddrl	%i3,	%l1,	%i7
	sdivcc	%l0,	0x0210,	%i1
	fbe,a	%fcc1,	loop_1216
loop_1215:
	edge16l	%o4,	%o3,	%g4
	fzero	%f24
	brgez,a	%o6,	loop_1217
loop_1216:
	addc	%l3,	0x1D1D,	%l6
	mulscc	%l4,	%l5,	%o2
	alignaddrl	%g5,	%o0,	%i6
loop_1217:
	fnands	%f9,	%f1,	%f0
	addc	%g7,	0x1AD4,	%i2
	addccc	%i0,	0x0C76,	%o1
	sdivcc	%o7,	0x1D8B,	%g1
	edge16ln	%l2,	%i5,	%i4
	xnorcc	%g3,	0x06C9,	%o5
	movvc	%icc,	%g2,	%g6
	fnegd	%f2,	%f14
	fpsub32	%f6,	%f8,	%f12
	movleu	%xcc,	%i3,	%i7
	mulscc	%l1,	%i1,	%o4
	udiv	%l0,	0x1723,	%g4
	movn	%xcc,	%o3,	%o6
	fmovdcs	%icc,	%f5,	%f21
	fmovdvs	%xcc,	%f15,	%f10
	movge	%icc,	%l6,	%l3
	edge16l	%l5,	%l4,	%o2
	bg,a	loop_1218
	fblg,a	%fcc2,	loop_1219
	alignaddrl	%g5,	%o0,	%i6
	tcs	%icc,	0x6
loop_1218:
	fbe,a	%fcc1,	loop_1220
loop_1219:
	fsrc1s	%f7,	%f15
	edge32	%i2,	%i0,	%g7
	xnor	%o1,	%o7,	%l2
loop_1220:
	movn	%icc,	%i5,	%g1
	fmovrslz	%g3,	%f20,	%f8
	orn	%o5,	0x0AC2,	%g2
	set	0x50, %l4
	stxa	%i4,	[%l7 + %l4] 0x81
	fpsub32s	%f10,	%f6,	%f7
	popc	%i3,	%i7
	tge	%xcc,	0x6
	and	%l1,	%g6,	%o4
	tgu	%xcc,	0x4
	fcmpgt16	%f8,	%f22,	%i1
	sub	%g4,	%l0,	%o3
	mulx	%l6,	%l3,	%o6
	edge32l	%l5,	%l4,	%g5
	movrgz	%o2,	%i6,	%o0
	stb	%i0,	[%l7 + 0x20]
	movgu	%icc,	%i2,	%o1
	fmovdne	%icc,	%f10,	%f30
	fmul8x16al	%f31,	%f6,	%f20
	fcmpeq32	%f2,	%f6,	%o7
	edge8ln	%g7,	%l2,	%g1
	fmovrslez	%g3,	%f5,	%f2
	fnot2s	%f21,	%f12
	edge16n	%i5,	%o5,	%g2
	nop
	setx	0x606A5CDA,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	edge8	%i3,	%i7,	%i4
	wr	%g0,	0xeb,	%asi
	stxa	%l1,	[%l7 + 0x48] %asi
	membar	#Sync
	bge,a	loop_1221
	fmovs	%f5,	%f3
	fmovrdgez	%g6,	%f28,	%f12
	xor	%o4,	0x157C,	%i1
loop_1221:
	andn	%l0,	0x0CFE,	%o3
	movle	%xcc,	%g4,	%l3
	tn	%icc,	0x7
	edge8l	%l6,	%o6,	%l4
	fbu	%fcc0,	loop_1222
	edge16n	%g5,	%o2,	%i6
	movle	%icc,	%o0,	%i0
	st	%f25,	[%l7 + 0x78]
loop_1222:
	ldd	[%l7 + 0x38],	%f20
	fbg	%fcc2,	loop_1223
	add	%l5,	%i2,	%o1
	nop
	setx	0x7EAF0FD1AF8C0E9A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xDC74F4F565CDEFA6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f2,	%f2
	tsubcc	%g7,	%o7,	%l2
loop_1223:
	tleu	%xcc,	0x3
	movneg	%xcc,	%g1,	%g3
	orcc	%i5,	%o5,	%g2
	edge16n	%i7,	%i3,	%i4
	fornot2s	%f28,	%f11,	%f21
	nop
	setx	0xAD425A67,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f7
	fpadd32	%f20,	%f28,	%f4
	fmovsge	%icc,	%f6,	%f13
	or	%g6,	%l1,	%i1
	movn	%icc,	%o4,	%l0
	fbug,a	%fcc1,	loop_1224
	sllx	%g4,	0x06,	%o3
	lduh	[%l7 + 0x30],	%l6
	movrgez	%l3,	%l4,	%g5
loop_1224:
	sir	0x0769
	movge	%xcc,	%o6,	%o2
	edge16	%o0,	%i6,	%l5
	fors	%f11,	%f26,	%f8
	sir	0x03A6
	fpsub16s	%f20,	%f10,	%f31
	sdiv	%i0,	0x093F,	%i2
	fabsd	%f18,	%f30
	andcc	%o1,	%g7,	%o7
	fpackfix	%f12,	%f22
	bg	loop_1225
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l2,	%g1,	%i5
	lduw	[%l7 + 0x70],	%g3
loop_1225:
	xorcc	%o5,	%i7,	%i3
	add	%i4,	%g2,	%g6
	orncc	%l1,	%i1,	%l0
	lduh	[%l7 + 0x60],	%o4
	udivcc	%o3,	0x14B9,	%l6
	tsubcctv	%g4,	0x042E,	%l4
	fble	%fcc3,	loop_1226
	addcc	%l3,	0x165B,	%o6
	set	0x40, %o6
	swapa	[%l7 + %o6] 0x89,	%o2
loop_1226:
	edge16	%g5,	%o0,	%i6
	movvs	%icc,	%i0,	%i2
	movl	%icc,	%o1,	%g7
	fmovdvs	%xcc,	%f9,	%f14
	fmovdcc	%icc,	%f19,	%f16
	lduh	[%l7 + 0x7C],	%l5
	fmovdvc	%xcc,	%f4,	%f25
	subccc	%o7,	0x027C,	%g1
	sdivx	%i5,	0x0DEA,	%l2
	fmovsleu	%xcc,	%f8,	%f18
	movleu	%icc,	%g3,	%o5
	ta	%xcc,	0x6
	orn	%i7,	%i4,	%i3
	fbl,a	%fcc3,	loop_1227
	tcc	%xcc,	0x3
	alignaddrl	%g2,	%g6,	%l1
	movvc	%xcc,	%l0,	%i1
loop_1227:
	bleu,pn	%icc,	loop_1228
	bne	%xcc,	loop_1229
	fmovrsgez	%o3,	%f15,	%f5
	fba,a	%fcc3,	loop_1230
loop_1228:
	bvs	loop_1231
loop_1229:
	edge32n	%o4,	%g4,	%l4
	umul	%l3,	0x1123,	%o6
loop_1230:
	fmovrdlz	%l6,	%f8,	%f6
loop_1231:
	edge16n	%o2,	%g5,	%i6
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x17,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba	%fcc3,	loop_1232
	movrne	%o0,	0x25C,	%i0
	edge8	%o1,	%i2,	%g7
	alignaddr	%o7,	%l5,	%i5
loop_1232:
	lduh	[%l7 + 0x2E],	%l2
	sdivcc	%g1,	0x152E,	%o5
	udivcc	%g3,	0x1A4A,	%i7
	ldsw	[%l7 + 0x74],	%i3
	orn	%i4,	0x1D34,	%g2
	stbar
	fbug,a	%fcc2,	loop_1233
	fmovse	%icc,	%f5,	%f11
	tneg	%icc,	0x6
	lduh	[%l7 + 0x7E],	%g6
loop_1233:
	fmuld8sux16	%f3,	%f2,	%f28
	ble,a	loop_1234
	ldub	[%l7 + 0x35],	%l1
	sdivcc	%i1,	0x09C6,	%o3
	tcs	%xcc,	0x1
loop_1234:
	tne	%icc,	0x3
	addccc	%o4,	0x18AD,	%l0
	tcc	%xcc,	0x7
	fbul,a	%fcc0,	loop_1235
	movrne	%g4,	%l4,	%o6
	tpos	%icc,	0x2
	nop
	fitos	%f17,	%f20
loop_1235:
	alignaddr	%l3,	%l6,	%o2
	addccc	%i6,	%g5,	%i0
	array8	%o1,	%o0,	%g7
	fone	%f20
	brgz	%i2,	loop_1236
	fbge,a	%fcc1,	loop_1237
	movneg	%xcc,	%l5,	%o7
	membar	0x79
loop_1236:
	bcs,a	loop_1238
loop_1237:
	srl	%i5,	0x18,	%l2
	movpos	%icc,	%g1,	%o5
	addccc	%g3,	%i7,	%i4
loop_1238:
	stbar
	udivx	%g2,	0x13EA,	%g6
	tne	%icc,	0x0
	or	%l1,	0x18C4,	%i1
	movne	%icc,	%o3,	%o4
	ldx	[%l7 + 0x28],	%l0
	bgu,a	loop_1239
	addc	%g4,	0x1EC3,	%l4
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%i2
	fmovdcs	%xcc,	%f8,	%f25
loop_1239:
	bgu	loop_1240
	fcmpne32	%f4,	%f14,	%o6
	fxor	%f2,	%f6,	%f8
	fbue,a	%fcc2,	loop_1241
loop_1240:
	edge8n	%l3,	%l6,	%i6
	tcc	%icc,	0x5
	array16	%g5,	%o2,	%o1
loop_1241:
	andn	%o0,	0x09EA,	%i0
	movgu	%xcc,	%i2,	%l5
	set	0x60, %g5
	ldda	[%l7 + %g5] 0x10,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x14,	%f16
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x0E] %asi,	%i5
	fpsub16	%f4,	%f22,	%f20
	xnor	%o7,	%g1,	%o5
	fmovsneg	%icc,	%f29,	%f3
	bcc,pn	%xcc,	loop_1242
	udivcc	%l2,	0x0CA6,	%i7
	fsrc2s	%f7,	%f15
	addccc	%i4,	%g2,	%g6
loop_1242:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x19,	%g3,	%i1
	mulx	%o3,	0x0A03,	%l1
	edge8l	%o4,	%l0,	%l4
	edge32n	%i3,	%o6,	%l3
	fmovrdgz	%g4,	%f12,	%f10
	fbge,a	%fcc3,	loop_1243
	movgu	%icc,	%i6,	%l6
	sir	0x18C0
	lduw	[%l7 + 0x38],	%g5
loop_1243:
	orcc	%o2,	%o0,	%i0
	subc	%o1,	%i2,	%l5
	edge32l	%i5,	%o7,	%g1
	brz,a	%o5,	loop_1244
	array8	%l2,	%g7,	%i7
	tcc	%icc,	0x7
	fmovdg	%xcc,	%f1,	%f28
loop_1244:
	addccc	%i4,	0x159D,	%g6
	fpsub16s	%f3,	%f16,	%f23
	addcc	%g2,	0x1B3E,	%i1
	sdivx	%g3,	0x0C8E,	%o3
	tvc	%icc,	0x1
	xnor	%o4,	0x0880,	%l0
	fmovdn	%xcc,	%f25,	%f26
	orcc	%l4,	0x07F3,	%i3
	brgez	%o6,	loop_1245
	array32	%l3,	%l1,	%i6
	nop
	setx	loop_1246,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subcc	%g4,	0x011A,	%l6
loop_1245:
	nop
	setx loop_1247, %l0, %l1
	jmpl %l1, %g5
	edge32n	%o2,	%i0,	%o1
loop_1246:
	nop
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1247:
	fnand	%f10,	%f0,	%f14
	nop
	fitod	%f4,	%f4
	fdtos	%f4,	%f22
	move	%icc,	%o0,	%i2
	fmovrdne	%i5,	%f2,	%f18
	ldub	[%l7 + 0x3A],	%o7
	sub	%l5,	0x1C99,	%g1
	nop
	fitos	%f1,	%f21
	fstoi	%f21,	%f30
	nop
	fitos	%f11,	%f11
	fstox	%f11,	%f18
	fxtos	%f18,	%f6
	bn,a	loop_1248
	mulx	%o5,	0x00FF,	%g7
	tvs	%icc,	0x1
	udiv	%i7,	0x0379,	%i4
loop_1248:
	edge8l	%g6,	%l2,	%g2
	fmovsge	%icc,	%f25,	%f14
	fsrc1	%f16,	%f18
	addcc	%g3,	%i1,	%o3
	mova	%xcc,	%o4,	%l4
	fmovrsne	%i3,	%f24,	%f23
	set	0x68, %i2
	prefetcha	[%l7 + %i2] 0x14,	 0x3
	movpos	%icc,	%l3,	%l1
	nop
	fitod	%f24,	%f26
	fnegd	%f2,	%f26
	fcmpne32	%f26,	%f8,	%i6
	ba	loop_1249
	popc	0x034A,	%l0
	nop
	setx	0x404E47EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	tne	%icc,	0x1
loop_1249:
	bneg,a	%xcc,	loop_1250
	nop
	setx	0x464F558A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x1E6488BB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f11,	%f21
	fble,a	%fcc1,	loop_1251
	sdiv	%l6,	0x13E5,	%g5
loop_1250:
	fcmpne16	%f20,	%f16,	%g4
	fble,a	%fcc1,	loop_1252
loop_1251:
	brgez	%o2,	loop_1253
	fble,a	%fcc2,	loop_1254
	movcs	%xcc,	%o1,	%i0
loop_1252:
	mova	%icc,	%i2,	%o0
loop_1253:
	taddcc	%i5,	%l5,	%g1
loop_1254:
	andncc	%o5,	%g7,	%o7
	fornot1	%f6,	%f0,	%f2
	set	0x78, %l6
	lduwa	[%l7 + %l6] 0x80,	%i7
	tvs	%xcc,	0x6
	fmovdvc	%icc,	%f30,	%f18
	orcc	%g6,	0x0981,	%l2
	bpos,a	loop_1255
	brgz,a	%i4,	loop_1256
	subcc	%g3,	%i1,	%o3
	edge16l	%o4,	%g2,	%i3
loop_1255:
	fmovspos	%icc,	%f0,	%f15
loop_1256:
	fmovsvc	%icc,	%f11,	%f15
	fmovsle	%icc,	%f23,	%f18
	fcmpgt16	%f18,	%f8,	%o6
	movre	%l3,	%l4,	%l1
	fnot1s	%f30,	%f12
	srl	%i6,	%l6,	%g5
	udivcc	%l0,	0x1E80,	%o2
	fpmerge	%f9,	%f1,	%f24
	orncc	%g4,	%i0,	%i2
	nop
	fitos	%f9,	%f5
	fstox	%f5,	%f4
	fxtos	%f4,	%f12
	fmovdg	%xcc,	%f17,	%f12
	fmovda	%icc,	%f21,	%f13
	addccc	%o0,	0x12C1,	%o1
	xor	%l5,	0x0516,	%i5
	membar	0x61
	xor	%g1,	%g7,	%o5
	nop
	setx loop_1257, %l0, %l1
	jmpl %l1, %o7
	fpadd32s	%f25,	%f16,	%f11
	fcmpeq16	%f14,	%f22,	%i7
	fornot2	%f2,	%f8,	%f16
loop_1257:
	tsubcc	%l2,	%g6,	%g3
	alignaddrl	%i1,	%o3,	%i4
	tcs	%xcc,	0x2
	set	0x59, %o1
	ldsba	[%l7 + %o1] 0x19,	%o4
	fmovsleu	%icc,	%f15,	%f6
	udiv	%g2,	0x0177,	%i3
	stbar
	brlez	%o6,	loop_1258
	movrlz	%l4,	%l1,	%i6
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f6
	array8	%l3,	%g5,	%l6
loop_1258:
	nop
	setx	loop_1259,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	prefetch	[%l7 + 0x10],	 0x3
	wr	%g0,	0x80,	%asi
	stba	%o2,	[%l7 + 0x39] %asi
loop_1259:
	movrlez	%l0,	%i0,	%i2
	xnor	%g4,	%o0,	%l5
	membar	0x46
	tn	%icc,	0x2
	wr	%g0,	0x04,	%asi
	stxa	%o1,	[%l7 + 0x20] %asi
	ldsw	[%l7 + 0x6C],	%i5
	edge16n	%g1,	%g7,	%o7
	fmovdle	%icc,	%f12,	%f7
	edge8ln	%o5,	%i7,	%l2
	fmul8x16	%f24,	%f28,	%f30
	array8	%g6,	%i1,	%o3
	alignaddrl	%i4,	%g3,	%o4
	fxor	%f0,	%f30,	%f4
	movvc	%xcc,	%g2,	%i3
	orn	%o6,	0x1A53,	%l4
	fpmerge	%f28,	%f18,	%f14
	flush	%l7 + 0x78
	membar	0x46
	fnot1	%f4,	%f12
	or	%l1,	%l3,	%g5
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l6
	movrne	%i6,	%o2,	%l0
	membar	0x0E
	movvc	%icc,	%i2,	%g4
	bg,a	%icc,	loop_1260
	edge8ln	%o0,	%l5,	%o1
	fbuge	%fcc0,	loop_1261
	bcs,a	loop_1262
loop_1260:
	bcc,a,pn	%icc,	loop_1263
	brgz	%i0,	loop_1264
loop_1261:
	fmuld8ulx16	%f6,	%f16,	%f0
loop_1262:
	srl	%g1,	%i5,	%o7
loop_1263:
	array16	%o5,	%g7,	%l2
loop_1264:
	fabss	%f13,	%f24
	fnegd	%f16,	%f4
	srl	%g6,	%i7,	%o3
	smulcc	%i1,	%i4,	%o4
	edge8ln	%g3,	%g2,	%i3
	std	%f22,	[%l7 + 0x20]
	sllx	%o6,	%l4,	%l1
	tge	%xcc,	0x7
	sdivcc	%l3,	0x0879,	%l6
	bvc,a	loop_1265
	nop
	setx	loop_1266,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd16s	%f0,	%f1,	%f2
	sdiv	%g5,	0x0DF6,	%i6
loop_1265:
	tgu	%xcc,	0x0
loop_1266:
	lduw	[%l7 + 0x60],	%l0
	xor	%o2,	%i2,	%o0
	ta	%xcc,	0x4
	tle	%icc,	0x3
	alignaddrl	%l5,	%o1,	%g4
	fpadd32	%f22,	%f20,	%f22
	subc	%g1,	0x10C4,	%i0
	ld	[%l7 + 0x0C],	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x1
	sdiv	%i5,	0x0A14,	%o5
	fmovsleu	%icc,	%f21,	%f19
	smulcc	%o7,	%g7,	%l2
	tvc	%icc,	0x2
	edge32l	%i7,	%g6,	%o3
	array8	%i4,	%o4,	%g3
	edge8ln	%i1,	%i3,	%o6
	umul	%l4,	%g2,	%l1
	edge16l	%l6,	%l3,	%i6
	addccc	%l0,	%o2,	%i2
	subcc	%o0,	0x0681,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o1,	%l5
	movcs	%icc,	%g1,	%g4
	andcc	%i5,	%o5,	%o7
	bpos,pt	%icc,	loop_1267
	edge32l	%i0,	%l2,	%g7
	tpos	%xcc,	0x3
	nop
	setx	0xFCFA3D3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x61F5D7B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f19,	%f16
loop_1267:
	add	%i7,	0x1320,	%o3
	lduw	[%l7 + 0x70],	%g6
	udivcc	%o4,	0x07F7,	%g3
	fmul8x16	%f30,	%f10,	%f24
	fornot1s	%f20,	%f2,	%f27
	taddcc	%i4,	%i3,	%i1
	fmovrse	%l4,	%f9,	%f27
	umul	%g2,	%o6,	%l1
	sdivcc	%l6,	0x01C4,	%i6
	ldd	[%l7 + 0x70],	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o2,	%i2,	%o0
	sdiv	%l0,	0x0932,	%o1
	fmovsn	%icc,	%f9,	%f3
	nop
	setx	0x2A7390C4406DA077,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	andcc	%l5,	0x02B1,	%g5
	tcc	%xcc,	0x6
	fcmple32	%f28,	%f24,	%g1
	set	0x28, %i7
	stxa	%i5,	[%l7 + %i7] 0x89
	fmovdgu	%xcc,	%f22,	%f3
	ldd	[%l7 + 0x30],	%f2
	wr	%g0,	0x2b,	%asi
	stha	%g4,	[%l7 + 0x7E] %asi
	membar	#Sync
	tl	%icc,	0x5
	nop
	fitod	%f10,	%f24
	fdtoi	%f24,	%f17
	udivx	%o7,	0x1465,	%o5
	prefetch	[%l7 + 0x38],	 0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i0,	0x1A53,	%g7
	fbo	%fcc0,	loop_1268
	subc	%i7,	%o3,	%l2
	tcc	%icc,	0x2
	fbge,a	%fcc0,	loop_1269
loop_1268:
	array16	%o4,	%g3,	%i4
	movvc	%icc,	%i3,	%i1
	tsubcc	%g6,	0x05FD,	%g2
loop_1269:
	andncc	%o6,	%l4,	%l1
	array8	%l6,	%i6,	%l3
	fmovrsne	%i2,	%f1,	%f2
	sll	%o0,	%l0,	%o2
	tsubcc	%o1,	%l5,	%g1
	fmovdg	%icc,	%f6,	%f11
	brlez	%g5,	loop_1270
	bvs	loop_1271
	movvc	%xcc,	%g4,	%i5
	fmovscc	%xcc,	%f9,	%f24
loop_1270:
	fpackfix	%f12,	%f5
loop_1271:
	subc	%o5,	0x0BE9,	%o7
	array8	%g7,	%i7,	%i0
	faligndata	%f20,	%f16,	%f12
	fmovsgu	%xcc,	%f25,	%f2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x40] %asi,	%l2
	bcc	loop_1272
	subccc	%o3,	0x1382,	%o4
	movrlz	%i4,	0x21A,	%g3
	bne,a	loop_1273
loop_1272:
	popc	0x11BC,	%i3
	set	0x7E, %o2
	stha	%g6,	[%l7 + %o2] 0x11
loop_1273:
	tsubcc	%g2,	%i1,	%l4
	bge	%icc,	loop_1274
	umul	%o6,	%l1,	%l6
	fmovdg	%icc,	%f5,	%f7
	st	%f2,	[%l7 + 0x78]
loop_1274:
	movn	%xcc,	%l3,	%i2
	fandnot1	%f14,	%f26,	%f28
	ta	%xcc,	0x6
	fbue	%fcc0,	loop_1275
	te	%icc,	0x4
	alignaddr	%i6,	%l0,	%o0
	fmuld8ulx16	%f31,	%f27,	%f4
loop_1275:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
	orn	%o1,	0x0F0E,	%g1
	fbl	%fcc3,	loop_1276
	brgz,a	%g5,	loop_1277
	or	%g4,	%l5,	%o5
	fbl	%fcc0,	loop_1278
loop_1276:
	be	loop_1279
loop_1277:
	or	%i5,	0x0A49,	%g7
	udivx	%o7,	0x1303,	%i0
loop_1278:
	sub	%l2,	0x0858,	%i7
loop_1279:
	bcc	loop_1280
	fpsub32	%f4,	%f20,	%f22
	tg	%xcc,	0x3
	srl	%o4,	%o3,	%i4
loop_1280:
	bn	loop_1281
	ble,a,pt	%xcc,	loop_1282
	fmovdleu	%icc,	%f17,	%f14
	fbuge,a	%fcc2,	loop_1283
loop_1281:
	fpack32	%f2,	%f16,	%f6
loop_1282:
	tneg	%xcc,	0x5
	fbule,a	%fcc3,	loop_1284
loop_1283:
	ta	%icc,	0x4
	lduh	[%l7 + 0x62],	%g3
	wr	%g0,	0x04,	%asi
	stwa	%i3,	[%l7 + 0x54] %asi
loop_1284:
	fmovrslz	%g6,	%f1,	%f8
	stbar
	udivcc	%g2,	0x16D8,	%l4
	fmovsvs	%xcc,	%f12,	%f29
	call	loop_1285
	fmovdleu	%xcc,	%f21,	%f23
	srlx	%o6,	%l1,	%l6
	fpadd16s	%f15,	%f1,	%f30
loop_1285:
	movvs	%icc,	%i1,	%l3
	tcc	%icc,	0x2
	brlz	%i6,	loop_1286
	edge8	%l0,	%o0,	%o2
	nop
	setx	0x2532C6FC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x41C22E40,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f4,	%f18
	nop
	fitod	%f8,	%f30
	fdtox	%f30,	%f28
loop_1286:
	edge32ln	%i2,	%o1,	%g1
	tge	%xcc,	0x5
	movneg	%icc,	%g4,	%l5
	fpack32	%f28,	%f28,	%f6
	nop
	setx	0x5A43FF2D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f26
	sll	%g5,	0x17,	%i5
	nop
	setx	0xA1A7744D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x02948BE3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f6,	%f6
	bpos,pt	%xcc,	loop_1287
	alignaddr	%g7,	%o7,	%i0
	bvs,a,pt	%xcc,	loop_1288
	edge8ln	%l2,	%o5,	%i7
loop_1287:
	subc	%o4,	0x1A02,	%i4
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x52] %asi,	%o3
loop_1288:
	nop
	wr	%g0,	0x11,	%asi
	sta	%f1,	[%l7 + 0x10] %asi
	nop
	fitos	%f11,	%f7
	fstox	%f7,	%f6
	sdiv	%i3,	0x1D72,	%g6
	nop
	setx loop_1289, %l0, %l1
	jmpl %l1, %g3
	bn,pn	%xcc,	loop_1290
	ta	%icc,	0x3
	fsrc2s	%f3,	%f23
loop_1289:
	ldstub	[%l7 + 0x59],	%l4
loop_1290:
	fmovde	%icc,	%f2,	%f20
	nop
	set	0x33, %o3
	ldub	[%l7 + %o3],	%o6
	movpos	%xcc,	%l1,	%g2
	movrlez	%i1,	%l3,	%l6
	popc	%i6,	%o0
	xorcc	%o2,	%i2,	%l0
	tne	%xcc,	0x3
	edge16l	%g1,	%g4,	%o1
	fbug,a	%fcc0,	loop_1291
	tvc	%icc,	0x7
	be,pt	%icc,	loop_1292
	mulscc	%g5,	0x065E,	%l5
loop_1291:
	flush	%l7 + 0x14
	ldd	[%l7 + 0x70],	%f10
loop_1292:
	fpsub32s	%f12,	%f14,	%f31
	fmovdl	%icc,	%f29,	%f13
	fble	%fcc0,	loop_1293
	fmovrdlz	%i5,	%f8,	%f22
	srlx	%g7,	%o7,	%l2
	tle	%xcc,	0x7
loop_1293:
	nop
	setx	0x872645E954F59BD1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD7418171DE0DB2E3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f0,	%f8
	fabsd	%f16,	%f24
	movgu	%xcc,	%i0,	%o5
	nop
	setx	loop_1294,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	flush	%l7 + 0x0C
	fmovdvs	%xcc,	%f0,	%f14
	bn,a	%xcc,	loop_1295
loop_1294:
	nop
	fitos	%f18,	%f18
	sdivx	%i7,	0x111E,	%o4
	fbo,a	%fcc1,	loop_1296
loop_1295:
	fmovsgu	%icc,	%f24,	%f2
	tleu	%xcc,	0x6
	set	0x29, %i4
	ldsba	[%l7 + %i4] 0x18,	%o3
loop_1296:
	movre	%i3,	%g6,	%i4
	bleu,a,pn	%icc,	loop_1297
	movg	%icc,	%l4,	%g3
	nop
	setx	loop_1298,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%l1,	%g2,	%i1
loop_1297:
	andncc	%o6,	%l3,	%l6
	fmovrdgez	%o0,	%f12,	%f2
loop_1298:
	fsrc2	%f24,	%f18
	fba	%fcc2,	loop_1299
	movrne	%o2,	0x2BD,	%i2
	edge16ln	%i6,	%g1,	%l0
	bcs,a,pt	%icc,	loop_1300
loop_1299:
	movg	%xcc,	%g4,	%g5
	fmovde	%xcc,	%f3,	%f10
	fpackfix	%f30,	%f15
loop_1300:
	fbge,a	%fcc0,	loop_1301
	nop
	setx	0x33FF0691,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xA3375455,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f29,	%f1
	taddcctv	%o1,	0x137F,	%i5
	umul	%l5,	%g7,	%l2
loop_1301:
	fmovsg	%icc,	%f15,	%f21
	fmovs	%f0,	%f12
	subc	%o7,	%i0,	%i7
	fmovsg	%icc,	%f15,	%f15
	edge32ln	%o5,	%o3,	%i3
	fbne	%fcc1,	loop_1302
	sir	0x11A3
	bne,a,pt	%xcc,	loop_1303
	movrlez	%g6,	0x326,	%o4
loop_1302:
	fmovdvs	%icc,	%f17,	%f26
	andn	%i4,	%l4,	%g3
loop_1303:
	movneg	%xcc,	%g2,	%l1
	fpadd32	%f20,	%f24,	%f4
	edge16	%i1,	%o6,	%l3
	wr	%g0,	0x88,	%asi
	sta	%f22,	[%l7 + 0x38] %asi
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%o0,	%f30,	%f3
	orn	%l6,	%o2,	%i6
	orn	%i2,	%g1,	%g4
	movneg	%xcc,	%g5,	%o1
	fmovrdlz	%l0,	%f22,	%f6
	tl	%xcc,	0x1
	edge32	%l5,	%i5,	%g7
	add	%l7,	0x14,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x04,	%l2,	%i0
	fcmpne16	%f18,	%f30,	%o7
	fmovrdlz	%o5,	%f2,	%f22
	udiv	%o3,	0x0896,	%i7
	srlx	%i3,	0x07,	%g6
	edge8l	%o4,	%l4,	%i4
	fzeros	%f1
	andn	%g2,	0x06D1,	%l1
	tle	%xcc,	0x3
	fmovrsne	%i1,	%f11,	%f30
	udivcc	%o6,	0x0FB7,	%g3
	fblg	%fcc0,	loop_1304
	smul	%l3,	0x1098,	%o0
	bvs,pn	%xcc,	loop_1305
	ldsh	[%l7 + 0x4C],	%l6
loop_1304:
	sll	%i6,	0x04,	%o2
	fble	%fcc0,	loop_1306
loop_1305:
	ldsh	[%l7 + 0x40],	%g1
	set	0x60, %g6
	stwa	%i2,	[%l7 + %g6] 0x88
loop_1306:
	addcc	%g5,	0x0A6A,	%g4
	nop
	setx loop_1307, %l0, %l1
	jmpl %l1, %o1
	ld	[%l7 + 0x18],	%f3
	fands	%f24,	%f2,	%f21
	movpos	%icc,	%l0,	%l5
loop_1307:
	tleu	%xcc,	0x3
	movle	%icc,	%i5,	%l2
	tl	%xcc,	0x6
	nop
	set	0x38, %o4
	ldd	[%l7 + %o4],	%f4
	prefetch	[%l7 + 0x40],	 0x2
	array16	%g7,	%i0,	%o5
	tvc	%xcc,	0x1
	taddcctv	%o7,	0x1438,	%i7
	srax	%o3,	%i3,	%o4
	fbg	%fcc1,	loop_1308
	fmovdvc	%icc,	%f13,	%f15
	nop
	setx	0x26972D15606823A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fsrc2	%f12,	%f26
loop_1308:
	bvs,a	%xcc,	loop_1309
	taddcctv	%l4,	0x0C1B,	%g6
	smul	%i4,	0x1014,	%g2
	fexpand	%f23,	%f20
loop_1309:
	edge16n	%l1,	%o6,	%i1
	taddcctv	%l3,	%o0,	%g3
	subc	%l6,	%i6,	%o2
	udiv	%i2,	0x1C52,	%g1
	fbul,a	%fcc0,	loop_1310
	ld	[%l7 + 0x78],	%f4
	std	%f20,	[%l7 + 0x10]
	fmovsne	%xcc,	%f21,	%f19
loop_1310:
	prefetch	[%l7 + 0x4C],	 0x3
	movrgz	%g5,	%g4,	%o1
	andncc	%l0,	%i5,	%l2
	srax	%l5,	%i0,	%g7
	movcc	%icc,	%o7,	%i7
	umul	%o3,	%i3,	%o5
	tvs	%icc,	0x6
	smulcc	%l4,	%g6,	%i4
	mulx	%o4,	%g2,	%o6
	fcmpeq32	%f16,	%f28,	%i1
	set	0x54, %l1
	lda	[%l7 + %l1] 0x0c,	%f9
	fmovrsgez	%l3,	%f4,	%f13
	udivcc	%l1,	0x158B,	%g3
	movrne	%l6,	0x225,	%o0
	fble,a	%fcc3,	loop_1311
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i6,	0x1E93,	%o2
	ta	%icc,	0x0
loop_1311:
	smulcc	%g1,	%g5,	%i2
	fpack32	%f6,	%f16,	%f0
	bn,pn	%icc,	loop_1312
	edge16ln	%g4,	%l0,	%i5
	movl	%xcc,	%l2,	%l5
	sll	%i0,	0x09,	%g7
loop_1312:
	ldd	[%l7 + 0x70],	%f12
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	nop
	setx	0x71F3D628,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x93C52AC1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f23,	%f17
	sir	0x0FC3
	array8	%o1,	%i7,	%i3
	bneg	loop_1313
	addcc	%o3,	0x0557,	%l4
	movcc	%xcc,	%o5,	%i4
	edge16	%g6,	%g2,	%o6
loop_1313:
	sir	0x104F
	xnor	%i1,	0x028A,	%o4
	bgu,pt	%icc,	loop_1314
	fornot2	%f16,	%f12,	%f12
	movge	%xcc,	%l1,	%g3
	tcc	%xcc,	0x6
loop_1314:
	nop
	setx	loop_1315,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%l3,	%o0,	%l6
	fbne,a	%fcc1,	loop_1316
	edge8ln	%i6,	%g1,	%g5
loop_1315:
	tsubcctv	%i2,	%o2,	%g4
	movvc	%xcc,	%l0,	%l2
loop_1316:
	fbue	%fcc2,	loop_1317
	fpsub16	%f18,	%f26,	%f30
	set	0x1C, %l2
	ldswa	[%l7 + %l2] 0x14,	%i5
loop_1317:
	taddcc	%i0,	%g7,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x2C],	 0x3
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
	brz,a	%i7,	loop_1318
	sra	%i3,	0x03,	%l5
	movvc	%xcc,	%l4,	%o3
	udivcc	%o5,	0x0ACF,	%i4
loop_1318:
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f14
	fxtod	%f14,	%f8
	alignaddr	%g6,	%g2,	%o6
	set	0x6E, %o5
	ldstuba	[%l7 + %o5] 0x10,	%i1
	fmovdg	%xcc,	%f12,	%f31
	movn	%xcc,	%l1,	%g3
	stw	%o4,	[%l7 + 0x0C]
	edge16l	%l3,	%l6,	%o0
	fpsub32s	%f2,	%f8,	%f6
	sethi	0x1769,	%g1
	subccc	%i6,	%g5,	%o2
	umulcc	%i2,	0x00E0,	%g4
	fbn,a	%fcc1,	loop_1319
	fmovsgu	%icc,	%f0,	%f18
	udiv	%l2,	0x1FAF,	%i5
	fmovsa	%xcc,	%f23,	%f29
loop_1319:
	umulcc	%l0,	%g7,	%i0
	nop
	setx	0xB79B0BA3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f19
	taddcctv	%o7,	%i7,	%o1
	fxnors	%f8,	%f5,	%f10
	ta	%icc,	0x3
	brnz,a	%l5,	loop_1320
	tn	%xcc,	0x6
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l4
loop_1320:
	nop
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
	fzeros	%f17
	fpsub32	%f20,	%f14,	%f14
	bcc,a	%icc,	loop_1321
	movre	%o5,	0x2C4,	%i4
	fmovdn	%icc,	%f2,	%f7
	fblg,a	%fcc1,	loop_1322
loop_1321:
	sdivx	%g6,	0x1EB9,	%o3
	movrgz	%o6,	0x14F,	%g2
	movpos	%icc,	%i1,	%g3
loop_1322:
	movcs	%xcc,	%l1,	%l3
	tge	%xcc,	0x0
	fandnot1	%f8,	%f20,	%f18
	fnot1s	%f18,	%f27
	edge32n	%o4,	%o0,	%g1
	fornot1s	%f23,	%f11,	%f17
	std	%f16,	[%l7 + 0x40]
	te	%xcc,	0x6
	fmul8x16au	%f9,	%f8,	%f2
	fcmple16	%f24,	%f14,	%l6
	fzero	%f28
	tg	%icc,	0x0
	fands	%f3,	%f8,	%f13
	fpadd16s	%f31,	%f7,	%f30
	tpos	%icc,	0x3
	fpack32	%f0,	%f20,	%f14
	stx	%i6,	[%l7 + 0x18]
	ldx	[%l7 + 0x58],	%o2
	movcc	%icc,	%i2,	%g5
	fcmpgt32	%f28,	%f26,	%g4
	edge8ln	%l2,	%i5,	%l0
	set	0x18, %l3
	ldxa	[%l7 + %l3] 0x88,	%i0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%o7,	%g7
	tpos	%xcc,	0x4
	edge32	%o1,	%i7,	%l5
	addcc	%i3,	0x038C,	%l4
	tcc	%icc,	0x0
	fmovrdgez	%i4,	%f4,	%f24
	brlez	%o5,	loop_1323
	tcc	%xcc,	0x4
	movrlz	%o3,	%g6,	%g2
	srlx	%i1,	%o6,	%g3
loop_1323:
	udivcc	%l1,	0x0F3B,	%o4
	orcc	%o0,	0x076F,	%g1
	movrgez	%l3,	%i6,	%l6
	xnorcc	%i2,	%g5,	%o2
	bgu,a	loop_1324
	fpmerge	%f7,	%f0,	%f18
	sdivx	%l2,	0x0DB4,	%i5
	movleu	%xcc,	%l0,	%g4
loop_1324:
	fmovsl	%icc,	%f11,	%f6
	movneg	%icc,	%o7,	%g7
	alignaddr	%i0,	%o1,	%l5
	fxors	%f31,	%f21,	%f17
	mulx	%i3,	0x1E0F,	%i7
	std	%f30,	[%l7 + 0x38]
	xnorcc	%l4,	0x1030,	%o5
	bcc,pn	%icc,	loop_1325
	sub	%i4,	%g6,	%g2
	fors	%f20,	%f28,	%f8
	taddcctv	%o3,	%o6,	%i1
loop_1325:
	ldd	[%l7 + 0x40],	%g2
	ldsw	[%l7 + 0x38],	%l1
	fmovsg	%icc,	%f12,	%f29
	subccc	%o0,	%g1,	%l3
	fmovsg	%icc,	%f15,	%f7
	fmovsvc	%xcc,	%f8,	%f15
	wr	%g0,	0x81,	%asi
	stba	%o4,	[%l7 + 0x0A] %asi
	fmovd	%f20,	%f20
	edge16l	%i6,	%i2,	%l6
	movvs	%icc,	%g5,	%l2
	orncc	%o2,	0x12BF,	%i5
	movle	%icc,	%l0,	%o7
	flush	%l7 + 0x78
	bcs,pn	%icc,	loop_1326
	tneg	%xcc,	0x2
	array32	%g7,	%i0,	%g4
	fmovsle	%xcc,	%f30,	%f20
loop_1326:
	movvs	%xcc,	%o1,	%i3
	tvs	%icc,	0x6
	nop
	setx	0x606D0105,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	movge	%xcc,	%i7,	%l5
	udivcc	%o5,	0x1442,	%i4
	movrne	%l4,	0x14A,	%g6
	ldsb	[%l7 + 0x1B],	%g2
	ldx	[%l7 + 0x28],	%o6
	fbn	%fcc3,	loop_1327
	tg	%xcc,	0x2
	fmovsvs	%icc,	%f29,	%f16
	popc	%o3,	%g3
loop_1327:
	ld	[%l7 + 0x50],	%f15
	fmovdleu	%xcc,	%f6,	%f25
	set	0x0A, %g4
	lduha	[%l7 + %g4] 0x10,	%i1
	fmovdg	%icc,	%f11,	%f22
	tge	%xcc,	0x2
	fpack32	%f0,	%f26,	%f24
	fmovrse	%o0,	%f6,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g1,	%l1
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
	sdivx	%o4,	0x13E0,	%l3
	tsubcc	%i6,	0x000E,	%i2
	orcc	%g5,	%l2,	%o2
	fmovdvc	%xcc,	%f2,	%f25
	ta	%icc,	0x7
	alignaddrl	%i5,	%l0,	%l6
	addc	%g7,	%o7,	%i0
	tg	%icc,	0x6
	sdivx	%g4,	0x03D2,	%o1
	movre	%i7,	%l5,	%o5
	fcmpgt32	%f22,	%f10,	%i4
	bvs,a,pn	%icc,	loop_1328
	tle	%xcc,	0x0
	subcc	%l4,	0x1FB4,	%i3
	array8	%g2,	%o6,	%g6
loop_1328:
	membar	0x06
	movcc	%xcc,	%o3,	%i1
	bgu,a,pn	%icc,	loop_1329
	tvc	%xcc,	0x4
	movrgez	%o0,	0x212,	%g3
	bpos,pt	%xcc,	loop_1330
loop_1329:
	xnorcc	%g1,	0x0491,	%l1
	mulx	%l3,	%i6,	%i2
	movcc	%xcc,	%g5,	%l2
loop_1330:
	edge32n	%o4,	%i5,	%o2
	set	0x30, %o0
	sta	%f13,	[%l7 + %o0] 0x11
	edge8l	%l6,	%l0,	%g7
	nop
	set	0x43, %o7
	ldsb	[%l7 + %o7],	%o7
	nop
	setx	loop_1331,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%xcc,	%i0,	%o1
	fcmpeq16	%f28,	%f20,	%i7
	umulcc	%l5,	0x0D7F,	%o5
loop_1331:
	fbuge	%fcc3,	loop_1332
	movn	%xcc,	%i4,	%l4
	bl	loop_1333
	fsrc2	%f18,	%f20
loop_1332:
	ldx	[%l7 + 0x70],	%g4
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
loop_1333:
	andcc	%o6,	%g6,	%g2
	fcmpne32	%f8,	%f12,	%i1
	sll	%o3,	%o0,	%g3
	move	%icc,	%l1,	%l3
	nop
	setx	0xAB5BA5F38D4248DD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x20065AF534D3F03E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f8,	%f8
	movleu	%icc,	%g1,	%i2
	fmovrslz	%i6,	%f31,	%f23
	tvc	%icc,	0x7
	tle	%xcc,	0x1
	movleu	%xcc,	%g5,	%o4
	sdivcc	%l2,	0x1DD1,	%i5
	or	%l6,	0x1751,	%l0
	sth	%g7,	[%l7 + 0x52]
	movneg	%icc,	%o7,	%o2
	fbug	%fcc2,	loop_1334
	srl	%o1,	%i0,	%i7
	array8	%l5,	%o5,	%i4
	flush	%l7 + 0x44
loop_1334:
	edge32l	%l4,	%g4,	%o6
	tvs	%xcc,	0x0
	tsubcctv	%i3,	0x06C2,	%g6
	bne	loop_1335
	fbul,a	%fcc2,	loop_1336
	orn	%i1,	0x0D3B,	%o3
	movge	%xcc,	%g2,	%g3
loop_1335:
	sllx	%l1,	%o0,	%g1
loop_1336:
	srlx	%l3,	0x16,	%i2
	nop
	setx	loop_1337,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srax	%i6,	0x07,	%o4
	fnot2s	%f23,	%f21
	andcc	%g5,	%i5,	%l6
loop_1337:
	popc	%l0,	%l2
	nop
	fitos	%f18,	%f24
	movn	%icc,	%o7,	%g7
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x1C] %asi,	%o1
	fxnors	%f8,	%f7,	%f7
	tneg	%xcc,	0x2
	fbo	%fcc1,	loop_1338
	edge32n	%i0,	%o2,	%i7
	tn	%icc,	0x5
	smulcc	%o5,	0x1488,	%i4
loop_1338:
	fmovrde	%l4,	%f18,	%f6
	fcmpne32	%f22,	%f16,	%l5
	tvc	%xcc,	0x5
	subc	%g4,	%i3,	%o6
	addcc	%i1,	0x126F,	%g6
	faligndata	%f8,	%f28,	%f24
	ldd	[%l7 + 0x18],	%f26
	bcc,pt	%xcc,	loop_1339
	mova	%xcc,	%g2,	%g3
	bpos,a,pt	%icc,	loop_1340
	movpos	%xcc,	%l1,	%o3
loop_1339:
	tne	%xcc,	0x3
	tge	%icc,	0x0
loop_1340:
	edge32	%g1,	%l3,	%i2
	srl	%i6,	0x0F,	%o4
	orncc	%o0,	0x17C4,	%g5
	tl	%icc,	0x4
	subcc	%l6,	%l0,	%i5
	set	0x48, %i5
	stxa	%l2,	[%l7 + %i5] 0x18
	movgu	%xcc,	%g7,	%o7
	add	%o1,	0x0665,	%o2
	sdivcc	%i0,	0x01D2,	%i7
	tneg	%icc,	0x7
	fbuge	%fcc2,	loop_1341
	movn	%icc,	%i4,	%o5
	tsubcc	%l5,	%g4,	%i3
	fmovdneg	%xcc,	%f17,	%f28
loop_1341:
	fbn	%fcc1,	loop_1342
	udiv	%o6,	0x1170,	%i1
	subc	%g6,	0x08F7,	%g2
	fblg	%fcc1,	loop_1343
loop_1342:
	edge8	%g3,	%l4,	%l1
	nop
	setx	0xB5F30D56CA38A53C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f20
	fnands	%f6,	%f4,	%f20
loop_1343:
	prefetch	[%l7 + 0x64],	 0x1
	tgu	%icc,	0x2
	alignaddr	%g1,	%l3,	%i2
	edge16l	%o3,	%o4,	%o0
	sra	%g5,	%l6,	%l0
	fbge,a	%fcc2,	loop_1344
	sra	%i6,	%l2,	%g7
	nop
	setx	0x005390EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	alignaddrl	%o7,	%i5,	%o1
loop_1344:
	alignaddr	%o2,	%i0,	%i7
	ta	%xcc,	0x1
	andncc	%o5,	%i4,	%l5
	srlx	%g4,	%i3,	%i1
	ta	%xcc,	0x2
	ta	%xcc,	0x2
	movrlez	%o6,	0x169,	%g6
	movpos	%icc,	%g3,	%g2
	nop
	fitod	%f8,	%f4
	fdtos	%f4,	%f26
	movrlez	%l4,	0x07B,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x11,	%g1,	%i2
	fmovda	%xcc,	%f15,	%f30
	umulcc	%o3,	0x0EAB,	%l3
	movne	%icc,	%o4,	%g5
	edge32l	%l6,	%l0,	%i6
	fmovscc	%xcc,	%f4,	%f27
	or	%o0,	0x1580,	%g7
	movrgez	%l2,	%i5,	%o1
	fmovda	%icc,	%f27,	%f20
	ldd	[%l7 + 0x68],	%o2
	tleu	%icc,	0x4
	fmovrsne	%i0,	%f28,	%f30
	srax	%i7,	%o7,	%i4
	fmovsge	%xcc,	%f21,	%f21
	xorcc	%l5,	0x0044,	%g4
	fmovdge	%xcc,	%f4,	%f9
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x10] %asi,	%i3
	smul	%o5,	%o6,	%g6
	fmovrdlez	%i1,	%f20,	%f4
	edge16l	%g3,	%l4,	%l1
	nop
	setx	0x705A2D95,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	array32	%g1,	%i2,	%g2
	array32	%o3,	%o4,	%l3
	fmovrse	%g5,	%f23,	%f16
	fba,a	%fcc3,	loop_1345
	brlez	%l6,	loop_1346
	fbge,a	%fcc1,	loop_1347
	ba,a	loop_1348
loop_1345:
	xnorcc	%i6,	%l0,	%g7
loop_1346:
	bleu,a,pn	%icc,	loop_1349
loop_1347:
	tg	%xcc,	0x0
loop_1348:
	andncc	%o0,	%i5,	%o1
	edge16l	%l2,	%i0,	%i7
loop_1349:
	movrgz	%o7,	0x129,	%i4
	tpos	%icc,	0x0
	stbar
	edge32n	%o2,	%g4,	%i3
	fnands	%f16,	%f14,	%f1
	or	%o5,	0x04B9,	%o6
	tneg	%icc,	0x3
	fornot1	%f16,	%f18,	%f26
	movl	%icc,	%l5,	%g6
	popc	%g3,	%l4
	fzero	%f18
	movgu	%icc,	%i1,	%l1
	fbul,a	%fcc2,	loop_1350
	brlz	%i2,	loop_1351
	udivcc	%g1,	0x0A49,	%g2
	movrlz	%o4,	0x311,	%o3
loop_1350:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x54] %asi,	%l3
loop_1351:
	taddcctv	%g5,	0x0870,	%i6
	srl	%l0,	%l6,	%g7
	addccc	%o0,	0x1FF2,	%o1
	movre	%i5,	%l2,	%i7
	edge16	%i0,	%o7,	%i4
	set	0x68, %l0
	prefetcha	[%l7 + %l0] 0x10,	 0x2
	nop
	setx	loop_1352,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdcs	%icc,	%f0,	%f12
	fmovscc	%icc,	%f31,	%f19
	xnor	%g4,	0x0882,	%o5
loop_1352:
	movgu	%xcc,	%o6,	%l5
	fmovsne	%icc,	%f16,	%f22
	movg	%xcc,	%i3,	%g6
	fxor	%f10,	%f24,	%f20
	andcc	%g3,	0x1508,	%i1
	nop
	setx	loop_1353,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8l	%l4,	%l1,	%i2
	set	0x63, %i1
	stba	%g2,	[%l7 + %i1] 0x10
loop_1353:
	bvs,pt	%icc,	loop_1354
	orn	%g1,	%o3,	%l3
	set	0x41, %g1
	stba	%g5,	[%l7 + %g1] 0x2a
	membar	#Sync
loop_1354:
	prefetch	[%l7 + 0x0C],	 0x2
	movleu	%xcc,	%o4,	%l0
	fpadd32s	%f17,	%f21,	%f31
	taddcc	%l6,	%g7,	%i6
	movgu	%icc,	%o1,	%o0
	fornot1s	%f0,	%f14,	%f1
	brz,a	%i5,	loop_1355
	smul	%l2,	0x1A27,	%i0
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x56] %asi,	%o7
loop_1355:
	srax	%i4,	%i7,	%g4
	addccc	%o5,	%o6,	%o2
	fpack32	%f8,	%f10,	%f18
	tpos	%xcc,	0x6
	array16	%i3,	%g6,	%g3
	xor	%i1,	%l5,	%l1
	tvs	%icc,	0x3
	sll	%i2,	%l4,	%g1
	movvs	%xcc,	%o3,	%l3
	addccc	%g5,	0x1ABD,	%g2
	membar	0x02
	ldsh	[%l7 + 0x5A],	%o4
	set	0x25, %g3
	lduba	[%l7 + %g3] 0x19,	%l0
	mova	%icc,	%l6,	%g7
	bg,pn	%xcc,	loop_1356
	movgu	%xcc,	%i6,	%o1
	fmovscc	%icc,	%f26,	%f4
	fmovsne	%xcc,	%f19,	%f21
loop_1356:
	sdiv	%i5,	0x04A5,	%l2
	nop
	setx	0x28E4111D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x7C703AEE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f2,	%f20
	tl	%xcc,	0x1
	alignaddr	%o0,	%i0,	%i4
	fcmpeq16	%f4,	%f24,	%i7
	edge32ln	%o7,	%g4,	%o5
	movne	%icc,	%o2,	%o6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	fbl	%fcc1,	loop_1357
	membar	0x1A
	fpsub32	%f30,	%f18,	%f10
	brgez	%g3,	loop_1358
loop_1357:
	andcc	%i3,	0x072E,	%l5
	fba,a	%fcc2,	loop_1359
	fmovde	%xcc,	%f29,	%f5
loop_1358:
	tne	%icc,	0x3
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x70] %asi,	%l0
loop_1359:
	nop
	fitos	%f7,	%f21
	fstod	%f21,	%f10
	nop
	fitod	%f15,	%f10
	fornot1s	%f4,	%f9,	%f13
	fmovspos	%xcc,	%f2,	%f15
	fbul,a	%fcc2,	loop_1360
	xnor	%i2,	%l4,	%i1
	fnands	%f3,	%f19,	%f30
	sllx	%g1,	0x08,	%l3
loop_1360:
	lduw	[%l7 + 0x50],	%o3
	bge	loop_1361
	add	%g2,	0x01BA,	%o4
	umulcc	%g5,	0x19C8,	%l0
	fmovrsgez	%g7,	%f3,	%f18
loop_1361:
	sethi	0x12BD,	%l6
	set	0x5C, %g7
	stwa	%o1,	[%l7 + %g7] 0x22
	membar	#Sync
	ldsw	[%l7 + 0x10],	%i6
	mulx	%i5,	%l2,	%i0
	brgz	%o0,	loop_1362
	edge32ln	%i4,	%o7,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f12,	%f22,	%f28
loop_1362:
	taddcc	%o5,	%o2,	%o6
	movgu	%xcc,	%i7,	%g6
	fmovdge	%icc,	%f28,	%f14
	subcc	%i3,	0x0B85,	%l5
	udiv	%g3,	0x0650,	%l1
	nop
	setx	loop_1363,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsvc	%xcc,	%f21,	%f29
	fmovdvc	%icc,	%f23,	%f17
	fbule	%fcc1,	loop_1364
loop_1363:
	movcs	%icc,	%i2,	%l4
	orn	%i1,	0x1C7A,	%l3
	edge8l	%g1,	%g2,	%o3
loop_1364:
	movcs	%icc,	%g5,	%l0
	std	%f16,	[%l7 + 0x28]
	orn	%g7,	0x11AF,	%o4
	movleu	%xcc,	%o1,	%l6
	brlz,a	%i5,	loop_1365
	subc	%i6,	0x0D87,	%i0
	umul	%l2,	0x0BB2,	%o0
	movcc	%icc,	%o7,	%i4
loop_1365:
	nop
	fitod	%f4,	%f14
	fdtoi	%f14,	%f15
	mulscc	%g4,	0x1BB9,	%o5
	nop
	setx	loop_1366,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcs	%icc,	%o6,	%i7
	fblg	%fcc2,	loop_1367
	edge32ln	%g6,	%o2,	%i3
loop_1366:
	stw	%l5,	[%l7 + 0x08]
	mulscc	%l1,	0x058F,	%i2
loop_1367:
	movrlez	%g3,	%i1,	%l3
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f28
	fxtod	%f28,	%f28
	fornot2	%f4,	%f18,	%f18
	movleu	%icc,	%g1,	%l4
	fmovdleu	%icc,	%f25,	%f7
	movl	%xcc,	%o3,	%g5
	nop
	setx	0xB0644255,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x2E39AB3A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f21,	%f18
	mulx	%g2,	0x0B3D,	%l0
	fsrc1	%f24,	%f8
	movne	%xcc,	%g7,	%o4
	fblg,a	%fcc0,	loop_1368
	tpos	%xcc,	0x2
	subcc	%l6,	0x1C21,	%o1
	prefetch	[%l7 + 0x58],	 0x1
loop_1368:
	movle	%icc,	%i6,	%i5
	ldsh	[%l7 + 0x62],	%l2
	sdivcc	%i0,	0x04D3,	%o7
	bvs,a,pt	%icc,	loop_1369
	umul	%i4,	0x0076,	%g4
	movcc	%icc,	%o5,	%o6
	xnorcc	%o0,	0x1E8A,	%g6
loop_1369:
	for	%f14,	%f12,	%f18
	move	%xcc,	%o2,	%i7
	brz	%i3,	loop_1370
	fmul8x16al	%f24,	%f30,	%f30
	std	%f14,	[%l7 + 0x40]
	fmovrslez	%l1,	%f1,	%f6
loop_1370:
	tne	%xcc,	0x4
	xnor	%l5,	0x0D07,	%i2
	andcc	%i1,	0x13C3,	%g3
	movg	%xcc,	%l3,	%l4
	set	0x28, %l5
	stwa	%o3,	[%l7 + %l5] 0x88
	fnors	%f4,	%f21,	%f14
	edge8	%g1,	%g5,	%l0
	movcc	%icc,	%g2,	%g7
	mulscc	%l6,	0x12FF,	%o1
	flush	%l7 + 0x38
	sdivcc	%o4,	0x1EA0,	%i6
	membar	0x28
	movn	%xcc,	%i5,	%l2
	subcc	%i0,	0x0F90,	%i4
	movvc	%xcc,	%o7,	%g4
	popc	%o5,	%o6
	or	%g6,	%o0,	%i7
	movvc	%xcc,	%o2,	%l1
	fmovsa	%xcc,	%f19,	%f20
	wr	%g0,	0xe3,	%asi
	stwa	%i3,	[%l7 + 0x44] %asi
	membar	#Sync
	and	%l5,	%i1,	%i2
	alignaddr	%l3,	%g3,	%o3
	bl,a	%xcc,	loop_1371
	fcmple16	%f2,	%f8,	%l4
	xorcc	%g1,	0x12E8,	%g5
	fandnot1s	%f16,	%f16,	%f21
loop_1371:
	bl,a	%xcc,	loop_1372
	subccc	%l0,	0x0C1D,	%g2
	sth	%g7,	[%l7 + 0x26]
	tgu	%xcc,	0x1
loop_1372:
	edge8l	%o1,	%l6,	%i6
	fbu	%fcc1,	loop_1373
	nop
	fitos	%f4,	%f3
	fstox	%f3,	%f24
	tgu	%icc,	0x6
	set	0x1B, %l4
	ldsba	[%l7 + %l4] 0x89,	%i5
loop_1373:
	sdivx	%o4,	0x18AF,	%i0
	bcc,a	%icc,	loop_1374
	mulscc	%l2,	0x0FD2,	%o7
	tg	%xcc,	0x3
	and	%g4,	0x1CDB,	%o5
loop_1374:
	std	%f14,	[%l7 + 0x48]
	fmovsvs	%icc,	%f29,	%f31
	xor	%i4,	%o6,	%o0
	edge8n	%i7,	%o2,	%l1
	movne	%xcc,	%i3,	%l5
	tcs	%xcc,	0x1
	nop
	setx	loop_1375,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%g6,	0x1A17,	%i1
	set	0x71, %o6
	ldsba	[%l7 + %o6] 0x15,	%l3
loop_1375:
	fpack16	%f30,	%f10
	fnands	%f1,	%f12,	%f14
	fbe	%fcc0,	loop_1376
	ldsb	[%l7 + 0x5D],	%i2
	st	%f15,	[%l7 + 0x60]
	fble,a	%fcc0,	loop_1377
loop_1376:
	fone	%f12
	udivcc	%g3,	0x1706,	%l4
	wr	%g0,	0x27,	%asi
	stxa	%o3,	[%l7 + 0x38] %asi
	membar	#Sync
loop_1377:
	movrne	%g5,	%g1,	%l0
	orncc	%g2,	%g7,	%l6
	fnot1	%f8,	%f18
	edge16n	%i6,	%o1,	%o4
	alignaddrl	%i5,	%l2,	%i0
	fsrc2	%f22,	%f8
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	subccc	%g4,	%o7,	%i4
	nop
	fitos	%f3,	%f19
	fstox	%f19,	%f16
	fxtos	%f16,	%f21
	movge	%icc,	%o6,	%o0
	fmovse	%icc,	%f23,	%f28
	nop
	setx	0xEBF2D7D07E29960B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD3B0B7F454DDF455,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f22,	%f18
	fmovdle	%xcc,	%f7,	%f7
	umul	%i7,	%o2,	%l1
	movl	%icc,	%o5,	%l5
	movrgez	%g6,	0x308,	%i1
	edge8n	%i3,	%l3,	%i2
	membar	0x69
	movle	%xcc,	%l4,	%g3
	srl	%o3,	0x12,	%g5
	edge16l	%g1,	%l0,	%g7
	subccc	%g2,	0x06F2,	%l6
	bn	loop_1378
	taddcc	%o1,	%i6,	%i5
	nop
	setx loop_1379, %l0, %l1
	jmpl %l1, %o4
	addcc	%i0,	%l2,	%g4
loop_1378:
	movg	%xcc,	%o7,	%i4
	ldx	[%l7 + 0x20],	%o6
loop_1379:
	stx	%i7,	[%l7 + 0x78]
	lduh	[%l7 + 0x52],	%o0
	movrlz	%o2,	%o5,	%l5
	andn	%l1,	0x031F,	%g6
	fabsd	%f4,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f22,	%f9,	%f14
	set	0x74, %i3
	lda	[%l7 + %i3] 0x10,	%f17
	mova	%xcc,	%i3,	%l3
	subccc	%i1,	%i2,	%l4
	tg	%icc,	0x2
	xnorcc	%o3,	0x1E68,	%g3
	edge16	%g5,	%l0,	%g7
	addcc	%g1,	0x1729,	%g2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x64] %asi,	%l6
	fmovrdgez	%o1,	%f8,	%f4
	tneg	%icc,	0x0
	movg	%icc,	%i6,	%o4
	sdivcc	%i0,	0x1DDA,	%i5
	te	%xcc,	0x5
	stbar
	call	loop_1380
	nop
	fitos	%f9,	%f2
	fstox	%f2,	%f4
	edge32	%l2,	%g4,	%o7
	ta	%icc,	0x2
loop_1380:
	bleu,a,pn	%icc,	loop_1381
	xnor	%i4,	0x1FDD,	%i7
	bvc,a	%icc,	loop_1382
	movg	%xcc,	%o0,	%o2
loop_1381:
	xnorcc	%o5,	0x046D,	%o6
	fbl	%fcc1,	loop_1383
loop_1382:
	fmovdgu	%xcc,	%f30,	%f12
	movne	%icc,	%l5,	%g6
	tcc	%xcc,	0x3
loop_1383:
	swap	[%l7 + 0x34],	%i3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l3,	%i1
	addcc	%i2,	0x0E4D,	%l1
	movvc	%icc,	%o3,	%l4
	tcc	%xcc,	0x5
	or	%g5,	%g3,	%g7
	fexpand	%f0,	%f10
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sub	%g1,	0x1821,	%g2
	ldub	[%l7 + 0x1D],	%l6
	array16	%o1,	%l0,	%o4
	movcs	%icc,	%i6,	%i0
	nop
	setx	0xCE9E954D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x33D5965C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f6,	%f17
	nop
	fitod	%f10,	%f20
	fdtos	%f20,	%f24
	fmovdleu	%xcc,	%f8,	%f8
	mulx	%i5,	%l2,	%g4
	smulcc	%i4,	0x10F9,	%o7
	fnor	%f26,	%f30,	%f2
	andn	%o0,	0x0BC1,	%o2
	mulx	%i7,	%o6,	%l5
	xnorcc	%o5,	%g6,	%l3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i3
	movgu	%icc,	%i2,	%i1
	movvs	%icc,	%o3,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%l4,	%g3
	fands	%f0,	%f16,	%f7
	sethi	0x17C0,	%g7
	tsubcctv	%g5,	0x17B6,	%g1
	movrgez	%l6,	0x0D5,	%o1
	edge16l	%g2,	%l0,	%o4
	std	%f12,	[%l7 + 0x60]
	fbe	%fcc2,	loop_1384
	nop
	setx	0x85D85ED98991B47F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x587DD40D6B3D5252,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f20
	fbl,a	%fcc2,	loop_1385
	tcc	%icc,	0x3
loop_1384:
	movle	%xcc,	%i0,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1385:
	nop
	fitod	%f6,	%f8
	fdtos	%f8,	%f8
	movneg	%icc,	%l2,	%i5
	popc	%i4,	%g4
	addc	%o0,	0x1486,	%o7
	fpadd32s	%f1,	%f19,	%f15
	movcs	%icc,	%i7,	%o2
	fexpand	%f6,	%f12
	addccc	%l5,	%o5,	%g6
	fbu,a	%fcc1,	loop_1386
	orcc	%l3,	%o6,	%i2
	fmovrdgz	%i1,	%f8,	%f22
	fbe,a	%fcc1,	loop_1387
loop_1386:
	tsubcc	%o3,	0x0590,	%i3
	addcc	%l1,	0x159B,	%g3
	udivx	%l4,	0x0DF6,	%g7
loop_1387:
	tn	%icc,	0x4
	xnor	%g1,	0x0875,	%l6
	nop
	setx	0xEE4287E4C0644B5F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	subcc	%o1,	0x052F,	%g5
	orn	%l0,	0x035D,	%o4
	alignaddr	%g2,	%i0,	%i6
	brz	%i5,	loop_1388
	fmovdpos	%xcc,	%f19,	%f16
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%g4
loop_1388:
	fpsub32	%f18,	%f20,	%f4
	mova	%xcc,	%l2,	%o0
	fpsub16	%f0,	%f28,	%f4
	srl	%i7,	0x1D,	%o2
	fble	%fcc1,	loop_1389
	flush	%l7 + 0x70
	sth	%l5,	[%l7 + 0x5A]
	tvc	%xcc,	0x5
loop_1389:
	fbule	%fcc0,	loop_1390
	addcc	%o7,	%o5,	%l3
	taddcctv	%g6,	0x0942,	%o6
	membar	0x75
loop_1390:
	nop
	setx	0xC621EE14904C5FAC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	movpos	%icc,	%i1,	%o3
	movrgz	%i2,	0x3BD,	%l1
	tleu	%icc,	0x7
	ba,a	loop_1391
	sllx	%g3,	0x18,	%l4
	fzero	%f8
	stx	%i3,	[%l7 + 0x60]
loop_1391:
	movpos	%xcc,	%g7,	%g1
	umul	%l6,	0x13E0,	%g5
	smulcc	%o1,	0x1F8A,	%o4
	movrlez	%g2,	%l0,	%i0
	fmovsleu	%xcc,	%f13,	%f1
	tl	%xcc,	0x1
	movvc	%icc,	%i5,	%i4
	udivcc	%i6,	0x09AE,	%g4
	sub	%l2,	0x0218,	%o0
	sth	%i7,	[%l7 + 0x4E]
	brz	%l5,	loop_1392
	movre	%o7,	0x2C2,	%o2
	or	%l3,	0x0F0C,	%g6
	bn,a,pn	%icc,	loop_1393
loop_1392:
	edge8l	%o6,	%i1,	%o3
	movrlz	%i2,	%l1,	%o5
	movre	%g3,	%i3,	%l4
loop_1393:
	edge8l	%g7,	%g1,	%l6
	std	%f10,	[%l7 + 0x28]
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x36] %asi,	%o1
	tneg	%xcc,	0x4
	tleu	%icc,	0x1
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%g5
	fpsub16s	%f12,	%f25,	%f31
	fbug	%fcc2,	loop_1394
	fsrc2	%f26,	%f14
	andncc	%o4,	%l0,	%i0
	movg	%icc,	%g2,	%i5
loop_1394:
	movpos	%icc,	%i4,	%i6
	be	%icc,	loop_1395
	sllx	%l2,	0x19,	%g4
	brlez	%i7,	loop_1396
	nop
	setx	0xFB50FAEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f25
loop_1395:
	andncc	%l5,	%o7,	%o2
	movrlez	%l3,	0x1BF,	%g6
loop_1396:
	bl,a,pn	%icc,	loop_1397
	addccc	%o0,	%o6,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%i1,	%i2
loop_1397:
	movpos	%icc,	%l1,	%g3
	fpadd16s	%f26,	%f20,	%f24
	fsrc2s	%f5,	%f1
	fmovdne	%xcc,	%f27,	%f14
	taddcc	%o5,	0x156D,	%l4
	sra	%g7,	0x03,	%g1
	nop
	fitos	%f10,	%f1
	fstoi	%f1,	%f24
	set	0x3D, %i0
	ldstuba	[%l7 + %i0] 0x18,	%i3
	movne	%xcc,	%o1,	%g5
	srl	%o4,	0x0D,	%l6
	bl	%icc,	loop_1398
	be	loop_1399
	fbne	%fcc0,	loop_1400
	movre	%l0,	%g2,	%i5
loop_1398:
	srl	%i0,	0x06,	%i6
loop_1399:
	andcc	%l2,	0x06BC,	%i4
loop_1400:
	ble,a	%icc,	loop_1401
	sub	%i7,	0x0251,	%l5
	nop
	setx	0xB606A3A6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xDC525250,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f25,	%f15
	tvs	%xcc,	0x7
loop_1401:
	bcc,a,pn	%xcc,	loop_1402
	fones	%f8
	subcc	%g4,	0x0E64,	%o2
	tn	%icc,	0x3
loop_1402:
	alignaddrl	%o7,	%g6,	%o0
	tvc	%icc,	0x1
	sdivx	%o6,	0x0319,	%l3
	tcs	%icc,	0x0
	sdiv	%i1,	0x0A30,	%i2
	fmovrslz	%o3,	%f10,	%f27
	bg	loop_1403
	fpsub32	%f30,	%f30,	%f28
	udivx	%l1,	0x0C93,	%g3
	subcc	%o5,	0x066D,	%l4
loop_1403:
	movrlz	%g1,	%i3,	%g7
	movrne	%o1,	%g5,	%o4
	prefetch	[%l7 + 0x28],	 0x0
	brlez,a	%l6,	loop_1404
	fmovdl	%xcc,	%f6,	%f6
	swap	[%l7 + 0x7C],	%l0
	orncc	%g2,	0x198F,	%i0
loop_1404:
	fmul8x16au	%f8,	%f20,	%f20
	set	0x27, %g2
	stba	%i5,	[%l7 + %g2] 0x2b
	membar	#Sync
	brlz,a	%l2,	loop_1405
	fmovsge	%xcc,	%f5,	%f1
	te	%xcc,	0x7
	addccc	%i4,	%i7,	%i6
loop_1405:
	nop
	wr	%g0,	0x88,	%asi
	sta	%f2,	[%l7 + 0x60] %asi
	movgu	%xcc,	%l5,	%g4
	edge32	%o7,	%o2,	%g6
	fbuge,a	%fcc2,	loop_1406
	fmovdg	%xcc,	%f29,	%f31
	andn	%o0,	%o6,	%i1
	fpack16	%f16,	%f3
loop_1406:
	popc	0x0508,	%i2
	movne	%xcc,	%l3,	%o3
	bl	loop_1407
	subccc	%g3,	0x1570,	%o5
	bgu	%xcc,	loop_1408
	fmovsleu	%icc,	%f19,	%f3
loop_1407:
	fcmpne32	%f4,	%f28,	%l1
	movg	%icc,	%l4,	%g1
loop_1408:
	xnor	%g7,	%o1,	%g5
	edge32	%o4,	%l6,	%l0
	nop
	setx	0x341D4674,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xA606CD66,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f5,	%f15
	membar	0x67
	subccc	%i3,	%i0,	%i5
	movrgz	%g2,	%i4,	%l2
	tn	%xcc,	0x3
	edge8ln	%i6,	%l5,	%g4
	movrlez	%i7,	0x151,	%o2
	tle	%xcc,	0x1
	prefetch	[%l7 + 0x44],	 0x3
	taddcctv	%g6,	%o0,	%o6
	taddcc	%i1,	0x0330,	%o7
	addccc	%i2,	0x0F41,	%o3
	alignaddr	%g3,	%l3,	%l1
	array32	%l4,	%o5,	%g1
	movre	%o1,	%g5,	%g7
	fmovrsgz	%o4,	%f20,	%f27
	addccc	%l0,	%l6,	%i0
	udivcc	%i5,	0x0AE0,	%g2
	fmovse	%xcc,	%f30,	%f8
	edge32l	%i4,	%l2,	%i3
	fexpand	%f12,	%f22
	srlx	%l5,	%i6,	%g4
	tle	%icc,	0x6
	movrgz	%i7,	0x182,	%o2
	nop
	setx	loop_1409,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	add	%g6,	0x1200,	%o0
	edge32ln	%o6,	%o7,	%i1
	edge32n	%i2,	%o3,	%g3
loop_1409:
	fpackfix	%f14,	%f26
	popc	0x1587,	%l3
	fmovdneg	%icc,	%f29,	%f27
	taddcctv	%l1,	%l4,	%g1
	movg	%icc,	%o5,	%g5
	lduw	[%l7 + 0x4C],	%g7
	movpos	%xcc,	%o4,	%l0
	fpadd16s	%f8,	%f29,	%f21
	faligndata	%f10,	%f24,	%f26
	bneg,pt	%xcc,	loop_1410
	fmul8ulx16	%f2,	%f16,	%f22
	ble,a	%icc,	loop_1411
	fcmpne32	%f2,	%f24,	%o1
loop_1410:
	orn	%i0,	0x04F7,	%i5
	umul	%g2,	0x06BD,	%l6
loop_1411:
	edge32l	%l2,	%i3,	%l5
	alignaddr	%i6,	%i4,	%g4
	srl	%o2,	%i7,	%g6
	wr	%g0,	0x04,	%asi
	sta	%f31,	[%l7 + 0x54] %asi
	fnand	%f28,	%f16,	%f20
	ba,pt	%icc,	loop_1412
	nop
	fitos	%f26,	%f25
	subccc	%o0,	0x1631,	%o7
	tleu	%icc,	0x7
loop_1412:
	nop
	fitos	%f14,	%f1
	fstoi	%f1,	%f24
	ldsh	[%l7 + 0x3E],	%i1
	bvc,pn	%xcc,	loop_1413
	ta	%icc,	0x7
	fbe,a	%fcc0,	loop_1414
	edge8	%i2,	%o6,	%g3
loop_1413:
	movvs	%icc,	%l3,	%l1
	sllx	%l4,	0x0E,	%o3
loop_1414:
	fba	%fcc3,	loop_1415
	tsubcc	%g1,	%g5,	%g7
	tle	%xcc,	0x0
	movne	%icc,	%o5,	%l0
loop_1415:
	addcc	%o1,	0x118E,	%i0
	movrlez	%o4,	0x3A0,	%i5
	ta	%xcc,	0x2
	edge32ln	%g2,	%l2,	%i3
	smul	%l6,	%i6,	%l5
	movrne	%i4,	%g4,	%o2
	fmovdge	%icc,	%f8,	%f29
	nop
	setx	0x6040A5F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	fmovrse	%i7,	%f12,	%f20
	movrlz	%o0,	%o7,	%i1
	sra	%g6,	%i2,	%g3
	nop
	setx	0xE39932CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x9875C55E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f15,	%f31
	sdiv	%o6,	0x00BB,	%l3
	fmuld8ulx16	%f7,	%f25,	%f8
	wr	%g0,	0x27,	%asi
	stwa	%l4,	[%l7 + 0x34] %asi
	membar	#Sync
	tn	%icc,	0x4
	xor	%o3,	0x1D28,	%g1
	smulcc	%l1,	%g5,	%o5
	sdivcc	%g7,	0x10F3,	%l0
	smulcc	%i0,	0x0108,	%o1
	subcc	%o4,	%i5,	%l2
	edge8ln	%g2,	%i3,	%l6
	movrgez	%l5,	%i6,	%i4
	tg	%xcc,	0x0
	set	0x10, %g5
	lduwa	[%l7 + %g5] 0x81,	%o2
	subccc	%i7,	0x0766,	%g4
	fbo,a	%fcc1,	loop_1416
	tcs	%icc,	0x7
	fble,a	%fcc3,	loop_1417
	fnors	%f5,	%f8,	%f16
loop_1416:
	sra	%o0,	0x15,	%i1
	movgu	%icc,	%g6,	%o7
loop_1417:
	movn	%icc,	%g3,	%o6
	fnors	%f7,	%f29,	%f27
	udiv	%l3,	0x0C2D,	%i2
	tvc	%icc,	0x5
	set	0x34, %i2
	lda	[%l7 + %i2] 0x11,	%f9
	sub	%l4,	0x17E8,	%o3
	fxnor	%f10,	%f0,	%f6
	stb	%g1,	[%l7 + 0x22]
	nop
	set	0x64, %i6
	prefetch	[%l7 + %i6],	 0x0
	mulscc	%l1,	%o5,	%g7
	fcmpgt16	%f10,	%f18,	%l0
	edge8l	%g5,	%o1,	%i0
	fmovdvc	%xcc,	%f0,	%f22
	fmovdpos	%xcc,	%f5,	%f17
	movl	%icc,	%o4,	%l2
	movrlz	%g2,	0x3FF,	%i3
	sllx	%l6,	%l5,	%i6
	prefetch	[%l7 + 0x48],	 0x1
	edge16n	%i4,	%i5,	%o2
	sra	%i7,	0x03,	%g4
	fmovsvc	%icc,	%f30,	%f30
	fmul8x16au	%f24,	%f26,	%f30
	ldd	[%l7 + 0x20],	%o0
	array32	%i1,	%o7,	%g6
	tcc	%xcc,	0x0
	nop
	set	0x2F, %l6
	stb	%g3,	[%l7 + %l6]
	fmovdg	%icc,	%f18,	%f7
	tsubcctv	%o6,	%i2,	%l3
	wr	%g0,	0x2a,	%asi
	stwa	%o3,	[%l7 + 0x14] %asi
	membar	#Sync
	fpsub32	%f16,	%f2,	%f28
	movre	%g1,	%l1,	%o5
	subcc	%l4,	0x11E7,	%g7
	mulx	%g5,	0x1C9B,	%o1
	brgz,a	%i0,	loop_1418
	addccc	%l0,	%l2,	%g2
	array8	%i3,	%o4,	%l6
	nop
	fitod	%f16,	%f18
loop_1418:
	xorcc	%i6,	%i4,	%l5
	or	%i5,	0x06F3,	%i7
	movrgz	%g4,	0x227,	%o2
	andn	%o0,	0x0FC8,	%i1
	xnor	%g6,	%g3,	%o6
	andn	%i2,	%l3,	%o7
	sll	%o3,	%l1,	%g1
	fnot1	%f26,	%f8
	ba,pt	%xcc,	loop_1419
	fcmple16	%f2,	%f28,	%o5
	movrgez	%g7,	0x262,	%g5
	fbug	%fcc2,	loop_1420
loop_1419:
	fmuld8sux16	%f23,	%f12,	%f28
	fmovrde	%l4,	%f8,	%f16
	movrlz	%i0,	%o1,	%l0
loop_1420:
	xnor	%g2,	%i3,	%l2
	fmovspos	%icc,	%f6,	%f29
	fbul	%fcc1,	loop_1421
	tge	%icc,	0x3
	array8	%o4,	%l6,	%i6
	andcc	%i4,	0x0744,	%i5
loop_1421:
	edge16	%l5,	%g4,	%o2
	sllx	%o0,	%i7,	%i1
	fbue,a	%fcc0,	loop_1422
	edge16l	%g6,	%o6,	%g3
	fbug	%fcc3,	loop_1423
	mulscc	%i2,	%l3,	%o3
loop_1422:
	fnegs	%f28,	%f6
	xnorcc	%o7,	0x16C1,	%l1
loop_1423:
	nop
	set	0x7C, %o1
	lduwa	[%l7 + %o1] 0x10,	%g1
	fpsub16s	%f4,	%f29,	%f7
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fcmpeq16	%f14,	%f0,	%g7
	tl	%xcc,	0x4
	movrlez	%g5,	0x251,	%l4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x64] %asi,	%o5
	movvc	%icc,	%i0,	%l0
	nop
	setx	0xCB4FA7376FE5E496,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f10
	tge	%xcc,	0x6
	tleu	%icc,	0x7
	edge16ln	%g2,	%o1,	%l2
	nop
	setx	0x06C5BBF8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x1D9C7406,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f25,	%f7
	nop
	setx	0x759FE0A8FD9B3E3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x037457C048D922F7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f30,	%f6
	edge16ln	%o4,	%i3,	%i6
	nop
	setx	0x9A8577656063476D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	sll	%l6,	%i4,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l5,	%o2,	%g4
	fbne	%fcc1,	loop_1424
	fmovdl	%icc,	%f6,	%f27
	subcc	%o0,	0x1BFE,	%i1
	ldsw	[%l7 + 0x10],	%i7
loop_1424:
	sra	%g6,	%o6,	%g3
	udiv	%l3,	0x00A7,	%o3
	stbar
	srl	%i2,	0x13,	%o7
	brgez,a	%l1,	loop_1425
	alignaddrl	%g7,	%g5,	%g1
	set	0x18, %o2
	ldxa	[%g0 + %o2] 0x20,	%o5
loop_1425:
	fbul,a	%fcc2,	loop_1426
	edge8	%l4,	%i0,	%g2
	edge32n	%o1,	%l2,	%o4
	nop
	setx	0xBEBD696E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xB8FB3036,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f26,	%f20
loop_1426:
	fmovsa	%icc,	%f24,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f14,	%f24
	fstox	%f24,	%f18
	sub	%l0,	0x02EB,	%i6
	fbuge	%fcc3,	loop_1427
	nop
	set	0x44, %o3
	lduw	[%l7 + %o3],	%i3
	edge8l	%i4,	%l6,	%l5
	bcc,a	loop_1428
loop_1427:
	fpadd16s	%f27,	%f21,	%f6
	fcmple16	%f20,	%f24,	%o2
	subccc	%g4,	0x1E4D,	%o0
loop_1428:
	xorcc	%i5,	0x0A48,	%i1
	xnorcc	%g6,	0x01D1,	%o6
	ld	[%l7 + 0x3C],	%f4
	ldsw	[%l7 + 0x1C],	%i7
	smulcc	%l3,	0x11B2,	%o3
	tgu	%xcc,	0x0
	udivcc	%g3,	0x0BE4,	%i2
	movg	%xcc,	%l1,	%o7
	tcc	%icc,	0x3
	nop
	setx	0x34BE443B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xEC31562F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f24,	%f4
	xorcc	%g7,	%g1,	%o5
	fmuld8ulx16	%f0,	%f21,	%f26
	nop
	setx	0x81FD6C2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x4A8A326F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f21,	%f5
	set	0x58, %i7
	ldswa	[%l7 + %i7] 0x11,	%l4
	tvc	%xcc,	0x6
	movneg	%icc,	%i0,	%g5
	sir	0x1565
	fble,a	%fcc2,	loop_1429
	tleu	%xcc,	0x1
	sethi	0x097E,	%o1
	addccc	%l2,	0x12DD,	%g2
loop_1429:
	fmovrslez	%l0,	%f30,	%f31
	xorcc	%o4,	0x1F03,	%i6
	edge16ln	%i4,	%l6,	%i3
	te	%icc,	0x4
	edge8n	%l5,	%g4,	%o0
	array32	%o2,	%i5,	%i1
	fandnot2s	%f5,	%f29,	%f2
	fmovspos	%xcc,	%f29,	%f19
	umulcc	%g6,	%o6,	%l3
	fnors	%f18,	%f30,	%f25
	fpsub32	%f30,	%f12,	%f26
	fmovrde	%o3,	%f22,	%f12
	ldx	[%l7 + 0x28],	%i7
	fmuld8sux16	%f2,	%f4,	%f18
	edge32	%i2,	%g3,	%o7
	bleu	%icc,	loop_1430
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l1,	%g1
	fbl,a	%fcc1,	loop_1431
loop_1430:
	movpos	%icc,	%o5,	%g7
	fzeros	%f8
	xor	%l4,	%g5,	%i0
loop_1431:
	edge16	%o1,	%l2,	%l0
	movre	%g2,	0x3DE,	%i6
	subccc	%o4,	0x1B78,	%i4
	fbn,a	%fcc1,	loop_1432
	xnor	%l6,	0x0DD8,	%l5
	edge16	%g4,	%o0,	%o2
	fmovsn	%xcc,	%f28,	%f6
loop_1432:
	edge32	%i3,	%i5,	%g6
	tge	%xcc,	0x4
	wr	%g0,	0x2b,	%asi
	stba	%i1,	[%l7 + 0x43] %asi
	membar	#Sync
	smul	%l3,	%o6,	%o3
	fmul8ulx16	%f4,	%f12,	%f6
	nop
	setx	0x3C569D06206AD396,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fpsub16	%f28,	%f24,	%f20
	andn	%i7,	0x1D43,	%i2
	tl	%xcc,	0x2
	add	%g3,	0x0980,	%l1
	movgu	%icc,	%o7,	%o5
	movcs	%icc,	%g7,	%g1
	fbg	%fcc2,	loop_1433
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l4,	%i0,	%o1
	fble,a	%fcc2,	loop_1434
loop_1433:
	xor	%l2,	0x16A3,	%l0
	sdiv	%g5,	0x1C29,	%i6
	fsrc2	%f28,	%f10
loop_1434:
	nop
	setx	0xED694E2D50577F4C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	tsubcctv	%o4,	0x0E05,	%g2
	edge16ln	%l6,	%l5,	%i4
	subccc	%o0,	%o2,	%g4
	set	0x58, %i4
	stxa	%i5,	[%l7 + %i4] 0x2f
	membar	#Sync
	edge8n	%g6,	%i3,	%l3
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	tge	%xcc,	0x2
	orncc	%o3,	0x1EEE,	%o6
	nop
	setx	0x339EB5371BB18483,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x7F3A0F63B57818B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f8,	%f10
	te	%xcc,	0x3
	edge32n	%i7,	%i2,	%g3
	addccc	%o7,	0x1A27,	%o5
	ldub	[%l7 + 0x74],	%g7
	tl	%xcc,	0x7
	fbn	%fcc3,	loop_1435
	fmovdge	%xcc,	%f11,	%f17
	edge8	%l1,	%g1,	%i0
	fmovdpos	%xcc,	%f1,	%f27
loop_1435:
	srax	%l4,	%l2,	%o1
	srax	%g5,	0x19,	%i6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x0C] %asi,	%f10
	fornot2s	%f12,	%f24,	%f3
	nop
	fitos	%f2,	%f12
	fstod	%f12,	%f24
	sll	%l0,	0x09,	%g2
	fbule,a	%fcc2,	loop_1436
	tcs	%xcc,	0x2
	fmovrsgz	%l6,	%f20,	%f5
	nop
	setx	0xA2704B95,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f8
loop_1436:
	and	%l5,	0x0C7C,	%o4
	smulcc	%o0,	0x1F3A,	%o2
	subcc	%g4,	0x18B3,	%i4
	sll	%g6,	%i5,	%l3
	ld	[%l7 + 0x68],	%f25
	movvs	%icc,	%i1,	%i3
	sdiv	%o6,	0x1061,	%i7
	fcmpgt32	%f12,	%f14,	%o3
	tne	%icc,	0x7
	tcc	%icc,	0x0
	ba	loop_1437
	tl	%icc,	0x0
	orcc	%i2,	0x0428,	%g3
	subcc	%o7,	%g7,	%l1
loop_1437:
	for	%f24,	%f26,	%f22
	bge,pn	%icc,	loop_1438
	orcc	%g1,	0x0BDD,	%i0
	popc	%l4,	%l2
	edge32ln	%o1,	%g5,	%o5
loop_1438:
	subccc	%l0,	0x08F3,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%i6,	%l5,	%l6
	set	0x6A, %o4
	ldstuba	[%l7 + %o4] 0x18,	%o0
	sll	%o4,	%g4,	%i4
	movrgez	%o2,	0x294,	%g6
	edge32	%i5,	%l3,	%i3
	fmovdge	%xcc,	%f4,	%f2
	srlx	%i1,	%i7,	%o3
	sllx	%o6,	0x05,	%i2
	movrne	%o7,	0x3FF,	%g3
	nop
	setx	loop_1439,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8sux16	%f0,	%f19,	%f6
	mulscc	%l1,	%g7,	%i0
	nop
	setx	0x5D81C6F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f13
loop_1439:
	sllx	%g1,	%l4,	%o1
	array8	%l2,	%o5,	%g5
	sll	%g2,	0x14,	%l0
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%l5
	edge8n	%l6,	%o0,	%o4
	srlx	%i6,	0x04,	%i4
	movrlz	%g4,	%o2,	%g6
	nop
	setx	0x27811A610068C440,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	prefetch	[%l7 + 0x78],	 0x0
	andncc	%l3,	%i5,	%i1
	srlx	%i7,	%o3,	%i3
	tcc	%xcc,	0x1
	fblg,a	%fcc1,	loop_1440
	movge	%icc,	%o6,	%o7
	addccc	%g3,	%l1,	%i2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x08] %asi,	%i0
loop_1440:
	movge	%icc,	%g7,	%g1
	ta	%icc,	0x6
	edge8ln	%o1,	%l2,	%o5
	tle	%xcc,	0x6
	fmuld8ulx16	%f6,	%f20,	%f26
	edge8l	%g5,	%l4,	%l0
	std	%f14,	[%l7 + 0x28]
	sra	%g2,	0x04,	%l5
	ldsh	[%l7 + 0x3E],	%o0
	brz,a	%l6,	loop_1441
	fcmple32	%f8,	%f28,	%o4
	fmul8x16	%f21,	%f0,	%f6
	movpos	%xcc,	%i4,	%i6
loop_1441:
	xnorcc	%o2,	0x0F42,	%g4
	fbg	%fcc0,	loop_1442
	array8	%g6,	%l3,	%i5
	movvs	%icc,	%i7,	%i1
	addc	%i3,	%o3,	%o6
loop_1442:
	nop
	set	0x30, %l1
	lda	[%l7 + %l1] 0x18,	%f11
	bcs,pt	%xcc,	loop_1443
	std	%f4,	[%l7 + 0x60]
	orn	%o7,	0x117E,	%g3
	tvs	%xcc,	0x2
loop_1443:
	sethi	0x16AF,	%l1
	fmovspos	%xcc,	%f28,	%f14
	and	%i2,	0x0752,	%g7
	bneg	%xcc,	loop_1444
	fabss	%f8,	%f5
	fmovrdne	%g1,	%f2,	%f6
	fmovs	%f31,	%f0
loop_1444:
	nop
	setx	0x849E649474DDDC6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xDE39FD95F9E9849D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f28,	%f0
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f26
	fxtod	%f26,	%f30
	xnorcc	%o1,	0x0F53,	%i0
	sdivcc	%o5,	0x1C1C,	%l2
	sdivcc	%l4,	0x11C2,	%l0
	ldub	[%l7 + 0x4F],	%g2
	movcc	%xcc,	%g5,	%o0
	edge32ln	%l5,	%o4,	%l6
	bneg	loop_1445
	addccc	%i4,	0x120B,	%o2
	xor	%g4,	%g6,	%l3
	edge16n	%i6,	%i5,	%i7
loop_1445:
	subccc	%i3,	0x17A6,	%o3
	fpadd32	%f22,	%f12,	%f30
	ld	[%l7 + 0x1C],	%f3
	be	%icc,	loop_1446
	movle	%icc,	%o6,	%o7
	movrlz	%i1,	%l1,	%i2
	movcs	%xcc,	%g7,	%g3
loop_1446:
	subc	%g1,	%i0,	%o1
	tneg	%icc,	0x1
	ldsb	[%l7 + 0x27],	%l2
	fzero	%f20
	fmovsgu	%icc,	%f12,	%f31
	fba,a	%fcc3,	loop_1447
	xorcc	%o5,	%l4,	%l0
	udivx	%g5,	0x1A56,	%o0
	fmovsa	%xcc,	%f16,	%f19
loop_1447:
	sub	%g2,	%o4,	%l6
	fcmpeq16	%f10,	%f20,	%l5
	xnor	%i4,	%g4,	%g6
	taddcctv	%o2,	%l3,	%i6
	movvs	%xcc,	%i5,	%i7
	fbe	%fcc0,	loop_1448
	alignaddrl	%i3,	%o6,	%o7
	fmovsl	%icc,	%f19,	%f2
	edge32l	%o3,	%i1,	%i2
loop_1448:
	fandnot2s	%f2,	%f21,	%f18
	addc	%l1,	0x1C3A,	%g7
	movn	%icc,	%g3,	%g1
	srl	%o1,	%i0,	%l2
	xnor	%o5,	0x107B,	%l0
	movpos	%icc,	%l4,	%o0
	std	%f6,	[%l7 + 0x70]
	fbule,a	%fcc1,	loop_1449
	sra	%g5,	0x13,	%o4
	movrlez	%g2,	0x0AB,	%l5
	addccc	%l6,	0x17E6,	%g4
loop_1449:
	fbue,a	%fcc0,	loop_1450
	sra	%i4,	%g6,	%o2
	tsubcctv	%l3,	0x18D9,	%i6
	fornot2s	%f23,	%f20,	%f28
loop_1450:
	fpadd16s	%f28,	%f2,	%f2
	fmovdn	%icc,	%f10,	%f19
	nop
	setx	0xB62D598F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x67CBB3A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f0,	%f16
	udiv	%i5,	0x16B0,	%i3
	andcc	%o6,	%i7,	%o7
	alignaddrl	%i1,	%i2,	%o3
	nop
	setx	0xC857DD9F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x58EE4A8C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f21,	%f24
	andncc	%g7,	%l1,	%g1
	movrgz	%g3,	%i0,	%l2
	smul	%o1,	%l0,	%l4
	bcs,a	%icc,	loop_1451
	mova	%xcc,	%o0,	%o5
	stbar
	xorcc	%g5,	0x19A7,	%g2
loop_1451:
	fmovrdgz	%o4,	%f2,	%f30
	edge32l	%l5,	%g4,	%i4
	fpackfix	%f16,	%f0
	sub	%l6,	0x1FA5,	%g6
	movrne	%o2,	%l3,	%i6
	fbge	%fcc0,	loop_1452
	srlx	%i3,	0x1E,	%o6
	tsubcc	%i7,	0x0AFF,	%i5
	prefetch	[%l7 + 0x1C],	 0x0
loop_1452:
	nop
	fitod	%f0,	%f8
	fdtos	%f8,	%f3
	bgu	loop_1453
	fxnor	%f0,	%f6,	%f30
	movleu	%xcc,	%i1,	%o7
	fcmpeq16	%f10,	%f16,	%i2
loop_1453:
	tpos	%icc,	0x7
	fcmpeq32	%f6,	%f8,	%g7
	ld	[%l7 + 0x54],	%f16
	tl	%icc,	0x6
	movneg	%xcc,	%l1,	%o3
	array8	%g3,	%i0,	%l2
	fandnot2s	%f28,	%f11,	%f15
	udivx	%o1,	0x1783,	%g1
	fmuld8sux16	%f25,	%f16,	%f28
	popc	0x0BC4,	%l0
	xnorcc	%o0,	%l4,	%g5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%g2
	array16	%o4,	%o5,	%l5
	bcs,a	loop_1454
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x7
	fmovdvs	%icc,	%f26,	%f19
loop_1454:
	bge,a	loop_1455
	edge16l	%g4,	%i4,	%l6
	fblg	%fcc1,	loop_1456
	taddcctv	%o2,	%l3,	%g6
loop_1455:
	fmovrslez	%i6,	%f17,	%f16
	xnorcc	%o6,	0x05D9,	%i7
loop_1456:
	fbl,a	%fcc2,	loop_1457
	sll	%i5,	%i1,	%o7
	bpos,pt	%xcc,	loop_1458
	andncc	%i2,	%i3,	%l1
loop_1457:
	edge16	%g7,	%g3,	%o3
	ba	%xcc,	loop_1459
loop_1458:
	nop
	set	0x78, %l2
	prefetch	[%l7 + %l2],	 0x0
	tgu	%icc,	0x6
	fmovsge	%icc,	%f5,	%f17
loop_1459:
	nop
	set	0x0E, %g6
	lduha	[%l7 + %g6] 0x19,	%i0
	movleu	%xcc,	%o1,	%g1
	ble	loop_1460
	and	%l0,	%o0,	%l2
	be,a	%icc,	loop_1461
	fmovdge	%xcc,	%f6,	%f30
loop_1460:
	or	%l4,	0x1708,	%g2
	srax	%g5,	0x1E,	%o5
loop_1461:
	fbule,a	%fcc2,	loop_1462
	array16	%o4,	%l5,	%i4
	fba	%fcc2,	loop_1463
	fpadd16	%f14,	%f8,	%f10
loop_1462:
	sllx	%g4,	0x0E,	%l6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%g6
loop_1463:
	edge16	%o2,	%i6,	%i7
	srax	%o6,	%i1,	%o7
	movre	%i2,	%i3,	%l1
	xnorcc	%i5,	0x1F04,	%g7
	movrlz	%o3,	%i0,	%o1
	ldsh	[%l7 + 0x0C],	%g1
	fnot2s	%f1,	%f11
	addcc	%l0,	%o0,	%g3
	sethi	0x1B02,	%l2
	sllx	%g2,	0x0B,	%l4
	flush	%l7 + 0x60
	tge	%icc,	0x3
	srax	%g5,	%o4,	%l5
	set	0x7C, %o5
	stba	%o5,	[%l7 + %o5] 0xe2
	membar	#Sync
	srax	%i4,	%l6,	%g4
	alignaddrl	%l3,	%g6,	%o2
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x18
	fbe	%fcc2,	loop_1464
	fbe,a	%fcc2,	loop_1465
	brlez,a	%i6,	loop_1466
	edge16ln	%o6,	%i1,	%i7
loop_1464:
	movrne	%i2,	%o7,	%l1
loop_1465:
	tsubcc	%i3,	%g7,	%i5
loop_1466:
	srl	%o3,	%o1,	%g1
	alignaddrl	%i0,	%l0,	%o0
	fpack16	%f16,	%f0
	fmovd	%f10,	%f16
	te	%icc,	0x0
	edge16ln	%g3,	%g2,	%l2
	tleu	%icc,	0x4
	popc	%g5,	%l4
	stw	%o4,	[%l7 + 0x4C]
	sub	%l5,	0x1F61,	%o5
	movgu	%xcc,	%l6,	%i4
	edge8ln	%g4,	%g6,	%o2
	tsubcctv	%i6,	%o6,	%l3
	tne	%icc,	0x6
	xnor	%i1,	%i2,	%o7
	movrgz	%l1,	%i7,	%g7
	taddcctv	%i5,	0x0168,	%o3
	srlx	%i3,	%o1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g1,	0x192E,	%l0
	ldx	[%l7 + 0x60],	%g3
	movrgz	%o0,	0x221,	%g2
	call	loop_1467
	edge8ln	%g5,	%l4,	%o4
	movrlz	%l2,	0x37B,	%l5
	set	0x40, %o0
	stda	%f16,	[%l7 + %o0] 0x80
loop_1467:
	fones	%f6
	smul	%o5,	0x13B7,	%l6
	sra	%i4,	%g4,	%g6
	popc	0x0F51,	%o2
	andcc	%o6,	%l3,	%i1
	tvc	%icc,	0x6
	ta	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i2,	%i6,	%l1
	ldsh	[%l7 + 0x50],	%o7
	fmovdgu	%icc,	%f24,	%f12
	fpadd16s	%f4,	%f23,	%f17
	sra	%i7,	%g7,	%o3
	movne	%xcc,	%i3,	%i5
	move	%xcc,	%o1,	%g1
	edge8n	%i0,	%g3,	%o0
	tn	%xcc,	0x1
	fmovd	%f2,	%f26
	movgu	%icc,	%l0,	%g2
	fexpand	%f7,	%f16
	umulcc	%l4,	%o4,	%g5
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	udiv	%l2,	0x19E2,	%o5
	fbl	%fcc1,	loop_1468
	movpos	%xcc,	%l6,	%g4
	nop
	set	0x52, %o7
	lduh	[%l7 + %o7],	%g6
	xor	%i4,	%o2,	%l3
loop_1468:
	tle	%icc,	0x4
	bne,pt	%icc,	loop_1469
	srlx	%i1,	0x19,	%i2
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i6
loop_1469:
	movrlz	%l1,	%o7,	%o6
	orcc	%g7,	%i7,	%i3
	nop
	setx	loop_1470,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlz,a	%o3,	loop_1471
	fmovsvs	%xcc,	%f25,	%f7
	edge16ln	%o1,	%i5,	%g1
loop_1470:
	ldub	[%l7 + 0x43],	%i0
loop_1471:
	tge	%xcc,	0x2
	tvs	%xcc,	0x6
	tcc	%xcc,	0x4
	movneg	%xcc,	%g3,	%l0
	lduw	[%l7 + 0x1C],	%o0
	srl	%l4,	%o4,	%g2
	udivx	%g5,	0x14D0,	%l5
	movleu	%icc,	%o5,	%l2
	tsubcc	%l6,	%g4,	%g6
	membar	0x17
	movrne	%o2,	0x0E7,	%l3
	tne	%icc,	0x4
	ldx	[%l7 + 0x58],	%i4
	swap	[%l7 + 0x28],	%i1
	fbug,a	%fcc0,	loop_1472
	nop
	setx	0x39BB6A9D205525F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fnot2s	%f31,	%f18
	mulx	%i2,	%i6,	%l1
loop_1472:
	srax	%o6,	%g7,	%o7
	edge32l	%i3,	%o3,	%o1
	tsubcctv	%i7,	0x07AF,	%g1
	tvc	%icc,	0x5
	bge,pn	%xcc,	loop_1473
	orn	%i5,	0x1C95,	%g3
	edge16n	%i0,	%o0,	%l4
	movge	%icc,	%o4,	%g2
loop_1473:
	tvc	%icc,	0x2
	fmovdvc	%icc,	%f6,	%f29
	fcmpgt32	%f28,	%f26,	%l0
	alignaddr	%g5,	%o5,	%l5
	sdiv	%l6,	0x0CC7,	%l2
	sll	%g6,	%g4,	%o2
	fnand	%f20,	%f8,	%f4
	add	%i4,	%i1,	%i2
	addc	%i6,	%l3,	%l1
	brz	%o6,	loop_1474
	std	%f8,	[%l7 + 0x40]
	fmovdge	%xcc,	%f12,	%f8
	fmovsleu	%icc,	%f22,	%f13
loop_1474:
	stw	%g7,	[%l7 + 0x1C]
	smul	%i3,	%o3,	%o1
	ba,a,pn	%icc,	loop_1475
	fnot2s	%f27,	%f2
	fbge	%fcc2,	loop_1476
	xor	%o7,	0x1966,	%g1
loop_1475:
	sdiv	%i7,	0x1617,	%g3
	fbuge,a	%fcc1,	loop_1477
loop_1476:
	tpos	%xcc,	0x1
	taddcc	%i5,	%i0,	%l4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x10] %asi,	%o4
loop_1477:
	nop
	set	0x34, %g4
	lduw	[%l7 + %g4],	%o0
	ba,a	loop_1478
	fpadd32s	%f27,	%f26,	%f2
	stbar
	orncc	%g2,	0x0014,	%g5
loop_1478:
	brlz,a	%l0,	loop_1479
	smulcc	%l5,	0x100D,	%l6
	fpadd16s	%f15,	%f10,	%f19
	mova	%icc,	%o5,	%l2
loop_1479:
	fbuge	%fcc3,	loop_1480
	brnz	%g6,	loop_1481
	edge16l	%o2,	%i4,	%g4
	fcmpeq16	%f18,	%f16,	%i2
loop_1480:
	orcc	%i6,	%l3,	%l1
loop_1481:
	andncc	%i1,	%g7,	%i3
	edge8n	%o3,	%o1,	%o6
	sra	%g1,	0x03,	%i7
	ldsb	[%l7 + 0x3B],	%o7
	smul	%g3,	%i0,	%l4
	brlz	%i5,	loop_1482
	fnors	%f8,	%f24,	%f29
	movn	%icc,	%o4,	%g2
	taddcctv	%g5,	0x0EF8,	%o0
loop_1482:
	add	%l5,	0x0D63,	%l0
	mova	%icc,	%l6,	%o5
	sub	%g6,	0x1E39,	%l2
	fba,a	%fcc3,	loop_1483
	fmovsne	%xcc,	%f1,	%f25
	subccc	%i4,	%g4,	%o2
	orcc	%i6,	0x0E6D,	%i2
loop_1483:
	fornot1	%f16,	%f30,	%f10
	nop
	setx	0xC6C8035499A6F2B5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f6
	movrlz	%l3,	%l1,	%g7
	fnot2	%f6,	%f16
	tneg	%xcc,	0x2
	fmuld8ulx16	%f22,	%f21,	%f12
	call	loop_1484
	edge32n	%i1,	%o3,	%i3
	fmovdpos	%icc,	%f6,	%f11
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x58] %asi,	%o1
loop_1484:
	membar	0x26
	fandnot1	%f0,	%f16,	%f20
	addccc	%g1,	0x1AE9,	%i7
	fblg	%fcc1,	loop_1485
	xnor	%o6,	%g3,	%o7
	fbe,a	%fcc3,	loop_1486
	fpadd16s	%f5,	%f11,	%f27
loop_1485:
	tle	%xcc,	0x0
	movne	%xcc,	%i0,	%i5
loop_1486:
	fnands	%f15,	%f29,	%f6
	brz	%l4,	loop_1487
	movleu	%icc,	%g2,	%o4
	bge,a,pn	%xcc,	loop_1488
	xorcc	%g5,	%l5,	%o0
loop_1487:
	xnorcc	%l6,	%o5,	%g6
	ldsh	[%l7 + 0x62],	%l0
loop_1488:
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f16
	fble	%fcc3,	loop_1489
	movvs	%xcc,	%l2,	%g4
	bne,a	%icc,	loop_1490
	ldsw	[%l7 + 0x50],	%o2
loop_1489:
	fmovrdgez	%i4,	%f26,	%f6
	tn	%xcc,	0x3
loop_1490:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%i2,	[%l7 + 0x24] %asi
	fpadd32s	%f1,	%f31,	%f28
	set	0x63, %l0
	ldsba	[%l7 + %l0] 0x18,	%l3
	brlez	%i6,	loop_1491
	tcs	%icc,	0x0
	fmul8sux16	%f20,	%f22,	%f16
	orcc	%l1,	%i1,	%g7
loop_1491:
	srax	%o3,	%o1,	%g1
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	fandnot1s	%f28,	%f13,	%f12
	edge16ln	%i7,	%g3,	%o7
	fmovdpos	%xcc,	%f12,	%f2
	movrne	%i0,	%i5,	%o6
	tvs	%xcc,	0x2
	set	0x24, %i5
	lduwa	[%l7 + %i5] 0x89,	%g2
	edge16l	%l4,	%g5,	%l5
	nop
	setx loop_1492, %l0, %l1
	jmpl %l1, %o0
	fmovd	%f18,	%f12
	stx	%o4,	[%l7 + 0x38]
	fmovd	%f24,	%f16
loop_1492:
	alignaddr	%l6,	%o5,	%g6
	udiv	%l2,	0x12C0,	%g4
	tcc	%xcc,	0x1
	fmovdl	%xcc,	%f28,	%f9
	edge16n	%l0,	%i4,	%i2
	movle	%icc,	%l3,	%o2
	tle	%icc,	0x2
	tvs	%xcc,	0x1
	fmovrdgez	%i6,	%f16,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%i1,	%g7
	fbug	%fcc2,	loop_1493
	faligndata	%f28,	%f8,	%f0
	set	0x2F, %g1
	ldstuba	[%l7 + %g1] 0x10,	%o3
loop_1493:
	edge32ln	%l1,	%o1,	%i3
	edge8l	%i7,	%g3,	%g1
	tvc	%icc,	0x3
	andncc	%i0,	%o7,	%i5
	orncc	%g2,	0x01E0,	%l4
	andn	%g5,	0x1623,	%o6
	movre	%l5,	%o0,	%l6
	andcc	%o5,	%g6,	%l2
	membar	0x0C
	movpos	%xcc,	%o4,	%g4
	fbne,a	%fcc2,	loop_1494
	movrne	%i4,	%l0,	%i2
	mulscc	%l3,	%o2,	%i6
	edge8n	%g7,	%i1,	%l1
loop_1494:
	taddcc	%o3,	%o1,	%i3
	mulx	%i7,	%g1,	%i0
	edge32l	%o7,	%i5,	%g3
	edge32l	%g2,	%g5,	%l4
	umulcc	%o6,	0x0AC4,	%o0
	bge,a,pt	%xcc,	loop_1495
	tvc	%icc,	0x7
	swap	[%l7 + 0x64],	%l6
	ldsw	[%l7 + 0x70],	%o5
loop_1495:
	nop
	fitos	%f17,	%f5
	te	%icc,	0x4
	udivcc	%l5,	0x1B5A,	%l2
	sdiv	%o4,	0x1DCA,	%g6
	pdist	%f4,	%f30,	%f10
	membar	0x65
	edge32l	%g4,	%i4,	%i2
	tge	%icc,	0x3
	edge8l	%l0,	%o2,	%i6
	andncc	%g7,	%i1,	%l3
	movgu	%icc,	%o3,	%o1
	fpadd32s	%f3,	%f27,	%f24
	edge8	%i3,	%i7,	%l1
	fcmpgt32	%f28,	%f28,	%i0
	andcc	%o7,	0x084F,	%g1
	andcc	%g3,	%i5,	%g2
	umul	%l4,	%g5,	%o6
	edge8l	%l6,	%o5,	%l5
	udivcc	%o0,	0x018F,	%o4
	xorcc	%g6,	%g4,	%l2
	movrne	%i2,	%i4,	%l0
	movn	%icc,	%o2,	%i6
	bcs,a,pt	%icc,	loop_1496
	tle	%icc,	0x5
	fmovrdlz	%i1,	%f4,	%f30
	movpos	%icc,	%g7,	%o3
loop_1496:
	smulcc	%l3,	0x06F7,	%i3
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o1
	bl,pt	%xcc,	loop_1497
	andncc	%i7,	%i0,	%l1
	subc	%g1,	%g3,	%o7
	fmovrdgz	%g2,	%f22,	%f14
loop_1497:
	stw	%i5,	[%l7 + 0x70]
	xorcc	%g5,	%o6,	%l4
	srl	%o5,	%l5,	%o0
	andn	%o4,	0x12C5,	%g6
	fand	%f2,	%f6,	%f10
	orcc	%g4,	0x045E,	%l2
	nop
	setx loop_1498, %l0, %l1
	jmpl %l1, %l6
	umulcc	%i4,	0x149A,	%i2
	array32	%o2,	%l0,	%i1
	movg	%xcc,	%g7,	%o3
loop_1498:
	bpos,a,pt	%xcc,	loop_1499
	fpack16	%f0,	%f9
	fzero	%f4
	movne	%icc,	%i6,	%l3
loop_1499:
	brlz,a	%o1,	loop_1500
	srax	%i7,	%i3,	%l1
	nop
	fitos	%f8,	%f3
	fstoi	%f3,	%f12
	fbo	%fcc2,	loop_1501
loop_1500:
	fbul,a	%fcc0,	loop_1502
	or	%g1,	0x067E,	%i0
	sra	%o7,	0x17,	%g2
loop_1501:
	fmovdvc	%xcc,	%f10,	%f16
loop_1502:
	addc	%g3,	%i5,	%g5
	xorcc	%l4,	%o6,	%o5
	sra	%l5,	0x04,	%o0
	tneg	%icc,	0x5
	tleu	%icc,	0x6
	sdiv	%o4,	0x0378,	%g6
	fmovrsgz	%l2,	%f19,	%f23
	fmovrdlz	%g4,	%f0,	%f22
	array16	%i4,	%i2,	%l6
	andcc	%o2,	%i1,	%g7
	movleu	%xcc,	%l0,	%i6
	addcc	%o3,	0x1497,	%l3
	movrgez	%o1,	%i7,	%l1
	array8	%g1,	%i0,	%i3
	wr	%g0,	0x88,	%asi
	stha	%o7,	[%l7 + 0x5C] %asi
	brlz	%g2,	loop_1503
	fpack32	%f10,	%f28,	%f12
	subc	%i5,	%g5,	%g3
	nop
	fitos	%f11,	%f15
	fstox	%f15,	%f14
	fxtos	%f14,	%f25
loop_1503:
	andcc	%l4,	%o5,	%o6
	movgu	%xcc,	%l5,	%o4
	stx	%o0,	[%l7 + 0x18]
	set	0x6C, %g3
	stwa	%g6,	[%l7 + %g3] 0x15
	sdivcc	%g4,	0x0DD9,	%l2
	fpadd32	%f18,	%f6,	%f12
	membar	0x5D
	edge8n	%i2,	%i4,	%l6
	tne	%xcc,	0x3
	array32	%o2,	%g7,	%i1
	orn	%i6,	%l0,	%l3
	umulcc	%o1,	%i7,	%l1
	brgez,a	%o3,	loop_1504
	fpsub16	%f6,	%f22,	%f4
	movrgz	%g1,	0x2E8,	%i3
	addcc	%o7,	0x0E98,	%i0
loop_1504:
	mulscc	%i5,	%g5,	%g3
	or	%g2,	0x1148,	%l4
	edge8n	%o6,	%o5,	%o4
	edge16	%l5,	%o0,	%g6
	ta	%icc,	0x7
	addcc	%g4,	0x1DD5,	%i2
	array16	%i4,	%l2,	%l6
	fmovrsgez	%g7,	%f14,	%f4
	ldub	[%l7 + 0x16],	%o2
	fmovdcs	%xcc,	%f1,	%f15
	addc	%i6,	%l0,	%l3
	fand	%f4,	%f6,	%f18
	membar	0x79
	fmovdleu	%xcc,	%f1,	%f22
	fxors	%f6,	%f1,	%f21
	umul	%o1,	%i7,	%i1
	andcc	%o3,	0x084B,	%g1
	movrgz	%i3,	0x3C9,	%o7
	udivx	%l1,	0x1620,	%i5
	te	%icc,	0x7
	udivcc	%g5,	0x1E32,	%i0
	tg	%xcc,	0x7
	edge16ln	%g3,	%l4,	%g2
	brlz	%o6,	loop_1505
	tge	%xcc,	0x5
	edge8n	%o4,	%l5,	%o5
	tle	%xcc,	0x3
loop_1505:
	tpos	%icc,	0x0
	set	0x26, %g7
	stba	%o0,	[%l7 + %g7] 0x22
	membar	#Sync
	sir	0x0F01
	popc	0x1931,	%g6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x14] %asi,	%i2
	taddcc	%g4,	0x07D4,	%i4
	fmovdg	%xcc,	%f11,	%f31
	add	%l2,	0x11F7,	%g7
	set	0x3C, %l5
	ldswa	[%l7 + %l5] 0x81,	%o2
	movg	%xcc,	%l6,	%i6
	fpsub32s	%f28,	%f17,	%f1
	lduw	[%l7 + 0x1C],	%l3
	flush	%l7 + 0x0C
	udivcc	%l0,	0x01A8,	%i7
	nop
	set	0x7C, %i1
	ldsb	[%l7 + %i1],	%i1
	sub	%o1,	0x0E52,	%o3
	sethi	0x0600,	%g1
	set	0x30, %l4
	lduwa	[%l7 + %l4] 0x11,	%o7
	fmul8x16au	%f29,	%f24,	%f18
	edge8n	%i3,	%l1,	%g5
	fbul,a	%fcc0,	loop_1506
	fbul,a	%fcc1,	loop_1507
	movleu	%icc,	%i5,	%g3
	fmovsge	%icc,	%f23,	%f21
loop_1506:
	fmovdgu	%xcc,	%f9,	%f11
loop_1507:
	nop
	set	0x40, %o6
	sta	%f11,	[%l7 + %o6] 0x88
	xorcc	%l4,	0x0C7F,	%g2
	nop
	setx	0x42E90EEDC0428DFE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	sir	0x1A26
	be,a,pt	%xcc,	loop_1508
	ldsh	[%l7 + 0x56],	%o6
	andncc	%o4,	%i0,	%o5
	movg	%icc,	%l5,	%o0
loop_1508:
	movre	%g6,	0x3E9,	%g4
	bneg,a,pt	%xcc,	loop_1509
	orcc	%i2,	%i4,	%l2
	tl	%icc,	0x3
	fornot1s	%f10,	%f30,	%f31
loop_1509:
	xnor	%o2,	%g7,	%i6
	xor	%l6,	%l3,	%i7
	ta	%xcc,	0x2
	edge32ln	%l0,	%o1,	%i1
	tpos	%xcc,	0x3
	orncc	%g1,	%o7,	%o3
	mulscc	%i3,	0x1E88,	%g5
	sll	%l1,	0x1D,	%g3
	wr	%g0,	0x2a,	%asi
	stwa	%l4,	[%l7 + 0x74] %asi
	membar	#Sync
	smulcc	%g2,	%i5,	%o4
	tvs	%xcc,	0x5
	udiv	%o6,	0x1C1F,	%i0
	fbl,a	%fcc2,	loop_1510
	ldub	[%l7 + 0x56],	%l5
	sethi	0x180B,	%o5
	array32	%g6,	%o0,	%i2
loop_1510:
	sdiv	%g4,	0x0AA2,	%i4
	fmovrse	%l2,	%f28,	%f27
	fcmpne32	%f14,	%f18,	%g7
	movg	%icc,	%o2,	%i6
	ld	[%l7 + 0x3C],	%f10
	array16	%l6,	%l3,	%l0
	orn	%o1,	0x1A69,	%i1
	sllx	%i7,	0x16,	%o7
	tvc	%icc,	0x5
	fmovscc	%xcc,	%f5,	%f29
	fmovsleu	%xcc,	%f3,	%f29
	fxors	%f25,	%f17,	%f27
	orn	%g1,	%o3,	%i3
	movre	%g5,	0x0E4,	%g3
	tle	%xcc,	0x6
	addc	%l4,	0x09BD,	%l1
	xnorcc	%g2,	%o4,	%i5
	orncc	%o6,	%l5,	%i0
	tne	%icc,	0x4
	sra	%o5,	%g6,	%i2
	nop
	setx	0x6F9CB7B8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x1D3EA6AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f19,	%f31
	fmovdvs	%xcc,	%f29,	%f15
	fmovrdgez	%o0,	%f2,	%f12
	brnz,a	%g4,	loop_1511
	bvs	%icc,	loop_1512
	xnor	%i4,	0x0CE3,	%g7
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x3C] %asi,	%o2
loop_1511:
	fnands	%f15,	%f5,	%f18
loop_1512:
	popc	0x194B,	%l2
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i6,	%l6
	fnot1	%f10,	%f12
	ldx	[%l7 + 0x30],	%l3
	or	%o1,	%i1,	%l0
	edge8l	%o7,	%g1,	%i7
	fnands	%f20,	%f1,	%f27
	edge32	%i3,	%g5,	%o3
	fbuge	%fcc1,	loop_1513
	tpos	%icc,	0x2
	udivcc	%l4,	0x1016,	%l1
	tcs	%icc,	0x4
loop_1513:
	fmovsge	%xcc,	%f1,	%f24
	fbo	%fcc0,	loop_1514
	movvs	%icc,	%g2,	%o4
	fnot1	%f8,	%f8
	mulscc	%i5,	0x0465,	%o6
loop_1514:
	fpadd16	%f18,	%f6,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f30,	%f14
	ba	loop_1515
	fmovrslz	%l5,	%f17,	%f26
	xnorcc	%g3,	0x0EA6,	%o5
	smul	%g6,	0x0A96,	%i2
loop_1515:
	fbuge	%fcc1,	loop_1516
	tvs	%xcc,	0x3
	fcmple32	%f26,	%f6,	%o0
	mulx	%g4,	%i0,	%i4
loop_1516:
	fbug	%fcc0,	loop_1517
	tleu	%icc,	0x7
	movre	%g7,	%o2,	%l2
	fmovdcs	%xcc,	%f3,	%f12
loop_1517:
	fba	%fcc0,	loop_1518
	stx	%i6,	[%l7 + 0x28]
	movrlez	%l3,	0x163,	%o1
	sllx	%l6,	%i1,	%l0
loop_1518:
	bg	loop_1519
	fnot1s	%f31,	%f25
	xnorcc	%o7,	0x1989,	%i7
	ble,a,pt	%icc,	loop_1520
loop_1519:
	edge32n	%i3,	%g5,	%o3
	fpsub32	%f12,	%f22,	%f24
	andn	%g1,	%l4,	%l1
loop_1520:
	fbu	%fcc3,	loop_1521
	fmovrdne	%o4,	%f22,	%f4
	membar	0x11
	xor	%i5,	0x0032,	%g2
loop_1521:
	movvs	%xcc,	%l5,	%g3
	fmovsvs	%icc,	%f16,	%f11
	bl,pt	%icc,	loop_1522
	nop
	setx	0x1287B107,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	fsqrts	%f11,	%f24
	fandnot2	%f18,	%f22,	%f8
	fands	%f22,	%f11,	%f22
loop_1522:
	fxor	%f26,	%f8,	%f4
	movcc	%icc,	%o5,	%g6
	fmovdcs	%xcc,	%f12,	%f28
	and	%i2,	0x1020,	%o6
	tsubcctv	%g4,	%i0,	%i4
	tsubcc	%o0,	%o2,	%g7
	fmovsvc	%xcc,	%f18,	%f17
	fmovdle	%icc,	%f13,	%f4
	srlx	%l2,	0x1C,	%l3
	edge32l	%o1,	%i6,	%i1
	fbug,a	%fcc1,	loop_1523
	fbl	%fcc3,	loop_1524
	popc	%l0,	%o7
	fmovdcs	%icc,	%f12,	%f22
loop_1523:
	ta	%icc,	0x2
loop_1524:
	tl	%xcc,	0x0
	xor	%l6,	0x0DDB,	%i3
	flush	%l7 + 0x40
	fbule,a	%fcc3,	loop_1525
	tcs	%icc,	0x3
	array8	%g5,	%o3,	%g1
	fpadd32s	%f28,	%f8,	%f22
loop_1525:
	te	%icc,	0x0
	bgu,a	loop_1526
	movn	%xcc,	%l4,	%i7
	tgu	%icc,	0x4
	fbe	%fcc0,	loop_1527
loop_1526:
	bneg,a,pt	%icc,	loop_1528
	stbar
	fmovsvc	%icc,	%f2,	%f3
loop_1527:
	fblg,a	%fcc0,	loop_1529
loop_1528:
	fbge	%fcc3,	loop_1530
	sir	0x0A1C
	bne	%icc,	loop_1531
loop_1529:
	fpsub32	%f24,	%f0,	%f12
loop_1530:
	nop
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x04,	%l0
loop_1531:
	tn	%icc,	0x7
	fbule	%fcc1,	loop_1532
	edge16l	%i5,	%o4,	%l5
	tn	%xcc,	0x6
	movrlz	%g2,	0x098,	%g3
loop_1532:
	fbge,a	%fcc1,	loop_1533
	movcs	%xcc,	%g6,	%i2
	ldsb	[%l7 + 0x74],	%o6
	udivcc	%o5,	0x090A,	%i0
loop_1533:
	fmovrdgez	%g4,	%f4,	%f6
	ld	[%l7 + 0x34],	%f11
	fbl,a	%fcc1,	loop_1534
	sir	0x0E39
	stw	%o0,	[%l7 + 0x28]
	edge32l	%i4,	%o2,	%l2
loop_1534:
	call	loop_1535
	tpos	%icc,	0x5
	tneg	%icc,	0x4
	stbar
loop_1535:
	edge16n	%l3,	%o1,	%g7
	movneg	%icc,	%i1,	%i6
	addccc	%l0,	0x16C5,	%l6
	edge8l	%o7,	%i3,	%g5
	udiv	%g1,	0x0C63,	%l4
	fbo	%fcc1,	loop_1536
	fpadd32	%f2,	%f4,	%f2
	bl,a,pn	%icc,	loop_1537
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1536:
	sth	%i7,	[%l7 + 0x7C]
	xorcc	%o3,	0x1928,	%i5
loop_1537:
	tneg	%icc,	0x6
	popc	%o4,	%l1
	fble,a	%fcc3,	loop_1538
	nop
	setx	loop_1539,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bne,a,pn	%icc,	loop_1540
	fornot1	%f18,	%f30,	%f0
loop_1538:
	mulx	%l5,	%g3,	%g2
loop_1539:
	nop
	set	0x18, %i0
	lda	[%l7 + %i0] 0x15,	%f10
loop_1540:
	ba,pn	%xcc,	loop_1541
	sdiv	%g6,	0x11E6,	%i2
	fmuld8sux16	%f6,	%f16,	%f22
	fnot2	%f14,	%f26
loop_1541:
	orcc	%o5,	%o6,	%g4
	subccc	%o0,	%i0,	%o2
	array16	%i4,	%l3,	%l2
	fbul,a	%fcc2,	loop_1542
	edge32ln	%g7,	%i1,	%i6
	stbar
	movleu	%xcc,	%l0,	%l6
loop_1542:
	udivx	%o7,	0x1910,	%o1
	xnor	%i3,	0x1855,	%g1
	fmovda	%icc,	%f10,	%f5
	mulx	%l4,	%i7,	%g5
	fsrc2s	%f23,	%f14
	fpack32	%f26,	%f2,	%f14
	bg,pt	%xcc,	loop_1543
	udivcc	%i5,	0x154E,	%o4
	orncc	%o3,	%l5,	%g3
	movgu	%xcc,	%g2,	%g6
loop_1543:
	sra	%l1,	0x01,	%i2
	edge8l	%o5,	%o6,	%g4
	srlx	%o0,	%o2,	%i0
	fmovsgu	%icc,	%f25,	%f26
	edge32l	%l3,	%i4,	%l2
	array32	%i1,	%g7,	%i6
	be	loop_1544
	edge16ln	%l0,	%l6,	%o1
	ble,a	%icc,	loop_1545
	lduh	[%l7 + 0x2E],	%i3
loop_1544:
	smulcc	%g1,	0x1334,	%o7
	bvs,pn	%xcc,	loop_1546
loop_1545:
	tne	%icc,	0x3
	xnorcc	%i7,	%l4,	%g5
	nop
	setx	0x3369E3AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xB31D9216,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f30,	%f28
loop_1546:
	fnot2	%f26,	%f16
	fmul8x16	%f31,	%f22,	%f16
	fbn	%fcc0,	loop_1547
	tge	%icc,	0x5
	movg	%xcc,	%o4,	%i5
	fcmpeq16	%f4,	%f20,	%l5
loop_1547:
	nop
	setx	0x32C95F4BB04875E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	tpos	%icc,	0x1
	subc	%g3,	0x0409,	%o3
	fmovdcc	%xcc,	%f1,	%f13
	addccc	%g6,	%g2,	%i2
	fmul8ulx16	%f30,	%f28,	%f18
	wr	%g0,	0x10,	%asi
	stba	%o5,	[%l7 + 0x23] %asi
	subcc	%l1,	%g4,	%o6
	ldsb	[%l7 + 0x6C],	%o0
	fnand	%f6,	%f0,	%f16
	movneg	%icc,	%o2,	%i0
	edge16	%i4,	%l3,	%l2
	edge16l	%i1,	%g7,	%l0
	ldsw	[%l7 + 0x48],	%l6
	sra	%i6,	0x1E,	%i3
	tge	%icc,	0x5
	sethi	0x1095,	%o1
	tle	%icc,	0x4
	movl	%icc,	%g1,	%o7
	nop
	setx loop_1548, %l0, %l1
	jmpl %l1, %i7
	fmovrdlz	%g5,	%f10,	%f8
	tgu	%icc,	0x7
	mulscc	%l4,	%i5,	%o4
loop_1548:
	tl	%icc,	0x7
	tvs	%icc,	0x2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g3
	fandnot2s	%f15,	%f14,	%f8
	fpadd16	%f8,	%f6,	%f18
	taddcc	%l5,	0x10A6,	%g6
	subc	%o3,	0x106B,	%i2
	fmovdvc	%xcc,	%f18,	%f20
	movrgez	%o5,	0x3C6,	%g2
	fsrc1	%f4,	%f4
	subc	%l1,	0x1181,	%o6
	set	0x10, %g5
	swapa	[%l7 + %g5] 0x10,	%g4
	nop
	setx loop_1549, %l0, %l1
	jmpl %l1, %o2
	movg	%xcc,	%i0,	%o0
	fpmerge	%f2,	%f7,	%f4
	fcmpeq16	%f22,	%f6,	%i4
loop_1549:
	tn	%icc,	0x3
	fnor	%f24,	%f2,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l2,	%l3,	%i1
	sra	%g7,	%l0,	%l6
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i3
	xnor	%o1,	0x010F,	%g1
	fbue	%fcc1,	loop_1550
	nop
	setx	0xD06F411D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x5A00264F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f28,	%f19
	tvc	%icc,	0x6
	movrne	%o7,	0x0B4,	%i7
loop_1550:
	edge8	%g5,	%i6,	%i5
	fnot2s	%f15,	%f10
	tne	%xcc,	0x6
	tpos	%icc,	0x3
	fbuge	%fcc2,	loop_1551
	subccc	%l4,	%o4,	%l5
	fmovdleu	%xcc,	%f20,	%f24
	movleu	%xcc,	%g3,	%o3
loop_1551:
	tne	%icc,	0x3
	brz,a	%i2,	loop_1552
	fbne,a	%fcc2,	loop_1553
	fbue	%fcc2,	loop_1554
	and	%o5,	0x1AF3,	%g6
loop_1552:
	sdivx	%l1,	0x1942,	%g2
loop_1553:
	sllx	%g4,	0x0B,	%o6
loop_1554:
	nop
	set	0x15, %i2
	ldsba	[%l7 + %i2] 0x10,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x7
	movre	%o2,	%o0,	%i4
	fba,a	%fcc3,	loop_1555
	orcc	%l3,	0x1917,	%l2
	edge16	%i1,	%l0,	%l6
	edge8l	%g7,	%i3,	%g1
loop_1555:
	ldsw	[%l7 + 0x4C],	%o1
	movcc	%icc,	%i7,	%g5
	alignaddr	%i6,	%i5,	%o7
	andncc	%l4,	%l5,	%g3
	alignaddr	%o4,	%i2,	%o3
	fxnors	%f14,	%f22,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f12,	%f16,	%f26
	fnot2	%f22,	%f18
	andn	%o5,	%g6,	%g2
	move	%xcc,	%g4,	%o6
	fsrc1	%f22,	%f30
	tgu	%icc,	0x1
	xorcc	%l1,	%i0,	%o2
	fabss	%f9,	%f5
	edge8	%o0,	%l3,	%l2
	sra	%i4,	%i1,	%l6
	ld	[%l7 + 0x44],	%f0
	fones	%f8
	movn	%icc,	%l0,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f4,	%f26,	%f18
	xnorcc	%g1,	0x0803,	%o1
	andncc	%g7,	%g5,	%i7
	fzeros	%f9
	xnorcc	%i5,	%o7,	%i6
	subc	%l5,	%l4,	%o4
	tne	%xcc,	0x0
	edge16ln	%g3,	%i2,	%o5
	fmovsvc	%xcc,	%f12,	%f18
	smulcc	%g6,	%o3,	%g2
	ldsh	[%l7 + 0x6C],	%g4
	set	0x40, %i6
	stwa	%l1,	[%l7 + %i6] 0x2a
	membar	#Sync
	andn	%o6,	%o2,	%o0
	bl	%xcc,	loop_1556
	fmovrde	%i0,	%f2,	%f18
	array16	%l2,	%i4,	%i1
	fnegd	%f14,	%f28
loop_1556:
	and	%l3,	0x10B6,	%l0
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f26
	orn	%i3,	%l6,	%o1
	tpos	%xcc,	0x1
	xorcc	%g7,	%g1,	%g5
	edge8ln	%i5,	%o7,	%i6
	srax	%l5,	%i7,	%o4
	sethi	0x148C,	%l4
	set	0x34, %l6
	ldstuba	[%l7 + %l6] 0x11,	%g3
	movne	%icc,	%i2,	%g6
	set	0x48, %g2
	lduha	[%l7 + %g2] 0x18,	%o3
	movrne	%o5,	%g2,	%g4
	fblg	%fcc2,	loop_1557
	orncc	%o6,	%l1,	%o0
	array16	%i0,	%l2,	%o2
	fba	%fcc3,	loop_1558
loop_1557:
	fsrc1s	%f1,	%f13
	set	0x38, %o1
	prefetcha	[%l7 + %o1] 0x11,	 0x2
loop_1558:
	movrlez	%l3,	0x244,	%l0
	bvc,pt	%icc,	loop_1559
	fpadd16	%f22,	%f24,	%f18
	fcmple16	%f20,	%f4,	%i1
	movne	%icc,	%l6,	%o1
loop_1559:
	fmovsle	%icc,	%f14,	%f23
	call	loop_1560
	tvc	%xcc,	0x5
	fpack32	%f12,	%f16,	%f22
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x208] %asi,	%i3
loop_1560:
	xnor	%g7,	%g1,	%g5
	or	%i5,	0x1283,	%i6
	movne	%xcc,	%l5,	%i7
	brlez,a	%o4,	loop_1561
	srax	%l4,	%g3,	%i2
	set	0x48, %o2
	sta	%f29,	[%l7 + %o2] 0x89
loop_1561:
	fmovsa	%xcc,	%f16,	%f16
	edge16	%o7,	%o3,	%g6
	fcmpeq32	%f10,	%f0,	%o5
	udiv	%g4,	0x1593,	%o6
	taddcctv	%g2,	%l1,	%o0
	fandnot2s	%f9,	%f29,	%f21
	fone	%f28
	xnor	%l2,	0x0BDC,	%o2
	srl	%i4,	0x18,	%l3
	fmovscc	%xcc,	%f9,	%f19
	tcc	%icc,	0x5
	array16	%l0,	%i1,	%i0
	movrne	%l6,	%o1,	%i3
	fcmple32	%f18,	%f14,	%g7
	nop
	fitod	%f13,	%f0
	fbul	%fcc0,	loop_1562
	nop
	fitos	%f8,	%f15
	fstox	%f15,	%f8
	fxtos	%f8,	%f10
	bn,a	%xcc,	loop_1563
	bcs	loop_1564
loop_1562:
	sub	%g5,	%i5,	%i6
	umul	%l5,	%i7,	%g1
loop_1563:
	te	%xcc,	0x5
loop_1564:
	fnot2	%f16,	%f0
	fnors	%f15,	%f2,	%f6
	wr	%g0,	0x80,	%asi
	stha	%o4,	[%l7 + 0x74] %asi
	tg	%icc,	0x0
	ldx	[%l7 + 0x08],	%l4
	taddcc	%g3,	0x064B,	%o7
	for	%f4,	%f22,	%f10
	and	%o3,	%g6,	%i2
	fpsub32	%f18,	%f16,	%f18
	movcs	%icc,	%o5,	%g4
	array32	%o6,	%g2,	%o0
	fmovsg	%xcc,	%f28,	%f17
	fmovsl	%xcc,	%f18,	%f1
	movvc	%icc,	%l2,	%l1
	fpmerge	%f13,	%f19,	%f8
	taddcctv	%i4,	0x1708,	%o2
	sethi	0x15F0,	%l3
	nop
	setx	0x8911FF48F763B4EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x51549A1AD7F66D37,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f12,	%f16
	srax	%l0,	%i0,	%l6
	movvs	%xcc,	%i1,	%o1
	array32	%g7,	%i3,	%g5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i6
	addccc	%i5,	0x0A2D,	%l5
	subccc	%g1,	%i7,	%o4
	nop
	setx	0xD1BA05CE5B7CAAFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xFFBBBF53A665ACF2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f28,	%f8
	movneg	%xcc,	%g3,	%l4
	bn,a	loop_1565
	fabsd	%f8,	%f12
	stw	%o7,	[%l7 + 0x70]
	movpos	%icc,	%g6,	%o3
loop_1565:
	ba,a,pt	%xcc,	loop_1566
	movn	%icc,	%o5,	%g4
	sll	%o6,	0x10,	%i2
	bn,a,pn	%icc,	loop_1567
loop_1566:
	alignaddrl	%g2,	%l2,	%l1
	popc	%i4,	%o0
	xor	%o2,	%l3,	%l0
loop_1567:
	fpadd32s	%f22,	%f2,	%f13
	edge32	%l6,	%i0,	%o1
	nop
	set	0x7C, %i7
	sth	%i1,	[%l7 + %i7]
	movvs	%icc,	%i3,	%g5
	movgu	%icc,	%i6,	%g7
	alignaddr	%l5,	%i5,	%g1
	edge8	%i7,	%o4,	%g3
	movl	%icc,	%o7,	%l4
	fmovsvs	%xcc,	%f2,	%f1
	movge	%xcc,	%o3,	%o5
	sub	%g4,	%g6,	%o6
	fbue,a	%fcc0,	loop_1568
	fbe,a	%fcc1,	loop_1569
	fmovdg	%xcc,	%f22,	%f10
	fone	%f28
loop_1568:
	nop
	wr	%g0,	0x23,	%asi
	stba	%i2,	[%l7 + 0x26] %asi
	membar	#Sync
loop_1569:
	tleu	%xcc,	0x3
	movgu	%icc,	%g2,	%l1
	fble,a	%fcc3,	loop_1570
	bl,pn	%icc,	loop_1571
	ta	%icc,	0x7
	fbo	%fcc3,	loop_1572
loop_1570:
	edge8ln	%i4,	%l2,	%o2
loop_1571:
	fbge,a	%fcc2,	loop_1573
	nop
	set	0x0F, %i4
	ldub	[%l7 + %i4],	%l3
loop_1572:
	tcs	%icc,	0x1
	fble	%fcc2,	loop_1574
loop_1573:
	fcmpgt16	%f24,	%f6,	%l0
	nop
	setx	0x81BDA036AE55A0D8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x1A069F1242DCABFD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f28,	%f22
	ldsw	[%l7 + 0x64],	%l6
loop_1574:
	array32	%i0,	%o1,	%i1
	and	%o0,	%i3,	%g5
	movleu	%icc,	%g7,	%i6
	movne	%icc,	%l5,	%g1
	tsubcc	%i5,	%o4,	%i7
	xor	%g3,	0x17F7,	%l4
	edge32l	%o7,	%o3,	%g4
	movvs	%icc,	%o5,	%g6
	fmul8x16	%f15,	%f28,	%f28
	fmovsg	%xcc,	%f27,	%f20
	xnorcc	%i2,	0x144E,	%o6
	tge	%xcc,	0x7
	array16	%g2,	%l1,	%l2
	fbule,a	%fcc0,	loop_1575
	fnegd	%f28,	%f18
	movrgz	%i4,	%l3,	%o2
	fbul	%fcc0,	loop_1576
loop_1575:
	movgu	%xcc,	%l0,	%i0
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1576:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x28] %asi,	%f27
	fbul	%fcc1,	loop_1577
	edge32ln	%l6,	%o1,	%o0
	tge	%xcc,	0x6
	edge16ln	%i3,	%g5,	%g7
loop_1577:
	fornot2	%f30,	%f14,	%f4
	or	%i1,	%i6,	%g1
	edge16n	%l5,	%i5,	%i7
	fmovsl	%icc,	%f21,	%f17
	movgu	%xcc,	%o4,	%l4
	orncc	%o7,	0x03AB,	%o3
	set	0x33, %o3
	lduba	[%l7 + %o3] 0x11,	%g3
	subccc	%o5,	0x06BC,	%g4
	fsrc1s	%f27,	%f8
	array16	%g6,	%o6,	%i2
	movvs	%xcc,	%l1,	%g2
	udivx	%l2,	0x1FF9,	%l3
	sdivx	%i4,	0x0B04,	%o2
	mulx	%i0,	0x13D2,	%l0
	wr	%g0,	0x89,	%asi
	stwa	%o1,	[%l7 + 0x08] %asi
	movcc	%xcc,	%o0,	%i3
	andcc	%g5,	%l6,	%i1
	movneg	%xcc,	%i6,	%g1
	movpos	%xcc,	%l5,	%g7
	sdivx	%i7,	0x015C,	%o4
	taddcctv	%i5,	0x08DB,	%l4
	edge32ln	%o3,	%o7,	%g3
	andncc	%g4,	%o5,	%g6
	sir	0x0DBE
	fmul8x16	%f21,	%f6,	%f6
	array32	%i2,	%o6,	%g2
	fmovrdgez	%l2,	%f2,	%f26
	ta	%xcc,	0x3
	tl	%icc,	0x4
	movleu	%xcc,	%l1,	%l3
	fmovde	%xcc,	%f11,	%f22
	stw	%i4,	[%l7 + 0x6C]
	addccc	%o2,	0x103F,	%i0
	ldstub	[%l7 + 0x68],	%l0
	fbl,a	%fcc1,	loop_1578
	fmovsneg	%xcc,	%f19,	%f17
	movcc	%icc,	%o1,	%o0
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%g5
loop_1578:
	fbug,a	%fcc2,	loop_1579
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l6,	0x11ED,	%i3
	fble	%fcc3,	loop_1580
loop_1579:
	movg	%xcc,	%i6,	%i1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x34] %asi,	%f9
loop_1580:
	movre	%l5,	0x167,	%g7
	brlz	%g1,	loop_1581
	ta	%icc,	0x3
	movle	%icc,	%o4,	%i7
	alignaddrl	%i5,	%l4,	%o3
loop_1581:
	stb	%o7,	[%l7 + 0x52]
	bneg,a	%xcc,	loop_1582
	fbne	%fcc0,	loop_1583
	fmovsl	%icc,	%f20,	%f7
	bgu	%icc,	loop_1584
loop_1582:
	edge16l	%g3,	%g4,	%o5
loop_1583:
	nop
	setx	0xE4631D4BE0740C02,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fpack32	%f28,	%f14,	%f16
loop_1584:
	add	%i2,	%o6,	%g2
	tneg	%xcc,	0x4
	edge32n	%l2,	%g6,	%l3
	edge16	%i4,	%l1,	%i0
	movg	%xcc,	%o2,	%o1
	add	%o0,	0x1415,	%l0
	movge	%xcc,	%g5,	%l6
	fcmple16	%f0,	%f28,	%i3
	fbe,a	%fcc2,	loop_1585
	movrlez	%i6,	0x0F8,	%i1
	udivx	%g7,	0x1DA9,	%l5
	ble,a	%icc,	loop_1586
loop_1585:
	brgez,a	%g1,	loop_1587
	fbug	%fcc0,	loop_1588
	andn	%o4,	0x0522,	%i7
loop_1586:
	array32	%l4,	%i5,	%o3
loop_1587:
	nop
	fitos	%f15,	%f5
loop_1588:
	array32	%g3,	%o7,	%g4
	sethi	0x1C2A,	%i2
	taddcc	%o6,	%o5,	%l2
	bvc,a,pt	%icc,	loop_1589
	andcc	%g6,	%g2,	%i4
	sdivcc	%l1,	0x1915,	%i0
	movleu	%icc,	%o2,	%l3
loop_1589:
	movvc	%xcc,	%o0,	%l0
	edge32ln	%g5,	%l6,	%o1
	movvc	%xcc,	%i6,	%i1
	lduw	[%l7 + 0x18],	%g7
	fnors	%f17,	%f18,	%f21
	tpos	%xcc,	0x6
	fsrc2	%f18,	%f4
	edge8l	%i3,	%g1,	%l5
	alignaddrl	%o4,	%i7,	%i5
	be,a	loop_1590
	fmovsa	%xcc,	%f7,	%f13
	fcmpeq16	%f20,	%f4,	%l4
	nop
	setx	0x6E59E410260E827D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x7CE2B9B9D16CA9D9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f0,	%f8
loop_1590:
	movleu	%icc,	%g3,	%o7
	nop
	fitod	%f10,	%f28
	fdtos	%f28,	%f18
	fmovsneg	%xcc,	%f0,	%f25
	tsubcctv	%g4,	0x0FF2,	%o3
	brgz,a	%i2,	loop_1591
	nop
	set	0x16, %o4
	lduh	[%l7 + %o4],	%o5
	brlez	%o6,	loop_1592
	bge,a,pt	%icc,	loop_1593
loop_1591:
	be	%icc,	loop_1594
	tle	%xcc,	0x1
loop_1592:
	edge16l	%l2,	%g6,	%g2
loop_1593:
	nop
	fitod	%f8,	%f12
	fdtos	%f12,	%f28
loop_1594:
	brlz	%i4,	loop_1595
	brgz	%i0,	loop_1596
	andcc	%l1,	%o2,	%o0
	movneg	%icc,	%l3,	%g5
loop_1595:
	fmovdg	%xcc,	%f16,	%f25
loop_1596:
	movrgz	%l0,	%l6,	%i6
	fbn	%fcc2,	loop_1597
	fbul	%fcc0,	loop_1598
	subccc	%o1,	0x04C9,	%i1
	fbule	%fcc0,	loop_1599
loop_1597:
	fnot2s	%f12,	%f24
loop_1598:
	movre	%g7,	%g1,	%l5
	movvc	%icc,	%i3,	%i7
loop_1599:
	tcs	%icc,	0x0
	nop
	setx	0xFABC84F1CE61B4BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f26
	set	0x30, %l1
	ldda	[%l7 + %l1] 0x19,	%i4
	movcc	%xcc,	%o4,	%l4
	sdivcc	%o7,	0x0026,	%g3
	nop
	setx	0x8355E1D08068D10F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	nop
	set	0x48, %g6
	ldsw	[%l7 + %g6],	%g4
	xnorcc	%o3,	0x156B,	%o5
	mulscc	%i2,	0x0E70,	%l2
	tgu	%icc,	0x0
	wr	%g0,	0x89,	%asi
	stha	%g6,	[%l7 + 0x2E] %asi
	xorcc	%o6,	%g2,	%i0
	sdivx	%l1,	0x18CC,	%i4
	or	%o0,	0x0462,	%l3
	srax	%o2,	%l0,	%l6
	fnot1	%f20,	%f4
	srlx	%i6,	0x0A,	%g5
	addc	%i1,	%g7,	%o1
	mova	%xcc,	%g1,	%l5
	bcs,a	%icc,	loop_1600
	brlz	%i3,	loop_1601
	call	loop_1602
	fornot1s	%f11,	%f2,	%f1
loop_1600:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2E] %asi,	%i7
loop_1601:
	orn	%i5,	%o4,	%o7
loop_1602:
	stbar
	edge16	%l4,	%g4,	%o3
	mova	%icc,	%o5,	%i2
	fpackfix	%f22,	%f0
	tcc	%xcc,	0x0
	edge32ln	%l2,	%g3,	%g6
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x60] %asi,	%g2
	fbuge	%fcc0,	loop_1603
	movge	%icc,	%i0,	%o6
	sdivx	%l1,	0x08E0,	%i4
	movn	%icc,	%o0,	%o2
loop_1603:
	movpos	%xcc,	%l0,	%l6
	smul	%l3,	%i6,	%i1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x10,	%g7,	%g5
	fmul8x16	%f14,	%f26,	%f26
	nop
	setx	0x30748DDC,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	subccc	%g1,	%l5,	%i3
	tleu	%xcc,	0x6
	fbuge	%fcc1,	loop_1604
	movrne	%i7,	0x1E7,	%o1
	nop
	setx	loop_1605,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%o4,	0x14CD,	%i5
loop_1604:
	movrgz	%l4,	%g4,	%o3
	movre	%o5,	0x1DA,	%o7
loop_1605:
	movne	%xcc,	%i2,	%l2
	umul	%g3,	%g2,	%i0
	fones	%f10
	array8	%o6,	%l1,	%i4
	tn	%icc,	0x1
	fbule	%fcc1,	loop_1606
	nop
	fitos	%f9,	%f13
	fstox	%f13,	%f2
	bl,pt	%icc,	loop_1607
	std	%f18,	[%l7 + 0x70]
loop_1606:
	fnegd	%f24,	%f12
	movgu	%xcc,	%g6,	%o2
loop_1607:
	movre	%l0,	%l6,	%l3
	edge8ln	%o0,	%i6,	%i1
	add	%g5,	0x1C15,	%g1
	tg	%icc,	0x6
	sdivx	%g7,	0x11F7,	%i3
	movrlz	%i7,	%o1,	%l5
	mova	%icc,	%i5,	%l4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x18,	%o4,	%g4
	nop
	setx	0x405DAC8B2E70CC24,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6A6F212FEA11802B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f22,	%f30
	movvc	%xcc,	%o5,	%o7
	array8	%i2,	%l2,	%g3
	fnegs	%f15,	%f30
	mulscc	%g2,	%o3,	%o6
	nop
	set	0x58, %l2
	sth	%i0,	[%l7 + %l2]
	fnegs	%f16,	%f28
	nop
	fitos	%f26,	%f22
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
	be,pn	%icc,	loop_1608
	tl	%xcc,	0x7
	tcc	%icc,	0x4
	for	%f22,	%f6,	%f24
loop_1608:
	edge32	%l1,	%i4,	%o2
	subccc	%g6,	0x015D,	%l6
	tvc	%xcc,	0x5
	tge	%icc,	0x6
	sth	%l3,	[%l7 + 0x1C]
	brlez,a	%l0,	loop_1609
	xorcc	%i6,	%o0,	%g5
	set	0x78, %l3
	lduha	[%l7 + %l3] 0x88,	%i1
loop_1609:
	pdist	%f24,	%f28,	%f22
	set	0x78, %o0
	stxa	%g7,	[%l7 + %o0] 0x88
	nop
	setx	0x6FBB26CEE6E25DA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x8BE1ED96BC99AE85,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f24,	%f24
	andcc	%i3,	%g1,	%i7
	movn	%icc,	%o1,	%i5
	tvc	%icc,	0x1
	array16	%l5,	%l4,	%g4
	fmovdcc	%xcc,	%f22,	%f19
	fmovsvs	%icc,	%f7,	%f26
	set	0x1C, %o7
	lduwa	[%l7 + %o7] 0x19,	%o4
	movge	%xcc,	%o5,	%o7
	membar	0x64
	movle	%xcc,	%l2,	%g3
	taddcctv	%g2,	%i2,	%o6
	fmovsle	%xcc,	%f1,	%f24
	movle	%icc,	%i0,	%l1
	nop
	setx	loop_1610,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldstub	[%l7 + 0x5C],	%o3
	xor	%o2,	0x185F,	%i4
	or	%l6,	%g6,	%l0
loop_1610:
	alignaddr	%l3,	%o0,	%g5
	udivcc	%i1,	0x12A5,	%g7
	udiv	%i6,	0x031E,	%g1
	srl	%i7,	%i3,	%i5
	fandnot2s	%f25,	%f17,	%f15
	nop
	setx	0xFBE1C35D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x8DFD1374,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f7,	%f22
	fmovdneg	%xcc,	%f7,	%f19
	prefetch	[%l7 + 0x54],	 0x3
	wr	%g0,	0x81,	%asi
	stwa	%l5,	[%l7 + 0x4C] %asi
	wr	%g0,	0xeb,	%asi
	stha	%l4,	[%l7 + 0x78] %asi
	membar	#Sync
	taddcctv	%o1,	0x0D55,	%o4
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	fitos	%f6,	%f0
	fstod	%f0,	%f2
	fsrc1s	%f26,	%f4
	movrlez	%g4,	0x211,	%o5
	nop
	setx	0x70781A24,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	fpadd16s	%f18,	%f0,	%f6
	bleu	%xcc,	loop_1611
	st	%f25,	[%l7 + 0x64]
	movre	%o7,	0x085,	%l2
	fabsd	%f16,	%f26
loop_1611:
	andcc	%g3,	%g2,	%i2
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f16
	edge16l	%i0,	%l1,	%o3
	edge16n	%o6,	%o2,	%i4
	fmovdge	%icc,	%f28,	%f8
	array32	%g6,	%l0,	%l3
	brlez,a	%l6,	loop_1612
	umul	%o0,	0x16C6,	%g5
	movrlez	%i1,	%g7,	%g1
	membar	0x62
loop_1612:
	fmovdg	%icc,	%f31,	%f31
	fbg	%fcc3,	loop_1613
	fabss	%f1,	%f30
	fmuld8sux16	%f20,	%f28,	%f6
	swap	[%l7 + 0x38],	%i7
loop_1613:
	udivx	%i3,	0x0E99,	%i6
	fornot1	%f18,	%f6,	%f12
	orcc	%i5,	0x0D8E,	%l5
	movge	%xcc,	%o1,	%l4
	movvs	%icc,	%g4,	%o4
	stw	%o7,	[%l7 + 0x3C]
	smul	%o5,	%g3,	%l2
	edge32n	%g2,	%i0,	%i2
	bgu,pn	%xcc,	loop_1614
	movleu	%icc,	%l1,	%o3
	alignaddr	%o2,	%i4,	%o6
	brnz	%l0,	loop_1615
loop_1614:
	fmovda	%xcc,	%f25,	%f24
	fmovrdne	%g6,	%f0,	%f16
	mulx	%l6,	0x1017,	%l3
loop_1615:
	move	%xcc,	%g5,	%o0
	movcs	%icc,	%g7,	%i1
	orn	%i7,	%g1,	%i3
	edge16l	%i5,	%i6,	%o1
	taddcc	%l4,	0x0734,	%g4
	addc	%o4,	0x1793,	%o7
	taddcctv	%o5,	%l5,	%g3
	bcs,a	%icc,	loop_1616
	fbo	%fcc1,	loop_1617
	fmovd	%f16,	%f4
	nop
	fitos	%f7,	%f20
	fstoi	%f20,	%f2
loop_1616:
	move	%xcc,	%l2,	%g2
loop_1617:
	or	%i2,	0x0DE8,	%l1
	std	%f22,	[%l7 + 0x78]
	fors	%f0,	%f15,	%f16
	fpackfix	%f20,	%f30
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x63] %asi,	%o3
	fbuge	%fcc0,	loop_1618
	nop
	setx	loop_1619,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bg,pn	%xcc,	loop_1620
	xnor	%o2,	%i4,	%i0
loop_1618:
	edge32l	%l0,	%o6,	%g6
loop_1619:
	nop
	setx	0x7223F488,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x8C37C17E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f6,	%f7
loop_1620:
	tcs	%icc,	0x0
	movn	%icc,	%l6,	%l3
	srlx	%g5,	%o0,	%i1
	xnorcc	%i7,	0x0D77,	%g7
	fmovdgu	%icc,	%f27,	%f31
	srax	%i3,	%g1,	%i6
	edge32ln	%i5,	%l4,	%g4
	fbo	%fcc3,	loop_1621
	array8	%o1,	%o4,	%o5
	fbl	%fcc3,	loop_1622
	fmovdn	%xcc,	%f25,	%f13
loop_1621:
	mulx	%o7,	%g3,	%l5
	srl	%l2,	%g2,	%l1
loop_1622:
	movneg	%xcc,	%o3,	%o2
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f26
	fxtod	%f26,	%f14
	bshuffle	%f24,	%f2,	%f24
	andncc	%i2,	%i4,	%l0
	edge32l	%o6,	%g6,	%i0
	sdiv	%l6,	0x1314,	%l3
	wr	%g0,	0x80,	%asi
	sta	%f0,	[%l7 + 0x74] %asi
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf8
	membar	#Sync
	stb	%g5,	[%l7 + 0x52]
	fmuld8ulx16	%f8,	%f5,	%f26
	bge	%xcc,	loop_1623
	fmovsgu	%icc,	%f19,	%f5
	movrlez	%o0,	0x2F1,	%i7
	sll	%g7,	0x08,	%i1
loop_1623:
	edge32l	%g1,	%i3,	%i6
	fmovrse	%i5,	%f8,	%f20
	fbue	%fcc1,	loop_1624
	tneg	%xcc,	0x4
	prefetch	[%l7 + 0x48],	 0x0
	bneg,pn	%xcc,	loop_1625
loop_1624:
	alignaddr	%l4,	%g4,	%o4
	movre	%o5,	0x154,	%o7
	srl	%g3,	%l5,	%o1
loop_1625:
	udivcc	%g2,	0x13E9,	%l2
	fbue,a	%fcc1,	loop_1626
	move	%icc,	%l1,	%o3
	smul	%o2,	%i4,	%l0
	ldub	[%l7 + 0x46],	%i2
loop_1626:
	subcc	%g6,	%o6,	%l6
	fcmpeq32	%f14,	%f8,	%l3
	movne	%icc,	%i0,	%o0
	ble	%icc,	loop_1627
	bn,pt	%xcc,	loop_1628
	and	%g5,	0x006E,	%i7
	taddcctv	%i1,	0x1AC0,	%g1
loop_1627:
	sub	%i3,	0x0E94,	%i6
loop_1628:
	edge32	%i5,	%g7,	%l4
	tpos	%icc,	0x2
	bne,pn	%icc,	loop_1629
	srl	%g4,	0x02,	%o4
	subccc	%o7,	0x06A4,	%g3
	nop
	fitod	%f6,	%f6
	fdtos	%f6,	%f5
loop_1629:
	or	%l5,	0x1186,	%o1
	set	0x54, %g4
	lda	[%l7 + %g4] 0x18,	%f6
	fmovd	%f20,	%f20
	fmovrdne	%g2,	%f4,	%f2
	fcmpeq32	%f18,	%f18,	%o5
	subcc	%l1,	%l2,	%o3
	fmovdge	%icc,	%f0,	%f11
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f13
	bpos,pn	%icc,	loop_1630
	fpadd32	%f30,	%f16,	%f6
	std	%f28,	[%l7 + 0x40]
	nop
	fitod	%f6,	%f2
	fdtos	%f2,	%f1
loop_1630:
	addc	%i4,	%o2,	%l0
	fmovrse	%g6,	%f22,	%f31
	sllx	%i2,	%l6,	%o6
	orcc	%l3,	%o0,	%g5
	ble,a	loop_1631
	tvc	%xcc,	0x4
	movne	%icc,	%i7,	%i1
	smulcc	%g1,	%i0,	%i6
loop_1631:
	fcmpgt16	%f2,	%f8,	%i5
	fbug	%fcc0,	loop_1632
	sth	%i3,	[%l7 + 0x58]
	tn	%xcc,	0x4
	fnor	%f18,	%f30,	%f12
loop_1632:
	fone	%f14
	orn	%l4,	0x19AA,	%g4
	fbue	%fcc1,	loop_1633
	movrgz	%o4,	%g7,	%o7
	movvc	%xcc,	%g3,	%l5
	movn	%icc,	%o1,	%o5
loop_1633:
	movrgez	%g2,	%l2,	%o3
	mulscc	%l1,	0x1BBA,	%o2
	fxnor	%f26,	%f22,	%f18
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x1A] %asi,	%i4
	sra	%g6,	0x08,	%l0
	edge8	%l6,	%i2,	%l3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x0A] %asi,	%o0
	fble	%fcc2,	loop_1634
	edge32	%o6,	%g5,	%i1
	smulcc	%i7,	%g1,	%i6
	movcc	%xcc,	%i5,	%i3
loop_1634:
	tpos	%xcc,	0x4
	edge16l	%l4,	%i0,	%o4
	andcc	%g7,	0x14DD,	%g4
	tcc	%xcc,	0x0
	stw	%g3,	[%l7 + 0x18]
	xnorcc	%o7,	%o1,	%l5
	tvs	%icc,	0x1
	orcc	%o5,	%l2,	%g2
	fbl,a	%fcc2,	loop_1635
	edge32	%o3,	%o2,	%l1
	orn	%g6,	0x11F5,	%l0
	stx	%i4,	[%l7 + 0x20]
loop_1635:
	tvc	%xcc,	0x2
	set	0x64, %i5
	lda	[%l7 + %i5] 0x88,	%f21
	movcc	%xcc,	%i2,	%l6
	membar	0x69
	movrgz	%l3,	0x256,	%o0
	brnz	%g5,	loop_1636
	movgu	%icc,	%i1,	%i7
	fmovsg	%icc,	%f28,	%f1
	array8	%g1,	%o6,	%i6
loop_1636:
	edge8	%i3,	%i5,	%l4
	fmovrde	%o4,	%f16,	%f0
	mulscc	%i0,	%g7,	%g4
	nop
	setx loop_1637, %l0, %l1
	jmpl %l1, %g3
	membar	0x72
	udivcc	%o7,	0x117C,	%l5
	andcc	%o1,	0x1EC2,	%o5
loop_1637:
	movvs	%xcc,	%l2,	%g2
	add	%o2,	%l1,	%g6
	fmovdpos	%icc,	%f13,	%f13
	sllx	%o3,	0x17,	%l0
	ta	%icc,	0x2
	set	0x58, %g1
	stwa	%i4,	[%l7 + %g1] 0x80
	taddcc	%i2,	0x1D8A,	%l3
	ba,a,pn	%xcc,	loop_1638
	movcc	%xcc,	%o0,	%g5
	fornot1	%f24,	%f30,	%f22
	tne	%icc,	0x2
loop_1638:
	fmovdl	%xcc,	%f5,	%f27
	alignaddr	%i1,	%l6,	%g1
	fsrc1s	%f7,	%f22
	umulcc	%i7,	0x1CFB,	%o6
	edge8	%i6,	%i5,	%i3
	fmovda	%xcc,	%f2,	%f0
	sll	%o4,	%l4,	%i0
	movleu	%icc,	%g4,	%g7
	smulcc	%o7,	0x0172,	%l5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%o5
	movneg	%xcc,	%g3,	%l2
	movneg	%icc,	%o2,	%g2
	tleu	%icc,	0x2
	movge	%icc,	%g6,	%l1
	move	%xcc,	%o3,	%i4
	movle	%icc,	%l0,	%i2
	fornot1s	%f18,	%f21,	%f19
	sub	%o0,	%l3,	%i1
	edge16n	%l6,	%g5,	%g1
	movneg	%icc,	%o6,	%i6
	set	0x08, %g3
	lda	[%l7 + %g3] 0x80,	%f8
	brlz,a	%i5,	loop_1639
	addccc	%i7,	%i3,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f26,	%f8,	%i0
loop_1639:
	movne	%xcc,	%g4,	%l4
	ld	[%l7 + 0x78],	%f25
	tgu	%xcc,	0x1
	fxors	%f8,	%f12,	%f9
	fmovscc	%icc,	%f11,	%f24
	set	0x6C, %l0
	lda	[%l7 + %l0] 0x80,	%f7
	fpack32	%f14,	%f6,	%f16
	orncc	%g7,	0x16F5,	%o7
	edge8l	%o1,	%o5,	%g3
	tle	%xcc,	0x0
	ldsw	[%l7 + 0x34],	%l5
	udivcc	%l2,	0x0F72,	%o2
	move	%icc,	%g6,	%l1
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f8
	nop
	setx	0x6B56FFE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x737E2CE7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f23,	%f27
	fmovdneg	%xcc,	%f22,	%f19
	array8	%g2,	%o3,	%l0
	fpackfix	%f24,	%f5
	subccc	%i2,	%i4,	%o0
	tsubcc	%i1,	%l3,	%l6
	call	loop_1640
	ldstub	[%l7 + 0x24],	%g1
	array32	%o6,	%i6,	%g5
	srax	%i5,	%i3,	%i7
loop_1640:
	fornot2	%f6,	%f24,	%f14
	std	%f20,	[%l7 + 0x70]
	fmovsvs	%xcc,	%f1,	%f12
	tn	%xcc,	0x5
	lduw	[%l7 + 0x70],	%i0
	tcc	%xcc,	0x1
	movg	%icc,	%g4,	%o4
	move	%xcc,	%g7,	%o7
	sir	0x1CF8
	taddcctv	%o1,	%o5,	%l4
	fmovrse	%g3,	%f17,	%f2
	fbe	%fcc0,	loop_1641
	fmul8x16au	%f27,	%f9,	%f20
	nop
	fitod	%f0,	%f12
	fdtos	%f12,	%f12
	and	%l2,	0x0731,	%l5
loop_1641:
	addccc	%o2,	0x04CA,	%l1
	fmuld8ulx16	%f12,	%f1,	%f24
	nop
	set	0x50, %g7
	ldsw	[%l7 + %g7],	%g6
	movrlz	%g2,	%o3,	%i2
	fabsd	%f12,	%f22
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x50] %asi,	%l0
	call	loop_1642
	taddcctv	%i4,	%o0,	%i1
	set	0x25, %i1
	ldstuba	[%l7 + %i1] 0x18,	%l6
loop_1642:
	stw	%l3,	[%l7 + 0x6C]
	bcc,a	loop_1643
	sdivcc	%g1,	0x1879,	%o6
	ble,a	loop_1644
	edge32l	%i6,	%i5,	%g5
loop_1643:
	tsubcctv	%i3,	0x1FC7,	%i7
	xorcc	%i0,	%o4,	%g7
loop_1644:
	nop
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x04,	%f16
	sth	%o7,	[%l7 + 0x5E]
	array16	%g4,	%o1,	%o5
	fxnor	%f22,	%f22,	%f26
	movrgez	%l4,	%l2,	%g3
	fcmple16	%f6,	%f8,	%o2
	mova	%icc,	%l1,	%l5
	bcc	loop_1645
	ble,a,pn	%icc,	loop_1646
	tsubcctv	%g2,	0x1D0E,	%g6
	tneg	%xcc,	0x7
loop_1645:
	sll	%i2,	%l0,	%i4
loop_1646:
	nop
	setx loop_1647, %l0, %l1
	jmpl %l1, %o3
	ldsh	[%l7 + 0x1C],	%o0
	andncc	%i1,	%l6,	%g1
	fnot1s	%f5,	%f21
loop_1647:
	xnor	%l3,	0x0FD8,	%i6
	tcs	%xcc,	0x6
	edge8l	%o6,	%i5,	%g5
	movgu	%icc,	%i3,	%i7
	smul	%o4,	%i0,	%g7
	taddcc	%o7,	0x004A,	%g4
	sll	%o5,	0x08,	%l4
	move	%xcc,	%o1,	%g3
	movn	%xcc,	%o2,	%l2
	ta	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l1,	0x12,	%g2
	popc	%g6,	%l5
	tsubcctv	%l0,	0x0A11,	%i4
	umulcc	%i2,	%o0,	%o3
	edge32n	%l6,	%g1,	%l3
	xorcc	%i6,	0x081C,	%i1
	andn	%i5,	%g5,	%i3
	andn	%o6,	%i7,	%o4
	fone	%f4
	edge16	%i0,	%o7,	%g7
	tcc	%xcc,	0x3
	tl	%icc,	0x0
	movneg	%icc,	%o5,	%l4
	bshuffle	%f6,	%f16,	%f2
	fbule	%fcc3,	loop_1648
	bgu,pt	%icc,	loop_1649
	tle	%xcc,	0x0
	stb	%g4,	[%l7 + 0x23]
loop_1648:
	nop
	setx	0xCFAFF879,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x12EBCA52,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f13,	%f8
loop_1649:
	fnot1s	%f11,	%f15
	fbuge	%fcc1,	loop_1650
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x24, %l4
	stba	%g3,	[%l7 + %l4] 0x2f
	membar	#Sync
loop_1650:
	fands	%f9,	%f17,	%f3
	tcs	%xcc,	0x5
	brlez	%o1,	loop_1651
	nop
	fitos	%f6,	%f16
	fstod	%f16,	%f18
	and	%o2,	0x1963,	%l2
	fbul,a	%fcc3,	loop_1652
loop_1651:
	orcc	%l1,	%g2,	%g6
	nop
	setx	0x84CF0ABC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x20BE4CC2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f23,	%f5
	andcc	%l5,	0x01E9,	%i4
loop_1652:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x3
	udiv	%l0,	0x003C,	%i2
	bvs,pt	%icc,	loop_1653
	umul	%o3,	0x0FAA,	%o0
	fmul8sux16	%f10,	%f16,	%f18
	edge8l	%l6,	%g1,	%i6
loop_1653:
	tgu	%xcc,	0x6
	fornot2	%f28,	%f20,	%f20
	udivx	%l3,	0x06DD,	%i5
	fcmpne16	%f6,	%f6,	%g5
	movl	%xcc,	%i1,	%o6
	array16	%i7,	%i3,	%i0
	fnegd	%f2,	%f8
	mulscc	%o4,	%o7,	%g7
	fnot1s	%f14,	%f12
	umulcc	%o5,	0x1F0C,	%l4
	tge	%icc,	0x3
	sra	%g3,	0x17,	%g4
	movcs	%icc,	%o2,	%o1
	tsubcctv	%l2,	%l1,	%g6
	edge16	%g2,	%i4,	%l0
	tleu	%icc,	0x6
	movne	%icc,	%l5,	%o3
	addccc	%o0,	%i2,	%g1
	fornot1s	%f30,	%f4,	%f31
	nop
	setx	0x67C3C91F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x949F6AB4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f8,	%f4
	taddcc	%i6,	0x0A9A,	%l6
	bcc,a	loop_1654
	nop
	setx loop_1655, %l0, %l1
	jmpl %l1, %i5
	tvc	%icc,	0x1
	addccc	%l3,	%i1,	%o6
loop_1654:
	fnot1	%f22,	%f18
loop_1655:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x5E] %asi,	%i7
	movgu	%icc,	%i3,	%i0
	edge32n	%g5,	%o4,	%o7
	srax	%o5,	0x0C,	%l4
	nop
	setx	0xFBA7550A807F2F82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	nop
	setx	0x4EAC8ED41D7148A5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x197E373EA4DB25F6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f18,	%f16
	andcc	%g3,	%g4,	%g7
	fand	%f26,	%f6,	%f30
	tvc	%xcc,	0x2
	stw	%o2,	[%l7 + 0x24]
	sdivcc	%o1,	0x1E30,	%l2
	brlez,a	%g6,	loop_1656
	array16	%g2,	%i4,	%l1
	fmovdneg	%icc,	%f29,	%f7
	edge32l	%l5,	%o3,	%l0
loop_1656:
	bg,a,pn	%xcc,	loop_1657
	orcc	%i2,	%o0,	%i6
	fmul8x16au	%f1,	%f17,	%f4
	sdiv	%l6,	0x0FD3,	%g1
loop_1657:
	fabsd	%f30,	%f18
	ldsh	[%l7 + 0x1E],	%l3
	mova	%icc,	%i1,	%i5
	fnot2	%f0,	%f16
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
	ldub	[%l7 + 0x6C],	%i7
	srl	%i3,	0x10,	%i0
	movl	%xcc,	%g5,	%o6
	subcc	%o4,	0x1CE2,	%o7
	brlz,a	%o5,	loop_1658
	orncc	%l4,	%g4,	%g7
	faligndata	%f12,	%f8,	%f28
	fmovsne	%xcc,	%f9,	%f8
loop_1658:
	orcc	%o2,	%o1,	%l2
	movvs	%icc,	%g6,	%g3
	add	%i4,	0x1492,	%g2
	alignaddrl	%l5,	%l1,	%o3
	sllx	%l0,	0x13,	%o0
	xnorcc	%i2,	0x12B9,	%l6
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%f10
	addc	%g1,	%l3,	%i1
	fmovsgu	%icc,	%f29,	%f10
	fmovdleu	%xcc,	%f8,	%f13
	lduw	[%l7 + 0x70],	%i5
	prefetch	[%l7 + 0x40],	 0x0
	addccc	%i6,	%i3,	%i0
	brnz,a	%i7,	loop_1659
	fmul8x16au	%f28,	%f26,	%f30
	fbo	%fcc3,	loop_1660
	tcs	%xcc,	0x6
loop_1659:
	movn	%icc,	%o6,	%g5
	fnot1s	%f31,	%f0
loop_1660:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f2,	%f2,	%f22
	movge	%xcc,	%o7,	%o5
	wr	%g0,	0x5f,	%asi
	stxa	%o4,	[%g0 + 0x0] %asi
	fpsub32	%f30,	%f20,	%f6
	or	%g4,	%g7,	%l4
	tpos	%icc,	0x6
	add	%o2,	0x082F,	%o1
	edge8ln	%l2,	%g3,	%i4
	tsubcc	%g2,	0x1A70,	%l5
	fbge,a	%fcc2,	loop_1661
	bge,pt	%xcc,	loop_1662
	mulscc	%l1,	%g6,	%o3
	membar	0x18
loop_1661:
	nop
	set	0x18, %i3
	lduha	[%l7 + %i3] 0x80,	%o0
loop_1662:
	xorcc	%l0,	%l6,	%g1
	fpsub32s	%f8,	%f1,	%f12
	movrlz	%l3,	%i1,	%i2
	sdiv	%i5,	0x180B,	%i3
	swap	[%l7 + 0x68],	%i6
	tpos	%icc,	0x3
	udivcc	%i0,	0x0B29,	%o6
	tvs	%icc,	0x5
	set	0x5E, %i0
	ldstuba	[%l7 + %i0] 0x88,	%g5
	call	loop_1663
	tvc	%icc,	0x0
	andcc	%i7,	%o5,	%o7
	fmovdn	%icc,	%f12,	%f20
loop_1663:
	fxor	%f8,	%f18,	%f10
	fbu	%fcc3,	loop_1664
	movrlez	%o4,	0x3AB,	%g4
	edge32ln	%g7,	%o2,	%l4
	tne	%xcc,	0x3
loop_1664:
	udivcc	%o1,	0x1637,	%l2
	nop
	setx loop_1665, %l0, %l1
	jmpl %l1, %g3
	flush	%l7 + 0x6C
	fand	%f10,	%f24,	%f16
	orcc	%g2,	%i4,	%l1
loop_1665:
	alignaddrl	%g6,	%l5,	%o3
	set	0x20, %g5
	swapa	[%l7 + %g5] 0x80,	%o0
	sll	%l6,	%l0,	%g1
	nop
	setx	0xCF2B39B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x4A90CBB2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f16,	%f11
	movg	%xcc,	%l3,	%i1
	tge	%icc,	0x4
	mulx	%i5,	%i3,	%i2
	ta	%icc,	0x1
	xnorcc	%i0,	%i6,	%g5
	sdivx	%i7,	0x0708,	%o5
	fbe	%fcc0,	loop_1666
	andcc	%o7,	0x16AE,	%o4
	movge	%xcc,	%o6,	%g4
	edge8ln	%o2,	%g7,	%o1
loop_1666:
	xnorcc	%l4,	%l2,	%g2
	fmovdpos	%icc,	%f16,	%f7
	fornot1	%f2,	%f0,	%f4
	tsubcctv	%i4,	%l1,	%g3
	move	%xcc,	%g6,	%l5
	fbul	%fcc2,	loop_1667
	ldstub	[%l7 + 0x0B],	%o3
	umul	%l6,	0x0298,	%l0
	sdivcc	%o0,	0x1924,	%g1
loop_1667:
	taddcctv	%i1,	%i5,	%i3
	tneg	%xcc,	0x1
	edge8ln	%l3,	%i0,	%i2
	fmovdge	%xcc,	%f5,	%f16
	move	%xcc,	%g5,	%i6
	fmovsvc	%xcc,	%f24,	%f22
	sdivx	%i7,	0x1D92,	%o5
	fcmple16	%f22,	%f10,	%o4
	mulscc	%o7,	0x01C8,	%o6
	fcmple32	%f28,	%f0,	%g4
	bleu	loop_1668
	fnegs	%f14,	%f4
	te	%icc,	0x1
	bpos,a,pt	%icc,	loop_1669
loop_1668:
	stbar
	subcc	%o2,	0x0690,	%o1
	fxnor	%f24,	%f24,	%f26
loop_1669:
	movg	%xcc,	%l4,	%l2
	edge8	%g7,	%g2,	%i4
	subccc	%l1,	%g6,	%g3
	smulcc	%l5,	0x0BA6,	%o3
	addc	%l0,	0x0B79,	%o0
	xnorcc	%l6,	%i1,	%g1
	fcmpgt32	%f10,	%f14,	%i5
	fornot2s	%f26,	%f18,	%f0
	udiv	%i3,	0x0612,	%l3
	smulcc	%i0,	0x0ADC,	%g5
	fands	%f23,	%f5,	%f2
	fandnot2s	%f12,	%f7,	%f15
	umulcc	%i6,	0x06C0,	%i7
	movge	%icc,	%i2,	%o5
	movneg	%icc,	%o7,	%o4
	addc	%g4,	%o6,	%o1
	sub	%l4,	0x1D03,	%l2
	fxnor	%f30,	%f18,	%f26
	membar	0x46
	tne	%xcc,	0x2
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x2b,	%o2
	tl	%xcc,	0x2
	te	%xcc,	0x1
	nop
	fitod	%f10,	%f4
	fdtox	%f4,	%f8
	edge8ln	%g2,	%g7,	%i4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x5C] %asi,	%f13
	movrgz	%l1,	0x25E,	%g6
	edge16	%g3,	%o3,	%l5
	edge32l	%o0,	%l6,	%i1
	movgu	%xcc,	%l0,	%i5
	fmovdge	%xcc,	%f29,	%f28
	wr	%g0,	0x2b,	%asi
	stwa	%i3,	[%l7 + 0x44] %asi
	membar	#Sync
	mulscc	%l3,	%i0,	%g1
	popc	0x136F,	%i6
	tpos	%xcc,	0x7
	fandnot1s	%f4,	%f17,	%f14
	bl,pt	%icc,	loop_1670
	tneg	%icc,	0x2
	andn	%i7,	%g5,	%o5
	nop
	setx	0x1DA94AC2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x7B7091CA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f24,	%f16
loop_1670:
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%i2
	fnot1	%f0,	%f22
	wr	%g0,	0x2f,	%asi
	stha	%o7,	[%l7 + 0x48] %asi
	membar	#Sync
	andncc	%g4,	%o4,	%o1
	edge16l	%o6,	%l4,	%l2
	ldsb	[%l7 + 0x0D],	%g2
	st	%f28,	[%l7 + 0x60]
	fble,a	%fcc0,	loop_1671
	sra	%o2,	0x1A,	%i4
	for	%f30,	%f22,	%f28
	faligndata	%f10,	%f24,	%f28
loop_1671:
	movcc	%icc,	%l1,	%g6
	sllx	%g7,	%o3,	%g3
	taddcctv	%o0,	0x1639,	%l6
	brz,a	%i1,	loop_1672
	stx	%l5,	[%l7 + 0x48]
	tpos	%xcc,	0x1
	orncc	%i5,	%l0,	%l3
loop_1672:
	ble,pt	%xcc,	loop_1673
	nop
	setx	0xE0DBE91FAE67A1DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x8E3F495AD4B8A763,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f18,	%f30
	movl	%xcc,	%i3,	%i0
	tcc	%xcc,	0x0
loop_1673:
	add	%i6,	%g1,	%i7
	subccc	%o5,	0x059E,	%i2
	movleu	%xcc,	%g5,	%o7
	fmovdvc	%xcc,	%f12,	%f20
	xorcc	%g4,	%o1,	%o4
	fxor	%f20,	%f0,	%f24
	edge16n	%o6,	%l2,	%l4
	movvs	%icc,	%g2,	%o2
	bge	loop_1674
	fxnor	%f6,	%f20,	%f28
	fnand	%f8,	%f8,	%f14
	stx	%i4,	[%l7 + 0x48]
loop_1674:
	umulcc	%l1,	0x1656,	%g6
	edge8l	%g7,	%g3,	%o3
	fmovdvc	%icc,	%f1,	%f6
	movrlez	%o0,	%l6,	%l5
	fpack32	%f28,	%f30,	%f30
	udiv	%i1,	0x0CCF,	%i5
	movpos	%icc,	%l3,	%l0
	fbue,a	%fcc0,	loop_1675
	sdivcc	%i0,	0x0BA8,	%i6
	fba	%fcc1,	loop_1676
	subccc	%i3,	%i7,	%o5
loop_1675:
	umulcc	%g1,	%i2,	%o7
	fmovdl	%xcc,	%f23,	%f8
loop_1676:
	edge32	%g4,	%o1,	%o4
	fmovscc	%icc,	%f23,	%f15
	sllx	%o6,	0x0C,	%g5
	sth	%l2,	[%l7 + 0x24]
	andncc	%g2,	%o2,	%l4
	fbue	%fcc2,	loop_1677
	fmovsl	%xcc,	%f8,	%f26
	set	0x46, %l6
	lduha	[%l7 + %l6] 0x80,	%i4
loop_1677:
	mulx	%g6,	0x0A19,	%l1
	set	0x10, %o1
	lduha	[%l7 + %o1] 0x15,	%g3
	sra	%o3,	%o0,	%g7
	bpos,pn	%icc,	loop_1678
	fmovd	%f10,	%f20
	orncc	%l6,	%i1,	%l5
	swap	[%l7 + 0x48],	%i5
loop_1678:
	brgez	%l0,	loop_1679
	edge8ln	%i0,	%i6,	%l3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x19] %asi,	%i3
loop_1679:
	nop
	setx	0xF6ECC8FFD4BA8D64,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x89EC78456331D3AE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f14,	%f20
	ldstub	[%l7 + 0x43],	%o5
	smulcc	%g1,	%i2,	%o7
	edge16ln	%g4,	%i7,	%o1
	udiv	%o6,	0x0608,	%o4
	tsubcc	%g5,	0x0602,	%l2
	srax	%g2,	%o2,	%l4
	udiv	%i4,	0x004B,	%g6
	bne,a	%icc,	loop_1680
	addcc	%l1,	0x0307,	%g3
	taddcc	%o0,	%o3,	%g7
	subcc	%l6,	0x1086,	%i1
loop_1680:
	tsubcctv	%l5,	0x060A,	%i5
	fbge,a	%fcc2,	loop_1681
	andcc	%l0,	%i6,	%i0
	orncc	%i3,	0x19A6,	%o5
	tsubcc	%g1,	0x01A4,	%l3
loop_1681:
	tneg	%icc,	0x3
	or	%i2,	0x0166,	%g4
	tsubcctv	%i7,	%o1,	%o7
	fnot2	%f30,	%f30
	fornot2	%f22,	%f8,	%f8
	sdivcc	%o6,	0x1399,	%g5
	array16	%l2,	%o4,	%o2
	nop
	fitos	%f13,	%f18
	fstox	%f18,	%f0
	alignaddr	%g2,	%l4,	%i4
	fandnot2s	%f10,	%f14,	%f27
	udivx	%l1,	0x0232,	%g6
	array32	%o0,	%g3,	%g7
	sll	%l6,	0x1C,	%o3
	movcs	%icc,	%l5,	%i5
	nop
	fitod	%f4,	%f18
	fdtoi	%f18,	%f5
	edge16ln	%i1,	%l0,	%i0
	fandnot1s	%f17,	%f15,	%f8
	fzeros	%f29
	tg	%xcc,	0x7
	movrlez	%i6,	0x27C,	%i3
	fble	%fcc2,	loop_1682
	fcmpgt16	%f26,	%f2,	%o5
	edge8l	%g1,	%i2,	%g4
	fbg	%fcc1,	loop_1683
loop_1682:
	fbule	%fcc0,	loop_1684
	fmovsleu	%icc,	%f29,	%f1
	fbo,a	%fcc0,	loop_1685
loop_1683:
	movrne	%i7,	0x072,	%l3
loop_1684:
	tcc	%icc,	0x3
	tle	%xcc,	0x5
loop_1685:
	nop
	set	0x10, %o2
	ldda	[%l7 + %o2] 0x2f,	%o6
	addccc	%o6,	0x0DA1,	%o1
	nop
	setx	0x553D0455,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xD9A057EA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f6,	%f30
	andn	%g5,	0x0682,	%l2
	movleu	%xcc,	%o2,	%g2
	sll	%l4,	%i4,	%l1
	srlx	%g6,	0x1C,	%o0
	fbug	%fcc3,	loop_1686
	addccc	%o4,	0x1AA2,	%g3
	fmovs	%f28,	%f3
	fornot1s	%f27,	%f22,	%f10
loop_1686:
	tg	%icc,	0x0
	edge32	%g7,	%l6,	%l5
	brlz,a	%o3,	loop_1687
	srax	%i5,	%i1,	%l0
	fmovrdlz	%i6,	%f8,	%f18
	fmovdcc	%xcc,	%f27,	%f9
loop_1687:
	movl	%xcc,	%i3,	%i0
	nop
	set	0x7C, %i7
	lduw	[%l7 + %i7],	%o5
	movvs	%xcc,	%g1,	%i2
	fmovdpos	%icc,	%f31,	%f14
	edge32n	%g4,	%i7,	%o7
	tcs	%icc,	0x1
	nop
	setx loop_1688, %l0, %l1
	jmpl %l1, %o6
	fmovrde	%o1,	%f26,	%f6
	edge16n	%g5,	%l3,	%l2
	fmul8ulx16	%f16,	%f4,	%f10
loop_1688:
	add	%g2,	0x0E16,	%o2
	sllx	%l4,	0x14,	%i4
	umul	%g6,	0x184E,	%o0
	edge8	%l1,	%o4,	%g3
	fblg,a	%fcc2,	loop_1689
	fpack16	%f18,	%f5
	fmovrdgez	%l6,	%f20,	%f8
	taddcc	%l5,	0x1DF6,	%g7
loop_1689:
	stbar
	fpsub16s	%f8,	%f13,	%f4
	movle	%icc,	%o3,	%i5
	faligndata	%f22,	%f8,	%f10
	movvc	%icc,	%i1,	%i6
	popc	%i3,	%i0
	udiv	%l0,	0x0921,	%o5
	mulx	%g1,	0x1B84,	%i2
	bvc,a,pt	%icc,	loop_1690
	stx	%g4,	[%l7 + 0x08]
	tl	%xcc,	0x1
	alignaddr	%o7,	%i7,	%o1
loop_1690:
	fsrc1	%f16,	%f30
	tneg	%icc,	0x5
	tcc	%xcc,	0x2
	fmovdpos	%xcc,	%f28,	%f29
	fsrc1	%f8,	%f12
	srlx	%o6,	%l3,	%g5
	nop
	setx	0xB7D6BCE88B8E005F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xBCAAD8C11334AD58,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f22,	%f2
	movrne	%g2,	%l2,	%l4
	edge16n	%i4,	%o2,	%g6
	brgz,a	%o0,	loop_1691
	subcc	%l1,	%o4,	%g3
	movrgz	%l6,	%g7,	%l5
	st	%f3,	[%l7 + 0x60]
loop_1691:
	nop
	setx	loop_1692,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsneg	%xcc,	%f18,	%f8
	be,a,pt	%icc,	loop_1693
	fbg,a	%fcc1,	loop_1694
loop_1692:
	sllx	%i5,	0x01,	%o3
	fnands	%f19,	%f30,	%f2
loop_1693:
	fmul8ulx16	%f12,	%f22,	%f8
loop_1694:
	nop
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x2F] %asi,	%i1
	movne	%icc,	%i3,	%i0
	brgz,a	%l0,	loop_1695
	movl	%icc,	%i6,	%o5
	bshuffle	%f20,	%f2,	%f30
	edge16ln	%g1,	%g4,	%o7
loop_1695:
	fcmpgt32	%f20,	%f22,	%i2
	set	0x6E, %g2
	lduba	[%l7 + %g2] 0x19,	%i7
	tcc	%icc,	0x0
	edge16ln	%o6,	%o1,	%l3
	xnor	%g5,	0x1D7D,	%l2
	bcs,a,pt	%xcc,	loop_1696
	fmovs	%f12,	%f25
	bneg	loop_1697
	taddcc	%l4,	0x01C6,	%g2
loop_1696:
	fpackfix	%f22,	%f11
	tn	%xcc,	0x0
loop_1697:
	edge8l	%i4,	%g6,	%o2
	orncc	%o0,	0x080D,	%l1
	or	%o4,	%l6,	%g7
	fmovrslez	%g3,	%f21,	%f16
	fpack32	%f6,	%f10,	%f4
	fmovda	%xcc,	%f18,	%f29
	brz	%i5,	loop_1698
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f6
	fxtod	%f6,	%f2
	smulcc	%o3,	0x109D,	%i1
	sllx	%l5,	0x11,	%i0
loop_1698:
	fmovdleu	%xcc,	%f18,	%f0
	addcc	%l0,	%i6,	%i3
	sub	%g1,	%g4,	%o5
	alignaddrl	%o7,	%i7,	%o6
	fbule	%fcc0,	loop_1699
	ta	%xcc,	0x4
	set	0x60, %o3
	ldsha	[%l7 + %o3] 0x80,	%o1
loop_1699:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x64] %asi,	%f13
	fornot1	%f30,	%f8,	%f28
	edge32l	%l3,	%g5,	%l2
	st	%f25,	[%l7 + 0x18]
	fzeros	%f11
	fexpand	%f30,	%f6
	fmovrde	%l4,	%f16,	%f6
	fand	%f14,	%f30,	%f24
	addc	%i2,	0x1618,	%i4
	orn	%g2,	%g6,	%o2
	andcc	%l1,	%o0,	%o4
	edge8n	%l6,	%g7,	%i5
	xorcc	%o3,	%g3,	%i1
	bcc,a,pt	%icc,	loop_1700
	stbar
	fpsub32	%f24,	%f6,	%f0
	nop
	setx	loop_1701,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1700:
	edge16ln	%l5,	%l0,	%i6
	movneg	%xcc,	%i0,	%g1
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x36] %asi,	%i3
loop_1701:
	fbg,a	%fcc1,	loop_1702
	tleu	%xcc,	0x6
	andn	%g4,	0x14FC,	%o7
	movl	%icc,	%i7,	%o6
loop_1702:
	fmovrslez	%o1,	%f27,	%f15
	fpsub32	%f16,	%f18,	%f12
	tg	%xcc,	0x7
	addccc	%l3,	%o5,	%g5
	fbul,a	%fcc0,	loop_1703
	srl	%l2,	%l4,	%i4
	movvc	%icc,	%g2,	%g6
	edge16n	%i2,	%o2,	%l1
loop_1703:
	fmovs	%f13,	%f20
	alignaddrl	%o0,	%l6,	%g7
	movvc	%icc,	%o4,	%i5
	fxor	%f12,	%f30,	%f22
	tgu	%xcc,	0x4
	sra	%o3,	0x08,	%g3
	tvc	%icc,	0x4
	sllx	%l5,	%i1,	%i6
	movneg	%icc,	%l0,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i3,	0x3B3,	%i0
	nop
	fitod	%f4,	%f24
	fdtos	%f24,	%f29
	udivcc	%g4,	0x18DF,	%i7
	tpos	%xcc,	0x6
	tge	%icc,	0x1
	add	%o6,	0x0EBF,	%o7
	nop
	setx	0x515CF3E619C82D82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f24
	andn	%o1,	%l3,	%o5
	wr	%g0,	0x20,	%asi
	stxa	%g5,	[%g0 + 0x0] %asi
	movrlez	%l4,	%l2,	%g2
	fnors	%f4,	%f24,	%f26
	fands	%f16,	%f0,	%f2
	fnors	%f2,	%f1,	%f13
	andcc	%i4,	%i2,	%g6
	movpos	%xcc,	%o2,	%o0
	movn	%xcc,	%l6,	%l1
	ldub	[%l7 + 0x6F],	%g7
	sub	%o4,	%i5,	%o3
	bcs,a,pn	%icc,	loop_1704
	fbue	%fcc0,	loop_1705
	edge8l	%g3,	%i1,	%i6
	movn	%xcc,	%l5,	%g1
loop_1704:
	fbul	%fcc2,	loop_1706
loop_1705:
	tvc	%icc,	0x3
	fmovrdgz	%i3,	%f12,	%f22
	ld	[%l7 + 0x18],	%f2
loop_1706:
	edge8	%l0,	%g4,	%i0
	sll	%o6,	%o7,	%i7
	swap	[%l7 + 0x3C],	%l3
	sub	%o1,	%g5,	%o5
	alignaddr	%l4,	%l2,	%g2
	nop
	setx	0x2EF41B79E062C07E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	wr	%g0,	0x81,	%asi
	stha	%i2,	[%l7 + 0x48] %asi
	tsubcctv	%g6,	0x1A6E,	%o2
	move	%icc,	%o0,	%l6
	array8	%i4,	%l1,	%g7
	fxnor	%f4,	%f4,	%f26
	tleu	%xcc,	0x2
	move	%xcc,	%o4,	%o3
	movvc	%icc,	%g3,	%i1
	fpadd32s	%f28,	%f25,	%f23
	tcc	%xcc,	0x0
	sdiv	%i5,	0x00E8,	%i6
	edge16	%g1,	%l5,	%l0
	tpos	%icc,	0x5
	movpos	%xcc,	%i3,	%i0
	tsubcc	%g4,	%o6,	%o7
	mulx	%l3,	%i7,	%o1
	fpsub16	%f4,	%f0,	%f6
	addcc	%g5,	%o5,	%l2
	fmovdg	%icc,	%f15,	%f9
	move	%icc,	%g2,	%l4
	tcs	%xcc,	0x5
	fbuge	%fcc3,	loop_1707
	movl	%icc,	%i2,	%o2
	mulx	%g6,	%o0,	%l6
	fmovsne	%icc,	%f26,	%f8
loop_1707:
	srl	%i4,	0x16,	%l1
	fabss	%f20,	%f12
	fornot2s	%f30,	%f29,	%f12
	edge16l	%o4,	%o3,	%g3
	stx	%i1,	[%l7 + 0x68]
	fnegd	%f6,	%f30
	movvs	%xcc,	%g7,	%i5
	edge16l	%g1,	%i6,	%l0
	xor	%l5,	0x05AE,	%i3
	set	0x48, %o4
	stxa	%i0,	[%l7 + %o4] 0x0c
	movvc	%xcc,	%o6,	%o7
	nop
	set	0x34, %i4
	sth	%g4,	[%l7 + %i4]
	ldsw	[%l7 + 0x20],	%i7
	srlx	%l3,	0x13,	%g5
	fnegs	%f9,	%f15
	srlx	%o1,	0x07,	%l2
	fmovsge	%xcc,	%f17,	%f1
	tleu	%xcc,	0x4
	ba	loop_1708
	fbul,a	%fcc2,	loop_1709
	tleu	%icc,	0x2
	pdist	%f14,	%f22,	%f6
loop_1708:
	edge8n	%g2,	%l4,	%o5
loop_1709:
	fmovdn	%icc,	%f13,	%f26
	sll	%i2,	%g6,	%o2
	movvc	%icc,	%o0,	%l6
	fsrc2	%f16,	%f18
	xnorcc	%i4,	0x00B8,	%o4
	fornot1	%f18,	%f30,	%f0
	fmovrse	%o3,	%f7,	%f18
	fpmerge	%f28,	%f31,	%f26
	fbge,a	%fcc3,	loop_1710
	movrlez	%l1,	%g3,	%i1
	fmul8x16	%f19,	%f24,	%f10
	fbo,a	%fcc3,	loop_1711
loop_1710:
	movrgz	%i5,	0x2EE,	%g1
	sdiv	%g7,	0x08A7,	%l0
	movleu	%icc,	%i6,	%i3
loop_1711:
	bgu,a,pn	%xcc,	loop_1712
	edge8	%i0,	%l5,	%o7
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f15
	tne	%icc,	0x0
loop_1712:
	fbne	%fcc1,	loop_1713
	bgu,a	%icc,	loop_1714
	edge8n	%o6,	%g4,	%l3
	fmovrse	%g5,	%f29,	%f29
loop_1713:
	faligndata	%f8,	%f16,	%f28
loop_1714:
	nop
	setx	0x1B40BE07007421DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	set	0x5C, %g6
	stwa	%i7,	[%l7 + %g6] 0x2a
	membar	#Sync
	tsubcc	%o1,	0x04E8,	%l2
	bcc,a,pt	%icc,	loop_1715
	tsubcc	%g2,	0x08BB,	%l4
	sdivcc	%i2,	0x1E9F,	%o5
	stx	%g6,	[%l7 + 0x48]
loop_1715:
	edge8ln	%o0,	%l6,	%i4
	array32	%o2,	%o4,	%o3
	nop
	setx	0x56C8D02BD889E18E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x5AA08DDBFD01E0EC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f18,	%f4
	edge16l	%l1,	%g3,	%i5
	alignaddrl	%g1,	%i1,	%g7
	fcmpgt32	%f12,	%f22,	%l0
	brlz,a	%i6,	loop_1716
	fmovdle	%icc,	%f18,	%f1
	ble,a	%xcc,	loop_1717
	srlx	%i3,	%l5,	%i0
loop_1716:
	smul	%o7,	%o6,	%g4
	sllx	%g5,	%i7,	%o1
loop_1717:
	mova	%xcc,	%l3,	%g2
	fmovsgu	%xcc,	%f14,	%f11
	sdivx	%l4,	0x01AE,	%i2
	fmovdle	%icc,	%f10,	%f6
	tpos	%icc,	0x2
	fnors	%f24,	%f18,	%f5
	movvs	%xcc,	%o5,	%l2
	udiv	%o0,	0x07FB,	%l6
	smul	%i4,	%g6,	%o2
	fxor	%f10,	%f20,	%f14
	edge16l	%o3,	%o4,	%l1
	fnegd	%f10,	%f18
	flush	%l7 + 0x38
	movge	%icc,	%i5,	%g1
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	edge16ln	%i1,	%g7,	%l0
	movneg	%xcc,	%i3,	%l5
	nop
	fitos	%f8,	%f3
	fstoi	%f3,	%f20
	stx	%i6,	[%l7 + 0x50]
	tsubcctv	%o7,	0x1DBC,	%i0
	array16	%o6,	%g5,	%g4
	tg	%xcc,	0x3
	ldsw	[%l7 + 0x08],	%o1
	nop
	fitos	%f8,	%f29
	fstox	%f29,	%f0
	fxtos	%f0,	%f10
	edge8l	%i7,	%l3,	%g2
	tsubcctv	%i2,	%l4,	%o5
	fpmerge	%f8,	%f14,	%f18
	fpack16	%f8,	%f29
	movneg	%xcc,	%o0,	%l6
	edge16ln	%i4,	%l2,	%g6
	nop
	fitos	%f14,	%f11
	fstoi	%f11,	%f12
	taddcctv	%o2,	0x1C8A,	%o3
	movre	%o4,	%l1,	%g1
	edge16n	%i5,	%g3,	%i1
	andcc	%g7,	%i3,	%l0
	fornot1	%f20,	%f24,	%f26
	andn	%i6,	0x011E,	%o7
	set	0x2C, %l2
	swapa	[%l7 + %l2] 0x88,	%l5
	mova	%xcc,	%i0,	%o6
	fcmple16	%f20,	%f22,	%g5
	bne,a,pn	%xcc,	loop_1718
	movg	%xcc,	%g4,	%o1
	movcc	%xcc,	%i7,	%l3
	edge16ln	%i2,	%l4,	%o5
loop_1718:
	xnor	%g2,	%l6,	%i4
	bcc,a	%icc,	loop_1719
	fbge	%fcc3,	loop_1720
	nop
	fitos	%f4,	%f21
	fstod	%f21,	%f20
	bl,a	%icc,	loop_1721
loop_1719:
	bge,pt	%icc,	loop_1722
loop_1720:
	edge32l	%l2,	%o0,	%g6
	tpos	%xcc,	0x2
loop_1721:
	movge	%icc,	%o3,	%o4
loop_1722:
	stx	%o2,	[%l7 + 0x48]
	smulcc	%l1,	0x051D,	%i5
	ldsb	[%l7 + 0x37],	%g1
	bleu,a,pt	%xcc,	loop_1723
	fpsub32s	%f21,	%f11,	%f26
	nop
	setx	0x027C123B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x951F0595,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f27,	%f7
	umulcc	%i1,	%g7,	%g3
loop_1723:
	st	%f23,	[%l7 + 0x10]
	ldstub	[%l7 + 0x3D],	%i3
	fxor	%f0,	%f24,	%f28
	wr	%g0,	0x10,	%asi
	sta	%f16,	[%l7 + 0x58] %asi
	membar	0x26
	xnor	%i6,	0x0413,	%o7
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l0,	%l5
	fmovrdgez	%o6,	%f10,	%f2
	movge	%icc,	%i0,	%g4
	movre	%g5,	0x158,	%o1
	tvs	%icc,	0x6
	udivx	%i7,	0x0D87,	%l3
	andncc	%i2,	%o5,	%l4
	st	%f31,	[%l7 + 0x18]
	movgu	%icc,	%l6,	%g2
	set	0x2C, %l1
	lda	[%l7 + %l1] 0x19,	%f7
	subccc	%l2,	0x15C2,	%o0
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x12] %asi,	%g6
	set	0x08, %o0
	stxa	%i4,	[%l7 + %o0] 0x11
	fmul8x16au	%f29,	%f18,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc0,	loop_1724
	movneg	%xcc,	%o4,	%o2
	std	%f8,	[%l7 + 0x08]
	add	%l1,	0x1BA4,	%o3
loop_1724:
	bcs,a,pt	%xcc,	loop_1725
	fmovdvs	%xcc,	%f3,	%f2
	alignaddrl	%g1,	%i1,	%i5
	tg	%icc,	0x5
loop_1725:
	movrgez	%g3,	0x3CA,	%i3
	nop
	fitos	%f10,	%f30
	fstox	%f30,	%f14
	sir	0x0721
	addcc	%g7,	%o7,	%l0
	movvs	%xcc,	%l5,	%o6
	tg	%icc,	0x2
	fcmpeq32	%f12,	%f24,	%i0
	andn	%i6,	0x1435,	%g4
	fmovdneg	%icc,	%f2,	%f14
	movge	%icc,	%g5,	%o1
	srl	%l3,	%i7,	%i2
	movvc	%xcc,	%o5,	%l4
	tg	%xcc,	0x7
	alignaddrl	%l6,	%g2,	%o0
	sethi	0x00B9,	%l2
	edge16	%g6,	%o4,	%i4
	bg,pt	%xcc,	loop_1726
	mulx	%l1,	0x0530,	%o3
	edge8l	%o2,	%g1,	%i1
	fpsub32s	%f18,	%f29,	%f5
loop_1726:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x38] %asi,	%i5
	movrne	%g3,	0x0A1,	%i3
	fcmpne16	%f24,	%f28,	%o7
	edge32ln	%l0,	%g7,	%l5
	srl	%i0,	%o6,	%g4
	udivx	%i6,	0x1A4D,	%o1
	be	loop_1727
	movpos	%icc,	%g5,	%i7
	xorcc	%l3,	%o5,	%i2
	stb	%l6,	[%l7 + 0x32]
loop_1727:
	alignaddr	%g2,	%l4,	%l2
	te	%xcc,	0x1
	fmul8ulx16	%f8,	%f30,	%f0
	edge32n	%o0,	%g6,	%i4
	fmovsvc	%icc,	%f4,	%f29
	movpos	%icc,	%l1,	%o3
	nop
	setx	loop_1728,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%o4,	0x04,	%g1
	alignaddrl	%o2,	%i1,	%g3
	tleu	%icc,	0x4
loop_1728:
	mulx	%i3,	0x1DE8,	%i5
	movrgez	%l0,	0x1C9,	%o7
	xorcc	%l5,	0x17FA,	%g7
	fmovscs	%icc,	%f2,	%f22
	andn	%i0,	%g4,	%o6
	fnot1	%f12,	%f26
	movg	%xcc,	%o1,	%i6
	ldd	[%l7 + 0x18],	%f28
	fmovrslz	%g5,	%f24,	%f30
	fmovd	%f24,	%f8
	edge16n	%l3,	%i7,	%o5
	nop
	setx	0x1A424349,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f13
	ldsw	[%l7 + 0x60],	%i2
	srax	%l6,	%l4,	%g2
	std	%f26,	[%l7 + 0x50]
	addc	%l2,	%g6,	%o0
	brgz	%l1,	loop_1729
	brnz,a	%o3,	loop_1730
	tneg	%xcc,	0x6
	sdivcc	%i4,	0x0C48,	%g1
loop_1729:
	nop
	setx	0xA11B9369EEA91779,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x2A615D08BCFD509C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f4,	%f10
loop_1730:
	tge	%xcc,	0x6
	set	0x30, %l3
	stwa	%o4,	[%l7 + %l3] 0x0c
	xorcc	%o2,	0x1889,	%i1
	edge8ln	%i3,	%i5,	%g3
	tn	%icc,	0x4
	fcmpeq16	%f20,	%f18,	%o7
	tsubcc	%l5,	%g7,	%i0
	tleu	%icc,	0x0
	srax	%g4,	0x07,	%l0
	edge32	%o1,	%i6,	%o6
	set	0x10, %o5
	ldda	[%l7 + %o5] 0x18,	%l2
	umul	%g5,	%o5,	%i2
	sra	%l6,	0x03,	%i7
	ldd	[%l7 + 0x58],	%g2
	fandnot1s	%f7,	%f14,	%f14
	sdiv	%l4,	0x1C6D,	%l2
	brlez,a	%o0,	loop_1731
	fbo,a	%fcc1,	loop_1732
	fornot1s	%f3,	%f23,	%f30
	andncc	%l1,	%g6,	%o3
loop_1731:
	fcmpne16	%f28,	%f22,	%i4
loop_1732:
	ldx	[%l7 + 0x48],	%o4
	sra	%o2,	%g1,	%i3
	sdiv	%i1,	0x0409,	%i5
	wr	%g0,	0x23,	%asi
	stwa	%o7,	[%l7 + 0x50] %asi
	membar	#Sync
	fexpand	%f6,	%f28
	tvs	%icc,	0x7
	nop
	setx	loop_1733,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16au	%f16,	%f10,	%f4
	membar	0x71
	alignaddr	%l5,	%g7,	%g3
loop_1733:
	sdivx	%i0,	0x03EB,	%g4
	call	loop_1734
	edge32n	%l0,	%o1,	%i6
	sth	%l3,	[%l7 + 0x2C]
	be,pt	%icc,	loop_1735
loop_1734:
	smulcc	%g5,	%o5,	%o6
	fmovdcc	%icc,	%f20,	%f18
	edge32l	%l6,	%i7,	%i2
loop_1735:
	fmovdleu	%xcc,	%f30,	%f6
	movrne	%g2,	%l2,	%l4
	mulx	%o0,	%g6,	%o3
	alignaddr	%i4,	%o4,	%o2
	lduh	[%l7 + 0x4E],	%l1
	ble,pt	%xcc,	loop_1736
	edge16	%g1,	%i3,	%i1
	edge16n	%i5,	%l5,	%g7
	tneg	%xcc,	0x0
loop_1736:
	umul	%g3,	0x19F0,	%i0
	te	%xcc,	0x3
	movg	%icc,	%g4,	%o7
	nop
	setx	0x229031F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x5C0DBD28,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f13,	%f13
	tgu	%xcc,	0x4
	fmovdleu	%icc,	%f23,	%f22
	andcc	%l0,	%i6,	%o1
	set	0x70, %g4
	ldda	[%l7 + %g4] 0xe2,	%l2
	fbug	%fcc2,	loop_1737
	subc	%g5,	0x01AD,	%o6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x78] %asi,	%l6
loop_1737:
	sdivcc	%o5,	0x1E96,	%i7
	xorcc	%g2,	%i2,	%l4
	udiv	%l2,	0x18D9,	%o0
	tle	%icc,	0x3
	stx	%g6,	[%l7 + 0x60]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o3,	%o4
	fcmpgt16	%f0,	%f12,	%o2
	movneg	%xcc,	%i4,	%l1
	orncc	%g1,	0x06A4,	%i1
	taddcctv	%i5,	0x1874,	%i3
	movne	%icc,	%g7,	%l5
	fbe,a	%fcc3,	loop_1738
	taddcctv	%g3,	0x031D,	%i0
	bn,a	loop_1739
	fmovrsgz	%o7,	%f27,	%f24
loop_1738:
	tneg	%xcc,	0x0
	fmuld8ulx16	%f31,	%f31,	%f16
loop_1739:
	membar	0x65
	fsrc2	%f16,	%f26
	ldsh	[%l7 + 0x6A],	%g4
	fblg,a	%fcc0,	loop_1740
	edge16ln	%l0,	%i6,	%l3
	fpsub32	%f28,	%f8,	%f28
	bg,a	%xcc,	loop_1741
loop_1740:
	tg	%icc,	0x5
	fandnot2	%f20,	%f24,	%f10
	sub	%o1,	%g5,	%l6
loop_1741:
	nop
	fitod	%f9,	%f14
	edge8l	%o5,	%i7,	%o6
	movl	%xcc,	%i2,	%l4
	fmovsge	%icc,	%f29,	%f7
	sth	%g2,	[%l7 + 0x36]
	nop
	setx	0xA85340A9566ED1B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x5A5734D8EFADB01C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f0,	%f4
	membar	0x3E
	add	%l2,	%g6,	%o0
	add	%o3,	%o4,	%i4
	bneg,pt	%icc,	loop_1742
	nop
	setx	0x6186F5FC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x416FC1E0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f0,	%f24
	movrlz	%o2,	%g1,	%i1
	edge8ln	%l1,	%i5,	%g7
loop_1742:
	nop
	setx	0xF465FEF6BCD932F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x472E8F1E0942B624,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f6,	%f20
	sll	%i3,	%g3,	%l5
	sth	%o7,	[%l7 + 0x2C]
	alignaddrl	%g4,	%l0,	%i0
	addcc	%i6,	0x1331,	%o1
	edge32l	%g5,	%l6,	%l3
	ldsb	[%l7 + 0x47],	%o5
	movcs	%icc,	%i7,	%i2
	nop
	fitos	%f13,	%f29
	fstod	%f29,	%f2
	set	0x38, %o7
	ldxa	[%l7 + %o7] 0x04,	%o6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l4,	%g2
	tsubcctv	%g6,	0x09E9,	%l2
	addc	%o0,	0x1E8B,	%o3
	array8	%o4,	%o2,	%i4
	fornot2	%f14,	%f30,	%f24
	movcs	%icc,	%i1,	%l1
	fmovsge	%xcc,	%f2,	%f2
	nop
	fitos	%f2,	%f22
	fstod	%f22,	%f12
	alignaddrl	%i5,	%g7,	%g1
	sdivcc	%i3,	0x0EA3,	%g3
	fbo	%fcc2,	loop_1743
	movg	%icc,	%l5,	%g4
	pdist	%f0,	%f4,	%f28
	tvc	%xcc,	0x6
loop_1743:
	swap	[%l7 + 0x40],	%o7
	pdist	%f0,	%f0,	%f30
	orn	%i0,	%i6,	%l0
	popc	%g5,	%l6
	set	0x28, %i5
	prefetcha	[%l7 + %i5] 0x80,	 0x3
	addcc	%o5,	0x1E59,	%i7
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x20] %asi,	%i2
	sdivcc	%o6,	0x0946,	%l4
	smul	%g2,	%l3,	%l2
	te	%icc,	0x7
	set	0x46, %g1
	stha	%o0,	[%l7 + %g1] 0x80
	tcs	%icc,	0x2
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x0c,	%f16
	fbug,a	%fcc0,	loop_1744
	xnorcc	%o3,	0x0A51,	%o4
	movgu	%xcc,	%g6,	%i4
	xorcc	%i1,	0x1868,	%l1
loop_1744:
	nop
	set	0x20, %g3
	ldsh	[%l7 + %g3],	%o2
	taddcc	%g7,	%g1,	%i5
	udivx	%i3,	0x02A3,	%g3
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x80
	bgu,a,pt	%icc,	loop_1745
	udivcc	%l5,	0x1919,	%o7
	fnot2s	%f1,	%f6
	andncc	%i0,	%i6,	%g4
loop_1745:
	tn	%icc,	0x2
	movne	%icc,	%g5,	%l0
	fmovde	%icc,	%f29,	%f17
	movre	%o1,	0x33D,	%l6
	tne	%xcc,	0x6
	movgu	%icc,	%i7,	%i2
	subccc	%o6,	%l4,	%o5
	edge32n	%l3,	%g2,	%l2
	set	0x2A, %l5
	lduha	[%l7 + %l5] 0x04,	%o0
	nop
	setx	0x3285A504,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x17573550,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f22,	%f12
	udivx	%o3,	0x086F,	%o4
	tvs	%xcc,	0x3
	movvc	%xcc,	%i4,	%i1
	movpos	%icc,	%l1,	%o2
	umulcc	%g7,	0x053D,	%g1
	bl,a	loop_1746
	fbne,a	%fcc3,	loop_1747
	movvc	%icc,	%i5,	%g6
	fmovrdne	%i3,	%f28,	%f16
loop_1746:
	fnot1s	%f29,	%f9
loop_1747:
	bneg,a	loop_1748
	edge8n	%l5,	%g3,	%i0
	subccc	%i6,	0x1771,	%g4
	subccc	%g5,	%l0,	%o7
loop_1748:
	movcs	%xcc,	%o1,	%i7
	tsubcctv	%i2,	0x045E,	%l6
	tleu	%icc,	0x0
	tg	%icc,	0x0
	edge16n	%o6,	%o5,	%l4
	fbule	%fcc2,	loop_1749
	movrlez	%g2,	0x079,	%l3
	and	%o0,	%o3,	%o4
	umulcc	%l2,	0x10ED,	%i1
loop_1749:
	fmovsvc	%xcc,	%f5,	%f18
	fabsd	%f22,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	stwa	%l1,	[%l7 + 0x68] %asi
	movne	%xcc,	%i4,	%g7
	te	%icc,	0x4
	fmovdg	%icc,	%f10,	%f28
	umulcc	%g1,	0x15CB,	%o2
	brnz,a	%g6,	loop_1750
	edge32ln	%i3,	%i5,	%g3
	sllx	%l5,	0x18,	%i6
	tl	%icc,	0x5
loop_1750:
	alignaddrl	%g4,	%i0,	%l0
	brgz,a	%o7,	loop_1751
	movrgez	%o1,	%i7,	%i2
	edge8n	%l6,	%g5,	%o5
	bneg	%xcc,	loop_1752
loop_1751:
	fbue,a	%fcc1,	loop_1753
	mova	%icc,	%o6,	%g2
	set	0x18, %i1
	lduwa	[%l7 + %i1] 0x88,	%l4
loop_1752:
	movcc	%icc,	%o0,	%o3
loop_1753:
	or	%o4,	0x1233,	%l2
	array32	%l3,	%i1,	%i4
	subcc	%l1,	%g7,	%o2
	alignaddrl	%g1,	%i3,	%g6
	addccc	%g3,	%l5,	%i5
	tsubcctv	%i6,	%g4,	%l0
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i0
	orncc	%o1,	0x173C,	%i7
	sra	%i2,	0x02,	%l6
	fbne,a	%fcc0,	loop_1754
	edge16n	%o7,	%g5,	%o6
	swap	[%l7 + 0x40],	%g2
	fble	%fcc2,	loop_1755
loop_1754:
	subccc	%o5,	%l4,	%o0
	fmul8x16al	%f8,	%f21,	%f0
	tle	%xcc,	0x4
loop_1755:
	movvs	%icc,	%o3,	%l2
	fandnot1s	%f2,	%f30,	%f1
	add	%o4,	%l3,	%i1
	edge8l	%i4,	%g7,	%l1
	fmovdgu	%icc,	%f14,	%f2
	bvc,a,pn	%xcc,	loop_1756
	bne	%xcc,	loop_1757
	fblg	%fcc1,	loop_1758
	subccc	%g1,	0x0A92,	%i3
loop_1756:
	edge8l	%o2,	%g6,	%g3
loop_1757:
	popc	%i5,	%l5
loop_1758:
	nop
	fitos	%f0,	%f19
	fstox	%f19,	%f6
	fornot2s	%f4,	%f29,	%f28
	movrgz	%i6,	%l0,	%i0
	edge32	%o1,	%i7,	%i2
	movn	%xcc,	%g4,	%l6
	fbul,a	%fcc0,	loop_1759
	fmovdn	%icc,	%f31,	%f19
	sir	0x0445
	tle	%xcc,	0x2
loop_1759:
	fsrc1s	%f16,	%f1
	xor	%g5,	0x1C96,	%o7
	udivcc	%o6,	0x19F0,	%o5
	sdivx	%l4,	0x11A7,	%o0
	tn	%icc,	0x6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o3
	movvc	%xcc,	%g2,	%l2
	tcs	%xcc,	0x3
	fmovrslez	%l3,	%f31,	%f19
	fmovs	%f19,	%f8
	alignaddr	%i1,	%o4,	%g7
	movcs	%icc,	%l1,	%g1
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f12
	sir	0x07C8
	ldd	[%l7 + 0x08],	%f4
	movn	%icc,	%i4,	%i3
	fmovsa	%xcc,	%f7,	%f26
	fmovdcc	%icc,	%f23,	%f8
	flush	%l7 + 0x18
	nop
	setx	0x7286AC54007254B7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fmovdne	%xcc,	%f30,	%f3
	fmovsn	%icc,	%f16,	%f12
	tneg	%xcc,	0x7
	ld	[%l7 + 0x0C],	%f26
	tcs	%xcc,	0x4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%o2,	%g3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x28] %asi,	%g6
	fmovsle	%icc,	%f23,	%f4
	brgez	%l5,	loop_1760
	ld	[%l7 + 0x78],	%f21
	movge	%icc,	%i5,	%l0
	fxors	%f0,	%f18,	%f14
loop_1760:
	movleu	%xcc,	%i6,	%o1
	fblg	%fcc2,	loop_1761
	movrlz	%i7,	%i0,	%g4
	movl	%icc,	%l6,	%g5
	orncc	%i2,	%o7,	%o5
loop_1761:
	fandnot2	%f10,	%f4,	%f8
	edge16n	%o6,	%o0,	%l4
	bneg,pt	%xcc,	loop_1762
	ble,a	%icc,	loop_1763
	tcs	%icc,	0x6
	edge32l	%g2,	%o3,	%l3
loop_1762:
	movle	%xcc,	%i1,	%o4
loop_1763:
	taddcc	%g7,	%l2,	%g1
	fxors	%f27,	%f22,	%f6
	srlx	%i4,	0x16,	%i3
	fnors	%f19,	%f29,	%f28
	fmovrdlez	%l1,	%f4,	%f12
	ldd	[%l7 + 0x78],	%g2
	nop
	setx	loop_1764,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%icc,	0x7
	tl	%icc,	0x0
	smul	%g6,	0x0D7A,	%o2
loop_1764:
	edge8n	%i5,	%l0,	%i6
	xorcc	%o1,	%l5,	%i7
	srl	%g4,	%i0,	%l6
	sub	%g5,	%i2,	%o5
	fbl	%fcc3,	loop_1765
	fmovdne	%xcc,	%f2,	%f20
	nop
	setx	0xBACAA36BD979ACC1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA80C5B6E2CB175F2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f30,	%f22
	ta	%icc,	0x5
loop_1765:
	fbg	%fcc1,	loop_1766
	addccc	%o6,	%o0,	%o7
	edge8n	%g2,	%o3,	%l4
	fbe	%fcc3,	loop_1767
loop_1766:
	tleu	%icc,	0x0
	udiv	%i1,	0x0027,	%l3
	popc	0x15BA,	%o4
loop_1767:
	lduw	[%l7 + 0x30],	%l2
	tsubcc	%g1,	0x083D,	%g7
	fbuge,a	%fcc2,	loop_1768
	st	%f22,	[%l7 + 0x4C]
	mova	%xcc,	%i4,	%l1
	set	0x68, %l4
	prefetcha	[%l7 + %l4] 0x18,	 0x0
loop_1768:
	edge32l	%i3,	%o2,	%i5
	fmovsvs	%icc,	%f6,	%f13
	popc	0x10BB,	%l0
	ldd	[%l7 + 0x08],	%f30
	sra	%g6,	%o1,	%i6
	movl	%icc,	%i7,	%l5
	edge32l	%i0,	%g4,	%g5
	xor	%i2,	0x11EB,	%o5
	orcc	%l6,	%o0,	%o6
	srlx	%g2,	%o3,	%o7
	set	0x64, %o6
	ldsba	[%l7 + %o6] 0x88,	%l4
	bgu,a	%icc,	loop_1769
	fcmpeq16	%f18,	%f10,	%i1
	tsubcctv	%o4,	%l3,	%l2
	orncc	%g7,	%i4,	%g1
loop_1769:
	smulcc	%g3,	0x100C,	%i3
	bge	loop_1770
	bneg	%xcc,	loop_1771
	movre	%o2,	%i5,	%l0
	array16	%l1,	%o1,	%i6
loop_1770:
	fxor	%f4,	%f26,	%f2
loop_1771:
	sth	%g6,	[%l7 + 0x56]
	tn	%icc,	0x2
	umulcc	%l5,	%i0,	%i7
	xorcc	%g5,	0x01FB,	%i2
	tneg	%xcc,	0x6
	movrgz	%o5,	%l6,	%g4
	te	%xcc,	0x5
	set	0x74, %i3
	stwa	%o6,	[%l7 + %i3] 0xea
	membar	#Sync
	subccc	%o0,	0x1018,	%g2
	udivcc	%o3,	0x0540,	%o7
	sth	%i1,	[%l7 + 0x48]
	orn	%o4,	%l3,	%l4
	movvs	%icc,	%l2,	%i4
	xor	%g7,	%g1,	%g3
	mova	%xcc,	%o2,	%i5
	nop
	setx	0x5064DD9D,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	nop
	setx loop_1772, %l0, %l1
	jmpl %l1, %l0
	fpsub32s	%f10,	%f25,	%f31
	fpadd32	%f20,	%f14,	%f12
	srl	%i3,	%o1,	%i6
loop_1772:
	add	%g6,	0x1B1A,	%l5
	membar	0x40
	set	0x30, %i0
	ldda	[%l7 + %i0] 0xeb,	%l0
	stbar
	fmul8ulx16	%f12,	%f6,	%f6
	alignaddrl	%i0,	%i7,	%g5
	ble,a	loop_1773
	movvs	%icc,	%o5,	%l6
	alignaddr	%i2,	%o6,	%o0
	std	%f0,	[%l7 + 0x30]
loop_1773:
	prefetch	[%l7 + 0x54],	 0x3
	tcc	%icc,	0x7
	bshuffle	%f4,	%f30,	%f2
	xorcc	%g4,	0x1F5D,	%o3
	tg	%icc,	0x0
	nop
	fitod	%f6,	%f18
	fmovrdgz	%g2,	%f18,	%f8
	fble	%fcc2,	loop_1774
	smulcc	%i1,	0x1A9D,	%o7
	brlz,a	%l3,	loop_1775
	edge8l	%o4,	%l2,	%l4
loop_1774:
	mova	%xcc,	%i4,	%g1
	sll	%g3,	0x05,	%g7
loop_1775:
	movvc	%icc,	%i5,	%o2
	sethi	0x14CC,	%l0
	umul	%i3,	%i6,	%g6
	bcs	loop_1776
	tcs	%xcc,	0x7
	or	%o1,	0x145D,	%l5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i0
loop_1776:
	sllx	%l1,	0x0E,	%i7
	movge	%xcc,	%g5,	%o5
	nop
	setx	0xBCE96D8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xDA15EFD2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f20,	%f22
	or	%l6,	%o6,	%i2
	sth	%g4,	[%l7 + 0x34]
	tsubcc	%o3,	%g2,	%i1
	sdivcc	%o0,	0x1682,	%l3
	mova	%xcc,	%o4,	%o7
	srl	%l2,	0x14,	%i4
	fnot1s	%f16,	%f16
	fbug	%fcc3,	loop_1777
	nop
	setx	0xA06EA979,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	movge	%xcc,	%l4,	%g3
	movvs	%xcc,	%g7,	%g1
loop_1777:
	swap	[%l7 + 0x5C],	%o2
	srl	%l0,	%i3,	%i6
	movne	%xcc,	%i5,	%o1
	subc	%g6,	0x026D,	%l5
	edge8ln	%i0,	%i7,	%l1
	udivx	%g5,	0x1909,	%l6
	bpos,a	loop_1778
	mova	%icc,	%o5,	%i2
	movle	%icc,	%o6,	%o3
	sdivx	%g4,	0x1652,	%i1
loop_1778:
	udiv	%g2,	0x0CF6,	%l3
	sll	%o4,	%o7,	%o0
	movneg	%icc,	%l2,	%i4
	nop
	setx	loop_1779,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%g3,	0x1EA8,	%l4
	set	0x1E, %g5
	lduha	[%l7 + %g5] 0x11,	%g7
loop_1779:
	movneg	%icc,	%g1,	%o2
	addcc	%l0,	%i3,	%i6
	movleu	%xcc,	%o1,	%g6
	fmovspos	%icc,	%f15,	%f12
	edge32	%i5,	%l5,	%i7
	brlez,a	%l1,	loop_1780
	te	%xcc,	0x7
	orn	%i0,	0x1AFC,	%g5
	edge8ln	%l6,	%o5,	%i2
loop_1780:
	swap	[%l7 + 0x4C],	%o6
	std	%f2,	[%l7 + 0x70]
	set	0x68, %i2
	stxa	%g4,	[%l7 + %i2] 0x15
	mulscc	%i1,	0x1D36,	%o3
	mulscc	%g2,	%l3,	%o7
	fblg	%fcc2,	loop_1781
	movcs	%xcc,	%o4,	%l2
	edge16ln	%o0,	%g3,	%i4
	wr	%g0,	0x23,	%asi
	stha	%g7,	[%l7 + 0x42] %asi
	membar	#Sync
loop_1781:
	orncc	%l4,	0x1B64,	%g1
	tcc	%icc,	0x5
	movcs	%xcc,	%o2,	%l0
	wr	%g0,	0x2a,	%asi
	stba	%i6,	[%l7 + 0x0F] %asi
	membar	#Sync
	tvs	%icc,	0x0
	fbo,a	%fcc0,	loop_1782
	movrgz	%i3,	%g6,	%o1
	fmovdne	%icc,	%f16,	%f26
	fpadd16s	%f28,	%f0,	%f4
loop_1782:
	sub	%i5,	%l5,	%i7
	movge	%icc,	%i0,	%g5
	movvc	%xcc,	%l1,	%o5
	fbuge	%fcc2,	loop_1783
	for	%f8,	%f4,	%f28
	wr	%g0,	0x11,	%asi
	stxa	%l6,	[%l7 + 0x20] %asi
loop_1783:
	movvs	%icc,	%o6,	%i2
	fnor	%f24,	%f0,	%f0
	brgez	%g4,	loop_1784
	fmovrslez	%i1,	%f3,	%f15
	ldstub	[%l7 + 0x68],	%g2
	fbo	%fcc1,	loop_1785
loop_1784:
	tne	%xcc,	0x2
	ldsb	[%l7 + 0x28],	%l3
	set	0x34, %i6
	ldsha	[%l7 + %i6] 0x18,	%o3
loop_1785:
	srax	%o4,	%l2,	%o0
	stx	%g3,	[%l7 + 0x70]
	subc	%o7,	%i4,	%l4
	tge	%xcc,	0x6
	movvc	%xcc,	%g7,	%g1
	fnot1	%f6,	%f28
	lduw	[%l7 + 0x4C],	%o2
	lduh	[%l7 + 0x0C],	%l0
	ldd	[%l7 + 0x38],	%f28
	fmovrdgz	%i3,	%f22,	%f6
	move	%xcc,	%i6,	%o1
	lduh	[%l7 + 0x76],	%g6
	move	%xcc,	%i5,	%l5
	subcc	%i7,	0x1DD6,	%g5
	tcc	%xcc,	0x0
	fmovsa	%xcc,	%f15,	%f24
	edge16l	%i0,	%o5,	%l6
	te	%icc,	0x7
	flush	%l7 + 0x10
	fbne,a	%fcc3,	loop_1786
	bn,pn	%xcc,	loop_1787
	movge	%xcc,	%l1,	%o6
	fand	%f4,	%f4,	%f16
loop_1786:
	movne	%icc,	%i2,	%i1
loop_1787:
	sdiv	%g2,	0x1709,	%g4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x04,	%l3,	%o4
	tne	%icc,	0x1
	array16	%l2,	%o0,	%o3
	edge8n	%o7,	%g3,	%l4
	nop
	setx loop_1788, %l0, %l1
	jmpl %l1, %i4
	umul	%g7,	%g1,	%o2
	movge	%xcc,	%l0,	%i6
	xnorcc	%i3,	%g6,	%o1
loop_1788:
	sdivx	%l5,	0x1D9A,	%i5
	fmovrsne	%g5,	%f27,	%f31
	movle	%icc,	%i7,	%o5
	fcmple16	%f6,	%f12,	%i0
	edge16	%l1,	%o6,	%l6
	fsrc2s	%f29,	%f24
	orn	%i2,	0x1585,	%g2
	alignaddrl	%g4,	%i1,	%o4
	fbne,a	%fcc3,	loop_1789
	smul	%l2,	0x06E3,	%o0
	fbne	%fcc0,	loop_1790
	movrgez	%l3,	0x3AB,	%o7
loop_1789:
	fzeros	%f17
	fmovsg	%xcc,	%f14,	%f21
loop_1790:
	fpadd16	%f22,	%f20,	%f28
	movgu	%xcc,	%g3,	%l4
	edge32l	%i4,	%g7,	%g1
	wr	%g0,	0x18,	%asi
	stwa	%o2,	[%l7 + 0x34] %asi
	fpmerge	%f27,	%f16,	%f16
	fabss	%f11,	%f25
	fnot1	%f18,	%f24
	subccc	%o3,	0x1B85,	%i6
	prefetch	[%l7 + 0x3C],	 0x2
	set	0x18, %o1
	ldxa	[%l7 + %o1] 0x11,	%l0
	edge16	%i3,	%g6,	%o1
	move	%icc,	%l5,	%i5
	movrlez	%i7,	0x16B,	%g5
	fble,a	%fcc1,	loop_1791
	st	%f22,	[%l7 + 0x28]
	tl	%icc,	0x5
	movleu	%icc,	%o5,	%i0
loop_1791:
	ldd	[%l7 + 0x18],	%o6
	xorcc	%l1,	%l6,	%i2
	edge32n	%g4,	%i1,	%g2
	andn	%l2,	0x01F1,	%o0
	or	%o4,	0x0C39,	%l3
	fbge	%fcc1,	loop_1792
	xnor	%o7,	%g3,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba	%fcc1,	loop_1793
loop_1792:
	xorcc	%g7,	%i4,	%g1
	movcc	%xcc,	%o2,	%o3
	subc	%l0,	%i6,	%g6
loop_1793:
	sub	%i3,	0x0439,	%o1
	fmovsneg	%icc,	%f20,	%f8
	set	0x50, %o2
	stwa	%l5,	[%l7 + %o2] 0xe2
	membar	#Sync
	sth	%i7,	[%l7 + 0x4C]
	stw	%g5,	[%l7 + 0x44]
	movvs	%icc,	%o5,	%i0
	swap	[%l7 + 0x60],	%i5
	movne	%xcc,	%l1,	%l6
	movrlz	%i2,	%o6,	%i1
	smulcc	%g4,	0x161A,	%l2
	edge16	%o0,	%o4,	%g2
	array32	%o7,	%l3,	%l4
	fcmple16	%f22,	%f16,	%g3
	sra	%g7,	%g1,	%i4
	tle	%xcc,	0x0
	mulscc	%o2,	%l0,	%o3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	edge16ln	%g6,	%o1,	%l5
	fxors	%f11,	%f22,	%f5
	fxnors	%f13,	%f17,	%f28
	edge8n	%i7,	%g5,	%o5
	popc	0x1348,	%i0
	fmovsleu	%xcc,	%f7,	%f23
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i5
	sethi	0x1DCC,	%i3
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%f16
	edge32l	%l6,	%i2,	%o6
	edge16n	%i1,	%g4,	%l1
	edge16n	%l2,	%o4,	%o0
	move	%xcc,	%g2,	%o7
	movn	%xcc,	%l4,	%l3
	orn	%g3,	%g1,	%i4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x4C] %asi,	%o2
	and	%l0,	%o3,	%g7
	std	%f26,	[%l7 + 0x10]
	move	%icc,	%g6,	%i6
	std	%f16,	[%l7 + 0x10]
	addc	%o1,	0x05FF,	%i7
	set	0x5A, %g2
	stha	%g5,	[%l7 + %g2] 0x80
	mulx	%o5,	%l5,	%i0
	mova	%xcc,	%i5,	%i3
	membar	0x75
	array16	%i2,	%o6,	%i1
	and	%l6,	0x0B28,	%l1
	fnegs	%f7,	%f29
	fnegs	%f15,	%f8
	andn	%g4,	%l2,	%o4
	and	%o0,	%g2,	%o7
	udivcc	%l4,	0x0EC6,	%g3
	edge32l	%l3,	%i4,	%o2
	movpos	%xcc,	%l0,	%o3
	fsrc2	%f6,	%f2
	fmovsn	%icc,	%f25,	%f31
	movre	%g7,	0x158,	%g1
	set	0x220, %o3
	stxa	%i6,	[%g0 + %o3] 0x52
	fbu,a	%fcc1,	loop_1794
	edge32n	%g6,	%i7,	%g5
	addccc	%o5,	0x0512,	%o1
	umul	%i0,	%i5,	%l5
loop_1794:
	orcc	%i2,	%i3,	%i1
	movleu	%icc,	%o6,	%l6
	movneg	%xcc,	%l1,	%l2
	fxors	%f3,	%f6,	%f0
	fbuge	%fcc1,	loop_1795
	fsrc2s	%f25,	%f1
	mova	%icc,	%o4,	%g4
	mova	%icc,	%o0,	%g2
loop_1795:
	addcc	%l4,	0x1EF4,	%o7
	edge16l	%l3,	%g3,	%o2
	movl	%icc,	%l0,	%o3
	edge16	%g7,	%g1,	%i4
	fmovscc	%xcc,	%f0,	%f26
	tcc	%xcc,	0x3
	movleu	%xcc,	%g6,	%i7
	bneg,a	loop_1796
	edge32n	%g5,	%o5,	%o1
	mulx	%i0,	0x0766,	%i5
	fmovsgu	%icc,	%f12,	%f21
loop_1796:
	fmovsleu	%icc,	%f21,	%f1
	brlez,a	%i6,	loop_1797
	te	%icc,	0x6
	movge	%xcc,	%i2,	%l5
	wr	%g0,	0x88,	%asi
	stwa	%i1,	[%l7 + 0x6C] %asi
loop_1797:
	nop
	setx	0xA8FFA586,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x5518885A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f2,	%f16
	udivcc	%i3,	0x01EB,	%o6
	fbule,a	%fcc1,	loop_1798
	sir	0x14E2
	sub	%l6,	%l1,	%l2
	nop
	setx	0xD41013E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xFEF16C45,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f15,	%f16
loop_1798:
	nop
	wr	%g0,	0x27,	%asi
	stwa	%g4,	[%l7 + 0x74] %asi
	membar	#Sync
	fzeros	%f4
	set	0x70, %o4
	stxa	%o4,	[%l7 + %o4] 0x27
	membar	#Sync
	edge16l	%g2,	%o0,	%l4
	nop
	setx	0x913AD8FB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x4CC043D1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f28,	%f9
	ldx	[%l7 + 0x50],	%o7
	ld	[%l7 + 0x60],	%f9
	fmovdge	%icc,	%f19,	%f30
	srax	%l3,	0x04,	%g3
	andcc	%o2,	0x0C23,	%l0
	tcc	%xcc,	0x3
	tvs	%icc,	0x6
	add	%o3,	0x0D4B,	%g7
	edge32n	%g1,	%i4,	%i7
	ldstub	[%l7 + 0x28],	%g5
	fbe	%fcc2,	loop_1799
	edge32n	%o5,	%g6,	%i0
	fmovdcs	%xcc,	%f21,	%f17
	tsubcctv	%i5,	%o1,	%i6
loop_1799:
	fbo,a	%fcc0,	loop_1800
	andcc	%l5,	%i1,	%i3
	movrgez	%i2,	%o6,	%l1
	srl	%l2,	%l6,	%o4
loop_1800:
	fmovdgu	%xcc,	%f30,	%f30
	sir	0x190D
	tsubcc	%g4,	0x0C48,	%g2
	sub	%l4,	0x0196,	%o0
	sth	%l3,	[%l7 + 0x7E]
	fzero	%f30
	srl	%g3,	%o7,	%l0
	and	%o3,	0x0DB2,	%o2
	bg	%icc,	loop_1801
	movcc	%icc,	%g7,	%i4
	fmovsa	%icc,	%f4,	%f11
	be,a	loop_1802
loop_1801:
	tl	%icc,	0x4
	subccc	%g1,	%g5,	%i7
	fbge,a	%fcc3,	loop_1803
loop_1802:
	fmovrdgz	%g6,	%f18,	%f20
	srlx	%i0,	%i5,	%o1
	fnot1s	%f17,	%f12
loop_1803:
	fmovsa	%xcc,	%f17,	%f2
	tn	%xcc,	0x4
	be	loop_1804
	movrlz	%i6,	0x304,	%o5
	udivcc	%l5,	0x0FB7,	%i1
	tcc	%icc,	0x3
loop_1804:
	movcs	%xcc,	%i3,	%i2
	edge32	%l1,	%o6,	%l6
	sdivx	%o4,	0x046D,	%l2
	srl	%g4,	%l4,	%o0
	fmovscs	%icc,	%f31,	%f12
	fble	%fcc2,	loop_1805
	or	%g2,	0x02D5,	%l3
	tgu	%icc,	0x1
	mova	%icc,	%g3,	%l0
loop_1805:
	tcc	%xcc,	0x5
	orcc	%o3,	%o7,	%o2
	tn	%xcc,	0x0
	nop
	set	0x1B, %i4
	ldstub	[%l7 + %i4],	%i4
	bne,a	%icc,	loop_1806
	call	loop_1807
	edge8l	%g7,	%g1,	%g5
	array8	%i7,	%g6,	%i5
loop_1806:
	andn	%o1,	%i0,	%i6
loop_1807:
	movne	%icc,	%o5,	%i1
	addc	%l5,	%i3,	%i2
	nop
	setx	0x8A09B9F14D84DE0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x2F1247D64B1653FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f30,	%f2
	smulcc	%o6,	%l6,	%l1
	movrne	%o4,	0x0B1,	%g4
	bvs,a	%icc,	loop_1808
	tneg	%icc,	0x3
	bcc,pn	%icc,	loop_1809
	array16	%l4,	%o0,	%g2
loop_1808:
	fbule,a	%fcc0,	loop_1810
	edge16n	%l3,	%l2,	%l0
loop_1809:
	movrlez	%o3,	0x130,	%g3
	ldstub	[%l7 + 0x79],	%o7
loop_1810:
	umul	%o2,	0x1541,	%g7
	membar	0x50
	move	%icc,	%i4,	%g1
	set	0x70, %g6
	swapa	[%l7 + %g6] 0x89,	%i7
	edge32n	%g6,	%g5,	%o1
	nop
	setx	0xFCBA7F6B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x827F9A03,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f23,	%f1
	bneg,a	loop_1811
	nop
	setx	0x3D0361EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xD32439B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f10,	%f4
	movcs	%icc,	%i5,	%i0
	nop
	setx	0xF74E2FD5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x1A755DCC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f26,	%f24
loop_1811:
	fmovdne	%icc,	%f9,	%f1
	srl	%i6,	0x17,	%o5
	subc	%i1,	0x09BF,	%l5
	orcc	%i3,	%i2,	%l6
	movl	%xcc,	%l1,	%o6
	and	%g4,	%l4,	%o0
	fmovsl	%xcc,	%f17,	%f18
	fands	%f26,	%f19,	%f26
	sdivcc	%g2,	0x0D63,	%l3
	sethi	0x1E06,	%o4
	ldsw	[%l7 + 0x70],	%l2
	edge16n	%l0,	%g3,	%o7
	tsubcc	%o3,	%o2,	%g7
	tvs	%xcc,	0x3
	ldd	[%l7 + 0x58],	%g0
	nop
	setx	loop_1812,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc2	%f6,	%f0
	membar	0x12
	movvs	%xcc,	%i4,	%g6
loop_1812:
	taddcctv	%g5,	%o1,	%i5
	fbne	%fcc3,	loop_1813
	orncc	%i0,	0x14BC,	%i6
	fbug	%fcc3,	loop_1814
	edge16ln	%o5,	%i1,	%l5
loop_1813:
	tneg	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1814:
	umul	%i3,	0x0275,	%i2
	alignaddr	%l6,	%l1,	%o6
	fpadd32s	%f28,	%f7,	%f11
	set	0x11, %l2
	stba	%i7,	[%l7 + %l2] 0x27
	membar	#Sync
	alignaddr	%l4,	%o0,	%g4
	set	0x78, %i7
	prefetcha	[%l7 + %i7] 0x04,	 0x0
	nop
	fitod	%f12,	%f16
	fdtos	%f16,	%f4
	ldsw	[%l7 + 0x54],	%o4
	tsubcctv	%l3,	0x12E9,	%l0
	fmul8x16au	%f17,	%f20,	%f14
	mulx	%l2,	%o7,	%g3
	sll	%o2,	0x09,	%g7
	subccc	%o3,	0x1413,	%i4
	nop
	fitod	%f2,	%f0
	fdtox	%f0,	%f16
	bn,pt	%xcc,	loop_1815
	tvc	%icc,	0x5
	bn	loop_1816
	fbuge,a	%fcc0,	loop_1817
loop_1815:
	fmovd	%f12,	%f12
	fmovrsne	%g1,	%f13,	%f6
loop_1816:
	tne	%icc,	0x5
loop_1817:
	nop
	setx	loop_1818,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdvs	%icc,	%f25,	%f14
	fsrc2	%f6,	%f22
	movcs	%icc,	%g6,	%o1
loop_1818:
	movvc	%icc,	%i5,	%i0
	nop
	fitos	%f12,	%f21
	fstox	%f21,	%f10
	fxtos	%f10,	%f26
	brz	%i6,	loop_1819
	sub	%o5,	%g5,	%i1
	fmovrslz	%i3,	%f0,	%f28
	fmovd	%f22,	%f22
loop_1819:
	movvc	%icc,	%l5,	%l6
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x14
	fcmpne32	%f14,	%f0,	%l1
	flush	%l7 + 0x64
	orn	%i2,	0x14E3,	%o6
	movge	%icc,	%l4,	%o0
	stw	%i7,	[%l7 + 0x40]
	alignaddrl	%g2,	%g4,	%l3
	nop
	setx	0x2F2BC32E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xEF263893,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f9,	%f23
	tleu	%icc,	0x6
	srax	%l0,	0x19,	%o4
	xorcc	%o7,	%l2,	%o2
	umul	%g3,	%g7,	%i4
	srl	%g1,	0x14,	%o3
	fmovsleu	%xcc,	%f23,	%f15
	brz,a	%g6,	loop_1820
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f10
	fxtod	%f10,	%f16
	pdist	%f8,	%f0,	%f16
	tsubcctv	%i5,	%i0,	%i6
loop_1820:
	fmovsgu	%icc,	%f16,	%f24
	smulcc	%o1,	0x1C19,	%o5
	subccc	%g5,	0x1B60,	%i3
	movrlz	%i1,	0x145,	%l5
	andn	%l1,	0x0797,	%i2
	fba,a	%fcc0,	loop_1821
	tcc	%icc,	0x2
	edge8l	%l6,	%l4,	%o0
	edge8ln	%o6,	%g2,	%i7
loop_1821:
	stw	%l3,	[%l7 + 0x74]
	movvc	%icc,	%g4,	%l0
	umulcc	%o4,	0x0A35,	%o7
	movn	%icc,	%o2,	%g3
	fmovdl	%icc,	%f19,	%f9
	tg	%xcc,	0x0
	ta	%icc,	0x7
	sdivcc	%g7,	0x00A4,	%l2
	fand	%f8,	%f2,	%f6
	sub	%i4,	0x0E53,	%g1
	movcs	%icc,	%g6,	%i5
	subc	%i0,	%o3,	%o1
	sdivcc	%i6,	0x1789,	%o5
	te	%xcc,	0x2
	fbge	%fcc3,	loop_1822
	brgz,a	%i3,	loop_1823
	subc	%g5,	%l5,	%l1
	ble,pt	%xcc,	loop_1824
loop_1822:
	bge,pn	%icc,	loop_1825
loop_1823:
	movneg	%xcc,	%i1,	%l6
	orncc	%l4,	0x09B6,	%o0
loop_1824:
	edge32	%i2,	%g2,	%o6
loop_1825:
	umulcc	%l3,	%g4,	%l0
	ldd	[%l7 + 0x70],	%f6
	bl	%icc,	loop_1826
	fbe	%fcc3,	loop_1827
	addccc	%i7,	%o7,	%o2
	nop
	setx	0x8D570D12,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x0674A4C9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f15,	%f26
loop_1826:
	nop
	set	0x64, %o0
	lda	[%l7 + %o0] 0x81,	%f18
loop_1827:
	tgu	%icc,	0x7
	sra	%o4,	%g3,	%l2
	bpos	loop_1828
	umulcc	%i4,	%g7,	%g1
	fbge	%fcc1,	loop_1829
	sllx	%i5,	%i0,	%g6
loop_1828:
	movrgez	%o1,	%i6,	%o3
	tvc	%icc,	0x3
loop_1829:
	movrlez	%o5,	%g5,	%i3
	fbo	%fcc0,	loop_1830
	smul	%l1,	%i1,	%l6
	sth	%l4,	[%l7 + 0x12]
	udiv	%l5,	0x1DCF,	%i2
loop_1830:
	addc	%o0,	0x0875,	%g2
	set	0x18, %o5
	stwa	%l3,	[%l7 + %o5] 0x14
	tl	%xcc,	0x5
	tl	%xcc,	0x0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g4,	%o6
	fnand	%f4,	%f16,	%f22
	nop
	fitod	%f4,	%f30
	fdtoi	%f30,	%f15
	fmovda	%icc,	%f21,	%f3
	movre	%i7,	0x264,	%l0
	movn	%icc,	%o7,	%o4
	or	%o2,	0x0A99,	%l2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x4C, %l3
	stwa	%i4,	[%l7 + %l3] 0x04
	and	%g7,	0x03D3,	%g1
	tleu	%xcc,	0x2
	nop
	setx	loop_1831,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subc	%i5,	0x19D0,	%i0
	mova	%xcc,	%g3,	%g6
	srlx	%i6,	0x09,	%o1
loop_1831:
	movgu	%xcc,	%o3,	%g5
	wr	%g0,	0xeb,	%asi
	stba	%o5,	[%l7 + 0x45] %asi
	membar	#Sync
	andncc	%i3,	%i1,	%l6
	sub	%l4,	%l1,	%i2
	wr	%g0,	0x27,	%asi
	stxa	%l5,	[%l7 + 0x78] %asi
	membar	#Sync
	andn	%o0,	0x132E,	%g2
	te	%xcc,	0x3
	tl	%icc,	0x0
	array16	%l3,	%o6,	%g4
	movvc	%xcc,	%l0,	%i7
	st	%f18,	[%l7 + 0x14]
	alignaddr	%o4,	%o7,	%l2
	fpmerge	%f22,	%f6,	%f28
	set	0x1C, %g4
	sta	%f11,	[%l7 + %g4] 0x14
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fbe,a	%fcc3,	loop_1832
	mulscc	%o2,	0x11AE,	%i4
	nop
	setx	0x589E152EB075A685,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fmul8sux16	%f4,	%f28,	%f2
loop_1832:
	orn	%g1,	0x1C72,	%i5
	array32	%i0,	%g7,	%g3
	xor	%g6,	0x1C7E,	%i6
	tvc	%icc,	0x6
	fba,a	%fcc2,	loop_1833
	fexpand	%f13,	%f26
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%g5
loop_1833:
	ldd	[%l7 + 0x28],	%o4
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f6
	fxtod	%f6,	%f6
	movrgez	%i3,	%i1,	%l6
	tcc	%icc,	0x6
	movrgz	%o1,	0x2BF,	%l4
	set	0x58, %i5
	prefetcha	[%l7 + %i5] 0x14,	 0x2
	umulcc	%l1,	0x0B1B,	%o0
	mova	%icc,	%g2,	%l5
	fbug	%fcc3,	loop_1834
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f10
	fxtos	%f10,	%f5
	fsrc1	%f18,	%f22
	fornot2	%f24,	%f16,	%f12
loop_1834:
	fcmpeq32	%f18,	%f18,	%o6
	sdivcc	%l3,	0x0ABA,	%g4
	movcs	%icc,	%l0,	%o4
	move	%icc,	%i7,	%o7
	movleu	%icc,	%o2,	%l2
	wr	%g0,	0x18,	%asi
	stba	%i4,	[%l7 + 0x21] %asi
	srlx	%g1,	0x15,	%i0
	set	0x54, %o7
	lduwa	[%l7 + %o7] 0x15,	%i5
	fba,a	%fcc1,	loop_1835
	ldstub	[%l7 + 0x5C],	%g7
	or	%g6,	%g3,	%i6
	bne	loop_1836
loop_1835:
	andcc	%o3,	%g5,	%i3
	addccc	%i1,	%o5,	%l6
	udiv	%l4,	0x1D52,	%o1
loop_1836:
	move	%xcc,	%i2,	%l1
	srlx	%o0,	0x12,	%l5
	subccc	%g2,	0x1B36,	%l3
	smulcc	%g4,	%o6,	%o4
	std	%f26,	[%l7 + 0x78]
	tneg	%icc,	0x7
	array8	%l0,	%i7,	%o7
	movcs	%icc,	%o2,	%i4
	udiv	%g1,	0x1BC8,	%l2
	movrlz	%i0,	%i5,	%g6
	fpadd16	%f20,	%f26,	%f14
	ldub	[%l7 + 0x3C],	%g7
	udiv	%i6,	0x1E7C,	%o3
	addc	%g3,	0x1C7C,	%g5
	tcc	%icc,	0x6
	sub	%i3,	%i1,	%l6
	brgez,a	%o5,	loop_1837
	tcc	%xcc,	0x1
	fmovrse	%l4,	%f4,	%f26
	orcc	%i2,	0x02BC,	%o1
loop_1837:
	fmovdge	%icc,	%f29,	%f17
	fbn,a	%fcc0,	loop_1838
	andncc	%o0,	%l1,	%g2
	fmuld8sux16	%f0,	%f23,	%f6
	umul	%l5,	0x1CF8,	%g4
loop_1838:
	fmovdcs	%xcc,	%f8,	%f10
	movcs	%xcc,	%o6,	%l3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%l0
	fmovdl	%xcc,	%f4,	%f23
	set	0x40, %l0
	ldswa	[%l7 + %l0] 0x15,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%o2,	loop_1839
	addc	%i4,	0x0B13,	%i7
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x3B] %asi,	%l2
loop_1839:
	fmovdpos	%icc,	%f1,	%f15
	membar	0x17
	nop
	fitos	%f8,	%f31
	fstoi	%f31,	%f21
	sdivcc	%i0,	0x0C4B,	%i5
	wr	%g0,	0x81,	%asi
	stba	%g1,	[%l7 + 0x4F] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x0076C139,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	movn	%xcc,	%g6,	%i6
	prefetch	[%l7 + 0x5C],	 0x2
	ble	loop_1840
	udivx	%o3,	0x06D0,	%g7
	fbo,a	%fcc3,	loop_1841
	fpsub32	%f10,	%f18,	%f28
loop_1840:
	tvc	%xcc,	0x0
	movge	%xcc,	%g3,	%i3
loop_1841:
	movpos	%icc,	%g5,	%i1
	udivcc	%l6,	0x154F,	%o5
	stw	%i2,	[%l7 + 0x4C]
	tleu	%xcc,	0x2
	movgu	%xcc,	%l4,	%o0
	movrne	%o1,	0x11A,	%g2
	set	0x16, %g1
	lduha	[%l7 + %g1] 0x10,	%l1
	movrgez	%l5,	0x2E3,	%g4
	taddcctv	%o6,	0x0F04,	%o4
	mulx	%l0,	%l3,	%o2
	tsubcc	%i4,	0x0216,	%o7
	bn,pt	%icc,	loop_1842
	edge32l	%i7,	%l2,	%i0
	orncc	%i5,	0x03AF,	%g6
	xor	%i6,	%g1,	%g7
loop_1842:
	tsubcc	%g3,	0x1E7D,	%i3
	nop
	setx	0xE06674EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	orcc	%g5,	%o3,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l6,	%i2
	tvc	%icc,	0x6
	fnand	%f16,	%f22,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	movrgez	%l4,	0x00D,	%o0
	fandnot1	%f22,	%f30,	%f8
	nop
	set	0x38, %g3
	std	%f28,	[%l7 + %g3]
	movrlez	%g2,	0x32B,	%o1
	nop
	fitos	%f1,	%f27
	fstox	%f27,	%f12
	fxtos	%f12,	%f7
	ble	%icc,	loop_1843
	tn	%xcc,	0x1
	movrgez	%l5,	0x1C8,	%l1
	fmovsleu	%icc,	%f4,	%f29
loop_1843:
	edge8l	%g4,	%o4,	%l0
	bleu	%xcc,	loop_1844
	ldd	[%l7 + 0x70],	%f12
	sir	0x0C8C
	fcmple32	%f0,	%f18,	%o6
loop_1844:
	nop
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fxnor	%f24,	%f16,	%f20
	addc	%o2,	0x01FC,	%l3
	xor	%i4,	%i7,	%o7
	fmovd	%f30,	%f16
	edge8l	%l2,	%i0,	%i5
	and	%i6,	%g1,	%g7
	movrne	%g3,	%g6,	%g5
	tcs	%icc,	0x3
	or	%i3,	0x0DCD,	%o3
	pdist	%f8,	%f10,	%f0
	set	0x40, %g7
	lduha	[%l7 + %g7] 0x18,	%i1
	array32	%i2,	%o5,	%l6
	movcc	%icc,	%l4,	%o0
	swap	[%l7 + 0x6C],	%o1
	andcc	%l5,	%l1,	%g4
	sdivcc	%g2,	0x0FE3,	%o4
	taddcctv	%o6,	0x01F9,	%o2
	movpos	%xcc,	%l0,	%i4
	taddcctv	%l3,	0x1EA7,	%i7
	nop
	fitod	%f10,	%f12
	fdtos	%f12,	%f11
	fpackfix	%f24,	%f23
	orcc	%o7,	%l2,	%i0
	fsrc2s	%f23,	%f2
	alignaddr	%i6,	%i5,	%g1
	brz,a	%g7,	loop_1845
	ldd	[%l7 + 0x20],	%f12
	edge8n	%g6,	%g5,	%i3
	fmovdl	%icc,	%f29,	%f0
loop_1845:
	tle	%xcc,	0x3
	fsrc1s	%f1,	%f17
	sdiv	%o3,	0x1D09,	%g3
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x70] %asi,	%i1
	membar	0x19
	brnz,a	%o5,	loop_1846
	movl	%icc,	%i2,	%l4
	fbn,a	%fcc1,	loop_1847
	fmul8x16au	%f0,	%f22,	%f20
loop_1846:
	udivx	%o0,	0x1712,	%o1
	nop
	fitos	%f7,	%f29
	fstox	%f29,	%f26
	fxtos	%f26,	%f9
loop_1847:
	fpack16	%f10,	%f16
	movneg	%icc,	%l5,	%l1
	fble,a	%fcc2,	loop_1848
	array8	%l6,	%g4,	%g2
	edge32	%o4,	%o6,	%l0
	fand	%f14,	%f24,	%f26
loop_1848:
	alignaddr	%o2,	%i4,	%l3
	ldd	[%l7 + 0x60],	%f6
	addc	%i7,	0x0EF3,	%l2
	edge32ln	%i0,	%o7,	%i6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%g1
	popc	0x0C1F,	%g7
	smul	%g6,	0x0F5B,	%g5
	sub	%i3,	%o3,	%g3
	mulx	%i1,	%i5,	%i2
	alignaddr	%l4,	%o0,	%o1
	movre	%o5,	%l5,	%l6
	nop
	setx	loop_1849,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x5
	fbe	%fcc3,	loop_1850
	sra	%g4,	0x1C,	%g2
loop_1849:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
loop_1850:
	fpmerge	%f13,	%f26,	%f4
	fbue,a	%fcc0,	loop_1851
	stb	%o6,	[%l7 + 0x45]
	xnorcc	%o4,	0x1A11,	%l0
	move	%icc,	%i4,	%l3
loop_1851:
	alignaddrl	%o2,	%i7,	%i0
	set	0x08, %i1
	stxa	%l2,	[%l7 + %i1] 0x0c
	tsubcc	%i6,	0x0890,	%g1
	tcs	%xcc,	0x4
	fmovspos	%icc,	%f20,	%f14
	udiv	%o7,	0x14B2,	%g7
	movcc	%xcc,	%g5,	%g6
	fabsd	%f2,	%f6
	fsrc2s	%f17,	%f24
	nop
	fitod	%f28,	%f26
	movrlz	%o3,	0x2AD,	%g3
	taddcctv	%i1,	%i5,	%i2
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x1D] %asi,	%i3
	edge32n	%o0,	%o1,	%o5
	fzeros	%f11
	udivcc	%l4,	0x0551,	%l6
	edge8	%l5,	%g2,	%l1
	subc	%g4,	0x17FE,	%o6
	xor	%o4,	%l0,	%l3
	mulx	%i4,	%o2,	%i7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] 0x80,	%i0,	%l2
	movrgez	%g1,	%o7,	%i6
	fabss	%f11,	%f26
	tne	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%g5,	%g7
	bpos,pn	%icc,	loop_1852
	alignaddr	%g6,	%g3,	%o3
	edge16ln	%i1,	%i2,	%i5
	orn	%o0,	%i3,	%o5
loop_1852:
	fmovde	%xcc,	%f17,	%f4
	nop
	setx	loop_1853,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x3E, %l5
	ldub	[%l7 + %l5],	%o1
	brlez	%l4,	loop_1854
	sdivx	%l5,	0x1687,	%g2
loop_1853:
	nop
	setx	0xBE0BF1363EFF6796,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE006A5CF129B99E9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f16,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1854:
	movcc	%xcc,	%l1,	%l6
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x58] %asi,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o4,	%l0,	%o6
	pdist	%f18,	%f26,	%f2
	prefetch	[%l7 + 0x0C],	 0x2
	tsubcc	%l3,	%o2,	%i7
	or	%i0,	0x04FD,	%l2
	addcc	%i4,	%o7,	%g1
	array16	%g5,	%g7,	%g6
	or	%g3,	0x18D2,	%o3
	smulcc	%i1,	%i2,	%i6
	fnegs	%f0,	%f25
	nop
	setx	0xD0BCB64A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x3A540DE5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f26,	%f8
	fmovsvc	%xcc,	%f3,	%f12
	set	0x68, %o6
	swapa	[%l7 + %o6] 0x89,	%o0
	orcc	%i3,	%o5,	%o1
	ldd	[%l7 + 0x60],	%i4
	movvc	%icc,	%l4,	%l5
	fbuge,a	%fcc0,	loop_1855
	xnorcc	%g2,	%l1,	%g4
	fornot1	%f28,	%f20,	%f26
	sdiv	%l6,	0x1DEA,	%l0
loop_1855:
	movgu	%xcc,	%o6,	%o4
	nop
	setx	0xA632459BF5D87C3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xBB4FC4B69ADBAD69,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f2,	%f16
	bl	%icc,	loop_1856
	fnot1	%f8,	%f4
	nop
	fitos	%f7,	%f30
	fble,a	%fcc3,	loop_1857
loop_1856:
	movvc	%xcc,	%o2,	%l3
	mova	%xcc,	%i7,	%i0
	edge32l	%i4,	%o7,	%l2
loop_1857:
	movvc	%xcc,	%g1,	%g7
	set	0x08, %l4
	lduwa	[%l7 + %l4] 0x04,	%g5
	tpos	%icc,	0x1
	tsubcctv	%g6,	0x0329,	%g3
	fands	%f14,	%f5,	%f18
	movleu	%xcc,	%o3,	%i1
	bl,a	loop_1858
	subc	%i6,	0x1371,	%i2
	addccc	%i3,	0x0E65,	%o0
	sll	%o5,	%o1,	%i5
loop_1858:
	xnorcc	%l4,	0x1DC6,	%g2
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x18
	fbu	%fcc3,	loop_1859
	ldstub	[%l7 + 0x4A],	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,pn	%icc,	loop_1860
loop_1859:
	orcc	%l5,	0x0D57,	%g4
	movcs	%xcc,	%l0,	%o6
	movge	%icc,	%o4,	%o2
loop_1860:
	fpsub32	%f14,	%f28,	%f0
	fornot2s	%f5,	%f29,	%f1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l6,	%l3
	fmovrse	%i7,	%f0,	%f4
	sllx	%i4,	%o7,	%i0
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ta	%xcc,	0x1
	bge,a,pt	%xcc,	loop_1861
	orncc	%l2,	0x0AD9,	%g1
	fmovdn	%icc,	%f18,	%f25
	fba	%fcc1,	loop_1862
loop_1861:
	ldd	[%l7 + 0x48],	%g4
	fbe,a	%fcc3,	loop_1863
	fzero	%f30
loop_1862:
	fmuld8ulx16	%f13,	%f27,	%f16
	movne	%icc,	%g6,	%g3
loop_1863:
	fpsub32	%f8,	%f26,	%f26
	set	0x60, %g5
	prefetcha	[%l7 + %g5] 0x19,	 0x0
	fbul,a	%fcc3,	loop_1864
	fmovdle	%xcc,	%f6,	%f30
	tge	%icc,	0x7
	nop
	fitos	%f11,	%f7
	fstox	%f7,	%f10
	fxtos	%f10,	%f7
loop_1864:
	fornot2s	%f17,	%f17,	%f20
	andcc	%g7,	%i1,	%i2
	ta	%xcc,	0x1
	nop
	fitod	%f12,	%f26
	fdtos	%f26,	%f6
	addcc	%i6,	%i3,	%o0
	tgu	%xcc,	0x1
	fbug	%fcc3,	loop_1865
	nop
	setx	0xA7DEA8E4606DA566,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fnor	%f24,	%f10,	%f30
	smulcc	%o1,	0x089C,	%i5
loop_1865:
	edge8	%l4,	%o5,	%l1
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f14
	fxtod	%f14,	%f24
	membar	0x36
	taddcctv	%l5,	%g2,	%g4
	ble,a	%xcc,	loop_1866
	fpadd32	%f30,	%f30,	%f12
	xorcc	%l0,	%o6,	%o2
	fmul8x16au	%f13,	%f9,	%f14
loop_1866:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x1C] %asi,	%l6
	sll	%l3,	%o4,	%i4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x63] %asi,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%xcc,	0x2
	orncc	%i0,	%i7,	%l2
	call	loop_1867
	movle	%icc,	%g1,	%g6
	array32	%g5,	%o3,	%g7
	tvc	%icc,	0x7
loop_1867:
	tn	%xcc,	0x5
	fbu,a	%fcc3,	loop_1868
	ldstub	[%l7 + 0x71],	%i1
	subcc	%i2,	%g3,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1868:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x08] %asi,	%f9
	movpos	%xcc,	%i3,	%o0
	call	loop_1869
	ldx	[%l7 + 0x58],	%o1
	tvc	%icc,	0x2
	subcc	%l4,	0x0A65,	%i5
loop_1869:
	bn,a	%xcc,	loop_1870
	fnands	%f3,	%f16,	%f2
	sub	%l1,	%o5,	%g2
	mova	%xcc,	%g4,	%l0
loop_1870:
	fmovsa	%icc,	%f0,	%f9
	edge16	%l5,	%o6,	%l6
	movrne	%l3,	0x116,	%o2
	umul	%i4,	%o7,	%i0
	mulx	%o4,	%l2,	%i7
	fsrc1	%f12,	%f16
	sll	%g6,	%g5,	%o3
	xnorcc	%g1,	%i1,	%g7
	subccc	%g3,	%i2,	%i6
	bneg,pt	%icc,	loop_1871
	brlz,a	%o0,	loop_1872
	bcc,a	%xcc,	loop_1873
	fnot1s	%f18,	%f28
loop_1871:
	tl	%xcc,	0x2
loop_1872:
	xnor	%i3,	0x1BA4,	%l4
loop_1873:
	nop
	set	0x78, %i2
	prefetcha	[%l7 + %i2] 0x18,	 0x3
	nop
	setx	loop_1874,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%l1,	%o5,	%i5
	tl	%icc,	0x5
	fors	%f5,	%f2,	%f16
loop_1874:
	sll	%g2,	%l0,	%g4
	movg	%icc,	%l5,	%l6
	andn	%l3,	%o6,	%o2
	nop
	setx	0x71AB139CD072F452,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	nop
	setx	loop_1875,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvc	%icc,	0x4
	array32	%o7,	%i4,	%i0
	tgu	%xcc,	0x4
loop_1875:
	edge32ln	%o4,	%l2,	%g6
	brlez,a	%i7,	loop_1876
	sllx	%g5,	0x18,	%o3
	taddcctv	%g1,	%i1,	%g7
	xor	%g3,	0x15BD,	%i6
loop_1876:
	addc	%i2,	%o0,	%l4
	tsubcc	%i3,	%l1,	%o1
	addccc	%i5,	0x046F,	%g2
	tneg	%icc,	0x3
	nop
	setx	0x19E6BF2E80402213,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	movge	%xcc,	%l0,	%o5
	srl	%l5,	%l6,	%g4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x23] %asi,	%l3
	sdivx	%o6,	0x1162,	%o2
	movleu	%icc,	%i4,	%o7
	movge	%icc,	%i0,	%o4
	umul	%g6,	%i7,	%g5
	fmovdgu	%xcc,	%f27,	%f16
	edge32n	%l2,	%o3,	%i1
	fors	%f7,	%f7,	%f4
	set	0x2C, %i0
	ldsha	[%l7 + %i0] 0x18,	%g7
	prefetch	[%l7 + 0x50],	 0x3
	fand	%f8,	%f6,	%f18
	fnor	%f30,	%f8,	%f10
	fmovsleu	%icc,	%f30,	%f16
	taddcctv	%g1,	%i6,	%i2
	sir	0x1487
	fabss	%f6,	%f26
	bvs	%xcc,	loop_1877
	movge	%xcc,	%g3,	%o0
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%f6
	nop
	setx	0xCDC36D1DBB2FAE28,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xF1D2F9185D81486A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f28,	%f14
loop_1877:
	bneg,a	loop_1878
	membar	0x63
	fmovrslez	%l4,	%f16,	%f0
	udivx	%i3,	0x1AFF,	%l1
loop_1878:
	fcmple32	%f20,	%f28,	%i5
	bg,a,pn	%xcc,	loop_1879
	movl	%icc,	%g2,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o1,	%o5
loop_1879:
	bg,a,pn	%xcc,	loop_1880
	fbue	%fcc2,	loop_1881
	nop
	set	0x10, %i6
	stw	%l5,	[%l7 + %i6]
	fandnot1s	%f9,	%f16,	%f16
loop_1880:
	fmovsne	%xcc,	%f25,	%f0
loop_1881:
	fbuge	%fcc1,	loop_1882
	fands	%f2,	%f8,	%f11
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g4
loop_1882:
	bgu,a	%icc,	loop_1883
	fxors	%f15,	%f16,	%f0
	tg	%icc,	0x3
	edge32l	%l3,	%o6,	%o2
loop_1883:
	movle	%xcc,	%l6,	%i4
	sll	%i0,	%o4,	%g6
	wr	%g0,	0x11,	%asi
	stha	%i7,	[%l7 + 0x24] %asi
	bvs	%xcc,	loop_1884
	sll	%o7,	%g5,	%o3
	sdivcc	%i1,	0x0FA9,	%g7
	tcc	%icc,	0x0
loop_1884:
	subccc	%l2,	0x1276,	%g1
	set	0x0C, %o2
	ldswa	[%l7 + %o2] 0x0c,	%i2
	tgu	%xcc,	0x3
	bcs,pn	%xcc,	loop_1885
	edge8n	%g3,	%i6,	%o0
	swap	[%l7 + 0x14],	%l4
	sllx	%l1,	%i5,	%g2
loop_1885:
	nop
	wr	%g0,	0xeb,	%asi
	stha	%i3,	[%l7 + 0x52] %asi
	membar	#Sync
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x24] %asi,	%o1
	fmovde	%icc,	%f20,	%f6
	andncc	%l0,	%l5,	%g4
	xor	%o5,	%l3,	%o6
	movleu	%xcc,	%o2,	%l6
	movneg	%icc,	%i0,	%i4
	fbe,a	%fcc1,	loop_1886
	fmovs	%f14,	%f18
	fmovsleu	%xcc,	%f27,	%f30
	lduw	[%l7 + 0x48],	%g6
loop_1886:
	xorcc	%o4,	%o7,	%g5
	addccc	%i7,	0x1328,	%o3
	movle	%icc,	%g7,	%l2
	nop
	setx	loop_1887,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f20
	fxtod	%f20,	%f4
	set	0x16, %g2
	stha	%g1,	[%l7 + %g2] 0xea
	membar	#Sync
loop_1887:
	tn	%icc,	0x7
	fbg	%fcc1,	loop_1888
	edge8l	%i1,	%i2,	%g3
	fands	%f28,	%f16,	%f18
	fmovdl	%xcc,	%f9,	%f17
loop_1888:
	sdivx	%i6,	0x1E01,	%l4
	fmovrsne	%o0,	%f28,	%f28
	ldub	[%l7 + 0x35],	%i5
	edge8	%l1,	%g2,	%i3
	edge8ln	%o1,	%l5,	%l0
	movne	%xcc,	%o5,	%g4
	call	loop_1889
	orcc	%l3,	0x08CD,	%o6
	std	%f18,	[%l7 + 0x78]
	tsubcc	%l6,	%i0,	%i4
loop_1889:
	move	%icc,	%o2,	%o4
	fmovdpos	%xcc,	%f8,	%f4
	fmovsgu	%xcc,	%f17,	%f14
	ldd	[%l7 + 0x30],	%f14
	sllx	%o7,	0x05,	%g6
	movvs	%xcc,	%g5,	%i7
	andn	%g7,	0x0D0C,	%l2
	nop
	fitos	%f1,	%f23
	fstox	%f23,	%f20
	fxtos	%f20,	%f4
	tsubcc	%g1,	0x0554,	%o3
	movl	%icc,	%i2,	%i1
	nop
	setx loop_1890, %l0, %l1
	jmpl %l1, %i6
	move	%xcc,	%g3,	%o0
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x78] %asi,	%l4
loop_1890:
	tneg	%icc,	0x2
	smulcc	%i5,	0x172D,	%l1
	movcc	%icc,	%i3,	%g2
	umul	%l5,	%l0,	%o1
	sra	%g4,	%o5,	%l3
	orcc	%l6,	0x1C11,	%o6
	fbul	%fcc0,	loop_1891
	nop
	fitos	%f4,	%f20
	fstoi	%f20,	%f10
	edge32	%i0,	%o2,	%i4
	set	0x64, %o3
	ldswa	[%l7 + %o3] 0x80,	%o7
loop_1891:
	andcc	%g6,	%g5,	%i7
	sllx	%o4,	0x10,	%g7
	tvc	%icc,	0x2
	orn	%l2,	0x1C78,	%o3
	tleu	%icc,	0x4
	set	0x1c8, %o4
	nop 	! 	stxa	%i2,	[%g0 + %o4] 0x40 ripped by fixASI40.pl
	movleu	%icc,	%i1,	%g1
	tn	%icc,	0x7
	xnorcc	%i6,	0x1E7B,	%g3
	fbul,a	%fcc2,	loop_1892
	nop
	setx	0xA2E5A79E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f12
	fnor	%f4,	%f22,	%f14
	nop
	setx	0x1DB0A5EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xDC545ABB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f18,	%f5
loop_1892:
	movrlez	%l4,	0x36E,	%o0
	edge8n	%i5,	%l1,	%i3
	fmovdleu	%icc,	%f4,	%f14
	subc	%g2,	%l5,	%o1
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	add	%g4,	0x0A89,	%l0
	brgz	%o5,	loop_1893
	movgu	%icc,	%l3,	%l6
	fmovsl	%icc,	%f19,	%f25
	edge16l	%o6,	%i0,	%o2
loop_1893:
	mulscc	%o7,	%i4,	%g5
	tpos	%xcc,	0x3
	alignaddr	%i7,	%g6,	%g7
	movrne	%l2,	0x0C3,	%o3
	fmovrdgez	%i2,	%f10,	%f18
	movrlez	%i1,	0x228,	%o4
	edge8l	%i6,	%g1,	%l4
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g3,	%o0
	subcc	%i5,	%l1,	%g2
	fmovsvs	%xcc,	%f1,	%f12
	edge32n	%l5,	%i3,	%o1
	tg	%icc,	0x7
	ldsh	[%l7 + 0x22],	%g4
	movvs	%icc,	%o5,	%l3
	sdiv	%l6,	0x056E,	%l0
	wr	%g0,	0xe3,	%asi
	stba	%o6,	[%l7 + 0x61] %asi
	membar	#Sync
	tcs	%icc,	0x5
	fbe	%fcc2,	loop_1894
	edge16	%o2,	%i0,	%i4
	fcmpgt16	%f10,	%f26,	%o7
	fmovrsne	%i7,	%f9,	%f29
loop_1894:
	tleu	%xcc,	0x7
	fbn	%fcc0,	loop_1895
	ldx	[%l7 + 0x48],	%g6
	srl	%g5,	0x0F,	%g7
	movcc	%xcc,	%o3,	%l2
loop_1895:
	movpos	%icc,	%i2,	%i1
	fbn	%fcc1,	loop_1896
	bpos,a,pn	%xcc,	loop_1897
	movn	%icc,	%o4,	%i6
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x18] %asi,	%g1
loop_1896:
	ta	%xcc,	0x1
loop_1897:
	xor	%l4,	0x1F81,	%g3
	edge16	%i5,	%l1,	%g2
	bleu,a,pn	%icc,	loop_1898
	stw	%l5,	[%l7 + 0x14]
	movle	%icc,	%i3,	%o0
	tg	%icc,	0x4
loop_1898:
	brgez,a	%o1,	loop_1899
	mova	%icc,	%o5,	%l3
	add	%l6,	0x0086,	%l0
	sub	%o6,	%o2,	%g4
loop_1899:
	st	%f7,	[%l7 + 0x7C]
	nop
	setx	0xF682051F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f29
	nop
	fitos	%f9,	%f29
	fstox	%f29,	%f26
	fxtos	%f26,	%f20
	movle	%xcc,	%i0,	%o7
	sdivcc	%i4,	0x02A9,	%g6
	udiv	%g5,	0x0899,	%i7
	nop
	setx	loop_1900,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_1901,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%g7,	%o3,	%i2
	srl	%i1,	0x0C,	%o4
loop_1900:
	xor	%l2,	%g1,	%i6
loop_1901:
	movvs	%icc,	%l4,	%i5
	ba,a	loop_1902
	fmovsl	%xcc,	%f24,	%f1
	orn	%l1,	%g3,	%g2
	swap	[%l7 + 0x78],	%l5
loop_1902:
	tvs	%icc,	0x4
	tl	%xcc,	0x4
	sdiv	%i3,	0x026B,	%o1
	te	%icc,	0x7
	be,a	%icc,	loop_1903
	call	loop_1904
	ta	%xcc,	0x1
	edge8	%o5,	%o0,	%l3
loop_1903:
	alignaddr	%l6,	%l0,	%o2
loop_1904:
	movrgez	%g4,	%i0,	%o6
	movge	%xcc,	%o7,	%i4
	edge32	%g6,	%i7,	%g5
	fmovrdlez	%o3,	%f6,	%f14
	fbule,a	%fcc1,	loop_1905
	movrlez	%g7,	0x15F,	%i2
	nop
	setx	0xC55D9CE6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f29
	sll	%o4,	%l2,	%g1
loop_1905:
	fmovdneg	%xcc,	%f2,	%f27
	taddcc	%i1,	0x0160,	%i6
	faligndata	%f26,	%f24,	%f8
	tne	%xcc,	0x2
	fmovdle	%icc,	%f26,	%f17
	nop
	fitod	%f8,	%f2
	fdtos	%f2,	%f13
	sdivcc	%l4,	0x15B8,	%l1
	fmuld8ulx16	%f13,	%f15,	%f24
	edge8n	%g3,	%i5,	%l5
	ldsh	[%l7 + 0x76],	%i3
	smulcc	%o1,	%g2,	%o5
	ble,pt	%xcc,	loop_1906
	array16	%o0,	%l3,	%l6
	bcs,a	%xcc,	loop_1907
	fba	%fcc0,	loop_1908
loop_1906:
	tge	%icc,	0x4
	tsubcctv	%l0,	0x0047,	%o2
loop_1907:
	movg	%icc,	%g4,	%o6
loop_1908:
	tl	%icc,	0x3
	tge	%icc,	0x0
	tg	%icc,	0x4
	popc	%o7,	%i4
	fblg	%fcc2,	loop_1909
	movne	%icc,	%g6,	%i7
	subccc	%g5,	0x0354,	%o3
	ldd	[%l7 + 0x10],	%i0
loop_1909:
	taddcctv	%g7,	0x0F16,	%i2
	smulcc	%l2,	%o4,	%i1
	fmovsgu	%icc,	%f9,	%f29
	fsrc1	%f16,	%f14
	fbu	%fcc2,	loop_1910
	fmovsvs	%icc,	%f3,	%f6
	edge8	%i6,	%g1,	%l4
	nop
	set	0x70, %i4
	ldx	[%l7 + %i4],	%g3
loop_1910:
	subcc	%i5,	0x111C,	%l5
	nop
	fitos	%f14,	%f29
	fstod	%f29,	%f12
	movge	%xcc,	%l1,	%o1
	fmovsle	%xcc,	%f30,	%f15
	sdivx	%i3,	0x038A,	%o5
	srl	%o0,	0x10,	%g2
	prefetch	[%l7 + 0x20],	 0x0
	prefetch	[%l7 + 0x74],	 0x3
	tsubcctv	%l6,	0x1164,	%l3
	fmovdgu	%icc,	%f20,	%f8
	andncc	%o2,	%l0,	%g4
	subccc	%o7,	%o6,	%i4
	fbue,a	%fcc3,	loop_1911
	movne	%xcc,	%i7,	%g6
	tvc	%icc,	0x3
	udiv	%o3,	0x189E,	%i0
loop_1911:
	nop
	setx	0x149D506550680CB0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	udiv	%g7,	0x06BC,	%g5
	sethi	0x1AB5,	%l2
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x30] %asi,	%i2
	taddcctv	%o4,	%i6,	%i1
	sll	%g1,	%l4,	%g3
	add	%i5,	%l5,	%o1
	subc	%l1,	%i3,	%o5
	sdivx	%o0,	0x158C,	%g2
	fandnot1s	%f14,	%f13,	%f9
	set	0x3C, %g6
	sta	%f18,	[%l7 + %g6] 0x14
	edge8l	%l3,	%l6,	%o2
	movle	%icc,	%g4,	%o7
	subc	%o6,	0x05B7,	%i4
	edge32ln	%i7,	%g6,	%o3
	fabsd	%f24,	%f0
	sdivcc	%l0,	0x1FF4,	%i0
	sdiv	%g5,	0x0F7F,	%g7
	st	%f16,	[%l7 + 0x34]
	fmovsleu	%xcc,	%f22,	%f11
	sll	%i2,	0x0D,	%o4
	fmovsg	%icc,	%f31,	%f24
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	andcc	%l2,	0x0B23,	%i1
	fbul,a	%fcc3,	loop_1912
	bcs,a	loop_1913
	sllx	%g1,	0x11,	%i6
	wr	%g0,	0x80,	%asi
	stxa	%g3,	[%l7 + 0x78] %asi
loop_1912:
	xnor	%l4,	0x1092,	%i5
loop_1913:
	movn	%icc,	%o1,	%l5
	nop
	fitos	%f1,	%f14
	fstox	%f14,	%f18
	srax	%i3,	%l1,	%o0
	fone	%f24
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%o5
	ble,a	loop_1914
	movrlez	%l3,	0x38E,	%g2
	movrgz	%l6,	0x298,	%g4
	alignaddr	%o2,	%o7,	%o6
loop_1914:
	bl,pn	%icc,	loop_1915
	taddcc	%i4,	0x0420,	%i7
	smulcc	%g6,	0x127F,	%o3
	sll	%l0,	0x0D,	%g5
loop_1915:
	membar	0x5D
	and	%i0,	0x0F78,	%g7
	tcc	%xcc,	0x0
	tge	%icc,	0x6
	movvs	%xcc,	%i2,	%o4
	subccc	%l2,	0x14B9,	%i1
	subccc	%g1,	0x1459,	%i6
	fmovde	%icc,	%f23,	%f27
	movl	%icc,	%g3,	%i5
	fornot1	%f18,	%f16,	%f16
	set	0x24, %l6
	lduha	[%l7 + %l6] 0x11,	%o1
	movrgez	%l4,	0x155,	%i3
	movge	%icc,	%l5,	%o0
	fmuld8sux16	%f20,	%f25,	%f28
	tvs	%icc,	0x6
	movgu	%xcc,	%o5,	%l3
	brz	%g2,	loop_1916
	udivx	%l1,	0x1BF6,	%l6
	xnorcc	%g4,	0x1407,	%o7
	add	%o2,	0x1E46,	%i4
loop_1916:
	xnorcc	%o6,	0x1727,	%g6
	movg	%xcc,	%o3,	%l0
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x11,	%f0
	nop
	fitod	%f8,	%f6
	fdtos	%f6,	%f1
	fcmpne16	%f24,	%f0,	%g5
	fcmpeq32	%f12,	%f26,	%i7
	popc	%i0,	%g7
	tl	%xcc,	0x1
	movrlz	%i2,	%l2,	%i1
	call	loop_1917
	fmovrslez	%o4,	%f16,	%f29
	array8	%i6,	%g3,	%g1
	fmovse	%xcc,	%f30,	%f1
loop_1917:
	fcmpeq16	%f6,	%f8,	%i5
	movcs	%icc,	%l4,	%i3
	sdivcc	%o1,	0x0ADF,	%o0
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sllx	%l5,	0x0D,	%o5
	set	0x18, %l1
	sta	%f13,	[%l7 + %l1] 0x80
	nop
	setx	0x304D98E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	tleu	%icc,	0x3
	movvs	%xcc,	%l3,	%l1
	set	0x40, %o0
	ldsha	[%l7 + %o0] 0x10,	%g2
	edge8	%l6,	%o7,	%g4
	fandnot2	%f12,	%f22,	%f30
	move	%xcc,	%o2,	%o6
	fmul8sux16	%f6,	%f22,	%f14
	nop
	setx	loop_1918,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbo,a	%fcc1,	loop_1919
	bleu	%icc,	loop_1920
	addc	%i4,	%o3,	%g6
loop_1918:
	movcs	%icc,	%g5,	%i7
loop_1919:
	smulcc	%i0,	0x13B4,	%g7
loop_1920:
	fmovdl	%xcc,	%f10,	%f6
	edge16l	%l0,	%i2,	%l2
	tge	%icc,	0x3
	mulx	%o4,	0x0FD0,	%i1
	movrne	%i6,	%g1,	%g3
	fmovdn	%icc,	%f25,	%f5
	fcmpne16	%f6,	%f12,	%l4
	ld	[%l7 + 0x3C],	%f12
	fmul8sux16	%f8,	%f20,	%f10
	fbne,a	%fcc2,	loop_1921
	fxors	%f26,	%f5,	%f7
	ldub	[%l7 + 0x1E],	%i5
	fmovdleu	%icc,	%f29,	%f10
loop_1921:
	movpos	%icc,	%o1,	%i3
	movvc	%xcc,	%l5,	%o0
	addccc	%o5,	%l1,	%g2
	fmovsleu	%icc,	%f22,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l3,	0x0D0E,	%o7
	fmovrsgz	%l6,	%f0,	%f15
	sll	%g4,	0x08,	%o6
	movvc	%icc,	%o2,	%o3
	sethi	0x109B,	%i4
	sdiv	%g5,	0x13CB,	%g6
	brnz	%i0,	loop_1922
	fpadd32s	%f21,	%f30,	%f22
	sth	%g7,	[%l7 + 0x1C]
	orn	%l0,	0x03F4,	%i7
loop_1922:
	edge8l	%l2,	%i2,	%o4
	sethi	0x18DE,	%i1
	sth	%g1,	[%l7 + 0x66]
	alignaddr	%g3,	%l4,	%i6
	fandnot2	%f24,	%f16,	%f18
	ta	%icc,	0x6
	fmul8x16	%f10,	%f20,	%f22
	fmuld8ulx16	%f22,	%f28,	%f4
	tcc	%xcc,	0x2
	or	%i5,	0x0008,	%o1
	sir	0x01A1
	ta	%icc,	0x5
	tne	%xcc,	0x6
	movge	%xcc,	%i3,	%o0
	fble	%fcc0,	loop_1923
	movrne	%o5,	%l1,	%g2
	ldx	[%l7 + 0x08],	%l5
	sllx	%l3,	0x1A,	%o7
loop_1923:
	nop
	wr	%g0,	0x0c,	%asi
	stha	%l6,	[%l7 + 0x2E] %asi
	movrlez	%g4,	%o6,	%o3
	fmovrse	%o2,	%f12,	%f15
	fpadd32s	%f30,	%f7,	%f24
	sir	0x1C62
	movrgez	%g5,	0x20B,	%g6
	smulcc	%i4,	%g7,	%l0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x04,	%f16
	fornot1	%f30,	%f2,	%f14
	sir	0x1707
	subc	%i0,	0x08E1,	%i7
	flush	%l7 + 0x0C
	xorcc	%l2,	%i2,	%i1
	movrlz	%o4,	0x31F,	%g1
	edge8	%l4,	%i6,	%i5
	tsubcc	%o1,	%g3,	%i3
	fpsub32s	%f22,	%f7,	%f16
	fsrc1s	%f21,	%f6
	fandnot1	%f0,	%f2,	%f2
	fmovd	%f30,	%f18
	nop
	setx	0x6282F7E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x10D5F017,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f1,	%f25
	fbue,a	%fcc0,	loop_1924
	addcc	%o5,	0x1B3D,	%l1
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f20
	fxtod	%f20,	%f2
	orn	%g2,	%l5,	%l3
loop_1924:
	fxnor	%f30,	%f14,	%f20
	bleu	%icc,	loop_1925
	fmul8x16	%f0,	%f18,	%f10
	fbe,a	%fcc1,	loop_1926
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f30
	fxtod	%f30,	%f30
loop_1925:
	fcmpeq16	%f14,	%f4,	%o0
	tneg	%icc,	0x2
loop_1926:
	andn	%l6,	%o7,	%o6
	movrlez	%g4,	0x394,	%o2
	and	%o3,	%g6,	%g5
	fbul,a	%fcc2,	loop_1927
	movvs	%icc,	%i4,	%l0
	set	0x20, %l3
	prefetcha	[%l7 + %l3] 0x14,	 0x1
loop_1927:
	sethi	0x1E41,	%i7
	ldub	[%l7 + 0x76],	%l2
	fmovdvs	%xcc,	%f14,	%f12
	nop
	setx	0xF05E96BF,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	tvs	%xcc,	0x5
	array8	%g7,	%i1,	%o4
	tle	%icc,	0x4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x70] %asi,	%f18
	fbg,a	%fcc2,	loop_1928
	mova	%icc,	%g1,	%i2
	movpos	%xcc,	%l4,	%i5
	set	0x31, %g4
	lduba	[%l7 + %g4] 0x04,	%o1
loop_1928:
	taddcc	%i6,	0x185D,	%i3
	edge8	%o5,	%g3,	%g2
	udivx	%l1,	0x0689,	%l5
	ldsw	[%l7 + 0x2C],	%o0
	set	0x0C, %i7
	sta	%f17,	[%l7 + %i7] 0x80
	edge16	%l3,	%l6,	%o6
	udivcc	%g4,	0x1178,	%o2
	srl	%o7,	%g6,	%o3
	bn,a,pn	%xcc,	loop_1929
	edge8l	%g5,	%l0,	%i0
	fmovsl	%xcc,	%f23,	%f16
	fmovdcc	%xcc,	%f21,	%f10
loop_1929:
	bg,a,pn	%icc,	loop_1930
	fornot2	%f28,	%f18,	%f4
	subc	%i7,	0x0F8B,	%l2
	move	%xcc,	%i4,	%g7
loop_1930:
	fxor	%f14,	%f12,	%f2
	movrgez	%i1,	0x226,	%o4
	fxor	%f4,	%f24,	%f2
	nop
	setx	0x6FD590E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xE5626EE0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f7,	%f3
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f21
	fmovdleu	%xcc,	%f28,	%f6
	fpack16	%f18,	%f4
	fnors	%f27,	%f5,	%f3
	xorcc	%i2,	%l4,	%i5
	fbne	%fcc2,	loop_1931
	movneg	%xcc,	%g1,	%i6
	bcc,a,pn	%icc,	loop_1932
	ldsb	[%l7 + 0x19],	%o1
loop_1931:
	nop
	set	0x62, %i5
	stha	%o5,	[%l7 + %i5] 0xea
	membar	#Sync
loop_1932:
	fandnot2	%f12,	%f26,	%f30
	edge16	%i3,	%g2,	%g3
	tpos	%xcc,	0x5
	fmovscc	%icc,	%f20,	%f7
	edge16	%l1,	%l5,	%o0
	ba,a,pn	%xcc,	loop_1933
	fnot1s	%f13,	%f18
	set	0x5C, %o7
	stha	%l3,	[%l7 + %o7] 0x18
loop_1933:
	andcc	%l6,	%o6,	%o2
	array32	%o7,	%g4,	%o3
	movrgz	%g5,	%g6,	%i0
	sub	%l0,	0x0169,	%l2
	movrlez	%i7,	0x277,	%i4
	edge32	%i1,	%o4,	%g7
	pdist	%f28,	%f28,	%f4
	movge	%xcc,	%l4,	%i5
	sir	0x1C94
	fmuld8ulx16	%f9,	%f27,	%f2
	movne	%xcc,	%i2,	%i6
	fbuge,a	%fcc3,	loop_1934
	sethi	0x1F32,	%o1
	add	%o5,	0x1097,	%g1
	fbul	%fcc1,	loop_1935
loop_1934:
	call	loop_1936
	and	%i3,	%g2,	%l1
	nop
	setx	0xC5B9C012EB97A082,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x01CA229F28633191,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f24,	%f12
loop_1935:
	movne	%icc,	%g3,	%o0
loop_1936:
	taddcc	%l5,	%l3,	%o6
	fandnot2	%f22,	%f24,	%f30
	nop
	fitos	%f9,	%f27
	fstox	%f27,	%f18
	fxtos	%f18,	%f4
	taddcctv	%l6,	0x0A0B,	%o2
	movvs	%xcc,	%o7,	%g4
	sub	%g5,	0x0E58,	%o3
	movcs	%xcc,	%g6,	%i0
	ldsw	[%l7 + 0x58],	%l2
	tvc	%icc,	0x2
	nop
	setx	loop_1937,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlz	%l0,	%i4,	%i7
	tne	%xcc,	0x0
	movl	%xcc,	%i1,	%o4
loop_1937:
	fmovdcc	%xcc,	%f17,	%f4
	mova	%icc,	%g7,	%l4
	movpos	%icc,	%i2,	%i6
	xor	%o1,	%o5,	%i5
	umul	%i3,	0x1CDF,	%g2
	fmovrsne	%l1,	%f20,	%f12
	umul	%g1,	0x0D01,	%o0
	or	%l5,	%g3,	%o6
	set	0x3C, %l0
	stwa	%l3,	[%l7 + %l0] 0x04
	srl	%o2,	0x1A,	%l6
	movpos	%xcc,	%o7,	%g5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x58] %asi,	%f26
	subcc	%o3,	%g4,	%i0
	bshuffle	%f8,	%f6,	%f0
	tleu	%xcc,	0x3
	tcs	%xcc,	0x4
	ta	%icc,	0x7
	edge16ln	%g6,	%l0,	%l2
	brnz,a	%i4,	loop_1938
	tgu	%xcc,	0x7
	stbar
	movgu	%icc,	%i7,	%i1
loop_1938:
	xorcc	%o4,	0x0895,	%g7
	edge32n	%i2,	%l4,	%o1
	andcc	%o5,	%i5,	%i3
	nop
	fitod	%f12,	%f22
	fdtox	%f22,	%f30
	movneg	%icc,	%i6,	%l1
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x10,	%f16
	fzeros	%f3
	fbn,a	%fcc2,	loop_1939
	fmovsg	%xcc,	%f0,	%f19
	andncc	%g1,	%g2,	%l5
	subccc	%o0,	0x198C,	%g3
loop_1939:
	edge32l	%o6,	%l3,	%l6
	nop
	setx	0xEF4A5445,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x6922EDFE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f2,	%f18
	srlx	%o2,	%o7,	%g5
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x79] %asi,	%o3
	orn	%g4,	%i0,	%g6
	tleu	%icc,	0x3
	for	%f26,	%f4,	%f24
	wr	%g0,	0x10,	%asi
	stba	%l2,	[%l7 + 0x1D] %asi
	andn	%l0,	0x0A2F,	%i4
	tsubcc	%i1,	%o4,	%g7
	tleu	%xcc,	0x1
	subccc	%i7,	0x100D,	%i2
	fmovdcs	%xcc,	%f27,	%f13
	nop
	setx	0x30652538,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	udivx	%l4,	0x0338,	%o5
	srl	%i5,	%i3,	%i6
	udivx	%l1,	0x043A,	%o1
	xorcc	%g2,	0x1E8B,	%l5
	srl	%g1,	0x13,	%o0
	fnot2s	%f18,	%f8
	fmul8sux16	%f4,	%f22,	%f6
	movgu	%icc,	%g3,	%l3
	addcc	%o6,	0x0FED,	%l6
	tcs	%icc,	0x1
	edge32n	%o7,	%g5,	%o2
	fandnot2	%f24,	%f26,	%f26
	xnorcc	%g4,	0x1762,	%i0
	fmovrsne	%g6,	%f29,	%f10
	bge	loop_1940
	fmovscs	%icc,	%f26,	%f14
	tg	%xcc,	0x3
	movleu	%icc,	%o3,	%l0
loop_1940:
	movvc	%xcc,	%l2,	%i1
	fmovda	%xcc,	%f9,	%f22
	fmovscs	%xcc,	%f28,	%f7
	move	%xcc,	%o4,	%i4
	fbule	%fcc3,	loop_1941
	addc	%g7,	%i7,	%l4
	fmovscs	%icc,	%f1,	%f3
	fmovdge	%xcc,	%f6,	%f10
loop_1941:
	edge8n	%i2,	%o5,	%i5
	or	%i3,	%i6,	%o1
	tgu	%icc,	0x4
	add	%g2,	0x148B,	%l5
	nop
	setx	0xB6E198B6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xE9B71A50,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f18,	%f21
	mulscc	%l1,	0x1173,	%g1
	fexpand	%f27,	%f26
	fmovspos	%icc,	%f23,	%f8
	fcmpgt16	%f10,	%f0,	%g3
	fxnors	%f11,	%f3,	%f17
	for	%f20,	%f0,	%f30
	movrgz	%l3,	0x20F,	%o6
	nop
	setx	0x5CF6663F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f5
	edge8	%l6,	%o0,	%g5
	tsubcc	%o7,	%o2,	%g4
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%f22
	fmovsle	%xcc,	%f15,	%f5
	fbuge	%fcc0,	loop_1942
	xorcc	%i0,	0x07E6,	%o3
	fmovsne	%icc,	%f12,	%f0
	movn	%xcc,	%l0,	%l2
loop_1942:
	sll	%g6,	0x1A,	%i1
	fmovdge	%icc,	%f13,	%f9
	bn,pt	%icc,	loop_1943
	mova	%xcc,	%o4,	%i4
	tneg	%icc,	0x6
	nop
	setx	0xED35A414,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x56643AFC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f18,	%f6
loop_1943:
	nop
	set	0x2E, %g3
	stha	%g7,	[%l7 + %g3] 0x19
	fornot1	%f18,	%f2,	%f16
	fmovsle	%xcc,	%f25,	%f16
	fmul8ulx16	%f20,	%f2,	%f2
	ldd	[%l7 + 0x70],	%f0
	fnot2s	%f3,	%f1
	fmovrdgez	%l4,	%f20,	%f2
	bneg,a	loop_1944
	edge8	%i2,	%i7,	%i5
	edge16ln	%o5,	%i6,	%i3
	fpack16	%f22,	%f6
loop_1944:
	edge16l	%o1,	%l5,	%l1
	movrlz	%g2,	%g3,	%g1
	movleu	%xcc,	%l3,	%l6
	tsubcctv	%o6,	0x1186,	%g5
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x12] %asi,	%o0
	tne	%icc,	0x2
	nop
	setx	0xE07A83B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	addccc	%o2,	0x11E1,	%o7
	mulx	%g4,	0x0DE0,	%i0
	be	%icc,	loop_1945
	bleu,a,pn	%icc,	loop_1946
	bleu,a,pn	%xcc,	loop_1947
	movge	%xcc,	%o3,	%l0
loop_1945:
	fblg,a	%fcc0,	loop_1948
loop_1946:
	tcs	%xcc,	0x3
loop_1947:
	tl	%icc,	0x6
	mulx	%l2,	0x1EA5,	%i1
loop_1948:
	mova	%icc,	%o4,	%i4
	stb	%g7,	[%l7 + 0x0A]
	fnands	%f5,	%f1,	%f27
	nop
	fitod	%f8,	%f8
	fdtoi	%f8,	%f2
	ble,pt	%icc,	loop_1949
	orn	%l4,	%g6,	%i7
	movl	%xcc,	%i2,	%i5
	fmovse	%icc,	%f27,	%f20
loop_1949:
	nop
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	nop
	setx	loop_1950,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddrl	%o5,	%i3,	%o1
	edge8	%l5,	%l1,	%g3
	set	0x66, %i1
	stha	%g2,	[%l7 + %i1] 0xe3
	membar	#Sync
loop_1950:
	membar	0x0F
	movre	%g1,	%l3,	%o6
	tsubcc	%g5,	0x1277,	%l6
	fmovde	%icc,	%f26,	%f30
	sdivx	%o0,	0x0106,	%o2
	udivcc	%g4,	0x075D,	%o7
	tvs	%icc,	0x6
	sllx	%o3,	0x13,	%i0
	xor	%l2,	0x1C48,	%i1
	bneg,a,pt	%xcc,	loop_1951
	udivcc	%l0,	0x1BCC,	%o4
	fmovdleu	%xcc,	%f21,	%f7
	array8	%i4,	%g7,	%g6
loop_1951:
	bl,a	%icc,	loop_1952
	ble	%icc,	loop_1953
	edge8	%l4,	%i2,	%i7
	taddcc	%i5,	%i6,	%i3
loop_1952:
	nop
	wr	%g0,	0x80,	%asi
	stha	%o5,	[%l7 + 0x7A] %asi
loop_1953:
	orncc	%l5,	%l1,	%g3
	udiv	%o1,	0x05E1,	%g2
	sth	%g1,	[%l7 + 0x20]
	sdiv	%l3,	0x173A,	%g5
	bneg	loop_1954
	orcc	%l6,	%o0,	%o2
	fpsub32s	%f14,	%f7,	%f11
	fba	%fcc3,	loop_1955
loop_1954:
	bpos	loop_1956
	fbne	%fcc2,	loop_1957
	xnor	%g4,	0x1DC3,	%o6
loop_1955:
	movcs	%icc,	%o7,	%o3
loop_1956:
	udivx	%l2,	0x008F,	%i1
loop_1957:
	ta	%icc,	0x5
	nop
	setx	0xC896A805,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x37BA4542,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f7,	%f19
	smulcc	%i0,	0x073C,	%o4
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f12
	tl	%xcc,	0x2
	udivx	%l0,	0x03F5,	%i4
	wr	%g0,	0x2a,	%asi
	stwa	%g6,	[%l7 + 0x14] %asi
	membar	#Sync
	fbug	%fcc0,	loop_1958
	fabss	%f7,	%f22
	addccc	%l4,	0x1859,	%i2
	fbl,a	%fcc3,	loop_1959
loop_1958:
	fbu	%fcc3,	loop_1960
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g7,	0x0107,	%i7
loop_1959:
	bneg,a,pn	%icc,	loop_1961
loop_1960:
	andn	%i5,	0x0DC7,	%i3
	mulx	%i6,	0x0B4F,	%o5
	fbn	%fcc1,	loop_1962
loop_1961:
	ldub	[%l7 + 0x39],	%l1
	movneg	%icc,	%l5,	%o1
	sll	%g2,	0x05,	%g3
loop_1962:
	array8	%l3,	%g5,	%l6
	movneg	%xcc,	%g1,	%o2
	mulx	%o0,	0x1EBF,	%g4
	tcc	%icc,	0x0
	movrgez	%o6,	%o3,	%o7
	fbge,a	%fcc0,	loop_1963
	tne	%xcc,	0x2
	subccc	%i1,	%i0,	%l2
	fmovdge	%icc,	%f3,	%f20
loop_1963:
	bpos,pn	%icc,	loop_1964
	udiv	%o4,	0x042D,	%i4
	alignaddrl	%l0,	%l4,	%i2
	set	0x2C, %l5
	sta	%f27,	[%l7 + %l5] 0x15
loop_1964:
	andcc	%g7,	%g6,	%i7
	ldsb	[%l7 + 0x56],	%i5
	ldsb	[%l7 + 0x0F],	%i6
	and	%i3,	%l1,	%o5
	sdivx	%l5,	0x1166,	%g2
	sllx	%o1,	0x1B,	%g3
	sub	%l3,	%g5,	%g1
	movrgz	%l6,	0x291,	%o0
	movpos	%xcc,	%g4,	%o2
	fblg,a	%fcc3,	loop_1965
	edge16n	%o6,	%o3,	%i1
	fornot1s	%f13,	%f1,	%f4
	fandnot1s	%f9,	%f7,	%f28
loop_1965:
	movrgz	%i0,	%o7,	%l2
	movrlz	%o4,	%i4,	%l4
	nop
	setx	0xB34CAFA988ACB3ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x96E912104BDF035D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f4,	%f30
	nop
	setx loop_1966, %l0, %l1
	jmpl %l1, %l0
	movg	%icc,	%i2,	%g6
	ldsh	[%l7 + 0x76],	%i7
	and	%g7,	%i6,	%i5
loop_1966:
	fnot1	%f6,	%f14
	fsrc1	%f30,	%f30
	membar	0x0A
	nop
	setx	0x37AE41136F888EEA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB480D4F1BEA3D62D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f10,	%f2
	fmul8x16	%f7,	%f4,	%f22
	nop
	setx	loop_1967,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srlx	%i3,	%l1,	%o5
	movle	%xcc,	%g2,	%o1
	movle	%icc,	%g3,	%l5
loop_1967:
	movleu	%xcc,	%g5,	%g1
	wr	%g0,	0xeb,	%asi
	stba	%l6,	[%l7 + 0x6E] %asi
	membar	#Sync
	movrlez	%o0,	%l3,	%g4
	membar	0x2A
	bg,pt	%icc,	loop_1968
	smulcc	%o6,	%o3,	%i1
	xorcc	%i0,	0x1942,	%o2
	tpos	%xcc,	0x7
loop_1968:
	add	%o7,	0x1D1C,	%o4
	tpos	%xcc,	0x4
	subcc	%i4,	%l2,	%l4
	movre	%i2,	0x335,	%g6
	array16	%i7,	%l0,	%i6
	fmovrdgez	%g7,	%f4,	%f0
	tsubcc	%i3,	%l1,	%i5
	set	0x52, %o6
	ldsha	[%l7 + %o6] 0x10,	%g2
	move	%icc,	%o1,	%g3
	mova	%xcc,	%l5,	%o5
	and	%g1,	%l6,	%g5
	array8	%o0,	%g4,	%o6
	fabsd	%f16,	%f24
	fmovs	%f4,	%f4
	stbar
	srl	%l3,	0x14,	%o3
	fnot2	%f28,	%f14
	umulcc	%i1,	%i0,	%o2
	movre	%o7,	%o4,	%i4
	fmovdge	%xcc,	%f4,	%f9
	wr	%g0,	0x27,	%asi
	stba	%l2,	[%l7 + 0x2A] %asi
	membar	#Sync
	fnegs	%f23,	%f9
	edge8	%i2,	%g6,	%l4
	xnor	%l0,	%i7,	%g7
	nop
	setx	0x367B68DD6DC182E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x01BACD4AE17BDF7E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f4,	%f22
	fmovspos	%icc,	%f31,	%f20
	ta	%icc,	0x0
	fexpand	%f6,	%f26
	wr	%g0,	0x27,	%asi
	stxa	%i6,	[%l7 + 0x08] %asi
	membar	#Sync
	tleu	%icc,	0x7
	nop
	fitos	%f6,	%f24
	addccc	%i3,	%l1,	%i5
	brz	%o1,	loop_1969
	fmovrsgez	%g3,	%f24,	%f26
	fmovsn	%icc,	%f19,	%f2
	add	%l5,	0x1AF1,	%o5
loop_1969:
	or	%g2,	%g1,	%l6
	sra	%g5,	%g4,	%o6
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x6A] %asi,	%l3
	fabsd	%f10,	%f16
	nop
	fitod	%f10,	%f10
	fdtoi	%f10,	%f25
	taddcc	%o0,	%i1,	%i0
	array8	%o3,	%o7,	%o2
	fcmpeq32	%f2,	%f20,	%o4
	array16	%i4,	%i2,	%g6
	edge32l	%l2,	%l0,	%l4
	alignaddr	%g7,	%i7,	%i3
	edge32ln	%i6,	%l1,	%i5
	ba	loop_1970
	sdiv	%o1,	0x0DDD,	%l5
	tge	%icc,	0x3
	movrlz	%g3,	0x2BF,	%g2
loop_1970:
	fba	%fcc0,	loop_1971
	fand	%f22,	%f16,	%f28
	bleu,a	loop_1972
	udivx	%o5,	0x0E69,	%g1
loop_1971:
	bcc,a	%icc,	loop_1973
	movrne	%l6,	0x2EE,	%g4
loop_1972:
	movneg	%icc,	%o6,	%l3
	fbo	%fcc0,	loop_1974
loop_1973:
	sllx	%g5,	0x05,	%o0
	tn	%xcc,	0x5
	fmovrse	%i0,	%f7,	%f30
loop_1974:
	movcs	%xcc,	%i1,	%o3
	fmovsneg	%xcc,	%f29,	%f13
	fpsub16	%f0,	%f4,	%f20
	movneg	%xcc,	%o2,	%o4
	orncc	%i4,	%i2,	%o7
	taddcc	%g6,	0x138C,	%l2
	ldd	[%l7 + 0x48],	%l4
	udivx	%g7,	0x15A4,	%l0
	fmovrdgz	%i7,	%f16,	%f2
	xnorcc	%i6,	%i3,	%i5
	xorcc	%l1,	0x06E0,	%l5
	movre	%o1,	0x243,	%g2
	edge32ln	%g3,	%g1,	%o5
	fbne	%fcc2,	loop_1975
	sir	0x10DF
	stx	%l6,	[%l7 + 0x30]
	orncc	%g4,	0x0BD6,	%o6
loop_1975:
	fbul	%fcc2,	loop_1976
	ldsw	[%l7 + 0x78],	%l3
	nop
	setx	0xEDB85054637D1EF3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x337B933F4CE2EC2C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f10,	%f16
	andcc	%o0,	%g5,	%i1
loop_1976:
	bge	%icc,	loop_1977
	sethi	0x1200,	%i0
	ble,a,pt	%icc,	loop_1978
	edge16n	%o3,	%o2,	%o4
loop_1977:
	edge16n	%i4,	%i2,	%g6
	movge	%xcc,	%l2,	%o7
loop_1978:
	andcc	%l4,	0x10EB,	%l0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x80,	%g7,	%i6
	fmovdge	%icc,	%f7,	%f21
	xor	%i7,	%i5,	%l1
	fornot2	%f4,	%f14,	%f0
	movgu	%icc,	%l5,	%i3
	fpsub16s	%f16,	%f17,	%f8
	fmovsgu	%xcc,	%f18,	%f24
	taddcctv	%g2,	0x005E,	%g3
	array16	%o1,	%g1,	%o5
	umulcc	%g4,	%l6,	%l3
	edge8	%o0,	%o6,	%g5
	fbl,a	%fcc0,	loop_1979
	edge32n	%i1,	%o3,	%o2
	movrgz	%i0,	%i4,	%i2
	movle	%icc,	%g6,	%o4
loop_1979:
	sllx	%o7,	%l4,	%l2
	movgu	%icc,	%l0,	%i6
	xnorcc	%g7,	0x07DB,	%i7
	swap	[%l7 + 0x14],	%l1
	movleu	%xcc,	%i5,	%l5
	tvs	%xcc,	0x3
	bneg	%icc,	loop_1980
	fpadd16s	%f21,	%f11,	%f0
	fbne,a	%fcc1,	loop_1981
	tcs	%xcc,	0x2
loop_1980:
	ta	%icc,	0x2
	movn	%icc,	%i3,	%g2
loop_1981:
	bge,pt	%xcc,	loop_1982
	nop
	setx	0x4D2C66AEF0752AD6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	movn	%icc,	%g3,	%o1
	fxnor	%f18,	%f24,	%f22
loop_1982:
	edge16	%o5,	%g4,	%g1
	brgez,a	%l6,	loop_1983
	bne,pn	%xcc,	loop_1984
	fmovsge	%xcc,	%f22,	%f26
	tne	%icc,	0x2
loop_1983:
	mulx	%o0,	%l3,	%o6
loop_1984:
	xor	%g5,	0x0E9E,	%i1
	array32	%o3,	%o2,	%i0
	orcc	%i2,	0x0E0C,	%i4
	smulcc	%o4,	0x05EA,	%o7
	mova	%icc,	%g6,	%l4
	tsubcctv	%l0,	0x1B4B,	%i6
	tle	%icc,	0x5
	xorcc	%l2,	0x0F1D,	%g7
	srl	%i7,	0x17,	%i5
	nop
	set	0x62, %l4
	ldstub	[%l7 + %l4],	%l5
	fbn	%fcc1,	loop_1985
	edge16l	%l1,	%i3,	%g2
	tle	%icc,	0x2
	tne	%icc,	0x6
loop_1985:
	tcc	%xcc,	0x4
	set	0x28, %i3
	ldxa	[%l7 + %i3] 0x81,	%o1
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f14
	fxtod	%f14,	%f10
	brlez,a	%o5,	loop_1986
	nop
	setx	0xB1E46DDF69622B9E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x629DCF0C15EF2601,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f26,	%f10
	xor	%g4,	%g1,	%g3
	fmovrsgz	%o0,	%f27,	%f15
loop_1986:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f8,	[%l7 + 0x48] %asi
	tge	%icc,	0x5
	sll	%l3,	0x00,	%o6
	movcs	%icc,	%l6,	%g5
	movcs	%xcc,	%i1,	%o3
	fxor	%f26,	%f4,	%f18
	fabss	%f0,	%f11
	set	0x4C, %g5
	stwa	%i0,	[%l7 + %g5] 0x19
	udiv	%i2,	0x0EF2,	%i4
	xnor	%o4,	%o7,	%g6
	edge8	%o2,	%l4,	%l0
	faligndata	%f8,	%f24,	%f14
	be,a,pt	%icc,	loop_1987
	movrlez	%i6,	0x267,	%l2
	st	%f6,	[%l7 + 0x34]
	nop
	fitod	%f6,	%f12
	fdtos	%f12,	%f11
loop_1987:
	ldd	[%l7 + 0x78],	%f8
	xorcc	%i7,	%g7,	%l5
	tge	%xcc,	0x5
	bcc,a	%xcc,	loop_1988
	bge	%icc,	loop_1989
	edge16ln	%i5,	%l1,	%i3
	fmovrsgez	%o1,	%f6,	%f0
loop_1988:
	brlz,a	%g2,	loop_1990
loop_1989:
	fba,a	%fcc2,	loop_1991
	movvs	%xcc,	%g4,	%g1
	movg	%xcc,	%g3,	%o0
loop_1990:
	mulx	%o5,	%o6,	%l3
loop_1991:
	mova	%xcc,	%g5,	%i1
	fmovrsgz	%o3,	%f3,	%f12
	tgu	%xcc,	0x4
	tpos	%icc,	0x2
	fbe,a	%fcc0,	loop_1992
	flush	%l7 + 0x1C
	xorcc	%l6,	0x16E7,	%i2
	set	0x7C, %i2
	lduwa	[%l7 + %i2] 0x89,	%i4
loop_1992:
	nop
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x40] %asi,	%o4
	umul	%i0,	%o7,	%g6
	movleu	%xcc,	%o2,	%l0
	te	%icc,	0x5
	edge32ln	%l4,	%i6,	%i7
	brnz	%g7,	loop_1993
	fone	%f14
	array32	%l5,	%i5,	%l1
	set	0x72, %i0
	lduha	[%l7 + %i0] 0x0c,	%i3
loop_1993:
	sdiv	%o1,	0x1EC1,	%l2
	fpmerge	%f9,	%f25,	%f4
	tge	%xcc,	0x7
	movl	%xcc,	%g4,	%g1
	sethi	0x101A,	%g2
	movneg	%icc,	%o0,	%o5
	fnot2	%f12,	%f26
	udivx	%g3,	0x00E4,	%o6
	tg	%xcc,	0x6
	edge8n	%g5,	%i1,	%o3
	edge16	%l6,	%l3,	%i2
	movg	%xcc,	%o4,	%i0
	wr	%g0,	0xe3,	%asi
	stha	%o7,	[%l7 + 0x4A] %asi
	membar	#Sync
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%i4,	%g6
	xor	%o2,	%l4,	%i6
	sth	%i7,	[%l7 + 0x54]
	nop
	set	0x08, %o1
	stx	%g7,	[%l7 + %o1]
	udiv	%l0,	0x008A,	%i5
	ldstub	[%l7 + 0x44],	%l5
	movrlz	%i3,	0x19A,	%l1
	bpos,a,pt	%xcc,	loop_1994
	nop
	fitos	%f7,	%f5
	movvs	%icc,	%l2,	%g4
	ble,pn	%xcc,	loop_1995
loop_1994:
	sth	%o1,	[%l7 + 0x6C]
	movg	%xcc,	%g2,	%g1
	xor	%o5,	%g3,	%o0
loop_1995:
	tvs	%icc,	0x4
	sdivcc	%g5,	0x1DD3,	%o6
	mulscc	%i1,	%o3,	%l6
	edge32ln	%l3,	%o4,	%i0
	srax	%o7,	%i2,	%g6
	subccc	%o2,	0x0504,	%l4
	membar	0x05
	orn	%i4,	%i7,	%i6
	tn	%icc,	0x7
	movne	%xcc,	%g7,	%i5
	udivx	%l0,	0x05B8,	%l5
	fcmpeq16	%f18,	%f8,	%i3
	orn	%l2,	%l1,	%o1
	fmovsvc	%xcc,	%f14,	%f3
	taddcc	%g4,	%g1,	%o5
	nop
	setx	0xD4ED2D161064C185,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	array16	%g2,	%g3,	%o0
	srlx	%o6,	%i1,	%g5
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x24] %asi,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l3,	%o4,	%i0
	movle	%icc,	%l6,	%o7
	edge8n	%g6,	%o2,	%i2
	fmovdg	%icc,	%f24,	%f21
	srl	%l4,	%i4,	%i6
	subc	%i7,	%g7,	%l0
	array16	%l5,	%i5,	%i3
	fbul	%fcc1,	loop_1996
	movre	%l2,	0x0B1,	%l1
	bleu,pt	%xcc,	loop_1997
	nop
	setx	0xCEA0A72341A4FFAB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x55E54E550D7AB2F4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f4,	%f0
loop_1996:
	fmovdpos	%xcc,	%f25,	%f21
	ta	%xcc,	0x2
loop_1997:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2F] %asi,	%o1
	swap	[%l7 + 0x4C],	%g1
	fbu,a	%fcc2,	loop_1998
	fpsub32	%f16,	%f24,	%f4
	srlx	%g4,	0x12,	%g2
	fmovrsgez	%o5,	%f20,	%f28
loop_1998:
	edge8ln	%o0,	%g3,	%i1
	nop
	setx	0x9587B238B1B1459E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD3378275809E2CD8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f28,	%f10
	fmovdn	%xcc,	%f1,	%f28
	fors	%f30,	%f4,	%f10
	set	0x38, %i6
	stha	%g5,	[%l7 + %i6] 0x2a
	membar	#Sync
	edge32	%o3,	%o6,	%l3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i0,	%o4
	nop
	setx	0xDCE415E121920669,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x456575550EB3E422,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f0,	%f26
	movrgez	%o7,	%l6,	%g6
	andcc	%o2,	0x1A53,	%i2
	taddcc	%i4,	0x1F64,	%l4
	movl	%icc,	%i6,	%g7
	taddcctv	%i7,	0x03F6,	%l5
	fpadd16s	%f28,	%f3,	%f18
	ba,pt	%icc,	loop_1999
	fmovspos	%icc,	%f6,	%f19
	ld	[%l7 + 0x08],	%f0
	fba,a	%fcc3,	loop_2000
loop_1999:
	andn	%l0,	0x01A4,	%i3
	ldd	[%l7 + 0x28],	%i4
	orn	%l1,	0x0F3F,	%l2
loop_2000:
	smulcc	%o1,	0x0074,	%g4
	tne	%xcc,	0x5
	tg	%icc,	0x6
	tvs	%icc,	0x7
	edge16	%g1,	%g2,	%o5
	fornot2	%f14,	%f2,	%f12
	ba,a,pn	%xcc,	loop_2001
	nop
	setx	loop_2002,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot1s	%f14,	%f5
	umul	%g3,	%o0,	%g5
loop_2001:
	array16	%i1,	%o6,	%o3
loop_2002:
	smul	%i0,	%l3,	%o7
	fmovscc	%xcc,	%f30,	%f14
	fpadd16	%f18,	%f14,	%f14
	te	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
	fornot2	%f30,	%f4,	%f20
	fors	%f27,	%f25,	%f23
	fpsub32s	%f9,	%f2,	%f14
	tleu	%icc,	0x0
	prefetch	[%l7 + 0x7C],	 0x0
	addcc	%g6,	%o2,	%i2
	xorcc	%i4,	%o4,	%i6
	te	%icc,	0x0
	sir	0x062A
	nop
	set	0x7C, %o2
	ldstub	[%l7 + %o2],	%g7
	fmovdl	%icc,	%f0,	%f20
	set	0x54, %g2
	stwa	%l4,	[%l7 + %g2] 0x2a
	membar	#Sync
	fmovdgu	%icc,	%f8,	%f5
	subccc	%i7,	%l5,	%i3
	edge32ln	%l0,	%l1,	%l2
	xnor	%i5,	0x102F,	%o1
	xor	%g4,	0x079B,	%g1
	fmovsl	%xcc,	%f17,	%f11
	fornot1	%f16,	%f0,	%f14
	fornot2	%f14,	%f14,	%f6
	tpos	%icc,	0x6
	st	%f26,	[%l7 + 0x54]
	subccc	%o5,	0x1A6E,	%g2
	fnegd	%f14,	%f24
	pdist	%f22,	%f0,	%f2
	tneg	%xcc,	0x0
	edge16ln	%g3,	%o0,	%i1
	wr	%g0,	0x19,	%asi
	stxa	%o6,	[%l7 + 0x28] %asi
	bn	loop_2003
	bcc,a,pn	%xcc,	loop_2004
	movrgez	%o3,	0x388,	%i0
	movvs	%xcc,	%g5,	%o7
loop_2003:
	tcc	%xcc,	0x2
loop_2004:
	bcs	loop_2005
	movpos	%xcc,	%l6,	%l3
	edge32ln	%o2,	%i2,	%i4
	addcc	%g6,	0x0A35,	%i6
loop_2005:
	nop
	set	0x30, %o3
	ldxa	[%g0 + %o3] 0x58,	%g7
	stbar
	tg	%icc,	0x5
	sra	%o4,	%i7,	%l5
	fmovrdne	%i3,	%f24,	%f30
	ldd	[%l7 + 0x60],	%l0
	bne,a,pt	%icc,	loop_2006
	fmovsl	%icc,	%f23,	%f0
	subc	%l1,	0x1CA6,	%l4
	movcc	%icc,	%i5,	%o1
loop_2006:
	nop
	setx	0x4064BEDB,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	tcs	%xcc,	0x0
	sllx	%l2,	%g1,	%o5
	fmovdvc	%xcc,	%f31,	%f12
	stb	%g2,	[%l7 + 0x0A]
	movpos	%xcc,	%g4,	%o0
	edge8	%i1,	%o6,	%g3
	set	0x30, %i4
	prefetcha	[%l7 + %i4] 0x80,	 0x1
	movrlz	%o3,	%o7,	%l6
	bcc,a	loop_2007
	fcmpeq32	%f16,	%f6,	%l3
	edge8ln	%o2,	%g5,	%i4
	brlez	%i2,	loop_2008
loop_2007:
	tgu	%icc,	0x2
	fmovrsgz	%g6,	%f15,	%f21
	sllx	%g7,	0x19,	%o4
loop_2008:
	and	%i6,	%l5,	%i3
	move	%xcc,	%i7,	%l1
	movn	%icc,	%l0,	%i5
	fnegs	%f0,	%f14
	tneg	%icc,	0x6
	bleu,pt	%icc,	loop_2009
	tsubcctv	%o1,	%l4,	%l2
	addcc	%o5,	%g1,	%g4
	tpos	%xcc,	0x2
loop_2009:
	taddcc	%g2,	%i1,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x0
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o0
	tcs	%icc,	0x2
	udivcc	%g3,	0x126B,	%o3
	bpos,pn	%icc,	loop_2010
	or	%o7,	0x04E9,	%i0
	fmovrdgz	%l3,	%f2,	%f28
	membar	0x4B
loop_2010:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f13,	%f2,	%f10
	mulx	%o2,	0x0D23,	%g5
	movg	%xcc,	%l6,	%i4
	xnorcc	%i2,	%g6,	%g7
	movgu	%xcc,	%o4,	%i6
	addc	%l5,	0x17D9,	%i7
	fmovrdlz	%l1,	%f8,	%f14
	fbo,a	%fcc3,	loop_2011
	movrlz	%i3,	%l0,	%i5
	set	0x18, %o4
	ldsha	[%l7 + %o4] 0x14,	%o1
loop_2011:
	tvc	%xcc,	0x6
	movvc	%xcc,	%l4,	%l2
	fandnot2s	%f11,	%f6,	%f17
	tsubcctv	%o5,	%g1,	%g4
	mulscc	%i1,	0x1185,	%o6
	alignaddrl	%g2,	%g3,	%o3
	bn	loop_2012
	movrlez	%o7,	%o0,	%i0
	subc	%o2,	0x1DD2,	%l3
	fbn,a	%fcc0,	loop_2013
loop_2012:
	tgu	%xcc,	0x3
	smulcc	%g5,	0x05CD,	%i4
	fsrc2s	%f27,	%f29
loop_2013:
	edge32l	%l6,	%g6,	%g7
	fmovrslz	%i2,	%f19,	%f30
	fmovscs	%xcc,	%f16,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i6,	[%l7 + 0x1C]
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x10] %asi,	%o4
	edge16n	%l5,	%l1,	%i3
	srax	%i7,	%i5,	%l0
	edge16n	%l4,	%l2,	%o5
	smulcc	%g1,	0x0372,	%g4
	and	%o1,	%i1,	%o6
	be,pt	%icc,	loop_2014
	and	%g2,	%o3,	%o7
	stx	%o0,	[%l7 + 0x38]
	smulcc	%i0,	0x0FAA,	%o2
loop_2014:
	fpsub32	%f22,	%f2,	%f4
	movrgz	%g3,	0x126,	%l3
	movpos	%xcc,	%i4,	%g5
	brlez,a	%g6,	loop_2015
	tvs	%xcc,	0x2
	bne,pn	%xcc,	loop_2016
	mulscc	%l6,	%i2,	%i6
loop_2015:
	nop
	setx	loop_2017,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot1s	%f17,	%f24,	%f17
loop_2016:
	sdivx	%g7,	0x1461,	%l5
	sll	%l1,	0x11,	%i3
loop_2017:
	taddcc	%o4,	%i5,	%l0
	tneg	%icc,	0x6
	tcc	%icc,	0x2
	tsubcc	%i7,	0x0428,	%l4
	tvc	%xcc,	0x0
	movleu	%icc,	%l2,	%o5
	mova	%icc,	%g1,	%o1
	fmul8x16au	%f19,	%f17,	%f10
	set	0x50, %l6
	ldstuba	[%l7 + %l6] 0x89,	%i1
	nop
	setx	0xE06A1C6C,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	fmovdcc	%icc,	%f1,	%f4
	brlz	%g4,	loop_2018
	tpos	%xcc,	0x3
	fmovdpos	%icc,	%f25,	%f1
	bge,a,pn	%icc,	loop_2019
loop_2018:
	xorcc	%o6,	0x1120,	%o3
	movg	%xcc,	%o7,	%o0
	array8	%i0,	%g2,	%o2
loop_2019:
	fbge	%fcc3,	loop_2020
	brgz	%l3,	loop_2021
	tcs	%xcc,	0x6
	bvc,a	loop_2022
loop_2020:
	orcc	%i4,	%g3,	%g5
loop_2021:
	movle	%icc,	%l6,	%i2
	fnot2	%f6,	%f0
loop_2022:
	edge8l	%g6,	%i6,	%g7
	movrgez	%l5,	0x19D,	%i3
	tpos	%xcc,	0x5
	and	%l1,	%i5,	%l0
	sdivcc	%o4,	0x1BE6,	%l4
	edge16n	%l2,	%i7,	%g1
	movrlez	%o1,	%o5,	%i1
	xorcc	%o6,	0x0A4C,	%o3
	srl	%g4,	0x0C,	%o7
	fmovscs	%icc,	%f10,	%f29
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x14,	%i0
	sdiv	%o0,	0x00E2,	%o2
	movvc	%icc,	%l3,	%g2
	set	0x20, %l2
	stba	%g3,	[%l7 + %l2] 0x18
	movn	%icc,	%i4,	%l6
	edge32	%g5,	%g6,	%i2
	tvc	%xcc,	0x5
	array8	%g7,	%i6,	%i3
	bgu,a,pn	%icc,	loop_2023
	fsrc1	%f4,	%f24
	addcc	%l5,	%i5,	%l0
	tgu	%xcc,	0x0
loop_2023:
	fornot2s	%f26,	%f18,	%f25
	umulcc	%o4,	%l4,	%l2
	array8	%l1,	%i7,	%g1
	fbe,a	%fcc3,	loop_2024
	fnot2s	%f5,	%f11
	movcc	%icc,	%o5,	%o1
	bg	%icc,	loop_2025
loop_2024:
	movrlz	%o6,	%i1,	%g4
	brnz,a	%o3,	loop_2026
	nop
	fitod	%f13,	%f16
loop_2025:
	sir	0x147B
	udivx	%i0,	0x05E5,	%o0
loop_2026:
	ldx	[%l7 + 0x28],	%o2
	orcc	%l3,	%o7,	%g3
	fors	%f19,	%f12,	%f11
	tvc	%icc,	0x4
	tvs	%xcc,	0x7
	edge16ln	%g2,	%l6,	%g5
	fcmpeq16	%f30,	%f28,	%i4
	ta	%xcc,	0x0
	nop
	setx loop_2027, %l0, %l1
	jmpl %l1, %g6
	or	%i2,	%g7,	%i6
	fmovrsgz	%l5,	%f16,	%f8
	srax	%i3,	0x12,	%i5
loop_2027:
	edge8n	%l0,	%l4,	%o4
	addc	%l2,	0x0D47,	%l1
	fcmpgt32	%f8,	%f0,	%g1
	wr	%g0,	0xe3,	%asi
	stha	%i7,	[%l7 + 0x0A] %asi
	membar	#Sync
	tcc	%icc,	0x0
	edge32	%o5,	%o6,	%o1
	edge16	%i1,	%o3,	%i0
	addccc	%o0,	%g4,	%l3
	nop
	fitos	%f4,	%f8
	fstox	%f8,	%f30
	nop
	setx	0x74FEFDAA9C5DB8F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x88C849736C39B077,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f20,	%f2
	alignaddr	%o2,	%o7,	%g3
	membar	0x72
	ta	%icc,	0x1
	sub	%l6,	%g5,	%g2
	mulx	%g6,	0x17CE,	%i4
	edge16l	%g7,	%i6,	%i2
	nop
	setx	0x5611C69AE068790F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fornot1s	%f30,	%f22,	%f9
	ta	%icc,	0x1
	fba,a	%fcc2,	loop_2028
	movge	%xcc,	%i3,	%l5
	tvc	%icc,	0x1
	sth	%l0,	[%l7 + 0x10]
loop_2028:
	fmovdn	%icc,	%f16,	%f3
	alignaddrl	%i5,	%o4,	%l2
	bpos,pt	%icc,	loop_2029
	bvs	loop_2030
	fxor	%f30,	%f14,	%f12
	tsubcctv	%l1,	%g1,	%l4
loop_2029:
	sethi	0x16F0,	%o5
loop_2030:
	ldsw	[%l7 + 0x34],	%o6
	edge16l	%i7,	%i1,	%o3
	tleu	%xcc,	0x1
	movn	%xcc,	%o1,	%o0
	edge8	%i0,	%g4,	%l3
	ble,a,pt	%xcc,	loop_2031
	fmovse	%icc,	%f13,	%f14
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o2,	%g3,	%o7
loop_2031:
	nop
	setx	loop_2032,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%l6,	0x03A,	%g5
	alignaddrl	%g2,	%i4,	%g7
	edge16l	%g6,	%i6,	%i3
loop_2032:
	udivx	%i2,	0x069D,	%l0
	movrlz	%l5,	0x2F3,	%i5
	mulx	%o4,	0x18A5,	%l1
	edge32l	%l2,	%g1,	%o5
	xnorcc	%o6,	0x0175,	%l4
	movcs	%icc,	%i7,	%o3
	fmovsle	%xcc,	%f5,	%f4
	fabss	%f24,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x9F4CFD31,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xBEB926B1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f30,	%f29
	fpackfix	%f22,	%f2
	be	loop_2033
	edge32l	%i1,	%o0,	%o1
	orn	%g4,	0x1323,	%i0
	movcc	%xcc,	%o2,	%g3
loop_2033:
	nop
	setx	0x9A0382D5A00D9CE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x0193752ABEF0218D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f10,	%f0
	fmovsge	%icc,	%f25,	%f29
	orn	%l3,	0x00E0,	%l6
	bvc	loop_2034
	edge32ln	%o7,	%g2,	%g5
	nop
	setx	loop_2035,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsgu	%icc,	%f21,	%f2
loop_2034:
	sethi	0x1A7E,	%g7
	bcs,a,pt	%icc,	loop_2036
loop_2035:
	srl	%g6,	0x04,	%i4
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i6
loop_2036:
	fpsub32s	%f26,	%f5,	%f16
	bgu,a,pn	%icc,	loop_2037
	tsubcctv	%i2,	%l0,	%i3
	edge8	%l5,	%o4,	%i5
	edge32	%l1,	%g1,	%o5
loop_2037:
	movg	%xcc,	%o6,	%l4
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x24,	%l2
	lduw	[%l7 + 0x18],	%i7
	fpack32	%f24,	%f18,	%f26
	sdivx	%i1,	0x065E,	%o0
	fnot2	%f24,	%f8
	stx	%o1,	[%l7 + 0x40]
	fandnot1s	%f5,	%f5,	%f3
	brgez,a	%o3,	loop_2038
	tn	%icc,	0x3
	mova	%xcc,	%i0,	%g4
	movneg	%xcc,	%o2,	%l3
loop_2038:
	orcc	%g3,	0x1699,	%o7
	fmovs	%f19,	%f27
	fbule,a	%fcc2,	loop_2039
	movcs	%icc,	%g2,	%l6
	nop
	setx	0x00548129,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	udivcc	%g5,	0x19DC,	%g6
loop_2039:
	movneg	%xcc,	%g7,	%i4
	orncc	%i6,	%i2,	%i3
	bneg,pt	%icc,	loop_2040
	andncc	%l0,	%l5,	%o4
	movcc	%xcc,	%i5,	%l1
	fpadd32s	%f21,	%f6,	%f7
loop_2040:
	fpack16	%f28,	%f21
	ta	%xcc,	0x3
	movre	%g1,	%o5,	%o6
	popc	%l2,	%i7
	movleu	%xcc,	%i1,	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l4,	%o3
	smulcc	%o1,	%g4,	%o2
	movl	%icc,	%l3,	%i0
	srl	%g3,	%o7,	%g2
	udiv	%l6,	0x1DF9,	%g6
	fnands	%f13,	%f26,	%f8
	tvc	%icc,	0x1
	subc	%g5,	0x1ED9,	%i4
	te	%xcc,	0x2
	movrgez	%g7,	%i6,	%i2
	andncc	%i3,	%l0,	%o4
	ta	%xcc,	0x0
	fbule,a	%fcc0,	loop_2041
	tsubcctv	%i5,	0x0505,	%l5
	fmovsg	%icc,	%f12,	%f25
	lduw	[%l7 + 0x60],	%g1
loop_2041:
	movrgez	%l1,	0x0EC,	%o5
	fabsd	%f0,	%f28
	movgu	%xcc,	%l2,	%i7
	bcs	loop_2042
	andcc	%i1,	%o0,	%o6
	fbge	%fcc3,	loop_2043
	brlez	%o3,	loop_2044
loop_2042:
	ld	[%l7 + 0x1C],	%f28
	popc	0x0FA5,	%l4
loop_2043:
	movle	%icc,	%g4,	%o2
loop_2044:
	edge32n	%l3,	%i0,	%o1
	set	0x48, %o0
	ldsha	[%l7 + %o0] 0x81,	%g3
	fbo,a	%fcc1,	loop_2045
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%xcc,	%f19,	%f22
	fbl	%fcc3,	loop_2046
loop_2045:
	movle	%icc,	%g2,	%l6
	movgu	%icc,	%o7,	%g6
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x57] %asi,	%i4
loop_2046:
	fmovsle	%xcc,	%f21,	%f15
	tsubcc	%g5,	%i6,	%g7
	orn	%i3,	0x19CC,	%l0
	tpos	%icc,	0x5
	sllx	%i2,	%i5,	%l5
	movgu	%xcc,	%o4,	%l1
	fbo	%fcc1,	loop_2047
	movrne	%o5,	%l2,	%g1
	std	%f24,	[%l7 + 0x20]
	srl	%i1,	0x1E,	%i7
loop_2047:
	xnorcc	%o6,	%o3,	%o0
	fmovdg	%xcc,	%f3,	%f31
	tge	%icc,	0x0
	or	%g4,	%o2,	%l3
	bshuffle	%f2,	%f16,	%f2
	andcc	%i0,	0x1A53,	%l4
	bcs,pt	%xcc,	loop_2048
	fmovrdgz	%o1,	%f24,	%f26
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
loop_2048:
	movcs	%icc,	%g2,	%o7
	membar	0x51
	ldd	[%l7 + 0x78],	%g6
	fmovdn	%icc,	%f1,	%f31
	fcmple32	%f22,	%f2,	%i4
	fmul8x16al	%f20,	%f6,	%f10
	edge32ln	%l6,	%g5,	%i6
	smul	%i3,	%g7,	%i2
	fmovdneg	%xcc,	%f26,	%f14
	brz	%i5,	loop_2049
	smulcc	%l5,	%l0,	%l1
	sub	%o5,	%o4,	%g1
	fbe	%fcc0,	loop_2050
loop_2049:
	sub	%l2,	0x180D,	%i7
	smulcc	%i1,	%o3,	%o6
	edge32n	%g4,	%o2,	%o0
loop_2050:
	sll	%l3,	%l4,	%i0
	xorcc	%o1,	0x04EE,	%g3
	fmovrslz	%g2,	%f8,	%f22
	bge	%xcc,	loop_2051
	nop
	set	0x3C, %o5
	ldstub	[%l7 + %o5],	%g6
	movpos	%xcc,	%i4,	%o7
	udiv	%g5,	0x1AE5,	%i6
loop_2051:
	ldsh	[%l7 + 0x72],	%i3
	lduh	[%l7 + 0x64],	%g7
	nop
	set	0x50, %l3
	stw	%i2,	[%l7 + %l3]
	edge16n	%l6,	%i5,	%l5
	fmovde	%icc,	%f28,	%f29
	movrlz	%l0,	0x23D,	%o5
	tleu	%xcc,	0x0
	fmovse	%icc,	%f15,	%f24
	andn	%l1,	0x1247,	%g1
	srax	%o4,	0x06,	%i7
	fblg	%fcc0,	loop_2052
	srax	%l2,	0x0A,	%o3
	smulcc	%o6,	0x11D2,	%i1
	tg	%icc,	0x3
loop_2052:
	stbar
	movl	%xcc,	%o2,	%g4
	and	%l3,	0x16E4,	%o0
	nop
	setx loop_2053, %l0, %l1
	jmpl %l1, %i0
	movge	%icc,	%o1,	%g3
	srlx	%g2,	%g6,	%i4
	fmovsgu	%xcc,	%f25,	%f0
loop_2053:
	add	%o7,	%g5,	%i6
	orn	%i3,	%g7,	%i2
	and	%l4,	%l6,	%i5
	fmovsleu	%xcc,	%f18,	%f24
	movrgz	%l0,	%o5,	%l5
	fones	%f3
	fmul8sux16	%f30,	%f2,	%f10
	addcc	%l1,	0x17EA,	%g1
	set	0x5F, %g4
	lduba	[%l7 + %g4] 0x81,	%o4
	fnot1s	%f15,	%f31
	nop
	setx	loop_2054,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcctv	%i7,	0x11F4,	%l2
	edge8ln	%o6,	%i1,	%o3
	subcc	%o2,	%g4,	%o0
loop_2054:
	edge32	%i0,	%l3,	%o1
	movgu	%icc,	%g3,	%g6
	tvc	%xcc,	0x2
	movvc	%icc,	%i4,	%o7
	tg	%icc,	0x7
	fmovrse	%g5,	%f14,	%f23
	udivcc	%g2,	0x1079,	%i3
	stx	%i6,	[%l7 + 0x78]
	fbne	%fcc0,	loop_2055
	mova	%xcc,	%g7,	%l4
	fmovdge	%icc,	%f31,	%f21
	movrgz	%l6,	%i2,	%l0
loop_2055:
	movre	%o5,	0x2CB,	%l5
	sdivx	%i5,	0x0D16,	%l1
	bpos,a	%xcc,	loop_2056
	alignaddr	%o4,	%g1,	%i7
	nop
	setx loop_2057, %l0, %l1
	jmpl %l1, %l2
	fmovrsne	%o6,	%f14,	%f8
loop_2056:
	fmul8x16	%f16,	%f14,	%f20
	edge16	%i1,	%o3,	%g4
loop_2057:
	movrlez	%o0,	%o2,	%l3
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x04,	%o1,	%g3
	lduw	[%l7 + 0x6C],	%g6
	nop
	setx	0x4D5A66CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f20
	fpadd16	%f2,	%f12,	%f18
	fcmpgt16	%f30,	%f0,	%i4
	movre	%i0,	%g5,	%o7
	tleu	%xcc,	0x0
	set	0x4F, %i7
	ldsba	[%l7 + %i7] 0x10,	%i3
	movrgez	%i6,	%g7,	%g2
	fmovrdgz	%l6,	%f30,	%f6
	udivcc	%l4,	0x0C9A,	%l0
	tleu	%xcc,	0x3
	movre	%i2,	%o5,	%l5
	srlx	%i5,	0x00,	%o4
	brnz,a	%l1,	loop_2058
	popc	%g1,	%l2
	set	0x30, %i5
	stxa	%i7,	[%l7 + %i5] 0x11
loop_2058:
	subcc	%i1,	0x0F6A,	%o3
	array8	%g4,	%o0,	%o2
	fnegd	%f22,	%f16
	nop
	setx	loop_2059,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x54
	array8	%l3,	%o6,	%g3
	bcc	loop_2060
loop_2059:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a,pn	%icc,	loop_2061
	movrlez	%o1,	0x05B,	%g6
loop_2060:
	andcc	%i0,	%i4,	%o7
	subcc	%g5,	%i6,	%g7
loop_2061:
	movrgz	%i3,	%g2,	%l6
	fmul8x16	%f14,	%f18,	%f10
	sir	0x1516
	fpadd16s	%f28,	%f20,	%f14
	array32	%l0,	%l4,	%i2
	tl	%xcc,	0x6
	sdiv	%l5,	0x0469,	%o5
	nop
	set	0x10, %l0
	lduw	[%l7 + %l0],	%i5
	movn	%xcc,	%o4,	%g1
	tl	%icc,	0x1
	tge	%xcc,	0x7
	edge32	%l2,	%i7,	%l1
	movn	%icc,	%i1,	%o3
	tn	%icc,	0x1
	set	0x38, %o7
	lduha	[%l7 + %o7] 0x11,	%g4
	fmovrdgz	%o0,	%f0,	%f30
	fpack32	%f22,	%f0,	%f18
	xnor	%o2,	%l3,	%g3
	movvs	%icc,	%o1,	%o6
	fbg,a	%fcc1,	loop_2062
	movrne	%g6,	0x2C0,	%i4
	nop
	setx	0xB1E26ACED0496B37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	lduh	[%l7 + 0x2A],	%i0
loop_2062:
	bgu,a,pt	%icc,	loop_2063
	udivcc	%g5,	0x1B45,	%o7
	fbge,a	%fcc0,	loop_2064
	faligndata	%f24,	%f22,	%f6
loop_2063:
	fbug,a	%fcc3,	loop_2065
	movne	%xcc,	%g7,	%i3
loop_2064:
	movne	%xcc,	%i6,	%l6
	edge16ln	%g2,	%l0,	%i2
loop_2065:
	movleu	%xcc,	%l4,	%l5
	andncc	%i5,	%o5,	%g1
	fblg,a	%fcc1,	loop_2066
	alignaddrl	%l2,	%o4,	%l1
	orn	%i1,	%o3,	%i7
	lduw	[%l7 + 0x74],	%g4
loop_2066:
	tgu	%icc,	0x0
	membar	0x30
	array32	%o0,	%o2,	%l3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x74] %asi,	%f8
	tn	%icc,	0x3
	fmovrse	%g3,	%f9,	%f18
	tn	%icc,	0x5
	sll	%o6,	%g6,	%i4
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f30
	fmovsl	%xcc,	%f22,	%f3
	movn	%icc,	%i0,	%o1
	fmovdne	%xcc,	%f0,	%f11
	fmovrdgez	%o7,	%f2,	%f18
	brnz	%g5,	loop_2067
	fcmpeq32	%f22,	%f26,	%g7
	bn,a,pn	%xcc,	loop_2068
	fsrc1s	%f28,	%f14
loop_2067:
	tvc	%icc,	0x6
	bleu,a	%xcc,	loop_2069
loop_2068:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%i3,	%i6,	%g2
	fmovsgu	%xcc,	%f25,	%f5
loop_2069:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%l0
	and	%l6,	%l4,	%i2
	tleu	%xcc,	0x3
	mova	%xcc,	%l5,	%i5
	for	%f22,	%f20,	%f20
	brgz,a	%g1,	loop_2070
	fpmerge	%f3,	%f8,	%f14
	fmul8x16al	%f10,	%f18,	%f22
	fmovrsgez	%o5,	%f1,	%f7
loop_2070:
	edge16	%o4,	%l1,	%i1
	movvs	%xcc,	%l2,	%i7
	tg	%icc,	0x0
	fsrc2	%f6,	%f20
	tl	%icc,	0x5
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f24
	fxtod	%f24,	%f20
	brz,a	%g4,	loop_2071
	movvc	%xcc,	%o0,	%o2
	ldstub	[%l7 + 0x7B],	%l3
	bpos,a	%xcc,	loop_2072
loop_2071:
	or	%g3,	0x064A,	%o6
	fnot1	%f4,	%f20
	mulscc	%o3,	%g6,	%i0
loop_2072:
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%f30
	call	loop_2073
	taddcc	%o1,	0x15D9,	%i4
	fmovdleu	%icc,	%f17,	%f23
	tvc	%icc,	0x6
loop_2073:
	nop
	set	0x30, %g1
	ldswa	[%l7 + %g1] 0x10,	%g5
	tleu	%icc,	0x0
	movn	%icc,	%o7,	%i3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	tpos	%icc,	0x5
	andncc	%g2,	%l0,	%i6
	and	%l4,	0x1A61,	%l6
	fmovdn	%icc,	%f28,	%f24
	tsubcctv	%i2,	%i5,	%g1
	movcs	%xcc,	%l5,	%o5
	edge8ln	%l1,	%o4,	%l2
	fbo	%fcc2,	loop_2074
	orcc	%i1,	%g4,	%i7
	movvc	%icc,	%o2,	%l3
	edge8l	%g3,	%o0,	%o6
loop_2074:
	brgez,a	%g6,	loop_2075
	movvc	%xcc,	%i0,	%o1
	stb	%o3,	[%l7 + 0x31]
	fmovrdlz	%g5,	%f10,	%f26
loop_2075:
	ldsb	[%l7 + 0x47],	%i4
	nop
	setx	loop_2076,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	popc	0x120F,	%o7
	ld	[%l7 + 0x18],	%f15
	movcs	%xcc,	%g7,	%i3
loop_2076:
	umulcc	%g2,	0x1EE3,	%i6
	fbule	%fcc3,	loop_2077
	fnands	%f21,	%f17,	%f9
	tvc	%xcc,	0x6
	brgz,a	%l0,	loop_2078
loop_2077:
	bgu	%xcc,	loop_2079
	mulx	%l4,	%l6,	%i5
	fnegs	%f10,	%f23
loop_2078:
	addc	%g1,	%i2,	%l5
loop_2079:
	fcmple32	%f2,	%f26,	%o5
	fbue	%fcc0,	loop_2080
	sir	0x059B
	bge,a,pt	%xcc,	loop_2081
	bgu,pt	%icc,	loop_2082
loop_2080:
	tpos	%xcc,	0x3
	movge	%xcc,	%o4,	%l2
loop_2081:
	edge16n	%i1,	%g4,	%l1
loop_2082:
	add	%i7,	0x112D,	%l3
	tvc	%xcc,	0x6
	sethi	0x0DD0,	%o2
	subccc	%g3,	%o0,	%o6
	fexpand	%f27,	%f8
	orncc	%g6,	0x1C92,	%o1
	movrne	%o3,	0x31B,	%g5
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x26] %asi,	%i4
	xorcc	%i0,	%g7,	%i3
	array16	%g2,	%o7,	%l0
	umulcc	%i6,	%l4,	%i5
	sdivcc	%l6,	0x1040,	%g1
	bne,a,pn	%xcc,	loop_2083
	xorcc	%i2,	%l5,	%o5
	tne	%icc,	0x3
	edge16n	%l2,	%o4,	%i1
loop_2083:
	andcc	%l1,	%g4,	%l3
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
	brlz,a	%g3,	loop_2084
	nop
	fitod	%f8,	%f4
	fdtos	%f4,	%f27
	fandnot1s	%f15,	%f5,	%f24
	fbne,a	%fcc2,	loop_2085
loop_2084:
	fbe,a	%fcc1,	loop_2086
	udivx	%o2,	0x164D,	%o0
	bcs,pt	%icc,	loop_2087
loop_2085:
	movrne	%o6,	%g6,	%o1
loop_2086:
	tgu	%icc,	0x7
	fbug,a	%fcc0,	loop_2088
loop_2087:
	sethi	0x1DEA,	%g5
	xnor	%o3,	%i4,	%g7
	xnor	%i3,	%i0,	%g2
loop_2088:
	xnorcc	%l0,	0x0CD4,	%o7
	ldsw	[%l7 + 0x20],	%l4
	set	0x68, %g3
	ldsha	[%l7 + %g3] 0x18,	%i6
	bne,pn	%xcc,	loop_2089
	movre	%l6,	0x259,	%i5
	fmovdvc	%icc,	%f2,	%f4
	fmul8sux16	%f14,	%f30,	%f30
loop_2089:
	smul	%g1,	%l5,	%i2
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o5
	fmovscc	%icc,	%f9,	%f10
	udivx	%l2,	0x1486,	%i1
	set	0x18, %l5
	prefetcha	[%l7 + %l5] 0x15,	 0x2
	bleu	%icc,	loop_2090
	xnor	%g4,	0x0CE0,	%o4
	fmovdcc	%icc,	%f18,	%f6
	edge8	%l3,	%i7,	%o2
loop_2090:
	move	%xcc,	%g3,	%o6
	mulx	%o0,	0x0180,	%g6
	fcmpeq16	%f2,	%f28,	%o1
	ld	[%l7 + 0x2C],	%f9
	addccc	%o3,	%g5,	%i4
	fzeros	%f0
	fpack32	%f6,	%f16,	%f24
	edge16l	%g7,	%i3,	%i0
	fmovsa	%icc,	%f18,	%f11
	xor	%l0,	0x1C0A,	%g2
	nop
	fitos	%f10,	%f2
	fstoi	%f2,	%f26
	te	%icc,	0x7
	smul	%o7,	0x11B5,	%i6
	set	0x110, %o6
	ldxa	[%g0 + %o6] 0x21,	%l4
	movleu	%icc,	%l6,	%i5
	smul	%g1,	%l5,	%i2
	nop
	fitos	%f12,	%f18
	fstod	%f18,	%f30
	bshuffle	%f6,	%f0,	%f28
	bl,pn	%xcc,	loop_2091
	movrlz	%o5,	%i1,	%l2
	udivx	%g4,	0x088F,	%l1
	fmovsleu	%icc,	%f27,	%f13
loop_2091:
	nop
	set	0x1C, %i1
	lduw	[%l7 + %i1],	%l3
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i7
	bn,pn	%xcc,	loop_2092
	fmuld8ulx16	%f17,	%f31,	%f26
	ld	[%l7 + 0x10],	%f11
	tle	%xcc,	0x5
loop_2092:
	fbne,a	%fcc2,	loop_2093
	nop
	setx	0xD79A293BA4E31880,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xA553FF87B8454645,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f20,	%f10
	sra	%o2,	%o4,	%g3
	alignaddr	%o0,	%g6,	%o1
loop_2093:
	nop
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0xf1,	%f16
	ba,pn	%icc,	loop_2094
	subccc	%o6,	0x003E,	%o3
	sdivx	%g5,	0x141A,	%g7
	nop
	fitos	%f26,	%f5
loop_2094:
	movn	%xcc,	%i4,	%i3
	edge8n	%l0,	%i0,	%g2
	fmul8ulx16	%f20,	%f0,	%f2
	addcc	%o7,	0x0FEA,	%i6
	udivcc	%l4,	0x19BA,	%i5
	fornot2	%f24,	%f2,	%f28
	movcs	%xcc,	%l6,	%g1
	nop
	setx	loop_2095,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x6
	fmovspos	%xcc,	%f23,	%f29
	array32	%i2,	%o5,	%i1
loop_2095:
	bpos,a,pt	%xcc,	loop_2096
	fbue	%fcc2,	loop_2097
	srlx	%l5,	%l2,	%l1
	bl	%icc,	loop_2098
loop_2096:
	fbul,a	%fcc1,	loop_2099
loop_2097:
	fpackfix	%f4,	%f31
	orncc	%g4,	0x1553,	%i7
loop_2098:
	movrne	%l3,	0x0FD,	%o4
loop_2099:
	subccc	%o2,	0x0A29,	%g3
	wr	%g0,	0x81,	%asi
	stha	%o0,	[%l7 + 0x44] %asi
	edge8ln	%o1,	%o6,	%g6
	tg	%xcc,	0x4
	sdivx	%g5,	0x0CF3,	%o3
	fexpand	%f1,	%f14
	fmovsvs	%icc,	%f12,	%f21
	tge	%xcc,	0x6
	fornot2s	%f11,	%f3,	%f5
	array8	%i4,	%g7,	%i3
	edge8ln	%i0,	%g2,	%l0
	orn	%i6,	0x07A5,	%l4
	fandnot2s	%f1,	%f0,	%f24
	movrgez	%i5,	0x3E6,	%o7
	fmovsne	%xcc,	%f21,	%f31
	ta	%icc,	0x5
	fmovscc	%xcc,	%f3,	%f24
	bneg	loop_2100
	tne	%xcc,	0x3
	ta	%icc,	0x5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x10] %asi,	%g0
loop_2100:
	fbg,a	%fcc3,	loop_2101
	srax	%i2,	0x18,	%o5
	movcs	%icc,	%l6,	%i1
	alignaddrl	%l2,	%l1,	%l5
loop_2101:
	ta	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	stwa	%i7,	[%l7 + 0x28] %asi
	edge16ln	%l3,	%o4,	%g4
	fzero	%f6
	movrgez	%o2,	0x149,	%o0
	subcc	%g3,	%o1,	%g6
	tsubcc	%g5,	0x08AC,	%o3
	nop
	setx	loop_2102,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32l	%i4,	%g7,	%i3
	fmovs	%f13,	%f9
	sdivcc	%i0,	0x08D8,	%o6
loop_2102:
	fbl,a	%fcc0,	loop_2103
	array32	%l0,	%g2,	%i6
	tcs	%icc,	0x1
	tcc	%icc,	0x2
loop_2103:
	ld	[%l7 + 0x3C],	%f8
	udivx	%i5,	0x1984,	%o7
	and	%l4,	%i2,	%g1
	fsrc1	%f14,	%f22
	ta	%xcc,	0x6
	movneg	%xcc,	%l6,	%o5
	bg	loop_2104
	movrgz	%i1,	%l2,	%l1
	andncc	%i7,	%l3,	%l5
	xnor	%o4,	%o2,	%g4
loop_2104:
	ble,a,pn	%xcc,	loop_2105
	movrne	%o0,	0x1CD,	%g3
	movle	%icc,	%o1,	%g6
	fmovrsne	%o3,	%f5,	%f31
loop_2105:
	and	%g5,	0x09C1,	%g7
	fnegs	%f22,	%f30
	fsrc1	%f0,	%f14
	fpadd32	%f22,	%f8,	%f2
	fmovdleu	%icc,	%f15,	%f31
	fornot1	%f22,	%f10,	%f24
	movn	%icc,	%i4,	%i3
	fmovsleu	%icc,	%f26,	%f25
	fbug	%fcc1,	loop_2106
	movneg	%icc,	%i0,	%l0
	tne	%xcc,	0x6
	xor	%o6,	0x0835,	%i6
loop_2106:
	movvs	%icc,	%g2,	%i5
	ble,a	loop_2107
	movcs	%xcc,	%l4,	%i2
	tvs	%icc,	0x4
	nop
	setx	0x17D64638,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x61EA5ACB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f21,	%f9
loop_2107:
	sll	%o7,	%g1,	%o5
	fmovdle	%icc,	%f21,	%f9
	fnegd	%f10,	%f8
	array8	%i1,	%l6,	%l2
	popc	%i7,	%l1
	fpadd16s	%f17,	%f26,	%f11
	sll	%l5,	0x1D,	%o4
	add	%l3,	0x00FB,	%g4
	fmovsvs	%xcc,	%f14,	%f22
	and	%o2,	%g3,	%o0
	fmovrdlez	%o1,	%f28,	%f24
	fmovsne	%icc,	%f6,	%f17
	tle	%xcc,	0x2
	sdiv	%g6,	0x0EAD,	%g5
	edge8l	%o3,	%g7,	%i4
	fmovs	%f11,	%f0
	sdivx	%i3,	0x0070,	%l0
	bneg,pt	%xcc,	loop_2108
	fmovrslez	%o6,	%f21,	%f10
	fnot1s	%f16,	%f7
	movrlz	%i6,	%i0,	%g2
loop_2108:
	fmovdg	%xcc,	%f0,	%f14
	or	%l4,	0x0CCC,	%i2
	movleu	%icc,	%o7,	%g1
	nop
	setx	0xA0656461,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	edge16	%o5,	%i5,	%l6
	ba,pt	%xcc,	loop_2109
	mova	%icc,	%i1,	%i7
	set	0x48, %g5
	lda	[%l7 + %g5] 0x19,	%f22
loop_2109:
	edge32l	%l1,	%l2,	%l5
	ba,a	loop_2110
	fmovrdgz	%l3,	%f14,	%f14
	bvs,pn	%xcc,	loop_2111
	fandnot2	%f8,	%f22,	%f20
loop_2110:
	fmovsvc	%xcc,	%f20,	%f24
	smul	%g4,	%o2,	%o4
loop_2111:
	subc	%g3,	0x0F49,	%o0
	edge16	%g6,	%g5,	%o1
	taddcctv	%o3,	0x07FB,	%g7
	fpadd32s	%f23,	%f13,	%f10
	set	0x68, %i3
	sta	%f30,	[%l7 + %i3] 0x10
	fpackfix	%f16,	%f10
	brlez	%i3,	loop_2112
	tpos	%xcc,	0x5
	fbul,a	%fcc3,	loop_2113
	orn	%l0,	0x0015,	%i4
loop_2112:
	tcc	%xcc,	0x4
	movge	%icc,	%o6,	%i0
loop_2113:
	call	loop_2114
	array8	%g2,	%l4,	%i2
	bne,a,pn	%xcc,	loop_2115
	sethi	0x1150,	%i6
loop_2114:
	smul	%o7,	%g1,	%i5
	nop
	fitod	%f6,	%f28
	fdtox	%f28,	%f12
loop_2115:
	fpsub32	%f8,	%f18,	%f26
	xorcc	%l6,	%i1,	%o5
	smul	%i7,	%l1,	%l5
	fmovrslez	%l2,	%f5,	%f10
	ldub	[%l7 + 0x7A],	%l3
	fbl,a	%fcc3,	loop_2116
	movrlez	%o2,	%o4,	%g3
	ld	[%l7 + 0x74],	%f30
	ldd	[%l7 + 0x18],	%f6
loop_2116:
	nop
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	sub	%o0,	%g4,	%g5
	sir	0x1C31
	movg	%xcc,	%o1,	%g6
	bg,a,pn	%icc,	loop_2117
	fzero	%f20
	fbug	%fcc1,	loop_2118
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
loop_2117:
	movrgz	%g7,	%o3,	%i3
	fmovde	%xcc,	%f19,	%f8
loop_2118:
	srlx	%i4,	0x02,	%l0
loop_2119:
	fbn	%fcc1,	loop_2120
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%i0
	addccc	%g2,	%l4,	%i2
	fmovdge	%xcc,	%f14,	%f11
loop_2120:
	fmovsne	%icc,	%f26,	%f9
	sdiv	%o6,	0x1656,	%o7
	udivcc	%g1,	0x11E8,	%i6
	tge	%icc,	0x1
	be,a	loop_2121
	bge,a,pt	%xcc,	loop_2122
	fpack32	%f20,	%f8,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2121:
	orcc	%i5,	0x154B,	%i1
loop_2122:
	addccc	%l6,	%i7,	%o5
	orcc	%l5,	%l2,	%l1
	tne	%icc,	0x2
	addc	%l3,	0x0CF1,	%o4
	tcs	%xcc,	0x0
	movcc	%icc,	%o2,	%o0
	fmovscc	%icc,	%f8,	%f19
	bg	loop_2123
	fmovdn	%xcc,	%f28,	%f13
	fandnot1s	%f0,	%f5,	%f14
	movvc	%xcc,	%g4,	%g3
loop_2123:
	movrlz	%o1,	%g5,	%g6
	tl	%icc,	0x0
	set	0x58, %o1
	ldstuba	[%l7 + %o1] 0x0c,	%g7
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x08] %asi,	%i3
	movge	%xcc,	%i4,	%l0
	mova	%xcc,	%i0,	%o3
	fbue,a	%fcc1,	loop_2124
	xnor	%g2,	0x00BB,	%l4
	brgez,a	%i2,	loop_2125
	stw	%o6,	[%l7 + 0x68]
loop_2124:
	edge32n	%g1,	%i6,	%o7
	edge32n	%i1,	%i5,	%i7
loop_2125:
	bshuffle	%f2,	%f22,	%f0
	sdivcc	%l6,	0x1B5C,	%o5
	edge8	%l2,	%l1,	%l3
	fexpand	%f21,	%f4
	movl	%xcc,	%o4,	%o2
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x2b,	%asi
	stha	%o0,	[%l7 + 0x70] %asi
	membar	#Sync
	nop
	setx	loop_2126,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ld	[%l7 + 0x30],	%f1
	fmovdne	%icc,	%f27,	%f0
	fmovdg	%icc,	%f12,	%f16
loop_2126:
	fones	%f1
	subcc	%g4,	%g3,	%l5
	brnz,a	%o1,	loop_2127
	movvs	%icc,	%g5,	%g6
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f6
	fbe	%fcc3,	loop_2128
loop_2127:
	fmovscs	%xcc,	%f7,	%f6
	fcmpne32	%f8,	%f6,	%g7
	sllx	%i4,	0x12,	%l0
loop_2128:
	ta	%icc,	0x5
	bne	%icc,	loop_2129
	fpadd16s	%f4,	%f17,	%f2
	bcs,pn	%icc,	loop_2130
	movvs	%icc,	%i0,	%i3
loop_2129:
	nop
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2130:
	array16	%g2,	%l4,	%i2
	smulcc	%o3,	%g1,	%o6
	tgu	%icc,	0x2
	subccc	%o7,	0x066D,	%i6
	bl,pt	%xcc,	loop_2131
	fbo,a	%fcc3,	loop_2132
	fpackfix	%f26,	%f28
	sth	%i1,	[%l7 + 0x74]
loop_2131:
	edge16	%i5,	%l6,	%o5
loop_2132:
	nop
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%i7,	%l1
	tcc	%icc,	0x5
	movre	%l2,	0x314,	%o4
	nop
	setx	loop_2133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpne32	%f20,	%f6,	%l3
	srl	%o0,	0x18,	%g4
	movge	%icc,	%o2,	%g3
loop_2133:
	bpos	%icc,	loop_2134
	sra	%o1,	%l5,	%g6
	call	loop_2135
	srlx	%g5,	%i4,	%l0
loop_2134:
	fmovda	%icc,	%f2,	%f4
	fbn	%fcc1,	loop_2136
loop_2135:
	bg,a	loop_2137
	fbul,a	%fcc3,	loop_2138
	umul	%g7,	%i0,	%g2
loop_2136:
	movre	%l4,	0x0BB,	%i2
loop_2137:
	movre	%i3,	0x0F7,	%g1
loop_2138:
	array8	%o3,	%o6,	%i6
	bshuffle	%f24,	%f20,	%f4
	set	0x5C, %i6
	stwa	%o7,	[%l7 + %i6] 0xe2
	membar	#Sync
	tsubcctv	%i5,	0x11FF,	%l6
	udivx	%i1,	0x1485,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f6,	%f31
	edge32n	%l1,	%l2,	%o4
	tleu	%icc,	0x7
	edge16	%l3,	%o0,	%i7
	tle	%xcc,	0x0
	movl	%xcc,	%o2,	%g4
	tneg	%xcc,	0x2
	set	0x0B, %i0
	stba	%g3,	[%l7 + %i0] 0x14
	brgz,a	%l5,	loop_2139
	ldd	[%l7 + 0x40],	%f8
	fmovsleu	%xcc,	%f2,	%f10
	edge8n	%g6,	%g5,	%i4
loop_2139:
	fmovscs	%icc,	%f17,	%f27
	fxors	%f6,	%f31,	%f7
	array32	%o1,	%g7,	%i0
	nop
	fitos	%f14,	%f29
	fstox	%f29,	%f8
	fxtos	%f8,	%f25
	sethi	0x13ED,	%g2
	array32	%l4,	%i2,	%l0
	movrne	%g1,	%o3,	%o6
	srl	%i3,	0x0E,	%i6
	edge16n	%o7,	%i5,	%i1
	edge8n	%o5,	%l1,	%l2
	fmovd	%f12,	%f0
	movle	%xcc,	%o4,	%l6
	fblg	%fcc2,	loop_2140
	edge8	%o0,	%l3,	%o2
	call	loop_2141
	tgu	%xcc,	0x4
loop_2140:
	nop
	fitos	%f9,	%f25
	fstod	%f25,	%f20
	bvs	%icc,	loop_2142
loop_2141:
	tle	%icc,	0x0
	srlx	%i7,	0x12,	%g3
	tvs	%xcc,	0x6
loop_2142:
	tvs	%icc,	0x3
	faligndata	%f26,	%f30,	%f6
	tl	%icc,	0x5
	sethi	0x1984,	%g4
	fmovrdgz	%l5,	%f28,	%f8
	bshuffle	%f16,	%f22,	%f26
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x18,	%f0
	fornot1s	%f19,	%f16,	%f18
	membar	0x78
	fmovdge	%icc,	%f17,	%f11
	alignaddr	%g5,	%g6,	%o1
	movleu	%xcc,	%i4,	%i0
	bgu,a	loop_2143
	tvs	%icc,	0x3
	sethi	0x1581,	%g7
	bcs,a	loop_2144
loop_2143:
	mulscc	%l4,	0x0042,	%i2
	ldd	[%l7 + 0x28],	%l0
	srax	%g1,	0x15,	%g2
loop_2144:
	movge	%xcc,	%o6,	%i3
	and	%o3,	0x0076,	%o7
	udiv	%i5,	0x1DE2,	%i1
	addc	%o5,	%l1,	%l2
	edge16l	%i6,	%l6,	%o4
	umulcc	%o0,	%o2,	%l3
	fone	%f22
	set	0x74, %o3
	ldswa	[%l7 + %o3] 0x15,	%g3
	mulscc	%g4,	%l5,	%g5
	ldx	[%l7 + 0x18],	%g6
	udivx	%o1,	0x04FC,	%i7
	fand	%f20,	%f2,	%f14
	stb	%i4,	[%l7 + 0x4A]
	tvs	%xcc,	0x4
	fmovscs	%icc,	%f23,	%f23
	fmovdleu	%xcc,	%f15,	%f30
	udivx	%i0,	0x0970,	%g7
	tg	%xcc,	0x4
	fbge,a	%fcc3,	loop_2145
	movrne	%l4,	%l0,	%g1
	ta	%xcc,	0x6
	umulcc	%g2,	%i2,	%o6
loop_2145:
	ldsw	[%l7 + 0x70],	%i3
	tvs	%icc,	0x1
	bgu	%icc,	loop_2146
	xor	%o3,	%o7,	%i5
	fnegd	%f28,	%f8
	movle	%icc,	%o5,	%i1
loop_2146:
	tn	%xcc,	0x4
	bvs	loop_2147
	nop
	setx	0x7F34FC144065BF0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fmovsleu	%xcc,	%f19,	%f9
	fxor	%f24,	%f20,	%f22
loop_2147:
	fmuld8sux16	%f27,	%f9,	%f6
	fbe,a	%fcc3,	loop_2148
	fmovsl	%icc,	%f12,	%f24
	taddcc	%l1,	0x1ADA,	%i6
	movvs	%xcc,	%l2,	%l6
loop_2148:
	bvc,pt	%icc,	loop_2149
	edge8n	%o4,	%o0,	%o2
	fornot1s	%f9,	%f24,	%f18
	umulcc	%g3,	%l3,	%g4
loop_2149:
	andcc	%l5,	%g5,	%g6
	tle	%xcc,	0x2
	udiv	%i7,	0x0825,	%i4
	fone	%f24
	edge8ln	%o1,	%i0,	%g7
	alignaddrl	%l4,	%g1,	%g2
	addc	%l0,	%o6,	%i2
	movcc	%icc,	%o3,	%o7
	mova	%icc,	%i3,	%i5
	umul	%i1,	%o5,	%l1
	fornot1s	%f0,	%f18,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i6,	%l6
	movre	%l2,	0x17D,	%o4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o2,	%g3
	fzero	%f20
	tg	%xcc,	0x0
	edge16n	%l3,	%g4,	%o0
	movl	%xcc,	%g5,	%l5
	sll	%i7,	%g6,	%i4
	bcc	loop_2150
	tcs	%xcc,	0x1
	movge	%icc,	%i0,	%g7
	fsrc2s	%f23,	%f13
loop_2150:
	membar	0x46
	brlez	%o1,	loop_2151
	smul	%g1,	0x1A35,	%g2
	brnz	%l4,	loop_2152
	nop
	set	0x4D, %g2
	ldsb	[%l7 + %g2],	%l0
loop_2151:
	sdivx	%i2,	0x0AB5,	%o6
	fmovrdne	%o7,	%f10,	%f24
loop_2152:
	addcc	%o3,	%i5,	%i3
	andncc	%i1,	%l1,	%o5
	umul	%i6,	%l6,	%o4
	fmovrslz	%o2,	%f19,	%f7
	bcc	%icc,	loop_2153
	sdiv	%l2,	0x05BE,	%l3
	edge8ln	%g3,	%g4,	%g5
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2153:
	umulcc	%l5,	%i7,	%o0
	tcs	%xcc,	0x5
	fpack16	%f18,	%f18
	alignaddrl	%g6,	%i4,	%g7
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f2
	fxtod	%f2,	%f30
	xnor	%o1,	0x1042,	%i0
	fmovrdgez	%g2,	%f6,	%f24
	fmovspos	%xcc,	%f29,	%f24
	edge8ln	%g1,	%l4,	%l0
	orcc	%o6,	0x1687,	%i2
	fmovrdne	%o7,	%f12,	%f0
	edge16l	%o3,	%i3,	%i1
	fandnot1s	%f20,	%f28,	%f11
	wr	%g0,	0x89,	%asi
	stxa	%l1,	[%l7 + 0x48] %asi
	set	0x60, %o4
	ldda	[%l7 + %o4] 0xeb,	%o4
	fmovsg	%xcc,	%f31,	%f15
	bl,a	%xcc,	loop_2154
	movrlz	%i6,	0x212,	%l6
	movrlez	%o4,	%o2,	%i5
	fbu,a	%fcc3,	loop_2155
loop_2154:
	fmovdpos	%xcc,	%f13,	%f30
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%g3
loop_2155:
	membar	0x49
	sdiv	%l3,	0x0196,	%g5
	movg	%xcc,	%g4,	%i7
	edge16ln	%o0,	%g6,	%i4
	orcc	%g7,	%l5,	%i0
	alignaddr	%g2,	%o1,	%l4
	srax	%l0,	%o6,	%g1
	popc	0x1A36,	%o7
	movleu	%xcc,	%o3,	%i3
	fmovs	%f8,	%f0
	fone	%f28
	tge	%icc,	0x6
	fble	%fcc3,	loop_2156
	tsubcctv	%i1,	0x097C,	%l1
	smulcc	%i2,	0x058E,	%o5
	set	0x46, %l6
	stha	%l6,	[%l7 + %l6] 0x15
loop_2156:
	nop
	setx	loop_2157,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	swap	[%l7 + 0x40],	%o4
	or	%i6,	%o2,	%i5
	wr	%g0,	0x2b,	%asi
	stxa	%l2,	[%l7 + 0x50] %asi
	membar	#Sync
loop_2157:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l3,	0x0825,	%g5
	ta	%xcc,	0x0
	movrgz	%g4,	0x2A5,	%g3
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x68] %asi,	%o0
	tne	%icc,	0x3
	orn	%i7,	0x1244,	%g6
	nop
	fitos	%f5,	%f0
	fstod	%f0,	%f2
	fcmpgt16	%f6,	%f30,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i4,	%i0
	wr	%g0,	0x88,	%asi
	stba	%g2,	[%l7 + 0x1B] %asi
	tcs	%xcc,	0x3
	movleu	%xcc,	%o1,	%l4
	srlx	%l0,	%o6,	%g1
	fbe	%fcc2,	loop_2158
	edge16l	%l5,	%o7,	%o3
	ldub	[%l7 + 0x41],	%i1
	and	%i3,	%i2,	%l1
loop_2158:
	mulx	%o5,	0x187C,	%l6
	bshuffle	%f24,	%f22,	%f18
	tl	%icc,	0x1
	te	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	sta	%f3,	[%l7 + 0x34] %asi
	fsrc2s	%f5,	%f13
	tgu	%xcc,	0x5
	fmovd	%f18,	%f0
	orn	%i6,	0x1CB6,	%o2
	set	0x40, %g6
	stda	%f16,	[%l7 + %g6] 0x18
	addc	%i5,	0x19E9,	%l2
	fmovsneg	%xcc,	%f27,	%f5
	tsubcctv	%o4,	0x15F2,	%g5
	sll	%g4,	0x13,	%g3
	smul	%l3,	%i7,	%g6
	addccc	%o0,	%g7,	%i4
	umulcc	%i0,	%g2,	%l4
	bl,a	%xcc,	loop_2159
	edge32ln	%o1,	%l0,	%o6
	brz,a	%l5,	loop_2160
	tle	%icc,	0x6
loop_2159:
	fbule,a	%fcc0,	loop_2161
	movge	%icc,	%o7,	%o3
loop_2160:
	xnorcc	%g1,	0x040A,	%i3
	fmovdvc	%xcc,	%f6,	%f6
loop_2161:
	movl	%icc,	%i1,	%i2
	fmul8x16au	%f8,	%f0,	%f26
	and	%l1,	0x0A90,	%l6
	edge8ln	%i6,	%o5,	%o2
	orn	%l2,	%i5,	%o4
	addccc	%g5,	%g3,	%g4
	movvc	%xcc,	%l3,	%g6
	ldsh	[%l7 + 0x4C],	%o0
	movrgz	%g7,	0x131,	%i4
	brgz,a	%i7,	loop_2162
	sdiv	%i0,	0x1809,	%l4
	nop
	setx	0x1BC8696F704BC071,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x80
loop_2162:
	sllx	%o1,	0x0A,	%g2
	fpsub16	%f18,	%f6,	%f10
	sethi	0x1464,	%l0
	edge32ln	%l5,	%o6,	%o3
	fmovdleu	%icc,	%f11,	%f12
	fbuge	%fcc0,	loop_2163
	ldsw	[%l7 + 0x0C],	%o7
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
	ble	loop_2165
loop_2163:
	membar	0x7E
	edge32	%i3,	%i1,	%g1
loop_2164:
	movvc	%icc,	%l1,	%i2
loop_2165:
	nop
	set	0x210, %l1
	ldxa	[%g0 + %l1] 0x52,	%l6
	tle	%xcc,	0x0
	movrne	%i6,	%o5,	%o2
	mulx	%l2,	0x1B87,	%i5
	movvs	%xcc,	%g5,	%g3
	tge	%icc,	0x6
	fmovsa	%xcc,	%f27,	%f8
	movcs	%icc,	%g4,	%o4
	fandnot2	%f2,	%f8,	%f16
	subccc	%g6,	0x091A,	%l3
	edge32ln	%o0,	%g7,	%i7
	sdiv	%i0,	0x0769,	%l4
	srlx	%i4,	%o1,	%g2
	subc	%l5,	%o6,	%o3
	tl	%icc,	0x7
	fbg	%fcc3,	loop_2166
	fmovdcc	%icc,	%f15,	%f22
	be,a	%icc,	loop_2167
	movvc	%icc,	%o7,	%i3
loop_2166:
	edge8	%l0,	%i1,	%l1
	sethi	0x0240,	%g1
loop_2167:
	srax	%i2,	0x14,	%i6
	orcc	%l6,	%o5,	%o2
	ta	%icc,	0x2
	brlez	%i5,	loop_2168
	fbn,a	%fcc0,	loop_2169
	tvs	%xcc,	0x0
	bshuffle	%f28,	%f28,	%f28
loop_2168:
	addc	%g5,	%l2,	%g3
loop_2169:
	fornot2	%f22,	%f4,	%f0
	fmovdleu	%xcc,	%f15,	%f16
	fba	%fcc0,	loop_2170
	fmuld8sux16	%f9,	%f11,	%f22
	fbu,a	%fcc3,	loop_2171
	fmovdcc	%icc,	%f31,	%f25
loop_2170:
	sdivcc	%o4,	0x1FDF,	%g6
	movvc	%icc,	%g4,	%o0
loop_2171:
	nop
	set	0x20, %o0
	stwa	%l3,	[%l7 + %o0] 0x18
	set	0x0F, %l2
	ldstuba	[%l7 + %l2] 0x11,	%g7
	fcmpeq16	%f14,	%f30,	%i0
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x10] %asi,	%i7
	bg,a,pn	%xcc,	loop_2172
	tvs	%icc,	0x7
	fand	%f16,	%f28,	%f26
	edge32n	%i4,	%o1,	%l4
loop_2172:
	tne	%xcc,	0x0
	umulcc	%l5,	0x1C3D,	%o6
	ta	%icc,	0x1
	sethi	0x0E74,	%o3
	andncc	%g2,	%i3,	%l0
	and	%o7,	0x0ECB,	%i1
	taddcc	%g1,	0x1940,	%l1
	fba	%fcc0,	loop_2173
	bge,a	%xcc,	loop_2174
	tge	%icc,	0x4
	edge32ln	%i2,	%i6,	%o5
loop_2173:
	bn,pn	%icc,	loop_2175
loop_2174:
	addcc	%l6,	%i5,	%o2
	add	%g5,	%g3,	%l2
	fxors	%f10,	%f5,	%f14
loop_2175:
	fmovdg	%icc,	%f13,	%f9
	movrgz	%o4,	%g4,	%g6
	movge	%xcc,	%l3,	%o0
	andcc	%i0,	%i7,	%i4
	sdivcc	%o1,	0x01E9,	%l4
	smul	%g7,	%l5,	%o3
	fmovdvs	%icc,	%f18,	%f28
	bcs,pt	%xcc,	loop_2176
	bvc,pt	%icc,	loop_2177
	edge32ln	%o6,	%i3,	%g2
	tle	%xcc,	0x2
loop_2176:
	move	%icc,	%l0,	%o7
loop_2177:
	udivx	%g1,	0x015D,	%i1
	fbug	%fcc0,	loop_2178
	taddcctv	%i2,	%i6,	%l1
	fnot1s	%f15,	%f31
	tpos	%icc,	0x3
loop_2178:
	fands	%f9,	%f15,	%f4
	array16	%o5,	%i5,	%o2
	set	0x48, %o5
	swapa	[%l7 + %o5] 0x80,	%g5
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x0D] %asi,	%g3
	srl	%l2,	0x00,	%o4
	fmovsleu	%xcc,	%f15,	%f14
	fmovdneg	%icc,	%f28,	%f11
	mova	%icc,	%l6,	%g6
	edge16ln	%l3,	%o0,	%g4
	fbn,a	%fcc3,	loop_2179
	fmul8sux16	%f2,	%f28,	%f18
	set	0x29, %g4
	ldstuba	[%l7 + %g4] 0x80,	%i7
loop_2179:
	xor	%i4,	0x1E48,	%i0
	edge8	%o1,	%g7,	%l4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%o3,	%l5
	bcs	loop_2180
	smulcc	%i3,	%o6,	%g2
	sth	%l0,	[%l7 + 0x74]
	xorcc	%o7,	%g1,	%i1
loop_2180:
	orncc	%i2,	0x1D24,	%l1
	movvs	%xcc,	%i6,	%o5
	udiv	%i5,	0x0427,	%g5
	smulcc	%g3,	%l2,	%o4
	edge16n	%l6,	%g6,	%l3
	nop
	fitos	%f6,	%f7
	fstox	%f7,	%f8
	tleu	%icc,	0x3
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x22,	%o0
	sra	%o2,	0x12,	%g4
	tleu	%xcc,	0x5
	fbu	%fcc3,	loop_2181
	fbl,a	%fcc3,	loop_2182
	fnands	%f19,	%f25,	%f7
	fmovrdlez	%i7,	%f22,	%f2
loop_2181:
	umul	%i4,	0x1FED,	%i0
loop_2182:
	nop
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovdg	%icc,	%f25,	%f27
	udiv	%o1,	0x0E4C,	%g7
	addcc	%o3,	0x0207,	%l5
	brlz	%i3,	loop_2183
	edge8l	%o6,	%g2,	%l0
	srl	%l4,	0x03,	%o7
	fbul,a	%fcc2,	loop_2184
loop_2183:
	stbar
	ta	%xcc,	0x2
	udivcc	%g1,	0x1AF7,	%i2
loop_2184:
	movne	%icc,	%l1,	%i6
	stx	%i1,	[%l7 + 0x38]
	fandnot1s	%f3,	%f12,	%f15
	nop
	setx	loop_2185,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%xcc,	0x3
	mova	%icc,	%i5,	%o5
	edge32l	%g5,	%l2,	%o4
loop_2185:
	edge32n	%g3,	%l6,	%g6
	ta	%xcc,	0x0
	movn	%icc,	%o0,	%l3
	fbule,a	%fcc0,	loop_2186
	orncc	%o2,	0x09A7,	%g4
	membar	0x68
	nop
	setx	loop_2187,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2186:
	sll	%i4,	0x05,	%i0
	fabss	%f22,	%f8
	movrne	%o1,	0x1AA,	%g7
loop_2187:
	umulcc	%i7,	%l5,	%i3
	tleu	%xcc,	0x1
	nop
	setx	0xA058E19E,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fmovsneg	%xcc,	%f14,	%f20
	ldd	[%l7 + 0x18],	%o6
	edge16	%o3,	%l0,	%l4
	bne,a,pt	%icc,	loop_2188
	movgu	%icc,	%o7,	%g1
	nop
	fitos	%f8,	%f9
	fstoi	%f9,	%f3
	udivx	%g2,	0x060D,	%i2
loop_2188:
	nop
	set	0x2E, %i5
	lduba	[%l7 + %i5] 0x04,	%l1
	move	%xcc,	%i6,	%i5
	set	0x5A, %l0
	stba	%i1,	[%l7 + %l0] 0xe2
	membar	#Sync
	sub	%g5,	0x0CC6,	%l2
	orcc	%o5,	%g3,	%l6
	nop
	setx	0x8173AC3B86CA4D44,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x23D1C70973300F6E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f30,	%f6
	movpos	%icc,	%g6,	%o0
	flush	%l7 + 0x3C
	fmovsa	%icc,	%f25,	%f6
	fcmpgt32	%f14,	%f2,	%o4
	fmovdvc	%xcc,	%f8,	%f17
	swap	[%l7 + 0x3C],	%o2
	tsubcc	%l3,	0x189A,	%g4
	bneg,a,pt	%xcc,	loop_2189
	sdivcc	%i0,	0x140C,	%i4
	fandnot1	%f8,	%f2,	%f10
	bge	%icc,	loop_2190
loop_2189:
	fcmple32	%f4,	%f22,	%o1
	addc	%i7,	0x19A1,	%l5
	tle	%xcc,	0x4
loop_2190:
	array32	%g7,	%i3,	%o6
	sll	%l0,	0x10,	%o3
	tcc	%icc,	0x7
	edge8ln	%o7,	%g1,	%g2
	fands	%f27,	%f1,	%f20
	edge8n	%i2,	%l1,	%i6
	fbu,a	%fcc2,	loop_2191
	nop
	setx	0x4DA0B0CD0FD0E38B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x14E5A66E20B76D23,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f20,	%f8
	movneg	%xcc,	%l4,	%i5
	udiv	%i1,	0x19A2,	%l2
loop_2191:
	movrgez	%o5,	0x03E,	%g3
	or	%l6,	0x03DB,	%g6
	fbuge	%fcc0,	loop_2192
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g5,	0x1E6D,	%o0
	mulscc	%o4,	%o2,	%l3
loop_2192:
	fandnot2s	%f7,	%f14,	%f28
	edge8ln	%i0,	%g4,	%i4
	fbo	%fcc3,	loop_2193
	movre	%o1,	%l5,	%i7
	fpsub16s	%f19,	%f27,	%f1
	udiv	%g7,	0x097C,	%i3
loop_2193:
	alignaddrl	%l0,	%o3,	%o7
	bpos,pn	%icc,	loop_2194
	tvc	%xcc,	0x4
	fbne	%fcc2,	loop_2195
	udiv	%o6,	0x077A,	%g1
loop_2194:
	udivcc	%i2,	0x0030,	%g2
	bcs,a	%icc,	loop_2196
loop_2195:
	fmovscs	%icc,	%f17,	%f14
	fcmpne16	%f12,	%f14,	%i6
	fpsub32s	%f15,	%f4,	%f11
loop_2196:
	edge32ln	%l4,	%l1,	%i1
	tgu	%icc,	0x5
	nop
	setx	0x7658834D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x7ABEE1ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f19,	%f13
	sdivcc	%i5,	0x1BE0,	%o5
	fbue,a	%fcc1,	loop_2197
	fmovdneg	%icc,	%f22,	%f16
	tl	%xcc,	0x5
	xnorcc	%l2,	%l6,	%g3
loop_2197:
	tgu	%xcc,	0x6
	edge16l	%g6,	%g5,	%o4
	fmovdge	%xcc,	%f22,	%f31
	movne	%xcc,	%o0,	%o2
	srl	%i0,	0x0B,	%l3
	tvc	%xcc,	0x4
	fpadd32	%f4,	%f10,	%f4
	mulx	%i4,	0x094B,	%g4
	movrgez	%o1,	%l5,	%g7
	array16	%i3,	%i7,	%o3
	fmovsge	%icc,	%f10,	%f1
	andcc	%l0,	%o7,	%o6
	sir	0x0639
	tn	%xcc,	0x4
	bne,a	loop_2198
	movrlz	%i2,	%g2,	%i6
	nop
	fitos	%f11,	%f31
	fstox	%f31,	%f0
	tsubcc	%g1,	%l4,	%i1
loop_2198:
	ld	[%l7 + 0x14],	%f17
	set	0x74, %l3
	swapa	[%l7 + %l3] 0x80,	%i5
	udivx	%l1,	0x089F,	%o5
	tle	%xcc,	0x5
	te	%xcc,	0x2
	array8	%l6,	%l2,	%g3
	xorcc	%g5,	%o4,	%o0
	srlx	%o2,	0x0D,	%i0
	fbule,a	%fcc1,	loop_2199
	edge32	%g6,	%l3,	%i4
	fmovrdlz	%g4,	%f26,	%f4
	movgu	%icc,	%l5,	%o1
loop_2199:
	tleu	%xcc,	0x0
	tsubcctv	%g7,	0x082E,	%i7
	movneg	%icc,	%o3,	%l0
	sdivcc	%o7,	0x10C5,	%i3
	orncc	%o6,	%g2,	%i6
	array8	%i2,	%g1,	%i1
	xor	%l4,	0x1954,	%i5
	tpos	%icc,	0x1
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%o5
	xnor	%l2,	%l6,	%g3
	edge8l	%o4,	%o0,	%g5
	set	0x69, %g7
	stba	%i0,	[%l7 + %g7] 0x0c
	orncc	%o2,	0x04EA,	%g6
	fcmpne32	%f12,	%f26,	%i4
	orncc	%l3,	0x0180,	%g4
	movrlz	%l5,	%o1,	%i7
	sra	%g7,	%l0,	%o7
	tle	%xcc,	0x4
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f14
	edge16ln	%i3,	%o6,	%o3
	tvs	%xcc,	0x0
	edge8	%g2,	%i2,	%g1
	movrgz	%i1,	0x238,	%l4
	udivx	%i6,	0x1688,	%l1
	subccc	%o5,	0x1D27,	%i5
	tge	%icc,	0x2
	set	0x16, %o7
	ldsha	[%l7 + %o7] 0x81,	%l6
	fmovda	%xcc,	%f24,	%f30
	fmovda	%xcc,	%f17,	%f11
	st	%f14,	[%l7 + 0x3C]
	fmovrsgz	%g3,	%f6,	%f15
	sdiv	%l2,	0x0F43,	%o4
	edge8	%o0,	%i0,	%g5
	tn	%xcc,	0x4
	addccc	%g6,	0x07E8,	%o2
	mulx	%l3,	0x1565,	%g4
	fmovdcs	%icc,	%f17,	%f2
	andn	%l5,	%o1,	%i7
	fmul8x16au	%f2,	%f10,	%f16
	movle	%icc,	%g7,	%i4
	fbule	%fcc2,	loop_2200
	fmovsn	%icc,	%f3,	%f22
	tleu	%xcc,	0x1
	fnands	%f30,	%f6,	%f17
loop_2200:
	taddcc	%o7,	0x1E9A,	%l0
	nop
	setx	0x0BAF240C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x820B552E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f10,	%f25
	tcc	%xcc,	0x7
	nop
	setx	loop_2201,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orcc	%i3,	%o3,	%g2
	bg,a,pt	%xcc,	loop_2202
	orcc	%o6,	%g1,	%i1
loop_2201:
	brlz,a	%l4,	loop_2203
	fmovde	%xcc,	%f0,	%f29
loop_2202:
	edge16ln	%i2,	%i6,	%o5
	bcc,a,pt	%icc,	loop_2204
loop_2203:
	movrgez	%i5,	%l1,	%g3
	edge32n	%l2,	%l6,	%o4
	fbuge,a	%fcc2,	loop_2205
loop_2204:
	nop
	setx loop_2206, %l0, %l1
	jmpl %l1, %i0
	lduh	[%l7 + 0x70],	%o0
	udivcc	%g6,	0x022A,	%g5
loop_2205:
	fands	%f13,	%f0,	%f14
loop_2206:
	bleu,pt	%xcc,	loop_2207
	nop
	fitod	%f15,	%f6
	movrne	%l3,	%o2,	%l5
	std	%f20,	[%l7 + 0x18]
loop_2207:
	ldstub	[%l7 + 0x75],	%g4
	edge32n	%i7,	%o1,	%i4
	subcc	%g7,	%l0,	%i3
	tg	%icc,	0x2
	fblg	%fcc3,	loop_2208
	movrlz	%o3,	%o7,	%g2
	fmovsg	%xcc,	%f8,	%f3
	tsubcc	%o6,	%g1,	%i1
loop_2208:
	ldsb	[%l7 + 0x13],	%i2
	srl	%l4,	%i6,	%i5
	fsrc1s	%f6,	%f23
	fsrc1	%f12,	%f26
	bg,pn	%icc,	loop_2209
	fpadd16s	%f26,	%f30,	%f20
	fmovdl	%xcc,	%f13,	%f0
	brlz,a	%l1,	loop_2210
loop_2209:
	mova	%xcc,	%o5,	%l2
	sub	%l6,	0x18F0,	%o4
	sll	%g3,	0x18,	%o0
loop_2210:
	fzeros	%f16
	sra	%g6,	%i0,	%g5
	orncc	%l3,	%o2,	%l5
	nop
	setx	0x414B3B6A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xB8158A22,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f15,	%f6
	subcc	%g4,	0x1822,	%i7
	movrlez	%o1,	%i4,	%g7
	edge8	%l0,	%o3,	%i3
	nop
	fitod	%f10,	%f12
	fdtos	%f12,	%f20
	movrgez	%o7,	%o6,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i1,	%g1,	%l4
	addccc	%i2,	0x011B,	%i5
	sethi	0x1934,	%l1
	edge32n	%o5,	%l2,	%i6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x10] %asi,	%l6
	orcc	%o4,	%o0,	%g6
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g3
	lduw	[%l7 + 0x4C],	%g5
	fmovd	%f14,	%f30
	fandnot2s	%f10,	%f2,	%f21
	xnor	%i0,	%l3,	%o2
	sllx	%g4,	%l5,	%i7
	addccc	%o1,	%g7,	%l0
	set	0x08, %g1
	swapa	[%l7 + %g1] 0x80,	%o3
	fmovdneg	%icc,	%f10,	%f11
	alignaddr	%i3,	%i4,	%o7
	alignaddrl	%o6,	%g2,	%g1
	fornot2	%f16,	%f26,	%f10
	movcc	%xcc,	%l4,	%i1
	movl	%icc,	%i2,	%i5
	wr	%g0,	0x5f,	%asi
	stxa	%o5,	[%g0 + 0x0] %asi
	prefetch	[%l7 + 0x3C],	 0x3
	movle	%icc,	%l2,	%i6
	smul	%l6,	0x0CF2,	%o4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x20] %asi,	%l1
	tleu	%xcc,	0x7
	brlz,a	%o0,	loop_2211
	fmovsleu	%xcc,	%f27,	%f12
	tsubcctv	%g3,	%g6,	%i0
	tl	%icc,	0x0
loop_2211:
	tne	%xcc,	0x3
	udivx	%g5,	0x0D73,	%l3
	movre	%g4,	0x1CD,	%o2
	sllx	%l5,	0x01,	%i7
	fmovrsne	%o1,	%f28,	%f12
	mulx	%g7,	0x02F1,	%o3
	fbul	%fcc1,	loop_2212
	sllx	%i3,	%l0,	%i4
	movl	%xcc,	%o7,	%g2
	fmovsa	%xcc,	%f12,	%f0
loop_2212:
	fbuge,a	%fcc0,	loop_2213
	udivx	%g1,	0x042E,	%l4
	fbne	%fcc3,	loop_2214
	movl	%xcc,	%i1,	%i2
loop_2213:
	xnorcc	%o6,	0x17F4,	%o5
	fbul	%fcc0,	loop_2215
loop_2214:
	fblg	%fcc0,	loop_2216
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f30
	alignaddrl	%l2,	%i6,	%l6
loop_2215:
	membar	0x1D
loop_2216:
	fors	%f30,	%f18,	%f7
	bgu,a,pt	%xcc,	loop_2217
	edge8l	%o4,	%l1,	%o0
	udivx	%g3,	0x1547,	%i5
	andncc	%i0,	%g6,	%l3
loop_2217:
	and	%g5,	0x1F9F,	%o2
	fpadd16	%f10,	%f6,	%f20
	fsrc2	%f6,	%f28
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f6
	fxtod	%f6,	%f10
	fpsub16s	%f24,	%f1,	%f9
	bge	%icc,	loop_2218
	nop
	setx	loop_2219,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bne,a	%icc,	loop_2220
	bcs,pn	%icc,	loop_2221
loop_2218:
	ldd	[%l7 + 0x58],	%l4
loop_2219:
	mulscc	%g4,	%o1,	%g7
loop_2220:
	xor	%o3,	0x06B2,	%i7
loop_2221:
	movne	%xcc,	%i3,	%l0
	fandnot1	%f24,	%f12,	%f10
	array16	%i4,	%o7,	%g2
	movl	%icc,	%l4,	%g1
	array32	%i1,	%i2,	%o6
	taddcctv	%o5,	%i6,	%l2
	movleu	%xcc,	%o4,	%l1
	umul	%o0,	%g3,	%l6
	stbar
	edge8	%i0,	%i5,	%g6
	edge32	%l3,	%o2,	%l5
	movcc	%icc,	%g5,	%o1
	nop
	setx	loop_2222,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%g4,	0x1C99,	%o3
	nop
	set	0x50, %l5
	lduw	[%l7 + %l5],	%g7
	tle	%xcc,	0x1
loop_2222:
	ldsw	[%l7 + 0x64],	%i7
	sth	%l0,	[%l7 + 0x3E]
	fmovrde	%i3,	%f10,	%f22
	bl,a	%icc,	loop_2223
	te	%xcc,	0x5
	movpos	%icc,	%i4,	%g2
	xnor	%o7,	%l4,	%i1
loop_2223:
	fbn	%fcc2,	loop_2224
	edge8l	%i2,	%g1,	%o5
	ta	%xcc,	0x7
	edge8l	%i6,	%l2,	%o6
loop_2224:
	movpos	%xcc,	%o4,	%o0
	fba	%fcc0,	loop_2225
	movcs	%icc,	%g3,	%l1
	sllx	%l6,	%i5,	%g6
	fnors	%f12,	%f19,	%f23
loop_2225:
	tvc	%icc,	0x4
	edge8l	%l3,	%i0,	%l5
	membar	0x2B
	tge	%icc,	0x0
	sub	%o2,	%o1,	%g5
	te	%icc,	0x4
	fnegs	%f20,	%f2
	fmul8x16au	%f19,	%f23,	%f14
	std	%f12,	[%l7 + 0x50]
	fsrc2s	%f2,	%f15
	tcs	%xcc,	0x2
	std	%f18,	[%l7 + 0x20]
	movrne	%g4,	0x34F,	%g7
	bvs,a,pt	%xcc,	loop_2226
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a,pn	%xcc,	loop_2227
	fbne	%fcc2,	loop_2228
loop_2226:
	fblg	%fcc2,	loop_2229
	move	%icc,	%i7,	%o3
loop_2227:
	fornot1s	%f1,	%f18,	%f8
loop_2228:
	srl	%i3,	0x1B,	%i4
loop_2229:
	fmovsl	%icc,	%f0,	%f12
	movrlz	%l0,	0x185,	%g2
	fbe,a	%fcc0,	loop_2230
	andncc	%o7,	%i1,	%l4
	fbo,a	%fcc0,	loop_2231
	nop
	setx	0x9B0DD99C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x7E804476,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f29,	%f1
loop_2230:
	add	%i2,	%g1,	%i6
	nop
	setx	0x6FCEFE4831472A2E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x5677656B97272EBF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f4,	%f14
loop_2231:
	subcc	%l2,	0x1AF7,	%o5
	addccc	%o6,	0x1A5F,	%o0
	fbu,a	%fcc3,	loop_2232
	fsrc2	%f6,	%f10
	array32	%o4,	%l1,	%l6
	edge32	%g3,	%i5,	%l3
loop_2232:
	fcmpgt16	%f30,	%f4,	%g6
	taddcctv	%i0,	0x12BC,	%l5
	sll	%o2,	0x1E,	%o1
	ldx	[%l7 + 0x30],	%g5
	nop
	fitod	%f8,	%f2
	fdtoi	%f2,	%f10
	fnot2s	%f7,	%f8
	fbl	%fcc0,	loop_2233
	smul	%g7,	%i7,	%o3
	andncc	%g4,	%i4,	%l0
	mulx	%i3,	%o7,	%g2
loop_2233:
	edge16n	%l4,	%i2,	%g1
	nop
	set	0x40, %o6
	ldsw	[%l7 + %o6],	%i6
	tvs	%xcc,	0x4
	movcc	%icc,	%i1,	%l2
	addccc	%o6,	%o0,	%o4
	fmovdg	%xcc,	%f5,	%f27
	movre	%o5,	%l1,	%l6
	add	%g3,	0x1069,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i5,	%i0
	movrlez	%g6,	%l5,	%o1
	movvc	%icc,	%o2,	%g7
	edge16l	%g5,	%o3,	%g4
	ldstub	[%l7 + 0x33],	%i7
	wr	%g0,	0x89,	%asi
	sta	%f3,	[%l7 + 0x28] %asi
	nop
	fitos	%f15,	%f12
	fsrc1	%f6,	%f18
	fbne	%fcc2,	loop_2234
	addccc	%i4,	%l0,	%i3
	edge16ln	%o7,	%g2,	%i2
	bleu	loop_2235
loop_2234:
	array16	%g1,	%l4,	%i6
	movleu	%xcc,	%i1,	%l2
	smulcc	%o6,	0x1087,	%o4
loop_2235:
	nop
	set	0x68, %i1
	ldstuba	[%l7 + %i1] 0x81,	%o5
	movvs	%xcc,	%o0,	%l6
	addcc	%l1,	%g3,	%i5
	movrgez	%i0,	%l3,	%l5
	umul	%g6,	%o2,	%o1
	ba,a	%icc,	loop_2236
	be,pn	%xcc,	loop_2237
	fblg	%fcc1,	loop_2238
	fbne	%fcc1,	loop_2239
loop_2236:
	fpmerge	%f19,	%f25,	%f18
loop_2237:
	popc	%g5,	%g7
loop_2238:
	fpmerge	%f11,	%f30,	%f20
loop_2239:
	movne	%xcc,	%g4,	%o3
	fmovsa	%xcc,	%f0,	%f0
	brz,a	%i7,	loop_2240
	movcs	%xcc,	%i4,	%i3
	addcc	%l0,	%g2,	%i2
	nop
	fitos	%f7,	%f7
	fstox	%f7,	%f30
	fxtos	%f30,	%f13
loop_2240:
	srl	%g1,	0x10,	%l4
	add	%i6,	%i1,	%o7
	movg	%icc,	%l2,	%o6
	udivcc	%o5,	0x18B1,	%o0
	fmovsg	%icc,	%f9,	%f15
	bn,a,pn	%icc,	loop_2241
	membar	0x79
	fpsub32s	%f19,	%f8,	%f5
	taddcctv	%l6,	0x12E4,	%l1
loop_2241:
	bvc	%icc,	loop_2242
	fmul8x16au	%f22,	%f4,	%f24
	array16	%g3,	%i5,	%o4
	bn	loop_2243
loop_2242:
	sdivcc	%i0,	0x02D4,	%l5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x68] %asi,	%l3
loop_2243:
	nop
	setx	0xD7D568F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xD1636F4F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fadds	%f27,	%f4,	%f7
	tne	%icc,	0x7
	xnorcc	%g6,	%o2,	%o1
	taddcctv	%g7,	0x0BF5,	%g5
	brnz,a	%o3,	loop_2244
	fmovdge	%xcc,	%f19,	%f21
	andn	%g4,	0x116A,	%i7
	tn	%icc,	0x5
loop_2244:
	addcc	%i3,	%i4,	%l0
	fandnot2s	%f16,	%f1,	%f23
	movpos	%xcc,	%i2,	%g1
	or	%g2,	0x104F,	%i6
	fmovsn	%icc,	%f30,	%f25
	fbg	%fcc0,	loop_2245
	edge32	%i1,	%l4,	%o7
	sethi	0x1914,	%o6
	tneg	%icc,	0x4
loop_2245:
	movgu	%icc,	%o5,	%l2
	taddcc	%o0,	%l1,	%l6
	sll	%i5,	%o4,	%i0
	ldstub	[%l7 + 0x55],	%g3
	fmovsneg	%xcc,	%f21,	%f20
	sir	0x12C8
	orcc	%l5,	%g6,	%o2
	fmovdgu	%xcc,	%f12,	%f6
	fble	%fcc2,	loop_2246
	movvs	%icc,	%o1,	%g7
	subccc	%l3,	0x1BD0,	%g5
	st	%f27,	[%l7 + 0x78]
loop_2246:
	bleu,pt	%icc,	loop_2247
	sllx	%o3,	%g4,	%i7
	udivcc	%i4,	0x17C1,	%i3
	or	%l0,	0x11F2,	%i2
loop_2247:
	xnor	%g1,	0x06FD,	%i6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x11,	%i1,	%l4
	fbuge,a	%fcc2,	loop_2248
	orcc	%g2,	%o6,	%o7
	fbe,a	%fcc3,	loop_2249
	udivcc	%o5,	0x0B3C,	%o0
loop_2248:
	move	%icc,	%l2,	%l6
	movleu	%icc,	%l1,	%i5
loop_2249:
	brlz	%i0,	loop_2250
	orncc	%g3,	0x1073,	%l5
	tgu	%xcc,	0x7
	fsrc1s	%f7,	%f3
loop_2250:
	srax	%o4,	%g6,	%o1
	bpos,pn	%icc,	loop_2251
	fmovsn	%xcc,	%f20,	%f12
	smul	%g7,	0x03A2,	%o2
	movgu	%xcc,	%g5,	%l3
loop_2251:
	tvc	%icc,	0x5
	umulcc	%o3,	%i7,	%i4
	fnor	%f6,	%f28,	%f20
	te	%xcc,	0x3
	mulx	%i3,	0x00ED,	%g4
	te	%icc,	0x5
	xor	%l0,	%i2,	%i6
	movrgez	%i1,	0x258,	%g1
	edge16l	%l4,	%o6,	%g2
	fbge,a	%fcc2,	loop_2252
	edge16ln	%o5,	%o0,	%l2
	edge8ln	%o7,	%l6,	%l1
	movrlz	%i0,	%i5,	%g3
loop_2252:
	sllx	%l5,	0x12,	%g6
	edge16ln	%o4,	%o1,	%g7
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x81
	movle	%icc,	%g5,	%l3
	stb	%o2,	[%l7 + 0x42]
	ldub	[%l7 + 0x10],	%o3
	movg	%xcc,	%i7,	%i3
	stbar
	fmovsne	%xcc,	%f1,	%f0
	udiv	%g4,	0x037C,	%l0
	nop
	setx	0xAD9BD3252D5358EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f8
	set	0x18, %g3
	ldsha	[%l7 + %g3] 0x19,	%i2
	tvc	%icc,	0x7
	taddcctv	%i6,	0x1388,	%i4
	set	0x5B, %g5
	ldsba	[%l7 + %g5] 0x04,	%g1
	taddcc	%i1,	%l4,	%g2
	array8	%o6,	%o0,	%o5
	tgu	%xcc,	0x0
	ble,pt	%xcc,	loop_2253
	fmovsle	%icc,	%f21,	%f27
	fands	%f27,	%f13,	%f13
	fmovdneg	%xcc,	%f29,	%f13
loop_2253:
	pdist	%f0,	%f2,	%f0
	tle	%icc,	0x7
	sth	%o7,	[%l7 + 0x28]
	fbg	%fcc0,	loop_2254
	movgu	%icc,	%l6,	%l2
	fnor	%f20,	%f16,	%f18
	tvc	%icc,	0x2
loop_2254:
	edge32l	%i0,	%l1,	%g3
	smul	%l5,	0x04F0,	%i5
	fmovsne	%icc,	%f3,	%f19
	edge32l	%o4,	%g6,	%g7
	edge32	%g5,	%l3,	%o2
	mulscc	%o1,	%i7,	%o3
	pdist	%f30,	%f6,	%f10
	movl	%icc,	%g4,	%l0
	bneg,pn	%icc,	loop_2255
	fmovd	%f0,	%f12
	udivx	%i3,	0x0E90,	%i2
	fmovdn	%xcc,	%f0,	%f25
loop_2255:
	nop
	set	0x32, %i2
	ldsba	[%l7 + %i2] 0x15,	%i4
	fnegd	%f24,	%f14
	nop
	fitod	%f20,	%f30
	bvs,a,pt	%icc,	loop_2256
	edge8	%g1,	%i1,	%i6
	fornot2s	%f13,	%f31,	%f25
	edge8l	%g2,	%o6,	%o0
loop_2256:
	nop
	set	0x58, %o1
	stxa	%o5,	[%l7 + %o1] 0x14
	fbo,a	%fcc2,	loop_2257
	fpack16	%f12,	%f5
	tleu	%xcc,	0x3
	and	%o7,	0x11AB,	%l4
loop_2257:
	tle	%xcc,	0x0
	xor	%l6,	%i0,	%l2
	movre	%l1,	0x1CF,	%l5
	bpos	%xcc,	loop_2258
	tsubcctv	%i5,	%g3,	%g6
	tvc	%icc,	0x1
	smulcc	%g7,	0x0632,	%o4
loop_2258:
	tsubcctv	%l3,	%o2,	%g5
	bgu,a,pn	%icc,	loop_2259
	fmovdvc	%xcc,	%f19,	%f9
	movl	%icc,	%o1,	%i7
	fpsub16	%f10,	%f22,	%f6
loop_2259:
	nop
	setx	0x20694BF1,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	fcmpgt32	%f18,	%f22,	%o3
	movrlz	%l0,	%i3,	%i2
	movrgz	%g4,	%g1,	%i4
	fmovsvs	%xcc,	%f10,	%f12
	ldsw	[%l7 + 0x68],	%i6
	andn	%g2,	0x1197,	%o6
	addcc	%i1,	0x0FC7,	%o5
	movrgz	%o0,	%o7,	%l6
	movrne	%i0,	0x1B1,	%l4
	bvc,pt	%xcc,	loop_2260
	xnor	%l1,	0x03C9,	%l5
	tge	%xcc,	0x4
	edge16n	%l2,	%g3,	%g6
loop_2260:
	addccc	%i5,	0x0E93,	%o4
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f11,	%f16
	bge,a	loop_2261
	fmovsn	%xcc,	%f2,	%f9
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l3
loop_2261:
	movn	%icc,	%g7,	%g5
	andn	%o2,	0x1655,	%i7
	fbo,a	%fcc2,	loop_2262
	and	%o1,	%l0,	%o3
	edge8	%i3,	%g4,	%i2
	array16	%i4,	%i6,	%g2
loop_2262:
	array32	%o6,	%g1,	%i1
	fmuld8sux16	%f8,	%f17,	%f26
	nop
	setx	0xF8C4E58B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xA678AB97,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f19,	%f4
	movrne	%o5,	0x1B3,	%o0
	edge32n	%l6,	%o7,	%i0
	movl	%icc,	%l1,	%l4
	or	%l5,	0x1480,	%g3
	brgz	%g6,	loop_2263
	nop
	fitod	%f9,	%f4
	tneg	%xcc,	0x6
	nop
	setx loop_2264, %l0, %l1
	jmpl %l1, %l2
loop_2263:
	movg	%icc,	%o4,	%i5
	fbn,a	%fcc3,	loop_2265
	movneg	%xcc,	%l3,	%g5
loop_2264:
	nop
	wr	%g0,	0x22,	%asi
	stwa	%g7,	[%l7 + 0x44] %asi
	membar	#Sync
loop_2265:
	subc	%i7,	%o1,	%o2
	bne,pt	%icc,	loop_2266
	fbg,a	%fcc0,	loop_2267
	fcmpeq32	%f28,	%f26,	%o3
	swap	[%l7 + 0x7C],	%l0
loop_2266:
	stbar
loop_2267:
	array32	%i3,	%g4,	%i2
	tle	%xcc,	0x6
	udivx	%i4,	0x1C4B,	%g2
	fand	%f28,	%f26,	%f26
	movcc	%icc,	%i6,	%g1
	ldsb	[%l7 + 0x55],	%o6
	st	%f4,	[%l7 + 0x18]
	udivx	%i1,	0x0E38,	%o0
	or	%o5,	0x0A06,	%l6
	movle	%icc,	%o7,	%i0
	fbuge,a	%fcc2,	loop_2268
	tge	%xcc,	0x3
	fxors	%f28,	%f7,	%f9
	edge16l	%l1,	%l4,	%g3
loop_2268:
	ba,a	loop_2269
	array8	%l5,	%g6,	%o4
	fnors	%f10,	%f4,	%f18
	addccc	%l2,	0x0682,	%i5
loop_2269:
	nop
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	fbug	%fcc0,	loop_2270
	addcc	%g7,	0x1B5E,	%i7
	tle	%icc,	0x7
	movrne	%o1,	0x0C4,	%l3
loop_2270:
	fxors	%f9,	%f4,	%f2
	tsubcc	%o2,	0x0848,	%o3
	fblg	%fcc3,	loop_2271
	sub	%i3,	0x1BD6,	%l0
	tl	%icc,	0x4
	movre	%g4,	0x3F6,	%i4
loop_2271:
	tl	%xcc,	0x3
	array8	%i2,	%i6,	%g2
	subcc	%g1,	%o6,	%i1
	st	%f23,	[%l7 + 0x58]
	fornot1s	%f29,	%f16,	%f28
	movrne	%o0,	%l6,	%o7
	mulx	%i0,	%l1,	%o5
	nop
	fitos	%f6,	%f12
	fstod	%f12,	%f22
	tge	%xcc,	0x4
	edge16ln	%l4,	%g3,	%l5
	mulx	%o4,	0x10D1,	%g6
	sdivx	%i5,	0x1E3C,	%l2
	movleu	%xcc,	%g5,	%i7
	array8	%o1,	%l3,	%o2
	edge32n	%g7,	%o3,	%l0
	andcc	%g4,	%i4,	%i3
	nop
	setx	0x1C42A0B0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x98ABB5A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f28,	%f14
	sdivcc	%i2,	0x0180,	%g2
	stb	%i6,	[%l7 + 0x63]
	orn	%o6,	0x05C0,	%g1
	movcc	%icc,	%i1,	%l6
	udivx	%o7,	0x048C,	%i0
	sethi	0x01A2,	%l1
	or	%o0,	%o5,	%l4
	sir	0x1855
	fmovrslz	%l5,	%f8,	%f11
	tne	%icc,	0x5
	movrgez	%o4,	%g3,	%g6
	srl	%i5,	0x13,	%g5
	membar	0x15
	fsrc1s	%f5,	%f4
	udivcc	%i7,	0x04E0,	%o1
	movl	%xcc,	%l3,	%o2
	xnorcc	%g7,	%l2,	%o3
	tl	%icc,	0x1
	movne	%icc,	%g4,	%i4
	ldsb	[%l7 + 0x1C],	%i3
	fmovsa	%icc,	%f0,	%f12
	fsrc2s	%f30,	%f21
	fmuld8ulx16	%f30,	%f11,	%f6
	membar	0x00
	fnot2s	%f21,	%f13
	fbn	%fcc3,	loop_2272
	st	%f24,	[%l7 + 0x2C]
	fmovdvs	%icc,	%f20,	%f7
	addcc	%l0,	%g2,	%i6
loop_2272:
	fble	%fcc2,	loop_2273
	mova	%icc,	%i2,	%o6
	addc	%g1,	0x09C3,	%i1
	fmovdn	%xcc,	%f26,	%f12
loop_2273:
	addc	%o7,	0x06D6,	%i0
	tne	%icc,	0x6
	move	%icc,	%l1,	%l6
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x29] %asi,	%o0
	fand	%f0,	%f4,	%f2
	movgu	%xcc,	%o5,	%l4
	fxor	%f14,	%f16,	%f10
	bcs	%icc,	loop_2274
	movgu	%icc,	%o4,	%g3
	fcmple32	%f24,	%f22,	%l5
	fba	%fcc3,	loop_2275
loop_2274:
	popc	%i5,	%g5
	mulx	%g6,	0x1E9B,	%i7
	fmovsge	%xcc,	%f4,	%f24
loop_2275:
	nop
	set	0x30, %i3
	lduba	[%l7 + %i3] 0x81,	%o1
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2F] %asi,	%o2
	or	%l3,	%g7,	%l2
	tleu	%icc,	0x1
	xorcc	%o3,	0x0505,	%g4
	movrgz	%i4,	0x276,	%l0
	set	0x66, %i0
	ldsha	[%l7 + %i0] 0x0c,	%i3
	lduh	[%l7 + 0x44],	%i6
	tcc	%xcc,	0x6
	set	0x10, %i6
	stxa	%g2,	[%l7 + %i6] 0x81
	edge8	%i2,	%g1,	%i1
	fors	%f25,	%f31,	%f17
	fmovsle	%xcc,	%f1,	%f18
	tne	%icc,	0x2
	bleu,pt	%xcc,	loop_2276
	ta	%icc,	0x6
	umulcc	%o7,	%o6,	%i0
	fmovrsgez	%l6,	%f22,	%f23
loop_2276:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x30] %asi,	%l1
	movneg	%xcc,	%o5,	%o0
	movrne	%o4,	0x032,	%l4
	be,a,pn	%icc,	loop_2277
	movle	%icc,	%g3,	%l5
	srl	%g5,	0x16,	%i5
	set	0x0, %o3
	stxa	%i7,	[%g0 + %o3] 0x57
loop_2277:
	fmovscc	%icc,	%f13,	%f16
	fbl,a	%fcc0,	loop_2278
	ba,pn	%icc,	loop_2279
	edge16	%g6,	%o2,	%o1
	edge8	%l3,	%l2,	%o3
loop_2278:
	nop
	set	0x60, %o2
	lduwa	[%l7 + %o2] 0x80,	%g7
loop_2279:
	bcs,a	%icc,	loop_2280
	udivcc	%g4,	0x1B3B,	%l0
	tl	%xcc,	0x6
	tleu	%icc,	0x7
loop_2280:
	smul	%i3,	%i4,	%g2
	movrlez	%i6,	%i2,	%g1
	fmovrdgez	%o7,	%f20,	%f24
	lduw	[%l7 + 0x34],	%o6
	edge16ln	%i1,	%i0,	%l6
	sdiv	%l1,	0x1007,	%o5
	nop
	set	0x61, %o4
	ldsb	[%l7 + %o4],	%o4
	edge8n	%l4,	%g3,	%o0
	movvc	%xcc,	%l5,	%g5
	fmovrse	%i5,	%f12,	%f6
	alignaddrl	%g6,	%i7,	%o1
	sdivcc	%o2,	0x01F1,	%l3
	edge32	%l2,	%g7,	%g4
	add	%o3,	0x05DA,	%i3
	set	0x20, %l6
	ldda	[%l7 + %l6] 0xea,	%l0
	umulcc	%g2,	0x0997,	%i6
	edge8	%i2,	%i4,	%o7
	edge32ln	%o6,	%i1,	%g1
	edge32n	%l6,	%l1,	%o5
	movvs	%icc,	%o4,	%i0
	sll	%l4,	0x15,	%o0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l5,	%g3
	fornot2	%f4,	%f24,	%f30
	sdiv	%g5,	0x1196,	%g6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] %asi,	%i7,	%o1
	xor	%i5,	0x1B84,	%l3
	orn	%l2,	0x1D38,	%g7
	tvc	%xcc,	0x7
	fabss	%f16,	%f28
	set	0x21, %g6
	ldstuba	[%l7 + %g6] 0x88,	%g4
	xor	%o2,	%i3,	%l0
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fbule	%fcc1,	loop_2281
	movneg	%xcc,	%o3,	%i6
	fmovsvc	%icc,	%f19,	%f11
	subcc	%g2,	0x1DBB,	%i4
loop_2281:
	bneg,a,pn	%xcc,	loop_2282
	fcmple32	%f20,	%f24,	%o7
	pdist	%f8,	%f22,	%f22
	popc	0x10BC,	%i2
loop_2282:
	nop
	setx loop_2283, %l0, %l1
	jmpl %l1, %o6
	fmovdge	%icc,	%f14,	%f26
	movvs	%xcc,	%g1,	%l6
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f26
	fxtod	%f26,	%f22
loop_2283:
	xnor	%l1,	%o5,	%i1
	movre	%o4,	%i0,	%l4
	fmovrdlez	%o0,	%f12,	%f0
	nop
	setx	0x404B9F97,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	fpadd32	%f22,	%f8,	%f30
	udiv	%l5,	0x16B6,	%g5
	tsubcc	%g6,	0x106D,	%g3
	swap	[%l7 + 0x58],	%o1
	array32	%i7,	%i5,	%l2
	wr	%g0,	0x19,	%asi
	sta	%f5,	[%l7 + 0x48] %asi
	smul	%g7,	%l3,	%g4
	stx	%o2,	[%l7 + 0x58]
	sir	0x10EA
	be,pn	%xcc,	loop_2284
	udivx	%l0,	0x10F0,	%o3
	andcc	%i6,	0x1FD9,	%i3
	tcc	%icc,	0x0
loop_2284:
	tle	%icc,	0x3
	nop
	setx	0x661A06E050BAE03E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f14
	movpos	%xcc,	%i4,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x2
	ta	%xcc,	0x4
	movle	%xcc,	%i2,	%o6
	std	%f24,	[%l7 + 0x78]
	movcs	%icc,	%o7,	%l6
	edge32	%l1,	%o5,	%i1
	fbue	%fcc0,	loop_2285
	srlx	%o4,	%i0,	%g1
	movre	%o0,	0x22B,	%l5
	edge8n	%g5,	%l4,	%g3
loop_2285:
	brgz	%g6,	loop_2286
	tvc	%xcc,	0x5
	nop
	fitos	%f5,	%f2
	fstoi	%f2,	%f4
	subc	%i7,	%i5,	%o1
loop_2286:
	subccc	%l2,	%l3,	%g7
	fmovdcs	%icc,	%f0,	%f5
	bgu	%icc,	loop_2287
	alignaddrl	%o2,	%g4,	%o3
	orn	%i6,	%l0,	%i3
	edge16	%g2,	%i4,	%o6
loop_2287:
	nop
	set	0x330, %g2
	nop 	! 	stxa	%i2,	[%g0 + %g2] 0x40 ripped by fixASI40.pl
	fmovde	%xcc,	%f22,	%f25
	xorcc	%l6,	0x01C9,	%l1
	fbn,a	%fcc2,	loop_2288
	fcmpeq16	%f14,	%f30,	%o7
	set	0x42, %l1
	ldsha	[%l7 + %l1] 0x89,	%i1
loop_2288:
	movne	%xcc,	%o4,	%o5
	fandnot2s	%f25,	%f24,	%f9
	nop
	setx	loop_2289,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%i0,	0x16,	%o0
	set	0x75, %i4
	ldstuba	[%l7 + %i4] 0x0c,	%l5
loop_2289:
	fone	%f6
	edge8l	%g5,	%l4,	%g1
	bleu	loop_2290
	movg	%icc,	%g6,	%i7
	fmovdl	%icc,	%f3,	%f10
	edge32ln	%g3,	%i5,	%o1
loop_2290:
	fmovrdne	%l2,	%f8,	%f26
	fnegs	%f31,	%f10
	sub	%g7,	0x17C4,	%l3
	subccc	%o2,	%o3,	%i6
	andcc	%l0,	%i3,	%g4
	sllx	%i4,	0x0A,	%o6
	tcs	%xcc,	0x4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	edge32n	%l6,	%l1,	%g2
	fsrc2	%f26,	%f6
	movrgez	%i1,	%o7,	%o4
	bvc,a	%icc,	loop_2291
	ldd	[%l7 + 0x18],	%i0
	bg,a,pn	%icc,	loop_2292
	andcc	%o0,	%l5,	%g5
loop_2291:
	fmovrdgez	%l4,	%f26,	%f2
	sdivx	%g1,	0x07D0,	%o5
loop_2292:
	fmovrdlz	%g6,	%f28,	%f20
	fble	%fcc1,	loop_2293
	fmovdcc	%icc,	%f4,	%f1
	subc	%i7,	0x15A5,	%i5
	brgez	%g3,	loop_2294
loop_2293:
	movgu	%xcc,	%o1,	%g7
	fcmpeq32	%f0,	%f24,	%l2
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f6
	fxtod	%f6,	%f0
loop_2294:
	edge32l	%l3,	%o3,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x7
	fmovrsne	%l0,	%f14,	%f4
	movcc	%icc,	%i3,	%g4
	smul	%o2,	0x1950,	%o6
	sdiv	%i2,	0x18C6,	%l6
	movn	%xcc,	%i4,	%g2
	fcmple16	%f18,	%f16,	%l1
	tleu	%xcc,	0x7
	edge32ln	%i1,	%o7,	%o4
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i0
	fxor	%f22,	%f10,	%f2
	bgu	%xcc,	loop_2295
	tvs	%xcc,	0x4
	sub	%o0,	%g5,	%l4
	nop
	setx	0xD0485233,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
loop_2295:
	taddcc	%g1,	%l5,	%o5
	edge8ln	%i7,	%g6,	%i5
	movvc	%xcc,	%o1,	%g3
	sll	%g7,	0x17,	%l2
	xnorcc	%l3,	%i6,	%o3
	move	%xcc,	%i3,	%l0
	alignaddr	%g4,	%o2,	%o6
	bgu,a	loop_2296
	sethi	0x1AB4,	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i4,	%l6
loop_2296:
	move	%xcc,	%g2,	%l1
	set	0x12, %l2
	lduha	[%l7 + %l2] 0x81,	%i1
	fmul8sux16	%f6,	%f24,	%f2
	sethi	0x15ED,	%o7
	tcs	%icc,	0x4
	movneg	%xcc,	%i0,	%o0
	fcmple16	%f20,	%f2,	%o4
	taddcc	%g5,	%l4,	%l5
	tvc	%xcc,	0x3
	fmovde	%icc,	%f26,	%f25
	and	%o5,	%i7,	%g1
	wr	%g0,	0x11,	%asi
	sta	%f15,	[%l7 + 0x0C] %asi
	edge8	%g6,	%o1,	%g3
	tl	%xcc,	0x1
	brlz	%i5,	loop_2297
	fmuld8ulx16	%f15,	%f7,	%f26
	movn	%xcc,	%l2,	%g7
	movle	%xcc,	%i6,	%o3
loop_2297:
	smulcc	%i3,	0x11D2,	%l0
	orn	%g4,	%o2,	%l3
	fmovse	%xcc,	%f15,	%f24
	ba,pn	%icc,	loop_2298
	movvs	%icc,	%o6,	%i2
	set	0x75, %o5
	stba	%l6,	[%l7 + %o5] 0x19
loop_2298:
	fexpand	%f20,	%f14
	fbule,a	%fcc2,	loop_2299
	movrgez	%i4,	%l1,	%g2
	sdivx	%o7,	0x1EF3,	%i1
	tgu	%xcc,	0x4
loop_2299:
	fcmpgt32	%f18,	%f24,	%i0
	nop
	setx	0x1AB82EA7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x8567E4B4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f5,	%f27
	array16	%o0,	%g5,	%o4
	fexpand	%f5,	%f8
	mova	%xcc,	%l4,	%o5
	fsrc2	%f24,	%f10
	movvs	%xcc,	%l5,	%i7
	swap	[%l7 + 0x44],	%g6
	sdivx	%o1,	0x10CB,	%g1
	edge8ln	%g3,	%l2,	%g7
	xnorcc	%i6,	0x1FB2,	%i5
	movne	%xcc,	%o3,	%l0
	movge	%icc,	%i3,	%o2
	set	0x48, %g4
	lda	[%l7 + %g4] 0x88,	%f5
	fmovrsne	%g4,	%f22,	%f30
	fmovrde	%o6,	%f16,	%f28
	fmovrdne	%l3,	%f10,	%f4
	wr	%g0,	0x88,	%asi
	stba	%i2,	[%l7 + 0x1D] %asi
	andncc	%l6,	%i4,	%l1
	fmovrdgez	%g2,	%f20,	%f2
	xnorcc	%o7,	0x0272,	%i1
	sdivx	%o0,	0x07A6,	%g5
	xorcc	%i0,	0x0A27,	%o4
	te	%icc,	0x1
	edge8n	%o5,	%l5,	%l4
	fbule	%fcc0,	loop_2300
	xorcc	%g6,	%i7,	%o1
	alignaddr	%g1,	%l2,	%g7
	movleu	%icc,	%g3,	%i6
loop_2300:
	fbu	%fcc1,	loop_2301
	brnz	%o3,	loop_2302
	movge	%icc,	%l0,	%i3
	xnorcc	%o2,	0x12E8,	%g4
loop_2301:
	movgu	%xcc,	%o6,	%i5
loop_2302:
	fcmpgt32	%f4,	%f14,	%l3
	te	%icc,	0x6
	stx	%l6,	[%l7 + 0x60]
	wr	%g0,	0x27,	%asi
	stha	%i4,	[%l7 + 0x38] %asi
	membar	#Sync
	mulx	%i2,	%l1,	%g2
	edge8	%o7,	%i1,	%g5
	edge8ln	%o0,	%o4,	%o5
	brz	%l5,	loop_2303
	array16	%i0,	%l4,	%g6
	nop
	setx	0x7C8B6924751B7D3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x312D7303A1D0CF94,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f24,	%f4
	udivcc	%i7,	0x09B1,	%g1
loop_2303:
	tle	%icc,	0x2
	ta	%icc,	0x6
	brlez	%o1,	loop_2304
	fmovdpos	%icc,	%f11,	%f15
	bcs,pt	%xcc,	loop_2305
	bg,a,pt	%icc,	loop_2306
loop_2304:
	movne	%xcc,	%l2,	%g3
	fcmpne32	%f14,	%f24,	%i6
loop_2305:
	xorcc	%o3,	0x15BD,	%g7
loop_2306:
	subcc	%i3,	%l0,	%o2
	ld	[%l7 + 0x58],	%f11
	ta	%xcc,	0x1
	bpos,a	loop_2307
	srax	%o6,	%i5,	%l3
	fpadd16s	%f23,	%f9,	%f3
	add	%g4,	%l6,	%i2
loop_2307:
	edge32ln	%i4,	%g2,	%l1
	movcc	%icc,	%i1,	%g5
	stb	%o7,	[%l7 + 0x51]
	fbo,a	%fcc1,	loop_2308
	nop
	set	0x50, %i7
	ldd	[%l7 + %i7],	%o0
	nop
	fitod	%f16,	%f12
	subcc	%o5,	0x1ECE,	%o4
loop_2308:
	nop
	setx	0xEC4B827E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x09113421,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f3,	%f0
	sdiv	%i0,	0x11C6,	%l4
	edge8	%l5,	%g6,	%i7
	fmovrsgez	%g1,	%f12,	%f4
	bne,pn	%xcc,	loop_2309
	movrne	%l2,	0x1F9,	%o1
	orcc	%g3,	0x1CF1,	%o3
	andn	%g7,	0x0BB1,	%i6
loop_2309:
	tle	%icc,	0x4
	nop
	setx	0xB07F76F4,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	fbue	%fcc2,	loop_2310
	movgu	%icc,	%i3,	%o2
	addcc	%l0,	0x088D,	%i5
	fxnors	%f12,	%f12,	%f7
loop_2310:
	andn	%o6,	%g4,	%l3
	andn	%i2,	%l6,	%i4
	fmul8x16al	%f26,	%f30,	%f24
	tne	%icc,	0x6
	edge8	%g2,	%l1,	%i1
	andcc	%o7,	%g5,	%o5
	edge16ln	%o4,	%o0,	%i0
	membar	0x17
	orn	%l5,	0x1CEA,	%g6
	movleu	%xcc,	%i7,	%l4
	ldd	[%l7 + 0x58],	%g0
	addccc	%l2,	%g3,	%o1
	fba	%fcc3,	loop_2311
	brnz	%g7,	loop_2312
	srax	%o3,	%i3,	%o2
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f18
	fxtod	%f18,	%f12
loop_2311:
	movge	%icc,	%i6,	%i5
loop_2312:
	fmovsne	%icc,	%f5,	%f21
	fmovse	%icc,	%f13,	%f22
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	taddcctv	%l0,	%o6,	%l3
	tn	%xcc,	0x5
	tg	%xcc,	0x0
	or	%g4,	%l6,	%i2
	mova	%xcc,	%i4,	%l1
	tleu	%xcc,	0x3
	fba	%fcc2,	loop_2313
	fexpand	%f7,	%f2
	tl	%icc,	0x2
	fbul	%fcc2,	loop_2314
loop_2313:
	movleu	%xcc,	%g2,	%i1
	sdiv	%o7,	0x016B,	%o5
	movcc	%icc,	%o4,	%g5
loop_2314:
	edge8l	%o0,	%i0,	%g6
	edge16n	%i7,	%l5,	%g1
	xnorcc	%l4,	%g3,	%o1
	udiv	%g7,	0x0498,	%o3
	movl	%xcc,	%l2,	%o2
	set	0x72, %o0
	lduha	[%l7 + %o0] 0x0c,	%i3
	fxnors	%f5,	%f1,	%f24
	bgu,a	loop_2315
	bvs,a,pn	%xcc,	loop_2316
	fxor	%f30,	%f26,	%f18
	fbl	%fcc2,	loop_2317
loop_2315:
	mulscc	%i5,	%l0,	%i6
loop_2316:
	fnegd	%f20,	%f22
	fpsub16	%f24,	%f18,	%f28
loop_2317:
	fbug	%fcc3,	loop_2318
	or	%o6,	%l3,	%l6
	udiv	%i2,	0x0EBF,	%g4
	tcc	%xcc,	0x6
loop_2318:
	nop
	fitos	%f8,	%f26
	edge32l	%l1,	%g2,	%i1
	bl,a	loop_2319
	alignaddr	%i4,	%o7,	%o4
	sdiv	%g5,	0x1115,	%o5
	movre	%i0,	%o0,	%g6
loop_2319:
	udivcc	%i7,	0x0CC8,	%g1
	bpos,pn	%xcc,	loop_2320
	tneg	%icc,	0x5
	tneg	%icc,	0x3
	brgez,a	%l4,	loop_2321
loop_2320:
	nop
	setx	loop_2322,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%icc,	%g3,	%o1
	tvc	%xcc,	0x6
loop_2321:
	fones	%f9
loop_2322:
	movvc	%xcc,	%l5,	%o3
	sll	%l2,	0x10,	%g7
	tneg	%icc,	0x5
	fnot2s	%f28,	%f12
	fmovd	%f16,	%f16
	fpadd16	%f30,	%f22,	%f12
	nop
	set	0x6C, %l0
	ldsh	[%l7 + %l0],	%o2
	orcc	%i3,	%l0,	%i6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	and	%o6,	%l6,	%l3
	fmovrslz	%g4,	%f7,	%f29
	fbuge,a	%fcc2,	loop_2323
	move	%xcc,	%i2,	%g2
	movl	%xcc,	%l1,	%i4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x68] %asi,	%i1
loop_2323:
	movl	%icc,	%o7,	%g5
	fornot2s	%f15,	%f21,	%f24
	prefetch	[%l7 + 0x10],	 0x1
	bcs	loop_2324
	alignaddrl	%o5,	%i0,	%o4
	movre	%o0,	0x23D,	%i7
	fmovdl	%xcc,	%f24,	%f10
loop_2324:
	movne	%icc,	%g6,	%g1
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g3
	smul	%o1,	%l4,	%o3
	te	%xcc,	0x6
	bn,pn	%icc,	loop_2325
	membar	0x5A
	nop
	setx	0x4B197C9D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x43CD2BE0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f6,	%f8
	fbug	%fcc3,	loop_2326
loop_2325:
	nop
	setx	0x9A7815AE94D80C40,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x9C8506F7E8D8E9E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f10,	%f18
	movrgez	%l5,	%g7,	%o2
	taddcctv	%l2,	%i3,	%i6
loop_2326:
	nop
	setx	0xAFFD097A107E4CA3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	taddcc	%i5,	%o6,	%l0
	membar	0x10
	tle	%icc,	0x2
	movg	%xcc,	%l6,	%l3
	tgu	%xcc,	0x2
	tcc	%icc,	0x5
	andn	%g4,	%g2,	%l1
	srlx	%i4,	0x01,	%i1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x6A] %asi,	%o7
	brnz,a	%g5,	loop_2327
	udiv	%o5,	0x1A31,	%i0
	sll	%i2,	%o0,	%i7
	mulx	%g6,	0x1211,	%o4
loop_2327:
	nop
	set	0x60, %i5
	ldda	[%l7 + %i5] 0x24,	%g0
	tsubcc	%g3,	0x145B,	%o1
	ta	%icc,	0x4
	edge16ln	%l4,	%o3,	%g7
	edge16	%o2,	%l2,	%l5
	mulx	%i6,	%i5,	%o6
	andncc	%i3,	%l6,	%l3
	addc	%g4,	0x04B9,	%g2
	fpsub16s	%f12,	%f23,	%f2
	subc	%l0,	%l1,	%i1
	tl	%xcc,	0x3
	edge8l	%i4,	%o7,	%g5
	fmovsvs	%xcc,	%f9,	%f15
	array8	%i0,	%o5,	%i2
	fandnot2s	%f23,	%f15,	%f14
	ldsw	[%l7 + 0x7C],	%i7
	udivcc	%g6,	0x19E5,	%o0
	movrlz	%o4,	%g1,	%o1
	edge32	%g3,	%l4,	%o3
	fsrc1	%f28,	%f16
	edge32n	%o2,	%g7,	%l2
	mulx	%l5,	0x0AF8,	%i6
	ldx	[%l7 + 0x50],	%o6
	fmovsl	%icc,	%f30,	%f14
	movrgz	%i5,	%l6,	%l3
	movrgez	%i3,	0x360,	%g4
	movrlz	%l0,	0x0E0,	%g2
	subccc	%l1,	%i4,	%i1
	taddcc	%o7,	0x1D7C,	%g5
	nop
	setx	0x60645684,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	tneg	%xcc,	0x6
	tneg	%icc,	0x0
	addcc	%i0,	%o5,	%i7
	xor	%g6,	0x1F47,	%i2
	fbug,a	%fcc2,	loop_2328
	fbne,a	%fcc1,	loop_2329
	sra	%o4,	0x1B,	%o0
	prefetch	[%l7 + 0x58],	 0x3
loop_2328:
	ldsh	[%l7 + 0x58],	%g1
loop_2329:
	udivcc	%o1,	0x03F6,	%l4
	be,pt	%icc,	loop_2330
	fpsub32	%f28,	%f10,	%f28
	bleu,a,pn	%xcc,	loop_2331
	edge16	%o3,	%o2,	%g7
loop_2330:
	fxnors	%f23,	%f21,	%f1
	and	%l2,	%l5,	%g3
loop_2331:
	xor	%i6,	%i5,	%l6
	orn	%l3,	%o6,	%g4
	andncc	%i3,	%l0,	%l1
	xorcc	%i4,	%g2,	%i1
	nop
	fitos	%f27,	%f0
	fcmpne16	%f14,	%f30,	%g5
	bl	loop_2332
	movcs	%icc,	%o7,	%o5
	fnands	%f21,	%f19,	%f11
	fmovdge	%icc,	%f2,	%f17
loop_2332:
	mova	%xcc,	%i0,	%g6
	tsubcctv	%i7,	%i2,	%o4
	membar	0x27
	sll	%o0,	0x10,	%g1
	bcc	%xcc,	loop_2333
	andcc	%o1,	0x0043,	%l4
	edge8	%o3,	%g7,	%o2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x19,	%l2,	%g3
loop_2333:
	edge8ln	%l5,	%i5,	%l6
	nop
	set	0x78, %g7
	ldstub	[%l7 + %g7],	%l3
	te	%xcc,	0x1
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x58] %asi,	%f11
	srlx	%i6,	%o6,	%i3
	movcs	%xcc,	%g4,	%l0
	fornot2s	%f2,	%f11,	%f17
	addc	%l1,	%g2,	%i4
	ldd	[%l7 + 0x30],	%i0
	nop
	setx	loop_2334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0x7397A3A3805F19A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	popc	%o7,	%o5
	nop
	fitos	%f6,	%f4
	fstoi	%f4,	%f20
loop_2334:
	brz	%g5,	loop_2335
	fcmpeq16	%f2,	%f2,	%g6
	fone	%f26
	fmovrslez	%i0,	%f1,	%f2
loop_2335:
	bneg,pn	%icc,	loop_2336
	nop
	setx	0x4A26DB025BF99F66,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x8607452FBA35600C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f18,	%f18
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x3A] %asi,	%i7
loop_2336:
	movge	%xcc,	%o4,	%o0
	fbg,a	%fcc1,	loop_2337
	fands	%f7,	%f19,	%f16
	tge	%xcc,	0x1
	tg	%xcc,	0x6
loop_2337:
	fpsub32s	%f29,	%f2,	%f26
	edge32l	%g1,	%o1,	%l4
	fxnors	%f3,	%f8,	%f1
	edge8n	%o3,	%g7,	%i2
	nop
	setx	loop_2338,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxors	%f10,	%f22,	%f8
	udivcc	%l2,	0x1C2E,	%o2
	ldx	[%l7 + 0x10],	%l5
loop_2338:
	movrgez	%i5,	0x01D,	%g3
	tneg	%xcc,	0x1
	edge32l	%l6,	%i6,	%l3
	sll	%o6,	0x0F,	%i3
	smul	%l0,	0x1829,	%l1
	fmovscs	%icc,	%f29,	%f28
	xorcc	%g4,	0x15E5,	%i4
	mulx	%g2,	0x0D86,	%o7
	movrgz	%o5,	0x227,	%g5
	udivx	%i1,	0x0194,	%i0
	tpos	%xcc,	0x0
	tsubcctv	%g6,	%o4,	%i7
	fsrc2s	%f14,	%f1
	add	%g1,	0x0056,	%o1
	fandnot1	%f16,	%f8,	%f18
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%l4
	bpos,a	%icc,	loop_2339
	bl,pt	%icc,	loop_2340
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge,a	%fcc2,	loop_2341
loop_2339:
	fbuge,a	%fcc0,	loop_2342
loop_2340:
	bneg,a	%xcc,	loop_2343
	fpack16	%f26,	%f29
loop_2341:
	nop
	set	0x6D, %l3
	ldsba	[%l7 + %l3] 0x15,	%o3
loop_2342:
	fbug,a	%fcc0,	loop_2344
loop_2343:
	fbl,a	%fcc0,	loop_2345
	movcs	%xcc,	%g7,	%o0
	nop
	setx	0x5B0BA5190386B19C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x29E4E1C1E9FCF922,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f14,	%f22
loop_2344:
	sll	%l2,	%i2,	%o2
loop_2345:
	movrne	%l5,	0x157,	%g3
	bvs,a	loop_2346
	flush	%l7 + 0x2C
	fbe,a	%fcc2,	loop_2347
	fmovsle	%xcc,	%f4,	%f22
loop_2346:
	brlz,a	%i5,	loop_2348
	fmovdpos	%xcc,	%f29,	%f15
loop_2347:
	fmovrsgez	%i6,	%f27,	%f27
	swap	[%l7 + 0x78],	%l6
loop_2348:
	fcmpeq32	%f26,	%f24,	%l3
	faligndata	%f20,	%f2,	%f4
	edge32n	%i3,	%l0,	%l1
	brgez	%g4,	loop_2349
	tgu	%icc,	0x7
	taddcctv	%i4,	%g2,	%o6
	stw	%o5,	[%l7 + 0x60]
loop_2349:
	fsrc2	%f22,	%f2
	tvc	%xcc,	0x3
	fandnot2	%f2,	%f18,	%f24
	sdivcc	%g5,	0x157B,	%o7
	movg	%xcc,	%i1,	%g6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%i0
	fcmpeq32	%f24,	%f14,	%i7
	flush	%l7 + 0x60
	addc	%g1,	0x1BF5,	%o1
	add	%o4,	%l4,	%o3
	edge8n	%g7,	%o0,	%i2
	fmovrsne	%o2,	%f4,	%f8
	fblg	%fcc2,	loop_2350
	tge	%icc,	0x1
	addcc	%l5,	0x02EE,	%l2
	movrlz	%i5,	0x338,	%g3
loop_2350:
	fmovscs	%xcc,	%f9,	%f22
	movleu	%xcc,	%i6,	%l6
	fmul8x16	%f8,	%f16,	%f28
	addcc	%i3,	%l3,	%l0
	fbe	%fcc0,	loop_2351
	stw	%g4,	[%l7 + 0x68]
	array32	%i4,	%l1,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2351:
	nop
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x19,	%f0
	movcc	%icc,	%o5,	%g2
	edge32	%g5,	%o7,	%i1
	fcmpne32	%f2,	%f24,	%i0
	tpos	%xcc,	0x4
	sdiv	%i7,	0x0926,	%g6
	alignaddr	%g1,	%o4,	%l4
	movrgez	%o3,	%g7,	%o1
	tgu	%xcc,	0x4
	tge	%xcc,	0x7
	taddcctv	%o0,	0x1D9F,	%o2
	xnor	%l5,	%i2,	%i5
	fands	%f14,	%f15,	%f30
	nop
	setx	0x25AED4311AA7A478,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f10
	nop
	setx	0x405EC4C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	edge16ln	%g3,	%l2,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i3,	%l3,	%i6
	srlx	%l0,	%g4,	%l1
	movrlez	%i4,	0x17F,	%o6
	orcc	%g2,	%g5,	%o7
	fblg,a	%fcc2,	loop_2352
	fmuld8sux16	%f0,	%f26,	%f22
	nop
	fitos	%f11,	%f18
	fstod	%f18,	%f4
	orncc	%o5,	0x1E4D,	%i0
loop_2352:
	st	%f20,	[%l7 + 0x7C]
	umulcc	%i1,	%i7,	%g6
	ble,pn	%icc,	loop_2353
	nop
	fitos	%f24,	%f31
	nop
	set	0x64, %o7
	stb	%g1,	[%l7 + %o7]
	sll	%o4,	0x12,	%o3
loop_2353:
	edge16l	%l4,	%g7,	%o0
	andn	%o1,	0x16B6,	%l5
	array8	%i2,	%o2,	%g3
	tvs	%icc,	0x0
	tsubcctv	%i5,	%l6,	%i3
	xor	%l3,	0x0980,	%i6
	ba	loop_2354
	sra	%l2,	%g4,	%l1
	fandnot2	%f12,	%f16,	%f4
	fmovspos	%xcc,	%f20,	%f4
loop_2354:
	bvc,pn	%icc,	loop_2355
	tvc	%icc,	0x0
	sllx	%i4,	0x09,	%l0
	movrne	%g2,	0x0EA,	%o6
loop_2355:
	nop
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x6E] %asi,	%o7
	brlez,a	%o5,	loop_2356
	tle	%xcc,	0x2
	move	%icc,	%i0,	%g5
	bvc,a,pt	%icc,	loop_2357
loop_2356:
	edge8n	%i1,	%i7,	%g6
	brnz	%o4,	loop_2358
	ba,a	loop_2359
loop_2357:
	or	%g1,	0x0EFD,	%l4
	bl	loop_2360
loop_2358:
	andn	%g7,	0x0237,	%o0
loop_2359:
	fmovsne	%icc,	%f10,	%f27
	movrgez	%o3,	0x0D4,	%o1
loop_2360:
	movvc	%icc,	%i2,	%l5
	lduw	[%l7 + 0x28],	%g3
	fbu	%fcc3,	loop_2361
	movn	%xcc,	%o2,	%i5
	stw	%i3,	[%l7 + 0x5C]
	xnor	%l6,	%i6,	%l3
loop_2361:
	srl	%g4,	%l1,	%l2
	bl,pt	%xcc,	loop_2362
	fnot1	%f2,	%f8
	movg	%xcc,	%i4,	%g2
	movle	%xcc,	%l0,	%o6
loop_2362:
	tg	%xcc,	0x1
	subcc	%o5,	%o7,	%i0
	movrlez	%i1,	%g5,	%i7
	movrne	%o4,	%g1,	%g6
	ldub	[%l7 + 0x69],	%l4
	sethi	0x1A93,	%o0
	fbue,a	%fcc3,	loop_2363
	addccc	%g7,	0x0E34,	%o3
	mulx	%i2,	0x176D,	%l5
	tg	%icc,	0x1
loop_2363:
	tcc	%xcc,	0x0
	sub	%o1,	0x196A,	%g3
	edge8ln	%o2,	%i3,	%l6
	nop
	setx	0xCC6B5F9DAFA58980,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xAB8D3AD3D8224654,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f16,	%f22
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x14,	%f16
	brgez,a	%i5,	loop_2364
	udivx	%l3,	0x0D5F,	%i6
	fmovdpos	%icc,	%f15,	%f11
	tvs	%xcc,	0x3
loop_2364:
	fmul8x16al	%f10,	%f5,	%f28
	tsubcctv	%g4,	%l2,	%i4
	tne	%icc,	0x4
	ldd	[%l7 + 0x28],	%l0
	fba	%fcc3,	loop_2365
	udivx	%g2,	0x0835,	%o6
	set	0x18, %i1
	ldxa	[%g0 + %i1] 0x50,	%l0
loop_2365:
	fmovsneg	%xcc,	%f20,	%f5
	smul	%o7,	%o5,	%i0
	set	0x24, %l4
	stwa	%g5,	[%l7 + %l4] 0xeb
	membar	#Sync
	nop
	fitos	%f2,	%f7
	and	%i1,	0x1095,	%o4
	tgu	%icc,	0x5
	bcc,a	%xcc,	loop_2366
	tpos	%icc,	0x2
	fands	%f23,	%f12,	%f21
	std	%f2,	[%l7 + 0x30]
loop_2366:
	te	%xcc,	0x4
	tneg	%icc,	0x3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	faligndata	%f20,	%f12,	%f24
	srlx	%i7,	0x0D,	%l4
	array16	%g6,	%g7,	%o0
	array16	%i2,	%l5,	%o3
	xnorcc	%g3,	%o2,	%i3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o1
	nop
	setx	0x163F0B5D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f3
	nop
	setx	0xDB05CB3C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xCA1C1C35,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f15,	%f9
	tsubcc	%i5,	%l3,	%l6
	movrne	%g4,	%l2,	%i6
	bleu,a	loop_2367
	alignaddr	%i4,	%l1,	%o6
	nop
	setx	0xC066E117,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fpadd16s	%f9,	%f2,	%f27
loop_2367:
	ld	[%l7 + 0x44],	%f15
	tne	%xcc,	0x2
	fbl	%fcc2,	loop_2368
	udivcc	%g2,	0x1D98,	%o7
	brlez,a	%l0,	loop_2369
	tpos	%xcc,	0x6
loop_2368:
	subccc	%i0,	0x09A9,	%o5
	edge32l	%i1,	%o4,	%g5
loop_2369:
	brnz	%i7,	loop_2370
	srl	%l4,	0x0F,	%g6
	tcs	%icc,	0x0
	tge	%icc,	0x7
loop_2370:
	fbn,a	%fcc2,	loop_2371
	sir	0x0E44
	movrgez	%g1,	%o0,	%i2
	edge32	%l5,	%g7,	%o3
loop_2371:
	andcc	%o2,	%g3,	%o1
	movg	%icc,	%i3,	%i5
	bgu,pn	%xcc,	loop_2372
	edge32ln	%l3,	%g4,	%l2
	movn	%xcc,	%i6,	%i4
	tsubcctv	%l6,	%l1,	%g2
loop_2372:
	or	%o7,	0x04C5,	%l0
	fbuge,a	%fcc2,	loop_2373
	fmul8sux16	%f16,	%f24,	%f26
	nop
	setx	loop_2374,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%i0,	%o6,	%i1
loop_2373:
	srax	%o4,	0x1D,	%o5
	lduw	[%l7 + 0x78],	%i7
loop_2374:
	addcc	%l4,	%g5,	%g6
	sir	0x0473
	sir	0x01C4
	xnor	%g1,	0x09CA,	%o0
	movre	%l5,	0x018,	%i2
	fbo	%fcc0,	loop_2375
	for	%f18,	%f6,	%f22
	alignaddrl	%g7,	%o3,	%g3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x18,	%f0
loop_2375:
	alignaddr	%o1,	%i3,	%o2
	membar	0x5F
	mulscc	%l3,	%i5,	%g4
	edge32ln	%l2,	%i6,	%l6
	bn,a,pt	%xcc,	loop_2376
	sdiv	%l1,	0x19C6,	%g2
	set	0x08, %g5
	stha	%i4,	[%l7 + %g5] 0x2b
	membar	#Sync
loop_2376:
	fornot2	%f26,	%f8,	%f20
	addccc	%o7,	%l0,	%o6
	set	0x40, %i2
	sta	%f26,	[%l7 + %i2] 0x11
	umulcc	%i1,	%o4,	%o5
	xor	%i0,	%i7,	%g5
	fble,a	%fcc3,	loop_2377
	fbug	%fcc0,	loop_2378
	sdivx	%l4,	0x1BE1,	%g1
	sra	%g6,	%o0,	%i2
loop_2377:
	nop
	setx	loop_2379,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2378:
	movrlez	%l5,	0x062,	%g7
	movg	%icc,	%o3,	%g3
	movneg	%icc,	%o1,	%i3
loop_2379:
	movne	%icc,	%o2,	%i5
	movrlez	%g4,	0x13D,	%l3
	movrlz	%i6,	0x371,	%l2
	movrlz	%l1,	0x21D,	%g2
	umul	%l6,	0x1565,	%i4
	movrlz	%l0,	0x3A6,	%o6
	bvs	loop_2380
	bpos	loop_2381
	movne	%xcc,	%o7,	%i1
	tsubcc	%o4,	%i0,	%i7
loop_2380:
	ldstub	[%l7 + 0x34],	%g5
loop_2381:
	fmovdleu	%xcc,	%f31,	%f20
	movne	%icc,	%o5,	%g1
	tleu	%xcc,	0x6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g6,	%l4
	add	%i2,	0x1395,	%o0
	membar	0x59
	fmovda	%xcc,	%f5,	%f4
	array32	%l5,	%o3,	%g3
	sub	%g7,	0x0E78,	%o1
	orn	%o2,	%i3,	%i5
	tsubcctv	%g4,	%i6,	%l2
	fornot2	%f24,	%f6,	%f4
	fcmpgt32	%f18,	%f6,	%l3
	alignaddr	%g2,	%l1,	%l6
	tneg	%icc,	0x6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x40] %asi,	%f3
	movre	%i4,	%o6,	%l0
	sllx	%o7,	%i1,	%o4
	movge	%icc,	%i7,	%i0
	movg	%xcc,	%g5,	%o5
	fxnors	%f24,	%f15,	%f31
	andcc	%g6,	%l4,	%i2
	fornot2	%f12,	%f24,	%f30
	fcmpne16	%f6,	%f8,	%o0
	srax	%l5,	0x03,	%o3
	movgu	%icc,	%g1,	%g3
	bneg	loop_2382
	mulscc	%g7,	%o1,	%i3
	udivx	%i5,	0x143C,	%o2
	orn	%g4,	0x0C1A,	%i6
loop_2382:
	nop
	set	0x60, %g3
	ldsw	[%l7 + %g3],	%l3
	movleu	%icc,	%l2,	%g2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x20] %asi,	%l6
	movrlez	%i4,	%o6,	%l0
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x77] %asi,	%l1
	udivx	%i1,	0x02EF,	%o7
	subc	%o4,	%i7,	%g5
	fors	%f30,	%f19,	%f11
	taddcctv	%i0,	0x0C5A,	%o5
	movrlez	%g6,	%l4,	%i2
	tcc	%icc,	0x6
	fand	%f16,	%f16,	%f2
	set	0x34, %o1
	sta	%f11,	[%l7 + %o1] 0x88
	tn	%icc,	0x1
	sethi	0x0490,	%o0
	movle	%xcc,	%l5,	%o3
	tsubcc	%g3,	0x0B65,	%g7
	andn	%g1,	%i3,	%o1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x04,	%o2,	%g4
	fmovrsne	%i6,	%f22,	%f22
	movcs	%icc,	%l3,	%i5
	fsrc1s	%f3,	%f15
	fmovdg	%icc,	%f18,	%f3
	addcc	%g2,	0x03ED,	%l2
	movrgez	%l6,	%i4,	%o6
	be,a	loop_2383
	array8	%l1,	%l0,	%i1
	fcmple16	%f18,	%f4,	%o4
	fmovsge	%xcc,	%f13,	%f15
loop_2383:
	movvs	%xcc,	%i7,	%o7
	tgu	%icc,	0x1
	srl	%g5,	%o5,	%g6
	std	%f30,	[%l7 + 0x30]
	srl	%i0,	0x0F,	%l4
	fmovdleu	%xcc,	%f9,	%f0
	set	0x68, %i0
	sta	%f22,	[%l7 + %i0] 0x18
	orn	%o0,	0x12C4,	%i2
	movcs	%icc,	%l5,	%o3
	fabsd	%f24,	%f12
	sra	%g3,	0x00,	%g7
	fnegs	%f3,	%f3
	fnand	%f18,	%f4,	%f2
	umul	%i3,	%g1,	%o2
	tvc	%icc,	0x7
	be	loop_2384
	array16	%o1,	%i6,	%g4
	fmovdvs	%xcc,	%f16,	%f19
	nop
	setx	0xA8205C011292699C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xA8A0260F1780D794,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f4,	%f30
loop_2384:
	membar	0x66
	edge32n	%i5,	%g2,	%l2
	brnz	%l6,	loop_2385
	tneg	%xcc,	0x3
	edge8n	%l3,	%o6,	%l1
	bcc,a	loop_2386
loop_2385:
	sdivx	%i4,	0x1510,	%l0
	fbg	%fcc1,	loop_2387
	andncc	%i1,	%o4,	%i7
loop_2386:
	orn	%o7,	0x0648,	%o5
	movle	%icc,	%g5,	%i0
loop_2387:
	bcs,a	%xcc,	loop_2388
	movre	%g6,	%l4,	%o0
	xor	%i2,	%o3,	%g3
	fbule,a	%fcc3,	loop_2389
loop_2388:
	fmovrslez	%g7,	%f4,	%f28
	fmovdge	%xcc,	%f21,	%f10
	ldstub	[%l7 + 0x18],	%l5
loop_2389:
	edge8ln	%i3,	%g1,	%o1
	smul	%o2,	0x1DCE,	%i6
	movge	%icc,	%i5,	%g2
	ld	[%l7 + 0x70],	%f23
	fpsub16s	%f20,	%f29,	%f8
	sub	%g4,	%l6,	%l3
	sll	%l2,	%o6,	%l1
	bcs,pn	%icc,	loop_2390
	ble,pt	%icc,	loop_2391
	nop
	fitod	%f0,	%f26
	tsubcctv	%i4,	%l0,	%o4
loop_2390:
	movrne	%i1,	0x0FE,	%i7
loop_2391:
	udivcc	%o7,	0x1C60,	%o5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x42] %asi,	%i0
	fpadd32	%f28,	%f30,	%f10
	tcc	%icc,	0x4
	ba,a,pn	%xcc,	loop_2392
	movpos	%xcc,	%g6,	%g5
	addc	%l4,	0x048C,	%o0
	ldsw	[%l7 + 0x64],	%o3
loop_2392:
	fmovda	%xcc,	%f2,	%f4
	mulx	%i2,	%g7,	%g3
	movgu	%xcc,	%i3,	%l5
	tg	%xcc,	0x5
	fmovspos	%icc,	%f19,	%f26
	fornot2	%f12,	%f22,	%f30
	tvs	%icc,	0x4
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
	nop
	setx	0x98099FFA605E7F2D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	tsubcctv	%i6,	%i5,	%g2
	fmovsvc	%icc,	%f1,	%f14
	fmovdcc	%icc,	%f26,	%f12
	fxor	%f24,	%f10,	%f16
	sllx	%g4,	0x0F,	%o2
	bcc,a	loop_2393
	edge8ln	%l3,	%l6,	%o6
	alignaddr	%l1,	%l2,	%l0
	nop
	setx	0xAA317901,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xCBAB1B27,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f25,	%f14
loop_2393:
	fmovsn	%xcc,	%f14,	%f7
	edge16l	%i4,	%i1,	%i7
	tcc	%xcc,	0x7
	sllx	%o4,	0x01,	%o5
	fbge	%fcc0,	loop_2394
	fbu	%fcc1,	loop_2395
	fblg	%fcc1,	loop_2396
	brgz,a	%i0,	loop_2397
loop_2394:
	nop
	setx	loop_2398,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2395:
	fcmpeq32	%f14,	%f6,	%g6
loop_2396:
	bvs,pt	%icc,	loop_2399
loop_2397:
	edge32l	%g5,	%l4,	%o7
loop_2398:
	movg	%icc,	%o3,	%i2
	array16	%g7,	%o0,	%i3
loop_2399:
	orn	%l5,	%g3,	%o1
	fbg	%fcc1,	loop_2400
	swap	[%l7 + 0x60],	%i6
	smul	%g1,	0x1283,	%i5
	edge16ln	%g4,	%g2,	%l3
loop_2400:
	nop
	setx	loop_2401,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%l6,	%o6,	%l1
	fpsub32s	%f28,	%f15,	%f2
	move	%icc,	%o2,	%l0
loop_2401:
	movrlz	%l2,	0x3DE,	%i4
	array32	%i1,	%o4,	%o5
	fbge	%fcc2,	loop_2402
	nop
	fitos	%f3,	%f1
	fstox	%f1,	%f22
	fxtos	%f22,	%f21
	edge8n	%i0,	%i7,	%g6
	lduh	[%l7 + 0x7E],	%g5
loop_2402:
	edge8ln	%l4,	%o3,	%o7
	set	0x38, %i6
	prefetcha	[%l7 + %i6] 0x80,	 0x2
	fpsub32	%f28,	%f20,	%f4
	xnor	%i2,	%o0,	%l5
	brgz,a	%i3,	loop_2403
	faligndata	%f2,	%f30,	%f8
	bleu,pn	%icc,	loop_2404
	edge8	%o1,	%i6,	%g3
loop_2403:
	sir	0x145A
	movcc	%xcc,	%i5,	%g4
loop_2404:
	fbe	%fcc3,	loop_2405
	ldsw	[%l7 + 0x20],	%g1
	edge32l	%l3,	%l6,	%o6
	stx	%l1,	[%l7 + 0x60]
loop_2405:
	fblg,a	%fcc2,	loop_2406
	edge16l	%g2,	%l0,	%o2
	array8	%i4,	%l2,	%i1
	orncc	%o4,	%i0,	%i7
loop_2406:
	nop
	set	0x6C, %i3
	ldswa	[%l7 + %i3] 0x89,	%o5
	set	0x18, %o3
	swapa	[%l7 + %o3] 0x0c,	%g5
	udivcc	%g6,	0x005D,	%l4
	set	0x1E, %o4
	lduba	[%l7 + %o4] 0x14,	%o3
	movcs	%icc,	%g7,	%o7
	tvc	%icc,	0x3
	nop
	setx	0xD45C889E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f26
	fpsub16s	%f4,	%f21,	%f24
	ldsh	[%l7 + 0x7C],	%o0
	udivx	%i2,	0x0728,	%l5
	fmovdpos	%icc,	%f10,	%f9
	smul	%o1,	%i6,	%i3
	set	0x40, %o2
	stxa	%g3,	[%l7 + %o2] 0x04
	brz	%i5,	loop_2407
	fbg,a	%fcc3,	loop_2408
	and	%g4,	0x0BD9,	%g1
	movgu	%icc,	%l3,	%o6
loop_2407:
	fbe,a	%fcc1,	loop_2409
loop_2408:
	movcc	%icc,	%l1,	%l6
	array8	%l0,	%g2,	%o2
	ba,pn	%icc,	loop_2410
loop_2409:
	movg	%icc,	%i4,	%l2
	addcc	%i1,	0x1218,	%i0
	nop
	fitos	%f15,	%f16
loop_2410:
	nop
	fitod	%f12,	%f30
	fdtoi	%f30,	%f28
	nop
	setx	0xE4A60780892C1B65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x9CAB3ECD9B255C9B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f24,	%f4
	bne,pt	%xcc,	loop_2411
	movvs	%icc,	%o4,	%o5
	sll	%g5,	%g6,	%i7
	nop
	setx	loop_2412,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2411:
	nop
	setx	loop_2413,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tgu	%xcc,	0x3
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0xf9,	%f0
loop_2412:
	fcmpne32	%f24,	%f28,	%l4
loop_2413:
	fbo	%fcc1,	loop_2414
	add	%o3,	0x0916,	%g7
	stw	%o0,	[%l7 + 0x4C]
	ldsb	[%l7 + 0x0E],	%i2
loop_2414:
	movrgez	%o7,	0x133,	%o1
	ta	%xcc,	0x5
	set	0x4F, %l6
	stba	%i6,	[%l7 + %l6] 0x04
	sir	0x0AF1
	smul	%l5,	%i3,	%g3
	subc	%i5,	%g1,	%g4
	umul	%o6,	0x1AF6,	%l3
	set	0x63, %l1
	ldsba	[%l7 + %l1] 0x0c,	%l6
	orn	%l0,	%g2,	%l1
	tg	%icc,	0x4
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	addccc	%i4,	0x0563,	%l2
	xorcc	%o2,	%i0,	%o4
	subcc	%o5,	0x18D1,	%g5
	fcmpgt16	%f16,	%f12,	%i1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i7,	%l4
	fbo,a	%fcc1,	loop_2415
	movl	%xcc,	%g6,	%o3
	brlz,a	%g7,	loop_2416
	taddcc	%i2,	%o7,	%o1
loop_2415:
	fbu	%fcc2,	loop_2417
	fmovdcc	%xcc,	%f0,	%f17
loop_2416:
	movge	%icc,	%i6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2417:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x48] %asi,	%l5
	edge32ln	%i3,	%i5,	%g1
	fmovdpos	%xcc,	%f2,	%f0
	orncc	%g3,	%o6,	%g4
	xor	%l6,	%l3,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f7,	%f1
	ldstub	[%l7 + 0x26],	%l0
	movvc	%icc,	%i4,	%l2
	fpackfix	%f22,	%f17
	tgu	%xcc,	0x4
	umul	%o2,	%l1,	%i0
	stb	%o4,	[%l7 + 0x12]
	movrgez	%g5,	0x27C,	%o5
	brlz	%i1,	loop_2418
	fbug	%fcc0,	loop_2419
	tne	%icc,	0x1
	bneg,pn	%xcc,	loop_2420
loop_2418:
	brz,a	%l4,	loop_2421
loop_2419:
	bn,a	%xcc,	loop_2422
	tvs	%xcc,	0x4
loop_2420:
	nop
	set	0x6C, %g2
	ldstuba	[%l7 + %g2] 0x04,	%g6
loop_2421:
	fbuge,a	%fcc2,	loop_2423
loop_2422:
	movrgez	%o3,	0x2FA,	%i7
	fmovsgu	%icc,	%f24,	%f23
	fbl	%fcc0,	loop_2424
loop_2423:
	andcc	%i2,	%g7,	%o1
	movrlez	%i6,	0x23C,	%o0
	and	%l5,	0x1ABF,	%o7
loop_2424:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f5,	[%l7 + 0x50] %asi
	movre	%i5,	0x2C5,	%i3
	nop
	setx	0xAE73D3C1D110DF45,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xEAF61E9117170E61,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f18,	%f6
	tn	%icc,	0x6
	tvs	%icc,	0x3
	andn	%g3,	0x1369,	%g1
	sdiv	%g4,	0x1108,	%l6
	edge8l	%o6,	%g2,	%l0
	movrne	%i4,	%l2,	%o2
	movrgez	%l3,	0x038,	%i0
	fmul8x16al	%f21,	%f12,	%f28
	brgz	%o4,	loop_2425
	fba	%fcc0,	loop_2426
	sethi	0x1646,	%l1
	movgu	%icc,	%g5,	%o5
loop_2425:
	fandnot1	%f12,	%f14,	%f2
loop_2426:
	movrgez	%l4,	0x25C,	%g6
	bcs,a,pn	%icc,	loop_2427
	fsrc1s	%f25,	%f22
	fmovrdgz	%i1,	%f14,	%f22
	fmovsn	%icc,	%f19,	%f15
loop_2427:
	fpack16	%f20,	%f29
	bleu	%xcc,	loop_2428
	movvc	%icc,	%i7,	%i2
	sll	%o3,	0x15,	%g7
	fbo,a	%fcc3,	loop_2429
loop_2428:
	array16	%o1,	%i6,	%l5
	subc	%o0,	0x1A32,	%o7
	fblg	%fcc3,	loop_2430
loop_2429:
	sra	%i5,	%g3,	%i3
	fmovrdne	%g4,	%f28,	%f12
	movrgz	%g1,	%o6,	%l6
loop_2430:
	sir	0x1D3E
	set	0x2A, %i4
	stha	%l0,	[%l7 + %i4] 0x0c
	sllx	%i4,	0x05,	%l2
	fpsub32s	%f25,	%f5,	%f31
	tle	%xcc,	0x5
	popc	%o2,	%l3
	wr	%g0,	0x81,	%asi
	stha	%i0,	[%l7 + 0x0C] %asi
	mulx	%g2,	%o4,	%g5
	nop
	fitos	%f12,	%f8
	mova	%icc,	%o5,	%l1
	fmovdvs	%xcc,	%f20,	%f27
	movl	%icc,	%l4,	%i1
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x74] %asi,	%i7
	fbuge	%fcc1,	loop_2431
	ble,a,pn	%icc,	loop_2432
	nop
	fitos	%f21,	%f31
	fmovsvs	%xcc,	%f2,	%f12
loop_2431:
	nop
	setx	0x22704A707306AC4A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f18
loop_2432:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x4E] %asi,	%g6
	ldsh	[%l7 + 0x44],	%o3
	movge	%icc,	%g7,	%o1
	stw	%i2,	[%l7 + 0x58]
	bl	%icc,	loop_2433
	ta	%xcc,	0x1
	tpos	%icc,	0x4
	stx	%l5,	[%l7 + 0x18]
loop_2433:
	srl	%i6,	0x0D,	%o7
	fmul8x16	%f21,	%f18,	%f6
	alignaddr	%o0,	%g3,	%i5
	umul	%i3,	0x1CF3,	%g1
	fmovrdgz	%o6,	%f22,	%f2
	move	%icc,	%l6,	%l0
	bl	%xcc,	loop_2434
	fpmerge	%f7,	%f5,	%f28
	array8	%g4,	%i4,	%l2
	fpadd32	%f10,	%f0,	%f30
loop_2434:
	mulscc	%l3,	0x1A6A,	%o2
	tneg	%icc,	0x5
	smulcc	%i0,	0x0BAC,	%o4
	xnorcc	%g5,	0x0E97,	%o5
	fnot2s	%f15,	%f4
	fmovdvc	%xcc,	%f9,	%f12
	st	%f28,	[%l7 + 0x50]
	tsubcctv	%l1,	%g2,	%l4
	tl	%xcc,	0x0
	tle	%icc,	0x2
	movrlz	%i1,	0x38C,	%i7
	subcc	%g6,	%g7,	%o1
	movvs	%xcc,	%o3,	%i2
	fbn	%fcc2,	loop_2435
	fbge	%fcc0,	loop_2436
	subccc	%l5,	0x1622,	%o7
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x24] %asi,	%f24
loop_2435:
	ldx	[%l7 + 0x68],	%o0
loop_2436:
	bcc,a,pn	%xcc,	loop_2437
	smul	%g3,	%i5,	%i6
	sdivcc	%g1,	0x02C1,	%i3
	movgu	%xcc,	%l6,	%o6
loop_2437:
	ld	[%l7 + 0x1C],	%f30
	mova	%xcc,	%g4,	%i4
	taddcc	%l2,	%l0,	%l3
	andcc	%o2,	0x0722,	%o4
	sra	%i0,	%g5,	%l1
	tgu	%xcc,	0x3
	fornot1	%f0,	%f28,	%f24
	sethi	0x0D5A,	%g2
	movrlez	%l4,	%o5,	%i1
	fbu	%fcc1,	loop_2438
	edge32n	%g6,	%g7,	%o1
	fba	%fcc1,	loop_2439
	movl	%xcc,	%o3,	%i2
loop_2438:
	fcmple32	%f0,	%f8,	%l5
	bneg,a,pn	%xcc,	loop_2440
loop_2439:
	nop
	setx	0xBE4D3DA16E635B26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xC12194C1284414B8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f18,	%f26
	orn	%o7,	0x0C13,	%o0
	sllx	%g3,	%i7,	%i5
loop_2440:
	fmovdvc	%icc,	%f25,	%f0
	smulcc	%g1,	%i6,	%i3
	ble	loop_2441
	pdist	%f6,	%f18,	%f2
	fmovrslez	%o6,	%f19,	%f11
	fbne	%fcc1,	loop_2442
loop_2441:
	subccc	%g4,	0x00E7,	%i4
	fmovsvs	%xcc,	%f20,	%f2
	tl	%icc,	0x6
loop_2442:
	movcc	%xcc,	%l2,	%l6
	edge16n	%l0,	%l3,	%o4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x54] %asi,	%i0
	nop
	setx	0x20677411,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	std	%f14,	[%l7 + 0x30]
	tn	%icc,	0x2
	movn	%xcc,	%g5,	%l1
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x4A] %asi,	%o2
	fcmpgt16	%f30,	%f6,	%l4
	movcc	%xcc,	%o5,	%i1
	tgu	%xcc,	0x2
	udivx	%g2,	0x10AE,	%g6
	tl	%icc,	0x1
	fmovspos	%xcc,	%f23,	%f1
	addc	%o1,	0x10FA,	%g7
	alignaddrl	%o3,	%l5,	%o7
	udivcc	%i2,	0x0841,	%g3
	fbe,a	%fcc1,	loop_2443
	ba	%icc,	loop_2444
	fnot1s	%f29,	%f20
	or	%o0,	0x1755,	%i5
loop_2443:
	movleu	%icc,	%g1,	%i6
loop_2444:
	fmovrslz	%i3,	%f19,	%f27
	tleu	%xcc,	0x2
	sdivx	%o6,	0x10C6,	%i7
	edge32l	%g4,	%i4,	%l6
	sra	%l2,	0x1F,	%l0
	fcmple32	%f8,	%f10,	%l3
	fmovdle	%icc,	%f3,	%f15
	fbn	%fcc1,	loop_2445
	sll	%i0,	0x15,	%o4
	stx	%l1,	[%l7 + 0x68]
	alignaddr	%g5,	%l4,	%o5
loop_2445:
	te	%xcc,	0x5
	srax	%o2,	%g2,	%i1
	fpsub32	%f4,	%f22,	%f0
	swap	[%l7 + 0x20],	%o1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%g6
	nop
	setx	0x80423F17,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	bcc,a	loop_2446
	bvc	loop_2447
	ldstub	[%l7 + 0x59],	%l5
	te	%xcc,	0x6
loop_2446:
	movrne	%o7,	0x1BC,	%i2
loop_2447:
	nop
	set	0x78, %o5
	lduha	[%l7 + %o5] 0x11,	%o3
	mulscc	%o0,	%i5,	%g3
	srax	%g1,	0x02,	%i6
	fblg,a	%fcc3,	loop_2448
	move	%icc,	%i3,	%o6
	move	%xcc,	%i7,	%g4
	te	%icc,	0x2
loop_2448:
	smulcc	%l6,	0x1A66,	%l2
	array32	%l0,	%i4,	%i0
	nop
	setx	loop_2449,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	swap	[%l7 + 0x5C],	%l3
	set	0x20, %l2
	ldda	[%l7 + %l2] 0x81,	%l0
loop_2449:
	ta	%xcc,	0x3
	edge16l	%g5,	%o4,	%l4
	set	0x38, %i7
	lduha	[%l7 + %i7] 0x80,	%o5
	membar	0x54
	brlz	%g2,	loop_2450
	bleu,a	%xcc,	loop_2451
	stbar
	ldstub	[%l7 + 0x27],	%i1
loop_2450:
	sdivcc	%o2,	0x05E6,	%g7
loop_2451:
	fbul,a	%fcc2,	loop_2452
	tleu	%icc,	0x6
	sdivcc	%g6,	0x1075,	%o1
	set	0x30, %o0
	ldstuba	[%l7 + %o0] 0x04,	%l5
loop_2452:
	bcs,pt	%xcc,	loop_2453
	movrlez	%i2,	0x17F,	%o3
	nop
	fitos	%f10,	%f6
	fstoi	%f6,	%f31
	movrgez	%o0,	%o7,	%i5
loop_2453:
	tl	%icc,	0x3
	orcc	%g3,	0x0785,	%i6
	fnand	%f26,	%f28,	%f14
	fmovspos	%xcc,	%f15,	%f29
	fors	%f16,	%f2,	%f31
	sllx	%i3,	0x11,	%g1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x30] %asi,	%o6
	and	%i7,	%l6,	%l2
	nop
	setx	0xEE646B4F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x7B4C9F88,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f26,	%f13
	wr	%g0,	0xe3,	%asi
	stxa	%g4,	[%l7 + 0x48] %asi
	membar	#Sync
	xor	%l0,	%i4,	%i0
	ld	[%l7 + 0x38],	%f22
	prefetch	[%l7 + 0x28],	 0x1
	udivx	%l1,	0x0217,	%g5
	fxnors	%f7,	%f9,	%f12
	orncc	%l3,	%l4,	%o4
	tl	%xcc,	0x4
	nop
	fitos	%f3,	%f17
	fstox	%f17,	%f26
	fxtos	%f26,	%f28
	orcc	%o5,	0x1D4E,	%i1
	xnor	%o2,	%g2,	%g6
	ldstub	[%l7 + 0x61],	%o1
	alignaddrl	%g7,	%l5,	%o3
	fbuge	%fcc1,	loop_2454
	bl	%xcc,	loop_2455
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i2,	%o7
loop_2454:
	orncc	%i5,	%o0,	%g3
loop_2455:
	ldstub	[%l7 + 0x75],	%i6
	movrlez	%i3,	0x3F0,	%o6
	fbug,a	%fcc2,	loop_2456
	nop
	fitod	%f29,	%f18
	tgu	%icc,	0x6
	nop
	fitos	%f11,	%f16
	fstod	%f16,	%f26
loop_2456:
	array32	%g1,	%i7,	%l2
	edge32	%g4,	%l6,	%i4
	popc	0x1BAE,	%i0
	std	%f8,	[%l7 + 0x58]
	movn	%icc,	%l0,	%g5
	tvs	%icc,	0x7
	tle	%icc,	0x3
	fnors	%f26,	%f7,	%f7
	tneg	%icc,	0x3
	nop
	setx	loop_2457,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvs	loop_2458
	addc	%l1,	0x16A9,	%l4
	edge16	%o4,	%l3,	%i1
loop_2457:
	or	%o2,	%g2,	%o5
loop_2458:
	edge8l	%o1,	%g7,	%g6
	fbn,a	%fcc0,	loop_2459
	addc	%o3,	0x190E,	%i2
	fmovsneg	%xcc,	%f22,	%f17
	movcc	%xcc,	%o7,	%l5
loop_2459:
	fcmpeq32	%f0,	%f14,	%o0
	ld	[%l7 + 0x7C],	%f7
	fble	%fcc2,	loop_2460
	fpadd16s	%f13,	%f30,	%f23
	set	0x8, %g4
	stxa	%i5,	[%g0 + %g4] 0x21
loop_2460:
	tpos	%icc,	0x7
	edge32n	%g3,	%i3,	%o6
	fmovdge	%xcc,	%f23,	%f5
	edge8l	%i6,	%i7,	%g1
	sdivx	%l2,	0x108D,	%g4
	srlx	%i4,	%l6,	%i0
	tle	%icc,	0x6
	nop
	setx	loop_2461,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvs,a,pt	%icc,	loop_2462
	edge32	%g5,	%l1,	%l0
	fcmpeq16	%f22,	%f24,	%o4
loop_2461:
	movrlez	%l3,	0x33C,	%i1
loop_2462:
	movn	%xcc,	%l4,	%g2
	flush	%l7 + 0x40
	bpos,pt	%xcc,	loop_2463
	sll	%o2,	%o1,	%g7
	mulx	%o5,	%o3,	%g6
	bpos,a	loop_2464
loop_2463:
	movg	%icc,	%o7,	%i2
	subcc	%l5,	0x0306,	%o0
	fmovrslez	%i5,	%f4,	%f17
loop_2464:
	fba,a	%fcc2,	loop_2465
	sll	%g3,	%o6,	%i3
	set	0x68, %l0
	ldxa	[%l7 + %l0] 0x15,	%i7
loop_2465:
	or	%i6,	%l2,	%g4
	tcs	%icc,	0x0
	edge32n	%i4,	%g1,	%l6
	edge32l	%i0,	%g5,	%l0
	edge8	%l1,	%l3,	%i1
	andncc	%l4,	%o4,	%o2
	set	0x64, %i5
	stwa	%o1,	[%l7 + %i5] 0x19
	edge16ln	%g7,	%g2,	%o3
	edge16	%g6,	%o5,	%i2
	subc	%l5,	%o0,	%o7
	wr	%g0,	0x89,	%asi
	sta	%f24,	[%l7 + 0x60] %asi
	bge,a	%icc,	loop_2466
	orcc	%i5,	0x1EA7,	%g3
	fnot1s	%f17,	%f21
	bcc	loop_2467
loop_2466:
	tn	%icc,	0x3
	movrlez	%i3,	0x151,	%i7
	sir	0x1540
loop_2467:
	fmovrdne	%o6,	%f28,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i6,	%l2,	%i4
	fcmpgt16	%f22,	%f2,	%g1
	fmovsvs	%icc,	%f11,	%f21
	movge	%icc,	%g4,	%i0
	fbl,a	%fcc1,	loop_2468
	fblg,a	%fcc3,	loop_2469
	fbl	%fcc0,	loop_2470
	xnorcc	%g5,	0x1881,	%l6
loop_2468:
	edge16n	%l0,	%l1,	%i1
loop_2469:
	movrgz	%l4,	%l3,	%o4
loop_2470:
	fnot2s	%f3,	%f7
	movne	%xcc,	%o1,	%o2
	fmovsge	%icc,	%f14,	%f5
	taddcc	%g7,	%g2,	%g6
	movrgez	%o3,	0x03A,	%i2
	tge	%icc,	0x6
	tne	%icc,	0x7
	nop
	setx	loop_2471,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbule,a	%fcc0,	loop_2472
	ldsh	[%l7 + 0x4A],	%l5
	brgz,a	%o5,	loop_2473
loop_2471:
	call	loop_2474
loop_2472:
	fpack16	%f22,	%f15
	movne	%xcc,	%o7,	%o0
loop_2473:
	ldd	[%l7 + 0x20],	%f26
loop_2474:
	edge32	%g3,	%i3,	%i5
	or	%o6,	%i6,	%l2
	fcmpgt16	%f14,	%f12,	%i7
	stx	%g1,	[%l7 + 0x58]
	fnands	%f26,	%f17,	%f21
	nop
	setx	0x6CFDE7AF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xA071394C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f31,	%f13
	bg	%xcc,	loop_2475
	edge16n	%i4,	%g4,	%i0
	xnorcc	%g5,	%l0,	%l1
	fmovsg	%xcc,	%f1,	%f11
loop_2475:
	stb	%l6,	[%l7 + 0x09]
	sllx	%i1,	%l4,	%o4
	tvs	%icc,	0x6
	ld	[%l7 + 0x28],	%f0
	ldd	[%l7 + 0x30],	%l2
	movge	%icc,	%o1,	%g7
	fmovdl	%xcc,	%f16,	%f1
	tleu	%xcc,	0x1
	xnor	%g2,	%g6,	%o2
	smul	%o3,	0x1F78,	%l5
	fbe,a	%fcc2,	loop_2476
	fbule	%fcc3,	loop_2477
	bge,a,pn	%icc,	loop_2478
	xorcc	%i2,	0x1113,	%o7
loop_2476:
	fmovrdlez	%o5,	%f22,	%f24
loop_2477:
	membar	0x53
loop_2478:
	mova	%xcc,	%o0,	%g3
	wr	%g0,	0x89,	%asi
	stwa	%i3,	[%l7 + 0x30] %asi
	movge	%icc,	%o6,	%i5
	xor	%l2,	%i6,	%g1
	fmovdn	%xcc,	%f10,	%f0
	edge8l	%i7,	%g4,	%i4
	tleu	%icc,	0x4
	edge32	%g5,	%l0,	%i0
	xor	%l1,	0x1F9E,	%i1
	udiv	%l6,	0x1166,	%o4
	udivx	%l4,	0x0B89,	%o1
	tleu	%xcc,	0x2
	smul	%l3,	0x1044,	%g7
	edge16	%g6,	%o2,	%g2
	array8	%l5,	%i2,	%o3
	tg	%xcc,	0x7
	fzero	%f8
	fcmpeq16	%f16,	%f18,	%o5
	fmovrsgz	%o7,	%f6,	%f23
	tn	%icc,	0x2
	andn	%o0,	0x0B95,	%g3
	sethi	0x1D6C,	%o6
	tsubcc	%i5,	%i3,	%l2
	nop
	setx	0xA113184F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x9A1B3C11,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f4,	%f5
	fnot1s	%f7,	%f22
	be	%xcc,	loop_2479
	addc	%i6,	%i7,	%g4
	fmul8x16al	%f12,	%f19,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2479:
	movrlez	%g1,	0x2EA,	%g5
	set	0x58, %g7
	stwa	%i4,	[%l7 + %g7] 0x0c
	edge8l	%l0,	%l1,	%i1
	nop
	setx	loop_2480,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	be,a	loop_2481
	movrlez	%l6,	%i0,	%l4
	wr	%g0,	0x80,	%asi
	stha	%o4,	[%l7 + 0x38] %asi
loop_2480:
	edge32	%l3,	%o1,	%g7
loop_2481:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o2,	%g2,	%l5
	smul	%i2,	0x03EA,	%g6
	alignaddr	%o3,	%o7,	%o0
	nop
	setx	0xC052294A,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	orncc	%g3,	0x054A,	%o5
	udiv	%i5,	0x15BD,	%o6
	membar	0x22
	udiv	%l2,	0x127C,	%i6
	tneg	%xcc,	0x4
	bleu	loop_2482
	srlx	%i3,	%g4,	%i7
	tgu	%icc,	0x6
	tneg	%icc,	0x6
loop_2482:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x0
	fmovspos	%icc,	%f2,	%f31
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x74] %asi,	%g1
	orn	%g5,	%i4,	%l0
	alignaddrl	%i1,	%l6,	%l1
	sll	%i0,	0x1A,	%o4
	nop
	setx	0xE586B8C29074C9D2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	ldsb	[%l7 + 0x0E],	%l4
	nop
	setx	0xE2023FDE505731DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	taddcc	%o1,	0x187C,	%g7
	subc	%l3,	%g2,	%l5
	tg	%xcc,	0x7
	tgu	%icc,	0x1
	subccc	%i2,	%g6,	%o3
	tcs	%icc,	0x0
	addccc	%o7,	%o0,	%o2
	movn	%xcc,	%g3,	%o5
	srl	%o6,	%i5,	%l2
	fcmpne32	%f26,	%f26,	%i3
	fxor	%f6,	%f4,	%f30
	edge32n	%g4,	%i6,	%i7
	sub	%g5,	0x1DAB,	%g1
	fmovdg	%icc,	%f31,	%f11
	fbule	%fcc1,	loop_2483
	nop
	setx	0x879DF345006F746D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	nop
	setx	0xAAB16B42ED0FB73C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f26
	lduh	[%l7 + 0x1E],	%i4
loop_2483:
	tvc	%icc,	0x0
	sdivx	%l0,	0x094D,	%i1
	fble	%fcc0,	loop_2484
	edge8ln	%l6,	%i0,	%l1
	fble,a	%fcc3,	loop_2485
	fbl,a	%fcc2,	loop_2486
loop_2484:
	fnot2s	%f7,	%f23
	fmovdle	%icc,	%f25,	%f22
loop_2485:
	smul	%l4,	0x1264,	%o1
loop_2486:
	mulscc	%g7,	0x016E,	%o4
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	andn	%l3,	0x1715,	%l5
	fblg,a	%fcc0,	loop_2487
	edge32	%i2,	%o3,	%g6
	fmovrde	%o7,	%f24,	%f4
	xnor	%o2,	%o0,	%o5
loop_2487:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o6,	%i5,	%l2
	fpsub16	%f24,	%f6,	%f30
	movrlez	%g3,	%g4,	%i3
	fmovdgu	%xcc,	%f16,	%f31
	edge32ln	%i7,	%i6,	%g5
	bpos,a	%icc,	loop_2488
	fabss	%f14,	%f1
	srlx	%g1,	%l0,	%i1
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x13] %asi,	%l6
loop_2488:
	fones	%f9
	fmovsvs	%xcc,	%f9,	%f11
	movre	%i4,	%i0,	%l1
	addccc	%o1,	%g7,	%l4
	movleu	%icc,	%o4,	%l3
	sdiv	%l5,	0x07F3,	%i2
	nop
	setx	0xBCCA2FC4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xB31F7CA7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f0,	%f6
	bne,a	%icc,	loop_2489
	sub	%g2,	%g6,	%o3
	fmovrsgez	%o7,	%f15,	%f7
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o2
loop_2489:
	andcc	%o0,	0x12E2,	%o6
	edge8	%i5,	%o5,	%l2
	bcs,a	loop_2490
	bne,a,pn	%xcc,	loop_2491
	edge8n	%g4,	%g3,	%i7
	brnz	%i3,	loop_2492
loop_2490:
	fornot1s	%f9,	%f28,	%f28
loop_2491:
	addcc	%g5,	%i6,	%g1
	taddcc	%l0,	0x1872,	%l6
loop_2492:
	movl	%icc,	%i4,	%i1
	array32	%l1,	%o1,	%g7
	fbe,a	%fcc3,	loop_2493
	smulcc	%i0,	0x0C48,	%o4
	movrne	%l4,	0x30D,	%l5
	fpsub32s	%f23,	%f9,	%f2
loop_2493:
	ldstub	[%l7 + 0x50],	%i2
	mulx	%l3,	%g2,	%g6
	udivx	%o7,	0x1AD6,	%o3
	movrgz	%o2,	0x0C8,	%o6
	set	0x68, %g1
	stxa	%o0,	[%l7 + %g1] 0xe2
	membar	#Sync
	tgu	%icc,	0x3
	brlz,a	%o5,	loop_2494
	movrgez	%l2,	0x109,	%i5
	edge16l	%g3,	%i7,	%i3
	bcs,a	%icc,	loop_2495
loop_2494:
	edge16l	%g4,	%g5,	%i6
	fones	%f1
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x15,	%f0
loop_2495:
	sub	%l0,	%l6,	%i4
	alignaddrl	%i1,	%l1,	%g1
	nop
	set	0x48, %o7
	std	%f2,	[%l7 + %o7]
	nop
	setx	0x82DDC4581DE76D66,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xEA8C0BB66D2A0481,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f16,	%f30
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x76] %asi,	%g7
	fbo,a	%fcc3,	loop_2496
	movvs	%icc,	%i0,	%o1
	bne	%icc,	loop_2497
	fmovdle	%xcc,	%f20,	%f24
loop_2496:
	movrgez	%o4,	0x104,	%l5
	srlx	%i2,	%l4,	%g2
loop_2497:
	tcc	%xcc,	0x1
	movcc	%xcc,	%l3,	%o7
	nop
	setx	loop_2498,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%o3,	0x072A,	%o2
	ldx	[%l7 + 0x28],	%o6
	array32	%g6,	%o0,	%o5
loop_2498:
	prefetch	[%l7 + 0x10],	 0x1
	bgu,a,pn	%icc,	loop_2499
	bshuffle	%f4,	%f12,	%f26
	alignaddrl	%i5,	%g3,	%i7
	andcc	%i3,	%g4,	%l2
loop_2499:
	nop
	fitos	%f0,	%f15
	fstod	%f15,	%f4
	fbuge	%fcc2,	loop_2500
	fmovsge	%xcc,	%f16,	%f26
	fble	%fcc0,	loop_2501
	sdivcc	%i6,	0x18AD,	%g5
loop_2500:
	nop
	set	0x5C, %l5
	ldstuba	[%l7 + %l5] 0x10,	%l6
loop_2501:
	brgz,a	%i4,	loop_2502
	fble,a	%fcc1,	loop_2503
	sll	%i1,	0x09,	%l1
	udivx	%l0,	0x1EA5,	%g1
loop_2502:
	nop
	setx	loop_2504,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2503:
	movle	%xcc,	%i0,	%g7
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x26] %asi,	%o1
loop_2504:
	tn	%xcc,	0x2
	bneg,pn	%xcc,	loop_2505
	movcs	%icc,	%l5,	%i2
	umul	%o4,	0x15D6,	%g2
	tn	%icc,	0x1
loop_2505:
	nop
	set	0x48, %l4
	ldswa	[%l7 + %l4] 0x14,	%l4
	tle	%icc,	0x0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%o3
	fnegs	%f29,	%f17
	xnor	%o7,	%o2,	%g6
	array16	%o6,	%o0,	%i5
	edge16	%o5,	%i7,	%i3
	ta	%icc,	0x2
	tl	%xcc,	0x4
	bne,a	%xcc,	loop_2506
	ldd	[%l7 + 0x58],	%g2
	subc	%l2,	0x12B4,	%i6
	wr	%g0,	0x2a,	%asi
	stwa	%g4,	[%l7 + 0x14] %asi
	membar	#Sync
loop_2506:
	fbu	%fcc3,	loop_2507
	nop
	set	0x1B, %i1
	stb	%g5,	[%l7 + %i1]
	movrgz	%i4,	0x348,	%i1
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x70] %asi,	%i6
loop_2507:
	bge,a	%icc,	loop_2508
	edge8n	%l0,	%l1,	%i0
	ba,a,pn	%xcc,	loop_2509
	udivcc	%g7,	0x0998,	%o1
loop_2508:
	tneg	%icc,	0x7
	mulscc	%g1,	%i2,	%l5
loop_2509:
	movpos	%xcc,	%g2,	%l4
	edge8ln	%l3,	%o4,	%o3
	fpadd32s	%f12,	%f22,	%f7
	movrne	%o2,	%o7,	%g6
	fmovdcc	%xcc,	%f2,	%f8
	subc	%o0,	%i5,	%o5
	xnor	%i7,	%i3,	%g3
	movrlz	%o6,	%l2,	%g4
	brgez,a	%i6,	loop_2510
	movrlz	%g5,	0x340,	%i4
	bcs	loop_2511
	tn	%icc,	0x4
loop_2510:
	tgu	%xcc,	0x6
	fbu,a	%fcc3,	loop_2512
loop_2511:
	udivx	%l6,	0x148E,	%i1
	tvc	%icc,	0x3
	tcs	%xcc,	0x3
loop_2512:
	andncc	%l0,	%i0,	%l1
	andncc	%o1,	%g7,	%g1
	edge32	%l5,	%g2,	%i2
	edge8	%l3,	%l4,	%o3
	swap	[%l7 + 0x40],	%o4
	set	0x110, %g5
	ldxa	[%g0 + %g5] 0x21,	%o2
	fba,a	%fcc2,	loop_2513
	movcs	%xcc,	%g6,	%o7
	lduh	[%l7 + 0x16],	%o0
	nop
	setx	0xDBA8FF48B9BAD0E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x690A44496CE85A8E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f16,	%f14
loop_2513:
	fpsub16s	%f16,	%f9,	%f29
	tcs	%xcc,	0x7
	bg,pt	%xcc,	loop_2514
	fmovdgu	%icc,	%f2,	%f20
	swap	[%l7 + 0x70],	%i5
	fbne,a	%fcc3,	loop_2515
loop_2514:
	stx	%i7,	[%l7 + 0x28]
	move	%xcc,	%i3,	%o5
	sth	%o6,	[%l7 + 0x0C]
loop_2515:
	movcc	%icc,	%l2,	%g4
	set	0x20, %o6
	ldswa	[%l7 + %o6] 0x10,	%g3
	xnorcc	%g5,	0x0AE5,	%i6
	nop
	fitos	%f13,	%f15
	fstox	%f15,	%f16
	fxtos	%f16,	%f11
	edge32	%i4,	%i1,	%l6
	movg	%xcc,	%i0,	%l0
	subccc	%l1,	0x0898,	%g7
	addcc	%g1,	%o1,	%l5
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x27,	%g2
	set	0x18, %i2
	swapa	[%l7 + %i2] 0x89,	%i2
	addc	%l4,	%l3,	%o4
	edge32ln	%o3,	%o2,	%g6
	bleu,a	%xcc,	loop_2516
	fmovsvs	%icc,	%f8,	%f14
	edge8n	%o0,	%o7,	%i7
	movvc	%icc,	%i5,	%o5
loop_2516:
	srax	%o6,	0x02,	%l2
	edge32l	%g4,	%i3,	%g3
	wr	%g0,	0x89,	%asi
	stha	%g5,	[%l7 + 0x64] %asi
	bne	%xcc,	loop_2517
	tg	%xcc,	0x1
	te	%icc,	0x4
	fmovsne	%icc,	%f23,	%f27
loop_2517:
	srl	%i6,	0x07,	%i1
	ldstub	[%l7 + 0x49],	%i4
	edge16l	%l6,	%l0,	%i0
	bn,a,pn	%icc,	loop_2518
	edge8l	%g7,	%l1,	%o1
	udivcc	%g1,	0x1863,	%l5
	tg	%xcc,	0x3
loop_2518:
	fblg	%fcc0,	loop_2519
	popc	%i2,	%l4
	stx	%l3,	[%l7 + 0x60]
	sth	%g2,	[%l7 + 0x44]
loop_2519:
	fpadd16s	%f30,	%f17,	%f26
	addccc	%o3,	0x1C25,	%o4
	st	%f30,	[%l7 + 0x44]
	fxnors	%f8,	%f7,	%f24
	tle	%xcc,	0x0
	fbuge	%fcc3,	loop_2520
	ble,a	loop_2521
	tcc	%xcc,	0x5
	nop
	setx	loop_2522,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2520:
	stx	%o2,	[%l7 + 0x70]
loop_2521:
	lduh	[%l7 + 0x72],	%o0
	sdivcc	%o7,	0x0AF0,	%i7
loop_2522:
	mulscc	%i5,	0x1ED8,	%g6
	fbg	%fcc0,	loop_2523
	nop
	setx	0xF8DC0300,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x72DA3E1C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f10,	%f26
	brgez,a	%o6,	loop_2524
	bn,a,pt	%icc,	loop_2525
loop_2523:
	tl	%icc,	0x6
	set	0x38, %o1
	lduwa	[%l7 + %o1] 0x11,	%o5
loop_2524:
	movrgz	%l2,	%g4,	%g3
loop_2525:
	sdivcc	%g5,	0x0EBE,	%i6
	fmovrslz	%i3,	%f9,	%f3
	movrgz	%i1,	%l6,	%i4
	andn	%i0,	0x1A1C,	%g7
	tn	%xcc,	0x1
	udivcc	%l0,	0x1C14,	%o1
	taddcctv	%g1,	0x08AB,	%l1
	fmul8sux16	%f18,	%f16,	%f22
	fmovdg	%icc,	%f2,	%f9
	nop
	fitod	%f6,	%f20
	fdtoi	%f20,	%f17
	sethi	0x19BB,	%l5
	fbul,a	%fcc0,	loop_2526
	fbul	%fcc3,	loop_2527
	bn	loop_2528
	taddcctv	%l4,	%i2,	%l3
loop_2526:
	nop
	setx	loop_2529,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2527:
	movg	%icc,	%g2,	%o4
loop_2528:
	fmovscs	%xcc,	%f7,	%f26
	nop
	fitos	%f11,	%f7
	fstoi	%f7,	%f19
loop_2529:
	subccc	%o2,	%o0,	%o3
	fcmpne32	%f18,	%f30,	%i7
	smulcc	%o7,	%i5,	%g6
	addcc	%o6,	0x10E1,	%o5
	fmul8ulx16	%f8,	%f28,	%f12
	andncc	%g4,	%l2,	%g3
	nop
	setx	0xB86262D197004B1F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x4A626AB22096A7DF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f22,	%f10
	tpos	%icc,	0x5
	tn	%icc,	0x3
	fbuge	%fcc2,	loop_2530
	sllx	%g5,	%i6,	%i3
	movre	%l6,	%i1,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2530:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g7,	0x0C5E,	%l0
	subc	%o1,	%g1,	%i4
	array16	%l5,	%l1,	%i2
	nop
	setx	loop_2531,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	taddcc	%l3,	0x042D,	%g2
	fcmpne16	%f2,	%f22,	%l4
	xnorcc	%o2,	0x15E3,	%o4
loop_2531:
	subccc	%o0,	%i7,	%o7
	fpadd16	%f8,	%f18,	%f24
	taddcc	%i5,	0x1475,	%o3
	tn	%xcc,	0x3
	orncc	%o6,	0x146F,	%o5
	ldx	[%l7 + 0x50],	%g6
	bvs	loop_2532
	movneg	%icc,	%l2,	%g3
	mulx	%g5,	0x1CE1,	%i6
	fmovrdlez	%i3,	%f4,	%f16
loop_2532:
	fnot1s	%f26,	%f3
	movcs	%icc,	%l6,	%g4
	xnorcc	%i0,	%i1,	%g7
	movne	%xcc,	%o1,	%g1
	fmovdn	%xcc,	%f3,	%f7
	udivcc	%i4,	0x1B2D,	%l5
	xorcc	%l1,	0x1623,	%l0
	alignaddrl	%l3,	%i2,	%l4
	movcc	%icc,	%o2,	%g2
	umul	%o0,	%i7,	%o4
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x38] %asi,	%f22
	movrgez	%o7,	%i5,	%o3
	nop
	set	0x28, %i6
	ldd	[%l7 + %i6],	%f2
	tl	%xcc,	0x7
	fabsd	%f26,	%f30
	fbuge	%fcc2,	loop_2533
	fandnot1s	%f22,	%f20,	%f15
	tge	%xcc,	0x3
	st	%f23,	[%l7 + 0x0C]
loop_2533:
	movg	%xcc,	%o6,	%o5
	movrne	%l2,	0x2C0,	%g3
	popc	0x0E74,	%g5
	movl	%icc,	%i6,	%i3
	fmovrslz	%l6,	%f5,	%f31
	fxnors	%f24,	%f8,	%f22
	fmovdn	%xcc,	%f19,	%f9
	taddcctv	%g6,	0x12E0,	%g4
	tvc	%xcc,	0x7
	edge16l	%i1,	%g7,	%o1
	array16	%i0,	%i4,	%g1
	movle	%icc,	%l5,	%l1
	movpos	%xcc,	%l0,	%l3
	movle	%xcc,	%l4,	%i2
	set	0x18, %i0
	ldxa	[%l7 + %i0] 0x15,	%o2
	fmuld8sux16	%f1,	%f9,	%f30
	tn	%icc,	0x6
	andn	%o0,	0x1216,	%i7
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f0
	fxtod	%f0,	%f24
	edge32n	%g2,	%o7,	%o4
	sll	%o3,	%i5,	%o6
	fmovspos	%icc,	%f14,	%f27
	smulcc	%l2,	0x0ADE,	%o5
	bcs,a	%xcc,	loop_2534
	nop
	setx	loop_2535,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnor	%f26,	%f24,	%f30
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%g4
loop_2534:
	tge	%xcc,	0x2
loop_2535:
	fbuge,a	%fcc0,	loop_2536
	tleu	%icc,	0x3
	srl	%g3,	0x0C,	%i3
	fpack32	%f18,	%f30,	%f8
loop_2536:
	sdivcc	%i6,	0x0EDB,	%g6
	ble,pt	%xcc,	loop_2537
	edge16ln	%g4,	%l6,	%i1
	movrlez	%o1,	%i0,	%g7
	movneg	%xcc,	%i4,	%g1
loop_2537:
	srl	%l5,	%l0,	%l3
	fxnors	%f18,	%f24,	%f1
	movn	%icc,	%l1,	%i2
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x14
	be,pt	%xcc,	loop_2538
	fbug,a	%fcc2,	loop_2539
	addccc	%l4,	0x1562,	%o2
	wr	%g0,	0x80,	%asi
	stha	%o0,	[%l7 + 0x54] %asi
loop_2538:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%i7
loop_2539:
	fbn	%fcc0,	loop_2540
	fmovde	%icc,	%f19,	%f13
	sub	%o4,	%o3,	%i5
	movcc	%xcc,	%o7,	%o6
loop_2540:
	fbn	%fcc2,	loop_2541
	tpos	%icc,	0x4
	umulcc	%l2,	%o5,	%g3
	mova	%xcc,	%i3,	%g5
loop_2541:
	brgez,a	%i6,	loop_2542
	srl	%g4,	%g6,	%i1
	movgu	%icc,	%o1,	%l6
	fmovsneg	%xcc,	%f9,	%f3
loop_2542:
	fpadd32s	%f28,	%f13,	%f7
	edge8n	%i0,	%g7,	%i4
	movl	%icc,	%l5,	%g1
	ta	%icc,	0x4
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	alignaddr	%l3,	%l1,	%i2
	sdivx	%l4,	0x1B25,	%o2
	fblg	%fcc0,	loop_2543
	udivcc	%o0,	0x1B52,	%i7
	tvs	%xcc,	0x4
	srax	%o4,	%g2,	%i5
loop_2543:
	brlz,a	%o7,	loop_2544
	fmovda	%icc,	%f4,	%f3
	ldsh	[%l7 + 0x3E],	%o6
	brgz	%l2,	loop_2545
loop_2544:
	ldsh	[%l7 + 0x62],	%o3
	bneg,a,pn	%icc,	loop_2546
	fpadd32	%f14,	%f6,	%f30
loop_2545:
	fbule,a	%fcc1,	loop_2547
	bgu,a,pn	%xcc,	loop_2548
loop_2546:
	mova	%icc,	%o5,	%i3
	nop
	setx	loop_2549,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2547:
	and	%g3,	0x0681,	%i6
loop_2548:
	array8	%g5,	%g6,	%g4
	sll	%i1,	%o1,	%i0
loop_2549:
	nop
	setx	0x906E7DDD,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
	edge16l	%g7,	%l6,	%i4
	ldx	[%l7 + 0x30],	%l5
	subccc	%l0,	0x032C,	%g1
	subc	%l3,	%l1,	%i2
	bgu	loop_2550
	ba	loop_2551
	fbo,a	%fcc2,	loop_2552
	fbule	%fcc3,	loop_2553
loop_2550:
	fpadd32	%f28,	%f4,	%f4
loop_2551:
	tne	%icc,	0x2
loop_2552:
	taddcctv	%o2,	%o0,	%i7
loop_2553:
	nop
	setx	0x64952A6567ACD94B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x852FCDA768988C73,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f2,	%f18
	array32	%l4,	%g2,	%o4
	movgu	%xcc,	%o7,	%o6
	movcs	%icc,	%l2,	%i5
	wr	%g0,	0x80,	%asi
	stwa	%o3,	[%l7 + 0x54] %asi
	fandnot1	%f4,	%f22,	%f14
	edge32ln	%i3,	%g3,	%i6
	nop
	setx loop_2554, %l0, %l1
	jmpl %l1, %g5
	movre	%o5,	%g6,	%g4
	add	%o1,	%i0,	%i1
	brlz	%g7,	loop_2555
loop_2554:
	fcmpgt16	%f20,	%f18,	%l6
	set	0x6E, %o3
	stba	%l5,	[%l7 + %o3] 0x10
loop_2555:
	fornot1s	%f14,	%f27,	%f27
	sdivcc	%i4,	0x1CFF,	%g1
	fbg	%fcc0,	loop_2556
	fxnors	%f1,	%f0,	%f26
	set	0x58, %o2
	lduha	[%l7 + %o2] 0x19,	%l3
loop_2556:
	nop
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x89
	taddcctv	%l0,	0x073F,	%l1
	udivcc	%i2,	0x0D98,	%o2
	orncc	%o0,	0x0D4F,	%i7
	addcc	%g2,	%o4,	%o7
	movl	%icc,	%l4,	%o6
	sir	0x1C6C
	fmovdne	%xcc,	%f31,	%f28
	ldd	[%l7 + 0x68],	%i4
	set	0x56, %g6
	stba	%o3,	[%l7 + %g6] 0x89
	andcc	%i3,	%l2,	%g3
	membar	0x4E
	fbl,a	%fcc3,	loop_2557
	nop
	setx	0x865F6CE03FBF810A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x01216686E1C8A103,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f10,	%f0
	movre	%i6,	%o5,	%g5
	movrgez	%g4,	0x3F0,	%g6
loop_2557:
	fzero	%f6
	sub	%o1,	0x1927,	%i1
	brlez	%g7,	loop_2558
	sra	%i0,	%l5,	%i4
	fmovse	%icc,	%f1,	%f19
	fxors	%f27,	%f20,	%f8
loop_2558:
	srl	%l6,	%g1,	%l0
	fmovdle	%xcc,	%f11,	%f18
	edge16l	%l3,	%i2,	%l1
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%o0
	xor	%i7,	0x1AF1,	%o2
	tcc	%xcc,	0x6
	bg,a	loop_2559
	and	%o4,	%o7,	%g2
	move	%xcc,	%o6,	%l4
	flush	%l7 + 0x14
loop_2559:
	fmovsvs	%icc,	%f18,	%f16
	tne	%xcc,	0x0
	nop
	setx	0x6B3448E2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f0
	set	0x7C, %l1
	stwa	%i5,	[%l7 + %l1] 0x2a
	membar	#Sync
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] %asi,	%o3,	%i3
	fblg	%fcc3,	loop_2560
	addcc	%l2,	0x14E8,	%i6
	edge16n	%o5,	%g5,	%g4
	fbo,a	%fcc3,	loop_2561
loop_2560:
	udiv	%g6,	0x1315,	%o1
	movcs	%xcc,	%i1,	%g3
	mulscc	%i0,	0x114C,	%l5
loop_2561:
	mova	%icc,	%g7,	%i4
	ba	loop_2562
	tpos	%xcc,	0x4
	orn	%g1,	0x1342,	%l0
	mulx	%l6,	%i2,	%l3
loop_2562:
	fmuld8ulx16	%f30,	%f3,	%f28
	fnegd	%f6,	%f12
	wr	%g0,	0x11,	%asi
	stwa	%l1,	[%l7 + 0x44] %asi
	and	%o0,	0x0515,	%i7
	swap	[%l7 + 0x14],	%o4
	sdiv	%o2,	0x0A04,	%o7
	tsubcctv	%g2,	%o6,	%i5
	fbge	%fcc2,	loop_2563
	edge32ln	%l4,	%i3,	%l2
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x19,	%f16
loop_2563:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x25] %asi,	%i6
	bpos,a,pt	%xcc,	loop_2564
	fmul8x16au	%f9,	%f20,	%f20
	sdivx	%o5,	0x19CF,	%g5
	subccc	%g4,	%o3,	%o1
loop_2564:
	st	%f29,	[%l7 + 0x14]
	bpos,a	%xcc,	loop_2565
	orcc	%i1,	0x0B40,	%g6
	nop
	set	0x6F, %g2
	ldsb	[%l7 + %g2],	%g3
	xorcc	%l5,	0x1D31,	%i0
loop_2565:
	array32	%i4,	%g7,	%l0
	movcs	%xcc,	%l6,	%g1
	faligndata	%f10,	%f18,	%f4
	edge32ln	%i2,	%l1,	%l3
	nop
	setx	0x3D34B40676857FEB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xE093C516A839BFA7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f14,	%f22
	brlz	%o0,	loop_2566
	movrgez	%i7,	%o4,	%o2
	tn	%icc,	0x0
	edge8ln	%o7,	%g2,	%o6
loop_2566:
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f2
	fxtod	%f2,	%f2
	fmovrde	%i5,	%f18,	%f20
	movrgez	%i3,	0x3A5,	%l4
	stx	%l2,	[%l7 + 0x18]
	fmovrdgz	%o5,	%f6,	%f8
	popc	%i6,	%g4
	mova	%icc,	%g5,	%o3
	movre	%i1,	0x176,	%o1
	fcmpeq16	%f2,	%f2,	%g3
	fmovdne	%icc,	%f6,	%f11
	stbar
	xorcc	%l5,	0x1683,	%i0
	udivcc	%g6,	0x0F77,	%g7
	edge16	%i4,	%l6,	%l0
	te	%xcc,	0x5
	fandnot2s	%f24,	%f16,	%f11
	fcmple32	%f10,	%f14,	%i2
	fbule	%fcc2,	loop_2567
	fandnot1	%f14,	%f16,	%f8
	movrlez	%g1,	%l3,	%l1
	mova	%icc,	%i7,	%o4
loop_2567:
	nop
	wr	%g0,	0x88,	%asi
	sta	%f22,	[%l7 + 0x24] %asi
	movg	%icc,	%o0,	%o7
	nop
	setx	0x63D9C433312F17C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x2A44F72343540C41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f0,	%f14
	subccc	%o2,	%o6,	%i5
	bgu,a,pn	%icc,	loop_2568
	stbar
	fcmple16	%f22,	%f28,	%g2
	ble,pn	%xcc,	loop_2569
loop_2568:
	srlx	%i3,	%l2,	%o5
	fpadd32	%f18,	%f20,	%f10
	edge8	%l4,	%g4,	%g5
loop_2569:
	tge	%xcc,	0x0
	fbl	%fcc1,	loop_2570
	tsubcctv	%i6,	%o3,	%o1
	fbuge	%fcc2,	loop_2571
	fnegd	%f12,	%f10
loop_2570:
	sdivcc	%g3,	0x0C71,	%i1
	lduh	[%l7 + 0x16],	%l5
loop_2571:
	nop
	fitos	%f13,	%f26
	fstoi	%f26,	%f24
	tleu	%icc,	0x7
	fmovrsgez	%i0,	%f26,	%f22
	bcc,a	loop_2572
	fbule,a	%fcc2,	loop_2573
	sllx	%g7,	0x17,	%i4
	tg	%xcc,	0x5
loop_2572:
	call	loop_2574
loop_2573:
	udivx	%g6,	0x086B,	%l6
	tsubcc	%i2,	0x0EF1,	%l0
	sub	%g1,	%l3,	%i7
loop_2574:
	sth	%o4,	[%l7 + 0x68]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x2
	edge16n	%o0,	%o7,	%o2
	edge32n	%o6,	%l1,	%i5
	fpack32	%f16,	%f18,	%f12
	mulx	%i3,	0x0FC5,	%g2
	ld	[%l7 + 0x68],	%f9
	movrlz	%l2,	0x29F,	%l4
	edge32ln	%o5,	%g4,	%i6
	andncc	%o3,	%o1,	%g3
	xnorcc	%i1,	%l5,	%i0
	bpos,pt	%icc,	loop_2575
	fmovrdgez	%g7,	%f30,	%f6
	srax	%i4,	%g5,	%g6
	tsubcctv	%i2,	%l6,	%l0
loop_2575:
	fone	%f20
	edge8l	%l3,	%g1,	%o4
	andn	%i7,	%o7,	%o2
	movl	%xcc,	%o6,	%l1
	movrlez	%i5,	0x02A,	%i3
	alignaddr	%g2,	%l2,	%o0
	nop
	fitod	%f6,	%f0
	fdtox	%f0,	%f12
	movpos	%xcc,	%l4,	%o5
	fbe,a	%fcc1,	loop_2576
	addcc	%i6,	0x0877,	%g4
	wr	%g0,	0x27,	%asi
	stba	%o3,	[%l7 + 0x4F] %asi
	membar	#Sync
loop_2576:
	movcs	%icc,	%g3,	%i1
	movgu	%xcc,	%o1,	%i0
	movl	%xcc,	%l5,	%g7
	udivx	%i4,	0x0EC1,	%g5
	movne	%icc,	%i2,	%g6
	fmovdneg	%xcc,	%f5,	%f0
	edge16n	%l0,	%l3,	%l6
	tvc	%icc,	0x2
	ldx	[%l7 + 0x50],	%o4
	brlez	%i7,	loop_2577
	edge32	%g1,	%o2,	%o6
	movge	%icc,	%l1,	%o7
	andncc	%i5,	%g2,	%l2
loop_2577:
	edge32	%i3,	%l4,	%o5
	tg	%icc,	0x7
	tvc	%xcc,	0x6
	movcc	%icc,	%i6,	%g4
	tneg	%icc,	0x1
	for	%f24,	%f30,	%f28
	pdist	%f4,	%f24,	%f30
	edge16l	%o0,	%o3,	%g3
	edge16n	%i1,	%i0,	%o1
	umul	%g7,	%l5,	%i4
	fbule	%fcc0,	loop_2578
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba	%fcc0,	loop_2579
	udivcc	%i2,	0x09FE,	%g5
loop_2578:
	sdivx	%g6,	0x00F0,	%l3
	fmovsa	%icc,	%f25,	%f24
loop_2579:
	mova	%xcc,	%l6,	%o4
	sdivcc	%l0,	0x106C,	%i7
	movge	%icc,	%o2,	%o6
	mulscc	%l1,	0x0ECC,	%g1
	add	%o7,	0x08AA,	%i5
	subcc	%l2,	0x153F,	%i3
	fblg	%fcc0,	loop_2580
	srax	%l4,	%g2,	%o5
	movn	%icc,	%i6,	%g4
	array32	%o0,	%o3,	%i1
loop_2580:
	subcc	%i0,	0x026D,	%o1
	bcc,a,pt	%xcc,	loop_2581
	andn	%g3,	0x08A4,	%l5
	movcc	%icc,	%i4,	%g7
	fand	%f22,	%f2,	%f0
loop_2581:
	orncc	%i2,	0x08E2,	%g5
	tne	%icc,	0x0
	tcc	%icc,	0x2
	tsubcctv	%g6,	%l3,	%o4
	subccc	%l0,	%i7,	%l6
	edge8ln	%o6,	%l1,	%o2
	mulx	%o7,	0x0FCD,	%i5
	movleu	%icc,	%g1,	%l2
	fpack16	%f14,	%f22
	array32	%i3,	%g2,	%l4
	smul	%i6,	%o5,	%g4
	fmovrdgz	%o0,	%f16,	%f26
	std	%f10,	[%l7 + 0x18]
	andncc	%o3,	%i1,	%o1
	movcs	%icc,	%i0,	%g3
	sdiv	%l5,	0x0F87,	%i4
	tvc	%xcc,	0x2
	tneg	%xcc,	0x0
	fbl,a	%fcc2,	loop_2582
	ldub	[%l7 + 0x48],	%g7
	subccc	%g5,	%i2,	%g6
	fmovdcs	%icc,	%f19,	%f13
loop_2582:
	brlz	%l3,	loop_2583
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue	%fcc3,	loop_2584
	ba,a,pt	%xcc,	loop_2585
loop_2583:
	fmovrdlz	%l0,	%f16,	%f10
	fzeros	%f18
loop_2584:
	fbl,a	%fcc2,	loop_2586
loop_2585:
	edge8n	%o4,	%i7,	%l6
	brnz	%l1,	loop_2587
	fbule,a	%fcc1,	loop_2588
loop_2586:
	fbe	%fcc3,	loop_2589
	stx	%o2,	[%l7 + 0x38]
loop_2587:
	sra	%o7,	%i5,	%o6
loop_2588:
	edge8	%g1,	%i3,	%g2
loop_2589:
	stb	%l2,	[%l7 + 0x66]
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x80,	%f0
	movrgz	%i6,	%l4,	%g4
	movrgez	%o0,	%o3,	%o5
	movrlez	%o1,	%i0,	%g3
	wr	%g0,	0x89,	%asi
	sta	%f31,	[%l7 + 0x54] %asi
	tsubcc	%l5,	%i4,	%g7
	xorcc	%g5,	0x1E4A,	%i1
	sethi	0x00EA,	%g6
	taddcc	%l3,	0x0EDD,	%i2
	tpos	%xcc,	0x4
	bneg	%icc,	loop_2590
	orcc	%l0,	%i7,	%o4
	wr	%g0,	0x10,	%asi
	stha	%l6,	[%l7 + 0x7C] %asi
loop_2590:
	tneg	%xcc,	0x6
	movg	%icc,	%o2,	%l1
	edge32ln	%o7,	%o6,	%i5
	mulscc	%g1,	0x02A6,	%g2
	fmovscs	%icc,	%f22,	%f23
	xorcc	%i3,	0x0F53,	%i6
	fxnors	%f15,	%f19,	%f12
	sllx	%l4,	0x1D,	%l2
	tne	%icc,	0x3
	srlx	%o0,	0x01,	%o3
	set	0x23, %l2
	ldsba	[%l7 + %l2] 0x19,	%o5
	fmovrsne	%g4,	%f6,	%f19
	movpos	%xcc,	%i0,	%o1
	udivx	%l5,	0x01E5,	%g3
	fandnot1s	%f5,	%f20,	%f1
	fble	%fcc3,	loop_2591
	taddcc	%g7,	%i4,	%g5
	nop
	set	0x3A, %o0
	sth	%i1,	[%l7 + %o0]
	sdiv	%l3,	0x05EC,	%i2
loop_2591:
	st	%f6,	[%l7 + 0x64]
	xnorcc	%l0,	%i7,	%o4
	or	%g6,	%l6,	%o2
	edge16ln	%l1,	%o7,	%i5
	umulcc	%g1,	%o6,	%g2
	tn	%xcc,	0x1
	sra	%i6,	%l4,	%i3
	nop
	fitos	%f14,	%f7
	fstoi	%f7,	%f3
	fbne,a	%fcc2,	loop_2592
	fnot1s	%f4,	%f16
	edge16	%o0,	%o3,	%o5
	orn	%g4,	0x0C92,	%l2
loop_2592:
	edge32	%i0,	%o1,	%g3
	bl,pt	%xcc,	loop_2593
	or	%l5,	%i4,	%g5
	tvc	%xcc,	0x0
	fbe,a	%fcc3,	loop_2594
loop_2593:
	movg	%xcc,	%g7,	%i1
	fmovse	%icc,	%f29,	%f23
	add	%l7,	0x38,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l3,	%i2
loop_2594:
	movle	%icc,	%l0,	%o4
	tsubcctv	%i7,	%l6,	%o2
	addccc	%l1,	0x0CCD,	%g6
	tg	%xcc,	0x5
	tneg	%xcc,	0x1
	srax	%o7,	%i5,	%g1
	movgu	%icc,	%o6,	%g2
	fxnors	%f6,	%f8,	%f15
	ldsb	[%l7 + 0x41],	%i6
	fmovs	%f22,	%f29
	set	0x5C, %i7
	stha	%i3,	[%l7 + %i7] 0x0c
	alignaddrl	%o0,	%l4,	%o5
	movvs	%xcc,	%o3,	%l2
	brgez	%g4,	loop_2595
	xnorcc	%o1,	0x1A61,	%i0
	xor	%l5,	%g3,	%g5
	pdist	%f30,	%f8,	%f24
loop_2595:
	mova	%xcc,	%g7,	%i1
	xorcc	%i4,	%i2,	%l0
	tg	%icc,	0x0
	smul	%o4,	0x08F1,	%l3
	umulcc	%i7,	%o2,	%l6
	movrlz	%g6,	%o7,	%l1
	set	0x20, %g4
	ldda	[%l7 + %g4] 0x80,	%g0
	xnor	%o6,	0x13D0,	%i5
	fmovdn	%icc,	%f9,	%f30
	sra	%g2,	0x03,	%i6
	edge16l	%i3,	%l4,	%o0
	tsubcctv	%o3,	%l2,	%o5
	fpadd16s	%f17,	%f22,	%f31
	stbar
	orncc	%o1,	0x1378,	%i0
	fmul8x16	%f25,	%f14,	%f12
	alignaddr	%g4,	%l5,	%g5
	set	0x26, %i5
	stha	%g3,	[%l7 + %i5] 0x23
	membar	#Sync
	fmovsle	%xcc,	%f22,	%f14
	fmovrde	%i1,	%f4,	%f2
	tn	%xcc,	0x4
	mulx	%i4,	%g7,	%l0
	bgu	loop_2596
	orncc	%i2,	0x1A17,	%l3
	fmovrsgz	%i7,	%f29,	%f8
	taddcc	%o4,	0x02A6,	%l6
loop_2596:
	movrgez	%o2,	0x3E1,	%g6
	mova	%icc,	%o7,	%g1
	lduh	[%l7 + 0x4E],	%o6
	nop
	setx	0x9E018DD880599C6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	nop
	setx	0xE37D3418DCE41142,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xB1A93BFD392CF763,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f8,	%f0
	smul	%l1,	%g2,	%i5
	swap	[%l7 + 0x48],	%i6
	sethi	0x1627,	%l4
	addccc	%i3,	%o3,	%o0
	fmovsneg	%xcc,	%f0,	%f16
	orcc	%o5,	0x1205,	%o1
	stb	%l2,	[%l7 + 0x7A]
	orn	%i0,	%g4,	%l5
	movl	%icc,	%g3,	%i1
	movcs	%icc,	%g5,	%i4
	wr	%g0,	0xea,	%asi
	stha	%g7,	[%l7 + 0x20] %asi
	membar	#Sync
	nop
	fitos	%f9,	%f8
	fstox	%f8,	%f4
	movre	%i2,	%l3,	%l0
	faligndata	%f4,	%f4,	%f2
	tleu	%xcc,	0x5
	sllx	%o4,	%i7,	%o2
	fcmple32	%f24,	%f30,	%l6
	tgu	%icc,	0x4
	fba,a	%fcc0,	loop_2597
	umul	%g6,	0x0F4B,	%o7
	tge	%icc,	0x7
	fmovd	%f22,	%f4
loop_2597:
	fble	%fcc0,	loop_2598
	sdivcc	%o6,	0x1B47,	%l1
	movne	%icc,	%g1,	%g2
	fnot1s	%f7,	%f4
loop_2598:
	ble,a,pn	%xcc,	loop_2599
	srax	%i6,	0x1C,	%i5
	fexpand	%f17,	%f8
	udivx	%l4,	0x0647,	%i3
loop_2599:
	fsrc1s	%f6,	%f12
	add	%l7,	0x64,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o0,	%o3
	edge32ln	%o5,	%o1,	%l2
	bvs,a	%xcc,	loop_2600
	stbar
	movrgez	%g4,	0x048,	%l5
	fexpand	%f22,	%f10
loop_2600:
	tn	%xcc,	0x0
	fnors	%f4,	%f4,	%f23
	movrne	%i0,	0x1A8,	%g3
	edge8n	%g5,	%i1,	%i4
	andcc	%g7,	%l3,	%l0
	andn	%o4,	0x0B51,	%i7
	bne	%xcc,	loop_2601
	fmovrslez	%i2,	%f6,	%f5
	fexpand	%f10,	%f26
	mova	%icc,	%o2,	%l6
loop_2601:
	bne,a,pt	%xcc,	loop_2602
	add	%g6,	%o7,	%l1
	alignaddr	%o6,	%g1,	%i6
	tvc	%xcc,	0x5
loop_2602:
	movpos	%icc,	%g2,	%i5
	st	%f1,	[%l7 + 0x24]
	stx	%l4,	[%l7 + 0x48]
	move	%icc,	%o0,	%i3
	fbule,a	%fcc0,	loop_2603
	lduw	[%l7 + 0x28],	%o5
	sdiv	%o1,	0x0C68,	%o3
	move	%xcc,	%g4,	%l2
loop_2603:
	ldstub	[%l7 + 0x44],	%l5
	ble	loop_2604
	edge32n	%i0,	%g3,	%g5
	sdiv	%i4,	0x0CEB,	%g7
	fmovda	%icc,	%f4,	%f2
loop_2604:
	taddcctv	%i1,	%l0,	%o4
	nop
	setx	0x50664903,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	nop
	setx	0x005C55D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	srlx	%l3,	%i7,	%i2
	tsubcc	%o2,	%l6,	%o7
	andn	%g6,	%l1,	%o6
	edge16ln	%i6,	%g1,	%g2
	taddcctv	%l4,	%o0,	%i5
	bl,pt	%icc,	loop_2605
	tleu	%icc,	0x3
	fbe,a	%fcc1,	loop_2606
	fmovde	%xcc,	%f14,	%f16
loop_2605:
	fbge	%fcc0,	loop_2607
	tpos	%icc,	0x6
loop_2606:
	tle	%icc,	0x5
	nop
	fitos	%f9,	%f21
	fstox	%f21,	%f24
loop_2607:
	fmovdgu	%xcc,	%f20,	%f12
	bge,pn	%icc,	loop_2608
	tgu	%xcc,	0x2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x5C] %asi,	%o5
loop_2608:
	fbn	%fcc3,	loop_2609
	fbug,a	%fcc0,	loop_2610
	sra	%o1,	0x0A,	%o3
	movrlz	%g4,	%l2,	%l5
loop_2609:
	ldstub	[%l7 + 0x0B],	%i3
loop_2610:
	array8	%g3,	%i0,	%g5
	stbar
	tvs	%icc,	0x1
	fble,a	%fcc3,	loop_2611
	tneg	%xcc,	0x3
	edge32n	%i4,	%i1,	%l0
	srl	%g7,	0x1C,	%o4
loop_2611:
	tvc	%icc,	0x6
	ldub	[%l7 + 0x11],	%l3
	taddcc	%i2,	0x0704,	%o2
	fbo	%fcc2,	loop_2612
	brgez	%i7,	loop_2613
	fbule,a	%fcc2,	loop_2614
	movcc	%icc,	%o7,	%l6
loop_2612:
	array16	%g6,	%o6,	%i6
loop_2613:
	bl,a,pn	%xcc,	loop_2615
loop_2614:
	taddcc	%g1,	0x1D4A,	%g2
	tcc	%xcc,	0x7
	fbg	%fcc3,	loop_2616
loop_2615:
	fcmpgt32	%f20,	%f24,	%l4
	srlx	%o0,	%i5,	%o5
	swap	[%l7 + 0x34],	%o1
loop_2616:
	movle	%icc,	%o3,	%l1
	tge	%icc,	0x2
	movg	%icc,	%l2,	%l5
	array32	%i3,	%g4,	%g3
	fxors	%f25,	%f19,	%f11
	fmovrsne	%i0,	%f2,	%f27
	fmovsne	%xcc,	%f15,	%f26
	fmovrsne	%i4,	%f29,	%f26
	std	%f12,	[%l7 + 0x18]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f18,	%f9,	%f22
	popc	0x0A89,	%g5
	te	%icc,	0x2
	movl	%icc,	%i1,	%g7
	tl	%icc,	0x5
	fpadd32s	%f6,	%f3,	%f21
	tle	%xcc,	0x1
	ta	%icc,	0x5
	brlez	%l0,	loop_2617
	fands	%f18,	%f25,	%f18
	fnot1	%f18,	%f16
	fandnot2s	%f2,	%f12,	%f0
loop_2617:
	sethi	0x0DF0,	%o4
	movneg	%icc,	%i2,	%o2
	fmovdg	%xcc,	%f24,	%f1
	tl	%icc,	0x4
	movn	%xcc,	%l3,	%o7
	edge16	%i7,	%g6,	%o6
	flush	%l7 + 0x1C
	tl	%xcc,	0x3
	fpadd16s	%f19,	%f27,	%f25
	bgu,a	%xcc,	loop_2618
	movre	%l6,	%g1,	%i6
	fpsub32s	%f7,	%f2,	%f26
	movgu	%icc,	%g2,	%l4
loop_2618:
	movvs	%icc,	%i5,	%o5
	sdiv	%o0,	0x017A,	%o1
	set	0x30, %l0
	swapa	[%l7 + %l0] 0x0c,	%l1
	and	%l2,	%o3,	%l5
	movle	%xcc,	%g4,	%g3
	addccc	%i3,	%i0,	%g5
	set	0x54, %g1
	lduha	[%l7 + %g1] 0x88,	%i4
	tle	%icc,	0x2
	fpsub16	%f28,	%f8,	%f14
	fnot2	%f14,	%f12
	st	%f24,	[%l7 + 0x78]
	sra	%g7,	%l0,	%i1
	movrne	%o4,	%i2,	%l3
	fmovdl	%icc,	%f1,	%f23
	fcmple16	%f4,	%f0,	%o2
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x6C] %asi,	%o7
	movrlez	%i7,	%o6,	%l6
	taddcc	%g6,	0x1B2D,	%g1
	fmovrde	%i6,	%f30,	%f2
	edge16ln	%g2,	%l4,	%i5
	sub	%o0,	0x0D1D,	%o1
	st	%f7,	[%l7 + 0x0C]
	bvs,a	%icc,	loop_2619
	movgu	%icc,	%o5,	%l2
	movre	%l1,	0x377,	%l5
	edge8l	%g4,	%o3,	%g3
loop_2619:
	edge16l	%i3,	%i0,	%i4
	fandnot1s	%f9,	%f23,	%f3
	edge32ln	%g7,	%l0,	%i1
	tcs	%icc,	0x3
	brlz	%g5,	loop_2620
	fmovdge	%xcc,	%f16,	%f31
	set	0x68, %l3
	stwa	%o4,	[%l7 + %l3] 0x88
loop_2620:
	fandnot1s	%f21,	%f12,	%f29
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x50] %asi,	%l2
	fmovsg	%icc,	%f9,	%f26
	fnot1s	%f0,	%f11
	ldd	[%l7 + 0x20],	%i2
	mova	%xcc,	%o7,	%i7
	srax	%o2,	0x16,	%l6
	fcmple16	%f22,	%f22,	%g6
	fpadd16s	%f6,	%f8,	%f2
	sdivx	%g1,	0x19E5,	%i6
	andcc	%g2,	0x0A8B,	%l4
	movre	%i5,	0x345,	%o0
	tleu	%xcc,	0x4
	fnand	%f28,	%f28,	%f16
	movg	%icc,	%o1,	%o5
	nop
	fitos	%f3,	%f12
	fstoi	%f12,	%f12
	nop
	set	0x58, %o7
	lduh	[%l7 + %o7],	%l2
	fpack32	%f22,	%f24,	%f24
	set	0x0C, %l5
	ldswa	[%l7 + %l5] 0x81,	%l1
	set	0x34, %l4
	lda	[%l7 + %l4] 0x80,	%f8
	fcmpne32	%f8,	%f30,	%l5
	fmovdvs	%xcc,	%f17,	%f7
	ldd	[%l7 + 0x70],	%o6
	nop
	setx	0x219108D282AFCA6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x7B20D0E389F1043C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f2,	%f28
	ldd	[%l7 + 0x48],	%f10
	fornot1	%f8,	%f20,	%f16
	brlez	%o3,	loop_2621
	movgu	%icc,	%g3,	%i3
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x24] %asi,	%g4
loop_2621:
	movre	%i4,	%i0,	%g7
	udivcc	%i1,	0x0396,	%g5
	tn	%icc,	0x5
	tne	%icc,	0x3
	tcs	%xcc,	0x4
	stw	%l0,	[%l7 + 0x74]
	and	%o4,	0x1131,	%i2
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x58] %asi,	%l3
	fmovd	%f28,	%f18
	array16	%o7,	%i7,	%l6
	tpos	%xcc,	0x0
	fmovdcs	%icc,	%f23,	%f12
	tn	%icc,	0x3
	fands	%f20,	%f7,	%f10
	stw	%o2,	[%l7 + 0x28]
	umulcc	%g1,	%g6,	%g2
	move	%icc,	%l4,	%i6
	fmovdpos	%xcc,	%f14,	%f27
	wr	%g0,	0x18,	%asi
	stba	%o0,	[%l7 + 0x27] %asi
	movle	%icc,	%o1,	%i5
	xnor	%l2,	0x10B5,	%o5
	movrgz	%l5,	%o6,	%o3
	nop
	setx	loop_2622,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%xcc,	%g3,	%l1
	fpsub16	%f8,	%f18,	%f2
	stbar
loop_2622:
	nop
	fitos	%f1,	%f25
	fstox	%f25,	%f0
	smulcc	%i3,	%g4,	%i4
	fmovrsgz	%i0,	%f10,	%f0
	orncc	%i1,	0x02DD,	%g5
	sra	%g7,	%l0,	%i2
	edge8ln	%o4,	%o7,	%i7
	tsubcctv	%l3,	%l6,	%g1
	subccc	%o2,	0x1474,	%g2
	movneg	%xcc,	%l4,	%g6
	tge	%icc,	0x0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	fbge	%fcc1,	loop_2623
	movrlez	%o1,	%i6,	%l2
	movneg	%icc,	%i5,	%o5
	sir	0x0A15
loop_2623:
	xnorcc	%o6,	%l5,	%g3
	sethi	0x16F7,	%o3
	lduw	[%l7 + 0x48],	%i3
	movle	%icc,	%l1,	%i4
	orn	%i0,	0x03CE,	%g4
	mova	%xcc,	%i1,	%g5
	movrne	%l0,	%i2,	%g7
	ldstub	[%l7 + 0x08],	%o4
	ta	%icc,	0x2
	fbul	%fcc1,	loop_2624
	fpadd32s	%f20,	%f26,	%f18
	subcc	%i7,	0x0709,	%o7
	fmuld8sux16	%f28,	%f22,	%f28
loop_2624:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%l3
	fbul	%fcc1,	loop_2625
	fornot1	%f28,	%f0,	%f4
	set	0x68, %g7
	lda	[%l7 + %g7] 0x15,	%f27
loop_2625:
	nop
	setx	0xD918C2FF3051258D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fpack16	%f30,	%f3
	xnor	%l6,	0x1059,	%g1
	bvs,pt	%xcc,	loop_2626
	fbue	%fcc1,	loop_2627
	mova	%xcc,	%o2,	%l4
	bn	%xcc,	loop_2628
loop_2626:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2627:
	ldub	[%l7 + 0x0B],	%g6
	addccc	%o0,	0x087E,	%o1
loop_2628:
	udivx	%g2,	0x1A3D,	%l2
	tl	%xcc,	0x3
	edge16	%i5,	%o5,	%i6
	addcc	%l5,	%g3,	%o6
	popc	0x0E23,	%i3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x34] %asi,	%l1
	fbug,a	%fcc2,	loop_2629
	fpack16	%f20,	%f24
	and	%i4,	0x14D2,	%o3
	orn	%g4,	%i0,	%g5
loop_2629:
	membar	0x66
	fmovdneg	%xcc,	%f19,	%f25
	fcmpeq16	%f8,	%f8,	%l0
	tle	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f30,	%f24,	%f28
	fnot2	%f14,	%f0
	srax	%i2,	%i1,	%o4
	fnor	%f2,	%f6,	%f20
	movg	%xcc,	%i7,	%o7
	fmovrdlz	%g7,	%f6,	%f24
	add	%l3,	%g1,	%l6
	sdivcc	%o2,	0x1368,	%l4
	sdivx	%g6,	0x0D60,	%o1
	ta	%icc,	0x4
	ldstub	[%l7 + 0x54],	%g2
	fnot1	%f20,	%f2
	edge8	%o0,	%i5,	%o5
	ble,a,pt	%icc,	loop_2630
	andcc	%i6,	%l2,	%l5
	edge16ln	%o6,	%i3,	%l1
	edge8l	%g3,	%o3,	%i4
loop_2630:
	nop
	setx	0xF91B03C6CA48FBDB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x8149C9A4F7781724,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f4,	%f16
	fsrc1	%f10,	%f28
	bvc,a,pn	%xcc,	loop_2631
	srl	%g4,	%i0,	%l0
	sir	0x0644
	set	0x5B, %g5
	ldsba	[%l7 + %g5] 0x89,	%g5
loop_2631:
	array8	%i1,	%i2,	%o4
	mulscc	%i7,	0x012B,	%g7
	fmovdpos	%xcc,	%f13,	%f8
	ldsb	[%l7 + 0x3D],	%o7
	fmovdgu	%xcc,	%f22,	%f30
	movrgez	%g1,	%l6,	%l3
	subcc	%l4,	0x069A,	%g6
	tsubcc	%o2,	0x0AB9,	%o1
	movcs	%icc,	%g2,	%o0
	movrlez	%o5,	%i5,	%i6
	bvs,a,pn	%xcc,	loop_2632
	edge8ln	%l2,	%o6,	%l5
	fxnor	%f28,	%f6,	%f20
	faligndata	%f28,	%f4,	%f16
loop_2632:
	nop
	setx	0xD90AA333,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xF6971C88,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f13,	%f20
	movvc	%xcc,	%l1,	%g3
	edge32l	%i3,	%o3,	%i4
	ldsb	[%l7 + 0x4B],	%g4
	lduh	[%l7 + 0x4A],	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i0,	%i1
	tvc	%xcc,	0x5
	fbn,a	%fcc0,	loop_2633
	fbo	%fcc2,	loop_2634
	sir	0x039D
	array16	%g5,	%o4,	%i2
loop_2633:
	fmovda	%icc,	%f1,	%f30
loop_2634:
	prefetch	[%l7 + 0x3C],	 0x3
	addc	%g7,	%o7,	%g1
	movpos	%icc,	%l6,	%l3
	sdivx	%i7,	0x1F22,	%g6
	movl	%icc,	%o2,	%l4
	nop
	setx	0xF07B39DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	for	%f8,	%f30,	%f16
	brgez	%g2,	loop_2635
	tl	%icc,	0x5
	addc	%o0,	%o1,	%o5
	fbu	%fcc1,	loop_2636
loop_2635:
	edge32ln	%i6,	%i5,	%o6
	sir	0x0D39
	movre	%l2,	0x397,	%l1
loop_2636:
	fmul8x16al	%f10,	%f2,	%f4
	orncc	%l5,	%i3,	%o3
	fbo,a	%fcc0,	loop_2637
	fmovd	%f6,	%f4
	orncc	%i4,	0x05F6,	%g3
	stb	%g4,	[%l7 + 0x70]
loop_2637:
	bn	%xcc,	loop_2638
	edge32	%i0,	%i1,	%l0
	andn	%o4,	0x0206,	%i2
	fone	%f0
loop_2638:
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f30
	tn	%xcc,	0x7
	ba,pt	%xcc,	loop_2639
	fbug,a	%fcc3,	loop_2640
	xorcc	%g7,	%g5,	%g1
	fcmpne16	%f10,	%f6,	%l6
loop_2639:
	taddcctv	%l3,	%o7,	%i7
loop_2640:
	ble,a,pn	%icc,	loop_2641
	movre	%o2,	%l4,	%g6
	for	%f30,	%f12,	%f18
	tne	%icc,	0x1
loop_2641:
	tleu	%icc,	0x7
	fmuld8ulx16	%f13,	%f17,	%f20
	ble,a	%xcc,	loop_2642
	ba	loop_2643
	xnorcc	%g2,	0x00BB,	%o0
	tvs	%icc,	0x6
loop_2642:
	fbn,a	%fcc2,	loop_2644
loop_2643:
	udivcc	%o5,	0x034A,	%i6
	movge	%xcc,	%i5,	%o1
	fbge,a	%fcc3,	loop_2645
loop_2644:
	edge8n	%o6,	%l2,	%l5
	ta	%icc,	0x4
	nop
	setx	0x95673E12485D54D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x774ACF09043DE78E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f24,	%f22
loop_2645:
	nop
	set	0x28, %i1
	lduwa	[%l7 + %i1] 0x0c,	%l1
	wr	%g0,	0x27,	%asi
	stwa	%o3,	[%l7 + 0x58] %asi
	membar	#Sync
	ldsb	[%l7 + 0x5A],	%i4
	alignaddr	%i3,	%g4,	%g3
	movpos	%icc,	%i1,	%l0
	ba	loop_2646
	fmovrsgz	%o4,	%f22,	%f31
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x48] %asi,	%i0
loop_2646:
	bcs,a	%icc,	loop_2647
	tleu	%icc,	0x2
	udivx	%i2,	0x15B0,	%g7
	fabsd	%f6,	%f0
loop_2647:
	bneg,pn	%xcc,	loop_2648
	tl	%icc,	0x3
	fmovsgu	%icc,	%f14,	%f27
	xnorcc	%g5,	%l6,	%g1
loop_2648:
	te	%icc,	0x3
	bcs,pt	%xcc,	loop_2649
	sub	%l3,	0x12BE,	%i7
	ta	%xcc,	0x1
	tleu	%xcc,	0x5
loop_2649:
	nop
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o2
	tsubcctv	%o7,	%l4,	%g2
	edge32n	%o0,	%o5,	%g6
	ldsb	[%l7 + 0x56],	%i5
	fxor	%f24,	%f2,	%f26
	tsubcc	%i6,	%o6,	%l2
	array32	%l5,	%o1,	%l1
	sir	0x104D
	fmovdleu	%icc,	%f9,	%f22
	movpos	%xcc,	%i4,	%i3
	nop
	setx	0x3E00A69DA89EF302,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x283072E8548308F5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f26,	%f20
	fmovsgu	%icc,	%f18,	%f16
	edge16ln	%g4,	%g3,	%i1
	srax	%o3,	0x16,	%o4
	add	%l0,	0x10C9,	%i0
	fmovrslez	%g7,	%f4,	%f7
	fmovdvc	%icc,	%f10,	%f1
	fbo,a	%fcc1,	loop_2650
	fmovrde	%g5,	%f16,	%f18
	addccc	%l6,	%g1,	%l3
	ld	[%l7 + 0x24],	%f8
loop_2650:
	fcmpne16	%f12,	%f6,	%i2
	add	%o2,	0x11F5,	%i7
	lduh	[%l7 + 0x3E],	%o7
	fmovrdgz	%g2,	%f20,	%f4
	bne,a,pt	%xcc,	loop_2651
	edge32	%o0,	%l4,	%g6
	fmovdpos	%icc,	%f10,	%f24
	nop
	setx loop_2652, %l0, %l1
	jmpl %l1, %i5
loop_2651:
	nop
	setx	0xBDFA64D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xB2636261,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f2,	%f16
	edge8ln	%i6,	%o6,	%l2
	movre	%l5,	%o5,	%l1
loop_2652:
	move	%icc,	%o1,	%i3
	addcc	%i4,	0x09CD,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f2,	%f18
	nop
	setx loop_2653, %l0, %l1
	jmpl %l1, %g4
	array16	%o3,	%o4,	%l0
	srl	%i0,	0x1D,	%i1
	std	%f14,	[%l7 + 0x30]
loop_2653:
	alignaddr	%g7,	%l6,	%g5
	brgez	%g1,	loop_2654
	tvs	%xcc,	0x2
	andcc	%i2,	0x0870,	%l3
	fmovsleu	%icc,	%f18,	%f0
loop_2654:
	ldd	[%l7 + 0x68],	%o2
	fmovsvc	%xcc,	%f25,	%f19
	fblg	%fcc3,	loop_2655
	brz,a	%i7,	loop_2656
	sub	%g2,	0x0356,	%o7
	st	%f29,	[%l7 + 0x14]
loop_2655:
	sll	%o0,	%l4,	%g6
loop_2656:
	ta	%icc,	0x7
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x75] %asi,	%i5
	xnor	%i6,	0x0DEB,	%o6
	subc	%l2,	%o5,	%l5
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x19,	%l1,	%i3
	mulscc	%o1,	0x0354,	%g3
	movn	%icc,	%g4,	%o3
	orncc	%i4,	%o4,	%l0
	edge16l	%i1,	%i0,	%l6
	tle	%icc,	0x5
	stw	%g7,	[%l7 + 0x5C]
	edge16ln	%g5,	%g1,	%i2
	tvs	%icc,	0x4
	tvc	%xcc,	0x6
	nop
	fitod	%f2,	%f4
	fdtox	%f4,	%f6
	fbuge	%fcc2,	loop_2657
	edge32	%l3,	%i7,	%g2
	swap	[%l7 + 0x3C],	%o7
	tg	%xcc,	0x0
loop_2657:
	nop
	set	0x38, %o6
	lduwa	[%l7 + %o6] 0x81,	%o2
	fcmple32	%f0,	%f10,	%l4
	edge16l	%o0,	%i5,	%i6
	addccc	%g6,	0x13EF,	%o6
	tsubcc	%o5,	0x1F19,	%l5
	movrlz	%l2,	%i3,	%o1
	andn	%g3,	%g4,	%l1
	smulcc	%i4,	%o4,	%o3
	sdivcc	%l0,	0x1AF8,	%i0
	tcc	%icc,	0x0
	fmul8x16al	%f21,	%f24,	%f18
	fnegs	%f31,	%f25
	subccc	%l6,	0x05A1,	%g7
	fcmpne32	%f22,	%f12,	%i1
	movvc	%xcc,	%g5,	%g1
	fbl	%fcc0,	loop_2658
	tsubcc	%l3,	%i7,	%i2
	movvs	%icc,	%g2,	%o2
	edge32n	%l4,	%o7,	%o0
loop_2658:
	movre	%i6,	0x1DA,	%g6
	fpack16	%f18,	%f11
	fmovsgu	%xcc,	%f6,	%f22
	edge16ln	%o6,	%i5,	%o5
	fmovde	%xcc,	%f17,	%f24
	fmovd	%f2,	%f30
	fmovrdne	%l2,	%f2,	%f20
	nop
	setx	0xE78AC9F1EB416021,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xA085672B318FF4C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f6,	%f24
	movre	%i3,	%o1,	%g3
	bcs,a	loop_2659
	mulscc	%g4,	%l1,	%l5
	sethi	0x10E7,	%i4
	nop
	setx	loop_2660,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2659:
	nop
	setx	0xF04A8E06,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fmovrdne	%o4,	%f0,	%f2
	movl	%xcc,	%l0,	%i0
loop_2660:
	xnorcc	%l6,	%o3,	%i1
	add	%g5,	0x1763,	%g1
	addcc	%l3,	0x0F98,	%g7
	tpos	%xcc,	0x6
	addccc	%i7,	%g2,	%o2
	alignaddr	%l4,	%i2,	%o0
	xnorcc	%i6,	0x00DC,	%o7
	fble,a	%fcc1,	loop_2661
	orn	%o6,	0x16B3,	%g6
	srlx	%i5,	0x1B,	%l2
	bvs,a	loop_2662
loop_2661:
	movrlz	%i3,	0x2C4,	%o5
	fbule	%fcc3,	loop_2663
	fandnot1s	%f24,	%f22,	%f16
loop_2662:
	movl	%icc,	%g3,	%g4
	sdiv	%l1,	0x1F0F,	%l5
loop_2663:
	sdivcc	%o1,	0x0292,	%o4
	edge16n	%l0,	%i0,	%i4
	addcc	%l6,	%o3,	%g5
	fbule	%fcc3,	loop_2664
	fmovdl	%icc,	%f26,	%f7
	edge8n	%g1,	%i1,	%l3
	sra	%g7,	%g2,	%o2
loop_2664:
	tleu	%icc,	0x1
	udivcc	%i7,	0x05BA,	%i2
	xor	%o0,	%l4,	%o7
	bvc	%xcc,	loop_2665
	ld	[%l7 + 0x34],	%f31
	tsubcctv	%o6,	0x06AE,	%i6
	orncc	%i5,	0x1A97,	%g6
loop_2665:
	movre	%l2,	%o5,	%g3
	add	%g4,	0x1A8C,	%i3
	subcc	%l5,	%l1,	%o4
	ld	[%l7 + 0x24],	%f26
	sll	%l0,	%i0,	%i4
	add	%l6,	%o1,	%g5
	movrne	%o3,	%g1,	%i1
	brgz	%l3,	loop_2666
	fcmpeq32	%f8,	%f0,	%g7
	xnorcc	%o2,	%i7,	%i2
	sll	%o0,	0x1B,	%g2
loop_2666:
	ld	[%l7 + 0x08],	%f16
	movrlz	%o7,	%o6,	%i6
	sethi	0x0229,	%i5
	sir	0x07A5
	ta	%icc,	0x5
	bcc,a	%icc,	loop_2667
	edge16l	%g6,	%l4,	%o5
	andcc	%g3,	%l2,	%i3
	nop
	setx	0x08A765D0A048E1A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
loop_2667:
	movvc	%icc,	%l5,	%l1
	mulscc	%o4,	%l0,	%g4
	wr	%g0,	0x2a,	%asi
	stha	%i4,	[%l7 + 0x32] %asi
	membar	#Sync
	andn	%i0,	%l6,	%g5
	tsubcc	%o3,	%g1,	%o1
	fmovrsne	%i1,	%f20,	%f30
	orn	%l3,	0x038D,	%g7
	subc	%i7,	0x1D4E,	%o2
	fmuld8ulx16	%f7,	%f5,	%f12
	nop
	set	0x22, %i2
	lduh	[%l7 + %i2],	%i2
	ble,pt	%icc,	loop_2668
	sir	0x149A
	tcc	%xcc,	0x1
	wr	%g0,	0x18,	%asi
	stba	%o0,	[%l7 + 0x30] %asi
loop_2668:
	edge32l	%o7,	%o6,	%g2
	ble,a	loop_2669
	fnot2	%f12,	%f14
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
loop_2669:
	orcc	%i6,	0x06EF,	%i5
	addccc	%l4,	%o5,	%g3
	sllx	%l2,	0x1A,	%g6
	movvc	%icc,	%l5,	%i3
	movge	%xcc,	%o4,	%l1
	andcc	%g4,	0x1791,	%i4
	popc	0x1113,	%i0
	set	0x18, %o1
	stxa	%l0,	[%l7 + %o1] 0xe2
	membar	#Sync
	flush	%l7 + 0x6C
	bleu,pn	%xcc,	loop_2670
	fornot2	%f2,	%f12,	%f10
	lduh	[%l7 + 0x46],	%l6
	fble	%fcc1,	loop_2671
loop_2670:
	addccc	%o3,	0x08BD,	%g1
	movcc	%icc,	%o1,	%g5
	nop
	fitos	%f6,	%f17
	fstox	%f17,	%f30
	fxtos	%f30,	%f1
loop_2671:
	fsrc2	%f10,	%f16
	movvc	%icc,	%l3,	%g7
	stw	%i7,	[%l7 + 0x4C]
	sethi	0x1B02,	%i1
	smul	%o2,	0x1181,	%i2
	pdist	%f20,	%f0,	%f30
	movcs	%icc,	%o7,	%o6
	nop
	setx loop_2672, %l0, %l1
	jmpl %l1, %o0
	fmovrdgez	%g2,	%f30,	%f20
	fmovdleu	%icc,	%f7,	%f23
	for	%f2,	%f6,	%f12
loop_2672:
	movvs	%xcc,	%i5,	%i6
	orcc	%l4,	0x023C,	%o5
	set	0x18, %i6
	stxa	%l2,	[%l7 + %i6] 0x2f
	membar	#Sync
	set	0x70, %i0
	prefetcha	[%l7 + %i0] 0x15,	 0x0
	nop
	fitod	%f12,	%f4
	fdtox	%f4,	%f10
	movcc	%xcc,	%g6,	%i3
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x15,	%f0
	mulscc	%l5,	%o4,	%g4
	ld	[%l7 + 0x58],	%f10
	ldsw	[%l7 + 0x6C],	%l1
	xor	%i0,	%l0,	%l6
	srl	%o3,	%g1,	%o1
	fbug	%fcc2,	loop_2673
	array16	%i4,	%l3,	%g5
	wr	%g0,	0x18,	%asi
	sta	%f15,	[%l7 + 0x28] %asi
loop_2673:
	fbge	%fcc1,	loop_2674
	nop
	setx	0xCE0297F7249AC203,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x8A15D7AC5E7F7507,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f24,	%f0
	edge8n	%i7,	%g7,	%o2
	movcs	%icc,	%i2,	%i1
loop_2674:
	popc	0x0E1F,	%o6
	nop
	set	0x78, %g3
	std	%f30,	[%l7 + %g3]
	edge8n	%o0,	%o7,	%g2
	tsubcctv	%i6,	%i5,	%o5
	fcmple16	%f20,	%f8,	%l2
	ldsh	[%l7 + 0x7E],	%l4
	andn	%g6,	0x0F8A,	%i3
	orcc	%l5,	%g3,	%o4
	fmovrdne	%g4,	%f10,	%f8
	fble	%fcc0,	loop_2675
	edge8	%i0,	%l1,	%l6
	ble,a,pn	%xcc,	loop_2676
	fbl,a	%fcc1,	loop_2677
loop_2675:
	udiv	%o3,	0x19DB,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2676:
	edge16l	%l0,	%o1,	%l3
loop_2677:
	tn	%icc,	0x5
	fpack16	%f6,	%f20
	fbne	%fcc3,	loop_2678
	nop
	setx	loop_2679,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbl	%fcc0,	loop_2680
	fcmple32	%f16,	%f4,	%g5
loop_2678:
	srlx	%i7,	%g7,	%i4
loop_2679:
	sdivx	%i2,	0x0410,	%o2
loop_2680:
	ta	%icc,	0x0
	ldsw	[%l7 + 0x70],	%i1
	bcs	loop_2681
	fmovsleu	%xcc,	%f18,	%f26
	movle	%icc,	%o6,	%o7
	edge8l	%g2,	%i6,	%o0
loop_2681:
	fbn,a	%fcc0,	loop_2682
	andncc	%o5,	%i5,	%l4
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f12
	fxtod	%f12,	%f18
	stbar
loop_2682:
	move	%icc,	%g6,	%l2
	bneg	loop_2683
	andcc	%l5,	0x1175,	%i3
	movneg	%icc,	%o4,	%g4
	tsubcc	%i0,	%g3,	%l1
loop_2683:
	movrlz	%l6,	0x260,	%g1
	edge32ln	%l0,	%o1,	%o3
	addcc	%g5,	%i7,	%l3
	subcc	%i4,	%i2,	%g7
	sll	%o2,	0x15,	%o6
	fbo,a	%fcc1,	loop_2684
	fbug	%fcc1,	loop_2685
	mulscc	%o7,	%i1,	%g2
	movrgez	%o0,	%o5,	%i6
loop_2684:
	fbe	%fcc1,	loop_2686
loop_2685:
	movrgez	%l4,	%i5,	%g6
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f8
	smulcc	%l5,	0x15C4,	%l2
loop_2686:
	taddcc	%o4,	0x15D9,	%g4
	sdiv	%i3,	0x0FD1,	%i0
	tg	%icc,	0x4
	array16	%l1,	%l6,	%g3
	orcc	%g1,	%l0,	%o1
	fand	%f10,	%f24,	%f16
	movne	%icc,	%g5,	%i7
	or	%o3,	%i4,	%i2
	srl	%l3,	%g7,	%o6
	edge8	%o7,	%o2,	%i1
	fbn	%fcc0,	loop_2687
	subc	%o0,	%g2,	%o5
	movneg	%icc,	%i6,	%l4
	fornot2s	%f11,	%f18,	%f6
loop_2687:
	tcc	%icc,	0x4
	edge32l	%g6,	%i5,	%l5
	popc	0x1539,	%o4
	tvc	%icc,	0x6
	smulcc	%l2,	0x1486,	%i3
	movg	%xcc,	%g4,	%i0
	edge32	%l1,	%l6,	%g3
	movrne	%l0,	0x341,	%g1
	tvs	%icc,	0x1
	nop
	fitos	%f27,	%f13
	bvs,a,pt	%xcc,	loop_2688
	array32	%o1,	%i7,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc0,	loop_2689
loop_2688:
	addccc	%g5,	0x1CCC,	%i4
	edge8n	%i2,	%l3,	%g7
	taddcctv	%o6,	0x151D,	%o7
loop_2689:
	mulx	%o2,	0x03BD,	%i1
	movrlz	%o0,	0x027,	%o5
	sdivcc	%i6,	0x0E7D,	%g2
	movcs	%icc,	%g6,	%i5
	ldsh	[%l7 + 0x5A],	%l4
	andcc	%l5,	%l2,	%o4
	sub	%i3,	0x1A15,	%g4
	popc	%i0,	%l6
	bge,a,pn	%icc,	loop_2690
	movre	%g3,	%l0,	%l1
	fmovsneg	%xcc,	%f28,	%f19
	fmovs	%f25,	%f28
loop_2690:
	movrlez	%g1,	0x1BF,	%i7
	movrlez	%o1,	%o3,	%i4
	tn	%xcc,	0x3
	tpos	%icc,	0x3
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0xf0
	membar	#Sync
	nop
	setx	loop_2691,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%i2,	%g5,	%g7
	edge8n	%l3,	%o7,	%o2
	xor	%o6,	%o0,	%o5
loop_2691:
	bge,pt	%xcc,	loop_2692
	mulscc	%i1,	%g2,	%g6
	fpsub32	%f4,	%f12,	%f14
	alignaddrl	%i6,	%l4,	%i5
loop_2692:
	array32	%l5,	%o4,	%i3
	movcs	%xcc,	%l2,	%i0
	array8	%g4,	%g3,	%l0
	fbe	%fcc1,	loop_2693
	fandnot1s	%f14,	%f24,	%f20
	nop
	fitod	%f12,	%f16
	fdtos	%f16,	%f2
	ldstub	[%l7 + 0x62],	%l6
loop_2693:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%i7
	sll	%o1,	%o3,	%i4
	bshuffle	%f20,	%f0,	%f10
	smulcc	%l1,	0x0CE8,	%g5
	nop
	set	0x42, %o2
	ldstub	[%l7 + %o2],	%g7
	movpos	%xcc,	%l3,	%i2
	tgu	%xcc,	0x1
	ldd	[%l7 + 0x70],	%o2
	fbl,a	%fcc1,	loop_2694
	fbo,a	%fcc1,	loop_2695
	tcc	%xcc,	0x2
	alignaddrl	%o7,	%o0,	%o5
loop_2694:
	nop
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x70] %asi,	%i1
loop_2695:
	srl	%o6,	%g6,	%i6
	movleu	%xcc,	%l4,	%i5
	edge32n	%l5,	%o4,	%g2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%i3
	fmovrslez	%g4,	%f1,	%f0
	fbl,a	%fcc1,	loop_2696
	lduw	[%l7 + 0x78],	%g3
	fxors	%f6,	%f18,	%f7
	umulcc	%l0,	%l6,	%g1
loop_2696:
	bge,a,pt	%xcc,	loop_2697
	movvs	%xcc,	%i0,	%o1
	sub	%o3,	%i7,	%l1
	movcc	%xcc,	%i4,	%g7
loop_2697:
	move	%xcc,	%l3,	%i2
	edge16n	%g5,	%o7,	%o0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x10,	%o2,	%i1
	fmovrslz	%o6,	%f25,	%f8
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	smul	%o5,	0x048D,	%g6
	addccc	%l4,	0x18BB,	%i6
	array8	%i5,	%l5,	%g2
	bcs,a,pn	%icc,	loop_2698
	add	%l2,	0x093A,	%i3
	bl,a,pn	%icc,	loop_2699
	bvs	%xcc,	loop_2700
loop_2698:
	sir	0x13E8
	tcc	%xcc,	0x1
loop_2699:
	bleu	loop_2701
loop_2700:
	fbue,a	%fcc2,	loop_2702
	bcc	%xcc,	loop_2703
	bvs,a	loop_2704
loop_2701:
	fmovsvs	%icc,	%f7,	%f28
loop_2702:
	ld	[%l7 + 0x1C],	%f3
loop_2703:
	fmovspos	%xcc,	%f0,	%f29
loop_2704:
	movn	%xcc,	%g4,	%o4
	movrlez	%l0,	%g3,	%g1
	sra	%l6,	0x00,	%i0
	udiv	%o1,	0x036C,	%o3
	tgu	%icc,	0x7
	movcs	%icc,	%i7,	%i4
	fbul,a	%fcc2,	loop_2705
	sir	0x169F
	bne,a	%xcc,	loop_2706
	tge	%icc,	0x7
loop_2705:
	orcc	%g7,	0x03F8,	%l3
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
loop_2706:
	ldx	[%l7 + 0x78],	%g5
	fornot1	%f30,	%f30,	%f30
	xnorcc	%o7,	0x0986,	%l1
	bshuffle	%f2,	%f2,	%f26
	udivx	%o0,	0x0ED3,	%i1
	fmul8ulx16	%f30,	%f18,	%f20
	ta	%xcc,	0x3
	or	%o6,	0x021A,	%o2
	mova	%xcc,	%g6,	%l4
	and	%i6,	0x0D8D,	%i5
	nop
	setx	loop_2707,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%l5,	0x0BC5,	%g2
	fmovdcc	%xcc,	%f13,	%f20
	movg	%icc,	%l2,	%o5
loop_2707:
	array32	%i3,	%g4,	%l0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x0C] %asi,	%f25
	fand	%f26,	%f2,	%f28
	srax	%g3,	0x0F,	%g1
	udiv	%l6,	0x02F1,	%o4
	sdivcc	%i0,	0x08D7,	%o1
	edge8	%o3,	%i7,	%i4
	nop
	setx	0x09983BA6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x5BF6EF27,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f8,	%f27
	addccc	%g7,	%i2,	%g5
	ldx	[%l7 + 0x38],	%l3
	brgz,a	%l1,	loop_2708
	fmul8sux16	%f20,	%f26,	%f26
	fcmpeq16	%f0,	%f0,	%o7
	fmovse	%icc,	%f28,	%f31
loop_2708:
	bcs,pt	%xcc,	loop_2709
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i1,	%o0
	fmovrde	%o6,	%f0,	%f6
loop_2709:
	fmovdcs	%xcc,	%f7,	%f3
	tgu	%xcc,	0x7
	smul	%o2,	0x1EBC,	%l4
	fpackfix	%f24,	%f5
	array8	%g6,	%i6,	%i5
	movneg	%xcc,	%g2,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o5,	0x1BF6,	%i3
	movl	%icc,	%l2,	%g4
	mulx	%l0,	0x1BAD,	%g3
	tge	%xcc,	0x3
	fornot2s	%f1,	%f22,	%f5
	ld	[%l7 + 0x28],	%f15
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l6
	movvc	%xcc,	%g1,	%i0
	movrgez	%o4,	%o1,	%i7
	lduw	[%l7 + 0x44],	%o3
	array16	%g7,	%i4,	%g5
	movvc	%xcc,	%l3,	%i2
	sdiv	%o7,	0x0E0B,	%i1
	edge32l	%o0,	%o6,	%l1
	movge	%icc,	%l4,	%g6
	brlz	%i6,	loop_2710
	umul	%i5,	%g2,	%l5
	bcs,pn	%xcc,	loop_2711
	fcmple32	%f4,	%f8,	%o2
loop_2710:
	edge32n	%i3,	%l2,	%o5
	fbue	%fcc2,	loop_2712
loop_2711:
	mulscc	%l0,	0x1B81,	%g4
	movrgz	%l6,	0x280,	%g1
	smul	%g3,	%o4,	%o1
loop_2712:
	nop
	set	0x70, %o4
	stxa	%i0,	[%l7 + %o4] 0x18
	mulx	%o3,	0x1AD1,	%g7
	alignaddrl	%i4,	%g5,	%i7
	edge8n	%i2,	%l3,	%o7
	movge	%icc,	%o0,	%i1
	ta	%icc,	0x2
	movg	%icc,	%o6,	%l1
	set	0x2E, %l6
	lduha	[%l7 + %l6] 0x88,	%l4
	bn,a	loop_2713
	sll	%g6,	0x1C,	%i5
	nop
	set	0x10, %l1
	prefetch	[%l7 + %l1],	 0x2
	movpos	%icc,	%g2,	%i6
loop_2713:
	xnorcc	%l5,	%o2,	%l2
	fand	%f20,	%f30,	%f2
	nop
	setx	0x44F930B5C9B005B3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f14
	fmovdg	%xcc,	%f25,	%f5
	fmovscc	%xcc,	%f29,	%f27
	alignaddr	%o5,	%l0,	%g4
	taddcctv	%i3,	0x1CA7,	%g1
	movrgz	%g3,	0x2C2,	%l6
	fmovdn	%icc,	%f28,	%f16
	fble	%fcc2,	loop_2714
	fmovscc	%icc,	%f0,	%f21
	fbn	%fcc0,	loop_2715
	edge16	%o1,	%i0,	%o4
loop_2714:
	sdivcc	%o3,	0x0274,	%i4
	subccc	%g5,	0x0D43,	%i7
loop_2715:
	sethi	0x1EE4,	%i2
	smul	%g7,	%l3,	%o0
	fmul8ulx16	%f18,	%f18,	%f26
	sdiv	%o7,	0x1BA6,	%o6
	fcmpne16	%f6,	%f8,	%l1
	movrlz	%i1,	0x349,	%g6
	movvc	%icc,	%i5,	%l4
	std	%f12,	[%l7 + 0x48]
	nop
	setx	loop_2716,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_2717,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%g2,	%l5,	%i6
	fpackfix	%f24,	%f12
loop_2716:
	fnot1	%f30,	%f0
loop_2717:
	nop
	setx	loop_2718,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbe	%fcc2,	loop_2719
	orcc	%o2,	0x0D61,	%l2
	te	%icc,	0x7
loop_2718:
	edge8ln	%o5,	%l0,	%g4
loop_2719:
	fmovsn	%xcc,	%f12,	%f17
	fmovsn	%xcc,	%f17,	%f11
	tvs	%xcc,	0x6
	st	%f15,	[%l7 + 0x44]
	srl	%i3,	0x08,	%g3
	sdivcc	%l6,	0x0726,	%o1
	movpos	%icc,	%i0,	%o4
	fnors	%f31,	%f12,	%f2
	movrgz	%g1,	%o3,	%i4
	alignaddr	%g5,	%i2,	%i7
	smul	%g7,	0x0D55,	%l3
	edge16l	%o0,	%o7,	%l1
	ldsw	[%l7 + 0x54],	%o6
	tgu	%xcc,	0x2
	movg	%icc,	%g6,	%i5
	fmovdpos	%icc,	%f8,	%f9
	ldd	[%l7 + 0x08],	%i0
	flush	%l7 + 0x14
	edge16l	%g2,	%l5,	%i6
	mova	%xcc,	%o2,	%l4
	te	%icc,	0x7
	fcmpeq16	%f8,	%f14,	%o5
	call	loop_2720
	te	%xcc,	0x4
	ldsb	[%l7 + 0x5F],	%l0
	ta	%icc,	0x2
loop_2720:
	edge16	%l2,	%g4,	%i3
	fmuld8ulx16	%f28,	%f5,	%f8
	edge32	%l6,	%g3,	%o1
	movcc	%xcc,	%o4,	%i0
	fcmpne32	%f20,	%f28,	%g1
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x17
	membar	#Sync
	tne	%icc,	0x4
	fmuld8sux16	%f0,	%f17,	%f22
	tsubcc	%i4,	0x07D2,	%o3
	bne,pt	%xcc,	loop_2721
	umul	%i2,	%i7,	%g7
	fands	%f2,	%f18,	%f23
	brgez,a	%g5,	loop_2722
loop_2721:
	fzero	%f14
	movgu	%icc,	%l3,	%o0
	andcc	%o7,	%o6,	%g6
loop_2722:
	nop
	setx	0xE0B2EC59A0575C5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	tcc	%xcc,	0x2
	edge8	%i5,	%i1,	%l1
	ldsw	[%l7 + 0x60],	%g2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%o2
	movcc	%icc,	%i6,	%l4
	bne,pt	%icc,	loop_2723
	udiv	%l0,	0x1111,	%l2
	sdivx	%o5,	0x0D23,	%g4
	fble	%fcc3,	loop_2724
loop_2723:
	fmovdgu	%xcc,	%f14,	%f21
	addc	%l6,	%i3,	%o1
	fbg	%fcc3,	loop_2725
loop_2724:
	std	%f20,	[%l7 + 0x60]
	bvs,a	%xcc,	loop_2726
	nop
	setx	loop_2727,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2725:
	popc	%o4,	%i0
	for	%f12,	%f20,	%f28
loop_2726:
	fbule,a	%fcc3,	loop_2728
loop_2727:
	andn	%g1,	%g3,	%o3
	movle	%xcc,	%i4,	%i7
	move	%xcc,	%g7,	%i2
loop_2728:
	tvs	%xcc,	0x0
	bvc,a	loop_2729
	edge32	%g5,	%l3,	%o7
	udivcc	%o0,	0x199B,	%g6
	brz,a	%o6,	loop_2730
loop_2729:
	bne,pn	%icc,	loop_2731
	addcc	%i1,	%l1,	%i5
	taddcc	%g2,	%o2,	%l5
loop_2730:
	taddcc	%i6,	0x1727,	%l0
loop_2731:
	tvc	%icc,	0x0
	xor	%l4,	0x09EE,	%o5
	taddcc	%g4,	0x0C44,	%l2
	tne	%xcc,	0x2
	ldsw	[%l7 + 0x2C],	%i3
	nop
	setx loop_2732, %l0, %l1
	jmpl %l1, %l6
	tne	%icc,	0x6
	andn	%o1,	0x05DE,	%o4
	mulscc	%g1,	%g3,	%o3
loop_2732:
	tgu	%icc,	0x1
	andn	%i4,	%i0,	%g7
	bvc	%xcc,	loop_2733
	fbne,a	%fcc0,	loop_2734
	fmovrslez	%i7,	%f29,	%f3
	fone	%f6
loop_2733:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2734:
	tsubcctv	%g5,	0x0ECA,	%l3
	tvc	%xcc,	0x3
	fbue	%fcc0,	loop_2735
	fandnot1	%f2,	%f4,	%f24
	set	0x68, %g6
	stha	%o7,	[%l7 + %g6] 0x11
loop_2735:
	fmovsneg	%xcc,	%f17,	%f4
	set	0x5E, %o5
	ldstuba	[%l7 + %o5] 0x10,	%o0
	fpadd16	%f4,	%f4,	%f12
	ta	%icc,	0x6
	fsrc1	%f0,	%f14
	movpos	%icc,	%g6,	%i2
	movvc	%xcc,	%o6,	%l1
	andncc	%i1,	%g2,	%o2
	ldx	[%l7 + 0x58],	%i5
	fpack32	%f10,	%f16,	%f14
	fbe,a	%fcc1,	loop_2736
	bcc,a,pn	%xcc,	loop_2737
	udivx	%i6,	0x045A,	%l5
	movrgez	%l4,	0x261,	%l0
loop_2736:
	fmovsn	%xcc,	%f12,	%f24
loop_2737:
	nop
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%g4,	%o5
	array32	%i3,	%l6,	%l2
	fpsub16s	%f28,	%f17,	%f6
	subc	%o4,	0x1700,	%g1
	nop
	fitod	%f27,	%f16
	bpos,a,pn	%icc,	loop_2738
	taddcctv	%o1,	%o3,	%i4
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x2b,	%g2
loop_2738:
	fmovdleu	%icc,	%f20,	%f19
	fbul,a	%fcc0,	loop_2739
	movrne	%i0,	0x218,	%g7
	movrlz	%i7,	%l3,	%g5
	taddcctv	%o0,	0x172B,	%o7
loop_2739:
	ba,a,pt	%icc,	loop_2740
	ldsb	[%l7 + 0x13],	%g6
	fornot1	%f30,	%f0,	%f18
	fpack32	%f24,	%f26,	%f6
loop_2740:
	nop
	setx	0xA491A63CB05978A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	move	%icc,	%o6,	%i2
	nop
	setx	0xF04ABA06,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	fnot1s	%f7,	%f13
	fsrc1s	%f25,	%f31
	fandnot2	%f0,	%f10,	%f4
	taddcc	%i1,	%l1,	%o2
	movcc	%icc,	%g2,	%i5
	add	%l5,	%i6,	%l4
	fmovdl	%xcc,	%f20,	%f6
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x24] %asi,	%f23
	fbg,a	%fcc1,	loop_2741
	srlx	%l0,	0x03,	%g4
	movg	%xcc,	%o5,	%l6
	fsrc2s	%f25,	%f15
loop_2741:
	add	%l2,	0x0708,	%o4
	add	%g1,	0x0CC9,	%o1
	stw	%o3,	[%l7 + 0x7C]
	udivcc	%i3,	0x1521,	%g3
	bne	%icc,	loop_2742
	srl	%i4,	%i0,	%g7
	fand	%f24,	%f18,	%f22
	edge8l	%i7,	%l3,	%g5
loop_2742:
	nop
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f0
	tl	%icc,	0x0
	fbug,a	%fcc0,	loop_2743
	bn,pt	%icc,	loop_2744
	ta	%xcc,	0x3
	ta	%icc,	0x0
loop_2743:
	fbug,a	%fcc2,	loop_2745
loop_2744:
	mova	%icc,	%o0,	%g6
	nop
	setx	0x2B3C0BA6D0535AC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	fcmpgt32	%f24,	%f6,	%o7
loop_2745:
	nop
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f0
	nop
	setx loop_2746, %l0, %l1
	jmpl %l1, %i2
	bcc,a,pn	%xcc,	loop_2747
	andncc	%i1,	%l1,	%o6
	popc	0x142A,	%g2
loop_2746:
	taddcc	%o2,	0x0527,	%l5
loop_2747:
	sllx	%i5,	0x15,	%i6
	edge32ln	%l4,	%g4,	%l0
	fmovsl	%xcc,	%f29,	%f22
	fmovrse	%o5,	%f20,	%f16
	mulx	%l6,	%o4,	%l2
	orn	%g1,	0x0AE4,	%o1
	mulscc	%o3,	0x180A,	%i3
	movge	%xcc,	%g3,	%i4
	movre	%g7,	0x009,	%i7
	fors	%f25,	%f12,	%f16
	nop
	setx	loop_2748,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sethi	0x0073,	%l3
	addcc	%i0,	0x1BDE,	%g5
	fcmpgt32	%f16,	%f20,	%g6
loop_2748:
	fbl	%fcc2,	loop_2749
	movrgez	%o7,	%i2,	%i1
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2749:
	fsrc1	%f6,	%f24
	orcc	%l1,	0x0116,	%o0
	edge8l	%g2,	%o2,	%l5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x64] %asi,	%i5
	nop
	setx	0x566E762E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x9A7AF97B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f31,	%f31
	array16	%i6,	%o6,	%g4
	membar	0x00
	edge32n	%l4,	%l0,	%o5
	fmovdcs	%icc,	%f25,	%f17
	sir	0x0448
	fexpand	%f15,	%f0
	ta	%xcc,	0x0
	fnegd	%f26,	%f30
	nop
	fitod	%f8,	%f26
	fdtos	%f26,	%f18
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x57] %asi,	%o4
	edge32	%l6,	%l2,	%g1
	udivx	%o3,	0x0D21,	%i3
	andncc	%g3,	%o1,	%g7
	edge8ln	%i4,	%i7,	%i0
	bg,a	%icc,	loop_2750
	call	loop_2751
	fpadd16	%f0,	%f26,	%f2
	bvc,a	loop_2752
loop_2750:
	tcc	%xcc,	0x6
loop_2751:
	te	%xcc,	0x4
	tgu	%icc,	0x1
loop_2752:
	movge	%xcc,	%l3,	%g5
	fmovrde	%o7,	%f28,	%f24
	fbule	%fcc1,	loop_2753
	tcc	%icc,	0x0
	srax	%g6,	%i2,	%l1
	orn	%o0,	%g2,	%i1
loop_2753:
	tle	%xcc,	0x0
	te	%xcc,	0x0
	addc	%o2,	0x11EE,	%i5
	popc	0x0DF4,	%l5
	ldd	[%l7 + 0x58],	%f14
	fmovdne	%icc,	%f13,	%f23
	fmovrsgez	%i6,	%f24,	%f21
	fble	%fcc0,	loop_2754
	umulcc	%o6,	%l4,	%g4
	addc	%l0,	0x1646,	%o4
	bge,a	loop_2755
loop_2754:
	brz	%l6,	loop_2756
	movgu	%icc,	%l2,	%g1
	fbue,a	%fcc1,	loop_2757
loop_2755:
	movne	%xcc,	%o5,	%i3
loop_2756:
	fbue,a	%fcc3,	loop_2758
	edge32	%g3,	%o1,	%g7
loop_2757:
	movle	%xcc,	%o3,	%i4
	fmuld8ulx16	%f2,	%f31,	%f12
loop_2758:
	bge	%icc,	loop_2759
	fnors	%f21,	%f0,	%f29
	stbar
	nop
	setx	0xA358D1CAD7B1FB97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xABD4A9CE6D842919,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f14,	%f6
loop_2759:
	subccc	%i7,	%i0,	%g5
	fabsd	%f22,	%f4
	nop
	setx	0x497B93F2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x2FE52FB2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f29,	%f12
	bvs,a	%xcc,	loop_2760
	bvc	%xcc,	loop_2761
	fxor	%f24,	%f18,	%f12
	fbg	%fcc1,	loop_2762
loop_2760:
	andncc	%l3,	%g6,	%i2
loop_2761:
	andncc	%o7,	%l1,	%o0
	fmuld8ulx16	%f12,	%f28,	%f10
loop_2762:
	edge32ln	%i1,	%o2,	%g2
	xorcc	%l5,	0x0243,	%i5
	fmovsg	%xcc,	%f7,	%f18
	edge8ln	%o6,	%l4,	%g4
	andncc	%i6,	%l0,	%l6
	tsubcctv	%l2,	0x1331,	%o4
	movn	%icc,	%o5,	%g1
	te	%icc,	0x3
	wr	%g0,	0x19,	%asi
	sta	%f29,	[%l7 + 0x1C] %asi
	fnot1s	%f2,	%f28
	sra	%i3,	0x00,	%g3
	ldd	[%l7 + 0x50],	%g6
	xorcc	%o3,	%o1,	%i7
	fmovscs	%xcc,	%f5,	%f14
	movrlez	%i4,	0x0A7,	%g5
	ta	%xcc,	0x4
	fcmple16	%f20,	%f24,	%i0
	subc	%l3,	%g6,	%o7
	move	%xcc,	%i2,	%l1
	tpos	%icc,	0x0
	orncc	%o0,	%o2,	%i1
	subc	%l5,	0x1ABB,	%g2
	xor	%i5,	0x0AE3,	%l4
	bne,pt	%icc,	loop_2763
	movvc	%icc,	%o6,	%i6
	fands	%f19,	%f3,	%f2
	array8	%l0,	%l6,	%l2
loop_2763:
	movgu	%xcc,	%o4,	%o5
	srlx	%g1,	%g4,	%g3
	movre	%g7,	%i3,	%o1
	movrlez	%o3,	%i4,	%g5
	tvs	%icc,	0x7
	ldx	[%l7 + 0x28],	%i0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i7,	%l3
	taddcc	%o7,	%i2,	%g6
	orcc	%o0,	%o2,	%l1
	andncc	%i1,	%g2,	%i5
	fmovdle	%xcc,	%f24,	%f6
	ba,a	%icc,	loop_2764
	fnor	%f4,	%f8,	%f16
	add	%l7,	0x10,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x11,	%l5,	%l4
loop_2764:
	fmovrslez	%o6,	%f18,	%f13
	fmovdcs	%xcc,	%f25,	%f6
	movgu	%icc,	%i6,	%l0
	fmovrdlz	%l2,	%f24,	%f14
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	set	0x6C, %g4
	ldswa	[%l7 + %g4] 0x19,	%o4
	orn	%g1,	0x1091,	%o5
	nop
	fitos	%f20,	%f3
	subc	%g3,	0x1F3D,	%g7
	addccc	%i3,	0x13CD,	%o1
	tle	%icc,	0x0
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%i4
	tn	%xcc,	0x6
	fones	%f29
	movne	%icc,	%o3,	%i0
	fbn	%fcc1,	loop_2765
	fmovrsgez	%i7,	%f21,	%f23
	add	%g5,	0x060F,	%o7
	fmovse	%xcc,	%f4,	%f26
loop_2765:
	edge16l	%l3,	%i2,	%o0
	tleu	%xcc,	0x6
	fmul8x16	%f8,	%f12,	%f26
	fnot2	%f26,	%f4
	movvc	%icc,	%o2,	%l1
	ldub	[%l7 + 0x53],	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x6
	ldub	[%l7 + 0x3C],	%g2
	ldstub	[%l7 + 0x0D],	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f1,	%f24
	call	loop_2766
	tcs	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g6,	0x013A,	%l5
loop_2766:
	sllx	%o6,	0x05,	%l4
	fcmpgt16	%f10,	%f28,	%i6
	addc	%l2,	0x140F,	%l6
	fandnot1s	%f29,	%f15,	%f1
	fmul8x16al	%f25,	%f30,	%f26
	edge32	%l0,	%o4,	%o5
	taddcctv	%g1,	0x0B2C,	%g3
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x32] %asi,	%i3
	udivx	%o1,	0x182A,	%g4
	tne	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x0
	set	0x3C, %i5
	lduwa	[%l7 + %i5] 0x88,	%g7
	edge16n	%o3,	%i4,	%i7
	nop
	setx	0x380AFD68541E07FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x1CE069A83EE86F84,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f0,	%f28
	taddcctv	%g5,	%o7,	%i0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x63] %asi,	%i2
	movle	%icc,	%l3,	%o0
	xorcc	%o2,	0x0363,	%l1
	for	%f24,	%f2,	%f12
	fmovdgu	%icc,	%f16,	%f11
	movrlez	%g2,	0x3AA,	%i5
	wr	%g0,	0x10,	%asi
	stha	%i1,	[%l7 + 0x34] %asi
	fmovspos	%icc,	%f23,	%f31
	bcc	%icc,	loop_2767
	bcc,a	%xcc,	loop_2768
	edge8ln	%g6,	%l5,	%l4
	wr	%g0,	0x0c,	%asi
	stxa	%o6,	[%l7 + 0x68] %asi
loop_2767:
	and	%l2,	0x0F2C,	%l6
loop_2768:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%l0
	movrgez	%o4,	0x201,	%o5
	pdist	%f16,	%f6,	%f14
	movcc	%icc,	%g3,	%g1
	subc	%o1,	%i3,	%g7
	movl	%xcc,	%g4,	%i4
	fmovrdlz	%o3,	%f26,	%f6
	stw	%g5,	[%l7 + 0x48]
	tle	%xcc,	0x0
	movvc	%xcc,	%i7,	%i0
	fbu	%fcc0,	loop_2769
	sdivx	%i2,	0x1121,	%l3
	sethi	0x1BB6,	%o7
	movne	%xcc,	%o0,	%o2
loop_2769:
	movrne	%l1,	0x32F,	%g2
	nop
	set	0x2A, %l0
	stb	%i1,	[%l7 + %l0]
	array16	%g6,	%l5,	%l4
	fsrc1s	%f12,	%f3
	umulcc	%i5,	%l2,	%l6
	movg	%xcc,	%i6,	%o6
	taddcctv	%o4,	0x0541,	%l0
	fmovsne	%icc,	%f2,	%f31
	fmovdg	%xcc,	%f28,	%f0
	membar	0x52
	set	0x3D, %o0
	ldstuba	[%l7 + %o0] 0x0c,	%g3
	nop
	fitod	%f0,	%f14
	fdtox	%f14,	%f26
	fxtod	%f26,	%f18
	edge8l	%o5,	%g1,	%i3
	ldsw	[%l7 + 0x28],	%g7
	movne	%xcc,	%o1,	%i4
	orcc	%o3,	%g5,	%g4
	xnor	%i7,	%i0,	%l3
	array8	%i2,	%o0,	%o2
	fbl,a	%fcc0,	loop_2770
	te	%xcc,	0x3
	ldub	[%l7 + 0x5C],	%l1
	udiv	%o7,	0x0C35,	%g2
loop_2770:
	brgez,a	%i1,	loop_2771
	sethi	0x19A6,	%g6
	fandnot2	%f16,	%f10,	%f20
	prefetch	[%l7 + 0x78],	 0x2
loop_2771:
	movvs	%xcc,	%l4,	%i5
	fmovspos	%xcc,	%f0,	%f15
	movcc	%xcc,	%l5,	%l2
	movcs	%xcc,	%l6,	%i6
	ta	%xcc,	0x7
	taddcctv	%o6,	%o4,	%g3
	fmovrdlz	%o5,	%f18,	%f26
	membar	0x1F
	fnor	%f2,	%f26,	%f18
	sth	%l0,	[%l7 + 0x58]
	lduh	[%l7 + 0x34],	%g1
	fmul8x16al	%f19,	%f27,	%f30
	lduh	[%l7 + 0x62],	%g7
	fmuld8sux16	%f17,	%f3,	%f16
	prefetch	[%l7 + 0x30],	 0x3
	set	0x08, %l3
	stxa	%i3,	[%l7 + %l3] 0xe3
	membar	#Sync
	sub	%i4,	0x1803,	%o1
	fpsub16s	%f21,	%f9,	%f11
	movvc	%icc,	%g5,	%g4
	fmovse	%xcc,	%f23,	%f25
	fmovda	%icc,	%f28,	%f6
	array32	%o3,	%i7,	%i0
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f26
	fxtod	%f26,	%f2
	edge32n	%l3,	%o0,	%o2
	movne	%icc,	%i2,	%l1
	edge16n	%g2,	%i1,	%o7
	movn	%icc,	%l4,	%g6
	movrgz	%l5,	%l2,	%l6
	movrlz	%i5,	0x3A1,	%i6
	fornot1s	%f8,	%f22,	%f2
	orcc	%o6,	%o4,	%o5
	mova	%xcc,	%g3,	%g1
	edge16l	%l0,	%i3,	%g7
	tne	%xcc,	0x2
	fbul,a	%fcc3,	loop_2772
	smul	%o1,	0x1CAB,	%g5
	movcs	%icc,	%g4,	%i4
	movge	%xcc,	%o3,	%i7
loop_2772:
	fpadd32s	%f20,	%f9,	%f0
	tsubcc	%l3,	%o0,	%i0
	umulcc	%i2,	0x1B13,	%l1
	fpack16	%f0,	%f21
	fands	%f11,	%f7,	%f2
	fmovrde	%g2,	%f0,	%f20
	subc	%i1,	0x03C1,	%o7
	srax	%l4,	0x18,	%g6
	bn,a,pt	%icc,	loop_2773
	edge32ln	%o2,	%l5,	%l2
	bn,a	%icc,	loop_2774
	swap	[%l7 + 0x70],	%i5
loop_2773:
	fmovrsne	%l6,	%f3,	%f17
	movpos	%xcc,	%o6,	%o4
loop_2774:
	tleu	%xcc,	0x4
	umulcc	%o5,	0x0B38,	%i6
	taddcc	%g3,	%l0,	%i3
	orncc	%g1,	0x1CB1,	%g7
	array16	%o1,	%g4,	%g5
	xorcc	%o3,	0x1655,	%i7
	movg	%xcc,	%l3,	%o0
	fbl	%fcc1,	loop_2775
	fbul	%fcc2,	loop_2776
	fmovsgu	%icc,	%f22,	%f23
	orn	%i0,	0x0CF5,	%i4
loop_2775:
	ldx	[%l7 + 0x30],	%l1
loop_2776:
	edge16n	%i2,	%g2,	%o7
	tl	%xcc,	0x1
	nop
	setx loop_2777, %l0, %l1
	jmpl %l1, %i1
	movrgez	%g6,	0x3F8,	%l4
	array16	%o2,	%l2,	%l5
	fornot2	%f26,	%f20,	%f0
loop_2777:
	nop
	fitos	%f1,	%f21
	fstox	%f21,	%f30
	fxtos	%f30,	%f17
	subccc	%i5,	%l6,	%o6
	fbug,a	%fcc2,	loop_2778
	srlx	%o5,	0x00,	%i6
	edge8l	%g3,	%l0,	%o4
	fmovrdgz	%i3,	%f2,	%f14
loop_2778:
	sra	%g1,	0x0B,	%o1
	fandnot2s	%f3,	%f15,	%f15
	bvc,a,pn	%xcc,	loop_2779
	stw	%g7,	[%l7 + 0x40]
	or	%g4,	%o3,	%i7
	prefetch	[%l7 + 0x30],	 0x0
loop_2779:
	tcc	%xcc,	0x2
	fmovscc	%icc,	%f13,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x38],	%l3
	brlez,a	%g5,	loop_2780
	umul	%i0,	%o0,	%i4
	tsubcc	%l1,	0x12E8,	%i2
	umul	%o7,	0x0614,	%i1
loop_2780:
	orncc	%g2,	%g6,	%l4
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
	movne	%icc,	%l5,	%l2
	stw	%l6,	[%l7 + 0x50]
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x50] %asi,	%i5
	movpos	%icc,	%o5,	%o6
	edge32l	%i6,	%l0,	%g3
	movpos	%icc,	%o4,	%i3
	xnorcc	%o1,	0x1B2A,	%g1
	xnorcc	%g7,	%g4,	%o3
	fornot2s	%f18,	%f11,	%f2
	move	%icc,	%l3,	%i7
	tleu	%xcc,	0x5
	udivcc	%g5,	0x1E38,	%o0
	taddcc	%i0,	%l1,	%i2
	set	0x44, %o7
	ldsha	[%l7 + %o7] 0x18,	%o7
	fnot2	%f10,	%f14
	tgu	%xcc,	0x5
	set	0x70, %l5
	prefetcha	[%l7 + %l5] 0x88,	 0x2
	ba,a	loop_2781
	fcmpne32	%f12,	%f18,	%g2
	fbl,a	%fcc1,	loop_2782
	movrgz	%i4,	%l4,	%g6
loop_2781:
	movpos	%xcc,	%o2,	%l2
	ta	%icc,	0x7
loop_2782:
	ldsw	[%l7 + 0x14],	%l6
	tvs	%xcc,	0x5
	movrlz	%i5,	0x359,	%l5
	fnot2	%f14,	%f18
	fpadd32	%f4,	%f0,	%f0
	fmovrsne	%o5,	%f19,	%f1
	stb	%i6,	[%l7 + 0x0B]
	flush	%l7 + 0x68
	edge8	%o6,	%g3,	%l0
	fbo	%fcc0,	loop_2783
	movvc	%xcc,	%o4,	%o1
	wr	%g0,	0x2f,	%asi
	stha	%g1,	[%l7 + 0x6A] %asi
	membar	#Sync
loop_2783:
	movre	%g7,	%i3,	%g4
	ldx	[%l7 + 0x18],	%o3
	ld	[%l7 + 0x68],	%f20
	udivx	%i7,	0x06DC,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l3,	0x02DF,	%o0
	fabsd	%f16,	%f6
	mulscc	%l1,	%i2,	%o7
	ta	%icc,	0x3
	sdivcc	%i1,	0x19F6,	%i0
	xnorcc	%g2,	%l4,	%i4
	sir	0x0D88
	tl	%xcc,	0x2
	brgz	%g6,	loop_2784
	fand	%f26,	%f28,	%f10
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%l2
loop_2784:
	brlz	%o2,	loop_2785
	tcs	%xcc,	0x5
	sethi	0x1B87,	%i5
	tsubcctv	%l6,	%l5,	%o5
loop_2785:
	udivx	%o6,	0x0C49,	%i6
	call	loop_2786
	movn	%xcc,	%g3,	%o4
	addcc	%l0,	%g1,	%o1
	fmovrdgez	%g7,	%f6,	%f24
loop_2786:
	array8	%i3,	%g4,	%o3
	tge	%xcc,	0x3
	ldstub	[%l7 + 0x1A],	%i7
	or	%l3,	0x0C57,	%o0
	movgu	%xcc,	%l1,	%i2
	udiv	%g5,	0x089E,	%o7
	movvs	%xcc,	%i1,	%i0
	edge32l	%l4,	%i4,	%g2
	edge8n	%l2,	%o2,	%i5
	ldd	[%l7 + 0x20],	%f0
	movle	%icc,	%g6,	%l5
	movrgz	%o5,	%l6,	%o6
	set	0x18, %g1
	stwa	%i6,	[%l7 + %g1] 0xea
	membar	#Sync
	movneg	%icc,	%g3,	%o4
	edge32ln	%g1,	%o1,	%g7
	te	%xcc,	0x6
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x15
	nop
	setx	0xD51BF3D4DDA6C737,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x7E1BC10678E26FF1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f2,	%f12
	for	%f2,	%f26,	%f0
	stw	%l0,	[%l7 + 0x0C]
	edge32ln	%g4,	%i3,	%o3
	tne	%icc,	0x5
	ldsh	[%l7 + 0x12],	%l3
	umulcc	%i7,	0x1697,	%o0
	edge8ln	%i2,	%l1,	%g5
	edge8ln	%o7,	%i1,	%l4
	xor	%i4,	%i0,	%l2
	tvs	%xcc,	0x3
	fmovrse	%o2,	%f21,	%f6
	brlz,a	%g2,	loop_2787
	or	%i5,	%l5,	%g6
	movle	%icc,	%l6,	%o6
	fmovsne	%xcc,	%f27,	%f11
loop_2787:
	array8	%i6,	%g3,	%o5
	ldd	[%l7 + 0x48],	%o4
	tge	%xcc,	0x5
	orcc	%o1,	0x118B,	%g7
	addcc	%g1,	0x1D79,	%l0
	fmuld8ulx16	%f4,	%f30,	%f6
	nop
	fitos	%f2,	%f12
	fmovrslez	%g4,	%f22,	%f4
	fpsub32s	%f19,	%f27,	%f13
	array32	%o3,	%l3,	%i3
	orcc	%o0,	%i7,	%i2
	and	%l1,	0x1EA1,	%g5
	sth	%i1,	[%l7 + 0x2A]
	andncc	%o7,	%i4,	%i0
	sdivx	%l4,	0x1B1C,	%o2
	stw	%g2,	[%l7 + 0x40]
	subccc	%l2,	0x12E2,	%l5
	array16	%g6,	%i5,	%l6
	nop
	fitos	%f7,	%f17
	fstox	%f17,	%f16
	fxtos	%f16,	%f0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%g3
	nop
	setx	0x2D19E001,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x020EB5E1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f15,	%f24
	brz	%o6,	loop_2788
	subc	%o5,	%o1,	%g7
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x88,	 0x3
loop_2788:
	fnot1	%f28,	%f30
	movne	%xcc,	%g1,	%l0
	stx	%o3,	[%l7 + 0x08]
	addcc	%l3,	0x1C55,	%g4
	fmovrdlz	%o0,	%f10,	%f22
	edge8	%i3,	%i2,	%i7
	movg	%xcc,	%g5,	%l1
	fmovdneg	%xcc,	%f6,	%f30
	edge16n	%i1,	%o7,	%i4
	array32	%l4,	%o2,	%i0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g2,	%l5
	set	0x10, %i1
	prefetcha	[%l7 + %i1] 0x15,	 0x2
	fbe	%fcc1,	loop_2789
	subccc	%l2,	%l6,	%i5
	array8	%i6,	%g3,	%o5
	edge8l	%o1,	%o6,	%o4
loop_2789:
	brlez	%g1,	loop_2790
	srlx	%g7,	%o3,	%l3
	array32	%l0,	%g4,	%o0
	srlx	%i3,	0x0E,	%i2
loop_2790:
	fpmerge	%f21,	%f19,	%f30
	bvs,a,pt	%xcc,	loop_2791
	sir	0x1EC4
	nop
	fitos	%f3,	%f24
	fstox	%f24,	%f12
	sdivx	%g5,	0x0C87,	%l1
loop_2791:
	edge16	%i7,	%i1,	%i4
	move	%xcc,	%l4,	%o2
	ldsb	[%l7 + 0x0E],	%i0
	edge8n	%g2,	%l5,	%g6
	array32	%l2,	%o7,	%i5
	movgu	%icc,	%i6,	%l6
	fcmpgt16	%f6,	%f18,	%g3
	movvc	%icc,	%o1,	%o5
	tg	%icc,	0x0
	movpos	%icc,	%o4,	%g1
	alignaddrl	%o6,	%o3,	%g7
	and	%l0,	%l3,	%g4
	tpos	%icc,	0x2
	movg	%icc,	%i3,	%i2
	movvs	%xcc,	%g5,	%l1
	tne	%xcc,	0x0
	sdivx	%o0,	0x0A03,	%i1
	fsrc2	%f4,	%f30
	mova	%icc,	%i4,	%l4
	edge16l	%o2,	%i0,	%i7
	stbar
	movgu	%xcc,	%l5,	%g2
	fzeros	%f4
	fsrc2	%f0,	%f18
	sdivcc	%l2,	0x1179,	%g6
	mulx	%i5,	%o7,	%i6
	array32	%g3,	%o1,	%l6
	xor	%o4,	0x1617,	%o5
	movvs	%icc,	%g1,	%o3
	fmovspos	%xcc,	%f15,	%f29
	tsubcc	%g7,	0x0D4F,	%l0
	tcc	%icc,	0x6
	ble,a,pt	%icc,	loop_2792
	fmovrdlz	%o6,	%f14,	%f4
	bn,a,pt	%xcc,	loop_2793
	edge32ln	%l3,	%i3,	%i2
loop_2792:
	nop
	set	0x2E, %l4
	stha	%g5,	[%l7 + %l4] 0x10
loop_2793:
	smulcc	%g4,	%o0,	%l1
	fbo	%fcc0,	loop_2794
	movg	%xcc,	%i1,	%i4
	tge	%icc,	0x5
	edge16n	%l4,	%o2,	%i7
loop_2794:
	srlx	%i0,	%l5,	%g2
	tsubcctv	%l2,	0x1D2B,	%g6
	movvs	%xcc,	%o7,	%i5
	nop
	setx	0xC0F71FDEB90C5535,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB0CDCFBACA82ED04,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f16,	%f24
	brnz,a	%g3,	loop_2795
	movgu	%icc,	%o1,	%l6
	nop
	setx	loop_2796,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array32	%i6,	%o5,	%o4
loop_2795:
	fmovdpos	%xcc,	%f28,	%f28
	array32	%o3,	%g7,	%l0
loop_2796:
	umulcc	%g1,	%l3,	%o6
	nop
	setx	0x9165D2C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x23DCC3D5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f17,	%f10
	bneg	%xcc,	loop_2797
	fxor	%f14,	%f2,	%f0
	fbge	%fcc3,	loop_2798
	sethi	0x1E79,	%i2
loop_2797:
	alignaddr	%g5,	%i3,	%g4
	andncc	%l1,	%o0,	%i4
loop_2798:
	fmovsle	%xcc,	%f15,	%f18
	tne	%icc,	0x1
	array32	%i1,	%o2,	%l4
	tne	%icc,	0x4
	swap	[%l7 + 0x7C],	%i0
	set	0x58, %i2
	ldstuba	[%l7 + %i2] 0x11,	%i7
	fpadd16	%f6,	%f12,	%f16
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x68] %asi,	%l5
	sethi	0x10C0,	%g2
	edge32	%l2,	%g6,	%o7
	tvc	%icc,	0x4
	bgu,pt	%xcc,	loop_2799
	nop
	setx	0xFACD301D7CC1DC70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x3F3EEB7636A843E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f26,	%f30
	set	0x3C, %o6
	lda	[%l7 + %o6] 0x89,	%f7
loop_2799:
	array16	%i5,	%o1,	%g3
	fbe	%fcc1,	loop_2800
	brz,a	%i6,	loop_2801
	fmovrde	%o5,	%f30,	%f24
	ldsw	[%l7 + 0x50],	%l6
loop_2800:
	andcc	%o3,	%o4,	%g7
loop_2801:
	movleu	%icc,	%g1,	%l3
	flush	%l7 + 0x1C
	fpadd16	%f16,	%f18,	%f6
	tneg	%xcc,	0x2
	array32	%o6,	%l0,	%i2
	fmul8x16al	%f15,	%f0,	%f6
	fpadd16	%f28,	%f2,	%f6
	ldsh	[%l7 + 0x74],	%g5
	brgz,a	%g4,	loop_2802
	edge8l	%l1,	%o0,	%i3
	fmovrse	%i4,	%f19,	%f2
	movne	%icc,	%o2,	%l4
loop_2802:
	sdivx	%i0,	0x15DE,	%i1
	movge	%icc,	%l5,	%g2
	fpadd16s	%f23,	%f4,	%f22
	array8	%l2,	%g6,	%o7
	movle	%icc,	%i7,	%i5
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x70] %asi,	%g3
	fornot2	%f14,	%f22,	%f12
	sllx	%i6,	%o5,	%o1
	movle	%icc,	%l6,	%o3
	mulscc	%o4,	0x0A85,	%g1
	fpackfix	%f30,	%f31
	edge8l	%l3,	%g7,	%l0
	set	0x60, %i6
	ldda	[%l7 + %i6] 0xea,	%i2
	fands	%f27,	%f11,	%f24
	edge8ln	%g5,	%o6,	%l1
	or	%o0,	%i3,	%i4
	brgz	%g4,	loop_2803
	fbu,a	%fcc0,	loop_2804
	move	%icc,	%l4,	%i0
	and	%o2,	0x1E13,	%i1
loop_2803:
	fone	%f24
loop_2804:
	bshuffle	%f18,	%f2,	%f26
	nop
	setx	loop_2805,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x7C, %o1
	sth	%l5,	[%l7 + %o1]
	brnz,a	%g2,	loop_2806
	brgez	%g6,	loop_2807
loop_2805:
	udiv	%l2,	0x0089,	%o7
	swap	[%l7 + 0x0C],	%i7
loop_2806:
	nop
	set	0x14, %i3
	sth	%g3,	[%l7 + %i3]
loop_2807:
	fpack16	%f28,	%f20
	andncc	%i5,	%i6,	%o1
	fbe	%fcc1,	loop_2808
	movl	%icc,	%l6,	%o3
	movn	%xcc,	%o5,	%o4
	taddcctv	%g1,	%g7,	%l3
loop_2808:
	orcc	%l0,	%g5,	%i2
	stb	%o6,	[%l7 + 0x5A]
	nop
	fitod	%f6,	%f24
	fdtos	%f24,	%f24
	smulcc	%o0,	%l1,	%i3
	alignaddr	%i4,	%l4,	%i0
	edge8l	%g4,	%i1,	%o2
	popc	%g2,	%g6
	fzeros	%f4
	nop
	set	0x4E, %i0
	sth	%l5,	[%l7 + %i0]
	movl	%xcc,	%l2,	%i7
	edge16ln	%g3,	%o7,	%i6
	smul	%o1,	%l6,	%i5
	subc	%o5,	0x1A73,	%o4
	fxnor	%f22,	%f12,	%f20
	fcmpne32	%f12,	%f6,	%o3
	taddcc	%g1,	0x05F8,	%l3
	fandnot1	%f12,	%f28,	%f10
	nop
	set	0x1C, %o3
	sth	%g7,	[%l7 + %o3]
	flush	%l7 + 0x3C
	array32	%l0,	%i2,	%o6
	tvc	%xcc,	0x0
	array8	%g5,	%o0,	%l1
	tge	%xcc,	0x4
	fzeros	%f5
	edge16n	%i3,	%l4,	%i4
	movcc	%icc,	%g4,	%i1
	fbu	%fcc1,	loop_2809
	umulcc	%i0,	%o2,	%g2
	fabsd	%f6,	%f30
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%g6,	%l2
loop_2809:
	smulcc	%i7,	%l5,	%o7
	tle	%xcc,	0x0
	ba,pn	%xcc,	loop_2810
	ldsw	[%l7 + 0x68],	%i6
	ldd	[%l7 + 0x60],	%o0
	fmovrsgez	%g3,	%f2,	%f9
loop_2810:
	fmovdgu	%icc,	%f12,	%f20
	movleu	%xcc,	%i5,	%o5
	mulscc	%o4,	0x0822,	%o3
	ldsb	[%l7 + 0x2C],	%l6
	subccc	%g1,	%l3,	%l0
	set	0x54, %o2
	lduha	[%l7 + %o2] 0x11,	%i2
	movge	%icc,	%o6,	%g7
	fmovdvc	%xcc,	%f23,	%f1
	set	0x4C, %o4
	sta	%f8,	[%l7 + %o4] 0x04
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%g5
	array8	%o0,	%l1,	%l4
	edge32n	%i3,	%g4,	%i4
	brz,a	%i1,	loop_2811
	nop
	fitos	%f4,	%f13
	fstoi	%f13,	%f26
	set	0x78, %g3
	lda	[%l7 + %g3] 0x15,	%f20
loop_2811:
	movleu	%xcc,	%o2,	%g2
	srl	%i0,	0x13,	%g6
	and	%l2,	%i7,	%o7
	xnorcc	%l5,	0x0E34,	%i6
	tg	%xcc,	0x1
	movneg	%xcc,	%o1,	%i5
	sdivx	%o5,	0x083A,	%g3
	ldd	[%l7 + 0x50],	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%g1
	fmovrdne	%o3,	%f16,	%f28
	movl	%xcc,	%l3,	%l0
	fbug,a	%fcc3,	loop_2812
	brgez,a	%o6,	loop_2813
	movge	%icc,	%g7,	%g5
	add	%o0,	0x0E04,	%i2
loop_2812:
	addcc	%l4,	%l1,	%g4
loop_2813:
	fornot2	%f24,	%f28,	%f20
	fpack32	%f0,	%f22,	%f2
	tge	%icc,	0x5
	sir	0x192D
	srax	%i3,	%i1,	%o2
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x18,	%g2,	%i0
	bl	loop_2814
	sth	%i4,	[%l7 + 0x54]
	movleu	%xcc,	%l2,	%i7
	brlz	%g6,	loop_2815
loop_2814:
	xorcc	%l5,	%i6,	%o7
	nop
	setx	loop_2816,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlz,a	%i5,	loop_2817
loop_2815:
	nop
	setx	0xC04D7B5E,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	movcc	%icc,	%o5,	%g3
loop_2816:
	nop
	fitod	%f0,	%f14
	fdtoi	%f14,	%f10
loop_2817:
	tsubcc	%o1,	0x1B42,	%o4
	and	%l6,	%o3,	%l3
	sll	%g1,	%o6,	%g7
	array32	%l0,	%o0,	%g5
	movcs	%icc,	%i2,	%l4
	fmovde	%xcc,	%f14,	%f22
	edge8l	%l1,	%g4,	%i3
	fbu,a	%fcc1,	loop_2818
	smul	%o2,	%g2,	%i1
	fmovrsgz	%i4,	%f7,	%f11
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x88
loop_2818:
	fmovse	%xcc,	%f18,	%f18
	popc	%i0,	%l2
	bcs,a	%xcc,	loop_2819
	movcc	%xcc,	%i7,	%l5
	movvc	%icc,	%g6,	%i6
	array32	%i5,	%o7,	%o5
loop_2819:
	alignaddr	%g3,	%o4,	%l6
	set	0x78, %i4
	sta	%f26,	[%l7 + %i4] 0x88
	srl	%o3,	0x1D,	%l3
	sdivcc	%o1,	0x070B,	%o6
	bcc,pn	%xcc,	loop_2820
	ba,a	loop_2821
	movn	%icc,	%g1,	%g7
	tn	%xcc,	0x1
loop_2820:
	nop
	setx	0x2589E3E2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x4F5A2ED0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f16,	%f31
loop_2821:
	tcc	%xcc,	0x1
	edge8n	%l0,	%g5,	%i2
	ba,pn	%icc,	loop_2822
	movn	%icc,	%o0,	%l1
	addc	%g4,	0x150C,	%l4
	movrne	%i3,	%g2,	%i1
loop_2822:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f11,	%f26
	edge32l	%i4,	%o2,	%l2
	sdivx	%i0,	0x0755,	%i7
	std	%f14,	[%l7 + 0x48]
	mova	%xcc,	%l5,	%i6
	fmovd	%f4,	%f18
	movcs	%icc,	%i5,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x0, %l6
	stxa	%g6,	[%g0 + %l6] 0x5f
	orn	%o5,	%o4,	%l6
	brgez	%o3,	loop_2823
	pdist	%f20,	%f18,	%f8
	xnorcc	%g3,	%l3,	%o1
	tne	%xcc,	0x4
loop_2823:
	tn	%xcc,	0x3
	brgez	%o6,	loop_2824
	movle	%xcc,	%g7,	%l0
	tneg	%xcc,	0x4
	nop
	setx	0x1FF0239C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x2B175DDB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f16,	%f23
loop_2824:
	alignaddrl	%g1,	%i2,	%g5
	taddcc	%o0,	0x0BE8,	%g4
	tl	%icc,	0x3
	array16	%l1,	%i3,	%l4
	nop
	setx	0x506937A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	brnz,a	%g2,	loop_2825
	movpos	%icc,	%i1,	%i4
	ba,pt	%xcc,	loop_2826
	movg	%icc,	%l2,	%i0
loop_2825:
	movrgz	%o2,	0x37B,	%i7
	ldd	[%l7 + 0x50],	%l4
loop_2826:
	edge32ln	%i5,	%o7,	%g6
	srlx	%i6,	0x1E,	%o5
	edge32	%o4,	%l6,	%g3
	movpos	%xcc,	%o3,	%o1
	movn	%xcc,	%o6,	%g7
	brlz	%l0,	loop_2827
	nop
	setx loop_2828, %l0, %l1
	jmpl %l1, %l3
	te	%xcc,	0x3
	sdiv	%g1,	0x146C,	%g5
loop_2827:
	taddcc	%i2,	0x1F13,	%g4
loop_2828:
	sub	%l1,	0x18B0,	%o0
	umulcc	%l4,	0x0901,	%i3
	fornot2	%f28,	%f0,	%f12
	wr	%g0,	0x20,	%asi
	stxa	%g2,	[%g0 + 0x20] %asi
	movge	%xcc,	%i1,	%l2
	sdiv	%i4,	0x069F,	%o2
	udivx	%i7,	0x0547,	%i0
	addcc	%i5,	%o7,	%g6
	bleu	loop_2829
	subccc	%i6,	%l5,	%o5
	edge32n	%l6,	%o4,	%o3
	fpsub32s	%f4,	%f8,	%f3
loop_2829:
	sub	%g3,	0x09A8,	%o6
	xnor	%g7,	%o1,	%l0
	udivcc	%l3,	0x0C5E,	%g1
	orcc	%i2,	0x1EA7,	%g5
	subc	%g4,	%l1,	%l4
	umulcc	%o0,	0x0454,	%i3
	umul	%g2,	0x1F97,	%l2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%i1
	brlz	%i4,	loop_2830
	movrlez	%o2,	0x0FF,	%i7
	sra	%i5,	0x1A,	%i0
	udivx	%o7,	0x1E1D,	%i6
loop_2830:
	fexpand	%f9,	%f18
	tg	%xcc,	0x5
	movleu	%icc,	%l5,	%g6
	subc	%l6,	%o4,	%o5
	movleu	%icc,	%g3,	%o6
	fbu,a	%fcc0,	loop_2831
	array8	%o3,	%g7,	%l0
	fands	%f27,	%f2,	%f8
	tpos	%icc,	0x4
loop_2831:
	addc	%o1,	%g1,	%i2
	bpos,pt	%xcc,	loop_2832
	edge32	%g5,	%g4,	%l3
	edge16	%l1,	%o0,	%i3
	sll	%l4,	0x02,	%g2
loop_2832:
	movrgez	%l2,	%i1,	%i4
	movn	%icc,	%i7,	%o2
	tleu	%xcc,	0x4
	tneg	%icc,	0x0
	fmovsvc	%icc,	%f19,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i5,	%o7
	edge32l	%i6,	%i0,	%g6
	array32	%l6,	%o4,	%o5
	addc	%g3,	%o6,	%o3
	edge16	%l5,	%g7,	%o1
	st	%f8,	[%l7 + 0x48]
	subcc	%l0,	%g1,	%g5
	movg	%xcc,	%i2,	%g4
	xnorcc	%l1,	%o0,	%i3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x08] %asi,	%l4
	prefetch	[%l7 + 0x6C],	 0x0
	ble,a,pt	%icc,	loop_2833
	tsubcctv	%g2,	%l3,	%l2
	tne	%xcc,	0x6
	subccc	%i1,	%i7,	%o2
loop_2833:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i5,	%o7,	%i4
	brz	%i0,	loop_2834
	movgu	%icc,	%g6,	%i6
	ldsw	[%l7 + 0x6C],	%o4
	tne	%xcc,	0x5
loop_2834:
	edge16l	%l6,	%o5,	%g3
	xor	%o6,	0x11C4,	%l5
	swap	[%l7 + 0x08],	%g7
	sra	%o3,	0x0A,	%o1
	nop
	setx	loop_2835,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcs	%xcc,	0x5
	fpsub16s	%f4,	%f2,	%f18
	fmovscs	%icc,	%f23,	%f17
loop_2835:
	fpack16	%f22,	%f16
	taddcc	%g1,	0x05A0,	%g5
	movrlez	%i2,	%g4,	%l0
	movle	%xcc,	%o0,	%l1
	movneg	%xcc,	%l4,	%i3
	tne	%xcc,	0x7
	mulscc	%g2,	0x136F,	%l2
	nop
	setx	0x57C160CFC10BD4BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x4E44A9D3B8E55F85,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f22,	%f12
	bn	%xcc,	loop_2836
	nop
	fitos	%f14,	%f18
	fstox	%f18,	%f20
	tl	%xcc,	0x0
	taddcctv	%l3,	0x08ED,	%i1
loop_2836:
	ta	%xcc,	0x5
	fcmpeq16	%f10,	%f30,	%i7
	edge32n	%i5,	%o2,	%i4
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	srax	%o7,	%g6,	%i6
	tne	%icc,	0x6
	fbu	%fcc3,	loop_2837
	tcs	%xcc,	0x5
	fmovda	%xcc,	%f25,	%f10
	fornot2	%f2,	%f22,	%f22
loop_2837:
	fornot2	%f4,	%f6,	%f6
	nop
	fitos	%f2,	%f9
	fstox	%f9,	%f0
	fxtos	%f0,	%f16
	fbug	%fcc0,	loop_2838
	ba	loop_2839
	fbl,a	%fcc0,	loop_2840
	fmovrsgz	%o4,	%f14,	%f28
loop_2838:
	edge32n	%l6,	%o5,	%i0
loop_2839:
	sth	%o6,	[%l7 + 0x12]
loop_2840:
	fcmpeq16	%f20,	%f14,	%g3
	bleu,a,pt	%icc,	loop_2841
	tvs	%xcc,	0x0
	tleu	%icc,	0x2
	ldsb	[%l7 + 0x7E],	%l5
loop_2841:
	orn	%g7,	0x0253,	%o1
	set	0x6E, %o5
	lduha	[%l7 + %o5] 0x80,	%o3
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f2
	fxtod	%f2,	%f28
	movvs	%icc,	%g1,	%g5
	movneg	%xcc,	%i2,	%g4
	smulcc	%o0,	0x1C9D,	%l1
	fmovrde	%l4,	%f10,	%f12
	bge	%icc,	loop_2842
	sdivx	%l0,	0x00E8,	%i3
	edge32	%g2,	%l2,	%i1
	srl	%i7,	%l3,	%i5
loop_2842:
	mova	%xcc,	%o2,	%i4
	fbule	%fcc1,	loop_2843
	edge8	%g6,	%i6,	%o7
	subc	%o4,	%l6,	%o5
	movcc	%icc,	%i0,	%o6
loop_2843:
	fmovsgu	%xcc,	%f21,	%f19
	edge32n	%g3,	%g7,	%o1
	sethi	0x1FAF,	%l5
	array32	%g1,	%g5,	%i2
	fmovsge	%icc,	%f1,	%f30
	subccc	%g4,	%o3,	%o0
	fmovsneg	%icc,	%f22,	%f30
	fpack32	%f4,	%f22,	%f30
	nop
	setx	0x4710A4C228E6A640,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xC170E3DA8A2771C5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f2,	%f4
	subc	%l1,	0x1C51,	%l4
	movge	%xcc,	%i3,	%l0
	bcs,a,pn	%icc,	loop_2844
	edge8n	%l2,	%i1,	%i7
	edge32ln	%l3,	%i5,	%o2
	move	%xcc,	%i4,	%g6
loop_2844:
	fmovdvs	%xcc,	%f26,	%f7
	tl	%icc,	0x5
	set	0x58, %g6
	sta	%f7,	[%l7 + %g6] 0x80
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	be	loop_2845
	fmovd	%f12,	%f10
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
loop_2845:
	nop
	fitod	%f0,	%f2
	fdtoi	%f2,	%f7
	edge16	%o7,	%i6,	%o4
	fmovsgu	%icc,	%f16,	%f3
	and	%o5,	0x0163,	%l6
	movrlez	%o6,	0x2B2,	%i0
	edge32n	%g3,	%g7,	%l5
	nop
	setx	loop_2846,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subc	%g1,	0x0933,	%g5
	tneg	%icc,	0x3
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x08] %asi,	%o1
loop_2846:
	ta	%xcc,	0x6
	set	0x18, %l2
	ldswa	[%l7 + %l2] 0x10,	%i2
	faligndata	%f10,	%f14,	%f0
	movne	%xcc,	%g4,	%o0
	movleu	%xcc,	%l1,	%o3
	fbuge	%fcc2,	loop_2847
	fexpand	%f20,	%f10
	fmovdle	%icc,	%f23,	%f4
	set	0x40, %g2
	stda	%f0,	[%l7 + %g2] 0xf1
	membar	#Sync
loop_2847:
	nop
	fitos	%f9,	%f3
	fstod	%f3,	%f22
	fmovrdlez	%l4,	%f2,	%f20
	ldub	[%l7 + 0x75],	%i3
	nop
	setx	0x95FEF65A707E41CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l2,	%i1
	fbg,a	%fcc0,	loop_2848
	movvc	%xcc,	%i7,	%l3
	sdiv	%i5,	0x0182,	%l0
	nop
	setx	0x7042A812,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
loop_2848:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o2,	%g6,	%i4
	st	%f26,	[%l7 + 0x20]
	edge8	%g2,	%i6,	%o4
	fmovrsgez	%o7,	%f18,	%f0
	set	0x42, %i7
	ldsha	[%l7 + %i7] 0x81,	%o5
	tcc	%icc,	0x4
	and	%l6,	0x0F51,	%i0
	xor	%g3,	%g7,	%l5
	fbo,a	%fcc3,	loop_2849
	edge16	%g1,	%o6,	%g5
	sra	%o1,	0x1C,	%i2
	xor	%o0,	%l1,	%g4
loop_2849:
	nop
	setx	0x615E29092227E6E8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x7C58DD1767F56FEB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f18,	%f30
	xorcc	%o3,	0x0360,	%i3
	nop
	setx	0xFDB1D2C51A78C1C2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x2DDE43948327F5F5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f18,	%f18
	addcc	%l4,	%i1,	%l2
	fbul,a	%fcc3,	loop_2850
	sll	%i7,	%i5,	%l0
	edge32n	%l3,	%o2,	%g6
	fbl,a	%fcc0,	loop_2851
loop_2850:
	array32	%i4,	%i6,	%g2
	fbul	%fcc3,	loop_2852
	edge16l	%o7,	%o4,	%l6
loop_2851:
	move	%icc,	%i0,	%o5
	fone	%f28
loop_2852:
	edge32ln	%g3,	%l5,	%g7
	movge	%icc,	%o6,	%g5
	andncc	%g1,	%o1,	%i2
	subcc	%l1,	%o0,	%o3
	tne	%icc,	0x4
	alignaddrl	%i3,	%l4,	%g4
	bneg	%icc,	loop_2853
	sll	%l2,	0x14,	%i7
	fcmpgt32	%f4,	%f26,	%i5
	nop
	setx	0x3E828F24601A9F9A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x9F90A8685C3E6F43,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f14,	%f4
loop_2853:
	or	%i1,	0x1B7E,	%l0
	membar	0x03
	fone	%f22
	edge16l	%o2,	%l3,	%g6
	tle	%icc,	0x7
	tne	%xcc,	0x3
	movneg	%icc,	%i4,	%i6
	fmul8ulx16	%f18,	%f28,	%f2
	movrlz	%g2,	%o7,	%l6
	movvc	%icc,	%o4,	%o5
	umul	%i0,	%l5,	%g3
	fbl,a	%fcc0,	loop_2854
	sdivx	%g7,	0x147D,	%g5
	addc	%g1,	%o1,	%o6
	edge8	%i2,	%o0,	%o3
loop_2854:
	array32	%l1,	%l4,	%i3
	fmul8x16	%f30,	%f24,	%f0
	sdiv	%l2,	0x1D2A,	%g4
	taddcc	%i7,	%i5,	%l0
	addccc	%i1,	0x1B6E,	%l3
	fmovdl	%xcc,	%f10,	%f15
	fmovde	%icc,	%f26,	%f18
	umul	%g6,	0x0199,	%o2
	movn	%icc,	%i4,	%g2
	array32	%o7,	%l6,	%i6
	fmul8x16au	%f25,	%f13,	%f16
	andn	%o5,	%o4,	%l5
	array32	%g3,	%g7,	%g5
	umul	%i0,	%o1,	%o6
	tleu	%xcc,	0x2
	edge8l	%i2,	%g1,	%o3
	edge16	%l1,	%l4,	%i3
	tge	%icc,	0x6
	fmovdcc	%xcc,	%f23,	%f18
	movcs	%icc,	%o0,	%l2
	fmovdcc	%icc,	%f10,	%f4
	taddcctv	%i7,	0x0EE7,	%g4
	fpmerge	%f8,	%f14,	%f22
	fbul	%fcc0,	loop_2855
	tleu	%xcc,	0x5
	umulcc	%i5,	%i1,	%l3
	fpsub32s	%f23,	%f31,	%f28
loop_2855:
	faligndata	%f8,	%f8,	%f16
	ldsh	[%l7 + 0x4A],	%g6
	tge	%icc,	0x5
	sdivcc	%l0,	0x1D8E,	%o2
	movcc	%icc,	%g2,	%i4
	fbug	%fcc3,	loop_2856
	fmovrsgez	%l6,	%f16,	%f29
	fbe	%fcc1,	loop_2857
	smulcc	%i6,	0x1466,	%o5
loop_2856:
	tleu	%icc,	0x6
	swap	[%l7 + 0x60],	%o4
loop_2857:
	bcc	loop_2858
	bvc	loop_2859
	edge32ln	%l5,	%g3,	%g7
	fmovse	%xcc,	%f26,	%f3
loop_2858:
	fbl,a	%fcc2,	loop_2860
loop_2859:
	xnorcc	%g5,	0x186F,	%i0
	fmovscs	%icc,	%f24,	%f4
	ldd	[%l7 + 0x38],	%o6
loop_2860:
	bpos	%icc,	loop_2861
	movrlez	%o1,	0x0D6,	%o6
	fnor	%f4,	%f12,	%f6
	sra	%g1,	0x17,	%i2
loop_2861:
	sth	%l1,	[%l7 + 0x60]
	add	%l4,	0x0332,	%o3
	addc	%o0,	0x1764,	%l2
	move	%xcc,	%i3,	%i7
	movn	%icc,	%i5,	%g4
	tvc	%xcc,	0x1
	fbug,a	%fcc3,	loop_2862
	andncc	%i1,	%l3,	%l0
	bge,a	loop_2863
	edge32n	%o2,	%g2,	%i4
loop_2862:
	movl	%icc,	%g6,	%l6
	bshuffle	%f0,	%f10,	%f20
loop_2863:
	movrlz	%o5,	0x1F3,	%o4
	fnot2	%f6,	%f10
	edge8ln	%l5,	%i6,	%g3
	sub	%g5,	%i0,	%g7
	tcc	%xcc,	0x5
	fcmpne16	%f12,	%f6,	%o7
	tsubcc	%o1,	%o6,	%g1
	edge32n	%i2,	%l1,	%o3
	srlx	%o0,	0x18,	%l2
	fmovrdlz	%i3,	%f20,	%f18
	edge16l	%l4,	%i7,	%i5
	movne	%xcc,	%g4,	%l3
	mova	%xcc,	%i1,	%o2
	tvs	%icc,	0x2
	sll	%l0,	%g2,	%g6
	fmovrdgz	%i4,	%f8,	%f6
	movpos	%xcc,	%o5,	%o4
	membar	0x17
	fbue	%fcc3,	loop_2864
	fpack16	%f16,	%f29
	ldx	[%l7 + 0x50],	%l5
	fabss	%f12,	%f29
loop_2864:
	addc	%i6,	%g3,	%g5
	edge16n	%l6,	%g7,	%o7
	edge32ln	%o1,	%i0,	%g1
	sra	%o6,	%l1,	%o3
	taddcctv	%o0,	0x1CFD,	%i2
	mova	%icc,	%l2,	%i3
	fmovdge	%icc,	%f17,	%f29
	lduh	[%l7 + 0x30],	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xe3,	%asi
	stba	%i7,	[%l7 + 0x33] %asi
	membar	#Sync
	xorcc	%i5,	0x139E,	%g4
	fmovsle	%icc,	%f20,	%f16
	fbne	%fcc3,	loop_2865
	umul	%i1,	%o2,	%l0
	popc	%l3,	%g2
	movcc	%xcc,	%i4,	%o5
loop_2865:
	smulcc	%g6,	0x01E2,	%o4
	fors	%f9,	%f2,	%f15
	addccc	%i6,	%l5,	%g5
	tsubcc	%l6,	0x1527,	%g3
	tn	%icc,	0x0
	move	%xcc,	%o7,	%g7
	nop
	setx	0xF44926DCB7DB0D8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f28
	tneg	%icc,	0x7
	srlx	%o1,	0x14,	%g1
	fxors	%f10,	%f13,	%f15
	array32	%i0,	%o6,	%o3
	bneg,pt	%xcc,	loop_2866
	sdivx	%o0,	0x0E78,	%i2
	edge8ln	%l2,	%i3,	%l1
	subc	%l4,	0x0E7F,	%i5
loop_2866:
	movcs	%xcc,	%i7,	%i1
	bge,a,pn	%icc,	loop_2867
	lduh	[%l7 + 0x28],	%o2
	taddcctv	%g4,	0x0885,	%l3
	subc	%g2,	%i4,	%o5
loop_2867:
	sllx	%g6,	0x1F,	%o4
	tn	%xcc,	0x7
	movleu	%xcc,	%i6,	%l5
	smul	%g5,	%l0,	%l6
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x15,	%f0
	prefetch	[%l7 + 0x4C],	 0x0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%o7
	fmovrsgz	%o1,	%f12,	%f6
	movl	%icc,	%g7,	%i0
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%o6
	fand	%f16,	%f24,	%f22
	andn	%o3,	%g1,	%i2
	or	%l2,	0x0429,	%i3
	movg	%icc,	%l1,	%o0
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x6B] %asi,	%i5
	bge,a,pn	%icc,	loop_2868
	movrne	%l4,	%i7,	%o2
	ble,a	%icc,	loop_2869
	brgez	%i1,	loop_2870
loop_2868:
	tvc	%xcc,	0x7
	nop
	setx	0xA86511589A7FC324,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD20B1E1085FF6462,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f22,	%f2
loop_2869:
	srlx	%l3,	0x05,	%g2
loop_2870:
	umulcc	%g4,	%o5,	%i4
	fbge	%fcc2,	loop_2871
	fornot1s	%f24,	%f20,	%f19
	tleu	%icc,	0x5
	edge8n	%o4,	%g6,	%i6
loop_2871:
	fmuld8ulx16	%f13,	%f15,	%f24
	stbar
	fones	%f17
	srl	%l5,	0x05,	%l0
	st	%f15,	[%l7 + 0x38]
	stb	%l6,	[%l7 + 0x7A]
	array32	%g3,	%o7,	%g5
	ba,pt	%icc,	loop_2872
	add	%o1,	%i0,	%g7
	edge16ln	%o6,	%g1,	%o3
	smul	%i2,	%l2,	%l1
loop_2872:
	andcc	%o0,	0x0F2C,	%i3
	bcc,a,pt	%xcc,	loop_2873
	nop
	setx	0x1F426123,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f19
	sllx	%i5,	%i7,	%o2
	wr	%g0,	0x80,	%asi
	stxa	%i1,	[%l7 + 0x50] %asi
loop_2873:
	tg	%icc,	0x2
	edge16	%l3,	%g2,	%l4
	ldsh	[%l7 + 0x48],	%o5
	array16	%i4,	%o4,	%g6
	edge32l	%i6,	%l5,	%g4
	edge32l	%l0,	%l6,	%o7
	fbu,a	%fcc0,	loop_2874
	edge16n	%g3,	%o1,	%g5
	movneg	%icc,	%i0,	%o6
	bgu,a,pt	%icc,	loop_2875
loop_2874:
	ldsw	[%l7 + 0x48],	%g1
	fmovsn	%xcc,	%f25,	%f30
	and	%o3,	%i2,	%l2
loop_2875:
	bleu	%xcc,	loop_2876
	edge8l	%l1,	%o0,	%g7
	srax	%i3,	0x17,	%i5
	movleu	%icc,	%i7,	%o2
loop_2876:
	edge32ln	%i1,	%l3,	%l4
	andn	%o5,	%i4,	%o4
	sub	%g6,	0x1AD9,	%g2
	movrgz	%l5,	0x1D9,	%i6
	tvc	%icc,	0x6
	fmovsn	%icc,	%f7,	%f27
	fandnot1	%f22,	%f10,	%f6
	udivcc	%g4,	0x1E5B,	%l6
	fxnor	%f4,	%f6,	%f10
	edge16l	%l0,	%o7,	%g3
	movre	%o1,	0x3EF,	%g5
	fnegs	%f27,	%f23
	fcmpne32	%f26,	%f26,	%i0
	fba	%fcc1,	loop_2877
	movrne	%o6,	0x04F,	%o3
	swap	[%l7 + 0x14],	%g1
	fpadd32	%f24,	%f2,	%f6
loop_2877:
	fmovdge	%icc,	%f11,	%f25
	alignaddrl	%l2,	%l1,	%i2
	tne	%xcc,	0x1
	fbue,a	%fcc2,	loop_2878
	nop
	fitos	%f6,	%f30
	fstox	%f30,	%f10
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x78] %asi,	%g7
loop_2878:
	bcc,a	loop_2879
	ld	[%l7 + 0x5C],	%f12
	ta	%icc,	0x5
	tcc	%xcc,	0x2
loop_2879:
	movpos	%icc,	%o0,	%i3
	bn,a	%xcc,	loop_2880
	fbl,a	%fcc2,	loop_2881
	faligndata	%f30,	%f14,	%f0
	fmovdleu	%xcc,	%f30,	%f30
loop_2880:
	edge8l	%i7,	%o2,	%i5
loop_2881:
	te	%xcc,	0x7
	nop
	setx	0xE55F697CA19271F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xF9A6D771B3801200,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f26,	%f6
	add	%l3,	%l4,	%i1
	xnorcc	%i4,	%o5,	%g6
	wr	%g0,	0x89,	%asi
	stba	%o4,	[%l7 + 0x23] %asi
	umul	%l5,	%g2,	%i6
	sdivx	%g4,	0x1C10,	%l0
	xnorcc	%o7,	0x04C6,	%l6
	bn,a,pn	%xcc,	loop_2882
	sethi	0x04D8,	%g3
	movleu	%icc,	%o1,	%i0
	fba,a	%fcc1,	loop_2883
loop_2882:
	umulcc	%o6,	%o3,	%g5
	movleu	%xcc,	%g1,	%l1
	addcc	%l2,	0x07D1,	%i2
loop_2883:
	tneg	%xcc,	0x2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%g7,	%o0
	edge8l	%i7,	%o2,	%i3
	brlz,a	%l3,	loop_2884
	fmovdl	%icc,	%f9,	%f9
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%i1
loop_2884:
	srlx	%i5,	%o5,	%i4
	lduh	[%l7 + 0x52],	%o4
	movgu	%icc,	%l5,	%g2
	fmovscc	%icc,	%f5,	%f3
	addccc	%g6,	0x1056,	%i6
	fsrc2	%f0,	%f6
	movcc	%xcc,	%l0,	%o7
	popc	%g4,	%l6
	lduw	[%l7 + 0x68],	%o1
	stw	%i0,	[%l7 + 0x58]
	fmovdleu	%xcc,	%f0,	%f31
	subc	%o6,	%g3,	%g5
	edge32n	%g1,	%l1,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f12,	%f4
	movvc	%icc,	%i2,	%l2
	udivcc	%g7,	0x09EA,	%i7
	edge16ln	%o2,	%i3,	%l3
	ld	[%l7 + 0x14],	%f5
	fxnors	%f4,	%f30,	%f13
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x36] %asi,	%l4
	fmovsg	%icc,	%f4,	%f3
	bleu,a,pn	%xcc,	loop_2885
	nop
	setx	0xFCE6274B69134DC7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x3BA0CF9DB923037F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f2,	%f8
	fbe	%fcc3,	loop_2886
	orcc	%o0,	0x0E33,	%i5
loop_2885:
	nop
	set	0x370, %g4
	nop 	! 	nop 	! 	ldxa	[%g0 + %g4] 0x40,	%o5 ripped by fixASI40.pl ripped by fixASI40.pl
loop_2886:
	tcs	%xcc,	0x4
	xnorcc	%i4,	0x113B,	%i1
	pdist	%f16,	%f18,	%f8
	alignaddrl	%l5,	%o4,	%g6
	movpos	%xcc,	%i6,	%g2
	fbug,a	%fcc2,	loop_2887
	srax	%l0,	0x07,	%g4
	ta	%icc,	0x0
	edge32n	%o7,	%o1,	%l6
loop_2887:
	nop
	wr	%g0,	0x10,	%asi
	stha	%i0,	[%l7 + 0x6E] %asi
	movl	%icc,	%g3,	%g5
	fbge,a	%fcc3,	loop_2888
	xnor	%g1,	0x0938,	%o6
	andncc	%l1,	%o3,	%l2
	sethi	0x0C09,	%i2
loop_2888:
	fzeros	%f24
	edge8	%g7,	%o2,	%i3
	nop
	set	0x1B, %l0
	ldub	[%l7 + %l0],	%i7
	fblg	%fcc0,	loop_2889
	movre	%l4,	0x269,	%l3
	set	0x2E, %l3
	stba	%i5,	[%l7 + %l3] 0x0c
loop_2889:
	nop
	fitos	%f10,	%f15
	fstox	%f15,	%f20
	fxtos	%f20,	%f14
	bgu,a,pn	%icc,	loop_2890
	movre	%o0,	%i4,	%i1
	ta	%xcc,	0x1
	subc	%o5,	%l5,	%g6
loop_2890:
	fmovdvs	%xcc,	%f18,	%f9
	sdiv	%o4,	0x09CD,	%i6
	alignaddrl	%l0,	%g2,	%g4
	brlez	%o1,	loop_2891
	array16	%o7,	%l6,	%g3
	tg	%icc,	0x2
	set	0x34, %o7
	stwa	%g5,	[%l7 + %o7] 0x81
loop_2891:
	edge32ln	%i0,	%o6,	%g1
	tsubcctv	%l1,	0x1648,	%l2
	fcmpne16	%f18,	%f16,	%o3
	membar	0x76
	fmovrsne	%i2,	%f23,	%f20
	edge8	%g7,	%o2,	%i3
	smulcc	%l4,	%l3,	%i7
	movvc	%icc,	%i5,	%o0
	srlx	%i4,	%i1,	%l5
	nop
	setx	0xBC996DB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x25A4306F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f7,	%f2
	fxors	%f21,	%f29,	%f8
	call	loop_2892
	fbe	%fcc1,	loop_2893
	fbo	%fcc3,	loop_2894
	sllx	%o5,	%o4,	%g6
loop_2892:
	fsrc1	%f24,	%f14
loop_2893:
	fpadd16s	%f11,	%f6,	%f8
loop_2894:
	fbue	%fcc1,	loop_2895
	taddcctv	%l0,	0x1568,	%i6
	nop
	fitos	%f4,	%f15
	fstox	%f15,	%f14
	fxtos	%f14,	%f0
	tsubcc	%g2,	0x0CF4,	%g4
loop_2895:
	srax	%o1,	0x09,	%o7
	andn	%g3,	0x0DCD,	%l6
	pdist	%f2,	%f28,	%f28
	fxnor	%f26,	%f10,	%f20
	udivcc	%g5,	0x145D,	%o6
	fcmpgt32	%f24,	%f24,	%i0
	set	0x42, %o0
	ldstuba	[%l7 + %o0] 0x19,	%l1
	movrlez	%g1,	%o3,	%l2
	fmovspos	%xcc,	%f23,	%f29
	popc	0x11B6,	%g7
	fmovrdgz	%i2,	%f26,	%f28
	edge16	%i3,	%o2,	%l4
	orn	%l3,	%i5,	%i7
	ldstub	[%l7 + 0x21],	%o0
	movgu	%xcc,	%i4,	%l5
	fmul8x16al	%f15,	%f3,	%f28
	fsrc2	%f26,	%f26
	bleu	%icc,	loop_2896
	fmovrdgz	%o5,	%f0,	%f22
	std	%f26,	[%l7 + 0x18]
	fxnors	%f17,	%f2,	%f19
loop_2896:
	movleu	%xcc,	%o4,	%i1
	tsubcctv	%l0,	0x1F30,	%i6
	nop
	setx	0x72992358,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f25
	movcs	%icc,	%g2,	%g6
	andn	%g4,	%o7,	%g3
	sir	0x0068
	addccc	%l6,	%g5,	%o6
	movrlz	%o1,	%l1,	%i0
	ldstub	[%l7 + 0x6A],	%o3
	tcc	%icc,	0x2
	movrgez	%g1,	%l2,	%i2
	xorcc	%g7,	0x1435,	%i3
	fmovde	%xcc,	%f7,	%f9
	bl	loop_2897
	mulx	%l4,	0x11C3,	%l3
	brlez,a	%i5,	loop_2898
	tpos	%icc,	0x0
loop_2897:
	tneg	%icc,	0x4
	wr	%g0,	0x81,	%asi
	stha	%o2,	[%l7 + 0x36] %asi
loop_2898:
	addcc	%i7,	0x07DA,	%i4
	fpadd16	%f2,	%f28,	%f20
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	xnorcc	%l5,	%o5,	%o4
	movrlz	%i1,	%o0,	%i6
	tcc	%icc,	0x0
	mulx	%l0,	0x133A,	%g6
	fmovsl	%icc,	%f30,	%f7
	tsubcctv	%g4,	0x0535,	%o7
	tvs	%icc,	0x4
	xorcc	%g3,	0x1A4E,	%l6
	fzero	%f10
	sll	%g5,	0x03,	%o6
	orcc	%g2,	0x12AA,	%l1
	tvs	%icc,	0x4
	fmovdvc	%icc,	%f10,	%f11
	fsrc2	%f18,	%f28
	ldsb	[%l7 + 0x25],	%o1
	set	0x45, %g1
	ldstuba	[%l7 + %g1] 0x18,	%o3
	te	%icc,	0x2
	edge16ln	%i0,	%g1,	%i2
	orncc	%g7,	%l2,	%i3
	movrne	%l3,	0x183,	%i5
	bge	loop_2899
	bg,a	loop_2900
	brlez	%l4,	loop_2901
	fmovdcs	%xcc,	%f17,	%f17
loop_2899:
	tsubcctv	%i7,	0x001B,	%o2
loop_2900:
	add	%i4,	0x15E0,	%o5
loop_2901:
	fbne	%fcc2,	loop_2902
	addc	%o4,	0x02B3,	%i1
	sllx	%l5,	%o0,	%i6
	movcs	%xcc,	%g6,	%g4
loop_2902:
	fands	%f31,	%f30,	%f2
	sdivx	%o7,	0x13BE,	%g3
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	alignaddrl	%g5,	%l6,	%o6
	movvc	%icc,	%l1,	%g2
	mulx	%o1,	%o3,	%g1
	andn	%i2,	%i0,	%g7
	sll	%l2,	%i3,	%i5
	movvs	%xcc,	%l4,	%i7
	umul	%o2,	0x1B26,	%i4
	andcc	%l3,	0x0A9C,	%o4
	sdivx	%o5,	0x1FE6,	%i1
	taddcc	%l5,	0x01B0,	%o0
	and	%g6,	%i6,	%g4
	movneg	%xcc,	%g3,	%o7
	set	0x58, %g7
	ldxa	[%l7 + %g7] 0x19,	%l0
	movne	%icc,	%l6,	%o6
	fmovdl	%xcc,	%f21,	%f25
	bvc,a	loop_2903
	andncc	%g5,	%l1,	%g2
	tpos	%icc,	0x4
	array32	%o3,	%g1,	%o1
loop_2903:
	edge32n	%i2,	%g7,	%i0
	nop
	setx	0xD1535139,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x99AF402C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f25,	%f24
	array32	%l2,	%i5,	%i3
	prefetch	[%l7 + 0x40],	 0x0
	movcs	%xcc,	%i7,	%l4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] 0x10,	%i4,	%o2
	fmul8x16	%f20,	%f6,	%f8
	fmovrdlez	%l3,	%f24,	%f30
	tgu	%icc,	0x6
	edge16l	%o4,	%i1,	%l5
	fabss	%f28,	%f28
	movrgez	%o0,	%g6,	%o5
	alignaddrl	%i6,	%g4,	%o7
	set	0x30, %g5
	ldsha	[%l7 + %g5] 0x15,	%l0
	addc	%g3,	%o6,	%l6
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l1
	fmovsleu	%icc,	%f7,	%f29
	movrgez	%g2,	0x0FB,	%o3
	bcs	loop_2904
	stbar
	fmovrdlez	%g1,	%f22,	%f0
	fmovsl	%icc,	%f30,	%f14
loop_2904:
	fcmpne16	%f28,	%f12,	%g5
	xor	%i2,	0x0DB2,	%g7
	set	0x54, %i1
	lduwa	[%l7 + %i1] 0x81,	%i0
	fsrc1s	%f13,	%f10
	movrgez	%l2,	%i5,	%o1
	ldub	[%l7 + 0x24],	%i3
	and	%l4,	%i4,	%o2
	edge32ln	%i7,	%o4,	%l3
	and	%l5,	%o0,	%g6
	bg,a	%xcc,	loop_2905
	sethi	0x070E,	%i1
	ldx	[%l7 + 0x68],	%o5
	bneg,a,pt	%xcc,	loop_2906
loop_2905:
	orn	%g4,	%o7,	%l0
	fbne	%fcc0,	loop_2907
	xor	%i6,	0x16E9,	%g3
loop_2906:
	array16	%l6,	%l1,	%g2
	ta	%icc,	0x3
loop_2907:
	popc	%o3,	%o6
	set	0x3C, %l4
	stha	%g1,	[%l7 + %l4] 0x04
	nop
	fitod	%f10,	%f4
	fdtos	%f4,	%f22
	ld	[%l7 + 0x34],	%f29
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f20
	andncc	%g5,	%i2,	%g7
	brz,a	%i0,	loop_2908
	array32	%i5,	%o1,	%i3
	ldx	[%l7 + 0x28],	%l4
	smulcc	%i4,	0x1949,	%l2
loop_2908:
	sra	%i7,	%o4,	%l3
	movrlz	%o2,	0x0FB,	%o0
	and	%l5,	0x113A,	%g6
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0xf8
	membar	#Sync
	udiv	%i1,	0x099D,	%o5
	sdiv	%g4,	0x0932,	%o7
	edge8	%l0,	%g3,	%i6
	tgu	%icc,	0x3
	orn	%l6,	0x0F13,	%l1
	fornot1s	%f18,	%f24,	%f9
	tgu	%xcc,	0x3
	fbo,a	%fcc3,	loop_2909
	tgu	%icc,	0x7
	bne,a,pn	%xcc,	loop_2910
	nop
	fitos	%f13,	%f20
	fstoi	%f20,	%f1
loop_2909:
	fbue	%fcc3,	loop_2911
	fmovsneg	%icc,	%f30,	%f2
loop_2910:
	xorcc	%g2,	%o3,	%g1
	fbl,a	%fcc0,	loop_2912
loop_2911:
	fcmpgt32	%f6,	%f12,	%o6
	fpmerge	%f30,	%f27,	%f2
	fzeros	%f7
loop_2912:
	fmovrdlz	%g5,	%f28,	%f12
	ldsh	[%l7 + 0x72],	%g7
	popc	%i0,	%i2
	and	%o1,	%i3,	%l4
	nop
	fitod	%f0,	%f4
	fdtox	%f4,	%f2
	umul	%i4,	%l2,	%i7
	set	0x22, %o6
	ldsba	[%l7 + %o6] 0x15,	%i5
	array8	%l3,	%o4,	%o2
	taddcc	%l5,	0x15D7,	%g6
	set	0x0C, %i2
	stwa	%i1,	[%l7 + %i2] 0x15
	movvs	%xcc,	%o5,	%g4
	umulcc	%o0,	0x0BB2,	%o7
	array16	%g3,	%l0,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x50, %o1
	lduw	[%l7 + %o1],	%l1
	edge8l	%i6,	%o3,	%g2
	tneg	%icc,	0x0
	tsubcc	%o6,	%g5,	%g7
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fblg	%fcc1,	loop_2913
	nop
	setx	0x6866966EC63C3DF1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6D000388BB904902,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f8,	%f4
	movn	%xcc,	%i0,	%g1
	alignaddr	%o1,	%i3,	%l4
loop_2913:
	alignaddrl	%i4,	%i2,	%l2
	movrlz	%i5,	0x2F8,	%i7
	fpsub16s	%f8,	%f20,	%f9
	mova	%icc,	%l3,	%o2
	tsubcctv	%o4,	0x0A3C,	%l5
	bn	%icc,	loop_2914
	bpos,pt	%icc,	loop_2915
	tle	%xcc,	0x2
	bne,a,pt	%icc,	loop_2916
loop_2914:
	fmovsg	%icc,	%f14,	%f24
loop_2915:
	fpackfix	%f4,	%f20
	udivcc	%i1,	0x1BA5,	%o5
loop_2916:
	fpadd32	%f18,	%f8,	%f10
	xorcc	%g4,	0x1A86,	%g6
	wr	%g0,	0x18,	%asi
	stba	%o0,	[%l7 + 0x58] %asi
	nop
	set	0x52, %i6
	ldsh	[%l7 + %i6],	%g3
	bn,a	%icc,	loop_2917
	xnor	%o7,	%l0,	%l6
	fzero	%f16
	movleu	%icc,	%i6,	%l1
loop_2917:
	fbu	%fcc0,	loop_2918
	tleu	%icc,	0x2
	taddcc	%o3,	%o6,	%g5
	or	%g7,	0x016A,	%i0
loop_2918:
	fmul8x16al	%f12,	%f13,	%f8
	movrlz	%g2,	%g1,	%i3
	fpmerge	%f7,	%f7,	%f0
	add	%o1,	%i4,	%i2
	array16	%l4,	%i5,	%l2
	andn	%i7,	%o2,	%l3
	add	%l5,	0x1775,	%o4
	and	%o5,	0x19F3,	%g4
	fsrc1	%f26,	%f2
	fmovdg	%icc,	%f2,	%f15
	tle	%icc,	0x4
	sethi	0x0946,	%i1
	edge32	%g6,	%g3,	%o7
	tl	%icc,	0x5
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x56] %asi,	%l0
	move	%icc,	%o0,	%l6
	movneg	%icc,	%i6,	%o3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l1,	%g5
	fbg	%fcc3,	loop_2919
	movpos	%xcc,	%g7,	%o6
	fbo,a	%fcc2,	loop_2920
	movvc	%xcc,	%i0,	%g2
loop_2919:
	nop
	set	0x18, %i3
	prefetcha	[%l7 + %i3] 0x04,	 0x2
loop_2920:
	tleu	%icc,	0x5
	fcmpne16	%f2,	%f6,	%i3
	tle	%icc,	0x1
	pdist	%f10,	%f4,	%f20
	edge16l	%o1,	%i4,	%i2
	addc	%l4,	0x132B,	%i5
	fmovsa	%xcc,	%f22,	%f30
	fbl	%fcc1,	loop_2921
	brgz	%l2,	loop_2922
	tl	%xcc,	0x1
	fmovrdlez	%i7,	%f8,	%f2
loop_2921:
	nop
	setx	loop_2923,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2922:
	fxnor	%f4,	%f26,	%f10
	fbn	%fcc1,	loop_2924
	edge8l	%o2,	%l5,	%o4
loop_2923:
	movvc	%xcc,	%l3,	%g4
	fbue,a	%fcc3,	loop_2925
loop_2924:
	addccc	%o5,	%g6,	%g3
	orn	%o7,	0x193F,	%i1
	edge16ln	%l0,	%l6,	%i6
loop_2925:
	subcc	%o0,	%o3,	%l1
	te	%xcc,	0x7
	sllx	%g7,	0x15,	%g5
	xorcc	%i0,	%g2,	%o6
	lduh	[%l7 + 0x5C],	%i3
	edge8ln	%g1,	%i4,	%i2
	movrgz	%o1,	%i5,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i7,	%o2,	%l2
	set	0x378, %o3
	nop 	! 	nop 	! 	ldxa	[%g0 + %o3] 0x40,	%o4 ripped by fixASI40.pl ripped by fixASI40.pl
	orcc	%l5,	0x1836,	%l3
	wr	%g0,	0xe3,	%asi
	stha	%o5,	[%l7 + 0x1A] %asi
	membar	#Sync
	movneg	%icc,	%g4,	%g6
	bne,pn	%icc,	loop_2926
	sdivcc	%g3,	0x10E5,	%i1
	edge16	%o7,	%l0,	%i6
	edge16l	%o0,	%l6,	%l1
loop_2926:
	movvs	%xcc,	%o3,	%g7
	subc	%i0,	0x1E20,	%g2
	edge8n	%g5,	%o6,	%g1
	movneg	%icc,	%i4,	%i2
	edge8l	%o1,	%i5,	%l4
	xorcc	%i3,	%o2,	%i7
	add	%l2,	%o4,	%l5
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x23] %asi,	%l3
	udivcc	%o5,	0x19F4,	%g4
	fmovs	%f3,	%f20
	tgu	%xcc,	0x1
	nop
	set	0x58, %i0
	sth	%g6,	[%l7 + %i0]
	edge16ln	%g3,	%o7,	%i1
	tg	%xcc,	0x6
	tvc	%icc,	0x4
	fbe,a	%fcc2,	loop_2927
	fmovdleu	%icc,	%f21,	%f15
	udivcc	%l0,	0x01F6,	%o0
	subccc	%i6,	0x111E,	%l1
loop_2927:
	addcc	%o3,	%l6,	%g7
	be,a,pn	%xcc,	loop_2928
	fmovd	%f18,	%f6
	te	%icc,	0x7
	tgu	%icc,	0x1
loop_2928:
	fcmple16	%f10,	%f10,	%g2
	or	%g5,	0x0C3A,	%i0
	tn	%icc,	0x1
	bgu	%xcc,	loop_2929
	add	%g1,	%i4,	%o6
	fandnot1	%f14,	%f22,	%f22
	tneg	%xcc,	0x6
loop_2929:
	srax	%o1,	0x10,	%i2
	alignaddrl	%l4,	%i3,	%i5
	tvs	%icc,	0x7
	te	%xcc,	0x7
	array16	%i7,	%o2,	%l2
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f20
	fxtod	%f20,	%f22
	movleu	%xcc,	%o4,	%l3
	movgu	%xcc,	%o5,	%l5
	edge32n	%g6,	%g3,	%o7
	be,pn	%xcc,	loop_2930
	movrlz	%g4,	0x285,	%l0
	sethi	0x0096,	%i1
	movvs	%icc,	%i6,	%o0
loop_2930:
	tpos	%xcc,	0x0
	tle	%xcc,	0x4
	edge32ln	%l1,	%l6,	%g7
	addcc	%g2,	%g5,	%o3
	membar	0x3F
	xnor	%g1,	0x02E2,	%i4
	umul	%i0,	0x0C88,	%o1
	set	0x5C, %o2
	stwa	%i2,	[%l7 + %o2] 0x27
	membar	#Sync
	fbg,a	%fcc2,	loop_2931
	movrlez	%o6,	%l4,	%i3
	fxors	%f28,	%f7,	%f27
	movvc	%icc,	%i5,	%o2
loop_2931:
	nop
	set	0x43, %g3
	ldsba	[%l7 + %g3] 0x11,	%i7
	taddcc	%o4,	%l3,	%l2
	udiv	%o5,	0x1F96,	%g6
	sdiv	%g3,	0x0BC4,	%l5
	fmovse	%xcc,	%f3,	%f18
	tgu	%icc,	0x1
	faligndata	%f16,	%f18,	%f8
	srax	%g4,	%l0,	%o7
	srl	%i6,	%i1,	%l1
	tne	%icc,	0x4
	tle	%xcc,	0x1
	sth	%o0,	[%l7 + 0x34]
	fmovdne	%icc,	%f24,	%f31
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x10,	%g7,	%l6
	nop
	setx	0x70572C98,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	movcs	%icc,	%g5,	%o3
	udivcc	%g1,	0x018E,	%g2
	add	%i4,	0x1B2C,	%o1
	addc	%i0,	%i2,	%o6
	fzeros	%f29
	st	%f5,	[%l7 + 0x20]
	mulx	%i3,	%l4,	%i5
	edge8ln	%i7,	%o2,	%o4
	lduh	[%l7 + 0x38],	%l2
	edge16l	%l3,	%o5,	%g3
	tvs	%icc,	0x6
	fmovsneg	%icc,	%f13,	%f18
	tvc	%xcc,	0x7
	fnegd	%f22,	%f8
	movrgz	%g6,	0x287,	%g4
	movvc	%xcc,	%l5,	%o7
	movrlez	%l0,	%i6,	%l1
	add	%i1,	%g7,	%o0
	movgu	%icc,	%g5,	%l6
	movgu	%xcc,	%g1,	%o3
	edge16ln	%g2,	%i4,	%i0
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f16
	ta	%xcc,	0x5
	andncc	%i2,	%o1,	%i3
	fbul	%fcc3,	loop_2932
	tvs	%icc,	0x4
	sdivx	%o6,	0x0D66,	%l4
	ba,a,pn	%xcc,	loop_2933
loop_2932:
	sdivx	%i7,	0x1A10,	%i5
	ldd	[%l7 + 0x68],	%f16
	tcc	%xcc,	0x6
loop_2933:
	fmovsg	%xcc,	%f20,	%f27
	andcc	%o4,	0x1538,	%l2
	udivx	%o2,	0x18A0,	%o5
	bcc,pn	%xcc,	loop_2934
	movvc	%xcc,	%g3,	%l3
	xorcc	%g6,	0x0594,	%l5
	and	%o7,	0x16CD,	%l0
loop_2934:
	movne	%icc,	%i6,	%l1
	set	0x46, %l1
	lduba	[%l7 + %l1] 0x88,	%i1
	orn	%g4,	0x02BE,	%o0
	ldsw	[%l7 + 0x3C],	%g7
	tgu	%icc,	0x6
	tgu	%xcc,	0x7
	wr	%g0,	0x0c,	%asi
	stxa	%g5,	[%l7 + 0x20] %asi
	edge16l	%g1,	%o3,	%g2
	fcmpne16	%f4,	%f22,	%i4
	fmul8x16au	%f7,	%f6,	%f20
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f4
	movn	%xcc,	%i0,	%i2
	move	%icc,	%o1,	%l6
	brlez	%o6,	loop_2935
	movl	%xcc,	%l4,	%i7
	fmovdneg	%xcc,	%f3,	%f10
	movre	%i5,	%i3,	%l2
loop_2935:
	movge	%xcc,	%o4,	%o5
	popc	0x1DC8,	%o2
	fnands	%f21,	%f30,	%f16
	fmovsvs	%xcc,	%f4,	%f12
	sra	%l3,	0x03,	%g6
	sllx	%g3,	%l5,	%o7
	smul	%i6,	%l1,	%i1
	movne	%xcc,	%g4,	%l0
	movne	%xcc,	%g7,	%o0
	udiv	%g1,	0x0CD9,	%g5
	edge32	%g2,	%o3,	%i0
	taddcctv	%i4,	0x1CB7,	%o1
	udivx	%l6,	0x1734,	%o6
	fzero	%f8
	subccc	%l4,	%i2,	%i5
	edge32n	%i3,	%i7,	%o4
	wr	%g0,	0x27,	%asi
	stba	%o5,	[%l7 + 0x44] %asi
	membar	#Sync
	fmovdle	%icc,	%f18,	%f15
	movre	%l2,	%o2,	%l3
	ldsh	[%l7 + 0x66],	%g3
	stx	%l5,	[%l7 + 0x08]
	fmovrslz	%g6,	%f6,	%f2
	set	0x52, %i4
	stba	%o7,	[%l7 + %i4] 0x18
	fmovdne	%icc,	%f20,	%f30
	tl	%xcc,	0x3
	fbule	%fcc1,	loop_2936
	subccc	%l1,	%i6,	%g4
	smulcc	%i1,	0x117D,	%l0
	bvc,a	loop_2937
loop_2936:
	andncc	%o0,	%g1,	%g5
	edge32ln	%g7,	%g2,	%i0
	bne,a,pn	%xcc,	loop_2938
loop_2937:
	bvc,a,pn	%icc,	loop_2939
	sir	0x1E5D
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x78] %asi,	%i4
loop_2938:
	pdist	%f20,	%f0,	%f26
loop_2939:
	fmovdl	%icc,	%f31,	%f24
	movrlz	%o3,	0x1A4,	%o1
	tn	%xcc,	0x0
	tg	%xcc,	0x1
	fmovdl	%xcc,	%f20,	%f3
	srax	%o6,	0x04,	%l4
	movgu	%icc,	%l6,	%i5
	movge	%xcc,	%i2,	%i3
	movle	%icc,	%i7,	%o4
	movneg	%xcc,	%l2,	%o5
	addccc	%o2,	%l3,	%g3
	fmovrdgez	%l5,	%f22,	%f24
	movneg	%xcc,	%o7,	%g6
	tpos	%xcc,	0x2
	set	0x48, %o4
	ldswa	[%l7 + %o4] 0x10,	%i6
	movne	%icc,	%l1,	%g4
	tneg	%icc,	0x3
	fnot2s	%f23,	%f7
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x70] %asi,	%l0
	tle	%icc,	0x1
	fzeros	%f13
	mulscc	%i1,	0x0B3C,	%o0
	tle	%icc,	0x4
	subccc	%g1,	0x0A3D,	%g7
	movvc	%icc,	%g2,	%i0
	movgu	%icc,	%g5,	%o3
	taddcc	%o1,	0x16B2,	%o6
	fmovsgu	%xcc,	%f21,	%f24
	srax	%l4,	%i4,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x5
	flush	%l7 + 0x20
	sdiv	%i5,	0x129C,	%i2
	nop
	set	0x64, %o5
	stw	%i3,	[%l7 + %o5]
	movvc	%xcc,	%o4,	%i7
	fpsub32	%f4,	%f16,	%f16
	movneg	%xcc,	%l2,	%o2
	fmul8ulx16	%f2,	%f6,	%f24
	mulx	%o5,	%l3,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l5,	0x0E70,	%g6
	fmovs	%f4,	%f23
	tl	%icc,	0x7
	bge,pn	%xcc,	loop_2940
	fmovdne	%xcc,	%f28,	%f0
	tpos	%icc,	0x2
	fbg,a	%fcc3,	loop_2941
loop_2940:
	edge8ln	%i6,	%l1,	%g4
	orn	%o7,	%l0,	%i1
	and	%o0,	%g7,	%g1
loop_2941:
	tge	%xcc,	0x1
	edge8ln	%i0,	%g2,	%o3
	bvc,a,pt	%xcc,	loop_2942
	sdiv	%g5,	0x1B7F,	%o1
	edge16ln	%o6,	%l4,	%i4
	orcc	%l6,	%i5,	%i2
loop_2942:
	flush	%l7 + 0x74
	sir	0x058E
	movneg	%xcc,	%o4,	%i7
	popc	0x0894,	%i3
	edge32l	%o2,	%l2,	%l3
	xnor	%o5,	%g3,	%g6
	fnand	%f8,	%f2,	%f8
	alignaddr	%l5,	%l1,	%g4
	ta	%icc,	0x0
	fmovrsgez	%o7,	%f30,	%f13
	faligndata	%f0,	%f22,	%f30
	movl	%xcc,	%l0,	%i1
	bn,pt	%icc,	loop_2943
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
	nop
	setx	loop_2945,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc1s	%f14,	%f20
loop_2943:
	tle	%xcc,	0x7
loop_2944:
	and	%o0,	%g7,	%g1
loop_2945:
	sth	%i6,	[%l7 + 0x3E]
	edge16n	%g2,	%i0,	%o3
	tsubcc	%g5,	0x1348,	%o1
	membar	0x28
	smul	%l4,	%i4,	%l6
	movpos	%xcc,	%i5,	%o6
	array32	%o4,	%i2,	%i7
	call	loop_2946
	movle	%icc,	%i3,	%o2
	mulx	%l3,	0x1E84,	%o5
	nop
	set	0x28, %l6
	stx	%l2,	[%l7 + %l6]
loop_2946:
	xnor	%g6,	%g3,	%l1
	bl,a	%icc,	loop_2947
	tge	%icc,	0x2
	alignaddrl	%g4,	%o7,	%l5
	fbo	%fcc1,	loop_2948
loop_2947:
	umulcc	%i1,	0x0544,	%o0
	fmovsg	%icc,	%f9,	%f18
	sdiv	%g7,	0x061F,	%g1
loop_2948:
	ld	[%l7 + 0x44],	%f31
	bge,pt	%icc,	loop_2949
	alignaddr	%l0,	%i6,	%g2
	stb	%o3,	[%l7 + 0x42]
	wr	%g0,	0x2f,	%asi
	stba	%i0,	[%l7 + 0x51] %asi
	membar	#Sync
loop_2949:
	bneg,a	loop_2950
	lduh	[%l7 + 0x40],	%g5
	taddcctv	%o1,	%l4,	%i4
	bge	%xcc,	loop_2951
loop_2950:
	tneg	%xcc,	0x5
	addc	%l6,	%i5,	%o6
	edge16	%i2,	%o4,	%i7
loop_2951:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x34] %asi,	%o2
	subcc	%i3,	0x07AF,	%l3
	fnot2s	%f4,	%f20
	smulcc	%l2,	%o5,	%g3
	tsubcc	%g6,	%g4,	%l1
	fnot1	%f6,	%f8
	alignaddrl	%l5,	%i1,	%o0
	smulcc	%o7,	0x1599,	%g7
	set	0x74, %l2
	stwa	%l0,	[%l7 + %l2] 0x19
	move	%xcc,	%g1,	%g2
	movneg	%icc,	%o3,	%i0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i6,	%g5
	be,pt	%xcc,	loop_2952
	movne	%icc,	%l4,	%i4
	tge	%xcc,	0x5
	umul	%l6,	%o1,	%o6
loop_2952:
	fnors	%f3,	%f17,	%f7
	fandnot1s	%f25,	%f31,	%f0
	fnot2s	%f30,	%f31
	tvs	%xcc,	0x2
	srl	%i5,	0x0A,	%i2
	sdivcc	%o4,	0x0DA0,	%o2
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x04,	%i3,	%i7
	udivcc	%l3,	0x10A2,	%o5
	fornot1	%f2,	%f10,	%f20
	xor	%l2,	0x0782,	%g6
	tne	%icc,	0x6
	array32	%g4,	%g3,	%l1
	fornot1s	%f28,	%f29,	%f24
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2A] %asi,	%i1
	udivcc	%l5,	0x122C,	%o0
	fmovdneg	%icc,	%f1,	%f19
	udiv	%g7,	0x13F5,	%l0
	movrlez	%g1,	0x027,	%o7
	fnand	%f30,	%f2,	%f8
	movrne	%g2,	0x374,	%i0
	andn	%i6,	%o3,	%g5
	udivcc	%l4,	0x0A0E,	%i4
	or	%o1,	%l6,	%o6
	mova	%xcc,	%i2,	%o4
	fmovdgu	%xcc,	%f8,	%f2
	andncc	%i5,	%i3,	%o2
	fmovsl	%xcc,	%f4,	%f19
	ldx	[%l7 + 0x70],	%i7
	addccc	%l3,	0x05FA,	%o5
	tsubcctv	%l2,	%g6,	%g4
	bleu,pt	%icc,	loop_2953
	st	%f16,	[%l7 + 0x54]
	tl	%icc,	0x4
	ldd	[%l7 + 0x18],	%l0
loop_2953:
	nop
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x16,	%f0
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x52] %asi,	%g3
	ldd	[%l7 + 0x38],	%i0
	fmovsn	%xcc,	%f14,	%f25
	sdivcc	%o0,	0x18D3,	%l5
	fnegd	%f18,	%f14
	edge32n	%g7,	%l0,	%g1
	ldub	[%l7 + 0x77],	%g2
	fnegd	%f26,	%f10
	popc	%i0,	%o7
	fandnot2s	%f4,	%f29,	%f2
	sdivcc	%i6,	0x1456,	%g5
	edge16ln	%o3,	%l4,	%o1
	smul	%l6,	%i4,	%i2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x14] %asi,	%o6
	edge16n	%o4,	%i3,	%o2
	bcc,pn	%xcc,	loop_2954
	fnegd	%f6,	%f20
	tpos	%icc,	0x6
	nop
	fitos	%f8,	%f3
loop_2954:
	fmovrsne	%i7,	%f18,	%f31
	fmovdn	%icc,	%f4,	%f19
	subcc	%l3,	0x06EE,	%i5
	fcmpgt32	%f4,	%f26,	%l2
	bshuffle	%f26,	%f10,	%f30
	stw	%g6,	[%l7 + 0x6C]
	set	0x70, %g6
	prefetcha	[%l7 + %g6] 0x89,	 0x0
	nop
	setx	loop_2955,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdcc	%icc,	%f30,	%f16
	fnegs	%f20,	%f3
	stx	%l1,	[%l7 + 0x40]
loop_2955:
	and	%g4,	%g3,	%o0
	taddcctv	%l5,	0x17B8,	%i1
	lduh	[%l7 + 0x32],	%l0
	fnand	%f18,	%f26,	%f2
	edge32ln	%g7,	%g2,	%i0
	andcc	%o7,	0x0399,	%i6
	set	0x54, %i7
	sta	%f25,	[%l7 + %i7] 0x15
	edge16l	%g1,	%o3,	%g5
	fmul8sux16	%f16,	%f4,	%f12
	subcc	%l4,	%l6,	%i4
	tvs	%xcc,	0x3
	addccc	%o1,	0x0F0F,	%o6
	alignaddr	%i2,	%o4,	%i3
	subcc	%o2,	%i7,	%i5
	smulcc	%l3,	0x0ADB,	%l2
	subc	%g6,	0x056F,	%l1
	tsubcc	%g4,	0x0559,	%o5
	bvs	loop_2956
	array32	%g3,	%l5,	%o0
	tsubcc	%l0,	%g7,	%g2
	udiv	%i0,	0x1353,	%i1
loop_2956:
	nop
	set	0x70, %g4
	prefetcha	[%l7 + %g4] 0x15,	 0x2
	tleu	%xcc,	0x6
	ldstub	[%l7 + 0x7C],	%g1
	edge32ln	%i6,	%g5,	%l4
	sub	%l6,	0x16DF,	%o3
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x6A] %asi,	%o1
	call	loop_2957
	tg	%icc,	0x3
	fmovdge	%icc,	%f8,	%f14
	mulscc	%o6,	0x1E12,	%i4
loop_2957:
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f14
	fxtod	%f14,	%f2
	bneg,pn	%icc,	loop_2958
	fpadd32	%f8,	%f8,	%f22
	xor	%i2,	%i3,	%o2
	fmovrslz	%o4,	%f24,	%f10
loop_2958:
	movcs	%icc,	%i7,	%i5
	fcmple16	%f22,	%f26,	%l2
	sll	%g6,	0x0B,	%l1
	bshuffle	%f28,	%f10,	%f24
	nop
	setx	0x3128EBFEC7330A56,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xD92A0282A7AAB170,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f8,	%f2
	fxnors	%f18,	%f3,	%f16
	subccc	%l3,	0x0693,	%o5
	fblg,a	%fcc0,	loop_2959
	fbn	%fcc2,	loop_2960
	fcmple16	%f12,	%f18,	%g4
	taddcc	%l5,	%o0,	%g3
loop_2959:
	tpos	%xcc,	0x5
loop_2960:
	tl	%icc,	0x0
	mulx	%l0,	%g2,	%g7
	sub	%i0,	%i1,	%o7
	fbo	%fcc1,	loop_2961
	brz	%g1,	loop_2962
	flush	%l7 + 0x24
	udivx	%g5,	0x0A83,	%i6
loop_2961:
	edge32n	%l4,	%l6,	%o1
loop_2962:
	nop
	set	0x58, %l0
	stxa	%o6,	[%l7 + %l0] 0x04
	smulcc	%i4,	0x0BC8,	%o3
	alignaddr	%i3,	%i2,	%o4
	tvc	%icc,	0x7
	set	0x58, %l3
	stxa	%i7,	[%l7 + %l3] 0x89
	fmovdgu	%icc,	%f18,	%f7
	fpmerge	%f28,	%f16,	%f16
	fpadd32	%f6,	%f6,	%f26
	smulcc	%o2,	%i5,	%g6
	movle	%icc,	%l2,	%l3
	movg	%icc,	%l1,	%o5
	fbu	%fcc3,	loop_2963
	movre	%g4,	0x2D8,	%l5
	movl	%xcc,	%o0,	%g3
	nop
	fitod	%f0,	%f6
	fdtoi	%f6,	%f27
loop_2963:
	sir	0x0E63
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2798
!	Type cti   	: 2963
!	Type x   	: 1256
!	Type f   	: 4494
!	Type i   	: 13489
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x8DE5E75B
.word 0x7F2563E2
.word 0x74DAA43F
.word 0x1B163D40
.word 0x3A5405AA
.word 0xEB9B4376
.word 0x2B6D5B6A
.word 0x32893D91
.word 0x2F8BC709
.word 0x0D282679
.word 0x33BE9DF4
.word 0xEEA14722
.word 0xAB03E836
.word 0xCAC65F35
.word 0x71A3B676
.word 0x3C78FF8B
.word 0x763767D6
.word 0x82D21E0F
.word 0x22423A0A
.word 0x19060CB7
.word 0xD69F91BC
.word 0x331892B4
.word 0xF6B349B5
.word 0xD7FE5B17
.word 0x25E4037C
.word 0x65D60F46
.word 0xCF4DA159
.word 0x5EE66BB7
.word 0x79E65660
.word 0x601A844F
.word 0x6037D72F
.word 0xD79D5D23
.word 0x98A61E4A
.word 0x9470D9FB
.word 0xA0E3597A
.word 0xA2D13C71
.word 0x5AE7DE7F
.word 0xD54624EE
.word 0xE39E217D
.word 0x5812A716
.word 0xBB52A05A
.word 0x653F896E
.word 0xDFB98CC0
.word 0xE0E18AD0
.word 0xAD7A1C9C
.word 0x63073317
.word 0xF3D36B6B
.word 0x320D1FF6
.word 0xB23D8445
.word 0x5A015504
.word 0xD80CD663
.word 0x86526A6A
.word 0x1C9278DE
.word 0x044C449E
.word 0xD401CB66
.word 0xF8A29279
.word 0x6C77BAA6
.word 0xACD4DA57
.word 0x1405951C
.word 0xE0AC44A1
.word 0xCB9C7E74
.word 0xA3B11EEA
.word 0xB7BD98FF
.word 0xCAF9A35E
.end
