/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f10.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f10.s,v 1.1 2007/05/11 17:22:20 drp Exp $"
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
	setx	0x0C63B12AD0500B00,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x2,	%g1
	set	0x4,	%g2
	set	0xE,	%g3
	set	0xF,	%g4
	set	0x1,	%g5
	set	0xC,	%g6
	set	0xB,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xF,	%i1
	set	-0x9,	%i2
	set	-0xF,	%i3
	set	-0x5,	%i4
	set	-0xA,	%i5
	set	-0x9,	%i6
	set	-0xA,	%i7
	!# Local registers
	set	0x29F126DD,	%l0
	set	0x66FE68E2,	%l1
	set	0x1FA438D2,	%l2
	set	0x19E71317,	%l3
	set	0x556BB6D7,	%l4
	set	0x5A2B8F70,	%l5
	set	0x7860BB3A,	%l6
	!# Output registers
	set	0x025A,	%o0
	set	-0x11CA,	%o1
	set	0x0B81,	%o2
	set	0x06D7,	%o3
	set	0x1125,	%o4
	set	-0x083E,	%o5
	set	0x09F9,	%o6
	set	0x1676,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xEFB14959B2FAA461)
	INIT_TH_FP_REG(%l7,%f2,0xFC103D5F02B9DC48)
	INIT_TH_FP_REG(%l7,%f4,0x5E78907602A881D2)
	INIT_TH_FP_REG(%l7,%f6,0x854197042708F4B5)
	INIT_TH_FP_REG(%l7,%f8,0xC666AD05A4880683)
	INIT_TH_FP_REG(%l7,%f10,0x7E0DF9C56D3F05FF)
	INIT_TH_FP_REG(%l7,%f12,0x441B6687EEAB9926)
	INIT_TH_FP_REG(%l7,%f14,0x228AB97318516ADB)
	INIT_TH_FP_REG(%l7,%f16,0xD726E022698BBC8F)
	INIT_TH_FP_REG(%l7,%f18,0xBA0BF989E6FA7F13)
	INIT_TH_FP_REG(%l7,%f20,0xDCCD38C766D0476F)
	INIT_TH_FP_REG(%l7,%f22,0x4B7E7CBE96DA32C7)
	INIT_TH_FP_REG(%l7,%f24,0xC7C60C7B26BDDD70)
	INIT_TH_FP_REG(%l7,%f26,0xC96C90D41A53AFA2)
	INIT_TH_FP_REG(%l7,%f28,0x34017D6036A85343)
	INIT_TH_FP_REG(%l7,%f30,0xF028F87F85F048FF)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fbul	%fcc1,	loop_1
	ldsb	[%l7 + 0x24],	%o1
	bne,a,pn	%xcc,	loop_2
	movrlz	%l2,	0x36C,	%g5
loop_1:
	edge8n	%g7,	%g4,	%i4
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x88,	%i4
loop_2:
	fmul8x16al	%f13,	%f8,	%f8
	fmovdcs	%xcc,	%f15,	%f6
	edge8ln	%i2,	%l5,	%i6
	srl	%i3,	%g3,	%l3
	addc	%i1,	%l4,	%i0
	fmovdle	%xcc,	%f11,	%f0
	fpadd16	%f14,	%f10,	%f10
	ldsb	[%l7 + 0x60],	%l6
	fxor	%f14,	%f16,	%f4
	mulscc	%g1,	%i7,	%o5
	xor	%o6,	0x158D,	%o7
	fbl	%fcc1,	loop_3
	fcmped	%fcc1,	%f24,	%f28
	fpadd16s	%f1,	%f8,	%f30
	tne	%icc,	0x4
loop_3:
	std	%f22,	[%l7 + 0x38]
	bcc	loop_4
	fmovse	%xcc,	%f25,	%f14
	nop
	setx	loop_5,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%l0,	%o2,	%l1
loop_4:
	std	%g2,	[%l7 + 0x70]
	sir	0x1EBF
loop_5:
	nop
	wr	%g0,	0x89,	%asi
	stha	%o3,	[%l7 + 0x2A] %asi
	tg	%xcc,	0x2
	sdivx	%g6,	0x14C1,	%o0
	movrlez	%o1,	0x12D,	%o4
	edge8	%g5,	%l2,	%g7
	membar	0x55
	sethi	0x14F9,	%g4
	tne	%xcc,	0x4
	lduw	[%l7 + 0x58],	%i5
	fbe	%fcc3,	loop_6
	orncc	%i2,	%l5,	%i6
	fcmpgt16	%f18,	%f6,	%i4
	fbe	%fcc0,	loop_7
loop_6:
	stb	%i3,	[%l7 + 0x76]
	fcmpeq32	%f8,	%f0,	%g3
	movgu	%icc,	%l3,	%i1
loop_7:
	fzero	%f0
	tleu	%xcc,	0x7
	fands	%f5,	%f22,	%f6
	bl,a	%xcc,	loop_8
	fbne,a	%fcc1,	loop_9
	sdiv	%l4,	0x0E3A,	%l6
	fmovrdlz	%g1,	%f18,	%f8
loop_8:
	movrgz	%i0,	0x276,	%o5
loop_9:
	movrgez	%o6,	0x344,	%i7
	bne	loop_10
	tle	%xcc,	0x6
	taddcc	%l0,	%o2,	%l1
	movcs	%icc,	%o7,	%g2
loop_10:
	alignaddrl	%o3,	%g6,	%o0
	bvs,a	loop_11
	edge8l	%o4,	%g5,	%l2
	set	0x40, %l2
	ldstuba	[%l7 + %l2] 0x10,	%g7
loop_11:
	array8	%o1,	%i5,	%i2
	edge8	%l5,	%i6,	%i4
	mulscc	%i3,	0x16FE,	%g3
	tneg	%icc,	0x2
	fbge,a	%fcc0,	loop_12
	fpackfix	%f14,	%f6
	fmovse	%icc,	%f18,	%f2
	bcc,a	%xcc,	loop_13
loop_12:
	sdivx	%g4,	0x10E7,	%i1
	sethi	0x14F0,	%l4
	tcc	%xcc,	0x4
loop_13:
	alignaddr	%l6,	%g1,	%i0
	fornot2s	%f28,	%f28,	%f14
	tcc	%xcc,	0x6
	smulcc	%o5,	0x0C44,	%o6
	edge8	%i7,	%l3,	%o2
	addc	%l1,	0x05FA,	%o7
	edge16l	%l0,	%g2,	%g6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o3,	%o0
	fbo,a	%fcc0,	loop_14
	array8	%o4,	%l2,	%g5
	add	%g7,	0x1B75,	%o1
	xor	%i2,	%l5,	%i5
loop_14:
	fmovdpos	%xcc,	%f5,	%f13
	movneg	%xcc,	%i4,	%i6
	wr	%g0,	0x81,	%asi
	stha	%i3,	[%l7 + 0x1A] %asi
	fba,a	%fcc0,	loop_15
	addc	%g3,	0x0CCA,	%i1
	movvs	%xcc,	%l4,	%l6
	edge8l	%g4,	%i0,	%g1
loop_15:
	edge32l	%o5,	%i7,	%l3
	tcc	%xcc,	0x4
	taddcc	%o6,	0x1E33,	%o2
	fbn	%fcc3,	loop_16
	sdiv	%o7,	0x09D8,	%l0
	fbn	%fcc0,	loop_17
	srlx	%g2,	0x19,	%l1
loop_16:
	nop
	set	0x24, %o7
	lduwa	[%l7 + %o7] 0x15,	%g6
loop_17:
	st	%f15,	[%l7 + 0x6C]
	flush	%l7 + 0x70
	sir	0x026F
	bn,a	%xcc,	loop_18
	bn,a	%xcc,	loop_19
	udiv	%o0,	0x01BA,	%o4
	tvc	%xcc,	0x4
loop_18:
	ldsb	[%l7 + 0x34],	%l2
loop_19:
	fmul8ulx16	%f2,	%f0,	%f14
	smulcc	%g5,	0x194F,	%g7
	edge8	%o1,	%i2,	%l5
	xorcc	%o3,	0x074F,	%i4
	edge32	%i6,	%i3,	%i5
	udivcc	%g3,	0x1FB6,	%i1
	andcc	%l4,	0x0853,	%l6
	subcc	%i0,	0x1561,	%g4
	fcmpeq32	%f12,	%f4,	%g1
	fbuge	%fcc0,	loop_20
	array32	%o5,	%i7,	%l3
	edge8l	%o6,	%o2,	%o7
	fmovda	%icc,	%f9,	%f17
loop_20:
	ldub	[%l7 + 0x40],	%g2
	prefetch	[%l7 + 0x1C],	 0x3
	orcc	%l0,	%g6,	%l1
	fmovsne	%xcc,	%f24,	%f21
	udivx	%o0,	0x0B8A,	%l2
	movrgz	%g5,	%g7,	%o1
	array8	%i2,	%o4,	%o3
	brgz,a	%i4,	loop_21
	tleu	%xcc,	0x1
	tneg	%icc,	0x6
	wr	%g0,	0xea,	%asi
	stxa	%l5,	[%l7 + 0x60] %asi
	membar	#Sync
loop_21:
	te	%icc,	0x1
	movcs	%xcc,	%i3,	%i6
	fnor	%f26,	%f12,	%f18
	lduw	[%l7 + 0x30],	%g3
	tg	%xcc,	0x4
	move	%xcc,	%i5,	%l4
	edge8l	%l6,	%i0,	%g4
	fmovrslz	%g1,	%f24,	%f29
	set	0x14, %o5
	stba	%i1,	[%l7 + %o5] 0x15
	tcc	%xcc,	0x3
	set	0x20, %l0
	stxa	%o5,	[%l7 + %l0] 0x2f
	membar	#Sync
	movcs	%icc,	%l3,	%o6
	sub	%o2,	%o7,	%g2
	fmovrse	%i7,	%f8,	%f17
	lduh	[%l7 + 0x7A],	%l0
	std	%g6,	[%l7 + 0x18]
	subcc	%l1,	%l2,	%g5
	membar	0x63
	tneg	%xcc,	0x6
	fmovsne	%xcc,	%f8,	%f12
	array16	%g7,	%o1,	%i2
	orn	%o0,	0x050A,	%o3
	tleu	%icc,	0x0
	andncc	%i4,	%o4,	%i3
	movleu	%xcc,	%l5,	%i6
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%i4
	movpos	%xcc,	%g3,	%l4
	fornot2	%f24,	%f6,	%f8
	taddcctv	%l6,	0x0439,	%g4
	orn	%g1,	%i0,	%i1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%l3
	nop
	setx loop_22, %l0, %l1
	jmpl %l1, %o6
	movre	%o5,	%o2,	%o7
	fmuld8ulx16	%f1,	%f14,	%f10
	tsubcctv	%i7,	%g2,	%g6
loop_22:
	movrgez	%l0,	0x2E0,	%l1
	fxnors	%f3,	%f7,	%f14
	xnor	%g5,	0x1A44,	%l2
	umulcc	%o1,	0x05BA,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o0,	%o3,	%i4
	set	0x5C, %o4
	lduwa	[%l7 + %o4] 0x04,	%g7
	brlez,a	%i3,	loop_23
	fbug,a	%fcc2,	loop_24
	fbne	%fcc0,	loop_25
	orn	%o4,	0x1FB9,	%i6
loop_23:
	fbne	%fcc1,	loop_26
loop_24:
	movleu	%icc,	%i5,	%g3
loop_25:
	fmovsg	%xcc,	%f10,	%f16
	orn	%l5,	0x09E8,	%l6
loop_26:
	for	%f22,	%f22,	%f0
	smul	%l4,	0x0EBD,	%g1
	nop
	setx loop_27, %l0, %l1
	jmpl %l1, %i0
	movrne	%g4,	0x1A2,	%i1
	tcs	%icc,	0x1
	fzeros	%f15
loop_27:
	bn	%icc,	loop_28
	fmovrdlz	%o6,	%f4,	%f22
	tl	%xcc,	0x2
	edge16l	%o5,	%l3,	%o2
loop_28:
	alignaddrl	%i7,	%g2,	%o7
	edge8ln	%l0,	%g6,	%g5
	tgu	%icc,	0x4
	tsubcctv	%l2,	0x1FAC,	%o1
	sub	%l1,	%i2,	%o3
	fba	%fcc1,	loop_29
	tle	%xcc,	0x5
	fnands	%f30,	%f29,	%f18
	edge32	%i4,	%o0,	%g7
loop_29:
	movrne	%i3,	0x11F,	%o4
	movcs	%icc,	%i5,	%g3
	std	%l4,	[%l7 + 0x48]
	fsrc1	%f16,	%f24
	tvc	%icc,	0x2
	ldsw	[%l7 + 0x28],	%l6
	andn	%l4,	0x133B,	%g1
	fcmpes	%fcc3,	%f22,	%f16
	fbo,a	%fcc0,	loop_30
	fpsub32s	%f15,	%f20,	%f20
	fbe,a	%fcc1,	loop_31
	mulscc	%i6,	%i0,	%g4
loop_30:
	fmovrslz	%i1,	%f18,	%f20
	fmovsg	%icc,	%f30,	%f24
loop_31:
	movcs	%xcc,	%o6,	%l3
	mova	%xcc,	%o2,	%i7
	for	%f8,	%f26,	%f6
	udiv	%g2,	0x0654,	%o5
	edge8ln	%l0,	%g6,	%g5
	addccc	%l2,	0x157C,	%o7
	mulscc	%l1,	%o1,	%o3
	bge,pt	%icc,	loop_32
	fmovrslez	%i4,	%f25,	%f30
	udivcc	%o0,	0x04FA,	%i2
	fmuld8sux16	%f22,	%f20,	%f0
loop_32:
	fmovsneg	%icc,	%f13,	%f18
	alignaddrl	%i3,	%g7,	%i5
	ldx	[%l7 + 0x30],	%g3
	fornot2s	%f30,	%f14,	%f16
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x70] %asi,	%l5
	fbug	%fcc1,	loop_33
	nop
	setx	loop_34,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	membar	0x3D
	andn	%o4,	0x00C6,	%l6
loop_33:
	brgz,a	%g1,	loop_35
loop_34:
	movge	%xcc,	%l4,	%i0
	edge16	%i6,	%g4,	%i1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_35:
	addc	%l3,	%o2,	%o6
	bneg,a	loop_36
	fpsub32s	%f13,	%f10,	%f10
	sdivx	%g2,	0x10AB,	%o5
	fmul8x16al	%f29,	%f9,	%f8
loop_36:
	fnot1s	%f17,	%f16
	movvs	%xcc,	%l0,	%g6
	call	loop_37
	fbule	%fcc3,	loop_38
	fmovde	%icc,	%f28,	%f9
	udivx	%g5,	0x0C83,	%i7
loop_37:
	nop
	set	0x5D, %l1
	stba	%o7,	[%l7 + %l1] 0x04
loop_38:
	orcc	%l2,	%o1,	%o3
	tn	%xcc,	0x2
	set	0x74, %i7
	lduha	[%l7 + %i7] 0x89,	%l1
	fbne,a	%fcc2,	loop_39
	fnot2	%f14,	%f30
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x68] %asi,	%o0
loop_39:
	fcmpes	%fcc2,	%f22,	%f4
	movre	%i2,	%i4,	%i3
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g7
	alignaddrl	%g3,	%l5,	%i5
	srax	%l6,	%g1,	%l4
	orcc	%i0,	%i6,	%o4
	fmovsne	%icc,	%f31,	%f18
	fbl	%fcc0,	loop_40
	edge32n	%g4,	%i1,	%o2
	xnorcc	%o6,	0x0F47,	%l3
	bl,a,pt	%icc,	loop_41
loop_40:
	fornot1s	%f30,	%f6,	%f19
	movge	%icc,	%o5,	%l0
	st	%f31,	[%l7 + 0x54]
loop_41:
	sir	0x1A54
	umul	%g6,	%g2,	%g5
	andncc	%i7,	%o7,	%l2
	umulcc	%o1,	0x17C2,	%l1
	umul	%o3,	%o0,	%i2
	tn	%xcc,	0x5
	tl	%icc,	0x3
	orn	%i3,	0x009C,	%i4
	ldub	[%l7 + 0x46],	%g3
	fpackfix	%f10,	%f30
	ba,pn	%xcc,	loop_42
	udivx	%g7,	0x04F9,	%l5
	sllx	%l6,	%g1,	%l4
	edge16n	%i0,	%i6,	%i5
loop_42:
	sra	%g4,	0x19,	%o4
	tpos	%icc,	0x0
	subccc	%o2,	%o6,	%l3
	set	0x20, %l5
	ldxa	[%g0 + %l5] 0x4f,	%o5
	brgz	%l0,	loop_43
	and	%i1,	0x1229,	%g6
	subccc	%g2,	0x02C8,	%g5
	udiv	%o7,	0x0611,	%l2
loop_43:
	nop
	wr	%g0,	0x89,	%asi
	stda	%o0,	[%l7 + 0x78] %asi
	fmovdl	%xcc,	%f5,	%f31
	orcc	%i7,	%o3,	%o0
	edge16ln	%l1,	%i3,	%i4
	bn	loop_44
	tne	%icc,	0x1
	fandnot2	%f10,	%f28,	%f12
	array32	%g3,	%i2,	%g7
loop_44:
	subcc	%l5,	0x13EE,	%l6
	stbar
	array32	%g1,	%l4,	%i0
	fnand	%f28,	%f30,	%f14
	movgu	%icc,	%i6,	%g4
	fandnot2s	%f14,	%f5,	%f25
	pdist	%f12,	%f2,	%f6
	prefetch	[%l7 + 0x28],	 0x3
	edge16	%o4,	%o2,	%i5
	fcmpgt32	%f16,	%f12,	%l3
	taddcc	%o6,	0x0F99,	%l0
	addcc	%i1,	0x1F8F,	%o5
	brlz,a	%g6,	loop_45
	array8	%g5,	%o7,	%g2
	fmovspos	%xcc,	%f14,	%f15
	array32	%o1,	%l2,	%i7
loop_45:
	brnz,a	%o3,	loop_46
	smul	%o0,	0x14C4,	%l1
	fcmpeq32	%f18,	%f22,	%i3
	tcs	%xcc,	0x0
loop_46:
	pdist	%f10,	%f16,	%f24
	fmul8ulx16	%f12,	%f18,	%f20
	tcs	%xcc,	0x0
	addcc	%i4,	%g3,	%g7
	and	%i2,	0x0B71,	%l5
	tvs	%icc,	0x0
	movvc	%xcc,	%l6,	%l4
	movneg	%xcc,	%i0,	%g1
	tl	%icc,	0x5
	sir	0x141F
	orcc	%i6,	0x0F24,	%g4
	sethi	0x0239,	%o4
	smul	%i5,	0x08BE,	%l3
	movcc	%icc,	%o6,	%l0
	fcmped	%fcc2,	%f26,	%f20
	xnor	%o2,	0x1618,	%o5
	movne	%icc,	%i1,	%g5
	array32	%g6,	%o7,	%g2
	fmovrslez	%o1,	%f1,	%f6
	edge32n	%l2,	%o3,	%i7
	fpmerge	%f4,	%f22,	%f26
	fcmped	%fcc2,	%f14,	%f24
	fornot2s	%f17,	%f25,	%f9
	sll	%l1,	%i3,	%o0
	movle	%xcc,	%i4,	%g3
	brlz	%g7,	loop_47
	tge	%icc,	0x2
	sir	0x0527
	sll	%l5,	0x04,	%i2
loop_47:
	brz,a	%l4,	loop_48
	tleu	%xcc,	0x6
	fbne,a	%fcc0,	loop_49
	movleu	%xcc,	%i0,	%l6
loop_48:
	array16	%g1,	%i6,	%g4
	bvc,a	loop_50
loop_49:
	bpos,a,pt	%icc,	loop_51
	bvc,pn	%xcc,	loop_52
	mulscc	%i5,	0x167A,	%l3
loop_50:
	movrgz	%o4,	%o6,	%l0
loop_51:
	edge16l	%o5,	%o2,	%g5
loop_52:
	fmovsgu	%icc,	%f16,	%f13
	fpsub32s	%f22,	%f0,	%f21
	fcmple32	%f8,	%f26,	%g6
	fmovrdlz	%i1,	%f8,	%f16
	addccc	%o7,	0x0187,	%g2
	call	loop_53
	movleu	%xcc,	%l2,	%o3
	fmovsne	%xcc,	%f7,	%f19
	tne	%icc,	0x2
loop_53:
	sllx	%o1,	%i7,	%i3
	movrlz	%l1,	%o0,	%g3
	siam	0x1
	edge16ln	%i4,	%g7,	%i2
	st	%f6,	[%l7 + 0x24]
	tge	%icc,	0x2
	tsubcctv	%l5,	0x0E8F,	%l4
	move	%icc,	%l6,	%i0
	tcc	%xcc,	0x1
	brlz,a	%i6,	loop_54
	movcc	%icc,	%g1,	%i5
	set	0x56, %o3
	stba	%g4,	[%l7 + %o3] 0x2a
	membar	#Sync
loop_54:
	srl	%l3,	%o4,	%l0
	andcc	%o6,	%o2,	%o5
	edge16l	%g5,	%i1,	%o7
	te	%xcc,	0x0
	alignaddrl	%g2,	%g6,	%l2
	fmovsl	%xcc,	%f23,	%f15
	movgu	%icc,	%o3,	%o1
	move	%icc,	%i3,	%l1
	andncc	%i7,	%g3,	%o0
	tne	%icc,	0x4
	fbn,a	%fcc0,	loop_55
	fbuge	%fcc3,	loop_56
	movvc	%xcc,	%g7,	%i2
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_55:
	sdivcc	%i4,	0x1120,	%l4
loop_56:
	xor	%l6,	%l5,	%i0
	subc	%g1,	%i6,	%i5
	ldub	[%l7 + 0x48],	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l3,	%o4,	%l0
	fbn	%fcc3,	loop_57
	movrlz	%o2,	%o6,	%o5
	movg	%icc,	%g5,	%o7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%g2,	%i1
loop_57:
	fsrc1s	%f9,	%f25
	lduh	[%l7 + 0x4A],	%g6
	movrne	%l2,	0x234,	%o3
	subccc	%i3,	0x06C4,	%o1
	lduh	[%l7 + 0x7C],	%l1
	ldd	[%l7 + 0x18],	%i6
	fnand	%f8,	%f16,	%f6
	fxnors	%f4,	%f11,	%f5
	ta	%icc,	0x3
	tcc	%xcc,	0x7
	sdivx	%o0,	0x0FBD,	%g3
	flush	%l7 + 0x2C
	fbul,a	%fcc0,	loop_58
	fmovda	%xcc,	%f8,	%f26
	movre	%i2,	%g7,	%i4
	udivx	%l6,	0x1DAA,	%l5
loop_58:
	siam	0x1
	fmovse	%icc,	%f24,	%f14
	fpackfix	%f2,	%f27
	brnz,a	%l4,	loop_59
	sllx	%i0,	%g1,	%i5
	tleu	%xcc,	0x6
	fmovrdgz	%i6,	%f24,	%f18
loop_59:
	fblg	%fcc3,	loop_60
	edge32ln	%l3,	%o4,	%g4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x40] %asi,	%l0
loop_60:
	edge32n	%o6,	%o2,	%o5
	edge16	%o7,	%g2,	%i1
	stb	%g6,	[%l7 + 0x14]
	movrgez	%g5,	0x0FE,	%l2
	edge32n	%i3,	%o3,	%l1
	stbar
	ldsw	[%l7 + 0x08],	%i7
	move	%xcc,	%o0,	%g3
	sethi	0x07E7,	%o1
	popc	0x1943,	%g7
	tg	%xcc,	0x5
	fmovrsgez	%i2,	%f27,	%f30
	brnz	%i4,	loop_61
	tsubcctv	%l6,	0x1C4B,	%l4
	sethi	0x09B0,	%l5
	edge8n	%g1,	%i5,	%i0
loop_61:
	membar	0x1C
	fand	%f0,	%f26,	%f26
	orcc	%l3,	0x02CB,	%i6
	fcmpne32	%f2,	%f12,	%o4
	fba,a	%fcc2,	loop_62
	mulscc	%l0,	%o6,	%g4
	fbule	%fcc1,	loop_63
	movre	%o2,	0x213,	%o7
loop_62:
	srlx	%o5,	%i1,	%g6
	fandnot1	%f20,	%f2,	%f24
loop_63:
	sdivx	%g2,	0x1600,	%g5
	ld	[%l7 + 0x10],	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l2,	%o3,	%l1
	fbo,a	%fcc3,	loop_64
	swap	[%l7 + 0x60],	%i7
	and	%o0,	0x1BF2,	%i3
	fmovrdne	%o1,	%f16,	%f16
loop_64:
	mulscc	%g3,	%g7,	%i2
	sub	%l6,	0x1FF7,	%l4
	fpadd32	%f10,	%f22,	%f22
	edge32l	%l5,	%i4,	%g1
	fbo,a	%fcc2,	loop_65
	lduh	[%l7 + 0x52],	%i0
	movre	%i5,	0x0B3,	%l3
	fors	%f28,	%f21,	%f8
loop_65:
	edge8ln	%o4,	%i6,	%o6
	fbue	%fcc1,	loop_66
	fmovdneg	%icc,	%f19,	%f25
	movge	%xcc,	%g4,	%l0
	udivx	%o7,	0x01F2,	%o2
loop_66:
	fpmerge	%f26,	%f4,	%f0
	tn	%icc,	0x5
	tl	%xcc,	0x7
	smul	%o5,	%g6,	%i1
	fmovsa	%icc,	%f11,	%f26
	alignaddrl	%g2,	%l2,	%o3
	set	0x7C, %o2
	swapa	[%l7 + %o2] 0x0c,	%g5
	movn	%icc,	%i7,	%o0
	fpadd32s	%f12,	%f30,	%f28
	subccc	%i3,	0x1EAB,	%o1
	subc	%l1,	%g7,	%i2
	brgz,a	%g3,	loop_67
	and	%l6,	%l5,	%l4
	movre	%g1,	%i0,	%i4
	fmovsvs	%icc,	%f31,	%f15
loop_67:
	fmovdle	%xcc,	%f9,	%f18
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x11,	%f16
	movpos	%icc,	%i5,	%o4
	popc	%l3,	%i6
	tgu	%icc,	0x7
	ta	%icc,	0x5
	fmovd	%f0,	%f22
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%g4
	movrne	%l0,	%o6,	%o7
	addc	%o2,	%g6,	%i1
	st	%f1,	[%l7 + 0x68]
	te	%icc,	0x5
	bneg,a,pt	%icc,	loop_68
	mulx	%o5,	0x04E7,	%l2
	movpos	%xcc,	%o3,	%g5
	wr	%g0,	0xe3,	%asi
	stxa	%i7,	[%l7 + 0x18] %asi
	membar	#Sync
loop_68:
	movl	%xcc,	%o0,	%i3
	fbge,a	%fcc0,	loop_69
	orncc	%o1,	%l1,	%g7
	srl	%i2,	0x01,	%g3
	tpos	%icc,	0x1
loop_69:
	add	%g2,	0x1D3E,	%l6
	fxnor	%f20,	%f14,	%f22
	xorcc	%l4,	%l5,	%g1
	edge16ln	%i0,	%i4,	%o4
	bg,pn	%icc,	loop_70
	array32	%i5,	%l3,	%i6
	orn	%l0,	%g4,	%o7
	lduw	[%l7 + 0x24],	%o6
loop_70:
	fsrc1s	%f20,	%f15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o2,	%i1,	%g6
	taddcctv	%l2,	0x11E3,	%o3
	pdist	%f12,	%f18,	%f26
	udivx	%o5,	0x1A67,	%i7
	srlx	%o0,	0x16,	%i3
	smulcc	%g5,	%l1,	%g7
	bshuffle	%f16,	%f14,	%f0
	fmuld8ulx16	%f15,	%f28,	%f26
	sub	%i2,	0x1A57,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%g3,	loop_71
	taddcc	%g2,	0x1B3E,	%l6
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l5
loop_71:
	addcc	%l4,	%g1,	%i0
	sdivx	%o4,	0x127E,	%i5
	ldd	[%l7 + 0x58],	%l2
	wr	%g0,	0x2a,	%asi
	stwa	%i4,	[%l7 + 0x64] %asi
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x19B6,	%i6
	edge8n	%g4,	%o7,	%l0
	sra	%o6,	0x0C,	%o2
	fmovdneg	%icc,	%f23,	%f10
	fmovrslz	%i1,	%f4,	%f21
	tvs	%icc,	0x1
	edge8	%g6,	%o3,	%o5
	movcs	%icc,	%l2,	%i7
	lduh	[%l7 + 0x64],	%i3
	bne	%xcc,	loop_72
	movl	%xcc,	%o0,	%l1
	bneg	%icc,	loop_73
	move	%icc,	%g7,	%g5
loop_72:
	tcc	%xcc,	0x6
	fmul8sux16	%f24,	%f0,	%f22
loop_73:
	subccc	%o1,	%i2,	%g3
	fmovrdlz	%l6,	%f0,	%f0
	bne,a	%xcc,	loop_74
	srlx	%g2,	0x1B,	%l5
	brnz	%g1,	loop_75
	tleu	%xcc,	0x2
loop_74:
	mulx	%l4,	0x14D8,	%i0
	alignaddr	%i5,	%o4,	%l3
loop_75:
	fblg,a	%fcc3,	loop_76
	bne	%icc,	loop_77
	smul	%i4,	%g4,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77:
	or	%o7,	%l0,	%o6
	tpos	%icc,	0x2
	tcc	%icc,	0x2
	fpadd32	%f12,	%f8,	%f14
	edge8	%i1,	%g6,	%o3
	be,pt	%icc,	loop_78
	movle	%xcc,	%o2,	%o5
	ld	[%l7 + 0x7C],	%f24
	bge,a,pt	%xcc,	loop_79
loop_78:
	sdivcc	%i7,	0x0003,	%i3
	set	0x5E, %g5
	ldsba	[%l7 + %g5] 0x80,	%o0
loop_79:
	fcmpne32	%f4,	%f12,	%l1
	xnor	%l2,	0x0033,	%g7
	edge32	%g5,	%o1,	%g3
	fmovdge	%icc,	%f28,	%f0
	fmul8ulx16	%f14,	%f22,	%f2
	fxor	%f14,	%f22,	%f10
	fmovdgu	%icc,	%f13,	%f29
	tg	%icc,	0x2
	ldd	[%l7 + 0x78],	%f4
	fmovsg	%icc,	%f29,	%f4
	movre	%i2,	0x25C,	%l6
	taddcctv	%l5,	%g1,	%g2
	fble	%fcc1,	loop_80
	andn	%i0,	0x17CA,	%l4
	addc	%i5,	0x0A92,	%o4
	set	0x5B, %l4
	stba	%l3,	[%l7 + %l4] 0x23
	membar	#Sync
loop_80:
	stbar
	sdivx	%g4,	0x0333,	%i6
	flush	%l7 + 0x48
	fmovsle	%icc,	%f8,	%f13
	addcc	%o7,	0x1D59,	%l0
	fandnot1s	%f1,	%f19,	%f21
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o6,	%i4
	fcmpne32	%f2,	%f22,	%g6
	udivx	%i1,	0x18B2,	%o3
	movleu	%icc,	%o2,	%i7
	lduh	[%l7 + 0x20],	%i3
	ldd	[%l7 + 0x70],	%f6
	set	0x3C, %g2
	swapa	[%l7 + %g2] 0x89,	%o0
	fpsub32s	%f29,	%f23,	%f6
	brgz,a	%o5,	loop_81
	orn	%l2,	0x11A5,	%g7
	fmul8sux16	%f20,	%f24,	%f6
	fbg,a	%fcc2,	loop_82
loop_81:
	tge	%xcc,	0x6
	set	0x8, %g3
	stxa	%l1,	[%g0 + %g3] 0x20
loop_82:
	alignaddr	%o1,	%g3,	%g5
	fmovrslz	%l6,	%f4,	%f28
	mova	%xcc,	%i2,	%l5
	add	%g2,	%i0,	%l4
	ldx	[%l7 + 0x28],	%g1
	fcmple32	%f10,	%f16,	%o4
	move	%xcc,	%i5,	%g4
	fsrc1	%f28,	%f30
	fand	%f4,	%f26,	%f22
	fzeros	%f9
	and	%l3,	%i6,	%l0
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x17
	membar	#Sync
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
	edge8	%o7,	%o6,	%g6
	bne,a,pn	%icc,	loop_84
	fmovsa	%icc,	%f2,	%f31
loop_83:
	bvc,a	loop_85
	movne	%icc,	%i1,	%i4
loop_84:
	fbe,a	%fcc3,	loop_86
	movpos	%icc,	%o2,	%o3
loop_85:
	fand	%f14,	%f6,	%f20
	fpadd16s	%f25,	%f30,	%f17
loop_86:
	or	%i7,	%i3,	%o0
	mulx	%o5,	%l2,	%l1
	movcc	%icc,	%o1,	%g7
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
	edge16	%g5,	%i2,	%l6
	fzero	%f2
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x58] %asi,	%f29
	tcs	%xcc,	0x1
	umul	%l5,	0x134D,	%i0
	tneg	%xcc,	0x0
	fbug,a	%fcc2,	loop_87
	fornot2s	%f29,	%f20,	%f29
	fbuge,a	%fcc1,	loop_88
	edge8l	%l4,	%g2,	%g1
loop_87:
	bpos,a,pt	%xcc,	loop_89
	array8	%o4,	%g4,	%l3
loop_88:
	movrgez	%i6,	%l0,	%o7
	array16	%i5,	%g6,	%o6
loop_89:
	xorcc	%i1,	%o2,	%o3
	movne	%icc,	%i4,	%i7
	movle	%xcc,	%o0,	%i3
	nop
	setx loop_90, %l0, %l1
	jmpl %l1, %l2
	movl	%icc,	%o5,	%o1
	array32	%g7,	%g3,	%l1
	udivx	%i2,	0x0605,	%g5
loop_90:
	nop
	setx loop_91, %l0, %l1
	jmpl %l1, %l5
	prefetch	[%l7 + 0x34],	 0x3
	edge8n	%l6,	%l4,	%i0
	edge8	%g2,	%o4,	%g4
loop_91:
	array16	%l3,	%g1,	%i6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x04,	%l0,	%i5
	move	%icc,	%o7,	%g6
	fpack16	%f12,	%f4
	ldub	[%l7 + 0x39],	%i1
	tsubcc	%o6,	0x1138,	%o2
	tvs	%xcc,	0x0
	movrlz	%o3,	%i4,	%i7
	sdivx	%o0,	0x197F,	%l2
	set	0x76, %i0
	lduha	[%l7 + %i0] 0x80,	%o5
	alignaddrl	%o1,	%g7,	%i3
	taddcctv	%g3,	0x131F,	%l1
	array8	%i2,	%g5,	%l5
	movge	%icc,	%l6,	%l4
	nop
	set	0x2A, %o0
	ldub	[%l7 + %o0],	%g2
	movcc	%icc,	%o4,	%i0
	fbul	%fcc2,	loop_92
	movrgz	%l3,	%g1,	%g4
	xnor	%l0,	%i5,	%o7
	udivcc	%i6,	0x145B,	%g6
loop_92:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn	loop_93
	array8	%i1,	%o2,	%o6
	nop
	setx	loop_94,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1	%f0,	%f0,	%f16
loop_93:
	fbule	%fcc1,	loop_95
	movleu	%xcc,	%o3,	%i4
loop_94:
	orn	%o0,	%l2,	%o5
	fba,a	%fcc1,	loop_96
loop_95:
	addcc	%o1,	0x1F53,	%i7
	fmovscc	%icc,	%f7,	%f28
	movcs	%icc,	%g7,	%g3
loop_96:
	ldsh	[%l7 + 0x10],	%i3
	set	0x6C, %i6
	sta	%f14,	[%l7 + %i6] 0x10
	addc	%l1,	0x1AFF,	%g5
	fmovdge	%xcc,	%f13,	%f10
	subc	%i2,	0x125F,	%l6
	fmovsl	%xcc,	%f20,	%f22
	fxor	%f6,	%f12,	%f8
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x08] %asi,	%l5
	movge	%xcc,	%l4,	%o4
	movne	%xcc,	%i0,	%l3
	tcs	%icc,	0x5
	umulcc	%g2,	0x1359,	%g1
	brgz	%l0,	loop_97
	mulscc	%i5,	%o7,	%i6
	tsubcctv	%g6,	%g4,	%o2
	bl	loop_98
loop_97:
	movvc	%icc,	%i1,	%o6
	fmul8x16au	%f16,	%f23,	%f24
	fcmpne16	%f0,	%f2,	%i4
loop_98:
	tleu	%icc,	0x3
	fnegd	%f16,	%f10
	nop
	setx loop_99, %l0, %l1
	jmpl %l1, %o3
	nop
	setx	loop_100,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%xcc,	0x4
	edge32ln	%o0,	%l2,	%o5
loop_99:
	fnot2s	%f14,	%f22
loop_100:
	sll	%o1,	%g7,	%i7
	popc	%g3,	%l1
	nop
	set	0x16, %g4
	stb	%i3,	[%l7 + %g4]
	tcs	%icc,	0x4
	movcc	%xcc,	%i2,	%l6
	tg	%xcc,	0x5
	fmovsneg	%icc,	%f13,	%f30
	nop
	setx	loop_101,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tne	%icc,	0x1
	array16	%g5,	%l5,	%l4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%i0,	%l3
loop_101:
	fbo	%fcc1,	loop_102
	addccc	%o4,	%g1,	%l0
	orncc	%i5,	%g2,	%i6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x74] %asi,	%g6
loop_102:
	srax	%o7,	0x0E,	%g4
	movrne	%i1,	0x1B5,	%o6
	and	%i4,	%o3,	%o2
	srl	%l2,	0x1D,	%o5
	addc	%o1,	%g7,	%o0
	sllx	%g3,	0x1C,	%i7
	std	%f10,	[%l7 + 0x40]
	movgu	%icc,	%i3,	%i2
	bge,a	loop_103
	ta	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l1,	%g5,	%l5
loop_103:
	ba	%xcc,	loop_104
	edge32n	%l6,	%i0,	%l4
	fsrc2s	%f26,	%f19
	tvc	%icc,	0x6
loop_104:
	sdivcc	%o4,	0x1CA0,	%l3
	brgz	%l0,	loop_105
	bne,a	%xcc,	loop_106
	popc	0x0A6B,	%i5
	brgez	%g2,	loop_107
loop_105:
	bleu,a	%xcc,	loop_108
loop_106:
	sth	%i6,	[%l7 + 0x3C]
	edge8ln	%g1,	%g6,	%g4
loop_107:
	nop
	set	0x48, %g6
	stda	%i0,	[%l7 + %g6] 0x10
loop_108:
	stw	%o6,	[%l7 + 0x40]
	te	%icc,	0x7
	movg	%xcc,	%i4,	%o7
	mulx	%o3,	%l2,	%o2
	bgu	%xcc,	loop_109
	tl	%xcc,	0x7
	faligndata	%f26,	%f18,	%f16
	set	0x5C, %i1
	stwa	%o5,	[%l7 + %i1] 0x18
loop_109:
	sir	0x17D6
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x80
	array16	%g7,	%o0,	%g3
	sdivcc	%i7,	0x099D,	%o1
	movg	%icc,	%i3,	%i2
	sethi	0x14CD,	%l1
	subc	%l5,	%g5,	%l6
	brnz	%i0,	loop_110
	movn	%xcc,	%o4,	%l3
	edge32l	%l4,	%l0,	%i5
	xorcc	%g2,	%g1,	%g6
loop_110:
	fmovrslz	%g4,	%f14,	%f18
	movgu	%icc,	%i6,	%i1
	edge8l	%i4,	%o7,	%o3
	ldub	[%l7 + 0x70],	%o6
	alignaddr	%o2,	%o5,	%l2
	fcmple32	%f10,	%f30,	%g7
	smulcc	%o0,	0x0FEE,	%g3
	tge	%xcc,	0x5
	ldd	[%l7 + 0x08],	%o0
	movg	%xcc,	%i3,	%i7
	fbe,a	%fcc2,	loop_111
	call	loop_112
	edge16ln	%i2,	%l1,	%g5
	edge32ln	%l6,	%i0,	%o4
loop_111:
	sethi	0x039F,	%l5
loop_112:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8ln	%l3,	%l0,	%l4
	movl	%xcc,	%g2,	%g1
	set	0x30, %i5
	ldxa	[%g0 + %i5] 0x58,	%i5
	tleu	%xcc,	0x7
	edge32ln	%g4,	%g6,	%i6
	sdiv	%i4,	0x0C18,	%i1
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o7
	flush	%l7 + 0x48
	tneg	%icc,	0x4
	bvs,a,pt	%xcc,	loop_113
	udivx	%o6,	0x1E58,	%o2
	fmovrsgez	%o3,	%f8,	%f12
	fmul8x16al	%f2,	%f9,	%f6
loop_113:
	edge8n	%o5,	%g7,	%o0
	srax	%l2,	%o1,	%g3
	movrgz	%i3,	%i7,	%i2
	edge8l	%g5,	%l1,	%i0
	popc	%o4,	%l5
	brz,a	%l3,	loop_114
	fmovrse	%l6,	%f31,	%f22
	fbn	%fcc0,	loop_115
	tcs	%xcc,	0x1
loop_114:
	movvc	%icc,	%l0,	%g2
	tg	%icc,	0x2
loop_115:
	fmovdneg	%xcc,	%f4,	%f4
	movvc	%icc,	%g1,	%l4
	fmovd	%f18,	%f28
	fsrc1	%f6,	%f12
	alignaddr	%g4,	%i5,	%i6
	fmovrse	%g6,	%f11,	%f21
	fzero	%f16
	orn	%i1,	%i4,	%o7
	edge8	%o6,	%o2,	%o5
	fmovrsgz	%o3,	%f3,	%f23
	popc	0x033F,	%g7
	or	%o0,	0x082E,	%l2
	addcc	%g3,	%i3,	%o1
	sllx	%i2,	%i7,	%l1
	tpos	%xcc,	0x6
	std	%f26,	[%l7 + 0x78]
	xor	%g5,	0x07A7,	%o4
	fcmpgt32	%f16,	%f16,	%l5
	sllx	%l3,	0x04,	%l6
	srl	%i0,	%g2,	%l0
	st	%f6,	[%l7 + 0x68]
	edge16ln	%g1,	%g4,	%l4
	edge32l	%i5,	%g6,	%i6
	faligndata	%f26,	%f22,	%f12
	xor	%i1,	0x1C2E,	%o7
	fmovrslz	%o6,	%f12,	%f5
	bneg	%icc,	loop_116
	membar	0x6A
	popc	0x08B1,	%o2
	edge16l	%o5,	%o3,	%g7
loop_116:
	subccc	%o0,	%i4,	%g3
	edge16n	%l2,	%i3,	%i2
	fpadd16	%f10,	%f2,	%f4
	andcc	%i7,	0x0B2A,	%o1
	stw	%g5,	[%l7 + 0x2C]
	edge16l	%o4,	%l5,	%l3
	sdivcc	%l1,	0x1E99,	%i0
	smulcc	%l6,	%g2,	%g1
	ldd	[%l7 + 0x40],	%l0
	tneg	%xcc,	0x6
	wr	%g0,	0x19,	%asi
	stxa	%l4,	[%l7 + 0x58] %asi
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x17,	%f0
	sll	%g4,	0x1C,	%g6
	fxor	%f6,	%f24,	%f22
	set	0x72, %i4
	stha	%i5,	[%l7 + %i4] 0x18
	fcmpgt32	%f26,	%f6,	%i1
	tpos	%icc,	0x4
	sdivcc	%o7,	0x083F,	%i6
	movcs	%icc,	%o6,	%o2
	bvs,a,pt	%xcc,	loop_117
	mulx	%o5,	0x08F8,	%o3
	fnands	%f1,	%f1,	%f16
	edge8n	%o0,	%g7,	%i4
loop_117:
	movleu	%xcc,	%g3,	%l2
	srax	%i2,	0x15,	%i7
	fbe	%fcc0,	loop_118
	udiv	%i3,	0x1879,	%g5
	sllx	%o4,	0x0C,	%o1
	nop
	setx loop_119, %l0, %l1
	jmpl %l1, %l3
loop_118:
	fmovscc	%icc,	%f28,	%f10
	move	%icc,	%l5,	%i0
	fmovrsgz	%l1,	%f14,	%f27
loop_119:
	ldsb	[%l7 + 0x4F],	%l6
	fexpand	%f29,	%f20
	tleu	%xcc,	0x0
	fmovdne	%icc,	%f5,	%f30
	tle	%xcc,	0x3
	movleu	%icc,	%g2,	%g1
	edge32ln	%l0,	%l4,	%g6
	movleu	%xcc,	%i5,	%i1
	subc	%g4,	0x1273,	%o7
	fandnot1s	%f31,	%f6,	%f1
	mulx	%i6,	0x0C1C,	%o6
	edge32	%o2,	%o5,	%o3
	movpos	%icc,	%g7,	%i4
	orcc	%g3,	%l2,	%i2
	andcc	%i7,	0x061B,	%i3
	fbuge	%fcc1,	loop_120
	edge16l	%o0,	%g5,	%o4
	srax	%o1,	0x1C,	%l5
	xor	%i0,	0x1CA7,	%l1
loop_120:
	fmovd	%f12,	%f16
	bcs,pn	%xcc,	loop_121
	fmovdleu	%icc,	%f11,	%f25
	fmovscc	%icc,	%f26,	%f5
	movcc	%xcc,	%l6,	%g2
loop_121:
	fbul	%fcc1,	loop_122
	alignaddr	%l3,	%g1,	%l4
	sethi	0x1987,	%l0
	tvs	%xcc,	0x6
loop_122:
	movg	%icc,	%g6,	%i5
	fpsub32s	%f13,	%f25,	%f22
	fmovdleu	%xcc,	%f7,	%f31
	fpack32	%f0,	%f22,	%f16
	movgu	%icc,	%g4,	%i1
	ldsw	[%l7 + 0x20],	%i6
	bpos,a,pn	%icc,	loop_123
	movvc	%icc,	%o6,	%o7
	set	0x64, %g7
	sta	%f19,	[%l7 + %g7] 0x14
loop_123:
	fcmpes	%fcc3,	%f24,	%f7
	movleu	%xcc,	%o2,	%o3
	std	%g6,	[%l7 + 0x48]
	move	%xcc,	%o5,	%g3
	ldsb	[%l7 + 0x12],	%l2
	st	%f10,	[%l7 + 0x0C]
	stb	%i2,	[%l7 + 0x58]
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
	addc	%i7,	%i3,	%o0
	fornot1s	%f10,	%f5,	%f2
	fba	%fcc1,	loop_125
loop_124:
	ba,pn	%icc,	loop_126
	fxnors	%f12,	%f15,	%f10
	bne	%xcc,	loop_127
loop_125:
	ldd	[%l7 + 0x30],	%g4
loop_126:
	bl,a,pn	%xcc,	loop_128
	srlx	%i4,	%o1,	%o4
loop_127:
	array16	%l5,	%i0,	%l6
	fbul	%fcc3,	loop_129
loop_128:
	brnz,a	%g2,	loop_130
	popc	0x1E25,	%l1
	movneg	%icc,	%l3,	%l4
loop_129:
	edge8	%l0,	%g1,	%i5
loop_130:
	tvc	%icc,	0x0
	sra	%g6,	0x06,	%i1
	mulscc	%g4,	0x024D,	%o6
	movcc	%icc,	%i6,	%o7
	mulscc	%o3,	0x1642,	%o2
	fmovsle	%xcc,	%f3,	%f1
	udivcc	%g7,	0x0735,	%o5
	movrne	%l2,	0x019,	%g3
	tsubcctv	%i2,	%i3,	%o0
	tvc	%xcc,	0x4
	fbn,a	%fcc0,	loop_131
	nop
	setx	loop_132,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tn	%xcc,	0x2
	movrlz	%g5,	0x05A,	%i7
loop_131:
	umul	%i4,	%o1,	%l5
loop_132:
	tsubcctv	%o4,	%i0,	%g2
	tn	%xcc,	0x7
	brgez	%l6,	loop_133
	sir	0x1F8F
	fxors	%f7,	%f1,	%f24
	fnot1	%f8,	%f4
loop_133:
	fzeros	%f13
	fpackfix	%f24,	%f4
	fzeros	%f9
	brnz	%l3,	loop_134
	xor	%l1,	%l0,	%g1
	stw	%l4,	[%l7 + 0x2C]
	fmovsne	%xcc,	%f29,	%f4
loop_134:
	movne	%icc,	%i5,	%i1
	bge,pn	%xcc,	loop_135
	fnot2s	%f13,	%f31
	edge32l	%g4,	%o6,	%g6
	movrgez	%o7,	0x11A,	%o3
loop_135:
	te	%icc,	0x5
	fones	%f11
	orn	%i6,	%o2,	%g7
	bge,a,pt	%xcc,	loop_136
	andn	%l2,	0x1E45,	%g3
	swap	[%l7 + 0x6C],	%o5
	tleu	%xcc,	0x5
loop_136:
	fbu,a	%fcc1,	loop_137
	movleu	%xcc,	%i3,	%i2
	movre	%o0,	%i7,	%i4
	fone	%f30
loop_137:
	fmovrde	%g5,	%f12,	%f6
	taddcc	%o1,	%l5,	%i0
	movle	%icc,	%o4,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l6,	0x1A,	%l1
	edge32ln	%l0,	%l3,	%g1
	fmovdcc	%icc,	%f30,	%f12
	array8	%i5,	%l4,	%g4
	and	%i1,	%g6,	%o6
	xnorcc	%o7,	0x040C,	%i6
	movl	%xcc,	%o3,	%g7
	nop
	setx	loop_138,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%xcc,	0x5
	movrne	%o2,	0x0C3,	%g3
	membar	0x68
loop_138:
	ta	%xcc,	0x6
	bn,a	%icc,	loop_139
	tpos	%xcc,	0x3
	tne	%icc,	0x1
	brlez	%l2,	loop_140
loop_139:
	alignaddr	%i3,	%o5,	%o0
	movpos	%icc,	%i2,	%i4
	tle	%icc,	0x2
loop_140:
	sdivcc	%i7,	0x1508,	%g5
	andn	%o1,	0x0210,	%i0
	umulcc	%o4,	%g2,	%l5
	fsrc1	%f6,	%f6
	st	%f3,	[%l7 + 0x0C]
	movrlz	%l6,	%l1,	%l3
	fzero	%f26
	fsrc2	%f18,	%f12
	xorcc	%g1,	0x12A1,	%l0
	te	%icc,	0x2
	sdivx	%l4,	0x1637,	%g4
	fmovda	%xcc,	%f16,	%f3
	bleu	loop_141
	fbl	%fcc2,	loop_142
	umulcc	%i1,	%i5,	%g6
	orn	%o7,	0x1F00,	%i6
loop_141:
	ta	%xcc,	0x3
loop_142:
	ldub	[%l7 + 0x3A],	%o6
	orn	%o3,	0x106A,	%o2
	fmovdgu	%icc,	%f6,	%f27
	movvs	%xcc,	%g3,	%l2
	alignaddr	%i3,	%o5,	%g7
	ta	%icc,	0x4
	mova	%icc,	%i2,	%i4
	fpsub32s	%f31,	%f0,	%f15
	andncc	%o0,	%i7,	%o1
	umulcc	%g5,	%o4,	%i0
	xnor	%g2,	%l6,	%l1
	movg	%icc,	%l3,	%l5
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%g1
	fcmpes	%fcc0,	%f3,	%f15
	tg	%xcc,	0x0
	nop
	set	0x2C, %i3
	stw	%l0,	[%l7 + %i3]
	brnz	%g4,	loop_143
	stbar
	fbul	%fcc3,	loop_144
	sdiv	%l4,	0x0F0B,	%i5
loop_143:
	edge8ln	%g6,	%i1,	%o7
	fmovsgu	%icc,	%f28,	%f28
loop_144:
	edge8n	%o6,	%o3,	%i6
	st	%f5,	[%l7 + 0x1C]
	fmovrslez	%o2,	%f24,	%f12
	flush	%l7 + 0x18
	fsrc1s	%f25,	%f13
	alignaddr	%g3,	%l2,	%o5
	fmovsle	%xcc,	%f27,	%f4
	fmul8ulx16	%f12,	%f20,	%f30
	tl	%xcc,	0x6
	te	%xcc,	0x7
	fmovsa	%xcc,	%f6,	%f24
	mulx	%i3,	%i2,	%g7
	fsrc1	%f0,	%f6
	movneg	%xcc,	%i4,	%o0
	tcs	%icc,	0x6
	udiv	%o1,	0x05A3,	%g5
	fornot1s	%f14,	%f22,	%f5
	movrgz	%i7,	%o4,	%g2
	movrlez	%l6,	%l1,	%l3
	fbl,a	%fcc0,	loop_145
	edge8l	%i0,	%l5,	%g1
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x1C] %asi,	%g4
loop_145:
	fones	%f29
	array8	%l4,	%l0,	%g6
	std	%f0,	[%l7 + 0x30]
	fmovrdlz	%i5,	%f0,	%f24
	xnorcc	%i1,	0x0B02,	%o7
	sdivcc	%o6,	0x07EF,	%o3
	xnor	%o2,	%i6,	%l2
	fmul8x16au	%f17,	%f19,	%f22
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g3,	%i3
	move	%icc,	%o5,	%g7
	fcmped	%fcc0,	%f12,	%f2
	udiv	%i4,	0x0326,	%o0
	tle	%icc,	0x5
	fbue,a	%fcc3,	loop_146
	bneg,pn	%icc,	loop_147
	edge8l	%i2,	%o1,	%g5
	be,pt	%xcc,	loop_148
loop_146:
	edge32n	%o4,	%i7,	%l6
loop_147:
	fbuge,a	%fcc1,	loop_149
	fpsub16	%f20,	%f16,	%f26
loop_148:
	sll	%l1,	%g2,	%i0
	bvc,a	%icc,	loop_150
loop_149:
	fbl,a	%fcc3,	loop_151
	sdivx	%l3,	0x07A2,	%g1
	stbar
loop_150:
	fnor	%f10,	%f24,	%f2
loop_151:
	srlx	%g4,	%l5,	%l0
	fmovsg	%xcc,	%f23,	%f31
	alignaddrl	%g6,	%l4,	%i1
	fnegs	%f25,	%f20
	fornot2s	%f6,	%f9,	%f21
	tge	%icc,	0x6
	pdist	%f14,	%f18,	%f4
	fpsub16s	%f14,	%f15,	%f4
	array16	%i5,	%o7,	%o6
	bcs,a,pn	%xcc,	loop_152
	srl	%o3,	%o2,	%l2
	sdiv	%i6,	0x173E,	%g3
	movrgz	%o5,	%g7,	%i4
loop_152:
	movrgz	%o0,	%i2,	%i3
	tneg	%icc,	0x0
	movneg	%xcc,	%g5,	%o4
	movcs	%icc,	%o1,	%l6
	move	%xcc,	%l1,	%i7
	tcs	%icc,	0x4
	orncc	%i0,	%l3,	%g1
	bgu,pn	%xcc,	loop_153
	edge16	%g4,	%g2,	%l0
	ldub	[%l7 + 0x2A],	%g6
	wr	%g0,	0x10,	%asi
	stwa	%l5,	[%l7 + 0x14] %asi
loop_153:
	mulx	%l4,	0x177A,	%i1
	addc	%o7,	0x1547,	%i5
	tne	%xcc,	0x3
	sir	0x06C6
	movrgz	%o3,	%o6,	%l2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x4C] %asi,	%o2
	movrgz	%i6,	%g3,	%g7
	fmovsneg	%icc,	%f23,	%f13
	fcmpes	%fcc2,	%f6,	%f31
	orncc	%i4,	0x14BD,	%o5
	sra	%i2,	0x01,	%o0
	bcs,a,pn	%xcc,	loop_154
	tpos	%xcc,	0x2
	fmovse	%icc,	%f26,	%f20
	movge	%xcc,	%g5,	%o4
loop_154:
	tsubcc	%o1,	0x1BCF,	%i3
	call	loop_155
	orcc	%l6,	0x13A1,	%i7
	subcc	%l1,	0x0705,	%l3
	be,a,pt	%icc,	loop_156
loop_155:
	array32	%g1,	%i0,	%g4
	bne	loop_157
	fbl	%fcc2,	loop_158
loop_156:
	andncc	%l0,	%g2,	%g6
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_157:
	taddcc	%l5,	0x06E1,	%l4
loop_158:
	tsubcctv	%i1,	0x0275,	%i5
	sllx	%o3,	0x06,	%o6
	flush	%l7 + 0x10
	wr	%g0,	0x04,	%asi
	stba	%l2,	[%l7 + 0x32] %asi
	tl	%icc,	0x2
	fandnot1s	%f23,	%f27,	%f8
	fmovsle	%xcc,	%f1,	%f9
	sra	%o2,	%o7,	%i6
	fmovrslz	%g7,	%f8,	%f23
	fbg	%fcc3,	loop_159
	movne	%icc,	%g3,	%o5
	xor	%i2,	%o0,	%g5
	xnorcc	%i4,	0x11B8,	%o1
loop_159:
	umul	%o4,	%i3,	%l6
	array16	%l1,	%l3,	%g1
	edge32l	%i7,	%i0,	%l0
	tvs	%xcc,	0x5
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0xf1
	membar	#Sync
	edge32n	%g4,	%g2,	%g6
	orncc	%l4,	%i1,	%l5
	edge8n	%o3,	%o6,	%l2
	movcs	%xcc,	%o2,	%o7
	tcs	%xcc,	0x2
	bleu,a,pt	%xcc,	loop_160
	and	%i5,	%i6,	%g7
	bl,a,pn	%xcc,	loop_161
	tge	%xcc,	0x3
loop_160:
	ldsw	[%l7 + 0x38],	%o5
	fpadd16	%f26,	%f14,	%f20
loop_161:
	andn	%i2,	0x086B,	%o0
	andn	%g3,	%i4,	%g5
	fmovdcs	%icc,	%f16,	%f9
	array8	%o4,	%i3,	%l6
	prefetch	[%l7 + 0x08],	 0x3
	fmovrdgez	%l1,	%f14,	%f12
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x04,	%f16
	andn	%l3,	%g1,	%o1
	fcmpeq16	%f14,	%f16,	%i7
	edge16	%i0,	%l0,	%g4
	fnand	%f18,	%f16,	%f8
	tgu	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x05BA
	set	0x10, %l6
	ldxa	[%g0 + %l6] 0x21,	%g2
	movcc	%xcc,	%l4,	%g6
	sir	0x1A42
	smul	%i1,	%l5,	%o6
	bneg,a,pn	%xcc,	loop_162
	and	%l2,	0x0AEA,	%o2
	ld	[%l7 + 0x2C],	%f17
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_162:
	nop
	wr	%g0,	0x11,	%asi
	stha	%o7,	[%l7 + 0x7A] %asi
	bl,pn	%icc,	loop_163
	nop
	setx	loop_164,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldstub	[%l7 + 0x76],	%i5
	fcmple32	%f14,	%f20,	%i6
loop_163:
	move	%icc,	%o3,	%o5
loop_164:
	fmovrsgez	%i2,	%f12,	%f7
	tpos	%icc,	0x0
	andn	%g7,	%o0,	%i4
	fcmpne32	%f6,	%f14,	%g3
	sub	%o4,	%i3,	%g5
	bneg,a	loop_165
	tle	%xcc,	0x7
	addcc	%l6,	%l1,	%l3
	fmovsvs	%icc,	%f16,	%f26
loop_165:
	edge16l	%o1,	%i7,	%i0
	array16	%g1,	%l0,	%g4
	xnorcc	%g2,	%g6,	%l4
	fabss	%f10,	%f11
	xorcc	%l5,	0x15DD,	%o6
	bvs,a	%icc,	loop_166
	fone	%f16
	movre	%l2,	%i1,	%o7
	brgz	%o2,	loop_167
loop_166:
	smulcc	%i5,	0x0F66,	%i6
	call	loop_168
	bne,a	loop_169
loop_167:
	and	%o3,	0x0998,	%o5
	sth	%i2,	[%l7 + 0x6A]
loop_168:
	sra	%o0,	0x16,	%i4
loop_169:
	sdiv	%g3,	0x13E1,	%g7
	tn	%icc,	0x0
	sethi	0x06DD,	%o4
	udivcc	%g5,	0x1756,	%l6
	for	%f30,	%f22,	%f14
	orcc	%i3,	0x02D6,	%l1
	fsrc2	%f24,	%f8
	fcmpes	%fcc1,	%f1,	%f5
	fcmped	%fcc0,	%f24,	%f26
	array16	%o1,	%i7,	%i0
	movleu	%xcc,	%l3,	%l0
	fbg,a	%fcc2,	loop_170
	movleu	%icc,	%g4,	%g1
	fbu	%fcc0,	loop_171
	fmovrdne	%g2,	%f8,	%f24
loop_170:
	udiv	%l4,	0x025C,	%g6
	ble	%xcc,	loop_172
loop_171:
	fcmpd	%fcc0,	%f22,	%f30
	flush	%l7 + 0x5C
	fmovdcc	%icc,	%f29,	%f17
loop_172:
	fcmple32	%f20,	%f10,	%l5
	set	0x20, %o5
	ldda	[%l7 + %o5] 0xea,	%o6
	fmovrslez	%i1,	%f30,	%f22
	fornot1	%f10,	%f6,	%f4
	fpsub16s	%f14,	%f3,	%f23
	taddcctv	%l2,	%o2,	%i5
	fcmpne16	%f2,	%f10,	%o7
	flush	%l7 + 0x58
	tne	%xcc,	0x6
	subcc	%o3,	0x1667,	%i6
	brnz,a	%i2,	loop_173
	udivcc	%o5,	0x13DB,	%i4
	fbne,a	%fcc0,	loop_174
	movrlez	%g3,	%o0,	%o4
loop_173:
	edge8	%g7,	%g5,	%i3
	mulx	%l1,	%o1,	%i7
loop_174:
	ba,a,pt	%icc,	loop_175
	movcs	%icc,	%i0,	%l6
	sub	%l3,	0x05A8,	%g4
	fmovsg	%xcc,	%f6,	%f15
loop_175:
	nop
	set	0x12, %o6
	stba	%l0,	[%l7 + %o6] 0x89
	mova	%icc,	%g1,	%l4
	movcc	%icc,	%g6,	%l5
	set	0x7A, %o4
	ldsha	[%l7 + %o4] 0x10,	%o6
	addcc	%i1,	0x0832,	%l2
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x26] %asi,	%g2
	orncc	%i5,	%o7,	%o3
	tl	%icc,	0x6
	fmovrslz	%o2,	%f13,	%f11
	bg,pn	%icc,	loop_176
	xnorcc	%i6,	0x1AEF,	%i2
	fmovspos	%icc,	%f8,	%f5
	fpack32	%f26,	%f20,	%f26
loop_176:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o5,	0x09F2,	%g3
	array32	%i4,	%o4,	%g7
	movrlz	%o0,	%i3,	%g5
	edge32n	%o1,	%l1,	%i7
	orn	%l6,	%l3,	%g4
	fba	%fcc3,	loop_177
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i0,	%g1,	%l4
	set	0x7C, %l0
	lduha	[%l7 + %l0] 0x0c,	%g6
loop_177:
	movge	%xcc,	%l5,	%l0
	wr	%g0,	0x2b,	%asi
	stxa	%o6,	[%l7 + 0x60] %asi
	membar	#Sync
	add	%l7,	0x48,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%l2,	%g2
	fmovsl	%icc,	%f26,	%f15
	bleu,a	%icc,	loop_178
	bvc,pn	%icc,	loop_179
	edge32	%i5,	%o7,	%o3
	udivx	%i1,	0x02BE,	%i6
loop_178:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%o5
loop_179:
	edge8l	%i2,	%g3,	%o4
	ld	[%l7 + 0x20],	%f18
	taddcctv	%i4,	%o0,	%i3
	set	0x78, %i7
	sta	%f3,	[%l7 + %i7] 0x04
	fmovscs	%icc,	%f6,	%f1
	edge8ln	%g7,	%o1,	%l1
	add	%i7,	0x1D4D,	%g5
	sra	%l3,	0x0C,	%g4
	fbuge,a	%fcc1,	loop_180
	bvc	loop_181
	movpos	%icc,	%i0,	%g1
	fmovspos	%icc,	%f2,	%f11
loop_180:
	sth	%l6,	[%l7 + 0x36]
loop_181:
	nop
	set	0x20, %l1
	lduha	[%l7 + %l1] 0x18,	%g6
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x4C] %asi,	%l5
	udiv	%l4,	0x14E8,	%l0
	fbg	%fcc0,	loop_182
	ble,a	%icc,	loop_183
	movpos	%xcc,	%l2,	%g2
	smul	%i5,	%o6,	%o3
loop_182:
	fand	%f10,	%f8,	%f14
loop_183:
	movge	%icc,	%i1,	%o7
	st	%f28,	[%l7 + 0x18]
	edge32	%o2,	%i6,	%o5
	call	loop_184
	fmovdcc	%xcc,	%f12,	%f31
	edge32	%g3,	%i2,	%i4
	fnand	%f28,	%f16,	%f4
loop_184:
	movvc	%xcc,	%o0,	%i3
	call	loop_185
	fnot2	%f4,	%f4
	std	%g6,	[%l7 + 0x38]
	tne	%xcc,	0x4
loop_185:
	edge32n	%o4,	%o1,	%l1
	array8	%i7,	%l3,	%g4
	brz,a	%g5,	loop_186
	fmovdpos	%xcc,	%f8,	%f25
	movvs	%xcc,	%g1,	%i0
	udivx	%l6,	0x039F,	%g6
loop_186:
	fzero	%f22
	tsubcc	%l4,	0x0BFC,	%l0
	edge32ln	%l2,	%g2,	%l5
	fmovdne	%icc,	%f5,	%f24
	tcs	%icc,	0x5
	fbule	%fcc2,	loop_187
	bge,pt	%xcc,	loop_188
	subc	%i5,	0x08BD,	%o3
	movrne	%i1,	%o6,	%o2
loop_187:
	edge32	%o7,	%o5,	%g3
loop_188:
	xnor	%i6,	%i2,	%o0
	fxor	%f16,	%f0,	%f24
	movcs	%icc,	%i3,	%g7
	bleu,pt	%icc,	loop_189
	sth	%o4,	[%l7 + 0x72]
	orcc	%i4,	%o1,	%l1
	fbge,a	%fcc1,	loop_190
loop_189:
	fmuld8ulx16	%f27,	%f13,	%f18
	sdivx	%i7,	0x093C,	%g4
	bne,a	loop_191
loop_190:
	fmovdcs	%xcc,	%f24,	%f9
	movg	%icc,	%l3,	%g1
	fabss	%f18,	%f2
loop_191:
	fmovdvs	%icc,	%f7,	%f25
	fornot1	%f16,	%f24,	%f8
	bvs,a	loop_192
	fmovsle	%xcc,	%f28,	%f22
	fbue,a	%fcc3,	loop_193
	alignaddrl	%g5,	%l6,	%g6
loop_192:
	tleu	%icc,	0x7
	movgu	%xcc,	%i0,	%l0
loop_193:
	bvc,a,pt	%icc,	loop_194
	sra	%l2,	%l4,	%l5
	edge16l	%i5,	%o3,	%g2
	set	0x50, %o3
	stxa	%o6,	[%l7 + %o3] 0x0c
loop_194:
	edge32n	%o2,	%i1,	%o5
	call	loop_195
	fmovrse	%o7,	%f3,	%f0
	fsrc1s	%f30,	%f26
	set	0x60, %o2
	swapa	[%l7 + %o2] 0x80,	%g3
loop_195:
	fcmpd	%fcc1,	%f2,	%f2
	fpsub16	%f4,	%f28,	%f10
	sdivcc	%i2,	0x0F0C,	%o0
	fmovsgu	%icc,	%f30,	%f17
	tne	%xcc,	0x5
	tcs	%xcc,	0x1
	fandnot2s	%f1,	%f8,	%f28
	bneg	%xcc,	loop_196
	add	%i3,	%g7,	%i6
	tneg	%icc,	0x3
	set	0x38, %g1
	ldxa	[%l7 + %g1] 0x88,	%o4
loop_196:
	fnegd	%f4,	%f28
	andn	%o1,	%l1,	%i7
	taddcctv	%g4,	0x1A58,	%l3
	tsubcc	%i4,	%g1,	%g5
	bpos,a,pn	%xcc,	loop_197
	ta	%xcc,	0x7
	srl	%l6,	%i0,	%l0
	fmovrdgz	%g6,	%f30,	%f4
loop_197:
	sdivx	%l2,	0x0715,	%l4
	taddcctv	%l5,	0x18E4,	%i5
	array16	%o3,	%g2,	%o2
	bpos,a	%icc,	loop_198
	udiv	%i1,	0x149C,	%o5
	set	0x34, %l5
	lduwa	[%l7 + %l5] 0x15,	%o7
loop_198:
	tg	%icc,	0x1
	fmul8x16au	%f10,	%f5,	%f4
	xorcc	%o6,	0x0AFD,	%g3
	movrgez	%o0,	0x3C9,	%i3
	fnot2s	%f24,	%f14
	swap	[%l7 + 0x34],	%g7
	set	0x2C, %l4
	swapa	[%l7 + %l4] 0x89,	%i2
	tl	%icc,	0x4
	sdivx	%o4,	0x1E5D,	%o1
	fblg,a	%fcc2,	loop_199
	smul	%i6,	%l1,	%i7
	set	0x1C, %g5
	lduwa	[%l7 + %g5] 0x19,	%l3
loop_199:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f17,	[%l7 + 0x78] %asi
	te	%xcc,	0x7
	fbn,a	%fcc2,	loop_200
	fmovsle	%xcc,	%f17,	%f7
	srax	%i4,	0x1D,	%g4
	udiv	%g1,	0x0F10,	%l6
loop_200:
	xor	%i0,	%g5,	%g6
	fmovdvs	%icc,	%f22,	%f10
	fxor	%f12,	%f16,	%f30
	andncc	%l2,	%l4,	%l0
	movrgz	%i5,	%o3,	%g2
	alignaddrl	%o2,	%l5,	%i1
	sethi	0x0C2E,	%o5
	ta	%icc,	0x7
	fcmpgt16	%f22,	%f16,	%o6
	fmovsgu	%icc,	%f4,	%f11
	tcc	%icc,	0x1
	alignaddrl	%o7,	%g3,	%i3
	tl	%icc,	0x2
	tcs	%xcc,	0x3
	sllx	%g7,	%o0,	%i2
	fbne	%fcc2,	loop_201
	stbar
	fcmpeq16	%f16,	%f2,	%o4
	subccc	%o1,	0x0DA1,	%i6
loop_201:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f0,	[%l7 + 0x18] %asi
	movg	%icc,	%l1,	%l3
	fones	%f22
	movcc	%xcc,	%i7,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x10, %g3
	ldda	[%l7 + %g3] 0x10,	%g4
	sra	%g1,	0x09,	%l6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%i0
	fpackfix	%f18,	%f23
	tvs	%icc,	0x0
	taddcc	%l2,	%l4,	%l0
	wr	%g0,	0xe3,	%asi
	stwa	%i5,	[%l7 + 0x48] %asi
	membar	#Sync
	array16	%o3,	%g6,	%g2
	fmovdl	%xcc,	%f18,	%f3
	swap	[%l7 + 0x4C],	%l5
	ldd	[%l7 + 0x70],	%o2
	srax	%i1,	%o6,	%o7
	nop
	set	0x70, %g2
	ldx	[%l7 + %g2],	%g3
	fxor	%f2,	%f26,	%f12
	edge16l	%i3,	%g7,	%o5
	st	%f26,	[%l7 + 0x20]
	mova	%xcc,	%o0,	%i2
	prefetch	[%l7 + 0x7C],	 0x0
	fmovrsne	%o1,	%f1,	%f23
	stb	%i6,	[%l7 + 0x48]
	fandnot1s	%f11,	%f18,	%f16
	fcmple32	%f0,	%f8,	%o4
	edge8n	%l1,	%i7,	%l3
	movle	%xcc,	%g4,	%i4
	movcc	%xcc,	%l6,	%g1
	xnor	%i0,	%g5,	%l2
	and	%l4,	%l0,	%o3
	fbg	%fcc1,	loop_202
	fpadd32s	%f30,	%f12,	%f5
	tl	%xcc,	0x0
	orncc	%g6,	0x0F24,	%g2
loop_202:
	fcmple16	%f22,	%f8,	%l5
	addcc	%o2,	0x0AA4,	%i5
	edge8n	%o6,	%o7,	%i1
	brgz	%i3,	loop_203
	fmovrdne	%g3,	%f12,	%f18
	tsubcctv	%g7,	%o0,	%i2
	srax	%o1,	0x14,	%i6
loop_203:
	bne,a	loop_204
	orcc	%o5,	0x156B,	%o4
	movgu	%xcc,	%l1,	%l3
	sub	%i7,	%g4,	%l6
loop_204:
	umulcc	%i4,	%i0,	%g1
	movcs	%icc,	%g5,	%l4
	fbuge,a	%fcc3,	loop_205
	sir	0x04CF
	movvc	%xcc,	%l2,	%l0
	movleu	%xcc,	%g6,	%o3
loop_205:
	xorcc	%g2,	0x0D78,	%l5
	edge16	%i5,	%o6,	%o7
	fbuge,a	%fcc3,	loop_206
	movl	%xcc,	%i1,	%o2
	fmuld8sux16	%f11,	%f19,	%f14
	sll	%g3,	0x10,	%i3
loop_206:
	fmovdneg	%icc,	%f0,	%f27
	fbul,a	%fcc0,	loop_207
	fba,a	%fcc2,	loop_208
	edge8ln	%g7,	%i2,	%o0
	sethi	0x09CD,	%i6
loop_207:
	edge8l	%o5,	%o1,	%l1
loop_208:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%l2,	[%l7 + 0x28]
	andcc	%o4,	0x12B5,	%i7
	fcmpeq32	%f24,	%f8,	%l6
	brz	%g4,	loop_209
	edge16n	%i4,	%g1,	%i0
	fmul8x16au	%f18,	%f12,	%f2
	ldsh	[%l7 + 0x34],	%l4
loop_209:
	movcc	%icc,	%g5,	%l2
	nop
	set	0x2C, %l3
	ldstub	[%l7 + %l3],	%l0
	fornot2s	%f18,	%f15,	%f24
	movrlz	%g6,	%g2,	%o3
	fnot2s	%f0,	%f8
	fcmpgt16	%f28,	%f0,	%l5
	flush	%l7 + 0x30
	tgu	%xcc,	0x1
	addcc	%o6,	%o7,	%i5
	fxnor	%f12,	%f10,	%f16
	addcc	%i1,	0x1CB4,	%g3
	fmovrdne	%o2,	%f12,	%f20
	set	0x53, %i0
	lduba	[%l7 + %i0] 0x18,	%i3
	fnand	%f26,	%f4,	%f2
	edge16l	%i2,	%g7,	%i6
	movneg	%icc,	%o0,	%o5
	bleu,a,pn	%xcc,	loop_210
	tg	%icc,	0x1
	tcc	%icc,	0x4
	movrne	%o1,	0x0EE,	%l1
loop_210:
	fbul	%fcc3,	loop_211
	fabsd	%f12,	%f14
	fsrc2s	%f19,	%f7
	tcs	%icc,	0x1
loop_211:
	andcc	%l3,	0x0216,	%i7
	movleu	%icc,	%o4,	%g4
	taddcc	%l6,	%g1,	%i4
	fbu,a	%fcc0,	loop_212
	srax	%i0,	%g5,	%l2
	subc	%l0,	0x0898,	%g6
	fmovrde	%g2,	%f24,	%f2
loop_212:
	st	%f28,	[%l7 + 0x1C]
	fmovrsgez	%l4,	%f5,	%f24
	fmovd	%f30,	%f24
	movvs	%xcc,	%l5,	%o3
	edge32n	%o6,	%o7,	%i5
	be,a,pn	%icc,	loop_213
	fbule	%fcc3,	loop_214
	bshuffle	%f26,	%f16,	%f28
	xorcc	%i1,	%o2,	%i3
loop_213:
	movvs	%icc,	%i2,	%g3
loop_214:
	bge,a	loop_215
	orncc	%g7,	%o0,	%o5
	fmuld8ulx16	%f6,	%f11,	%f10
	set	0x20, %o0
	lduwa	[%l7 + %o0] 0x14,	%o1
loop_215:
	udivcc	%i6,	0x1378,	%l3
	set	0x46, %g4
	ldstuba	[%l7 + %g4] 0x18,	%i7
	bgu,a,pt	%xcc,	loop_216
	udivx	%o4,	0x1F31,	%g4
	movgu	%icc,	%l1,	%l6
	bne	%xcc,	loop_217
loop_216:
	fmovse	%xcc,	%f8,	%f29
	mulx	%i4,	%g1,	%g5
	subcc	%i0,	0x1A0F,	%l2
loop_217:
	nop
	wr	%g0,	0x04,	%asi
	stha	%g6,	[%l7 + 0x2A] %asi
	bcs	loop_218
	tl	%icc,	0x7
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%l0
loop_218:
	xorcc	%g2,	%l5,	%o3
	fmovsge	%icc,	%f23,	%f30
	std	%f26,	[%l7 + 0x68]
	movl	%xcc,	%o6,	%o7
	tneg	%icc,	0x4
	movvc	%icc,	%l4,	%i5
	brgez,a	%o2,	loop_219
	fsrc2s	%f18,	%f6
	std	%f4,	[%l7 + 0x60]
	movrlez	%i1,	0x336,	%i2
loop_219:
	xnorcc	%i3,	0x1020,	%g7
	fba	%fcc2,	loop_220
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o0,	%g3,	%o5
	bne	loop_221
loop_220:
	nop
	setx	loop_222,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%o1,	0x1D4,	%i6
	tneg	%xcc,	0x0
loop_221:
	movneg	%icc,	%i7,	%l3
loop_222:
	nop
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o4
	edge8ln	%g4,	%l6,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l1,	%g5,	%g1
	fmovdn	%icc,	%f17,	%f6
	and	%i0,	0x084B,	%l2
	alignaddrl	%l0,	%g6,	%l5
	andcc	%o3,	%g2,	%o6
	ldd	[%l7 + 0x60],	%l4
	subcc	%o7,	%o2,	%i5
	movre	%i2,	0x1D2,	%i3
	fcmpgt32	%f2,	%f4,	%i1
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x14,	%g6
	mulx	%g3,	%o0,	%o1
	sir	0x00A1
	fpadd16	%f18,	%f28,	%f20
	bg,pt	%icc,	loop_223
	andncc	%i6,	%o5,	%i7
	addc	%o4,	0x0D27,	%l3
	ldd	[%l7 + 0x08],	%f20
loop_223:
	fpackfix	%f4,	%f6
	fpadd16s	%f24,	%f31,	%f31
	tneg	%icc,	0x2
	fzeros	%f9
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x20] %asi,	%g4
	brlz,a	%i4,	loop_224
	movvc	%xcc,	%l1,	%g5
	add	%l6,	%g1,	%i0
	tneg	%icc,	0x6
loop_224:
	sra	%l2,	%g6,	%l0
	movle	%xcc,	%o3,	%l5
	sub	%o6,	0x032D,	%l4
	popc	%o7,	%o2
	movle	%xcc,	%i5,	%i2
	fzeros	%f0
	fabss	%f30,	%f23
	tn	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g2,	0x21D,	%i1
	orncc	%i3,	0x0FBF,	%g3
	fmul8ulx16	%f8,	%f10,	%f28
	set	0x60, %i1
	prefetcha	[%l7 + %i1] 0x89,	 0x1
	edge16	%o0,	%o1,	%o5
	taddcc	%i7,	0x0364,	%o4
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x34] %asi,	%l3
	fnegs	%f30,	%f18
	fcmpeq32	%f28,	%f0,	%i6
	addcc	%i4,	%l1,	%g4
	xnorcc	%g5,	%l6,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l2,	%g1,	%l0
	fcmpeq32	%f18,	%f0,	%g6
	move	%xcc,	%o3,	%o6
	xorcc	%l4,	%l5,	%o7
	tcs	%xcc,	0x4
	tg	%icc,	0x7
	movrlez	%i5,	%o2,	%g2
	tcs	%icc,	0x4
	ldsh	[%l7 + 0x2E],	%i2
	tn	%icc,	0x3
	tsubcctv	%i3,	%g3,	%g7
	mova	%xcc,	%o0,	%o1
	popc	0x0A1A,	%o5
	fabsd	%f16,	%f14
	subcc	%i1,	0x115C,	%o4
	mova	%icc,	%i7,	%i6
	addc	%l3,	%i4,	%g4
	edge16l	%l1,	%g5,	%l6
	te	%icc,	0x5
	srlx	%l2,	%i0,	%g1
	ba	loop_225
	movrlz	%l0,	%o3,	%g6
	fmul8x16	%f10,	%f2,	%f8
	movrgz	%l4,	0x10C,	%l5
loop_225:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x56] %asi,	%o6
	fmovdleu	%xcc,	%f21,	%f30
	fbuge	%fcc1,	loop_226
	and	%o7,	%o2,	%g2
	addccc	%i5,	0x1ABF,	%i2
	movre	%i3,	0x316,	%g3
loop_226:
	fbule,a	%fcc1,	loop_227
	fbe,a	%fcc1,	loop_228
	smulcc	%g7,	%o0,	%o1
	tpos	%xcc,	0x7
loop_227:
	siam	0x1
loop_228:
	nop
	set	0x3A, %g6
	stba	%o5,	[%l7 + %g6] 0x23
	membar	#Sync
	movleu	%xcc,	%i1,	%o4
	edge8n	%i7,	%l3,	%i4
	edge8	%g4,	%l1,	%g5
	set	0x10, %i5
	ldswa	[%l7 + %i5] 0x10,	%i6
	bge,pn	%icc,	loop_229
	tneg	%icc,	0x5
	bl,pn	%xcc,	loop_230
	stbar
loop_229:
	fmovde	%xcc,	%f24,	%f11
	edge16	%l6,	%l2,	%i0
loop_230:
	ba,pn	%icc,	loop_231
	membar	0x68
	fmovrsgz	%l0,	%f2,	%f2
	tvc	%xcc,	0x4
loop_231:
	bne,pn	%xcc,	loop_232
	addcc	%g1,	%o3,	%l4
	sra	%g6,	0x18,	%o6
	array16	%l5,	%o7,	%g2
loop_232:
	add	%i5,	%o2,	%i3
	sir	0x06E7
	udivcc	%i2,	0x0DA1,	%g7
	nop
	setx loop_233, %l0, %l1
	jmpl %l1, %o0
	sdivx	%g3,	0x1D7C,	%o1
	edge8ln	%o5,	%o4,	%i1
	udivx	%i7,	0x1800,	%l3
loop_233:
	tvs	%xcc,	0x4
	brz	%i4,	loop_234
	ble,pt	%icc,	loop_235
	movrgez	%l1,	%g5,	%i6
	movg	%icc,	%g4,	%l2
loop_234:
	array8	%i0,	%l6,	%l0
loop_235:
	bvc,pt	%icc,	loop_236
	fbge	%fcc0,	loop_237
	orn	%g1,	%o3,	%l4
	movleu	%icc,	%o6,	%g6
loop_236:
	tg	%icc,	0x5
loop_237:
	movg	%xcc,	%o7,	%g2
	fpack32	%f24,	%f26,	%f18
	bvs,pn	%xcc,	loop_238
	and	%i5,	%o2,	%l5
	movrgez	%i3,	0x043,	%g7
	fbo,a	%fcc1,	loop_239
loop_238:
	fmovdcs	%icc,	%f9,	%f6
	mova	%icc,	%i2,	%g3
	prefetch	[%l7 + 0x48],	 0x3
loop_239:
	fcmpes	%fcc2,	%f31,	%f3
	stx	%o0,	[%l7 + 0x18]
	tpos	%icc,	0x2
	fmovrdgez	%o5,	%f28,	%f20
	fsrc1s	%f18,	%f30
	fmovdcs	%xcc,	%f28,	%f1
	array8	%o4,	%o1,	%i7
	movge	%icc,	%l3,	%i1
	set	0x7F, %i2
	stba	%l1,	[%l7 + %i2] 0x81
	std	%f4,	[%l7 + 0x38]
	movrne	%i4,	0x228,	%i6
	fcmple16	%f4,	%f10,	%g4
	ld	[%l7 + 0x3C],	%f0
	fcmpeq32	%f30,	%f22,	%l2
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	orncc	%i0,	%l6,	%g5
	array8	%l0,	%o3,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x4
	ble	%xcc,	loop_240
	sra	%o6,	0x18,	%g6
	sra	%o7,	0x06,	%g2
	edge16n	%i5,	%g1,	%l5
loop_240:
	and	%i3,	0x1412,	%o2
	fbl,a	%fcc0,	loop_241
	umulcc	%i2,	0x04AF,	%g3
	movge	%icc,	%g7,	%o5
	bg,a,pt	%icc,	loop_242
loop_241:
	udivx	%o4,	0x0B33,	%o1
	tvs	%icc,	0x4
	orncc	%i7,	0x0D59,	%l3
loop_242:
	andn	%o0,	%l1,	%i4
	mova	%xcc,	%i1,	%i6
	tsubcc	%g4,	%i0,	%l6
	umul	%l2,	0x0DF1,	%g5
	fbue,a	%fcc3,	loop_243
	bn	loop_244
	edge32	%l0,	%l4,	%o3
	mulx	%g6,	%o7,	%o6
loop_243:
	array16	%g2,	%g1,	%l5
loop_244:
	fone	%f8
	tne	%xcc,	0x3
	fbl,a	%fcc2,	loop_245
	brlez,a	%i3,	loop_246
	movpos	%xcc,	%o2,	%i2
	movvs	%xcc,	%i5,	%g3
loop_245:
	edge32n	%o5,	%g7,	%o1
loop_246:
	movleu	%icc,	%i7,	%o4
	sllx	%l3,	0x01,	%o0
	sra	%l1,	%i4,	%i1
	tg	%xcc,	0x5
	edge8n	%i6,	%g4,	%i0
	set	0x8, %o1
	stxa	%l2,	[%g0 + %o1] 0x21
	fnot1	%f26,	%f30
	sdivx	%l6,	0x1FFA,	%l0
	set	0x30, %g7
	ldxa	[%g0 + %g7] 0x58,	%l4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g5,	%o3
	alignaddrl	%o7,	%o6,	%g6
	nop
	setx	loop_247,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpsub16	%f12,	%f16,	%f18
	sir	0x11AB
	edge16l	%g1,	%g2,	%i3
loop_247:
	fbge,a	%fcc3,	loop_248
	fmovdpos	%icc,	%f15,	%f16
	set	0x24, %i3
	lduwa	[%l7 + %i3] 0x11,	%l5
loop_248:
	fbn,a	%fcc3,	loop_249
	tvs	%xcc,	0x7
	addcc	%i2,	0x0EF4,	%i5
	fmovdvc	%xcc,	%f23,	%f30
loop_249:
	movpos	%xcc,	%g3,	%o5
	sethi	0x0F11,	%g7
	alignaddr	%o2,	%i7,	%o4
	tsubcctv	%o1,	%l3,	%l1
	set	0x14, %i4
	sta	%f18,	[%l7 + %i4] 0x19
	tvc	%xcc,	0x0
	faligndata	%f20,	%f12,	%f2
	nop
	setx loop_250, %l0, %l1
	jmpl %l1, %i4
	edge8	%o0,	%i1,	%i6
	smul	%g4,	%l2,	%i0
	fbug,a	%fcc2,	loop_251
loop_250:
	ld	[%l7 + 0x18],	%f16
	srax	%l0,	%l6,	%l4
	ldstub	[%l7 + 0x74],	%o3
loop_251:
	membar	0x08
	tgu	%xcc,	0x1
	set	0x27, %o7
	stba	%o7,	[%l7 + %o7] 0xe2
	membar	#Sync
	fbuge	%fcc2,	loop_252
	taddcc	%g5,	0x0274,	%o6
	tcc	%icc,	0x5
	brgz	%g6,	loop_253
loop_252:
	edge8n	%g1,	%g2,	%i3
	prefetch	[%l7 + 0x4C],	 0x0
	sdiv	%i2,	0x1C53,	%l5
loop_253:
	fornot2	%f6,	%f26,	%f18
	movrlz	%i5,	%g3,	%o5
	fmovsneg	%icc,	%f9,	%f0
	nop
	set	0x50, %l2
	lduh	[%l7 + %l2],	%g7
	fandnot2	%f14,	%f16,	%f18
	movrgez	%o2,	0x081,	%i7
	bge,pt	%icc,	loop_254
	fmovda	%icc,	%f25,	%f12
	tl	%icc,	0x1
	movg	%icc,	%o1,	%l3
loop_254:
	nop
	set	0x64, %o5
	ldstub	[%l7 + %o5],	%l1
	array8	%o4,	%o0,	%i4
	udiv	%i1,	0x00F9,	%i6
	tgu	%icc,	0x2
	tpos	%icc,	0x3
	stbar
	umulcc	%l2,	%i0,	%g4
	set	0x0, %o6
	stxa	%l0,	[%g0 + %o6] 0x57
	tneg	%icc,	0x4
	fbue,a	%fcc3,	loop_255
	subccc	%l4,	0x07FF,	%o3
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x88
loop_255:
	tsubcc	%l6,	0x0CBC,	%g5
	fmovrslz	%o7,	%f1,	%f18
	fba,a	%fcc2,	loop_256
	mova	%icc,	%g6,	%o6
	fmovsleu	%icc,	%f3,	%f22
	tn	%icc,	0x2
loop_256:
	fmovrsgz	%g2,	%f1,	%f29
	sub	%g1,	0x1832,	%i2
	movcc	%icc,	%l5,	%i3
	subcc	%i5,	0x02F2,	%g3
	fbu	%fcc1,	loop_257
	fmovsn	%xcc,	%f22,	%f16
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%g7
loop_257:
	fcmpeq32	%f20,	%f2,	%o2
	bcs,pn	%icc,	loop_258
	fandnot2s	%f9,	%f31,	%f14
	srax	%i7,	0x1D,	%l3
	fbe,a	%fcc1,	loop_259
loop_258:
	mulscc	%l1,	%o1,	%o0
	fcmpeq16	%f6,	%f26,	%i4
	popc	%i1,	%i6
loop_259:
	udivcc	%o4,	0x1900,	%i0
	fmovrsne	%l2,	%f25,	%f19
	popc	0x0B03,	%l0
	bvs,a,pn	%icc,	loop_260
	tne	%icc,	0x1
	ldub	[%l7 + 0x3B],	%g4
	fsrc1	%f18,	%f18
loop_260:
	tvs	%xcc,	0x6
	edge32	%l4,	%l6,	%g5
	umulcc	%o7,	%o3,	%g6
	fbg,a	%fcc2,	loop_261
	xorcc	%o6,	%g1,	%i2
	fpack32	%f20,	%f2,	%f20
	nop
	set	0x28, %l0
	ldsh	[%l7 + %l0],	%l5
loop_261:
	edge8ln	%g2,	%i5,	%g3
	movle	%xcc,	%o5,	%g7
	subc	%o2,	0x1337,	%i3
	tneg	%xcc,	0x6
	nop
	setx	loop_262,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bvc,a	%icc,	loop_263
	ldstub	[%l7 + 0x59],	%i7
	edge8ln	%l1,	%o1,	%l3
loop_262:
	membar	0x6D
loop_263:
	fble,a	%fcc3,	loop_264
	fmovdle	%xcc,	%f0,	%f26
	orncc	%o0,	%i1,	%i4
	brlez,a	%o4,	loop_265
loop_264:
	sll	%i0,	0x18,	%i6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x0B] %asi,	%l2
loop_265:
	orn	%g4,	%l0,	%l6
	edge8	%l4,	%g5,	%o3
	move	%icc,	%g6,	%o6
	xnor	%g1,	0x1871,	%i2
	tgu	%icc,	0x1
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x14,	%f0
	tpos	%icc,	0x1
	set	0x58, %i7
	stda	%o6,	[%l7 + %i7] 0x19
	fnot1	%f4,	%f6
	and	%g2,	0x127F,	%l5
	fmovdpos	%icc,	%f26,	%f5
	tl	%xcc,	0x1
	srl	%i5,	%g3,	%o5
	fmuld8ulx16	%f2,	%f22,	%f14
	subcc	%g7,	%o2,	%i3
	sra	%l1,	%i7,	%l3
	movcs	%xcc,	%o1,	%i1
	edge16ln	%o0,	%i4,	%o4
	edge32ln	%i6,	%l2,	%g4
	tle	%xcc,	0x5
	sll	%i0,	%l6,	%l0
	tn	%xcc,	0x4
	edge16	%g5,	%o3,	%l4
	fbu	%fcc0,	loop_266
	edge32ln	%o6,	%g6,	%i2
	srlx	%g1,	0x1E,	%o7
	subc	%g2,	%l5,	%g3
loop_266:
	brgz,a	%o5,	loop_267
	bn,a,pn	%xcc,	loop_268
	fbo,a	%fcc2,	loop_269
	and	%g7,	%o2,	%i3
loop_267:
	bcs,a	%icc,	loop_270
loop_268:
	movpos	%xcc,	%i5,	%i7
loop_269:
	ldd	[%l7 + 0x68],	%f30
	be	%icc,	loop_271
loop_270:
	fmovsvs	%xcc,	%f19,	%f1
	lduh	[%l7 + 0x60],	%l3
	xnorcc	%o1,	%l1,	%i1
loop_271:
	add	%o0,	0x062A,	%i4
	ldx	[%l7 + 0x18],	%o4
	sir	0x0AD9
	fpadd16s	%f15,	%f24,	%f5
	movl	%icc,	%i6,	%g4
	edge8n	%l2,	%l6,	%i0
	tcs	%icc,	0x4
	mulx	%l0,	%o3,	%l4
	sdivx	%g5,	0x0B79,	%g6
	edge16l	%i2,	%g1,	%o6
	fba,a	%fcc3,	loop_272
	tneg	%icc,	0x5
	tcs	%icc,	0x4
	taddcc	%o7,	%l5,	%g3
loop_272:
	subccc	%g2,	%o5,	%g7
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x78] %asi,	%f2
	or	%i3,	%o2,	%i5
	or	%l3,	0x1EC3,	%i7
	fbl	%fcc1,	loop_273
	ba,a	%icc,	loop_274
	fmovscc	%xcc,	%f22,	%f14
	nop
	set	0x78, %l1
	ldx	[%l7 + %l1],	%l1
loop_273:
	prefetch	[%l7 + 0x1C],	 0x2
loop_274:
	movle	%icc,	%i1,	%o1
	sub	%i4,	0x1D2E,	%o4
	ba,a	loop_275
	fone	%f10
	ta	%xcc,	0x5
	fmovdpos	%xcc,	%f9,	%f20
loop_275:
	smulcc	%i6,	0x0736,	%g4
	brz	%o0,	loop_276
	te	%xcc,	0x3
	ble,pt	%xcc,	loop_277
	tn	%icc,	0x6
loop_276:
	sub	%l6,	0x1E69,	%l2
	fmovrsne	%i0,	%f13,	%f19
loop_277:
	fbg	%fcc1,	loop_278
	fandnot2	%f22,	%f10,	%f0
	call	loop_279
	tsubcc	%o3,	0x0CA5,	%l0
loop_278:
	bcs,a	%icc,	loop_280
	movrlz	%l4,	%g5,	%i2
loop_279:
	fcmpd	%fcc3,	%f14,	%f22
	movge	%xcc,	%g1,	%o6
loop_280:
	mulx	%o7,	%g6,	%g3
	edge8	%l5,	%o5,	%g2
	nop
	setx	loop_281,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdvc	%xcc,	%f1,	%f27
	sub	%g7,	%o2,	%i3
	edge8	%l3,	%i5,	%l1
loop_281:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x62] %asi,	%i1
	xnor	%o1,	0x10FB,	%i7
	smulcc	%o4,	%i4,	%i6
	set	0x60, %o2
	prefetcha	[%l7 + %o2] 0x0c,	 0x1
	movrlz	%o0,	0x3A7,	%l6
	tcc	%icc,	0x2
	fpadd16	%f4,	%f4,	%f24
	fandnot2	%f8,	%f14,	%f4
	set	0x18, %g1
	sta	%f22,	[%l7 + %g1] 0x89
	popc	0x1892,	%i0
	siam	0x5
	movvs	%xcc,	%o3,	%l2
	tsubcc	%l4,	0x1A42,	%l0
	set	0x52, %o3
	stha	%i2,	[%l7 + %o3] 0x2b
	membar	#Sync
	tl	%icc,	0x1
	mova	%xcc,	%g1,	%o6
	tle	%xcc,	0x3
	tne	%icc,	0x5
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%f18
	bvs,pt	%xcc,	loop_282
	fandnot2	%f20,	%f20,	%f6
	movvs	%xcc,	%o7,	%g6
	xnorcc	%g3,	%l5,	%g5
loop_282:
	movre	%o5,	%g7,	%o2
	wr	%g0,	0x18,	%asi
	stda	%i2,	[%l7 + 0x68] %asi
	fmovsneg	%xcc,	%f0,	%f1
	movcs	%icc,	%l3,	%i5
	udivcc	%l1,	0x15DD,	%g2
	fbn,a	%fcc1,	loop_283
	bge,a	loop_284
	fmovrdlz	%o1,	%f16,	%f6
	fmovrslz	%i7,	%f12,	%f21
loop_283:
	addccc	%i1,	0x0C8F,	%i4
loop_284:
	tcs	%icc,	0x7
	fmovdl	%icc,	%f0,	%f17
	movcc	%xcc,	%o4,	%g4
	bneg,pn	%xcc,	loop_285
	siam	0x1
	sub	%i6,	0x0A3F,	%l6
	prefetch	[%l7 + 0x7C],	 0x2
loop_285:
	bg,a,pn	%icc,	loop_286
	ldd	[%l7 + 0x68],	%f4
	udiv	%o0,	0x0B5A,	%o3
	fnand	%f20,	%f26,	%f24
loop_286:
	fxnors	%f16,	%f1,	%f28
	movcs	%xcc,	%i0,	%l4
	andcc	%l0,	%l2,	%g1
	te	%icc,	0x7
	fcmps	%fcc2,	%f22,	%f7
	movrgez	%o6,	%i2,	%g6
	tne	%icc,	0x2
	srax	%o7,	%g3,	%l5
	fmovsl	%xcc,	%f20,	%f18
	edge16ln	%o5,	%g5,	%g7
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x50] %asi,	%i3
	tpos	%xcc,	0x1
	movre	%o2,	%i5,	%l1
	fmovdvs	%icc,	%f3,	%f1
	fmovsg	%icc,	%f19,	%f30
	fmovdleu	%xcc,	%f23,	%f18
	sdivcc	%g2,	0x00C6,	%o1
	array16	%l3,	%i7,	%i1
	orncc	%i4,	0x0A3D,	%o4
	bge	%xcc,	loop_287
	subccc	%i6,	0x07D0,	%l6
	edge16ln	%g4,	%o3,	%i0
	nop
	set	0x28, %g5
	ldd	[%l7 + %g5],	%o0
loop_287:
	fpsub32s	%f0,	%f27,	%f4
	umulcc	%l4,	0x1D77,	%l0
	fbule	%fcc0,	loop_288
	xor	%l2,	%g1,	%i2
	movvc	%xcc,	%g6,	%o6
	stx	%g3,	[%l7 + 0x50]
loop_288:
	movrne	%o7,	%l5,	%g5
	movrgez	%o5,	0x064,	%i3
	stx	%g7,	[%l7 + 0x18]
	std	%o2,	[%l7 + 0x08]
	bvc	loop_289
	popc	%i5,	%l1
	ldd	[%l7 + 0x08],	%f26
	fbu,a	%fcc0,	loop_290
loop_289:
	fcmpne16	%f12,	%f24,	%o1
	wr	%g0,	0x23,	%asi
	stha	%g2,	[%l7 + 0x4E] %asi
	membar	#Sync
loop_290:
	stb	%l3,	[%l7 + 0x63]
	tsubcc	%i1,	0x0D6E,	%i7
	set	0x49, %g3
	ldsba	[%l7 + %g3] 0x19,	%i4
	bleu,a	loop_291
	bcs,a,pt	%icc,	loop_292
	udivcc	%i6,	0x15D6,	%o4
	addccc	%g4,	0x0321,	%l6
loop_291:
	nop
	add	%l7,	0x64,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%i0,	%o3
loop_292:
	smulcc	%o0,	%l4,	%l2
	fxors	%f16,	%f8,	%f16
	edge8l	%l0,	%i2,	%g6
	edge16n	%o6,	%g1,	%g3
	udivx	%l5,	0x069C,	%o7
	edge16ln	%o5,	%i3,	%g7
	ld	[%l7 + 0x20],	%f20
	faligndata	%f10,	%f4,	%f26
	ldd	[%l7 + 0x48],	%f2
	fnot2	%f2,	%f28
	tsubcctv	%o2,	0x03A7,	%i5
	st	%f21,	[%l7 + 0x78]
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fcmpgt32	%f4,	%f6,	%g5
	movrgz	%o1,	%l1,	%l3
	edge8ln	%i1,	%i7,	%i4
	fornot2s	%f13,	%f27,	%f6
	array8	%i6,	%o4,	%g4
	smulcc	%g2,	%l6,	%o3
	fmovrsgez	%i0,	%f12,	%f11
	tpos	%xcc,	0x7
	srl	%o0,	%l4,	%l0
	nop
	setx	loop_293,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%l2,	0x09EB,	%i2
	fmovrsgez	%o6,	%f22,	%f17
	bge	loop_294
loop_293:
	tvc	%icc,	0x3
	movle	%xcc,	%g6,	%g1
	tvs	%xcc,	0x7
loop_294:
	bl,a,pt	%icc,	loop_295
	tcs	%icc,	0x6
	fcmpes	%fcc0,	%f25,	%f9
	fbue	%fcc3,	loop_296
loop_295:
	membar	0x35
	mulx	%g3,	%l5,	%o7
	fmovrdgz	%i3,	%f4,	%f14
loop_296:
	fzero	%f2
	ta	%icc,	0x4
	sdivx	%o5,	0x0F60,	%o2
	set	0x30, %l4
	lduwa	[%l7 + %l4] 0x89,	%i5
	fmovde	%icc,	%f14,	%f12
	fmovdcs	%icc,	%f17,	%f27
	set	0x38, %l3
	stha	%g7,	[%l7 + %l3] 0xe3
	membar	#Sync
	add	%o1,	0x11CF,	%g5
	set	0x30, %i0
	ldsha	[%l7 + %i0] 0x10,	%l3
	fnot1s	%f11,	%f21
	fmovsleu	%icc,	%f18,	%f0
	wr	%g0,	0x04,	%asi
	sta	%f23,	[%l7 + 0x08] %asi
	fbl,a	%fcc2,	loop_297
	pdist	%f28,	%f20,	%f8
	edge16	%l1,	%i7,	%i1
	st	%f17,	[%l7 + 0x18]
loop_297:
	movrlez	%i4,	%i6,	%g4
	fmovsne	%icc,	%f13,	%f5
	popc	0x149A,	%o4
	bvc	%xcc,	loop_298
	fmovsgu	%icc,	%f25,	%f18
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x18
loop_298:
	sllx	%l6,	%o3,	%i0
	addcc	%g2,	0x167E,	%l4
	bn,pt	%xcc,	loop_299
	fzero	%f20
	movpos	%xcc,	%o0,	%l2
	movge	%xcc,	%l0,	%o6
loop_299:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x44] %asi,	%g6
	stx	%g1,	[%l7 + 0x38]
	movvc	%icc,	%g3,	%i2
	srax	%l5,	0x08,	%i3
	fmovrslez	%o5,	%f7,	%f25
	fpadd32	%f16,	%f28,	%f16
	addcc	%o7,	0x117C,	%i5
	movne	%icc,	%o2,	%g7
	brlez,a	%o1,	loop_300
	ldx	[%l7 + 0x48],	%l3
	sir	0x08E7
	fblg,a	%fcc0,	loop_301
loop_300:
	edge8n	%l1,	%i7,	%g5
	movrlz	%i1,	0x13D,	%i6
	st	%f29,	[%l7 + 0x4C]
loop_301:
	edge16	%i4,	%g4,	%o4
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fnands	%f0,	%f2,	%f27
	edge32	%o3,	%l6,	%i0
	fmovsleu	%xcc,	%f2,	%f12
	movre	%g2,	%o0,	%l2
	andn	%l4,	%l0,	%g6
	nop
	set	0x68, %o0
	std	%g0,	[%l7 + %o0]
	fmovscs	%xcc,	%f27,	%f31
	brgez,a	%o6,	loop_302
	fba	%fcc2,	loop_303
	edge32ln	%g3,	%i2,	%i3
	smul	%o5,	0x141C,	%o7
loop_302:
	fabss	%f15,	%f1
loop_303:
	bvc,a,pn	%icc,	loop_304
	sethi	0x16C6,	%i5
	be,pn	%xcc,	loop_305
	std	%l4,	[%l7 + 0x50]
loop_304:
	fcmpne32	%f30,	%f6,	%o2
	edge16n	%g7,	%l3,	%o1
loop_305:
	udivcc	%l1,	0x0457,	%g5
	addcc	%i1,	%i7,	%i4
	sll	%i6,	%g4,	%o3
	tvc	%icc,	0x1
	subc	%l6,	0x095C,	%o4
	array32	%g2,	%i0,	%o0
	fba,a	%fcc3,	loop_306
	fmovrdne	%l2,	%f6,	%f20
	fbo,a	%fcc0,	loop_307
	tvs	%xcc,	0x2
loop_306:
	fmuld8ulx16	%f19,	%f27,	%f12
	tpos	%xcc,	0x1
loop_307:
	fpsub32	%f20,	%f28,	%f14
	udivcc	%l4,	0x14BF,	%l0
	movleu	%xcc,	%g6,	%g1
	te	%icc,	0x0
	and	%g3,	0x1582,	%o6
	srlx	%i3,	0x18,	%i2
	fmovdg	%xcc,	%f6,	%f27
	fones	%f9
	movgu	%xcc,	%o7,	%o5
	taddcctv	%l5,	0x0ED2,	%o2
	movrlez	%g7,	0x0CC,	%l3
	edge32	%o1,	%l1,	%g5
	tcc	%icc,	0x5
	fmovrsgz	%i5,	%f1,	%f16
	edge32l	%i1,	%i7,	%i6
	edge32n	%g4,	%o3,	%i4
	set	0x64, %i6
	lduwa	[%l7 + %i6] 0x15,	%l6
	movcs	%xcc,	%g2,	%i0
	subcc	%o4,	0x0921,	%l2
	sdivcc	%o0,	0x174D,	%l4
	xor	%g6,	0x0202,	%g1
	brz,a	%l0,	loop_308
	subccc	%o6,	0x1104,	%i3
	tle	%xcc,	0x6
	fmovs	%f20,	%f20
loop_308:
	sdiv	%i2,	0x0091,	%o7
	edge8l	%o5,	%l5,	%o2
	fmovsle	%xcc,	%f2,	%f4
	nop
	setx	loop_309,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%g7,	%l3,	%g3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%l1
loop_309:
	subccc	%o1,	0x12F7,	%g5
	wr	%g0,	0x80,	%asi
	stda	%i0,	[%l7 + 0x50] %asi
	subccc	%i5,	0x1895,	%i6
	addc	%g4,	0x0A0C,	%o3
	movl	%icc,	%i7,	%l6
	and	%i4,	%i0,	%o4
	fxnors	%f27,	%f15,	%f2
	fcmped	%fcc0,	%f10,	%f18
	or	%l2,	%o0,	%g2
	fmuld8ulx16	%f16,	%f18,	%f0
	bcc,pn	%xcc,	loop_310
	alignaddrl	%l4,	%g1,	%l0
	pdist	%f14,	%f20,	%f2
	edge16ln	%g6,	%o6,	%i3
loop_310:
	nop
	set	0x50, %i1
	ldstuba	[%l7 + %i1] 0x04,	%o7
	fpsub32	%f14,	%f18,	%f8
	fmovde	%icc,	%f5,	%f13
	fabsd	%f30,	%f4
	srlx	%i2,	%l5,	%o2
	array8	%o5,	%l3,	%g3
	fbue,a	%fcc1,	loop_311
	fbue	%fcc0,	loop_312
	subc	%g7,	0x0A94,	%l1
	fcmps	%fcc2,	%f31,	%f9
loop_311:
	subccc	%o1,	0x14B5,	%g5
loop_312:
	stx	%i5,	[%l7 + 0x68]
	movcs	%xcc,	%i1,	%i6
	edge16l	%o3,	%i7,	%g4
	call	loop_313
	subcc	%l6,	0x0430,	%i4
	movrlez	%i0,	0x3F6,	%l2
	alignaddrl	%o0,	%g2,	%l4
loop_313:
	movneg	%xcc,	%o4,	%g1
	tle	%xcc,	0x3
	fmovdne	%icc,	%f7,	%f11
	fsrc2s	%f22,	%f3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%l0
	fpsub32s	%f17,	%f8,	%f26
	sth	%i3,	[%l7 + 0x2C]
	lduh	[%l7 + 0x0C],	%o7
	subccc	%o6,	0x0FDF,	%i2
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x28] %asi,	%o2
	lduw	[%l7 + 0x2C],	%l5
	wr	%g0,	0x80,	%asi
	stwa	%o5,	[%l7 + 0x30] %asi
	array32	%g3,	%l3,	%g7
	st	%f14,	[%l7 + 0x20]
	edge16l	%o1,	%l1,	%i5
	umulcc	%i1,	0x12FC,	%i6
	tgu	%icc,	0x3
	array8	%o3,	%i7,	%g5
	fxnors	%f17,	%f20,	%f3
	movl	%xcc,	%g4,	%i4
	tvc	%xcc,	0x6
	edge32	%l6,	%i0,	%l2
	movrlz	%g2,	%o0,	%l4
	ta	%icc,	0x4
	edge32	%g1,	%g6,	%l0
	xorcc	%i3,	%o7,	%o4
	edge8ln	%o6,	%o2,	%i2
	sdivcc	%o5,	0x063D,	%g3
	edge8	%l3,	%g7,	%l5
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x32] %asi,	%l1
	sllx	%o1,	0x1D,	%i1
	sra	%i5,	0x19,	%o3
	addcc	%i7,	%i6,	%g4
	movvc	%xcc,	%g5,	%i4
	set	0x2C, %g6
	stwa	%i0,	[%l7 + %g6] 0xe2
	membar	#Sync
	edge16l	%l2,	%g2,	%l6
	fxnor	%f16,	%f2,	%f22
	udiv	%l4,	0x092B,	%g1
	sllx	%g6,	%o0,	%i3
	ba,a	%xcc,	loop_314
	tn	%icc,	0x0
	array16	%o7,	%o4,	%l0
	alignaddr	%o2,	%i2,	%o5
loop_314:
	fmovrsne	%o6,	%f0,	%f23
	mulx	%l3,	%g3,	%g7
	fba,a	%fcc1,	loop_315
	fmul8x16	%f29,	%f8,	%f16
	bg,pn	%icc,	loop_316
	addc	%l5,	%l1,	%o1
loop_315:
	movle	%icc,	%i1,	%o3
	fmovrslez	%i5,	%f21,	%f6
loop_316:
	edge16ln	%i6,	%g4,	%i7
	wr	%g0,	0xe2,	%asi
	stha	%i4,	[%l7 + 0x4E] %asi
	membar	#Sync
	edge8l	%g5,	%l2,	%i0
	orcc	%l6,	%l4,	%g1
	fmovsle	%xcc,	%f25,	%f27
	flush	%l7 + 0x50
	edge16ln	%g2,	%g6,	%o0
	fnegs	%f7,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%o7,	loop_317
	tn	%xcc,	0x6
	xor	%i3,	0x1513,	%o4
	lduh	[%l7 + 0x34],	%o2
loop_317:
	te	%icc,	0x0
	movge	%xcc,	%l0,	%o5
	nop
	set	0x1E, %g4
	ldub	[%l7 + %g4],	%o6
	bgu,a,pt	%xcc,	loop_318
	ba,pn	%icc,	loop_319
	sdivx	%l3,	0x1588,	%i2
	movrgz	%g7,	0x2C3,	%g3
loop_318:
	tleu	%xcc,	0x0
loop_319:
	sdiv	%l5,	0x0682,	%o1
	set	0x1C, %i2
	lduha	[%l7 + %i2] 0x80,	%i1
	orncc	%o3,	%i5,	%i6
	taddcctv	%l1,	%g4,	%i4
	srl	%g5,	%l2,	%i7
	fbul,a	%fcc2,	loop_320
	fornot1	%f12,	%f20,	%f30
	movneg	%xcc,	%i0,	%l6
	ta	%xcc,	0x6
loop_320:
	array8	%l4,	%g1,	%g2
	edge8	%g6,	%o7,	%o0
	tneg	%xcc,	0x7
	fbul,a	%fcc3,	loop_321
	movre	%i3,	0x383,	%o2
	popc	%l0,	%o4
	movleu	%icc,	%o5,	%o6
loop_321:
	fmovdleu	%icc,	%f19,	%f16
	fmovrdne	%i2,	%f10,	%f12
	fbo,a	%fcc2,	loop_322
	fbn,a	%fcc3,	loop_323
	movcc	%icc,	%g7,	%g3
	sdivcc	%l3,	0x1730,	%o1
loop_322:
	taddcctv	%l5,	%i1,	%o3
loop_323:
	tvc	%xcc,	0x7
	bge,a	loop_324
	fmuld8ulx16	%f3,	%f16,	%f26
	fmovdne	%icc,	%f21,	%f28
	be,a	loop_325
loop_324:
	movl	%xcc,	%i5,	%l1
	edge8ln	%i6,	%i4,	%g5
	ble,pt	%icc,	loop_326
loop_325:
	movrlz	%g4,	%i7,	%l2
	srl	%l6,	%i0,	%g1
	sdivx	%l4,	0x06EF,	%g6
loop_326:
	tcs	%xcc,	0x1
	sth	%g2,	[%l7 + 0x28]
	fpadd32	%f4,	%f6,	%f22
	fmovsg	%icc,	%f29,	%f12
	tvs	%xcc,	0x4
	fble,a	%fcc1,	loop_327
	fmovscs	%icc,	%f21,	%f27
	fxors	%f5,	%f31,	%f16
	tleu	%xcc,	0x4
loop_327:
	brlez	%o7,	loop_328
	fand	%f2,	%f2,	%f28
	tn	%icc,	0x6
	stbar
loop_328:
	fbul	%fcc0,	loop_329
	ble,a,pt	%xcc,	loop_330
	fcmpeq16	%f2,	%f28,	%i3
	tsubcc	%o0,	0x1F8C,	%l0
loop_329:
	orcc	%o4,	0x0683,	%o2
loop_330:
	andn	%o6,	0x01AA,	%o5
	sllx	%i2,	%g3,	%l3
	sllx	%g7,	0x1B,	%o1
	mulx	%l5,	0x1C46,	%i1
	set	0x20, %o1
	stda	%i4,	[%l7 + %o1] 0x18
	addccc	%l1,	%o3,	%i6
	umul	%i4,	0x0238,	%g4
	alignaddr	%g5,	%i7,	%l2
	movrne	%i0,	0x36A,	%l6
	mova	%icc,	%g1,	%g6
	movrlz	%g2,	%o7,	%i3
	fpsub32s	%f14,	%f1,	%f8
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l4,	%o0
	set	0x4C, %g7
	stwa	%l0,	[%l7 + %g7] 0x18
	orncc	%o2,	0x1BE0,	%o4
	alignaddrl	%o6,	%o5,	%i2
	brgez,a	%l3,	loop_331
	edge16n	%g7,	%o1,	%l5
	popc	0x1B44,	%i1
	movcs	%icc,	%i5,	%g3
loop_331:
	fornot1s	%f21,	%f9,	%f12
	fmovde	%icc,	%f11,	%f15
	movvs	%xcc,	%o3,	%l1
	tgu	%icc,	0x7
	edge32ln	%i4,	%i6,	%g5
	xor	%g4,	%i7,	%i0
	edge8ln	%l2,	%l6,	%g1
	fcmpgt16	%f24,	%f22,	%g2
	or	%g6,	0x0F88,	%i3
	subc	%l4,	0x1A89,	%o7
	fmovsleu	%xcc,	%f29,	%f3
	tsubcctv	%l0,	0x18B3,	%o0
	orncc	%o4,	%o2,	%o6
	ble,a	loop_332
	fnot1	%f4,	%f24
	sdivx	%o5,	0x1C84,	%i2
	andncc	%l3,	%o1,	%g7
loop_332:
	fmovrslz	%i1,	%f18,	%f18
	smulcc	%l5,	%i5,	%g3
	movrgz	%l1,	0x367,	%i4
	sub	%o3,	0x032B,	%i6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x36] %asi,	%g4
	ba,pt	%xcc,	loop_333
	array8	%i7,	%g5,	%i0
	bn,pt	%icc,	loop_334
	tg	%icc,	0x3
loop_333:
	umul	%l2,	%l6,	%g1
	fandnot2	%f4,	%f2,	%f0
loop_334:
	bn,pt	%icc,	loop_335
	movne	%xcc,	%g6,	%g2
	move	%icc,	%l4,	%o7
	xorcc	%i3,	0x1E4E,	%l0
loop_335:
	tpos	%icc,	0x5
	and	%o0,	0x0BAE,	%o2
	move	%icc,	%o4,	%o6
	tcc	%xcc,	0x3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] 0x88,	%i2,	%o5
	fpack32	%f16,	%f0,	%f14
	move	%icc,	%l3,	%g7
	fmovs	%f2,	%f6
	edge16	%i1,	%o1,	%l5
	movleu	%xcc,	%i5,	%g3
	subc	%i4,	%o3,	%i6
	fsrc2	%f6,	%f4
	movcs	%icc,	%l1,	%g4
	andn	%i7,	%i0,	%g5
	edge16n	%l6,	%l2,	%g1
	tcs	%xcc,	0x6
	fble,a	%fcc0,	loop_336
	udiv	%g6,	0x10DE,	%l4
	udivcc	%o7,	0x041B,	%g2
	edge16ln	%i3,	%o0,	%l0
loop_336:
	alignaddr	%o2,	%o6,	%o4
	fpadd32s	%f15,	%f2,	%f2
	fmovsne	%icc,	%f1,	%f1
	tsubcctv	%o5,	%l3,	%i2
	fmovsge	%xcc,	%f1,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i1,	0x0F71,	%o1
	fcmpne16	%f6,	%f18,	%l5
	fmovsle	%xcc,	%f20,	%f1
	tneg	%icc,	0x3
	tl	%icc,	0x4
	move	%icc,	%g7,	%g3
	taddcc	%i4,	0x03C2,	%i5
	sir	0x18C7
	fnors	%f27,	%f28,	%f8
	stw	%o3,	[%l7 + 0x68]
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x58] %asi,	%i6
	fmovsneg	%icc,	%f13,	%f22
	set	0x48, %i3
	stda	%l0,	[%l7 + %i3] 0x81
	orn	%i7,	%i0,	%g5
	andn	%l6,	%l2,	%g1
	bcc	%icc,	loop_337
	umulcc	%g4,	0x0108,	%l4
	tpos	%xcc,	0x3
	fmovrdne	%o7,	%f6,	%f16
loop_337:
	sdivcc	%g6,	0x0BD0,	%i3
	orn	%g2,	0x0CD7,	%o0
	tsubcc	%l0,	0x081F,	%o6
	fmovdgu	%xcc,	%f31,	%f15
	movrlz	%o2,	0x1CA,	%o4
	edge8ln	%o5,	%i2,	%i1
	edge32ln	%o1,	%l3,	%l5
	tne	%xcc,	0x2
	tpos	%xcc,	0x6
	te	%icc,	0x7
	ldsw	[%l7 + 0x34],	%g7
	fmovd	%f26,	%f22
	alignaddr	%i4,	%g3,	%o3
	alignaddr	%i5,	%l1,	%i6
	fble,a	%fcc1,	loop_338
	fmovdvc	%xcc,	%f5,	%f17
	xnorcc	%i0,	%g5,	%l6
	movcs	%icc,	%l2,	%g1
loop_338:
	fnegd	%f18,	%f12
	smulcc	%g4,	%l4,	%o7
	sdivcc	%i7,	0x0629,	%g6
	addccc	%i3,	0x1073,	%o0
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x15,	 0x3
	fmovde	%xcc,	%f19,	%f3
	fexpand	%f18,	%f10
	edge8n	%l0,	%o6,	%o2
	fmovdcc	%xcc,	%f5,	%f17
	tg	%icc,	0x7
	fnands	%f4,	%f19,	%f8
	sdivx	%o4,	0x1E49,	%o5
	xnor	%i1,	%i2,	%l3
	fpsub16	%f14,	%f16,	%f28
	movgu	%xcc,	%o1,	%l5
	movleu	%icc,	%g7,	%g3
	tl	%icc,	0x3
	edge8n	%o3,	%i5,	%i4
	xnorcc	%i6,	%i0,	%l1
	alignaddrl	%g5,	%l6,	%g1
	set	0x35, %o7
	ldsba	[%l7 + %o7] 0x04,	%l2
	mova	%icc,	%l4,	%o7
	set	0x3A, %l2
	ldsha	[%l7 + %l2] 0x14,	%i7
	xor	%g6,	0x0C23,	%i3
	te	%xcc,	0x7
	fmovsn	%xcc,	%f22,	%f13
	movle	%icc,	%o0,	%g2
	siam	0x6
	fmul8x16au	%f7,	%f6,	%f14
	brgez,a	%l0,	loop_339
	tcc	%xcc,	0x2
	wr	%g0,	0x11,	%asi
	stda	%g4,	[%l7 + 0x38] %asi
loop_339:
	bcc,a,pt	%icc,	loop_340
	fmovsa	%icc,	%f23,	%f29
	fpsub16s	%f31,	%f25,	%f25
	sethi	0x09F5,	%o2
loop_340:
	fcmpgt16	%f22,	%f14,	%o4
	be,a	loop_341
	tle	%icc,	0x1
	fmovdpos	%xcc,	%f13,	%f9
	fmovdcs	%icc,	%f14,	%f29
loop_341:
	edge16l	%o6,	%o5,	%i1
	bleu	loop_342
	fcmpeq32	%f10,	%f28,	%l3
	sll	%o1,	%l5,	%i2
	udivcc	%g7,	0x1BB2,	%o3
loop_342:
	fmovda	%xcc,	%f14,	%f31
	movrne	%g3,	%i5,	%i4
	add	%i6,	0x162A,	%i0
	edge16	%l1,	%l6,	%g5
	sdiv	%g1,	0x0A8A,	%l4
	brgez,a	%o7,	loop_343
	sdivx	%l2,	0x1B4C,	%g6
	srl	%i7,	0x06,	%o0
	mova	%icc,	%i3,	%l0
loop_343:
	brgz	%g4,	loop_344
	edge16n	%o2,	%o4,	%o6
	tl	%icc,	0x2
	edge16	%g2,	%i1,	%o5
loop_344:
	edge32n	%l3,	%l5,	%o1
	movn	%xcc,	%g7,	%o3
	set	0x2E, %i5
	stba	%g3,	[%l7 + %i5] 0x89
	orncc	%i5,	%i4,	%i2
	set	0x10, %o6
	sta	%f20,	[%l7 + %o6] 0x10
	taddcc	%i6,	0x14BB,	%i0
	wr	%g0,	0x80,	%asi
	stda	%l0,	[%l7 + 0x10] %asi
	subcc	%g5,	%l6,	%l4
	andn	%o7,	0x0438,	%l2
	tne	%icc,	0x7
	edge8n	%g1,	%i7,	%o0
	sdiv	%g6,	0x0680,	%i3
	fcmped	%fcc3,	%f20,	%f6
	fabsd	%f30,	%f12
	brgz	%l0,	loop_345
	edge16ln	%o2,	%o4,	%g4
	subc	%o6,	%i1,	%g2
	movgu	%icc,	%o5,	%l3
loop_345:
	fcmpne32	%f4,	%f30,	%l5
	brlz	%o1,	loop_346
	nop
	setx loop_347, %l0, %l1
	jmpl %l1, %o3
	call	loop_348
	fbe,a	%fcc3,	loop_349
loop_346:
	subcc	%g3,	%i5,	%i4
loop_347:
	nop
	set	0x3C, %o5
	prefetch	[%l7 + %o5],	 0x2
loop_348:
	brgez	%i2,	loop_350
loop_349:
	fandnot1	%f24,	%f12,	%f22
	fpmerge	%f31,	%f27,	%f22
	bcc,pn	%xcc,	loop_351
loop_350:
	edge32l	%g7,	%i0,	%l1
	movne	%xcc,	%g5,	%i6
	std	%f30,	[%l7 + 0x20]
loop_351:
	alignaddr	%l4,	%o7,	%l2
	ta	%icc,	0x1
	srlx	%l6,	0x09,	%i7
	add	%o0,	%g1,	%g6
	popc	%i3,	%o2
	movne	%xcc,	%l0,	%o4
	fmovde	%icc,	%f21,	%f3
	tgu	%icc,	0x6
	fnot2s	%f24,	%f25
	smulcc	%g4,	0x06A3,	%o6
	fbn	%fcc1,	loop_352
	fbu,a	%fcc1,	loop_353
	movg	%icc,	%g2,	%i1
	movcc	%icc,	%o5,	%l5
loop_352:
	nop
	set	0x70, %l0
	lduwa	[%l7 + %l0] 0x10,	%o1
loop_353:
	edge16	%o3,	%g3,	%l3
	movvs	%icc,	%i4,	%i2
	brnz,a	%g7,	loop_354
	movgu	%xcc,	%i0,	%i5
	bvs,pt	%icc,	loop_355
	movcc	%xcc,	%g5,	%i6
loop_354:
	ta	%icc,	0x4
	tsubcc	%l1,	0x0634,	%l4
loop_355:
	fmul8x16al	%f30,	%f1,	%f10
	set	0x23, %l6
	ldstuba	[%l7 + %l6] 0x89,	%o7
	tgu	%icc,	0x1
	addc	%l2,	0x01D2,	%i7
	tg	%xcc,	0x3
	sdivx	%o0,	0x0D5C,	%g1
	fnot2	%f12,	%f20
	ldx	[%l7 + 0x28],	%l6
	fzero	%f14
	lduw	[%l7 + 0x50],	%i3
	fsrc1s	%f31,	%f29
	fmovdg	%xcc,	%f5,	%f17
	ble,a	loop_356
	fmovrsne	%o2,	%f1,	%f17
	movneg	%xcc,	%g6,	%l0
	tn	%xcc,	0x3
loop_356:
	tvc	%icc,	0x5
	taddcctv	%g4,	0x0148,	%o4
	set	0x36, %o4
	lduba	[%l7 + %o4] 0x81,	%o6
	bge,a	%icc,	loop_357
	tgu	%xcc,	0x7
	movl	%icc,	%i1,	%g2
	array8	%o5,	%o1,	%o3
loop_357:
	movvc	%xcc,	%g3,	%l5
	move	%xcc,	%i4,	%i2
	fcmpd	%fcc0,	%f30,	%f20
	fbug,a	%fcc3,	loop_358
	ldsw	[%l7 + 0x18],	%g7
	move	%xcc,	%l3,	%i0
	fpadd32	%f2,	%f20,	%f18
loop_358:
	movne	%xcc,	%i5,	%g5
	edge32l	%l1,	%l4,	%i6
	ta	%xcc,	0x4
	bleu,a	loop_359
	sdivcc	%o7,	0x0C65,	%l2
	ba,a	loop_360
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_359:
	movre	%i7,	%g1,	%l6
	fcmpeq16	%f10,	%f4,	%i3
loop_360:
	umul	%o2,	0x05FB,	%o0
	tsubcctv	%l0,	%g4,	%g6
	edge32n	%o6,	%i1,	%o4
	bvs	%xcc,	loop_361
	sra	%o5,	0x1B,	%o1
	movge	%icc,	%g2,	%g3
	orncc	%l5,	%i4,	%i2
loop_361:
	mulscc	%o3,	0x0A83,	%l3
	ldd	[%l7 + 0x78],	%g6
	movrne	%i0,	%i5,	%g5
	edge16	%l1,	%i6,	%o7
	fxnor	%f18,	%f24,	%f8
	ldsw	[%l7 + 0x28],	%l4
	fbule,a	%fcc1,	loop_362
	fnegd	%f30,	%f30
	edge8l	%l2,	%i7,	%l6
	movvs	%icc,	%g1,	%i3
loop_362:
	addccc	%o0,	0x1C79,	%o2
	bge,pn	%icc,	loop_363
	fblg	%fcc1,	loop_364
	movleu	%icc,	%l0,	%g4
	movrlez	%g6,	%i1,	%o6
loop_363:
	fpadd32	%f2,	%f10,	%f6
loop_364:
	fbne	%fcc0,	loop_365
	tge	%icc,	0x6
	tvc	%xcc,	0x0
	subccc	%o4,	0x17A6,	%o1
loop_365:
	ldub	[%l7 + 0x0E],	%g2
	xnor	%g3,	%o5,	%i4
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
	brz,a	%i2,	loop_366
	tcc	%xcc,	0x2
	edge8	%o3,	%l3,	%l5
	orn	%g7,	%i5,	%i0
loop_366:
	fbge,a	%fcc1,	loop_367
	movrlz	%l1,	%g5,	%o7
	fpadd32	%f4,	%f24,	%f2
	fbuge	%fcc3,	loop_368
loop_367:
	xor	%l4,	0x1C5C,	%i6
	fbul	%fcc2,	loop_369
	fnand	%f20,	%f30,	%f0
loop_368:
	smul	%i7,	0x1986,	%l2
	add	%g1,	%l6,	%i3
loop_369:
	sethi	0x0198,	%o0
	array32	%l0,	%o2,	%g4
	fcmps	%fcc1,	%f17,	%f8
	srl	%i1,	0x07,	%o6
	nop
	setx loop_370, %l0, %l1
	jmpl %l1, %g6
	tgu	%xcc,	0x4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o4,	%g2
loop_370:
	fmovrdne	%o1,	%f14,	%f18
	movrne	%g3,	%i4,	%i2
	edge8ln	%o3,	%l3,	%l5
	udivx	%g7,	0x041C,	%i5
	movne	%xcc,	%i0,	%o5
	nop
	setx loop_371, %l0, %l1
	jmpl %l1, %l1
	movrgez	%o7,	%g5,	%i6
	subcc	%i7,	0x16C9,	%l4
	fmovdpos	%icc,	%f29,	%f0
loop_371:
	sub	%g1,	0x1181,	%l2
	brlez	%l6,	loop_372
	array32	%i3,	%l0,	%o0
	fmovrdgz	%g4,	%f6,	%f22
	set	0x78, %i7
	sta	%f7,	[%l7 + %i7] 0x19
loop_372:
	movvc	%xcc,	%i1,	%o2
	movre	%o6,	0x20E,	%o4
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x10,	%g2
	movg	%icc,	%o1,	%g6
	brz	%i4,	loop_373
	andn	%g3,	0x0A6A,	%i2
	bge,pn	%xcc,	loop_374
	fmovsne	%xcc,	%f31,	%f24
loop_373:
	nop
	wr	%g0,	0xe3,	%asi
	stwa	%o3,	[%l7 + 0x54] %asi
	membar	#Sync
loop_374:
	array8	%l5,	%g7,	%l3
	prefetch	[%l7 + 0x50],	 0x3
	edge32ln	%i5,	%o5,	%l1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x11,	%o7,	%g5
	fmovrsne	%i0,	%f5,	%f13
	umul	%i6,	0x0BEC,	%i7
	fpackfix	%f6,	%f3
	for	%f14,	%f16,	%f28
	bge,pt	%icc,	loop_375
	fbuge	%fcc0,	loop_376
	movge	%icc,	%g1,	%l4
	fbul,a	%fcc2,	loop_377
loop_375:
	ldd	[%l7 + 0x20],	%f14
loop_376:
	nop
	setx	loop_378,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%xcc,	0x2
loop_377:
	brnz,a	%l6,	loop_379
	bneg,pn	%xcc,	loop_380
loop_378:
	tcc	%xcc,	0x1
	fmovdl	%icc,	%f25,	%f12
loop_379:
	edge32	%l2,	%i3,	%l0
loop_380:
	sllx	%o0,	0x0A,	%i1
	sllx	%g4,	0x1F,	%o6
	fpmerge	%f21,	%f28,	%f20
	mulscc	%o2,	0x1426,	%o4
	subc	%g2,	%o1,	%i4
	movne	%xcc,	%g3,	%g6
	orncc	%i2,	0x16BD,	%o3
	fmovdle	%xcc,	%f29,	%f31
	udivx	%l5,	0x0319,	%l3
	bshuffle	%f4,	%f4,	%f22
	fcmps	%fcc1,	%f27,	%f4
	bl,a	loop_381
	fmovdleu	%xcc,	%f31,	%f24
	movn	%icc,	%g7,	%i5
	tcc	%xcc,	0x5
loop_381:
	sethi	0x172B,	%l1
	fmovrsgez	%o5,	%f11,	%f1
	mova	%icc,	%g5,	%o7
	fba,a	%fcc1,	loop_382
	mova	%xcc,	%i0,	%i7
	membar	0x72
	fmul8sux16	%f26,	%f30,	%f24
loop_382:
	fsrc1s	%f14,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc0,	loop_383
	bcs,a,pt	%xcc,	loop_384
	tge	%xcc,	0x2
	sethi	0x1C3F,	%i6
loop_383:
	movgu	%icc,	%g1,	%l4
loop_384:
	movrgz	%l2,	%i3,	%l6
	edge16ln	%l0,	%o0,	%g4
	xorcc	%i1,	%o2,	%o4
	xorcc	%g2,	%o6,	%i4
	xnorcc	%g3,	%g6,	%o1
	edge32n	%i2,	%o3,	%l5
	fnot1s	%f28,	%f14
	srax	%g7,	%i5,	%l1
	movpos	%icc,	%o5,	%g5
	fornot1	%f4,	%f14,	%f0
	fmovrde	%l3,	%f16,	%f16
	st	%f23,	[%l7 + 0x70]
	ld	[%l7 + 0x54],	%f10
	bneg	%icc,	loop_385
	popc	0x117D,	%o7
	brnz,a	%i0,	loop_386
	movrgez	%i7,	%g1,	%l4
loop_385:
	fbug	%fcc2,	loop_387
	for	%f24,	%f24,	%f26
loop_386:
	fornot1s	%f1,	%f21,	%f24
	alignaddr	%l2,	%i6,	%i3
loop_387:
	srax	%l6,	0x14,	%l0
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x38] %asi,	%o0
	edge32n	%i1,	%g4,	%o4
	bne,pt	%xcc,	loop_388
	movrlz	%g2,	0x33C,	%o6
	sllx	%i4,	0x01,	%o2
	edge8l	%g3,	%o1,	%g6
loop_388:
	movrlez	%o3,	0x303,	%l5
	fmovdpos	%icc,	%f0,	%f6
	tvc	%icc,	0x1
	movcs	%xcc,	%g7,	%i5
	edge32	%l1,	%o5,	%i2
	fornot2	%f4,	%f18,	%f6
	tge	%icc,	0x7
	edge16	%g5,	%l3,	%i0
	fmovdle	%icc,	%f31,	%f12
	udivcc	%i7,	0x0FA0,	%g1
	fxnors	%f1,	%f25,	%f25
	tsubcc	%o7,	%l4,	%l2
	ta	%icc,	0x1
	ldstub	[%l7 + 0x38],	%i3
	ldstub	[%l7 + 0x26],	%l6
	movrlez	%l0,	0x158,	%i6
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x40] %asi,	%o0
	bgu,a,pn	%xcc,	loop_389
	edge32l	%i1,	%g4,	%g2
	fnands	%f21,	%f3,	%f0
	tsubcctv	%o6,	0x1B28,	%o4
loop_389:
	nop
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
	fpsub32	%f24,	%f22,	%f8
	fmovdcs	%icc,	%f16,	%f30
	umulcc	%o2,	%o1,	%g6
	edge16	%g3,	%l5,	%o3
	bneg	loop_390
	ldx	[%l7 + 0x08],	%g7
	movleu	%xcc,	%i5,	%l1
	addcc	%o5,	0x1558,	%i2
loop_390:
	tleu	%xcc,	0x1
	or	%l3,	%i0,	%i7
	andncc	%g5,	%g1,	%l4
	fmovscc	%xcc,	%f3,	%f8
	std	%o6,	[%l7 + 0x10]
	set	0x54, %g1
	ldswa	[%l7 + %g1] 0x14,	%i3
	alignaddr	%l2,	%l6,	%i6
	subcc	%l0,	%o0,	%i1
	addc	%g4,	0x0103,	%g2
	fmovrslez	%o6,	%f24,	%f4
	ble,pn	%xcc,	loop_391
	srl	%o4,	0x02,	%i4
	tsubcc	%o2,	%g6,	%g3
	sra	%o1,	0x00,	%l5
loop_391:
	movn	%xcc,	%g7,	%i5
	tle	%xcc,	0x5
	tpos	%xcc,	0x1
	te	%icc,	0x6
	fmovdvs	%xcc,	%f1,	%f2
	array16	%l1,	%o3,	%i2
	wr	%g0,	0x2b,	%asi
	stda	%o4,	[%l7 + 0x30] %asi
	membar	#Sync
	membar	0x7C
	mova	%xcc,	%l3,	%i0
	sra	%g5,	%g1,	%l4
	subc	%o7,	%i7,	%i3
	orncc	%l2,	0x1464,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%l0,	%o0
	fcmple16	%f28,	%f6,	%i1
	stx	%i6,	[%l7 + 0x28]
	nop
	set	0x22, %o2
	sth	%g2,	[%l7 + %o2]
	sdivx	%o6,	0x14C3,	%o4
	sir	0x0788
	movrgz	%i4,	%o2,	%g4
	set	0x0A, %l5
	lduba	[%l7 + %l5] 0x88,	%g6
	sethi	0x0FAC,	%o1
	fnot1	%f30,	%f6
	fnot2s	%f18,	%f9
	tsubcc	%g3,	%g7,	%l5
	bleu,pn	%icc,	loop_392
	movge	%xcc,	%i5,	%l1
	movvs	%icc,	%o3,	%i2
	array32	%o5,	%l3,	%i0
loop_392:
	taddcc	%g5,	0x11C6,	%l4
	array32	%g1,	%o7,	%i7
	alignaddr	%l2,	%l6,	%i3
	sll	%l0,	0x18,	%o0
	fmovsvs	%icc,	%f5,	%f8
	xnor	%i1,	%i6,	%o6
	andn	%o4,	%g2,	%i4
	udivx	%g4,	0x1B2C,	%g6
	ldstub	[%l7 + 0x2E],	%o1
	ldx	[%l7 + 0x20],	%g3
	tle	%xcc,	0x0
	fornot2	%f12,	%f18,	%f18
	fmovde	%xcc,	%f8,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%o2,	%l5
	tcs	%icc,	0x3
	edge32n	%i5,	%l1,	%g7
	taddcc	%o3,	%i2,	%o5
	subccc	%i0,	%l3,	%g5
	ba,a	%xcc,	loop_393
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l4,	%g1
	sdiv	%o7,	0x1DBB,	%l2
loop_393:
	ldsb	[%l7 + 0x43],	%i7
	prefetch	[%l7 + 0x5C],	 0x1
	subc	%l6,	0x178E,	%l0
	brz,a	%i3,	loop_394
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz,a	%i1,	loop_395
	xor	%i6,	0x0039,	%o6
loop_394:
	fbe	%fcc2,	loop_396
	be,a,pn	%icc,	loop_397
loop_395:
	movn	%icc,	%o4,	%o0
	addcc	%i4,	%g2,	%g4
loop_396:
	edge16ln	%g6,	%g3,	%o2
loop_397:
	sll	%o1,	%i5,	%l5
	edge32ln	%g7,	%o3,	%l1
	fbg,a	%fcc0,	loop_398
	fcmpd	%fcc0,	%f4,	%f2
	set	0x37, %o3
	stba	%o5,	[%l7 + %o3] 0x15
loop_398:
	fbo,a	%fcc3,	loop_399
	tg	%icc,	0x0
	edge32	%i0,	%l3,	%g5
	srl	%i2,	0x13,	%g1
loop_399:
	fmuld8ulx16	%f29,	%f10,	%f16
	fmuld8ulx16	%f22,	%f0,	%f16
	sethi	0x00AA,	%o7
	fcmped	%fcc0,	%f8,	%f2
	fmovsneg	%icc,	%f7,	%f27
	fnegs	%f24,	%f4
	edge8n	%l2,	%l4,	%i7
	mova	%xcc,	%l6,	%l0
	fpack32	%f30,	%f30,	%f6
	fmovdpos	%icc,	%f29,	%f7
	bge,pt	%icc,	loop_400
	xnorcc	%i3,	0x114D,	%i1
	sir	0x1FFC
	sethi	0x0829,	%i6
loop_400:
	movge	%xcc,	%o4,	%o0
	st	%f11,	[%l7 + 0x6C]
	addc	%o6,	0x1F84,	%i4
	orcc	%g2,	0x11EC,	%g6
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
	xnorcc	%g4,	%o2,	%o1
	xorcc	%i5,	%g3,	%l5
	sllx	%o3,	0x0C,	%l1
loop_401:
	bvc,a,pt	%icc,	loop_402
	xnorcc	%g7,	0x1191,	%o5
	mulscc	%l3,	0x0EF6,	%g5
	edge8	%i0,	%i2,	%o7
loop_402:
	fmovrdne	%g1,	%f30,	%f30
	sethi	0x0BB4,	%l4
	subccc	%l2,	0x11CC,	%i7
	fbe	%fcc3,	loop_403
	tvc	%xcc,	0x1
	movn	%icc,	%l0,	%l6
	xor	%i1,	0x1313,	%i6
loop_403:
	movvs	%xcc,	%i3,	%o4
	subcc	%o6,	%i4,	%g2
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x3C] %asi,	%f8
	tpos	%icc,	0x4
	movge	%icc,	%g6,	%o0
	movrgez	%o2,	0x033,	%g4
	srax	%i5,	%o1,	%l5
	mulx	%g3,	0x0AD1,	%o3
	tg	%xcc,	0x2
	stbar
	move	%icc,	%g7,	%l1
	tg	%xcc,	0x3
	te	%xcc,	0x5
	edge8l	%l3,	%g5,	%i0
	st	%f28,	[%l7 + 0x10]
	set	0x19, %g5
	stba	%o5,	[%l7 + %g5] 0x11
	fnands	%f30,	%f25,	%f24
	movneg	%icc,	%o7,	%g1
	set	0x40, %g3
	stha	%i2,	[%l7 + %g3] 0x22
	membar	#Sync
	tcs	%icc,	0x6
	udivx	%l4,	0x1B36,	%l2
	pdist	%f18,	%f26,	%f8
	fsrc2	%f18,	%f8
	fmovrdlez	%i7,	%f24,	%f8
	edge16n	%l0,	%i1,	%i6
	subccc	%i3,	%l6,	%o6
	xor	%i4,	0x04F3,	%g2
	fble	%fcc2,	loop_404
	fnot2	%f24,	%f0
	wr	%g0,	0x10,	%asi
	stha	%o4,	[%l7 + 0x20] %asi
loop_404:
	fmovrdne	%g6,	%f16,	%f14
	set	0x54, %l4
	stwa	%o2,	[%l7 + %l4] 0x15
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc0,	loop_405
	andncc	%o0,	%g4,	%i5
	movgu	%xcc,	%o1,	%l5
	smul	%g3,	%o3,	%l1
loop_405:
	edge8	%l3,	%g5,	%i0
	sub	%g7,	%o7,	%o5
	sethi	0x054C,	%g1
	umulcc	%i2,	0x1EC9,	%l2
	nop
	setx	loop_406,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subc	%i7,	0x0710,	%l4
	ldsw	[%l7 + 0x38],	%l0
	tvs	%icc,	0x4
loop_406:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x5A] %asi,	%i6
	tsubcctv	%i3,	%i1,	%o6
	xnor	%i4,	%g2,	%l6
	set	0x20, %i0
	ldda	[%l7 + %i0] 0x2e,	%g6
	tcs	%xcc,	0x0
	ldsh	[%l7 + 0x3A],	%o2
	movcs	%icc,	%o4,	%g4
	move	%icc,	%i5,	%o1
	fandnot2	%f0,	%f12,	%f18
	bne,a,pn	%xcc,	loop_407
	array32	%o0,	%l5,	%o3
	te	%xcc,	0x7
	fmovd	%f28,	%f26
loop_407:
	movle	%xcc,	%l1,	%l3
	nop
	setx	loop_408,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu	%fcc2,	loop_409
	sub	%g5,	0x051E,	%i0
	fmovrsne	%g3,	%f19,	%f13
loop_408:
	srl	%o7,	0x13,	%o5
loop_409:
	fbg	%fcc3,	loop_410
	fnot2s	%f13,	%f18
	addc	%g1,	%i2,	%l2
	fxnors	%f26,	%f4,	%f31
loop_410:
	udiv	%i7,	0x1133,	%l4
	tsubcctv	%g7,	%l0,	%i6
	call	loop_411
	fmovdg	%icc,	%f10,	%f16
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i3
loop_411:
	ldsh	[%l7 + 0x6C],	%o6
	srax	%i4,	%g2,	%i1
	fmuld8sux16	%f6,	%f16,	%f28
	fnegd	%f14,	%f0
	fzero	%f22
	sra	%l6,	%o2,	%o4
	subc	%g6,	0x02A5,	%i5
	xnor	%o1,	0x0A67,	%g4
	sdivcc	%o0,	0x14B3,	%o3
	movvs	%xcc,	%l5,	%l1
	tpos	%icc,	0x1
	array8	%l3,	%g5,	%i0
	sra	%g3,	0x0E,	%o7
	smul	%o5,	%i2,	%g1
	tn	%icc,	0x5
	fpadd32s	%f1,	%f21,	%f11
	fmovrdlz	%i7,	%f6,	%f22
	fmovdvs	%xcc,	%f24,	%f6
	bleu,pn	%icc,	loop_412
	stb	%l4,	[%l7 + 0x45]
	ldstub	[%l7 + 0x0A],	%g7
	srlx	%l0,	%i6,	%l2
loop_412:
	tsubcc	%i3,	0x193A,	%o6
	sethi	0x1043,	%g2
	xnorcc	%i4,	0x049C,	%l6
	mulscc	%i1,	%o2,	%g6
	movrgz	%o4,	%i5,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%o0,	loop_413
	tsubcctv	%o3,	%l5,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l1,	%g5
loop_413:
	sdiv	%l3,	0x0C4D,	%i0
	fmovdneg	%xcc,	%f27,	%f4
	sir	0x1921
	ta	%icc,	0x7
	fbg	%fcc0,	loop_414
	fnot2s	%f26,	%f21
	faligndata	%f2,	%f24,	%f20
	brz,a	%g3,	loop_415
loop_414:
	membar	0x65
	movrgez	%o5,	0x385,	%i2
	wr	%g0,	0x23,	%asi
	stba	%g1,	[%l7 + 0x35] %asi
	membar	#Sync
loop_415:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tleu	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i7,	%o7
	ldsh	[%l7 + 0x5A],	%l4
	srlx	%l0,	0x13,	%i6
	fmul8sux16	%f14,	%f18,	%f2
	te	%icc,	0x5
	addc	%l2,	0x1871,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x63, %l3
	ldstuba	[%l7 + %l3] 0x89,	%o6
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x70] %asi,	%g2
	alignaddrl	%g7,	%l6,	%i1
	udivcc	%i4,	0x17EB,	%o2
	movcs	%xcc,	%g6,	%i5
	sll	%o4,	%o1,	%o0
	fornot1s	%f13,	%f27,	%f2
	fbule,a	%fcc3,	loop_416
	fsrc1	%f10,	%f28
	fcmpgt16	%f14,	%f12,	%o3
	brgez,a	%l5,	loop_417
loop_416:
	popc	0x0010,	%g4
	edge8l	%l1,	%g5,	%l3
	alignaddrl	%g3,	%i0,	%o5
loop_417:
	fabsd	%f20,	%f14
	mova	%icc,	%g1,	%i2
	tleu	%icc,	0x4
	fmovsg	%xcc,	%f25,	%f27
	edge32n	%o7,	%i7,	%l0
	fcmpne16	%f20,	%f10,	%l4
	xnor	%l2,	%i3,	%o6
	fbo	%fcc2,	loop_418
	fpadd32	%f14,	%f24,	%f10
	edge32l	%i6,	%g2,	%l6
	fnands	%f17,	%f15,	%f10
loop_418:
	nop
	set	0x4C, %o0
	swapa	[%l7 + %o0] 0x18,	%i1
	sdivx	%g7,	0x1839,	%i4
	set	0x20, %g2
	swapa	[%l7 + %g2] 0x81,	%g6
	movvs	%xcc,	%i5,	%o2
	tneg	%icc,	0x0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%o1
	and	%o0,	0x133E,	%o3
	array32	%l5,	%l1,	%g5
	lduw	[%l7 + 0x40],	%l3
	fones	%f0
	wr	%g0,	0x19,	%asi
	sta	%f6,	[%l7 + 0x5C] %asi
	set	0x60, %i6
	ldstuba	[%l7 + %i6] 0x0c,	%g4
	fpsub16	%f12,	%f22,	%f20
	subc	%i0,	%o5,	%g3
	movn	%icc,	%g1,	%o7
	flush	%l7 + 0x1C
	taddcc	%i2,	%i7,	%l4
	tge	%xcc,	0x5
	xor	%l2,	%i3,	%l0
	sdivx	%o6,	0x15E8,	%g2
	sdivx	%l6,	0x08C4,	%i6
	movgu	%icc,	%g7,	%i4
	fmovda	%icc,	%f2,	%f23
	fabsd	%f24,	%f10
	fmovde	%icc,	%f9,	%f17
	edge16ln	%i1,	%i5,	%g6
	srax	%o2,	0x0B,	%o1
	set	0x44, %i1
	ldsba	[%l7 + %i1] 0x10,	%o4
	fxnors	%f10,	%f16,	%f12
	fexpand	%f19,	%f20
	ld	[%l7 + 0x6C],	%f14
	alignaddrl	%o0,	%o3,	%l1
	edge16	%g5,	%l5,	%g4
	fbg,a	%fcc2,	loop_419
	fbuge	%fcc1,	loop_420
	srlx	%l3,	0x01,	%i0
	tneg	%icc,	0x7
loop_419:
	movrgez	%g3,	%o5,	%g1
loop_420:
	fnegd	%f26,	%f2
	fmovse	%icc,	%f30,	%f28
	movrgz	%o7,	0x317,	%i7
	fbg	%fcc1,	loop_421
	fandnot1s	%f27,	%f31,	%f21
	sdiv	%i2,	0x1FF9,	%l4
	addcc	%l2,	0x0825,	%l0
loop_421:
	nop
	set	0x48, %g6
	stda	%i2,	[%l7 + %g6] 0x22
	membar	#Sync
	fmovrdgez	%g2,	%f16,	%f28
	sdiv	%l6,	0x0605,	%o6
	fmovrde	%i6,	%f10,	%f8
	movneg	%xcc,	%i4,	%i1
	fmovsgu	%icc,	%f9,	%f8
	srl	%i5,	%g7,	%g6
	movcc	%xcc,	%o1,	%o4
	set	0x08, %g4
	stwa	%o2,	[%l7 + %g4] 0x10
	array8	%o0,	%l1,	%g5
	smul	%o3,	0x0883,	%l5
	fmovdleu	%xcc,	%f22,	%f20
	tgu	%icc,	0x2
	movpos	%icc,	%g4,	%l3
	movne	%icc,	%g3,	%o5
	sdivcc	%i0,	0x1C6B,	%o7
	brgez	%g1,	loop_422
	tpos	%xcc,	0x7
	tn	%icc,	0x7
	srl	%i2,	%l4,	%i7
loop_422:
	or	%l0,	%i3,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l2,	%o6
	fmul8x16	%f12,	%f18,	%f12
	srlx	%l6,	0x04,	%i6
	movne	%icc,	%i1,	%i5
	movge	%xcc,	%i4,	%g7
	nop
	set	0x3A, %i2
	sth	%o1,	[%l7 + %i2]
	bvs	%xcc,	loop_423
	bneg,pt	%xcc,	loop_424
	faligndata	%f24,	%f12,	%f2
	ldx	[%l7 + 0x50],	%g6
loop_423:
	tsubcc	%o4,	%o0,	%o2
loop_424:
	ta	%xcc,	0x2
	edge8l	%l1,	%g5,	%l5
	movcs	%icc,	%g4,	%o3
	edge32n	%l3,	%g3,	%o5
	tge	%icc,	0x2
	addc	%i0,	%g1,	%i2
	addcc	%l4,	0x1ED1,	%o7
	prefetch	[%l7 + 0x30],	 0x0
	sllx	%i7,	%i3,	%l0
	or	%l2,	%g2,	%l6
	fcmps	%fcc1,	%f3,	%f5
	fmovsg	%icc,	%f17,	%f3
	tsubcc	%o6,	0x1754,	%i6
	edge16ln	%i5,	%i4,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i1,	%o1
	edge16	%o4,	%g6,	%o0
	movrlz	%o2,	0x06E,	%g5
	movl	%xcc,	%l1,	%l5
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x18] %asi
	edge8l	%g4,	%l3,	%o3
	udiv	%o5,	0x176A,	%g3
	bgu,pt	%icc,	loop_425
	xnor	%g1,	%i0,	%i2
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%l4,	[%g0 + 0x1d8] %asi ripped by fixASI40.pl ripped by fixASI40.pl
loop_425:
	subc	%o7,	%i7,	%l0
	set	0x16, %g7
	ldsba	[%l7 + %g7] 0x89,	%l2
	fmuld8sux16	%f30,	%f15,	%f18
	fandnot1	%f2,	%f28,	%f0
	movcc	%icc,	%g2,	%l6
	fmovrdgz	%o6,	%f4,	%f10
	brz	%i6,	loop_426
	fbug,a	%fcc2,	loop_427
	fcmple16	%f24,	%f18,	%i5
	udivx	%i3,	0x15F3,	%i4
loop_426:
	edge32ln	%i1,	%g7,	%o4
loop_427:
	fblg	%fcc3,	loop_428
	movvs	%icc,	%g6,	%o0
	tleu	%icc,	0x3
	movcs	%icc,	%o1,	%g5
loop_428:
	or	%l1,	%o2,	%l5
	mova	%xcc,	%g4,	%l3
	tneg	%xcc,	0x5
	fble,a	%fcc0,	loop_429
	edge8	%o5,	%g3,	%o3
	bgu,a,pn	%icc,	loop_430
	movgu	%icc,	%i0,	%i2
loop_429:
	fabss	%f24,	%f11
	sra	%g1,	0x10,	%l4
loop_430:
	brgz,a	%o7,	loop_431
	nop
	setx	loop_432,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxnor	%f30,	%f6,	%f20
	set	0x6A, %o1
	ldsba	[%l7 + %o1] 0x89,	%l0
loop_431:
	movcs	%icc,	%i7,	%l2
loop_432:
	call	loop_433
	orcc	%g2,	0x02B5,	%o6
	fors	%f5,	%f28,	%f26
	edge16n	%i6,	%l6,	%i5
loop_433:
	addccc	%i3,	0x0B56,	%i4
	movre	%i1,	%g7,	%g6
	subccc	%o4,	%o1,	%g5
	tn	%xcc,	0x6
	movvc	%xcc,	%l1,	%o2
	and	%l5,	%g4,	%o0
	movleu	%xcc,	%l3,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc2,	loop_434
	stw	%o5,	[%l7 + 0x74]
	movn	%xcc,	%i0,	%o3
	or	%g1,	%i2,	%o7
loop_434:
	tsubcc	%l0,	%i7,	%l4
	array8	%g2,	%l2,	%o6
	ta	%icc,	0x5
	tn	%xcc,	0x2
	tle	%xcc,	0x4
	orn	%l6,	0x1E9E,	%i5
	addc	%i6,	%i3,	%i4
	pdist	%f8,	%f0,	%f22
	edge32l	%i1,	%g6,	%g7
	fand	%f6,	%f18,	%f6
	wr	%g0,	0x27,	%asi
	stha	%o4,	[%l7 + 0x5E] %asi
	membar	#Sync
	edge16	%o1,	%l1,	%g5
	andcc	%l5,	0x01DD,	%g4
	ldsb	[%l7 + 0x6F],	%o2
	membar	0x19
	smul	%l3,	%o0,	%o5
	andn	%g3,	0x1F82,	%o3
	umulcc	%i0,	%i2,	%g1
	orncc	%l0,	%o7,	%i7
	fcmps	%fcc1,	%f10,	%f17
	popc	%l4,	%g2
	tcc	%xcc,	0x4
	fbg	%fcc3,	loop_435
	fmul8sux16	%f26,	%f8,	%f6
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_435:
	fnot2	%f22,	%f16
	add	%l2,	%o6,	%l6
	fbe,a	%fcc1,	loop_436
	edge32n	%i6,	%i5,	%i4
	brnz,a	%i3,	loop_437
	fcmpeq16	%f4,	%f6,	%i1
loop_436:
	udiv	%g6,	0x056A,	%o4
	andn	%g7,	%o1,	%l1
loop_437:
	bgu,a,pn	%icc,	loop_438
	fzero	%f4
	fmuld8ulx16	%f28,	%f6,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_438:
	fmovdneg	%xcc,	%f26,	%f23
	addccc	%g5,	%l5,	%o2
	bg,a	%icc,	loop_439
	brgz	%g4,	loop_440
	tle	%icc,	0x4
	fpack16	%f22,	%f17
loop_439:
	fnor	%f10,	%f16,	%f28
loop_440:
	fpsub16	%f0,	%f14,	%f28
	srax	%o0,	0x1B,	%o5
	movneg	%xcc,	%g3,	%o3
	set	0x65, %i4
	stba	%i0,	[%l7 + %i4] 0x18
	set	0x38, %i3
	ldswa	[%l7 + %i3] 0x14,	%l3
	xnor	%g1,	0x1509,	%l0
	ta	%icc,	0x3
	and	%o7,	%i2,	%i7
	sllx	%g2,	%l4,	%o6
	fpack32	%f0,	%f0,	%f6
	subc	%l6,	%i6,	%i5
	movcc	%icc,	%l2,	%i3
	tl	%icc,	0x1
	edge32	%i4,	%g6,	%i1
	fnand	%f30,	%f2,	%f6
	taddcc	%o4,	0x028C,	%o1
	movpos	%xcc,	%l1,	%g7
	fbue,a	%fcc3,	loop_441
	array8	%g5,	%l5,	%g4
	edge32n	%o2,	%o0,	%o5
	bge,pt	%icc,	loop_442
loop_441:
	array16	%o3,	%i0,	%l3
	movle	%icc,	%g3,	%g1
	fmovde	%xcc,	%f16,	%f20
loop_442:
	std	%f14,	[%l7 + 0x60]
	movrgez	%o7,	0x0FA,	%l0
	siam	0x3
	fsrc1s	%f8,	%f18
	fmovscc	%icc,	%f15,	%f2
	sth	%i2,	[%l7 + 0x5A]
	tg	%icc,	0x5
	move	%xcc,	%g2,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o6,	0x0B78,	%i7
	stw	%l6,	[%l7 + 0x1C]
	edge16	%i6,	%i5,	%l2
	fmovdne	%xcc,	%f3,	%f19
	bvs,a	%icc,	loop_443
	udiv	%i3,	0x0330,	%g6
	fmovdneg	%xcc,	%f1,	%f24
	fcmpne32	%f22,	%f2,	%i4
loop_443:
	bpos,a,pn	%xcc,	loop_444
	stw	%i1,	[%l7 + 0x10]
	fxor	%f12,	%f20,	%f6
	srl	%o4,	%o1,	%g7
loop_444:
	tneg	%xcc,	0x6
	fcmple32	%f30,	%f0,	%l1
	ldsw	[%l7 + 0x4C],	%l5
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x19
	fbul,a	%fcc3,	loop_445
	fmul8x16au	%f1,	%f16,	%f4
	nop
	setx loop_446, %l0, %l1
	jmpl %l1, %g5
	be,pn	%icc,	loop_447
loop_445:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f2,	%f10,	%g4
loop_446:
	tle	%icc,	0x4
loop_447:
	fcmpeq16	%f14,	%f18,	%o0
	tleu	%icc,	0x7
	fbule	%fcc3,	loop_448
	fcmpgt16	%f8,	%f30,	%o2
	fmovdne	%xcc,	%f19,	%f14
	xnor	%o3,	0x1CAE,	%o5
loop_448:
	fcmple32	%f2,	%f26,	%l3
	wr	%g0,	0xeb,	%asi
	stxa	%i0,	[%l7 + 0x38] %asi
	membar	#Sync
	movg	%xcc,	%g3,	%o7
	sethi	0x0C5D,	%l0
	fbl,a	%fcc1,	loop_449
	sdiv	%g1,	0x0CF8,	%g2
	fmul8x16al	%f17,	%f11,	%f4
	edge8	%l4,	%i2,	%i7
loop_449:
	ldx	[%l7 + 0x18],	%o6
	fxors	%f19,	%f6,	%f28
	move	%icc,	%l6,	%i5
	movleu	%icc,	%l2,	%i3
	movrne	%g6,	%i6,	%i1
	tvs	%xcc,	0x2
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%o4
	movpos	%icc,	%i4,	%g7
	orcc	%l1,	0x1135,	%l5
	tpos	%icc,	0x3
	movneg	%xcc,	%g5,	%o1
	fbu	%fcc1,	loop_450
	sll	%o0,	%o2,	%o3
	and	%g4,	%l3,	%o5
	array32	%g3,	%i0,	%o7
loop_450:
	fbn,a	%fcc3,	loop_451
	brlez,a	%l0,	loop_452
	addc	%g1,	0x10EE,	%g2
	xorcc	%i2,	%l4,	%o6
loop_451:
	fmuld8ulx16	%f26,	%f31,	%f12
loop_452:
	std	%f12,	[%l7 + 0x08]
	sdiv	%i7,	0x15A3,	%l6
	andn	%i5,	%l2,	%i3
	swap	[%l7 + 0x3C],	%i6
	fnegd	%f8,	%f28
	popc	%i1,	%g6
	stbar
	subc	%i4,	0x1C38,	%g7
	movrgz	%l1,	0x08F,	%o4
	fmovdpos	%xcc,	%f24,	%f5
	ldsh	[%l7 + 0x46],	%l5
	fble,a	%fcc2,	loop_453
	fmovsvs	%xcc,	%f8,	%f10
	movcc	%icc,	%o1,	%o0
	edge32	%g5,	%o2,	%o3
loop_453:
	movpos	%xcc,	%g4,	%o5
	alignaddrl	%l3,	%i0,	%g3
	taddcctv	%o7,	0x0946,	%g1
	addcc	%l0,	0x0D73,	%i2
	fand	%f14,	%f2,	%f24
	fpadd32s	%f19,	%f0,	%f27
	flush	%l7 + 0x54
	ldsw	[%l7 + 0x0C],	%l4
	fmovd	%f8,	%f14
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x2f,	%g2
	fmovrsgez	%o6,	%f4,	%f14
	tg	%xcc,	0x0
	xnor	%l6,	0x0F30,	%i5
	popc	0x02C4,	%i7
	call	loop_454
	bvs,a	%icc,	loop_455
	fand	%f0,	%f2,	%f10
	movrne	%l2,	0x19E,	%i3
loop_454:
	movre	%i6,	%g6,	%i4
loop_455:
	taddcctv	%i1,	%g7,	%o4
	fxors	%f3,	%f4,	%f17
	array32	%l1,	%o1,	%l5
	fbo,a	%fcc1,	loop_456
	movrne	%o0,	0x2E7,	%o2
	fble	%fcc2,	loop_457
	fbg,a	%fcc2,	loop_458
loop_456:
	tleu	%xcc,	0x4
	tpos	%icc,	0x0
loop_457:
	ldd	[%l7 + 0x10],	%g4
loop_458:
	sllx	%o3,	0x01,	%o5
	srax	%l3,	%i0,	%g3
	fbl,a	%fcc1,	loop_459
	tcs	%icc,	0x3
	fmovsne	%xcc,	%f3,	%f3
	brnz	%o7,	loop_460
loop_459:
	tcc	%icc,	0x2
	fnot2	%f14,	%f26
	fmovdle	%xcc,	%f15,	%f17
loop_460:
	fmovsn	%xcc,	%f18,	%f21
	movrne	%g1,	0x060,	%g4
	array32	%l0,	%l4,	%i2
	udiv	%o6,	0x0E47,	%l6
	xorcc	%g2,	%i5,	%l2
	movle	%icc,	%i7,	%i3
	add	%g6,	0x04DF,	%i4
	movpos	%icc,	%i6,	%i1
	bcs	%xcc,	loop_461
	movge	%xcc,	%g7,	%o4
	tgu	%xcc,	0x0
	umulcc	%l1,	0x0F80,	%o1
loop_461:
	edge8n	%l5,	%o2,	%o0
	fcmpes	%fcc0,	%f11,	%f3
	fbug	%fcc2,	loop_462
	sra	%g5,	0x1E,	%o3
	lduh	[%l7 + 0x1E],	%o5
	fbue	%fcc2,	loop_463
loop_462:
	sdiv	%l3,	0x126D,	%g3
	tleu	%xcc,	0x2
	addccc	%i0,	0x1898,	%g1
loop_463:
	movne	%xcc,	%o7,	%l0
	ta	%xcc,	0x2
	and	%l4,	0x0D68,	%g4
	wr	%g0,	0x18,	%asi
	stxa	%o6,	[%l7 + 0x10] %asi
	fcmple16	%f26,	%f22,	%i2
	fmovsleu	%xcc,	%f14,	%f22
	fpadd16s	%f19,	%f14,	%f18
	movl	%xcc,	%l6,	%i5
	edge16n	%g2,	%i7,	%l2
	fmovdvc	%icc,	%f31,	%f17
	fmovrdgz	%g6,	%f26,	%f14
	nop
	setx	loop_464,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	siam	0x4
	andn	%i4,	%i3,	%i6
	bg,a,pn	%xcc,	loop_465
loop_464:
	movvs	%xcc,	%g7,	%o4
	sethi	0x03C6,	%i1
	bcc	%xcc,	loop_466
loop_465:
	fmovsleu	%icc,	%f30,	%f26
	movne	%icc,	%l1,	%l5
	edge32n	%o2,	%o0,	%g5
loop_466:
	fors	%f24,	%f20,	%f22
	edge16l	%o3,	%o5,	%o1
	taddcc	%l3,	%i0,	%g3
	sll	%o7,	0x00,	%g1
	fnot1s	%f17,	%f5
	srlx	%l0,	%g4,	%o6
	subccc	%i2,	0x029A,	%l6
	fmovdcs	%icc,	%f10,	%f4
	edge32l	%l4,	%g2,	%i7
	fpackfix	%f8,	%f2
	orncc	%l2,	%i5,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0xe2,	%asi
	stba	%i4,	[%l7 + 0x10] %asi
	membar	#Sync
	fbe	%fcc3,	loop_467
	sth	%i6,	[%l7 + 0x76]
	ble	%xcc,	loop_468
	smulcc	%i3,	0x1FD7,	%g7
loop_467:
	subc	%o4,	0x1A3A,	%i1
	fbo,a	%fcc0,	loop_469
loop_468:
	sdivx	%l5,	0x184D,	%l1
	subcc	%o0,	%o2,	%o3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x34] %asi,	%o5
loop_469:
	tsubcc	%g5,	%l3,	%o1
	brgz,a	%g3,	loop_470
	fmovd	%f26,	%f24
	fpsub32	%f28,	%f8,	%f6
	srl	%o7,	0x02,	%i0
loop_470:
	fnand	%f6,	%f14,	%f28
	nop
	setx loop_471, %l0, %l1
	jmpl %l1, %g1
	fmovsl	%icc,	%f15,	%f14
	tle	%icc,	0x2
	edge8n	%l0,	%g4,	%o6
loop_471:
	add	%i2,	%l4,	%l6
	tcc	%icc,	0x7
	andncc	%g2,	%i7,	%i5
	lduh	[%l7 + 0x14],	%g6
	movrgez	%l2,	0x15C,	%i6
	ldsh	[%l7 + 0x5A],	%i4
	fcmple16	%f16,	%f30,	%i3
	tneg	%icc,	0x0
	fornot2	%f12,	%f28,	%f4
	movne	%icc,	%o4,	%g7
	smul	%i1,	%l5,	%o0
	tneg	%icc,	0x7
	xor	%l1,	%o2,	%o5
	movre	%g5,	%l3,	%o3
	fnot2s	%f24,	%f18
	set	0x50, %o6
	stwa	%o1,	[%l7 + %o6] 0xea
	membar	#Sync
	sir	0x1C6D
	tl	%icc,	0x0
	and	%g3,	0x0AFA,	%o7
	taddcc	%g1,	0x1671,	%i0
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x2C] %asi,	%g4
	subccc	%o6,	0x1BBA,	%i2
	addcc	%l0,	0x015B,	%l4
	pdist	%f30,	%f0,	%f2
	fbug	%fcc2,	loop_472
	fmovda	%icc,	%f24,	%f0
	fmovrsgez	%g2,	%f7,	%f22
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x88
loop_472:
	addccc	%i7,	%l6,	%i5
	and	%g6,	0x0052,	%i6
	be,pn	%xcc,	loop_473
	fmul8sux16	%f14,	%f22,	%f28
	andncc	%l2,	%i4,	%i3
	tgu	%xcc,	0x2
loop_473:
	te	%xcc,	0x0
	tleu	%icc,	0x3
	fxor	%f6,	%f22,	%f28
	ta	%icc,	0x2
	bn	loop_474
	movle	%xcc,	%g7,	%o4
	bcc,a	%icc,	loop_475
	stb	%i1,	[%l7 + 0x2D]
loop_474:
	bcs,a	%icc,	loop_476
	umulcc	%o0,	0x0349,	%l1
loop_475:
	tgu	%xcc,	0x4
	taddcc	%o2,	%l5,	%o5
loop_476:
	movvs	%xcc,	%l3,	%o3
	fbu,a	%fcc2,	loop_477
	fmuld8ulx16	%f27,	%f7,	%f18
	movre	%o1,	%g5,	%g3
	movle	%xcc,	%g1,	%o7
loop_477:
	flush	%l7 + 0x60
	wr	%g0,	0x23,	%asi
	stba	%g4,	[%l7 + 0x18] %asi
	membar	#Sync
	tge	%xcc,	0x2
	edge16l	%o6,	%i0,	%l0
	ta	%icc,	0x2
	movre	%i2,	0x1CC,	%l4
	faligndata	%f2,	%f10,	%f30
	smul	%i7,	0x1AC7,	%g2
	fmovsl	%xcc,	%f5,	%f5
	nop
	set	0x48, %l6
	ldsw	[%l7 + %l6],	%i5
	nop
	setx loop_478, %l0, %l1
	jmpl %l1, %l6
	edge16ln	%g6,	%l2,	%i4
	array32	%i6,	%i3,	%g7
	fxor	%f30,	%f20,	%f2
loop_478:
	fmovsvc	%icc,	%f22,	%f20
	ta	%icc,	0x1
	umul	%i1,	%o4,	%l1
	sethi	0x1E27,	%o0
	mova	%xcc,	%l5,	%o5
	movvs	%xcc,	%l3,	%o2
	sra	%o1,	0x0E,	%g5
	edge8	%g3,	%g1,	%o7
	sdivx	%g4,	0x16A3,	%o3
	brgez	%o6,	loop_479
	fsrc2	%f16,	%f28
	brgez	%l0,	loop_480
	movg	%xcc,	%i2,	%l4
loop_479:
	andncc	%i0,	%g2,	%i5
	fpadd16s	%f27,	%f24,	%f13
loop_480:
	movcs	%icc,	%l6,	%g6
	lduh	[%l7 + 0x26],	%l2
	te	%icc,	0x5
	fpsub16	%f18,	%f18,	%f10
	edge32n	%i7,	%i6,	%i3
	edge32ln	%g7,	%i1,	%i4
	subc	%l1,	%o4,	%l5
	sdiv	%o5,	0x0EE4,	%o0
	lduh	[%l7 + 0x1E],	%l3
	edge16l	%o1,	%o2,	%g5
	addc	%g1,	%g3,	%g4
	sdiv	%o7,	0x1AE0,	%o6
	movl	%xcc,	%l0,	%o3
	bpos	loop_481
	edge32n	%i2,	%l4,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f19,	%f28,	%f0
loop_481:
	sethi	0x0AD5,	%i5
	tg	%xcc,	0x3
	addc	%g2,	0x05A9,	%g6
	fmovse	%xcc,	%f1,	%f31
	fmovdcs	%icc,	%f9,	%f31
	stx	%l6,	[%l7 + 0x20]
	xnor	%i7,	%i6,	%l2
	smulcc	%g7,	%i1,	%i3
	bne,a	%xcc,	loop_482
	move	%xcc,	%l1,	%i4
	bvs	loop_483
	movle	%icc,	%l5,	%o4
loop_482:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x45] %asi,	%o5
loop_483:
	nop
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%l3
	movrlez	%o0,	%o2,	%g5
	brgez	%o1,	loop_484
	movg	%xcc,	%g3,	%g4
	andncc	%g1,	%o7,	%l0
	bvc,a	loop_485
loop_484:
	fnot1	%f18,	%f12
	tsubcctv	%o3,	%o6,	%i2
	sir	0x0BCA
loop_485:
	movn	%xcc,	%l4,	%i0
	xorcc	%i5,	%g6,	%g2
	membar	0x62
	udivcc	%i7,	0x1C32,	%l6
	andncc	%i6,	%g7,	%l2
	siam	0x2
	fbule,a	%fcc2,	loop_486
	fmovsneg	%icc,	%f25,	%f23
	and	%i3,	0x0FFF,	%l1
	tl	%xcc,	0x2
loop_486:
	tvc	%icc,	0x0
	addccc	%i1,	%i4,	%o4
	smul	%l5,	0x1E26,	%o5
	fabsd	%f6,	%f12
	movne	%xcc,	%l3,	%o0
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x0c,	%f16
	sllx	%g5,	%o2,	%g3
	xnorcc	%o1,	%g4,	%g1
	set	0x0E, %o5
	lduha	[%l7 + %o5] 0x15,	%o7
	fmovsvs	%xcc,	%f10,	%f16
	udivcc	%l0,	0x0662,	%o6
	move	%xcc,	%i2,	%o3
	sdivx	%i0,	0x1C20,	%l4
	membar	0x7E
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%i5,	[%g0 + 0x138] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	brgz,a	%g2,	loop_487
	taddcctv	%g6,	0x162C,	%i7
	fbne,a	%fcc1,	loop_488
	sdiv	%l6,	0x0C1C,	%g7
loop_487:
	movvc	%icc,	%i6,	%i3
	movrlez	%l1,	%l2,	%i4
loop_488:
	movpos	%icc,	%o4,	%i1
	flush	%l7 + 0x7C
	nop
	set	0x08, %l1
	ldd	[%l7 + %l1],	%l4
	fsrc1	%f26,	%f14
	ba	%icc,	loop_489
	edge16l	%l3,	%o5,	%o0
	faligndata	%f18,	%f26,	%f20
	sir	0x1534
loop_489:
	tleu	%xcc,	0x5
	std	%g4,	[%l7 + 0x38]
	movne	%icc,	%o2,	%g3
	faligndata	%f10,	%f20,	%f8
	xnorcc	%g4,	0x1E9C,	%o1
	movcs	%icc,	%g1,	%l0
	fbul,a	%fcc1,	loop_490
	movleu	%icc,	%o7,	%o6
	tsubcc	%o3,	%i2,	%l4
	sll	%i5,	%i0,	%g6
loop_490:
	fmovdgu	%xcc,	%f16,	%f11
	edge16ln	%i7,	%l6,	%g2
	bl	%xcc,	loop_491
	movgu	%xcc,	%g7,	%i6
	fmovdcs	%xcc,	%f27,	%f3
	movrlez	%i3,	0x124,	%l2
loop_491:
	udiv	%l1,	0x1CB6,	%i4
	bl,a,pn	%xcc,	loop_492
	fcmpne16	%f4,	%f14,	%i1
	fnand	%f30,	%f16,	%f26
	movre	%o4,	0x28E,	%l3
loop_492:
	udiv	%l5,	0x0DCB,	%o0
	edge32l	%g5,	%o2,	%g3
	movneg	%icc,	%o5,	%g4
	sll	%g1,	0x0D,	%l0
	addcc	%o7,	%o1,	%o6
	fbug	%fcc1,	loop_493
	add	%o3,	0x12C2,	%l4
	sub	%i5,	%i0,	%i2
	udivx	%g6,	0x1862,	%l6
loop_493:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x4C] %asi,	%i7
	movrne	%g2,	%g7,	%i6
	xor	%i3,	%l1,	%i4
	edge8n	%l2,	%o4,	%i1
	tsubcctv	%l3,	0x1F78,	%l5
	add	%g5,	0x1718,	%o0
	movg	%icc,	%g3,	%o2
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x19
	fpsub32s	%f9,	%f4,	%f12
	fandnot2	%f30,	%f2,	%f30
	movvc	%icc,	%o5,	%g1
	tle	%icc,	0x7
	movle	%xcc,	%l0,	%g4
	xnor	%o1,	%o7,	%o3
	movrgez	%o6,	0x16F,	%l4
	udivx	%i5,	0x0A09,	%i2
	movgu	%xcc,	%i0,	%l6
	fpsub16s	%f26,	%f14,	%f27
	tn	%xcc,	0x0
	udivcc	%i7,	0x0B07,	%g2
	edge8ln	%g7,	%g6,	%i6
	bge,a,pn	%icc,	loop_494
	tge	%xcc,	0x5
	wr	%g0,	0x88,	%asi
	stha	%l1,	[%l7 + 0x6E] %asi
loop_494:
	nop
	set	0x54, %g1
	lduha	[%l7 + %g1] 0x81,	%i3
	bg,a,pn	%xcc,	loop_495
	tpos	%xcc,	0x2
	mova	%xcc,	%l2,	%i4
	set	0x18, %l5
	ldxa	[%g0 + %l5] 0x58,	%o4
loop_495:
	subccc	%l3,	0x1553,	%i1
	tcs	%icc,	0x6
	udivcc	%l5,	0x0F21,	%o0
	xorcc	%g5,	%g3,	%o5
	prefetch	[%l7 + 0x34],	 0x2
	edge16ln	%o2,	%g1,	%l0
	lduh	[%l7 + 0x60],	%o1
	tge	%icc,	0x6
	ldstub	[%l7 + 0x27],	%g4
	alignaddr	%o7,	%o3,	%o6
	fpackfix	%f26,	%f9
	tvc	%icc,	0x3
	fba	%fcc1,	loop_496
	xorcc	%l4,	0x1727,	%i2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x2
loop_496:
	fmovrdlz	%l6,	%f4,	%f18
	andncc	%i5,	%i7,	%g7
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%g6
	fmuld8ulx16	%f29,	%f21,	%f28
	for	%f8,	%f14,	%f22
	srlx	%g2,	%i6,	%l1
	udivcc	%l2,	0x0E5B,	%i3
	set	0x68, %o2
	sta	%f2,	[%l7 + %o2] 0x81
	udivcc	%i4,	0x0C2B,	%l3
	fmovdvs	%xcc,	%f24,	%f6
	subc	%o4,	0x0168,	%l5
	movgu	%xcc,	%o0,	%i1
	stw	%g5,	[%l7 + 0x74]
	mulx	%o5,	%g3,	%g1
	andncc	%o2,	%l0,	%o1
	fbn,a	%fcc3,	loop_497
	edge32n	%g4,	%o7,	%o3
	bg,a	%icc,	loop_498
	ta	%xcc,	0x5
loop_497:
	udivx	%o6,	0x1391,	%l4
	edge32ln	%i0,	%i2,	%i5
loop_498:
	ldd	[%l7 + 0x60],	%f2
	srax	%l6,	%g7,	%g6
	orcc	%i7,	%g2,	%l1
	addccc	%i6,	%l2,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i3,	%o4
	subc	%l5,	%o0,	%i1
	brlz	%g5,	loop_499
	sth	%l3,	[%l7 + 0x50]
	fsrc2s	%f28,	%f24
	bcs	%icc,	loop_500
loop_499:
	tgu	%icc,	0x6
	addcc	%g3,	0x171B,	%o5
	fmovdle	%icc,	%f12,	%f16
loop_500:
	nop
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbul,a	%fcc3,	loop_501
	tpos	%icc,	0x1
	fmovscs	%xcc,	%f22,	%f26
	tvs	%icc,	0x7
loop_501:
	te	%icc,	0x2
	smul	%g1,	0x1828,	%l0
	fmovsle	%xcc,	%f28,	%f7
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	subcc	%o1,	%g4,	%o2
	tneg	%xcc,	0x3
	edge16l	%o3,	%o6,	%l4
	fmovrse	%i0,	%f5,	%f20
	fba,a	%fcc0,	loop_502
	ta	%icc,	0x3
	tneg	%icc,	0x2
	ldsw	[%l7 + 0x44],	%i2
loop_502:
	ba,pn	%icc,	loop_503
	array32	%o7,	%i5,	%l6
	movre	%g6,	%g7,	%i7
	tleu	%icc,	0x1
loop_503:
	fbu,a	%fcc0,	loop_504
	array32	%g2,	%l1,	%l2
	andcc	%i4,	%i3,	%o4
	movrlez	%i6,	%l5,	%i1
loop_504:
	fornot1s	%f13,	%f17,	%f26
	srax	%g5,	0x1F,	%o0
	taddcctv	%l3,	0x05E0,	%g3
	nop
	setx loop_505, %l0, %l1
	jmpl %l1, %g1
	edge8n	%o5,	%l0,	%g4
	fmovrsne	%o1,	%f23,	%f19
	ldsw	[%l7 + 0x38],	%o2
loop_505:
	and	%o6,	%o3,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f5,	%f28
	andncc	%i2,	%l4,	%i5
	membar	0x2C
	smulcc	%o7,	0x059D,	%g6
	ldsb	[%l7 + 0x2F],	%l6
	stw	%i7,	[%l7 + 0x74]
	fcmpeq16	%f30,	%f24,	%g7
	fmovscs	%icc,	%f26,	%f3
	fbne	%fcc0,	loop_506
	movrne	%l1,	%l2,	%g2
	movgu	%xcc,	%i4,	%o4
	fmovd	%f0,	%f2
loop_506:
	brz,a	%i3,	loop_507
	tcs	%xcc,	0x0
	srax	%i6,	0x14,	%l5
	tgu	%xcc,	0x2
loop_507:
	bvs	%xcc,	loop_508
	be,a,pn	%icc,	loop_509
	movleu	%icc,	%g5,	%i1
	fmovsneg	%xcc,	%f24,	%f23
loop_508:
	lduw	[%l7 + 0x7C],	%l3
loop_509:
	movgu	%xcc,	%o0,	%g3
	movneg	%icc,	%g1,	%l0
	add	%o5,	%o1,	%g4
	fbug,a	%fcc0,	loop_510
	fcmps	%fcc1,	%f0,	%f22
	ldsw	[%l7 + 0x10],	%o6
	set	0x78, %g5
	prefetcha	[%l7 + %g5] 0x14,	 0x1
loop_510:
	fcmpeq32	%f4,	%f20,	%i0
	tpos	%icc,	0x6
	movcc	%icc,	%i2,	%o3
	fmovsg	%icc,	%f17,	%f11
	smulcc	%l4,	%i5,	%o7
	wr	%g0,	0x11,	%asi
	sta	%f3,	[%l7 + 0x54] %asi
	fbge	%fcc2,	loop_511
	faligndata	%f2,	%f20,	%f12
	tsubcc	%l6,	%g6,	%i7
	fbe,a	%fcc1,	loop_512
loop_511:
	fmovrsgz	%g7,	%f18,	%f31
	sll	%l1,	0x19,	%l2
	xor	%g2,	0x0946,	%o4
loop_512:
	nop
	set	0x32, %g3
	ldsha	[%l7 + %g3] 0x89,	%i3
	movrlz	%i4,	0x2C3,	%i6
	set	0x4C, %l4
	lda	[%l7 + %l4] 0x80,	%f16
	tg	%icc,	0x5
	sdivx	%l5,	0x1A41,	%g5
	bcc,pn	%xcc,	loop_513
	smulcc	%i1,	0x16EF,	%o0
	udiv	%l3,	0x14F6,	%g3
	fexpand	%f15,	%f20
loop_513:
	mova	%icc,	%l0,	%o5
	fbl	%fcc2,	loop_514
	smul	%g1,	0x0DDB,	%g4
	tge	%icc,	0x4
	nop
	setx loop_515, %l0, %l1
	jmpl %l1, %o6
loop_514:
	ldsb	[%l7 + 0x1E],	%o1
	set	0x0C, %o3
	ldsha	[%l7 + %o3] 0x80,	%o2
loop_515:
	taddcctv	%i2,	%o3,	%i0
	umulcc	%i5,	0x1EFB,	%l4
	orn	%l6,	%o7,	%i7
	edge32l	%g6,	%l1,	%g7
	tle	%icc,	0x3
	sra	%l2,	0x03,	%g2
	tne	%xcc,	0x2
	popc	%o4,	%i4
	fpadd32	%f26,	%f22,	%f14
	tle	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i6,	0x1629,	%l5
	movre	%i3,	%g5,	%i1
	fbge	%fcc2,	loop_516
	fbo,a	%fcc2,	loop_517
	xor	%o0,	0x1CA8,	%l3
	lduw	[%l7 + 0x2C],	%g3
loop_516:
	tcc	%icc,	0x3
loop_517:
	fbl,a	%fcc3,	loop_518
	subccc	%o5,	0x06CB,	%g1
	movn	%xcc,	%g4,	%l0
	sir	0x1FCF
loop_518:
	fbul	%fcc3,	loop_519
	fmovde	%xcc,	%f10,	%f19
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
	tcc	%xcc,	0x1
loop_519:
	tl	%xcc,	0x2
	nop
	set	0x6A, %i0
	ldsb	[%l7 + %i0],	%o1
loop_520:
	bn,pt	%icc,	loop_521
	fcmpes	%fcc0,	%f22,	%f1
	fmul8x16au	%f1,	%f29,	%f12
	fnot2s	%f21,	%f1
loop_521:
	movl	%xcc,	%o2,	%o6
	movcc	%xcc,	%i2,	%i0
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	and	%l4,	0x0F78,	%i5
	fmovdcc	%icc,	%f0,	%f20
	fmovsleu	%xcc,	%f1,	%f17
	movrne	%l6,	0x1EA,	%o7
	bcs,pn	%icc,	loop_522
	movcc	%icc,	%i7,	%l1
	lduw	[%l7 + 0x78],	%g7
	movcc	%xcc,	%l2,	%g2
loop_522:
	fexpand	%f13,	%f0
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] %asi,	%g6,	%i4
	edge32	%o4,	%l5,	%i3
	udivcc	%g5,	0x1EEC,	%i1
	fmul8x16	%f8,	%f24,	%f28
	udivcc	%i6,	0x1E86,	%o0
	fabsd	%f16,	%f22
	set	0x0C, %l3
	lduwa	[%l7 + %l3] 0x0c,	%l3
	fmovs	%f13,	%f24
	fmul8x16al	%f1,	%f27,	%f30
	umul	%g3,	0x1D46,	%g1
	fcmps	%fcc2,	%f6,	%f0
	subcc	%g4,	0x1C1C,	%l0
	move	%xcc,	%o1,	%o5
	fcmpeq32	%f20,	%f30,	%o6
	tle	%icc,	0x7
	fcmps	%fcc1,	%f5,	%f22
	or	%i2,	0x1C21,	%i0
	addc	%o3,	0x1B4C,	%l4
	movrgz	%i5,	0x1AF,	%l6
	sdivx	%o7,	0x0559,	%i7
	fbu,a	%fcc0,	loop_523
	fors	%f19,	%f30,	%f5
	brlz,a	%l1,	loop_524
	bl,a,pn	%icc,	loop_525
loop_523:
	fbge	%fcc1,	loop_526
	udivcc	%g7,	0x17FF,	%o2
loop_524:
	smul	%l2,	0x1975,	%g2
loop_525:
	fpsub32s	%f6,	%f27,	%f17
loop_526:
	nop
	set	0x44, %g2
	ldstuba	[%l7 + %g2] 0x88,	%g6
	mulx	%o4,	0x0EB1,	%l5
	fxors	%f4,	%f0,	%f22
	fcmps	%fcc0,	%f30,	%f12
	fmovrdlez	%i4,	%f12,	%f28
	taddcctv	%i3,	%i1,	%i6
	stw	%g5,	[%l7 + 0x2C]
	tvc	%xcc,	0x3
	smul	%o0,	0x0B07,	%g3
	orncc	%l3,	0x0C9B,	%g4
	tg	%icc,	0x4
	prefetch	[%l7 + 0x54],	 0x3
	tcs	%xcc,	0x0
	fnand	%f26,	%f6,	%f16
	fcmpd	%fcc3,	%f6,	%f4
	ldsw	[%l7 + 0x14],	%g1
	fexpand	%f4,	%f22
	brlez	%l0,	loop_527
	tsubcctv	%o5,	%o1,	%o6
	fnor	%f6,	%f12,	%f16
	xnor	%i2,	%o3,	%l4
loop_527:
	orcc	%i0,	0x1930,	%l6
	ldub	[%l7 + 0x14],	%i5
	movge	%xcc,	%o7,	%i7
	stb	%l1,	[%l7 + 0x3C]
	edge8l	%o2,	%g7,	%g2
	sdivcc	%l2,	0x0B67,	%g6
	fmovsvc	%xcc,	%f27,	%f13
	tgu	%xcc,	0x5
	addcc	%o4,	%i4,	%l5
	subcc	%i1,	0x0588,	%i6
	tl	%icc,	0x5
	fcmpgt16	%f4,	%f16,	%g5
	tcs	%xcc,	0x7
	srlx	%i3,	0x17,	%o0
	tleu	%xcc,	0x1
	umulcc	%l3,	0x12A0,	%g3
	edge8n	%g1,	%l0,	%o5
	fandnot1s	%f8,	%f12,	%f6
	edge16n	%o1,	%o6,	%i2
	xorcc	%o3,	%l4,	%g4
	fmovrslez	%l6,	%f17,	%f21
	edge16n	%i5,	%o7,	%i7
	fcmpne32	%f6,	%f30,	%i0
	fmul8x16	%f12,	%f4,	%f2
	and	%l1,	0x0BBE,	%o2
	movleu	%icc,	%g2,	%l2
	ldd	[%l7 + 0x48],	%f16
	tne	%xcc,	0x5
	subc	%g7,	%o4,	%g6
	fmovdle	%icc,	%f15,	%f11
	subc	%l5,	%i1,	%i6
	umul	%i4,	0x0015,	%i3
	orn	%g5,	0x1CBF,	%o0
	tsubcc	%g3,	0x0B86,	%l3
	fxnor	%f22,	%f30,	%f16
	tge	%xcc,	0x4
	ble,a,pt	%xcc,	loop_528
	tne	%xcc,	0x2
	sll	%g1,	0x0D,	%o5
	edge32l	%l0,	%o1,	%i2
loop_528:
	tne	%xcc,	0x4
	wr	%g0,	0x80,	%asi
	stxa	%o3,	[%l7 + 0x70] %asi
	fmovrdne	%l4,	%f12,	%f10
	orn	%g4,	%l6,	%o6
	sdivcc	%i5,	0x138C,	%o7
	tge	%icc,	0x6
	addc	%i0,	%i7,	%l1
	flush	%l7 + 0x34
	sth	%g2,	[%l7 + 0x36]
	fornot1s	%f13,	%f3,	%f8
	tg	%icc,	0x1
	movne	%icc,	%o2,	%g7
	array8	%l2,	%o4,	%l5
	set	0x28, %o0
	swapa	[%l7 + %o0] 0x80,	%i1
	edge32ln	%i6,	%g6,	%i4
	movrlez	%i3,	%o0,	%g5
	movne	%xcc,	%l3,	%g3
	fcmple16	%f8,	%f18,	%o5
	tle	%icc,	0x6
	addccc	%g1,	%l0,	%i2
	taddcctv	%o3,	%l4,	%g4
	stw	%l6,	[%l7 + 0x0C]
	addc	%o1,	0x02A9,	%i5
	tsubcc	%o7,	%i0,	%i7
	tsubcctv	%l1,	0x094B,	%g2
	sdivx	%o2,	0x1CBE,	%o6
	subcc	%g7,	0x1320,	%o4
	fnot1	%f6,	%f18
	tle	%xcc,	0x1
	taddcctv	%l5,	%l2,	%i1
	tle	%icc,	0x2
	fnot2s	%f7,	%f16
	tleu	%xcc,	0x0
	movneg	%icc,	%i6,	%g6
	nop
	setx	loop_529,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	or	%i3,	%i4,	%g5
	be,pn	%icc,	loop_530
	srl	%l3,	0x1F,	%o0
loop_529:
	tpos	%icc,	0x2
	fpadd16	%f16,	%f6,	%f0
loop_530:
	udivcc	%g3,	0x1552,	%g1
	fmovsle	%xcc,	%f30,	%f14
	fmovsge	%xcc,	%f2,	%f29
	xor	%l0,	%i2,	%o5
	tcc	%icc,	0x3
	bne,pt	%icc,	loop_531
	ldsh	[%l7 + 0x7E],	%l4
	fsrc2s	%f8,	%f2
	fmovdl	%icc,	%f17,	%f12
loop_531:
	movg	%xcc,	%g4,	%l6
	edge16n	%o1,	%i5,	%o3
	bleu,a,pt	%xcc,	loop_532
	stw	%o7,	[%l7 + 0x54]
	sethi	0x1142,	%i7
	orn	%l1,	%i0,	%o2
loop_532:
	fnands	%f15,	%f16,	%f4
	tpos	%icc,	0x4
	st	%f20,	[%l7 + 0x58]
	udiv	%o6,	0x03D5,	%g2
	sdivcc	%g7,	0x1D8D,	%o4
	edge16	%l2,	%l5,	%i1
	tge	%xcc,	0x5
	smul	%g6,	0x019A,	%i6
	call	loop_533
	edge16	%i3,	%g5,	%l3
	sdivcc	%i4,	0x0D1B,	%g3
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_533:
	fmovdleu	%xcc,	%f18,	%f22
	bne,pn	%xcc,	loop_534
	membar	0x08
	set	0x50, %i6
	ldstuba	[%l7 + %i6] 0x0c,	%o0
loop_534:
	movre	%g1,	0x08E,	%l0
	fbn	%fcc0,	loop_535
	movrgz	%o5,	0x2F0,	%l4
	fabsd	%f20,	%f26
	fmovdne	%icc,	%f4,	%f9
loop_535:
	edge32ln	%i2,	%l6,	%o1
	tvs	%xcc,	0x4
	wr	%g0,	0x2f,	%asi
	stba	%i5,	[%l7 + 0x28] %asi
	membar	#Sync
	movg	%icc,	%o3,	%g4
	movn	%icc,	%o7,	%i7
	movg	%icc,	%i0,	%l1
	sllx	%o2,	0x12,	%g2
	mulscc	%g7,	0x0DA5,	%o4
	brgez	%o6,	loop_536
	addcc	%l2,	%i1,	%g6
	smul	%l5,	%i3,	%g5
	orcc	%l3,	0x07DB,	%i6
loop_536:
	bvs,a,pt	%icc,	loop_537
	movge	%xcc,	%i4,	%g3
	fmovsvc	%xcc,	%f0,	%f17
	lduh	[%l7 + 0x28],	%g1
loop_537:
	movrlz	%o0,	0x010,	%o5
	sdivx	%l4,	0x01AD,	%i2
	xorcc	%l6,	0x01B4,	%l0
	ldsh	[%l7 + 0x6E],	%i5
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x10] %asi,	%o2
	xnor	%g4,	0x0F8E,	%o1
	tsubcctv	%i7,	%o7,	%i0
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
	tcs	%xcc,	0x4
	fmovsg	%icc,	%f1,	%f29
	andncc	%l1,	%g2,	%o2
loop_538:
	movleu	%icc,	%g7,	%o4
	set	0x68, %g6
	stda	%o6,	[%l7 + %g6] 0x0c
	tvc	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i1,	%l2,	%l5
	fornot2s	%f7,	%f9,	%f18
	fpsub32s	%f26,	%f26,	%f26
	fcmpgt32	%f0,	%f4,	%i3
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tle	%xcc,	0x1
	smul	%g6,	0x0EC4,	%g5
	wr	%g0,	0x27,	%asi
	stda	%l2,	[%l7 + 0x50] %asi
	membar	#Sync
	mova	%xcc,	%i4,	%i6
	fexpand	%f22,	%f8
	add	%g1,	%o0,	%o5
	movrlez	%g3,	0x0BB,	%i2
	fmovsneg	%icc,	%f23,	%f7
	umul	%l6,	%l0,	%l4
	move	%xcc,	%o3,	%i5
	fblg,a	%fcc2,	loop_539
	bneg,a,pt	%xcc,	loop_540
	sethi	0x19D3,	%o1
	bge,a,pt	%xcc,	loop_541
loop_539:
	fmovsgu	%icc,	%f23,	%f9
loop_540:
	array8	%i7,	%o7,	%g4
	edge8	%l1,	%g2,	%o2
loop_541:
	ldx	[%l7 + 0x30],	%g7
	udivcc	%o4,	0x00C9,	%o6
	nop
	setx	loop_542,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrse	%i0,	%f6,	%f28
	call	loop_543
	and	%i1,	0x1CDA,	%l2
loop_542:
	sra	%l5,	%i3,	%g6
	fcmpgt16	%f10,	%f10,	%g5
loop_543:
	andn	%i4,	%l3,	%g1
	movpos	%xcc,	%o0,	%i6
	movpos	%xcc,	%g3,	%o5
	fcmple32	%f8,	%f8,	%l6
	tne	%xcc,	0x1
	fmuld8sux16	%f8,	%f15,	%f14
	bpos	loop_544
	ldsh	[%l7 + 0x4E],	%l0
	ba,a,pn	%xcc,	loop_545
	membar	0x3F
loop_544:
	fmovscc	%icc,	%f9,	%f15
	stw	%l4,	[%l7 + 0x38]
loop_545:
	move	%icc,	%i2,	%o3
	movrgz	%o1,	0x1B5,	%i7
	sll	%o7,	0x02,	%g4
	sdivcc	%i5,	0x0214,	%l1
	subccc	%g2,	%o2,	%o4
	set	0x5C, %i1
	ldsba	[%l7 + %i1] 0x11,	%g7
	array8	%o6,	%i1,	%i0
	fors	%f29,	%f12,	%f10
	sdiv	%l2,	0x0E76,	%i3
	brgz	%g6,	loop_546
	movneg	%icc,	%l5,	%i4
	set	0x14, %g4
	ldswa	[%l7 + %g4] 0x0c,	%l3
loop_546:
	popc	0x10D2,	%g5
	add	%o0,	%i6,	%g1
	set	0x20, %g7
	ldda	[%l7 + %g7] 0x11,	%g2
	fmovrde	%l6,	%f8,	%f26
	fmovdle	%xcc,	%f23,	%f17
	tne	%icc,	0x0
	brgez,a	%l0,	loop_547
	movre	%l4,	0x0D1,	%i2
	set	0x5F, %i2
	ldstuba	[%l7 + %i2] 0x10,	%o3
loop_547:
	fblg	%fcc2,	loop_548
	brlz	%o1,	loop_549
	movleu	%icc,	%i7,	%o7
	edge8	%g4,	%o5,	%i5
loop_548:
	fbl,a	%fcc3,	loop_550
loop_549:
	subcc	%g2,	0x15B7,	%l1
	edge8	%o4,	%o2,	%o6
	movpos	%icc,	%g7,	%i1
loop_550:
	movg	%icc,	%l2,	%i3
	ldsw	[%l7 + 0x44],	%i0
	fbule	%fcc1,	loop_551
	ldsb	[%l7 + 0x72],	%l5
	movne	%icc,	%i4,	%g6
	movrne	%g5,	%l3,	%o0
loop_551:
	fmovscs	%xcc,	%f4,	%f3
	fbne	%fcc0,	loop_552
	fmovrdne	%i6,	%f8,	%f8
	bvs,a,pt	%xcc,	loop_553
	movvs	%icc,	%g1,	%l6
loop_552:
	movpos	%xcc,	%l0,	%g3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
loop_553:
	nop
	set	0x40, %o1
	ldswa	[%l7 + %o1] 0x0c,	%o3
	fmovsgu	%icc,	%f15,	%f5
	ldd	[%l7 + 0x78],	%f20
	fone	%f18
	fmovsneg	%icc,	%f10,	%f30
	set	0x18, %i4
	stxa	%i2,	[%l7 + %i4] 0x22
	membar	#Sync
	orncc	%o1,	0x05CF,	%o7
	tn	%icc,	0x6
	array32	%i7,	%g4,	%i5
	tcc	%icc,	0x0
	fmovde	%icc,	%f26,	%f30
	bvc	%xcc,	loop_554
	std	%f22,	[%l7 + 0x50]
	fbug,a	%fcc2,	loop_555
	fmovdn	%icc,	%f10,	%f9
loop_554:
	fmovsne	%icc,	%f5,	%f13
	tgu	%xcc,	0x7
loop_555:
	fsrc2	%f6,	%f2
	movpos	%icc,	%o5,	%l1
	fmovrdne	%o4,	%f12,	%f12
	movgu	%xcc,	%o2,	%o6
	fnor	%f2,	%f6,	%f28
	fzero	%f28
	mulx	%g2,	0x00C7,	%i1
	orn	%l2,	0x170F,	%i3
	prefetch	[%l7 + 0x40],	 0x3
	fbn	%fcc2,	loop_556
	pdist	%f10,	%f24,	%f0
	stx	%g7,	[%l7 + 0x30]
	array16	%i0,	%i4,	%g6
loop_556:
	bg,a,pn	%xcc,	loop_557
	tvs	%xcc,	0x3
	mulx	%g5,	%l5,	%l3
	taddcctv	%i6,	%o0,	%g1
loop_557:
	movcc	%icc,	%l6,	%g3
	fsrc2s	%f23,	%f7
	tsubcc	%l0,	0x1EC6,	%l4
	movcs	%icc,	%o3,	%o1
	ldd	[%l7 + 0x28],	%i2
	udivx	%o7,	0x00F6,	%g4
	add	%i7,	0x1193,	%o5
	sub	%i5,	%l1,	%o4
	tvs	%xcc,	0x5
	movcs	%xcc,	%o2,	%g2
	orncc	%i1,	0x1E10,	%o6
	movrlz	%i3,	%g7,	%i0
	fmovda	%xcc,	%f20,	%f10
	nop
	setx loop_558, %l0, %l1
	jmpl %l1, %i4
	bvs	loop_559
	movrne	%g6,	0x18D,	%l2
	fandnot2	%f10,	%f2,	%f6
loop_558:
	xnorcc	%g5,	0x1AB9,	%l3
loop_559:
	sethi	0x1A11,	%l5
	sub	%i6,	0x01C5,	%g1
	fmovdgu	%icc,	%f24,	%f29
	set	0x60, %i3
	ldda	[%l7 + %i3] 0x88,	%o0
	fbu	%fcc1,	loop_560
	movn	%icc,	%g3,	%l6
	fnot2s	%f3,	%f18
	fors	%f13,	%f31,	%f17
loop_560:
	fbge	%fcc0,	loop_561
	movneg	%xcc,	%l4,	%l0
	membar	0x6B
	tne	%icc,	0x3
loop_561:
	srax	%o3,	%i2,	%o1
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldd	[%l7 + 0x40],	%f6
	set	0x60, %l2
	stxa	%g4,	[%l7 + %l2] 0x11
	subcc	%o7,	%i7,	%i5
	fmovdcc	%xcc,	%f0,	%f17
	addccc	%o5,	0x0E21,	%o4
	fsrc2	%f18,	%f24
	alignaddrl	%l1,	%g2,	%i1
	fcmpgt16	%f28,	%f6,	%o6
	fpsub32	%f16,	%f28,	%f20
	fnand	%f26,	%f0,	%f14
	subccc	%i3,	0x0D72,	%g7
	addccc	%i0,	0x1961,	%i4
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x34] %asi,	%o2
	fpackfix	%f22,	%f14
	fbl	%fcc2,	loop_562
	tleu	%xcc,	0x4
	fbn,a	%fcc2,	loop_563
	bvc,a	loop_564
loop_562:
	fxnor	%f18,	%f22,	%f0
	tsubcc	%l2,	0x0EBB,	%g6
loop_563:
	andncc	%l3,	%l5,	%i6
loop_564:
	movvs	%icc,	%g5,	%o0
	andcc	%g1,	%g3,	%l4
	edge16ln	%l6,	%l0,	%o3
	bleu,a,pt	%icc,	loop_565
	fmovdgu	%icc,	%f28,	%f30
	orcc	%i2,	0x091F,	%o1
	tge	%icc,	0x5
loop_565:
	edge16l	%g4,	%o7,	%i7
	bcs,pt	%xcc,	loop_566
	addc	%i5,	%o4,	%l1
	sub	%g2,	%o5,	%o6
	pdist	%f18,	%f20,	%f24
loop_566:
	smulcc	%i1,	0x01BC,	%g7
	fmovrdne	%i3,	%f26,	%f16
	tcs	%icc,	0x5
	edge8ln	%i0,	%o2,	%l2
	ldub	[%l7 + 0x3F],	%g6
	movle	%xcc,	%l3,	%l5
	fornot1s	%f13,	%f26,	%f20
	andncc	%i4,	%i6,	%g5
	orn	%o0,	%g1,	%g3
	alignaddrl	%l4,	%l6,	%l0
	tsubcc	%o3,	0x0B9E,	%o1
	fornot2s	%f25,	%f31,	%f19
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fzero	%f26
	fornot2s	%f10,	%f19,	%f15
	umul	%g4,	%o7,	%i2
	movrlez	%i5,	%o4,	%i7
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x78] %asi,	%g2
	bneg,pn	%icc,	loop_567
	bvs,pt	%icc,	loop_568
	bn,a,pn	%icc,	loop_569
	tcs	%xcc,	0x7
loop_567:
	xor	%l1,	0x0683,	%o6
loop_568:
	andcc	%i1,	0x035F,	%o5
loop_569:
	nop
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	fnot2s	%f21,	%f19
	set	0x72, %o7
	stha	%i0,	[%l7 + %o7] 0x04
	subc	%o2,	%i3,	%l2
	tvs	%icc,	0x0
	tneg	%xcc,	0x2
	fbg,a	%fcc0,	loop_570
	xorcc	%l3,	%g6,	%i4
	te	%icc,	0x6
	xor	%l5,	%g5,	%o0
loop_570:
	fmovrsne	%g1,	%f13,	%f1
	array32	%g3,	%i6,	%l4
	fmovrsgez	%l0,	%f9,	%f5
	edge32ln	%o3,	%l6,	%o1
	popc	0x0943,	%g4
	set	0x58, %o6
	ldxa	[%l7 + %o6] 0x19,	%o7
	movvs	%icc,	%i5,	%i2
	alignaddrl	%i7,	%o4,	%l1
	fcmpes	%fcc3,	%f26,	%f31
	fcmpeq16	%f0,	%f18,	%g2
	bcs,a,pn	%xcc,	loop_571
	fmovrdgz	%o6,	%f0,	%f2
	fnegs	%f19,	%f11
	fbule	%fcc1,	loop_572
loop_571:
	umul	%i1,	%g7,	%i0
	tl	%icc,	0x4
	st	%f2,	[%l7 + 0x78]
loop_572:
	srlx	%o2,	0x00,	%o5
	and	%i3,	0x1984,	%l3
	tvs	%icc,	0x5
	movvs	%icc,	%g6,	%l2
	brnz,a	%i4,	loop_573
	bcs,a	%xcc,	loop_574
	array8	%g5,	%o0,	%l5
	bge,pn	%xcc,	loop_575
loop_573:
	tn	%icc,	0x5
loop_574:
	ldsh	[%l7 + 0x28],	%g1
	edge16l	%i6,	%l4,	%l0
loop_575:
	fcmpd	%fcc1,	%f4,	%f6
	sethi	0x050B,	%g3
	movpos	%xcc,	%l6,	%o3
	movleu	%xcc,	%o1,	%g4
	tvc	%xcc,	0x4
	fbule,a	%fcc0,	loop_576
	udivx	%i5,	0x0B42,	%o7
	fmovdpos	%icc,	%f11,	%f23
	edge8ln	%i2,	%o4,	%l1
loop_576:
	fbu	%fcc0,	loop_577
	flush	%l7 + 0x40
	addccc	%g2,	%i7,	%o6
	orcc	%g7,	%i0,	%o2
loop_577:
	movg	%xcc,	%i1,	%i3
	subc	%l3,	0x0F82,	%o5
	orcc	%l2,	%i4,	%g6
	fabsd	%f30,	%f6
	fpsub32s	%f20,	%f2,	%f29
	popc	0x15AC,	%o0
	xor	%l5,	0x0641,	%g5
	bge,a,pt	%xcc,	loop_578
	tl	%xcc,	0x4
	stw	%i6,	[%l7 + 0x40]
	alignaddr	%g1,	%l4,	%g3
loop_578:
	fbn	%fcc1,	loop_579
	movcc	%xcc,	%l0,	%o3
	movpos	%icc,	%o1,	%g4
	sethi	0x0E41,	%i5
loop_579:
	movvs	%icc,	%l6,	%o7
	fmovrde	%i2,	%f26,	%f24
	mulscc	%l1,	%g2,	%o4
	addcc	%i7,	%g7,	%i0
	edge32l	%o2,	%i1,	%i3
	orcc	%l3,	0x068D,	%o5
	be,pn	%xcc,	loop_580
	fmovdvs	%icc,	%f26,	%f20
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xe2,	%l2
loop_580:
	tne	%icc,	0x4
	sdivcc	%i4,	0x08BD,	%o6
	fba,a	%fcc2,	loop_581
	edge16n	%o0,	%l5,	%g6
	set	0x70, %l6
	ldxa	[%l7 + %l6] 0x80,	%i6
loop_581:
	swap	[%l7 + 0x4C],	%g1
	fpmerge	%f10,	%f28,	%f16
	movleu	%xcc,	%g5,	%l4
	sll	%g3,	0x14,	%l0
	tvs	%xcc,	0x4
	flush	%l7 + 0x40
	movrlz	%o3,	%o1,	%i5
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x0C] %asi,	%f25
	edge16ln	%g4,	%l6,	%o7
	bg,a,pt	%xcc,	loop_582
	brlz	%l1,	loop_583
	subcc	%i2,	0x175F,	%o4
	fmovdneg	%icc,	%f24,	%f13
loop_582:
	smulcc	%i7,	0x00C2,	%g2
loop_583:
	bne,pn	%xcc,	loop_584
	fsrc2s	%f15,	%f6
	edge16	%i0,	%o2,	%g7
	bgu	%xcc,	loop_585
loop_584:
	movrgez	%i1,	0x371,	%l3
	taddcc	%o5,	0x16AC,	%l2
	fbug	%fcc1,	loop_586
loop_585:
	fmovrslez	%i3,	%f22,	%f20
	fbue,a	%fcc0,	loop_587
	fmovsge	%xcc,	%f22,	%f10
loop_586:
	fbo	%fcc0,	loop_588
	edge8n	%o6,	%o0,	%i4
loop_587:
	ldd	[%l7 + 0x68],	%g6
	bl	%icc,	loop_589
loop_588:
	tcc	%xcc,	0x0
	set	0x10, %l0
	ldda	[%l7 + %l0] 0x14,	%i6
loop_589:
	fbn,a	%fcc0,	loop_590
	sra	%g1,	0x04,	%l5
	fmul8sux16	%f6,	%f0,	%f6
	sll	%l4,	0x1D,	%g5
loop_590:
	tcc	%xcc,	0x1
	xnorcc	%l0,	%g3,	%o1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%o3
	membar	0x40
	edge32l	%i5,	%g4,	%l6
	fblg,a	%fcc2,	loop_591
	edge8l	%l1,	%o7,	%o4
	fbuge	%fcc0,	loop_592
	bshuffle	%f18,	%f26,	%f24
loop_591:
	movcc	%xcc,	%i7,	%g2
	fbl,a	%fcc3,	loop_593
loop_592:
	movrgz	%i2,	%o2,	%i0
	or	%g7,	0x15E1,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_593:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x0
	set	0x20, %o5
	ldswa	[%l7 + %o5] 0x15,	%o5
	sdivx	%l2,	0x067B,	%l3
	taddcctv	%o6,	0x1DC2,	%i3
	ld	[%l7 + 0x18],	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o0,	%i4,	%g6
	lduh	[%l7 + 0x0A],	%i6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%g1
	movvs	%xcc,	%l5,	%g5
	fmul8x16	%f11,	%f24,	%f2
	tle	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x43] %asi,	%l4
	fsrc2s	%f20,	%f10
	ld	[%l7 + 0x3C],	%f25
	fbug,a	%fcc0,	loop_594
	orncc	%g3,	0x0400,	%o1
	fbu,a	%fcc0,	loop_595
	movvs	%icc,	%o3,	%i5
loop_594:
	fpsub32	%f14,	%f12,	%f16
	fabsd	%f20,	%f8
loop_595:
	move	%xcc,	%l0,	%l6
	array32	%l1,	%g4,	%o7
	set	0x70, %l1
	lduwa	[%l7 + %l1] 0x10,	%i7
	fones	%f14
	movre	%o4,	%g2,	%o2
	andcc	%i2,	0x0A51,	%g7
	addc	%i1,	%i0,	%l2
	set	0x64, %o4
	sta	%f28,	[%l7 + %o4] 0x89
	fcmpne32	%f22,	%f12,	%o5
	edge16l	%o6,	%l3,	%o0
	tne	%xcc,	0x6
	add	%i4,	%g6,	%i3
	set	0x48, %g1
	ldsba	[%l7 + %g1] 0x14,	%g1
	tgu	%xcc,	0x6
	add	%l5,	%g5,	%l4
	membar	0x2F
	edge32n	%g3,	%i6,	%o3
	xor	%i5,	0x1E00,	%l0
	array8	%o1,	%l1,	%g4
	fpsub16	%f4,	%f12,	%f28
	fcmps	%fcc3,	%f31,	%f4
	movn	%icc,	%o7,	%i7
	movleu	%icc,	%l6,	%g2
	sll	%o2,	0x0F,	%o4
	addccc	%g7,	%i1,	%i2
	subccc	%l2,	0x079A,	%i0
	bne	loop_596
	fandnot1s	%f9,	%f16,	%f22
	tgu	%xcc,	0x2
	fblg,a	%fcc1,	loop_597
loop_596:
	faligndata	%f12,	%f6,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o6,	%o5,	%l3
loop_597:
	edge8l	%o0,	%g6,	%i3
	edge8	%g1,	%i4,	%g5
	tl	%icc,	0x7
	edge8	%l4,	%l5,	%g3
	and	%i6,	%o3,	%l0
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x7C] %asi,	%i5
	sra	%o1,	0x17,	%l1
	fmul8x16	%f13,	%f20,	%f24
	sethi	0x1E0C,	%o7
	fbg	%fcc2,	loop_598
	fmovdcc	%xcc,	%f19,	%f2
	andncc	%i7,	%g4,	%l6
	mulx	%g2,	0x02AE,	%o2
loop_598:
	bge,a	%icc,	loop_599
	subccc	%g7,	0x019E,	%i1
	sdivx	%i2,	0x0429,	%o4
	tleu	%xcc,	0x6
loop_599:
	movvc	%icc,	%l2,	%i0
	fmovs	%f7,	%f20
	ld	[%l7 + 0x0C],	%f24
	fbl	%fcc0,	loop_600
	fmovsle	%icc,	%f10,	%f25
	and	%o6,	%l3,	%o0
	fornot2	%f10,	%f6,	%f4
loop_600:
	fmovdn	%icc,	%f12,	%f18
	fornot1	%f10,	%f2,	%f4
	subcc	%o5,	%g6,	%g1
	movgu	%icc,	%i4,	%i3
	orncc	%g5,	0x1407,	%l5
	call	loop_601
	edge32ln	%g3,	%l4,	%i6
	edge8l	%o3,	%i5,	%l0
	sub	%l1,	%o1,	%i7
loop_601:
	edge16n	%o7,	%g4,	%g2
	edge8	%o2,	%l6,	%g7
	fbug,a	%fcc3,	loop_602
	fmul8sux16	%f0,	%f30,	%f28
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i1,	%i2
loop_602:
	bgu,a	loop_603
	fmuld8ulx16	%f6,	%f23,	%f22
	popc	%o4,	%i0
	tneg	%xcc,	0x2
loop_603:
	fnands	%f22,	%f7,	%f21
	alignaddrl	%o6,	%l3,	%l2
	tcc	%xcc,	0x0
	movneg	%xcc,	%o5,	%o0
	fmovrslez	%g6,	%f8,	%f18
	tleu	%icc,	0x2
	tg	%icc,	0x7
	bvc	%icc,	loop_604
	fandnot2	%f14,	%f22,	%f24
	udivx	%i4,	0x02E4,	%i3
	fmovdvs	%xcc,	%f17,	%f26
loop_604:
	addcc	%g5,	0x1C2C,	%g1
	fxnors	%f12,	%f29,	%f12
	alignaddrl	%g3,	%l4,	%i6
	mulscc	%o3,	%i5,	%l5
	tcc	%icc,	0x7
	sir	0x0E24
	fmovrdgez	%l0,	%f30,	%f18
	edge32	%l1,	%i7,	%o1
	array8	%g4,	%g2,	%o7
	fcmps	%fcc0,	%f11,	%f9
	edge8n	%o2,	%l6,	%g7
	ta	%xcc,	0x1
	fmovrsgez	%i1,	%f31,	%f6
	tsubcc	%i2,	%o4,	%i0
	addccc	%o6,	%l2,	%o5
	brgz,a	%o0,	loop_605
	ldx	[%l7 + 0x58],	%l3
	movcc	%xcc,	%g6,	%i4
	tsubcc	%i3,	0x073C,	%g5
loop_605:
	fbne	%fcc2,	loop_606
	bleu	%xcc,	loop_607
	fmovspos	%icc,	%f0,	%f6
	movre	%g1,	0x38B,	%l4
loop_606:
	tleu	%xcc,	0x7
loop_607:
	fnor	%f8,	%f18,	%f0
	ta	%xcc,	0x1
	be,pt	%icc,	loop_608
	tcc	%icc,	0x7
	smul	%i6,	%g3,	%o3
	taddcctv	%i5,	0x1F7B,	%l5
loop_608:
	sub	%l1,	%i7,	%o1
	array8	%l0,	%g2,	%g4
	fpadd16s	%f10,	%f17,	%f26
	wr	%g0,	0xe2,	%asi
	stwa	%o7,	[%l7 + 0x60] %asi
	membar	#Sync
	xnor	%o2,	%l6,	%i1
	fmovdcc	%xcc,	%f6,	%f13
	fmuld8ulx16	%f20,	%f12,	%f20
	udivcc	%g7,	0x16BC,	%o4
	set	0x10, %l5
	stda	%i2,	[%l7 + %l5] 0x81
	addc	%i0,	0x090B,	%l2
	bleu	%icc,	loop_609
	tleu	%xcc,	0x3
	set	0x5E, %i7
	ldsha	[%l7 + %i7] 0x88,	%o5
loop_609:
	add	%o0,	%l3,	%o6
	tcc	%xcc,	0x3
	sdiv	%i4,	0x0A0A,	%g6
	fpsub32s	%f3,	%f20,	%f21
	taddcctv	%g5,	%i3,	%l4
	alignaddrl	%i6,	%g3,	%g1
	nop
	setx	loop_610,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stw	%o3,	[%l7 + 0x74]
	movre	%i5,	%l5,	%l1
	ta	%xcc,	0x3
loop_610:
	brgz,a	%i7,	loop_611
	ld	[%l7 + 0x34],	%f14
	movle	%icc,	%o1,	%l0
	ldub	[%l7 + 0x5A],	%g4
loop_611:
	tcs	%xcc,	0x6
	and	%o7,	%g2,	%o2
	movge	%xcc,	%l6,	%i1
	addcc	%o4,	%i2,	%i0
	alignaddr	%g7,	%l2,	%o0
	ldsw	[%l7 + 0x20],	%o5
	fba	%fcc3,	loop_612
	andn	%o6,	0x1281,	%i4
	fmovdvs	%icc,	%f8,	%f10
	fnot1s	%f30,	%f31
loop_612:
	movge	%icc,	%l3,	%g6
	brgez	%i3,	loop_613
	fmovrsgez	%g5,	%f3,	%f1
	mulx	%i6,	%g3,	%g1
	fmovspos	%xcc,	%f2,	%f7
loop_613:
	fbo	%fcc2,	loop_614
	membar	0x22
	srl	%l4,	%o3,	%i5
	ldd	[%l7 + 0x78],	%l0
loop_614:
	fpadd16	%f16,	%f8,	%f8
	set	0x1A, %g5
	lduha	[%l7 + %g5] 0x88,	%l5
	movgu	%xcc,	%i7,	%o1
	tsubcc	%g4,	0x097B,	%l0
	te	%xcc,	0x7
	set	0x60, %o2
	lda	[%l7 + %o2] 0x81,	%f23
	orn	%o7,	%g2,	%l6
	tsubcc	%i1,	0x1865,	%o4
	tgu	%icc,	0x5
	tpos	%xcc,	0x0
	tpos	%xcc,	0x7
	nop
	setx	loop_615,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	st	%f4,	[%l7 + 0x30]
	fba,a	%fcc3,	loop_616
	fabsd	%f24,	%f2
loop_615:
	te	%icc,	0x6
	tgu	%icc,	0x0
loop_616:
	ta	%xcc,	0x0
	sra	%i2,	0x1A,	%o2
	edge16ln	%g7,	%i0,	%o0
	sra	%o5,	0x18,	%o6
	orcc	%i4,	%l3,	%l2
	movge	%xcc,	%g6,	%i3
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
	addccc	%i6,	%g3,	%g5
	andncc	%l4,	%g1,	%o3
	udivcc	%l1,	0x1011,	%l5
loop_617:
	smulcc	%i7,	%i5,	%o1
	wr	%g0,	0x2b,	%asi
	stxa	%l0,	[%l7 + 0x30] %asi
	membar	#Sync
	set	0x68, %g3
	lduwa	[%l7 + %g3] 0x81,	%o7
	movle	%icc,	%g2,	%l6
	movrlz	%g4,	%o4,	%i2
	or	%o2,	%i1,	%i0
	srlx	%g7,	0x0E,	%o0
	fmovdg	%icc,	%f13,	%f3
	ldub	[%l7 + 0x3B],	%o5
	tvs	%xcc,	0x1
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%i4
	fpadd16s	%f28,	%f21,	%f1
	te	%xcc,	0x7
	movge	%icc,	%o6,	%l3
	edge16l	%l2,	%i3,	%g6
	tvc	%icc,	0x0
	fone	%f12
	sllx	%i6,	%g3,	%g5
	set	0x24, %o3
	stwa	%l4,	[%l7 + %o3] 0x80
	movpos	%xcc,	%o3,	%l1
	wr	%g0,	0x80,	%asi
	stwa	%l5,	[%l7 + 0x28] %asi
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%g1,	%i7
	udivx	%i5,	0x1CFE,	%l0
	smulcc	%o7,	%g2,	%o1
	movcs	%icc,	%g4,	%l6
	fmul8x16	%f0,	%f8,	%f30
	nop
	setx	loop_618,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%i2,	%o4,	%o2
	fpsub32	%f12,	%f22,	%f18
	array32	%i0,	%i1,	%o0
loop_618:
	mova	%xcc,	%g7,	%o5
	movne	%icc,	%o6,	%i4
	xnor	%l2,	%l3,	%g6
	addccc	%i3,	%i6,	%g3
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x14] %asi,	%l4
	tpos	%xcc,	0x1
	fmovse	%xcc,	%f28,	%f10
	move	%icc,	%o3,	%g5
	sir	0x04ED
	fmovsge	%xcc,	%f2,	%f28
	fpack16	%f18,	%f30
	fexpand	%f15,	%f20
	fmovsvs	%xcc,	%f7,	%f16
	sdivcc	%l1,	0x092C,	%g1
	sra	%i7,	0x0F,	%i5
	tvc	%xcc,	0x2
	addccc	%l0,	0x030C,	%l5
	ldsh	[%l7 + 0x50],	%g2
	movge	%xcc,	%o1,	%g4
	srax	%o7,	%i2,	%l6
	bvc,pn	%icc,	loop_619
	edge16l	%o4,	%o2,	%i1
	swap	[%l7 + 0x2C],	%i0
	fxors	%f24,	%f29,	%f6
loop_619:
	fmovsl	%xcc,	%f20,	%f21
	udivcc	%g7,	0x1F00,	%o0
	srl	%o6,	%o5,	%i4
	fcmpd	%fcc0,	%f30,	%f18
	movleu	%xcc,	%l2,	%l3
	ldsb	[%l7 + 0x56],	%i3
	tle	%xcc,	0x6
	alignaddr	%i6,	%g3,	%l4
	stx	%o3,	[%l7 + 0x40]
	fcmpne32	%f14,	%f14,	%g6
	udivx	%g5,	0x1D74,	%g1
	siam	0x1
	sdiv	%l1,	0x1F73,	%i7
	lduw	[%l7 + 0x2C],	%i5
	taddcc	%l5,	0x1BF9,	%l0
	tvc	%xcc,	0x5
	add	%o1,	%g2,	%o7
	tge	%xcc,	0x4
	bg	%icc,	loop_620
	subc	%g4,	0x071A,	%l6
	srl	%i2,	0x02,	%o4
	fpsub32	%f20,	%f8,	%f8
loop_620:
	srlx	%i1,	%i0,	%o2
	bshuffle	%f8,	%f30,	%f8
	tvs	%icc,	0x3
	movre	%g7,	0x1E7,	%o0
	bg,pn	%icc,	loop_621
	edge32l	%o6,	%i4,	%l2
	andncc	%l3,	%i3,	%i6
	ldd	[%l7 + 0x38],	%f8
loop_621:
	edge8l	%g3,	%o5,	%o3
	umul	%g6,	0x15F4,	%l4
	subccc	%g1,	0x0747,	%g5
	mova	%icc,	%i7,	%i5
	fmovd	%f30,	%f10
	udiv	%l1,	0x03A3,	%l0
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x2
	edge8ln	%o1,	%g2,	%g4
	brgz,a	%o7,	loop_622
	array32	%i2,	%o4,	%l6
	fbg,a	%fcc0,	loop_623
	movgu	%icc,	%i1,	%i0
loop_622:
	fmovde	%icc,	%f2,	%f27
	tge	%icc,	0x0
loop_623:
	movge	%icc,	%g7,	%o0
	fnor	%f2,	%f26,	%f22
	edge32l	%o2,	%o6,	%i4
	edge8n	%l2,	%i3,	%l3
	fpsub32s	%f15,	%f25,	%f25
	fcmps	%fcc3,	%f17,	%f27
	fbug	%fcc0,	loop_624
	fornot2s	%f1,	%f23,	%f26
	fornot1	%f26,	%f16,	%f2
	sir	0x0FB7
loop_624:
	lduw	[%l7 + 0x2C],	%i6
	stb	%o5,	[%l7 + 0x61]
	orcc	%o3,	%g3,	%g6
	sethi	0x16C4,	%l4
	sdivcc	%g5,	0x0119,	%i7
	sllx	%i5,	0x1D,	%g1
	edge32	%l0,	%l1,	%l5
	fornot2	%f0,	%f28,	%f2
	tl	%icc,	0x1
	movrlez	%o1,	0x0C8,	%g2
	fbu	%fcc1,	loop_625
	udivx	%g4,	0x0834,	%i2
	nop
	setx loop_626, %l0, %l1
	jmpl %l1, %o4
	movrlz	%l6,	0x1B5,	%o7
loop_625:
	tsubcc	%i0,	0x07EF,	%g7
	set	0x28, %i0
	stwa	%o0,	[%l7 + %i0] 0x0c
loop_626:
	movrlz	%o2,	0x11A,	%i1
	andn	%i4,	%l2,	%o6
	srax	%i3,	%l3,	%i6
	fones	%f23
	fble,a	%fcc2,	loop_627
	andn	%o3,	0x029A,	%g3
	fbl,a	%fcc2,	loop_628
	edge8	%g6,	%o5,	%g5
loop_627:
	nop
	setx loop_629, %l0, %l1
	jmpl %l1, %l4
	fbne,a	%fcc0,	loop_630
loop_628:
	tcs	%xcc,	0x0
	fmovspos	%icc,	%f21,	%f14
loop_629:
	fmovrslez	%i7,	%f4,	%f0
loop_630:
	bcs	%icc,	loop_631
	sra	%g1,	%i5,	%l0
	tle	%xcc,	0x0
	movneg	%icc,	%l5,	%o1
loop_631:
	tl	%icc,	0x7
	fandnot1	%f26,	%f26,	%f2
	mova	%icc,	%g2,	%g4
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x70] %asi,	%i2
	fpsub32	%f0,	%f4,	%f26
	fcmpeq32	%f4,	%f26,	%l1
	fmovdneg	%xcc,	%f3,	%f15
	sra	%o4,	0x1B,	%l6
	udivcc	%i0,	0x1EE9,	%g7
	fmovdpos	%xcc,	%f0,	%f26
	tle	%icc,	0x3
	andncc	%o7,	%o0,	%o2
	set	0x3F, %l4
	stba	%i4,	[%l7 + %l4] 0x88
	edge8n	%i1,	%l2,	%o6
	fmovsn	%icc,	%f13,	%f24
	array32	%i3,	%l3,	%o3
	be,pt	%xcc,	loop_632
	umul	%i6,	0x173B,	%g6
	fbge	%fcc2,	loop_633
	addcc	%o5,	%g3,	%l4
loop_632:
	fmul8x16au	%f24,	%f5,	%f8
	movpos	%icc,	%i7,	%g5
loop_633:
	srax	%i5,	%g1,	%l0
	brlez,a	%l5,	loop_634
	fandnot1s	%f4,	%f3,	%f0
	tle	%icc,	0x1
	fxnor	%f2,	%f26,	%f20
loop_634:
	fcmpne32	%f22,	%f24,	%g2
	ta	%xcc,	0x5
	or	%g4,	%i2,	%o1
	sra	%l1,	0x04,	%l6
	fmovrdlez	%i0,	%f6,	%f18
	fpadd32	%f4,	%f22,	%f16
	stx	%o4,	[%l7 + 0x68]
	fmovsn	%icc,	%f1,	%f1
	movg	%xcc,	%o7,	%g7
	fxnor	%f28,	%f8,	%f22
	wr	%g0,	0x88,	%asi
	stba	%o2,	[%l7 + 0x68] %asi
	tvs	%icc,	0x2
	fmovse	%xcc,	%f15,	%f7
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x71] %asi,	%o0
	movcc	%xcc,	%i4,	%l2
	fnegs	%f22,	%f0
	tpos	%xcc,	0x7
	sra	%i1,	%o6,	%l3
	pdist	%f2,	%f10,	%f18
	add	%o3,	0x0362,	%i6
	subc	%i3,	0x0579,	%o5
	te	%icc,	0x4
	udiv	%g6,	0x0996,	%l4
	mulx	%i7,	%g3,	%g5
	fbug,a	%fcc1,	loop_635
	membar	0x21
	movrgez	%i5,	%l0,	%g1
	movcs	%xcc,	%l5,	%g2
loop_635:
	ldd	[%l7 + 0x78],	%f6
	xnor	%i2,	%o1,	%g4
	bpos,pt	%icc,	loop_636
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l6,	0x0EB0,	%l1
	fmovse	%icc,	%f9,	%f23
loop_636:
	fmovrsne	%o4,	%f29,	%f11
	movl	%icc,	%i0,	%g7
	tgu	%xcc,	0x1
	fmovrslz	%o2,	%f26,	%f28
	ldsw	[%l7 + 0x78],	%o0
	popc	0x1D87,	%i4
	bg	%icc,	loop_637
	addcc	%l2,	%o7,	%i1
	fbug	%fcc1,	loop_638
	call	loop_639
loop_637:
	te	%icc,	0x2
	movrgez	%l3,	0x327,	%o3
loop_638:
	movleu	%icc,	%i6,	%o6
loop_639:
	tle	%xcc,	0x6
	addcc	%i3,	0x02DD,	%g6
	fmul8sux16	%f24,	%f28,	%f4
	fmovdle	%icc,	%f9,	%f31
	fblg,a	%fcc1,	loop_640
	sra	%l4,	0x07,	%i7
	edge16ln	%o5,	%g3,	%g5
	te	%icc,	0x2
loop_640:
	fcmpne16	%f0,	%f8,	%i5
	udiv	%g1,	0x102D,	%l0
	set	0x2A, %l3
	stha	%l5,	[%l7 + %l3] 0x2b
	membar	#Sync
	fmovsg	%icc,	%f11,	%f4
	stbar
	array16	%i2,	%o1,	%g2
	tvs	%icc,	0x6
	srl	%g4,	%l1,	%o4
	prefetch	[%l7 + 0x3C],	 0x2
	call	loop_641
	smulcc	%l6,	0x0FBF,	%g7
	edge32ln	%o2,	%i0,	%i4
	fmuld8ulx16	%f16,	%f31,	%f6
loop_641:
	tl	%icc,	0x5
	brgz,a	%o0,	loop_642
	fand	%f2,	%f6,	%f10
	xnor	%o7,	%l2,	%i1
	tleu	%icc,	0x7
loop_642:
	fmovrdne	%l3,	%f16,	%f20
	fnot1	%f2,	%f20
	tvc	%xcc,	0x1
	fsrc2s	%f2,	%f13
	movvs	%xcc,	%o3,	%o6
	tvs	%xcc,	0x2
	tl	%icc,	0x1
	subc	%i6,	%i3,	%l4
	sub	%i7,	%o5,	%g6
	udiv	%g3,	0x1C06,	%g5
	xor	%g1,	%l0,	%l5
	edge8l	%i5,	%o1,	%i2
	tge	%xcc,	0x6
	fpsub32s	%f28,	%f7,	%f17
	movneg	%icc,	%g4,	%g2
	brnz	%o4,	loop_643
	sra	%l6,	0x02,	%l1
	movne	%icc,	%g7,	%o2
	sdivcc	%i0,	0x1C33,	%o0
loop_643:
	udiv	%o7,	0x006E,	%l2
	array16	%i4,	%l3,	%o3
	addc	%i1,	0x0D3E,	%o6
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x22] %asi,	%i6
	fmovdl	%icc,	%f23,	%f16
	xnorcc	%i3,	0x121D,	%l4
	movrgz	%i7,	%o5,	%g6
	movrgez	%g3,	0x335,	%g1
	tle	%icc,	0x6
	movgu	%icc,	%l0,	%l5
	fcmpd	%fcc0,	%f22,	%f4
	bcs,a	loop_644
	fpadd16s	%f10,	%f26,	%f28
	sth	%i5,	[%l7 + 0x22]
	stbar
loop_644:
	fcmped	%fcc1,	%f16,	%f10
	fmovdn	%xcc,	%f14,	%f17
	tg	%xcc,	0x7
	movrgez	%g5,	0x025,	%i2
	fbge	%fcc0,	loop_645
	bvc,a	loop_646
	fors	%f24,	%f4,	%f24
	bcs,a	loop_647
loop_645:
	fbge,a	%fcc1,	loop_648
loop_646:
	ldd	[%l7 + 0x30],	%f28
	fsrc1	%f10,	%f20
loop_647:
	srlx	%g4,	%g2,	%o4
loop_648:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x1
	addc	%l6,	%l1,	%o1
	fmovdcs	%icc,	%f25,	%f2
	array8	%g7,	%i0,	%o0
	wr	%g0,	0x18,	%asi
	sta	%f10,	[%l7 + 0x10] %asi
	andcc	%o7,	%l2,	%o2
	ta	%xcc,	0x7
	fmovsn	%xcc,	%f31,	%f15
	set	0x54, %g2
	stwa	%l3,	[%l7 + %g2] 0xe3
	membar	#Sync
	ble,a,pn	%icc,	loop_649
	ldsw	[%l7 + 0x08],	%o3
	fmovdge	%xcc,	%f17,	%f7
	fcmple32	%f20,	%f0,	%i1
loop_649:
	tle	%xcc,	0x1
	fpadd32	%f24,	%f16,	%f4
	andcc	%i4,	0x009F,	%o6
	fzeros	%f0
	popc	%i6,	%i3
	fzero	%f30
	fbue	%fcc0,	loop_650
	sdiv	%l4,	0x108B,	%o5
	fmovdcs	%xcc,	%f9,	%f21
	or	%g6,	%g3,	%g1
loop_650:
	fcmple16	%f26,	%f10,	%i7
	andncc	%l5,	%i5,	%l0
	set	0x28, %o0
	prefetcha	[%l7 + %o0] 0x0c,	 0x3
	move	%xcc,	%i2,	%g2
	xorcc	%g4,	%o4,	%l6
	fnot2	%f30,	%f24
	fnegs	%f11,	%f4
	edge32l	%l1,	%g7,	%o1
	tne	%xcc,	0x0
	fsrc1	%f22,	%f14
	set	0x58, %i6
	prefetcha	[%l7 + %i6] 0x10,	 0x0
	std	%o6,	[%l7 + 0x10]
	movle	%icc,	%o0,	%l2
	edge16	%o2,	%l3,	%i1
	edge16ln	%i4,	%o6,	%o3
	ldx	[%l7 + 0x50],	%i6
	sethi	0x1C8C,	%i3
	movcs	%xcc,	%o5,	%l4
	movrlez	%g3,	0x0EB,	%g6
	tl	%xcc,	0x1
	udiv	%i7,	0x18B9,	%l5
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x14] %asi,	%g1
	set	0x20, %g6
	stda	%i4,	[%l7 + %g6] 0xe3
	membar	#Sync
	fabss	%f6,	%f5
	fbge,a	%fcc3,	loop_651
	bneg,a	loop_652
	fmovsa	%xcc,	%f31,	%f6
	andcc	%g5,	0x1DF8,	%l0
loop_651:
	fxors	%f10,	%f2,	%f13
loop_652:
	fpadd16	%f26,	%f0,	%f14
	umul	%i2,	0x0A9B,	%g2
	fmovrsne	%o4,	%f18,	%f22
	movrgez	%g4,	%l1,	%l6
	subcc	%o1,	0x135F,	%i0
	movvs	%xcc,	%o7,	%g7
	set	0x7C, %g4
	stha	%o0,	[%l7 + %g4] 0x27
	membar	#Sync
	fnot1	%f2,	%f6
	flush	%l7 + 0x28
	movne	%icc,	%l2,	%l3
	brnz	%i1,	loop_653
	edge8	%o2,	%o6,	%o3
	fpsub32s	%f9,	%f17,	%f23
	taddcc	%i6,	0x1703,	%i4
loop_653:
	nop
	set	0x7C, %i1
	lda	[%l7 + %i1] 0x10,	%f23
	move	%icc,	%i3,	%o5
	fbl	%fcc3,	loop_654
	andncc	%l4,	%g6,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l5,	%g1,	%i5
loop_654:
	movl	%xcc,	%i7,	%g5
	movvc	%icc,	%i2,	%l0
	movgu	%icc,	%o4,	%g4
	array8	%l1,	%l6,	%g2
	bvc,a,pt	%icc,	loop_655
	tcs	%icc,	0x6
	addc	%o1,	0x09CD,	%i0
	movcs	%xcc,	%o7,	%g7
loop_655:
	edge8l	%l2,	%o0,	%i1
	fors	%f11,	%f31,	%f25
	fbu,a	%fcc0,	loop_656
	stbar
	array8	%l3,	%o6,	%o3
	bpos,a,pt	%icc,	loop_657
loop_656:
	taddcctv	%i6,	0x13DB,	%i4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x51] %asi,	%o2
loop_657:
	sdivcc	%o5,	0x1203,	%i3
	movvs	%xcc,	%l4,	%g6
	sir	0x148D
	edge32ln	%g3,	%g1,	%i5
	fcmpeq32	%f8,	%f28,	%i7
	fbuge,a	%fcc2,	loop_658
	xor	%l5,	%g5,	%l0
	movvs	%icc,	%o4,	%g4
	smul	%l1,	%l6,	%i2
loop_658:
	std	%o0,	[%l7 + 0x48]
	tpos	%icc,	0x4
	fnor	%f12,	%f26,	%f0
	movne	%xcc,	%g2,	%o7
	sub	%i0,	0x0067,	%l2
	tvc	%icc,	0x4
	fbne	%fcc0,	loop_659
	tne	%xcc,	0x0
	fsrc2s	%f7,	%f28
	sir	0x11DA
loop_659:
	sir	0x1B44
	udiv	%o0,	0x01CC,	%g7
	edge16l	%i1,	%o6,	%l3
	mulscc	%o3,	0x051D,	%i4
	movre	%o2,	0x355,	%i6
	edge32l	%i3,	%l4,	%g6
	bne,a,pn	%xcc,	loop_660
	smul	%g3,	%o5,	%i5
	bcs,a	loop_661
	tsubcctv	%g1,	%l5,	%i7
loop_660:
	sra	%g5,	%o4,	%l0
	fnot2s	%f25,	%f27
loop_661:
	st	%f7,	[%l7 + 0x78]
	orn	%l1,	%l6,	%g4
	xnor	%o1,	0x0047,	%g2
	orncc	%o7,	%i0,	%l2
	or	%i2,	0x1326,	%o0
	orcc	%i1,	0x0A96,	%g7
	bneg,a,pn	%icc,	loop_662
	nop
	setx	loop_663,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot2s	%f28,	%f26,	%f14
	mulscc	%l3,	%o6,	%o3
loop_662:
	prefetch	[%l7 + 0x14],	 0x2
loop_663:
	movrlz	%i4,	0x213,	%o2
	xnor	%i3,	0x0B4D,	%l4
	srlx	%g6,	%g3,	%i6
	fmovrse	%i5,	%f21,	%f22
	nop
	set	0x6B, %i2
	ldub	[%l7 + %i2],	%o5
	tpos	%xcc,	0x5
	fbul,a	%fcc2,	loop_664
	fxnors	%f7,	%f28,	%f30
	array16	%l5,	%i7,	%g5
	sra	%g1,	%l0,	%o4
loop_664:
	nop
	set	0x0F, %g7
	stb	%l1,	[%l7 + %g7]
	edge8ln	%g4,	%o1,	%g2
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x23,	%i6
	movpos	%xcc,	%o7,	%l2
	fcmple16	%f16,	%f18,	%i0
	fmovsgu	%xcc,	%f6,	%f10
	fmovsl	%icc,	%f26,	%f25
	fba,a	%fcc0,	loop_665
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i2,	%i1,	%o0
	fpadd32	%f6,	%f28,	%f10
loop_665:
	tcc	%icc,	0x3
	brz,a	%g7,	loop_666
	udiv	%l3,	0x0A73,	%o6
	set	0x40, %o1
	stda	%f0,	[%l7 + %o1] 0x14
loop_666:
	edge8	%i4,	%o2,	%i3
	tpos	%icc,	0x4
	addccc	%o3,	0x045E,	%l4
	array16	%g6,	%g3,	%i6
	ta	%xcc,	0x6
	fcmped	%fcc0,	%f28,	%f18
	movgu	%xcc,	%o5,	%i5
	tpos	%icc,	0x0
	srlx	%l5,	0x09,	%i7
	orcc	%g5,	0x14E0,	%g1
	ldub	[%l7 + 0x4F],	%l0
	array32	%o4,	%l1,	%o1
	orcc	%g4,	%g2,	%l6
	edge8n	%l2,	%i0,	%o7
	fbue,a	%fcc1,	loop_667
	fcmpd	%fcc2,	%f16,	%f2
	mova	%icc,	%i1,	%i2
	movre	%g7,	%l3,	%o0
loop_667:
	edge32l	%i4,	%o6,	%o2
	lduw	[%l7 + 0x24],	%o3
	and	%l4,	%i3,	%g3
	array16	%i6,	%o5,	%g6
	and	%l5,	%i7,	%g5
	tvc	%xcc,	0x3
	fmuld8ulx16	%f2,	%f5,	%f16
	andncc	%i5,	%l0,	%g1
	fxors	%f29,	%f13,	%f26
	fpmerge	%f15,	%f15,	%f12
	edge8	%l1,	%o1,	%o4
	smul	%g4,	%g2,	%l2
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x68] %asi,	%i0
	subc	%l6,	0x0A46,	%o7
	array16	%i1,	%i2,	%l3
	ld	[%l7 + 0x28],	%f16
	movrlez	%g7,	0x14B,	%o0
	std	%f10,	[%l7 + 0x28]
	set	0x38, %l2
	stxa	%i4,	[%g0 + %l2] 0x4f
	fmovdcc	%xcc,	%f18,	%f13
	fmuld8ulx16	%f31,	%f29,	%f14
	tne	%xcc,	0x4
	sllx	%o6,	%o2,	%l4
	fmovrdlz	%o3,	%f20,	%f28
	wr	%g0,	0x18,	%asi
	stba	%i3,	[%l7 + 0x76] %asi
	sllx	%g3,	0x16,	%i6
	edge8l	%g6,	%o5,	%l5
	movrlz	%g5,	0x134,	%i7
	udivcc	%l0,	0x01CA,	%g1
	orncc	%i5,	%l1,	%o1
	ldx	[%l7 + 0x20],	%o4
	tn	%icc,	0x2
	std	%f16,	[%l7 + 0x60]
	tleu	%icc,	0x1
	movrgz	%g2,	0x212,	%l2
	alignaddr	%i0,	%g4,	%l6
	edge32n	%i1,	%o7,	%i2
	set	0x75, %o7
	ldstuba	[%l7 + %o7] 0x80,	%g7
	tge	%icc,	0x2
	edge32l	%o0,	%l3,	%i4
	edge16n	%o6,	%l4,	%o3
	edge16n	%i3,	%g3,	%o2
	fmovdneg	%xcc,	%f4,	%f27
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x81,	%f0
	fmovdneg	%icc,	%f3,	%f19
	te	%xcc,	0x5
	ta	%icc,	0x3
	ldx	[%l7 + 0x28],	%i6
	fabsd	%f30,	%f30
	fmuld8ulx16	%f1,	%f4,	%f24
	movne	%xcc,	%g6,	%l5
	fand	%f18,	%f10,	%f10
	sdivx	%o5,	0x11B2,	%i7
	xor	%g5,	%g1,	%l0
	edge32ln	%l1,	%i5,	%o1
	bne,a,pn	%icc,	loop_668
	bcs,pt	%icc,	loop_669
	array32	%o4,	%l2,	%g2
	srlx	%g4,	%i0,	%l6
loop_668:
	add	%i1,	%o7,	%i2
loop_669:
	movrgez	%o0,	0x1EC,	%g7
	tgu	%xcc,	0x4
	ldsh	[%l7 + 0x5E],	%i4
	ldd	[%l7 + 0x38],	%f6
	movleu	%icc,	%o6,	%l4
	taddcc	%o3,	0x15F3,	%i3
	for	%f26,	%f6,	%f18
	alignaddrl	%l3,	%g3,	%o2
	fmovdg	%icc,	%f26,	%f16
	edge8	%i6,	%g6,	%l5
	movcs	%icc,	%o5,	%i7
	bvs,pt	%icc,	loop_670
	fble,a	%fcc0,	loop_671
	sethi	0x0B71,	%g5
	andn	%l0,	0x1BEA,	%l1
loop_670:
	tle	%xcc,	0x7
loop_671:
	fmovrdne	%g1,	%f22,	%f22
	fsrc2	%f12,	%f28
	membar	0x11
	fxor	%f16,	%f22,	%f26
	movle	%xcc,	%o1,	%i5
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x09] %asi,	%l2
	tpos	%xcc,	0x5
	fmul8ulx16	%f22,	%f14,	%f20
	wr	%g0,	0x57,	%asi
	stxa	%o4,	[%g0 + 0x0] %asi
	tle	%xcc,	0x2
	smulcc	%g4,	%g2,	%i0
	popc	%i1,	%l6
	bne,a	%icc,	loop_672
	sdiv	%i2,	0x187D,	%o0
	tle	%icc,	0x3
	fmovsne	%icc,	%f28,	%f21
loop_672:
	tsubcc	%g7,	%i4,	%o7
	xnorcc	%o6,	%o3,	%l4
	membar	0x10
	movgu	%xcc,	%i3,	%l3
	andcc	%g3,	%o2,	%g6
	wr	%g0,	0x2a,	%asi
	stxa	%i6,	[%l7 + 0x18] %asi
	membar	#Sync
	fsrc1s	%f5,	%f21
	edge32n	%o5,	%l5,	%g5
	fmovse	%icc,	%f22,	%f1
	brgez,a	%i7,	loop_673
	bg,pn	%xcc,	loop_674
	edge32	%l0,	%l1,	%g1
	fmovrsgez	%o1,	%f21,	%f0
loop_673:
	fmovs	%f6,	%f19
loop_674:
	movg	%icc,	%i5,	%o4
	movge	%icc,	%g4,	%g2
	tcc	%xcc,	0x4
	fcmpes	%fcc1,	%f11,	%f13
	set	0x12, %o6
	stba	%i0,	[%l7 + %o6] 0x2a
	membar	#Sync
	fbu,a	%fcc0,	loop_675
	andncc	%l2,	%l6,	%i2
	fmovdle	%icc,	%f24,	%f5
	movleu	%icc,	%o0,	%g7
loop_675:
	taddcc	%i1,	0x070F,	%o7
	movvs	%icc,	%i4,	%o6
	movre	%l4,	%i3,	%l3
	movre	%o3,	%o2,	%g6
	movrlez	%i6,	0x021,	%o5
	taddcctv	%l5,	%g3,	%i7
	fmovrsgez	%g5,	%f31,	%f21
	sdiv	%l1,	0x1112,	%g1
	subcc	%l0,	0x1F7C,	%i5
	addcc	%o4,	%g4,	%o1
	orcc	%g2,	%i0,	%l2
	ld	[%l7 + 0x0C],	%f3
	movrne	%l6,	%o0,	%i2
	bne,pn	%icc,	loop_676
	siam	0x3
	fsrc2	%f30,	%f24
	array32	%g7,	%o7,	%i1
loop_676:
	srlx	%o6,	0x19,	%i4
	membar	0x42
	edge8l	%i3,	%l3,	%o3
	nop
	setx loop_677, %l0, %l1
	jmpl %l1, %l4
	bcs,a,pn	%icc,	loop_678
	edge32ln	%g6,	%i6,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_677:
	edge16n	%o5,	%l5,	%i7
loop_678:
	edge8ln	%g3,	%g5,	%g1
	ldd	[%l7 + 0x50],	%f24
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sub	%l0,	0x1204,	%i5
	array32	%o4,	%l1,	%o1
	fxors	%f14,	%f11,	%f3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%g4,	%g2
	addccc	%i0,	0x1582,	%l6
	fmul8x16al	%f18,	%f14,	%f22
	xnorcc	%l2,	%o0,	%g7
	std	%f12,	[%l7 + 0x60]
	and	%o7,	%i2,	%i1
	srlx	%i4,	0x17,	%o6
	fmovrdgz	%l3,	%f8,	%f22
	udivx	%i3,	0x040A,	%o3
	faligndata	%f18,	%f24,	%f12
	fbn,a	%fcc2,	loop_679
	movrgz	%g6,	%l4,	%o2
	movleu	%xcc,	%o5,	%l5
	movrlez	%i6,	0x2FB,	%i7
loop_679:
	fpadd32s	%f28,	%f17,	%f30
	te	%icc,	0x4
	fbg	%fcc3,	loop_680
	subccc	%g3,	0x0C25,	%g5
	popc	%l0,	%i5
	tne	%xcc,	0x0
loop_680:
	edge8ln	%g1,	%l1,	%o4
	edge32ln	%g4,	%g2,	%i0
	fpsub32	%f30,	%f26,	%f20
	smulcc	%o1,	%l6,	%o0
	mulx	%l2,	0x076D,	%o7
	and	%i2,	0x0FD1,	%g7
	fmovrse	%i4,	%f14,	%f8
	and	%i1,	0x1126,	%o6
	edge8n	%l3,	%i3,	%g6
	fbule,a	%fcc0,	loop_681
	tvs	%xcc,	0x7
	sethi	0x080B,	%l4
	umulcc	%o3,	0x1764,	%o5
loop_681:
	fble,a	%fcc0,	loop_682
	sdivcc	%l5,	0x1D5D,	%i6
	sub	%i7,	0x1AD4,	%g3
	movg	%icc,	%o2,	%g5
loop_682:
	edge8ln	%i5,	%g1,	%l0
	udiv	%o4,	0x0107,	%g4
	taddcctv	%g2,	%i0,	%l1
	addc	%l6,	%o0,	%l2
	udivcc	%o7,	0x1506,	%o1
	bpos,pt	%icc,	loop_683
	ldsh	[%l7 + 0x0E],	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f18,	%f24
loop_683:
	srax	%i4,	0x05,	%i1
	edge16	%o6,	%l3,	%i2
	fbug,a	%fcc3,	loop_684
	orn	%i3,	%g6,	%o3
	udiv	%l4,	0x16A8,	%l5
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x50] %asi,	%i6
loop_684:
	sdiv	%o5,	0x1276,	%i7
	or	%g3,	%o2,	%g5
	umulcc	%i5,	0x005C,	%l0
	fpadd16s	%f29,	%f16,	%f9
	xor	%o4,	%g1,	%g2
	movneg	%xcc,	%g4,	%i0
	movrgez	%l6,	0x067,	%o0
	fble,a	%fcc2,	loop_685
	bvc,a	loop_686
	ta	%xcc,	0x5
	fmovsl	%xcc,	%f6,	%f13
loop_685:
	alignaddr	%l1,	%o7,	%o1
loop_686:
	movrgez	%g7,	0x180,	%i4
	andn	%l2,	0x0DF0,	%i1
	fcmpes	%fcc1,	%f11,	%f19
	movpos	%icc,	%l3,	%o6
	andncc	%i2,	%i3,	%g6
	fcmpes	%fcc0,	%f18,	%f29
	fbe,a	%fcc1,	loop_687
	membar	0x65
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x57] %asi,	%o3
loop_687:
	bg,pt	%icc,	loop_688
	fmovs	%f0,	%f17
	fmul8x16au	%f31,	%f8,	%f20
	tvc	%xcc,	0x0
loop_688:
	tg	%icc,	0x3
	addc	%l5,	%l4,	%i6
	fbe,a	%fcc3,	loop_689
	fcmpd	%fcc2,	%f24,	%f2
	alignaddr	%o5,	%i7,	%g3
	movcs	%icc,	%g5,	%o2
loop_689:
	srlx	%l0,	0x1C,	%o4
	tle	%xcc,	0x7
	andncc	%i5,	%g1,	%g4
	subcc	%i0,	0x1BC7,	%g2
	be,a,pn	%icc,	loop_690
	tcs	%xcc,	0x0
	ble,a	%icc,	loop_691
	movl	%xcc,	%l6,	%l1
loop_690:
	fcmps	%fcc3,	%f8,	%f9
	bcc,a,pn	%xcc,	loop_692
loop_691:
	sir	0x1452
	mulx	%o7,	0x03C5,	%o0
	andncc	%o1,	%i4,	%g7
loop_692:
	fmovsne	%xcc,	%f24,	%f31
	fbuge	%fcc0,	loop_693
	xorcc	%l2,	0x01A6,	%l3
	bneg	%icc,	loop_694
	movcc	%icc,	%o6,	%i1
loop_693:
	fnot1s	%f31,	%f7
	fbu,a	%fcc0,	loop_695
loop_694:
	sth	%i3,	[%l7 + 0x3E]
	fcmple16	%f16,	%f6,	%g6
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x2c,	%o2
loop_695:
	tvc	%xcc,	0x4
	movcc	%xcc,	%i2,	%l4
	fmovdne	%icc,	%f15,	%f9
	edge32	%l5,	%o5,	%i7
	smulcc	%i6,	%g5,	%o2
	addcc	%g3,	0x171B,	%l0
	andcc	%i5,	0x027E,	%g1
	movrlz	%o4,	0x085,	%i0
	fblg,a	%fcc1,	loop_696
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f29,	%f22
	fors	%f15,	%f30,	%f19
loop_696:
	sub	%g2,	0x175F,	%g4
	tcs	%xcc,	0x0
	smulcc	%l6,	%l1,	%o0
	sdivcc	%o7,	0x0863,	%o1
	fmovsleu	%icc,	%f15,	%f11
	edge8l	%i4,	%l2,	%g7
	xnorcc	%l3,	%o6,	%i3
	addccc	%g6,	%i1,	%i2
	movvs	%xcc,	%o3,	%l4
	popc	%l5,	%i7
	fmovsgu	%xcc,	%f19,	%f14
	fbug	%fcc2,	loop_697
	and	%i6,	0x1E51,	%g5
	fmovsl	%xcc,	%f23,	%f15
	movrlz	%o2,	0x2C1,	%o5
loop_697:
	ldsw	[%l7 + 0x64],	%g3
	array32	%i5,	%g1,	%o4
	sub	%l0,	0x1B72,	%g2
	xorcc	%i0,	0x0E42,	%g4
	umulcc	%l6,	%o0,	%l1
	movrgez	%o7,	%o1,	%i4
	movge	%xcc,	%g7,	%l3
	tge	%xcc,	0x1
	movg	%xcc,	%l2,	%o6
	stb	%g6,	[%l7 + 0x47]
	sethi	0x03CE,	%i1
	array32	%i2,	%i3,	%l4
	tge	%xcc,	0x5
	movre	%l5,	%i7,	%i6
	tsubcc	%g5,	0x071E,	%o2
	fsrc1	%f10,	%f14
	addccc	%o5,	%o3,	%i5
	sdiv	%g3,	0x0662,	%o4
	ble,a	loop_698
	fmovsvc	%xcc,	%f20,	%f23
	movleu	%xcc,	%l0,	%g1
	fcmpd	%fcc1,	%f2,	%f4
loop_698:
	tleu	%icc,	0x2
	set	0x11, %l0
	lduba	[%l7 + %l0] 0x19,	%g2
	movgu	%xcc,	%i0,	%l6
	pdist	%f20,	%f0,	%f14
	edge16l	%o0,	%g4,	%o7
	fblg,a	%fcc0,	loop_699
	xnor	%o1,	%i4,	%l1
	set	0x34, %l6
	ldsha	[%l7 + %l6] 0x18,	%l3
loop_699:
	xnorcc	%l2,	0x107B,	%g7
	alignaddr	%o6,	%i1,	%i2
	prefetch	[%l7 + 0x60],	 0x0
	fmovrdne	%i3,	%f18,	%f22
	fpadd32s	%f27,	%f29,	%f25
	udiv	%l4,	0x0A4B,	%l5
	addccc	%g6,	%i6,	%g5
	movne	%xcc,	%o2,	%o5
	edge8n	%i7,	%o3,	%i5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%l0
	or	%g3,	0x0CC2,	%g2
	lduh	[%l7 + 0x7E],	%i0
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x18,	%f16
	sdivx	%g1,	0x13F7,	%o0
	array8	%g4,	%o7,	%o1
	fcmpne16	%f8,	%f24,	%i4
	andcc	%l6,	0x0181,	%l3
	fmovsneg	%xcc,	%f29,	%f18
	fsrc2s	%f7,	%f29
	tle	%xcc,	0x1
	bpos,a,pt	%xcc,	loop_700
	edge8	%l1,	%l2,	%g7
	and	%i1,	%i2,	%i3
	fcmpes	%fcc3,	%f12,	%f26
loop_700:
	subccc	%l4,	0x077B,	%l5
	ldub	[%l7 + 0x5E],	%g6
	move	%icc,	%o6,	%i6
	movge	%icc,	%g5,	%o5
	fbul	%fcc2,	loop_701
	call	loop_702
	sir	0x0B90
	andn	%i7,	0x05F7,	%o2
loop_701:
	fmul8x16al	%f30,	%f5,	%f20
loop_702:
	movrlez	%i5,	0x2DE,	%o4
	tgu	%icc,	0x4
	umul	%o3,	%l0,	%g3
	membar	0x79
	tg	%icc,	0x1
	movl	%icc,	%g2,	%i0
	fnot1	%f22,	%f0
	udivx	%o0,	0x0B40,	%g1
	edge32l	%o7,	%o1,	%i4
	movvs	%icc,	%l6,	%g4
	sdivcc	%l3,	0x1392,	%l1
	taddcc	%l2,	%i1,	%i2
	fnot1s	%f20,	%f13
	edge32n	%g7,	%i3,	%l5
	edge8l	%g6,	%o6,	%l4
	edge8	%g5,	%o5,	%i7
	movneg	%xcc,	%i6,	%i5
	movvc	%xcc,	%o2,	%o3
	fmovrsne	%l0,	%f30,	%f20
	addc	%o4,	0x1045,	%g3
	xor	%i0,	0x11D7,	%g2
	orcc	%o0,	0x0DFF,	%g1
	taddcc	%o1,	0x00ED,	%i4
	movrlz	%l6,	0x0B4,	%g4
	fmovdvc	%icc,	%f8,	%f10
	fmul8sux16	%f12,	%f30,	%f12
	xor	%o7,	0x03DD,	%l1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x0F] %asi,	%l3
	addc	%i1,	%i2,	%g7
	array8	%l2,	%l5,	%i3
	alignaddr	%g6,	%o6,	%l4
	bne,a	%xcc,	loop_703
	tne	%xcc,	0x6
	fmul8x16al	%f26,	%f12,	%f6
	alignaddrl	%g5,	%o5,	%i6
loop_703:
	movrgz	%i5,	%o2,	%o3
	fbu,a	%fcc1,	loop_704
	stx	%i7,	[%l7 + 0x10]
	fmovspos	%icc,	%f3,	%f25
	movrlz	%l0,	0x06E,	%o4
loop_704:
	edge32	%i0,	%g3,	%o0
	set	0x10, %o4
	swapa	[%l7 + %o4] 0x81,	%g2
	smul	%o1,	%g1,	%l6
	tcc	%icc,	0x2
	set	0x20, %g1
	prefetcha	[%l7 + %g1] 0x89,	 0x0
	fbo	%fcc3,	loop_705
	fmovsne	%xcc,	%f13,	%f31
	bl,a	%xcc,	loop_706
	alignaddrl	%i4,	%o7,	%l1
loop_705:
	movre	%l3,	%i2,	%g7
	udivx	%l2,	0x1B30,	%l5
loop_706:
	taddcc	%i3,	%g6,	%o6
	andcc	%l4,	%g5,	%o5
	srlx	%i6,	%i5,	%o2
	ldsb	[%l7 + 0x41],	%i1
	bl,pt	%xcc,	loop_707
	subcc	%o3,	%i7,	%o4
	std	%i0,	[%l7 + 0x10]
	xnor	%l0,	0x1CC7,	%o0
loop_707:
	nop
	set	0x3A, %l1
	ldsba	[%l7 + %l1] 0x88,	%g2
	fbug,a	%fcc3,	loop_708
	mova	%icc,	%o1,	%g1
	ldd	[%l7 + 0x60],	%i6
	fandnot1s	%f0,	%f7,	%f29
loop_708:
	array32	%g4,	%i4,	%g3
	add	%l1,	%l3,	%i2
	fzero	%f18
	fnand	%f26,	%f22,	%f8
	andcc	%g7,	0x1BBD,	%o7
	movvc	%xcc,	%l2,	%i3
	fmovdge	%icc,	%f23,	%f18
	bgu,a,pn	%icc,	loop_709
	sll	%g6,	%o6,	%l4
	edge16n	%g5,	%l5,	%i6
	fbue	%fcc1,	loop_710
loop_709:
	sll	%i5,	%o2,	%i1
	edge8ln	%o3,	%i7,	%o4
	fbul	%fcc3,	loop_711
loop_710:
	subcc	%i0,	0x10F1,	%l0
	movn	%icc,	%o0,	%o5
	fmovsle	%icc,	%f10,	%f15
loop_711:
	smulcc	%g2,	0x12C7,	%o1
	fnand	%f12,	%f30,	%f30
	set	0x19, %l5
	stba	%l6,	[%l7 + %l5] 0x14
	or	%g1,	%g4,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l1,	%l3,	%i2
	sethi	0x1026,	%g3
	fmovsleu	%xcc,	%f18,	%f4
	fnot2	%f2,	%f28
	movrlez	%g7,	0x06A,	%l2
	sir	0x1838
	addc	%i3,	0x1344,	%o7
	call	loop_712
	fmovd	%f14,	%f28
	nop
	setx	loop_713,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsl	%xcc,	%f6,	%f27
loop_712:
	edge8ln	%g6,	%l4,	%g5
	and	%o6,	0x17EF,	%l5
loop_713:
	movre	%i5,	%i6,	%i1
	taddcctv	%o2,	%i7,	%o4
	alignaddr	%o3,	%i0,	%o0
	umul	%l0,	%o5,	%g2
	smul	%o1,	0x010E,	%g1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x48] %asi,	%g4
	smul	%l6,	0x0671,	%i4
	movleu	%xcc,	%l1,	%i2
	fmuld8sux16	%f24,	%f1,	%f26
	bn,a,pn	%icc,	loop_714
	fmovse	%icc,	%f16,	%f8
	movcc	%xcc,	%g3,	%l3
	umul	%l2,	%i3,	%g7
loop_714:
	call	loop_715
	sir	0x16A6
	tg	%xcc,	0x3
	tn	%icc,	0x4
loop_715:
	fexpand	%f19,	%f18
	tn	%icc,	0x3
	movle	%xcc,	%g6,	%o7
	edge8n	%l4,	%o6,	%l5
	movrgez	%i5,	0x3A8,	%i6
	set	0x18, %i7
	ldxa	[%g0 + %i7] 0x50,	%g5
	fbge,a	%fcc0,	loop_716
	and	%i1,	0x0A8A,	%o2
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x5C] %asi,	%o4
loop_716:
	xor	%i7,	0x0774,	%o3
	fmovrslez	%o0,	%f11,	%f26
	fmovrdgz	%l0,	%f22,	%f20
	movrlz	%i0,	0x0D3,	%o5
	edge16ln	%g2,	%g1,	%o1
	set	0x6E, %o2
	lduha	[%l7 + %o2] 0x04,	%l6
	te	%xcc,	0x2
	orcc	%i4,	%l1,	%i2
	srlx	%g4,	0x18,	%l3
	edge32l	%g3,	%l2,	%i3
	fmul8x16	%f14,	%f26,	%f22
	fmovdn	%icc,	%f29,	%f4
	swap	[%l7 + 0x58],	%g7
	sdivx	%o7,	0x05D9,	%l4
	movrgz	%o6,	0x281,	%g6
	tcc	%icc,	0x3
	fbl	%fcc3,	loop_717
	fmovsvs	%xcc,	%f4,	%f18
	mulx	%l5,	0x0A3A,	%i5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x42] %asi,	%g5
loop_717:
	bge,a	loop_718
	fmovdn	%xcc,	%f6,	%f17
	mova	%xcc,	%i6,	%o2
	array16	%i1,	%o4,	%o3
loop_718:
	edge8	%i7,	%o0,	%l0
	movneg	%icc,	%o5,	%g2
	fbug	%fcc1,	loop_719
	edge8ln	%g1,	%i0,	%l6
	sdivcc	%i4,	0x1147,	%o1
	tne	%xcc,	0x1
loop_719:
	tge	%xcc,	0x4
	movpos	%icc,	%i2,	%l1
	edge16ln	%g4,	%l3,	%g3
	srl	%i3,	%l2,	%o7
	fbue	%fcc1,	loop_720
	array32	%g7,	%l4,	%g6
	tge	%xcc,	0x3
	mulscc	%o6,	%l5,	%g5
loop_720:
	nop
	set	0x58, %g5
	stda	%i4,	[%l7 + %g5] 0x2b
	membar	#Sync
	fpsub16s	%f8,	%f1,	%f7
	udivx	%i6,	0x0C05,	%i1
	sir	0x1508
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x89,	%o2,	%o4
	fbne	%fcc1,	loop_721
	udiv	%i7,	0x13A5,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o3,	%l0
loop_721:
	udiv	%g2,	0x03F9,	%g1
	bne,pt	%icc,	loop_722
	fble,a	%fcc0,	loop_723
	mulx	%i0,	0x0ED9,	%l6
	edge16l	%i4,	%o5,	%i2
loop_722:
	fbe	%fcc3,	loop_724
loop_723:
	fmovrslz	%o1,	%f28,	%f28
	sdivx	%g4,	0x04F2,	%l1
	sra	%g3,	%i3,	%l3
loop_724:
	xnor	%o7,	0x1CF4,	%g7
	tg	%xcc,	0x1
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%l2
	fabsd	%f20,	%f22
	edge16ln	%l4,	%o6,	%l5
	subccc	%g6,	%g5,	%i5
	set	0x76, %o3
	stba	%i1,	[%l7 + %o3] 0x15
	edge32n	%o2,	%i6,	%o4
	sllx	%o0,	%o3,	%i7
	movn	%xcc,	%l0,	%g2
	subccc	%i0,	%g1,	%i4
	bgu,a	%xcc,	loop_725
	movvs	%icc,	%o5,	%i2
	fsrc1s	%f17,	%f22
	movcs	%icc,	%l6,	%o1
loop_725:
	std	%g4,	[%l7 + 0x20]
	fmovrdgez	%g3,	%f18,	%f16
	fsrc2s	%f27,	%f20
	bneg,pt	%icc,	loop_726
	movge	%xcc,	%i3,	%l3
	fmovsge	%icc,	%f20,	%f14
	fcmpne32	%f10,	%f6,	%l1
loop_726:
	nop
	set	0x30, %i0
	ldda	[%l7 + %i0] 0x2a,	%g6
	fmovsgu	%xcc,	%f30,	%f13
	st	%f24,	[%l7 + 0x48]
	fmovsne	%icc,	%f20,	%f17
	xnor	%o7,	%l2,	%l4
	set	0x70, %l4
	lduba	[%l7 + %l4] 0x18,	%o6
	wr	%g0,	0x0c,	%asi
	stba	%g6,	[%l7 + 0x1E] %asi
	mova	%icc,	%g5,	%l5
	stbar
	wr	%g0,	0x27,	%asi
	stxa	%i5,	[%l7 + 0x60] %asi
	membar	#Sync
	srl	%i1,	0x12,	%i6
	andncc	%o4,	%o2,	%o3
	array32	%i7,	%l0,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o0,	%g1,	%i4
	xorcc	%i0,	%o5,	%i2
	ld	[%l7 + 0x2C],	%f6
	fmovrsgz	%l6,	%f15,	%f2
	fmovrslz	%o1,	%f2,	%f22
	tg	%icc,	0x0
	lduw	[%l7 + 0x7C],	%g3
	fbn,a	%fcc3,	loop_727
	fbul	%fcc0,	loop_728
	fcmple16	%f4,	%f0,	%g4
	xor	%i3,	%l1,	%l3
loop_727:
	ta	%icc,	0x2
loop_728:
	edge16	%o7,	%g7,	%l2
	subccc	%l4,	0x15FD,	%g6
	movre	%g5,	%o6,	%i5
	fcmpne16	%f28,	%f18,	%i1
	movrlez	%i6,	%l5,	%o4
	bgu,a	loop_729
	movl	%icc,	%o2,	%o3
	xnor	%i7,	0x0154,	%g2
	bgu,pt	%icc,	loop_730
loop_729:
	edge32n	%l0,	%g1,	%o0
	bge	loop_731
	movcc	%icc,	%i0,	%i4
loop_730:
	movrgez	%i2,	0x075,	%o5
	fnand	%f0,	%f28,	%f2
loop_731:
	udivcc	%l6,	0x1EF1,	%g3
	fcmpes	%fcc3,	%f31,	%f30
	fnands	%f27,	%f25,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g4,	0x0951,	%i3
	movrlz	%l1,	%l3,	%o7
	brnz	%g7,	loop_732
	edge8l	%l2,	%o1,	%l4
	add	%g5,	0x0CB6,	%o6
	stx	%g6,	[%l7 + 0x50]
loop_732:
	fmovdleu	%xcc,	%f21,	%f9
	sll	%i1,	%i6,	%i5
	call	loop_733
	bgu,pt	%xcc,	loop_734
	fbn,a	%fcc0,	loop_735
	xnorcc	%l5,	%o4,	%o2
loop_733:
	fsrc2	%f10,	%f8
loop_734:
	nop
	set	0x2C, %g3
	lduha	[%l7 + %g3] 0x89,	%i7
loop_735:
	tne	%icc,	0x2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x64] %asi,	%o3
	fbu,a	%fcc1,	loop_736
	fcmpd	%fcc2,	%f20,	%f8
	xnor	%l0,	0x0EBA,	%g2
	mova	%xcc,	%o0,	%i0
loop_736:
	move	%icc,	%i4,	%g1
	movpos	%xcc,	%o5,	%l6
	sdivx	%g3,	0x057F,	%i2
	sdivcc	%g4,	0x0C3A,	%i3
	orcc	%l1,	%o7,	%l3
	fmovspos	%icc,	%f24,	%f29
	movrgz	%l2,	%g7,	%o1
	bl,pt	%icc,	loop_737
	or	%g5,	0x0735,	%l4
	fmovsneg	%icc,	%f10,	%f10
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x81,	%g6,	%o6
loop_737:
	ba	%icc,	loop_738
	fandnot1s	%f8,	%f5,	%f26
	fmovsne	%icc,	%f6,	%f20
	movl	%icc,	%i6,	%i5
loop_738:
	edge16	%i1,	%o4,	%l5
	fcmpgt32	%f26,	%f6,	%o2
	stb	%o3,	[%l7 + 0x44]
	smul	%l0,	0x1C7E,	%i7
	srax	%o0,	%i0,	%g2
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x44] %asi,	%i4
	edge16ln	%g1,	%o5,	%g3
	movne	%icc,	%i2,	%l6
	edge8	%g4,	%i3,	%o7
	movg	%icc,	%l3,	%l2
	mulx	%l1,	%o1,	%g5
	fmovrse	%g7,	%f18,	%f17
	tsubcc	%g6,	0x1921,	%l4
	mova	%icc,	%i6,	%i5
	addcc	%o6,	0x1DD3,	%o4
	tgu	%xcc,	0x2
	edge32	%l5,	%o2,	%i1
	ble,pt	%xcc,	loop_739
	fabsd	%f8,	%f26
	set	0x30, %l3
	stda	%o2,	[%l7 + %l3] 0x2f
	membar	#Sync
loop_739:
	tgu	%xcc,	0x4
	sllx	%i7,	%l0,	%i0
	orncc	%g2,	0x1F58,	%o0
	edge32	%g1,	%o5,	%i4
	tle	%icc,	0x2
	fnegs	%f11,	%f0
	and	%i2,	%l6,	%g4
	movg	%xcc,	%g3,	%o7
	bvs,a,pt	%xcc,	loop_740
	ldd	[%l7 + 0x18],	%f26
	movgu	%xcc,	%l3,	%i3
	movn	%xcc,	%l1,	%l2
loop_740:
	movgu	%xcc,	%g5,	%o1
	andn	%g7,	0x0E77,	%l4
	sdivcc	%g6,	0x09F3,	%i5
	edge32ln	%i6,	%o6,	%o4
	subccc	%l5,	%o2,	%o3
	movrlez	%i7,	%i1,	%i0
	tneg	%xcc,	0x0
	fnand	%f12,	%f8,	%f28
	fmovsn	%xcc,	%f7,	%f28
	bn	loop_741
	lduw	[%l7 + 0x40],	%l0
	lduw	[%l7 + 0x58],	%o0
	udivx	%g1,	0x0346,	%o5
loop_741:
	tg	%xcc,	0x4
	fnegs	%f12,	%f19
	movre	%i4,	%i2,	%l6
	movcs	%xcc,	%g4,	%g2
	movgu	%icc,	%g3,	%o7
	stbar
	xorcc	%i3,	0x1A5C,	%l1
	ldsb	[%l7 + 0x3E],	%l2
	fmovrdne	%g5,	%f28,	%f2
	addccc	%o1,	0x1071,	%l3
	udivx	%g7,	0x0A8A,	%l4
	movn	%xcc,	%g6,	%i5
	bpos	loop_742
	srl	%o6,	%o4,	%l5
	tge	%icc,	0x3
	movrlz	%i6,	%o3,	%o2
loop_742:
	fmul8sux16	%f2,	%f18,	%f8
	tcc	%xcc,	0x4
	tsubcctv	%i7,	0x1DF2,	%i0
	fcmpeq32	%f0,	%f12,	%l0
	fzero	%f2
	brz	%i1,	loop_743
	fmovdn	%icc,	%f21,	%f27
	fpsub32s	%f3,	%f20,	%f31
	siam	0x3
loop_743:
	fba,a	%fcc3,	loop_744
	sra	%o0,	0x02,	%o5
	fbule	%fcc1,	loop_745
	andncc	%i4,	%i2,	%l6
loop_744:
	sdiv	%g4,	0x1F18,	%g1
	popc	%g3,	%o7
loop_745:
	fbug	%fcc1,	loop_746
	movrgz	%i3,	%l1,	%g2
	alignaddrl	%l2,	%o1,	%l3
	bcc,a,pn	%icc,	loop_747
loop_746:
	fbge,a	%fcc3,	loop_748
	umul	%g5,	0x0DCD,	%l4
	edge8	%g7,	%i5,	%o6
loop_747:
	te	%xcc,	0x3
loop_748:
	fsrc1	%f2,	%f0
	tleu	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g6,	%l5,	%o4
	edge16ln	%o3,	%i6,	%o2
	udivx	%i0,	0x1152,	%l0
	sir	0x01A2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i1,	%o0
	tcs	%icc,	0x5
	subc	%o5,	0x003E,	%i4
	fcmpgt32	%f6,	%f14,	%i7
	tleu	%icc,	0x0
	sdiv	%i2,	0x0D37,	%g4
	movgu	%icc,	%l6,	%g1
	tsubcctv	%o7,	0x187D,	%i3
	fandnot2	%f28,	%f22,	%f28
	mova	%xcc,	%g3,	%l1
	set	0x7C, %o0
	stwa	%g2,	[%l7 + %o0] 0x19
	sub	%l2,	%o1,	%g5
	tcc	%xcc,	0x1
	fmovrslz	%l3,	%f14,	%f1
	movneg	%xcc,	%g7,	%l4
	be,pn	%xcc,	loop_749
	movrne	%o6,	0x044,	%g6
	tvs	%xcc,	0x6
	mova	%icc,	%l5,	%o4
loop_749:
	edge32ln	%i5,	%o3,	%i6
	fcmpne16	%f26,	%f26,	%o2
	fmovsne	%icc,	%f27,	%f7
	udivx	%i0,	0x1051,	%i1
	subccc	%o0,	%o5,	%i4
	tpos	%xcc,	0x1
	bne	loop_750
	array8	%l0,	%i2,	%g4
	movleu	%icc,	%l6,	%i7
	movgu	%icc,	%o7,	%i3
loop_750:
	sllx	%g1,	0x17,	%l1
	fbn	%fcc1,	loop_751
	movne	%icc,	%g3,	%g2
	movre	%l2,	%o1,	%l3
	subc	%g7,	0x1C19,	%l4
loop_751:
	fnor	%f26,	%f22,	%f10
	movgu	%xcc,	%g5,	%g6
	fmovsne	%icc,	%f13,	%f18
	srl	%o6,	%o4,	%i5
	movle	%icc,	%o3,	%i6
	fmovse	%xcc,	%f17,	%f21
	edge8l	%o2,	%l5,	%i0
	fandnot2	%f12,	%f20,	%f24
	fba	%fcc0,	loop_752
	tpos	%xcc,	0x6
	tleu	%icc,	0x1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x47] %asi,	%o0
loop_752:
	edge16ln	%o5,	%i4,	%i1
	tn	%icc,	0x1
	addcc	%l0,	0x07DE,	%i2
	addccc	%l6,	0x016F,	%i7
	ble,a,pn	%xcc,	loop_753
	fmovsge	%icc,	%f28,	%f1
	movg	%icc,	%g4,	%o7
	sdivcc	%i3,	0x0CD0,	%g1
loop_753:
	tl	%icc,	0x6
	subccc	%g3,	%l1,	%l2
	popc	%o1,	%l3
	sllx	%g2,	0x0A,	%l4
	tsubcctv	%g7,	0x1FF6,	%g6
	tsubcc	%g5,	0x0918,	%o6
	edge8l	%i5,	%o4,	%i6
	tge	%xcc,	0x1
	ta	%xcc,	0x4
	sdivx	%o3,	0x0165,	%o2
	fbug,a	%fcc0,	loop_754
	movne	%xcc,	%i0,	%o0
	fnand	%f14,	%f10,	%f20
	movrlez	%o5,	0x1B7,	%i4
loop_754:
	smul	%i1,	0x0276,	%l5
	fmovsne	%xcc,	%f1,	%f20
	bpos,a,pt	%icc,	loop_755
	tcc	%icc,	0x1
	fmovdg	%icc,	%f28,	%f27
	tn	%xcc,	0x5
loop_755:
	mulscc	%i2,	0x19A2,	%l0
	subccc	%i7,	0x0DCC,	%g4
	tsubcc	%l6,	0x0EB5,	%o7
	subccc	%i3,	%g1,	%g3
	tgu	%icc,	0x5
	srlx	%l2,	%o1,	%l1
	bn,a	%xcc,	loop_756
	subcc	%l3,	%l4,	%g2
	taddcctv	%g6,	%g5,	%o6
	tge	%xcc,	0x1
loop_756:
	add	%g7,	%o4,	%i5
	for	%f12,	%f22,	%f4
	fpackfix	%f0,	%f16
	movrgez	%i6,	%o2,	%o3
	movvc	%xcc,	%i0,	%o5
	fmovdl	%icc,	%f2,	%f0
	taddcc	%i4,	%i1,	%l5
	fmovdn	%icc,	%f23,	%f27
	sll	%o0,	0x0E,	%l0
	movg	%icc,	%i7,	%i2
	edge16l	%l6,	%g4,	%i3
	sll	%g1,	%o7,	%l2
	nop
	set	0x28, %g2
	std	%f12,	[%l7 + %g2]
	std	%f0,	[%l7 + 0x40]
	array32	%o1,	%g3,	%l1
	smul	%l4,	%l3,	%g6
	tcc	%xcc,	0x3
	umulcc	%g2,	%g5,	%o6
	te	%icc,	0x0
	set	0x4C, %g6
	swapa	[%l7 + %g6] 0x81,	%g7
	wr	%g0,	0x22,	%asi
	stxa	%i5,	[%l7 + 0x08] %asi
	membar	#Sync
	udiv	%o4,	0x1F27,	%o2
	sdivx	%i6,	0x0EA4,	%i0
	fcmpd	%fcc2,	%f8,	%f18
	subccc	%o5,	%i4,	%i1
	bg,a	loop_757
	fmovsle	%xcc,	%f24,	%f12
	fmuld8ulx16	%f28,	%f12,	%f0
	movg	%icc,	%o3,	%l5
loop_757:
	stbar
	fbg,a	%fcc3,	loop_758
	andn	%l0,	0x1E2C,	%i7
	wr	%g0,	0xe3,	%asi
	stba	%o0,	[%l7 + 0x69] %asi
	membar	#Sync
loop_758:
	edge8n	%i2,	%l6,	%i3
	movne	%icc,	%g1,	%o7
	movrlz	%l2,	0x15B,	%g4
	ldub	[%l7 + 0x77],	%o1
	ble,a,pn	%xcc,	loop_759
	mova	%xcc,	%g3,	%l4
	set	0x20, %g4
	ldda	[%l7 + %g4] 0x89,	%l0
loop_759:
	nop
	set	0x3C, %i6
	stwa	%g6,	[%l7 + %i6] 0x15
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x70] %asi,	%l3
	fmovdge	%xcc,	%f4,	%f0
	umulcc	%g5,	%o6,	%g2
	fxor	%f24,	%f14,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x4
	fexpand	%f30,	%f24
	fpsub16	%f20,	%f22,	%f28
	nop
	setx loop_760, %l0, %l1
	jmpl %l1, %g7
	subcc	%o4,	0x023B,	%o2
	fmovrdne	%i5,	%f24,	%f0
	movle	%xcc,	%i6,	%i0
loop_760:
	fbge	%fcc2,	loop_761
	subcc	%o5,	%i1,	%o3
	srl	%l5,	%l0,	%i7
	ldd	[%l7 + 0x40],	%o0
loop_761:
	swap	[%l7 + 0x14],	%i2
	fsrc1s	%f29,	%f15
	andn	%l6,	0x07C8,	%i4
	ldub	[%l7 + 0x29],	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o7,	%l2,	%i3
	udivx	%o1,	0x13B0,	%g3
	tsubcctv	%l4,	0x1A92,	%g4
	fble,a	%fcc1,	loop_762
	tg	%icc,	0x1
	alignaddr	%g6,	%l3,	%g5
	ldx	[%l7 + 0x18],	%o6
loop_762:
	fcmple16	%f12,	%f30,	%g2
	fbul	%fcc2,	loop_763
	bge,pn	%icc,	loop_764
	tsubcctv	%g7,	%o4,	%l1
	movrgz	%o2,	0x007,	%i5
loop_763:
	xnor	%i0,	0x1658,	%o5
loop_764:
	bcc,a	loop_765
	mulx	%i6,	0x0644,	%i1
	fabsd	%f12,	%f2
	movrgez	%o3,	0x2FC,	%l0
loop_765:
	fbule,a	%fcc1,	loop_766
	array16	%l5,	%o0,	%i2
	tl	%icc,	0x4
	fandnot2s	%f4,	%f22,	%f10
loop_766:
	fbule,a	%fcc3,	loop_767
	mulx	%i7,	0x05AB,	%l6
	st	%f31,	[%l7 + 0x74]
	fmovdgu	%xcc,	%f7,	%f1
loop_767:
	fcmps	%fcc2,	%f7,	%f0
	sll	%i4,	0x0B,	%o7
	wr	%g0,	0x89,	%asi
	stha	%l2,	[%l7 + 0x30] %asi
	fmovdleu	%xcc,	%f29,	%f27
	fmovdpos	%xcc,	%f21,	%f27
	nop
	set	0x15, %i1
	stb	%g1,	[%l7 + %i1]
	fmul8sux16	%f20,	%f28,	%f26
	subcc	%o1,	0x0564,	%i3
	movvc	%icc,	%g3,	%g4
	set	0x220, %g7
	ldxa	[%g0 + %g7] 0x52,	%l4
	st	%f21,	[%l7 + 0x08]
	andncc	%g6,	%g5,	%l3
	fors	%f22,	%f10,	%f9
	movrlez	%o6,	%g2,	%g7
	orn	%o4,	%o2,	%l1
	fxors	%f9,	%f23,	%f22
	add	%l7,	0x54,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%i5
	movl	%xcc,	%i6,	%o5
	lduh	[%l7 + 0x1E],	%i1
	sir	0x1808
	tge	%xcc,	0x7
	and	%l0,	0x0033,	%o3
	edge16l	%l5,	%o0,	%i2
	tneg	%xcc,	0x5
	set	0x60, %i2
	lduwa	[%l7 + %i2] 0x0c,	%l6
	fmovdg	%xcc,	%f2,	%f24
	fand	%f14,	%f10,	%f20
	fmovrdne	%i4,	%f26,	%f10
	set	0x28, %i4
	stda	%i6,	[%l7 + %i4] 0x27
	membar	#Sync
	nop
	setx	loop_768,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%l2,	0x1B30,	%o7
	tpos	%icc,	0x5
	fmovsl	%icc,	%f28,	%f30
loop_768:
	andn	%g1,	%i3,	%o1
	set	0x42, %l2
	ldstuba	[%l7 + %l2] 0x11,	%g4
	fnors	%f17,	%f25,	%f4
	movpos	%icc,	%l4,	%g6
	addcc	%g5,	0x0296,	%g3
	fmovdl	%icc,	%f18,	%f9
	alignaddrl	%l3,	%o6,	%g2
	fblg	%fcc1,	loop_769
	fmovdcc	%xcc,	%f21,	%f0
	andn	%g7,	%o2,	%o4
	stbar
loop_769:
	edge16l	%i0,	%l1,	%i5
	edge16	%i6,	%o5,	%i1
	movre	%o3,	%l0,	%l5
	fmovrsgez	%o0,	%f8,	%f8
	orncc	%l6,	%i4,	%i2
	fmovdleu	%xcc,	%f4,	%f25
	tcc	%xcc,	0x3
	taddcc	%i7,	0x1FA6,	%l2
	move	%icc,	%g1,	%i3
	edge8l	%o1,	%g4,	%l4
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovsn	%icc,	%f2,	%f31
	or	%o7,	%g5,	%g6
	nop
	setx	loop_770,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%xcc,	%g3,	%l3
	bneg,a	%icc,	loop_771
	tge	%icc,	0x3
loop_770:
	fmovdgu	%icc,	%f4,	%f13
	set	0x10, %o1
	prefetcha	[%l7 + %o1] 0x04,	 0x1
loop_771:
	nop
	set	0x1C, %i3
	swapa	[%l7 + %i3] 0x10,	%g2
	fbn	%fcc0,	loop_772
	edge8n	%g7,	%o4,	%o2
	sll	%i0,	0x08,	%i5
	membar	0x43
loop_772:
	edge32ln	%i6,	%l1,	%i1
	movrlz	%o3,	%l0,	%l5
	fcmpd	%fcc2,	%f4,	%f2
	movl	%icc,	%o0,	%o5
	tsubcctv	%i4,	%l6,	%i2
	fors	%f28,	%f24,	%f15
	movl	%icc,	%l2,	%g1
	subc	%i7,	0x07BD,	%i3
	edge32ln	%g4,	%o1,	%o7
	orncc	%g5,	%g6,	%g3
	fmovdvc	%xcc,	%f16,	%f25
	movcc	%xcc,	%l3,	%o6
	fmovdne	%xcc,	%f27,	%f16
	edge32ln	%l4,	%g7,	%g2
	edge32ln	%o2,	%i0,	%i5
	movpos	%icc,	%i6,	%l1
	nop
	setx loop_773, %l0, %l1
	jmpl %l1, %i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x10
	stbar
loop_773:
	tgu	%xcc,	0x2
	popc	%o4,	%l0
	tsubcctv	%l5,	0x14FF,	%o3
	nop
	setx loop_774, %l0, %l1
	jmpl %l1, %o0
	edge8ln	%i4,	%o5,	%i2
	stx	%l2,	[%l7 + 0x08]
	fmovsvc	%icc,	%f5,	%f10
loop_774:
	edge16l	%l6,	%g1,	%i3
	fmovde	%icc,	%f7,	%f12
	movpos	%xcc,	%i7,	%o1
	movl	%icc,	%g4,	%o7
	tn	%icc,	0x3
	fmul8x16al	%f5,	%f28,	%f16
	movrlz	%g6,	%g3,	%l3
	edge16n	%g5,	%l4,	%g7
	ld	[%l7 + 0x68],	%f26
	tsubcctv	%o6,	%o2,	%g2
	fpmerge	%f7,	%f0,	%f2
	and	%i5,	%i0,	%i6
	set	0x30, %o6
	stxa	%l1,	[%l7 + %o6] 0x14
	edge16ln	%o4,	%i1,	%l0
	movle	%xcc,	%o3,	%o0
	fmovdvc	%icc,	%f13,	%f4
	tvs	%icc,	0x1
	sdivx	%i4,	0x129D,	%o5
	movcc	%icc,	%i2,	%l5
	movgu	%xcc,	%l6,	%g1
	sra	%l2,	0x03,	%i7
	umul	%i3,	0x0BE5,	%g4
	fba,a	%fcc1,	loop_775
	movcs	%icc,	%o7,	%o1
	fmovrdne	%g3,	%f28,	%f26
	tcs	%icc,	0x3
loop_775:
	ldub	[%l7 + 0x0D],	%g6
	sdivx	%l3,	0x0A4C,	%l4
	edge8l	%g5,	%o6,	%o2
	orcc	%g2,	%i5,	%g7
	edge32l	%i6,	%l1,	%o4
	tvc	%xcc,	0x2
	fmul8x16au	%f10,	%f10,	%f28
	xorcc	%i1,	%i0,	%o3
	fpsub32	%f8,	%f12,	%f22
	fcmped	%fcc0,	%f30,	%f20
	std	%f20,	[%l7 + 0x68]
	nop
	set	0x78, %o7
	std	%o0,	[%l7 + %o7]
	movvc	%icc,	%i4,	%o5
	fblg	%fcc0,	loop_776
	fbg,a	%fcc2,	loop_777
	fmovsvs	%xcc,	%f13,	%f19
	brz	%l0,	loop_778
loop_776:
	fmovdne	%icc,	%f21,	%f6
loop_777:
	fmovsn	%icc,	%f18,	%f7
	bne,pt	%xcc,	loop_779
loop_778:
	xnorcc	%l5,	%i2,	%l6
	bcc	loop_780
	movrlz	%l2,	%g1,	%i7
loop_779:
	or	%i3,	0x1A05,	%g4
	wr	%g0,	0x2a,	%asi
	stha	%o7,	[%l7 + 0x0C] %asi
	membar	#Sync
loop_780:
	sub	%o1,	%g3,	%g6
	brlz	%l3,	loop_781
	tvs	%xcc,	0x4
	edge32l	%l4,	%o6,	%o2
	fmovsge	%icc,	%f5,	%f10
loop_781:
	ldsw	[%l7 + 0x28],	%g2
	fmovde	%icc,	%f21,	%f13
	fpsub16s	%f23,	%f29,	%f27
	subcc	%i5,	0x0676,	%g7
	fmul8x16au	%f14,	%f10,	%f2
	call	loop_782
	tg	%icc,	0x4
	ta	%icc,	0x1
	taddcctv	%g5,	%i6,	%l1
loop_782:
	movcs	%xcc,	%i1,	%i0
	fbul	%fcc0,	loop_783
	movge	%xcc,	%o3,	%o4
	fsrc1s	%f21,	%f5
	set	0x28, %l0
	lduwa	[%l7 + %l0] 0x89,	%i4
loop_783:
	orncc	%o0,	0x0EA3,	%o5
	brlz,a	%l0,	loop_784
	fbe	%fcc3,	loop_785
	tsubcc	%l5,	%l6,	%i2
	fmovdpos	%xcc,	%f10,	%f28
loop_784:
	tne	%xcc,	0x0
loop_785:
	bl	%icc,	loop_786
	movneg	%xcc,	%l2,	%i7
	fbul,a	%fcc0,	loop_787
	tsubcc	%g1,	%i3,	%g4
loop_786:
	edge16ln	%o1,	%g3,	%o7
	movrlz	%l3,	%g6,	%o6
loop_787:
	sra	%o2,	%g2,	%i5
	fble,a	%fcc0,	loop_788
	bge,a,pn	%xcc,	loop_789
	movvs	%xcc,	%g7,	%g5
	sir	0x0ADA
loop_788:
	andcc	%i6,	%l1,	%i1
loop_789:
	bn,pt	%xcc,	loop_790
	sllx	%i0,	%l4,	%o3
	fmovdvc	%icc,	%f29,	%f2
	udiv	%o4,	0x1E31,	%o0
loop_790:
	add	%i4,	%l0,	%l5
	fmuld8ulx16	%f26,	%f31,	%f10
	fbl	%fcc2,	loop_791
	ba,a	%xcc,	loop_792
	movrgz	%l6,	0x33D,	%i2
	fnors	%f8,	%f13,	%f23
loop_791:
	edge16ln	%l2,	%o5,	%g1
loop_792:
	mova	%icc,	%i7,	%g4
	ld	[%l7 + 0x38],	%f0
	brnz,a	%o1,	loop_793
	stx	%g3,	[%l7 + 0x60]
	fmovrdlz	%i3,	%f6,	%f20
	or	%l3,	0x0E69,	%o7
loop_793:
	srax	%g6,	0x01,	%o2
	edge8ln	%o6,	%g2,	%i5
	brgez	%g5,	loop_794
	for	%f14,	%f6,	%f14
	fpsub32s	%f16,	%f26,	%f5
	fbge,a	%fcc1,	loop_795
loop_794:
	edge32ln	%i6,	%g7,	%l1
	andn	%i1,	%l4,	%i0
	stw	%o4,	[%l7 + 0x0C]
loop_795:
	array8	%o0,	%i4,	%l0
	array8	%l5,	%l6,	%i2
	sllx	%l2,	%o3,	%o5
	orcc	%i7,	0x12E3,	%g1
	nop
	setx	loop_796,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xor	%g4,	0x1210,	%o1
	ta	%icc,	0x0
	fbul,a	%fcc2,	loop_797
loop_796:
	bl	%icc,	loop_798
	edge16ln	%g3,	%i3,	%l3
	set	0x54, %l6
	swapa	[%l7 + %l6] 0x18,	%o7
loop_797:
	fcmped	%fcc0,	%f28,	%f30
loop_798:
	xnor	%o2,	0x1026,	%o6
	fble	%fcc3,	loop_799
	tle	%xcc,	0x6
	smulcc	%g2,	%g6,	%i5
	srl	%g5,	0x1B,	%i6
loop_799:
	xor	%g7,	0x066E,	%l1
	orn	%i1,	0x0A97,	%l4
	fmovrse	%i0,	%f22,	%f9
	movrlez	%o4,	0x018,	%i4
	set	0x53, %o5
	stba	%o0,	[%l7 + %o5] 0x15
	fcmpeq32	%f10,	%f12,	%l5
	sethi	0x0872,	%l6
	alignaddrl	%i2,	%l2,	%o3
	sdivcc	%o5,	0x0E90,	%i7
	tsubcctv	%g1,	0x02E8,	%g4
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x0A] %asi,	%o1
	fpsub16s	%f28,	%f22,	%f22
	umul	%g3,	0x0478,	%i3
	fbue	%fcc3,	loop_800
	sethi	0x1A15,	%l3
	fmovrse	%o7,	%f10,	%f29
	movg	%icc,	%o2,	%l0
loop_800:
	movre	%g2,	0x216,	%o6
	xnorcc	%g6,	%g5,	%i6
	edge8n	%i5,	%l1,	%i1
	std	%f2,	[%l7 + 0x70]
	alignaddr	%l4,	%g7,	%o4
	fabsd	%f16,	%f22
	swap	[%l7 + 0x50],	%i4
	tsubcc	%o0,	%l5,	%i0
	movleu	%icc,	%i2,	%l2
	bshuffle	%f26,	%f8,	%f12
	mova	%xcc,	%l6,	%o5
	fmovdne	%icc,	%f21,	%f23
	array8	%o3,	%g1,	%g4
	stbar
	edge16ln	%o1,	%g3,	%i7
	sdiv	%l3,	0x0FEF,	%o7
	orncc	%i3,	0x0D00,	%o2
	movrlez	%l0,	0x026,	%g2
	addc	%g6,	0x1FA9,	%o6
	ldsb	[%l7 + 0x6C],	%g5
	fornot1	%f24,	%f16,	%f28
	udivcc	%i5,	0x13E4,	%i6
	stx	%i1,	[%l7 + 0x30]
	tne	%xcc,	0x7
	tcc	%xcc,	0x0
	brlz	%l4,	loop_801
	movrlz	%l1,	0x0A4,	%o4
	fxnor	%f0,	%f4,	%f2
	fmul8x16al	%f26,	%f19,	%f18
loop_801:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x36] %asi,	%g7
	smul	%o0,	%l5,	%i4
	popc	%i0,	%i2
	set	0x70, %o4
	stwa	%l6,	[%l7 + %o4] 0x2a
	membar	#Sync
	udiv	%l2,	0x0083,	%o5
	movleu	%xcc,	%o3,	%g4
	subcc	%o1,	0x1D8A,	%g3
	or	%g1,	0x129B,	%l3
	fmovsvc	%icc,	%f15,	%f2
	fble	%fcc1,	loop_802
	movcc	%icc,	%o7,	%i3
	movpos	%xcc,	%i7,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_802:
	fxor	%f8,	%f10,	%f20
	alignaddr	%l0,	%g6,	%g2
	tne	%icc,	0x4
	fmovse	%icc,	%f25,	%f26
	tg	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x08] %asi,	%g5
	fbn,a	%fcc2,	loop_803
	movrlz	%i5,	%i6,	%i1
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l4
loop_803:
	tge	%icc,	0x0
	umulcc	%o6,	0x0DED,	%l1
	movl	%xcc,	%g7,	%o4
	lduh	[%l7 + 0x10],	%o0
	fmovsle	%icc,	%f12,	%f9
	movcc	%icc,	%l5,	%i4
	sllx	%i0,	%i2,	%l6
	tsubcc	%l2,	%o5,	%g4
	fpadd32s	%f2,	%f23,	%f27
	movneg	%xcc,	%o3,	%o1
	fmovdg	%icc,	%f1,	%f17
	stw	%g1,	[%l7 + 0x44]
	sllx	%l3,	%g3,	%o7
	siam	0x4
	brnz	%i3,	loop_804
	bneg,pn	%xcc,	loop_805
	fandnot1	%f2,	%f8,	%f24
	movn	%icc,	%o2,	%l0
loop_804:
	siam	0x6
loop_805:
	fbule,a	%fcc1,	loop_806
	smul	%g6,	0x0A79,	%i7
	movrlz	%g2,	%i5,	%g5
	fmovsa	%xcc,	%f26,	%f20
loop_806:
	fmovrdgz	%i6,	%f12,	%f0
	umulcc	%l4,	0x00F5,	%i1
	fmul8x16	%f3,	%f2,	%f30
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	nop
	set	0x70, %g1
	std	%f2,	[%l7 + %g1]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x0
	brgez,a	%g7,	loop_807
	fpadd16s	%f15,	%f11,	%f26
	movcc	%xcc,	%l1,	%o0
	orncc	%l5,	%o4,	%i4
loop_807:
	fmovscs	%icc,	%f24,	%f22
	bcc,a,pt	%xcc,	loop_808
	brnz	%i0,	loop_809
	andncc	%l6,	%i2,	%l2
	ldsw	[%l7 + 0x24],	%g4
loop_808:
	tvs	%xcc,	0x4
loop_809:
	fmovda	%xcc,	%f30,	%f20
	movneg	%xcc,	%o3,	%o5
	fblg,a	%fcc3,	loop_810
	movrne	%g1,	0x30F,	%l3
	fmovdneg	%xcc,	%f8,	%f0
	alignaddrl	%o1,	%g3,	%i3
loop_810:
	bn,pt	%xcc,	loop_811
	movrgz	%o7,	0x0E1,	%l0
	ba	loop_812
	sdiv	%g6,	0x1D6C,	%i7
loop_811:
	fmovrsgz	%g2,	%f2,	%f10
	udivx	%i5,	0x1575,	%g5
loop_812:
	sll	%o2,	0x02,	%i6
	fsrc1s	%f2,	%f18
	movrgz	%i1,	%l4,	%o6
	fmovdcc	%icc,	%f0,	%f4
	alignaddrl	%g7,	%o0,	%l1
	tvc	%icc,	0x5
	bvs,a	%icc,	loop_813
	fbg	%fcc0,	loop_814
	move	%icc,	%l5,	%i4
	set	0x59, %l1
	ldstuba	[%l7 + %l1] 0x10,	%i0
loop_813:
	edge32n	%l6,	%o4,	%l2
loop_814:
	movgu	%xcc,	%g4,	%o3
	sdivx	%o5,	0x041A,	%i2
	movrne	%g1,	%o1,	%l3
	umulcc	%g3,	%i3,	%o7
	fbe,a	%fcc0,	loop_815
	movle	%icc,	%g6,	%l0
	fmovdleu	%icc,	%f27,	%f15
	tsubcc	%i7,	%i5,	%g2
loop_815:
	andncc	%o2,	%i6,	%g5
	tcc	%xcc,	0x4
	movle	%xcc,	%l4,	%i1
	movge	%icc,	%o6,	%g7
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tvs	%icc,	0x5
	bge,a,pt	%xcc,	loop_816
	edge16ln	%o0,	%l1,	%i4
	set	0x6A, %i5
	ldstuba	[%l7 + %i5] 0x10,	%i0
loop_816:
	subc	%l6,	0x1F8B,	%o4
	sllx	%l2,	%g4,	%o3
	lduw	[%l7 + 0x68],	%o5
	fabss	%f7,	%f9
	stw	%i2,	[%l7 + 0x20]
	fcmped	%fcc2,	%f28,	%f22
	sdivcc	%l5,	0x1963,	%g1
	fbue	%fcc1,	loop_817
	movrgez	%l3,	%o1,	%g3
	taddcctv	%o7,	%i3,	%l0
	movrgz	%i7,	0x08F,	%g6
loop_817:
	fmovsg	%icc,	%f30,	%f22
	fbuge,a	%fcc1,	loop_818
	swap	[%l7 + 0x3C],	%i5
	bshuffle	%f22,	%f28,	%f28
	fandnot1	%f10,	%f24,	%f18
loop_818:
	fbl,a	%fcc1,	loop_819
	mulx	%g2,	%o2,	%g5
	edge16n	%i6,	%l4,	%o6
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x64] %asi
loop_819:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i1,	%o0,	%l1
	fnegd	%f18,	%f0
	orcc	%g7,	%i4,	%i0
	fbg	%fcc3,	loop_820
	addc	%o4,	%l6,	%g4
	fxors	%f2,	%f30,	%f6
	andn	%o3,	0x1DFE,	%o5
loop_820:
	prefetch	[%l7 + 0x64],	 0x2
	smul	%l2,	0x0A68,	%l5
	tpos	%icc,	0x0
	tvs	%icc,	0x1
	movcs	%xcc,	%i2,	%g1
	fmovsn	%icc,	%f17,	%f31
	move	%xcc,	%l3,	%g3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o7,	%i3
	fmovde	%icc,	%f23,	%f31
	srlx	%l0,	0x1A,	%i7
	sllx	%g6,	0x1C,	%o1
	fmovscs	%xcc,	%f5,	%f14
	fbn	%fcc0,	loop_821
	fnand	%f28,	%f0,	%f28
	movl	%icc,	%i5,	%g2
	fors	%f2,	%f21,	%f29
loop_821:
	movneg	%icc,	%o2,	%g5
	tge	%icc,	0x2
	edge16	%i6,	%o6,	%l4
	sth	%i1,	[%l7 + 0x42]
	tneg	%icc,	0x0
	edge8n	%o0,	%l1,	%i4
	sdivx	%g7,	0x0DED,	%o4
	mulx	%i0,	%g4,	%o3
	fornot1	%f4,	%f26,	%f0
	tne	%icc,	0x5
	movleu	%xcc,	%l6,	%o5
	array16	%l2,	%l5,	%g1
	set	0x5C, %l5
	lduba	[%l7 + %l5] 0x18,	%i2
	mulx	%g3,	0x0987,	%l3
	add	%o7,	0x1DD2,	%i3
	sdiv	%i7,	0x0E6C,	%g6
	xnorcc	%o1,	0x14E6,	%l0
	udiv	%i5,	0x1150,	%o2
	movpos	%xcc,	%g2,	%i6
	sub	%o6,	0x1048,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l4,	%o0,	%l1
	tcs	%icc,	0x1
	tleu	%xcc,	0x5
	brnz,a	%i4,	loop_822
	prefetch	[%l7 + 0x10],	 0x0
	udivx	%g7,	0x07F2,	%o4
	be,pt	%icc,	loop_823
loop_822:
	fcmpgt16	%f14,	%f14,	%i0
	be,a,pt	%xcc,	loop_824
	movneg	%icc,	%i1,	%o3
loop_823:
	ta	%xcc,	0x7
	fmovdvc	%icc,	%f9,	%f26
loop_824:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%l2
	fbne,a	%fcc1,	loop_825
	te	%icc,	0x0
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x73] %asi,	%l6
loop_825:
	smulcc	%g1,	0x1050,	%l5
	srl	%i2,	0x1D,	%l3
	fpackfix	%f0,	%f0
	fmovrsgz	%g3,	%f5,	%f18
	fmul8sux16	%f28,	%f18,	%f30
	fbl	%fcc2,	loop_826
	brnz,a	%i3,	loop_827
	movneg	%icc,	%o7,	%i7
	tcc	%icc,	0x4
loop_826:
	edge32	%g6,	%o1,	%i5
loop_827:
	fmovdpos	%icc,	%f13,	%f0
	movvc	%xcc,	%o2,	%g2
	sdiv	%i6,	0x1A0A,	%o6
	orncc	%g5,	0x06E2,	%l0
	movg	%xcc,	%l4,	%o0
	brgez,a	%i4,	loop_828
	bcs	loop_829
	sll	%l1,	0x03,	%g7
	movvc	%xcc,	%i0,	%o4
loop_828:
	array8	%i1,	%g4,	%o5
loop_829:
	fpadd32s	%f2,	%f22,	%f31
	tvc	%xcc,	0x7
	fmovrde	%o3,	%f16,	%f0
	andncc	%l6,	%g1,	%l2
	fbn	%fcc0,	loop_830
	stw	%i2,	[%l7 + 0x50]
	fandnot1	%f16,	%f28,	%f16
	movne	%xcc,	%l3,	%g3
loop_830:
	bge,pt	%xcc,	loop_831
	bvs,a,pt	%xcc,	loop_832
	fmovsn	%icc,	%f30,	%f13
	brz,a	%l5,	loop_833
loop_831:
	for	%f12,	%f12,	%f24
loop_832:
	array32	%o7,	%i7,	%i3
	fpmerge	%f30,	%f6,	%f6
loop_833:
	fmovsn	%icc,	%f28,	%f0
	orn	%g6,	0x1CE6,	%o1
	fmovdvs	%xcc,	%f21,	%f18
	umul	%i5,	%o2,	%g2
	fands	%f3,	%f3,	%f7
	set	0x18, %o2
	prefetcha	[%l7 + %o2] 0x19,	 0x0
	stbar
	tle	%icc,	0x2
	lduw	[%l7 + 0x38],	%g5
	popc	%o6,	%l4
	tsubcctv	%l0,	%o0,	%i4
	fnor	%f16,	%f8,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l1,	%i0
	udivx	%g7,	0x089D,	%o4
	tsubcctv	%g4,	0x1E1E,	%o5
	andncc	%i1,	%l6,	%g1
	sethi	0x1965,	%o3
	tleu	%xcc,	0x2
	fbn,a	%fcc1,	loop_834
	edge8ln	%i2,	%l3,	%g3
	bvc,a,pt	%xcc,	loop_835
	edge8ln	%l5,	%l2,	%o7
loop_834:
	fmul8ulx16	%f10,	%f4,	%f16
	bleu,a,pn	%icc,	loop_836
loop_835:
	tleu	%icc,	0x4
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x48] %asi,	%i3
loop_836:
	addcc	%g6,	%i7,	%i5
	fornot1s	%f17,	%f2,	%f15
	andcc	%o1,	0x0A96,	%g2
	andn	%o2,	%i6,	%g5
	tvs	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%xcc,	%f2,	%f27
	and	%o6,	0x17D9,	%l4
	andncc	%o0,	%i4,	%l0
	sll	%i0,	%l1,	%o4
	sdiv	%g4,	0x0AE1,	%g7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%i1
	fmovdneg	%icc,	%f30,	%f22
	brlez	%g1,	loop_837
	lduh	[%l7 + 0x48],	%o3
	bgu	loop_838
	siam	0x2
loop_837:
	sll	%l6,	0x1B,	%i2
	flush	%l7 + 0x6C
loop_838:
	array16	%g3,	%l5,	%l2
	andn	%l3,	%o7,	%i3
	be,pn	%xcc,	loop_839
	fmovrdlez	%g6,	%f30,	%f24
	alignaddr	%i5,	%o1,	%i7
	te	%xcc,	0x4
loop_839:
	fmovd	%f22,	%f8
	srax	%o2,	0x00,	%g2
	sllx	%i6,	0x06,	%o6
	fbn	%fcc0,	loop_840
	movrgz	%g5,	%o0,	%i4
	movrne	%l0,	0x316,	%l4
	movrne	%l1,	0x3DB,	%o4
loop_840:
	add	%g4,	0x1578,	%g7
	move	%icc,	%i0,	%o5
	mulx	%i1,	0x01A3,	%o3
	move	%xcc,	%l6,	%g1
	for	%f14,	%f24,	%f14
	subcc	%g3,	0x0089,	%i2
	fbuge,a	%fcc2,	loop_841
	fcmped	%fcc3,	%f28,	%f2
	edge8n	%l5,	%l3,	%o7
	fnot2s	%f15,	%f22
loop_841:
	sllx	%i3,	%g6,	%l2
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x44] %asi,	%f8
	alignaddrl	%i5,	%i7,	%o2
	movn	%xcc,	%o1,	%i6
	fbn	%fcc3,	loop_842
	edge32n	%o6,	%g5,	%o0
	tvs	%xcc,	0x0
	fpadd32	%f8,	%f20,	%f12
loop_842:
	fzero	%f2
	tvc	%icc,	0x6
	tl	%xcc,	0x4
	orncc	%i4,	%g2,	%l0
	ble,a,pn	%icc,	loop_843
	fmovsge	%xcc,	%f30,	%f19
	movrgez	%l4,	%l1,	%o4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x80,	%g7,	%i0
loop_843:
	fmovsne	%icc,	%f18,	%f21
	fmul8ulx16	%f4,	%f30,	%f18
	edge8l	%g4,	%o5,	%i1
	movrlez	%o3,	0x242,	%l6
	edge16l	%g3,	%g1,	%i2
	edge16n	%l3,	%o7,	%i3
	ba,pn	%xcc,	loop_844
	movrne	%g6,	%l2,	%i5
	movpos	%xcc,	%l5,	%o2
	movge	%xcc,	%i7,	%i6
loop_844:
	sir	0x1822
	smulcc	%o6,	%g5,	%o0
	array32	%i4,	%o1,	%l0
	tsubcctv	%l4,	%l1,	%o4
	fmovda	%xcc,	%f5,	%f29
	bvs,a	loop_845
	edge16	%g2,	%g7,	%i0
	popc	0x0AE1,	%o5
	tcs	%xcc,	0x0
loop_845:
	fandnot2	%f0,	%f2,	%f14
	add	%g4,	%i1,	%o3
	mulx	%g3,	0x14A6,	%l6
	fcmpgt16	%f20,	%f26,	%g1
	alignaddr	%i2,	%l3,	%o7
	movpos	%xcc,	%g6,	%i3
	tneg	%icc,	0x4
	mulx	%i5,	%l2,	%o2
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x58] %asi,	%l5
	fmovs	%f4,	%f19
	alignaddrl	%i7,	%o6,	%g5
	ldsw	[%l7 + 0x64],	%i6
	ldsb	[%l7 + 0x79],	%i4
	membar	0x20
	fmovdn	%icc,	%f13,	%f16
	tsubcc	%o1,	%l0,	%l4
	sth	%o0,	[%l7 + 0x18]
	popc	%o4,	%l1
	movrgz	%g2,	0x266,	%g7
	edge8ln	%o5,	%i0,	%i1
	edge16n	%g4,	%g3,	%o3
	wr	%g0,	0x89,	%asi
	stha	%l6,	[%l7 + 0x36] %asi
	movl	%xcc,	%i2,	%g1
	xor	%l3,	%g6,	%i3
	brz	%i5,	loop_846
	movrgz	%l2,	0x107,	%o2
	udivx	%l5,	0x0964,	%i7
	fnot1s	%f5,	%f9
loop_846:
	ldx	[%l7 + 0x70],	%o7
	edge32ln	%g5,	%i6,	%i4
	wr	%g0,	0x04,	%asi
	stda	%o0,	[%l7 + 0x70] %asi
	movcs	%icc,	%l0,	%l4
	addcc	%o6,	0x1825,	%o4
	movrgez	%l1,	%g2,	%o0
	fandnot2s	%f5,	%f6,	%f24
	orcc	%o5,	%g7,	%i1
	subcc	%g4,	0x0C3E,	%g3
	edge16n	%i0,	%o3,	%l6
	edge16	%i2,	%l3,	%g6
	tn	%xcc,	0x0
	andncc	%g1,	%i5,	%l2
	movg	%xcc,	%i3,	%o2
	mulscc	%l5,	0x09AB,	%o7
	add	%i7,	0x0B86,	%i6
	bcc,a,pt	%xcc,	loop_847
	udivcc	%g5,	0x0345,	%i4
	membar	0x26
	fandnot1	%f8,	%f10,	%f20
loop_847:
	xor	%o1,	0x0119,	%l0
	tsubcc	%l4,	%o6,	%o4
	movre	%g2,	0x21B,	%l1
	movrgz	%o0,	0x392,	%o5
	udiv	%i1,	0x1928,	%g4
	tle	%xcc,	0x3
	tle	%icc,	0x3
	fbuge	%fcc0,	loop_848
	movg	%xcc,	%g7,	%i0
	sllx	%g3,	%l6,	%o3
	brgz	%i2,	loop_849
loop_848:
	tpos	%icc,	0x6
	sdivcc	%g6,	0x0D33,	%l3
	fmovdcs	%icc,	%f6,	%f0
loop_849:
	ba,a	%xcc,	loop_850
	sethi	0x1AD4,	%g1
	edge16l	%l2,	%i3,	%i5
	movgu	%icc,	%o2,	%l5
loop_850:
	brz	%i7,	loop_851
	fandnot2	%f30,	%f0,	%f12
	tle	%xcc,	0x0
	xnor	%i6,	0x168B,	%g5
loop_851:
	fmovdg	%xcc,	%f16,	%f18
	orcc	%i4,	0x07ED,	%o7
	or	%l0,	0x037E,	%o1
	movrne	%o6,	%o4,	%l4
	xnor	%l1,	0x03FE,	%o0
	fcmple32	%f18,	%f10,	%o5
	orncc	%i1,	0x082C,	%g4
	sdivx	%g2,	0x17A1,	%i0
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x80
	movrgz	%g3,	0x163,	%g7
	te	%icc,	0x0
	movge	%icc,	%l6,	%i2
	edge32l	%g6,	%o3,	%l3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x11,	%g1,	%l2
	bg,a	loop_852
	udivcc	%i5,	0x13DE,	%o2
	movg	%icc,	%i3,	%l5
	movrlez	%i7,	%i6,	%i4
loop_852:
	tleu	%xcc,	0x2
	fmovsleu	%icc,	%f19,	%f12
	faligndata	%f30,	%f24,	%f20
	edge32n	%o7,	%g5,	%o1
	movn	%xcc,	%l0,	%o4
	bgu,a	loop_853
	mulscc	%o6,	0x033A,	%l1
	movn	%xcc,	%o0,	%o5
	tn	%icc,	0x4
loop_853:
	subccc	%i1,	%g4,	%l4
	fcmpeq32	%f20,	%f26,	%i0
	bcs,pt	%xcc,	loop_854
	movvc	%xcc,	%g3,	%g2
	udivcc	%l6,	0x04BB,	%i2
	fsrc1	%f2,	%f22
loop_854:
	fcmpeq32	%f30,	%f16,	%g6
	edge16ln	%g7,	%l3,	%o3
	fmovde	%xcc,	%f29,	%f3
	sra	%l2,	%i5,	%o2
	tge	%icc,	0x1
	edge16n	%i3,	%l5,	%i7
	fmovrdne	%i6,	%f12,	%f0
	stbar
	fba,a	%fcc1,	loop_855
	fcmpeq32	%f14,	%f8,	%i4
	fandnot1	%f22,	%f30,	%f22
	fmovs	%f9,	%f11
loop_855:
	sdivx	%o7,	0x0FDC,	%g1
	sllx	%o1,	%l0,	%o4
	movl	%xcc,	%g5,	%o6
	movrgez	%o0,	0x37E,	%o5
	orcc	%l1,	0x165C,	%i1
	edge16	%l4,	%g4,	%g3
	and	%i0,	0x04ED,	%l6
	tg	%xcc,	0x1
	tvs	%icc,	0x4
	fpadd16s	%f10,	%f30,	%f2
	fxnors	%f18,	%f0,	%f28
	edge32l	%g2,	%i2,	%g7
	ldsh	[%l7 + 0x64],	%l3
	movg	%xcc,	%o3,	%g6
	umul	%l2,	%o2,	%i5
	bcs,pt	%xcc,	loop_856
	fmuld8sux16	%f31,	%f8,	%f2
	ldsw	[%l7 + 0x40],	%l5
	tpos	%icc,	0x0
loop_856:
	sethi	0x1006,	%i3
	fmovsneg	%icc,	%f29,	%f27
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x0A] %asi,	%i6
	fmovsgu	%xcc,	%f22,	%f10
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i4,	%i7
	bshuffle	%f14,	%f12,	%f6
	fnegs	%f12,	%f28
	fmovrdne	%o7,	%f26,	%f12
	prefetch	[%l7 + 0x18],	 0x3
	brnz	%o1,	loop_857
	stx	%l0,	[%l7 + 0x40]
	fpadd32	%f28,	%f18,	%f2
	fble	%fcc0,	loop_858
loop_857:
	fmovdneg	%icc,	%f5,	%f6
	sra	%g1,	0x1D,	%g5
	fmovsg	%icc,	%f28,	%f6
loop_858:
	edge8ln	%o6,	%o4,	%o0
	fbuge	%fcc1,	loop_859
	edge16n	%l1,	%o5,	%l4
	set	0x44, %o3
	lduha	[%l7 + %o3] 0x88,	%i1
loop_859:
	fbne,a	%fcc1,	loop_860
	fpadd16s	%f3,	%f20,	%f12
	te	%icc,	0x6
	xor	%g3,	%i0,	%g4
loop_860:
	movvs	%xcc,	%l6,	%g2
	edge8	%g7,	%i2,	%l3
	addcc	%g6,	0x14B9,	%l2
	fmovse	%icc,	%f19,	%f24
	fexpand	%f4,	%f22
	alignaddrl	%o3,	%o2,	%l5
	edge16	%i5,	%i3,	%i6
	stb	%i7,	[%l7 + 0x49]
	ldstub	[%l7 + 0x23],	%o7
	tsubcctv	%i4,	%l0,	%g1
	tn	%icc,	0x2
	fbu	%fcc0,	loop_861
	fnands	%f29,	%f23,	%f18
	udivx	%o1,	0x1786,	%o6
	movrgz	%g5,	%o0,	%l1
loop_861:
	movrgez	%o4,	0x3C9,	%o5
	brlz	%l4,	loop_862
	edge32ln	%i1,	%g3,	%i0
	ld	[%l7 + 0x18],	%f5
	fornot2s	%f20,	%f5,	%f2
loop_862:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%g4,	%g2
	fmovdcc	%xcc,	%f29,	%f4
	bcs,a	%xcc,	loop_863
	mulscc	%l6,	0x06CB,	%i2
	fmovsle	%xcc,	%f0,	%f22
	fmovsneg	%xcc,	%f31,	%f4
loop_863:
	movn	%xcc,	%l3,	%g7
	tg	%xcc,	0x5
	brgez	%g6,	loop_864
	movvc	%icc,	%l2,	%o2
	set	0x48, %i0
	stxa	%o3,	[%l7 + %i0] 0x11
loop_864:
	movl	%icc,	%i5,	%i3
	fmovda	%icc,	%f0,	%f14
	andncc	%l5,	%i6,	%o7
	nop
	setx	loop_865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdgez	%i7,	%f24,	%f20
	wr	%g0,	0x2b,	%asi
	stwa	%i4,	[%l7 + 0x7C] %asi
	membar	#Sync
loop_865:
	andncc	%g1,	%o1,	%l0
	edge8ln	%o6,	%g5,	%l1
	fnegd	%f16,	%f18
	brz	%o0,	loop_866
	tgu	%icc,	0x3
	sub	%o5,	%o4,	%i1
	membar	0x7F
loop_866:
	edge8l	%l4,	%i0,	%g3
	movleu	%xcc,	%g4,	%l6
	bne	%icc,	loop_867
	movge	%xcc,	%i2,	%l3
	movcc	%xcc,	%g7,	%g6
	tpos	%icc,	0x2
loop_867:
	movrne	%l2,	0x3B4,	%g2
	tge	%icc,	0x4
	fnands	%f17,	%f18,	%f25
	udivx	%o3,	0x05A7,	%i5
	tcc	%xcc,	0x2
	lduw	[%l7 + 0x0C],	%o2
	sllx	%i3,	0x03,	%i6
	fandnot1s	%f6,	%f16,	%f3
	sethi	0x12E4,	%o7
	fbue	%fcc1,	loop_868
	fcmpne16	%f18,	%f26,	%l5
	movrgez	%i4,	0x3F0,	%g1
	fmovrsgez	%o1,	%f12,	%f23
loop_868:
	movleu	%xcc,	%i7,	%o6
	ldub	[%l7 + 0x34],	%g5
	brz	%l0,	loop_869
	bvc,pn	%icc,	loop_870
	subc	%l1,	%o5,	%o0
	edge32ln	%o4,	%l4,	%i0
loop_869:
	fnand	%f8,	%f16,	%f16
loop_870:
	andn	%g3,	%g4,	%i1
	brlez,a	%i2,	loop_871
	fbule,a	%fcc2,	loop_872
	edge16	%l6,	%g7,	%l3
	array32	%g6,	%g2,	%l2
loop_871:
	movle	%icc,	%i5,	%o2
loop_872:
	nop
	wr	%g0,	0xea,	%asi
	stha	%i3,	[%l7 + 0x20] %asi
	membar	#Sync
	tsubcc	%i6,	%o7,	%l5
	smul	%o3,	0x1DCA,	%g1
	movrne	%o1,	0x093,	%i4
	fcmple16	%f22,	%f18,	%o6
	brlez,a	%i7,	loop_873
	fmovs	%f26,	%f2
	movrne	%l0,	%g5,	%o5
	mulscc	%l1,	%o4,	%o0
loop_873:
	movne	%xcc,	%l4,	%i0
	fmovsl	%icc,	%f6,	%f2
	bleu,a,pt	%icc,	loop_874
	addcc	%g3,	0x0492,	%g4
	fmovrdlz	%i2,	%f12,	%f8
	movrlz	%l6,	0x20B,	%i1
loop_874:
	fors	%f3,	%f17,	%f18
	fnors	%f15,	%f3,	%f3
	fcmpne16	%f14,	%f22,	%g7
	fcmps	%fcc0,	%f3,	%f14
	wr	%g0,	0x2f,	%asi
	stba	%l3,	[%l7 + 0x76] %asi
	membar	#Sync
	udiv	%g2,	0x0025,	%l2
	tl	%xcc,	0x1
	edge32	%g6,	%i5,	%i3
	bgu	loop_875
	fmul8sux16	%f4,	%f28,	%f14
	udivcc	%i6,	0x0434,	%o7
	fbu	%fcc1,	loop_876
loop_875:
	movge	%xcc,	%l5,	%o3
	fbe	%fcc2,	loop_877
	subccc	%g1,	%o2,	%o1
loop_876:
	xnor	%o6,	%i4,	%l0
	fbul	%fcc3,	loop_878
loop_877:
	fbug	%fcc0,	loop_879
	fmovse	%icc,	%f8,	%f8
	tn	%icc,	0x3
loop_878:
	tle	%xcc,	0x3
loop_879:
	ld	[%l7 + 0x20],	%f28
	fmovdn	%icc,	%f0,	%f19
	fpsub16	%f0,	%f8,	%f14
	tl	%xcc,	0x7
	stw	%g5,	[%l7 + 0x5C]
	sir	0x0F98
	set	0x2C, %i7
	lda	[%l7 + %i7] 0x04,	%f22
	set	0x38, %g3
	prefetcha	[%l7 + %g3] 0x18,	 0x3
	bneg	%xcc,	loop_880
	movle	%xcc,	%o5,	%o4
	fnot2	%f8,	%f30
	fnot1s	%f31,	%f31
loop_880:
	mova	%xcc,	%o0,	%l1
	movl	%xcc,	%i0,	%l4
	ta	%icc,	0x4
	fmovrsgez	%g4,	%f1,	%f15
	addccc	%i2,	%l6,	%i1
	umulcc	%g7,	%l3,	%g3
	bvc,pt	%xcc,	loop_881
	srlx	%g2,	0x1B,	%l2
	move	%xcc,	%i5,	%i3
	fmovdl	%icc,	%f1,	%f23
loop_881:
	andn	%g6,	0x0892,	%i6
	fmovdpos	%xcc,	%f28,	%f0
	addc	%o7,	%l5,	%g1
	alignaddrl	%o3,	%o2,	%o6
	and	%o1,	%l0,	%g5
	sdivcc	%i4,	0x1D13,	%i7
	addc	%o4,	0x1D0B,	%o0
	fornot1	%f12,	%f4,	%f0
	xnorcc	%l1,	%o5,	%i0
	movl	%icc,	%l4,	%i2
	edge32ln	%g4,	%i1,	%l6
	udivx	%g7,	0x1731,	%g3
	array16	%l3,	%g2,	%i5
	fmovda	%xcc,	%f31,	%f7
	fmovdge	%icc,	%f27,	%f19
	andncc	%i3,	%g6,	%l2
	umul	%o7,	%l5,	%i6
	fnand	%f2,	%f30,	%f8
	set	0x76, %l3
	lduha	[%l7 + %l3] 0x0c,	%g1
	edge16ln	%o3,	%o2,	%o1
	nop
	setx	loop_882,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%icc,	%o6,	%l0
	fsrc2	%f10,	%f6
	nop
	setx loop_883, %l0, %l1
	jmpl %l1, %i4
loop_882:
	or	%g5,	0x123D,	%i7
	array16	%o4,	%l1,	%o0
	mova	%icc,	%i0,	%o5
loop_883:
	andncc	%l4,	%g4,	%i2
	tg	%xcc,	0x7
	tneg	%xcc,	0x0
	tpos	%xcc,	0x1
	fcmps	%fcc2,	%f11,	%f13
	and	%l6,	0x0F00,	%g7
	movgu	%xcc,	%g3,	%l3
	nop
	set	0x74, %o0
	sth	%g2,	[%l7 + %o0]
	brnz	%i5,	loop_884
	nop
	setx loop_885, %l0, %l1
	jmpl %l1, %i3
	srl	%i1,	%l2,	%g6
	fmovdneg	%xcc,	%f21,	%f17
loop_884:
	fbule,a	%fcc1,	loop_886
loop_885:
	tl	%xcc,	0x4
	fmovd	%f8,	%f12
	movvc	%icc,	%l5,	%o7
loop_886:
	sra	%g1,	%i6,	%o2
	movle	%icc,	%o3,	%o1
	fnor	%f6,	%f0,	%f12
	fandnot1	%f20,	%f18,	%f24
	movpos	%xcc,	%o6,	%i4
	fpsub32s	%f18,	%f14,	%f1
	fcmpes	%fcc2,	%f28,	%f20
	tneg	%xcc,	0x7
	nop
	setx loop_887, %l0, %l1
	jmpl %l1, %g5
	fmovsgu	%xcc,	%f0,	%f27
	umul	%i7,	%l0,	%o4
	tcc	%icc,	0x7
loop_887:
	ldx	[%l7 + 0x20],	%l1
	andncc	%i0,	%o5,	%o0
	movge	%xcc,	%g4,	%l4
	movl	%icc,	%l6,	%g7
	membar	0x38
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	smulcc	%i2,	%l3,	%g3
	movrlz	%g2,	0x19B,	%i5
	sllx	%i3,	%l2,	%i1
	array32	%l5,	%o7,	%g1
	edge32ln	%g6,	%i6,	%o3
	fnot1	%f28,	%f22
	lduw	[%l7 + 0x28],	%o1
	srax	%o2,	0x0C,	%o6
	orncc	%g5,	0x1F3A,	%i4
	movleu	%icc,	%i7,	%l0
	movne	%icc,	%l1,	%o4
	ldsh	[%l7 + 0x0C],	%o5
	fnand	%f16,	%f2,	%f26
	tsubcc	%i0,	%g4,	%l4
	subccc	%l6,	0x1E6D,	%g7
	be,a,pn	%icc,	loop_888
	array32	%o0,	%i2,	%g3
	fzero	%f6
	alignaddrl	%g2,	%i5,	%i3
loop_888:
	fbug,a	%fcc1,	loop_889
	movl	%icc,	%l2,	%i1
	fbne,a	%fcc1,	loop_890
	tg	%icc,	0x2
loop_889:
	movrgez	%l5,	%o7,	%g1
	add	%l3,	0x1B09,	%i6
loop_890:
	and	%g6,	%o3,	%o1
	movrgz	%o6,	0x24D,	%o2
	movrgz	%g5,	%i4,	%l0
	xnorcc	%i7,	0x0FEF,	%o4
	edge8n	%l1,	%i0,	%g4
	xnor	%l4,	0x1A35,	%l6
	bcc,a,pt	%xcc,	loop_891
	std	%o4,	[%l7 + 0x40]
	xorcc	%o0,	%g7,	%i2
	ldsb	[%l7 + 0x48],	%g2
loop_891:
	movcc	%icc,	%i5,	%g3
	umulcc	%i3,	0x0652,	%i1
	sra	%l2,	0x01,	%l5
	bvc,a,pn	%icc,	loop_892
	tneg	%icc,	0x5
	edge8l	%g1,	%o7,	%l3
	xnor	%g6,	0x0D72,	%i6
loop_892:
	tl	%icc,	0x7
	membar	0x1D
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o1,	%o6
	fsrc2s	%f12,	%f5
	lduw	[%l7 + 0x60],	%o2
	fmul8x16au	%f23,	%f21,	%f20
	movpos	%xcc,	%o3,	%g5
	edge32n	%l0,	%i7,	%o4
	tne	%icc,	0x0
	or	%l1,	%i0,	%g4
	fpadd32	%f24,	%f12,	%f26
	sdivx	%i4,	0x1019,	%l6
	xnorcc	%o5,	%o0,	%g7
	fandnot1	%f16,	%f16,	%f2
	smul	%i2,	%g2,	%l4
	sra	%g3,	0x02,	%i5
	set	0x54, %l4
	lduwa	[%l7 + %l4] 0x0c,	%i3
	fmovrdgez	%i1,	%f24,	%f10
	swap	[%l7 + 0x28],	%l2
	edge16ln	%g1,	%o7,	%l3
	movvc	%icc,	%l5,	%g6
	alignaddrl	%i6,	%o6,	%o1
	fmovdle	%icc,	%f15,	%f22
	andncc	%o3,	%o2,	%l0
	addccc	%g5,	0x03AB,	%i7
	fmovscc	%icc,	%f0,	%f18
	fabsd	%f0,	%f16
	taddcc	%l1,	%i0,	%o4
	andncc	%i4,	%g4,	%l6
	fcmpne32	%f22,	%f0,	%o5
	movvc	%xcc,	%g7,	%i2
	fmovrse	%g2,	%f17,	%f14
	stx	%o0,	[%l7 + 0x18]
	movpos	%xcc,	%l4,	%i5
	smul	%g3,	0x0206,	%i3
	tvc	%icc,	0x6
	call	loop_893
	subc	%i1,	0x0D94,	%g1
	movpos	%icc,	%l2,	%l3
	fcmpeq16	%f12,	%f8,	%l5
loop_893:
	subcc	%g6,	0x0C1C,	%i6
	addccc	%o6,	0x1604,	%o7
	sllx	%o3,	0x0A,	%o2
	stw	%o1,	[%l7 + 0x0C]
	edge16l	%l0,	%i7,	%g5
	ldsw	[%l7 + 0x50],	%l1
	fnot2	%f24,	%f26
	brlz,a	%o4,	loop_894
	brlez	%i0,	loop_895
	bn	%xcc,	loop_896
	smulcc	%g4,	%i4,	%o5
loop_894:
	edge8ln	%l6,	%i2,	%g7
loop_895:
	movvs	%xcc,	%g2,	%l4
loop_896:
	srax	%o0,	0x1D,	%i5
	or	%g3,	%i1,	%i3
	array16	%g1,	%l2,	%l5
	std	%f10,	[%l7 + 0x30]
	stw	%l3,	[%l7 + 0x38]
	taddcctv	%g6,	0x1A18,	%o6
	fcmpne32	%f30,	%f20,	%o7
	alignaddr	%i6,	%o2,	%o3
	xnor	%o1,	%l0,	%g5
	or	%i7,	%o4,	%i0
	sdivcc	%l1,	0x0A83,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x6
	udivcc	%o5,	0x06A9,	%l6
	sra	%i4,	0x0D,	%i2
	fmovdvc	%icc,	%f5,	%f17
	fmovsleu	%icc,	%f19,	%f26
	orn	%g7,	0x0DF6,	%l4
	fmul8x16	%f7,	%f14,	%f20
	mulx	%g2,	%i5,	%g3
	edge8ln	%o0,	%i3,	%g1
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x60] %asi,	%i1
	move	%xcc,	%l5,	%l2
	xorcc	%g6,	0x01BF,	%l3
	fmovsg	%xcc,	%f6,	%f0
	fsrc2s	%f0,	%f23
	addccc	%o6,	0x0087,	%o7
	umulcc	%i6,	0x19AC,	%o3
	edge16	%o1,	%o2,	%l0
	fpadd16s	%f18,	%f1,	%f10
	bleu,a	loop_897
	tpos	%icc,	0x7
	tne	%xcc,	0x5
	umulcc	%g5,	%i7,	%i0
loop_897:
	sll	%o4,	%l1,	%g4
	movrne	%o5,	%l6,	%i4
	set	0x72, %g2
	lduha	[%l7 + %g2] 0x88,	%i2
	fbul	%fcc2,	loop_898
	taddcctv	%l4,	%g2,	%g7
	set	0x6C, %g4
	lda	[%l7 + %g4] 0x15,	%f25
loop_898:
	bl,a	loop_899
	edge16l	%g3,	%o0,	%i3
	fmovdcs	%icc,	%f30,	%f8
	fmovdcs	%xcc,	%f29,	%f22
loop_899:
	addc	%g1,	%i5,	%l5
	fsrc1	%f24,	%f22
	fsrc1s	%f7,	%f14
	movl	%xcc,	%l2,	%i1
	set	0x44, %g6
	lduha	[%l7 + %g6] 0x88,	%g6
	sll	%o6,	0x17,	%l3
	ldd	[%l7 + 0x40],	%o6
	xnor	%i6,	0x024F,	%o3
	movrgz	%o1,	0x2F9,	%l0
	umulcc	%o2,	%g5,	%i7
	udivcc	%o4,	0x1405,	%l1
	tleu	%xcc,	0x6
	brlz	%i0,	loop_900
	subccc	%g4,	0x0D46,	%l6
	fbg,a	%fcc3,	loop_901
	tsubcctv	%i4,	%i2,	%o5
loop_900:
	std	%f30,	[%l7 + 0x40]
	fandnot1	%f20,	%f4,	%f2
loop_901:
	fpadd16	%f8,	%f30,	%f14
	tle	%icc,	0x1
	andn	%g2,	%g7,	%g3
	subc	%l4,	0x11E7,	%o0
	xnorcc	%i3,	0x10C5,	%i5
	tsubcctv	%g1,	0x13BD,	%l5
	edge16l	%l2,	%g6,	%o6
	set	0x24, %i6
	lda	[%l7 + %i6] 0x10,	%f22
	fmovs	%f14,	%f18
	fmul8x16	%f21,	%f28,	%f0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	array32	%l3,	%i6,	%o7
	andn	%o3,	0x1762,	%o1
	sth	%o2,	[%l7 + 0x76]
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%g5
	fnands	%f23,	%f13,	%f6
	sdiv	%l0,	0x0C2E,	%o4
	movrgez	%l1,	%i0,	%g4
	movpos	%xcc,	%i7,	%i4
	sll	%i2,	0x1D,	%l6
	fbge,a	%fcc0,	loop_902
	movle	%xcc,	%o5,	%g7
	mulx	%g2,	%l4,	%g3
	xnor	%i3,	0x0A8F,	%i5
loop_902:
	movvc	%xcc,	%g1,	%o0
	tne	%xcc,	0x1
	nop
	setx	loop_903,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bpos,pt	%icc,	loop_904
	fpsub32	%f10,	%f12,	%f26
	bg,a	loop_905
loop_903:
	taddcctv	%l5,	%l2,	%g6
loop_904:
	array8	%i1,	%l3,	%i6
	fmovdn	%icc,	%f25,	%f19
loop_905:
	fnands	%f3,	%f10,	%f5
	fmovdne	%icc,	%f29,	%f31
	fxor	%f10,	%f16,	%f0
	sir	0x16C2
	fmovdleu	%xcc,	%f26,	%f20
	umul	%o6,	%o7,	%o1
	nop
	setx	loop_906,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%o3,	0x1304,	%o2
	movpos	%xcc,	%l0,	%g5
	taddcctv	%o4,	0x02E9,	%i0
loop_906:
	xnor	%l1,	0x0E26,	%i7
	sth	%g4,	[%l7 + 0x6C]
	edge32	%i2,	%i4,	%o5
	edge8	%g7,	%l6,	%g2
	and	%l4,	%i3,	%g3
	addcc	%i5,	0x0D21,	%g1
	fcmpne32	%f26,	%f30,	%o0
	movleu	%xcc,	%l5,	%g6
	set	0x60, %g7
	ldda	[%l7 + %g7] 0xeb,	%l2
	tl	%xcc,	0x1
	tcc	%icc,	0x3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x37] %asi,	%i1
	set	0x78, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0x3
	movcc	%icc,	%o6,	%l3
	fbul	%fcc2,	loop_907
	tn	%xcc,	0x7
	movle	%xcc,	%o7,	%o3
	movle	%icc,	%o1,	%l0
loop_907:
	brnz	%g5,	loop_908
	brlez,a	%o2,	loop_909
	sub	%o4,	0x05D9,	%l1
	fbn	%fcc0,	loop_910
loop_908:
	tpos	%xcc,	0x5
loop_909:
	brnz	%i0,	loop_911
	sdiv	%i7,	0x0002,	%g4
loop_910:
	bvc,a	loop_912
	sll	%i4,	0x14,	%i2
loop_911:
	srax	%o5,	0x06,	%g7
	movn	%xcc,	%g2,	%l6
loop_912:
	nop
	set	0x70, %i4
	sta	%f18,	[%l7 + %i4] 0x18
	fpsub16	%f20,	%f22,	%f8
	set	0x28, %l2
	ldxa	[%l7 + %l2] 0x15,	%l4
	srl	%i3,	%g3,	%g1
	tneg	%icc,	0x6
	srax	%i5,	%o0,	%g6
	fmovdne	%icc,	%f21,	%f1
	tg	%icc,	0x6
	fblg,a	%fcc2,	loop_913
	edge8n	%l2,	%i1,	%i6
	bneg,a,pn	%icc,	loop_914
	xnorcc	%l5,	0x0558,	%l3
loop_913:
	add	%o7,	%o6,	%o3
	nop
	setx	loop_915,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_914:
	sdivx	%o1,	0x0E8C,	%g5
	addcc	%o2,	0x0279,	%o4
	edge16	%l0,	%l1,	%i7
loop_915:
	addccc	%i0,	%i4,	%i2
	fbul	%fcc1,	loop_916
	edge8l	%o5,	%g7,	%g4
	edge16l	%g2,	%l4,	%l6
	xorcc	%i3,	%g3,	%g1
loop_916:
	movne	%xcc,	%o0,	%g6
	andcc	%i5,	%i1,	%i6
	ldsb	[%l7 + 0x6B],	%l5
	subc	%l3,	%l2,	%o6
	ldd	[%l7 + 0x08],	%f20
	alignaddr	%o7,	%o3,	%g5
	andncc	%o1,	%o4,	%l0
	movvc	%xcc,	%o2,	%i7
	fornot1	%f28,	%f30,	%f20
	movne	%icc,	%l1,	%i0
	brz,a	%i2,	loop_917
	fcmple16	%f14,	%f20,	%o5
	tgu	%xcc,	0x4
	movn	%icc,	%i4,	%g4
loop_917:
	fnegd	%f2,	%f16
	movge	%xcc,	%g2,	%l4
	movn	%xcc,	%l6,	%i3
	edge16	%g7,	%g1,	%g3
	andn	%o0,	%i5,	%g6
	fornot1s	%f26,	%f2,	%f31
	fmul8ulx16	%f12,	%f0,	%f26
	fandnot1s	%f13,	%f8,	%f15
	fmovdleu	%xcc,	%f5,	%f5
	srlx	%i6,	0x06,	%l5
	move	%xcc,	%l3,	%i1
	fors	%f1,	%f12,	%f8
	be,a,pn	%icc,	loop_918
	alignaddrl	%o6,	%l2,	%o3
	lduh	[%l7 + 0x58],	%g5
	fmovdl	%icc,	%f28,	%f22
loop_918:
	fmovsneg	%xcc,	%f11,	%f0
	sub	%o7,	0x11A3,	%o4
	stb	%o1,	[%l7 + 0x40]
	sdivcc	%o2,	0x0DCD,	%i7
	movneg	%xcc,	%l1,	%i0
	set	0x53, %o1
	lduba	[%l7 + %o1] 0x14,	%l0
	set	0x70, %i1
	swapa	[%l7 + %i1] 0x80,	%i2
	smul	%i4,	%o5,	%g2
	bleu,pn	%xcc,	loop_919
	bgu,a	loop_920
	flush	%l7 + 0x64
	andn	%g4,	%l4,	%i3
loop_919:
	movrlez	%l6,	%g1,	%g3
loop_920:
	bvc	loop_921
	umul	%g7,	0x17F5,	%i5
	fornot1s	%f22,	%f23,	%f9
	edge32l	%o0,	%g6,	%i6
loop_921:
	fxnor	%f2,	%f14,	%f28
	fnot2	%f14,	%f4
	smulcc	%l5,	0x0D60,	%l3
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x70] %asi,	%o6
	fmovsa	%xcc,	%f5,	%f18
	subccc	%i1,	%l2,	%g5
	edge8n	%o7,	%o4,	%o3
	fnand	%f28,	%f26,	%f10
	tgu	%icc,	0x0
	fsrc1s	%f31,	%f9
	sir	0x13AD
	set	0x368, %i3
	nop 	! 	nop 	! 	ldxa	[%g0 + %i3] 0x40,	%o1 ripped by fixASI40.pl ripped by fixASI40.pl
	fand	%f22,	%f10,	%f8
	fbe,a	%fcc1,	loop_922
	movleu	%xcc,	%o2,	%l1
	fmovsn	%xcc,	%f27,	%f28
	fnor	%f4,	%f22,	%f20
loop_922:
	nop
	setx loop_923, %l0, %l1
	jmpl %l1, %i7
	fpmerge	%f0,	%f15,	%f22
	bshuffle	%f12,	%f22,	%f6
	fmovd	%f30,	%f18
loop_923:
	fsrc1s	%f17,	%f21
	set	0x7C, %o7
	stwa	%l0,	[%l7 + %o7] 0xe3
	membar	#Sync
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i2
	ba	loop_924
	fnot2s	%f5,	%f31
	bleu,a	%xcc,	loop_925
	fmovsvs	%icc,	%f24,	%f3
loop_924:
	bl,a	%xcc,	loop_926
	array8	%i4,	%i0,	%o5
loop_925:
	lduh	[%l7 + 0x46],	%g4
	movrlez	%l4,	%g2,	%l6
loop_926:
	fbg,a	%fcc0,	loop_927
	srl	%i3,	0x01,	%g1
	bvs	%icc,	loop_928
	bleu,pn	%xcc,	loop_929
loop_927:
	fmovdvc	%xcc,	%f5,	%f10
	movrne	%g7,	%g3,	%o0
loop_928:
	fba,a	%fcc1,	loop_930
loop_929:
	addc	%g6,	0x1D9A,	%i6
	xor	%l5,	0x0783,	%i5
	movvs	%icc,	%l3,	%o6
loop_930:
	orcc	%l2,	%g5,	%i1
	fnor	%f14,	%f30,	%f0
	edge16l	%o7,	%o3,	%o1
	tvs	%icc,	0x5
	movrgez	%o4,	%l1,	%o2
	edge32ln	%i7,	%i2,	%l0
	tl	%xcc,	0x1
	brgz,a	%i0,	loop_931
	lduh	[%l7 + 0x2C],	%o5
	alignaddr	%g4,	%i4,	%g2
	edge32ln	%l4,	%i3,	%g1
loop_931:
	ldd	[%l7 + 0x08],	%f12
	fmovrdlz	%g7,	%f18,	%f24
	edge32l	%l6,	%g3,	%g6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%i6
	addccc	%o0,	%l5,	%i5
	fmovdcc	%xcc,	%f28,	%f21
	movre	%o6,	0x207,	%l3
	movvs	%xcc,	%g5,	%i1
	sethi	0x0BED,	%l2
	fmovrsgz	%o7,	%f22,	%f2
	edge8n	%o1,	%o3,	%l1
	sll	%o2,	0x04,	%i7
	andn	%o4,	0x0DBF,	%i2
	edge8l	%l0,	%o5,	%i0
	fexpand	%f14,	%f2
	membar	0x15
	ldd	[%l7 + 0x50],	%f22
	stbar
	tcs	%icc,	0x4
	tvs	%icc,	0x2
	movleu	%xcc,	%g4,	%i4
	bne,a,pn	%xcc,	loop_932
	orncc	%l4,	0x1DA6,	%g2
	addccc	%i3,	0x1FF7,	%g1
	fzeros	%f21
loop_932:
	fandnot2	%f26,	%f6,	%f20
	edge8n	%g7,	%l6,	%g6
	popc	%g3,	%i6
	membar	0x18
	be,pt	%xcc,	loop_933
	tg	%xcc,	0x0
	tcc	%xcc,	0x3
	mova	%icc,	%o0,	%l5
loop_933:
	tle	%icc,	0x2
	fmovsge	%xcc,	%f22,	%f1
	fmovdcc	%icc,	%f26,	%f18
	lduw	[%l7 + 0x68],	%o6
	tpos	%xcc,	0x7
	call	loop_934
	fpsub32s	%f10,	%f20,	%f12
	set	0x0A, %o6
	ldstuba	[%l7 + %o6] 0x80,	%i5
loop_934:
	tg	%xcc,	0x0
	tvs	%xcc,	0x5
	nop
	setx	loop_935,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	membar	0x25
	movvs	%icc,	%g5,	%l3
	fbul,a	%fcc1,	loop_936
loop_935:
	fandnot2s	%f20,	%f0,	%f7
	taddcc	%l2,	%i1,	%o1
	edge8l	%o3,	%o7,	%l1
loop_936:
	addc	%i7,	0x1DCA,	%o4
	fcmpeq32	%f8,	%f10,	%o2
	fbul	%fcc0,	loop_937
	std	%f12,	[%l7 + 0x68]
	edge32	%l0,	%o5,	%i2
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_937:
	alignaddrl	%g4,	%i0,	%i4
	movrlez	%g2,	%i3,	%g1
	movle	%icc,	%l4,	%l6
	bvs,a	%xcc,	loop_938
	edge32l	%g6,	%g7,	%i6
	xnor	%o0,	%l5,	%o6
	ldsw	[%l7 + 0x68],	%g3
loop_938:
	edge32ln	%g5,	%l3,	%l2
	fandnot2s	%f8,	%f12,	%f0
	stw	%i5,	[%l7 + 0x3C]
	st	%f6,	[%l7 + 0x0C]
	movpos	%xcc,	%o1,	%o3
	tne	%icc,	0x0
	fmovdvc	%icc,	%f18,	%f5
	std	%o6,	[%l7 + 0x60]
	udiv	%l1,	0x08DD,	%i7
	edge32ln	%o4,	%i1,	%l0
	flush	%l7 + 0x68
	std	%f16,	[%l7 + 0x30]
	array16	%o5,	%i2,	%g4
	lduh	[%l7 + 0x0C],	%o2
	mulscc	%i4,	0x06EC,	%g2
	xor	%i3,	0x1CDD,	%i0
	xnorcc	%g1,	%l4,	%g6
	edge16ln	%g7,	%i6,	%o0
	edge16ln	%l5,	%l6,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o6,	%g5,	%l3
	tcc	%xcc,	0x7
	movrlez	%l2,	0x229,	%i5
	tn	%icc,	0x2
	addccc	%o1,	0x0E98,	%o3
	tge	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xor	%l1,	%o7,	%o4
	mulx	%i7,	0x1599,	%i1
	edge8	%l0,	%o5,	%g4
	edge16	%o2,	%i2,	%g2
	brgez	%i3,	loop_939
	flush	%l7 + 0x34
	tvc	%xcc,	0x6
	brnz	%i4,	loop_940
loop_939:
	udivcc	%g1,	0x07AB,	%l4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%i0
loop_940:
	fones	%f30
	fbe,a	%fcc3,	loop_941
	fmovse	%icc,	%f27,	%f5
	fmul8x16	%f28,	%f22,	%f30
	movcc	%icc,	%g7,	%i6
loop_941:
	nop
	setx	loop_942,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x3
	tge	%icc,	0x3
	set	0x68, %l6
	ldxa	[%l7 + %l6] 0x18,	%g6
loop_942:
	orcc	%l5,	0x0947,	%o0
	tgu	%xcc,	0x5
	edge16l	%g3,	%l6,	%o6
	nop
	set	0x6C, %o5
	stw	%l3,	[%l7 + %o5]
	taddcc	%g5,	0x18FC,	%i5
	mova	%xcc,	%l2,	%o1
	movrgz	%l1,	%o3,	%o4
	tvs	%icc,	0x6
	fzero	%f2
	smul	%o7,	%i7,	%i1
	fbule,a	%fcc1,	loop_943
	fmovrsne	%l0,	%f25,	%f7
	brgz	%g4,	loop_944
	fnands	%f27,	%f7,	%f1
loop_943:
	flush	%l7 + 0x54
	fble	%fcc0,	loop_945
loop_944:
	lduh	[%l7 + 0x70],	%o5
	movre	%i2,	0x094,	%g2
	tgu	%xcc,	0x7
loop_945:
	fone	%f4
	fcmple16	%f18,	%f2,	%i3
	fbul,a	%fcc3,	loop_946
	edge32n	%i4,	%o2,	%l4
	orncc	%g1,	%i0,	%g7
	movvc	%icc,	%i6,	%g6
loop_946:
	fcmpne16	%f2,	%f2,	%o0
	movrlz	%l5,	%l6,	%g3
	orcc	%l3,	0x10DD,	%g5
	fmovsge	%xcc,	%f24,	%f26
	tgu	%xcc,	0x0
	swap	[%l7 + 0x1C],	%o6
	fmovdle	%icc,	%f2,	%f24
	set	0x18, %o4
	stda	%i4,	[%l7 + %o4] 0x2b
	membar	#Sync
	bvs,a,pn	%icc,	loop_947
	fmovdgu	%icc,	%f1,	%f15
	fmul8x16	%f6,	%f30,	%f30
	udivx	%l2,	0x07B2,	%o1
loop_947:
	orcc	%o3,	%o4,	%l1
	fpadd32s	%f15,	%f31,	%f11
	xnorcc	%o7,	%i1,	%i7
	fmovrslez	%l0,	%f2,	%f20
	stb	%o5,	[%l7 + 0x53]
	popc	%g4,	%g2
	tle	%xcc,	0x5
	addc	%i2,	%i3,	%i4
	fmovdgu	%xcc,	%f5,	%f28
	edge32	%l4,	%g1,	%i0
	movrlez	%o2,	%g7,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g6,	0x10,	%o0
	siam	0x0
	fbo	%fcc0,	loop_948
	move	%xcc,	%l5,	%g3
	movl	%xcc,	%l6,	%l3
	wr	%g0,	0x80,	%asi
	sta	%f14,	[%l7 + 0x1C] %asi
loop_948:
	fcmpeq32	%f16,	%f24,	%g5
	add	%i5,	0x1616,	%l2
	orncc	%o6,	%o1,	%o4
	edge8l	%l1,	%o7,	%o3
	tcs	%icc,	0x1
	ba,a,pt	%icc,	loop_949
	edge8l	%i1,	%i7,	%l0
	fbl	%fcc1,	loop_950
	fornot2	%f6,	%f18,	%f4
loop_949:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x3C] %asi,	%o5
loop_950:
	ldsh	[%l7 + 0x3E],	%g2
	tge	%xcc,	0x0
	stbar
	umulcc	%g4,	%i3,	%i4
	xnor	%l4,	0x0F10,	%i2
	fmuld8ulx16	%f27,	%f27,	%f28
	movgu	%xcc,	%i0,	%g1
	xor	%o2,	%g7,	%i6
	lduh	[%l7 + 0x26],	%o0
	fandnot2s	%f4,	%f26,	%f30
	fmovdge	%xcc,	%f21,	%f3
	ba,a,pt	%icc,	loop_951
	movrgz	%l5,	%g3,	%g6
	edge32ln	%l3,	%g5,	%i5
	sdivcc	%l2,	0x12B2,	%l6
loop_951:
	nop
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	bpos,pn	%icc,	loop_952
	movrgez	%o1,	0x39E,	%o4
	prefetch	[%l7 + 0x20],	 0x1
	tl	%xcc,	0x5
loop_952:
	tsubcctv	%o6,	%l1,	%o3
	umul	%o7,	0x10DB,	%i7
	fbe,a	%fcc1,	loop_953
	nop
	set	0x38, %g1
	ldx	[%l7 + %g1],	%i1
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_953:
	sethi	0x0B2F,	%l0
	tg	%xcc,	0x5
	sll	%g2,	0x1A,	%g4
	bgu	%xcc,	loop_954
	bne	%xcc,	loop_955
	subc	%o5,	0x14BA,	%i3
	movrgz	%i4,	0x227,	%i2
loop_954:
	tvc	%icc,	0x0
loop_955:
	brnz,a	%i0,	loop_956
	siam	0x1
	andncc	%g1,	%l4,	%g7
	tle	%xcc,	0x1
loop_956:
	tg	%icc,	0x4
	ldsh	[%l7 + 0x3E],	%i6
	fzero	%f0
	movl	%xcc,	%o0,	%o2
	fzero	%f12
	movgu	%xcc,	%g3,	%l5
	mulx	%l3,	%g5,	%g6
	nop
	set	0x30, %l1
	ldsh	[%l7 + %l1],	%i5
	ld	[%l7 + 0x28],	%f17
	te	%icc,	0x5
	lduw	[%l7 + 0x58],	%l6
	edge32	%l2,	%o1,	%o6
	fbu,a	%fcc3,	loop_957
	movvs	%icc,	%o4,	%l1
	tge	%xcc,	0x2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x30] %asi,	%f27
loop_957:
	nop
	set	0x78, %l0
	swapa	[%l7 + %l0] 0x19,	%o7
	fandnot2s	%f7,	%f31,	%f23
	fsrc2	%f0,	%f10
	smul	%i7,	0x1EE3,	%o3
	or	%l0,	%g2,	%g4
	edge8n	%o5,	%i3,	%i4
	tpos	%icc,	0x2
	fmovsvs	%xcc,	%f20,	%f8
	set	0x40, %l5
	stda	%f16,	[%l7 + %l5] 0x80
	fmovrdgz	%i2,	%f16,	%f0
	brlez	%i0,	loop_958
	be,a	loop_959
	lduh	[%l7 + 0x4E],	%g1
	set	0x2D, %o2
	stba	%i1,	[%l7 + %o2] 0xe2
	membar	#Sync
loop_958:
	tle	%icc,	0x6
loop_959:
	orn	%l4,	%g7,	%i6
	sdiv	%o2,	0x1AC0,	%g3
	ldstub	[%l7 + 0x1B],	%o0
	srax	%l5,	0x14,	%g5
	fbuge	%fcc0,	loop_960
	fmovdl	%xcc,	%f6,	%f22
	udivx	%g6,	0x08DE,	%l3
	fcmpgt32	%f20,	%f10,	%l6
loop_960:
	movle	%xcc,	%l2,	%o1
	movrgz	%o6,	%i5,	%l1
	fpadd32	%f26,	%f4,	%f12
	tle	%icc,	0x1
	te	%icc,	0x7
	ta	%icc,	0x5
	edge16n	%o4,	%i7,	%o3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] %asi,	%o7,	%g2
	wr	%g0,	0x80,	%asi
	stwa	%l0,	[%l7 + 0x7C] %asi
	tcc	%xcc,	0x3
	tl	%xcc,	0x7
	tne	%xcc,	0x0
	tvc	%xcc,	0x4
	tge	%xcc,	0x3
	nop
	setx	loop_961,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivx	%g4,	0x066E,	%o5
	membar	0x28
	fcmpeq16	%f26,	%f12,	%i3
loop_961:
	prefetch	[%l7 + 0x1C],	 0x2
	fnot1	%f0,	%f26
	ldd	[%l7 + 0x38],	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i2,	0x091F,	%i0
	swap	[%l7 + 0x3C],	%i1
	addc	%l4,	0x14DD,	%g1
	brlz	%i6,	loop_962
	fpadd32	%f28,	%f10,	%f16
	tn	%icc,	0x7
	set	0x7C, %i5
	ldswa	[%l7 + %i5] 0x15,	%g7
loop_962:
	fand	%f10,	%f14,	%f14
	taddcctv	%g3,	0x148A,	%o2
	fpack16	%f16,	%f12
	stb	%l5,	[%l7 + 0x5B]
	array16	%o0,	%g6,	%g5
	movneg	%xcc,	%l3,	%l2
	movle	%icc,	%l6,	%o1
	tge	%xcc,	0x2
	taddcc	%o6,	0x1330,	%i5
	fnot1	%f24,	%f12
	fbn,a	%fcc0,	loop_963
	movvc	%icc,	%o4,	%l1
	fpack16	%f4,	%f4
	addc	%o3,	%i7,	%o7
loop_963:
	andncc	%l0,	%g2,	%g4
	tleu	%xcc,	0x0
	array8	%o5,	%i4,	%i2
	edge8	%i3,	%i1,	%l4
	bcc	loop_964
	nop
	set	0x20, %o3
	std	%f14,	[%l7 + %o3]
	te	%xcc,	0x3
	bgu,pt	%xcc,	loop_965
loop_964:
	umulcc	%g1,	%i0,	%g7
	edge32	%i6,	%g3,	%l5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x17] %asi,	%o0
loop_965:
	nop
	add	%l7,	0x60,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x0c,	%o2,	%g6
	movge	%icc,	%l3,	%g5
	brz	%l6,	loop_966
	ldsh	[%l7 + 0x1C],	%l2
	fbge,a	%fcc0,	loop_967
	te	%icc,	0x5
loop_966:
	fnegd	%f16,	%f18
	tcs	%xcc,	0x1
loop_967:
	fbg,a	%fcc0,	loop_968
	bn	loop_969
	edge8ln	%o6,	%i5,	%o4
	movl	%xcc,	%o1,	%o3
loop_968:
	nop
	setx	loop_970,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_969:
	movn	%xcc,	%i7,	%o7
	umulcc	%l1,	0x1530,	%g2
	edge32ln	%l0,	%o5,	%g4
loop_970:
	nop
	setx	loop_971,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%i2,	%i3,	%i4
	fxors	%f26,	%f27,	%f0
	fornot1	%f30,	%f24,	%f26
loop_971:
	tsubcctv	%i1,	%g1,	%i0
	edge8n	%g7,	%i6,	%g3
	xnor	%l5,	0x02C9,	%l4
	nop
	set	0x38, %i0
	ldd	[%l7 + %i0],	%o0
	fnands	%f1,	%f16,	%f16
	tpos	%icc,	0x0
	popc	%o2,	%l3
	fpackfix	%f16,	%f2
	bleu,pt	%icc,	loop_972
	tvs	%icc,	0x7
	fbge	%fcc3,	loop_973
	sdiv	%g6,	0x1440,	%g5
loop_972:
	edge32n	%l2,	%l6,	%i5
	fbule	%fcc2,	loop_974
loop_973:
	fxor	%f26,	%f2,	%f28
	fmovdn	%icc,	%f24,	%f29
	set	0x10, %g5
	stha	%o6,	[%l7 + %g5] 0x10
loop_974:
	tcs	%icc,	0x4
	sub	%o1,	0x1BE9,	%o4
	addc	%o3,	%o7,	%i7
	fandnot2s	%f29,	%f4,	%f3
	fpsub16s	%f27,	%f7,	%f17
	wr	%g0,	0xea,	%asi
	stha	%g2,	[%l7 + 0x3E] %asi
	membar	#Sync
	movg	%xcc,	%l1,	%l0
	mulscc	%g4,	0x15D0,	%o5
	fones	%f2
	tpos	%icc,	0x0
	addccc	%i2,	0x0892,	%i4
	andncc	%i3,	%g1,	%i1
	fand	%f16,	%f10,	%f10
	set	0x70, %g3
	ldda	[%l7 + %g3] 0x80,	%i0
	addcc	%g7,	0x0C8F,	%g3
	add	%l7,	0x14,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l5,	%i6
	edge32ln	%o0,	%o2,	%l3
	movleu	%xcc,	%g6,	%g5
	orcc	%l4,	0x0522,	%l2
	set	0x2A, %i7
	lduha	[%l7 + %i7] 0x10,	%i5
	edge16n	%o6,	%l6,	%o1
	tge	%xcc,	0x2
	fcmpeq32	%f14,	%f12,	%o4
	ta	%icc,	0x5
	fmovsle	%icc,	%f13,	%f10
	taddcc	%o7,	%i7,	%g2
	tgu	%xcc,	0x5
	nop
	set	0x40, %o0
	std	%l0,	[%l7 + %o0]
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%o3
	subccc	%l0,	%g4,	%i2
	movrgz	%i4,	0x1B5,	%i3
	sdivcc	%o5,	0x1ABD,	%g1
	array8	%i0,	%g7,	%i1
	fmovdl	%xcc,	%f10,	%f3
	set	0x7A, %l4
	lduha	[%l7 + %l4] 0x89,	%g3
	edge16ln	%l5,	%i6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o2,	0x0A19,	%g6
	udiv	%g5,	0x1563,	%l4
	fbe	%fcc0,	loop_975
	swap	[%l7 + 0x6C],	%l3
	edge32n	%i5,	%l2,	%l6
	taddcc	%o6,	0x11D3,	%o4
loop_975:
	fmovrdgz	%o7,	%f2,	%f0
	set	0x1C, %g2
	stwa	%i7,	[%l7 + %g2] 0xea
	membar	#Sync
	brgez	%o1,	loop_976
	movg	%icc,	%g2,	%l1
	bge,a	%xcc,	loop_977
	movrgez	%l0,	%g4,	%i2
loop_976:
	bn,a,pn	%icc,	loop_978
	or	%o3,	%i4,	%i3
loop_977:
	sir	0x0C6C
	brz	%o5,	loop_979
loop_978:
	alignaddrl	%g1,	%g7,	%i0
	umul	%i1,	0x0696,	%l5
	sub	%i6,	%o0,	%g3
loop_979:
	umul	%o2,	0x144A,	%g6
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movneg	%icc,	%l4,	%g5
	edge16ln	%i5,	%l2,	%l3
	bne,a,pn	%xcc,	loop_980
	fmovsg	%xcc,	%f20,	%f30
	addccc	%o6,	0x0F82,	%o4
	sir	0x03C5
loop_980:
	umulcc	%l6,	%o7,	%i7
	tcs	%xcc,	0x5
	tneg	%icc,	0x7
	subc	%g2,	%o1,	%l1
	fmul8ulx16	%f10,	%f16,	%f6
	movle	%icc,	%l0,	%g4
	movn	%icc,	%i2,	%i4
	andn	%o3,	0x1E1E,	%o5
	movle	%xcc,	%i3,	%g1
	movleu	%xcc,	%i0,	%g7
	nop
	setx	loop_981,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	subc	%l5,	%i1,	%o0
	fxnor	%f16,	%f20,	%f16
	fmovrdne	%g3,	%f18,	%f12
loop_981:
	tge	%xcc,	0x2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x5C] %asi,	%f4
	addc	%o2,	%g6,	%i6
	fabsd	%f22,	%f16
	edge32ln	%l4,	%i5,	%g5
	addccc	%l2,	%l3,	%o4
	pdist	%f28,	%f16,	%f10
	movge	%icc,	%l6,	%o6
	subc	%i7,	%g2,	%o7
	fmovsgu	%icc,	%f7,	%f16
	lduh	[%l7 + 0x20],	%l1
	fmovd	%f28,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o1,	%l0,	%i2
	sll	%g4,	0x08,	%i4
	or	%o3,	%i3,	%g1
	brz,a	%o5,	loop_982
	fbule,a	%fcc0,	loop_983
	edge32	%g7,	%i0,	%l5
	movrlez	%i1,	0x09E,	%g3
loop_982:
	movgu	%icc,	%o0,	%o2
loop_983:
	taddcc	%i6,	0x008A,	%l4
	fmovrslz	%g6,	%f17,	%f9
	sllx	%i5,	%g5,	%l2
	sir	0x1680
	addccc	%o4,	%l3,	%l6
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x39] %asi,	%i7
	fbuge	%fcc0,	loop_984
	stx	%g2,	[%l7 + 0x18]
	sdivx	%o7,	0x1B0E,	%l1
	sdivcc	%o1,	0x0401,	%l0
loop_984:
	edge16	%i2,	%g4,	%o6
	movvs	%xcc,	%i4,	%o3
	fpack32	%f8,	%f24,	%f2
	ldsb	[%l7 + 0x2D],	%g1
	movneg	%xcc,	%o5,	%i3
	fpack32	%f30,	%f0,	%f8
	fmovrsgez	%g7,	%f4,	%f20
	taddcctv	%l5,	%i1,	%i0
	fzero	%f14
	bgu,a	%xcc,	loop_985
	fpmerge	%f26,	%f30,	%f18
	edge8n	%o0,	%o2,	%i6
	std	%f22,	[%l7 + 0x50]
loop_985:
	nop
	set	0x74, %g4
	lduwa	[%l7 + %g4] 0x11,	%l4
	xorcc	%g3,	0x1D60,	%g6
	sethi	0x0CE8,	%i5
	movpos	%xcc,	%l2,	%o4
	movneg	%icc,	%g5,	%l3
	edge8n	%l6,	%i7,	%o7
	srlx	%l1,	%o1,	%g2
	tcc	%icc,	0x0
	or	%l0,	0x1AD1,	%i2
	array8	%g4,	%o6,	%i4
	bl,pt	%xcc,	loop_986
	edge8	%g1,	%o5,	%i3
	udivx	%g7,	0x0785,	%l5
	fba,a	%fcc1,	loop_987
loop_986:
	tgu	%icc,	0x7
	smulcc	%i1,	%o3,	%o0
	ldsb	[%l7 + 0x1E],	%o2
loop_987:
	fpack32	%f22,	%f16,	%f2
	movrgz	%i0,	%i6,	%g3
	xorcc	%l4,	%i5,	%l2
	fmovrdlz	%g6,	%f6,	%f24
	tcs	%xcc,	0x0
	fmuld8sux16	%f11,	%f25,	%f10
	xor	%g5,	%l3,	%l6
	st	%f28,	[%l7 + 0x30]
	fcmpne16	%f20,	%f12,	%o4
	edge8l	%i7,	%l1,	%o1
	alignaddrl	%o7,	%l0,	%i2
	sll	%g2,	0x01,	%g4
	fpadd32s	%f19,	%f12,	%f18
	popc	0x0646,	%o6
	tne	%xcc,	0x1
	sethi	0x1965,	%i4
	ldd	[%l7 + 0x48],	%g0
	lduw	[%l7 + 0x7C],	%o5
	bvs,pt	%icc,	loop_988
	taddcctv	%g7,	0x1CE9,	%i3
	set	0x10, %g6
	ldsha	[%l7 + %g6] 0x81,	%i1
loop_988:
	sdiv	%o3,	0x1448,	%o0
	smul	%l5,	0x1F4A,	%o2
	fmul8x16al	%f13,	%f5,	%f12
	bn,a	%icc,	loop_989
	array32	%i6,	%i0,	%l4
	xnor	%g3,	%l2,	%i5
	ldstub	[%l7 + 0x6E],	%g6
loop_989:
	edge16n	%g5,	%l3,	%l6
	tgu	%xcc,	0x5
	sdivx	%o4,	0x0106,	%l1
	flush	%l7 + 0x3C
	subc	%i7,	%o7,	%l0
	fmovsneg	%icc,	%f23,	%f4
	srax	%o1,	%g2,	%i2
	taddcctv	%o6,	%g4,	%i4
	fornot1	%f0,	%f26,	%f18
	sllx	%o5,	0x18,	%g1
	andn	%g7,	0x10F4,	%i1
	smul	%o3,	0x0698,	%i3
	fpadd16s	%f31,	%f28,	%f28
	tl	%xcc,	0x0
	movneg	%xcc,	%l5,	%o0
	umulcc	%i6,	%i0,	%l4
	addcc	%o2,	0x162F,	%g3
	bn,pn	%xcc,	loop_990
	ld	[%l7 + 0x50],	%f13
	edge32l	%i5,	%l2,	%g5
	movrgez	%g6,	0x0A8,	%l3
loop_990:
	fbge	%fcc1,	loop_991
	bpos,pn	%xcc,	loop_992
	sllx	%o4,	%l6,	%l1
	tleu	%icc,	0x0
loop_991:
	bleu	%icc,	loop_993
loop_992:
	fnot2	%f12,	%f8
	sllx	%o7,	%i7,	%l0
	sll	%o1,	%g2,	%o6
loop_993:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	smulcc	%i2,	%i4,	%g4
	stw	%o5,	[%l7 + 0x60]
	subc	%g7,	%i1,	%o3
	edge8n	%i3,	%l5,	%g1
	and	%o0,	%i6,	%l4
	orn	%i0,	%g3,	%o2
	sra	%l2,	0x01,	%i5
	fands	%f19,	%f9,	%f2
	array8	%g5,	%l3,	%o4
	st	%f29,	[%l7 + 0x74]
	movle	%xcc,	%g6,	%l6
	movgu	%icc,	%o7,	%i7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l1,	%l0
	movn	%icc,	%g2,	%o1
	fmuld8sux16	%f5,	%f31,	%f26
	stbar
	fmovdvs	%icc,	%f21,	%f16
	movneg	%xcc,	%o6,	%i2
	movpos	%xcc,	%g4,	%o5
	edge16	%i4,	%i1,	%o3
	fmovde	%xcc,	%f30,	%f5
	movvc	%xcc,	%g7,	%l5
	ldstub	[%l7 + 0x7D],	%g1
	movrgez	%i3,	0x0D3,	%o0
	or	%l4,	0x0EAA,	%i6
	std	%i0,	[%l7 + 0x10]
	membar	0x1C
	movneg	%icc,	%g3,	%o2
	fba	%fcc3,	loop_994
	move	%icc,	%i5,	%g5
	fmovdl	%icc,	%f13,	%f11
	fbl	%fcc1,	loop_995
loop_994:
	edge32	%l3,	%l2,	%o4
	ble,pn	%xcc,	loop_996
	fbl	%fcc0,	loop_997
loop_995:
	fpsub16	%f0,	%f10,	%f4
	edge32ln	%l6,	%g6,	%o7
loop_996:
	fmovsn	%xcc,	%f6,	%f7
loop_997:
	array8	%l1,	%i7,	%g2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%l0
	mova	%icc,	%i2,	%o6
	bg,a	%xcc,	loop_998
	subcc	%g4,	0x1D76,	%i4
	fpadd16	%f22,	%f6,	%f20
	xorcc	%i1,	%o3,	%o5
loop_998:
	ldx	[%l7 + 0x70],	%g7
	fabss	%f20,	%f25
	sdiv	%g1,	0x045A,	%l5
	edge32l	%i3,	%l4,	%i6
	sdiv	%o0,	0x1243,	%g3
	fmovsvs	%icc,	%f13,	%f18
	umulcc	%o2,	0x0BC7,	%i5
	smulcc	%i0,	%g5,	%l3
	movrlz	%o4,	0x293,	%l6
	fpmerge	%f13,	%f25,	%f14
	array8	%g6,	%o7,	%l2
	fbu	%fcc3,	loop_999
	sll	%i7,	0x04,	%g2
	popc	0x083C,	%l1
	sra	%l0,	0x18,	%i2
loop_999:
	srax	%o6,	0x08,	%o1
	movrlz	%i4,	%g4,	%i1
	taddcctv	%o5,	%g7,	%g1
	tpos	%xcc,	0x4
	ldsb	[%l7 + 0x43],	%l5
	tvs	%xcc,	0x3
	fmovdne	%xcc,	%f26,	%f11
	fmul8x16al	%f12,	%f30,	%f0
	movne	%icc,	%i3,	%l4
	fba	%fcc0,	loop_1000
	movl	%icc,	%i6,	%o3
	brnz,a	%o0,	loop_1001
	fbule	%fcc2,	loop_1002
loop_1000:
	tsubcc	%g3,	%o2,	%i5
	fbule	%fcc2,	loop_1003
loop_1001:
	mova	%xcc,	%i0,	%g5
loop_1002:
	fmovsn	%icc,	%f25,	%f8
	array8	%o4,	%l3,	%l6
loop_1003:
	brz,a	%o7,	loop_1004
	xnorcc	%g6,	%i7,	%l2
	bleu,pt	%xcc,	loop_1005
	andcc	%l1,	0x1FBE,	%l0
loop_1004:
	movge	%icc,	%i2,	%g2
	movg	%icc,	%o1,	%i4
loop_1005:
	andncc	%g4,	%o6,	%i1
	edge8n	%o5,	%g7,	%g1
	fmovrdlz	%i3,	%f18,	%f14
	tne	%xcc,	0x7
	ta	%icc,	0x3
	faligndata	%f12,	%f2,	%f14
	sub	%l4,	0x16C3,	%l5
	orn	%i6,	%o3,	%g3
	movvs	%icc,	%o2,	%o0
	fbul,a	%fcc0,	loop_1006
	smulcc	%i5,	0x177D,	%i0
	fbo	%fcc1,	loop_1007
	fmovrdgz	%g5,	%f16,	%f24
loop_1006:
	fmovdpos	%xcc,	%f13,	%f7
	fmovdl	%icc,	%f6,	%f23
loop_1007:
	fcmple32	%f18,	%f20,	%o4
	fmovsne	%icc,	%f5,	%f11
	fmovda	%xcc,	%f0,	%f21
	movge	%xcc,	%l3,	%o7
	edge32	%g6,	%i7,	%l6
	movre	%l1,	0x379,	%l0
	edge32ln	%i2,	%g2,	%o1
	fmul8sux16	%f22,	%f0,	%f18
	or	%i4,	0x0112,	%l2
	wr	%g0,	0x80,	%asi
	sta	%f20,	[%l7 + 0x68] %asi
	addccc	%o6,	%g4,	%i1
	nop
	set	0x20, %i6
	lduw	[%l7 + %i6],	%g7
	edge8	%o5,	%i3,	%l4
	set	0x42, %l3
	lduba	[%l7 + %l3] 0x81,	%g1
	movge	%xcc,	%l5,	%o3
	mova	%icc,	%g3,	%o2
	ldsh	[%l7 + 0x50],	%o0
	fbue	%fcc1,	loop_1008
	ba,pt	%icc,	loop_1009
	sethi	0x09DC,	%i5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
loop_1008:
	xnor	%i6,	0x0392,	%o4
loop_1009:
	fxors	%f24,	%f0,	%f24
	sethi	0x0AE3,	%l3
	tl	%icc,	0x1
	bge,a,pt	%icc,	loop_1010
	edge16l	%g5,	%o7,	%g6
	sllx	%l6,	%l1,	%l0
	fbug,a	%fcc2,	loop_1011
loop_1010:
	swap	[%l7 + 0x14],	%i2
	movvs	%xcc,	%i7,	%o1
	movleu	%icc,	%g2,	%i4
loop_1011:
	movrlez	%l2,	%o6,	%i1
	udivcc	%g7,	0x0B56,	%g4
	for	%f30,	%f10,	%f22
	fnegd	%f14,	%f0
	fbge	%fcc0,	loop_1012
	movvc	%xcc,	%o5,	%i3
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%g1
loop_1012:
	fcmpd	%fcc1,	%f22,	%f22
	sdiv	%l5,	0x001E,	%o3
	edge8ln	%g3,	%o2,	%i5
	swap	[%l7 + 0x78],	%o0
	edge16l	%i0,	%i6,	%l3
	smul	%g5,	%o7,	%o4
	add	%g6,	0x0CB9,	%l1
	tpos	%xcc,	0x5
	bpos,pn	%icc,	loop_1013
	fmovsgu	%xcc,	%f14,	%f21
	taddcc	%l6,	%l0,	%i7
	faligndata	%f24,	%f26,	%f18
loop_1013:
	ldx	[%l7 + 0x18],	%o1
	std	%i2,	[%l7 + 0x20]
	fmovdl	%xcc,	%f3,	%f7
	ld	[%l7 + 0x58],	%f15
	subc	%g2,	0x12F8,	%l2
	fmovdle	%xcc,	%f24,	%f24
	tsubcctv	%i4,	0x1785,	%i1
	srl	%g7,	%o6,	%g4
	fmovrsgz	%o5,	%f21,	%f0
	fandnot1s	%f12,	%f27,	%f13
	array16	%l4,	%i3,	%g1
	array8	%l5,	%g3,	%o3
	fmovrslz	%o2,	%f28,	%f3
	smulcc	%o0,	0x11B3,	%i5
	popc	%i0,	%i6
	fandnot2	%f4,	%f16,	%f28
	fmovde	%icc,	%f28,	%f18
	sdiv	%g5,	0x1B04,	%l3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8l	%o4,	%g6,	%l1
	tg	%icc,	0x5
	fbul,a	%fcc1,	loop_1014
	fandnot1	%f30,	%f6,	%f18
	mulx	%o7,	0x1FEE,	%l0
	edge32l	%i7,	%l6,	%o1
loop_1014:
	fmovdleu	%xcc,	%f21,	%f11
	st	%f8,	[%l7 + 0x78]
	addccc	%g2,	0x0852,	%l2
	movrne	%i4,	0x319,	%i2
	fnot1s	%f21,	%f23
	movre	%i1,	0x16E,	%g7
	fbo,a	%fcc0,	loop_1015
	ldub	[%l7 + 0x1E],	%g4
	edge8l	%o6,	%o5,	%i3
	edge32	%g1,	%l5,	%l4
loop_1015:
	swap	[%l7 + 0x70],	%g3
	edge32l	%o2,	%o3,	%i5
	orn	%o0,	0x1F44,	%i0
	fcmpd	%fcc3,	%f24,	%f12
	movrne	%i6,	%g5,	%l3
	smulcc	%g6,	%o4,	%l1
	popc	0x04E5,	%o7
	fmul8ulx16	%f6,	%f14,	%f2
	tgu	%xcc,	0x1
	tge	%icc,	0x7
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
	popc	0x1EB3,	%l0
	fcmple32	%f4,	%f18,	%i7
	orn	%l6,	0x1156,	%o1
loop_1016:
	movrlez	%l2,	0x2B8,	%i4
	sdivx	%g2,	0x0482,	%i1
	orncc	%g7,	%i2,	%o6
	srl	%g4,	%i3,	%g1
	fbuge,a	%fcc2,	loop_1017
	bvc	loop_1018
	be,pn	%icc,	loop_1019
	sra	%o5,	%l4,	%l5
loop_1017:
	fba	%fcc2,	loop_1020
loop_1018:
	nop
	setx	loop_1021,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1019:
	subcc	%o2,	%o3,	%i5
	udiv	%o0,	0x0944,	%i0
loop_1020:
	bge	%xcc,	loop_1022
loop_1021:
	fand	%f2,	%f30,	%f30
	udivcc	%g3,	0x14F6,	%i6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1022:
	ldub	[%l7 + 0x0E],	%g5
	fmovsvs	%xcc,	%f23,	%f31
	array8	%l3,	%o4,	%l1
	bvs	%xcc,	loop_1023
	fmovdg	%icc,	%f11,	%f0
	umulcc	%g6,	0x1268,	%l0
	xnor	%i7,	0x0E45,	%o7
loop_1023:
	movrlz	%l6,	0x0E9,	%o1
	or	%i4,	%l2,	%g2
	xorcc	%i1,	0x0756,	%g7
	movrgez	%i2,	0x156,	%g4
	sub	%o6,	%i3,	%g1
	andncc	%l4,	%o5,	%o2
	fornot2	%f28,	%f28,	%f24
	bl,a	%xcc,	loop_1024
	movpos	%icc,	%o3,	%i5
	fmovsle	%xcc,	%f11,	%f29
	alignaddr	%o0,	%l5,	%i0
loop_1024:
	xor	%g3,	%g5,	%l3
	wr	%g0,	0x81,	%asi
	stxa	%i6,	[%l7 + 0x70] %asi
	set	0x18, %i2
	ldsha	[%l7 + %i2] 0x80,	%o4
	fexpand	%f5,	%f16
	ta	%icc,	0x0
	fbo,a	%fcc1,	loop_1025
	fmovdcc	%xcc,	%f12,	%f4
	sra	%l1,	0x1D,	%l0
	edge16ln	%g6,	%o7,	%i7
loop_1025:
	fmovdn	%icc,	%f21,	%f4
	fbo,a	%fcc1,	loop_1026
	alignaddrl	%l6,	%o1,	%i4
	movn	%icc,	%g2,	%i1
	fmovrse	%l2,	%f12,	%f7
loop_1026:
	fbue,a	%fcc3,	loop_1027
	edge8l	%i2,	%g4,	%o6
	tne	%xcc,	0x6
	movg	%icc,	%g7,	%g1
loop_1027:
	movneg	%icc,	%l4,	%o5
	andcc	%i3,	0x12FE,	%o3
	fbug,a	%fcc2,	loop_1028
	orcc	%i5,	0x148B,	%o0
	fmul8x16au	%f3,	%f7,	%f4
	te	%icc,	0x0
loop_1028:
	alignaddr	%l5,	%i0,	%o2
	andcc	%g3,	0x051C,	%g5
	or	%i6,	%o4,	%l1
	fbn	%fcc3,	loop_1029
	movl	%xcc,	%l3,	%g6
	ldstub	[%l7 + 0x5B],	%o7
	xnor	%l0,	0x0226,	%i7
loop_1029:
	sub	%o1,	0x09D7,	%l6
	fbug	%fcc3,	loop_1030
	fand	%f10,	%f10,	%f28
	nop
	set	0x10, %g7
	ldx	[%l7 + %g7],	%g2
	movrne	%i4,	%l2,	%i2
loop_1030:
	fba,a	%fcc3,	loop_1031
	udivx	%i1,	0x01CD,	%o6
	taddcctv	%g7,	0x00FA,	%g1
	subc	%l4,	0x1603,	%o5
loop_1031:
	bvs	%icc,	loop_1032
	fmovdcc	%icc,	%f15,	%f23
	orncc	%g4,	%i3,	%o3
	nop
	setx	loop_1033,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1032:
	sdivcc	%i5,	0x061A,	%l5
	fone	%f22
	move	%icc,	%i0,	%o0
loop_1033:
	fmovscc	%xcc,	%f15,	%f11
	nop
	set	0x60, %i4
	stx	%o2,	[%l7 + %i4]
	edge8	%g5,	%i6,	%o4
	bge	%xcc,	loop_1034
	tsubcctv	%l1,	0x0FC6,	%l3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%g6
loop_1034:
	tsubcc	%g3,	0x15B1,	%o7
	orn	%i7,	%l0,	%l6
	sra	%g2,	%i4,	%l2
	edge8ln	%i2,	%o1,	%o6
	set	0x47, %o1
	ldsba	[%l7 + %o1] 0x18,	%i1
	fsrc1	%f28,	%f20
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%g1,	[%g0 + 0x3c0] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	fsrc2s	%f14,	%f5
	edge8l	%g7,	%o5,	%g4
	edge8	%i3,	%l4,	%i5
	tleu	%xcc,	0x3
	movrlz	%o3,	%i0,	%o0
	orcc	%o2,	0x0E97,	%l5
	movpos	%xcc,	%i6,	%g5
	movcc	%xcc,	%o4,	%l1
	and	%g6,	%g3,	%l3
	brnz,a	%o7,	loop_1035
	fmovspos	%xcc,	%f27,	%f25
	taddcc	%l0,	%l6,	%i7
	fbn,a	%fcc3,	loop_1036
loop_1035:
	ble	loop_1037
	sub	%g2,	%l2,	%i4
	fbge	%fcc2,	loop_1038
loop_1036:
	edge8n	%i2,	%o6,	%i1
loop_1037:
	fbne	%fcc1,	loop_1039
	and	%o1,	0x0EE5,	%g1
loop_1038:
	edge16l	%o5,	%g4,	%g7
	fmovdvs	%xcc,	%f9,	%f17
loop_1039:
	ldub	[%l7 + 0x38],	%i3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x5A] %asi,	%l4
	mulx	%o3,	%i5,	%i0
	fcmpd	%fcc2,	%f14,	%f6
	tsubcctv	%o0,	0x1D0C,	%o2
	tne	%icc,	0x7
	andcc	%i6,	%g5,	%l5
	fmovsgu	%xcc,	%f3,	%f15
	subccc	%o4,	%g6,	%l1
	fcmple16	%f14,	%f22,	%l3
	tsubcc	%o7,	0x0DA0,	%g3
	edge8n	%l0,	%l6,	%i7
	for	%f14,	%f28,	%f10
	addcc	%g2,	%l2,	%i4
	ldstub	[%l7 + 0x74],	%i2
	fmul8ulx16	%f12,	%f6,	%f24
	fpsub32	%f4,	%f8,	%f8
	fpsub32s	%f7,	%f17,	%f25
	taddcc	%i1,	%o1,	%o6
	fcmpeq16	%f22,	%f0,	%g1
	set	0x0C, %i1
	ldstuba	[%l7 + %i1] 0x89,	%g4
	pdist	%f16,	%f14,	%f18
	te	%icc,	0x1
	tleu	%icc,	0x5
	ta	%icc,	0x4
	tle	%xcc,	0x1
	flush	%l7 + 0x0C
	fmovdneg	%icc,	%f24,	%f12
	call	loop_1040
	movvc	%icc,	%g7,	%i3
	taddcc	%l4,	%o3,	%i5
	fbuge,a	%fcc3,	loop_1041
loop_1040:
	be,a	loop_1042
	ldd	[%l7 + 0x58],	%f22
	array32	%i0,	%o5,	%o0
loop_1041:
	movge	%xcc,	%o2,	%i6
loop_1042:
	fbug,a	%fcc1,	loop_1043
	move	%xcc,	%l5,	%o4
	lduw	[%l7 + 0x28],	%g5
	movvs	%xcc,	%g6,	%l3
loop_1043:
	edge8	%o7,	%g3,	%l0
	alignaddrl	%l6,	%l1,	%i7
	fnor	%f2,	%f28,	%f18
	fmovsleu	%icc,	%f2,	%f28
	fbg,a	%fcc2,	loop_1044
	tpos	%icc,	0x3
	fcmpgt32	%f18,	%f2,	%g2
	be,a,pn	%icc,	loop_1045
loop_1044:
	movcs	%icc,	%l2,	%i2
	sub	%i4,	0x04EF,	%i1
	ld	[%l7 + 0x10],	%f27
loop_1045:
	tge	%icc,	0x1
	edge16	%o6,	%g1,	%g4
	fmovdcs	%icc,	%f14,	%f4
	movre	%o1,	0x39D,	%i3
	movcc	%xcc,	%l4,	%g7
	brnz,a	%o3,	loop_1046
	fmovrdlz	%i0,	%f20,	%f30
	movcc	%icc,	%i5,	%o0
	lduh	[%l7 + 0x14],	%o5
loop_1046:
	edge8n	%i6,	%o2,	%o4
	fbne,a	%fcc0,	loop_1047
	fbge,a	%fcc0,	loop_1048
	smul	%l5,	0x0FD1,	%g6
	srlx	%g5,	0x1A,	%l3
loop_1047:
	swap	[%l7 + 0x34],	%g3
loop_1048:
	tl	%xcc,	0x5
	xor	%o7,	%l6,	%l0
	nop
	setx	loop_1049,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%l1,	0x0BF,	%i7
	edge32ln	%l2,	%g2,	%i4
	sdivcc	%i1,	0x1FD0,	%i2
loop_1049:
	edge8n	%g1,	%o6,	%o1
	movle	%icc,	%i3,	%g4
	wr	%g0,	0xe3,	%asi
	stda	%l4,	[%l7 + 0x30] %asi
	membar	#Sync
	set	0x34, %i3
	stha	%o3,	[%l7 + %i3] 0x15
	movrlz	%i0,	%g7,	%o0
	set	0x18, %o7
	ldxa	[%g0 + %o7] 0x50,	%i5
	umul	%i6,	0x167F,	%o5
	tleu	%xcc,	0x2
	fbg	%fcc0,	loop_1050
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f24,	%f26,	%f10
	mulx	%o4,	0x1801,	%o2
loop_1050:
	alignaddr	%l5,	%g6,	%g5
	set	0x70, %l2
	swapa	[%l7 + %l2] 0x80,	%l3
	movle	%xcc,	%g3,	%o7
	mulx	%l6,	%l1,	%i7
	fble	%fcc2,	loop_1051
	te	%icc,	0x7
	taddcc	%l2,	%g2,	%l0
	fmuld8ulx16	%f19,	%f26,	%f28
loop_1051:
	nop
	wr	%g0,	0x11,	%asi
	stha	%i4,	[%l7 + 0x16] %asi
	movrgez	%i2,	0x110,	%g1
	smulcc	%i1,	%o1,	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%g4
	set	0x28, %l6
	ldxa	[%g0 + %l6] 0x4f,	%l4
	fnot2s	%f10,	%f29
	nop
	setx	loop_1052,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32ln	%o3,	%g7,	%o0
	movrgez	%i5,	0x33B,	%i6
	movpos	%xcc,	%i0,	%o5
loop_1052:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%o4,	0x054C,	%o2
	edge32ln	%g6,	%l5,	%l3
	sllx	%g3,	%g5,	%l6
	addc	%o7,	%l1,	%l2
	fandnot1	%f28,	%f18,	%f16
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%i7
	bpos,a	loop_1053
	tvs	%icc,	0x6
	sir	0x1F6B
	edge16	%l0,	%i4,	%i2
loop_1053:
	tge	%icc,	0x1
	movrlz	%g1,	%i1,	%g2
	fpmerge	%f27,	%f23,	%f6
	fornot1	%f16,	%f6,	%f10
	bcc	loop_1054
	tneg	%xcc,	0x5
	addcc	%o1,	0x11DE,	%o6
	set	0x32, %o4
	lduha	[%l7 + %o4] 0x89,	%g4
loop_1054:
	srl	%i3,	%l4,	%o3
	movcs	%icc,	%g7,	%i5
	ldd	[%l7 + 0x70],	%f6
	edge16l	%o0,	%i6,	%i0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x68] %asi,	%o4
	fsrc2	%f0,	%f8
	edge16n	%o2,	%o5,	%g6
	fmovrde	%l3,	%f14,	%f12
	udivx	%l5,	0x17D6,	%g5
	umulcc	%g3,	%l6,	%l1
	movre	%o7,	0x196,	%l2
	fmuld8sux16	%f28,	%f12,	%f12
	st	%f15,	[%l7 + 0x7C]
	fornot1	%f24,	%f18,	%f22
	udiv	%i7,	0x05DC,	%l0
	set	0x18, %o5
	stxa	%i4,	[%l7 + %o5] 0x81
	movn	%icc,	%i2,	%g1
	tg	%icc,	0x1
	fbul	%fcc1,	loop_1055
	lduh	[%l7 + 0x42],	%g2
	movrlz	%o1,	%o6,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1055:
	call	loop_1056
	edge8	%g4,	%l4,	%o3
	xnorcc	%g7,	0x11C4,	%i3
	fandnot1s	%f18,	%f19,	%f11
loop_1056:
	edge16	%o0,	%i5,	%i0
	fones	%f1
	andn	%i6,	%o2,	%o4
	and	%g6,	%o5,	%l5
	movrgez	%l3,	0x0E0,	%g3
	fmovsg	%icc,	%f12,	%f29
	edge8n	%l6,	%g5,	%l1
	movpos	%icc,	%o7,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x54],	%l0
	bge,a,pn	%icc,	loop_1057
	movge	%icc,	%i4,	%i2
	srax	%g1,	%l2,	%g2
	or	%o6,	0x1FDC,	%o1
loop_1057:
	fmovs	%f0,	%f25
	mulx	%i1,	%g4,	%o3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x70] %asi,	%f11
	udivx	%l4,	0x149A,	%i3
	orn	%o0,	%i5,	%i0
	tpos	%xcc,	0x1
	sdivx	%g7,	0x0E57,	%o2
	sir	0x0B07
	fbn,a	%fcc1,	loop_1058
	movvc	%xcc,	%i6,	%g6
	fnot2	%f10,	%f22
	movrgez	%o4,	%l5,	%l3
loop_1058:
	edge8ln	%o5,	%l6,	%g5
	tvc	%xcc,	0x5
	tsubcctv	%g3,	%l1,	%i7
	fbge,a	%fcc1,	loop_1059
	fbuge,a	%fcc1,	loop_1060
	sdivx	%o7,	0x15A1,	%i4
	fbl	%fcc3,	loop_1061
loop_1059:
	array32	%i2,	%g1,	%l2
loop_1060:
	tsubcc	%g2,	%l0,	%o6
	array8	%o1,	%i1,	%g4
loop_1061:
	addc	%l4,	%i3,	%o0
	brlez,a	%o3,	loop_1062
	fexpand	%f24,	%f8
	addccc	%i5,	%g7,	%i0
	edge8	%o2,	%g6,	%i6
loop_1062:
	movle	%icc,	%l5,	%l3
	taddcctv	%o5,	0x01C8,	%l6
	fmovrdgez	%o4,	%f12,	%f18
	udivcc	%g5,	0x1FE9,	%g3
	fmovdl	%icc,	%f1,	%f12
	andncc	%i7,	%o7,	%l1
	sdiv	%i4,	0x1181,	%i2
	ta	%xcc,	0x7
	fandnot2	%f22,	%f14,	%f12
	edge16	%g1,	%g2,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l0,	0x0E19,	%o6
	and	%i1,	0x1B44,	%g4
	orcc	%l4,	%i3,	%o1
	subccc	%o0,	%i5,	%g7
	fand	%f4,	%f26,	%f2
	fmovsne	%xcc,	%f23,	%f28
	fornot2s	%f16,	%f6,	%f13
	swap	[%l7 + 0x7C],	%o3
	xnorcc	%o2,	%g6,	%i6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x89,	%l5,	%i0
	fcmpd	%fcc2,	%f10,	%f0
	bn	loop_1063
	bne,a	loop_1064
	tne	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1063:
	movrne	%o5,	0x280,	%l6
loop_1064:
	popc	0x0D2E,	%o4
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x18] %asi,	%g5
	sll	%l3,	0x05,	%g3
	fmovsl	%xcc,	%f19,	%f19
	edge16ln	%o7,	%i7,	%i4
	tn	%icc,	0x2
	srlx	%i2,	0x02,	%g1
	bvs,a,pt	%icc,	loop_1065
	bge	%icc,	loop_1066
	edge8l	%g2,	%l2,	%l0
	movleu	%xcc,	%l1,	%i1
loop_1065:
	subcc	%o6,	%l4,	%g4
loop_1066:
	and	%o1,	0x0DE7,	%i3
	ldx	[%l7 + 0x28],	%i5
	tle	%icc,	0x2
	taddcc	%o0,	0x1786,	%g7
	srlx	%o2,	%o3,	%i6
	sllx	%g6,	0x06,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o5,	%l5,	%o4
	sra	%g5,	0x17,	%l3
	xorcc	%g3,	%l6,	%o7
	brgez,a	%i4,	loop_1067
	edge16n	%i7,	%g1,	%g2
	fmovrdlz	%i2,	%f10,	%f26
	subc	%l0,	%l1,	%l2
loop_1067:
	nop
	wr	%g0,	0xea,	%asi
	stba	%o6,	[%l7 + 0x53] %asi
	membar	#Sync
	tsubcc	%l4,	%i1,	%g4
	edge8n	%i3,	%o1,	%i5
	fnot2	%f16,	%f4
	smul	%g7,	0x0C28,	%o0
	andcc	%o2,	0x16FF,	%i6
	brnz,a	%o3,	loop_1068
	fxnors	%f4,	%f16,	%f19
	edge16ln	%g6,	%i0,	%l5
	stw	%o5,	[%l7 + 0x60]
loop_1068:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f27,	%f29,	%f11
	fmovrse	%g5,	%f16,	%f9
	fcmpne32	%f30,	%f24,	%l3
	udivx	%g3,	0x0D33,	%o4
	fabsd	%f10,	%f4
	bneg,a,pt	%icc,	loop_1069
	fxnor	%f14,	%f12,	%f28
	ba,a,pn	%icc,	loop_1070
	umulcc	%o7,	0x1B3A,	%i4
loop_1069:
	or	%l6,	0x1AC7,	%i7
	swap	[%l7 + 0x78],	%g1
loop_1070:
	lduh	[%l7 + 0x10],	%i2
	sth	%g2,	[%l7 + 0x32]
	edge32	%l1,	%l2,	%o6
	bl	loop_1071
	orcc	%l0,	%l4,	%g4
	sdiv	%i1,	0x17BD,	%i3
	addccc	%o1,	0x1372,	%g7
loop_1071:
	fnor	%f24,	%f24,	%f4
	brgez,a	%i5,	loop_1072
	fpmerge	%f29,	%f13,	%f30
	brz,a	%o2,	loop_1073
	ble	%xcc,	loop_1074
loop_1072:
	stw	%o0,	[%l7 + 0x78]
	movcs	%xcc,	%i6,	%g6
loop_1073:
	fcmpne16	%f4,	%f14,	%i0
loop_1074:
	fmovsneg	%xcc,	%f26,	%f19
	movre	%l5,	%o3,	%o5
	xor	%g5,	0x1581,	%l3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%o7
	udivcc	%i4,	0x16AB,	%g3
	orcc	%i7,	0x0A40,	%g1
	stb	%l6,	[%l7 + 0x70]
	fmovd	%f30,	%f8
	fba,a	%fcc0,	loop_1075
	lduw	[%l7 + 0x3C],	%i2
	fpadd32s	%f16,	%f3,	%f21
	tle	%icc,	0x5
loop_1075:
	fbue,a	%fcc1,	loop_1076
	srl	%g2,	0x0A,	%l1
	movrne	%l2,	0x3BC,	%o6
	and	%l4,	%g4,	%i1
loop_1076:
	fzeros	%f29
	fpadd16s	%f3,	%f16,	%f24
	mulscc	%l0,	0x16BC,	%o1
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge32	%g7,	%i5,	%i3
	fmovsvc	%xcc,	%f12,	%f6
	set	0x1C, %g1
	sta	%f2,	[%l7 + %g1] 0x10
	fnors	%f5,	%f20,	%f17
	fpsub32s	%f20,	%f2,	%f22
	mulscc	%o0,	%o2,	%g6
	fmovdneg	%xcc,	%f24,	%f2
	tcs	%xcc,	0x3
	mulscc	%i6,	%i0,	%o3
	tg	%icc,	0x6
	movge	%xcc,	%o5,	%l5
	bcc,pn	%xcc,	loop_1077
	fblg,a	%fcc0,	loop_1078
	fcmple16	%f26,	%f20,	%g5
	fabss	%f17,	%f8
loop_1077:
	sir	0x10E2
loop_1078:
	subccc	%o4,	%l3,	%i4
	sdivx	%o7,	0x0F75,	%i7
	fbule	%fcc3,	loop_1079
	nop
	setx	loop_1080,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%g3,	%g1,	%l6
	edge16n	%g2,	%l1,	%l2
loop_1079:
	fbo,a	%fcc1,	loop_1081
loop_1080:
	fnand	%f30,	%f22,	%f8
	fmul8x16au	%f3,	%f31,	%f22
	set	0x78, %l0
	stda	%o6,	[%l7 + %l0] 0x04
loop_1081:
	tneg	%xcc,	0x7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l4,	0x0674,	%g4
	fmovdvs	%icc,	%f26,	%f4
	taddcc	%i2,	%l0,	%i1
	tvc	%icc,	0x4
	movl	%icc,	%g7,	%o1
	tneg	%icc,	0x0
	fone	%f6
	ldsb	[%l7 + 0x19],	%i3
	wr	%g0,	0x11,	%asi
	stha	%o0,	[%l7 + 0x6A] %asi
	membar	0x20
	mova	%xcc,	%i5,	%g6
	movn	%xcc,	%i6,	%o2
	array16	%o3,	%o5,	%l5
	fcmpgt16	%f30,	%f4,	%i0
	movrne	%o4,	%g5,	%l3
	ldd	[%l7 + 0x08],	%f0
	movle	%icc,	%i4,	%o7
	nop
	set	0x60, %l1
	lduw	[%l7 + %l1],	%i7
	sdiv	%g1,	0x0BFA,	%g3
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x74] %asi,	%l6
	brgez	%g2,	loop_1082
	sra	%l1,	%l2,	%o6
	ta	%xcc,	0x2
	popc	0x088A,	%g4
loop_1082:
	edge16ln	%i2,	%l4,	%i1
	udiv	%g7,	0x15E2,	%o1
	fbl	%fcc2,	loop_1083
	tg	%xcc,	0x1
	fbug,a	%fcc1,	loop_1084
	mova	%icc,	%i3,	%o0
loop_1083:
	movvs	%xcc,	%l0,	%i5
	andn	%g6,	%i6,	%o2
loop_1084:
	addccc	%o5,	0x191B,	%l5
	edge8	%i0,	%o4,	%o3
	edge16ln	%g5,	%l3,	%o7
	tleu	%xcc,	0x7
	movn	%xcc,	%i7,	%g1
	fmovrsne	%g3,	%f28,	%f16
	movle	%xcc,	%l6,	%g2
	sra	%l1,	0x04,	%i4
	ta	%icc,	0x4
	wr	%g0,	0x10,	%asi
	stxa	%l2,	[%l7 + 0x28] %asi
	st	%f21,	[%l7 + 0x44]
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	bn,a,pn	%icc,	loop_1085
	fcmpgt32	%f26,	%f14,	%o6
	bn,a	loop_1086
	call	loop_1087
loop_1085:
	movl	%icc,	%i2,	%l4
	fmovsn	%xcc,	%f2,	%f31
loop_1086:
	edge16ln	%i1,	%o1,	%i3
loop_1087:
	tge	%xcc,	0x2
	fmovsle	%xcc,	%f2,	%f22
	addc	%o0,	%g7,	%l0
	xnorcc	%i5,	0x1764,	%i6
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%g6
	orcc	%o2,	%l5,	%o5
	umul	%i0,	%o4,	%g5
	smulcc	%l3,	0x0926,	%o7
	fcmped	%fcc1,	%f2,	%f6
	bg,a	%xcc,	loop_1088
	tvc	%xcc,	0x6
	edge8	%i7,	%o3,	%g1
	taddcc	%l6,	0x0486,	%g3
loop_1088:
	mulx	%g2,	0x037B,	%i4
	taddcctv	%l2,	%l1,	%g4
	fcmpeq16	%f22,	%f28,	%i2
	fmovrdgez	%l4,	%f0,	%f12
	fzeros	%f10
	fmovrsgez	%i1,	%f14,	%f17
	ble	loop_1089
	nop
	set	0x52, %l5
	lduh	[%l7 + %l5],	%o1
	mulscc	%o6,	%o0,	%i3
	sra	%g7,	0x0A,	%l0
loop_1089:
	tl	%xcc,	0x1
	andcc	%i6,	0x1621,	%i5
	fmovsne	%icc,	%f16,	%f24
	sllx	%g6,	%o2,	%l5
	fmovdne	%icc,	%f29,	%f9
	ta	%xcc,	0x1
	tsubcctv	%i0,	0x1E0D,	%o4
	fones	%f15
	set	0x48, %o3
	stxa	%o5,	[%l7 + %o3] 0xea
	membar	#Sync
	bne,a,pt	%icc,	loop_1090
	movvs	%xcc,	%g5,	%l3
	udivx	%i7,	0x1D9E,	%o3
	fpack16	%f8,	%f20
loop_1090:
	movleu	%icc,	%g1,	%l6
	array8	%o7,	%g2,	%g3
	subcc	%l2,	%l1,	%g4
	edge8ln	%i2,	%l4,	%i1
	fnegd	%f18,	%f14
	tneg	%icc,	0x4
	fabsd	%f4,	%f10
	tne	%xcc,	0x3
	sdivx	%i4,	0x0569,	%o1
	ta	%icc,	0x6
	fexpand	%f7,	%f22
	fmovrsne	%o0,	%f20,	%f9
	set	0x7C, %i0
	lduba	[%l7 + %i0] 0x81,	%o6
	brlz	%g7,	loop_1091
	edge16n	%i3,	%l0,	%i6
	tpos	%icc,	0x1
	and	%i5,	0x07BA,	%g6
loop_1091:
	umulcc	%o2,	%i0,	%o4
	smulcc	%l5,	%o5,	%l3
	tvs	%icc,	0x7
	set	0x64, %i5
	lduha	[%l7 + %i5] 0x89,	%i7
	ld	[%l7 + 0x28],	%f18
	movge	%icc,	%o3,	%g1
	edge8ln	%g5,	%o7,	%l6
	subccc	%g3,	%g2,	%l1
	ldsb	[%l7 + 0x1C],	%g4
	udivx	%i2,	0x11BF,	%l4
	fmovrdgz	%i1,	%f0,	%f6
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x36] %asi,	%i4
	edge16n	%o1,	%o0,	%o6
	movne	%xcc,	%l2,	%g7
	flush	%l7 + 0x6C
	movcs	%xcc,	%l0,	%i3
	edge16l	%i5,	%g6,	%o2
	sir	0x0984
	addcc	%i0,	%o4,	%l5
	fsrc1s	%f12,	%f13
	bcc,a,pn	%xcc,	loop_1092
	tne	%icc,	0x7
	movpos	%xcc,	%o5,	%l3
	movge	%icc,	%i7,	%i6
loop_1092:
	tgu	%xcc,	0x6
	edge32l	%o3,	%g5,	%g1
	addc	%l6,	%o7,	%g3
	sub	%g2,	%l1,	%i2
	andncc	%g4,	%l4,	%i1
	fmul8x16al	%f29,	%f21,	%f18
	fmovsvc	%xcc,	%f21,	%f22
	lduw	[%l7 + 0x18],	%o1
	edge16	%i4,	%o0,	%l2
	bcc,a,pn	%icc,	loop_1093
	fbue,a	%fcc2,	loop_1094
	edge8l	%g7,	%o6,	%i3
	umul	%l0,	0x099D,	%i5
loop_1093:
	or	%o2,	0x0418,	%i0
loop_1094:
	fmovsl	%xcc,	%f3,	%f10
	movvs	%icc,	%o4,	%l5
	stbar
	movcs	%xcc,	%o5,	%l3
	set	0x6C, %g3
	sta	%f11,	[%l7 + %g3] 0x89
	orncc	%i7,	%i6,	%o3
	edge16n	%g6,	%g5,	%l6
	movrlz	%g1,	0x091,	%g3
	addcc	%o7,	%g2,	%l1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x64] %asi,	%i2
	fbg	%fcc1,	loop_1095
	mulscc	%l4,	%g4,	%o1
	movle	%xcc,	%i4,	%o0
	fpsub32	%f18,	%f26,	%f12
loop_1095:
	fnor	%f24,	%f14,	%f18
	bge,pt	%icc,	loop_1096
	stbar
	fbu,a	%fcc0,	loop_1097
	subcc	%l2,	0x0AF9,	%g7
loop_1096:
	fpack32	%f20,	%f12,	%f6
	fbul	%fcc3,	loop_1098
loop_1097:
	tvc	%icc,	0x0
	subc	%o6,	0x1AA9,	%i1
	sra	%l0,	0x01,	%i3
loop_1098:
	umulcc	%i5,	0x0749,	%o2
	taddcc	%i0,	0x0E52,	%l5
	fornot2s	%f15,	%f31,	%f25
	addc	%o4,	%l3,	%i7
	st	%f24,	[%l7 + 0x70]
	andcc	%i6,	0x1A2A,	%o5
	udivcc	%o3,	0x0010,	%g5
	fnot2s	%f26,	%f20
	fnot2	%f14,	%f0
	nop
	set	0x40, %i7
	ldd	[%l7 + %i7],	%f28
	movleu	%xcc,	%l6,	%g6
	set	0x30, %o0
	ldda	[%l7 + %o0] 0x89,	%g0
	ld	[%l7 + 0x2C],	%f16
	alignaddr	%g3,	%g2,	%l1
	umulcc	%o7,	%i2,	%g4
	brnz,a	%l4,	loop_1099
	fmovdgu	%xcc,	%f1,	%f18
	fbl,a	%fcc3,	loop_1100
	movcs	%xcc,	%i4,	%o1
loop_1099:
	fmovsleu	%xcc,	%f5,	%f24
	fmovrsgz	%o0,	%f14,	%f10
loop_1100:
	tvc	%xcc,	0x0
	edge8n	%g7,	%o6,	%l2
	ldstub	[%l7 + 0x7B],	%i1
	orncc	%i3,	0x1D72,	%l0
	fbu,a	%fcc3,	loop_1101
	movrlz	%i5,	%o2,	%l5
	set	0x74, %g5
	stba	%i0,	[%l7 + %g5] 0xeb
	membar	#Sync
loop_1101:
	sdivcc	%o4,	0x1E27,	%i7
	movneg	%xcc,	%i6,	%o5
	edge16ln	%o3,	%l3,	%g5
	bcs	loop_1102
	ldd	[%l7 + 0x38],	%i6
	std	%f0,	[%l7 + 0x78]
	tvc	%icc,	0x5
loop_1102:
	fmovdvc	%xcc,	%f31,	%f18
	set	0x28, %l4
	lduwa	[%l7 + %l4] 0x19,	%g1
	membar	0x68
	movrne	%g6,	0x2A6,	%g2
	movrne	%l1,	%g3,	%o7
	tn	%xcc,	0x3
	fmovdvs	%icc,	%f17,	%f19
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tleu	%xcc,	0x6
	bge,a	%icc,	loop_1103
	orncc	%g4,	%l4,	%i2
	tg	%xcc,	0x7
	tleu	%xcc,	0x4
loop_1103:
	array16	%i4,	%o1,	%o0
	fmovspos	%icc,	%f0,	%f27
	set	0x50, %g2
	lduwa	[%l7 + %g2] 0x18,	%o6
	or	%l2,	%g7,	%i1
	umulcc	%l0,	0x03D1,	%i5
	brz,a	%o2,	loop_1104
	array16	%l5,	%i0,	%o4
	alignaddr	%i7,	%i6,	%o5
	orn	%o3,	%i3,	%l3
loop_1104:
	sethi	0x0281,	%l6
	srax	%g5,	%g1,	%g6
	tsubcctv	%l1,	%g2,	%o7
	xor	%g4,	0x058A,	%l4
	move	%xcc,	%i2,	%g3
	udivx	%o1,	0x1FFE,	%o0
	edge8n	%o6,	%l2,	%g7
	set	0x2D, %g6
	ldsba	[%l7 + %g6] 0x14,	%i4
	bvc,a,pt	%xcc,	loop_1105
	movle	%icc,	%l0,	%i5
	fmovscs	%icc,	%f14,	%f23
	set	0x0C, %i6
	lda	[%l7 + %i6] 0x19,	%f23
loop_1105:
	bvs,pn	%xcc,	loop_1106
	fmuld8ulx16	%f4,	%f0,	%f14
	srl	%i1,	%o2,	%l5
	tcs	%xcc,	0x3
loop_1106:
	fabsd	%f30,	%f2
	fmovsgu	%icc,	%f31,	%f27
	and	%o4,	0x10C8,	%i7
	sll	%i0,	0x0B,	%o5
	movre	%o3,	0x3EA,	%i3
	edge16n	%i6,	%l3,	%g5
	andcc	%l6,	0x08E5,	%g1
	popc	%g6,	%l1
	prefetch	[%l7 + 0x18],	 0x2
	std	%g2,	[%l7 + 0x78]
	sethi	0x0266,	%g4
	fnot2s	%f27,	%f22
	stb	%o7,	[%l7 + 0x3C]
	array16	%i2,	%l4,	%g3
	tvc	%xcc,	0x3
	tge	%xcc,	0x0
	fpsub32	%f2,	%f28,	%f2
	tg	%icc,	0x6
	tge	%icc,	0x4
	tsubcc	%o1,	%o0,	%o6
	fmovdgu	%xcc,	%f0,	%f18
	fbule	%fcc1,	loop_1107
	stbar
	fmovsl	%icc,	%f19,	%f20
	movge	%xcc,	%l2,	%i4
loop_1107:
	fsrc1	%f4,	%f18
	fbg,a	%fcc2,	loop_1108
	movl	%xcc,	%g7,	%l0
	fmovdvc	%icc,	%f20,	%f15
	bvs,a	loop_1109
loop_1108:
	taddcctv	%i5,	0x0FEB,	%i1
	fcmple32	%f8,	%f12,	%l5
	fpsub16s	%f17,	%f3,	%f0
loop_1109:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%xcc,	%f15,	%f25
	andncc	%o4,	%i7,	%i0
	tle	%xcc,	0x7
	fmovs	%f29,	%f4
	fbule,a	%fcc0,	loop_1110
	te	%icc,	0x1
	orn	%o5,	0x0368,	%o3
	udivx	%i3,	0x0512,	%o2
loop_1110:
	umulcc	%l3,	%g5,	%i6
	move	%xcc,	%l6,	%g1
	fors	%f7,	%f12,	%f16
	stb	%g6,	[%l7 + 0x23]
	movrlez	%l1,	0x3BD,	%g4
	membar	0x0F
	ldx	[%l7 + 0x18],	%o7
	ba,a,pt	%icc,	loop_1111
	umul	%g2,	%l4,	%i2
	ba,a	%icc,	loop_1112
	bpos,pn	%icc,	loop_1113
loop_1111:
	srlx	%g3,	%o0,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1112:
	tsubcctv	%o6,	0x1063,	%l2
loop_1113:
	fbg,a	%fcc0,	loop_1114
	andn	%i4,	%g7,	%l0
	sub	%i1,	0x1B83,	%i5
	movl	%xcc,	%o4,	%i7
loop_1114:
	udivx	%l5,	0x0E71,	%o5
	fandnot2s	%f25,	%f13,	%f3
	fbu	%fcc3,	loop_1115
	smul	%o3,	0x0535,	%i3
	tl	%xcc,	0x6
	tgu	%xcc,	0x7
loop_1115:
	tsubcc	%i0,	%l3,	%o2
	movleu	%icc,	%g5,	%l6
	edge16ln	%g1,	%g6,	%l1
	taddcctv	%i6,	0x1F94,	%o7
	subcc	%g2,	0x157F,	%l4
	stb	%g4,	[%l7 + 0x2F]
	wr	%g0,	0x23,	%asi
	stda	%g2,	[%l7 + 0x48] %asi
	membar	#Sync
	or	%i2,	%o0,	%o6
	edge8ln	%l2,	%i4,	%o1
	fbu,a	%fcc0,	loop_1116
	st	%f0,	[%l7 + 0x14]
	popc	0x085D,	%l0
	nop
	set	0x60, %l3
	ldd	[%l7 + %l3],	%f30
loop_1116:
	brgz,a	%i1,	loop_1117
	ble,pn	%icc,	loop_1118
	tge	%icc,	0x4
	fpsub32s	%f6,	%f31,	%f19
loop_1117:
	fmovscc	%icc,	%f20,	%f23
loop_1118:
	umul	%g7,	0x0213,	%o4
	movrlz	%i7,	0x1AB,	%l5
	tg	%icc,	0x0
	brgz,a	%o5,	loop_1119
	tgu	%icc,	0x1
	edge32ln	%o3,	%i5,	%i0
	smul	%i3,	%o2,	%l3
loop_1119:
	fbu,a	%fcc2,	loop_1120
	movpos	%xcc,	%g5,	%l6
	movrgz	%g6,	%l1,	%g1
	bne,a,pt	%icc,	loop_1121
loop_1120:
	subcc	%i6,	%g2,	%l4
	fnot1s	%f18,	%f28
	fmovse	%icc,	%f15,	%f10
loop_1121:
	popc	%o7,	%g4
	edge8ln	%i2,	%o0,	%o6
	srl	%l2,	%g3,	%i4
	fmovrsne	%o1,	%f13,	%f0
	movrlz	%i1,	0x3A3,	%l0
	subcc	%g7,	0x096E,	%i7
	fcmpes	%fcc1,	%f12,	%f21
	subcc	%o4,	%o5,	%o3
	subcc	%l5,	0x0877,	%i5
	smul	%i0,	0x0347,	%o2
	orncc	%l3,	%i3,	%l6
	fmovsl	%icc,	%f12,	%f17
	xnorcc	%g6,	0x035A,	%g5
	movne	%xcc,	%l1,	%g1
	xnor	%i6,	0x143B,	%l4
	ldd	[%l7 + 0x30],	%f28
	fmovsleu	%xcc,	%f24,	%f14
	udivcc	%o7,	0x0D0E,	%g2
	xnorcc	%g4,	%i2,	%o0
	movne	%icc,	%o6,	%g3
	movneg	%xcc,	%l2,	%i4
	fbuge,a	%fcc2,	loop_1122
	edge16l	%i1,	%l0,	%o1
	bneg,a	loop_1123
	fbul,a	%fcc0,	loop_1124
loop_1122:
	andcc	%i7,	%o4,	%g7
	tgu	%icc,	0x0
loop_1123:
	fors	%f26,	%f18,	%f5
loop_1124:
	edge16ln	%o5,	%l5,	%i5
	fpadd16	%f20,	%f26,	%f16
	be,pt	%xcc,	loop_1125
	movrlez	%o3,	0x28B,	%o2
	andncc	%l3,	%i0,	%l6
	fbul	%fcc0,	loop_1126
loop_1125:
	subccc	%i3,	%g5,	%l1
	movrlez	%g6,	%g1,	%l4
	fnot2	%f2,	%f2
loop_1126:
	ta	%xcc,	0x7
	fcmpne32	%f14,	%f16,	%o7
	fcmpeq32	%f30,	%f14,	%g2
	fmovdpos	%icc,	%f25,	%f31
	movpos	%xcc,	%g4,	%i6
	fandnot1	%f24,	%f6,	%f8
	taddcctv	%o0,	0x032F,	%i2
	orn	%o6,	%g3,	%i4
	movn	%xcc,	%l2,	%i1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x50] %asi,	%l0
	fmovsgu	%icc,	%f24,	%f18
	movleu	%xcc,	%i7,	%o1
	brlz	%g7,	loop_1127
	fblg	%fcc0,	loop_1128
	fpadd32s	%f7,	%f25,	%f28
	flush	%l7 + 0x34
loop_1127:
	fmovsg	%icc,	%f10,	%f30
loop_1128:
	fmovdl	%icc,	%f25,	%f3
	sub	%o4,	%o5,	%l5
	edge16l	%o3,	%i5,	%o2
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i0,	%l6
	fbe	%fcc0,	loop_1129
	srlx	%i3,	%l3,	%g5
	movn	%xcc,	%g6,	%g1
	fbn	%fcc0,	loop_1130
loop_1129:
	fbuge,a	%fcc2,	loop_1131
	fble,a	%fcc2,	loop_1132
	call	loop_1133
loop_1130:
	bne,a	%xcc,	loop_1134
loop_1131:
	andn	%l1,	0x0902,	%l4
loop_1132:
	fbe,a	%fcc1,	loop_1135
loop_1133:
	tgu	%xcc,	0x1
loop_1134:
	std	%f26,	[%l7 + 0x10]
	fbg	%fcc0,	loop_1136
loop_1135:
	movrne	%o7,	%g4,	%i6
	tcc	%xcc,	0x4
	addccc	%g2,	%o0,	%i2
loop_1136:
	edge16n	%o6,	%g3,	%i4
	bge	loop_1137
	tle	%xcc,	0x6
	array8	%i1,	%l2,	%i7
	movleu	%xcc,	%o1,	%l0
loop_1137:
	xnorcc	%g7,	%o4,	%l5
	fmovrdlez	%o5,	%f2,	%f24
	tleu	%xcc,	0x2
	udivcc	%o3,	0x1E78,	%i5
	fmovsleu	%icc,	%f6,	%f8
	fxnors	%f15,	%f22,	%f28
	umul	%o2,	0x0A9D,	%l6
	bne,a,pt	%icc,	loop_1138
	edge32n	%i0,	%i3,	%g5
	fmovd	%f10,	%f18
	movrgez	%g6,	%l3,	%g1
loop_1138:
	movl	%xcc,	%l4,	%o7
	udivcc	%g4,	0x1FF8,	%l1
	tle	%icc,	0x6
	edge32	%g2,	%i6,	%o0
	udiv	%i2,	0x1574,	%g3
	edge16ln	%o6,	%i4,	%l2
	smulcc	%i7,	%i1,	%l0
	movne	%xcc,	%g7,	%o1
	pdist	%f8,	%f14,	%f18
	tleu	%icc,	0x2
	udivx	%l5,	0x0D58,	%o4
	tn	%xcc,	0x2
	xor	%o5,	%i5,	%o3
	tne	%icc,	0x1
	subcc	%l6,	%o2,	%i0
	sra	%g5,	0x1E,	%i3
	ldsb	[%l7 + 0x7F],	%l3
	fba	%fcc0,	loop_1139
	addcc	%g1,	0x1087,	%g6
	tne	%xcc,	0x3
	edge16	%o7,	%l4,	%l1
loop_1139:
	fmovrdne	%g4,	%f10,	%f18
	fmovsvc	%xcc,	%f5,	%f19
	subc	%i6,	%g2,	%i2
	fmovrdne	%o0,	%f20,	%f6
	fxnor	%f20,	%f22,	%f28
	movge	%xcc,	%o6,	%g3
	tcs	%icc,	0x1
	prefetch	[%l7 + 0x1C],	 0x0
	tvc	%icc,	0x1
	fpsub16s	%f25,	%f19,	%f0
	fmovda	%xcc,	%f30,	%f14
	tle	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l2,	0x1E9D,	%i7
	fbe	%fcc2,	loop_1140
	nop
	setx loop_1141, %l0, %l1
	jmpl %l1, %i1
	bvc	%icc,	loop_1142
	edge8l	%i4,	%g7,	%l0
loop_1140:
	fabss	%f4,	%f19
loop_1141:
	ble,a,pn	%xcc,	loop_1143
loop_1142:
	nop
	setx	loop_1144,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%o1,	%o4,	%l5
	srlx	%i5,	%o3,	%o5
loop_1143:
	fzeros	%f25
loop_1144:
	fmovsg	%icc,	%f30,	%f27
	fba,a	%fcc0,	loop_1145
	fandnot2	%f28,	%f24,	%f30
	brnz,a	%o2,	loop_1146
	fzero	%f0
loop_1145:
	bl	loop_1147
	subcc	%l6,	0x0717,	%i0
loop_1146:
	movrlez	%g5,	0x223,	%i3
	smulcc	%g1,	0x121E,	%g6
loop_1147:
	sdiv	%o7,	0x13D3,	%l4
	edge8n	%l1,	%g4,	%i6
	fors	%f31,	%f14,	%f12
	orcc	%g2,	%i2,	%o0
	movneg	%xcc,	%o6,	%l3
	fmovrslez	%l2,	%f24,	%f0
	membar	0x29
	movrlez	%g3,	%i1,	%i7
	bg,a,pn	%xcc,	loop_1148
	fmovrdlez	%i4,	%f2,	%f6
	alignaddr	%l0,	%o1,	%g7
	wr	%g0,	0x19,	%asi
	stba	%l5,	[%l7 + 0x14] %asi
loop_1148:
	movneg	%xcc,	%o4,	%o3
	fble	%fcc2,	loop_1149
	array32	%i5,	%o5,	%l6
	fxors	%f4,	%f21,	%f26
	ldx	[%l7 + 0x48],	%i0
loop_1149:
	addcc	%g5,	0x1144,	%o2
	tvs	%xcc,	0x3
	movrgez	%g1,	0x35E,	%i3
	alignaddr	%g6,	%o7,	%l4
	fcmple16	%f4,	%f28,	%g4
	fcmpgt32	%f2,	%f26,	%i6
	sdivx	%g2,	0x044D,	%l1
	movcc	%xcc,	%o0,	%i2
	array8	%l3,	%l2,	%o6
	mulx	%g3,	0x0429,	%i1
	srax	%i4,	0x18,	%i7
	andcc	%o1,	%l0,	%l5
	tne	%xcc,	0x6
	andncc	%g7,	%o4,	%o3
	tpos	%xcc,	0x4
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%i5
	orn	%l6,	%o5,	%g5
	movcs	%xcc,	%i0,	%o2
	fmovdvs	%icc,	%f21,	%f6
	fors	%f19,	%f1,	%f16
	fmovscs	%xcc,	%f24,	%f15
	fmovsvc	%xcc,	%f15,	%f4
	fbo	%fcc0,	loop_1150
	movre	%i3,	0x2B9,	%g6
	edge8l	%g1,	%l4,	%o7
	edge32	%i6,	%g2,	%g4
loop_1150:
	ldsh	[%l7 + 0x58],	%o0
	movvc	%xcc,	%l1,	%l3
	fnot2s	%f31,	%f9
	movg	%xcc,	%i2,	%o6
	set	0x0B, %g4
	ldsba	[%l7 + %g4] 0x14,	%l2
	bpos	%xcc,	loop_1151
	orncc	%g3,	0x047F,	%i1
	andcc	%i7,	%i4,	%l0
	fmovrslez	%o1,	%f21,	%f0
loop_1151:
	tge	%xcc,	0x4
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x17,	%f0
	fbul,a	%fcc0,	loop_1152
	sra	%l5,	%o4,	%o3
	tsubcctv	%i5,	0x10A7,	%g7
	orncc	%o5,	%g5,	%l6
loop_1152:
	nop
	set	0x50, %i4
	prefetcha	[%l7 + %i4] 0x88,	 0x1
	array16	%i3,	%g6,	%g1
	nop
	set	0x44, %o1
	lduh	[%l7 + %o1],	%l4
	fpsub32s	%f24,	%f15,	%f2
	brgez	%i0,	loop_1153
	sdivcc	%o7,	0x0DF2,	%g2
	fmovrdgz	%i6,	%f20,	%f26
	udivx	%g4,	0x1580,	%o0
loop_1153:
	fbe	%fcc1,	loop_1154
	stb	%l1,	[%l7 + 0x6F]
	addc	%l3,	0x1105,	%i2
	alignaddr	%o6,	%l2,	%g3
loop_1154:
	fbu,a	%fcc2,	loop_1155
	fabss	%f14,	%f1
	orncc	%i7,	0x1258,	%i4
	fcmpgt16	%f22,	%f8,	%i1
loop_1155:
	fpack32	%f18,	%f18,	%f8
	edge32	%l0,	%l5,	%o1
	srax	%o4,	%o3,	%i5
	fabsd	%f22,	%f22
	tpos	%icc,	0x2
	sub	%o5,	%g5,	%l6
	movpos	%xcc,	%g7,	%i3
	fmovdcc	%icc,	%f19,	%f14
	ldd	[%l7 + 0x58],	%g6
	movrlz	%g1,	%l4,	%i0
	movvc	%icc,	%o2,	%g2
	smul	%o7,	%g4,	%o0
	prefetch	[%l7 + 0x50],	 0x2
	sub	%l1,	%i6,	%l3
	bneg,a,pt	%xcc,	loop_1156
	fbul	%fcc0,	loop_1157
	tpos	%icc,	0x1
	lduh	[%l7 + 0x7E],	%i2
loop_1156:
	lduh	[%l7 + 0x3E],	%o6
loop_1157:
	fcmpgt16	%f10,	%f30,	%l2
	movrgez	%g3,	%i7,	%i4
	fnands	%f27,	%f30,	%f0
	bn,pn	%xcc,	loop_1158
	fsrc1	%f2,	%f18
	addc	%i1,	%l5,	%o1
	wr	%g0,	0x18,	%asi
	sta	%f31,	[%l7 + 0x30] %asi
loop_1158:
	bl	%xcc,	loop_1159
	tn	%xcc,	0x3
	nop
	setx	loop_1160,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16n	%o4,	%l0,	%i5
loop_1159:
	fmovrslz	%o5,	%f4,	%f16
	or	%o3,	0x1B96,	%g5
loop_1160:
	fsrc1	%f10,	%f24
	ldstub	[%l7 + 0x2E],	%l6
	ld	[%l7 + 0x44],	%f12
	fsrc2s	%f19,	%f13
	fmovsa	%icc,	%f14,	%f21
	mulscc	%i3,	0x1692,	%g6
	ble,pt	%xcc,	loop_1161
	fbul	%fcc2,	loop_1162
	movleu	%icc,	%g7,	%l4
	umul	%i0,	0x00D3,	%g1
loop_1161:
	brlez,a	%o2,	loop_1163
loop_1162:
	fnot2s	%f9,	%f10
	add	%g2,	0x199A,	%g4
	bcc,a	loop_1164
loop_1163:
	fmul8ulx16	%f8,	%f8,	%f4
	addc	%o7,	0x0315,	%o0
	fbul	%fcc0,	loop_1165
loop_1164:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l1,	0x0E20,	%l3
	popc	0x0222,	%i6
loop_1165:
	umul	%i2,	0x0F44,	%l2
	sethi	0x1D45,	%g3
	mulscc	%o6,	0x1FA0,	%i4
	sir	0x040D
	movne	%xcc,	%i7,	%i1
	nop
	set	0x70, %i1
	prefetch	[%l7 + %i1],	 0x0
	fsrc1s	%f5,	%f28
	tl	%icc,	0x5
	brlz	%o1,	loop_1166
	edge16	%l5,	%o4,	%i5
	brlz,a	%l0,	loop_1167
	smulcc	%o5,	%g5,	%o3
loop_1166:
	movcc	%icc,	%l6,	%g6
	ldsh	[%l7 + 0x70],	%g7
loop_1167:
	flush	%l7 + 0x40
	brgez	%l4,	loop_1168
	brlz	%i3,	loop_1169
	movvc	%xcc,	%g1,	%i0
	fmovsn	%xcc,	%f21,	%f9
loop_1168:
	bn	loop_1170
loop_1169:
	movvc	%icc,	%o2,	%g2
	fabss	%f10,	%f23
	movl	%xcc,	%g4,	%o7
loop_1170:
	nop
	set	0x20, %i3
	ldxa	[%g0 + %i3] 0x58,	%o0
	tn	%xcc,	0x7
	fmovdvc	%icc,	%f1,	%f19
	sllx	%l1,	0x1B,	%l3
	ldsh	[%l7 + 0x40],	%i2
	edge32ln	%i6,	%g3,	%l2
	sdivcc	%i4,	0x1195,	%o6
	movle	%icc,	%i7,	%i1
	andcc	%o1,	%l5,	%o4
	andn	%i5,	0x0503,	%l0
	move	%xcc,	%o5,	%g5
	lduh	[%l7 + 0x32],	%l6
	edge32ln	%o3,	%g7,	%l4
	alignaddrl	%i3,	%g1,	%g6
	fbe,a	%fcc3,	loop_1171
	tsubcc	%o2,	%i0,	%g2
	fblg	%fcc2,	loop_1172
	membar	0x10
loop_1171:
	movrgz	%o7,	%o0,	%l1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%g4
loop_1172:
	movvs	%icc,	%l3,	%i2
	subccc	%i6,	%g3,	%i4
	fnot2	%f12,	%f30
	array16	%o6,	%l2,	%i7
	fbne	%fcc3,	loop_1173
	movvc	%icc,	%i1,	%o1
	sll	%l5,	0x1E,	%i5
	subc	%o4,	%l0,	%o5
loop_1173:
	ld	[%l7 + 0x40],	%f28
	fmovdle	%xcc,	%f23,	%f22
	addc	%g5,	%l6,	%o3
	edge16	%l4,	%g7,	%i3
	fcmpne16	%f30,	%f24,	%g1
	move	%xcc,	%g6,	%o2
	tge	%icc,	0x7
	move	%icc,	%i0,	%g2
	tvs	%icc,	0x5
	tgu	%xcc,	0x2
	tpos	%icc,	0x0
	fornot1s	%f28,	%f18,	%f21
	fone	%f24
	fbug,a	%fcc1,	loop_1174
	subccc	%o7,	0x0371,	%o0
	ldub	[%l7 + 0x35],	%g4
	taddcctv	%l1,	%i2,	%l3
loop_1174:
	faligndata	%f2,	%f28,	%f30
	fsrc2	%f8,	%f20
	edge8ln	%i6,	%i4,	%g3
	brlz,a	%o6,	loop_1175
	sethi	0x0313,	%l2
	fpadd32s	%f23,	%f26,	%f2
	fands	%f11,	%f0,	%f25
loop_1175:
	fcmpes	%fcc0,	%f10,	%f30
	fbule	%fcc1,	loop_1176
	fbl	%fcc2,	loop_1177
	fcmpne16	%f8,	%f18,	%i1
	or	%o1,	0x0CF5,	%i7
loop_1176:
	nop
	setx loop_1178, %l0, %l1
	jmpl %l1, %i5
loop_1177:
	ba,a	%xcc,	loop_1179
	addccc	%l5,	%l0,	%o5
	lduw	[%l7 + 0x38],	%o4
loop_1178:
	edge32l	%g5,	%o3,	%l4
loop_1179:
	andncc	%l6,	%g7,	%i3
	movne	%xcc,	%g6,	%g1
	taddcc	%i0,	%g2,	%o2
	movleu	%xcc,	%o7,	%g4
	set	0x3D, %o7
	stba	%o0,	[%l7 + %o7] 0xeb
	membar	#Sync
	set	0x48, %l2
	lduwa	[%l7 + %l2] 0x10,	%l1
	edge16n	%l3,	%i6,	%i2
	fzeros	%f22
	std	%f28,	[%l7 + 0x50]
	st	%f27,	[%l7 + 0x64]
	subcc	%i4,	%g3,	%o6
	fpadd32s	%f6,	%f4,	%f21
	tneg	%xcc,	0x4
	movpos	%icc,	%l2,	%o1
	stb	%i7,	[%l7 + 0x57]
	wr	%g0,	0x88,	%asi
	sta	%f20,	[%l7 + 0x30] %asi
	set	0x58, %l6
	lduwa	[%l7 + %l6] 0x14,	%i1
	fblg	%fcc0,	loop_1180
	bl,pt	%xcc,	loop_1181
	movrne	%l5,	0x289,	%i5
	set	0x78, %o6
	ldstuba	[%l7 + %o6] 0x80,	%o5
loop_1180:
	fands	%f11,	%f6,	%f28
loop_1181:
	ldd	[%l7 + 0x38],	%f22
	sethi	0x189B,	%l0
	movre	%g5,	%o3,	%l4
	fcmpeq16	%f10,	%f26,	%o4
	brlz	%l6,	loop_1182
	movle	%icc,	%g7,	%g6
	ta	%xcc,	0x0
	movrlz	%i3,	0x313,	%g1
loop_1182:
	bgu	loop_1183
	tle	%xcc,	0x5
	fmovd	%f4,	%f26
	xorcc	%i0,	%g2,	%o7
loop_1183:
	ta	%xcc,	0x3
	bleu	loop_1184
	bn,a,pn	%xcc,	loop_1185
	edge8ln	%o2,	%o0,	%l1
	fones	%f6
loop_1184:
	nop
	set	0x7E, %o4
	lduha	[%l7 + %o4] 0x89,	%g4
loop_1185:
	smul	%l3,	0x1F2D,	%i2
	sllx	%i6,	0x1D,	%i4
	movpos	%icc,	%g3,	%l2
	bpos,pn	%icc,	loop_1186
	prefetch	[%l7 + 0x54],	 0x0
	and	%o1,	0x1D47,	%i7
	brlez,a	%i1,	loop_1187
loop_1186:
	edge32l	%o6,	%i5,	%l5
	edge32n	%l0,	%g5,	%o3
	bl,a	loop_1188
loop_1187:
	stx	%l4,	[%l7 + 0x60]
	edge32l	%o5,	%l6,	%o4
	tpos	%icc,	0x5
loop_1188:
	edge16	%g6,	%g7,	%i3
	edge32n	%i0,	%g1,	%g2
	std	%f16,	[%l7 + 0x10]
	orncc	%o7,	0x054A,	%o0
	array8	%o2,	%l1,	%g4
	taddcc	%i2,	0x1C32,	%i6
	edge32ln	%l3,	%i4,	%g3
	fmuld8sux16	%f19,	%f23,	%f10
	udivcc	%o1,	0x16A2,	%l2
	edge16l	%i1,	%i7,	%o6
	prefetch	[%l7 + 0x58],	 0x0
	array8	%l5,	%l0,	%i5
	movg	%icc,	%o3,	%g5
	subc	%l4,	%l6,	%o5
	movleu	%xcc,	%o4,	%g7
	tsubcctv	%i3,	%i0,	%g1
	fmovrdgez	%g6,	%f14,	%f26
	std	%o6,	[%l7 + 0x38]
	sir	0x15A2
	swap	[%l7 + 0x08],	%o0
	tvc	%xcc,	0x3
	movle	%xcc,	%g2,	%l1
	fmovsge	%xcc,	%f21,	%f19
	fbue,a	%fcc0,	loop_1189
	edge16l	%o2,	%g4,	%i2
	ta	%xcc,	0x0
	subc	%l3,	%i4,	%i6
loop_1189:
	movrlez	%g3,	0x194,	%l2
	xorcc	%o1,	%i7,	%i1
	addc	%l5,	%o6,	%i5
	fmovrslz	%o3,	%f28,	%f10
	fmovsvs	%icc,	%f4,	%f13
	srl	%l0,	0x1E,	%l4
	movle	%xcc,	%g5,	%l6
	fornot2s	%f25,	%f4,	%f6
	srlx	%o4,	0x0C,	%o5
	fmovrse	%i3,	%f8,	%f22
	membar	0x35
	movre	%g7,	0x3EB,	%i0
	ldub	[%l7 + 0x6F],	%g1
	umul	%g6,	%o0,	%g2
	xnorcc	%o7,	%o2,	%g4
	call	loop_1190
	movneg	%xcc,	%l1,	%l3
	sdivcc	%i2,	0x1CE2,	%i6
	ldx	[%l7 + 0x78],	%i4
loop_1190:
	popc	0x0C15,	%g3
	edge32l	%l2,	%o1,	%i1
	orcc	%l5,	%o6,	%i7
	xnor	%i5,	0x1934,	%o3
	edge16l	%l0,	%l4,	%l6
	mulx	%o4,	%o5,	%i3
	edge16ln	%g5,	%i0,	%g1
	movcc	%xcc,	%g6,	%g7
	bne,a	%xcc,	loop_1191
	xor	%o0,	0x15E7,	%g2
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x14] %asi,	%o7
loop_1191:
	brnz	%g4,	loop_1192
	tleu	%xcc,	0x0
	sllx	%o2,	0x10,	%l1
	membar	0x37
loop_1192:
	fmul8x16au	%f2,	%f16,	%f12
	ble,a	loop_1193
	xnor	%l3,	%i6,	%i2
	subc	%i4,	0x0303,	%l2
	edge32n	%g3,	%i1,	%o1
loop_1193:
	nop
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%o6
	set	0x30, %g7
	stxa	%l5,	[%l7 + %g7] 0x80
	fmovrsgez	%i7,	%f4,	%f24
	fpsub16	%f4,	%f26,	%f22
	sllx	%i5,	0x1C,	%l0
	mulscc	%l4,	%l6,	%o3
	alignaddr	%o5,	%i3,	%o4
	array16	%g5,	%i0,	%g1
	smul	%g7,	0x062A,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc3,	loop_1194
	addc	%g2,	%o0,	%g4
	fnegs	%f5,	%f1
	fcmps	%fcc0,	%f27,	%f26
loop_1194:
	xnorcc	%o2,	0x11D5,	%o7
	fsrc2s	%f24,	%f25
	lduw	[%l7 + 0x4C],	%l3
	movre	%l1,	0x319,	%i6
	fmul8ulx16	%f20,	%f16,	%f28
	tgu	%icc,	0x5
	edge32l	%i4,	%l2,	%i2
	brnz	%g3,	loop_1195
	xor	%i1,	0x1973,	%o1
	siam	0x6
	sir	0x17A2
loop_1195:
	taddcctv	%o6,	%i7,	%i5
	fnands	%f10,	%f17,	%f13
	fmovdn	%icc,	%f15,	%f27
	movpos	%xcc,	%l0,	%l5
	tcs	%xcc,	0x4
	set	0x10, %o5
	ldda	[%l7 + %o5] 0xea,	%i6
	xorcc	%o3,	0x1788,	%o5
	edge16n	%i3,	%o4,	%l4
	xnor	%i0,	%g1,	%g7
	tg	%icc,	0x0
	edge8ln	%g6,	%g5,	%g2
	set	0x18, %l0
	lduha	[%l7 + %l0] 0x15,	%o0
	fzeros	%f15
	addc	%g4,	0x14B6,	%o7
	subcc	%l3,	%o2,	%i6
	movg	%xcc,	%l1,	%l2
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i4
	edge32n	%i2,	%i1,	%g3
	stbar
	movvs	%icc,	%o1,	%o6
	tl	%icc,	0x5
	brgez	%i5,	loop_1196
	orcc	%l0,	%l5,	%l6
	movl	%icc,	%o3,	%o5
	fmovdg	%xcc,	%f25,	%f20
loop_1196:
	udivcc	%i7,	0x114E,	%o4
	bg,pt	%icc,	loop_1197
	fnegd	%f2,	%f20
	fmovde	%icc,	%f25,	%f17
	edge16l	%l4,	%i0,	%i3
loop_1197:
	mova	%icc,	%g1,	%g7
	move	%xcc,	%g5,	%g2
	movl	%icc,	%g6,	%o0
	tvs	%xcc,	0x0
	tsubcctv	%g4,	0x043F,	%l3
	bleu	loop_1198
	movcc	%icc,	%o7,	%o2
	te	%icc,	0x1
	udivcc	%l1,	0x19F4,	%l2
loop_1198:
	fmovscs	%xcc,	%f1,	%f29
	nop
	setx	loop_1199,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%i4,	%i6,	%i2
	edge32n	%g3,	%o1,	%i1
	fble,a	%fcc3,	loop_1200
loop_1199:
	ld	[%l7 + 0x60],	%f7
	andcc	%i5,	0x17FD,	%l0
	andcc	%l5,	%o6,	%o3
loop_1200:
	fandnot1s	%f23,	%f9,	%f17
	fabsd	%f28,	%f6
	or	%o5,	0x15B2,	%i7
	movvc	%xcc,	%l6,	%o4
	set	0x78, %l1
	prefetcha	[%l7 + %l1] 0x10,	 0x3
	orncc	%i0,	%i3,	%g7
	orcc	%g5,	%g2,	%g1
	tle	%icc,	0x0
	tcs	%xcc,	0x5
	ble,a,pn	%icc,	loop_1201
	movrlez	%g6,	%o0,	%l3
	array8	%o7,	%o2,	%l1
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x54] %asi,	%l2
loop_1201:
	fpsub16s	%f2,	%f0,	%f16
	fnors	%f12,	%f20,	%f3
	movleu	%xcc,	%i4,	%i6
	movne	%xcc,	%i2,	%g4
	tne	%icc,	0x7
	fblg	%fcc3,	loop_1202
	ldub	[%l7 + 0x7B],	%o1
	tle	%xcc,	0x5
	movl	%xcc,	%g3,	%i1
loop_1202:
	edge16n	%l0,	%i5,	%l5
	taddcctv	%o6,	%o3,	%i7
	movgu	%xcc,	%l6,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l4,	0x0D9B,	%i0
	fexpand	%f12,	%f26
	movvc	%xcc,	%i3,	%g7
	addcc	%g5,	%o5,	%g1
	edge16l	%g6,	%g2,	%o0
	tneg	%icc,	0x5
	bcs,a,pt	%xcc,	loop_1203
	addccc	%l3,	%o7,	%o2
	fzero	%f28
	ldsw	[%l7 + 0x5C],	%l1
loop_1203:
	movcc	%icc,	%l2,	%i6
	movre	%i2,	%i4,	%g4
	addc	%g3,	0x13DF,	%i1
	udivcc	%l0,	0x0034,	%o1
	smul	%l5,	%o6,	%o3
	addc	%i5,	0x1B5A,	%l6
	tge	%icc,	0x4
	edge16l	%i7,	%l4,	%i0
	subccc	%o4,	0x19CF,	%g7
	array8	%i3,	%g5,	%g1
	array16	%g6,	%g2,	%o0
	flush	%l7 + 0x7C
	array8	%l3,	%o5,	%o7
	edge32	%l1,	%l2,	%o2
	bleu,pn	%xcc,	loop_1204
	stbar
	tcs	%icc,	0x0
	bvc,a,pn	%xcc,	loop_1205
loop_1204:
	be,a,pt	%icc,	loop_1206
	prefetch	[%l7 + 0x28],	 0x0
	edge8n	%i6,	%i4,	%g4
loop_1205:
	udiv	%g3,	0x118E,	%i2
loop_1206:
	fabsd	%f2,	%f26
	sub	%i1,	%o1,	%l0
	popc	0x0682,	%o6
	srlx	%o3,	0x0E,	%i5
	set	0x5C, %g1
	ldstuba	[%l7 + %g1] 0x80,	%l6
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x60] %asi,	%i7
	tvs	%icc,	0x2
	movle	%icc,	%l4,	%i0
	udivcc	%o4,	0x111A,	%g7
	sdivcc	%i3,	0x0F79,	%l5
	movrne	%g1,	0x0B3,	%g5
	ldd	[%l7 + 0x70],	%f20
	movcc	%xcc,	%g2,	%g6
	tl	%icc,	0x0
	wr	%g0,	0x04,	%asi
	stba	%o0,	[%l7 + 0x46] %asi
	add	%l7,	0x54,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l3,	%o7
	fmovdvc	%xcc,	%f19,	%f12
	taddcctv	%o5,	%l1,	%o2
	andncc	%l2,	%i6,	%g4
	stb	%i4,	[%l7 + 0x49]
	smulcc	%g3,	0x1B00,	%i1
	bcs,a	%icc,	loop_1207
	ldsw	[%l7 + 0x34],	%o1
	add	%l0,	%o6,	%o3
	fcmped	%fcc3,	%f6,	%f10
loop_1207:
	srlx	%i5,	%i2,	%i7
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l4
	sub	%l6,	0x0792,	%o4
	fmovscs	%icc,	%f19,	%f15
	ld	[%l7 + 0x6C],	%f1
	tl	%xcc,	0x6
	fornot2s	%f19,	%f3,	%f12
	bcc,a,pt	%xcc,	loop_1208
	srlx	%g7,	%i0,	%i3
	addccc	%l5,	%g1,	%g2
	fmovscc	%xcc,	%f28,	%f6
loop_1208:
	nop
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g6
	tvs	%icc,	0x0
	ta	%xcc,	0x4
	mova	%xcc,	%o0,	%g5
	smul	%o7,	%o5,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l1,	0x1E14,	%o2
	movgu	%icc,	%i6,	%l2
	tne	%icc,	0x3
	tne	%xcc,	0x6
	fmovdge	%icc,	%f21,	%f25
	alignaddrl	%i4,	%g3,	%i1
	tsubcctv	%g4,	%o1,	%o6
	bvc	%xcc,	loop_1209
	edge8n	%l0,	%i5,	%o3
	movcs	%xcc,	%i7,	%l4
	fmovsa	%icc,	%f17,	%f13
loop_1209:
	fbul	%fcc3,	loop_1210
	fpmerge	%f10,	%f15,	%f6
	tn	%icc,	0x1
	fmovdg	%xcc,	%f20,	%f18
loop_1210:
	flush	%l7 + 0x54
	tsubcc	%i2,	%l6,	%o4
	fbe,a	%fcc3,	loop_1211
	fmovrsgz	%i0,	%f3,	%f31
	stbar
	tcc	%icc,	0x6
loop_1211:
	edge32	%g7,	%l5,	%i3
	fnegs	%f13,	%f5
	fmovsl	%xcc,	%f30,	%f17
	std	%g0,	[%l7 + 0x58]
	addc	%g2,	%g6,	%g5
	udivcc	%o7,	0x0B16,	%o5
	edge16	%l3,	%o0,	%l1
	fmovrsgz	%i6,	%f12,	%f28
	array16	%o2,	%l2,	%i4
	edge16ln	%i1,	%g4,	%g3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x1A] %asi,	%o1
	fpack16	%f18,	%f31
	movg	%icc,	%l0,	%i5
	fbul,a	%fcc0,	loop_1212
	sdivcc	%o6,	0x1A22,	%i7
	fmovdneg	%xcc,	%f3,	%f31
	movge	%icc,	%o3,	%l4
loop_1212:
	xor	%i2,	%l6,	%o4
	fone	%f8
	nop
	setx	loop_1213,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sth	%g7,	[%l7 + 0x0E]
	movn	%xcc,	%l5,	%i3
	ldub	[%l7 + 0x69],	%g1
loop_1213:
	bge,pn	%xcc,	loop_1214
	fzero	%f30
	edge16l	%g2,	%g6,	%i0
	edge32l	%o7,	%g5,	%o5
loop_1214:
	te	%icc,	0x3
	edge32ln	%o0,	%l3,	%i6
	tsubcc	%l1,	%o2,	%i4
	te	%xcc,	0x0
	sdivcc	%i1,	0x0AFA,	%g4
	nop
	setx	loop_1215,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvc	%icc,	0x5
	movrne	%g3,	0x192,	%l2
	ba	%icc,	loop_1216
loop_1215:
	sra	%o1,	%i5,	%o6
	for	%f8,	%f22,	%f22
	orcc	%i7,	0x03C9,	%l0
loop_1216:
	smul	%l4,	0x0C73,	%o3
	tge	%icc,	0x2
	andcc	%i2,	%o4,	%g7
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l5
	fpmerge	%f13,	%f29,	%f10
	movne	%icc,	%l6,	%g1
	tpos	%xcc,	0x3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x78] %asi,	%i3
	subccc	%g6,	0x0A5B,	%i0
	tge	%icc,	0x7
	array32	%g2,	%o7,	%o5
	fbn	%fcc2,	loop_1217
	fcmpeq32	%f16,	%f2,	%g5
	tg	%xcc,	0x5
	sdivx	%l3,	0x068F,	%i6
loop_1217:
	fmul8sux16	%f16,	%f26,	%f14
	brlz,a	%l1,	loop_1218
	fmovdne	%xcc,	%f23,	%f0
	fmul8sux16	%f12,	%f26,	%f14
	set	0x40, %o2
	sta	%f12,	[%l7 + %o2] 0x11
loop_1218:
	edge8l	%o2,	%o0,	%i1
	fzeros	%f4
	fpsub32	%f18,	%f12,	%f12
	movre	%g4,	0x0FC,	%g3
	fmovsg	%xcc,	%f25,	%f21
	tsubcctv	%i4,	%l2,	%i5
	fmovsg	%icc,	%f6,	%f8
	ldsw	[%l7 + 0x78],	%o6
	movl	%icc,	%i7,	%o1
	addccc	%l4,	0x039B,	%l0
	movge	%xcc,	%i2,	%o3
	edge8l	%g7,	%o4,	%l6
	fmul8ulx16	%f6,	%f28,	%f24
	add	%l5,	%i3,	%g6
	addc	%g1,	%i0,	%g2
	array32	%o5,	%o7,	%g5
	fbug	%fcc0,	loop_1219
	fandnot1s	%f4,	%f5,	%f1
	edge8n	%l3,	%i6,	%o2
	fcmpeq16	%f10,	%f10,	%o0
loop_1219:
	subccc	%i1,	%l1,	%g3
	tle	%xcc,	0x0
	fble,a	%fcc1,	loop_1220
	srax	%i4,	%l2,	%g4
	fbe,a	%fcc1,	loop_1221
	movne	%icc,	%o6,	%i7
loop_1220:
	std	%o0,	[%l7 + 0x18]
	movrlz	%i5,	0x125,	%l0
loop_1221:
	swap	[%l7 + 0x60],	%i2
	edge16	%o3,	%l4,	%o4
	mulscc	%g7,	%l5,	%l6
	movpos	%xcc,	%i3,	%g6
	tcc	%xcc,	0x0
	fmovsneg	%icc,	%f15,	%f12
	fba,a	%fcc1,	loop_1222
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g1,	%g2,	%i0
	array32	%o5,	%g5,	%o7
loop_1222:
	fcmpes	%fcc0,	%f17,	%f16
	umul	%l3,	0x14EE,	%o2
	edge8	%o0,	%i6,	%i1
	fexpand	%f0,	%f22
	alignaddr	%g3,	%i4,	%l1
	edge8n	%l2,	%o6,	%i7
	move	%icc,	%o1,	%g4
	subc	%i5,	0x112C,	%i2
	ldd	[%l7 + 0x28],	%f28
	xnor	%l0,	0x146F,	%o3
	movvs	%xcc,	%l4,	%o4
	nop
	set	0x49, %o3
	ldub	[%l7 + %o3],	%l5
	fmovse	%icc,	%f18,	%f18
	array32	%l6,	%g7,	%g6
	set	0x78, %i0
	stwa	%i3,	[%l7 + %i0] 0x11
	fmul8x16	%f8,	%f30,	%f28
	movge	%xcc,	%g1,	%g2
	sth	%o5,	[%l7 + 0x6E]
	fmovdcc	%xcc,	%f31,	%f3
	movcs	%icc,	%g5,	%o7
	fxors	%f28,	%f25,	%f18
	fmovrdne	%l3,	%f26,	%f14
	fand	%f10,	%f30,	%f18
	edge8l	%i0,	%o2,	%i6
	addcc	%i1,	%g3,	%o0
	fsrc1s	%f22,	%f18
	edge16	%l1,	%i4,	%o6
	edge32ln	%i7,	%o1,	%g4
	edge32ln	%l2,	%i2,	%l0
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x17
	membar	#Sync
	smulcc	%o3,	%l4,	%i5
	fxnor	%f12,	%f26,	%f6
	wr	%g0,	0x89,	%asi
	stxa	%l5,	[%l7 + 0x60] %asi
	movrlez	%o4,	%l6,	%g7
	fmovrdlz	%i3,	%f12,	%f6
	ldsw	[%l7 + 0x30],	%g6
	fbg,a	%fcc0,	loop_1223
	bg,a,pt	%icc,	loop_1224
	tsubcc	%g2,	0x1C6B,	%g1
	fnot2	%f12,	%f20
loop_1223:
	te	%xcc,	0x4
loop_1224:
	udiv	%o5,	0x15D5,	%o7
	fmovs	%f1,	%f5
	fnands	%f14,	%f28,	%f15
	tl	%xcc,	0x7
	xnor	%l3,	0x0024,	%i0
	tg	%icc,	0x2
	edge32ln	%o2,	%g5,	%i6
	movrne	%g3,	0x2C4,	%o0
	tpos	%xcc,	0x1
	tcs	%xcc,	0x5
	movvs	%xcc,	%i1,	%i4
	edge32	%o6,	%i7,	%o1
	fandnot1	%f12,	%f8,	%f20
	fands	%f27,	%f4,	%f18
	membar	0x68
	srax	%l1,	%l2,	%g4
	brgez	%l0,	loop_1225
	edge8	%i2,	%l4,	%i5
	ldstub	[%l7 + 0x2C],	%o3
	xnorcc	%o4,	0x1025,	%l5
loop_1225:
	fmul8sux16	%f14,	%f24,	%f6
	bne,a,pt	%xcc,	loop_1226
	fnor	%f0,	%f16,	%f2
	ld	[%l7 + 0x28],	%f22
	tsubcctv	%g7,	0x11A3,	%l6
loop_1226:
	swap	[%l7 + 0x18],	%i3
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x79] %asi,	%g2
	movg	%icc,	%g1,	%o5
	alignaddr	%g6,	%o7,	%i0
	tneg	%icc,	0x1
	wr	%g0,	0x2f,	%asi
	stda	%o2,	[%l7 + 0x70] %asi
	membar	#Sync
	ldd	[%l7 + 0x18],	%l2
	set	0x34, %l5
	stha	%i6,	[%l7 + %l5] 0x04
	fmovsle	%icc,	%f18,	%f29
	addccc	%g3,	0x0EFB,	%g5
	tcs	%icc,	0x0
	nop
	setx	loop_1227,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udiv	%o0,	0x0C11,	%i4
	subcc	%i1,	%i7,	%o1
	udivcc	%l1,	0x0EC2,	%o6
loop_1227:
	mova	%xcc,	%l2,	%g4
	taddcc	%i2,	0x15E1,	%l4
	edge16	%l0,	%o3,	%o4
	fcmpne16	%f2,	%f16,	%i5
	movrgez	%g7,	%l5,	%l6
	set	0x7A, %i7
	lduba	[%l7 + %i7] 0x80,	%i3
	fnegs	%f15,	%f11
	wr	%g0,	0xea,	%asi
	stda	%g0,	[%l7 + 0x40] %asi
	membar	#Sync
	tneg	%xcc,	0x1
	fornot1	%f0,	%f8,	%f14
	nop
	set	0x70, %g3
	std	%f14,	[%l7 + %g3]
	udiv	%g2,	0x08A5,	%g6
	or	%o7,	0x0907,	%i0
	fmovsg	%xcc,	%f6,	%f22
	fmovsle	%icc,	%f15,	%f22
	fnand	%f6,	%f8,	%f20
	taddcc	%o5,	%o2,	%i6
	tcs	%icc,	0x3
	fnors	%f21,	%f9,	%f13
	movrgez	%l3,	0x276,	%g5
	add	%g3,	%i4,	%i1
	nop
	set	0x78, %g5
	std	%i6,	[%l7 + %g5]
	movpos	%icc,	%o1,	%o0
	ldd	[%l7 + 0x28],	%f4
	xorcc	%l1,	%o6,	%l2
	movle	%icc,	%g4,	%l4
	edge16ln	%i2,	%o3,	%o4
	smulcc	%i5,	%g7,	%l5
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0x16
	membar	#Sync
	fmovspos	%xcc,	%f15,	%f14
	edge8	%l6,	%i3,	%g1
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	std	%f30,	[%l7 + 0x10]
	addc	%g2,	%l0,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o7,	%i0,	%o2
	fsrc1	%f26,	%f24
	movcs	%xcc,	%o5,	%l3
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movge	%icc,	%i6,	%g5
	addccc	%g3,	0x1457,	%i4
	subccc	%i1,	%o1,	%i7
	bvc	loop_1228
	movneg	%icc,	%l1,	%o6
	fcmped	%fcc0,	%f2,	%f2
	movg	%xcc,	%l2,	%o0
loop_1228:
	fmovrdgz	%g4,	%f2,	%f28
	prefetch	[%l7 + 0x30],	 0x3
	umulcc	%i2,	0x12A6,	%l4
	bpos,a,pt	%xcc,	loop_1229
	bn,pn	%icc,	loop_1230
	sir	0x137F
	fmovsn	%xcc,	%f1,	%f20
loop_1229:
	stbar
loop_1230:
	edge8	%o3,	%o4,	%i5
	set	0x78, %o0
	stba	%l5,	[%l7 + %o0] 0x04
	smul	%l6,	0x14B8,	%g7
	wr	%g0,	0x80,	%asi
	sta	%f19,	[%l7 + 0x74] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i3,	%g1,	%g2
	orn	%g6,	0x122A,	%o7
	movn	%icc,	%l0,	%i0
	nop
	setx	loop_1231,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tpos	%icc,	0x7
	addcc	%o2,	%l3,	%o5
	alignaddr	%g5,	%i6,	%g3
loop_1231:
	edge32ln	%i1,	%o1,	%i7
	mulx	%l1,	0x1EAD,	%o6
	mulx	%i4,	%o0,	%l2
	ldd	[%l7 + 0x78],	%g4
	membar	0x1A
	movcc	%icc,	%l4,	%i2
	movrlz	%o4,	0x16A,	%i5
	stw	%o3,	[%l7 + 0x44]
	fmovdl	%icc,	%f21,	%f10
	fbne	%fcc1,	loop_1232
	fpadd16	%f18,	%f22,	%f22
	tcc	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	stha	%l6,	[%l7 + 0x22] %asi
loop_1232:
	stb	%l5,	[%l7 + 0x3B]
	move	%icc,	%g7,	%i3
	bg	loop_1233
	fmovsn	%icc,	%f10,	%f1
	addccc	%g2,	0x09DC,	%g1
	brnz,a	%g6,	loop_1234
loop_1233:
	edge8ln	%o7,	%l0,	%o2
	movneg	%icc,	%l3,	%i0
	brlz	%g5,	loop_1235
loop_1234:
	fnands	%f24,	%f16,	%f25
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x6
loop_1235:
	add	%i6,	0x1548,	%g3
	fble	%fcc0,	loop_1236
	tsubcc	%o5,	0x0E2C,	%i1
	fpack16	%f14,	%f9
	alignaddr	%o1,	%i7,	%o6
loop_1236:
	fmovsne	%icc,	%f22,	%f11
	brgez,a	%i4,	loop_1237
	pdist	%f30,	%f6,	%f20
	orncc	%l1,	0x03AF,	%l2
	fornot2s	%f19,	%f27,	%f17
loop_1237:
	fones	%f6
	tcc	%xcc,	0x2
	movre	%g4,	%l4,	%o0
	movrlez	%o4,	0x16B,	%i2
	tle	%icc,	0x3
	fpack16	%f10,	%f30
	wr	%g0,	0x89,	%asi
	sta	%f13,	[%l7 + 0x78] %asi
	tvs	%xcc,	0x5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o3,	%l6
	fsrc2s	%f18,	%f15
	fmovrsgz	%l5,	%f12,	%f0
	tcs	%xcc,	0x4
	smulcc	%g7,	0x1EE1,	%i3
	edge32	%i5,	%g1,	%g2
	bshuffle	%f8,	%f26,	%f18
	fand	%f24,	%f20,	%f18
	orn	%o7,	%l0,	%g6
	movrne	%o2,	0x170,	%i0
	or	%g5,	%i6,	%l3
	set	0x30, %g6
	stwa	%o5,	[%l7 + %g6] 0x89
	stx	%i1,	[%l7 + 0x70]
	edge8ln	%o1,	%i7,	%g3
	taddcc	%i4,	%o6,	%l2
	edge16l	%l1,	%l4,	%o0
	array32	%o4,	%g4,	%i2
	for	%f20,	%f20,	%f18
	sir	0x0520
	alignaddr	%l6,	%l5,	%o3
	fornot2	%f12,	%f12,	%f14
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movcc	%icc,	%i3,	%i5
	fmovsne	%icc,	%f31,	%f20
	fmovda	%xcc,	%f6,	%f13
	fpack16	%f2,	%f24
	fmovsneg	%xcc,	%f12,	%f2
	set	0x78, %g2
	stwa	%g7,	[%l7 + %g2] 0x10
	tsubcc	%g2,	0x12B1,	%o7
	fmul8sux16	%f16,	%f8,	%f28
	wr	%g0,	0x89,	%asi
	stda	%l0,	[%l7 + 0x28] %asi
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x11
	set	0x7C, %g4
	sta	%f11,	[%l7 + %g4] 0x81
	tgu	%xcc,	0x4
	fblg,a	%fcc2,	loop_1238
	fbge,a	%fcc3,	loop_1239
	tge	%icc,	0x5
	fbule	%fcc0,	loop_1240
loop_1238:
	umulcc	%g1,	0x1329,	%g6
loop_1239:
	or	%o2,	0x149C,	%g5
	fba,a	%fcc0,	loop_1241
loop_1240:
	addccc	%i6,	%i0,	%o5
	sub	%i1,	%o1,	%l3
	tne	%icc,	0x6
loop_1241:
	call	loop_1242
	ldx	[%l7 + 0x40],	%g3
	tcs	%xcc,	0x7
	te	%xcc,	0x4
loop_1242:
	umul	%i4,	%o6,	%i7
	brgez	%l1,	loop_1243
	membar	0x0A
	sub	%l2,	%l4,	%o4
	fandnot2	%f4,	%f10,	%f2
loop_1243:
	taddcctv	%g4,	%i2,	%l6
	fmovdne	%xcc,	%f8,	%f12
	wr	%g0,	0xe2,	%asi
	stda	%o0,	[%l7 + 0x10] %asi
	membar	#Sync
	ldstub	[%l7 + 0x4D],	%o3
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x81
	fmovrsgz	%i3,	%f8,	%f27
	wr	%g0,	0xe2,	%asi
	stba	%i5,	[%l7 + 0x4F] %asi
	membar	#Sync
	sethi	0x04E1,	%l5
	fmovde	%xcc,	%f28,	%f5
	be,a,pt	%xcc,	loop_1244
	stw	%g7,	[%l7 + 0x3C]
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x28] %asi,	%o7
loop_1244:
	edge8l	%g2,	%g1,	%l0
	fmovdge	%icc,	%f6,	%f27
	fblg,a	%fcc0,	loop_1245
	fmovsa	%xcc,	%f13,	%f24
	array8	%g6,	%g5,	%i6
	fbne	%fcc3,	loop_1246
loop_1245:
	tleu	%xcc,	0x4
	add	%i0,	%o2,	%i1
	movre	%o5,	%o1,	%g3
loop_1246:
	fmovdcc	%icc,	%f13,	%f13
	fmovsl	%icc,	%f24,	%f30
	ldsb	[%l7 + 0x4E],	%i4
	fmovdleu	%icc,	%f29,	%f29
	xor	%o6,	%l3,	%i7
	xnor	%l1,	0x0A9F,	%l2
	brz	%o4,	loop_1247
	movrlz	%g4,	0x107,	%i2
	tg	%icc,	0x5
	flush	%l7 + 0x7C
loop_1247:
	fmovdl	%xcc,	%f0,	%f6
	bne,a	%icc,	loop_1248
	brlz,a	%l4,	loop_1249
	move	%xcc,	%o0,	%l6
	array32	%o3,	%i3,	%i5
loop_1248:
	bleu,pt	%icc,	loop_1250
loop_1249:
	bl	loop_1251
	move	%icc,	%g7,	%o7
	fzero	%f24
loop_1250:
	smul	%l5,	0x0925,	%g2
loop_1251:
	andcc	%g1,	0x0285,	%l0
	fmovrdlez	%g6,	%f14,	%f4
	movge	%xcc,	%i6,	%i0
	tcs	%xcc,	0x4
	bleu,a	loop_1252
	xorcc	%g5,	%i1,	%o2
	movn	%icc,	%o1,	%g3
	ble,pt	%icc,	loop_1253
loop_1252:
	edge8	%o5,	%o6,	%l3
	fbl,a	%fcc1,	loop_1254
	be,a,pt	%icc,	loop_1255
loop_1253:
	fbge	%fcc2,	loop_1256
	orncc	%i4,	0x1180,	%l1
loop_1254:
	ldx	[%l7 + 0x60],	%l2
loop_1255:
	movrlez	%o4,	%i7,	%g4
loop_1256:
	stw	%i2,	[%l7 + 0x24]
	fcmps	%fcc3,	%f5,	%f10
	array16	%l4,	%l6,	%o0
	te	%xcc,	0x5
	edge8l	%i3,	%o3,	%i5
	membar	0x2C
	add	%o7,	%g7,	%l5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%l0
	set	0x50, %i4
	stda	%g6,	[%l7 + %i4] 0x15
	fornot2	%f6,	%f24,	%f12
	sll	%i6,	0x1C,	%g1
	edge8n	%g5,	%i0,	%o2
	brlez,a	%o1,	loop_1257
	array32	%i1,	%g3,	%o5
	orn	%o6,	0x0DCC,	%i4
	fmuld8ulx16	%f26,	%f30,	%f0
loop_1257:
	nop
	set	0x60, %o1
	prefetcha	[%l7 + %o1] 0x80,	 0x1
	taddcctv	%l2,	0x1D71,	%l1
	brnz,a	%o4,	loop_1258
	fnot2s	%f2,	%f2
	te	%xcc,	0x3
	fmovrdlz	%g4,	%f16,	%f10
loop_1258:
	umul	%i7,	0x1762,	%l4
	xnorcc	%i2,	%o0,	%l6
	edge16ln	%o3,	%i3,	%i5
	xorcc	%g7,	0x1E50,	%o7
	move	%icc,	%g2,	%l5
	fexpand	%f14,	%f6
	tvs	%xcc,	0x5
	movrgz	%l0,	0x20D,	%i6
	alignaddrl	%g6,	%g1,	%i0
	movcc	%icc,	%o2,	%o1
	ldd	[%l7 + 0x10],	%g4
	te	%xcc,	0x6
	movvc	%icc,	%g3,	%o5
	orn	%i1,	0x139B,	%i4
	tvs	%icc,	0x0
	bgu	%icc,	loop_1259
	fpsub32	%f30,	%f26,	%f14
	udivx	%o6,	0x083E,	%l3
	and	%l1,	0x0E39,	%o4
loop_1259:
	orcc	%g4,	0x058F,	%i7
	movne	%xcc,	%l4,	%i2
	wr	%g0,	0x22,	%asi
	stda	%o0,	[%l7 + 0x38] %asi
	membar	#Sync
	addccc	%l6,	0x133F,	%o3
	sub	%l2,	0x1BBC,	%i3
	sdivx	%g7,	0x07CE,	%i5
	add	%o7,	%g2,	%l0
	movrlz	%i6,	0x16B,	%g6
	sll	%g1,	%l5,	%o2
	udivx	%o1,	0x1AF9,	%g5
	tgu	%xcc,	0x3
	fble	%fcc3,	loop_1260
	alignaddr	%i0,	%o5,	%g3
	tle	%icc,	0x5
	fxnors	%f11,	%f30,	%f6
loop_1260:
	tne	%icc,	0x2
	mova	%icc,	%i1,	%o6
	sllx	%l3,	0x16,	%i4
	fzeros	%f7
	srl	%o4,	0x0F,	%l1
	bvc,a,pn	%icc,	loop_1261
	fpmerge	%f19,	%f1,	%f20
	edge8	%g4,	%l4,	%i7
	movgu	%xcc,	%i2,	%l6
loop_1261:
	andncc	%o0,	%l2,	%i3
	fmul8x16au	%f19,	%f6,	%f10
	edge32l	%o3,	%g7,	%i5
	fbge,a	%fcc0,	loop_1262
	edge16	%o7,	%l0,	%i6
	fble	%fcc3,	loop_1263
	fmovscc	%xcc,	%f1,	%f20
loop_1262:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f18,	%f20,	%f20
loop_1263:
	st	%f12,	[%l7 + 0x58]
	tcs	%xcc,	0x1
	fmovde	%xcc,	%f21,	%f17
	sll	%g2,	0x0E,	%g1
	nop
	setx	loop_1264,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bn,a	loop_1265
	tne	%icc,	0x1
	mulscc	%l5,	0x155B,	%o2
loop_1264:
	fble,a	%fcc0,	loop_1266
loop_1265:
	movne	%icc,	%g6,	%g5
	tcc	%xcc,	0x7
	movle	%xcc,	%i0,	%o5
loop_1266:
	fsrc1	%f26,	%f24
	call	loop_1267
	for	%f20,	%f8,	%f30
	movge	%icc,	%o1,	%g3
	movn	%xcc,	%i1,	%l3
loop_1267:
	movpos	%xcc,	%i4,	%o4
	bcc,pn	%icc,	loop_1268
	movge	%xcc,	%o6,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%g4
loop_1268:
	tsubcctv	%l4,	0x1D9A,	%i2
	fpsub16	%f22,	%f26,	%f28
	wr	%g0,	0xea,	%asi
	stxa	%i7,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovrdlez	%l6,	%f0,	%f30
	ble	loop_1269
	ldsh	[%l7 + 0x78],	%l2
	te	%icc,	0x5
	addccc	%i3,	%o0,	%g7
loop_1269:
	movg	%icc,	%o3,	%i5
	movl	%xcc,	%l0,	%o7
	fmovsvc	%xcc,	%f16,	%f8
	edge32	%g2,	%i6,	%l5
	set	0x22, %i1
	lduba	[%l7 + %i1] 0x81,	%o2
	subc	%g1,	%g5,	%i0
	fornot1	%f8,	%f8,	%f26
	movle	%xcc,	%o5,	%g6
	fbg	%fcc2,	loop_1270
	fmovdl	%icc,	%f4,	%f4
	fornot1s	%f27,	%f26,	%f31
	tneg	%xcc,	0x0
loop_1270:
	fzero	%f10
	stw	%o1,	[%l7 + 0x50]
	subcc	%g3,	0x1CD5,	%i1
	movleu	%xcc,	%i4,	%o4
	movge	%icc,	%o6,	%l1
	fcmpgt32	%f28,	%f30,	%g4
	fba,a	%fcc2,	loop_1271
	sdivx	%l3,	0x0649,	%l4
	fsrc2s	%f3,	%f14
	movcs	%icc,	%i2,	%i7
loop_1271:
	brgz,a	%l2,	loop_1272
	orcc	%i3,	%o0,	%l6
	srl	%o3,	%g7,	%i5
	fble	%fcc0,	loop_1273
loop_1272:
	movcs	%xcc,	%l0,	%g2
	edge8	%i6,	%o7,	%l5
	fmovspos	%icc,	%f26,	%f2
loop_1273:
	move	%xcc,	%o2,	%g5
	fblg,a	%fcc3,	loop_1274
	addc	%g1,	%i0,	%o5
	sllx	%g6,	%g3,	%i1
	fandnot1s	%f4,	%f28,	%f15
loop_1274:
	mova	%icc,	%i4,	%o4
	brlz,a	%o1,	loop_1275
	movvs	%xcc,	%o6,	%l1
	udivcc	%g4,	0x0E20,	%l3
	sir	0x0641
loop_1275:
	be	%icc,	loop_1276
	nop
	setx loop_1277, %l0, %l1
	jmpl %l1, %l4
	xor	%i2,	0x0198,	%i7
	tvc	%xcc,	0x0
loop_1276:
	movrgez	%l2,	%i3,	%o0
loop_1277:
	nop
	set	0x2A, %i3
	lduha	[%l7 + %i3] 0x81,	%l6
	tvc	%xcc,	0x5
	tle	%xcc,	0x5
	fnegd	%f10,	%f0
	fbg,a	%fcc3,	loop_1278
	fxors	%f23,	%f11,	%f29
	addccc	%g7,	0x1027,	%i5
	mova	%xcc,	%l0,	%g2
loop_1278:
	tg	%icc,	0x0
	tsubcctv	%i6,	%o7,	%o3
	movneg	%icc,	%l5,	%o2
	sub	%g1,	%i0,	%g5
	be	%xcc,	loop_1279
	fandnot2s	%f26,	%f30,	%f12
	edge16n	%g6,	%g3,	%i1
	brnz,a	%o5,	loop_1280
loop_1279:
	fsrc2	%f2,	%f26
	set	0x78, %o7
	swapa	[%l7 + %o7] 0x81,	%o4
loop_1280:
	fmul8x16au	%f31,	%f30,	%f20
	ldsh	[%l7 + 0x62],	%i4
	ble,pn	%icc,	loop_1281
	fand	%f0,	%f26,	%f28
	fnegs	%f31,	%f9
	fbo	%fcc3,	loop_1282
loop_1281:
	fmovs	%f13,	%f17
	edge8	%o6,	%o1,	%g4
	or	%l3,	0x17CC,	%l4
loop_1282:
	srlx	%i2,	0x11,	%i7
	udivx	%l1,	0x0CE7,	%l2
	fornot1	%f22,	%f6,	%f10
	edge32n	%i3,	%l6,	%o0
	fnot1	%f22,	%f30
	tcs	%icc,	0x2
	ldstub	[%l7 + 0x47],	%g7
	srl	%i5,	%l0,	%g2
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x14
	set	0x2C, %l2
	ldswa	[%l7 + %l2] 0x81,	%i6
	tsubcctv	%o3,	%o7,	%l5
	smul	%o2,	%g1,	%g5
	fcmps	%fcc3,	%f1,	%f16
	bl,a,pn	%xcc,	loop_1283
	movrgz	%i0,	%g3,	%i1
	wr	%g0,	0x18,	%asi
	stba	%o5,	[%l7 + 0x2C] %asi
loop_1283:
	ble,a	%icc,	loop_1284
	tcs	%xcc,	0x3
	bge,pn	%icc,	loop_1285
	fmuld8sux16	%f25,	%f25,	%f6
loop_1284:
	fcmps	%fcc2,	%f29,	%f20
	movgu	%xcc,	%o4,	%i4
loop_1285:
	fmovda	%icc,	%f21,	%f17
	edge32n	%o6,	%o1,	%g4
	mulscc	%g6,	%l4,	%l3
	xnor	%i2,	0x057E,	%l1
	tne	%xcc,	0x0
	bn	%icc,	loop_1286
	fcmpgt32	%f26,	%f8,	%i7
	srl	%i3,	%l6,	%o0
	udiv	%l2,	0x0F73,	%g7
loop_1286:
	fmovrslz	%i5,	%f16,	%f8
	movcs	%xcc,	%g2,	%i6
	fnot1s	%f23,	%f24
	fsrc1s	%f27,	%f26
	tle	%xcc,	0x3
	membar	0x22
	movrne	%l0,	%o3,	%l5
	edge32	%o2,	%o7,	%g1
	fmovrdgez	%g5,	%f8,	%f28
	ldd	[%l7 + 0x50],	%f10
	xnorcc	%i0,	%g3,	%i1
	lduh	[%l7 + 0x66],	%o5
	tpos	%xcc,	0x0
	ta	%xcc,	0x0
	movneg	%icc,	%o4,	%o6
	edge16l	%i4,	%g4,	%o1
	movne	%xcc,	%g6,	%l4
	xnorcc	%i2,	0x109C,	%l1
	and	%i7,	0x1B22,	%l3
	edge8l	%l6,	%o0,	%i3
	fmovrdne	%l2,	%f12,	%f10
	bg,a,pt	%icc,	loop_1287
	subcc	%g7,	%g2,	%i6
	tn	%xcc,	0x4
	fmovdgu	%icc,	%f12,	%f29
loop_1287:
	movge	%xcc,	%i5,	%o3
	fbg	%fcc3,	loop_1288
	stb	%l5,	[%l7 + 0x79]
	add	%l0,	%o2,	%o7
	movrlz	%g1,	%g5,	%g3
loop_1288:
	edge8	%i1,	%i0,	%o5
	fxnor	%f10,	%f8,	%f24
	nop
	setx loop_1289, %l0, %l1
	jmpl %l1, %o4
	srlx	%o6,	%i4,	%g4
	movrgez	%o1,	%l4,	%i2
	fbne,a	%fcc0,	loop_1290
loop_1289:
	movrne	%l1,	%g6,	%i7
	brgez	%l3,	loop_1291
	nop
	set	0x71, %l6
	ldstub	[%l7 + %l6],	%o0
loop_1290:
	alignaddrl	%i3,	%l2,	%l6
	srl	%g7,	%i6,	%i5
loop_1291:
	edge16n	%g2,	%l5,	%o3
	edge32ln	%o2,	%l0,	%o7
	swap	[%l7 + 0x40],	%g5
	srax	%g3,	%i1,	%i0
	fnegd	%f20,	%f26
	nop
	set	0x78, %o4
	prefetch	[%l7 + %o4],	 0x0
	orncc	%o5,	%g1,	%o4
	fxors	%f5,	%f10,	%f9
	edge32	%i4,	%g4,	%o6
	mulscc	%l4,	%i2,	%o1
	udivx	%g6,	0x1DCD,	%l1
	set	0x73, %g7
	ldstuba	[%l7 + %g7] 0x18,	%i7
	tvs	%xcc,	0x5
	edge32	%l3,	%i3,	%l2
	movl	%xcc,	%o0,	%g7
	movrgz	%l6,	0x219,	%i6
	array32	%g2,	%i5,	%l5
	fmovdgu	%xcc,	%f4,	%f12
	movpos	%icc,	%o3,	%l0
	sllx	%o2,	%g5,	%g3
	movleu	%xcc,	%i1,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o5,	%g1
	sth	%o4,	[%l7 + 0x78]
	fmovrdne	%i0,	%f28,	%f24
	ta	%icc,	0x6
	bshuffle	%f8,	%f4,	%f2
	movleu	%xcc,	%g4,	%o6
	sethi	0x0970,	%i4
	edge16l	%l4,	%i2,	%g6
	membar	0x7F
	membar	0x7E
	nop
	setx	loop_1292,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16	%f12,	%f4,	%f14
	sllx	%l1,	%i7,	%o1
	bge,a,pt	%icc,	loop_1293
loop_1292:
	movneg	%xcc,	%l3,	%l2
	andcc	%i3,	%o0,	%g7
	array8	%l6,	%i6,	%g2
loop_1293:
	movrne	%l5,	0x2E7,	%o3
	smul	%l0,	0x1129,	%o2
	fcmpeq16	%f18,	%f14,	%g5
	fpack16	%f10,	%f16
	fmuld8ulx16	%f28,	%f13,	%f16
	edge32	%g3,	%i1,	%o7
	set	0x50, %o6
	lda	[%l7 + %o6] 0x14,	%f25
	fbue,a	%fcc1,	loop_1294
	movvs	%xcc,	%i5,	%g1
	tneg	%icc,	0x3
	brgez,a	%o5,	loop_1295
loop_1294:
	tsubcc	%i0,	%o4,	%g4
	ta	%icc,	0x2
	fbg,a	%fcc0,	loop_1296
loop_1295:
	fmovse	%icc,	%f13,	%f20
	tvs	%xcc,	0x7
	ldstub	[%l7 + 0x10],	%o6
loop_1296:
	movvs	%icc,	%l4,	%i2
	orncc	%i4,	%g6,	%l1
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x80
	bpos,a,pt	%icc,	loop_1297
	udiv	%i7,	0x112D,	%l3
	nop
	setx	loop_1298,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x0
loop_1297:
	fbge	%fcc0,	loop_1299
	addc	%o1,	0x042A,	%i3
loop_1298:
	nop
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%o0
loop_1299:
	xnor	%g7,	0x189B,	%l6
	fandnot1	%f24,	%f8,	%f22
	brz,a	%i6,	loop_1300
	orncc	%g2,	0x06F8,	%l2
	orcc	%o3,	%l0,	%l5
	subcc	%o2,	%g3,	%g5
loop_1300:
	edge16ln	%o7,	%i1,	%i5
	andncc	%o5,	%i0,	%o4
	edge16ln	%g1,	%o6,	%l4
	umul	%i2,	%g4,	%g6
	set	0x50, %l1
	stda	%l0,	[%l7 + %l1] 0x18
	tcc	%icc,	0x7
	set	0x48, %l0
	stxa	%i4,	[%l7 + %l0] 0xe2
	membar	#Sync
	flush	%l7 + 0x38
	fba,a	%fcc3,	loop_1301
	umulcc	%i7,	0x0017,	%o1
	movleu	%icc,	%i3,	%l3
	tleu	%icc,	0x2
loop_1301:
	movge	%icc,	%o0,	%g7
	xnorcc	%i6,	%l6,	%g2
	nop
	set	0x48, %g1
	std	%l2,	[%l7 + %g1]
	membar	0x75
	smulcc	%o3,	0x004A,	%l0
	tcc	%icc,	0x1
	edge32ln	%o2,	%g3,	%g5
	brgz,a	%o7,	loop_1302
	bvc,a	%icc,	loop_1303
	fnot2s	%f31,	%f0
	brgz	%i1,	loop_1304
loop_1302:
	movle	%xcc,	%i5,	%o5
loop_1303:
	std	%f4,	[%l7 + 0x70]
	fmovdg	%xcc,	%f21,	%f25
loop_1304:
	add	%l5,	%o4,	%i0
	tgu	%xcc,	0x1
	bgu,a,pt	%icc,	loop_1305
	tl	%icc,	0x2
	movl	%xcc,	%o6,	%g1
	sra	%l4,	%g4,	%i2
loop_1305:
	faligndata	%f30,	%f4,	%f26
	andcc	%g6,	0x1523,	%l1
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x11
	array8	%i7,	%i4,	%i3
	move	%xcc,	%o1,	%l3
	bcs,a,pn	%xcc,	loop_1306
	fbue	%fcc3,	loop_1307
	xnorcc	%g7,	%i6,	%o0
	sdivcc	%g2,	0x1EF6,	%l2
loop_1306:
	movrlez	%l6,	%l0,	%o2
loop_1307:
	movvc	%icc,	%o3,	%g3
	addc	%g5,	0x05CE,	%o7
	orcc	%i1,	0x162E,	%o5
	ldx	[%l7 + 0x50],	%i5
	fzeros	%f30
	orn	%o4,	0x017A,	%i0
	tge	%icc,	0x4
	popc	%l5,	%g1
	fmovscs	%icc,	%f2,	%f7
	sllx	%o6,	0x00,	%g4
	addc	%i2,	%l4,	%l1
	for	%f4,	%f24,	%f6
	call	loop_1308
	edge16	%g6,	%i4,	%i3
	sdiv	%o1,	0x0DB5,	%l3
	faligndata	%f12,	%f0,	%f16
loop_1308:
	umul	%g7,	0x06FD,	%i7
	std	%f16,	[%l7 + 0x68]
	alignaddr	%o0,	%g2,	%i6
	edge8ln	%l6,	%l0,	%o2
	fpack32	%f20,	%f30,	%f2
	lduw	[%l7 + 0x30],	%l2
	taddcctv	%g3,	0x08A9,	%g5
	edge16l	%o7,	%i1,	%o3
	bl	%xcc,	loop_1309
	smul	%i5,	0x1207,	%o4
	movleu	%icc,	%o5,	%l5
	or	%g1,	0x0FDA,	%i0
loop_1309:
	nop
	set	0x0C, %i0
	ldswa	[%l7 + %i0] 0x19,	%o6
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x67] %asi,	%g4
	edge16l	%l4,	%l1,	%i2
	bn	loop_1310
	edge16	%g6,	%i4,	%i3
	tpos	%xcc,	0x1
	sdivx	%l3,	0x048A,	%g7
loop_1310:
	fmovsvc	%icc,	%f8,	%f18
	movne	%icc,	%o1,	%o0
	umul	%i7,	%g2,	%i6
	and	%l0,	%o2,	%l2
	fmovsge	%xcc,	%f20,	%f20
	fcmpes	%fcc3,	%f14,	%f27
	call	loop_1311
	udivx	%l6,	0x0BB8,	%g3
	movrlz	%g5,	0x2EF,	%i1
	edge8n	%o7,	%i5,	%o4
loop_1311:
	movrlez	%o5,	0x031,	%l5
	flush	%l7 + 0x50
	movvs	%xcc,	%o3,	%i0
	fbuge,a	%fcc1,	loop_1312
	subccc	%o6,	0x1CC4,	%g4
	movne	%xcc,	%g1,	%l1
	edge32	%l4,	%g6,	%i4
loop_1312:
	fcmped	%fcc2,	%f28,	%f30
	stw	%i2,	[%l7 + 0x08]
	fcmpne16	%f20,	%f14,	%l3
	tleu	%xcc,	0x5
	array32	%i3,	%o1,	%o0
	fabss	%f20,	%f31
	xnor	%i7,	%g7,	%g2
	edge32l	%i6,	%o2,	%l0
	andn	%l6,	0x19DC,	%l2
	edge16n	%g3,	%g5,	%o7
	movneg	%icc,	%i1,	%o4
	ta	%icc,	0x3
	fpack32	%f2,	%f0,	%f30
	mova	%icc,	%o5,	%l5
	movneg	%icc,	%i5,	%i0
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f13,	%f23,	%f21
	andn	%o6,	0x1A0F,	%g1
	fmovs	%f7,	%f8
	srl	%g4,	%l1,	%g6
	fbg	%fcc1,	loop_1313
	fnegd	%f0,	%f6
	set	0x2C, %o2
	ldsha	[%l7 + %o2] 0x14,	%i4
loop_1313:
	ldd	[%l7 + 0x58],	%i2
	subccc	%l4,	%i3,	%l3
	fnands	%f8,	%f22,	%f5
	movvc	%xcc,	%o1,	%o0
	bpos,a	loop_1314
	movgu	%icc,	%i7,	%g7
	call	loop_1315
	ldsw	[%l7 + 0x0C],	%i6
loop_1314:
	movrgez	%o2,	%l0,	%g2
	srlx	%l2,	%l6,	%g3
loop_1315:
	tl	%icc,	0x3
	movrne	%o7,	0x0F3,	%i1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%o5
	umul	%o4,	%l5,	%i0
	movrlz	%o3,	%o6,	%i5
	subccc	%g1,	0x1544,	%g4
	tgu	%icc,	0x5
	tle	%xcc,	0x7
	fcmpeq32	%f14,	%f18,	%g6
	ldd	[%l7 + 0x20],	%f4
	smulcc	%i4,	0x1760,	%l1
	tl	%xcc,	0x5
	set	0x2C, %l5
	lda	[%l7 + %l5] 0x89,	%f24
	udivcc	%i2,	0x1BEF,	%i3
	taddcctv	%l4,	%o1,	%l3
	taddcc	%i7,	0x03DD,	%o0
	edge8ln	%g7,	%i6,	%o2
	movge	%icc,	%l0,	%l2
	te	%xcc,	0x6
	tvc	%xcc,	0x3
	movg	%icc,	%l6,	%g3
	lduw	[%l7 + 0x3C],	%o7
	srax	%i1,	%g5,	%g2
	mova	%icc,	%o5,	%o4
	movpos	%icc,	%l5,	%i0
	tgu	%icc,	0x7
	set	0x70, %i5
	prefetcha	[%l7 + %i5] 0x18,	 0x3
	fbge	%fcc0,	loop_1316
	tge	%icc,	0x4
	fcmped	%fcc1,	%f22,	%f20
	tpos	%icc,	0x4
loop_1316:
	edge8ln	%i5,	%g1,	%g4
	fbue	%fcc3,	loop_1317
	edge8l	%o6,	%g6,	%l1
	sub	%i4,	%i2,	%i3
	fcmpne32	%f22,	%f22,	%l4
loop_1317:
	edge8ln	%l3,	%o1,	%o0
	srlx	%i7,	0x0E,	%i6
	movge	%icc,	%g7,	%o2
	fmovsl	%icc,	%f6,	%f10
	fornot2	%f16,	%f22,	%f8
	fzero	%f6
	sub	%l0,	0x1F6F,	%l6
	taddcc	%l2,	%o7,	%i1
	andncc	%g5,	%g2,	%o5
	orn	%g3,	0x1C60,	%l5
	brlez,a	%o4,	loop_1318
	umul	%o3,	0x1CDE,	%i0
	movrlez	%g1,	%g4,	%o6
	sir	0x1A80
loop_1318:
	nop
	set	0x64, %g3
	stwa	%i5,	[%l7 + %g3] 0x88
	fxors	%f23,	%f17,	%f11
	srl	%l1,	%i4,	%i2
	sra	%i3,	0x10,	%l4
	srlx	%g6,	0x0D,	%o1
	movvs	%icc,	%o0,	%l3
	wr	%g0,	0x11,	%asi
	stxa	%i6,	[%l7 + 0x50] %asi
	popc	0x1171,	%i7
	taddcc	%o2,	0x0095,	%l0
	fpackfix	%f4,	%f7
	movne	%xcc,	%g7,	%l6
	movrne	%l2,	%i1,	%o7
	fmovda	%xcc,	%f16,	%f5
	tn	%xcc,	0x0
	umulcc	%g5,	0x043E,	%g2
	fcmpgt32	%f28,	%f22,	%o5
	addccc	%l5,	%o4,	%o3
	sdivx	%i0,	0x0092,	%g3
	fpsub32	%f22,	%f20,	%f28
	st	%f29,	[%l7 + 0x10]
	movgu	%icc,	%g1,	%o6
	array16	%g4,	%i5,	%i4
	taddcctv	%l1,	%i3,	%i2
	wr	%g0,	0x2f,	%asi
	stba	%l4,	[%l7 + 0x56] %asi
	membar	#Sync
	tleu	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x60] %asi,	%o1
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x11,	%f0
	movrlz	%g6,	0x235,	%l3
	subcc	%i6,	0x0275,	%i7
	fmovsvc	%icc,	%f27,	%f0
	fcmped	%fcc2,	%f16,	%f30
	set	0x78, %l4
	ldsha	[%l7 + %l4] 0x81,	%o0
	edge16ln	%o2,	%l0,	%l6
	movle	%icc,	%l2,	%g7
	edge8	%o7,	%g5,	%g2
	fblg,a	%fcc1,	loop_1319
	andcc	%i1,	0x0DA6,	%l5
	fcmpeq32	%f26,	%f14,	%o5
	bneg,a,pn	%icc,	loop_1320
loop_1319:
	andcc	%o3,	0x109F,	%i0
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o4
loop_1320:
	fxnor	%f16,	%f14,	%f10
	sra	%g1,	%g3,	%g4
	popc	0x0FDF,	%o6
	fbge,a	%fcc0,	loop_1321
	movl	%icc,	%i5,	%i4
	move	%icc,	%i3,	%i2
	sth	%l1,	[%l7 + 0x74]
loop_1321:
	ldd	[%l7 + 0x78],	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f14,	%f30,	%f24
	brz,a	%g6,	loop_1322
	membar	0x7A
	edge32n	%l3,	%i6,	%i7
	set	0x70, %o0
	stxa	%l4,	[%l7 + %o0] 0xe3
	membar	#Sync
loop_1322:
	movrgz	%o2,	%l0,	%o0
	set	0x68, %g5
	prefetcha	[%l7 + %g5] 0x04,	 0x1
	fmovrsne	%g7,	%f6,	%f28
	fmuld8ulx16	%f0,	%f23,	%f6
	fmovdg	%icc,	%f17,	%f31
	edge8	%o7,	%l2,	%g2
	edge32	%i1,	%g5,	%l5
	mulx	%o3,	%i0,	%o5
	edge8n	%g1,	%o4,	%g3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g4,	%i5
	smul	%o6,	%i4,	%i3
	fbo,a	%fcc2,	loop_1323
	movvs	%xcc,	%l1,	%o1
	addcc	%i2,	%l3,	%g6
	movcs	%icc,	%i7,	%l4
loop_1323:
	edge32l	%o2,	%l0,	%i6
	fbne,a	%fcc1,	loop_1324
	edge8	%l6,	%g7,	%o0
	bg,a	loop_1325
	srax	%l2,	%g2,	%i1
loop_1324:
	edge16n	%o7,	%l5,	%o3
	fbue,a	%fcc1,	loop_1326
loop_1325:
	movrlez	%g5,	0x0A4,	%o5
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x14] %asi,	%i0
loop_1326:
	orncc	%o4,	%g1,	%g4
	fandnot2s	%f31,	%f26,	%f14
	fxnors	%f8,	%f18,	%f26
	srax	%i5,	%o6,	%g3
	stb	%i3,	[%l7 + 0x46]
	subcc	%i4,	%l1,	%o1
	move	%icc,	%i2,	%g6
	mulx	%i7,	0x1770,	%l4
	move	%xcc,	%l3,	%o2
	pdist	%f12,	%f6,	%f0
	tl	%icc,	0x7
	nop
	setx	loop_1327,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%i6,	0x12E6,	%l0
	fmovde	%xcc,	%f20,	%f13
	bvs	%xcc,	loop_1328
loop_1327:
	movvc	%icc,	%l6,	%g7
	stbar
	fnegd	%f8,	%f8
loop_1328:
	te	%xcc,	0x4
	udivcc	%l2,	0x1862,	%o0
	sll	%g2,	0x03,	%o7
	tleu	%icc,	0x1
	orncc	%i1,	%o3,	%g5
	nop
	setx	loop_1329,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%icc,	0x1
	edge16ln	%o5,	%i0,	%l5
	tne	%xcc,	0x2
loop_1329:
	ldsb	[%l7 + 0x4F],	%o4
	fmovdpos	%xcc,	%f18,	%f9
	bge,a,pn	%icc,	loop_1330
	bcc,a	loop_1331
	edge16ln	%g1,	%g4,	%i5
	fcmpgt32	%f8,	%f18,	%o6
loop_1330:
	movrgz	%i3,	%i4,	%l1
loop_1331:
	swap	[%l7 + 0x1C],	%o1
	nop
	set	0x0C, %g2
	lduw	[%l7 + %g2],	%g3
	bvs	loop_1332
	sir	0x1ED4
	fors	%f17,	%f0,	%f6
	fcmpgt32	%f12,	%f30,	%g6
loop_1332:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a,pn	%icc,	loop_1333
	edge8l	%i2,	%i7,	%l3
	tgu	%xcc,	0x4
	addc	%l4,	%o2,	%l0
loop_1333:
	nop
	setx	loop_1334,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%l6,	%i6,	%l2
	edge16l	%o0,	%g7,	%g2
	sra	%o7,	%i1,	%o3
loop_1334:
	edge8ln	%g5,	%i0,	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%g1
	bgu	%icc,	loop_1335
	ldd	[%l7 + 0x58],	%g4
	addc	%o5,	%i5,	%i3
	sdiv	%i4,	0x0F67,	%o6
loop_1335:
	bge,a,pn	%icc,	loop_1336
	stx	%l1,	[%l7 + 0x28]
	movrgz	%o1,	%g6,	%i2
	edge8	%g3,	%l3,	%l4
loop_1336:
	subcc	%i7,	%l0,	%l6
	movre	%o2,	%l2,	%i6
	orn	%g7,	0x1D03,	%o0
	edge32	%o7,	%g2,	%i1
	smul	%o3,	%i0,	%g5
	srlx	%l5,	0x06,	%o4
	srax	%g1,	%g4,	%o5
	mova	%xcc,	%i3,	%i4
	movne	%icc,	%i5,	%o6
	andncc	%l1,	%g6,	%o1
	tcc	%xcc,	0x5
	andncc	%g3,	%l3,	%l4
	edge8ln	%i7,	%i2,	%l6
	umul	%l0,	%l2,	%i6
	orncc	%o2,	%o0,	%o7
	xorcc	%g7,	0x1226,	%g2
	edge8	%i1,	%o3,	%i0
	andncc	%g5,	%o4,	%l5
	smul	%g4,	%o5,	%g1
	or	%i4,	%i3,	%i5
	tpos	%icc,	0x2
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0x1e
	membar	#Sync
	bvc	loop_1337
	edge32	%l1,	%o6,	%o1
	orcc	%g6,	0x111A,	%l3
	fornot1	%f6,	%f26,	%f20
loop_1337:
	nop
	setx	loop_1338,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bpos,a,pt	%xcc,	loop_1339
	fbu	%fcc0,	loop_1340
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1338:
	popc	0x14A0,	%l4
loop_1339:
	nop
	set	0x18, %g6
	ldxa	[%g0 + %g6] 0x50,	%g3
loop_1340:
	tl	%icc,	0x7
	movcc	%icc,	%i7,	%i2
	tsubcctv	%l6,	%l0,	%i6
	tsubcc	%l2,	0x0277,	%o0
	subc	%o7,	0x1C63,	%g7
	edge32ln	%g2,	%o2,	%i1
	udivcc	%i0,	0x1A9E,	%g5
	andcc	%o4,	0x0C3A,	%o3
	fmovrdne	%g4,	%f6,	%f20
	fandnot1s	%f0,	%f30,	%f3
	fmovdpos	%xcc,	%f8,	%f11
	sll	%o5,	0x1F,	%l5
	andn	%i4,	0x0F20,	%g1
	wr	%g0,	0xeb,	%asi
	stwa	%i3,	[%l7 + 0x50] %asi
	membar	#Sync
	udivx	%l1,	0x0983,	%i5
	subcc	%o6,	0x1C6A,	%g6
	udivcc	%l3,	0x1FF2,	%l4
	movrlez	%g3,	%i7,	%i2
	fcmpgt16	%f24,	%f22,	%o1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%l6
	fones	%f12
	fpsub16s	%f20,	%f19,	%f12
	fsrc2s	%f1,	%f12
	bne,pt	%icc,	loop_1341
	sdivx	%l0,	0x1D32,	%l2
	smulcc	%i6,	0x0049,	%o0
	fcmpeq16	%f2,	%f8,	%g7
loop_1341:
	fmovrdlez	%o7,	%f6,	%f24
	umulcc	%o2,	0x11CF,	%i1
	fmovscs	%xcc,	%f30,	%f11
	fcmpne16	%f26,	%f22,	%i0
	fpack16	%f24,	%f6
	alignaddr	%g2,	%o4,	%g5
	tn	%icc,	0x0
	edge32l	%g4,	%o3,	%l5
	bcs	loop_1342
	edge16n	%i4,	%o5,	%i3
	nop
	setx	loop_1343,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movgu	%icc,	%l1,	%i5
loop_1342:
	array8	%g1,	%o6,	%g6
	subcc	%l3,	0x0DA1,	%g3
loop_1343:
	bne,pn	%xcc,	loop_1344
	array8	%i7,	%l4,	%i2
	andn	%l6,	%o1,	%l0
	fnand	%f30,	%f30,	%f22
loop_1344:
	sra	%l2,	0x10,	%i6
	tl	%xcc,	0x2
	array16	%o0,	%g7,	%o2
	fones	%f0
	tgu	%icc,	0x4
	wr	%g0,	0x81,	%asi
	stda	%o6,	[%l7 + 0x68] %asi
	brz,a	%i0,	loop_1345
	movleu	%icc,	%g2,	%o4
	movge	%xcc,	%g5,	%g4
	edge8l	%i1,	%l5,	%o3
loop_1345:
	movg	%icc,	%i4,	%i3
	te	%icc,	0x6
	bcs,a	%icc,	loop_1346
	fmovscs	%icc,	%f4,	%f10
	fcmpd	%fcc2,	%f22,	%f2
	addcc	%l1,	0x1618,	%o5
loop_1346:
	fxnors	%f5,	%f29,	%f21
	edge32n	%g1,	%o6,	%g6
	array32	%i5,	%l3,	%i7
	sdiv	%g3,	0x0113,	%i2
	addccc	%l4,	0x10D4,	%l6
	ldsb	[%l7 + 0x09],	%l0
	fmovscs	%icc,	%f11,	%f23
	xnorcc	%o1,	0x04CD,	%l2
	tn	%icc,	0x6
	mova	%xcc,	%i6,	%g7
	edge8ln	%o0,	%o2,	%o7
	ta	%icc,	0x6
	edge32ln	%i0,	%g2,	%o4
	fmovdne	%xcc,	%f10,	%f9
	movrgz	%g5,	%g4,	%l5
	sllx	%i1,	%o3,	%i4
	prefetch	[%l7 + 0x50],	 0x2
	movleu	%icc,	%l1,	%i3
	movrgz	%g1,	%o5,	%g6
	stx	%o6,	[%l7 + 0x38]
	tsubcc	%i5,	0x1C59,	%l3
	tg	%xcc,	0x3
	sll	%i7,	0x0B,	%i2
	fcmpeq16	%f22,	%f26,	%g3
	sir	0x1522
	fnor	%f18,	%f28,	%f26
	fmovrse	%l6,	%f26,	%f3
	sllx	%l4,	0x09,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x28, %g4
	ldsha	[%l7 + %g4] 0x10,	%l0
	addc	%l2,	0x167D,	%i6
	movge	%xcc,	%o0,	%o2
	addcc	%o7,	%i0,	%g2
	movn	%icc,	%g7,	%o4
	mova	%xcc,	%g5,	%g4
	fors	%f0,	%f15,	%f24
	fcmpgt16	%f10,	%f20,	%i1
	subc	%l5,	0x14BD,	%i4
	alignaddr	%l1,	%o3,	%i3
	fcmple16	%f18,	%f2,	%o5
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x1f
	membar	#Sync
	mulx	%g1,	0x05C3,	%o6
	fcmpne16	%f12,	%f8,	%g6
	fbue,a	%fcc3,	loop_1347
	sll	%i5,	0x19,	%i7
	fand	%f6,	%f20,	%f20
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x24] %asi,	%i2
loop_1347:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x55] %asi,	%g3
	fabss	%f29,	%f27
	array16	%l6,	%l4,	%o1
	stb	%l0,	[%l7 + 0x33]
	brnz,a	%l2,	loop_1348
	array16	%i6,	%o0,	%l3
	be,a,pt	%icc,	loop_1349
	subccc	%o2,	0x10C9,	%i0
loop_1348:
	tcc	%icc,	0x4
	edge8	%o7,	%g7,	%o4
loop_1349:
	tgu	%xcc,	0x0
	fpack32	%f0,	%f4,	%f14
	stx	%g2,	[%l7 + 0x18]
	movrlez	%g5,	%g4,	%i1
	set	0x7C, %i2
	ldsha	[%l7 + %i2] 0x10,	%l5
	fzeros	%f10
	movneg	%xcc,	%i4,	%o3
	tgu	%icc,	0x2
	mulx	%i3,	0x1AE6,	%l1
	subccc	%g1,	%o5,	%g6
	movgu	%icc,	%i5,	%o6
	udivcc	%i7,	0x0829,	%g3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l6,	%i2
	movrne	%l4,	0x0AE,	%l0
	brlez,a	%o1,	loop_1350
	movcs	%xcc,	%l2,	%i6
	ldstub	[%l7 + 0x2A],	%o0
	alignaddr	%o2,	%i0,	%o7
loop_1350:
	tpos	%xcc,	0x1
	addcc	%l3,	0x01D6,	%g7
	fbn	%fcc1,	loop_1351
	bl,pt	%icc,	loop_1352
	movgu	%xcc,	%g2,	%g5
	udivcc	%o4,	0x099F,	%g4
loop_1351:
	fmovrsgez	%i1,	%f10,	%f3
loop_1352:
	sdivcc	%l5,	0x1A9B,	%i4
	lduw	[%l7 + 0x34],	%o3
	swap	[%l7 + 0x18],	%i3
	std	%f8,	[%l7 + 0x60]
	edge32	%g1,	%o5,	%g6
	fcmpes	%fcc2,	%f8,	%f15
	movrne	%l1,	0x214,	%o6
	sdivcc	%i5,	0x12A0,	%g3
	movne	%icc,	%l6,	%i2
	movvc	%xcc,	%l4,	%l0
	fmovrsne	%i7,	%f18,	%f30
	call	loop_1353
	smul	%l2,	0x035C,	%o1
	andncc	%i6,	%o2,	%i0
	movrlez	%o7,	0x13C,	%o0
loop_1353:
	mulscc	%l3,	0x0AE0,	%g7
	orncc	%g2,	%g5,	%o4
	bneg,pt	%xcc,	loop_1354
	ble,pn	%icc,	loop_1355
	ba,pt	%xcc,	loop_1356
	fxnors	%f3,	%f1,	%f16
loop_1354:
	fxnors	%f2,	%f27,	%f3
loop_1355:
	fmul8x16al	%f13,	%f23,	%f0
loop_1356:
	move	%xcc,	%g4,	%i1
	fmovrse	%i4,	%f27,	%f3
	movvc	%xcc,	%o3,	%i3
	fmovdcc	%icc,	%f30,	%f31
	srl	%g1,	%o5,	%g6
	fcmpgt16	%f16,	%f14,	%l1
	subccc	%o6,	%i5,	%g3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x1C] %asi,	%l6
	movrgez	%i2,	0x1E3,	%l5
	sir	0x0309
	edge16l	%l4,	%i7,	%l0
	fsrc1	%f26,	%f16
	fmovs	%f13,	%f9
	bgu,a,pt	%xcc,	loop_1357
	bge	%icc,	loop_1358
	movl	%xcc,	%l2,	%i6
	fandnot1s	%f6,	%f2,	%f19
loop_1357:
	edge16ln	%o1,	%i0,	%o2
loop_1358:
	tcc	%xcc,	0x4
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x11,	%f0
	edge32	%o7,	%o0,	%l3
	fbn	%fcc0,	loop_1359
	umulcc	%g2,	0x1182,	%g5
	stbar
	bge,a	loop_1360
loop_1359:
	addccc	%g7,	%o4,	%i1
	fornot2s	%f10,	%f0,	%f23
	fmovrdgez	%i4,	%f2,	%f14
loop_1360:
	edge32	%g4,	%i3,	%o3
	subcc	%g1,	0x0E64,	%o5
	add	%l1,	0x1FD9,	%o6
	umul	%i5,	%g3,	%l6
	fpmerge	%f18,	%f27,	%f14
	orncc	%i2,	0x1FC3,	%g6
	fmovrsgz	%l5,	%f25,	%f9
	movvs	%xcc,	%i7,	%l0
	andcc	%l2,	0x07CD,	%i6
	and	%l4,	%o1,	%i0
	sdivx	%o7,	0x0872,	%o0
	taddcctv	%o2,	0x17C4,	%l3
	edge8n	%g5,	%g7,	%g2
	movrne	%o4,	%i1,	%g4
	bshuffle	%f30,	%f8,	%f12
	tgu	%icc,	0x4
	movrlez	%i4,	0x338,	%o3
	ldx	[%l7 + 0x30],	%g1
	movn	%xcc,	%o5,	%i3
	sethi	0x0DCF,	%l1
	srl	%o6,	0x1D,	%i5
	taddcctv	%g3,	0x0661,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i2,	0x1DD4,	%l5
	xor	%i7,	%g6,	%l0
	fmovs	%f25,	%f1
	edge8n	%i6,	%l2,	%l4
	sdiv	%o1,	0x1F94,	%i0
	wr	%g0,	0x81,	%asi
	sta	%f28,	[%l7 + 0x78] %asi
	wr	%g0,	0xeb,	%asi
	stba	%o7,	[%l7 + 0x3F] %asi
	membar	#Sync
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%o2
	bge,a	%icc,	loop_1361
	tl	%icc,	0x5
	set	0x5C, %o1
	stha	%l3,	[%l7 + %o1] 0x14
loop_1361:
	edge8n	%o0,	%g5,	%g2
	stw	%g7,	[%l7 + 0x6C]
	fmovdge	%xcc,	%f15,	%f14
	tg	%icc,	0x4
	movrlez	%o4,	0x12D,	%i1
	wr	%g0,	0xea,	%asi
	stwa	%i4,	[%l7 + 0x2C] %asi
	membar	#Sync
	lduh	[%l7 + 0x56],	%o3
	fmovsneg	%xcc,	%f15,	%f8
	prefetch	[%l7 + 0x64],	 0x0
	set	0x1D, %o7
	ldsba	[%l7 + %o7] 0x88,	%g4
	andcc	%o5,	%i3,	%l1
	flush	%l7 + 0x6C
	fmovsge	%icc,	%f21,	%f6
	movrlz	%o6,	%i5,	%g1
	tn	%xcc,	0x5
	subc	%l6,	0x1671,	%g3
	fnegd	%f24,	%f10
	fmovdleu	%xcc,	%f7,	%f11
	sllx	%l5,	%i7,	%i2
	set	0x35, %l3
	lduba	[%l7 + %l3] 0x18,	%l0
	set	0x28, %l6
	swapa	[%l7 + %l6] 0x04,	%g6
	subccc	%l2,	0x0929,	%l4
	tneg	%xcc,	0x3
	edge16l	%i6,	%i0,	%o7
	stx	%o1,	[%l7 + 0x58]
	movle	%xcc,	%l3,	%o2
	smul	%g5,	%g2,	%o0
	andcc	%g7,	%i1,	%o4
	ldub	[%l7 + 0x48],	%o3
	movleu	%xcc,	%g4,	%i4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%i3
	bleu,pt	%icc,	loop_1362
	edge32n	%o6,	%i5,	%l1
	fnot1	%f4,	%f24
	movne	%icc,	%g1,	%g3
loop_1362:
	fandnot1s	%f16,	%f3,	%f11
	fblg,a	%fcc3,	loop_1363
	movvs	%icc,	%l5,	%i7
	movgu	%xcc,	%i2,	%l6
	set	0x30, %l2
	stha	%l0,	[%l7 + %l2] 0x19
loop_1363:
	te	%xcc,	0x5
	edge16ln	%l2,	%g6,	%i6
	bleu,pn	%xcc,	loop_1364
	swap	[%l7 + 0x58],	%i0
	udivcc	%l4,	0x0619,	%o7
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%l3,	%o1
loop_1364:
	nop
	set	0x25, %o4
	stba	%g5,	[%l7 + %o4] 0xe3
	membar	#Sync
	fands	%f24,	%f18,	%f6
	std	%f18,	[%l7 + 0x28]
	tle	%icc,	0x2
	andncc	%g2,	%o0,	%o2
	ble	%xcc,	loop_1365
	tg	%xcc,	0x2
	edge32ln	%g7,	%i1,	%o3
	umulcc	%o4,	0x0A17,	%g4
loop_1365:
	sra	%i4,	%o5,	%i3
	subccc	%o6,	0x07D1,	%l1
	bl,a,pt	%xcc,	loop_1366
	andcc	%i5,	%g1,	%l5
	std	%g2,	[%l7 + 0x38]
	ldx	[%l7 + 0x70],	%i2
loop_1366:
	nop
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l6,	%l0
	fbu	%fcc2,	loop_1367
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,pt	%xcc,	loop_1368
	fmovsn	%icc,	%f17,	%f4
loop_1367:
	srl	%i7,	%g6,	%i6
	fmovrde	%i0,	%f2,	%f16
loop_1368:
	bne,pt	%xcc,	loop_1369
	subcc	%l4,	%o7,	%l3
	nop
	setx	loop_1370,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsneg	%xcc,	%f11,	%f29
loop_1369:
	fmovrsgz	%o1,	%f11,	%f9
	fmul8x16al	%f6,	%f10,	%f6
loop_1370:
	movre	%g5,	%l2,	%o0
	tle	%xcc,	0x3
	stx	%o2,	[%l7 + 0x28]
	fmovsle	%icc,	%f5,	%f10
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g7,	%g2
	xorcc	%i1,	%o3,	%o4
	andncc	%g4,	%o5,	%i3
	mulx	%i4,	0x0AF2,	%l1
	fpadd32s	%f30,	%f21,	%f16
	fcmped	%fcc2,	%f18,	%f28
	movle	%xcc,	%i5,	%g1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] 0x88,	%o6,	%l5
	add	%g3,	%i2,	%l6
	fcmpne32	%f8,	%f6,	%l0
	mova	%icc,	%i7,	%g6
	ldsh	[%l7 + 0x5A],	%i0
	edge32ln	%l4,	%o7,	%l3
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x0F] %asi,	%i6
	fmul8x16	%f26,	%f26,	%f20
	fpsub32s	%f29,	%f1,	%f6
	movre	%o1,	0x0B7,	%g5
	brlz,a	%l2,	loop_1371
	fnegs	%f13,	%f9
	edge32ln	%o2,	%g7,	%g2
	movleu	%icc,	%i1,	%o3
loop_1371:
	fbn,a	%fcc1,	loop_1372
	edge16l	%o4,	%o0,	%o5
	fnot2	%f10,	%f4
	fornot1s	%f14,	%f8,	%f9
loop_1372:
	fmovrslez	%i3,	%f18,	%f16
	smul	%g4,	%l1,	%i4
	tl	%xcc,	0x7
	fpmerge	%f23,	%f4,	%f8
	fnegs	%f11,	%f11
	bcc,a	%xcc,	loop_1373
	bleu	%icc,	loop_1374
	fmovrde	%g1,	%f2,	%f26
	ldub	[%l7 + 0x7D],	%i5
loop_1373:
	ta	%icc,	0x6
loop_1374:
	tleu	%xcc,	0x2
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x04,	%o6
	fmovrdlz	%g3,	%f24,	%f28
	fmovsvc	%xcc,	%f8,	%f7
	tvs	%xcc,	0x1
	orncc	%i2,	0x093F,	%l6
	fbug,a	%fcc2,	loop_1375
	bneg	loop_1376
	fors	%f31,	%f17,	%f16
	andncc	%l0,	%i7,	%l5
loop_1375:
	fmovrdlz	%g6,	%f10,	%f28
loop_1376:
	nop
	set	0x34, %o5
	lduwa	[%l7 + %o5] 0x88,	%l4
	swap	[%l7 + 0x58],	%o7
	fmovdvs	%xcc,	%f29,	%f19
	ldsb	[%l7 + 0x13],	%i0
	set	0x62, %g7
	stha	%i6,	[%l7 + %g7] 0x18
	sll	%l3,	%g5,	%o1
	sdiv	%o2,	0x0D1E,	%l2
	fmovdle	%icc,	%f23,	%f30
	edge32l	%g7,	%i1,	%o3
	std	%g2,	[%l7 + 0x08]
	sir	0x13B9
	movrgez	%o0,	%o5,	%i3
	edge32n	%g4,	%l1,	%o4
	flush	%l7 + 0x48
	movle	%icc,	%g1,	%i5
	bpos,a	%xcc,	loop_1377
	xorcc	%o6,	0x09C3,	%i4
	fbue	%fcc2,	loop_1378
	add	%i2,	%l6,	%l0
loop_1377:
	edge32ln	%g3,	%i7,	%l5
	movg	%xcc,	%l4,	%g6
loop_1378:
	fpsub16s	%f17,	%f25,	%f21
	orcc	%o7,	%i6,	%l3
	fcmpd	%fcc3,	%f12,	%f0
	movvc	%icc,	%i0,	%o1
	smul	%g5,	0x0AEC,	%o2
	movn	%icc,	%l2,	%i1
	set	0x65, %l1
	ldstuba	[%l7 + %l1] 0x80,	%g7
	fmul8x16au	%f20,	%f21,	%f4
	xnorcc	%g2,	%o0,	%o5
	edge32n	%o3,	%i3,	%l1
	fbn,a	%fcc1,	loop_1379
	edge16n	%g4,	%g1,	%i5
	fmovrde	%o4,	%f24,	%f14
	fmovdgu	%icc,	%f21,	%f30
loop_1379:
	udivx	%i4,	0x1F9D,	%i2
	fcmple16	%f6,	%f24,	%o6
	movcc	%xcc,	%l0,	%l6
	ldub	[%l7 + 0x14],	%g3
	flush	%l7 + 0x08
	brgz,a	%l5,	loop_1380
	mulx	%i7,	0x1B2F,	%l4
	fbl,a	%fcc2,	loop_1381
	tn	%icc,	0x0
loop_1380:
	movre	%g6,	%o7,	%i6
	movrne	%i0,	%o1,	%g5
loop_1381:
	srlx	%o2,	0x1E,	%l2
	bshuffle	%f28,	%f12,	%f2
	srax	%l3,	%i1,	%g2
	stx	%g7,	[%l7 + 0x30]
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o5,	%o0
	wr	%g0,	0x11,	%asi
	stwa	%o3,	[%l7 + 0x60] %asi
	fnegd	%f12,	%f22
	set	0x20, %g1
	stxa	%i3,	[%l7 + %g1] 0x15
	fors	%f24,	%f19,	%f26
	ldstub	[%l7 + 0x79],	%l1
	tvc	%xcc,	0x4
	tge	%xcc,	0x6
	fmuld8ulx16	%f14,	%f7,	%f16
	tsubcctv	%g1,	0x0CD1,	%i5
	array16	%g4,	%o4,	%i2
	sethi	0x0EEA,	%o6
	fmul8x16al	%f27,	%f12,	%f8
	nop
	setx	loop_1382,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%i4,	%l6,	%l0
	orncc	%l5,	%g3,	%l4
	brlz,a	%g6,	loop_1383
loop_1382:
	tg	%icc,	0x3
	sdivcc	%o7,	0x0B8B,	%i7
	fmul8x16al	%f20,	%f0,	%f12
loop_1383:
	sth	%i0,	[%l7 + 0x74]
	std	%o0,	[%l7 + 0x18]
	faligndata	%f30,	%f2,	%f10
	movrlz	%i6,	0x399,	%g5
	fmovrdgez	%l2,	%f28,	%f22
	fcmple32	%f28,	%f20,	%l3
	ldsb	[%l7 + 0x51],	%i1
	movg	%icc,	%o2,	%g7
	ta	%xcc,	0x4
	fba	%fcc1,	loop_1384
	fzeros	%f13
	st	%f28,	[%l7 + 0x54]
	brlez,a	%g2,	loop_1385
loop_1384:
	tcc	%icc,	0x4
	set	0x53, %l0
	ldstuba	[%l7 + %l0] 0x10,	%o0
loop_1385:
	ldsb	[%l7 + 0x46],	%o5
	or	%i3,	0x1096,	%o3
	umulcc	%l1,	%i5,	%g1
	brnz	%g4,	loop_1386
	movrgez	%o4,	0x21D,	%i2
	bshuffle	%f2,	%f2,	%f6
	fmovdge	%xcc,	%f20,	%f10
loop_1386:
	tvc	%xcc,	0x0
	fbg	%fcc3,	loop_1387
	fmovdl	%xcc,	%f11,	%f1
	ldsh	[%l7 + 0x42],	%i4
	fbe,a	%fcc2,	loop_1388
loop_1387:
	tneg	%xcc,	0x5
	tl	%xcc,	0x0
	stbar
loop_1388:
	tsubcc	%o6,	0x18F5,	%l6
	array32	%l5,	%l0,	%g3
	fzeros	%f29
	fmovdne	%icc,	%f7,	%f18
	te	%xcc,	0x0
	fmovspos	%icc,	%f10,	%f28
	udiv	%g6,	0x0738,	%o7
	fbg,a	%fcc2,	loop_1389
	std	%f18,	[%l7 + 0x28]
	tsubcctv	%i7,	0x058B,	%l4
	movleu	%xcc,	%i0,	%i6
loop_1389:
	fcmped	%fcc2,	%f22,	%f20
	tle	%xcc,	0x2
	xor	%o1,	%g5,	%l2
	movre	%l3,	0x1DF,	%i1
	subcc	%o2,	0x09C7,	%g2
	srax	%g7,	%o5,	%i3
	set	0x3C, %o3
	lda	[%l7 + %o3] 0x88,	%f17
	fcmpgt16	%f10,	%f28,	%o3
	movleu	%xcc,	%l1,	%o0
	tvs	%xcc,	0x7
	mova	%xcc,	%i5,	%g1
	fmovsvs	%icc,	%f20,	%f20
	set	0x50, %i0
	ldda	[%l7 + %i0] 0x15,	%g4
	bshuffle	%f0,	%f28,	%f30
	fmovdleu	%icc,	%f9,	%f31
	tgu	%icc,	0x2
	fcmpgt32	%f2,	%f18,	%o4
	fbge,a	%fcc0,	loop_1390
	fbe,a	%fcc1,	loop_1391
	movle	%xcc,	%i4,	%i2
	fzeros	%f3
loop_1390:
	tcs	%xcc,	0x5
loop_1391:
	nop
	set	0x4E, %l5
	lduha	[%l7 + %l5] 0x15,	%l6
	fzero	%f20
	orncc	%o6,	%l5,	%g3
	orncc	%l0,	%g6,	%i7
	edge16n	%o7,	%l4,	%i0
	xnorcc	%i6,	%g5,	%l2
	wr	%g0,	0x81,	%asi
	stba	%o1,	[%l7 + 0x1A] %asi
	fblg	%fcc3,	loop_1392
	movg	%xcc,	%i1,	%l3
	sll	%g2,	%g7,	%o2
	andcc	%i3,	0x0E08,	%o3
loop_1392:
	movpos	%icc,	%o5,	%o0
	edge32ln	%i5,	%g1,	%l1
	addc	%g4,	%i4,	%o4
	fcmple32	%f2,	%f4,	%l6
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	tn	%icc,	0x7
	bneg,a,pn	%icc,	loop_1393
	movrlez	%o6,	%i2,	%l5
	fpadd16	%f24,	%f8,	%f14
	tgu	%xcc,	0x6
loop_1393:
	orn	%g3,	0x137E,	%g6
	movg	%icc,	%i7,	%o7
	movgu	%icc,	%l0,	%l4
	xor	%i6,	%i0,	%g5
	fsrc1s	%f0,	%f25
	fbuge,a	%fcc0,	loop_1394
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc0,	%f20,	%f0
	fsrc2s	%f31,	%f3
loop_1394:
	orncc	%o1,	%i1,	%l3
	smulcc	%g2,	%g7,	%l2
	fsrc2s	%f6,	%f15
	nop
	setx loop_1395, %l0, %l1
	jmpl %l1, %o2
	srax	%o3,	%o5,	%o0
	set	0x70, %o2
	prefetcha	[%l7 + %o2] 0x14,	 0x3
loop_1395:
	edge32l	%g1,	%l1,	%g4
	bg,a	%xcc,	loop_1396
	array32	%i4,	%i3,	%o4
	wr	%g0,	0xe2,	%asi
	stxa	%l6,	[%l7 + 0x60] %asi
	membar	#Sync
loop_1396:
	taddcctv	%o6,	%l5,	%g3
	movcs	%xcc,	%g6,	%i2
	fmovdge	%xcc,	%f9,	%f10
	fcmple16	%f10,	%f24,	%i7
	tleu	%xcc,	0x4
	or	%o7,	0x1477,	%l4
	movge	%xcc,	%i6,	%i0
	fmovsgu	%icc,	%f5,	%f29
	fbne	%fcc0,	loop_1397
	edge32l	%l0,	%o1,	%i1
	movcc	%icc,	%l3,	%g5
	fands	%f30,	%f30,	%f18
loop_1397:
	bleu	%icc,	loop_1398
	sll	%g2,	0x05,	%g7
	bl,pt	%xcc,	loop_1399
	tleu	%icc,	0x2
loop_1398:
	mulscc	%l2,	%o2,	%o3
	fornot1	%f6,	%f26,	%f12
loop_1399:
	movrlez	%o0,	%i5,	%g1
	addcc	%l1,	0x05BE,	%g4
	stb	%o5,	[%l7 + 0x63]
	edge32l	%i4,	%o4,	%l6
	lduh	[%l7 + 0x6E],	%i3
	tl	%xcc,	0x6
	sdivcc	%l5,	0x13A8,	%g3
	xnor	%o6,	%i2,	%i7
	set	0x70, %i5
	stda	%g6,	[%l7 + %i5] 0x88
	fmovdgu	%xcc,	%f16,	%f0
	fand	%f2,	%f8,	%f2
	fmovdne	%icc,	%f5,	%f10
	fzero	%f24
	fbe	%fcc0,	loop_1400
	lduh	[%l7 + 0x4A],	%o7
	xorcc	%l4,	0x0499,	%i6
	tvs	%icc,	0x0
loop_1400:
	fornot1s	%f9,	%f4,	%f16
	stbar
	faligndata	%f0,	%f16,	%f10
	fmovspos	%xcc,	%f22,	%f1
	tvc	%icc,	0x5
	movvc	%icc,	%i0,	%l0
	movcc	%xcc,	%i1,	%l3
	fnegs	%f28,	%f26
	tpos	%xcc,	0x4
	smulcc	%o1,	%g2,	%g5
	subcc	%g7,	%l2,	%o3
	tl	%icc,	0x2
	xnor	%o2,	0x0A06,	%o0
	umulcc	%g1,	%l1,	%g4
	fors	%f22,	%f12,	%f9
	sdivx	%o5,	0x058F,	%i4
	ld	[%l7 + 0x44],	%f16
	fabss	%f13,	%f22
	movg	%icc,	%i5,	%l6
	brgz	%i3,	loop_1401
	flush	%l7 + 0x0C
	sra	%l5,	%g3,	%o6
	sllx	%o4,	0x1B,	%i2
loop_1401:
	edge32ln	%g6,	%o7,	%i7
	movleu	%icc,	%l4,	%i0
	movle	%xcc,	%i6,	%i1
	movrlz	%l3,	0x198,	%o1
	array8	%g2,	%l0,	%g7
	fmovrdgez	%g5,	%f16,	%f20
	std	%l2,	[%l7 + 0x60]
	srax	%o2,	%o3,	%g1
	subc	%l1,	0x15D5,	%o0
	tge	%xcc,	0x2
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%g4
	orncc	%o5,	0x0100,	%i5
	move	%xcc,	%i4,	%l6
	sllx	%l5,	0x03,	%g3
	udivcc	%i3,	0x0E83,	%o6
	fmovscs	%xcc,	%f16,	%f31
	subc	%i2,	%o4,	%g6
	subc	%i7,	0x0814,	%o7
	bvs,pn	%xcc,	loop_1402
	membar	0x3E
	movge	%icc,	%i0,	%l4
	nop
	set	0x20, %i7
	prefetch	[%l7 + %i7],	 0x3
loop_1402:
	fbg,a	%fcc1,	loop_1403
	edge8	%i1,	%l3,	%i6
	nop
	setx loop_1404, %l0, %l1
	jmpl %l1, %g2
	tleu	%xcc,	0x7
loop_1403:
	fbg,a	%fcc1,	loop_1405
	fnot2s	%f11,	%f8
loop_1404:
	and	%o1,	0x184C,	%g7
	edge32l	%l0,	%l2,	%o2
loop_1405:
	taddcctv	%o3,	0x1603,	%g1
	movcs	%icc,	%l1,	%o0
	mova	%xcc,	%g5,	%o5
	add	%g4,	%i5,	%i4
	edge32l	%l5,	%l6,	%i3
	movge	%xcc,	%o6,	%g3
	movvs	%icc,	%o4,	%g6
	tgu	%xcc,	0x2
	tgu	%icc,	0x1
	sdiv	%i2,	0x148A,	%o7
	mulx	%i0,	0x1A53,	%i7
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x60] %asi,	%i1
	subc	%l4,	0x1019,	%i6
	edge16l	%l3,	%g2,	%o1
	fpadd32	%f2,	%f12,	%f2
	fornot1	%f12,	%f24,	%f30
	movrgz	%g7,	%l2,	%l0
	wr	%g0,	0x2b,	%asi
	stda	%o2,	[%l7 + 0x38] %asi
	membar	#Sync
	bn,a,pn	%xcc,	loop_1406
	stb	%o2,	[%l7 + 0x6C]
	set	0x3C, %l4
	lduha	[%l7 + %l4] 0x0c,	%g1
loop_1406:
	fmovrsne	%o0,	%f2,	%f27
	brgz,a	%g5,	loop_1407
	tge	%icc,	0x0
	fnot1	%f2,	%f20
	set	0x18, %g3
	swapa	[%l7 + %g3] 0x80,	%o5
loop_1407:
	nop
	set	0x68, %o0
	lduha	[%l7 + %o0] 0x81,	%l1
	movl	%icc,	%i5,	%g4
	sir	0x0B3A
	srl	%i4,	0x0B,	%l5
	sethi	0x16E3,	%l6
	fors	%f4,	%f24,	%f23
	movrgz	%o6,	0x3E4,	%g3
	fbo,a	%fcc2,	loop_1408
	tpos	%icc,	0x6
	lduh	[%l7 + 0x0C],	%o4
	srlx	%i3,	%i2,	%g6
loop_1408:
	st	%f19,	[%l7 + 0x54]
	or	%i0,	%i7,	%o7
	for	%f14,	%f8,	%f18
	or	%l4,	0x1DDA,	%i1
	tpos	%xcc,	0x5
	addc	%l3,	0x1EB1,	%g2
	fpackfix	%f12,	%f5
	xnor	%o1,	%i6,	%l2
	fpack32	%f6,	%f8,	%f12
	tg	%icc,	0x2
	movg	%xcc,	%g7,	%l0
	subc	%o3,	%g1,	%o0
	stbar
	movrne	%g5,	%o5,	%o2
	srax	%i5,	0x19,	%g4
	or	%i4,	%l1,	%l5
	fnot2	%f24,	%f6
	fsrc2	%f18,	%f28
	bcs,pt	%icc,	loop_1409
	movl	%xcc,	%o6,	%g3
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%o4
loop_1409:
	ldsb	[%l7 + 0x3C],	%l6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x34] %asi,	%i2
	addc	%g6,	0x0610,	%i0
	ldsb	[%l7 + 0x0A],	%i7
	movn	%xcc,	%i3,	%l4
	fmovsl	%icc,	%f18,	%f1
	xnorcc	%i1,	0x054A,	%l3
	set	0x10, %g5
	sta	%f15,	[%l7 + %g5] 0x88
	fand	%f4,	%f26,	%f16
	ta	%xcc,	0x5
	movvc	%xcc,	%g2,	%o7
	sdivx	%o1,	0x1644,	%i6
	ldsb	[%l7 + 0x54],	%g7
	fmovsl	%xcc,	%f12,	%f8
	udivx	%l2,	0x1FB1,	%l0
	srax	%g1,	%o0,	%g5
	ta	%xcc,	0x0
	bleu,a,pt	%icc,	loop_1410
	tneg	%icc,	0x3
	umul	%o5,	%o3,	%i5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%o2
loop_1410:
	fmovrsgez	%i4,	%f7,	%f3
	tg	%xcc,	0x7
	fmovdneg	%xcc,	%f1,	%f3
	fmovsge	%icc,	%f15,	%f13
	fbul,a	%fcc0,	loop_1411
	st	%f22,	[%l7 + 0x70]
	subc	%l1,	%l5,	%o6
	array32	%g4,	%g3,	%o4
loop_1411:
	sdivcc	%l6,	0x0F40,	%i2
	movrlez	%i0,	%i7,	%i3
	edge8l	%l4,	%g6,	%i1
	set	0x50, %g2
	lda	[%l7 + %g2] 0x18,	%f15
	movcs	%xcc,	%l3,	%o7
	fpsub16s	%f30,	%f31,	%f30
	nop
	set	0x28, %g6
	lduw	[%l7 + %g6],	%g2
	andcc	%o1,	%g7,	%i6
	fmul8x16al	%f10,	%f8,	%f0
	tcc	%icc,	0x0
	edge8l	%l0,	%g1,	%o0
	edge16	%l2,	%o5,	%g5
	movcs	%xcc,	%i5,	%o2
	fmovdne	%icc,	%f20,	%f24
	or	%o3,	%l1,	%i4
	sdiv	%o6,	0x19DB,	%l5
	bne,pn	%xcc,	loop_1412
	edge32n	%g4,	%o4,	%g3
	fnot2s	%f20,	%f19
	bvc,pn	%icc,	loop_1413
loop_1412:
	fmovdn	%xcc,	%f13,	%f12
	fmul8x16	%f4,	%f4,	%f12
	fbo,a	%fcc3,	loop_1414
loop_1413:
	movrgez	%i2,	%l6,	%i0
	ldx	[%l7 + 0x70],	%i3
	andcc	%i7,	0x0DC3,	%l4
loop_1414:
	array8	%i1,	%g6,	%l3
	fmovsleu	%icc,	%f28,	%f29
	orn	%o7,	0x0BFD,	%g2
	tg	%icc,	0x2
	tge	%icc,	0x4
	udiv	%g7,	0x03E1,	%o1
	bn	%xcc,	loop_1415
	brlez	%l0,	loop_1416
	fpsub16s	%f21,	%f0,	%f5
	andcc	%g1,	%i6,	%o0
loop_1415:
	fmovdge	%xcc,	%f24,	%f2
loop_1416:
	bl,a,pn	%icc,	loop_1417
	movrgez	%o5,	0x0C6,	%l2
	fmovdn	%xcc,	%f9,	%f12
	fmovrdne	%i5,	%f18,	%f26
loop_1417:
	fmovrsne	%o2,	%f26,	%f4
	tvc	%icc,	0x1
	bleu,a	loop_1418
	fpadd32	%f28,	%f28,	%f14
	tleu	%xcc,	0x6
	movl	%icc,	%g5,	%o3
loop_1418:
	tl	%icc,	0x2
	xorcc	%i4,	%o6,	%l1
	sdivx	%g4,	0x1939,	%o4
	fbu	%fcc2,	loop_1419
	fmul8sux16	%f6,	%f12,	%f16
	movrgez	%g3,	0x17C,	%l5
	fmovrse	%i2,	%f30,	%f5
loop_1419:
	fpsub16	%f20,	%f0,	%f6
	movgu	%icc,	%i0,	%i3
	bcc,a	loop_1420
	fmovsle	%icc,	%f2,	%f14
	fnot1	%f24,	%f24
	fornot2s	%f13,	%f0,	%f24
loop_1420:
	fbuge,a	%fcc3,	loop_1421
	movrlez	%i7,	0x15D,	%l6
	sll	%i1,	%l4,	%l3
	set	0x71, %i6
	ldstuba	[%l7 + %i6] 0x88,	%o7
loop_1421:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f22,	[%l7 + 0x28] %asi
	fmovrdne	%g2,	%f26,	%f14
	subccc	%g6,	%g7,	%l0
	fblg	%fcc0,	loop_1422
	be,pt	%xcc,	loop_1423
	tg	%icc,	0x5
	sll	%g1,	%o1,	%i6
loop_1422:
	fmovrsgz	%o5,	%f25,	%f30
loop_1423:
	tcs	%icc,	0x6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x4B] %asi,	%o0
	fmovrdgez	%i5,	%f18,	%f14
	array16	%l2,	%g5,	%o2
	edge16n	%o3,	%o6,	%l1
	subc	%i4,	%o4,	%g3
	brgez	%g4,	loop_1424
	fmul8x16	%f25,	%f14,	%f30
	wr	%g0,	0x80,	%asi
	stba	%i2,	[%l7 + 0x74] %asi
loop_1424:
	fpsub16	%f30,	%f28,	%f0
	smul	%i0,	0x0912,	%i3
	addc	%i7,	0x1FDF,	%l5
	fmovsvc	%icc,	%f15,	%f14
	bn	loop_1425
	fmovsneg	%icc,	%f6,	%f3
	udivcc	%l6,	0x1D9F,	%l4
	andncc	%l3,	%i1,	%g2
loop_1425:
	movrgez	%o7,	%g6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%l0,	%f8,	%f22
	tneg	%xcc,	0x2
	be,pn	%xcc,	loop_1426
	tle	%xcc,	0x0
	movre	%o1,	%i6,	%g1
	brlz,a	%o5,	loop_1427
loop_1426:
	fbule,a	%fcc3,	loop_1428
	stw	%i5,	[%l7 + 0x60]
	bg	%xcc,	loop_1429
loop_1427:
	tvc	%xcc,	0x5
loop_1428:
	ld	[%l7 + 0x70],	%f7
	fble	%fcc0,	loop_1430
loop_1429:
	subc	%o0,	0x114B,	%l2
	movgu	%icc,	%g5,	%o3
	wr	%g0,	0x11,	%asi
	sta	%f24,	[%l7 + 0x44] %asi
loop_1430:
	smul	%o2,	0x0EB5,	%o6
	fpack32	%f24,	%f24,	%f14
	fmul8x16al	%f6,	%f6,	%f14
	movle	%xcc,	%l1,	%i4
	orn	%o4,	0x0F82,	%g3
	movrgez	%i2,	0x33B,	%i0
	fpsub32	%f24,	%f22,	%f10
	ldsh	[%l7 + 0x54],	%g4
	tpos	%icc,	0x4
	fbule	%fcc3,	loop_1431
	nop
	setx	loop_1432,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc2s	%f26,	%f19
	fbge	%fcc0,	loop_1433
loop_1431:
	sdiv	%i3,	0x06DB,	%l5
loop_1432:
	smul	%l6,	%l4,	%l3
	nop
	setx	loop_1434,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1433:
	movge	%xcc,	%i1,	%i7
	fpadd32s	%f25,	%f20,	%f15
	stbar
loop_1434:
	nop
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x74] %asi,	%g2
	tsubcc	%o7,	%g6,	%l0
	std	%f20,	[%l7 + 0x40]
	andcc	%o1,	0x155E,	%g7
	subccc	%g1,	%i6,	%i5
	tcc	%xcc,	0x3
	andncc	%o0,	%l2,	%g5
	edge16	%o5,	%o2,	%o3
	subcc	%l1,	%o6,	%o4
	orcc	%i4,	0x1384,	%g3
	tvs	%xcc,	0x0
	edge8ln	%i0,	%i2,	%g4
	addc	%i3,	%l5,	%l4
	fnegd	%f28,	%f4
	add	%l3,	0x1562,	%l6
	movre	%i7,	0x18F,	%i1
	bl	%icc,	loop_1435
	fmovscs	%xcc,	%f21,	%f2
	fcmpeq32	%f30,	%f30,	%o7
	fbule	%fcc1,	loop_1436
loop_1435:
	fbule,a	%fcc2,	loop_1437
	movrlz	%g6,	0x267,	%g2
	bl,a	loop_1438
loop_1436:
	fmul8ulx16	%f14,	%f2,	%f0
loop_1437:
	fcmpeq16	%f14,	%f2,	%l0
	edge32	%g7,	%g1,	%o1
loop_1438:
	addccc	%i6,	%o0,	%l2
	fmovsa	%icc,	%f22,	%f18
	smulcc	%g5,	%i5,	%o5
	edge8n	%o3,	%o2,	%l1
	movcs	%icc,	%o4,	%o6
	subccc	%i4,	%i0,	%g3
	lduw	[%l7 + 0x64],	%g4
	smulcc	%i2,	0x1C09,	%i3
	movne	%xcc,	%l4,	%l3
	bvs,pt	%xcc,	loop_1439
	fornot1	%f10,	%f30,	%f8
	ldstub	[%l7 + 0x60],	%l5
	array32	%l6,	%i7,	%o7
loop_1439:
	fmovrde	%g6,	%f30,	%f24
	fbn	%fcc0,	loop_1440
	movleu	%xcc,	%i1,	%l0
	fmovsle	%xcc,	%f31,	%f2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x68] %asi,	%f29
loop_1440:
	ldsb	[%l7 + 0x2A],	%g7
	sdivx	%g2,	0x09FA,	%o1
	andn	%i6,	%g1,	%l2
	fandnot2	%f0,	%f10,	%f16
	edge16	%g5,	%i5,	%o0
	fmovscs	%xcc,	%f23,	%f19
	fsrc1	%f22,	%f30
	movrne	%o3,	%o5,	%o2
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x50] %asi,	%f23
	fbne,a	%fcc1,	loop_1441
	umul	%o4,	%l1,	%i4
	tne	%xcc,	0x7
	stx	%o6,	[%l7 + 0x18]
loop_1441:
	mulx	%g3,	%g4,	%i2
	fors	%f24,	%f15,	%f6
	bvc,a	loop_1442
	bne,a	%icc,	loop_1443
	fbug,a	%fcc3,	loop_1444
	movcs	%xcc,	%i0,	%l4
loop_1442:
	movne	%icc,	%i3,	%l5
loop_1443:
	ldd	[%l7 + 0x68],	%l2
loop_1444:
	fcmpes	%fcc0,	%f11,	%f6
	fmul8x16au	%f24,	%f20,	%f4
	fnand	%f24,	%f22,	%f22
	edge32l	%l6,	%i7,	%o7
	smul	%g6,	0x1B71,	%l0
	fbule	%fcc2,	loop_1445
	bcc,a,pn	%icc,	loop_1446
	fmul8sux16	%f26,	%f2,	%f0
	bge,pn	%icc,	loop_1447
loop_1445:
	fbuge,a	%fcc1,	loop_1448
loop_1446:
	mova	%xcc,	%g7,	%i1
	sra	%g2,	0x1E,	%o1
loop_1447:
	std	%f6,	[%l7 + 0x60]
loop_1448:
	movge	%xcc,	%g1,	%l2
	movcc	%xcc,	%g5,	%i6
	subccc	%o0,	0x0ACC,	%o3
	tg	%icc,	0x2
	fmul8x16al	%f28,	%f18,	%f6
	edge8ln	%i5,	%o5,	%o4
	fmovspos	%xcc,	%f4,	%f5
	lduw	[%l7 + 0x20],	%o2
	fnors	%f24,	%f11,	%f25
	edge8n	%l1,	%o6,	%g3
	edge8l	%i4,	%i2,	%i0
	membar	0x53
	fcmpgt32	%f14,	%f20,	%g4
	andcc	%i3,	0x07F0,	%l5
	movvs	%icc,	%l3,	%l4
	tgu	%icc,	0x5
	ldd	[%l7 + 0x70],	%f6
	fbuge,a	%fcc0,	loop_1449
	smulcc	%l6,	%i7,	%o7
	bvs,a	loop_1450
	fba,a	%fcc2,	loop_1451
loop_1449:
	fandnot1s	%f24,	%f26,	%f11
	nop
	setx loop_1452, %l0, %l1
	jmpl %l1, %l0
loop_1450:
	tcs	%icc,	0x0
loop_1451:
	alignaddr	%g7,	%g6,	%i1
	taddcc	%o1,	%g2,	%g1
loop_1452:
	ldub	[%l7 + 0x2E],	%l2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4C] %asi,	%g5
	smulcc	%i6,	0x0D19,	%o0
	nop
	set	0x08, %i4
	std	%o2,	[%l7 + %i4]
	flush	%l7 + 0x38
	subc	%o5,	%i5,	%o2
	tcs	%icc,	0x1
	and	%o4,	0x0137,	%o6
	fpadd32s	%f20,	%f4,	%f7
	fandnot2s	%f26,	%f23,	%f27
	tvs	%icc,	0x7
	tge	%icc,	0x5
	call	loop_1453
	nop
	setx	loop_1454,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdvs	%xcc,	%f17,	%f8
	membar	0x3F
loop_1453:
	alignaddr	%l1,	%i4,	%i2
loop_1454:
	fbule	%fcc0,	loop_1455
	bleu,a	%icc,	loop_1456
	movrgez	%g3,	%g4,	%i3
	tvc	%xcc,	0x4
loop_1455:
	subccc	%l5,	0x0282,	%i0
loop_1456:
	ldsb	[%l7 + 0x73],	%l4
	tvs	%icc,	0x6
	mulscc	%l6,	%i7,	%l3
	fornot1	%f22,	%f8,	%f18
	te	%icc,	0x2
	movre	%l0,	%o7,	%g7
	movre	%i1,	0x0AE,	%g6
	movle	%icc,	%o1,	%g1
	mulscc	%l2,	0x12FD,	%g2
	membar	0x02
	lduw	[%l7 + 0x54],	%g5
	edge8l	%i6,	%o3,	%o0
	mova	%icc,	%o5,	%i5
	fbu	%fcc3,	loop_1457
	sir	0x111B
	tle	%icc,	0x1
	nop
	setx	loop_1458,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1457:
	fmovsneg	%icc,	%f16,	%f26
	sdivx	%o4,	0x1905,	%o6
	bvc,pn	%icc,	loop_1459
loop_1458:
	array32	%l1,	%i4,	%i2
	movne	%xcc,	%o2,	%g3
	tsubcc	%g4,	%i3,	%l5
loop_1459:
	sdiv	%i0,	0x1CC5,	%l4
	bg	loop_1460
	fandnot2s	%f23,	%f29,	%f5
	st	%f11,	[%l7 + 0x54]
	tleu	%xcc,	0x2
loop_1460:
	edge32ln	%l6,	%l3,	%l0
	xor	%i7,	0x14DD,	%g7
	umulcc	%i1,	%o7,	%g6
	movrne	%o1,	0x0BD,	%l2
	tvc	%xcc,	0x1
	sll	%g2,	%g5,	%g1
	tcs	%icc,	0x0
	fnot2s	%f4,	%f26
	bvs,a	loop_1461
	smulcc	%o3,	0x0DC6,	%i6
	array32	%o0,	%i5,	%o5
	wr	%g0,	0x88,	%asi
	sta	%f29,	[%l7 + 0x08] %asi
loop_1461:
	move	%xcc,	%o6,	%l1
	bne,a	loop_1462
	movge	%icc,	%o4,	%i2
	tvc	%xcc,	0x2
	fmovdleu	%xcc,	%f31,	%f2
loop_1462:
	movl	%xcc,	%i4,	%o2
	edge32	%g4,	%g3,	%i3
	tvc	%xcc,	0x2
	mova	%icc,	%l5,	%i0
	array16	%l6,	%l4,	%l0
	array16	%i7,	%l3,	%i1
	tl	%icc,	0x1
	fmovdcs	%icc,	%f12,	%f1
	bg,a,pt	%xcc,	loop_1463
	fnot1s	%f12,	%f6
	alignaddr	%o7,	%g6,	%o1
	srl	%l2,	%g2,	%g7
loop_1463:
	movpos	%icc,	%g1,	%g5
	popc	0x00E8,	%o3
	and	%i6,	0x0038,	%o0
	tvc	%xcc,	0x6
	edge8ln	%o5,	%i5,	%o6
	sub	%l1,	%i2,	%o4
	smulcc	%o2,	0x022F,	%i4
	tcs	%xcc,	0x6
	nop
	setx	loop_1464,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%g3,	%i3
	brlez	%l5,	loop_1465
	fcmpeq16	%f14,	%f16,	%g4
loop_1464:
	movrgz	%l6,	0x0A4,	%l4
	nop
	setx loop_1466, %l0, %l1
	jmpl %l1, %l0
loop_1465:
	fmovsge	%xcc,	%f14,	%f8
	edge16	%i7,	%i0,	%l3
	umul	%o7,	%i1,	%o1
loop_1466:
	prefetch	[%l7 + 0x14],	 0x3
	fbu	%fcc2,	loop_1467
	fands	%f0,	%f8,	%f7
	wr	%g0,	0x89,	%asi
	stxa	%l2,	[%l7 + 0x60] %asi
loop_1467:
	bcc	loop_1468
	tgu	%xcc,	0x5
	movgu	%xcc,	%g6,	%g2
	set	0x76, %i2
	stha	%g1,	[%l7 + %i2] 0x18
loop_1468:
	smulcc	%g7,	0x0DFD,	%o3
	fbn,a	%fcc2,	loop_1469
	fmovdle	%xcc,	%f16,	%f12
	tpos	%xcc,	0x5
	movrne	%i6,	0x107,	%o0
loop_1469:
	bleu,a	loop_1470
	edge16	%o5,	%g5,	%i5
	fmovrdlez	%l1,	%f4,	%f12
	taddcctv	%i2,	%o4,	%o2
loop_1470:
	addccc	%o6,	%g3,	%i4
	andn	%l5,	%g4,	%i3
	taddcc	%l6,	%l0,	%l4
	movrlez	%i7,	0x00B,	%l3
	fandnot1	%f24,	%f28,	%f28
	fnors	%f26,	%f8,	%f23
	srax	%i0,	0x19,	%o7
	fmovs	%f7,	%f22
	udivcc	%i1,	0x0EAD,	%l2
	bcc	%xcc,	loop_1471
	brz	%o1,	loop_1472
	edge8n	%g6,	%g1,	%g7
	andncc	%g2,	%i6,	%o0
loop_1471:
	fbul,a	%fcc2,	loop_1473
loop_1472:
	andcc	%o5,	0x06E8,	%o3
	bgu,pt	%xcc,	loop_1474
	bne,a	%icc,	loop_1475
loop_1473:
	tleu	%icc,	0x6
	srl	%i5,	%g5,	%l1
loop_1474:
	umulcc	%i2,	0x1B10,	%o4
loop_1475:
	ba	loop_1476
	std	%o6,	[%l7 + 0x20]
	array16	%g3,	%i4,	%l5
	fcmpeq32	%f6,	%f30,	%g4
loop_1476:
	fmovspos	%xcc,	%f23,	%f15
	xnorcc	%i3,	0x14D6,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f6,	%f17,	%f10
	sdivcc	%o2,	0x1733,	%l4
	tsubcctv	%i7,	0x0DC9,	%l3
	sdiv	%i0,	0x1A57,	%o7
	ldsh	[%l7 + 0x34],	%l0
	fmovrdgez	%i1,	%f20,	%f20
	fmovde	%xcc,	%f31,	%f2
	fmovde	%icc,	%f16,	%f28
	fmovsn	%icc,	%f14,	%f21
	edge32n	%l2,	%o1,	%g1
	te	%xcc,	0x2
	fzero	%f12
	sub	%g7,	%g2,	%i6
	fbge,a	%fcc0,	loop_1477
	tg	%xcc,	0x0
	taddcctv	%g6,	%o5,	%o0
	nop
	setx	loop_1478,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1477:
	mulx	%o3,	%g5,	%i5
	fmovsgu	%xcc,	%f27,	%f8
	srlx	%l1,	%o4,	%o6
loop_1478:
	bvs,a,pn	%icc,	loop_1479
	orcc	%g3,	0x1AF7,	%i2
	movn	%xcc,	%l5,	%i4
	andn	%i3,	0x15A2,	%g4
loop_1479:
	tge	%xcc,	0x7
	alignaddr	%l6,	%l4,	%i7
	srl	%l3,	%i0,	%o2
	fmul8x16	%f10,	%f8,	%f0
	udivcc	%o7,	0x0E4A,	%i1
	set	0x7C, %g4
	ldswa	[%l7 + %g4] 0x04,	%l2
	umul	%l0,	0x16D4,	%g1
	fpadd32	%f12,	%f8,	%f28
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x80,	%f0
	array32	%g7,	%g2,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o1,	%g6
	fsrc2	%f16,	%f26
	fmovsge	%xcc,	%f28,	%f9
	mulx	%o0,	%o5,	%g5
	fbul	%fcc3,	loop_1480
	movrgz	%o3,	0x1CE,	%l1
	sdivx	%o4,	0x08D8,	%i5
	fmovdle	%xcc,	%f7,	%f15
loop_1480:
	bcc,pt	%icc,	loop_1481
	fba	%fcc2,	loop_1482
	tcs	%icc,	0x7
	srl	%g3,	0x16,	%i2
loop_1481:
	fbn	%fcc0,	loop_1483
loop_1482:
	fandnot1	%f20,	%f20,	%f4
	edge8	%o6,	%i4,	%i3
	edge16	%l5,	%g4,	%l6
loop_1483:
	fmovrde	%l4,	%f28,	%f26
	mulx	%l3,	0x0D59,	%i0
	fbn	%fcc3,	loop_1484
	ldub	[%l7 + 0x0B],	%i7
	movrgz	%o2,	0x156,	%o7
	wr	%g0,	0x89,	%asi
	stha	%l2,	[%l7 + 0x6E] %asi
loop_1484:
	bgu,a	%icc,	loop_1485
	tn	%xcc,	0x2
	fpmerge	%f7,	%f31,	%f12
	fbuge,a	%fcc0,	loop_1486
loop_1485:
	sdivx	%l0,	0x17CD,	%i1
	sub	%g7,	%g1,	%i6
	fxors	%f27,	%f11,	%f23
loop_1486:
	brnz	%g2,	loop_1487
	fmovdge	%icc,	%f31,	%f20
	movne	%xcc,	%g6,	%o1
	movle	%icc,	%o0,	%g5
loop_1487:
	fors	%f12,	%f19,	%f17
	bvc	%icc,	loop_1488
	fmovdneg	%xcc,	%f2,	%f13
	fnor	%f10,	%f26,	%f28
	tleu	%xcc,	0x1
loop_1488:
	movcs	%icc,	%o5,	%o3
	fbo	%fcc3,	loop_1489
	tneg	%icc,	0x4
	stb	%l1,	[%l7 + 0x0A]
	for	%f22,	%f22,	%f12
loop_1489:
	movrlz	%i5,	0x237,	%o4
	alignaddr	%i2,	%o6,	%g3
	fbue	%fcc2,	loop_1490
	fba,a	%fcc2,	loop_1491
	stb	%i4,	[%l7 + 0x66]
	subccc	%i3,	0x0FBB,	%g4
loop_1490:
	addcc	%l5,	0x16FA,	%l4
loop_1491:
	alignaddr	%l6,	%i0,	%l3
	edge32n	%o2,	%i7,	%o7
	ldub	[%l7 + 0x75],	%l2
	movle	%icc,	%l0,	%i1
	tsubcc	%g1,	0x0C3E,	%g7
	fble	%fcc1,	loop_1492
	tge	%icc,	0x4
	edge32n	%i6,	%g6,	%o1
	addcc	%o0,	0x08C1,	%g2
loop_1492:
	fmovrdgez	%o5,	%f26,	%f14
	brgez	%g5,	loop_1493
	sir	0x00CF
	and	%l1,	0x10ED,	%i5
	bcs,a,pn	%icc,	loop_1494
loop_1493:
	membar	0x0B
	fmovrsgez	%o4,	%f5,	%f24
	srlx	%i2,	0x00,	%o6
loop_1494:
	movre	%o3,	%g3,	%i4
	subccc	%i3,	0x19DF,	%g4
	fpadd16s	%f13,	%f23,	%f2
	orn	%l4,	0x0C55,	%l6
	tgu	%xcc,	0x3
	andn	%i0,	%l5,	%l3
	fmovde	%xcc,	%f7,	%f20
	membar	0x52
	edge8l	%i7,	%o2,	%o7
	ldub	[%l7 + 0x36],	%l2
	array8	%i1,	%g1,	%g7
	array16	%i6,	%l0,	%g6
	tle	%xcc,	0x0
	movneg	%xcc,	%o1,	%g2
	fmovdle	%xcc,	%f20,	%f5
	movpos	%icc,	%o0,	%o5
	stw	%g5,	[%l7 + 0x74]
	bge,a,pt	%icc,	loop_1495
	fmovrdgz	%l1,	%f6,	%f20
	udivx	%i5,	0x1BCC,	%o4
	fandnot1s	%f15,	%f16,	%f14
loop_1495:
	fmovsvs	%icc,	%f12,	%f4
	movle	%icc,	%o6,	%i2
	subccc	%o3,	0x04CB,	%g3
	fnor	%f20,	%f0,	%f30
	array16	%i4,	%g4,	%i3
	sdiv	%l4,	0x19A4,	%i0
	movn	%icc,	%l5,	%l3
	smulcc	%l6,	0x12AC,	%o2
	udivcc	%o7,	0x1608,	%i7
	fexpand	%f14,	%f22
	movpos	%xcc,	%i1,	%l2
	movre	%g1,	%g7,	%l0
	andn	%i6,	0x1CB0,	%g6
	bvs,pn	%icc,	loop_1496
	fmovdl	%xcc,	%f14,	%f9
	tleu	%icc,	0x2
	xnor	%g2,	0x052B,	%o0
loop_1496:
	movn	%icc,	%o5,	%g5
	fmovsneg	%xcc,	%f31,	%f6
	add	%o1,	0x08D7,	%l1
	xnor	%i5,	0x0ECE,	%o4
	edge8n	%o6,	%o3,	%i2
	fbl	%fcc3,	loop_1497
	xor	%g3,	%i4,	%g4
	tne	%icc,	0x5
	xor	%i3,	%i0,	%l5
loop_1497:
	fpadd32s	%f30,	%f30,	%f18
	movcc	%icc,	%l4,	%l3
	ldx	[%l7 + 0x20],	%l6
	addcc	%o2,	0x0317,	%i7
	lduh	[%l7 + 0x46],	%o7
	ldstub	[%l7 + 0x28],	%l2
	tl	%xcc,	0x6
	set	0x70, %i3
	swapa	[%l7 + %i3] 0x18,	%g1
	tge	%icc,	0x0
	tvs	%xcc,	0x6
	fandnot2	%f24,	%f30,	%f6
	addc	%g7,	%i1,	%i6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g6
	call	loop_1498
	tg	%xcc,	0x2
	prefetch	[%l7 + 0x48],	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1498:
	udiv	%g2,	0x0F0A,	%o0
	fmul8x16	%f29,	%f2,	%f14
	andcc	%o5,	0x1B84,	%l0
	ldsh	[%l7 + 0x1E],	%o1
	bl,a,pt	%xcc,	loop_1499
	xor	%g5,	%i5,	%o4
	edge8	%o6,	%l1,	%i2
	xnorcc	%g3,	%i4,	%o3
loop_1499:
	edge16ln	%g4,	%i3,	%l5
	edge16l	%l4,	%l3,	%i0
	edge32n	%l6,	%o2,	%o7
	fmovsneg	%xcc,	%f31,	%f16
	bpos,pt	%icc,	loop_1500
	fbu,a	%fcc3,	loop_1501
	fbge,a	%fcc0,	loop_1502
	ldstub	[%l7 + 0x34],	%i7
loop_1500:
	movrgez	%g1,	%l2,	%i1
loop_1501:
	subccc	%i6,	0x1C8E,	%g7
loop_1502:
	move	%icc,	%g2,	%o0
	sub	%g6,	0x1024,	%l0
	fnegs	%f8,	%f24
	sdiv	%o5,	0x07CB,	%g5
	alignaddrl	%o1,	%o4,	%o6
	tpos	%icc,	0x0
	sdivx	%i5,	0x0E1D,	%l1
	ldub	[%l7 + 0x42],	%i2
	fcmps	%fcc1,	%f28,	%f22
	mulscc	%g3,	%o3,	%i4
	fba	%fcc3,	loop_1503
	sir	0x1232
	fmovsl	%xcc,	%f6,	%f19
	srlx	%i3,	0x08,	%g4
loop_1503:
	nop
	set	0x6E, %o1
	stha	%l5,	[%l7 + %o1] 0x0c
	bshuffle	%f4,	%f26,	%f0
	sra	%l4,	0x15,	%l3
	fmul8x16	%f24,	%f20,	%f30
	array16	%i0,	%l6,	%o2
	movgu	%xcc,	%o7,	%i7
	st	%f19,	[%l7 + 0x08]
	addcc	%g1,	%i1,	%i6
	edge32l	%g7,	%g2,	%o0
	bg	loop_1504
	fba,a	%fcc1,	loop_1505
	fnands	%f19,	%f24,	%f19
	fmovrdgez	%l2,	%f6,	%f16
loop_1504:
	sllx	%l0,	0x0F,	%g6
loop_1505:
	fbug,a	%fcc1,	loop_1506
	edge32n	%o5,	%g5,	%o1
	addc	%o6,	%i5,	%o4
	fmul8x16	%f25,	%f20,	%f22
loop_1506:
	tl	%icc,	0x5
	tcc	%icc,	0x6
	fpsub32	%f12,	%f4,	%f2
	be,a	%xcc,	loop_1507
	subccc	%l1,	0x1DC9,	%g3
	mulscc	%o3,	%i4,	%i3
	bvc,a,pn	%xcc,	loop_1508
loop_1507:
	te	%xcc,	0x1
	alignaddrl	%g4,	%i2,	%l5
	fmovdl	%xcc,	%f29,	%f7
loop_1508:
	movneg	%icc,	%l4,	%l3
	brgz,a	%l6,	loop_1509
	fmul8sux16	%f12,	%f6,	%f18
	fcmple32	%f14,	%f28,	%o2
	udivx	%i0,	0x04C7,	%i7
loop_1509:
	fbule	%fcc2,	loop_1510
	be,pt	%xcc,	loop_1511
	edge16ln	%g1,	%i1,	%o7
	fmovdne	%xcc,	%f12,	%f26
loop_1510:
	sth	%i6,	[%l7 + 0x2E]
loop_1511:
	bvc,a,pn	%xcc,	loop_1512
	movpos	%icc,	%g2,	%g7
	stbar
	for	%f14,	%f4,	%f24
loop_1512:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l2,	%l0,	%g6
	popc	%o0,	%g5
	movle	%xcc,	%o1,	%o6
	tleu	%xcc,	0x6
	edge32	%i5,	%o5,	%o4
	bne	%icc,	loop_1513
	movgu	%icc,	%g3,	%o3
	move	%icc,	%l1,	%i4
	fabss	%f9,	%f28
loop_1513:
	movrlz	%g4,	0x3B6,	%i2
	bg,a	%icc,	loop_1514
	smul	%i3,	0x0474,	%l4
	fcmpne16	%f14,	%f22,	%l3
	movn	%icc,	%l5,	%o2
loop_1514:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x78] %asi,	%f1
	bvc,a	loop_1515
	mova	%icc,	%l6,	%i7
	movvs	%icc,	%g1,	%i0
	ldx	[%l7 + 0x30],	%o7
loop_1515:
	fandnot2	%f10,	%f28,	%f14
	umulcc	%i1,	0x0DEB,	%i6
	movl	%xcc,	%g2,	%l2
	edge32l	%l0,	%g6,	%g7
	bcs	loop_1516
	movg	%xcc,	%g5,	%o1
	set	0x77, %l3
	ldstuba	[%l7 + %l3] 0x04,	%o0
loop_1516:
	fandnot2	%f10,	%f18,	%f20
	array16	%o6,	%i5,	%o4
	subcc	%g3,	%o3,	%o5
	fmovdne	%icc,	%f29,	%f1
	fcmpd	%fcc0,	%f20,	%f24
	fmovsgu	%xcc,	%f20,	%f2
	tcc	%xcc,	0x2
	addccc	%l1,	%g4,	%i2
	srax	%i4,	0x10,	%i3
	umul	%l4,	0x1DFF,	%l5
	tneg	%xcc,	0x3
	wr	%g0,	0xe3,	%asi
	stba	%o2,	[%l7 + 0x68] %asi
	membar	#Sync
	tvc	%xcc,	0x1
	fmovdgu	%icc,	%f31,	%f23
	sethi	0x055A,	%l3
	umul	%i7,	0x1229,	%g1
	edge8n	%l6,	%o7,	%i0
	edge32ln	%i6,	%g2,	%l2
	mulx	%l0,	%g6,	%i1
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x10] %asi,	%g7
	tpos	%xcc,	0x4
	nop
	set	0x78, %l6
	std	%o0,	[%l7 + %l6]
	move	%icc,	%o0,	%o6
	smulcc	%g5,	%o4,	%i5
	umulcc	%o3,	0x06FB,	%g3
	xor	%o5,	%g4,	%i2
	andncc	%l1,	%i3,	%i4
	srlx	%l4,	%l5,	%o2
	movvs	%xcc,	%i7,	%l3
	fandnot2	%f12,	%f26,	%f14
	movrgz	%g1,	%l6,	%o7
	lduh	[%l7 + 0x3E],	%i6
	ldub	[%l7 + 0x7B],	%g2
	mova	%icc,	%l2,	%i0
	add	%l7,	0x64,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x80,	%l0,	%i1
	tge	%xcc,	0x1
	fone	%f2
	fnot1s	%f12,	%f10
	fmovdl	%xcc,	%f24,	%f2
	movg	%xcc,	%g6,	%o1
	xorcc	%o0,	%g7,	%g5
	te	%icc,	0x5
	movg	%icc,	%o6,	%o4
	brlez	%i5,	loop_1517
	movre	%g3,	%o3,	%g4
	fbug,a	%fcc0,	loop_1518
	fmovdvs	%icc,	%f14,	%f8
loop_1517:
	ldsb	[%l7 + 0x5A],	%i2
	set	0x38, %l2
	stda	%l0,	[%l7 + %l2] 0x81
loop_1518:
	add	%o5,	%i3,	%l4
	tge	%icc,	0x4
	fbuge,a	%fcc2,	loop_1519
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l5,	%o2,	%i4
	std	%l2,	[%l7 + 0x50]
loop_1519:
	fmovdl	%xcc,	%f22,	%f1
	brgz,a	%g1,	loop_1520
	ldx	[%l7 + 0x58],	%i7
	sra	%l6,	%i6,	%g2
	umulcc	%l2,	%o7,	%l0
loop_1520:
	fpsub16s	%f14,	%f20,	%f28
	fnand	%f16,	%f16,	%f20
	add	%l7,	0x14,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%g6
	sra	%i1,	%o0,	%g7
	ld	[%l7 + 0x38],	%f1
	fbge,a	%fcc0,	loop_1521
	sdivcc	%g5,	0x1545,	%o6
	movn	%xcc,	%o1,	%i5
	popc	0x1BBA,	%g3
loop_1521:
	te	%xcc,	0x7
	fbne	%fcc3,	loop_1522
	movpos	%icc,	%o3,	%g4
	bneg,pt	%xcc,	loop_1523
	edge8	%o4,	%i2,	%l1
loop_1522:
	and	%i3,	0x14DF,	%o5
	bleu	%xcc,	loop_1524
loop_1523:
	tvc	%icc,	0x2
	tsubcctv	%l5,	0x12A6,	%o2
	edge32n	%i4,	%l4,	%l3
loop_1524:
	tne	%xcc,	0x4
	tg	%icc,	0x2
	movgu	%icc,	%g1,	%l6
	fmovscs	%icc,	%f17,	%f12
	addc	%i7,	0x1383,	%i6
	sllx	%g2,	%l2,	%o7
	edge16n	%i0,	%l0,	%i1
	fbge,a	%fcc2,	loop_1525
	orncc	%g6,	%g7,	%o0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x88,	%o6,	%o1
loop_1525:
	fzeros	%f6
	bvs	%icc,	loop_1526
	sll	%g5,	0x16,	%g3
	sdivx	%o3,	0x0D06,	%i5
	fpmerge	%f1,	%f23,	%f8
loop_1526:
	brlez,a	%g4,	loop_1527
	ldd	[%l7 + 0x50],	%f0
	udivx	%i2,	0x13C0,	%l1
	bn,pn	%xcc,	loop_1528
loop_1527:
	fmovdl	%xcc,	%f18,	%f22
	mulx	%o4,	%i3,	%l5
	stbar
loop_1528:
	st	%f2,	[%l7 + 0x30]
	movrgez	%o2,	0x2DA,	%i4
	fmovs	%f18,	%f26
	movl	%xcc,	%o5,	%l4
	tl	%xcc,	0x3
	ldsw	[%l7 + 0x14],	%l3
	fbge,a	%fcc0,	loop_1529
	fbge,a	%fcc1,	loop_1530
	tle	%icc,	0x4
	sir	0x1677
loop_1529:
	bpos,a	loop_1531
loop_1530:
	stb	%l6,	[%l7 + 0x19]
	array8	%i7,	%i6,	%g1
	fxnor	%f8,	%f18,	%f4
loop_1531:
	fsrc1	%f14,	%f16
	movne	%xcc,	%l2,	%o7
	nop
	setx loop_1532, %l0, %l1
	jmpl %l1, %g2
	fxor	%f8,	%f24,	%f12
	andn	%l0,	0x0A45,	%i1
	movrgez	%i0,	0x12A,	%g6
loop_1532:
	edge16	%o0,	%g7,	%o6
	udivx	%g5,	0x0798,	%o1
	movrlez	%g3,	%i5,	%o3
	movcc	%xcc,	%i2,	%l1
	movl	%icc,	%g4,	%o4
	tne	%xcc,	0x0
	sethi	0x10E7,	%l5
	alignaddrl	%i3,	%i4,	%o2
	brlez,a	%l4,	loop_1533
	movrlez	%l3,	0x171,	%o5
	tpos	%icc,	0x1
	sdiv	%l6,	0x1DE9,	%i6
loop_1533:
	array8	%i7,	%g1,	%o7
	fxnors	%f30,	%f16,	%f10
	movvs	%xcc,	%l2,	%g2
	nop
	setx	loop_1534,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcc	%xcc,	%i1,	%l0
	movcc	%icc,	%g6,	%o0
	fmovsleu	%xcc,	%f17,	%f8
loop_1534:
	fpack16	%f14,	%f12
	set	0x58, %o7
	ldswa	[%l7 + %o7] 0x04,	%g7
	tvc	%xcc,	0x7
	edge32ln	%i0,	%o6,	%g5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x72] %asi,	%g3
	movcs	%icc,	%i5,	%o1
	edge32n	%i2,	%o3,	%l1
	bcs,pt	%icc,	loop_1535
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
	alignaddrl	%g4,	%o4,	%l5
	set	0x6F, %o6
	ldsba	[%l7 + %o6] 0x89,	%i4
loop_1535:
	andncc	%i3,	%l4,	%l3
loop_1536:
	nop
	set	0x0C, %o4
	lda	[%l7 + %o4] 0x81,	%f6
	fmovrsgez	%o5,	%f9,	%f1
	udivcc	%l6,	0x0792,	%o2
	umul	%i6,	0x0F34,	%i7
	tsubcc	%g1,	0x164F,	%o7
	orncc	%g2,	0x1512,	%i1
	movneg	%xcc,	%l2,	%l0
	fexpand	%f26,	%f8
	sdivx	%o0,	0x0191,	%g7
	bneg	loop_1537
	membar	0x6A
	movcs	%icc,	%i0,	%o6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x0c,	%g6,	%g5
loop_1537:
	array16	%g3,	%i5,	%i2
	taddcc	%o3,	%o1,	%g4
	edge32ln	%l1,	%l5,	%o4
	movpos	%xcc,	%i4,	%l4
	tn	%icc,	0x6
	fcmpeq32	%f24,	%f18,	%l3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	sra	%l6,	%i3,	%o2
	fbl	%fcc2,	loop_1538
	movg	%icc,	%i7,	%i6
	tsubcctv	%o7,	0x082F,	%g2
	be,pn	%icc,	loop_1539
loop_1538:
	edge8l	%g1,	%i1,	%l0
	array16	%l2,	%g7,	%o0
	srax	%o6,	0x0D,	%g6
loop_1539:
	movre	%g5,	0x33B,	%i0
	movrgz	%g3,	%i2,	%o3
	sdiv	%i5,	0x1DC1,	%o1
	sdivx	%g4,	0x1479,	%l5
	ldd	[%l7 + 0x78],	%f8
	fpsub32	%f22,	%f10,	%f4
	bneg,a	%icc,	loop_1540
	movcs	%icc,	%o4,	%l1
	swap	[%l7 + 0x48],	%l4
	fmul8x16	%f12,	%f8,	%f16
loop_1540:
	tvc	%xcc,	0x6
	ta	%icc,	0x0
	brz,a	%l3,	loop_1541
	array8	%o5,	%i4,	%l6
	tl	%icc,	0x3
	bgu,pt	%xcc,	loop_1542
loop_1541:
	fcmpd	%fcc3,	%f30,	%f18
	edge16	%o2,	%i3,	%i7
	ldsw	[%l7 + 0x14],	%o7
loop_1542:
	subc	%g2,	%i6,	%i1
	brlez	%g1,	loop_1543
	brgz,a	%l0,	loop_1544
	ldx	[%l7 + 0x20],	%l2
	fnegs	%f16,	%f30
loop_1543:
	edge8ln	%o0,	%o6,	%g7
loop_1544:
	sll	%g5,	0x0E,	%g6
	movrne	%i0,	0x021,	%g3
	be,pn	%icc,	loop_1545
	taddcctv	%o3,	%i2,	%i5
	popc	%g4,	%l5
	edge32l	%o4,	%o1,	%l1
loop_1545:
	edge16n	%l4,	%l3,	%o5
	edge32ln	%l6,	%o2,	%i3
	andncc	%i4,	%o7,	%i7
	fmul8x16al	%f13,	%f20,	%f0
	movgu	%xcc,	%i6,	%g2
	movrlez	%g1,	%i1,	%l2
	tneg	%xcc,	0x4
	movrgez	%l0,	%o0,	%o6
	st	%f20,	[%l7 + 0x2C]
	movrlez	%g5,	%g7,	%i0
	addccc	%g3,	0x1B5F,	%o3
	sth	%g6,	[%l7 + 0x16]
	movleu	%xcc,	%i2,	%g4
	movneg	%icc,	%i5,	%o4
	bleu,a,pn	%xcc,	loop_1546
	srlx	%o1,	%l1,	%l5
	addcc	%l3,	%o5,	%l6
	movvs	%xcc,	%l4,	%i3
loop_1546:
	nop
	set	0x40, %o5
	ldsba	[%l7 + %o5] 0x15,	%i4
	fsrc1s	%f17,	%f13
	array32	%o7,	%i7,	%o2
	udivx	%g2,	0x08F7,	%g1
	movg	%icc,	%i6,	%i1
	ldstub	[%l7 + 0x7B],	%l0
	fand	%f18,	%f4,	%f14
	tge	%icc,	0x4
	edge32l	%l2,	%o6,	%o0
	brz	%g5,	loop_1547
	udivcc	%i0,	0x0794,	%g3
	ldsb	[%l7 + 0x13],	%o3
	orncc	%g7,	%i2,	%g4
loop_1547:
	swap	[%l7 + 0x38],	%i5
	fbule,a	%fcc2,	loop_1548
	bleu,a,pn	%xcc,	loop_1549
	te	%icc,	0x0
	fcmpd	%fcc2,	%f14,	%f4
loop_1548:
	fxnors	%f23,	%f3,	%f25
loop_1549:
	srlx	%o4,	%g6,	%l1
	fmovdcc	%icc,	%f27,	%f22
	sdiv	%o1,	0x1EED,	%l5
	tgu	%icc,	0x0
	fmovrdne	%o5,	%f10,	%f22
	fba	%fcc3,	loop_1550
	fxnor	%f10,	%f30,	%f0
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x79] %asi,	%l6
loop_1550:
	bne,a	loop_1551
	tsubcctv	%l3,	0x0E0F,	%l4
	subc	%i4,	0x0C80,	%o7
	edge16l	%i3,	%i7,	%o2
loop_1551:
	nop
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x89,	%g2,	%g1
	fmovde	%xcc,	%f13,	%f19
	movn	%icc,	%i6,	%l0
	edge8	%l2,	%o6,	%i1
	tgu	%icc,	0x3
	smul	%o0,	0x0AC9,	%i0
	sra	%g5,	0x1B,	%g3
	fpsub32s	%f15,	%f9,	%f12
	array32	%g7,	%o3,	%i2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x70] %asi,	%i4
	movg	%icc,	%g4,	%o4
	bshuffle	%f24,	%f0,	%f4
	movrgz	%l1,	0x36A,	%g6
	edge32	%o1,	%l5,	%o5
	tpos	%icc,	0x1
	tcc	%icc,	0x3
	set	0x10, %l1
	sta	%f21,	[%l7 + %l1] 0x10
	fpsub32s	%f19,	%f11,	%f0
	taddcc	%l6,	0x1CAB,	%l3
	or	%i4,	%o7,	%i3
	sdivx	%l4,	0x1F18,	%i7
	andncc	%g2,	%o2,	%g1
	umulcc	%l0,	0x10F6,	%i6
	smul	%l2,	0x1884,	%o6
	fcmpgt32	%f8,	%f30,	%o0
	prefetch	[%l7 + 0x58],	 0x1
	fmuld8sux16	%f17,	%f20,	%f0
	orcc	%i0,	0x1DAA,	%g5
	fmovsleu	%icc,	%f4,	%f16
	movle	%icc,	%g3,	%i1
	bl	%icc,	loop_1552
	st	%f28,	[%l7 + 0x64]
	edge32	%g7,	%i2,	%i5
	movl	%icc,	%o3,	%g4
loop_1552:
	andn	%o4,	0x018A,	%l1
	fnand	%f24,	%f22,	%f24
	edge16ln	%g6,	%o1,	%l5
	movn	%icc,	%l6,	%l3
	udivx	%i4,	0x019A,	%o7
	and	%o5,	%l4,	%i7
	add	%g2,	%i3,	%o2
	fbge	%fcc3,	loop_1553
	fbge	%fcc3,	loop_1554
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g1,	0x0B27,	%l0
loop_1553:
	andcc	%l2,	%o6,	%o0
loop_1554:
	fmovrse	%i6,	%f2,	%f11
	udivcc	%g5,	0x0A77,	%g3
	fmovdne	%icc,	%f20,	%f29
	or	%i1,	0x1CE0,	%g7
	sir	0x0198
	movcc	%icc,	%i2,	%i0
	movvc	%icc,	%i5,	%o3
	ldsb	[%l7 + 0x0F],	%g4
	fmovdge	%icc,	%f10,	%f21
	xnor	%l1,	0x0B1D,	%o4
	umul	%o1,	0x196F,	%l5
	movrlez	%l6,	0x2C9,	%g6
	edge32n	%i4,	%o7,	%o5
	sllx	%l4,	%i7,	%l3
	edge8ln	%i3,	%o2,	%g2
	sllx	%l0,	%g1,	%o6
	edge8ln	%l2,	%i6,	%g5
	bn,a,pn	%xcc,	loop_1555
	fmuld8ulx16	%f26,	%f26,	%f30
	srax	%o0,	0x17,	%i1
	array32	%g7,	%i2,	%g3
loop_1555:
	fsrc2s	%f11,	%f11
	fnot1	%f8,	%f18
	brlez	%i0,	loop_1556
	fmovrse	%i5,	%f18,	%f2
	movle	%icc,	%o3,	%g4
	tn	%icc,	0x0
loop_1556:
	fandnot1	%f20,	%f22,	%f6
	fblg,a	%fcc3,	loop_1557
	fmovsvc	%xcc,	%f7,	%f14
	edge8ln	%l1,	%o4,	%l5
	fcmpes	%fcc1,	%f8,	%f24
loop_1557:
	edge16ln	%l6,	%o1,	%g6
	movleu	%icc,	%i4,	%o5
	xnor	%l4,	%o7,	%l3
	fbg	%fcc3,	loop_1558
	te	%xcc,	0x3
	fbuge	%fcc1,	loop_1559
	mova	%xcc,	%i3,	%i7
loop_1558:
	tcc	%xcc,	0x2
	membar	0x53
loop_1559:
	sll	%o2,	0x1E,	%l0
	srl	%g1,	0x0C,	%o6
	edge8	%g2,	%i6,	%l2
	xnor	%o0,	%i1,	%g7
	movrne	%i2,	0x2A4,	%g5
	addcc	%g3,	0x12EB,	%i0
	subccc	%o3,	0x0E8E,	%i5
	orncc	%l1,	0x1609,	%g4
	fbug,a	%fcc2,	loop_1560
	mulx	%o4,	0x0961,	%l5
	ldd	[%l7 + 0x48],	%f10
	fmovsgu	%icc,	%f30,	%f9
loop_1560:
	move	%icc,	%o1,	%l6
	bcs,a	loop_1561
	fble,a	%fcc3,	loop_1562
	tg	%icc,	0x5
	edge8n	%i4,	%g6,	%o5
loop_1561:
	movvs	%xcc,	%l4,	%o7
loop_1562:
	sth	%l3,	[%l7 + 0x08]
	mulscc	%i3,	%o2,	%i7
	subccc	%g1,	%l0,	%o6
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
	fmovrdlz	%i6,	%f16,	%f8
	fbul	%fcc2,	loop_1564
	movpos	%icc,	%g2,	%o0
loop_1563:
	movneg	%xcc,	%l2,	%g7
	set	0x3C, %g1
	ldswa	[%l7 + %g1] 0x0c,	%i1
loop_1564:
	udivx	%i2,	0x1982,	%g3
	fmovdcs	%xcc,	%f9,	%f30
	mulscc	%g5,	%i0,	%i5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0xf0
	membar	#Sync
	andn	%o3,	0x1F69,	%g4
	mova	%icc,	%o4,	%l5
	siam	0x4
	bvc,a	%xcc,	loop_1565
	movre	%l1,	0x29D,	%o1
	fmovscc	%xcc,	%f15,	%f25
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
loop_1565:
	fmovdcs	%xcc,	%f22,	%f5
	movn	%icc,	%g6,	%o5
	srl	%i4,	%l4,	%l3
	movre	%i3,	%o7,	%i7
	alignaddrl	%g1,	%o2,	%l0
	fmovsvc	%xcc,	%f6,	%f28
	fmovsle	%xcc,	%f26,	%f8
	addccc	%i6,	%g2,	%o6
	fones	%f16
	fxor	%f22,	%f20,	%f8
	movleu	%icc,	%l2,	%g7
	edge8ln	%o0,	%i2,	%g3
	fnot2s	%f8,	%f18
	tvc	%icc,	0x3
	fzeros	%f28
	xnor	%i1,	%g5,	%i0
	xorcc	%i5,	%o3,	%o4
	andncc	%l5,	%l1,	%o1
	move	%xcc,	%g4,	%l6
	sdiv	%g6,	0x1E3A,	%i4
	wr	%g0,	0x81,	%asi
	sta	%f13,	[%l7 + 0x78] %asi
	ldd	[%l7 + 0x50],	%f18
	ldd	[%l7 + 0x78],	%o4
	flush	%l7 + 0x44
	smul	%l3,	%i3,	%o7
	subcc	%l4,	0x1B41,	%i7
	fcmple16	%f18,	%f24,	%o2
	fpsub32	%f12,	%f14,	%f16
	sir	0x17A3
	ble,a,pn	%xcc,	loop_1566
	tl	%xcc,	0x6
	fmuld8ulx16	%f21,	%f7,	%f26
	bneg,a,pt	%xcc,	loop_1567
loop_1566:
	smul	%l0,	0x07C0,	%g1
	tvc	%icc,	0x3
	array32	%g2,	%i6,	%o6
loop_1567:
	xnor	%l2,	%g7,	%i2
	srax	%o0,	%i1,	%g5
	tvc	%icc,	0x5
	fmovrse	%i0,	%f31,	%f20
	fmovscc	%xcc,	%f28,	%f28
	and	%i5,	%o3,	%o4
	swap	[%l7 + 0x48],	%l5
	bcs	%icc,	loop_1568
	mulscc	%l1,	0x0A4E,	%o1
	set	0x20, %o3
	ldda	[%l7 + %o3] 0x0c,	%g4
loop_1568:
	xor	%l6,	0x0B8A,	%g3
	subc	%g6,	0x1723,	%i4
	fmovdn	%xcc,	%f3,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o5,	%l3
	fble,a	%fcc2,	loop_1569
	andn	%i3,	%l4,	%i7
	tge	%icc,	0x4
	xorcc	%o7,	%l0,	%g1
loop_1569:
	umulcc	%o2,	%i6,	%g2
	fbne,a	%fcc1,	loop_1570
	andcc	%l2,	%o6,	%i2
	fzeros	%f27
	subcc	%g7,	%o0,	%g5
loop_1570:
	xnor	%i1,	%i5,	%i0
	fba,a	%fcc3,	loop_1571
	fnot1	%f24,	%f18
	movrgz	%o4,	0x3DE,	%l5
	fsrc1s	%f26,	%f24
loop_1571:
	udivx	%o3,	0x0C8A,	%l1
	movrne	%o1,	0x0C1,	%l6
	movrne	%g3,	0x292,	%g4
	fpadd32s	%f29,	%f29,	%f4
	fpsub16	%f16,	%f4,	%f10
	fnands	%f25,	%f7,	%f4
	sth	%i4,	[%l7 + 0x14]
	mulscc	%g6,	0x16A9,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i3,	0x0EC2,	%l3
	sub	%l4,	0x17FC,	%o7
	umul	%l0,	0x0351,	%i7
	andcc	%o2,	%i6,	%g1
	fba,a	%fcc3,	loop_1572
	fand	%f0,	%f0,	%f12
	ta	%xcc,	0x1
	fpsub16s	%f20,	%f6,	%f29
loop_1572:
	fbul,a	%fcc2,	loop_1573
	movneg	%xcc,	%l2,	%g2
	st	%f3,	[%l7 + 0x78]
	tgu	%xcc,	0x7
loop_1573:
	tsubcctv	%i2,	0x1196,	%g7
	sir	0x0CCC
	set	0x58, %i0
	prefetcha	[%l7 + %i0] 0x0c,	 0x2
	taddcc	%g5,	0x0A28,	%o0
	edge16l	%i1,	%i5,	%i0
	fcmpne32	%f0,	%f14,	%o4
	umulcc	%l5,	0x0B19,	%l1
	tvs	%xcc,	0x5
	alignaddr	%o3,	%o1,	%l6
	srlx	%g3,	0x01,	%g4
	movvs	%icc,	%g6,	%i4
	nop
	set	0x52, %l5
	sth	%o5,	[%l7 + %l5]
	sra	%i3,	0x0E,	%l4
	pdist	%f10,	%f24,	%f10
	fmovrslz	%l3,	%f2,	%f23
	fandnot2	%f30,	%f10,	%f12
	nop
	set	0x40, %o2
	lduh	[%l7 + %o2],	%l0
	tsubcc	%o7,	%o2,	%i7
	mova	%xcc,	%i6,	%l2
	fbn	%fcc1,	loop_1574
	edge16	%g2,	%g1,	%i2
	bn,a	loop_1575
	mulx	%g7,	0x043D,	%g5
loop_1574:
	nop
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x17
	membar	#Sync
loop_1575:
	edge8ln	%o6,	%i1,	%o0
	brgz,a	%i0,	loop_1576
	array32	%o4,	%l5,	%i5
	bvs,a	loop_1577
	edge8	%l1,	%o3,	%l6
loop_1576:
	ba,pt	%icc,	loop_1578
	edge16ln	%o1,	%g3,	%g4
loop_1577:
	addcc	%i4,	%g6,	%i3
	add	%l4,	0x0DFB,	%l3
loop_1578:
	popc	0x0EF4,	%o5
	tneg	%xcc,	0x6
	srl	%l0,	%o7,	%i7
	set	0x0D, %i5
	ldstuba	[%l7 + %i5] 0x81,	%o2
	sdivcc	%i6,	0x13FA,	%g2
	bn	loop_1579
	srlx	%g1,	0x09,	%l2
	xorcc	%g7,	0x14BC,	%i2
	addc	%o6,	%i1,	%g5
loop_1579:
	edge16n	%o0,	%o4,	%i0
	fmovrsgz	%l5,	%f2,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x0C, %l4
	stha	%l1,	[%l7 + %l4] 0x11
	edge32n	%i5,	%l6,	%o3
	movneg	%xcc,	%o1,	%g3
	fcmple32	%f24,	%f4,	%i4
	fpadd16	%f4,	%f4,	%f30
	brnz,a	%g6,	loop_1580
	xorcc	%i3,	%g4,	%l3
	movneg	%icc,	%l4,	%l0
	mulscc	%o7,	%o5,	%o2
loop_1580:
	movrne	%i7,	0x10D,	%i6
	srax	%g1,	%g2,	%g7
	movpos	%icc,	%i2,	%l2
	edge16	%o6,	%g5,	%i1
	sir	0x1442
	nop
	setx	loop_1581,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tpos	%xcc,	0x3
	fmovsge	%icc,	%f13,	%f7
	tvc	%icc,	0x3
loop_1581:
	udivcc	%o0,	0x09B1,	%o4
	taddcctv	%l5,	0x026D,	%i0
	srlx	%l1,	0x19,	%l6
	set	0x28, %i7
	prefetcha	[%l7 + %i7] 0x04,	 0x3
	addcc	%i5,	0x07B7,	%o1
	fcmpne16	%f16,	%f10,	%i4
	fcmple16	%f20,	%f4,	%g6
	orcc	%i3,	%g4,	%l3
	addccc	%g3,	0x04E0,	%l4
	pdist	%f8,	%f16,	%f6
	edge32ln	%l0,	%o5,	%o2
	edge16	%i7,	%o7,	%i6
	sra	%g2,	0x1F,	%g7
	alignaddr	%i2,	%l2,	%o6
	tsubcctv	%g1,	%g5,	%i1
	array16	%o4,	%l5,	%i0
	move	%xcc,	%l1,	%l6
	sra	%o0,	0x02,	%i5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o1
	bg,a,pn	%icc,	loop_1582
	or	%i4,	0x1EC1,	%g6
	movvc	%xcc,	%o3,	%g4
	smul	%i3,	0x0CE7,	%g3
loop_1582:
	sir	0x176D
	bcs,pt	%icc,	loop_1583
	movne	%icc,	%l4,	%l3
	fpadd32	%f4,	%f30,	%f4
	movcs	%xcc,	%l0,	%o5
loop_1583:
	brgez,a	%i7,	loop_1584
	fnegd	%f28,	%f16
	fmovrdlez	%o2,	%f10,	%f30
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
loop_1584:
	alignaddrl	%g2,	%o7,	%i2
	movrgez	%l2,	0x0AC,	%g7
	fbl,a	%fcc2,	loop_1585
	subcc	%g1,	0x1FE1,	%g5
	set	0x61, %g3
	stba	%i1,	[%l7 + %g3] 0x81
loop_1585:
	xnorcc	%o6,	0x1A5E,	%o4
	sll	%l5,	0x17,	%l1
	fabss	%f26,	%f15
	te	%xcc,	0x1
	movcs	%xcc,	%l6,	%i0
	movvs	%icc,	%o0,	%i5
	fcmpd	%fcc3,	%f16,	%f26
	movn	%icc,	%o1,	%i4
	fmuld8ulx16	%f3,	%f7,	%f2
	alignaddr	%g6,	%g4,	%i3
	movleu	%icc,	%o3,	%l4
	bcc,a	loop_1586
	fcmpgt32	%f4,	%f16,	%l3
	movrne	%l0,	%g3,	%o5
	ldd	[%l7 + 0x70],	%f24
loop_1586:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x54] %asi,	%i7
	movpos	%icc,	%o2,	%i6
	fmovdg	%xcc,	%f3,	%f3
	movcc	%xcc,	%g2,	%o7
	set	0x42, %o0
	lduha	[%l7 + %o0] 0x14,	%l2
	addcc	%g7,	0x0963,	%g1
	sdivx	%i2,	0x03C2,	%i1
	nop
	set	0x1D, %g2
	ldub	[%l7 + %g2],	%g5
	tneg	%xcc,	0x5
	sllx	%o6,	%l5,	%o4
	movpos	%xcc,	%l6,	%l1
	smul	%o0,	0x0587,	%i5
	udiv	%i0,	0x0ABF,	%i4
	fabsd	%f28,	%f12
	edge32n	%g6,	%g4,	%o1
	edge32l	%o3,	%i3,	%l4
	fbo,a	%fcc1,	loop_1587
	mulscc	%l3,	0x0E86,	%l0
	umul	%o5,	0x1D93,	%g3
	bvc	%icc,	loop_1588
loop_1587:
	mulx	%i7,	%o2,	%i6
	fone	%f12
	movrlez	%o7,	%g2,	%l2
loop_1588:
	taddcctv	%g7,	%i2,	%i1
	orcc	%g1,	%g5,	%o6
	bn	loop_1589
	umul	%l5,	0x0483,	%l6
	nop
	setx	loop_1590,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%xcc,	0x4
loop_1589:
	fmovdcs	%xcc,	%f15,	%f22
	udivcc	%o4,	0x0FD2,	%l1
loop_1590:
	sll	%i5,	%i0,	%o0
	fbe	%fcc3,	loop_1591
	tneg	%xcc,	0x1
	fpadd16s	%f12,	%f19,	%f5
	tsubcctv	%i4,	%g6,	%o1
loop_1591:
	tsubcctv	%o3,	0x168F,	%g4
	orncc	%i3,	0x0883,	%l4
	andncc	%l3,	%l0,	%g3
	alignaddrl	%o5,	%i7,	%i6
	fmovrdlez	%o7,	%f0,	%f14
	bleu	%xcc,	loop_1592
	taddcc	%o2,	%g2,	%g7
	alignaddr	%l2,	%i2,	%g1
	tne	%xcc,	0x2
loop_1592:
	fbne,a	%fcc3,	loop_1593
	ta	%icc,	0x7
	st	%f15,	[%l7 + 0x4C]
	edge32n	%i1,	%o6,	%l5
loop_1593:
	fmovrse	%l6,	%f23,	%f8
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x5C] %asi,	%g5
	sub	%o4,	0x1EB0,	%i5
	fbue,a	%fcc3,	loop_1594
	mulscc	%l1,	0x0CF4,	%o0
	ba,pn	%icc,	loop_1595
	srlx	%i4,	%i0,	%o1
loop_1594:
	sethi	0x18C5,	%g6
	fbug	%fcc3,	loop_1596
loop_1595:
	bvs,a	loop_1597
	bg	loop_1598
	fmovdl	%xcc,	%f18,	%f0
loop_1596:
	ldd	[%l7 + 0x58],	%f22
loop_1597:
	bcs,a	%icc,	loop_1599
loop_1598:
	mova	%xcc,	%g4,	%i3
	fbe,a	%fcc2,	loop_1600
	movrne	%l4,	0x326,	%l3
loop_1599:
	bleu,a	%icc,	loop_1601
	movrne	%o3,	%l0,	%g3
loop_1600:
	srl	%o5,	%i6,	%o7
	bpos	%icc,	loop_1602
loop_1601:
	move	%icc,	%i7,	%o2
	fabsd	%f0,	%f6
	movvc	%xcc,	%g7,	%g2
loop_1602:
	edge32l	%i2,	%l2,	%g1
	fmovrdgez	%i1,	%f10,	%f2
	wr	%g0,	0x11,	%asi
	sta	%f20,	[%l7 + 0x28] %asi
	orcc	%l5,	0x05B9,	%o6
	edge16	%l6,	%o4,	%g5
	edge16l	%i5,	%o0,	%l1
	ldsb	[%l7 + 0x27],	%i0
	movneg	%xcc,	%o1,	%i4
	movcs	%icc,	%g4,	%i3
	orcc	%l4,	0x0EAA,	%g6
	sdivx	%o3,	0x09E6,	%l0
	tsubcc	%l3,	%o5,	%g3
	alignaddrl	%i6,	%i7,	%o7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%g7,	%o2
	movrlz	%g2,	0x0B3,	%l2
	orncc	%i2,	%i1,	%g1
	addcc	%l5,	0x002F,	%l6
	fmuld8ulx16	%f6,	%f31,	%f8
	fxor	%f4,	%f16,	%f4
	bpos	loop_1603
	sub	%o4,	0x0E30,	%g5
	udivcc	%o6,	0x122C,	%i5
	edge16	%l1,	%i0,	%o0
loop_1603:
	ldsw	[%l7 + 0x54],	%i4
	brgz	%g4,	loop_1604
	mova	%xcc,	%o1,	%l4
	orcc	%g6,	0x0242,	%o3
	fpsub32s	%f7,	%f27,	%f22
loop_1604:
	addcc	%i3,	%l0,	%o5
	sethi	0x0C6C,	%l3
	umul	%g3,	0x11F3,	%i7
	set	0x78, %g6
	stda	%i6,	[%l7 + %g6] 0x18
	edge32n	%g7,	%o7,	%g2
	fmovdgu	%icc,	%f10,	%f15
	movvs	%icc,	%l2,	%o2
	fmovrslz	%i2,	%f3,	%f18
	sra	%i1,	0x06,	%g1
	fmovdleu	%xcc,	%f13,	%f15
	fand	%f12,	%f4,	%f24
	movneg	%icc,	%l6,	%l5
	array32	%o4,	%o6,	%g5
	fxors	%f30,	%f8,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%xcc,	%f14,	%f3
	movge	%xcc,	%l1,	%i5
	fmul8ulx16	%f18,	%f24,	%f12
	srl	%o0,	%i0,	%i4
	sub	%o1,	%l4,	%g6
	subc	%g4,	0x04CF,	%o3
	array32	%i3,	%o5,	%l3
	udiv	%l0,	0x0C5E,	%g3
	edge32n	%i7,	%g7,	%o7
	edge8n	%i6,	%l2,	%g2
	add	%i2,	0x0FC5,	%o2
	ble,pn	%xcc,	loop_1605
	brlz,a	%g1,	loop_1606
	movne	%xcc,	%i1,	%l6
	smulcc	%l5,	0x163C,	%o6
loop_1605:
	orcc	%o4,	0x13D9,	%l1
loop_1606:
	udivcc	%i5,	0x16FD,	%g5
	fbul,a	%fcc3,	loop_1607
	xnor	%i0,	%i4,	%o1
	sir	0x0BF1
	sth	%l4,	[%l7 + 0x38]
loop_1607:
	nop
	set	0x48, %g5
	lda	[%l7 + %g5] 0x80,	%f7
	udiv	%o0,	0x005B,	%g6
	fmovrsne	%g4,	%f24,	%f25
	std	%f6,	[%l7 + 0x68]
	fand	%f2,	%f8,	%f8
	set	0x48, %i4
	stda	%o2,	[%l7 + %i4] 0xeb
	membar	#Sync
	alignaddrl	%i3,	%o5,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g3,	%l3,	%i7
	movcs	%icc,	%g7,	%o7
	edge8n	%l2,	%i6,	%i2
	andcc	%g2,	0x1074,	%o2
	be,a,pt	%xcc,	loop_1608
	smul	%g1,	%l6,	%l5
	orcc	%o6,	0x1D39,	%i1
	edge32n	%o4,	%i5,	%g5
loop_1608:
	movrlz	%l1,	%i0,	%i4
	srl	%o1,	%o0,	%l4
	mulscc	%g6,	%o3,	%g4
	bleu,pt	%icc,	loop_1609
	edge32l	%o5,	%l0,	%g3
	movle	%icc,	%i3,	%l3
	sub	%g7,	%o7,	%i7
loop_1609:
	ldd	[%l7 + 0x50],	%f14
	tge	%icc,	0x2
	andncc	%l2,	%i6,	%i2
	edge16	%g2,	%g1,	%l6
	udivx	%o2,	0x0641,	%o6
	ldx	[%l7 + 0x40],	%i1
	andncc	%l5,	%i5,	%g5
	fpmerge	%f7,	%f5,	%f20
	mulx	%o4,	0x051D,	%l1
	ldstub	[%l7 + 0x35],	%i0
	xnorcc	%o1,	0x1C7C,	%o0
	ldsw	[%l7 + 0x70],	%i4
	fba	%fcc0,	loop_1610
	move	%xcc,	%g6,	%l4
	smulcc	%o3,	0x0542,	%g4
	fcmped	%fcc2,	%f2,	%f12
loop_1610:
	ldsw	[%l7 + 0x10],	%l0
	ld	[%l7 + 0x70],	%f12
	movre	%g3,	%i3,	%o5
	fpsub32s	%f29,	%f31,	%f1
	edge32	%l3,	%g7,	%o7
	mova	%icc,	%i7,	%l2
	fnor	%f2,	%f14,	%f30
	tl	%xcc,	0x5
	umulcc	%i6,	%i2,	%g1
	srl	%l6,	%g2,	%o2
	xnor	%i1,	%l5,	%o6
	fbe,a	%fcc0,	loop_1611
	fmovsle	%xcc,	%f31,	%f27
	movrgez	%g5,	%i5,	%o4
	faligndata	%f16,	%f16,	%f8
loop_1611:
	fxnors	%f6,	%f8,	%f23
	fcmple16	%f22,	%f8,	%l1
	fmovdgu	%icc,	%f16,	%f22
	udiv	%o1,	0x1632,	%o0
	tvs	%xcc,	0x6
	te	%icc,	0x6
	tl	%icc,	0x6
	srax	%i4,	%g6,	%l4
	fmovdg	%icc,	%f16,	%f22
	te	%icc,	0x4
	tvs	%icc,	0x6
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x50] %asi,	%f12
	movl	%icc,	%o3,	%g4
	subc	%i0,	%g3,	%i3
	fcmpd	%fcc1,	%f14,	%f16
	fpmerge	%f19,	%f1,	%f10
	movne	%icc,	%o5,	%l0
	mulx	%g7,	%l3,	%i7
	fnegs	%f3,	%f22
	fornot2s	%f4,	%f27,	%f31
	smul	%o7,	%l2,	%i2
	movpos	%xcc,	%g1,	%l6
	subcc	%i6,	0x1845,	%o2
	edge16l	%i1,	%l5,	%o6
	sllx	%g5,	%g2,	%i5
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x80,	%o4
	tvc	%icc,	0x7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x10,	%l1,	%o1
	sth	%i4,	[%l7 + 0x4E]
	taddcc	%g6,	%o0,	%l4
	udivcc	%g4,	0x0BB0,	%i0
	stb	%g3,	[%l7 + 0x10]
	fbe,a	%fcc2,	loop_1612
	popc	%i3,	%o3
	array32	%l0,	%g7,	%l3
	fbne,a	%fcc1,	loop_1613
loop_1612:
	fbuge,a	%fcc2,	loop_1614
	fbuge,a	%fcc3,	loop_1615
	fbn,a	%fcc3,	loop_1616
loop_1613:
	umul	%i7,	0x0040,	%o7
loop_1614:
	xorcc	%l2,	0x1BAC,	%i2
loop_1615:
	fmuld8sux16	%f14,	%f15,	%f22
loop_1616:
	subcc	%o5,	0x0E54,	%g1
	sub	%l6,	0x13F7,	%i6
	fnegd	%f4,	%f18
	movleu	%xcc,	%o2,	%i1
	alignaddr	%l5,	%o6,	%g2
	ta	%icc,	0x4
	fmovdge	%xcc,	%f9,	%f12
	movvc	%icc,	%g5,	%i5
	bn,a	%xcc,	loop_1617
	fbn,a	%fcc3,	loop_1618
	call	loop_1619
	std	%o4,	[%l7 + 0x70]
loop_1617:
	brlez,a	%l1,	loop_1620
loop_1618:
	xor	%o1,	0x0C9A,	%g6
loop_1619:
	fmovdcc	%icc,	%f1,	%f17
	bleu	%xcc,	loop_1621
loop_1620:
	udivx	%o0,	0x1572,	%i4
	mulx	%g4,	%i0,	%l4
	movneg	%xcc,	%i3,	%o3
loop_1621:
	sir	0x1CE9
	fbg,a	%fcc1,	loop_1622
	taddcctv	%l0,	%g3,	%l3
	fmovs	%f12,	%f1
	brgez,a	%i7,	loop_1623
loop_1622:
	fmovsgu	%xcc,	%f13,	%f10
	tgu	%icc,	0x0
	edge8l	%o7,	%l2,	%i2
loop_1623:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o5,	0x1A13,	%g1
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf9
	membar	#Sync
	fmovdpos	%xcc,	%f31,	%f22
	movcc	%icc,	%g7,	%l6
	te	%xcc,	0x7
	subcc	%o2,	0x045D,	%i1
	array16	%i6,	%o6,	%l5
	fble	%fcc0,	loop_1624
	movpos	%icc,	%g5,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x1D, %i1
	ldsba	[%l7 + %i1] 0x19,	%i5
loop_1624:
	bgu,pt	%icc,	loop_1625
	fsrc1	%f14,	%f30
	tcc	%icc,	0x2
	sra	%l1,	0x13,	%o4
loop_1625:
	ba	loop_1626
	fcmpne16	%f16,	%f10,	%o1
	fornot2s	%f6,	%f27,	%f24
	movge	%xcc,	%g6,	%i4
loop_1626:
	movn	%xcc,	%o0,	%g4
	sll	%i0,	0x17,	%i3
	bleu,pn	%xcc,	loop_1627
	movrne	%o3,	0x30C,	%l0
	bn	%xcc,	loop_1628
	tn	%xcc,	0x4
loop_1627:
	brnz,a	%g3,	loop_1629
	bshuffle	%f30,	%f28,	%f26
loop_1628:
	tneg	%icc,	0x3
	orcc	%l3,	%i7,	%l4
loop_1629:
	movre	%l2,	%i2,	%o5
	tn	%xcc,	0x3
	sth	%g1,	[%l7 + 0x72]
	fble	%fcc0,	loop_1630
	tgu	%xcc,	0x4
	fmovsl	%xcc,	%f31,	%f26
	tge	%icc,	0x4
loop_1630:
	alignaddr	%g7,	%o7,	%o2
	add	%l6,	0x09A6,	%i6
	srax	%i1,	0x15,	%o6
	fpsub16s	%f12,	%f13,	%f23
	fmovsg	%xcc,	%f3,	%f10
	fzero	%f14
	wr	%g0,	0x04,	%asi
	sta	%f8,	[%l7 + 0x2C] %asi
	subccc	%g5,	%l5,	%i5
	andn	%l1,	%g2,	%o1
	umul	%g6,	0x1C3D,	%i4
	mulscc	%o0,	%g4,	%o4
	sdivx	%i0,	0x1EE0,	%i3
	tle	%icc,	0x6
	tleu	%xcc,	0x3
	tgu	%xcc,	0x4
	xorcc	%l0,	0x1AAD,	%o3
	set	0x20, %i6
	prefetcha	[%l7 + %i6] 0x18,	 0x1
	movcs	%xcc,	%g3,	%l4
	sdivcc	%i7,	0x14D0,	%l2
	set	0x18, %i3
	lda	[%l7 + %i3] 0x15,	%f26
	ldd	[%l7 + 0x78],	%f28
	bn,pt	%icc,	loop_1631
	tge	%icc,	0x6
	fbule,a	%fcc3,	loop_1632
	tle	%xcc,	0x1
loop_1631:
	fors	%f1,	%f25,	%f2
	edge8l	%o5,	%i2,	%g1
loop_1632:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%g7,	[%l7 + 0x50] %asi
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f16
	brgz	%o7,	loop_1633
	smul	%l6,	%o2,	%i1
	fmovscc	%icc,	%f3,	%f7
	tcs	%xcc,	0x6
loop_1633:
	movgu	%icc,	%i6,	%g5
	fsrc2	%f28,	%f14
	brgz	%o6,	loop_1634
	tneg	%xcc,	0x0
	te	%xcc,	0x7
	edge8l	%l5,	%i5,	%l1
loop_1634:
	sub	%o1,	0x18B8,	%g2
	fone	%f14
	tvc	%icc,	0x0
	tvc	%xcc,	0x3
	andcc	%i4,	%g6,	%o0
	alignaddr	%g4,	%i0,	%i3
	movcc	%xcc,	%l0,	%o3
	fxors	%f27,	%f19,	%f8
	fbge,a	%fcc0,	loop_1635
	fmovrsgez	%o4,	%f18,	%f12
	movvc	%icc,	%l3,	%l4
	xor	%i7,	%g3,	%o5
loop_1635:
	srl	%l2,	0x12,	%i2
	fzeros	%f13
	wr	%g0,	0x2b,	%asi
	stwa	%g7,	[%l7 + 0x1C] %asi
	membar	#Sync
	ba	%xcc,	loop_1636
	fnegd	%f22,	%f18
	edge16l	%o7,	%g1,	%o2
	fandnot2s	%f1,	%f10,	%f28
loop_1636:
	fbule,a	%fcc3,	loop_1637
	movvc	%xcc,	%l6,	%i1
	andn	%g5,	%i6,	%l5
	umulcc	%i5,	0x0D18,	%l1
loop_1637:
	movg	%xcc,	%o6,	%g2
	tsubcctv	%i4,	%g6,	%o1
	fblg,a	%fcc1,	loop_1638
	sth	%g4,	[%l7 + 0x40]
	fzero	%f12
	sdiv	%o0,	0x03CF,	%i3
loop_1638:
	fcmpes	%fcc3,	%f21,	%f21
	nop
	set	0x60, %l3
	sth	%i0,	[%l7 + %l3]
	fmuld8ulx16	%f31,	%f9,	%f2
	fmovdl	%icc,	%f9,	%f25
	bleu,pn	%xcc,	loop_1639
	movge	%icc,	%o3,	%l0
	sub	%o4,	0x07A4,	%l4
	fors	%f10,	%f20,	%f5
loop_1639:
	movrlz	%i7,	0x324,	%g3
	tleu	%xcc,	0x0
	fmovrslz	%o5,	%f18,	%f28
	set	0x34, %l6
	lduwa	[%l7 + %l6] 0x80,	%l2
	movneg	%icc,	%l3,	%i2
	addcc	%g7,	%o7,	%o2
	fmovdle	%xcc,	%f19,	%f12
	fpadd32s	%f23,	%f31,	%f12
	sdivx	%l6,	0x1757,	%i1
	edge8ln	%g5,	%i6,	%l5
	set	0x38, %o7
	lda	[%l7 + %o7] 0x15,	%f26
	tsubcc	%i5,	0x1458,	%l1
	movre	%g1,	%o6,	%i4
	subccc	%g2,	%o1,	%g4
	array32	%o0,	%i3,	%g6
	edge32	%i0,	%l0,	%o3
	tsubcc	%l4,	0x1D6D,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%i7,	%o5
	fbug	%fcc0,	loop_1640
	edge8	%l2,	%l3,	%g3
	membar	0x71
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x04
loop_1640:
	stbar
	edge32l	%g7,	%i2,	%o2
	fmovdge	%icc,	%f28,	%f6
	ldstub	[%l7 + 0x08],	%l6
	ldstub	[%l7 + 0x1C],	%i1
	ldstub	[%l7 + 0x4C],	%g5
	tg	%xcc,	0x6
	xnor	%i6,	0x0D87,	%o7
	udiv	%l5,	0x1623,	%l1
	edge8	%i5,	%o6,	%g1
	edge16	%g2,	%o1,	%g4
	srlx	%i4,	%o0,	%g6
	smul	%i3,	%l0,	%o3
	bge	loop_1641
	fblg,a	%fcc0,	loop_1642
	fmul8ulx16	%f8,	%f26,	%f20
	mova	%icc,	%l4,	%i0
loop_1641:
	std	%o4,	[%l7 + 0x60]
loop_1642:
	sub	%o5,	%l2,	%l3
	srlx	%g3,	0x06,	%i7
	fbu,a	%fcc0,	loop_1643
	movle	%xcc,	%i2,	%o2
	fmovrslz	%l6,	%f13,	%f14
	brnz,a	%i1,	loop_1644
loop_1643:
	bneg,a	loop_1645
	fmovsa	%icc,	%f9,	%f29
	tg	%xcc,	0x0
loop_1644:
	fcmple32	%f16,	%f26,	%g5
loop_1645:
	movrgz	%i6,	%o7,	%g7
	subcc	%l5,	0x132A,	%i5
	bge	%icc,	loop_1646
	fmovrsgez	%o6,	%f6,	%f22
	fpack16	%f14,	%f17
	movneg	%icc,	%g1,	%l1
loop_1646:
	brnz,a	%g2,	loop_1647
	movvs	%xcc,	%g4,	%i4
	fpadd32	%f18,	%f14,	%f10
	edge32l	%o1,	%g6,	%i3
loop_1647:
	edge8	%o0,	%o3,	%l0
	movle	%xcc,	%i0,	%l4
	movg	%xcc,	%o5,	%o4
	bg	%xcc,	loop_1648
	membar	0x1D
	sdiv	%l2,	0x062C,	%g3
	tne	%icc,	0x7
loop_1648:
	brgz	%i7,	loop_1649
	edge16	%l3,	%i2,	%l6
	andncc	%o2,	%i1,	%g5
	taddcc	%o7,	%g7,	%l5
loop_1649:
	brgz	%i6,	loop_1650
	srl	%o6,	0x1C,	%g1
	wr	%g0,	0x88,	%asi
	stwa	%i5,	[%l7 + 0x20] %asi
loop_1650:
	srax	%l1,	0x07,	%g2
	movvs	%icc,	%g4,	%i4
	tleu	%icc,	0x0
	mulx	%g6,	0x169E,	%o1
	fandnot1s	%f17,	%f19,	%f7
	edge8	%i3,	%o0,	%l0
	and	%o3,	%l4,	%o5
	bl,a	loop_1651
	tpos	%xcc,	0x0
	edge32ln	%i0,	%o4,	%l2
	fmul8ulx16	%f28,	%f0,	%f12
loop_1651:
	nop
	setx	loop_1652,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot2s	%f13,	%f27,	%f6
	taddcctv	%i7,	%g3,	%l3
	set	0x60, %o4
	lduwa	[%l7 + %o4] 0x11,	%l6
loop_1652:
	xor	%i2,	%i1,	%g5
	ldsw	[%l7 + 0x6C],	%o2
	movrgz	%o7,	0x0C8,	%l5
	addcc	%g7,	0x09A7,	%o6
	bleu,pt	%xcc,	loop_1653
	array16	%i6,	%i5,	%l1
	nop
	setx	loop_1654,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	0x1FBC,	%g2
loop_1653:
	fandnot2	%f14,	%f16,	%f28
	fpack16	%f28,	%f19
loop_1654:
	movrgz	%g1,	0x05F,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%i4,	%f30,	%f27
	orn	%o1,	0x09B2,	%i3
	sir	0x05D3
	fblg	%fcc0,	loop_1655
	fblg,a	%fcc0,	loop_1656
	ta	%icc,	0x1
	ldd	[%l7 + 0x08],	%g6
loop_1655:
	movneg	%icc,	%o0,	%l0
loop_1656:
	fornot2s	%f3,	%f23,	%f25
	bgu	%icc,	loop_1657
	fbge,a	%fcc1,	loop_1658
	stb	%l4,	[%l7 + 0x31]
	fnand	%f8,	%f4,	%f2
loop_1657:
	stx	%o3,	[%l7 + 0x78]
loop_1658:
	edge16ln	%o5,	%o4,	%l2
	sdiv	%i0,	0x0B6F,	%g3
	fbue	%fcc2,	loop_1659
	std	%f20,	[%l7 + 0x18]
	fmovsn	%icc,	%f11,	%f7
	prefetch	[%l7 + 0x2C],	 0x3
loop_1659:
	movn	%xcc,	%i7,	%l3
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf1,	%f0
	movcc	%icc,	%i2,	%i1
	fmovdn	%xcc,	%f4,	%f5
	tgu	%xcc,	0x1
	edge32ln	%l6,	%g5,	%o2
	move	%icc,	%l5,	%o7
	fornot2	%f18,	%f14,	%f20
	movrlz	%o6,	%g7,	%i5
	wr	%g0,	0x0c,	%asi
	sta	%f28,	[%l7 + 0x3C] %asi
	call	loop_1660
	sllx	%l1,	0x02,	%g2
	bg,a,pn	%xcc,	loop_1661
	fmovsn	%icc,	%f4,	%f25
loop_1660:
	tne	%xcc,	0x7
	fpadd32s	%f7,	%f17,	%f11
loop_1661:
	ldsw	[%l7 + 0x74],	%i6
	fsrc1	%f14,	%f0
	fbl	%fcc2,	loop_1662
	edge32n	%g4,	%g1,	%o1
	tge	%icc,	0x7
	sdivx	%i4,	0x19F6,	%g6
loop_1662:
	fcmpeq32	%f14,	%f28,	%o0
	fcmple32	%f6,	%f6,	%l0
	bg,a,pt	%xcc,	loop_1663
	andncc	%i3,	%l4,	%o5
	mova	%xcc,	%o3,	%l2
	edge8ln	%i0,	%o4,	%i7
loop_1663:
	alignaddrl	%l3,	%g3,	%i1
	subcc	%i2,	%l6,	%o2
	mova	%xcc,	%g5,	%l5
	fnors	%f17,	%f20,	%f20
	fzero	%f20
	fmovdvc	%xcc,	%f3,	%f15
	alignaddr	%o7,	%g7,	%o6
	mulx	%l1,	0x1E20,	%g2
	sra	%i5,	0x17,	%g4
	fbl,a	%fcc0,	loop_1664
	bcc,a,pn	%icc,	loop_1665
	umul	%i6,	0x0BAC,	%o1
	orn	%g1,	%i4,	%o0
loop_1664:
	fmovdcc	%xcc,	%f0,	%f23
loop_1665:
	movg	%icc,	%g6,	%i3
	array8	%l0,	%l4,	%o3
	fbuge,a	%fcc2,	loop_1666
	tge	%xcc,	0x4
	xnorcc	%l2,	%o5,	%i0
	addccc	%i7,	0x0FC5,	%l3
loop_1666:
	sdiv	%o4,	0x165C,	%i1
	tleu	%icc,	0x2
	fmovrsgez	%i2,	%f6,	%f22
	sll	%g3,	%o2,	%g5
	edge8l	%l6,	%o7,	%g7
	sth	%o6,	[%l7 + 0x6A]
	fmovsleu	%xcc,	%f11,	%f18
	tvs	%xcc,	0x5
	orcc	%l5,	%l1,	%i5
	umul	%g2,	%i6,	%o1
	stbar
	add	%g1,	0x02D2,	%i4
	tcs	%icc,	0x0
	edge16l	%o0,	%g6,	%i3
	fmovsg	%icc,	%f16,	%f13
	set	0x68, %l1
	sta	%f21,	[%l7 + %l1] 0x80
	array16	%g4,	%l4,	%l0
	tl	%icc,	0x1
	fmovspos	%xcc,	%f0,	%f25
	stw	%l2,	[%l7 + 0x2C]
	brz	%o3,	loop_1667
	fmovrslez	%i0,	%f0,	%f15
	set	0x70, %o5
	lduwa	[%l7 + %o5] 0x18,	%o5
loop_1667:
	movn	%icc,	%l3,	%i7
	tg	%icc,	0x4
	fba,a	%fcc1,	loop_1668
	movle	%icc,	%o4,	%i2
	fba,a	%fcc2,	loop_1669
	tgu	%xcc,	0x0
loop_1668:
	movgu	%xcc,	%i1,	%o2
	lduw	[%l7 + 0x34],	%g5
loop_1669:
	tsubcc	%l6,	%g3,	%o7
	udiv	%g7,	0x073D,	%l5
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x14
	movrlz	%o6,	0x085,	%l1
	movge	%xcc,	%g2,	%i5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i6
	movvc	%icc,	%g1,	%o1
	movpos	%icc,	%i4,	%g6
	ldd	[%l7 + 0x38],	%f10
	subccc	%o0,	%g4,	%i3
	tg	%xcc,	0x0
	ld	[%l7 + 0x40],	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l4,	%l2,	%o3
	movn	%icc,	%l0,	%i0
	tge	%xcc,	0x2
	membar	0x22
	fmovdge	%icc,	%f28,	%f15
	wr	%g0,	0x80,	%asi
	sta	%f27,	[%l7 + 0x60] %asi
	alignaddr	%o5,	%l3,	%i7
	fmovrsgz	%o4,	%f8,	%f12
	edge16ln	%i1,	%o2,	%i2
	movcs	%icc,	%l6,	%g5
	fmovde	%xcc,	%f29,	%f31
	movvc	%icc,	%o7,	%g7
	movcs	%icc,	%g3,	%o6
	brlz	%l1,	loop_1670
	or	%l5,	%i5,	%g2
	xnor	%g1,	0x1A49,	%o1
	fmovrdgez	%i6,	%f0,	%f20
loop_1670:
	brz	%i4,	loop_1671
	fmovdvc	%xcc,	%f20,	%f20
	udivcc	%g6,	0x12ED,	%g4
	edge32ln	%i3,	%o0,	%l4
loop_1671:
	fmovsleu	%icc,	%f24,	%f1
	sir	0x17DF
	edge16n	%o3,	%l2,	%i0
	movneg	%xcc,	%l0,	%l3
	fmovrde	%i7,	%f28,	%f30
	tgu	%icc,	0x2
	ba,a,pt	%xcc,	loop_1672
	movneg	%icc,	%o5,	%o4
	movle	%icc,	%i1,	%o2
	tcs	%icc,	0x0
loop_1672:
	fmovdgu	%xcc,	%f7,	%f28
	orcc	%i2,	0x11F8,	%l6
	bge,pn	%xcc,	loop_1673
	movle	%icc,	%o7,	%g7
	set	0x30, %g7
	prefetcha	[%l7 + %g7] 0x80,	 0x1
loop_1673:
	srax	%o6,	%g3,	%l1
	std	%f18,	[%l7 + 0x10]
	bvs	%xcc,	loop_1674
	fnegs	%f16,	%f23
	tcs	%xcc,	0x1
	subc	%i5,	%l5,	%g1
loop_1674:
	tn	%xcc,	0x3
	and	%g2,	0x1042,	%i6
	movl	%icc,	%i4,	%g6
	ble,a,pn	%xcc,	loop_1675
	sdivx	%g4,	0x184A,	%o1
	fble	%fcc2,	loop_1676
	fmovrde	%i3,	%f20,	%f26
loop_1675:
	tl	%xcc,	0x3
	fbu	%fcc2,	loop_1677
loop_1676:
	ldd	[%l7 + 0x68],	%f6
	movne	%xcc,	%l4,	%o3
	ble	loop_1678
loop_1677:
	bgu	loop_1679
	tvc	%xcc,	0x2
	tge	%icc,	0x1
loop_1678:
	tne	%xcc,	0x3
loop_1679:
	edge16ln	%o0,	%i0,	%l0
	sub	%l2,	%l3,	%o5
	subccc	%o4,	0x1F79,	%i1
	fandnot1	%f22,	%f30,	%f26
	fmul8x16au	%f8,	%f25,	%f22
	sdiv	%i7,	0x1993,	%i2
	movgu	%xcc,	%l6,	%o2
	bl,a,pn	%icc,	loop_1680
	movge	%xcc,	%g7,	%o7
	movvc	%xcc,	%g5,	%g3
	array8	%l1,	%o6,	%i5
loop_1680:
	fabss	%f11,	%f20
	fpsub32	%f28,	%f24,	%f30
	movle	%xcc,	%l5,	%g1
	tneg	%xcc,	0x3
	umulcc	%i6,	0x0BF4,	%g2
	sllx	%g6,	%g4,	%o1
	andncc	%i4,	%l4,	%o3
	std	%o0,	[%l7 + 0x70]
	movge	%icc,	%i3,	%l0
	movrgez	%i0,	%l3,	%l2
	taddcctv	%o5,	0x00AC,	%o4
	tne	%xcc,	0x6
	fxor	%f2,	%f20,	%f2
	xor	%i1,	%i7,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o2,	%i2
	and	%g7,	0x0010,	%o7
	tneg	%icc,	0x4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%g5
	stbar
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%o6
	movgu	%xcc,	%i5,	%l5
	xor	%g1,	%g3,	%i6
	fbul	%fcc3,	loop_1681
	umulcc	%g6,	%g4,	%g2
	movrgez	%o1,	0x2D3,	%i4
	edge8ln	%o3,	%o0,	%l4
loop_1681:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%i3,	%i0
	movvs	%icc,	%l0,	%l2
	array16	%l3,	%o5,	%o4
	fpsub16	%f12,	%f12,	%f14
	addc	%i7,	%i1,	%o2
	fmul8x16au	%f28,	%f22,	%f26
	brnz	%i2,	loop_1682
	xor	%g7,	0x1DD4,	%l6
	bg,a	%icc,	loop_1683
	udivx	%o7,	0x1CDE,	%g5
loop_1682:
	movrne	%o6,	0x016,	%i5
	set	0x36, %o3
	stha	%l5,	[%l7 + %o3] 0x14
loop_1683:
	smul	%g1,	0x0F2A,	%g3
	taddcctv	%i6,	%g6,	%g4
	fblg	%fcc2,	loop_1684
	bneg,pt	%icc,	loop_1685
	taddcctv	%l1,	%o1,	%i4
	tl	%xcc,	0x6
loop_1684:
	orncc	%g2,	0x1889,	%o3
loop_1685:
	movcs	%icc,	%l4,	%o0
	add	%i3,	%i0,	%l2
	movvc	%xcc,	%l3,	%l0
	movrgz	%o5,	0x0DE,	%i7
	fcmpne16	%f14,	%f4,	%i1
	umulcc	%o4,	0x138A,	%i2
	fabsd	%f8,	%f0
	tpos	%xcc,	0x7
	mova	%icc,	%g7,	%l6
	be,a	loop_1686
	subc	%o2,	%g5,	%o6
	addcc	%o7,	0x1EB8,	%l5
	edge32n	%i5,	%g3,	%i6
loop_1686:
	ta	%icc,	0x4
	stb	%g1,	[%l7 + 0x2D]
	srlx	%g6,	%g4,	%l1
	fbu,a	%fcc3,	loop_1687
	sllx	%o1,	%g2,	%o3
	brlez,a	%i4,	loop_1688
	fcmpgt32	%f4,	%f4,	%o0
loop_1687:
	fbul,a	%fcc2,	loop_1689
	umulcc	%i3,	0x1F8A,	%i0
loop_1688:
	sra	%l4,	0x1F,	%l2
	tpos	%xcc,	0x2
loop_1689:
	movcs	%xcc,	%l0,	%l3
	fands	%f0,	%f2,	%f28
	te	%icc,	0x0
	fmovrdlz	%o5,	%f24,	%f16
	set	0x40, %i0
	prefetcha	[%l7 + %i0] 0x89,	 0x0
	srax	%o4,	0x19,	%i7
	nop
	setx loop_1690, %l0, %l1
	jmpl %l1, %g7
	movcs	%xcc,	%l6,	%i2
	bg,a,pt	%xcc,	loop_1691
	srlx	%o2,	0x12,	%o6
loop_1690:
	movrgz	%g5,	%o7,	%l5
	edge8	%g3,	%i6,	%i5
loop_1691:
	taddcc	%g1,	0x11FC,	%g6
	sub	%l1,	%g4,	%g2
	tge	%icc,	0x2
	ldd	[%l7 + 0x40],	%f16
	fornot2s	%f27,	%f13,	%f5
	movle	%xcc,	%o3,	%i4
	fsrc2s	%f25,	%f20
	tgu	%xcc,	0x4
	fbg	%fcc1,	loop_1692
	ldsh	[%l7 + 0x66],	%o0
	tpos	%xcc,	0x2
	fmovda	%icc,	%f18,	%f9
loop_1692:
	xorcc	%i3,	0x1863,	%o1
	wr	%g0,	0x89,	%asi
	stwa	%i0,	[%l7 + 0x30] %asi
	lduw	[%l7 + 0x74],	%l4
	or	%l2,	0x06A7,	%l0
	movgu	%xcc,	%l3,	%o5
	fmovsne	%xcc,	%f28,	%f15
	fmovspos	%icc,	%f12,	%f4
	fandnot1	%f26,	%f24,	%f24
	tg	%icc,	0x6
	array8	%i1,	%o4,	%i7
	tcc	%icc,	0x7
	movgu	%xcc,	%g7,	%l6
	tle	%xcc,	0x3
	fble	%fcc1,	loop_1693
	taddcc	%o2,	%i2,	%o6
	fmovsvc	%xcc,	%f17,	%f24
	sub	%g5,	%o7,	%l5
loop_1693:
	tvs	%xcc,	0x5
	tleu	%icc,	0x3
	fxnors	%f28,	%f3,	%f29
	prefetch	[%l7 + 0x60],	 0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g3,	0x1E18,	%i6
	tvs	%xcc,	0x4
	fpackfix	%f8,	%f25
	fnand	%f14,	%f0,	%f8
	call	loop_1694
	edge8l	%g1,	%i5,	%g6
	movle	%xcc,	%g4,	%l1
	brlez,a	%o3,	loop_1695
loop_1694:
	mulx	%i4,	0x0C67,	%o0
	edge32	%i3,	%g2,	%i0
	fcmpeq32	%f20,	%f2,	%l4
loop_1695:
	fpmerge	%f9,	%f6,	%f14
	tle	%icc,	0x7
	ldd	[%l7 + 0x40],	%o0
	tneg	%icc,	0x2
	tsubcctv	%l0,	0x1750,	%l3
	fcmpeq16	%f26,	%f4,	%l2
	fbu	%fcc3,	loop_1696
	udivx	%i1,	0x07A6,	%o4
	fmovsle	%xcc,	%f21,	%f0
	movn	%xcc,	%o5,	%g7
loop_1696:
	membar	0x28
	te	%icc,	0x4
	edge8	%i7,	%o2,	%i2
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%l6
	movneg	%xcc,	%o6,	%g5
	movrne	%o7,	%g3,	%l5
	fpsub32	%f30,	%f16,	%f14
	fsrc1s	%f10,	%f24
	umulcc	%i6,	0x1C6E,	%i5
	lduh	[%l7 + 0x74],	%g1
	fexpand	%f1,	%f12
	edge16	%g6,	%l1,	%o3
	fandnot2	%f18,	%f24,	%f20
	nop
	set	0x30, %o2
	prefetch	[%l7 + %o2],	 0x2
	addcc	%i4,	%g4,	%i3
	ld	[%l7 + 0x44],	%f3
	stb	%g2,	[%l7 + 0x50]
	nop
	setx loop_1697, %l0, %l1
	jmpl %l1, %i0
	subccc	%l4,	0x1B1F,	%o0
	edge8ln	%l0,	%o1,	%l2
	bn	loop_1698
loop_1697:
	fmovscc	%xcc,	%f6,	%f3
	orncc	%l3,	0x0C48,	%o4
	movleu	%xcc,	%o5,	%g7
loop_1698:
	ba,a,pn	%icc,	loop_1699
	fornot1	%f24,	%f0,	%f28
	tsubcc	%i7,	%o2,	%i1
	tvs	%icc,	0x2
loop_1699:
	nop
	set	0x6D, %l5
	lduba	[%l7 + %l5] 0x14,	%i2
	fbne,a	%fcc0,	loop_1700
	edge16l	%l6,	%o6,	%o7
	edge8n	%g3,	%l5,	%i6
	ldd	[%l7 + 0x08],	%g4
loop_1700:
	fmovsl	%icc,	%f29,	%f29
	udivcc	%g1,	0x02A7,	%i5
	edge16l	%l1,	%o3,	%i4
	alignaddrl	%g4,	%g6,	%g2
	or	%i3,	0x0AAD,	%l4
	taddcctv	%i0,	0x13B2,	%o0
	srax	%l0,	0x05,	%l2
	smulcc	%o1,	%o4,	%o5
	tcs	%icc,	0x7
	fmovrsne	%g7,	%f25,	%f19
	edge8	%i7,	%l3,	%o2
	ba,a,pt	%icc,	loop_1701
	fble,a	%fcc0,	loop_1702
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,pt	%xcc,	loop_1703
loop_1701:
	srax	%i2,	0x19,	%i1
loop_1702:
	orn	%l6,	%o7,	%o6
	movcs	%xcc,	%l5,	%i6
loop_1703:
	movne	%icc,	%g3,	%g1
	sll	%i5,	0x01,	%l1
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%o2
	std	%f30,	[%l7 + 0x68]
	move	%icc,	%i4,	%g5
	fmovsgu	%icc,	%f20,	%f8
	fnors	%f30,	%f27,	%f3
	movle	%icc,	%g4,	%g6
	edge8n	%g2,	%i3,	%i0
	sdivcc	%l4,	0x1F9B,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o0,	%l2
	and	%o4,	%o1,	%g7
	ldsb	[%l7 + 0x1D],	%i7
	srlx	%l3,	%o5,	%i2
	stbar
	tcs	%xcc,	0x6
	wr	%g0,	0x0c,	%asi
	stda	%i0,	[%l7 + 0x28] %asi
	movrgz	%o2,	0x3BA,	%o7
	taddcc	%l6,	0x02ED,	%o6
	addccc	%i6,	0x084C,	%g3
	std	%g0,	[%l7 + 0x18]
	array32	%i5,	%l5,	%l1
	set	0x3D, %i5
	stba	%o3,	[%l7 + %i5] 0xe3
	membar	#Sync
	std	%g4,	[%l7 + 0x18]
	taddcctv	%i4,	0x0DC5,	%g4
	fmovs	%f5,	%f12
	tpos	%icc,	0x2
	brz	%g6,	loop_1704
	std	%g2,	[%l7 + 0x30]
	fpack16	%f16,	%f9
	sub	%i0,	0x070B,	%l4
loop_1704:
	fpsub32s	%f11,	%f1,	%f13
	fpadd32	%f6,	%f8,	%f18
	subccc	%l0,	0x15E2,	%i3
	taddcc	%o0,	%l2,	%o4
	fmovrslez	%g7,	%f10,	%f23
	xnorcc	%i7,	0x1B16,	%o1
	fbge,a	%fcc2,	loop_1705
	popc	0x17E6,	%o5
	edge16n	%l3,	%i1,	%o2
	andncc	%o7,	%l6,	%o6
loop_1705:
	movcc	%xcc,	%i6,	%g3
	edge8ln	%g1,	%i2,	%l5
	fnegd	%f20,	%f16
	srax	%i5,	%l1,	%o3
	tle	%xcc,	0x4
	tleu	%icc,	0x7
	bleu,pn	%xcc,	loop_1706
	popc	0x016F,	%g5
	edge16l	%g4,	%g6,	%g2
	sll	%i0,	0x12,	%i4
loop_1706:
	fcmped	%fcc0,	%f28,	%f28
	udivcc	%l0,	0x0131,	%l4
	set	0x28, %i7
	lda	[%l7 + %i7] 0x15,	%f31
	orn	%o0,	%i3,	%l2
	siam	0x1
	smulcc	%o4,	0x0A9A,	%g7
	fmovdleu	%icc,	%f3,	%f13
	tcc	%xcc,	0x1
	andncc	%o1,	%i7,	%o5
	srax	%l3,	0x1F,	%i1
	addccc	%o7,	%o2,	%o6
	srlx	%l6,	0x19,	%i6
	xnorcc	%g1,	0x0337,	%i2
	addccc	%l5,	0x1234,	%g3
	edge16	%i5,	%o3,	%g5
	ta	%xcc,	0x0
	xnorcc	%l1,	0x01F4,	%g4
	set	0x7F, %g3
	ldstuba	[%l7 + %g3] 0x80,	%g6
	tle	%icc,	0x0
	sra	%i0,	0x09,	%g2
	brlz	%l0,	loop_1707
	sdiv	%i4,	0x0931,	%o0
	fbl	%fcc3,	loop_1708
	fcmpd	%fcc0,	%f28,	%f30
loop_1707:
	sdivcc	%l4,	0x09ED,	%l2
	tg	%icc,	0x1
loop_1708:
	fpackfix	%f30,	%f7
	brz	%i3,	loop_1709
	srlx	%o4,	0x11,	%g7
	fbue,a	%fcc2,	loop_1710
	membar	0x04
loop_1709:
	edge16ln	%o1,	%o5,	%i7
	edge8n	%l3,	%i1,	%o7
loop_1710:
	tn	%icc,	0x3
	fmovrslez	%o6,	%f24,	%f6
	fmovdg	%xcc,	%f12,	%f19
	fpadd32s	%f6,	%f14,	%f24
	tsubcc	%l6,	%i6,	%o2
	udiv	%i2,	0x1700,	%g1
	ble	loop_1711
	movn	%icc,	%l5,	%i5
	popc	%o3,	%g3
	xnor	%g5,	%l1,	%g4
loop_1711:
	edge16	%g6,	%g2,	%i0
	sll	%i4,	%l0,	%o0
	fsrc2s	%f4,	%f25
	fblg	%fcc3,	loop_1712
	addcc	%l4,	0x16E4,	%l2
	array32	%i3,	%o4,	%o1
	addcc	%g7,	%i7,	%o5
loop_1712:
	movle	%icc,	%i1,	%o7
	fmovdgu	%icc,	%f9,	%f12
	andncc	%l3,	%l6,	%i6
	fbu	%fcc3,	loop_1713
	edge8l	%o6,	%i2,	%o2
	fpadd16	%f2,	%f12,	%f16
	bn,a	loop_1714
loop_1713:
	sethi	0x0166,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl	%fcc3,	loop_1715
loop_1714:
	array32	%l5,	%o3,	%g3
	mova	%icc,	%g5,	%i5
	tvs	%icc,	0x5
loop_1715:
	addcc	%g4,	%l1,	%g2
	std	%f2,	[%l7 + 0x18]
	bcs,a	%xcc,	loop_1716
	addcc	%i0,	0x1AD3,	%g6
	addcc	%i4,	%o0,	%l4
	tle	%xcc,	0x6
loop_1716:
	subc	%l2,	%l0,	%i3
	ld	[%l7 + 0x50],	%f2
	fmovrdlz	%o1,	%f28,	%f8
	fcmple32	%f8,	%f2,	%g7
	movpos	%icc,	%i7,	%o5
	sethi	0x070F,	%i1
	tcs	%xcc,	0x2
	fpsub32s	%f19,	%f27,	%f0
	tgu	%icc,	0x6
	fmovdle	%xcc,	%f9,	%f27
	sdivcc	%o4,	0x002F,	%o7
	umul	%l3,	0x0E2D,	%l6
	movvc	%xcc,	%o6,	%i6
	bshuffle	%f18,	%f14,	%f28
	fbule	%fcc3,	loop_1717
	fmovrdne	%i2,	%f30,	%f20
	set	0x70, %o0
	lda	[%l7 + %o0] 0x19,	%f13
loop_1717:
	be,a	%icc,	loop_1718
	tne	%xcc,	0x6
	tsubcc	%g1,	0x0169,	%l5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x5C] %asi,	%f22
loop_1718:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	bl,a	%xcc,	loop_1719
	fsrc1	%f24,	%f22
	bne,pt	%xcc,	loop_1720
	popc	0x0465,	%o2
loop_1719:
	movrne	%o3,	%g5,	%i5
	bgu	loop_1721
loop_1720:
	umul	%g3,	0x0CD0,	%l1
	edge16ln	%g2,	%i0,	%g4
	orncc	%g6,	0x0A86,	%o0
loop_1721:
	movrgz	%i4,	0x17F,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l2,	%i3,	%o1
	taddcctv	%g7,	%i7,	%l0
	membar	0x15
	alignaddr	%o5,	%o4,	%i1
	fnand	%f8,	%f8,	%f2
	array32	%o7,	%l3,	%l6
	bg,a,pn	%icc,	loop_1722
	addc	%o6,	0x1C40,	%i2
	fmovdle	%icc,	%f4,	%f3
	movvs	%xcc,	%i6,	%g1
loop_1722:
	addccc	%o2,	%l5,	%o3
	and	%g5,	0x1BD0,	%i5
	fmovdn	%icc,	%f21,	%f20
	taddcctv	%l1,	0x1C83,	%g3
	addc	%i0,	%g2,	%g4
	fandnot2	%f16,	%f4,	%f10
	edge8n	%o0,	%g6,	%i4
	fmovsge	%icc,	%f12,	%f31
	smulcc	%l4,	0x1F31,	%l2
	tg	%icc,	0x2
	movg	%xcc,	%o1,	%g7
	xnorcc	%i7,	%l0,	%o5
	movvs	%icc,	%i3,	%o4
	or	%i1,	0x03BA,	%o7
	fmovsge	%xcc,	%f4,	%f20
	be,a,pt	%icc,	loop_1723
	edge32n	%l3,	%o6,	%l6
	set	0x48, %g2
	ldswa	[%l7 + %g2] 0x0c,	%i6
loop_1723:
	fmovscs	%xcc,	%f28,	%f17
	brgz,a	%i2,	loop_1724
	fmovsgu	%icc,	%f9,	%f14
	fors	%f4,	%f6,	%f1
	subc	%o2,	0x1793,	%g1
loop_1724:
	array16	%o3,	%g5,	%i5
	movl	%icc,	%l5,	%g3
	sth	%i0,	[%l7 + 0x1C]
	xorcc	%g2,	0x0546,	%g4
	brnz,a	%o0,	loop_1725
	sll	%g6,	%l1,	%l4
	movrgz	%i4,	0x232,	%o1
	fexpand	%f10,	%f2
loop_1725:
	taddcc	%g7,	%l2,	%i7
	subcc	%l0,	%i3,	%o4
	fmovrsne	%o5,	%f26,	%f17
	tcs	%icc,	0x3
	edge8ln	%o7,	%i1,	%l3
	sllx	%l6,	%o6,	%i6
	fandnot2s	%f18,	%f25,	%f13
	fmovs	%f12,	%f29
	movrne	%i2,	%o2,	%g1
	movre	%g5,	%i5,	%o3
	sllx	%l5,	0x00,	%i0
	movrlz	%g2,	0x3F6,	%g3
	fbule,a	%fcc1,	loop_1726
	fmovdvc	%xcc,	%f10,	%f31
	fcmple32	%f26,	%f26,	%o0
	fbn,a	%fcc0,	loop_1727
loop_1726:
	movcc	%xcc,	%g6,	%g4
	ta	%icc,	0x6
	srlx	%l1,	%i4,	%l4
loop_1727:
	udivx	%o1,	0x17C4,	%g7
	stbar
	fmovd	%f4,	%f18
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%i7,	%l0
	fabss	%f20,	%f20
	fpackfix	%f30,	%f18
	tgu	%icc,	0x1
	addc	%l2,	%i3,	%o4
	srl	%o5,	%o7,	%l3
	brnz	%l6,	loop_1728
	fmovrde	%o6,	%f2,	%f16
	bneg	loop_1729
	edge8	%i6,	%i1,	%i2
loop_1728:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc3,	loop_1730
loop_1729:
	fors	%f19,	%f3,	%f9
	set	0x18, %g6
	prefetcha	[%l7 + %g6] 0x11,	 0x3
loop_1730:
	flush	%l7 + 0x4C
	edge8l	%g5,	%g1,	%i5
	fmovdvs	%icc,	%f29,	%f18
	set	0x71, %l4
	ldstuba	[%l7 + %l4] 0x0c,	%o3
	edge8	%l5,	%i0,	%g2
	stx	%o0,	[%l7 + 0x10]
	brnz	%g3,	loop_1731
	edge32ln	%g6,	%g4,	%i4
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l4,	%o1
loop_1731:
	fnand	%f26,	%f0,	%f10
	sir	0x0F6B
	movvs	%icc,	%g7,	%i7
	movneg	%xcc,	%l0,	%l1
	bneg,pt	%xcc,	loop_1732
	fcmpd	%fcc2,	%f10,	%f30
	fmovsa	%xcc,	%f10,	%f13
	and	%l2,	%i3,	%o5
loop_1732:
	fornot2s	%f22,	%f22,	%f30
	wr	%g0,	0x2f,	%asi
	stha	%o4,	[%l7 + 0x3E] %asi
	membar	#Sync
	ldstub	[%l7 + 0x6E],	%l3
	stw	%o7,	[%l7 + 0x18]
	sllx	%o6,	0x13,	%l6
	xor	%i6,	0x1CF5,	%i2
	subc	%o2,	%i1,	%g1
	bvc	loop_1733
	tsubcctv	%g5,	%i5,	%l5
	fand	%f6,	%f8,	%f28
	array8	%o3,	%g2,	%i0
loop_1733:
	call	loop_1734
	taddcctv	%o0,	0x1013,	%g6
	fbge	%fcc0,	loop_1735
	fpsub16s	%f15,	%f30,	%f27
loop_1734:
	lduw	[%l7 + 0x68],	%g4
	mulx	%i4,	%g3,	%o1
loop_1735:
	fmovsl	%icc,	%f4,	%f14
	ldsw	[%l7 + 0x5C],	%l4
	fnand	%f2,	%f2,	%f22
	set	0x10, %i4
	stxa	%g7,	[%l7 + %i4] 0x0c
	fbul	%fcc1,	loop_1736
	brlez	%l0,	loop_1737
	tcc	%icc,	0x0
	bcc,a	%icc,	loop_1738
loop_1736:
	movcs	%icc,	%l1,	%l2
loop_1737:
	tne	%icc,	0x7
	umulcc	%i3,	0x113E,	%o5
loop_1738:
	fmovsgu	%xcc,	%f10,	%f22
	brz	%i7,	loop_1739
	alignaddr	%l3,	%o4,	%o7
	bcc	%xcc,	loop_1740
	tcc	%xcc,	0x0
loop_1739:
	edge32l	%l6,	%i6,	%o6
	edge16l	%o2,	%i2,	%i1
loop_1740:
	xor	%g5,	0x0D11,	%i5
	tn	%icc,	0x3
	fcmpd	%fcc1,	%f8,	%f26
	wr	%g0,	0x2a,	%asi
	stda	%l4,	[%l7 + 0x50] %asi
	membar	#Sync
	popc	%o3,	%g1
	fmovrsgez	%g2,	%f7,	%f3
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
	bneg,pt	%xcc,	loop_1742
	xnorcc	%i0,	0x014C,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1741:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x09] %asi,	%g6
loop_1742:
	sll	%g4,	0x03,	%g3
	addcc	%o1,	0x1121,	%l4
	ble,pt	%icc,	loop_1743
	nop
	setx	loop_1744,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%g7,	%l0,	%l1
	tg	%icc,	0x3
loop_1743:
	movneg	%icc,	%l2,	%i3
loop_1744:
	movn	%icc,	%i4,	%o5
	fbul	%fcc1,	loop_1745
	popc	0x159C,	%i7
	tgu	%xcc,	0x5
	faligndata	%f8,	%f14,	%f4
loop_1745:
	mulx	%l3,	%o7,	%o4
	fmovrse	%l6,	%f28,	%f6
	fble,a	%fcc2,	loop_1746
	tneg	%xcc,	0x6
	tvs	%icc,	0x3
	movleu	%icc,	%o6,	%o2
loop_1746:
	srax	%i2,	0x05,	%i6
	movre	%i1,	0x15F,	%g5
	pdist	%f4,	%f22,	%f10
	smulcc	%i5,	0x0B0A,	%o3
	set	0x60, %g5
	stwa	%g1,	[%l7 + %g5] 0x23
	membar	#Sync
	sir	0x042C
	edge32	%g2,	%l5,	%i0
	tne	%xcc,	0x7
	alignaddrl	%g6,	%g4,	%g3
	array16	%o0,	%l4,	%g7
	bne,pt	%xcc,	loop_1747
	bvc	loop_1748
	andncc	%l0,	%l1,	%l2
	fmovrdgz	%i3,	%f6,	%f6
loop_1747:
	brlz,a	%o1,	loop_1749
loop_1748:
	movl	%xcc,	%o5,	%i7
	fblg,a	%fcc0,	loop_1750
	fpsub32s	%f31,	%f25,	%f26
loop_1749:
	lduw	[%l7 + 0x44],	%l3
	fcmple32	%f10,	%f26,	%o7
loop_1750:
	movvs	%icc,	%o4,	%i4
	tcs	%icc,	0x7
	nop
	setx loop_1751, %l0, %l1
	jmpl %l1, %o6
	movle	%icc,	%l6,	%o2
	ba,a	%xcc,	loop_1752
	edge16n	%i6,	%i1,	%g5
loop_1751:
	sdivx	%i5,	0x092C,	%o3
	fmovsvc	%icc,	%f6,	%f16
loop_1752:
	edge8ln	%i2,	%g2,	%l5
	tcs	%icc,	0x3
	addcc	%i0,	0x0A7B,	%g1
	movpos	%xcc,	%g4,	%g3
	movpos	%icc,	%g6,	%o0
	fcmpne16	%f18,	%f6,	%g7
	fabsd	%f4,	%f30
	fand	%f0,	%f0,	%f2
	bn,pn	%xcc,	loop_1753
	alignaddrl	%l0,	%l4,	%l1
	ldub	[%l7 + 0x5E],	%l2
	sra	%i3,	0x1A,	%o1
loop_1753:
	nop
	set	0x18, %g4
	sta	%f18,	[%l7 + %g4] 0x15
	flush	%l7 + 0x48
	srax	%o5,	%l3,	%o7
	udivx	%o4,	0x0E51,	%i4
	edge8ln	%o6,	%i7,	%l6
	edge16	%i6,	%o2,	%g5
	lduh	[%l7 + 0x64],	%i5
	sir	0x1DED
	tneg	%xcc,	0x3
	array8	%o3,	%i2,	%g2
	movl	%icc,	%i1,	%l5
	nop
	set	0x58, %i1
	stx	%i0,	[%l7 + %i1]
	tneg	%icc,	0x4
	stw	%g4,	[%l7 + 0x10]
	umulcc	%g1,	%g3,	%g6
	tle	%icc,	0x3
	movcs	%icc,	%g7,	%l0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o0,	%l4
	smul	%l1,	0x17FC,	%l2
	fmovrse	%i3,	%f28,	%f9
	edge8l	%o5,	%o1,	%o7
	movge	%xcc,	%o4,	%i4
	taddcctv	%l3,	0x049D,	%o6
	sub	%l6,	0x1514,	%i6
	orn	%i7,	%g5,	%o2
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x88
	fble,a	%fcc2,	loop_1754
	edge8l	%o3,	%i5,	%g2
	andncc	%i2,	%l5,	%i0
	smulcc	%g4,	%i1,	%g3
loop_1754:
	movge	%icc,	%g6,	%g1
	tvs	%icc,	0x4
	bn,pt	%icc,	loop_1755
	orcc	%g7,	%l0,	%l4
	sethi	0x09A1,	%l1
	sra	%o0,	%l2,	%o5
loop_1755:
	srl	%o1,	%o7,	%o4
	sub	%i3,	%l3,	%i4
	alignaddrl	%o6,	%i6,	%l6
	and	%i7,	%o2,	%g5
	fornot2	%f2,	%f10,	%f20
	fmul8ulx16	%f0,	%f28,	%f14
	movne	%xcc,	%i5,	%o3
	fbn	%fcc2,	loop_1756
	andcc	%g2,	0x00B9,	%l5
	movpos	%xcc,	%i0,	%g4
	edge32	%i2,	%i1,	%g6
loop_1756:
	or	%g3,	%g1,	%l0
	movg	%icc,	%l4,	%l1
	subccc	%o0,	%g7,	%o5
	wr	%g0,	0x80,	%asi
	stxa	%o1,	[%l7 + 0x40] %asi
	orncc	%o7,	%l2,	%o4
	xnorcc	%i3,	0x0651,	%l3
	prefetch	[%l7 + 0x2C],	 0x1
	tne	%icc,	0x7
	andn	%i4,	%i6,	%o6
	tne	%icc,	0x3
	sll	%i7,	%o2,	%l6
	movn	%xcc,	%g5,	%i5
	fmovdle	%icc,	%f30,	%f23
	ldsh	[%l7 + 0x08],	%g2
	move	%icc,	%l5,	%o3
	addcc	%g4,	%i2,	%i1
	fmovdvc	%icc,	%f23,	%f5
	lduw	[%l7 + 0x68],	%g6
	bcs,pn	%icc,	loop_1757
	fnand	%f26,	%f28,	%f20
	ldsw	[%l7 + 0x3C],	%i0
	fpsub32	%f26,	%f22,	%f14
loop_1757:
	fbo,a	%fcc0,	loop_1758
	edge32l	%g3,	%l0,	%g1
	movn	%icc,	%l1,	%l4
	fmovsneg	%icc,	%f0,	%f18
loop_1758:
	bgu,pn	%icc,	loop_1759
	andcc	%o0,	0x00F1,	%o5
	array32	%o1,	%g7,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1759:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x28],	%o4
	sethi	0x162C,	%i3
	tcs	%icc,	0x3
	xnor	%l2,	0x03EF,	%l3
	fmul8ulx16	%f28,	%f28,	%f4
	fmovsg	%xcc,	%f30,	%f0
	alignaddr	%i4,	%o6,	%i6
	udivcc	%o2,	0x0F1D,	%l6
	bgu	%xcc,	loop_1760
	ble,a,pn	%xcc,	loop_1761
	tvs	%icc,	0x1
	ble,a,pt	%xcc,	loop_1762
loop_1760:
	ble,a,pt	%icc,	loop_1763
loop_1761:
	tl	%xcc,	0x4
	edge32l	%g5,	%i5,	%g2
loop_1762:
	ble	%icc,	loop_1764
loop_1763:
	tle	%xcc,	0x4
	fmovrde	%i7,	%f18,	%f16
	fbn,a	%fcc2,	loop_1765
loop_1764:
	sra	%o3,	0x1F,	%l5
	fba	%fcc1,	loop_1766
	sir	0x1D23
loop_1765:
	nop
	wr	%g0,	0xe3,	%asi
	stxa	%g4,	[%l7 + 0x28] %asi
	membar	#Sync
loop_1766:
	nop
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i1,	%i0,	%g3
	move	%xcc,	%l0,	%g6
	nop
	set	0x54, %i3
	ldsh	[%l7 + %i3],	%g1
	tne	%icc,	0x5
	lduh	[%l7 + 0x6A],	%l1
	udivcc	%l4,	0x1BFB,	%o5
	wr	%g0,	0xe3,	%asi
	stwa	%o1,	[%l7 + 0x48] %asi
	membar	#Sync
	add	%g7,	%o0,	%o4
	set	0x6C, %i6
	ldswa	[%l7 + %i6] 0x89,	%i3
	fbl	%fcc2,	loop_1767
	mova	%icc,	%l2,	%l3
	umul	%o7,	%i4,	%o6
	subcc	%o2,	%i6,	%l6
loop_1767:
	fmovs	%f30,	%f26
	ldsb	[%l7 + 0x3F],	%i5
	ldd	[%l7 + 0x68],	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%i7,	%o3
	set	0x20, %o1
	lduwa	[%l7 + %o1] 0x88,	%g2
	sir	0x0661
	movrlez	%g4,	%i2,	%i1
	fone	%f0
	movneg	%xcc,	%i0,	%l5
	tge	%xcc,	0x2
	sdivx	%g3,	0x1856,	%g6
	set	0x38, %l3
	lduwa	[%l7 + %l3] 0x11,	%g1
	sdivcc	%l1,	0x1EE6,	%l0
	ldd	[%l7 + 0x68],	%o4
	edge8ln	%l4,	%g7,	%o0
	edge8n	%o4,	%o1,	%l2
	fmovsl	%xcc,	%f23,	%f11
	tcc	%icc,	0x5
	xnor	%l3,	%o7,	%i3
	subc	%o6,	%o2,	%i6
	movvc	%xcc,	%i4,	%i5
	andn	%l6,	%g5,	%i7
	fmovse	%icc,	%f5,	%f10
	movl	%icc,	%g2,	%g4
	fcmped	%fcc1,	%f14,	%f20
	fpadd16	%f20,	%f4,	%f20
	brgez,a	%o3,	loop_1768
	movleu	%icc,	%i2,	%i1
	sllx	%l5,	%i0,	%g3
	stx	%g1,	[%l7 + 0x50]
loop_1768:
	bvs	loop_1769
	membar	0x06
	fbuge,a	%fcc2,	loop_1770
	umul	%l1,	%g6,	%l0
loop_1769:
	xorcc	%l4,	%o5,	%g7
	fpadd16	%f8,	%f12,	%f20
loop_1770:
	bleu,a,pt	%xcc,	loop_1771
	array16	%o4,	%o0,	%o1
	movrlz	%l3,	0x26D,	%l2
	movrgz	%o7,	%o6,	%o2
loop_1771:
	sub	%i3,	0x17FD,	%i4
	edge8n	%i6,	%i5,	%l6
	umul	%i7,	0x13FA,	%g2
	popc	0x154D,	%g5
	movleu	%icc,	%o3,	%i2
	fmovsa	%icc,	%f12,	%f26
	sllx	%i1,	0x0C,	%l5
	and	%i0,	0x0134,	%g3
	fba	%fcc3,	loop_1772
	for	%f12,	%f2,	%f14
	subccc	%g1,	0x05F9,	%l1
	movrlz	%g6,	%g4,	%l0
loop_1772:
	nop
	set	0x78, %l6
	ldswa	[%l7 + %l6] 0x0c,	%l4
	tle	%xcc,	0x5
	fmovrsgz	%g7,	%f5,	%f24
	array8	%o4,	%o5,	%o1
	tle	%icc,	0x7
	st	%f5,	[%l7 + 0x4C]
	umulcc	%l3,	0x1196,	%l2
	mova	%xcc,	%o7,	%o6
	sethi	0x1BB9,	%o2
	srax	%o0,	0x12,	%i3
	movvc	%icc,	%i6,	%i4
	xnorcc	%l6,	0x003F,	%i7
	movrgez	%g2,	%g5,	%i5
	ldsb	[%l7 + 0x3B],	%o3
	fzero	%f4
	stb	%i2,	[%l7 + 0x5A]
	movrgez	%l5,	%i0,	%g3
	xorcc	%g1,	%l1,	%i1
	fbg,a	%fcc0,	loop_1773
	mulx	%g6,	%l0,	%g4
	bg,pt	%icc,	loop_1774
	sra	%l4,	0x15,	%g7
loop_1773:
	fblg,a	%fcc0,	loop_1775
	sll	%o5,	%o1,	%l3
loop_1774:
	ble,a	%icc,	loop_1776
	fmovdleu	%xcc,	%f17,	%f7
loop_1775:
	movpos	%icc,	%l2,	%o7
	edge16ln	%o6,	%o2,	%o0
loop_1776:
	fornot1	%f18,	%f26,	%f12
	tcs	%xcc,	0x2
	movrlz	%o4,	0x264,	%i3
	movneg	%icc,	%i4,	%l6
	fnot1s	%f24,	%f31
	fmovse	%xcc,	%f12,	%f23
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movrlez	%i7,	%i6,	%g5
	tvs	%icc,	0x0
	subc	%g2,	0x1A9F,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i2
	orcc	%i5,	%l5,	%i0
	set	0x18, %o6
	stda	%g0,	[%l7 + %o6] 0xe3
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%g3,	%l1
	fcmpes	%fcc2,	%f19,	%f21
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x04
	srlx	%g6,	%l0,	%g4
	srax	%i1,	0x09,	%l4
	bcc,pt	%xcc,	loop_1777
	udivx	%g7,	0x0803,	%o1
	fbuge,a	%fcc3,	loop_1778
	add	%l3,	%o5,	%o7
loop_1777:
	fxors	%f28,	%f26,	%f15
	fblg,a	%fcc0,	loop_1779
loop_1778:
	addccc	%o6,	%l2,	%o2
	smul	%o4,	0x0A04,	%o0
	call	loop_1780
loop_1779:
	sethi	0x1E58,	%i4
	subcc	%i3,	0x0B77,	%i7
	alignaddr	%l6,	%g5,	%g2
loop_1780:
	fornot1s	%f11,	%f15,	%f27
	fornot1	%f30,	%f30,	%f0
	mova	%xcc,	%o3,	%i2
	ta	%xcc,	0x5
	xor	%i5,	0x1962,	%i6
	for	%f2,	%f22,	%f20
	fpadd32s	%f9,	%f17,	%f21
	set	0x08, %o7
	lda	[%l7 + %o7] 0x81,	%f9
	udivx	%i0,	0x0C7C,	%g1
	bgu,a	loop_1781
	edge16ln	%l5,	%g3,	%l1
	fabsd	%f0,	%f4
	fmovrsne	%l0,	%f15,	%f29
loop_1781:
	tn	%icc,	0x6
	fmuld8ulx16	%f3,	%f16,	%f4
	ldsh	[%l7 + 0x4E],	%g6
	fzeros	%f7
	bne,pn	%icc,	loop_1782
	sdivx	%g4,	0x16DC,	%l4
	udiv	%g7,	0x1EFC,	%i1
	tcs	%xcc,	0x1
loop_1782:
	sll	%l3,	%o1,	%o7
	sll	%o6,	%l2,	%o2
	mulscc	%o5,	%o0,	%o4
	tn	%icc,	0x0
	tvs	%icc,	0x5
	mova	%icc,	%i3,	%i4
	fmovsvs	%xcc,	%f24,	%f22
	fornot2s	%f28,	%f27,	%f22
	set	0x58, %l2
	lduwa	[%l7 + %l2] 0x10,	%i7
	fnand	%f30,	%f30,	%f22
	ld	[%l7 + 0x4C],	%f28
	fsrc1	%f14,	%f6
	fmovdvc	%xcc,	%f25,	%f13
	fbne,a	%fcc1,	loop_1783
	tneg	%icc,	0x4
	membar	0x60
	movre	%g5,	%l6,	%g2
loop_1783:
	fnot1s	%f22,	%f14
	array32	%o3,	%i5,	%i2
	stb	%i6,	[%l7 + 0x36]
	fcmple32	%f18,	%f0,	%i0
	xor	%g1,	0x0ABA,	%l5
	edge32n	%g3,	%l1,	%g6
	siam	0x0
	fpsub32s	%f25,	%f1,	%f28
	movpos	%icc,	%g4,	%l4
	fones	%f1
	movrlez	%g7,	%l0,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%o1,	%f16,	%f21
	andn	%o7,	0x0089,	%o6
	sra	%l3,	0x03,	%o2
	wr	%g0,	0xe2,	%asi
	stwa	%l2,	[%l7 + 0x70] %asi
	membar	#Sync
	movrlz	%o0,	%o4,	%i3
	bn,pt	%icc,	loop_1784
	fmovscs	%icc,	%f10,	%f9
	udiv	%o5,	0x046F,	%i4
	xor	%g5,	0x06C1,	%l6
loop_1784:
	fnors	%f23,	%f10,	%f8
	set	0x18, %l1
	stxa	%g2,	[%g0 + %l1] 0x4f
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o3,	%i5
	sdiv	%i2,	0x0AE8,	%i6
	sir	0x1EBA
	edge16ln	%i7,	%i0,	%l5
	sethi	0x17EC,	%g3
	udivx	%l1,	0x0F0B,	%g1
	fands	%f22,	%f22,	%f14
	add	%g4,	%l4,	%g6
	subc	%g7,	%i1,	%l0
	udivcc	%o1,	0x0804,	%o6
	bleu,pn	%xcc,	loop_1785
	and	%o7,	0x0BA4,	%l3
	fornot2s	%f18,	%f25,	%f12
	addcc	%o2,	%o0,	%l2
loop_1785:
	ldd	[%l7 + 0x68],	%f6
	sdivcc	%o4,	0x0F8C,	%o5
	bcs	loop_1786
	be,a,pt	%xcc,	loop_1787
	bne,pn	%xcc,	loop_1788
	sethi	0x0C1F,	%i3
loop_1786:
	sir	0x007F
loop_1787:
	fbg,a	%fcc3,	loop_1789
loop_1788:
	fors	%f13,	%f17,	%f3
	tcs	%xcc,	0x7
	faligndata	%f20,	%f18,	%f14
loop_1789:
	andn	%g5,	0x0817,	%i4
	tleu	%xcc,	0x6
	edge8l	%g2,	%o3,	%i5
	brz,a	%i2,	loop_1790
	fabss	%f8,	%f11
	tgu	%icc,	0x0
	fcmpeq32	%f8,	%f16,	%l6
loop_1790:
	sir	0x05A4
	movcc	%xcc,	%i6,	%i0
	fornot2	%f26,	%f16,	%f0
	addccc	%i7,	0x031F,	%g3
	fpadd32	%f4,	%f22,	%f4
	bn,pt	%icc,	loop_1791
	array16	%l5,	%l1,	%g4
	xnor	%g1,	%l4,	%g7
	movneg	%xcc,	%i1,	%g6
loop_1791:
	tvc	%xcc,	0x2
	tcs	%xcc,	0x5
	fmovrdne	%o1,	%f2,	%f22
	fnands	%f7,	%f29,	%f24
	bcs	%xcc,	loop_1792
	fpadd32s	%f12,	%f27,	%f16
	ldd	[%l7 + 0x70],	%f18
	fmovdgu	%xcc,	%f25,	%f21
loop_1792:
	fmovda	%icc,	%f4,	%f3
	popc	0x0C41,	%o6
	ldsw	[%l7 + 0x30],	%l0
	edge32ln	%l3,	%o7,	%o2
	set	0x36, %g1
	stha	%l2,	[%l7 + %g1] 0x11
	tl	%icc,	0x2
	edge32n	%o4,	%o0,	%o5
	fbue	%fcc1,	loop_1793
	edge16n	%g5,	%i3,	%g2
	ldsb	[%l7 + 0x22],	%o3
	fmovdcs	%icc,	%f16,	%f0
loop_1793:
	sir	0x1560
	alignaddr	%i5,	%i4,	%l6
	fbule,a	%fcc1,	loop_1794
	sdiv	%i2,	0x0036,	%i6
	bgu,a,pt	%icc,	loop_1795
	movl	%xcc,	%i7,	%i0
loop_1794:
	ldsb	[%l7 + 0x7D],	%l5
	movrne	%g3,	0x22B,	%l1
loop_1795:
	mulx	%g4,	0x13D4,	%l4
	set	0x78, %g7
	stda	%g6,	[%l7 + %g7] 0x2b
	membar	#Sync
	tl	%icc,	0x2
	array16	%i1,	%g6,	%o1
	addc	%g1,	%o6,	%l0
	tne	%xcc,	0x5
	orncc	%l3,	%o7,	%l2
	and	%o2,	0x1869,	%o4
	tg	%xcc,	0x0
	nop
	set	0x71, %o5
	ldsb	[%l7 + %o5],	%o0
	tsubcc	%o5,	%i3,	%g2
	ld	[%l7 + 0x18],	%f2
	movrgz	%g5,	%o3,	%i4
	xnorcc	%i5,	0x0F8A,	%l6
	fnegs	%f20,	%f17
	fbge,a	%fcc3,	loop_1796
	fnors	%f11,	%f6,	%f13
	tl	%icc,	0x2
	andncc	%i6,	%i2,	%i7
loop_1796:
	bg,a,pt	%icc,	loop_1797
	fand	%f14,	%f18,	%f4
	tn	%icc,	0x5
	fble	%fcc2,	loop_1798
loop_1797:
	sethi	0x0974,	%l5
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x60] %asi,	%g2
loop_1798:
	edge8ln	%i0,	%l1,	%l4
	popc	0x0030,	%g7
	nop
	set	0x4C, %i0
	ldsb	[%l7 + %i0],	%g4
	te	%xcc,	0x4
	fmovscs	%xcc,	%f2,	%f24
	fornot1s	%f31,	%f18,	%f23
	bvs,a,pn	%icc,	loop_1799
	srax	%g6,	0x0C,	%o1
	fmovdpos	%xcc,	%f9,	%f23
	movrne	%g1,	0x066,	%o6
loop_1799:
	orcc	%i1,	0x0289,	%l0
	umulcc	%l3,	0x1A89,	%l2
	fmul8x16	%f7,	%f18,	%f28
	subcc	%o7,	%o4,	%o0
	movcc	%icc,	%o2,	%o5
	bcc,a,pn	%xcc,	loop_1800
	fbul	%fcc0,	loop_1801
	udivcc	%g2,	0x1C1B,	%g5
	subccc	%i3,	0x0559,	%o3
loop_1800:
	mova	%xcc,	%i4,	%i5
loop_1801:
	fmovsgu	%icc,	%f5,	%f7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x35] %asi,	%i6
	movne	%xcc,	%i2,	%l6
	fmovrslz	%i7,	%f25,	%f20
	fbuge,a	%fcc3,	loop_1802
	nop
	setx	loop_1803,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xorcc	%g3,	0x19B6,	%l5
	fxnors	%f31,	%f11,	%f21
loop_1802:
	movrne	%l1,	%l4,	%i0
loop_1803:
	edge16ln	%g7,	%g6,	%g4
	wr	%g0,	0x19,	%asi
	stha	%g1,	[%l7 + 0x18] %asi
	ble	%icc,	loop_1804
	andncc	%o1,	%i1,	%l0
	mova	%icc,	%l3,	%l2
	fnors	%f9,	%f6,	%f9
loop_1804:
	nop
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x19
	fmovdneg	%icc,	%f13,	%f6
	set	0x0F, %l5
	stba	%o6,	[%l7 + %l5] 0x23
	membar	#Sync
	bleu,a	loop_1805
	tgu	%xcc,	0x1
	fmovdvs	%xcc,	%f28,	%f28
	fnot1s	%f17,	%f18
loop_1805:
	movpos	%xcc,	%o7,	%o4
	be,a	%icc,	loop_1806
	sethi	0x18C3,	%o2
	edge32l	%o5,	%o0,	%g2
	taddcctv	%g5,	0x1AAC,	%i3
loop_1806:
	bleu,pn	%icc,	loop_1807
	tsubcc	%o3,	%i4,	%i6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7F] %asi,	%i2
loop_1807:
	tneg	%xcc,	0x0
	andcc	%l6,	0x0906,	%i5
	alignaddr	%g3,	%i7,	%l5
	bg,a,pn	%icc,	loop_1808
	sdiv	%l4,	0x1457,	%i0
	flush	%l7 + 0x48
	movneg	%xcc,	%l1,	%g7
loop_1808:
	sdivx	%g6,	0x1FBE,	%g1
	fand	%f12,	%f2,	%f0
	umul	%o1,	%g4,	%l0
	bcc,a,pn	%xcc,	loop_1809
	addcc	%i1,	0x0BA1,	%l3
	membar	0x78
	fbule,a	%fcc0,	loop_1810
loop_1809:
	tle	%xcc,	0x3
	movrlz	%o6,	0x27B,	%l2
	srlx	%o4,	0x12,	%o7
loop_1810:
	tn	%xcc,	0x1
	movle	%icc,	%o5,	%o0
	taddcc	%o2,	%g2,	%i3
	fbu,a	%fcc3,	loop_1811
	edge32n	%g5,	%o3,	%i6
	popc	%i2,	%l6
	udiv	%i4,	0x130F,	%i5
loop_1811:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x7F] %asi,	%g3
	ba,pt	%xcc,	loop_1812
	orncc	%l5,	0x0CBA,	%l4
	movcc	%icc,	%i7,	%i0
	movg	%icc,	%g7,	%g6
loop_1812:
	ta	%xcc,	0x7
	wr	%g0,	0x88,	%asi
	sta	%f29,	[%l7 + 0x28] %asi
	fpsub32s	%f16,	%f21,	%f26
	fbe,a	%fcc2,	loop_1813
	bvs	%xcc,	loop_1814
	bleu,a	%xcc,	loop_1815
	subcc	%l1,	0x0C1F,	%g1
loop_1813:
	movcc	%xcc,	%g4,	%l0
loop_1814:
	tge	%icc,	0x5
loop_1815:
	tvc	%xcc,	0x3
	sllx	%i1,	0x02,	%o1
	tcs	%xcc,	0x0
	sdivx	%o6,	0x1DA8,	%l3
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o4
	fmovda	%xcc,	%f26,	%f6
	fandnot1s	%f22,	%f7,	%f0
	ldsh	[%l7 + 0x3C],	%l2
	fmovdn	%xcc,	%f9,	%f2
	fmovdl	%icc,	%f3,	%f9
	smul	%o5,	%o7,	%o0
	fone	%f20
	smulcc	%o2,	%i3,	%g5
	array8	%o3,	%g2,	%i2
	tle	%icc,	0x5
	bg,a,pn	%xcc,	loop_1816
	addcc	%l6,	0x0821,	%i6
	andcc	%i5,	%i4,	%l5
	fcmpgt32	%f30,	%f22,	%l4
loop_1816:
	bcs,a	%icc,	loop_1817
	fnot1	%f20,	%f28
	mulscc	%i7,	%g3,	%i0
	tsubcctv	%g7,	%g6,	%g1
loop_1817:
	fxor	%f22,	%f30,	%f2
	move	%xcc,	%l1,	%g4
	ba,a,pn	%icc,	loop_1818
	subccc	%l0,	%o1,	%o6
	taddcc	%i1,	0x0D0A,	%l3
	xnor	%l2,	0x080D,	%o5
loop_1818:
	mulscc	%o4,	%o0,	%o7
	ta	%xcc,	0x6
	srlx	%o2,	0x16,	%i3
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x14] %asi,	%o3
	orn	%g5,	0x1C38,	%i2
	fnor	%f0,	%f2,	%f10
	move	%xcc,	%g2,	%l6
	siam	0x2
	ba,pt	%xcc,	loop_1819
	fpmerge	%f0,	%f26,	%f4
	bvc,a,pt	%icc,	loop_1820
	sll	%i6,	0x0C,	%i4
loop_1819:
	taddcc	%l5,	0x01CB,	%l4
	movl	%xcc,	%i7,	%g3
loop_1820:
	sdiv	%i5,	0x03A1,	%i0
	udiv	%g6,	0x0E4F,	%g7
	smulcc	%g1,	0x0B00,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge	%xcc,	loop_1821
	movcs	%xcc,	%l1,	%o1
	smul	%l0,	0x0FC8,	%o6
	movle	%icc,	%l3,	%i1
loop_1821:
	tgu	%icc,	0x5
	sdivcc	%o5,	0x0B18,	%o4
	fmovdcc	%icc,	%f27,	%f19
	nop
	setx	loop_1822,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_1823,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	set	0x60, %o3
	stx	%l2,	[%l7 + %o3]
	edge16ln	%o7,	%o0,	%i3
loop_1822:
	nop
	set	0x7C, %l0
	stba	%o2,	[%l7 + %l0] 0x2a
	membar	#Sync
loop_1823:
	ta	%xcc,	0x0
	edge32n	%o3,	%i2,	%g5
	nop
	set	0x2C, %i7
	prefetch	[%l7 + %i7],	 0x3
	fands	%f10,	%f9,	%f23
	orn	%l6,	%g2,	%i4
	movle	%icc,	%i6,	%l5
	array32	%l4,	%i7,	%i5
	bvs,pn	%icc,	loop_1824
	fcmpgt32	%f22,	%f12,	%i0
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x0c
loop_1824:
	sdiv	%g6,	0x1B9F,	%g3
	fsrc2s	%f16,	%f15
	movrlez	%g1,	0x335,	%g7
	subc	%l1,	0x13DE,	%o1
	fmovrdgz	%l0,	%f0,	%f12
	tneg	%xcc,	0x4
	smulcc	%g4,	%o6,	%i1
	fmovsvs	%icc,	%f8,	%f0
	xnor	%l3,	%o5,	%o4
	movgu	%xcc,	%l2,	%o7
	xorcc	%o0,	0x0003,	%i3
	edge8l	%o3,	%i2,	%o2
	set	0x2A, %o0
	lduha	[%l7 + %o0] 0x88,	%g5
	udivx	%g2,	0x1DEE,	%l6
	fbu,a	%fcc0,	loop_1825
	andncc	%i6,	%l5,	%l4
	mulx	%i7,	%i4,	%i0
	fbule,a	%fcc3,	loop_1826
loop_1825:
	andcc	%i5,	%g6,	%g3
	fmovsleu	%icc,	%f19,	%f26
	tvc	%xcc,	0x3
loop_1826:
	fmovdle	%icc,	%f4,	%f29
	fnegs	%f23,	%f3
	fmovrdlez	%g1,	%f12,	%f20
	fmovdn	%icc,	%f22,	%f26
	movrgz	%g7,	0x2D3,	%o1
	nop
	set	0x2A, %g2
	ldstub	[%l7 + %g2],	%l0
	movne	%icc,	%l1,	%o6
	sdivx	%g4,	0x1147,	%i1
	mova	%icc,	%o5,	%l3
	brlz	%l2,	loop_1827
	movvs	%icc,	%o7,	%o0
	tne	%icc,	0x4
	addcc	%o4,	%i3,	%o3
loop_1827:
	array16	%o2,	%g5,	%i2
	fsrc2	%f12,	%f24
	xnorcc	%l6,	%g2,	%i6
	fmovrsgez	%l4,	%f31,	%f9
	sdivx	%i7,	0x0B05,	%i4
	sllx	%i0,	%i5,	%g6
	brnz,a	%g3,	loop_1828
	stbar
	tge	%icc,	0x5
	lduh	[%l7 + 0x6A],	%l5
loop_1828:
	fmovrdlez	%g7,	%f28,	%f0
	addccc	%g1,	0x1857,	%l0
	fbu,a	%fcc2,	loop_1829
	movrne	%l1,	%o1,	%g4
	orcc	%i1,	%o6,	%l3
	mova	%xcc,	%o5,	%l2
loop_1829:
	xor	%o0,	0x01D0,	%o4
	fxnor	%f26,	%f24,	%f0
	nop
	setx	loop_1830,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrne	%i3,	%o7,	%o2
	sub	%g5,	0x1718,	%i2
	xor	%l6,	%g2,	%i6
loop_1830:
	fcmps	%fcc3,	%f8,	%f10
	tsubcc	%o3,	%i7,	%i4
	stw	%i0,	[%l7 + 0x14]
	movvc	%icc,	%l4,	%i5
	tneg	%icc,	0x2
	edge32	%g6,	%l5,	%g7
	fpackfix	%f10,	%f24
	popc	%g1,	%g3
	andcc	%l0,	0x02B9,	%o1
	tcs	%xcc,	0x7
	fmovrdgz	%l1,	%f12,	%f16
	or	%i1,	0x006D,	%o6
	sth	%g4,	[%l7 + 0x20]
	movrlez	%l3,	0x272,	%l2
	set	0x51, %g3
	stba	%o0,	[%l7 + %g3] 0x04
	popc	%o4,	%i3
	bne	%xcc,	loop_1831
	movleu	%xcc,	%o7,	%o5
	movl	%icc,	%o2,	%g5
	movrgz	%l6,	0x0CD,	%g2
loop_1831:
	ldsw	[%l7 + 0x58],	%i2
	subcc	%o3,	0x033E,	%i6
	movvc	%xcc,	%i4,	%i0
	fbge	%fcc2,	loop_1832
	edge16ln	%i7,	%l4,	%g6
	stx	%l5,	[%l7 + 0x28]
	xor	%g7,	%g1,	%i5
loop_1832:
	alignaddr	%g3,	%o1,	%l0
	fblg	%fcc2,	loop_1833
	fblg,a	%fcc1,	loop_1834
	fpsub16s	%f21,	%f0,	%f24
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
loop_1833:
	fmovscs	%icc,	%f13,	%f25
loop_1834:
	movcs	%icc,	%o6,	%g4
	brlz	%l3,	loop_1835
	fcmple32	%f2,	%f28,	%l1
	fmovsleu	%icc,	%f16,	%f27
	nop
	setx loop_1836, %l0, %l1
	jmpl %l1, %l2
loop_1835:
	fabss	%f30,	%f7
	xor	%o4,	0x039D,	%i3
	array16	%o7,	%o5,	%o0
loop_1836:
	movge	%icc,	%o2,	%g5
	wr	%g0,	0x80,	%asi
	sta	%f9,	[%l7 + 0x0C] %asi
	fmovs	%f26,	%f12
	bne	%icc,	loop_1837
	call	loop_1838
	tneg	%icc,	0x5
	orcc	%g2,	%i2,	%l6
loop_1837:
	lduw	[%l7 + 0x10],	%o3
loop_1838:
	fmovrdgez	%i6,	%f0,	%f26
	ldub	[%l7 + 0x24],	%i4
	fpadd32	%f18,	%f14,	%f26
	tne	%icc,	0x6
	nop
	setx loop_1839, %l0, %l1
	jmpl %l1, %i7
	prefetch	[%l7 + 0x74],	 0x1
	fbne	%fcc1,	loop_1840
	movrlz	%i0,	%l4,	%l5
loop_1839:
	orncc	%g7,	0x1339,	%g1
	tvc	%icc,	0x6
loop_1840:
	subc	%g6,	0x0BFE,	%i5
	mova	%xcc,	%o1,	%l0
	fbul	%fcc2,	loop_1841
	sra	%g3,	0x1D,	%o6
	fmovsa	%xcc,	%f17,	%f31
	andncc	%i1,	%l3,	%l1
loop_1841:
	taddcctv	%g4,	0x0A22,	%l2
	andncc	%o4,	%i3,	%o5
	edge8n	%o0,	%o7,	%g5
	movrlez	%g2,	%i2,	%l6
	fmovsne	%xcc,	%f24,	%f26
	addccc	%o3,	0x11F9,	%o2
	edge16	%i4,	%i7,	%i6
	array16	%l4,	%l5,	%i0
	umulcc	%g7,	%g6,	%i5
	andcc	%o1,	%g1,	%l0
	nop
	set	0x40, %l4
	std	%f26,	[%l7 + %l4]
	nop
	setx	loop_1842,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%xcc,	0x5
	ld	[%l7 + 0x7C],	%f30
	movrlez	%g3,	%o6,	%l3
loop_1842:
	nop
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x3D] %asi,	%i1
	brz	%l1,	loop_1843
	movrlez	%g4,	%o4,	%i3
	brnz,a	%l2,	loop_1844
	sethi	0x0FB2,	%o0
loop_1843:
	fcmpne32	%f6,	%f24,	%o7
	stb	%o5,	[%l7 + 0x21]
loop_1844:
	movcc	%xcc,	%g5,	%g2
	tn	%xcc,	0x4
	fbule,a	%fcc3,	loop_1845
	fpsub32	%f4,	%f28,	%f30
	set	0x2C, %i4
	swapa	[%l7 + %i4] 0x80,	%i2
loop_1845:
	movneg	%xcc,	%l6,	%o3
	fmovd	%f14,	%f16
	wr	%g0,	0x89,	%asi
	stwa	%o2,	[%l7 + 0x10] %asi
	alignaddrl	%i4,	%i7,	%l4
	movrlez	%i6,	0x238,	%l5
	fmovrdgz	%g7,	%f0,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc3,	%f24,	%f2
	xnor	%g6,	%i5,	%i0
	movle	%icc,	%g1,	%l0
	fcmpgt16	%f16,	%f16,	%o1
	addc	%o6,	%l3,	%g3
	movgu	%xcc,	%l1,	%i1
	bneg	%icc,	loop_1846
	edge32n	%g4,	%o4,	%l2
	set	0x1F, %g6
	ldsba	[%l7 + %g6] 0x15,	%i3
loop_1846:
	edge16n	%o0,	%o7,	%g5
	fmul8x16	%f16,	%f18,	%f18
	fnand	%f16,	%f6,	%f12
	subccc	%o5,	%g2,	%l6
	tneg	%icc,	0x0
	orncc	%i2,	0x0472,	%o3
	sllx	%o2,	0x1A,	%i7
	ba,pn	%icc,	loop_1847
	bvs	%xcc,	loop_1848
	fmovdg	%xcc,	%f20,	%f11
	wr	%g0,	0x80,	%asi
	stba	%l4,	[%l7 + 0x3C] %asi
loop_1847:
	movre	%i6,	0x339,	%l5
loop_1848:
	fexpand	%f26,	%f14
	movgu	%xcc,	%i4,	%g6
	fmovdgu	%icc,	%f8,	%f0
	fmovrde	%i5,	%f20,	%f14
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i0
	smul	%g1,	0x1D9B,	%l0
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x30] %asi,	%o1
	orncc	%o6,	%g7,	%l3
	tpos	%xcc,	0x3
	tcs	%xcc,	0x1
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x20] %asi,	%g3
	movn	%icc,	%i1,	%l1
	movrlez	%g4,	0x208,	%l2
	move	%xcc,	%i3,	%o4
	fxors	%f20,	%f15,	%f6
	sir	0x0BBF
	bshuffle	%f26,	%f16,	%f0
	bpos,pt	%xcc,	loop_1849
	sethi	0x05D5,	%o0
	subc	%o7,	0x0A59,	%o5
	set	0x4F, %g5
	ldsba	[%l7 + %g5] 0x04,	%g5
loop_1849:
	edge8ln	%g2,	%l6,	%o3
	fpack16	%f14,	%f23
	edge16n	%i2,	%i7,	%o2
	edge16l	%l4,	%l5,	%i6
	fmovdl	%xcc,	%f2,	%f2
	brgez	%g6,	loop_1850
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f12,	%f26,	%i4
	fbe	%fcc2,	loop_1851
loop_1850:
	sll	%i5,	0x07,	%g1
	edge16n	%i0,	%o1,	%o6
	fmovdcc	%icc,	%f14,	%f2
loop_1851:
	tn	%xcc,	0x2
	bgu,a	%xcc,	loop_1852
	bn,a	loop_1853
	udivx	%l0,	0x0DAD,	%g7
	fnegs	%f6,	%f7
loop_1852:
	fmovsa	%icc,	%f1,	%f31
loop_1853:
	udivx	%g3,	0x02F8,	%l3
	fnot1s	%f27,	%f9
	fbl	%fcc1,	loop_1854
	ta	%icc,	0x2
	edge32n	%l1,	%i1,	%g4
	pdist	%f0,	%f12,	%f8
loop_1854:
	subccc	%l2,	0x0BE7,	%i3
	and	%o0,	0x0DD6,	%o4
	fmovsneg	%icc,	%f26,	%f7
	tcs	%xcc,	0x3
	taddcctv	%o5,	0x1295,	%o7
	fbuge	%fcc0,	loop_1855
	array32	%g5,	%g2,	%l6
	udivcc	%o3,	0x0161,	%i7
	fsrc2	%f26,	%f6
loop_1855:
	std	%f22,	[%l7 + 0x50]
	edge16	%i2,	%o2,	%l4
	subccc	%l5,	0x1014,	%g6
	andcc	%i4,	%i5,	%g1
	fbu,a	%fcc2,	loop_1856
	fbug	%fcc1,	loop_1857
	bcs,a,pt	%icc,	loop_1858
	fmovrde	%i0,	%f10,	%f6
loop_1856:
	andncc	%i6,	%o1,	%l0
loop_1857:
	addcc	%o6,	0x096D,	%g7
loop_1858:
	movrlz	%l3,	%g3,	%i1
	ble,pn	%xcc,	loop_1859
	brlz,a	%l1,	loop_1860
	ba	loop_1861
	smulcc	%l2,	%g4,	%o0
loop_1859:
	tsubcc	%i3,	0x1F09,	%o5
loop_1860:
	mova	%icc,	%o4,	%o7
loop_1861:
	fbule	%fcc2,	loop_1862
	fmovse	%icc,	%f4,	%f5
	orn	%g2,	0x01B4,	%g5
	fands	%f25,	%f20,	%f7
loop_1862:
	sra	%o3,	%i7,	%i2
	movne	%icc,	%l6,	%l4
	fmovrdgz	%o2,	%f0,	%f18
	fbne	%fcc1,	loop_1863
	fbl	%fcc0,	loop_1864
	movrgz	%l5,	0x3CB,	%i4
	movgu	%xcc,	%i5,	%g1
loop_1863:
	nop
	setx	loop_1865,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1864:
	fmovsvc	%xcc,	%f20,	%f23
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x58] %asi,	%i0
loop_1865:
	fmul8x16au	%f17,	%f8,	%f0
	fmovde	%icc,	%f28,	%f20
	te	%icc,	0x4
	or	%g6,	%i6,	%l0
	fnot1s	%f6,	%f27
	subcc	%o6,	0x1904,	%g7
	andncc	%o1,	%l3,	%i1
	bshuffle	%f2,	%f22,	%f26
	set	0x76, %g4
	ldsha	[%l7 + %g4] 0x81,	%l1
	mulscc	%l2,	%g4,	%o0
	udivx	%g3,	0x06A2,	%i3
	tgu	%xcc,	0x4
	tn	%icc,	0x3
	nop
	setx loop_1866, %l0, %l1
	jmpl %l1, %o4
	tneg	%xcc,	0x6
	set	0x54, %i1
	lda	[%l7 + %i1] 0x18,	%f20
loop_1866:
	edge16	%o5,	%g2,	%g5
	fbue,a	%fcc1,	loop_1867
	xnorcc	%o7,	0x0478,	%o3
	xnorcc	%i2,	%l6,	%l4
	andn	%i7,	0x037D,	%o2
loop_1867:
	sra	%l5,	%i4,	%i5
	fnot2	%f6,	%f2
	fpsub32	%f0,	%f30,	%f16
	nop
	set	0x58, %i3
	ldsb	[%l7 + %i3],	%i0
	fxors	%f15,	%f3,	%f25
	movre	%g1,	%i6,	%g6
	bg,a,pn	%xcc,	loop_1868
	fmovrsne	%l0,	%f21,	%f24
	sir	0x1CBA
	tcc	%icc,	0x4
loop_1868:
	alignaddrl	%g7,	%o6,	%o1
	fbn,a	%fcc3,	loop_1869
	tsubcctv	%l3,	%i1,	%l1
	xnorcc	%g4,	%l2,	%g3
	ba,a	%xcc,	loop_1870
loop_1869:
	edge8	%o0,	%i3,	%o5
	sra	%g2,	%o4,	%o7
	sdiv	%o3,	0x0F8D,	%g5
loop_1870:
	prefetch	[%l7 + 0x5C],	 0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%icc,	%f29,	%f9
	fbul,a	%fcc0,	loop_1871
	ldd	[%l7 + 0x70],	%f20
	fpadd32s	%f28,	%f7,	%f3
	fcmpne32	%f8,	%f28,	%i2
loop_1871:
	call	loop_1872
	tn	%xcc,	0x1
	subcc	%l4,	0x159C,	%l6
	smul	%o2,	%i7,	%l5
loop_1872:
	fornot2s	%f25,	%f27,	%f16
	smulcc	%i5,	%i0,	%g1
	add	%i4,	0x0CBF,	%g6
	fmovscc	%xcc,	%f13,	%f9
	lduw	[%l7 + 0x1C],	%i6
	udiv	%l0,	0x0CD8,	%g7
	bl,a	%icc,	loop_1873
	fmovscs	%icc,	%f27,	%f18
	movleu	%icc,	%o6,	%o1
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x22,	%i0
loop_1873:
	nop
	set	0x3C, %i2
	ldsba	[%l7 + %i2] 0x19,	%l1
	addc	%g4,	%l3,	%l2
	nop
	setx	loop_1874,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	popc	0x1931,	%o0
	umulcc	%i3,	0x02BB,	%g3
	movneg	%icc,	%g2,	%o5
loop_1874:
	movl	%xcc,	%o4,	%o7
	fbuge	%fcc3,	loop_1875
	subcc	%g5,	%i2,	%l4
	fbuge,a	%fcc1,	loop_1876
	movrlz	%l6,	0x368,	%o2
loop_1875:
	fxnors	%f26,	%f24,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1876:
	bneg	%icc,	loop_1877
	movge	%xcc,	%o3,	%i7
	edge8	%l5,	%i5,	%i0
	bne,a	%icc,	loop_1878
loop_1877:
	alignaddrl	%g1,	%g6,	%i4
	fmovsl	%xcc,	%f14,	%f21
	fmovsn	%icc,	%f9,	%f9
loop_1878:
	movge	%xcc,	%i6,	%l0
	udivx	%o6,	0x1BAF,	%o1
	xorcc	%i1,	0x050B,	%g7
	movcs	%icc,	%l1,	%l3
	fmovdneg	%icc,	%f21,	%f22
	fbg	%fcc2,	loop_1879
	alignaddr	%l2,	%o0,	%g4
	tvs	%xcc,	0x4
	fmovsle	%icc,	%f21,	%f9
loop_1879:
	movleu	%xcc,	%i3,	%g2
	array32	%o5,	%o4,	%g3
	udiv	%g5,	0x0F71,	%o7
	andcc	%i2,	%l6,	%o2
	movleu	%xcc,	%o3,	%l4
	sub	%i7,	%i5,	%l5
	fmovdgu	%icc,	%f17,	%f18
	andcc	%i0,	%g1,	%i4
	call	loop_1880
	orcc	%i6,	%g6,	%l0
	fcmple32	%f0,	%f4,	%o6
	movvc	%icc,	%o1,	%g7
loop_1880:
	fnands	%f21,	%f9,	%f30
	tcc	%xcc,	0x5
	fpack32	%f22,	%f2,	%f18
	ldstub	[%l7 + 0x15],	%i1
	add	%l3,	%l1,	%o0
	ba	%xcc,	loop_1881
	bg	loop_1882
	umul	%g4,	0x1E63,	%l2
	set	0x8, %o1
	ldxa	[%g0 + %o1] 0x21,	%g2
loop_1881:
	and	%o5,	%i3,	%o4
loop_1882:
	fmovrde	%g5,	%f6,	%f18
	swap	[%l7 + 0x34],	%o7
	movrne	%g3,	%i2,	%l6
	te	%xcc,	0x4
	array8	%o2,	%l4,	%o3
	movvs	%xcc,	%i7,	%l5
	fbuge	%fcc1,	loop_1883
	bg,a	loop_1884
	andn	%i5,	0x0AA9,	%g1
	movleu	%icc,	%i0,	%i6
loop_1883:
	tl	%xcc,	0x7
loop_1884:
	sll	%i4,	0x0C,	%g6
	be	%xcc,	loop_1885
	xor	%l0,	0x007B,	%o1
	addc	%g7,	%o6,	%l3
	tleu	%xcc,	0x5
loop_1885:
	sdivx	%i1,	0x1365,	%l1
	edge8n	%g4,	%o0,	%l2
	edge16	%g2,	%i3,	%o4
	for	%f8,	%f28,	%f12
	fmovspos	%icc,	%f23,	%f4
	orncc	%o5,	%o7,	%g3
	edge8n	%g5,	%i2,	%l6
	addcc	%o2,	0x0160,	%l4
	bcc,a	loop_1886
	fcmpne32	%f18,	%f6,	%i7
	or	%l5,	0x0295,	%i5
	fmovdle	%icc,	%f20,	%f0
loop_1886:
	orn	%o3,	0x061F,	%i0
	nop
	setx	loop_1887,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sra	%g1,	%i6,	%i4
	udivcc	%l0,	0x1BEE,	%g6
	movg	%xcc,	%o1,	%g7
loop_1887:
	movre	%o6,	%l3,	%i1
	edge32	%l1,	%g4,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f14,	%f14,	%g2
	tsubcctv	%i3,	%o0,	%o4
	fpmerge	%f16,	%f16,	%f8
	fmovspos	%xcc,	%f28,	%f22
	sdivx	%o5,	0x17FD,	%g3
	set	0x20, %l6
	stda	%g4,	[%l7 + %l6] 0x88
	sethi	0x08C1,	%o7
	edge8ln	%l6,	%o2,	%l4
	umul	%i2,	%l5,	%i7
	tl	%xcc,	0x7
	pdist	%f26,	%f18,	%f28
	taddcc	%i5,	0x1352,	%o3
	fornot2s	%f26,	%f22,	%f0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%g1,	%i6
	fble	%fcc0,	loop_1888
	sth	%i0,	[%l7 + 0x22]
	fpadd16s	%f11,	%f15,	%f15
	bcs,pt	%icc,	loop_1889
loop_1888:
	bshuffle	%f10,	%f24,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x3
loop_1889:
	fmovsge	%xcc,	%f10,	%f12
	srax	%l0,	%i4,	%g6
	sethi	0x048F,	%g7
	brz	%o6,	loop_1890
	fpadd32	%f12,	%f18,	%f26
	brgz	%l3,	loop_1891
	sll	%i1,	0x18,	%o1
loop_1890:
	te	%icc,	0x4
	movvs	%xcc,	%l1,	%g4
loop_1891:
	movcc	%icc,	%g2,	%l2
	tl	%xcc,	0x1
	membar	0x6B
	fmovrdne	%o0,	%f30,	%f14
	smul	%i3,	0x0B88,	%o4
	edge8ln	%o5,	%g3,	%g5
	orcc	%o7,	0x16C2,	%o2
	sir	0x0FBE
	fbe,a	%fcc1,	loop_1892
	sth	%l4,	[%l7 + 0x38]
	fnand	%f16,	%f26,	%f14
	fmovse	%icc,	%f30,	%f27
loop_1892:
	udivcc	%l6,	0x11BE,	%l5
	movrgz	%i7,	0x137,	%i5
	addc	%i2,	%o3,	%g1
	sethi	0x0E5E,	%i0
	orn	%l0,	%i4,	%g6
	movcs	%icc,	%g7,	%o6
	fpackfix	%f30,	%f25
	edge16	%l3,	%i1,	%i6
	movvs	%xcc,	%l1,	%o1
	orncc	%g2,	0x18EE,	%l2
	fmuld8sux16	%f4,	%f11,	%f4
	bn	loop_1893
	sdivx	%g4,	0x1DED,	%o0
	movle	%xcc,	%o4,	%i3
	tsubcc	%g3,	%g5,	%o5
loop_1893:
	smulcc	%o7,	%l4,	%l6
	edge8l	%l5,	%o2,	%i7
	edge32l	%i2,	%o3,	%i5
	xnorcc	%g1,	0x1226,	%l0
	movrne	%i0,	%g6,	%g7
	tl	%icc,	0x1
	fmovda	%xcc,	%f24,	%f12
	edge32ln	%i4,	%l3,	%o6
	movvc	%icc,	%i6,	%i1
	bshuffle	%f2,	%f6,	%f24
	umul	%o1,	0x1A45,	%l1
	fbu,a	%fcc2,	loop_1894
	xorcc	%l2,	0x159B,	%g4
	movn	%xcc,	%o0,	%o4
	bleu,pn	%xcc,	loop_1895
loop_1894:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g2,	%g3,	%g5
	fpmerge	%f30,	%f8,	%f22
loop_1895:
	movn	%xcc,	%i3,	%o5
	movneg	%icc,	%o7,	%l4
	fabss	%f24,	%f8
	fbuge,a	%fcc3,	loop_1896
	andncc	%l5,	%o2,	%l6
	tl	%icc,	0x2
	fmovrsne	%i7,	%f0,	%f29
loop_1896:
	srax	%i2,	0x03,	%o3
	tgu	%icc,	0x2
	fcmpeq32	%f4,	%f14,	%g1
	addc	%l0,	%i0,	%i5
	sir	0x02D6
	lduh	[%l7 + 0x08],	%g6
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%g6
	subc	%i4,	%l3,	%o6
	tsubcctv	%i1,	%i6,	%o1
	wr	%g0,	0x04,	%asi
	stxa	%l1,	[%l7 + 0x18] %asi
	fexpand	%f16,	%f4
	fbo,a	%fcc3,	loop_1897
	fbn	%fcc2,	loop_1898
	movcc	%icc,	%g4,	%l2
	tpos	%xcc,	0x2
loop_1897:
	fexpand	%f9,	%f6
loop_1898:
	smulcc	%o4,	%g2,	%o0
	fmul8x16au	%f8,	%f20,	%f12
	fmovsn	%icc,	%f9,	%f26
	movcc	%xcc,	%g3,	%g5
	fmovrsgez	%i3,	%f25,	%f10
	fmul8sux16	%f16,	%f14,	%f18
	and	%o5,	%l4,	%o7
	move	%icc,	%l5,	%o2
	array16	%i7,	%l6,	%i2
	edge8ln	%o3,	%g1,	%i0
	orcc	%l0,	0x127D,	%g6
	edge8l	%i5,	%g7,	%l3
	tne	%icc,	0x1
	tl	%icc,	0x4
	alignaddr	%i4,	%i1,	%o6
	addcc	%o1,	%l1,	%i6
	fbn	%fcc1,	loop_1899
	fpack16	%f8,	%f29
	stx	%l2,	[%l7 + 0x48]
	alignaddrl	%g4,	%o4,	%o0
loop_1899:
	mova	%xcc,	%g3,	%g5
	fcmped	%fcc1,	%f6,	%f16
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x12] %asi,	%g2
	ba,pt	%icc,	loop_1900
	fsrc2s	%f20,	%f23
	ta	%xcc,	0x0
	edge8n	%i3,	%o5,	%o7
loop_1900:
	sdivx	%l5,	0x1AD2,	%o2
	movcc	%icc,	%l4,	%i7
	edge16n	%l6,	%i2,	%o3
	and	%i0,	0x0BAF,	%l0
	tleu	%icc,	0x5
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%g6
	ldx	[%l7 + 0x60],	%i5
	fmovsleu	%xcc,	%f22,	%f18
	smulcc	%g1,	%l3,	%g7
	bvs,a,pt	%xcc,	loop_1901
	edge32ln	%i4,	%i1,	%o1
	lduh	[%l7 + 0x54],	%o6
	fmovdgu	%xcc,	%f24,	%f12
loop_1901:
	fmovdn	%icc,	%f28,	%f28
	tsubcc	%l1,	%l2,	%i6
	fsrc1	%f6,	%f24
	ba,a,pt	%icc,	loop_1902
	movrlez	%o4,	0x13B,	%g4
	addcc	%g3,	%o0,	%g2
	set	0x39, %o6
	lduba	[%l7 + %o6] 0x15,	%i3
loop_1902:
	ldd	[%l7 + 0x70],	%f8
	edge32l	%o5,	%o7,	%l5
	fmovde	%xcc,	%f16,	%f6
	tpos	%xcc,	0x4
	tcc	%xcc,	0x7
	movrgez	%g5,	%o2,	%l4
	movleu	%icc,	%i7,	%l6
	nop
	setx loop_1903, %l0, %l1
	jmpl %l1, %o3
	fblg	%fcc0,	loop_1904
	edge8ln	%i2,	%i0,	%g6
	bne,a,pt	%xcc,	loop_1905
loop_1903:
	xnorcc	%l0,	%i5,	%g1
loop_1904:
	ba,a,pt	%icc,	loop_1906
	fble	%fcc3,	loop_1907
loop_1905:
	movge	%icc,	%g7,	%i4
	ldub	[%l7 + 0x3D],	%l3
loop_1906:
	nop
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x5C] %asi,	%o1
loop_1907:
	ta	%xcc,	0x6
	taddcctv	%i1,	0x0936,	%l1
	subcc	%l2,	%o6,	%o4
	umul	%g4,	0x1942,	%g3
	movrlz	%i6,	0x0D8,	%o0
	fba,a	%fcc1,	loop_1908
	fbne,a	%fcc1,	loop_1909
	array16	%g2,	%o5,	%i3
	fmovrdlz	%o7,	%f30,	%f14
loop_1908:
	nop
	wr	%g0,	0x10,	%asi
	stwa	%l5,	[%l7 + 0x14] %asi
loop_1909:
	fabss	%f10,	%f19
	fbo,a	%fcc3,	loop_1910
	sir	0x0F0A
	udivcc	%o2,	0x15BA,	%l4
	array16	%g5,	%i7,	%o3
loop_1910:
	fcmpgt32	%f0,	%f20,	%i2
	subccc	%i0,	0x06FE,	%g6
	fbug,a	%fcc0,	loop_1911
	edge16ln	%l0,	%i5,	%l6
	and	%g1,	0x1CE9,	%g7
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x56] %asi,	%l3
loop_1911:
	popc	0x05ED,	%o1
	membar	0x40
	move	%xcc,	%i1,	%l1
	array16	%i4,	%l2,	%o6
	addc	%o4,	0x0704,	%g4
	fbe,a	%fcc2,	loop_1912
	movrgez	%i6,	0x16A,	%g3
	fmovrsgez	%g2,	%f17,	%f10
	fnot2	%f16,	%f6
loop_1912:
	andcc	%o5,	%o0,	%o7
	movrlez	%i3,	%l5,	%o2
	tl	%xcc,	0x0
	movrne	%g5,	0x0E9,	%i7
	tleu	%xcc,	0x2
	bvc	loop_1913
	fmovdcc	%icc,	%f3,	%f13
	fxnor	%f28,	%f24,	%f20
	tcc	%icc,	0x3
loop_1913:
	brnz	%o3,	loop_1914
	fble	%fcc1,	loop_1915
	sub	%i2,	%l4,	%i0
	sdivcc	%g6,	0x1064,	%i5
loop_1914:
	fpsub16	%f4,	%f18,	%f14
loop_1915:
	fcmpgt32	%f18,	%f18,	%l6
	sethi	0x158D,	%g1
	sll	%g7,	0x0F,	%l0
	sethi	0x18B1,	%o1
	sethi	0x04A5,	%l3
	movrlz	%i1,	%l1,	%l2
	flush	%l7 + 0x28
	mulx	%i4,	%o6,	%o4
	nop
	set	0x30, %o4
	std	%g4,	[%l7 + %o4]
	alignaddrl	%g3,	%i6,	%g2
	movgu	%icc,	%o5,	%o0
	tpos	%icc,	0x1
	fnot1s	%f22,	%f27
	edge32ln	%i3,	%l5,	%o7
	fmovdvc	%xcc,	%f25,	%f3
	movvs	%xcc,	%o2,	%i7
	fpadd16	%f28,	%f20,	%f26
	srax	%o3,	%i2,	%l4
	movgu	%xcc,	%g5,	%g6
	srlx	%i0,	0x02,	%l6
	orcc	%g1,	%i5,	%g7
	sllx	%l0,	0x0A,	%o1
	fnors	%f18,	%f20,	%f4
	fpadd16s	%f29,	%f17,	%f29
	swap	[%l7 + 0x4C],	%i1
	andn	%l3,	0x0AD6,	%l1
	movg	%icc,	%i4,	%l2
	fnot2	%f8,	%f8
	fmovdne	%icc,	%f31,	%f18
	fnands	%f18,	%f18,	%f7
	xorcc	%o6,	0x0B13,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o4,	%i6
	sth	%g3,	[%l7 + 0x20]
	xnor	%o5,	%o0,	%g2
	andcc	%i3,	0x0F00,	%o7
	edge32ln	%l5,	%i7,	%o3
	fexpand	%f1,	%f20
	brgez,a	%o2,	loop_1916
	brnz	%i2,	loop_1917
	sth	%l4,	[%l7 + 0x60]
	movl	%icc,	%g6,	%i0
loop_1916:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x34] %asi,	%f11
loop_1917:
	edge16l	%g5,	%l6,	%g1
	stbar
	fors	%f22,	%f20,	%f12
	fmovsne	%xcc,	%f9,	%f11
	fble	%fcc0,	loop_1918
	move	%xcc,	%i5,	%l0
	te	%icc,	0x1
	tne	%xcc,	0x1
loop_1918:
	fcmpeq32	%f18,	%f16,	%o1
	tcs	%xcc,	0x3
	edge8ln	%g7,	%l3,	%i1
	srlx	%l1,	%l2,	%o6
	andn	%i4,	%o4,	%g4
	addc	%g3,	%i6,	%o0
	tcs	%xcc,	0x7
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0x11
	edge8l	%o5,	%i3,	%g2
	movle	%xcc,	%o7,	%i7
	edge8	%l5,	%o3,	%o2
	fmovsge	%icc,	%f25,	%f25
	edge32l	%i2,	%g6,	%i0
	array8	%l4,	%l6,	%g1
	bcc,a	%xcc,	loop_1919
	mulscc	%i5,	0x16DA,	%g5
	bpos,a,pt	%xcc,	loop_1920
	movvc	%icc,	%l0,	%g7
loop_1919:
	bcs,a	loop_1921
	fmovs	%f31,	%f18
loop_1920:
	tvc	%icc,	0x6
	stw	%l3,	[%l7 + 0x74]
loop_1921:
	edge16ln	%i1,	%o1,	%l2
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x18] %asi,	%l1
	bge	%xcc,	loop_1922
	orncc	%i4,	0x0B05,	%o6
	tg	%icc,	0x5
	movn	%xcc,	%o4,	%g4
loop_1922:
	fandnot1s	%f7,	%f23,	%f17
	alignaddr	%g3,	%o0,	%i6
	tvs	%icc,	0x7
	subc	%o5,	0x0E8E,	%g2
	fpsub32	%f22,	%f8,	%f14
	fmovdg	%xcc,	%f10,	%f17
	subcc	%i3,	%i7,	%l5
	set	0x18, %l1
	prefetcha	[%l7 + %l1] 0x80,	 0x3
	bshuffle	%f30,	%f14,	%f6
	fbule	%fcc2,	loop_1923
	fbl	%fcc0,	loop_1924
	fcmpeq16	%f10,	%f24,	%o2
	fmovrdgez	%i2,	%f2,	%f16
loop_1923:
	orn	%o3,	%g6,	%l4
loop_1924:
	tg	%icc,	0x0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i0
	popc	%g1,	%i5
	edge32l	%l6,	%g5,	%l0
	movrlez	%g7,	0x3C4,	%l3
	fcmpes	%fcc0,	%f31,	%f14
	add	%o1,	0x1F5C,	%l2
	tge	%icc,	0x1
	subc	%l1,	0x1024,	%i4
	add	%i1,	0x16C8,	%o4
	edge8l	%g4,	%g3,	%o0
	andn	%o6,	0x0175,	%o5
	xnorcc	%i6,	%i3,	%i7
	tl	%xcc,	0x6
	smul	%g2,	0x1F8B,	%l5
	and	%o7,	0x1CA2,	%i2
	bgu,a,pn	%icc,	loop_1925
	fmovdl	%icc,	%f12,	%f28
	fmul8x16al	%f0,	%f30,	%f18
	movrne	%o3,	%o2,	%g6
loop_1925:
	edge16n	%i0,	%l4,	%i5
	fmovdge	%xcc,	%f7,	%f5
	edge8n	%g1,	%g5,	%l0
	ldub	[%l7 + 0x4B],	%l6
	array8	%g7,	%l3,	%o1
	nop
	setx	loop_1926,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srax	%l2,	0x0B,	%i4
	fxnors	%f4,	%f31,	%f24
	edge8l	%i1,	%l1,	%o4
loop_1926:
	fmovsa	%xcc,	%f13,	%f1
	tvs	%icc,	0x1
	sdivx	%g4,	0x1AAD,	%g3
	tvs	%icc,	0x5
	movrgez	%o6,	0x3C9,	%o0
	move	%xcc,	%i6,	%o5
	bpos,a	loop_1927
	tsubcc	%i7,	0x13B4,	%i3
	edge32ln	%g2,	%l5,	%o7
	movrgz	%o3,	0x23B,	%o2
loop_1927:
	addcc	%i2,	%i0,	%l4
	fpackfix	%f16,	%f24
	swap	[%l7 + 0x54],	%g6
	smul	%g1,	0x178B,	%i5
	addccc	%g5,	0x16C6,	%l6
	fmovdne	%icc,	%f5,	%f28
	pdist	%f28,	%f4,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x58],	%l0
	tsubcc	%g7,	0x17AF,	%l3
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%o0
	sethi	0x19D0,	%l2
	movl	%icc,	%i1,	%l1
	umulcc	%o4,	%i4,	%g4
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x81,	%o6,	%g3
	subcc	%o0,	%i6,	%i7
	fpadd16	%f22,	%f6,	%f18
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%o5
	set	0x12, %l2
	stba	%l5,	[%l7 + %l2] 0x80
	edge8	%o7,	%g2,	%o3
	fmovdleu	%xcc,	%f31,	%f16
	be,pt	%xcc,	loop_1928
	subc	%i2,	%o2,	%i0
	sllx	%g6,	0x18,	%g1
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x3C] %asi,	%i5
loop_1928:
	sdiv	%l4,	0x12B7,	%g5
	tne	%icc,	0x4
	sdiv	%l6,	0x0A11,	%g7
	ldsw	[%l7 + 0x20],	%l0
	tn	%icc,	0x6
	brgz,a	%l3,	loop_1929
	brlez,a	%o1,	loop_1930
	mova	%xcc,	%i1,	%l2
	alignaddr	%l1,	%o4,	%i4
loop_1929:
	srax	%o6,	%g3,	%g4
loop_1930:
	fcmple16	%f16,	%f10,	%o0
	fmul8x16	%f17,	%f10,	%f10
	ldsb	[%l7 + 0x7D],	%i6
	udivx	%i3,	0x0BF6,	%o5
	fmovrslz	%l5,	%f16,	%f13
	bcs,a,pn	%icc,	loop_1931
	sdivx	%i7,	0x1916,	%g2
	tcc	%icc,	0x0
	movre	%o3,	0x382,	%o7
loop_1931:
	fpack32	%f26,	%f20,	%f28
	array16	%i2,	%i0,	%o2
	fmul8sux16	%f20,	%f16,	%f26
	fsrc2s	%f27,	%f31
	bne,a,pt	%xcc,	loop_1932
	fandnot2s	%f18,	%f5,	%f9
	set	0x20, %g7
	ldxa	[%g0 + %g7] 0x4f,	%g1
loop_1932:
	tleu	%icc,	0x0
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x2D] %asi,	%g6
	bcc,a	loop_1933
	tne	%xcc,	0x6
	movrlz	%l4,	0x2DF,	%g5
	xnor	%l6,	%g7,	%l0
loop_1933:
	fsrc2	%f24,	%f22
	brgez	%l3,	loop_1934
	fmovrsgz	%i5,	%f0,	%f0
	smul	%i1,	0x01B1,	%l2
	edge8l	%l1,	%o4,	%o1
loop_1934:
	movl	%xcc,	%i4,	%g3
	umulcc	%g4,	0x0ED1,	%o6
	tvc	%xcc,	0x1
	std	%i6,	[%l7 + 0x50]
	bvs,a,pt	%icc,	loop_1935
	tle	%icc,	0x5
	movvs	%xcc,	%i3,	%o0
	set	0x54, %i0
	lduwa	[%l7 + %i0] 0x81,	%o5
loop_1935:
	ldd	[%l7 + 0x20],	%f0
	bn,a	%xcc,	loop_1936
	fpsub16s	%f8,	%f28,	%f31
	movrlz	%l5,	0x31D,	%g2
	nop
	setx	loop_1937,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1936:
	fcmpes	%fcc0,	%f19,	%f14
	fmovdvc	%xcc,	%f14,	%f21
	sllx	%o3,	0x0F,	%o7
loop_1937:
	fandnot2	%f10,	%f10,	%f16
	orn	%i7,	0x0317,	%i0
	sdivx	%i2,	0x1B33,	%o2
	ldx	[%l7 + 0x30],	%g6
	srax	%l4,	%g1,	%l6
	fmovdn	%icc,	%f13,	%f16
	movne	%icc,	%g5,	%g7
	fmovd	%f12,	%f28
	xnor	%l0,	%i5,	%l3
	srlx	%i1,	0x1C,	%l1
	movge	%xcc,	%l2,	%o4
	fbne	%fcc1,	loop_1938
	tg	%xcc,	0x6
	srl	%i4,	%o1,	%g3
	fmovdne	%xcc,	%f3,	%f14
loop_1938:
	tle	%icc,	0x6
	xnor	%g4,	%i6,	%o6
	and	%o0,	0x07EB,	%i3
	movneg	%xcc,	%o5,	%l5
	alignaddr	%g2,	%o3,	%i7
	lduw	[%l7 + 0x7C],	%o7
	array8	%i0,	%o2,	%g6
	call	loop_1939
	fmovsn	%xcc,	%f24,	%f4
	movneg	%xcc,	%l4,	%i2
	subccc	%l6,	0x0F2C,	%g5
loop_1939:
	fblg	%fcc0,	loop_1940
	movre	%g1,	%l0,	%i5
	fmovscs	%icc,	%f22,	%f18
	fmovrsgz	%g7,	%f10,	%f0
loop_1940:
	sethi	0x0B8F,	%i1
	ldub	[%l7 + 0x7A],	%l3
	fmovsa	%icc,	%f27,	%f27
	fmovrsgz	%l1,	%f27,	%f21
	srlx	%l2,	%i4,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn	loop_1941
	fmovdn	%xcc,	%f12,	%f30
	edge16l	%g3,	%o4,	%g4
	tn	%icc,	0x0
loop_1941:
	fbne,a	%fcc3,	loop_1942
	sllx	%i6,	%o0,	%i3
	addccc	%o5,	0x0D39,	%o6
	be,a,pt	%icc,	loop_1943
loop_1942:
	flush	%l7 + 0x3C
	fpadd16	%f12,	%f10,	%f28
	movleu	%icc,	%g2,	%l5
loop_1943:
	tsubcctv	%i7,	0x0CC1,	%o3
	fcmpne16	%f30,	%f0,	%o7
	movpos	%icc,	%o2,	%g6
	movcc	%icc,	%l4,	%i2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x39] %asi,	%l6
	sll	%i0,	0x12,	%g1
	ldstub	[%l7 + 0x43],	%g5
	movrlz	%i5,	%g7,	%i1
	sdivcc	%l0,	0x1563,	%l1
	stbar
	bgu	%icc,	loop_1944
	orcc	%l2,	0x1954,	%l3
	movgu	%xcc,	%i4,	%g3
	xorcc	%o1,	0x1948,	%o4
loop_1944:
	bgu,a,pn	%icc,	loop_1945
	and	%i6,	%o0,	%g4
	fornot1	%f2,	%f14,	%f6
	popc	%i3,	%o5
loop_1945:
	edge8l	%g2,	%l5,	%i7
	edge32l	%o3,	%o6,	%o2
	fbug	%fcc1,	loop_1946
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f20
	lduh	[%l7 + 0x20],	%o7
loop_1946:
	subccc	%g6,	%i2,	%l4
	xorcc	%i0,	0x1452,	%g1
	edge8n	%g5,	%l6,	%g7
	movrlez	%i1,	0x33E,	%l0
	subcc	%i5,	0x0BEF,	%l2
	array32	%l3,	%i4,	%g3
	bvs	%xcc,	loop_1947
	bvs	loop_1948
	fandnot1s	%f22,	%f2,	%f10
	membar	0x6E
loop_1947:
	nop
	set	0x64, %o2
	ldswa	[%l7 + %o2] 0x18,	%l1
loop_1948:
	edge8l	%o4,	%o1,	%i6
	tneg	%icc,	0x1
	edge8l	%g4,	%o0,	%o5
	fmuld8sux16	%f25,	%f3,	%f6
	ta	%icc,	0x4
	fbl,a	%fcc0,	loop_1949
	sll	%g2,	0x03,	%l5
	mulscc	%i7,	0x17BA,	%o3
	swap	[%l7 + 0x30],	%i3
loop_1949:
	fandnot2s	%f9,	%f24,	%f27
	movn	%xcc,	%o2,	%o7
	ldsw	[%l7 + 0x54],	%o6
	taddcc	%i2,	%g6,	%l4
	tsubcc	%i0,	0x0ECA,	%g1
	fpadd16s	%f16,	%f16,	%f10
	fnot1s	%f10,	%f2
	fmovdg	%xcc,	%f27,	%f7
	sdivx	%l6,	0x1DDB,	%g7
	stb	%g5,	[%l7 + 0x67]
	movrlz	%l0,	%i1,	%i5
	fbg	%fcc1,	loop_1950
	movcs	%icc,	%l3,	%l2
	fmovrdlez	%i4,	%f22,	%f12
	lduw	[%l7 + 0x14],	%l1
loop_1950:
	fmovdleu	%xcc,	%f23,	%f5
	tgu	%xcc,	0x0
	ta	%xcc,	0x4
	fmovscc	%icc,	%f12,	%f23
	fbg,a	%fcc0,	loop_1951
	fmovrse	%o4,	%f6,	%f9
	fxors	%f0,	%f9,	%f4
	fbug	%fcc0,	loop_1952
loop_1951:
	movgu	%xcc,	%g3,	%o1
	movne	%xcc,	%g4,	%i6
	move	%icc,	%o5,	%g2
loop_1952:
	tn	%icc,	0x4
	edge8l	%l5,	%i7,	%o0
	movg	%icc,	%i3,	%o2
	te	%icc,	0x5
	edge8n	%o3,	%o7,	%i2
	fbu	%fcc3,	loop_1953
	tgu	%xcc,	0x0
	movrlz	%g6,	%l4,	%o6
	addcc	%g1,	%i0,	%l6
loop_1953:
	edge16n	%g7,	%g5,	%l0
	movl	%icc,	%i5,	%i1
	fmovrsgez	%l2,	%f6,	%f18
	fbul	%fcc1,	loop_1954
	fcmpgt32	%f10,	%f14,	%l3
	ta	%xcc,	0x0
	fpmerge	%f17,	%f2,	%f22
loop_1954:
	array8	%i4,	%l1,	%g3
	movrgez	%o4,	%o1,	%g4
	stx	%o5,	[%l7 + 0x78]
	fbn,a	%fcc1,	loop_1955
	fpmerge	%f6,	%f17,	%f28
	st	%f11,	[%l7 + 0x14]
	smul	%g2,	%i6,	%l5
loop_1955:
	call	loop_1956
	fmovse	%xcc,	%f21,	%f8
	alignaddrl	%o0,	%i3,	%o2
	tg	%icc,	0x6
loop_1956:
	fbo,a	%fcc2,	loop_1957
	brlz	%i7,	loop_1958
	edge8ln	%o7,	%i2,	%o3
	orn	%l4,	0x0E4A,	%o6
loop_1957:
	sir	0x0012
loop_1958:
	st	%f4,	[%l7 + 0x3C]
	edge32n	%g6,	%i0,	%g1
	or	%l6,	%g7,	%l0
	fmovde	%xcc,	%f5,	%f18
	array32	%i5,	%i1,	%g5
	set	0x0, %l5
	stxa	%l3,	[%g0 + %l5] 0x57
	tpos	%xcc,	0x5
	tvc	%xcc,	0x4
	srl	%l2,	%i4,	%l1
	sir	0x1EAB
	addccc	%o4,	%g3,	%g4
	movrlz	%o1,	%o5,	%g2
	stx	%i6,	[%l7 + 0x50]
	set	0x38, %o5
	ldxa	[%g0 + %o5] 0x20,	%l5
	fandnot2s	%f9,	%f9,	%f4
	pdist	%f2,	%f6,	%f6
	fbu	%fcc2,	loop_1959
	edge32ln	%o0,	%o2,	%i7
	tl	%xcc,	0x4
	addccc	%o7,	0x03A6,	%i2
loop_1959:
	fmuld8sux16	%f19,	%f14,	%f8
	nop
	set	0x60, %l0
	ldsb	[%l7 + %l0],	%o3
	and	%i3,	%o6,	%l4
	fbul,a	%fcc2,	loop_1960
	andcc	%g6,	%i0,	%l6
	tsubcc	%g1,	0x1800,	%l0
	fmovscs	%xcc,	%f4,	%f26
loop_1960:
	for	%f28,	%f0,	%f22
	srlx	%g7,	%i5,	%g5
	ba,a	%xcc,	loop_1961
	subc	%l3,	%i1,	%l2
	movrlz	%i4,	%o4,	%g3
	stx	%l1,	[%l7 + 0x48]
loop_1961:
	xor	%o1,	0x05B6,	%g4
	stw	%o5,	[%l7 + 0x08]
	umulcc	%i6,	0x0D71,	%g2
	stb	%l5,	[%l7 + 0x26]
	or	%o0,	0x1E65,	%i7
	udivx	%o2,	0x15D5,	%i2
	array8	%o3,	%o7,	%o6
	movvc	%icc,	%l4,	%g6
	sth	%i3,	[%l7 + 0x50]
	or	%l6,	0x11BA,	%g1
	movneg	%icc,	%i0,	%g7
	edge16n	%i5,	%g5,	%l0
	fba,a	%fcc2,	loop_1962
	mulscc	%l3,	0x149E,	%i1
	fbul	%fcc1,	loop_1963
	subc	%l2,	0x07BF,	%o4
loop_1962:
	fmovrsne	%g3,	%f29,	%f20
	fmovscs	%xcc,	%f16,	%f30
loop_1963:
	umul	%l1,	0x1BFF,	%i4
	edge16n	%g4,	%o1,	%i6
	edge32	%g2,	%o5,	%o0
	fsrc2	%f10,	%f8
	xor	%i7,	0x16FF,	%l5
	fmovscc	%icc,	%f21,	%f29
	fcmpgt16	%f22,	%f2,	%o2
	edge32l	%i2,	%o7,	%o3
	te	%xcc,	0x7
	fbg,a	%fcc1,	loop_1964
	tsubcctv	%l4,	0x19D7,	%g6
	subccc	%o6,	%l6,	%i3
	tsubcc	%g1,	%g7,	%i5
loop_1964:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g5,	0x0767,	%l0
	sllx	%i0,	0x00,	%l3
	fmovsvc	%xcc,	%f13,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne,a,pt	%icc,	loop_1965
	sdiv	%l2,	0x0848,	%i1
	fmuld8ulx16	%f1,	%f0,	%f10
	fpsub16s	%f15,	%f14,	%f10
loop_1965:
	nop
	setx	loop_1966,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fabsd	%f12,	%f4
	ldd	[%l7 + 0x78],	%o4
	fnors	%f23,	%f29,	%f11
loop_1966:
	fmul8sux16	%f0,	%f28,	%f16
	fmovrdlz	%g3,	%f28,	%f18
	ldd	[%l7 + 0x18],	%f4
	fornot2s	%f26,	%f2,	%f23
	popc	0x0DDC,	%l1
	srlx	%g4,	0x0A,	%i4
	move	%xcc,	%o1,	%i6
	tg	%xcc,	0x1
	fbl	%fcc0,	loop_1967
	or	%g2,	%o0,	%i7
	mulx	%l5,	%o5,	%i2
	be,pt	%icc,	loop_1968
loop_1967:
	fmovsle	%icc,	%f8,	%f26
	bl	loop_1969
	fpack16	%f14,	%f17
loop_1968:
	fbug	%fcc1,	loop_1970
	sir	0x1FE4
loop_1969:
	fandnot2	%f26,	%f26,	%f28
	add	%o2,	0x0441,	%o7
loop_1970:
	addc	%l4,	0x0690,	%o3
	fmovsl	%icc,	%f5,	%f9
	sir	0x13DF
	movg	%xcc,	%o6,	%g6
	tgu	%xcc,	0x5
	ldub	[%l7 + 0x15],	%l6
	fnot2	%f12,	%f22
	taddcc	%g1,	0x08E7,	%g7
	fornot1	%f26,	%f20,	%f22
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
	movrlz	%i5,	%l0,	%g5
	sll	%i0,	%l3,	%i1
	movrlez	%l2,	0x08A,	%g3
	fnand	%f16,	%f16,	%f8
	mova	%xcc,	%l1,	%o4
	fornot2s	%f22,	%f5,	%f11
	movcc	%icc,	%g4,	%o1
	tne	%icc,	0x5
	fmovsvc	%icc,	%f7,	%f12
	fbue,a	%fcc0,	loop_1971
	brgez	%i4,	loop_1972
	edge32n	%g2,	%o0,	%i6
	fpadd32s	%f13,	%f20,	%f3
loop_1971:
	tle	%xcc,	0x7
loop_1972:
	sdiv	%i7,	0x15C6,	%o5
	te	%xcc,	0x3
	movrgez	%i2,	0x04F,	%l5
	movn	%icc,	%o7,	%l4
	fpsub32	%f10,	%f24,	%f16
	brgz	%o3,	loop_1973
	membar	0x47
	mulx	%o6,	0x164F,	%o2
	set	0x3C, %i7
	stwa	%l6,	[%l7 + %i7] 0x18
loop_1973:
	addccc	%g1,	%g7,	%g6
	ba	loop_1974
	fmovrsgez	%i5,	%f27,	%f23
	movl	%xcc,	%i3,	%g5
	ta	%xcc,	0x3
loop_1974:
	array32	%l0,	%l3,	%i1
	subccc	%l2,	0x00BE,	%i0
	fmovse	%icc,	%f30,	%f25
	fxnors	%f1,	%f6,	%f7
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	movge	%xcc,	%o4,	%l1
	xnor	%g4,	%o1,	%g2
	movle	%xcc,	%i4,	%o0
	wr	%g0,	0x0c,	%asi
	stxa	%i6,	[%l7 + 0x18] %asi
	edge16	%o5,	%i7,	%l5
	fbule	%fcc0,	loop_1975
	brgz,a	%o7,	loop_1976
	edge32l	%l4,	%o3,	%o6
	taddcctv	%i2,	0x15D0,	%l6
loop_1975:
	udivcc	%o2,	0x05EA,	%g7
loop_1976:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x18] %asi,	%g6
	ldd	[%l7 + 0x10],	%f4
	smulcc	%g1,	0x07FF,	%i3
	sir	0x15DC
	set	0x0E, %i5
	lduha	[%l7 + %i5] 0x0c,	%g5
	udivx	%l0,	0x0251,	%l3
	taddcctv	%i1,	%l2,	%i5
	subc	%i0,	0x0DC3,	%o4
	edge8ln	%l1,	%g3,	%g4
	movn	%icc,	%o1,	%i4
	fmovdle	%xcc,	%f27,	%f9
	orn	%o0,	%g2,	%i6
	fbn,a	%fcc3,	loop_1977
	movle	%xcc,	%o5,	%l5
	brgz	%i7,	loop_1978
	addccc	%l4,	0x18FD,	%o7
loop_1977:
	fsrc1s	%f1,	%f26
	subccc	%o3,	%i2,	%o6
loop_1978:
	fmovrslez	%o2,	%f2,	%f3
	ldx	[%l7 + 0x20],	%l6
	orn	%g6,	%g1,	%i3
	st	%f7,	[%l7 + 0x08]
	edge16	%g5,	%g7,	%l3
	fbule	%fcc2,	loop_1979
	sdivx	%l0,	0x17CF,	%i1
	swap	[%l7 + 0x20],	%l2
	fbn	%fcc1,	loop_1980
loop_1979:
	movrgz	%i0,	0x083,	%i5
	movle	%xcc,	%l1,	%g3
	edge32l	%g4,	%o1,	%o4
loop_1980:
	sllx	%o0,	0x02,	%i4
	edge8l	%i6,	%g2,	%o5
	udivx	%i7,	0x186F,	%l5
	mova	%icc,	%l4,	%o3
	movrne	%i2,	0x1D1,	%o6
	xor	%o7,	0x1B82,	%l6
	movrlez	%g6,	%o2,	%g1
	orn	%i3,	0x1F53,	%g7
	nop
	set	0x44, %o3
	lduw	[%l7 + %o3],	%g5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x89,	%l0,	%l3
	ldub	[%l7 + 0x1C],	%l2
	fbg,a	%fcc3,	loop_1981
	tpos	%xcc,	0x4
	nop
	setx	loop_1982,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	faligndata	%f16,	%f2,	%f16
loop_1981:
	bn	%icc,	loop_1983
	tneg	%xcc,	0x0
loop_1982:
	ldstub	[%l7 + 0x23],	%i1
	orcc	%i5,	%i0,	%l1
loop_1983:
	fbule	%fcc3,	loop_1984
	movrgz	%g4,	%g3,	%o1
	movne	%xcc,	%o0,	%o4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i6
	casa	[%l6] %asi,	%i6,	%i4
loop_1984:
	sdiv	%g2,	0x0E1C,	%o5
	andncc	%i7,	%l5,	%o3
	ld	[%l7 + 0x58],	%f26
	alignaddrl	%l4,	%o6,	%i2
	movg	%icc,	%l6,	%o7
	sub	%g6,	0x0726,	%g1
	fmovdleu	%icc,	%f2,	%f31
	fxors	%f31,	%f28,	%f10
	ld	[%l7 + 0x34],	%f30
	fmovrdne	%i3,	%f2,	%f22
	srl	%o2,	%g7,	%l0
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
	alignaddrl	%l3,	%g5,	%i1
	for	%f4,	%f18,	%f16
	addcc	%l2,	%i5,	%i0
loop_1985:
	popc	%g4,	%g3
	fmovda	%icc,	%f0,	%f16
	edge16ln	%o1,	%o0,	%o4
	movl	%xcc,	%i6,	%i4
	movcs	%icc,	%g2,	%o5
	fpack32	%f2,	%f10,	%f4
	edge8ln	%l1,	%i7,	%o3
	movvs	%icc,	%l4,	%l5
	fcmpne32	%f12,	%f18,	%o6
	movrgz	%i2,	0x29C,	%o7
	fmovdge	%icc,	%f31,	%f4
	lduh	[%l7 + 0x7A],	%l6
	tgu	%icc,	0x2
	nop
	set	0x1E, %g2
	ldsb	[%l7 + %g2],	%g6
	fnegs	%f14,	%f1
	movgu	%icc,	%g1,	%o2
	xnor	%g7,	0x1A8A,	%l0
	movcs	%icc,	%l3,	%i3
	bneg	loop_1986
	edge32	%g5,	%i1,	%i5
	alignaddr	%l2,	%i0,	%g3
	umul	%o1,	0x005A,	%o0
loop_1986:
	fexpand	%f29,	%f14
	fcmpne16	%f24,	%f18,	%g4
	fbe	%fcc2,	loop_1987
	movpos	%icc,	%o4,	%i4
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x24] %asi,	%g2
loop_1987:
	ldsh	[%l7 + 0x60],	%o5
	fcmpeq32	%f6,	%f2,	%i6
	smulcc	%i7,	%l1,	%l4
	fmovsg	%icc,	%f17,	%f18
	fxnors	%f24,	%f9,	%f25
	nop
	set	0x28, %g3
	stw	%l5,	[%l7 + %g3]
	alignaddr	%o6,	%i2,	%o7
	movrgz	%l6,	%g6,	%g1
	fornot1	%f22,	%f10,	%f20
	edge8	%o2,	%g7,	%l0
	movneg	%xcc,	%o3,	%l3
	fzeros	%f9
	fbl	%fcc0,	loop_1988
	fbne,a	%fcc2,	loop_1989
	movvc	%icc,	%i3,	%g5
	bvc,pn	%xcc,	loop_1990
loop_1988:
	fsrc1	%f10,	%f20
loop_1989:
	fmovsvs	%xcc,	%f7,	%f1
	fsrc1	%f26,	%f0
loop_1990:
	fmovdne	%xcc,	%f15,	%f15
	brgez,a	%i5,	loop_1991
	prefetch	[%l7 + 0x74],	 0x3
	movne	%xcc,	%i1,	%l2
	sth	%g3,	[%l7 + 0x6C]
loop_1991:
	prefetch	[%l7 + 0x14],	 0x3
	brlz,a	%i0,	loop_1992
	edge16n	%o1,	%o0,	%o4
	bgu,pn	%xcc,	loop_1993
	xorcc	%i4,	%g4,	%o5
loop_1992:
	te	%icc,	0x6
	fbn	%fcc3,	loop_1994
loop_1993:
	fmovscc	%icc,	%f23,	%f9
	tne	%icc,	0x3
	std	%f8,	[%l7 + 0x40]
loop_1994:
	fmovdleu	%xcc,	%f21,	%f23
	ldx	[%l7 + 0x60],	%g2
	or	%i6,	0x1717,	%i7
	array32	%l1,	%l4,	%o6
	sllx	%i2,	0x06,	%l5
	movrgz	%o7,	0x16B,	%g6
	fmovsvc	%icc,	%f1,	%f11
	movcs	%xcc,	%l6,	%g1
	nop
	setx	loop_1995,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdiv	%o2,	0x0C0D,	%g7
	edge8n	%l0,	%l3,	%o3
	tpos	%xcc,	0x4
loop_1995:
	andn	%g5,	%i3,	%i1
	sub	%i5,	%g3,	%l2
	fmovrdgez	%i0,	%f20,	%f26
	xnorcc	%o1,	0x1E00,	%o0
	sdivcc	%o4,	0x1BF2,	%g4
	fcmpgt16	%f22,	%f6,	%o5
	fcmpd	%fcc2,	%f0,	%f20
	wr	%g0,	0xe2,	%asi
	stda	%g2,	[%l7 + 0x08] %asi
	membar	#Sync
	sethi	0x0F87,	%i4
	siam	0x1
	bcs	%xcc,	loop_1996
	swap	[%l7 + 0x54],	%i7
	movcs	%xcc,	%l1,	%i6
	bne,a,pn	%icc,	loop_1997
loop_1996:
	subccc	%l4,	0x0C98,	%i2
	fmul8x16au	%f28,	%f3,	%f14
	ta	%xcc,	0x5
loop_1997:
	ldub	[%l7 + 0x28],	%o6
	tle	%icc,	0x4
	fba	%fcc1,	loop_1998
	tsubcc	%o7,	%l5,	%l6
	movne	%icc,	%g6,	%g1
	fabss	%f5,	%f7
loop_1998:
	mova	%xcc,	%g7,	%l0
	umul	%l3,	0x13EB,	%o2
	tleu	%xcc,	0x5
	movpos	%xcc,	%o3,	%g5
	fmovse	%xcc,	%f31,	%f6
	smul	%i3,	%i5,	%g3
	mulscc	%i1,	0x173B,	%l2
	bpos,a	%icc,	loop_1999
	subcc	%o1,	%o0,	%o4
	movvc	%xcc,	%i0,	%o5
	movleu	%icc,	%g4,	%g2
loop_1999:
	fmovsl	%xcc,	%f16,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i4,	%l1
	fmul8x16al	%f28,	%f27,	%f8
	alignaddrl	%i6,	%i7,	%l4
	tpos	%icc,	0x2
	sdiv	%o6,	0x0F86,	%o7
	move	%xcc,	%l5,	%i2
	movvs	%xcc,	%l6,	%g1
	srax	%g6,	%l0,	%l3
	smul	%g7,	0x160D,	%o3
	smul	%o2,	0x1549,	%i3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%g5,	%i5
	sll	%g3,	%l2,	%o1
	fpadd32s	%f21,	%f10,	%f18
	fcmpeq16	%f18,	%f22,	%o0
	stx	%o4,	[%l7 + 0x50]
	movrgez	%i0,	0x37D,	%i1
	taddcctv	%o5,	0x0E84,	%g2
	wr	%g0,	0x89,	%asi
	stha	%i4,	[%l7 + 0x3A] %asi
	bpos,a	%icc,	loop_2000
	ldstub	[%l7 + 0x4F],	%l1
	sll	%i6,	%g4,	%l4
	sll	%o6,	0x18,	%i7
loop_2000:
	bge,a	%icc,	loop_2001
	edge32	%o7,	%i2,	%l5
	fpack16	%f26,	%f15
	sethi	0x04B1,	%l6
loop_2001:
	addc	%g6,	0x1A13,	%g1
	fnor	%f8,	%f10,	%f0
	bge,pn	%icc,	loop_2002
	alignaddrl	%l3,	%g7,	%o3
	set	0x7B, %o0
	lduba	[%l7 + %o0] 0x10,	%o2
loop_2002:
	alignaddrl	%i3,	%g5,	%i5
	movcs	%icc,	%l0,	%g3
	fmovrdgz	%l2,	%f10,	%f14
	edge16n	%o0,	%o1,	%i0
	mulscc	%i1,	%o4,	%g2
	fmul8x16	%f15,	%f8,	%f16
	ta	%xcc,	0x7
	tneg	%xcc,	0x1
	tpos	%xcc,	0x1
	addcc	%i4,	%o5,	%i6
	mova	%xcc,	%l1,	%l4
	movvc	%xcc,	%o6,	%g4
	fmovrdgz	%i7,	%f20,	%f12
	array16	%o7,	%i2,	%l5
	addc	%g6,	%l6,	%g1
	std	%l2,	[%l7 + 0x10]
	srl	%g7,	%o3,	%o2
	bvs,pt	%icc,	loop_2003
	bcc,a	%icc,	loop_2004
	movle	%icc,	%g5,	%i3
	smulcc	%i5,	0x0EFB,	%g3
loop_2003:
	sdivcc	%l2,	0x009D,	%l0
loop_2004:
	movrlz	%o0,	%o1,	%i1
	ldstub	[%l7 + 0x42],	%i0
	orncc	%g2,	0x1710,	%o4
	tcs	%xcc,	0x3
	movcs	%xcc,	%o5,	%i6
	udivx	%l1,	0x1219,	%i4
	tgu	%xcc,	0x0
	fmuld8sux16	%f0,	%f25,	%f18
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o6
	fbug	%fcc2,	loop_2005
	and	%g4,	%l4,	%o7
	taddcctv	%i2,	0x0B50,	%l5
	fandnot1	%f0,	%f18,	%f12
loop_2005:
	nop
	set	0x38, %l4
	lda	[%l7 + %l4] 0x80,	%f19
	membar	0x1D
	fmul8sux16	%f30,	%f0,	%f30
	movpos	%xcc,	%g6,	%l6
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%g1
	ldsh	[%l7 + 0x68],	%l3
	fmovrsne	%i7,	%f24,	%f25
	edge8ln	%o3,	%o2,	%g7
	srl	%g5,	0x15,	%i5
	popc	%i3,	%g3
	fmovdcc	%xcc,	%f26,	%f8
	movrgez	%l0,	%l2,	%o0
	srl	%o1,	%i1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%o4,	%o5
	tcs	%xcc,	0x7
	fmovs	%f23,	%f5
	sdivcc	%i6,	0x1176,	%g2
	bge	%icc,	loop_2006
	movrne	%i4,	%l1,	%o6
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x2C] %asi,	%l4
loop_2006:
	bcc	loop_2007
	udivx	%o7,	0x1832,	%i2
	movcc	%icc,	%g4,	%g6
	fmul8sux16	%f8,	%f14,	%f24
loop_2007:
	movcs	%xcc,	%l6,	%g1
	swap	[%l7 + 0x78],	%l3
	movrgz	%i7,	0x2B9,	%o3
	lduw	[%l7 + 0x14],	%o2
	stx	%l5,	[%l7 + 0x18]
	fcmps	%fcc2,	%f14,	%f1
	edge8l	%g5,	%g7,	%i3
	sll	%g3,	0x0D,	%l0
	alignaddrl	%l2,	%o0,	%o1
	nop
	set	0x30, %i4
	stw	%i1,	[%l7 + %i4]
	fmovsneg	%icc,	%f27,	%f4
	pdist	%f2,	%f24,	%f12
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x50] %asi,	%i5
	fbn,a	%fcc3,	loop_2008
	xnorcc	%i0,	%o4,	%i6
	movg	%xcc,	%g2,	%o5
	fcmpd	%fcc0,	%f30,	%f16
loop_2008:
	ldd	[%l7 + 0x20],	%i4
	edge32ln	%o6,	%l4,	%l1
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x24] %asi,	%i2
	fbge	%fcc0,	loop_2009
	fnot1	%f18,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%xcc,	%f10,	%f25
loop_2009:
	umulcc	%g4,	0x1E1B,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g6,	%g1,	%l6
	subccc	%l3,	%o3,	%o2
	xor	%i7,	%g5,	%g7
	fble	%fcc2,	loop_2010
	and	%l5,	0x01B7,	%g3
	addcc	%i3,	0x16A6,	%l2
	fmul8sux16	%f16,	%f16,	%f14
loop_2010:
	nop
	set	0x34, %g5
	stha	%o0,	[%l7 + %g5] 0x10
	fpack32	%f28,	%f6,	%f18
	array32	%l0,	%o1,	%i5
	brnz,a	%i1,	loop_2011
	bl	%xcc,	loop_2012
	ba,pt	%icc,	loop_2013
	addccc	%o4,	%i0,	%g2
loop_2011:
	taddcc	%i6,	%i4,	%o6
loop_2012:
	ldub	[%l7 + 0x30],	%l4
loop_2013:
	edge32l	%l1,	%o5,	%i2
	movn	%xcc,	%g4,	%g6
	sethi	0x16EC,	%g1
	edge8	%o7,	%l3,	%l6
	movrgez	%o3,	0x391,	%o2
	fnands	%f6,	%f0,	%f22
	lduh	[%l7 + 0x20],	%g5
	smulcc	%g7,	0x05E9,	%i7
	orncc	%g3,	%l5,	%l2
	tgu	%xcc,	0x2
	set	0x18, %g6
	lda	[%l7 + %g6] 0x88,	%f16
	alignaddr	%i3,	%l0,	%o1
	fblg	%fcc3,	loop_2014
	sdivx	%i5,	0x1197,	%i1
	ta	%xcc,	0x5
	fnegd	%f30,	%f6
loop_2014:
	std	%o0,	[%l7 + 0x78]
	sdiv	%i0,	0x026F,	%o4
	sdiv	%i6,	0x0A95,	%g2
	fpadd32s	%f6,	%f13,	%f22
	fcmps	%fcc3,	%f13,	%f10
	movl	%xcc,	%o6,	%l4
	fcmple16	%f12,	%f26,	%l1
	fmovdl	%xcc,	%f11,	%f21
	wr	%g0,	0x2f,	%asi
	stda	%o4,	[%l7 + 0x08] %asi
	membar	#Sync
	movg	%xcc,	%i2,	%i4
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x88,	%g6
	movl	%xcc,	%g1,	%o7
	udiv	%g4,	0x1D3A,	%l6
	fmovrsgez	%l3,	%f18,	%f27
	lduw	[%l7 + 0x10],	%o2
	edge8l	%o3,	%g7,	%i7
	fmovrsgz	%g3,	%f13,	%f14
	sub	%g5,	%l2,	%l5
	fbue,a	%fcc2,	loop_2015
	fmovdn	%xcc,	%f27,	%f29
	brz,a	%i3,	loop_2016
	edge16l	%o1,	%i5,	%l0
loop_2015:
	edge8n	%o0,	%i1,	%i0
	lduw	[%l7 + 0x48],	%i6
loop_2016:
	fmovrsgz	%g2,	%f8,	%f30
	bne,pn	%xcc,	loop_2017
	sdiv	%o4,	0x1CAB,	%l4
	fmovdleu	%icc,	%f12,	%f6
	andn	%o6,	0x0E3C,	%l1
loop_2017:
	umulcc	%o5,	%i4,	%i2
	edge8ln	%g1,	%o7,	%g6
	taddcctv	%l6,	0x1DFE,	%l3
	fxors	%f8,	%f26,	%f19
	fcmpne32	%f24,	%f22,	%g4
	bcs,a	%icc,	loop_2018
	tl	%xcc,	0x3
	xnor	%o2,	%o3,	%g7
	sir	0x158B
loop_2018:
	be,pn	%icc,	loop_2019
	sdiv	%i7,	0x0C05,	%g5
	edge16	%l2,	%g3,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2019:
	bgu,a	%icc,	loop_2020
	tl	%xcc,	0x2
	move	%icc,	%o1,	%i5
	orcc	%l5,	0x0454,	%l0
loop_2020:
	bne,pt	%icc,	loop_2021
	fble	%fcc3,	loop_2022
	stb	%o0,	[%l7 + 0x60]
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x5C] %asi,	%i1
loop_2021:
	brnz	%i0,	loop_2023
loop_2022:
	fxnor	%f10,	%f28,	%f12
	wr	%g0,	0xe3,	%asi
	stwa	%g2,	[%l7 + 0x78] %asi
	membar	#Sync
loop_2023:
	flush	%l7 + 0x3C
	fcmpne32	%f20,	%f22,	%i6
	andncc	%l4,	%o6,	%l1
	addc	%o4,	0x066B,	%i4
	ldstub	[%l7 + 0x36],	%o5
	orcc	%g1,	%i2,	%g6
	array32	%l6,	%l3,	%g4
	call	loop_2024
	smulcc	%o7,	0x1571,	%o3
	movpos	%xcc,	%o2,	%g7
	tsubcctv	%g5,	%l2,	%g3
loop_2024:
	addcc	%i7,	0x04BE,	%o1
	tcc	%xcc,	0x2
	sub	%i3,	%i5,	%l0
	fandnot1s	%f4,	%f1,	%f8
	stbar
	fmovrsgz	%l5,	%f19,	%f30
	ldd	[%l7 + 0x40],	%f16
	fone	%f30
	brlez	%i1,	loop_2025
	fmovdvc	%xcc,	%f29,	%f20
	fmovsvc	%icc,	%f16,	%f21
	fcmpes	%fcc0,	%f4,	%f0
loop_2025:
	bcs	loop_2026
	tge	%xcc,	0x6
	prefetch	[%l7 + 0x40],	 0x0
	tne	%icc,	0x5
loop_2026:
	andncc	%o0,	%i0,	%g2
	tgu	%xcc,	0x1
	xnor	%l4,	0x0FBA,	%o6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	lduw	[%l7 + 0x54],	%l1
	subccc	%i4,	0x07DD,	%o5
	fandnot2	%f12,	%f22,	%f2
	orn	%o4,	%i2,	%g6
	movgu	%icc,	%g1,	%l6
	addcc	%g4,	0x1680,	%l3
	orncc	%o7,	%o3,	%g7
	umul	%g5,	0x0F53,	%l2
	addcc	%o2,	0x0287,	%g3
	addc	%i7,	0x11E4,	%o1
	sdivx	%i3,	0x0C39,	%i5
	ldx	[%l7 + 0x10],	%l0
	xorcc	%i1,	0x1432,	%l5
	wr	%g0,	0x23,	%asi
	stha	%o0,	[%l7 + 0x3A] %asi
	membar	#Sync
	array32	%g2,	%i0,	%l4
	xor	%i6,	%l1,	%o6
	fmovspos	%xcc,	%f31,	%f30
	sdivcc	%i4,	0x021B,	%o5
	fblg	%fcc1,	loop_2027
	bl	%xcc,	loop_2028
	srl	%o4,	0x09,	%i2
	taddcc	%g6,	%l6,	%g4
loop_2027:
	nop
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x17,	%f16
loop_2028:
	movge	%icc,	%g1,	%o7
	edge16ln	%o3,	%g7,	%l3
	brgez,a	%g5,	loop_2029
	fexpand	%f20,	%f12
	set	0x48, %i6
	ldswa	[%l7 + %i6] 0x0c,	%l2
loop_2029:
	umulcc	%g3,	0x16E9,	%i7
	movrne	%o2,	%o1,	%i3
	subccc	%l0,	0x0B57,	%i5
	fbne,a	%fcc1,	loop_2030
	edge16ln	%i1,	%l5,	%o0
	brgez,a	%g2,	loop_2031
	bge,a	%icc,	loop_2032
loop_2030:
	edge16l	%i0,	%i6,	%l1
	ldub	[%l7 + 0x1B],	%l4
loop_2031:
	fornot2	%f18,	%f22,	%f4
loop_2032:
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
	bn,pn	%icc,	loop_2034
	subccc	%o6,	%i4,	%o5
	fcmpgt16	%f28,	%f4,	%i2
loop_2033:
	fmovdvc	%icc,	%f1,	%f1
loop_2034:
	udivx	%g6,	0x01F9,	%o4
	sub	%l6,	%g4,	%o7
	fmovdneg	%icc,	%f10,	%f5
	edge8n	%o3,	%g7,	%g1
	fmovse	%icc,	%f28,	%f23
	sll	%l3,	0x11,	%g5
	umulcc	%g3,	%i7,	%l2
	edge8	%o1,	%o2,	%i3
	fbn,a	%fcc3,	loop_2035
	xorcc	%i5,	0x0DC1,	%l0
	tneg	%xcc,	0x4
	movn	%xcc,	%i1,	%o0
loop_2035:
	nop
	set	0x68, %i3
	stw	%g2,	[%l7 + %i3]
	fxnor	%f14,	%f18,	%f20
	tpos	%xcc,	0x0
	fxnor	%f4,	%f30,	%f18
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x70] %asi,	%f18
	bvs,pt	%icc,	loop_2036
	call	loop_2037
	te	%icc,	0x7
	movvs	%icc,	%i0,	%i6
loop_2036:
	tpos	%xcc,	0x5
loop_2037:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l5,	%l1
	xor	%o6,	0x07AA,	%i4
	movge	%icc,	%l4,	%o5
	srax	%g6,	%i2,	%o4
	srlx	%l6,	0x1D,	%o7
	fcmple32	%f12,	%f18,	%o3
	edge32l	%g7,	%g4,	%l3
	fmovrse	%g1,	%f2,	%f2
	swap	[%l7 + 0x30],	%g3
	bvc,a,pt	%icc,	loop_2038
	fpsub32s	%f0,	%f21,	%f23
	movpos	%xcc,	%i7,	%g5
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x4E] %asi,	%o1
loop_2038:
	tvs	%icc,	0x0
	movpos	%icc,	%o2,	%i3
	fcmpes	%fcc1,	%f3,	%f27
	std	%f26,	[%l7 + 0x18]
	orncc	%i5,	%l0,	%l2
	fbue,a	%fcc2,	loop_2039
	stx	%i1,	[%l7 + 0x38]
	fmovde	%icc,	%f7,	%f14
	tleu	%icc,	0x6
loop_2039:
	fnand	%f16,	%f16,	%f22
	tsubcc	%o0,	%i0,	%g2
	fandnot2	%f0,	%f18,	%f4
	addc	%l5,	0x1E46,	%l1
	alignaddrl	%i6,	%o6,	%l4
	fornot2	%f28,	%f8,	%f22
	fandnot2	%f8,	%f10,	%f4
	brgz,a	%i4,	loop_2040
	udivx	%o5,	0x1D88,	%g6
	lduh	[%l7 + 0x2A],	%o4
	tle	%xcc,	0x1
loop_2040:
	fmovsg	%xcc,	%f1,	%f16
	umul	%l6,	0x1821,	%o7
	orncc	%o3,	%g7,	%g4
	orn	%l3,	%g1,	%i2
	fmovdleu	%icc,	%f27,	%f19
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%g5
	fmovda	%xcc,	%f5,	%f30
	movrlez	%i7,	0x055,	%o2
	edge8	%i3,	%i5,	%l0
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%l2
	alignaddr	%o1,	%i1,	%o0
	bvc,a,pt	%icc,	loop_2041
	tne	%xcc,	0x3
	tcs	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
loop_2041:
	fmovrde	%l5,	%f8,	%f26
	fmovsa	%icc,	%f7,	%f31
	fmovdgu	%icc,	%f21,	%f24
	bvs	%icc,	loop_2042
	tvs	%xcc,	0x6
	fmul8ulx16	%f28,	%f2,	%f0
	sethi	0x033C,	%i0
loop_2042:
	fpsub32	%f4,	%f18,	%f14
	andn	%l1,	0x1864,	%i6
	fbul	%fcc3,	loop_2043
	srax	%l4,	0x07,	%i4
	tpos	%icc,	0x0
	movgu	%xcc,	%o6,	%g6
loop_2043:
	movl	%xcc,	%o5,	%o4
	edge32	%l6,	%o7,	%o3
	wr	%g0,	0x10,	%asi
	stwa	%g7,	[%l7 + 0x3C] %asi
	ldx	[%l7 + 0x20],	%g4
	subc	%l3,	0x024D,	%g1
	fabsd	%f20,	%f26
	fcmpd	%fcc3,	%f14,	%f16
	fnot1	%f20,	%f20
	subccc	%g3,	%i2,	%g5
	fbge	%fcc3,	loop_2044
	fpadd32s	%f12,	%f2,	%f11
	tle	%xcc,	0x4
	fnands	%f25,	%f10,	%f29
loop_2044:
	movrgez	%o2,	%i3,	%i5
	movcc	%icc,	%l0,	%l2
	srax	%i7,	%i1,	%o0
	brnz,a	%o1,	loop_2045
	or	%g2,	%i0,	%l5
	bl,a	%icc,	loop_2046
	taddcc	%l1,	%i6,	%i4
loop_2045:
	tge	%xcc,	0x7
	sra	%l4,	0x1C,	%g6
loop_2046:
	movrlez	%o5,	0x34F,	%o4
	movgu	%xcc,	%l6,	%o7
	sir	0x14B6
	edge32	%o6,	%g7,	%o3
	fxor	%f10,	%f14,	%f30
	andncc	%l3,	%g1,	%g3
	addcc	%g4,	%i2,	%g5
	fbule,a	%fcc0,	loop_2047
	udivx	%o2,	0x1800,	%i3
	sdivcc	%l0,	0x0ACD,	%i5
	tg	%xcc,	0x5
loop_2047:
	addc	%l2,	0x051C,	%i1
	tgu	%xcc,	0x7
	movrgz	%i7,	0x033,	%o1
	movge	%icc,	%g2,	%o0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%l1
	bl,a	%xcc,	loop_2048
	fmovsle	%xcc,	%f21,	%f29
	sdivcc	%l5,	0x0B7A,	%i6
	bvc,a	loop_2049
loop_2048:
	tleu	%icc,	0x5
	fmovdne	%icc,	%f7,	%f21
	fbuge,a	%fcc2,	loop_2050
loop_2049:
	brz	%l4,	loop_2051
	movrgz	%g6,	%i4,	%o4
	tle	%icc,	0x4
loop_2050:
	tpos	%xcc,	0x5
loop_2051:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o5,	0x0C3D,	%o7
	fone	%f0
	edge8ln	%l6,	%g7,	%o6
	fcmpgt32	%f16,	%f18,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc0,	loop_2052
	prefetch	[%l7 + 0x10],	 0x2
	sra	%o3,	0x1D,	%g1
	edge32	%g3,	%i2,	%g5
loop_2052:
	mova	%xcc,	%g4,	%o2
	fandnot1	%f6,	%f8,	%f6
	fbuge	%fcc1,	loop_2053
	edge32n	%i3,	%l0,	%i5
	std	%f22,	[%l7 + 0x50]
	movne	%icc,	%i1,	%l2
loop_2053:
	fbu	%fcc3,	loop_2054
	sllx	%i7,	0x0A,	%g2
	fmovse	%xcc,	%f21,	%f4
	mulx	%o1,	0x1297,	%o0
loop_2054:
	array8	%l1,	%l5,	%i0
	tvc	%icc,	0x3
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x2e,	%i6
	tgu	%xcc,	0x5
	te	%xcc,	0x4
	nop
	setx loop_2055, %l0, %l1
	jmpl %l1, %g6
	and	%i4,	%l4,	%o4
	movg	%xcc,	%o5,	%l6
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2055:
	movrgz	%g7,	0x0FE,	%o6
	fand	%f24,	%f14,	%f8
	movne	%icc,	%o7,	%l3
	membar	0x7B
	sub	%o3,	%g1,	%i2
	fcmple32	%f12,	%f30,	%g3
	xnorcc	%g4,	0x15D9,	%o2
	wr	%g0,	0x0c,	%asi
	stwa	%g5,	[%l7 + 0x38] %asi
	fcmpd	%fcc3,	%f30,	%f18
	ldx	[%l7 + 0x60],	%i3
	fpsub32s	%f11,	%f10,	%f12
	wr	%g0,	0x22,	%asi
	stxa	%l0,	[%l7 + 0x78] %asi
	membar	#Sync
	umulcc	%i1,	%l2,	%i7
	sethi	0x1483,	%i5
	fmovsvs	%icc,	%f13,	%f20
	edge8n	%g2,	%o0,	%o1
	be,a,pn	%icc,	loop_2056
	xnorcc	%l1,	0x1510,	%i0
	fmovsle	%icc,	%f20,	%f31
	udivcc	%l5,	0x0F75,	%g6
loop_2056:
	movle	%icc,	%i4,	%l4
	fexpand	%f29,	%f8
	edge32ln	%o4,	%o5,	%i6
	movne	%icc,	%l6,	%o6
	and	%g7,	%o7,	%l3
	tsubcc	%o3,	0x0E45,	%i2
	xor	%g1,	%g3,	%o2
	subccc	%g4,	0x02E1,	%i3
	fmovdl	%icc,	%f26,	%f25
	movneg	%icc,	%l0,	%i1
	mulscc	%g5,	0x01ED,	%i7
	nop
	set	0x73, %i2
	ldub	[%l7 + %i2],	%i5
	fmovdn	%icc,	%f27,	%f0
	fmovsa	%xcc,	%f18,	%f12
	or	%g2,	0x0C73,	%o0
	bgu,a	%icc,	loop_2057
	andn	%o1,	%l1,	%i0
	andncc	%l5,	%l2,	%g6
	sllx	%l4,	0x0D,	%i4
loop_2057:
	movl	%icc,	%o4,	%o5
	movg	%xcc,	%i6,	%o6
	add	%g7,	%o7,	%l3
	sir	0x07F3
	edge32	%o3,	%l6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g3,	%i2,	%g4
	tsubcc	%i3,	%l0,	%o2
	sra	%g5,	%i1,	%i7
	set	0x14, %l3
	ldsha	[%l7 + %l3] 0x80,	%g2
	brgz	%o0,	loop_2058
	mova	%icc,	%o1,	%i5
	movl	%icc,	%i0,	%l5
	tcs	%icc,	0x5
loop_2058:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l1,	%l2
	bl,a,pt	%xcc,	loop_2059
	xor	%g6,	%i4,	%o4
	taddcctv	%l4,	0x1081,	%i6
	fba,a	%fcc0,	loop_2060
loop_2059:
	tle	%xcc,	0x6
	tcs	%xcc,	0x6
	array8	%o6,	%g7,	%o5
loop_2060:
	bneg,a,pt	%icc,	loop_2061
	tge	%icc,	0x1
	movrlz	%o7,	0x1F6,	%l3
	fbne,a	%fcc2,	loop_2062
loop_2061:
	bneg	%icc,	loop_2063
	and	%o3,	%g1,	%g3
	lduh	[%l7 + 0x78],	%i2
loop_2062:
	or	%g4,	0x1B79,	%l6
loop_2063:
	fabss	%f30,	%f31
	mulscc	%l0,	%o2,	%i3
	fbne	%fcc1,	loop_2064
	xorcc	%g5,	%i1,	%g2
	xorcc	%i7,	0x0D8C,	%o1
	srax	%o0,	0x1A,	%i5
loop_2064:
	ble,a,pn	%xcc,	loop_2065
	fmovs	%f7,	%f29
	umulcc	%l5,	%i0,	%l1
	edge32l	%l2,	%i4,	%o4
loop_2065:
	sdivx	%g6,	0x0B78,	%i6
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x23,	%o6
	bvc,a	%icc,	loop_2066
	movcc	%xcc,	%g7,	%o5
	edge32ln	%l4,	%l3,	%o3
	fpadd32	%f20,	%f6,	%f0
loop_2066:
	bshuffle	%f14,	%f10,	%f0
	fnand	%f0,	%f6,	%f12
	brlez,a	%o7,	loop_2067
	tleu	%icc,	0x2
	xorcc	%g1,	%i2,	%g3
	xorcc	%l6,	%l0,	%o2
loop_2067:
	fmovrde	%g4,	%f24,	%f26
	edge16l	%g5,	%i3,	%i1
	fnegd	%f28,	%f22
	movg	%icc,	%g2,	%i7
	siam	0x4
	stx	%o0,	[%l7 + 0x48]
	mova	%xcc,	%i5,	%l5
	xorcc	%o1,	0x1EE4,	%l1
	srax	%i0,	0x08,	%i4
	edge32n	%l2,	%g6,	%o4
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o6
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%g7
	ldx	[%l7 + 0x28],	%o5
	fbe	%fcc3,	loop_2068
	tvs	%icc,	0x6
	movne	%icc,	%i6,	%l3
	add	%o3,	%l4,	%g1
loop_2068:
	addccc	%i2,	%o7,	%l6
	fblg,a	%fcc3,	loop_2069
	te	%xcc,	0x7
	fnot1s	%f30,	%f16
	movrgez	%g3,	0x009,	%o2
loop_2069:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x30] %asi,	%l0
	srl	%g4,	%i3,	%i1
	srl	%g2,	0x0A,	%g5
	fpackfix	%f2,	%f29
	tsubcctv	%o0,	%i7,	%i5
	fandnot1s	%f6,	%f14,	%f16
	andn	%l5,	%l1,	%i0
	tcs	%xcc,	0x1
	edge16l	%i4,	%o1,	%g6
	edge16ln	%l2,	%o6,	%g7
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
	movle	%icc,	%o5,	%o4
	edge16n	%i6,	%l3,	%l4
	movcc	%xcc,	%g1,	%i2
	movl	%icc,	%o7,	%l6
	fmul8sux16	%f2,	%f4,	%f6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o3,	%o2
	tcs	%icc,	0x4
	ldsb	[%l7 + 0x4B],	%l0
	fandnot2s	%f31,	%f0,	%f26
	tg	%xcc,	0x7
	subcc	%g3,	%i3,	%g4
	taddcctv	%i1,	0x1109,	%g2
	ta	%icc,	0x1
	xnor	%g5,	%i7,	%i5
	smul	%l5,	%l1,	%i0
	set	0x58, %o6
	stba	%i4,	[%l7 + %o6] 0xeb
	membar	#Sync
	edge16n	%o0,	%g6,	%o1
	fmovsleu	%icc,	%f21,	%f15
	edge32n	%o6,	%l2,	%g7
	prefetch	[%l7 + 0x78],	 0x2
	fmovd	%f26,	%f30
	brlz	%o5,	loop_2070
	fnor	%f8,	%f12,	%f30
	std	%f0,	[%l7 + 0x38]
	move	%xcc,	%i6,	%l3
loop_2070:
	orn	%l4,	0x0A2C,	%o4
	orn	%i2,	0x1C38,	%o7
	call	loop_2071
	fnot1s	%f25,	%f4
	and	%g1,	%o3,	%l6
	movg	%xcc,	%o2,	%g3
loop_2071:
	tg	%xcc,	0x5
	edge32	%i3,	%l0,	%i1
	edge32l	%g2,	%g4,	%i7
	swap	[%l7 + 0x5C],	%g5
	edge8n	%i5,	%l5,	%l1
	movg	%xcc,	%i0,	%i4
	movneg	%icc,	%g6,	%o1
	brlez,a	%o6,	loop_2072
	ldx	[%l7 + 0x60],	%o0
	andcc	%g7,	%o5,	%i6
	movleu	%xcc,	%l2,	%l3
loop_2072:
	orncc	%o4,	%i2,	%l4
	fbu,a	%fcc3,	loop_2073
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%g1,	0x0022,	%o7
	udiv	%l6,	0x0DDD,	%o3
loop_2073:
	brz	%g3,	loop_2074
	fmovscs	%xcc,	%f24,	%f17
	fmovsne	%xcc,	%f29,	%f25
	siam	0x5
loop_2074:
	nop
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x20] %asi,	%o2
	fandnot2	%f18,	%f16,	%f26
	array32	%i3,	%l0,	%g2
	prefetch	[%l7 + 0x60],	 0x2
	wr	%g0,	0x89,	%asi
	stba	%i1,	[%l7 + 0x36] %asi
	fpack16	%f26,	%f23
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x10] %asi,	%g4
	edge8l	%i7,	%g5,	%i5
	fbe	%fcc0,	loop_2075
	fmul8ulx16	%f12,	%f26,	%f12
	fsrc2	%f2,	%f4
	sir	0x003C
loop_2075:
	tle	%xcc,	0x3
	movcc	%xcc,	%l1,	%i0
	tneg	%xcc,	0x5
	fmovsle	%icc,	%f1,	%f23
	tpos	%icc,	0x2
	fors	%f11,	%f2,	%f22
	taddcc	%i4,	0x0C06,	%g6
	sdivcc	%o1,	0x05F0,	%l5
	tgu	%icc,	0x4
	andn	%o0,	%o6,	%o5
	smul	%g7,	%l2,	%i6
	orcc	%o4,	%i2,	%l4
	and	%l3,	%g1,	%l6
	umul	%o7,	%o3,	%o2
	fmovdcc	%icc,	%f27,	%f23
	set	0x1C, %o4
	sta	%f7,	[%l7 + %o4] 0x89
	fxor	%f24,	%f2,	%f30
	movpos	%xcc,	%i3,	%g3
	taddcc	%g2,	0x1C16,	%l0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i1,	%g4
	stbar
	fpmerge	%f18,	%f26,	%f12
	fmovdg	%xcc,	%f19,	%f11
	fbl,a	%fcc1,	loop_2076
	movrlez	%i7,	0x378,	%i5
	sethi	0x012B,	%g5
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
loop_2076:
	nop
	wr	%g0,	0x20,	%asi
	stxa	%i4,	[%g0 + 0x8] %asi
	mulscc	%i0,	%o1,	%l5
	movcc	%icc,	%g6,	%o0
	swap	[%l7 + 0x4C],	%o5
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	xnor	%g7,	0x0938,	%l2
	movn	%xcc,	%i6,	%o4
	movrlez	%i2,	0x2FF,	%l4
	fbl	%fcc2,	loop_2077
	xnor	%o6,	%g1,	%l6
	fmuld8ulx16	%f6,	%f22,	%f8
	fcmpes	%fcc0,	%f31,	%f4
loop_2077:
	brlz	%l3,	loop_2078
	fbl	%fcc1,	loop_2079
	subcc	%o3,	%o7,	%o2
	fmovsle	%icc,	%f24,	%f5
loop_2078:
	alignaddr	%g3,	%g2,	%l0
loop_2079:
	tsubcctv	%i1,	%g4,	%i7
	subc	%i5,	%i3,	%g5
	fmovrdgez	%i4,	%f26,	%f28
	orn	%i0,	%l1,	%l5
	addccc	%g6,	0x0441,	%o1
	bleu,a,pn	%xcc,	loop_2080
	fmovsle	%icc,	%f14,	%f31
	udivcc	%o0,	0x1D50,	%o5
	fmovdcc	%icc,	%f28,	%f4
loop_2080:
	alignaddrl	%l2,	%i6,	%g7
	movrne	%o4,	0x25C,	%l4
	movrlez	%i2,	0x032,	%o6
	movrgez	%g1,	%l6,	%o3
	tvc	%xcc,	0x7
	set	0x48, %o7
	ldsha	[%l7 + %o7] 0x80,	%o7
	fmovdcs	%icc,	%f20,	%f7
	fmuld8sux16	%f30,	%f16,	%f22
	tvc	%icc,	0x3
	tn	%icc,	0x6
	fmovscc	%xcc,	%f0,	%f3
	sub	%o2,	0x005D,	%g3
	movvc	%xcc,	%g2,	%l3
	fmovsa	%icc,	%f3,	%f27
	edge8l	%i1,	%g4,	%l0
	or	%i5,	0x0E8D,	%i3
	movrgz	%g5,	0x204,	%i4
	fornot1	%f24,	%f26,	%f6
	tgu	%icc,	0x4
	addc	%i7,	0x1940,	%i0
	sethi	0x1E8A,	%l1
	fpadd32	%f14,	%f6,	%f20
	movl	%xcc,	%l5,	%o1
	be	loop_2081
	xor	%o0,	%g6,	%l2
	fbg,a	%fcc3,	loop_2082
	fxnor	%f10,	%f6,	%f14
loop_2081:
	smulcc	%i6,	%o5,	%o4
	fmovrslez	%l4,	%f0,	%f22
loop_2082:
	movleu	%xcc,	%i2,	%o6
	ld	[%l7 + 0x2C],	%f11
	sdiv	%g1,	0x191F,	%l6
	stb	%g7,	[%l7 + 0x76]
	andncc	%o7,	%o2,	%o3
	fmuld8sux16	%f23,	%f1,	%f8
	fmovsvc	%icc,	%f25,	%f1
	bleu,a	loop_2083
	tge	%xcc,	0x4
	brlz	%g3,	loop_2084
	umul	%l3,	0x0252,	%g2
loop_2083:
	tsubcc	%g4,	%l0,	%i1
	fmovda	%icc,	%f30,	%f19
loop_2084:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,pn	%icc,	loop_2085
	and	%i3,	%i5,	%i4
	tgu	%icc,	0x1
	umul	%g5,	0x0257,	%i7
loop_2085:
	movrgz	%i0,	%l1,	%l5
	fble	%fcc0,	loop_2086
	tn	%xcc,	0x0
	fnot2	%f8,	%f2
	sir	0x0244
loop_2086:
	brlez,a	%o1,	loop_2087
	tle	%icc,	0x4
	ldsb	[%l7 + 0x1B],	%o0
	tg	%icc,	0x5
loop_2087:
	fbule,a	%fcc2,	loop_2088
	udiv	%g6,	0x1110,	%l2
	fandnot1s	%f1,	%f3,	%f0
	edge32ln	%o5,	%i6,	%o4
loop_2088:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i2,	0x06,	%l4
	smul	%o6,	%g1,	%g7
	sdiv	%l6,	0x17EA,	%o2
	movneg	%icc,	%o3,	%g3
	mulx	%l3,	%g2,	%o7
	fbu,a	%fcc0,	loop_2089
	tne	%icc,	0x0
	and	%l0,	%i1,	%g4
	fandnot2	%f2,	%f6,	%f6
loop_2089:
	movgu	%icc,	%i3,	%i4
	edge16ln	%g5,	%i7,	%i5
	fpsub32	%f0,	%f22,	%f2
	srlx	%i0,	0x05,	%l5
	fand	%f24,	%f14,	%f28
	subccc	%l1,	%o0,	%o1
	ldd	[%l7 + 0x40],	%f18
	ba,pt	%icc,	loop_2090
	fmovsgu	%xcc,	%f31,	%f2
	addc	%g6,	0x13B7,	%o5
	array16	%i6,	%o4,	%l2
loop_2090:
	edge8l	%i2,	%o6,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l4,	0x1768,	%l6
	array8	%g7,	%o3,	%o2
	bleu,pt	%xcc,	loop_2091
	array32	%l3,	%g2,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l0,	%o7
loop_2091:
	fmul8x16al	%f3,	%f15,	%f2
	subccc	%i1,	%i3,	%g4
	fmovsgu	%xcc,	%f5,	%f9
	tsubcc	%g5,	%i7,	%i5
	swap	[%l7 + 0x14],	%i0
	fornot1	%f10,	%f20,	%f22
	ldd	[%l7 + 0x38],	%i4
	sth	%l1,	[%l7 + 0x22]
	addcc	%l5,	%o1,	%g6
	fmovrslz	%o0,	%f28,	%f31
	subccc	%i6,	%o5,	%o4
	movge	%icc,	%i2,	%o6
	fmovsn	%xcc,	%f15,	%f8
	add	%l2,	0x0AC1,	%l4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%g7
	fandnot1s	%f20,	%f31,	%f21
	fcmpgt32	%f28,	%f0,	%g1
	xorcc	%o2,	%o3,	%l3
	tneg	%xcc,	0x7
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x2e,	%g2
	sdivx	%l0,	0x161D,	%g3
	ldsb	[%l7 + 0x64],	%o7
	nop
	setx	loop_2092,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bne	%icc,	loop_2093
	srlx	%i3,	%g4,	%i1
	array8	%i7,	%i5,	%i0
loop_2092:
	fblg,a	%fcc0,	loop_2094
loop_2093:
	array16	%i4,	%g5,	%l5
	fmovd	%f18,	%f16
	edge16ln	%o1,	%g6,	%l1
loop_2094:
	edge16	%i6,	%o5,	%o0
	array16	%o4,	%o6,	%i2
	addc	%l4,	0x1953,	%l6
	set	0x7A, %l2
	stba	%g7,	[%l7 + %l2] 0xeb
	membar	#Sync
	bcc	loop_2095
	array32	%l2,	%g1,	%o2
	addc	%o3,	%g2,	%l3
	sth	%l0,	[%l7 + 0x48]
loop_2095:
	popc	0x1088,	%o7
	stx	%g3,	[%l7 + 0x60]
	fmovrdne	%i3,	%f8,	%f2
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i1
	membar	0x6D
	fmovdge	%xcc,	%f16,	%f20
	fsrc1	%f8,	%f4
	move	%xcc,	%g4,	%i7
	stb	%i5,	[%l7 + 0x0A]
	fnors	%f7,	%f15,	%f25
	fnands	%f28,	%f13,	%f13
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%i4,	%f23,	%f13
	nop
	set	0x58, %g7
	ldd	[%l7 + %g7],	%f14
	udivcc	%g5,	0x1CD0,	%l5
	fbue	%fcc0,	loop_2096
	fbue,a	%fcc1,	loop_2097
	nop
	setx	loop_2098,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movneg	%xcc,	%i0,	%o1
loop_2096:
	fmovsle	%icc,	%f20,	%f17
loop_2097:
	fands	%f3,	%f26,	%f24
loop_2098:
	movgu	%icc,	%l1,	%g6
	edge8ln	%o5,	%i6,	%o0
	movrgz	%o4,	0x3C6,	%i2
	fmovspos	%xcc,	%f23,	%f30
	fbge,a	%fcc1,	loop_2099
	brgz	%o6,	loop_2100
	fpack32	%f22,	%f0,	%f28
	fbo	%fcc3,	loop_2101
loop_2099:
	tsubcctv	%l4,	0x1C88,	%g7
loop_2100:
	tleu	%xcc,	0x2
	fand	%f18,	%f12,	%f6
loop_2101:
	nop
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%g1
	edge16ln	%l2,	%o3,	%o2
	fbg,a	%fcc2,	loop_2102
	fnands	%f25,	%f20,	%f5
	movne	%xcc,	%g2,	%l3
	srax	%l0,	%o7,	%g3
loop_2102:
	movne	%icc,	%i3,	%i1
	fbu	%fcc0,	loop_2103
	smulcc	%i7,	%g4,	%i4
	fsrc1	%f12,	%f28
	addc	%i5,	%g5,	%l5
loop_2103:
	ta	%xcc,	0x4
	movl	%icc,	%o1,	%l1
	xorcc	%g6,	%i0,	%o5
	movgu	%xcc,	%i6,	%o0
	fpadd32s	%f12,	%f27,	%f3
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x08] %asi,	%i2
	andcc	%o4,	0x1951,	%l4
	fmuld8sux16	%f1,	%f15,	%f30
	edge16l	%o6,	%g7,	%g1
	movle	%xcc,	%l6,	%l2
	fmovsge	%icc,	%f3,	%f26
	umul	%o2,	0x0FEC,	%g2
	sdiv	%l3,	0x0B1E,	%o3
	umulcc	%l0,	%g3,	%o7
	movgu	%icc,	%i3,	%i7
	fpackfix	%f30,	%f7
	set	0x64, %i0
	ldsha	[%l7 + %i0] 0x11,	%i1
	movg	%xcc,	%g4,	%i4
	bvc,a,pt	%icc,	loop_2104
	sllx	%i5,	%l5,	%o1
	addc	%g5,	0x0453,	%g6
	stbar
loop_2104:
	srax	%l1,	0x0E,	%i0
	sethi	0x13E3,	%i6
	fmuld8sux16	%f5,	%f8,	%f26
	movn	%icc,	%o0,	%i2
	edge8ln	%o4,	%o5,	%o6
	umulcc	%l4,	%g7,	%l6
	fbn	%fcc3,	loop_2105
	fmovsle	%xcc,	%f22,	%f27
	fxnors	%f23,	%f30,	%f4
	fmovsg	%icc,	%f31,	%f0
loop_2105:
	lduw	[%l7 + 0x78],	%l2
	fpsub16	%f26,	%f2,	%f26
	fbge,a	%fcc0,	loop_2106
	for	%f8,	%f28,	%f22
	fcmps	%fcc0,	%f12,	%f18
	fandnot2s	%f9,	%f0,	%f31
loop_2106:
	nop
	wr	%g0,	0x88,	%asi
	stba	%o2,	[%l7 + 0x6F] %asi
	tvs	%xcc,	0x1
	addccc	%g2,	0x1E53,	%l3
	te	%icc,	0x1
	xorcc	%o3,	0x1DD6,	%l0
	edge8ln	%g3,	%o7,	%g1
	set	0x18, %o2
	stwa	%i7,	[%l7 + %o2] 0x22
	membar	#Sync
	movre	%i3,	%g4,	%i4
	fmovdgu	%xcc,	%f18,	%f1
	alignaddrl	%i1,	%l5,	%o1
	movcc	%icc,	%g5,	%i5
	fmovrdlez	%g6,	%f30,	%f16
	bcc,a,pt	%xcc,	loop_2107
	mulscc	%i0,	%i6,	%l1
	set	0x18, %l1
	ldsha	[%l7 + %l1] 0x80,	%i2
loop_2107:
	movpos	%xcc,	%o4,	%o5
	edge32l	%o6,	%l4,	%g7
	sth	%o0,	[%l7 + 0x34]
	movne	%icc,	%l2,	%l6
	andcc	%g2,	0x18CF,	%l3
	fandnot2	%f22,	%f2,	%f10
	nop
	setx	loop_2108,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x08CD,	%o2
	sethi	0x1E61,	%l0
	fbuge,a	%fcc2,	loop_2109
loop_2108:
	movrgz	%o3,	0x34C,	%g3
	fzeros	%f11
	srl	%o7,	%i7,	%i3
loop_2109:
	tcs	%xcc,	0x5
	movn	%icc,	%g4,	%i4
	edge8n	%g1,	%l5,	%i1
	taddcc	%o1,	0x1637,	%g5
	fmovsn	%xcc,	%f6,	%f11
	fmovrsgez	%g6,	%f16,	%f6
	taddcc	%i5,	0x1FC6,	%i0
	orcc	%l1,	0x0AB1,	%i6
	nop
	setx	loop_2110,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpsub16	%f24,	%f2,	%f0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
loop_2110:
	fmovsleu	%xcc,	%f1,	%f8
	srax	%o4,	%o5,	%l4
	fbuge,a	%fcc2,	loop_2111
	move	%xcc,	%o6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o0,	0x0026,	%l2
loop_2111:
	fxor	%f24,	%f16,	%f28
	orcc	%l6,	%g2,	%l3
	bvc	%icc,	loop_2112
	fmul8x16al	%f0,	%f16,	%f16
	tvs	%xcc,	0x5
	set	0x2E, %l5
	stha	%o2,	[%l7 + %l5] 0x22
	membar	#Sync
loop_2112:
	xnor	%o3,	%l0,	%g3
	tn	%icc,	0x7
	fmovda	%xcc,	%f26,	%f28
	addc	%o7,	%i3,	%g4
	movne	%icc,	%i7,	%i4
	subc	%l5,	0x037E,	%i1
	srax	%g1,	%g5,	%g6
	orcc	%o1,	0x1FB6,	%i5
	subcc	%l1,	%i0,	%i2
	addc	%i6,	%o4,	%l4
	movcs	%xcc,	%o5,	%o6
	smul	%o0,	0x1CE6,	%g7
	array8	%l6,	%g2,	%l3
	fpadd16	%f30,	%f26,	%f8
	movle	%xcc,	%l2,	%o2
	brnz,a	%o3,	loop_2113
	fones	%f13
	or	%l0,	0x0B34,	%o7
	tvs	%icc,	0x2
loop_2113:
	ldd	[%l7 + 0x48],	%f14
	ba	loop_2114
	fmovdneg	%xcc,	%f3,	%f8
	movre	%g3,	0x01B,	%g4
	tleu	%xcc,	0x4
loop_2114:
	sdivcc	%i7,	0x0FBC,	%i4
	edge16n	%l5,	%i1,	%i3
	call	loop_2115
	fsrc1	%f28,	%f28
	fmovrdgz	%g5,	%f22,	%f26
	fand	%f22,	%f0,	%f30
loop_2115:
	fmovsn	%icc,	%f17,	%f9
	alignaddrl	%g1,	%g6,	%o1
	edge8	%i5,	%i0,	%l1
	addccc	%i6,	%o4,	%l4
	srlx	%o5,	%o6,	%o0
	ldx	[%l7 + 0x78],	%g7
	taddcc	%i2,	0x1A60,	%l6
	mova	%xcc,	%l3,	%g2
	tcc	%icc,	0x1
	tcc	%xcc,	0x7
	tgu	%icc,	0x0
	mulx	%o2,	0x155A,	%l2
	bneg,a,pt	%xcc,	loop_2116
	movvc	%xcc,	%l0,	%o7
	edge16ln	%o3,	%g3,	%i7
	move	%xcc,	%i4,	%g4
loop_2116:
	tne	%icc,	0x2
	movrlz	%l5,	0x13F,	%i1
	fblg,a	%fcc0,	loop_2117
	edge16ln	%g5,	%g1,	%g6
	tcc	%xcc,	0x5
	alignaddrl	%o1,	%i5,	%i0
loop_2117:
	tleu	%xcc,	0x4
	bcc	loop_2118
	tle	%icc,	0x4
	fmovsge	%xcc,	%f27,	%f10
	edge16	%i3,	%i6,	%l1
loop_2118:
	fbule,a	%fcc0,	loop_2119
	nop
	set	0x62, %l0
	stb	%l4,	[%l7 + %l0]
	tpos	%xcc,	0x6
	sra	%o4,	0x14,	%o6
loop_2119:
	xor	%o5,	%g7,	%o0
	movle	%xcc,	%i2,	%l3
	movge	%xcc,	%g2,	%l6
	subc	%l2,	%o2,	%l0
	tneg	%icc,	0x2
	fbe,a	%fcc0,	loop_2120
	brgez	%o3,	loop_2121
	alignaddrl	%g3,	%i7,	%o7
	mova	%icc,	%i4,	%g4
loop_2120:
	fnand	%f2,	%f4,	%f8
loop_2121:
	srax	%l5,	%i1,	%g5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g1,	%o1
	fbo,a	%fcc0,	loop_2122
	sdivx	%g6,	0x148C,	%i5
	fcmpes	%fcc3,	%f15,	%f3
	fbne	%fcc0,	loop_2123
loop_2122:
	fandnot2s	%f13,	%f15,	%f9
	movvs	%icc,	%i0,	%i6
	fmovsl	%icc,	%f9,	%f11
loop_2123:
	fbg	%fcc3,	loop_2124
	brgez	%i3,	loop_2125
	bg,pt	%xcc,	loop_2126
	tvs	%xcc,	0x7
loop_2124:
	taddcc	%l4,	%l1,	%o4
loop_2125:
	subccc	%o6,	%o5,	%g7
loop_2126:
	sdiv	%o0,	0x01F2,	%i2
	set	0x4C, %i7
	stwa	%g2,	[%l7 + %i7] 0x0c
	and	%l6,	0x0416,	%l3
	movl	%icc,	%o2,	%l0
	fmuld8sux16	%f11,	%f1,	%f2
	fmovrsne	%o3,	%f28,	%f15
	fcmpeq32	%f20,	%f16,	%l2
	tg	%xcc,	0x0
	set	0x30, %i5
	stxa	%i7,	[%l7 + %i5] 0x2b
	membar	#Sync
	add	%o7,	0x0B77,	%g3
	udivx	%i4,	0x1E14,	%l5
	movvc	%icc,	%g4,	%i1
	movcs	%xcc,	%g5,	%g1
	fblg	%fcc1,	loop_2127
	bvs,pn	%xcc,	loop_2128
	fornot1	%f10,	%f10,	%f0
	ldd	[%l7 + 0x20],	%f10
loop_2127:
	srl	%g6,	0x06,	%o1
loop_2128:
	nop
	set	0x12, %o5
	lduba	[%l7 + %o5] 0x15,	%i5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x5C] %asi,	%i0
	membar	0x40
	subcc	%i6,	0x1B61,	%i3
	xnorcc	%l1,	0x0B26,	%o4
	movvc	%xcc,	%l4,	%o5
	sethi	0x0868,	%g7
	set	0x54, %g2
	lda	[%l7 + %g2] 0x81,	%f14
	tge	%icc,	0x6
	umul	%o0,	%i2,	%o6
	umul	%l6,	%g2,	%l3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%o3
	tvc	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l0,	0x15AA,	%i7
	array16	%o7,	%l2,	%i4
	movrlz	%g3,	0x17C,	%g4
	nop
	setx loop_2129, %l0, %l1
	jmpl %l1, %l5
	fmovrsgez	%g5,	%f25,	%f10
	st	%f28,	[%l7 + 0x5C]
	movne	%icc,	%g1,	%g6
loop_2129:
	fandnot2	%f2,	%f30,	%f30
	and	%i1,	0x161E,	%o1
	umulcc	%i5,	%i6,	%i0
	fmovdpos	%icc,	%f15,	%f28
	set	0x8, %g3
	ldxa	[%g0 + %g3] 0x20,	%l1
	movcc	%xcc,	%o4,	%i3
	fmovdgu	%icc,	%f14,	%f27
	fandnot1	%f20,	%f6,	%f2
	movvc	%icc,	%l4,	%o5
	fpadd32	%f2,	%f0,	%f8
	tl	%icc,	0x3
	andcc	%o0,	0x0EDD,	%i2
	sra	%o6,	%l6,	%g2
	set	0x38, %o3
	ldswa	[%l7 + %o3] 0x14,	%g7
	stx	%l3,	[%l7 + 0x30]
	xnor	%o3,	%l0,	%o2
	edge32l	%o7,	%i7,	%l2
	ldstub	[%l7 + 0x6A],	%i4
	orncc	%g4,	0x095A,	%g3
	udivcc	%g5,	0x08E4,	%g1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x16] %asi,	%g6
	movleu	%icc,	%l5,	%o1
	bg,a	%icc,	loop_2130
	tn	%icc,	0x7
	fcmpne16	%f0,	%f20,	%i1
	array32	%i6,	%i5,	%i0
loop_2130:
	tvc	%icc,	0x7
	sll	%l1,	0x08,	%i3
	tvs	%icc,	0x2
	tl	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l4,	%o4
	fxnor	%f8,	%f18,	%f12
	andncc	%o0,	%i2,	%o5
	sub	%o6,	0x1039,	%g2
	fmovdvs	%icc,	%f27,	%f15
	fsrc1	%f22,	%f28
	or	%l6,	%l3,	%g7
	xor	%o3,	0x17F9,	%l0
	set	0x4E, %o0
	ldsba	[%l7 + %o0] 0x10,	%o7
	tvs	%xcc,	0x1
	edge16l	%i7,	%l2,	%o2
	array32	%g4,	%g3,	%i4
	tn	%icc,	0x0
	tcs	%xcc,	0x7
	fmovrsne	%g5,	%f22,	%f20
	bg,a,pn	%xcc,	loop_2131
	te	%icc,	0x4
	bgu,a	loop_2132
	stw	%g6,	[%l7 + 0x14]
loop_2131:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f12,	%f12,	%l5
loop_2132:
	tsubcctv	%o1,	0x1EA0,	%g1
	fmovscc	%xcc,	%f12,	%f3
	sdivcc	%i1,	0x1FF0,	%i6
	orcc	%i5,	0x1194,	%i0
	fnors	%f13,	%f0,	%f9
	siam	0x4
	tleu	%icc,	0x1
	fexpand	%f18,	%f22
	tvs	%xcc,	0x4
	sth	%i3,	[%l7 + 0x20]
	tcc	%xcc,	0x5
	fabss	%f4,	%f23
	array8	%l4,	%o4,	%l1
	fpadd16	%f4,	%f24,	%f20
	ld	[%l7 + 0x58],	%f26
	tsubcctv	%o0,	%o5,	%i2
	fba,a	%fcc3,	loop_2133
	sth	%g2,	[%l7 + 0x4C]
	nop
	setx loop_2134, %l0, %l1
	jmpl %l1, %l6
	fone	%f30
loop_2133:
	fbo,a	%fcc1,	loop_2135
	tcs	%icc,	0x2
loop_2134:
	smulcc	%o6,	0x0C92,	%l3
	and	%o3,	%g7,	%o7
loop_2135:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x50] %asi,	%l0
	sllx	%i7,	%o2,	%l2
	prefetch	[%l7 + 0x30],	 0x2
	alignaddrl	%g4,	%i4,	%g3
	membar	0x21
	wr	%g0,	0x4f,	%asi
	stxa	%g6,	[%g0 + 0x0] %asi
	popc	%g5,	%o1
	fpsub16s	%f12,	%f2,	%f3
	tgu	%icc,	0x3
	bleu	%xcc,	loop_2136
	fmovrsne	%l5,	%f0,	%f14
	movre	%g1,	%i6,	%i5
	xorcc	%i1,	0x0DB0,	%i0
loop_2136:
	nop
	set	0x1B, %i4
	stba	%i3,	[%l7 + %i4] 0x22
	membar	#Sync
	edge16n	%o4,	%l1,	%l4
	edge16l	%o0,	%o5,	%i2
	ta	%xcc,	0x2
	fornot1	%f24,	%f4,	%f14
	addcc	%l6,	0x0EB5,	%g2
	movvs	%xcc,	%o6,	%o3
	fmovdn	%xcc,	%f11,	%f4
	prefetch	[%l7 + 0x4C],	 0x1
	andncc	%l3,	%g7,	%l0
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	fmovrdgz	%o7,	%f22,	%f24
	fblg,a	%fcc0,	loop_2137
	edge8l	%o2,	%g4,	%l2
	fmovrdgz	%g3,	%f26,	%f18
	fandnot2s	%f29,	%f9,	%f26
loop_2137:
	orcc	%g6,	0x123D,	%i4
	fmovrslez	%g5,	%f4,	%f13
	brgez	%o1,	loop_2138
	movrlz	%g1,	0x1FC,	%i6
	fmovrse	%l5,	%f18,	%f0
	fmovspos	%xcc,	%f24,	%f16
loop_2138:
	move	%icc,	%i1,	%i5
	fmul8x16au	%f30,	%f24,	%f6
	sir	0x002B
	movre	%i0,	%o4,	%i3
	fmovdle	%xcc,	%f27,	%f10
	fble	%fcc0,	loop_2139
	xnorcc	%l4,	%o0,	%o5
	fone	%f28
	fbne	%fcc3,	loop_2140
loop_2139:
	st	%f31,	[%l7 + 0x14]
	bvs,a	loop_2141
	fmuld8ulx16	%f2,	%f17,	%f4
loop_2140:
	fmovdneg	%icc,	%f11,	%f5
	edge8ln	%i2,	%l1,	%g2
loop_2141:
	addc	%o6,	0x0744,	%o3
	be,a,pt	%icc,	loop_2142
	st	%f13,	[%l7 + 0x74]
	ldsw	[%l7 + 0x50],	%l3
	fpack16	%f22,	%f19
loop_2142:
	andcc	%g7,	0x14A9,	%l0
	orcc	%l6,	%i7,	%o7
	edge32ln	%g4,	%o2,	%g3
	membar	0x5B
	add	%g6,	0x0090,	%i4
	te	%xcc,	0x4
	tcs	%xcc,	0x6
	bgu,a,pt	%xcc,	loop_2143
	fexpand	%f1,	%f6
	edge16n	%l2,	%o1,	%g1
	tgu	%xcc,	0x1
loop_2143:
	movpos	%icc,	%i6,	%g5
	fmul8x16	%f6,	%f2,	%f16
	udivcc	%l5,	0x0183,	%i1
	movrgz	%i5,	%i0,	%i3
	bl,a,pn	%icc,	loop_2144
	fmovsl	%xcc,	%f6,	%f24
	fmovsge	%icc,	%f25,	%f4
	tsubcctv	%o4,	%o0,	%o5
loop_2144:
	te	%icc,	0x6
	tcc	%xcc,	0x0
	stb	%l4,	[%l7 + 0x26]
	edge16ln	%i2,	%g2,	%o6
	umulcc	%l1,	%l3,	%g7
	xnor	%o3,	0x0E46,	%l6
	lduw	[%l7 + 0x0C],	%l0
	xnor	%i7,	%o7,	%g4
	tsubcc	%o2,	%g6,	%g3
	fnor	%f28,	%f24,	%f4
	fxor	%f14,	%f12,	%f0
	membar	0x04
	fmovdleu	%icc,	%f16,	%f31
	edge16n	%i4,	%l2,	%g1
	fmovspos	%icc,	%f4,	%f19
	bge,a,pn	%icc,	loop_2145
	bn,a,pn	%xcc,	loop_2146
	fmovrslez	%o1,	%f9,	%f26
	sethi	0x0E93,	%i6
loop_2145:
	tcc	%icc,	0x5
loop_2146:
	tvc	%icc,	0x3
	bgu,pt	%xcc,	loop_2147
	alignaddr	%l5,	%i1,	%g5
	bl,a,pn	%icc,	loop_2148
	edge8l	%i5,	%i3,	%o4
loop_2147:
	subcc	%i0,	0x1FF4,	%o5
	subccc	%o0,	%i2,	%g2
loop_2148:
	movn	%xcc,	%l4,	%l1
	set	0x78, %g5
	ldxa	[%l7 + %g5] 0x10,	%o6
	fcmpgt32	%f26,	%f18,	%g7
	fnand	%f2,	%f18,	%f0
	tge	%xcc,	0x3
	and	%l3,	0x1C7A,	%o3
	xnor	%l0,	%l6,	%i7
	ldd	[%l7 + 0x10],	%g4
	tcc	%xcc,	0x6
	sdivx	%o2,	0x127E,	%o7
	fcmple16	%f20,	%f28,	%g3
	ta	%xcc,	0x5
	fmovdvs	%icc,	%f14,	%f15
	movcs	%xcc,	%g6,	%i4
	movle	%icc,	%g1,	%o1
	lduw	[%l7 + 0x14],	%i6
	movrlez	%l2,	%l5,	%i1
	or	%g5,	%i5,	%i3
	xnor	%i0,	%o4,	%o5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	addcc	%g2,	0x18AF,	%o0
	brz,a	%l4,	loop_2149
	movn	%icc,	%o6,	%l1
	bvc,a	loop_2150
	fands	%f12,	%f17,	%f20
loop_2149:
	tcc	%xcc,	0x3
	tle	%xcc,	0x0
loop_2150:
	movleu	%xcc,	%l3,	%g7
	movvs	%xcc,	%o3,	%l6
	brz	%i7,	loop_2151
	fnand	%f0,	%f0,	%f12
	edge8ln	%g4,	%o2,	%l0
	fpadd16	%f18,	%f2,	%f12
loop_2151:
	tgu	%icc,	0x3
	movg	%icc,	%g3,	%g6
	sdivcc	%i4,	0x0EC6,	%g1
	mova	%xcc,	%o7,	%o1
	movle	%icc,	%i6,	%l2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x74] %asi,	%f7
	sllx	%i1,	0x15,	%l5
	fnegs	%f0,	%f13
	addc	%g5,	0x16EF,	%i5
	fsrc2	%f14,	%f2
	sub	%i3,	0x1A17,	%i0
	movrlz	%o5,	0x36C,	%o4
	movcc	%icc,	%i2,	%g2
	fmovdneg	%icc,	%f6,	%f2
	movvc	%icc,	%o0,	%l4
	edge8ln	%o6,	%l1,	%g7
	bleu,pt	%xcc,	loop_2152
	srlx	%o3,	0x0E,	%l6
	fbne,a	%fcc0,	loop_2153
	movl	%icc,	%i7,	%g4
loop_2152:
	sdivx	%l3,	0x07B7,	%l0
	bne,a,pn	%icc,	loop_2154
loop_2153:
	andn	%o2,	%g3,	%i4
	tsubcctv	%g6,	%g1,	%o7
	fbule	%fcc0,	loop_2155
loop_2154:
	prefetch	[%l7 + 0x64],	 0x3
	fmovrsne	%i6,	%f15,	%f7
	andncc	%o1,	%l2,	%i1
loop_2155:
	nop
	set	0x1A, %l4
	ldsha	[%l7 + %l4] 0x88,	%l5
	andn	%i5,	%i3,	%i0
	movrlez	%g5,	0x2EB,	%o4
	fornot2	%f0,	%f18,	%f12
	ble,a,pn	%xcc,	loop_2156
	brlz,a	%i2,	loop_2157
	array16	%g2,	%o0,	%l4
	fbo,a	%fcc0,	loop_2158
loop_2156:
	mulx	%o5,	0x0610,	%o6
loop_2157:
	edge16l	%g7,	%o3,	%l6
	tgu	%xcc,	0x3
loop_2158:
	fmovrsne	%i7,	%f9,	%f23
	movre	%l1,	0x36B,	%g4
	movneg	%icc,	%l3,	%l0
	xnorcc	%o2,	%i4,	%g6
	srax	%g1,	%g3,	%o7
	sth	%o1,	[%l7 + 0x2A]
	fbn	%fcc0,	loop_2159
	for	%f2,	%f22,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i6,	%l2
loop_2159:
	andcc	%l5,	%i5,	%i1
	nop
	setx	loop_2160,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umulcc	%i3,	0x070A,	%i0
	fmovsne	%icc,	%f21,	%f1
	wr	%g0,	0x2f,	%asi
	stha	%g5,	[%l7 + 0x30] %asi
	membar	#Sync
loop_2160:
	fpack16	%f4,	%f0
	ldsw	[%l7 + 0x18],	%i2
	sra	%o4,	0x1B,	%o0
	tvc	%xcc,	0x1
	fabss	%f20,	%f25
	movn	%xcc,	%g2,	%l4
	fmul8x16al	%f4,	%f20,	%f22
	mulx	%o6,	%o5,	%o3
	tne	%xcc,	0x1
	bcc,pt	%icc,	loop_2161
	addc	%l6,	0x0BE7,	%g7
	mova	%xcc,	%l1,	%i7
	srl	%l3,	%g4,	%l0
loop_2161:
	subccc	%o2,	%i4,	%g6
	brnz	%g3,	loop_2162
	tg	%xcc,	0x3
	fmovda	%icc,	%f6,	%f29
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x3C] %asi,	%g1
loop_2162:
	mulx	%o1,	%o7,	%l2
	fmovsvs	%xcc,	%f30,	%f21
	subc	%l5,	0x0525,	%i5
	fba	%fcc0,	loop_2163
	fmovsneg	%icc,	%f19,	%f7
	movle	%xcc,	%i6,	%i1
	fbne	%fcc1,	loop_2164
loop_2163:
	mulx	%i3,	%i0,	%i2
	array16	%g5,	%o4,	%o0
	smul	%g2,	0x126A,	%o6
loop_2164:
	fmovspos	%xcc,	%f5,	%f20
	or	%o5,	%l4,	%o3
	movg	%xcc,	%g7,	%l1
	smulcc	%l6,	%i7,	%g4
	sllx	%l3,	%l0,	%i4
	nop
	setx loop_2165, %l0, %l1
	jmpl %l1, %o2
	bne,a	%xcc,	loop_2166
	movrlez	%g6,	0x0F8,	%g1
	tvs	%xcc,	0x1
loop_2165:
	fxnors	%f31,	%f23,	%f5
loop_2166:
	movre	%g3,	%o7,	%o1
	fmovsge	%xcc,	%f27,	%f31
	membar	0x4A
	fcmpeq32	%f30,	%f26,	%l5
	call	loop_2167
	movl	%icc,	%l2,	%i6
	nop
	set	0x4A, %g6
	ldsh	[%l7 + %g6],	%i1
	add	%i5,	%i3,	%i0
loop_2167:
	fbg	%fcc0,	loop_2168
	ldx	[%l7 + 0x20],	%i2
	fbug,a	%fcc2,	loop_2169
	orcc	%o4,	0x078B,	%o0
loop_2168:
	or	%g2,	%g5,	%o6
	fmovrdlz	%l4,	%f2,	%f2
loop_2169:
	tn	%icc,	0x7
	tle	%icc,	0x0
	fmovrdgz	%o5,	%f16,	%f30
	or	%o3,	%l1,	%l6
	sll	%g7,	0x08,	%g4
	fsrc1	%f26,	%f10
	fmovscc	%icc,	%f9,	%f10
	umulcc	%i7,	0x1622,	%l0
	tsubcctv	%l3,	%o2,	%g6
	fmovsneg	%xcc,	%f22,	%f17
	edge16n	%i4,	%g1,	%o7
	tle	%xcc,	0x5
	edge32ln	%o1,	%g3,	%l5
	add	%i6,	0x18C1,	%l2
	sll	%i1,	0x19,	%i5
	ta	%icc,	0x0
	set	0x35, %i1
	lduba	[%l7 + %i1] 0x81,	%i0
	tge	%xcc,	0x3
	movn	%icc,	%i3,	%i2
	nop
	setx loop_2170, %l0, %l1
	jmpl %l1, %o0
	tcs	%icc,	0x2
	fcmpes	%fcc0,	%f11,	%f11
	smulcc	%g2,	%g5,	%o4
loop_2170:
	nop
	set	0x3A, %i6
	ldstuba	[%l7 + %i6] 0x80,	%l4
	fbe,a	%fcc3,	loop_2171
	movn	%icc,	%o6,	%o3
	sll	%l1,	0x01,	%o5
	subc	%g7,	%g4,	%l6
loop_2171:
	ba	loop_2172
	tl	%xcc,	0x4
	fbge,a	%fcc3,	loop_2173
	tn	%icc,	0x0
loop_2172:
	sdiv	%l0,	0x05E8,	%i7
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2173:
	edge32n	%o2,	%g6,	%i4
	wr	%g0,	0x88,	%asi
	stha	%g1,	[%l7 + 0x0C] %asi
	faligndata	%f10,	%f26,	%f26
	for	%f22,	%f30,	%f28
	bcc,pt	%icc,	loop_2174
	sth	%o7,	[%l7 + 0x48]
	set	0x30, %g4
	ldxa	[%l7 + %g4] 0x81,	%l3
loop_2174:
	movrgez	%o1,	0x11D,	%g3
	movge	%xcc,	%l5,	%l2
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x78] %asi,	%i6
	tne	%xcc,	0x5
	fmovd	%f2,	%f24
	move	%xcc,	%i1,	%i5
	fba,a	%fcc2,	loop_2175
	tsubcc	%i0,	%i3,	%i2
	orn	%o0,	%g5,	%o4
	subcc	%l4,	%o6,	%o3
loop_2175:
	fblg,a	%fcc2,	loop_2176
	fsrc1	%f18,	%f22
	smul	%g2,	%o5,	%g7
	sir	0x171F
loop_2176:
	movrlez	%g4,	0x24D,	%l1
	fcmpes	%fcc1,	%f19,	%f28
	bge	%xcc,	loop_2177
	bpos,pn	%icc,	loop_2178
	edge8n	%l6,	%i7,	%o2
	fand	%f2,	%f6,	%f8
loop_2177:
	fbge	%fcc1,	loop_2179
loop_2178:
	xnorcc	%g6,	%i4,	%g1
	fornot2	%f4,	%f8,	%f2
	fble,a	%fcc3,	loop_2180
loop_2179:
	movvs	%icc,	%l0,	%l3
	and	%o7,	%g3,	%l5
	edge16n	%l2,	%i6,	%i1
loop_2180:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x10,	%o1,	%i0
	fmovsl	%icc,	%f21,	%f15
	udivx	%i5,	0x0577,	%i2
	movvs	%xcc,	%i3,	%g5
	set	0x78, %o1
	prefetcha	[%l7 + %o1] 0x81,	 0x3
	srlx	%o0,	0x10,	%o6
	tcc	%icc,	0x2
	movcc	%xcc,	%o3,	%l4
	tl	%icc,	0x7
	mulx	%g2,	0x05C8,	%g7
	movneg	%xcc,	%g4,	%o5
	tg	%icc,	0x2
	xnorcc	%l1,	0x0816,	%i7
	brlz	%o2,	loop_2181
	fpadd32	%f2,	%f14,	%f18
	ldstub	[%l7 + 0x53],	%l6
	movn	%xcc,	%g6,	%i4
loop_2181:
	tvs	%icc,	0x6
	tcs	%xcc,	0x5
	sdivcc	%l0,	0x0740,	%l3
	fmovdneg	%icc,	%f14,	%f30
	movl	%xcc,	%g1,	%o7
	movcs	%icc,	%g3,	%l2
	alignaddr	%l5,	%i1,	%i6
	movle	%icc,	%i0,	%i5
	tsubcc	%o1,	0x10D7,	%i2
	sdiv	%i3,	0x0E94,	%o4
	tvc	%xcc,	0x7
	edge32l	%g5,	%o6,	%o0
	fmovsleu	%xcc,	%f20,	%f8
	tpos	%icc,	0x0
	smul	%l4,	0x0B10,	%g2
	xorcc	%g7,	%o3,	%g4
	flush	%l7 + 0x2C
	tg	%xcc,	0x4
	srl	%o5,	%i7,	%l1
	bcs,a,pt	%xcc,	loop_2182
	tsubcc	%o2,	0x03EF,	%l6
	bn,a	%icc,	loop_2183
	andn	%g6,	0x0866,	%l0
loop_2182:
	fmovsge	%xcc,	%f21,	%f25
	fpsub16s	%f30,	%f26,	%f23
loop_2183:
	fsrc2s	%f8,	%f5
	fmovrsgez	%i4,	%f20,	%f17
	movvs	%icc,	%g1,	%l3
	tl	%xcc,	0x2
	ldd	[%l7 + 0x20],	%f20
	subccc	%g3,	0x1ECA,	%l2
	for	%f20,	%f16,	%f18
	fbge,a	%fcc2,	loop_2184
	array32	%o7,	%i1,	%l5
	wr	%g0,	0x80,	%asi
	stba	%i0,	[%l7 + 0x6B] %asi
loop_2184:
	fmovdvc	%icc,	%f4,	%f1
	tcs	%xcc,	0x6
	movcs	%xcc,	%i6,	%i5
	fcmps	%fcc1,	%f1,	%f30
	faligndata	%f30,	%f16,	%f8
	fbul,a	%fcc2,	loop_2185
	taddcc	%i2,	%i3,	%o4
	tl	%xcc,	0x2
	fzero	%f14
loop_2185:
	udivx	%g5,	0x1311,	%o1
	fmovdvs	%xcc,	%f27,	%f24
	flush	%l7 + 0x28
	set	0x18, %i2
	ldxa	[%l7 + %i2] 0x18,	%o6
	mulx	%l4,	0x188C,	%o0
	stb	%g2,	[%l7 + 0x41]
	sethi	0x1A3A,	%o3
	fmuld8sux16	%f21,	%f9,	%f8
	fmovs	%f26,	%f28
	tpos	%icc,	0x1
	orn	%g4,	0x014E,	%g7
	bneg	loop_2186
	orn	%o5,	0x1357,	%l1
	std	%i6,	[%l7 + 0x78]
	xnorcc	%o2,	%g6,	%l6
loop_2186:
	movvc	%icc,	%l0,	%g1
	bgu,pt	%xcc,	loop_2187
	movrgz	%l3,	%g3,	%i4
	tvc	%xcc,	0x7
	bne,a,pt	%xcc,	loop_2188
loop_2187:
	membar	0x40
	edge8n	%l2,	%o7,	%i1
	bge	%icc,	loop_2189
loop_2188:
	fbug,a	%fcc3,	loop_2190
	call	loop_2191
	tgu	%icc,	0x2
loop_2189:
	movcc	%xcc,	%l5,	%i0
loop_2190:
	tpos	%icc,	0x6
loop_2191:
	srl	%i6,	0x13,	%i2
	movrlz	%i5,	%i3,	%o4
	sll	%g5,	%o6,	%o1
	tn	%xcc,	0x7
	fsrc1s	%f28,	%f20
	fpsub32s	%f11,	%f17,	%f2
	ld	[%l7 + 0x6C],	%f1
	nop
	set	0x38, %i3
	prefetch	[%l7 + %i3],	 0x3
	movrlz	%o0,	%g2,	%l4
	set	0x14, %l3
	sta	%f22,	[%l7 + %l3] 0x80
	fbul,a	%fcc1,	loop_2192
	fbne,a	%fcc1,	loop_2193
	movpos	%icc,	%o3,	%g7
	andcc	%g4,	0x1AE3,	%l1
loop_2192:
	movrgz	%o5,	0x340,	%o2
loop_2193:
	bleu,pn	%xcc,	loop_2194
	fandnot1s	%f10,	%f21,	%f31
	edge8	%g6,	%i7,	%l6
	andn	%l0,	%g1,	%l3
loop_2194:
	ldsh	[%l7 + 0x66],	%i4
	ldub	[%l7 + 0x45],	%g3
	fmovrsne	%l2,	%f27,	%f28
	fones	%f2
	edge32n	%i1,	%o7,	%i0
	orncc	%l5,	%i2,	%i5
	xnor	%i3,	%i6,	%o4
	andn	%g5,	%o6,	%o0
	swap	[%l7 + 0x74],	%o1
	fmovdg	%icc,	%f3,	%f10
	smul	%l4,	0x07DF,	%o3
	bvc	loop_2195
	sdivcc	%g2,	0x049F,	%g7
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x80,	%f16
loop_2195:
	membar	0x51
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x30] %asi,	%g4
	srl	%o5,	%o2,	%l1
	movvc	%icc,	%g6,	%l6
	alignaddrl	%l0,	%g1,	%i7
	popc	0x1B25,	%i4
	fmovrde	%l3,	%f14,	%f30
	fmovdge	%xcc,	%f22,	%f0
	movcc	%xcc,	%l2,	%i1
	movge	%icc,	%o7,	%i0
	ldstub	[%l7 + 0x08],	%g3
	set	0x60, %o4
	ldstuba	[%l7 + %o4] 0x04,	%l5
	sdivx	%i5,	0x0EFF,	%i2
	fbue	%fcc2,	loop_2196
	andn	%i3,	%i6,	%g5
	bvc,a,pn	%icc,	loop_2197
	stbar
loop_2196:
	and	%o6,	%o0,	%o4
	array32	%o1,	%l4,	%o3
loop_2197:
	nop
	setx loop_2198, %l0, %l1
	jmpl %l1, %g2
	mova	%icc,	%g7,	%o5
	fabss	%f8,	%f9
	or	%g4,	0x0FE6,	%o2
loop_2198:
	smul	%g6,	0x1A5B,	%l6
	fmuld8sux16	%f2,	%f9,	%f4
	smulcc	%l1,	0x11DA,	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x88,	%g1,	%i4
	fmovdne	%icc,	%f1,	%f19
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%l2
	sir	0x14DF
	andcc	%l3,	0x1B3C,	%i1
	srl	%o7,	0x1E,	%g3
	tne	%icc,	0x5
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
	sdivcc	%l5,	0x1C50,	%i0
	sra	%i2,	0x18,	%i5
	fabsd	%f24,	%f14
loop_2199:
	nop
	set	0x50, %o7
	prefetcha	[%l7 + %o7] 0x88,	 0x1
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7B] %asi,	%i6
	fcmpd	%fcc3,	%f22,	%f16
	sdiv	%o6,	0x01DA,	%o0
	ble	%xcc,	loop_2200
	bvs,pn	%xcc,	loop_2201
	movg	%icc,	%o4,	%o1
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%g5,	[%g0 + 0x3f8] %asi ripped by fixASI40.pl ripped by fixASI40.pl
loop_2200:
	taddcctv	%o3,	%g2,	%g7
loop_2201:
	tne	%xcc,	0x5
	subc	%o5,	0x0E59,	%g4
	lduh	[%l7 + 0x1A],	%o2
	fnands	%f22,	%f8,	%f9
	smulcc	%l4,	%g6,	%l6
	edge16n	%l0,	%g1,	%l1
	movrlz	%i7,	0x36A,	%l2
	taddcc	%l3,	%i4,	%o7
	edge16	%g3,	%i1,	%l5
	edge32ln	%i2,	%i0,	%i3
	fmovscs	%xcc,	%f24,	%f23
	fexpand	%f24,	%f18
	flush	%l7 + 0x38
	smul	%i5,	%i6,	%o0
	ld	[%l7 + 0x68],	%f14
	movcc	%xcc,	%o4,	%o1
	fbug	%fcc3,	loop_2202
	mulscc	%o6,	%g5,	%o3
	ta	%xcc,	0x4
	umulcc	%g2,	%o5,	%g7
loop_2202:
	fcmpes	%fcc3,	%f17,	%f8
	taddcc	%g4,	%o2,	%g6
	ta	%xcc,	0x6
	sth	%l6,	[%l7 + 0x1C]
	bvc,a,pn	%xcc,	loop_2203
	edge32ln	%l0,	%l4,	%g1
	fpmerge	%f9,	%f17,	%f24
	wr	%g0,	0x21,	%asi
	stxa	%i7,	[%g0 + 0x10] %asi
loop_2203:
	bleu,pt	%xcc,	loop_2204
	sra	%l1,	%l3,	%l2
	for	%f18,	%f16,	%f18
	nop
	set	0x14, %o6
	ldsh	[%l7 + %o6],	%i4
loop_2204:
	tvc	%xcc,	0x5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x74] %asi,	%o7
	bl,pt	%icc,	loop_2205
	movneg	%xcc,	%g3,	%l5
	fpadd32s	%f16,	%f2,	%f16
	alignaddr	%i1,	%i0,	%i3
loop_2205:
	fxnor	%f26,	%f18,	%f10
	smulcc	%i2,	0x1F0D,	%i5
	addccc	%o0,	%o4,	%o1
	array8	%o6,	%i6,	%o3
	xorcc	%g5,	%g2,	%g7
	fmovd	%f18,	%f26
	edge32	%g4,	%o5,	%g6
	fcmple32	%f8,	%f6,	%l6
	udiv	%l0,	0x0E39,	%l4
	ba	%xcc,	loop_2206
	faligndata	%f10,	%f28,	%f8
	tn	%icc,	0x0
	add	%o2,	%g1,	%l1
loop_2206:
	fmovdneg	%xcc,	%f25,	%f21
	edge16	%i7,	%l2,	%i4
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x1e
	membar	#Sync
	fmovdneg	%xcc,	%f19,	%f7
	fmovrdlz	%o7,	%f26,	%f20
	fpsub32	%f6,	%f14,	%f20
	or	%l3,	%l5,	%g3
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x5C] %asi,	%i0
	ldd	[%l7 + 0x20],	%i0
	srl	%i2,	0x1D,	%i5
	stbar
	edge16n	%i3,	%o0,	%o4
	brgz	%o1,	loop_2207
	brz	%o6,	loop_2208
	xnor	%o3,	%g5,	%g2
	fabsd	%f28,	%f30
loop_2207:
	sllx	%g7,	0x1C,	%g4
loop_2208:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x3
	movrlez	%o5,	%g6,	%l0
	tn	%xcc,	0x6
	bne,pn	%xcc,	loop_2209
	subc	%l4,	0x02F8,	%o2
	movle	%icc,	%g1,	%l1
	sdivx	%i7,	0x123A,	%l2
loop_2209:
	tne	%icc,	0x2
	or	%l6,	0x0192,	%o7
	orncc	%l3,	0x0CD1,	%i4
	edge16n	%g3,	%l5,	%i1
	edge16l	%i2,	%i0,	%i3
	movn	%xcc,	%i5,	%o0
	fbul	%fcc1,	loop_2210
	sdiv	%o1,	0x0D4E,	%o6
	tcs	%xcc,	0x1
	movvc	%icc,	%o3,	%o4
loop_2210:
	fmul8x16al	%f26,	%f28,	%f22
	ldd	[%l7 + 0x10],	%f8
	bvs,a,pn	%icc,	loop_2211
	fornot2	%f10,	%f16,	%f26
	sll	%g2,	%g5,	%g4
	srlx	%i6,	%g7,	%o5
loop_2211:
	nop
	set	0x68, %g7
	ldsw	[%l7 + %g7],	%g6
	tn	%xcc,	0x4
	fmovrse	%l4,	%f16,	%f31
	sra	%l0,	0x00,	%o2
	umulcc	%l1,	0x16A4,	%g1
	stbar
	fpadd16	%f28,	%f22,	%f0
	edge8l	%i7,	%l2,	%o7
	edge16ln	%l6,	%l3,	%g3
	popc	0x0A2A,	%i4
	fnegs	%f1,	%f23
	alignaddrl	%i1,	%i2,	%i0
	fmovsn	%icc,	%f19,	%f11
	fmovrdgz	%i3,	%f26,	%f8
	movpos	%icc,	%l5,	%o0
	udivx	%o1,	0x060B,	%i5
	fexpand	%f9,	%f26
	fxor	%f4,	%f0,	%f24
	fmovsle	%icc,	%f30,	%f2
	tsubcctv	%o3,	%o6,	%o4
	sdiv	%g5,	0x1393,	%g2
	fmovse	%xcc,	%f9,	%f1
	tg	%icc,	0x1
	fmovrslz	%i6,	%f11,	%f1
	nop
	setx	loop_2212,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrne	%g7,	0x02D,	%g4
	orncc	%o5,	%l4,	%l0
	array32	%o2,	%l1,	%g6
loop_2212:
	tle	%xcc,	0x1
	fxnor	%f26,	%f24,	%f24
	xorcc	%g1,	0x07EB,	%l2
	fbule,a	%fcc1,	loop_2213
	fornot2s	%f12,	%f10,	%f30
	movneg	%icc,	%o7,	%l6
	ldsh	[%l7 + 0x0E],	%l3
loop_2213:
	fcmpd	%fcc0,	%f10,	%f6
	ba,pt	%icc,	loop_2214
	tcs	%icc,	0x5
	udiv	%i7,	0x0A21,	%i4
	subccc	%g3,	%i2,	%i0
loop_2214:
	movleu	%xcc,	%i3,	%i1
	edge16l	%o0,	%o1,	%l5
	edge32ln	%o3,	%i5,	%o6
	fsrc1	%f18,	%f26
	movrgz	%g5,	%g2,	%o4
	be,a,pt	%xcc,	loop_2215
	tle	%icc,	0x2
	fxor	%f30,	%f10,	%f14
	sdiv	%g7,	0x05E2,	%i6
loop_2215:
	fmovrsgz	%o5,	%f8,	%f26
	umul	%l4,	0x09A1,	%l0
	srl	%o2,	%l1,	%g6
	subc	%g1,	0x0734,	%l2
	bvs,a,pt	%icc,	loop_2216
	fmovrslez	%g4,	%f1,	%f20
	movne	%icc,	%l6,	%o7
	edge32n	%i7,	%l3,	%i4
loop_2216:
	edge32	%g3,	%i0,	%i3
	membar	0x35
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i2
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x2a,	%o0
	movge	%xcc,	%o1,	%l5
	fmovrsne	%o3,	%f20,	%f14
	movcs	%xcc,	%i5,	%i1
	tl	%icc,	0x2
	fmovrse	%g5,	%f13,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o6,	0x1178,	%o4
	edge32	%g2,	%g7,	%o5
	call	loop_2217
	addc	%i6,	%l0,	%l4
	movcc	%xcc,	%o2,	%l1
	fnot2	%f14,	%f18
loop_2217:
	nop
	set	0x68, %o2
	stx	%g6,	[%l7 + %o2]
	orncc	%l2,	0x0D9F,	%g4
	fmovsne	%xcc,	%f9,	%f21
	bne,a	%xcc,	loop_2218
	fbul,a	%fcc2,	loop_2219
	fmovdleu	%xcc,	%f31,	%f5
	movrlez	%l6,	0x265,	%o7
loop_2218:
	nop
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i7,	%g1
loop_2219:
	popc	%i4,	%l3
	srlx	%g3,	%i3,	%i2
	movn	%xcc,	%o0,	%o1
	fmovrdlez	%i0,	%f24,	%f8
	movvs	%xcc,	%l5,	%i5
	stw	%o3,	[%l7 + 0x1C]
	orncc	%i1,	0x097F,	%o6
	tsubcctv	%o4,	0x1917,	%g5
	stx	%g2,	[%l7 + 0x18]
	membar	0x58
	subcc	%g7,	0x1EF1,	%o5
	sllx	%l0,	0x03,	%l4
	fmovdvs	%icc,	%f20,	%f30
	fmovdvc	%xcc,	%f6,	%f11
	srl	%o2,	%i6,	%g6
	movn	%icc,	%l2,	%g4
	subccc	%l6,	%o7,	%i7
	sllx	%g1,	0x16,	%l1
	tsubcctv	%l3,	0x0A31,	%g3
	sll	%i3,	0x1C,	%i4
	add	%i2,	%o1,	%o0
	edge16ln	%i0,	%l5,	%i5
	umulcc	%i1,	%o3,	%o6
	movrne	%o4,	0x256,	%g5
	fones	%f8
	movrne	%g7,	%o5,	%l0
	fbu	%fcc2,	loop_2220
	fcmple16	%f8,	%f22,	%l4
	brlez,a	%g2,	loop_2221
	mulx	%o2,	%g6,	%i6
loop_2220:
	movrne	%g4,	%l2,	%l6
	edge32	%o7,	%i7,	%g1
loop_2221:
	movcs	%icc,	%l1,	%g3
	bl,a,pt	%xcc,	loop_2222
	tneg	%icc,	0x3
	set	0x3C, %l1
	stha	%l3,	[%l7 + %l1] 0xe3
	membar	#Sync
loop_2222:
	fbl,a	%fcc0,	loop_2223
	tgu	%xcc,	0x3
	ldub	[%l7 + 0x61],	%i3
	movrlez	%i2,	0x101,	%i4
loop_2223:
	fbe,a	%fcc1,	loop_2224
	fmovdgu	%icc,	%f0,	%f28
	bvc,a,pn	%icc,	loop_2225
	call	loop_2226
loop_2224:
	movvc	%xcc,	%o0,	%o1
	alignaddrl	%i0,	%l5,	%i1
loop_2225:
	fbl	%fcc2,	loop_2227
loop_2226:
	movcc	%icc,	%o3,	%i5
	orn	%o6,	0x0E6E,	%g5
	bcs	%icc,	loop_2228
loop_2227:
	st	%f7,	[%l7 + 0x18]
	tcs	%icc,	0x5
	movle	%xcc,	%g7,	%o5
loop_2228:
	fbue	%fcc0,	loop_2229
	sdivcc	%o4,	0x1892,	%l4
	nop
	set	0x58, %l5
	stx	%l0,	[%l7 + %l5]
	andcc	%o2,	0x1187,	%g6
loop_2229:
	nop
	set	0x1C, %l0
	lduwa	[%l7 + %l0] 0x15,	%g2
	mova	%icc,	%i6,	%l2
	fxnors	%f12,	%f9,	%f9
	movcs	%icc,	%l6,	%o7
	movle	%xcc,	%g4,	%i7
	xnor	%l1,	%g3,	%l3
	fmovspos	%xcc,	%f30,	%f22
	set	0x17, %g1
	ldstuba	[%l7 + %g1] 0x19,	%i3
	orncc	%g1,	0x0803,	%i4
	fnot1	%f16,	%f2
	sth	%i2,	[%l7 + 0x50]
	fpadd32s	%f21,	%f28,	%f15
	sir	0x0DDD
	sub	%o1,	%i0,	%o0
	sethi	0x0286,	%l5
	xorcc	%i1,	0x1763,	%o3
	fmovs	%f21,	%f1
	xnorcc	%i5,	0x1F9F,	%o6
	bneg	loop_2230
	edge8l	%g7,	%o5,	%g5
	andncc	%l4,	%o4,	%o2
	xorcc	%g6,	0x115A,	%g2
loop_2230:
	orn	%i6,	%l0,	%l2
	xnorcc	%l6,	0x119D,	%o7
	tn	%icc,	0x7
	bneg,a,pn	%icc,	loop_2231
	sll	%g4,	0x18,	%i7
	set	0x76, %i7
	ldstuba	[%l7 + %i7] 0x0c,	%l1
loop_2231:
	tcs	%xcc,	0x4
	fmovdg	%xcc,	%f22,	%f6
	movg	%icc,	%g3,	%i3
	sra	%l3,	0x18,	%i4
	alignaddr	%i2,	%o1,	%i0
	fxor	%f24,	%f30,	%f6
	fpadd16s	%f6,	%f31,	%f16
	fmovrdgz	%o0,	%f8,	%f22
	bgu,a,pn	%icc,	loop_2232
	tle	%xcc,	0x3
	tl	%xcc,	0x4
	fabss	%f25,	%f30
loop_2232:
	fmovsne	%icc,	%f2,	%f27
	sllx	%l5,	0x0F,	%g1
	array32	%o3,	%i5,	%o6
	membar	0x6B
	stb	%i1,	[%l7 + 0x0D]
	taddcctv	%g7,	0x09EC,	%g5
	edge8ln	%o5,	%l4,	%o2
	tsubcc	%o4,	%g2,	%i6
	edge8l	%g6,	%l0,	%l2
	ba,a	loop_2233
	sth	%o7,	[%l7 + 0x18]
	faligndata	%f8,	%f20,	%f24
	fabss	%f24,	%f4
loop_2233:
	brgz,a	%g4,	loop_2234
	addc	%l6,	%i7,	%g3
	smulcc	%i3,	%l3,	%l1
	movleu	%xcc,	%i2,	%o1
loop_2234:
	tvs	%xcc,	0x0
	fexpand	%f26,	%f2
	udivx	%i0,	0x11DB,	%i4
	xor	%o0,	0x0444,	%g1
	fbge	%fcc1,	loop_2235
	movvc	%icc,	%l5,	%i5
	tvc	%xcc,	0x5
	bshuffle	%f8,	%f6,	%f2
loop_2235:
	fmovrsne	%o3,	%f0,	%f26
	fand	%f10,	%f28,	%f20
	bge	loop_2236
	nop
	setx loop_2237, %l0, %l1
	jmpl %l1, %i1
	edge8n	%o6,	%g7,	%o5
	udivcc	%l4,	0x066B,	%g5
loop_2236:
	tvs	%xcc,	0x4
loop_2237:
	movne	%xcc,	%o2,	%g2
	umul	%o4,	0x0520,	%i6
	udivcc	%g6,	0x17F9,	%l0
	add	%l2,	0x19AF,	%o7
	st	%f5,	[%l7 + 0x20]
	fbge	%fcc2,	loop_2238
	edge32l	%l6,	%i7,	%g3
	movre	%g4,	%l3,	%i3
	udivcc	%l1,	0x1384,	%o1
loop_2238:
	fnands	%f1,	%f10,	%f29
	fones	%f13
	call	loop_2239
	alignaddrl	%i0,	%i4,	%o0
	bgu,a,pt	%icc,	loop_2240
	edge32l	%g1,	%l5,	%i2
loop_2239:
	sra	%o3,	%i1,	%i5
	ldsb	[%l7 + 0x3A],	%g7
loop_2240:
	fbue	%fcc1,	loop_2241
	fcmpgt32	%f20,	%f28,	%o5
	nop
	setx	loop_2242,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8	%o6,	%l4,	%g5
loop_2241:
	tcs	%xcc,	0x1
	fandnot1s	%f6,	%f11,	%f1
loop_2242:
	tvc	%xcc,	0x1
	set	0x1C, %o5
	sta	%f11,	[%l7 + %o5] 0x19
	fsrc1s	%f16,	%f16
	edge8n	%o2,	%g2,	%i6
	movvc	%xcc,	%o4,	%g6
	fnot2	%f12,	%f8
	edge32ln	%l2,	%l0,	%l6
	fmovsg	%xcc,	%f8,	%f17
	edge8l	%o7,	%g3,	%i7
	fbn	%fcc3,	loop_2243
	brnz,a	%g4,	loop_2244
	tvc	%xcc,	0x1
	movleu	%icc,	%l3,	%l1
loop_2243:
	movpos	%xcc,	%i3,	%i0
loop_2244:
	tpos	%xcc,	0x5
	xor	%i4,	0x0FD9,	%o0
	srax	%g1,	%l5,	%o1
	movrgez	%o3,	%i1,	%i2
	add	%g7,	%o5,	%o6
	be,pn	%xcc,	loop_2245
	sdivcc	%l4,	0x1C55,	%i5
	andncc	%o2,	%g5,	%g2
	subccc	%i6,	%g6,	%l2
loop_2245:
	fnegd	%f8,	%f6
	lduw	[%l7 + 0x30],	%o4
	array8	%l0,	%o7,	%l6
	bcc	%xcc,	loop_2246
	sra	%g3,	0x03,	%i7
	membar	0x01
	edge32l	%g4,	%l1,	%l3
loop_2246:
	umulcc	%i3,	0x1EEB,	%i0
	nop
	setx	loop_2247,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%icc,	%o0,	%i4
	movpos	%icc,	%l5,	%g1
	taddcc	%o1,	0x090A,	%o3
loop_2247:
	fcmple32	%f28,	%f12,	%i1
	lduw	[%l7 + 0x7C],	%g7
	movcc	%xcc,	%o5,	%o6
	orncc	%i2,	%l4,	%o2
	and	%i5,	%g2,	%i6
	andcc	%g6,	%g5,	%l2
	movle	%xcc,	%o4,	%o7
	movge	%xcc,	%l0,	%g3
	subccc	%l6,	0x0730,	%i7
	movneg	%icc,	%l1,	%l3
	sir	0x023E
	flush	%l7 + 0x38
	smulcc	%g4,	0x0085,	%i3
	tpos	%icc,	0x5
	subccc	%i0,	%o0,	%i4
	movgu	%icc,	%g1,	%l5
	edge32ln	%o1,	%o3,	%g7
	fsrc2	%f20,	%f30
	fpackfix	%f6,	%f0
	tg	%xcc,	0x2
	swap	[%l7 + 0x54],	%i1
	fba,a	%fcc1,	loop_2248
	alignaddr	%o5,	%i2,	%l4
	xnor	%o6,	0x16B6,	%i5
	set	0x0C, %g2
	ldstuba	[%l7 + %g2] 0x10,	%o2
loop_2248:
	movcc	%icc,	%i6,	%g2
	fornot2s	%f19,	%f31,	%f19
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x4C] %asi,	%f1
	sethi	0x19D6,	%g6
	edge8	%g5,	%o4,	%l2
	movg	%icc,	%l0,	%o7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x54] %asi,	%f3
	fsrc2s	%f17,	%f4
	set	0x58, %i5
	ldstuba	[%l7 + %i5] 0x19,	%l6
	nop
	set	0x2C, %o3
	lduw	[%l7 + %o3],	%g3
	edge8ln	%i7,	%l3,	%l1
	fbu	%fcc3,	loop_2249
	fnot2	%f30,	%f8
	fble	%fcc0,	loop_2250
	fble	%fcc3,	loop_2251
loop_2249:
	movrlz	%g4,	0x0F0,	%i0
	fmuld8ulx16	%f3,	%f25,	%f14
loop_2250:
	xor	%i3,	0x0626,	%i4
loop_2251:
	fmovda	%xcc,	%f14,	%f25
	edge32	%g1,	%l5,	%o1
	sdivcc	%o0,	0x15AB,	%g7
	ldsh	[%l7 + 0x4E],	%o3
	edge8ln	%i1,	%o5,	%i2
	tvc	%xcc,	0x4
	movn	%icc,	%o6,	%l4
	fmovsn	%icc,	%f21,	%f2
	be,pt	%xcc,	loop_2252
	fcmpne32	%f0,	%f30,	%i5
	array8	%o2,	%g2,	%g6
	fpsub16	%f24,	%f22,	%f12
loop_2252:
	orcc	%i6,	0x0F57,	%o4
	tge	%icc,	0x1
	fmovse	%icc,	%f11,	%f8
	fmovrdlez	%l2,	%f2,	%f20
	srax	%g5,	0x0C,	%l0
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x5A] %asi,	%o7
	srax	%g3,	%l6,	%l3
	tcc	%icc,	0x2
	movvs	%icc,	%i7,	%g4
	fcmple32	%f28,	%f16,	%l1
	edge8ln	%i3,	%i4,	%g1
	call	loop_2253
	fcmpgt16	%f14,	%f6,	%l5
	tle	%icc,	0x7
	fbne,a	%fcc3,	loop_2254
loop_2253:
	tcs	%xcc,	0x0
	movl	%icc,	%o1,	%i0
	fpmerge	%f9,	%f31,	%f16
loop_2254:
	bn,a	loop_2255
	umulcc	%g7,	0x07DB,	%o0
	mova	%icc,	%o3,	%i1
	tpos	%icc,	0x2
loop_2255:
	movrlez	%o5,	%o6,	%i2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f6
	tneg	%xcc,	0x4
	nop
	setx	loop_2256,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16n	%i5,	%l4,	%g2
	udiv	%o2,	0x136A,	%g6
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x28] %asi,	%i6
loop_2256:
	movgu	%xcc,	%l2,	%o4
	array32	%l0,	%o7,	%g3
	brlez	%g5,	loop_2257
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f1,	%f10
	st	%f27,	[%l7 + 0x34]
loop_2257:
	tpos	%xcc,	0x7
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x42] %asi,	%l3
	fandnot1s	%f29,	%f5,	%f20
	ta	%icc,	0x4
	movcc	%xcc,	%l6,	%g4
	bl	%xcc,	loop_2258
	fmovdn	%icc,	%f14,	%f28
	xor	%i7,	%i3,	%l1
	wr	%g0,	0x0c,	%asi
	stda	%i4,	[%l7 + 0x20] %asi
loop_2258:
	movrgez	%l5,	%o1,	%g1
	fmovsvs	%icc,	%f22,	%f18
	movge	%xcc,	%i0,	%g7
	xnor	%o0,	0x1F71,	%o3
	orn	%i1,	%o6,	%o5
	movvc	%icc,	%i5,	%l4
	sllx	%g2,	0x13,	%o2
	smul	%i2,	%i6,	%g6
	movcc	%xcc,	%l2,	%o4
	fpack16	%f30,	%f23
	fmovrdne	%l0,	%f12,	%f10
	movvs	%icc,	%o7,	%g5
	edge32ln	%g3,	%l6,	%l3
	add	%g4,	0x0B06,	%i3
	fmovdvc	%icc,	%f11,	%f9
	movre	%i7,	0x33C,	%i4
	and	%l5,	%l1,	%o1
	xorcc	%i0,	%g7,	%g1
	subcc	%o0,	0x12A7,	%o3
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x14] %asi,	%o6
	fpsub16s	%f26,	%f26,	%f25
	lduw	[%l7 + 0x38],	%i1
	edge32n	%o5,	%l4,	%g2
	movre	%i5,	%o2,	%i6
	movne	%icc,	%g6,	%i2
	alignaddrl	%l2,	%o4,	%l0
	sra	%o7,	%g3,	%l6
	movrlz	%l3,	%g4,	%i3
	fcmpne16	%f18,	%f28,	%i7
	fcmpgt16	%f16,	%f12,	%g5
	tn	%icc,	0x6
	set	0x20, %o0
	ldda	[%l7 + %o0] 0x22,	%l4
	brz	%i4,	loop_2259
	fmovscs	%icc,	%f25,	%f27
	fbg,a	%fcc2,	loop_2260
	swap	[%l7 + 0x10],	%o1
loop_2259:
	umulcc	%l1,	%g7,	%g1
	addcc	%i0,	%o3,	%o0
loop_2260:
	bleu,pn	%icc,	loop_2261
	sdiv	%o6,	0x1EA2,	%o5
	fcmple32	%f0,	%f2,	%l4
	tvs	%icc,	0x0
loop_2261:
	fcmpd	%fcc1,	%f20,	%f22
	edge16ln	%i1,	%i5,	%g2
	call	loop_2262
	flush	%l7 + 0x30
	sir	0x145F
	stx	%i6,	[%l7 + 0x10]
loop_2262:
	edge8	%g6,	%o2,	%l2
	popc	%i2,	%l0
	addc	%o7,	0x0A9F,	%o4
	fmul8x16al	%f30,	%f7,	%f22
	sdivx	%g3,	0x0650,	%l3
	fcmps	%fcc0,	%f16,	%f21
	array16	%l6,	%g4,	%i3
	andncc	%i7,	%g5,	%i4
	wr	%g0,	0x89,	%asi
	stba	%l5,	[%l7 + 0x3E] %asi
	ta	%xcc,	0x4
	bvc,a,pn	%icc,	loop_2263
	tne	%xcc,	0x1
	bleu,a,pt	%xcc,	loop_2264
	edge16l	%l1,	%g7,	%g1
loop_2263:
	orn	%i0,	%o1,	%o0
	tg	%xcc,	0x3
loop_2264:
	ldsh	[%l7 + 0x08],	%o6
	fmovda	%icc,	%f20,	%f18
	edge16n	%o5,	%l4,	%i1
	xnorcc	%o3,	0x1CAC,	%g2
	bpos,a	%xcc,	loop_2265
	fmovrde	%i5,	%f14,	%f26
	andcc	%g6,	0x09C7,	%i6
	tl	%xcc,	0x5
loop_2265:
	tle	%icc,	0x5
	movleu	%xcc,	%o2,	%i2
	fbue	%fcc1,	loop_2266
	popc	0x0411,	%l2
	set	0x54, %g3
	stha	%l0,	[%l7 + %g3] 0x80
loop_2266:
	popc	0x18CA,	%o4
	fnot2s	%f31,	%f19
	wr	%g0,	0x88,	%asi
	stxa	%g3,	[%l7 + 0x38] %asi
	fmovsn	%icc,	%f25,	%f16
	popc	0x15C8,	%l3
	bl	%xcc,	loop_2267
	srlx	%l6,	%g4,	%i3
	edge8n	%i7,	%o7,	%i4
	movleu	%xcc,	%g5,	%l1
loop_2267:
	sll	%l5,	0x12,	%g1
	call	loop_2268
	movrlz	%i0,	%g7,	%o0
	fmovsneg	%icc,	%f12,	%f21
	movle	%icc,	%o6,	%o5
loop_2268:
	fcmpeq32	%f14,	%f10,	%o1
	srlx	%i1,	0x1D,	%l4
	fmovde	%xcc,	%f21,	%f22
	be,a,pn	%icc,	loop_2269
	fcmple16	%f28,	%f12,	%g2
	andn	%o3,	%g6,	%i5
	subcc	%o2,	0x0EFF,	%i2
loop_2269:
	nop
	set	0x38, %i4
	lduba	[%l7 + %i4] 0x15,	%i6
	fmovdgu	%xcc,	%f15,	%f5
	xnorcc	%l0,	0x0BE3,	%o4
	orcc	%l2,	0x0772,	%g3
	fble	%fcc1,	loop_2270
	fnegs	%f23,	%f4
	xorcc	%l6,	%l3,	%i3
	set	0x60, %g5
	lda	[%l7 + %g5] 0x89,	%f21
loop_2270:
	stw	%g4,	[%l7 + 0x40]
	fmovrdlz	%i7,	%f14,	%f16
	edge8n	%i4,	%o7,	%g5
	movgu	%xcc,	%l1,	%l5
	fble,a	%fcc1,	loop_2271
	xorcc	%i0,	%g7,	%g1
	fcmps	%fcc3,	%f15,	%f17
	edge32	%o6,	%o0,	%o1
loop_2271:
	sdiv	%i1,	0x1A74,	%o5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l4,	%o3
	sdivx	%g6,	0x0911,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i5,	0x1BB3,	%i2
	fbu,a	%fcc2,	loop_2272
	movpos	%xcc,	%o2,	%l0
	fcmpes	%fcc3,	%f2,	%f18
	fbne,a	%fcc2,	loop_2273
loop_2272:
	sdivx	%o4,	0x12DF,	%l2
	tgu	%xcc,	0x2
	srlx	%g3,	%i6,	%l3
loop_2273:
	fxor	%f24,	%f8,	%f4
	taddcctv	%l6,	%i3,	%g4
	srlx	%i7,	0x0D,	%o7
	movpos	%xcc,	%g5,	%i4
	fbug,a	%fcc0,	loop_2274
	sra	%l1,	0x07,	%i0
	fones	%f0
	nop
	setx	loop_2275,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2274:
	sdivcc	%l5,	0x1B8A,	%g1
	orncc	%g7,	0x050C,	%o0
	call	loop_2276
loop_2275:
	fcmple16	%f4,	%f2,	%o6
	fpsub16	%f18,	%f4,	%f30
	edge8l	%o1,	%i1,	%l4
loop_2276:
	te	%xcc,	0x6
	movre	%o3,	0x2ED,	%o5
	fmovdneg	%icc,	%f6,	%f4
	bgu,a,pt	%icc,	loop_2277
	ta	%xcc,	0x0
	movneg	%icc,	%g2,	%i5
	xorcc	%i2,	0x0C22,	%o2
loop_2277:
	tcs	%icc,	0x3
	smul	%l0,	0x1022,	%g6
	ldub	[%l7 + 0x49],	%o4
	stw	%l2,	[%l7 + 0x6C]
	tcs	%xcc,	0x1
	udivx	%g3,	0x16BE,	%l3
	mova	%icc,	%i6,	%i3
	sir	0x0234
	fbug,a	%fcc1,	loop_2278
	fmovdne	%icc,	%f17,	%f21
	andn	%g4,	%l6,	%i7
	fbo,a	%fcc3,	loop_2279
loop_2278:
	movne	%xcc,	%o7,	%i4
	add	%l1,	0x108B,	%g5
	movgu	%xcc,	%l5,	%i0
loop_2279:
	sth	%g7,	[%l7 + 0x56]
	edge32	%g1,	%o0,	%o6
	sdiv	%o1,	0x0AA4,	%l4
	srl	%i1,	0x18,	%o3
	fpadd32	%f2,	%f30,	%f12
	fornot1	%f30,	%f18,	%f6
	addccc	%o5,	%i5,	%i2
	brlz,a	%o2,	loop_2280
	tne	%icc,	0x6
	movleu	%xcc,	%g2,	%g6
	fones	%f2
loop_2280:
	fpsub32s	%f15,	%f11,	%f30
	lduh	[%l7 + 0x3A],	%l0
	mulx	%l2,	%g3,	%l3
	fandnot1	%f16,	%f8,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o4,	0x0B41,	%i6
	bgu,a	loop_2281
	fmovspos	%xcc,	%f18,	%f17
	fblg,a	%fcc0,	loop_2282
	tleu	%xcc,	0x1
loop_2281:
	nop
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%g4
loop_2282:
	membar	0x66
	subcc	%i7,	%l6,	%i4
	udivcc	%l1,	0x15C6,	%o7
	xor	%l5,	0x05B6,	%g5
	tgu	%icc,	0x4
	movrgez	%i0,	%g1,	%g7
	ld	[%l7 + 0x28],	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f15,	%f14,	%f14
	xorcc	%o6,	%o1,	%l4
	addcc	%o0,	%i1,	%o3
	udiv	%i5,	0x0FA0,	%o5
	srlx	%o2,	%g2,	%i2
	sra	%g6,	0x1D,	%l2
	wr	%g0,	0x0c,	%asi
	sta	%f16,	[%l7 + 0x5C] %asi
	fblg,a	%fcc2,	loop_2283
	umul	%g3,	%l3,	%o4
	nop
	setx loop_2284, %l0, %l1
	jmpl %l1, %i6
	movge	%xcc,	%i3,	%l0
loop_2283:
	tle	%xcc,	0x3
	fmovda	%xcc,	%f27,	%f1
loop_2284:
	nop
	setx	loop_2285,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmpgt16	%f30,	%f10,	%g4
	movn	%icc,	%i7,	%l6
	tl	%xcc,	0x0
loop_2285:
	fmovrsne	%l1,	%f0,	%f6
	or	%o7,	0x1F6F,	%i4
	movleu	%xcc,	%l5,	%i0
	umulcc	%g5,	0x1A68,	%g7
	movneg	%icc,	%o6,	%o1
	nop
	setx loop_2286, %l0, %l1
	jmpl %l1, %l4
	array8	%o0,	%i1,	%g1
	brz	%i5,	loop_2287
	fmovrdgz	%o3,	%f6,	%f16
loop_2286:
	nop
	set	0x18, %l4
	ldxa	[%g0 + %l4] 0x58,	%o2
loop_2287:
	bn,a	loop_2288
	smulcc	%g2,	0x105C,	%o5
	fbu,a	%fcc1,	loop_2289
	lduh	[%l7 + 0x62],	%i2
loop_2288:
	lduh	[%l7 + 0x24],	%g6
	movn	%xcc,	%g3,	%l3
loop_2289:
	subc	%l2,	%i6,	%i3
	st	%f25,	[%l7 + 0x48]
	wr	%g0,	0x89,	%asi
	stwa	%l0,	[%l7 + 0x48] %asi
	fcmpeq32	%f22,	%f6,	%g4
	ldsw	[%l7 + 0x38],	%i7
	fcmped	%fcc1,	%f26,	%f10
	edge32l	%o4,	%l6,	%l1
	movl	%icc,	%o7,	%i4
	edge32n	%l5,	%g5,	%g7
	movleu	%icc,	%o6,	%i0
	fmovrsne	%o1,	%f29,	%f12
	xor	%o0,	%i1,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i5,	0x0F94,	%o3
	sir	0x1319
	movle	%icc,	%l4,	%o2
	edge16	%g2,	%i2,	%g6
	movrlez	%g3,	%l3,	%l2
	fmovdpos	%icc,	%f16,	%f26
	movvc	%icc,	%o5,	%i6
	sdiv	%l0,	0x16DC,	%i3
	tcc	%xcc,	0x3
	popc	0x1F6F,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a	loop_2290
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%g4,	0x1B28,	%l6
	fbug,a	%fcc2,	loop_2291
loop_2290:
	bgu	loop_2292
	array32	%l1,	%o4,	%i4
	edge16n	%o7,	%l5,	%g7
loop_2291:
	movrgez	%o6,	0x23E,	%i0
loop_2292:
	fones	%f3
	umul	%o1,	%g5,	%i1
	fabss	%f6,	%f9
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
	tpos	%xcc,	0x7
	edge8	%o0,	%i5,	%g1
	movle	%icc,	%o3,	%l4
loop_2293:
	fnand	%f8,	%f20,	%f18
	tvc	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g2,	0x147E,	%i2
	bleu,a	loop_2294
	srax	%o2,	%g6,	%g3
	fzero	%f20
	array32	%l3,	%o5,	%l2
loop_2294:
	edge8ln	%l0,	%i6,	%i7
	fbug,a	%fcc1,	loop_2295
	popc	0x12A6,	%i3
	fbg	%fcc0,	loop_2296
	fmovdge	%icc,	%f5,	%f7
loop_2295:
	xor	%g4,	0x138D,	%l6
	movne	%icc,	%o4,	%i4
loop_2296:
	fornot1s	%f17,	%f19,	%f14
	orncc	%l1,	%l5,	%g7
	fbe,a	%fcc2,	loop_2297
	nop
	setx	loop_2298,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%o7,	0x0C32,	%i0
	movrgez	%o6,	%g5,	%o1
loop_2297:
	smul	%o0,	%i5,	%g1
loop_2298:
	stbar
	or	%i1,	0x0317,	%l4
	ldsb	[%l7 + 0x1B],	%o3
	ldstub	[%l7 + 0x0A],	%g2
	fbge,a	%fcc3,	loop_2299
	sethi	0x0948,	%i2
	ta	%xcc,	0x3
	mulx	%o2,	0x0601,	%g3
loop_2299:
	tge	%icc,	0x4
	stbar
	tpos	%icc,	0x7
	taddcc	%l3,	%g6,	%o5
	tpos	%xcc,	0x2
	fcmps	%fcc2,	%f27,	%f24
	fandnot1s	%f20,	%f10,	%f4
	edge16n	%l0,	%l2,	%i6
	udivx	%i7,	0x08DF,	%g4
	te	%xcc,	0x0
	fpmerge	%f30,	%f19,	%f4
	movrgez	%l6,	0x07A,	%i3
	te	%icc,	0x1
	andn	%o4,	%l1,	%l5
	sllx	%i4,	%g7,	%i0
	bn,pt	%xcc,	loop_2300
	fnot1	%f8,	%f16
	wr	%g0,	0x2a,	%asi
	stwa	%o6,	[%l7 + 0x08] %asi
	membar	#Sync
loop_2300:
	fmovse	%icc,	%f27,	%f21
	ldsh	[%l7 + 0x3C],	%o7
	movrlez	%o1,	0x334,	%o0
	fblg	%fcc2,	loop_2301
	and	%i5,	0x0CDF,	%g1
	fmovs	%f24,	%f19
	fcmple16	%f20,	%f8,	%i1
loop_2301:
	movvc	%xcc,	%g5,	%l4
	movrne	%o3,	0x2B0,	%g2
	brgez	%o2,	loop_2302
	xnorcc	%g3,	%l3,	%i2
	mulx	%g6,	%l0,	%o5
	fmovrsgz	%i6,	%f31,	%f23
loop_2302:
	ble,pt	%xcc,	loop_2303
	sth	%l2,	[%l7 + 0x5E]
	fmul8x16al	%f5,	%f23,	%f18
	set	0x24, %i1
	sta	%f2,	[%l7 + %i1] 0x10
loop_2303:
	movne	%icc,	%i7,	%g4
	nop
	setx	loop_2304,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot2	%f28,	%f8,	%f2
	bl,a	%xcc,	loop_2305
	ldub	[%l7 + 0x69],	%l6
loop_2304:
	fornot2s	%f16,	%f24,	%f3
	bn,a,pt	%xcc,	loop_2306
loop_2305:
	swap	[%l7 + 0x0C],	%o4
	fbug,a	%fcc2,	loop_2307
	fpack32	%f30,	%f0,	%f14
loop_2306:
	tleu	%xcc,	0x0
	tcc	%icc,	0x3
loop_2307:
	alignaddrl	%i3,	%l1,	%l5
	edge8ln	%g7,	%i0,	%i4
	fandnot1s	%f24,	%f17,	%f24
	smulcc	%o7,	0x186C,	%o6
	tneg	%xcc,	0x2
	array16	%o0,	%o1,	%g1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i1
	fmovsne	%xcc,	%f3,	%f25
	fmovrdlez	%g5,	%f28,	%f16
	movle	%xcc,	%l4,	%i5
	tg	%icc,	0x1
	tge	%icc,	0x1
	tcc	%icc,	0x5
	movge	%xcc,	%o3,	%o2
	taddcctv	%g3,	0x08CF,	%g2
	ldx	[%l7 + 0x40],	%i2
	fmovdl	%icc,	%f21,	%f16
	move	%xcc,	%l3,	%l0
	sethi	0x0B01,	%o5
	array32	%i6,	%l2,	%g6
	fones	%f2
	movle	%icc,	%g4,	%l6
	fbule	%fcc3,	loop_2308
	edge8	%i7,	%o4,	%i3
	array32	%l1,	%g7,	%l5
	popc	%i0,	%i4
loop_2308:
	nop
	set	0x20, %i6
	lduwa	[%l7 + %i6] 0x11,	%o7
	fpsub32s	%f19,	%f4,	%f2
	edge32	%o0,	%o6,	%o1
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x68] %asi,	%g1
	sth	%g5,	[%l7 + 0x26]
	fmovdneg	%xcc,	%f6,	%f15
	bne,a,pn	%icc,	loop_2309
	fabss	%f11,	%f1
	fxor	%f4,	%f12,	%f28
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l4
loop_2309:
	movn	%xcc,	%i5,	%o3
	orn	%o2,	%g3,	%g2
	move	%icc,	%i1,	%l3
	movrgz	%i2,	0x2AE,	%o5
	fmovrslez	%l0,	%f31,	%f23
	mulx	%i6,	%g6,	%l2
	fornot2s	%f29,	%f19,	%f18
	andcc	%g4,	%i7,	%o4
	fbn	%fcc1,	loop_2310
	nop
	set	0x54, %g6
	lduh	[%l7 + %g6],	%i3
	fones	%f9
	mova	%xcc,	%l1,	%g7
loop_2310:
	fone	%f20
	umulcc	%l5,	0x0D24,	%i0
	movrgez	%i4,	0x1DD,	%l6
	fcmpeq32	%f0,	%f16,	%o7
	udivcc	%o6,	0x09A3,	%o0
	smulcc	%o1,	%g1,	%g5
	wr	%g0,	0x2b,	%asi
	stba	%l4,	[%l7 + 0x7C] %asi
	membar	#Sync
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x2
	array32	%o3,	%g3,	%g2
	ldsh	[%l7 + 0x18],	%i1
	orncc	%o2,	0x1E4C,	%l3
	udivcc	%i2,	0x1CB8,	%l0
	addc	%i6,	%o5,	%g6
	tn	%icc,	0x0
	movle	%icc,	%g4,	%i7
	movrne	%l2,	0x3E9,	%o4
	fcmpeq32	%f24,	%f16,	%l1
	and	%i3,	0x01BA,	%l5
	fnor	%f14,	%f2,	%f28
	set	0x55, %o1
	ldsba	[%l7 + %o1] 0x88,	%g7
	fmuld8sux16	%f5,	%f4,	%f2
	sethi	0x00DD,	%i4
	fpsub16s	%f11,	%f11,	%f9
	lduh	[%l7 + 0x60],	%l6
	umulcc	%i0,	0x0171,	%o7
	fexpand	%f9,	%f14
	taddcc	%o6,	0x047C,	%o0
	fpack16	%f2,	%f27
	xor	%o1,	0x1F83,	%g1
	membar	0x5A
	bl	%icc,	loop_2311
	movrlz	%l4,	%g5,	%i5
	edge32ln	%g3,	%g2,	%o3
	set	0x48, %g4
	lduwa	[%l7 + %g4] 0x10,	%o2
loop_2311:
	movl	%icc,	%i1,	%l3
	te	%icc,	0x3
	fbn	%fcc1,	loop_2312
	faligndata	%f12,	%f26,	%f12
	fandnot2s	%f17,	%f4,	%f20
	move	%icc,	%i2,	%i6
loop_2312:
	fmovs	%f24,	%f15
	tg	%xcc,	0x0
	fbue,a	%fcc0,	loop_2313
	array16	%o5,	%l0,	%g6
	tvs	%icc,	0x6
	fmovdn	%icc,	%f19,	%f18
loop_2313:
	addccc	%i7,	0x118C,	%l2
	ble,a,pn	%xcc,	loop_2314
	nop
	setx	loop_2315,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbuge,a	%fcc2,	loop_2316
	fbule,a	%fcc1,	loop_2317
loop_2314:
	fmovrdgz	%g4,	%f20,	%f2
loop_2315:
	movvs	%xcc,	%l1,	%i3
loop_2316:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2317:
	movrlez	%o4,	0x30B,	%l5
	tne	%icc,	0x7
	lduh	[%l7 + 0x4C],	%i4
	fzero	%f6
	edge32l	%l6,	%g7,	%i0
	addccc	%o7,	0x16BD,	%o0
	movg	%icc,	%o6,	%g1
	sethi	0x154D,	%o1
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x16] %asi,	%g5
	sdivx	%l4,	0x10E0,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x1C],	%g3
	tsubcc	%g2,	0x1183,	%o2
	bshuffle	%f4,	%f6,	%f30
	udiv	%i1,	0x07AC,	%o3
	sra	%l3,	0x17,	%i6
	srlx	%o5,	%l0,	%i2
	array16	%g6,	%l2,	%g4
	sllx	%i7,	%i3,	%o4
	sdivcc	%l5,	0x0DB3,	%i4
	mulscc	%l6,	0x0E95,	%l1
	umul	%g7,	0x0AA3,	%o7
	fmovrse	%i0,	%f14,	%f3
	set	0x35, %i3
	stba	%o6,	[%l7 + %i3] 0xeb
	membar	#Sync
	tl	%xcc,	0x1
	edge8l	%o0,	%g1,	%g5
	fmul8sux16	%f14,	%f12,	%f12
	movvs	%icc,	%l4,	%i5
	bge,a,pt	%icc,	loop_2318
	fmovsge	%xcc,	%f11,	%f1
	swap	[%l7 + 0x5C],	%o1
	tcs	%icc,	0x2
loop_2318:
	fbne,a	%fcc0,	loop_2319
	subcc	%g3,	0x0252,	%g2
	srl	%i1,	0x18,	%o2
	edge32ln	%l3,	%o3,	%i6
loop_2319:
	fmul8x16	%f0,	%f18,	%f28
	fpadd16	%f10,	%f4,	%f24
	fmovscs	%xcc,	%f1,	%f8
	edge32n	%o5,	%i2,	%l0
	brnz	%l2,	loop_2320
	subc	%g4,	%g6,	%i7
	fpadd32s	%f12,	%f15,	%f9
	fandnot2	%f28,	%f8,	%f14
loop_2320:
	fpadd16s	%f20,	%f10,	%f3
	sir	0x111B
	sra	%o4,	0x0F,	%l5
	for	%f24,	%f24,	%f6
	set	0x56, %i2
	ldsha	[%l7 + %i2] 0x11,	%i3
	array8	%i4,	%l1,	%g7
	movre	%l6,	0x0ED,	%i0
	addccc	%o7,	0x10D2,	%o0
	fnegs	%f29,	%f9
	fmovse	%xcc,	%f12,	%f23
	edge8	%g1,	%o6,	%g5
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x0c,	%f0
	xor	%l4,	0x1761,	%o1
	fpadd32s	%f9,	%f13,	%f16
	stbar
	subcc	%i5,	%g2,	%g3
	movrne	%o2,	0x01C,	%i1
	srax	%l3,	%o3,	%i6
	tcc	%icc,	0x7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o5,	%l0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	ba,a	%icc,	loop_2321
	tne	%icc,	0x7
	fmovdvc	%xcc,	%f27,	%f15
	srax	%g4,	%g6,	%i7
loop_2321:
	fmovsg	%icc,	%f31,	%f31
	subccc	%o4,	%l5,	%l2
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x38] %asi,	%i3
	edge32n	%i4,	%g7,	%l1
	lduw	[%l7 + 0x08],	%l6
	fmovrde	%i0,	%f16,	%f14
	fmovdleu	%xcc,	%f16,	%f0
	sth	%o7,	[%l7 + 0x2E]
	addccc	%g1,	%o0,	%g5
	fnors	%f14,	%f28,	%f9
	smulcc	%l4,	%o1,	%i5
	mulx	%g2,	%g3,	%o2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i1,	%l3
	tl	%xcc,	0x3
	edge16l	%o3,	%o6,	%o5
	tle	%xcc,	0x4
	array16	%l0,	%i2,	%i6
	fmul8sux16	%f0,	%f20,	%f2
	fmovse	%icc,	%f24,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x2
	edge32n	%g4,	%i7,	%g6
	movrgz	%o4,	%l5,	%i3
	subcc	%l2,	%i4,	%g7
	movrlz	%l1,	%i0,	%o7
	std	%f4,	[%l7 + 0x58]
	fornot1s	%f31,	%f1,	%f13
	smul	%l6,	%g1,	%o0
	udivx	%g5,	0x1957,	%l4
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o1
	addcc	%g2,	%g3,	%i5
	tn	%icc,	0x4
	edge8n	%i1,	%l3,	%o2
	fandnot1	%f12,	%f0,	%f28
	fxnors	%f1,	%f4,	%f10
	movre	%o6,	0x3FF,	%o3
	tge	%xcc,	0x5
	mova	%icc,	%l0,	%i2
	sdivx	%o5,	0x1ECC,	%i6
	sub	%i7,	0x06DD,	%g6
	movrlez	%o4,	0x2A9,	%g4
	movpos	%icc,	%i3,	%l5
	set	0x5C, %l6
	lduwa	[%l7 + %l6] 0x18,	%i4
	mova	%xcc,	%g7,	%l2
	udivx	%l1,	0x19E4,	%o7
	mulscc	%i0,	0x085F,	%g1
	movrgz	%o0,	%g5,	%l6
	movvs	%icc,	%l4,	%o1
	brlez,a	%g2,	loop_2322
	tge	%icc,	0x2
	fnot2	%f0,	%f2
	andcc	%i5,	%g3,	%i1
loop_2322:
	movge	%xcc,	%o2,	%l3
	subcc	%o3,	%o6,	%l0
	sdiv	%o5,	0x1B9A,	%i6
	edge16ln	%i2,	%g6,	%o4
	move	%xcc,	%i7,	%g4
	fandnot1	%f16,	%f0,	%f10
	edge8l	%i3,	%l5,	%i4
	fpack16	%f2,	%f21
	set	0x1C, %o7
	stwa	%g7,	[%l7 + %o7] 0x2a
	membar	#Sync
	stbar
	movpos	%xcc,	%l1,	%l2
	udiv	%o7,	0x0282,	%g1
	sll	%o0,	%g5,	%i0
	ldd	[%l7 + 0x20],	%f28
	fmovrdgez	%l4,	%f2,	%f22
	mulx	%l6,	0x14E0,	%o1
	lduw	[%l7 + 0x64],	%g2
	orcc	%i5,	%i1,	%g3
	and	%o2,	%l3,	%o3
	and	%o6,	%o5,	%l0
	wr	%g0,	0x89,	%asi
	stwa	%i6,	[%l7 + 0x50] %asi
	udivx	%g6,	0x0CED,	%o4
	movrlz	%i2,	%i7,	%g4
	subcc	%l5,	0x0D1A,	%i4
	popc	0x1F4E,	%g7
	fblg	%fcc3,	loop_2323
	sdivx	%i3,	0x1966,	%l1
	ldsw	[%l7 + 0x30],	%o7
	stb	%l2,	[%l7 + 0x65]
loop_2323:
	tl	%icc,	0x7
	sethi	0x15D7,	%o0
	fbug	%fcc0,	loop_2324
	tcc	%xcc,	0x2
	alignaddr	%g1,	%g5,	%i0
	stx	%l4,	[%l7 + 0x38]
loop_2324:
	fbg,a	%fcc1,	loop_2325
	fbe,a	%fcc0,	loop_2326
	tne	%xcc,	0x7
	movne	%icc,	%o1,	%g2
loop_2325:
	srlx	%i5,	%i1,	%g3
loop_2326:
	umulcc	%o2,	%l3,	%o3
	edge32l	%l6,	%o6,	%l0
	stb	%i6,	[%l7 + 0x17]
	fnot1	%f2,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a,pt	%xcc,	loop_2327
	bne	loop_2328
	edge16n	%o5,	%g6,	%o4
	orncc	%i7,	0x19CD,	%i2
loop_2327:
	fcmpeq16	%f22,	%f16,	%l5
loop_2328:
	sdivx	%g4,	0x1701,	%i4
	ldsw	[%l7 + 0x54],	%i3
	edge32	%l1,	%g7,	%l2
	srax	%o7,	0x11,	%o0
	movle	%icc,	%g5,	%g1
	movrgez	%l4,	0x00F,	%i0
	movge	%xcc,	%o1,	%g2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i5
	casa	[%l6] 0x81,	%i5,	%i1
	srax	%o2,	0x02,	%l3
	bpos,a,pn	%xcc,	loop_2329
	edge8ln	%o3,	%g3,	%l6
	movrne	%l0,	0x394,	%o6
	udivx	%i6,	0x0ECA,	%g6
loop_2329:
	fmovde	%icc,	%f24,	%f19
	sub	%o4,	0x08E4,	%o5
	fcmped	%fcc2,	%f2,	%f28
	fxors	%f9,	%f28,	%f13
	udivx	%i2,	0x06BC,	%i7
	bpos	loop_2330
	movre	%l5,	0x015,	%g4
	fbge,a	%fcc3,	loop_2331
	movne	%xcc,	%i4,	%i3
loop_2330:
	edge8n	%g7,	%l2,	%o7
	array32	%l1,	%g5,	%o0
loop_2331:
	sra	%g1,	0x12,	%i0
	fmovsgu	%xcc,	%f18,	%f16
	xorcc	%o1,	%g2,	%l4
	fmovrsgez	%i5,	%f6,	%f23
	tneg	%icc,	0x1
	pdist	%f28,	%f28,	%f6
	set	0x4C, %o6
	stwa	%o2,	[%l7 + %o6] 0xeb
	membar	#Sync
	subcc	%l3,	0x13B2,	%i1
	tle	%xcc,	0x6
	sdiv	%o3,	0x011E,	%g3
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x16
	membar	#Sync
	fmul8x16	%f23,	%f4,	%f18
	set	0x54, %l2
	swapa	[%l7 + %l2] 0x88,	%l0
	call	loop_2332
	fcmps	%fcc2,	%f14,	%f4
	fmovsa	%xcc,	%f20,	%f7
	or	%o6,	%l6,	%g6
loop_2332:
	edge32ln	%o4,	%o5,	%i6
	set	0x40, %g7
	prefetcha	[%l7 + %g7] 0x18,	 0x3
	xorcc	%l5,	0x0BB5,	%i7
	fnot2	%f2,	%f20
	move	%icc,	%i4,	%i3
	bgu,a	%xcc,	loop_2333
	xor	%g4,	0x1429,	%l2
	fmovda	%icc,	%f13,	%f7
	tcs	%xcc,	0x0
loop_2333:
	movn	%xcc,	%g7,	%l1
	sra	%o7,	%o0,	%g5
	smulcc	%i0,	0x1DA3,	%o1
	bne,a	%xcc,	loop_2334
	movge	%icc,	%g1,	%g2
	smulcc	%i5,	0x1B9C,	%o2
	wr	%g0,	0x10,	%asi
	stxa	%l4,	[%l7 + 0x48] %asi
loop_2334:
	bcs,a,pn	%xcc,	loop_2335
	brgez	%i1,	loop_2336
	tl	%xcc,	0x4
	fcmpd	%fcc0,	%f14,	%f4
loop_2335:
	udivx	%l3,	0x008C,	%g3
loop_2336:
	bpos,a,pn	%xcc,	loop_2337
	movg	%icc,	%o3,	%l0
	stx	%l6,	[%l7 + 0x28]
	tvc	%icc,	0x6
loop_2337:
	tn	%xcc,	0x1
	edge16	%o6,	%o4,	%o5
	tvc	%icc,	0x4
	stx	%g6,	[%l7 + 0x58]
	array16	%i6,	%l5,	%i7
	edge16ln	%i4,	%i2,	%g4
	srl	%l2,	%i3,	%l1
	taddcctv	%g7,	%o0,	%o7
	edge32ln	%i0,	%o1,	%g1
	tvc	%icc,	0x6
	addcc	%g5,	%i5,	%g2
	umul	%o2,	%i1,	%l4
	fsrc1s	%f11,	%f11
	edge16	%g3,	%o3,	%l3
	sra	%l0,	0x0D,	%o6
	fmovdne	%icc,	%f17,	%f11
	edge16l	%o4,	%o5,	%g6
	mulscc	%i6,	0x0C90,	%l5
	udivx	%l6,	0x1922,	%i7
	tleu	%icc,	0x2
	fsrc2	%f30,	%f20
	fcmped	%fcc2,	%f6,	%f4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x64] %asi,	%i4
	array32	%i2,	%g4,	%i3
	set	0x28, %o2
	swapa	[%l7 + %o2] 0x18,	%l2
	tsubcctv	%g7,	0x0A60,	%l1
	array16	%o0,	%i0,	%o1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%g5
	lduw	[%l7 + 0x38],	%i5
	add	%g1,	%g2,	%i1
	bge,pn	%icc,	loop_2338
	fpadd32s	%f11,	%f24,	%f9
	fbg	%fcc1,	loop_2339
	fmovrdne	%o2,	%f18,	%f10
loop_2338:
	add	%g3,	%l4,	%l3
	fexpand	%f12,	%f18
loop_2339:
	movn	%icc,	%o3,	%o6
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x10] %asi,	%l0
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x44] %asi,	%o4
	subcc	%o5,	%g6,	%i6
	fmovrdlez	%l6,	%f2,	%f4
	smulcc	%l5,	0x14B9,	%i4
	fmovspos	%xcc,	%f20,	%f7
	std	%f0,	[%l7 + 0x78]
	fcmps	%fcc1,	%f5,	%f3
	set	0x7A, %i0
	ldsha	[%l7 + %i0] 0x88,	%i7
	tge	%icc,	0x6
	ble,a	%xcc,	loop_2340
	fpsub16s	%f12,	%f24,	%f5
	brgz,a	%i2,	loop_2341
	nop
	set	0x4E, %l5
	ldub	[%l7 + %l5],	%i3
loop_2340:
	movneg	%xcc,	%g4,	%l2
	srlx	%g7,	0x13,	%l1
loop_2341:
	nop
	set	0x60, %l1
	lduha	[%l7 + %l1] 0x04,	%o0
	fbn	%fcc2,	loop_2342
	addccc	%o1,	0x0E42,	%i0
	fmovsgu	%icc,	%f9,	%f15
	mova	%xcc,	%o7,	%i5
loop_2342:
	membar	0x45
	fpmerge	%f25,	%f14,	%f6
	alignaddr	%g1,	%g2,	%g5
	movvs	%icc,	%o2,	%i1
	movrgz	%g3,	%l4,	%l3
	sethi	0x07A9,	%o3
	fxor	%f14,	%f16,	%f10
	sub	%o6,	%o4,	%o5
	edge32l	%l0,	%g6,	%i6
	bvc,a	loop_2343
	movn	%xcc,	%l6,	%l5
	fmovdvc	%icc,	%f20,	%f8
	subccc	%i7,	0x1BBF,	%i4
loop_2343:
	edge16ln	%i3,	%g4,	%i2
	movpos	%xcc,	%g7,	%l2
	fble,a	%fcc3,	loop_2344
	edge8ln	%l1,	%o0,	%o1
	fmovdgu	%xcc,	%f27,	%f9
	fmovdne	%xcc,	%f21,	%f25
loop_2344:
	andcc	%o7,	%i5,	%i0
	fones	%f21
	udivcc	%g2,	0x0E41,	%g1
	brlz,a	%o2,	loop_2345
	edge16	%i1,	%g5,	%l4
	fble	%fcc0,	loop_2346
	fcmpgt16	%f4,	%f28,	%l3
loop_2345:
	fornot2	%f14,	%f14,	%f0
	taddcc	%g3,	%o3,	%o4
loop_2346:
	addc	%o6,	0x0807,	%l0
	fbu	%fcc0,	loop_2347
	mulx	%o5,	%g6,	%l6
	movcc	%icc,	%l5,	%i6
	ldd	[%l7 + 0x20],	%f22
loop_2347:
	tvc	%xcc,	0x0
	set	0x52, %g1
	stha	%i4,	[%l7 + %g1] 0x27
	membar	#Sync
	fmul8x16al	%f0,	%f18,	%f6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i3
	fmovdcc	%icc,	%f31,	%f31
	sdiv	%g4,	0x1D69,	%i7
	tvc	%icc,	0x0
	alignaddr	%i2,	%g7,	%l2
	fnand	%f16,	%f0,	%f2
	brnz,a	%l1,	loop_2348
	fandnot2	%f18,	%f6,	%f24
	fsrc2	%f12,	%f14
	tsubcc	%o0,	0x18C7,	%o1
loop_2348:
	fmovspos	%xcc,	%f9,	%f3
	edge16	%o7,	%i0,	%g2
	andn	%g1,	0x0751,	%i5
	swap	[%l7 + 0x60],	%o2
	ldub	[%l7 + 0x3F],	%i1
	subcc	%g5,	0x0D8A,	%l3
	edge16	%g3,	%l4,	%o3
	orn	%o6,	0x00A3,	%o4
	movre	%l0,	%g6,	%l6
	srlx	%l5,	%o5,	%i4
	fmovsne	%icc,	%f3,	%f23
	tge	%xcc,	0x7
	fmovdpos	%xcc,	%f3,	%f23
	udivx	%i3,	0x1EF1,	%i6
	movgu	%xcc,	%i7,	%g4
	tvs	%xcc,	0x3
	movcs	%xcc,	%g7,	%l2
	fmul8x16au	%f13,	%f1,	%f22
	bleu,pn	%xcc,	loop_2349
	std	%i2,	[%l7 + 0x48]
	orncc	%l1,	%o1,	%o7
	fmovdcs	%icc,	%f17,	%f6
loop_2349:
	movre	%o0,	%g2,	%g1
	fnands	%f20,	%f20,	%f14
	prefetch	[%l7 + 0x44],	 0x1
	movpos	%icc,	%i0,	%o2
	umul	%i5,	0x05EB,	%g5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i1,	%l3
	fabsd	%f20,	%f28
	sethi	0x1347,	%g3
	add	%l7,	0x64,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o3,	%o6
	fmovrde	%o4,	%f4,	%f18
	tcs	%xcc,	0x1
	sll	%l0,	0x04,	%l4
	movpos	%icc,	%l6,	%l5
	movvc	%icc,	%g6,	%i4
	tne	%xcc,	0x7
	sethi	0x129B,	%i3
	mova	%xcc,	%i6,	%o5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g4,	%g7
	fmovrsne	%l2,	%f24,	%f28
	udivcc	%i2,	0x0FAB,	%l1
	array32	%i7,	%o7,	%o0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x44] %asi,	%g2
	edge16	%g1,	%o1,	%i0
	set	0x5C, %i7
	sta	%f26,	[%l7 + %i7] 0x11
	andcc	%o2,	%i5,	%g5
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
	fmovdne	%xcc,	%f14,	%f26
	orn	%i1,	%g3,	%o6
	sdivx	%o4,	0x05D4,	%o3
	fmovse	%icc,	%f29,	%f12
	orn	%l0,	0x1A2A,	%l4
	sdivcc	%l6,	0x1AFA,	%g6
	fbn,a	%fcc3,	loop_2350
	brz,a	%i4,	loop_2351
	sth	%i3,	[%l7 + 0x36]
	fbug,a	%fcc1,	loop_2352
loop_2350:
	tne	%xcc,	0x5
loop_2351:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i6,	0x1E,	%o5
loop_2352:
	orcc	%g4,	0x1BCE,	%l5
	bg,pn	%xcc,	loop_2353
	fmovrsgez	%g7,	%f12,	%f27
	st	%f31,	[%l7 + 0x14]
	sdivcc	%l2,	0x0FAB,	%l1
loop_2353:
	nop
	setx	loop_2354,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array32	%i2,	%o7,	%i7
	fpadd32s	%f24,	%f16,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2354:
	fbu,a	%fcc1,	loop_2355
	fbg,a	%fcc1,	loop_2356
	fmovsleu	%icc,	%f21,	%f17
	fpack16	%f30,	%f7
loop_2355:
	sll	%g2,	%g1,	%o1
loop_2356:
	sra	%i0,	0x0B,	%o0
	fmovrse	%i5,	%f30,	%f12
	brlez,a	%o2,	loop_2357
	edge32ln	%l3,	%g5,	%g3
	set	0x60, %o5
	ldxa	[%l7 + %o5] 0x18,	%i1
loop_2357:
	orncc	%o6,	%o3,	%l0
	umulcc	%o4,	0x1BD2,	%l6
	or	%g6,	0x1BD6,	%l4
	tcs	%xcc,	0x1
	fmovrsne	%i3,	%f8,	%f19
	movrne	%i6,	0x0C5,	%o5
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x6A] %asi,	%i4
	mulx	%g4,	%g7,	%l2
	movgu	%xcc,	%l1,	%l5
	movn	%xcc,	%o7,	%i2
	fmovrslez	%i7,	%f18,	%f17
	orncc	%g1,	0x1F0B,	%g2
	orncc	%o1,	%i0,	%o0
	fbne	%fcc2,	loop_2358
	alignaddr	%i5,	%o2,	%g5
	subccc	%l3,	%i1,	%g3
	tvs	%icc,	0x2
loop_2358:
	movrlz	%o3,	0x262,	%l0
	subc	%o6,	0x1133,	%l6
	std	%f0,	[%l7 + 0x18]
	te	%xcc,	0x7
	edge16	%o4,	%l4,	%i3
	taddcc	%i6,	0x0003,	%g6
	fmovscc	%xcc,	%f23,	%f4
	fbn,a	%fcc1,	loop_2359
	prefetch	[%l7 + 0x54],	 0x3
	nop
	setx	loop_2360,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fand	%f12,	%f22,	%f8
loop_2359:
	movre	%o5,	0x386,	%g4
	edge16ln	%g7,	%i4,	%l1
loop_2360:
	brgez,a	%l2,	loop_2361
	taddcc	%l5,	0x1193,	%i2
	sdivx	%o7,	0x10A3,	%i7
	tvs	%icc,	0x1
loop_2361:
	fabss	%f7,	%f27
	fmovscc	%xcc,	%f15,	%f14
	xnorcc	%g1,	0x140E,	%o1
	fble	%fcc1,	loop_2362
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%g2,	%i0
	membar	0x07
loop_2362:
	tne	%icc,	0x6
	tcs	%xcc,	0x3
	movvs	%icc,	%o0,	%o2
	sdivx	%g5,	0x131C,	%i5
	sethi	0x0672,	%l3
	fmovsleu	%xcc,	%f22,	%f31
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x34] %asi,	%f19
	fxnors	%f21,	%f17,	%f13
	mova	%icc,	%i1,	%o3
	popc	%l0,	%o6
	addccc	%g3,	%o4,	%l4
	and	%i3,	%i6,	%l6
	fbn,a	%fcc2,	loop_2363
	smulcc	%g6,	%g4,	%g7
	bcs,a	loop_2364
	fmovda	%icc,	%f27,	%f15
loop_2363:
	fmovsle	%xcc,	%f25,	%f3
	fmovsge	%icc,	%f30,	%f5
loop_2364:
	movvc	%icc,	%i4,	%o5
	tsubcctv	%l2,	0x1B6D,	%l5
	bpos,a	loop_2365
	tl	%xcc,	0x1
	taddcctv	%i2,	0x08F4,	%o7
	edge8n	%i7,	%l1,	%o1
loop_2365:
	mulscc	%g1,	0x144D,	%i0
	edge32	%g2,	%o0,	%g5
	set	0x74, %g2
	lduwa	[%l7 + %g2] 0x18,	%i5
	taddcctv	%l3,	0x1553,	%i1
	swap	[%l7 + 0x30],	%o3
	subc	%o2,	0x1EFE,	%o6
	ta	%icc,	0x1
	fmovsn	%icc,	%f22,	%f18
	movl	%xcc,	%g3,	%o4
	movre	%l4,	0x246,	%l0
	sra	%i6,	0x0E,	%i3
	fbo	%fcc3,	loop_2366
	std	%f22,	[%l7 + 0x50]
	movrne	%l6,	%g6,	%g4
	ba,a,pt	%icc,	loop_2367
loop_2366:
	fblg,a	%fcc1,	loop_2368
	bleu,a	%xcc,	loop_2369
	fmovspos	%icc,	%f0,	%f10
loop_2367:
	sdivcc	%g7,	0x06A2,	%o5
loop_2368:
	tle	%icc,	0x1
loop_2369:
	nop
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x81,	%i4
	brgez	%l2,	loop_2370
	fmovrse	%i2,	%f16,	%f7
	brgz,a	%l5,	loop_2371
	brz,a	%i7,	loop_2372
loop_2370:
	fbne,a	%fcc2,	loop_2373
	andn	%l1,	0x180E,	%o7
loop_2371:
	te	%xcc,	0x5
loop_2372:
	tg	%icc,	0x3
loop_2373:
	siam	0x6
	sethi	0x1197,	%o1
	fbul	%fcc3,	loop_2374
	edge32n	%g1,	%i0,	%g2
	andcc	%o0,	0x058B,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2374:
	fmovde	%xcc,	%f14,	%f15
	movrlz	%i5,	0x11A,	%i1
	movrlz	%l3,	0x273,	%o2
	subccc	%o6,	0x18A4,	%g3
	udivx	%o3,	0x074D,	%o4
	sir	0x02E4
	fmovrslez	%l4,	%f13,	%f6
	movge	%icc,	%l0,	%i3
	set	0x3C, %o3
	stwa	%i6,	[%l7 + %o3] 0x80
	fmovrse	%l6,	%f24,	%f1
	fmovsl	%xcc,	%f8,	%f30
	fcmpgt16	%f16,	%f8,	%g4
	movrgez	%g7,	0x1E8,	%o5
	ldd	[%l7 + 0x70],	%f24
	brlez,a	%i4,	loop_2375
	fmovsl	%icc,	%f17,	%f26
	set	0x2C, %o0
	lduba	[%l7 + %o0] 0x04,	%g6
loop_2375:
	sethi	0x084C,	%l2
	fmovscc	%xcc,	%f31,	%f15
	set	0x64, %g3
	swapa	[%l7 + %g3] 0x80,	%l5
	fornot2	%f0,	%f30,	%f2
	ba,pn	%xcc,	loop_2376
	edge8	%i7,	%i2,	%o7
	andn	%o1,	0x09D3,	%l1
	edge32n	%i0,	%g1,	%o0
loop_2376:
	tsubcctv	%g5,	%g2,	%i5
	addc	%l3,	0x1DD5,	%i1
	wr	%g0,	0x18,	%asi
	stda	%o6,	[%l7 + 0x20] %asi
	fbu	%fcc2,	loop_2377
	srl	%o2,	0x1F,	%o3
	smul	%g3,	0x1602,	%o4
	ldsw	[%l7 + 0x34],	%l4
loop_2377:
	edge16l	%l0,	%i6,	%l6
	fandnot2s	%f9,	%f14,	%f2
	set	0x20, %i4
	ldxa	[%l7 + %i4] 0x15,	%g4
	orn	%g7,	%i3,	%i4
	fbo	%fcc3,	loop_2378
	tvc	%icc,	0x1
	edge8l	%o5,	%l2,	%l5
	movvc	%icc,	%i7,	%i2
loop_2378:
	movge	%icc,	%g6,	%o7
	fnegs	%f24,	%f3
	fnors	%f16,	%f11,	%f4
	fbuge	%fcc0,	loop_2379
	edge32ln	%o1,	%l1,	%g1
	fbul,a	%fcc3,	loop_2380
	edge8	%o0,	%i0,	%g5
loop_2379:
	lduh	[%l7 + 0x62],	%i5
	fcmpeq32	%f0,	%f22,	%g2
loop_2380:
	tleu	%icc,	0x7
	fbg,a	%fcc1,	loop_2381
	addc	%l3,	%o6,	%i1
	bleu,a,pt	%xcc,	loop_2382
	subcc	%o3,	%o2,	%o4
loop_2381:
	nop
	membar	#Sync
	set	0x40, %l0
	ldda	[%l7 + %l0] 0x16,	%f16
loop_2382:
	fpsub32	%f26,	%f28,	%f16
	tsubcctv	%g3,	0x16BF,	%l0
	edge16	%i6,	%l4,	%g4
	movn	%xcc,	%g7,	%i3
	ldsb	[%l7 + 0x7E],	%l6
	movvc	%xcc,	%i4,	%o5
	fmovsneg	%icc,	%f4,	%f6
	edge32n	%l5,	%l2,	%i7
	sir	0x1D3C
	brlez	%g6,	loop_2383
	edge8ln	%o7,	%o1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l1,	%g1,	%o0
loop_2383:
	udiv	%g5,	0x0B0D,	%i0
	fbug	%fcc2,	loop_2384
	andncc	%g2,	%l3,	%i5
	umul	%i1,	%o6,	%o3
	tsubcc	%o4,	%g3,	%o2
loop_2384:
	ble	%xcc,	loop_2385
	siam	0x2
	array32	%i6,	%l0,	%g4
	fmul8sux16	%f24,	%f6,	%f10
loop_2385:
	add	%l4,	0x1692,	%i3
	sdiv	%l6,	0x0373,	%g7
	tg	%xcc,	0x0
	nop
	setx	loop_2386,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg,a	%fcc2,	loop_2387
	edge8l	%o5,	%i4,	%l2
	array8	%i7,	%g6,	%o7
loop_2386:
	smul	%l5,	0x14A5,	%i2
loop_2387:
	fxor	%f30,	%f24,	%f16
	edge8	%l1,	%o1,	%g1
	set	0x38, %l4
	lduwa	[%l7 + %l4] 0x19,	%g5
	movcc	%xcc,	%i0,	%o0
	ldsh	[%l7 + 0x58],	%l3
	tsubcc	%g2,	0x0266,	%i5
	wr	%g0,	0x22,	%asi
	stxa	%i1,	[%l7 + 0x58] %asi
	membar	#Sync
	fbg,a	%fcc1,	loop_2388
	popc	0x025F,	%o6
	set	0x5E, %i1
	ldsha	[%l7 + %i1] 0x80,	%o4
loop_2388:
	tne	%xcc,	0x6
	udiv	%g3,	0x137D,	%o2
	sethi	0x00CB,	%o3
	fmovdg	%xcc,	%f17,	%f7
	mulx	%i6,	%g4,	%l4
	ldsh	[%l7 + 0x1C],	%l0
	fbul	%fcc2,	loop_2389
	movrgez	%l6,	0x3FF,	%g7
	bpos	%icc,	loop_2390
	fbo	%fcc1,	loop_2391
loop_2389:
	fmul8x16	%f17,	%f30,	%f6
	tneg	%xcc,	0x6
loop_2390:
	fsrc1	%f6,	%f22
loop_2391:
	nop
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x40] %asi,	%o5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i3,	%i4
	orncc	%l2,	0x1978,	%i7
	bvc,a	%icc,	loop_2392
	smul	%o7,	0x168E,	%l5
	fba	%fcc2,	loop_2393
	fmovdleu	%icc,	%f12,	%f26
loop_2392:
	edge8ln	%g6,	%l1,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2393:
	edge8n	%g1,	%o1,	%i0
	fcmpgt16	%f4,	%f14,	%o0
	sethi	0x0E62,	%l3
	array8	%g5,	%g2,	%i1
	edge16n	%i5,	%o6,	%o4
	edge8ln	%o2,	%o3,	%g3
	subcc	%i6,	%g4,	%l0
	taddcc	%l6,	0x0CD6,	%l4
	tleu	%xcc,	0x7
	subcc	%g7,	0x1A1C,	%i3
	faligndata	%f8,	%f4,	%f26
	ldx	[%l7 + 0x78],	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l2,	%i7,	%o5
	ld	[%l7 + 0x40],	%f4
	sdivcc	%o7,	0x1FBB,	%g6
	edge32ln	%l5,	%l1,	%i2
	fands	%f18,	%f6,	%f24
	fba	%fcc2,	loop_2394
	addcc	%g1,	%i0,	%o1
	and	%l3,	0x0080,	%o0
	umul	%g5,	0x0630,	%i1
loop_2394:
	alignaddrl	%i5,	%g2,	%o6
	fmovdle	%icc,	%f1,	%f7
	sllx	%o2,	0x10,	%o3
	smul	%g3,	%i6,	%g4
	ldd	[%l7 + 0x20],	%l0
	bpos,a	loop_2395
	sll	%o4,	%l6,	%l4
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x18,	%g6
loop_2395:
	fmovdle	%icc,	%f8,	%f15
	subccc	%i3,	%l2,	%i4
	sll	%i7,	0x17,	%o5
	fabss	%f13,	%f13
	subccc	%g6,	0x0EBB,	%o7
	tpos	%xcc,	0x7
	taddcctv	%l5,	%i2,	%g1
	fmovrslez	%l1,	%f25,	%f4
	fpack32	%f8,	%f10,	%f2
	fmovdleu	%icc,	%f16,	%f7
	fbue	%fcc2,	loop_2396
	taddcc	%o1,	0x0358,	%l3
	stw	%o0,	[%l7 + 0x28]
	taddcc	%i0,	%i1,	%g5
loop_2396:
	membar	0x61
	fone	%f0
	tle	%icc,	0x1
	fbu,a	%fcc1,	loop_2397
	tcs	%icc,	0x1
	sdivcc	%i5,	0x0D78,	%o6
	fpmerge	%f17,	%f28,	%f8
loop_2397:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x6
	bcs,a,pt	%xcc,	loop_2398
	fbne	%fcc2,	loop_2399
	std	%f28,	[%l7 + 0x48]
	fblg	%fcc3,	loop_2400
loop_2398:
	andcc	%o2,	%o3,	%g2
loop_2399:
	bvc,pn	%xcc,	loop_2401
	udivx	%g3,	0x17B0,	%i6
loop_2400:
	movrgez	%l0,	%o4,	%l6
	fmovscc	%icc,	%f24,	%f21
loop_2401:
	orn	%g4,	%l4,	%i3
	bpos	loop_2402
	mova	%xcc,	%l2,	%g7
	add	%i4,	0x19C2,	%i7
	movcc	%icc,	%g6,	%o7
loop_2402:
	sllx	%o5,	%l5,	%g1
	subc	%l1,	%i2,	%l3
	or	%o1,	0x0DCF,	%i0
	for	%f26,	%f4,	%f28
	addcc	%o0,	0x07EE,	%i1
	edge16ln	%g5,	%o6,	%i5
	movge	%xcc,	%o3,	%g2
	fmovs	%f30,	%f11
	movl	%xcc,	%o2,	%i6
	fbe	%fcc0,	loop_2403
	sub	%l0,	%g3,	%l6
	tn	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2403:
	movge	%icc,	%o4,	%g4
	tcc	%icc,	0x3
	sethi	0x0F4B,	%l4
	membar	0x4D
	fbul,a	%fcc3,	loop_2404
	sethi	0x1BBF,	%i3
	bvs,pn	%icc,	loop_2405
	fbuge,a	%fcc3,	loop_2406
loop_2404:
	xorcc	%g7,	0x0FC0,	%i4
	wr	%g0,	0x5f,	%asi
	stxa	%i7,	[%g0 + 0x0] %asi
loop_2405:
	edge16n	%l2,	%g6,	%o5
loop_2406:
	mova	%xcc,	%l5,	%o7
	fpsub16s	%f18,	%f19,	%f0
	addcc	%l1,	%i2,	%g1
	addccc	%l3,	%o1,	%i0
	mulx	%i1,	%o0,	%g5
	fmovde	%icc,	%f25,	%f1
	bg	loop_2407
	brgz	%i5,	loop_2408
	popc	%o6,	%o3
	fnegs	%f4,	%f29
loop_2407:
	fbge,a	%fcc1,	loop_2409
loop_2408:
	movn	%icc,	%g2,	%o2
	brgez,a	%i6,	loop_2410
	andncc	%g3,	%l6,	%l0
loop_2409:
	fmul8x16	%f2,	%f30,	%f26
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
loop_2410:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%l4,	[%l7 + 0x70] %asi
	stb	%o4,	[%l7 + 0x18]
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x70] %asi,	%g7
	fmovsgu	%xcc,	%f13,	%f30
	brlz	%i4,	loop_2411
	mova	%icc,	%i7,	%i3
	movgu	%xcc,	%l2,	%o5
	xnorcc	%l5,	0x00D8,	%g6
loop_2411:
	edge8n	%l1,	%i2,	%o7
	and	%l3,	0x10B1,	%g1
	umul	%i0,	%i1,	%o1
	bne,a,pn	%xcc,	loop_2412
	fmovrdgz	%g5,	%f6,	%f26
	subc	%o0,	%i5,	%o6
	addcc	%o3,	%g2,	%o2
loop_2412:
	sir	0x15DD
	umul	%g3,	%l6,	%l0
	bvc	%xcc,	loop_2413
	stbar
	orcc	%i6,	0x0368,	%g4
	tl	%xcc,	0x7
loop_2413:
	fxnor	%f22,	%f20,	%f20
	bgu,pn	%icc,	loop_2414
	nop
	set	0x36, %g6
	ldsh	[%l7 + %g6],	%o4
	fmovdvc	%xcc,	%f9,	%f29
	ldsb	[%l7 + 0x75],	%g7
loop_2414:
	fandnot1	%f24,	%f18,	%f12
	fmovd	%f30,	%f10
	xorcc	%i4,	%l4,	%i3
	fbul,a	%fcc3,	loop_2415
	tle	%xcc,	0x2
	fcmpd	%fcc2,	%f10,	%f20
	tcc	%icc,	0x4
loop_2415:
	array8	%l2,	%i7,	%l5
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x74] %asi,	%o5
	fornot2	%f14,	%f20,	%f4
	and	%l1,	0x000B,	%i2
	fmovrslez	%g6,	%f14,	%f12
	ldd	[%l7 + 0x58],	%o6
	set	0x7C, %i6
	sta	%f24,	[%l7 + %i6] 0x14
	bge,a,pt	%icc,	loop_2416
	tge	%icc,	0x2
	tge	%icc,	0x3
	fnor	%f4,	%f24,	%f14
loop_2416:
	umulcc	%l3,	0x0084,	%i0
	set	0x78, %g4
	sta	%f27,	[%l7 + %g4] 0x18
	fors	%f30,	%f15,	%f11
	movge	%xcc,	%g1,	%o1
	sir	0x15FC
	xnor	%g5,	%o0,	%i5
	tg	%xcc,	0x3
	tgu	%icc,	0x3
	subccc	%i1,	0x02BB,	%o6
	movn	%xcc,	%g2,	%o3
	movrgz	%g3,	%o2,	%l0
	movrne	%i6,	%l6,	%o4
	fbge	%fcc2,	loop_2417
	movrne	%g4,	%i4,	%l4
	orncc	%g7,	0x16AD,	%i3
	tne	%icc,	0x5
loop_2417:
	fornot1	%f18,	%f12,	%f12
	add	%i7,	0x0691,	%l5
	array8	%l2,	%o5,	%i2
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x108] %asi,	%g6
	movrgz	%l1,	0x265,	%o7
	xnor	%l3,	0x0F72,	%i0
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xea,	%o0
	fpadd16	%f22,	%f20,	%f16
	set	0x64, %i2
	swapa	[%l7 + %i2] 0x89,	%g1
	movle	%icc,	%o0,	%i5
	fbg	%fcc0,	loop_2418
	fbule	%fcc2,	loop_2419
	tsubcc	%g5,	%o6,	%g2
	fmovrsne	%i1,	%f16,	%f16
loop_2418:
	std	%f22,	[%l7 + 0x78]
loop_2419:
	subc	%g3,	%o2,	%l0
	fpmerge	%f28,	%f22,	%f8
	edge32	%o3,	%l6,	%o4
	fands	%f31,	%f16,	%f11
	fmovdneg	%xcc,	%f29,	%f15
	tgu	%icc,	0x7
	fand	%f10,	%f18,	%f2
	fbo	%fcc3,	loop_2420
	fmovse	%icc,	%f8,	%f12
	tsubcctv	%i6,	0x08E0,	%i4
	fsrc1s	%f8,	%f17
loop_2420:
	edge8l	%l4,	%g4,	%g7
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x88
	fpmerge	%f18,	%f27,	%f22
	bpos	%icc,	loop_2421
	movne	%xcc,	%i3,	%l5
	fbge	%fcc1,	loop_2422
	nop
	set	0x58, %o1
	ldd	[%l7 + %o1],	%f0
loop_2421:
	fmul8x16au	%f25,	%f17,	%f16
	fmul8sux16	%f26,	%f2,	%f24
loop_2422:
	tle	%icc,	0x6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i7,	%o5
	subcc	%i2,	0x0481,	%l2
	fmovsle	%icc,	%f17,	%f30
	edge32n	%l1,	%g6,	%l3
	subccc	%o7,	%o1,	%g1
	set	0x2C, %o7
	lda	[%l7 + %o7] 0x15,	%f10
	mulx	%o0,	%i5,	%i0
	andncc	%g5,	%g2,	%o6
	fmovdl	%xcc,	%f7,	%f14
	srl	%g3,	%i1,	%o2
	tleu	%icc,	0x5
	subccc	%l0,	0x1913,	%o3
	tle	%xcc,	0x5
	edge32l	%l6,	%i6,	%o4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l4,	%g4
	membar	0x71
	tcc	%xcc,	0x3
	ldsw	[%l7 + 0x74],	%g7
	udivx	%i3,	0x1F5D,	%l5
	array16	%i7,	%i4,	%o5
	array32	%l2,	%i2,	%g6
	udivx	%l1,	0x1139,	%o7
	addccc	%o1,	0x1326,	%l3
	smulcc	%g1,	%o0,	%i0
	fpsub16	%f20,	%f30,	%f6
	ldub	[%l7 + 0x6E],	%i5
	fmovdge	%icc,	%f8,	%f25
	tneg	%xcc,	0x1
	smulcc	%g2,	%g5,	%g3
	srax	%o6,	%i1,	%o2
	fbg,a	%fcc3,	loop_2423
	fmovdl	%xcc,	%f14,	%f11
	fnor	%f18,	%f22,	%f8
	fmul8sux16	%f26,	%f6,	%f20
loop_2423:
	movn	%icc,	%l0,	%l6
	fnegd	%f28,	%f0
	srax	%o3,	0x12,	%i6
	be,a,pt	%xcc,	loop_2424
	and	%l4,	0x13F4,	%o4
	fcmpd	%fcc3,	%f26,	%f14
	fornot2s	%f4,	%f30,	%f28
loop_2424:
	fmovde	%icc,	%f31,	%f18
	mulx	%g7,	%i3,	%g4
	fandnot1	%f26,	%f4,	%f14
	movre	%l5,	0x064,	%i4
	fblg,a	%fcc2,	loop_2425
	fand	%f14,	%f18,	%f6
	fbne	%fcc1,	loop_2426
	fmovdpos	%xcc,	%f9,	%f24
loop_2425:
	nop
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x0C] %asi,	%f17
loop_2426:
	fandnot1	%f26,	%f8,	%f20
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	srl	%o5,	%i2,	%g6
	mulx	%l1,	0x14EA,	%o7
	xnorcc	%l2,	0x1F59,	%o1
	tpos	%xcc,	0x1
	movcs	%icc,	%l3,	%g1
	fpadd32s	%f10,	%f27,	%f0
	fba,a	%fcc1,	loop_2427
	fbuge,a	%fcc0,	loop_2428
	srl	%o0,	%i0,	%g2
	subcc	%g5,	%i5,	%g3
loop_2427:
	movrlz	%o6,	0x327,	%o2
loop_2428:
	tge	%xcc,	0x7
	umul	%l0,	0x188A,	%l6
	set	0x58, %l6
	ldswa	[%l7 + %l6] 0x81,	%o3
	movvc	%xcc,	%i6,	%l4
	fmovscc	%xcc,	%f29,	%f22
	fmovrdlz	%o4,	%f10,	%f2
	fnand	%f30,	%f30,	%f14
	edge8n	%i1,	%i3,	%g4
	tcc	%xcc,	0x4
	mulscc	%l5,	%i4,	%i7
	smulcc	%o5,	%i2,	%g6
	fbuge,a	%fcc1,	loop_2429
	fmovscc	%icc,	%f25,	%f3
	sra	%l1,	%g7,	%o7
	fmovrdgez	%l2,	%f6,	%f12
loop_2429:
	alignaddrl	%l3,	%g1,	%o1
	fble,a	%fcc2,	loop_2430
	fpsub16	%f30,	%f10,	%f22
	tvc	%icc,	0x3
	mova	%xcc,	%o0,	%g2
loop_2430:
	movpos	%icc,	%g5,	%i0
	movpos	%icc,	%i5,	%o6
	tn	%icc,	0x6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%l0
	xnor	%l6,	0x098F,	%g3
	fmovs	%f8,	%f17
	fmovsg	%icc,	%f31,	%f4
	srl	%o3,	0x1E,	%i6
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l4
	subcc	%i1,	%i3,	%o4
	fsrc1s	%f29,	%f17
	movge	%icc,	%l5,	%i4
	alignaddr	%g4,	%o5,	%i7
	nop
	set	0x38, %o4
	ldstub	[%l7 + %o4],	%i2
	fpsub16s	%f24,	%f20,	%f2
	movge	%xcc,	%g6,	%g7
	bne,pn	%icc,	loop_2431
	pdist	%f2,	%f6,	%f6
	movrlz	%l1,	0x12B,	%o7
	fnand	%f22,	%f28,	%f4
loop_2431:
	fbg,a	%fcc3,	loop_2432
	fsrc1s	%f30,	%f6
	fpmerge	%f9,	%f29,	%f26
	fzero	%f18
loop_2432:
	srax	%l3,	%g1,	%o1
	ldx	[%l7 + 0x08],	%l2
	fbug	%fcc3,	loop_2433
	alignaddr	%g2,	%g5,	%o0
	fmuld8ulx16	%f23,	%f17,	%f14
	set	0x68, %l2
	lda	[%l7 + %l2] 0x89,	%f15
loop_2433:
	tne	%icc,	0x4
	st	%f27,	[%l7 + 0x4C]
	brlez	%i5,	loop_2434
	movcc	%icc,	%i0,	%o6
	mulx	%o2,	%l0,	%g3
	fmovd	%f26,	%f28
loop_2434:
	andncc	%l6,	%o3,	%l4
	edge32	%i6,	%i3,	%i1
	bpos,a	loop_2435
	orncc	%l5,	%o4,	%i4
	movne	%xcc,	%o5,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2435:
	movg	%icc,	%i7,	%i2
	orcc	%g7,	%g6,	%l1
	tneg	%icc,	0x1
	nop
	setx loop_2436, %l0, %l1
	jmpl %l1, %l3
	sir	0x0EC9
	xnor	%o7,	%o1,	%g1
	tcs	%icc,	0x5
loop_2436:
	xor	%l2,	0x1FE4,	%g5
	fmul8x16al	%f30,	%f28,	%f16
	tge	%xcc,	0x0
	udivcc	%g2,	0x160C,	%o0
	nop
	setx	loop_2437,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tn	%icc,	0x6
	fmovrde	%i5,	%f28,	%f0
	fmovsvc	%xcc,	%f28,	%f12
loop_2437:
	edge16l	%i0,	%o2,	%l0
	ldub	[%l7 + 0x2D],	%o6
	bne,a,pt	%icc,	loop_2438
	xnorcc	%l6,	0x1ECB,	%o3
	bne,a,pt	%xcc,	loop_2439
	tvs	%xcc,	0x6
loop_2438:
	fmul8x16	%f15,	%f18,	%f12
	mova	%xcc,	%l4,	%i6
loop_2439:
	tne	%icc,	0x4
	edge8ln	%i3,	%g3,	%l5
	array16	%i1,	%o4,	%i4
	array32	%o5,	%i7,	%i2
	nop
	setx	loop_2440,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%icc,	0x1
	orncc	%g4,	%g7,	%g6
	tneg	%xcc,	0x1
loop_2440:
	tvc	%xcc,	0x0
	tcs	%xcc,	0x3
	wr	%g0,	0x10,	%asi
	stxa	%l1,	[%l7 + 0x28] %asi
	andcc	%l3,	0x00E1,	%o1
	tneg	%icc,	0x5
	mulx	%g1,	%o7,	%l2
	fble,a	%fcc2,	loop_2441
	sllx	%g2,	0x1C,	%o0
	tcc	%xcc,	0x2
	bneg	%icc,	loop_2442
loop_2441:
	sdivx	%i5,	0x0872,	%i0
	umulcc	%g5,	0x14F6,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2442:
	andncc	%o6,	%l6,	%o3
	fmovspos	%icc,	%f29,	%f5
	tcs	%xcc,	0x3
	movcc	%xcc,	%o2,	%i6
	orncc	%i3,	%g3,	%l5
	prefetch	[%l7 + 0x08],	 0x0
	sll	%l4,	%i1,	%i4
	movrne	%o5,	0x0DB,	%o4
	sllx	%i2,	%i7,	%g7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x18] %asi,	%f27
	smul	%g6,	%l1,	%l3
	fba	%fcc3,	loop_2443
	sllx	%g4,	%o1,	%g1
	fandnot2	%f30,	%f2,	%f16
	stbar
loop_2443:
	andncc	%o7,	%l2,	%g2
	move	%icc,	%o0,	%i0
	set	0x63, %o6
	ldsba	[%l7 + %o6] 0x10,	%g5
	movcs	%icc,	%i5,	%o6
	tg	%xcc,	0x7
	fbul	%fcc2,	loop_2444
	fcmple16	%f28,	%f26,	%l0
	fmovrdgez	%o3,	%f0,	%f12
	edge8	%o2,	%l6,	%i6
loop_2444:
	bneg,a	loop_2445
	sra	%g3,	%l5,	%i3
	movge	%xcc,	%l4,	%i1
	ldstub	[%l7 + 0x6B],	%i4
loop_2445:
	sdiv	%o4,	0x17FF,	%i2
	stw	%i7,	[%l7 + 0x44]
	xor	%g7,	0x1B91,	%o5
	move	%icc,	%l1,	%g6
	umul	%l3,	0x00C6,	%o1
	srax	%g1,	0x15,	%o7
	fnegd	%f4,	%f24
	movgu	%xcc,	%g4,	%l2
	fandnot2s	%f22,	%f6,	%f23
	udivx	%g2,	0x1F01,	%o0
	fmovde	%xcc,	%f3,	%f10
	sir	0x1994
	ldd	[%l7 + 0x58],	%i0
	tge	%xcc,	0x1
	edge8l	%i5,	%g5,	%l0
	bl	loop_2446
	ld	[%l7 + 0x18],	%f28
	brz	%o3,	loop_2447
	nop
	set	0x29, %g7
	ldstub	[%l7 + %g7],	%o6
loop_2446:
	fbne,a	%fcc1,	loop_2448
	andncc	%o2,	%l6,	%i6
loop_2447:
	tg	%icc,	0x4
	nop
	setx loop_2449, %l0, %l1
	jmpl %l1, %l5
loop_2448:
	ble,pn	%xcc,	loop_2450
	nop
	set	0x45, %i0
	ldsb	[%l7 + %i0],	%g3
	membar	0x28
loop_2449:
	taddcctv	%l4,	0x006D,	%i1
loop_2450:
	fmovrsgz	%i3,	%f30,	%f4
	sdivx	%i4,	0x0BA8,	%o4
	be,a	%xcc,	loop_2451
	bcs	loop_2452
	tn	%xcc,	0x2
	fmovdcc	%icc,	%f23,	%f5
loop_2451:
	stbar
loop_2452:
	sdiv	%i7,	0x19F9,	%g7
	fcmple32	%f28,	%f2,	%i2
	tcc	%xcc,	0x2
	membar	0x28
	edge16n	%o5,	%g6,	%l3
	sllx	%l1,	%g1,	%o1
	fpack16	%f4,	%f24
	fba,a	%fcc2,	loop_2453
	smul	%g4,	%l2,	%o7
	movrlz	%g2,	0x0B7,	%o0
	bcc,a	%xcc,	loop_2454
loop_2453:
	alignaddr	%i5,	%g5,	%l0
	brgez,a	%i0,	loop_2455
	movne	%icc,	%o6,	%o3
loop_2454:
	fmul8ulx16	%f8,	%f8,	%f10
	tg	%icc,	0x3
loop_2455:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l6,	0x09EC,	%o2
	addcc	%l5,	0x026A,	%g3
	sdivx	%i6,	0x04D9,	%l4
	tcs	%xcc,	0x4
	alignaddrl	%i3,	%i1,	%i4
	stw	%i7,	[%l7 + 0x48]
	bvs	loop_2456
	xnorcc	%o4,	%i2,	%g7
	orn	%g6,	%o5,	%l3
	xorcc	%l1,	%o1,	%g1
loop_2456:
	tle	%icc,	0x3
	move	%icc,	%l2,	%g4
	xorcc	%g2,	0x0831,	%o7
	set	0x4A, %l5
	ldsha	[%l7 + %l5] 0x81,	%o0
	ta	%icc,	0x1
	ldd	[%l7 + 0x48],	%g4
	ldstub	[%l7 + 0x74],	%l0
	fmovrdgz	%i0,	%f26,	%f8
	fmovdg	%icc,	%f22,	%f21
	movl	%icc,	%o6,	%o3
	subcc	%i5,	0x16F7,	%l6
	fmovsvc	%icc,	%f23,	%f2
	edge16n	%o2,	%g3,	%l5
	taddcc	%i6,	%l4,	%i3
	fmovsne	%icc,	%f18,	%f15
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x37] %asi,	%i1
	movge	%icc,	%i7,	%o4
	prefetch	[%l7 + 0x3C],	 0x3
	fbu	%fcc3,	loop_2457
	fmovde	%icc,	%f27,	%f16
	tg	%icc,	0x1
	brz,a	%i4,	loop_2458
loop_2457:
	umul	%i2,	0x19C3,	%g6
	umul	%o5,	%l3,	%g7
	movgu	%xcc,	%l1,	%o1
loop_2458:
	edge16n	%l2,	%g4,	%g2
	brgez	%o7,	loop_2459
	fmovdcs	%icc,	%f9,	%f31
	subccc	%o0,	0x044F,	%g5
	stx	%l0,	[%l7 + 0x60]
loop_2459:
	fmul8x16	%f12,	%f26,	%f18
	fmul8x16au	%f2,	%f11,	%f2
	fsrc2	%f16,	%f22
	alignaddrl	%g1,	%i0,	%o3
	ld	[%l7 + 0x74],	%f2
	array16	%o6,	%l6,	%o2
	set	0x08, %l1
	prefetcha	[%l7 + %l1] 0x10,	 0x1
	movre	%i5,	0x216,	%l5
	movgu	%icc,	%l4,	%i6
	te	%xcc,	0x4
	movre	%i1,	%i7,	%o4
	fbn	%fcc0,	loop_2460
	sllx	%i4,	0x15,	%i2
	for	%f24,	%f2,	%f14
	tpos	%xcc,	0x4
loop_2460:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x37] %asi,	%i3
	ba,pn	%icc,	loop_2461
	fors	%f6,	%f8,	%f27
	movrgz	%o5,	0x032,	%g6
	ldub	[%l7 + 0x70],	%l3
loop_2461:
	movn	%xcc,	%l1,	%o1
	fpsub32s	%f8,	%f13,	%f4
	tneg	%xcc,	0x2
	fcmped	%fcc1,	%f6,	%f12
	ldd	[%l7 + 0x58],	%g6
	fxor	%f18,	%f28,	%f2
	sethi	0x0695,	%g4
	membar	0x23
	bg,pt	%icc,	loop_2462
	fmovsne	%xcc,	%f17,	%f9
	subc	%g2,	0x06D5,	%o7
	fmovspos	%icc,	%f18,	%f7
loop_2462:
	fmovrde	%o0,	%f0,	%f30
	fors	%f15,	%f7,	%f0
	fandnot1	%f30,	%f4,	%f8
	set	0x2C, %o2
	lda	[%l7 + %o2] 0x15,	%f17
	nop
	set	0x22, %g1
	lduh	[%l7 + %g1],	%l2
	te	%xcc,	0x1
	fmul8sux16	%f30,	%f14,	%f28
	fxor	%f28,	%f0,	%f2
	sllx	%l0,	%g1,	%g5
	fbuge,a	%fcc3,	loop_2463
	bcs,a,pn	%icc,	loop_2464
	fbl,a	%fcc3,	loop_2465
	fmovdvc	%xcc,	%f21,	%f15
loop_2463:
	edge32l	%i0,	%o3,	%o6
loop_2464:
	tg	%xcc,	0x4
loop_2465:
	tleu	%xcc,	0x7
	orncc	%o2,	0x0403,	%g3
	tne	%xcc,	0x2
	set	0x16, %o5
	stba	%l6,	[%l7 + %o5] 0x80
	edge8	%l5,	%i5,	%i6
	bpos,a,pn	%xcc,	loop_2466
	brlez	%l4,	loop_2467
	fornot1s	%f22,	%f17,	%f15
	movpos	%icc,	%i1,	%i7
loop_2466:
	stw	%i4,	[%l7 + 0x6C]
loop_2467:
	subcc	%o4,	0x1EFF,	%i2
	fmul8x16al	%f12,	%f25,	%f24
	movleu	%xcc,	%o5,	%g6
	popc	%l3,	%i3
	xnor	%l1,	%g7,	%o1
	tgu	%icc,	0x0
	movrlz	%g2,	0x165,	%o7
	edge8ln	%o0,	%g4,	%l0
	tn	%xcc,	0x0
	sllx	%g1,	%g5,	%l2
	fbg	%fcc1,	loop_2468
	addc	%i0,	0x1E6F,	%o6
	movcc	%icc,	%o3,	%o2
	bne	%icc,	loop_2469
loop_2468:
	fmovrdlez	%g3,	%f10,	%f18
	srl	%l5,	0x17,	%i5
	srlx	%l6,	0x18,	%l4
loop_2469:
	mova	%icc,	%i6,	%i7
	bleu,pn	%xcc,	loop_2470
	fand	%f28,	%f14,	%f26
	popc	0x06CD,	%i1
	orncc	%o4,	%i4,	%i2
loop_2470:
	fcmple16	%f22,	%f26,	%g6
	tn	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%l3
	bl,a	%xcc,	loop_2471
	bl	loop_2472
	brlz	%o5,	loop_2473
	sir	0x0391
loop_2471:
	fsrc2s	%f0,	%f27
loop_2472:
	srl	%i3,	0x1E,	%g7
loop_2473:
	addccc	%l1,	0x150B,	%g2
	bgu,a,pn	%xcc,	loop_2474
	fbo	%fcc1,	loop_2475
	tcs	%icc,	0x5
	bn	loop_2476
loop_2474:
	sllx	%o1,	0x10,	%o7
loop_2475:
	mulx	%g4,	%o0,	%g1
	subc	%g5,	%l2,	%l0
loop_2476:
	pdist	%f30,	%f28,	%f4
	fxnor	%f24,	%f24,	%f8
	edge32	%o6,	%i0,	%o3
	set	0x31, %i7
	ldstuba	[%l7 + %i7] 0x04,	%g3
	sub	%l5,	0x013F,	%i5
	sethi	0x0ED9,	%l6
	movvc	%icc,	%l4,	%o2
	tneg	%xcc,	0x3
	pdist	%f8,	%f12,	%f4
	membar	0x5D
	set	0x60, %i5
	ldxa	[%l7 + %i5] 0x14,	%i7
	movvs	%xcc,	%i6,	%o4
	movvc	%icc,	%i1,	%i4
	tge	%icc,	0x0
	flush	%l7 + 0x30
	movpos	%xcc,	%i2,	%g6
	alignaddr	%o5,	%i3,	%l3
	xnorcc	%g7,	0x06FD,	%l1
	movrlz	%o1,	%g2,	%o7
	sub	%g4,	%o0,	%g1
	mulscc	%l2,	0x1FB7,	%l0
	sdiv	%g5,	0x1CE5,	%i0
	lduh	[%l7 + 0x0C],	%o3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%g3
	array32	%i5,	%l5,	%l6
	sdivcc	%l4,	0x1957,	%o2
	fba,a	%fcc1,	loop_2477
	movcs	%xcc,	%i7,	%i6
	subccc	%o4,	%i4,	%i1
	fpmerge	%f3,	%f31,	%f6
loop_2477:
	umul	%i2,	0x06E1,	%g6
	xnorcc	%o5,	%i3,	%l3
	orncc	%g7,	%l1,	%o1
	or	%o7,	0x051A,	%g4
	umul	%g2,	0x02F3,	%o0
	umulcc	%l2,	%l0,	%g1
	edge32	%i0,	%o3,	%o6
	sra	%g3,	%i5,	%g5
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x19
	sdiv	%l5,	0x1E13,	%l6
	fcmpeq16	%f10,	%f30,	%o2
	fmul8ulx16	%f14,	%f14,	%f16
	xorcc	%i7,	0x162A,	%l4
	udivx	%i6,	0x1BA7,	%i4
	movne	%icc,	%i1,	%o4
	ta	%icc,	0x0
	bleu,a,pt	%icc,	loop_2478
	fpadd32s	%f29,	%f28,	%f19
	fmovspos	%xcc,	%f20,	%f12
	set	0x1D, %g2
	lduba	[%l7 + %g2] 0x19,	%g6
loop_2478:
	addcc	%o5,	%i3,	%i2
	fors	%f25,	%f29,	%f4
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x1f,	%f16
	addcc	%g7,	%l3,	%o1
	fmovrdgez	%l1,	%f8,	%f30
	fcmpgt16	%f22,	%f6,	%g4
	fmovsne	%xcc,	%f0,	%f2
	udiv	%o7,	0x04F2,	%g2
	fbn	%fcc0,	loop_2479
	edge16l	%l2,	%l0,	%g1
	fabss	%f22,	%f27
	umul	%o0,	%o3,	%i0
loop_2479:
	movle	%icc,	%o6,	%i5
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x30] %asi,	%f9
	fmovse	%icc,	%f24,	%f16
	set	0x60, %i4
	stxa	%g5,	[%l7 + %i4] 0x81
	fmul8sux16	%f26,	%f20,	%f12
	edge16l	%g3,	%l6,	%l5
	fmovdn	%xcc,	%f2,	%f1
	fba,a	%fcc0,	loop_2480
	ta	%xcc,	0x0
	bgu,pt	%xcc,	loop_2481
	udivx	%o2,	0x1A5D,	%i7
loop_2480:
	movre	%l4,	%i4,	%i1
	movneg	%icc,	%o4,	%i6
loop_2481:
	subcc	%o5,	0x1EAB,	%g6
	movrlez	%i3,	0x317,	%i2
	sll	%l3,	%o1,	%l1
	subc	%g4,	0x076B,	%o7
	ldsw	[%l7 + 0x10],	%g2
	edge16	%l2,	%l0,	%g7
	mova	%icc,	%o0,	%o3
	fpsub16s	%f0,	%f17,	%f2
	umulcc	%i0,	0x02E7,	%g1
	fmovrsne	%i5,	%f16,	%f3
	ta	%icc,	0x1
	sdivcc	%g5,	0x086E,	%g3
	tcc	%icc,	0x6
	movneg	%xcc,	%l6,	%l5
	fnegd	%f14,	%f10
	st	%f2,	[%l7 + 0x34]
	fbule	%fcc2,	loop_2482
	fmul8ulx16	%f10,	%f2,	%f30
	fble	%fcc3,	loop_2483
	be	%xcc,	loop_2484
loop_2482:
	udiv	%o2,	0x0977,	%i7
	fpsub16	%f20,	%f12,	%f4
loop_2483:
	nop
	set	0x30, %o0
	prefetcha	[%l7 + %o0] 0x19,	 0x1
loop_2484:
	fmovdvs	%icc,	%f25,	%f26
	udivcc	%i4,	0x1859,	%i1
	set	0x5C, %l0
	lda	[%l7 + %l0] 0x04,	%f31
	tsubcctv	%o4,	0x1EB6,	%i6
	fmovde	%icc,	%f14,	%f12
	sdivx	%o5,	0x09A7,	%g6
	fpack16	%f18,	%f23
	sir	0x1BCF
	fabsd	%f22,	%f18
	xnor	%o6,	%i3,	%l3
	tsubcctv	%i2,	%o1,	%l1
	fbule,a	%fcc3,	loop_2485
	edge32l	%g4,	%g2,	%l2
	set	0x1A, %i1
	ldstuba	[%l7 + %i1] 0x11,	%l0
loop_2485:
	std	%f2,	[%l7 + 0x18]
	edge8n	%g7,	%o7,	%o0
	fmuld8ulx16	%f4,	%f22,	%f14
	tsubcctv	%o3,	%i0,	%g1
	std	%i4,	[%l7 + 0x38]
	fmul8x16al	%f31,	%f16,	%f16
	udivx	%g5,	0x0746,	%g3
	taddcctv	%l5,	0x13FE,	%l6
	edge16ln	%i7,	%l4,	%i4
	umul	%o2,	0x0470,	%i1
	movl	%xcc,	%i6,	%o4
	array8	%g6,	%o5,	%o6
	std	%i2,	[%l7 + 0x40]
	fmovsgu	%xcc,	%f21,	%f17
	movneg	%icc,	%i2,	%o1
	smulcc	%l3,	0x142C,	%l1
	fbn,a	%fcc2,	loop_2486
	std	%g2,	[%l7 + 0x08]
	taddcctv	%l2,	0x1041,	%g4
	fone	%f6
loop_2486:
	nop
	setx loop_2487, %l0, %l1
	jmpl %l1, %g7
	movg	%xcc,	%l0,	%o7
	tsubcctv	%o3,	%o0,	%i0
	andn	%g1,	0x1EF9,	%g5
loop_2487:
	nop
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
	fmovdvs	%icc,	%f29,	%f4
	fpadd16	%f30,	%f8,	%f14
	taddcc	%l5,	%g3,	%i7
	fmovdn	%xcc,	%f2,	%f24
	movcs	%xcc,	%l6,	%i4
	srax	%o2,	0x18,	%i1
	edge16n	%l4,	%i6,	%o4
	tsubcc	%o5,	0x1959,	%g6
	movneg	%xcc,	%i3,	%o6
	bpos,a,pn	%xcc,	loop_2488
	ld	[%l7 + 0x28],	%f19
	edge8l	%o1,	%i2,	%l1
	set	0x74, %l4
	stwa	%g2,	[%l7 + %l4] 0x22
	membar	#Sync
loop_2488:
	fmovsa	%icc,	%f10,	%f2
	fmuld8sux16	%f27,	%f26,	%f30
	sllx	%l2,	%l3,	%g7
	brz,a	%g4,	loop_2489
	xnor	%o7,	%l0,	%o3
	fmovsa	%xcc,	%f0,	%f10
	call	loop_2490
loop_2489:
	movrne	%o0,	%i0,	%g5
	sub	%g1,	0x00B3,	%l5
	fmovrsne	%i5,	%f24,	%f27
loop_2490:
	bneg,a	%xcc,	loop_2491
	fmovrdlez	%g3,	%f30,	%f0
	move	%xcc,	%l6,	%i7
	ldsb	[%l7 + 0x23],	%o2
loop_2491:
	bcs,a,pt	%xcc,	loop_2492
	array16	%i1,	%l4,	%i4
	fsrc2	%f8,	%f18
	edge32	%i6,	%o4,	%g6
loop_2492:
	fmovsle	%xcc,	%f31,	%f6
	sub	%o5,	0x160C,	%o6
	fpadd16	%f20,	%f6,	%f16
	bn,a	loop_2493
	tcs	%xcc,	0x1
	xnorcc	%o1,	%i2,	%l1
	fbne	%fcc2,	loop_2494
loop_2493:
	fexpand	%f20,	%f18
	fmuld8sux16	%f24,	%f26,	%f20
	fmovscc	%icc,	%f20,	%f13
loop_2494:
	udivcc	%i3,	0x0390,	%l2
	movvc	%icc,	%g2,	%l3
	movgu	%icc,	%g4,	%g7
	fmovsleu	%xcc,	%f19,	%f28
	fmovrsne	%l0,	%f19,	%f19
	wr	%g0,	0x80,	%asi
	stba	%o3,	[%l7 + 0x11] %asi
	tvs	%icc,	0x7
	edge16ln	%o7,	%o0,	%i0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	set	0x08, %g5
	ldxa	[%l7 + %g5] 0x15,	%l5
	faligndata	%f0,	%f30,	%f16
	set	0x40, %i6
	stxa	%g5,	[%l7 + %i6] 0x81
	brlz,a	%i5,	loop_2495
	array32	%l6,	%i7,	%g3
	taddcctv	%o2,	%l4,	%i4
	fmovdl	%xcc,	%f21,	%f25
loop_2495:
	fbe	%fcc2,	loop_2496
	sub	%i1,	%o4,	%g6
	udiv	%i6,	0x08B4,	%o5
	edge16l	%o1,	%o6,	%i2
loop_2496:
	sub	%i3,	0x1326,	%l1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x70] %asi,	%g2
	fsrc2s	%f21,	%f24
	movrgez	%l2,	0x281,	%l3
	fmovsn	%icc,	%f27,	%f6
	fbg,a	%fcc0,	loop_2497
	edge8n	%g7,	%l0,	%o3
	add	%o7,	0x0B6A,	%o0
	tcc	%xcc,	0x7
loop_2497:
	fmovrslez	%g4,	%f27,	%f18
	alignaddrl	%i0,	%l5,	%g1
	movne	%icc,	%g5,	%l6
	bl,a	%xcc,	loop_2498
	subccc	%i5,	%g3,	%o2
	fbug,a	%fcc0,	loop_2499
	fmovrdgez	%l4,	%f4,	%f28
loop_2498:
	edge16ln	%i7,	%i4,	%i1
	fcmpeq32	%f2,	%f28,	%g6
loop_2499:
	umul	%i6,	%o4,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o6,	%o5,	%i3
	wr	%g0,	0x23,	%asi
	stwa	%l1,	[%l7 + 0x6C] %asi
	membar	#Sync
	tvc	%xcc,	0x7
	bge,a	loop_2500
	fnot2s	%f7,	%f29
	bl,a,pn	%icc,	loop_2501
	xnor	%g2,	%l2,	%i2
loop_2500:
	fpadd16s	%f31,	%f28,	%f28
	tge	%xcc,	0x5
loop_2501:
	orcc	%l3,	0x1128,	%g7
	edge32n	%l0,	%o7,	%o3
	andcc	%g4,	%i0,	%l5
	sdivcc	%g1,	0x0C37,	%o0
	array8	%l6,	%i5,	%g5
	and	%o2,	0x133E,	%g3
	mulx	%l4,	0x1633,	%i7
	andn	%i4,	0x0CB5,	%g6
	array32	%i6,	%o4,	%o1
	fpsub16s	%f28,	%f0,	%f22
	fone	%f2
	movn	%xcc,	%o6,	%i1
	add	%l7,	0x64,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i3,	%o5
	movne	%icc,	%l1,	%l2
	nop
	setx	loop_2502,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ld	[%l7 + 0x48],	%f18
	edge16n	%i2,	%g2,	%l3
	fcmpgt16	%f8,	%f24,	%l0
loop_2502:
	movvc	%xcc,	%o7,	%o3
	movvs	%icc,	%g7,	%i0
	orncc	%g4,	0x1C3D,	%g1
	fcmpgt32	%f8,	%f20,	%o0
	tvc	%xcc,	0x7
	te	%xcc,	0x3
	fornot1s	%f20,	%f26,	%f31
	xorcc	%l6,	0x1182,	%l5
	fmovde	%icc,	%f28,	%f14
	edge8n	%i5,	%g5,	%g3
	udiv	%l4,	0x0D4B,	%i7
	orn	%o2,	0x014E,	%i4
	tne	%icc,	0x0
	fpadd16s	%f9,	%f4,	%f2
	udivx	%i6,	0x019E,	%g6
	taddcctv	%o1,	0x14D7,	%o4
	udiv	%o6,	0x1761,	%i3
	udivx	%o5,	0x1B91,	%l1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%i1,	%l2
	fmovsn	%xcc,	%f24,	%f9
	subcc	%g2,	%l3,	%l0
	st	%f3,	[%l7 + 0x78]
	array16	%i2,	%o7,	%o3
	xnorcc	%g7,	%i0,	%g4
	sth	%o0,	[%l7 + 0x44]
	wr	%g0,	0x88,	%asi
	stwa	%l6,	[%l7 + 0x34] %asi
	tpos	%xcc,	0x7
	bgu,a	loop_2503
	sth	%l5,	[%l7 + 0x40]
	set	0x32, %g6
	lduba	[%l7 + %g6] 0x04,	%g1
loop_2503:
	smul	%g5,	0x1E42,	%g3
	stbar
	tg	%icc,	0x7
	alignaddr	%i5,	%l4,	%i7
	srax	%i4,	%o2,	%i6
	udivcc	%o1,	0x1E45,	%o4
	xnorcc	%o6,	%g6,	%i3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%o5,	%l1
	tg	%xcc,	0x1
	movvc	%icc,	%i1,	%g2
	movrgez	%l2,	%l0,	%l3
	edge16ln	%o7,	%i2,	%o3
	movgu	%icc,	%g7,	%g4
	set	0x1C, %i3
	lduha	[%l7 + %i3] 0x18,	%i0
	taddcc	%l6,	0x12EF,	%l5
	array32	%o0,	%g5,	%g1
	sll	%g3,	%i5,	%l4
	edge8	%i4,	%o2,	%i7
	sdivx	%o1,	0x1742,	%o4
	fpmerge	%f4,	%f31,	%f12
	fones	%f19
	bgu,pn	%icc,	loop_2504
	nop
	setx	loop_2505,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%i6,	0x1AA9,	%o6
	bneg,a	loop_2506
loop_2504:
	fornot1s	%f10,	%f8,	%f23
loop_2505:
	sdiv	%i3,	0x1275,	%o5
	xor	%g6,	0x00E7,	%i1
loop_2506:
	fsrc2	%f20,	%f6
	call	loop_2507
	fcmpne32	%f30,	%f6,	%g2
	xnorcc	%l2,	%l0,	%l1
	bcc,a	%icc,	loop_2508
loop_2507:
	ld	[%l7 + 0x60],	%f17
	set	0x6C, %i2
	sta	%f26,	[%l7 + %i2] 0x0c
loop_2508:
	edge32	%o7,	%l3,	%o3
	prefetch	[%l7 + 0x68],	 0x2
	xorcc	%g7,	0x078F,	%i2
	fnot2s	%f11,	%f9
	udivx	%i0,	0x10C3,	%l6
	brnz	%l5,	loop_2509
	sll	%o0,	%g5,	%g1
	tne	%xcc,	0x2
	edge8ln	%g3,	%g4,	%i5
loop_2509:
	edge16n	%i4,	%o2,	%i7
	udivcc	%l4,	0x1FCE,	%o4
	swap	[%l7 + 0x70],	%i6
	fors	%f19,	%f25,	%f3
	fmuld8ulx16	%f12,	%f22,	%f8
	sethi	0x0703,	%o6
	alignaddr	%o1,	%i3,	%o5
	fornot1	%f20,	%f0,	%f26
	tcs	%xcc,	0x2
	alignaddr	%i1,	%g2,	%l2
	fcmpgt32	%f4,	%f14,	%l0
	fbo	%fcc0,	loop_2510
	srlx	%g6,	0x11,	%o7
	bcc,pn	%icc,	loop_2511
	fbl,a	%fcc2,	loop_2512
loop_2510:
	movg	%xcc,	%l3,	%l1
	tvs	%xcc,	0x4
loop_2511:
	fbu,a	%fcc1,	loop_2513
loop_2512:
	edge32ln	%o3,	%i2,	%g7
	edge8l	%i0,	%l5,	%o0
	fbg	%fcc3,	loop_2514
loop_2513:
	umul	%l6,	%g5,	%g3
	fandnot2s	%f28,	%f9,	%f25
	subccc	%g1,	%i5,	%i4
loop_2514:
	faligndata	%f2,	%f20,	%f18
	sth	%g4,	[%l7 + 0x3C]
	edge8l	%i7,	%l4,	%o4
	fbne	%fcc1,	loop_2515
	fmuld8sux16	%f5,	%f22,	%f18
	bcc,pn	%icc,	loop_2516
	nop
	set	0x38, %g4
	std	%f22,	[%l7 + %g4]
loop_2515:
	orn	%o2,	%i6,	%o6
	fmovdg	%icc,	%f9,	%f22
loop_2516:
	taddcc	%i3,	%o5,	%i1
	andcc	%o1,	%l2,	%l0
	fpack32	%f2,	%f6,	%f22
	edge16	%g6,	%o7,	%g2
	edge32l	%l3,	%o3,	%i2
	call	loop_2517
	array32	%l1,	%i0,	%g7
	ld	[%l7 + 0x74],	%f6
	xnorcc	%o0,	%l6,	%g5
loop_2517:
	fmovdpos	%icc,	%f3,	%f29
	subcc	%l5,	%g1,	%i5
	tvc	%xcc,	0x3
	std	%i4,	[%l7 + 0x70]
	fbl,a	%fcc1,	loop_2518
	udivx	%g3,	0x1A6B,	%i7
	sra	%l4,	0x19,	%o4
	edge8	%g4,	%i6,	%o6
loop_2518:
	taddcctv	%o2,	%o5,	%i3
	fblg,a	%fcc3,	loop_2519
	bge,a,pn	%icc,	loop_2520
	sth	%o1,	[%l7 + 0x66]
	fmovrdne	%l2,	%f24,	%f2
loop_2519:
	tn	%icc,	0x0
loop_2520:
	and	%l0,	0x0DEB,	%g6
	movgu	%icc,	%o7,	%i1
	orncc	%g2,	0x0343,	%l3
	sra	%o3,	%i2,	%l1
	fbul	%fcc1,	loop_2521
	ldd	[%l7 + 0x78],	%i0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%o0
loop_2521:
	nop
	set	0x50, %l3
	ldda	[%l7 + %l3] 0x19,	%i6
	array16	%g7,	%l5,	%g5
	ldsh	[%l7 + 0x76],	%i5
	tpos	%xcc,	0x0
	tg	%icc,	0x6
	fmovse	%icc,	%f27,	%f13
	call	loop_2522
	fpsub32	%f10,	%f16,	%f28
	array32	%g1,	%i4,	%i7
	bn,a	loop_2523
loop_2522:
	fmovrsne	%l4,	%f9,	%f31
	bn,a	%xcc,	loop_2524
	udivx	%o4,	0x10A5,	%g4
loop_2523:
	tvc	%icc,	0x1
	membar	0x55
loop_2524:
	brgez	%g3,	loop_2525
	fmovdge	%icc,	%f17,	%f21
	xorcc	%i6,	0x0CA5,	%o6
	sdivx	%o5,	0x1D88,	%o2
loop_2525:
	bvs	%icc,	loop_2526
	tle	%xcc,	0x0
	movrlz	%i3,	0x05E,	%l2
	bneg,a	loop_2527
loop_2526:
	edge16ln	%l0,	%o1,	%g6
	xorcc	%i1,	%o7,	%g2
	membar	0x60
loop_2527:
	edge32l	%l3,	%i2,	%o3
	bne,a,pt	%icc,	loop_2528
	movvs	%xcc,	%i0,	%l1
	andn	%o0,	%l6,	%g7
	movg	%xcc,	%l5,	%i5
loop_2528:
	nop
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x17,	%f0
	edge16n	%g1,	%g5,	%i7
	tne	%xcc,	0x4
	mulx	%l4,	0x0DCF,	%o4
	bcc,a	%xcc,	loop_2529
	prefetch	[%l7 + 0x54],	 0x3
	array8	%g4,	%i4,	%i6
	fcmpeq16	%f22,	%f20,	%o6
loop_2529:
	tgu	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%o5
	movrne	%g3,	%o2,	%l2
	std	%f28,	[%l7 + 0x68]
	tvs	%icc,	0x0
	fandnot2	%f10,	%f8,	%f26
	fmovda	%xcc,	%f18,	%f3
	edge8ln	%i3,	%o1,	%l0
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x58] %asi,	%f1
	tcc	%xcc,	0x0
	tneg	%xcc,	0x6
	fbule	%fcc2,	loop_2530
	xorcc	%g6,	0x0D55,	%o7
	movg	%icc,	%i1,	%l3
	lduh	[%l7 + 0x36],	%i2
loop_2530:
	edge16n	%g2,	%o3,	%i0
	addccc	%o0,	%l6,	%g7
	tn	%xcc,	0x2
	fmovsg	%xcc,	%f1,	%f30
	movpos	%icc,	%l1,	%l5
	tvs	%xcc,	0x0
	brnz,a	%g1,	loop_2531
	alignaddrl	%i5,	%i7,	%l4
	movvc	%xcc,	%g5,	%g4
	subc	%i4,	0x0ABE,	%i6
loop_2531:
	te	%xcc,	0x7
	edge32l	%o4,	%o5,	%g3
	movneg	%icc,	%o6,	%o2
	andn	%i3,	0x0677,	%o1
	set	0x3C, %l6
	lduha	[%l7 + %l6] 0x18,	%l0
	udiv	%l2,	0x0841,	%o7
	ba,a,pn	%xcc,	loop_2532
	movcc	%icc,	%i1,	%l3
	movg	%icc,	%g6,	%i2
	srl	%g2,	0x00,	%i0
loop_2532:
	subccc	%o3,	0x1A64,	%o0
	taddcc	%l6,	%g7,	%l5
	mulx	%l1,	%i5,	%i7
	movre	%g1,	%l4,	%g5
	tsubcc	%g4,	%i4,	%o4
	movrne	%o5,	%i6,	%g3
	fnors	%f9,	%f31,	%f15
	tcc	%icc,	0x2
	fmovrslez	%o2,	%f18,	%f15
	subccc	%i3,	%o6,	%o1
	nop
	set	0x18, %o7
	std	%l0,	[%l7 + %o7]
	bvc,pn	%xcc,	loop_2533
	smulcc	%l2,	0x0F9C,	%o7
	bg,a,pn	%xcc,	loop_2534
	fmul8ulx16	%f0,	%f18,	%f18
loop_2533:
	orncc	%l3,	%g6,	%i2
	addcc	%i1,	0x0F26,	%g2
loop_2534:
	bge,a,pn	%xcc,	loop_2535
	udiv	%o3,	0x0DC4,	%o0
	fbug	%fcc3,	loop_2536
	movl	%icc,	%i0,	%g7
loop_2535:
	edge32ln	%l5,	%l1,	%i5
	fble,a	%fcc3,	loop_2537
loop_2536:
	bshuffle	%f26,	%f2,	%f18
	orncc	%i7,	%g1,	%l6
	brnz,a	%g5,	loop_2538
loop_2537:
	umul	%l4,	%g4,	%o4
	fornot2	%f12,	%f16,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2538:
	fbne,a	%fcc1,	loop_2539
	sll	%o5,	0x01,	%i4
	nop
	setx	loop_2540,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fandnot1s	%f29,	%f8,	%f13
loop_2539:
	movpos	%xcc,	%g3,	%i6
	taddcctv	%o2,	0x0A4D,	%o6
loop_2540:
	movrlez	%o1,	0x31D,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%l2,	0x04C0,	%o7
	bl,pn	%xcc,	loop_2541
	sub	%l3,	%g6,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i1,	0x185,	%i2
loop_2541:
	movge	%xcc,	%g2,	%o3
	fpadd16	%f26,	%f6,	%f30
	membar	0x52
	edge8	%o0,	%i0,	%l5
	tle	%xcc,	0x1
	array8	%l1,	%g7,	%i7
	movleu	%icc,	%i5,	%l6
	movn	%xcc,	%g5,	%g1
	andncc	%l4,	%o4,	%g4
	brnz	%i4,	loop_2542
	stw	%g3,	[%l7 + 0x40]
	umulcc	%o5,	%o2,	%o6
	srlx	%i6,	0x01,	%i3
loop_2542:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l2,	%o7,	%l3
	tcc	%icc,	0x5
	ld	[%l7 + 0x30],	%f15
	array32	%g6,	%l0,	%i1
	fornot2	%f2,	%f24,	%f24
	sdivx	%o1,	0x0FCB,	%i2
	umulcc	%g2,	%o3,	%o0
	tl	%xcc,	0x6
	movleu	%xcc,	%i0,	%l1
	fbn	%fcc1,	loop_2543
	fcmped	%fcc0,	%f18,	%f26
	alignaddr	%l5,	%g7,	%i5
	move	%icc,	%i7,	%g5
loop_2543:
	fnot1	%f0,	%f22
	bg,a	%icc,	loop_2544
	stb	%g1,	[%l7 + 0x28]
	tne	%icc,	0x7
	bvs,pn	%icc,	loop_2545
loop_2544:
	movle	%icc,	%l4,	%o4
	tvc	%icc,	0x5
	bcs	%icc,	loop_2546
loop_2545:
	ldsw	[%l7 + 0x58],	%l6
	tn	%icc,	0x4
	mulx	%i4,	%g3,	%g4
loop_2546:
	nop
	setx loop_2547, %l0, %l1
	jmpl %l1, %o2
	fble,a	%fcc2,	loop_2548
	ba,a	loop_2549
	movl	%icc,	%o5,	%i6
loop_2547:
	fmovdcs	%icc,	%f19,	%f11
loop_2548:
	be,a,pt	%icc,	loop_2550
loop_2549:
	mulscc	%o6,	%i3,	%l2
	brnz,a	%l3,	loop_2551
	fcmpne32	%f8,	%f20,	%g6
loop_2550:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x7C] %asi,	%o7
loop_2551:
	edge16	%i1,	%l0,	%i2
	fbg,a	%fcc3,	loop_2552
	brlez,a	%g2,	loop_2553
	ldd	[%l7 + 0x08],	%o0
	sub	%o0,	%o3,	%i0
loop_2552:
	edge8l	%l5,	%g7,	%i5
loop_2553:
	movpos	%icc,	%l1,	%i7
	and	%g5,	%g1,	%l4
	taddcc	%o4,	0x1814,	%l6
	udivx	%i4,	0x0D42,	%g4
	tvs	%icc,	0x6
	ta	%icc,	0x0
	umulcc	%o2,	%o5,	%g3
	brlz	%i6,	loop_2554
	srl	%i3,	%o6,	%l3
	movrgez	%l2,	0x2F2,	%o7
	fxor	%f18,	%f6,	%f0
loop_2554:
	fmovdcs	%icc,	%f25,	%f17
	tn	%icc,	0x1
	umulcc	%i1,	%g6,	%l0
	fand	%f26,	%f16,	%f16
	sethi	0x0DAE,	%i2
	movrlz	%g2,	0x04D,	%o0
	ld	[%l7 + 0x44],	%f4
	alignaddrl	%o3,	%o1,	%l5
	fbne	%fcc1,	loop_2555
	fmovsvc	%icc,	%f14,	%f21
	fpsub32s	%f19,	%f21,	%f21
	tcc	%xcc,	0x7
loop_2555:
	fmul8ulx16	%f18,	%f12,	%f4
	fpack16	%f16,	%f10
	fbn	%fcc2,	loop_2556
	subccc	%i0,	%g7,	%l1
	bvc,pt	%icc,	loop_2557
	udiv	%i7,	0x1D53,	%i5
loop_2556:
	brz,a	%g1,	loop_2558
	fblg	%fcc3,	loop_2559
loop_2557:
	std	%g4,	[%l7 + 0x70]
	lduh	[%l7 + 0x3E],	%o4
loop_2558:
	edge16ln	%l6,	%l4,	%g4
loop_2559:
	fexpand	%f19,	%f18
	srlx	%o2,	%i4,	%g3
	fmovsn	%icc,	%f4,	%f9
	edge16n	%i6,	%i3,	%o5
	subccc	%o6,	%l2,	%l3
	fbo	%fcc0,	loop_2560
	bcc,pt	%icc,	loop_2561
	andcc	%i1,	%o7,	%g6
	fornot1	%f10,	%f4,	%f8
loop_2560:
	smul	%i2,	%l0,	%o0
loop_2561:
	ldx	[%l7 + 0x10],	%o3
	sdiv	%g2,	0x142F,	%o1
	popc	0x1927,	%i0
	smulcc	%l5,	%g7,	%l1
	movge	%icc,	%i5,	%g1
	tgu	%xcc,	0x5
	sir	0x04E9
	sth	%i7,	[%l7 + 0x60]
	edge16ln	%g5,	%o4,	%l6
	fmovdg	%xcc,	%f12,	%f20
	fmovs	%f11,	%f5
	bvs	%xcc,	loop_2562
	tvc	%xcc,	0x0
	array8	%l4,	%g4,	%i4
	edge16	%g3,	%o2,	%i3
loop_2562:
	sub	%i6,	%o6,	%o5
	move	%icc,	%l3,	%i1
	sdiv	%l2,	0x07EA,	%o7
	edge16n	%g6,	%l0,	%i2
	fmovrse	%o0,	%f14,	%f31
	edge8ln	%g2,	%o3,	%o1
	movcc	%xcc,	%i0,	%l5
	array32	%l1,	%g7,	%g1
	sra	%i5,	0x15,	%i7
	brgez	%g5,	loop_2563
	fpack16	%f14,	%f21
	fble	%fcc1,	loop_2564
	movcs	%icc,	%l6,	%l4
loop_2563:
	taddcctv	%o4,	%g4,	%g3
	ldsw	[%l7 + 0x20],	%i4
loop_2564:
	movneg	%icc,	%o2,	%i6
	edge16	%i3,	%o6,	%o5
	for	%f12,	%f14,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i1,	%l2,	%o7
	fmovsge	%icc,	%f7,	%f31
	umulcc	%l3,	0x0BD0,	%l0
	bn,pt	%xcc,	loop_2565
	edge32	%i2,	%g6,	%o0
	set	0x27, %l2
	ldsba	[%l7 + %l2] 0x81,	%g2
loop_2565:
	ld	[%l7 + 0x20],	%f3
	fbo,a	%fcc0,	loop_2566
	fors	%f0,	%f19,	%f10
	movg	%xcc,	%o1,	%o3
	taddcc	%i0,	%l5,	%l1
loop_2566:
	fmovdg	%xcc,	%f27,	%f1
	wr	%g0,	0x5f,	%asi
	stxa	%g7,	[%g0 + 0x0] %asi
	xnor	%g1,	0x07F6,	%i7
	ldd	[%l7 + 0x68],	%f10
	fmovdvc	%icc,	%f30,	%f26
	mulscc	%g5,	%i5,	%l6
	xor	%o4,	0x0F53,	%g4
	srlx	%g3,	%l4,	%o2
	set	0x48, %o6
	sta	%f12,	[%l7 + %o6] 0x88
	fmovs	%f2,	%f25
	set	0x57, %g7
	lduba	[%l7 + %g7] 0x19,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f2,	%f1
	movrgez	%i3,	%i4,	%o5
	brgz,a	%o6,	loop_2567
	orcc	%l2,	%o7,	%i1
	fmovd	%f16,	%f10
	tl	%xcc,	0x7
loop_2567:
	edge32n	%l3,	%l0,	%i2
	movrne	%o0,	0x3CE,	%g2
	bneg,pn	%icc,	loop_2568
	mova	%xcc,	%g6,	%o3
	fmovd	%f22,	%f22
	nop
	setx	loop_2569,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2568:
	or	%o1,	%i0,	%l5
	sdivx	%g7,	0x18E5,	%g1
	movre	%i7,	0x287,	%l1
loop_2569:
	fmovdl	%icc,	%f23,	%f30
	set	0x3D, %i0
	ldsba	[%l7 + %i0] 0x15,	%g5
	wr	%g0,	0x2b,	%asi
	stba	%l6,	[%l7 + 0x69] %asi
	membar	#Sync
	bcc	%icc,	loop_2570
	taddcctv	%o4,	%g4,	%g3
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x54] %asi,	%i5
loop_2570:
	alignaddrl	%l4,	%i6,	%o2
	fmovsvc	%icc,	%f16,	%f3
	smul	%i3,	0x1224,	%o5
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	umul	%l2,	0x1CD7,	%i4
	fble	%fcc1,	loop_2571
	umul	%o7,	%l3,	%l0
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x18
loop_2571:
	fsrc2s	%f0,	%f4
	be	%xcc,	loop_2572
	andn	%i1,	0x14B5,	%i2
	ldsb	[%l7 + 0x09],	%g2
	xnorcc	%o0,	0x1429,	%o3
loop_2572:
	fbl,a	%fcc1,	loop_2573
	movrgz	%g6,	%i0,	%l5
	tleu	%icc,	0x1
	tgu	%icc,	0x4
loop_2573:
	fcmple16	%f26,	%f30,	%g7
	sdiv	%o1,	0x1BA8,	%g1
	nop
	setx	loop_2574,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmps	%fcc0,	%f4,	%f29
	alignaddr	%i7,	%l1,	%g5
	udivx	%l6,	0x06FE,	%g4
loop_2574:
	edge32ln	%o4,	%g3,	%l4
	edge32ln	%i6,	%o2,	%i3
	mulscc	%o5,	0x1628,	%o6
	fba,a	%fcc3,	loop_2575
	sra	%l2,	%i4,	%o7
	xnor	%i5,	0x181A,	%l3
	array16	%i1,	%l0,	%i2
loop_2575:
	sdiv	%g2,	0x1610,	%o0
	tvs	%xcc,	0x6
	sethi	0x18B5,	%o3
	stbar
	move	%xcc,	%i0,	%g6
	nop
	set	0x2C, %l5
	ldsw	[%l7 + %l5],	%l5
	fmovscs	%icc,	%f13,	%f25
	tvs	%icc,	0x4
	edge32ln	%o1,	%g7,	%g1
	ble,a,pt	%icc,	loop_2576
	addcc	%i7,	0x1898,	%g5
	and	%l1,	0x16B2,	%l6
	fmovdpos	%xcc,	%f25,	%f29
loop_2576:
	tvs	%xcc,	0x4
	edge16n	%o4,	%g4,	%l4
	set	0x70, %l1
	ldda	[%l7 + %l1] 0x19,	%i6
	and	%o2,	0x1396,	%g3
	edge32l	%i3,	%o5,	%o6
	fcmple32	%f24,	%f12,	%i4
	orcc	%l2,	0x0FB8,	%o7
	set	0x60, %o2
	lduwa	[%l7 + %o2] 0x11,	%i5
	tn	%xcc,	0x0
	sdiv	%l3,	0x1076,	%i1
	movleu	%xcc,	%l0,	%i2
	tle	%icc,	0x6
	tle	%icc,	0x7
	sdiv	%o0,	0x0AAD,	%g2
	taddcctv	%i0,	%g6,	%o3
	fbul	%fcc3,	loop_2577
	array32	%o1,	%g7,	%g1
	tleu	%xcc,	0x3
	tcs	%xcc,	0x1
loop_2577:
	bneg,a	loop_2578
	movrlz	%l5,	0x241,	%g5
	move	%xcc,	%i7,	%l6
	popc	%l1,	%g4
loop_2578:
	ldsb	[%l7 + 0x37],	%l4
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x58] %asi,	%i6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x74] %asi,	%o4
	fnand	%f22,	%f6,	%f28
	fbe,a	%fcc3,	loop_2579
	ld	[%l7 + 0x58],	%f14
	move	%icc,	%g3,	%o2
	mulx	%i3,	%o6,	%i4
loop_2579:
	nop
	setx loop_2580, %l0, %l1
	jmpl %l1, %o5
	tleu	%icc,	0x1
	mulscc	%l2,	0x06EA,	%i5
	ldd	[%l7 + 0x78],	%o6
loop_2580:
	edge16	%i1,	%l0,	%i2
	fbo	%fcc1,	loop_2581
	bcs,a,pt	%xcc,	loop_2582
	addccc	%l3,	%g2,	%o0
	fnor	%f20,	%f6,	%f26
loop_2581:
	fbug	%fcc3,	loop_2583
loop_2582:
	movpos	%icc,	%g6,	%i0
	ldd	[%l7 + 0x70],	%f28
	tpos	%icc,	0x1
loop_2583:
	tge	%xcc,	0x1
	tgu	%icc,	0x2
	popc	%o1,	%g7
	orn	%o3,	%l5,	%g5
	xor	%g1,	0x179F,	%i7
	srax	%l6,	0x05,	%l1
	movvc	%icc,	%g4,	%l4
	movl	%xcc,	%o4,	%i6
	ldsb	[%l7 + 0x37],	%g3
	popc	0x18C6,	%i3
	ldsw	[%l7 + 0x4C],	%o6
	subccc	%i4,	0x1CF4,	%o2
	sir	0x10CE
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f24,	%f4,	%f16
	sdivx	%o5,	0x0077,	%l2
	tvc	%icc,	0x6
	fmul8sux16	%f14,	%f0,	%f30
	fnor	%f18,	%f2,	%f10
	bneg,a	loop_2584
	edge16l	%i5,	%o7,	%l0
	array16	%i2,	%i1,	%l3
	tsubcc	%g2,	%o0,	%g6
loop_2584:
	taddcctv	%i0,	0x0352,	%o1
	sdivx	%o3,	0x01BE,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f12,	%f26,	%f24
	movrlz	%g5,	0x2CC,	%g7
	fmovscs	%icc,	%f28,	%f5
	edge8ln	%g1,	%l6,	%l1
	edge8	%i7,	%l4,	%o4
	movre	%g4,	0x35B,	%g3
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i6,	%i3
	ldsb	[%l7 + 0x2A],	%i4
	sllx	%o6,	%o5,	%o2
	fnot2s	%f29,	%f7
	udiv	%l2,	0x118F,	%o7
	ldx	[%l7 + 0x08],	%l0
	fmovdpos	%icc,	%f3,	%f19
	fmovrdgz	%i5,	%f26,	%f30
	set	0x30, %g1
	stwa	%i2,	[%l7 + %g1] 0x81
	brgz,a	%i1,	loop_2585
	tg	%icc,	0x1
	fornot2	%f12,	%f14,	%f26
	edge32n	%g2,	%o0,	%l3
loop_2585:
	add	%i0,	%o1,	%g6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5F] %asi,	%l5
	add	%g5,	%o3,	%g7
	movle	%xcc,	%g1,	%l6
	xorcc	%i7,	%l4,	%o4
	fmovse	%xcc,	%f1,	%f14
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] %asi,	%g4,	%l1
	set	0x1B, %i7
	stba	%g3,	[%l7 + %i7] 0xeb
	membar	#Sync
	be,a,pn	%xcc,	loop_2586
	fornot2s	%f21,	%f26,	%f21
	movneg	%icc,	%i6,	%i3
	fmovsl	%icc,	%f11,	%f2
loop_2586:
	fmovda	%xcc,	%f7,	%f10
	fcmped	%fcc3,	%f14,	%f22
	fmovdle	%xcc,	%f30,	%f16
	set	0x5E, %o5
	ldsha	[%l7 + %o5] 0x80,	%i4
	fba	%fcc2,	loop_2587
	fand	%f4,	%f16,	%f24
	tvc	%icc,	0x5
	swap	[%l7 + 0x44],	%o6
loop_2587:
	fbu,a	%fcc3,	loop_2588
	fcmpd	%fcc3,	%f2,	%f20
	movleu	%icc,	%o5,	%l2
	addc	%o2,	%o7,	%l0
loop_2588:
	fmovrdlz	%i2,	%f22,	%f14
	brlez	%i1,	loop_2589
	popc	0x0E35,	%g2
	tvs	%icc,	0x2
	fornot2	%f2,	%f2,	%f24
loop_2589:
	subc	%o0,	0x1E54,	%l3
	fmovdcs	%xcc,	%f3,	%f18
	sllx	%i5,	%o1,	%g6
	mulx	%l5,	%i0,	%o3
	sub	%g7,	%g5,	%l6
	movne	%icc,	%g1,	%l4
	fxnor	%f20,	%f4,	%f30
	subcc	%i7,	0x0144,	%g4
	bcs	%xcc,	loop_2590
	edge16n	%o4,	%g3,	%i6
	movge	%xcc,	%l1,	%i3
	edge16ln	%i4,	%o6,	%o5
loop_2590:
	orcc	%l2,	%o2,	%l0
	ble,a,pt	%xcc,	loop_2591
	nop
	set	0x4E, %o3
	sth	%i2,	[%l7 + %o3]
	movrgz	%i1,	0x12C,	%o7
	alignaddrl	%g2,	%l3,	%o0
loop_2591:
	swap	[%l7 + 0x50],	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn	%fcc1,	loop_2592
	fnors	%f22,	%f1,	%f21
	te	%xcc,	0x5
	tvc	%xcc,	0x4
loop_2592:
	movpos	%xcc,	%g6,	%i5
	nop
	setx	loop_2593,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	popc	0x0C71,	%i0
	edge8ln	%o3,	%l5,	%g5
	udivx	%g7,	0x012F,	%l6
loop_2593:
	tcc	%icc,	0x4
	fpadd16	%f24,	%f30,	%f18
	subccc	%g1,	%i7,	%l4
	bne,a,pn	%icc,	loop_2594
	call	loop_2595
	orncc	%o4,	%g4,	%i6
	andcc	%l1,	0x193A,	%g3
loop_2594:
	fmovsa	%icc,	%f5,	%f23
loop_2595:
	bcc,a	loop_2596
	bg	loop_2597
	movneg	%xcc,	%i3,	%o6
	fmovsge	%xcc,	%f17,	%f11
loop_2596:
	xorcc	%i4,	%l2,	%o5
loop_2597:
	fmovrsgez	%l0,	%f11,	%f19
	call	loop_2598
	mova	%xcc,	%o2,	%i1
	addccc	%i2,	0x1740,	%o7
	umul	%g2,	0x07F8,	%l3
loop_2598:
	fbule,a	%fcc3,	loop_2599
	fmul8ulx16	%f2,	%f30,	%f14
	tle	%icc,	0x7
	orcc	%o0,	0x09D3,	%g6
loop_2599:
	fmovdneg	%xcc,	%f13,	%f15
	edge8l	%o1,	%i0,	%i5
	xor	%l5,	%o3,	%g5
	edge16l	%l6,	%g1,	%i7
	or	%g7,	0x00D5,	%l4
	fmovsle	%xcc,	%f12,	%f3
	xnorcc	%g4,	0x079A,	%i6
	fbuge	%fcc1,	loop_2600
	edge32ln	%l1,	%g3,	%o4
	faligndata	%f14,	%f2,	%f28
	ldsh	[%l7 + 0x42],	%i3
loop_2600:
	edge32n	%o6,	%l2,	%o5
	brlez	%l0,	loop_2601
	tpos	%icc,	0x4
	edge8	%i4,	%o2,	%i2
	xor	%o7,	%g2,	%l3
loop_2601:
	orncc	%o0,	0x05E7,	%g6
	addcc	%i1,	0x0C03,	%o1
	bge	%xcc,	loop_2602
	array8	%i0,	%i5,	%l5
	movgu	%icc,	%g5,	%o3
	ta	%icc,	0x1
loop_2602:
	fmovscs	%xcc,	%f7,	%f27
	ldub	[%l7 + 0x79],	%g1
	sethi	0x0F80,	%i7
	tl	%xcc,	0x6
	subccc	%l6,	%g7,	%g4
	addcc	%l4,	0x1654,	%l1
	edge16l	%g3,	%i6,	%o4
	xnor	%i3,	0x0900,	%o6
	udivx	%l2,	0x1010,	%o5
	faligndata	%f8,	%f8,	%f28
	set	0x2E, %i5
	ldsha	[%l7 + %i5] 0x04,	%i4
	st	%f26,	[%l7 + 0x0C]
	movrgez	%o2,	%l0,	%o7
	taddcctv	%g2,	%i2,	%o0
	ldsw	[%l7 + 0x0C],	%g6
	flush	%l7 + 0x70
	fmovdpos	%xcc,	%f1,	%f7
	fones	%f2
	movpos	%xcc,	%l3,	%o1
	umulcc	%i0,	%i1,	%l5
	andncc	%i5,	%o3,	%g5
	movre	%g1,	0x34B,	%i7
	movvc	%icc,	%l6,	%g7
	sth	%l4,	[%l7 + 0x54]
	movne	%icc,	%l1,	%g3
	movpos	%icc,	%i6,	%o4
	ta	%icc,	0x2
	movneg	%xcc,	%i3,	%o6
	smul	%l2,	0x1228,	%o5
	taddcc	%g4,	%o2,	%i4
	bcs,a,pt	%xcc,	loop_2603
	fmovdl	%xcc,	%f25,	%f5
	sub	%o7,	0x1D40,	%g2
	subccc	%i2,	0x117A,	%l0
loop_2603:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] %asi,	%o0,	%g6
	fornot2s	%f27,	%f4,	%f15
	bcs,a	%xcc,	loop_2604
	orncc	%l3,	%i0,	%i1
	movle	%icc,	%o1,	%l5
	fornot1s	%f17,	%f30,	%f29
loop_2604:
	brz,a	%o3,	loop_2605
	edge8l	%i5,	%g5,	%g1
	movleu	%icc,	%l6,	%g7
	fbue	%fcc3,	loop_2606
loop_2605:
	srax	%l4,	%i7,	%g3
	fble	%fcc2,	loop_2607
	edge16ln	%i6,	%o4,	%l1
loop_2606:
	fmul8x16	%f10,	%f14,	%f20
	sdivcc	%i3,	0x178F,	%o6
loop_2607:
	fnands	%f13,	%f16,	%f4
	brgez,a	%l2,	loop_2608
	tge	%icc,	0x6
	movrgez	%o5,	0x391,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2608:
	bcs,pt	%xcc,	loop_2609
	or	%i4,	0x0DEA,	%o7
	fbl	%fcc2,	loop_2610
	subc	%o2,	0x14A3,	%g2
loop_2609:
	sllx	%l0,	%i2,	%o0
	alignaddrl	%g6,	%i0,	%l3
loop_2610:
	nop
	wr	%g0,	0x81,	%asi
	stha	%o1,	[%l7 + 0x48] %asi
	movrlz	%l5,	%i1,	%i5
	fmovsn	%icc,	%f7,	%f0
	addc	%o3,	%g5,	%g1
	srlx	%l6,	%g7,	%l4
	fbug,a	%fcc0,	loop_2611
	edge8ln	%i7,	%i6,	%g3
	fmovrse	%l1,	%f27,	%f29
	movn	%icc,	%i3,	%o6
loop_2611:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l2,	0x1FE1,	%o4
	fcmpne16	%f18,	%f10,	%g4
	srl	%o5,	0x00,	%i4
	fpmerge	%f20,	%f21,	%f10
	array32	%o2,	%g2,	%o7
	orn	%i2,	0x0E38,	%o0
	fmovsgu	%icc,	%f14,	%f23
	fbul,a	%fcc0,	loop_2612
	udivx	%g6,	0x03F9,	%l0
	edge8l	%l3,	%i0,	%l5
	fcmpd	%fcc1,	%f12,	%f20
loop_2612:
	orncc	%o1,	%i5,	%i1
	wr	%g0,	0x80,	%asi
	sta	%f30,	[%l7 + 0x40] %asi
	tl	%icc,	0x0
	fnot2s	%f21,	%f31
	wr	%g0,	0x89,	%asi
	stha	%o3,	[%l7 + 0x0A] %asi
	fpack32	%f18,	%f2,	%f20
	addc	%g5,	%g1,	%g7
	xnorcc	%l4,	0x1DAF,	%l6
	fmovrdne	%i6,	%f18,	%f2
	orncc	%i7,	0x02A6,	%g3
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l1,	%o6
	brlez	%l2,	loop_2613
	movg	%icc,	%i3,	%g4
	bgu,a	%xcc,	loop_2614
	popc	%o4,	%o5
loop_2613:
	alignaddrl	%o2,	%g2,	%i4
	fpsub32s	%f13,	%f3,	%f11
loop_2614:
	addcc	%i2,	%o7,	%g6
	srl	%o0,	0x1C,	%l3
	movge	%xcc,	%l0,	%l5
	tpos	%icc,	0x1
	orn	%o1,	0x1C5A,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i0,	0x1101,	%o3
	xnorcc	%i1,	0x0035,	%g5
	tvc	%xcc,	0x7
	sdiv	%g1,	0x075A,	%l4
	wr	%g0,	0xe2,	%asi
	stba	%g7,	[%l7 + 0x5C] %asi
	membar	#Sync
	fmovsg	%icc,	%f4,	%f23
	xorcc	%l6,	%i7,	%i6
	fmul8x16al	%f12,	%f28,	%f24
	fnot1	%f10,	%f10
	mulscc	%g3,	%o6,	%l1
	fpadd16s	%f26,	%f21,	%f24
	addcc	%i3,	%g4,	%o4
	srax	%o5,	%o2,	%g2
	mova	%icc,	%i4,	%l2
	tgu	%xcc,	0x6
	edge16l	%i2,	%o7,	%o0
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x30] %asi,	%f11
	fzeros	%f30
	orcc	%g6,	0x1061,	%l0
	tpos	%icc,	0x6
	andn	%l5,	0x0D48,	%l3
	sdiv	%i5,	0x1D8E,	%o1
	bpos,a	%xcc,	loop_2615
	nop
	setx loop_2616, %l0, %l1
	jmpl %l1, %i0
	movl	%icc,	%o3,	%i1
	orncc	%g1,	%l4,	%g5
loop_2615:
	bvs,pt	%icc,	loop_2617
loop_2616:
	andcc	%g7,	%i7,	%i6
	movre	%g3,	0x338,	%o6
	tsubcctv	%l6,	%l1,	%i3
loop_2617:
	fpadd32s	%f18,	%f26,	%f7
	fnot1	%f8,	%f10
	fand	%f2,	%f14,	%f10
	edge8	%g4,	%o5,	%o2
	bcs	%xcc,	loop_2618
	movcc	%xcc,	%g2,	%i4
	fbge,a	%fcc0,	loop_2619
	fxors	%f20,	%f19,	%f15
loop_2618:
	movl	%xcc,	%o4,	%l2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x64] %asi,	%o7
loop_2619:
	xor	%o0,	%i2,	%l0
	sethi	0x0F89,	%l5
	umul	%l3,	0x12E8,	%g6
	bneg,a	loop_2620
	fmuld8ulx16	%f26,	%f11,	%f26
	edge16	%i5,	%i0,	%o3
	fblg,a	%fcc3,	loop_2621
loop_2620:
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
	sdivcc	%o1,	0x1B70,	%i1
	bgu,a,pt	%icc,	loop_2623
loop_2621:
	movcc	%icc,	%l4,	%g1
loop_2622:
	fsrc2s	%f24,	%f26
	sra	%g7,	0x1F,	%g5
loop_2623:
	smul	%i6,	0x03AA,	%i7
	be,a	%xcc,	loop_2624
	stb	%g3,	[%l7 + 0x5D]
	fba,a	%fcc0,	loop_2625
	membar	0x50
loop_2624:
	movg	%icc,	%l6,	%o6
	fmovsgu	%icc,	%f28,	%f4
loop_2625:
	sdivcc	%i3,	0x0CC4,	%g4
	xnorcc	%l1,	%o5,	%g2
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x54] %asi,	%i4
	fmovs	%f21,	%f27
	movre	%o4,	%o2,	%l2
	edge16l	%o7,	%i2,	%l0
	umulcc	%l5,	%l3,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g6,	0x220,	%i0
	pdist	%f2,	%f2,	%f8
	fmovdne	%xcc,	%f0,	%f21
	array32	%o3,	%o1,	%i5
	fmovd	%f0,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f27,	%f12,	%f19
	sdivcc	%l4,	0x10B6,	%i1
	tg	%xcc,	0x2
	fmovsn	%xcc,	%f18,	%f10
	fpadd16	%f10,	%f0,	%f10
	tvc	%icc,	0x7
	tne	%icc,	0x4
	addc	%g7,	0x04EE,	%g5
	mulx	%g1,	0x1B38,	%i7
	fmovse	%xcc,	%f30,	%f23
	fnands	%f2,	%f9,	%f19
	fpsub32	%f24,	%f18,	%f8
	mulscc	%g3,	0x0958,	%l6
	ble	%icc,	loop_2626
	for	%f28,	%f20,	%f16
	bgu,a,pn	%icc,	loop_2627
	bneg,a,pn	%xcc,	loop_2628
loop_2626:
	mova	%xcc,	%o6,	%i3
	movle	%icc,	%i6,	%g4
loop_2627:
	brz,a	%l1,	loop_2629
loop_2628:
	swap	[%l7 + 0x40],	%o5
	mulscc	%g2,	%o4,	%o2
	tvs	%icc,	0x3
loop_2629:
	edge32l	%i4,	%o7,	%l2
	umul	%i2,	%l5,	%l0
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x50] %asi,	%o0
	movneg	%xcc,	%l3,	%i0
	brnz,a	%g6,	loop_2630
	lduw	[%l7 + 0x74],	%o3
	wr	%g0,	0x88,	%asi
	sta	%f4,	[%l7 + 0x60] %asi
loop_2630:
	edge32	%i5,	%o1,	%i1
	movn	%xcc,	%l4,	%g5
	fornot2	%f28,	%f24,	%f12
	orncc	%g7,	0x11E3,	%g1
	sethi	0x0E94,	%i7
	bn,a	loop_2631
	fandnot2	%f22,	%f0,	%f22
	swap	[%l7 + 0x54],	%g3
	brgez	%l6,	loop_2632
loop_2631:
	smul	%o6,	%i6,	%i3
	fpsub16s	%f2,	%f18,	%f13
	movleu	%icc,	%l1,	%o5
loop_2632:
	fands	%f21,	%f30,	%f21
	brz,a	%g4,	loop_2633
	tpos	%icc,	0x7
	fbn,a	%fcc0,	loop_2634
	movcc	%icc,	%g2,	%o2
loop_2633:
	edge32	%o4,	%i4,	%l2
	movcs	%icc,	%o7,	%i2
loop_2634:
	edge16l	%l5,	%o0,	%l0
	popc	%l3,	%g6
	bpos	%xcc,	loop_2635
	ta	%xcc,	0x5
	andn	%i0,	0x01DB,	%o3
	edge32l	%o1,	%i1,	%i5
loop_2635:
	alignaddr	%l4,	%g7,	%g1
	lduh	[%l7 + 0x1A],	%g5
	sir	0x187E
	movrgez	%i7,	0x2CE,	%l6
	fcmple32	%f16,	%f2,	%g3
	sdivx	%o6,	0x184E,	%i3
	fmovdcc	%icc,	%f20,	%f31
	sdivx	%i6,	0x0ED4,	%l1
	udivcc	%g4,	0x021F,	%o5
	srl	%g2,	0x00,	%o2
	sethi	0x0F81,	%o4
	call	loop_2636
	ble,a	loop_2637
	edge8ln	%i4,	%l2,	%i2
	orcc	%o7,	%o0,	%l0
loop_2636:
	udivcc	%l3,	0x0364,	%l5
loop_2637:
	fmovdpos	%icc,	%f29,	%f14
	movne	%xcc,	%g6,	%i0
	subc	%o1,	0x09DB,	%o3
	fbo	%fcc3,	loop_2638
	alignaddr	%i5,	%i1,	%g7
	stb	%g1,	[%l7 + 0x1C]
	mulx	%l4,	%i7,	%l6
loop_2638:
	nop
	wr	%g0,	0x10,	%asi
	stda	%g2,	[%l7 + 0x20] %asi
	sdivx	%g5,	0x1F19,	%i3
	fmovsleu	%icc,	%f7,	%f14
	tne	%xcc,	0x2
	srax	%o6,	0x0A,	%l1
	movvc	%icc,	%i6,	%g4
	be,a,pn	%xcc,	loop_2639
	udivcc	%o5,	0x1E03,	%g2
	srax	%o4,	%o2,	%i4
	tl	%icc,	0x5
loop_2639:
	fmovrde	%i2,	%f8,	%f0
	movcc	%icc,	%l2,	%o0
	stbar
	fmovsgu	%icc,	%f18,	%f3
	tpos	%icc,	0x1
	fmovrslz	%l0,	%f11,	%f25
	edge8n	%o7,	%l5,	%l3
	xnorcc	%g6,	0x1FBF,	%o1
	taddcctv	%i0,	%i5,	%o3
	array16	%i1,	%g7,	%l4
	brgz,a	%g1,	loop_2640
	fbg	%fcc3,	loop_2641
	fmovdn	%icc,	%f11,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2640:
	movrlez	%i7,	0x381,	%l6
loop_2641:
	fcmpne32	%f16,	%f2,	%g3
	sdivcc	%i3,	0x0D7F,	%o6
	xnor	%g5,	0x1316,	%i6
	wr	%g0,	0x04,	%asi
	stwa	%l1,	[%l7 + 0x08] %asi
	subc	%o5,	0x1D3E,	%g2
	fmuld8ulx16	%f29,	%f19,	%f16
	fsrc1s	%f22,	%f30
	and	%o4,	0x03D2,	%o2
	bcs	loop_2642
	edge8n	%g4,	%i4,	%l2
	andn	%i2,	0x0270,	%o0
	ble,pn	%xcc,	loop_2643
loop_2642:
	andcc	%o7,	%l5,	%l0
	brlz	%l3,	loop_2644
	fbo,a	%fcc0,	loop_2645
loop_2643:
	ldsw	[%l7 + 0x3C],	%o1
	edge8l	%g6,	%i5,	%o3
loop_2644:
	tne	%icc,	0x7
loop_2645:
	movge	%xcc,	%i0,	%i1
	add	%g7,	0x0320,	%l4
	andncc	%i7,	%g1,	%g3
	tleu	%xcc,	0x2
	edge8	%i3,	%l6,	%g5
	fmovscs	%xcc,	%f10,	%f27
	bcc,a	%icc,	loop_2646
	fmovdcc	%xcc,	%f26,	%f25
	stbar
	fbul,a	%fcc0,	loop_2647
loop_2646:
	fpadd16	%f8,	%f24,	%f26
	tvs	%icc,	0x4
	tge	%icc,	0x1
loop_2647:
	subcc	%i6,	%l1,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g2,	%o5,	%o4
	fmovrsgz	%o2,	%f27,	%f3
	movvs	%icc,	%g4,	%l2
	xnorcc	%i2,	0x1423,	%o0
	nop
	setx loop_2648, %l0, %l1
	jmpl %l1, %o7
	array8	%l5,	%l0,	%i4
	fbule,a	%fcc2,	loop_2649
	tne	%xcc,	0x6
loop_2648:
	ld	[%l7 + 0x34],	%f25
	sdivcc	%l3,	0x15C4,	%g6
loop_2649:
	fcmpgt16	%f28,	%f24,	%o1
	orcc	%i5,	0x0EA5,	%o3
	tle	%xcc,	0x6
	orcc	%i1,	0x0467,	%g7
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x50] %asi,	%l4
	membar	0x45
	bge,a	loop_2650
	fmovrsgz	%i7,	%f4,	%f30
	tcc	%xcc,	0x5
	fcmpes	%fcc3,	%f4,	%f19
loop_2650:
	fmovdne	%icc,	%f20,	%f9
	addc	%g1,	0x196A,	%g3
	fmovscc	%xcc,	%f9,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x7
	movrlz	%i3,	0x0E9,	%l6
	fmovdl	%icc,	%f15,	%f25
	sra	%g5,	%i6,	%i0
	edge16n	%l1,	%g2,	%o5
	movle	%icc,	%o4,	%o2
	orncc	%o6,	%g4,	%l2
	tgu	%xcc,	0x0
	subcc	%i2,	%o7,	%o0
	fpmerge	%f30,	%f15,	%f16
	edge8ln	%l0,	%i4,	%l5
	te	%icc,	0x5
	fcmpgt32	%f22,	%f8,	%l3
	tpos	%xcc,	0x2
	fornot1s	%f10,	%f25,	%f22
	andcc	%g6,	%o1,	%o3
	edge16ln	%i5,	%g7,	%i1
	edge8	%i7,	%l4,	%g1
	orcc	%g3,	%l6,	%i3
	fbn,a	%fcc3,	loop_2651
	te	%icc,	0x7
	fmovrdlez	%i6,	%f30,	%f12
	array8	%g5,	%i0,	%l1
loop_2651:
	alignaddrl	%o5,	%o4,	%o2
	edge8ln	%g2,	%o6,	%l2
	fpackfix	%f28,	%f5
	addccc	%g4,	%o7,	%i2
	fpackfix	%f22,	%f25
	fmovrsgez	%o0,	%f8,	%f14
	umul	%l0,	0x0727,	%i4
	taddcc	%l5,	%g6,	%o1
	mulscc	%l3,	0x10AD,	%i5
	set	0x16, %g2
	ldsba	[%l7 + %g2] 0x81,	%g7
	fornot1s	%f24,	%f30,	%f8
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o3
	edge16	%i1,	%i7,	%g1
	edge32l	%g3,	%l6,	%i3
	tsubcctv	%i6,	0x1B3B,	%g5
	srl	%i0,	0x1A,	%l1
	edge16ln	%o5,	%o4,	%l4
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%o2
	umulcc	%o6,	%l2,	%g4
	fmul8x16au	%f6,	%f7,	%f4
	movrgez	%o7,	0x11D,	%i2
	std	%o0,	[%l7 + 0x48]
	siam	0x6
	movrlz	%l0,	0x305,	%g2
	ldstub	[%l7 + 0x5C],	%l5
	fnor	%f28,	%f12,	%f22
	fors	%f14,	%f27,	%f0
	edge8l	%g6,	%o1,	%l3
	ldd	[%l7 + 0x30],	%i4
	fmovsne	%icc,	%f30,	%f4
	wr	%g0,	0x88,	%asi
	stha	%g7,	[%l7 + 0x40] %asi
	xor	%o3,	0x14B6,	%i5
	srlx	%i1,	0x04,	%i7
	orn	%g1,	0x128C,	%l6
	ld	[%l7 + 0x58],	%f11
	sethi	0x060B,	%g3
	fmovsgu	%xcc,	%f27,	%f4
	xnor	%i3,	%i6,	%i0
	srax	%g5,	0x0E,	%o5
	membar	0x23
	fmovs	%f15,	%f25
	smul	%o4,	%l1,	%o2
	nop
	setx loop_2652, %l0, %l1
	jmpl %l1, %l4
	ldub	[%l7 + 0x22],	%o6
	sll	%l2,	0x18,	%o7
	edge8n	%i2,	%g4,	%l0
loop_2652:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g2,	%l5,	%o0
	fmovdl	%xcc,	%f7,	%f9
	xnor	%o1,	0x0698,	%g6
	addc	%i4,	%g7,	%o3
	pdist	%f6,	%f24,	%f18
	set	0x44, %i4
	lda	[%l7 + %i4] 0x19,	%f4
	brlez	%i5,	loop_2653
	udiv	%l3,	0x1DCF,	%i7
	fmovsge	%icc,	%f11,	%f6
	ldsw	[%l7 + 0x5C],	%i1
loop_2653:
	nop
	set	0x34, %o0
	ldsba	[%l7 + %o0] 0x0c,	%g1
	fmovda	%xcc,	%f25,	%f30
	taddcctv	%g3,	%l6,	%i3
	movrlz	%i6,	%g5,	%o5
	edge16n	%o4,	%l1,	%i0
	nop
	setx	loop_2654,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fabss	%f25,	%f2
	udivcc	%o2,	0x0D46,	%l4
	srl	%l2,	0x17,	%o6
loop_2654:
	addcc	%i2,	%g4,	%l0
	movrlez	%g2,	0x22B,	%o7
	edge16l	%o0,	%o1,	%l5
	subccc	%i4,	0x1F37,	%g7
	fnegd	%f2,	%f4
	xorcc	%o3,	%g6,	%i5
	nop
	setx	loop_2655,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movneg	%icc,	%i7,	%l3
	mulscc	%i1,	0x0087,	%g1
	ldd	[%l7 + 0x08],	%f8
loop_2655:
	edge16l	%g3,	%i3,	%i6
	movre	%l6,	%o5,	%g5
	nop
	setx	loop_2656,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%o4,	%i0,	%l1
	srax	%l4,	%l2,	%o6
	and	%i2,	%o2,	%g4
loop_2656:
	edge8ln	%l0,	%g2,	%o7
	tvc	%icc,	0x4
	tcs	%xcc,	0x6
	fmovdge	%icc,	%f14,	%f31
	fpsub32s	%f22,	%f9,	%f28
	fmovsvs	%xcc,	%f20,	%f23
	orncc	%o0,	0x1568,	%o1
	lduw	[%l7 + 0x78],	%l5
	tsubcctv	%i4,	%g7,	%o3
	membar	0x14
	swap	[%l7 + 0x40],	%g6
	sub	%i7,	%l3,	%i5
	edge16l	%g1,	%g3,	%i1
	ldsh	[%l7 + 0x40],	%i6
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x70] %asi,	%f6
	edge8n	%i3,	%o5,	%l6
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x10
	tsubcctv	%o4,	0x0524,	%g5
	bvs,a,pn	%icc,	loop_2657
	fmovdpos	%xcc,	%f1,	%f4
	movle	%xcc,	%l1,	%l4
	fpsub32s	%f18,	%f6,	%f28
loop_2657:
	bshuffle	%f0,	%f18,	%f4
	fmovdneg	%icc,	%f23,	%f24
	brgez	%i0,	loop_2658
	fcmpgt16	%f0,	%f10,	%o6
	set	0x1D, %l0
	lduba	[%l7 + %l0] 0x04,	%i2
loop_2658:
	fcmpes	%fcc3,	%f20,	%f15
	brgez,a	%l2,	loop_2659
	fandnot2	%f10,	%f18,	%f16
	brnz	%g4,	loop_2660
	fornot2s	%f14,	%f19,	%f29
loop_2659:
	xnorcc	%o2,	%g2,	%l0
	fmovsle	%xcc,	%f28,	%f10
loop_2660:
	add	%o7,	%o0,	%l5
	bvs,pn	%icc,	loop_2661
	tcs	%xcc,	0x1
	te	%xcc,	0x4
	tleu	%xcc,	0x2
loop_2661:
	umul	%i4,	%o1,	%o3
	stb	%g7,	[%l7 + 0x69]
	fpsub16s	%f16,	%f15,	%f9
	fpadd16s	%f1,	%f26,	%f18
	bshuffle	%f10,	%f4,	%f22
	edge8l	%i7,	%g6,	%l3
	swap	[%l7 + 0x68],	%i5
	subccc	%g1,	0x0430,	%g3
	pdist	%f14,	%f16,	%f30
	fpadd32s	%f8,	%f5,	%f11
	tle	%xcc,	0x2
	fcmpne16	%f28,	%f16,	%i1
	fbue	%fcc3,	loop_2662
	ldsw	[%l7 + 0x4C],	%i3
	fmovdge	%icc,	%f16,	%f3
	tneg	%icc,	0x0
loop_2662:
	smulcc	%o5,	%i6,	%l6
	nop
	setx loop_2663, %l0, %l1
	jmpl %l1, %g5
	fxnors	%f19,	%f13,	%f6
	tcs	%icc,	0x4
	add	%l1,	%l4,	%o4
loop_2663:
	xnor	%o6,	%i2,	%l2
	fmul8ulx16	%f18,	%f4,	%f24
	movrgz	%g4,	%i0,	%o2
	array8	%g2,	%l0,	%o0
	edge16ln	%o7,	%i4,	%l5
	sll	%o3,	%g7,	%i7
	te	%icc,	0x4
	movge	%icc,	%g6,	%l3
	prefetch	[%l7 + 0x58],	 0x0
	brlez	%i5,	loop_2664
	movcc	%xcc,	%o1,	%g1
	tg	%icc,	0x7
	brz,a	%i1,	loop_2665
loop_2664:
	array16	%i3,	%g3,	%i6
	lduw	[%l7 + 0x68],	%l6
	udiv	%g5,	0x1B6A,	%o5
loop_2665:
	sra	%l4,	%o4,	%l1
	fmovscc	%xcc,	%f27,	%f11
	tge	%icc,	0x7
	lduh	[%l7 + 0x7C],	%o6
	udiv	%i2,	0x13D7,	%g4
	subccc	%l2,	0x0417,	%o2
	xnor	%g2,	0x0D23,	%i0
	andcc	%l0,	0x090E,	%o7
	tgu	%icc,	0x4
	fbue,a	%fcc1,	loop_2666
	fmovrslz	%i4,	%f0,	%f0
	movle	%xcc,	%l5,	%o3
	tl	%icc,	0x3
loop_2666:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g7,	%o0
	fxors	%f15,	%f0,	%f14
	fbl	%fcc0,	loop_2667
	umul	%i7,	0x028B,	%l3
	movcs	%xcc,	%g6,	%o1
	movvc	%icc,	%g1,	%i1
loop_2667:
	movn	%icc,	%i5,	%g3
	array16	%i6,	%l6,	%i3
	sllx	%o5,	0x01,	%g5
	membar	0x7D
	prefetch	[%l7 + 0x38],	 0x2
	lduh	[%l7 + 0x56],	%o4
	fpadd32s	%f12,	%f10,	%f23
	sra	%l4,	%l1,	%o6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%g4
	edge16	%l2,	%g2,	%o2
	st	%f17,	[%l7 + 0x28]
	movn	%xcc,	%l0,	%o7
	xnor	%i0,	%l5,	%o3
	movn	%xcc,	%i4,	%g7
	membar	0x35
	membar	#Sync
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x1e,	%f0
	movcc	%xcc,	%i7,	%l3
	ble,pt	%icc,	loop_2668
	fmovdle	%xcc,	%f7,	%f15
	movg	%xcc,	%o0,	%o1
	ble,a	loop_2669
loop_2668:
	tneg	%xcc,	0x1
	fornot2	%f0,	%f16,	%f22
	ta	%icc,	0x6
loop_2669:
	nop
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x24] %asi,	%f27
	mova	%icc,	%g6,	%i1
	alignaddr	%g1,	%g3,	%i5
	movge	%icc,	%l6,	%i3
	fmovdge	%icc,	%f0,	%f29
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x55] %asi,	%i6
	smul	%o5,	0x1098,	%g5
	fmovrslez	%l4,	%f8,	%f6
	addc	%l1,	%o6,	%i2
	edge8l	%o4,	%l2,	%g2
	nop
	set	0x5D, %g5
	stb	%o2,	[%l7 + %g5]
	tcc	%icc,	0x2
	bleu,pn	%xcc,	loop_2670
	tgu	%icc,	0x6
	brlez,a	%g4,	loop_2671
	fmovsa	%icc,	%f25,	%f15
loop_2670:
	mulx	%o7,	0x1E56,	%i0
	fmovscc	%icc,	%f27,	%f10
loop_2671:
	alignaddr	%l0,	%o3,	%i4
	set	0x0B, %g6
	lduba	[%l7 + %g6] 0x18,	%g7
	swap	[%l7 + 0x0C],	%l5
	tn	%xcc,	0x3
	brgz,a	%i7,	loop_2672
	fmovsle	%xcc,	%f20,	%f8
	edge16l	%o0,	%o1,	%g6
	edge16ln	%l3,	%g1,	%i1
loop_2672:
	stbar
	edge32ln	%g3,	%l6,	%i5
	movle	%xcc,	%i3,	%i6
	edge8	%o5,	%g5,	%l4
	movgu	%icc,	%o6,	%l1
	tsubcctv	%i2,	0x11E6,	%o4
	edge16ln	%l2,	%g2,	%o2
	fcmpes	%fcc0,	%f10,	%f23
	wr	%g0,	0xe2,	%asi
	stha	%o7,	[%l7 + 0x12] %asi
	membar	#Sync
	movcc	%icc,	%g4,	%i0
	xorcc	%o3,	0x140B,	%l0
	addcc	%g7,	%l5,	%i4
	movvc	%xcc,	%o0,	%o1
	edge32	%i7,	%g6,	%g1
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x3C] %asi,	%f0
	tsubcctv	%l3,	0x06CF,	%i1
	fcmpne32	%f12,	%f30,	%g3
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f16
	ld	[%l7 + 0x0C],	%f23
	edge32n	%l6,	%i3,	%i5
	sll	%o5,	%i6,	%l4
	fnot2s	%f22,	%f3
	tpos	%icc,	0x5
	subcc	%o6,	%l1,	%i2
	umul	%o4,	0x0A06,	%g5
	bcc,pn	%xcc,	loop_2673
	smul	%g2,	%l2,	%o2
	fzero	%f16
	movcs	%xcc,	%o7,	%g4
loop_2673:
	tge	%icc,	0x4
	edge32l	%o3,	%i0,	%l0
	movl	%icc,	%g7,	%l5
	fabss	%f28,	%f3
	srlx	%i4,	%o1,	%i7
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	tneg	%xcc,	0x3
	ld	[%l7 + 0x68],	%f9
	tg	%xcc,	0x6
	srlx	%g6,	0x05,	%l3
	tg	%icc,	0x2
	movpos	%xcc,	%i1,	%g1
	fbule,a	%fcc3,	loop_2674
	and	%g3,	%l6,	%i3
	movre	%o5,	0x34C,	%i5
	edge32	%l4,	%o6,	%i6
loop_2674:
	fcmple16	%f30,	%f8,	%l1
	fmovdvc	%xcc,	%f29,	%f16
	fmovrdlez	%i2,	%f16,	%f14
	edge8l	%o4,	%g5,	%g2
	movvc	%icc,	%l2,	%o2
	stx	%g4,	[%l7 + 0x08]
	nop
	set	0x1E, %i2
	sth	%o3,	[%l7 + %i2]
	brlz,a	%i0,	loop_2675
	te	%xcc,	0x4
	edge16n	%o7,	%l0,	%l5
	orn	%i4,	%o1,	%g7
loop_2675:
	fbe	%fcc2,	loop_2676
	fmovsne	%xcc,	%f30,	%f1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2676:
	fmovdcs	%icc,	%f27,	%f2
	fpsub32s	%f3,	%f13,	%f1
	tgu	%icc,	0x1
	edge32l	%o0,	%g6,	%i7
	xor	%i1,	%l3,	%g3
	bcs,a,pn	%icc,	loop_2677
	bne,a	loop_2678
	array8	%g1,	%i3,	%o5
	and	%i5,	0x1577,	%l4
loop_2677:
	bl	%xcc,	loop_2679
loop_2678:
	movrne	%o6,	%i6,	%l6
	fbn	%fcc1,	loop_2680
	bgu,a	%icc,	loop_2681
loop_2679:
	mova	%icc,	%i2,	%o4
	brz,a	%g5,	loop_2682
loop_2680:
	fmovda	%xcc,	%f27,	%f5
loop_2681:
	nop
	set	0x64, %g4
	lduha	[%l7 + %g4] 0x14,	%g2
loop_2682:
	array32	%l2,	%l1,	%o2
	tleu	%icc,	0x4
	movpos	%icc,	%o3,	%g4
	fbue,a	%fcc3,	loop_2683
	srax	%i0,	%o7,	%l0
	bg,pn	%xcc,	loop_2684
	umul	%i4,	0x12F4,	%o1
loop_2683:
	fmul8x16	%f24,	%f28,	%f18
	array32	%l5,	%g7,	%o0
loop_2684:
	addcc	%i7,	%g6,	%l3
	movrgez	%g3,	%i1,	%i3
	sethi	0x1425,	%g1
	array16	%o5,	%l4,	%o6
	xnor	%i5,	%i6,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o4,	0x10FB,	%l6
	pdist	%f26,	%f14,	%f10
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x70] %asi,	%g2
	movre	%l2,	%l1,	%o2
	fcmple32	%f22,	%f2,	%g5
	fmovsn	%icc,	%f27,	%f22
	sra	%g4,	%i0,	%o3
	sdivcc	%o7,	0x00F5,	%l0
	orcc	%i4,	%o1,	%g7
	wr	%g0,	0xeb,	%asi
	stda	%o0,	[%l7 + 0x78] %asi
	membar	#Sync
	fmovde	%icc,	%f10,	%f23
	movvs	%icc,	%i7,	%g6
	array16	%l3,	%l5,	%i1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%g3
	udivcc	%i3,	0x193D,	%g1
	edge32ln	%l4,	%o5,	%o6
	wr	%g0,	0x23,	%asi
	stha	%i5,	[%l7 + 0x62] %asi
	membar	#Sync
	edge8l	%i2,	%o4,	%i6
	andn	%g2,	%l6,	%l1
	subc	%l2,	0x09F4,	%o2
	umulcc	%g4,	0x017D,	%g5
	tcc	%icc,	0x7
	orncc	%o3,	%i0,	%l0
	lduh	[%l7 + 0x70],	%i4
	fnegs	%f6,	%f11
	fmovrdlez	%o1,	%f2,	%f22
	fmovsleu	%icc,	%f30,	%f3
	or	%g7,	%o0,	%o7
	umul	%i7,	%l3,	%g6
	fpsub32	%f10,	%f0,	%f2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x30] %asi,	%i1
	fmuld8sux16	%f29,	%f14,	%f18
	xnorcc	%g3,	%i3,	%l5
	ldsh	[%l7 + 0x0E],	%g1
	brlez,a	%l4,	loop_2685
	movvs	%xcc,	%o6,	%o5
	fbn	%fcc1,	loop_2686
	nop
	setx	loop_2687,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2685:
	xnor	%i2,	%o4,	%i5
	fpadd32s	%f29,	%f22,	%f7
loop_2686:
	fpmerge	%f13,	%f7,	%f26
loop_2687:
	orcc	%g2,	%i6,	%l1
	taddcctv	%l6,	%l2,	%g4
	tcc	%icc,	0x6
	movvs	%icc,	%g5,	%o2
	ble	%icc,	loop_2688
	mulscc	%i0,	0x181C,	%l0
	bpos,a,pt	%xcc,	loop_2689
	edge32	%i4,	%o1,	%g7
loop_2688:
	nop
	wr	%g0,	0x2b,	%asi
	stxa	%o0,	[%l7 + 0x68] %asi
	membar	#Sync
loop_2689:
	tvc	%xcc,	0x0
	brlez	%o7,	loop_2690
	orn	%o3,	%i7,	%l3
	edge32n	%g6,	%g3,	%i3
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%l5
loop_2690:
	fble,a	%fcc2,	loop_2691
	bne,a,pt	%xcc,	loop_2692
	edge32n	%l4,	%g1,	%o6
	movrgez	%o5,	0x060,	%i2
loop_2691:
	swap	[%l7 + 0x18],	%i5
loop_2692:
	movleu	%icc,	%g2,	%o4
	fpadd16s	%f13,	%f17,	%f24
	st	%f20,	[%l7 + 0x38]
	ldd	[%l7 + 0x30],	%l0
	movcs	%xcc,	%l6,	%i6
	edge8l	%g4,	%g5,	%o2
	bpos,a	loop_2693
	flush	%l7 + 0x1C
	tpos	%icc,	0x7
	ldd	[%l7 + 0x08],	%i0
loop_2693:
	ba,pn	%xcc,	loop_2694
	andncc	%l0,	%i4,	%l2
	edge32	%g7,	%o0,	%o7
	movleu	%icc,	%o3,	%o1
loop_2694:
	prefetch	[%l7 + 0x7C],	 0x0
	movvs	%xcc,	%l3,	%g6
	ldd	[%l7 + 0x08],	%f30
	fmovrdne	%i7,	%f30,	%f26
	nop
	set	0x30, %l3
	sth	%g3,	[%l7 + %l3]
	edge16ln	%i3,	%l5,	%l4
	addc	%g1,	0x03BA,	%o6
	tleu	%xcc,	0x2
	sdivcc	%i1,	0x0591,	%i2
	set	0x60, %i6
	stda	%o4,	[%l7 + %i6] 0x0c
	set	0x2E, %l6
	ldsba	[%l7 + %l6] 0x88,	%g2
	movge	%xcc,	%i5,	%l1
	edge16	%o4,	%l6,	%i6
	tge	%xcc,	0x1
	bg,a	loop_2695
	sllx	%g5,	0x01,	%g4
	popc	%o2,	%i0
	movvs	%xcc,	%l0,	%l2
loop_2695:
	sdivcc	%i4,	0x1EB3,	%g7
	brz,a	%o0,	loop_2696
	pdist	%f24,	%f28,	%f26
	brlz,a	%o3,	loop_2697
	brlz,a	%o7,	loop_2698
loop_2696:
	movn	%icc,	%l3,	%g6
	fbug,a	%fcc3,	loop_2699
loop_2697:
	bcc,a,pn	%xcc,	loop_2700
loop_2698:
	fmovdvc	%xcc,	%f13,	%f7
	fmovrde	%o1,	%f16,	%f4
loop_2699:
	alignaddr	%g3,	%i7,	%l5
loop_2700:
	lduh	[%l7 + 0x0E],	%l4
	fones	%f8
	brlz,a	%i3,	loop_2701
	fmovrsgz	%g1,	%f29,	%f0
	fmovsle	%xcc,	%f15,	%f27
	sll	%i1,	0x02,	%o6
loop_2701:
	xor	%i2,	0x0DE6,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x7
	edge16	%i5,	%o5,	%o4
	sll	%l6,	%i6,	%l1
	movneg	%xcc,	%g5,	%g4
	fnor	%f18,	%f14,	%f30
	fmovda	%icc,	%f10,	%f12
	fbug	%fcc0,	loop_2702
	fmovsleu	%icc,	%f2,	%f8
	std	%f24,	[%l7 + 0x38]
	sub	%o2,	0x187B,	%i0
loop_2702:
	sdiv	%l0,	0x0940,	%i4
	movrlez	%l2,	%g7,	%o3
	fmul8x16al	%f28,	%f21,	%f26
	movvc	%xcc,	%o7,	%o0
	wr	%g0,	0x11,	%asi
	stba	%l3,	[%l7 + 0x5A] %asi
	udivcc	%o1,	0x1D63,	%g3
	movvc	%xcc,	%i7,	%g6
	popc	%l4,	%i3
	array32	%g1,	%l5,	%i1
	popc	%i2,	%o6
	udivcc	%i5,	0x0A5F,	%g2
	fandnot2	%f20,	%f8,	%f24
	andcc	%o4,	%l6,	%o5
	movpos	%xcc,	%l1,	%g5
	fmovrdgez	%i6,	%f18,	%f14
	movleu	%xcc,	%g4,	%o2
	tneg	%xcc,	0x7
	smul	%l0,	0x052A,	%i0
	taddcc	%l2,	%g7,	%i4
	tle	%icc,	0x6
	tvc	%icc,	0x0
	mulscc	%o7,	0x1350,	%o0
	xnorcc	%o3,	0x1ACA,	%o1
	nop
	set	0x79, %o7
	ldub	[%l7 + %o7],	%l3
	set	0x14, %o1
	stwa	%g3,	[%l7 + %o1] 0xea
	membar	#Sync
	movle	%xcc,	%i7,	%g6
	movvc	%xcc,	%i3,	%g1
	tsubcc	%l4,	0x1BD0,	%i1
	ba,a	loop_2703
	bne	loop_2704
	brnz,a	%i2,	loop_2705
	fmovrdgz	%o6,	%f4,	%f26
loop_2703:
	fmovdge	%icc,	%f10,	%f16
loop_2704:
	fbl	%fcc3,	loop_2706
loop_2705:
	fmovrdgz	%l5,	%f10,	%f12
	fnegs	%f22,	%f28
	fmovrslz	%g2,	%f25,	%f28
loop_2706:
	nop
	set	0x4A, %l2
	ldsha	[%l7 + %l2] 0x19,	%o4
	tle	%icc,	0x7
	ba,a	%xcc,	loop_2707
	fxnor	%f2,	%f28,	%f8
	movleu	%xcc,	%l6,	%i5
	movrne	%l1,	0x20A,	%o5
loop_2707:
	fcmpeq32	%f6,	%f0,	%g5
	fornot2s	%f4,	%f20,	%f18
	tg	%icc,	0x6
	fbo,a	%fcc1,	loop_2708
	st	%f28,	[%l7 + 0x3C]
	udivcc	%i6,	0x1487,	%g4
	fmovdvc	%xcc,	%f9,	%f15
loop_2708:
	edge32ln	%l0,	%i0,	%o2
	tle	%icc,	0x4
	fsrc2	%f2,	%f22
	ta	%xcc,	0x2
	fcmpeq32	%f6,	%f12,	%l2
	fmovdvs	%icc,	%f6,	%f0
	addc	%g7,	0x1382,	%i4
	addcc	%o7,	%o0,	%o1
	sdiv	%o3,	0x016A,	%g3
	array8	%i7,	%l3,	%g6
	taddcc	%g1,	0x1CAE,	%i3
	sra	%l4,	%i1,	%i2
	fmovsne	%icc,	%f20,	%f30
	fbo,a	%fcc3,	loop_2709
	array32	%o6,	%g2,	%l5
	edge16ln	%l6,	%o4,	%l1
	movvs	%icc,	%o5,	%i5
loop_2709:
	tge	%icc,	0x5
	ld	[%l7 + 0x0C],	%f25
	fxors	%f5,	%f4,	%f11
	fornot1	%f12,	%f26,	%f16
	xnorcc	%g5,	%g4,	%i6
	bne,a,pt	%icc,	loop_2710
	xnorcc	%i0,	%l0,	%l2
	te	%xcc,	0x2
	wr	%g0,	0x2b,	%asi
	stxa	%g7,	[%l7 + 0x08] %asi
	membar	#Sync
loop_2710:
	edge8l	%o2,	%i4,	%o0
	tle	%icc,	0x3
	tleu	%icc,	0x7
	xor	%o7,	0x061A,	%o3
	fmovrdlz	%o1,	%f30,	%f16
	tvc	%icc,	0x2
	fbge	%fcc2,	loop_2711
	movvs	%icc,	%i7,	%g3
	popc	%l3,	%g6
	bvs,a	%icc,	loop_2712
loop_2711:
	edge8n	%i3,	%g1,	%l4
	tsubcctv	%i1,	0x18BE,	%i2
	ba,a	loop_2713
loop_2712:
	tne	%icc,	0x3
	fsrc2s	%f10,	%f4
	add	%l7,	0x34,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g2,	%l5
loop_2713:
	movvs	%icc,	%o6,	%l6
	edge32ln	%l1,	%o4,	%o5
	umulcc	%i5,	0x163E,	%g5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x3
	movn	%icc,	%i6,	%l0
	edge32l	%i0,	%l2,	%g7
	fmuld8sux16	%f24,	%f21,	%f18
	orncc	%o2,	%i4,	%o7
	edge8n	%o3,	%o0,	%i7
	taddcc	%o1,	%l3,	%g6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x6C] %asi,	%g3
	fxnors	%f1,	%f17,	%f29
	pdist	%f24,	%f0,	%f2
	fmul8x16al	%f25,	%f20,	%f22
	fnors	%f31,	%f1,	%f22
	add	%g1,	0x01C0,	%i3
	srl	%l4,	%i2,	%i1
	subccc	%l5,	0x1470,	%o6
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%l6
	movcs	%icc,	%l1,	%o4
	mulscc	%o5,	%g2,	%g5
	xorcc	%g4,	0x1D03,	%i6
	sllx	%i5,	0x10,	%i0
	movre	%l0,	0x142,	%g7
	smul	%l2,	%o2,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o3,	%o0,	%o7
	fbule,a	%fcc0,	loop_2714
	srl	%o1,	0x05,	%i7
	fones	%f1
	ldx	[%l7 + 0x58],	%g6
loop_2714:
	movvs	%xcc,	%g3,	%l3
	bne,a	%xcc,	loop_2715
	fbge	%fcc1,	loop_2716
	edge16ln	%i3,	%l4,	%g1
	fmovs	%f8,	%f10
loop_2715:
	std	%i2,	[%l7 + 0x08]
loop_2716:
	orn	%l5,	%o6,	%i1
	set	0x40, %g7
	stwa	%l1,	[%l7 + %g7] 0xe3
	membar	#Sync
	tge	%xcc,	0x4
	ba,a,pn	%icc,	loop_2717
	tne	%icc,	0x6
	ba,a	%xcc,	loop_2718
	fnegd	%f30,	%f14
loop_2717:
	nop
	set	0x64, %o6
	stha	%l6,	[%l7 + %o6] 0xea
	membar	#Sync
loop_2718:
	te	%xcc,	0x4
	srax	%o4,	%g2,	%o5
	bcs,pt	%xcc,	loop_2719
	add	%g5,	0x1229,	%g4
	tg	%icc,	0x4
	fcmpne32	%f20,	%f22,	%i5
loop_2719:
	tcc	%icc,	0x4
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%i6
	tvs	%icc,	0x4
	andcc	%i0,	0x143E,	%l0
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x32] %asi,	%g7
	fcmpes	%fcc1,	%f22,	%f3
	movrlez	%o2,	%i4,	%o3
	movrlz	%o0,	%l2,	%o1
	xor	%o7,	%i7,	%g6
	srlx	%l3,	0x11,	%g3
	fbuge,a	%fcc1,	loop_2720
	movge	%icc,	%i3,	%g1
	edge16l	%l4,	%l5,	%i2
	andn	%o6,	0x1021,	%l1
loop_2720:
	fbge	%fcc0,	loop_2721
	fba	%fcc1,	loop_2722
	fmovs	%f31,	%f23
	tsubcctv	%l6,	0x1425,	%o4
loop_2721:
	tle	%xcc,	0x5
loop_2722:
	udiv	%g2,	0x0418,	%o5
	subccc	%g5,	%i1,	%i5
	bn	%xcc,	loop_2723
	tcc	%xcc,	0x4
	array8	%g4,	%i0,	%i6
	fbne	%fcc1,	loop_2724
loop_2723:
	movrne	%l0,	0x3DD,	%o2
	edge16l	%g7,	%i4,	%o3
	addccc	%o0,	0x1970,	%l2
loop_2724:
	tne	%icc,	0x0
	tgu	%xcc,	0x5
	fpmerge	%f14,	%f27,	%f16
	fnegs	%f1,	%f21
	fmovsvs	%xcc,	%f19,	%f3
	addccc	%o7,	%i7,	%g6
	mulscc	%l3,	%g3,	%o1
	fnegs	%f14,	%f21
	fbge	%fcc1,	loop_2725
	subc	%g1,	%i3,	%l4
	fmovs	%f18,	%f12
	nop
	setx loop_2726, %l0, %l1
	jmpl %l1, %i2
loop_2725:
	tne	%icc,	0x1
	andcc	%l5,	0x1A11,	%l1
	andcc	%o6,	0x1F8E,	%o4
loop_2726:
	tgu	%icc,	0x0
	tle	%icc,	0x7
	bpos,a	%xcc,	loop_2727
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x70, %o4
	ldsba	[%l7 + %o4] 0x80,	%g2
loop_2727:
	and	%l6,	%o5,	%i1
	andcc	%g5,	%g4,	%i5
	fmul8x16au	%f5,	%f0,	%f10
	andcc	%i0,	%l0,	%i6
	mova	%xcc,	%o2,	%i4
	fbul	%fcc2,	loop_2728
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g7,	%o3,	%o0
	tsubcc	%o7,	0x0283,	%i7
loop_2728:
	fpack32	%f28,	%f24,	%f28
	fnor	%f26,	%f0,	%f0
	array8	%l2,	%l3,	%g3
	fornot2s	%f26,	%f16,	%f13
	bne	loop_2729
	smul	%o1,	0x16F4,	%g6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
loop_2729:
	orn	%l4,	%i2,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x40, %i0
	std	%l0,	[%l7 + %i0]
	movl	%icc,	%g1,	%o6
	fbul,a	%fcc0,	loop_2730
	fmul8x16	%f10,	%f10,	%f26
	movge	%icc,	%g2,	%l6
	xor	%o4,	0x1CA9,	%i1
loop_2730:
	fpackfix	%f14,	%f2
	movge	%xcc,	%g5,	%o5
	std	%i4,	[%l7 + 0x70]
	fmovrdlez	%i0,	%f22,	%f2
	movcs	%icc,	%l0,	%i6
	tl	%xcc,	0x7
	sdivx	%g4,	0x1734,	%i4
	taddcc	%g7,	%o2,	%o3
	udivcc	%o0,	0x13C8,	%o7
	sra	%l2,	%l3,	%i7
	movleu	%icc,	%g3,	%o1
	smulcc	%g6,	0x1576,	%l4
	or	%i3,	0x046C,	%l5
	movcc	%icc,	%l1,	%g1
	tl	%icc,	0x4
	xorcc	%i2,	0x00DB,	%o6
	nop
	set	0x10, %l5
	stx	%g2,	[%l7 + %l5]
	edge32ln	%o4,	%i1,	%g5
	mulx	%l6,	%i5,	%o5
	fmovrslez	%l0,	%f7,	%f22
	fbge,a	%fcc2,	loop_2731
	movvs	%icc,	%i6,	%i0
	fmul8sux16	%f18,	%f4,	%f14
	subcc	%i4,	0x1B44,	%g7
loop_2731:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x68, %o2
	lduha	[%l7 + %o2] 0x80,	%g4
	xorcc	%o2,	0x1F0A,	%o3
	edge16ln	%o0,	%l2,	%o7
	udivx	%l3,	0x1996,	%g3
	fmovrslz	%i7,	%f6,	%f9
	bn	loop_2732
	fornot2	%f16,	%f10,	%f26
	fmuld8sux16	%f5,	%f5,	%f26
	smul	%o1,	0x1BBC,	%g6
loop_2732:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x60] %asi,	%l4
	bge	%xcc,	loop_2733
	stx	%i3,	[%l7 + 0x08]
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2733:
	tpos	%xcc,	0x2
	movne	%xcc,	%l5,	%g1
	tleu	%xcc,	0x1
	tvc	%xcc,	0x6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x40] %asi,	%l1
	movrlz	%o6,	%g2,	%i2
	udiv	%o4,	0x124D,	%i1
	brlz,a	%l6,	loop_2734
	sub	%i5,	%g5,	%o5
	mulx	%i6,	0x05F9,	%i0
	bvs	%xcc,	loop_2735
loop_2734:
	movrne	%i4,	%g7,	%l0
	fmovrdne	%g4,	%f26,	%f16
	tneg	%xcc,	0x7
loop_2735:
	mulx	%o2,	0x1C20,	%o3
	sethi	0x192D,	%o0
	movl	%icc,	%o7,	%l3
	fbu	%fcc1,	loop_2736
	fabss	%f3,	%f7
	stx	%g3,	[%l7 + 0x78]
	fmovdvc	%icc,	%f28,	%f18
loop_2736:
	ta	%xcc,	0x3
	array32	%i7,	%o1,	%l2
	movrne	%l4,	0x2A1,	%g6
	andncc	%i3,	%g1,	%l1
	edge8n	%l5,	%g2,	%o6
	taddcctv	%i2,	%i1,	%l6
	tle	%icc,	0x0
	addc	%o4,	%g5,	%o5
	umulcc	%i6,	%i0,	%i5
	subccc	%g7,	0x10FA,	%i4
	tcc	%xcc,	0x5
	andn	%l0,	%o2,	%o3
	fmuld8ulx16	%f14,	%f8,	%f24
	tne	%xcc,	0x6
	fbne,a	%fcc1,	loop_2737
	membar	0x6D
	mova	%icc,	%o0,	%o7
	movre	%l3,	%g3,	%g4
loop_2737:
	orncc	%i7,	%l2,	%o1
	prefetch	[%l7 + 0x10],	 0x0
	lduw	[%l7 + 0x58],	%g6
	sllx	%i3,	%l4,	%l1
	movn	%icc,	%l5,	%g2
	lduh	[%l7 + 0x7C],	%g1
	movre	%o6,	0x2DC,	%i2
	fbo,a	%fcc2,	loop_2738
	std	%f26,	[%l7 + 0x58]
	fba,a	%fcc3,	loop_2739
	tn	%icc,	0x3
loop_2738:
	movre	%i1,	%o4,	%l6
	fpsub32	%f28,	%f16,	%f16
loop_2739:
	fnegd	%f10,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g5,	%i6,	%i0
	addc	%i5,	0x10C4,	%g7
	fmovrdne	%o5,	%f4,	%f4
	andcc	%i4,	%l0,	%o2
	movn	%icc,	%o3,	%o0
	fmovdl	%icc,	%f1,	%f18
	srax	%l3,	0x1D,	%o7
	sdivcc	%g4,	0x0202,	%i7
	tvc	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x40] %asi,	%g3
	fcmpgt16	%f30,	%f18,	%o1
	fmovrde	%l2,	%f30,	%f2
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	fbg	%fcc3,	loop_2740
	movle	%icc,	%g6,	%l1
	fmovdcs	%icc,	%f23,	%f24
	nop
	setx loop_2741, %l0, %l1
	jmpl %l1, %l5
loop_2740:
	ta	%icc,	0x7
	fpack16	%f6,	%f10
	bgu,a	%xcc,	loop_2742
loop_2741:
	movneg	%icc,	%g2,	%g1
	movrlz	%l4,	0x27A,	%o6
	edge8	%i2,	%o4,	%l6
loop_2742:
	sdivx	%g5,	0x19A8,	%i1
	andncc	%i6,	%i5,	%i0
	sethi	0x1F81,	%o5
	edge32l	%g7,	%l0,	%o2
	movrlez	%i4,	%o0,	%o3
	taddcc	%o7,	0x0C0F,	%g4
	alignaddrl	%l3,	%g3,	%o1
	edge8l	%l2,	%i7,	%g6
	edge8ln	%i3,	%l5,	%l1
	orncc	%g2,	0x1591,	%l4
	tpos	%icc,	0x6
	fmovdvs	%xcc,	%f26,	%f6
	popc	0x0893,	%o6
	brlez	%i2,	loop_2743
	sll	%o4,	0x0C,	%l6
	tg	%icc,	0x4
	edge32	%g5,	%g1,	%i1
loop_2743:
	fandnot2s	%f2,	%f23,	%f30
	sllx	%i5,	%i0,	%o5
	add	%g7,	%l0,	%o2
	fnot1	%f24,	%f8
	fmovs	%f20,	%f8
	fpsub32s	%f25,	%f26,	%f22
	orn	%i4,	%i6,	%o3
	movvc	%xcc,	%o7,	%o0
	sdivx	%l3,	0x0335,	%g4
	andncc	%g3,	%l2,	%i7
	bcs,a	loop_2744
	taddcctv	%o1,	0x1715,	%g6
	bleu,a	loop_2745
	movle	%xcc,	%i3,	%l1
loop_2744:
	add	%g2,	%l5,	%l4
	mulx	%i2,	%o4,	%o6
loop_2745:
	std	%g4,	[%l7 + 0x08]
	bpos	loop_2746
	fcmpeq32	%f14,	%f2,	%g1
	movre	%i1,	0x209,	%l6
	fmovrslez	%i0,	%f14,	%f20
loop_2746:
	orcc	%i5,	0x1C13,	%g7
	movrgz	%l0,	%o2,	%o5
	sir	0x1DF9
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
	bpos,pt	%xcc,	loop_2748
	movneg	%icc,	%i6,	%o3
	movrgez	%i4,	0x0AD,	%o7
loop_2747:
	call	loop_2749
loop_2748:
	move	%icc,	%l3,	%g4
	fmuld8sux16	%f6,	%f23,	%f10
	andncc	%o0,	%g3,	%i7
loop_2749:
	tgu	%xcc,	0x7
	wr	%g0,	0x22,	%asi
	stxa	%o1,	[%l7 + 0x18] %asi
	membar	#Sync
	udivcc	%g6,	0x1888,	%l2
	tvc	%icc,	0x4
	fmovdn	%xcc,	%f2,	%f18
	for	%f28,	%f20,	%f10
	movrne	%l1,	0x114,	%g2
	edge16ln	%l5,	%i3,	%i2
	movgu	%icc,	%l4,	%o6
	prefetch	[%l7 + 0x54],	 0x1
	bneg,pt	%icc,	loop_2750
	fmul8x16al	%f23,	%f2,	%f2
	edge8l	%o4,	%g1,	%g5
	fpmerge	%f2,	%f31,	%f20
loop_2750:
	fcmpgt16	%f8,	%f24,	%i1
	brnz	%i0,	loop_2751
	fmovsgu	%icc,	%f13,	%f25
	xor	%i5,	0x0DE2,	%l6
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x46] %asi,	%l0
loop_2751:
	fnegd	%f2,	%f0
	taddcctv	%g7,	0x0E73,	%o5
	tvs	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	stha	%o2,	[%l7 + 0x6A] %asi
	set	0x38, %l1
	stda	%i6,	[%l7 + %l1] 0x80
	fands	%f13,	%f11,	%f19
	addc	%o3,	%o7,	%i4
	sir	0x0FA3
	fbge,a	%fcc3,	loop_2752
	tcc	%icc,	0x1
	movvs	%xcc,	%l3,	%g4
	umul	%g3,	0x1ECA,	%i7
loop_2752:
	tvs	%xcc,	0x3
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x81,	%f0
	bpos,pn	%xcc,	loop_2753
	movge	%xcc,	%o0,	%g6
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x23,	%o0
loop_2753:
	movrne	%l1,	0x39F,	%l2
	fmovsn	%icc,	%f5,	%f14
	alignaddrl	%g2,	%l5,	%i3
	fbne,a	%fcc3,	loop_2754
	udiv	%i2,	0x0034,	%o6
	fmovdle	%icc,	%f31,	%f18
	sra	%l4,	0x0D,	%g1
loop_2754:
	fmovsne	%icc,	%f18,	%f3
	edge16	%g5,	%i1,	%o4
	std	%f8,	[%l7 + 0x70]
	movre	%i5,	%i0,	%l6
	or	%l0,	%g7,	%o5
	sub	%o2,	%i6,	%o7
	fornot2	%f6,	%f0,	%f16
	orcc	%o3,	%i4,	%g4
	tn	%xcc,	0x7
	fnegs	%f6,	%f4
	andn	%l3,	0x0102,	%g3
	fsrc1s	%f10,	%f6
	fmovrsne	%o0,	%f2,	%f7
	movgu	%icc,	%g6,	%o1
	movrne	%l1,	0x381,	%l2
	edge32l	%g2,	%l5,	%i3
	edge16l	%i2,	%o6,	%i7
	fnegd	%f18,	%f10
	mova	%icc,	%l4,	%g5
	tle	%icc,	0x4
	orn	%i1,	%g1,	%o4
	fxors	%f4,	%f24,	%f25
	std	%f18,	[%l7 + 0x58]
	xor	%i5,	%i0,	%l0
	brgz,a	%l6,	loop_2755
	ble,pt	%xcc,	loop_2756
	sll	%o5,	0x13,	%g7
	fbue	%fcc0,	loop_2757
loop_2755:
	fbuge	%fcc1,	loop_2758
loop_2756:
	movrlz	%i6,	%o2,	%o3
	sll	%o7,	0x0B,	%i4
loop_2757:
	edge16l	%g4,	%g3,	%o0
loop_2758:
	edge32l	%g6,	%o1,	%l3
	movre	%l1,	%l2,	%l5
	ta	%icc,	0x0
	andncc	%g2,	%i3,	%i2
	edge16l	%o6,	%i7,	%l4
	movrgz	%g5,	%g1,	%i1
	edge16n	%o4,	%i0,	%i5
	alignaddr	%l6,	%o5,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l0,	%o2,	%i6
	sethi	0x0BB8,	%o7
	fxnor	%f4,	%f26,	%f16
	array32	%o3,	%i4,	%g3
	andcc	%o0,	%g4,	%o1
	ldub	[%l7 + 0x6C],	%g6
	ldsw	[%l7 + 0x0C],	%l1
	fmovsneg	%icc,	%f11,	%f21
	fbue,a	%fcc0,	loop_2759
	movn	%xcc,	%l2,	%l3
	brlz,a	%l5,	loop_2760
	sdivcc	%g2,	0x17AC,	%i2
loop_2759:
	xnorcc	%o6,	%i7,	%l4
	fpack32	%f18,	%f24,	%f14
loop_2760:
	movvs	%xcc,	%g5,	%i3
	taddcctv	%g1,	%i1,	%i0
	ba,a	%icc,	loop_2761
	sdivcc	%i5,	0x0365,	%o4
	fmovdne	%xcc,	%f19,	%f30
	movl	%xcc,	%o5,	%g7
loop_2761:
	addccc	%l6,	0x1389,	%l0
	alignaddrl	%o2,	%i6,	%o3
	addccc	%i4,	%o7,	%g3
	fmul8ulx16	%f14,	%f0,	%f30
	array16	%o0,	%o1,	%g4
	edge32	%l1,	%g6,	%l2
	set	0x62, %o5
	stba	%l3,	[%l7 + %o5] 0x2b
	membar	#Sync
	umul	%l5,	0x1CAE,	%g2
	srlx	%o6,	0x18,	%i2
	movrlz	%i7,	0x37A,	%g5
	mulx	%i3,	%g1,	%l4
	fabsd	%f24,	%f2
	smulcc	%i0,	%i5,	%i1
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x2f,	%o4
	add	%o5,	%l6,	%l0
	array16	%o2,	%i6,	%g7
	fblg	%fcc2,	loop_2762
	bcc	%xcc,	loop_2763
	movre	%o3,	%i4,	%g3
	fble	%fcc2,	loop_2764
loop_2762:
	or	%o0,	0x049B,	%o1
loop_2763:
	tsubcc	%o7,	0x09FE,	%g4
	fbo,a	%fcc0,	loop_2765
loop_2764:
	add	%g6,	0x0218,	%l1
	ta	%icc,	0x4
	addcc	%l2,	%l3,	%l5
loop_2765:
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
	srlx	%g2,	%o6,	%i2
	brgz,a	%i7,	loop_2767
	tge	%xcc,	0x5
loop_2766:
	fpadd32s	%f17,	%f15,	%f24
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf8
	membar	#Sync
loop_2767:
	fmovdvc	%icc,	%f25,	%f10
	set	0x4C, %o3
	sta	%f4,	[%l7 + %o3] 0x04
	ldd	[%l7 + 0x38],	%i2
	movvs	%icc,	%g5,	%g1
	fcmps	%fcc1,	%f15,	%f16
	te	%icc,	0x1
	fcmpd	%fcc3,	%f20,	%f12
	stx	%l4,	[%l7 + 0x18]
	fmovdpos	%icc,	%f7,	%f12
	andncc	%i5,	%i0,	%o4
	sll	%i1,	0x10,	%o5
	fba	%fcc0,	loop_2768
	fbe,a	%fcc1,	loop_2769
	ldd	[%l7 + 0x40],	%f30
	smul	%l0,	%o2,	%l6
loop_2768:
	xorcc	%i6,	0x0C92,	%g7
loop_2769:
	fcmpd	%fcc2,	%f30,	%f22
	popc	0x1772,	%i4
	movrlez	%g3,	%o0,	%o3
	tcc	%xcc,	0x2
	fbuge,a	%fcc2,	loop_2770
	edge16l	%o7,	%g4,	%g6
	fcmpes	%fcc2,	%f20,	%f21
	xnor	%o1,	0x143D,	%l1
loop_2770:
	fmovs	%f17,	%f22
	fbu,a	%fcc3,	loop_2771
	bvc,a,pt	%icc,	loop_2772
	fmovdg	%xcc,	%f25,	%f17
	lduw	[%l7 + 0x0C],	%l2
loop_2771:
	movgu	%icc,	%l5,	%g2
loop_2772:
	bvc,pn	%icc,	loop_2773
	orcc	%l3,	0x0276,	%i2
	andn	%o6,	%i7,	%g5
	fzero	%f2
loop_2773:
	movre	%g1,	0x2A8,	%i3
	for	%f0,	%f4,	%f0
	edge32l	%i5,	%i0,	%o4
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l4
	smulcc	%o5,	%i1,	%l0
	tge	%icc,	0x4
	orncc	%o2,	0x08DE,	%l6
	movge	%icc,	%i6,	%g7
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x50] %asi,	%i4
	fmovsleu	%xcc,	%f24,	%f10
	srlx	%o0,	%o3,	%g3
	fxnors	%f27,	%f28,	%f29
	fpmerge	%f1,	%f7,	%f8
	fnor	%f14,	%f28,	%f30
	fmovse	%xcc,	%f11,	%f31
	movrne	%g4,	0x272,	%o7
	edge32ln	%o1,	%g6,	%l1
	udivx	%l2,	0x0B45,	%l5
	for	%f16,	%f16,	%f16
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	fpadd32	%f16,	%f28,	%f0
	fpadd16s	%f24,	%f20,	%f15
	fabss	%f28,	%f25
	and	%i2,	0x0BB5,	%g2
	movcc	%xcc,	%i7,	%g5
	movvs	%xcc,	%g1,	%o6
	ta	%xcc,	0x5
	orcc	%i3,	0x04B5,	%i0
	and	%i5,	%o4,	%l4
	fbul,a	%fcc1,	loop_2774
	tsubcctv	%i1,	%l0,	%o5
	mulscc	%l6,	%o2,	%g7
	tleu	%icc,	0x0
loop_2774:
	fbe	%fcc0,	loop_2775
	edge16	%i6,	%o0,	%i4
	bneg	%xcc,	loop_2776
	mova	%xcc,	%g3,	%g4
loop_2775:
	smulcc	%o3,	%o1,	%g6
	andncc	%l1,	%l2,	%o7
loop_2776:
	movleu	%xcc,	%l5,	%l3
	edge16l	%i2,	%g2,	%g5
	tpos	%icc,	0x1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fornot1s	%f9,	%f26,	%f2
	umulcc	%g1,	%o6,	%i3
	movn	%icc,	%i0,	%i7
	sdiv	%i5,	0x00C3,	%l4
	tneg	%icc,	0x4
	edge8n	%o4,	%i1,	%o5
	nop
	setx	loop_2777,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orcc	%l0,	%o2,	%g7
	fbue	%fcc3,	loop_2778
	ldub	[%l7 + 0x35],	%l6
loop_2777:
	fandnot2	%f26,	%f12,	%f20
	fzeros	%f9
loop_2778:
	tcc	%icc,	0x2
	te	%xcc,	0x1
	movre	%i6,	%i4,	%g3
	stw	%o0,	[%l7 + 0x3C]
	edge8	%o3,	%o1,	%g4
	array8	%l1,	%g6,	%l2
	movcc	%icc,	%l5,	%l3
	tpos	%icc,	0x6
	sub	%o7,	0x01CA,	%g2
	edge8ln	%g5,	%g1,	%o6
	fmovdneg	%icc,	%f27,	%f17
	movgu	%icc,	%i3,	%i2
	movcs	%icc,	%i0,	%i7
	tsubcc	%i5,	%l4,	%o4
	std	%f8,	[%l7 + 0x38]
	subc	%o5,	0x0622,	%l0
	fblg,a	%fcc3,	loop_2779
	tl	%xcc,	0x2
	tgu	%xcc,	0x7
	ta	%icc,	0x5
loop_2779:
	fmovsge	%xcc,	%f11,	%f18
	fmovdvs	%xcc,	%f17,	%f22
	set	0x76, %g3
	lduba	[%l7 + %g3] 0x81,	%i1
	addccc	%g7,	0x1A0C,	%o2
	andcc	%i6,	0x0CE7,	%l6
	fmovdleu	%xcc,	%f11,	%f0
	brlez	%g3,	loop_2780
	alignaddr	%i4,	%o0,	%o1
	alignaddr	%o3,	%g4,	%g6
	tn	%icc,	0x7
loop_2780:
	xnor	%l1,	0x1DD2,	%l5
	edge16ln	%l3,	%l2,	%o7
	umul	%g2,	%g5,	%g1
	move	%xcc,	%o6,	%i2
	tleu	%xcc,	0x3
	edge8	%i0,	%i3,	%i7
	movneg	%xcc,	%l4,	%i5
	edge32n	%o4,	%o5,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x3
	fbge	%fcc0,	loop_2781
	movl	%icc,	%g7,	%l0
	mulx	%i6,	0x18E3,	%o2
	edge32n	%g3,	%l6,	%i4
loop_2781:
	sdiv	%o0,	0x04DE,	%o3
	tsubcc	%g4,	%g6,	%o1
	fmovdcc	%icc,	%f12,	%f19
	fmovsvc	%icc,	%f14,	%f21
	orn	%l1,	%l3,	%l2
	fnors	%f8,	%f6,	%f8
	fpsub32	%f30,	%f14,	%f0
	udiv	%o7,	0x0163,	%l5
	fzero	%f2
	movle	%icc,	%g5,	%g1
	addc	%g2,	%o6,	%i0
	addccc	%i3,	%i7,	%l4
	sra	%i5,	%o4,	%o5
	fbg,a	%fcc3,	loop_2782
	srax	%i2,	0x08,	%g7
	tl	%xcc,	0x3
	ldd	[%l7 + 0x50],	%i0
loop_2782:
	udivcc	%l0,	0x1840,	%o2
	edge16l	%i6,	%g3,	%i4
	fmovrslez	%l6,	%f15,	%f29
	mulx	%o3,	%g4,	%g6
	addcc	%o0,	0x0FA5,	%l1
	fxnors	%f24,	%f11,	%f12
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x78] %asi,	%f22
	alignaddrl	%l3,	%o1,	%o7
	fnor	%f26,	%f8,	%f30
	movrlz	%l5,	0x1D9,	%g5
	ld	[%l7 + 0x24],	%f25
	fmovsge	%icc,	%f14,	%f6
	alignaddr	%l2,	%g1,	%o6
	movg	%icc,	%i0,	%g2
	membar	0x5D
	tvc	%xcc,	0x3
	fbe,a	%fcc2,	loop_2783
	movre	%i7,	%i3,	%i5
	sdiv	%o4,	0x06E9,	%o5
	addccc	%i2,	%l4,	%g7
loop_2783:
	andcc	%l0,	%o2,	%i6
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x38] %asi,	%i1
	movl	%icc,	%i4,	%l6
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%g2
	fcmpgt16	%f24,	%f22,	%g4
	fmovdl	%icc,	%f14,	%f16
	edge32n	%o3,	%g6,	%o0
	fmovdg	%icc,	%f0,	%f28
	movvc	%xcc,	%l3,	%o1
	tpos	%icc,	0x0
	sub	%o7,	%l1,	%l5
	bpos,a,pt	%xcc,	loop_2784
	fbo,a	%fcc0,	loop_2785
	movgu	%icc,	%g5,	%g1
	set	0x73, %i4
	lduba	[%l7 + %i4] 0x89,	%o6
loop_2784:
	tge	%xcc,	0x0
loop_2785:
	mova	%xcc,	%l2,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i7,	%i3,	%i5
	movrgez	%o4,	0x1A7,	%g2
	set	0x27, %i1
	ldsba	[%l7 + %i1] 0x19,	%o5
	bcc,a	loop_2786
	sth	%l4,	[%l7 + 0x16]
	srax	%g7,	0x13,	%l0
	brnz,a	%o2,	loop_2787
loop_2786:
	movcs	%icc,	%i2,	%i1
	fornot2	%f24,	%f10,	%f20
	movrlez	%i6,	0x106,	%i4
loop_2787:
	fcmped	%fcc3,	%f4,	%f24
	fmovrdgz	%l6,	%f26,	%f14
	xor	%g3,	%o3,	%g4
	tvc	%icc,	0x3
	alignaddrl	%g6,	%o0,	%o1
	fmovse	%xcc,	%f14,	%f2
	srl	%l3,	0x14,	%l1
	subccc	%o7,	0x1337,	%g5
	fbe	%fcc0,	loop_2788
	be	%icc,	loop_2789
	tneg	%xcc,	0x7
	fones	%f4
loop_2788:
	or	%l5,	%o6,	%l2
loop_2789:
	fmovscs	%xcc,	%f5,	%f4
	fmovrdlz	%i0,	%f30,	%f24
	fbu	%fcc0,	loop_2790
	alignaddrl	%i7,	%g1,	%i3
	array16	%i5,	%g2,	%o4
	movneg	%xcc,	%o5,	%g7
loop_2790:
	fpackfix	%f24,	%f3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l0,	0x19ED,	%l4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%i2
	popc	0x12D5,	%i1
	fmovsle	%icc,	%f28,	%f21
	udiv	%o2,	0x1642,	%i6
	tn	%xcc,	0x7
	edge16ln	%i4,	%l6,	%g3
	fmovdcs	%xcc,	%f4,	%f5
	ble,a	loop_2791
	tcc	%icc,	0x6
	nop
	setx	loop_2792,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbg	%fcc2,	loop_2793
loop_2791:
	movrgez	%o3,	0x327,	%g4
	edge32	%o0,	%g6,	%o1
loop_2792:
	movneg	%xcc,	%l1,	%l3
loop_2793:
	xor	%g5,	0x106E,	%l5
	fandnot2	%f16,	%f26,	%f4
	movpos	%xcc,	%o7,	%o6
	fbuge	%fcc3,	loop_2794
	tvc	%xcc,	0x3
	ldsw	[%l7 + 0x40],	%i0
	fmovrdgz	%i7,	%f10,	%f28
loop_2794:
	fmovdne	%xcc,	%f2,	%f27
	srl	%l2,	%g1,	%i5
	movrne	%g2,	0x2ED,	%i3
	sdivx	%o4,	0x0BA7,	%o5
	fbue	%fcc2,	loop_2795
	stx	%g7,	[%l7 + 0x10]
	fors	%f6,	%f26,	%f7
	fxnors	%f6,	%f18,	%f25
loop_2795:
	fands	%f5,	%f4,	%f11
	edge32ln	%l0,	%l4,	%i1
	movl	%icc,	%i2,	%i6
	fbug	%fcc1,	loop_2796
	swap	[%l7 + 0x64],	%i4
	fsrc1	%f18,	%f2
	brgz	%o2,	loop_2797
loop_2796:
	fxnor	%f16,	%f22,	%f4
	sethi	0x08E8,	%l6
	xor	%g3,	0x0F8A,	%g4
loop_2797:
	fbg	%fcc0,	loop_2798
	te	%icc,	0x6
	movle	%icc,	%o3,	%o0
	fmovscc	%icc,	%f22,	%f29
loop_2798:
	umul	%o1,	0x13E3,	%l1
	set	0x38, %l0
	stxa	%l3,	[%l7 + %l0] 0x10
	movne	%icc,	%g5,	%l5
	brgz	%g6,	loop_2799
	add	%o6,	0x0E08,	%o7
	edge16n	%i0,	%l2,	%i7
	edge32	%g1,	%g2,	%i3
loop_2799:
	movcc	%xcc,	%o4,	%o5
	tsubcctv	%g7,	%i5,	%l4
	tcc	%xcc,	0x5
	smul	%i1,	0x079F,	%i2
	tcc	%xcc,	0x7
	fmovde	%icc,	%f6,	%f13
	fpadd32s	%f16,	%f4,	%f21
	xorcc	%i6,	%i4,	%l0
	movvc	%xcc,	%l6,	%o2
	andncc	%g3,	%o3,	%g4
	subc	%o1,	0x1049,	%o0
	movneg	%xcc,	%l3,	%l1
	ble,a,pt	%xcc,	loop_2800
	srl	%g5,	0x14,	%l5
	umulcc	%o6,	0x005F,	%o7
	tvs	%xcc,	0x1
loop_2800:
	andcc	%g6,	%i0,	%i7
	orn	%g1,	%g2,	%i3
	xorcc	%o4,	0x16E9,	%o5
	subccc	%l2,	%g7,	%i5
	tvs	%icc,	0x2
	sir	0x1E37
	xnor	%l4,	%i2,	%i6
	movrgz	%i4,	0x16F,	%i1
	fsrc1	%f8,	%f4
	brnz	%l6,	loop_2801
	fmovdpos	%icc,	%f0,	%f28
	edge16l	%l0,	%g3,	%o3
	fbu	%fcc3,	loop_2802
loop_2801:
	fsrc2	%f20,	%f28
	fmovse	%icc,	%f20,	%f12
	fzero	%f8
loop_2802:
	udivx	%g4,	0x1ECD,	%o2
	movg	%xcc,	%o1,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f20,	%f6,	%f4
	fmuld8sux16	%f23,	%f11,	%f2
	xor	%l1,	0x0626,	%l3
	fzero	%f2
	edge32n	%g5,	%l5,	%o6
	movleu	%xcc,	%o7,	%g6
	fmovsgu	%xcc,	%f31,	%f16
	tgu	%icc,	0x2
	fbge,a	%fcc2,	loop_2803
	fpack16	%f14,	%f18
	tvs	%xcc,	0x4
	fmovsvc	%icc,	%f23,	%f26
loop_2803:
	bgu,a	loop_2804
	smulcc	%i7,	0x1489,	%i0
	movvs	%xcc,	%g1,	%g2
	movrlz	%o4,	%o5,	%l2
loop_2804:
	fexpand	%f29,	%f2
	fbu	%fcc2,	loop_2805
	sdiv	%i3,	0x0E29,	%g7
	move	%icc,	%i5,	%i2
	fand	%f14,	%f20,	%f14
loop_2805:
	alignaddr	%i6,	%l4,	%i4
	edge8	%l6,	%l0,	%g3
	st	%f30,	[%l7 + 0x68]
	mulx	%i1,	%g4,	%o3
	set	0x10, %l4
	ldda	[%l7 + %l4] 0x22,	%o0
	sth	%o0,	[%l7 + 0x2E]
	taddcc	%o2,	0x0AB7,	%l3
	array8	%g5,	%l1,	%o6
	edge16n	%o7,	%g6,	%l5
	orncc	%i7,	%g1,	%g2
	fbge,a	%fcc0,	loop_2806
	fnot2s	%f16,	%f2
	fbule,a	%fcc1,	loop_2807
	add	%i0,	0x1908,	%o4
loop_2806:
	fbu	%fcc0,	loop_2808
	ta	%xcc,	0x3
loop_2807:
	sdivcc	%l2,	0x11AF,	%i3
	fmovdg	%icc,	%f19,	%f26
loop_2808:
	bgu,a,pn	%icc,	loop_2809
	bleu,a,pn	%icc,	loop_2810
	tcs	%xcc,	0x3
	umul	%o5,	0x1BD8,	%i5
loop_2809:
	tsubcc	%g7,	%i2,	%i6
loop_2810:
	movvs	%icc,	%i4,	%l4
	movrgez	%l6,	%l0,	%g3
	tvc	%icc,	0x4
	movrne	%g4,	%i1,	%o1
	movvc	%icc,	%o0,	%o2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%l3
	tge	%xcc,	0x1
	fandnot2s	%f12,	%f15,	%f28
	fxnors	%f7,	%f17,	%f27
	mulscc	%o3,	%g5,	%l1
	tge	%icc,	0x5
	movge	%icc,	%o7,	%g6
	bvs,a,pt	%icc,	loop_2811
	ldsb	[%l7 + 0x77],	%o6
	smul	%i7,	0x10D0,	%g1
	move	%icc,	%g2,	%i0
loop_2811:
	ba,a,pn	%icc,	loop_2812
	fmovsvc	%xcc,	%f27,	%f15
	subc	%l5,	0x103F,	%o4
	orncc	%i3,	%o5,	%i5
loop_2812:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l2,	%g7,	%i2
	fnot1s	%f13,	%f28
	tcs	%xcc,	0x6
	tvc	%icc,	0x1
	sllx	%i6,	%l4,	%l6
	fmul8x16al	%f28,	%f3,	%f0
	flush	%l7 + 0x20
	fcmpd	%fcc1,	%f20,	%f22
	brgez,a	%l0,	loop_2813
	xnor	%g3,	%g4,	%i1
	movge	%icc,	%o1,	%i4
	orn	%o0,	%l3,	%o2
loop_2813:
	membar	0x38
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g5,	%l1
	fmovrdlz	%o7,	%f16,	%f26
	fands	%f30,	%f16,	%f23
	fmovdge	%icc,	%f19,	%f29
	edge8l	%o3,	%o6,	%g6
	srl	%g1,	0x11,	%g2
	popc	%i0,	%l5
	andncc	%i7,	%i3,	%o5
	subc	%o4,	%l2,	%i5
	fmovdg	%icc,	%f0,	%f6
	fornot1s	%f13,	%f15,	%f7
	brgz	%i2,	loop_2814
	sir	0x0FE6
	fmovsl	%xcc,	%f15,	%f16
	nop
	setx loop_2815, %l0, %l1
	jmpl %l1, %g7
loop_2814:
	edge8n	%i6,	%l4,	%l0
	edge8n	%g3,	%g4,	%l6
	array32	%o1,	%i1,	%i4
loop_2815:
	fbuge	%fcc2,	loop_2816
	tleu	%icc,	0x7
	orn	%o0,	0x17BB,	%l3
	stbar
loop_2816:
	edge32n	%o2,	%g5,	%o7
	move	%xcc,	%o3,	%l1
	fcmpgt32	%f24,	%f10,	%o6
	tcs	%xcc,	0x5
	ba	loop_2817
	bg	loop_2818
	edge8ln	%g1,	%g6,	%g2
	andn	%i0,	0x069A,	%i7
loop_2817:
	movre	%l5,	%i3,	%o4
loop_2818:
	nop
	wr	%g0,	0x27,	%asi
	stha	%o5,	[%l7 + 0x18] %asi
	membar	#Sync
	tn	%xcc,	0x2
	bl,a,pt	%xcc,	loop_2819
	ldx	[%l7 + 0x28],	%i5
	nop
	setx	loop_2820,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brnz,a	%i2,	loop_2821
loop_2819:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz	%g7,	loop_2822
loop_2820:
	tn	%icc,	0x5
loop_2821:
	fbul,a	%fcc0,	loop_2823
	fbug,a	%fcc0,	loop_2824
loop_2822:
	sdivx	%i6,	0x04E7,	%l2
	fmovdne	%xcc,	%f26,	%f6
loop_2823:
	smulcc	%l0,	%l4,	%g4
loop_2824:
	fbg,a	%fcc2,	loop_2825
	movrgez	%g3,	%l6,	%o1
	fmovsa	%icc,	%f9,	%f23
	fnot1s	%f7,	%f15
loop_2825:
	orn	%i1,	%i4,	%o0
	edge8l	%o2,	%l3,	%g5
	edge32	%o7,	%l1,	%o6
	brgz	%g1,	loop_2826
	fmovrdgz	%o3,	%f18,	%f14
	and	%g6,	%i0,	%g2
	tcs	%xcc,	0x0
loop_2826:
	fmovscs	%icc,	%f28,	%f13
	std	%l4,	[%l7 + 0x60]
	tvc	%icc,	0x0
	movle	%icc,	%i3,	%i7
	edge32l	%o4,	%i5,	%o5
	movle	%xcc,	%g7,	%i2
	fmovrde	%i6,	%f22,	%f10
	fmovrdgez	%l2,	%f0,	%f22
	movn	%xcc,	%l0,	%g4
	tgu	%icc,	0x7
	tne	%icc,	0x2
	mulx	%l4,	0x1E0C,	%g3
	umulcc	%l6,	0x0491,	%i1
	movrgz	%o1,	0x00F,	%o0
	bgu,a,pn	%icc,	loop_2827
	edge32ln	%o2,	%i4,	%g5
	tle	%icc,	0x5
	fba	%fcc1,	loop_2828
loop_2827:
	pdist	%f6,	%f30,	%f24
	movleu	%icc,	%l3,	%o7
	nop
	setx	loop_2829,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2828:
	fpadd16	%f10,	%f6,	%f0
	bl	loop_2830
	or	%l1,	%g1,	%o3
loop_2829:
	fmovrde	%o6,	%f14,	%f2
	edge32n	%g6,	%i0,	%g2
loop_2830:
	mulx	%l5,	%i7,	%o4
	tleu	%xcc,	0x0
	srax	%i5,	%o5,	%i3
	udiv	%i2,	0x08D7,	%i6
	fmovsl	%xcc,	%f21,	%f8
	wr	%g0,	0x81,	%asi
	stda	%g6,	[%l7 + 0x50] %asi
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l2,	0x134D,	%l0
	sethi	0x0BA6,	%l4
	set	0x4C, %o0
	ldswa	[%l7 + %o0] 0x04,	%g4
	smul	%g3,	%i1,	%l6
	bvc,a,pn	%xcc,	loop_2831
	edge16n	%o1,	%o2,	%o0
	mova	%icc,	%i4,	%l3
	alignaddr	%o7,	%g5,	%g1
loop_2831:
	be,a,pt	%icc,	loop_2832
	taddcc	%l1,	0x16F2,	%o3
	fba,a	%fcc1,	loop_2833
	brz,a	%g6,	loop_2834
loop_2832:
	array8	%o6,	%i0,	%l5
	srax	%g2,	0x1B,	%o4
loop_2833:
	fandnot1s	%f6,	%f15,	%f21
loop_2834:
	ta	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f6,	%f24,	%f4
	addc	%i5,	0x17FD,	%i7
	fble	%fcc1,	loop_2835
	fmovscc	%xcc,	%f17,	%f20
	tvc	%xcc,	0x6
	fornot2s	%f17,	%f7,	%f1
loop_2835:
	addccc	%i3,	%o5,	%i6
	edge32n	%i2,	%l2,	%l0
	edge32n	%l4,	%g7,	%g4
	bg	%icc,	loop_2836
	fcmpes	%fcc0,	%f30,	%f25
	edge32n	%g3,	%i1,	%l6
	tne	%xcc,	0x7
loop_2836:
	fmul8x16au	%f0,	%f24,	%f24
	movrne	%o1,	0x0C5,	%o2
	movvc	%icc,	%o0,	%l3
	alignaddrl	%o7,	%i4,	%g5
	bge,a	loop_2837
	fpack32	%f18,	%f18,	%f16
	movge	%xcc,	%l1,	%g1
	fmul8ulx16	%f2,	%f18,	%f24
loop_2837:
	edge16n	%o3,	%g6,	%i0
	xnor	%l5,	%o6,	%g2
	fbl,a	%fcc3,	loop_2838
	edge16	%i5,	%o4,	%i3
	fpadd32s	%f9,	%f2,	%f16
	swap	[%l7 + 0x78],	%i7
loop_2838:
	movre	%o5,	%i6,	%l2
	ldsh	[%l7 + 0x66],	%l0
	umul	%l4,	%g7,	%g4
	fbg,a	%fcc3,	loop_2839
	tn	%icc,	0x5
	bvs,a,pn	%icc,	loop_2840
	bneg,a,pn	%icc,	loop_2841
loop_2839:
	sir	0x113F
	fornot2	%f30,	%f4,	%f28
loop_2840:
	fcmpes	%fcc3,	%f15,	%f22
loop_2841:
	fcmpeq16	%f14,	%f4,	%i2
	sll	%g3,	%i1,	%l6
	movrne	%o2,	0x101,	%o0
	movne	%xcc,	%o1,	%o7
	smul	%l3,	%g5,	%i4
	fnand	%f10,	%f6,	%f14
	ldsw	[%l7 + 0x50],	%l1
	set	0x60, %g5
	stda	%g0,	[%l7 + %g5] 0x04
	fornot2	%f4,	%f20,	%f2
	tsubcctv	%g6,	0x03D1,	%o3
	fmovrsgz	%i0,	%f26,	%f31
	fcmpne16	%f28,	%f8,	%o6
	movge	%icc,	%g2,	%i5
	taddcc	%o4,	%l5,	%i7
	set	0x5A, %i3
	lduha	[%l7 + %i3] 0x19,	%o5
	bn,a	%icc,	loop_2842
	udivcc	%i3,	0x18C1,	%l2
	bvc,a	loop_2843
	membar	0x57
loop_2842:
	fandnot1	%f6,	%f10,	%f28
	nop
	setx loop_2844, %l0, %l1
	jmpl %l1, %i6
loop_2843:
	xor	%l4,	0x06B9,	%l0
	array16	%g7,	%g4,	%g3
	fmovrslz	%i2,	%f0,	%f22
loop_2844:
	xor	%i1,	0x054E,	%o2
	fsrc1	%f24,	%f28
	xnor	%l6,	0x10F7,	%o0
	fornot1	%f28,	%f24,	%f14
	alignaddr	%o1,	%l3,	%g5
	edge32n	%o7,	%l1,	%g1
	bgu,pt	%icc,	loop_2845
	fmul8ulx16	%f18,	%f24,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i4,	%g6,	%o3
loop_2845:
	fmovde	%icc,	%f0,	%f2
	fmuld8ulx16	%f7,	%f2,	%f12
	lduh	[%l7 + 0x68],	%i0
	fzero	%f22
	fzero	%f6
	ldd	[%l7 + 0x20],	%f6
	sir	0x1090
	fnand	%f4,	%f8,	%f4
	bge,a,pn	%xcc,	loop_2846
	fmovsl	%icc,	%f3,	%f8
	fba,a	%fcc2,	loop_2847
	fcmped	%fcc1,	%f20,	%f16
loop_2846:
	movrlez	%g2,	0x259,	%i5
	std	%f12,	[%l7 + 0x18]
loop_2847:
	xor	%o4,	%o6,	%i7
	movneg	%xcc,	%o5,	%i3
	fxor	%f8,	%f18,	%f24
	mulx	%l2,	%i6,	%l4
	tge	%icc,	0x0
	movgu	%xcc,	%l0,	%l5
	taddcc	%g4,	%g3,	%i2
	tvs	%icc,	0x6
	umulcc	%g7,	0x0EFF,	%i1
	fbule,a	%fcc2,	loop_2848
	sethi	0x089C,	%o2
	edge16l	%l6,	%o1,	%l3
	srax	%g5,	0x11,	%o7
loop_2848:
	edge16l	%o0,	%l1,	%g1
	edge32	%i4,	%g6,	%i0
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	te	%xcc,	0x0
	bleu,pt	%xcc,	loop_2849
	sdivx	%o3,	0x14DC,	%g2
	tcs	%icc,	0x7
	srax	%o4,	0x1A,	%i5
loop_2849:
	movle	%xcc,	%i7,	%o6
	ldd	[%l7 + 0x30],	%f28
	fmovdg	%icc,	%f1,	%f17
	bcc	%xcc,	loop_2850
	fnegd	%f20,	%f12
	fand	%f14,	%f28,	%f28
	fsrc1	%f20,	%f20
loop_2850:
	sethi	0x0DCA,	%o5
	sub	%l2,	0x054A,	%i3
	movge	%icc,	%l4,	%i6
	fbug,a	%fcc0,	loop_2851
	bpos,a	%xcc,	loop_2852
	bgu,a	loop_2853
	tg	%xcc,	0x7
loop_2851:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2852:
	nop
	wr	%g0,	0x04,	%asi
	stha	%l0,	[%l7 + 0x7A] %asi
loop_2853:
	tvs	%xcc,	0x0
	fmovd	%f26,	%f2
	fcmpne16	%f30,	%f14,	%g4
	fornot1	%f0,	%f4,	%f24
	edge8	%g3,	%l5,	%g7
	nop
	set	0x5E, %i2
	lduh	[%l7 + %i2],	%i1
	taddcc	%o2,	0x039F,	%i2
	fbge,a	%fcc3,	loop_2854
	fornot2s	%f12,	%f16,	%f28
	membar	0x55
	sdivx	%o1,	0x04CA,	%l6
loop_2854:
	fand	%f2,	%f4,	%f24
	edge32l	%l3,	%g5,	%o7
	movre	%o0,	%g1,	%l1
	wr	%g0,	0x2a,	%asi
	stha	%i4,	[%l7 + 0x58] %asi
	membar	#Sync
	tsubcctv	%g6,	0x15A9,	%i0
	fone	%f26
	sethi	0x1AC7,	%o3
	fcmpgt16	%f0,	%f14,	%o4
	movrgz	%i5,	0x211,	%g2
	ta	%xcc,	0x0
	movleu	%xcc,	%i7,	%o6
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l2,	%i3
	for	%f18,	%f30,	%f2
	movcc	%xcc,	%l4,	%i6
	fbne	%fcc2,	loop_2855
	fmovrdgez	%l0,	%f20,	%f24
	movneg	%icc,	%g4,	%g3
	udiv	%o5,	0x1F71,	%l5
loop_2855:
	smul	%g7,	%o2,	%i1
	ba,a	%xcc,	loop_2856
	addccc	%o1,	0x01A9,	%l6
	subccc	%l3,	%g5,	%i2
	fmovsleu	%icc,	%f9,	%f0
loop_2856:
	movn	%xcc,	%o7,	%o0
	tne	%icc,	0x5
	fmovrsgez	%g1,	%f27,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f17,	%f12
	edge16l	%l1,	%g6,	%i4
	flush	%l7 + 0x70
	membar	0x61
	ldstub	[%l7 + 0x58],	%i0
	andncc	%o4,	%o3,	%g2
	tn	%xcc,	0x5
	tpos	%xcc,	0x1
	tleu	%icc,	0x1
	addc	%i5,	%o6,	%i7
	movleu	%icc,	%l2,	%l4
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x10] %asi,	%f27
	fbug,a	%fcc2,	loop_2857
	sir	0x0DB9
	or	%i6,	0x02D9,	%l0
	wr	%g0,	0x18,	%asi
	stda	%g4,	[%l7 + 0x58] %asi
loop_2857:
	fmuld8sux16	%f21,	%f29,	%f6
	tpos	%xcc,	0x4
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
	alignaddr	%o5,	%l5,	%g7
	fbug	%fcc1,	loop_2858
	fnands	%f22,	%f27,	%f6
	srlx	%g3,	0x00,	%i1
	tneg	%xcc,	0x5
loop_2858:
	sethi	0x10E2,	%o1
	sllx	%l6,	%o2,	%l3
	edge32	%i2,	%o7,	%o0
	andcc	%g1,	%g5,	%l1
	tgu	%icc,	0x0
	bshuffle	%f0,	%f12,	%f14
	edge8ln	%i4,	%i0,	%g6
	xorcc	%o4,	%o3,	%g2
	movge	%icc,	%i5,	%i7
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tn	%xcc,	0x5
	fmovsg	%xcc,	%f19,	%f26
	set	0x58, %g6
	stda	%l2,	[%l7 + %g6] 0x2f
	membar	#Sync
	or	%o6,	0x1B88,	%l4
	movvs	%icc,	%i6,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f12,	%f28,	%f8
	sub	%i3,	0x181B,	%g4
	fmovsge	%xcc,	%f29,	%f14
	fblg	%fcc3,	loop_2859
	array16	%o5,	%l5,	%g7
	umulcc	%g3,	0x1DB7,	%i1
	movcc	%icc,	%o1,	%o2
loop_2859:
	fble,a	%fcc3,	loop_2860
	fbo	%fcc2,	loop_2861
	srax	%l3,	%i2,	%o7
	fcmpgt32	%f4,	%f4,	%l6
loop_2860:
	udivcc	%g1,	0x1364,	%o0
loop_2861:
	mulscc	%l1,	0x1622,	%i4
	call	loop_2862
	edge32	%g5,	%i0,	%g6
	edge32l	%o3,	%o4,	%g2
	edge8ln	%i7,	%l2,	%o6
loop_2862:
	fmovrde	%i5,	%f2,	%f28
	fandnot1	%f14,	%f0,	%f14
	umul	%i6,	0x0214,	%l4
	andcc	%i3,	0x1D7E,	%l0
	andcc	%g4,	%l5,	%o5
	fpadd16s	%f14,	%f29,	%f4
	std	%f24,	[%l7 + 0x58]
	bleu,pn	%xcc,	loop_2863
	bvc,a,pn	%xcc,	loop_2864
	xnor	%g7,	0x0925,	%g3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o1
loop_2863:
	fbl	%fcc1,	loop_2865
loop_2864:
	tgu	%icc,	0x4
	set	0x3C, %g4
	sta	%f2,	[%l7 + %g4] 0x88
loop_2865:
	fbl,a	%fcc2,	loop_2866
	movle	%icc,	%i1,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0D23,	%i2
loop_2866:
	fcmpne16	%f20,	%f10,	%l3
	umulcc	%o7,	0x0CDD,	%g1
	fones	%f0
	fzero	%f26
	flush	%l7 + 0x5C
	subc	%l6,	%l1,	%i4
	fone	%f16
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x0C] %asi,	%f30
	edge8	%o0,	%i0,	%g5
	ldsh	[%l7 + 0x3A],	%o3
	fmovdg	%icc,	%f28,	%f4
	fba,a	%fcc2,	loop_2867
	fbn,a	%fcc3,	loop_2868
	movneg	%xcc,	%g6,	%g2
	wr	%g0,	0x2b,	%asi
	stba	%i7,	[%l7 + 0x08] %asi
	membar	#Sync
loop_2867:
	fbug,a	%fcc3,	loop_2869
loop_2868:
	edge32l	%o4,	%o6,	%i5
	andn	%i6,	0x002D,	%l2
	xorcc	%l4,	0x10E3,	%l0
loop_2869:
	ta	%icc,	0x6
	pdist	%f28,	%f6,	%f22
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x54] %asi,	%i3
	fnors	%f18,	%f29,	%f3
	move	%icc,	%g4,	%o5
	bge,a	%xcc,	loop_2870
	lduh	[%l7 + 0x4E],	%l5
	bl,pn	%icc,	loop_2871
	udivcc	%g7,	0x0771,	%o1
loop_2870:
	edge8n	%i1,	%g3,	%i2
	brz,a	%l3,	loop_2872
loop_2871:
	movrgz	%o7,	%g1,	%o2
	movrgz	%l1,	0x34C,	%i4
	movgu	%icc,	%o0,	%l6
loop_2872:
	edge32l	%i0,	%o3,	%g6
	ldd	[%l7 + 0x10],	%g4
	udiv	%i7,	0x1468,	%g2
	sub	%o4,	0x0155,	%i5
	srax	%i6,	%l2,	%o6
	fpadd16	%f14,	%f24,	%f20
	be,a	%xcc,	loop_2873
	umul	%l4,	0x01C8,	%i3
	umul	%g4,	%l0,	%l5
	fcmpd	%fcc3,	%f12,	%f0
loop_2873:
	nop
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x1e,	%f0
	or	%o5,	0x0D43,	%g7
	addcc	%i1,	%o1,	%i2
	edge16l	%g3,	%o7,	%l3
	andn	%o2,	0x06ED,	%g1
	sub	%i4,	0x1E32,	%l1
	tgu	%xcc,	0x7
	umulcc	%l6,	%i0,	%o3
	edge32	%o0,	%g5,	%g6
	fcmpeq16	%f30,	%f30,	%g2
	ldsh	[%l7 + 0x62],	%i7
	movrgez	%o4,	0x002,	%i6
	edge16n	%l2,	%i5,	%l4
	edge8	%i3,	%o6,	%l0
	move	%xcc,	%g4,	%l5
	bvs,pn	%xcc,	loop_2874
	fbo,a	%fcc3,	loop_2875
	ble,a,pt	%icc,	loop_2876
	movpos	%icc,	%o5,	%g7
loop_2874:
	tvs	%xcc,	0x6
loop_2875:
	ldsb	[%l7 + 0x70],	%i1
loop_2876:
	fexpand	%f26,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,a,pt	%xcc,	loop_2877
	array8	%i2,	%g3,	%o7
	fmovdge	%xcc,	%f21,	%f5
	movcc	%xcc,	%o1,	%o2
loop_2877:
	nop
	setx	loop_2878,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tge	%icc,	0x2
	brnz	%l3,	loop_2879
	nop
	setx	loop_2880,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2878:
	andcc	%i4,	0x177D,	%g1
	fnot2s	%f11,	%f21
loop_2879:
	umul	%l1,	0x1469,	%l6
loop_2880:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
	smulcc	%i0,	%o0,	%g5
	fmovdpos	%xcc,	%f0,	%f11
	taddcc	%g6,	%g2,	%o4
	tg	%icc,	0x7
	fcmped	%fcc3,	%f20,	%f14
	orncc	%i6,	%l2,	%i7
	or	%l4,	0x11F0,	%i5
	addc	%i3,	0x14A6,	%l0
	fbe	%fcc0,	loop_2881
	orncc	%o6,	0x12C8,	%l5
	fmuld8ulx16	%f28,	%f7,	%f10
	tcc	%xcc,	0x3
loop_2881:
	fxnors	%f13,	%f21,	%f17
	set	0x6C, %l6
	swapa	[%l7 + %l6] 0x04,	%o5
	tcc	%icc,	0x5
	movrlz	%g4,	%g7,	%i2
	edge16ln	%g3,	%o7,	%o1
	edge32l	%o2,	%i1,	%i4
	tvs	%icc,	0x6
	fandnot1	%f12,	%f14,	%f2
	movl	%xcc,	%l3,	%l1
	te	%icc,	0x7
	std	%g0,	[%l7 + 0x58]
	smulcc	%o3,	0x0360,	%l6
	movvs	%icc,	%o0,	%g5
	mulscc	%i0,	%g2,	%o4
	stx	%i6,	[%l7 + 0x60]
	addcc	%l2,	0x01C2,	%i7
	bleu,a	loop_2882
	movre	%g6,	%i5,	%i3
	edge8ln	%l0,	%o6,	%l4
	bn	loop_2883
loop_2882:
	fpadd32s	%f12,	%f6,	%f16
	subc	%o5,	%g4,	%l5
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%g7
loop_2883:
	or	%i2,	0x0B68,	%g3
	fabsd	%f2,	%f14
	bcs	loop_2884
	fpmerge	%f28,	%f6,	%f10
	fmovde	%xcc,	%f16,	%f9
	taddcc	%o7,	%o1,	%i1
loop_2884:
	tne	%xcc,	0x7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x89,	%o2,	%l3
	fbu	%fcc1,	loop_2885
	fmovsge	%xcc,	%f4,	%f10
	set	0x30, %i6
	lda	[%l7 + %i6] 0x88,	%f6
loop_2885:
	movg	%xcc,	%l1,	%i4
	fmovspos	%xcc,	%f3,	%f15
	orn	%g1,	0x08EC,	%l6
	tn	%xcc,	0x2
	bvc,a	%xcc,	loop_2886
	edge32l	%o0,	%o3,	%g5
	fmovsl	%icc,	%f17,	%f17
	movge	%icc,	%g2,	%o4
loop_2886:
	nop
	wr	%g0,	0x80,	%asi
	stha	%i0,	[%l7 + 0x74] %asi
	andcc	%i6,	0x0FC4,	%l2
	movg	%icc,	%i7,	%i5
	fba,a	%fcc0,	loop_2887
	movrlz	%i3,	%g6,	%o6
	movrgz	%l4,	0x31F,	%o5
	srl	%l0,	0x09,	%g4
loop_2887:
	stw	%l5,	[%l7 + 0x7C]
	fcmpeq16	%f8,	%f18,	%i2
	xor	%g7,	0x04E1,	%g3
	sth	%o7,	[%l7 + 0x32]
	addcc	%i1,	0x1D4D,	%o1
	fmovrsgz	%o2,	%f23,	%f22
	array16	%l1,	%i4,	%l3
	bcc	loop_2888
	edge32ln	%g1,	%l6,	%o0
	movle	%icc,	%o3,	%g5
	movne	%icc,	%g2,	%o4
loop_2888:
	edge16l	%i0,	%i6,	%i7
	sra	%i5,	0x11,	%l2
	movrlz	%i3,	0x159,	%o6
	tsubcc	%l4,	0x16A0,	%g6
	fmovsge	%xcc,	%f5,	%f9
	sth	%l0,	[%l7 + 0x56]
	addccc	%g4,	%l5,	%i2
	mulscc	%g7,	0x0CBA,	%g3
	ldsw	[%l7 + 0x44],	%o5
	edge32ln	%i1,	%o7,	%o1
	bg	loop_2889
	movg	%xcc,	%l1,	%o2
	xnorcc	%l3,	%g1,	%l6
	fbne,a	%fcc1,	loop_2890
loop_2889:
	fcmpeq16	%f4,	%f30,	%i4
	fmovsge	%icc,	%f10,	%f3
	tsubcctv	%o3,	0x195C,	%o0
loop_2890:
	fmovde	%icc,	%f19,	%f26
	tleu	%icc,	0x3
	lduw	[%l7 + 0x38],	%g2
	umul	%g5,	%i0,	%o4
	sra	%i7,	0x17,	%i6
	edge16n	%l2,	%i5,	%o6
	nop
	setx loop_2891, %l0, %l1
	jmpl %l1, %l4
	edge16n	%g6,	%l0,	%i3
	umulcc	%g4,	0x0152,	%l5
	tvc	%icc,	0x6
loop_2891:
	nop
	setx	loop_2892,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%i2,	%g7,	%o5
	sir	0x00A8
	tsubcc	%g3,	%i1,	%o1
loop_2892:
	movcs	%icc,	%o7,	%l1
	edge8	%o2,	%g1,	%l6
	edge8n	%l3,	%o3,	%i4
	tn	%icc,	0x1
	movrgez	%g2,	%g5,	%o0
	fmovdle	%xcc,	%f9,	%f11
	orn	%o4,	%i0,	%i7
	fmovsvc	%xcc,	%f20,	%f18
	xnorcc	%l2,	0x00FD,	%i5
	movleu	%icc,	%i6,	%l4
	fcmpgt32	%f6,	%f30,	%o6
	fbe	%fcc3,	loop_2893
	move	%xcc,	%l0,	%i3
	udivx	%g4,	0x039C,	%l5
	edge32l	%g6,	%i2,	%o5
loop_2893:
	fbl,a	%fcc0,	loop_2894
	bg,a,pn	%xcc,	loop_2895
	movrgez	%g7,	0x0ED,	%i1
	bg,pn	%xcc,	loop_2896
loop_2894:
	edge32n	%g3,	%o1,	%o7
loop_2895:
	mova	%xcc,	%l1,	%g1
	fcmpne32	%f18,	%f8,	%l6
loop_2896:
	tpos	%icc,	0x3
	edge8l	%o2,	%l3,	%i4
	edge16n	%o3,	%g2,	%g5
	array32	%o4,	%i0,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f26,	%f8,	%f20
	movvs	%icc,	%o0,	%l2
	movrgz	%i6,	%i5,	%l4
	tcc	%icc,	0x7
	bl	%xcc,	loop_2897
	addc	%o6,	0x0CF7,	%i3
	sethi	0x1539,	%g4
	sethi	0x1D06,	%l0
loop_2897:
	fmovdvc	%icc,	%f9,	%f16
	fmovsle	%xcc,	%f18,	%f31
	edge32	%g6,	%i2,	%l5
	brnz,a	%g7,	loop_2898
	fbe	%fcc3,	loop_2899
	edge8ln	%i1,	%g3,	%o1
	add	%o5,	%l1,	%g1
loop_2898:
	fbug,a	%fcc2,	loop_2900
loop_2899:
	tcs	%xcc,	0x0
	addc	%l6,	0x010A,	%o7
	taddcctv	%o2,	%l3,	%o3
loop_2900:
	movleu	%xcc,	%g2,	%g5
	andcc	%i4,	0x1415,	%o4
	bn,a,pt	%xcc,	loop_2901
	fbul,a	%fcc0,	loop_2902
	array8	%i0,	%i7,	%o0
	array8	%l2,	%i6,	%l4
loop_2901:
	movne	%icc,	%o6,	%i5
loop_2902:
	nop
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0xf0,	%f0
	fmovdneg	%xcc,	%f11,	%f9
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x72] %asi,	%i3
	ldsw	[%l7 + 0x6C],	%g4
	add	%l7,	0x44,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] %asi,	%l0,	%i2
	bpos,a,pt	%icc,	loop_2903
	swap	[%l7 + 0x34],	%g6
	fbuge	%fcc3,	loop_2904
	faligndata	%f14,	%f4,	%f30
loop_2903:
	subccc	%g7,	0x1727,	%l5
	orcc	%i1,	%g3,	%o5
loop_2904:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f4,	[%l7 + 0x3C] %asi
	edge16n	%l1,	%o1,	%g1
	tvc	%icc,	0x4
	fmovs	%f20,	%f17
	movvs	%xcc,	%o7,	%o2
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
	srax	%l6,	0x0D,	%o3
	sethi	0x0E62,	%g2
	edge8	%g5,	%i4,	%l3
	taddcctv	%i0,	%o4,	%o0
	fmovdcc	%xcc,	%f1,	%f5
	popc	0x0C93,	%i7
	fcmple16	%f30,	%f10,	%i6
	movrlz	%l2,	0x228,	%l4
	tneg	%xcc,	0x4
	bvs,a	loop_2905
	edge32l	%i5,	%o6,	%i3
	and	%l0,	%g4,	%g6
	ldsb	[%l7 + 0x60],	%g7
loop_2905:
	edge32ln	%l5,	%i2,	%i1
	add	%o5,	%l1,	%g3
	fmovspos	%icc,	%f11,	%f31
	bshuffle	%f20,	%f14,	%f20
	movneg	%icc,	%o1,	%g1
	tcc	%icc,	0x4
	orcc	%o7,	%o2,	%o3
	ld	[%l7 + 0x30],	%f22
	sdivcc	%g2,	0x1713,	%g5
	fmovdcs	%icc,	%f4,	%f7
	tg	%xcc,	0x2
	taddcctv	%l6,	0x1737,	%i4
	fmovrslez	%l3,	%f15,	%f12
	fbu	%fcc1,	loop_2906
	movvs	%icc,	%o4,	%o0
	tge	%icc,	0x3
	udivx	%i0,	0x1A59,	%i6
loop_2906:
	movgu	%icc,	%i7,	%l2
	fnands	%f13,	%f14,	%f19
	fmovdcs	%xcc,	%f18,	%f25
	fmul8x16au	%f19,	%f1,	%f14
	subc	%l4,	%i5,	%i3
	array8	%l0,	%g4,	%o6
	udivx	%g6,	0x142C,	%l5
	brnz,a	%i2,	loop_2907
	fmul8x16au	%f18,	%f19,	%f4
	sir	0x0A9B
	or	%g7,	0x1E02,	%o5
loop_2907:
	fxnor	%f12,	%f20,	%f30
	edge32l	%i1,	%l1,	%g3
	set	0x60, %o7
	ldda	[%l7 + %o7] 0x2b,	%o0
	st	%f27,	[%l7 + 0x10]
	tne	%icc,	0x3
	orncc	%o7,	%g1,	%o2
	fble,a	%fcc0,	loop_2908
	xorcc	%o3,	%g2,	%g5
	bneg,a	loop_2909
	fmul8x16	%f25,	%f20,	%f24
loop_2908:
	fmovsl	%xcc,	%f18,	%f7
	andn	%i4,	%l6,	%o4
loop_2909:
	sdivx	%l3,	0x1E8A,	%i0
	xor	%i6,	0x02E8,	%i7
	movg	%xcc,	%o0,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%i5,	loop_2910
	fnegs	%f30,	%f27
	xorcc	%l2,	%i3,	%l0
	ble	loop_2911
loop_2910:
	bleu	%icc,	loop_2912
	andcc	%o6,	%g6,	%g4
	movle	%xcc,	%l5,	%g7
loop_2911:
	nop
	set	0x4D, %g7
	ldstuba	[%l7 + %g7] 0x18,	%o5
loop_2912:
	flush	%l7 + 0x1C
	andcc	%i1,	%i2,	%l1
	addccc	%g3,	%o1,	%g1
	subcc	%o2,	%o3,	%o7
	fbge,a	%fcc0,	loop_2913
	fbg,a	%fcc3,	loop_2914
	andn	%g2,	%i4,	%g5
	srl	%l6,	0x04,	%o4
loop_2913:
	and	%i0,	0x183E,	%l3
loop_2914:
	fsrc2s	%f13,	%f27
	srlx	%i6,	%o0,	%i7
	stb	%l4,	[%l7 + 0x4E]
	udiv	%l2,	0x1F6D,	%i5
	sll	%i3,	0x13,	%o6
	srlx	%g6,	0x1B,	%g4
	movre	%l5,	0x1FA,	%l0
	wr	%g0,	0x0c,	%asi
	stba	%o5,	[%l7 + 0x2B] %asi
	ld	[%l7 + 0x0C],	%f30
	srlx	%i1,	0x0B,	%i2
	sra	%g7,	%l1,	%o1
	smulcc	%g1,	%o2,	%o3
	movcc	%icc,	%g3,	%o7
	movgu	%xcc,	%g2,	%g5
	orncc	%l6,	0x1288,	%o4
	movgu	%icc,	%i0,	%i4
	fmovdneg	%xcc,	%f26,	%f4
	udivx	%l3,	0x07D9,	%i6
	udivcc	%o0,	0x0B81,	%l4
	fmovrse	%i7,	%f11,	%f22
	fsrc1s	%f22,	%f27
	xor	%l2,	%i3,	%i5
	popc	0x1883,	%g6
	ld	[%l7 + 0x14],	%f13
	umul	%o6,	0x0962,	%g4
	movrne	%l0,	%l5,	%o5
	set	0x40, %l2
	sta	%f2,	[%l7 + %l2] 0x11
	array32	%i1,	%g7,	%l1
	sllx	%o1,	0x0E,	%i2
	set	0x60, %o4
	stda	%o2,	[%l7 + %o4] 0x10
	mulscc	%g1,	0x1B4F,	%g3
	edge32	%o7,	%g2,	%o3
	fmovrdgez	%g5,	%f20,	%f28
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o4,	%i0
	tsubcctv	%l6,	0x1247,	%i4
	fmovdleu	%xcc,	%f20,	%f19
	wr	%g0,	0x88,	%asi
	stda	%i6,	[%l7 + 0x40] %asi
	array8	%o0,	%l3,	%i7
	popc	0x0E42,	%l4
	bge,pt	%xcc,	loop_2915
	edge32n	%i3,	%i5,	%l2
	movrgez	%g6,	%g4,	%l0
	array32	%l5,	%o5,	%o6
loop_2915:
	fcmpne32	%f2,	%f16,	%i1
	bne,pn	%icc,	loop_2916
	movcc	%xcc,	%l1,	%o1
	array8	%i2,	%o2,	%g7
	te	%xcc,	0x7
loop_2916:
	and	%g1,	0x1DF0,	%o7
	sethi	0x125C,	%g3
	fmovrsgz	%o3,	%f29,	%f3
	fmul8sux16	%f30,	%f30,	%f8
	set	0x58, %i0
	lduha	[%l7 + %i0] 0x04,	%g5
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movrlez	%g2,	%o4,	%i0
	fcmpes	%fcc0,	%f11,	%f7
	stw	%l6,	[%l7 + 0x34]
	fpack32	%f14,	%f26,	%f12
	movrne	%i4,	0x104,	%i6
	ldub	[%l7 + 0x19],	%o0
	movcc	%icc,	%l3,	%i7
	fpsub16	%f14,	%f4,	%f12
	fcmpne32	%f18,	%f4,	%i3
	swap	[%l7 + 0x10],	%l4
	movne	%icc,	%l2,	%i5
	bcc,a	%icc,	loop_2917
	movrne	%g4,	0x14A,	%l0
	brlz	%l5,	loop_2918
	movleu	%icc,	%g6,	%o5
loop_2917:
	fbge,a	%fcc1,	loop_2919
	tpos	%xcc,	0x7
loop_2918:
	fmovs	%f7,	%f8
	membar	0x29
loop_2919:
	sra	%o6,	%i1,	%o1
	fbne	%fcc0,	loop_2920
	tleu	%icc,	0x7
	ldstub	[%l7 + 0x7D],	%i2
	fzero	%f20
loop_2920:
	movvc	%xcc,	%l1,	%o2
	subcc	%g1,	0x1E78,	%o7
	fmovsle	%xcc,	%f16,	%f17
	fmovda	%xcc,	%f9,	%f8
	fmovdneg	%xcc,	%f25,	%f11
	movvc	%icc,	%g7,	%g3
	tpos	%xcc,	0x4
	tle	%xcc,	0x5
	movg	%icc,	%o3,	%g2
	tgu	%icc,	0x3
	movrlez	%g5,	%o4,	%l6
	xnor	%i0,	0x148F,	%i6
	bpos	loop_2921
	tcs	%icc,	0x6
	tcs	%xcc,	0x5
	fbge,a	%fcc2,	loop_2922
loop_2921:
	movge	%icc,	%i4,	%o0
	fmovrdgez	%l3,	%f4,	%f0
	movn	%xcc,	%i7,	%l4
loop_2922:
	movre	%l2,	0x060,	%i3
	srl	%g4,	0x0D,	%i5
	xnorcc	%l0,	%g6,	%l5
	bge,a	%icc,	loop_2923
	fandnot1	%f24,	%f4,	%f6
	orcc	%o6,	%i1,	%o5
	or	%o1,	%i2,	%l1
loop_2923:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x27] %asi,	%g1
	brgez,a	%o2,	loop_2924
	udiv	%o7,	0x0E2C,	%g7
	edge8n	%o3,	%g2,	%g3
	fbul,a	%fcc2,	loop_2925
loop_2924:
	fmovd	%f24,	%f20
	orncc	%o4,	0x1D33,	%l6
	mulx	%i0,	%g5,	%i6
loop_2925:
	tpos	%icc,	0x2
	movg	%icc,	%o0,	%i4
	tvc	%xcc,	0x2
	ldstub	[%l7 + 0x15],	%i7
	array32	%l4,	%l2,	%i3
	fmovde	%icc,	%f23,	%f25
	tg	%xcc,	0x7
	tle	%xcc,	0x3
	or	%g4,	0x078C,	%l3
	udivcc	%l0,	0x00F3,	%i5
	udivcc	%g6,	0x14FC,	%l5
	array32	%o6,	%i1,	%o5
	fmovsvs	%icc,	%f22,	%f13
	taddcc	%o1,	%i2,	%g1
	xnorcc	%o2,	%o7,	%g7
	fxors	%f17,	%f18,	%f11
	movrne	%l1,	0x0D1,	%g2
	sllx	%o3,	%g3,	%o4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x17] %asi,	%l6
	fsrc1s	%f31,	%f8
	edge16n	%g5,	%i0,	%i6
	sir	0x0486
	te	%icc,	0x1
	fmovsle	%icc,	%f30,	%f12
	taddcctv	%o0,	0x11BF,	%i4
	membar	0x5F
	fsrc1	%f0,	%f24
	fmovdgu	%xcc,	%f13,	%f24
	tle	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l4,	%l2
	fmovrse	%i3,	%f25,	%f7
	fmovdvs	%icc,	%f23,	%f6
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x81,	%f0
	fmovdle	%xcc,	%f30,	%f15
	edge32n	%g4,	%l3,	%l0
	tne	%icc,	0x0
	subcc	%i5,	0x0FC7,	%i7
	fbne	%fcc2,	loop_2926
	te	%xcc,	0x4
	edge16ln	%g6,	%o6,	%l5
	set	0x7D, %l5
	lduba	[%l7 + %l5] 0x0c,	%o5
loop_2926:
	addccc	%i1,	0x1EB5,	%i2
	xnor	%o1,	%g1,	%o2
	fpadd32	%f2,	%f0,	%f30
	array32	%g7,	%o7,	%g2
	add	%l1,	%o3,	%g3
	ldsh	[%l7 + 0x1A],	%l6
	movl	%xcc,	%o4,	%i0
	fpadd32s	%f22,	%f24,	%f6
	fpack16	%f28,	%f18
	or	%i6,	0x03B6,	%g5
	siam	0x3
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	xnor	%o0,	0x0BA9,	%l4
	edge32n	%l2,	%i3,	%i4
	brlez,a	%g4,	loop_2927
	fmovse	%icc,	%f8,	%f29
	or	%l0,	%i5,	%i7
	array16	%l3,	%o6,	%l5
loop_2927:
	fpsub32	%f24,	%f2,	%f16
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldub	[%l7 + 0x16],	%g6
	fcmpeq16	%f2,	%f26,	%i1
	addc	%o5,	0x03B6,	%o1
	fones	%f29
	bg,pt	%icc,	loop_2928
	brnz,a	%g1,	loop_2929
	sdivcc	%o2,	0x1623,	%i2
	be,pn	%xcc,	loop_2930
loop_2928:
	lduw	[%l7 + 0x48],	%g7
loop_2929:
	membar	0x76
	bn,a	%icc,	loop_2931
loop_2930:
	addccc	%g2,	%o7,	%o3
	ldsb	[%l7 + 0x1E],	%l1
	ldx	[%l7 + 0x38],	%l6
loop_2931:
	bcc,a,pn	%icc,	loop_2932
	fpack16	%f30,	%f22
	sllx	%o4,	0x0B,	%i0
	fpackfix	%f12,	%f27
loop_2932:
	fmovrdgez	%g3,	%f8,	%f12
	orncc	%g5,	%o0,	%i6
	set	0x69, %o2
	ldsba	[%l7 + %o2] 0x04,	%l2
	mova	%icc,	%i3,	%i4
	movle	%icc,	%l4,	%l0
	ble,pt	%icc,	loop_2933
	and	%i5,	%g4,	%i7
	movne	%xcc,	%o6,	%l5
	sethi	0x0A76,	%g6
loop_2933:
	andcc	%l3,	0x0201,	%o5
	tn	%xcc,	0x7
	fmovsa	%icc,	%f16,	%f26
	addcc	%i1,	0x0A48,	%o1
	stx	%g1,	[%l7 + 0x38]
	edge8	%o2,	%i2,	%g7
	add	%o7,	0x1521,	%o3
	udivcc	%g2,	0x1B73,	%l6
	fpadd16	%f12,	%f10,	%f4
	movleu	%xcc,	%l1,	%o4
	array32	%g3,	%g5,	%o0
	mulx	%i0,	%i6,	%l2
	fxnor	%f8,	%f4,	%f20
	movrlez	%i4,	0x1E5,	%l4
	fbul	%fcc0,	loop_2934
	xorcc	%l0,	%i3,	%g4
	orcc	%i5,	%i7,	%l5
	brlz	%o6,	loop_2935
loop_2934:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f6,	%f2,	%g6
	smul	%l3,	%o5,	%o1
loop_2935:
	fmovrsne	%g1,	%f11,	%f20
	fmovs	%f28,	%f2
	bneg,a,pn	%icc,	loop_2936
	stb	%i1,	[%l7 + 0x51]
	fpack32	%f10,	%f28,	%f14
	fba,a	%fcc3,	loop_2937
loop_2936:
	fmul8x16	%f13,	%f0,	%f12
	tn	%icc,	0x7
	mova	%xcc,	%o2,	%i2
loop_2937:
	fsrc2s	%f14,	%f6
	fmovrdne	%o7,	%f18,	%f28
	movleu	%icc,	%g7,	%g2
	ldx	[%l7 + 0x38],	%o3
	edge8ln	%l6,	%l1,	%g3
	tsubcctv	%o4,	%g5,	%i0
	tn	%icc,	0x4
	tgu	%xcc,	0x0
	tvc	%icc,	0x5
	wr	%g0,	0x11,	%asi
	stwa	%i6,	[%l7 + 0x60] %asi
	xnorcc	%l2,	0x0313,	%o0
	fmovdne	%icc,	%f13,	%f19
	tsubcctv	%l4,	0x0A69,	%i4
	std	%f2,	[%l7 + 0x08]
	wr	%g0,	0x80,	%asi
	stha	%i3,	[%l7 + 0x6E] %asi
	array8	%g4,	%l0,	%i5
	edge8ln	%i7,	%l5,	%g6
	fbge,a	%fcc1,	loop_2938
	smulcc	%l3,	0x1292,	%o6
	addcc	%o1,	0x1C7E,	%g1
	fba,a	%fcc1,	loop_2939
loop_2938:
	sra	%o5,	%o2,	%i2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x34] %asi,	%i1
loop_2939:
	xor	%g7,	0x109D,	%o7
	move	%xcc,	%o3,	%l6
	array16	%l1,	%g2,	%o4
	fmovsa	%icc,	%f26,	%f27
	siam	0x1
	popc	0x1840,	%g3
	tvs	%icc,	0x2
	smul	%i0,	0x0940,	%g5
	edge16	%l2,	%o0,	%i6
	sdivx	%i4,	0x1B38,	%i3
	siam	0x4
	for	%f14,	%f2,	%f18
	mulscc	%l4,	0x015A,	%l0
	alignaddr	%g4,	%i7,	%i5
	tleu	%xcc,	0x1
	smulcc	%l5,	0x1E43,	%g6
	fandnot1	%f10,	%f16,	%f20
	array16	%o6,	%l3,	%o1
	fmovdleu	%xcc,	%f0,	%f15
	tleu	%icc,	0x1
	fbu	%fcc1,	loop_2940
	sra	%g1,	%o2,	%o5
	movrlz	%i2,	0x073,	%g7
	fmovsgu	%xcc,	%f31,	%f1
loop_2940:
	andn	%i1,	0x0079,	%o7
	fsrc1s	%f11,	%f5
	brnz,a	%l6,	loop_2941
	movvs	%icc,	%o3,	%g2
	movre	%o4,	%l1,	%i0
	taddcc	%g3,	0x178C,	%g5
loop_2941:
	tvs	%xcc,	0x6
	membar	0x0B
	std	%f24,	[%l7 + 0x48]
	fmul8ulx16	%f12,	%f2,	%f14
	udivx	%o0,	0x1AD6,	%i6
	brgez,a	%i4,	loop_2942
	fbue,a	%fcc0,	loop_2943
	bge,a,pn	%icc,	loop_2944
	popc	%l2,	%i3
loop_2942:
	mova	%xcc,	%l4,	%l0
loop_2943:
	fbge,a	%fcc2,	loop_2945
loop_2944:
	tpos	%icc,	0x6
	edge8	%g4,	%i5,	%i7
	fmovsvs	%icc,	%f9,	%f31
loop_2945:
	udivcc	%g6,	0x1EAC,	%o6
	add	%l3,	0x0FD4,	%o1
	udivcc	%l5,	0x1C0C,	%g1
	edge16	%o2,	%i2,	%g7
	fpsub16s	%f27,	%f26,	%f23
	wr	%g0,	0x27,	%asi
	stba	%i1,	[%l7 + 0x32] %asi
	membar	#Sync
	addccc	%o7,	0x0A14,	%o5
	fbul,a	%fcc0,	loop_2946
	fandnot1	%f12,	%f6,	%f30
	edge32n	%o3,	%l6,	%o4
	bne	loop_2947
loop_2946:
	smul	%g2,	0x0A7C,	%l1
	fmovdle	%icc,	%f30,	%f27
	fpmerge	%f23,	%f24,	%f20
loop_2947:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] %asi,	%g3,	%g5
	srl	%o0,	%i6,	%i4
	edge32l	%l2,	%i3,	%l4
	tn	%xcc,	0x5
	fmovdvc	%xcc,	%f20,	%f24
	ldsh	[%l7 + 0x34],	%i0
	tvs	%xcc,	0x3
	edge32ln	%g4,	%l0,	%i5
	pdist	%f28,	%f8,	%f24
	fmovdvc	%icc,	%f29,	%f3
	taddcctv	%g6,	%i7,	%o6
	sth	%o1,	[%l7 + 0x3E]
	udivcc	%l3,	0x1C18,	%l5
	tpos	%xcc,	0x4
	fsrc1s	%f30,	%f4
	addccc	%o2,	0x1B3C,	%i2
	bne,a,pn	%xcc,	loop_2948
	sdiv	%g7,	0x14CC,	%g1
	fors	%f31,	%f19,	%f0
	fbule,a	%fcc0,	loop_2949
loop_2948:
	ldstub	[%l7 + 0x11],	%o7
	fmovrdlz	%o5,	%f22,	%f20
	movrlz	%o3,	0x178,	%l6
loop_2949:
	xor	%i1,	%o4,	%l1
	wr	%g0,	0x88,	%asi
	stxa	%g2,	[%l7 + 0x20] %asi
	fzero	%f6
	edge8l	%g3,	%o0,	%g5
	fabss	%f31,	%f14
	bvs,a,pn	%icc,	loop_2950
	lduh	[%l7 + 0x12],	%i4
	move	%icc,	%l2,	%i3
	tleu	%xcc,	0x6
loop_2950:
	popc	%i6,	%l4
	fbug	%fcc3,	loop_2951
	fbug	%fcc1,	loop_2952
	ba,a	%xcc,	loop_2953
	move	%icc,	%g4,	%i0
loop_2951:
	edge8	%l0,	%g6,	%i7
loop_2952:
	tcs	%xcc,	0x5
loop_2953:
	sub	%i5,	0x0DB5,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%l3,	%f23,	%f16
	tleu	%icc,	0x4
	bvc,a,pt	%xcc,	loop_2954
	fcmpne32	%f24,	%f26,	%o1
	movrlz	%o2,	0x26E,	%i2
	addccc	%g7,	%g1,	%o7
loop_2954:
	subc	%l5,	0x1DD6,	%o3
	srax	%o5,	0x10,	%i1
	subc	%l6,	0x1C9D,	%o4
	addccc	%g2,	0x1373,	%g3
	st	%f12,	[%l7 + 0x5C]
	bleu,a	loop_2955
	addccc	%o0,	0x0F57,	%l1
	edge32	%i4,	%l2,	%g5
	fmovdle	%icc,	%f10,	%f12
loop_2955:
	lduh	[%l7 + 0x46],	%i6
	movcs	%xcc,	%l4,	%g4
	sllx	%i0,	0x1F,	%i3
	movrne	%g6,	%i7,	%l0
	xorcc	%o6,	%i5,	%l3
	set	0x48, %l1
	lda	[%l7 + %l1] 0x80,	%f12
	subcc	%o1,	%i2,	%o2
	movpos	%xcc,	%g1,	%g7
	movne	%icc,	%l5,	%o7
	set	0x74, %g1
	lduwa	[%l7 + %g1] 0x88,	%o3
	set	0x08, %o5
	stba	%o5,	[%l7 + %o5] 0x14
	umulcc	%i1,	%o4,	%g2
	lduw	[%l7 + 0x64],	%l6
	sdivx	%g3,	0x0BAA,	%l1
	umul	%o0,	0x0F8E,	%i4
	fnot2s	%f17,	%f24
	sdivx	%g5,	0x1403,	%l2
	set	0x7F, %i7
	ldsba	[%l7 + %i7] 0x15,	%l4
	std	%i6,	[%l7 + 0x60]
	and	%i0,	%i3,	%g4
	xnor	%i7,	0x1BD2,	%g6
	movle	%xcc,	%o6,	%l0
	fpmerge	%f9,	%f3,	%f14
	edge16l	%l3,	%i5,	%o1
	xnorcc	%o2,	%g1,	%i2
	smulcc	%g7,	%o7,	%o3
	array8	%o5,	%l5,	%i1
	srl	%o4,	0x0A,	%l6
	tsubcctv	%g3,	0x1B0E,	%l1
	movvs	%icc,	%g2,	%o0
	fxors	%f22,	%f13,	%f31
	move	%icc,	%g5,	%i4
	fmovse	%icc,	%f12,	%f4
	movne	%icc,	%l4,	%i6
	srl	%l2,	0x06,	%i0
	fpadd32s	%f14,	%f24,	%f16
	fnands	%f7,	%f20,	%f19
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] 0x88,	%g4,	%i7
	addc	%g6,	0x0D9F,	%o6
	orncc	%l0,	0x0023,	%l3
	fmovrsgz	%i5,	%f3,	%f23
	tvs	%xcc,	0x5
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x6C] %asi,	%f18
	fmovsge	%xcc,	%f3,	%f14
	fmovrdgez	%i3,	%f22,	%f20
	orcc	%o1,	0x141F,	%o2
	umul	%i2,	0x16BB,	%g1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	alignaddr	%g7,	%o7,	%o3
	fbl,a	%fcc3,	loop_2956
	movcc	%icc,	%l5,	%i1
	tsubcc	%o4,	0x0872,	%o5
	movn	%icc,	%g3,	%l6
loop_2956:
	bpos,pn	%xcc,	loop_2957
	edge8ln	%l1,	%o0,	%g5
	fmovsne	%icc,	%f11,	%f9
	fmuld8ulx16	%f26,	%f22,	%f2
loop_2957:
	nop
	set	0x40, %g2
	sta	%f4,	[%l7 + %g2] 0x14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f18,	%f2
	addc	%g2,	0x07D0,	%i4
	fcmpgt32	%f30,	%f20,	%i6
	srlx	%l4,	%l2,	%i0
	edge8	%i7,	%g4,	%o6
	fbn	%fcc2,	loop_2958
	fand	%f26,	%f16,	%f12
	set	0x41, %o3
	lduba	[%l7 + %o3] 0x80,	%l0
loop_2958:
	membar	0x59
	movn	%xcc,	%g6,	%l3
	srl	%i3,	0x16,	%i5
	faligndata	%f20,	%f16,	%f14
	udiv	%o1,	0x1C5F,	%o2
	bvc,a,pt	%icc,	loop_2959
	sllx	%g1,	0x08,	%g7
	and	%o7,	%o3,	%i2
	fmovdg	%icc,	%f11,	%f28
loop_2959:
	sllx	%i1,	%l5,	%o4
	stx	%g3,	[%l7 + 0x20]
	fmul8ulx16	%f0,	%f2,	%f22
	tge	%icc,	0x2
	edge32	%o5,	%l1,	%l6
	fmovdgu	%xcc,	%f5,	%f4
	movrgez	%g5,	%g2,	%i4
	ba,a	%xcc,	loop_2960
	edge32	%i6,	%l4,	%l2
	fblg,a	%fcc3,	loop_2961
	for	%f18,	%f26,	%f12
loop_2960:
	bvc,a	%icc,	loop_2962
	tcs	%xcc,	0x0
loop_2961:
	mova	%xcc,	%o0,	%i0
	tleu	%icc,	0x1
loop_2962:
	bgu,a,pn	%xcc,	loop_2963
	edge8	%g4,	%o6,	%i7
	fblg,a	%fcc2,	loop_2964
	te	%xcc,	0x1
loop_2963:
	fands	%f3,	%f18,	%f9
	edge16	%l0,	%l3,	%i3
loop_2964:
	fandnot1	%f8,	%f30,	%f6
	mulscc	%g6,	0x01F8,	%o1
	orcc	%i5,	0x0FF2,	%o2
	brnz	%g1,	loop_2965
	alignaddrl	%o7,	%g7,	%o3
	sdivcc	%i2,	0x18C6,	%i1
	bl	loop_2966
loop_2965:
	bneg,pn	%icc,	loop_2967
	tcs	%xcc,	0x3
	movrgz	%l5,	0x394,	%g3
loop_2966:
	tpos	%icc,	0x3
loop_2967:
	fornot2s	%f31,	%f15,	%f7
	bleu,a	loop_2968
	popc	0x0E37,	%o5
	or	%o4,	0x0573,	%l6
	fmovdvs	%icc,	%f10,	%f1
loop_2968:
	edge16	%g5,	%l1,	%g2
	taddcctv	%i4,	%i6,	%l2
	fmovsge	%icc,	%f13,	%f4
	fpsub16	%f12,	%f12,	%f6
	fmovsa	%xcc,	%f29,	%f0
	fbul,a	%fcc2,	loop_2969
	tne	%icc,	0x2
	movcs	%xcc,	%l4,	%i0
	array8	%o0,	%g4,	%i7
loop_2969:
	nop
	set	0x38, %g3
	ldswa	[%l7 + %g3] 0x15,	%l0
	andncc	%o6,	%l3,	%i3
	sub	%g6,	%i5,	%o1
	movrne	%g1,	0x3CB,	%o2
	movne	%xcc,	%o7,	%g7
	tne	%xcc,	0x4
	xnor	%i2,	%o3,	%i1
	swap	[%l7 + 0x20],	%g3
	andncc	%o5,	%l5,	%o4
	fmovdleu	%icc,	%f25,	%f25
	fands	%f27,	%f12,	%f15
	fmovdn	%icc,	%f26,	%f29
	fbug	%fcc1,	loop_2970
	alignaddrl	%l6,	%g5,	%l1
	set	0x40, %i5
	ldda	[%l7 + %i5] 0x14,	%f16
loop_2970:
	edge16	%i4,	%g2,	%i6
	edge16	%l2,	%i0,	%l4
	edge8l	%o0,	%g4,	%l0
	fcmpne16	%f22,	%f16,	%i7
	fcmpes	%fcc3,	%f18,	%f10
	movgu	%xcc,	%l3,	%i3
	bne,pn	%icc,	loop_2971
	movcs	%xcc,	%g6,	%o6
	movrne	%i5,	0x11F,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2971:
	fmovdge	%icc,	%f25,	%f18
	fbg	%fcc1,	loop_2972
	fnot2	%f6,	%f10
	set	0x1C, %i1
	sta	%f7,	[%l7 + %i1] 0x10
loop_2972:
	orcc	%o2,	0x1E1B,	%o7
	mulx	%g7,	%i2,	%o3
	flush	%l7 + 0x44
	prefetch	[%l7 + 0x38],	 0x2
	movge	%icc,	%g1,	%g3
	be	loop_2973
	brlez	%o5,	loop_2974
	umul	%i1,	0x0FF9,	%l5
	srax	%o4,	0x15,	%l6
loop_2973:
	movrlz	%g5,	0x325,	%l1
loop_2974:
	andncc	%i4,	%g2,	%l2
	bneg,a	loop_2975
	movle	%xcc,	%i0,	%l4
	fsrc2s	%f13,	%f17
	brgz	%i6,	loop_2976
loop_2975:
	fmul8sux16	%f22,	%f30,	%f12
	nop
	set	0x78, %l0
	prefetch	[%l7 + %l0],	 0x0
	fone	%f24
loop_2976:
	fornot2	%f14,	%f26,	%f18
	fbg	%fcc3,	loop_2977
	movrlez	%g4,	%l0,	%o0
	tcs	%icc,	0x1
	fmovrdgez	%l3,	%f28,	%f10
loop_2977:
	fmovsvc	%xcc,	%f31,	%f7
	fmovrsgez	%i7,	%f29,	%f30
	fabss	%f17,	%f2
	movvc	%xcc,	%g6,	%o6
	bge,a,pn	%xcc,	loop_2978
	movcs	%xcc,	%i5,	%o1
	fpsub16s	%f12,	%f20,	%f4
	fzeros	%f9
loop_2978:
	bpos,pt	%icc,	loop_2979
	movgu	%icc,	%o2,	%o7
	movrlez	%g7,	0x1D2,	%i2
	movneg	%xcc,	%i3,	%o3
loop_2979:
	or	%g1,	%o5,	%g3
	movvc	%xcc,	%l5,	%o4
	fcmped	%fcc0,	%f12,	%f20
	fblg	%fcc3,	loop_2980
	tvs	%xcc,	0x6
	fandnot1	%f12,	%f0,	%f6
	set	0x20, %i4
	stda	%i6,	[%l7 + %i4] 0x0c
loop_2980:
	edge16n	%g5,	%l1,	%i1
	fpsub32s	%f6,	%f14,	%f20
	movge	%xcc,	%g2,	%l2
	movrlz	%i0,	%i4,	%i6
	subcc	%l4,	%g4,	%o0
	sra	%l3,	%l0,	%g6
	alignaddr	%o6,	%i7,	%i5
	ldx	[%l7 + 0x68],	%o1
	edge8n	%o7,	%g7,	%o2
	movle	%xcc,	%i3,	%o3
	fandnot2s	%f18,	%f1,	%f21
	set	0x50, %o0
	stxa	%i2,	[%l7 + %o0] 0x15
	ble,pt	%xcc,	loop_2981
	bg,a	%icc,	loop_2982
	ldub	[%l7 + 0x7B],	%o5
	edge16n	%g3,	%l5,	%g1
loop_2981:
	nop
	set	0x56, %g5
	ldsba	[%l7 + %g5] 0x0c,	%l6
loop_2982:
	tge	%xcc,	0x7
	and	%g5,	0x029F,	%o4
	fbe,a	%fcc1,	loop_2983
	fbge,a	%fcc3,	loop_2984
	fmovsge	%icc,	%f27,	%f11
	ldx	[%l7 + 0x50],	%i1
loop_2983:
	edge32n	%l1,	%l2,	%g2
loop_2984:
	udiv	%i0,	0x17EC,	%i4
	fnor	%f22,	%f24,	%f10
	stbar
	wr	%g0,	0x18,	%asi
	stwa	%i6,	[%l7 + 0x64] %asi
	fbug	%fcc2,	loop_2985
	tg	%icc,	0x3
	tl	%xcc,	0x4
	movn	%xcc,	%g4,	%l4
loop_2985:
	fmovsne	%xcc,	%f28,	%f26
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%o0
	movcs	%icc,	%l0,	%g6
	taddcc	%l3,	%i7,	%i5
	fcmpne16	%f0,	%f30,	%o1
	movrlz	%o6,	%g7,	%o7
	ta	%icc,	0x5
	movge	%xcc,	%o2,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%i2,	%o5
	array32	%o3,	%l5,	%g1
	fmul8x16al	%f10,	%f3,	%f24
	fbge	%fcc1,	loop_2986
	fmovsn	%xcc,	%f5,	%f21
	wr	%g0,	0x2f,	%asi
	stda	%i6,	[%l7 + 0x68] %asi
	membar	#Sync
loop_2986:
	brlz	%g5,	loop_2987
	sdivcc	%o4,	0x104E,	%i1
	andncc	%l1,	%g3,	%g2
	andn	%i0,	0x1662,	%i4
loop_2987:
	flush	%l7 + 0x7C
	srl	%i6,	0x09,	%g4
	sethi	0x1E0E,	%l2
	tneg	%icc,	0x6
	movg	%xcc,	%l4,	%o0
	tsubcctv	%g6,	0x1085,	%l3
	edge8ln	%l0,	%i5,	%o1
	fcmpgt16	%f6,	%f8,	%i7
	membar	0x44
	fmovdneg	%xcc,	%f6,	%f9
	call	loop_2988
	fmovdl	%icc,	%f24,	%f4
	tvs	%icc,	0x4
	prefetch	[%l7 + 0x44],	 0x3
loop_2988:
	or	%g7,	0x1D1C,	%o6
	ldx	[%l7 + 0x30],	%o7
	xnorcc	%i3,	%i2,	%o5
	movrne	%o3,	%o2,	%l5
	brz,a	%l6,	loop_2989
	movge	%xcc,	%g5,	%o4
	movcs	%xcc,	%i1,	%l1
	taddcctv	%g3,	0x114F,	%g1
loop_2989:
	membar	0x3F
	edge8n	%g2,	%i0,	%i6
	xorcc	%i4,	%l2,	%l4
	andncc	%g4,	%o0,	%g6
	and	%l3,	0x1E46,	%l0
	fsrc1	%f28,	%f14
	fmovrdne	%o1,	%f2,	%f28
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	fornot2	%f28,	%f28,	%f24
	alignaddrl	%i5,	%o6,	%g7
	fpadd32	%f26,	%f18,	%f10
	nop
	setx	loop_2990,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	popc	%i3,	%i2
	fmovrdlez	%o5,	%f0,	%f26
	movge	%xcc,	%o7,	%o2
loop_2990:
	mulx	%l5,	%o3,	%l6
	tpos	%icc,	0x4
	sdivcc	%o4,	0x110D,	%g5
	edge32	%i1,	%g3,	%l1
	edge8n	%g2,	%g1,	%i6
	fbne,a	%fcc3,	loop_2991
	fbug	%fcc3,	loop_2992
	fmovsvs	%xcc,	%f22,	%f0
	movre	%i0,	%i4,	%l2
loop_2991:
	movrgz	%g4,	0x187,	%o0
loop_2992:
	subc	%l4,	%g6,	%l0
	sdiv	%l3,	0x03BD,	%o1
	edge16ln	%i7,	%o6,	%g7
	sra	%i5,	%i2,	%i3
	mulscc	%o7,	0x0638,	%o5
	fpadd32	%f20,	%f14,	%f14
	smulcc	%l5,	0x1DD2,	%o3
	udivcc	%o2,	0x07A3,	%l6
	set	0x58, %i3
	stha	%o4,	[%l7 + %i3] 0xe2
	membar	#Sync
	movrgz	%g5,	%g3,	%l1
	fble,a	%fcc0,	loop_2993
	te	%xcc,	0x2
	wr	%g0,	0x0c,	%asi
	stha	%i1,	[%l7 + 0x08] %asi
loop_2993:
	swap	[%l7 + 0x58],	%g1
	faligndata	%f4,	%f22,	%f24
	array8	%i6,	%g2,	%i4
	ldstub	[%l7 + 0x1A],	%i0
	sllx	%g4,	0x0B,	%l2
	edge16n	%l4,	%o0,	%g6
	fpadd16	%f24,	%f24,	%f14
	tcs	%xcc,	0x1
	brgz	%l3,	loop_2994
	edge16ln	%l0,	%o1,	%o6
	addccc	%i7,	0x1651,	%i5
	movcs	%icc,	%g7,	%i3
loop_2994:
	bl,pt	%icc,	loop_2995
	fcmpeq32	%f10,	%f28,	%o7
	nop
	set	0x1E, %l4
	sth	%i2,	[%l7 + %l4]
	fnot2s	%f0,	%f17
loop_2995:
	movl	%icc,	%o5,	%l5
	edge8l	%o3,	%l6,	%o4
	edge8	%g5,	%g3,	%l1
	fmovrsne	%o2,	%f19,	%f13
	mulx	%i1,	%i6,	%g2
	sdivx	%i4,	0x06BC,	%i0
	subccc	%g4,	%l2,	%l4
	umulcc	%g1,	0x11FD,	%g6
	alignaddr	%o0,	%l3,	%l0
	brlez,a	%o6,	loop_2996
	fnot2	%f2,	%f10
	brz,a	%i7,	loop_2997
	edge16ln	%i5,	%g7,	%o1
loop_2996:
	xor	%i3,	0x08D6,	%o7
	bl	%xcc,	loop_2998
loop_2997:
	xnorcc	%o5,	%i2,	%o3
	edge16n	%l5,	%o4,	%g5
	sir	0x0C5A
loop_2998:
	bshuffle	%f12,	%f4,	%f12
	fmovdleu	%icc,	%f30,	%f31
	orncc	%l6,	%l1,	%o2
	andn	%i1,	%g3,	%g2
	tsubcctv	%i4,	0x1E4F,	%i0
	movne	%xcc,	%i6,	%g4
	xnorcc	%l2,	0x181A,	%l4
	bn,a,pt	%xcc,	loop_2999
	edge16l	%g6,	%o0,	%g1
	movvc	%icc,	%l0,	%l3
	sir	0x1DA4
loop_2999:
	tg	%icc,	0x1
	tvc	%xcc,	0x5
	fxnor	%f24,	%f2,	%f4
	fmovsle	%xcc,	%f29,	%f7
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o6
	bl,pn	%icc,	loop_3000
	udiv	%i5,	0x1E14,	%i7
	popc	0x18D6,	%o1
	movrlez	%i3,	%g7,	%o7
loop_3000:
	fblg,a	%fcc2,	loop_3001
	tle	%icc,	0x3
	orcc	%o5,	%o3,	%l5
	alignaddr	%i2,	%g5,	%o4
loop_3001:
	udivcc	%l6,	0x0B92,	%o2
	fcmpes	%fcc1,	%f16,	%f6
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf1,	%f0
	mova	%icc,	%l1,	%g3
	edge32n	%g2,	%i4,	%i0
	fmovdleu	%xcc,	%f14,	%f6
	tcc	%xcc,	0x3
	set	0x5A, %g6
	stha	%i1,	[%l7 + %g6] 0x89
	ldsh	[%l7 + 0x0E],	%i6
	array8	%g4,	%l4,	%g6
	mulx	%l2,	0x13CF,	%o0
	srl	%l0,	0x0C,	%l3
	popc	%o6,	%i5
	flush	%l7 + 0x7C
	fnor	%f6,	%f0,	%f8
	array32	%i7,	%o1,	%i3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x73] %asi,	%g7
	srl	%g1,	0x1B,	%o7
	array32	%o5,	%o3,	%l5
	fpadd32s	%f6,	%f14,	%f14
	fmovse	%icc,	%f9,	%f0
	movn	%xcc,	%g5,	%i2
	umulcc	%l6,	%o4,	%l1
	andn	%o2,	0x197E,	%g2
	fzeros	%f31
	xorcc	%g3,	0x105B,	%i0
	array8	%i4,	%i6,	%i1
	set	0x50, %l3
	ldxa	[%l7 + %l3] 0x88,	%l4
	tpos	%icc,	0x1
	fmovdcs	%icc,	%f2,	%f13
	fcmple32	%f0,	%f6,	%g4
	ldx	[%l7 + 0x08],	%l2
	fbue,a	%fcc3,	loop_3002
	movrgz	%g6,	%o0,	%l3
	fmovdge	%xcc,	%f26,	%f20
	orncc	%l0,	0x0957,	%i5
loop_3002:
	sethi	0x075C,	%i7
	sra	%o1,	0x00,	%i3
	fnot1	%f0,	%f0
	movn	%xcc,	%g7,	%o6
	mova	%xcc,	%o7,	%o5
	fbul	%fcc3,	loop_3003
	subc	%o3,	0x0943,	%g1
	fmovdpos	%icc,	%f0,	%f4
	udivcc	%g5,	0x0D78,	%l5
loop_3003:
	tl	%icc,	0x1
	sdivcc	%l6,	0x0AF5,	%o4
	edge32l	%i2,	%o2,	%l1
	edge16ln	%g2,	%g3,	%i0
	ldd	[%l7 + 0x28],	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i6,	%i1,	%l4
	fpmerge	%f3,	%f11,	%f10
	fbuge,a	%fcc2,	loop_3004
	movpos	%icc,	%g4,	%l2
	set	0x20, %l6
	ldstuba	[%l7 + %l6] 0x0c,	%i4
loop_3004:
	ld	[%l7 + 0x58],	%f23
	ldsb	[%l7 + 0x6B],	%g6
	tneg	%xcc,	0x1
	ldub	[%l7 + 0x5D],	%l3
	movpos	%xcc,	%o0,	%i5
	fnot1	%f20,	%f12
	tcs	%icc,	0x2
	ld	[%l7 + 0x14],	%f6
	edge8ln	%i7,	%o1,	%l0
	stx	%g7,	[%l7 + 0x30]
	edge16	%o6,	%i3,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o5,	0x0A89,	%o3
	prefetch	[%l7 + 0x4C],	 0x0
	set	0x69, %g4
	ldstuba	[%l7 + %g4] 0x11,	%g1
	fnot2s	%f21,	%f17
	smulcc	%l5,	0x1928,	%g5
	bl	loop_3005
	movcc	%icc,	%o4,	%l6
	sdivx	%i2,	0x1282,	%o2
	nop
	setx	loop_3006,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_3005:
	sdivx	%g2,	0x179B,	%l1
	fpackfix	%f2,	%f6
	edge16n	%g3,	%i0,	%i1
loop_3006:
	nop
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	sub	%l4,	%i6,	%l2
	fbuge,a	%fcc2,	loop_3007
	umul	%g4,	0x0FDF,	%g6
	fpsub16s	%f5,	%f12,	%f16
	fmovscc	%xcc,	%f1,	%f13
loop_3007:
	xnorcc	%l3,	0x108D,	%i4
	fpadd16	%f24,	%f28,	%f24
	tneg	%xcc,	0x4
	array8	%o0,	%i7,	%i5
	set	0x78, %i6
	stda	%o0,	[%l7 + %i6] 0x14
	alignaddrl	%g7,	%l0,	%i3
	set	0x5C, %o1
	swapa	[%l7 + %o1] 0x88,	%o7
	edge16l	%o6,	%o5,	%o3
	fornot1	%f22,	%f28,	%f12
	orn	%l5,	0x0A47,	%g1
	fmovsgu	%icc,	%f12,	%f7
	siam	0x2
	tg	%xcc,	0x5
	fnot1	%f16,	%f26
	be	%icc,	loop_3008
	stb	%o4,	[%l7 + 0x53]
	fmul8sux16	%f26,	%f10,	%f12
	move	%icc,	%g5,	%l6
loop_3008:
	fmovdcs	%xcc,	%f22,	%f26
	sir	0x0CE1
	fba,a	%fcc2,	loop_3009
	ldd	[%l7 + 0x50],	%i2
	or	%g2,	%o2,	%g3
	fsrc2	%f8,	%f30
loop_3009:
	bneg	loop_3010
	tle	%xcc,	0x7
	popc	0x032E,	%l1
	fbu,a	%fcc1,	loop_3011
loop_3010:
	tsubcc	%i1,	%i0,	%l4
	mulx	%l2,	0x192C,	%g4
	fbl	%fcc3,	loop_3012
loop_3011:
	fcmped	%fcc2,	%f6,	%f22
	fmovrdgez	%i6,	%f8,	%f12
	add	%l3,	0x07F2,	%i4
loop_3012:
	smulcc	%g6,	%o0,	%i5
	tcs	%xcc,	0x6
	popc	%o1,	%i7
	bgu	%xcc,	loop_3013
	taddcc	%g7,	%i3,	%o7
	movrgez	%l0,	0x326,	%o5
	fmovsne	%icc,	%f16,	%f14
loop_3013:
	fcmpeq16	%f20,	%f20,	%o6
	fmovse	%icc,	%f8,	%f0
	nop
	setx	loop_3014,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%xcc,	%o3,	%l5
	subcc	%g1,	0x1E81,	%g5
	lduw	[%l7 + 0x68],	%l6
loop_3014:
	xnor	%o4,	0x009C,	%g2
	sir	0x04BA
	edge8l	%o2,	%g3,	%l1
	fnands	%f12,	%f20,	%f26
	fones	%f1
	ldub	[%l7 + 0x2D],	%i2
	movrgez	%i0,	%l4,	%i1
	srax	%l2,	0x09,	%i6
	smulcc	%l3,	0x0277,	%i4
	fandnot1	%f22,	%f28,	%f10
	orn	%g4,	%o0,	%g6
	edge16ln	%o1,	%i5,	%i7
	edge16	%g7,	%i3,	%l0
	movrgez	%o5,	0x314,	%o6
	mova	%xcc,	%o3,	%o7
	mulx	%g1,	%l5,	%l6
	std	%o4,	[%l7 + 0x38]
	set	0x42, %o7
	lduba	[%l7 + %o7] 0x81,	%g5
	fnot1	%f12,	%f16
	movg	%icc,	%g2,	%o2
	tge	%icc,	0x1
	set	0x70, %g7
	swapa	[%l7 + %g7] 0x11,	%g3
	orncc	%i2,	%l1,	%l4
	fcmpgt32	%f8,	%f14,	%i1
	sdivx	%i0,	0x02C4,	%l2
	fandnot2s	%f22,	%f6,	%f18
	membar	0x6F
	sdiv	%i6,	0x1338,	%i4
	brlz	%l3,	loop_3015
	orn	%o0,	%g6,	%o1
	bg,a	%icc,	loop_3016
	nop
	setx	loop_3017,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_3015:
	array32	%g4,	%i7,	%i5
	sll	%i3,	%l0,	%g7
loop_3016:
	fnot1	%f6,	%f14
loop_3017:
	orn	%o5,	%o3,	%o7
	edge32ln	%o6,	%g1,	%l5
	fexpand	%f12,	%f2
	siam	0x2
	set	0x10, %o4
	stxa	%l6,	[%g0 + %o4] 0x20
	fmovsle	%icc,	%f13,	%f14
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%g5
	alignaddr	%g2,	%o4,	%g3
	st	%f2,	[%l7 + 0x78]
	fmul8x16al	%f28,	%f15,	%f8
	fpack32	%f0,	%f4,	%f4
	stb	%o2,	[%l7 + 0x1F]
	set	0x10, %l2
	stwa	%l1,	[%l7 + %l2] 0x14
	fmovrslz	%i2,	%f23,	%f16
	movn	%xcc,	%l4,	%i0
	brgz	%i1,	loop_3018
	te	%xcc,	0x7
	fands	%f17,	%f16,	%f7
	array32	%l2,	%i6,	%i4
loop_3018:
	orcc	%o0,	%l3,	%o1
	ld	[%l7 + 0x08],	%f21
	fble,a	%fcc3,	loop_3019
	movl	%xcc,	%g6,	%g4
	set	0x2C, %o6
	lduha	[%l7 + %o6] 0x15,	%i5
loop_3019:
	fsrc2	%f22,	%f0
	tle	%icc,	0x7
	sdiv	%i7,	0x0B20,	%i3
	movleu	%icc,	%g7,	%o5
	fcmpgt16	%f28,	%f8,	%l0
	edge8l	%o7,	%o6,	%o3
	tcs	%icc,	0x4
	andn	%g1,	%l6,	%l5
	edge16ln	%g2,	%o4,	%g5
	flush	%l7 + 0x58
	wr	%g0,	0xeb,	%asi
	stha	%o2,	[%l7 + 0x58] %asi
	membar	#Sync
	orncc	%g3,	%l1,	%l4
	move	%xcc,	%i2,	%i0
	fbo	%fcc2,	loop_3020
	tvs	%xcc,	0x0
	umul	%l2,	%i6,	%i1
	tcs	%icc,	0x2
loop_3020:
	nop
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x0c,	%i4,	%o0
	movne	%icc,	%o1,	%g6
	smulcc	%l3,	0x0FF0,	%i5
	xorcc	%g4,	%i3,	%g7
	movne	%xcc,	%o5,	%l0
	ldd	[%l7 + 0x08],	%o6
	umulcc	%o6,	0x0EAC,	%o3
	orn	%g1,	0x15E2,	%l6
	fmovsne	%xcc,	%f24,	%f8
	movvs	%xcc,	%i7,	%g2
	taddcctv	%l5,	%o4,	%o2
	sethi	0x0AF4,	%g5
	sllx	%l1,	%l4,	%g3
	tvc	%xcc,	0x2
	fbug	%fcc0,	loop_3021
	array8	%i0,	%l2,	%i6
	umul	%i2,	%i4,	%o0
	sra	%o1,	0x06,	%i1
loop_3021:
	addccc	%l3,	%g6,	%g4
	tvs	%xcc,	0x1
	fpsub16s	%f9,	%f25,	%f1
	fxnors	%f23,	%f8,	%f20
	array32	%i5,	%i3,	%g7
	fxor	%f10,	%f12,	%f12
	subc	%o5,	%l0,	%o6
	movne	%icc,	%o7,	%o3
	taddcc	%l6,	0x10F1,	%i7
	fmul8x16	%f14,	%f18,	%f22
	smulcc	%g2,	%l5,	%o4
	fand	%f28,	%f26,	%f26
	edge16l	%o2,	%g1,	%g5
	membar	0x13
	fbge	%fcc1,	loop_3022
	ldsb	[%l7 + 0x44],	%l1
	tsubcc	%g3,	0x007A,	%l4
	fbue,a	%fcc2,	loop_3023
loop_3022:
	movl	%icc,	%i0,	%i6
	be	%xcc,	loop_3024
	fbl	%fcc0,	loop_3025
loop_3023:
	tpos	%icc,	0x7
	movleu	%xcc,	%l2,	%i2
loop_3024:
	andncc	%o0,	%i4,	%o1
loop_3025:
	std	%i0,	[%l7 + 0x10]
	edge8n	%l3,	%g6,	%i5
	addccc	%g4,	0x171F,	%g7
	sub	%i3,	%o5,	%l0
	bpos,a,pn	%icc,	loop_3026
	ldd	[%l7 + 0x70],	%f6
	bgu,a	loop_3027
	movrlz	%o7,	0x0E4,	%o3
loop_3026:
	nop
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x22,	%o6
loop_3027:
	movleu	%xcc,	%l6,	%i7
	brlez	%g2,	loop_3028
	fbul,a	%fcc0,	loop_3029
	edge32l	%o4,	%l5,	%g1
	movre	%g5,	0x16A,	%o2
loop_3028:
	movcc	%xcc,	%l1,	%g3
loop_3029:
	movvc	%xcc,	%l4,	%i6
	tne	%xcc,	0x1
	bleu,a,pt	%xcc,	loop_3030
	std	%f30,	[%l7 + 0x58]
	wr	%g0,	0x18,	%asi
	stwa	%i0,	[%l7 + 0x40] %asi
loop_3030:
	edge16	%i2,	%o0,	%i4
	or	%l2,	0x14DB,	%i1
	smulcc	%l3,	0x17DD,	%g6
	movrlz	%o1,	%g4,	%i5
	move	%icc,	%g7,	%i3
	popc	%o5,	%l0
	tleu	%icc,	0x7
	orncc	%o7,	0x128F,	%o3
	tleu	%xcc,	0x1
	bleu,a	loop_3031
	tne	%xcc,	0x1
	udivx	%o6,	0x010F,	%l6
	fbo,a	%fcc0,	loop_3032
loop_3031:
	sir	0x1695
	srl	%g2,	%i7,	%o4
	smul	%g1,	%l5,	%g5
loop_3032:
	sll	%l1,	%o2,	%g3
	fmovsn	%icc,	%f24,	%f23
	movrne	%l4,	%i6,	%i2
	sdivx	%o0,	0x06A2,	%i0
	movcs	%icc,	%l2,	%i4
	membar	0x1F
	fxnor	%f4,	%f20,	%f0
	sth	%i1,	[%l7 + 0x08]
	tge	%xcc,	0x4
	alignaddr	%l3,	%g6,	%g4
	xor	%i5,	0x0AB5,	%o1
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x88,	%i2
	fmovsleu	%xcc,	%f31,	%f12
	movg	%icc,	%o5,	%g7
	addccc	%o7,	0x036F,	%o3
	xorcc	%l0,	%o6,	%l6
	fandnot1s	%f2,	%f0,	%f15
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x54] %asi,	%i7
	edge32n	%g2,	%o4,	%g1
	mova	%icc,	%l5,	%l1
	fbl	%fcc2,	loop_3033
	tn	%xcc,	0x3
	edge16ln	%g5,	%o2,	%l4
	movvs	%xcc,	%i6,	%g3
loop_3033:
	tle	%xcc,	0x7
	or	%i2,	0x0855,	%o0
	alignaddr	%i0,	%i4,	%i1
	fsrc1s	%f12,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%l3,	%f25,	%f24
	st	%f12,	[%l7 + 0x7C]
	sir	0x08D3
	andcc	%g6,	%g4,	%l2
	xnor	%i5,	0x00A3,	%i3
	brlez,a	%o1,	loop_3034
	movvs	%icc,	%g7,	%o7
	tpos	%icc,	0x7
	sra	%o3,	0x0E,	%l0
loop_3034:
	fmovdl	%xcc,	%f14,	%f31
	ble,a,pn	%xcc,	loop_3035
	fbug	%fcc1,	loop_3036
	edge8ln	%o5,	%l6,	%o6
	alignaddrl	%i7,	%o4,	%g2
loop_3035:
	fnegd	%f24,	%f6
loop_3036:
	alignaddrl	%g1,	%l1,	%l5
	addc	%g5,	0x12C6,	%l4
	movleu	%xcc,	%o2,	%g3
	move	%icc,	%i6,	%o0
	edge32n	%i0,	%i2,	%i4
	fba	%fcc3,	loop_3037
	orn	%l3,	%g6,	%g4
	std	%f26,	[%l7 + 0x58]
	tvs	%icc,	0x4
loop_3037:
	edge32l	%i1,	%i5,	%i3
	orn	%l2,	%g7,	%o7
	umul	%o1,	0x0522,	%l0
	sth	%o5,	[%l7 + 0x3E]
	tsubcctv	%l6,	%o3,	%i7
	sdiv	%o4,	0x0ACA,	%o6
	fmovsne	%xcc,	%f1,	%f26
	fmovrdne	%g2,	%f22,	%f4
	fmovdcs	%icc,	%f8,	%f8
	subcc	%l1,	0x1760,	%l5
	movrlz	%g5,	%g1,	%o2
	fnot2s	%f27,	%f13
	call	loop_3038
	tg	%icc,	0x6
	array32	%l4,	%i6,	%g3
	smulcc	%i0,	0x19D6,	%o0
loop_3038:
	sdiv	%i2,	0x18F1,	%l3
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x80
	fmovsgu	%icc,	%f15,	%f20
	taddcctv	%g6,	0x0F60,	%g4
	fzero	%f28
	fandnot2	%f14,	%f6,	%f12
	edge32ln	%i1,	%i5,	%i4
	flush	%l7 + 0x4C
	tsubcc	%i3,	0x1217,	%l2
	alignaddrl	%g7,	%o1,	%o7
	tl	%icc,	0x7
	taddcc	%l0,	0x0C7F,	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%o3,	%o5
	fpsub32	%f16,	%f4,	%f10
	subcc	%i7,	%o4,	%o6
	fand	%f6,	%f14,	%f24
	fsrc2	%f30,	%f30
	brlz,a	%l1,	loop_3039
	movcc	%xcc,	%l5,	%g2
	add	%g5,	0x023D,	%g1
	tg	%xcc,	0x5
loop_3039:
	fbug,a	%fcc0,	loop_3040
	tg	%icc,	0x5
	brlez	%o2,	loop_3041
	movne	%icc,	%i6,	%l4
loop_3040:
	taddcc	%g3,	%i0,	%o0
	bl,a,pn	%icc,	loop_3042
loop_3041:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc2,	%f30,	%f0
	movrlz	%l3,	%g6,	%g4
loop_3042:
	tsubcctv	%i1,	0x0CA4,	%i2
	fmovdcs	%xcc,	%f5,	%f23
	fpmerge	%f19,	%f2,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%i5,	%i4
	movcc	%icc,	%i3,	%g7
	set	0x0E, %o2
	stba	%o1,	[%l7 + %o2] 0x80
	fmovdvs	%xcc,	%f14,	%f13
	fbo	%fcc3,	loop_3043
	fsrc1s	%f6,	%f9
	movgu	%xcc,	%l2,	%o7
	sra	%l6,	0x1B,	%l0
loop_3043:
	andcc	%o5,	%o3,	%o4
	ldstub	[%l7 + 0x5D],	%o6
	fmul8x16	%f7,	%f10,	%f18
	set	0x1C, %o5
	lda	[%l7 + %o5] 0x18,	%f18
	stbar
	addcc	%i7,	%l1,	%g2
	addcc	%l5,	0x1671,	%g5
	movcs	%icc,	%o2,	%g1
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x88,	%l4
	sllx	%g3,	0x11,	%i0
	xorcc	%o0,	0x19EE,	%l3
	brlez,a	%i6,	loop_3044
	tneg	%xcc,	0x7
	sir	0x0851
	umul	%g4,	0x0BD8,	%g6
loop_3044:
	orcc	%i2,	0x1520,	%i1
	edge16l	%i5,	%i3,	%i4
	tsubcc	%o1,	%g7,	%o7
	fxors	%f13,	%f2,	%f16
	tvc	%icc,	0x6
	tne	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l6,	%l2,	%o5
	tg	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovda	%xcc,	%f20,	%f10
	set	0x58, %g2
	stda	%l0,	[%l7 + %g2] 0x88
	smul	%o4,	%o6,	%i7
	movrne	%l1,	0x26A,	%g2
	nop
	setx	loop_3045,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%xcc,	0x6
	taddcctv	%l5,	%o3,	%o2
	set	0x60, %g1
	stxa	%g1,	[%l7 + %g1] 0xeb
	membar	#Sync
loop_3045:
	fmovsleu	%icc,	%f18,	%f14
	sra	%g5,	0x01,	%l4
	umulcc	%i0,	%g3,	%l3
	faligndata	%f14,	%f28,	%f0
	xnor	%o0,	%i6,	%g6
	tcc	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f14,	%f30
	xnorcc	%g4,	%i1,	%i5
	tle	%xcc,	0x2
	edge8	%i2,	%i4,	%o1
	taddcc	%i3,	0x0A64,	%g7
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2800
!	Type x   	: 1325
!	Type cti   	: 3045
!	Type f   	: 4518
!	Type i   	: 13312
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xE6707A9A
.word 0xE7E06B71
.word 0xEAF5913C
.word 0x4D3DBF72
.word 0xF77D2061
.word 0x5DEA849E
.word 0x7013893F
.word 0x02CF71B8
.word 0x28C2398E
.word 0x863451AF
.word 0xCA64B2B3
.word 0x2C7DAF51
.word 0x18F43375
.word 0x5053F539
.word 0x0185699E
.word 0x1F585BE2
.word 0xC9B972FD
.word 0x2614587F
.word 0xA99CBEA9
.word 0x6C7CB5BB
.word 0xF0339505
.word 0xBE345187
.word 0xD740BD94
.word 0x99B1575F
.word 0xC5C37004
.word 0x9D85C41C
.word 0x066C9772
.word 0x317F6F95
.word 0x96BE3EE8
.word 0x3CC1EF29
.word 0x1ED397B7
.word 0x6436456B
.word 0xE5B978A8
.word 0x8B2523A9
.word 0xCE6169B8
.word 0x28EA877B
.word 0xFB87CB0C
.word 0x80F5547A
.word 0x7FE9B7A0
.word 0x5163F4AB
.word 0xABE815A4
.word 0x2AE35ABA
.word 0xA0DF415C
.word 0xCE062D07
.word 0x44127331
.word 0xC4DC977D
.word 0x8529D1E6
.word 0x4115D1B4
.word 0x5FFCEB9F
.word 0x59878A85
.word 0x7C6C0F18
.word 0x6BFF44C4
.word 0x6D9F9363
.word 0xE0AFDF30
.word 0xFFB016A3
.word 0x3FC36CCB
.word 0x257E26A8
.word 0xF3D5C539
.word 0xD38BBAB4
.word 0xD2A1C5BB
.word 0x384ACDA7
.word 0x1132B1F7
.word 0x8EF0801C
.word 0xF49707F1
.end
