/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f6.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f6.s,v 1.1 2007/05/11 17:22:29 drp Exp $"
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
	setx	0x415C00A6E073180A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x7,	%g1
	set	0x5,	%g2
	set	0x9,	%g3
	set	0x3,	%g4
	set	0x1,	%g5
	set	0x5,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0x6,	%i0
	set	-0x7,	%i1
	set	-0xD,	%i2
	set	-0xB,	%i3
	set	-0x3,	%i4
	set	-0xB,	%i5
	set	-0x7,	%i6
	set	-0x5,	%i7
	!# Local registers
	set	0x020F4192,	%l0
	set	0x0BA3EF24,	%l1
	set	0x39EB3800,	%l2
	set	0x23120C12,	%l3
	set	0x7DB6EAE5,	%l4
	set	0x16D8624F,	%l5
	set	0x046D2449,	%l6
	!# Output registers
	set	-0x0C58,	%o0
	set	-0x1B44,	%o1
	set	0x1E89,	%o2
	set	-0x0CD9,	%o3
	set	0x1214,	%o4
	set	-0x168A,	%o5
	set	0x1BFD,	%o6
	set	-0x081E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x17AE852E2B798E26)
	INIT_TH_FP_REG(%l7,%f2,0x94B6158BBA81AD6B)
	INIT_TH_FP_REG(%l7,%f4,0x3CB2E947D5C557EF)
	INIT_TH_FP_REG(%l7,%f6,0x8D197A46CF5B27CB)
	INIT_TH_FP_REG(%l7,%f8,0xC0DFC58A6A703A10)
	INIT_TH_FP_REG(%l7,%f10,0xB9B83112EB728E54)
	INIT_TH_FP_REG(%l7,%f12,0x792625131444823F)
	INIT_TH_FP_REG(%l7,%f14,0x081A6CD330918238)
	INIT_TH_FP_REG(%l7,%f16,0x9E2C8B91D46A8F60)
	INIT_TH_FP_REG(%l7,%f18,0xC5E423C5F3626442)
	INIT_TH_FP_REG(%l7,%f20,0x08585A163D73E79F)
	INIT_TH_FP_REG(%l7,%f22,0xA6093C87DD44AF0D)
	INIT_TH_FP_REG(%l7,%f24,0x66FC157E5C48C5FE)
	INIT_TH_FP_REG(%l7,%f26,0x8933F216BA49A97D)
	INIT_TH_FP_REG(%l7,%f28,0xDE5E908864B2E9A2)
	INIT_TH_FP_REG(%l7,%f30,0x8DFC1E01F80AD4AA)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fba	%fcc3,	loop_1
	brz,a	%i4,	loop_2
	sdiv	%l1,	0x10EF,	%o7
	edge16ln	%g1,	%i6,	%i2
loop_1:
	fmul8x16	%f16,	%f24,	%f24
loop_2:
	subccc	%l5,	0x0713,	%o0
	std	%f2,	[%l7 + 0x68]
	srlx	%o1,	%l4,	%g2
	swap	[%l7 + 0x5C],	%g3
	movg	%xcc,	%o5,	%l0
	edge8ln	%i0,	%l2,	%i3
	fbn	%fcc2,	loop_3
	udiv	%o3,	0x094D,	%i5
	sllx	%o2,	0x09,	%g5
	movrlz	%g6,	0x242,	%l6
loop_3:
	bneg,a	loop_4
	array16	%g7,	%g4,	%i1
	fbu	%fcc1,	loop_5
	edge8n	%l3,	%i7,	%o4
loop_4:
	fmovrsne	%o6,	%f17,	%f1
	fcmpne32	%f26,	%f4,	%i4
loop_5:
	xnor	%o7,	%g1,	%l1
	movgu	%icc,	%i2,	%l5
	add	%i6,	0x0623,	%o1
	movleu	%icc,	%l4,	%o0
	edge16ln	%g3,	%g2,	%o5
	xnorcc	%i0,	0x05F4,	%l2
	fbuge	%fcc0,	loop_6
	movcs	%xcc,	%i3,	%o3
	fmovdn	%xcc,	%f16,	%f19
	ba,a	loop_7
loop_6:
	sll	%l0,	%i5,	%o2
	swap	[%l7 + 0x30],	%g5
	bshuffle	%f16,	%f12,	%f0
loop_7:
	stx	%l6,	[%l7 + 0x60]
	orcc	%g6,	0x0C62,	%g7
	bg,a,pt	%xcc,	loop_8
	add	%i1,	0x1A04,	%g4
	fbne	%fcc2,	loop_9
	andncc	%l3,	%o4,	%o6
loop_8:
	tgu	%xcc,	0x2
	movge	%icc,	%i7,	%o7
loop_9:
	flush	%l7 + 0x58
	fmovdneg	%xcc,	%f4,	%f22
	subc	%i4,	0x0403,	%g1
	smulcc	%i2,	%l1,	%l5
	tvc	%icc,	0x0
	xorcc	%o1,	0x08DF,	%i6
	sub	%l4,	0x10C6,	%o0
	alignaddrl	%g2,	%o5,	%i0
	movrne	%g3,	0x23E,	%l2
	fmovdleu	%icc,	%f6,	%f26
	std	%f8,	[%l7 + 0x48]
	fmovsvc	%icc,	%f27,	%f31
	or	%i3,	%l0,	%o3
	fmovsneg	%icc,	%f21,	%f22
	movrne	%o2,	0x25E,	%g5
	set	0x34, %l6
	sta	%f4,	[%l7 + %l6] 0x18
	edge16	%i5,	%g6,	%g7
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	smulcc	%i1,	%g4,	%l3
	smul	%o4,	%l6,	%o6
	bneg,pt	%xcc,	loop_10
	andcc	%o7,	0x18CD,	%i4
	call	loop_11
	fand	%f26,	%f20,	%f0
loop_10:
	xnor	%g1,	%i2,	%i7
	bshuffle	%f8,	%f20,	%f6
loop_11:
	array8	%l5,	%l1,	%o1
	addcc	%i6,	0x1471,	%l4
	movge	%xcc,	%o0,	%g2
	srlx	%o5,	%i0,	%g3
	fpsub16s	%f28,	%f8,	%f24
	add	%i3,	0x1912,	%l2
	fbuge	%fcc0,	loop_12
	fbo,a	%fcc1,	loop_13
	tcc	%icc,	0x4
	nop
	setx	0x3A209B1B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x9EF889C1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f31,	%f16
loop_12:
	nop
	set	0x2A, %l0
	lduba	[%l7 + %l0] 0x14,	%l0
loop_13:
	tsubcc	%o2,	0x1E2F,	%g5
	bpos,pn	%icc,	loop_14
	movvs	%xcc,	%o3,	%g6
	udivcc	%g7,	0x06E2,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14:
	orcc	%g4,	%i5,	%o4
	brlez	%l3,	loop_15
	edge16n	%o6,	%o7,	%i4
	array8	%g1,	%i2,	%i7
	ldub	[%l7 + 0x0D],	%l5
loop_15:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x44] %asi,	%f13
	fmovrdgez	%l1,	%f14,	%f20
	sll	%l6,	0x1F,	%i6
	movvc	%xcc,	%o1,	%l4
	movneg	%icc,	%o0,	%g2
	andncc	%o5,	%i0,	%i3
	fone	%f30
	addc	%g3,	%l2,	%l0
	srl	%g5,	%o3,	%o2
	fpadd16	%f8,	%f12,	%f20
	edge8l	%g6,	%i1,	%g7
	lduw	[%l7 + 0x7C],	%g4
	fblg	%fcc2,	loop_16
	xorcc	%i5,	0x0A7A,	%l3
	ta	%xcc,	0x2
	brgez,a	%o4,	loop_17
loop_16:
	edge8ln	%o7,	%i4,	%o6
	tn	%icc,	0x5
	udivcc	%i2,	0x0D0F,	%i7
loop_17:
	nop
	setx loop_18, %l0, %l1
	jmpl %l1, %l5
	nop
	setx	loop_19,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrdgez	%l1,	%f0,	%f6
	movn	%xcc,	%g1,	%l6
loop_18:
	movvc	%icc,	%i6,	%l4
loop_19:
	tsubcc	%o0,	0x0E6F,	%g2
	tvc	%icc,	0x1
	movrlz	%o1,	0x231,	%o5
	subc	%i0,	%i3,	%l2
	tvs	%icc,	0x5
	fxor	%f24,	%f22,	%f28
	movcc	%icc,	%g3,	%l0
	nop
	setx	0x0C6C12302DE57FF4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xB852650B64310C0B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f22,	%f6
	tle	%xcc,	0x2
	alignaddrl	%o3,	%o2,	%g5
	edge8ln	%i1,	%g7,	%g6
	nop
	setx	loop_20,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addccc	%g4,	0x1D56,	%i5
	tl	%xcc,	0x2
	alignaddrl	%o4,	%o7,	%i4
loop_20:
	movle	%icc,	%l3,	%o6
	lduh	[%l7 + 0x52],	%i2
	movcc	%xcc,	%l5,	%i7
	tvc	%xcc,	0x2
	fnegd	%f14,	%f0
	orncc	%g1,	%l6,	%l1
	movg	%xcc,	%l4,	%o0
	sdivcc	%i6,	0x011D,	%o1
	std	%f26,	[%l7 + 0x40]
	udivx	%g2,	0x1B43,	%i0
	subcc	%i3,	%l2,	%o5
	nop
	fitos	%f10,	%f5
	fstox	%f5,	%f6
	fxtos	%f6,	%f27
	call	loop_21
	sub	%l0,	%o3,	%o2
	bleu,a,pt	%xcc,	loop_22
	edge8l	%g5,	%g3,	%g7
loop_21:
	stx	%i1,	[%l7 + 0x18]
	srlx	%g4,	%g6,	%o4
loop_22:
	edge8l	%o7,	%i4,	%i5
	subccc	%o6,	0x1936,	%l3
	fmovrdne	%l5,	%f26,	%f10
	stb	%i2,	[%l7 + 0x78]
	fnegs	%f9,	%f12
	tsubcctv	%i7,	0x1BED,	%l6
	movle	%icc,	%g1,	%l1
	movrgz	%o0,	0x2E6,	%l4
	bpos,a	%xcc,	loop_23
	or	%o1,	0x174A,	%g2
	bcs	%xcc,	loop_24
	fmovdn	%icc,	%f19,	%f4
loop_23:
	mulx	%i6,	%i0,	%l2
	orn	%o5,	0x0BE5,	%i3
loop_24:
	bne,pt	%icc,	loop_25
	movrgez	%l0,	%o2,	%g5
	tsubcctv	%o3,	0x0A5B,	%g3
	nop
	setx loop_26, %l0, %l1
	jmpl %l1, %g7
loop_25:
	bpos,pt	%icc,	loop_27
	fble,a	%fcc0,	loop_28
	tvs	%xcc,	0x0
loop_26:
	tn	%xcc,	0x5
loop_27:
	te	%icc,	0x6
loop_28:
	ble,a	loop_29
	subccc	%i1,	0x0B06,	%g4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x78] %asi,	%g6
loop_29:
	bvc	%xcc,	loop_30
	movg	%xcc,	%o7,	%o4
	ba,pt	%icc,	loop_31
	fnot2	%f26,	%f12
loop_30:
	fbge	%fcc2,	loop_32
	taddcctv	%i4,	0x024E,	%i5
loop_31:
	movrlz	%l3,	0x33F,	%l5
	sdivx	%o6,	0x1F21,	%i2
loop_32:
	fmovrdlez	%i7,	%f8,	%f16
	edge8	%g1,	%l1,	%o0
	edge8l	%l6,	%o1,	%g2
	orncc	%l4,	%i0,	%l2
	fbue,a	%fcc2,	loop_33
	fornot2s	%f3,	%f14,	%f30
	subccc	%i6,	%i3,	%o5
	movcc	%xcc,	%o2,	%g5
loop_33:
	bcs,a	%icc,	loop_34
	ldd	[%l7 + 0x60],	%l0
	sll	%o3,	0x05,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34:
	tle	%icc,	0x5
	movg	%xcc,	%g7,	%g4
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x20] %asi,	%i1
	movneg	%icc,	%g6,	%o4
	edge32	%o7,	%i5,	%i4
	taddcc	%l5,	0x0003,	%o6
	fmovsa	%icc,	%f18,	%f4
	fbuge	%fcc1,	loop_35
	edge32l	%l3,	%i2,	%i7
	set	0x6C, %i5
	lda	[%l7 + %i5] 0x88,	%f14
loop_35:
	fmovde	%icc,	%f4,	%f29
	sub	%l1,	%g1,	%l6
	fbo	%fcc1,	loop_36
	sdivcc	%o0,	0x042C,	%o1
	tvs	%icc,	0x7
	edge16	%l4,	%i0,	%g2
loop_36:
	fxors	%f28,	%f21,	%f1
	fandnot2s	%f13,	%f5,	%f27
	umulcc	%i6,	%i3,	%l2
	ta	%xcc,	0x2
	sllx	%o2,	%g5,	%o5
	sra	%l0,	%g3,	%g7
	xor	%o3,	0x0F3F,	%i1
	movcs	%xcc,	%g6,	%g4
	array32	%o7,	%i5,	%o4
	tcc	%xcc,	0x6
	movge	%icc,	%l5,	%i4
	tvs	%xcc,	0x4
	bpos,a	loop_37
	addccc	%l3,	%i2,	%i7
	wr	%g0,	0xea,	%asi
	stha	%o6,	[%l7 + 0x26] %asi
	membar	#Sync
loop_37:
	sdiv	%g1,	0x1A38,	%l1
	sllx	%l6,	%o0,	%l4
	fsrc1s	%f6,	%f2
	lduh	[%l7 + 0x48],	%i0
	movn	%xcc,	%o1,	%g2
	edge32n	%i6,	%i3,	%l2
	fmovrslz	%o2,	%f30,	%f1
	bg	%xcc,	loop_38
	tn	%icc,	0x7
	sub	%g5,	0x0D24,	%o5
	movrne	%l0,	%g3,	%o3
loop_38:
	movleu	%xcc,	%i1,	%g6
	te	%xcc,	0x2
	nop
	set	0x2C, %g5
	sth	%g4,	[%l7 + %g5]
	ldx	[%l7 + 0x10],	%o7
	fble	%fcc2,	loop_39
	array16	%i5,	%g7,	%o4
	orncc	%i4,	%l5,	%i2
	fmuld8sux16	%f24,	%f8,	%f12
loop_39:
	tvc	%xcc,	0x2
	sub	%l3,	0x13E6,	%i7
	edge32l	%g1,	%l1,	%o6
	mulx	%l6,	%o0,	%i0
	orn	%o1,	0x18D2,	%l4
	edge8ln	%g2,	%i6,	%l2
	fmovsneg	%xcc,	%f19,	%f16
	nop
	setx	loop_40,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x3
	srl	%i3,	%o2,	%g5
	fbuge	%fcc3,	loop_41
loop_40:
	prefetch	[%l7 + 0x20],	 0x1
	tg	%xcc,	0x6
	fba,a	%fcc0,	loop_42
loop_41:
	bvs,pn	%icc,	loop_43
	xnor	%l0,	%o5,	%o3
	fblg	%fcc2,	loop_44
loop_42:
	tleu	%icc,	0x7
loop_43:
	nop
	setx	0x742DB28013698560,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x0EFF2F0CCC643A21,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f12,	%f22
	edge32n	%i1,	%g3,	%g6
loop_44:
	edge16n	%o7,	%g4,	%i5
	set	0x14, %i3
	sta	%f7,	[%l7 + %i3] 0x88
	edge16l	%g7,	%o4,	%i4
	fxnors	%f7,	%f17,	%f25
	tn	%icc,	0x4
	fsrc1	%f24,	%f22
	movcs	%xcc,	%l5,	%i2
	stx	%l3,	[%l7 + 0x40]
	smulcc	%i7,	0x057E,	%g1
	srax	%o6,	%l6,	%o0
	bgu	%xcc,	loop_45
	tge	%xcc,	0x0
	set	0x12, %i0
	stba	%l1,	[%l7 + %i0] 0x22
	membar	#Sync
loop_45:
	orcc	%i0,	0x1F29,	%l4
	movgu	%icc,	%g2,	%o1
	edge16l	%i6,	%l2,	%o2
	subc	%i3,	0x0216,	%g5
	umul	%o5,	0x0C2E,	%o3
	fmul8ulx16	%f2,	%f14,	%f18
	srax	%i1,	%g3,	%l0
	fpsub16	%f28,	%f18,	%f30
	mulx	%o7,	%g4,	%i5
	fmovrslz	%g7,	%f2,	%f15
	sub	%o4,	0x0CB5,	%i4
	fblg,a	%fcc1,	loop_46
	fnot1s	%f27,	%f12
	bvs,a	loop_47
	tvc	%icc,	0x7
loop_46:
	array32	%l5,	%g6,	%i2
	edge32l	%l3,	%g1,	%i7
loop_47:
	ba,a	%xcc,	loop_48
	sllx	%l6,	%o0,	%l1
	fornot1	%f22,	%f8,	%f6
	edge8l	%o6,	%l4,	%g2
loop_48:
	movrgez	%i0,	0x097,	%i6
	addc	%o1,	%l2,	%o2
	taddcc	%g5,	0x018A,	%i3
	bneg,pt	%icc,	loop_49
	tsubcc	%o5,	%o3,	%g3
	nop
	setx	loop_50,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%l0,	%i1,	%o7
loop_49:
	tne	%xcc,	0x0
	nop
	fitod	%f0,	%f12
	fdtos	%f12,	%f6
loop_50:
	te	%xcc,	0x2
	or	%g4,	%i5,	%g7
	taddcc	%i4,	0x0EEF,	%l5
	orncc	%o4,	0x107C,	%i2
	movvc	%icc,	%l3,	%g6
	movpos	%xcc,	%g1,	%i7
	tl	%xcc,	0x7
	xor	%l6,	0x19FA,	%l1
	fbug,a	%fcc3,	loop_51
	movrgez	%o6,	%o0,	%l4
	ldstub	[%l7 + 0x2A],	%g2
	tcs	%icc,	0x3
loop_51:
	nop
	fitos	%f7,	%f14
	fstod	%f14,	%f2
	addccc	%i6,	0x0D0C,	%o1
	orncc	%i0,	0x1996,	%l2
	lduh	[%l7 + 0x28],	%g5
	tl	%xcc,	0x3
	movcc	%icc,	%i3,	%o2
	fnor	%f14,	%f20,	%f22
	tvs	%icc,	0x2
	fpsub32s	%f12,	%f7,	%f30
	bpos,a,pt	%icc,	loop_52
	umul	%o3,	%o5,	%g3
	brgez	%i1,	loop_53
	movvc	%xcc,	%o7,	%g4
loop_52:
	srlx	%i5,	0x16,	%l0
	fblg,a	%fcc0,	loop_54
loop_53:
	nop
	setx	0x3B67CA6D14E0974A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xBC334F76FEFE7B62,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f12,	%f28
	nop
	fitos	%f8,	%f30
	fstoi	%f30,	%f18
	smul	%i4,	0x0AAB,	%l5
loop_54:
	movge	%icc,	%o4,	%i2
	nop
	fitos	%f18,	%f26
	tsubcctv	%g7,	%g6,	%l3
	fandnot1	%f14,	%f18,	%f22
	sdivx	%g1,	0x1CA5,	%i7
	mova	%icc,	%l6,	%o6
	fmovdcs	%xcc,	%f11,	%f25
	fnot2s	%f13,	%f13
	edge32	%o0,	%l4,	%g2
	nop
	setx	0xB072FADA,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	orn	%l1,	0x1CA9,	%o1
	brz	%i0,	loop_55
	sll	%i6,	0x05,	%l2
	taddcctv	%i3,	0x1CDE,	%o2
	stbar
loop_55:
	fbule,a	%fcc3,	loop_56
	ld	[%l7 + 0x20],	%f17
	nop
	setx	0xE05C9AD5,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	movrlz	%o3,	0x2AA,	%g5
loop_56:
	fmuld8sux16	%f10,	%f21,	%f2
	nop
	set	0x3C, %i4
	stw	%o5,	[%l7 + %i4]
	fmovrsne	%i1,	%f3,	%f30
	fmovdge	%icc,	%f27,	%f17
	tn	%xcc,	0x2
	tcs	%icc,	0x5
	ldsh	[%l7 + 0x70],	%g3
	movrgz	%o7,	%g4,	%i5
	membar	0x0C
	udivx	%l0,	0x1199,	%l5
	movrlz	%o4,	%i4,	%g7
	or	%i2,	0x1A84,	%g6
	movg	%icc,	%g1,	%i7
	tvs	%xcc,	0x6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x04,	%l3,	%l6
	fandnot2s	%f9,	%f24,	%f9
	fmovsvs	%xcc,	%f18,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o0,	%o6,	%g2
	fbule,a	%fcc1,	loop_57
	smul	%l1,	%l4,	%i0
	fble	%fcc2,	loop_58
	tsubcc	%o1,	0x04A9,	%i6
loop_57:
	addccc	%l2,	%o2,	%i3
	smulcc	%g5,	0x00ED,	%o3
loop_58:
	edge32n	%o5,	%g3,	%i1
	tn	%xcc,	0x3
	brlez,a	%g4,	loop_59
	fornot2	%f12,	%f8,	%f26
	bn	%xcc,	loop_60
	movrne	%o7,	%i5,	%l5
loop_59:
	bneg,a,pt	%xcc,	loop_61
	sethi	0x1F85,	%o4
loop_60:
	brlez,a	%l0,	loop_62
	edge32ln	%i4,	%g7,	%g6
loop_61:
	nop
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f16
loop_62:
	tsubcctv	%i2,	%i7,	%l3
	udivcc	%l6,	0x12A4,	%g1
	sll	%o0,	0x03,	%o6
	sir	0x144A
	wr	%g0,	0x89,	%asi
	stxa	%g2,	[%l7 + 0x30] %asi
	ldstub	[%l7 + 0x36],	%l4
	ble,a	loop_63
	fmuld8ulx16	%f16,	%f16,	%f4
	fzero	%f30
	popc	%l1,	%o1
loop_63:
	fmovsa	%icc,	%f20,	%f27
	fmovsneg	%xcc,	%f23,	%f0
	sdivcc	%i6,	0x1138,	%l2
	fmovdn	%xcc,	%f17,	%f14
	movrgez	%o2,	0x0F6,	%i3
	udiv	%g5,	0x13CB,	%i0
	bne,pn	%icc,	loop_64
	fbg,a	%fcc3,	loop_65
	tn	%xcc,	0x4
	umulcc	%o3,	0x00EE,	%g3
loop_64:
	ta	%xcc,	0x4
loop_65:
	fmovrdlz	%o5,	%f22,	%f4
	or	%g4,	%o7,	%i5
	set	0x18, %o0
	ldswa	[%l7 + %o0] 0x0c,	%l5
	sdivcc	%o4,	0x0B71,	%l0
	taddcc	%i1,	0x0C36,	%g7
	tle	%xcc,	0x2
	umul	%i4,	%g6,	%i7
	fabss	%f20,	%f30
	edge32	%l3,	%l6,	%i2
	ba,pt	%icc,	loop_66
	tvs	%icc,	0x5
	fpack16	%f24,	%f19
	array16	%g1,	%o6,	%g2
loop_66:
	tl	%icc,	0x1
	andcc	%o0,	0x013F,	%l1
	movne	%icc,	%l4,	%i6
	tcc	%icc,	0x7
	move	%xcc,	%o1,	%l2
	nop
	fitod	%f12,	%f2
	fdtox	%f2,	%f28
	nop
	set	0x28, %i1
	ldd	[%l7 + %i1],	%i2
	xor	%g5,	%o2,	%o3
	swap	[%l7 + 0x0C],	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc3,	loop_67
	edge16n	%g3,	%o5,	%g4
	set	0x09, %g1
	lduba	[%l7 + %g1] 0x18,	%o7
loop_67:
	movvc	%xcc,	%l5,	%o4
	brlez,a	%l0,	loop_68
	movl	%icc,	%i1,	%i5
	edge8	%g7,	%i4,	%g6
	set	0x60, %l1
	ldsha	[%l7 + %l1] 0x15,	%l3
loop_68:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x4
	fmul8ulx16	%f10,	%f0,	%f10
	fnegs	%f24,	%f9
	subc	%l6,	%i7,	%g1
	tcs	%icc,	0x0
	membar	0x0C
	movg	%xcc,	%i2,	%g2
	edge8ln	%o6,	%l1,	%l4
	edge32ln	%o0,	%i6,	%l2
	edge8	%i3,	%g5,	%o1
	bge,a	loop_69
	tgu	%icc,	0x2
	tne	%xcc,	0x3
	fbuge,a	%fcc0,	loop_70
loop_69:
	tcc	%xcc,	0x1
	subccc	%o2,	0x1571,	%i0
	subc	%o3,	%o5,	%g3
loop_70:
	sir	0x0D25
	movle	%icc,	%o7,	%l5
	fmovsle	%icc,	%f9,	%f6
	nop
	setx	loop_71,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x6
	array16	%g4,	%o4,	%i1
	tvs	%xcc,	0x4
loop_71:
	umul	%l0,	0x0B37,	%g7
	orn	%i5,	%g6,	%i4
	sllx	%l6,	0x1A,	%i7
	smulcc	%g1,	0x04AE,	%i2
	edge16n	%l3,	%g2,	%o6
	srax	%l1,	0x04,	%o0
	mulx	%l4,	0x06F5,	%i6
	edge16ln	%l2,	%i3,	%g5
	srlx	%o1,	0x15,	%o2
	movvs	%xcc,	%i0,	%o5
	fbl	%fcc1,	loop_72
	edge8n	%o3,	%g3,	%l5
	tvc	%icc,	0x0
	ldd	[%l7 + 0x30],	%g4
loop_72:
	popc	0x05BA,	%o4
	edge32n	%i1,	%o7,	%g7
	movcc	%xcc,	%i5,	%g6
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x2B] %asi,	%i4
	tn	%xcc,	0x4
	fbl,a	%fcc0,	loop_73
	fmuld8sux16	%f24,	%f16,	%f4
	udivcc	%l0,	0x03A7,	%i7
	movcs	%xcc,	%l6,	%i2
loop_73:
	movpos	%xcc,	%g1,	%l3
	sll	%o6,	%g2,	%l1
	tsubcctv	%l4,	0x1B5A,	%i6
	stb	%l2,	[%l7 + 0x4F]
	array16	%i3,	%o0,	%g5
	sll	%o2,	0x09,	%i0
	fbn,a	%fcc2,	loop_74
	bg	%icc,	loop_75
	faligndata	%f24,	%f4,	%f22
	brlz,a	%o5,	loop_76
loop_74:
	movcc	%icc,	%o1,	%o3
loop_75:
	ldx	[%l7 + 0x10],	%g3
	movrne	%l5,	0x263,	%o4
loop_76:
	sdivcc	%g4,	0x185D,	%o7
	taddcc	%g7,	0x1E8E,	%i5
	sir	0x1BBA
	swap	[%l7 + 0x3C],	%i1
	xor	%g6,	%i4,	%l0
	nop
	setx	0x7F9071ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f4
	fpadd16	%f18,	%f0,	%f22
	te	%icc,	0x4
	tne	%icc,	0x4
	movvs	%icc,	%i7,	%l6
	fsrc2s	%f6,	%f25
	fbne	%fcc1,	loop_77
	tge	%icc,	0x5
	udiv	%g1,	0x163C,	%i2
	fexpand	%f22,	%f24
loop_77:
	membar	0x21
	taddcctv	%o6,	%l3,	%g2
	edge8ln	%l1,	%l4,	%l2
	edge32n	%i3,	%i6,	%o0
	orcc	%g5,	%o2,	%i0
	fmovrdlez	%o5,	%f30,	%f8
	ldd	[%l7 + 0x28],	%o0
	ldsw	[%l7 + 0x28],	%o3
	fmovdgu	%icc,	%f6,	%f8
	nop
	fitos	%f3,	%f26
	fstoi	%f26,	%f9
	edge8l	%l5,	%g3,	%o4
	movcc	%xcc,	%o7,	%g7
	sll	%g4,	0x06,	%i1
	fmovse	%icc,	%f9,	%f27
	set	0x24, %l2
	lduba	[%l7 + %l2] 0x88,	%i5
	movg	%icc,	%g6,	%l0
	addcc	%i7,	0x00E1,	%l6
	fbe	%fcc2,	loop_78
	nop
	setx	loop_79,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bgu,a,pn	%icc,	loop_80
	sdiv	%i4,	0x03A8,	%i2
loop_78:
	nop
	setx	0x39D095CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xC18BFD32,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f1,	%f25
loop_79:
	movcs	%icc,	%g1,	%l3
loop_80:
	fmovsle	%icc,	%f29,	%f2
	and	%g2,	%l1,	%o6
	srax	%l2,	0x0A,	%l4
	bpos	%icc,	loop_81
	movrlz	%i3,	%o0,	%i6
	fmovsg	%xcc,	%f23,	%f3
	ba	loop_82
loop_81:
	fbg,a	%fcc2,	loop_83
	edge32n	%g5,	%o2,	%o5
	fmovrdlez	%i0,	%f6,	%f12
loop_82:
	nop
	wr	%g0,	0x81,	%asi
	stba	%o1,	[%l7 + 0x62] %asi
loop_83:
	nop
	fitos	%f7,	%f23
	fstod	%f23,	%f6
	xnorcc	%o3,	0x046C,	%l5
	fbn	%fcc1,	loop_84
	nop
	setx	0xEF138E80467A71AC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x8693D0ECD483B880,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f18,	%f30
	fbn,a	%fcc2,	loop_85
	subccc	%o4,	%g3,	%g7
loop_84:
	mulscc	%o7,	0x106F,	%i1
	srlx	%i5,	0x1C,	%g6
loop_85:
	fcmple32	%f2,	%f14,	%g4
	umulcc	%i7,	0x158A,	%l0
	tgu	%icc,	0x1
	movge	%xcc,	%l6,	%i4
	sra	%i2,	%g1,	%l3
	smulcc	%l1,	%o6,	%g2
	movrgz	%l2,	%l4,	%i3
	subcc	%i6,	0x0B4F,	%o0
	fnot1s	%f31,	%f27
	move	%icc,	%o2,	%o5
	umulcc	%g5,	%i0,	%o3
	set	0x68, %i2
	sta	%f14,	[%l7 + %i2] 0x89
	fnot1s	%f22,	%f31
	xnorcc	%o1,	0x009E,	%o4
	fandnot1	%f4,	%f14,	%f6
	smulcc	%l5,	0x1513,	%g7
	tneg	%icc,	0x4
	tge	%icc,	0x3
	movcc	%xcc,	%g3,	%i1
	orn	%i5,	%g6,	%g4
	movge	%icc,	%i7,	%l0
	srlx	%l6,	%i4,	%i2
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x16, %o5
	stba	%o7,	[%l7 + %o5] 0x10
	addc	%g1,	%l1,	%o6
	fsrc2	%f12,	%f24
	ta	%icc,	0x3
	fmovsgu	%icc,	%f12,	%f28
	udiv	%g2,	0x1A1C,	%l3
	addcc	%l4,	0x1515,	%i3
	fmovdvs	%xcc,	%f27,	%f29
	tge	%xcc,	0x1
	set	0x68, %g6
	stha	%i6,	[%l7 + %g6] 0x19
	fbule	%fcc0,	loop_86
	ld	[%l7 + 0x1C],	%f12
	fmovdg	%icc,	%f21,	%f24
	edge8	%o0,	%o2,	%o5
loop_86:
	nop
	set	0x74, %o7
	lduha	[%l7 + %o7] 0x81,	%l2
	movre	%g5,	%i0,	%o3
	xnor	%o1,	0x0E16,	%l5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g7,	%o4
	addccc	%i1,	%g3,	%g6
	movn	%icc,	%i5,	%g4
	nop
	setx	0x09830B2C622ADE2C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xC46F2568BF7D11DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f26,	%f28
	prefetch	[%l7 + 0x18],	 0x2
	fpsub16	%f28,	%f30,	%f20
	movre	%l0,	0x286,	%l6
	bn,a	%xcc,	loop_87
	nop
	setx loop_88, %l0, %l1
	jmpl %l1, %i7
	fmovrdgez	%i4,	%f4,	%f0
	orn	%i2,	0x0657,	%o7
loop_87:
	movrlez	%g1,	%l1,	%g2
loop_88:
	brnz	%o6,	loop_89
	movrlz	%l4,	%l3,	%i3
	bvs	loop_90
	fbule,a	%fcc2,	loop_91
loop_89:
	movleu	%xcc,	%o0,	%i6
	fnegs	%f24,	%f11
loop_90:
	fnegd	%f8,	%f4
loop_91:
	membar	0x17
	fandnot1s	%f19,	%f6,	%f24
	tcs	%xcc,	0x3
	xnor	%o2,	%o5,	%l2
	mulx	%i0,	0x0BCA,	%g5
	ldx	[%l7 + 0x20],	%o3
	edge16ln	%l5,	%g7,	%o1
	udiv	%o4,	0x1DA9,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g3,	0x0F,	%i5
	xnorcc	%g4,	0x042C,	%g6
	udivx	%l6,	0x125B,	%i7
	movge	%xcc,	%i4,	%l0
	subccc	%i2,	%o7,	%g1
	ta	%icc,	0x1
	brlz	%l1,	loop_92
	sdiv	%g2,	0x0A16,	%l4
	fble	%fcc0,	loop_93
	tle	%icc,	0x0
loop_92:
	stw	%o6,	[%l7 + 0x24]
	sdiv	%i3,	0x1D96,	%o0
loop_93:
	ta	%xcc,	0x3
	edge32l	%l3,	%o2,	%i6
	bl,a,pt	%xcc,	loop_94
	alignaddrl	%o5,	%l2,	%i0
	tne	%xcc,	0x2
	tsubcc	%g5,	%o3,	%l5
loop_94:
	tn	%icc,	0x6
	umul	%o1,	0x1247,	%g7
	sdivcc	%o4,	0x0DF2,	%g3
	movrlz	%i5,	0x320,	%g4
	fpadd16	%f8,	%f16,	%f22
	fbg	%fcc3,	loop_95
	fble,a	%fcc2,	loop_96
	fsrc2s	%f17,	%f16
	sir	0x018E
loop_95:
	nop
	wr	%g0,	0x81,	%asi
	stxa	%i1,	[%l7 + 0x70] %asi
loop_96:
	nop
	set	0x3C, %l3
	lduha	[%l7 + %l3] 0x18,	%g6
	udivx	%l6,	0x1866,	%i4
	movcc	%icc,	%i7,	%i2
	edge8l	%o7,	%l0,	%l1
	membar	0x28
	array32	%g1,	%g2,	%o6
	smul	%l4,	0x0BCE,	%o0
	tpos	%xcc,	0x1
	te	%icc,	0x4
	fones	%f18
	fnot1	%f18,	%f6
	edge32n	%i3,	%l3,	%i6
	edge8ln	%o5,	%l2,	%o2
	wr	%g0,	0x04,	%asi
	stba	%i0,	[%l7 + 0x44] %asi
	tvs	%icc,	0x1
	set	0x60, %l4
	stwa	%o3,	[%l7 + %l4] 0xe2
	membar	#Sync
	te	%icc,	0x5
	udivx	%l5,	0x1AE0,	%g5
	sdivx	%o1,	0x0B03,	%g7
	nop
	setx	0x5533880B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x8B50ED2E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f4,	%f2
	bvs	%icc,	loop_97
	tn	%xcc,	0x4
	movcc	%icc,	%o4,	%i5
	bneg	%xcc,	loop_98
loop_97:
	movle	%icc,	%g3,	%g4
	movrlz	%g6,	0x12F,	%l6
	fsrc2	%f4,	%f12
loop_98:
	tcc	%icc,	0x1
	udiv	%i1,	0x074F,	%i4
	fmul8ulx16	%f2,	%f12,	%f12
	popc	%i7,	%o7
	tn	%icc,	0x6
	sra	%l0,	%l1,	%i2
	nop
	setx	0xFD28928A118597F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x5213BFD4B56AF05A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fmuld	%f6,	%f22,	%f28
	fornot2	%f16,	%f20,	%f2
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	tne	%icc,	0x5
	fmul8x16au	%f15,	%f23,	%f2
	bcs,pn	%icc,	loop_99
	sll	%g2,	0x00,	%g1
	array8	%o6,	%o0,	%i3
	addccc	%l3,	0x13C7,	%l4
loop_99:
	nop
	setx	0x56C7BF8F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f30
	fmovrdgez	%i6,	%f16,	%f8
	fmul8ulx16	%f12,	%f30,	%f16
	fbu,a	%fcc0,	loop_100
	bcc	%icc,	loop_101
	edge8l	%o5,	%o2,	%i0
	nop
	fitod	%f29,	%f26
loop_100:
	nop
	fitos	%f13,	%f15
	fstod	%f15,	%f4
loop_101:
	fba,a	%fcc1,	loop_102
	movpos	%icc,	%o3,	%l5
	st	%f28,	[%l7 + 0x44]
	fcmpeq32	%f2,	%f22,	%l2
loop_102:
	mulx	%g5,	%g7,	%o1
	set	0x11, %g3
	stba	%o4,	[%l7 + %g3] 0x23
	membar	#Sync
	fbul,a	%fcc2,	loop_103
	bneg	%icc,	loop_104
	orcc	%g3,	%g4,	%g6
	nop
	fitos	%f3,	%f5
	fstoi	%f5,	%f10
loop_103:
	edge16l	%i5,	%i1,	%l6
loop_104:
	edge32l	%i7,	%i4,	%l0
	nop
	setx loop_105, %l0, %l1
	jmpl %l1, %l1
	alignaddr	%i2,	%g2,	%g1
	array8	%o6,	%o0,	%o7
	subccc	%l3,	0x0C5D,	%l4
loop_105:
	sdiv	%i6,	0x1039,	%i3
	edge16ln	%o5,	%o2,	%o3
	array32	%l5,	%l2,	%i0
	swap	[%l7 + 0x44],	%g7
	fmovdvs	%xcc,	%f22,	%f14
	mulscc	%g5,	%o4,	%o1
	xnorcc	%g4,	%g6,	%g3
	membar	0x20
	array8	%i1,	%l6,	%i7
	movgu	%xcc,	%i5,	%i4
	nop
	fitod	%f4,	%f24
	fdtox	%f24,	%f0
	edge32l	%l0,	%l1,	%i2
	umulcc	%g1,	0x0361,	%g2
	popc	0x0F76,	%o0
	wr	%g0,	0x11,	%asi
	sta	%f10,	[%l7 + 0x34] %asi
	fnands	%f24,	%f21,	%f25
	xor	%o7,	0x11B9,	%o6
	popc	%l4,	%i6
	ldsw	[%l7 + 0x3C],	%l3
	tg	%icc,	0x5
	movre	%i3,	%o5,	%o2
	edge16ln	%o3,	%l2,	%i0
	fbe	%fcc0,	loop_106
	fnot1s	%f2,	%f27
	movpos	%xcc,	%g7,	%g5
	stbar
loop_106:
	fornot1s	%f13,	%f17,	%f4
	faligndata	%f6,	%f4,	%f6
	nop
	set	0x18, %l5
	lduw	[%l7 + %l5],	%o4
	add	%l5,	%o1,	%g6
	fmovdvs	%icc,	%f15,	%f1
	movrgz	%g3,	0x370,	%i1
	movl	%xcc,	%l6,	%i7
	xnor	%g4,	%i4,	%i5
	orcc	%l0,	0x0EB6,	%i2
	tcc	%icc,	0x2
	movle	%icc,	%g1,	%g2
	fzero	%f28
	tpos	%xcc,	0x5
	fmovscc	%icc,	%f31,	%f22
	srlx	%l1,	%o0,	%o7
	fbul,a	%fcc2,	loop_107
	addcc	%l4,	%o6,	%i6
	udivcc	%l3,	0x11F6,	%i3
	nop
	setx	0xB268328BCB2614E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f2
loop_107:
	add	%o2,	%o5,	%o3
	fbug	%fcc1,	loop_108
	mulscc	%l2,	0x004C,	%i0
	fmovsleu	%xcc,	%f23,	%f8
	fnand	%f14,	%f20,	%f28
loop_108:
	sdivx	%g7,	0x0884,	%o4
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x70] %asi,	%f11
	tcc	%icc,	0x2
	fnor	%f26,	%f4,	%f4
	fpackfix	%f20,	%f10
	edge16ln	%g5,	%l5,	%o1
	fandnot2	%f12,	%f30,	%f0
	nop
	set	0x52, %g2
	lduh	[%l7 + %g2],	%g3
	bne	%xcc,	loop_109
	edge32l	%g6,	%l6,	%i7
	set	0x68, %o4
	ldsha	[%l7 + %o4] 0x88,	%i1
loop_109:
	popc	0x0AA0,	%i4
	fnegd	%f26,	%f28
	lduh	[%l7 + 0x6E],	%i5
	nop
	fitos	%f14,	%f5
	fstoi	%f5,	%f21
	sdiv	%l0,	0x10FF,	%g4
	sdivcc	%i2,	0x0C55,	%g2
	nop
	set	0x74, %o6
	lduw	[%l7 + %o6],	%g1
	ldub	[%l7 + 0x73],	%o0
	edge16ln	%o7,	%l4,	%o6
	sdivcc	%l1,	0x128D,	%i6
	wr	%g0,	0x57,	%asi
	stxa	%i3,	[%g0 + 0x0] %asi
	fpackfix	%f26,	%f20
	movcc	%xcc,	%l3,	%o2
	fsrc2s	%f18,	%f1
	brz,a	%o3,	loop_110
	edge8l	%l2,	%o5,	%g7
	nop
	fitod	%f4,	%f26
	fdtox	%f26,	%f24
	fnot1s	%f0,	%f9
loop_110:
	nop
	setx	0xD4401464,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f7
	fzero	%f4
	wr	%g0,	0x18,	%asi
	stba	%o4,	[%l7 + 0x44] %asi
	fmovrdlez	%g5,	%f6,	%f16
	edge8n	%i0,	%l5,	%g3
	tge	%xcc,	0x3
	fbg,a	%fcc1,	loop_111
	orn	%g6,	0x1D9B,	%l6
	array8	%i7,	%i1,	%o1
	brgez	%i5,	loop_112
loop_111:
	udivcc	%i4,	0x18CC,	%g4
	edge8l	%l0,	%g2,	%i2
	xorcc	%o0,	0x1A18,	%g1
loop_112:
	ldstub	[%l7 + 0x64],	%l4
	edge8	%o7,	%l1,	%o6
	addcc	%i3,	%l3,	%i6
	fmovrslz	%o2,	%f12,	%f1
	fandnot2	%f16,	%f24,	%f4
	movne	%xcc,	%o3,	%l2
	array32	%o5,	%g7,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i0,	%o4
	tge	%xcc,	0x6
	sllx	%l5,	0x1E,	%g3
	array16	%l6,	%g6,	%i1
	swap	[%l7 + 0x38],	%o1
	movrne	%i7,	0x2C3,	%i5
	nop
	set	0x60, %o2
	ldd	[%l7 + %o2],	%f24
	membar	0x60
	stbar
	srl	%i4,	0x06,	%l0
	ldub	[%l7 + 0x2F],	%g4
	addcc	%i2,	%o0,	%g1
	add	%g2,	%l4,	%o7
	sdiv	%l1,	0x1053,	%i3
	sethi	0x0E17,	%l3
	edge8n	%i6,	%o2,	%o3
	array32	%o6,	%o5,	%l2
	fmovsl	%icc,	%f20,	%f28
	fmovsvc	%icc,	%f7,	%f6
	movrlez	%g5,	%i0,	%g7
	xor	%o4,	0x11D8,	%l5
	move	%icc,	%l6,	%g3
	xnorcc	%i1,	0x1CAB,	%o1
	movgu	%icc,	%g6,	%i5
	andncc	%i7,	%l0,	%g4
	array16	%i4,	%i2,	%o0
	srl	%g2,	0x19,	%g1
	ldsh	[%l7 + 0x5A],	%l4
	edge32n	%l1,	%i3,	%l3
	sdiv	%i6,	0x1A49,	%o2
	movvc	%icc,	%o3,	%o6
	taddcc	%o7,	%l2,	%g5
	array32	%i0,	%o5,	%o4
	tcs	%xcc,	0x6
	fmovsl	%icc,	%f29,	%f8
	sir	0x1639
	set	0x10, %i7
	lduwa	[%l7 + %i7] 0x14,	%g7
	nop
	setx	0xFD293F442FE2A527,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xC301282962D35488,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f18,	%f30
	stw	%l6,	[%l7 + 0x5C]
	addccc	%l5,	%g3,	%o1
	tvc	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0B] %asi,	%i1
	fsrc2	%f14,	%f28
	addc	%i5,	%i7,	%g6
	movre	%g4,	%i4,	%i2
	alignaddr	%o0,	%l0,	%g2
	bgu,a,pn	%icc,	loop_113
	movcs	%icc,	%g1,	%l4
	fbn,a	%fcc3,	loop_114
	taddcc	%l1,	0x0408,	%l3
loop_113:
	fnot1	%f24,	%f12
	std	%f16,	[%l7 + 0x50]
loop_114:
	fcmpeq16	%f4,	%f24,	%i3
	sdiv	%i6,	0x1601,	%o2
	srlx	%o6,	0x0B,	%o3
	fnot2s	%f18,	%f23
	sethi	0x1631,	%l2
	edge8n	%g5,	%i0,	%o7
	set	0x40, %g7
	lduwa	[%l7 + %g7] 0x88,	%o5
	sethi	0x1309,	%g7
	tne	%xcc,	0x6
	sth	%l6,	[%l7 + 0x5A]
	fxnors	%f25,	%f16,	%f12
	sdivx	%o4,	0x0EC1,	%l5
	movl	%xcc,	%g3,	%o1
	edge16	%i1,	%i7,	%g6
	sll	%i5,	%g4,	%i4
	edge16n	%i2,	%l0,	%o0
	movpos	%icc,	%g1,	%l4
	tgu	%icc,	0x5
	stbar
	tsubcctv	%l1,	%l3,	%i3
	tvs	%icc,	0x3
	movge	%icc,	%g2,	%i6
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f29
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x17
	membar	#Sync
	fsrc1s	%f23,	%f18
	tsubcctv	%o2,	%o3,	%o6
	te	%icc,	0x6
	nop
	fitos	%f12,	%f17
	fstox	%f17,	%f10
	fcmpne32	%f20,	%f24,	%g5
	edge16n	%i0,	%o7,	%o5
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32l	%l2,	%l6,	%g7
	ble,pn	%xcc,	loop_115
	and	%l5,	%g3,	%o4
	fmovrsgez	%o1,	%f8,	%f25
	fmovdpos	%xcc,	%f1,	%f4
loop_115:
	or	%i1,	0x0BA6,	%g6
	tgu	%icc,	0x1
	brgz,a	%i5,	loop_116
	movvc	%icc,	%i7,	%i4
	fmovsleu	%icc,	%f1,	%f8
	ld	[%l7 + 0x2C],	%f20
loop_116:
	fornot1	%f6,	%f4,	%f20
	andcc	%i2,	%l0,	%g4
	movvs	%xcc,	%o0,	%l4
	xorcc	%l1,	%g1,	%i3
	brz	%l3,	loop_117
	fexpand	%f19,	%f26
	edge32ln	%g2,	%i6,	%o2
	edge32ln	%o3,	%g5,	%i0
loop_117:
	movn	%xcc,	%o6,	%o5
	bgu,a,pt	%xcc,	loop_118
	fmovdcs	%icc,	%f16,	%f14
	sra	%l2,	%l6,	%o7
	array16	%l5,	%g3,	%g7
loop_118:
	tge	%icc,	0x0
	fbe,a	%fcc1,	loop_119
	movne	%icc,	%o1,	%o4
	fcmpne16	%f30,	%f22,	%i1
	bne	%xcc,	loop_120
loop_119:
	faligndata	%f8,	%f16,	%f24
	bge,pn	%xcc,	loop_121
	tl	%icc,	0x4
loop_120:
	fnegs	%f6,	%f16
	movg	%icc,	%i5,	%i7
loop_121:
	umul	%i4,	%g6,	%i2
	tcs	%icc,	0x7
	movpos	%xcc,	%g4,	%o0
	sethi	0x05BD,	%l0
	fmul8ulx16	%f30,	%f18,	%f2
	andcc	%l4,	0x1204,	%g1
	xnorcc	%l1,	%i3,	%g2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x78] %asi,	%i6
	tcc	%xcc,	0x6
	fbug	%fcc0,	loop_122
	xnor	%l3,	%o2,	%g5
	movn	%icc,	%o3,	%o6
	bne,pt	%xcc,	loop_123
loop_122:
	stw	%i0,	[%l7 + 0x60]
	brnz	%l2,	loop_124
	fblg,a	%fcc1,	loop_125
loop_123:
	tge	%xcc,	0x1
	fcmpgt16	%f22,	%f10,	%o5
loop_124:
	popc	%l6,	%l5
loop_125:
	nop
	set	0x27, %o3
	lduba	[%l7 + %o3] 0x18,	%g3
	sra	%g7,	0x0C,	%o1
	srax	%o4,	%o7,	%i1
	orncc	%i5,	0x0F2E,	%i7
	tcs	%icc,	0x2
	taddcctv	%i4,	0x053D,	%g6
	movne	%xcc,	%i2,	%o0
	set	0x38, %l6
	ldxa	[%l7 + %l6] 0x89,	%g4
	bleu,a	loop_126
	fors	%f2,	%f1,	%f7
	tneg	%icc,	0x0
	fornot2s	%f8,	%f16,	%f6
loop_126:
	tvc	%xcc,	0x4
	movle	%xcc,	%l4,	%g1
	fmovdpos	%xcc,	%f31,	%f18
	edge32	%l0,	%l1,	%i3
	mulx	%g2,	0x1A17,	%l3
	nop
	setx	0x7593B34AC04A100D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f22,	%f0,	%f26
	tneg	%icc,	0x7
	bgu	%icc,	loop_127
	sdivx	%i6,	0x1D16,	%g5
	brlz	%o3,	loop_128
	tgu	%icc,	0x6
loop_127:
	movvs	%icc,	%o2,	%o6
	fblg	%fcc3,	loop_129
loop_128:
	tsubcc	%l2,	%i0,	%o5
	call	loop_130
	tge	%xcc,	0x1
loop_129:
	nop
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x74] %asi,	%f28
loop_130:
	stbar
	brnz,a	%l6,	loop_131
	andncc	%g3,	%g7,	%o1
	movge	%xcc,	%o4,	%o7
	umulcc	%i1,	0x1E8F,	%l5
loop_131:
	tvc	%xcc,	0x6
	bge,pt	%xcc,	loop_132
	fnot2	%f22,	%f0
	and	%i7,	0x0134,	%i5
	subcc	%g6,	0x03E8,	%i4
loop_132:
	array16	%o0,	%g4,	%l4
	srl	%i2,	0x0D,	%g1
	tl	%xcc,	0x4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%l0
	sir	0x1471
	fmovse	%icc,	%f27,	%f12
	alignaddr	%l1,	%i3,	%g2
	addccc	%l3,	%g5,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o2,	%i6,	%l2
	wr	%g0,	0x04,	%asi
	stha	%i0,	[%l7 + 0x60] %asi
	andncc	%o6,	%o5,	%l6
	sdivcc	%g7,	0x1824,	%g3
	udivcc	%o1,	0x1CA1,	%o4
	nop
	fitos	%f9,	%f12
	fstod	%f12,	%f18
	move	%xcc,	%i1,	%o7
	fnands	%f28,	%f0,	%f23
	movne	%xcc,	%i7,	%l5
	sllx	%g6,	0x05,	%i5
	alignaddrl	%i4,	%o0,	%g4
	ldsw	[%l7 + 0x3C],	%i2
	brgez,a	%g1,	loop_133
	popc	0x192C,	%l4
	movre	%l1,	0x37E,	%i3
	movpos	%xcc,	%g2,	%l0
loop_133:
	tn	%xcc,	0x0
	movneg	%icc,	%l3,	%g5
	smulcc	%o3,	0x1A56,	%o2
	array32	%l2,	%i0,	%i6
	fble	%fcc0,	loop_134
	tle	%xcc,	0x3
	fones	%f25
	mulx	%o6,	%o5,	%l6
loop_134:
	brz	%g7,	loop_135
	movvs	%xcc,	%g3,	%o4
	subccc	%o1,	0x0ADD,	%i1
	wr	%g0,	0x0c,	%asi
	stha	%o7,	[%l7 + 0x52] %asi
loop_135:
	xor	%i7,	0x1499,	%l5
	udivx	%g6,	0x0EF6,	%i5
	stw	%o0,	[%l7 + 0x3C]
	mulx	%g4,	0x0676,	%i2
	fpadd32	%f18,	%f20,	%f6
	sdiv	%i4,	0x1DE7,	%l4
	nop
	fitos	%f13,	%f9
	fstod	%f9,	%f28
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x44] %asi,	%l1
	fabss	%f12,	%f31
	bcs	%icc,	loop_136
	subccc	%i3,	%g1,	%g2
	srlx	%l0,	0x04,	%l3
	fmovdg	%icc,	%f0,	%f30
loop_136:
	fandnot1s	%f30,	%f23,	%f4
	fmovrdlez	%o3,	%f26,	%f24
	ta	%icc,	0x3
	set	0x58, %l0
	lda	[%l7 + %l0] 0x0c,	%f30
	sllx	%g5,	%o2,	%i0
	orncc	%i6,	%l2,	%o6
	fmovsge	%icc,	%f21,	%f30
	set	0x1C, %o1
	lda	[%l7 + %o1] 0x0c,	%f16
	movneg	%icc,	%o5,	%l6
	fmovdg	%xcc,	%f31,	%f28
	set	0x6A, %g5
	ldsha	[%l7 + %g5] 0x89,	%g3
	tvs	%icc,	0x4
	fornot2s	%f9,	%f23,	%f25
	add	%g7,	0x12B9,	%o4
	fmul8x16au	%f6,	%f7,	%f18
	fmul8x16au	%f11,	%f1,	%f28
	tsubcc	%i1,	0x13C6,	%o7
	fmovdvc	%icc,	%f12,	%f0
	alignaddrl	%i7,	%l5,	%g6
	tle	%xcc,	0x4
	bvs,a,pn	%icc,	loop_137
	bvc,a	%icc,	loop_138
	nop
	setx	0x91194FBF07D31753,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x2637BA244BF20510,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f28,	%f30
	move	%xcc,	%i5,	%o0
loop_137:
	bcs,pt	%icc,	loop_139
loop_138:
	membar	0x25
	sllx	%g4,	%o1,	%i2
	std	%f22,	[%l7 + 0x70]
loop_139:
	udiv	%i4,	0x04E2,	%l4
	srl	%l1,	0x14,	%g1
	nop
	fitos	%f5,	%f23
	fstod	%f23,	%f8
	fbug	%fcc2,	loop_140
	nop
	setx	0x1B432782,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xCBF3D622,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f27,	%f8
	andncc	%i3,	%g2,	%l3
	nop
	setx	0xC850B790,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x2AC4176B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f0,	%f29
loop_140:
	taddcctv	%o3,	0x18D0,	%l0
	movrgez	%o2,	0x3DA,	%g5
	sethi	0x12AB,	%i6
	movpos	%xcc,	%l2,	%i0
	edge16n	%o5,	%l6,	%g3
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f31
	fbul	%fcc2,	loop_141
	tge	%xcc,	0x5
	subccc	%g7,	%o6,	%i1
	ldub	[%l7 + 0x3D],	%o7
loop_141:
	taddcctv	%i7,	%o4,	%g6
	fmovrsgez	%l5,	%f19,	%f7
	movleu	%icc,	%i5,	%o0
	brz	%g4,	loop_142
	fbn	%fcc3,	loop_143
	taddcctv	%o1,	%i4,	%l4
	fmul8x16	%f13,	%f22,	%f22
loop_142:
	edge16n	%i2,	%l1,	%g1
loop_143:
	fcmpne32	%f14,	%f28,	%g2
	edge32n	%l3,	%o3,	%i3
	movrgez	%l0,	0x2EB,	%o2
	te	%xcc,	0x3
	swap	[%l7 + 0x34],	%i6
	bn,pt	%icc,	loop_144
	movvs	%icc,	%l2,	%g5
	move	%xcc,	%o5,	%l6
	fnot1s	%f30,	%f22
loop_144:
	addcc	%g3,	%i0,	%g7
	fandnot2s	%f25,	%f10,	%f11
	and	%o6,	%i1,	%i7
	or	%o7,	%g6,	%l5
	brgz	%o4,	loop_145
	srlx	%i5,	0x17,	%o0
	movcs	%icc,	%g4,	%i4
	sll	%o1,	0x13,	%i2
loop_145:
	tneg	%icc,	0x5
	fpadd32s	%f16,	%f19,	%f9
	edge8n	%l4,	%g1,	%l1
	smul	%l3,	%g2,	%i3
	sllx	%o3,	%o2,	%l0
	fsrc2s	%f8,	%f0
	tleu	%icc,	0x0
	fnors	%f10,	%f7,	%f15
	udivcc	%i6,	0x0D62,	%g5
	set	0x50, %i5
	lduha	[%l7 + %i5] 0x80,	%l2
	fxnor	%f28,	%f0,	%f12
	tgu	%xcc,	0x1
	andcc	%o5,	%g3,	%l6
	move	%xcc,	%g7,	%i0
	tleu	%xcc,	0x6
	movrlz	%o6,	%i7,	%i1
	fmovrdne	%g6,	%f2,	%f14
	sub	%l5,	%o7,	%i5
	add	%o0,	%g4,	%i4
	st	%f28,	[%l7 + 0x50]
	fmovsa	%xcc,	%f18,	%f26
	udivcc	%o4,	0x18E2,	%o1
	bcs,a,pt	%icc,	loop_146
	tl	%icc,	0x7
	xnor	%i2,	0x1D4B,	%l4
	edge16	%l1,	%g1,	%g2
loop_146:
	fbne	%fcc0,	loop_147
	srax	%i3,	%o3,	%o2
	st	%f3,	[%l7 + 0x08]
	nop
	fitos	%f4,	%f3
loop_147:
	tvs	%xcc,	0x1
	bvs,a	loop_148
	udiv	%l3,	0x1278,	%l0
	stb	%i6,	[%l7 + 0x11]
	fba,a	%fcc2,	loop_149
loop_148:
	bleu,a,pn	%icc,	loop_150
	fmovrsgez	%g5,	%f27,	%f19
	bcs,pn	%xcc,	loop_151
loop_149:
	tne	%icc,	0x1
loop_150:
	alignaddrl	%o5,	%l2,	%l6
	mulscc	%g7,	%i0,	%o6
loop_151:
	edge32	%g3,	%i7,	%g6
	edge16n	%l5,	%o7,	%i5
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x1
	movcs	%xcc,	%g4,	%i4
	umul	%i1,	%o4,	%i2
	sdivcc	%l4,	0x13F3,	%o1
	bneg,pn	%xcc,	loop_152
	edge32ln	%l1,	%g1,	%i3
	ld	[%l7 + 0x68],	%f29
	movvs	%icc,	%o3,	%g2
loop_152:
	tpos	%icc,	0x1
	fmovspos	%xcc,	%f19,	%f3
	movne	%icc,	%o2,	%l3
	movvc	%icc,	%l0,	%g5
	brgez,a	%i6,	loop_153
	and	%o5,	0x0F2F,	%l2
	tvs	%xcc,	0x4
	array16	%l6,	%i0,	%g7
loop_153:
	srl	%o6,	0x0B,	%g3
	movre	%i7,	%l5,	%g6
	movrgez	%i5,	0x03F,	%o0
	bvc,pt	%xcc,	loop_154
	addccc	%g4,	0x1119,	%o7
	addc	%i4,	%i1,	%i2
	sll	%o4,	0x06,	%l4
loop_154:
	te	%xcc,	0x6
	te	%xcc,	0x4
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x18] %asi,	%l1
	array32	%o1,	%i3,	%g1
	tge	%xcc,	0x7
	fandnot1s	%f12,	%f7,	%f8
	fcmpne16	%f22,	%f4,	%o3
	umulcc	%o2,	%g2,	%l0
	orcc	%g5,	%l3,	%o5
	tpos	%xcc,	0x0
	fmovdleu	%icc,	%f7,	%f10
	sir	0x1F7A
	te	%xcc,	0x6
	movrlz	%l2,	0x065,	%l6
	tvs	%xcc,	0x3
	tsubcc	%i0,	0x1480,	%g7
	fbn,a	%fcc2,	loop_155
	fmovsneg	%xcc,	%f13,	%f6
	srax	%o6,	0x1A,	%i6
	brz,a	%i7,	loop_156
loop_155:
	fmul8x16al	%f14,	%f10,	%f22
	nop
	fitos	%f3,	%f15
	fstoi	%f15,	%f26
	fcmpne16	%f12,	%f8,	%g3
loop_156:
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
	ldstub	[%l7 + 0x58],	%l5
	fxnors	%f26,	%f23,	%f30
	edge8l	%g6,	%i5,	%o0
	edge16n	%o7,	%g4,	%i1
	movne	%xcc,	%i2,	%i4
	fbo	%fcc3,	loop_157
	umulcc	%l4,	0x131B,	%o4
	add	%o1,	%l1,	%g1
	andcc	%o3,	%i3,	%o2
loop_157:
	add	%l0,	0x1E51,	%g2
	movpos	%xcc,	%l3,	%g5
	tg	%xcc,	0x3
	mulx	%o5,	0x008A,	%l6
	call	loop_158
	sllx	%l2,	0x10,	%i0
	srl	%g7,	0x09,	%i6
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x68] %asi,	%o6
loop_158:
	movre	%i7,	%l5,	%g3
	andn	%g6,	0x014E,	%i5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x40] %asi,	%o0
	andcc	%o7,	%g4,	%i1
	srlx	%i2,	%l4,	%i4
	movrlz	%o1,	0x100,	%o4
	movge	%icc,	%l1,	%g1
	te	%xcc,	0x7
	andcc	%o3,	%o2,	%i3
	movn	%xcc,	%g2,	%l0
	fmovdl	%icc,	%f11,	%f19
	tleu	%xcc,	0x0
	smul	%l3,	0x09C4,	%g5
	std	%f20,	[%l7 + 0x20]
	fnor	%f22,	%f8,	%f10
	nop
	set	0x48, %i3
	prefetch	[%l7 + %i3],	 0x0
	orn	%l6,	%o5,	%i0
	fsrc1s	%f16,	%f31
	addcc	%l2,	0x148B,	%g7
	popc	0x0F70,	%i6
	alignaddrl	%o6,	%l5,	%g3
	fmovsge	%xcc,	%f26,	%f31
	movvs	%icc,	%g6,	%i5
	or	%i7,	0x1A22,	%o7
	nop
	set	0x18, %i4
	stw	%g4,	[%l7 + %i4]
	movre	%o0,	0x382,	%i2
	fmovdle	%icc,	%f2,	%f21
	tgu	%icc,	0x3
	tgu	%icc,	0x0
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x70] %asi,	%i1
	fbl,a	%fcc2,	loop_159
	edge32	%i4,	%o1,	%o4
	andn	%l4,	%l1,	%g1
	te	%icc,	0x1
loop_159:
	ble,pn	%xcc,	loop_160
	edge16n	%o2,	%i3,	%o3
	udivcc	%l0,	0x16A7,	%l3
	edge8l	%g5,	%g2,	%o5
loop_160:
	membar	0x46
	fcmpeq32	%f6,	%f24,	%l6
	tneg	%icc,	0x5
	xnor	%i0,	%l2,	%g7
	sra	%o6,	0x06,	%l5
	tne	%icc,	0x4
	edge16l	%i6,	%g3,	%g6
	fmovsl	%xcc,	%f12,	%f3
	tvc	%xcc,	0x1
	srax	%i5,	0x1C,	%o7
	wr	%g0,	0x88,	%asi
	stha	%i7,	[%l7 + 0x2C] %asi
	movneg	%xcc,	%g4,	%i2
	alignaddrl	%o0,	%i1,	%o1
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%i4
	fmovsleu	%xcc,	%f28,	%f25
	sdivx	%o4,	0x1A48,	%l4
	tneg	%icc,	0x7
	edge8	%l1,	%g1,	%i3
	sethi	0x04C2,	%o2
	bneg	%icc,	loop_161
	udivcc	%l0,	0x0E9A,	%l3
	tneg	%xcc,	0x5
	alignaddr	%o3,	%g5,	%o5
loop_161:
	nop
	fitos	%f3,	%f11
	fstod	%f11,	%f2
	tgu	%icc,	0x6
	movcs	%icc,	%g2,	%i0
	fmovrse	%l2,	%f15,	%f19
	tleu	%icc,	0x1
	fblg	%fcc0,	loop_162
	fones	%f15
	bgu,pn	%icc,	loop_163
	srlx	%l6,	%g7,	%l5
loop_162:
	fornot1s	%f28,	%f3,	%f15
	umul	%i6,	0x1843,	%o6
loop_163:
	sra	%g3,	%g6,	%o7
	subccc	%i7,	%g4,	%i2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i5,	%o0
	orn	%i1,	0x01B0,	%o1
	edge16n	%o4,	%l4,	%l1
	nop
	setx loop_164, %l0, %l1
	jmpl %l1, %g1
	movneg	%xcc,	%i3,	%o2
	array32	%i4,	%l3,	%l0
	membar	0x26
loop_164:
	srlx	%o3,	0x1B,	%o5
	udivx	%g5,	0x199D,	%g2
	array8	%l2,	%l6,	%g7
	umul	%l5,	0x1BCB,	%i6
	movcc	%xcc,	%i0,	%o6
	fpadd16	%f26,	%f6,	%f30
	tsubcctv	%g6,	%o7,	%g3
	tcs	%icc,	0x3
	srlx	%i7,	%g4,	%i5
	bcc,pn	%xcc,	loop_165
	lduw	[%l7 + 0x68],	%i2
	fand	%f16,	%f26,	%f28
	tn	%xcc,	0x7
loop_165:
	addccc	%o0,	%o1,	%i1
	umulcc	%o4,	0x1E38,	%l1
	std	%f10,	[%l7 + 0x28]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g1,	%l4
	fbl	%fcc2,	loop_166
	ldsh	[%l7 + 0x6C],	%i3
	movne	%icc,	%o2,	%i4
	edge32l	%l0,	%l3,	%o5
loop_166:
	mulscc	%g5,	0x1FFC,	%g2
	sdivx	%l2,	0x11BC,	%o3
	tn	%icc,	0x7
	tpos	%xcc,	0x7
	edge16ln	%l6,	%g7,	%l5
	wr	%g0,	0x04,	%asi
	stxa	%i6,	[%l7 + 0x48] %asi
	std	%f26,	[%l7 + 0x68]
	movg	%xcc,	%o6,	%i0
	sdiv	%g6,	0x1F23,	%g3
	movvs	%icc,	%i7,	%o7
	tsubcc	%i5,	0x05AD,	%g4
	bvc	%icc,	loop_167
	brlz,a	%i2,	loop_168
	subccc	%o1,	%i1,	%o0
	add	%o4,	%g1,	%l1
loop_167:
	smulcc	%i3,	%o2,	%i4
loop_168:
	fmovs	%f9,	%f27
	fbug,a	%fcc2,	loop_169
	mova	%icc,	%l4,	%l3
	brgz,a	%o5,	loop_170
	subcc	%g5,	%l0,	%g2
loop_169:
	fmul8x16	%f2,	%f20,	%f22
	sra	%l2,	0x1E,	%l6
loop_170:
	nop
	setx	0x60662985,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	fbuge,a	%fcc2,	loop_171
	fmovsle	%icc,	%f9,	%f2
	edge16l	%g7,	%l5,	%i6
	array32	%o3,	%i0,	%g6
loop_171:
	nop
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x81
	edge32l	%g3,	%i7,	%o6
	fmovdn	%icc,	%f0,	%f25
	udiv	%o7,	0x1800,	%g4
	sra	%i5,	%i2,	%o1
	bleu,a,pt	%icc,	loop_172
	edge32ln	%o0,	%i1,	%o4
	fcmpgt16	%f8,	%f10,	%l1
	movrgez	%i3,	0x3E5,	%g1
loop_172:
	movg	%icc,	%i4,	%o2
	fpadd32	%f28,	%f4,	%f20
	taddcctv	%l4,	0x1476,	%o5
	fandnot2s	%f3,	%f29,	%f12
	ldx	[%l7 + 0x70],	%l3
	nop
	set	0x1A, %i1
	sth	%l0,	[%l7 + %i1]
	srax	%g5,	%g2,	%l6
	fnor	%f14,	%f22,	%f12
	array8	%g7,	%l2,	%l5
	nop
	setx	loop_173,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16n	%i6,	%i0,	%g6
	fsrc1s	%f11,	%f8
	sdivx	%o3,	0x0574,	%i7
loop_173:
	for	%f10,	%f0,	%f28
	nop
	setx	0xBA037F76F58FD35A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xFBF36C64270D394E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f22,	%f20
	tl	%xcc,	0x4
	fble	%fcc0,	loop_174
	or	%g3,	%o7,	%g4
	mova	%icc,	%i5,	%o6
	xnorcc	%i2,	%o0,	%o1
loop_174:
	udivcc	%i1,	0x1890,	%o4
	smul	%i3,	0x078A,	%l1
	and	%i4,	%o2,	%l4
	set	0x57, %o0
	ldstuba	[%l7 + %o0] 0x0c,	%o5
	subccc	%g1,	0x03CC,	%l0
	fbg,a	%fcc3,	loop_175
	fmovrsgz	%l3,	%f22,	%f17
	tne	%xcc,	0x5
	fbe,a	%fcc3,	loop_176
loop_175:
	edge32ln	%g5,	%g2,	%l6
	sdivcc	%l2,	0x0751,	%l5
	sdiv	%g7,	0x18D1,	%i6
loop_176:
	ldstub	[%l7 + 0x66],	%i0
	sir	0x0A18
	tvs	%icc,	0x0
	fmovsle	%xcc,	%f6,	%f0
	fmul8ulx16	%f12,	%f0,	%f12
	fpadd32s	%f17,	%f0,	%f7
	fzero	%f28
	fmovdn	%icc,	%f12,	%f16
	stbar
	fcmple32	%f12,	%f6,	%o3
	nop
	setx	loop_177,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%i7,	0x07,	%g3
	edge16l	%g6,	%o7,	%g4
	fmovsvs	%icc,	%f3,	%f24
loop_177:
	addccc	%o6,	0x1903,	%i2
	add	%o0,	%i5,	%o1
	membar	0x55
	movleu	%xcc,	%o4,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	%fcc0,	loop_178
	tgu	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x1
loop_178:
	sdivx	%l1,	0x1819,	%i4
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x18,	%f0
	ldd	[%l7 + 0x20],	%f10
	edge16n	%i3,	%o2,	%o5
	tvs	%icc,	0x6
	add	%l4,	%g1,	%l0
	bl	%icc,	loop_179
	edge8ln	%g5,	%g2,	%l6
	movgu	%xcc,	%l2,	%l5
	nop
	setx	0xB04ECBE3,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
loop_179:
	sdivcc	%g7,	0x1E58,	%l3
	bvc	%icc,	loop_180
	ldd	[%l7 + 0x58],	%f6
	popc	0x1811,	%i6
	tvs	%xcc,	0x1
loop_180:
	mova	%xcc,	%i0,	%o3
	edge16ln	%g3,	%g6,	%o7
	lduh	[%l7 + 0x2E],	%i7
	srax	%g4,	%i2,	%o0
	tleu	%xcc,	0x7
	sdiv	%i5,	0x0D3B,	%o1
	ldsh	[%l7 + 0x5A],	%o6
	mulscc	%o4,	0x1B58,	%i1
	fbe,a	%fcc3,	loop_181
	tneg	%icc,	0x4
	sdivx	%l1,	0x15DA,	%i4
	movcc	%xcc,	%i3,	%o5
loop_181:
	fmovsleu	%icc,	%f25,	%f30
	fmovspos	%icc,	%f27,	%f29
	edge32ln	%l4,	%o2,	%l0
	nop
	setx loop_182, %l0, %l1
	jmpl %l1, %g5
	fmovdvs	%icc,	%f2,	%f2
	sub	%g1,	0x084D,	%l6
	nop
	setx	0x7CBA042FD6C4814F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f28
loop_182:
	nop
	set	0x78, %l1
	stxa	%l2,	[%l7 + %l1] 0x10
	array16	%g2,	%g7,	%l5
	brlz	%i6,	loop_183
	addccc	%i0,	0x19B4,	%o3
	movg	%icc,	%g3,	%l3
	movneg	%xcc,	%g6,	%o7
loop_183:
	movvs	%icc,	%i7,	%g4
	alignaddrl	%i2,	%i5,	%o0
	movleu	%icc,	%o6,	%o4
	bcs,a,pn	%xcc,	loop_184
	movleu	%icc,	%i1,	%l1
	brgz	%o1,	loop_185
	fors	%f12,	%f26,	%f5
loop_184:
	array8	%i4,	%i3,	%o5
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0xf0
	membar	#Sync
loop_185:
	fmovs	%f7,	%f13
	tneg	%xcc,	0x0
	smul	%o2,	%l4,	%l0
	nop
	fitos	%f4,	%f13
	fstox	%f13,	%f28
	fxtos	%f28,	%f29
	edge32ln	%g1,	%l6,	%g5
	fbue,a	%fcc0,	loop_186
	fmovspos	%icc,	%f0,	%f11
	edge16ln	%l2,	%g7,	%l5
	ldsb	[%l7 + 0x19],	%i6
loop_186:
	nop
	setx	0xE06B2162,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	fmovsn	%icc,	%f31,	%f25
	movpos	%xcc,	%i0,	%o3
	subccc	%g3,	0x0FA0,	%g2
	sllx	%l3,	%g6,	%i7
	fnand	%f0,	%f4,	%f28
	tne	%icc,	0x6
	tcc	%xcc,	0x0
	tn	%icc,	0x7
	movvs	%icc,	%g4,	%i2
	movcc	%icc,	%i5,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x32, %o5
	stha	%o6,	[%l7 + %o5] 0x81
	fpackfix	%f2,	%f2
	smul	%o7,	0x0CCF,	%o4
	andncc	%l1,	%i1,	%o1
	bvc,a	%xcc,	loop_187
	bpos,pt	%icc,	loop_188
	movle	%xcc,	%i4,	%o5
	popc	%i3,	%l4
loop_187:
	nop
	set	0x8, %g6
	stxa	%o2,	[%g0 + %g6] 0x21
loop_188:
	andcc	%l0,	0x069A,	%l6
	fnot2s	%f22,	%f4
	sdiv	%g5,	0x171B,	%g1
	mulscc	%l2,	%l5,	%g7
	ta	%icc,	0x4
	fba	%fcc3,	loop_189
	fcmpeq32	%f22,	%f2,	%i6
	fone	%f14
	alignaddrl	%i0,	%g3,	%g2
loop_189:
	fcmple16	%f2,	%f24,	%o3
	set	0x3d8, %l2
	nop 	! 	nop 	! 	ldxa	[%g0 + %l2] 0x40,	%g6 ripped by fixASI40.pl ripped by fixASI40.pl
	nop
	setx	loop_190,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tn	%xcc,	0x1
	mulscc	%i7,	0x033E,	%l3
	and	%i2,	0x063A,	%i5
loop_190:
	fnands	%f9,	%f25,	%f12
	sdivcc	%o0,	0x14C2,	%o6
	xnor	%g4,	%o4,	%o7
	edge16l	%i1,	%l1,	%i4
	fmovsge	%icc,	%f21,	%f0
	edge8ln	%o5,	%i3,	%l4
	udivx	%o2,	0x1452,	%l0
	bneg,a,pt	%xcc,	loop_191
	array16	%o1,	%g5,	%l6
	sub	%g1,	%l2,	%g7
	fbu	%fcc1,	loop_192
loop_191:
	bvs,a,pt	%xcc,	loop_193
	stw	%i6,	[%l7 + 0x5C]
	xnorcc	%l5,	%g3,	%g2
loop_192:
	membar	0x0F
loop_193:
	edge16n	%o3,	%g6,	%i0
	srl	%l3,	0x13,	%i2
	fmovd	%f0,	%f2
	ldd	[%l7 + 0x40],	%i4
	and	%i7,	0x017E,	%o0
	smul	%g4,	%o6,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f20,	%f14,	%f26
	sllx	%o4,	%i1,	%l1
	subcc	%i4,	%i3,	%l4
	array16	%o5,	%l0,	%o2
	ldd	[%l7 + 0x60],	%f14
	fba	%fcc3,	loop_194
	umul	%o1,	%g5,	%g1
	mulx	%l6,	0x1A90,	%l2
	popc	0x086C,	%i6
loop_194:
	brlz,a	%g7,	loop_195
	tvs	%xcc,	0x3
	ldx	[%l7 + 0x18],	%l5
	move	%icc,	%g2,	%o3
loop_195:
	fmul8x16	%f19,	%f18,	%f8
	bvs	%xcc,	loop_196
	movcc	%icc,	%g6,	%i0
	brz,a	%l3,	loop_197
	movl	%xcc,	%i2,	%g3
loop_196:
	nop
	setx loop_198, %l0, %l1
	jmpl %l1, %i5
	movpos	%xcc,	%o0,	%g4
loop_197:
	mova	%xcc,	%o6,	%i7
	ble,a,pt	%xcc,	loop_199
loop_198:
	fsrc2s	%f18,	%f1
	set	0x30, %o7
	ldda	[%l7 + %o7] 0x2f,	%o4
loop_199:
	alignaddrl	%o7,	%l1,	%i4
	tsubcc	%i1,	%l4,	%o5
	nop
	setx	loop_200,	%l0,	%l1
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
	edge16n	%i3,	%o2,	%o1
	movle	%icc,	%g5,	%l0
loop_200:
	udivcc	%l6,	0x0136,	%l2
	movre	%i6,	%g1,	%l5
	taddcctv	%g7,	%o3,	%g6
	addc	%i0,	%g2,	%l3
	movge	%xcc,	%g3,	%i2
	stb	%i5,	[%l7 + 0x22]
	udivcc	%o0,	0x1993,	%o6
	subccc	%i7,	0x1483,	%g4
	sub	%o7,	0x02BA,	%l1
	edge32ln	%i4,	%o4,	%l4
	edge32l	%i1,	%i3,	%o5
	movge	%xcc,	%o1,	%o2
	bvc,a,pt	%icc,	loop_201
	nop
	setx loop_202, %l0, %l1
	jmpl %l1, %l0
	addc	%l6,	0x106A,	%l2
	fbn	%fcc1,	loop_203
loop_201:
	tvs	%xcc,	0x3
loop_202:
	fbug	%fcc0,	loop_204
	nop
	setx	0xF44D110A3F242E89,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE880D881ED086239,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f16,	%f28
loop_203:
	fmovrsne	%g5,	%f16,	%f2
	membar	0x05
loop_204:
	ta	%icc,	0x3
	bcs,a	loop_205
	sllx	%i6,	0x0B,	%l5
	flush	%l7 + 0x40
	movrgz	%g7,	0x01F,	%o3
loop_205:
	brlz,a	%g1,	loop_206
	tge	%xcc,	0x1
	bg,pn	%xcc,	loop_207
	edge8l	%i0,	%g2,	%l3
loop_206:
	addc	%g6,	0x0DF1,	%g3
	movrgz	%i2,	0x389,	%i5
loop_207:
	movleu	%icc,	%o0,	%o6
	add	%i7,	%g4,	%o7
	taddcctv	%i4,	0x11B2,	%o4
	call	loop_208
	edge8	%l4,	%l1,	%i1
	edge16n	%o5,	%o1,	%o2
	bcc	loop_209
loop_208:
	srlx	%i3,	0x0C,	%l0
	xnor	%l2,	0x0584,	%g5
	fandnot1s	%f25,	%f17,	%f29
loop_209:
	andncc	%i6,	%l5,	%g7
	tsubcctv	%o3,	0x014A,	%g1
	nop
	fitos	%f9,	%f22
	fstod	%f22,	%f20
	tpos	%icc,	0x0
	tl	%xcc,	0x7
	xor	%i0,	%l6,	%g2
	movleu	%xcc,	%l3,	%g6
	movneg	%xcc,	%i2,	%i5
	fmovda	%icc,	%f6,	%f12
	movn	%icc,	%g3,	%o6
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x14,	%o0
	fxors	%f26,	%f1,	%f16
	tgu	%icc,	0x7
	movrlez	%g4,	0x2A6,	%o7
	fmuld8sux16	%f18,	%f15,	%f24
	tsubcc	%i4,	%i7,	%l4
	fbl,a	%fcc0,	loop_210
	fmul8x16al	%f23,	%f16,	%f10
	tge	%xcc,	0x7
	addccc	%o4,	0x0FDE,	%l1
loop_210:
	movrlez	%i1,	0x3C2,	%o1
	fxnor	%f10,	%f12,	%f20
	sdiv	%o2,	0x05FE,	%i3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x7C] %asi,	%f22
	edge16ln	%l0,	%l2,	%o5
	movvc	%icc,	%i6,	%l5
	add	%g7,	0x0551,	%o3
	movneg	%icc,	%g1,	%g5
	sdivx	%i0,	0x18D7,	%l6
	fba,a	%fcc3,	loop_211
	orncc	%g2,	0x159B,	%g6
	tpos	%xcc,	0x3
	array32	%l3,	%i5,	%g3
loop_211:
	edge16	%o6,	%i2,	%o0
	fmul8ulx16	%f28,	%f24,	%f10
	subc	%o7,	%i4,	%g4
	ta	%icc,	0x7
	fmovrdgez	%l4,	%f16,	%f8
	fcmpeq16	%f16,	%f10,	%o4
	array8	%i7,	%l1,	%o1
	movge	%xcc,	%i1,	%i3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%l2
	sdiv	%o5,	0x11D0,	%o2
	fnegs	%f29,	%f18
	fmul8sux16	%f8,	%f6,	%f0
	tneg	%icc,	0x3
	nop
	set	0x79, %l3
	ldstub	[%l7 + %l3],	%l5
	tsubcctv	%i6,	0x086C,	%o3
	ldstub	[%l7 + 0x67],	%g1
	smulcc	%g5,	%g7,	%i0
	fsrc1	%f8,	%f20
	fexpand	%f1,	%f20
	fandnot1s	%f1,	%f13,	%f1
	sdivx	%g2,	0x1508,	%g6
	movleu	%icc,	%l6,	%i5
	fbn,a	%fcc0,	loop_212
	sir	0x08F5
	alignaddrl	%l3,	%g3,	%o6
	edge32	%i2,	%o0,	%o7
loop_212:
	addcc	%g4,	0x0D13,	%l4
	sethi	0x1BFB,	%o4
	fnor	%f20,	%f26,	%f8
	movrgez	%i7,	0x31D,	%i4
	movge	%xcc,	%l1,	%i1
	fcmple16	%f22,	%f20,	%i3
	lduh	[%l7 + 0x66],	%o1
	tsubcctv	%l0,	%l2,	%o2
	fcmpne32	%f30,	%f12,	%l5
	udivx	%i6,	0x0599,	%o3
	fmul8ulx16	%f30,	%f30,	%f4
	fnot2s	%f29,	%f7
	nop
	set	0x44, %l5
	stb	%o5,	[%l7 + %l5]
	addcc	%g5,	0x0E51,	%g7
	array16	%i0,	%g2,	%g6
	fmovrse	%l6,	%f2,	%f30
	fmovrsgz	%g1,	%f15,	%f10
	xnor	%l3,	%i5,	%g3
	tsubcctv	%o6,	%i2,	%o0
	fbue	%fcc1,	loop_213
	fmovse	%icc,	%f11,	%f31
	movne	%xcc,	%o7,	%l4
	movcs	%icc,	%g4,	%o4
loop_213:
	fpack32	%f6,	%f22,	%f2
	movge	%icc,	%i7,	%i4
	movn	%icc,	%i1,	%l1
	movle	%xcc,	%o1,	%l0
	fnands	%f20,	%f8,	%f18
	addc	%l2,	%i3,	%o2
	brgz,a	%l5,	loop_214
	movgu	%xcc,	%o3,	%i6
	stx	%o5,	[%l7 + 0x58]
	addccc	%g7,	0x0E2B,	%i0
loop_214:
	movvc	%icc,	%g5,	%g6
	sdivx	%l6,	0x00F9,	%g1
	xorcc	%l3,	0x13ED,	%g2
	sra	%g3,	%i5,	%i2
	stb	%o6,	[%l7 + 0x1E]
	movrgez	%o7,	0x1D7,	%l4
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%o0
	tsubcctv	%g4,	%i7,	%o4
	and	%i4,	%i1,	%l1
	edge32l	%o1,	%l2,	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o2,	%i3
	mulx	%o3,	0x1454,	%l5
	orn	%o5,	%i6,	%g7
	movleu	%xcc,	%g5,	%i0
	movgu	%icc,	%l6,	%g6
	edge32n	%l3,	%g2,	%g3
	fmovsn	%xcc,	%f22,	%f0
	subc	%g1,	0x1DD4,	%i5
	xor	%i2,	%o7,	%l4
	movl	%icc,	%o6,	%g4
	move	%xcc,	%i7,	%o4
	edge8l	%o0,	%i1,	%l1
	alignaddr	%o1,	%l2,	%l0
	fmovrsne	%o2,	%f19,	%f16
	edge16	%i3,	%i4,	%l5
	bvs,a	loop_215
	stw	%o5,	[%l7 + 0x50]
	fxnors	%f10,	%f28,	%f27
	nop
	setx	loop_216,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_215:
	subcc	%i6,	0x1699,	%g7
	xnorcc	%o3,	0x1F23,	%g5
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
loop_216:
	bn	loop_218
	tne	%icc,	0x0
	movrlz	%i0,	%g6,	%l6
loop_217:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%g2
loop_218:
	subc	%g1,	0x07DA,	%g3
	fbe,a	%fcc1,	loop_219
	fpack16	%f8,	%f19
	fmovspos	%xcc,	%f21,	%f17
	ta	%xcc,	0x4
loop_219:
	ldsw	[%l7 + 0x50],	%i2
	udiv	%i5,	0x0276,	%l4
	ba,a	%xcc,	loop_220
	udivcc	%o6,	0x0218,	%o7
	fpadd32	%f6,	%f6,	%f10
	subc	%i7,	%g4,	%o4
loop_220:
	movvs	%xcc,	%i1,	%o0
	fpsub32s	%f26,	%f24,	%f3
	edge16	%o1,	%l2,	%l1
	addc	%l0,	%i3,	%o2
	bvs	%xcc,	loop_221
	nop
	setx	0x02F82A02106704CC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	sra	%i4,	0x14,	%l5
	xor	%i6,	%o5,	%g7
loop_221:
	edge16l	%o3,	%i0,	%g5
	fmovspos	%xcc,	%f16,	%f6
	tpos	%xcc,	0x3
	fmovdl	%icc,	%f1,	%f20
	nop
	setx	0x8ACC2CF0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f6
	fcmpgt16	%f4,	%f6,	%g6
	taddcctv	%l6,	%l3,	%g2
	fmovsvs	%xcc,	%f7,	%f10
	taddcc	%g1,	%i2,	%i5
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f24
	srl	%l4,	0x0A,	%o6
	fbuge	%fcc1,	loop_222
	edge8ln	%g3,	%i7,	%g4
	set	0x34, %g2
	stwa	%o4,	[%l7 + %g2] 0x22
	membar	#Sync
loop_222:
	udivx	%i1,	0x0DD4,	%o7
	wr	%g0,	0x11,	%asi
	stba	%o1,	[%l7 + 0x51] %asi
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%o0
	tpos	%xcc,	0x5
	fmovdcs	%icc,	%f16,	%f27
	edge16n	%l1,	%i3,	%o2
	fmovrde	%l0,	%f2,	%f24
	addcc	%l5,	%i4,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc2,	loop_223
	sdivcc	%g7,	0x0389,	%o5
	orncc	%i0,	0x1BD7,	%o3
	movgu	%icc,	%g5,	%l6
loop_223:
	fmovs	%f20,	%f28
	movcc	%xcc,	%l3,	%g2
	fmuld8ulx16	%f4,	%f3,	%f30
	edge8	%g1,	%i2,	%g6
	mulx	%i5,	%l4,	%o6
	srl	%i7,	0x09,	%g4
	fmovrslz	%g3,	%f12,	%f11
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x19,	%f0
	subc	%i1,	0x03A1,	%o4
	tvs	%icc,	0x2
	tgu	%xcc,	0x1
	sdiv	%o1,	0x0D52,	%l2
	mulx	%o0,	%l1,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x68, %o6
	prefetch	[%l7 + %o6],	 0x0
	edge8	%o2,	%o7,	%l5
	movrlez	%l0,	0x308,	%i6
	movle	%xcc,	%g7,	%o5
	fmovrdlz	%i4,	%f12,	%f24
	andncc	%i0,	%g5,	%o3
	movcs	%icc,	%l6,	%l3
	xnor	%g2,	0x0D37,	%i2
	movg	%xcc,	%g6,	%i5
	fbuge,a	%fcc3,	loop_224
	srax	%l4,	0x04,	%o6
	ldsh	[%l7 + 0x2E],	%g1
	tneg	%icc,	0x5
loop_224:
	fandnot2	%f16,	%f20,	%f10
	fmovdl	%icc,	%f8,	%f12
	xorcc	%g4,	0x1EF8,	%g3
	bvs	%icc,	loop_225
	edge8	%i1,	%o4,	%o1
	stw	%l2,	[%l7 + 0x74]
	fbe	%fcc3,	loop_226
loop_225:
	mulx	%i7,	0x0F5B,	%l1
	movge	%xcc,	%i3,	%o2
	edge16l	%o7,	%l5,	%o0
loop_226:
	nop
	set	0x4C, %o2
	ldsw	[%l7 + %o2],	%i6
	fandnot2	%f4,	%f26,	%f30
	bge,a	%icc,	loop_227
	mova	%icc,	%l0,	%o5
	wr	%g0,	0x18,	%asi
	stba	%g7,	[%l7 + 0x37] %asi
loop_227:
	edge16	%i0,	%i4,	%g5
	movrne	%l6,	%o3,	%g2
	nop
	setx	loop_228,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%icc,	%l3,	%i2
	fpack16	%f28,	%f14
	or	%i5,	0x1205,	%l4
loop_228:
	bneg	loop_229
	tgu	%icc,	0x6
	movvs	%icc,	%o6,	%g6
	membar	0x1F
loop_229:
	fmovse	%xcc,	%f7,	%f15
	movne	%icc,	%g4,	%g3
	edge32	%i1,	%g1,	%o1
	movvc	%xcc,	%o4,	%l2
	tg	%icc,	0x5
	srlx	%i7,	0x08,	%l1
	movrgez	%o2,	0x370,	%i3
	nop
	setx	loop_230,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addc	%l5,	%o7,	%o0
	edge16n	%l0,	%i6,	%g7
	andncc	%o5,	%i4,	%i0
loop_230:
	sll	%l6,	0x08,	%o3
	alignaddr	%g5,	%g2,	%l3
	bne,a	%xcc,	loop_231
	fmuld8sux16	%f13,	%f18,	%f12
	fandnot1	%f30,	%f22,	%f12
	tn	%xcc,	0x7
loop_231:
	add	%i5,	0x18C6,	%i2
	mulx	%l4,	0x0E58,	%o6
	ldsw	[%l7 + 0x14],	%g6
	fmovdvs	%xcc,	%f23,	%f1
	smul	%g3,	%i1,	%g4
	fba,a	%fcc1,	loop_232
	movle	%xcc,	%g1,	%o1
	tsubcc	%o4,	%l2,	%i7
	lduh	[%l7 + 0x3E],	%o2
loop_232:
	movne	%xcc,	%l1,	%l5
	movrlez	%i3,	%o7,	%o0
	sdiv	%l0,	0x1FA1,	%i6
	fnors	%f29,	%f29,	%f4
	edge8l	%g7,	%i4,	%i0
	nop
	setx	0x7EB3CE9D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o5,	%o3
	or	%g5,	%l6,	%l3
	array16	%i5,	%g2,	%l4
	bne,pt	%xcc,	loop_233
	tsubcctv	%o6,	0x0850,	%i2
	fcmpgt16	%f20,	%f24,	%g3
	fmul8x16al	%f15,	%f14,	%f2
loop_233:
	movrlz	%g6,	0x292,	%g4
	flush	%l7 + 0x40
	xnorcc	%i1,	0x12F6,	%g1
	xor	%o1,	%l2,	%o4
	edge32l	%i7,	%l1,	%l5
	set	0x20, %i7
	ldda	[%l7 + %i7] 0x88,	%o2
	edge16ln	%i3,	%o7,	%l0
	orncc	%o0,	%i6,	%g7
	tsubcctv	%i4,	%i0,	%o5
	movle	%xcc,	%g5,	%o3
	ble,a,pt	%icc,	loop_234
	fmovsge	%icc,	%f28,	%f0
	nop
	set	0x31, %g7
	stb	%l6,	[%l7 + %g7]
	srl	%l3,	0x0F,	%i5
loop_234:
	array8	%g2,	%l4,	%o6
	smulcc	%g3,	%i2,	%g6
	movrgez	%g4,	%i1,	%o1
	sllx	%g1,	%o4,	%l2
	orn	%l1,	0x1CAA,	%i7
	fcmpeq16	%f20,	%f14,	%l5
	tvs	%icc,	0x1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x50] %asi,	%o2
	edge8	%i3,	%l0,	%o0
	std	%f8,	[%l7 + 0x30]
	fmovspos	%xcc,	%f30,	%f9
	tle	%xcc,	0x7
	ta	%xcc,	0x0
	mulx	%i6,	0x039F,	%o7
	fand	%f0,	%f8,	%f22
	taddcc	%i4,	%g7,	%i0
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x30] %asi,	%o5
	tneg	%xcc,	0x0
	movleu	%xcc,	%g5,	%l6
	fbu,a	%fcc2,	loop_235
	tcc	%xcc,	0x3
	prefetch	[%l7 + 0x78],	 0x3
	fmovdvs	%icc,	%f30,	%f26
loop_235:
	movrne	%o3,	0x268,	%l3
	fmul8x16	%f9,	%f28,	%f22
	sll	%g2,	%l4,	%o6
	umulcc	%g3,	0x157D,	%i2
	bn,a	loop_236
	fmovrdlez	%i5,	%f4,	%f0
	smulcc	%g6,	0x1D62,	%g4
	edge8	%i1,	%g1,	%o4
loop_236:
	fmul8x16	%f13,	%f12,	%f28
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0xf9
	membar	#Sync
	tsubcc	%l2,	0x1488,	%l1
	array32	%o1,	%l5,	%o2
	array8	%i7,	%l0,	%o0
	nop
	setx	0x707F8BAD,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fmul8x16	%f9,	%f26,	%f18
	membar	0x46
	nop
	setx loop_237, %l0, %l1
	jmpl %l1, %i3
	fmovrsgez	%i6,	%f20,	%f25
	fone	%f10
	fmovrdgz	%i4,	%f2,	%f22
loop_237:
	sdivcc	%g7,	0x1505,	%o7
	fornot1	%f22,	%f14,	%f2
	fmovrdlz	%o5,	%f22,	%f26
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x16] %asi,	%g5
	lduw	[%l7 + 0x48],	%l6
	edge8l	%i0,	%o3,	%g2
	ldsw	[%l7 + 0x5C],	%l3
	fbuge,a	%fcc2,	loop_238
	tcc	%xcc,	0x6
	tg	%icc,	0x1
	addcc	%o6,	%g3,	%l4
loop_238:
	nop
	fitos	%f11,	%f3
	fstoi	%f3,	%f14
	xnorcc	%i2,	%g6,	%g4
	movrgez	%i1,	%i5,	%g1
	tvs	%xcc,	0x1
	umulcc	%l2,	0x0835,	%o4
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l1
	tsubcctv	%l5,	0x005C,	%o2
	umul	%i7,	0x1E21,	%o1
	mulscc	%o0,	0x197A,	%i3
	movneg	%icc,	%i6,	%l0
	ldsh	[%l7 + 0x46],	%g7
	nop
	setx	0x72E77CFDF3F22A65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x185DB6924ECE0C42,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f14,	%f26
	stx	%i4,	[%l7 + 0x10]
	xnor	%o5,	0x1364,	%o7
	array16	%l6,	%i0,	%g5
	te	%xcc,	0x1
	subcc	%g2,	%l3,	%o3
	movcc	%xcc,	%o6,	%g3
	mova	%icc,	%i2,	%g6
	fmovdpos	%icc,	%f7,	%f31
	fbo	%fcc3,	loop_239
	tgu	%icc,	0x4
	std	%f24,	[%l7 + 0x28]
	movne	%xcc,	%l4,	%g4
loop_239:
	taddcc	%i1,	%i5,	%l2
	ldd	[%l7 + 0x38],	%f16
	fmuld8sux16	%f6,	%f4,	%f18
	fblg,a	%fcc1,	loop_240
	tsubcc	%g1,	0x012A,	%o4
	nop
	setx	0xC612ED88,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xB00263FD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f17,	%f12
	fxnor	%f0,	%f30,	%f12
loop_240:
	fandnot1	%f20,	%f0,	%f16
	subccc	%l1,	%l5,	%o2
	sdivcc	%i7,	0x11F8,	%o1
	fmovde	%xcc,	%f7,	%f13
	sra	%i3,	0x18,	%i6
	fpmerge	%f27,	%f20,	%f8
	sll	%l0,	%o0,	%i4
	fmovrdne	%o5,	%f14,	%f28
	bshuffle	%f8,	%f10,	%f16
	udivcc	%g7,	0x1E25,	%o7
	brlez	%l6,	loop_241
	orcc	%i0,	0x0216,	%g2
	ld	[%l7 + 0x2C],	%f12
	fmovdne	%xcc,	%f27,	%f7
loop_241:
	array32	%l3,	%g5,	%o6
	fcmpgt32	%f12,	%f8,	%g3
	andn	%o3,	0x0B70,	%i2
	flush	%l7 + 0x48
	movne	%xcc,	%g6,	%l4
	nop
	setx	loop_242,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%g4,	%i5,	%l2
	addc	%g1,	0x0B13,	%o4
	orcc	%i1,	%l1,	%l5
loop_242:
	nop
	fitod	%f9,	%f18
	fmovdcs	%icc,	%f9,	%f12
	ba,a,pn	%xcc,	loop_243
	sllx	%i7,	0x1E,	%o1
	subcc	%i3,	%o2,	%l0
	set	0x78, %o3
	prefetcha	[%l7 + %o3] 0x19,	 0x0
loop_243:
	tsubcc	%i4,	0x1E64,	%i6
	xor	%g7,	%o7,	%o5
	ldx	[%l7 + 0x70],	%i0
	taddcctv	%l6,	%l3,	%g2
	st	%f30,	[%l7 + 0x74]
	fsrc2	%f20,	%f14
	subccc	%g5,	0x0DAD,	%o6
	edge8n	%o3,	%i2,	%g6
	fbne	%fcc2,	loop_244
	tcc	%icc,	0x3
	xor	%l4,	%g4,	%i5
	movgu	%icc,	%g3,	%g1
loop_244:
	ldsb	[%l7 + 0x5A],	%l2
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tsubcc	%i1,	0x0B0C,	%l1
	fnegd	%f12,	%f18
	movrgez	%l5,	%i7,	%o1
	fors	%f14,	%f27,	%f9
	alignaddr	%i3,	%o2,	%o4
	movcs	%icc,	%l0,	%i4
	set	0x60, %g3
	sta	%f11,	[%l7 + %g3] 0x10
	tsubcc	%o0,	0x0E8C,	%i6
	bneg,a,pn	%xcc,	loop_245
	fmovsge	%icc,	%f5,	%f1
	sir	0x0D54
	fmovdge	%icc,	%f3,	%f22
loop_245:
	movrgez	%g7,	0x33E,	%o5
	stx	%i0,	[%l7 + 0x28]
	popc	0x1F2F,	%o7
	fnegd	%f4,	%f14
	ba,a,pn	%xcc,	loop_246
	fornot1	%f26,	%f12,	%f14
	fbo	%fcc1,	loop_247
	array32	%l3,	%g2,	%l6
loop_246:
	ldd	[%l7 + 0x38],	%g4
	and	%o6,	0x16DB,	%i2
loop_247:
	xorcc	%g6,	0x19F5,	%o3
	sra	%g4,	%l4,	%i5
	sdivx	%g1,	0x1C2A,	%l2
	fmovrdlz	%i1,	%f30,	%f28
	tvc	%xcc,	0x0
	add	%g3,	0x0471,	%l1
	tvs	%xcc,	0x7
	fba,a	%fcc0,	loop_248
	fbge,a	%fcc0,	loop_249
	nop
	setx	0x10A2BFA6207BACD8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	movrne	%i7,	%o1,	%i3
loop_248:
	mova	%icc,	%o2,	%o4
loop_249:
	fornot2	%f10,	%f16,	%f0
	stbar
	sir	0x03D2
	addcc	%l0,	%l5,	%i4
	bne	loop_250
	array8	%o0,	%g7,	%i6
	sub	%o5,	%i0,	%o7
	nop
	setx	0x0323BD23785CF1AE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x9EAC670068EA970D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f16,	%f16
loop_250:
	edge16n	%g2,	%l6,	%l3
	nop
	setx	0x5038E1DF89134D1D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x322F79C1FB4E8DF8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f12,	%f20
	fmovdle	%xcc,	%f21,	%f19
	array8	%g5,	%o6,	%i2
	fmovsg	%xcc,	%f11,	%f15
	orncc	%o3,	%g4,	%g6
	fsrc1	%f26,	%f20
	addcc	%l4,	0x0B9E,	%i5
	ldsh	[%l7 + 0x12],	%g1
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x2c,	%l2
	tg	%xcc,	0x6
	subcc	%g3,	%l1,	%i7
	tne	%icc,	0x0
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f4
	subcc	%i1,	%o1,	%i3
	fbu	%fcc1,	loop_251
	fbn	%fcc3,	loop_252
	edge32ln	%o4,	%l0,	%l5
	set	0x10, %o1
	stxa	%o2,	[%l7 + %o1] 0xe3
	membar	#Sync
loop_251:
	array16	%i4,	%o0,	%g7
loop_252:
	move	%icc,	%i6,	%o5
	movge	%xcc,	%o7,	%i0
	taddcctv	%g2,	%l3,	%g5
	movre	%o6,	0x175,	%l6
	nop
	set	0x18, %l0
	prefetch	[%l7 + %l0],	 0x1
	movpos	%icc,	%o3,	%i2
	sdivcc	%g4,	0x1895,	%g6
	ldub	[%l7 + 0x79],	%l4
	fmovsneg	%icc,	%f12,	%f0
	te	%xcc,	0x1
	fpmerge	%f2,	%f24,	%f10
	andcc	%i5,	0x15B6,	%g1
	movvs	%icc,	%g3,	%l1
	addc	%l2,	%i7,	%o1
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x18
	tne	%icc,	0x1
	edge32	%i3,	%i1,	%l0
	brgz,a	%l5,	loop_253
	fmovdle	%xcc,	%f19,	%f31
	tleu	%xcc,	0x7
	fmovspos	%xcc,	%f6,	%f30
loop_253:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x5A] %asi,	%o4
	andcc	%o2,	%o0,	%i4
	movrlez	%i6,	%o5,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f28,	%f30
	movvs	%icc,	%i0,	%g7
	and	%l3,	0x1CD2,	%g5
	sth	%g2,	[%l7 + 0x72]
	tneg	%xcc,	0x3
	fbne,a	%fcc2,	loop_254
	fbg,a	%fcc1,	loop_255
	mulx	%o6,	%l6,	%o3
	movne	%icc,	%g4,	%g6
loop_254:
	bleu	%icc,	loop_256
loop_255:
	or	%i2,	%l4,	%g1
	sethi	0x0292,	%g3
	movleu	%icc,	%l1,	%l2
loop_256:
	fsrc1s	%f13,	%f1
	mulx	%i5,	0x0D3A,	%o1
	subcc	%i3,	%i1,	%l0
	bcs	%icc,	loop_257
	movneg	%xcc,	%l5,	%o4
	bvc,pt	%xcc,	loop_258
	fmovrsgz	%i7,	%f24,	%f8
loop_257:
	fbug	%fcc1,	loop_259
	movrlz	%o0,	0x3D2,	%i4
loop_258:
	taddcctv	%i6,	%o5,	%o2
	fble,a	%fcc2,	loop_260
loop_259:
	movleu	%icc,	%i0,	%o7
	set	0x2C, %g5
	stba	%g7,	[%l7 + %g5] 0x27
	membar	#Sync
loop_260:
	fba,a	%fcc1,	loop_261
	fbuge,a	%fcc3,	loop_262
	popc	%g5,	%g2
	tl	%icc,	0x7
loop_261:
	move	%xcc,	%l3,	%o6
loop_262:
	fble,a	%fcc1,	loop_263
	brgz	%o3,	loop_264
	tneg	%xcc,	0x2
	fmovd	%f26,	%f18
loop_263:
	nop
	setx	0x0A6F97609BD58B3A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x4D8F18EF88118DDF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f16,	%f22
loop_264:
	tvs	%xcc,	0x7
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f2
	fbe,a	%fcc3,	loop_265
	fbo,a	%fcc3,	loop_266
	nop
	fitos	%f10,	%f30
	smul	%l6,	0x0265,	%g6
loop_265:
	srax	%g4,	0x13,	%l4
loop_266:
	fnot2	%f16,	%f16
	movn	%icc,	%i2,	%g1
	movcs	%xcc,	%g3,	%l2
	udiv	%i5,	0x13DE,	%l1
	movge	%icc,	%i3,	%i1
	sll	%o1,	0x13,	%l5
	tcs	%icc,	0x6
	movneg	%xcc,	%o4,	%l0
	tne	%xcc,	0x7
	nop
	setx loop_267, %l0, %l1
	jmpl %l1, %o0
	addcc	%i7,	0x0556,	%i4
	wr	%g0,	0x11,	%asi
	sta	%f25,	[%l7 + 0x70] %asi
loop_267:
	fmul8sux16	%f10,	%f0,	%f22
	brlz,a	%i6,	loop_268
	movl	%icc,	%o2,	%i0
	fpmerge	%f20,	%f25,	%f12
	movrlez	%o5,	0x03B,	%o7
loop_268:
	edge32ln	%g7,	%g5,	%g2
	fcmple32	%f6,	%f24,	%o6
	nop
	set	0x58, %i3
	ldd	[%l7 + %i3],	%f30
	fpsub16s	%f13,	%f10,	%f21
	fmovsl	%icc,	%f3,	%f3
	popc	%l3,	%l6
	brgz	%g6,	loop_269
	fmul8sux16	%f30,	%f12,	%f28
	fornot2	%f12,	%f12,	%f2
	move	%icc,	%o3,	%g4
loop_269:
	movrne	%l4,	%i2,	%g3
	nop
	setx	loop_270,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%l2,	%i5,	%g1
	fmovdne	%icc,	%f22,	%f21
	fcmpeq32	%f22,	%f22,	%i3
loop_270:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f0,	%f9
	alignaddr	%i1,	%l1,	%l5
	movleu	%xcc,	%o1,	%o4
	ld	[%l7 + 0x50],	%f1
	xor	%l0,	%i7,	%o0
	xnorcc	%i4,	0x1E2D,	%o2
	wr	%g0,	0x18,	%asi
	sta	%f20,	[%l7 + 0x08] %asi
	fsrc1	%f10,	%f20
	fabss	%f11,	%f27
	ldstub	[%l7 + 0x3D],	%i6
	nop
	setx	0xA869DC274155D979,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x882F07F03CECC21C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f14,	%f30
	ldsh	[%l7 + 0x64],	%o5
	nop
	set	0x3C, %i6
	stw	%i0,	[%l7 + %i6]
	bl,a,pt	%icc,	loop_271
	tneg	%xcc,	0x7
	addcc	%g7,	%o7,	%g5
	set	0x7F, %i4
	stba	%o6,	[%l7 + %i4] 0xe2
	membar	#Sync
loop_271:
	add	%g2,	%l6,	%g6
	edge32ln	%o3,	%g4,	%l4
	fbule,a	%fcc1,	loop_272
	xnor	%l3,	%g3,	%l2
	movvc	%xcc,	%i5,	%g1
	movrlz	%i3,	%i1,	%l1
loop_272:
	bg,a,pn	%xcc,	loop_273
	fnot1	%f20,	%f8
	nop
	setx	0x1FBFB5EE70596147,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	bleu,pn	%icc,	loop_274
loop_273:
	array16	%i2,	%o1,	%l5
	udiv	%l0,	0x1DFA,	%o4
	movle	%xcc,	%o0,	%i7
loop_274:
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f8
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
	tsubcctv	%i6,	%i4,	%i0
	tne	%xcc,	0x2
	srl	%g7,	0x18,	%o5
	fmovrdlz	%o7,	%f14,	%f22
	movle	%xcc,	%g5,	%g2
	movge	%xcc,	%l6,	%o6
	ble,a	loop_275
	tge	%xcc,	0x2
	addccc	%g6,	%g4,	%l4
	bg	loop_276
loop_275:
	fzeros	%f16
	orncc	%l3,	%g3,	%o3
	set	0x60, %i0
	stba	%l2,	[%l7 + %i0] 0x22
	membar	#Sync
loop_276:
	movneg	%icc,	%i5,	%g1
	fbl,a	%fcc3,	loop_277
	fmovse	%icc,	%f15,	%f15
	wr	%g0,	0x80,	%asi
	sta	%f27,	[%l7 + 0x2C] %asi
loop_277:
	edge8ln	%i1,	%l1,	%i2
	edge8l	%o1,	%l5,	%l0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%o4
	brlez	%o0,	loop_278
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i7,	%o2,	%i3
	fsrc2	%f2,	%f0
loop_278:
	nop
	fitos	%f5,	%f19
	fstox	%f19,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_279,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%i6,	%i4,	%i0
	fmovrslz	%g7,	%f2,	%f16
	set	0x30, %i1
	lduba	[%l7 + %i1] 0x11,	%o5
loop_279:
	or	%o7,	0x1135,	%g5
	edge32l	%l6,	%o6,	%g2
	movne	%xcc,	%g4,	%g6
	ldsb	[%l7 + 0x6E],	%l4
	tsubcc	%l3,	%g3,	%o3
	brlez,a	%i5,	loop_280
	srlx	%g1,	%l2,	%l1
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
	sdivx	%i1,	0x11E3,	%o1
loop_280:
	udiv	%l5,	0x0FA7,	%l0
	tsubcctv	%o4,	0x127A,	%i2
loop_281:
	sll	%o0,	%o2,	%i7
	addc	%i3,	0x1E5B,	%i6
	tne	%icc,	0x2
	fbul	%fcc1,	loop_282
	move	%icc,	%i0,	%i4
	edge16l	%g7,	%o7,	%o5
	tl	%xcc,	0x4
loop_282:
	addccc	%g5,	%l6,	%o6
	xnor	%g2,	0x0715,	%g6
	fbn	%fcc2,	loop_283
	movl	%xcc,	%g4,	%l3
	fmovde	%xcc,	%f22,	%f24
	nop
	fitos	%f8,	%f9
	fstox	%f9,	%f4
	fxtos	%f4,	%f31
loop_283:
	fnot1	%f22,	%f18
	sethi	0x1740,	%l4
	sub	%g3,	0x0F1D,	%i5
	fnor	%f8,	%f26,	%f4
	fnand	%f8,	%f12,	%f28
	fnot2s	%f19,	%f23
	popc	0x0C30,	%g1
	tleu	%xcc,	0x1
	udivcc	%l2,	0x14F1,	%l1
	brlez	%i1,	loop_284
	edge32	%o1,	%o3,	%l5
	subcc	%l0,	%i2,	%o4
	addccc	%o2,	0x1CBF,	%o0
loop_284:
	udivx	%i3,	0x1771,	%i6
	brgz,a	%i7,	loop_285
	mova	%icc,	%i4,	%g7
	fbn	%fcc0,	loop_286
	mova	%xcc,	%i0,	%o7
loop_285:
	fones	%f27
	fmovrslz	%g5,	%f20,	%f10
loop_286:
	tne	%xcc,	0x7
	nop
	fitos	%f12,	%f19
	fstod	%f19,	%f2
	movcs	%xcc,	%l6,	%o6
	tn	%xcc,	0x4
	fbul,a	%fcc2,	loop_287
	movvs	%icc,	%o5,	%g6
	udiv	%g4,	0x1BB8,	%g2
	sethi	0x09D7,	%l3
loop_287:
	swap	[%l7 + 0x24],	%g3
	fbge,a	%fcc3,	loop_288
	bpos,a,pn	%icc,	loop_289
	movrgz	%l4,	0x23F,	%i5
	srl	%g1,	%l1,	%l2
loop_288:
	ldd	[%l7 + 0x78],	%f26
loop_289:
	addc	%i1,	%o3,	%l5
	movcs	%xcc,	%l0,	%i2
	tpos	%icc,	0x4
	movgu	%icc,	%o1,	%o4
	fmovsneg	%xcc,	%f9,	%f26
	sdivcc	%o0,	0x0399,	%o2
	srax	%i3,	%i7,	%i4
	movrgez	%i6,	%g7,	%o7
	tsubcctv	%i0,	%l6,	%g5
	fmul8ulx16	%f22,	%f26,	%f30
	fnot1	%f14,	%f6
	sdivx	%o6,	0x090C,	%o5
	fbl	%fcc1,	loop_290
	fbul	%fcc3,	loop_291
	movne	%xcc,	%g6,	%g4
	fmovdneg	%xcc,	%f1,	%f4
loop_290:
	xnor	%g2,	%g3,	%l4
loop_291:
	nop
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	subcc	%l3,	0x178E,	%l1
	udiv	%l2,	0x10C1,	%i1
	fmovdvc	%xcc,	%f5,	%f7
	brlez	%g1,	loop_292
	fbe	%fcc1,	loop_293
	fbne,a	%fcc2,	loop_294
	nop
	setx	0xA0466D8E,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
loop_292:
	andncc	%l5,	%o3,	%l0
loop_293:
	brnz	%i2,	loop_295
loop_294:
	movrlez	%o4,	0x0FF,	%o1
	fmovde	%icc,	%f8,	%f28
	fbule,a	%fcc3,	loop_296
loop_295:
	tleu	%xcc,	0x3
	edge8l	%o0,	%i3,	%i7
	brz	%i4,	loop_297
loop_296:
	movne	%xcc,	%i6,	%o2
	swap	[%l7 + 0x10],	%o7
	nop
	fitos	%f2,	%f26
loop_297:
	bpos,pn	%icc,	loop_298
	sethi	0x145A,	%i0
	sub	%g7,	%l6,	%g5
	movvs	%xcc,	%o5,	%g6
loop_298:
	srax	%g4,	0x07,	%g2
	fmovsn	%xcc,	%f15,	%f7
	xnor	%g3,	0x1FB3,	%l4
	movrgz	%o6,	%i5,	%l1
	fsrc1	%f24,	%f28
	sir	0x199E
	udivcc	%l3,	0x0794,	%l2
	bl,a,pn	%icc,	loop_299
	fba,a	%fcc2,	loop_300
	tcs	%icc,	0x2
	nop
	setx	0x1920612817A56C62,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x2572EAF9D4020860,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f2,	%f24
loop_299:
	sllx	%g1,	0x07,	%i1
loop_300:
	fmovsleu	%icc,	%f28,	%f1
	and	%l5,	%l0,	%o3
	tge	%xcc,	0x2
	srl	%i2,	0x0B,	%o1
	tn	%xcc,	0x6
	fornot1s	%f24,	%f2,	%f19
	tle	%xcc,	0x0
	udivx	%o0,	0x11F5,	%o4
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x0c,	%i6
	nop
	set	0x62, %o0
	ldsb	[%l7 + %o0],	%i4
	movl	%icc,	%i6,	%i3
	movrgz	%o2,	%o7,	%i0
	membar	0x32
	brlz	%g7,	loop_301
	nop
	setx	0xB4579AD2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	fsqrts	%f16,	%f7
	move	%xcc,	%g5,	%o5
	xnorcc	%g6,	0x0AE3,	%g4
loop_301:
	std	%f6,	[%l7 + 0x58]
	st	%f23,	[%l7 + 0x38]
	fbuge,a	%fcc1,	loop_302
	sub	%l6,	%g2,	%g3
	fmovdle	%icc,	%f27,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_302:
	fbule	%fcc3,	loop_303
	for	%f18,	%f0,	%f2
	taddcc	%l4,	0x0E87,	%i5
	add	%l1,	0x16AA,	%o6
loop_303:
	nop
	fitod	%f8,	%f18
	fdtox	%f18,	%f22
	nop
	setx	0xC71F7EE820611534,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	tcs	%icc,	0x3
	fone	%f28
	fmovdvc	%icc,	%f25,	%f30
	tsubcctv	%l3,	%g1,	%i1
	fmovsvs	%xcc,	%f1,	%f24
	addccc	%l5,	%l2,	%l0
	movleu	%icc,	%o3,	%i2
	addccc	%o0,	0x11D7,	%o4
	edge16n	%o1,	%i4,	%i7
	subccc	%i6,	0x1C73,	%i3
	movle	%icc,	%o2,	%i0
	ble,a,pt	%icc,	loop_304
	array32	%g7,	%o7,	%o5
	ba,pt	%xcc,	loop_305
	and	%g5,	0x0F57,	%g6
loop_304:
	edge16	%l6,	%g2,	%g3
	tl	%xcc,	0x5
loop_305:
	movvs	%xcc,	%g4,	%i5
	movneg	%xcc,	%l4,	%l1
	sll	%o6,	0x0E,	%g1
	stbar
	mulx	%i1,	%l5,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l2,	%l0
	edge8l	%o3,	%o0,	%o4
	fpadd16	%f18,	%f22,	%f30
	sdivx	%o1,	0x1692,	%i4
	mulx	%i7,	0x1A75,	%i6
	nop
	set	0x37, %i2
	ldub	[%l7 + %i2],	%i3
	tsubcctv	%o2,	0x1009,	%i2
	srlx	%i0,	%o7,	%o5
	movre	%g7,	0x24A,	%g6
	taddcctv	%g5,	0x1478,	%g2
	ldub	[%l7 + 0x44],	%g3
	fble	%fcc1,	loop_306
	array8	%g4,	%l6,	%i5
	orcc	%l4,	0x1C92,	%l1
	tgu	%icc,	0x2
loop_306:
	movgu	%icc,	%g1,	%o6
	membar	0x67
	fnor	%f22,	%f28,	%f10
	brgz	%l5,	loop_307
	or	%l3,	%l2,	%i1
	ta	%xcc,	0x1
	wr	%g0,	0x20,	%asi
	stxa	%l0,	[%g0 + 0x0] %asi
loop_307:
	edge16n	%o3,	%o4,	%o0
	fnot2	%f26,	%f8
	wr	%g0,	0x0c,	%asi
	stwa	%i4,	[%l7 + 0x64] %asi
	movgu	%xcc,	%o1,	%i6
	st	%f9,	[%l7 + 0x2C]
	movn	%xcc,	%i3,	%i7
	tvs	%icc,	0x5
	edge32l	%o2,	%i0,	%o7
	fandnot1	%f20,	%f14,	%f28
	movleu	%icc,	%i2,	%o5
	movpos	%icc,	%g7,	%g6
	udivcc	%g5,	0x0337,	%g3
	std	%f22,	[%l7 + 0x20]
	fmovrslz	%g2,	%f5,	%f24
	srl	%l6,	%i5,	%g4
	bpos	loop_308
	move	%xcc,	%l4,	%g1
	brlz	%o6,	loop_309
	mulx	%l1,	%l3,	%l2
loop_308:
	udiv	%l5,	0x06E0,	%i1
	edge16n	%l0,	%o3,	%o0
loop_309:
	call	loop_310
	fmovrse	%o4,	%f3,	%f11
	fbue	%fcc3,	loop_311
	tne	%xcc,	0x7
loop_310:
	nop
	setx	0x1EED083E0DFF96AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x50194FB9599E0115,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f30,	%f6
	tsubcctv	%i4,	0x1DD7,	%i6
loop_311:
	edge16	%o1,	%i7,	%i3
	subc	%o2,	0x074C,	%o7
	membar	0x1A
	tvc	%xcc,	0x6
	movrgez	%i0,	%i2,	%g7
	alignaddr	%g6,	%g5,	%o5
	andn	%g3,	%g2,	%i5
	umulcc	%g4,	0x0785,	%l6
	for	%f0,	%f10,	%f12
	addccc	%g1,	0x081D,	%l4
	fxnor	%f6,	%f0,	%f26
	subc	%l1,	%l3,	%l2
	subcc	%o6,	0x11FC,	%l5
	movrgez	%l0,	0x3FA,	%i1
	popc	0x0E1D,	%o3
	movle	%xcc,	%o4,	%i4
	taddcctv	%i6,	0x0944,	%o0
	bn,pt	%xcc,	loop_312
	andncc	%i7,	%o1,	%i3
	sll	%o7,	%i0,	%o2
	sdiv	%i2,	0x1B81,	%g6
loop_312:
	ldd	[%l7 + 0x18],	%f30
	movcs	%icc,	%g7,	%g5
	fcmple32	%f18,	%f0,	%g3
	fmovdg	%icc,	%f28,	%f16
	orncc	%o5,	0x0622,	%i5
	fbuge	%fcc3,	loop_313
	alignaddrl	%g2,	%l6,	%g4
	add	%l4,	%g1,	%l3
	fxnors	%f25,	%f6,	%f17
loop_313:
	andn	%l2,	%l1,	%l5
	sub	%l0,	%o6,	%i1
	lduw	[%l7 + 0x34],	%o3
	smul	%i4,	0x0696,	%o4
	te	%icc,	0x0
	orncc	%i6,	0x05E9,	%o0
	movne	%xcc,	%o1,	%i7
	addc	%i3,	%i0,	%o7
	nop
	fitod	%f0,	%f0
	fdtoi	%f0,	%f10
	xorcc	%i2,	0x1C9B,	%g6
	tne	%icc,	0x0
	stx	%g7,	[%l7 + 0x60]
	sir	0x06ED
	addcc	%o2,	0x163B,	%g3
	set	0x78, %l1
	lda	[%l7 + %l1] 0x14,	%f28
	edge16ln	%g5,	%o5,	%g2
	mulx	%i5,	0x1345,	%g4
	fmovsvc	%xcc,	%f15,	%f6
	tneg	%icc,	0x6
	te	%icc,	0x4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l4
	fmul8x16al	%f27,	%f26,	%f4
	fmovdleu	%xcc,	%f31,	%f7
	movn	%icc,	%l6,	%l3
	addc	%g1,	0x0D10,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l5,	%l0
	bneg,pt	%xcc,	loop_314
	nop
	setx	0xA0A4C9E3206C7C90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fmovdvc	%icc,	%f31,	%f25
	fmovdn	%xcc,	%f7,	%f30
loop_314:
	fbne	%fcc0,	loop_315
	orncc	%l2,	0x08C4,	%o6
	movne	%xcc,	%i1,	%o3
	nop
	setx	loop_316,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_315:
	addc	%o4,	0x132F,	%i6
	tcs	%icc,	0x3
	tvc	%xcc,	0x3
loop_316:
	edge16ln	%i4,	%o1,	%i7
	edge16	%i3,	%i0,	%o7
	movre	%i2,	0x0DB,	%o0
	sir	0x1746
	fmovsneg	%icc,	%f0,	%f17
	movle	%xcc,	%g7,	%o2
	fandnot1s	%f10,	%f9,	%f12
	subccc	%g3,	%g6,	%o5
	edge8	%g5,	%g2,	%g4
	alignaddrl	%i5,	%l6,	%l4
	fmovsge	%xcc,	%f9,	%f19
	add	%g1,	0x12D6,	%l3
	movrgez	%l1,	%l5,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l0,	%i1,	%o6
	bneg	%icc,	loop_317
	movl	%xcc,	%o3,	%i6
	addccc	%o4,	%o1,	%i7
	fmovsvs	%icc,	%f16,	%f27
loop_317:
	stx	%i3,	[%l7 + 0x78]
	brgz	%i4,	loop_318
	movne	%icc,	%o7,	%i0
	stx	%i2,	[%l7 + 0x70]
	fandnot1	%f18,	%f30,	%f28
loop_318:
	nop
	set	0x10, %o5
	swapa	[%l7 + %o5] 0x89,	%g7
	tleu	%icc,	0x3
	udiv	%o0,	0x1A75,	%o2
	wr	%g0,	0x89,	%asi
	sta	%f18,	[%l7 + 0x74] %asi
	srl	%g3,	%g6,	%g5
	movre	%g2,	0x279,	%o5
	set	0x64, %g6
	lda	[%l7 + %g6] 0x0c,	%f11
	set	0x7C, %o7
	swapa	[%l7 + %o7] 0x80,	%g4
	or	%i5,	0x10E5,	%l4
	ldsh	[%l7 + 0x46],	%g1
	subc	%l6,	%l1,	%l5
	fpadd32s	%f14,	%f11,	%f11
	bneg,a,pn	%xcc,	loop_319
	ldsw	[%l7 + 0x7C],	%l2
	set	0x30, %l4
	ldswa	[%l7 + %l4] 0x88,	%l0
loop_319:
	tpos	%xcc,	0x2
	addc	%l3,	0x11FB,	%o6
	ta	%icc,	0x2
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	xor	%o3,	0x17FC,	%i6
	fblg,a	%fcc0,	loop_320
	bleu	%xcc,	loop_321
	be,a,pt	%xcc,	loop_322
	movpos	%xcc,	%o1,	%o4
loop_320:
	fnot1	%f14,	%f4
loop_321:
	fbe,a	%fcc2,	loop_323
loop_322:
	sub	%i3,	%i7,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x81,	%f0
loop_323:
	udivx	%i4,	0x0C7C,	%i0
	ldsw	[%l7 + 0x7C],	%i2
	sra	%o0,	%g7,	%o2
	tg	%icc,	0x6
	xnor	%g3,	0x04EC,	%g6
	andcc	%g2,	%o5,	%g4
	flush	%l7 + 0x2C
	smulcc	%g5,	%l4,	%i5
	subc	%l6,	%g1,	%l1
	sth	%l2,	[%l7 + 0x70]
	andncc	%l5,	%l0,	%l3
	movcs	%xcc,	%i1,	%o3
	orncc	%o6,	0x0642,	%o1
	tvc	%icc,	0x4
	udiv	%i6,	0x04FE,	%i3
	ldd	[%l7 + 0x70],	%i6
	tsubcctv	%o4,	%i4,	%o7
	nop
	setx	0x49BA57EABB6E6430,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f10
	set	0x74, %l5
	lduwa	[%l7 + %l5] 0x11,	%i2
	fmovsne	%xcc,	%f30,	%f20
	movleu	%icc,	%o0,	%i0
	movg	%xcc,	%g7,	%g3
	movg	%xcc,	%g6,	%o2
	fpackfix	%f4,	%f14
	fnot2	%f28,	%f8
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fmuld8sux16	%f31,	%f3,	%f14
	set	0x5E, %g2
	lduba	[%l7 + %g2] 0x19,	%o5
	udivx	%g4,	0x1AB2,	%g2
	andn	%g5,	0x0DFB,	%l4
	fbuge,a	%fcc1,	loop_324
	fbl,a	%fcc0,	loop_325
	fmovsl	%icc,	%f11,	%f21
	movvc	%icc,	%l6,	%i5
loop_324:
	udiv	%g1,	0x1096,	%l1
loop_325:
	mulscc	%l2,	0x0B1C,	%l5
	tcc	%xcc,	0x3
	fmovd	%f20,	%f10
	movne	%xcc,	%l3,	%i1
	fpsub16	%f8,	%f26,	%f22
	sth	%o3,	[%l7 + 0x5A]
	movrlz	%o6,	%o1,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i6,	%i3
	nop
	setx	0x4661F288,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x7A657A55,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f31,	%f21
	fmovrdgz	%i7,	%f24,	%f30
	movrlez	%o4,	0x1A0,	%o7
	ba	%icc,	loop_326
	movrlez	%i2,	%o0,	%i4
	fmovsa	%icc,	%f23,	%f15
	fmovsvc	%icc,	%f8,	%f25
loop_326:
	st	%f24,	[%l7 + 0x30]
	movrne	%g7,	0x10B,	%i0
	set	0x6C, %l2
	lduha	[%l7 + %l2] 0x14,	%g6
	movgu	%icc,	%o2,	%g3
	set	0x55, %o4
	ldstuba	[%l7 + %o4] 0x88,	%g4
	wr	%g0,	0xea,	%asi
	stba	%o5,	[%l7 + 0x0A] %asi
	membar	#Sync
	set	0x70, %o6
	stxa	%g5,	[%l7 + %o6] 0x80
	fmovdn	%xcc,	%f19,	%f31
	nop
	setx	loop_327,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tgu	%xcc,	0x7
	movl	%xcc,	%l4,	%l6
	mova	%icc,	%i5,	%g2
loop_327:
	fmovsneg	%icc,	%f24,	%f26
	ldsh	[%l7 + 0x78],	%g1
	movrlz	%l2,	0x3EB,	%l5
	xnorcc	%l1,	%l3,	%i1
	taddcc	%o6,	0x143B,	%o1
	udiv	%l0,	0x059C,	%i6
	brgez	%i3,	loop_328
	fbuge	%fcc0,	loop_329
	tgu	%xcc,	0x2
	and	%i7,	%o3,	%o4
loop_328:
	nop
	setx	0xA14612C196D3B66E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xA5F3BEDC8FCE4243,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f12,	%f22
loop_329:
	fnot1	%f16,	%f12
	te	%icc,	0x5
	smul	%o7,	%i2,	%i4
	fblg,a	%fcc0,	loop_330
	ldub	[%l7 + 0x6F],	%o0
	fmovrdgez	%g7,	%f26,	%f16
	srax	%i0,	0x1C,	%g6
loop_330:
	movle	%icc,	%o2,	%g4
	xnor	%g3,	%o5,	%g5
	edge16	%l6,	%i5,	%g2
	tsubcctv	%l4,	0x1AAA,	%g1
	movvc	%icc,	%l5,	%l2
	fpsub32	%f8,	%f28,	%f14
	nop
	setx	0xE48BB2E38184204A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f16
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f26
	fxtod	%f26,	%f8
	orcc	%l1,	%i1,	%o6
	movrlz	%o1,	%l0,	%l3
	subccc	%i3,	0x1C01,	%i7
	tne	%icc,	0x6
	movle	%xcc,	%o3,	%i6
	tsubcctv	%o7,	%i2,	%i4
	edge32l	%o4,	%o0,	%i0
	tle	%xcc,	0x5
	andn	%g6,	0x05C3,	%g7
	edge32ln	%g4,	%g3,	%o5
	edge32n	%g5,	%l6,	%o2
	bg,a	%xcc,	loop_331
	fnands	%f8,	%f7,	%f13
	membar	0x5A
	tpos	%xcc,	0x7
loop_331:
	edge32ln	%i5,	%l4,	%g1
	umul	%l5,	0x18DE,	%g2
	tvs	%xcc,	0x6
	alignaddr	%l2,	%l1,	%i1
	movre	%o1,	%l0,	%l3
	set	0x66, %i7
	ldsba	[%l7 + %i7] 0x88,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i7,	%i3,	%i6
	movrlez	%o3,	%i2,	%i4
	movle	%icc,	%o4,	%o7
	orcc	%o0,	0x19A7,	%i0
	fmovrse	%g6,	%f8,	%f27
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x48] %asi,	%g7
	movrlez	%g3,	%o5,	%g5
	bne,a,pt	%icc,	loop_332
	fpadd32	%f20,	%f20,	%f24
	fbul	%fcc2,	loop_333
	sub	%l6,	0x0D9B,	%o2
loop_332:
	tsubcctv	%g4,	0x15B8,	%i5
	movpos	%xcc,	%g1,	%l4
loop_333:
	fnot1	%f2,	%f24
	edge8ln	%l5,	%l2,	%l1
	ldx	[%l7 + 0x30],	%g2
	fbuge	%fcc0,	loop_334
	edge16l	%o1,	%i1,	%l3
	alignaddrl	%o6,	%l0,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_334:
	or	%i3,	0x1DA6,	%o3
	tleu	%xcc,	0x2
	movneg	%xcc,	%i2,	%i4
	movrlz	%i6,	%o7,	%o0
	set	0x28, %g7
	ldsha	[%l7 + %g7] 0x0c,	%i0
	sll	%o4,	%g6,	%g7
	set	0x58, %o2
	stwa	%o5,	[%l7 + %o2] 0xe2
	membar	#Sync
	movneg	%icc,	%g5,	%g3
	prefetch	[%l7 + 0x10],	 0x2
	fmovdcc	%icc,	%f29,	%f25
	edge16	%o2,	%l6,	%g4
	movvc	%icc,	%g1,	%l4
	fsrc1s	%f22,	%f27
	addccc	%l5,	0x1491,	%i5
	set	0x0C, %g4
	stwa	%l1,	[%l7 + %g4] 0x11
	movcs	%xcc,	%g2,	%l2
	bcc,pt	%icc,	loop_335
	movge	%xcc,	%o1,	%l3
	tle	%icc,	0x6
	tsubcc	%i1,	%l0,	%i7
loop_335:
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
	movvc	%xcc,	%o6,	%i3
	edge32l	%i2,	%i4,	%o3
	fornot1	%f28,	%f28,	%f8
loop_336:
	subcc	%i6,	0x1FD2,	%o0
	tcc	%xcc,	0x7
	nop
	setx	0xA05F8D07,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	movrne	%i0,	0x19F,	%o7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] %asi,	%g6,	%g7
	array16	%o5,	%o4,	%g3
	smulcc	%o2,	%g5,	%g4
	fbule,a	%fcc0,	loop_337
	edge32n	%l6,	%l4,	%l5
	edge8l	%i5,	%l1,	%g1
	array8	%g2,	%o1,	%l3
loop_337:
	ba	%xcc,	loop_338
	movpos	%xcc,	%i1,	%l2
	set	0x24, %g3
	lduha	[%l7 + %g3] 0x88,	%i7
loop_338:
	fnot1	%f30,	%f8
	tpos	%icc,	0x0
	bcc,pn	%xcc,	loop_339
	fsrc1s	%f5,	%f15
	addc	%l0,	0x12DD,	%i3
	nop
	setx	0x00A04D77C06AE902,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_339:
	alignaddrl	%o6,	%i2,	%i4
	brz	%i6,	loop_340
	fsrc2s	%f13,	%f30
	orncc	%o3,	0x051C,	%o0
	taddcc	%o7,	0x1353,	%i0
loop_340:
	nop
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%g6
	edge16l	%g7,	%o5,	%g3
	movle	%xcc,	%o2,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o4,	%g4
	fmovdne	%xcc,	%f10,	%f5
	taddcc	%l6,	0x0EF4,	%l5
	for	%f4,	%f8,	%f18
	mulscc	%i5,	%l4,	%g1
	bne,pn	%icc,	loop_341
	sra	%l1,	%o1,	%g2
	fmul8x16	%f25,	%f12,	%f0
	movne	%xcc,	%l3,	%i1
loop_341:
	addc	%l2,	%l0,	%i7
	fcmpne16	%f6,	%f20,	%i3
	smulcc	%o6,	%i2,	%i4
	orn	%o3,	%o0,	%o7
	taddcc	%i6,	0x0E7D,	%i0
	nop
	set	0x30, %o3
	stw	%g6,	[%l7 + %o3]
	faligndata	%f2,	%f22,	%f28
	nop
	fitod	%f10,	%f28
	fdtos	%f28,	%f28
	fmovrslz	%o5,	%f15,	%f5
	set	0x78, %l6
	ldxa	[%l7 + %l6] 0x11,	%g7
	ld	[%l7 + 0x74],	%f21
	movneg	%icc,	%g3,	%g5
	ldd	[%l7 + 0x70],	%f20
	bcs,a,pn	%icc,	loop_342
	udivcc	%o4,	0x0DC5,	%o2
	tpos	%icc,	0x1
	addccc	%l6,	%l5,	%i5
loop_342:
	fblg,a	%fcc0,	loop_343
	fba,a	%fcc3,	loop_344
	fmovspos	%icc,	%f0,	%f23
	sllx	%l4,	0x02,	%g1
loop_343:
	fblg,a	%fcc1,	loop_345
loop_344:
	tgu	%xcc,	0x4
	edge16n	%l1,	%o1,	%g2
	st	%f15,	[%l7 + 0x54]
loop_345:
	fsrc1	%f22,	%f24
	addccc	%g4,	%i1,	%l2
	set	0x30, %o1
	ldswa	[%l7 + %o1] 0x15,	%l3
	st	%f4,	[%l7 + 0x6C]
	movl	%xcc,	%l0,	%i3
	tsubcctv	%i7,	0x0561,	%i2
	fmovdle	%icc,	%f5,	%f26
	wr	%g0,	0x2a,	%asi
	stwa	%i4,	[%l7 + 0x48] %asi
	membar	#Sync
	bge,a	%icc,	loop_346
	fmuld8sux16	%f6,	%f10,	%f18
	sdivcc	%o3,	0x1249,	%o6
	fmul8x16al	%f12,	%f31,	%f20
loop_346:
	andncc	%o0,	%i6,	%i0
	edge16ln	%o7,	%o5,	%g7
	move	%icc,	%g6,	%g3
	wr	%g0,	0x2f,	%asi
	stba	%g5,	[%l7 + 0x46] %asi
	membar	#Sync
	stb	%o4,	[%l7 + 0x5A]
	alignaddrl	%o2,	%l6,	%i5
	ldsw	[%l7 + 0x6C],	%l5
	sub	%g1,	0x1E97,	%l1
	addccc	%o1,	%g2,	%g4
	fnot1	%f20,	%f22
	bleu,pn	%xcc,	loop_347
	fmovsn	%xcc,	%f13,	%f24
	movrgez	%i1,	0x301,	%l4
	srlx	%l3,	%l2,	%l0
loop_347:
	fone	%f24
	sra	%i7,	%i3,	%i2
	smul	%i4,	%o3,	%o0
	nop
	setx	loop_348,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x38],	%o6
	fpsub16s	%f4,	%f24,	%f25
	andn	%i0,	0x12DB,	%o7
loop_348:
	xnorcc	%i6,	0x132E,	%o5
	set	0x77, %i5
	stba	%g6,	[%l7 + %i5] 0xeb
	membar	#Sync
	ldsh	[%l7 + 0x2A],	%g3
	fabsd	%f16,	%f18
	brz,a	%g7,	loop_349
	nop
	setx	loop_350,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%xcc,	%o4,	%g5
	fornot1s	%f12,	%f31,	%f21
loop_349:
	subc	%l6,	%o2,	%l5
loop_350:
	fmovrsne	%g1,	%f21,	%f7
	sra	%l1,	%i5,	%g2
	fpsub16s	%f3,	%f6,	%f25
	fsrc1s	%f20,	%f9
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x1
	nop
	setx	0xF598D0CDF04C04EF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	prefetch	[%l7 + 0x34],	 0x2
	ta	%icc,	0x1
	nop
	fitos	%f6,	%f10
	fstod	%f10,	%f0
	movgu	%icc,	%o1,	%i1
	tvc	%icc,	0x5
	udiv	%g4,	0x14E2,	%l3
	fpsub16s	%f3,	%f27,	%f10
	udivcc	%l4,	0x1640,	%l2
	fbug	%fcc1,	loop_351
	fnand	%f30,	%f0,	%f10
	sdivx	%i7,	0x19B6,	%i3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i2
loop_351:
	bneg,a,pt	%xcc,	loop_352
	srax	%i4,	%l0,	%o0
	set	0x76, %g5
	lduha	[%l7 + %g5] 0x0c,	%o6
loop_352:
	tsubcc	%i0,	%o7,	%o3
	orcc	%o5,	0x0823,	%g6
	ta	%xcc,	0x0
	movrlz	%g3,	0x147,	%i6
	nop
	setx	0xADF2894F90426275,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	bleu	%xcc,	loop_353
	tleu	%xcc,	0x5
	udiv	%o4,	0x0A96,	%g7
	movcs	%xcc,	%g5,	%l6
loop_353:
	or	%l5,	%o2,	%l1
	prefetch	[%l7 + 0x6C],	 0x2
	orncc	%g1,	%i5,	%g2
	stw	%o1,	[%l7 + 0x60]
	st	%f25,	[%l7 + 0x5C]
	fmovrsgez	%g4,	%f17,	%f10
	mulscc	%i1,	%l4,	%l2
	tcs	%icc,	0x4
	movcc	%icc,	%l3,	%i7
	add	%i2,	%i3,	%l0
	edge32	%i4,	%o0,	%o6
	bleu,a	loop_354
	udiv	%i0,	0x014F,	%o3
	movgu	%xcc,	%o5,	%g6
	nop
	setx	loop_355,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_354:
	bneg,a	%xcc,	loop_356
	nop
	setx	loop_357,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fba	%fcc1,	loop_358
loop_355:
	andncc	%g3,	%o7,	%o4
loop_356:
	fcmpne16	%f26,	%f2,	%i6
loop_357:
	fmovsa	%xcc,	%f10,	%f29
loop_358:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f9,	%f7
	movcc	%icc,	%g7,	%l6
	or	%g5,	%l5,	%o2
	fmul8ulx16	%f24,	%f14,	%f18
	fbne	%fcc1,	loop_359
	tg	%icc,	0x5
	tle	%xcc,	0x2
	fmovdneg	%xcc,	%f15,	%f16
loop_359:
	addcc	%g1,	%i5,	%l1
	wr	%g0,	0x10,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	or	%g2,	0x0B9F,	%o1
	nop
	set	0x24, %l0
	ldsw	[%l7 + %l0],	%g4
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf8,	%f16
	movcs	%xcc,	%i1,	%l4
	set	0x30, %i6
	stwa	%l3,	[%l7 + %i6] 0x19
	nop
	fitos	%f1,	%f12
	fstox	%f12,	%f22
	umul	%i7,	0x0DFB,	%i2
	fcmple32	%f8,	%f2,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f24,	%f18,	%f6
	fones	%f30
	brgez	%l0,	loop_360
	bvs	%icc,	loop_361
	fbg,a	%fcc1,	loop_362
	bleu	%xcc,	loop_363
loop_360:
	and	%l2,	0x0FF4,	%i4
loop_361:
	fmovdl	%icc,	%f11,	%f14
loop_362:
	nop
	set	0x44, %i0
	ldsw	[%l7 + %i0],	%o0
loop_363:
	tle	%icc,	0x6
	edge32l	%i0,	%o6,	%o3
	tvs	%xcc,	0x6
	edge16	%g6,	%o5,	%o7
	tcc	%xcc,	0x0
	addcc	%g3,	0x0EDA,	%i6
	movrgez	%o4,	%g7,	%g5
	mova	%xcc,	%l6,	%l5
	tl	%xcc,	0x6
	fandnot1	%f4,	%f8,	%f14
	movrgez	%o2,	%i5,	%g1
	umulcc	%l1,	0x074F,	%g2
	orcc	%o1,	0x0591,	%i1
	wr	%g0,	0x19,	%asi
	stwa	%l4,	[%l7 + 0x7C] %asi
	movg	%icc,	%l3,	%i7
	smul	%i2,	%i3,	%l0
	movrgz	%g4,	0x26C,	%i4
	ldd	[%l7 + 0x40],	%f20
	movl	%xcc,	%l2,	%o0
	sethi	0x07D3,	%o6
	pdist	%f22,	%f12,	%f6
	tpos	%xcc,	0x7
	sdivcc	%i0,	0x1F83,	%g6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%o5,	%o3
	fpsub16	%f28,	%f14,	%f0
	fblg,a	%fcc2,	loop_364
	edge16l	%o7,	%i6,	%g3
	addcc	%g7,	0x1C22,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_364:
	movvc	%icc,	%l6,	%g5
	nop
	setx	0x30590787,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	tge	%xcc,	0x0
	stx	%o2,	[%l7 + 0x78]
	tsubcc	%i5,	%l5,	%l1
	udivx	%g1,	0x0FEE,	%o1
	tge	%xcc,	0x3
	alignaddr	%g2,	%i1,	%l4
	andncc	%l3,	%i7,	%i3
	mulscc	%l0,	%g4,	%i2
	movgu	%icc,	%i4,	%o0
	fzeros	%f20
	bge,a	%icc,	loop_365
	tg	%icc,	0x7
	set	0x57, %i1
	ldstuba	[%l7 + %i1] 0x89,	%l2
loop_365:
	fnot1s	%f26,	%f31
	movcc	%icc,	%o6,	%g6
	nop
	setx loop_366, %l0, %l1
	jmpl %l1, %o5
	nop
	setx loop_367, %l0, %l1
	jmpl %l1, %o3
	membar	0x18
	tpos	%xcc,	0x2
loop_366:
	nop
	setx	loop_368,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_367:
	alignaddr	%o7,	%i0,	%g3
	orncc	%i6,	0x0EC9,	%o4
	bne,pn	%xcc,	loop_369
loop_368:
	tge	%xcc,	0x3
	sir	0x1912
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l6,	%g5
loop_369:
	nop
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	tge	%xcc,	0x6
	taddcctv	%i5,	%g7,	%l1
	xor	%g1,	0x1959,	%l5
	set	0x34, %g1
	ldsba	[%l7 + %g1] 0x18,	%g2
	call	loop_370
	fbug	%fcc1,	loop_371
	subcc	%i1,	0x1716,	%o1
	edge32n	%l4,	%i7,	%l3
loop_370:
	tn	%icc,	0x1
loop_371:
	udivcc	%l0,	0x11EE,	%g4
	set	0x74, %o0
	ldswa	[%l7 + %o0] 0x81,	%i2
	nop
	setx	0xE790A315204FB54E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fbne,a	%fcc2,	loop_372
	umulcc	%i3,	%i4,	%l2
	tg	%icc,	0x7
	subccc	%o6,	0x1436,	%g6
loop_372:
	swap	[%l7 + 0x68],	%o5
	udiv	%o3,	0x118F,	%o0
	orn	%i0,	%o7,	%i6
	movl	%xcc,	%g3,	%o4
	xnorcc	%l6,	%o2,	%i5
	fcmpeq32	%f24,	%f12,	%g7
	subccc	%l1,	0x0A3A,	%g5
	fcmple32	%f26,	%f6,	%g1
	lduw	[%l7 + 0x70],	%l5
	umulcc	%i1,	0x1BAF,	%g2
	movle	%icc,	%l4,	%o1
	tcs	%xcc,	0x3
	sdiv	%l3,	0x16E3,	%l0
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g4
	edge16	%i7,	%i3,	%i2
	smulcc	%l2,	%o6,	%i4
	fmovrde	%g6,	%f8,	%f6
	movcs	%icc,	%o5,	%o0
	fmovdge	%icc,	%f30,	%f8
	mova	%icc,	%i0,	%o3
	edge32n	%o7,	%g3,	%i6
	ldub	[%l7 + 0x37],	%o4
	andcc	%o2,	%l6,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x0
	bn,a,pn	%xcc,	loop_373
	fmovsvs	%xcc,	%f16,	%f31
	orn	%i5,	0x11CB,	%l1
	popc	0x0A0A,	%g5
loop_373:
	bvc	%icc,	loop_374
	edge16	%l5,	%i1,	%g2
	fpmerge	%f14,	%f27,	%f14
	ta	%xcc,	0x4
loop_374:
	fbge,a	%fcc3,	loop_375
	fbuge,a	%fcc2,	loop_376
	edge16l	%l4,	%g1,	%l3
	fmovdne	%xcc,	%f22,	%f25
loop_375:
	fmovrdne	%l0,	%f20,	%f24
loop_376:
	edge16n	%g4,	%i7,	%i3
	fmovde	%xcc,	%f7,	%f7
	bg,a,pt	%xcc,	loop_377
	srax	%o1,	%i2,	%l2
	xnorcc	%i4,	0x02FA,	%g6
	andncc	%o5,	%o0,	%i0
loop_377:
	addcc	%o3,	0x054E,	%o7
	fba,a	%fcc1,	loop_378
	fsrc1s	%f23,	%f26
	fbue,a	%fcc0,	loop_379
	movne	%icc,	%o6,	%g3
loop_378:
	fmul8x16	%f24,	%f26,	%f28
	edge32n	%i6,	%o4,	%o2
loop_379:
	movcs	%xcc,	%g7,	%l6
	te	%xcc,	0x7
	bvc,pt	%icc,	loop_380
	tsubcc	%i5,	0x1BE5,	%g5
	fxnor	%f6,	%f6,	%f18
	edge8	%l5,	%l1,	%g2
loop_380:
	nop
	set	0x58, %i4
	stwa	%l4,	[%l7 + %i4] 0x2f
	membar	#Sync
	ldsb	[%l7 + 0x18],	%g1
	orncc	%l3,	%i1,	%l0
	nop
	setx	0x609344DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xD0001D0A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f13,	%f4
	fmul8x16	%f8,	%f12,	%f16
	te	%icc,	0x6
	tl	%xcc,	0x4
	movrlez	%g4,	0x022,	%i3
	movle	%xcc,	%i7,	%i2
	edge32ln	%o1,	%l2,	%g6
	fba,a	%fcc3,	loop_381
	movvc	%icc,	%i4,	%o5
	tcs	%xcc,	0x7
	ld	[%l7 + 0x14],	%f14
loop_381:
	nop
	fitos	%f2,	%f15
	fsrc2	%f22,	%f14
	edge8	%o0,	%i0,	%o7
	fbuge	%fcc3,	loop_382
	tge	%xcc,	0x7
	ldd	[%l7 + 0x38],	%f22
	tgu	%xcc,	0x3
loop_382:
	fmovsvc	%icc,	%f8,	%f6
	fxnor	%f24,	%f16,	%f6
	movrne	%o6,	%o3,	%i6
	subc	%o4,	%o2,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g7,	%i5,	%g5
	taddcctv	%l5,	%l6,	%g2
	prefetch	[%l7 + 0x58],	 0x2
	fors	%f10,	%f29,	%f26
	std	%f10,	[%l7 + 0x70]
	tcs	%xcc,	0x4
	movcc	%xcc,	%l4,	%g1
	tgu	%xcc,	0x6
	bn	%icc,	loop_383
	bneg,pt	%xcc,	loop_384
	stbar
	subcc	%l1,	0x0E0B,	%i1
loop_383:
	stb	%l3,	[%l7 + 0x4E]
loop_384:
	fnot2s	%f0,	%f17
	set	0x33, %i2
	ldstuba	[%l7 + %i2] 0x80,	%g4
	te	%icc,	0x4
	fbne,a	%fcc3,	loop_385
	bleu,a,pn	%icc,	loop_386
	tsubcctv	%l0,	%i7,	%i3
	srax	%i2,	0x11,	%l2
loop_385:
	taddcctv	%o1,	0x1B0E,	%i4
loop_386:
	sdiv	%o5,	0x0860,	%o0
	movne	%icc,	%i0,	%g6
	smulcc	%o7,	%o3,	%i6
	prefetch	[%l7 + 0x08],	 0x0
	srl	%o4,	0x0B,	%o6
	fors	%f27,	%f6,	%f21
	movrlz	%g3,	%g7,	%i5
	movgu	%xcc,	%o2,	%g5
	stw	%l6,	[%l7 + 0x58]
	array32	%g2,	%l4,	%g1
	tle	%icc,	0x6
	fbe	%fcc0,	loop_387
	ld	[%l7 + 0x64],	%f0
	orncc	%l1,	0x16D9,	%i1
	be,a	%icc,	loop_388
loop_387:
	movn	%icc,	%l5,	%l3
	te	%xcc,	0x1
	movrne	%g4,	0x225,	%l0
loop_388:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x24] %asi,	%i3
	tgu	%icc,	0x4
	nop
	setx	loop_389,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg,a	%fcc3,	loop_390
	fcmpne16	%f4,	%f30,	%i2
	fbge,a	%fcc1,	loop_391
loop_389:
	ldub	[%l7 + 0x4A],	%i7
loop_390:
	fbge	%fcc1,	loop_392
	movre	%o1,	%l2,	%i4
loop_391:
	xnor	%o5,	0x1BDE,	%i0
	fpsub16	%f6,	%f14,	%f6
loop_392:
	edge32l	%o0,	%o7,	%g6
	alignaddr	%o3,	%i6,	%o4
	taddcc	%g3,	0x0940,	%g7
	andncc	%i5,	%o6,	%g5
	tn	%icc,	0x5
	alignaddrl	%o2,	%g2,	%l6
	fxnors	%f26,	%f25,	%f8
	stx	%g1,	[%l7 + 0x38]
	stx	%l4,	[%l7 + 0x18]
	fpsub16s	%f12,	%f26,	%f12
	bl,a,pt	%xcc,	loop_393
	ldx	[%l7 + 0x68],	%i1
	fmul8x16al	%f27,	%f3,	%f2
	sllx	%l1,	0x19,	%l3
loop_393:
	nop
	set	0x62, %l1
	ldstub	[%l7 + %l1],	%l5
	movrlez	%l0,	%i3,	%g4
	fmovs	%f2,	%f26
	fbue	%fcc0,	loop_394
	brlz,a	%i2,	loop_395
	tpos	%xcc,	0x5
	brgez,a	%o1,	loop_396
loop_394:
	movvc	%icc,	%l2,	%i7
loop_395:
	subcc	%o5,	0x0CCB,	%i0
	mulx	%i4,	0x081D,	%o0
loop_396:
	stx	%o7,	[%l7 + 0x18]
	array32	%o3,	%i6,	%g6
	fmovrdlz	%g3,	%f28,	%f18
	fbue,a	%fcc0,	loop_397
	movrne	%g7,	%o4,	%i5
	edge32ln	%o6,	%g5,	%g2
	nop
	fitod	%f6,	%f10
loop_397:
	fabss	%f24,	%f13
	edge16	%l6,	%o2,	%l4
	xorcc	%i1,	0x16B5,	%g1
	stbar
	or	%l3,	%l5,	%l1
	sdiv	%i3,	0x0E84,	%l0
	movcs	%icc,	%g4,	%i2
	xor	%o1,	0x12D3,	%i7
	edge8l	%o5,	%l2,	%i0
	xnor	%o0,	0x0C4D,	%o7
	ldub	[%l7 + 0x28],	%o3
	fbge,a	%fcc2,	loop_398
	fmul8sux16	%f8,	%f8,	%f0
	orcc	%i6,	%i4,	%g3
	lduw	[%l7 + 0x14],	%g7
loop_398:
	for	%f8,	%f18,	%f28
	movrgz	%g6,	0x290,	%o4
	srl	%i5,	%g5,	%o6
	edge8l	%g2,	%o2,	%l6
	nop
	setx loop_399, %l0, %l1
	jmpl %l1, %i1
	membar	0x5A
	nop
	fitos	%f7,	%f15
	fstod	%f15,	%f12
	te	%xcc,	0x7
loop_399:
	sdivcc	%l4,	0x1AF6,	%g1
	fbu,a	%fcc1,	loop_400
	edge32ln	%l5,	%l3,	%i3
	array16	%l0,	%l1,	%g4
	orcc	%i2,	0x1E65,	%i7
loop_400:
	nop
	fitos	%f7,	%f26
	fstox	%f26,	%f0
	add	%o1,	0x02BA,	%l2
	sub	%o5,	%i0,	%o0
	edge32l	%o3,	%o7,	%i6
	fmovrdne	%g3,	%f20,	%f24
	srl	%i4,	0x0D,	%g6
	sdivx	%g7,	0x0DF5,	%o4
	mulscc	%g5,	0x0DA3,	%i5
	tn	%icc,	0x7
	movcs	%xcc,	%o6,	%o2
	tvs	%icc,	0x7
	andncc	%g2,	%i1,	%l4
	movle	%xcc,	%g1,	%l6
	movl	%icc,	%l3,	%l5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	fmul8x16al	%f10,	%f10,	%f14
	movcs	%icc,	%l1,	%g4
	srax	%i2,	%i7,	%o1
	sdivcc	%l2,	0x0E6A,	%o5
	udivx	%i0,	0x1A1A,	%l0
	sra	%o0,	%o7,	%i6
	edge8n	%g3,	%o3,	%g6
	bcs,a	loop_401
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f6
	fxtod	%f6,	%f30
	edge32	%i4,	%g7,	%o4
	sll	%g5,	%o6,	%o2
loop_401:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x44] %asi,	%i5
	fcmpeq32	%f20,	%f6,	%i1
	fbge	%fcc1,	loop_402
	xor	%l4,	0x1FAC,	%g2
	movl	%xcc,	%l6,	%l3
	wr	%g0,	0x89,	%asi
	stba	%g1,	[%l7 + 0x51] %asi
loop_402:
	movl	%xcc,	%i3,	%l5
	addccc	%g4,	0x13CA,	%i2
	fandnot1	%f22,	%f28,	%f28
	fmovrdgz	%l1,	%f12,	%f8
	fbne	%fcc2,	loop_403
	andncc	%o1,	%i7,	%o5
	bne,a	loop_404
	subccc	%l2,	0x0AD6,	%l0
loop_403:
	edge8	%o0,	%o7,	%i0
	andncc	%i6,	%g3,	%o3
loop_404:
	bvs	%xcc,	loop_405
	fmovrsgez	%i4,	%f7,	%f2
	fmovrse	%g6,	%f26,	%f9
	set	0x40, %g6
	stwa	%o4,	[%l7 + %g6] 0x04
loop_405:
	edge16ln	%g5,	%g7,	%o6
	udiv	%o2,	0x1B33,	%i5
	andncc	%i1,	%g2,	%l4
	movleu	%xcc,	%l3,	%l6
	tl	%xcc,	0x6
	fmovda	%xcc,	%f29,	%f16
	ldd	[%l7 + 0x60],	%f10
	tvc	%icc,	0x2
	fmovrsne	%i3,	%f17,	%f16
	fsrc1s	%f16,	%f30
	flush	%l7 + 0x4C
	fmovrsgz	%g1,	%f7,	%f8
	tleu	%icc,	0x6
	orncc	%g4,	%l5,	%i2
	te	%icc,	0x1
	edge32	%l1,	%i7,	%o5
	call	loop_406
	movleu	%icc,	%l2,	%l0
	nop
	setx	loop_407,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%o0,	0x1146,	%o7
loop_406:
	sllx	%i0,	%o1,	%i6
	nop
	setx	0x83A4D3E42A743683,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x3524687EAD3E6002,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f20,	%f24
loop_407:
	movcc	%icc,	%g3,	%i4
	sub	%o3,	0x1317,	%o4
	movvs	%xcc,	%g6,	%g5
	fmovsa	%xcc,	%f15,	%f19
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf1
	membar	#Sync
	fmovdpos	%xcc,	%f31,	%f29
	tl	%xcc,	0x6
	brgez	%g7,	loop_408
	fba	%fcc2,	loop_409
	edge16	%o2,	%o6,	%i1
	orcc	%g2,	%l4,	%l3
loop_408:
	srax	%l6,	0x09,	%i3
loop_409:
	stb	%g1,	[%l7 + 0x64]
	andn	%g4,	%l5,	%i2
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x0F] %asi,	%i5
	fbe	%fcc3,	loop_410
	fbne	%fcc2,	loop_411
	sethi	0x1AA7,	%l1
	fpadd16s	%f5,	%f26,	%f0
loop_410:
	fmovrsgez	%o5,	%f1,	%f25
loop_411:
	lduh	[%l7 + 0x4E],	%l2
	movrne	%l0,	%i7,	%o0
	be,a,pt	%xcc,	loop_412
	andncc	%i0,	%o1,	%o7
	fbu,a	%fcc2,	loop_413
	bge,a,pt	%xcc,	loop_414
loop_412:
	fcmpne32	%f12,	%f22,	%g3
	popc	0x0318,	%i6
loop_413:
	nop
	set	0x28, %o7
	stx	%o3,	[%l7 + %o7]
loop_414:
	nop
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x2f,	%i4
	movrlz	%g6,	%g5,	%g7
	fmovdne	%icc,	%f23,	%f10
	fbuge	%fcc0,	loop_415
	tcs	%icc,	0x5
	mulscc	%o2,	0x1014,	%o6
	edge32n	%o4,	%g2,	%l4
loop_415:
	taddcc	%i1,	0x0AA3,	%l3
	tcc	%xcc,	0x5
	bcc	%icc,	loop_416
	movgu	%xcc,	%i3,	%g1
	movvs	%xcc,	%g4,	%l6
	subccc	%l5,	0x1ED2,	%i2
loop_416:
	fabss	%f2,	%f25
	fmovdge	%xcc,	%f29,	%f15
	fblg	%fcc2,	loop_417
	tge	%icc,	0x4
	tneg	%xcc,	0x5
	subccc	%i5,	0x1947,	%l1
loop_417:
	sir	0x158C
	nop
	setx loop_418, %l0, %l1
	jmpl %l1, %l2
	edge32ln	%l0,	%o5,	%o0
	fornot2	%f0,	%f0,	%f30
	fbge	%fcc0,	loop_419
loop_418:
	st	%f9,	[%l7 + 0x2C]
	movvs	%icc,	%i7,	%o1
	tvs	%xcc,	0x5
loop_419:
	tvs	%icc,	0x0
	fbo	%fcc3,	loop_420
	ldsw	[%l7 + 0x5C],	%o7
	fandnot2s	%f19,	%f17,	%f13
	fbe,a	%fcc0,	loop_421
loop_420:
	movl	%icc,	%i0,	%i6
	subccc	%o3,	0x03C5,	%i4
	srlx	%g6,	0x0D,	%g3
loop_421:
	fpadd32s	%f2,	%f11,	%f4
	brnz,a	%g5,	loop_422
	alignaddrl	%o2,	%o6,	%o4
	orcc	%g2,	%g7,	%i1
	movrlz	%l3,	0x0AC,	%i3
loop_422:
	udivx	%g1,	0x176C,	%g4
	orncc	%l4,	0x0D3D,	%l5
	move	%xcc,	%i2,	%i5
	fmovrdgez	%l1,	%f10,	%f14
	movcs	%icc,	%l6,	%l0
	brlz,a	%l2,	loop_423
	nop
	setx	0x00618A71,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x4A867D75,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f27,	%f3
	udivx	%o5,	0x09DB,	%i7
	xnor	%o1,	%o0,	%o7
loop_423:
	xnorcc	%i6,	0x0640,	%i0
	edge16n	%o3,	%i4,	%g3
	movne	%xcc,	%g5,	%g6
	tge	%icc,	0x4
	tvs	%icc,	0x4
	bge,pn	%xcc,	loop_424
	call	loop_425
	movrgez	%o2,	%o6,	%g2
	fnot2	%f18,	%f2
loop_424:
	movge	%icc,	%o4,	%g7
loop_425:
	faligndata	%f10,	%f6,	%f10
	swap	[%l7 + 0x14],	%l3
	tcs	%icc,	0x2
	fmovda	%xcc,	%f12,	%f17
	nop
	setx	0xFF563C0D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xEA734477,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f17,	%f11
	smulcc	%i1,	0x1A64,	%g1
	nop
	fitos	%f7,	%f13
	fstox	%f13,	%f26
	fxtos	%f26,	%f28
	edge32l	%i3,	%l4,	%g4
	taddcc	%i2,	%i5,	%l1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4C] %asi,	%l5
	nop
	fitos	%f13,	%f2
	fstox	%f2,	%f22
	brgz,a	%l0,	loop_426
	movgu	%icc,	%l6,	%l2
	bg,a	%xcc,	loop_427
	xnor	%i7,	%o5,	%o0
loop_426:
	movcc	%icc,	%o7,	%o1
	sllx	%i0,	%i6,	%i4
loop_427:
	movge	%icc,	%g3,	%g5
	movle	%icc,	%g6,	%o2
	addccc	%o3,	%o6,	%o4
	nop
	fitod	%f8,	%f2
	fdtox	%f2,	%f8
	and	%g7,	%l3,	%i1
	fnegs	%f1,	%f16
	movgu	%xcc,	%g2,	%i3
	addcc	%g1,	%l4,	%g4
	udivx	%i5,	0x170C,	%l1
	movgu	%xcc,	%i2,	%l5
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x1D] %asi,	%l6
	movrlez	%l2,	0x280,	%i7
	stbar
	smulcc	%l0,	%o0,	%o5
	addcc	%o7,	0x0FB6,	%i0
	tsubcctv	%i6,	%o1,	%g3
	movg	%xcc,	%i4,	%g6
	xnorcc	%o2,	%o3,	%g5
	tle	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x1042FBE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	fandnot2	%f12,	%f22,	%f2
	tleu	%icc,	0x7
	nop
	fitos	%f5,	%f9
	fstox	%f9,	%f26
	addcc	%o4,	0x1BCA,	%o6
	movn	%xcc,	%g7,	%i1
	tg	%xcc,	0x5
	taddcc	%g2,	%i3,	%l3
	sethi	0x1E08,	%l4
	ldstub	[%l7 + 0x1C],	%g1
	sra	%g4,	%i5,	%l1
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x1A] %asi,	%i2
	xnor	%l6,	%l5,	%i7
	movge	%icc,	%l2,	%o0
	tleu	%xcc,	0x2
	tpos	%xcc,	0x2
	movn	%icc,	%l0,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x0
	fmovsgu	%icc,	%f21,	%f7
	fmovdge	%xcc,	%f28,	%f14
	fornot1	%f24,	%f20,	%f6
	movge	%xcc,	%i0,	%o5
	srl	%i6,	0x19,	%o1
	bvc,a	loop_428
	nop
	setx	0x4AF07088,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xB7E0AD5E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f29,	%f30
	nop
	setx	0x804BA155,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	set	0x4C, %l5
	stha	%i4,	[%l7 + %l5] 0x15
loop_428:
	andn	%g3,	0x0DFD,	%g6
	and	%o3,	0x11F8,	%o2
	bn,a	%xcc,	loop_429
	movge	%icc,	%o4,	%g5
	sll	%g7,	%i1,	%o6
	array8	%g2,	%l3,	%l4
loop_429:
	fpsub32s	%f31,	%f4,	%f31
	add	%g1,	%g4,	%i5
	edge8l	%l1,	%i3,	%l6
	andcc	%i2,	0x1D10,	%l5
	fnot1	%f12,	%f20
	fnot1s	%f16,	%f9
	movneg	%icc,	%i7,	%l2
	nop
	set	0x48, %l3
	lduw	[%l7 + %l3],	%l0
	fnor	%f0,	%f26,	%f12
	tsubcc	%o7,	%o0,	%o5
	orn	%i0,	%o1,	%i4
	fbue	%fcc2,	loop_430
	sethi	0x0B86,	%g3
	fmovdcc	%xcc,	%f4,	%f1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_430:
	andn	%g6,	%i6,	%o3
	sra	%o2,	0x08,	%o4
	fmovrslez	%g5,	%f15,	%f30
	tcs	%icc,	0x4
	fmul8sux16	%f2,	%f8,	%f6
	fbu,a	%fcc3,	loop_431
	array32	%i1,	%g7,	%o6
	call	loop_432
	array32	%l3,	%l4,	%g2
loop_431:
	movg	%icc,	%g1,	%i5
	fandnot1	%f10,	%f30,	%f16
loop_432:
	fbue,a	%fcc0,	loop_433
	umul	%l1,	%g4,	%i3
	tle	%icc,	0x7
	nop
	setx	0x1C6F99169137C12B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x029282B8B2DE66EA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f18,	%f0
loop_433:
	sethi	0x05D6,	%l6
	sub	%l5,	%i2,	%l2
	addcc	%i7,	0x1A1E,	%o7
	nop
	fitod	%f8,	%f20
	fdtos	%f20,	%f17
	edge32n	%o0,	%o5,	%l0
	edge16	%i0,	%o1,	%g3
	tcc	%xcc,	0x7
	tcs	%icc,	0x6
	tn	%icc,	0x1
	andcc	%g6,	0x123F,	%i6
	mulscc	%o3,	%o2,	%o4
	udivx	%i4,	0x1396,	%g5
	and	%i1,	%g7,	%l3
	addcc	%l4,	0x18FA,	%o6
	bpos,pt	%xcc,	loop_434
	fzero	%f8
	te	%icc,	0x0
	movrgz	%g2,	%i5,	%g1
loop_434:
	stw	%g4,	[%l7 + 0x10]
	bvs	loop_435
	fmovs	%f16,	%f23
	ldsw	[%l7 + 0x54],	%l1
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%l6,	%l5
loop_435:
	edge16	%i2,	%i3,	%i7
	edge8n	%l2,	%o0,	%o5
	flush	%l7 + 0x24
	fmuld8sux16	%f6,	%f18,	%f16
	fbue,a	%fcc1,	loop_436
	tleu	%xcc,	0x4
	fmovsa	%xcc,	%f12,	%f19
	fba,a	%fcc0,	loop_437
loop_436:
	stb	%l0,	[%l7 + 0x29]
	andn	%i0,	0x0010,	%o1
	fmuld8sux16	%f16,	%f25,	%f24
loop_437:
	sdivx	%o7,	0x0EF0,	%g3
	subccc	%g6,	%o3,	%i6
	wr	%g0,	0x81,	%asi
	stha	%o4,	[%l7 + 0x72] %asi
	udivcc	%o2,	0x0B33,	%g5
	movvc	%xcc,	%i4,	%i1
	movrgz	%g7,	0x3CF,	%l4
	membar	0x41
	movne	%xcc,	%l3,	%g2
	fpmerge	%f29,	%f12,	%f22
	fbug,a	%fcc3,	loop_438
	smulcc	%o6,	%i5,	%g1
	movre	%g4,	0x1F8,	%l6
	xor	%l5,	0x13A0,	%i2
loop_438:
	nop
	setx	0x704B84CE,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	edge8l	%i3,	%i7,	%l2
	udivx	%o0,	0x0942,	%l1
	taddcc	%o5,	%i0,	%o1
	tg	%icc,	0x6
	set	0x30, %g2
	stwa	%o7,	[%l7 + %g2] 0xeb
	membar	#Sync
	mulx	%l0,	0x08B8,	%g6
	edge8n	%o3,	%g3,	%i6
	movrne	%o4,	0x34C,	%o2
	ldx	[%l7 + 0x70],	%g5
	fbul,a	%fcc1,	loop_439
	fba	%fcc3,	loop_440
	movneg	%xcc,	%i1,	%i4
	sdiv	%g7,	0x1827,	%l3
loop_439:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x6F] %asi,	%g2
loop_440:
	movrlez	%l4,	%o6,	%i5
	nop
	setx	0xB9B881044877EC26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xAAE17BADB90563FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f30,	%f14
	mulscc	%g1,	%g4,	%l5
	bne	loop_441
	xnor	%i2,	0x07D9,	%l6
	addc	%i7,	%i3,	%l2
	movvc	%icc,	%o0,	%l1
loop_441:
	sdivcc	%i0,	0x0006,	%o5
	bcc,a,pt	%xcc,	loop_442
	ta	%icc,	0x3
	tvs	%icc,	0x2
	edge32	%o1,	%l0,	%o7
loop_442:
	swap	[%l7 + 0x30],	%g6
	add	%l7,	0x64,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%i6
	movne	%icc,	%o3,	%o2
	membar	0x45
	stx	%o4,	[%l7 + 0x30]
	fblg,a	%fcc2,	loop_443
	fmovse	%icc,	%f21,	%f2
	srlx	%g5,	0x10,	%i1
	fmovdcs	%icc,	%f27,	%f25
loop_443:
	fble,a	%fcc3,	loop_444
	fmovsgu	%icc,	%f19,	%f17
	ba,a	loop_445
	fandnot2s	%f0,	%f7,	%f8
loop_444:
	nop
	setx loop_446, %l0, %l1
	jmpl %l1, %i4
	fbg	%fcc0,	loop_447
loop_445:
	edge16	%g7,	%l3,	%g2
	fmovrslz	%o6,	%f22,	%f9
loop_446:
	sll	%l4,	%i5,	%g1
loop_447:
	movge	%xcc,	%g4,	%i2
	movcs	%xcc,	%l5,	%l6
	srl	%i7,	0x1E,	%l2
	fnot2	%f16,	%f10
	membar	0x25
	movcs	%icc,	%i3,	%o0
	stbar
	move	%icc,	%i0,	%l1
	subccc	%o5,	%o1,	%o7
	fandnot1s	%f13,	%f11,	%f7
	bleu,a	%icc,	loop_448
	sth	%l0,	[%l7 + 0x42]
	edge32l	%g6,	%i6,	%g3
	mulx	%o2,	%o4,	%g5
loop_448:
	movne	%icc,	%o3,	%i4
	fnegd	%f18,	%f20
	sdivcc	%g7,	0x1871,	%i1
	sdivx	%g2,	0x19FA,	%l3
	fmovspos	%xcc,	%f18,	%f0
	tge	%xcc,	0x2
	brz	%o6,	loop_449
	fmul8ulx16	%f26,	%f4,	%f26
	array8	%l4,	%g1,	%i5
	be,pn	%icc,	loop_450
loop_449:
	fmovscc	%icc,	%f30,	%f24
	orcc	%g4,	%l5,	%i2
	brlez	%l6,	loop_451
loop_450:
	subc	%i7,	0x1C3F,	%l2
	fmovsg	%xcc,	%f14,	%f27
	sdivx	%o0,	0x1530,	%i3
loop_451:
	ld	[%l7 + 0x70],	%f7
	fmovs	%f8,	%f31
	bgu,a	loop_452
	nop
	fitos	%f16,	%f3
	sllx	%l1,	0x0D,	%o5
	fpsub16s	%f31,	%f23,	%f20
loop_452:
	tgu	%xcc,	0x3
	edge16ln	%o1,	%i0,	%o7
	xorcc	%g6,	%i6,	%l0
	set	0x2C, %l2
	lduwa	[%l7 + %l2] 0x11,	%g3
	nop
	fitod	%f2,	%f12
	fdtoi	%f12,	%f3
	sra	%o2,	%g5,	%o4
	movne	%xcc,	%i4,	%g7
	brgez	%o3,	loop_453
	fpsub16	%f20,	%f14,	%f14
	fexpand	%f17,	%f22
	edge32ln	%g2,	%i1,	%l3
loop_453:
	addc	%o6,	%g1,	%l4
	smulcc	%i5,	%g4,	%i2
	fmovsa	%xcc,	%f21,	%f0
	fmul8x16	%f9,	%f2,	%f8
	fands	%f7,	%f26,	%f20
	taddcc	%l6,	%i7,	%l5
	movl	%icc,	%o0,	%l2
	fbule	%fcc2,	loop_454
	fmovdne	%xcc,	%f7,	%f14
	tgu	%icc,	0x1
	addc	%l1,	%i3,	%o1
loop_454:
	bneg	%icc,	loop_455
	fbuge	%fcc1,	loop_456
	movcs	%xcc,	%i0,	%o5
	sllx	%o7,	%g6,	%l0
loop_455:
	sllx	%i6,	0x02,	%o2
loop_456:
	tneg	%xcc,	0x7
	tgu	%xcc,	0x2
	bcs,a,pt	%xcc,	loop_457
	movneg	%icc,	%g5,	%o4
	fmovrsgz	%i4,	%f10,	%f24
	sir	0x1D00
loop_457:
	fmovdne	%icc,	%f9,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1847
	fmovrsgz	%g7,	%f20,	%f0
	movleu	%xcc,	%g3,	%g2
	wr	%g0,	0x19,	%asi
	sta	%f14,	[%l7 + 0x38] %asi
	flush	%l7 + 0x6C
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x78] %asi,	%o3
	edge32l	%i1,	%o6,	%g1
	ta	%xcc,	0x4
	movcc	%icc,	%l3,	%i5
	addccc	%l4,	0x1E4E,	%i2
	tle	%xcc,	0x6
	orncc	%l6,	%g4,	%i7
	fmul8x16au	%f13,	%f3,	%f16
	tcc	%xcc,	0x6
	bcs,a	%icc,	loop_458
	subc	%l5,	0x0F40,	%l2
	subccc	%l1,	0x0AE6,	%o0
	nop
	setx	0x676D5DB26C244655,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f12
loop_458:
	nop
	set	0x2C, %o4
	sta	%f12,	[%l7 + %o4] 0x15
	umulcc	%o1,	0x0ED5,	%i0
	orcc	%o5,	%o7,	%i3
	fcmpgt32	%f8,	%f14,	%l0
	fbul	%fcc3,	loop_459
	orcc	%g6,	0x0BEF,	%i6
	nop
	setx	loop_460,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulscc	%g5,	0x12D0,	%o4
loop_459:
	umulcc	%i4,	%o2,	%g7
	edge32n	%g3,	%g2,	%i1
loop_460:
	fornot1s	%f14,	%f11,	%f10
	alignaddrl	%o3,	%g1,	%o6
	popc	%i5,	%l4
	taddcctv	%i2,	%l6,	%l3
	edge8	%g4,	%l5,	%l2
	edge32	%i7,	%l1,	%o1
	sub	%i0,	%o5,	%o7
	add	%l7,	0x44,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%l0
	xnor	%o0,	0x00D2,	%i6
	bne	%xcc,	loop_461
	mulscc	%g5,	%g6,	%i4
	orncc	%o4,	0x1D3E,	%g7
	sdiv	%o2,	0x0965,	%g2
loop_461:
	fbue,a	%fcc2,	loop_462
	edge32l	%g3,	%o3,	%i1
	stbar
	nop
	setx	loop_463,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_462:
	sethi	0x05B1,	%o6
	mova	%icc,	%i5,	%g1
	movrlez	%l4,	0x27C,	%i2
loop_463:
	tge	%xcc,	0x4
	movleu	%xcc,	%l6,	%g4
	fornot2s	%f22,	%f26,	%f18
	edge16n	%l3,	%l2,	%i7
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%l5
	fmuld8sux16	%f18,	%f31,	%f16
	tl	%xcc,	0x2
	nop
	fitos	%f1,	%f26
	fstoi	%f26,	%f10
	sra	%l1,	%o1,	%o5
	prefetch	[%l7 + 0x34],	 0x3
	fmovscs	%xcc,	%f5,	%f17
	mulx	%i0,	%o7,	%l0
	tcs	%icc,	0x7
	fexpand	%f29,	%f12
	ble	loop_464
	fmovspos	%icc,	%f10,	%f24
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%i2
loop_464:
	nop
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x1B] %asi,	%o0
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x34] %asi,	%g5
	umulcc	%i6,	0x0CE2,	%i4
	tcs	%icc,	0x6
	alignaddrl	%o4,	%g7,	%g6
	fnors	%f14,	%f18,	%f5
	movvs	%xcc,	%o2,	%g2
	xnorcc	%o3,	%g3,	%i1
	bvs,a	loop_465
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
	fmovscc	%icc,	%f31,	%f5
	edge8ln	%i5,	%o6,	%g1
loop_465:
	movcs	%xcc,	%l4,	%l6
loop_466:
	tvc	%icc,	0x0
	tle	%xcc,	0x2
	fmovsleu	%xcc,	%f4,	%f19
	fpadd16	%f20,	%f14,	%f6
	alignaddr	%g4,	%l3,	%l2
	sub	%i7,	0x1F99,	%i2
	movle	%icc,	%l1,	%o1
	fnot2s	%f8,	%f20
	taddcctv	%o5,	0x0009,	%l5
	bge,a,pn	%icc,	loop_467
	fandnot1	%f4,	%f8,	%f4
	orcc	%o7,	0x0B75,	%l0
	popc	0x07A0,	%i0
loop_467:
	movleu	%icc,	%o0,	%i3
	bpos,a,pt	%icc,	loop_468
	fsrc2	%f6,	%f18
	srl	%g5,	0x14,	%i4
	and	%o4,	%g7,	%i6
loop_468:
	sethi	0x0C47,	%o2
	addcc	%g2,	%g6,	%o3
	brgez	%i1,	loop_469
	bl,a	loop_470
	ldstub	[%l7 + 0x13],	%g3
	smulcc	%i5,	0x0AC0,	%o6
loop_469:
	st	%f7,	[%l7 + 0x0C]
loop_470:
	nop
	fitod	%f8,	%f12
	fdtos	%f12,	%f4
	wr	%g0,	0x04,	%asi
	stba	%l4,	[%l7 + 0x72] %asi
	tl	%xcc,	0x7
	nop
	setx loop_471, %l0, %l1
	jmpl %l1, %l6
	alignaddr	%g1,	%l3,	%g4
	movneg	%icc,	%l2,	%i7
	smul	%l1,	%i2,	%o5
loop_471:
	edge8l	%o1,	%o7,	%l5
	nop
	setx loop_472, %l0, %l1
	jmpl %l1, %i0
	fmovdge	%icc,	%f25,	%f6
	edge16	%l0,	%i3,	%o0
	fandnot2	%f8,	%f4,	%f8
loop_472:
	movrgz	%i4,	%o4,	%g7
	movgu	%icc,	%i6,	%o2
	movge	%icc,	%g2,	%g5
	tpos	%xcc,	0x7
	nop
	fitos	%f2,	%f20
	fstox	%f20,	%f12
	swap	[%l7 + 0x14],	%g6
	fblg,a	%fcc1,	loop_473
	movleu	%icc,	%o3,	%g3
	nop
	fitos	%f3,	%f22
	tvs	%icc,	0x0
loop_473:
	sdiv	%i5,	0x007F,	%o6
	brgz	%i1,	loop_474
	fbn,a	%fcc3,	loop_475
	andncc	%l6,	%l4,	%l3
	bleu,a,pn	%xcc,	loop_476
loop_474:
	fnot1s	%f29,	%f29
loop_475:
	bvs,pt	%xcc,	loop_477
	nop
	setx loop_478, %l0, %l1
	jmpl %l1, %g1
loop_476:
	edge8l	%g4,	%i7,	%l1
	fxors	%f8,	%f27,	%f25
loop_477:
	taddcc	%l2,	%i2,	%o1
loop_478:
	flush	%l7 + 0x30
	set	0x10, %o6
	stxa	%o5,	[%l7 + %o6] 0x27
	membar	#Sync
	taddcc	%l5,	0x1F9B,	%o7
	umulcc	%l0,	%i0,	%i3
	edge32	%i4,	%o4,	%o0
	edge8n	%g7,	%i6,	%o2
	prefetch	[%l7 + 0x30],	 0x3
	sir	0x0958
	tg	%icc,	0x4
	for	%f2,	%f6,	%f4
	fbg	%fcc3,	loop_479
	sllx	%g5,	0x13,	%g6
	andn	%o3,	0x1B94,	%g2
	movleu	%icc,	%g3,	%i5
loop_479:
	nop
	setx	0xE4012593,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f4
	fmul8x16	%f13,	%f10,	%f10
	fbl,a	%fcc1,	loop_480
	mulx	%i1,	%o6,	%l6
	ba	loop_481
	array8	%l4,	%l3,	%g1
loop_480:
	tg	%icc,	0x6
	fmovsleu	%xcc,	%f1,	%f2
loop_481:
	popc	%i7,	%g4
	bne	loop_482
	tcc	%icc,	0x0
	taddcc	%l2,	0x1C05,	%i2
	fbge	%fcc2,	loop_483
loop_482:
	fble	%fcc3,	loop_484
	fmovrdlez	%o1,	%f26,	%f26
	membar	0x7C
loop_483:
	fmovsa	%xcc,	%f8,	%f4
loop_484:
	nop
	set	0x40, %g7
	lduha	[%l7 + %g7] 0x15,	%o5
	fbu,a	%fcc0,	loop_485
	udivx	%l1,	0x015D,	%l5
	movrne	%l0,	0x106,	%o7
	movleu	%xcc,	%i0,	%i4
loop_485:
	srax	%o4,	%o0,	%i3
	edge16l	%i6,	%o2,	%g5
	st	%f26,	[%l7 + 0x1C]
	movneg	%icc,	%g6,	%g7
	xnor	%g2,	%o3,	%g3
	movneg	%xcc,	%i5,	%o6
	alignaddr	%l6,	%i1,	%l4
	movpos	%xcc,	%g1,	%i7
	tle	%xcc,	0x5
	umul	%l3,	%g4,	%i2
	set	0x0, %i7
	stxa	%l2,	[%g0 + %i7] 0x5f
	popc	%o1,	%l1
	bgu,a	loop_486
	tsubcctv	%l5,	%l0,	%o5
	fpsub32	%f24,	%f12,	%f28
	nop
	setx loop_487, %l0, %l1
	jmpl %l1, %o7
loop_486:
	xorcc	%i0,	0x062B,	%i4
	tgu	%xcc,	0x6
	edge8	%o4,	%o0,	%i6
loop_487:
	mulscc	%i3,	0x17B9,	%g5
	nop
	setx	loop_488,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrse	%g6,	%f8,	%f23
	and	%o2,	0x1119,	%g2
	xnorcc	%o3,	0x1CAC,	%g7
loop_488:
	array32	%g3,	%i5,	%l6
	fmovrde	%o6,	%f10,	%f26
	smulcc	%l4,	0x06BA,	%g1
	fbn,a	%fcc1,	loop_489
	orncc	%i1,	%l3,	%i7
	alignaddr	%i2,	%l2,	%o1
	fnot1	%f22,	%f28
loop_489:
	edge16	%l1,	%l5,	%l0
	movne	%xcc,	%g4,	%o5
	edge32l	%i0,	%o7,	%i4
	tn	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f12,	%f8
	fdtos	%f8,	%f14
	array8	%o0,	%i6,	%i3
	addccc	%o4,	0x019C,	%g5
	fbo	%fcc2,	loop_490
	sra	%g6,	%o2,	%o3
	orn	%g2,	%g3,	%g7
	movl	%icc,	%i5,	%o6
loop_490:
	nop
	fitos	%f12,	%f8
	fstoi	%f8,	%f9
	tvs	%icc,	0x6
	lduh	[%l7 + 0x42],	%l6
	nop
	set	0x14, %o2
	stw	%l4,	[%l7 + %o2]
	addcc	%g1,	%i1,	%l3
	fblg	%fcc2,	loop_491
	tvs	%xcc,	0x1
	fmovdg	%icc,	%f19,	%f19
	movvs	%xcc,	%i7,	%l2
loop_491:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o1,	%i2
	edge8l	%l5,	%l0,	%g4
	fmul8x16	%f18,	%f30,	%f4
	movne	%icc,	%l1,	%i0
	fba	%fcc1,	loop_492
	popc	0x0BDC,	%o7
	tle	%icc,	0x0
	tg	%xcc,	0x2
loop_492:
	te	%icc,	0x5
	edge32n	%i4,	%o0,	%o5
	tneg	%xcc,	0x7
	brz	%i3,	loop_493
	movle	%xcc,	%i6,	%g5
	tcc	%icc,	0x5
	set	0x14, %g4
	lda	[%l7 + %g4] 0x18,	%f5
loop_493:
	fmovdle	%icc,	%f27,	%f7
	add	%g6,	%o2,	%o4
	tneg	%xcc,	0x5
	brnz	%g2,	loop_494
	movrgez	%o3,	0x2AA,	%g7
	fmovdvs	%xcc,	%f15,	%f17
	andncc	%g3,	%o6,	%i5
loop_494:
	edge32l	%l4,	%g1,	%i1
	tvc	%xcc,	0x6
	movleu	%xcc,	%l3,	%i7
	nop
	set	0x3C, %o3
	stw	%l2,	[%l7 + %o3]
	edge16ln	%o1,	%l6,	%i2
	fble	%fcc3,	loop_495
	std	%f22,	[%l7 + 0x40]
	st	%f29,	[%l7 + 0x08]
	xor	%l0,	0x1CCF,	%g4
loop_495:
	movrgez	%l1,	%i0,	%l5
	wr	%g0,	0x23,	%asi
	stha	%i4,	[%l7 + 0x42] %asi
	membar	#Sync
	sllx	%o0,	0x16,	%o7
	ble	%icc,	loop_496
	movvc	%icc,	%i3,	%i6
	fmovsle	%icc,	%f3,	%f7
	sdivx	%g5,	0x1255,	%g6
loop_496:
	tn	%icc,	0x6
	sub	%o2,	0x0BB2,	%o4
	ldub	[%l7 + 0x3B],	%o5
	movcc	%xcc,	%g2,	%o3
	tcc	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	sta	%f1,	[%l7 + 0x68] %asi
	fmovdcc	%icc,	%f29,	%f1
	fsrc2	%f16,	%f22
	brgz	%g3,	loop_497
	tsubcctv	%g7,	0x0D9B,	%o6
	umul	%l4,	0x09FB,	%g1
	xor	%i5,	0x0E15,	%l3
loop_497:
	srax	%i7,	0x0E,	%i1
	subccc	%o1,	0x102C,	%l2
	fmovscc	%icc,	%f30,	%f2
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x0C] %asi,	%i2
	set	0x0C, %g3
	ldswa	[%l7 + %g3] 0x81,	%l0
	edge16l	%l6,	%l1,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f12,	%f9
	sir	0x1821
	fble,a	%fcc2,	loop_498
	sllx	%l5,	0x19,	%i4
	edge8n	%o0,	%i0,	%o7
	udivcc	%i3,	0x0C15,	%g5
loop_498:
	fmul8x16au	%f27,	%f7,	%f6
	udivcc	%g6,	0x186B,	%i6
	fmul8x16al	%f27,	%f26,	%f10
	bcc	%xcc,	loop_499
	edge32l	%o2,	%o4,	%o5
	tsubcctv	%o3,	0x034E,	%g3
	tpos	%icc,	0x4
loop_499:
	srlx	%g7,	%o6,	%l4
	ldx	[%l7 + 0x78],	%g1
	brlez	%g2,	loop_500
	pdist	%f0,	%f6,	%f20
	fmovrsgz	%l3,	%f14,	%f2
	brlez	%i7,	loop_501
loop_500:
	movcc	%xcc,	%i1,	%i5
	ldsb	[%l7 + 0x31],	%l2
	nop
	set	0x10, %o1
	std	%f28,	[%l7 + %o1]
loop_501:
	mova	%icc,	%o1,	%l0
	movleu	%icc,	%l6,	%i2
	srax	%l1,	0x0B,	%l5
	edge16n	%i4,	%o0,	%g4
	subc	%o7,	0x1B8C,	%i3
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3b8] %asi,	%g5 ripped by fixASI40.pl ripped by fixASI40.pl
	bcc	%xcc,	loop_502
	alignaddrl	%g6,	%i6,	%i0
	fmovdl	%icc,	%f3,	%f11
	ta	%xcc,	0x4
loop_502:
	ta	%icc,	0x7
	alignaddr	%o4,	%o5,	%o3
	nop
	setx	0xF058EF45,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	bvs,pt	%xcc,	loop_503
	alignaddrl	%o2,	%g3,	%g7
	edge8ln	%l4,	%o6,	%g2
	wr	%g0,	0x18,	%asi
	stha	%g1,	[%l7 + 0x48] %asi
loop_503:
	fbu	%fcc3,	loop_504
	st	%f13,	[%l7 + 0x78]
	fpack16	%f22,	%f30
	nop
	fitos	%f10,	%f5
	fstox	%f5,	%f14
	fxtos	%f14,	%f18
loop_504:
	movrgz	%i7,	%i1,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc3,	loop_505
	andcc	%i5,	0x1FF1,	%l2
	fxnors	%f16,	%f2,	%f6
	tgu	%xcc,	0x4
loop_505:
	tvs	%xcc,	0x3
	tneg	%xcc,	0x7
	smulcc	%l0,	0x0681,	%l6
	sll	%i2,	0x1B,	%l1
	sdivcc	%o1,	0x015F,	%l5
	tge	%xcc,	0x5
	fmovdleu	%icc,	%f16,	%f25
	movpos	%xcc,	%i4,	%o0
	sdivx	%g4,	0x1049,	%o7
	fbl,a	%fcc1,	loop_506
	movrlez	%i3,	%g6,	%i6
	set	0x40, %i5
	sta	%f11,	[%l7 + %i5] 0x80
loop_506:
	ld	[%l7 + 0x58],	%f14
	tpos	%icc,	0x4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x2
	movgu	%icc,	%o4,	%g5
	fors	%f20,	%f14,	%f23
	fcmpgt32	%f16,	%f8,	%o5
	bleu,a,pn	%icc,	loop_507
	tneg	%xcc,	0x3
	tn	%xcc,	0x0
	movcc	%xcc,	%o2,	%g3
loop_507:
	nop
	setx	0x3CEF615C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xFFDFC2A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f31,	%f26
	addcc	%g7,	0x1574,	%o3
	array32	%l4,	%o6,	%g1
	sll	%i7,	%g2,	%i1
	sdiv	%i5,	0x0EBB,	%l2
	bl	loop_508
	fmovdgu	%icc,	%f6,	%f22
	fmovsneg	%icc,	%f13,	%f1
	call	loop_509
loop_508:
	andncc	%l0,	%l3,	%i2
	movrgez	%l1,	%o1,	%l6
	movvc	%xcc,	%l5,	%i4
loop_509:
	edge16ln	%g4,	%o0,	%i3
	fcmpeq16	%f18,	%f26,	%o7
	edge16ln	%i6,	%i0,	%o4
	tle	%xcc,	0x2
	fxnors	%f2,	%f9,	%f18
	popc	%g5,	%g6
	fmovdge	%xcc,	%f3,	%f20
	edge8l	%o2,	%o5,	%g3
	and	%o3,	0x14C4,	%g7
	fmul8x16au	%f26,	%f3,	%f0
	edge32	%o6,	%g1,	%i7
	movle	%icc,	%l4,	%i1
	sdivcc	%g2,	0x1C87,	%l2
	bpos,pn	%icc,	loop_510
	tn	%icc,	0x2
	sra	%l0,	%i5,	%i2
	fmovdcs	%xcc,	%f17,	%f3
loop_510:
	movrne	%l3,	0x26D,	%l1
	taddcctv	%o1,	0x07E5,	%l5
	fbule	%fcc1,	loop_511
	tgu	%icc,	0x2
	array16	%i4,	%l6,	%o0
	edge32l	%g4,	%i3,	%o7
loop_511:
	nop
	setx	0xA6877BD1CE653DDB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x00C11CD0370F2EE3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f6,	%f12
	nop
	set	0x4C, %l6
	sth	%i0,	[%l7 + %l6]
	xnorcc	%o4,	0x02C2,	%i6
	fpsub32	%f20,	%f22,	%f20
	taddcc	%g6,	%o2,	%g5
	edge16	%g3,	%o3,	%o5
	edge32	%g7,	%o6,	%i7
	movcs	%icc,	%l4,	%g1
	addcc	%i1,	%g2,	%l2
	srax	%l0,	0x15,	%i2
	fnot1	%f12,	%f18
	tvs	%xcc,	0x2
	xor	%l3,	0x0D69,	%l1
	nop
	setx	0x507FC847,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	orncc	%o1,	0x1566,	%l5
	fnot1	%f12,	%f4
	membar	0x67
	movrne	%i4,	%i5,	%l6
	addccc	%o0,	%g4,	%i3
	movge	%icc,	%i0,	%o7
	edge16n	%o4,	%g6,	%o2
	te	%xcc,	0x7
	popc	%g5,	%g3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o3
	tcs	%xcc,	0x3
	fand	%f30,	%f6,	%f20
	tsubcctv	%o5,	%g7,	%o6
	fornot1s	%f8,	%f14,	%f25
	add	%i6,	0x1DE3,	%i7
	fbu	%fcc1,	loop_512
	ldsw	[%l7 + 0x2C],	%g1
	brgez,a	%l4,	loop_513
	movcc	%icc,	%g2,	%l2
loop_512:
	nop
	wr	%g0,	0x89,	%asi
	stba	%i1,	[%l7 + 0x43] %asi
loop_513:
	umulcc	%l0,	%l3,	%i2
	ldd	[%l7 + 0x18],	%f10
	xnor	%l1,	0x0613,	%l5
	movre	%i4,	0x0C4,	%o1
	sethi	0x1AD8,	%i5
	stbar
	bn,a	%icc,	loop_514
	ldsw	[%l7 + 0x38],	%o0
	edge8ln	%g4,	%l6,	%i0
	fzeros	%f14
loop_514:
	orncc	%o7,	0x186F,	%i3
	bvs,pt	%xcc,	loop_515
	edge32n	%g6,	%o2,	%o4
	fornot1	%f8,	%f16,	%f26
	set	0x31, %g5
	stba	%g5,	[%l7 + %g5] 0x2b
	membar	#Sync
loop_515:
	fnegd	%f6,	%f30
	bl	%xcc,	loop_516
	edge8n	%g3,	%o3,	%g7
	edge32l	%o5,	%i6,	%i7
	fmovscc	%icc,	%f22,	%f8
loop_516:
	fmovsa	%icc,	%f9,	%f31
	fones	%f17
	fmul8ulx16	%f16,	%f12,	%f30
	movl	%xcc,	%o6,	%g1
	movne	%xcc,	%g2,	%l4
	stw	%i1,	[%l7 + 0x50]
	swap	[%l7 + 0x30],	%l2
	tsubcc	%l3,	0x09EA,	%l0
	edge8n	%l1,	%i2,	%i4
	movle	%icc,	%l5,	%i5
	taddcc	%o1,	%g4,	%l6
	edge16ln	%i0,	%o7,	%o0
	ble,pt	%icc,	loop_517
	fornot2s	%f4,	%f20,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i3,	%o2,	%g6
loop_517:
	edge8n	%g5,	%g3,	%o3
	bleu	%xcc,	loop_518
	tne	%icc,	0x7
	tne	%icc,	0x0
	fpadd16s	%f14,	%f27,	%f0
loop_518:
	nop
	set	0x0C, %l0
	stb	%o4,	[%l7 + %l0]
	nop
	setx loop_519, %l0, %l1
	jmpl %l1, %g7
	fand	%f24,	%f12,	%f16
	fmovse	%xcc,	%f14,	%f28
	nop
	setx	0xD6C762D1305B6AAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_519:
	movrgz	%o5,	0x25E,	%i7
	edge32	%i6,	%o6,	%g1
	udivx	%l4,	0x0706,	%g2
	wr	%g0,	0x11,	%asi
	stba	%l2,	[%l7 + 0x2C] %asi
	fcmpne16	%f22,	%f2,	%l3
	tn	%xcc,	0x0
	smul	%l0,	%l1,	%i1
	xorcc	%i2,	0x0F89,	%l5
	movn	%xcc,	%i4,	%o1
	orncc	%g4,	%i5,	%l6
	srl	%o7,	%i0,	%i3
	array32	%o2,	%o0,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x08],	%g6
	brlez	%o3,	loop_520
	edge8	%g3,	%g7,	%o4
	bl	%icc,	loop_521
	fcmpeq32	%f24,	%f22,	%o5
loop_520:
	sllx	%i7,	0x16,	%i6
	fmovdpos	%xcc,	%f29,	%f5
loop_521:
	umulcc	%g1,	0x17E8,	%l4
	bcc	%icc,	loop_522
	addcc	%g2,	%o6,	%l2
	fmovse	%icc,	%f24,	%f17
	fbul	%fcc3,	loop_523
loop_522:
	sll	%l0,	%l3,	%l1
	srax	%i1,	%l5,	%i2
	fble,a	%fcc0,	loop_524
loop_523:
	sllx	%i4,	%o1,	%i5
	fmovrsne	%l6,	%f20,	%f22
	flush	%l7 + 0x78
loop_524:
	fmul8sux16	%f24,	%f22,	%f24
	fmovda	%xcc,	%f21,	%f29
	tn	%xcc,	0x4
	tl	%xcc,	0x4
	smulcc	%o7,	%g4,	%i3
	fbuge	%fcc3,	loop_525
	nop
	setx	0xA061DDFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x14
loop_525:
	srl	%o2,	%i0,	%g5
	fbuge,a	%fcc0,	loop_526
	addccc	%o0,	0x10FA,	%g6
	fmul8ulx16	%f22,	%f8,	%f28
	fcmpeq16	%f6,	%f24,	%o3
loop_526:
	sir	0x133C
	addccc	%g7,	0x08D5,	%g3
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o4,	%o5,	%i7
	bvc,a	loop_527
	addccc	%g1,	0x1617,	%l4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x89,	%g2,	%i6
loop_527:
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f8
	bcc	%xcc,	loop_528
	fble	%fcc0,	loop_529
	movrgz	%o6,	%l0,	%l3
	bl,a,pt	%xcc,	loop_530
loop_528:
	udivx	%l2,	0x059C,	%i1
loop_529:
	move	%icc,	%l1,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_530:
	sir	0x1E3E
	xnorcc	%i4,	0x120F,	%o1
	te	%xcc,	0x0
	nop
	setx	0xD905016A33D13CC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x2A85252BF0439F60,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f10,	%f24
	nop
	fitod	%f4,	%f10
	fdtos	%f10,	%f18
	ba,pn	%icc,	loop_531
	fabsd	%f22,	%f0
	fmovscc	%icc,	%f11,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_531:
	taddcctv	%i2,	0x01DA,	%l6
	brgez	%i5,	loop_532
	movge	%xcc,	%g4,	%i3
	fmovsvc	%icc,	%f25,	%f16
	sdiv	%o7,	0x1CEB,	%i0
loop_532:
	alignaddr	%o2,	%g5,	%o0
	fmul8sux16	%f26,	%f28,	%f30
	andcc	%o3,	0x0107,	%g6
	set	0x7C, %i6
	lduwa	[%l7 + %i6] 0x19,	%g7
	brnz,a	%o4,	loop_533
	fpsub32	%f30,	%f6,	%f26
	edge32l	%o5,	%i7,	%g1
	movcs	%icc,	%l4,	%g2
loop_533:
	nop
	setx loop_534, %l0, %l1
	jmpl %l1, %i6
	fmovsne	%xcc,	%f31,	%f8
	movneg	%xcc,	%g3,	%o6
	fmovdpos	%icc,	%f7,	%f17
loop_534:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	wr	%g0,	0xe2,	%asi
	stba	%l3,	[%l7 + 0x3A] %asi
	membar	#Sync
	set	0x3A, %i0
	stha	%l2,	[%l7 + %i0] 0x89
	andn	%l0,	0x0C49,	%i1
	ldsw	[%l7 + 0x14],	%l1
	fmovrdne	%l5,	%f18,	%f24
	be,pt	%icc,	loop_535
	addc	%i4,	%o1,	%l6
	umulcc	%i2,	%i5,	%g4
	addc	%o7,	%i0,	%o2
loop_535:
	ldsh	[%l7 + 0x6C],	%g5
	bcc,pn	%icc,	loop_536
	movpos	%icc,	%i3,	%o3
	stw	%o0,	[%l7 + 0x50]
	fmovsgu	%xcc,	%f22,	%f6
loop_536:
	movgu	%icc,	%g6,	%o4
	tcc	%xcc,	0x7
	nop
	setx loop_537, %l0, %l1
	jmpl %l1, %g7
	tcc	%icc,	0x5
	addccc	%o5,	0x0DE2,	%g1
	subc	%l4,	%i7,	%g2
loop_537:
	movcs	%icc,	%i6,	%g3
	nop
	setx	0x810FF6DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x9AAA4B63,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f9,	%f14
	bcs,pn	%icc,	loop_538
	tcs	%icc,	0x7
	nop
	setx	loop_539,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%l3,	%l2,	%l0
loop_538:
	ldsb	[%l7 + 0x20],	%i1
	fmovrdgz	%o6,	%f26,	%f2
loop_539:
	fsrc1	%f26,	%f8
	bcs,a,pt	%xcc,	loop_540
	fblg	%fcc2,	loop_541
	tcc	%icc,	0x2
	fmovrslz	%l1,	%f19,	%f20
loop_540:
	membar	0x43
loop_541:
	fmul8x16au	%f29,	%f1,	%f12
	srax	%l5,	%i4,	%l6
	sdivcc	%i2,	0x17CC,	%o1
	edge32ln	%i5,	%o7,	%i0
	add	%o2,	%g4,	%g5
	membar	0x18
	nop
	fitod	%f12,	%f26
	fdtoi	%f26,	%f31
	xnor	%o3,	0x1D2D,	%i3
	andn	%g6,	%o4,	%g7
	call	loop_542
	te	%xcc,	0x3
	fbug,a	%fcc1,	loop_543
	movcc	%xcc,	%o5,	%o0
loop_542:
	fnor	%f6,	%f22,	%f18
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x38] %asi,	%l4
loop_543:
	sllx	%g1,	0x0C,	%i7
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f0
	fxtod	%f0,	%f2
	nop
	setx	0xB1B9331C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x11976740,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f15,	%f12
	sdivcc	%i6,	0x13CA,	%g3
	fbg,a	%fcc2,	loop_544
	membar	0x67
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_544:
	movl	%icc,	%g2,	%l3
	tsubcc	%l0,	0x08FF,	%i1
	bcs,a,pt	%icc,	loop_545
	tvc	%icc,	0x3
	orn	%l2,	%l1,	%o6
	fmovsn	%icc,	%f30,	%f18
loop_545:
	mulx	%l5,	%i4,	%i2
	tgu	%xcc,	0x3
	orn	%l6,	%o1,	%o7
	orncc	%i0,	0x0755,	%o2
	and	%g4,	%i5,	%g5
	alignaddrl	%o3,	%g6,	%o4
	tgu	%xcc,	0x7
	sllx	%i3,	%o5,	%o0
	sdivcc	%l4,	0x0CB3,	%g1
	movleu	%icc,	%g7,	%i7
	fmovda	%xcc,	%f12,	%f28
	edge8l	%i6,	%g3,	%l3
	andcc	%g2,	0x18E0,	%i1
	movcc	%xcc,	%l2,	%l1
	bge,pn	%icc,	loop_546
	and	%o6,	%l5,	%i4
	fbne	%fcc1,	loop_547
	fsrc1	%f12,	%f26
loop_546:
	sth	%i2,	[%l7 + 0x60]
	addc	%l0,	0x1670,	%o1
loop_547:
	array32	%o7,	%l6,	%i0
	orncc	%o2,	0x0644,	%g4
	fandnot2s	%f5,	%f9,	%f29
	movvs	%icc,	%i5,	%o3
	movrgez	%g6,	0x2CB,	%o4
	umul	%g5,	0x1A59,	%i3
	wr	%g0,	0xe2,	%asi
	stxa	%o5,	[%l7 + 0x48] %asi
	membar	#Sync
	set	0x18, %i1
	lduwa	[%l7 + %i1] 0x18,	%o0
	fmovsvc	%icc,	%f21,	%f21
	fbu,a	%fcc0,	loop_548
	edge8n	%l4,	%g7,	%g1
	smulcc	%i6,	%g3,	%i7
	membar	0x0E
loop_548:
	mulx	%g2,	0x045B,	%l3
	taddcctv	%i1,	%l1,	%l2
	movge	%icc,	%l5,	%i4
	fsrc1s	%f27,	%f18
	set	0x12, %g1
	ldsha	[%l7 + %g1] 0x81,	%o6
	movrgez	%l0,	0x21A,	%o1
	fmovrdlez	%o7,	%f0,	%f18
	edge8	%l6,	%i0,	%i2
	mulx	%o2,	%i5,	%o3
	lduw	[%l7 + 0x64],	%g6
	bgu,a,pn	%icc,	loop_549
	orn	%g4,	%g5,	%o4
	fmovdne	%icc,	%f12,	%f15
	subc	%i3,	%o5,	%o0
loop_549:
	nop
	fitod	%f4,	%f4
	fmovrslz	%l4,	%f22,	%f23
	fbl,a	%fcc2,	loop_550
	movcc	%icc,	%g1,	%i6
	sllx	%g7,	0x04,	%g3
	movn	%xcc,	%g2,	%i7
loop_550:
	udiv	%i1,	0x0EDE,	%l3
	tgu	%icc,	0x6
	nop
	setx	0x487DF2BD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f30
	array8	%l2,	%l1,	%i4
	set	0x5E, %o0
	lduha	[%l7 + %o0] 0x19,	%o6
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f0
	fxtod	%f0,	%f14
	fcmpeq16	%f8,	%f14,	%l5
	fmovrdlz	%o1,	%f8,	%f20
	srl	%o7,	0x01,	%l0
	edge32n	%l6,	%i0,	%i2
	fmovrde	%i5,	%f2,	%f10
	ble	%xcc,	loop_551
	tsubcc	%o2,	0x0BC5,	%o3
	nop
	setx	0x0AA5241020579FD7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fbge	%fcc0,	loop_552
loop_551:
	lduw	[%l7 + 0x34],	%g4
	fzero	%f24
	fbn,a	%fcc1,	loop_553
loop_552:
	fmul8x16al	%f23,	%f8,	%f24
	addc	%g5,	%o4,	%i3
	fbo,a	%fcc0,	loop_554
loop_553:
	tpos	%xcc,	0x3
	set	0x58, %i2
	prefetcha	[%l7 + %i2] 0x89,	 0x2
loop_554:
	nop
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x38] %asi,	%f17
	movrlz	%g6,	%l4,	%o0
	sra	%i6,	%g7,	%g3
	xnorcc	%g2,	%i7,	%i1
	movrgez	%g1,	%l2,	%l3
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x1C] %asi,	%l1
	fbule,a	%fcc3,	loop_555
	movn	%icc,	%o6,	%l5
	and	%o1,	0x0DEF,	%i4
	fbl	%fcc2,	loop_556
loop_555:
	movn	%icc,	%l0,	%o7
	fsrc2s	%f28,	%f11
	xor	%i0,	%l6,	%i5
loop_556:
	be,a	%xcc,	loop_557
	brz,a	%i2,	loop_558
	fzeros	%f26
	fmovdvc	%xcc,	%f31,	%f25
loop_557:
	call	loop_559
loop_558:
	sllx	%o2,	0x03,	%g4
	tg	%xcc,	0x6
	bcc	%xcc,	loop_560
loop_559:
	bpos	%xcc,	loop_561
	fmul8x16	%f27,	%f18,	%f20
	ble	%xcc,	loop_562
loop_560:
	edge32ln	%g5,	%o3,	%o4
loop_561:
	add	%o5,	0x0A67,	%i3
	movne	%icc,	%g6,	%o0
loop_562:
	subccc	%i6,	0x12C5,	%g7
	fpmerge	%f1,	%f11,	%f14
	srax	%l4,	0x0C,	%g3
	srlx	%i7,	%i1,	%g1
	fmovdneg	%xcc,	%f26,	%f17
	te	%xcc,	0x6
	sethi	0x10DF,	%l2
	movvs	%icc,	%l3,	%g2
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x7F] %asi,	%o6
	fbue	%fcc3,	loop_563
	smul	%l1,	0x1680,	%l5
	stx	%o1,	[%l7 + 0x18]
	fmul8x16	%f0,	%f12,	%f30
loop_563:
	fmuld8ulx16	%f21,	%f12,	%f30
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x72] %asi,	%l0
	set	0x4A, %i4
	stha	%i4,	[%l7 + %i4] 0x04
	tn	%xcc,	0x0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x30] %asi,	%i0
	subc	%l6,	0x06C9,	%i5
	fmovsvc	%icc,	%f20,	%f30
	edge16l	%o7,	%i2,	%g4
	ble,a	%xcc,	loop_564
	popc	%o2,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f8,	%f28
loop_564:
	array32	%o3,	%o4,	%o5
	srl	%i3,	%o0,	%g6
	umul	%g7,	%i6,	%g3
	addc	%i7,	0x161E,	%i1
	prefetch	[%l7 + 0x5C],	 0x2
	fmovdle	%xcc,	%f9,	%f0
	movgu	%xcc,	%g1,	%l4
	ld	[%l7 + 0x48],	%f20
	ldub	[%l7 + 0x27],	%l3
	tgu	%icc,	0x2
	array32	%l2,	%g2,	%l1
	sra	%l5,	0x1B,	%o1
	taddcctv	%o6,	%l0,	%i4
	movleu	%xcc,	%i0,	%i5
	tne	%icc,	0x3
	fpadd32	%f2,	%f14,	%f10
	fblg	%fcc3,	loop_565
	move	%icc,	%o7,	%l6
	fand	%f16,	%f4,	%f6
	mulx	%g4,	0x052A,	%o2
loop_565:
	subccc	%g5,	0x1393,	%i2
	xnorcc	%o3,	0x0A3F,	%o4
	movvc	%icc,	%i3,	%o5
	fmovsvs	%xcc,	%f30,	%f14
	sra	%o0,	%g6,	%g7
	st	%f16,	[%l7 + 0x50]
	nop
	setx	loop_566,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%i6,	0x1EA5,	%i7
	edge8n	%i1,	%g3,	%g1
	addcc	%l4,	0x0B18,	%l2
loop_566:
	xnorcc	%l3,	%g2,	%l5
	edge16ln	%l1,	%o6,	%l0
	fbug,a	%fcc2,	loop_567
	fnot2	%f8,	%f10
	fbl	%fcc3,	loop_568
	flush	%l7 + 0x78
loop_567:
	umulcc	%i4,	0x00B3,	%o1
	bgu,pn	%icc,	loop_569
loop_568:
	fnor	%f12,	%f2,	%f0
	fmovsl	%icc,	%f10,	%f16
	fbge	%fcc2,	loop_570
loop_569:
	edge8	%i0,	%i5,	%l6
	udiv	%g4,	0x1673,	%o7
	lduh	[%l7 + 0x5A],	%o2
loop_570:
	edge16	%i2,	%o3,	%g5
	array32	%o4,	%i3,	%o5
	mulscc	%g6,	%o0,	%g7
	nop
	set	0x5E, %g6
	ldstub	[%l7 + %g6],	%i7
	movgu	%icc,	%i6,	%g3
	fmovrsne	%i1,	%f24,	%f30
	tl	%xcc,	0x7
	subccc	%g1,	%l4,	%l3
	alignaddr	%l2,	%g2,	%l1
	addc	%l5,	0x0A1F,	%l0
	fpsub32	%f16,	%f26,	%f24
	ble	%xcc,	loop_571
	udiv	%i4,	0x186D,	%o1
	srax	%i0,	0x10,	%i5
	set	0x44, %o5
	stba	%o6,	[%l7 + %o5] 0x80
loop_571:
	movgu	%xcc,	%g4,	%l6
	srax	%o2,	%i2,	%o7
	movvs	%xcc,	%g5,	%o4
	nop
	setx loop_572, %l0, %l1
	jmpl %l1, %o3
	alignaddr	%i3,	%o5,	%g6
	fmovdvs	%xcc,	%f26,	%f18
	fnot2	%f26,	%f14
loop_572:
	movgu	%icc,	%g7,	%i7
	fnot2s	%f3,	%f14
	fmuld8ulx16	%f3,	%f25,	%f10
	fmovsleu	%xcc,	%f28,	%f31
	xor	%i6,	0x1B61,	%g3
	move	%xcc,	%o0,	%g1
	or	%l4,	%l3,	%l2
	smul	%i1,	0x082C,	%l1
	add	%l5,	%g2,	%i4
	fpadd16s	%f28,	%f13,	%f7
	sub	%o1,	0x0FF8,	%i0
	nop
	fitos	%f14,	%f27
	fstoi	%f27,	%f10
	udiv	%l0,	0x14B8,	%o6
	xnor	%g4,	%l6,	%o2
	ldd	[%l7 + 0x78],	%i4
	add	%o7,	0x16C7,	%i2
	sir	0x01E6
	movrne	%o4,	%g5,	%i3
	brnz	%o3,	loop_573
	fxnor	%f24,	%f22,	%f12
	edge32l	%g6,	%o5,	%g7
	fbug	%fcc2,	loop_574
loop_573:
	udiv	%i6,	0x1A9E,	%i7
	fmul8x16au	%f18,	%f13,	%f10
	sra	%o0,	%g3,	%g1
loop_574:
	tg	%xcc,	0x7
	fbuge	%fcc2,	loop_575
	ldub	[%l7 + 0x4F],	%l4
	sra	%l3,	0x0A,	%i1
	movcs	%icc,	%l2,	%l1
loop_575:
	tle	%icc,	0x3
	fmovsvs	%xcc,	%f18,	%f30
	tg	%xcc,	0x7
	srl	%l5,	%i4,	%g2
	stb	%o1,	[%l7 + 0x6C]
	set	0x2D, %o7
	ldstuba	[%l7 + %o7] 0x89,	%i0
	fblg,a	%fcc1,	loop_576
	bpos,a,pt	%xcc,	loop_577
	array16	%l0,	%o6,	%l6
	bvs	loop_578
loop_576:
	addc	%g4,	%i5,	%o7
loop_577:
	fmovsvs	%icc,	%f22,	%f18
	edge16n	%o2,	%i2,	%o4
loop_578:
	fmul8x16al	%f3,	%f11,	%f6
	alignaddr	%g5,	%i3,	%o3
	fpmerge	%f4,	%f15,	%f8
	fmovrdne	%o5,	%f2,	%f2
	sethi	0x00FA,	%g7
	mulx	%i6,	0x07AB,	%i7
	tneg	%icc,	0x6
	fbue,a	%fcc3,	loop_579
	nop
	setx	0xB3CA5BA7B04FCC72,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fmovscc	%xcc,	%f28,	%f4
	tleu	%icc,	0x1
loop_579:
	alignaddr	%g6,	%g3,	%g1
	movleu	%xcc,	%l4,	%o0
	fpackfix	%f20,	%f19
	popc	%l3,	%i1
	alignaddrl	%l2,	%l1,	%l5
	bne,pt	%xcc,	loop_580
	sdivcc	%g2,	0x0111,	%i4
	tg	%xcc,	0x4
	tvs	%xcc,	0x1
loop_580:
	faligndata	%f18,	%f8,	%f30
	fcmpgt16	%f0,	%f8,	%i0
	fbul,a	%fcc2,	loop_581
	fexpand	%f26,	%f16
	set	0x31, %l4
	ldstuba	[%l7 + %l4] 0x80,	%l0
loop_581:
	movge	%xcc,	%o6,	%o1
	fnand	%f14,	%f4,	%f4
	fxnor	%f28,	%f12,	%f20
	stb	%g4,	[%l7 + 0x5F]
	xnorcc	%i5,	0x1C0E,	%l6
	smulcc	%o7,	0x0445,	%i2
	andncc	%o2,	%g5,	%o4
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%o3
	sdivx	%i3,	0x194A,	%g7
	fandnot1	%f24,	%f10,	%f2
	alignaddrl	%o5,	%i6,	%i7
	tge	%xcc,	0x4
	movne	%icc,	%g3,	%g6
	andcc	%l4,	0x1074,	%o0
	te	%xcc,	0x4
	ldsw	[%l7 + 0x5C],	%l3
	fbne,a	%fcc1,	loop_582
	subccc	%g1,	%l2,	%i1
	srl	%l5,	0x16,	%g2
	lduw	[%l7 + 0x60],	%l1
loop_582:
	nop
	setx	0x34DAB9E95041BE6A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	taddcc	%i0,	0x0F40,	%i4
	movrgz	%l0,	0x182,	%o1
	udivcc	%o6,	0x047B,	%i5
	fmovsgu	%icc,	%f7,	%f8
	fabss	%f2,	%f5
	movrlez	%l6,	0x31E,	%g4
	bvs,pt	%xcc,	loop_583
	fmovsne	%xcc,	%f30,	%f12
	tleu	%xcc,	0x4
	tne	%xcc,	0x2
loop_583:
	orcc	%i2,	%o7,	%g5
	edge32l	%o4,	%o3,	%o2
	call	loop_584
	udiv	%i3,	0x0E44,	%g7
	tcc	%xcc,	0x5
	movrgz	%i6,	0x102,	%i7
loop_584:
	orcc	%o5,	%g3,	%l4
	tcs	%icc,	0x6
	tpos	%xcc,	0x6
	fmovsvs	%icc,	%f3,	%f26
	orncc	%g6,	%l3,	%o0
	edge32n	%l2,	%g1,	%l5
	nop
	setx loop_585, %l0, %l1
	jmpl %l1, %g2
	addc	%l1,	%i1,	%i4
	fabsd	%f18,	%f16
	tle	%icc,	0x4
loop_585:
	smul	%i0,	%l0,	%o1
	set	0x2C, %l5
	stwa	%o6,	[%l7 + %l5] 0xea
	membar	#Sync
	tl	%icc,	0x4
	addc	%l6,	0x05BD,	%g4
	fsrc1	%f10,	%f20
	movrne	%i5,	0x21E,	%i2
	tge	%icc,	0x6
	movrgez	%g5,	0x1FA,	%o7
	addccc	%o3,	%o4,	%o2
	tvs	%xcc,	0x7
	fxnor	%f26,	%f28,	%f28
	wr	%g0,	0x0c,	%asi
	stba	%i3,	[%l7 + 0x67] %asi
	sethi	0x0E90,	%i6
	tvc	%xcc,	0x6
	brz	%i7,	loop_586
	movrlez	%g7,	%g3,	%l4
	add	%o5,	%l3,	%o0
	tvc	%icc,	0x5
loop_586:
	addc	%g6,	0x101E,	%l2
	ta	%xcc,	0x4
	te	%xcc,	0x2
	bleu,a	%icc,	loop_587
	fnor	%f18,	%f0,	%f26
	andncc	%l5,	%g2,	%g1
	fcmpgt16	%f0,	%f30,	%l1
loop_587:
	nop
	setx	0xE9C60669,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x2B0E175E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f16,	%f5
	andncc	%i1,	%i4,	%l0
	edge32n	%i0,	%o6,	%l6
	edge16l	%o1,	%i5,	%g4
	fmovrdgz	%i2,	%f2,	%f16
	taddcc	%o7,	%g5,	%o3
	edge8ln	%o2,	%i3,	%i6
	nop
	fitos	%f9,	%f21
	fstoi	%f21,	%f25
	tpos	%icc,	0x5
	addc	%o4,	0x10BD,	%g7
	orncc	%i7,	0x1E35,	%l4
	te	%xcc,	0x1
	fmul8x16au	%f17,	%f11,	%f26
	sllx	%g3,	0x1E,	%l3
	subccc	%o0,	0x1E20,	%g6
	sll	%l2,	%o5,	%l5
	set	0x50, %l3
	stwa	%g2,	[%l7 + %l3] 0x18
	fba,a	%fcc2,	loop_588
	srl	%g1,	%i1,	%i4
	set	0x7E, %g2
	stha	%l1,	[%l7 + %g2] 0x04
loop_588:
	fpadd16	%f24,	%f22,	%f26
	be,a	%icc,	loop_589
	fpadd32s	%f1,	%f24,	%f24
	xnorcc	%l0,	0x0A2F,	%o6
	edge8	%i0,	%l6,	%i5
loop_589:
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f24
	fxtod	%f24,	%f22
	movgu	%xcc,	%o1,	%g4
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f14
	fmovdl	%xcc,	%f2,	%f27
	xor	%o7,	%i2,	%g5
	andncc	%o3,	%o2,	%i3
	fsrc2s	%f7,	%f26
	fornot1s	%f2,	%f26,	%f31
	tvc	%xcc,	0x6
	fmovsa	%xcc,	%f5,	%f30
	and	%o4,	%g7,	%i7
	sdiv	%l4,	0x044D,	%g3
	prefetch	[%l7 + 0x2C],	 0x3
	andcc	%i6,	%o0,	%g6
	subcc	%l3,	%l2,	%o5
	brlez	%g2,	loop_590
	srax	%g1,	0x0B,	%i1
	nop
	fitod	%f2,	%f24
	fdtoi	%f24,	%f25
	edge32	%i4,	%l1,	%l5
loop_590:
	srax	%l0,	%o6,	%l6
	ldd	[%l7 + 0x28],	%i4
	movn	%icc,	%i0,	%o1
	fbg,a	%fcc3,	loop_591
	bleu,a	%xcc,	loop_592
	movle	%xcc,	%g4,	%o7
	taddcctv	%g5,	0x0149,	%o3
loop_591:
	tvc	%icc,	0x7
loop_592:
	xor	%o2,	%i2,	%i3
	set	0x2C, %l1
	ldsha	[%l7 + %l1] 0x80,	%o4
	nop
	fitos	%f0,	%f4
	fstod	%f4,	%f22
	sethi	0x0330,	%i7
	edge32n	%g7,	%g3,	%l4
	andcc	%i6,	0x1E1D,	%g6
	set	0x40, %o4
	stda	%f0,	[%l7 + %o4] 0x16
	membar	#Sync
	movgu	%xcc,	%o0,	%l3
	movneg	%xcc,	%l2,	%o5
	bneg,a	loop_593
	fbn	%fcc3,	loop_594
	fmovrdlez	%g1,	%f30,	%f0
	fcmpgt16	%f24,	%f6,	%g2
loop_593:
	orn	%i4,	%l1,	%l5
loop_594:
	taddcc	%l0,	0x11F8,	%i1
	tsubcctv	%o6,	%l6,	%i5
	array16	%o1,	%g4,	%o7
	orcc	%i0,	0x1448,	%o3
	sdiv	%g5,	0x00D5,	%o2
	subcc	%i2,	%o4,	%i7
	udivcc	%g7,	0x07C1,	%g3
	fbge	%fcc1,	loop_595
	edge8	%l4,	%i6,	%i3
	fcmpeq32	%f22,	%f28,	%g6
	addccc	%l3,	%o0,	%o5
loop_595:
	brlz	%l2,	loop_596
	edge16l	%g2,	%i4,	%l1
	srlx	%l5,	%g1,	%l0
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x36] %asi,	%i1
loop_596:
	movrgez	%l6,	%i5,	%o1
	fmovdl	%icc,	%f30,	%f2
	fpsub16s	%f15,	%f23,	%f17
	andncc	%g4,	%o6,	%i0
	bshuffle	%f14,	%f24,	%f18
	fnor	%f14,	%f0,	%f12
	alignaddrl	%o3,	%g5,	%o2
	movrlz	%i2,	0x0F4,	%o7
	movleu	%xcc,	%o4,	%i7
	movl	%icc,	%g7,	%g3
	edge32ln	%i6,	%i3,	%g6
	fmovscs	%xcc,	%f31,	%f20
	alignaddrl	%l4,	%o0,	%o5
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0xf1
	membar	#Sync
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x3C],	%l3
	fba	%fcc1,	loop_597
	smulcc	%l2,	0x095B,	%i4
	array32	%g2,	%l5,	%l1
	fmovsvs	%icc,	%f3,	%f24
loop_597:
	bge,pt	%xcc,	loop_598
	edge8n	%l0,	%i1,	%l6
	srl	%g1,	%o1,	%i5
	nop
	setx	0x8078050C,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
loop_598:
	andncc	%o6,	%i0,	%o3
	fbl	%fcc3,	loop_599
	sra	%g5,	0x0C,	%g4
	array16	%i2,	%o2,	%o7
	bpos,pt	%xcc,	loop_600
loop_599:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o4,	%g7,	%g3
	tvs	%xcc,	0x3
loop_600:
	nop
	set	0x74, %l2
	ldstuba	[%l7 + %l2] 0x81,	%i6
	addccc	%i3,	0x1F51,	%g6
	fsrc1	%f26,	%f2
	edge16n	%i7,	%l4,	%o5
	ld	[%l7 + 0x78],	%f23
	bcc,a,pn	%xcc,	loop_601
	fbne,a	%fcc2,	loop_602
	tl	%xcc,	0x0
	tn	%xcc,	0x2
loop_601:
	nop
	fitod	%f2,	%f26
	fdtoi	%f26,	%f7
loop_602:
	move	%icc,	%l3,	%l2
	edge8ln	%i4,	%g2,	%l5
	fmovdne	%icc,	%f1,	%f31
	wr	%g0,	0x89,	%asi
	stwa	%o0,	[%l7 + 0x60] %asi
	nop
	setx	loop_603,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fornot1	%f20,	%f2,	%f8
	xorcc	%l0,	%i1,	%l6
	fbuge,a	%fcc1,	loop_604
loop_603:
	edge16	%g1,	%l1,	%i5
	movvs	%icc,	%o1,	%o6
	fble,a	%fcc3,	loop_605
loop_604:
	edge16ln	%i0,	%g5,	%g4
	fbuge	%fcc1,	loop_606
	fmovse	%xcc,	%f1,	%f23
loop_605:
	fblg	%fcc2,	loop_607
	andn	%i2,	0x0D3E,	%o2
loop_606:
	sdiv	%o7,	0x0701,	%o3
	stb	%g7,	[%l7 + 0x27]
loop_607:
	ldstub	[%l7 + 0x0F],	%o4
	fmuld8sux16	%f26,	%f1,	%f22
	edge16ln	%i6,	%i3,	%g3
	tn	%xcc,	0x1
	movvc	%icc,	%i7,	%l4
	bgu,a,pt	%icc,	loop_608
	nop
	fitod	%f30,	%f28
	popc	0x0959,	%o5
	fcmpne32	%f0,	%f6,	%l3
loop_608:
	bn	%xcc,	loop_609
	fcmpne16	%f2,	%f10,	%l2
	edge32n	%g6,	%g2,	%i4
	nop
	fitos	%f0,	%f6
	fstox	%f6,	%f14
loop_609:
	bcc,a	loop_610
	fbo,a	%fcc2,	loop_611
	edge32n	%o0,	%l5,	%l0
	fbg,a	%fcc1,	loop_612
loop_610:
	tpos	%xcc,	0x3
loop_611:
	taddcctv	%l6,	%i1,	%l1
	umulcc	%g1,	0x143B,	%i5
loop_612:
	mulscc	%o1,	%o6,	%g5
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,a,pt	%icc,	loop_613
	tleu	%xcc,	0x1
	addc	%i0,	0x0D02,	%g4
	tl	%icc,	0x5
loop_613:
	edge32n	%i2,	%o2,	%o7
	movneg	%xcc,	%o3,	%o4
	movrlez	%g7,	%i3,	%i6
	movrlez	%i7,	%l4,	%o5
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x59] %asi,	%l3
	bneg,a,pt	%xcc,	loop_614
	tle	%xcc,	0x4
	movrlez	%l2,	%g6,	%g3
	set	0x10, %g7
	ldda	[%l7 + %g7] 0x11,	%i4
loop_614:
	bneg,pn	%xcc,	loop_615
	stx	%g2,	[%l7 + 0x58]
	fnand	%f8,	%f4,	%f18
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x4E] %asi,	%l5
loop_615:
	xorcc	%l0,	%o0,	%i1
	fba	%fcc2,	loop_616
	tsubcctv	%l6,	0x1D34,	%g1
	taddcctv	%l1,	0x038F,	%i5
	set	0x20, %o2
	ldda	[%l7 + %o2] 0x2b,	%o0
loop_616:
	movrne	%o6,	%g5,	%g4
	fone	%f30
	tsubcc	%i2,	0x12AE,	%o2
	edge8	%i0,	%o7,	%o4
	fbg,a	%fcc0,	loop_617
	sdivcc	%o3,	0x195B,	%g7
	fmovrsgez	%i6,	%f10,	%f31
	movgu	%icc,	%i3,	%i7
loop_617:
	udiv	%o5,	0x1EB7,	%l4
	subccc	%l2,	0x1A96,	%l3
	andcc	%g6,	0x079E,	%g3
	umul	%g2,	%i4,	%l5
	fmovdpos	%xcc,	%f18,	%f24
	set	0x09, %o3
	lduba	[%l7 + %o3] 0x10,	%o0
	bge	%icc,	loop_618
	sdivx	%i1,	0x18AC,	%l6
	movrne	%l0,	0x3CD,	%l1
	xnorcc	%g1,	%i5,	%o6
loop_618:
	movrgez	%o1,	%g4,	%i2
	addccc	%g5,	%i0,	%o2
	srl	%o4,	%o7,	%o3
	tne	%icc,	0x2
	brlz	%g7,	loop_619
	udivcc	%i3,	0x0265,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i7,	%l4,	%l2
loop_619:
	srax	%l3,	0x03,	%o5
	xorcc	%g3,	%g6,	%i4
	sub	%l5,	%o0,	%g2
	fmovrslz	%l6,	%f19,	%f21
	sra	%l0,	0x1B,	%l1
	movrgz	%g1,	0x10B,	%i1
	srlx	%o6,	0x1A,	%o1
	movrne	%i5,	%g4,	%g5
	tgu	%xcc,	0x4
	movl	%xcc,	%i0,	%o2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x0C] %asi,	%f1
	udivx	%i2,	0x1315,	%o4
	tgu	%xcc,	0x0
	ta	%xcc,	0x7
	edge32l	%o7,	%g7,	%i3
	movleu	%icc,	%i6,	%i7
	alignaddrl	%l4,	%l2,	%l3
	fbue	%fcc2,	loop_620
	alignaddrl	%o5,	%g3,	%g6
	edge8	%o3,	%l5,	%o0
	call	loop_621
loop_620:
	fnands	%f5,	%f23,	%f2
	faligndata	%f20,	%f16,	%f14
	movne	%icc,	%i4,	%g2
loop_621:
	bg,a	%xcc,	loop_622
	srlx	%l6,	%l0,	%l1
	movvc	%xcc,	%i1,	%g1
	andcc	%o6,	0x1870,	%i5
loop_622:
	bcs,pt	%xcc,	loop_623
	sra	%o1,	%g4,	%i0
	bvc,a,pn	%icc,	loop_624
	fmovsneg	%icc,	%f21,	%f25
loop_623:
	tcc	%xcc,	0x2
	fmovdl	%icc,	%f4,	%f23
loop_624:
	nop
	setx	0x5075512C,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	tgu	%xcc,	0x3
	stb	%o2,	[%l7 + 0x16]
	stw	%g5,	[%l7 + 0x0C]
	fbne	%fcc0,	loop_625
	tcs	%icc,	0x6
	srl	%i2,	0x18,	%o4
	edge16	%o7,	%i3,	%i6
loop_625:
	array8	%g7,	%l4,	%l2
	fbo,a	%fcc0,	loop_626
	fbu	%fcc0,	loop_627
	orn	%i7,	%o5,	%g3
	fmovde	%xcc,	%f10,	%f18
loop_626:
	nop
	set	0x78, %g4
	ldxa	[%l7 + %g4] 0x11,	%g6
loop_627:
	andncc	%l3,	%o3,	%l5
	srax	%o0,	%g2,	%l6
	tleu	%icc,	0x5
	fbue,a	%fcc2,	loop_628
	movge	%icc,	%l0,	%i4
	te	%icc,	0x5
	be,pn	%icc,	loop_629
loop_628:
	movleu	%icc,	%i1,	%g1
	fmovdvc	%icc,	%f0,	%f1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] %asi,	%l1,	%i5
loop_629:
	fpsub16s	%f26,	%f11,	%f2
	ldsw	[%l7 + 0x20],	%o1
	set	0x1C, %o1
	stwa	%g4,	[%l7 + %o1] 0x0c
	lduh	[%l7 + 0x64],	%o6
	movpos	%xcc,	%i0,	%g5
	alignaddrl	%o2,	%i2,	%o7
	brgez	%o4,	loop_630
	movg	%xcc,	%i6,	%g7
	edge32ln	%i3,	%l2,	%l4
	srlx	%o5,	%g3,	%g6
loop_630:
	nop
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l3
	te	%xcc,	0x1
	tsubcc	%o3,	0x06A7,	%l5
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movre	%i7,	0x0EE,	%o0
	ble,a,pn	%icc,	loop_631
	bne	loop_632
	fmovsa	%xcc,	%f17,	%f7
	fmovrdgez	%g2,	%f2,	%f6
loop_631:
	xor	%l6,	0x10F9,	%l0
loop_632:
	stw	%i1,	[%l7 + 0x3C]
	fmovdg	%xcc,	%f20,	%f26
	stx	%g1,	[%l7 + 0x20]
	nop
	set	0x66, %i5
	lduh	[%l7 + %i5],	%i4
	orcc	%l1,	%o1,	%g4
	sll	%o6,	0x0C,	%i0
	fbuge	%fcc1,	loop_633
	fpackfix	%f24,	%f6
	ba,a	%xcc,	loop_634
	srlx	%i5,	%o2,	%g5
loop_633:
	srl	%i2,	%o4,	%i6
	xorcc	%o7,	%g7,	%l2
loop_634:
	andcc	%l4,	%o5,	%g3
	movn	%icc,	%i3,	%l3
	ldsw	[%l7 + 0x60],	%o3
	edge32n	%g6,	%l5,	%i7
	fnegd	%f4,	%f4
	umulcc	%o0,	0x1D98,	%l6
	nop
	set	0x40, %g3
	stw	%g2,	[%l7 + %g3]
	orn	%i1,	0x0BE7,	%l0
	taddcctv	%g1,	0x0AEC,	%l1
	fpack16	%f24,	%f12
	tne	%xcc,	0x5
	set	0x3A, %l6
	ldsha	[%l7 + %l6] 0x11,	%o1
	move	%xcc,	%i4,	%o6
	fpsub16s	%f14,	%f12,	%f19
	tl	%icc,	0x4
	movgu	%icc,	%i0,	%i5
	fblg	%fcc1,	loop_635
	srlx	%o2,	%g4,	%i2
	call	loop_636
	orn	%g5,	0x0DF6,	%o4
loop_635:
	fbe,a	%fcc1,	loop_637
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_636:
	andn	%o7,	0x145F,	%i6
	addcc	%l2,	%l4,	%o5
loop_637:
	xor	%g7,	0x02D2,	%g3
	srlx	%i3,	0x01,	%o3
	bvs,a,pt	%xcc,	loop_638
	ldsh	[%l7 + 0x0E],	%l3
	edge32l	%g6,	%i7,	%o0
	fble,a	%fcc3,	loop_639
loop_638:
	edge8l	%l6,	%g2,	%l5
	lduw	[%l7 + 0x14],	%i1
	tsubcc	%l0,	%l1,	%g1
loop_639:
	brgez,a	%o1,	loop_640
	movrlez	%o6,	0x171,	%i4
	nop
	fitod	%f0,	%f10
	fdtos	%f10,	%f18
	movvs	%icc,	%i5,	%i0
loop_640:
	edge32	%o2,	%i2,	%g5
	fcmpne16	%f14,	%f12,	%o4
	mova	%xcc,	%g4,	%o7
	fmovrde	%l2,	%f8,	%f6
	sth	%l4,	[%l7 + 0x6E]
	brgez	%o5,	loop_641
	addc	%g7,	0x119F,	%g3
	and	%i6,	%i3,	%l3
	xnor	%g6,	0x17DE,	%o3
loop_641:
	orncc	%o0,	0x1D49,	%l6
	popc	0x17B9,	%g2
	tn	%icc,	0x3
	andncc	%l5,	%i7,	%i1
	movn	%icc,	%l1,	%g1
	bne,pn	%xcc,	loop_642
	te	%xcc,	0x2
	edge32ln	%l0,	%o1,	%i4
	edge8n	%o6,	%i0,	%o2
loop_642:
	ta	%icc,	0x6
	fmovsl	%icc,	%f31,	%f8
	fpsub16	%f14,	%f16,	%f0
	udiv	%i2,	0x135D,	%i5
	udivx	%g5,	0x1202,	%o4
	set	0x24, %g5
	lduha	[%l7 + %g5] 0x11,	%g4
	set	0x1C, %l0
	sta	%f17,	[%l7 + %l0] 0x10
	sth	%o7,	[%l7 + 0x5E]
	array16	%l2,	%o5,	%g7
	nop
	setx	0x4058296C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	fsqrts	%f20,	%f8
	alignaddr	%g3,	%i6,	%l4
	array8	%l3,	%g6,	%i3
	edge16ln	%o0,	%o3,	%g2
	movleu	%xcc,	%l6,	%l5
	edge8	%i1,	%l1,	%g1
	edge16l	%i7,	%l0,	%i4
	fmovrdlz	%o1,	%f20,	%f0
	array8	%o6,	%o2,	%i2
	fnot1s	%f23,	%f23
	array8	%i5,	%g5,	%o4
	subc	%i0,	0x0953,	%g4
	fmovdpos	%icc,	%f3,	%f8
	set	0x48, %i6
	sta	%f1,	[%l7 + %i6] 0x0c
	brgz,a	%l2,	loop_643
	tn	%icc,	0x0
	fmovse	%icc,	%f7,	%f9
	and	%o7,	0x06B7,	%g7
loop_643:
	sdivcc	%o5,	0x0E13,	%i6
	fbule,a	%fcc2,	loop_644
	edge8	%g3,	%l3,	%l4
	nop
	setx	0x3546262AA060E624,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	tl	%icc,	0x7
loop_644:
	fmovse	%xcc,	%f23,	%f31
	sra	%g6,	%i3,	%o0
	bne	%icc,	loop_645
	faligndata	%f30,	%f10,	%f0
	movrlez	%g2,	0x151,	%o3
	movcs	%icc,	%l5,	%l6
loop_645:
	subccc	%l1,	%g1,	%i7
	sll	%l0,	%i1,	%i4
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf1
	membar	#Sync
	edge32n	%o1,	%o6,	%i2
	tn	%icc,	0x1
	fcmpgt32	%f2,	%f0,	%i5
	nop
	setx	0x3F422CBD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x1952BBB8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f16,	%f3
	movn	%icc,	%g5,	%o2
	swap	[%l7 + 0x24],	%i0
	tvs	%icc,	0x0
	bneg,pt	%xcc,	loop_646
	bpos	loop_647
	tcc	%xcc,	0x6
	edge16l	%g4,	%l2,	%o7
loop_646:
	popc	0x0C1A,	%o4
loop_647:
	be,pn	%icc,	loop_648
	sllx	%o5,	%g7,	%g3
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1c0] %asi,	%i6 ripped by fixASI40.pl ripped by fixASI40.pl
loop_648:
	fmovsvc	%xcc,	%f15,	%f17
	addc	%l3,	0x131F,	%l4
	movrgez	%i3,	%o0,	%g6
	movrgez	%g2,	0x061,	%l5
	fcmpeq32	%f8,	%f24,	%o3
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x34] %asi,	%l6
	te	%icc,	0x1
	orcc	%g1,	0x19C1,	%l1
	tvc	%icc,	0x2
	smulcc	%i7,	0x1150,	%i1
	addccc	%l0,	0x1A5F,	%o1
	bg,a,pt	%icc,	loop_649
	fbne,a	%fcc3,	loop_650
	movrgz	%o6,	%i4,	%i2
	srax	%i5,	0x0E,	%g5
loop_649:
	edge32n	%i0,	%g4,	%o2
loop_650:
	fbule,a	%fcc2,	loop_651
	ldsw	[%l7 + 0x24],	%o7
	tcs	%icc,	0x4
	lduw	[%l7 + 0x20],	%l2
loop_651:
	popc	%o4,	%o5
	sth	%g7,	[%l7 + 0x28]
	sethi	0x054A,	%g3
	tpos	%icc,	0x4
	edge8ln	%l3,	%i6,	%i3
	fzero	%f30
	udivx	%o0,	0x173F,	%l4
	pdist	%f30,	%f28,	%f18
	fbule,a	%fcc0,	loop_652
	movrlz	%g2,	0x287,	%l5
	fmovdge	%icc,	%f17,	%f26
	stw	%g6,	[%l7 + 0x3C]
loop_652:
	fbul	%fcc3,	loop_653
	movgu	%xcc,	%l6,	%g1
	edge16l	%l1,	%o3,	%i7
	movrgz	%l0,	0x076,	%o1
loop_653:
	nop
	set	0x52, %i3
	ldsha	[%l7 + %i3] 0x81,	%o6
	tn	%xcc,	0x0
	umul	%i1,	0x104D,	%i2
	movge	%xcc,	%i4,	%i5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g5,	%g4
	bgu	%xcc,	loop_654
	srlx	%i0,	%o2,	%l2
	fsrc2	%f30,	%f30
	nop
	setx	0x9AAD30084F9BB651,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x6E066DB4B88862F6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f12,	%f22
loop_654:
	movleu	%xcc,	%o4,	%o5
	edge32n	%g7,	%o7,	%g3
	xnor	%i6,	%i3,	%o0
	tvc	%xcc,	0x5
	sub	%l4,	0x0E80,	%g2
	brnz	%l5,	loop_655
	brz,a	%l3,	loop_656
	fpadd16	%f22,	%f24,	%f0
	fpsub32	%f4,	%f10,	%f2
loop_655:
	tvs	%icc,	0x4
loop_656:
	movrlz	%l6,	0x298,	%g6
	fbge	%fcc2,	loop_657
	andncc	%l1,	%o3,	%i7
	fnot1s	%f19,	%f31
	tne	%xcc,	0x6
loop_657:
	umul	%g1,	%o1,	%l0
	ld	[%l7 + 0x64],	%f1
	movrlz	%o6,	%i2,	%i1
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x89,	%f16
	fandnot1s	%f3,	%f21,	%f22
	ldsh	[%l7 + 0x10],	%i4
	sethi	0x10AF,	%g5
	subccc	%g4,	0x1F23,	%i5
	movgu	%xcc,	%o2,	%i0
	nop
	fitod	%f2,	%f30
	fdtoi	%f30,	%f10
	nop
	setx	0xA86B074B8D9D66A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xE1E62178944A0AC6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f6,	%f16
	sub	%l2,	0x103C,	%o4
	umulcc	%g7,	0x031F,	%o5
	fors	%f4,	%f11,	%f30
	tvs	%icc,	0x5
	movgu	%xcc,	%g3,	%i6
	fmovsneg	%xcc,	%f21,	%f7
	tneg	%xcc,	0x1
	movgu	%icc,	%o7,	%i3
	edge8ln	%o0,	%l4,	%l5
	sdivx	%l3,	0x1BA1,	%g2
	fpsub32	%f16,	%f26,	%f24
	flush	%l7 + 0x50
	alignaddrl	%l6,	%l1,	%g6
	smulcc	%o3,	%g1,	%o1
	fsrc1	%f28,	%f8
	nop
	setx	0x72294486,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xFB01A3D0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f23,	%f30
	sdivcc	%l0,	0x0CC5,	%i7
	movvc	%icc,	%o6,	%i2
	movne	%xcc,	%i1,	%i4
	nop
	setx	loop_658,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%xcc,	%g5,	%g4
	fmul8x16au	%f27,	%f16,	%f30
	smul	%o2,	0x1696,	%i5
loop_658:
	nop
	setx	0x651AE541,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x23C03A81,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f11,	%f31
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
	movl	%xcc,	%o4,	%l2
	fcmpne16	%f10,	%f22,	%o5
	bge,pn	%icc,	loop_659
	mova	%xcc,	%g7,	%g3
	bshuffle	%f28,	%f22,	%f6
	ta	%icc,	0x6
loop_659:
	tcc	%xcc,	0x5
	bcc,a	%xcc,	loop_660
	fmovrsne	%i6,	%f1,	%f11
	movrne	%i3,	%o7,	%l4
	fmovdleu	%icc,	%f23,	%f25
loop_660:
	edge32n	%o0,	%l3,	%l5
	stbar
	add	%l6,	%g2,	%l1
	movleu	%xcc,	%o3,	%g6
	movrlez	%o1,	%l0,	%i7
	edge32ln	%g1,	%i2,	%i1
	fbug	%fcc1,	loop_661
	fmovrdlz	%o6,	%f4,	%f18
	faligndata	%f10,	%f12,	%f14
	edge16n	%i4,	%g4,	%o2
loop_661:
	nop
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	wr	%g0,	0xea,	%asi
	stwa	%i5,	[%l7 + 0x5C] %asi
	membar	#Sync
	fmovdvc	%icc,	%f27,	%f23
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x18] %asi,	%f4
	fmovscs	%icc,	%f18,	%f31
	move	%icc,	%i0,	%g5
	fbne,a	%fcc3,	loop_662
	fpmerge	%f15,	%f1,	%f14
	movg	%xcc,	%l2,	%o5
	xnorcc	%g7,	0x16AE,	%o4
loop_662:
	nop
	setx	0x6B68693D8C039D13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f30
	ldsb	[%l7 + 0x1A],	%g3
	tgu	%xcc,	0x0
	movne	%icc,	%i3,	%o7
	fand	%f24,	%f14,	%f28
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x68] %asi,	%l4
	flush	%l7 + 0x7C
	stb	%i6,	[%l7 + 0x08]
	addccc	%l3,	0x1343,	%o0
	set	0x20, %g1
	ldstuba	[%l7 + %g1] 0x11,	%l6
	tneg	%xcc,	0x1
	movl	%xcc,	%l5,	%g2
	tn	%xcc,	0x0
	sll	%l1,	0x01,	%g6
	array8	%o1,	%l0,	%o3
	udiv	%i7,	0x1FF7,	%i2
	alignaddrl	%i1,	%g1,	%i4
	tgu	%xcc,	0x1
	tcs	%xcc,	0x1
	bcc,a	%icc,	loop_663
	ldub	[%l7 + 0x77],	%g4
	tge	%icc,	0x3
	fcmpeq16	%f16,	%f20,	%o6
loop_663:
	edge32n	%o2,	%i5,	%i0
	movcc	%icc,	%g5,	%o5
	sra	%l2,	%o4,	%g7
	mulx	%i3,	0x192E,	%g3
	ba,a,pt	%xcc,	loop_664
	tcc	%xcc,	0x7
	tgu	%icc,	0x0
	umulcc	%o7,	0x04A9,	%l4
loop_664:
	tge	%icc,	0x1
	fbge,a	%fcc1,	loop_665
	fmovscs	%xcc,	%f26,	%f19
	movcs	%icc,	%i6,	%l3
	movgu	%icc,	%l6,	%l5
loop_665:
	edge16l	%g2,	%o0,	%g6
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l1,	%l0
	sra	%o1,	%o3,	%i7
	andncc	%i2,	%g1,	%i4
	subc	%i1,	%o6,	%g4
	movre	%o2,	0x3AD,	%i0
	fmovsneg	%icc,	%f18,	%f24
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x04,	%i5
	nop
	setx	0x94AA817E605FB7D1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	taddcc	%o5,	%g5,	%l2
	bge,a,pn	%icc,	loop_666
	taddcc	%g7,	0x0E55,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc0,	loop_667
loop_666:
	ldsh	[%l7 + 0x14],	%i3
	fmovdvs	%xcc,	%f3,	%f23
	bshuffle	%f4,	%f18,	%f18
loop_667:
	fpmerge	%f12,	%f8,	%f2
	movgu	%icc,	%g3,	%l4
	udivcc	%o7,	0x101F,	%l3
	tvc	%xcc,	0x4
	fmovdle	%icc,	%f28,	%f22
	fxnors	%f31,	%f12,	%f29
	fmovsge	%icc,	%f11,	%f10
	edge32	%i6,	%l6,	%l5
	tpos	%icc,	0x0
	edge16ln	%g2,	%o0,	%l1
	bcc,a	%xcc,	loop_668
	xnor	%g6,	%l0,	%o1
	nop
	setx	0x7272B8229F44AEDC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xE6AC8B0B64813CE7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f26,	%f18
	stw	%o3,	[%l7 + 0x6C]
loop_668:
	ba,pn	%icc,	loop_669
	std	%f2,	[%l7 + 0x78]
	fbo,a	%fcc1,	loop_670
	movne	%xcc,	%i2,	%g1
loop_669:
	orncc	%i4,	%i7,	%o6
	andcc	%i1,	%g4,	%i0
loop_670:
	fmovrdlz	%o2,	%f26,	%f0
	fbg,a	%fcc0,	loop_671
	bcs	loop_672
	edge8l	%o5,	%i5,	%l2
	nop
	setx loop_673, %l0, %l1
	jmpl %l1, %g5
loop_671:
	tcs	%xcc,	0x5
loop_672:
	array32	%o4,	%i3,	%g3
	sdiv	%l4,	0x14EB,	%g7
loop_673:
	bl,a	loop_674
	edge16l	%o7,	%l3,	%l6
	edge16ln	%i6,	%g2,	%o0
	sdivcc	%l5,	0x0EF3,	%l1
loop_674:
	nop
	fitod	%f12,	%f2
	fdtos	%f2,	%f13
	nop
	setx	loop_675,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsge	%xcc,	%f5,	%f11
	and	%g6,	%o1,	%l0
	fnor	%f16,	%f16,	%f16
loop_675:
	array8	%i2,	%o3,	%i4
	movge	%xcc,	%g1,	%i7
	movvs	%xcc,	%i1,	%o6
	andcc	%g4,	0x0A35,	%i0
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x2D] %asi,	%o5
	mulx	%o2,	%i5,	%l2
	nop
	fitod	%f19,	%f12
	stx	%g5,	[%l7 + 0x50]
	sll	%i3,	%o4,	%l4
	array8	%g7,	%o7,	%l3
	tl	%xcc,	0x1
	nop
	setx	0xBEEC64F110477076,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	tn	%xcc,	0x0
	fcmpne32	%f2,	%f4,	%g3
	ble,a	%icc,	loop_676
	subcc	%l6,	%i6,	%g2
	sdivx	%l5,	0x1667,	%o0
	udivx	%g6,	0x1F8F,	%o1
loop_676:
	swap	[%l7 + 0x68],	%l1
	umul	%l0,	%o3,	%i2
	movcs	%icc,	%i4,	%i7
	movcc	%xcc,	%i1,	%o6
	array32	%g1,	%g4,	%o5
	tsubcctv	%i0,	0x1E4A,	%i5
	umul	%l2,	%g5,	%i3
	edge8ln	%o4,	%o2,	%g7
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x11
	fbne,a	%fcc1,	loop_677
	taddcc	%l4,	0x105E,	%l3
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x18,	%f0
loop_677:
	subc	%o7,	0x15FD,	%l6
	edge8	%g3,	%g2,	%i6
	srlx	%o0,	0x05,	%l5
	edge16l	%g6,	%l1,	%l0
	movn	%icc,	%o1,	%i2
	sllx	%i4,	0x09,	%i7
	array32	%o3,	%i1,	%g1
	set	0x23, %i4
	ldsba	[%l7 + %i4] 0x04,	%o6
	ldub	[%l7 + 0x0B],	%g4
	fpsub32s	%f6,	%f22,	%f23
	fba,a	%fcc3,	loop_678
	fbn,a	%fcc1,	loop_679
	edge16l	%o5,	%i5,	%i0
	nop
	fitod	%f22,	%f10
loop_678:
	tn	%xcc,	0x7
loop_679:
	std	%f18,	[%l7 + 0x08]
	movl	%icc,	%l2,	%i3
	array8	%g5,	%o2,	%o4
	andcc	%l4,	0x071C,	%g7
	taddcc	%l3,	0x113C,	%o7
	edge16n	%l6,	%g2,	%g3
	edge8n	%i6,	%o0,	%g6
	movcs	%xcc,	%l1,	%l0
	tpos	%xcc,	0x4
	add	%o1,	%l5,	%i4
	fbule	%fcc2,	loop_680
	ldsh	[%l7 + 0x50],	%i2
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x18] %asi,	%f1
loop_680:
	fmovrsgz	%i7,	%f31,	%f19
	sethi	0x1FFA,	%i1
	fmovrsgz	%o3,	%f11,	%f24
	fzero	%f28
	tleu	%xcc,	0x1
	movle	%icc,	%g1,	%o6
	nop
	set	0x3C, %o5
	ldsw	[%l7 + %o5],	%o5
	tleu	%icc,	0x2
	set	0x54, %o7
	lda	[%l7 + %o7] 0x11,	%f27
	set	0x3C, %l5
	lduwa	[%l7 + %l5] 0x04,	%i5
	tn	%xcc,	0x0
	xor	%i0,	0x1540,	%l2
	mova	%icc,	%g4,	%g5
	udivx	%i3,	0x10EE,	%o2
	movge	%icc,	%l4,	%o4
	bgu,a	%xcc,	loop_681
	sll	%g7,	0x1D,	%l3
	ldsw	[%l7 + 0x30],	%l6
	tsubcc	%g2,	%g3,	%o7
loop_681:
	sir	0x03EF
	nop
	setx	loop_682,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnors	%f11,	%f16,	%f24
	sth	%o0,	[%l7 + 0x14]
	fmovdg	%xcc,	%f3,	%f19
loop_682:
	srax	%i6,	0x07,	%g6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x26] %asi,	%l0
	mulscc	%o1,	%l1,	%i4
	sdiv	%i2,	0x1A06,	%i7
	andn	%i1,	%l5,	%o3
	swap	[%l7 + 0x24],	%g1
	fnot1s	%f10,	%f28
	nop
	setx	0x8A93F8A2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x0138095F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f20,	%f6
	tn	%icc,	0x6
	brgez	%o5,	loop_683
	fzeros	%f8
	ta	%icc,	0x2
	movge	%xcc,	%i5,	%i0
loop_683:
	fsrc2s	%f9,	%f29
	fmovrse	%o6,	%f6,	%f3
	tsubcc	%g4,	0x15C8,	%g5
	edge32n	%l2,	%o2,	%i3
	fmovdl	%xcc,	%f14,	%f9
	subcc	%l4,	%g7,	%o4
	xor	%l6,	%l3,	%g3
	te	%icc,	0x0
	tneg	%icc,	0x2
	andn	%g2,	%o0,	%o7
	move	%icc,	%g6,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x08],	%o1
	movcc	%xcc,	%l1,	%i4
	sll	%i2,	%i6,	%i1
	movneg	%xcc,	%l5,	%i7
	taddcc	%g1,	0x192C,	%o3
	tneg	%icc,	0x2
	edge8ln	%i5,	%o5,	%i0
	nop
	set	0x30, %l4
	stx	%o6,	[%l7 + %l4]
	movvs	%icc,	%g5,	%g4
	edge8l	%l2,	%i3,	%o2
	udiv	%g7,	0x17EE,	%l4
	and	%o4,	%l6,	%l3
	tpos	%icc,	0x0
	edge16l	%g3,	%g2,	%o7
	bshuffle	%f30,	%f22,	%f12
	wr	%g0,	0x19,	%asi
	stxa	%g6,	[%l7 + 0x78] %asi
	edge8n	%o0,	%o1,	%l0
	fpmerge	%f24,	%f14,	%f10
	udivcc	%l1,	0x12BF,	%i2
	sll	%i6,	0x0F,	%i1
	brlez	%i4,	loop_684
	movrne	%l5,	0x1DD,	%g1
	andcc	%i7,	%i5,	%o5
	movcs	%icc,	%o3,	%o6
loop_684:
	taddcctv	%i0,	%g4,	%l2
	ldd	[%l7 + 0x28],	%f4
	fmovd	%f6,	%f26
	fand	%f30,	%f16,	%f24
	movne	%xcc,	%g5,	%i3
	sllx	%g7,	%l4,	%o4
	tneg	%xcc,	0x1
	tvc	%icc,	0x1
	sra	%o2,	0x10,	%l3
	tvs	%icc,	0x3
	fpmerge	%f31,	%f15,	%f24
	ldd	[%l7 + 0x40],	%g2
	srlx	%l6,	%o7,	%g2
	movpos	%xcc,	%o0,	%g6
	fone	%f22
	and	%l0,	0x045B,	%l1
	fbu	%fcc2,	loop_685
	brlez,a	%o1,	loop_686
	ldd	[%l7 + 0x50],	%i2
	alignaddr	%i6,	%i1,	%l5
loop_685:
	movn	%icc,	%g1,	%i4
loop_686:
	fble	%fcc1,	loop_687
	fzeros	%f10
	udiv	%i5,	0x0337,	%i7
	ble,a,pn	%xcc,	loop_688
loop_687:
	fbg	%fcc1,	loop_689
	fbe,a	%fcc3,	loop_690
	tvc	%xcc,	0x6
loop_688:
	swap	[%l7 + 0x24],	%o5
loop_689:
	movne	%xcc,	%o3,	%i0
loop_690:
	lduh	[%l7 + 0x46],	%o6
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x7C] %asi,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g5,	%l2,	%g7
	umulcc	%i3,	0x0F12,	%l4
	tcs	%icc,	0x5
	edge8l	%o2,	%o4,	%l3
	fmovrslz	%l6,	%f21,	%f9
	tvc	%xcc,	0x6
	xnor	%g3,	%g2,	%o7
	ta	%icc,	0x0
	tleu	%xcc,	0x0
	fcmpgt16	%f2,	%f24,	%g6
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x15
	edge8l	%o0,	%l1,	%l0
	mulx	%o1,	%i2,	%i1
	nop
	setx	0x9C630DC8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x9FBC8F28,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f31,	%f4
	and	%i6,	%l5,	%g1
	popc	%i5,	%i7
	move	%icc,	%i4,	%o3
	xnorcc	%o5,	0x1947,	%i0
	edge16ln	%o6,	%g4,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x40] %asi,	%g6
	fble,a	%fcc1,	loop_691
	bcs,a	%xcc,	loop_692
	tg	%xcc,	0x1
	array32	%g5,	%i3,	%o2
loop_691:
	fmovdge	%icc,	%f1,	%f9
loop_692:
	nop
	fitos	%f10,	%f24
	fstox	%f24,	%f30
	fxor	%f12,	%f20,	%f6
	fmovdne	%xcc,	%f14,	%f18
	tleu	%icc,	0x1
	andcc	%l4,	%l3,	%o4
	fpadd16	%f10,	%f30,	%f10
	movvc	%xcc,	%l6,	%g3
	sdivcc	%o7,	0x0D2D,	%g2
	movrlz	%o0,	0x2CC,	%g6
	fnot2s	%f2,	%f29
	flush	%l7 + 0x4C
	orncc	%l1,	%o1,	%i2
	nop
	setx	0xA4DB90C1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xB6903D99,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f3,	%f11
	array8	%i1,	%i6,	%l0
	mulscc	%l5,	0x1C4D,	%g1
	subccc	%i5,	%i7,	%o3
	mova	%icc,	%i4,	%o5
	movpos	%xcc,	%i0,	%o6
	tgu	%icc,	0x5
	wr	%g0,	0x2a,	%asi
	stwa	%g4,	[%l7 + 0x48] %asi
	membar	#Sync
	movrlez	%l2,	0x028,	%g7
	fmuld8ulx16	%f29,	%f21,	%f16
	sll	%g5,	0x0C,	%i3
	array8	%o2,	%l3,	%o4
	xnorcc	%l6,	%g3,	%l4
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	ldsh	[%l7 + 0x08],	%o7
	addc	%g2,	%g6,	%o0
	tsubcctv	%l1,	%i2,	%i1
	bneg,pt	%xcc,	loop_693
	sdiv	%i6,	0x0332,	%l0
	bshuffle	%f28,	%f0,	%f14
	ta	%xcc,	0x0
loop_693:
	tcs	%icc,	0x7
	umul	%o1,	%l5,	%i5
	smul	%i7,	0x17DB,	%o3
	stbar
	addccc	%i4,	0x0655,	%o5
	tcc	%xcc,	0x1
	fabsd	%f2,	%f24
	fand	%f16,	%f14,	%f0
	nop
	setx	0x807562FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	edge8l	%i0,	%o6,	%g1
	fmovrdlez	%g4,	%f28,	%f4
	subccc	%l2,	%g5,	%g7
	tne	%icc,	0x0
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i3
	subc	%o2,	0x14FB,	%l3
	set	0x30, %l1
	stwa	%l6,	[%l7 + %l1] 0x88
	subc	%o4,	0x07CE,	%g3
	orcc	%l4,	0x17A4,	%o7
	wr	%g0,	0x22,	%asi
	stha	%g2,	[%l7 + 0x50] %asi
	membar	#Sync
	ldsh	[%l7 + 0x1A],	%g6
	tn	%icc,	0x4
	array32	%l1,	%i2,	%o0
	xorcc	%i6,	%i1,	%o1
	fcmpgt32	%f4,	%f24,	%l5
	tne	%xcc,	0x1
	ldx	[%l7 + 0x10],	%l0
	movgu	%xcc,	%i7,	%i5
	tcs	%xcc,	0x0
	nop
	setx	0xA4A07A91,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x648EDFBF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f11,	%f11
	bne,pt	%icc,	loop_694
	tsubcc	%i4,	%o5,	%i0
	subccc	%o6,	0x0340,	%o3
	sth	%g4,	[%l7 + 0x32]
loop_694:
	xnorcc	%l2,	%g5,	%g1
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x18] %asi,	%i3
	tpos	%xcc,	0x3
	lduh	[%l7 + 0x1C],	%o2
	alignaddr	%l3,	%l6,	%o4
	fpadd16	%f4,	%f6,	%f18
	fmovsleu	%icc,	%f4,	%f19
	alignaddrl	%g3,	%g7,	%l4
	wr	%g0,	0x81,	%asi
	stba	%g2,	[%l7 + 0x5E] %asi
	nop
	setx	loop_695,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fone	%f28
	movn	%icc,	%g6,	%l1
	sdiv	%o7,	0x04BB,	%o0
loop_695:
	alignaddr	%i6,	%i2,	%o1
	fmovrsgz	%i1,	%f24,	%f6
	sdivcc	%l0,	0x1D2E,	%l5
	movleu	%xcc,	%i5,	%i4
	fzeros	%f4
	alignaddr	%i7,	%i0,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x1
	fnegs	%f15,	%f3
	bgu,a	loop_696
	andn	%o3,	0x11C7,	%g4
	movge	%xcc,	%o5,	%g5
	call	loop_697
loop_696:
	movle	%xcc,	%g1,	%l2
	srax	%i3,	%l3,	%l6
	set	0x6E, %o4
	stha	%o2,	[%l7 + %o4] 0x15
loop_697:
	edge16ln	%o4,	%g3,	%g7
	fandnot2s	%f4,	%f12,	%f11
	nop
	fitos	%f5,	%f20
	fstod	%f20,	%f28
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x5A] %asi,	%l4
	ldx	[%l7 + 0x50],	%g6
	set	0x28, %o6
	prefetcha	[%l7 + %o6] 0x88,	 0x1
	nop
	setx	0x306D0E12,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	edge32n	%g2,	%o7,	%i6
	subcc	%o0,	%i2,	%o1
	fmovsvc	%xcc,	%f31,	%f17
	fmovsle	%icc,	%f29,	%f5
	subc	%i1,	0x1350,	%l5
	bl	loop_698
	movcc	%xcc,	%l0,	%i5
	fnot2	%f14,	%f16
	fnot1	%f14,	%f20
loop_698:
	fmovrsgz	%i4,	%f20,	%f30
	alignaddr	%i0,	%i7,	%o3
	bvs,a	%icc,	loop_699
	nop
	setx	0x0D741A5AA0453264,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x44DBE767F58A22CF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f20,	%f24
	movgu	%icc,	%o6,	%o5
	fpadd16s	%f28,	%f2,	%f31
loop_699:
	tcc	%xcc,	0x6
	tsubcc	%g4,	%g5,	%g1
	swap	[%l7 + 0x10],	%l2
	prefetch	[%l7 + 0x2C],	 0x1
	edge8ln	%i3,	%l3,	%o2
	addc	%o4,	0x03F9,	%g3
	taddcctv	%l6,	%l4,	%g7
	movvs	%xcc,	%l1,	%g2
	fnegs	%f15,	%f3
	sub	%o7,	%g6,	%i6
	and	%o0,	%o1,	%i2
	mulx	%l5,	0x176C,	%i1
	fand	%f8,	%f26,	%f12
	set	0x54, %g2
	stwa	%i5,	[%l7 + %g2] 0x27
	membar	#Sync
	fbu,a	%fcc0,	loop_700
	fpadd16	%f0,	%f18,	%f28
	tn	%xcc,	0x1
	addc	%i4,	%l0,	%i7
loop_700:
	add	%i0,	0x0972,	%o6
	set	0x44, %i7
	stha	%o3,	[%l7 + %i7] 0x2a
	membar	#Sync
	movne	%icc,	%g4,	%g5
	movg	%xcc,	%o5,	%g1
	bg,a	loop_701
	nop
	fitos	%f0,	%f20
	fstod	%f20,	%f8
	fmovrsgez	%l2,	%f24,	%f18
	movre	%i3,	0x016,	%o2
loop_701:
	fors	%f15,	%f3,	%f12
	fmovsgu	%icc,	%f13,	%f5
	fxnors	%f8,	%f26,	%f6
	te	%xcc,	0x0
	movrlez	%l3,	%o4,	%g3
	xnorcc	%l4,	0x1DA1,	%g7
	edge32l	%l6,	%l1,	%o7
	fmovdleu	%icc,	%f22,	%f3
	alignaddr	%g2,	%g6,	%i6
	movg	%xcc,	%o1,	%i2
	orncc	%o0,	%i1,	%i5
	edge16l	%i4,	%l5,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x14],	%l0
	std	%f22,	[%l7 + 0x38]
	movn	%icc,	%i0,	%o6
	movne	%xcc,	%g4,	%o3
	fbne,a	%fcc3,	loop_702
	be,pt	%icc,	loop_703
	popc	%o5,	%g1
	fpmerge	%f15,	%f17,	%f0
loop_702:
	bn	%icc,	loop_704
loop_703:
	fbge	%fcc2,	loop_705
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l2,	%g5,	%o2
loop_704:
	array16	%i3,	%o4,	%g3
loop_705:
	flush	%l7 + 0x18
	fbn,a	%fcc2,	loop_706
	tvs	%xcc,	0x6
	bcs,a,pt	%xcc,	loop_707
	movre	%l3,	0x174,	%l4
loop_706:
	fsrc2	%f0,	%f30
	array32	%g7,	%l6,	%o7
loop_707:
	udivcc	%g2,	0x0C56,	%g6
	fpmerge	%f12,	%f20,	%f16
	movrne	%i6,	0x14F,	%o1
	movle	%xcc,	%i2,	%o0
	std	%f20,	[%l7 + 0x18]
	bvc,a	loop_708
	movvs	%icc,	%l1,	%i5
	movrgz	%i4,	0x0F2,	%i1
	addcc	%i7,	0x1BC0,	%l5
loop_708:
	bg,pt	%xcc,	loop_709
	fmovrdlez	%i0,	%f28,	%f10
	sra	%o6,	%g4,	%o3
	tg	%xcc,	0x4
loop_709:
	andn	%o5,	0x1F88,	%g1
	umul	%l2,	%l0,	%g5
	lduw	[%l7 + 0x14],	%o2
	flush	%l7 + 0x10
	sll	%o4,	0x0E,	%g3
	fbne	%fcc3,	loop_710
	and	%l3,	%i3,	%g7
	bcs,pt	%xcc,	loop_711
	nop
	fitos	%f2,	%f1
	fstoi	%f1,	%f10
loop_710:
	flush	%l7 + 0x1C
	tvs	%icc,	0x7
loop_711:
	taddcc	%l6,	0x09D1,	%l4
	bne	loop_712
	fmul8ulx16	%f14,	%f26,	%f6
	nop
	setx	0xE8066F27AA37531A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f22
	movpos	%xcc,	%o7,	%g2
loop_712:
	nop
	set	0x54, %g7
	ldswa	[%l7 + %g7] 0x0c,	%i6
	fmovdleu	%xcc,	%f13,	%f16
	popc	%o1,	%i2
	fornot1s	%f31,	%f26,	%f31
	tcs	%xcc,	0x3
	andncc	%o0,	%l1,	%g6
	fmovrdlz	%i5,	%f18,	%f28
	fmuld8ulx16	%f0,	%f18,	%f18
	lduw	[%l7 + 0x24],	%i4
	fble,a	%fcc0,	loop_713
	subccc	%i7,	0x1440,	%l5
	fmovrslez	%i1,	%f1,	%f19
	movre	%i0,	0x000,	%g4
loop_713:
	or	%o6,	0x1438,	%o3
	and	%g1,	0x11A6,	%o5
	ldsb	[%l7 + 0x1B],	%l0
	fnot2s	%f24,	%f19
	fnot2s	%f17,	%f21
	umul	%l2,	0x1C0B,	%g5
	movne	%icc,	%o4,	%g3
	movl	%xcc,	%o2,	%l3
	wr	%g0,	0xe2,	%asi
	stxa	%i3,	[%l7 + 0x40] %asi
	membar	#Sync
	stbar
	addccc	%l6,	%g7,	%l4
	move	%xcc,	%g2,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f0
	movrlez	%i6,	0x1B2,	%o1
	tsubcc	%i2,	0x18AA,	%l1
	tvc	%icc,	0x7
	tg	%icc,	0x5
	sdiv	%g6,	0x1A6B,	%o0
	fpack32	%f16,	%f10,	%f2
	membar	0x0C
	fmovsneg	%xcc,	%f25,	%f2
	tvs	%icc,	0x1
	xorcc	%i4,	0x1E39,	%i5
	srl	%l5,	%i7,	%i0
	srl	%g4,	%o6,	%o3
	array8	%i1,	%o5,	%g1
	fands	%f1,	%f16,	%f13
	set	0x10, %o3
	prefetcha	[%l7 + %o3] 0x14,	 0x3
	srl	%l2,	0x08,	%o4
	smulcc	%g3,	0x0E0A,	%o2
	fpadd32s	%f22,	%f23,	%f28
	nop
	fitod	%f12,	%f16
	fdtos	%f16,	%f22
	stx	%g5,	[%l7 + 0x38]
	bcs,a,pn	%xcc,	loop_714
	tsubcctv	%i3,	0x06B0,	%l6
	fbo,a	%fcc1,	loop_715
	andncc	%g7,	%l4,	%l3
loop_714:
	nop
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x40] %asi,	%g2
loop_715:
	alignaddrl	%i6,	%o7,	%i2
	nop
	setx	0xCD0FB0A8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x74FC8711,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f9,	%f10
	move	%icc,	%o1,	%l1
	mulscc	%g6,	0x1ED2,	%i4
	fbug,a	%fcc1,	loop_716
	movle	%icc,	%o0,	%l5
	bcc,pn	%icc,	loop_717
	orncc	%i5,	0x0C0C,	%i0
loop_716:
	nop
	set	0x10, %o2
	lduwa	[%l7 + %o2] 0x15,	%i7
loop_717:
	edge32n	%o6,	%g4,	%o3
	fcmple32	%f20,	%f0,	%o5
	movle	%xcc,	%g1,	%i1
	fnot2	%f12,	%f18
	edge16	%l2,	%o4,	%g3
	xnorcc	%o2,	0x1422,	%g5
	tneg	%xcc,	0x6
	sdivcc	%l0,	0x04B3,	%l6
	subc	%i3,	%l4,	%l3
	ble,pn	%icc,	loop_718
	ldd	[%l7 + 0x58],	%g2
	edge8l	%g7,	%o7,	%i6
	tpos	%icc,	0x0
loop_718:
	sethi	0x15B1,	%i2
	xorcc	%o1,	%g6,	%l1
	popc	0x0950,	%o0
	or	%l5,	%i5,	%i0
	sdiv	%i4,	0x1503,	%o6
	movvc	%icc,	%g4,	%o3
	set	0x1C, %g4
	ldsha	[%l7 + %g4] 0x15,	%o5
	umulcc	%g1,	0x12F8,	%i1
	sdivcc	%l2,	0x0AEB,	%o4
	membar	0x0B
	fcmple16	%f18,	%f12,	%g3
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
	fnot1s	%f30,	%f10
	fcmpgt32	%f28,	%f2,	%i7
	sdiv	%g5,	0x10EB,	%l0
loop_719:
	nop
	set	0x12, %i5
	ldstuba	[%l7 + %i5] 0x80,	%o2
	nop
	setx	0x9816C979,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x1823533D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f28,	%f15
	and	%l6,	0x1206,	%l4
	sethi	0x12A9,	%l3
	fmuld8ulx16	%f14,	%f21,	%f6
	array32	%i3,	%g2,	%g7
	movvs	%icc,	%o7,	%i6
	fands	%f3,	%f24,	%f8
	edge32	%i2,	%g6,	%o1
	fxnor	%f30,	%f24,	%f22
	orn	%l1,	0x138F,	%l5
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x11,	%f16
	fandnot1	%f30,	%f22,	%f8
	fmovd	%f4,	%f0
	movvc	%icc,	%i5,	%o0
	subcc	%i0,	0x12EE,	%o6
	udivcc	%g4,	0x169D,	%o3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o5
	addc	%g1,	0x1B47,	%i4
	fmovdne	%icc,	%f25,	%f12
	fmovdcc	%icc,	%f25,	%f20
	smulcc	%l2,	0x154A,	%i1
	sllx	%o4,	%i7,	%g5
	nop
	fitod	%f0,	%f2
	fdtos	%f2,	%f3
	fsrc1	%f12,	%f10
	fnor	%f28,	%f22,	%f10
	set	0x3C, %l6
	stwa	%l0,	[%l7 + %l6] 0x89
	andncc	%o2,	%l6,	%g3
	edge16l	%l4,	%l3,	%i3
	nop
	setx	0x111747DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x1D4B8B44,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f30,	%f8
	fmovsgu	%xcc,	%f19,	%f29
	fand	%f20,	%f26,	%f0
	sdivcc	%g7,	0x06A5,	%o7
	be,pn	%xcc,	loop_720
	movn	%xcc,	%i6,	%i2
	tvc	%xcc,	0x4
	movre	%g6,	%g2,	%o1
loop_720:
	fpmerge	%f27,	%f29,	%f4
	tneg	%icc,	0x4
	sub	%l5,	%i5,	%o0
	tg	%xcc,	0x2
	xorcc	%l1,	0x0211,	%i0
	fpackfix	%f8,	%f12
	fmovsgu	%icc,	%f29,	%f13
	fandnot1	%f14,	%f4,	%f24
	taddcctv	%o6,	0x02B7,	%o3
	ldstub	[%l7 + 0x70],	%g4
	bge,a,pt	%icc,	loop_721
	sll	%o5,	0x05,	%i4
	fands	%f13,	%f3,	%f11
	brz,a	%g1,	loop_722
loop_721:
	movg	%icc,	%i1,	%o4
	addccc	%l2,	%g5,	%l0
	addc	%o2,	%i7,	%g3
loop_722:
	stx	%l6,	[%l7 + 0x20]
	edge8ln	%l4,	%l3,	%g7
	fmovsg	%xcc,	%f8,	%f13
	sethi	0x1281,	%o7
	fbule,a	%fcc1,	loop_723
	tneg	%icc,	0x7
	movl	%xcc,	%i6,	%i2
	fpack16	%f26,	%f3
loop_723:
	edge8	%g6,	%g2,	%o1
	subcc	%l5,	0x08CA,	%i5
	tge	%xcc,	0x5
	fmovrdlez	%i3,	%f22,	%f26
	stx	%l1,	[%l7 + 0x10]
	fsrc1s	%f11,	%f8
	tgu	%icc,	0x0
	movvc	%xcc,	%o0,	%i0
	andncc	%o3,	%g4,	%o6
	prefetch	[%l7 + 0x70],	 0x3
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x68] %asi,	%i4
	sth	%g1,	[%l7 + 0x56]
	subcc	%i1,	%o4,	%l2
	srl	%g5,	%o5,	%o2
	tpos	%xcc,	0x3
	tg	%icc,	0x2
	set	0x65, %g3
	lduba	[%l7 + %g3] 0x04,	%l0
	array8	%i7,	%g3,	%l6
	tcs	%xcc,	0x1
	brgz	%l4,	loop_724
	tge	%icc,	0x0
	tl	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g7
loop_724:
	sub	%o7,	0x1394,	%i6
	xnorcc	%i2,	%l3,	%g6
	andncc	%o1,	%g2,	%i5
	move	%icc,	%i3,	%l5
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovrsne	%l1,	%f29,	%f4
	fornot1	%f6,	%f16,	%f6
	sethi	0x1ABF,	%i0
	fmovrsgz	%o3,	%f29,	%f1
	fbg	%fcc2,	loop_725
	nop
	setx	0xA1B8B1854CEDD2F0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD32A1EA8304212D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f6,	%f2
	mova	%xcc,	%o0,	%g4
	fexpand	%f7,	%f30
loop_725:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbule,a	%fcc2,	loop_726
	be,pt	%icc,	loop_727
	tleu	%icc,	0x3
	array8	%i4,	%o6,	%g1
loop_726:
	membar	0x54
loop_727:
	mulscc	%o4,	%i1,	%g5
	ble,a,pn	%xcc,	loop_728
	array8	%o5,	%l2,	%o2
	mulx	%i7,	%g3,	%l0
	edge32l	%l4,	%g7,	%l6
loop_728:
	fbne	%fcc0,	loop_729
	fbo,a	%fcc2,	loop_730
	fnot1	%f24,	%f24
	addc	%o7,	%i2,	%l3
loop_729:
	tsubcctv	%g6,	%o1,	%g2
loop_730:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i5,	%i6,	%l5
	alignaddrl	%l1,	%i3,	%o3
	fbo,a	%fcc3,	loop_731
	movrgez	%o0,	%g4,	%i0
	xnor	%i4,	0x102C,	%g1
	fmul8sux16	%f0,	%f22,	%f30
loop_731:
	add	%o6,	0x1899,	%i1
	subcc	%o4,	0x1795,	%o5
	fmovrdgez	%l2,	%f2,	%f12
	fmovrdlz	%g5,	%f22,	%f14
	movn	%xcc,	%i7,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%icc,	0x5
	ldd	[%l7 + 0x68],	%g2
	nop
	fitod	%f31,	%f6
	movne	%icc,	%l4,	%l0
	nop
	setx loop_732, %l0, %l1
	jmpl %l1, %l6
	subccc	%o7,	%i2,	%l3
	edge8ln	%g7,	%g6,	%g2
	brgez,a	%o1,	loop_733
loop_732:
	subc	%i6,	0x18D0,	%i5
	mulx	%l1,	0x0214,	%l5
	fba	%fcc0,	loop_734
loop_733:
	fbg	%fcc1,	loop_735
	bvs,a	loop_736
	tleu	%xcc,	0x3
loop_734:
	fmovrde	%o3,	%f14,	%f2
loop_735:
	tsubcctv	%o0,	%g4,	%i0
loop_736:
	nop
	set	0x2C, %g5
	ldswa	[%l7 + %g5] 0x19,	%i4
	mova	%xcc,	%i3,	%g1
	orn	%i1,	0x1721,	%o6
	for	%f30,	%f2,	%f30
	fmovdg	%xcc,	%f2,	%f1
	udiv	%o5,	0x1300,	%l2
	srax	%g5,	%o4,	%i7
	taddcc	%o2,	%g3,	%l4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x56] %asi,	%l0
	ble	loop_737
	subccc	%l6,	%i2,	%o7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x81,	%l3,	%g6
loop_737:
	fcmple32	%f8,	%f4,	%g2
	sethi	0x06A6,	%o1
	movrlez	%g7,	0x37A,	%i6
	movrgz	%i5,	%l5,	%l1
	sra	%o3,	0x07,	%g4
	movpos	%icc,	%i0,	%o0
	fmovdleu	%xcc,	%f29,	%f0
	nop
	fitos	%f9,	%f31
	fstox	%f31,	%f0
	bvs	loop_738
	ba,a,pt	%xcc,	loop_739
	nop
	setx	0xE064B81F,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	bcs,a	%icc,	loop_740
loop_738:
	prefetch	[%l7 + 0x58],	 0x3
loop_739:
	tneg	%icc,	0x1
	movl	%xcc,	%i3,	%g1
loop_740:
	fmovdl	%xcc,	%f27,	%f2
	movge	%icc,	%i1,	%o6
	array32	%i4,	%l2,	%g5
	bg,a	%icc,	loop_741
	bneg	%xcc,	loop_742
	array16	%o5,	%i7,	%o4
	xor	%o2,	%g3,	%l0
loop_741:
	fxnor	%f4,	%f26,	%f14
loop_742:
	sll	%l6,	%l4,	%i2
	movne	%icc,	%o7,	%g6
	or	%g2,	%o1,	%g7
	sra	%i6,	0x0F,	%l3
	fmovdcs	%icc,	%f2,	%f15
	sdiv	%i5,	0x0964,	%l5
	fzero	%f24
	movge	%icc,	%l1,	%o3
	tne	%xcc,	0x0
	fba,a	%fcc0,	loop_743
	orncc	%i0,	0x1FD3,	%o0
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x88
loop_743:
	tge	%icc,	0x0
	fxor	%f8,	%f4,	%f4
	fmovdl	%icc,	%f26,	%f4
	tcs	%xcc,	0x7
	subcc	%i3,	%g4,	%g1
	array32	%i1,	%i4,	%o6
	tvc	%xcc,	0x1
	fmovsl	%icc,	%f0,	%f26
	set	0x18, %l0
	swapa	[%l7 + %l0] 0x81,	%l2
	bcc	loop_744
	for	%f28,	%f0,	%f26
	edge16n	%g5,	%i7,	%o5
	brlez	%o2,	loop_745
loop_744:
	fmovrslez	%o4,	%f22,	%f14
	movrlz	%l0,	0x018,	%l6
	movg	%xcc,	%g3,	%i2
loop_745:
	or	%l4,	%o7,	%g2
	srlx	%g6,	%o1,	%g7
	sdivx	%l3,	0x1C00,	%i5
	tgu	%icc,	0x4
	addc	%l5,	%l1,	%i6
	edge8ln	%i0,	%o0,	%i3
	edge16n	%o3,	%g1,	%g4
	fblg	%fcc3,	loop_746
	srax	%i4,	%o6,	%l2
	andncc	%g5,	%i1,	%o5
	fmovdl	%xcc,	%f19,	%f8
loop_746:
	tneg	%icc,	0x6
	tsubcctv	%o2,	%i7,	%o4
	movrgez	%l0,	0x3C1,	%g3
	fxnors	%f24,	%f23,	%f15
	fbu,a	%fcc3,	loop_747
	ldd	[%l7 + 0x68],	%f24
	orn	%i2,	0x0649,	%l6
	andcc	%l4,	%o7,	%g6
loop_747:
	fpackfix	%f24,	%f25
	edge32ln	%g2,	%o1,	%g7
	fmovsge	%icc,	%f16,	%f7
	sethi	0x021E,	%i5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1D] %asi,	%l5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x68] %asi,	%l1
	tleu	%icc,	0x7
	movvc	%icc,	%i6,	%i0
	fbue	%fcc3,	loop_748
	orn	%o0,	%l3,	%o3
	mova	%icc,	%i3,	%g4
	movpos	%icc,	%i4,	%o6
loop_748:
	nop
	set	0x52, %i3
	lduha	[%l7 + %i3] 0x88,	%l2
	brnz,a	%g5,	loop_749
	tne	%xcc,	0x3
	brgz	%g1,	loop_750
	movle	%xcc,	%i1,	%o5
loop_749:
	tsubcc	%i7,	%o2,	%l0
	bcc,a	%icc,	loop_751
loop_750:
	bcc,pn	%xcc,	loop_752
	ldsb	[%l7 + 0x45],	%g3
	nop
	setx	0x7AE20F2DD9A9FE6D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x28D86215A4B4E135,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f14,	%f20
loop_751:
	edge16n	%o4,	%l6,	%i2
loop_752:
	fmovdgu	%xcc,	%f18,	%f14
	sdivcc	%o7,	0x13C6,	%l4
	fmovsg	%icc,	%f15,	%f18
	subccc	%g6,	%g2,	%o1
	sdivcc	%i5,	0x10CC,	%l5
	fbuge	%fcc3,	loop_753
	edge32l	%g7,	%i6,	%i0
	fxors	%f10,	%f22,	%f12
	smulcc	%l1,	0x033B,	%l3
loop_753:
	fpackfix	%f26,	%f0
	movle	%xcc,	%o3,	%i3
	ldub	[%l7 + 0x54],	%o0
	or	%g4,	0x0ADA,	%o6
	tn	%icc,	0x1
	fpadd16	%f22,	%f0,	%f12
	addc	%l2,	0x0398,	%g5
	lduh	[%l7 + 0x56],	%g1
	nop
	setx	loop_754,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrslz	%i4,	%f16,	%f23
	sdivcc	%i1,	0x1444,	%i7
	orcc	%o5,	%o2,	%g3
loop_754:
	edge8	%l0,	%l6,	%o4
	fbne	%fcc2,	loop_755
	fnands	%f0,	%f3,	%f18
	edge32	%i2,	%o7,	%g6
	fcmpne16	%f20,	%f20,	%l4
loop_755:
	popc	%o1,	%g2
	fnegs	%f17,	%f28
	ta	%icc,	0x4
	for	%f6,	%f4,	%f22
	fbul,a	%fcc2,	loop_756
	xnor	%l5,	0x07D4,	%g7
	movle	%icc,	%i6,	%i5
	fpack16	%f20,	%f23
loop_756:
	nop
	setx	0x3F77EE5AFC95D7AB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x56D6185BAA96C2CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f0,	%f10
	call	loop_757
	ldd	[%l7 + 0x30],	%f28
	fbl,a	%fcc1,	loop_758
	fpack16	%f6,	%f7
loop_757:
	subc	%l1,	0x0476,	%i0
	tvs	%icc,	0x1
loop_758:
	tle	%xcc,	0x0
	movpos	%icc,	%o3,	%l3
	fbue	%fcc1,	loop_759
	bneg,a	%icc,	loop_760
	ta	%icc,	0x5
	movrlz	%i3,	0x1FE,	%g4
loop_759:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_760:
	edge16n	%o6,	%o0,	%l2
	st	%f7,	[%l7 + 0x50]
	tg	%icc,	0x3
	fxnor	%f26,	%f14,	%f28
	flush	%l7 + 0x4C
	edge16n	%g1,	%g5,	%i1
	movg	%icc,	%i7,	%o5
	pdist	%f6,	%f30,	%f18
	fmovrsgez	%o2,	%f21,	%f3
	movcc	%xcc,	%i4,	%g3
	movg	%xcc,	%l6,	%l0
	fpsub16	%f18,	%f22,	%f28
	srax	%o4,	%o7,	%g6
	sll	%i2,	%l4,	%o1
	movrgez	%g2,	%l5,	%g7
	fone	%f16
	tvc	%xcc,	0x1
	movrgez	%i5,	0x150,	%l1
	ldub	[%l7 + 0x38],	%i6
	tvc	%xcc,	0x4
	srlx	%i0,	0x05,	%o3
	edge32	%l3,	%i3,	%o6
	fcmpne32	%f30,	%f4,	%g4
	fbuge,a	%fcc0,	loop_761
	fbne	%fcc0,	loop_762
	edge16ln	%l2,	%o0,	%g5
	fmovsleu	%xcc,	%f13,	%f21
loop_761:
	fmovse	%icc,	%f7,	%f21
loop_762:
	sll	%g1,	0x0B,	%i7
	udivx	%o5,	0x0F36,	%o2
	fpsub16s	%f11,	%f20,	%f13
	fcmple32	%f4,	%f14,	%i1
	fmovdneg	%xcc,	%f16,	%f31
	subccc	%i4,	%g3,	%l6
	movne	%xcc,	%l0,	%o4
	fblg	%fcc3,	loop_763
	movleu	%icc,	%g6,	%o7
	ble	loop_764
	fpadd32s	%f2,	%f23,	%f29
loop_763:
	xorcc	%i2,	%l4,	%g2
	tl	%xcc,	0x3
loop_764:
	ldsh	[%l7 + 0x3A],	%l5
	edge32l	%g7,	%i5,	%o1
	fbue,a	%fcc0,	loop_765
	ble,pt	%xcc,	loop_766
	movneg	%xcc,	%l1,	%i0
	orncc	%i6,	%l3,	%o3
loop_765:
	ld	[%l7 + 0x58],	%f14
loop_766:
	fbl	%fcc2,	loop_767
	mova	%icc,	%o6,	%i3
	movrgz	%l2,	0x054,	%o0
	brgz	%g5,	loop_768
loop_767:
	fandnot1	%f12,	%f12,	%f2
	fabss	%f22,	%f11
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] %asi,	%g1,	%i7
loop_768:
	tl	%icc,	0x5
	edge32l	%g4,	%o5,	%i1
	fpsub16	%f24,	%f18,	%f0
	wr	%g0,	0x19,	%asi
	stha	%o2,	[%l7 + 0x78] %asi
	te	%xcc,	0x7
	taddcc	%g3,	0x1276,	%i4
	fnot2s	%f16,	%f8
	movge	%icc,	%l0,	%o4
	udivx	%g6,	0x09A4,	%l6
	tcs	%xcc,	0x0
	mova	%icc,	%i2,	%l4
	fbu,a	%fcc2,	loop_769
	nop
	setx	0x1E91EB2A2E7E2F80,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6516A940745F5597,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f8,	%f22
	nop
	set	0x58, %i1
	sth	%o7,	[%l7 + %i1]
	bne,a	%xcc,	loop_770
loop_769:
	mulx	%l5,	%g2,	%g7
	fmovdne	%icc,	%f23,	%f27
	movrgz	%i5,	0x367,	%o1
loop_770:
	sethi	0x12F2,	%l1
	brlz,a	%i6,	loop_771
	mova	%xcc,	%l3,	%o3
	andn	%i0,	0x0E37,	%o6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
loop_771:
	movrgez	%i3,	0x041,	%o0
	movrlez	%g1,	0x0FA,	%g5
	tn	%xcc,	0x1
	srax	%g4,	0x01,	%i7
	movrne	%i1,	%o5,	%o2
	movrlz	%i4,	%l0,	%g3
	fmovsvs	%xcc,	%f15,	%f23
	fmul8x16al	%f20,	%f16,	%f26
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g6
	nop
	fitos	%f8,	%f27
	fstox	%f27,	%f16
	fxtos	%f16,	%f1
	tge	%icc,	0x7
	fbu	%fcc1,	loop_772
	ld	[%l7 + 0x54],	%f27
	fmovsvs	%xcc,	%f8,	%f4
	move	%icc,	%o4,	%i2
loop_772:
	fors	%f27,	%f26,	%f18
	movl	%icc,	%l4,	%l6
	array8	%l5,	%g2,	%g7
	taddcctv	%o7,	0x0D6C,	%i5
	tge	%icc,	0x2
	edge32ln	%o1,	%l1,	%i6
	taddcc	%l3,	0x18D2,	%o3
	brlez	%o6,	loop_773
	movpos	%icc,	%l2,	%i3
	nop
	fitod	%f26,	%f12
	tge	%xcc,	0x3
loop_773:
	srl	%o0,	0x11,	%g1
	pdist	%f0,	%f28,	%f16
	fsrc2	%f14,	%f10
	bvc,a	%icc,	loop_774
	sdivx	%i0,	0x0BE5,	%g4
	subc	%g5,	%i1,	%o5
	add	%i7,	0x048D,	%i4
loop_774:
	fabsd	%f4,	%f0
	wr	%g0,	0x57,	%asi
	stxa	%o2,	[%g0 + 0x0] %asi
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f12
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x28] %asi,	%l0
	tl	%xcc,	0x5
	nop
	setx	0x71574F92,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f27
	fmovrdne	%g6,	%f12,	%f18
	tvs	%icc,	0x1
	fmovd	%f16,	%f16
	set	0x70, %i0
	stha	%g3,	[%l7 + %i0] 0x10
	fmovsg	%icc,	%f3,	%f28
	movl	%xcc,	%i2,	%l4
	bge,a,pt	%icc,	loop_775
	tcs	%xcc,	0x5
	bpos,a,pt	%xcc,	loop_776
	sdiv	%o4,	0x1301,	%l5
loop_775:
	subc	%l6,	0x0912,	%g2
	sra	%g7,	%o7,	%o1
loop_776:
	edge32n	%l1,	%i6,	%i5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x70] %asi,	%o3
	bvc,a	%icc,	loop_777
	smul	%o6,	0x03FE,	%l2
	edge16l	%i3,	%l3,	%o0
	fba	%fcc2,	loop_778
loop_777:
	edge8	%i0,	%g1,	%g5
	prefetch	[%l7 + 0x38],	 0x3
	movcc	%xcc,	%g4,	%i1
loop_778:
	movrlez	%i7,	%i4,	%o2
	fmovrsne	%l0,	%f21,	%f14
	fcmple16	%f12,	%f10,	%g6
	brgez	%g3,	loop_779
	bneg,pt	%xcc,	loop_780
	addcc	%o5,	%i2,	%l4
	fbge	%fcc2,	loop_781
loop_779:
	tne	%icc,	0x3
loop_780:
	xorcc	%o4,	0x0CC5,	%l5
	fmul8sux16	%f4,	%f12,	%f30
loop_781:
	tg	%xcc,	0x6
	fble	%fcc2,	loop_782
	orn	%l6,	0x1F87,	%g2
	bvs,a	loop_783
	edge16ln	%o7,	%g7,	%o1
loop_782:
	udivcc	%i6,	0x0A9E,	%l1
	sdiv	%o3,	0x0CD1,	%i5
loop_783:
	movleu	%icc,	%l2,	%i3
	stbar
	movpos	%xcc,	%o6,	%o0
	sir	0x049E
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x3D] %asi,	%i0
	orcc	%g1,	%l3,	%g4
	sdivcc	%i1,	0x139C,	%i7
	tcc	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x1F] %asi,	%i4
	movleu	%icc,	%g5,	%l0
	ldx	[%l7 + 0x48],	%g6
	fmovsne	%xcc,	%f10,	%f31
	set	0x50, %g1
	prefetcha	[%l7 + %g1] 0x10,	 0x1
	umul	%o5,	%i2,	%l4
	tcc	%xcc,	0x3
	fba,a	%fcc0,	loop_784
	sub	%o4,	%g3,	%l5
	alignaddr	%l6,	%g2,	%o7
	lduh	[%l7 + 0x7A],	%g7
loop_784:
	nop
	set	0x52, %o0
	lduba	[%l7 + %o0] 0x88,	%i6
	lduw	[%l7 + 0x58],	%o1
	st	%f18,	[%l7 + 0x64]
	movrlz	%l1,	%o3,	%l2
	orncc	%i5,	0x0CB8,	%i3
	edge8n	%o6,	%o0,	%g1
	fnot2	%f28,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f6,	%f16,	%f26
	bvs,pn	%xcc,	loop_785
	ba,a,pn	%xcc,	loop_786
	srl	%i0,	%l3,	%g4
	tleu	%xcc,	0x4
loop_785:
	stw	%i7,	[%l7 + 0x10]
loop_786:
	fmovspos	%xcc,	%f29,	%f7
	fcmple16	%f0,	%f26,	%i1
	movrlez	%g5,	%l0,	%i4
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f10
	fxtod	%f10,	%f14
	fnegs	%f0,	%f3
	srl	%o2,	%o5,	%i2
	nop
	setx	loop_787,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%l4,	%g6,	%o4
	umulcc	%l5,	0x190B,	%g3
	tvc	%icc,	0x2
loop_787:
	fbul,a	%fcc1,	loop_788
	fmovsgu	%xcc,	%f13,	%f11
	movle	%icc,	%g2,	%o7
	edge8l	%l6,	%i6,	%g7
loop_788:
	sdiv	%l1,	0x179C,	%o1
	ta	%xcc,	0x5
	move	%icc,	%l2,	%i5
	movrgz	%i3,	0x29B,	%o3
	andcc	%o0,	%o6,	%g1
	tcs	%icc,	0x7
	srax	%l3,	0x12,	%i0
	wr	%g0,	0x80,	%asi
	sta	%f19,	[%l7 + 0x40] %asi
	fmul8x16al	%f14,	%f15,	%f6
	andcc	%i7,	0x0612,	%i1
	xnorcc	%g4,	%l0,	%g5
	fmul8ulx16	%f26,	%f28,	%f6
	ldsh	[%l7 + 0x34],	%o2
	mulx	%i4,	0x0488,	%o5
	fbule	%fcc3,	loop_789
	edge16ln	%i2,	%g6,	%o4
	movvc	%icc,	%l4,	%g3
	tn	%icc,	0x7
loop_789:
	sethi	0x07E7,	%l5
	be	loop_790
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x00718FEEE09181F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x61740BC44FB0B457,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f30,	%f22
	sdivcc	%o7,	0x18EA,	%l6
loop_790:
	andcc	%i6,	0x0C92,	%g2
	ldsw	[%l7 + 0x40],	%l1
	edge8	%o1,	%l2,	%i5
	fblg,a	%fcc1,	loop_791
	lduh	[%l7 + 0x3A],	%g7
	umul	%i3,	0x02FE,	%o3
	fbuge,a	%fcc2,	loop_792
loop_791:
	fbne	%fcc3,	loop_793
	fbe	%fcc0,	loop_794
	popc	%o0,	%o6
loop_792:
	or	%g1,	0x065B,	%i0
loop_793:
	edge8	%l3,	%i7,	%i1
loop_794:
	tle	%icc,	0x5
	tneg	%icc,	0x5
	bcc,a	%xcc,	loop_795
	addccc	%g4,	0x02E9,	%g5
	edge8ln	%l0,	%o2,	%i4
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%i2
loop_795:
	or	%g6,	%o5,	%o4
	addc	%l4,	0x1AF3,	%l5
	sdivx	%g3,	0x0ECF,	%o7
	fble,a	%fcc2,	loop_796
	tvs	%xcc,	0x6
	brlez	%l6,	loop_797
	xorcc	%g2,	0x0DC5,	%i6
loop_796:
	fzeros	%f22
	tne	%icc,	0x4
loop_797:
	ta	%icc,	0x7
	fmovrde	%o1,	%f6,	%f2
	nop
	set	0x34, %g6
	lduw	[%l7 + %g6],	%l1
	set	0x4C, %i2
	swapa	[%l7 + %i2] 0x80,	%i5
	orcc	%l2,	%i3,	%g7
	smul	%o0,	%o3,	%g1
	fmovsne	%xcc,	%f6,	%f21
	xnor	%i0,	0x0555,	%l3
	movpos	%icc,	%o6,	%i7
	fbne	%fcc0,	loop_798
	subcc	%i1,	0x0242,	%g5
	umul	%g4,	0x12D0,	%o2
	umulcc	%l0,	0x0961,	%i4
loop_798:
	edge32	%g6,	%o5,	%i2
	subcc	%l4,	0x183C,	%l5
	fba,a	%fcc3,	loop_799
	srl	%o4,	%o7,	%g3
	orncc	%l6,	0x04FC,	%i6
	sir	0x1A42
loop_799:
	ta	%xcc,	0x5
	sra	%g2,	%o1,	%l1
	smul	%l2,	%i5,	%g7
	te	%icc,	0x1
	set	0x1C, %i4
	stwa	%o0,	[%l7 + %i4] 0x04
	set	0x14, %o5
	lda	[%l7 + %o5] 0x15,	%f10
	set	0x5C, %l5
	stwa	%o3,	[%l7 + %l5] 0x18
	movrgez	%i3,	0x250,	%i0
	fornot2s	%f2,	%f24,	%f24
	fandnot1s	%f20,	%f29,	%f29
	movleu	%icc,	%l3,	%g1
	movgu	%xcc,	%i7,	%o6
	movre	%g5,	0x394,	%i1
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x70] %asi,	%o2
	ld	[%l7 + 0x28],	%f28
	sra	%g4,	%l0,	%i4
	subccc	%o5,	0x1304,	%g6
	movvs	%xcc,	%l4,	%i2
	bg,a,pt	%xcc,	loop_800
	smulcc	%l5,	%o4,	%g3
	xorcc	%l6,	%o7,	%g2
	fmovscc	%xcc,	%f13,	%f24
loop_800:
	edge16ln	%o1,	%i6,	%l2
	taddcc	%l1,	%g7,	%i5
	udiv	%o0,	0x0840,	%i3
	addcc	%i0,	0x1285,	%o3
	movcc	%xcc,	%l3,	%g1
	faligndata	%f6,	%f20,	%f30
	bne,a,pn	%xcc,	loop_801
	edge16	%o6,	%g5,	%i1
	fornot1s	%f3,	%f8,	%f21
	movvc	%xcc,	%i7,	%g4
loop_801:
	fmovdne	%xcc,	%f16,	%f20
	fnegs	%f22,	%f1
	tle	%xcc,	0x6
	array16	%l0,	%o2,	%i4
	array16	%g6,	%o5,	%l4
	fzeros	%f22
	sll	%l5,	0x0C,	%o4
	xorcc	%g3,	0x0675,	%l6
	fmul8sux16	%f10,	%f28,	%f12
	fbl,a	%fcc2,	loop_802
	nop
	setx	loop_803,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%icc,	%o7,	%g2
	movre	%o1,	%i6,	%l2
loop_802:
	orn	%l1,	%g7,	%i5
loop_803:
	bgu,a	loop_804
	array16	%i2,	%o0,	%i0
	brnz,a	%o3,	loop_805
	nop
	setx	0xAB13695233763090,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x650F78D671F4BC45,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fdivd	%f12,	%f10,	%f24
loop_804:
	sdiv	%l3,	0x1138,	%g1
	taddcctv	%i3,	%o6,	%i1
loop_805:
	sll	%i7,	0x12,	%g5
	fmovsn	%icc,	%f20,	%f5
	ld	[%l7 + 0x30],	%f11
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x14,	%f16
	sllx	%g4,	%l0,	%i4
	fnot2	%f24,	%f18
	add	%l7,	0x14,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x18,	%g6,	%o5
	fone	%f26
	sir	0x0C4E
	stbar
	fexpand	%f29,	%f22
	movrgz	%o2,	0x3D3,	%l5
	taddcc	%o4,	0x1C68,	%g3
	fsrc1s	%f3,	%f27
	ldub	[%l7 + 0x73],	%l6
	movn	%icc,	%o7,	%l4
	fbe,a	%fcc3,	loop_806
	edge32n	%g2,	%i6,	%o1
	fmul8sux16	%f20,	%f20,	%f16
	ldd	[%l7 + 0x38],	%l0
loop_806:
	fmovscs	%xcc,	%f11,	%f5
	lduh	[%l7 + 0x38],	%l2
	fmovsg	%icc,	%f28,	%f8
	movrgez	%i5,	%i2,	%o0
	bvs,a	%xcc,	loop_807
	faligndata	%f10,	%f16,	%f24
	ba,pn	%icc,	loop_808
	move	%xcc,	%g7,	%i0
loop_807:
	move	%xcc,	%l3,	%g1
	srl	%o3,	%o6,	%i1
loop_808:
	movrne	%i3,	0x127,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x74, %l4
	prefetch	[%l7 + %l4],	 0x2
	edge8n	%g5,	%g4,	%l0
	ba,pn	%xcc,	loop_809
	nop
	setx	loop_810,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	add	%i4,	%g6,	%o2
	sdiv	%o5,	0x0AAF,	%o4
loop_809:
	fmovdvc	%icc,	%f7,	%f17
loop_810:
	fpadd32s	%f9,	%f4,	%f13
	fba	%fcc2,	loop_811
	movleu	%icc,	%g3,	%l5
	nop
	fitod	%f6,	%f18
	fdtoi	%f18,	%f19
	fzero	%f24
loop_811:
	movpos	%icc,	%o7,	%l4
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
	addcc	%i6,	%g2,	%o1
	tsubcc	%l1,	0x135C,	%l2
	or	%i5,	%o0,	%g7
	movrgz	%i2,	0x38B,	%l3
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
	stbar
	stb	%g1,	[%l7 + 0x63]
	edge16n	%o6,	%i1,	%o3
	mulx	%i7,	0x0046,	%i3
	fmuld8sux16	%f8,	%f0,	%f12
	movvs	%xcc,	%g5,	%g4
	edge8ln	%l0,	%g6,	%i4
	ldsb	[%l7 + 0x58],	%o5
	fornot1s	%f28,	%f9,	%f13
	movrlz	%o4,	0x047,	%g3
	fnand	%f30,	%f10,	%f22
	nop
	setx	0x6AC71EAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x1418F2A3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f5,	%f18
	umul	%o2,	%l5,	%o7
	fnands	%f31,	%f6,	%f29
	fxor	%f6,	%f22,	%f30
	fpsub16s	%f27,	%f12,	%f0
	orcc	%l4,	%l6,	%i6
	movvs	%xcc,	%g2,	%o1
	fzero	%f4
	fmul8x16au	%f3,	%f19,	%f24
	or	%l2,	%i5,	%l1
	movcs	%icc,	%o0,	%i2
	fba	%fcc3,	loop_812
	brgez	%g7,	loop_813
	fnegd	%f0,	%f6
	nop
	setx loop_814, %l0, %l1
	jmpl %l1, %i0
loop_812:
	nop
	fitod	%f11,	%f16
loop_813:
	fba,a	%fcc1,	loop_815
	nop
	fitos	%f7,	%f20
	fstoi	%f20,	%f28
loop_814:
	movrgz	%g1,	%o6,	%i1
	fcmpgt32	%f22,	%f6,	%o3
loop_815:
	fmovrdlz	%i7,	%f26,	%f6
	movvs	%icc,	%i3,	%l3
	tcs	%xcc,	0x7
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	addc	%g5,	0x0966,	%l0
	fpsub32s	%f28,	%f3,	%f20
	udivcc	%g4,	0x1847,	%g6
	movrlez	%o5,	0x0B0,	%i4
	udivcc	%o4,	0x0CD9,	%o2
	movcs	%icc,	%g3,	%l5
	fnor	%f28,	%f22,	%f30
	set	0x0C, %l1
	ldsha	[%l7 + %l1] 0x11,	%l4
	wr	%g0,	0x23,	%asi
	stwa	%o7,	[%l7 + 0x74] %asi
	membar	#Sync
	ldsw	[%l7 + 0x44],	%i6
	sub	%g2,	%o1,	%l2
	fandnot2	%f24,	%f12,	%f28
	add	%l6,	%i5,	%o0
	movre	%l1,	0x0A5,	%i2
	ldsw	[%l7 + 0x54],	%g7
	xor	%i0,	0x0D1D,	%o6
	movrlz	%g1,	%i1,	%o3
	fmovdle	%xcc,	%f0,	%f6
	fnot1	%f30,	%f16
	sllx	%i3,	%i7,	%l3
	ldsw	[%l7 + 0x2C],	%l0
	fpadd16	%f30,	%f10,	%f26
	tl	%xcc,	0x5
	xnor	%g4,	%g6,	%o5
	edge8l	%g5,	%i4,	%o4
	fmul8sux16	%f28,	%f10,	%f2
	sllx	%o2,	0x1B,	%l5
	edge32l	%l4,	%o7,	%i6
	movgu	%icc,	%g3,	%g2
	add	%l2,	%o1,	%i5
	lduw	[%l7 + 0x1C],	%l6
	smulcc	%o0,	%l1,	%i2
	bn	loop_816
	nop
	fitod	%f12,	%f14
	fdtoi	%f14,	%f16
	prefetch	[%l7 + 0x18],	 0x0
	umul	%i0,	%o6,	%g7
loop_816:
	or	%g1,	%i1,	%o3
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x0c,	%f16
	andncc	%i7,	%i3,	%l0
	sdivx	%g4,	0x10FC,	%l3
	orncc	%o5,	0x105A,	%g5
	tvc	%icc,	0x6
	movrlez	%g6,	0x33F,	%i4
	fbu	%fcc2,	loop_817
	fmovrdgz	%o4,	%f28,	%f22
	alignaddr	%l5,	%o2,	%l4
	movpos	%xcc,	%o7,	%i6
loop_817:
	stbar
	fmuld8sux16	%f3,	%f24,	%f20
	brlz	%g2,	loop_818
	fmovrslez	%l2,	%f16,	%f22
	movrlez	%g3,	%i5,	%o1
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
loop_818:
	fmuld8ulx16	%f13,	%f15,	%f16
	fmovsvc	%icc,	%f18,	%f2
	smul	%l6,	%i2,	%l1
	orn	%i0,	%g7,	%g1
	sir	0x1D10
	st	%f23,	[%l7 + 0x5C]
	fmovrdlz	%i1,	%f6,	%f24
	sllx	%o3,	0x14,	%o6
	or	%i7,	%l0,	%g4
	edge16ln	%l3,	%o5,	%i3
	tgu	%icc,	0x0
	fmovsvc	%xcc,	%f16,	%f26
	fxnors	%f25,	%f30,	%f10
	movvs	%icc,	%g5,	%g6
	tneg	%xcc,	0x5
	set	0x58, %l3
	stxa	%i4,	[%l7 + %l3] 0x88
	array16	%l5,	%o4,	%l4
	sethi	0x0FB0,	%o2
	fmovsvs	%xcc,	%f10,	%f11
	add	%o7,	0x1177,	%i6
	fmovdgu	%icc,	%f22,	%f24
	and	%g2,	%g3,	%i5
	movrlez	%o1,	0x040,	%l2
	fbule,a	%fcc3,	loop_819
	nop
	setx loop_820, %l0, %l1
	jmpl %l1, %o0
	nop
	setx	loop_821,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%i2,	0x0B74,	%l1
loop_819:
	taddcc	%i0,	0x1C89,	%l6
loop_820:
	movl	%icc,	%g7,	%i1
loop_821:
	brgz,a	%g1,	loop_822
	nop
	setx	0x4CD3A46F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x15EADBD2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f24,	%f29
	smul	%o3,	0x061B,	%i7
	tsubcc	%o6,	%l0,	%g4
loop_822:
	fabsd	%f4,	%f8
	bl,pn	%icc,	loop_823
	movrlz	%l3,	0x1B1,	%i3
	addcc	%g5,	%g6,	%o5
	mova	%xcc,	%l5,	%i4
loop_823:
	nop
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x78] %asi,	%o4
	lduw	[%l7 + 0x10],	%l4
	alignaddrl	%o2,	%i6,	%g2
	nop
	setx	0x7E0D0835,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x3BD4EAC9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f0,	%f26
	nop
	setx	loop_824,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdgez	%g3,	%f18,	%f16
	bleu	%icc,	loop_825
	bne	%xcc,	loop_826
loop_824:
	edge32l	%i5,	%o1,	%o7
	wr	%g0,	0x22,	%asi
	stxa	%o0,	[%l7 + 0x48] %asi
	membar	#Sync
loop_825:
	fmovdvc	%icc,	%f14,	%f22
loop_826:
	fbue,a	%fcc3,	loop_827
	bcc,pt	%xcc,	loop_828
	movcc	%xcc,	%l2,	%l1
	array16	%i0,	%l6,	%i2
loop_827:
	srl	%i1,	0x11,	%g7
loop_828:
	fnors	%f22,	%f29,	%f7
	fmul8x16	%f25,	%f6,	%f16
	xnorcc	%o3,	%i7,	%o6
	fbg	%fcc2,	loop_829
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g1,	%g4,	%l0
	array32	%l3,	%g5,	%i3
loop_829:
	xor	%g6,	0x080B,	%l5
	tle	%xcc,	0x4
	tsubcctv	%i4,	0x1748,	%o4
	fnot2	%f20,	%f26
	movvs	%icc,	%l4,	%o5
	fnot1	%f28,	%f22
	subccc	%o2,	%g2,	%g3
	add	%i6,	0x0CC4,	%i5
	flush	%l7 + 0x4C
	tne	%icc,	0x6
	subcc	%o7,	%o1,	%o0
	ldx	[%l7 + 0x48],	%l2
	prefetch	[%l7 + 0x28],	 0x1
	fmovde	%icc,	%f28,	%f28
	tneg	%icc,	0x6
	fcmpgt32	%f22,	%f2,	%i0
	tvs	%icc,	0x6
	tsubcc	%l1,	%l6,	%i2
	tl	%icc,	0x6
	edge8ln	%g7,	%i1,	%o3
	stb	%i7,	[%l7 + 0x5E]
	nop
	setx	0xD1428C65807D685A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x46A43EC9C21FED91,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f20,	%f14
	nop
	setx	0x4CC8354AA0599B35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tleu	%xcc,	0x3
	movg	%xcc,	%g1,	%g4
	umulcc	%o6,	%l0,	%l3
	umulcc	%i3,	%g5,	%l5
	movl	%icc,	%g6,	%o4
	sdivx	%i4,	0x0FD6,	%o5
	movleu	%icc,	%l4,	%g2
	fmul8x16au	%f16,	%f4,	%f2
	movrgz	%o2,	0x2CD,	%g3
	udivx	%i6,	0x1BA2,	%i5
	tsubcc	%o1,	%o0,	%o7
	movgu	%icc,	%l2,	%i0
	nop
	fitos	%f4,	%f1
	fstox	%f1,	%f18
	tle	%xcc,	0x0
	sdivcc	%l6,	0x17A7,	%i2
	fmul8x16	%f6,	%f4,	%f14
	fbul,a	%fcc2,	loop_830
	fbule	%fcc1,	loop_831
	orn	%l1,	%g7,	%i1
	srax	%i7,	%o3,	%g1
loop_830:
	ldd	[%l7 + 0x28],	%g4
loop_831:
	ld	[%l7 + 0x6C],	%f22
	tle	%xcc,	0x1
	fmul8x16au	%f1,	%f3,	%f0
	add	%l0,	%l3,	%o6
	addccc	%g5,	%i3,	%g6
	array32	%l5,	%o4,	%i4
	tne	%icc,	0x4
	tl	%icc,	0x3
	udivx	%l4,	0x0308,	%o5
	nop
	fitod	%f7,	%f30
	te	%icc,	0x5
	taddcc	%o2,	0x06AF,	%g3
	and	%i6,	%g2,	%i5
	addccc	%o0,	0x0525,	%o1
	set	0x50, %o6
	prefetcha	[%l7 + %o6] 0x04,	 0x1
	fbg,a	%fcc3,	loop_832
	sth	%l2,	[%l7 + 0x60]
	fbne	%fcc2,	loop_833
	array16	%i0,	%l6,	%l1
loop_832:
	flush	%l7 + 0x68
	nop
	setx	0x0192989842A85D05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x050FE005153126AB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f28,	%f22
loop_833:
	orncc	%g7,	%i2,	%i1
	ble,a	%icc,	loop_834
	fandnot1s	%f30,	%f1,	%f13
	set	0x7C, %g2
	swapa	[%l7 + %g2] 0x89,	%o3
loop_834:
	movrne	%i7,	0x357,	%g1
	tg	%xcc,	0x6
	fmovsne	%xcc,	%f25,	%f3
	te	%xcc,	0x0
	xnor	%g4,	%l0,	%l3
	tcs	%xcc,	0x5
	tsubcctv	%o6,	%g5,	%i3
	tneg	%icc,	0x3
	ble,a	loop_835
	movrne	%g6,	%o4,	%l5
	smulcc	%l4,	0x0D07,	%i4
	edge8	%o2,	%g3,	%i6
loop_835:
	bl	%icc,	loop_836
	fble,a	%fcc2,	loop_837
	fmovdn	%icc,	%f31,	%f27
	fbn,a	%fcc3,	loop_838
loop_836:
	edge16l	%o5,	%i5,	%g2
loop_837:
	movrgez	%o1,	0x087,	%o7
	sll	%l2,	%i0,	%l6
loop_838:
	tgu	%xcc,	0x4
	tle	%xcc,	0x7
	movl	%icc,	%l1,	%g7
	xor	%o0,	%i1,	%i2
	tn	%xcc,	0x6
	bcc,a,pn	%xcc,	loop_839
	bne	%icc,	loop_840
	taddcc	%o3,	0x0EC9,	%g1
	edge32	%i7,	%g4,	%l3
loop_839:
	sll	%l0,	%g5,	%i3
loop_840:
	movpos	%icc,	%g6,	%o4
	call	loop_841
	ta	%xcc,	0x3
	edge32n	%l5,	%l4,	%i4
	movl	%xcc,	%o2,	%o6
loop_841:
	mulx	%g3,	%o5,	%i6
	fone	%f22
	tn	%xcc,	0x7
	andcc	%i5,	%o1,	%g2
	subcc	%l2,	0x1F08,	%i0
	swap	[%l7 + 0x44],	%l6
	andncc	%l1,	%g7,	%o7
	sdivcc	%i1,	0x1AB1,	%i2
	nop
	fitod	%f0,	%f24
	fdtoi	%f24,	%f11
	movrgz	%o3,	%g1,	%i7
	nop
	setx	0x110F8CE1319178ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xC623B23E1E268DC3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f12,	%f30
	movg	%xcc,	%o0,	%l3
	nop
	setx	loop_842,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srax	%g4,	%g5,	%i3
	tge	%xcc,	0x7
	sll	%l0,	0x15,	%g6
loop_842:
	movrlez	%l5,	%l4,	%o4
	orcc	%i4,	%o6,	%g3
	edge8ln	%o2,	%i6,	%i5
	movge	%icc,	%o1,	%o5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l2
	tle	%xcc,	0x5
	sdivcc	%g2,	0x1474,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%l6,	0x0724,	%g7
	movneg	%icc,	%l1,	%o7
	tneg	%icc,	0x3
	tleu	%icc,	0x0
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%i2
	mulx	%o3,	0x0DE2,	%g1
	fmovspos	%icc,	%f30,	%f11
	fmovrsne	%i7,	%f13,	%f10
	movrgez	%o0,	0x367,	%i1
	fmovda	%xcc,	%f10,	%f18
	movre	%l3,	%g4,	%g5
	tgu	%xcc,	0x4
	tpos	%icc,	0x6
	add	%i3,	%g6,	%l5
	udivcc	%l0,	0x0E62,	%l4
	sir	0x1BFA
	movpos	%xcc,	%i4,	%o4
	fmovdpos	%xcc,	%f6,	%f16
	faligndata	%f28,	%f22,	%f4
	movgu	%xcc,	%o6,	%o2
	move	%xcc,	%i6,	%g3
	fmuld8ulx16	%f10,	%f0,	%f4
	edge8ln	%o1,	%i5,	%l2
	nop
	setx	0x02F2234B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f18
	movrgez	%o5,	0x2AA,	%i0
	array16	%g2,	%l6,	%g7
	movneg	%icc,	%l1,	%o7
	taddcctv	%o3,	0x1867,	%g1
	fbo	%fcc2,	loop_843
	movn	%icc,	%i7,	%i2
	movneg	%xcc,	%i1,	%o0
	or	%l3,	%g5,	%g4
loop_843:
	membar	0x43
	set	0x78, %g7
	prefetcha	[%l7 + %g7] 0x11,	 0x0
	fsrc1s	%f14,	%f13
	bcc	%icc,	loop_844
	stw	%l5,	[%l7 + 0x50]
	fands	%f12,	%f7,	%f26
	nop
	setx	0xC1AE254A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x09EABDA9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f22,	%f23
loop_844:
	lduw	[%l7 + 0x54],	%l0
	or	%l4,	0x1BE3,	%i4
	and	%o4,	%o6,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x24, %l2
	lda	[%l7 + %l2] 0x18,	%f13
	movpos	%icc,	%g6,	%i6
	array16	%o1,	%i5,	%l2
	orncc	%o5,	%i0,	%g3
	fmovrdgz	%l6,	%f18,	%f24
	bgu,pt	%icc,	loop_845
	brnz	%g2,	loop_846
	addc	%l1,	%g7,	%o7
	tgu	%icc,	0x6
loop_845:
	udivcc	%g1,	0x0BDF,	%i7
loop_846:
	tsubcctv	%o3,	%i2,	%o0
	brz,a	%l3,	loop_847
	nop
	setx	0x29EC6263,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x235547EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f25,	%f0
	movneg	%xcc,	%g5,	%g4
	umulcc	%i1,	%i3,	%l0
loop_847:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%l4
	fmovdl	%xcc,	%f16,	%f22
	fpsub16	%f26,	%f18,	%f28
	sll	%i4,	%o4,	%l5
	edge32	%o6,	%o2,	%g6
	taddcc	%o1,	%i6,	%l2
	fmovscc	%icc,	%f17,	%f8
	movvs	%icc,	%i5,	%i0
	movcc	%icc,	%g3,	%l6
	movrlez	%g2,	%o5,	%g7
	and	%l1,	%o7,	%g1
	bge,pt	%xcc,	loop_848
	fmovdn	%xcc,	%f2,	%f21
	andcc	%o3,	%i7,	%i2
	taddcctv	%l3,	0x0721,	%o0
loop_848:
	movl	%icc,	%g4,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc0,	loop_849
	addccc	%g5,	0x0162,	%i3
	tn	%icc,	0x3
	sllx	%l0,	%l4,	%i4
loop_849:
	fcmpne32	%f30,	%f4,	%o4
	fbg	%fcc3,	loop_850
	fbl	%fcc1,	loop_851
	fpack32	%f24,	%f14,	%f16
	movre	%l5,	0x293,	%o6
loop_850:
	array16	%g6,	%o2,	%o1
loop_851:
	bgu	%icc,	loop_852
	fbug,a	%fcc0,	loop_853
	movg	%xcc,	%l2,	%i6
	bgu,a,pt	%xcc,	loop_854
loop_852:
	udivx	%i5,	0x11C7,	%g3
loop_853:
	lduw	[%l7 + 0x7C],	%i0
	bn,a,pn	%xcc,	loop_855
loop_854:
	stbar
	fpack32	%f28,	%f24,	%f4
	stx	%g2,	[%l7 + 0x18]
loop_855:
	fsrc2s	%f27,	%f20
	fmul8x16au	%f26,	%f14,	%f30
	array8	%l6,	%o5,	%g7
	lduh	[%l7 + 0x2C],	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x1
	tg	%icc,	0x6
	tcs	%xcc,	0x2
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f14
	fmul8sux16	%f8,	%f28,	%f26
	subccc	%g1,	%o3,	%o7
	addc	%i7,	0x035D,	%i2
	nop
	setx	0x78D287DF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xF7FD89B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f7,	%f26
	edge16ln	%o0,	%l3,	%g4
	edge32	%i1,	%i3,	%g5
	xor	%l4,	%l0,	%i4
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x68] %asi,	%o4
	set	0x7C, %o3
	lda	[%l7 + %o3] 0x81,	%f31
	xorcc	%o6,	0x1BC3,	%g6
	brgz	%l5,	loop_856
	fba	%fcc3,	loop_857
	edge32l	%o2,	%l2,	%i6
	fbn	%fcc2,	loop_858
loop_856:
	bcs,pt	%icc,	loop_859
loop_857:
	mulscc	%o1,	%i5,	%g3
	fpadd16s	%f5,	%f18,	%f14
loop_858:
	sll	%i0,	%l6,	%o5
loop_859:
	brlz	%g2,	loop_860
	srax	%g7,	%l1,	%g1
	tvc	%icc,	0x7
	bne	loop_861
loop_860:
	taddcctv	%o7,	0x0301,	%i7
	tg	%icc,	0x3
	faligndata	%f12,	%f22,	%f14
loop_861:
	movre	%o3,	%i2,	%o0
	andcc	%l3,	0x18A0,	%g4
	xor	%i1,	%g5,	%l4
	movl	%xcc,	%i3,	%l0
	movneg	%xcc,	%i4,	%o4
	orcc	%g6,	0x067A,	%o6
	ldstub	[%l7 + 0x58],	%l5
	fxor	%f16,	%f6,	%f12
	tsubcc	%o2,	0x14D9,	%l2
	wr	%g0,	0x80,	%asi
	stha	%i6,	[%l7 + 0x34] %asi
	and	%i5,	%o1,	%i0
	fmovdcs	%xcc,	%f30,	%f31
	movg	%icc,	%g3,	%l6
	fmul8x16al	%f24,	%f30,	%f6
	bge,a,pn	%xcc,	loop_862
	or	%g2,	%g7,	%o5
	swap	[%l7 + 0x6C],	%g1
	tn	%icc,	0x0
loop_862:
	pdist	%f18,	%f18,	%f14
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%l1
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
	popc	%i7,	%o3
	fmovdcs	%xcc,	%f10,	%f20
	st	%f4,	[%l7 + 0x1C]
loop_863:
	fbe,a	%fcc2,	loop_864
	bcc,a,pt	%icc,	loop_865
	tcc	%icc,	0x1
	addc	%o7,	%i2,	%l3
loop_864:
	fmovs	%f20,	%f10
loop_865:
	brnz	%g4,	loop_866
	movcs	%icc,	%o0,	%g5
	fpack16	%f8,	%f5
	subcc	%i1,	0x0DDA,	%i3
loop_866:
	fxor	%f0,	%f8,	%f16
	movleu	%xcc,	%l0,	%l4
	fbl,a	%fcc3,	loop_867
	be,pn	%xcc,	loop_868
	edge32ln	%i4,	%g6,	%o6
	fmovdge	%xcc,	%f27,	%f16
loop_867:
	taddcctv	%o4,	%l5,	%o2
loop_868:
	sdiv	%l2,	0x1209,	%i6
	movcc	%xcc,	%i5,	%o1
	fmovsvs	%icc,	%f11,	%f30
	subccc	%g3,	%l6,	%g2
	tge	%xcc,	0x1
	fabss	%f5,	%f21
	movn	%xcc,	%g7,	%o5
	orn	%g1,	0x0569,	%l1
	orncc	%i7,	%i0,	%o3
	fmovdcs	%xcc,	%f7,	%f14
	add	%o7,	0x170C,	%l3
	movle	%xcc,	%i2,	%o0
	array8	%g5,	%g4,	%i1
	and	%i3,	0x073F,	%l0
	bleu,pn	%icc,	loop_869
	edge32	%l4,	%g6,	%i4
	smulcc	%o6,	%l5,	%o2
	brgz,a	%o4,	loop_870
loop_869:
	fmovrse	%i6,	%f4,	%f18
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i5
loop_870:
	andncc	%l2,	%g3,	%o1
	fornot1	%f28,	%f30,	%f16
	set	0x78, %o2
	lduba	[%l7 + %o2] 0x80,	%g2
	sllx	%l6,	%o5,	%g7
	movrlez	%l1,	0x052,	%i7
	brnz	%i0,	loop_871
	edge32	%o3,	%o7,	%g1
	edge16l	%l3,	%i2,	%g5
	tvc	%xcc,	0x2
loop_871:
	sdivx	%o0,	0x07E9,	%g4
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%l0
	movcc	%icc,	%i1,	%g6
	bgu	loop_872
	te	%icc,	0x1
	nop
	fitos	%f0,	%f31
	fstod	%f31,	%f12
	set	0x20, %g4
	swapa	[%l7 + %g4] 0x80,	%i4
loop_872:
	udivcc	%o6,	0x001C,	%l4
	fone	%f12
	movne	%xcc,	%l5,	%o2
	tle	%xcc,	0x3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%i5
	fmovrde	%i6,	%f2,	%f12
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x7C] %asi,	%l2
	movre	%g3,	%o1,	%g2
	movvs	%icc,	%l6,	%g7
	set	0x50, %i7
	ldswa	[%l7 + %i7] 0x10,	%l1
	movle	%xcc,	%o5,	%i0
	tne	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x78] %asi,	%i7
	brgez,a	%o7,	loop_873
	sdivx	%g1,	0x0189,	%l3
	fmovde	%icc,	%f30,	%f15
	alignaddr	%o3,	%g5,	%i2
loop_873:
	tgu	%xcc,	0x3
	edge32n	%g4,	%o0,	%l0
	edge8	%i1,	%g6,	%i3
	tge	%icc,	0x4
	movg	%xcc,	%i4,	%l4
	srl	%o6,	0x11,	%l5
	bvc,a,pt	%xcc,	loop_874
	xor	%o4,	0x0181,	%i5
	popc	%i6,	%l2
	taddcc	%g3,	%o2,	%o1
loop_874:
	sethi	0x02DA,	%l6
	andcc	%g2,	%g7,	%l1
	tg	%xcc,	0x4
	ldstub	[%l7 + 0x6A],	%o5
	bleu,a,pt	%xcc,	loop_875
	edge32n	%i7,	%o7,	%g1
	fbl	%fcc0,	loop_876
	srl	%i0,	%l3,	%g5
loop_875:
	tgu	%icc,	0x7
	ta	%xcc,	0x3
loop_876:
	movcs	%xcc,	%i2,	%o3
	movle	%icc,	%g4,	%o0
	andn	%i1,	%l0,	%g6
	addcc	%i3,	0x1C14,	%l4
	tvc	%icc,	0x5
	fbn,a	%fcc0,	loop_877
	fmovsl	%xcc,	%f28,	%f10
	tsubcctv	%i4,	0x05DE,	%o6
	fnot2	%f18,	%f14
loop_877:
	bleu,pn	%icc,	loop_878
	array8	%o4,	%l5,	%i6
	fandnot2s	%f19,	%f20,	%f0
	set	0x54, %o1
	ldsha	[%l7 + %o1] 0x88,	%l2
loop_878:
	nop
	setx	0xAB4184CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f2
	fble	%fcc3,	loop_879
	tge	%xcc,	0x0
	tl	%xcc,	0x1
	movcs	%icc,	%i5,	%g3
loop_879:
	movg	%icc,	%o2,	%l6
	ba,pt	%xcc,	loop_880
	movcc	%xcc,	%g2,	%g7
	fbge,a	%fcc2,	loop_881
	movrlez	%l1,	0x1E6,	%o1
loop_880:
	subccc	%o5,	0x1258,	%i7
	andcc	%o7,	0x1CE4,	%g1
loop_881:
	add	%l3,	0x0B63,	%i0
	fxors	%f11,	%f27,	%f20
	fbu	%fcc3,	loop_882
	movg	%icc,	%i2,	%g5
	and	%g4,	0x1858,	%o3
	std	%f30,	[%l7 + 0x68]
loop_882:
	sllx	%o0,	0x0B,	%i1
	pdist	%f20,	%f2,	%f4
	udivcc	%g6,	0x11F8,	%i3
	sdivcc	%l0,	0x078C,	%i4
	fpadd32s	%f19,	%f1,	%f11
	brlz	%o6,	loop_883
	tleu	%xcc,	0x2
	ta	%xcc,	0x3
	movrgez	%l4,	%o4,	%l5
loop_883:
	fmovrsgez	%i6,	%f23,	%f11
	fmul8x16au	%f27,	%f23,	%f22
	nop
	set	0x70, %l6
	ldsb	[%l7 + %l6],	%i5
	udivx	%g3,	0x1E7F,	%l2
	fmovsa	%icc,	%f22,	%f12
	brgz	%o2,	loop_884
	edge32	%g2,	%g7,	%l1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o1
loop_884:
	tne	%xcc,	0x2
	ldub	[%l7 + 0x17],	%l6
	bne,pt	%xcc,	loop_885
	alignaddrl	%i7,	%o7,	%g1
	fxnor	%f10,	%f22,	%f22
	movle	%icc,	%o5,	%l3
loop_885:
	orncc	%i2,	0x1162,	%i0
	edge8l	%g4,	%g5,	%o0
	bge,a	loop_886
	fnot1s	%f9,	%f17
	move	%icc,	%o3,	%i1
	fandnot1	%f16,	%f20,	%f18
loop_886:
	nop
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x0c
	sethi	0x03AE,	%g6
	tgu	%icc,	0x3
	fornot2s	%f31,	%f21,	%f21
	fandnot2	%f4,	%f16,	%f12
	fsrc2	%f28,	%f2
	fcmple32	%f4,	%f28,	%l0
	fornot2	%f30,	%f12,	%f2
	tleu	%xcc,	0x7
	edge8ln	%i4,	%i3,	%l4
	sdivx	%o6,	0x098F,	%o4
	tgu	%xcc,	0x2
	nop
	setx	0xE5F69370,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x4E91FCDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f4,	%f7
	popc	0x0BE3,	%l5
	xnorcc	%i5,	%i6,	%l2
	ble,a,pn	%xcc,	loop_887
	xnor	%g3,	%o2,	%g2
	array8	%l1,	%g7,	%o1
	fbuge	%fcc3,	loop_888
loop_887:
	taddcctv	%i7,	0x028A,	%o7
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l6,	%o5
loop_888:
	tgu	%icc,	0x0
	edge8n	%g1,	%l3,	%i2
	orn	%g4,	0x1AB5,	%g5
	or	%o0,	%i0,	%o3
	xorcc	%i1,	%g6,	%i4
	srlx	%i3,	0x07,	%l0
	mulscc	%l4,	%o4,	%o6
	umulcc	%i5,	%l5,	%l2
	fbu	%fcc0,	loop_889
	xorcc	%i6,	%o2,	%g3
	fpackfix	%f14,	%f18
	be,a,pt	%icc,	loop_890
loop_889:
	fands	%f12,	%f6,	%f25
	movge	%xcc,	%l1,	%g2
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x14] %asi,	%o1
loop_890:
	fmovsa	%xcc,	%f17,	%f15
	movl	%xcc,	%i7,	%o7
	movleu	%xcc,	%l6,	%o5
	fnand	%f30,	%f24,	%f0
	fmovrse	%g1,	%f28,	%f19
	movpos	%xcc,	%g7,	%i2
	bvs,pt	%xcc,	loop_891
	fnot1s	%f23,	%f19
	movl	%xcc,	%l3,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_891:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x54] %asi,	%o0
	ldsw	[%l7 + 0x3C],	%g5
	and	%o3,	0x012D,	%i1
	fcmple32	%f8,	%f26,	%g6
	popc	0x0945,	%i4
	ldsh	[%l7 + 0x0E],	%i0
	movre	%l0,	%l4,	%i3
	fmovsn	%icc,	%f12,	%f15
	sub	%o4,	0x179B,	%o6
	movrlz	%l5,	0x12F,	%l2
	bcs	loop_892
	srlx	%i5,	%i6,	%o2
	edge16ln	%l1,	%g3,	%o1
	addc	%g2,	%o7,	%i7
loop_892:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x74] %asi,	%o5
	movcc	%xcc,	%g1,	%g7
	edge8	%i2,	%l6,	%g4
	lduh	[%l7 + 0x1C],	%l3
	wr	%g0,	0x19,	%asi
	stwa	%g5,	[%l7 + 0x5C] %asi
	umulcc	%o3,	%i1,	%g6
	tg	%xcc,	0x1
	ldstub	[%l7 + 0x50],	%o0
	srax	%i4,	0x0E,	%l0
	subcc	%l4,	0x0A79,	%i3
	nop
	setx loop_893, %l0, %l1
	jmpl %l1, %o4
	tneg	%icc,	0x1
	wr	%g0,	0x81,	%asi
	stwa	%i0,	[%l7 + 0x24] %asi
loop_893:
	pdist	%f0,	%f6,	%f10
	movge	%xcc,	%l5,	%o6
	mulscc	%i5,	0x199C,	%i6
	nop
	fitod	%f20,	%f18
	fmovscs	%xcc,	%f22,	%f25
	sdiv	%l2,	0x166C,	%o2
	fbl,a	%fcc0,	loop_894
	movneg	%xcc,	%g3,	%o1
	edge8	%l1,	%o7,	%i7
	call	loop_895
loop_894:
	movn	%icc,	%o5,	%g1
	set	0x34, %i5
	lduwa	[%l7 + %i5] 0x14,	%g2
loop_895:
	xnorcc	%g7,	%i2,	%g4
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	and	%l6,	0x1DF6,	%l3
	fmul8x16al	%f13,	%f23,	%f18
	movne	%icc,	%o3,	%i1
	tcs	%xcc,	0x1
	ldsb	[%l7 + 0x7C],	%g5
	fmovdvc	%icc,	%f1,	%f16
	bl	%icc,	loop_896
	edge8n	%g6,	%i4,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l4,	0x1097,	%o0
loop_896:
	fsrc1	%f16,	%f24
	sub	%i3,	0x0716,	%o4
	array32	%i0,	%l5,	%o6
	orn	%i5,	0x0F0D,	%l2
	mulscc	%i6,	0x1C50,	%o2
	xnor	%g3,	%l1,	%o1
	fmovdl	%xcc,	%f1,	%f6
	movle	%xcc,	%o7,	%o5
	movre	%g1,	%g2,	%i7
	nop
	set	0x58, %i6
	stx	%g7,	[%l7 + %i6]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f16,	%f0
	fexpand	%f29,	%f26
	xnor	%i2,	%l6,	%g4
	array16	%o3,	%i1,	%l3
	movvs	%icc,	%g5,	%i4
	sllx	%g6,	%l0,	%l4
	ta	%xcc,	0x6
	te	%xcc,	0x7
	fmovda	%xcc,	%f23,	%f19
	sdiv	%i3,	0x1FF7,	%o4
	fnands	%f24,	%f29,	%f29
	ld	[%l7 + 0x5C],	%f1
	smul	%i0,	%l5,	%o6
	movge	%icc,	%o0,	%i5
	array16	%i6,	%o2,	%g3
	xorcc	%l1,	%o1,	%l2
	fcmpne16	%f16,	%f0,	%o7
	fbug	%fcc1,	loop_897
	sdivx	%g1,	0x0702,	%o5
	brlez,a	%i7,	loop_898
	fbn	%fcc2,	loop_899
loop_897:
	addc	%g2,	0x0423,	%i2
	edge32n	%g7,	%l6,	%o3
loop_898:
	tneg	%xcc,	0x2
loop_899:
	tvs	%xcc,	0x2
	sra	%g4,	0x03,	%l3
	movg	%icc,	%g5,	%i4
	xor	%i1,	0x19B8,	%l0
	movrlz	%g6,	0x3E3,	%i3
	tvc	%xcc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l4,	%i0,	%o4
	edge8n	%o6,	%l5,	%i5
	array32	%i6,	%o2,	%o0
	stw	%g3,	[%l7 + 0x3C]
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
	taddcc	%l1,	%l2,	%o1
	movne	%icc,	%o7,	%o5
	fnors	%f30,	%f4,	%f21
loop_900:
	xnorcc	%i7,	%g2,	%g1
	edge32l	%i2,	%l6,	%g7
	nop
	setx	0xB054DC88,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	fnot1	%f26,	%f26
	ta	%xcc,	0x4
	xor	%o3,	%g4,	%g5
	tcs	%xcc,	0x4
	ble	loop_901
	fmovsneg	%icc,	%f25,	%f13
	srl	%i4,	0x08,	%l3
	tge	%icc,	0x1
loop_901:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	fcmpeq32	%f28,	%f28,	%l0
	mulscc	%g6,	0x122A,	%l4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x38] %asi,	%i3
	nop
	setx	0xFC86FD6B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x751E0EF7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f1,	%f15
	fbule,a	%fcc2,	loop_902
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x64],	%i0
	ldub	[%l7 + 0x7D],	%o6
loop_902:
	tvc	%icc,	0x6
	fbg	%fcc0,	loop_903
	alignaddr	%l5,	%o4,	%i6
	movrlez	%o2,	%o0,	%i5
	te	%icc,	0x3
loop_903:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%l1,	%l2
	fornot1	%f16,	%f10,	%f2
	fpsub16s	%f31,	%f28,	%f25
	set	0x62, %l0
	ldstuba	[%l7 + %l0] 0x11,	%g3
	brlez	%o1,	loop_904
	alignaddr	%o7,	%i7,	%g2
	fpsub32s	%f8,	%f0,	%f3
	movcs	%icc,	%g1,	%o5
loop_904:
	tvs	%icc,	0x1
	addc	%l6,	0x0037,	%i2
	movneg	%icc,	%o3,	%g7
	bpos,a	loop_905
	fnot2	%f16,	%f14
	ldsb	[%l7 + 0x78],	%g4
	movre	%i4,	0x3DE,	%g5
loop_905:
	edge32	%l3,	%l0,	%g6
	fnot1	%f24,	%f22
	smul	%l4,	%i1,	%i3
	tpos	%icc,	0x0
	bcs,pt	%xcc,	loop_906
	xnorcc	%o6,	0x0DE4,	%l5
	nop
	setx loop_907, %l0, %l1
	jmpl %l1, %o4
	fbge	%fcc3,	loop_908
loop_906:
	fblg	%fcc0,	loop_909
	edge32l	%i0,	%o2,	%i6
loop_907:
	udiv	%i5,	0x129A,	%l1
loop_908:
	tcs	%icc,	0x6
loop_909:
	tn	%icc,	0x5
	bleu,pt	%xcc,	loop_910
	fmovrsne	%o0,	%f28,	%f30
	sdivcc	%g3,	0x0F95,	%o1
	movn	%xcc,	%o7,	%l2
loop_910:
	nop
	setx	loop_911,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brlz	%g2,	loop_912
	fmovrdne	%i7,	%f30,	%f10
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x0C] %asi,	%o5
loop_911:
	udiv	%g1,	0x17C6,	%i2
loop_912:
	tleu	%icc,	0x3
	fmovdg	%xcc,	%f29,	%f26
	tle	%xcc,	0x0
	sub	%o3,	%g7,	%g4
	udivcc	%l6,	0x014F,	%g5
	fcmpgt32	%f10,	%f30,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug,a	%fcc2,	loop_913
	ldd	[%l7 + 0x70],	%i4
	sub	%l0,	0x16A7,	%l4
	sth	%g6,	[%l7 + 0x5A]
loop_913:
	edge32ln	%i3,	%o6,	%l5
	movcs	%icc,	%i1,	%i0
	set	0x60, %g5
	lduwa	[%l7 + %g5] 0x04,	%o4
	swap	[%l7 + 0x7C],	%i6
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x2A] %asi,	%o2
	fmovs	%f8,	%f20
	edge32n	%l1,	%i5,	%g3
	movvc	%icc,	%o1,	%o7
	brz	%l2,	loop_914
	fcmple32	%f0,	%f20,	%g2
	movleu	%icc,	%o0,	%i7
	andcc	%g1,	%o5,	%i2
loop_914:
	ldstub	[%l7 + 0x17],	%g7
	addccc	%o3,	0x0989,	%l6
	udivcc	%g4,	0x18FC,	%g5
	edge8	%i4,	%l0,	%l4
	udivcc	%l3,	0x03F1,	%i3
	edge8	%o6,	%g6,	%i1
	tsubcctv	%l5,	%i0,	%o4
	stw	%i6,	[%l7 + 0x7C]
	faligndata	%f2,	%f10,	%f16
	stw	%o2,	[%l7 + 0x44]
	fmovrde	%l1,	%f16,	%f30
	ldub	[%l7 + 0x1C],	%g3
	fbg	%fcc3,	loop_915
	sra	%o1,	%o7,	%i5
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x19] %asi,	%l2
loop_915:
	array8	%g2,	%i7,	%o0
	wr	%g0,	0xe2,	%asi
	stwa	%o5,	[%l7 + 0x30] %asi
	membar	#Sync
	edge32l	%i2,	%g7,	%g1
	fblg	%fcc2,	loop_916
	nop
	set	0x57, %i1
	stb	%o3,	[%l7 + %i1]
	set	0x54, %i0
	lda	[%l7 + %i0] 0x0c,	%f23
loop_916:
	edge16n	%l6,	%g5,	%i4
	edge16	%l0,	%l4,	%g4
	fpack32	%f14,	%f28,	%f26
	ta	%icc,	0x6
	set	0x64, %i3
	stha	%i3,	[%l7 + %i3] 0x04
	brgez	%l3,	loop_917
	subcc	%g6,	0x1424,	%i1
	umul	%o6,	%l5,	%o4
	smul	%i6,	%o2,	%l1
loop_917:
	popc	%g3,	%o1
	udivcc	%o7,	0x16A4,	%i0
	bcs,pt	%icc,	loop_918
	bne,a	%icc,	loop_919
	fmovd	%f20,	%f4
	sth	%l2,	[%l7 + 0x08]
loop_918:
	call	loop_920
loop_919:
	ble,pt	%icc,	loop_921
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f26
	fxtod	%f26,	%f10
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i5
loop_920:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_921:
	edge8ln	%i7,	%g2,	%o0
	edge32ln	%o5,	%i2,	%g1
	fbne	%fcc0,	loop_922
	tl	%icc,	0x6
	edge8ln	%o3,	%g7,	%l6
	alignaddr	%g5,	%i4,	%l0
loop_922:
	fnor	%f20,	%f28,	%f30
	brlz	%l4,	loop_923
	tvc	%icc,	0x3
	ldstub	[%l7 + 0x26],	%i3
	movg	%icc,	%g4,	%l3
loop_923:
	movne	%icc,	%i1,	%g6
	add	%o6,	0x18C3,	%l5
	fmovdle	%xcc,	%f26,	%f23
	fbg,a	%fcc0,	loop_924
	fnands	%f2,	%f8,	%f29
	ld	[%l7 + 0x14],	%f7
	tg	%xcc,	0x6
loop_924:
	fbne	%fcc1,	loop_925
	array16	%i6,	%o2,	%o4
	movl	%icc,	%l1,	%o1
	edge16n	%o7,	%i0,	%l2
loop_925:
	srl	%g3,	0x03,	%i7
	fmovsleu	%icc,	%f21,	%f0
	fmovsneg	%xcc,	%f8,	%f13
	stx	%i5,	[%l7 + 0x08]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x38],	%g2
	umulcc	%o0,	%i2,	%g1
	movcs	%icc,	%o5,	%o3
	movre	%g7,	0x2E3,	%l6
	fbg,a	%fcc1,	loop_926
	fbo	%fcc3,	loop_927
	bl,a	%xcc,	loop_928
	fbu	%fcc2,	loop_929
loop_926:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_927:
	te	%xcc,	0x7
loop_928:
	ba,pn	%icc,	loop_930
loop_929:
	subcc	%g5,	%l0,	%i4
	bneg,a	%icc,	loop_931
	movrlz	%l4,	0x194,	%g4
loop_930:
	for	%f18,	%f26,	%f16
	edge16n	%l3,	%i3,	%i1
loop_931:
	fblg,a	%fcc3,	loop_932
	stb	%g6,	[%l7 + 0x73]
	fbu,a	%fcc2,	loop_933
	ba	loop_934
loop_932:
	tne	%icc,	0x2
	ldsh	[%l7 + 0x7C],	%o6
loop_933:
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
loop_934:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x7
	tgu	%icc,	0x6
loop_935:
	fmovsneg	%icc,	%f1,	%f16
	movrne	%i6,	%l5,	%o4
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x38] %asi,	%o2
	tsubcctv	%l1,	%o1,	%o7
	and	%i0,	%g3,	%i7
	fmul8ulx16	%f20,	%f12,	%f18
	tneg	%xcc,	0x3
	subccc	%i5,	%g2,	%l2
	nop
	fitos	%f10,	%f1
	fstoi	%f1,	%f2
	edge32n	%i2,	%o0,	%g1
	set	0x70, %o0
	swapa	[%l7 + %o0] 0x89,	%o3
	subc	%o5,	0x147F,	%g7
	sir	0x10ED
	array16	%g5,	%l0,	%i4
	tgu	%xcc,	0x3
	fmovsl	%icc,	%f11,	%f11
	fmovscs	%icc,	%f27,	%f12
	tn	%icc,	0x1
	movn	%xcc,	%l4,	%l6
	ba	loop_936
	move	%icc,	%g4,	%i3
	orncc	%i1,	0x0A6E,	%g6
	tge	%icc,	0x1
loop_936:
	edge16l	%l3,	%i6,	%l5
	sir	0x1127
	ble	%xcc,	loop_937
	sdivx	%o6,	0x120A,	%o2
	sdivx	%l1,	0x0C72,	%o1
	smul	%o7,	0x1B2F,	%i0
loop_937:
	ldd	[%l7 + 0x20],	%o4
	movvc	%icc,	%g3,	%i5
	bge	%xcc,	loop_938
	tgu	%xcc,	0x1
	edge32ln	%i7,	%l2,	%g2
	movle	%icc,	%o0,	%g1
loop_938:
	fandnot2s	%f24,	%f16,	%f17
	subc	%i2,	0x0497,	%o3
	movleu	%icc,	%o5,	%g5
	movrgez	%g7,	0x28C,	%l0
	tneg	%icc,	0x1
	nop
	set	0x74, %g1
	lduh	[%l7 + %g1],	%i4
	movg	%xcc,	%l4,	%g4
	pdist	%f20,	%f20,	%f18
	fmovrsne	%l6,	%f26,	%f27
	brgz	%i3,	loop_939
	fmovda	%xcc,	%f16,	%f3
	sdivcc	%i1,	0x01FF,	%g6
	bneg	loop_940
loop_939:
	te	%xcc,	0x1
	fmovsge	%xcc,	%f6,	%f27
	fmovrslez	%l3,	%f6,	%f17
loop_940:
	movre	%l5,	%o6,	%i6
	nop
	set	0x3E, %i2
	stb	%l1,	[%l7 + %i2]
	sra	%o1,	%o2,	%o7
	fmul8ulx16	%f4,	%f18,	%f28
	fmovsneg	%icc,	%f13,	%f18
	taddcc	%o4,	%i0,	%g3
	brgez,a	%i7,	loop_941
	tleu	%xcc,	0x2
	xnorcc	%i5,	0x06AB,	%l2
	ba,a	%icc,	loop_942
loop_941:
	fmovde	%icc,	%f8,	%f6
	srlx	%g2,	0x16,	%g1
	nop
	fitos	%f2,	%f10
	fstod	%f10,	%f24
loop_942:
	bleu	%icc,	loop_943
	sllx	%i2,	0x09,	%o0
	umulcc	%o5,	%g5,	%o3
	nop
	set	0x42, %g6
	lduh	[%l7 + %g6],	%g7
loop_943:
	sra	%i4,	0x0A,	%l0
	fmovrde	%l4,	%f26,	%f28
	edge32ln	%l6,	%i3,	%i1
	orn	%g6,	%g4,	%l5
	alignaddrl	%l3,	%o6,	%i6
	set	0x2C, %o5
	sta	%f27,	[%l7 + %o5] 0x80
	movpos	%xcc,	%o1,	%o2
	fand	%f18,	%f24,	%f6
	nop
	set	0x68, %l5
	std	%f20,	[%l7 + %l5]
	fmovdcs	%xcc,	%f29,	%f17
	fnot2	%f10,	%f18
	tne	%icc,	0x2
	sll	%o7,	%o4,	%l1
	xor	%i0,	0x0A97,	%g3
	alignaddrl	%i5,	%i7,	%g2
	bpos,a	%icc,	loop_944
	addccc	%g1,	%l2,	%o0
	ldub	[%l7 + 0x36],	%i2
	sth	%g5,	[%l7 + 0x5C]
loop_944:
	fmul8sux16	%f24,	%f8,	%f24
	nop
	setx	loop_945,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnor	%f12,	%f14,	%f16
	ldd	[%l7 + 0x08],	%f22
	fxor	%f6,	%f14,	%f24
loop_945:
	fmovdvc	%icc,	%f23,	%f21
	tpos	%xcc,	0x2
	fmovsgu	%icc,	%f15,	%f3
	ldsb	[%l7 + 0x29],	%o5
	array16	%o3,	%i4,	%l0
	mulx	%l4,	%g7,	%l6
	nop
	setx	0xF393F8DC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xD73DD149,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f16,	%f10
	nop
	fitod	%f12,	%f26
	fdtos	%f26,	%f17
	nop
	setx loop_946, %l0, %l1
	jmpl %l1, %i3
	tvs	%icc,	0x2
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x30] %asi,	%g6
loop_946:
	bvc	%xcc,	loop_947
	fmovsneg	%xcc,	%f31,	%f20
	movcs	%xcc,	%g4,	%l5
	set	0x58, %i4
	lduwa	[%l7 + %i4] 0x14,	%l3
loop_947:
	fbge	%fcc0,	loop_948
	movne	%icc,	%i1,	%i6
	subc	%o1,	%o2,	%o7
	fble,a	%fcc3,	loop_949
loop_948:
	lduw	[%l7 + 0x50],	%o6
	or	%o4,	0x0680,	%l1
	nop
	setx loop_950, %l0, %l1
	jmpl %l1, %g3
loop_949:
	fmovdne	%xcc,	%f15,	%f12
	edge32n	%i5,	%i7,	%g2
	edge32	%i0,	%l2,	%g1
loop_950:
	fblg,a	%fcc3,	loop_951
	membar	0x42
	movneg	%xcc,	%o0,	%g5
	fmovda	%xcc,	%f9,	%f16
loop_951:
	sethi	0x1419,	%o5
	movrgez	%i2,	0x363,	%i4
	nop
	fitos	%f6,	%f16
	fmovdpos	%xcc,	%f8,	%f22
	edge8ln	%o3,	%l0,	%g7
	movrgz	%l4,	0x15F,	%l6
	tvc	%xcc,	0x1
	edge16l	%i3,	%g4,	%g6
	sdivx	%l3,	0x07F1,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i6,	0x1ACB,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xD28E99D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x107633CD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f13,	%f25
	move	%xcc,	%o2,	%i1
	fmovsn	%xcc,	%f21,	%f21
	array16	%o7,	%o6,	%o4
	fmovscc	%icc,	%f5,	%f25
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x71] %asi,	%l1
	sth	%i5,	[%l7 + 0x3C]
	brz	%g3,	loop_952
	fcmpne32	%f0,	%f20,	%g2
	fandnot1	%f12,	%f8,	%f12
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i0,	%i7
loop_952:
	tle	%xcc,	0x3
	ta	%xcc,	0x5
	nop
	fitod	%f8,	%f6
	fdtos	%f6,	%f11
	movvc	%xcc,	%g1,	%l2
	udivx	%o0,	0x0620,	%g5
	movgu	%icc,	%i2,	%o5
	addc	%o3,	%l0,	%g7
	edge32l	%l4,	%i4,	%i3
	movre	%g4,	0x0F1,	%l6
	taddcc	%l3,	%l5,	%g6
	movre	%o1,	0x0B5,	%i6
	st	%f1,	[%l7 + 0x2C]
	edge16l	%i1,	%o7,	%o2
	edge32l	%o4,	%o6,	%i5
	set	0x57, %o7
	stba	%l1,	[%l7 + %o7] 0xea
	membar	#Sync
	nop
	setx	0x60578F05,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	fmovd	%f8,	%f24
	fnot1	%f0,	%f14
	fmovsgu	%icc,	%f26,	%f19
	orncc	%g3,	%g2,	%i0
	te	%xcc,	0x7
	edge16	%i7,	%g1,	%l2
	move	%xcc,	%g5,	%i2
	fornot2s	%f29,	%f13,	%f20
	alignaddrl	%o5,	%o3,	%o0
	tgu	%xcc,	0x5
	fnor	%f22,	%f20,	%f4
	stbar
	tle	%icc,	0x6
	sdivx	%g7,	0x1C84,	%l0
	fmovdne	%icc,	%f6,	%f29
	udivx	%i4,	0x0E61,	%i3
	sth	%g4,	[%l7 + 0x6E]
	srax	%l4,	0x07,	%l6
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fbe	%fcc0,	loop_953
	tn	%xcc,	0x0
	tg	%xcc,	0x7
	addc	%l5,	0x0F9F,	%g6
loop_953:
	fsrc1	%f20,	%f16
	addccc	%l3,	0x1FFE,	%o1
	tcc	%xcc,	0x1
	fmovrsne	%i1,	%f11,	%f20
	fbge	%fcc3,	loop_954
	fnegd	%f8,	%f8
	call	loop_955
	fabss	%f1,	%f20
loop_954:
	udivcc	%i6,	0x1406,	%o2
	bpos,pt	%icc,	loop_956
loop_955:
	ba,pn	%icc,	loop_957
	umul	%o7,	%o6,	%i5
	fbne	%fcc0,	loop_958
loop_956:
	bvc	%icc,	loop_959
loop_957:
	edge16n	%o4,	%l1,	%g2
	andn	%g3,	%i0,	%g1
loop_958:
	sra	%i7,	0x0B,	%l2
loop_959:
	edge16n	%i2,	%o5,	%o3
	set	0x60, %l4
	ldswa	[%l7 + %l4] 0x80,	%g5
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x10] %asi,	%g6
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movrgz	%l0,	0x14A,	%o0
	srax	%i3,	0x0A,	%g4
	tl	%xcc,	0x7
	xorcc	%i4,	%l4,	%l5
	subccc	%g6,	0x0A09,	%l3
	tcs	%icc,	0x1
	fpadd32s	%f18,	%f2,	%f25
	stbar
	wr	%g0,	0x2b,	%asi
	stha	%o1,	[%l7 + 0x3E] %asi
	membar	#Sync
	fornot2	%f22,	%f0,	%f22
	fsrc1	%f28,	%f22
	ta	%icc,	0x4
	taddcctv	%l6,	%i1,	%o2
	fmovsgu	%xcc,	%f6,	%f7
	edge32ln	%o7,	%i6,	%o6
	movl	%xcc,	%i5,	%o4
	fmovsn	%xcc,	%f13,	%f13
	fbu	%fcc0,	loop_960
	alignaddr	%g2,	%g3,	%l1
	fbne	%fcc0,	loop_961
	movrgez	%i0,	%i7,	%g1
loop_960:
	nop
	setx	0xC07B1CED,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	alignaddr	%l2,	%o5,	%o3
loop_961:
	movre	%i2,	0x153,	%g7
	edge16n	%l0,	%o0,	%i3
	array32	%g4,	%i4,	%g5
	movrgez	%l5,	%l4,	%g6
	tsubcctv	%l3,	0x1398,	%o1
	andncc	%l6,	%o2,	%o7
	fpackfix	%f2,	%f10
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%i1,	%o6
	udivcc	%i5,	0x175A,	%i6
	sllx	%o4,	0x18,	%g3
	mulscc	%l1,	%g2,	%i7
	subccc	%g1,	0x0E8F,	%l2
	stbar
	ld	[%l7 + 0x74],	%f7
	bgu,a,pn	%xcc,	loop_962
	fbu	%fcc3,	loop_963
	move	%icc,	%o5,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_962:
	fmovsvs	%xcc,	%f30,	%f1
loop_963:
	fmovsneg	%xcc,	%f7,	%f10
	nop
	fitos	%f13,	%f18
	fstod	%f18,	%f8
	tsubcc	%i2,	%g7,	%i0
	edge16l	%o0,	%i3,	%g4
	fmovdcs	%xcc,	%f4,	%f10
	sdivx	%l0,	0x087C,	%g5
	be,a,pt	%xcc,	loop_964
	xnor	%i4,	%l4,	%l5
	add	%l3,	0x02BB,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_964:
	bcc,pt	%xcc,	loop_965
	alignaddrl	%l6,	%o2,	%o1
	set	0x50, %o4
	ldswa	[%l7 + %o4] 0x89,	%o7
loop_965:
	edge32	%i1,	%i5,	%o6
	tge	%xcc,	0x6
	nop
	setx	0xEE5548DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f23
	bpos,a,pn	%xcc,	loop_966
	array8	%o4,	%i6,	%l1
	movcs	%icc,	%g2,	%i7
	edge8	%g1,	%g3,	%l2
loop_966:
	fcmpeq16	%f10,	%f22,	%o5
	sub	%o3,	%i2,	%i0
	st	%f7,	[%l7 + 0x38]
	set	0x65, %l1
	stba	%g7,	[%l7 + %l1] 0x23
	membar	#Sync
	tcc	%icc,	0x3
	xorcc	%o0,	0x0B79,	%g4
	fmovdge	%icc,	%f28,	%f4
	movrgez	%i3,	0x32C,	%l0
	movl	%xcc,	%g5,	%i4
	orn	%l4,	%l5,	%g6
	fpmerge	%f31,	%f5,	%f12
	mulscc	%l6,	%l3,	%o2
	xorcc	%o1,	%o7,	%i5
	edge16n	%o6,	%i1,	%o4
	swap	[%l7 + 0x58],	%l1
	edge32ln	%i6,	%i7,	%g2
	sub	%g1,	0x0273,	%g3
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
	tn	%xcc,	0x6
	fmovsl	%xcc,	%f26,	%f29
	edge8ln	%o5,	%i2,	%i0
	movrlz	%g7,	%o3,	%g4
	alignaddr	%i3,	%l0,	%o0
	fmovrdlz	%i4,	%f28,	%f6
	prefetch	[%l7 + 0x48],	 0x2
	fbg	%fcc3,	loop_967
	movle	%icc,	%l4,	%g5
	edge32n	%l5,	%l6,	%l3
	srl	%o2,	%g6,	%o1
loop_967:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	ldsh	[%l7 + 0x60],	%o6
	sdivcc	%i5,	0x1BA1,	%i1
	alignaddr	%l1,	%o4,	%i6
	movre	%i7,	0x090,	%g1
	tge	%xcc,	0x7
	tge	%xcc,	0x5
	fexpand	%f30,	%f28
	movgu	%xcc,	%g2,	%g3
	movrne	%l2,	0x12C,	%i2
	nop
	setx	0xC04CB315,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	addccc	%i0,	%g7,	%o5
	mulx	%g4,	0x1AAC,	%o3
	udiv	%i3,	0x0016,	%l0
	swap	[%l7 + 0x0C],	%i4
	movrlez	%o0,	0x37D,	%g5
	srax	%l5,	%l4,	%l6
	ldsb	[%l7 + 0x65],	%o2
	srax	%g6,	0x0A,	%l3
	tle	%icc,	0x4
	lduh	[%l7 + 0x16],	%o7
	movrgez	%o1,	0x3B2,	%o6
	edge32l	%i1,	%l1,	%o4
	udiv	%i5,	0x19D5,	%i7
	sdiv	%g1,	0x077A,	%i6
	set	0x7C, %o6
	stha	%g2,	[%l7 + %o6] 0x04
	fxors	%f14,	%f28,	%f11
	edge8ln	%g3,	%l2,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%xcc,	%f24,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i0,	%o5,	%g7
	fmovrdgz	%g4,	%f14,	%f8
	stbar
	array32	%o3,	%l0,	%i3
	fmovrde	%o0,	%f16,	%f26
	subc	%g5,	0x18B9,	%l5
	edge16ln	%i4,	%l4,	%o2
	addccc	%g6,	0x14CC,	%l3
	fornot2	%f0,	%f6,	%f0
	movl	%icc,	%l6,	%o7
	fcmple16	%f12,	%f24,	%o6
	movpos	%icc,	%i1,	%o1
	fbul,a	%fcc1,	loop_968
	fcmpeq16	%f30,	%f8,	%o4
	lduw	[%l7 + 0x50],	%i5
	fandnot1s	%f24,	%f23,	%f24
loop_968:
	movrgz	%i7,	0x019,	%l1
	sub	%g1,	%g2,	%g3
	srax	%l2,	0x0F,	%i6
	andn	%i2,	0x14ED,	%i0
	move	%icc,	%g7,	%g4
	wr	%g0,	0x10,	%asi
	stwa	%o3,	[%l7 + 0x54] %asi
	movre	%l0,	0x3B5,	%o5
	tgu	%icc,	0x3
	bcc	%icc,	loop_969
	fmovrsne	%o0,	%f28,	%f26
	sdivx	%i3,	0x1EE3,	%l5
	edge8l	%g5,	%l4,	%i4
loop_969:
	srlx	%g6,	%l3,	%o2
	fmovscs	%icc,	%f21,	%f26
	alignaddr	%l6,	%o7,	%i1
	movge	%icc,	%o1,	%o4
	fmovda	%icc,	%f19,	%f5
	movg	%xcc,	%o6,	%i7
	tgu	%icc,	0x7
	te	%icc,	0x2
	bcs,a,pn	%xcc,	loop_970
	movrlez	%l1,	%g1,	%g2
	addc	%i5,	%g3,	%l2
	fbug,a	%fcc0,	loop_971
loop_970:
	fbg,a	%fcc0,	loop_972
	fmovda	%xcc,	%f9,	%f15
	mulx	%i2,	0x0631,	%i0
loop_971:
	tge	%icc,	0x7
loop_972:
	nop
	set	0x48, %g2
	stxa	%i6,	[%l7 + %g2] 0x18
	tleu	%icc,	0x6
	movrgez	%g4,	%o3,	%l0
	tvs	%xcc,	0x1
	fnors	%f4,	%f11,	%f22
	fand	%f30,	%f14,	%f12
	sllx	%o5,	%g7,	%i3
	tneg	%icc,	0x4
	sllx	%l5,	%g5,	%o0
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i4
	orcc	%l4,	%l3,	%o2
	taddcctv	%l6,	%o7,	%g6
	set	0x55, %g7
	ldstuba	[%l7 + %g7] 0x11,	%i1
	tcc	%icc,	0x7
	array32	%o4,	%o6,	%o1
	nop
	fitod	%f12,	%f26
	mova	%icc,	%l1,	%i7
	fzero	%f30
	stw	%g1,	[%l7 + 0x44]
	subcc	%i5,	%g3,	%g2
	movcs	%icc,	%l2,	%i0
	tne	%icc,	0x7
	fblg	%fcc0,	loop_973
	array32	%i2,	%i6,	%g4
	fbge	%fcc2,	loop_974
	sir	0x1247
loop_973:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs	loop_975
loop_974:
	movl	%xcc,	%l0,	%o5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x80,	%o3,	%i3
loop_975:
	fbe	%fcc2,	loop_976
	addccc	%g7,	0x1276,	%l5
	edge8	%g5,	%i4,	%l4
	tgu	%icc,	0x5
loop_976:
	edge8n	%o0,	%o2,	%l3
	movn	%icc,	%o7,	%g6
	sllx	%i1,	%o4,	%o6
	xnorcc	%l6,	0x0833,	%o1
	bcc,a,pn	%xcc,	loop_977
	add	%i7,	0x1835,	%l1
	movpos	%icc,	%i5,	%g1
	edge8	%g3,	%g2,	%l2
loop_977:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x28] %asi,	%i2
	movl	%icc,	%i0,	%i6
	movle	%icc,	%l0,	%o5
	movpos	%icc,	%o3,	%g4
	sdivx	%g7,	0x1CFD,	%l5
	membar	0x4D
	mulx	%g5,	%i4,	%l4
	nop
	setx	0x51950A14,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f16
	nop
	set	0x30, %l2
	ldx	[%l7 + %l2],	%o0
	ldd	[%l7 + 0x48],	%f8
	fbg	%fcc1,	loop_978
	movrne	%i3,	0x2B3,	%l3
	nop
	setx	0xF06CFA41,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	mova	%icc,	%o7,	%g6
loop_978:
	sethi	0x06D7,	%i1
	orn	%o4,	0x1567,	%o6
	add	%l7,	0x28,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l6,	%o1
	fandnot1s	%f16,	%f4,	%f13
	set	0x0C, %l3
	lduha	[%l7 + %l3] 0x88,	%i7
	alignaddrl	%l1,	%i5,	%o2
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x70] %asi,	%g0
	fbo	%fcc2,	loop_979
	fmovda	%icc,	%f9,	%f23
	tvs	%xcc,	0x0
	fblg,a	%fcc0,	loop_980
loop_979:
	edge8	%g3,	%g2,	%l2
	tge	%xcc,	0x0
	movvs	%xcc,	%i0,	%i6
loop_980:
	sllx	%l0,	%i2,	%o3
	tvc	%xcc,	0x0
	fmovdleu	%xcc,	%f26,	%f20
	movvs	%icc,	%g4,	%o5
	nop
	setx	0xD068C171,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	bpos,pn	%xcc,	loop_981
	andncc	%g7,	%g5,	%i4
	fandnot1	%f30,	%f8,	%f12
	sdiv	%l4,	0x0F1D,	%o0
loop_981:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i3,	%l3
	fmovrse	%l5,	%f23,	%f25
	bleu,a	loop_982
	udivx	%o7,	0x15C7,	%i1
	fones	%f1
	array32	%g6,	%o6,	%o4
loop_982:
	tsubcctv	%l6,	%o1,	%i7
	fbn	%fcc2,	loop_983
	ldd	[%l7 + 0x08],	%f28
	tcc	%icc,	0x7
	sdiv	%l1,	0x0E4A,	%o2
loop_983:
	fornot2	%f2,	%f14,	%f14
	fcmple16	%f2,	%f30,	%g1
	wr	%g0,	0x18,	%asi
	sta	%f18,	[%l7 + 0x44] %asi
	sra	%i5,	0x16,	%g2
	udivcc	%l2,	0x1F44,	%i0
	udivcc	%g3,	0x0D17,	%i6
	sdivx	%l0,	0x1425,	%i2
	brgz,a	%o3,	loop_984
	udiv	%o5,	0x1681,	%g4
	addc	%g5,	%g7,	%l4
	xorcc	%o0,	%i4,	%i3
loop_984:
	subcc	%l3,	%o7,	%l5
	umul	%g6,	%o6,	%i1
	movrne	%o4,	%l6,	%i7
	orncc	%o1,	%l1,	%g1
	sdiv	%i5,	0x0095,	%g2
	tge	%xcc,	0x5
	set	0x56, %o3
	ldsha	[%l7 + %o3] 0x15,	%l2
	fbue,a	%fcc1,	loop_985
	fba,a	%fcc2,	loop_986
	srax	%i0,	%o2,	%g3
	edge16n	%l0,	%i6,	%i2
loop_985:
	nop
	setx	0x40640257,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
loop_986:
	fmovrdgz	%o5,	%f22,	%f16
	movvs	%xcc,	%o3,	%g4
	tne	%icc,	0x3
	fmovsge	%icc,	%f22,	%f30
	fone	%f10
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x14,	%f0
	tcc	%xcc,	0x3
	tcs	%icc,	0x1
	movge	%xcc,	%g5,	%l4
	fmovd	%f22,	%f28
	andncc	%g7,	%o0,	%i3
	fblg	%fcc2,	loop_987
	sdivx	%i4,	0x128B,	%o7
	bneg,pt	%icc,	loop_988
	tneg	%xcc,	0x2
loop_987:
	srlx	%l3,	%g6,	%l5
	bl,pn	%xcc,	loop_989
loop_988:
	sll	%o6,	0x1B,	%o4
	sdiv	%l6,	0x0DE6,	%i7
	addccc	%o1,	0x1745,	%l1
loop_989:
	tleu	%xcc,	0x3
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f4
	fxtod	%f4,	%f14
	taddcc	%i1,	%g1,	%g2
	bleu,a	%icc,	loop_990
	umul	%i5,	%i0,	%o2
	fxnors	%f17,	%f31,	%f29
	addccc	%l2,	%l0,	%g3
loop_990:
	edge16ln	%i2,	%i6,	%o3
	edge8n	%o5,	%g5,	%l4
	fmul8sux16	%f4,	%f2,	%f6
	fpmerge	%f30,	%f16,	%f4
	array8	%g7,	%g4,	%o0
	edge16n	%i3,	%o7,	%i4
	ldsb	[%l7 + 0x59],	%l3
	edge16l	%l5,	%g6,	%o6
	movpos	%icc,	%o4,	%l6
	fmovrsgz	%o1,	%f17,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l1,	%i7,	%g1
	bvc	loop_991
	sllx	%g2,	0x0E,	%i1
	andn	%i5,	0x0447,	%o2
	smul	%i0,	0x0400,	%l2
loop_991:
	addc	%l0,	%g3,	%i2
	tne	%icc,	0x5
	srlx	%i6,	%o3,	%g5
	set	0x0A, %g4
	lduba	[%l7 + %g4] 0x0c,	%l4
	edge16ln	%g7,	%o5,	%g4
	nop
	set	0x50, %i7
	stx	%o0,	[%l7 + %i7]
	andncc	%o7,	%i4,	%l3
	movvs	%icc,	%l5,	%i3
	popc	0x0B20,	%o6
	andcc	%g6,	0x1801,	%l6
	mulscc	%o1,	%l1,	%o4
	fbu,a	%fcc0,	loop_992
	add	%i7,	0x1B8C,	%g2
	or	%g1,	%i1,	%i5
	mulscc	%o2,	%i0,	%l0
loop_992:
	edge16l	%l2,	%i2,	%g3
	edge8	%o3,	%i6,	%g5
	movvs	%xcc,	%g7,	%o5
	bleu	%icc,	loop_993
	andcc	%l4,	%g4,	%o0
	tne	%icc,	0x1
	umul	%o7,	%l3,	%i4
loop_993:
	ta	%icc,	0x6
	edge8	%l5,	%o6,	%i3
	fble	%fcc1,	loop_994
	ba,pt	%icc,	loop_995
	edge32ln	%l6,	%g6,	%o1
	movrlez	%o4,	%i7,	%g2
loop_994:
	umulcc	%g1,	0x0102,	%i1
loop_995:
	bneg,a	%icc,	loop_996
	bl,a,pn	%icc,	loop_997
	tvc	%xcc,	0x2
	taddcctv	%l1,	0x122F,	%o2
loop_996:
	fnand	%f24,	%f10,	%f18
loop_997:
	movle	%icc,	%i5,	%i0
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%l2
	fmovrse	%l0,	%f6,	%f9
	orn	%i2,	%o3,	%i6
	fbu	%fcc1,	loop_998
	tcs	%xcc,	0x1
	sethi	0x0A1E,	%g5
	tl	%xcc,	0x3
loop_998:
	tge	%xcc,	0x2
	movrgz	%g3,	%o5,	%l4
	fbn,a	%fcc2,	loop_999
	addcc	%g4,	0x1FEA,	%o0
	addcc	%o7,	%g7,	%i4
	sth	%l5,	[%l7 + 0x1E]
loop_999:
	andcc	%l3,	%o6,	%i3
	movcc	%xcc,	%g6,	%o1
	sub	%l6,	%i7,	%o4
	sth	%g2,	[%l7 + 0x1A]
	fpackfix	%f22,	%f16
	fcmpgt16	%f0,	%f24,	%i1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l1,	%g1
	movcs	%xcc,	%i5,	%i0
	movn	%icc,	%l2,	%o2
	edge32ln	%l0,	%o3,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x68, %l6
	ldsw	[%l7 + %l6],	%g5
	brlz	%i6,	loop_1000
	udiv	%g3,	0x08A8,	%l4
	fornot2s	%f13,	%f5,	%f31
	fbn,a	%fcc3,	loop_1001
loop_1000:
	nop
	fitod	%f12,	%f24
	fdtox	%f24,	%f14
	movvc	%icc,	%o5,	%g4
	bn,a,pn	%icc,	loop_1002
loop_1001:
	nop
	setx	loop_1003,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xor	%o0,	0x0029,	%g7
	brgz,a	%o7,	loop_1004
loop_1002:
	nop
	setx loop_1005, %l0, %l1
	jmpl %l1, %i4
loop_1003:
	fnot2	%f2,	%f0
	fmovde	%icc,	%f15,	%f12
loop_1004:
	xnor	%l3,	%o6,	%l5
loop_1005:
	fcmpeq32	%f2,	%f20,	%i3
	andn	%o1,	%g6,	%l6
	sub	%o4,	%i7,	%i1
	membar	0x07
	sll	%g2,	0x1B,	%g1
	sub	%i5,	0x0B43,	%i0
	smulcc	%l1,	%l2,	%l0
	sdivcc	%o2,	0x1C45,	%o3
	edge8l	%g5,	%i2,	%i6
	nop
	setx loop_1006, %l0, %l1
	jmpl %l1, %l4
	fnot1	%f10,	%f10
	edge8	%g3,	%o5,	%o0
	udivx	%g7,	0x1C31,	%o7
loop_1006:
	movleu	%icc,	%g4,	%l3
	brgz	%i4,	loop_1007
	movn	%xcc,	%o6,	%i3
	ldsh	[%l7 + 0x7C],	%l5
	fbn,a	%fcc0,	loop_1008
loop_1007:
	sethi	0x1473,	%o1
	te	%icc,	0x6
	edge16ln	%g6,	%l6,	%i7
loop_1008:
	nop
	set	0x0C, %g3
	ldsha	[%l7 + %g3] 0x88,	%o4
	tvc	%icc,	0x3
	umulcc	%i1,	0x079E,	%g1
	fble	%fcc2,	loop_1009
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g2,	0x33F,	%i5
	tne	%icc,	0x4
loop_1009:
	sra	%i0,	%l2,	%l0
	movleu	%xcc,	%l1,	%o2
	ble	loop_1010
	fsrc1	%f4,	%f2
	brgz,a	%g5,	loop_1011
	bcs,pn	%xcc,	loop_1012
loop_1010:
	bvc,a	%xcc,	loop_1013
	fones	%f28
loop_1011:
	addcc	%o3,	0x04C5,	%i2
loop_1012:
	be,a,pn	%icc,	loop_1014
loop_1013:
	fpmerge	%f20,	%f4,	%f6
	fornot2s	%f7,	%f27,	%f8
	andncc	%l4,	%g3,	%o5
loop_1014:
	brgz,a	%o0,	loop_1015
	edge16n	%i6,	%o7,	%g4
	fabss	%f15,	%f12
	fbule	%fcc2,	loop_1016
loop_1015:
	sll	%l3,	0x0F,	%g7
	fmovdge	%icc,	%f17,	%f29
	edge8n	%i4,	%i3,	%l5
loop_1016:
	fxnor	%f28,	%f28,	%f4
	fbul	%fcc3,	loop_1017
	xnorcc	%o1,	0x1DEA,	%o6
	array16	%l6,	%g6,	%o4
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1017:
	xnorcc	%i7,	0x1B18,	%g1
	alignaddr	%g2,	%i5,	%i1
	ldd	[%l7 + 0x58],	%l2
	fmovsvs	%xcc,	%f24,	%f19
	fbug	%fcc3,	loop_1018
	movrne	%l0,	0x1C5,	%l1
	movn	%icc,	%i0,	%g5
	nop
	setx	0xE06BE852,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
loop_1018:
	fmovsvc	%icc,	%f5,	%f23
	set	0x60, %o1
	stha	%o2,	[%l7 + %o1] 0x2a
	membar	#Sync
	ldub	[%l7 + 0x2B],	%o3
	tsubcc	%i2,	%l4,	%o5
	fmovrdgez	%g3,	%f8,	%f20
	sub	%i6,	0x16AB,	%o0
	taddcctv	%g4,	0x17B4,	%o7
	sdivcc	%l3,	0x1CA3,	%i4
	fandnot1s	%f19,	%f11,	%f4
	popc	%i3,	%l5
	fmovdl	%icc,	%f31,	%f16
	fmovsa	%xcc,	%f16,	%f20
	tcs	%xcc,	0x2
	set	0x5C, %i5
	lda	[%l7 + %i5] 0x18,	%f1
	edge32l	%g7,	%o6,	%l6
	bgu,a	loop_1019
	brz	%g6,	loop_1020
	udivcc	%o4,	0x0944,	%i7
	or	%g1,	0x12EC,	%o1
loop_1019:
	edge8	%g2,	%i5,	%i1
loop_1020:
	fmovdneg	%icc,	%f3,	%f3
	taddcc	%l0,	0x0707,	%l2
	membar	0x46
	fornot2	%f0,	%f28,	%f2
	sdiv	%i0,	0x0B7C,	%l1
	wr	%g0,	0x89,	%asi
	stha	%g5,	[%l7 + 0x64] %asi
	fmovsl	%xcc,	%f30,	%f27
	for	%f28,	%f18,	%f28
	edge32n	%o3,	%o2,	%l4
	fornot2	%f10,	%f0,	%f12
	umul	%o5,	0x1CF1,	%g3
	tcs	%xcc,	0x0
	nop
	fitos	%f7,	%f3
	fstod	%f3,	%f20
	array8	%i2,	%i6,	%g4
	movrgz	%o0,	%o7,	%l3
	tge	%xcc,	0x3
	fnot2	%f14,	%f12
	taddcctv	%i3,	0x0812,	%l5
	and	%g7,	0x0DB5,	%i4
	xorcc	%l6,	0x1089,	%g6
	fnot1s	%f14,	%f9
	edge8n	%o6,	%i7,	%o4
	edge32	%o1,	%g1,	%i5
	subccc	%g2,	0x191C,	%i1
	bne	%icc,	loop_1021
	fpadd16s	%f22,	%f28,	%f1
	ldx	[%l7 + 0x30],	%l0
	array16	%l2,	%l1,	%i0
loop_1021:
	orcc	%g5,	0x1481,	%o2
	fmovdvc	%xcc,	%f27,	%f20
	fexpand	%f10,	%f26
	fmovsge	%xcc,	%f5,	%f29
	fmovdle	%xcc,	%f15,	%f2
	umulcc	%l4,	%o3,	%o5
	movcs	%icc,	%i2,	%g3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x6D] %asi,	%g4
	fmovsa	%xcc,	%f13,	%f7
	fmovscs	%icc,	%f29,	%f19
	xor	%o0,	%o7,	%i6
	srax	%l3,	0x16,	%l5
	and	%i3,	%i4,	%l6
	srax	%g6,	0x04,	%g7
	fmovdleu	%xcc,	%f7,	%f18
	fbue	%fcc0,	loop_1022
	fbe	%fcc0,	loop_1023
	sdivcc	%i7,	0x1591,	%o4
	ld	[%l7 + 0x28],	%f28
loop_1022:
	fbug	%fcc1,	loop_1024
loop_1023:
	sub	%o6,	0x1777,	%g1
	nop
	set	0x10, %l0
	stx	%i5,	[%l7 + %l0]
	smul	%g2,	%o1,	%l0
loop_1024:
	tn	%icc,	0x6
	movrgez	%i1,	0x2CA,	%l2
	fbo	%fcc3,	loop_1025
	srl	%i0,	%l1,	%g5
	nop
	set	0x2C, %g5
	ldstub	[%l7 + %g5],	%l4
	popc	0x1274,	%o2
loop_1025:
	tg	%icc,	0x0
	movleu	%icc,	%o5,	%i2
	fmovdl	%xcc,	%f19,	%f17
	ldsb	[%l7 + 0x68],	%o3
	fmovrse	%g3,	%f29,	%f5
	tsubcc	%o0,	0x014B,	%o7
	tge	%xcc,	0x3
	fbo	%fcc2,	loop_1026
	sethi	0x0673,	%g4
	movneg	%xcc,	%i6,	%l5
	lduh	[%l7 + 0x32],	%i3
loop_1026:
	mulscc	%l3,	%i4,	%g6
	smulcc	%g7,	%l6,	%o4
	movl	%xcc,	%i7,	%g1
	fcmpeq16	%f16,	%f24,	%i5
	tsubcc	%g2,	%o1,	%l0
	tvc	%xcc,	0x7
	be,a,pt	%xcc,	loop_1027
	udiv	%o6,	0x00B6,	%l2
	fnegs	%f30,	%f5
	fnot1	%f20,	%f12
loop_1027:
	sll	%i0,	0x05,	%l1
	edge32n	%g5,	%i1,	%l4
	fmovdvc	%icc,	%f18,	%f11
	lduw	[%l7 + 0x28],	%o5
	tge	%xcc,	0x0
	nop
	fitos	%f1,	%f14
	fstoi	%f14,	%f10
	srax	%o2,	%o3,	%g3
	edge32	%o0,	%o7,	%g4
	fmovsl	%icc,	%f9,	%f5
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f16
	udivcc	%i6,	0x0FCF,	%i2
	taddcctv	%l5,	0x0C63,	%l3
	ldstub	[%l7 + 0x5C],	%i3
	udivcc	%i4,	0x1EE5,	%g6
	prefetch	[%l7 + 0x64],	 0x1
	edge16l	%g7,	%l6,	%o4
	fcmpne16	%f26,	%f24,	%g1
	add	%i7,	%i5,	%g2
	set	0x66, %i1
	ldstuba	[%l7 + %i1] 0x11,	%o1
	bg,pn	%icc,	loop_1028
	addcc	%l0,	%o6,	%l2
	movrlz	%i0,	%l1,	%i1
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x63] %asi,	%g5
loop_1028:
	fzeros	%f13
	sdiv	%l4,	0x00B3,	%o5
	orn	%o3,	%g3,	%o2
	fmul8sux16	%f26,	%f14,	%f2
	movleu	%xcc,	%o0,	%g4
	sub	%i6,	0x0CEA,	%o7
	and	%l5,	%l3,	%i2
	fcmple32	%f30,	%f26,	%i4
	subccc	%i3,	0x0C73,	%g7
	edge16l	%l6,	%o4,	%g6
	te	%xcc,	0x0
	popc	%g1,	%i7
	fbuge	%fcc2,	loop_1029
	membar	0x55
	nop
	setx	0xA35A83A718E8FE06,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x65045230EC42CC69,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f18,	%f4
	orn	%g2,	%o1,	%i5
loop_1029:
	subccc	%l0,	0x0E67,	%l2
	fbue	%fcc0,	loop_1030
	fnot1	%f0,	%f20
	stbar
	srl	%i0,	%o6,	%i1
loop_1030:
	edge32n	%l1,	%g5,	%o5
	movge	%xcc,	%l4,	%o3
	set	0x24, %i0
	stba	%g3,	[%l7 + %i0] 0xea
	membar	#Sync
	fmovspos	%xcc,	%f0,	%f20
	bvs,pn	%icc,	loop_1031
	stb	%o2,	[%l7 + 0x2A]
	nop
	setx	loop_1032,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge,pn	%xcc,	loop_1033
loop_1031:
	movle	%icc,	%g4,	%i6
	nop
	setx	loop_1034,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1032:
	fmovdpos	%icc,	%f10,	%f8
loop_1033:
	be,a,pn	%icc,	loop_1035
	edge32n	%o0,	%o7,	%l5
loop_1034:
	edge16n	%i2,	%l3,	%i3
	addcc	%i4,	%g7,	%o4
loop_1035:
	movleu	%icc,	%l6,	%g6
	fpsub32s	%f19,	%f5,	%f23
	nop
	setx	0xACD04F1200402870,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	add	%l7,	0x34,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x0c,	%i7,	%g1
	std	%f4,	[%l7 + 0x78]
	add	%l7,	0x24,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%o1
	sll	%i5,	%l2,	%i0
	edge16ln	%l0,	%o6,	%i1
	array8	%g5,	%l1,	%l4
	fpackfix	%f26,	%f11
	fmovrslez	%o5,	%f21,	%f19
	fnor	%f18,	%f4,	%f0
	movne	%xcc,	%g3,	%o2
	nop
	setx	0x7C8C5B86DB6FCA38,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x274A01D183D53862,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f14,	%f26
	add	%g4,	0x17B9,	%o3
	sethi	0x1208,	%o0
	tne	%xcc,	0x0
	subcc	%i6,	%l5,	%o7
	tn	%icc,	0x3
	fmovrdne	%i2,	%f12,	%f16
	sdivcc	%l3,	0x18F2,	%i3
	sethi	0x10C8,	%i4
	edge8ln	%o4,	%l6,	%g7
	tle	%xcc,	0x5
	movge	%icc,	%g6,	%i7
	be	%xcc,	loop_1036
	and	%g1,	%o1,	%g2
	fcmpne16	%f8,	%f12,	%i5
	udiv	%i0,	0x167C,	%l0
loop_1036:
	movrne	%o6,	%l2,	%g5
	tne	%xcc,	0x6
	umulcc	%l1,	0x19C3,	%i1
	be,a	%icc,	loop_1037
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f22
	sub	%o5,	%l4,	%g3
	xor	%g4,	0x0A25,	%o3
loop_1037:
	edge32l	%o0,	%o2,	%l5
	edge8ln	%o7,	%i2,	%i6
	std	%f22,	[%l7 + 0x70]
	udiv	%i3,	0x1961,	%i4
	sdivx	%o4,	0x1A7A,	%l3
	ldsh	[%l7 + 0x64],	%l6
	bne	%icc,	loop_1038
	add	%g6,	%i7,	%g7
	membar	0x0D
	andncc	%o1,	%g2,	%g1
loop_1038:
	membar	0x11
	ta	%icc,	0x0
	nop
	setx	0x60647FB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fmul8sux16	%f0,	%f24,	%f20
	subc	%i5,	%l0,	%i0
	fabss	%f26,	%f31
	fnot1s	%f14,	%f12
	srlx	%l2,	0x17,	%g5
	swap	[%l7 + 0x74],	%l1
	sll	%o6,	0x07,	%o5
	taddcctv	%i1,	0x1695,	%g3
	tvs	%xcc,	0x5
	movpos	%icc,	%g4,	%o3
	wr	%g0,	0x89,	%asi
	sta	%f12,	[%l7 + 0x28] %asi
	fpadd16	%f14,	%f2,	%f12
	fmovdcs	%xcc,	%f17,	%f22
	edge32ln	%o0,	%o2,	%l5
	edge8ln	%o7,	%l4,	%i6
	or	%i2,	0x119B,	%i3
	movpos	%xcc,	%o4,	%i4
	xor	%l3,	0x0CC7,	%l6
	alignaddrl	%g6,	%i7,	%o1
	tpos	%icc,	0x0
	tge	%icc,	0x7
	orncc	%g2,	0x1437,	%g7
	nop
	setx	0x8ACA092AF6F8FE30,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x12B967D606EBB939,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f10,	%f30
	xor	%i5,	0x1A89,	%g1
	fmovdneg	%xcc,	%f10,	%f21
	array16	%l0,	%i0,	%g5
	tsubcctv	%l1,	0x1313,	%o6
	stb	%o5,	[%l7 + 0x58]
	nop
	fitos	%f3,	%f12
	fstoi	%f12,	%f1
	tvs	%icc,	0x6
	umulcc	%l2,	%i1,	%g4
	taddcctv	%o3,	0x1416,	%g3
	fmovsn	%xcc,	%f31,	%f0
	fpsub16s	%f2,	%f4,	%f20
	fmovrde	%o0,	%f22,	%f22
	srl	%l5,	%o2,	%l4
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x44] %asi,	%i6
	fnot1s	%f12,	%f1
	membar	0x10
	fandnot1	%f16,	%f14,	%f20
	bleu,pn	%xcc,	loop_1039
	fcmpne32	%f6,	%f20,	%i2
	movrgz	%o7,	0x115,	%i3
	movrlez	%i4,	%o4,	%l6
loop_1039:
	fbo,a	%fcc2,	loop_1040
	edge32ln	%g6,	%i7,	%o1
	udivx	%g2,	0x1A60,	%g7
	movvs	%xcc,	%i5,	%g1
loop_1040:
	tg	%icc,	0x3
	fcmpeq32	%f0,	%f10,	%l3
	ldsh	[%l7 + 0x4A],	%i0
	fmovsg	%xcc,	%f15,	%f13
	popc	0x13E8,	%g5
	move	%xcc,	%l0,	%l1
	fcmpeq32	%f12,	%f28,	%o5
	brnz,a	%o6,	loop_1041
	movn	%icc,	%i1,	%l2
	fmovdvc	%xcc,	%f24,	%f5
	nop
	set	0x1A, %i6
	ldsb	[%l7 + %i6],	%o3
loop_1041:
	swap	[%l7 + 0x7C],	%g3
	movrlez	%g4,	%o0,	%o2
	te	%icc,	0x0
	movcc	%xcc,	%l4,	%l5
	edge8l	%i6,	%i2,	%o7
	wr	%g0,	0x88,	%asi
	stha	%i4,	[%l7 + 0x0E] %asi
	array8	%i3,	%l6,	%g6
	movpos	%icc,	%i7,	%o4
	movrgz	%g2,	%g7,	%i5
	tcc	%xcc,	0x6
	sllx	%o1,	0x1A,	%l3
	smul	%i0,	%g5,	%l0
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x10,	%l0
	fnand	%f28,	%f24,	%f6
	srax	%o5,	0x1F,	%g1
	xnor	%o6,	0x1712,	%l2
	flush	%l7 + 0x40
	edge16l	%o3,	%g3,	%i1
	ldd	[%l7 + 0x40],	%o0
	sra	%o2,	%l4,	%l5
	fnands	%f26,	%f12,	%f26
	fblg	%fcc3,	loop_1042
	edge32n	%g4,	%i6,	%i2
	fbge,a	%fcc3,	loop_1043
	fmovrsgez	%o7,	%f15,	%f21
loop_1042:
	brgez	%i3,	loop_1044
	ldsb	[%l7 + 0x47],	%l6
loop_1043:
	tg	%xcc,	0x2
	edge8l	%g6,	%i7,	%o4
loop_1044:
	tgu	%xcc,	0x2
	fblg,a	%fcc3,	loop_1045
	movl	%xcc,	%g2,	%g7
	sdivx	%i4,	0x0227,	%o1
	stx	%i5,	[%l7 + 0x10]
loop_1045:
	nop
	setx loop_1046, %l0, %l1
	jmpl %l1, %i0
	bneg,a	%icc,	loop_1047
	edge8ln	%g5,	%l0,	%l3
	bpos,a	%xcc,	loop_1048
loop_1046:
	udivx	%l1,	0x00D4,	%g1
loop_1047:
	bcc,pt	%xcc,	loop_1049
	edge16l	%o5,	%o6,	%o3
loop_1048:
	bgu	%icc,	loop_1050
	tge	%icc,	0x7
loop_1049:
	xorcc	%g3,	0x044C,	%i1
	tge	%icc,	0x3
loop_1050:
	bcc,a,pt	%xcc,	loop_1051
	edge32ln	%o0,	%o2,	%l2
	sub	%l5,	%l4,	%i6
	nop
	set	0x68, %g1
	ldsh	[%l7 + %g1],	%g4
loop_1051:
	fbn,a	%fcc1,	loop_1052
	ldub	[%l7 + 0x75],	%i2
	wr	%g0,	0x89,	%asi
	stba	%i3,	[%l7 + 0x1E] %asi
loop_1052:
	srlx	%o7,	%l6,	%i7
	smul	%g6,	0x0FD0,	%o4
	array32	%g2,	%g7,	%i4
	alignaddrl	%i5,	%i0,	%o1
	fmovrse	%l0,	%f26,	%f31
	movvc	%xcc,	%g5,	%l1
	sllx	%l3,	%o5,	%g1
	xorcc	%o3,	%o6,	%g3
	movle	%xcc,	%o0,	%i1
	sdiv	%l2,	0x0095,	%l5
	fcmpeq16	%f30,	%f6,	%o2
	tn	%xcc,	0x2
	movvs	%icc,	%i6,	%g4
	orn	%i2,	%i3,	%l4
	bl,a,pt	%icc,	loop_1053
	ld	[%l7 + 0x60],	%f22
	ble,pn	%icc,	loop_1054
	fbuge,a	%fcc0,	loop_1055
loop_1053:
	addcc	%l6,	%o7,	%i7
	ldsw	[%l7 + 0x14],	%g6
loop_1054:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] 0x81,	%g2,	%o4
loop_1055:
	fbg,a	%fcc2,	loop_1056
	srax	%g7,	%i5,	%i0
	set	0x18, %i3
	ldxa	[%l7 + %i3] 0x11,	%i4
loop_1056:
	orn	%l0,	0x066D,	%g5
	ldx	[%l7 + 0x08],	%o1
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f10
	fxtod	%f10,	%f0
	bneg,a,pt	%xcc,	loop_1057
	fbg	%fcc0,	loop_1058
	andn	%l1,	%o5,	%l3
	brz,a	%g1,	loop_1059
loop_1057:
	andn	%o3,	0x0DBA,	%o6
loop_1058:
	bcc,pt	%icc,	loop_1060
	sdiv	%g3,	0x1C97,	%i1
loop_1059:
	fnot1	%f18,	%f30
	nop
	setx	0xAEAAD8E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x915C84DB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fadds	%f17,	%f24,	%f28
loop_1060:
	fabss	%f10,	%f26
	umul	%l2,	%o0,	%l5
	faligndata	%f16,	%f22,	%f2
	stbar
	brlez,a	%i6,	loop_1061
	fbe,a	%fcc3,	loop_1062
	udivx	%o2,	0x01B3,	%i2
	te	%icc,	0x4
loop_1061:
	membar	0x33
loop_1062:
	xnorcc	%i3,	%l4,	%l6
	bne,pn	%xcc,	loop_1063
	edge32n	%g4,	%i7,	%g6
	tsubcctv	%g2,	0x0AFD,	%o7
	tgu	%icc,	0x5
loop_1063:
	nop
	fitos	%f13,	%f3
	fstoi	%f3,	%f25
	stb	%g7,	[%l7 + 0x21]
	edge32l	%i5,	%i0,	%i4
	edge8l	%o4,	%l0,	%g5
	tcs	%xcc,	0x7
	tvs	%icc,	0x5
	taddcc	%o1,	%o5,	%l1
	movcs	%xcc,	%l3,	%g1
	smul	%o6,	0x0AC6,	%o3
	andcc	%g3,	%l2,	%i1
	tcc	%xcc,	0x5
	andn	%o0,	%l5,	%o2
	udivcc	%i6,	0x1071,	%i3
	sllx	%l4,	%i2,	%l6
	movle	%xcc,	%g4,	%i7
	ldstub	[%l7 + 0x5C],	%g2
	xor	%o7,	0x0B48,	%g7
	edge8	%g6,	%i5,	%i0
	set	0x44, %i2
	lduwa	[%l7 + %i2] 0x89,	%i4
	fbge	%fcc3,	loop_1064
	fmul8x16	%f9,	%f30,	%f30
	edge32	%o4,	%l0,	%o1
	wr	%g0,	0x11,	%asi
	stha	%o5,	[%l7 + 0x0A] %asi
loop_1064:
	edge32ln	%l1,	%l3,	%g5
	edge32ln	%o6,	%g1,	%g3
	set	0x20, %o5
	ldda	[%l7 + %o5] 0x10,	%o2
	fpadd32s	%f26,	%f5,	%f23
	subccc	%i1,	0x175C,	%l2
	xor	%l5,	%o2,	%o0
	bshuffle	%f22,	%f8,	%f24
	orcc	%i6,	%l4,	%i3
	std	%f16,	[%l7 + 0x08]
	taddcctv	%i2,	0x0ED1,	%l6
	movvc	%xcc,	%i7,	%g2
	st	%f26,	[%l7 + 0x24]
	sll	%o7,	0x0C,	%g4
	xnor	%g7,	%i5,	%i0
	fmovrsgez	%i4,	%f10,	%f24
	orncc	%o4,	0x1188,	%l0
	te	%xcc,	0x7
	xorcc	%o1,	0x19B7,	%g6
	tgu	%xcc,	0x5
	movrlez	%l1,	%l3,	%g5
	set	0x34, %g6
	swapa	[%l7 + %g6] 0x81,	%o5
	fbne	%fcc2,	loop_1065
	sdivcc	%g1,	0x141F,	%o6
	bge	%xcc,	loop_1066
	smulcc	%g3,	0x066E,	%o3
loop_1065:
	edge16l	%i1,	%l2,	%l5
	movle	%icc,	%o2,	%o0
loop_1066:
	xorcc	%i6,	0x07ED,	%l4
	fbo,a	%fcc3,	loop_1067
	fbul	%fcc3,	loop_1068
	taddcctv	%i3,	%l6,	%i2
	ta	%xcc,	0x7
loop_1067:
	movrlez	%g2,	0x2CA,	%i7
loop_1068:
	movrgz	%g4,	%g7,	%i5
	edge8n	%i0,	%i4,	%o4
	edge8l	%l0,	%o7,	%o1
	mulscc	%l1,	0x1594,	%l3
	tvs	%xcc,	0x3
	movge	%xcc,	%g5,	%g6
	tn	%xcc,	0x3
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x24] %asi,	%f19
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%o5
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x2C] %asi,	%f30
	fmovdge	%icc,	%f2,	%f0
	sir	0x0D1E
	tge	%xcc,	0x5
	movne	%icc,	%g1,	%g3
	stw	%o6,	[%l7 + 0x64]
	brz	%o3,	loop_1069
	fmovdneg	%xcc,	%f25,	%f10
	stw	%l2,	[%l7 + 0x68]
	bl,a,pn	%icc,	loop_1070
loop_1069:
	te	%icc,	0x2
	fbug	%fcc3,	loop_1071
	bg	loop_1072
loop_1070:
	edge8n	%l5,	%o2,	%i1
	movcc	%icc,	%i6,	%l4
loop_1071:
	fmovrslez	%o0,	%f1,	%f28
loop_1072:
	fmovsl	%icc,	%f15,	%f19
	movrgz	%l6,	0x23E,	%i2
	bne	%xcc,	loop_1073
	udivcc	%i3,	0x1838,	%g2
	movcc	%xcc,	%g4,	%i7
	set	0x52, %i4
	stha	%g7,	[%l7 + %i4] 0x19
loop_1073:
	nop
	set	0x18, %l5
	ldswa	[%l7 + %l5] 0x88,	%i5
	bn,a,pt	%icc,	loop_1074
	movcc	%xcc,	%i0,	%o4
	xnorcc	%l0,	0x0DDB,	%o7
	bg,a	loop_1075
loop_1074:
	fmovsn	%xcc,	%f8,	%f31
	edge8l	%i4,	%o1,	%l1
	fmovdn	%xcc,	%f23,	%f19
loop_1075:
	sll	%g5,	%l3,	%g6
	ldub	[%l7 + 0x76],	%g1
	nop
	setx	0xE05DAF31,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	fands	%f21,	%f15,	%f4
	movge	%icc,	%o5,	%g3
	xorcc	%o6,	0x0D44,	%o3
	array8	%l2,	%o2,	%i1
	ba,pn	%xcc,	loop_1076
	fmovdn	%xcc,	%f31,	%f21
	movvc	%xcc,	%i6,	%l5
	udiv	%l4,	0x1B9D,	%l6
loop_1076:
	orncc	%o0,	0x1713,	%i2
	set	0x18, %o7
	prefetcha	[%l7 + %o7] 0x11,	 0x0
	stx	%i3,	[%l7 + 0x08]
	fbl,a	%fcc1,	loop_1077
	umulcc	%i7,	%g4,	%i5
	edge16n	%i0,	%g7,	%l0
	stw	%o7,	[%l7 + 0x28]
loop_1077:
	taddcc	%i4,	0x1F76,	%o4
	mulx	%o1,	0x0C1A,	%l1
	addccc	%g5,	0x0FAF,	%g6
	fmovse	%xcc,	%f1,	%f18
	array8	%l3,	%g1,	%g3
	subcc	%o6,	%o3,	%l2
	edge16ln	%o5,	%o2,	%i1
	mulscc	%i6,	0x0A01,	%l5
	movcc	%xcc,	%l4,	%l6
	stw	%o0,	[%l7 + 0x14]
	tne	%icc,	0x2
	tg	%xcc,	0x1
	prefetch	[%l7 + 0x60],	 0x3
	fmovdvc	%icc,	%f22,	%f6
	add	%g2,	%i3,	%i2
	edge16	%i7,	%g4,	%i5
	mova	%xcc,	%g7,	%l0
	fbo	%fcc1,	loop_1078
	movle	%xcc,	%i0,	%i4
	fbne	%fcc2,	loop_1079
	fandnot2s	%f18,	%f15,	%f29
loop_1078:
	tvc	%icc,	0x1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x10] %asi,	%f19
loop_1079:
	add	%o4,	0x16B3,	%o7
	sdiv	%l1,	0x0D65,	%o1
	movgu	%xcc,	%g6,	%l3
	alignaddrl	%g5,	%g1,	%g3
	call	loop_1080
	call	loop_1081
	tne	%xcc,	0x6
	membar	0x09
loop_1080:
	smul	%o3,	0x092A,	%o6
loop_1081:
	brnz,a	%o5,	loop_1082
	fmul8x16	%f5,	%f20,	%f20
	edge32l	%l2,	%o2,	%i6
	srax	%l5,	%i1,	%l6
loop_1082:
	nop
	wr	%g0,	0x23,	%asi
	stba	%l4,	[%l7 + 0x58] %asi
	membar	#Sync
	tn	%xcc,	0x3
	movrlz	%o0,	0x165,	%i3
	edge32ln	%g2,	%i2,	%i7
	fornot2s	%f6,	%f16,	%f23
	array8	%i5,	%g4,	%g7
	stx	%l0,	[%l7 + 0x38]
	movneg	%icc,	%i0,	%o4
	fnands	%f14,	%f18,	%f22
	prefetch	[%l7 + 0x24],	 0x1
	nop
	setx	0xCC314FD7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x053136B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f23,	%f27
	tvc	%icc,	0x6
	movge	%xcc,	%i4,	%l1
	popc	0x01DF,	%o1
	brlz	%g6,	loop_1083
	sdivx	%l3,	0x1721,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g5,	%g3,	%g1
loop_1083:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f25,	%f2,	%f6
	nop
	setx	loop_1084,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbug,a	%fcc0,	loop_1085
	xorcc	%o3,	%o5,	%l2
	or	%o2,	0x12CA,	%i6
loop_1084:
	brgez,a	%l5,	loop_1086
loop_1085:
	movrlz	%i1,	%o6,	%l6
	or	%o0,	0x1FF7,	%l4
	fpadd16s	%f11,	%f7,	%f18
loop_1086:
	edge16ln	%g2,	%i3,	%i2
	tn	%xcc,	0x2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x76] %asi,	%i7
	set	0x30, %o4
	ldda	[%l7 + %o4] 0xeb,	%i4
	set	0x08, %l4
	lda	[%l7 + %l4] 0x19,	%f4
	bne,pt	%icc,	loop_1087
	or	%g7,	0x09B2,	%l0
	tneg	%xcc,	0x0
	nop
	setx	0xBC3490F0605F6C76,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_1087:
	movrlz	%g4,	0x3B6,	%o4
	udivx	%i4,	0x111C,	%i0
	fble	%fcc2,	loop_1088
	taddcc	%o1,	0x1912,	%g6
	xor	%l1,	%l3,	%g5
	fones	%f7
loop_1088:
	fbo	%fcc3,	loop_1089
	membar	0x3E
	movrlz	%g3,	%g1,	%o3
	st	%f2,	[%l7 + 0x48]
loop_1089:
	addccc	%o7,	0x0929,	%l2
	andn	%o5,	%i6,	%o2
	nop
	setx	0x4F54F37C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xE11E11EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f29,	%f21
	nop
	fitod	%f0,	%f24
	fdtox	%f24,	%f0
	be	loop_1090
	movne	%xcc,	%i1,	%o6
	edge32l	%l6,	%l5,	%l4
	fbn	%fcc0,	loop_1091
loop_1090:
	edge16l	%g2,	%o0,	%i3
	ldd	[%l7 + 0x78],	%i2
	fcmpeq16	%f0,	%f10,	%i7
loop_1091:
	andn	%g7,	%l0,	%i5
	fxor	%f22,	%f22,	%f8
	call	loop_1092
	fba	%fcc1,	loop_1093
	edge16l	%o4,	%i4,	%g4
	ldsw	[%l7 + 0x74],	%i0
loop_1092:
	srl	%g6,	0x0E,	%l1
loop_1093:
	fnot1	%f4,	%f20
	tne	%xcc,	0x1
	sth	%o1,	[%l7 + 0x20]
	movcc	%icc,	%l3,	%g3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x5C] %asi,	%g5
	fbule,a	%fcc3,	loop_1094
	edge32l	%o3,	%o7,	%l2
	fbug	%fcc2,	loop_1095
	smulcc	%o5,	%g1,	%i6
loop_1094:
	fbg,a	%fcc0,	loop_1096
	fpmerge	%f19,	%f30,	%f24
loop_1095:
	bl,a,pn	%icc,	loop_1097
	ldsh	[%l7 + 0x42],	%i1
loop_1096:
	xor	%o6,	0x14E8,	%l6
	sll	%l5,	0x11,	%l4
loop_1097:
	and	%g2,	%o0,	%i3
	smul	%o2,	0x0860,	%i7
	tgu	%xcc,	0x3
	ldub	[%l7 + 0x08],	%g7
	xorcc	%i2,	0x02D2,	%l0
	membar	0x57
	tpos	%xcc,	0x1
	fornot1s	%f0,	%f9,	%f28
	bg,a,pn	%xcc,	loop_1098
	xor	%i5,	%i4,	%o4
	smul	%g4,	0x08C2,	%i0
	tg	%icc,	0x3
loop_1098:
	andncc	%g6,	%o1,	%l1
	bg,a,pt	%xcc,	loop_1099
	movre	%l3,	%g5,	%g3
	brlz,a	%o3,	loop_1100
	fmovdcs	%icc,	%f3,	%f19
loop_1099:
	fcmpne32	%f4,	%f20,	%l2
	movre	%o7,	%g1,	%o5
loop_1100:
	xor	%i1,	0x1D9B,	%i6
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge16l	%o6,	%l5,	%l6
	fbl,a	%fcc1,	loop_1101
	movleu	%xcc,	%g2,	%o0
	fmovdleu	%xcc,	%f2,	%f3
	bgu,a,pt	%xcc,	loop_1102
loop_1101:
	nop
	fitod	%f8,	%f4
	fdtoi	%f4,	%f22
	sir	0x1BDD
	smul	%i3,	0x03D0,	%l4
loop_1102:
	smulcc	%i7,	%g7,	%i2
	set	0x4C, %l1
	ldswa	[%l7 + %l1] 0x15,	%l0
	fxor	%f6,	%f24,	%f30
	tcc	%xcc,	0x2
	udivx	%o2,	0x088B,	%i5
	array16	%i4,	%o4,	%g4
	stb	%i0,	[%l7 + 0x60]
	fmovrslz	%g6,	%f7,	%f9
	fmovrdne	%o1,	%f2,	%f16
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%l3
	movcs	%icc,	%g5,	%g3
	orcc	%l1,	0x16F3,	%l2
	movg	%icc,	%o7,	%g1
	movcs	%xcc,	%o3,	%o5
	subcc	%i1,	0x0498,	%i6
	be,a,pn	%icc,	loop_1103
	fbe	%fcc3,	loop_1104
	fmovsleu	%xcc,	%f5,	%f12
	addc	%o6,	%l5,	%g2
loop_1103:
	addcc	%o0,	0x10DF,	%l6
loop_1104:
	movleu	%icc,	%i3,	%l4
	tneg	%xcc,	0x7
	for	%f4,	%f16,	%f18
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x44] %asi,	%i7
	srlx	%i2,	0x0C,	%l0
	te	%xcc,	0x6
	swap	[%l7 + 0x64],	%o2
	tgu	%icc,	0x5
	movge	%xcc,	%g7,	%i5
	alignaddrl	%i4,	%g4,	%i0
	orncc	%o4,	0x135B,	%g6
	edge8	%l3,	%o1,	%g5
	bcs,a	loop_1105
	tl	%xcc,	0x1
	and	%g3,	0x0B62,	%l2
	tpos	%xcc,	0x1
loop_1105:
	array8	%o7,	%g1,	%o3
	sir	0x120C
	orn	%l1,	0x1053,	%i1
	mova	%icc,	%i6,	%o6
	call	loop_1106
	tne	%icc,	0x6
	movn	%icc,	%l5,	%o5
	addc	%o0,	%g2,	%i3
loop_1106:
	movrlz	%l4,	0x1E3,	%i7
	fnegs	%f24,	%f28
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movvs	%xcc,	%l6,	%l0
	wr	%g0,	0x2b,	%asi
	stwa	%i2,	[%l7 + 0x24] %asi
	membar	#Sync
	fbe,a	%fcc3,	loop_1107
	smulcc	%g7,	0x00FF,	%o2
	stbar
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x08] %asi,	%i4
loop_1107:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x50] %asi,	%i4
	bcs,pn	%xcc,	loop_1108
	mova	%xcc,	%i0,	%o4
	mulx	%g6,	%l3,	%o1
	bn,a,pt	%icc,	loop_1109
loop_1108:
	sdiv	%g4,	0x093C,	%g3
	be,pt	%xcc,	loop_1110
	orncc	%l2,	%g5,	%o7
loop_1109:
	membar	0x23
	udivx	%o3,	0x1A87,	%l1
loop_1110:
	nop
	setx	0xC05FE241,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%g1,	%i1
	edge8n	%o6,	%l5,	%o5
	fmovdgu	%icc,	%f24,	%f2
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x2C] %asi,	%i6
	fabsd	%f8,	%f2
	addccc	%o0,	%i3,	%l4
	tvc	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x38] %asi,	%g2
	umul	%l6,	%l0,	%i7
	for	%f6,	%f22,	%f30
	edge16ln	%g7,	%o2,	%i2
	taddcc	%i5,	0x1FB7,	%i0
	sra	%i4,	0x1E,	%g6
	movg	%icc,	%l3,	%o4
	fcmple32	%f6,	%f0,	%g4
	set	0x78, %o6
	stxa	%o1,	[%l7 + %o6] 0x10
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l2
	tcc	%icc,	0x6
	brgez,a	%g5,	loop_1111
	movne	%icc,	%g3,	%o7
	fbg	%fcc2,	loop_1112
	edge16	%o3,	%l1,	%i1
loop_1111:
	fbne	%fcc0,	loop_1113
	edge8n	%g1,	%l5,	%o6
loop_1112:
	bge,a	%icc,	loop_1114
	edge16n	%o5,	%i6,	%i3
loop_1113:
	nop
	setx	0x80765E88,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	movre	%l4,	0x2C5,	%g2
loop_1114:
	movrne	%l6,	%l0,	%o0
	xnor	%i7,	%g7,	%o2
	edge32n	%i5,	%i2,	%i0
	add	%g6,	%l3,	%o4
	movcs	%xcc,	%g4,	%i4
	set	0x78, %g2
	lda	[%l7 + %g2] 0x10,	%f8
	movgu	%icc,	%l2,	%o1
	xor	%g5,	0x013D,	%g3
	fnegs	%f27,	%f20
	srax	%o3,	0x1B,	%o7
	movn	%icc,	%i1,	%g1
	set	0x57, %l2
	ldstuba	[%l7 + %l2] 0x80,	%l5
	bvs,pt	%icc,	loop_1115
	edge8l	%o6,	%o5,	%l1
	movvc	%xcc,	%i3,	%i6
	tge	%icc,	0x7
loop_1115:
	sll	%l4,	0x17,	%g2
	xor	%l0,	0x0A78,	%o0
	movge	%icc,	%l6,	%i7
	edge16n	%g7,	%i5,	%o2
	array8	%i2,	%i0,	%l3
	edge8n	%o4,	%g6,	%i4
	ldstub	[%l7 + 0x3E],	%l2
	sdivx	%g4,	0x1146,	%g5
	fpack16	%f24,	%f14
	stx	%g3,	[%l7 + 0x40]
	bgu,a	loop_1116
	movleu	%xcc,	%o3,	%o1
	ta	%icc,	0x1
	udivcc	%i1,	0x13A4,	%o7
loop_1116:
	fmovrsgez	%l5,	%f8,	%f30
	array8	%g1,	%o6,	%l1
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x70] %asi,	%o5
	movcs	%xcc,	%i3,	%i6
	movrgz	%g2,	0x2F8,	%l0
	umul	%o0,	0x1773,	%l6
	sethi	0x1298,	%l4
	fpsub32	%f26,	%f10,	%f26
	fble	%fcc1,	loop_1117
	fbo	%fcc1,	loop_1118
	tn	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1117:
	edge16n	%g7,	%i7,	%i5
loop_1118:
	movvc	%icc,	%i2,	%o2
	addcc	%l3,	%o4,	%g6
	fornot1	%f2,	%f6,	%f22
	bn,pn	%icc,	loop_1119
	stb	%i0,	[%l7 + 0x1F]
	fba	%fcc0,	loop_1120
	bne,pt	%xcc,	loop_1121
loop_1119:
	andn	%l2,	%i4,	%g5
	fmovsa	%xcc,	%f26,	%f15
loop_1120:
	movpos	%xcc,	%g3,	%o3
loop_1121:
	movvc	%icc,	%o1,	%g4
	stbar
	fmovrde	%o7,	%f26,	%f16
	flush	%l7 + 0x58
	movneg	%xcc,	%i1,	%l5
	tvc	%icc,	0x7
	subccc	%o6,	0x0278,	%l1
	tvc	%xcc,	0x0
	edge8	%g1,	%i3,	%o5
	subcc	%g2,	0x0F02,	%i6
	brz	%l0,	loop_1122
	swap	[%l7 + 0x0C],	%o0
	edge32l	%l4,	%g7,	%l6
	wr	%g0,	0x11,	%asi
	stxa	%i7,	[%l7 + 0x38] %asi
loop_1122:
	fpadd32s	%f12,	%f3,	%f14
	taddcctv	%i5,	%o2,	%i2
	fmovrslz	%l3,	%f29,	%f2
	tneg	%icc,	0x1
	movvc	%xcc,	%o4,	%i0
	prefetch	[%l7 + 0x70],	 0x0
	membar	0x26
	fbne	%fcc0,	loop_1123
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
	edge16n	%l2,	%g6,	%g5
	orn	%g3,	0x1F93,	%i4
loop_1123:
	movne	%icc,	%o1,	%g4
loop_1124:
	xnorcc	%o7,	0x0350,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%icc,	%f8,	%f16
	fmovdpos	%xcc,	%f11,	%f28
	edge32n	%l5,	%o6,	%l1
	udivx	%g1,	0x0145,	%i1
	addcc	%i3,	%g2,	%i6
	taddcc	%o5,	%o0,	%l0
	umul	%l4,	%l6,	%i7
	orn	%i5,	0x1C70,	%g7
	nop
	fitos	%f10,	%f31
	fstox	%f31,	%f22
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fba,a	%fcc3,	loop_1125
	std	%f24,	[%l7 + 0x60]
	orncc	%i2,	0x0A5F,	%o2
	nop
	setx	0xB07FDA93,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
loop_1125:
	orcc	%l3,	0x0956,	%i0
	ldx	[%l7 + 0x18],	%l2
	nop
	fitod	%f6,	%f8
	fdtos	%f8,	%f13
	fors	%f28,	%f12,	%f28
	movcs	%icc,	%g6,	%o4
	andcc	%g3,	0x19F5,	%i4
	tn	%xcc,	0x3
	movg	%xcc,	%o1,	%g5
	addc	%g4,	%o7,	%o3
	fmovdvs	%icc,	%f29,	%f20
	bl,pt	%xcc,	loop_1126
	nop
	setx	loop_1127,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8	%l5,	%l1,	%o6
	fbule	%fcc0,	loop_1128
loop_1126:
	xorcc	%i1,	%g1,	%g2
loop_1127:
	nop
	setx	0xC8B1192E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC122B31D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f17,	%f12
	bgu,a	loop_1129
loop_1128:
	addc	%i6,	%i3,	%o0
	fmovsle	%xcc,	%f21,	%f12
	sdivcc	%l0,	0x1B2F,	%l4
loop_1129:
	edge32l	%l6,	%i7,	%o5
	subc	%i5,	%g7,	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%i2,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l3,	%g6
	sdivcc	%l2,	0x1E3C,	%o4
	mulx	%i4,	%o1,	%g5
	nop
	fitos	%f9,	%f21
	fstox	%f21,	%f10
	fxtos	%f10,	%f30
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
	fmovsge	%icc,	%f29,	%f9
	andn	%g3,	0x0B3A,	%g4
	orncc	%o3,	0x0540,	%l5
loop_1130:
	fpadd16	%f30,	%f22,	%f4
	movvs	%xcc,	%o7,	%l1
	movrlz	%o6,	0x0CB,	%i1
	umulcc	%g2,	%g1,	%i6
	fnot1s	%f19,	%f9
	taddcc	%i3,	0x1FAF,	%o0
	fmovsgu	%xcc,	%f30,	%f2
	set	0x6D, %g7
	ldsba	[%l7 + %g7] 0x81,	%l4
	sll	%l0,	0x18,	%i7
	tsubcc	%o5,	%l6,	%g7
	tvs	%icc,	0x1
	fmovsn	%xcc,	%f25,	%f7
	bshuffle	%f18,	%f24,	%f8
	edge32ln	%i5,	%o2,	%i2
	edge32n	%l3,	%g6,	%i0
	for	%f24,	%f18,	%f14
	te	%icc,	0x7
	tge	%icc,	0x2
	fmovdle	%xcc,	%f20,	%f11
	fmul8x16au	%f25,	%f12,	%f14
	stw	%l2,	[%l7 + 0x40]
	fmovdcs	%icc,	%f0,	%f17
	fble	%fcc1,	loop_1131
	edge32n	%o4,	%o1,	%i4
	mulx	%g5,	%g3,	%o3
	xor	%l5,	%o7,	%g4
loop_1131:
	array32	%l1,	%i1,	%o6
	taddcctv	%g1,	0x1817,	%g2
	nop
	setx	0xA2138CF7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x908F4647,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f5,	%f7
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%i3,	%o0
	bn	%xcc,	loop_1132
	lduh	[%l7 + 0x4C],	%l4
	udivx	%i6,	0x1D48,	%i7
	te	%icc,	0x7
loop_1132:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x75] %asi,	%l0
	tge	%xcc,	0x2
	nop
	fitos	%f9,	%f3
	fstox	%f3,	%f10
	udivx	%l6,	0x1E1B,	%o5
	fmovrslz	%g7,	%f31,	%f31
	ba,pn	%xcc,	loop_1133
	smul	%o2,	0x00ED,	%i5
	xor	%i2,	%g6,	%l3
	fmovrse	%l2,	%f13,	%f0
loop_1133:
	fsrc2s	%f3,	%f15
	movne	%icc,	%i0,	%o1
	fmovdne	%xcc,	%f2,	%f13
	fmovdneg	%xcc,	%f17,	%f14
	fbue	%fcc1,	loop_1134
	taddcctv	%o4,	0x0BF9,	%g5
	move	%xcc,	%g3,	%i4
	fornot2s	%f22,	%f6,	%f19
loop_1134:
	brgz,a	%l5,	loop_1135
	ld	[%l7 + 0x28],	%f18
	smulcc	%o3,	%o7,	%g4
	taddcctv	%l1,	%o6,	%g1
loop_1135:
	ta	%icc,	0x5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i1
	movle	%icc,	%g2,	%o0
	movvc	%icc,	%i3,	%i6
	tcc	%icc,	0x6
	movpos	%xcc,	%i7,	%l0
	edge16	%l6,	%o5,	%g7
	udivx	%o2,	0x1BAC,	%l4
	fmovdge	%icc,	%f16,	%f2
	ldub	[%l7 + 0x57],	%i5
	fpack32	%f0,	%f6,	%f16
	movvs	%icc,	%i2,	%g6
	sra	%l3,	%l2,	%o1
	fmovsneg	%xcc,	%f1,	%f12
	sir	0x1703
	fblg	%fcc1,	loop_1136
	te	%icc,	0x6
	fnot2	%f28,	%f8
	nop
	setx	0xC89A6D0790437F2F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_1136:
	fmovdvs	%icc,	%f27,	%f12
	smul	%o4,	%i0,	%g5
	fbu	%fcc0,	loop_1137
	edge8n	%i4,	%l5,	%g3
	sir	0x1997
	movge	%icc,	%o7,	%g4
loop_1137:
	fxnor	%f28,	%f12,	%f22
	tge	%icc,	0x3
	array16	%l1,	%o3,	%o6
	fmul8x16	%f23,	%f14,	%f30
	sllx	%i1,	0x15,	%g2
	movre	%o0,	0x372,	%g1
	te	%xcc,	0x7
	tneg	%icc,	0x2
	fble	%fcc3,	loop_1138
	andncc	%i3,	%i7,	%l0
	movrlez	%i6,	0x0D8,	%o5
	fmul8x16al	%f25,	%f30,	%f24
loop_1138:
	edge8ln	%g7,	%o2,	%l4
	fmovsg	%xcc,	%f18,	%f8
	movne	%icc,	%l6,	%i5
	or	%i2,	0x1A22,	%g6
	fpadd16	%f12,	%f12,	%f16
	set	0x18, %o3
	ldxa	[%g0 + %o3] 0x20,	%l3
	fbug,a	%fcc1,	loop_1139
	fmovde	%xcc,	%f27,	%f22
	brlez	%o1,	loop_1140
	pdist	%f20,	%f18,	%f4
loop_1139:
	xor	%o4,	0x07E9,	%l2
	movge	%icc,	%i0,	%g5
loop_1140:
	fnor	%f20,	%f4,	%f8
	bl	%xcc,	loop_1141
	movn	%xcc,	%i4,	%g3
	bvc,a	loop_1142
	edge16	%o7,	%g4,	%l5
loop_1141:
	subc	%l1,	0x03FD,	%o6
	movl	%icc,	%i1,	%o3
loop_1142:
	movpos	%icc,	%g2,	%g1
	edge32n	%o0,	%i7,	%i3
	mova	%icc,	%i6,	%l0
	movrne	%g7,	0x19B,	%o2
	nop
	setx	0x303AFF4B5CBD3570,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xE7EA9D8A8BFBE35A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f6,	%f4
	fbe	%fcc1,	loop_1143
	andn	%l4,	%l6,	%i5
	and	%o5,	0x169A,	%g6
	fmovdleu	%xcc,	%f23,	%f9
loop_1143:
	nop
	fitos	%f4,	%f22
	fstox	%f22,	%f20
	movne	%xcc,	%l3,	%o1
	fbn	%fcc3,	loop_1144
	addccc	%o4,	%i2,	%l2
	wr	%g0,	0x2a,	%asi
	stba	%g5,	[%l7 + 0x69] %asi
	membar	#Sync
loop_1144:
	sir	0x1DF4
	ldub	[%l7 + 0x26],	%i0
	movrlez	%g3,	0x312,	%i4
	mulx	%o7,	0x0FFD,	%l5
	tle	%icc,	0x6
	ldx	[%l7 + 0x68],	%l1
	nop
	setx	0x4C92DF01D04C29FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	sdiv	%o6,	0x0BF7,	%g4
	movgu	%icc,	%i1,	%g2
	addccc	%o3,	0x062F,	%g1
	bgu,a	%icc,	loop_1145
	addccc	%o0,	%i3,	%i7
	fmuld8ulx16	%f21,	%f14,	%f18
	fbue	%fcc1,	loop_1146
loop_1145:
	movneg	%xcc,	%l0,	%g7
	fpadd16	%f0,	%f24,	%f0
	edge8	%o2,	%l4,	%l6
loop_1146:
	fnot1	%f6,	%f24
	movpos	%icc,	%i5,	%o5
	bge,a	%xcc,	loop_1147
	sub	%i6,	%g6,	%o1
	ldsh	[%l7 + 0x70],	%o4
	edge32l	%l3,	%l2,	%i2
loop_1147:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f23,	%f8,	%f25
	tpos	%xcc,	0x2
	swap	[%l7 + 0x4C],	%g5
	movpos	%icc,	%g3,	%i0
	umul	%o7,	0x1B0F,	%i4
	fxors	%f18,	%f15,	%f25
	fcmpeq32	%f6,	%f20,	%l1
	tgu	%icc,	0x4
	fornot2s	%f11,	%f1,	%f0
	edge16l	%l5,	%o6,	%i1
	movcs	%icc,	%g2,	%g4
	fxors	%f29,	%f4,	%f11
	add	%g1,	0x0685,	%o3
	nop
	setx	0x9F60B460F03C6ED6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f10
	fbul,a	%fcc3,	loop_1148
	sth	%o0,	[%l7 + 0x3A]
	movl	%xcc,	%i7,	%i3
	edge16ln	%l0,	%g7,	%l4
loop_1148:
	tneg	%icc,	0x6
	fmovsgu	%icc,	%f14,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1961
	ta	%xcc,	0x1
	fxor	%f22,	%f6,	%f12
	movcs	%xcc,	%l6,	%o2
	sir	0x1816
	fmovd	%f30,	%f26
	fble	%fcc3,	loop_1149
	fmovs	%f6,	%f28
	alignaddr	%i5,	%i6,	%g6
	bcs,a,pn	%icc,	loop_1150
loop_1149:
	srax	%o5,	%o4,	%l3
	movgu	%icc,	%o1,	%i2
	movn	%xcc,	%l2,	%g3
loop_1150:
	fmul8sux16	%f24,	%f20,	%f4
	andn	%g5,	0x0AAA,	%o7
	fmovrdlez	%i0,	%f6,	%f18
	fbe,a	%fcc0,	loop_1151
	ldd	[%l7 + 0x40],	%f18
	taddcc	%i4,	%l5,	%o6
	fsrc2s	%f15,	%f23
loop_1151:
	tgu	%xcc,	0x6
	ldsh	[%l7 + 0x4E],	%l1
	movneg	%xcc,	%i1,	%g4
	sethi	0x0C1C,	%g2
	tpos	%xcc,	0x1
	movpos	%icc,	%g1,	%o3
	fnot1s	%f24,	%f26
	tgu	%icc,	0x7
	fcmpne32	%f2,	%f24,	%i7
	tsubcc	%o0,	0x132D,	%l0
	movvc	%xcc,	%g7,	%i3
	sdiv	%l4,	0x01D4,	%l6
	movneg	%icc,	%o2,	%i5
	brz	%g6,	loop_1152
	ldstub	[%l7 + 0x13],	%i6
	tcs	%xcc,	0x3
	bl,a	loop_1153
loop_1152:
	mulscc	%o4,	%o5,	%o1
	nop
	set	0x12, %o2
	stb	%l3,	[%l7 + %o2]
	fmuld8ulx16	%f21,	%f29,	%f24
loop_1153:
	taddcctv	%l2,	0x074B,	%g3
	bgu,a	%icc,	loop_1154
	fnot1s	%f15,	%f9
	swap	[%l7 + 0x10],	%i2
	tle	%icc,	0x5
loop_1154:
	mulx	%o7,	%i0,	%i4
	set	0x49, %g4
	lduba	[%l7 + %g4] 0x15,	%l5
	edge32n	%g5,	%o6,	%l1
	nop
	setx	0xBA45E845,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x52BB8AAB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f15,	%f30
	faligndata	%f30,	%f2,	%f14
	fbg	%fcc1,	loop_1155
	movvc	%icc,	%g4,	%i1
	tpos	%icc,	0x3
	movle	%icc,	%g2,	%o3
loop_1155:
	movgu	%xcc,	%g1,	%o0
	bcc,a,pn	%icc,	loop_1156
	brlz,a	%l0,	loop_1157
	tvs	%xcc,	0x3
	fbule	%fcc2,	loop_1158
loop_1156:
	tgu	%icc,	0x2
loop_1157:
	array8	%g7,	%i3,	%l4
	edge8	%l6,	%o2,	%i5
loop_1158:
	brnz	%i7,	loop_1159
	xnor	%i6,	%o4,	%g6
	wr	%g0,	0x04,	%asi
	stha	%o5,	[%l7 + 0x1E] %asi
loop_1159:
	nop
	setx	0x0B17211EB96451B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x347A146A63F537AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f22,	%f10
	sllx	%l3,	0x1E,	%l2
	udivx	%g3,	0x106B,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovrdlz	%i2,	%f10,	%f4
	tleu	%icc,	0x1
	subc	%o7,	0x00FF,	%i0
	fmovsne	%icc,	%f10,	%f25
	orcc	%i4,	%g5,	%l5
	alignaddr	%o6,	%g4,	%i1
	fmovdne	%icc,	%f24,	%f4
	sdivcc	%g2,	0x1ECA,	%o3
	orncc	%l1,	0x1A09,	%o0
	fmovdcs	%xcc,	%f12,	%f3
	move	%icc,	%l0,	%g1
	fmovsa	%xcc,	%f17,	%f18
	ta	%xcc,	0x3
	lduh	[%l7 + 0x54],	%i3
	fmovrdne	%l4,	%f28,	%f22
	array16	%g7,	%o2,	%l6
	fands	%f13,	%f14,	%f3
	movrlz	%i5,	0x225,	%i6
	wr	%g0,	0x81,	%asi
	sta	%f11,	[%l7 + 0x58] %asi
	subcc	%o4,	0x109E,	%i7
	tcs	%icc,	0x3
	fnot1	%f8,	%f12
	fandnot1s	%f6,	%f9,	%f25
	fzeros	%f20
	fcmpeq16	%f30,	%f10,	%g6
	tsubcctv	%l3,	0x0C62,	%l2
	bcc,a,pt	%icc,	loop_1160
	sub	%o5,	0x0A6C,	%o1
	nop
	setx	0xC071EFB4,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	fmul8sux16	%f26,	%f12,	%f12
loop_1160:
	nop
	setx	0xBB002ED2962FC4FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f2
	taddcctv	%g3,	%o7,	%i0
	movvc	%icc,	%i4,	%i2
	fmovsleu	%xcc,	%f30,	%f15
	movrlz	%l5,	0x057,	%o6
	tsubcc	%g4,	0x1715,	%i1
	andncc	%g5,	%g2,	%l1
	movrlez	%o0,	0x251,	%o3
	fnand	%f0,	%f18,	%f12
	tn	%xcc,	0x5
	fcmpgt32	%f20,	%f24,	%l0
	movpos	%xcc,	%i3,	%l4
	fmovdpos	%xcc,	%f10,	%f22
	subcc	%g1,	0x0771,	%o2
	pdist	%f30,	%f6,	%f2
	bge,a,pt	%xcc,	loop_1161
	sdivcc	%l6,	0x144A,	%i5
	umulcc	%i6,	%g7,	%i7
	edge32l	%g6,	%l3,	%l2
loop_1161:
	nop
	setx	0x8FC3696098D13176,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f18
	sir	0x0DA1
	tneg	%xcc,	0x3
	fbug	%fcc3,	loop_1162
	fnor	%f0,	%f0,	%f16
	addc	%o5,	%o1,	%o4
	fmovdvc	%icc,	%f19,	%f0
loop_1162:
	smulcc	%o7,	%i0,	%g3
	nop
	setx loop_1163, %l0, %l1
	jmpl %l1, %i2
	movg	%xcc,	%i4,	%o6
	fmul8sux16	%f20,	%f20,	%f18
	tle	%icc,	0x4
loop_1163:
	or	%l5,	%g4,	%g5
	fcmpne16	%f16,	%f28,	%g2
	tcs	%xcc,	0x5
	bn,pt	%xcc,	loop_1164
	add	%l1,	%o0,	%o3
	smul	%l0,	0x0503,	%i1
	edge32n	%l4,	%g1,	%o2
loop_1164:
	tvc	%xcc,	0x7
	tsubcctv	%l6,	%i3,	%i6
	addc	%i5,	0x0553,	%i7
	ldsw	[%l7 + 0x28],	%g7
	array8	%l3,	%g6,	%o5
	nop
	setx	0x017B90A9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x25413445,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f20,	%f14
	subcc	%l2,	%o4,	%o7
	fmovrsgz	%o1,	%f21,	%f10
	movleu	%icc,	%g3,	%i0
	and	%i2,	0x138F,	%i4
	fmul8ulx16	%f2,	%f0,	%f30
	ldsw	[%l7 + 0x6C],	%l5
	tn	%icc,	0x4
	fmovsg	%icc,	%f6,	%f9
	add	%g4,	%g5,	%o6
	stbar
	subccc	%g2,	%l1,	%o0
	subcc	%l0,	%o3,	%l4
	prefetch	[%l7 + 0x34],	 0x1
	xorcc	%g1,	0x0EA4,	%i1
	umulcc	%l6,	0x0577,	%i3
	popc	0x1E33,	%o2
	umulcc	%i5,	%i6,	%i7
	fmovsg	%icc,	%f25,	%f13
	stb	%g7,	[%l7 + 0x53]
	xor	%l3,	%g6,	%l2
	tleu	%xcc,	0x7
	fbue,a	%fcc3,	loop_1165
	nop
	setx	0x2A7CBD118D81F18A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x82EDF397B7246E57,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f16,	%f12
	edge8l	%o5,	%o4,	%o1
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%o7
loop_1165:
	tsubcc	%i2,	0x024F,	%i0
	alignaddrl	%i4,	%g4,	%g5
	tsubcctv	%l5,	0x01CB,	%g2
	brz	%o6,	loop_1166
	movne	%icc,	%l1,	%l0
	movrgz	%o3,	%l4,	%g1
	sdivx	%o0,	0x0709,	%l6
loop_1166:
	nop
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0x80
	call	loop_1167
	fpsub16	%f26,	%f28,	%f26
	fmovscc	%icc,	%f16,	%f28
	fcmpne16	%f8,	%f0,	%i3
loop_1167:
	edge32n	%o2,	%i1,	%i5
	fble,a	%fcc2,	loop_1168
	xorcc	%i7,	0x03D8,	%g7
	movle	%icc,	%i6,	%g6
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1168:
	andncc	%l3,	%o5,	%o4
	fcmpgt16	%f4,	%f6,	%l2
	edge32n	%o1,	%g3,	%o7
	fbue,a	%fcc2,	loop_1169
	srl	%i2,	0x10,	%i4
	fbl	%fcc2,	loop_1170
	fabsd	%f10,	%f6
loop_1169:
	udivcc	%g4,	0x1B35,	%i0
	tcs	%icc,	0x0
loop_1170:
	fnor	%f6,	%f22,	%f30
	movpos	%icc,	%g5,	%g2
	tvs	%xcc,	0x4
	bl,a	%icc,	loop_1171
	movleu	%icc,	%o6,	%l5
	edge16	%l0,	%o3,	%l1
	set	0x78, %l6
	sta	%f25,	[%l7 + %l6] 0x11
loop_1171:
	subc	%l4,	%g1,	%o0
	edge16	%l6,	%i3,	%i1
	movrlez	%i5,	%o2,	%g7
	bl,a	%icc,	loop_1172
	xnor	%i7,	%i6,	%g6
	edge8	%o5,	%l3,	%o4
	bvc,a	loop_1173
loop_1172:
	tvc	%icc,	0x3
	fand	%f6,	%f18,	%f0
	fxnors	%f28,	%f28,	%f14
loop_1173:
	tneg	%icc,	0x0
	tle	%xcc,	0x0
	nop
	fitos	%f21,	%f30
	srax	%l2,	0x0B,	%o1
	fmovdle	%icc,	%f1,	%f6
	set	0x68, %g3
	ldsha	[%l7 + %g3] 0x89,	%g3
	fmovsle	%icc,	%f15,	%f1
	fmul8x16al	%f3,	%f2,	%f8
	fmovdgu	%xcc,	%f24,	%f17
	addc	%o7,	0x16C6,	%i2
	movle	%xcc,	%i4,	%i0
	tsubcc	%g5,	0x14C2,	%g2
	edge8l	%o6,	%l5,	%l0
	sdiv	%o3,	0x0A22,	%l1
	tle	%xcc,	0x2
	addcc	%l4,	0x1DC6,	%g4
	fmovrdgz	%g1,	%f26,	%f26
	ba,a,pn	%xcc,	loop_1174
	array8	%l6,	%o0,	%i3
	fblg	%fcc1,	loop_1175
	sub	%i1,	%o2,	%i5
loop_1174:
	srl	%i7,	%i6,	%g7
	udivcc	%o5,	0x1579,	%g6
loop_1175:
	nop
	set	0x58, %o1
	stxa	%o4,	[%l7 + %o1] 0xea
	membar	#Sync
	fcmpgt16	%f18,	%f30,	%l2
	movleu	%icc,	%l3,	%g3
	sethi	0x02BA,	%o7
	sir	0x1FBF
	tl	%xcc,	0x0
	movg	%icc,	%i2,	%i4
	udivcc	%o1,	0x054C,	%i0
	edge16n	%g2,	%g5,	%l5
	array16	%l0,	%o6,	%o3
	nop
	setx loop_1176, %l0, %l1
	jmpl %l1, %l4
	bpos,a,pt	%xcc,	loop_1177
	bvs	%icc,	loop_1178
	ble	loop_1179
loop_1176:
	fbul	%fcc0,	loop_1180
loop_1177:
	tgu	%xcc,	0x3
loop_1178:
	xorcc	%l1,	%g4,	%g1
loop_1179:
	nop
	setx	loop_1181,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1180:
	bleu,a	%xcc,	loop_1182
	edge32ln	%l6,	%o0,	%i1
	addccc	%o2,	%i3,	%i5
loop_1181:
	fandnot1s	%f29,	%f22,	%f10
loop_1182:
	smul	%i7,	%i6,	%o5
	tpos	%icc,	0x7
	move	%xcc,	%g7,	%o4
	edge8l	%l2,	%g6,	%l3
	nop
	setx	loop_1183,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivcc	%o7,	0x1F7B,	%g3
	edge32	%i2,	%i4,	%i0
	fbge	%fcc0,	loop_1184
loop_1183:
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f12
	fxtod	%f12,	%f26
	tg	%icc,	0x3
	movcs	%xcc,	%o1,	%g2
loop_1184:
	fcmple16	%f20,	%f14,	%l5
	fmul8ulx16	%f6,	%f24,	%f28
	sllx	%l0,	%g5,	%o3
	fnot2s	%f16,	%f31
	brgz	%o6,	loop_1185
	fbu,a	%fcc1,	loop_1186
	fcmple32	%f14,	%f6,	%l4
	sdivcc	%g4,	0x174A,	%l1
loop_1185:
	edge16l	%g1,	%o0,	%l6
loop_1186:
	fmovdpos	%icc,	%f3,	%f29
	movpos	%icc,	%o2,	%i1
	sth	%i5,	[%l7 + 0x32]
	fmovsgu	%xcc,	%f4,	%f17
	fmovsvc	%icc,	%f2,	%f10
	fmul8sux16	%f10,	%f28,	%f8
	te	%icc,	0x3
	orcc	%i7,	%i6,	%o5
	movpos	%xcc,	%i3,	%o4
	nop
	set	0x64, %l3
	sth	%l2,	[%l7 + %l3]
	movrlz	%g7,	0x238,	%l3
	tsubcc	%g6,	%o7,	%i2
	edge8l	%i4,	%g3,	%i0
	fmovsn	%icc,	%f6,	%f0
	srl	%o1,	0x0B,	%l5
	nop
	setx	0x9A5A8AEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x33DB53A5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f28,	%f12
	ld	[%l7 + 0x7C],	%f8
	tneg	%icc,	0x5
	add	%l0,	%g5,	%g2
	ldsb	[%l7 + 0x6E],	%o3
	srax	%o6,	0x13,	%g4
	movle	%icc,	%l4,	%g1
	fmovrsgez	%l1,	%f2,	%f11
	andncc	%l6,	%o2,	%i1
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x81
	xnorcc	%i5,	0x04CE,	%o0
	sra	%i7,	%i6,	%o5
	mulscc	%i3,	%o4,	%l2
	sdivx	%l3,	0x0F44,	%g6
	prefetch	[%l7 + 0x28],	 0x0
	edge16n	%o7,	%i2,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%g7
	movrgez	%o1,	0x064,	%i0
	sll	%l0,	%g5,	%g2
	udivcc	%l5,	0x0191,	%o6
	sdivx	%o3,	0x0EB2,	%g4
	tsubcctv	%l4,	%g1,	%l1
	tvc	%icc,	0x5
	fmovrdgez	%l6,	%f20,	%f2
	smul	%o2,	0x1070,	%i1
	sir	0x0199
	fnot1s	%f18,	%f10
	sir	0x14FF
	srax	%o0,	0x09,	%i5
	fnot1	%f20,	%f4
	movrlez	%i6,	0x2B8,	%i7
	movg	%icc,	%i3,	%o5
	popc	0x12E8,	%o4
	alignaddr	%l2,	%l3,	%o7
	ldsh	[%l7 + 0x46],	%g6
	udivcc	%i2,	0x138B,	%i4
	fbe,a	%fcc1,	loop_1187
	movrlz	%g7,	%g3,	%o1
	tgu	%xcc,	0x2
	tg	%xcc,	0x5
loop_1187:
	edge32n	%i0,	%g5,	%g2
	edge16n	%l5,	%l0,	%o6
	fblg,a	%fcc2,	loop_1188
	fmovde	%icc,	%f2,	%f1
	sdivcc	%g4,	0x0455,	%l4
	sdiv	%g1,	0x162B,	%l1
loop_1188:
	movrlz	%l6,	0x280,	%o3
	edge32n	%i1,	%o0,	%i5
	tn	%icc,	0x4
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i6,	%i7
	fmuld8sux16	%f20,	%f21,	%f28
	fble	%fcc3,	loop_1189
	pdist	%f20,	%f20,	%f6
	sllx	%o2,	%i3,	%o5
	edge8l	%l2,	%o4,	%l3
loop_1189:
	orncc	%g6,	0x02E1,	%i2
	alignaddrl	%i4,	%g7,	%g3
	sllx	%o7,	%i0,	%g5
	edge8	%o1,	%l5,	%g2
	taddcc	%l0,	0x1929,	%o6
	tl	%xcc,	0x7
	tne	%icc,	0x3
	udiv	%l4,	0x1940,	%g1
	addcc	%l1,	%g4,	%l6
	tneg	%icc,	0x2
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x15,	%i0
	udivcc	%o3,	0x007B,	%i5
	movpos	%xcc,	%o0,	%i6
	srax	%i7,	0x19,	%i3
	brgez,a	%o5,	loop_1190
	array32	%l2,	%o4,	%o2
	movle	%xcc,	%l3,	%i2
	ldsw	[%l7 + 0x1C],	%g6
loop_1190:
	fcmpeq32	%f18,	%f12,	%g7
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x09] %asi,	%i4
	sdiv	%o7,	0x1AE1,	%g3
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x3D] %asi,	%i0
	bne,a,pn	%xcc,	loop_1191
	edge8n	%o1,	%g5,	%l5
	edge16	%l0,	%g2,	%l4
	sub	%o6,	0x02AA,	%g1
loop_1191:
	srlx	%l1,	%g4,	%i1
	tsubcc	%o3,	%l6,	%i5
	addc	%o0,	0x082D,	%i7
	sra	%i3,	%i6,	%o5
	fzeros	%f31
	nop
	set	0x60, %i1
	ldsh	[%l7 + %i1],	%l2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x52] %asi,	%o2
	andcc	%l3,	%o4,	%g6
	fmovrse	%i2,	%f6,	%f10
	fmovsa	%xcc,	%f19,	%f24
	bvc,a	%icc,	loop_1192
	movleu	%xcc,	%i4,	%o7
	bg	%icc,	loop_1193
	tvc	%xcc,	0x2
loop_1192:
	bpos	loop_1194
	movvc	%icc,	%g3,	%g7
loop_1193:
	fxor	%f0,	%f16,	%f28
	nop
	fitos	%f5,	%f17
	fstoi	%f17,	%f6
loop_1194:
	sll	%i0,	%g5,	%l5
	fmovsleu	%icc,	%f28,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l0,	0x0106,	%o1
	andncc	%l4,	%o6,	%g2
	nop
	fitod	%f10,	%f8
	fdtoi	%f8,	%f31
	nop
	setx	loop_1195,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32ln	%l1,	%g4,	%i1
	nop
	fitod	%f10,	%f26
	fdtox	%f26,	%f2
	orncc	%g1,	%o3,	%i5
loop_1195:
	edge16	%l6,	%i7,	%i3
	edge16	%i6,	%o0,	%l2
	umulcc	%o2,	%o5,	%o4
	srlx	%l3,	0x15,	%g6
	tcs	%xcc,	0x2
	movleu	%icc,	%i2,	%i4
	bge,a,pn	%icc,	loop_1196
	addc	%o7,	0x0332,	%g7
	sllx	%g3,	0x19,	%g5
	edge32	%i0,	%l0,	%l5
loop_1196:
	move	%icc,	%l4,	%o6
	movge	%icc,	%o1,	%g2
	movrlz	%g4,	%l1,	%g1
	edge8ln	%i1,	%i5,	%o3
	tvs	%xcc,	0x2
	bge,a	loop_1197
	srl	%i7,	%i3,	%l6
	fnot2s	%f11,	%f31
	edge8ln	%i6,	%l2,	%o2
loop_1197:
	tge	%xcc,	0x2
	sethi	0x1C7E,	%o0
	srlx	%o5,	%o4,	%g6
	fxors	%f19,	%f10,	%f7
	edge8n	%i2,	%i4,	%l3
	orn	%g7,	%g3,	%o7
	move	%icc,	%g5,	%i0
	fmovs	%f10,	%f20
	fmovsgu	%xcc,	%f3,	%f30
	fmovdl	%icc,	%f22,	%f18
	fcmpeq32	%f24,	%f16,	%l0
	ldd	[%l7 + 0x10],	%f22
	popc	%l5,	%l4
	brnz,a	%o6,	loop_1198
	movne	%icc,	%o1,	%g2
	brlez,a	%g4,	loop_1199
	fblg,a	%fcc2,	loop_1200
loop_1198:
	movge	%icc,	%g1,	%l1
	taddcctv	%i1,	%o3,	%i5
loop_1199:
	fbne	%fcc3,	loop_1201
loop_1200:
	fbuge,a	%fcc1,	loop_1202
	edge16n	%i7,	%l6,	%i3
	faligndata	%f20,	%f16,	%f26
loop_1201:
	orncc	%i6,	%l2,	%o0
loop_1202:
	movrgz	%o2,	%o5,	%o4
	fcmpne32	%f14,	%f30,	%g6
	nop
	setx	loop_1203,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbne	%fcc2,	loop_1204
	movgu	%xcc,	%i2,	%l3
	edge8ln	%g7,	%g3,	%i4
loop_1203:
	fmovdne	%xcc,	%f3,	%f26
loop_1204:
	andncc	%o7,	%g5,	%i0
	nop
	fitos	%f6,	%f31
	fstoi	%f31,	%f27
	sdiv	%l5,	0x0A39,	%l4
	fpadd32	%f28,	%f28,	%f28
	membar	0x50
	te	%icc,	0x0
	addcc	%o6,	%o1,	%g2
	orcc	%l0,	%g1,	%g4
	ble,a	loop_1205
	subc	%i1,	%l1,	%o3
	ld	[%l7 + 0x50],	%f28
	umul	%i5,	%l6,	%i7
loop_1205:
	nop
	setx	0xD01BBC2BB1110483,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x66F0BB2502B5A932,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f20,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,pn	%xcc,	loop_1206
	nop
	set	0x30, %g5
	stw	%i3,	[%l7 + %g5]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i6,	%l2,	%o2
loop_1206:
	sethi	0x0267,	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%g6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
	membar	0x6E
	set	0x18, %i6
	lduha	[%l7 + %i6] 0x81,	%i2
	edge16n	%l3,	%g7,	%g3
	sdivx	%i4,	0x1AE8,	%o7
	movrlez	%g5,	0x113,	%l5
	edge32l	%i0,	%o6,	%o1
	fpadd32	%f8,	%f26,	%f6
	orcc	%l4,	0x1853,	%l0
	movrne	%g2,	0x034,	%g1
	ldx	[%l7 + 0x50],	%g4
	tneg	%xcc,	0x6
	movleu	%icc,	%l1,	%o3
	xnor	%i1,	0x1D7D,	%i5
	fornot1s	%f25,	%f2,	%f22
	bneg,pn	%xcc,	loop_1207
	andcc	%i7,	%i3,	%i6
	edge8ln	%l2,	%o2,	%l6
	movvc	%icc,	%o0,	%o5
loop_1207:
	ldsb	[%l7 + 0x1A],	%o4
	brgez,a	%g6,	loop_1208
	fmovdneg	%icc,	%f15,	%f31
	ldsh	[%l7 + 0x66],	%i2
	fba	%fcc1,	loop_1209
loop_1208:
	taddcc	%l3,	%g7,	%i4
	nop
	setx	0x17A59306F484D959,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xB5F772A88B41F78F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f6,	%f26
	array32	%o7,	%g3,	%g5
loop_1209:
	fnot1s	%f5,	%f3
	tcc	%xcc,	0x7
	movrgz	%l5,	0x131,	%i0
	sdivx	%o6,	0x1E41,	%l4
	movcs	%icc,	%o1,	%g2
	fbul	%fcc0,	loop_1210
	fzeros	%f3
	sub	%g1,	0x1791,	%g4
	edge8	%l1,	%l0,	%i1
loop_1210:
	fmovrsgz	%o3,	%f21,	%f16
	or	%i5,	0x1601,	%i3
	array8	%i6,	%l2,	%o2
	ta	%icc,	0x5
	sir	0x0977
	fba,a	%fcc3,	loop_1211
	alignaddr	%l6,	%o0,	%i7
	edge8l	%o5,	%o4,	%g6
	sdivx	%i2,	0x041E,	%g7
loop_1211:
	tcc	%xcc,	0x6
	ldsh	[%l7 + 0x20],	%l3
	bgu	loop_1212
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f28,	%f18,	%o7
	fmovd	%f12,	%f2
loop_1212:
	add	%g3,	0x0870,	%i4
	fmovrdne	%l5,	%f24,	%f0
	srax	%i0,	0x02,	%g5
	edge16l	%l4,	%o1,	%g2
	umulcc	%o6,	0x1835,	%g1
	fbg	%fcc2,	loop_1213
	tcc	%xcc,	0x6
	fmovsne	%xcc,	%f20,	%f13
	tleu	%xcc,	0x7
loop_1213:
	tleu	%xcc,	0x0
	movle	%icc,	%l1,	%g4
	orn	%l0,	0x1446,	%o3
	fand	%f24,	%f24,	%f6
	srl	%i5,	0x0E,	%i3
	andncc	%i1,	%i6,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc0,	loop_1214
	tl	%xcc,	0x3
	sdivcc	%l6,	0x1947,	%o2
	addccc	%i7,	0x176C,	%o0
loop_1214:
	swap	[%l7 + 0x74],	%o5
	andn	%g6,	0x1603,	%o4
	edge16l	%g7,	%l3,	%o7
	fpadd32	%f12,	%f24,	%f2
	be,a,pt	%icc,	loop_1215
	nop
	setx	0x0B71938D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x3B2626FB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f25,	%f16
	fmovrslz	%i2,	%f31,	%f18
	popc	%i4,	%g3
loop_1215:
	udivx	%l5,	0x0666,	%i0
	smulcc	%g5,	%o1,	%g2
	st	%f0,	[%l7 + 0x1C]
	taddcc	%l4,	0x0B7B,	%o6
	sdivcc	%l1,	0x17BB,	%g1
	movl	%icc,	%g4,	%o3
	wr	%g0,	0x80,	%asi
	stba	%i5,	[%l7 + 0x56] %asi
	taddcc	%i3,	0x0EB0,	%i1
	tneg	%xcc,	0x4
	fmovrdlz	%l0,	%f16,	%f10
	taddcctv	%l2,	%i6,	%o2
	addc	%l6,	%o0,	%i7
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x1e,	%f16
	sethi	0x0835,	%o5
	fble	%fcc0,	loop_1216
	sethi	0x08DF,	%o4
	tn	%xcc,	0x5
	udivx	%g6,	0x0DDA,	%g7
loop_1216:
	add	%l3,	0x102C,	%i2
	nop
	setx	0xA3E9DEC8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f30
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i4,	%o7
	movgu	%xcc,	%g3,	%l5
	movrne	%i0,	%g5,	%o1
	fnands	%f9,	%f3,	%f7
	edge8n	%l4,	%o6,	%g2
	tgu	%xcc,	0x1
	movge	%xcc,	%g1,	%l1
	tsubcc	%o3,	0x1447,	%i5
	movre	%i3,	%i1,	%g4
	subcc	%l2,	%l0,	%i6
	orn	%o2,	0x1C14,	%o0
	movrlz	%i7,	%o5,	%o4
	udivx	%l6,	0x160E,	%g6
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	tvs	%xcc,	0x5
	fmovrde	%i2,	%f18,	%f22
	sllx	%l3,	%i4,	%o7
	fnot1s	%f16,	%f23
	movrlz	%g3,	%i0,	%g5
	sethi	0x182D,	%o1
	movneg	%xcc,	%l4,	%o6
	edge8n	%l5,	%g2,	%l1
	fbue	%fcc2,	loop_1217
	bge,pt	%icc,	loop_1218
	movrgz	%o3,	0x168,	%i5
	fmovdg	%icc,	%f15,	%f24
loop_1217:
	st	%f9,	[%l7 + 0x14]
loop_1218:
	nop
	fitod	%f26,	%f0
	popc	0x1F61,	%i3
	fbn	%fcc3,	loop_1219
	fsrc1	%f0,	%f4
	nop
	set	0x10, %g1
	stw	%i1,	[%l7 + %g1]
	movle	%xcc,	%g1,	%g4
loop_1219:
	tge	%icc,	0x7
	fble,a	%fcc1,	loop_1220
	udiv	%l0,	0x0EBD,	%l2
	ldub	[%l7 + 0x2F],	%i6
	sub	%o2,	%o0,	%o5
loop_1220:
	movneg	%icc,	%o4,	%l6
	fmul8x16	%f5,	%f0,	%f2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x0c,	%g6,	%i7
	umul	%i2,	%g7,	%i4
	udivcc	%o7,	0x0EAB,	%g3
	nop
	setx	0xD039E3150670AB42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xC119DA9F82AB7174,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f12,	%f2
	fmovrslez	%l3,	%f3,	%f12
	tne	%icc,	0x4
	movneg	%icc,	%g5,	%o1
	udivx	%l4,	0x1173,	%i0
	tge	%icc,	0x4
	fmovsneg	%xcc,	%f7,	%f15
	sir	0x05B4
	te	%icc,	0x7
	array8	%l5,	%g2,	%l1
	tpos	%xcc,	0x5
	edge8l	%o6,	%i5,	%i3
	fpadd32s	%f12,	%f24,	%f2
	edge8l	%o3,	%i1,	%g4
	fnegd	%f26,	%f10
	bpos,pn	%xcc,	loop_1221
	udivx	%l0,	0x0FB7,	%l2
	fcmpgt16	%f2,	%f14,	%g1
	movgu	%icc,	%o2,	%i6
loop_1221:
	nop
	setx	0x56C0473D0101B5E8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x3FC20400BD3DAC55,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f22,	%f10
	tne	%icc,	0x5
	set	0x78, %o0
	lduba	[%l7 + %o0] 0x89,	%o0
	movleu	%icc,	%o5,	%l6
	srlx	%o4,	0x0D,	%g6
	move	%xcc,	%i7,	%i2
	edge16	%g7,	%i4,	%g3
	tle	%icc,	0x1
	ldx	[%l7 + 0x70],	%o7
	ldsh	[%l7 + 0x12],	%l3
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	brgz,a	%o1,	loop_1222
	flush	%l7 + 0x28
	edge32n	%l4,	%g5,	%i0
	tg	%xcc,	0x5
loop_1222:
	edge16n	%g2,	%l1,	%l5
	sdiv	%o6,	0x084A,	%i3
	fpadd32	%f0,	%f0,	%f10
	fzeros	%f11
	ldsb	[%l7 + 0x20],	%i5
	fmovsleu	%icc,	%f17,	%f12
	tleu	%xcc,	0x3
	fmovsne	%xcc,	%f0,	%f16
	edge16l	%o3,	%i1,	%g4
	nop
	setx	0x29FD78DF6B7E8C64,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x0C5181E6DD65F6B2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f8,	%f24
	movrgez	%l0,	%l2,	%g1
	fblg,a	%fcc1,	loop_1223
	tcs	%xcc,	0x0
	movleu	%icc,	%i6,	%o2
	fcmpeq16	%f14,	%f20,	%o5
loop_1223:
	fmovdgu	%xcc,	%f21,	%f11
	fmul8x16	%f9,	%f26,	%f8
	tgu	%xcc,	0x0
	fmovdn	%xcc,	%f27,	%f17
	fbo	%fcc3,	loop_1224
	udiv	%l6,	0x17AF,	%o0
	addccc	%o4,	0x1435,	%i7
	xorcc	%g6,	%g7,	%i4
loop_1224:
	membar	0x3B
	fmovrsgz	%g3,	%f10,	%f26
	te	%xcc,	0x0
	umulcc	%i2,	%l3,	%o1
	fmul8x16al	%f23,	%f27,	%f4
	movne	%icc,	%o7,	%l4
	brgez,a	%g5,	loop_1225
	srlx	%g2,	0x04,	%i0
	movleu	%xcc,	%l1,	%l5
	edge16n	%i3,	%o6,	%i5
loop_1225:
	nop
	setx	0x9C3C859F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xF34C5D32,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f17,	%f24
	subccc	%o3,	0x0F0D,	%i1
	sdiv	%g4,	0x0D3B,	%l0
	array32	%g1,	%l2,	%o2
	sra	%i6,	0x0E,	%l6
	fbl,a	%fcc0,	loop_1226
	xnor	%o0,	0x1B6B,	%o4
	bcs,a	%icc,	loop_1227
	addcc	%i7,	%o5,	%g7
loop_1226:
	bcs	%icc,	loop_1228
	addcc	%g6,	0x1BC3,	%g3
loop_1227:
	mulscc	%i4,	0x1B46,	%l3
	movle	%xcc,	%i2,	%o1
loop_1228:
	fabss	%f18,	%f14
	sethi	0x1253,	%o7
	edge32	%g5,	%g2,	%l4
	bne,pt	%xcc,	loop_1229
	movge	%xcc,	%l1,	%l5
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x10] %asi,	%i0
loop_1229:
	addccc	%i3,	%o6,	%o3
	movcs	%xcc,	%i5,	%g4
	movcs	%xcc,	%l0,	%i1
	tvc	%xcc,	0x0
	movleu	%xcc,	%g1,	%l2
	movvs	%xcc,	%o2,	%i6
	sll	%l6,	%o4,	%i7
	bpos	%xcc,	loop_1230
	movcc	%xcc,	%o0,	%g7
	movrlez	%o5,	%g6,	%i4
	ldsh	[%l7 + 0x10],	%l3
loop_1230:
	prefetch	[%l7 + 0x78],	 0x0
	srax	%g3,	0x1E,	%i2
	addc	%o7,	0x0A2A,	%o1
	fmovsl	%xcc,	%f1,	%f21
	fba	%fcc2,	loop_1231
	faligndata	%f30,	%f18,	%f14
	ld	[%l7 + 0x70],	%f26
	movvs	%icc,	%g5,	%g2
loop_1231:
	subccc	%l4,	%l5,	%l1
	taddcc	%i0,	0x12B9,	%o6
	array16	%o3,	%i3,	%i5
	edge8l	%g4,	%l0,	%i1
	fpsub32s	%f12,	%f4,	%f25
	smul	%g1,	%l2,	%i6
	fmul8x16au	%f31,	%f20,	%f12
	tg	%xcc,	0x1
	movrgez	%o2,	%o4,	%l6
	set	0x2A, %i3
	ldsha	[%l7 + %i3] 0x81,	%i7
	nop
	fitos	%f2,	%f15
	fstoi	%f15,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%o0,	%f11,	%f9
	xnor	%g7,	%g6,	%i4
	movrlz	%l3,	0x298,	%g3
	tsubcctv	%i2,	0x112A,	%o5
	taddcctv	%o1,	0x1D32,	%g5
	fbu,a	%fcc0,	loop_1232
	srlx	%g2,	0x14,	%l4
	movrlez	%l5,	0x2B1,	%l1
	addc	%i0,	0x0FB6,	%o7
loop_1232:
	smul	%o6,	%i3,	%i5
	ldd	[%l7 + 0x10],	%f30
	fsrc1s	%f19,	%f11
	edge32	%o3,	%g4,	%i1
	move	%icc,	%l0,	%l2
	umul	%i6,	0x0A61,	%g1
	edge32l	%o2,	%l6,	%i7
	fcmpeq16	%f22,	%f28,	%o4
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x0c,	 0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x28, %g6
	ldxa	[%l7 + %g6] 0x81,	%g6
	movcs	%icc,	%i4,	%l3
	sdivx	%g3,	0x0FA4,	%i2
	fmovsgu	%xcc,	%f30,	%f12
	srl	%g7,	%o5,	%g5
	bvc,a	%xcc,	loop_1233
	fnot1s	%f1,	%f22
	fnors	%f15,	%f19,	%f20
	nop
	fitos	%f9,	%f19
	fstoi	%f19,	%f13
loop_1233:
	sllx	%g2,	%l4,	%l5
	movle	%xcc,	%o1,	%l1
	tcc	%icc,	0x2
	fmovsleu	%xcc,	%f24,	%f8
	nop
	set	0x5C, %i4
	lduw	[%l7 + %i4],	%i0
	fors	%f21,	%f26,	%f14
	fmovdle	%icc,	%f22,	%f9
	andn	%o7,	0x13A9,	%i3
	sdivcc	%o6,	0x16EA,	%o3
	fmovscc	%icc,	%f11,	%f7
	bg,pt	%icc,	loop_1234
	sllx	%g4,	0x09,	%i5
	bshuffle	%f28,	%f24,	%f14
	subccc	%l0,	%i1,	%i6
loop_1234:
	andcc	%l2,	0x035D,	%g1
	fcmpeq16	%f24,	%f22,	%o2
	fbuge,a	%fcc1,	loop_1235
	andn	%i7,	0x05D4,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f6
loop_1235:
	ta	%xcc,	0x1
	movgu	%icc,	%o4,	%g6
	xnorcc	%o0,	0x141A,	%i4
	array8	%g3,	%i2,	%l3
	edge16l	%o5,	%g7,	%g2
	andn	%g5,	0x1F1D,	%l4
	tl	%icc,	0x1
	bneg,a,pt	%icc,	loop_1236
	xnorcc	%l5,	0x1893,	%l1
	nop
	setx	0xF05C5B78C3AFB244,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xD3B5B6DE7038426C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f2,	%f4
	ba,a	loop_1237
loop_1236:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvc,a	%icc,	loop_1238
	smul	%o1,	0x06D5,	%o7
loop_1237:
	edge16n	%i3,	%i0,	%o3
	move	%xcc,	%o6,	%i5
loop_1238:
	tvc	%icc,	0x5
	subcc	%g4,	%i1,	%l0
	udivx	%l2,	0x1BF8,	%i6
	bshuffle	%f8,	%f8,	%f12
	orn	%o2,	0x08C3,	%g1
	edge8n	%l6,	%i7,	%g6
	fblg	%fcc3,	loop_1239
	fmovsa	%icc,	%f6,	%f13
	popc	%o0,	%i4
	bcs,pn	%icc,	loop_1240
loop_1239:
	bvs,a	loop_1241
	fmovsn	%xcc,	%f1,	%f7
	fpadd16s	%f12,	%f23,	%f22
loop_1240:
	ld	[%l7 + 0x34],	%f13
loop_1241:
	fmovdne	%icc,	%f29,	%f16
	add	%g3,	0x00A1,	%o4
	orn	%l3,	%o5,	%g7
	fmovrdne	%i2,	%f28,	%f26
	sll	%g5,	0x1A,	%l4
	nop
	setx	0xB0E762C875A95D60,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x9711A8972A28946D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f20,	%f4
	nop
	setx	0x8B84870DA47091E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x52F38E105D9B54F5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f20,	%f28
	addccc	%g2,	%l5,	%o1
	movrne	%o7,	0x3F4,	%l1
	fcmpeq16	%f26,	%f24,	%i0
	fbo,a	%fcc1,	loop_1242
	xorcc	%o3,	0x04E7,	%i3
	movrne	%i5,	0x302,	%o6
	bne,a	%xcc,	loop_1243
loop_1242:
	sub	%i1,	0x0096,	%g4
	xorcc	%l0,	%l2,	%i6
	nop
	setx	0x28EC101566F85A91,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xE3A652EFF08D48E6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f28,	%f16
loop_1243:
	edge32	%o2,	%g1,	%l6
	subc	%g6,	0x1B47,	%i7
	tsubcc	%o0,	0x0136,	%g3
	fmovdvs	%icc,	%f10,	%f26
	movrlez	%o4,	%l3,	%o5
	bvs,a	loop_1244
	bcc,a	%icc,	loop_1245
	nop
	fitod	%f8,	%f26
	fdtoi	%f26,	%f7
	fone	%f12
loop_1244:
	andcc	%i4,	%g7,	%g5
loop_1245:
	movcs	%xcc,	%i2,	%l4
	addcc	%g2,	%l5,	%o1
	movgu	%icc,	%o7,	%i0
	umulcc	%l1,	%o3,	%i3
	fexpand	%f15,	%f10
	fpadd32	%f18,	%f8,	%f12
	fexpand	%f31,	%f30
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x16] %asi,	%i5
	fnot1s	%f12,	%f14
	flush	%l7 + 0x1C
	nop
	setx	loop_1246,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpack16	%f16,	%f10
	fmovdgu	%icc,	%f14,	%f7
	tvs	%icc,	0x6
loop_1246:
	fmovrde	%o6,	%f28,	%f14
	fbue	%fcc2,	loop_1247
	tgu	%icc,	0x1
	fcmple32	%f10,	%f30,	%i1
	fpadd32	%f30,	%f6,	%f26
loop_1247:
	fornot1s	%f4,	%f16,	%f10
	tcc	%xcc,	0x0
	fnot2	%f20,	%f26
	membar	0x34
	mulscc	%l0,	0x1EB4,	%l2
	xorcc	%g4,	0x1226,	%o2
	bneg	%xcc,	loop_1248
	nop
	setx	loop_1249,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fornot2s	%f9,	%f30,	%f21
	movleu	%xcc,	%i6,	%g1
loop_1248:
	sllx	%g6,	0x1A,	%i7
loop_1249:
	add	%l6,	%g3,	%o4
	fblg	%fcc0,	loop_1250
	for	%f6,	%f24,	%f28
	set	0x46, %l5
	lduha	[%l7 + %l5] 0x04,	%o0
loop_1250:
	movre	%o5,	%i4,	%l3
	subc	%g5,	0x16F3,	%i2
	brlez	%l4,	loop_1251
	addc	%g2,	0x009A,	%g7
	alignaddrl	%o1,	%o7,	%l5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%l1
loop_1251:
	nop
	setx	0x6C865C86406433E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	andncc	%o3,	%i5,	%o6
	tcc	%xcc,	0x2
	fxor	%f10,	%f28,	%f18
	tpos	%xcc,	0x7
	nop
	fitos	%f5,	%f29
	fstod	%f29,	%f4
	nop
	fitod	%f12,	%f4
	fdtox	%f4,	%f12
	fxors	%f29,	%f14,	%f26
	fabsd	%f0,	%f30
	set	0x74, %o5
	ldsha	[%l7 + %o5] 0x10,	%i1
	nop
	setx	0x5C4B7637,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x9489F3EC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f26,	%f26
	flush	%l7 + 0x68
	fones	%f30
	te	%xcc,	0x7
	movrlez	%i3,	0x224,	%l2
	taddcctv	%g4,	%o2,	%i6
	ldd	[%l7 + 0x20],	%f28
	set	0x38, %o4
	prefetcha	[%l7 + %o4] 0x0c,	 0x0
	brgez,a	%g6,	loop_1252
	movcs	%icc,	%l0,	%l6
	movvc	%xcc,	%i7,	%g3
	fmuld8ulx16	%f22,	%f20,	%f28
loop_1252:
	tne	%icc,	0x2
	movrne	%o0,	%o5,	%i4
	fandnot1	%f22,	%f20,	%f8
	fmovsle	%xcc,	%f31,	%f19
	fmovse	%xcc,	%f4,	%f2
	movvs	%xcc,	%l3,	%g5
	sll	%o4,	0x10,	%i2
	edge32l	%l4,	%g7,	%o1
	te	%icc,	0x4
	tgu	%icc,	0x6
	sth	%o7,	[%l7 + 0x78]
	edge16ln	%l5,	%i0,	%l1
	movvs	%icc,	%g2,	%i5
	brnz	%o6,	loop_1253
	nop
	setx	0x2F4CEC0E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x0E3EA4CD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f21,	%f2
	wr	%g0,	0x81,	%asi
	sta	%f22,	[%l7 + 0x2C] %asi
loop_1253:
	tg	%xcc,	0x2
	brz,a	%i1,	loop_1254
	ba,a,pn	%icc,	loop_1255
	movrlz	%i3,	%l2,	%g4
	addccc	%o3,	0x03A1,	%o2
loop_1254:
	fbug	%fcc1,	loop_1256
loop_1255:
	fbn,a	%fcc2,	loop_1257
	addcc	%i6,	0x0299,	%g1
	nop
	setx	0xB16B11C131875AC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f10
loop_1256:
	umul	%g6,	0x197E,	%l6
loop_1257:
	movcs	%xcc,	%l0,	%i7
	fzero	%f26
	movrlez	%o0,	0x050,	%g3
	sub	%i4,	%o5,	%g5
	prefetch	[%l7 + 0x2C],	 0x1
	tcs	%icc,	0x3
	movrlz	%o4,	0x0AF,	%l3
	bne,a	loop_1258
	mova	%xcc,	%l4,	%g7
	tsubcctv	%i2,	0x0981,	%o7
	fpsub32	%f20,	%f0,	%f16
loop_1258:
	fmovsneg	%icc,	%f2,	%f0
	movrne	%l5,	%i0,	%o1
	for	%f10,	%f8,	%f12
	fmovscs	%xcc,	%f10,	%f11
	set	0x44, %l4
	stba	%l1,	[%l7 + %l4] 0x11
	prefetch	[%l7 + 0x4C],	 0x1
	fsrc1s	%f18,	%f28
	edge16ln	%i5,	%o6,	%g2
	mulx	%i3,	%i1,	%l2
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x10] %asi,	%o3
	sir	0x0F57
	edge16ln	%g4,	%i6,	%g1
	tg	%xcc,	0x3
	udiv	%o2,	0x1616,	%l6
	array32	%l0,	%g6,	%o0
	fornot1s	%f7,	%f0,	%f2
	sdivx	%i7,	0x16CC,	%g3
	ldd	[%l7 + 0x20],	%f18
	addccc	%i4,	%o5,	%o4
	edge16l	%g5,	%l4,	%l3
	sethi	0x0B97,	%i2
	array8	%o7,	%l5,	%i0
	xnor	%o1,	0x13CA,	%g7
	fmovsa	%icc,	%f9,	%f7
	fzeros	%f7
	stx	%i5,	[%l7 + 0x28]
	set	0x10, %o7
	lda	[%l7 + %o7] 0x19,	%f10
	sra	%l1,	%o6,	%i3
	fcmpeq32	%f12,	%f4,	%i1
	andcc	%l2,	0x0142,	%o3
	ldsb	[%l7 + 0x7A],	%g4
	te	%icc,	0x7
	xorcc	%i6,	%g2,	%g1
	taddcctv	%l6,	0x06D5,	%l0
	movg	%xcc,	%g6,	%o2
	flush	%l7 + 0x0C
	fmovrse	%i7,	%f14,	%f23
	bpos	loop_1259
	edge16l	%g3,	%i4,	%o5
	fpsub16s	%f31,	%f17,	%f25
	movn	%xcc,	%o0,	%g5
loop_1259:
	movvs	%xcc,	%o4,	%l4
	ldd	[%l7 + 0x40],	%f0
	nop
	setx loop_1260, %l0, %l1
	jmpl %l1, %l3
	mova	%icc,	%o7,	%i2
	subcc	%i0,	0x1D34,	%o1
	te	%xcc,	0x6
loop_1260:
	fpsub16s	%f30,	%f17,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g7,	%i5,	%l1
	fmul8x16	%f21,	%f4,	%f18
	mulscc	%o6,	0x0786,	%i3
	movrne	%i1,	0x101,	%l5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l2,	%g4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x53] %asi,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg	loop_1261
	movl	%xcc,	%o3,	%g2
	fbe	%fcc3,	loop_1262
	nop
	setx	0x104BD6ECF0767D7A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_1261:
	xnorcc	%g1,	%l0,	%l6
	stbar
loop_1262:
	and	%g6,	0x1B65,	%o2
	movrlez	%g3,	0x266,	%i7
	orn	%o5,	%o0,	%g5
	mulx	%o4,	0x07F4,	%i4
	alignaddrl	%l3,	%o7,	%i2
	fmul8sux16	%f30,	%f28,	%f30
	movneg	%icc,	%i0,	%l4
	edge16n	%g7,	%o1,	%l1
	ldx	[%l7 + 0x20],	%i5
	mulscc	%i3,	%o6,	%l5
	fbu	%fcc3,	loop_1263
	umulcc	%l2,	%g4,	%i6
	fnors	%f3,	%f16,	%f27
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%o3
loop_1263:
	bne,a	%xcc,	loop_1264
	edge8n	%g2,	%i1,	%g1
	te	%icc,	0x1
	tle	%xcc,	0x0
loop_1264:
	fsrc2	%f18,	%f0
	edge16ln	%l6,	%g6,	%o2
	addccc	%g3,	%i7,	%o5
	fnor	%f20,	%f4,	%f14
	edge32n	%o0,	%g5,	%o4
	brgez,a	%i4,	loop_1265
	mulscc	%l0,	%o7,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i2,	%l4,	%g7
loop_1265:
	movpos	%xcc,	%i0,	%l1
	fmovdleu	%icc,	%f11,	%f10
	fnot1	%f6,	%f14
	tsubcc	%i5,	0x0998,	%o1
	edge8	%o6,	%i3,	%l2
	movre	%g4,	%i6,	%o3
	addccc	%g2,	%i1,	%g1
	fmovrsne	%l5,	%f11,	%f22
	movleu	%xcc,	%g6,	%o2
	udivcc	%l6,	0x03AA,	%i7
	udiv	%g3,	0x0983,	%o5
	edge8n	%o0,	%o4,	%i4
	sdiv	%l0,	0x17EB,	%o7
	udiv	%g5,	0x110F,	%i2
	fbue	%fcc0,	loop_1266
	tg	%icc,	0x7
	srax	%l3,	0x17,	%l4
	nop
	fitod	%f8,	%f12
	fdtoi	%f12,	%f8
loop_1266:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x60] %asi,	%g7
	nop
	setx	0x405A5A5C,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	ldsw	[%l7 + 0x68],	%i0
	move	%xcc,	%l1,	%i5
	movrlez	%o6,	%o1,	%l2
	tgu	%xcc,	0x1
	fmovde	%xcc,	%f13,	%f13
	subcc	%i3,	%i6,	%g4
	ldub	[%l7 + 0x45],	%g2
	sdivx	%o3,	0x0253,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l5,	%g6,	%g1
	fmovrsne	%l6,	%f11,	%f8
	fmovsleu	%xcc,	%f21,	%f26
	alignaddr	%o2,	%g3,	%i7
	te	%icc,	0x2
	edge8l	%o5,	%o0,	%o4
	array8	%i4,	%l0,	%g5
	nop
	setx	0xA04D7AD4,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	ldd	[%l7 + 0x68],	%i2
	udivx	%l3,	0x0E57,	%o7
	subccc	%l4,	%i0,	%g7
	udivcc	%l1,	0x1A3D,	%i5
	ble,pt	%xcc,	loop_1267
	stx	%o6,	[%l7 + 0x30]
	fpsub32s	%f27,	%f4,	%f5
	edge8l	%o1,	%l2,	%i3
loop_1267:
	bneg	%xcc,	loop_1268
	ld	[%l7 + 0x4C],	%f12
	bn,a,pn	%xcc,	loop_1269
	nop
	fitos	%f12,	%f26
	fstod	%f26,	%f2
loop_1268:
	fbue	%fcc3,	loop_1270
	lduh	[%l7 + 0x08],	%i6
loop_1269:
	tcc	%icc,	0x1
	orncc	%g4,	%o3,	%g2
loop_1270:
	nop
	setx	0x10743EFC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xE82B76C9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f31,	%f20
	udivcc	%l5,	0x1063,	%g6
	tcs	%xcc,	0x4
	fmovd	%f20,	%f10
	sir	0x0734
	movneg	%xcc,	%i1,	%l6
	movpos	%icc,	%o2,	%g1
	fmuld8ulx16	%f22,	%f27,	%f12
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x7A] %asi,	%g3
	movvc	%xcc,	%o5,	%o0
	edge32	%i7,	%i4,	%l0
	ldsb	[%l7 + 0x35],	%g5
	addccc	%i2,	%o4,	%l3
	ldd	[%l7 + 0x28],	%f6
	edge8ln	%o7,	%l4,	%i0
	ta	%icc,	0x2
	addccc	%g7,	%i5,	%l1
	be,a,pn	%icc,	loop_1271
	bpos,a,pn	%xcc,	loop_1272
	fmovrslz	%o6,	%f19,	%f4
	movn	%xcc,	%l2,	%i3
loop_1271:
	fmul8sux16	%f2,	%f2,	%f0
loop_1272:
	nop
	set	0x14, %o6
	sth	%o1,	[%l7 + %o6]
	fmovdge	%xcc,	%f29,	%f26
	std	%f28,	[%l7 + 0x30]
	fand	%f14,	%f28,	%f18
	mulx	%i6,	%o3,	%g4
	fmovrslz	%l5,	%f2,	%f28
	fnot1	%f6,	%f26
	ldsb	[%l7 + 0x3A],	%g2
	brgz	%i1,	loop_1273
	and	%g6,	0x0407,	%o2
	fmovs	%f20,	%f15
	fmul8ulx16	%f20,	%f14,	%f8
loop_1273:
	nop
	fitod	%f4,	%f10
	fdtos	%f10,	%f26
	tge	%xcc,	0x6
	sdivx	%l6,	0x1086,	%g3
	srax	%o5,	%g1,	%i7
	edge16	%o0,	%i4,	%l0
	umul	%i2,	0x081E,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l3,	0x0244,	%o7
	fabss	%f8,	%f29
	tgu	%xcc,	0x5
	fmovsg	%xcc,	%f27,	%f16
	movne	%icc,	%g5,	%l4
	udivx	%i0,	0x0CE7,	%g7
	movvs	%xcc,	%l1,	%o6
	taddcctv	%l2,	0x1ADF,	%i3
	movrgz	%o1,	%i6,	%o3
	nop
	setx	0x293961BFA2F053E9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x3DC0BC9C66518F48,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f16,	%f28
	udiv	%i5,	0x05B1,	%l5
	movneg	%xcc,	%g2,	%g4
	fmovsle	%xcc,	%f0,	%f20
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f30
	fxtod	%f30,	%f12
	mulscc	%i1,	0x0526,	%g6
	stb	%l6,	[%l7 + 0x7A]
	subccc	%g3,	0x0CFF,	%o5
	xor	%o2,	0x1C58,	%i7
	fand	%f16,	%f24,	%f8
	tn	%xcc,	0x2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x10,	%f16
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f8
	fxtod	%f8,	%f8
	movleu	%xcc,	%o0,	%g1
	flush	%l7 + 0x24
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	andcc	%i4,	0x0E08,	%l0
	set	0x58, %g2
	ldswa	[%l7 + %g2] 0x11,	%o4
	sdivx	%i2,	0x1A42,	%o7
	udivcc	%g5,	0x0175,	%l4
	sub	%l3,	0x1259,	%g7
	fmovrde	%i0,	%f20,	%f14
	udivcc	%l1,	0x0DFD,	%l2
	edge8	%i3,	%o6,	%i6
	alignaddr	%o1,	%o3,	%l5
	movcc	%icc,	%i5,	%g2
	andncc	%g4,	%g6,	%l6
	tvc	%xcc,	0x1
	fands	%f9,	%f11,	%f16
	fands	%f6,	%f0,	%f7
	addccc	%g3,	%i1,	%o2
	xor	%i7,	%o5,	%o0
	mulx	%i4,	%g1,	%o4
	fmovscc	%xcc,	%f16,	%f8
	brlz,a	%l0,	loop_1274
	movl	%icc,	%o7,	%i2
	tl	%icc,	0x6
	fpadd16	%f20,	%f0,	%f28
loop_1274:
	nop
	setx	0xA4A61852,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x6F26669A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f14,	%f22
	brlz,a	%l4,	loop_1275
	edge16n	%g5,	%g7,	%l3
	nop
	setx	0x40552E8A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x6C3532D2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f2,	%f22
	orncc	%l1,	%l2,	%i3
loop_1275:
	call	loop_1276
	movre	%i0,	0x36F,	%i6
	fba	%fcc0,	loop_1277
	subccc	%o1,	%o3,	%l5
loop_1276:
	xor	%o6,	0x18CA,	%g2
	movg	%icc,	%g4,	%i5
loop_1277:
	brnz	%l6,	loop_1278
	movvs	%icc,	%g6,	%i1
	sll	%g3,	%i7,	%o2
	fba	%fcc2,	loop_1279
loop_1278:
	nop
	setx	0x15F9A84B3476D8B8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x211AC2C438BD6CFD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f4,	%f24
	fnot2	%f2,	%f22
	addc	%o0,	%i4,	%o5
loop_1279:
	call	loop_1280
	nop
	setx	loop_1281,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0x70487EA4,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	orn	%o4,	0x1B2B,	%l0
loop_1280:
	udivcc	%g1,	0x107A,	%i2
loop_1281:
	movrgez	%l4,	0x245,	%g5
	andn	%g7,	0x0240,	%l3
	fmovda	%icc,	%f14,	%f13
	set	0x16, %l2
	stha	%o7,	[%l7 + %l2] 0x19
	edge16	%l2,	%i3,	%i0
	tle	%xcc,	0x7
	bvc,pn	%icc,	loop_1282
	fmul8sux16	%f14,	%f30,	%f30
	addccc	%l1,	0x0479,	%i6
	fblg,a	%fcc1,	loop_1283
loop_1282:
	fcmpeq32	%f4,	%f16,	%o1
	nop
	setx	0xB461E435,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xCB3992AF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f30,	%f14
	movne	%xcc,	%l5,	%o6
loop_1283:
	ldd	[%l7 + 0x60],	%g2
	subccc	%g4,	%o3,	%l6
	stw	%i5,	[%l7 + 0x08]
	faligndata	%f12,	%f10,	%f2
	stw	%g6,	[%l7 + 0x14]
	udiv	%i1,	0x11C4,	%g3
	fmovdl	%icc,	%f17,	%f1
	srax	%o2,	0x1F,	%o0
	fnot1	%f18,	%f20
	bg,a,pt	%xcc,	loop_1284
	movn	%icc,	%i4,	%o5
	movge	%icc,	%i7,	%l0
	udiv	%g1,	0x125A,	%o4
loop_1284:
	nop
	wr	%g0,	0xeb,	%asi
	stwa	%i2,	[%l7 + 0x14] %asi
	membar	#Sync
	tsubcctv	%g5,	%g7,	%l4
	edge32n	%o7,	%l3,	%i3
	movn	%icc,	%i0,	%l1
	fbule,a	%fcc1,	loop_1285
	tcs	%xcc,	0x0
	umul	%i6,	0x0E5C,	%l2
	nop
	setx	0xE93783CE70573F3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_1285:
	xorcc	%o1,	0x0882,	%o6
	sth	%l5,	[%l7 + 0x64]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x7DDC817CBE1EFCFC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x0D5CF9DB5422D675,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f10,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g2,	0x1EFB,	%g4
	tne	%icc,	0x6
	taddcctv	%o3,	0x13AC,	%l6
	fmul8x16	%f4,	%f2,	%f8
	brgz	%g6,	loop_1286
	tg	%icc,	0x7
	movrgz	%i5,	%i1,	%g3
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x89,	%f0
loop_1286:
	faligndata	%f6,	%f26,	%f14
	nop
	setx	0x56CC934D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x1F121EC9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f14,	%f20
	bneg	%xcc,	loop_1287
	movg	%xcc,	%o2,	%i4
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x36] %asi,	%o5
loop_1287:
	umulcc	%o0,	%l0,	%i7
	fmuld8sux16	%f14,	%f27,	%f18
	lduw	[%l7 + 0x50],	%g1
	movcs	%icc,	%o4,	%i2
	movrlz	%g5,	0x251,	%g7
	nop
	fitos	%f24,	%f14
	fpadd32	%f26,	%f6,	%f0
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x65] %asi,	%o7
	faligndata	%f6,	%f30,	%f8
	tsubcc	%l4,	%i3,	%i0
	edge8	%l3,	%i6,	%l1
	fmovrdlz	%l2,	%f18,	%f22
	alignaddr	%o1,	%o6,	%l5
	or	%g2,	%g4,	%o3
	bpos,a,pt	%icc,	loop_1288
	ta	%icc,	0x5
	edge32ln	%l6,	%g6,	%i1
	fblg	%fcc0,	loop_1289
loop_1288:
	fxor	%f4,	%f8,	%f10
	fcmple16	%f6,	%f24,	%g3
	fmovrsne	%i5,	%f2,	%f9
loop_1289:
	subcc	%i4,	0x027C,	%o2
	edge8l	%o0,	%o5,	%l0
	smul	%g1,	0x1191,	%i7
	fors	%f7,	%f13,	%f11
	movrlez	%i2,	0x170,	%o4
	andcc	%g7,	0x06E1,	%g5
	bcc	loop_1290
	movvs	%icc,	%o7,	%l4
	bg,pt	%icc,	loop_1291
	fcmpgt16	%f2,	%f8,	%i0
loop_1290:
	fmovrslz	%i3,	%f28,	%f1
	movneg	%xcc,	%i6,	%l1
loop_1291:
	tleu	%icc,	0x0
	tge	%xcc,	0x5
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x30] %asi,	%l2
	fmovsne	%icc,	%f16,	%f24
	array16	%l3,	%o1,	%l5
	and	%g2,	0x1D84,	%o6
	edge32l	%o3,	%l6,	%g4
	movcc	%xcc,	%g6,	%g3
	sra	%i1,	0x09,	%i5
	array32	%i4,	%o2,	%o0
	move	%xcc,	%o5,	%l0
	fpsub16s	%f17,	%f15,	%f3
	tvc	%icc,	0x4
	fornot1	%f20,	%f18,	%f18
	fnand	%f10,	%f2,	%f26
	move	%icc,	%g1,	%i2
	set	0x40, %o2
	ldstuba	[%l7 + %o2] 0x11,	%i7
	sethi	0x03C3,	%o4
	orncc	%g5,	%o7,	%l4
	tgu	%icc,	0x3
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%g7
	casa	[%l6] 0x04,	%g7,	%i3
	movleu	%xcc,	%i6,	%l1
	sir	0x0E16
	brlez	%i0,	loop_1292
	stw	%l3,	[%l7 + 0x7C]
	tge	%icc,	0x6
	taddcc	%l2,	%o1,	%l5
loop_1292:
	bleu	%icc,	loop_1293
	be,pt	%icc,	loop_1294
	array8	%g2,	%o6,	%o3
	tsubcctv	%g4,	0x11D0,	%l6
loop_1293:
	mulscc	%g6,	%g3,	%i1
loop_1294:
	movrlez	%i4,	0x354,	%o2
	sir	0x1189
	fnot2s	%f18,	%f7
	set	0x4A, %g4
	ldsba	[%l7 + %g4] 0x89,	%i5
	tge	%icc,	0x0
	nop
	setx	0xF7EB6FA3B55F5D61,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x670586A22C17E2BB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f2,	%f24
	edge8	%o0,	%l0,	%g1
	add	%o5,	0x1F30,	%i2
	smul	%o4,	%g5,	%o7
	fcmpne32	%f14,	%f20,	%l4
	fbul	%fcc0,	loop_1295
	bcc	%icc,	loop_1296
	fbg	%fcc1,	loop_1297
	nop
	setx loop_1298, %l0, %l1
	jmpl %l1, %i7
loop_1295:
	sdiv	%g7,	0x1637,	%i6
loop_1296:
	umulcc	%l1,	0x13F7,	%i3
loop_1297:
	umulcc	%i0,	%l3,	%o1
loop_1298:
	subccc	%l2,	%g2,	%o6
	taddcc	%o3,	%l5,	%g4
	bvc,a	%icc,	loop_1299
	mulx	%g6,	%g3,	%i1
	ldsb	[%l7 + 0x50],	%l6
	fmovsneg	%icc,	%f28,	%f22
loop_1299:
	lduw	[%l7 + 0x18],	%i4
	array16	%i5,	%o2,	%l0
	flush	%l7 + 0x48
	move	%icc,	%g1,	%o0
	fmovd	%f8,	%f14
	fors	%f24,	%f14,	%f29
	edge8l	%o5,	%o4,	%g5
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	membar	0x4D
	ldsh	[%l7 + 0x66],	%o7
	fmovrdlez	%i2,	%f22,	%f24
	ta	%xcc,	0x0
	or	%l4,	%g7,	%i6
	fmovdcs	%xcc,	%f6,	%f28
	membar	0x05
	fone	%f20
	edge16ln	%l1,	%i7,	%i3
	movrgez	%i0,	%l3,	%l2
	orn	%g2,	%o1,	%o6
	fmovrslez	%l5,	%f9,	%f18
	orn	%o3,	%g4,	%g6
	add	%i1,	0x064C,	%l6
	set	0x38, %g7
	stwa	%i4,	[%l7 + %g7] 0x0c
	bneg	loop_1300
	st	%f29,	[%l7 + 0x0C]
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x14] %asi,	%f11
loop_1300:
	ldsh	[%l7 + 0x1E],	%g3
	alignaddrl	%i5,	%l0,	%g1
	tgu	%icc,	0x5
	fnors	%f3,	%f9,	%f28
	andcc	%o2,	0x0215,	%o5
	set	0x48, %i7
	prefetcha	[%l7 + %i7] 0x81,	 0x2
	tl	%xcc,	0x0
	addccc	%o0,	0x1702,	%g5
	tgu	%icc,	0x6
	nop
	setx	0x85AE3E15907FCB63,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	smulcc	%o7,	%l4,	%g7
	edge16	%i2,	%i6,	%l1
	movrgez	%i7,	0x210,	%i0
	bge,a,pt	%icc,	loop_1301
	fnors	%f12,	%f17,	%f28
	andncc	%i3,	%l2,	%g2
	nop
	setx	0x1FE33847,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x473D189C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f16,	%f31
loop_1301:
	addccc	%l3,	%o6,	%l5
	stbar
	brnz,a	%o3,	loop_1302
	movl	%icc,	%g4,	%o1
	tneg	%xcc,	0x7
	srax	%g6,	0x07,	%i1
loop_1302:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	edge32n	%g3,	%i5,	%l0
	nop
	setx	0xBB25EB61CAF30F94,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE59C47BF58849FD7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f16,	%f18
	bneg,pn	%icc,	loop_1303
	array32	%l6,	%o2,	%o5
	edge32	%g1,	%o0,	%g5
	addc	%o7,	%o4,	%g7
loop_1303:
	nop
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x5C] %asi,	%f19
	edge32n	%l4,	%i6,	%i2
	alignaddr	%i7,	%i0,	%i3
	edge8n	%l2,	%l1,	%g2
	and	%l3,	0x1967,	%l5
	mulx	%o3,	0x1579,	%o6
	fsrc1	%f2,	%f28
	subc	%g4,	0x1A46,	%g6
	fmovs	%f3,	%f14
	tpos	%icc,	0x2
	xnorcc	%o1,	%i4,	%i1
	fornot2	%f22,	%f12,	%f2
	movl	%xcc,	%g3,	%i5
	edge8	%l6,	%o2,	%o5
	brlez	%l0,	loop_1304
	movpos	%xcc,	%g1,	%g5
	fbu,a	%fcc2,	loop_1305
	ldsw	[%l7 + 0x70],	%o7
loop_1304:
	nop
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o4
loop_1305:
	tcs	%xcc,	0x5
	tgu	%xcc,	0x5
	wr	%g0,	0xe2,	%asi
	stba	%g7,	[%l7 + 0x42] %asi
	membar	#Sync
	sir	0x0BF5
	movrlez	%l4,	0x330,	%i6
	movrgez	%i2,	%o0,	%i7
	fba,a	%fcc0,	loop_1306
	brnz	%i0,	loop_1307
	edge8ln	%i3,	%l2,	%l1
	smul	%g2,	%l3,	%l5
loop_1306:
	edge32n	%o3,	%o6,	%g4
loop_1307:
	stb	%g6,	[%l7 + 0x7D]
	movrlz	%o1,	0x34F,	%i4
	lduw	[%l7 + 0x1C],	%i1
	ld	[%l7 + 0x3C],	%f19
	tg	%icc,	0x4
	mulscc	%g3,	%i5,	%l6
	movrlz	%o5,	%o2,	%g1
	movre	%g5,	0x37E,	%l0
	nop
	fitos	%f23,	%f8
	ldd	[%l7 + 0x50],	%o4
	sdiv	%g7,	0x0DC6,	%l4
	movrne	%i6,	0x22F,	%o7
	edge16l	%o0,	%i2,	%i0
	fba,a	%fcc2,	loop_1308
	fornot2s	%f30,	%f17,	%f19
	fmovsne	%xcc,	%f27,	%f11
	or	%i3,	%i7,	%l2
loop_1308:
	call	loop_1309
	membar	0x08
	ta	%icc,	0x4
	fmovdne	%icc,	%f0,	%f9
loop_1309:
	fmovrdlz	%l1,	%f18,	%f16
	movneg	%xcc,	%g2,	%l3
	umulcc	%o3,	0x1389,	%l5
	set	0x60, %l6
	lduwa	[%l7 + %l6] 0x10,	%o6
	array16	%g6,	%g4,	%o1
	stb	%i1,	[%l7 + 0x69]
	nop
	setx	0xB8F1FA03,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x77F694CD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f5,	%f12
	mulx	%i4,	0x1FAD,	%i5
	edge8l	%l6,	%o5,	%g3
	tg	%xcc,	0x5
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	umul	%g1,	%g5,	%l0
	srlx	%o4,	0x09,	%o2
	movpos	%icc,	%l4,	%g7
	sdivx	%i6,	0x151F,	%o7
	smul	%o0,	0x1279,	%i2
	addccc	%i3,	%i7,	%i0
	tg	%xcc,	0x6
	bleu,a,pt	%icc,	loop_1310
	umulcc	%l1,	%g2,	%l2
	alignaddr	%l3,	%o3,	%o6
	taddcctv	%g6,	%g4,	%l5
loop_1310:
	tn	%xcc,	0x0
	stbar
	nop
	setx	0x2A5F9633EDFBB4E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x52465F1A4F7DDE5A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f16,	%f4
	fcmpeq16	%f14,	%f16,	%i1
	movpos	%xcc,	%i4,	%i5
	tneg	%xcc,	0x7
	ta	%icc,	0x2
	edge8l	%o1,	%l6,	%o5
	movpos	%icc,	%g3,	%g5
	movg	%xcc,	%l0,	%o4
	nop
	set	0x08, %o1
	ldx	[%l7 + %o1],	%g1
	membar	0x16
	movrgez	%o2,	%l4,	%g7
	te	%xcc,	0x1
	bvs,a,pn	%icc,	loop_1311
	tneg	%xcc,	0x0
	tl	%icc,	0x6
	smul	%i6,	0x18C0,	%o0
loop_1311:
	prefetch	[%l7 + 0x30],	 0x3
	subccc	%o7,	%i2,	%i3
	nop
	setx	0x206EB2BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x55] %asi,	%i7
	add	%i0,	0x163E,	%g2
	edge8	%l2,	%l1,	%o3
	movvs	%xcc,	%l3,	%o6
	te	%xcc,	0x0
	tpos	%icc,	0x7
	ldsh	[%l7 + 0x46],	%g4
	movvs	%xcc,	%l5,	%i1
	bn,pt	%xcc,	loop_1312
	movleu	%icc,	%g6,	%i4
	xor	%o1,	%i5,	%l6
	taddcc	%g3,	0x05D2,	%o5
loop_1312:
	movg	%icc,	%g5,	%o4
	fble	%fcc3,	loop_1313
	edge16ln	%g1,	%l0,	%l4
	subccc	%o2,	0x0B96,	%i6
	andn	%g7,	%o0,	%i2
loop_1313:
	movpos	%icc,	%o7,	%i3
	tge	%xcc,	0x2
	or	%i7,	0x04C9,	%g2
	te	%xcc,	0x5
	bleu,a,pt	%xcc,	loop_1314
	xor	%l2,	0x0640,	%i0
	edge8n	%l1,	%o3,	%l3
	fble	%fcc0,	loop_1315
loop_1314:
	array16	%o6,	%l5,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc1,	loop_1316
loop_1315:
	ldsw	[%l7 + 0x24],	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g6,	0x0A7A,	%i4
loop_1316:
	movvc	%icc,	%o1,	%l6
	sir	0x03F3
	tg	%xcc,	0x0
	sth	%i5,	[%l7 + 0x3A]
	fmovsneg	%xcc,	%f1,	%f19
	edge32	%g3,	%o5,	%g5
	stx	%o4,	[%l7 + 0x50]
	fmovdne	%icc,	%f29,	%f19
	smulcc	%l0,	%l4,	%g1
	call	loop_1317
	edge16l	%o2,	%i6,	%g7
	tn	%xcc,	0x5
	edge8n	%i2,	%o0,	%i3
loop_1317:
	nop
	set	0x5C, %g3
	lduba	[%l7 + %g3] 0x14,	%i7
	tvc	%xcc,	0x1
	bg	loop_1318
	sll	%o7,	%l2,	%i0
	movrne	%l1,	%g2,	%l3
	fpadd16s	%f24,	%f28,	%f12
loop_1318:
	tneg	%icc,	0x6
	tl	%xcc,	0x3
	orcc	%o3,	0x0E46,	%o6
	sdivcc	%i1,	0x11A7,	%g4
	addc	%l5,	0x1696,	%g6
	movrlez	%o1,	0x040,	%l6
	ldsb	[%l7 + 0x0D],	%i4
	nop
	setx	0x0C19620F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x928D0471,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fdivs	%f30,	%f20,	%f4
	fxor	%f12,	%f14,	%f0
	nop
	fitod	%f2,	%f18
	fdtoi	%f18,	%f16
	array16	%i5,	%o5,	%g3
	ble	%xcc,	loop_1319
	bg,a	loop_1320
	udiv	%o4,	0x000D,	%l0
	subc	%g5,	%l4,	%o2
loop_1319:
	fbu	%fcc2,	loop_1321
loop_1320:
	andncc	%i6,	%g1,	%i2
	fmovdne	%icc,	%f4,	%f4
	movneg	%icc,	%g7,	%o0
loop_1321:
	subccc	%i7,	0x124C,	%i3
	movrlz	%o7,	0x1CF,	%i0
	sir	0x0D0B
	udivx	%l1,	0x1E8D,	%g2
	movvs	%icc,	%l2,	%l3
	fblg,a	%fcc3,	loop_1322
	xor	%o6,	0x13E0,	%o3
	fmovsne	%xcc,	%f14,	%f19
	tcc	%icc,	0x1
loop_1322:
	edge32l	%i1,	%g4,	%g6
	fmovdle	%xcc,	%f5,	%f6
	addccc	%o1,	0x0864,	%l5
	fbug,a	%fcc1,	loop_1323
	movcs	%xcc,	%l6,	%i4
	edge8ln	%o5,	%g3,	%i5
	fpsub32s	%f21,	%f28,	%f6
loop_1323:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x1C] %asi,	%o4
	udiv	%l0,	0x0C64,	%l4
	srlx	%g5,	%o2,	%i6
	srax	%i2,	%g7,	%o0
	movn	%xcc,	%g1,	%i3
	mulx	%i7,	0x03FD,	%i0
	tcc	%icc,	0x0
	nop
	setx	loop_1324,	%l0,	%l1
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
	movn	%xcc,	%o7,	%g2
	sub	%l2,	%l1,	%o6
loop_1324:
	nop
	set	0x56, %l3
	stba	%o3,	[%l7 + %l3] 0x88
	umulcc	%l3,	0x1A51,	%g4
	taddcc	%g6,	%o1,	%l5
	movleu	%icc,	%i1,	%l6
	tn	%xcc,	0x4
	fbl	%fcc0,	loop_1325
	movrgez	%i4,	0x030,	%o5
	tvc	%icc,	0x1
	movn	%xcc,	%g3,	%i5
loop_1325:
	array16	%o4,	%l4,	%l0
	movrne	%g5,	%o2,	%i2
	fbl	%fcc2,	loop_1326
	tvc	%xcc,	0x3
	tge	%xcc,	0x3
	orncc	%g7,	0x1E63,	%i6
loop_1326:
	nop
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g1
	fcmpeq32	%f8,	%f28,	%o0
	movg	%icc,	%i3,	%i0
	faligndata	%f20,	%f28,	%f22
	fmovrdgez	%i7,	%f24,	%f2
	fmovsle	%icc,	%f0,	%f21
	fornot2	%f30,	%f28,	%f14
	fones	%f15
	xor	%g2,	0x0229,	%o7
	fnand	%f2,	%f24,	%f8
	fpadd32s	%f27,	%f21,	%f0
	tcs	%xcc,	0x6
	edge8n	%l1,	%l2,	%o6
	movcc	%xcc,	%l3,	%o3
	edge32ln	%g6,	%o1,	%g4
	tgu	%xcc,	0x6
	movleu	%xcc,	%l5,	%l6
	fmul8x16au	%f14,	%f9,	%f26
	tle	%xcc,	0x6
	taddcc	%i4,	0x04B3,	%i1
	bn,a	loop_1327
	smulcc	%o5,	0x07C8,	%i5
	fbu	%fcc3,	loop_1328
	fbug	%fcc2,	loop_1329
loop_1327:
	swap	[%l7 + 0x24],	%o4
	tvc	%icc,	0x3
loop_1328:
	udivcc	%l4,	0x1763,	%l0
loop_1329:
	srlx	%g3,	0x01,	%g5
	fbu,a	%fcc1,	loop_1330
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i2,	%o2
	xnor	%g7,	0x0692,	%g1
loop_1330:
	fmovsne	%xcc,	%f28,	%f4
	edge16ln	%o0,	%i3,	%i6
	tne	%xcc,	0x5
	fmovdvc	%xcc,	%f2,	%f16
	bcs,a,pn	%icc,	loop_1331
	movrlz	%i0,	0x15E,	%i7
	bgu	%xcc,	loop_1332
	tcs	%xcc,	0x4
loop_1331:
	umul	%g2,	0x057F,	%o7
	srax	%l1,	0x0C,	%l2
loop_1332:
	tne	%icc,	0x1
	ta	%xcc,	0x6
	fpsub32s	%f9,	%f17,	%f30
	xor	%o6,	0x0D27,	%l3
	tcs	%xcc,	0x4
	fbl,a	%fcc2,	loop_1333
	nop
	setx	0x2DD8701EFBE2B4AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x07FF04AB1D62408D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f30,	%f18
	brnz,a	%o3,	loop_1334
	movleu	%xcc,	%o1,	%g6
loop_1333:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l5,	%g4
loop_1334:
	edge32l	%l6,	%i4,	%i1
	tcc	%icc,	0x2
	tgu	%icc,	0x4
	fmovdgu	%xcc,	%f4,	%f2
	movrgz	%i5,	0x0E4,	%o5
	tsubcctv	%o4,	0x0C90,	%l0
	edge8ln	%l4,	%g5,	%g3
	edge32	%o2,	%g7,	%i2
	smul	%g1,	0x0AAE,	%o0
	tvc	%icc,	0x5
	subcc	%i3,	0x0522,	%i0
	fnand	%f12,	%f14,	%f6
	set	0x50, %i5
	ldswa	[%l7 + %i5] 0x15,	%i7
	nop
	setx	loop_1335,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdgu	%xcc,	%f20,	%f22
	fmovdleu	%icc,	%f3,	%f26
	smulcc	%i6,	%g2,	%l1
loop_1335:
	nop
	setx	0xFBD8906C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x52C9E5A3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f11,	%f26
	fmovrdlz	%l2,	%f10,	%f16
	bgu,a	loop_1336
	xnor	%o7,	0x079F,	%o6
	taddcctv	%o3,	0x0B47,	%o1
	srlx	%g6,	0x10,	%l5
loop_1336:
	lduh	[%l7 + 0x7A],	%g4
	orncc	%l3,	%i4,	%l6
	movcs	%icc,	%i5,	%i1
	ldsh	[%l7 + 0x2E],	%o4
	orcc	%o5,	%l0,	%l4
	mulscc	%g3,	%g5,	%g7
	movrne	%i2,	%g1,	%o2
	tneg	%xcc,	0x5
	or	%o0,	0x1671,	%i3
	array8	%i7,	%i6,	%g2
	smulcc	%i0,	0x1783,	%l1
	movre	%l2,	0x0CF,	%o6
	ldx	[%l7 + 0x48],	%o3
	orn	%o1,	%g6,	%o7
	xnor	%l5,	0x1A9C,	%l3
	tleu	%xcc,	0x4
	orcc	%i4,	%g4,	%i5
	udiv	%l6,	0x025B,	%o4
	fbue	%fcc3,	loop_1337
	orn	%o5,	0x1CFE,	%i1
	tcs	%icc,	0x2
	brnz	%l0,	loop_1338
loop_1337:
	edge16	%g3,	%l4,	%g5
	or	%g7,	%g1,	%o2
	fnot2	%f12,	%f16
loop_1338:
	orcc	%o0,	%i3,	%i2
	movcs	%icc,	%i7,	%i6
	be	%icc,	loop_1339
	tvc	%icc,	0x4
	movrlz	%g2,	0x0D8,	%l1
	edge32n	%l2,	%o6,	%o3
loop_1339:
	edge8n	%o1,	%g6,	%o7
	ta	%xcc,	0x2
	nop
	setx	0x7CB45CDEB414496F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xF917AC4F8CD69221,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f26,	%f28
	sdivx	%l5,	0x15F5,	%l3
	fmovsge	%icc,	%f12,	%f26
	tneg	%xcc,	0x2
	nop
	setx	0xF044807C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x637EB7CF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f2,	%f2
	movrne	%i4,	%g4,	%i0
	fmovdvc	%xcc,	%f20,	%f16
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movleu	%icc,	%i5,	%l6
	smul	%o4,	0x052D,	%i1
	fbo	%fcc0,	loop_1340
	fmovdleu	%icc,	%f27,	%f26
	subccc	%o5,	%g3,	%l4
	fbug	%fcc2,	loop_1341
loop_1340:
	movneg	%xcc,	%g5,	%l0
	fbne,a	%fcc1,	loop_1342
	stw	%g1,	[%l7 + 0x18]
loop_1341:
	bneg,pt	%icc,	loop_1343
	sdivcc	%g7,	0x1931,	%o2
loop_1342:
	fmovdn	%xcc,	%f25,	%f23
	nop
	setx	0x38C2E5EE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x08296664,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f11,	%f8
loop_1343:
	srax	%i3,	%i2,	%i7
	fbn	%fcc1,	loop_1344
	tge	%xcc,	0x2
	edge8l	%o0,	%i6,	%l1
	set	0x24, %i1
	sta	%f0,	[%l7 + %i1] 0x14
loop_1344:
	call	loop_1345
	orcc	%g2,	0x10A1,	%l2
	add	%o6,	%o1,	%o3
	fmovda	%icc,	%f0,	%f1
loop_1345:
	orcc	%g6,	0x0AF2,	%o7
	bge,a,pn	%xcc,	loop_1346
	movle	%icc,	%l5,	%i4
	edge32ln	%g4,	%l3,	%i5
	movge	%icc,	%l6,	%o4
loop_1346:
	nop
	setx	0xD576808E1032EEE7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xAA7B9BDA4EECCDDA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f4,	%f26
	set	0x40, %g5
	stxa	%i0,	[%l7 + %g5] 0x15
	movrlez	%o5,	0x34C,	%i1
	set	0x7C, %i6
	stha	%g3,	[%l7 + %i6] 0x81
	andn	%l4,	0x10B8,	%l0
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%f14
	subcc	%g5,	0x17A9,	%g1
	fbue,a	%fcc1,	loop_1347
	bvc,a,pn	%icc,	loop_1348
	fmovdvs	%icc,	%f31,	%f21
	ta	%icc,	0x0
loop_1347:
	nop
	set	0x27, %g1
	ldstub	[%l7 + %g1],	%o2
loop_1348:
	nop
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x44] %asi,	%g7
	edge16ln	%i2,	%i3,	%o0
	edge32n	%i6,	%l1,	%g2
	stx	%i7,	[%l7 + 0x10]
	movvc	%xcc,	%l2,	%o6
	fmovsvc	%icc,	%f15,	%f26
	ld	[%l7 + 0x7C],	%f0
	bcc,a	loop_1349
	fmuld8sux16	%f31,	%f31,	%f0
	popc	%o3,	%o1
	bleu,a	%xcc,	loop_1350
loop_1349:
	movre	%g6,	%l5,	%i4
	fmovrdgz	%o7,	%f28,	%f22
	fmovdl	%xcc,	%f12,	%f10
loop_1350:
	bne,a	loop_1351
	fmul8x16al	%f0,	%f1,	%f26
	fnot1s	%f25,	%f30
	alignaddr	%l3,	%g4,	%i5
loop_1351:
	fmovsge	%xcc,	%f23,	%f15
	fpadd16	%f20,	%f2,	%f10
	tcs	%xcc,	0x2
	fandnot2	%f0,	%f30,	%f26
	array32	%l6,	%o4,	%o5
	ta	%icc,	0x5
	srax	%i1,	%g3,	%i0
	alignaddrl	%l4,	%g5,	%l0
	sth	%o2,	[%l7 + 0x2E]
	nop
	setx	0x9C39D07CEC0AF293,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x5223D938AE5CCC49,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f6,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%icc,	%f3,	%f27
	edge16ln	%g1,	%i2,	%g7
	fmovscc	%xcc,	%f19,	%f30
	bcs,a,pt	%icc,	loop_1352
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i3,	%o0,	%l1
	addc	%g2,	%i6,	%i7
loop_1352:
	xor	%l2,	%o3,	%o6
	sdiv	%o1,	0x16D5,	%g6
	nop
	set	0x50, %o0
	ldd	[%l7 + %o0],	%l4
	addccc	%o7,	0x0875,	%l3
	umul	%i4,	0x10BB,	%g4
	andncc	%l6,	%o4,	%o5
	movrlz	%i5,	0x12E,	%i1
	movge	%xcc,	%i0,	%l4
	wr	%g0,	0x81,	%asi
	stwa	%g5,	[%l7 + 0x28] %asi
	movrne	%l0,	%o2,	%g3
	taddcc	%g1,	%i2,	%i3
	tvc	%icc,	0x2
	subccc	%g7,	%l1,	%g2
	fbl,a	%fcc3,	loop_1353
	sethi	0x12F1,	%o0
	fbug	%fcc2,	loop_1354
	fnot2s	%f11,	%f23
loop_1353:
	fmovdl	%icc,	%f2,	%f9
	movcs	%icc,	%i7,	%i6
loop_1354:
	udiv	%o3,	0x12C8,	%o6
	fandnot1	%f24,	%f0,	%f20
	addccc	%l2,	%g6,	%l5
	and	%o7,	%l3,	%o1
	fmovsne	%xcc,	%f11,	%f4
	or	%g4,	0x15CE,	%i4
	nop
	fitos	%f23,	%f20
	wr	%g0,	0xe2,	%asi
	stxa	%o4,	[%l7 + 0x08] %asi
	membar	#Sync
	bvs,a	loop_1355
	tsubcc	%o5,	0x1D19,	%i5
	ldsb	[%l7 + 0x68],	%i1
	edge32l	%i0,	%l6,	%l4
loop_1355:
	movrgez	%l0,	%g5,	%g3
	std	%f0,	[%l7 + 0x08]
	fblg	%fcc3,	loop_1356
	tcc	%icc,	0x0
	orncc	%g1,	%o2,	%i3
	movcs	%icc,	%i2,	%l1
loop_1356:
	lduw	[%l7 + 0x24],	%g2
	srl	%o0,	0x05,	%i7
	movneg	%xcc,	%g7,	%o3
	fmul8x16	%f7,	%f10,	%f28
	brz	%o6,	loop_1357
	andcc	%l2,	0x03BA,	%g6
	tsubcc	%i6,	0x0847,	%l5
	sdiv	%o7,	0x0BE6,	%o1
loop_1357:
	sdiv	%l3,	0x0A1D,	%g4
	fbe	%fcc0,	loop_1358
	movcs	%icc,	%o4,	%o5
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x88,	%i5,	%i1
loop_1358:
	fnot1	%f8,	%f4
	fnand	%f14,	%f22,	%f28
	sll	%i0,	0x06,	%l6
	srl	%l4,	0x0F,	%l0
	sdivcc	%i4,	0x1ECE,	%g3
	nop
	fitod	%f4,	%f26
	fdtoi	%f26,	%f9
	edge16ln	%g5,	%o2,	%i3
	movrgez	%i2,	0x128,	%l1
	set	0x48, %i3
	swapa	[%l7 + %i3] 0x89,	%g2
	fxnors	%f31,	%f16,	%f17
	umulcc	%g1,	%i7,	%o0
	fand	%f0,	%f22,	%f6
	addccc	%o3,	0x11D3,	%g7
	fmovrsgez	%l2,	%f22,	%f16
	mova	%xcc,	%o6,	%i6
	srlx	%g6,	0x0F,	%l5
	movpos	%icc,	%o1,	%o7
	brgez,a	%g4,	loop_1359
	movge	%icc,	%o4,	%l3
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x4B] %asi,	%o5
loop_1359:
	brlez	%i1,	loop_1360
	udiv	%i0,	0x1603,	%l6
	udivcc	%l4,	0x098A,	%l0
	edge8l	%i5,	%g3,	%g5
loop_1360:
	fmovrsgez	%i4,	%f17,	%f30
	nop
	set	0x28, %i2
	ldsh	[%l7 + %i2],	%i3
	taddcc	%o2,	%i2,	%g2
	nop
	fitod	%f12,	%f12
	fdtos	%f12,	%f5
	fblg,a	%fcc3,	loop_1361
	sth	%l1,	[%l7 + 0x10]
	andcc	%i7,	0x1A8A,	%o0
	umul	%g1,	%g7,	%o3
loop_1361:
	orn	%o6,	0x0AA2,	%l2
	fpadd32s	%f20,	%f8,	%f14
	brz	%g6,	loop_1362
	brlz	%i6,	loop_1363
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o1,	%o7,	%g4
loop_1362:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
loop_1363:
	movpos	%xcc,	%o4,	%o5
	fmovde	%xcc,	%f6,	%f19
	ble,a	loop_1364
	fmovdgu	%icc,	%f4,	%f0
	bcs	%xcc,	loop_1365
	umulcc	%i1,	0x0BFA,	%l3
loop_1364:
	umul	%i0,	%l6,	%l4
	movvc	%xcc,	%l0,	%i5
loop_1365:
	fbne,a	%fcc2,	loop_1366
	srl	%g3,	%g5,	%i4
	movrgz	%o2,	0x0CE,	%i2
	ldub	[%l7 + 0x27],	%g2
loop_1366:
	nop
	fitos	%f11,	%f24
	fstod	%f24,	%f14
	mova	%xcc,	%i3,	%i7
	sethi	0x0B16,	%l1
	movrgez	%o0,	0x2B4,	%g7
	srl	%g1,	%o6,	%l2
	nop
	setx loop_1367, %l0, %l1
	jmpl %l1, %o3
	fpsub32	%f4,	%f10,	%f30
	fcmpgt16	%f20,	%f18,	%i6
	tge	%icc,	0x4
loop_1367:
	ldd	[%l7 + 0x38],	%o0
	sllx	%o7,	0x1A,	%g6
	taddcc	%g4,	0x1259,	%o4
	fnor	%f8,	%f30,	%f8
	mulx	%l5,	%i1,	%l3
	edge8ln	%i0,	%o5,	%l6
	orcc	%l4,	0x1E6F,	%l0
	tn	%icc,	0x5
	subc	%g3,	0x153A,	%i5
	tsubcctv	%i4,	%o2,	%g5
	sir	0x16B0
	set	0x6B, %g6
	stba	%i2,	[%l7 + %g6] 0x80
	xorcc	%i3,	0x1A05,	%i7
	ldsh	[%l7 + 0x3E],	%g2
	umulcc	%l1,	0x0781,	%g7
	tsubcc	%g1,	0x1930,	%o0
	tcc	%xcc,	0x2
	alignaddr	%o6,	%l2,	%i6
	ld	[%l7 + 0x7C],	%f14
	nop
	setx	0xDE729EFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x3708E4C4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f20,	%f2
	tn	%icc,	0x6
	fmovscc	%icc,	%f14,	%f4
	edge32	%o3,	%o7,	%g6
	tne	%xcc,	0x1
	fbul,a	%fcc1,	loop_1368
	fmovsn	%xcc,	%f16,	%f21
	movn	%xcc,	%o1,	%o4
	fmovse	%icc,	%f1,	%f15
loop_1368:
	fpsub32s	%f26,	%f4,	%f29
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x11,	%f16
	edge8ln	%l5,	%g4,	%i1
	fmovd	%f16,	%f22
	fcmpne16	%f22,	%f4,	%l3
	movrne	%o5,	0x076,	%l6
	orncc	%i0,	0x1634,	%l0
	tn	%icc,	0x4
	udiv	%g3,	0x0CCD,	%i5
	st	%f29,	[%l7 + 0x08]
	ta	%xcc,	0x1
	set	0x58, %i4
	prefetcha	[%l7 + %i4] 0x15,	 0x0
	fornot2	%f16,	%f14,	%f2
	movrlez	%o2,	%l4,	%g5
	tgu	%xcc,	0x3
	udivcc	%i3,	0x1CAD,	%i2
	bshuffle	%f12,	%f20,	%f24
	movrne	%g2,	%i7,	%g7
	movrlz	%g1,	0x04D,	%l1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%o0,	%l2
	std	%f20,	[%l7 + 0x70]
	edge8ln	%i6,	%o3,	%o6
	edge32ln	%o7,	%o1,	%o4
	orn	%l5,	%g6,	%i1
	sll	%l3,	%o5,	%l6
	addcc	%i0,	0x185F,	%g4
	mova	%icc,	%g3,	%l0
	nop
	set	0x2C, %o5
	lduw	[%l7 + %o5],	%i4
	tgu	%icc,	0x0
	edge16	%i5,	%l4,	%g5
	fbuge	%fcc1,	loop_1369
	sra	%o2,	0x12,	%i3
	fcmpeq32	%f24,	%f22,	%i2
	tcc	%xcc,	0x5
loop_1369:
	tpos	%icc,	0x5
	ldsh	[%l7 + 0x5A],	%i7
	fexpand	%f18,	%f4
	sub	%g2,	%g7,	%l1
	ta	%xcc,	0x2
	fbug,a	%fcc1,	loop_1370
	tleu	%xcc,	0x1
	taddcctv	%g1,	%o0,	%i6
	fcmpgt32	%f20,	%f0,	%o3
loop_1370:
	fmovse	%xcc,	%f23,	%f3
	movrgez	%l2,	0x32A,	%o7
	popc	0x1A0F,	%o6
	fnot1	%f14,	%f10
	bcs,pt	%icc,	loop_1371
	fbge,a	%fcc0,	loop_1372
	nop
	setx	0x7524A318,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x6635956E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f5,	%f2
	nop
	set	0x18, %l5
	stx	%o4,	[%l7 + %l5]
loop_1371:
	alignaddrl	%l5,	%o1,	%g6
loop_1372:
	fbge	%fcc0,	loop_1373
	edge32	%i1,	%o5,	%l6
	subc	%i0,	%g4,	%g3
	fmul8ulx16	%f6,	%f8,	%f22
loop_1373:
	tg	%xcc,	0x2
	andn	%l3,	0x1CF6,	%l0
	fnegs	%f28,	%f30
	mulscc	%i5,	%l4,	%i4
	move	%icc,	%g5,	%o2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%i2
	fble,a	%fcc1,	loop_1374
	tle	%xcc,	0x4
	udivcc	%i7,	0x160D,	%g2
	movrgz	%i3,	%l1,	%g7
loop_1374:
	tne	%xcc,	0x5
	tpos	%xcc,	0x6
	movre	%o0,	0x2C6,	%g1
	fmovdpos	%xcc,	%f4,	%f22
	bcc,a,pt	%xcc,	loop_1375
	sdivcc	%i6,	0x19AB,	%l2
	nop
	setx	0xF75A851B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xC99B0DD0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f26,	%f29
	membar	0x60
loop_1375:
	alignaddr	%o7,	%o3,	%o6
	and	%l5,	%o4,	%g6
	wr	%g0,	0x4f,	%asi
	stxa	%o1,	[%g0 + 0x10] %asi
	fornot1s	%f3,	%f4,	%f28
	popc	0x01D6,	%i1
	fcmpeq16	%f6,	%f0,	%o5
	movg	%xcc,	%i0,	%l6
	tvs	%xcc,	0x7
	fbl	%fcc2,	loop_1376
	mova	%xcc,	%g3,	%l3
	flush	%l7 + 0x1C
	tcs	%icc,	0x3
loop_1376:
	fandnot1s	%f3,	%f7,	%f16
	movvc	%xcc,	%g4,	%i5
	fandnot2	%f4,	%f18,	%f26
	fmovsn	%icc,	%f1,	%f28
	fbule,a	%fcc0,	loop_1377
	membar	0x00
	tvs	%icc,	0x0
	fornot1s	%f1,	%f3,	%f20
loop_1377:
	movn	%xcc,	%l4,	%i4
	fnot1s	%f9,	%f12
	bge	%xcc,	loop_1378
	bvs,a,pn	%icc,	loop_1379
	tg	%xcc,	0x7
	fone	%f8
loop_1378:
	movrgz	%g5,	%o2,	%i2
loop_1379:
	ldsh	[%l7 + 0x4E],	%i7
	set	0x8, %o4
	stxa	%g2,	[%g0 + %o4] 0x20
	fmovdn	%xcc,	%f2,	%f31
	sir	0x18D9
	tsubcctv	%i3,	%l0,	%l1
	andn	%o0,	0x0842,	%g1
	edge16n	%g7,	%i6,	%l2
	edge32	%o3,	%o6,	%o7
	movl	%icc,	%o4,	%l5
	sll	%o1,	%i1,	%g6
	bn,a,pn	%icc,	loop_1380
	movrgz	%o5,	%l6,	%g3
	fmovrslz	%l3,	%f27,	%f13
	tvc	%xcc,	0x7
loop_1380:
	movge	%icc,	%g4,	%i0
	tneg	%xcc,	0x4
	fmovrdlz	%l4,	%f30,	%f20
	bcs,a	%xcc,	loop_1381
	fcmple32	%f16,	%f12,	%i5
	sllx	%i4,	%g5,	%i2
	fmovd	%f22,	%f10
loop_1381:
	sllx	%o2,	0x1A,	%i7
	movpos	%icc,	%g2,	%i3
	fandnot2s	%f2,	%f31,	%f6
	tle	%xcc,	0x1
	edge8n	%l0,	%o0,	%g1
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f16
	fxtod	%f16,	%f8
	sdivx	%l1,	0x164E,	%g7
	array16	%l2,	%o3,	%o6
	nop
	setx loop_1382, %l0, %l1
	jmpl %l1, %o7
	movge	%icc,	%o4,	%l5
	movvc	%xcc,	%i6,	%i1
	tvs	%icc,	0x1
loop_1382:
	umulcc	%g6,	0x15DE,	%o5
	fxnor	%f20,	%f22,	%f18
	tpos	%xcc,	0x7
	sdiv	%o1,	0x13F7,	%l6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x0c,	%g3,	%g4
	tge	%xcc,	0x0
	subcc	%i0,	0x1D43,	%l3
	tcc	%xcc,	0x7
	fcmple32	%f14,	%f28,	%l4
	tsubcc	%i5,	0x0AA6,	%g5
	edge8n	%i4,	%o2,	%i2
	udivcc	%g2,	0x0F95,	%i3
	tcs	%xcc,	0x3
	edge16l	%l0,	%o0,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l1,	0x14C3,	%i7
	array32	%l2,	%g7,	%o6
	bleu,a,pn	%xcc,	loop_1383
	movrgez	%o3,	0x0C1,	%o4
	fmul8sux16	%f14,	%f14,	%f18
	sth	%l5,	[%l7 + 0x36]
loop_1383:
	smul	%o7,	0x097B,	%i1
	fandnot2s	%f27,	%f19,	%f22
	srax	%g6,	%i6,	%o5
	fmovdgu	%xcc,	%f23,	%f5
	fpadd32	%f12,	%f16,	%f4
	nop
	fitod	%f4,	%f10
	fdtoi	%f10,	%f23
	faligndata	%f24,	%f28,	%f18
	fmovspos	%xcc,	%f8,	%f30
	nop
	setx	0x87CAA3D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f31
	bge,pt	%xcc,	loop_1384
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l6,	%o1,	%g3
	movn	%xcc,	%i0,	%g4
loop_1384:
	fmovsneg	%icc,	%f11,	%f26
	fmovdpos	%xcc,	%f16,	%f3
	edge32n	%l3,	%l4,	%g5
	xorcc	%i4,	%o2,	%i5
	andncc	%i2,	%i3,	%l0
	fsrc1	%f14,	%f14
	tsubcctv	%o0,	%g1,	%l1
	movrgez	%g2,	0x1BA,	%l2
	orn	%g7,	%o6,	%o3
	umul	%i7,	%o4,	%o7
	andn	%i1,	%l5,	%g6
	brnz,a	%i6,	loop_1385
	brlez,a	%o5,	loop_1386
	fmovrde	%l6,	%f26,	%f6
	movle	%icc,	%g3,	%i0
loop_1385:
	fmovrdgz	%o1,	%f24,	%f10
loop_1386:
	fmovdcc	%xcc,	%f3,	%f14
	movrgez	%g4,	%l4,	%g5
	movle	%icc,	%l3,	%i4
	bl	loop_1387
	bpos,pt	%icc,	loop_1388
	sdivcc	%o2,	0x123E,	%i5
	subccc	%i2,	0x05D7,	%i3
loop_1387:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1388:
	umul	%l0,	0x047D,	%g1
	fsrc2	%f28,	%f26
	brgz	%l1,	loop_1389
	fmovsl	%icc,	%f20,	%f2
	movcs	%icc,	%o0,	%g2
	movvc	%icc,	%g7,	%l2
loop_1389:
	fbu,a	%fcc1,	loop_1390
	tcc	%icc,	0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o3,	%o6,	%i7
loop_1390:
	smul	%o4,	%i1,	%o7
	smul	%l5,	%g6,	%o5
	or	%l6,	0x1AED,	%i6
	addcc	%g3,	0x1310,	%i0
	movcs	%icc,	%o1,	%g4
	alignaddrl	%l4,	%g5,	%l3
	sdivcc	%i4,	0x0C60,	%o2
	movvc	%xcc,	%i2,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x3C],	%l0
	tg	%xcc,	0x2
	xorcc	%g1,	0x1064,	%i5
	tg	%icc,	0x4
	edge16	%l1,	%g2,	%o0
	set	0x57, %l4
	stba	%l2,	[%l7 + %l4] 0x2b
	membar	#Sync
	movvc	%icc,	%o3,	%g7
	stb	%i7,	[%l7 + 0x4B]
	movrlez	%o4,	0x2FB,	%o6
	or	%o7,	%l5,	%g6
	fmovdne	%xcc,	%f8,	%f11
	bne,pn	%icc,	loop_1391
	srax	%i1,	0x0E,	%o5
	nop
	fitos	%f7,	%f8
	fstox	%f8,	%f12
	movrgz	%i6,	0x0E1,	%g3
loop_1391:
	mulscc	%l6,	0x001B,	%o1
	umulcc	%i0,	%l4,	%g4
	movn	%xcc,	%g5,	%i4
	taddcctv	%o2,	%i2,	%l3
	fmovdge	%xcc,	%f6,	%f29
	tleu	%xcc,	0x6
	set	0x6E, %o7
	stba	%l0,	[%l7 + %o7] 0x18
	movrgz	%i3,	%i5,	%g1
	movg	%xcc,	%g2,	%o0
	nop
	setx	0xC35163FD7A9F1B60,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xFAD0C5CA55CA5203,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f28,	%f4
	lduh	[%l7 + 0x2C],	%l2
	nop
	fitos	%f12,	%f5
	fstod	%f5,	%f20
	movpos	%icc,	%o3,	%g7
	fcmpne16	%f18,	%f22,	%i7
	sdiv	%l1,	0x0F90,	%o6
	edge16	%o4,	%l5,	%o7
	orncc	%g6,	0x0B96,	%o5
	movrlez	%i1,	%i6,	%g3
	brlez,a	%o1,	loop_1392
	smul	%l6,	0x0C19,	%l4
	edge16ln	%g4,	%g5,	%i0
	xnor	%i4,	%o2,	%i2
loop_1392:
	alignaddr	%l0,	%l3,	%i3
	movrgz	%g1,	0x193,	%i5
	wr	%g0,	0x10,	%asi
	stha	%g2,	[%l7 + 0x72] %asi
	fmovsge	%icc,	%f31,	%f0
	edge8	%l2,	%o0,	%o3
	fmovsneg	%xcc,	%f23,	%f9
	ldd	[%l7 + 0x40],	%g6
	smul	%l1,	%i7,	%o6
	fnand	%f4,	%f8,	%f12
	brz	%l5,	loop_1393
	call	loop_1394
	add	%o7,	%g6,	%o4
	fmovdle	%xcc,	%f26,	%f7
loop_1393:
	nop
	set	0x72, %l1
	ldsha	[%l7 + %l1] 0x80,	%o5
loop_1394:
	addcc	%i1,	%g3,	%i6
	alignaddr	%l6,	%o1,	%l4
	xorcc	%g5,	%i0,	%g4
	tcs	%xcc,	0x5
	sdiv	%i4,	0x1C14,	%o2
	popc	0x064A,	%i2
	udivcc	%l0,	0x0184,	%l3
	udivx	%i3,	0x006A,	%g1
	movpos	%xcc,	%g2,	%i5
	fmovsvs	%icc,	%f29,	%f22
	addc	%l2,	%o0,	%g7
	orncc	%o3,	%l1,	%i7
	fandnot2s	%f15,	%f7,	%f2
	fbul,a	%fcc2,	loop_1395
	edge8l	%o6,	%o7,	%g6
	edge8	%l5,	%o4,	%i1
	fnot1	%f6,	%f6
loop_1395:
	orcc	%o5,	%i6,	%g3
	fmovrslez	%o1,	%f5,	%f29
	nop
	setx	0x9D735DC3FAC4AB88,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x09C7149C33AB2BAD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f0,	%f8
	fcmpne32	%f20,	%f6,	%l4
	tneg	%xcc,	0x4
	brz	%g5,	loop_1396
	addcc	%l6,	0x10A3,	%g4
	fmul8ulx16	%f20,	%f6,	%f18
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f30
	fxtod	%f30,	%f12
loop_1396:
	taddcc	%i0,	%i4,	%o2
	addccc	%l0,	0x064D,	%l3
	smulcc	%i3,	0x018B,	%i2
	tl	%icc,	0x1
	fxnors	%f26,	%f4,	%f15
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fxor	%f22,	%f26,	%f26
	tneg	%xcc,	0x0
	tvs	%icc,	0x1
	subccc	%g2,	0x042A,	%g1
	brlz	%i5,	loop_1397
	tle	%xcc,	0x0
	ldsb	[%l7 + 0x72],	%l2
	nop
	fitos	%f7,	%f29
loop_1397:
	movl	%icc,	%g7,	%o3
	edge16ln	%o0,	%i7,	%l1
	taddcc	%o6,	0x106F,	%g6
	tne	%icc,	0x7
	tcc	%icc,	0x4
	nop
	fitos	%f2,	%f11
	fstox	%f11,	%f26
	sll	%o7,	%l5,	%i1
	nop
	setx	0x01067716,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xEA93A2BA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f19,	%f13
	sdivx	%o5,	0x00B4,	%o4
	brlz,a	%i6,	loop_1398
	membar	0x36
	edge32ln	%g3,	%l4,	%o1
	movpos	%xcc,	%l6,	%g5
loop_1398:
	tl	%xcc,	0x4
	fbue	%fcc0,	loop_1399
	xnorcc	%i0,	0x025E,	%i4
	mova	%xcc,	%o2,	%l0
	fbl	%fcc0,	loop_1400
loop_1399:
	orncc	%l3,	%g4,	%i2
	ldd	[%l7 + 0x68],	%f16
	tvs	%xcc,	0x6
loop_1400:
	sir	0x16F0
	ldsw	[%l7 + 0x54],	%g2
	udivx	%g1,	0x1B90,	%i5
	tcc	%xcc,	0x1
	fsrc2	%f0,	%f16
	edge8ln	%i3,	%g7,	%o3
	array16	%o0,	%i7,	%l1
	tne	%xcc,	0x7
	fbl,a	%fcc1,	loop_1401
	fxors	%f19,	%f31,	%f0
	movrgz	%o6,	%l2,	%g6
	nop
	setx	0x85C610E36EDCFE9E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f10
loop_1401:
	fmovrsgez	%l5,	%f20,	%f7
	srl	%o7,	%o5,	%o4
	movvc	%icc,	%i1,	%g3
	tge	%icc,	0x4
	fmovdg	%xcc,	%f31,	%f13
	movrne	%l4,	%i6,	%o1
	edge16n	%l6,	%g5,	%i4
	tpos	%xcc,	0x1
	fand	%f18,	%f30,	%f26
	srax	%i0,	%o2,	%l0
	lduh	[%l7 + 0x70],	%l3
	movvc	%icc,	%i2,	%g2
	ta	%icc,	0x2
	ldsb	[%l7 + 0x1C],	%g1
	nop
	setx	0xB08177ADA66DCB4E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xA76E6E4B2EE7EFD4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f12,	%f16
	mulscc	%g4,	0x02DA,	%i5
	movg	%xcc,	%i3,	%o3
	bge,a	%xcc,	loop_1402
	fpadd32s	%f23,	%f31,	%f22
	edge32n	%o0,	%g7,	%i7
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x28] %asi,	%f30
loop_1402:
	tgu	%icc,	0x6
	fbue	%fcc3,	loop_1403
	fnot2	%f30,	%f28
	orn	%o6,	%l2,	%l1
	wr	%g0,	0x11,	%asi
	sta	%f7,	[%l7 + 0x70] %asi
loop_1403:
	movrgz	%g6,	0x3B8,	%l5
	nop
	setx	0x3D9CB299B0730814,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	movgu	%xcc,	%o7,	%o5
	orcc	%i1,	0x0A7E,	%o4
	ldd	[%l7 + 0x48],	%g2
	fmuld8sux16	%f14,	%f4,	%f0
	sub	%i6,	0x15A0,	%l4
	bg,a	loop_1404
	movgu	%icc,	%l6,	%o1
	smul	%i4,	%i0,	%g5
	edge16ln	%l0,	%o2,	%i2
loop_1404:
	fmovrsgz	%l3,	%f19,	%f23
	fnegd	%f2,	%f28
	udiv	%g1,	0x0828,	%g2
	te	%icc,	0x1
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%i5,	loop_1405
	fmovdleu	%icc,	%f18,	%f12
	std	%f30,	[%l7 + 0x28]
	alignaddr	%i3,	%o3,	%g7
loop_1405:
	fnot2	%f22,	%f30
	nop
	setx	0x70FF15788CE77929,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xE362F65965792E83,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f10,	%f4
	popc	0x08CD,	%o0
	fpadd32	%f6,	%f10,	%f4
	tg	%xcc,	0x1
	movneg	%icc,	%i7,	%o6
	edge16n	%l1,	%g6,	%l2
	movcs	%xcc,	%l5,	%o7
	brz,a	%o5,	loop_1406
	fpackfix	%f24,	%f29
	edge16	%i1,	%o4,	%i6
	movcc	%icc,	%g3,	%l4
loop_1406:
	fmuld8sux16	%f10,	%f27,	%f2
	xnorcc	%o1,	%i4,	%l6
	fcmpeq16	%f8,	%f16,	%i0
	fmovrsgz	%g5,	%f0,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1407
	swap	[%l7 + 0x14],	%o2
	nop
	setx	0x0E07728FA0F70886,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x6AE3E617CEB14A93,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f26,	%f8
	add	%l7,	0x64,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x18,	%l0,	%i2
loop_1407:
	ble,a,pn	%xcc,	loop_1408
	orcc	%l3,	%g1,	%g2
	xnor	%i5,	0x0C4C,	%i3
	edge8ln	%g4,	%g7,	%o0
loop_1408:
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f8
	fxtod	%f8,	%f10
	set	0x3C, %o6
	lduha	[%l7 + %o6] 0x14,	%i7
	fands	%f31,	%f13,	%f16
	orn	%o6,	%l1,	%g6
	edge32	%o3,	%l5,	%l2
	ta	%icc,	0x3
	xnorcc	%o5,	%o7,	%o4
	brgz	%i1,	loop_1409
	te	%icc,	0x1
	brgez	%g3,	loop_1410
	fbul,a	%fcc3,	loop_1411
loop_1409:
	movrlz	%i6,	0x31C,	%o1
	nop
	setx	0x3307A259,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x504A8E3C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f15,	%f1
loop_1410:
	srlx	%i4,	%l6,	%i0
loop_1411:
	smulcc	%g5,	0x1264,	%o2
	bpos	%icc,	loop_1412
	xnorcc	%l0,	%l4,	%l3
	movpos	%icc,	%g1,	%g2
	set	0x48, %g2
	sta	%f5,	[%l7 + %g2] 0x18
loop_1412:
	ldd	[%l7 + 0x70],	%i2
	tle	%icc,	0x1
	movpos	%xcc,	%i5,	%g4
	sethi	0x0D6A,	%i3
	mulscc	%o0,	0x13EE,	%g7
	fmovsneg	%icc,	%f19,	%f12
	edge16	%o6,	%l1,	%g6
	orn	%o3,	%l5,	%i7
	fmovdcs	%icc,	%f30,	%f21
	ba,pt	%icc,	loop_1413
	andncc	%l2,	%o7,	%o4
	bcs,a,pn	%xcc,	loop_1414
	tge	%xcc,	0x7
loop_1413:
	addccc	%o5,	%i1,	%g3
	movcs	%xcc,	%i6,	%i4
loop_1414:
	fbg	%fcc1,	loop_1415
	sllx	%l6,	0x04,	%i0
	udivx	%g5,	0x0D03,	%o2
	fnands	%f30,	%f9,	%f3
loop_1415:
	taddcc	%o1,	0x1875,	%l4
	xnor	%l0,	%l3,	%g2
	nop
	fitos	%f13,	%f16
	srl	%g1,	0x00,	%i2
	fmovdne	%xcc,	%f16,	%f3
	xor	%g4,	0x1807,	%i3
	smulcc	%i5,	0x1721,	%o0
	fbug,a	%fcc2,	loop_1416
	movcc	%xcc,	%g7,	%l1
	tpos	%xcc,	0x4
	fornot2s	%f18,	%f11,	%f30
loop_1416:
	addcc	%g6,	0x03D8,	%o3
	xorcc	%l5,	0x1D15,	%i7
	stb	%l2,	[%l7 + 0x77]
	ldd	[%l7 + 0x28],	%f10
	swap	[%l7 + 0x78],	%o6
	srl	%o4,	0x0D,	%o5
	array32	%i1,	%o7,	%g3
	taddcctv	%i6,	%l6,	%i4
	edge8l	%i0,	%g5,	%o2
	alignaddr	%o1,	%l0,	%l4
	movre	%l3,	%g1,	%g2
	xorcc	%i2,	0x12AF,	%g4
	fmovsvs	%icc,	%f4,	%f31
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x4C] %asi,	%i5
	fbue	%fcc3,	loop_1417
	add	%o0,	%g7,	%l1
	popc	%g6,	%o3
	fbue,a	%fcc2,	loop_1418
loop_1417:
	movleu	%icc,	%i3,	%i7
	fbl	%fcc0,	loop_1419
	fmovsge	%xcc,	%f13,	%f9
loop_1418:
	fmovdvc	%xcc,	%f29,	%f30
	andn	%l2,	0x09D7,	%o6
loop_1419:
	fmovsvs	%icc,	%f3,	%f30
	edge8ln	%o4,	%o5,	%l5
	movvs	%icc,	%i1,	%o7
	sethi	0x0B93,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x3
	addcc	%l6,	%g3,	%i4
	brlz	%g5,	loop_1420
	movrgz	%o2,	0x380,	%o1
	tsubcc	%i0,	%l0,	%l3
	fmul8x16	%f14,	%f30,	%f26
loop_1420:
	bpos,a,pn	%icc,	loop_1421
	fmovsge	%xcc,	%f29,	%f13
	smul	%g1,	0x0D82,	%l4
	edge8l	%i2,	%g2,	%g4
loop_1421:
	tne	%icc,	0x4
	fnors	%f25,	%f20,	%f23
	edge32	%i5,	%o0,	%g7
	sdivcc	%g6,	0x075F,	%o3
	movvs	%icc,	%l1,	%i7
	orncc	%l2,	%i3,	%o4
	sethi	0x043F,	%o6
	xor	%l5,	%o5,	%i1
	bpos,a	loop_1422
	and	%i6,	%o7,	%g3
	tvs	%icc,	0x0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l6,	%i4
loop_1422:
	sll	%o2,	0x0E,	%o1
	nop
	setx	0x1AE42CCD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xAF01931C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f17,	%f22
	movvc	%xcc,	%g5,	%l0
	edge8	%l3,	%i0,	%l4
	fmovdl	%icc,	%f29,	%f25
	lduh	[%l7 + 0x42],	%g1
	array8	%i2,	%g2,	%i5
	tneg	%xcc,	0x0
	sllx	%g4,	%o0,	%g7
	bn,pn	%icc,	loop_1423
	tsubcctv	%g6,	%o3,	%i7
	set	0x7C, %o3
	stwa	%l2,	[%l7 + %o3] 0xe2
	membar	#Sync
loop_1423:
	nop
	setx	loop_1424,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	array8	%i3,	%l1,	%o6
	fors	%f14,	%f0,	%f27
	ldx	[%l7 + 0x60],	%o4
loop_1424:
	fmovsle	%xcc,	%f8,	%f14
	tne	%icc,	0x0
	wr	%g0,	0x27,	%asi
	stxa	%o5,	[%l7 + 0x50] %asi
	membar	#Sync
	array32	%l5,	%i6,	%i1
	movpos	%icc,	%o7,	%g3
	orncc	%i4,	0x1C52,	%o2
	tvs	%xcc,	0x7
	popc	0x0F65,	%o1
	srl	%g5,	%l6,	%l0
	fmovdcs	%xcc,	%f2,	%f14
	nop
	setx	0x7396A600606B2A0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	flush	%l7 + 0x44
	sub	%l3,	0x0E93,	%l4
	subcc	%i0,	0x0971,	%i2
	fmuld8sux16	%f14,	%f8,	%f30
	fandnot1	%f2,	%f2,	%f10
	movge	%xcc,	%g2,	%i5
	set	0x26, %o2
	stha	%g4,	[%l7 + %o2] 0xe2
	membar	#Sync
	swap	[%l7 + 0x10],	%g1
	fxnor	%f16,	%f2,	%f14
	fandnot2	%f28,	%f12,	%f22
	st	%f14,	[%l7 + 0x28]
	ble,a	loop_1425
	array8	%o0,	%g6,	%g7
	edge8l	%o3,	%l2,	%i3
	popc	%l1,	%i7
loop_1425:
	nop
	setx loop_1426, %l0, %l1
	jmpl %l1, %o4
	nop
	setx	0x3A1A466F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f29
	movge	%xcc,	%o5,	%l5
	movvs	%xcc,	%i6,	%o6
loop_1426:
	movrlez	%i1,	%g3,	%o7
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x50] %asi,	%f21
	brz,a	%i4,	loop_1427
	subcc	%o2,	0x0B79,	%g5
	swap	[%l7 + 0x68],	%l6
	taddcc	%o1,	%l0,	%l4
loop_1427:
	ldx	[%l7 + 0x10],	%l3
	nop
	setx	0x6240F77579A70CE9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x5B20D80C8D2864F9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f16,	%f2
	bpos	loop_1428
	orcc	%i0,	0x0C02,	%g2
	andcc	%i5,	%g4,	%i2
	be,pt	%xcc,	loop_1429
loop_1428:
	udiv	%g1,	0x1516,	%o0
	sir	0x0A16
	stw	%g6,	[%l7 + 0x68]
loop_1429:
	tne	%xcc,	0x4
	edge16n	%g7,	%o3,	%i3
	movre	%l2,	%l1,	%i7
	movne	%xcc,	%o5,	%l5
	fblg	%fcc0,	loop_1430
	array32	%o4,	%o6,	%i1
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1430:
	fornot2s	%f29,	%f8,	%f28
	xnorcc	%g3,	%o7,	%i4
	sub	%o2,	%g5,	%l6
	fors	%f1,	%f14,	%f6
	bn,a	%xcc,	loop_1431
	addcc	%i6,	0x17E2,	%o1
	tne	%xcc,	0x5
	nop
	fitod	%f8,	%f6
	fdtos	%f6,	%f17
loop_1431:
	fbuge,a	%fcc1,	loop_1432
	edge16l	%l4,	%l3,	%l0
	tle	%xcc,	0x0
	subcc	%g2,	%i0,	%g4
loop_1432:
	sdiv	%i2,	0x04A5,	%g1
	edge16n	%o0,	%g6,	%g7
	movle	%icc,	%i5,	%i3
	set	0x30, %g4
	stxa	%o3,	[%l7 + %g4] 0x88
	fxnor	%f10,	%f10,	%f24
	movre	%l2,	%l1,	%o5
	stw	%l5,	[%l7 + 0x6C]
	brnz	%i7,	loop_1433
	edge16ln	%o4,	%o6,	%i1
	subccc	%g3,	0x1A2A,	%o7
	stb	%o2,	[%l7 + 0x68]
loop_1433:
	membar	0x3F
	brgez,a	%g5,	loop_1434
	sdivcc	%i4,	0x104A,	%i6
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%o1
loop_1434:
	movrgez	%l6,	%l4,	%l3
	xnorcc	%l0,	%i0,	%g2
	bne,a,pt	%icc,	loop_1435
	ble,a	loop_1436
	ldub	[%l7 + 0x71],	%i2
	fxnors	%f1,	%f15,	%f31
loop_1435:
	movrlez	%g4,	0x32E,	%o0
loop_1436:
	fmovrsgez	%g1,	%f15,	%f2
	fmovrdne	%g7,	%f16,	%f8
	umul	%g6,	0x16E9,	%i5
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ble,pn	%icc,	loop_1437
	fmul8x16au	%f25,	%f4,	%f28
	fandnot2s	%f26,	%f25,	%f4
	std	%f0,	[%l7 + 0x68]
loop_1437:
	smul	%i3,	%l2,	%o3
	call	loop_1438
	movg	%icc,	%l1,	%l5
	set	0x3C, %g7
	lduwa	[%l7 + %g7] 0x14,	%o5
loop_1438:
	nop
	set	0x36, %i7
	ldsha	[%l7 + %i7] 0x80,	%o4
	bneg,pt	%xcc,	loop_1439
	andncc	%o6,	%i1,	%g3
	fmovsa	%icc,	%f16,	%f3
	subcc	%i7,	%o7,	%g5
loop_1439:
	addccc	%o2,	%i4,	%i6
	sdiv	%l6,	0x1A9F,	%o1
	fcmpeq32	%f16,	%f24,	%l3
	pdist	%f2,	%f18,	%f16
	array16	%l4,	%l0,	%g2
	fpsub32	%f12,	%f18,	%f26
	popc	%i0,	%i2
	tsubcctv	%g4,	0x1B77,	%g1
	nop
	setx	0x014EB5A8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xC8953406,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f23,	%f28
	nop
	setx	0xB322C6A4C067C7A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	tge	%xcc,	0x5
	tvc	%icc,	0x1
	mova	%icc,	%g7,	%o0
	alignaddrl	%g6,	%i3,	%i5
	bcc,pt	%icc,	loop_1440
	fbue,a	%fcc1,	loop_1441
	fcmpeq32	%f12,	%f4,	%o3
	tleu	%icc,	0x6
loop_1440:
	subccc	%l2,	%l1,	%l5
loop_1441:
	sll	%o4,	0x03,	%o6
	udivx	%i1,	0x0B0A,	%g3
	nop
	set	0x4C, %l6
	ldsh	[%l7 + %l6],	%o5
	fones	%f27
	edge16n	%i7,	%g5,	%o7
	mova	%xcc,	%i4,	%o2
	tne	%xcc,	0x1
	sth	%l6,	[%l7 + 0x48]
	xnor	%i6,	%o1,	%l3
	tcs	%icc,	0x5
	sdivcc	%l0,	0x1FFC,	%g2
	nop
	set	0x48, %o1
	stx	%i0,	[%l7 + %o1]
	sll	%i2,	%g4,	%l4
	nop
	setx	0x83257382,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x427B90AB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f6,	%f15
	umul	%g1,	%g7,	%g6
	subc	%o0,	0x1C6E,	%i3
	andncc	%i5,	%o3,	%l1
	edge16ln	%l5,	%l2,	%o6
	addcc	%o4,	%g3,	%o5
	nop
	setx	0x206F9413,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	fsrc1s	%f11,	%f11
	set	0x78, %g3
	lda	[%l7 + %g3] 0x88,	%f17
	bn,a,pn	%icc,	loop_1442
	tge	%xcc,	0x3
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1442:
	umulcc	%i7,	0x048E,	%i1
	movgu	%xcc,	%g5,	%o7
	andn	%o2,	%l6,	%i4
	edge8n	%o1,	%l3,	%i6
	tg	%xcc,	0x4
	movgu	%icc,	%l0,	%i0
	edge16	%i2,	%g4,	%g2
	edge16	%g1,	%l4,	%g6
	bvs	loop_1443
	brz,a	%o0,	loop_1444
	fbug	%fcc3,	loop_1445
	lduw	[%l7 + 0x18],	%i3
loop_1443:
	tn	%xcc,	0x6
loop_1444:
	srlx	%i5,	0x03,	%o3
loop_1445:
	movrlz	%l1,	%l5,	%l2
	edge16	%g7,	%o4,	%g3
	set	0x118, %l2
	stxa	%o5,	[%g0 + %l2] 0x52
	umul	%i7,	0x0EEE,	%o6
	tsubcctv	%i1,	0x0190,	%o7
	fmovsgu	%xcc,	%f21,	%f12
	sra	%g5,	%l6,	%o2
	subccc	%o1,	0x0038,	%l3
	udivx	%i4,	0x1D5B,	%i6
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x46] %asi,	%i0
	umul	%i2,	%g4,	%g2
	movcc	%icc,	%l0,	%g1
	fbu,a	%fcc2,	loop_1446
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x0
	brgz	%g6,	loop_1447
loop_1446:
	xnor	%l4,	0x0774,	%o0
	addc	%i3,	0x1873,	%i5
	xnorcc	%l1,	0x0213,	%l5
loop_1447:
	movrgz	%o3,	%g7,	%o4
	subcc	%l2,	0x105E,	%g3
	movg	%xcc,	%i7,	%o6
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f22
	fxtod	%f22,	%f8
	move	%icc,	%i1,	%o7
	fbg,a	%fcc1,	loop_1448
	tpos	%xcc,	0x3
	tneg	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1448:
	umul	%g5,	0x1288,	%o5
	fornot2	%f22,	%f2,	%f18
	tcs	%xcc,	0x3
	movre	%l6,	%o1,	%l3
	fnand	%f4,	%f16,	%f12
	tsubcc	%i4,	%i6,	%o2
	bneg,a,pn	%icc,	loop_1449
	sir	0x1EB8
	fcmple32	%f30,	%f8,	%i2
	movleu	%icc,	%g4,	%i0
loop_1449:
	alignaddrl	%l0,	%g2,	%g1
	tpos	%xcc,	0x2
	ldd	[%l7 + 0x08],	%l4
	flush	%l7 + 0x30
	srl	%o0,	0x1F,	%g6
	sdivx	%i3,	0x1D9F,	%i5
	edge8n	%l5,	%o3,	%l1
	fcmpeq16	%f20,	%f10,	%o4
	sllx	%g7,	0x11,	%l2
	orncc	%g3,	%o6,	%i7
	tneg	%xcc,	0x7
	movge	%xcc,	%o7,	%i1
	fpmerge	%f26,	%f3,	%f30
	edge16n	%g5,	%l6,	%o5
	nop
	setx	0x74C4529F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xFA8302AA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f27,	%f16
	fnor	%f22,	%f10,	%f24
	fmovsle	%icc,	%f2,	%f23
	edge32l	%o1,	%l3,	%i4
	fxnors	%f16,	%f31,	%f4
	fba	%fcc1,	loop_1450
	movpos	%xcc,	%o2,	%i6
	tn	%xcc,	0x0
	edge32n	%i2,	%i0,	%g4
loop_1450:
	sdiv	%l0,	0x0F7E,	%g2
	nop
	setx	loop_1451,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_1452,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movg	%icc,	%l4,	%o0
	fmovrse	%g1,	%f29,	%f1
loop_1451:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1452:
	fbue,a	%fcc0,	loop_1453
	nop
	setx	0x3078662F,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	fmovrdgz	%i3,	%f6,	%f0
	movneg	%xcc,	%g6,	%i5
loop_1453:
	orn	%l5,	%o3,	%o4
	membar	0x7B
	tleu	%icc,	0x2
	edge16l	%l1,	%g7,	%g3
	bn,a,pn	%icc,	loop_1454
	fbne,a	%fcc0,	loop_1455
	ldx	[%l7 + 0x30],	%o6
	fmovsn	%icc,	%f7,	%f0
loop_1454:
	nop
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l2,	%i7
loop_1455:
	nop
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x19,	 0x0
	fornot2	%f2,	%f4,	%f16
	nop
	setx	0xA25634F77F9D0A1F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xC163E6F1A2DB0FEF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f28,	%f24
	bshuffle	%f12,	%f24,	%f30
	and	%g5,	%l6,	%o7
	move	%xcc,	%o1,	%l3
	lduh	[%l7 + 0x36],	%o5
	ta	%icc,	0x6
	mova	%icc,	%i4,	%i6
	bn,pt	%icc,	loop_1456
	and	%i2,	0x0E4E,	%o2
	edge32l	%i0,	%l0,	%g2
	sethi	0x14B7,	%l4
loop_1456:
	movn	%icc,	%g4,	%o0
	movrgez	%i3,	%g1,	%g6
	fxnor	%f22,	%f26,	%f2
	udivx	%l5,	0x1FD0,	%o3
	movn	%icc,	%o4,	%i5
	fmovdvc	%xcc,	%f30,	%f19
	edge32l	%g7,	%l1,	%o6
	move	%xcc,	%l2,	%i7
	orn	%i1,	%g5,	%l6
	umulcc	%o7,	%g3,	%l3
	edge16l	%o5,	%i4,	%i6
	fble	%fcc0,	loop_1457
	tn	%xcc,	0x4
	movrlez	%i2,	%o1,	%i0
	udiv	%l0,	0x0769,	%o2
loop_1457:
	smul	%g2,	0x1308,	%l4
	add	%g4,	%o0,	%i3
	tpos	%icc,	0x6
	fmul8sux16	%f16,	%f28,	%f12
	sethi	0x0276,	%g1
	fnegs	%f18,	%f7
	xnor	%l5,	%o3,	%o4
	addcc	%g6,	0x10E6,	%i5
	std	%f4,	[%l7 + 0x60]
	movg	%icc,	%g7,	%o6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x2
	fmovsneg	%xcc,	%f18,	%f15
	tpos	%xcc,	0x1
	and	%l1,	%i1,	%g5
	movrne	%i7,	0x1A9,	%o7
	fmovrdlz	%l6,	%f16,	%f4
	add	%l7,	0x40,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%l3,	%o5
	fbule	%fcc2,	loop_1458
	fmovda	%xcc,	%f9,	%f22
	fbn	%fcc2,	loop_1459
	movpos	%icc,	%i4,	%i6
loop_1458:
	sll	%g3,	0x09,	%o1
	movvc	%xcc,	%i0,	%l0
loop_1459:
	fmovdne	%icc,	%f20,	%f1
	fnegd	%f16,	%f8
	nop
	fitod	%f8,	%f4
	fdtoi	%f4,	%f29
	fbuge,a	%fcc2,	loop_1460
	nop
	setx	0xF04C22EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	brgez,a	%i2,	loop_1461
	nop
	setx	loop_1462,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1460:
	fmovscc	%icc,	%f22,	%f12
	nop
	fitos	%f10,	%f14
	fstod	%f14,	%f14
loop_1461:
	tn	%icc,	0x0
loop_1462:
	umul	%g2,	%l4,	%g4
	fcmpeq16	%f24,	%f30,	%o0
	nop
	setx	0x1AACB1BA72C83D22,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f8
	bvs,a	loop_1463
	fmovdleu	%xcc,	%f15,	%f13
	movleu	%xcc,	%i3,	%o2
	edge16n	%l5,	%g1,	%o3
loop_1463:
	mulscc	%o4,	0x1441,	%g6
	set	0x28, %i5
	sta	%f27,	[%l7 + %i5] 0x89
	fnors	%f0,	%f15,	%f22
	sllx	%g7,	0x15,	%i5
	andn	%l2,	%l1,	%o6
	tneg	%xcc,	0x1
	subc	%g5,	0x14EB,	%i7
	ldd	[%l7 + 0x10],	%i0
	addc	%l6,	0x0117,	%o7
	sir	0x138F
	fnor	%f10,	%f30,	%f0
	fbuge,a	%fcc1,	loop_1464
	udiv	%l3,	0x141D,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i6,	%o5,	%g3
loop_1464:
	sra	%i0,	%l0,	%o1
	nop
	setx	loop_1465,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1	%f24,	%f18,	%f28
	xnorcc	%g2,	0x06A3,	%i2
	fbule,a	%fcc0,	loop_1466
loop_1465:
	fones	%f21
	sdivx	%g4,	0x0DD0,	%o0
	array32	%l4,	%o2,	%i3
loop_1466:
	fmovsgu	%xcc,	%f27,	%f17
	edge16n	%g1,	%l5,	%o4
	fmovdge	%xcc,	%f26,	%f4
	edge8ln	%g6,	%o3,	%g7
	tge	%xcc,	0x1
	fmovdvs	%icc,	%f28,	%f23
	ldsb	[%l7 + 0x56],	%l2
	andncc	%l1,	%o6,	%g5
	alignaddrl	%i7,	%i1,	%l6
	movcc	%xcc,	%i5,	%l3
	udiv	%o7,	0x0FCE,	%i4
	brlez,a	%o5,	loop_1467
	umulcc	%i6,	%i0,	%g3
	orncc	%l0,	0x050F,	%o1
	edge32ln	%i2,	%g4,	%o0
loop_1467:
	edge16l	%g2,	%l4,	%i3
	subcc	%g1,	%l5,	%o4
	tcc	%xcc,	0x2
	movrgz	%o2,	%g6,	%o3
	movrgz	%g7,	%l1,	%l2
	fornot2	%f30,	%f22,	%f8
	set	0x34, %i1
	swapa	[%l7 + %i1] 0x0c,	%o6
	xnor	%g5,	0x039C,	%i7
	popc	0x053D,	%i1
	ldsh	[%l7 + 0x20],	%l6
	tvs	%icc,	0x6
	mulx	%i5,	%o7,	%l3
	ldsb	[%l7 + 0x26],	%i4
	fmul8x16	%f11,	%f24,	%f14
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i6,	%o5
	subccc	%i0,	%l0,	%o1
	edge8ln	%g3,	%g4,	%i2
	fnor	%f28,	%f6,	%f8
	orn	%o0,	0x0762,	%g2
	movpos	%xcc,	%i3,	%g1
	movge	%xcc,	%l4,	%o4
	nop
	setx	0x84F6E83745DA3585,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x36672D1294E2FC4E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f16,	%f10
	xnor	%l5,	%g6,	%o3
	taddcc	%o2,	0x0E9D,	%g7
	andcc	%l1,	%l2,	%g5
	tpos	%icc,	0x0
	movge	%xcc,	%i7,	%o6
	set	0x46, %i6
	ldsba	[%l7 + %i6] 0x88,	%l6
	set	0x50, %g5
	ldda	[%l7 + %g5] 0x26,	%i4
	sethi	0x1E96,	%i1
	ldsb	[%l7 + 0x30],	%l3
	edge16n	%o7,	%i6,	%o5
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f26
	fxtod	%f26,	%f28
	movrlez	%i4,	%l0,	%i0
	and	%g3,	0x1DA4,	%o1
	te	%xcc,	0x3
	andncc	%g4,	%i2,	%o0
	movge	%xcc,	%i3,	%g1
	bshuffle	%f8,	%f14,	%f26
	fmovdvs	%icc,	%f23,	%f30
	fbn,a	%fcc0,	loop_1468
	ld	[%l7 + 0x18],	%f12
	tgu	%xcc,	0x5
	tgu	%xcc,	0x1
loop_1468:
	or	%g2,	%o4,	%l5
	movre	%l4,	0x2EA,	%o3
	set	0x58, %l0
	stxa	%o2,	[%l7 + %l0] 0x80
	srl	%g7,	0x19,	%l1
	fbl	%fcc3,	loop_1469
	orcc	%g6,	0x13C8,	%g5
	ldsb	[%l7 + 0x6C],	%i7
	fpackfix	%f18,	%f8
loop_1469:
	ta	%xcc,	0x6
	swap	[%l7 + 0x0C],	%o6
	orncc	%l6,	0x012F,	%i5
	edge8l	%l2,	%i1,	%l3
	subc	%o7,	0x07E4,	%i6
	movvc	%icc,	%o5,	%l0
	fmovrse	%i0,	%f16,	%f10
	movcs	%xcc,	%g3,	%o1
	brgz,a	%i4,	loop_1470
	nop
	setx loop_1471, %l0, %l1
	jmpl %l1, %g4
	srl	%o0,	0x0A,	%i2
	srl	%i3,	%g2,	%g1
loop_1470:
	ld	[%l7 + 0x2C],	%f26
loop_1471:
	edge32	%l5,	%l4,	%o4
	movleu	%icc,	%o3,	%g7
	sdiv	%o2,	0x15A9,	%l1
	set	0x1C, %g1
	ldswa	[%l7 + %g1] 0x14,	%g6
	fble	%fcc1,	loop_1472
	sdiv	%g5,	0x1F72,	%o6
	alignaddr	%i7,	%l6,	%l2
	bleu,pt	%xcc,	loop_1473
loop_1472:
	fmovrdgz	%i5,	%f4,	%f24
	movg	%icc,	%i1,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1473:
	bg,a,pt	%xcc,	loop_1474
	sllx	%i6,	0x06,	%o5
	prefetch	[%l7 + 0x10],	 0x0
	udiv	%l3,	0x1E8F,	%l0
loop_1474:
	orn	%g3,	0x088A,	%o1
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x50] %asi,	%i0
	bg,a,pn	%icc,	loop_1475
	fmovda	%icc,	%f24,	%f19
	edge32n	%g4,	%o0,	%i2
	xnorcc	%i4,	%i3,	%g1
loop_1475:
	alignaddrl	%l5,	%g2,	%l4
	fmovrdgez	%o4,	%f4,	%f16
	andncc	%g7,	%o2,	%l1
	sth	%o3,	[%l7 + 0x3A]
	mova	%xcc,	%g5,	%o6
	movpos	%icc,	%g6,	%i7
	mulx	%l6,	%l2,	%i1
	movg	%xcc,	%i5,	%o7
	edge16n	%i6,	%l3,	%o5
	edge16l	%l0,	%g3,	%o1
	taddcc	%i0,	0x0276,	%o0
	brgz	%i2,	loop_1476
	edge32n	%g4,	%i4,	%g1
	membar	0x25
	srax	%i3,	%g2,	%l4
loop_1476:
	subc	%l5,	%o4,	%g7
	set	0x2E, %i3
	stha	%o2,	[%l7 + %i3] 0x23
	membar	#Sync
	edge32n	%l1,	%o3,	%g5
	movneg	%xcc,	%g6,	%o6
	xnor	%l6,	%i7,	%l2
	fbg,a	%fcc1,	loop_1477
	tne	%xcc,	0x4
	edge32	%i5,	%o7,	%i6
	fcmpne32	%f16,	%f8,	%l3
loop_1477:
	fmuld8sux16	%f4,	%f1,	%f6
	edge8	%i1,	%o5,	%g3
	udiv	%o1,	0x0300,	%l0
	movrgz	%o0,	0x3E3,	%i0
	sdiv	%i2,	0x0304,	%i4
	smulcc	%g4,	%g1,	%g2
	subccc	%i3,	%l5,	%o4
	set	0x50, %i2
	ldda	[%l7 + %i2] 0x24,	%g6
	fsrc1	%f20,	%f0
	bneg,a	loop_1478
	fbe,a	%fcc2,	loop_1479
	smulcc	%o2,	%l4,	%l1
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0xf1
	membar	#Sync
loop_1478:
	movvc	%icc,	%g5,	%o3
loop_1479:
	faligndata	%f18,	%f2,	%f20
	edge16ln	%g6,	%l6,	%o6
	fble,a	%fcc0,	loop_1480
	movcc	%icc,	%i7,	%l2
	and	%i5,	0x1279,	%i6
	stw	%l3,	[%l7 + 0x18]
loop_1480:
	fpmerge	%f7,	%f4,	%f6
	sra	%o7,	%o5,	%g3
	movl	%icc,	%o1,	%l0
	set	0x58, %i0
	lda	[%l7 + %i0] 0x10,	%f4
	mulx	%o0,	0x137D,	%i1
	movrne	%i0,	%i4,	%i2
	fxor	%f18,	%f18,	%f24
	addccc	%g4,	%g1,	%g2
	andncc	%i3,	%o4,	%g7
	movre	%l5,	%l4,	%o2
	ldd	[%l7 + 0x50],	%g4
	nop
	fitos	%f2,	%f3
	fstox	%f3,	%f18
	alignaddr	%o3,	%g6,	%l6
	fxors	%f7,	%f27,	%f3
	fsrc2s	%f24,	%f19
	smul	%l1,	%i7,	%o6
	movleu	%xcc,	%i5,	%l2
	ldd	[%l7 + 0x50],	%f14
	orncc	%i6,	0x1CF4,	%l3
	andcc	%o7,	%g3,	%o5
	or	%l0,	0x0627,	%o0
	pdist	%f16,	%f6,	%f8
	movvs	%xcc,	%o1,	%i1
	andncc	%i4,	%i0,	%g4
	movgu	%icc,	%i2,	%g1
	fpackfix	%f22,	%f11
	fmul8x16au	%f28,	%f16,	%f20
	lduw	[%l7 + 0x4C],	%i3
	ldx	[%l7 + 0x78],	%o4
	fsrc1s	%f26,	%f15
	tg	%icc,	0x6
	tvc	%icc,	0x4
	movcs	%icc,	%g7,	%g2
	orncc	%l4,	%o2,	%g5
	fmovdl	%icc,	%f17,	%f22
	movvc	%icc,	%o3,	%l5
	brz	%l6,	loop_1481
	edge16n	%g6,	%i7,	%o6
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f28
	xnor	%l1,	%l2,	%i6
loop_1481:
	udivcc	%i5,	0x1970,	%l3
	tg	%xcc,	0x5
	array16	%o7,	%g3,	%o5
	array8	%o0,	%o1,	%l0
	fmul8x16au	%f29,	%f29,	%f26
	brz	%i4,	loop_1482
	movpos	%xcc,	%i1,	%i0
	sub	%g4,	0x1F07,	%g1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x40] %asi,	%i3
loop_1482:
	subcc	%i2,	0x1208,	%g7
	movre	%o4,	0x35E,	%g2
	tle	%xcc,	0x2
	fmovdpos	%xcc,	%f29,	%f0
	movrlez	%l4,	%g5,	%o2
	sethi	0x0856,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o3,	%g6,	%l6
	brgez,a	%i7,	loop_1483
	fornot2s	%f7,	%f15,	%f18
	sdiv	%o6,	0x12AF,	%l1
	fpackfix	%f22,	%f6
loop_1483:
	fnands	%f22,	%f5,	%f23
	fbe,a	%fcc1,	loop_1484
	nop
	fitos	%f2,	%f15
	fstox	%f15,	%f4
	umulcc	%l2,	%i5,	%l3
	te	%icc,	0x4
loop_1484:
	fble,a	%fcc1,	loop_1485
	edge32l	%o7,	%g3,	%o5
	tne	%xcc,	0x7
	stw	%i6,	[%l7 + 0x5C]
loop_1485:
	movvc	%icc,	%o0,	%o1
	fxnor	%f4,	%f18,	%f0
	te	%xcc,	0x6
	tge	%icc,	0x2
	std	%f24,	[%l7 + 0x68]
	movl	%icc,	%i4,	%l0
	edge8	%i0,	%g4,	%i1
	array16	%i3,	%g1,	%i2
	call	loop_1486
	edge8n	%g7,	%g2,	%l4
	fmovrse	%o4,	%f15,	%f31
	tsubcc	%g5,	%o2,	%l5
loop_1486:
	mova	%icc,	%g6,	%l6
	array32	%i7,	%o3,	%o6
	fmovsne	%icc,	%f26,	%f4
	bpos,a,pt	%icc,	loop_1487
	udivx	%l1,	0x0417,	%l2
	fmovdcs	%icc,	%f31,	%f30
	ldd	[%l7 + 0x10],	%f6
loop_1487:
	edge8ln	%i5,	%l3,	%g3
	tne	%xcc,	0x3
	movneg	%icc,	%o5,	%o7
	fmovde	%xcc,	%f23,	%f8
	bneg,a,pt	%icc,	loop_1488
	fmul8ulx16	%f12,	%f2,	%f20
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o0
loop_1488:
	srlx	%o1,	%i6,	%i4
	tsubcc	%i0,	%g4,	%l0
	movrlz	%i3,	0x02E,	%i1
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i2
	fpack16	%f4,	%f16
	fnands	%f19,	%f21,	%f9
	fmovdle	%icc,	%f30,	%f4
	nop
	setx	0x44B7482B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xEF955A19,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f27,	%f12
	brgz,a	%g1,	loop_1489
	popc	0x0B88,	%g2
	add	%l4,	0x1A25,	%o4
	fpsub16s	%f6,	%f3,	%f4
loop_1489:
	tgu	%icc,	0x6
	fbule,a	%fcc0,	loop_1490
	fbne,a	%fcc0,	loop_1491
	srlx	%g7,	%o2,	%l5
	smul	%g5,	0x10AC,	%l6
loop_1490:
	nop
	setx	0x96C0AFE256373718,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x627899833385CEF6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f22,	%f4
loop_1491:
	subcc	%i7,	%o3,	%o6
	sdiv	%g6,	0x06BC,	%l1
	taddcctv	%l2,	0x138E,	%l3
	tl	%xcc,	0x5
	fcmpne16	%f20,	%f8,	%g3
	fnands	%f18,	%f31,	%f14
	fones	%f17
	nop
	fitos	%f0,	%f25
	fstoi	%f25,	%f11
	nop
	setx	0x35D43D91,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	fsqrts	%f1,	%f11
	fbe,a	%fcc2,	loop_1492
	movne	%icc,	%i5,	%o5
	swap	[%l7 + 0x58],	%o0
	edge16l	%o7,	%i6,	%i4
loop_1492:
	movl	%icc,	%o1,	%g4
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x58] %asi,	%l0
	flush	%l7 + 0x6C
	sdiv	%i3,	0x083C,	%i0
	nop
	setx	0xB1C1628A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x2E4A472B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f23,	%f2
	tg	%icc,	0x2
	fmovdcc	%icc,	%f15,	%f4
	fsrc2s	%f17,	%f4
	edge32	%i1,	%i2,	%g2
	stx	%l4,	[%l7 + 0x28]
	edge16n	%g1,	%g7,	%o4
	srlx	%l5,	%o2,	%g5
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	fmovrslez	%o3,	%f16,	%f20
	movvc	%icc,	%o6,	%g6
	tvs	%icc,	0x6
	tpos	%xcc,	0x4
	smul	%l1,	%l2,	%l3
	movrlez	%i7,	0x0FB,	%g3
	alignaddrl	%i5,	%o0,	%o5
	andn	%i6,	%i4,	%o7
	edge16	%g4,	%l0,	%i3
	tvc	%icc,	0x7
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x08] %asi,	%i0
	edge32	%o1,	%i1,	%g2
	membar	0x0A
	taddcc	%i2,	%l4,	%g1
	movrgz	%o4,	%l5,	%g7
	ta	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x58] %asi,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x0C],	 0x3
	taddcc	%o2,	0x03DE,	%l6
	tpos	%icc,	0x4
	xnorcc	%o6,	%g6,	%l1
	nop
	set	0x38, %i4
	ldstub	[%l7 + %i4],	%o3
	ba,pt	%xcc,	loop_1493
	tge	%icc,	0x6
	movvs	%icc,	%l3,	%l2
	movre	%i7,	%i5,	%g3
loop_1493:
	fmovda	%icc,	%f30,	%f23
	or	%o0,	%i6,	%i4
	movrgez	%o7,	0x31A,	%o5
	tvs	%xcc,	0x2
	movrne	%g4,	0x26D,	%l0
	bvc,pn	%xcc,	loop_1494
	nop
	set	0x36, %o5
	lduh	[%l7 + %o5],	%i3
	add	%o1,	0x1120,	%i1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x74] %asi,	%g2
loop_1494:
	tne	%icc,	0x6
	edge8n	%i0,	%i2,	%l4
	tcc	%icc,	0x1
	set	0x20, %g6
	ldswa	[%l7 + %g6] 0x88,	%o4
	edge32ln	%l5,	%g1,	%g5
	xnor	%g7,	%l6,	%o6
	array8	%o2,	%l1,	%o3
	stbar
	bcc,a	%xcc,	loop_1495
	movvs	%icc,	%g6,	%l2
	fcmple16	%f0,	%f10,	%l3
	smul	%i7,	%g3,	%i5
loop_1495:
	fmovrdlez	%o0,	%f0,	%f18
	fnand	%f14,	%f8,	%f30
	fmovsa	%icc,	%f3,	%f13
	fbl,a	%fcc1,	loop_1496
	fba	%fcc1,	loop_1497
	ldsh	[%l7 + 0x3E],	%i4
	fmovdl	%icc,	%f18,	%f28
loop_1496:
	fcmpgt32	%f6,	%f18,	%i6
loop_1497:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x70] %asi,	%o5
	fornot2s	%f1,	%f5,	%f3
	fand	%f28,	%f6,	%f2
	alignaddrl	%o7,	%g4,	%i3
	addcc	%o1,	%i1,	%g2
	umulcc	%i0,	%i2,	%l4
	edge32	%l0,	%l5,	%o4
	movgu	%xcc,	%g1,	%g5
	brgez	%g7,	loop_1498
	orcc	%l6,	0x07B6,	%o6
	nop
	fitos	%f3,	%f9
	fstox	%f9,	%f30
	fxtos	%f30,	%f1
	and	%l1,	0x17C2,	%o2
loop_1498:
	mova	%xcc,	%g6,	%o3
	nop
	setx	0xB9AEE134C052B156,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	movrgez	%l3,	0x20B,	%l2
	xnorcc	%g3,	0x1110,	%i7
	umul	%o0,	%i5,	%i6
	udivx	%o5,	0x0B15,	%i4
	fmovrdlz	%g4,	%f0,	%f30
	nop
	setx	0x8B0E8785BD4FC218,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xAE11F7D3B6BFDC9A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f18,	%f26
	edge8ln	%i3,	%o7,	%o1
	fandnot1s	%f17,	%f26,	%f31
	movrgez	%g2,	%i1,	%i2
	srl	%i0,	0x15,	%l0
	fbo,a	%fcc2,	loop_1499
	array32	%l5,	%l4,	%o4
	fbe	%fcc2,	loop_1500
	pdist	%f20,	%f20,	%f16
loop_1499:
	sethi	0x0337,	%g5
	sllx	%g1,	0x09,	%g7
loop_1500:
	nop
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x60] %asi,	%l6
	orn	%o6,	0x060C,	%l1
	fpadd16s	%f15,	%f27,	%f22
	tleu	%xcc,	0x3
	edge8ln	%o2,	%o3,	%l3
	nop
	setx	0xDAEC55A9BCCD0405,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x42311C0A73ABC668,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f24,	%f26
	nop
	setx	0xD06F6F56,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	tcs	%xcc,	0x6
	fmovdleu	%icc,	%f9,	%f17
	movneg	%icc,	%l2,	%g6
	fble,a	%fcc3,	loop_1501
	call	loop_1502
	fnegs	%f16,	%f22
	ldstub	[%l7 + 0x15],	%i7
loop_1501:
	nop
	fitod	%f9,	%f28
loop_1502:
	edge8	%g3,	%i5,	%i6
	tsubcctv	%o5,	0x1D28,	%o0
	bge	loop_1503
	udiv	%g4,	0x0634,	%i3
	fbn	%fcc0,	loop_1504
	edge32n	%i4,	%o1,	%o7
loop_1503:
	alignaddrl	%g2,	%i2,	%i0
	set	0x68, %o4
	swapa	[%l7 + %o4] 0x11,	%l0
loop_1504:
	nop
	setx	0x3AF4E32EDC77030F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xF1B50A5B7445E18D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f10,	%f28
	sllx	%i1,	%l5,	%o4
	nop
	setx	loop_1505,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%l4,	%g1,	%g5
	bcs,a	%xcc,	loop_1506
	movvs	%icc,	%l6,	%g7
loop_1505:
	tneg	%icc,	0x1
	srax	%o6,	0x1C,	%l1
loop_1506:
	mulscc	%o3,	%o2,	%l3
	tvs	%icc,	0x3
	bge,a	%xcc,	loop_1507
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g6,	0x0444,	%i7
	sra	%g3,	%i5,	%i6
loop_1507:
	tleu	%xcc,	0x6
	tsubcc	%o5,	%o0,	%l2
	fbn,a	%fcc0,	loop_1508
	ble,pt	%icc,	loop_1509
	udivcc	%i3,	0x0574,	%g4
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f18
	fxtod	%f18,	%f26
loop_1508:
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f26
	fxtod	%f26,	%f16
loop_1509:
	fbne	%fcc3,	loop_1510
	fmovrdgz	%o1,	%f14,	%f22
	movvc	%icc,	%o7,	%i4
	movge	%xcc,	%g2,	%i0
loop_1510:
	tcs	%icc,	0x4
	array32	%i2,	%l0,	%l5
	move	%xcc,	%i1,	%l4
	fmuld8sux16	%f9,	%f5,	%f12
	addccc	%o4,	%g1,	%l6
	fpadd16	%f26,	%f0,	%f30
	be,a	%icc,	loop_1511
	fmovsleu	%icc,	%f13,	%f21
	smulcc	%g5,	0x1F65,	%g7
	bne	loop_1512
loop_1511:
	mulscc	%o6,	0x03C0,	%o3
	fbne,a	%fcc2,	loop_1513
	sllx	%l1,	0x0B,	%o2
loop_1512:
	xnor	%l3,	0x10EA,	%i7
	andncc	%g3,	%g6,	%i6
loop_1513:
	sdivcc	%o5,	0x1457,	%i5
	edge8l	%l2,	%o0,	%g4
	sll	%o1,	%i3,	%o7
	nop
	setx loop_1514, %l0, %l1
	jmpl %l1, %g2
	fba	%fcc3,	loop_1515
	bvs,a	loop_1516
	edge32	%i4,	%i0,	%l0
loop_1514:
	xnorcc	%i2,	0x1A86,	%i1
loop_1515:
	nop
	setx	loop_1517,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1516:
	fmovrdgz	%l4,	%f4,	%f10
	movrne	%o4,	%l5,	%g1
	subcc	%l6,	%g5,	%o6
loop_1517:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g7,	0x16BA,	%o3
	movneg	%icc,	%l1,	%o2
	fone	%f6
	set	0x5A, %l4
	stba	%i7,	[%l7 + %l4] 0x19
	movgu	%icc,	%l3,	%g6
	fxors	%f13,	%f9,	%f13
	movg	%xcc,	%g3,	%i6
	fone	%f22
	flush	%l7 + 0x10
	orncc	%o5,	%i5,	%o0
	subc	%g4,	0x17BF,	%o1
	xorcc	%i3,	%o7,	%l2
	ldsw	[%l7 + 0x2C],	%g2
	move	%xcc,	%i4,	%l0
	srax	%i2,	0x1D,	%i1
	edge16n	%l4,	%o4,	%i0
	nop
	fitos	%f7,	%f5
	fstox	%f5,	%f12
	fxtos	%f12,	%f11
	subc	%l5,	0x1014,	%l6
	ldd	[%l7 + 0x60],	%g4
	lduh	[%l7 + 0x70],	%o6
	ta	%xcc,	0x5
	or	%g1,	0x1F7D,	%o3
	fbul	%fcc0,	loop_1518
	alignaddrl	%l1,	%o2,	%i7
	ba,pt	%icc,	loop_1519
	bpos,a	%xcc,	loop_1520
loop_1518:
	fpmerge	%f21,	%f23,	%f0
	ldd	[%l7 + 0x48],	%f12
loop_1519:
	andcc	%l3,	0x0195,	%g7
loop_1520:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f11,	%f15
	taddcc	%g6,	%i6,	%g3
	tvc	%xcc,	0x2
	set	0x5E, %l5
	ldstuba	[%l7 + %l5] 0x10,	%o5
	movl	%icc,	%i5,	%o0
	tsubcc	%o1,	0x0428,	%g4
	fxors	%f1,	%f11,	%f21
	wr	%g0,	0x27,	%asi
	stba	%i3,	[%l7 + 0x6F] %asi
	membar	#Sync
	set	0x58, %o7
	ldswa	[%l7 + %o7] 0x18,	%o7
	fbule	%fcc3,	loop_1521
	ble	%xcc,	loop_1522
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f22
	nop
	setx	0xF15728CBF595C660,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xD2C6BFA07C8B402E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f16,	%f2
loop_1521:
	bneg	%xcc,	loop_1523
loop_1522:
	bl,a,pn	%xcc,	loop_1524
	movrne	%l2,	%i4,	%l0
	tle	%xcc,	0x0
loop_1523:
	movleu	%xcc,	%i2,	%g2
loop_1524:
	sethi	0x1C1C,	%l4
	fmuld8ulx16	%f16,	%f13,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o4,	0x088E,	%i1
	fbug	%fcc0,	loop_1525
	taddcc	%i0,	%l6,	%g5
	bne,pt	%xcc,	loop_1526
	fmovdne	%icc,	%f18,	%f14
loop_1525:
	edge8l	%l5,	%o6,	%o3
	movrne	%g1,	%o2,	%i7
loop_1526:
	edge16n	%l1,	%g7,	%g6
	srax	%l3,	0x0F,	%g3
	fcmpne32	%f14,	%f0,	%o5
	nop
	setx	0x3059F6F2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x10],	%i5
	movrlz	%o0,	%i6,	%o1
	fbue,a	%fcc3,	loop_1527
	umul	%i3,	0x014F,	%g4
	fxors	%f15,	%f15,	%f12
	fand	%f14,	%f6,	%f10
loop_1527:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f26,	%f18,	%f16
	movrgez	%l2,	%o7,	%l0
	andcc	%i4,	0x1A28,	%i2
	tcs	%xcc,	0x0
	movrgez	%g2,	%o4,	%i1
	bge,a	%icc,	loop_1528
	array32	%i0,	%l4,	%l6
	edge16n	%g5,	%o6,	%o3
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%f2
loop_1528:
	edge16ln	%g1,	%l5,	%o2
	movrgez	%l1,	0x2FF,	%g7
	nop
	setx	0xCDD19950,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x5D22B14E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f21,	%f28
	fpack16	%f30,	%f15
	fabsd	%f10,	%f4
	membar	0x4A
	fxors	%f8,	%f17,	%f8
	fba,a	%fcc1,	loop_1529
	andcc	%i7,	%g6,	%l3
	xnor	%g3,	%o5,	%o0
	set	0x48, %g2
	swapa	[%l7 + %g2] 0x89,	%i5
loop_1529:
	movcc	%icc,	%o1,	%i6
	fornot1	%f8,	%f20,	%f16
	movrgz	%g4,	%l2,	%o7
	sethi	0x1F30,	%i3
	movcs	%icc,	%l0,	%i2
	fnot2	%f4,	%f22
	fornot2	%f8,	%f30,	%f12
	and	%i4,	%g2,	%o4
	std	%f4,	[%l7 + 0x40]
	st	%f2,	[%l7 + 0x18]
	tne	%xcc,	0x5
	tl	%icc,	0x3
	alignaddrl	%i1,	%l4,	%i0
	fxnors	%f4,	%f30,	%f12
	ta	%xcc,	0x7
	movvs	%xcc,	%g5,	%o6
	mova	%xcc,	%l6,	%g1
	nop
	set	0x1C, %l1
	stw	%o3,	[%l7 + %l1]
	tneg	%icc,	0x1
	set	0x47, %o3
	ldsba	[%l7 + %o3] 0x10,	%l5
	alignaddrl	%l1,	%g7,	%i7
	fandnot2s	%f27,	%f2,	%f16
	fmul8sux16	%f30,	%f12,	%f14
	movg	%icc,	%g6,	%o2
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f6
	fxtod	%f6,	%f2
	addc	%l3,	0x1486,	%g3
	array16	%o5,	%i5,	%o1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o0,	%g4
	nop
	setx	0x169490C3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x0FF8CEF6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f16,	%f3
	ba,pn	%xcc,	loop_1530
	subc	%i6,	%l2,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f17,	%f15,	%f27
loop_1530:
	fornot2s	%f19,	%f20,	%f27
	movg	%icc,	%l0,	%i2
	movrgz	%i3,	%i4,	%g2
	movneg	%xcc,	%i1,	%o4
	sub	%i0,	0x0959,	%g5
	fpack32	%f0,	%f0,	%f16
	fmovd	%f14,	%f26
	membar	0x42
	movrlez	%l4,	%l6,	%o6
	mulx	%g1,	%o3,	%l1
	edge32	%l5,	%i7,	%g7
	nop
	setx	0x73930749D06AC56E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	andncc	%g6,	%l3,	%o2
	fcmpeq32	%f8,	%f4,	%o5
	sdivx	%i5,	0x179E,	%o1
	tsubcctv	%o0,	0x0C12,	%g3
	movrgez	%g4,	%i6,	%l2
	set	0x48, %g4
	lduha	[%l7 + %g4] 0x19,	%l0
	sdivx	%o7,	0x12EB,	%i3
	sra	%i4,	0x0D,	%i2
	fbo	%fcc0,	loop_1531
	bleu,a,pt	%icc,	loop_1532
	fmuld8sux16	%f29,	%f16,	%f28
	edge32	%i1,	%g2,	%o4
loop_1531:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%i0,	[%l7 + 0x40] %asi
loop_1532:
	edge16n	%l4,	%g5,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o6,	%g1,	%o3
	fbue,a	%fcc3,	loop_1533
	tvs	%icc,	0x5
	xnor	%l5,	%i7,	%l1
	edge16l	%g7,	%l3,	%o2
loop_1533:
	taddcc	%o5,	%i5,	%g6
	fandnot1	%f26,	%f28,	%f14
	fmul8x16	%f6,	%f24,	%f20
	tne	%icc,	0x5
	tl	%xcc,	0x1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o1,	%o0
	smulcc	%g4,	%g3,	%i6
	move	%xcc,	%l2,	%l0
	xor	%i3,	%o7,	%i4
	fmovdn	%icc,	%f6,	%f26
	fmovsle	%xcc,	%f21,	%f0
	andcc	%i1,	0x02E8,	%g2
	set	0x78, %g7
	ldxa	[%l7 + %g7] 0x81,	%i2
	edge16ln	%i0,	%l4,	%o4
	set	0x24, %i7
	swapa	[%l7 + %i7] 0x89,	%l6
	movneg	%xcc,	%o6,	%g1
	fabsd	%f18,	%f0
	addccc	%g5,	%o3,	%l5
	fbl	%fcc3,	loop_1534
	andcc	%i7,	0x18D5,	%g7
	orncc	%l3,	%o2,	%o5
	call	loop_1535
loop_1534:
	tgu	%icc,	0x6
	srl	%i5,	%l1,	%g6
	edge8	%o0,	%o1,	%g4
loop_1535:
	popc	%g3,	%l2
	pdist	%f20,	%f10,	%f28
	fands	%f13,	%f28,	%f28
	addc	%l0,	0x064B,	%i3
	sethi	0x020F,	%o7
	movl	%icc,	%i4,	%i1
	movvc	%icc,	%g2,	%i2
	andcc	%i0,	0x0610,	%i6
	movne	%xcc,	%l4,	%o4
	tgu	%icc,	0x6
	ldstub	[%l7 + 0x10],	%l6
	nop
	setx	0x2914691E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xADF9CBF3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f14,	%f29
	edge32ln	%o6,	%g5,	%o3
	fcmpne32	%f12,	%f0,	%g1
	movcs	%icc,	%i7,	%g7
	movgu	%xcc,	%l3,	%o2
	fmovsa	%xcc,	%f21,	%f26
	edge32l	%o5,	%l5,	%i5
	addcc	%g6,	0x140E,	%l1
	nop
	setx	0x79BE3BFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x9E492DE9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fmuls	%f10,	%f20,	%f21
	tge	%icc,	0x4
	srlx	%o1,	0x18,	%g4
	fmovsn	%icc,	%f24,	%f18
	fzero	%f6
	xnorcc	%g3,	0x1D43,	%o0
	fmovde	%xcc,	%f10,	%f13
	movne	%xcc,	%l0,	%i3
	fbule	%fcc2,	loop_1536
	orn	%o7,	0x0EC4,	%l2
	array16	%i4,	%g2,	%i1
	fmovd	%f6,	%f30
loop_1536:
	fnot1s	%f22,	%f21
	tg	%icc,	0x3
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%i0
	udivx	%i2,	0x133F,	%i6
	fxors	%f20,	%f14,	%f5
	movrne	%o4,	0x26E,	%l6
	pdist	%f10,	%f24,	%f16
	fmovdpos	%icc,	%f14,	%f8
	edge32l	%l4,	%o6,	%g5
	nop
	setx	0x0F8FFF020B933A49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC7384A86B66A93CE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f30,	%f18
	set	0x08, %o2
	stha	%g1,	[%l7 + %o2] 0x18
	nop
	fitod	%f0,	%f28
	fdtox	%f28,	%f2
	bvs,a,pt	%icc,	loop_1537
	edge16l	%i7,	%g7,	%o3
	set	0x44, %l6
	ldswa	[%l7 + %l6] 0x88,	%l3
loop_1537:
	nop
	fitod	%f0,	%f6
	fdtoi	%f6,	%f18
	ldx	[%l7 + 0x18],	%o2
	fbge	%fcc0,	loop_1538
	fmovsge	%xcc,	%f8,	%f29
	fcmpgt16	%f28,	%f10,	%o5
	srax	%i5,	0x11,	%g6
loop_1538:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x55] %asi,	%l1
	andncc	%l5,	%o1,	%g3
	mulx	%g4,	0x17EA,	%o0
	tsubcctv	%i3,	0x007D,	%l0
	fmul8sux16	%f16,	%f4,	%f18
	fbu,a	%fcc3,	loop_1539
	bne,a	%xcc,	loop_1540
	ldsh	[%l7 + 0x0C],	%o7
	fcmpgt32	%f2,	%f6,	%i4
loop_1539:
	fbg	%fcc1,	loop_1541
loop_1540:
	edge16l	%g2,	%l2,	%i0
	alignaddrl	%i2,	%i1,	%o4
	movcs	%xcc,	%l6,	%i6
loop_1541:
	bl,a,pt	%xcc,	loop_1542
	orncc	%o6,	0x01FF,	%l4
	fble,a	%fcc1,	loop_1543
	subccc	%g5,	%g1,	%i7
loop_1542:
	edge32l	%o3,	%g7,	%l3
	array16	%o5,	%i5,	%o2
loop_1543:
	fbu	%fcc2,	loop_1544
	movne	%xcc,	%l1,	%l5
	tpos	%xcc,	0x2
	srlx	%o1,	0x1F,	%g3
loop_1544:
	nop
	fitod	%f2,	%f20
	srax	%g4,	%g6,	%i3
	array16	%o0,	%o7,	%i4
	add	%l0,	0x0057,	%l2
	fmuld8sux16	%f28,	%f31,	%f30
	udivcc	%i0,	0x0F3F,	%g2
	sethi	0x10FF,	%i1
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x04,	%f0
	tsubcc	%i2,	0x0D15,	%l6
	fones	%f7
	move	%icc,	%i6,	%o6
	tle	%xcc,	0x6
	fmovdge	%xcc,	%f29,	%f0
	andn	%o4,	0x0982,	%g5
	edge8n	%l4,	%g1,	%i7
	tcs	%icc,	0x1
	movle	%xcc,	%o3,	%l3
	fmovs	%f26,	%f7
	movrgez	%g7,	0x2EF,	%o5
	tcc	%icc,	0x1
	fnot1	%f20,	%f2
	brgz,a	%o2,	loop_1545
	mova	%icc,	%i5,	%l5
	sdiv	%o1,	0x1560,	%g3
	movgu	%xcc,	%g4,	%l1
loop_1545:
	fnot1	%f24,	%f2
	sethi	0x0796,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x70, %l2
	ldda	[%l7 + %l2] 0xe2,	%g6
	tn	%xcc,	0x2
	fbg,a	%fcc2,	loop_1546
	nop
	setx	0x3BC4AAC75D66A560,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x69CCBD1AE727331F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f26,	%f16
	bn,a	loop_1547
	nop
	setx loop_1548, %l0, %l1
	jmpl %l1, %o0
loop_1546:
	tneg	%icc,	0x1
	nop
	fitos	%f6,	%f1
	fstod	%f1,	%f10
loop_1547:
	nop
	fitos	%f11,	%f15
	fstox	%f15,	%f20
	fxtos	%f20,	%f11
loop_1548:
	array32	%i4,	%l0,	%o7
	nop
	setx	0x4B01218B4CB08F70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xA78DA0D0E67EBABA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f6,	%f30
	tcc	%xcc,	0x1
	tl	%xcc,	0x0
	udivcc	%i0,	0x17DF,	%l2
	edge16n	%i1,	%g2,	%i2
	smulcc	%i6,	0x05C5,	%l6
	movle	%xcc,	%o6,	%g5
	fmovrdgez	%l4,	%f10,	%f12
	fmovscc	%xcc,	%f27,	%f13
	nop
	setx	0x5D65C462,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xBDBD532C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f25,	%f7
	smulcc	%g1,	0x18C0,	%i7
	movgu	%xcc,	%o4,	%o3
	fmovsle	%icc,	%f30,	%f20
	fsrc1s	%f21,	%f13
	fsrc2s	%f5,	%f24
	tcs	%icc,	0x7
	brnz	%l3,	loop_1549
	nop
	setx	0xA0772416,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	fmovrslz	%o5,	%f11,	%f5
	ldx	[%l7 + 0x08],	%g7
loop_1549:
	udivcc	%o2,	0x18E0,	%l5
	movne	%xcc,	%o1,	%i5
	movge	%icc,	%g4,	%g3
	tge	%xcc,	0x0
	fpadd32	%f14,	%f12,	%f14
	sdivcc	%i3,	0x1864,	%g6
	xnorcc	%l1,	%i4,	%o0
	tn	%xcc,	0x2
	nop
	fitos	%f2,	%f7
	fstod	%f7,	%f8
	movleu	%xcc,	%o7,	%l0
	edge8l	%l2,	%i0,	%i1
	fmul8x16	%f17,	%f18,	%f0
	tcs	%icc,	0x5
	edge32ln	%i2,	%g2,	%i6
	fmovdcc	%icc,	%f10,	%f31
	lduw	[%l7 + 0x50],	%l6
	movgu	%icc,	%o6,	%l4
	tn	%xcc,	0x3
	movl	%xcc,	%g5,	%i7
	or	%o4,	0x1E54,	%o3
	fmovrdgez	%l3,	%f30,	%f30
	fbn,a	%fcc3,	loop_1550
	movneg	%xcc,	%o5,	%g1
	for	%f22,	%f2,	%f20
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1550:
	fmovdn	%icc,	%f28,	%f19
	bge,a	%xcc,	loop_1551
	edge32ln	%o2,	%g7,	%l5
	sir	0x14F3
	bn,pn	%icc,	loop_1552
loop_1551:
	fnegd	%f18,	%f30
	brlz	%o1,	loop_1553
	orncc	%i5,	0x1912,	%g4
loop_1552:
	ta	%xcc,	0x6
	st	%f11,	[%l7 + 0x5C]
loop_1553:
	fcmpeq16	%f24,	%f6,	%g3
	add	%i3,	0x13B6,	%g6
	set	0x24, %o1
	sta	%f3,	[%l7 + %o1] 0x80
	edge16n	%i4,	%o0,	%l1
	set	0x28, %l3
	ldxa	[%l7 + %l3] 0x18,	%o7
	fbul	%fcc1,	loop_1554
	sll	%l0,	0x16,	%l2
	edge8	%i1,	%i0,	%i2
	ldd	[%l7 + 0x70],	%g2
loop_1554:
	fxnor	%f10,	%f28,	%f20
	or	%i6,	%l6,	%l4
	mulscc	%o6,	0x07A8,	%i7
	movrlez	%g5,	%o4,	%l3
	nop
	setx	0xFF775526,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x8E2453B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f24,	%f2
	udivx	%o5,	0x0B7A,	%o3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x34] %asi,	%f15
	smul	%o2,	%g1,	%g7
	nop
	fitod	%f4,	%f26
	fdtoi	%f26,	%f22
	fnot2s	%f17,	%f8
	bvs	loop_1555
	brz,a	%l5,	loop_1556
	lduw	[%l7 + 0x68],	%i5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x20] %asi,	%g4
loop_1555:
	bvc,a	loop_1557
loop_1556:
	umul	%g3,	%i3,	%g6
	edge32l	%i4,	%o0,	%o1
	xor	%l1,	0x0C13,	%l0
loop_1557:
	call	loop_1558
	tl	%xcc,	0x1
	udivcc	%l2,	0x00AD,	%o7
	set	0x75, %i5
	ldstuba	[%l7 + %i5] 0x04,	%i0
loop_1558:
	movge	%xcc,	%i1,	%i2
	edge16	%g2,	%l6,	%l4
	array8	%o6,	%i7,	%i6
	sll	%o4,	0x13,	%l3
	array8	%g5,	%o5,	%o3
	sdivx	%g1,	0x1A05,	%o2
	umul	%l5,	%g7,	%i5
	udivx	%g4,	0x06EC,	%g3
	array8	%g6,	%i3,	%i4
	movvc	%icc,	%o0,	%l1
	sllx	%o1,	0x13,	%l2
	tl	%icc,	0x4
	sdivcc	%l0,	0x165B,	%o7
	bneg,pn	%icc,	loop_1559
	sethi	0x1B67,	%i0
	fbg	%fcc3,	loop_1560
	tpos	%xcc,	0x2
loop_1559:
	fmovsa	%icc,	%f11,	%f2
	alignaddr	%i1,	%g2,	%l6
loop_1560:
	fmovscc	%icc,	%f17,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x31E79C2840423259,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	orn	%l4,	0x0F2E,	%i2
	mova	%icc,	%o6,	%i6
	bvc	loop_1561
	fmovsgu	%icc,	%f31,	%f4
	umulcc	%o4,	%l3,	%g5
	mulscc	%o5,	%o3,	%g1
loop_1561:
	fsrc2	%f2,	%f4
	movrlez	%o2,	0x1E8,	%i7
	edge32n	%g7,	%l5,	%g4
	ta	%icc,	0x0
	set	0x79, %i1
	ldsba	[%l7 + %i1] 0x0c,	%i5
	fmul8ulx16	%f8,	%f30,	%f14
	taddcctv	%g3,	%i3,	%i4
	andn	%o0,	%l1,	%o1
	sllx	%l2,	0x09,	%g6
	fbo	%fcc1,	loop_1562
	bleu,a,pn	%xcc,	loop_1563
	ta	%xcc,	0x5
	bgu	%xcc,	loop_1564
loop_1562:
	movre	%l0,	%i0,	%o7
loop_1563:
	fbg	%fcc1,	loop_1565
	edge8ln	%g2,	%l6,	%i1
loop_1564:
	bneg,pt	%icc,	loop_1566
	bn,a,pt	%icc,	loop_1567
loop_1565:
	ldd	[%l7 + 0x28],	%f8
	or	%i2,	0x1BAD,	%o6
loop_1566:
	movvc	%xcc,	%l4,	%i6
loop_1567:
	tgu	%icc,	0x1
	fexpand	%f6,	%f26
	movrgz	%o4,	%l3,	%o5
	tl	%xcc,	0x5
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x60] %asi,	%o3
	stbar
	tge	%icc,	0x1
	ldsw	[%l7 + 0x58],	%g1
	fmovrsne	%g5,	%f14,	%f19
	or	%o2,	0x1913,	%g7
	ldstub	[%l7 + 0x7C],	%i7
	array16	%g4,	%l5,	%g3
	fbug	%fcc1,	loop_1568
	movrlez	%i5,	0x128,	%i4
	nop
	setx	0x93CB8F076B83CFC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB8061AD60229EE60,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f10,	%f22
	fbe,a	%fcc0,	loop_1569
loop_1568:
	movle	%xcc,	%i3,	%l1
	bg	loop_1570
	fnot1	%f6,	%f10
loop_1569:
	bneg,a	%icc,	loop_1571
	move	%xcc,	%o0,	%o1
loop_1570:
	tneg	%xcc,	0x4
	tn	%icc,	0x2
loop_1571:
	fpack32	%f28,	%f14,	%f16
	fbule,a	%fcc2,	loop_1572
	fornot1	%f24,	%f26,	%f30
	bge,pn	%xcc,	loop_1573
	nop
	setx	loop_1574,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1572:
	xnorcc	%l2,	0x118D,	%g6
	addccc	%i0,	%l0,	%g2
loop_1573:
	flush	%l7 + 0x70
loop_1574:
	movneg	%icc,	%l6,	%i1
	edge16n	%i2,	%o7,	%l4
	srax	%o6,	0x19,	%i6
	fnegs	%f17,	%f24
	udiv	%o4,	0x07D1,	%o5
	addccc	%l3,	0x182C,	%g1
	fmuld8ulx16	%f16,	%f5,	%f28
	movrne	%o3,	0x1F0,	%g5
	movleu	%xcc,	%o2,	%i7
	xor	%g4,	0x12B4,	%g7
	tpos	%xcc,	0x1
	std	%f4,	[%l7 + 0x48]
	tsubcctv	%g3,	%l5,	%i4
	set	0x6E, %g5
	ldstuba	[%l7 + %g5] 0x88,	%i3
	movrgez	%i5,	0x2D3,	%o0
	sll	%l1,	0x09,	%l2
	edge16ln	%g6,	%o1,	%l0
	sdivx	%i0,	0x17CB,	%g2
	tne	%icc,	0x1
	fmovrdgz	%l6,	%f6,	%f16
	nop
	setx	0x3B048AE3194BE949,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x83E3A436BEAC79DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f0,	%f30
	nop
	fitod	%f10,	%f2
	fdtos	%f2,	%f7
	ldub	[%l7 + 0x29],	%i2
	movcc	%xcc,	%i1,	%l4
	edge8n	%o6,	%o7,	%i6
	xorcc	%o5,	0x0168,	%o4
	movre	%l3,	0x0B3,	%g1
	std	%f26,	[%l7 + 0x68]
	fbule,a	%fcc1,	loop_1575
	fbg	%fcc2,	loop_1576
	fornot2	%f16,	%f22,	%f26
	lduw	[%l7 + 0x40],	%o3
loop_1575:
	alignaddrl	%o2,	%g5,	%i7
loop_1576:
	smulcc	%g7,	0x01DE,	%g4
	fcmple32	%f26,	%f6,	%g3
	tcs	%icc,	0x4
	edge16ln	%l5,	%i4,	%i5
	fbu	%fcc0,	loop_1577
	membar	0x28
	ble	%xcc,	loop_1578
	fmul8x16	%f0,	%f20,	%f14
loop_1577:
	bleu,pn	%icc,	loop_1579
	movpos	%xcc,	%i3,	%o0
loop_1578:
	fmuld8sux16	%f31,	%f30,	%f2
	fmovsgu	%xcc,	%f15,	%f1
loop_1579:
	flush	%l7 + 0x10
	fzero	%f18
	brlez,a	%l2,	loop_1580
	tleu	%xcc,	0x3
	add	%g6,	%o1,	%l0
	sdivx	%l1,	0x12DE,	%i0
loop_1580:
	tg	%xcc,	0x2
	stx	%g2,	[%l7 + 0x48]
	fbg	%fcc2,	loop_1581
	ldsw	[%l7 + 0x6C],	%l6
	bvs	loop_1582
	fmovsgu	%icc,	%f24,	%f0
loop_1581:
	mulx	%i2,	0x0C16,	%i1
	fbul,a	%fcc3,	loop_1583
loop_1582:
	bvc	loop_1584
	tl	%icc,	0x6
	movneg	%icc,	%l4,	%o6
loop_1583:
	tcs	%icc,	0x5
loop_1584:
	fmovdge	%icc,	%f17,	%f25
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%o7,	%o5
	fnands	%f8,	%f19,	%f21
	edge16	%i6,	%o4,	%g1
	fmovrdlz	%l3,	%f14,	%f30
	fbule	%fcc1,	loop_1585
	sub	%o2,	%g5,	%o3
	movpos	%xcc,	%i7,	%g4
	srlx	%g3,	0x13,	%g7
loop_1585:
	fxor	%f20,	%f18,	%f0
	sdivx	%l5,	0x0411,	%i5
	fpadd16s	%f13,	%f1,	%f14
	fmovrdgez	%i4,	%f30,	%f14
	membar	0x5F
	movl	%icc,	%o0,	%l2
	fornot1s	%f9,	%f5,	%f21
	set	0x24, %i6
	ldsba	[%l7 + %i6] 0x15,	%i3
	movre	%o1,	%l0,	%g6
	sra	%i0,	0x1B,	%g2
	ldsh	[%l7 + 0x18],	%l6
	array32	%i2,	%i1,	%l4
	udivcc	%o6,	0x0C98,	%l1
	tn	%xcc,	0x0
	move	%icc,	%o7,	%i6
	fmovdn	%xcc,	%f25,	%f1
	edge16	%o4,	%o5,	%g1
	edge32ln	%o2,	%g5,	%l3
	tgu	%icc,	0x3
	fblg,a	%fcc2,	loop_1586
	tpos	%icc,	0x0
	sir	0x1F7F
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%i7
loop_1586:
	nop
	set	0x78, %g1
	ldstuba	[%l7 + %g1] 0x04,	%o3
	alignaddr	%g4,	%g7,	%g3
	bvs,a,pt	%icc,	loop_1587
	fcmpeq16	%f12,	%f20,	%l5
	array16	%i5,	%i4,	%o0
	smulcc	%l2,	%o1,	%i3
loop_1587:
	fbne,a	%fcc1,	loop_1588
	sethi	0x0837,	%l0
	tg	%icc,	0x4
	brgez	%g6,	loop_1589
loop_1588:
	nop
	setx	loop_1590,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdge	%xcc,	%f3,	%f7
	orncc	%i0,	0x1E51,	%l6
loop_1589:
	movrne	%i2,	%g2,	%i1
loop_1590:
	mulx	%o6,	%l4,	%l1
	stb	%o7,	[%l7 + 0x17]
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f20
	fmovrslez	%i6,	%f9,	%f0
	nop
	setx	0x693A9A7F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x5BAEC6BD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f14,	%f18
	fmovsgu	%xcc,	%f9,	%f25
	fornot1	%f0,	%f30,	%f0
	orcc	%o4,	0x10FF,	%g1
	nop
	setx	loop_1591,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tpos	%icc,	0x3
	ldub	[%l7 + 0x0D],	%o2
	std	%f28,	[%l7 + 0x40]
loop_1591:
	fmovsvc	%xcc,	%f31,	%f2
	movle	%xcc,	%o5,	%l3
	brz	%i7,	loop_1592
	fmovdne	%xcc,	%f22,	%f16
	movrgz	%g5,	%g4,	%o3
	srax	%g3,	0x0E,	%g7
loop_1592:
	fand	%f2,	%f20,	%f16
	movge	%icc,	%l5,	%i5
	bvc,pn	%icc,	loop_1593
	subc	%o0,	0x14F4,	%l2
	fors	%f28,	%f31,	%f8
	bcc,a	%icc,	loop_1594
loop_1593:
	fmovdcs	%xcc,	%f16,	%f14
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
	nop
	fitod	%f0,	%f4
	fdtos	%f4,	%f30
loop_1594:
	orn	%o1,	0x08A3,	%i4
	fmovdne	%icc,	%f12,	%f14
loop_1595:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sllx	%i3,	0x06,	%l0
	fbne	%fcc1,	loop_1596
	movvs	%xcc,	%g6,	%i0
	array8	%i2,	%g2,	%l6
	fbe,a	%fcc1,	loop_1597
loop_1596:
	ldub	[%l7 + 0x7C],	%i1
	sethi	0x1404,	%l4
	movcs	%xcc,	%o6,	%l1
loop_1597:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	srax	%i6,	%o7,	%g1
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x88
	ta	%xcc,	0x4
	tne	%xcc,	0x2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%o4,	%o5
	nop
	setx	0xF2D4E82F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xF852BD2A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f3,	%f1
	sdiv	%o2,	0x073C,	%i7
	wr	%g0,	0x2a,	%asi
	stxa	%l3,	[%l7 + 0x20] %asi
	membar	#Sync
	set	0x2C, %i2
	sta	%f22,	[%l7 + %i2] 0x19
	brgez	%g5,	loop_1598
	tneg	%xcc,	0x4
	brlz	%g4,	loop_1599
	brnz,a	%g3,	loop_1600
loop_1598:
	movvs	%icc,	%o3,	%g7
	nop
	setx	0xFB3A8C3ABE4127F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x082F596ACFCEFD53,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f20,	%f16
loop_1599:
	fmul8ulx16	%f24,	%f2,	%f2
loop_1600:
	xnor	%l5,	%i5,	%o0
	nop
	fitos	%f3,	%f14
	fstoi	%f14,	%f8
	tne	%xcc,	0x4
	sdivx	%l2,	0x1301,	%i4
	fcmpgt16	%f22,	%f24,	%i3
	edge32n	%o1,	%g6,	%i0
	addccc	%i2,	0x1575,	%l0
	fnand	%f0,	%f24,	%f8
	umul	%l6,	0x1C2E,	%i1
	srlx	%g2,	%o6,	%l1
	andn	%l4,	%o7,	%g1
	nop
	set	0x5F, %i3
	ldstub	[%l7 + %i3],	%i6
	ld	[%l7 + 0x44],	%f8
	nop
	setx	0x01347757,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xB0382ADB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f3,	%f12
	edge16n	%o5,	%o4,	%i7
	sdiv	%l3,	0x0DEA,	%g5
	tne	%xcc,	0x0
	bvs,a,pt	%xcc,	loop_1601
	fsrc2s	%f6,	%f18
	fbe,a	%fcc1,	loop_1602
	or	%o2,	%g3,	%g4
loop_1601:
	nop
	fitos	%f0,	%f2
	fstod	%f2,	%f2
	lduw	[%l7 + 0x4C],	%g7
loop_1602:
	fmuld8ulx16	%f10,	%f10,	%f18
	std	%f20,	[%l7 + 0x60]
	edge8l	%l5,	%i5,	%o3
	udiv	%l2,	0x0A87,	%i4
	bpos,pt	%icc,	loop_1603
	fmovsge	%icc,	%f1,	%f13
	taddcctv	%o0,	%o1,	%g6
	tne	%icc,	0x4
loop_1603:
	nop
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x20] %asi,	%i0
	fmovrse	%i2,	%f10,	%f13
	bleu,pt	%xcc,	loop_1604
	stbar
	addc	%l0,	%i3,	%i1
	bl,a,pn	%icc,	loop_1605
loop_1604:
	sdiv	%g2,	0x1F48,	%o6
	sethi	0x123C,	%l6
	tleu	%xcc,	0x1
loop_1605:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x41] %asi,	%l4
	addccc	%o7,	0x1DF6,	%g1
	sra	%i6,	%o5,	%o4
	tl	%icc,	0x7
	srl	%l1,	0x0B,	%l3
	addc	%g5,	0x19AD,	%o2
	movn	%xcc,	%i7,	%g3
	sllx	%g7,	%l5,	%i5
	fmul8x16au	%f14,	%f8,	%f10
	fcmpeq16	%f12,	%f30,	%g4
	xor	%o3,	0x18AC,	%l2
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x18,	%f16
	fpadd32s	%f1,	%f5,	%f22
	subc	%o0,	%o1,	%i4
	subc	%i0,	%i2,	%l0
	edge32ln	%g6,	%i3,	%g2
	fmovsvc	%xcc,	%f9,	%f30
	bcc,pt	%xcc,	loop_1606
	tvc	%xcc,	0x7
	fmovda	%icc,	%f26,	%f6
	addc	%o6,	0x0E46,	%l6
loop_1606:
	membar	0x63
	brgez,a	%l4,	loop_1607
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i1,	%o7,	%g1
	smul	%i6,	0x0D18,	%o5
loop_1607:
	nop
	fitos	%f17,	%f27
	fcmpeq16	%f12,	%f20,	%l1
	fbuge,a	%fcc3,	loop_1608
	edge32n	%o4,	%l3,	%g5
	srax	%i7,	0x0A,	%o2
	addc	%g3,	0x10E5,	%l5
loop_1608:
	subccc	%g7,	0x19F8,	%g4
	movneg	%icc,	%o3,	%l2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	fsrc2s	%f23,	%f29
	edge16l	%o1,	%i4,	%i5
	fbuge,a	%fcc3,	loop_1609
	fmovdvs	%icc,	%f10,	%f22
	te	%icc,	0x6
	fandnot2s	%f1,	%f10,	%f17
loop_1609:
	fcmple32	%f6,	%f12,	%i2
	tvc	%icc,	0x1
	array32	%l0,	%g6,	%i3
	fnot2	%f20,	%f28
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x54] %asi,	%g2
	fmovrdlez	%o6,	%f6,	%f22
	fbge,a	%fcc3,	loop_1610
	xnor	%i0,	%l4,	%l6
	call	loop_1611
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1610:
	bn,pn	%icc,	loop_1612
	brz	%i1,	loop_1613
loop_1611:
	array16	%g1,	%i6,	%o5
	movrlz	%o7,	0x0B7,	%l1
loop_1612:
	fpadd32s	%f25,	%f29,	%f21
loop_1613:
	movle	%icc,	%l3,	%o4
	fornot1	%f2,	%f28,	%f4
	fandnot1	%f6,	%f18,	%f18
	array16	%i7,	%g5,	%o2
	ldd	[%l7 + 0x08],	%f30
	edge16ln	%g3,	%g7,	%l5
	fxor	%f6,	%f22,	%f18
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
	fmovsne	%xcc,	%f11,	%f22
	tgu	%icc,	0x6
	fmovrsgz	%g4,	%f17,	%f4
	set	0x14, %i0
	ldsha	[%l7 + %i0] 0x88,	%l2
	tvc	%xcc,	0x1
	and	%o1,	0x13F4,	%o0
	fpack32	%f4,	%f14,	%f22
	fabss	%f13,	%f10
	movneg	%xcc,	%i4,	%i2
	sir	0x1FB9
	subccc	%i5,	0x1FB6,	%l0
	ldx	[%l7 + 0x20],	%g6
	nop
	fitos	%f30,	%f2
	edge32	%g2,	%o6,	%i3
	set	0x38, %i4
	prefetcha	[%l7 + %i4] 0x0c,	 0x0
	sllx	%i0,	%l6,	%i1
	fnot1s	%f25,	%f31
	movpos	%icc,	%i6,	%g1
	orncc	%o7,	0x1BF3,	%l1
	fmovsgu	%icc,	%f26,	%f4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x18] %asi,	%l3
	tl	%icc,	0x1
	tne	%icc,	0x7
	nop
	setx	0x1D07F31FC040C932,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	movn	%xcc,	%o5,	%i7
	fmovrse	%o4,	%f4,	%f31
	ta	%xcc,	0x3
	bshuffle	%f28,	%f26,	%f0
	bpos,a	%icc,	loop_1614
	andn	%g5,	%g3,	%o2
	swap	[%l7 + 0x24],	%g7
	or	%l5,	%g4,	%l2
loop_1614:
	edge16ln	%o1,	%o3,	%i4
	edge32	%i2,	%i5,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%g2
	movge	%icc,	%o6,	%g6
	subcc	%i3,	0x1FD3,	%l4
	tvc	%icc,	0x3
	movvc	%icc,	%i0,	%l6
	movre	%i1,	0x0A1,	%i6
	set	0x68, %g6
	ldxa	[%l7 + %g6] 0x0c,	%o7
	be,pn	%xcc,	loop_1615
	alignaddrl	%g1,	%l3,	%o5
	sllx	%i7,	%o4,	%l1
	alignaddrl	%g3,	%o2,	%g5
loop_1615:
	edge32ln	%l5,	%g7,	%g4
	brgez	%o1,	loop_1616
	ldstub	[%l7 + 0x4D],	%o3
	std	%f24,	[%l7 + 0x78]
	fmovdneg	%icc,	%f22,	%f0
loop_1616:
	fmovde	%icc,	%f26,	%f27
	tcs	%icc,	0x1
	mulscc	%l2,	%i2,	%i4
	movcc	%icc,	%o0,	%l0
	ta	%icc,	0x0
	orn	%g2,	%o6,	%i5
	fbne	%fcc2,	loop_1617
	ldd	[%l7 + 0x60],	%f18
	fsrc2s	%f21,	%f16
	nop
	fitos	%f12,	%f21
	fstoi	%f21,	%f18
loop_1617:
	tleu	%xcc,	0x1
	ldsb	[%l7 + 0x6F],	%i3
	fsrc1	%f22,	%f10
	ldub	[%l7 + 0x31],	%l4
	bcs	loop_1618
	tneg	%xcc,	0x6
	fcmple16	%f24,	%f28,	%i0
	srlx	%g6,	0x0B,	%l6
loop_1618:
	fmovsa	%xcc,	%f7,	%f8
	fsrc1	%f28,	%f26
	tsubcctv	%i6,	0x1A61,	%i1
	edge16ln	%g1,	%o7,	%l3
	nop
	fitod	%f6,	%f16
	fdtos	%f16,	%f24
	smulcc	%o5,	0x0CDB,	%o4
	array32	%i7,	%l1,	%o2
	nop
	setx loop_1619, %l0, %l1
	jmpl %l1, %g5
	tsubcc	%l5,	%g7,	%g3
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
	movrlz	%g4,	0x17E,	%o3
loop_1619:
	ld	[%l7 + 0x78],	%f1
	movn	%icc,	%l2,	%o1
loop_1620:
	srl	%i4,	%o0,	%l0
	tl	%xcc,	0x7
	fnand	%f2,	%f24,	%f4
	edge16ln	%i2,	%g2,	%o6
	movleu	%xcc,	%i5,	%l4
	be	loop_1621
	subc	%i0,	%i3,	%l6
	andcc	%i6,	0x14A8,	%g6
	movvs	%xcc,	%g1,	%i1
loop_1621:
	fpadd32	%f22,	%f8,	%f26
	brnz,a	%l3,	loop_1622
	xnorcc	%o7,	%o5,	%o4
	fbuge	%fcc1,	loop_1623
	lduh	[%l7 + 0x26],	%i7
loop_1622:
	array8	%l1,	%g5,	%l5
	fmul8sux16	%f4,	%f10,	%f24
loop_1623:
	stw	%g7,	[%l7 + 0x48]
	edge16	%g3,	%g4,	%o2
	nop
	setx	0x298BA596,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x07207FB0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f5,	%f18
	movrne	%l2,	0x1EA,	%o3
	edge32ln	%o1,	%o0,	%l0
	fbug	%fcc0,	loop_1624
	sethi	0x1D6A,	%i4
	fbule	%fcc0,	loop_1625
	tvs	%xcc,	0x7
loop_1624:
	mulscc	%g2,	%i2,	%o6
	xor	%i5,	%l4,	%i0
loop_1625:
	ldsw	[%l7 + 0x54],	%l6
	movl	%xcc,	%i3,	%i6
	fba,a	%fcc1,	loop_1626
	prefetch	[%l7 + 0x14],	 0x1
	movrlez	%g6,	0x3EC,	%g1
	edge32ln	%l3,	%o7,	%o5
loop_1626:
	fbue,a	%fcc1,	loop_1627
	movvc	%icc,	%o4,	%i7
	set	0x2F, %o4
	stba	%l1,	[%l7 + %o4] 0x88
loop_1627:
	sethi	0x05A8,	%i1
	taddcc	%g5,	0x082A,	%g7
	brz	%l5,	loop_1628
	array16	%g3,	%o2,	%g4
	smul	%o3,	0x18C2,	%l2
	fandnot2s	%f17,	%f13,	%f15
loop_1628:
	bneg	%xcc,	loop_1629
	tvs	%icc,	0x6
	sethi	0x00BF,	%o1
	and	%o0,	%i4,	%l0
loop_1629:
	fnor	%f10,	%f6,	%f12
	fmovdge	%xcc,	%f21,	%f9
	fabss	%f31,	%f7
	sdivcc	%i2,	0x1460,	%g2
	addc	%i5,	%o6,	%l4
	fbg	%fcc0,	loop_1630
	xorcc	%l6,	%i3,	%i0
	nop
	setx loop_1631, %l0, %l1
	jmpl %l1, %g6
	fnot2s	%f27,	%f29
loop_1630:
	tpos	%icc,	0x4
	udivx	%g1,	0x0EE2,	%l3
loop_1631:
	te	%icc,	0x6
	sth	%o7,	[%l7 + 0x32]
	set	0x70, %l4
	ldxa	[%l7 + %l4] 0x14,	%o5
	movrne	%o4,	0x1FD,	%i6
	tcc	%icc,	0x0
	sub	%l1,	%i7,	%i1
	bshuffle	%f0,	%f4,	%f10
	add	%g5,	%l5,	%g7
	fba,a	%fcc3,	loop_1632
	brnz,a	%o2,	loop_1633
	sethi	0x13D0,	%g3
	fnot2	%f10,	%f6
loop_1632:
	movge	%icc,	%o3,	%l2
loop_1633:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8l	%o1,	%o0,	%g4
	swap	[%l7 + 0x48],	%l0
	udivcc	%i2,	0x18EC,	%i4
	andncc	%g2,	%o6,	%l4
	fmovrslz	%i5,	%f3,	%f23
	edge16ln	%i3,	%l6,	%g6
	srlx	%i0,	%l3,	%o7
	set	0x20, %o5
	swapa	[%l7 + %o5] 0x0c,	%o5
	array16	%g1,	%o4,	%l1
	alignaddrl	%i6,	%i7,	%g5
	fbe	%fcc3,	loop_1634
	andcc	%i1,	%l5,	%g7
	sdivx	%o2,	0x017D,	%g3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x16] %asi,	%l2
loop_1634:
	mova	%icc,	%o1,	%o3
	addcc	%o0,	%g4,	%l0
	movcs	%icc,	%i4,	%g2
	fbue	%fcc0,	loop_1635
	fcmpgt32	%f24,	%f18,	%i2
	tg	%icc,	0x7
	wr	%g0,	0xe3,	%asi
	stha	%l4,	[%l7 + 0x6A] %asi
	membar	#Sync
loop_1635:
	movcc	%xcc,	%i5,	%o6
	movrgez	%i3,	0x07D,	%l6
	udiv	%g6,	0x1E87,	%i0
	tneg	%xcc,	0x0
	mova	%xcc,	%l3,	%o5
	movne	%xcc,	%g1,	%o4
	set	0x68, %l5
	ldsba	[%l7 + %l5] 0x15,	%l1
	sdivx	%i6,	0x1FBE,	%o7
	movvs	%icc,	%i7,	%g5
	set	0x6F, %o6
	ldstuba	[%l7 + %o6] 0x18,	%i1
	fmovdcs	%icc,	%f25,	%f23
	xnor	%g7,	%l5,	%g3
	fnand	%f22,	%f22,	%f18
	tcc	%xcc,	0x4
	fbule,a	%fcc1,	loop_1636
	movcs	%xcc,	%o2,	%o1
	move	%icc,	%o3,	%l2
	fmul8x16	%f26,	%f10,	%f28
loop_1636:
	brnz,a	%o0,	loop_1637
	tg	%icc,	0x0
	addccc	%l0,	%g4,	%i4
	fpadd16s	%f20,	%f30,	%f3
loop_1637:
	edge16	%i2,	%l4,	%i5
	nop
	setx	loop_1638,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xorcc	%o6,	0x1120,	%g2
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x2A] %asi,	%l6
loop_1638:
	brlez	%g6,	loop_1639
	fba,a	%fcc3,	loop_1640
	fmovsne	%xcc,	%f31,	%f21
	xnorcc	%i0,	0x0055,	%l3
loop_1639:
	alignaddr	%o5,	%g1,	%i3
loop_1640:
	edge8	%l1,	%i6,	%o7
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x24] %asi,	%o4
	membar	0x18
	xnorcc	%g5,	0x073F,	%i7
	andn	%i1,	%g7,	%g3
	fpsub16	%f12,	%f8,	%f24
	tvs	%icc,	0x3
	fpack32	%f18,	%f30,	%f6
	fmovde	%xcc,	%f13,	%f29
	ldstub	[%l7 + 0x78],	%l5
	fbo,a	%fcc2,	loop_1641
	smul	%o2,	%o1,	%l2
	fpack16	%f0,	%f27
	fxors	%f25,	%f7,	%f2
loop_1641:
	tn	%xcc,	0x6
	fnegs	%f15,	%f5
	movneg	%icc,	%o0,	%l0
	fba	%fcc2,	loop_1642
	tleu	%icc,	0x3
	tle	%icc,	0x3
	xnorcc	%g4,	%o3,	%i2
loop_1642:
	movrlez	%l4,	%i5,	%i4
	brnz,a	%g2,	loop_1643
	fblg,a	%fcc1,	loop_1644
	and	%o6,	0x1831,	%l6
	bvc	loop_1645
loop_1643:
	fsrc1	%f20,	%f12
loop_1644:
	ldsh	[%l7 + 0x6A],	%g6
	movrlez	%l3,	%i0,	%g1
loop_1645:
	tpos	%icc,	0x0
	tg	%xcc,	0x3
	movcs	%icc,	%i3,	%l1
	array8	%i6,	%o5,	%o4
	mulx	%o7,	0x0F81,	%g5
	tneg	%icc,	0x5
	movrlz	%i1,	0x054,	%i7
	fabss	%f12,	%f28
	xorcc	%g3,	0x15ED,	%l5
	array16	%g7,	%o1,	%l2
	movpos	%icc,	%o0,	%o2
	edge8	%l0,	%g4,	%o3
	faligndata	%f4,	%f6,	%f0
	fsrc2	%f22,	%f20
	fcmpgt32	%f28,	%f30,	%l4
	sdivx	%i5,	0x1894,	%i4
	array8	%i2,	%g2,	%o6
	udiv	%g6,	0x0E2A,	%l3
	fmovsleu	%xcc,	%f20,	%f22
	tsubcc	%l6,	%i0,	%i3
	udiv	%l1,	0x082D,	%i6
	mulx	%o5,	0x1DB7,	%g1
	ldsb	[%l7 + 0x2D],	%o4
	edge8	%g5,	%o7,	%i1
	fbg,a	%fcc1,	loop_1646
	tvs	%icc,	0x1
	edge16ln	%i7,	%g3,	%l5
	tg	%xcc,	0x4
loop_1646:
	movle	%xcc,	%o1,	%g7
	wr	%g0,	0x80,	%asi
	stha	%l2,	[%l7 + 0x70] %asi
	bne,a,pn	%icc,	loop_1647
	fmovrslz	%o0,	%f11,	%f23
	movne	%icc,	%l0,	%o2
	be,a	%icc,	loop_1648
loop_1647:
	movre	%o3,	%l4,	%g4
	tpos	%icc,	0x5
	mulscc	%i4,	0x1880,	%i2
loop_1648:
	fbne	%fcc1,	loop_1649
	taddcc	%i5,	0x0882,	%g2
	bgu,pn	%xcc,	loop_1650
	faligndata	%f26,	%f8,	%f16
loop_1649:
	smul	%o6,	0x06F4,	%g6
	array32	%l3,	%i0,	%i3
loop_1650:
	edge16ln	%l6,	%i6,	%o5
	tpos	%xcc,	0x0
	set	0x0B, %o7
	ldstuba	[%l7 + %o7] 0x80,	%l1
	sdivx	%o4,	0x11AC,	%g1
	fbg,a	%fcc3,	loop_1651
	movrlez	%o7,	0x390,	%g5
	fmovrse	%i7,	%f19,	%f6
	movle	%icc,	%g3,	%l5
loop_1651:
	sth	%o1,	[%l7 + 0x32]
	sllx	%g7,	0x17,	%i1
	ldub	[%l7 + 0x0C],	%o0
	srlx	%l2,	0x07,	%l0
	movrgz	%o3,	%l4,	%o2
	subc	%g4,	%i4,	%i2
	fmovsn	%xcc,	%f30,	%f6
	nop
	set	0x3C, %g2
	ldsw	[%l7 + %g2],	%i5
	smulcc	%o6,	%g6,	%g2
	udivcc	%l3,	0x0941,	%i0
	subc	%l6,	0x1974,	%i3
	bneg	%icc,	loop_1652
	movg	%icc,	%o5,	%l1
	fmovdneg	%xcc,	%f8,	%f8
	nop
	fitos	%f2,	%f8
	fstox	%f8,	%f12
loop_1652:
	subcc	%o4,	0x0210,	%g1
	sethi	0x10AB,	%i6
	movvc	%icc,	%o7,	%g5
	movvs	%xcc,	%g3,	%l5
	movrlz	%i7,	0x30B,	%o1
	orncc	%g7,	%i1,	%o0
	movcc	%xcc,	%l0,	%l2
	umulcc	%l4,	%o3,	%g4
	alignaddrl	%o2,	%i2,	%i5
	srl	%o6,	0x13,	%i4
	subccc	%g6,	%l3,	%g2
	fcmpne32	%f22,	%f26,	%i0
	set	0x4C, %o3
	ldstuba	[%l7 + %o3] 0x11,	%i3
	andn	%o5,	0x1192,	%l1
	bcs,a	%icc,	loop_1653
	orcc	%l6,	%o4,	%i6
	fcmpeq32	%f4,	%f4,	%g1
	edge8n	%o7,	%g5,	%g3
loop_1653:
	subcc	%l5,	0x02DD,	%o1
	nop
	setx	0xFBF8017C59B57C45,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xE440744C70072D30,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f22,	%f16
	tl	%icc,	0x7
	alignaddr	%i7,	%g7,	%o0
	movcc	%icc,	%i1,	%l2
	addc	%l4,	0x1D8D,	%l0
	sdivcc	%o3,	0x1623,	%o2
	fpadd32s	%f3,	%f4,	%f21
	ta	%icc,	0x7
	nop
	setx	loop_1654,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tg	%xcc,	0x6
	andncc	%g4,	%i5,	%o6
	nop
	fitod	%f8,	%f4
	fdtos	%f4,	%f8
loop_1654:
	ba,a,pn	%icc,	loop_1655
	srax	%i4,	%i2,	%g6
	fmovsge	%xcc,	%f5,	%f23
	edge8	%l3,	%i0,	%g2
loop_1655:
	fmovrdne	%i3,	%f20,	%f2
	fmovdle	%xcc,	%f9,	%f21
	ldx	[%l7 + 0x18],	%l1
	edge32n	%l6,	%o4,	%o5
	movre	%g1,	%i6,	%g5
	te	%xcc,	0x2
	orcc	%o7,	%g3,	%o1
	edge16	%i7,	%l5,	%o0
	movcs	%xcc,	%i1,	%g7
	fble	%fcc2,	loop_1656
	brnz,a	%l4,	loop_1657
	brgz,a	%l0,	loop_1658
	nop
	setx	0x510447F45469DF8A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x8A94BF83E6C60193,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f0,	%f8
loop_1656:
	nop
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x48] %asi,	%l2
loop_1657:
	fcmple32	%f8,	%f26,	%o2
loop_1658:
	tleu	%icc,	0x3
	xnorcc	%o3,	0x1009,	%i5
	nop
	setx loop_1659, %l0, %l1
	jmpl %l1, %g4
	movg	%xcc,	%o6,	%i4
	prefetch	[%l7 + 0x7C],	 0x3
	sub	%g6,	0x1350,	%l3
loop_1659:
	udivcc	%i0,	0x1CFB,	%i2
	edge32ln	%g2,	%l1,	%l6
	fmovrsgz	%i3,	%f11,	%f11
	nop
	setx	0x4047B3A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	brgz	%o5,	loop_1660
	array16	%g1,	%o4,	%i6
	smulcc	%o7,	%g5,	%o1
	popc	0x1B1C,	%i7
loop_1660:
	orncc	%l5,	0x179C,	%o0
	movneg	%icc,	%g3,	%g7
	tle	%xcc,	0x3
	fmovrdlz	%i1,	%f26,	%f26
	tcs	%icc,	0x5
	movcc	%icc,	%l4,	%l2
	tleu	%icc,	0x0
	movne	%xcc,	%o2,	%o3
	move	%icc,	%l0,	%i5
	set	0x10, %g4
	stwa	%o6,	[%l7 + %g4] 0x27
	membar	#Sync
	swap	[%l7 + 0x40],	%g4
	fpack32	%f22,	%f6,	%f24
	nop
	set	0x5C, %g7
	lduw	[%l7 + %g7],	%i4
	edge32n	%g6,	%l3,	%i2
	andncc	%i0,	%g2,	%l6
	movrgez	%l1,	%i3,	%o5
	fbg	%fcc1,	loop_1661
	xnor	%g1,	0x1F5C,	%i6
	nop
	fitos	%f14,	%f30
	fstoi	%f30,	%f13
	tsubcc	%o7,	%o4,	%o1
loop_1661:
	movpos	%icc,	%i7,	%g5
	edge8	%l5,	%g3,	%o0
	sethi	0x0E02,	%g7
	edge8ln	%i1,	%l4,	%l2
	tvs	%icc,	0x2
	taddcc	%o3,	%l0,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o2,	%g4,	%o6
	movrgz	%i4,	0x0D1,	%l3
	fornot2	%f14,	%f6,	%f28
	edge16ln	%i2,	%g6,	%i0
	orncc	%l6,	0x0928,	%g2
	fmovsgu	%xcc,	%f20,	%f12
	std	%f6,	[%l7 + 0x70]
	edge8	%i3,	%l1,	%o5
	sll	%g1,	0x01,	%o7
	te	%xcc,	0x5
	fnegd	%f20,	%f2
	orncc	%i6,	%o4,	%o1
	fmovse	%xcc,	%f2,	%f13
	xor	%i7,	%l5,	%g3
	mulx	%g5,	0x0DE2,	%g7
	sra	%i1,	0x13,	%o0
	tgu	%icc,	0x3
	fornot2s	%f12,	%f14,	%f22
	fbne	%fcc3,	loop_1662
	fmovsvc	%icc,	%f14,	%f1
	xorcc	%l4,	%l2,	%l0
	nop
	setx	0xDCF77A7C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB2EA7B80,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f11,	%f21
loop_1662:
	sllx	%i5,	%o2,	%g4
	mulx	%o6,	0x1792,	%o3
	alignaddrl	%l3,	%i2,	%g6
	add	%i4,	0x013B,	%l6
	tle	%icc,	0x1
	xnor	%i0,	0x0970,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l1,	%g2
	movrlez	%g1,	0x36C,	%o7
	fbug	%fcc2,	loop_1663
	xnor	%i6,	%o5,	%o4
	orn	%i7,	%o1,	%l5
	movne	%icc,	%g3,	%g7
loop_1663:
	ldsw	[%l7 + 0x10],	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc1,	loop_1664
	srlx	%g5,	%l4,	%l2
	udiv	%l0,	0x1244,	%i5
	srax	%o2,	0x18,	%o0
loop_1664:
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
	alignaddrl	%g4,	%o3,	%o6
	fmovde	%icc,	%f22,	%f25
	tsubcc	%l3,	0x1C75,	%i2
loop_1665:
	movrgz	%g6,	0x326,	%l6
	addcc	%i4,	%i3,	%i0
	addc	%l1,	%g2,	%g1
	fmovdne	%xcc,	%f28,	%f30
	movcs	%xcc,	%i6,	%o5
	edge8n	%o7,	%o4,	%o1
	fmul8x16al	%f22,	%f21,	%f20
	fsrc2	%f12,	%f14
	fba,a	%fcc0,	loop_1666
	movn	%xcc,	%l5,	%g3
	sethi	0x1825,	%g7
	fbo,a	%fcc0,	loop_1667
loop_1666:
	nop
	fitos	%f7,	%f6
	fstod	%f6,	%f10
	movn	%xcc,	%i7,	%g5
	fba	%fcc1,	loop_1668
loop_1667:
	sllx	%i1,	0x1C,	%l4
	sdivx	%l0,	0x05AC,	%i5
	tl	%xcc,	0x7
loop_1668:
	bvs,a	%icc,	loop_1669
	smul	%o2,	%l2,	%o0
	movne	%xcc,	%o3,	%g4
	srlx	%o6,	0x1B,	%i2
loop_1669:
	sir	0x0745
	set	0x54, %l1
	stwa	%g6,	[%l7 + %l1] 0xe2
	membar	#Sync
	and	%l6,	0x17C1,	%i4
	edge16n	%l3,	%i3,	%i0
	tge	%xcc,	0x2
	nop
	setx	0xE5010D6FC39928C3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f20
	movn	%xcc,	%l1,	%g2
	andn	%i6,	%o5,	%o7
	brgez,a	%g1,	loop_1670
	edge32ln	%o1,	%l5,	%g3
	fpack32	%f12,	%f20,	%f30
	tsubcc	%g7,	%i7,	%g5
loop_1670:
	array16	%o4,	%i1,	%l0
	bvs,a	%xcc,	loop_1671
	andn	%i5,	0x00FF,	%l4
	nop
	fitos	%f1,	%f7
	fstod	%f7,	%f2
	swap	[%l7 + 0x58],	%l2
loop_1671:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o0,	%o2,	%g4
	movrne	%o6,	%o3,	%i2
	movrgez	%g6,	0x36E,	%i4
	xorcc	%l3,	0x0000,	%l6
	movgu	%icc,	%i0,	%l1
	fpsub16s	%f18,	%f2,	%f1
	orncc	%i3,	%i6,	%g2
	fmovsg	%xcc,	%f8,	%f27
	fmovdvs	%xcc,	%f2,	%f8
	alignaddr	%o5,	%o7,	%g1
	edge32l	%l5,	%o1,	%g7
	movne	%xcc,	%g3,	%g5
	nop
	setx	0xD4BAC1E693E69952,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f26
	xnor	%o4,	%i7,	%l0
	set	0x78, %i7
	stxa	%i5,	[%l7 + %i7] 0x10
	edge32l	%l4,	%l2,	%o0
	edge32ln	%i1,	%o2,	%o6
	andncc	%g4,	%o3,	%g6
	srlx	%i2,	0x1C,	%l3
	udivx	%i4,	0x0316,	%i0
	fornot1s	%f11,	%f22,	%f23
	edge8n	%l1,	%l6,	%i6
	edge8n	%g2,	%i3,	%o5
	array8	%o7,	%l5,	%g1
	tg	%xcc,	0x7
	array16	%g7,	%g3,	%g5
	tvs	%xcc,	0x0
	movrne	%o1,	0x0D2,	%i7
	andcc	%o4,	0x1917,	%l0
	nop
	fitos	%f23,	%f15
	movne	%icc,	%l4,	%l2
	tneg	%icc,	0x3
	ba,a,pt	%xcc,	loop_1672
	fbo,a	%fcc0,	loop_1673
	udivcc	%i5,	0x12BB,	%i1
	sra	%o0,	%o6,	%g4
loop_1672:
	xnor	%o3,	0x12AC,	%g6
loop_1673:
	fpsub16	%f8,	%f14,	%f8
	fabsd	%f12,	%f14
	sdivcc	%i2,	0x1BBD,	%l3
	ba,pn	%xcc,	loop_1674
	movneg	%xcc,	%i4,	%o2
	andn	%i0,	%l1,	%l6
	andncc	%i6,	%g2,	%o5
loop_1674:
	nop
	set	0x2C, %l6
	swapa	[%l7 + %l6] 0x10,	%o7
	movrgz	%l5,	%i3,	%g1
	st	%f22,	[%l7 + 0x24]
	alignaddrl	%g3,	%g7,	%g5
	movrgez	%o1,	0x0F0,	%o4
	fsrc1s	%f21,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x7
	subcc	%i7,	%l4,	%l0
	movpos	%icc,	%i5,	%i1
	fandnot2s	%f11,	%f22,	%f12
	array8	%o0,	%l2,	%o6
	subcc	%g4,	%g6,	%o3
	fmovdgu	%xcc,	%f24,	%f1
	movgu	%xcc,	%l3,	%i2
	add	%o2,	0x0084,	%i0
	wr	%g0,	0x80,	%asi
	stba	%l1,	[%l7 + 0x14] %asi
	array8	%i4,	%i6,	%g2
	movrne	%o5,	0x3B7,	%l6
	tl	%xcc,	0x5
	fmovsne	%icc,	%f11,	%f1
	sub	%o7,	0x1C3E,	%l5
	fmovrde	%i3,	%f24,	%f10
	fmovda	%xcc,	%f25,	%f2
	array32	%g1,	%g7,	%g3
	tne	%icc,	0x2
	fmovdgu	%icc,	%f29,	%f10
	movg	%icc,	%o1,	%g5
	movrgez	%o4,	0x328,	%l4
	sll	%i7,	%i5,	%l0
	array16	%o0,	%i1,	%o6
	fble,a	%fcc0,	loop_1675
	sdivx	%l2,	0x15EE,	%g6
	tl	%xcc,	0x3
	or	%o3,	%g4,	%i2
loop_1675:
	std	%f8,	[%l7 + 0x60]
	for	%f24,	%f24,	%f4
	std	%f6,	[%l7 + 0x20]
	fpadd32s	%f20,	%f23,	%f16
	sra	%o2,	0x15,	%l3
	alignaddrl	%l1,	%i4,	%i6
	tcs	%xcc,	0x1
	or	%i0,	0x1637,	%o5
	sll	%g2,	%o7,	%l6
	movg	%xcc,	%l5,	%i3
	set	0x70, %o2
	stba	%g1,	[%l7 + %o2] 0xea
	membar	#Sync
	tsubcctv	%g3,	0x05F0,	%o1
	std	%f18,	[%l7 + 0x30]
	movvc	%xcc,	%g5,	%g7
	tleu	%icc,	0x2
	movrgz	%l4,	0x195,	%i7
	sdivcc	%i5,	0x0F79,	%l0
	ldd	[%l7 + 0x48],	%o0
	movrlez	%o4,	0x160,	%o6
	movcs	%icc,	%l2,	%i1
	fmovrsgz	%g6,	%f18,	%f10
	xnorcc	%o3,	%i2,	%g4
	movn	%xcc,	%l3,	%o2
	xnorcc	%l1,	0x0297,	%i6
	nop
	fitod	%f8,	%f8
	fdtoi	%f8,	%f27
	nop
	setx	0xDE0E893B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x3215E1E4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fmuls	%f21,	%f24,	%f24
	movre	%i4,	0x38C,	%i0
	fmovrde	%g2,	%f24,	%f26
	subc	%o7,	%o5,	%l6
	sra	%i3,	0x06,	%l5
	xor	%g3,	%g1,	%o1
	nop
	fitos	%f17,	%f27
	srl	%g5,	%l4,	%g7
	nop
	fitod	%f0,	%f22
	udivx	%i7,	0x08A2,	%l0
	array32	%i5,	%o0,	%o4
	flush	%l7 + 0x60
	fbn,a	%fcc3,	loop_1676
	membar	0x54
	tcc	%xcc,	0x6
	stb	%o6,	[%l7 + 0x20]
loop_1676:
	or	%l2,	0x1887,	%i1
	nop
	setx	0xBF195297,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f8
	nop
	setx	0x02AAFFED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xA6A29434,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f30,	%f22
	move	%icc,	%g6,	%o3
	sdivx	%i2,	0x0B48,	%l3
	mulx	%o2,	0x01A2,	%g4
	bgu	%xcc,	loop_1677
	array16	%i6,	%i4,	%l1
	ldd	[%l7 + 0x50],	%g2
	fbule	%fcc2,	loop_1678
loop_1677:
	fone	%f26
	bleu,a,pt	%xcc,	loop_1679
	array32	%i0,	%o5,	%l6
loop_1678:
	sra	%o7,	%i3,	%l5
	bge,a,pt	%xcc,	loop_1680
loop_1679:
	xnorcc	%g1,	%g3,	%g5
	call	loop_1681
	mulscc	%l4,	0x1372,	%g7
loop_1680:
	fbue	%fcc0,	loop_1682
	membar	0x60
loop_1681:
	tgu	%icc,	0x7
	ldstub	[%l7 + 0x31],	%o1
loop_1682:
	fmovrslez	%l0,	%f20,	%f31
	andncc	%i5,	%i7,	%o0
	sdivx	%o4,	0x1000,	%l2
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x1C] %asi,	%i1
	movrlez	%o6,	%o3,	%i2
	ldsh	[%l7 + 0x60],	%l3
	array8	%g6,	%g4,	%o2
	edge32n	%i6,	%l1,	%i4
	smulcc	%i0,	%g2,	%o5
	umul	%l6,	%o7,	%i3
	tsubcc	%g1,	%g3,	%g5
	edge16n	%l5,	%l4,	%g7
	fpsub32	%f30,	%f2,	%f8
	andcc	%l0,	%o1,	%i7
	bne,pt	%xcc,	loop_1683
	xor	%i5,	%o4,	%l2
	taddcc	%o0,	%o6,	%i1
	tsubcctv	%o3,	0x1346,	%l3
loop_1683:
	membar	0x4E
	movle	%icc,	%i2,	%g4
	edge32ln	%o2,	%i6,	%l1
	nop
	setx	0xE47B40A2D7FFFFD9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f16
	ta	%icc,	0x3
	fmovsg	%icc,	%f13,	%f2
	movrlez	%g6,	%i0,	%g2
	tsubcc	%i4,	0x07A5,	%l6
	andcc	%o5,	%i3,	%g1
	edge16n	%o7,	%g3,	%g5
	fbuge,a	%fcc2,	loop_1684
	stw	%l5,	[%l7 + 0x68]
	tsubcctv	%l4,	%g7,	%o1
	bneg,a	loop_1685
loop_1684:
	fandnot2	%f20,	%f6,	%f28
	fbne,a	%fcc0,	loop_1686
	brgz,a	%i7,	loop_1687
loop_1685:
	fcmple32	%f20,	%f4,	%l0
	array8	%i5,	%l2,	%o4
loop_1686:
	movneg	%xcc,	%o0,	%i1
loop_1687:
	fcmple32	%f18,	%f16,	%o6
	pdist	%f12,	%f22,	%f22
	fbge	%fcc3,	loop_1688
	fcmpgt32	%f24,	%f20,	%l3
	movle	%icc,	%o3,	%g4
	movn	%xcc,	%o2,	%i6
loop_1688:
	tcs	%icc,	0x0
	fmovsleu	%xcc,	%f16,	%f15
	edge32l	%i2,	%l1,	%i0
	taddcctv	%g2,	0x1888,	%g6
	movre	%l6,	0x202,	%o5
	movre	%i3,	%g1,	%i4
	edge16n	%g3,	%g5,	%o7
	mova	%icc,	%l4,	%l5
	array32	%o1,	%g7,	%i7
	sdivcc	%i5,	0x02A2,	%l2
	tle	%icc,	0x5
	set	0x60, %l2
	ldsha	[%l7 + %l2] 0x0c,	%l0
	array8	%o0,	%i1,	%o4
	fmovdl	%xcc,	%f6,	%f18
	sdivcc	%o6,	0x1906,	%l3
	set	0x12, %o1
	ldsba	[%l7 + %o1] 0x15,	%g4
	tgu	%xcc,	0x0
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f22
	fxtod	%f22,	%f2
	smulcc	%o2,	0x05A8,	%o3
	fmovrse	%i6,	%f29,	%f7
	bpos,pt	%xcc,	loop_1689
	stb	%l1,	[%l7 + 0x48]
	fbl,a	%fcc2,	loop_1690
	fmovdpos	%icc,	%f14,	%f23
loop_1689:
	smulcc	%i0,	%g2,	%i2
	tpos	%icc,	0x1
loop_1690:
	umul	%l6,	%g6,	%o5
	movg	%icc,	%g1,	%i3
	fmovd	%f12,	%f2
	edge16ln	%i4,	%g5,	%g3
	stbar
	orncc	%l4,	%l5,	%o7
	fmovdne	%icc,	%f4,	%f15
	fmovsa	%icc,	%f14,	%f14
	srlx	%g7,	%i7,	%o1
	movrgz	%i5,	%l0,	%o0
	set	0x0F, %g3
	stba	%l2,	[%l7 + %g3] 0x19
	fmovsl	%icc,	%f17,	%f29
	tl	%icc,	0x2
	bneg,pt	%xcc,	loop_1691
	brnz	%i1,	loop_1692
	sdivcc	%o6,	0x0C02,	%o4
	fmovrsne	%g4,	%f31,	%f19
loop_1691:
	nop
	setx	0xF86FA381E11F5D6B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x5042B8E6E1A3CF91,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f0,	%f6
loop_1692:
	array16	%l3,	%o2,	%i6
	tcc	%icc,	0x5
	fbug	%fcc3,	loop_1693
	sdiv	%o3,	0x16F3,	%i0
	umulcc	%l1,	%i2,	%l6
	fnot2	%f12,	%f28
loop_1693:
	srl	%g6,	%g2,	%o5
	nop
	setx loop_1694, %l0, %l1
	jmpl %l1, %i3
	tpos	%xcc,	0x6
	orncc	%i4,	%g5,	%g3
	smul	%l4,	%g1,	%l5
loop_1694:
	nop
	fitod	%f14,	%f26
	fmovrsgez	%o7,	%f3,	%f4
	fmovscc	%icc,	%f16,	%f8
	tgu	%icc,	0x5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x50] %asi,	%i7
	smulcc	%i5,	%o1,	%l0
	movn	%icc,	%o0,	%i1
	srlx	%o6,	%o4,	%g4
	fone	%f18
	mova	%xcc,	%l2,	%o2
	call	loop_1695
	taddcctv	%i6,	%l3,	%i0
	tle	%xcc,	0x3
	set	0x4A, %i1
	lduha	[%l7 + %i1] 0x14,	%o3
loop_1695:
	tvs	%icc,	0x2
	movl	%xcc,	%l1,	%l6
	brlz,a	%g6,	loop_1696
	edge16n	%g2,	%o5,	%i2
	fmovsne	%icc,	%f20,	%f18
	movrlz	%i3,	0x3C4,	%g5
loop_1696:
	nop
	set	0x60, %g5
	sta	%f24,	[%l7 + %g5] 0x11
	udivcc	%i4,	0x09DF,	%l4
	add	%g3,	%g1,	%g7
	ldsh	[%l7 + 0x4C],	%o7
	nop
	setx	loop_1697,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%xcc,	%i7,	%l5
	add	%i5,	%l0,	%o0
	array16	%i1,	%o6,	%o4
loop_1697:
	nop
	wr	%g0,	0x80,	%asi
	stxa	%g4,	[%l7 + 0x38] %asi
	sra	%l2,	0x0A,	%o1
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f4
	nop
	fitos	%f14,	%f23
	fstox	%f23,	%f20
	fxtos	%f20,	%f30
	fnegd	%f20,	%f18
	tge	%icc,	0x1
	addccc	%i6,	%l3,	%o2
	brgez,a	%i0,	loop_1698
	taddcctv	%l1,	%o3,	%g6
	xnorcc	%g2,	0x0C8B,	%o5
	fpack16	%f4,	%f12
loop_1698:
	call	loop_1699
	edge32n	%l6,	%i3,	%g5
	ta	%icc,	0x4
	fzero	%f0
loop_1699:
	sethi	0x0144,	%i2
	nop
	setx	0xDCE51CEDF61A8245,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xF5A331754E137626,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f0,	%f18
	edge8n	%l4,	%i4,	%g1
	ldstub	[%l7 + 0x67],	%g7
	fmovsleu	%xcc,	%f23,	%f16
	for	%f10,	%f6,	%f16
	umul	%g3,	%i7,	%l5
	tleu	%xcc,	0x2
	sir	0x1841
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f29,	%f17
	umul	%o7,	%l0,	%o0
	nop
	set	0x5B, %l3
	stb	%i5,	[%l7 + %l3]
	prefetch	[%l7 + 0x14],	 0x0
	std	%f14,	[%l7 + 0x28]
	fmovdgu	%xcc,	%f16,	%f26
	mulscc	%i1,	0x0520,	%o4
	sdivcc	%o6,	0x1204,	%g4
	andcc	%o1,	0x1E61,	%l2
	sll	%l3,	0x00,	%i6
	fbul	%fcc2,	loop_1700
	umulcc	%i0,	%o2,	%l1
	set	0x3E, %g1
	ldstuba	[%l7 + %g1] 0x89,	%g6
loop_1700:
	movg	%icc,	%g2,	%o3
	fbule	%fcc3,	loop_1701
	edge8	%o5,	%l6,	%i3
	tpos	%xcc,	0x4
	mulscc	%g5,	0x0742,	%i2
loop_1701:
	nop
	set	0x08, %l0
	swapa	[%l7 + %l0] 0x80,	%i4
	movn	%xcc,	%l4,	%g7
	sdivx	%g3,	0x0C55,	%i7
	stbar
	fcmpeq32	%f22,	%f14,	%l5
	fmovrdlez	%g1,	%f12,	%f22
	fba	%fcc2,	loop_1702
	fbug	%fcc3,	loop_1703
	taddcc	%l0,	0x1CBD,	%o7
	edge8	%o0,	%i1,	%o4
loop_1702:
	and	%i5,	0x1E80,	%g4
loop_1703:
	fones	%f30
	edge8	%o6,	%l2,	%l3
	addccc	%o1,	0x042E,	%i6
	brgz,a	%o2,	loop_1704
	udiv	%i0,	0x0A07,	%l1
	tsubcctv	%g6,	0x070F,	%o3
	smul	%g2,	0x15DF,	%o5
loop_1704:
	movgu	%xcc,	%i3,	%l6
	and	%g5,	0x09BA,	%i2
	fmovdpos	%xcc,	%f26,	%f29
	tge	%icc,	0x0
	bvs,pn	%xcc,	loop_1705
	movre	%i4,	%g7,	%l4
	fones	%f22
	fmovsl	%icc,	%f7,	%f23
loop_1705:
	nop
	fitos	%f8,	%f25
	fstoi	%f25,	%f13
	orncc	%g3,	0x14D2,	%l5
	nop
	fitos	%f12,	%f2
	fstod	%f2,	%f12
	edge32n	%g1,	%i7,	%l0
	set	0x78, %i2
	stwa	%o0,	[%l7 + %i2] 0xe2
	membar	#Sync
	movrne	%o7,	%o4,	%i5
	fornot1s	%f17,	%f12,	%f12
	ldsw	[%l7 + 0x38],	%i1
	movrlz	%g4,	0x0A1,	%l2
	sdiv	%l3,	0x06E8,	%o6
	edge16ln	%i6,	%o2,	%o1
	movle	%icc,	%i0,	%l1
	sdivcc	%o3,	0x118B,	%g2
	movg	%icc,	%g6,	%o5
	swap	[%l7 + 0x34],	%l6
	nop
	fitod	%f10,	%f0
	fdtoi	%f0,	%f12
	te	%icc,	0x3
	tvs	%icc,	0x5
	srlx	%g5,	%i2,	%i4
	tvs	%icc,	0x5
	fmovspos	%xcc,	%f24,	%f19
	edge32n	%i3,	%g7,	%l4
	movgu	%xcc,	%g3,	%l5
	alignaddr	%i7,	%g1,	%o0
	fmovscc	%xcc,	%f5,	%f12
	fnot2s	%f3,	%f26
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f6
	nop
	fitos	%f3,	%f19
	fstox	%f19,	%f8
	fpsub16	%f22,	%f6,	%f6
	tcc	%xcc,	0x1
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f8
	movgu	%xcc,	%o7,	%l0
	edge32l	%i5,	%i1,	%g4
	movgu	%xcc,	%o4,	%l2
	fornot1	%f20,	%f16,	%f2
	fmovdn	%xcc,	%f24,	%f2
	ldd	[%l7 + 0x40],	%f16
	tneg	%xcc,	0x7
	ta	%icc,	0x4
	orn	%o6,	%l3,	%i6
	srax	%o2,	%i0,	%l1
	stb	%o1,	[%l7 + 0x43]
	movge	%icc,	%o3,	%g2
	edge8l	%o5,	%l6,	%g6
	tneg	%icc,	0x2
	nop
	setx loop_1706, %l0, %l1
	jmpl %l1, %g5
	brz	%i2,	loop_1707
	edge32ln	%i3,	%g7,	%l4
	andcc	%i4,	%l5,	%i7
loop_1706:
	array16	%g1,	%o0,	%o7
loop_1707:
	edge8n	%l0,	%g3,	%i1
	fmovdcc	%xcc,	%f30,	%f29
	udivcc	%g4,	0x194B,	%o4
	brlz,a	%i5,	loop_1708
	movrgz	%o6,	%l2,	%l3
	sir	0x1E54
	set	0x5E, %i6
	stha	%o2,	[%l7 + %i6] 0x27
	membar	#Sync
loop_1708:
	edge32	%i6,	%l1,	%i0
	te	%icc,	0x6
	udivcc	%o3,	0x0EE9,	%o1
	tleu	%icc,	0x0
	andn	%g2,	0x091D,	%o5
	fbo,a	%fcc1,	loop_1709
	call	loop_1710
	orn	%l6,	%g6,	%g5
	movge	%icc,	%i3,	%g7
loop_1709:
	subcc	%i2,	0x10B8,	%l4
loop_1710:
	movvc	%icc,	%i4,	%i7
	bvc	%xcc,	loop_1711
	sir	0x16B5
	addccc	%g1,	%o0,	%o7
	movn	%icc,	%l0,	%g3
loop_1711:
	ldx	[%l7 + 0x20],	%i1
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%l5
	tvc	%xcc,	0x2
	set	0x38, %o0
	lda	[%l7 + %o0] 0x89,	%f9
	movrgez	%g4,	0x3E6,	%o4
	fmovrdgez	%i5,	%f2,	%f26
	ldstub	[%l7 + 0x5D],	%o6
	subcc	%l2,	%o2,	%i6
	tle	%xcc,	0x5
	bgu,a	%xcc,	loop_1712
	addccc	%l1,	%l3,	%i0
	fbl,a	%fcc0,	loop_1713
	movrlz	%o3,	0x176,	%o1
loop_1712:
	edge8l	%g2,	%l6,	%g6
	movleu	%icc,	%g5,	%o5
loop_1713:
	movrgz	%g7,	%i2,	%l4
	addc	%i4,	0x0B30,	%i3
	xnorcc	%i7,	%g1,	%o7
	bgu,pn	%icc,	loop_1714
	fmovsle	%xcc,	%f28,	%f28
	movcc	%xcc,	%l0,	%o0
	alignaddrl	%i1,	%g3,	%g4
loop_1714:
	fbge	%fcc3,	loop_1715
	brgz	%l5,	loop_1716
	bgu,a,pn	%xcc,	loop_1717
	fbug,a	%fcc3,	loop_1718
loop_1715:
	movge	%icc,	%i5,	%o4
loop_1716:
	nop
	setx	0x8F9D6B71704E6B4D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
loop_1717:
	nop
	setx	loop_1719,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1718:
	tle	%xcc,	0x0
	addcc	%l2,	0x02B4,	%o6
	sdivcc	%i6,	0x044C,	%o2
loop_1719:
	xorcc	%l1,	0x089E,	%l3
	tg	%icc,	0x4
	udivcc	%i0,	0x1EEC,	%o1
	edge16l	%g2,	%o3,	%l6
	stbar
	fpadd16	%f28,	%f2,	%f30
	array32	%g5,	%o5,	%g7
	fbuge	%fcc1,	loop_1720
	movvs	%xcc,	%g6,	%l4
	subcc	%i4,	0x1740,	%i3
	fbl,a	%fcc2,	loop_1721
loop_1720:
	fbue	%fcc3,	loop_1722
	umulcc	%i2,	%i7,	%g1
	fbule,a	%fcc1,	loop_1723
loop_1721:
	brnz	%l0,	loop_1724
loop_1722:
	nop
	setx	0xB064A554,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	fnands	%f5,	%f18,	%f7
loop_1723:
	std	%f6,	[%l7 + 0x38]
loop_1724:
	fmovrdgz	%o7,	%f20,	%f2
	addc	%i1,	0x02EA,	%o0
	fpadd32s	%f10,	%f28,	%f8
	brz,a	%g3,	loop_1725
	movrlz	%l5,	0x0D5,	%i5
	array16	%g4,	%o4,	%l2
	stbar
loop_1725:
	movpos	%icc,	%i6,	%o2
	brnz,a	%o6,	loop_1726
	st	%f17,	[%l7 + 0x78]
	ta	%xcc,	0x3
	umulcc	%l1,	%i0,	%o1
loop_1726:
	tn	%icc,	0x2
	lduw	[%l7 + 0x5C],	%l3
	std	%f20,	[%l7 + 0x38]
	nop
	setx	0xD336306AF10099A0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x2C3667E45729901F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f0,	%f16
	nop
	setx	loop_1727,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fand	%f20,	%f22,	%f0
	tsubcctv	%o3,	0x09BD,	%g2
	udiv	%l6,	0x067E,	%o5
loop_1727:
	fnors	%f31,	%f15,	%f20
	tge	%icc,	0x4
	fcmpeq16	%f8,	%f24,	%g5
	movneg	%xcc,	%g7,	%g6
	fmovdleu	%xcc,	%f22,	%f10
	movneg	%icc,	%l4,	%i4
	fmul8ulx16	%f20,	%f2,	%f16
	xnorcc	%i2,	%i7,	%g1
	move	%icc,	%i3,	%l0
	edge16	%o7,	%o0,	%g3
	array16	%i1,	%i5,	%l5
	nop
	setx	0x538B2B73,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xD0E7D6EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f3,	%f29
	tne	%icc,	0x6
	umul	%g4,	0x14FB,	%o4
	fmovrsgez	%i6,	%f10,	%f16
	fmuld8ulx16	%f14,	%f21,	%f4
	tvc	%xcc,	0x6
	fmul8sux16	%f16,	%f8,	%f0
	xnor	%l2,	0x031A,	%o6
	bvc	loop_1728
	movgu	%xcc,	%o2,	%l1
	taddcctv	%o1,	0x12A5,	%i0
	edge32ln	%o3,	%g2,	%l6
loop_1728:
	addc	%o5,	0x0B0C,	%g5
	fabsd	%f12,	%f12
	edge32n	%g7,	%g6,	%l4
	umulcc	%i4,	0x04A5,	%l3
	movvc	%xcc,	%i7,	%g1
	ldstub	[%l7 + 0x25],	%i3
	nop
	fitod	%f2,	%f30
	fdtos	%f30,	%f5
	fcmpne32	%f26,	%f22,	%l0
	movleu	%xcc,	%i2,	%o0
	umulcc	%o7,	%g3,	%i5
	sethi	0x0427,	%l5
	bge	%xcc,	loop_1729
	movn	%xcc,	%i1,	%o4
	move	%icc,	%g4,	%i6
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1729:
	subc	%o6,	0x1C45,	%l2
	fmovdgu	%icc,	%f16,	%f2
	addc	%l1,	0x09EB,	%o2
	fbue	%fcc3,	loop_1730
	brlz,a	%i0,	loop_1731
	tsubcc	%o1,	0x1C29,	%o3
	brgz	%g2,	loop_1732
loop_1730:
	movneg	%xcc,	%o5,	%l6
loop_1731:
	movneg	%icc,	%g7,	%g5
	mova	%icc,	%g6,	%i4
loop_1732:
	edge32l	%l3,	%l4,	%g1
	sdiv	%i7,	0x10F8,	%i3
	fbuge	%fcc1,	loop_1733
	tg	%xcc,	0x4
	addc	%i2,	%o0,	%l0
	xnor	%g3,	%i5,	%o7
loop_1733:
	or	%l5,	0x123B,	%i1
	movn	%icc,	%o4,	%g4
	stx	%i6,	[%l7 + 0x08]
	fmovsvc	%icc,	%f7,	%f0
	movrlez	%l2,	%o6,	%o2
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x38] %asi,	%f17
	fmovd	%f10,	%f22
	addccc	%l1,	0x1E8A,	%i0
	orcc	%o1,	0x0AEF,	%g2
	movre	%o5,	0x271,	%o3
	addc	%g7,	%l6,	%g5
	movrne	%g6,	%l3,	%l4
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x5C] %asi,	%i4
	fone	%f14
	fones	%f25
	add	%g1,	0x142A,	%i3
	movrgz	%i2,	0x0EF,	%i7
	movleu	%icc,	%l0,	%o0
	movle	%icc,	%i5,	%g3
	xor	%o7,	0x1E54,	%l5
	sdivx	%o4,	0x1CFF,	%i1
	for	%f6,	%f14,	%f16
	edge32l	%i6,	%l2,	%g4
	edge8l	%o6,	%l1,	%i0
	movre	%o1,	%g2,	%o2
	std	%f18,	[%l7 + 0x30]
	sethi	0x09CB,	%o3
	movrlez	%g7,	%o5,	%l6
	edge32ln	%g6,	%l3,	%l4
	movcs	%xcc,	%g5,	%g1
	tneg	%xcc,	0x7
	fmovdvc	%xcc,	%f11,	%f8
	flush	%l7 + 0x24
	umulcc	%i4,	%i2,	%i7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x74] %asi,	%l0
	edge16	%i3,	%i5,	%g3
	movvc	%xcc,	%o0,	%o7
	nop
	setx	0x8051D244,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	fnors	%f30,	%f13,	%f23
	st	%f23,	[%l7 + 0x08]
	ldsb	[%l7 + 0x11],	%o4
	bge,pt	%xcc,	loop_1734
	edge32	%l5,	%i6,	%i1
	umul	%g4,	%l2,	%l1
	edge16n	%i0,	%o6,	%g2
loop_1734:
	mulscc	%o2,	%o1,	%g7
	nop
	setx	0x618BD660950E2439,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x78E227FB756A842E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f12,	%f26
	taddcc	%o3,	%o5,	%g6
	tle	%xcc,	0x2
	te	%icc,	0x2
	fbuge	%fcc2,	loop_1735
	umulcc	%l6,	0x1377,	%l4
	fnot2s	%f9,	%f15
	fsrc1	%f28,	%f0
loop_1735:
	edge32ln	%l3,	%g5,	%i4
	movre	%i2,	%i7,	%l0
	addc	%g1,	%i3,	%i5
	tcc	%icc,	0x7
	smul	%o0,	%o7,	%o4
	sdivcc	%g3,	0x0EF6,	%l5
	fblg	%fcc0,	loop_1736
	andcc	%i1,	0x02B1,	%i6
	tg	%xcc,	0x1
	movrlz	%g4,	%l1,	%i0
loop_1736:
	tl	%icc,	0x0
	nop
	fitos	%f12,	%f16
	fstod	%f16,	%f10
	edge16	%l2,	%g2,	%o2
	edge32	%o1,	%o6,	%o3
	array8	%o5,	%g7,	%g6
	andn	%l6,	%l3,	%g5
	swap	[%l7 + 0x3C],	%l4
	sethi	0x10E7,	%i4
	udivcc	%i2,	0x0BD3,	%l0
	subc	%i7,	0x1973,	%g1
	movleu	%icc,	%i3,	%o0
	tn	%xcc,	0x3
	fmovse	%xcc,	%f29,	%f2
	array32	%i5,	%o7,	%g3
	movleu	%xcc,	%o4,	%i1
	fble,a	%fcc0,	loop_1737
	fpadd32	%f0,	%f26,	%f0
	ta	%icc,	0x5
	umul	%i6,	0x0928,	%l5
loop_1737:
	movvc	%xcc,	%g4,	%l1
	udivcc	%l2,	0x0C42,	%i0
	sllx	%g2,	%o2,	%o1
	edge16ln	%o3,	%o6,	%g7
	fxors	%f23,	%f6,	%f15
	bg,a,pn	%icc,	loop_1738
	fandnot1	%f0,	%f28,	%f24
	srlx	%g6,	%o5,	%l6
	movneg	%xcc,	%l3,	%l4
loop_1738:
	movcc	%icc,	%g5,	%i2
	movge	%icc,	%i4,	%i7
	fmovrdgez	%g1,	%f4,	%f20
	stbar
	fmovsgu	%icc,	%f6,	%f3
	wr	%g0,	0x2b,	%asi
	stxa	%i3,	[%l7 + 0x38] %asi
	membar	#Sync
	movrlz	%o0,	0x1DF,	%l0
	brgez	%i5,	loop_1739
	fornot2	%f28,	%f20,	%f2
	addccc	%o7,	%g3,	%i1
	fbg,a	%fcc3,	loop_1740
loop_1739:
	bcc,a,pt	%xcc,	loop_1741
	tpos	%icc,	0x6
	membar	0x13
loop_1740:
	fbue	%fcc3,	loop_1742
loop_1741:
	fblg,a	%fcc3,	loop_1743
	popc	%i6,	%l5
	sdivcc	%g4,	0x00D2,	%o4
loop_1742:
	addc	%l2,	0x1F85,	%l1
loop_1743:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g2
	nop
	setx	0x306066A6,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	orncc	%o2,	0x119B,	%o1
	fbug,a	%fcc0,	loop_1744
	xorcc	%i0,	%o6,	%g7
	movpos	%xcc,	%o3,	%o5
	tcc	%icc,	0x1
loop_1744:
	fmovsle	%xcc,	%f10,	%f9
	tsubcc	%l6,	0x1D88,	%g6
	fmovd	%f8,	%f26
	sethi	0x1ECD,	%l3
	edge32ln	%g5,	%i2,	%l4
	tge	%xcc,	0x0
	fmovrdne	%i4,	%f6,	%f30
	fpsub32s	%f6,	%f12,	%f7
	sub	%g1,	0x1D90,	%i7
	andn	%o0,	%i3,	%l0
	movrlz	%o7,	0x3B1,	%g3
	tvc	%icc,	0x1
	tcc	%icc,	0x7
	lduw	[%l7 + 0x78],	%i5
	nop
	setx	0xD89F27B60067F225,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	prefetch	[%l7 + 0x20],	 0x0
	fors	%f25,	%f18,	%f23
	udivx	%i1,	0x08CD,	%l5
	array16	%i6,	%o4,	%g4
	movl	%xcc,	%l1,	%l2
	membar	0x51
	movvs	%icc,	%o2,	%o1
	fbe,a	%fcc3,	loop_1745
	edge16n	%i0,	%g2,	%g7
	movrgz	%o6,	0x189,	%o5
	fmovsge	%xcc,	%f25,	%f0
loop_1745:
	movrgz	%o3,	0x318,	%l6
	sllx	%g6,	%l3,	%g5
	umulcc	%l4,	0x038D,	%i4
	ldstub	[%l7 + 0x4E],	%i2
	movpos	%icc,	%i7,	%o0
	movrlez	%g1,	%l0,	%i3
	fmovdneg	%icc,	%f29,	%f4
	udivx	%o7,	0x18AA,	%g3
	fornot1	%f22,	%f24,	%f18
	tvc	%xcc,	0x6
	array16	%i1,	%i5,	%i6
	sllx	%o4,	%g4,	%l1
	mulscc	%l5,	%l2,	%o1
	or	%o2,	0x1E6D,	%g2
	mulx	%i0,	0x1C6E,	%o6
	fmovrdgz	%g7,	%f2,	%f30
	fmovscs	%icc,	%f18,	%f28
	taddcc	%o3,	%o5,	%g6
	fandnot2s	%f14,	%f26,	%f16
	nop
	setx	loop_1746,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bshuffle	%f0,	%f30,	%f0
	mova	%icc,	%l3,	%g5
	fxor	%f16,	%f16,	%f12
loop_1746:
	fmul8ulx16	%f14,	%f6,	%f22
	ldd	[%l7 + 0x70],	%f14
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x1A] %asi,	%l6
	brlz,a	%i4,	loop_1747
	edge8ln	%i2,	%i7,	%l4
	fandnot1s	%f3,	%f13,	%f10
	udivcc	%g1,	0x12AE,	%o0
loop_1747:
	fnot2s	%f18,	%f10
	xnorcc	%l0,	%o7,	%i3
	movrgez	%g3,	%i1,	%i5
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	flush	%l7 + 0x4C
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%i6,	%f23,	%f30
	udivcc	%g4,	0x1192,	%l1
	tleu	%icc,	0x3
	subc	%l5,	0x1B8A,	%l2
	movne	%xcc,	%o2,	%g2
	sdivcc	%o1,	0x155C,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x0
	fpadd16s	%f18,	%f28,	%f9
	movg	%xcc,	%i0,	%o3
	sethi	0x0CF7,	%o5
	movre	%g6,	0x157,	%g7
	array32	%g5,	%l3,	%i4
	be,a	%xcc,	loop_1748
	fmovdge	%xcc,	%f21,	%f28
	orcc	%i2,	%i7,	%l4
	tgu	%xcc,	0x0
loop_1748:
	nop
	setx	loop_1749,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	std	%f14,	[%l7 + 0x08]
	fmovsge	%icc,	%f0,	%f19
	fnot1	%f18,	%f2
loop_1749:
	fsrc1	%f18,	%f28
	subccc	%l6,	0x10B3,	%g1
	taddcctv	%o0,	0x1F7B,	%l0
	edge32ln	%i3,	%o7,	%i1
	tleu	%xcc,	0x5
	sethi	0x1F78,	%g3
	movleu	%xcc,	%o4,	%i6
	andncc	%i5,	%g4,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc0,	loop_1750
	tg	%xcc,	0x2
	sir	0x0281
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%o2
loop_1750:
	fpsub32	%f14,	%f28,	%f24
	edge32	%g2,	%l2,	%o6
	taddcctv	%i0,	%o1,	%o3
	xorcc	%o5,	0x087A,	%g7
	nop
	setx	0x7BDD489A30465854,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fmovdcs	%xcc,	%f16,	%f30
	set	0x34, %i0
	lduwa	[%l7 + %i0] 0x04,	%g6
	nop
	setx	0x1B179948,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x1FA91EEC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f0,	%f30
	nop
	setx	loop_1751,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bleu,pn	%icc,	loop_1752
	edge16l	%l3,	%i4,	%i2
	call	loop_1753
loop_1751:
	movn	%xcc,	%g5,	%l4
loop_1752:
	array16	%i7,	%l6,	%o0
	sra	%l0,	0x18,	%g1
loop_1753:
	bleu,pn	%icc,	loop_1754
	mova	%xcc,	%o7,	%i3
	andn	%g3,	0x0526,	%o4
	taddcctv	%i1,	%i5,	%g4
loop_1754:
	bneg,a,pn	%xcc,	loop_1755
	sdiv	%l5,	0x0E9B,	%l1
	edge32	%i6,	%o2,	%l2
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x1A] %asi,	%o6
loop_1755:
	fmovrdlz	%g2,	%f22,	%f12
	add	%i0,	%o1,	%o5
	taddcc	%g7,	%o3,	%l3
	fmovsneg	%icc,	%f13,	%f31
	orn	%i4,	0x17C8,	%g6
	and	%g5,	0x1E78,	%l4
	fmovsvs	%icc,	%f9,	%f21
	bpos,a	loop_1756
	fbne	%fcc0,	loop_1757
	nop
	setx	0xD7B01D786DC63C52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x369009C012C3605F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f10,	%f24
	tg	%xcc,	0x7
loop_1756:
	tleu	%xcc,	0x0
loop_1757:
	addc	%i2,	0x140A,	%l6
	subccc	%i7,	%l0,	%g1
	popc	0x0AF1,	%o7
	fabss	%f22,	%f18
	fcmpeq16	%f10,	%f2,	%i3
	fmovsn	%icc,	%f24,	%f29
	fnot1s	%f10,	%f12
	set	0x78, %i3
	stha	%g3,	[%l7 + %i3] 0x2b
	membar	#Sync
	tsubcc	%o4,	%i1,	%i5
	fmovsleu	%icc,	%f25,	%f1
	edge32	%o0,	%g4,	%l5
	andncc	%i6,	%l1,	%l2
	fmul8x16	%f27,	%f30,	%f18
	mulscc	%o2,	0x074A,	%g2
	alignaddrl	%i0,	%o6,	%o5
	tge	%xcc,	0x1
	nop
	set	0x38, %g6
	stx	%g7,	[%l7 + %g6]
	for	%f12,	%f4,	%f30
	sll	%o1,	%o3,	%i4
	ldd	[%l7 + 0x30],	%f10
	edge16ln	%g6,	%g5,	%l4
	sir	0x1207
	fcmpeq16	%f12,	%f14,	%l3
	srlx	%i2,	0x11,	%i7
	sra	%l0,	0x15,	%g1
	sub	%l6,	0x0D54,	%o7
	nop
	fitod	%f4,	%f20
	fdtoi	%f20,	%f0
	addccc	%i3,	0x1FCB,	%g3
	sub	%o4,	%i1,	%i5
	tge	%xcc,	0x3
	bshuffle	%f0,	%f28,	%f26
	movcc	%xcc,	%o0,	%g4
	fbule	%fcc3,	loop_1758
	fpsub16	%f12,	%f26,	%f20
	add	%i6,	%l1,	%l2
	tleu	%xcc,	0x6
loop_1758:
	edge32n	%l5,	%g2,	%o2
	tneg	%icc,	0x3
	call	loop_1759
	sll	%o6,	0x0D,	%o5
	movrlz	%i0,	%o1,	%o3
	fcmpeq32	%f30,	%f24,	%i4
loop_1759:
	nop
	setx	0xF6F5F0D86F02AAA2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f26
	array16	%g6,	%g5,	%l4
	fbne	%fcc3,	loop_1760
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f16
	st	%f29,	[%l7 + 0x40]
	nop
	fitos	%f7,	%f7
	fstox	%f7,	%f20
	fxtos	%f20,	%f27
loop_1760:
	fmovrdne	%g7,	%f22,	%f8
	smulcc	%l3,	0x037F,	%i7
	fsrc2	%f24,	%f14
	membar	0x1E
	xnorcc	%l0,	%i2,	%g1
	lduw	[%l7 + 0x14],	%o7
	edge8n	%l6,	%g3,	%o4
	addccc	%i1,	0x0321,	%i3
	fmovrse	%i5,	%f11,	%f27
	taddcc	%g4,	%o0,	%i6
	tvs	%icc,	0x4
	fandnot1	%f22,	%f0,	%f18
	fbu	%fcc0,	loop_1761
	tgu	%icc,	0x3
	tl	%xcc,	0x6
	fmovsvc	%icc,	%f16,	%f0
loop_1761:
	fbu,a	%fcc2,	loop_1762
	brlez,a	%l1,	loop_1763
	fornot2	%f8,	%f20,	%f22
	taddcc	%l2,	0x0E81,	%l5
loop_1762:
	movre	%o2,	%g2,	%o5
loop_1763:
	movrlz	%i0,	%o6,	%o1
	xnor	%i4,	%o3,	%g5
	bvs	%xcc,	loop_1764
	movle	%xcc,	%g6,	%g7
	fornot2s	%f9,	%f26,	%f22
	alignaddrl	%l4,	%i7,	%l3
loop_1764:
	alignaddr	%l0,	%i2,	%o7
	tvs	%icc,	0x0
	andcc	%l6,	%g1,	%o4
	movn	%xcc,	%i1,	%g3
	smul	%i3,	%g4,	%i5
	or	%o0,	0x1237,	%i6
	nop
	setx loop_1765, %l0, %l1
	jmpl %l1, %l2
	movvc	%icc,	%l1,	%l5
	set	0x28, %o4
	stxa	%o2,	[%l7 + %o4] 0x81
loop_1765:
	fbule	%fcc1,	loop_1766
	fbo,a	%fcc3,	loop_1767
	movcs	%xcc,	%o5,	%g2
	set	0x67, %l4
	lduba	[%l7 + %l4] 0x14,	%i0
loop_1766:
	array8	%o1,	%i4,	%o3
loop_1767:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x6C],	%f29
	sdiv	%g5,	0x1B1A,	%g6
	fmovdvc	%icc,	%f12,	%f9
	movneg	%icc,	%g7,	%l4
	edge16n	%i7,	%l3,	%o6
	mulscc	%l0,	0x0F22,	%o7
	fxnor	%f10,	%f12,	%f10
	fnegs	%f15,	%f10
	smul	%l6,	%i2,	%o4
	fxor	%f4,	%f0,	%f10
	fblg	%fcc2,	loop_1768
	tle	%xcc,	0x6
	subcc	%g1,	0x102A,	%g3
	orcc	%i3,	0x108F,	%g4
loop_1768:
	nop
	fitod	%f8,	%f24
	fdtoi	%f24,	%f18
	movl	%xcc,	%i5,	%o0
	fbne,a	%fcc2,	loop_1769
	edge16ln	%i1,	%i6,	%l1
	xnor	%l5,	%o2,	%l2
	tne	%xcc,	0x3
loop_1769:
	udivcc	%o5,	0x08EB,	%i0
	fnand	%f10,	%f28,	%f10
	set	0x38, %o5
	swapa	[%l7 + %o5] 0x89,	%o1
	fnot1	%f4,	%f2
	bne,a,pn	%icc,	loop_1770
	umul	%g2,	0x1151,	%i4
	tge	%xcc,	0x2
	alignaddrl	%o3,	%g6,	%g5
loop_1770:
	fbn	%fcc0,	loop_1771
	fnors	%f17,	%f26,	%f21
	fmovrdne	%l4,	%f30,	%f10
	edge16n	%i7,	%l3,	%o6
loop_1771:
	xorcc	%g7,	%l0,	%l6
	add	%i2,	%o7,	%g1
	ld	[%l7 + 0x3C],	%f10
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x18] %asi,	%g3
	srax	%o4,	%g4,	%i3
	srl	%i5,	0x19,	%o0
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x40] %asi,	%f16
	fpsub32	%f20,	%f16,	%f12
	smul	%i1,	0x0C2C,	%i6
	array8	%l5,	%l1,	%o2
	orcc	%o5,	%i0,	%l2
	nop
	fitod	%f14,	%f20
	mova	%xcc,	%g2,	%o1
	tpos	%xcc,	0x6
	fmovsle	%xcc,	%f1,	%f5
	movg	%xcc,	%i4,	%g6
	nop
	fitos	%f3,	%f31
	fstoi	%f31,	%f27
	stw	%g5,	[%l7 + 0x0C]
	and	%l4,	0x0289,	%o3
	and	%l3,	0x1266,	%i7
	fbuge	%fcc0,	loop_1772
	tg	%icc,	0x2
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x4F] %asi,	%o6
loop_1772:
	umul	%l0,	0x1BDC,	%l6
	fbg	%fcc1,	loop_1773
	movcc	%icc,	%i2,	%g7
	ta	%xcc,	0x4
	edge32ln	%g1,	%g3,	%o4
loop_1773:
	fones	%f14
	fmovscc	%xcc,	%f5,	%f28
	brgez,a	%o7,	loop_1774
	movrne	%g4,	0x046,	%i5
	stx	%i3,	[%l7 + 0x18]
	edge16	%i1,	%i6,	%o0
loop_1774:
	tg	%xcc,	0x7
	udivcc	%l1,	0x0F51,	%o2
	fxnor	%f2,	%f4,	%f20
	nop
	set	0x42, %l5
	stb	%o5,	[%l7 + %l5]
	fcmpgt16	%f2,	%f6,	%l5
	fmovsgu	%xcc,	%f8,	%f12
	add	%l2,	0x1EA7,	%i0
	movvc	%xcc,	%g2,	%i4
	sll	%g6,	0x01,	%o1
	fblg,a	%fcc1,	loop_1775
	fsrc1	%f20,	%f26
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%g4
	udivx	%o3,	0x08FF,	%l4
loop_1775:
	andcc	%l3,	%i7,	%o6
	tl	%icc,	0x2
	edge32n	%l6,	%i2,	%g7
	movrne	%l0,	0x31D,	%g1
	orcc	%o4,	0x1F1B,	%o7
	ldsw	[%l7 + 0x14],	%g4
	xor	%i5,	0x017C,	%g3
	movneg	%xcc,	%i1,	%i6
	membar	0x02
	fnors	%f0,	%f8,	%f3
	sra	%o0,	0x16,	%i3
	fble,a	%fcc1,	loop_1776
	array16	%l1,	%o5,	%o2
	andcc	%l5,	0x1376,	%l2
	add	%g2,	0x1493,	%i4
loop_1776:
	addc	%g6,	%i0,	%g5
	srlx	%o3,	%l4,	%o1
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x4A] %asi,	%l3
	andncc	%i7,	%o6,	%i2
	tn	%icc,	0x4
	movrne	%g7,	%l6,	%g1
	edge32n	%l0,	%o4,	%g4
	fmovsvs	%icc,	%f23,	%f6
	set	0x2C, %o6
	lduha	[%l7 + %o6] 0x89,	%o7
	bvc,a	%xcc,	loop_1777
	ldsh	[%l7 + 0x40],	%i5
	andncc	%i1,	%i6,	%o0
	edge16	%g3,	%l1,	%o5
loop_1777:
	edge32	%i3,	%o2,	%l2
	fcmpgt32	%f30,	%f6,	%l5
	edge8ln	%g2,	%g6,	%i0
	fbge,a	%fcc1,	loop_1778
	stbar
	sub	%i4,	%o3,	%l4
	sir	0x0FC3
loop_1778:
	bleu,a	loop_1779
	ba,a	loop_1780
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f12
	fxtod	%f12,	%f10
	tn	%xcc,	0x3
loop_1779:
	orn	%g5,	%l3,	%i7
loop_1780:
	movvs	%icc,	%o1,	%o6
	tpos	%icc,	0x5
	addcc	%i2,	%g7,	%g1
	fbug,a	%fcc0,	loop_1781
	mova	%icc,	%l6,	%o4
	tvc	%icc,	0x2
	movrne	%l0,	0x1C8,	%g4
loop_1781:
	fmovscs	%xcc,	%f24,	%f0
	fmuld8sux16	%f19,	%f15,	%f28
	alignaddr	%o7,	%i5,	%i1
	fpsub16	%f28,	%f4,	%f16
	be,a,pt	%icc,	loop_1782
	andn	%i6,	0x0DE0,	%g3
	fbue,a	%fcc2,	loop_1783
	fmovdneg	%icc,	%f24,	%f1
loop_1782:
	tn	%icc,	0x3
	fbl,a	%fcc1,	loop_1784
loop_1783:
	fmovrdne	%l1,	%f4,	%f8
	edge16	%o0,	%i3,	%o2
	fbn	%fcc1,	loop_1785
loop_1784:
	sra	%o5,	%l5,	%g2
	tsubcctv	%g6,	0x1136,	%i0
	fbule,a	%fcc0,	loop_1786
loop_1785:
	ldd	[%l7 + 0x70],	%f24
	xnor	%i4,	0x079F,	%o3
	wr	%g0,	0x80,	%asi
	stxa	%l2,	[%l7 + 0x18] %asi
loop_1786:
	array16	%g5,	%l3,	%l4
	tvc	%xcc,	0x2
	fmovsgu	%icc,	%f2,	%f14
	fzero	%f20
	brz	%o1,	loop_1787
	xor	%o6,	0x1ABA,	%i7
	movre	%g7,	0x3C5,	%g1
	udivcc	%i2,	0x0ACF,	%l6
loop_1787:
	flush	%l7 + 0x28
	popc	%o4,	%g4
	and	%o7,	%l0,	%i5
	movrlz	%i1,	0x060,	%i6
	brgz	%g3,	loop_1788
	taddcc	%o0,	0x0B99,	%l1
	bg,pt	%xcc,	loop_1789
	fmovrde	%o2,	%f14,	%f26
loop_1788:
	fsrc2	%f18,	%f26
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x16] %asi,	%o5
loop_1789:
	movg	%icc,	%i3,	%g2
	fmovrslez	%l5,	%f1,	%f30
	flush	%l7 + 0x08
	set	0x5E, %g2
	stha	%i0,	[%l7 + %g2] 0x11
	add	%g6,	0x072C,	%o3
	fsrc1s	%f25,	%f22
	nop
	setx	loop_1790,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%l2,	%i4,	%l3
	sethi	0x1928,	%l4
	bpos,a	%xcc,	loop_1791
loop_1790:
	nop
	setx	0x422CEEA9D6283DE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xC997F86A8124EE95,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f20,	%f22
	udivx	%o1,	0x107B,	%g5
	tneg	%xcc,	0x2
loop_1791:
	te	%icc,	0x4
	bshuffle	%f8,	%f24,	%f22
	brgez	%o6,	loop_1792
	fbn	%fcc2,	loop_1793
	nop
	fitod	%f12,	%f10
	fdtos	%f10,	%f4
	array8	%g7,	%g1,	%i7
loop_1792:
	sdivx	%i2,	0x0FB9,	%o4
loop_1793:
	movn	%xcc,	%g4,	%l6
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x13] %asi,	%l0
	tne	%icc,	0x2
	fxor	%f6,	%f4,	%f4
	tn	%icc,	0x0
	orn	%i5,	0x1F10,	%o7
	movl	%xcc,	%i6,	%g3
	fone	%f24
	orcc	%i1,	%l1,	%o2
	set	0x74, %o7
	lduha	[%l7 + %o7] 0x81,	%o0
	set	0x40, %o3
	stda	%f16,	[%l7 + %o3] 0x10
	set	0x0C, %g7
	lduwa	[%l7 + %g7] 0x19,	%i3
	array32	%o5,	%g2,	%i0
	sir	0x06CE
	nop
	fitos	%f15,	%f7
	edge8l	%g6,	%o3,	%l5
	be,a,pt	%xcc,	loop_1794
	bgu	loop_1795
	edge8	%i4,	%l3,	%l2
	nop
	setx loop_1796, %l0, %l1
	jmpl %l1, %l4
loop_1794:
	add	%o1,	0x19AA,	%o6
loop_1795:
	fbuge,a	%fcc3,	loop_1797
	tvc	%icc,	0x0
loop_1796:
	umulcc	%g5,	%g1,	%i7
	movleu	%icc,	%i2,	%o4
loop_1797:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x14] %asi,	%g7
	std	%f26,	[%l7 + 0x40]
	fbne	%fcc2,	loop_1798
	movne	%xcc,	%l6,	%g4
	movre	%l0,	0x0F5,	%i5
	fmovdcc	%icc,	%f13,	%f7
loop_1798:
	sub	%o7,	%g3,	%i1
	be	%icc,	loop_1799
	array16	%l1,	%o2,	%o0
	fmul8x16au	%f26,	%f20,	%f0
	subc	%i6,	0x0463,	%o5
loop_1799:
	nop
	set	0x40, %g4
	ldsha	[%l7 + %g4] 0x18,	%i3
	fbo,a	%fcc2,	loop_1800
	subc	%g2,	0x0A72,	%i0
	movrlz	%g6,	%l5,	%o3
	movrgz	%l3,	0x29F,	%l2
loop_1800:
	fcmpeq32	%f30,	%f28,	%l4
	fblg,a	%fcc0,	loop_1801
	array16	%o1,	%o6,	%g5
	stbar
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x45] %asi,	%i4
loop_1801:
	bleu,a,pt	%icc,	loop_1802
	fmovdcs	%icc,	%f18,	%f8
	fble,a	%fcc0,	loop_1803
	nop
	set	0x36, %i7
	stb	%i7,	[%l7 + %i7]
loop_1802:
	bcs,a	%icc,	loop_1804
	movneg	%icc,	%g1,	%i2
loop_1803:
	sllx	%g7,	%l6,	%g4
	fmovdneg	%icc,	%f21,	%f18
loop_1804:
	subc	%o4,	%l0,	%o7
	edge16	%g3,	%i5,	%l1
	smulcc	%o2,	%o0,	%i6
	movpos	%xcc,	%o5,	%i1
	set	0x7A, %l1
	lduha	[%l7 + %l1] 0x88,	%g2
	sir	0x1C02
	fbl,a	%fcc2,	loop_1805
	membar	0x20
	bgu	%xcc,	loop_1806
	sll	%i0,	%g6,	%i3
loop_1805:
	tsubcc	%l5,	0x1DC8,	%o3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x40] %asi,	%f27
loop_1806:
	sdivcc	%l2,	0x0F93,	%l4
	movl	%xcc,	%o1,	%o6
	orncc	%l3,	%i4,	%g5
	tl	%xcc,	0x2
	movneg	%icc,	%g1,	%i7
	set	0x0C, %l6
	ldswa	[%l7 + %l6] 0x89,	%g7
	fornot2s	%f13,	%f25,	%f21
	edge8n	%i2,	%g4,	%l6
	subcc	%l0,	%o4,	%g3
	set	0x70, %l2
	ldxa	[%l7 + %l2] 0x11,	%i5
	stw	%l1,	[%l7 + 0x3C]
	fbuge	%fcc3,	loop_1807
	edge8ln	%o7,	%o2,	%o0
	mulscc	%i6,	%i1,	%g2
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%i0
loop_1807:
	fmuld8ulx16	%f28,	%f27,	%f18
	fandnot1s	%f27,	%f19,	%f4
	fblg	%fcc1,	loop_1808
	movn	%xcc,	%o5,	%g6
	srax	%i3,	0x00,	%l5
	xnorcc	%o3,	0x117D,	%l2
loop_1808:
	fba	%fcc0,	loop_1809
	taddcc	%o1,	0x1D4A,	%l4
	andcc	%o6,	%i4,	%l3
	wr	%g0,	0x89,	%asi
	stba	%g1,	[%l7 + 0x15] %asi
loop_1809:
	fmovdge	%icc,	%f27,	%f9
	array16	%g5,	%i7,	%g7
	stb	%i2,	[%l7 + 0x11]
	mova	%icc,	%g4,	%l0
	tvc	%xcc,	0x7
	te	%icc,	0x5
	sllx	%l6,	%g3,	%i5
	andcc	%o4,	%o7,	%o2
	fmovrslz	%o0,	%f18,	%f1
	tl	%icc,	0x5
	mulx	%i6,	0x14C2,	%l1
	bcc,a	loop_1810
	flush	%l7 + 0x78
	sdivx	%i1,	0x1693,	%i0
	fmovsn	%icc,	%f11,	%f29
loop_1810:
	movgu	%xcc,	%o5,	%g2
	tne	%icc,	0x7
	fbge	%fcc3,	loop_1811
	popc	%g6,	%l5
	addccc	%o3,	0x1F39,	%i3
	lduh	[%l7 + 0x3C],	%l2
loop_1811:
	add	%o1,	0x0B6C,	%o6
	te	%icc,	0x6
	set	0x10, %o1
	sta	%f15,	[%l7 + %o1] 0x18
	fbne	%fcc1,	loop_1812
	flush	%l7 + 0x28
	tcc	%icc,	0x4
	orncc	%i4,	%l4,	%l3
loop_1812:
	andn	%g1,	0x0BFF,	%g5
	addccc	%i7,	%g7,	%g4
	movvs	%xcc,	%l0,	%l6
	edge16l	%i2,	%i5,	%g3
	srl	%o7,	0x1A,	%o4
	andn	%o0,	%i6,	%o2
	fmovsle	%xcc,	%f23,	%f26
	movrgez	%i1,	0x299,	%i0
	taddcctv	%o5,	%g2,	%g6
	bge	loop_1813
	orn	%l1,	%l5,	%i3
	movge	%icc,	%l2,	%o3
	fnors	%f13,	%f0,	%f0
loop_1813:
	movrlz	%o6,	0x28A,	%o1
	tneg	%xcc,	0x5
	ldd	[%l7 + 0x58],	%l4
	sdivx	%i4,	0x1808,	%g1
	alignaddr	%l3,	%g5,	%i7
	edge16n	%g4,	%g7,	%l6
	srlx	%l0,	%i2,	%g3
	sdivx	%i5,	0x032B,	%o4
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f8
	fxtod	%f8,	%f30
	fxor	%f18,	%f0,	%f18
	fmovdvc	%xcc,	%f12,	%f13
	sdivcc	%o7,	0x1FA7,	%i6
	bneg,a,pn	%xcc,	loop_1814
	srl	%o0,	%o2,	%i0
	bne	%xcc,	loop_1815
	fmul8x16au	%f3,	%f16,	%f24
loop_1814:
	andcc	%i1,	%g2,	%o5
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x38] %asi,	%g6
loop_1815:
	udivx	%l1,	0x1548,	%i3
	fmovdvc	%xcc,	%f28,	%f29
	edge8l	%l2,	%o3,	%o6
	ldsh	[%l7 + 0x0E],	%o1
	subc	%l4,	%i4,	%g1
	movgu	%icc,	%l5,	%g5
	bpos,a,pn	%xcc,	loop_1816
	srax	%i7,	0x06,	%l3
	tsubcctv	%g4,	0x0AEF,	%l6
	orcc	%l0,	%g7,	%i2
loop_1816:
	fandnot2s	%f23,	%f13,	%f10
	fmovdle	%xcc,	%f10,	%f19
	tsubcc	%g3,	0x02E9,	%o4
	te	%xcc,	0x5
	smul	%i5,	%i6,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o0,	%i0,	%o2
	fmovrsgz	%g2,	%f17,	%f2
	fones	%f9
	edge16	%i1,	%g6,	%o5
	brlz	%l1,	loop_1817
	andcc	%l2,	%i3,	%o6
	movvc	%xcc,	%o3,	%l4
	fmovsge	%xcc,	%f14,	%f3
loop_1817:
	bpos,pn	%xcc,	loop_1818
	mulx	%o1,	%g1,	%i4
	brz,a	%l5,	loop_1819
	movge	%icc,	%i7,	%l3
loop_1818:
	membar	0x1B
	sllx	%g5,	%g4,	%l6
loop_1819:
	ldsh	[%l7 + 0x4C],	%l0
	movle	%icc,	%i2,	%g7
	xor	%o4,	%i5,	%g3
	fornot1	%f22,	%f0,	%f2
	fmovrsgz	%o7,	%f9,	%f4
	edge32l	%i6,	%i0,	%o0
	bne,a,pt	%icc,	loop_1820
	udivcc	%g2,	0x0732,	%i1
	fmovdge	%icc,	%f25,	%f24
	fmovsne	%icc,	%f2,	%f17
loop_1820:
	fblg,a	%fcc2,	loop_1821
	tge	%icc,	0x4
	movge	%xcc,	%o2,	%o5
	fandnot1s	%f10,	%f15,	%f12
loop_1821:
	nop
	fitos	%f9,	%f9
	fstoi	%f9,	%f11
	movgu	%icc,	%g6,	%l1
	edge8	%l2,	%o6,	%o3
	movrlez	%i3,	%o1,	%l4
	tne	%icc,	0x2
	tn	%icc,	0x3
	set	0x68, %g3
	lduha	[%l7 + %g3] 0x80,	%i4
	tvs	%xcc,	0x0
	sdivcc	%l5,	0x0A5A,	%i7
	udivcc	%g1,	0x160B,	%l3
	xorcc	%g5,	%l6,	%l0
	movl	%xcc,	%i2,	%g7
	subc	%g4,	0x16CA,	%o4
	fbuge	%fcc0,	loop_1822
	fzeros	%f25
	ldsh	[%l7 + 0x56],	%i5
	addcc	%o7,	0x0492,	%i6
loop_1822:
	sth	%i0,	[%l7 + 0x0A]
	movcs	%icc,	%g3,	%o0
	fmovdg	%xcc,	%f14,	%f17
	tsubcctv	%g2,	%i1,	%o2
	movge	%xcc,	%o5,	%l1
	subcc	%l2,	0x146B,	%o6
	tleu	%icc,	0x3
	udivx	%o3,	0x01B1,	%i3
	ldsw	[%l7 + 0x7C],	%g6
	addcc	%o1,	%i4,	%l4
	ldsb	[%l7 + 0x61],	%l5
	movg	%xcc,	%i7,	%g1
	edge8ln	%l3,	%g5,	%l6
	mulx	%l0,	%g7,	%i2
	fmovd	%f20,	%f24
	sub	%g4,	%i5,	%o4
	fmovdleu	%icc,	%f6,	%f31
	te	%icc,	0x2
	array16	%i6,	%o7,	%g3
	fbl	%fcc1,	loop_1823
	ta	%icc,	0x6
	mova	%icc,	%o0,	%g2
	srax	%i0,	0x12,	%o2
loop_1823:
	be,a,pt	%xcc,	loop_1824
	sir	0x1C66
	bcc	loop_1825
	tneg	%icc,	0x3
loop_1824:
	movrgez	%o5,	%i1,	%l2
	tsubcctv	%l1,	0x1D7B,	%o3
loop_1825:
	addc	%o6,	%i3,	%g6
	orcc	%o1,	0x16E0,	%i4
	srax	%l5,	0x07,	%l4
	tge	%icc,	0x3
	fbg,a	%fcc2,	loop_1826
	bvs,a	%xcc,	loop_1827
	edge32ln	%g1,	%l3,	%g5
	fbule,a	%fcc2,	loop_1828
loop_1826:
	tcs	%icc,	0x4
loop_1827:
	bg,a,pt	%icc,	loop_1829
	edge32n	%i7,	%l6,	%l0
loop_1828:
	swap	[%l7 + 0x28],	%g7
	tsubcc	%g4,	%i5,	%i2
loop_1829:
	fbul	%fcc3,	loop_1830
	smulcc	%o4,	%o7,	%g3
	tvs	%icc,	0x2
	subcc	%i6,	%g2,	%i0
loop_1830:
	addccc	%o2,	%o0,	%o5
	sdivx	%i1,	0x1E13,	%l2
	edge32	%l1,	%o6,	%o3
	addcc	%g6,	%o1,	%i3
	alignaddrl	%i4,	%l5,	%g1
	xor	%l4,	%g5,	%i7
	and	%l3,	%l0,	%l6
	udivcc	%g7,	0x08CF,	%g4
	srl	%i2,	0x1F,	%o4
	tcs	%xcc,	0x4
	orncc	%o7,	0x0722,	%g3
	edge8	%i5,	%i6,	%i0
	subc	%o2,	0x155B,	%o0
	movleu	%icc,	%g2,	%i1
	call	loop_1831
	mova	%xcc,	%o5,	%l2
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x11,	%f16
loop_1831:
	popc	%o6,	%l1
	mova	%icc,	%o3,	%g6
	fmovd	%f24,	%f8
	fmul8x16al	%f10,	%f8,	%f28
	brz	%i3,	loop_1832
	nop
	fitod	%f10,	%f0
	fdtoi	%f0,	%f15
	movne	%xcc,	%i4,	%o1
	wr	%g0,	0x80,	%asi
	stha	%g1,	[%l7 + 0x0C] %asi
loop_1832:
	edge8	%l4,	%g5,	%l5
	ldub	[%l7 + 0x5C],	%l3
	fcmple32	%f12,	%f4,	%i7
	movge	%icc,	%l6,	%l0
	edge16ln	%g7,	%g4,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f20,	%f28,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o7,	%g3
	tgu	%icc,	0x1
	tcs	%icc,	0x5
	fandnot2	%f4,	%f18,	%f2
	movge	%icc,	%o4,	%i6
	bvs,pn	%xcc,	loop_1833
	fbg	%fcc2,	loop_1834
	edge16	%i5,	%i0,	%o2
	movcc	%xcc,	%o0,	%g2
loop_1833:
	fpmerge	%f25,	%f16,	%f12
loop_1834:
	movpos	%icc,	%i1,	%o5
	set	0x62, %i5
	lduha	[%l7 + %i5] 0x81,	%o6
	fmovsa	%xcc,	%f18,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l1,	0x0157,	%l2
	fmovdn	%icc,	%f22,	%f6
	fones	%f1
	edge16n	%o3,	%i3,	%g6
	sra	%i4,	%o1,	%g1
	tsubcc	%g5,	%l4,	%l3
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
	edge32n	%l6,	%i7,	%l0
	st	%f17,	[%l7 + 0x34]
	tleu	%icc,	0x3
	edge8l	%g7,	%i2,	%o7
	umul	%g3,	%o4,	%g4
	tne	%icc,	0x4
	fbge	%fcc3,	loop_1835
	edge8l	%i6,	%i0,	%o2
	movvs	%xcc,	%i5,	%o0
	xor	%g2,	0x1ED8,	%o5
loop_1835:
	srlx	%i1,	%l1,	%l2
	nop
	set	0x38, %i1
	prefetch	[%l7 + %i1],	 0x2
	fxnor	%f30,	%f30,	%f0
	xorcc	%o3,	%o6,	%g6
	fmovrde	%i3,	%f28,	%f18
	sdiv	%i4,	0x1AA5,	%g1
	fba	%fcc1,	loop_1836
	edge16ln	%o1,	%l4,	%l3
	edge32n	%g5,	%l6,	%l5
	fmovspos	%xcc,	%f20,	%f19
loop_1836:
	ldstub	[%l7 + 0x3E],	%i7
	call	loop_1837
	fbu	%fcc1,	loop_1838
	fpadd32s	%f10,	%f4,	%f12
	bcs,a	loop_1839
loop_1837:
	sra	%l0,	%i2,	%g7
loop_1838:
	addcc	%g3,	%o4,	%o7
	xnorcc	%i6,	%i0,	%g4
loop_1839:
	subcc	%o2,	0x06BC,	%o0
	orncc	%i5,	%g2,	%o5
	fxor	%f24,	%f10,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f14,	%f6
	ldsh	[%l7 + 0x76],	%i1
	ldsw	[%l7 + 0x38],	%l1
	fcmpne16	%f24,	%f30,	%o3
	set	0x34, %l3
	lduba	[%l7 + %l3] 0x10,	%o6
	te	%xcc,	0x4
	bgu,a,pn	%icc,	loop_1840
	movl	%icc,	%g6,	%i3
	array16	%i4,	%l2,	%o1
	brz	%g1,	loop_1841
loop_1840:
	fmovrdlez	%l3,	%f2,	%f16
	nop
	setx	0x5134EDB6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x527D5095,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f2,	%f7
	fpadd32s	%f8,	%f18,	%f24
loop_1841:
	alignaddrl	%l4,	%g5,	%l5
	bne,a,pn	%icc,	loop_1842
	fmovsneg	%icc,	%f24,	%f2
	ldd	[%l7 + 0x78],	%i6
	fsrc1	%f0,	%f30
loop_1842:
	edge32ln	%l0,	%i2,	%i7
	fmovsleu	%xcc,	%f21,	%f7
	movrlez	%g7,	0x3B1,	%o4
	edge32ln	%g3,	%i6,	%i0
	edge32n	%o7,	%g4,	%o0
	addc	%i5,	%g2,	%o5
	brgz	%o2,	loop_1843
	sth	%i1,	[%l7 + 0x2E]
	fmovdg	%xcc,	%f10,	%f11
	movrgez	%l1,	%o3,	%g6
loop_1843:
	movvs	%icc,	%o6,	%i4
	fcmpne16	%f8,	%f16,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f22,	%f0
	movrgz	%o1,	%l2,	%l3
	st	%f19,	[%l7 + 0x64]
	movleu	%icc,	%l4,	%g5
	fxnors	%f25,	%f19,	%f15
	fcmple32	%f28,	%f20,	%l5
	array8	%g1,	%l6,	%i2
	nop
	setx	0x701464BFC816F442,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xB655D54DE1B82E1A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f20,	%f28
	umulcc	%i7,	%l0,	%o4
	tle	%icc,	0x7
	fmovrslez	%g3,	%f31,	%f3
	tle	%xcc,	0x2
	or	%i6,	%g7,	%i0
	fors	%f15,	%f31,	%f23
	movre	%g4,	0x3A2,	%o7
	fmovsneg	%xcc,	%f21,	%f11
	tl	%icc,	0x6
	edge8n	%o0,	%i5,	%g2
	tsubcctv	%o5,	0x0586,	%o2
	fmovrsne	%i1,	%f26,	%f11
	subcc	%l1,	0x1C72,	%o3
	brz	%g6,	loop_1844
	fbn	%fcc0,	loop_1845
	ble,a	loop_1846
	mova	%icc,	%i4,	%o6
loop_1844:
	andcc	%i3,	0x0DDF,	%l2
loop_1845:
	move	%xcc,	%l3,	%o1
loop_1846:
	sdivx	%l4,	0x01D6,	%l5
	taddcctv	%g1,	%g5,	%l6
	wr	%g0,	0x19,	%asi
	stwa	%i2,	[%l7 + 0x28] %asi
	fcmple32	%f26,	%f18,	%i7
	nop
	fitod	%f12,	%f0
	fdtox	%f0,	%f30
	fbu	%fcc3,	loop_1847
	bl,pn	%xcc,	loop_1848
	fmovdle	%xcc,	%f18,	%f31
	fmovrsgz	%o4,	%f18,	%f12
loop_1847:
	tsubcctv	%l0,	0x00D1,	%g3
loop_1848:
	movg	%xcc,	%i6,	%g7
	sdivcc	%g4,	0x199A,	%i0
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	sdiv	%i5,	0x0095,	%o0
	udiv	%g2,	0x080F,	%o2
	fsrc2	%f14,	%f0
	mova	%xcc,	%i1,	%o5
	sra	%o3,	%g6,	%l1
	umul	%i4,	0x09FB,	%o6
	nop
	setx	0xB6CF7B25E0AE75E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB5664A8041AF9C90,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f16,	%f8
	movcs	%icc,	%i3,	%l3
	mova	%xcc,	%l2,	%l4
	fmovrdlez	%o1,	%f28,	%f30
	alignaddr	%g1,	%l5,	%l6
	ldd	[%l7 + 0x08],	%f28
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i7
	movcc	%icc,	%g5,	%o4
	movleu	%xcc,	%g3,	%l0
	addc	%g7,	%i6,	%g4
	fmovsle	%icc,	%f19,	%f25
	brgz,a	%o7,	loop_1849
	edge16n	%i0,	%i5,	%o0
	fmovdneg	%icc,	%f7,	%f29
	movne	%xcc,	%o2,	%g2
loop_1849:
	add	%o5,	%o3,	%g6
	sllx	%i1,	%l1,	%i4
	movgu	%xcc,	%i3,	%o6
	fone	%f24
	tvs	%icc,	0x6
	srl	%l2,	0x06,	%l4
	orn	%o1,	0x037B,	%l3
	for	%f16,	%f10,	%f20
	fmovsa	%xcc,	%f10,	%f18
	stx	%g1,	[%l7 + 0x60]
	fbo	%fcc0,	loop_1850
	xnorcc	%l5,	0x1DA4,	%l6
	tvc	%icc,	0x0
	umulcc	%i2,	0x16AA,	%i7
loop_1850:
	ldx	[%l7 + 0x38],	%g5
	bn	%icc,	loop_1851
	andcc	%o4,	0x112B,	%l0
	sll	%g3,	0x01,	%i6
	addc	%g4,	%o7,	%i0
loop_1851:
	orn	%i5,	%o0,	%o2
	addcc	%g2,	%g7,	%o5
	flush	%l7 + 0x30
	addc	%g6,	%i1,	%l1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o3
	nop
	setx	0x604084B7,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fabsd	%f0,	%f0
	bg,a,pn	%icc,	loop_1852
	movrne	%i4,	0x30D,	%i3
	fnot1s	%f16,	%f19
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x4C] %asi,	%o6
loop_1852:
	move	%icc,	%l2,	%l4
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
	fbug	%fcc1,	loop_1853
	sdivx	%g1,	0x11D4,	%l5
	mulx	%l6,	0x14ED,	%i2
	movcs	%xcc,	%l3,	%g5
loop_1853:
	fpadd32	%f12,	%f2,	%f16
	taddcc	%o4,	0x02EC,	%i7
	udiv	%g3,	0x01A2,	%i6
	move	%icc,	%l0,	%o7
	ble	loop_1854
	movleu	%icc,	%i0,	%i5
	alignaddrl	%o0,	%g4,	%o2
	fnor	%f4,	%f22,	%f22
loop_1854:
	array32	%g2,	%g7,	%g6
	addccc	%o5,	0x11B6,	%i1
	set	0x6C, %g1
	stwa	%l1,	[%l7 + %g1] 0x14
	movrlez	%o3,	%i4,	%i3
	umul	%o6,	0x17E0,	%l2
	fbul	%fcc3,	loop_1855
	sdivcc	%o1,	0x00DE,	%l4
	fmovdleu	%xcc,	%f24,	%f24
	sub	%g1,	0x1D0A,	%l6
loop_1855:
	subcc	%l5,	0x1D15,	%i2
	tsubcc	%l3,	0x1B4B,	%o4
	fpadd32s	%f13,	%f29,	%f29
	tl	%icc,	0x6
	udivcc	%i7,	0x12F1,	%g3
	fxor	%f22,	%f4,	%f12
	fmovdl	%icc,	%f11,	%f8
	nop
	setx	0x6B75CA78921C9B6B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xAFAC675900A641C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f22,	%f12
	set	0x70, %l0
	stxa	%i6,	[%l7 + %l0] 0x81
	fmuld8ulx16	%f11,	%f28,	%f28
	fmovrde	%l0,	%f14,	%f28
	mova	%xcc,	%g5,	%i0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x6C] %asi,	%o7
	fmovdne	%xcc,	%f24,	%f1
	edge16l	%i5,	%o0,	%o2
	xor	%g2,	0x191F,	%g7
	movcs	%icc,	%g6,	%o5
	fmovdneg	%icc,	%f11,	%f14
	bge,pt	%xcc,	loop_1856
	add	%g4,	0x1581,	%l1
	brgz,a	%o3,	loop_1857
	edge16ln	%i1,	%i4,	%o6
loop_1856:
	umul	%l2,	0x0799,	%o1
	srl	%l4,	%g1,	%l6
loop_1857:
	sllx	%l5,	0x0C,	%i3
	ldsh	[%l7 + 0x24],	%i2
	stbar
	brlz,a	%o4,	loop_1858
	st	%f23,	[%l7 + 0x54]
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x36] %asi,	%l3
loop_1858:
	ble,pn	%icc,	loop_1859
	fmovdgu	%xcc,	%f12,	%f16
	sra	%g3,	%i6,	%l0
	tleu	%icc,	0x2
loop_1859:
	tvc	%xcc,	0x6
	xor	%g5,	%i0,	%o7
	sub	%i5,	%o0,	%o2
	sub	%i7,	%g7,	%g6
	fba,a	%fcc0,	loop_1860
	tgu	%icc,	0x1
	ldsh	[%l7 + 0x64],	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1860:
	swap	[%l7 + 0x70],	%g4
	tvs	%xcc,	0x4
	array32	%o5,	%l1,	%i1
	mova	%xcc,	%o3,	%o6
	subccc	%l2,	%o1,	%i4
	srlx	%g1,	0x08,	%l4
	movpos	%xcc,	%l6,	%l5
	srl	%i2,	0x10,	%o4
	tg	%xcc,	0x1
	fexpand	%f13,	%f28
	fcmpne16	%f16,	%f22,	%l3
	xnor	%i3,	%i6,	%g3
	sir	0x1241
	edge32l	%g5,	%i0,	%o7
	movvc	%xcc,	%i5,	%o0
	wr	%g0,	0x11,	%asi
	sta	%f21,	[%l7 + 0x3C] %asi
	nop
	fitod	%f12,	%f26
	fdtoi	%f26,	%f4
	tne	%icc,	0x6
	brlez	%o2,	loop_1861
	tsubcctv	%i7,	%l0,	%g6
	movcs	%xcc,	%g7,	%g2
	edge8l	%g4,	%l1,	%o5
loop_1861:
	fmovrdgez	%o3,	%f28,	%f2
	umul	%o6,	%l2,	%o1
	stx	%i1,	[%l7 + 0x20]
	fors	%f27,	%f19,	%f17
	addc	%i4,	%g1,	%l4
	tneg	%xcc,	0x0
	movvc	%icc,	%l6,	%l5
	fbg	%fcc0,	loop_1862
	nop
	fitod	%f20,	%f2
	movrlz	%o4,	0x19C,	%i2
	fmovdg	%xcc,	%f12,	%f0
loop_1862:
	fbg	%fcc0,	loop_1863
	move	%xcc,	%i3,	%i6
	fblg,a	%fcc1,	loop_1864
	array16	%g3,	%l3,	%i0
loop_1863:
	nop
	fitod	%f19,	%f4
	nop
	fitod	%f10,	%f20
	fdtoi	%f20,	%f31
loop_1864:
	ldd	[%l7 + 0x50],	%g4
	fandnot1s	%f21,	%f16,	%f31
	ldstub	[%l7 + 0x4D],	%i5
	xor	%o7,	0x05E6,	%o2
	array8	%i7,	%o0,	%g6
	fbg,a	%fcc0,	loop_1865
	edge16n	%l0,	%g7,	%g2
	st	%f1,	[%l7 + 0x38]
	fmovspos	%xcc,	%f7,	%f29
loop_1865:
	movrgez	%l1,	0x078,	%g4
	array32	%o5,	%o3,	%o6
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x0
	xnorcc	%i1,	0x10EE,	%l2
	ta	%icc,	0x5
	addcc	%i4,	%l4,	%l6
	tg	%xcc,	0x6
	movg	%icc,	%g1,	%o4
	andcc	%i2,	%i3,	%l5
	movne	%xcc,	%g3,	%i6
	fandnot1	%f30,	%f28,	%f18
	edge16	%l3,	%g5,	%i0
	movrlez	%i5,	0x3E8,	%o2
	mova	%xcc,	%o7,	%o0
	std	%f20,	[%l7 + 0x08]
	tneg	%xcc,	0x3
	ta	%icc,	0x0
	sll	%g6,	0x01,	%l0
	movg	%xcc,	%g7,	%g2
	sub	%l1,	0x0FFA,	%g4
	nop
	fitod	%f12,	%f16
	fdtos	%f16,	%f1
	tneg	%xcc,	0x1
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x18] %asi,	%o5
	movge	%xcc,	%o3,	%o6
	tn	%icc,	0x5
	movcs	%xcc,	%i7,	%i1
	movre	%l2,	0x3D5,	%i4
	udivx	%l4,	0x1445,	%l6
	movge	%icc,	%o1,	%g1
	movpos	%icc,	%o4,	%i3
	call	loop_1866
	movleu	%xcc,	%i2,	%g3
	set	0x40, %i2
	stda	%f0,	[%l7 + %i2] 0x89
loop_1866:
	sdivcc	%i6,	0x04F0,	%l5
	movge	%icc,	%l3,	%i0
	srax	%g5,	0x19,	%o2
	sir	0x1CA8
	andncc	%o7,	%i5,	%o0
	sir	0x0787
	alignaddr	%l0,	%g7,	%g6
	fandnot1s	%f29,	%f28,	%f22
	udivcc	%l1,	0x1B97,	%g4
	sllx	%g2,	0x19,	%o3
	add	%o6,	%i7,	%i1
	set	0x18, %i6
	ldxa	[%g0 + %i6] 0x50,	%l2
	membar	0x7C
	bvc,a	loop_1867
	nop
	setx loop_1868, %l0, %l1
	jmpl %l1, %o5
	xnorcc	%i4,	0x0F1F,	%l4
	nop
	fitos	%f11,	%f17
loop_1867:
	edge16n	%o1,	%g1,	%l6
loop_1868:
	nop
	set	0x10, %g5
	stx	%i3,	[%l7 + %g5]
	fpsub16	%f12,	%f28,	%f24
	movneg	%xcc,	%o4,	%i2
	fba	%fcc1,	loop_1869
	nop
	setx	loop_1870,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_1871,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fands	%f21,	%f5,	%f15
loop_1869:
	fand	%f12,	%f16,	%f26
loop_1870:
	umulcc	%i6,	0x1B3E,	%l5
loop_1871:
	fsrc1s	%f21,	%f5
	fpsub32s	%f13,	%f6,	%f12
	nop
	setx	loop_1872,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_1873,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdcc	%icc,	%f5,	%f12
	fbge	%fcc1,	loop_1874
loop_1872:
	lduh	[%l7 + 0x5E],	%l3
loop_1873:
	edge8ln	%g3,	%i0,	%g5
	mulx	%o2,	0x0741,	%i5
loop_1874:
	fand	%f22,	%f16,	%f8
	udiv	%o7,	0x00DD,	%l0
	movvs	%icc,	%o0,	%g7
	membar	0x62
	set	0x38, %i0
	swapa	[%l7 + %i0] 0x89,	%l1
	taddcc	%g6,	%g2,	%o3
	ble,a,pt	%xcc,	loop_1875
	fmovrslez	%g4,	%f19,	%f11
	fmovscc	%xcc,	%f5,	%f19
	addccc	%o6,	%i1,	%l2
loop_1875:
	taddcctv	%o5,	0x07AE,	%i4
	umulcc	%l4,	%i7,	%o1
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
	tne	%xcc,	0x1
	fmovdvc	%icc,	%f23,	%f27
	fandnot1s	%f18,	%f2,	%f0
	nop
	set	0x24, %o0
	lduh	[%l7 + %o0],	%l6
	alignaddr	%i3,	%o4,	%i6
	stb	%l5,	[%l7 + 0x68]
	tl	%icc,	0x2
	fmovdleu	%xcc,	%f22,	%f20
	movle	%xcc,	%l3,	%i2
	edge8n	%i0,	%g5,	%o2
	bn,a	loop_1876
	tsubcctv	%i5,	%o7,	%g3
	fmovsl	%icc,	%f22,	%f9
	alignaddr	%l0,	%g7,	%o0
loop_1876:
	nop
	set	0x0A, %i3
	ldstuba	[%l7 + %i3] 0x88,	%g6
	fcmpeq32	%f12,	%f16,	%g2
	tle	%xcc,	0x2
	nop
	setx	0xED2AA19F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x8AE51BC8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f26,	%f30
	subccc	%o3,	0x09ED,	%g4
	tsubcctv	%o6,	%i1,	%l1
	addcc	%o5,	0x0B07,	%l2
	set	0x74, %o4
	stba	%i4,	[%l7 + %o4] 0x11
	tvs	%xcc,	0x3
	sra	%l4,	0x16,	%i7
	set	0x30, %l4
	ldswa	[%l7 + %l4] 0x11,	%o1
	fone	%f18
	faligndata	%f22,	%f20,	%f20
	movn	%xcc,	%l6,	%i3
	set	0x40, %g6
	stda	%f0,	[%l7 + %g6] 0x81
	tne	%xcc,	0x0
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x88,	%g0
	xnorcc	%o4,	%l5,	%l3
	tvs	%icc,	0x3
	xnor	%i6,	0x1B5A,	%i2
	movrgez	%g5,	%i0,	%o2
	fmovs	%f15,	%f13
	fbne	%fcc1,	loop_1877
	tl	%icc,	0x4
	ld	[%l7 + 0x64],	%f19
	fmul8x16	%f21,	%f4,	%f28
loop_1877:
	mova	%xcc,	%i5,	%o7
	tsubcctv	%l0,	%g7,	%o0
	fmuld8sux16	%f14,	%f27,	%f16
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%g3
	alignaddr	%g2,	%o3,	%g4
	membar	0x58
	srl	%o6,	0x03,	%i1
	sdiv	%g6,	0x0B2A,	%l1
	array16	%o5,	%l2,	%l4
	popc	0x0EEA,	%i7
	add	%i4,	0x0866,	%l6
	andn	%o1,	%g1,	%o4
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%l5
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x3
	edge8l	%i6,	%i2,	%i3
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f14
	bl,pt	%icc,	loop_1878
	mova	%icc,	%g5,	%i0
	movl	%xcc,	%o2,	%i5
	edge8n	%o7,	%g7,	%o0
loop_1878:
	fnot1s	%f27,	%f24
	fnegd	%f28,	%f10
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x80,	%g3,	%g2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l0
	casa	[%l6] 0x11,	%l0,	%o3
	fmovdne	%xcc,	%f8,	%f10
	edge32n	%g4,	%o6,	%g6
	movvs	%xcc,	%i1,	%l1
	fmovsvc	%icc,	%f27,	%f1
	movrlez	%o5,	%l2,	%i7
	set	0x38, %i4
	ldxa	[%l7 + %i4] 0x18,	%i4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%l4,	%l6
	fands	%f29,	%f2,	%f9
	smulcc	%g1,	0x04D9,	%o1
	movl	%xcc,	%o4,	%l3
	sth	%i6,	[%l7 + 0x26]
	fba,a	%fcc1,	loop_1879
	addc	%l5,	0x1E5D,	%i3
	edge16ln	%i2,	%g5,	%o2
	sdiv	%i0,	0x0CD6,	%o7
loop_1879:
	movpos	%icc,	%g7,	%o0
	array8	%g3,	%g2,	%l0
	fba	%fcc3,	loop_1880
	edge16ln	%i5,	%g4,	%o6
	movgu	%xcc,	%g6,	%o3
	movvc	%xcc,	%i1,	%o5
loop_1880:
	stb	%l1,	[%l7 + 0x77]
	array16	%l2,	%i4,	%l4
	fands	%f2,	%f30,	%f29
	edge32	%l6,	%i7,	%g1
	edge16ln	%o1,	%l3,	%i6
	fmul8x16au	%f28,	%f21,	%f24
	fxors	%f1,	%f7,	%f20
	movn	%icc,	%o4,	%l5
	taddcc	%i3,	%i2,	%g5
	stb	%o2,	[%l7 + 0x75]
	be	%xcc,	loop_1881
	fmovscs	%icc,	%f28,	%f20
	fones	%f20
	movvs	%xcc,	%i0,	%g7
loop_1881:
	swap	[%l7 + 0x70],	%o0
	bleu,pn	%xcc,	loop_1882
	fxors	%f12,	%f17,	%f19
	fbge,a	%fcc0,	loop_1883
	tcs	%xcc,	0x5
loop_1882:
	tle	%icc,	0x1
	nop
	fitos	%f5,	%f22
loop_1883:
	brlez,a	%o7,	loop_1884
	subc	%g2,	%g3,	%i5
	xnor	%l0,	%g4,	%o6
	tsubcctv	%o3,	0x0111,	%i1
loop_1884:
	fpsub16s	%f4,	%f21,	%f17
	edge16ln	%o5,	%l1,	%l2
	taddcctv	%g6,	%l4,	%i4
	taddcctv	%i7,	0x014A,	%g1
	taddcc	%o1,	%l6,	%l3
	set	0x4C, %o5
	lduba	[%l7 + %o5] 0x18,	%i6
	udiv	%o4,	0x16DA,	%l5
	edge32l	%i3,	%i2,	%g5
	brgez	%o2,	loop_1885
	fcmpgt16	%f22,	%f12,	%i0
	set	0x10, %g2
	ldda	[%l7 + %g2] 0x2a,	%o0
loop_1885:
	lduw	[%l7 + 0x44],	%o7
	sllx	%g2,	0x15,	%g7
	sdivcc	%i5,	0x174C,	%g3
	movrlez	%g4,	0x085,	%l0
	smul	%o3,	0x04DE,	%o6
	tvc	%icc,	0x0
	wr	%g0,	0x89,	%asi
	stba	%o5,	[%l7 + 0x5A] %asi
	tne	%xcc,	0x6
	sdivx	%i1,	0x104F,	%l2
	edge16l	%l1,	%l4,	%i4
	movvs	%icc,	%i7,	%g6
	nop
	fitos	%f4,	%f18
	fstod	%f18,	%f28
	subc	%o1,	0x1ADB,	%l6
	nop
	fitod	%f0,	%f26
	fdtox	%f26,	%f4
	movrne	%l3,	0x0A8,	%i6
	sdivcc	%o4,	0x1820,	%l5
	fones	%f15
	tle	%xcc,	0x3
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f22
	fxtod	%f22,	%f8
	sra	%i3,	0x13,	%g1
	fmovdleu	%icc,	%f11,	%f19
	ldsw	[%l7 + 0x64],	%g5
	edge8n	%o2,	%i2,	%i0
	bneg,a	%xcc,	loop_1886
	bneg	%xcc,	loop_1887
	ldsw	[%l7 + 0x24],	%o0
	taddcc	%g2,	0x05EA,	%g7
loop_1886:
	edge16	%i5,	%g3,	%g4
loop_1887:
	ld	[%l7 + 0x7C],	%f31
	fblg,a	%fcc3,	loop_1888
	tpos	%xcc,	0x0
	fmovsle	%icc,	%f4,	%f28
	te	%icc,	0x5
loop_1888:
	fmovdg	%icc,	%f12,	%f21
	fbg,a	%fcc0,	loop_1889
	mulscc	%l0,	0x1D51,	%o7
	sdiv	%o3,	0x1DA4,	%o5
	fbuge	%fcc3,	loop_1890
loop_1889:
	nop
	setx	0x06133A6B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x11C36706,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f21,	%f2
	movrlz	%o6,	%l2,	%l1
	movgu	%xcc,	%i1,	%l4
loop_1890:
	tgu	%icc,	0x6
	edge16	%i7,	%g6,	%i4
	ldd	[%l7 + 0x70],	%f24
	prefetch	[%l7 + 0x40],	 0x1
	movne	%xcc,	%l6,	%o1
	ldsh	[%l7 + 0x10],	%i6
	or	%l3,	%l5,	%o4
	fnegs	%f17,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f2,	%f13
	fnot2	%f4,	%f18
	nop
	setx	loop_1891,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%xcc,	0x4
	nop
	fitod	%f6,	%f6
	fdtos	%f6,	%f8
	tpos	%icc,	0x2
loop_1891:
	fble	%fcc3,	loop_1892
	smulcc	%i3,	%g5,	%o2
	movre	%g1,	0x209,	%i0
	movrgz	%o0,	0x0F2,	%i2
loop_1892:
	movg	%icc,	%g7,	%i5
	membar	0x24
	brlez	%g3,	loop_1893
	fbul	%fcc1,	loop_1894
	edge32	%g4,	%g2,	%l0
	subc	%o7,	0x01E2,	%o3
loop_1893:
	be,a,pn	%xcc,	loop_1895
loop_1894:
	movgu	%icc,	%o6,	%o5
	array16	%l2,	%l1,	%l4
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x24] %asi,	%i7
loop_1895:
	fmovrde	%g6,	%f26,	%f0
	fornot2s	%f31,	%f5,	%f3
	andncc	%i4,	%l6,	%i1
	movneg	%xcc,	%i6,	%l3
	array32	%o1,	%l5,	%o4
	brgez,a	%g5,	loop_1896
	fba	%fcc1,	loop_1897
	movre	%o2,	%i3,	%g1
	movvc	%icc,	%o0,	%i2
loop_1896:
	alignaddr	%i0,	%g7,	%i5
loop_1897:
	fmovse	%icc,	%f14,	%f6
	fbe,a	%fcc3,	loop_1898
	andn	%g4,	0x132C,	%g3
	movrgz	%l0,	%g2,	%o7
	taddcctv	%o6,	%o3,	%o5
loop_1898:
	nop
	setx	0x4D9091D78E70F3A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xB23A72B9C4C13362,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f14,	%f24
	ld	[%l7 + 0x40],	%f16
	mova	%icc,	%l1,	%l4
	tsubcctv	%i7,	0x0DAD,	%l2
	array32	%g6,	%l6,	%i4
	set	0x40, %o7
	stxa	%i1,	[%l7 + %o7] 0x88
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x3
	fpmerge	%f1,	%f15,	%f4
	tcc	%xcc,	0x3
	fmovdleu	%xcc,	%f6,	%f23
	bvc,a,pt	%xcc,	loop_1899
	fones	%f0
	popc	0x185B,	%o1
	orn	%l3,	%o4,	%l5
loop_1899:
	tsubcctv	%g5,	0x1CD4,	%i3
	subccc	%o2,	0x1794,	%g1
	nop
	setx loop_1900, %l0, %l1
	jmpl %l1, %i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	sta	%f14,	[%l7 + 0x54] %asi
loop_1900:
	udiv	%i0,	0x1C47,	%o0
	fpsub32s	%f31,	%f28,	%f27
	st	%f30,	[%l7 + 0x08]
	xnorcc	%g7,	0x013B,	%g4
	prefetch	[%l7 + 0x54],	 0x0
	fcmpne16	%f12,	%f4,	%g3
	fmovdg	%xcc,	%f8,	%f1
	edge8n	%l0,	%g2,	%i5
	movneg	%icc,	%o6,	%o3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%l1
	movne	%xcc,	%l4,	%o5
	fandnot1s	%f3,	%f13,	%f26
	edge16n	%i7,	%l2,	%l6
	fbg,a	%fcc0,	loop_1901
	xorcc	%g6,	0x0769,	%i1
	nop
	setx	loop_1902,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%i6,	%i4,	%l3
loop_1901:
	fbu	%fcc1,	loop_1903
	xnorcc	%o1,	0x0520,	%l5
loop_1902:
	nop
	set	0x1C, %o6
	stwa	%g5,	[%l7 + %o6] 0x22
	membar	#Sync
loop_1903:
	fabsd	%f6,	%f2
	nop
	setx	0xFC87506DEFFD7D4F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f18
	movleu	%icc,	%i3,	%o4
	stx	%g1,	[%l7 + 0x28]
	bl,a,pn	%icc,	loop_1904
	sllx	%i2,	%i0,	%o0
	fbue,a	%fcc2,	loop_1905
	tcc	%xcc,	0x7
loop_1904:
	ldx	[%l7 + 0x58],	%o2
	be,pt	%xcc,	loop_1906
loop_1905:
	fcmpne16	%f4,	%f12,	%g4
	fcmpgt16	%f18,	%f6,	%g3
	subc	%l0,	0x1D3A,	%g2
loop_1906:
	edge8	%g7,	%o6,	%i5
	tle	%xcc,	0x2
	add	%l7,	0x34,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%o3,	%o7
	fmovse	%xcc,	%f10,	%f13
	fmovsvs	%icc,	%f29,	%f28
	mova	%xcc,	%l1,	%l4
	add	%i7,	0x0BF2,	%l2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o5,	%g6
	fbue	%fcc2,	loop_1907
	array16	%l6,	%i1,	%i6
	brlez	%i4,	loop_1908
	tcs	%xcc,	0x2
loop_1907:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x2
loop_1908:
	stb	%o1,	[%l7 + 0x22]
	tg	%icc,	0x7
	tg	%xcc,	0x1
	brz	%l3,	loop_1909
	srlx	%l5,	%i3,	%g5
	add	%o4,	%i2,	%i0
	stbar
loop_1909:
	addc	%o0,	0x0B1C,	%o2
	movcs	%xcc,	%g4,	%g3
	fbo	%fcc3,	loop_1910
	stx	%g1,	[%l7 + 0x48]
	bg,a,pn	%xcc,	loop_1911
	ldx	[%l7 + 0x58],	%l0
loop_1910:
	taddcc	%g2,	0x0057,	%g7
	ta	%icc,	0x4
loop_1911:
	ta	%icc,	0x5
	and	%i5,	0x0DFE,	%o3
	alignaddr	%o6,	%o7,	%l4
	sir	0x1F89
	edge16n	%i7,	%l2,	%l1
	brlez	%g6,	loop_1912
	sdivcc	%l6,	0x00BC,	%i1
	fble	%fcc1,	loop_1913
	tsubcctv	%i6,	0x0188,	%o5
loop_1912:
	fcmpne16	%f0,	%f20,	%o1
	bvc	%xcc,	loop_1914
loop_1913:
	movleu	%xcc,	%l3,	%i4
	tg	%xcc,	0x7
	array32	%i3,	%l5,	%g5
loop_1914:
	ba	%xcc,	loop_1915
	tn	%xcc,	0x6
	sra	%i2,	%i0,	%o4
	fmovdgu	%xcc,	%f9,	%f20
loop_1915:
	fcmpeq32	%f8,	%f26,	%o0
	tleu	%xcc,	0x0
	fcmpgt16	%f8,	%f14,	%o2
	std	%f22,	[%l7 + 0x60]
	movgu	%xcc,	%g3,	%g1
	fbl,a	%fcc0,	loop_1916
	subc	%l0,	%g4,	%g2
	brlez	%g7,	loop_1917
	edge32	%o3,	%i5,	%o6
loop_1916:
	sub	%l4,	0x18EF,	%o7
	edge16	%l2,	%l1,	%i7
loop_1917:
	fbe,a	%fcc3,	loop_1918
	tg	%icc,	0x2
	nop
	setx	loop_1919,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%g6,	0x13,	%i1
loop_1918:
	mulx	%l6,	0x1941,	%i6
	edge32l	%o5,	%l3,	%i4
loop_1919:
	tgu	%icc,	0x3
	xorcc	%o1,	%l5,	%g5
	srlx	%i2,	%i0,	%i3
	brgez	%o0,	loop_1920
	tg	%icc,	0x0
	tge	%xcc,	0x3
	edge8ln	%o4,	%g3,	%o2
loop_1920:
	movneg	%icc,	%g1,	%g4
	fmovdvc	%icc,	%f11,	%f22
	fmovsn	%xcc,	%f5,	%f4
	taddcctv	%g2,	0x0137,	%l0
	fnegs	%f25,	%f25
	ta	%xcc,	0x0
	tn	%xcc,	0x7
	xnorcc	%g7,	0x1F68,	%i5
	movrlez	%o6,	%l4,	%o7
	set	0x66, %o3
	ldstuba	[%l7 + %o3] 0x81,	%l2
	stw	%l1,	[%l7 + 0x60]
	fmovsg	%icc,	%f2,	%f28
	smulcc	%i7,	%o3,	%i1
	fzeros	%f2
	udivcc	%l6,	0x1812,	%i6
	array32	%o5,	%l3,	%i4
	movvs	%icc,	%g6,	%l5
	tcc	%xcc,	0x4
	fandnot1s	%f6,	%f16,	%f14
	ldsw	[%l7 + 0x14],	%g5
	ld	[%l7 + 0x40],	%f17
	sdivcc	%o1,	0x1B4E,	%i2
	edge16ln	%i0,	%o0,	%i3
	fmovrsne	%g3,	%f11,	%f13
	andn	%o2,	%g1,	%o4
	movgu	%xcc,	%g4,	%g2
	nop
	setx	0x2F04B010A04507CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	edge16n	%g7,	%i5,	%o6
	nop
	fitos	%f14,	%f24
	fstod	%f24,	%f6
	edge8ln	%l4,	%o7,	%l2
	fsrc1	%f4,	%f4
	movrlez	%l0,	0x2B4,	%l1
	brz,a	%o3,	loop_1921
	tg	%icc,	0x3
	tne	%icc,	0x6
	movre	%i1,	0x244,	%l6
loop_1921:
	fmul8x16al	%f30,	%f6,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i6,	%i7,	%o5
	fabss	%f24,	%f16
	orn	%i4,	0x14E5,	%l3
	wr	%g0,	0x89,	%asi
	stwa	%g6,	[%l7 + 0x18] %asi
	membar	0x37
	bneg,a	%icc,	loop_1922
	movge	%xcc,	%l5,	%o1
	edge16ln	%i2,	%i0,	%o0
	fmovse	%xcc,	%f17,	%f24
loop_1922:
	tcs	%icc,	0x7
	smul	%i3,	0x14A6,	%g3
	tge	%icc,	0x1
	movpos	%icc,	%o2,	%g5
	stx	%o4,	[%l7 + 0x70]
	array32	%g1,	%g4,	%g7
	sll	%i5,	%g2,	%l4
	tvc	%xcc,	0x3
	brz	%o7,	loop_1923
	fpadd16	%f28,	%f30,	%f2
	edge8ln	%o6,	%l2,	%l0
	te	%xcc,	0x5
loop_1923:
	fors	%f6,	%f21,	%f0
	tneg	%icc,	0x7
	stbar
	movvs	%xcc,	%o3,	%i1
	tvc	%icc,	0x7
	edge16l	%l1,	%l6,	%i7
	mulscc	%o5,	0x0B13,	%i6
	movg	%icc,	%i4,	%g6
	fnands	%f15,	%f22,	%f9
	stx	%l3,	[%l7 + 0x78]
	fmovdgu	%icc,	%f3,	%f27
	movrgz	%l5,	%o1,	%i0
	fpsub32	%f8,	%f16,	%f10
	movn	%xcc,	%o0,	%i2
	tvs	%icc,	0x0
	fmovrslz	%g3,	%f9,	%f31
	tvs	%xcc,	0x3
	subccc	%o2,	%g5,	%o4
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x24] %asi,	%i3
	fpadd16	%f18,	%f16,	%f6
	be,pt	%icc,	loop_1924
	tvs	%xcc,	0x4
	edge32	%g1,	%g4,	%g7
	xnorcc	%i5,	%l4,	%g2
loop_1924:
	brgz,a	%o6,	loop_1925
	fands	%f19,	%f16,	%f3
	fba,a	%fcc2,	loop_1926
	tsubcctv	%o7,	%l0,	%o3
loop_1925:
	ldd	[%l7 + 0x50],	%l2
	edge8	%i1,	%l1,	%l6
loop_1926:
	edge8n	%i7,	%o5,	%i4
	popc	0x011B,	%i6
	fnands	%f24,	%f18,	%f8
	tg	%icc,	0x1
	fmul8x16al	%f23,	%f21,	%f2
	array16	%l3,	%l5,	%g6
	umulcc	%i0,	%o0,	%i2
	smul	%o1,	%o2,	%g3
	fbn,a	%fcc2,	loop_1927
	move	%icc,	%o4,	%g5
	tcc	%xcc,	0x1
	fmovrdgz	%g1,	%f26,	%f0
loop_1927:
	sll	%i3,	%g4,	%i5
	flush	%l7 + 0x3C
	add	%g7,	%l4,	%g2
	fmovrdgez	%o6,	%f24,	%f28
	movleu	%icc,	%o7,	%o3
	fbg,a	%fcc0,	loop_1928
	mova	%xcc,	%l0,	%l2
	addcc	%i1,	%l1,	%l6
	fbul	%fcc1,	loop_1929
loop_1928:
	umul	%o5,	%i4,	%i7
	sdiv	%i6,	0x1CEC,	%l3
	ldsb	[%l7 + 0x6F],	%l5
loop_1929:
	tne	%icc,	0x2
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x16,	%f16
	fmovs	%f18,	%f1
	alignaddr	%i0,	%g6,	%o0
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	subcc	%i2,	0x198A,	%o2
	nop
	setx	0x606801B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	tsubcc	%g3,	0x0CEC,	%o4
	addc	%o1,	0x110B,	%g5
	orncc	%g1,	%g4,	%i5
	tn	%xcc,	0x3
	sdivx	%g7,	0x1F96,	%l4
	fand	%f22,	%f0,	%f24
	or	%i3,	0x0F51,	%o6
	fbn	%fcc2,	loop_1930
	orn	%g2,	%o7,	%o3
	edge8	%l0,	%l2,	%i1
	xor	%l6,	0x0C66,	%o5
loop_1930:
	ldd	[%l7 + 0x30],	%i4
	movn	%xcc,	%l1,	%i6
	srlx	%i7,	0x1E,	%l5
	sra	%i0,	0x18,	%l3
	fcmple32	%f28,	%f20,	%g6
	tn	%icc,	0x1
	fabsd	%f14,	%f16
	array32	%o0,	%o2,	%g3
	fmovsg	%xcc,	%f28,	%f29
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o4
	fmul8ulx16	%f26,	%f20,	%f8
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x78] %asi,	%o1
	xorcc	%g5,	0x1AE9,	%i2
	nop
	setx	0xC172540B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x5482C83E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f10,	%f28
	movrne	%g4,	%g1,	%g7
	fpsub32s	%f30,	%f26,	%f13
	sth	%i5,	[%l7 + 0x16]
	orncc	%l4,	%o6,	%g2
	wr	%g0,	0x88,	%asi
	stha	%o7,	[%l7 + 0x12] %asi
	tsubcctv	%i3,	%o3,	%l0
	udivx	%i1,	0x1B12,	%l2
	lduh	[%l7 + 0x74],	%l6
	stx	%i4,	[%l7 + 0x78]
	tn	%xcc,	0x3
	wr	%g0,	0x88,	%asi
	stba	%o5,	[%l7 + 0x29] %asi
	tvc	%icc,	0x5
	tvc	%icc,	0x0
	tn	%icc,	0x6
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	xorcc	%i6,	%i7,	%l1
	edge32	%i0,	%l5,	%l3
	orncc	%o0,	0x0EAA,	%o2
	fbge	%fcc3,	loop_1931
	nop
	setx	0x9C899CCB7FDEFE17,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f28
	set	0x3A, %g4
	ldstuba	[%l7 + %g4] 0x18,	%g3
loop_1931:
	fmovsne	%xcc,	%f7,	%f14
	fandnot2s	%f7,	%f24,	%f28
	ldsw	[%l7 + 0x28],	%o4
	ldub	[%l7 + 0x36],	%g6
	nop
	setx	0xDF4D84AA39D28E37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x91D1FCC722D2EB2C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f16,	%f2
	fblg	%fcc1,	loop_1932
	fxnor	%f6,	%f24,	%f28
	fbu	%fcc0,	loop_1933
	movleu	%icc,	%g5,	%i2
loop_1932:
	sth	%g4,	[%l7 + 0x38]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1933:
	movrgz	%o1,	0x2E9,	%g1
	sll	%g7,	0x04,	%i5
	ble,a	loop_1934
	udiv	%o6,	0x10C5,	%g2
	stbar
	lduw	[%l7 + 0x48],	%o7
loop_1934:
	fcmpne16	%f8,	%f28,	%i3
	addcc	%l4,	0x163C,	%l0
	movrlez	%o3,	%l2,	%i1
	fpsub16	%f12,	%f30,	%f24
	xorcc	%l6,	%o5,	%i4
	fbl	%fcc2,	loop_1935
	taddcc	%i6,	%l1,	%i0
	ba,a	loop_1936
	fmovrslez	%i7,	%f12,	%f29
loop_1935:
	xorcc	%l5,	0x1121,	%l3
	edge32n	%o2,	%o0,	%g3
loop_1936:
	movne	%xcc,	%o4,	%g5
	mulx	%g6,	%g4,	%i2
	std	%f18,	[%l7 + 0x10]
	tsubcc	%o1,	0x02D3,	%g7
	andncc	%g1,	%o6,	%g2
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x2c,	%o6
	fmul8x16au	%f4,	%f1,	%f10
	tl	%icc,	0x6
	fornot1s	%f2,	%f14,	%f18
	lduw	[%l7 + 0x20],	%i3
	swap	[%l7 + 0x50],	%i5
	andn	%l0,	%l4,	%o3
	addc	%i1,	0x17BB,	%l6
	xor	%l2,	0x0061,	%i4
	movgu	%xcc,	%o5,	%l1
	nop
	fitos	%f0,	%f30
	fstox	%f30,	%f8
	stbar
	prefetch	[%l7 + 0x1C],	 0x1
	lduh	[%l7 + 0x36],	%i6
	nop
	setx	0xF56657F4C81110B1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x7CBBB9CBF95C90B1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f10,	%f14
	fmovdne	%xcc,	%f18,	%f5
	srax	%i7,	%l5,	%l3
	fmuld8ulx16	%f2,	%f0,	%f0
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x18] %asi,	%o2
	andn	%o0,	%g3,	%i0
	movrgez	%o4,	0x2A5,	%g5
	sllx	%g4,	0x0C,	%g6
	array8	%i2,	%o1,	%g7
	bne,a,pn	%xcc,	loop_1937
	orn	%o6,	%g1,	%g2
	tcc	%icc,	0x2
	fbg	%fcc0,	loop_1938
loop_1937:
	fmovsge	%xcc,	%f20,	%f16
	fmovsle	%xcc,	%f1,	%f30
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x24] %asi,	%o7
loop_1938:
	nop
	set	0x10, %l6
	lduwa	[%l7 + %l6] 0x18,	%i3
	ldd	[%l7 + 0x38],	%l0
	ldsw	[%l7 + 0x50],	%i5
	fmovdle	%icc,	%f27,	%f4
	fnors	%f23,	%f14,	%f11
	fsrc2s	%f29,	%f25
	edge32ln	%o3,	%l4,	%l6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x7C] %asi,	%l2
	fnors	%f29,	%f14,	%f26
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x14,	%f0
	movne	%xcc,	%i4,	%i1
	tvs	%xcc,	0x4
	orcc	%l1,	%o5,	%i6
	movle	%xcc,	%l5,	%l3
	ldsh	[%l7 + 0x4E],	%i7
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x89,	%f0
	ldstub	[%l7 + 0x0A],	%o0
	movneg	%icc,	%g3,	%i0
	movle	%icc,	%o2,	%o4
	movl	%icc,	%g4,	%g5
	tle	%xcc,	0x0
	movre	%g6,	0x0A9,	%i2
	tn	%xcc,	0x3
	edge8ln	%g7,	%o6,	%o1
	xorcc	%g2,	%o7,	%g1
	te	%icc,	0x3
	tpos	%icc,	0x1
	movpos	%xcc,	%i3,	%l0
	tl	%icc,	0x5
	fpsub32s	%f4,	%f11,	%f15
	ld	[%l7 + 0x10],	%f6
	srlx	%o3,	%l4,	%l6
	stb	%i5,	[%l7 + 0x71]
	edge8n	%i4,	%l2,	%l1
	andcc	%o5,	%i6,	%i1
	edge32	%l3,	%l5,	%o0
	bneg,a,pn	%icc,	loop_1939
	tcc	%icc,	0x0
	taddcc	%g3,	0x1DC3,	%i0
	fmovsa	%icc,	%f12,	%f15
loop_1939:
	fbe	%fcc0,	loop_1940
	movrgez	%i7,	%o4,	%g4
	fmovdleu	%xcc,	%f25,	%f5
	fbule	%fcc2,	loop_1941
loop_1940:
	movrgz	%o2,	0x096,	%g5
	fmovdcs	%xcc,	%f0,	%f25
	movrlz	%i2,	0x12E,	%g7
loop_1941:
	fcmple16	%f8,	%f2,	%g6
	fbe	%fcc0,	loop_1942
	brlez	%o1,	loop_1943
	bpos,pn	%icc,	loop_1944
	nop
	setx	0xE7A894E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f29
loop_1942:
	fcmpne16	%f4,	%f2,	%g2
loop_1943:
	sth	%o7,	[%l7 + 0x28]
loop_1944:
	fmuld8ulx16	%f13,	%f5,	%f14
	tle	%icc,	0x6
	fors	%f18,	%f21,	%f25
	fmovrsgz	%g1,	%f21,	%f1
	subccc	%o6,	0x1653,	%i3
	tgu	%icc,	0x0
	fbug,a	%fcc0,	loop_1945
	bcc,a	%icc,	loop_1946
	nop
	fitod	%f19,	%f26
	xnorcc	%o3,	%l0,	%l4
loop_1945:
	or	%l6,	0x108D,	%i4
loop_1946:
	nop
	set	0x34, %g3
	stwa	%i5,	[%l7 + %g3] 0x11
	movre	%l2,	%l1,	%i6
	movrgez	%i1,	0x004,	%o5
	xnorcc	%l3,	%l5,	%o0
	bvs	loop_1947
	edge16n	%i0,	%i7,	%o4
	stw	%g4,	[%l7 + 0x6C]
	sll	%o2,	%g5,	%g3
loop_1947:
	sdivx	%g7,	0x0C21,	%g6
	fmovd	%f22,	%f8
	nop
	setx	0x46890D3B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xB6BBDD59,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f11,	%f10
	xnorcc	%o1,	0x0894,	%i2
	fbe	%fcc3,	loop_1948
	tleu	%icc,	0x2
	movrgz	%g2,	%o7,	%o6
	fbn,a	%fcc2,	loop_1949
loop_1948:
	prefetch	[%l7 + 0x78],	 0x3
	fmovdg	%icc,	%f12,	%f17
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
loop_1949:
	flush	%l7 + 0x7C
	fmovdn	%xcc,	%f24,	%f6
	movrlz	%i3,	%o3,	%l0
	edge8	%l6,	%i4,	%i5
	array16	%l4,	%l1,	%i6
	smul	%i1,	%l2,	%o5
	set	0x32, %o2
	stha	%l3,	[%l7 + %o2] 0xe3
	membar	#Sync
	fblg,a	%fcc2,	loop_1950
	bn,a	%xcc,	loop_1951
	fnot2s	%f30,	%f29
	brz,a	%l5,	loop_1952
loop_1950:
	movle	%xcc,	%o0,	%i0
loop_1951:
	fpadd32	%f6,	%f12,	%f28
	movrlez	%i7,	0x301,	%g4
loop_1952:
	tgu	%xcc,	0x5
	tcc	%icc,	0x1
	bneg,a	%xcc,	loop_1953
	te	%xcc,	0x3
	tleu	%icc,	0x5
	ldd	[%l7 + 0x28],	%f20
loop_1953:
	orn	%o4,	%o2,	%g3
	fmovspos	%icc,	%f21,	%f1
	fmovrsgz	%g7,	%f23,	%f1
	movrlez	%g5,	%o1,	%g6
	tcs	%icc,	0x5
	sir	0x024D
	umulcc	%i2,	0x0A2D,	%o7
	sll	%o6,	0x11,	%g1
	taddcctv	%i3,	%o3,	%l0
	fpsub16	%f14,	%f12,	%f14
	edge16n	%g2,	%l6,	%i4
	ldsh	[%l7 + 0x78],	%i5
	edge32	%l1,	%l4,	%i6
	movleu	%xcc,	%i1,	%l2
	array8	%o5,	%l3,	%o0
	movpos	%xcc,	%i0,	%i7
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x75] %asi,	%g4
	set	0x18, %l2
	lduwa	[%l7 + %l2] 0x18,	%l5
	fbule,a	%fcc2,	loop_1954
	taddcc	%o2,	%o4,	%g3
	sra	%g7,	0x0A,	%g5
	movrlez	%o1,	%g6,	%o7
loop_1954:
	nop
	setx	0xE68FB880,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xEA5E92E1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f25,	%f25
	nop
	fitos	%f4,	%f31
	fstox	%f31,	%f14
	tvc	%xcc,	0x6
	smulcc	%i2,	0x1C43,	%g1
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%i3,	%o6
	movge	%xcc,	%l0,	%o3
	tgu	%icc,	0x7
	fnors	%f2,	%f15,	%f29
	movcc	%icc,	%l6,	%i4
	xor	%g2,	%l1,	%i5
	srax	%l4,	%i6,	%i1
	mova	%xcc,	%o5,	%l3
	fnegs	%f19,	%f0
	orn	%o0,	0x09F8,	%l2
	fcmpeq32	%f26,	%f8,	%i7
	movrlz	%i0,	%l5,	%g4
	andcc	%o2,	%o4,	%g7
	wr	%g0,	0x80,	%asi
	stha	%g5,	[%l7 + 0x5E] %asi
	bneg,a,pn	%xcc,	loop_1955
	fbug	%fcc0,	loop_1956
	subcc	%g3,	0x113E,	%g6
	flush	%l7 + 0x48
loop_1955:
	movvs	%xcc,	%o7,	%o1
loop_1956:
	sra	%i2,	0x11,	%g1
	add	%o6,	0x1F08,	%l0
	fandnot1s	%f1,	%f16,	%f27
	mova	%xcc,	%i3,	%o3
	movrgez	%l6,	%i4,	%g2
	fpadd32	%f12,	%f0,	%f22
	fmovse	%xcc,	%f24,	%f29
	bg,a,pn	%icc,	loop_1957
	edge8	%l1,	%l4,	%i6
	stbar
	std	%f22,	[%l7 + 0x48]
loop_1957:
	srl	%i1,	0x1C,	%o5
	nop
	setx	0xC4C39E9A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xC274BDAF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f14,	%f10
	edge8ln	%l3,	%o0,	%i5
	movcs	%xcc,	%l2,	%i0
	nop
	setx	0x124AA99D82B0B003,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xCD9C4BAD529BE406,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f16,	%f0
	sdiv	%i7,	0x15F4,	%g4
	nop
	fitos	%f6,	%f22
	fstod	%f22,	%f28
	fpsub16s	%f0,	%f4,	%f0
	movpos	%icc,	%o2,	%o4
	fcmple32	%f16,	%f24,	%l5
	andn	%g5,	%g3,	%g6
	tl	%xcc,	0x1
	edge16n	%o7,	%g7,	%o1
	ldd	[%l7 + 0x78],	%f12
	movneg	%xcc,	%g1,	%i2
	add	%l7,	0x68,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o6,	%i3
	add	%l0,	%l6,	%o3
	brz	%i4,	loop_1958
	tg	%icc,	0x0
	fmuld8ulx16	%f5,	%f7,	%f26
	edge16	%g2,	%l1,	%l4
loop_1958:
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f20
	fxtod	%f20,	%f22
	fmovrdne	%i1,	%f0,	%f24
	orcc	%i6,	0x0D89,	%o5
	fbo	%fcc3,	loop_1959
	edge32n	%l3,	%o0,	%i5
	fnot2	%f28,	%f2
	smulcc	%i0,	%l2,	%g4
loop_1959:
	movvs	%xcc,	%o2,	%o4
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge32	%l5,	%g5,	%g3
	bne	loop_1960
	udiv	%g6,	0x1C8F,	%i7
	tle	%xcc,	0x3
	movrgez	%o7,	%g7,	%g1
loop_1960:
	andn	%i2,	0x0E81,	%o6
	fabss	%f1,	%f23
	movrlez	%i3,	0x087,	%o1
	srax	%l0,	%l6,	%i4
	andn	%o3,	0x063F,	%l1
	wr	%g0,	0x89,	%asi
	stxa	%l4,	[%l7 + 0x08] %asi
	fcmpeq32	%f4,	%f2,	%g2
	subcc	%i6,	0x02AD,	%i1
	array16	%l3,	%o5,	%i5
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f30
	fxtod	%f30,	%f0
	set	0x10, %i5
	ldda	[%l7 + %i5] 0x18,	%i0
	sethi	0x059A,	%l2
	movrlz	%o0,	0x082,	%o2
	fmovdne	%icc,	%f19,	%f12
	addc	%g4,	0x133F,	%o4
	tne	%icc,	0x1
	set	0x20, %i1
	stxa	%l5,	[%l7 + %i1] 0x80
	movrne	%g3,	0x268,	%g6
	taddcctv	%g5,	%i7,	%o7
	nop
	setx loop_1961, %l0, %l1
	jmpl %l1, %g1
	tvs	%icc,	0x3
	srlx	%i2,	%o6,	%i3
	edge16l	%o1,	%l0,	%g7
loop_1961:
	fmovsle	%icc,	%f25,	%f13
	sdivcc	%i4,	0x1CAB,	%l6
	brgez	%o3,	loop_1962
	tsubcctv	%l4,	0x05A3,	%g2
	or	%l1,	%i6,	%l3
	fnot1s	%f15,	%f6
loop_1962:
	edge8n	%i1,	%o5,	%i5
	fornot2s	%f28,	%f1,	%f16
	movrlz	%l2,	0x040,	%i0
	mulscc	%o0,	%o2,	%o4
	nop
	setx loop_1963, %l0, %l1
	jmpl %l1, %l5
	fbe	%fcc2,	loop_1964
	edge16ln	%g4,	%g3,	%g6
	fmovdn	%icc,	%f6,	%f7
loop_1963:
	umul	%i7,	0x1779,	%g5
loop_1964:
	pdist	%f30,	%f28,	%f30
	sdivcc	%g1,	0x0CDC,	%o7
	movvc	%icc,	%i2,	%o6
	sll	%o1,	%l0,	%g7
	fpack16	%f18,	%f23
	edge16l	%i3,	%l6,	%i4
	brnz,a	%l4,	loop_1965
	mulx	%o3,	%l1,	%g2
	subc	%i6,	0x1081,	%l3
	fbne,a	%fcc0,	loop_1966
loop_1965:
	fpack32	%f16,	%f14,	%f22
	xorcc	%i1,	%i5,	%o5
	bge,a,pt	%icc,	loop_1967
loop_1966:
	movpos	%icc,	%i0,	%o0
	edge8l	%l2,	%o4,	%l5
	udiv	%o2,	0x1EF2,	%g3
loop_1967:
	tcc	%xcc,	0x0
	wr	%g0,	0x22,	%asi
	stwa	%g6,	[%l7 + 0x4C] %asi
	membar	#Sync
	sra	%i7,	%g4,	%g5
	movg	%xcc,	%o7,	%i2
	set	0x40, %l3
	prefetcha	[%l7 + %l3] 0x88,	 0x1
	stw	%o6,	[%l7 + 0x40]
	smulcc	%o1,	0x0A2B,	%g7
	edge16n	%i3,	%l6,	%l0
	add	%l4,	%o3,	%l1
	nop
	set	0x68, %l0
	stw	%i4,	[%l7 + %l0]
	fbuge,a	%fcc0,	loop_1968
	movcc	%xcc,	%g2,	%l3
	movne	%xcc,	%i1,	%i6
	set	0x46, %g1
	lduha	[%l7 + %g1] 0x15,	%i5
loop_1968:
	fabss	%f25,	%f16
	fmovdneg	%xcc,	%f13,	%f3
	umulcc	%i0,	0x14EF,	%o0
	movneg	%xcc,	%o5,	%l2
	move	%icc,	%l5,	%o2
	move	%xcc,	%g3,	%g6
	movrgz	%o4,	0x1F9,	%g4
	tvc	%icc,	0x6
	subccc	%i7,	%g5,	%i2
	smul	%o7,	0x039D,	%o6
	movrlz	%o1,	0x077,	%g7
	orncc	%g1,	0x0A13,	%l6
	umul	%l0,	0x01AD,	%i3
	taddcctv	%l4,	%o3,	%l1
	mulscc	%i4,	%l3,	%g2
	fmovrslez	%i1,	%f25,	%f23
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f14,	%f28,	%f2
	fsrc1s	%f31,	%f19
	sir	0x175B
	bne,a	%icc,	loop_1969
	or	%i6,	%i5,	%o0
	brgz	%o5,	loop_1970
	andcc	%i0,	%l2,	%l5
loop_1969:
	std	%f20,	[%l7 + 0x28]
	array16	%o2,	%g3,	%o4
loop_1970:
	fnegs	%f23,	%f14
	stx	%g6,	[%l7 + 0x18]
	tgu	%icc,	0x0
	udivcc	%g4,	0x16E7,	%g5
	fbn	%fcc1,	loop_1971
	membar	0x14
	stw	%i2,	[%l7 + 0x2C]
	sra	%i7,	%o6,	%o1
loop_1971:
	bge	loop_1972
	xor	%g7,	0x008D,	%g1
	sllx	%l6,	0x03,	%l0
	fcmpne32	%f6,	%f10,	%i3
loop_1972:
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f10
	movl	%icc,	%l4,	%o3
	bpos,pn	%icc,	loop_1973
	fnor	%f28,	%f24,	%f12
	fsrc2s	%f29,	%f29
	stbar
loop_1973:
	movre	%o7,	0x3E8,	%i4
	movn	%xcc,	%l1,	%g2
	srax	%l3,	0x13,	%i6
	bvs,a,pn	%icc,	loop_1974
	fbn,a	%fcc2,	loop_1975
	sdivx	%i1,	0x1D0D,	%o0
	fmovda	%icc,	%f2,	%f22
loop_1974:
	fbg,a	%fcc1,	loop_1976
loop_1975:
	bgu,a	%xcc,	loop_1977
	edge8	%o5,	%i0,	%l2
	ldstub	[%l7 + 0x68],	%i5
loop_1976:
	movne	%icc,	%o2,	%g3
loop_1977:
	udivx	%o4,	0x1A81,	%g6
	movl	%xcc,	%g4,	%l5
	movneg	%icc,	%i2,	%g5
	st	%f0,	[%l7 + 0x74]
	popc	0x197B,	%o6
	subc	%i7,	0x0823,	%g7
	fpack16	%f12,	%f9
	stbar
	brgz	%o1,	loop_1978
	movl	%xcc,	%l6,	%l0
	fnands	%f23,	%f24,	%f0
	tsubcctv	%i3,	%g1,	%o3
loop_1978:
	edge32l	%o7,	%l4,	%l1
	edge8n	%i4,	%l3,	%g2
	fmovrdgez	%i6,	%f24,	%f20
	subc	%o0,	%i1,	%i0
	edge8n	%l2,	%i5,	%o5
	array8	%o2,	%o4,	%g3
	fnot1	%f8,	%f6
	bge	loop_1979
	sdiv	%g6,	0x0312,	%g4
	edge16n	%i2,	%g5,	%l5
	pdist	%f20,	%f18,	%f12
loop_1979:
	orcc	%i7,	0x099E,	%g7
	fmovsge	%icc,	%f8,	%f25
	sdivx	%o6,	0x1332,	%l6
	tvs	%icc,	0x7
	fbo,a	%fcc0,	loop_1980
	andncc	%l0,	%i3,	%g1
	be,pt	%xcc,	loop_1981
	fpsub16	%f22,	%f14,	%f24
loop_1980:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%o3,	%o7
loop_1981:
	array16	%o1,	%l1,	%l4
	fmovdge	%icc,	%f26,	%f2
	udiv	%l3,	0x1E3E,	%i4
	tle	%icc,	0x7
	sdivcc	%i6,	0x0519,	%g2
	alignaddr	%o0,	%i0,	%l2
	movne	%xcc,	%i1,	%o5
	fbue,a	%fcc0,	loop_1982
	movrlz	%o2,	%i5,	%o4
	mova	%xcc,	%g6,	%g3
	fpack32	%f14,	%f20,	%f26
loop_1982:
	tcc	%icc,	0x7
	movl	%xcc,	%g4,	%i2
	sethi	0x12D9,	%g5
	ldstub	[%l7 + 0x51],	%i7
	tvs	%icc,	0x0
	set	0x60, %i2
	stha	%l5,	[%l7 + %i2] 0x27
	membar	#Sync
	tleu	%icc,	0x2
	srl	%o6,	%l6,	%g7
	srax	%i3,	%g1,	%o3
	edge32	%l0,	%o1,	%o7
	udiv	%l1,	0x0F3D,	%l3
	edge32	%i4,	%l4,	%i6
	or	%g2,	0x12AE,	%o0
	taddcc	%l2,	0x0C19,	%i0
	taddcctv	%o5,	0x0181,	%o2
	andcc	%i5,	0x0265,	%o4
	srax	%g6,	%g3,	%i1
	fbne	%fcc0,	loop_1983
	and	%g4,	%i2,	%g5
	tge	%xcc,	0x7
	smulcc	%l5,	0x1E97,	%i7
loop_1983:
	fmovsle	%icc,	%f5,	%f26
	array16	%o6,	%g7,	%i3
	nop
	set	0x78, %i6
	lduh	[%l7 + %i6],	%l6
	edge16n	%o3,	%g1,	%o1
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movl	%xcc,	%l0,	%l1
	subc	%l3,	0x05C7,	%i4
	xorcc	%o7,	%l4,	%g2
	xnorcc	%i6,	0x0565,	%l2
	edge16l	%i0,	%o0,	%o2
	sth	%i5,	[%l7 + 0x60]
	tsubcctv	%o5,	0x1133,	%g6
	bn,pt	%icc,	loop_1984
	fbule	%fcc2,	loop_1985
	tg	%icc,	0x0
	fornot2s	%f25,	%f21,	%f0
loop_1984:
	lduw	[%l7 + 0x78],	%o4
loop_1985:
	bvc,a,pn	%xcc,	loop_1986
	srlx	%g3,	0x11,	%g4
	stx	%i1,	[%l7 + 0x28]
	nop
	fitod	%f11,	%f24
loop_1986:
	movcc	%xcc,	%i2,	%l5
	bcc,pn	%icc,	loop_1987
	bpos,a,pt	%icc,	loop_1988
	udivx	%i7,	0x0173,	%o6
	fornot1s	%f19,	%f18,	%f12
loop_1987:
	movcs	%icc,	%g5,	%g7
loop_1988:
	movrlz	%i3,	%l6,	%o3
	and	%o1,	%l0,	%l1
	movcs	%xcc,	%g1,	%l3
	stb	%o7,	[%l7 + 0x7B]
	movrgz	%i4,	%l4,	%g2
	edge32l	%l2,	%i0,	%o0
	xor	%o2,	0x17F3,	%i5
	movrlez	%o5,	0x09A,	%g6
	mulx	%o4,	%i6,	%g4
	fbne	%fcc0,	loop_1989
	fornot1s	%f31,	%f25,	%f13
	movl	%icc,	%i1,	%g3
	taddcc	%i2,	0x11B6,	%l5
loop_1989:
	fmovrslez	%o6,	%f6,	%f13
	tleu	%icc,	0x3
	tn	%xcc,	0x6
	sth	%i7,	[%l7 + 0x5C]
	move	%xcc,	%g7,	%g5
	edge8l	%l6,	%i3,	%o1
	srax	%o3,	0x08,	%l0
	subcc	%l1,	%g1,	%l3
	edge8l	%i4,	%l4,	%g2
	array16	%o7,	%l2,	%i0
	sdivx	%o2,	0x18C8,	%i5
	alignaddrl	%o0,	%g6,	%o4
	nop
	fitos	%f7,	%f5
	fstox	%f5,	%f12
	fxtos	%f12,	%f23
	and	%i6,	%g4,	%i1
	edge8ln	%o5,	%g3,	%i2
	movre	%l5,	0x24D,	%i7
	fexpand	%f20,	%f14
	edge16l	%o6,	%g5,	%l6
	movrgz	%g7,	%o1,	%o3
	edge32	%l0,	%l1,	%i3
	sub	%l3,	0x043F,	%g1
	ldsb	[%l7 + 0x36],	%l4
	edge8l	%i4,	%o7,	%g2
	fmovsleu	%icc,	%f26,	%f22
	ld	[%l7 + 0x3C],	%f17
	fmuld8ulx16	%f15,	%f2,	%f10
	movneg	%xcc,	%l2,	%i0
	bcc,pn	%xcc,	loop_1990
	movcs	%xcc,	%i5,	%o2
	fsrc1	%f20,	%f6
	bpos,pt	%icc,	loop_1991
loop_1990:
	movn	%xcc,	%o0,	%g6
	sdiv	%o4,	0x1134,	%i6
	mulx	%g4,	0x11AD,	%i1
loop_1991:
	fmovsn	%xcc,	%f6,	%f0
	addc	%g3,	%o5,	%i2
	movle	%xcc,	%i7,	%l5
	brgez	%g5,	loop_1992
	sdivcc	%l6,	0x1559,	%o6
	and	%o1,	%g7,	%l0
	fmovdleu	%xcc,	%f10,	%f2
loop_1992:
	bge	%xcc,	loop_1993
	brlz	%o3,	loop_1994
	te	%icc,	0x6
	movcs	%icc,	%i3,	%l3
loop_1993:
	subcc	%l1,	%g1,	%l4
loop_1994:
	mulscc	%o7,	%g2,	%i4
	movcc	%icc,	%l2,	%i0
	nop
	setx	0xC28278B5191154F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xA0C72B2AE8BDEAFD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f26,	%f16
	sllx	%o2,	0x09,	%o0
	fcmpne16	%f20,	%f20,	%g6
	srax	%i5,	0x0A,	%i6
	movgu	%xcc,	%g4,	%i1
	movge	%icc,	%o4,	%o5
	fmovd	%f4,	%f16
	wr	%g0,	0x11,	%asi
	stwa	%i2,	[%l7 + 0x78] %asi
	addccc	%i7,	%l5,	%g5
	movge	%xcc,	%g3,	%l6
	orncc	%o6,	%o1,	%l0
	xorcc	%g7,	0x06A3,	%i3
	fmovsle	%icc,	%f19,	%f31
	tgu	%icc,	0x7
	membar	0x7D
	popc	%l3,	%l1
	alignaddrl	%g1,	%l4,	%o3
	orn	%g2,	0x029A,	%i4
	srlx	%o7,	%i0,	%l2
	fxor	%f14,	%f12,	%f28
	movvs	%icc,	%o2,	%g6
	srax	%i5,	0x00,	%o0
	nop
	set	0x0A, %i0
	lduh	[%l7 + %i0],	%g4
	movn	%icc,	%i6,	%o4
	call	loop_1995
	mulscc	%i1,	%o5,	%i2
	edge32n	%l5,	%g5,	%g3
	edge16	%l6,	%i7,	%o6
loop_1995:
	subcc	%o1,	0x0716,	%l0
	fnand	%f28,	%f2,	%f2
	xnorcc	%i3,	0x178D,	%g7
	tg	%icc,	0x5
	nop
	setx loop_1996, %l0, %l1
	jmpl %l1, %l3
	umulcc	%g1,	0x13E0,	%l1
	sra	%l4,	0x02,	%g2
	mova	%xcc,	%i4,	%o3
loop_1996:
	movrne	%i0,	0x169,	%l2
	fmul8x16au	%f27,	%f6,	%f12
	bn,a	%xcc,	loop_1997
	fmul8x16	%f29,	%f24,	%f24
	fbo	%fcc0,	loop_1998
	fsrc2s	%f27,	%f23
loop_1997:
	sethi	0x13BB,	%o2
	edge32n	%o7,	%i5,	%g6
loop_1998:
	andcc	%o0,	%g4,	%i6
	fornot2s	%f5,	%f5,	%f30
	movrne	%o4,	%i1,	%o5
	fxor	%f26,	%f4,	%f22
	fsrc1	%f2,	%f0
	tsubcctv	%i2,	%l5,	%g5
	taddcc	%l6,	0x00A0,	%i7
	orn	%o6,	%g3,	%o1
	fnegs	%f15,	%f17
	movpos	%xcc,	%i3,	%l0
	sdivcc	%l3,	0x1502,	%g1
	bcc,pt	%icc,	loop_1999
	movle	%icc,	%l1,	%g7
	array32	%g2,	%l4,	%i4
	movn	%xcc,	%o3,	%i0
loop_1999:
	fpadd32s	%f4,	%f13,	%f3
	brgz	%l2,	loop_2000
	movleu	%icc,	%o2,	%i5
	edge16ln	%o7,	%g6,	%o0
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f0
	fxtod	%f0,	%f14
loop_2000:
	tl	%icc,	0x4
	set	0x48, %o0
	stxa	%g4,	[%l7 + %o0] 0x15
	edge16	%o4,	%i6,	%o5
	ta	%icc,	0x0
	nop
	setx	loop_2001,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovd	%f2,	%f2
	bcc,pn	%icc,	loop_2002
	edge8n	%i2,	%l5,	%g5
loop_2001:
	bge,a	%xcc,	loop_2003
	brlez	%i1,	loop_2004
loop_2002:
	movleu	%icc,	%i7,	%o6
	andncc	%l6,	%o1,	%i3
loop_2003:
	tcs	%icc,	0x1
loop_2004:
	fexpand	%f0,	%f4
	fnot1	%f28,	%f14
	bleu,a,pt	%icc,	loop_2005
	tle	%icc,	0x3
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x2C] %asi,	%g3
loop_2005:
	array16	%l3,	%l0,	%l1
	fbe	%fcc1,	loop_2006
	xor	%g7,	0x16AF,	%g2
	fmuld8sux16	%f28,	%f10,	%f14
	fmovrsne	%g1,	%f15,	%f27
loop_2006:
	movge	%icc,	%l4,	%i4
	for	%f4,	%f8,	%f6
	fxnors	%f7,	%f16,	%f16
	nop
	setx	loop_2007,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	and	%o3,	%i0,	%o2
	tvs	%xcc,	0x5
	ba,pt	%xcc,	loop_2008
loop_2007:
	sir	0x098E
	bvc,pn	%icc,	loop_2009
	array32	%i5,	%o7,	%g6
loop_2008:
	array8	%o0,	%g4,	%l2
	fsrc1	%f10,	%f10
loop_2009:
	addcc	%o4,	0x0CAB,	%i6
	brnz	%i2,	loop_2010
	ldsb	[%l7 + 0x1B],	%l5
	bleu,a	%icc,	loop_2011
	popc	%o5,	%g5
loop_2010:
	stb	%i7,	[%l7 + 0x0E]
	tsubcctv	%i1,	0x0BC5,	%o6
loop_2011:
	edge32l	%l6,	%o1,	%i3
	fbuge	%fcc1,	loop_2012
	add	%g3,	%l3,	%l1
	bpos,pt	%icc,	loop_2013
	fsrc1s	%f26,	%f22
loop_2012:
	movneg	%icc,	%l0,	%g7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x14] %asi,	%g2
loop_2013:
	and	%g1,	0x0BA3,	%i4
	be,pn	%xcc,	loop_2014
	taddcctv	%l4,	0x19E2,	%i0
	taddcc	%o3,	%i5,	%o2
	movl	%xcc,	%g6,	%o7
loop_2014:
	fble,a	%fcc2,	loop_2015
	addccc	%o0,	0x0E70,	%g4
	fmovse	%xcc,	%f19,	%f15
	fmovsvs	%xcc,	%f22,	%f5
loop_2015:
	nop
	set	0x38, %g5
	swapa	[%l7 + %g5] 0x11,	%l2
	fcmpne16	%f16,	%f30,	%o4
	sdivcc	%i2,	0x18D1,	%l5
	sll	%i6,	%g5,	%i7
	nop
	setx	0x6753CD77604720E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	umul	%i1,	%o6,	%l6
	fsrc2	%f10,	%f24
	movre	%o1,	%o5,	%g3
	edge16l	%l3,	%i3,	%l1
	umulcc	%l0,	0x1782,	%g7
	call	loop_2016
	fmovdneg	%icc,	%f28,	%f13
	umul	%g1,	%i4,	%g2
	fbge,a	%fcc3,	loop_2017
loop_2016:
	fmovsn	%xcc,	%f13,	%f6
	subcc	%i0,	%l4,	%o3
	wr	%g0,	0xeb,	%asi
	stxa	%o2,	[%l7 + 0x58] %asi
	membar	#Sync
loop_2017:
	tcc	%xcc,	0x0
	array8	%i5,	%g6,	%o7
	edge16ln	%o0,	%l2,	%o4
	set	0x56, %i3
	ldsba	[%l7 + %i3] 0x15,	%g4
	fsrc2	%f20,	%f16
	movgu	%xcc,	%i2,	%l5
	fmovdle	%xcc,	%f24,	%f16
	tge	%xcc,	0x5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%i6
	addc	%i7,	0x071B,	%i1
	orn	%l6,	0x19B2,	%o6
	stx	%o1,	[%l7 + 0x70]
	fmul8x16au	%f21,	%f1,	%f22
	alignaddrl	%o5,	%l3,	%i3
	edge16n	%g3,	%l0,	%g7
	sub	%g1,	0x1104,	%i4
	movne	%xcc,	%g2,	%i0
	tsubcctv	%l1,	0x08A5,	%l4
	tpos	%icc,	0x2
	udiv	%o3,	0x1544,	%i5
	fabss	%f7,	%f17
	movleu	%icc,	%g6,	%o2
	tgu	%icc,	0x5
	edge32n	%o0,	%o7,	%o4
	brnz	%l2,	loop_2018
	prefetch	[%l7 + 0x4C],	 0x0
	edge8n	%g4,	%i2,	%l5
	tge	%icc,	0x3
loop_2018:
	udiv	%g5,	0x0C54,	%i6
	fmovs	%f13,	%f12
	smulcc	%i1,	0x1367,	%l6
	movge	%xcc,	%i7,	%o6
	brnz	%o1,	loop_2019
	membar	0x23
	fmovsa	%xcc,	%f6,	%f1
	fmovdgu	%xcc,	%f24,	%f31
loop_2019:
	ld	[%l7 + 0x64],	%f0
	edge16l	%l3,	%o5,	%i3
	udivcc	%l0,	0x1FF1,	%g7
	movle	%xcc,	%g3,	%g1
	nop
	fitod	%f10,	%f26
	fdtoi	%f26,	%f27
	mulscc	%i4,	%i0,	%g2
	fmovdn	%xcc,	%f0,	%f27
	membar	0x7A
	stx	%l1,	[%l7 + 0x58]
	addccc	%l4,	0x02CC,	%o3
	nop
	setx loop_2020, %l0, %l1
	jmpl %l1, %g6
	fornot2s	%f3,	%f2,	%f26
	ble,a,pn	%xcc,	loop_2021
	srax	%o2,	0x02,	%i5
loop_2020:
	bg	loop_2022
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2021:
	fpadd32s	%f21,	%f19,	%f0
	bvs,a,pt	%xcc,	loop_2023
loop_2022:
	taddcc	%o0,	0x1DB9,	%o7
	fmovse	%icc,	%f14,	%f19
	membar	0x26
loop_2023:
	nop
	fitos	%f11,	%f25
	fstox	%f25,	%f0
	fxtos	%f0,	%f5
	fmovdleu	%icc,	%f16,	%f7
	fmovrslez	%l2,	%f17,	%f27
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x30] %asi,	%g4
	set	0x30, %l4
	stxa	%i2,	[%l7 + %l4] 0x04
	fmovsneg	%xcc,	%f3,	%f9
	addccc	%o4,	%l5,	%g5
	fnegd	%f24,	%f16
	fsrc2	%f4,	%f6
	te	%icc,	0x7
	movneg	%icc,	%i6,	%l6
	sdiv	%i1,	0x0226,	%i7
	membar	0x45
	addcc	%o1,	%o6,	%o5
	fmovrdlez	%l3,	%f4,	%f2
	edge8n	%i3,	%g7,	%g3
	fsrc1	%f6,	%f28
	fmovdvs	%icc,	%f30,	%f10
	movg	%icc,	%l0,	%g1
	tsubcc	%i4,	0x1BF2,	%g2
	fpadd32	%f22,	%f20,	%f14
	tge	%xcc,	0x7
	edge8n	%l1,	%l4,	%o3
	movrgz	%i0,	%o2,	%g6
	bleu	%xcc,	loop_2024
	xor	%i5,	0x155C,	%o0
	tpos	%icc,	0x4
	alignaddrl	%o7,	%g4,	%i2
loop_2024:
	orncc	%o4,	0x15EA,	%l2
	fbne,a	%fcc1,	loop_2025
	nop
	fitod	%f10,	%f26
	fdtos	%f26,	%f28
	and	%l5,	0x0C1D,	%g5
	addccc	%l6,	0x1C7D,	%i1
loop_2025:
	fcmpne32	%f14,	%f12,	%i6
	edge8	%o1,	%o6,	%o5
	xnor	%l3,	%i3,	%i7
	fpadd16	%f6,	%f18,	%f4
	srl	%g7,	%g3,	%l0
	subcc	%g1,	%i4,	%l1
	tn	%icc,	0x7
	ba	%xcc,	loop_2026
	fnegs	%f19,	%f10
	tsubcctv	%g2,	%l4,	%i0
	be,a,pn	%xcc,	loop_2027
loop_2026:
	fpsub16	%f30,	%f24,	%f28
	fpmerge	%f9,	%f19,	%f10
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x08] %asi,	%f17
loop_2027:
	te	%icc,	0x4
	sir	0x0CC4
	brgez,a	%o2,	loop_2028
	srlx	%g6,	0x05,	%o3
	fmul8x16al	%f10,	%f29,	%f4
	andcc	%o0,	0x1E73,	%o7
loop_2028:
	stbar
	orncc	%i5,	%g4,	%i2
	sll	%o4,	0x12,	%l2
	membar	0x1F
	fxor	%f18,	%f18,	%f8
	sdivx	%l5,	0x0FF3,	%l6
	fpsub32	%f14,	%f0,	%f8
	nop
	setx	0x9067BECFAF709A1F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4FEEF750F44A7F77,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f24,	%f30
	tvs	%xcc,	0x1
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%f6
	brlz	%g5,	loop_2029
	bvc,a	loop_2030
	fba,a	%fcc1,	loop_2031
	bcc,a	loop_2032
loop_2029:
	udivx	%i6,	0x0852,	%i1
loop_2030:
	sdivx	%o6,	0x187A,	%o5
loop_2031:
	addccc	%l3,	0x1204,	%o1
loop_2032:
	umulcc	%i7,	%g7,	%i3
	fbge,a	%fcc2,	loop_2033
	tcs	%xcc,	0x7
	tgu	%xcc,	0x4
	subcc	%g3,	%g1,	%l0
loop_2033:
	array16	%l1,	%i4,	%g2
	fxor	%f28,	%f6,	%f16
	fands	%f16,	%f10,	%f13
	addc	%i0,	%l4,	%o2
	fmovscs	%icc,	%f18,	%f5
	movcs	%icc,	%o3,	%o0
	prefetch	[%l7 + 0x4C],	 0x2
	tne	%xcc,	0x0
	st	%f9,	[%l7 + 0x20]
	nop
	fitos	%f8,	%f25
	fstoi	%f25,	%f30
	movl	%icc,	%g6,	%i5
	nop
	setx	loop_2034,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn,a	%fcc0,	loop_2035
	smul	%o7,	0x13AD,	%i2
	movneg	%xcc,	%g4,	%l2
loop_2034:
	tvs	%xcc,	0x1
loop_2035:
	umulcc	%l5,	%o4,	%l6
	xor	%g5,	0x03FC,	%i1
	edge8l	%o6,	%o5,	%l3
	fandnot1	%f8,	%f0,	%f30
	stw	%i6,	[%l7 + 0x28]
	umulcc	%i7,	0x027A,	%o1
	bneg,a	%icc,	loop_2036
	mova	%xcc,	%i3,	%g3
	tne	%xcc,	0x3
	sdiv	%g7,	0x1B85,	%g1
loop_2036:
	xnorcc	%l1,	0x007E,	%i4
	fmul8x16al	%f6,	%f15,	%f2
	tcc	%xcc,	0x3
	tcc	%xcc,	0x7
	tvc	%xcc,	0x7
	edge8n	%l0,	%i0,	%l4
	fbule,a	%fcc0,	loop_2037
	fnot1s	%f21,	%f8
	udivcc	%o2,	0x0CE6,	%o3
	fandnot1s	%f0,	%f11,	%f21
loop_2037:
	tneg	%icc,	0x1
	bleu	loop_2038
	fmovsvs	%xcc,	%f14,	%f27
	nop
	fitod	%f4,	%f10
	fdtoi	%f10,	%f13
	movne	%icc,	%g2,	%g6
loop_2038:
	bneg,a	loop_2039
	alignaddrl	%i5,	%o7,	%o0
	movne	%icc,	%g4,	%l2
	bleu,a	loop_2040
loop_2039:
	sir	0x03A7
	fcmpeq16	%f2,	%f10,	%i2
	andncc	%l5,	%o4,	%l6
loop_2040:
	fands	%f26,	%f26,	%f3
	tvs	%icc,	0x5
	fornot2	%f28,	%f30,	%f8
	andcc	%i1,	0x0065,	%g5
	udiv	%o5,	0x1839,	%o6
	edge8	%i6,	%i7,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz	%i3,	loop_2041
	std	%f2,	[%l7 + 0x08]
	movleu	%xcc,	%g3,	%o1
	movrne	%g7,	%g1,	%l1
loop_2041:
	edge8	%i4,	%l0,	%i0
	edge8l	%o2,	%o3,	%g2
	tcc	%icc,	0x1
	fnot2s	%f7,	%f18
	movne	%icc,	%l4,	%g6
	tleu	%icc,	0x7
	movre	%i5,	%o0,	%o7
	andn	%g4,	0x1173,	%l2
	wr	%g0,	0x80,	%asi
	sta	%f17,	[%l7 + 0x0C] %asi
	bpos,pt	%icc,	loop_2042
	fmovdcc	%icc,	%f14,	%f7
	movrlez	%l5,	%o4,	%i2
	tsubcc	%l6,	%g5,	%i1
loop_2042:
	edge32l	%o6,	%o5,	%i6
	nop
	setx	0x0E1A3A918E97EB13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x0A3BA838141689AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f12,	%f4
	movcc	%icc,	%l3,	%i3
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x11,	%i7
	fandnot1s	%f9,	%f22,	%f10
	orncc	%o1,	%g3,	%g7
	fmovdle	%xcc,	%f1,	%f29
	addccc	%g1,	%l1,	%i4
	srl	%l0,	%o2,	%i0
	array32	%o3,	%g2,	%g6
	set	0x78, %i4
	lda	[%l7 + %i4] 0x80,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x70, %o5
	ldda	[%l7 + %o5] 0x23,	%i4
	taddcctv	%l4,	0x1FB9,	%o0
	brgez,a	%o7,	loop_2043
	ldd	[%l7 + 0x60],	%f10
	ta	%xcc,	0x1
	sdivx	%g4,	0x1906,	%l5
loop_2043:
	tvs	%icc,	0x1
	stx	%l2,	[%l7 + 0x18]
	or	%o4,	0x02FA,	%l6
	array16	%g5,	%i2,	%i1
	umulcc	%o5,	%i6,	%l3
	tvc	%xcc,	0x0
	membar	0x60
	fsrc1s	%f0,	%f29
	bneg,a,pn	%icc,	loop_2044
	mulscc	%o6,	0x0ED7,	%i3
	xorcc	%i7,	%o1,	%g7
	movpos	%xcc,	%g1,	%l1
loop_2044:
	fmovdn	%xcc,	%f24,	%f3
	fnot1s	%f17,	%f15
	subccc	%g3,	%l0,	%o2
	be,pn	%icc,	loop_2045
	fbn	%fcc1,	loop_2046
	fmul8ulx16	%f2,	%f4,	%f26
	sub	%i4,	0x1876,	%i0
loop_2045:
	array16	%g2,	%g6,	%o3
loop_2046:
	nop
	setx	loop_2047,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%l4,	%i5,	%o0
	xnor	%g4,	0x07F6,	%l5
	edge8n	%l2,	%o4,	%l6
loop_2047:
	xor	%g5,	0x02B1,	%o7
	fbne	%fcc2,	loop_2048
	array32	%i1,	%o5,	%i6
	te	%xcc,	0x7
	and	%i2,	0x0C09,	%l3
loop_2048:
	edge8l	%o6,	%i3,	%i7
	movre	%o1,	%g1,	%l1
	fble,a	%fcc1,	loop_2049
	udiv	%g7,	0x173E,	%l0
	array16	%g3,	%o2,	%i4
	fcmpne32	%f24,	%f2,	%i0
loop_2049:
	nop
	setx	0x941C82FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x7F0FB0B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f17,	%f15
	fxnor	%f6,	%f4,	%f16
	tcc	%xcc,	0x3
	udivx	%g2,	0x105C,	%o3
	fmovdgu	%xcc,	%f1,	%f20
	movn	%icc,	%l4,	%g6
	nop
	fitos	%f4,	%f21
	fstox	%f21,	%f18
	fxtos	%f18,	%f13
	bvs,a,pn	%icc,	loop_2050
	edge32ln	%o0,	%g4,	%l5
	tcc	%icc,	0x6
	bl	%icc,	loop_2051
loop_2050:
	movle	%xcc,	%l2,	%o4
	fsrc2	%f4,	%f30
	fxnors	%f22,	%f3,	%f20
loop_2051:
	fnegd	%f2,	%f12
	fpack16	%f10,	%f8
	fnand	%f28,	%f30,	%f0
	or	%i5,	%g5,	%l6
	udivx	%i1,	0x12F3,	%o5
	movcs	%icc,	%i6,	%o7
	xor	%i2,	0x0123,	%l3
	movrgez	%o6,	0x183,	%i3
	movleu	%xcc,	%i7,	%o1
	and	%g1,	%l1,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc2,	loop_2052
	fmovde	%xcc,	%f7,	%f27
	taddcc	%l0,	0x0EFA,	%g3
	set	0x7F, %o4
	lduba	[%l7 + %o4] 0x04,	%o2
loop_2052:
	edge16n	%i0,	%i4,	%o3
	fpadd32	%f14,	%f28,	%f0
	popc	%g2,	%g6
	sllx	%l4,	%o0,	%l5
	stx	%l2,	[%l7 + 0x10]
	stx	%o4,	[%l7 + 0x60]
	movpos	%xcc,	%g4,	%i5
	movneg	%icc,	%g5,	%l6
	nop
	fitod	%f4,	%f12
	fdtos	%f12,	%f17
	bcs	loop_2053
	lduh	[%l7 + 0x62],	%o5
	fmovrde	%i1,	%f4,	%f16
	tvs	%icc,	0x7
loop_2053:
	andcc	%i6,	%i2,	%l3
	ldsb	[%l7 + 0x79],	%o7
	movneg	%icc,	%o6,	%i7
	ta	%xcc,	0x7
	fblg,a	%fcc0,	loop_2054
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o1,	%i3,	%g1
	edge32n	%l1,	%l0,	%g3
loop_2054:
	ldd	[%l7 + 0x40],	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f6,	%f26
	fmovdge	%icc,	%f24,	%f13
	sir	0x1E56
	sub	%g7,	%o2,	%i4
	srax	%i0,	%o3,	%g2
	subccc	%g6,	%o0,	%l4
	movgu	%icc,	%l5,	%l2
	udivcc	%g4,	0x019D,	%o4
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
	movrlz	%i5,	%l6,	%o5
	movge	%icc,	%i1,	%i6
	movcc	%xcc,	%i2,	%l3
loop_2055:
	sethi	0x1B2B,	%g5
	fors	%f13,	%f14,	%f26
	fmovsle	%xcc,	%f15,	%f11
	taddcc	%o7,	%o6,	%i7
	sdivcc	%o1,	0x1376,	%i3
	sub	%g1,	%l1,	%l0
	nop
	fitos	%f12,	%f26
	fstod	%f26,	%f24
	stw	%g3,	[%l7 + 0x2C]
	brlez,a	%o2,	loop_2056
	movrne	%i4,	0x179,	%i0
	edge32	%g7,	%o3,	%g6
	tge	%xcc,	0x7
loop_2056:
	sir	0x0847
	ldsw	[%l7 + 0x28],	%g2
	nop
	setx	0xD2A99B2E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x809411B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f27,	%f9
	bgu	loop_2057
	stb	%o0,	[%l7 + 0x0A]
	nop
	setx	loop_2058,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	addccc	%l4,	%l2,	%l5
loop_2057:
	bg,pn	%icc,	loop_2059
	umul	%o4,	0x13C8,	%g4
loop_2058:
	array32	%i5,	%o5,	%l6
	array16	%i1,	%i6,	%i2
loop_2059:
	movpos	%xcc,	%g5,	%l3
	ldd	[%l7 + 0x30],	%o6
	nop
	fitod	%f4,	%f14
	fdtoi	%f14,	%f20
	wr	%g0,	0x52,	%asi
	stxa	%o7,	[%g0 + 0x218] %asi
	bvs,a	%icc,	loop_2060
	taddcc	%i7,	%o1,	%i3
	sth	%g1,	[%l7 + 0x3A]
	fmovsle	%icc,	%f27,	%f15
loop_2060:
	stbar
	brgez	%l0,	loop_2061
	edge16	%g3,	%l1,	%o2
	ldub	[%l7 + 0x7A],	%i0
	edge8n	%i4,	%g7,	%o3
loop_2061:
	te	%xcc,	0x0
	bvs,a,pn	%icc,	loop_2062
	movleu	%xcc,	%g2,	%g6
	orcc	%o0,	%l2,	%l4
	nop
	setx loop_2063, %l0, %l1
	jmpl %l1, %l5
loop_2062:
	movcc	%xcc,	%g4,	%i5
	movne	%icc,	%o5,	%l6
	array8	%o4,	%i1,	%i2
loop_2063:
	srl	%g5,	%l3,	%i6
	orn	%o6,	%o7,	%o1
	fmovsne	%xcc,	%f20,	%f28
	fmovdge	%icc,	%f12,	%f11
	movne	%xcc,	%i3,	%i7
	tpos	%xcc,	0x1
	tn	%xcc,	0x3
	sub	%g1,	%g3,	%l0
	udivcc	%l1,	0x1A2E,	%i0
	wr	%g0,	0x19,	%asi
	stxa	%i4,	[%l7 + 0x10] %asi
	movcc	%xcc,	%o2,	%g7
	fmovdneg	%icc,	%f16,	%f15
	movg	%xcc,	%g2,	%g6
	edge16n	%o0,	%l2,	%l4
	movrlz	%l5,	%o3,	%i5
	movg	%icc,	%o5,	%g4
	xnorcc	%l6,	0x11E2,	%o4
	alignaddrl	%i2,	%i1,	%l3
	move	%xcc,	%i6,	%o6
	edge8l	%o7,	%g5,	%i3
	umul	%o1,	0x12E8,	%i7
	movleu	%xcc,	%g1,	%l0
	udiv	%g3,	0x0B2C,	%i0
	mulx	%i4,	%o2,	%g7
	ba,pn	%xcc,	loop_2064
	movre	%l1,	0x028,	%g6
	srax	%g2,	0x04,	%l2
	movrne	%l4,	0x35D,	%o0
loop_2064:
	tneg	%xcc,	0x6
	tge	%xcc,	0x5
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32n	%l5,	%i5,	%o5
	fnot2	%f12,	%f18
	fmovdle	%icc,	%f23,	%f12
	movvs	%icc,	%o3,	%g4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x2B] %asi,	%o4
	edge8n	%l6,	%i1,	%l3
	sllx	%i2,	%o6,	%o7
	tleu	%icc,	0x0
	sir	0x15A1
	fpadd16s	%f2,	%f28,	%f26
	set	0x40, %o7
	stda	%f0,	[%l7 + %o7] 0xf9
	membar	#Sync
	movle	%icc,	%i6,	%i3
	taddcc	%o1,	0x1F51,	%g5
	sdivx	%i7,	0x1AF5,	%l0
	bvc,a,pn	%xcc,	loop_2065
	orcc	%g3,	%g1,	%i4
	ldsb	[%l7 + 0x6D],	%o2
	movcs	%icc,	%i0,	%g7
loop_2065:
	swap	[%l7 + 0x54],	%g6
	tsubcc	%g2,	0x10B2,	%l2
	sdivx	%l4,	0x15D8,	%o0
	fmovdvs	%xcc,	%f30,	%f2
	movvc	%icc,	%l1,	%i5
	andcc	%o5,	%o3,	%g4
	te	%xcc,	0x5
	array32	%o4,	%l5,	%l6
	bcs,a	loop_2066
	nop
	setx	loop_2067,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%i1,	0x1559,	%l3
	fpackfix	%f16,	%f19
loop_2066:
	nop
	set	0x11, %o6
	ldstuba	[%l7 + %o6] 0x89,	%i2
loop_2067:
	tle	%xcc,	0x2
	fmovdvc	%icc,	%f24,	%f9
	addc	%o6,	0x00EC,	%o7
	fnands	%f5,	%f7,	%f6
	movre	%i3,	%o1,	%i6
	orn	%i7,	%g5,	%l0
	fbuge	%fcc3,	loop_2068
	movl	%xcc,	%g1,	%i4
	flush	%l7 + 0x08
	movrgez	%o2,	%g3,	%g7
loop_2068:
	alignaddrl	%g6,	%g2,	%i0
	fmul8ulx16	%f18,	%f20,	%f0
	edge16n	%l2,	%o0,	%l1
	edge32n	%i5,	%l4,	%o3
	movgu	%icc,	%g4,	%o5
	movrgez	%o4,	0x2CF,	%l5
	movrlz	%i1,	0x0A2,	%l3
	movne	%icc,	%i2,	%l6
	or	%o6,	%o7,	%o1
	movl	%icc,	%i3,	%i6
	brgez,a	%i7,	loop_2069
	nop
	setx loop_2070, %l0, %l1
	jmpl %l1, %g5
	fornot2s	%f16,	%f28,	%f5
	tcs	%xcc,	0x2
loop_2069:
	bge,a,pn	%xcc,	loop_2071
loop_2070:
	movvc	%icc,	%g1,	%l0
	umulcc	%i4,	%o2,	%g7
	fmovsle	%xcc,	%f22,	%f28
loop_2071:
	tgu	%xcc,	0x7
	ldsh	[%l7 + 0x20],	%g3
	orcc	%g2,	%g6,	%l2
	movrlez	%o0,	0x11C,	%i0
	bcc,a,pt	%xcc,	loop_2072
	fpsub32s	%f29,	%f30,	%f17
	tleu	%xcc,	0x2
	add	%l1,	%l4,	%i5
loop_2072:
	nop
	wr	%g0,	0x20,	%asi
	stxa	%g4,	[%g0 + 0x0] %asi
	andn	%o3,	0x1310,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%o5,	%i1
	fmovrslez	%l3,	%f14,	%f23
	stw	%i2,	[%l7 + 0x40]
	fnot2	%f30,	%f2
	movleu	%icc,	%l5,	%l6
	fcmple16	%f10,	%f30,	%o6
	movn	%icc,	%o7,	%o1
	mulx	%i6,	%i7,	%g5
	andn	%i3,	%g1,	%l0
	bvc,pt	%xcc,	loop_2073
	sir	0x0868
	orncc	%i4,	0x1F0B,	%o2
	tvc	%xcc,	0x7
loop_2073:
	fmul8x16al	%f2,	%f17,	%f0
	tsubcctv	%g7,	%g3,	%g2
	tn	%icc,	0x7
	nop
	setx loop_2074, %l0, %l1
	jmpl %l1, %l2
	fnegd	%f16,	%f24
	edge32n	%g6,	%i0,	%l1
	fmovsvc	%icc,	%f1,	%f18
loop_2074:
	movrlez	%o0,	%i5,	%l4
	and	%g4,	%o3,	%o5
	nop
	fitos	%f2,	%f28
	fstod	%f28,	%f8
	subc	%o4,	%l3,	%i1
	std	%f18,	[%l7 + 0x30]
	fnot2s	%f3,	%f24
	fmovdvs	%icc,	%f22,	%f28
	sir	0x1BD4
	edge8	%l5,	%i2,	%l6
	addcc	%o7,	0x1EA8,	%o6
	orcc	%o1,	%i7,	%g5
	tgu	%icc,	0x7
	set	0x75, %g2
	lduba	[%l7 + %g2] 0x0c,	%i6
	set	0x58, %o3
	lduwa	[%l7 + %o3] 0x04,	%i3
	edge32l	%g1,	%i4,	%o2
	tl	%xcc,	0x3
	movne	%xcc,	%l0,	%g3
	edge32n	%g7,	%g2,	%l2
	sllx	%g6,	0x1C,	%i0
	fmuld8sux16	%f21,	%f14,	%f28
	bleu,a	%xcc,	loop_2075
	edge32ln	%o0,	%i5,	%l4
	tcc	%icc,	0x5
	fmovsg	%icc,	%f29,	%f1
loop_2075:
	movvs	%xcc,	%g4,	%o3
	edge32l	%o5,	%o4,	%l3
	wr	%g0,	0x11,	%asi
	sta	%f18,	[%l7 + 0x4C] %asi
	brgz,a	%i1,	loop_2076
	sth	%l1,	[%l7 + 0x28]
	movcc	%xcc,	%i2,	%l5
	edge8ln	%l6,	%o7,	%o6
loop_2076:
	popc	0x1957,	%o1
	set	0x74, %g4
	lda	[%l7 + %g4] 0x88,	%f10
	edge16l	%g5,	%i6,	%i3
	sethi	0x0B49,	%g1
	orn	%i4,	0x039D,	%i7
	movg	%icc,	%l0,	%o2
	fbug,a	%fcc1,	loop_2077
	edge32n	%g7,	%g3,	%l2
	fmovsg	%icc,	%f5,	%f24
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x16,	%f16
loop_2077:
	edge16	%g2,	%i0,	%g6
	tsubcctv	%o0,	0x157C,	%l4
	sdiv	%i5,	0x1F08,	%g4
	fmovdg	%xcc,	%f18,	%f22
	fmovsvs	%icc,	%f26,	%f1
	sdiv	%o5,	0x11E1,	%o4
	std	%f8,	[%l7 + 0x78]
	nop
	setx	0x5DE757BF1BB2881B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xD71062B7DFE9D083,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f26,	%f16
	add	%l3,	%o3,	%l1
	xnorcc	%i1,	0x1D9D,	%i2
	std	%f14,	[%l7 + 0x30]
	sllx	%l6,	0x0A,	%o7
	movrgez	%o6,	%o1,	%l5
	stbar
	st	%f19,	[%l7 + 0x7C]
	movl	%xcc,	%g5,	%i6
	edge32	%i3,	%i4,	%g1
	sub	%l0,	0x18B1,	%o2
	ta	%icc,	0x5
	alignaddrl	%i7,	%g3,	%g7
	fcmpeq16	%f2,	%f4,	%l2
	movrgez	%g2,	0x0E9,	%g6
	srlx	%o0,	%l4,	%i5
	movn	%xcc,	%i0,	%g4
	fones	%f13
	ldub	[%l7 + 0x5D],	%o5
	set	0x71, %g7
	ldstuba	[%l7 + %g7] 0x89,	%o4
	tle	%icc,	0x4
	movvs	%xcc,	%l3,	%o3
	wr	%g0,	0x04,	%asi
	stha	%l1,	[%l7 + 0x0C] %asi
	fmovdneg	%icc,	%f27,	%f23
	edge16ln	%i1,	%l6,	%i2
	bvs,a	loop_2078
	taddcctv	%o6,	%o7,	%l5
	movrlez	%o1,	0x391,	%i6
	bne,pn	%xcc,	loop_2079
loop_2078:
	bvs,a	%xcc,	loop_2080
	alignaddr	%g5,	%i3,	%g1
	nop
	setx	0xFBA1372E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x28F78ECA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f10,	%f8
loop_2079:
	movleu	%icc,	%i4,	%o2
loop_2080:
	nop
	fitos	%f13,	%f19
	fstoi	%f19,	%f21
	andncc	%i7,	%l0,	%g3
	nop
	set	0x08, %l6
	std	%f28,	[%l7 + %l6]
	fsrc2s	%f8,	%f20
	move	%icc,	%g7,	%g2
	sdiv	%l2,	0x08F6,	%o0
	edge16ln	%l4,	%i5,	%i0
	srl	%g4,	0x06,	%g6
	alignaddrl	%o4,	%o5,	%o3
	subcc	%l3,	%l1,	%l6
	fba	%fcc0,	loop_2081
	srlx	%i1,	0x0B,	%i2
	bn,a,pn	%icc,	loop_2082
	bvs,a,pt	%xcc,	loop_2083
loop_2081:
	stbar
	orcc	%o6,	%o7,	%o1
loop_2082:
	nop
	setx	0x8CC45793,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC5B13F11,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f30,	%f24
loop_2083:
	brlz	%l5,	loop_2084
	membar	0x71
	movvc	%xcc,	%i6,	%i3
	fbug,a	%fcc3,	loop_2085
loop_2084:
	stw	%g1,	[%l7 + 0x50]
	udiv	%i4,	0x07BC,	%o2
	set	0x5C, %l1
	swapa	[%l7 + %l1] 0x81,	%g5
loop_2085:
	umul	%l0,	0x1480,	%i7
	tge	%icc,	0x7
	array8	%g7,	%g3,	%g2
	edge16n	%o0,	%l2,	%i5
	fmul8sux16	%f16,	%f4,	%f18
	taddcctv	%i0,	0x01F6,	%l4
	fnors	%f14,	%f3,	%f15
	ldx	[%l7 + 0x20],	%g6
	mulx	%o4,	%g4,	%o5
	fpsub16	%f26,	%f28,	%f30
	ldsw	[%l7 + 0x74],	%l3
	sdivcc	%l1,	0x148F,	%o3
	movvs	%icc,	%l6,	%i2
	edge8n	%o6,	%o7,	%o1
	umul	%i1,	0x1478,	%l5
	sra	%i6,	%i3,	%i4
	movgu	%icc,	%o2,	%g5
	fbn,a	%fcc2,	loop_2086
	nop
	setx loop_2087, %l0, %l1
	jmpl %l1, %l0
	movl	%xcc,	%g1,	%g7
	add	%i7,	%g2,	%g3
loop_2086:
	nop
	set	0x28, %o1
	lduw	[%l7 + %o1],	%l2
loop_2087:
	ldub	[%l7 + 0x23],	%o0
	movrlez	%i5,	0x2FB,	%i0
	fmovrdgz	%g6,	%f26,	%f18
	be,pn	%icc,	loop_2088
	fbo,a	%fcc1,	loop_2089
	fmovrse	%l4,	%f0,	%f23
	ldd	[%l7 + 0x60],	%f24
loop_2088:
	fones	%f20
loop_2089:
	fone	%f4
	umulcc	%g4,	0x15A1,	%o5
	movrgz	%o4,	%l3,	%l1
	fzero	%f28
	tvc	%icc,	0x0
	array32	%o3,	%l6,	%i2
	srax	%o6,	0x19,	%o1
	xor	%i1,	0x124E,	%o7
	movcs	%xcc,	%l5,	%i3
	edge16n	%i4,	%i6,	%g5
	edge32n	%l0,	%g1,	%o2
	subccc	%g7,	0x1C06,	%i7
	sra	%g3,	0x0E,	%l2
	brz,a	%g2,	loop_2090
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc2,	loop_2091
	movre	%i5,	0x368,	%i0
loop_2090:
	taddcc	%o0,	%g6,	%l4
	fcmple32	%f8,	%f16,	%g4
loop_2091:
	membar	0x1A
	movrgz	%o5,	0x3AA,	%o4
	flush	%l7 + 0x0C
	nop
	fitos	%f4,	%f5
	fstox	%f5,	%f0
	fxtos	%f0,	%f27
	movcc	%xcc,	%l1,	%l3
	move	%xcc,	%o3,	%l6
	movgu	%xcc,	%i2,	%o1
	tn	%icc,	0x5
	fmovsgu	%xcc,	%f6,	%f28
	fbuge	%fcc3,	loop_2092
	subc	%i1,	0x16E8,	%o6
	fpmerge	%f23,	%f14,	%f26
	sllx	%l5,	0x06,	%i3
loop_2092:
	sethi	0x048D,	%i4
	fpmerge	%f12,	%f9,	%f12
	set	0x14, %g3
	lduwa	[%l7 + %g3] 0x81,	%i6
	ldub	[%l7 + 0x22],	%o7
	tvc	%xcc,	0x3
	tn	%xcc,	0x5
	movvs	%icc,	%l0,	%g1
	nop
	set	0x74, %o2
	ldsw	[%l7 + %o2],	%o2
	fandnot1	%f24,	%f12,	%f0
	fpadd16s	%f31,	%f29,	%f29
	tcc	%xcc,	0x2
	tgu	%icc,	0x7
	movvs	%icc,	%g7,	%g5
	orncc	%i7,	%g3,	%g2
	movpos	%icc,	%l2,	%i0
	fmul8x16au	%f11,	%f10,	%f22
	tsubcctv	%i5,	%o0,	%l4
	fmovrdlez	%g4,	%f30,	%f24
	movl	%icc,	%g6,	%o5
	xnorcc	%o4,	0x1B0D,	%l1
	bleu,a	loop_2093
	udiv	%o3,	0x1AEB,	%l6
	edge8l	%l3,	%i2,	%o1
	bleu,a,pn	%xcc,	loop_2094
loop_2093:
	subc	%o6,	%i1,	%i3
	movle	%xcc,	%i4,	%l5
	tl	%icc,	0x3
loop_2094:
	fnors	%f14,	%f21,	%f28
	bg,pt	%xcc,	loop_2095
	sdivcc	%o7,	0x0167,	%l0
	nop
	setx	0xE58C6028706F2162,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	sdiv	%g1,	0x0FC2,	%o2
loop_2095:
	tne	%icc,	0x6
	wr	%g0,	0xe3,	%asi
	stha	%g7,	[%l7 + 0x70] %asi
	membar	#Sync
	bgu,a	%icc,	loop_2096
	fbn	%fcc2,	loop_2097
	fmovsvs	%icc,	%f13,	%f22
	bvc,pt	%xcc,	loop_2098
loop_2096:
	ba,a	%xcc,	loop_2099
loop_2097:
	nop
	fitod	%f2,	%f8
	fdtox	%f8,	%f14
	fxtod	%f14,	%f2
	fmovrsne	%i6,	%f8,	%f23
loop_2098:
	fandnot1	%f26,	%f22,	%f2
loop_2099:
	nop
	fitos	%f11,	%f16
	fstoi	%f16,	%f26
	tn	%xcc,	0x0
	fnegs	%f6,	%f9
	membar	0x5F
	sdiv	%g5,	0x04AC,	%g3
	brlz,a	%i7,	loop_2100
	taddcctv	%g2,	%i0,	%l2
	movle	%xcc,	%i5,	%o0
	andcc	%g4,	0x1521,	%g6
loop_2100:
	ta	%icc,	0x6
	umulcc	%o5,	%l4,	%o4
	fmul8ulx16	%f12,	%f0,	%f28
	nop
	fitos	%f1,	%f12
	ldsh	[%l7 + 0x4C],	%o3
	fpsub16s	%f25,	%f8,	%f2
	array32	%l6,	%l3,	%i2
	movneg	%icc,	%l1,	%o6
	edge8n	%i1,	%o1,	%i3
	fzero	%f4
	fmovsg	%xcc,	%f19,	%f29
	udivcc	%i4,	0x17CB,	%o7
	srlx	%l0,	%g1,	%o2
	nop
	setx loop_2101, %l0, %l1
	jmpl %l1, %l5
	array16	%g7,	%g5,	%g3
	fmovd	%f18,	%f22
	bgu	%xcc,	loop_2102
loop_2101:
	nop
	fitod	%f0,	%f26
	fdtox	%f26,	%f10
	tne	%xcc,	0x1
	fcmpne16	%f30,	%f4,	%i6
loop_2102:
	bge,pn	%xcc,	loop_2103
	stb	%i7,	[%l7 + 0x55]
	fsrc2	%f22,	%f24
	movvc	%icc,	%g2,	%i0
loop_2103:
	nop
	setx	loop_2104,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcc	%xcc,	loop_2105
	fmovrslez	%l2,	%f18,	%f22
	brgez	%o0,	loop_2106
loop_2104:
	movre	%g4,	%i5,	%o5
loop_2105:
	fxor	%f4,	%f12,	%f14
	fmovdge	%xcc,	%f22,	%f8
loop_2106:
	orcc	%g6,	0x0AFE,	%l4
	faligndata	%f24,	%f14,	%f18
	tg	%icc,	0x5
	movleu	%xcc,	%o4,	%o3
	sir	0x1720
	edge32ln	%l6,	%l3,	%l1
	sdiv	%o6,	0x0A7E,	%i2
	wr	%g0,	0xe2,	%asi
	stba	%o1,	[%l7 + 0x48] %asi
	membar	#Sync
	udivcc	%i3,	0x0320,	%i1
	fmovrdgz	%o7,	%f16,	%f16
	edge16n	%i4,	%l0,	%g1
	fnegs	%f27,	%f3
	fmovscs	%icc,	%f31,	%f14
	bleu,pn	%icc,	loop_2107
	array32	%o2,	%g7,	%l5
	movne	%xcc,	%g5,	%g3
	nop
	setx	0x07789FC065ABDA65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xC666BDD2974584B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f28,	%f30
loop_2107:
	andcc	%i6,	%i7,	%i0
	fbu,a	%fcc0,	loop_2108
	tge	%xcc,	0x3
	fandnot1s	%f6,	%f11,	%f16
	ldstub	[%l7 + 0x72],	%g2
loop_2108:
	sub	%o0,	0x0778,	%g4
	fblg	%fcc1,	loop_2109
	edge32ln	%l2,	%i5,	%o5
	bge,a	%icc,	loop_2110
	subc	%l4,	0x0730,	%g6
loop_2109:
	sethi	0x0644,	%o4
	prefetch	[%l7 + 0x44],	 0x0
loop_2110:
	udivcc	%l6,	0x1054,	%l3
	bleu,a	%xcc,	loop_2111
	nop
	setx	0x0C695A980FAE6CC7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xD1E0B9CD41C8D091,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f16,	%f20
	fble	%fcc0,	loop_2112
	fmovrsgz	%o3,	%f0,	%f19
loop_2111:
	movleu	%xcc,	%l1,	%o6
	movn	%icc,	%i2,	%o1
loop_2112:
	movg	%icc,	%i3,	%i1
	ldsw	[%l7 + 0x4C],	%i4
	fble	%fcc0,	loop_2113
	fornot1s	%f7,	%f26,	%f7
	fmul8x16	%f30,	%f2,	%f14
	andncc	%l0,	%o7,	%o2
loop_2113:
	orcc	%g1,	0x142D,	%l5
	bne,pt	%xcc,	loop_2114
	fpsub32s	%f1,	%f0,	%f7
	alignaddr	%g5,	%g7,	%g3
	tneg	%xcc,	0x7
loop_2114:
	movvc	%icc,	%i7,	%i0
	addcc	%i6,	0x0804,	%g2
	andcc	%o0,	%g4,	%l2
	be,a	loop_2115
	fmovsg	%icc,	%f18,	%f1
	srlx	%o5,	0x04,	%i5
	edge32ln	%g6,	%o4,	%l4
loop_2115:
	tl	%xcc,	0x5
	fabss	%f29,	%f7
	subccc	%l3,	0x0DE0,	%o3
	tvs	%icc,	0x2
	nop
	fitod	%f0,	%f0
	fdtoi	%f0,	%f5
	set	0x30, %i5
	ldsha	[%l7 + %i5] 0x19,	%l6
	movgu	%xcc,	%o6,	%l1
	nop
	set	0x50, %l2
	lduw	[%l7 + %l2],	%o1
	movrgez	%i2,	%i3,	%i1
	movcs	%icc,	%i4,	%o7
	brnz,a	%o2,	loop_2116
	edge8ln	%l0,	%l5,	%g5
	fpsub32	%f6,	%f22,	%f24
	nop
	setx	0x44CD55E728665035,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xEF9A2525373C68CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f0,	%f14
loop_2116:
	bcs,pt	%icc,	loop_2117
	xnor	%g1,	0x1199,	%g7
	movvc	%icc,	%g3,	%i7
	subccc	%i0,	0x005F,	%i6
loop_2117:
	edge8n	%g2,	%g4,	%o0
	tn	%xcc,	0x2
	orncc	%l2,	%o5,	%g6
	movrlz	%i5,	0x33A,	%l4
	udivcc	%o4,	0x0D6C,	%l3
	fmovdgu	%icc,	%f28,	%f22
	sdivcc	%o3,	0x1C03,	%o6
	movrgez	%l6,	%l1,	%i2
	edge8n	%o1,	%i3,	%i4
	move	%icc,	%o7,	%i1
	fblg,a	%fcc0,	loop_2118
	addc	%o2,	%l0,	%g5
	andncc	%g1,	%l5,	%g3
	tl	%xcc,	0x1
loop_2118:
	bvc	%xcc,	loop_2119
	te	%icc,	0x6
	tn	%icc,	0x3
	tle	%icc,	0x5
loop_2119:
	tneg	%icc,	0x5
	fbne	%fcc0,	loop_2120
	mulx	%i7,	%g7,	%i0
	add	%i6,	0x01FC,	%g4
	sir	0x0A93
loop_2120:
	fpsub16s	%f4,	%f25,	%f16
	udivcc	%g2,	0x04FE,	%l2
	alignaddrl	%o5,	%g6,	%i5
	fmuld8ulx16	%f0,	%f6,	%f26
	xnor	%l4,	0x0BD4,	%o0
	tpos	%xcc,	0x4
	tvs	%xcc,	0x6
	fbl,a	%fcc2,	loop_2121
	movrlez	%o4,	0x244,	%l3
	fnand	%f10,	%f22,	%f26
	udivcc	%o6,	0x1235,	%o3
loop_2121:
	fmovdgu	%xcc,	%f1,	%f15
	movrlz	%l1,	%i2,	%o1
	nop
	setx	loop_2122,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%i3,	0x0913,	%i4
	mulscc	%o7,	0x0110,	%i1
	set	0x70, %i1
	stba	%l6,	[%l7 + %i1] 0x18
loop_2122:
	fandnot1	%f14,	%f24,	%f14
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	srl	%l0,	0x0F,	%o2
	sll	%g5,	%l5,	%g3
	movge	%xcc,	%g1,	%g7
	fmovdpos	%icc,	%f8,	%f20
	edge32	%i0,	%i6,	%g4
	move	%icc,	%g2,	%i7
	tl	%xcc,	0x7
	fbule	%fcc0,	loop_2123
	edge32n	%l2,	%g6,	%i5
	fbu,a	%fcc0,	loop_2124
	udivx	%o5,	0x1934,	%o0
loop_2123:
	movrgez	%l4,	%o4,	%o6
	mulx	%l3,	%l1,	%o3
loop_2124:
	movpos	%xcc,	%i2,	%o1
	edge8n	%i4,	%o7,	%i3
	xorcc	%i1,	0x11C7,	%l0
	mulscc	%o2,	0x18C6,	%g5
	subcc	%l6,	%l5,	%g1
	edge32	%g7,	%g3,	%i0
	and	%i6,	0x1E8A,	%g2
	tsubcc	%i7,	%g4,	%g6
	mulscc	%l2,	0x07F7,	%o5
	fors	%f24,	%f8,	%f20
	fnot1s	%f25,	%f24
	or	%o0,	%i5,	%l4
	smulcc	%o4,	0x093D,	%l3
	nop
	fitod	%f6,	%f2
	fdtoi	%f2,	%f20
	fbug,a	%fcc0,	loop_2125
	fabsd	%f10,	%f6
	tne	%xcc,	0x1
	tge	%icc,	0x3
loop_2125:
	movge	%xcc,	%l1,	%o6
	fnot1s	%f6,	%f28
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i2,	%o3
	fmul8x16	%f22,	%f8,	%f8
	movpos	%xcc,	%o1,	%i4
	addcc	%i3,	0x1018,	%o7
	movne	%icc,	%l0,	%i1
	bpos,a,pn	%xcc,	loop_2126
	orcc	%g5,	0x12B9,	%l6
	wr	%g0,	0x27,	%asi
	stba	%o2,	[%l7 + 0x75] %asi
	membar	#Sync
loop_2126:
	fnegs	%f22,	%f27
	fmovrslez	%l5,	%f13,	%f15
	nop
	setx	0xA2264A2A4055A3B3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	sdiv	%g1,	0x18AF,	%g7
	std	%f12,	[%l7 + 0x38]
	alignaddrl	%i0,	%i6,	%g2
	lduw	[%l7 + 0x3C],	%g3
	andn	%i7,	0x1E2A,	%g4
	alignaddr	%l2,	%o5,	%o0
	edge32n	%i5,	%l4,	%g6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x18,	%l3,	%l1
	xnorcc	%o4,	%i2,	%o3
	move	%xcc,	%o1,	%i4
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o6,	%o7
	brgz,a	%l0,	loop_2127
	fmovda	%icc,	%f23,	%f21
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x2c,	%i0
loop_2127:
	fzeros	%f26
	stb	%g5,	[%l7 + 0x70]
	ldub	[%l7 + 0x6F],	%l6
	wr	%g0,	0xe3,	%asi
	stba	%i3,	[%l7 + 0x75] %asi
	membar	#Sync
	edge8l	%o2,	%l5,	%g7
	te	%xcc,	0x7
	bneg,pt	%icc,	loop_2128
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f14
	fmul8ulx16	%f12,	%f18,	%f2
	bpos,pt	%xcc,	loop_2129
loop_2128:
	edge32n	%i0,	%i6,	%g1
	movrlez	%g3,	%i7,	%g4
	bcc,a,pn	%icc,	loop_2130
loop_2129:
	orncc	%l2,	0x0E9A,	%g2
	tle	%icc,	0x5
	taddcctv	%o5,	%o0,	%l4
loop_2130:
	tgu	%xcc,	0x4
	srax	%i5,	0x14,	%l3
	mulx	%g6,	0x0E51,	%l1
	movleu	%xcc,	%i2,	%o4
	umulcc	%o3,	0x07EB,	%i4
	movcc	%icc,	%o1,	%o6
	subcc	%l0,	0x1D48,	%i1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x08] %asi,	%g5
	set	0x16, %i2
	lduha	[%l7 + %i2] 0x11,	%l6
	fsrc2s	%f6,	%f5
	set	0x18, %l0
	swapa	[%l7 + %l0] 0x0c,	%o7
	fsrc2	%f28,	%f6
	fbule	%fcc1,	loop_2131
	stbar
	bleu,a	%icc,	loop_2132
	nop
	set	0x5C, %i6
	prefetch	[%l7 + %i6],	 0x3
loop_2131:
	nop
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x65] %asi,	%i3
loop_2132:
	movrlz	%o2,	%g7,	%l5
	tpos	%icc,	0x3
	sra	%i6,	0x15,	%g1
	fmovsneg	%icc,	%f18,	%f29
	fmovspos	%icc,	%f9,	%f26
	sethi	0x1862,	%i0
	sub	%i7,	%g4,	%g3
	xorcc	%l2,	0x14EB,	%o5
	nop
	setx	loop_2133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitos	%f0,	%f20
	fstox	%f20,	%f30
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o0,	%g2
loop_2133:
	nop
	set	0x66, %o0
	stba	%i5,	[%l7 + %o0] 0x22
	membar	#Sync
	bn,pn	%xcc,	loop_2134
	tneg	%icc,	0x3
	fbue	%fcc2,	loop_2135
	nop
	set	0x2E, %i0
	ldub	[%l7 + %i0],	%l3
loop_2134:
	taddcc	%l4,	%l1,	%g6
	fmovrsne	%o4,	%f26,	%f26
loop_2135:
	fbl	%fcc0,	loop_2136
	popc	0x0C87,	%i2
	for	%f24,	%f18,	%f10
	edge16n	%i4,	%o1,	%o3
loop_2136:
	sdivcc	%o6,	0x099D,	%i1
	fnegs	%f21,	%f18
	tcc	%xcc,	0x0
	andn	%l0,	0x13E3,	%g5
	sdivcc	%l6,	0x1AAF,	%i3
	edge32	%o7,	%o2,	%l5
	fandnot1	%f30,	%f14,	%f12
	movne	%xcc,	%i6,	%g7
	movg	%xcc,	%g1,	%i7
	subc	%g4,	0x09BA,	%i0
	array8	%l2,	%o5,	%o0
	fbn	%fcc2,	loop_2137
	array16	%g3,	%g2,	%i5
	te	%xcc,	0x3
	fmovdvc	%xcc,	%f23,	%f17
loop_2137:
	ldsw	[%l7 + 0x58],	%l3
	edge8n	%l4,	%l1,	%o4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g6
	sethi	0x19A5,	%i2
	addccc	%i4,	%o3,	%o6
	ldd	[%l7 + 0x18],	%f24
	fbule	%fcc3,	loop_2138
	movrlz	%i1,	%o1,	%l0
	fmovda	%icc,	%f5,	%f24
	fmovdcc	%icc,	%f9,	%f6
loop_2138:
	fmovsgu	%icc,	%f8,	%f20
	andn	%g5,	0x1213,	%i3
	umulcc	%o7,	0x0A03,	%l6
	movn	%icc,	%o2,	%i6
	bge	loop_2139
	movrgez	%l5,	%g1,	%g7
	alignaddrl	%i7,	%g4,	%l2
	fbo	%fcc2,	loop_2140
loop_2139:
	fba	%fcc2,	loop_2141
	movrgez	%i0,	0x367,	%o0
	be,a,pn	%icc,	loop_2142
loop_2140:
	movre	%g3,	0x087,	%o5
loop_2141:
	fmovsge	%xcc,	%f4,	%f22
	sdiv	%i5,	0x1246,	%l3
loop_2142:
	edge32	%g2,	%l1,	%o4
	edge16ln	%l4,	%i2,	%g6
	popc	0x10DB,	%o3
	bn,a	loop_2143
	fmovdleu	%xcc,	%f7,	%f24
	fandnot2s	%f16,	%f4,	%f19
	bvs	%icc,	loop_2144
loop_2143:
	nop
	setx	0x5154E1795D57C8FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f30
	wr	%g0,	0x0c,	%asi
	sta	%f26,	[%l7 + 0x64] %asi
loop_2144:
	sra	%i4,	%i1,	%o1
	tne	%xcc,	0x0
	taddcctv	%o6,	0x1244,	%g5
	tne	%xcc,	0x6
	movne	%xcc,	%l0,	%i3
	set	0x12, %i3
	ldsha	[%l7 + %i3] 0x19,	%l6
	umul	%o7,	%o2,	%i6
	fabss	%f3,	%f23
	edge16ln	%l5,	%g7,	%g1
	tcs	%icc,	0x1
	edge32	%i7,	%g4,	%i0
	sub	%l2,	%o0,	%o5
	fmovrdgz	%i5,	%f10,	%f6
	edge16n	%l3,	%g2,	%l1
	movcc	%icc,	%g3,	%l4
	movl	%icc,	%i2,	%o4
	te	%icc,	0x6
	movg	%icc,	%g6,	%i4
	fbge,a	%fcc0,	loop_2145
	add	%i1,	0x0E8A,	%o1
	tg	%xcc,	0x2
	fandnot2s	%f11,	%f21,	%f1
loop_2145:
	fxnors	%f26,	%f25,	%f22
	fbul,a	%fcc0,	loop_2146
	or	%o6,	%g5,	%o3
	set	0x2F, %g5
	lduba	[%l7 + %g5] 0x19,	%i3
loop_2146:
	nop
	setx	0x50719BEE,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	array32	%l0,	%o7,	%o2
	bl,a	loop_2147
	taddcctv	%i6,	%l5,	%g7
	fors	%f7,	%f27,	%f24
	addccc	%g1,	%i7,	%g4
loop_2147:
	andcc	%i0,	0x01D0,	%l2
	subccc	%o0,	%o5,	%i5
	bg,a	%icc,	loop_2148
	mulx	%l6,	%g2,	%l1
	brlez	%l3,	loop_2149
	nop
	setx	loop_2150,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2148:
	subcc	%l4,	0x0FB8,	%g3
	fbuge	%fcc0,	loop_2151
loop_2149:
	mova	%icc,	%o4,	%g6
loop_2150:
	movgu	%icc,	%i2,	%i1
	add	%i4,	0x1133,	%o1
loop_2151:
	mulscc	%o6,	0x0A1E,	%g5
	srl	%i3,	%o3,	%l0
	subc	%o7,	%i6,	%o2
	movrgz	%g7,	%l5,	%i7
	bgu,pn	%xcc,	loop_2152
	edge32l	%g1,	%i0,	%l2
	edge32l	%g4,	%o5,	%o0
	fble	%fcc1,	loop_2153
loop_2152:
	fba	%fcc1,	loop_2154
	bleu,a,pt	%icc,	loop_2155
	movle	%icc,	%l6,	%g2
loop_2153:
	subc	%i5,	0x039E,	%l1
loop_2154:
	ba,a,pt	%xcc,	loop_2156
loop_2155:
	movle	%xcc,	%l4,	%l3
	udivx	%o4,	0x02A9,	%g6
	xnorcc	%g3,	%i2,	%i4
loop_2156:
	movrgez	%i1,	0x032,	%o6
	tneg	%xcc,	0x5
	fnegd	%f2,	%f30
	ld	[%l7 + 0x70],	%f8
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x81,	%o1,	%i3
	pdist	%f24,	%f16,	%f28
	tvc	%xcc,	0x4
	movvs	%xcc,	%g5,	%o3
	set	0x78, %l4
	ldsba	[%l7 + %l4] 0x19,	%l0
	brgz,a	%i6,	loop_2157
	ldd	[%l7 + 0x30],	%f10
	brlez	%o7,	loop_2158
	fbuge	%fcc2,	loop_2159
loop_2157:
	fbl	%fcc1,	loop_2160
	mova	%xcc,	%o2,	%g7
loop_2158:
	tneg	%icc,	0x7
loop_2159:
	fmovsg	%xcc,	%f0,	%f3
loop_2160:
	nop
	set	0x20, %l5
	ldxa	[%l7 + %l5] 0x88,	%l5
	tl	%xcc,	0x3
	fands	%f31,	%f19,	%f2
	tne	%xcc,	0x4
	andcc	%g1,	%i7,	%i0
	taddcc	%l2,	%o5,	%g4
	fexpand	%f16,	%f26
	bne,a,pt	%xcc,	loop_2161
	movrgz	%o0,	0x296,	%l6
	movge	%icc,	%i5,	%l1
	xor	%g2,	%l3,	%l4
loop_2161:
	mova	%xcc,	%g6,	%g3
	wr	%g0,	0x2a,	%asi
	stwa	%i2,	[%l7 + 0x40] %asi
	membar	#Sync
	tvs	%icc,	0x1
	subc	%o4,	%i1,	%o6
	fbuge	%fcc3,	loop_2162
	tn	%icc,	0x0
	bshuffle	%f2,	%f28,	%f2
	movrlz	%o1,	%i3,	%g5
loop_2162:
	array16	%o3,	%i4,	%l0
	std	%f26,	[%l7 + 0x78]
	fmovs	%f9,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f27,	%f11
	smul	%i6,	0x1027,	%o2
	smulcc	%o7,	0x0D74,	%l5
	fmovdn	%icc,	%f19,	%f22
	tle	%xcc,	0x1
	fmovrsne	%g7,	%f28,	%f10
	edge8	%i7,	%g1,	%i0
	udivcc	%l2,	0x0C1A,	%o5
	te	%icc,	0x6
	tleu	%icc,	0x1
	sir	0x06A1
	fpadd16	%f14,	%f6,	%f16
	movpos	%xcc,	%g4,	%o0
	edge8	%i5,	%l6,	%l1
	tl	%icc,	0x0
	sllx	%g2,	0x01,	%l3
	fbuge,a	%fcc2,	loop_2163
	or	%g6,	%g3,	%l4
	umulcc	%i2,	%i1,	%o6
	movrlez	%o1,	%i3,	%o4
loop_2163:
	bl,pt	%xcc,	loop_2164
	taddcctv	%o3,	0x0CAC,	%g5
	tsubcctv	%l0,	0x0167,	%i4
	edge16	%i6,	%o7,	%o2
loop_2164:
	taddcctv	%l5,	%g7,	%g1
	te	%xcc,	0x6
	udivx	%i0,	0x1A0C,	%i7
	fnot2s	%f31,	%f7
	array8	%o5,	%l2,	%g4
	fmovsg	%icc,	%f24,	%f27
	fbul,a	%fcc0,	loop_2165
	andn	%o0,	0x1360,	%i5
	movge	%icc,	%l6,	%g2
	fmovdcs	%xcc,	%f19,	%f2
loop_2165:
	tneg	%xcc,	0x3
	edge32	%l1,	%g6,	%l3
	movleu	%xcc,	%l4,	%g3
	bleu,a,pt	%icc,	loop_2166
	nop
	setx loop_2167, %l0, %l1
	jmpl %l1, %i2
	sir	0x1EF0
	wr	%g0,	0xe3,	%asi
	stba	%i1,	[%l7 + 0x7F] %asi
	membar	#Sync
loop_2166:
	fnor	%f28,	%f14,	%f2
loop_2167:
	movg	%xcc,	%o1,	%i3
	stx	%o6,	[%l7 + 0x78]
	movg	%icc,	%o4,	%g5
	addccc	%l0,	%o3,	%i6
	fmovdn	%icc,	%f3,	%f9
	tgu	%icc,	0x0
	movrlz	%o7,	0x343,	%i4
	movneg	%xcc,	%o2,	%l5
	edge16n	%g1,	%i0,	%g7
	alignaddrl	%o5,	%l2,	%i7
	movcc	%icc,	%g4,	%i5
	fmovdgu	%xcc,	%f26,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x0
	tcs	%xcc,	0x7
	fmovrdlz	%o0,	%f14,	%f22
	fmovdcs	%xcc,	%f20,	%f24
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x1e,	%f16
	or	%l6,	0x128D,	%g2
	sir	0x0EC6
	tgu	%icc,	0x1
	ldstub	[%l7 + 0x33],	%l1
	tsubcctv	%g6,	0x1263,	%l3
	bcs,a	loop_2168
	stbar
	fmovrdlz	%g3,	%f16,	%f14
	edge16n	%i2,	%l4,	%i1
loop_2168:
	fandnot1s	%f15,	%f25,	%f14
	fandnot1s	%f14,	%f10,	%f28
	alignaddrl	%i3,	%o1,	%o4
	fzeros	%f22
	fbge,a	%fcc0,	loop_2169
	sth	%g5,	[%l7 + 0x56]
	fblg,a	%fcc1,	loop_2170
	fnands	%f28,	%f30,	%f23
loop_2169:
	call	loop_2171
	edge16l	%l0,	%o3,	%i6
loop_2170:
	fabss	%f12,	%f19
	edge32ln	%o6,	%i4,	%o2
loop_2171:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xA3461F16,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xB96080FB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f17,	%f17
	tg	%xcc,	0x3
	mulx	%l5,	0x002A,	%g1
	tleu	%icc,	0x2
	call	loop_2172
	movcs	%xcc,	%o7,	%i0
	xorcc	%o5,	0x0F3D,	%g7
	subccc	%i7,	%l2,	%g4
loop_2172:
	subccc	%o0,	0x1724,	%l6
	tn	%icc,	0x6
	movneg	%icc,	%i5,	%l1
	fmovscc	%xcc,	%f11,	%f22
	edge32	%g6,	%g2,	%l3
	movle	%xcc,	%g3,	%i2
	xorcc	%l4,	%i3,	%i1
	membar	0x3D
	fsrc1	%f18,	%f26
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge8l	%o1,	%o4,	%l0
	fpadd16s	%f19,	%f19,	%f28
	movrgz	%o3,	0x211,	%i6
	sth	%o6,	[%l7 + 0x62]
	fbo,a	%fcc3,	loop_2173
	edge16n	%g5,	%o2,	%l5
	fmovsne	%xcc,	%f27,	%f13
	bcc,a,pn	%icc,	loop_2174
loop_2173:
	fpmerge	%f8,	%f0,	%f10
	stb	%i4,	[%l7 + 0x4C]
	fmovsa	%icc,	%f1,	%f29
loop_2174:
	brlz,a	%g1,	loop_2175
	popc	0x095D,	%i0
	nop
	setx	loop_2176,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdgu	%xcc,	%f23,	%f28
loop_2175:
	fbule,a	%fcc0,	loop_2177
	fmovdn	%icc,	%f29,	%f14
loop_2176:
	umulcc	%o5,	%g7,	%i7
	swap	[%l7 + 0x4C],	%l2
loop_2177:
	brgz	%o7,	loop_2178
	sdivcc	%o0,	0x0EB6,	%g4
	andncc	%i5,	%l1,	%l6
	nop
	setx	0xC1AD5831,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x5B3768FD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f14,	%f0
loop_2178:
	xnorcc	%g2,	%l3,	%g3
	fmovsvs	%xcc,	%f22,	%f25
	tcs	%icc,	0x5
	and	%g6,	0x139B,	%i2
	udiv	%l4,	0x01CD,	%i1
	tpos	%xcc,	0x0
	fcmpgt32	%f2,	%f10,	%o1
	bg	%icc,	loop_2179
	swap	[%l7 + 0x2C],	%o4
	fmovrdlez	%l0,	%f20,	%f26
	edge32	%i3,	%i6,	%o6
loop_2179:
	andncc	%o3,	%o2,	%l5
	movrgz	%i4,	%g1,	%g5
	fornot1	%f4,	%f8,	%f4
	membar	0x75
	andncc	%o5,	%g7,	%i0
	fmovrdlez	%l2,	%f16,	%f8
	alignaddrl	%i7,	%o0,	%g4
	fbe,a	%fcc2,	loop_2180
	fmovsneg	%icc,	%f12,	%f19
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x24] %asi,	%i5
loop_2180:
	nop
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x40] %asi,	%f23
	fbu	%fcc0,	loop_2181
	ta	%xcc,	0x2
	alignaddrl	%l1,	%l6,	%g2
	array8	%o7,	%l3,	%g3
loop_2181:
	bl,a	loop_2182
	tg	%icc,	0x1
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f30
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x26] %asi,	%i2
loop_2182:
	stbar
	movne	%xcc,	%l4,	%g6
	bl	loop_2183
	nop
	setx	loop_2184,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brnz,a	%o1,	loop_2185
	fmovrdlz	%i1,	%f0,	%f28
loop_2183:
	fmovda	%xcc,	%f8,	%f4
loop_2184:
	fbue	%fcc1,	loop_2186
loop_2185:
	bn	loop_2187
	movvs	%xcc,	%l0,	%i3
	set	0x28, %o5
	ldxa	[%g0 + %o5] 0x4f,	%i6
loop_2186:
	alignaddrl	%o6,	%o4,	%o2
loop_2187:
	edge16l	%o3,	%l5,	%g1
	subc	%i4,	%o5,	%g7
	bcs,pt	%icc,	loop_2188
	smul	%g5,	%i0,	%l2
	tsubcc	%o0,	%g4,	%i7
	smul	%i5,	%l6,	%l1
loop_2188:
	mulscc	%g2,	0x18F2,	%l3
	mulscc	%o7,	%g3,	%l4
	edge32l	%i2,	%o1,	%i1
	udivcc	%l0,	0x05E8,	%g6
	umul	%i3,	0x0F68,	%i6
	fbo	%fcc2,	loop_2189
	edge32ln	%o4,	%o6,	%o2
	wr	%g0,	0xf8,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2189:
	stbar
	addccc	%o3,	0x0565,	%l5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i4,	%g1
	tsubcc	%o5,	0x15F3,	%g5
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x68] %asi,	%g7
	movrgez	%l2,	%o0,	%g4
	fpadd16	%f30,	%f22,	%f0
	sllx	%i7,	%i0,	%l6
	edge16n	%l1,	%i5,	%l3
	tpos	%icc,	0x2
	stb	%o7,	[%l7 + 0x30]
	edge16n	%g3,	%l4,	%g2
	udiv	%i2,	0x0518,	%o1
	std	%f18,	[%l7 + 0x60]
	edge8	%l0,	%g6,	%i1
	xor	%i3,	0x05BA,	%o4
	tg	%xcc,	0x0
	orcc	%i6,	0x1FCD,	%o6
	addcc	%o2,	0x0879,	%o3
	fmovsneg	%icc,	%f8,	%f7
	orcc	%i4,	0x1498,	%g1
	sir	0x0616
	alignaddr	%o5,	%g5,	%g7
	sll	%l5,	%o0,	%g4
	bvs	%xcc,	loop_2190
	xor	%i7,	0x148E,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l6,	[%l7 + 0x6F]
loop_2190:
	fbug	%fcc2,	loop_2191
	fmul8sux16	%f28,	%f6,	%f16
	nop
	fitod	%f6,	%f18
	fdtos	%f18,	%f15
	sth	%i0,	[%l7 + 0x78]
loop_2191:
	umulcc	%l1,	0x0DC0,	%i5
	pdist	%f26,	%f0,	%f28
	movpos	%icc,	%l3,	%o7
	nop
	fitod	%f26,	%f0
	movpos	%xcc,	%l4,	%g3
	movge	%icc,	%i2,	%o1
	fmovdleu	%icc,	%f21,	%f11
	srlx	%l0,	%g6,	%g2
	fblg,a	%fcc0,	loop_2192
	nop
	setx	0x06BE08F2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x04DC7146,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f7,	%f10
	fmovs	%f5,	%f14
	xnorcc	%i3,	0x07EF,	%i1
loop_2192:
	fmovrsgez	%o4,	%f20,	%f9
	ldstub	[%l7 + 0x13],	%o6
	fxors	%f25,	%f8,	%f6
	addccc	%o2,	0x1A46,	%i6
	mulx	%i4,	0x0FD2,	%o3
	movne	%xcc,	%g1,	%o5
	xor	%g7,	0x0A11,	%l5
	wr	%g0,	0xeb,	%asi
	stba	%o0,	[%l7 + 0x1B] %asi
	membar	#Sync
	ldsh	[%l7 + 0x10],	%g4
	tpos	%xcc,	0x2
	fmul8sux16	%f18,	%f30,	%f28
	edge32	%i7,	%g5,	%l2
	edge16ln	%i0,	%l1,	%i5
	orncc	%l3,	%o7,	%l6
	alignaddr	%l4,	%i2,	%o1
	set	0x38, %o4
	lduwa	[%l7 + %o4] 0x18,	%g3
	movneg	%xcc,	%l0,	%g2
	fnot2s	%f6,	%f8
	andn	%i3,	0x1C2E,	%g6
	nop
	setx	0xF8F3389E11A5DD5D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x63C7B55EC5F011DC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f22,	%f8
	movrgez	%o4,	%o6,	%i1
	tcs	%icc,	0x3
	add	%o2,	%i4,	%i6
	umul	%g1,	%o5,	%o3
	and	%g7,	0x0E00,	%o0
	bneg,a,pt	%xcc,	loop_2193
	stw	%g4,	[%l7 + 0x6C]
	set	0x70, %o7
	prefetcha	[%l7 + %o7] 0x19,	 0x2
loop_2193:
	orn	%g5,	0x12E2,	%l5
	bcc	loop_2194
	sir	0x008E
	movvs	%xcc,	%i0,	%l2
	movvs	%icc,	%l1,	%l3
loop_2194:
	fbge	%fcc1,	loop_2195
	brnz,a	%i5,	loop_2196
	fbge	%fcc3,	loop_2197
	ldsb	[%l7 + 0x18],	%l6
loop_2195:
	fbl	%fcc0,	loop_2198
loop_2196:
	addc	%l4,	0x18FC,	%o7
loop_2197:
	fmovscc	%xcc,	%f18,	%f25
	udivcc	%o1,	0x0EE7,	%g3
loop_2198:
	tsubcctv	%i2,	0x02BC,	%l0
	nop
	setx	0x3E2D4E87,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x1240803A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f23,	%f11
	subc	%i3,	0x07B4,	%g6
	bgu,pt	%xcc,	loop_2199
	ldd	[%l7 + 0x50],	%o4
	tpos	%icc,	0x4
	orn	%g2,	%o6,	%i1
loop_2199:
	fors	%f0,	%f22,	%f6
	movre	%o2,	0x28A,	%i6
	nop
	fitos	%f6,	%f24
	fstoi	%f24,	%f25
	fbule,a	%fcc0,	loop_2200
	fmovdpos	%xcc,	%f24,	%f18
	fmovdneg	%icc,	%f19,	%f22
	fpadd16s	%f26,	%f17,	%f28
loop_2200:
	fornot2s	%f14,	%f30,	%f0
	te	%xcc,	0x0
	sub	%i4,	%o5,	%g1
	xnorcc	%g7,	0x0F99,	%o0
	sra	%o3,	%i7,	%g5
	fones	%f25
	tg	%icc,	0x2
	move	%icc,	%g4,	%i0
	xnor	%l2,	0x16AC,	%l1
	smulcc	%l3,	%i5,	%l6
	movge	%xcc,	%l5,	%l4
	tle	%xcc,	0x1
	addc	%o1,	%o7,	%g3
	fbuge	%fcc2,	loop_2201
	fpsub32	%f4,	%f24,	%f4
	lduw	[%l7 + 0x0C],	%l0
	movrlz	%i3,	%g6,	%i2
loop_2201:
	orncc	%g2,	%o4,	%i1
	nop
	set	0x0C, %o6
	stb	%o2,	[%l7 + %o6]
	set	0x38, %g2
	ldxa	[%l7 + %g2] 0x89,	%i6
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f26
	tgu	%xcc,	0x0
	popc	%o6,	%o5
	tle	%icc,	0x3
	fxors	%f1,	%f25,	%f28
	sdiv	%i4,	0x1F93,	%g7
	fnors	%f3,	%f23,	%f8
	sll	%o0,	%g1,	%o3
	bleu,a	%icc,	loop_2202
	tsubcc	%g5,	%i7,	%i0
	edge32	%g4,	%l1,	%l3
	set	0x54, %o3
	stha	%l2,	[%l7 + %o3] 0x2a
	membar	#Sync
loop_2202:
	xnor	%i5,	%l6,	%l4
	fpack16	%f12,	%f10
	tgu	%icc,	0x5
	tle	%icc,	0x5
	tne	%icc,	0x2
	edge32l	%o1,	%l5,	%g3
	orncc	%l0,	0x141B,	%i3
	srlx	%g6,	0x19,	%o7
	fands	%f31,	%f23,	%f2
	movleu	%xcc,	%g2,	%o4
	tle	%icc,	0x4
	nop
	fitod	%f2,	%f28
	fdtoi	%f28,	%f22
	tneg	%xcc,	0x2
	srl	%i2,	0x1F,	%i1
	ld	[%l7 + 0x64],	%f1
	umul	%o2,	0x0C52,	%i6
	nop
	set	0x78, %g6
	prefetch	[%l7 + %g6],	 0x1
	fmovrsgez	%o5,	%f23,	%f16
	fandnot1s	%f23,	%f5,	%f26
	set	0x50, %i7
	lduwa	[%l7 + %i7] 0x18,	%i4
	nop
	setx	0xBF4172E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x007A7D5D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f31,	%f19
	taddcctv	%g7,	0x1B8E,	%o6
	alignaddrl	%g1,	%o3,	%o0
	sdivcc	%g5,	0x0722,	%i7
	movvs	%xcc,	%i0,	%g4
	movre	%l3,	0x3DC,	%l2
	fmovdne	%xcc,	%f29,	%f31
	udivcc	%i5,	0x12AA,	%l6
	ldd	[%l7 + 0x30],	%f10
	movrlez	%l1,	0x0EB,	%o1
	mulx	%l5,	%l4,	%g3
	sethi	0x0FF0,	%i3
	fandnot1s	%f4,	%f5,	%f16
	smulcc	%g6,	%o7,	%g2
	fmovsneg	%xcc,	%f27,	%f12
	tvs	%icc,	0x3
	movcs	%xcc,	%l0,	%o4
	sra	%i2,	0x02,	%o2
	srax	%i6,	0x06,	%o5
	std	%f4,	[%l7 + 0x38]
	fbl	%fcc2,	loop_2203
	edge8n	%i1,	%g7,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x3
loop_2203:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2D] %asi,	%g1
	fxors	%f13,	%f25,	%f30
	tneg	%xcc,	0x6
	fbue,a	%fcc0,	loop_2204
	ba	%icc,	loop_2205
	srax	%o3,	%o0,	%o6
	udiv	%i7,	0x1DCA,	%g5
loop_2204:
	tneg	%xcc,	0x0
loop_2205:
	nop
	setx	0x863CC9BA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xDA67C8C5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fadds	%f20,	%f16,	%f26
	movcs	%icc,	%i0,	%g4
	te	%icc,	0x2
	movrgez	%l3,	%i5,	%l2
	alignaddr	%l6,	%o1,	%l1
	srlx	%l4,	%l5,	%g3
	ta	%xcc,	0x6
	nop
	fitos	%f6,	%f5
	fstod	%f5,	%f0
	fmovrse	%i3,	%f19,	%f2
	tge	%icc,	0x7
	set	0x3A, %g7
	stba	%o7,	[%l7 + %g7] 0x22
	membar	#Sync
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x0C] %asi,	%g2
	fsrc2s	%f2,	%f12
	edge32l	%l0,	%g6,	%i2
	movge	%icc,	%o4,	%i6
	andn	%o5,	0x15F0,	%i1
	tsubcctv	%g7,	0x034B,	%i4
	xnorcc	%g1,	%o3,	%o2
	fnor	%f6,	%f0,	%f0
	st	%f15,	[%l7 + 0x30]
	bg,a	%xcc,	loop_2206
	addccc	%o6,	%i7,	%g5
	std	%f28,	[%l7 + 0x38]
	fnot1	%f10,	%f30
loop_2206:
	add	%i0,	%o0,	%g4
	fmovscc	%xcc,	%f9,	%f1
	fmul8x16au	%f2,	%f5,	%f14
	edge32	%l3,	%l2,	%l6
	movre	%o1,	%l1,	%i5
	sethi	0x0A04,	%l5
	flush	%l7 + 0x58
	popc	0x0185,	%l4
	fbn	%fcc1,	loop_2207
	movcs	%xcc,	%g3,	%i3
	sra	%o7,	%l0,	%g6
	set	0x64, %l6
	lduba	[%l7 + %l6] 0x10,	%g2
loop_2207:
	ba	%icc,	loop_2208
	addc	%i2,	0x1FA2,	%i6
	sub	%o4,	0x0622,	%o5
	brgez	%i1,	loop_2209
loop_2208:
	ta	%icc,	0x0
	taddcctv	%i4,	0x0463,	%g1
	subccc	%g7,	%o2,	%o6
loop_2209:
	movvs	%xcc,	%o3,	%i7
	movn	%xcc,	%i0,	%g5
	movrgz	%g4,	%l3,	%l2
	movn	%xcc,	%o0,	%o1
	orn	%l1,	%i5,	%l5
	fbge	%fcc1,	loop_2210
	movvc	%xcc,	%l4,	%l6
	fzero	%f18
	tl	%xcc,	0x7
loop_2210:
	edge32l	%g3,	%o7,	%i3
	fmovrdlez	%g6,	%f12,	%f28
	sdivx	%g2,	0x03C5,	%i2
	tvc	%xcc,	0x6
	set	0x70, %l1
	sta	%f23,	[%l7 + %l1] 0x15
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%i6,	%l0
	te	%xcc,	0x7
	movl	%icc,	%o5,	%o4
	brnz	%i4,	loop_2211
	fbl,a	%fcc3,	loop_2212
	fmovrdlz	%g1,	%f2,	%f8
	bn,pt	%icc,	loop_2213
loop_2211:
	nop
	fitod	%f4,	%f8
	fdtos	%f8,	%f29
loop_2212:
	nop
	set	0x1C, %g4
	sta	%f31,	[%l7 + %g4] 0x11
loop_2213:
	sth	%g7,	[%l7 + 0x24]
	ble	%xcc,	loop_2214
	sdiv	%o2,	0x0965,	%i1
	fpsub32s	%f24,	%f13,	%f5
	mulscc	%o3,	%o6,	%i0
loop_2214:
	movneg	%xcc,	%g5,	%g4
	edge32n	%l3,	%l2,	%i7
	andn	%o0,	%o1,	%l1
	tgu	%icc,	0x4
	edge8ln	%l5,	%i5,	%l6
	movrne	%l4,	%o7,	%i3
	sir	0x0114
	tvc	%icc,	0x5
	fpsub32s	%f30,	%f17,	%f3
	smul	%g6,	0x123B,	%g2
	alignaddrl	%g3,	%i2,	%i6
	set	0x33, %o1
	lduba	[%l7 + %o1] 0x0c,	%o5
	movvc	%icc,	%l0,	%o4
	tle	%icc,	0x2
	set	0x38, %g3
	ldsba	[%l7 + %g3] 0x80,	%i4
	tl	%icc,	0x5
	fbug	%fcc1,	loop_2215
	movleu	%icc,	%g1,	%o2
	add	%g7,	%o3,	%o6
	movvc	%icc,	%i0,	%i1
loop_2215:
	udivcc	%g5,	0x11ED,	%g4
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	umulcc	%l2,	%l3,	%o0
	bpos,a	loop_2216
	nop
	fitod	%f12,	%f22
	fdtoi	%f22,	%f19
	smul	%o1,	0x0B95,	%i7
	tcc	%xcc,	0x1
loop_2216:
	movgu	%icc,	%l5,	%i5
	fmovsa	%icc,	%f18,	%f8
	nop
	setx	0x73CBFD7D2B9C47D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x643CADED7B5D324F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f26,	%f20
	st	%f2,	[%l7 + 0x44]
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x57] %asi,	%l6
	sub	%l4,	0x17AD,	%l1
	sdivx	%i3,	0x1967,	%o7
	nop
	setx	0x415A50C8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xA33BA244,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f3,	%f29
	tneg	%icc,	0x0
	edge32l	%g2,	%g3,	%g6
	array8	%i2,	%i6,	%o5
	bvc	loop_2217
	tneg	%icc,	0x4
	fbul	%fcc2,	loop_2218
	edge16	%o4,	%l0,	%g1
loop_2217:
	fbl,a	%fcc1,	loop_2219
	fmovsvs	%xcc,	%f14,	%f27
loop_2218:
	tleu	%xcc,	0x4
	srax	%o2,	%g7,	%i4
loop_2219:
	fbule	%fcc2,	loop_2220
	bge	%icc,	loop_2221
	fsrc2s	%f7,	%f8
	fmovsle	%icc,	%f3,	%f29
loop_2220:
	sllx	%o3,	%o6,	%i0
loop_2221:
	taddcc	%i1,	%g4,	%l2
	fbu	%fcc2,	loop_2222
	tle	%icc,	0x4
	srl	%g5,	%o0,	%l3
	bpos,a,pn	%xcc,	loop_2223
loop_2222:
	sra	%o1,	%l5,	%i5
	xorcc	%i7,	0x0297,	%l6
	xnorcc	%l4,	0x1931,	%i3
loop_2223:
	fmovsgu	%xcc,	%f31,	%f21
	ba,a,pt	%icc,	loop_2224
	ldsb	[%l7 + 0x7A],	%l1
	orn	%o7,	%g2,	%g3
	edge32	%i2,	%g6,	%o5
loop_2224:
	tvc	%icc,	0x2
	movn	%xcc,	%o4,	%i6
	tn	%icc,	0x6
	nop
	setx	0x801EA01A107A77A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovdg	%xcc,	%f19,	%f28
	ldub	[%l7 + 0x24],	%g1
	fnot1	%f0,	%f20
	movrgez	%l0,	0x26E,	%g7
	movle	%icc,	%o2,	%o3
	sllx	%i4,	0x14,	%i0
	set	0x2C, %o2
	ldstuba	[%l7 + %o2] 0x88,	%i1
	movg	%icc,	%g4,	%l2
	alignaddrl	%g5,	%o0,	%l3
	orn	%o1,	%l5,	%o6
	array8	%i7,	%i5,	%l6
	orn	%i3,	%l4,	%o7
	fcmpeq32	%f16,	%f10,	%l1
	and	%g3,	%i2,	%g6
	st	%f31,	[%l7 + 0x60]
	movcs	%icc,	%o5,	%g2
	udivcc	%i6,	0x1A20,	%o4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x5D] %asi,	%g1
	movpos	%xcc,	%l0,	%g7
	brz,a	%o3,	loop_2225
	bge,a	loop_2226
	movneg	%xcc,	%i4,	%o2
	addc	%i0,	%g4,	%i1
loop_2225:
	bshuffle	%f20,	%f30,	%f12
loop_2226:
	sth	%l2,	[%l7 + 0x14]
	andcc	%o0,	0x158D,	%l3
	fmovrsgez	%g5,	%f20,	%f4
	subc	%o1,	0x1232,	%o6
	fbul,a	%fcc0,	loop_2227
	movcc	%icc,	%l5,	%i5
	add	%l6,	%i7,	%i3
	set	0x73, %l2
	lduba	[%l7 + %l2] 0x15,	%o7
loop_2227:
	orcc	%l4,	%g3,	%i2
	std	%f26,	[%l7 + 0x18]
	edge8l	%l1,	%o5,	%g6
	movle	%icc,	%g2,	%o4
	fand	%f10,	%f28,	%f30
	movneg	%icc,	%g1,	%l0
	fnands	%f8,	%f14,	%f20
	bleu,a	%xcc,	loop_2228
	umulcc	%g7,	%i6,	%o3
	set	0x40, %i5
	stwa	%o2,	[%l7 + %i5] 0x81
loop_2228:
	xnorcc	%i0,	%i4,	%i1
	nop
	fitod	%f2,	%f4
	fdtoi	%f4,	%f15
	udivcc	%g4,	0x04D3,	%l2
	movpos	%xcc,	%o0,	%g5
	ble,a,pn	%xcc,	loop_2229
	movvc	%icc,	%l3,	%o1
	udiv	%o6,	0x1047,	%l5
	bl	loop_2230
loop_2229:
	tvc	%icc,	0x1
	ble,a	loop_2231
	bg,a,pt	%xcc,	loop_2232
loop_2230:
	fxnor	%f30,	%f26,	%f2
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%l6
loop_2231:
	sdiv	%i5,	0x1202,	%i3
loop_2232:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i7,	%o7,	%g3
	umulcc	%i2,	0x03C0,	%l4
	edge32ln	%l1,	%o5,	%g2
	stx	%g6,	[%l7 + 0x68]
	tleu	%icc,	0x3
	ldsh	[%l7 + 0x30],	%o4
	umul	%g1,	%l0,	%g7
	sub	%i6,	0x1856,	%o3
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%i4
	fbe,a	%fcc0,	loop_2233
	taddcctv	%i1,	0x058F,	%i0
	movne	%xcc,	%l2,	%g4
	movrlz	%o0,	0x28C,	%l3
loop_2233:
	movleu	%icc,	%o1,	%g5
	umulcc	%l5,	0x1FF0,	%l6
	brz,a	%o6,	loop_2234
	fandnot1s	%f15,	%f27,	%f8
	lduh	[%l7 + 0x7C],	%i5
	alignaddr	%i7,	%i3,	%o7
loop_2234:
	nop
	set	0x28, %i1
	prefetcha	[%l7 + %i1] 0x14,	 0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l4,	%i2,	%l1
	addccc	%o5,	0x0765,	%g2
	srl	%o4,	%g6,	%g1
	tgu	%xcc,	0x4
	stbar
	fmovsa	%icc,	%f18,	%f29
	te	%xcc,	0x3
	tg	%xcc,	0x6
	nop
	fitos	%f5,	%f27
	fstox	%f27,	%f20
	fxtos	%f20,	%f6
	fmovrse	%g7,	%f20,	%f29
	sllx	%l0,	%i6,	%o2
	stw	%i4,	[%l7 + 0x70]
	fmovde	%icc,	%f13,	%f3
	nop
	set	0x68, %g1
	ldd	[%l7 + %g1],	%f26
	edge16n	%o3,	%i1,	%i0
	fmovrsgez	%g4,	%f24,	%f12
	set	0x20, %l3
	ldswa	[%l7 + %l3] 0x19,	%l2
	xorcc	%o0,	%l3,	%o1
	fba	%fcc2,	loop_2235
	fbo,a	%fcc3,	loop_2236
	tgu	%icc,	0x4
	tsubcc	%g5,	0x11E5,	%l6
loop_2235:
	orcc	%o6,	%i5,	%l5
loop_2236:
	movrlez	%i3,	%o7,	%g3
	ldsb	[%l7 + 0x64],	%l4
	tl	%xcc,	0x6
	fornot1	%f8,	%f12,	%f16
	xnor	%i2,	%i7,	%o5
	fblg,a	%fcc0,	loop_2237
	srl	%g2,	0x13,	%o4
	movrgez	%g6,	%l1,	%g7
	for	%f14,	%f4,	%f0
loop_2237:
	tpos	%xcc,	0x0
	fmovdneg	%icc,	%f15,	%f6
	subccc	%l0,	%g1,	%o2
	edge16n	%i6,	%o3,	%i4
	ldsh	[%l7 + 0x20],	%i1
	nop
	setx	0xF05056EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	wr	%g0,	0x2b,	%asi
	stba	%i0,	[%l7 + 0x0C] %asi
	membar	#Sync
	andcc	%l2,	%o0,	%l3
	bpos,pt	%xcc,	loop_2238
	tge	%icc,	0x2
	fmovsgu	%icc,	%f3,	%f10
	orncc	%g4,	0x1DF0,	%g5
loop_2238:
	edge32l	%l6,	%o1,	%i5
	fbu	%fcc0,	loop_2239
	edge16l	%o6,	%i3,	%l5
	sdiv	%g3,	0x0DFA,	%l4
	xnor	%i2,	%o7,	%o5
loop_2239:
	fmul8x16	%f2,	%f14,	%f24
	xor	%g2,	%i7,	%g6
	fmovscc	%icc,	%f2,	%f31
	fcmpeq16	%f28,	%f6,	%l1
	edge8ln	%o4,	%g7,	%g1
	bvc,a,pt	%icc,	loop_2240
	xor	%o2,	%l0,	%o3
	movcc	%xcc,	%i6,	%i1
	fmovdvc	%xcc,	%f16,	%f5
loop_2240:
	edge32l	%i0,	%l2,	%o0
	fsrc2	%f2,	%f6
	set	0x1C, %i2
	ldswa	[%l7 + %i2] 0x80,	%i4
	umul	%g4,	0x1E14,	%g5
	fcmpeq32	%f2,	%f12,	%l6
	movpos	%icc,	%o1,	%l3
	umulcc	%i5,	0x1B72,	%o6
	sdiv	%l5,	0x0E43,	%g3
	lduw	[%l7 + 0x20],	%i3
	brgz,a	%l4,	loop_2241
	fbo,a	%fcc3,	loop_2242
	fbge,a	%fcc2,	loop_2243
	nop
	fitod	%f8,	%f16
	fdtox	%f16,	%f8
	fxtod	%f8,	%f4
loop_2241:
	move	%xcc,	%i2,	%o5
loop_2242:
	movrgez	%o7,	0x248,	%i7
loop_2243:
	edge8n	%g2,	%g6,	%o4
	mulx	%g7,	0x028A,	%l1
	nop
	setx	0xD8F408044DC28E77,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f30
	tvs	%xcc,	0x7
	movneg	%xcc,	%o2,	%g1
	edge16ln	%o3,	%i6,	%i1
	xnorcc	%l0,	0x13FA,	%l2
	fpadd16	%f8,	%f24,	%f12
	nop
	setx	0x1D489FC3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xB501CA2F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f25,	%f18
	nop
	setx	0x807D61A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	set	0x58, %l0
	lduwa	[%l7 + %l0] 0x15,	%o0
	fbl	%fcc0,	loop_2244
	nop
	setx	loop_2245,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%i4,	%i0,	%g4
	edge16	%g5,	%l6,	%o1
loop_2244:
	tg	%icc,	0x2
loop_2245:
	bleu	%icc,	loop_2246
	movl	%icc,	%l3,	%o6
	orcc	%i5,	%l5,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2246:
	andn	%l4,	%i2,	%o5
	edge16ln	%i3,	%o7,	%i7
	udiv	%g2,	0x0310,	%g6
	xorcc	%g7,	%o4,	%l1
	movl	%xcc,	%o2,	%o3
	tvc	%icc,	0x7
	alignaddrl	%g1,	%i1,	%i6
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x44] %asi,	%l2
	stb	%l0,	[%l7 + 0x3F]
	fpmerge	%f9,	%f12,	%f2
	mulx	%i4,	%o0,	%g4
	fmovdneg	%icc,	%f15,	%f26
	add	%g5,	%l6,	%i0
	smulcc	%l3,	0x1822,	%o1
	fmovrdlz	%i5,	%f12,	%f22
	fbug	%fcc2,	loop_2247
	movrlez	%o6,	0x044,	%g3
	edge16n	%l5,	%i2,	%l4
	call	loop_2248
loop_2247:
	alignaddr	%i3,	%o5,	%o7
	nop
	setx	0x506FF5FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	fbne,a	%fcc3,	loop_2249
loop_2248:
	subcc	%g2,	0x12C7,	%g6
	fcmpne32	%f18,	%f16,	%i7
	taddcc	%o4,	0x070D,	%g7
loop_2249:
	tleu	%xcc,	0x6
	subc	%l1,	%o2,	%o3
	movneg	%xcc,	%i1,	%i6
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
	array16	%g1,	%l0,	%i4
	edge16	%g4,	%g5,	%l6
	fmovsge	%icc,	%f23,	%f8
	move	%icc,	%o0,	%i0
	xorcc	%l3,	0x07F5,	%i5
	movne	%xcc,	%o1,	%g3
	movrgz	%o6,	%i2,	%l5
	tne	%xcc,	0x2
	edge32ln	%i3,	%l4,	%o5
	wr	%g0,	0x80,	%asi
	sta	%f6,	[%l7 + 0x24] %asi
	fmovdle	%xcc,	%f15,	%f10
	fpack16	%f14,	%f19
	tpos	%xcc,	0x2
	smul	%g2,	%o7,	%i7
	movpos	%xcc,	%o4,	%g6
	nop
	setx	0x97AF453BCE509575,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x6730DA3649A8AA5E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f20,	%f18
	fblg	%fcc2,	loop_2250
	fmovdg	%xcc,	%f19,	%f20
	tsubcctv	%l1,	%g7,	%o2
	fnor	%f30,	%f2,	%f30
loop_2250:
	nop
	wr	%g0,	0x18,	%asi
	sta	%f19,	[%l7 + 0x28] %asi
	fmovrdlez	%i1,	%f28,	%f12
	mova	%xcc,	%o3,	%l2
	stb	%g1,	[%l7 + 0x42]
	xorcc	%l0,	%i6,	%i4
	movneg	%icc,	%g5,	%l6
	move	%icc,	%g4,	%o0
	fmovdcs	%icc,	%f23,	%f6
	fsrc1s	%f30,	%f9
	sllx	%i0,	0x10,	%i5
	faligndata	%f12,	%f2,	%f30
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f5
	movrlez	%l3,	0x366,	%o1
	sethi	0x1479,	%o6
	edge8	%i2,	%g3,	%l5
	bshuffle	%f4,	%f18,	%f16
	movrgez	%l4,	0x054,	%o5
	nop
	fitos	%f7,	%f28
	fstoi	%f28,	%f13
	set	0x3C, %o0
	stba	%g2,	[%l7 + %o0] 0x2f
	membar	#Sync
	movg	%xcc,	%i3,	%o7
	nop
	setx loop_2251, %l0, %l1
	jmpl %l1, %i7
	sll	%o4,	%l1,	%g7
	prefetch	[%l7 + 0x48],	 0x2
	wr	%g0,	0x10,	%asi
	sta	%f20,	[%l7 + 0x28] %asi
loop_2251:
	movrgz	%g6,	0x2BF,	%i1
	xnor	%o2,	%l2,	%o3
	mova	%xcc,	%g1,	%i6
	nop
	setx	0xED0949F9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x867E3C40,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f21,	%f20
	movle	%icc,	%i4,	%l0
	fmovsne	%icc,	%f4,	%f5
	tle	%icc,	0x3
	umul	%g5,	%g4,	%l6
	movrlz	%o0,	0x0D3,	%i0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x11,	%l3,	%i5
	movne	%icc,	%o6,	%i2
	edge8n	%o1,	%g3,	%l5
	addccc	%o5,	%l4,	%g2
	movle	%icc,	%i3,	%o7
	movrne	%i7,	0x091,	%l1
	movpos	%xcc,	%o4,	%g7
	andn	%g6,	0x0EAE,	%o2
	movgu	%icc,	%i1,	%l2
	xnor	%o3,	0x19AE,	%i6
	ldd	[%l7 + 0x60],	%f28
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x34] %asi,	%f26
	xorcc	%i4,	%l0,	%g1
	bvc,a,pn	%icc,	loop_2252
	fmuld8ulx16	%f1,	%f8,	%f26
	fmovrdlez	%g4,	%f24,	%f14
	movrgz	%g5,	0x006,	%l6
loop_2252:
	fcmpeq16	%f0,	%f4,	%i0
	movre	%o0,	%i5,	%o6
	bgu,pn	%icc,	loop_2253
	movl	%xcc,	%i2,	%l3
	nop
	fitod	%f20,	%f26
	fmovrsgez	%g3,	%f31,	%f17
loop_2253:
	addc	%o1,	%l5,	%o5
	or	%l4,	%i3,	%o7
	tcs	%icc,	0x5
	srl	%g2,	0x18,	%l1
	andcc	%o4,	%i7,	%g7
	fmul8x16au	%f31,	%f9,	%f22
	smul	%o2,	%i1,	%l2
	sir	0x0A01
	srlx	%g6,	%i6,	%o3
	movvc	%icc,	%l0,	%g1
	fornot2s	%f2,	%f20,	%f16
	lduh	[%l7 + 0x66],	%g4
	bvc	%xcc,	loop_2254
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f30
	fxtod	%f30,	%f30
	xor	%i4,	%g5,	%i0
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x08] %asi,	%l6
loop_2254:
	tvs	%xcc,	0x4
	edge8ln	%i5,	%o6,	%o0
	or	%l3,	%g3,	%i2
	set	0x7C, %i0
	ldswa	[%l7 + %i0] 0x19,	%o1
	fbg	%fcc0,	loop_2255
	fabsd	%f22,	%f18
	sdivx	%l5,	0x1769,	%l4
	bleu,a,pn	%icc,	loop_2256
loop_2255:
	movle	%xcc,	%o5,	%o7
	sdivx	%i3,	0x13B3,	%l1
	addcc	%g2,	%o4,	%i7
loop_2256:
	te	%xcc,	0x4
	and	%o2,	%g7,	%l2
	andn	%g6,	%i6,	%o3
	edge8ln	%i1,	%l0,	%g4
	smulcc	%i4,	%g1,	%i0
	fmovrdlz	%g5,	%f8,	%f20
	ld	[%l7 + 0x5C],	%f7
	stx	%l6,	[%l7 + 0x40]
	movcs	%icc,	%o6,	%o0
	tne	%icc,	0x0
	tg	%xcc,	0x3
	membar	0x3D
	edge8	%l3,	%i5,	%i2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o1,	%l5
	nop
	setx	0x60693700,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	orcc	%l4,	0x0254,	%o5
	tcs	%xcc,	0x1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x13] %asi,	%o7
	fandnot2s	%f11,	%f0,	%f25
	movneg	%icc,	%g3,	%i3
	edge8ln	%g2,	%l1,	%i7
	movge	%icc,	%o4,	%o2
	tle	%icc,	0x3
	stb	%g7,	[%l7 + 0x32]
	edge32ln	%l2,	%g6,	%o3
	stb	%i1,	[%l7 + 0x1C]
	fbug,a	%fcc1,	loop_2257
	edge32n	%i6,	%l0,	%i4
	array32	%g1,	%g4,	%g5
	fmovdne	%xcc,	%f6,	%f3
loop_2257:
	movrgz	%l6,	%o6,	%i0
	srlx	%o0,	0x14,	%i5
	fornot2s	%f13,	%f12,	%f10
	sub	%i2,	0x0F05,	%l3
	fsrc1s	%f28,	%f12
	call	loop_2258
	subc	%o1,	0x1A23,	%l5
	movrlez	%l4,	%o5,	%o7
	ba	%xcc,	loop_2259
loop_2258:
	bleu	loop_2260
	fbne,a	%fcc3,	loop_2261
	addcc	%g3,	0x0593,	%g2
loop_2259:
	fandnot1s	%f2,	%f1,	%f8
loop_2260:
	edge32n	%i3,	%i7,	%l1
loop_2261:
	bleu,pn	%xcc,	loop_2262
	movcs	%xcc,	%o2,	%g7
	std	%f22,	[%l7 + 0x18]
	array16	%o4,	%l2,	%g6
loop_2262:
	andncc	%i1,	%o3,	%i6
	fcmple32	%f4,	%f14,	%i4
	addc	%g1,	0x1917,	%g4
	tsubcc	%g5,	%l6,	%l0
	sll	%o6,	%o0,	%i0
	nop
	set	0x58, %i6
	ldd	[%l7 + %i6],	%f16
	move	%icc,	%i5,	%l3
	prefetch	[%l7 + 0x3C],	 0x2
	nop
	setx	0x25D6A735FF71B14E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f6
	wr	%g0,	0xe2,	%asi
	stha	%o1,	[%l7 + 0x34] %asi
	membar	#Sync
	subcc	%i2,	0x0B4F,	%l5
	tvc	%xcc,	0x0
	udivx	%l4,	0x1E25,	%o7
	fmovsg	%icc,	%f23,	%f7
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%o5
	fble,a	%fcc0,	loop_2263
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f16,	%f14,	%f10
	srl	%g3,	%g2,	%i3
loop_2263:
	udiv	%l1,	0x02BA,	%i7
	xor	%g7,	0x1223,	%o2
	movre	%l2,	0x3C3,	%g6
	tcc	%icc,	0x3
	xnorcc	%i1,	%o3,	%o4
	sllx	%i4,	0x1F,	%g1
	sdiv	%i6,	0x1B52,	%g5
	fpmerge	%f1,	%f30,	%f14
	orncc	%g4,	0x1D9F,	%l6
	fmovrdgez	%o6,	%f12,	%f8
	fpsub32s	%f5,	%f20,	%f26
	tsubcctv	%o0,	0x0D1B,	%i0
	movneg	%icc,	%l0,	%i5
	fmovsge	%icc,	%f26,	%f11
	nop
	setx	0x84A494BDA7FF78BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x6637C4FD1D65E033,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f30,	%f8
	mova	%icc,	%o1,	%i2
	bleu,a	loop_2264
	popc	0x0136,	%l5
	movn	%icc,	%l3,	%l4
	addccc	%o7,	0x0826,	%g3
loop_2264:
	smulcc	%o5,	0x0714,	%i3
	orcc	%l1,	0x1F74,	%i7
	orncc	%g7,	%o2,	%l2
	fmovrslez	%g2,	%f16,	%f14
	orcc	%g6,	0x1F8E,	%i1
	fcmple16	%f2,	%f28,	%o3
	andncc	%o4,	%g1,	%i4
	fblg,a	%fcc3,	loop_2265
	movcc	%icc,	%i6,	%g4
	add	%g5,	0x089A,	%o6
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f15
loop_2265:
	fabsd	%f26,	%f20
	udivcc	%o0,	0x1757,	%l6
	fsrc2s	%f5,	%f14
	edge32n	%i0,	%l0,	%o1
	movvs	%icc,	%i2,	%l5
	movneg	%icc,	%l3,	%i5
	move	%icc,	%l4,	%g3
	orcc	%o5,	0x0C17,	%i3
	sdiv	%o7,	0x12C5,	%l1
	fmovsneg	%icc,	%f24,	%f10
	srlx	%i7,	0x19,	%g7
	udivcc	%o2,	0x16ED,	%g2
	fmovse	%icc,	%f8,	%f14
	xor	%l2,	%g6,	%i1
	fmul8sux16	%f14,	%f12,	%f22
	fornot1	%f2,	%f4,	%f30
	addccc	%o4,	0x0A11,	%g1
	for	%f24,	%f6,	%f26
	fmuld8sux16	%f11,	%f18,	%f28
	taddcc	%o3,	0x12BE,	%i4
	nop
	fitos	%f5,	%f22
	fstox	%f22,	%f2
	stw	%g4,	[%l7 + 0x28]
	set	0x75, %i3
	lduba	[%l7 + %i3] 0x04,	%g5
	fandnot1	%f26,	%f22,	%f8
	movvc	%icc,	%i6,	%o0
	fornot1	%f14,	%f22,	%f20
	fbg,a	%fcc2,	loop_2266
	edge32l	%l6,	%o6,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i0,	0x0BB7,	%o1
loop_2266:
	fnegd	%f4,	%f8
	tcc	%icc,	0x2
	fzero	%f0
	tle	%icc,	0x5
	xnor	%l5,	0x0663,	%i2
	smulcc	%i5,	%l3,	%l4
	te	%icc,	0x3
	ldd	[%l7 + 0x08],	%g2
	fmovdcc	%xcc,	%f27,	%f7
	tgu	%icc,	0x3
	tvs	%icc,	0x3
	ldd	[%l7 + 0x30],	%o4
	tne	%icc,	0x5
	and	%o7,	%i3,	%i7
	fbuge	%fcc1,	loop_2267
	srax	%l1,	%o2,	%g7
	sdivcc	%g2,	0x13D7,	%l2
	te	%xcc,	0x4
loop_2267:
	tpos	%xcc,	0x2
	edge16ln	%i1,	%g6,	%g1
	fmovdgu	%xcc,	%f12,	%f23
	movl	%xcc,	%o4,	%i4
	ldstub	[%l7 + 0x28],	%o3
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%g4
	ld	[%l7 + 0x58],	%f0
	sth	%i6,	[%l7 + 0x64]
	fbl	%fcc0,	loop_2268
	addccc	%g5,	%o0,	%o6
	brnz	%l6,	loop_2269
	udiv	%l0,	0x0734,	%o1
loop_2268:
	movre	%i0,	0x12F,	%i2
	udivcc	%l5,	0x12EE,	%i5
loop_2269:
	movrlez	%l3,	%l4,	%o5
	addcc	%o7,	%g3,	%i7
	ba,a	%icc,	loop_2270
	fmovsleu	%icc,	%f11,	%f14
	movrgez	%i3,	0x2E8,	%l1
	edge16ln	%g7,	%g2,	%o2
loop_2270:
	bgu	%xcc,	loop_2271
	orncc	%l2,	0x0574,	%i1
	fandnot2	%f16,	%f4,	%f2
	fmovsneg	%xcc,	%f1,	%f23
loop_2271:
	srl	%g1,	0x17,	%o4
	sll	%g6,	%i4,	%o3
	tne	%icc,	0x3
	tne	%icc,	0x1
	fornot2s	%f11,	%f29,	%f1
	movrgz	%g4,	0x26D,	%i6
	wr	%g0,	0xeb,	%asi
	stwa	%g5,	[%l7 + 0x60] %asi
	membar	#Sync
	sll	%o0,	%l6,	%l0
	array32	%o1,	%i0,	%i2
	tgu	%icc,	0x6
	fandnot1	%f20,	%f12,	%f2
	fnot1	%f26,	%f30
	movl	%xcc,	%o6,	%l5
	ldx	[%l7 + 0x50],	%i5
	set	0x14, %l4
	ldswa	[%l7 + %l4] 0x18,	%l3
	addccc	%o5,	%o7,	%g3
	nop
	setx	0xD0B839E688EAB72C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x4AB2F3AE1452B064,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	faddd	%f20,	%f28,	%f10
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l4
	brgz	%i7,	loop_2272
	movcc	%xcc,	%i3,	%l1
	movrne	%g7,	%o2,	%g2
	fbl,a	%fcc1,	loop_2273
loop_2272:
	movrne	%l2,	0x085,	%g1
	move	%xcc,	%o4,	%g6
	bleu,a	%xcc,	loop_2274
loop_2273:
	movl	%icc,	%i4,	%i1
	tsubcc	%o3,	0x169F,	%g4
	stx	%i6,	[%l7 + 0x68]
loop_2274:
	popc	0x002B,	%o0
	set	0x66, %g5
	ldsha	[%l7 + %g5] 0x89,	%l6
	xor	%l0,	0x12DD,	%o1
	movleu	%xcc,	%g5,	%i0
	nop
	setx	0xCE56F1F4D07FCF68,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	tneg	%xcc,	0x4
	taddcc	%i2,	%l5,	%o6
	fbl,a	%fcc0,	loop_2275
	popc	0x1A3F,	%i5
	fmovsgu	%icc,	%f23,	%f19
	array32	%o5,	%o7,	%l3
loop_2275:
	alignaddrl	%g3,	%i7,	%i3
	nop
	setx	0x1D8EACFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f5
	stb	%l1,	[%l7 + 0x40]
	umulcc	%l4,	0x1D3A,	%g7
	fblg,a	%fcc2,	loop_2276
	movleu	%icc,	%o2,	%l2
	nop
	setx	0xD0579F85,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	addccc	%g1,	%g2,	%o4
loop_2276:
	fbne,a	%fcc1,	loop_2277
	nop
	setx	0xB6FC0702,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x94C02A4C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fmuls	%f4,	%f29,	%f19
	sir	0x160C
	bn,pt	%xcc,	loop_2278
loop_2277:
	fcmpne32	%f24,	%f6,	%i4
	sdivcc	%g6,	0x0F5D,	%o3
	call	loop_2279
loop_2278:
	edge16l	%i1,	%i6,	%g4
	sdiv	%l6,	0x0D66,	%l0
	subcc	%o1,	0x15C5,	%o0
loop_2279:
	fmovdle	%xcc,	%f10,	%f18
	fmovsa	%icc,	%f4,	%f1
	tl	%xcc,	0x7
	fbu	%fcc0,	loop_2280
	movrgez	%g5,	0x159,	%i2
	movcc	%xcc,	%l5,	%o6
	sdiv	%i5,	0x123E,	%i0
loop_2280:
	tvc	%icc,	0x3
	xor	%o5,	0x0977,	%l3
	fmul8sux16	%f30,	%f24,	%f6
	edge32l	%g3,	%i7,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i3,	%l1,	%g7
	addccc	%l4,	0x1886,	%l2
	fpsub32s	%f24,	%f18,	%f27
	edge16ln	%o2,	%g2,	%o4
	movvc	%icc,	%i4,	%g1
	xor	%g6,	%i1,	%o3
	taddcctv	%g4,	0x0A62,	%l6
	xnorcc	%i6,	0x1F8B,	%l0
	std	%f0,	[%l7 + 0x18]
	movpos	%xcc,	%o1,	%o0
	st	%f4,	[%l7 + 0x70]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i2,	%l5,	%o6
	fmovsvs	%xcc,	%f19,	%f24
	fors	%f29,	%f22,	%f19
	mulx	%g5,	0x099B,	%i5
	movle	%icc,	%o5,	%i0
	fxors	%f25,	%f29,	%f0
	srax	%g3,	%l3,	%i7
	membar	0x10
	movg	%icc,	%i3,	%l1
	fxnors	%f29,	%f21,	%f11
	set	0x58, %l5
	prefetcha	[%l7 + %l5] 0x89,	 0x0
	fbg,a	%fcc0,	loop_2281
	srax	%g7,	0x17,	%l4
	movcs	%xcc,	%o2,	%g2
	movgu	%icc,	%o4,	%i4
loop_2281:
	fmovsl	%icc,	%f20,	%f31
	fornot1	%f24,	%f18,	%f10
	bg,a	%icc,	loop_2282
	sllx	%g1,	0x1D,	%g6
	wr	%g0,	0x57,	%asi
	stxa	%i1,	[%g0 + 0x0] %asi
loop_2282:
	brgz	%o3,	loop_2283
	edge8	%l2,	%g4,	%i6
	tleu	%xcc,	0x7
	bcc	loop_2284
loop_2283:
	srlx	%l6,	0x18,	%o1
	brnz	%l0,	loop_2285
	umulcc	%i2,	%o0,	%o6
loop_2284:
	fandnot2s	%f31,	%f2,	%f7
	fsrc1	%f22,	%f6
loop_2285:
	fnors	%f9,	%f21,	%f1
	fnot1s	%f30,	%f22
	nop
	fitod	%f0,	%f12
	fdtoi	%f12,	%f2
	bne	loop_2286
	move	%icc,	%g5,	%i5
	fmovdl	%icc,	%f2,	%f2
	mulx	%o5,	0x0ECE,	%i0
loop_2286:
	sth	%g3,	[%l7 + 0x18]
	fmovse	%xcc,	%f23,	%f3
	fbu,a	%fcc3,	loop_2287
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l3,	%i7,	%i3
	ldsb	[%l7 + 0x28],	%l5
loop_2287:
	edge16	%o7,	%l1,	%l4
	ldub	[%l7 + 0x57],	%g7
	bvc,pn	%icc,	loop_2288
	subc	%g2,	%o2,	%o4
	movne	%icc,	%i4,	%g1
	brlz	%g6,	loop_2289
loop_2288:
	fbe,a	%fcc2,	loop_2290
	brgez	%i1,	loop_2291
	fble,a	%fcc2,	loop_2292
loop_2289:
	movneg	%icc,	%l2,	%g4
loop_2290:
	nop
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x04,	%f16
loop_2291:
	bcc,pt	%icc,	loop_2293
loop_2292:
	xor	%i6,	%o3,	%l6
	xnorcc	%l0,	0x09FA,	%i2
	nop
	fitos	%f9,	%f6
	fstox	%f6,	%f2
loop_2293:
	orn	%o0,	0x044D,	%o1
	fbge,a	%fcc0,	loop_2294
	bcs,a,pt	%xcc,	loop_2295
	brlz,a	%g5,	loop_2296
	tvs	%xcc,	0x5
loop_2294:
	smul	%i5,	%o5,	%i0
loop_2295:
	tle	%xcc,	0x7
loop_2296:
	brlez,a	%g3,	loop_2297
	mulscc	%o6,	%l3,	%i7
	movcs	%icc,	%i3,	%o7
	movrgz	%l5,	%l1,	%g7
loop_2297:
	edge8	%l4,	%o2,	%g2
	nop
	setx	loop_2298,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%i4,	%o4,	%g1
	sra	%g6,	%i1,	%l2
	sdivx	%i6,	0x12FB,	%o3
loop_2298:
	bleu,a	%xcc,	loop_2299
	brgez,a	%l6,	loop_2300
	fmovdleu	%xcc,	%f3,	%f21
	tvc	%icc,	0x3
loop_2299:
	xorcc	%g4,	0x1B33,	%i2
loop_2300:
	movrgz	%o0,	%l0,	%g5
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x60] %asi,	%o1
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x50] %asi,	%i5
	nop
	setx	0x2BECC03860B746EE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x6ABE03FC1CB08BC5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f22,	%f26
	udivcc	%i0,	0x1975,	%g3
	mulx	%o6,	0x0968,	%o5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i7,	%l3
	andcc	%o7,	0x1C11,	%l5
	movrgez	%i3,	%l1,	%l4
	movrlez	%g7,	%o2,	%i4
	edge32	%g2,	%g1,	%g6
	bcc,a,pn	%icc,	loop_2301
	sdiv	%i1,	0x03F7,	%o4
	nop
	setx	0x50748613,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	movrlz	%l2,	%o3,	%l6
loop_2301:
	mulscc	%g4,	0x0A38,	%i6
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%i2
	xorcc	%l0,	0x1B53,	%o0
	array16	%o1,	%i5,	%i0
	subccc	%g5,	%g3,	%o6
	fmovrdlez	%o5,	%f8,	%f20
	edge16ln	%l3,	%i7,	%o7
	tn	%icc,	0x6
	tge	%xcc,	0x4
	edge32ln	%l5,	%i3,	%l1
	taddcc	%l4,	%o2,	%i4
	fbu,a	%fcc2,	loop_2302
	fmovs	%f15,	%f23
	stb	%g2,	[%l7 + 0x66]
	movpos	%xcc,	%g1,	%g7
loop_2302:
	or	%i1,	%o4,	%l2
	tneg	%xcc,	0x2
	movn	%icc,	%g6,	%o3
	taddcctv	%l6,	%g4,	%i2
	udivx	%l0,	0x0533,	%o0
	orncc	%o1,	0x12B1,	%i6
	fmul8ulx16	%f12,	%f26,	%f22
	alignaddr	%i5,	%g5,	%g3
	bleu,pn	%xcc,	loop_2303
	bge,pt	%xcc,	loop_2304
	xnorcc	%o6,	%o5,	%i0
	tneg	%icc,	0x3
loop_2303:
	st	%f24,	[%l7 + 0x30]
loop_2304:
	bcc,pn	%xcc,	loop_2305
	movge	%xcc,	%l3,	%i7
	andcc	%o7,	%i3,	%l1
	tne	%icc,	0x0
loop_2305:
	mova	%xcc,	%l4,	%l5
	fmovsvs	%icc,	%f21,	%f20
	fsrc2	%f8,	%f12
	stbar
	nop
	setx	0xAB3D57B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xC6AB6B99,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f8,	%f13
	wr	%g0,	0x52,	%asi
	stxa	%i4,	[%g0 + 0x118] %asi
	tne	%icc,	0x3
	nop
	setx	0xF7C889F57077C0A2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	array16	%g2,	%o2,	%g1
	bgu,a,pn	%xcc,	loop_2306
	addccc	%g7,	0x14D7,	%o4
	movn	%icc,	%i1,	%l2
	set	0x30, %o4
	stwa	%g6,	[%l7 + %o4] 0x89
loop_2306:
	tsubcctv	%o3,	0x1C94,	%g4
	tleu	%xcc,	0x5
	movcs	%xcc,	%i2,	%l6
	tg	%icc,	0x4
	edge8	%o0,	%l0,	%i6
	tcs	%icc,	0x3
	fandnot1s	%f11,	%f13,	%f1
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x04,	%f16
	movn	%icc,	%o1,	%g5
	edge8	%g3,	%i5,	%o6
	subc	%o5,	0x089A,	%l3
	tne	%xcc,	0x4
	sdiv	%i7,	0x1526,	%o7
	tpos	%xcc,	0x7
	srlx	%i0,	%i3,	%l1
	bl,a,pn	%icc,	loop_2307
	ldsw	[%l7 + 0x34],	%l5
	nop
	set	0x34, %o6
	lduw	[%l7 + %o6],	%l4
	fmovdg	%xcc,	%f10,	%f1
loop_2307:
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
	nop
	setx loop_2309, %l0, %l1
	jmpl %l1, %i4
	edge16	%o2,	%g2,	%g1
	movgu	%icc,	%o4,	%g7
loop_2308:
	nop
	set	0x0B, %g2
	ldstuba	[%l7 + %g2] 0x80,	%l2
loop_2309:
	mulscc	%g6,	0x129C,	%i1
	edge16n	%g4,	%o3,	%l6
	fba	%fcc3,	loop_2310
	lduw	[%l7 + 0x1C],	%i2
	fmovrsgez	%o0,	%f5,	%f22
	sethi	0x02D0,	%l0
loop_2310:
	movgu	%xcc,	%i6,	%o1
	array8	%g3,	%i5,	%o6
	fbu	%fcc1,	loop_2311
	orn	%o5,	%l3,	%i7
	add	%o7,	0x1492,	%g5
	sth	%i3,	[%l7 + 0x30]
loop_2311:
	subc	%i0,	0x028B,	%l5
	sllx	%l4,	0x1E,	%l1
	movle	%xcc,	%i4,	%o2
	nop
	fitod	%f13,	%f0
	tn	%xcc,	0x0
	xnor	%g1,	%g2,	%g7
	nop
	setx	0xD047D81F,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	prefetch	[%l7 + 0x68],	 0x3
	be,a,pt	%icc,	loop_2312
	fbge	%fcc2,	loop_2313
	edge32	%l2,	%o4,	%g6
	set	0x52, %o7
	ldsba	[%l7 + %o7] 0x0c,	%i1
loop_2312:
	fmul8x16al	%f2,	%f2,	%f2
loop_2313:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc2,	loop_2314
	tneg	%xcc,	0x0
	fmul8ulx16	%f18,	%f14,	%f2
	tg	%icc,	0x0
loop_2314:
	nop
	set	0x20, %g6
	stxa	%o3,	[%l7 + %g6] 0x22
	membar	#Sync
	array32	%l6,	%i2,	%g4
	sra	%o0,	%l0,	%i6
	tcc	%xcc,	0x4
	array16	%o1,	%i5,	%o6
	nop
	setx	0xBDD92F3910757DBD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f2
	fmovrse	%g3,	%f26,	%f0
	fbne	%fcc0,	loop_2315
	bvs,a,pt	%icc,	loop_2316
	alignaddrl	%o5,	%l3,	%o7
	smulcc	%i7,	0x0EA9,	%i3
loop_2315:
	fbge,a	%fcc2,	loop_2317
loop_2316:
	tleu	%xcc,	0x0
	addcc	%i0,	%g5,	%l4
	tg	%xcc,	0x2
loop_2317:
	tleu	%xcc,	0x7
	fcmpne32	%f2,	%f28,	%l5
	tle	%icc,	0x5
	umulcc	%l1,	0x1D68,	%i4
	xor	%o2,	0x1A3B,	%g1
	tneg	%xcc,	0x4
	movrlz	%g7,	0x0E7,	%g2
	fbule	%fcc2,	loop_2318
	be,a	%xcc,	loop_2319
	movn	%icc,	%o4,	%l2
	stb	%g6,	[%l7 + 0x7A]
loop_2318:
	fmovscc	%xcc,	%f2,	%f4
loop_2319:
	edge16	%i1,	%l6,	%i2
	movl	%icc,	%g4,	%o3
	srl	%o0,	%l0,	%i6
	fmovsgu	%xcc,	%f9,	%f6
	tge	%xcc,	0x5
	addcc	%o1,	%o6,	%g3
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i5
	sllx	%o5,	0x1B,	%o7
	movgu	%xcc,	%l3,	%i7
	edge32ln	%i3,	%i0,	%l4
	and	%g5,	%l1,	%i4
	nop
	setx	0x534613C88D850EDE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xDDF24F84CC5BD357,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f12,	%f12
	fmovscs	%xcc,	%f1,	%f24
	st	%f22,	[%l7 + 0x48]
	tl	%icc,	0x7
	fmovrdlez	%o2,	%f10,	%f0
	tsubcctv	%g1,	%l5,	%g7
	tcs	%icc,	0x0
	xorcc	%o4,	0x029C,	%g2
	brlz,a	%g6,	loop_2320
	fbne	%fcc1,	loop_2321
	xorcc	%i1,	0x0933,	%l2
	nop
	setx	0x98EEDA45,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xB45FCF6C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f18,	%f7
loop_2320:
	edge32n	%l6,	%i2,	%g4
loop_2321:
	membar	0x2E
	bvs	%icc,	loop_2322
	movvc	%xcc,	%o3,	%o0
	and	%i6,	%o1,	%l0
	sdivx	%o6,	0x1C44,	%g3
loop_2322:
	bgu,a,pn	%icc,	loop_2323
	fpsub16	%f30,	%f22,	%f4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x48] %asi,	%f0
loop_2323:
	udiv	%o5,	0x125F,	%i5
	taddcc	%l3,	%i7,	%i3
	array8	%i0,	%o7,	%g5
	udivcc	%l1,	0x020B,	%i4
	fmovsvs	%icc,	%f5,	%f16
	fbe	%fcc1,	loop_2324
	tsubcc	%o2,	%l4,	%l5
	for	%f16,	%f28,	%f14
	set	0x4C, %o3
	lduwa	[%l7 + %o3] 0x10,	%g1
loop_2324:
	fbu	%fcc2,	loop_2325
	sdivcc	%g7,	0x194E,	%g2
	movgu	%icc,	%o4,	%i1
	fblg,a	%fcc3,	loop_2326
loop_2325:
	subc	%l2,	%l6,	%i2
	fmovdg	%xcc,	%f29,	%f24
	edge8	%g6,	%o3,	%o0
loop_2326:
	array32	%g4,	%o1,	%i6
	fnor	%f4,	%f0,	%f20
	movg	%xcc,	%o6,	%l0
	movrlez	%o5,	%i5,	%g3
	srax	%l3,	%i3,	%i0
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x38] %asi,	%o7
	alignaddrl	%i7,	%g5,	%l1
	umul	%o2,	0x0C41,	%i4
	fmovrdgz	%l4,	%f10,	%f20
	fmovsl	%icc,	%f4,	%f22
	wr	%g0,	0x22,	%asi
	stba	%g1,	[%l7 + 0x56] %asi
	membar	#Sync
	edge8n	%g7,	%g2,	%l5
	tne	%icc,	0x4
	udivcc	%o4,	0x06A8,	%i1
	fmovrdgez	%l2,	%f26,	%f16
	mulx	%l6,	0x1F01,	%g6
	bcs,pt	%xcc,	loop_2327
	movrne	%i2,	0x0FC,	%o0
	sdivx	%o3,	0x1289,	%g4
	nop
	setx loop_2328, %l0, %l1
	jmpl %l1, %o1
loop_2327:
	xnor	%i6,	0x1E86,	%o6
	umul	%l0,	%i5,	%o5
	faligndata	%f0,	%f10,	%f22
loop_2328:
	fbg	%fcc3,	loop_2329
	fba	%fcc0,	loop_2330
	fcmple32	%f0,	%f20,	%g3
	movrne	%i3,	0x283,	%l3
loop_2329:
	fnegd	%f18,	%f0
loop_2330:
	taddcc	%i0,	0x0451,	%i7
	or	%g5,	%o7,	%o2
	andcc	%l1,	0x1681,	%i4
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x04,	%l4,	%g7
	tsubcctv	%g2,	0x11B1,	%l5
	set	0x58, %g7
	stha	%o4,	[%l7 + %g7] 0x15
	udivcc	%g1,	0x15B6,	%i1
	fpadd16s	%f4,	%f2,	%f5
	edge32n	%l6,	%g6,	%i2
	fmovscs	%xcc,	%f18,	%f31
	fpadd16s	%f23,	%f26,	%f10
	fornot2s	%f25,	%f10,	%f4
	edge8ln	%o0,	%l2,	%g4
	sth	%o3,	[%l7 + 0x14]
	bneg,pn	%icc,	loop_2331
	movpos	%icc,	%o1,	%i6
	membar	0x23
	movg	%icc,	%o6,	%l0
loop_2331:
	tne	%icc,	0x0
	movre	%o5,	0x0DC,	%g3
	tne	%xcc,	0x6
	fnot2s	%f5,	%f20
	umul	%i3,	0x1BD4,	%i5
	xorcc	%l3,	%i0,	%i7
	nop
	setx	0x5BAB975440767F30,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fnand	%f22,	%f18,	%f6
	mulx	%o7,	0x09E1,	%g5
	edge16l	%l1,	%i4,	%o2
	sllx	%g7,	0x0C,	%g2
	fmovrsgez	%l4,	%f18,	%f30
	tcs	%icc,	0x5
	edge16ln	%l5,	%g1,	%o4
	pdist	%f10,	%f30,	%f22
	sll	%l6,	%g6,	%i2
	wr	%g0,	0xe3,	%asi
	stxa	%o0,	[%l7 + 0x20] %asi
	membar	#Sync
	srl	%l2,	%i1,	%o3
	addccc	%o1,	0x10AD,	%i6
	fmul8x16	%f19,	%f8,	%f14
	orn	%o6,	%l0,	%o5
	movvc	%xcc,	%g3,	%g4
	srlx	%i5,	%i3,	%l3
	fmovrsgez	%i0,	%f8,	%f0
	fmovsneg	%icc,	%f31,	%f8
	andncc	%i7,	%o7,	%l1
	tleu	%xcc,	0x7
	st	%f5,	[%l7 + 0x30]
	udivx	%g5,	0x0906,	%o2
	orcc	%g7,	0x0918,	%i4
	wr	%g0,	0x81,	%asi
	stha	%g2,	[%l7 + 0x20] %asi
	sdivcc	%l5,	0x07EE,	%l4
	sethi	0x1AE8,	%g1
	fbue,a	%fcc0,	loop_2332
	addc	%l6,	0x08CC,	%o4
	tpos	%icc,	0x3
	edge32l	%i2,	%o0,	%g6
loop_2332:
	array8	%l2,	%o3,	%o1
	or	%i1,	0x1D64,	%o6
	edge32l	%l0,	%o5,	%i6
	bne,pt	%icc,	loop_2333
	fmovsleu	%xcc,	%f14,	%f15
	flush	%l7 + 0x34
	movre	%g4,	0x131,	%g3
loop_2333:
	fnegs	%f11,	%f10
	fzeros	%f15
	sub	%i3,	%i5,	%l3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] 0x11,	%i7,	%i0
	movrgez	%o7,	%l1,	%o2
	ld	[%l7 + 0x6C],	%f24
	tne	%xcc,	0x1
	umul	%g7,	0x1906,	%i4
	umul	%g5,	0x12E4,	%l5
	fmovde	%xcc,	%f9,	%f19
	movcs	%icc,	%g2,	%l4
	fmovrde	%g1,	%f8,	%f14
	tge	%xcc,	0x5
	fmovdleu	%icc,	%f1,	%f12
	umul	%l6,	%o4,	%i2
	bcc,pt	%icc,	loop_2334
	fandnot2s	%f21,	%f16,	%f18
	movvc	%icc,	%o0,	%l2
	edge8l	%o3,	%o1,	%i1
loop_2334:
	bgu	%xcc,	loop_2335
	addcc	%g6,	%o6,	%o5
	edge32	%l0,	%g4,	%i6
	alignaddrl	%i3,	%i5,	%l3
loop_2335:
	tvc	%xcc,	0x5
	fmovrsgz	%i7,	%f6,	%f29
	movrlez	%i0,	%o7,	%g3
	movneg	%xcc,	%l1,	%g7
	tle	%icc,	0x5
	fmovsl	%icc,	%f4,	%f16
	alignaddr	%i4,	%o2,	%g5
	brgez,a	%g2,	loop_2336
	fbug	%fcc3,	loop_2337
	udiv	%l4,	0x1FDA,	%g1
	udivx	%l5,	0x01E8,	%o4
loop_2336:
	addccc	%i2,	%l6,	%l2
loop_2337:
	andcc	%o3,	%o0,	%i1
	array16	%g6,	%o6,	%o5
	fbule,a	%fcc1,	loop_2338
	fabsd	%f24,	%f0
	and	%l0,	0x0252,	%o1
	movneg	%xcc,	%g4,	%i6
loop_2338:
	orncc	%i5,	0x040A,	%i3
	tneg	%icc,	0x4
	edge32	%l3,	%i7,	%o7
	tneg	%icc,	0x7
	ldd	[%l7 + 0x48],	%f10
	srax	%g3,	0x18,	%i0
	nop
	setx	0xE76EEA6635A13B34,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x50B5C661D4978055,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f18,	%f30
	membar	0x63
	brnz,a	%l1,	loop_2339
	edge8n	%i4,	%o2,	%g7
	fsrc2	%f4,	%f18
	fmovdvs	%icc,	%f6,	%f25
loop_2339:
	fmovsg	%icc,	%f3,	%f8
	fsrc1	%f6,	%f8
	fbl	%fcc3,	loop_2340
	tneg	%icc,	0x2
	bvc,a	loop_2341
	xor	%g2,	0x0FA1,	%l4
loop_2340:
	array32	%g1,	%l5,	%o4
	tsubcc	%g5,	%l6,	%l2
loop_2341:
	andn	%i2,	%o3,	%i1
	movle	%icc,	%g6,	%o6
	sll	%o5,	0x06,	%o0
	add	%o1,	0x19BA,	%l0
	udiv	%g4,	0x0261,	%i6
	movneg	%xcc,	%i5,	%l3
	fbu,a	%fcc3,	loop_2342
	orncc	%i3,	%o7,	%i7
	brlz	%i0,	loop_2343
	fble	%fcc3,	loop_2344
loop_2342:
	ldsh	[%l7 + 0x52],	%g3
	edge8ln	%l1,	%o2,	%g7
loop_2343:
	alignaddr	%i4,	%l4,	%g2
loop_2344:
	fnot1	%f6,	%f16
	orncc	%l5,	0x0161,	%g1
	sra	%o4,	0x09,	%g5
	sth	%l2,	[%l7 + 0x30]
	tcc	%xcc,	0x0
	ta	%xcc,	0x3
	tsubcctv	%l6,	%o3,	%i1
	taddcctv	%g6,	0x1A16,	%o6
	fabsd	%f2,	%f24
	fblg	%fcc0,	loop_2345
	fmovscs	%xcc,	%f17,	%f25
	movrlz	%o5,	%i2,	%o0
	fcmpeq16	%f0,	%f6,	%o1
loop_2345:
	fbg	%fcc1,	loop_2346
	edge32ln	%l0,	%i6,	%i5
	orncc	%g4,	0x1529,	%i3
	fbne,a	%fcc3,	loop_2347
loop_2346:
	nop
	fitod	%f9,	%f18
	fbne,a	%fcc2,	loop_2348
	tne	%xcc,	0x2
loop_2347:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f30,	%f20,	%f16
loop_2348:
	orcc	%o7,	%l3,	%i0
	fmovdgu	%xcc,	%f20,	%f30
	subcc	%g3,	0x1256,	%l1
	tne	%xcc,	0x7
	movle	%icc,	%i7,	%g7
	fpadd32s	%f29,	%f6,	%f29
	movneg	%icc,	%o2,	%l4
	subccc	%i4,	%g2,	%g1
	movleu	%icc,	%o4,	%g5
	nop
	setx	0x6B9BC925,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x4531DE1D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f30,	%f9
	andncc	%l2,	%l6,	%l5
	movg	%xcc,	%o3,	%i1
	nop
	fitod	%f9,	%f4
	subcc	%o6,	0x199F,	%o5
	taddcctv	%g6,	%i2,	%o1
	nop
	setx	0x515E1967204D5A9B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	tcs	%icc,	0x4
	fbn,a	%fcc0,	loop_2349
	fmovrsgez	%o0,	%f22,	%f10
	tne	%xcc,	0x5
	addc	%i6,	0x1D49,	%i5
loop_2349:
	tge	%xcc,	0x5
	sdivcc	%g4,	0x1812,	%i3
	movrlz	%l0,	0x02E,	%o7
	tne	%icc,	0x3
	fabss	%f0,	%f2
	movn	%icc,	%i0,	%l3
	movcs	%xcc,	%l1,	%g3
	edge32n	%g7,	%i7,	%l4
	std	%f2,	[%l7 + 0x20]
	fpack16	%f26,	%f31
	array32	%i4,	%o2,	%g1
	fsrc2	%f12,	%f2
	fsrc2s	%f20,	%f24
	movle	%icc,	%g2,	%o4
	bn,a,pn	%icc,	loop_2350
	udiv	%l2,	0x04B1,	%g5
	nop
	setx	0x28E351AB604B9DC2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	taddcc	%l5,	%o3,	%l6
loop_2350:
	fmuld8sux16	%f22,	%f25,	%f30
	fmovrsgz	%o6,	%f11,	%f21
	edge8l	%o5,	%g6,	%i1
	fornot2s	%f20,	%f25,	%f1
	fmovrse	%i2,	%f14,	%f28
	add	%o1,	0x0486,	%i6
	sethi	0x0BEC,	%o0
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x31] %asi,	%i5
	andncc	%g4,	%l0,	%o7
	nop
	setx	0x41ED2AAC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x83E1AF21,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f20,	%f20
	fmul8sux16	%f22,	%f22,	%f28
	set	0x41, %i7
	ldsba	[%l7 + %i7] 0x14,	%i0
	array8	%i3,	%l1,	%l3
	nop
	setx	0xD81E8506,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xDFB71209,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f10,	%f18
	fble	%fcc3,	loop_2351
	sethi	0x05AD,	%g7
	fmovs	%f26,	%f0
	sra	%g3,	%i7,	%i4
loop_2351:
	nop
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x110] %asi,	%l4
	array32	%o2,	%g1,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%o4,	%l2
	udivx	%l5,	0x05E4,	%g5
	addcc	%l6,	0x1747,	%o3
	tcc	%icc,	0x4
	xnor	%o5,	0x1AAB,	%o6
	fandnot2	%f4,	%f14,	%f10
	ta	%icc,	0x7
	tvs	%icc,	0x5
	srl	%g6,	0x12,	%i2
	edge8l	%o1,	%i6,	%o0
	movn	%xcc,	%i1,	%i5
	movre	%l0,	0x1D0,	%o7
	fands	%f26,	%f7,	%f15
	movrgz	%i0,	0x174,	%i3
	edge8n	%g4,	%l3,	%g7
	movrgez	%l1,	0x24F,	%i7
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x7A] %asi,	%g3
	sdiv	%l4,	0x0117,	%i4
	fmovdneg	%icc,	%f9,	%f0
	fpsub16	%f22,	%f2,	%f22
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%g1
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o4,	%g2
	xor	%l2,	%l5,	%g5
	be,a	loop_2352
	umul	%o3,	0x1B5C,	%l6
	fexpand	%f22,	%f26
	tsubcc	%o6,	0x0894,	%o5
loop_2352:
	brgz	%g6,	loop_2353
	edge32ln	%i2,	%o1,	%o0
	edge16	%i6,	%i5,	%l0
	tle	%xcc,	0x2
loop_2353:
	sir	0x1343
	udiv	%o7,	0x0DA6,	%i1
	tne	%xcc,	0x3
	nop
	setx	0x09588312,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x33D8FAA6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f8,	%f20
	tn	%xcc,	0x3
	mova	%icc,	%i0,	%g4
	bvc,a,pt	%icc,	loop_2354
	ldsb	[%l7 + 0x0A],	%l3
	movrgz	%i3,	%l1,	%g7
	fxors	%f24,	%f1,	%f21
loop_2354:
	subcc	%g3,	0x0235,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x50],	%i4
	fzeros	%f8
	tneg	%xcc,	0x7
	nop
	fitod	%f10,	%f6
	fdtox	%f6,	%f28
	fxtod	%f28,	%f12
	te	%icc,	0x3
	orncc	%l4,	%o2,	%g1
	fbug,a	%fcc0,	loop_2355
	movleu	%icc,	%o4,	%g2
	xorcc	%l5,	%g5,	%l2
	stbar
loop_2355:
	bn,a	loop_2356
	fmovscc	%icc,	%f27,	%f2
	bshuffle	%f16,	%f18,	%f8
	mulscc	%l6,	0x0F77,	%o3
loop_2356:
	move	%icc,	%o5,	%o6
	fmovsne	%xcc,	%f2,	%f31
	nop
	set	0x28, %l1
	ldx	[%l7 + %l1],	%i2
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
	andcc	%g6,	%o0,	%o1
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x10,	%i4
loop_2357:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%i6
	edge32l	%o7,	%i0,	%i1
	udivcc	%g4,	0x15B0,	%l3
	tpos	%icc,	0x6
	tn	%icc,	0x4
	edge32	%i3,	%g7,	%g3
	fornot1	%f0,	%f8,	%f14
	fxnor	%f18,	%f12,	%f22
	move	%icc,	%i7,	%i4
	sll	%l4,	0x1A,	%l1
	xnor	%g1,	0x1BE2,	%o4
	edge8l	%o2,	%g2,	%l5
	popc	%g5,	%l2
	or	%o3,	%l6,	%o5
	ble,a	%icc,	loop_2358
	tvc	%icc,	0x3
	orn	%i2,	0x1BCC,	%o6
	sdiv	%g6,	0x1E45,	%o0
loop_2358:
	edge8	%o1,	%i5,	%i6
	edge8ln	%l0,	%i0,	%i1
	membar	0x7D
	xnor	%o7,	0x1AA6,	%l3
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%g4
	nop
	setx	loop_2359,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%icc,	%g7,	%g3
	edge8	%i7,	%i3,	%l4
	fornot1	%f18,	%f12,	%f4
loop_2359:
	subcc	%i4,	%l1,	%o4
	movrlz	%o2,	%g1,	%g2
	array32	%l5,	%l2,	%o3
	srlx	%g5,	0x00,	%l6
	alignaddr	%i2,	%o6,	%o5
	fcmple32	%f6,	%f16,	%o0
	fcmpgt32	%f22,	%f20,	%o1
	smulcc	%i5,	%i6,	%l0
	fblg,a	%fcc2,	loop_2360
	udivcc	%i0,	0x0BF0,	%i1
	sra	%g6,	0x12,	%o7
	srl	%l3,	0x0E,	%g7
loop_2360:
	nop
	set	0x6E, %g4
	ldsha	[%l7 + %g4] 0x89,	%g4
	sllx	%i7,	0x0E,	%g3
	andn	%i3,	%i4,	%l1
	fpmerge	%f9,	%f24,	%f2
	tgu	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x24] %asi,	%l4
	bleu	%icc,	loop_2361
	edge16	%o4,	%g1,	%g2
	ba,pn	%icc,	loop_2362
	smulcc	%l5,	%l2,	%o3
loop_2361:
	sethi	0x0403,	%g5
	edge32l	%o2,	%i2,	%l6
loop_2362:
	tvc	%xcc,	0x2
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o5,	%o0,	%i5
	tcc	%icc,	0x3
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x34] %asi,	%i6
	ldsh	[%l7 + 0x66],	%o1
	nop
	fitos	%f3,	%f4
	fstox	%f4,	%f24
	fmovsn	%icc,	%f16,	%f5
	set	0x60, %g3
	prefetcha	[%l7 + %g3] 0x88,	 0x1
	mulx	%i1,	%l0,	%o7
	bne	loop_2363
	andncc	%l3,	%g7,	%g4
	fbne	%fcc3,	loop_2364
	sub	%i7,	%g3,	%i3
loop_2363:
	edge16n	%i4,	%g6,	%l4
	xorcc	%l1,	%g1,	%o4
loop_2364:
	sdivcc	%g2,	0x1E5E,	%l5
	nop
	setx	0x4370BC8CC06D05F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fmovrde	%o3,	%f24,	%f18
	movrlez	%g5,	0x23E,	%o2
	fmovdleu	%xcc,	%f18,	%f14
	tge	%icc,	0x2
	xorcc	%i2,	0x135B,	%l6
	edge16l	%o6,	%l2,	%o0
	and	%o5,	%i6,	%i5
	movgu	%xcc,	%o1,	%i0
	smul	%i1,	%o7,	%l0
	sra	%g7,	%l3,	%g4
	ldstub	[%l7 + 0x4E],	%i7
	movrlez	%i3,	0x188,	%i4
	movrgez	%g3,	%l4,	%g6
	bne,pn	%icc,	loop_2365
	brnz	%l1,	loop_2366
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x5E, %o2
	stba	%g1,	[%l7 + %o2] 0xe2
	membar	#Sync
loop_2365:
	fmul8ulx16	%f28,	%f30,	%f20
loop_2366:
	nop
	wr	%g0,	0xe2,	%asi
	stwa	%o4,	[%l7 + 0x08] %asi
	membar	#Sync
	xnor	%g2,	0x0364,	%o3
	subccc	%l5,	0x0CC2,	%g5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x69] %asi,	%o2
	array32	%i2,	%o6,	%l6
	tsubcctv	%l2,	0x1020,	%o5
	movne	%icc,	%i6,	%i5
	srl	%o1,	0x13,	%o0
	edge8n	%i1,	%i0,	%l0
	brz	%g7,	loop_2367
	tsubcctv	%l3,	0x1530,	%o7
	movneg	%icc,	%i7,	%g4
	orncc	%i4,	%i3,	%g3
loop_2367:
	fpackfix	%f0,	%f19
	fbo,a	%fcc2,	loop_2368
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x40761C54F2AC56D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x958CFD9C743CDAA3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f10,	%f22
	nop
	setx	0xE7C583223D1CC770,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xC8CD327B31C6BFD2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f10,	%f26
loop_2368:
	sir	0x17EB
	fmovrslez	%l4,	%f18,	%f24
	addccc	%g6,	0x117D,	%l1
	set	0x29, %l2
	stba	%g1,	[%l7 + %l2] 0xe3
	membar	#Sync
	movrgez	%o4,	0x1BC,	%g2
	mulscc	%l5,	0x074A,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a	loop_2369
	te	%icc,	0x2
	xorcc	%g5,	%o2,	%o6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%i2,	%l6
loop_2369:
	tcc	%icc,	0x1
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x24] %asi,	%l2
	te	%icc,	0x4
	popc	%o5,	%i6
	sdivcc	%i5,	0x034A,	%o0
	nop
	fitos	%f13,	%f10
	fstox	%f10,	%f24
	movl	%xcc,	%i1,	%o1
	sethi	0x1190,	%l0
	std	%f8,	[%l7 + 0x60]
	tvc	%xcc,	0x0
	xorcc	%i0,	%l3,	%o7
	alignaddr	%g7,	%g4,	%i7
	sra	%i4,	0x17,	%i3
	udivcc	%l4,	0x099F,	%g3
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x89
	stb	%g6,	[%l7 + 0x28]
	tcc	%xcc,	0x6
	movvs	%icc,	%g1,	%l1
	edge32	%o4,	%g2,	%o3
	array32	%g5,	%l5,	%o2
	movneg	%icc,	%o6,	%i2
	smulcc	%l2,	0x0D19,	%l6
	fpackfix	%f6,	%f9
	fcmpeq32	%f30,	%f8,	%i6
	andn	%o5,	%i5,	%o0
	sub	%i1,	%l0,	%o1
	fornot1s	%f30,	%f5,	%f31
	tpos	%icc,	0x4
	fnands	%f24,	%f23,	%f19
	fmovrse	%l3,	%f14,	%f4
	fcmpgt16	%f12,	%f30,	%o7
	nop
	set	0x40, %o1
	ldd	[%l7 + %o1],	%g6
	bcs	loop_2370
	fmovrsgez	%g4,	%f19,	%f24
	array8	%i7,	%i4,	%i3
	stw	%l4,	[%l7 + 0x20]
loop_2370:
	nop
	fitos	%f0,	%f5
	fstox	%f5,	%f10
	fxtos	%f10,	%f4
	nop
	setx	loop_2371,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%i0,	%g3,	%g1
	stbar
	bpos,a	loop_2372
loop_2371:
	mova	%xcc,	%l1,	%g6
	fandnot2s	%f0,	%f13,	%f24
	nop
	setx	0xE18C37BB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xAEABBD4B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f21,	%f21
loop_2372:
	movpos	%icc,	%g2,	%o3
	umulcc	%o4,	0x1C0F,	%l5
	bne,a	loop_2373
	xorcc	%o2,	%o6,	%i2
	stb	%l2,	[%l7 + 0x77]
	udiv	%l6,	0x0120,	%g5
loop_2373:
	nop
	setx	0xC409C4EF76B0FD85,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x266720159F477F41,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f14,	%f12
	sdivcc	%i6,	0x0709,	%o5
	fmovsleu	%xcc,	%f0,	%f15
	fbn	%fcc3,	loop_2374
	fmovdcs	%icc,	%f17,	%f8
	movl	%icc,	%o0,	%i5
	xor	%l0,	%o1,	%i1
loop_2374:
	addcc	%l3,	0x16F9,	%o7
	orn	%g7,	0x0D21,	%g4
	set	0x1A, %i1
	ldsha	[%l7 + %i1] 0x80,	%i4
	bleu	loop_2375
	taddcctv	%i3,	0x1251,	%i7
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x88
loop_2375:
	fbuge	%fcc1,	loop_2376
	movrgz	%i0,	0x0C8,	%g3
	sub	%l4,	0x1107,	%g1
	brz,a	%g6,	loop_2377
loop_2376:
	tn	%xcc,	0x6
	movrlez	%g2,	%o3,	%l1
	movpos	%icc,	%o4,	%l5
loop_2377:
	swap	[%l7 + 0x08],	%o2
	taddcctv	%o6,	%l2,	%l6
	orn	%i2,	%i6,	%g5
	srlx	%o5,	0x05,	%o0
	movvs	%xcc,	%l0,	%i5
	udivx	%o1,	0x106F,	%i1
	tg	%icc,	0x7
	tneg	%icc,	0x7
	stbar
	tge	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4F] %asi,	%l3
	fbu,a	%fcc0,	loop_2378
	fba	%fcc2,	loop_2379
	tg	%icc,	0x4
	set	0x67, %g1
	lduba	[%l7 + %g1] 0x81,	%g7
loop_2378:
	fpadd16	%f28,	%f0,	%f0
loop_2379:
	fbne	%fcc2,	loop_2380
	ldd	[%l7 + 0x10],	%g4
	fbg	%fcc1,	loop_2381
	addcc	%o7,	%i4,	%i3
loop_2380:
	fmovsge	%xcc,	%f19,	%f13
	movrgez	%i0,	%i7,	%l4
loop_2381:
	brz,a	%g1,	loop_2382
	movrgz	%g3,	0x26F,	%g2
	movcs	%xcc,	%g6,	%o3
	bge,pt	%xcc,	loop_2383
loop_2382:
	fones	%f12
	srax	%l1,	%o4,	%l5
	fble	%fcc3,	loop_2384
loop_2383:
	fcmple16	%f20,	%f0,	%o2
	sir	0x18AF
	fmovsneg	%icc,	%f23,	%f31
loop_2384:
	nop
	set	0x08, %i2
	stba	%l2,	[%l7 + %i2] 0xe2
	membar	#Sync
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x2C] %asi,	%f10
	fandnot2	%f10,	%f4,	%f8
	fmul8ulx16	%f22,	%f4,	%f2
	fornot1s	%f27,	%f4,	%f2
	sdivx	%o6,	0x1D1F,	%l6
	addcc	%i6,	0x0244,	%g5
	sra	%i2,	0x10,	%o5
	bn,a,pn	%icc,	loop_2385
	smul	%l0,	%i5,	%o0
	andncc	%o1,	%i1,	%g7
	fmovdpos	%icc,	%f18,	%f21
loop_2385:
	call	loop_2386
	srl	%l3,	%o7,	%g4
	fmovdgu	%icc,	%f22,	%f17
	fabsd	%f0,	%f0
loop_2386:
	fmovrsgez	%i3,	%f29,	%f2
	or	%i0,	0x1404,	%i7
	fmovd	%f8,	%f30
	edge8l	%l4,	%i4,	%g3
	fmovdneg	%xcc,	%f1,	%f0
	edge32n	%g2,	%g1,	%g6
	tg	%xcc,	0x1
	subcc	%o3,	%l1,	%l5
	lduh	[%l7 + 0x5C],	%o2
	nop
	setx	0x2B1A14D5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f16
	membar	0x13
	fbl,a	%fcc3,	loop_2387
	fbge	%fcc3,	loop_2388
	movle	%icc,	%l2,	%o4
	subc	%l6,	%i6,	%o6
loop_2387:
	xorcc	%g5,	0x1A44,	%o5
loop_2388:
	movgu	%xcc,	%i2,	%l0
	fmovrse	%o0,	%f4,	%f30
	tl	%icc,	0x5
	udivx	%o1,	0x078B,	%i5
	fnors	%f1,	%f19,	%f4
	udiv	%g7,	0x0232,	%i1
	edge16ln	%l3,	%g4,	%o7
	movg	%xcc,	%i0,	%i3
	and	%l4,	0x0A55,	%i4
	orcc	%i7,	%g3,	%g1
	tg	%xcc,	0x2
	movrgz	%g2,	%o3,	%l1
	array8	%g6,	%l5,	%o2
	addccc	%o4,	%l2,	%i6
	fmovs	%f7,	%f30
	fmul8ulx16	%f10,	%f8,	%f22
	and	%o6,	%g5,	%l6
	sll	%o5,	%l0,	%o0
	edge32l	%i2,	%i5,	%o1
	movne	%xcc,	%g7,	%i1
	bpos,pn	%icc,	loop_2389
	movcs	%xcc,	%l3,	%o7
	brlz	%g4,	loop_2390
	movl	%xcc,	%i3,	%i0
loop_2389:
	umul	%l4,	0x1DA5,	%i7
	orncc	%i4,	0x1D58,	%g1
loop_2390:
	fbge	%fcc3,	loop_2391
	stx	%g2,	[%l7 + 0x38]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g3,	0x001E,	%l1
loop_2391:
	movrlez	%o3,	%l5,	%g6
	bcc,a	loop_2392
	edge32l	%o2,	%l2,	%o4
	fmovdne	%xcc,	%f15,	%f20
	sth	%o6,	[%l7 + 0x5C]
loop_2392:
	fbge	%fcc0,	loop_2393
	nop
	setx	0x406B4A45,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	tg	%xcc,	0x3
	set	0x60, %o0
	stxa	%i6,	[%l7 + %o0] 0xe3
	membar	#Sync
loop_2393:
	edge16n	%l6,	%o5,	%g5
	andncc	%l0,	%o0,	%i5
	or	%o1,	%g7,	%i2
	smul	%l3,	%i1,	%g4
	tvc	%xcc,	0x6
	bpos	loop_2394
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i3,	%i0,	%o7
	tn	%xcc,	0x3
loop_2394:
	movcs	%icc,	%i7,	%i4
	ble	%icc,	loop_2395
	bvs,pt	%icc,	loop_2396
	tsubcc	%l4,	0x083F,	%g1
	tsubcctv	%g3,	0x13AF,	%g2
loop_2395:
	andn	%o3,	%l5,	%l1
loop_2396:
	nop
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x52] %asi,	%o2
	fnands	%f0,	%f13,	%f21
	fbe,a	%fcc3,	loop_2397
	tcs	%xcc,	0x6
	movpos	%xcc,	%l2,	%g6
	call	loop_2398
loop_2397:
	fmovscs	%xcc,	%f11,	%f25
	ba	%icc,	loop_2399
	sdivcc	%o6,	0x1EB8,	%o4
loop_2398:
	tpos	%xcc,	0x7
	tne	%xcc,	0x0
loop_2399:
	fmovde	%xcc,	%f27,	%f24
	edge32	%i6,	%o5,	%l6
	orncc	%l0,	0x15C9,	%g5
	movcs	%icc,	%i5,	%o1
	taddcc	%g7,	%i2,	%l3
	fmovdleu	%icc,	%f13,	%f28
	tcs	%icc,	0x5
	srl	%o0,	0x1C,	%g4
	te	%xcc,	0x7
	smulcc	%i1,	%i0,	%o7
	mulx	%i7,	0x0421,	%i4
	orncc	%l4,	0x1A60,	%i3
	nop
	fitos	%f23,	%f29
	std	%f24,	[%l7 + 0x10]
	nop
	fitos	%f7,	%f9
	fstod	%f9,	%f0
	udivx	%g1,	0x03F4,	%g2
	nop
	setx loop_2400, %l0, %l1
	jmpl %l1, %o3
	fabsd	%f12,	%f22
	movrlez	%g3,	%l5,	%l1
	fmovrdgz	%o2,	%f10,	%f4
loop_2400:
	tne	%icc,	0x0
	movcs	%icc,	%l2,	%o6
	tge	%icc,	0x6
	array8	%g6,	%i6,	%o4
	tpos	%icc,	0x1
	smulcc	%o5,	0x145A,	%l0
	fmul8x16al	%f21,	%f2,	%f20
	ta	%icc,	0x1
	movvs	%xcc,	%g5,	%i5
	ta	%xcc,	0x5
	orcc	%o1,	%l6,	%i2
	edge32ln	%g7,	%o0,	%g4
	umul	%i1,	%l3,	%i0
	tg	%xcc,	0x3
	wr	%g0,	0x27,	%asi
	stha	%o7,	[%l7 + 0x5C] %asi
	membar	#Sync
	sdivx	%i7,	0x0526,	%i4
	fbu	%fcc2,	loop_2401
	fone	%f14
	addc	%i3,	%l4,	%g2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x32] %asi,	%o3
loop_2401:
	movn	%icc,	%g1,	%g3
	tpos	%icc,	0x2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x20] %asi,	%l1
	movrlz	%l5,	0x291,	%l2
	sra	%o6,	0x10,	%o2
	udivcc	%i6,	0x0EAD,	%g6
	alignaddrl	%o5,	%l0,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x5
	nop
	setx loop_2402, %l0, %l1
	jmpl %l1, %i5
	fmovrdgez	%o1,	%f6,	%f18
	swap	[%l7 + 0x14],	%l6
	sir	0x1CCF
loop_2402:
	faligndata	%f14,	%f10,	%f28
	fnors	%f1,	%f14,	%f29
	mulscc	%i2,	0x00A4,	%o4
	nop
	setx	0x9E6D31C821226CFB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x0BA1EED1910FF1CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f20,	%f4
	fmovrslez	%g7,	%f10,	%f4
	umulcc	%o0,	%g4,	%i1
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0xf8,	%f0
	fcmpgt16	%f18,	%f14,	%l3
	brnz	%i0,	loop_2403
	srl	%i7,	%o7,	%i4
	xorcc	%l4,	%g2,	%o3
	fmovd	%f14,	%f18
loop_2403:
	bcs,a,pt	%icc,	loop_2404
	ta	%xcc,	0x7
	tcc	%xcc,	0x3
	bg	loop_2405
loop_2404:
	stx	%g1,	[%l7 + 0x48]
	andcc	%i3,	0x1462,	%g3
	fcmpgt32	%f14,	%f20,	%l5
loop_2405:
	array16	%l2,	%l1,	%o6
	add	%i6,	%g6,	%o2
	brz,a	%o5,	loop_2406
	tsubcc	%g5,	0x0D8E,	%i5
	edge32n	%o1,	%l6,	%i2
	fpsub16s	%f25,	%f16,	%f24
loop_2406:
	ble,a,pt	%xcc,	loop_2407
	fmul8ulx16	%f28,	%f6,	%f4
	sub	%l0,	0x028C,	%g7
	sdivx	%o0,	0x032C,	%o4
loop_2407:
	alignaddr	%g4,	%i1,	%l3
	fmovrdlz	%i7,	%f30,	%f16
	movpos	%xcc,	%i0,	%o7
	fnot2	%f6,	%f10
	fsrc1s	%f19,	%f5
	taddcctv	%l4,	0x109C,	%g2
	fblg	%fcc2,	loop_2408
	tleu	%icc,	0x2
	sra	%o3,	0x06,	%g1
	array16	%i3,	%g3,	%l5
loop_2408:
	fcmpgt32	%f2,	%f18,	%l2
	movne	%icc,	%i4,	%l1
	edge8	%i6,	%o6,	%o2
	tcs	%icc,	0x2
	nop
	fitod	%f16,	%f4
	tcc	%xcc,	0x4
	fmovsne	%xcc,	%f8,	%f6
	fmovse	%icc,	%f13,	%f5
	movn	%xcc,	%g6,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc3,	loop_2409
	xorcc	%o5,	%o1,	%i5
	nop
	setx	0xFBCC11FA73477BD2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xCD125B57D1F23D4F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f2,	%f26
	bvs,a	%xcc,	loop_2410
loop_2409:
	brgz,a	%i2,	loop_2411
	edge16n	%l6,	%l0,	%g7
	udiv	%o4,	0x0FEE,	%o0
loop_2410:
	nop
	set	0x46, %l0
	stb	%i1,	[%l7 + %l0]
loop_2411:
	edge8n	%g4,	%l3,	%i0
	udivx	%o7,	0x15FC,	%l4
	nop
	set	0x2C, %i3
	lduw	[%l7 + %i3],	%i7
	tle	%xcc,	0x4
	fpadd16s	%f2,	%f1,	%f13
	tcs	%xcc,	0x7
	srlx	%g2,	0x12,	%o3
	fbuge	%fcc1,	loop_2412
	prefetch	[%l7 + 0x60],	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g1,	0x10A5,	%g3
loop_2412:
	fmovrdlez	%i3,	%f0,	%f26
	alignaddr	%l5,	%i4,	%l2
	fandnot1s	%f14,	%f31,	%f17
	tge	%xcc,	0x4
	array32	%l1,	%i6,	%o6
	addc	%g6,	0x17EE,	%o2
	mulscc	%g5,	0x1D43,	%o1
	bshuffle	%f12,	%f10,	%f2
	edge8l	%o5,	%i2,	%l6
	edge32l	%l0,	%g7,	%o4
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ta	%xcc,	0x7
	fmul8sux16	%f22,	%f12,	%f28
	tvs	%icc,	0x7
	fcmpgt32	%f18,	%f26,	%o0
	stw	%i1,	[%l7 + 0x1C]
	movrgez	%i5,	0x355,	%l3
	tvc	%icc,	0x7
	mulscc	%i0,	0x1FC5,	%o7
	bneg,a,pt	%xcc,	loop_2413
	nop
	setx	0x004A16C2CCDB162D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f28
	tvc	%icc,	0x5
	popc	%l4,	%g4
loop_2413:
	movcs	%xcc,	%g2,	%i7
	set	0x27, %l4
	stba	%o3,	[%l7 + %l4] 0x10
	std	%f22,	[%l7 + 0x10]
	movrlez	%g1,	%g3,	%l5
	orcc	%i4,	0x13BC,	%i3
	nop
	fitod	%f12,	%f4
	te	%xcc,	0x2
	fmovdpos	%icc,	%f0,	%f2
	fnands	%f2,	%f12,	%f22
	fandnot2	%f8,	%f8,	%f4
	fbuge	%fcc0,	loop_2414
	edge16	%l1,	%i6,	%o6
	srax	%g6,	0x14,	%o2
	andn	%g5,	%l2,	%o5
loop_2414:
	fnot2s	%f10,	%f1
	movrlz	%i2,	0x16A,	%o1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x44] %asi,	%l0
	fnegd	%f0,	%f26
	add	%g7,	%l6,	%o4
	tsubcctv	%o0,	0x1C33,	%i5
	edge32n	%i1,	%l3,	%i0
	bg,pn	%xcc,	loop_2415
	nop
	fitod	%f5,	%f12
	nop
	setx	0x4093CA34A0617D0E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xB7A2963EFB9E0CCE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f10,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2415:
	xorcc	%o7,	0x0730,	%l4
	movvc	%xcc,	%g4,	%i7
	brlez,a	%g2,	loop_2416
	popc	0x19B8,	%g1
	nop
	setx	0xD09449D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x29D33914,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f2,	%f7
	movgu	%icc,	%g3,	%o3
loop_2416:
	tcc	%xcc,	0x2
	tsubcctv	%i4,	0x0368,	%l5
	bl,a,pt	%icc,	loop_2417
	tvc	%icc,	0x7
	bcs,a,pn	%icc,	loop_2418
	movleu	%xcc,	%l1,	%i3
loop_2417:
	tg	%xcc,	0x0
	be	%xcc,	loop_2419
loop_2418:
	srlx	%i6,	%g6,	%o2
	fcmple16	%f26,	%f20,	%g5
	sllx	%o6,	%l2,	%o5
loop_2419:
	edge32	%o1,	%i2,	%g7
	wr	%g0,	0x19,	%asi
	sta	%f8,	[%l7 + 0x08] %asi
	taddcc	%l6,	%l0,	%o0
	udivx	%o4,	0x1F3A,	%i5
	set	0x50, %g5
	lduha	[%l7 + %g5] 0x0c,	%i1
	tcc	%xcc,	0x2
	fornot2s	%f28,	%f4,	%f25
	sub	%i0,	0x1359,	%o7
	tleu	%xcc,	0x4
	udivcc	%l4,	0x1265,	%l3
	stw	%i7,	[%l7 + 0x4C]
	nop
	fitod	%f10,	%f12
	fdtoi	%f12,	%f23
	movrgez	%g2,	%g4,	%g1
	bl,pt	%xcc,	loop_2420
	move	%icc,	%o3,	%i4
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x0
loop_2420:
	edge16	%g3,	%l1,	%i6
	fpack16	%f28,	%f14
	fblg	%fcc1,	loop_2421
	stbar
	srl	%g6,	0x1D,	%i3
	sra	%o2,	0x0C,	%g5
loop_2421:
	fmovs	%f6,	%f30
	movgu	%xcc,	%l2,	%o6
	movge	%icc,	%o5,	%i2
	array32	%g7,	%o1,	%l0
	edge32	%l6,	%o0,	%o4
	xnorcc	%i5,	%i1,	%o7
	bne,a,pn	%xcc,	loop_2422
	edge32n	%i0,	%l3,	%i7
	orn	%g2,	0x1811,	%g4
	tne	%icc,	0x3
loop_2422:
	movrlz	%l4,	0x053,	%g1
	fmul8x16al	%f26,	%f25,	%f18
	sra	%o3,	0x06,	%l5
	ldd	[%l7 + 0x40],	%f14
	fbn,a	%fcc0,	loop_2423
	te	%icc,	0x5
	fxnor	%f0,	%f10,	%f26
	edge8	%i4,	%l1,	%g3
loop_2423:
	bcs,a	%icc,	loop_2424
	addcc	%g6,	0x1969,	%i6
	fmuld8ulx16	%f3,	%f23,	%f30
	fmovsn	%icc,	%f5,	%f9
loop_2424:
	fnands	%f22,	%f27,	%f16
	fbn,a	%fcc3,	loop_2425
	sllx	%o2,	%g5,	%l2
	fmovsneg	%icc,	%f8,	%f14
	movne	%icc,	%i3,	%o6
loop_2425:
	fcmple16	%f30,	%f30,	%i2
	stbar
	movrne	%g7,	0x27D,	%o1
	movle	%xcc,	%o5,	%l6
	fmovdge	%icc,	%f27,	%f9
	smul	%l0,	0x1F6E,	%o4
	fnot2	%f16,	%f30
	tcs	%xcc,	0x7
	subccc	%i5,	0x1557,	%i1
	move	%xcc,	%o7,	%i0
	edge32	%o0,	%l3,	%i7
	nop
	setx	0xB35277DF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x67ACB0B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fsubs	%f1,	%f29,	%f9
	addc	%g4,	%l4,	%g1
	movrlz	%g2,	%o3,	%l5
	fnors	%f15,	%f21,	%f26
	movn	%icc,	%l1,	%g3
	sdivcc	%g6,	0x1739,	%i4
	movrlz	%o2,	0x37D,	%i6
	alignaddrl	%l2,	%i3,	%o6
	fornot1	%f0,	%f4,	%f6
	fpsub16s	%f9,	%f8,	%f2
	fbule,a	%fcc2,	loop_2426
	ldstub	[%l7 + 0x70],	%g5
	xorcc	%i2,	0x05D6,	%o1
	subccc	%g7,	0x14CA,	%o5
loop_2426:
	brgz	%l6,	loop_2427
	orcc	%l0,	%o4,	%i5
	tvc	%icc,	0x0
	movge	%xcc,	%o7,	%i1
loop_2427:
	mulscc	%i0,	%o0,	%l3
	udiv	%i7,	0x1DA2,	%l4
	fbl	%fcc2,	loop_2428
	faligndata	%f30,	%f2,	%f30
	set	0x6C, %l5
	lda	[%l7 + %l5] 0x0c,	%f0
loop_2428:
	brlz	%g4,	loop_2429
	tsubcctv	%g2,	%o3,	%l5
	array16	%g1,	%g3,	%g6
	lduw	[%l7 + 0x58],	%l1
loop_2429:
	nop
	setx	0x10767A4C,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	edge32ln	%i4,	%i6,	%l2
	ld	[%l7 + 0x58],	%f0
	ldd	[%l7 + 0x28],	%i2
	array32	%o2,	%o6,	%g5
	nop
	fitod	%f8,	%f26
	fdtox	%f26,	%f16
	fbg,a	%fcc2,	loop_2430
	tsubcctv	%i2,	%o1,	%o5
	fbug,a	%fcc3,	loop_2431
	movrgz	%g7,	0x263,	%l6
loop_2430:
	subccc	%o4,	0x062B,	%l0
	subcc	%i5,	0x142C,	%o7
loop_2431:
	andncc	%i0,	%o0,	%i1
	fmovdvc	%xcc,	%f26,	%f5
	movleu	%icc,	%l3,	%i7
	tvs	%xcc,	0x5
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g4
	fmovrsgz	%g2,	%f9,	%f21
	bge,a	%xcc,	loop_2432
	edge32l	%l4,	%l5,	%o3
	tn	%icc,	0x7
	xnorcc	%g3,	%g6,	%g1
loop_2432:
	edge16ln	%l1,	%i6,	%i4
	srax	%i3,	0x0B,	%l2
	edge32ln	%o2,	%o6,	%g5
	movge	%icc,	%o1,	%o5
	edge32ln	%g7,	%i2,	%o4
	taddcc	%l0,	0x143D,	%i5
	sdivx	%o7,	0x169E,	%l6
	sll	%o0,	%i1,	%i0
	udiv	%i7,	0x0A02,	%g4
	sdiv	%g2,	0x1FA2,	%l3
	subc	%l4,	%o3,	%l5
	bvs	%icc,	loop_2433
	nop
	setx	0xE03DC01E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f6
	brnz,a	%g6,	loop_2434
	tneg	%icc,	0x5
loop_2433:
	fmovrsne	%g3,	%f20,	%f11
	fpack16	%f14,	%f29
loop_2434:
	tne	%icc,	0x5
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x10,	%f16
	taddcctv	%l1,	%g1,	%i4
	nop
	fitos	%f12,	%f23
	fstox	%f23,	%f24
	fxtos	%f24,	%f4
	add	%i3,	%l2,	%i6
	ta	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o2,	%o6,	%o1
	subccc	%g5,	0x1C64,	%g7
	andn	%i2,	%o4,	%l0
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x0c
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x30] %asi,	%i5
	movrlz	%o5,	0x244,	%l6
	tgu	%xcc,	0x0
	smulcc	%o0,	0x144D,	%i1
	fzeros	%f5
	fnand	%f22,	%f24,	%f6
	subcc	%o7,	%i7,	%i0
	orcc	%g2,	0x1D95,	%g4
	fbul	%fcc2,	loop_2435
	stw	%l4,	[%l7 + 0x64]
	nop
	setx	0x2F7AB8C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f8
	taddcctv	%o3,	0x1896,	%l3
loop_2435:
	nop
	set	0x48, %i4
	prefetcha	[%l7 + %i4] 0x11,	 0x2
	fbo,a	%fcc1,	loop_2436
	edge8ln	%g6,	%l1,	%g1
	fnor	%f18,	%f22,	%f22
	orncc	%g3,	%i3,	%l2
loop_2436:
	tge	%icc,	0x1
	fcmple16	%f12,	%f16,	%i4
	sub	%i6,	%o6,	%o2
	bn	loop_2437
	movrlz	%g5,	0x2FB,	%o1
	addccc	%i2,	0x1326,	%g7
	xnorcc	%l0,	0x1CA2,	%o4
loop_2437:
	fabss	%f28,	%f25
	tvc	%icc,	0x3
	movne	%icc,	%o5,	%i5
	ta	%icc,	0x6
	bcc	%icc,	loop_2438
	fnot1	%f24,	%f18
	fornot1	%f0,	%f14,	%f20
	fexpand	%f21,	%f14
loop_2438:
	tgu	%icc,	0x7
	nop
	fitos	%f9,	%f16
	fstod	%f16,	%f0
	tvc	%xcc,	0x6
	edge8l	%l6,	%i1,	%o0
	tcs	%xcc,	0x7
	edge32ln	%i7,	%i0,	%g2
	ld	[%l7 + 0x18],	%f24
	smul	%g4,	%o7,	%o3
	fornot1	%f4,	%f18,	%f26
	fbe,a	%fcc3,	loop_2439
	edge8l	%l4,	%l5,	%l3
	tge	%icc,	0x6
	movleu	%xcc,	%g6,	%g1
loop_2439:
	subccc	%l1,	%i3,	%l2
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%g3
	bpos,a	loop_2440
	ldstub	[%l7 + 0x3A],	%i4
	brnz	%i6,	loop_2441
	ta	%xcc,	0x6
loop_2440:
	tne	%xcc,	0x3
	mova	%icc,	%o2,	%o6
loop_2441:
	fmovdvs	%icc,	%f7,	%f19
	fmovdge	%icc,	%f21,	%f31
	movvc	%icc,	%o1,	%i2
	set	0x70, %o6
	stxa	%g7,	[%l7 + %o6] 0x27
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x04E1,	%g5
	orncc	%l0,	0x0A9F,	%o5
	fmovsne	%icc,	%f28,	%f2
	tsubcctv	%i5,	%l6,	%o4
	sdivcc	%i1,	0x124F,	%o0
	brz,a	%i7,	loop_2442
	lduw	[%l7 + 0x0C],	%i0
	fsrc2	%f6,	%f10
	fcmpne32	%f10,	%f30,	%g2
loop_2442:
	swap	[%l7 + 0x5C],	%o7
	nop
	fitos	%f0,	%f17
	fstox	%f17,	%f18
	fxtos	%f18,	%f6
	movl	%icc,	%o3,	%l4
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%l5,	%l3
	fmovd	%f10,	%f4
	smul	%g6,	0x0851,	%g1
	set	0x5C, %g2
	stha	%l1,	[%l7 + %g2] 0x11
	udivx	%g4,	0x1603,	%i3
	sra	%g3,	%i4,	%i6
	xorcc	%l2,	%o6,	%o2
	sir	0x07CA
	fmovda	%icc,	%f14,	%f2
	sdivx	%o1,	0x07E2,	%i2
	ldsb	[%l7 + 0x51],	%g7
	orncc	%l0,	0x1C87,	%g5
	nop
	fitos	%f7,	%f25
	fstox	%f25,	%f6
	fxtos	%f6,	%f16
	movrgz	%i5,	%l6,	%o5
	ldsb	[%l7 + 0x1C],	%o4
	fmovdvs	%xcc,	%f28,	%f11
	addcc	%i1,	%i7,	%o0
	sdivx	%g2,	0x1FEF,	%i0
	tvc	%xcc,	0x2
	fmul8ulx16	%f24,	%f22,	%f20
	fandnot2s	%f10,	%f16,	%f6
	wr	%g0,	0x04,	%asi
	stba	%o3,	[%l7 + 0x41] %asi
	addc	%o7,	0x1654,	%l5
	fpsub32	%f30,	%f30,	%f0
	tn	%xcc,	0x0
	edge16ln	%l3,	%g6,	%g1
	smul	%l4,	%l1,	%g4
	sethi	0x0989,	%i3
	te	%xcc,	0x2
	movne	%xcc,	%g3,	%i4
	tg	%icc,	0x5
	be,pn	%icc,	loop_2443
	fmovrdlz	%l2,	%f22,	%f22
	sll	%i6,	0x00,	%o2
	fmovsleu	%xcc,	%f28,	%f20
loop_2443:
	movrlez	%o6,	0x14E,	%i2
	srlx	%g7,	%o1,	%g5
	fmovsgu	%xcc,	%f28,	%f9
	fmovdpos	%xcc,	%f26,	%f29
	wr	%g0,	0x27,	%asi
	stba	%i5,	[%l7 + 0x0A] %asi
	membar	#Sync
	mulx	%l6,	0x0AD3,	%l0
	std	%f16,	[%l7 + 0x20]
	movg	%icc,	%o4,	%i1
	nop
	setx	0xA6438FC200428E71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f0,	%f24,	%f28
	tneg	%icc,	0x7
	fabsd	%f6,	%f0
	movrgez	%i7,	0x104,	%o0
	orcc	%g2,	%o5,	%o3
	fornot2s	%f12,	%f27,	%f9
	movrgz	%i0,	%l5,	%l3
	tsubcctv	%o7,	0x1DE5,	%g6
	fnands	%f2,	%f21,	%f29
	nop
	setx	loop_2444,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdgu	%icc,	%f0,	%f27
	fandnot1s	%f8,	%f23,	%f1
	edge32ln	%l4,	%g1,	%g4
loop_2444:
	fbge,a	%fcc1,	loop_2445
	fxnors	%f26,	%f30,	%f26
	movg	%icc,	%i3,	%g3
	fbe	%fcc0,	loop_2446
loop_2445:
	xnorcc	%l1,	0x0B0F,	%i4
	fnot2	%f2,	%f20
	bleu,pt	%xcc,	loop_2447
loop_2446:
	fblg	%fcc3,	loop_2448
	edge16l	%l2,	%i6,	%o2
	movrlez	%o6,	0x36E,	%g7
loop_2447:
	fornot1	%f0,	%f28,	%f4
loop_2448:
	fbo	%fcc0,	loop_2449
	fcmpeq16	%f30,	%f12,	%i2
	andcc	%g5,	0x037F,	%o1
	movge	%xcc,	%i5,	%l0
loop_2449:
	tl	%xcc,	0x1
	and	%l6,	%i1,	%i7
	ldsb	[%l7 + 0x63],	%o4
	alignaddrl	%o0,	%g2,	%o5
	smul	%o3,	%i0,	%l5
	add	%l3,	0x165C,	%g6
	movre	%l4,	%g1,	%o7
	andncc	%g4,	%g3,	%l1
	edge32n	%i4,	%i3,	%i6
	nop
	setx	0x493C8B43825FE6BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x9B1F78A734FB93A9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f6,	%f10
	nop
	setx	0x5F59DCFBB5B4F00F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x709DA67C2B1A6381,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f22,	%f26
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x48] %asi,	%o2
	move	%xcc,	%o6,	%l2
	tle	%xcc,	0x3
	alignaddrl	%i2,	%g5,	%g7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i5,	%l0
	orn	%o1,	%l6,	%i7
	ldd	[%l7 + 0x68],	%i0
	stx	%o4,	[%l7 + 0x38]
	set	0x4C, %o5
	ldswa	[%l7 + %o5] 0x19,	%o0
	edge32l	%o5,	%g2,	%o3
	fmovdl	%xcc,	%f11,	%f14
	bneg,a,pt	%xcc,	loop_2450
	movrgz	%l5,	%l3,	%i0
	subcc	%g6,	%l4,	%g1
	tneg	%xcc,	0x2
loop_2450:
	tn	%icc,	0x5
	movrne	%o7,	%g3,	%l1
	movre	%g4,	%i3,	%i4
	set	0x30, %g6
	lduwa	[%l7 + %g6] 0x15,	%o2
	fmuld8ulx16	%f21,	%f13,	%f20
	sdiv	%i6,	0x0F5A,	%o6
	ta	%icc,	0x3
	edge32ln	%l2,	%i2,	%g5
	addc	%i5,	0x07F8,	%g7
	fmovde	%icc,	%f5,	%f3
	fxors	%f8,	%f16,	%f19
	fpadd32s	%f6,	%f10,	%f29
	or	%l0,	0x0473,	%l6
	nop
	setx	loop_2451,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0xAB7ADB077046FDC6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	tleu	%icc,	0x4
	or	%o1,	%i1,	%i7
loop_2451:
	and	%o4,	%o5,	%g2
	fmovsne	%xcc,	%f16,	%f27
	xnorcc	%o0,	%o3,	%l3
	movvc	%icc,	%l5,	%g6
	std	%f30,	[%l7 + 0x18]
	set	0x1E, %o7
	ldsba	[%l7 + %o7] 0x10,	%i0
	edge32	%g1,	%o7,	%l4
	sra	%l1,	0x1E,	%g3
	fcmpgt16	%f16,	%f18,	%i3
	sth	%i4,	[%l7 + 0x14]
	movleu	%icc,	%o2,	%g4
	fbule,a	%fcc1,	loop_2452
	pdist	%f16,	%f24,	%f30
	tgu	%xcc,	0x4
	movgu	%icc,	%o6,	%l2
loop_2452:
	fones	%f28
	movle	%icc,	%i2,	%g5
	tle	%icc,	0x4
	xnorcc	%i5,	0x1953,	%g7
	lduw	[%l7 + 0x7C],	%i6
	sdivcc	%l6,	0x0BB7,	%l0
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%i1
	nop
	fitos	%f29,	%f21
	fblg	%fcc0,	loop_2453
	fbl	%fcc1,	loop_2454
	movl	%xcc,	%o1,	%i7
	fand	%f20,	%f4,	%f26
loop_2453:
	add	%o5,	0x04D9,	%o4
loop_2454:
	ld	[%l7 + 0x10],	%f19
	movge	%icc,	%o0,	%g2
	tne	%icc,	0x4
	movvs	%xcc,	%l3,	%l5
	nop
	setx	0xAFF81635E4FCCE6E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xD979710DF65EE3FD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f28,	%f24
	movrlz	%g6,	%o3,	%i0
	bpos	loop_2455
	edge32ln	%g1,	%o7,	%l1
	tgu	%icc,	0x3
	nop
	set	0x3B, %o3
	stb	%g3,	[%l7 + %o3]
loop_2455:
	sdivcc	%i3,	0x05BD,	%l4
	movl	%xcc,	%o2,	%g4
	ldsh	[%l7 + 0x4E],	%o6
	movge	%icc,	%l2,	%i2
	udivx	%g5,	0x0D92,	%i5
	brlez,a	%g7,	loop_2456
	movcs	%icc,	%i6,	%l6
	fsrc2s	%f0,	%f7
	bpos,pt	%icc,	loop_2457
loop_2456:
	edge8l	%i4,	%l0,	%i1
	fmovdleu	%icc,	%f16,	%f15
	set	0x60, %g7
	lduwa	[%l7 + %g7] 0x11,	%i7
loop_2457:
	fpadd16	%f2,	%f20,	%f8
	fsrc2	%f30,	%f30
	set	0x12, %i7
	ldstuba	[%l7 + %i7] 0x11,	%o5
	movrlz	%o4,	%o1,	%g2
	edge32n	%l3,	%l5,	%o0
	movleu	%xcc,	%o3,	%g6
	movleu	%icc,	%i0,	%g1
	fnors	%f8,	%f17,	%f30
	edge8l	%o7,	%l1,	%g3
	and	%i3,	%o2,	%l4
	movrne	%g4,	%o6,	%l2
	movne	%icc,	%i2,	%g5
	sub	%i5,	%g7,	%i6
	nop
	set	0x54, %l6
	ldsw	[%l7 + %l6],	%l6
	mova	%xcc,	%i4,	%i1
	fcmple16	%f0,	%f22,	%i7
	tne	%xcc,	0x4
	ld	[%l7 + 0x7C],	%f31
	or	%o5,	0x0C24,	%l0
	srl	%o4,	0x01,	%o1
	brnz	%l3,	loop_2458
	tpos	%icc,	0x4
	tpos	%icc,	0x6
	fmovdne	%xcc,	%f31,	%f5
loop_2458:
	bg,a,pn	%xcc,	loop_2459
	smulcc	%g2,	%l5,	%o0
	fexpand	%f24,	%f30
	fandnot2s	%f3,	%f13,	%f26
loop_2459:
	fxnors	%f27,	%f3,	%f30
	movle	%xcc,	%o3,	%g6
	smulcc	%i0,	%g1,	%l1
	smul	%g3,	%o7,	%o2
	sth	%l4,	[%l7 + 0x74]
	nop
	setx	0x51548FF5106143D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	sra	%i3,	0x0D,	%o6
	or	%l2,	%i2,	%g5
	popc	0x0735,	%g4
	sdiv	%i5,	0x1939,	%i6
	movrne	%g7,	%l6,	%i1
	xor	%i4,	%i7,	%o5
	movvs	%icc,	%l0,	%o1
	edge8l	%o4,	%g2,	%l5
	sir	0x0F01
	ldsh	[%l7 + 0x0A],	%o0
	lduw	[%l7 + 0x0C],	%o3
	fmovdn	%xcc,	%f25,	%f23
	brlez,a	%g6,	loop_2460
	mulx	%l3,	0x0F2E,	%g1
	sethi	0x173F,	%l1
	alignaddrl	%i0,	%g3,	%o7
loop_2460:
	umulcc	%l4,	0x06A7,	%i3
	andn	%o2,	%o6,	%l2
	edge32n	%i2,	%g5,	%i5
	orcc	%g4,	%g7,	%l6
	fmovdne	%xcc,	%f6,	%f14
	nop
	setx loop_2461, %l0, %l1
	jmpl %l1, %i1
	movle	%xcc,	%i4,	%i6
	tneg	%icc,	0x1
	srax	%i7,	0x0E,	%l0
loop_2461:
	stbar
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o5
	subcc	%o1,	0x0B16,	%o4
	tle	%xcc,	0x5
	st	%f9,	[%l7 + 0x54]
	andn	%g2,	0x169F,	%o0
	nop
	fitod	%f12,	%f28
	fdtos	%f28,	%f23
	movg	%icc,	%o3,	%l5
	andncc	%g6,	%g1,	%l1
	fbuge,a	%fcc2,	loop_2462
	ta	%icc,	0x4
	set	0x38, %g4
	prefetcha	[%l7 + %g4] 0x14,	 0x1
loop_2462:
	bgu,a	%xcc,	loop_2463
	tvs	%xcc,	0x7
	movvs	%xcc,	%i0,	%g3
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x30] %asi,	%o6
loop_2463:
	movrne	%l4,	0x02A,	%i3
	subccc	%o6,	0x1A62,	%l2
	movn	%xcc,	%o2,	%g5
	fabsd	%f6,	%f24
	fsrc2s	%f3,	%f29
	taddcc	%i5,	%i2,	%g7
	tn	%xcc,	0x7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movge	%xcc,	%l6,	%g4
	wr	%g0,	0x0c,	%asi
	stwa	%i4,	[%l7 + 0x18] %asi
	tg	%icc,	0x0
	sethi	0x17F6,	%i1
	edge32n	%i7,	%l0,	%i6
	edge16l	%o1,	%o5,	%o4
	fnot1s	%f22,	%f4
	fornot2s	%f26,	%f19,	%f10
	add	%g2,	%o0,	%l5
	edge32n	%o3,	%g6,	%l1
	orn	%l3,	0x0DF5,	%i0
	wr	%g0,	0x2a,	%asi
	stba	%g1,	[%l7 + 0x0B] %asi
	membar	#Sync
	mova	%icc,	%o7,	%l4
	and	%g3,	0x0420,	%i3
	sethi	0x09D2,	%l2
	fblg	%fcc0,	loop_2464
	addcc	%o6,	0x1137,	%g5
	tleu	%icc,	0x4
	fsrc1s	%f19,	%f2
loop_2464:
	tn	%xcc,	0x3
	tge	%xcc,	0x2
	prefetch	[%l7 + 0x68],	 0x0
	srax	%o2,	%i2,	%g7
	edge32ln	%l6,	%g4,	%i4
	fpadd16	%f14,	%f0,	%f24
	mulscc	%i5,	%i1,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbo	%fcc1,	loop_2465
	addcc	%i6,	%l0,	%o5
	edge16l	%o4,	%o1,	%g2
	sdivcc	%l5,	0x1CDC,	%o0
loop_2465:
	nop
	setx loop_2466, %l0, %l1
	jmpl %l1, %o3
	array32	%g6,	%l1,	%i0
	sllx	%g1,	0x0A,	%l3
	taddcc	%o7,	%l4,	%g3
loop_2466:
	xnorcc	%l2,	0x0411,	%i3
	movleu	%icc,	%o6,	%o2
	bcc,pn	%xcc,	loop_2467
	fcmpne32	%f24,	%f30,	%i2
	srax	%g5,	%g7,	%g4
	movrgez	%i4,	0x1B2,	%i5
loop_2467:
	tn	%icc,	0x4
	sub	%i1,	%i7,	%i6
	fpackfix	%f10,	%f21
	stbar
	xnor	%l0,	0x0BE2,	%l6
	edge16n	%o4,	%o1,	%o5
	ta	%icc,	0x7
	fone	%f2
	bleu	loop_2468
	nop
	setx	0xC05879B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	set	0x70, %g3
	ldxa	[%l7 + %g3] 0x11,	%g2
loop_2468:
	fmovse	%xcc,	%f6,	%f11
	fsrc2	%f30,	%f6
	fnor	%f2,	%f6,	%f4
	fmovsle	%icc,	%f26,	%f2
	sdiv	%o0,	0x1597,	%l5
	st	%f9,	[%l7 + 0x10]
	membar	0x48
	ldstub	[%l7 + 0x18],	%g6
	brgez	%o3,	loop_2469
	ldstub	[%l7 + 0x09],	%l1
	ta	%icc,	0x5
	bcc	%xcc,	loop_2470
loop_2469:
	and	%i0,	0x01EC,	%l3
	membar	0x71
	nop
	fitos	%f11,	%f5
	fstox	%f5,	%f22
	fxtos	%f22,	%f27
loop_2470:
	tne	%xcc,	0x1
	sir	0x100F
	edge8n	%g1,	%o7,	%l4
	fmovdcc	%xcc,	%f30,	%f1
	movgu	%xcc,	%l2,	%g3
	nop
	setx	loop_2471,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%o6,	%o2,	%i3
	sethi	0x1E06,	%i2
	nop
	fitos	%f1,	%f27
	fstox	%f27,	%f12
loop_2471:
	fbu,a	%fcc2,	loop_2472
	tpos	%icc,	0x1
	tpos	%icc,	0x7
	fornot1	%f28,	%f4,	%f26
loop_2472:
	edge16l	%g5,	%g4,	%i4
	fcmpgt16	%f16,	%f28,	%g7
	tg	%xcc,	0x0
	tgu	%icc,	0x4
	movcs	%xcc,	%i5,	%i1
	brgz	%i7,	loop_2473
	fandnot1s	%f13,	%f25,	%f11
	st	%f11,	[%l7 + 0x20]
	xorcc	%i6,	0x0F85,	%l6
loop_2473:
	movrgz	%o4,	0x13D,	%l0
	fcmpne16	%f18,	%f20,	%o1
	movre	%g2,	%o5,	%l5
	umulcc	%o0,	0x086A,	%g6
	set	0x60, %o2
	stha	%o3,	[%l7 + %o2] 0x11
	fexpand	%f2,	%f30
	fbe	%fcc2,	loop_2474
	fpack32	%f2,	%f24,	%f16
	fmovsa	%icc,	%f19,	%f16
	andncc	%i0,	%l1,	%g1
loop_2474:
	edge8l	%l3,	%l4,	%l2
	popc	0x0BA4,	%o7
	fmul8x16	%f8,	%f20,	%f24
	movl	%xcc,	%o6,	%g3
	udivcc	%o2,	0x10D4,	%i2
	srlx	%g5,	%g4,	%i4
	fbge	%fcc3,	loop_2475
	fcmpne16	%f22,	%f0,	%i3
	add	%i5,	%i1,	%g7
	edge8ln	%i6,	%l6,	%o4
loop_2475:
	fmovs	%f24,	%f7
	lduw	[%l7 + 0x08],	%i7
	edge16ln	%l0,	%o1,	%g2
	st	%f29,	[%l7 + 0x6C]
	udivcc	%o5,	0x0E58,	%o0
	tgu	%icc,	0x2
	and	%l5,	0x1D19,	%o3
	tsubcc	%i0,	%l1,	%g6
	umulcc	%l3,	0x077F,	%l4
	tneg	%icc,	0x4
	ta	%xcc,	0x3
	fmovsg	%icc,	%f11,	%f14
	sll	%g1,	%l2,	%o6
	movneg	%icc,	%o7,	%g3
	sll	%i2,	%o2,	%g4
	orncc	%g5,	0x1CCB,	%i4
	movn	%xcc,	%i3,	%i5
	movrne	%i1,	%i6,	%g7
	edge8ln	%o4,	%i7,	%l6
	tn	%xcc,	0x7
	edge16ln	%o1,	%l0,	%o5
	xorcc	%g2,	%o0,	%l5
	subcc	%i0,	%l1,	%g6
	umul	%o3,	%l4,	%l3
	nop
	setx	0xD97BE529,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x5DCEB780,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f24,	%f7
	edge16n	%l2,	%g1,	%o7
	nop
	setx	0x45A53363,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xE4AAD583,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f22,	%f8
	tcs	%icc,	0x5
	alignaddrl	%g3,	%i2,	%o2
	fandnot2	%f26,	%f2,	%f8
	ldub	[%l7 + 0x12],	%o6
	fmovd	%f4,	%f30
	stx	%g5,	[%l7 + 0x38]
	tn	%xcc,	0x6
	ld	[%l7 + 0x50],	%f26
	fbg	%fcc3,	loop_2476
	nop
	setx	0xE85BDCD52C8B006E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x54B1FA579DD2859F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f0,	%f24
	te	%xcc,	0x2
	popc	%g4,	%i3
loop_2476:
	tg	%icc,	0x4
	andn	%i4,	%i1,	%i6
	tsubcc	%g7,	%i5,	%o4
	set	0x09, %l1
	lduba	[%l7 + %l1] 0x81,	%l6
	fxnors	%f3,	%f20,	%f9
	movneg	%icc,	%o1,	%i7
	nop
	setx loop_2477, %l0, %l1
	jmpl %l1, %l0
	fmovrdgz	%o5,	%f14,	%f14
	lduh	[%l7 + 0x10],	%g2
	edge32ln	%o0,	%i0,	%l5
loop_2477:
	ldub	[%l7 + 0x30],	%l1
	tsubcc	%g6,	%l4,	%l3
	tvs	%icc,	0x6
	udivcc	%o3,	0x0DA7,	%g1
	nop
	setx	loop_2478,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%xcc,	%l2,	%g3
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2478:
	sethi	0x110F,	%o7
	sub	%o2,	%o6,	%g5
	fble	%fcc3,	loop_2479
	alignaddrl	%i2,	%i3,	%i4
	subcc	%g4,	%i1,	%i6
	tpos	%xcc,	0x4
loop_2479:
	tne	%icc,	0x5
	nop
	setx	0xA49A9421,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f25
	ta	%icc,	0x1
	edge16	%i5,	%o4,	%l6
	fmuld8ulx16	%f9,	%f8,	%f22
	stbar
	movre	%g7,	0x185,	%i7
	move	%xcc,	%o1,	%l0
	st	%f20,	[%l7 + 0x7C]
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x44] %asi,	%f26
	movle	%icc,	%g2,	%o5
	smulcc	%o0,	0x074A,	%l5
	nop
	fitod	%f26,	%f4
	stbar
	fmovdneg	%xcc,	%f5,	%f16
	st	%f12,	[%l7 + 0x64]
	fblg	%fcc0,	loop_2480
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x5
	sub	%l1,	0x18D6,	%i0
loop_2480:
	ba,a,pn	%icc,	loop_2481
	fxnors	%f24,	%f24,	%f4
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x26,	%l4
loop_2481:
	edge16l	%g6,	%o3,	%l3
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x74] %asi,	%l2
	bvs,pn	%xcc,	loop_2482
	brnz	%g1,	loop_2483
	sdiv	%g3,	0x0A94,	%o2
	fbge	%fcc1,	loop_2484
loop_2482:
	fmovsvs	%icc,	%f0,	%f2
loop_2483:
	tcc	%xcc,	0x4
	fmovsle	%xcc,	%f3,	%f28
loop_2484:
	orn	%o7,	0x1ADB,	%o6
	mova	%icc,	%i2,	%i3
	fcmple16	%f26,	%f12,	%i4
	for	%f10,	%f16,	%f10
	tg	%icc,	0x0
	mulx	%g5,	%g4,	%i1
	udivx	%i6,	0x17FD,	%o4
	nop
	fitos	%f29,	%f23
	array16	%i5,	%l6,	%g7
	bshuffle	%f6,	%f14,	%f10
	udivcc	%i7,	0x1702,	%o1
	tcc	%xcc,	0x4
	xnorcc	%g2,	0x1544,	%o5
	edge8n	%o0,	%l5,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%i0,	%l4,	%g6
	fands	%f28,	%f31,	%f12
	movge	%xcc,	%l1,	%o3
	movcs	%xcc,	%l2,	%g1
	fbug,a	%fcc2,	loop_2485
	brlz	%g3,	loop_2486
	sdiv	%l3,	0x08FB,	%o2
	edge32ln	%o7,	%o6,	%i3
loop_2485:
	fmovdcs	%xcc,	%f14,	%f28
loop_2486:
	fmovdpos	%icc,	%f21,	%f15
	xor	%i2,	0x07C3,	%g5
	bcc,pt	%xcc,	loop_2487
	movrgz	%i4,	%i1,	%g4
	edge8n	%o4,	%i6,	%i5
	st	%f21,	[%l7 + 0x0C]
loop_2487:
	nop
	set	0x60, %o1
	ldub	[%l7 + %o1],	%g7
	fxnors	%f18,	%f18,	%f18
	fcmpeq16	%f28,	%f10,	%i7
	movcs	%icc,	%o1,	%l6
	edge32ln	%g2,	%o5,	%l5
	movvc	%xcc,	%l0,	%i0
	taddcc	%o0,	0x17E0,	%g6
	mulscc	%l4,	0x180D,	%o3
	ldsb	[%l7 + 0x77],	%l2
	set	0x40, %l2
	stxa	%l1,	[%l7 + %l2] 0xea
	membar	#Sync
	bg,pn	%xcc,	loop_2488
	movcs	%icc,	%g3,	%l3
	sll	%o2,	0x01,	%o7
	edge32n	%o6,	%i3,	%i2
loop_2488:
	tpos	%icc,	0x7
	xnorcc	%g1,	0x0204,	%i4
	andncc	%g5,	%i1,	%o4
	tneg	%icc,	0x1
	movge	%xcc,	%i6,	%g4
	ble,a,pn	%icc,	loop_2489
	membar	0x14
	movre	%i5,	%g7,	%i7
	addccc	%l6,	0x10BC,	%o1
loop_2489:
	sra	%g2,	0x01,	%l5
	fmovrslez	%o5,	%f27,	%f1
	fmovrsne	%i0,	%f13,	%f0
	tcs	%icc,	0x6
	xnorcc	%l0,	0x05C0,	%o0
	movrgez	%g6,	0x3F8,	%l4
	tleu	%icc,	0x2
	nop
	setx	0x2CC4011B8C87BC08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xA7B628B4DF1A9C9F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f0,	%f28
	tg	%icc,	0x1
	fbe	%fcc3,	loop_2490
	flush	%l7 + 0x28
	movle	%icc,	%o3,	%l1
	srl	%l2,	0x0C,	%g3
loop_2490:
	sdivcc	%o2,	0x1E1F,	%o7
	st	%f21,	[%l7 + 0x0C]
	edge32	%l3,	%o6,	%i3
	movrgez	%i2,	0x016,	%g1
	tleu	%xcc,	0x3
	fbg,a	%fcc3,	loop_2491
	fmovspos	%icc,	%f8,	%f19
	sdivcc	%g5,	0x1AD4,	%i1
	smul	%o4,	0x1827,	%i6
loop_2491:
	edge16ln	%i4,	%g4,	%g7
	tsubcctv	%i5,	0x0693,	%i7
	fcmpgt16	%f22,	%f12,	%o1
	sll	%g2,	%l6,	%l5
	ldd	[%l7 + 0x30],	%f12
	nop
	setx	loop_2492,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fxnors	%f16,	%f29,	%f25
	ba,a	%icc,	loop_2493
	nop
	setx	0xD1D6298F605F9184,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_2492:
	movrgez	%i0,	0x198,	%l0
	for	%f4,	%f0,	%f2
loop_2493:
	swap	[%l7 + 0x50],	%o5
	subccc	%o0,	0x0A47,	%g6
	fmovdcs	%icc,	%f19,	%f14
	movn	%icc,	%l4,	%o3
	xnorcc	%l2,	0x10F6,	%g3
	be,a,pn	%icc,	loop_2494
	nop
	setx	0x3BC8C3B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xC8C3D766,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f18,	%f12
	edge16	%l1,	%o7,	%o2
	array16	%l3,	%o6,	%i2
loop_2494:
	umul	%g1,	%g5,	%i3
	xnor	%i1,	%o4,	%i6
	andcc	%i4,	0x0EE8,	%g4
	brnz,a	%i5,	loop_2495
	tleu	%icc,	0x3
	movge	%xcc,	%g7,	%o1
	edge32l	%g2,	%i7,	%l6
loop_2495:
	tvc	%xcc,	0x2
	sdivx	%i0,	0x05C3,	%l0
	ta	%xcc,	0x1
	fbule	%fcc0,	loop_2496
	movrlz	%o5,	0x00D,	%l5
	srax	%g6,	%o0,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2496:
	fmovdcc	%icc,	%f31,	%f18
	prefetch	[%l7 + 0x68],	 0x1
	movge	%xcc,	%l2,	%l4
	tl	%icc,	0x7
	fmovdgu	%xcc,	%f26,	%f1
	movg	%icc,	%g3,	%l1
	fors	%f6,	%f2,	%f0
	fmovsge	%xcc,	%f27,	%f0
	flush	%l7 + 0x0C
	movrgz	%o2,	0x045,	%o7
	xorcc	%l3,	0x1A5A,	%o6
	movpos	%icc,	%g1,	%i2
	sub	%i3,	0x193F,	%g5
	nop
	setx	0x2814D7B7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x220ABA73,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f28,	%f17
	wr	%g0,	0x23,	%asi
	stha	%i1,	[%l7 + 0x26] %asi
	membar	#Sync
	movl	%icc,	%o4,	%i6
	addccc	%i4,	%i5,	%g7
	fba,a	%fcc0,	loop_2497
	mova	%xcc,	%o1,	%g2
	edge16	%i7,	%g4,	%l6
	fpsub16	%f6,	%f6,	%f18
loop_2497:
	nop
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
	movcc	%icc,	%o5,	%l5
	brnz	%l0,	loop_2498
	movrne	%o0,	%o3,	%g6
	fnot1s	%f17,	%f13
	fmovsne	%xcc,	%f30,	%f23
loop_2498:
	nop
	setx	loop_2499,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%l2,	%l4,	%g3
	sra	%l1,	0x05,	%o2
	nop
	setx loop_2500, %l0, %l1
	jmpl %l1, %o7
loop_2499:
	fcmpgt16	%f2,	%f24,	%l3
	nop
	fitos	%f11,	%f6
	fstod	%f6,	%f26
	edge32ln	%o6,	%i2,	%i3
loop_2500:
	fcmpne16	%f24,	%f22,	%g1
	fbn	%fcc0,	loop_2501
	fmovrdlez	%g5,	%f6,	%f18
	edge8l	%i1,	%o4,	%i4
	fbu,a	%fcc1,	loop_2502
loop_2501:
	fmovrdne	%i6,	%f28,	%f30
	bvs	%icc,	loop_2503
	taddcc	%i5,	0x122B,	%g7
loop_2502:
	movrlez	%o1,	0x300,	%i7
	bvs,a,pt	%icc,	loop_2504
loop_2503:
	fcmple32	%f26,	%f4,	%g2
	ldsh	[%l7 + 0x3A],	%g4
	mova	%icc,	%i0,	%l6
loop_2504:
	tneg	%icc,	0x5
	move	%icc,	%o5,	%l0
	array8	%o0,	%o3,	%l5
	bpos,a,pt	%xcc,	loop_2505
	nop
	setx	0x1E854A41F7D0EAD9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xF350B3A9056BA859,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f18,	%f26
	fble,a	%fcc0,	loop_2506
	tl	%xcc,	0x6
loop_2505:
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f30
	tleu	%xcc,	0x1
loop_2506:
	fmovrsgz	%l2,	%f5,	%f13
	movneg	%xcc,	%l4,	%g6
	fbule,a	%fcc0,	loop_2507
	fnot1	%f24,	%f8
	movne	%icc,	%g3,	%o2
	movrne	%o7,	0x06C,	%l3
loop_2507:
	edge8	%l1,	%i2,	%o6
	fnors	%f12,	%f31,	%f0
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x24] %asi,	%g1
	movge	%icc,	%g5,	%i3
	fzeros	%f2
	edge8l	%i1,	%o4,	%i6
	tcc	%xcc,	0x5
	sdivcc	%i4,	0x1258,	%i5
	movcs	%icc,	%g7,	%i7
	tpos	%xcc,	0x3
	fcmpgt32	%f14,	%f4,	%g2
	set	0x0B, %l3
	ldsba	[%l7 + %l3] 0x88,	%g4
	bn	%xcc,	loop_2508
	xorcc	%o1,	0x0A4E,	%l6
	srax	%o5,	%i0,	%o0
	array8	%o3,	%l0,	%l5
loop_2508:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%l4
	ba	%xcc,	loop_2509
	bleu,pn	%xcc,	loop_2510
	bleu	%icc,	loop_2511
	flush	%l7 + 0x14
loop_2509:
	array8	%g6,	%l2,	%g3
loop_2510:
	fcmple32	%f16,	%f24,	%o7
loop_2511:
	fcmple16	%f10,	%f24,	%l3
	addcc	%o2,	%i2,	%l1
	fpadd32s	%f17,	%f23,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o6,	[%l7 + 0x7B]
	movrlez	%g1,	0x28B,	%g5
	umulcc	%i1,	%o4,	%i6
	fpadd32	%f20,	%f6,	%f0
	mulscc	%i4,	0x177B,	%i3
	bgu,pt	%icc,	loop_2512
	fmovrdlz	%i5,	%f12,	%f2
	taddcc	%i7,	0x0FF8,	%g7
	fmovdge	%icc,	%f24,	%f15
loop_2512:
	addccc	%g2,	%o1,	%g4
	fbg	%fcc0,	loop_2513
	ta	%icc,	0x4
	fmovsneg	%icc,	%f26,	%f7
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x10] %asi,	%o5
loop_2513:
	membar	0x17
	array32	%l6,	%i0,	%o3
	edge8l	%o0,	%l0,	%l4
	smul	%g6,	0x0388,	%l2
	edge8ln	%l5,	%g3,	%l3
	fmul8sux16	%f30,	%f20,	%f20
	fnegs	%f22,	%f23
	edge32ln	%o7,	%i2,	%l1
	popc	0x0F71,	%o6
	movpos	%icc,	%g1,	%g5
	ldstub	[%l7 + 0x17],	%i1
	nop
	setx loop_2514, %l0, %l1
	jmpl %l1, %o2
	sir	0x18CC
	nop
	setx	loop_2515,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldstub	[%l7 + 0x31],	%i6
loop_2514:
	fone	%f0
	mulscc	%i4,	%o4,	%i3
loop_2515:
	alignaddr	%i7,	%i5,	%g2
	brlz,a	%o1,	loop_2516
	tgu	%icc,	0x0
	fbule,a	%fcc3,	loop_2517
	movrne	%g4,	%o5,	%g7
loop_2516:
	alignaddr	%l6,	%i0,	%o0
	xorcc	%o3,	0x1189,	%l4
loop_2517:
	edge16	%g6,	%l2,	%l5
	swap	[%l7 + 0x28],	%g3
	brlez	%l3,	loop_2518
	fbge	%fcc0,	loop_2519
	tle	%icc,	0x2
	smulcc	%o7,	%i2,	%l1
loop_2518:
	swap	[%l7 + 0x78],	%o6
loop_2519:
	fmovrdne	%g1,	%f28,	%f22
	tneg	%icc,	0x4
	sdiv	%g5,	0x11B4,	%l0
	faligndata	%f26,	%f24,	%f16
	fcmpne16	%f30,	%f12,	%o2
	fabsd	%f24,	%f16
	movvc	%xcc,	%i6,	%i4
	flush	%l7 + 0x28
	mova	%xcc,	%i1,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o4,	%i5
	membar	0x05
	tneg	%icc,	0x7
	fpsub32s	%f6,	%f24,	%f4
	edge32l	%i7,	%g2,	%o1
	fblg,a	%fcc2,	loop_2520
	nop
	setx loop_2521, %l0, %l1
	jmpl %l1, %o5
	tge	%icc,	0x4
	fmovdge	%icc,	%f3,	%f23
loop_2520:
	ld	[%l7 + 0x3C],	%f31
loop_2521:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x24] %asi,	%g7
	alignaddrl	%g4,	%i0,	%o0
	bn,pn	%xcc,	loop_2522
	tleu	%icc,	0x4
	prefetch	[%l7 + 0x0C],	 0x1
	bcs,a,pt	%xcc,	loop_2523
loop_2522:
	tpos	%icc,	0x1
	movre	%o3,	0x01C,	%l4
	fbe,a	%fcc3,	loop_2524
loop_2523:
	array16	%g6,	%l6,	%l5
	tcs	%xcc,	0x2
	fbge,a	%fcc2,	loop_2525
loop_2524:
	movvs	%xcc,	%g3,	%l3
	wr	%g0,	0x04,	%asi
	stxa	%o7,	[%l7 + 0x08] %asi
loop_2525:
	fbl,a	%fcc1,	loop_2526
	movcc	%xcc,	%i2,	%l2
	xnorcc	%l1,	0x1CEC,	%o6
	bl	loop_2527
loop_2526:
	movvs	%xcc,	%g1,	%g5
	array32	%l0,	%i6,	%i4
	bge,pn	%icc,	loop_2528
loop_2527:
	movpos	%xcc,	%o2,	%i1
	fpadd16s	%f25,	%f23,	%f20
	mova	%icc,	%o4,	%i5
loop_2528:
	srl	%i3,	%g2,	%o1
	for	%f22,	%f12,	%f22
	set	0x10, %i1
	sta	%f2,	[%l7 + %i1] 0x19
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i7,	%o5
	swap	[%l7 + 0x30],	%g7
	bleu	loop_2529
	srax	%i0,	0x08,	%o0
	fmovsvc	%xcc,	%f0,	%f29
	fand	%f8,	%f20,	%f22
loop_2529:
	fxors	%f2,	%f16,	%f7
	ble,pt	%icc,	loop_2530
	nop
	setx	0x5A78AE5E925BCCB6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x444BF8E947A4CFDE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f8,	%f10
	tgu	%xcc,	0x5
	fbn	%fcc1,	loop_2531
loop_2530:
	brgz,a	%g4,	loop_2532
	fbne	%fcc2,	loop_2533
	array32	%l4,	%g6,	%o3
loop_2531:
	udivcc	%l5,	0x05C1,	%g3
loop_2532:
	stx	%l6,	[%l7 + 0x70]
loop_2533:
	sll	%o7,	0x1B,	%l3
	srax	%l2,	%i2,	%l1
	bvc	loop_2534
	subccc	%o6,	0x0AA4,	%g1
	tgu	%icc,	0x4
	lduw	[%l7 + 0x6C],	%l0
loop_2534:
	umulcc	%g5,	0x09C2,	%i6
	umulcc	%i4,	%i1,	%o2
	movneg	%icc,	%o4,	%i5
	xnor	%i3,	%o1,	%i7
	brgz	%g2,	loop_2535
	movrlez	%o5,	0x0F9,	%g7
	fbo,a	%fcc2,	loop_2536
	movre	%i0,	%o0,	%g4
loop_2535:
	nop
	setx loop_2537, %l0, %l1
	jmpl %l1, %l4
	umul	%o3,	0x1377,	%g6
loop_2536:
	movvs	%icc,	%l5,	%g3
	addc	%o7,	%l6,	%l3
loop_2537:
	movn	%icc,	%l2,	%l1
	xnor	%i2,	%o6,	%g1
	tgu	%icc,	0x7
	subccc	%g5,	%l0,	%i4
	movre	%i1,	%o2,	%i6
	fbo	%fcc0,	loop_2538
	brgz,a	%i5,	loop_2539
	edge8l	%i3,	%o4,	%o1
	fblg	%fcc1,	loop_2540
loop_2538:
	sdivx	%i7,	0x1248,	%o5
loop_2539:
	array8	%g7,	%g2,	%o0
	fbug	%fcc3,	loop_2541
loop_2540:
	fmovrdgez	%i0,	%f8,	%f18
	movrne	%l4,	%g4,	%o3
	movl	%icc,	%g6,	%l5
loop_2541:
	fmovsg	%xcc,	%f25,	%f9
	nop
	setx	0xE457ECB3007190CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fzero	%f6
	set	0x40, %g1
	stda	%f16,	[%l7 + %g1] 0x81
	edge32l	%o7,	%l6,	%l3
	edge16ln	%g3,	%l1,	%i2
	fbg	%fcc2,	loop_2542
	tneg	%xcc,	0x6
	movrgez	%l2,	0x035,	%o6
	alignaddr	%g5,	%l0,	%i4
loop_2542:
	move	%icc,	%i1,	%g1
	fmovdgu	%xcc,	%f31,	%f2
	fmuld8ulx16	%f4,	%f31,	%f24
	fbule	%fcc3,	loop_2543
	orn	%i6,	0x0EDE,	%o2
	tsubcc	%i3,	%i5,	%o1
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x15
loop_2543:
	bcc,a	loop_2544
	edge8n	%o4,	%o5,	%g7
	brlez,a	%i7,	loop_2545
	edge8ln	%g2,	%o0,	%i0
loop_2544:
	nop
	setx	0x9E39C694,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xC06FAB91,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f19,	%f27
	movne	%xcc,	%g4,	%o3
loop_2545:
	nop
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	xor	%l4,	0x01FC,	%l5
	subccc	%g6,	%l6,	%l3
	fornot1s	%f13,	%f28,	%f6
	membar	0x47
	srax	%o7,	%g3,	%l1
	movcs	%icc,	%i2,	%o6
	fbl,a	%fcc1,	loop_2546
	fpackfix	%f14,	%f21
	nop
	fitod	%f8,	%f12
	fdtox	%f12,	%f26
	mulx	%g5,	0x0F22,	%l0
loop_2546:
	tcs	%icc,	0x2
	fmovdl	%xcc,	%f19,	%f15
	tcs	%icc,	0x0
	movrgez	%i4,	0x069,	%i1
	udiv	%g1,	0x1281,	%l2
	subc	%i6,	%i3,	%o2
	movcc	%xcc,	%o1,	%o4
	stb	%i5,	[%l7 + 0x1E]
	fmovsl	%icc,	%f30,	%f4
	srax	%g7,	%o5,	%i7
	fnegd	%f14,	%f8
	fone	%f0
	ldub	[%l7 + 0x4E],	%g2
	sllx	%o0,	0x1F,	%i0
	tsubcctv	%o3,	0x0D8A,	%l4
	wr	%g0,	0x2b,	%asi
	stba	%g4,	[%l7 + 0x6E] %asi
	membar	#Sync
	edge32n	%l5,	%g6,	%l3
	edge8	%l6,	%g3,	%o7
	ldstub	[%l7 + 0x68],	%l1
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tvc	%xcc,	0x7
	fmovdg	%xcc,	%f28,	%f24
	sll	%i2,	%o6,	%l0
	udiv	%g5,	0x05C0,	%i1
	wr	%g0,	0x19,	%asi
	sta	%f14,	[%l7 + 0x48] %asi
	fmovsvs	%icc,	%f6,	%f11
	nop
	setx	0xFA5D9DB9A0451773,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	stb	%g1,	[%l7 + 0x52]
	move	%icc,	%l2,	%i4
	movrne	%i3,	%o2,	%i6
	add	%o4,	%o1,	%i5
	movg	%icc,	%o5,	%i7
	andn	%g7,	0x037F,	%g2
	set	0x78, %i2
	stxa	%o0,	[%l7 + %i2] 0x80
	subc	%o3,	0x1F6E,	%l4
	brnz,a	%g4,	loop_2547
	movge	%xcc,	%i0,	%l5
	fbg	%fcc1,	loop_2548
	movle	%xcc,	%g6,	%l3
loop_2547:
	nop
	fitos	%f7,	%f31
	fstox	%f31,	%f16
	xor	%g3,	0x1F05,	%o7
loop_2548:
	fand	%f8,	%f18,	%f8
	popc	%l6,	%l1
	move	%icc,	%o6,	%l0
	ldub	[%l7 + 0x34],	%i2
	movneg	%xcc,	%g5,	%g1
	smul	%l2,	0x19AC,	%i1
	edge32n	%i3,	%o2,	%i4
	fmovdleu	%xcc,	%f15,	%f30
	tle	%icc,	0x0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] 0x80,	%o4,	%i6
	subcc	%i5,	%o5,	%o1
	smulcc	%i7,	0x10AB,	%g2
	umul	%g7,	%o0,	%l4
	brz,a	%g4,	loop_2549
	tge	%icc,	0x6
	sethi	0x06AC,	%i0
	fnegs	%f12,	%f17
loop_2549:
	edge32ln	%o3,	%g6,	%l3
	sll	%g3,	%o7,	%l6
	srl	%l5,	%o6,	%l1
	sdivcc	%i2,	0x0E35,	%g5
	tleu	%icc,	0x6
	movl	%icc,	%g1,	%l2
	xnor	%i1,	0x02AB,	%l0
	srlx	%o2,	%i3,	%i4
	nop
	setx	0x7546AFF2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xCF21BAD4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f18,	%f24
	bgu,pn	%xcc,	loop_2550
	brgz	%i6,	loop_2551
	movre	%i5,	0x29A,	%o5
	tvc	%icc,	0x2
loop_2550:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%i7
loop_2551:
	fcmple32	%f20,	%f6,	%o1
	fbule	%fcc3,	loop_2552
	edge32l	%g2,	%o0,	%l4
	fmovscs	%xcc,	%f18,	%f20
	srl	%g4,	0x0F,	%i0
loop_2552:
	fble,a	%fcc1,	loop_2553
	fmovd	%f10,	%f4
	fmovdne	%xcc,	%f6,	%f6
	bl	%xcc,	loop_2554
loop_2553:
	movre	%o3,	0x231,	%g7
	nop
	fitod	%f2,	%f20
	fdtos	%f20,	%f23
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f8
	fxtod	%f8,	%f10
loop_2554:
	sdiv	%l3,	0x1609,	%g6
	smulcc	%g3,	%o7,	%l5
	membar	0x25
	movl	%icc,	%l6,	%l1
	fmovrdlez	%i2,	%f8,	%f16
	fors	%f0,	%f27,	%f25
	fmovdvc	%xcc,	%f16,	%f27
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x24] %asi,	%o6
	sdivx	%g1,	0x0598,	%g5
	tgu	%icc,	0x5
	fmovsneg	%icc,	%f7,	%f21
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x33] %asi,	%l2
	te	%xcc,	0x7
	ta	%xcc,	0x2
	brgez	%l0,	loop_2555
	fandnot1s	%f13,	%f25,	%f10
	mulx	%o2,	%i3,	%i1
	movpos	%xcc,	%i4,	%i5
loop_2555:
	nop
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x1f,	%f0
	ta	%icc,	0x6
	set	0x29, %l0
	ldsba	[%l7 + %l0] 0x88,	%i6
	fbge,a	%fcc3,	loop_2556
	srl	%o5,	%o4,	%i7
	movne	%icc,	%g2,	%o1
	edge8	%l4,	%g4,	%o0
loop_2556:
	fxors	%f8,	%f16,	%f31
	alignaddrl	%i0,	%g7,	%o3
	popc	0x1850,	%l3
	edge32n	%g6,	%o7,	%g3
	xnor	%l5,	%l1,	%l6
	edge32	%o6,	%i2,	%g1
	fmovdne	%icc,	%f19,	%f23
	faligndata	%f20,	%f28,	%f24
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x56] %asi,	%l2
	fcmpeq32	%f22,	%f24,	%g5
	array16	%l0,	%i3,	%o2
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f22
	fxtod	%f22,	%f20
	ldsb	[%l7 + 0x19],	%i4
	st	%f9,	[%l7 + 0x60]
	subccc	%i5,	%i6,	%i1
	tle	%icc,	0x6
	fsrc1	%f14,	%f6
	udivcc	%o5,	0x1679,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g2,	%i7,	%o1
	ldsw	[%l7 + 0x68],	%l4
	movrne	%o0,	%i0,	%g7
	andncc	%o3,	%l3,	%g6
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x48] %asi,	%g4
	smulcc	%g3,	0x0913,	%o7
	xnorcc	%l5,	0x0AAA,	%l1
	fmovdl	%icc,	%f28,	%f10
	xnorcc	%l6,	%i2,	%o6
	orcc	%g1,	%l2,	%g5
	fnegs	%f7,	%f23
	fxnors	%f8,	%f8,	%f22
	nop
	setx	0x5ED62F88,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xF96995E9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f9,	%f26
	andncc	%i3,	%o2,	%l0
	fbg,a	%fcc3,	loop_2557
	edge8l	%i5,	%i6,	%i1
	andn	%i4,	%o5,	%o4
	subcc	%i7,	%o1,	%l4
loop_2557:
	add	%g2,	%i0,	%g7
	fmul8sux16	%f30,	%f12,	%f26
	fmuld8ulx16	%f19,	%f22,	%f26
	popc	0x0A6C,	%o3
	te	%icc,	0x1
	be	%icc,	loop_2558
	tg	%icc,	0x7
	srax	%l3,	0x09,	%o0
	tne	%xcc,	0x1
loop_2558:
	bn,a,pt	%xcc,	loop_2559
	movle	%icc,	%g6,	%g3
	movvs	%icc,	%g4,	%o7
	lduw	[%l7 + 0x5C],	%l5
loop_2559:
	movn	%icc,	%l1,	%l6
	orncc	%o6,	0x068D,	%i2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x72] %asi,	%g1
	taddcc	%g5,	0x19BF,	%i3
	fbule,a	%fcc2,	loop_2560
	andcc	%o2,	%l0,	%i5
	or	%i6,	%l2,	%i1
	wr	%g0,	0xeb,	%asi
	stxa	%o5,	[%l7 + 0x70] %asi
	membar	#Sync
loop_2560:
	tl	%icc,	0x4
	edge16ln	%i4,	%i7,	%o1
	movgu	%icc,	%o4,	%g2
	st	%f15,	[%l7 + 0x50]
	edge16l	%i0,	%l4,	%g7
	udivx	%o3,	0x1571,	%o0
	array16	%l3,	%g6,	%g4
	fmovrdne	%o7,	%f4,	%f0
	udivcc	%l5,	0x09F4,	%g3
	movrgez	%l6,	0x128,	%l1
	srax	%i2,	%g1,	%g5
	stb	%i3,	[%l7 + 0x3F]
	sra	%o6,	0x1F,	%l0
	brgz,a	%o2,	loop_2561
	bgu	loop_2562
	fbue,a	%fcc2,	loop_2563
	taddcctv	%i5,	%l2,	%i6
loop_2561:
	fpsub16	%f4,	%f4,	%f28
loop_2562:
	nop
	set	0x40, %l4
	lda	[%l7 + %l4] 0x88,	%f3
loop_2563:
	fmovdle	%icc,	%f17,	%f23
	udivx	%i1,	0x1CCB,	%o5
	movne	%xcc,	%i4,	%i7
	brlz,a	%o1,	loop_2564
	xor	%g2,	0x0263,	%o4
	fmovdg	%icc,	%f25,	%f28
	brz	%l4,	loop_2565
loop_2564:
	movrgez	%i0,	0x1E2,	%g7
	fmovdgu	%xcc,	%f25,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2565:
	alignaddr	%o0,	%l3,	%g6
	ta	%icc,	0x7
	ldd	[%l7 + 0x60],	%g4
	fandnot2	%f20,	%f28,	%f20
	movrlz	%o7,	0x2A4,	%l5
	fmovrdlez	%g3,	%f18,	%f24
	prefetch	[%l7 + 0x44],	 0x1
	movleu	%xcc,	%l6,	%o3
	be,a,pn	%xcc,	loop_2566
	mova	%xcc,	%l1,	%g1
	fandnot2	%f16,	%f12,	%f18
	array16	%i2,	%g5,	%i3
loop_2566:
	fblg	%fcc2,	loop_2567
	movn	%xcc,	%o6,	%o2
	bvc,a,pt	%xcc,	loop_2568
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2567:
	tge	%xcc,	0x3
	bcs,a,pt	%xcc,	loop_2569
loop_2568:
	ba,a	loop_2570
	fmovdneg	%xcc,	%f13,	%f24
	srl	%l0,	%i5,	%i6
loop_2569:
	ldd	[%l7 + 0x48],	%f10
loop_2570:
	fbg,a	%fcc2,	loop_2571
	udivx	%i1,	0x0F42,	%o5
	fmovdge	%xcc,	%f17,	%f0
	sra	%l2,	%i4,	%i7
loop_2571:
	xor	%o1,	%g2,	%o4
	set	0x13, %i3
	stba	%i0,	[%l7 + %i3] 0x2f
	membar	#Sync
	stbar
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f14,	%f0,	%f0
	membar	0x33
	alignaddr	%g7,	%l4,	%l3
	fmovrde	%o0,	%f14,	%f12
	movcc	%icc,	%g4,	%o7
	sra	%l5,	0x11,	%g6
	edge8n	%l6,	%g3,	%o3
	fba	%fcc1,	loop_2572
	edge16ln	%l1,	%i2,	%g1
	mulx	%i3,	%g5,	%o2
	taddcc	%l0,	%o6,	%i6
loop_2572:
	fmovrdlz	%i5,	%f18,	%f2
	sra	%o5,	%l2,	%i4
	edge16	%i7,	%o1,	%g2
	edge16l	%i1,	%o4,	%g7
	fmovda	%icc,	%f15,	%f5
	fpsub16s	%f15,	%f26,	%f17
	edge16	%l4,	%l3,	%o0
	set	0x48, %l5
	sta	%f5,	[%l7 + %l5] 0x10
	bg	%icc,	loop_2573
	movrgez	%g4,	%o7,	%i0
	movn	%xcc,	%g6,	%l6
	tg	%icc,	0x2
loop_2573:
	sll	%g3,	0x11,	%l5
	mulscc	%l1,	0x0087,	%o3
	addc	%g1,	%i2,	%i3
	addccc	%g5,	0x03DE,	%l0
	movrlz	%o2,	0x025,	%i6
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fpack16	%f8,	%f3
	nop
	setx	0xE8882929,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xE7F9DB13,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f24,	%f8
	movge	%xcc,	%o6,	%o5
	addc	%l2,	%i4,	%i7
	edge8	%o1,	%g2,	%i1
	nop
	fitod	%f8,	%f24
	fdtos	%f24,	%f18
	stx	%i5,	[%l7 + 0x18]
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x1f,	%f16
	lduh	[%l7 + 0x0C],	%g7
	subcc	%l4,	%l3,	%o0
	taddcctv	%g4,	0x07F7,	%o7
	fmul8sux16	%f2,	%f0,	%f26
	fbule	%fcc0,	loop_2574
	bcs,a	loop_2575
	xnorcc	%i0,	0x15C3,	%o4
	membar	0x66
loop_2574:
	movvc	%icc,	%g6,	%g3
loop_2575:
	bpos,pn	%xcc,	loop_2576
	nop
	setx	loop_2577,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcctv	%l5,	%l6,	%o3
	nop
	setx	0x0D2D06AD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x7EE53DDD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f20,	%f22
loop_2576:
	lduh	[%l7 + 0x44],	%g1
loop_2577:
	sdivx	%i2,	0x17DE,	%i3
	fmul8sux16	%f6,	%f8,	%f2
	udivcc	%g5,	0x0BBF,	%l1
	bgu	%xcc,	loop_2578
	edge8	%o2,	%l0,	%o6
	edge16	%i6,	%o5,	%i4
	movgu	%icc,	%i7,	%o1
loop_2578:
	add	%g2,	0x0BCF,	%l2
	and	%i5,	0x0668,	%g7
	xnorcc	%i1,	0x0A9E,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o0,	%g4
	and	%l4,	0x05D6,	%i0
	tcs	%xcc,	0x7
	movvs	%xcc,	%o4,	%g6
	taddcc	%o7,	0x0A77,	%l5
	fpsub16	%f16,	%f8,	%f10
	fexpand	%f6,	%f6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x60] %asi,	%g3
	movrne	%l6,	%g1,	%o3
	fxors	%f24,	%f31,	%f30
	fnor	%f0,	%f2,	%f10
	fbue	%fcc0,	loop_2579
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg	%fcc1,	loop_2580
	fmovsleu	%xcc,	%f17,	%f15
loop_2579:
	fandnot1s	%f16,	%f14,	%f13
	movrne	%i2,	0x367,	%i3
loop_2580:
	array16	%l1,	%o2,	%l0
	udivcc	%g5,	0x1D8A,	%o6
	brgz	%i6,	loop_2581
	fbuge	%fcc3,	loop_2582
	movrlez	%i4,	%i7,	%o1
	edge32n	%o5,	%g2,	%l2
loop_2581:
	ldd	[%l7 + 0x58],	%g6
loop_2582:
	ldd	[%l7 + 0x10],	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i1,	%l3,	%i5
	fcmple16	%f2,	%f8,	%o0
	swap	[%l7 + 0x08],	%l4
	ldstub	[%l7 + 0x77],	%i0
	taddcc	%g4,	0x1B09,	%o4
	prefetch	[%l7 + 0x4C],	 0x1
	movn	%icc,	%o7,	%l5
	nop
	set	0x54, %o4
	prefetch	[%l7 + %o4],	 0x3
	fpack16	%f6,	%f20
	st	%f21,	[%l7 + 0x50]
	edge8n	%g6,	%l6,	%g1
	sub	%g3,	0x1E51,	%o3
	tne	%icc,	0x2
	addc	%i2,	%l1,	%i3
	addcc	%o2,	%l0,	%o6
	fmovdneg	%icc,	%f20,	%f29
	sdiv	%i6,	0x0EEB,	%g5
	orcc	%i7,	0x1BB2,	%i4
	st	%f4,	[%l7 + 0x7C]
	fnegd	%f6,	%f0
	movle	%icc,	%o5,	%g2
	movle	%xcc,	%l2,	%g7
	movleu	%icc,	%o1,	%l3
	srl	%i1,	0x13,	%i5
	nop
	setx	0x6CBB6E76B7B22CB1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f14
	nop
	set	0x18, %g5
	ldd	[%l7 + %g5],	%f12
	srlx	%o0,	%i0,	%g4
	edge8n	%o4,	%l4,	%o7
	fba	%fcc1,	loop_2583
	srax	%l5,	0x00,	%g6
	andncc	%l6,	%g1,	%o3
	orncc	%g3,	0x1685,	%l1
loop_2583:
	edge16l	%i3,	%o2,	%i2
	ld	[%l7 + 0x78],	%f29
	andn	%o6,	0x1855,	%l0
	flush	%l7 + 0x5C
	fbug,a	%fcc2,	loop_2584
	tge	%icc,	0x3
	xor	%g5,	0x1DB1,	%i7
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x27] %asi,	%i6
loop_2584:
	fand	%f10,	%f8,	%f10
	set	0x70, %o6
	ldda	[%l7 + %o6] 0x14,	%i4
	movcc	%icc,	%g2,	%l2
	wr	%g0,	0xe3,	%asi
	stha	%g7,	[%l7 + 0x76] %asi
	membar	#Sync
	tvc	%icc,	0x2
	srax	%o1,	0x05,	%l3
	array16	%o5,	%i1,	%o0
	edge8n	%i5,	%i0,	%o4
	udivx	%g4,	0x1383,	%o7
	tn	%icc,	0x6
	movcs	%xcc,	%l4,	%g6
	sllx	%l6,	%l5,	%g1
	tvc	%icc,	0x6
	bg,a	loop_2585
	fand	%f14,	%f30,	%f16
	brlz,a	%g3,	loop_2586
	brlz	%l1,	loop_2587
loop_2585:
	edge32n	%o3,	%o2,	%i2
	flush	%l7 + 0x74
loop_2586:
	fmul8x16au	%f30,	%f26,	%f4
loop_2587:
	nop
	setx	0x20436613,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	tsubcc	%i3,	0x0771,	%o6
	orncc	%g5,	0x0591,	%l0
	movne	%xcc,	%i6,	%i7
	taddcctv	%i4,	%l2,	%g2
	ta	%icc,	0x5
	bpos,pn	%icc,	loop_2588
	movpos	%xcc,	%g7,	%o1
	edge16n	%l3,	%o5,	%i1
	brz,a	%i5,	loop_2589
loop_2588:
	movle	%xcc,	%i0,	%o0
	sdiv	%o4,	0x05ED,	%g4
	tge	%xcc,	0x2
loop_2589:
	sll	%o7,	0x0D,	%l4
	edge16ln	%l6,	%g6,	%g1
	fbe	%fcc1,	loop_2590
	subc	%l5,	%g3,	%o3
	or	%o2,	%i2,	%i3
	tcc	%icc,	0x3
loop_2590:
	move	%icc,	%l1,	%g5
	ta	%xcc,	0x2
	movrlz	%l0,	%i6,	%o6
	fmul8x16	%f12,	%f14,	%f16
	tle	%xcc,	0x7
	sub	%i7,	0x1778,	%l2
	sdivx	%g2,	0x10F9,	%i4
	std	%f10,	[%l7 + 0x28]
	movrlez	%o1,	%l3,	%g7
	fmovdvs	%xcc,	%f17,	%f5
	tsubcc	%i1,	%o5,	%i0
	edge32ln	%o0,	%o4,	%i5
	movvc	%xcc,	%o7,	%g4
	taddcctv	%l6,	%g6,	%g1
	te	%xcc,	0x4
	set	0x13, %i4
	stba	%l5,	[%l7 + %i4] 0x2a
	membar	#Sync
	sdiv	%g3,	0x003C,	%o3
	flush	%l7 + 0x70
	stbar
	tleu	%icc,	0x3
	andncc	%l4,	%i2,	%o2
	fmovrdgz	%i3,	%f24,	%f16
	brlz	%g5,	loop_2591
	lduw	[%l7 + 0x38],	%l0
	sdivx	%l1,	0x1580,	%i6
	srax	%i7,	0x09,	%o6
loop_2591:
	movn	%icc,	%l2,	%g2
	movrlz	%o1,	%i4,	%l3
	movgu	%icc,	%g7,	%i1
	movvc	%icc,	%i0,	%o0
	smulcc	%o5,	%o4,	%i5
	subcc	%g4,	0x0878,	%l6
	edge16n	%g6,	%g1,	%o7
	tsubcc	%g3,	%o3,	%l5
	ble,a	loop_2592
	fba,a	%fcc0,	loop_2593
	tge	%xcc,	0x1
	tcc	%icc,	0x0
loop_2592:
	nop
	setx	0xEB5C8C8D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x29BDA490,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f31,	%f10
loop_2593:
	bge,a	loop_2594
	addc	%l4,	%i2,	%i3
	tg	%xcc,	0x7
	fpmerge	%f29,	%f15,	%f22
loop_2594:
	nop
	setx	0x26D506D172FE7A9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x9F9DDF1718A94030,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f24,	%f14
	stb	%g5,	[%l7 + 0x50]
	xnorcc	%o2,	0x16AB,	%l1
	be,a	loop_2595
	xnorcc	%i6,	%l0,	%i7
	for	%f18,	%f30,	%f4
	sub	%o6,	0x1D83,	%l2
loop_2595:
	srlx	%o1,	%g2,	%i4
	tgu	%xcc,	0x0
	udivx	%l3,	0x1683,	%i1
	movleu	%xcc,	%g7,	%i0
	movn	%icc,	%o5,	%o0
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x68] %asi,	%i5
	fornot2s	%f27,	%f15,	%f16
	nop
	fitos	%f23,	%f18
	srax	%o4,	0x15,	%g4
	fxnor	%f28,	%f18,	%f20
	popc	%g6,	%g1
	fbe,a	%fcc1,	loop_2596
	xnorcc	%o7,	0x0166,	%g3
	movge	%icc,	%l6,	%l5
	fmovsa	%icc,	%f7,	%f1
loop_2596:
	edge32l	%l4,	%i2,	%i3
	sra	%g5,	%o3,	%o2
	smul	%l1,	%l0,	%i7
	movl	%xcc,	%o6,	%l2
	bvc,pt	%icc,	loop_2597
	fmovdcs	%icc,	%f7,	%f23
	edge8ln	%i6,	%g2,	%i4
	tle	%xcc,	0x5
loop_2597:
	fble	%fcc2,	loop_2598
	lduh	[%l7 + 0x7C],	%l3
	movleu	%xcc,	%i1,	%g7
	sllx	%i0,	0x07,	%o5
loop_2598:
	stbar
	fmovsleu	%xcc,	%f10,	%f6
	bleu	%xcc,	loop_2599
	or	%o1,	0x0509,	%o0
	fmovdl	%xcc,	%f28,	%f5
	andcc	%i5,	0x0820,	%o4
loop_2599:
	fnot1s	%f28,	%f15
	nop
	fitod	%f25,	%f14
	addccc	%g4,	%g6,	%o7
	add	%g3,	%g1,	%l5
	movcs	%xcc,	%l6,	%l4
	array16	%i2,	%g5,	%i3
	edge32l	%o3,	%l1,	%l0
	edge8	%i7,	%o6,	%o2
	orcc	%i6,	0x11AA,	%g2
	ldsb	[%l7 + 0x63],	%i4
	fmovsge	%xcc,	%f25,	%f12
	udiv	%l2,	0x02B4,	%i1
	edge8l	%g7,	%i0,	%l3
	smulcc	%o5,	%o0,	%o1
	sllx	%o4,	0x1E,	%g4
	brgez,a	%g6,	loop_2600
	fpadd32s	%f2,	%f5,	%f29
	udiv	%i5,	0x0CDA,	%g3
	movrlez	%g1,	%o7,	%l6
loop_2600:
	ldd	[%l7 + 0x58],	%l4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%l5
	sdivcc	%g5,	0x1D5D,	%o3
	tpos	%icc,	0x2
	alignaddr	%l1,	%i3,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o6,	%o2,	%i6
	nop
	setx	loop_2601,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlz	%l0,	loop_2602
	umulcc	%g2,	%i4,	%i1
	nop
	setx loop_2603, %l0, %l1
	jmpl %l1, %l2
loop_2601:
	fpsub32s	%f21,	%f0,	%f18
loop_2602:
	tl	%icc,	0x5
	tvs	%icc,	0x0
loop_2603:
	nop
	setx	loop_2604,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq16	%f28,	%f14,	%g7
	fzeros	%f4
	edge32n	%i0,	%l3,	%o5
loop_2604:
	call	loop_2605
	umul	%o1,	%o4,	%o0
	edge8ln	%g4,	%g6,	%i5
	bneg,a	%xcc,	loop_2606
loop_2605:
	fmovde	%icc,	%f28,	%f2
	prefetch	[%l7 + 0x54],	 0x0
	fmovsg	%xcc,	%f0,	%f29
loop_2606:
	movcs	%icc,	%g1,	%g3
	array8	%o7,	%l4,	%i2
	swap	[%l7 + 0x7C],	%l6
	bneg,pn	%icc,	loop_2607
	tvs	%xcc,	0x1
	fmovrslez	%l5,	%f19,	%f0
	mova	%xcc,	%o3,	%l1
loop_2607:
	or	%i3,	%i7,	%g5
	sir	0x031A
	alignaddr	%o6,	%i6,	%o2
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x10,	%f16
	tleu	%icc,	0x5
	std	%f6,	[%l7 + 0x50]
	umulcc	%g2,	0x18E0,	%l0
	movgu	%icc,	%i4,	%l2
	edge16l	%i1,	%g7,	%l3
	movpos	%xcc,	%i0,	%o5
	umulcc	%o4,	%o0,	%o1
	udivcc	%g4,	0x1EBC,	%i5
	tsubcc	%g6,	0x1023,	%g1
	movcs	%icc,	%o7,	%g3
	smulcc	%l4,	0x1664,	%i2
	fmovscs	%xcc,	%f7,	%f16
	wr	%g0,	0x89,	%asi
	sta	%f5,	[%l7 + 0x64] %asi
	tvc	%xcc,	0x5
	edge8	%l5,	%o3,	%l1
	nop
	setx	0x920E10CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xD578B0C1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f22,	%f0
	brlz,a	%l6,	loop_2608
	movvc	%xcc,	%i3,	%g5
	be,pt	%icc,	loop_2609
	fnot2	%f8,	%f10
loop_2608:
	fandnot2	%f16,	%f4,	%f10
	tgu	%xcc,	0x2
loop_2609:
	tge	%xcc,	0x0
	fcmple16	%f10,	%f26,	%i7
	andncc	%i6,	%o2,	%o6
	sethi	0x024D,	%g2
	fmovrdgez	%l0,	%f10,	%f24
	tcs	%icc,	0x7
	tvc	%icc,	0x1
	tvc	%icc,	0x1
	fxor	%f20,	%f24,	%f8
	nop
	setx	0xFA11C40EFA37A006,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f22
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x50] %asi,	%l2
	array8	%i1,	%i4,	%g7
	array16	%l3,	%o5,	%o4
	nop
	fitod	%f10,	%f30
	fdtos	%f30,	%f28
	fmovrdgz	%i0,	%f18,	%f26
	nop
	setx	0x619C197F57E66896,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x34374AAF6F492F0E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f26,	%f0
	fbug,a	%fcc1,	loop_2610
	be	%xcc,	loop_2611
	add	%o0,	0x1286,	%o1
	xnorcc	%g4,	%i5,	%g1
loop_2610:
	movg	%icc,	%o7,	%g3
loop_2611:
	sir	0x1D93
	movne	%icc,	%g6,	%l4
	sub	%l5,	0x0012,	%o3
	ta	%xcc,	0x3
	fmovd	%f2,	%f26
	edge8	%i2,	%l1,	%l6
	bn,a,pt	%xcc,	loop_2612
	tneg	%icc,	0x0
	sllx	%i3,	%g5,	%i7
	movgu	%icc,	%o2,	%i6
loop_2612:
	fmovsn	%xcc,	%f20,	%f6
	fxnors	%f10,	%f11,	%f24
	orncc	%o6,	%g2,	%l0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i1,	%i4
	tle	%xcc,	0x2
	tcs	%icc,	0x2
	tpos	%xcc,	0x3
	tcs	%xcc,	0x7
	tle	%icc,	0x7
	fmovdcs	%xcc,	%f10,	%f31
	movvs	%icc,	%g7,	%l3
	movcs	%xcc,	%l2,	%o4
	add	%i0,	%o0,	%o5
	fmovdgu	%xcc,	%f22,	%f19
	fbne	%fcc2,	loop_2613
	edge32	%o1,	%i5,	%g4
	xnor	%o7,	0x1615,	%g3
	fmovd	%f30,	%f14
loop_2613:
	movrlz	%g6,	0x259,	%g1
	fmovrdlez	%l5,	%f20,	%f18
	andncc	%l4,	%o3,	%l1
	sdiv	%i2,	0x084F,	%i3
	udivx	%g5,	0x1104,	%i7
	andcc	%o2,	0x030D,	%i6
	wr	%g0,	0x11,	%asi
	stha	%o6,	[%l7 + 0x10] %asi
	fmovrdne	%l6,	%f22,	%f0
	bvc,a	%xcc,	loop_2614
	nop
	setx	0x404B8883,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	fmovrdlz	%l0,	%f4,	%f20
	srax	%g2,	%i1,	%i4
loop_2614:
	fzeros	%f5
	srl	%g7,	0x1B,	%l2
	tvc	%icc,	0x1
	movneg	%xcc,	%o4,	%l3
	tsubcctv	%i0,	0x15F7,	%o0
	fbne	%fcc3,	loop_2615
	fzero	%f6
	fmovdge	%icc,	%f30,	%f20
	tleu	%xcc,	0x7
loop_2615:
	bshuffle	%f16,	%f10,	%f4
	array8	%o5,	%o1,	%i5
	edge8ln	%g4,	%g3,	%o7
	membar	0x5D
	popc	0x0D70,	%g1
	edge8	%g6,	%l4,	%o3
	set	0x3D, %g6
	lduba	[%l7 + %g6] 0x18,	%l1
	fmovdle	%icc,	%f8,	%f21
	fands	%f22,	%f19,	%f8
	orncc	%l5,	%i2,	%i3
	smulcc	%i7,	0x1ED2,	%g5
	tn	%icc,	0x1
	xnor	%o2,	%o6,	%i6
	fpmerge	%f4,	%f13,	%f10
	addc	%l6,	0x08B0,	%l0
	sra	%g2,	0x19,	%i1
	movn	%xcc,	%g7,	%i4
	edge8	%o4,	%l3,	%l2
	alignaddrl	%o0,	%o5,	%i0
	brnz,a	%o1,	loop_2616
	movleu	%icc,	%i5,	%g4
	bgu	%icc,	loop_2617
	st	%f24,	[%l7 + 0x4C]
loop_2616:
	bl	%xcc,	loop_2618
	fmovrdne	%o7,	%f26,	%f28
loop_2617:
	nop
	setx	0xC81AB2DAF05B32CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	be	loop_2619
loop_2618:
	fzeros	%f17
	addcc	%g3,	0x023A,	%g6
	bpos,pt	%xcc,	loop_2620
loop_2619:
	sethi	0x19EA,	%l4
	addc	%o3,	%g1,	%l1
	subcc	%i2,	0x05C4,	%i3
loop_2620:
	be,pt	%icc,	loop_2621
	movneg	%icc,	%i7,	%g5
	subcc	%o2,	0x094F,	%o6
	xor	%l5,	0x0E14,	%l6
loop_2621:
	andn	%i6,	0x1009,	%l0
	edge8	%g2,	%g7,	%i4
	movpos	%icc,	%i1,	%l3
	tn	%xcc,	0x4
	array16	%o4,	%l2,	%o0
	array8	%i0,	%o1,	%o5
	movle	%icc,	%i5,	%o7
	tge	%icc,	0x0
	be	loop_2622
	tpos	%xcc,	0x3
	fexpand	%f12,	%f14
	movpos	%xcc,	%g4,	%g6
loop_2622:
	sethi	0x030E,	%g3
	movre	%o3,	0x279,	%g1
	udivx	%l4,	0x19EA,	%i2
	bl,a	%icc,	loop_2623
	tn	%xcc,	0x1
	tneg	%icc,	0x7
	tleu	%xcc,	0x0
loop_2623:
	fpadd32s	%f26,	%f0,	%f22
	fxnors	%f27,	%f3,	%f2
	brlez	%l1,	loop_2624
	fmovsgu	%icc,	%f12,	%f21
	fandnot1	%f12,	%f26,	%f4
	call	loop_2625
loop_2624:
	nop
	setx	0xCC3689F9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x39883C00,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f18,	%f27
	tg	%icc,	0x0
	andncc	%i7,	%g5,	%o2
loop_2625:
	edge32l	%i3,	%o6,	%l6
	bne,a,pt	%xcc,	loop_2626
	addc	%l5,	0x16E9,	%i6
	popc	%g2,	%g7
	movgu	%xcc,	%i4,	%l0
loop_2626:
	edge8l	%i1,	%o4,	%l2
	tg	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x7
	subc	%o0,	%i0,	%o1
	ta	%icc,	0x7
	movge	%icc,	%o5,	%i5
	tl	%xcc,	0x0
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0xf8
	membar	#Sync
	umulcc	%l3,	0x09B0,	%o7
	fxor	%f2,	%f2,	%f2
	bne,a	loop_2627
	and	%g4,	0x08A5,	%g6
	xorcc	%o3,	0x142E,	%g3
	fmovrsgez	%l4,	%f24,	%f24
loop_2627:
	movre	%i2,	0x00A,	%l1
	fabss	%f30,	%f30
	be,a	%xcc,	loop_2628
	smulcc	%g1,	0x09DF,	%i7
	sir	0x02B2
	tpos	%xcc,	0x7
loop_2628:
	sdivcc	%o2,	0x1D0A,	%g5
	tge	%icc,	0x3
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x60] %asi,	%f12
	sra	%i3,	0x19,	%l6
	movleu	%icc,	%o6,	%l5
	fmovscc	%xcc,	%f12,	%f25
	sdivcc	%g2,	0x0C7D,	%g7
	nop
	setx	0x920EB8F6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xA8332AA2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f20,	%f28
	ldx	[%l7 + 0x48],	%i4
	nop
	setx	0xFE28877077BC5726,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x834F8B3410D14C14,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f26,	%f14
	edge32ln	%i6,	%l0,	%i1
	smul	%l2,	0x1C5C,	%o0
	wr	%g0,	0x19,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbu,a	%fcc0,	loop_2629
	ta	%xcc,	0x6
	fmovsl	%icc,	%f24,	%f27
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f18
loop_2629:
	movrne	%i0,	%o4,	%o5
	fpsub32s	%f26,	%f0,	%f22
	set	0x18, %g7
	stxa	%i5,	[%g0 + %g7] 0x20
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
	ldd	[%l7 + 0x60],	%o0
	stbar
	sub	%o7,	%l3,	%g6
loop_2630:
	fmovda	%xcc,	%f11,	%f14
	fmovs	%f23,	%f3
	nop
	setx	0x209FCBCF30440A0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	lduw	[%l7 + 0x60],	%g4
	edge16	%g3,	%o3,	%i2
	sub	%l1,	0x1832,	%l4
	fnor	%f18,	%f2,	%f0
	sllx	%g1,	%i7,	%o2
	fmovdg	%icc,	%f18,	%f6
	edge16n	%g5,	%l6,	%o6
	fbn	%fcc2,	loop_2631
	bcs,a	%xcc,	loop_2632
	lduh	[%l7 + 0x5E],	%i3
	tvc	%xcc,	0x6
loop_2631:
	edge16n	%l5,	%g7,	%g2
loop_2632:
	fbule	%fcc3,	loop_2633
	bcc,pt	%xcc,	loop_2634
	sdivcc	%i6,	0x1D64,	%l0
	and	%i1,	0x0918,	%i4
loop_2633:
	movl	%icc,	%o0,	%i0
loop_2634:
	bpos	loop_2635
	fbul,a	%fcc1,	loop_2636
	edge16l	%o4,	%o5,	%l2
	nop
	fitod	%f6,	%f8
	fdtoi	%f8,	%f15
loop_2635:
	fpadd32s	%f18,	%f8,	%f28
loop_2636:
	fmovsleu	%xcc,	%f8,	%f0
	tne	%icc,	0x3
	addcc	%i5,	%o1,	%l3
	alignaddr	%o7,	%g4,	%g3
	edge8ln	%o3,	%g6,	%i2
	tl	%xcc,	0x4
	nop
	fitos	%f11,	%f12
	fstod	%f12,	%f2
	tgu	%xcc,	0x0
	fmovse	%icc,	%f8,	%f16
	ble,pn	%icc,	loop_2637
	ta	%xcc,	0x2
	movle	%icc,	%l1,	%g1
	nop
	fitos	%f11,	%f5
	fstox	%f5,	%f18
	fxtos	%f18,	%f1
loop_2637:
	fmovrdne	%l4,	%f0,	%f6
	brz	%i7,	loop_2638
	edge8n	%g5,	%o2,	%o6
	tsubcc	%i3,	0x173E,	%l6
	xnorcc	%g7,	%g2,	%l5
loop_2638:
	movpos	%xcc,	%l0,	%i1
	mulx	%i6,	%i4,	%i0
	fpsub32s	%f9,	%f20,	%f26
	fands	%f10,	%f22,	%f9
	movrgz	%o0,	0x14A,	%o4
	nop
	set	0x20, %i7
	stw	%o5,	[%l7 + %i7]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%icc,	0x4
	tgu	%xcc,	0x0
	sdiv	%i5,	0x0926,	%l2
	array8	%o1,	%o7,	%l3
	subc	%g4,	%g3,	%o3
	fbul,a	%fcc2,	loop_2639
	smul	%g6,	0x1694,	%l1
	fbe	%fcc3,	loop_2640
	edge16n	%g1,	%i2,	%l4
loop_2639:
	fbu	%fcc3,	loop_2641
	nop
	fitod	%f0,	%f30
	fdtox	%f30,	%f2
loop_2640:
	umul	%i7,	%o2,	%o6
	bl,pt	%icc,	loop_2642
loop_2641:
	movle	%icc,	%g5,	%i3
	mova	%icc,	%g7,	%l6
	taddcc	%g2,	0x0A1D,	%l5
loop_2642:
	edge16n	%l0,	%i6,	%i4
	srlx	%i1,	0x1F,	%i0
	alignaddrl	%o0,	%o4,	%o5
	subc	%i5,	%l2,	%o7
	movleu	%xcc,	%l3,	%g4
	addccc	%g3,	0x143C,	%o1
	or	%o3,	%g6,	%g1
	srax	%i2,	0x0E,	%l4
	brlez	%i7,	loop_2643
	tn	%xcc,	0x1
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%l1
loop_2643:
	edge8ln	%o2,	%o6,	%g5
	fmul8x16	%f2,	%f2,	%f2
	movvs	%xcc,	%i3,	%l6
	subc	%g2,	%g7,	%l0
	and	%i6,	0x0C39,	%i4
	smul	%i1,	0x0509,	%l5
	fornot1	%f26,	%f26,	%f8
	movrgez	%i0,	%o0,	%o4
	nop
	set	0x4C, %l6
	ldsh	[%l7 + %l6],	%i5
	fxnors	%f11,	%f23,	%f23
	fsrc1	%f20,	%f6
	subcc	%o5,	%o7,	%l3
	nop
	setx	0x194E0FF4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xC3F4F19F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fsubs	%f25,	%f31,	%f4
	add	%l2,	%g3,	%g4
	ldsw	[%l7 + 0x08],	%o1
	movgu	%xcc,	%o3,	%g6
	lduw	[%l7 + 0x10],	%i2
	srax	%l4,	0x0F,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f18,	[%l7 + 0x40]
	edge16ln	%l1,	%g1,	%o6
	andcc	%o2,	0x0A7E,	%i3
	tg	%icc,	0x1
	edge16	%l6,	%g2,	%g5
	fpsub16s	%f18,	%f27,	%f24
	umulcc	%l0,	%i6,	%i4
	fbule	%fcc3,	loop_2644
	move	%xcc,	%i1,	%g7
	fbo	%fcc2,	loop_2645
	array32	%i0,	%o0,	%l5
loop_2644:
	edge8	%i5,	%o4,	%o7
	fbule,a	%fcc3,	loop_2646
loop_2645:
	smul	%l3,	0x193D,	%o5
	movvs	%icc,	%l2,	%g3
	addccc	%g4,	0x1DA1,	%o3
loop_2646:
	fmovsleu	%xcc,	%f9,	%f22
	fbule,a	%fcc0,	loop_2647
	subc	%g6,	%o1,	%l4
	fmovsne	%xcc,	%f4,	%f12
	tg	%icc,	0x7
loop_2647:
	fxors	%f17,	%f6,	%f10
	mulx	%i7,	0x0595,	%i2
	array32	%g1,	%o6,	%l1
	nop
	setx	0x305B6FBF,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	nop
	fitod	%f2,	%f2
	fdtos	%f2,	%f16
	movvs	%icc,	%o2,	%i3
	and	%g2,	%l6,	%l0
	fmovdcs	%icc,	%f19,	%f12
	fmovsne	%icc,	%f29,	%f26
	fpackfix	%f24,	%f25
	smulcc	%i6,	%g5,	%i4
	orncc	%i1,	0x0F35,	%g7
	nop
	setx	0xE9633081216EF959,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x8D372C8BFEE6BEF4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f14,	%f0
	array16	%i0,	%l5,	%i5
	fbn,a	%fcc3,	loop_2648
	sra	%o4,	0x02,	%o7
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f14
	te	%icc,	0x6
loop_2648:
	tne	%xcc,	0x2
	fpsub32	%f4,	%f30,	%f0
	movcc	%icc,	%o0,	%o5
	addc	%l2,	%g3,	%l3
	nop
	setx	0x9D9C4F4B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xA118E0C8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f16,	%f13
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x3C] %asi,	%f16
	tcc	%icc,	0x2
	stb	%o3,	[%l7 + 0x7E]
	flush	%l7 + 0x18
	te	%icc,	0x2
	fpsub16s	%f27,	%f25,	%f6
	andncc	%g6,	%o1,	%l4
	movn	%icc,	%g4,	%i7
	movcs	%xcc,	%i2,	%g1
	bg	loop_2649
	orcc	%o6,	0x08FB,	%l1
	edge8ln	%i3,	%g2,	%l6
	movrgz	%o2,	0x22C,	%i6
loop_2649:
	movrgez	%g5,	0x095,	%i4
	sth	%i1,	[%l7 + 0x12]
	nop
	setx	0x00578140,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	movn	%xcc,	%g7,	%l0
	fbul	%fcc1,	loop_2650
	sethi	0x0A2C,	%i0
	fmovrdgz	%i5,	%f26,	%f18
	movle	%icc,	%l5,	%o4
loop_2650:
	sdivcc	%o7,	0x0C03,	%o0
	fnors	%f8,	%f9,	%f0
	tl	%icc,	0x2
	edge8	%o5,	%l2,	%g3
	edge16l	%l3,	%g6,	%o3
	subc	%o1,	%l4,	%g4
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f10
	fxtod	%f10,	%f18
	nop
	setx	loop_2651,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu,a	%fcc3,	loop_2652
	movrne	%i2,	0x079,	%i7
	edge16ln	%o6,	%g1,	%i3
loop_2651:
	movleu	%xcc,	%g2,	%l6
loop_2652:
	edge8l	%o2,	%i6,	%g5
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%i4,	loop_2653
	fbne,a	%fcc1,	loop_2654
	membar	0x10
	movn	%xcc,	%l1,	%i1
loop_2653:
	movre	%g7,	0x0C2,	%l0
loop_2654:
	stbar
	fandnot2	%f0,	%f16,	%f14
	ba,a	%xcc,	loop_2655
	popc	0x0EDA,	%i0
	set	0x0C, %g4
	lduha	[%l7 + %g4] 0x15,	%l5
loop_2655:
	movl	%icc,	%i5,	%o7
	tpos	%icc,	0x6
	stw	%o4,	[%l7 + 0x38]
	mova	%icc,	%o5,	%l2
	stb	%g3,	[%l7 + 0x5B]
	addccc	%o0,	0x0401,	%l3
	smulcc	%g6,	%o1,	%o3
	nop
	setx	0x69CDEFB560613C7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x7E] %asi,	%l4
	fmul8sux16	%f4,	%f8,	%f12
	movl	%icc,	%i2,	%g4
	flush	%l7 + 0x34
	move	%icc,	%o6,	%i7
	fmovrsgz	%i3,	%f19,	%f15
	mulx	%g1,	%g2,	%o2
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%l6
	fnot1	%f0,	%f18
	tgu	%icc,	0x6
	taddcc	%g5,	%i6,	%i4
	xorcc	%l1,	%i1,	%l0
	ble	loop_2656
	tne	%icc,	0x4
	fmovdn	%xcc,	%f4,	%f20
	tsubcctv	%g7,	0x1DA3,	%i0
loop_2656:
	popc	%l5,	%o7
	sdivcc	%o4,	0x048C,	%o5
	add	%i5,	0x0F18,	%g3
	mulx	%o0,	%l3,	%g6
	xnorcc	%o1,	%o3,	%l4
	move	%xcc,	%l2,	%i2
	fmovd	%f14,	%f24
	movrlz	%g4,	0x24E,	%o6
	movleu	%xcc,	%i7,	%g1
	movrlez	%g2,	0x108,	%o2
	movneg	%icc,	%l6,	%g5
	movge	%icc,	%i6,	%i3
	xor	%i4,	0x007C,	%i1
	tgu	%icc,	0x2
	fbo	%fcc0,	loop_2657
	xnorcc	%l0,	%g7,	%i0
	nop
	setx	0x9D4F4DE07EF1AAD0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x578E5F2BE03C161C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f16,	%f20
	edge8ln	%l5,	%l1,	%o4
loop_2657:
	fmovdvc	%xcc,	%f16,	%f16
	fandnot2	%f24,	%f12,	%f28
	wr	%g0,	0x18,	%asi
	stxa	%o5,	[%l7 + 0x18] %asi
	movgu	%xcc,	%o7,	%i5
	and	%g3,	0x076E,	%o0
	edge32ln	%g6,	%l3,	%o1
	ta	%icc,	0x4
	nop
	set	0x48, %g3
	ldsw	[%l7 + %g3],	%l4
	movl	%icc,	%l2,	%i2
	fbge,a	%fcc0,	loop_2658
	fbug,a	%fcc1,	loop_2659
	sir	0x04EA
	fpsub16s	%f21,	%f0,	%f18
loop_2658:
	tge	%icc,	0x3
loop_2659:
	movvs	%xcc,	%o3,	%o6
	fpackfix	%f26,	%f2
	fba,a	%fcc2,	loop_2660
	fmovrdlz	%g4,	%f12,	%f26
	fbe,a	%fcc3,	loop_2661
	be	%xcc,	loop_2662
loop_2660:
	bvc,pt	%icc,	loop_2663
	stw	%i7,	[%l7 + 0x2C]
loop_2661:
	array16	%g1,	%o2,	%g2
loop_2662:
	udivcc	%l6,	0x03DE,	%i6
loop_2663:
	smul	%g5,	%i4,	%i1
	fbge	%fcc0,	loop_2664
	movrgez	%i3,	%g7,	%i0
	fcmpeq16	%f26,	%f2,	%l0
	bge,pt	%icc,	loop_2665
loop_2664:
	fzero	%f8
	addccc	%l5,	0x1516,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2665:
	fbul,a	%fcc3,	loop_2666
	fmovrdne	%o5,	%f2,	%f0
	movvs	%xcc,	%o7,	%i5
	xorcc	%o4,	%o0,	%g6
loop_2666:
	umul	%l3,	%o1,	%l4
	sdiv	%g3,	0x1E90,	%i2
	tcs	%icc,	0x7
	fmovdleu	%icc,	%f21,	%f22
	fmovdcs	%xcc,	%f2,	%f20
	udivcc	%l2,	0x06F1,	%o3
	bvs,a,pt	%icc,	loop_2667
	add	%g4,	%o6,	%g1
	ta	%icc,	0x1
	movrgez	%o2,	%i7,	%g2
loop_2667:
	movrne	%l6,	0x3EE,	%i6
	tneg	%icc,	0x1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%i4,	%i1
	movre	%i3,	%g5,	%g7
	movpos	%xcc,	%i0,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l5,	%o5
	fmovrsne	%o7,	%f19,	%f31
	srax	%i5,	%o4,	%o0
	tpos	%icc,	0x4
	add	%g6,	0x0ECF,	%l1
	nop
	fitos	%f31,	%f4
	srax	%l3,	%l4,	%g3
	fnors	%f26,	%f6,	%f9
	smulcc	%o1,	0x15FA,	%l2
	movpos	%xcc,	%i2,	%g4
	fbge,a	%fcc0,	loop_2668
	tsubcctv	%o6,	0x033A,	%g1
	movneg	%xcc,	%o2,	%o3
	wr	%g0,	0x18,	%asi
	sta	%f29,	[%l7 + 0x08] %asi
loop_2668:
	swap	[%l7 + 0x08],	%g2
	prefetch	[%l7 + 0x64],	 0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x04,	%i7,	%l6
	sethi	0x0FA3,	%i4
	fmovsa	%xcc,	%f25,	%f14
	ldub	[%l7 + 0x29],	%i1
	edge8	%i3,	%i6,	%g5
	set	0x5E, %o7
	ldsha	[%l7 + %o7] 0x15,	%i0
	nop
	setx loop_2669, %l0, %l1
	jmpl %l1, %l0
	or	%g7,	%o5,	%o7
	fpmerge	%f14,	%f19,	%f2
	sllx	%i5,	0x1C,	%o4
loop_2669:
	mulscc	%o0,	0x1DB0,	%g6
	orncc	%l1,	%l5,	%l4
	ta	%xcc,	0x5
	fmovrsgez	%l3,	%f14,	%f9
	set	0x24, %o2
	ldswa	[%l7 + %o2] 0x15,	%o1
	fmovrslez	%l2,	%f29,	%f14
	be,a	loop_2670
	andncc	%i2,	%g3,	%o6
	fmovdle	%icc,	%f3,	%f15
	movcs	%icc,	%g1,	%o2
loop_2670:
	tsubcc	%o3,	0x05C4,	%g2
	bl	loop_2671
	tneg	%xcc,	0x4
	movge	%icc,	%g4,	%i7
	fpsub16s	%f24,	%f2,	%f7
loop_2671:
	fmovsvc	%xcc,	%f13,	%f26
	srax	%i4,	%i1,	%l6
	edge32n	%i3,	%g5,	%i6
	taddcc	%i0,	%g7,	%o5
	smul	%o7,	%l0,	%i5
	fornot1	%f6,	%f0,	%f18
	mova	%xcc,	%o4,	%g6
	sub	%l1,	0x19AC,	%o0
	srax	%l4,	%l3,	%l5
	tg	%icc,	0x2
	array16	%o1,	%l2,	%g3
	nop
	setx	0x7B72F32D8B3D866F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x59829287A52F11B6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f4,	%f0
	fornot2	%f20,	%f16,	%f8
	orcc	%i2,	0x06CD,	%o6
	movvs	%icc,	%o2,	%g1
	edge32n	%o3,	%g2,	%i7
	tne	%icc,	0x7
	mova	%xcc,	%i4,	%g4
	membar	0x3E
	edge32n	%i1,	%i3,	%g5
	sethi	0x013B,	%l6
	tvc	%xcc,	0x4
	udiv	%i6,	0x14E1,	%i0
	array8	%g7,	%o7,	%o5
	xnor	%l0,	%i5,	%o4
	orcc	%g6,	0x0B14,	%l1
	edge8l	%l4,	%l3,	%o0
	udivcc	%o1,	0x1EC0,	%l5
	edge32	%l2,	%i2,	%g3
	fxors	%f0,	%f5,	%f18
	or	%o2,	%o6,	%o3
	orncc	%g2,	%i7,	%g1
	stx	%g4,	[%l7 + 0x38]
	edge16ln	%i1,	%i3,	%i4
	movle	%icc,	%l6,	%g5
	andn	%i0,	%i6,	%o7
	fcmple16	%f12,	%f0,	%o5
	fba,a	%fcc2,	loop_2672
	sethi	0x005A,	%g7
	fmovrdlez	%l0,	%f0,	%f20
	edge8ln	%i5,	%o4,	%l1
loop_2672:
	fpsub16s	%f5,	%f7,	%f24
	fornot2	%f24,	%f12,	%f22
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x11
	nop
	set	0x48, %o1
	lduw	[%l7 + %o1],	%l4
	edge8	%g6,	%o0,	%o1
	fmovdvs	%icc,	%f22,	%f22
	addccc	%l5,	%l2,	%l3
	fnot1s	%f24,	%f3
	smulcc	%g3,	0x1842,	%o2
	movleu	%xcc,	%o6,	%i2
	subc	%g2,	%o3,	%g1
	brz	%i7,	loop_2673
	ld	[%l7 + 0x54],	%f19
	tge	%xcc,	0x4
	tgu	%icc,	0x3
loop_2673:
	fpsub16s	%f15,	%f5,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f16,	%f2,	%f8
	ble,pt	%icc,	loop_2674
	fmovsge	%icc,	%f26,	%f5
	movrgez	%g4,	0x366,	%i3
	nop
	setx	0x80C734A5E07AD7FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
loop_2674:
	fmuld8sux16	%f25,	%f4,	%f26
	movrgz	%i4,	0x06A,	%i1
	tvc	%xcc,	0x7
	fandnot2	%f10,	%f14,	%f22
	movre	%l6,	0x1EA,	%g5
	udiv	%i6,	0x1D3E,	%o7
	orncc	%o5,	%g7,	%i0
	edge32n	%l0,	%o4,	%i5
	fmovse	%xcc,	%f0,	%f4
	fbge	%fcc0,	loop_2675
	fpack16	%f24,	%f3
	tvc	%icc,	0x6
	tcs	%xcc,	0x5
loop_2675:
	movvs	%xcc,	%l1,	%l4
	edge8	%g6,	%o0,	%o1
	fandnot2	%f18,	%f0,	%f30
	fmovdg	%xcc,	%f6,	%f4
	udiv	%l2,	0x0589,	%l5
	brlz	%l3,	loop_2676
	movl	%xcc,	%g3,	%o6
	and	%o2,	%g2,	%i2
	movrlz	%o3,	0x1A9,	%i7
loop_2676:
	call	loop_2677
	fcmpne16	%f28,	%f12,	%g1
	fsrc2s	%f21,	%f23
	bl	loop_2678
loop_2677:
	edge16n	%g4,	%i4,	%i3
	srl	%l6,	%g5,	%i6
	smul	%o7,	0x0998,	%o5
loop_2678:
	fble	%fcc3,	loop_2679
	fmovdg	%icc,	%f3,	%f17
	fbe	%fcc3,	loop_2680
	ldstub	[%l7 + 0x20],	%i1
loop_2679:
	edge16n	%i0,	%g7,	%o4
	and	%l0,	0x0D1F,	%i5
loop_2680:
	nop
	set	0x0C, %l2
	ldsw	[%l7 + %l2],	%l4
	movvc	%icc,	%l1,	%o0
	tne	%icc,	0x7
	movrgez	%g6,	%o1,	%l2
	tl	%icc,	0x4
	membar	0x6C
	movg	%xcc,	%l3,	%l5
	fmovdne	%icc,	%f9,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o6,	%g3,	%o2
	fmovsleu	%icc,	%f12,	%f0
	add	%g2,	%i2,	%o3
	xorcc	%i7,	%g1,	%i4
	tsubcc	%g4,	0x105C,	%i3
	movneg	%icc,	%l6,	%i6
	taddcc	%g5,	%o7,	%o5
	bge	loop_2681
	st	%f28,	[%l7 + 0x20]
	fbue	%fcc2,	loop_2682
	fbge	%fcc2,	loop_2683
loop_2681:
	edge16ln	%i1,	%g7,	%o4
	fba	%fcc0,	loop_2684
loop_2682:
	array32	%l0,	%i5,	%i0
loop_2683:
	fsrc1	%f28,	%f30
	xnor	%l1,	0x1825,	%l4
loop_2684:
	fmovdge	%xcc,	%f7,	%f6
	move	%icc,	%o0,	%o1
	movn	%icc,	%l2,	%l3
	nop
	setx loop_2685, %l0, %l1
	jmpl %l1, %g6
	orcc	%l5,	%o6,	%g3
	movpos	%icc,	%g2,	%i2
	nop
	setx	0x9D82B9D0FE421F64,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x3D4491C2D77F5643,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f22,	%f8
loop_2685:
	movneg	%icc,	%o3,	%o2
	xor	%g1,	0x1B73,	%i4
	fmovrdgez	%i7,	%f16,	%f4
	fmovdge	%icc,	%f22,	%f17
	movg	%xcc,	%g4,	%l6
	fmovrsgez	%i3,	%f25,	%f26
	fmovspos	%xcc,	%f14,	%f12
	fmovdvs	%xcc,	%f22,	%f28
	move	%xcc,	%i6,	%o7
	or	%g5,	0x092B,	%o5
	xnor	%g7,	0x15C2,	%i1
	fba,a	%fcc0,	loop_2686
	xor	%o4,	0x168F,	%i5
	orn	%i0,	0x09DB,	%l1
	sub	%l0,	%l4,	%o1
loop_2686:
	fpadd16s	%f22,	%f2,	%f30
	xnor	%o0,	0x0927,	%l2
	edge16ln	%l3,	%g6,	%o6
	edge16l	%l5,	%g2,	%i2
	andn	%o3,	0x0D22,	%g3
	mova	%icc,	%o2,	%i4
	sdivcc	%i7,	0x0096,	%g1
	movrlz	%l6,	0x13F,	%i3
	edge32ln	%g4,	%o7,	%g5
	fornot1	%f28,	%f16,	%f16
	tne	%icc,	0x4
	edge32ln	%i6,	%g7,	%o5
	fbn,a	%fcc1,	loop_2687
	fpadd32	%f0,	%f2,	%f2
	alignaddr	%o4,	%i5,	%i0
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x60] %asi,	%i1
loop_2687:
	brlez	%l0,	loop_2688
	tsubcctv	%l1,	0x11C5,	%o1
	srax	%o0,	%l2,	%l3
	addccc	%g6,	%o6,	%l4
loop_2688:
	andn	%g2,	0x15C9,	%l5
	brlez	%i2,	loop_2689
	udiv	%o3,	0x05A2,	%o2
	tn	%xcc,	0x0
	stbar
loop_2689:
	nop
	setx	loop_2690,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16n	%i4,	%i7,	%g3
	te	%icc,	0x7
	fbe,a	%fcc2,	loop_2691
loop_2690:
	fbule	%fcc3,	loop_2692
	andncc	%l6,	%i3,	%g1
	nop
	fitod	%f8,	%f2
loop_2691:
	smulcc	%o7,	%g4,	%g5
loop_2692:
	movcc	%xcc,	%g7,	%o5
	udivx	%i6,	0x034E,	%o4
	fmovsne	%icc,	%f10,	%f7
	sdivx	%i0,	0x0323,	%i1
	tl	%icc,	0x1
	tgu	%xcc,	0x0
	fnegd	%f14,	%f6
	fmovsneg	%icc,	%f21,	%f5
	edge16	%i5,	%l0,	%o1
	set	0x18, %l1
	ldxa	[%l7 + %l1] 0x18,	%l1
	bleu,a,pt	%icc,	loop_2693
	orcc	%l2,	%o0,	%g6
	andcc	%o6,	0x040B,	%l4
	fble	%fcc0,	loop_2694
loop_2693:
	bn,pt	%icc,	loop_2695
	tl	%xcc,	0x5
	bcs,a	loop_2696
loop_2694:
	ldd	[%l7 + 0x38],	%l2
loop_2695:
	nop
	set	0x40, %i1
	std	%f6,	[%l7 + %i1]
	edge16	%g2,	%l5,	%i2
loop_2696:
	fmovdpos	%xcc,	%f27,	%f21
	sdivx	%o3,	0x1158,	%i4
	fmuld8ulx16	%f2,	%f10,	%f16
	andcc	%o2,	%g3,	%l6
	tneg	%icc,	0x4
	fmovscs	%xcc,	%f6,	%f11
	edge16l	%i7,	%g1,	%i3
	fpsub16	%f20,	%f12,	%f26
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o7,	[%l7 + 0x28]
	set	0x48, %g1
	stha	%g5,	[%l7 + %g1] 0x19
	sdivcc	%g7,	0x00B3,	%o5
	movleu	%xcc,	%i6,	%g4
	movvs	%xcc,	%i0,	%i1
	movrne	%o4,	%i5,	%l0
	tl	%icc,	0x6
	movpos	%icc,	%o1,	%l2
	udiv	%o0,	0x0095,	%g6
	fmovrde	%l1,	%f12,	%f4
	be	loop_2697
	movn	%icc,	%o6,	%l4
	addc	%g2,	%l3,	%l5
	andn	%o3,	%i2,	%i4
loop_2697:
	sdivx	%g3,	0x0B07,	%l6
	movcc	%icc,	%i7,	%g1
	edge32ln	%i3,	%o7,	%o2
	or	%g7,	0x0663,	%g5
	xnorcc	%o5,	0x1318,	%i6
	smulcc	%i0,	%g4,	%o4
	xor	%i1,	0x1AE8,	%l0
	fmovsge	%icc,	%f9,	%f0
	tvc	%icc,	0x2
	tcs	%xcc,	0x1
	fmovrsgz	%i5,	%f25,	%f30
	mova	%icc,	%o1,	%l2
	tn	%xcc,	0x4
	membar	0x11
	fbg	%fcc3,	loop_2698
	tge	%xcc,	0x7
	edge16l	%g6,	%o0,	%l1
	tsubcc	%o6,	%l4,	%l3
loop_2698:
	tneg	%xcc,	0x0
	fnands	%f3,	%f5,	%f26
	subccc	%g2,	0x13B7,	%o3
	fmovdge	%icc,	%f10,	%f2
	fbo,a	%fcc0,	loop_2699
	sra	%i2,	0x02,	%i4
	addcc	%l5,	0x07AA,	%l6
	nop
	setx loop_2700, %l0, %l1
	jmpl %l1, %i7
loop_2699:
	array32	%g1,	%i3,	%o7
	edge32n	%o2,	%g7,	%g5
	edge32ln	%g3,	%o5,	%i6
loop_2700:
	nop
	fitod	%f8,	%f16
	movle	%icc,	%g4,	%o4
	edge16n	%i1,	%l0,	%i0
	fmovdle	%xcc,	%f4,	%f4
	fmuld8sux16	%f21,	%f3,	%f4
	tneg	%xcc,	0x2
	alignaddr	%i5,	%l2,	%g6
	fmovdgu	%xcc,	%f12,	%f24
	lduh	[%l7 + 0x16],	%o0
	edge16n	%l1,	%o1,	%o6
	fnot1s	%f27,	%f13
	add	%l4,	%l3,	%o3
	subcc	%g2,	%i2,	%l5
	fbg	%fcc1,	loop_2701
	movrgz	%l6,	%i7,	%g1
	tge	%xcc,	0x2
	sllx	%i3,	0x0D,	%o7
loop_2701:
	edge16l	%i4,	%o2,	%g5
	xorcc	%g3,	%o5,	%g7
	fabsd	%f18,	%f4
	movpos	%xcc,	%i6,	%o4
	umul	%i1,	%l0,	%g4
	array16	%i0,	%l2,	%g6
	tle	%icc,	0x7
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f28
	fxtod	%f28,	%f6
	sdivx	%i5,	0x00CD,	%o0
	nop
	setx	0x91673B69AA16B07E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f20
	movcc	%icc,	%l1,	%o1
	fbl	%fcc1,	loop_2702
	tneg	%icc,	0x1
	fmovsneg	%icc,	%f31,	%f5
	edge16n	%l4,	%o6,	%l3
loop_2702:
	flush	%l7 + 0x50
	movle	%xcc,	%g2,	%o3
	udivcc	%i2,	0x0B33,	%l6
	addccc	%l5,	%g1,	%i3
	movvs	%xcc,	%i7,	%i4
	tvs	%xcc,	0x0
	edge16ln	%o7,	%o2,	%g3
	or	%o5,	0x1E32,	%g7
	ldd	[%l7 + 0x58],	%f18
	nop
	setx	0xE655F48D50567CFA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	movleu	%icc,	%i6,	%g5
	std	%f30,	[%l7 + 0x08]
	umulcc	%o4,	0x03C6,	%i1
	tcc	%icc,	0x7
	fornot1s	%f8,	%f0,	%f25
	nop
	fitos	%f11,	%f12
	fstox	%f12,	%f20
	tl	%icc,	0x1
	movrlez	%g4,	0x3EA,	%i0
	udivcc	%l2,	0x19B2,	%g6
	udiv	%l0,	0x11B3,	%i5
	array8	%l1,	%o0,	%l4
	sethi	0x142A,	%o6
	nop
	setx	0x7044B5FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	sdiv	%o1,	0x082D,	%g2
	fornot2	%f4,	%f12,	%f22
	ld	[%l7 + 0x18],	%f4
	udivx	%o3,	0x10C9,	%l3
	fornot1	%f24,	%f10,	%f12
	std	%f18,	[%l7 + 0x18]
	tleu	%icc,	0x1
	set	0x23, %o0
	ldsba	[%l7 + %o0] 0x0c,	%l6
	xnor	%l5,	0x11EA,	%g1
	sdivx	%i2,	0x1411,	%i3
	fbg,a	%fcc2,	loop_2703
	ld	[%l7 + 0x70],	%f2
	nop
	set	0x26, %i2
	stb	%i7,	[%l7 + %i2]
	udivcc	%i4,	0x07F4,	%o7
loop_2703:
	fpadd32	%f4,	%f20,	%f24
	fbue,a	%fcc2,	loop_2704
	faligndata	%f2,	%f20,	%f18
	tsubcc	%g3,	0x1ED4,	%o5
	ldx	[%l7 + 0x40],	%g7
loop_2704:
	movneg	%xcc,	%o2,	%i6
	fcmpne32	%f20,	%f30,	%g5
	edge32n	%i1,	%o4,	%g4
	be,pt	%xcc,	loop_2705
	bleu,a	loop_2706
	movpos	%xcc,	%i0,	%l2
	movgu	%xcc,	%l0,	%g6
loop_2705:
	tleu	%icc,	0x1
loop_2706:
	edge8l	%l1,	%i5,	%l4
	movre	%o6,	%o0,	%o1
	nop
	fitos	%f10,	%f1
	fstox	%f1,	%f8
	fxtos	%f8,	%f0
	edge8	%g2,	%o3,	%l6
	srlx	%l3,	0x12,	%l5
	fmovdneg	%xcc,	%f22,	%f10
	fcmpgt32	%f16,	%f28,	%g1
	pdist	%f24,	%f20,	%f14
	fmovsa	%icc,	%f26,	%f30
	tpos	%xcc,	0x5
	smulcc	%i3,	0x034F,	%i2
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x28] %asi,	%i7
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x58] %asi,	%f0
	move	%icc,	%i4,	%o7
	movneg	%xcc,	%g3,	%o5
	and	%o2,	0x014F,	%i6
	nop
	setx loop_2707, %l0, %l1
	jmpl %l1, %g7
	movvc	%xcc,	%i1,	%g5
	sdiv	%o4,	0x13D1,	%g4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x6C] %asi,	%f4
loop_2707:
	movge	%icc,	%i0,	%l2
	fbe,a	%fcc3,	loop_2708
	srax	%l0,	0x09,	%g6
	sub	%i5,	0x0CF6,	%l4
	tcs	%xcc,	0x1
loop_2708:
	xor	%o6,	%l1,	%o1
	movrlz	%o0,	%o3,	%l6
	edge16	%g2,	%l5,	%l3
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x10] %asi,	%i3
	ta	%icc,	0x3
	subccc	%i2,	0x1E19,	%g1
	brlez,a	%i4,	loop_2709
	tsubcc	%o7,	%g3,	%o5
	fbn	%fcc3,	loop_2710
	fcmple32	%f24,	%f2,	%o2
loop_2709:
	nop
	wr	%g0,	0x23,	%asi
	stba	%i6,	[%l7 + 0x0F] %asi
	membar	#Sync
loop_2710:
	udivcc	%i7,	0x069D,	%g7
	call	loop_2711
	prefetch	[%l7 + 0x68],	 0x2
	tcs	%xcc,	0x3
	tsubcctv	%i1,	%o4,	%g4
loop_2711:
	srax	%i0,	%l2,	%l0
	srlx	%g5,	%i5,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%g6,	0x16EB,	%o6
	tgu	%xcc,	0x2
	fmovsgu	%xcc,	%f17,	%f27
	fpadd32s	%f18,	%f6,	%f18
	ldsh	[%l7 + 0x7A],	%l1
	edge16n	%o1,	%o0,	%l6
	tvs	%icc,	0x0
	fxor	%f20,	%f22,	%f4
	movl	%icc,	%g2,	%o3
	and	%l3,	0x1491,	%l5
	nop
	setx	loop_2712,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbo,a	%fcc3,	loop_2713
	fpadd16	%f2,	%f2,	%f28
	bge,a	loop_2714
loop_2712:
	movneg	%icc,	%i2,	%i3
loop_2713:
	bg	%xcc,	loop_2715
	array16	%g1,	%o7,	%g3
loop_2714:
	movrlez	%i4,	%o5,	%i6
	flush	%l7 + 0x0C
loop_2715:
	tge	%xcc,	0x3
	set	0x18, %l3
	ldsha	[%l7 + %l3] 0x88,	%i7
	fand	%f24,	%f20,	%f0
	fornot2s	%f9,	%f21,	%f24
	subc	%o2,	0x1DF9,	%i1
	wr	%g0,	0x80,	%asi
	stba	%g7,	[%l7 + 0x3C] %asi
	fbuge	%fcc2,	loop_2716
	bg	loop_2717
	nop
	set	0x70, %l0
	stw	%g4,	[%l7 + %l0]
	sub	%i0,	0x0D69,	%o4
loop_2716:
	stw	%l0,	[%l7 + 0x4C]
loop_2717:
	fbge	%fcc0,	loop_2718
	tgu	%xcc,	0x7
	membar	0x7C
	fbu	%fcc3,	loop_2719
loop_2718:
	fpsub32	%f22,	%f26,	%f8
	membar	0x03
	orcc	%g5,	%l2,	%l4
loop_2719:
	array8	%i5,	%o6,	%l1
	tl	%xcc,	0x3
	movre	%o1,	%g6,	%l6
	xnor	%o0,	0x1B4C,	%o3
	movvc	%icc,	%g2,	%l5
	fmovsne	%icc,	%f29,	%f2
	std	%f22,	[%l7 + 0x30]
	fbug	%fcc1,	loop_2720
	bne,a	%icc,	loop_2721
	sllx	%l3,	%i3,	%g1
	move	%xcc,	%o7,	%g3
loop_2720:
	fpsub16s	%f16,	%f1,	%f8
loop_2721:
	bgu	loop_2722
	edge16	%i4,	%o5,	%i2
	add	%i6,	0x1411,	%i7
	movgu	%xcc,	%i1,	%g7
loop_2722:
	nop
	setx	0x8D48702A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0xB3B5955E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f22,	%f1
	stw	%o2,	[%l7 + 0x10]
	fmovspos	%xcc,	%f2,	%f12
	move	%icc,	%i0,	%g4
	edge32	%o4,	%l0,	%l2
	movn	%xcc,	%l4,	%i5
	movcc	%xcc,	%g5,	%o6
	bcs,a	%icc,	loop_2723
	fpsub16	%f10,	%f16,	%f22
	nop
	setx	0x01D32285,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f20
	xorcc	%l1,	0x1437,	%g6
loop_2723:
	move	%icc,	%o1,	%o0
	fmovrdgz	%o3,	%f6,	%f0
	mulx	%g2,	0x1893,	%l5
	movne	%xcc,	%l3,	%i3
	srlx	%g1,	%l6,	%g3
	tvc	%xcc,	0x7
	fmul8x16	%f20,	%f16,	%f28
	te	%xcc,	0x2
	umulcc	%i4,	0x093A,	%o5
	array16	%i2,	%i6,	%i7
	fnot1s	%f6,	%f28
	bn,a,pn	%xcc,	loop_2724
	movle	%icc,	%o7,	%g7
	fmovsge	%icc,	%f21,	%f17
	tgu	%xcc,	0x6
loop_2724:
	addcc	%o2,	0x1C9F,	%i0
	prefetch	[%l7 + 0x60],	 0x1
	fpadd32	%f18,	%f20,	%f14
	tvs	%icc,	0x6
	ld	[%l7 + 0x6C],	%f6
	fmovdgu	%icc,	%f7,	%f17
	array16	%g4,	%i1,	%l0
	tvc	%icc,	0x2
	tcs	%xcc,	0x6
	fxor	%f20,	%f16,	%f18
	addc	%o4,	0x0A7B,	%l2
	tcc	%icc,	0x7
	udivx	%l4,	0x15D9,	%i5
	wr	%g0,	0x04,	%asi
	stwa	%g5,	[%l7 + 0x74] %asi
	bcc,pn	%xcc,	loop_2725
	xnor	%o6,	0x10D1,	%g6
	wr	%g0,	0xeb,	%asi
	stha	%o1,	[%l7 + 0x0A] %asi
	membar	#Sync
loop_2725:
	orcc	%o0,	0x17C3,	%l1
	orn	%o3,	%g2,	%l5
	prefetch	[%l7 + 0x2C],	 0x1
	bn	%icc,	loop_2726
	fones	%f9
	movgu	%xcc,	%l3,	%g1
	ldsh	[%l7 + 0x42],	%i3
loop_2726:
	fnegd	%f4,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f15,	%f4
	tl	%xcc,	0x5
	edge16n	%g3,	%i4,	%l6
	nop
	setx	0x3CA27FA8D049B4AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	ldd	[%l7 + 0x68],	%o4
	nop
	setx	0x18469EF7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x49C66284,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f6,	%f21
	andcc	%i6,	%i7,	%i2
	movpos	%xcc,	%g7,	%o2
	and	%o7,	0x01E4,	%g4
	sdivx	%i0,	0x031A,	%l0
	ldd	[%l7 + 0x18],	%o4
	fnand	%f8,	%f0,	%f4
	fmovrdlz	%i1,	%f26,	%f14
	srl	%l2,	0x00,	%l4
	movre	%g5,	0x313,	%o6
	andcc	%i5,	0x0014,	%g6
	tle	%xcc,	0x3
	swap	[%l7 + 0x1C],	%o0
	stbar
	tleu	%xcc,	0x5
	fmovrslez	%l1,	%f13,	%f1
	nop
	setx	0xE9B28E44D071D040,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	tcs	%icc,	0x3
	set	0x5C, %l4
	lda	[%l7 + %l4] 0x04,	%f23
	sub	%o3,	0x14DF,	%g2
	lduw	[%l7 + 0x1C],	%o1
	andncc	%l3,	%g1,	%l5
	udivx	%i3,	0x1687,	%i4
	te	%xcc,	0x0
	edge16l	%g3,	%l6,	%o5
	tgu	%xcc,	0x2
	tl	%xcc,	0x7
	edge32l	%i7,	%i6,	%i2
	tn	%xcc,	0x2
	movle	%xcc,	%g7,	%o7
	tsubcctv	%o2,	0x102D,	%i0
	fone	%f12
	xnor	%g4,	0x1B9B,	%l0
	fmovsgu	%icc,	%f8,	%f3
	fones	%f7
	edge32	%o4,	%i1,	%l4
	fbule,a	%fcc3,	loop_2727
	movle	%icc,	%g5,	%l2
	nop
	setx	0xF0BCAE6D39943A7D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x2286E9274FD0795C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f16,	%f2
	orncc	%i5,	0x1CE4,	%g6
loop_2727:
	edge8	%o6,	%l1,	%o0
	xorcc	%g2,	0x10E8,	%o3
	fmovsge	%icc,	%f31,	%f1
	tvc	%xcc,	0x6
	fmovdneg	%icc,	%f1,	%f10
	mulscc	%o1,	%l3,	%g1
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%l4
	wr	%g0,	0x2f,	%asi
	stxa	%i4,	[%l7 + 0x78] %asi
	membar	#Sync
	mulx	%g3,	%i3,	%o5
	ldub	[%l7 + 0x1A],	%i7
	fble	%fcc1,	loop_2728
	tvs	%icc,	0x1
	nop
	set	0x2A, %i3
	lduh	[%l7 + %i3],	%l6
	movcs	%xcc,	%i2,	%g7
loop_2728:
	te	%icc,	0x6
	fnot2	%f18,	%f16
	fnands	%f9,	%f14,	%f9
	alignaddr	%o7,	%i6,	%i0
	umulcc	%o2,	%l0,	%g4
	xor	%o4,	0x1A13,	%l4
	tpos	%icc,	0x7
	edge8l	%i1,	%g5,	%l2
	set	0x66, %i6
	stha	%i5,	[%l7 + %i6] 0x10
	movle	%xcc,	%o6,	%l1
	fble,a	%fcc2,	loop_2729
	fmovdg	%xcc,	%f20,	%f23
	fmovsn	%xcc,	%f7,	%f10
	nop
	fitod	%f2,	%f28
	fdtox	%f28,	%f28
loop_2729:
	taddcc	%g6,	0x06B5,	%o0
	fmovsgu	%xcc,	%f17,	%f17
	tgu	%xcc,	0x2
	nop
	setx	0xE291C3EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f16
	fmovsge	%xcc,	%f29,	%f15
	movvc	%xcc,	%o3,	%o1
	lduh	[%l7 + 0x2A],	%g2
	fpadd16s	%f29,	%f18,	%f3
	call	loop_2730
	bpos,a	%xcc,	loop_2731
	sra	%l3,	0x04,	%l5
	tsubcctv	%i4,	0x102F,	%g1
loop_2730:
	movge	%icc,	%i3,	%o5
loop_2731:
	nop
	setx	0xF0B84F6022CDEF90,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x13A4C1AEB959D769,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f26,	%f26
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x11,	%f0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i7,	%g3
	fbne	%fcc3,	loop_2732
	fmovscs	%icc,	%f22,	%f10
	smul	%i2,	0x0BAD,	%g7
	movvs	%xcc,	%o7,	%i6
loop_2732:
	tsubcctv	%l6,	0x0C66,	%o2
	tsubcctv	%i0,	0x13DD,	%g4
	fpsub16s	%f29,	%f24,	%f5
	fors	%f7,	%f9,	%f4
	brnz,a	%o4,	loop_2733
	std	%f2,	[%l7 + 0x38]
	sdivcc	%l0,	0x0247,	%l4
	fpadd32s	%f8,	%f0,	%f2
loop_2733:
	tge	%icc,	0x7
	movpos	%xcc,	%i1,	%g5
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x24] %asi,	%f6
	fpadd32	%f18,	%f16,	%f16
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tg	%xcc,	0x0
	prefetch	[%l7 + 0x44],	 0x1
	fmovsvc	%xcc,	%f15,	%f25
	movge	%xcc,	%l2,	%i5
	edge32	%l1,	%g6,	%o0
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x4C] %asi,	%o6
	orn	%o3,	%o1,	%l3
	tg	%icc,	0x4
	edge32n	%g2,	%i4,	%l5
	brlz,a	%i3,	loop_2734
	edge32	%g1,	%i7,	%g3
	fmul8x16au	%f18,	%f30,	%f22
	and	%o5,	%i2,	%o7
loop_2734:
	ldx	[%l7 + 0x20],	%g7
	for	%f30,	%f10,	%f30
	nop
	fitod	%f2,	%f28
	fdtoi	%f28,	%f5
	tgu	%xcc,	0x0
	srax	%i6,	%l6,	%o2
	mova	%xcc,	%i0,	%g4
	sra	%o4,	0x1A,	%l4
	fmovspos	%icc,	%f14,	%f7
	tpos	%xcc,	0x2
	fzero	%f10
	movl	%xcc,	%l0,	%i1
	fmovsvs	%xcc,	%f4,	%f4
	fmul8sux16	%f4,	%f14,	%f26
	ldd	[%l7 + 0x10],	%l2
	set	0x48, %g5
	ldxa	[%l7 + %g5] 0x81,	%i5
	set	0x50, %o6
	stxa	%l1,	[%l7 + %o6] 0x22
	membar	#Sync
	edge32ln	%g6,	%g5,	%o6
	array8	%o3,	%o1,	%o0
	set	0x30, %i4
	ldda	[%l7 + %i4] 0x81,	%l2
	movgu	%icc,	%i4,	%g2
	sdivx	%i3,	0x1C67,	%l5
	bgu,pt	%icc,	loop_2735
	smul	%g1,	%i7,	%o5
	set	0x210, %l5
	stxa	%g3,	[%g0 + %l5] 0x52
loop_2735:
	xorcc	%o7,	0x1637,	%i2
	fpadd32	%f24,	%f22,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i6,	%l6,	%o2
	mulx	%g7,	0x161E,	%g4
	ldsb	[%l7 + 0x66],	%o4
	fble,a	%fcc3,	loop_2736
	fbg,a	%fcc3,	loop_2737
	array16	%i0,	%l0,	%l4
	brnz	%i1,	loop_2738
loop_2736:
	umulcc	%i5,	0x1B8F,	%l2
loop_2737:
	tl	%icc,	0x7
	tcc	%xcc,	0x1
loop_2738:
	fnands	%f12,	%f20,	%f15
	udiv	%l1,	0x0EE6,	%g5
	andn	%o6,	%g6,	%o1
	tneg	%xcc,	0x7
	movge	%xcc,	%o3,	%o0
	fzeros	%f13
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%l3
	fbu	%fcc1,	loop_2739
	sll	%g2,	%i3,	%i4
	bshuffle	%f28,	%f16,	%f14
	fmovrsne	%l5,	%f20,	%f13
loop_2739:
	sdivcc	%g1,	0x1455,	%o5
	movrlz	%i7,	%g3,	%o7
	brlz	%i2,	loop_2740
	sdivx	%i6,	0x09D2,	%o2
	swap	[%l7 + 0x58],	%g7
	sllx	%l6,	%o4,	%i0
loop_2740:
	taddcctv	%l0,	0x162D,	%l4
	edge16l	%g4,	%i1,	%l2
	tneg	%xcc,	0x0
	pdist	%f16,	%f6,	%f10
	subcc	%l1,	%i5,	%g5
	edge8l	%o6,	%o1,	%o3
	set	0x26, %g2
	lduba	[%l7 + %g2] 0x19,	%g6
	bshuffle	%f20,	%f4,	%f6
	fcmpeq16	%f22,	%f6,	%o0
	alignaddr	%l3,	%i3,	%i4
	tcs	%icc,	0x1
	taddcctv	%g2,	%g1,	%l5
	tn	%xcc,	0x0
	xorcc	%o5,	0x1515,	%g3
	tcc	%icc,	0x6
	stbar
	tsubcc	%o7,	%i2,	%i6
	fbo	%fcc2,	loop_2741
	fxors	%f13,	%f4,	%f0
	fandnot2	%f18,	%f24,	%f4
	fpsub16s	%f13,	%f2,	%f31
loop_2741:
	fbule	%fcc3,	loop_2742
	sethi	0x1F6D,	%o2
	fmovdle	%xcc,	%f10,	%f13
	movre	%g7,	%l6,	%o4
loop_2742:
	nop
	set	0x30, %o5
	prefetcha	[%l7 + %o5] 0x14,	 0x0
	srlx	%l0,	0x06,	%i0
	stb	%g4,	[%l7 + 0x6F]
	fpsub16	%f20,	%f22,	%f2
	ldd	[%l7 + 0x28],	%f4
	andn	%l4,	0x0221,	%l2
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%l1
	udivx	%i1,	0x11B3,	%i5
	tpos	%xcc,	0x2
	fmovdgu	%xcc,	%f12,	%f0
	tleu	%xcc,	0x5
	fbule,a	%fcc2,	loop_2743
	edge32ln	%g5,	%o1,	%o6
	brnz	%g6,	loop_2744
	movle	%xcc,	%o3,	%l3
loop_2743:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
loop_2744:
	smul	%i3,	%g2,	%i4
	sra	%l5,	0x14,	%o5
	pdist	%f20,	%f12,	%f30
	movneg	%icc,	%g1,	%g3
	movn	%xcc,	%o7,	%i6
	edge16	%o2,	%g7,	%l6
	movpos	%icc,	%i2,	%o4
	tg	%icc,	0x3
	fbug,a	%fcc3,	loop_2745
	addccc	%l0,	0x01D0,	%i0
	fone	%f8
	fble,a	%fcc1,	loop_2746
loop_2745:
	movgu	%xcc,	%g4,	%i7
	brnz	%l4,	loop_2747
	edge32	%l2,	%l1,	%i1
loop_2746:
	movle	%xcc,	%g5,	%i5
	fmovrsne	%o1,	%f29,	%f4
loop_2747:
	nop
	set	0x70, %g6
	stba	%g6,	[%l7 + %g6] 0x88
	bne,a	loop_2748
	ldub	[%l7 + 0x45],	%o3
	fbug,a	%fcc0,	loop_2749
	edge8	%l3,	%o6,	%o0
loop_2748:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x44] %asi,	%g2
loop_2749:
	subc	%i4,	%l5,	%i3
	fmovsleu	%xcc,	%f3,	%f25
	ldd	[%l7 + 0x50],	%f12
	bcc	%icc,	loop_2750
	mova	%xcc,	%g1,	%g3
	fble,a	%fcc1,	loop_2751
	array32	%o5,	%o7,	%o2
loop_2750:
	tge	%icc,	0x5
	andn	%i6,	%g7,	%l6
loop_2751:
	xor	%o4,	0x1085,	%i2
	fmovrdne	%l0,	%f24,	%f8
	wr	%g0,	0x57,	%asi
	stxa	%g4,	[%g0 + 0x0] %asi
	fmovrde	%i7,	%f0,	%f30
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x89
	wr	%g0,	0xea,	%asi
	stba	%i0,	[%l7 + 0x28] %asi
	membar	#Sync
	ldd	[%l7 + 0x58],	%l2
	ta	%icc,	0x4
	fors	%f22,	%f5,	%f26
	xnorcc	%l4,	%i1,	%l1
	addccc	%i5,	%o1,	%g6
	tvs	%xcc,	0x0
	addccc	%g5,	0x03D0,	%o3
	movrgez	%o6,	%l3,	%g2
	tvs	%xcc,	0x7
	tcc	%xcc,	0x7
	movvc	%xcc,	%o0,	%l5
	sllx	%i3,	0x07,	%g1
	movle	%xcc,	%i4,	%g3
	orn	%o5,	%o7,	%o2
	tvs	%icc,	0x3
	nop
	setx	0xC565282C4051CFF6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fmovrdne	%i6,	%f0,	%f6
	smulcc	%g7,	%o4,	%l6
	tsubcc	%i2,	0x05F5,	%l0
	bneg,pn	%xcc,	loop_2752
	movrlez	%g4,	%i0,	%i7
	fxnor	%f20,	%f10,	%f4
	movneg	%xcc,	%l4,	%l2
loop_2752:
	andcc	%i1,	0x16E4,	%l1
	xor	%o1,	%g6,	%i5
	tvc	%xcc,	0x2
	fcmpgt16	%f12,	%f22,	%o3
	fbn	%fcc0,	loop_2753
	subc	%o6,	%l3,	%g2
	tge	%xcc,	0x3
	tle	%xcc,	0x1
loop_2753:
	tne	%icc,	0x1
	fandnot2	%f26,	%f18,	%f14
	move	%xcc,	%g5,	%l5
	tneg	%xcc,	0x6
	fmovsvs	%icc,	%f5,	%f8
	fmovdgu	%icc,	%f4,	%f14
	fmovsvs	%icc,	%f6,	%f29
	taddcctv	%i3,	%g1,	%i4
	xor	%o0,	%g3,	%o5
	edge16l	%o2,	%o7,	%g7
	fmovrdgz	%o4,	%f26,	%f20
	fmovsa	%xcc,	%f30,	%f20
	subc	%l6,	0x10C6,	%i6
	be	%icc,	loop_2754
	movl	%icc,	%i2,	%g4
	andncc	%l0,	%i7,	%l4
	fmul8x16au	%f25,	%f20,	%f28
loop_2754:
	movrgez	%l2,	0x099,	%i1
	umul	%i0,	0x196E,	%o1
	bleu,pn	%xcc,	loop_2755
	tneg	%icc,	0x6
	srl	%g6,	0x12,	%l1
	andncc	%o3,	%o6,	%i5
loop_2755:
	sra	%g2,	0x1E,	%g5
	edge8ln	%l3,	%l5,	%g1
	movrgz	%i4,	0x098,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g3,	%o5,	%o2
	fpadd32s	%f28,	%f22,	%f3
	movgu	%xcc,	%o0,	%g7
	movge	%xcc,	%o7,	%l6
	sethi	0x06F0,	%i6
	xnor	%o4,	0x148E,	%g4
	set	0x30, %g7
	ldda	[%l7 + %g7] 0x81,	%i2
	movvs	%icc,	%i7,	%l4
	fmovsne	%icc,	%f14,	%f12
	st	%f30,	[%l7 + 0x54]
	lduw	[%l7 + 0x1C],	%l2
	tneg	%icc,	0x6
	sdivx	%l0,	0x1974,	%i1
	xnor	%o1,	0x0C05,	%i0
	xnorcc	%l1,	0x199F,	%o3
	nop
	fitos	%f23,	%f28
	bpos,a	loop_2756
	fones	%f17
	tle	%xcc,	0x4
	xnor	%o6,	0x02AB,	%i5
loop_2756:
	tne	%xcc,	0x2
	fba,a	%fcc2,	loop_2757
	orcc	%g2,	%g6,	%g5
	add	%l3,	%l5,	%g1
	srax	%i4,	%g3,	%i3
loop_2757:
	tcc	%icc,	0x0
	fmovsvs	%icc,	%f14,	%f24
	fpsub16	%f6,	%f16,	%f26
	sra	%o2,	%o5,	%g7
	fcmpgt32	%f24,	%f0,	%o0
	wr	%g0,	0x80,	%asi
	sta	%f15,	[%l7 + 0x64] %asi
	taddcctv	%o7,	0x17D2,	%l6
	tneg	%xcc,	0x5
	edge32n	%i6,	%o4,	%i2
	mulx	%i7,	0x09B5,	%g4
	edge16	%l2,	%l4,	%i1
	edge16n	%l0,	%o1,	%l1
	array32	%o3,	%o6,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g2,	0x1587,	%i5
	membar	0x00
	popc	0x05CD,	%g6
	addcc	%g5,	0x1AE7,	%l5
	movvs	%icc,	%g1,	%i4
	movrlez	%g3,	0x119,	%l3
	fand	%f12,	%f26,	%f20
	movrgz	%o2,	0x035,	%o5
	movg	%icc,	%i3,	%g7
	fmovrsgez	%o0,	%f15,	%f27
	brgez	%l6,	loop_2758
	edge32l	%o7,	%o4,	%i6
	andn	%i7,	0x1EE3,	%i2
	movleu	%xcc,	%g4,	%l2
loop_2758:
	fabsd	%f16,	%f24
	fmovdge	%xcc,	%f0,	%f21
	udivcc	%l4,	0x1F1E,	%l0
	fmovrslez	%o1,	%f6,	%f6
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x08] %asi,	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o3,	%l1
	tcc	%xcc,	0x3
	edge32ln	%o6,	%i0,	%i5
	sdivcc	%g6,	0x0DE3,	%g2
	sdivx	%g5,	0x1C8A,	%g1
	edge16n	%i4,	%g3,	%l3
	ldsb	[%l7 + 0x65],	%o2
	fmuld8ulx16	%f17,	%f0,	%f20
	fbn	%fcc0,	loop_2759
	edge32l	%l5,	%i3,	%g7
	bcs,a,pn	%xcc,	loop_2760
	fbug,a	%fcc3,	loop_2761
loop_2759:
	tge	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2760:
	movvc	%xcc,	%o5,	%l6
loop_2761:
	movcc	%icc,	%o7,	%o4
	brnz	%i6,	loop_2762
	fmovdle	%xcc,	%f22,	%f31
	set	0x30, %l6
	lduha	[%l7 + %l6] 0x80,	%o0
loop_2762:
	fmovrslez	%i7,	%f16,	%f11
	fmovrsgz	%i2,	%f30,	%f7
	te	%icc,	0x5
	movrne	%g4,	0x038,	%l4
	brlez	%l0,	loop_2763
	or	%l2,	0x09F1,	%i1
	srax	%o3,	%o1,	%l1
	bgu	%icc,	loop_2764
loop_2763:
	fmovsne	%xcc,	%f28,	%f22
	movcs	%icc,	%i0,	%o6
	ldd	[%l7 + 0x40],	%i4
loop_2764:
	mova	%icc,	%g2,	%g5
	set	0x1C, %g4
	ldswa	[%l7 + %g4] 0x80,	%g6
	edge32ln	%i4,	%g1,	%g3
	fmovdcc	%xcc,	%f29,	%f6
	fbl,a	%fcc2,	loop_2765
	edge16	%o2,	%l5,	%l3
	nop
	setx	0xF1C5DC49,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x78239507,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f7,	%f26
	smulcc	%i3,	0x0A8E,	%o5
loop_2765:
	srl	%g7,	0x1A,	%o7
	movl	%xcc,	%l6,	%i6
	fmovsn	%icc,	%f14,	%f20
	nop
	set	0x14, %i7
	ldsb	[%l7 + %i7],	%o4
	move	%xcc,	%i7,	%i2
	brz,a	%o0,	loop_2766
	fmovsgu	%icc,	%f2,	%f9
	fba,a	%fcc3,	loop_2767
	movgu	%icc,	%g4,	%l0
loop_2766:
	sll	%l4,	%i1,	%o3
	movvs	%xcc,	%o1,	%l2
loop_2767:
	stb	%i0,	[%l7 + 0x49]
	tn	%icc,	0x2
	smulcc	%o6,	%l1,	%g2
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x16] %asi,	%i5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%g5,	%g6
	tneg	%icc,	0x7
	fone	%f12
	edge16n	%i4,	%g1,	%g3
	tg	%xcc,	0x1
	tn	%xcc,	0x1
	fbg,a	%fcc3,	loop_2768
	edge8l	%o2,	%l5,	%i3
	fbule,a	%fcc3,	loop_2769
	addc	%l3,	%g7,	%o5
loop_2768:
	srl	%o7,	0x04,	%l6
	nop
	setx	loop_2770,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2769:
	popc	0x1B24,	%o4
	fpsub32s	%f30,	%f6,	%f13
	addccc	%i7,	0x0ADA,	%i2
loop_2770:
	edge8n	%o0,	%g4,	%l0
	xnor	%l4,	%i1,	%o3
	ldstub	[%l7 + 0x15],	%o1
	mulx	%i6,	%i0,	%l2
	movn	%xcc,	%l1,	%o6
	fble,a	%fcc0,	loop_2771
	edge32n	%g2,	%i5,	%g6
	ldsw	[%l7 + 0x30],	%g5
	membar	0x1F
loop_2771:
	nop
	fbue	%fcc1,	loop_2772
	nop
	setx	0x5E003E04F2FE44D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f22
	sdivcc	%g3,	0x05AD,	%g1
	fmul8ulx16	%f30,	%f16,	%f8
loop_2772:
	fmovs	%f11,	%f3
	umul	%l5,	%i3,	%o2
	udiv	%l3,	0x0A08,	%g7
	sir	0x038B
	nop
	fitos	%f10,	%f8
	fstoi	%f8,	%f16
	movg	%xcc,	%o5,	%o7
	edge32l	%l6,	%o4,	%i7
	taddcctv	%o0,	%g4,	%i2
	tleu	%icc,	0x6
	ldsw	[%l7 + 0x44],	%l0
	or	%l4,	%i1,	%o3
	movl	%xcc,	%o1,	%i0
	nop
	fitos	%f8,	%f21
	fstod	%f21,	%f4
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x50] %asi,	%i6
	stb	%l2,	[%l7 + 0x09]
	andn	%o6,	%l1,	%i5
	taddcctv	%g6,	0x03EB,	%g5
	xnor	%g2,	0x08C2,	%g3
	orcc	%g1,	%l5,	%i4
	tpos	%icc,	0x1
	popc	%o2,	%l3
	mova	%icc,	%i3,	%o5
	brz,a	%o7,	loop_2773
	fbe	%fcc0,	loop_2774
	fxor	%f22,	%f4,	%f16
	xnorcc	%l6,	%g7,	%i7
loop_2773:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2774:
	addcc	%o4,	0x14A1,	%g4
	srlx	%o0,	%l0,	%i2
	sll	%i1,	%l4,	%o3
	fmovsvc	%icc,	%f26,	%f0
	fmovsne	%icc,	%f24,	%f10
	fmovrslz	%o1,	%f27,	%f13
	tvs	%xcc,	0x6
	udivcc	%i6,	0x015B,	%l2
	fpadd16s	%f6,	%f20,	%f24
	edge32ln	%o6,	%i0,	%l1
	set	0x54, %g3
	lduha	[%l7 + %g3] 0x04,	%g6
	srl	%g5,	0x0C,	%g2
	bcc	loop_2775
	xnorcc	%g3,	0x10B8,	%i5
	sir	0x08AF
	andn	%g1,	0x025A,	%l5
loop_2775:
	sub	%i4,	0x1BB2,	%l3
	array32	%o2,	%i3,	%o7
	alignaddr	%l6,	%o5,	%g7
	xnorcc	%o4,	%i7,	%o0
	sub	%l0,	0x0430,	%g4
	taddcctv	%i2,	0x1C05,	%i1
	nop
	fitod	%f13,	%f0
	edge8ln	%l4,	%o3,	%o1
	edge8ln	%l2,	%o6,	%i0
	ld	[%l7 + 0x08],	%f26
	array32	%i6,	%l1,	%g6
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x50] %asi,	%g5
	set	0x60, %o2
	ldda	[%l7 + %o2] 0x81,	%g2
	fpsub16	%f14,	%f14,	%f16
	swap	[%l7 + 0x18],	%g2
	movvs	%xcc,	%g1,	%i5
	srlx	%l5,	0x0F,	%l3
	fpadd32s	%f27,	%f30,	%f21
	edge32l	%o2,	%i4,	%i3
	movne	%icc,	%o7,	%o5
	fmul8x16al	%f27,	%f24,	%f4
	or	%g7,	%l6,	%o4
	movrlez	%o0,	%l0,	%g4
	movre	%i7,	%i1,	%l4
	brz	%o3,	loop_2776
	brlez	%i2,	loop_2777
	fzeros	%f25
	fmovsa	%xcc,	%f5,	%f28
loop_2776:
	movrgz	%l2,	%o1,	%o6
loop_2777:
	nop
	setx	loop_2778,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	pdist	%f18,	%f30,	%f6
	fors	%f11,	%f19,	%f22
	movrlz	%i0,	0x16E,	%l1
loop_2778:
	movg	%xcc,	%i6,	%g6
	fmovdn	%icc,	%f25,	%f13
	fpsub32s	%f1,	%f28,	%f8
	fbue,a	%fcc1,	loop_2779
	edge16	%g5,	%g3,	%g1
	subccc	%i5,	0x128E,	%g2
	bcc	%icc,	loop_2780
loop_2779:
	fnors	%f3,	%f6,	%f22
	edge8n	%l3,	%o2,	%i4
	srlx	%i3,	%l5,	%o7
loop_2780:
	nop
	fitos	%f28,	%f10
	fbne,a	%fcc2,	loop_2781
	andncc	%o5,	%l6,	%o4
	bgu,a,pt	%icc,	loop_2782
	tneg	%icc,	0x7
loop_2781:
	ta	%xcc,	0x7
	or	%g7,	%o0,	%g4
loop_2782:
	movrgz	%i7,	%i1,	%l4
	smulcc	%l0,	0x1E37,	%o3
	bcs,a,pn	%icc,	loop_2783
	lduh	[%l7 + 0x6C],	%l2
	movrlez	%i2,	%o6,	%o1
	tpos	%icc,	0x4
loop_2783:
	srlx	%i0,	0x08,	%l1
	fmovrdne	%g6,	%f28,	%f4
	xor	%g5,	%i6,	%g1
	nop
	setx	0xA7F991F6DB62D72A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xD75D76FDF30330AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f18,	%f8
	fnegd	%f6,	%f30
	edge32l	%g3,	%g2,	%i5
	fpadd32s	%f5,	%f23,	%f3
	fmovdge	%xcc,	%f22,	%f5
	srax	%o2,	%l3,	%i3
	edge32ln	%i4,	%l5,	%o7
	subccc	%o5,	0x01DA,	%o4
	wr	%g0,	0x80,	%asi
	stba	%g7,	[%l7 + 0x62] %asi
	bcc,pn	%xcc,	loop_2784
	and	%o0,	%g4,	%i7
	tneg	%icc,	0x0
	fxnor	%f16,	%f30,	%f26
loop_2784:
	taddcctv	%i1,	0x14F6,	%l4
	sdiv	%l0,	0x1B23,	%o3
	stx	%l2,	[%l7 + 0x48]
	ldsh	[%l7 + 0x7A],	%i2
	bn,a	%xcc,	loop_2785
	bvs,pt	%icc,	loop_2786
	edge32l	%l6,	%o6,	%i0
	set	0x64, %i5
	stha	%l1,	[%l7 + %i5] 0x22
	membar	#Sync
loop_2785:
	movg	%icc,	%o1,	%g5
loop_2786:
	nop
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g6
	fsrc1s	%f28,	%f9
	udivcc	%g1,	0x146A,	%g3
	movvc	%icc,	%i6,	%g2
	edge32	%i5,	%l3,	%i3
	andncc	%i4,	%l5,	%o7
	movne	%icc,	%o5,	%o4
	movrne	%g7,	%o0,	%g4
	movrgz	%i7,	0x3B3,	%o2
	xnorcc	%i1,	%l4,	%o3
	prefetch	[%l7 + 0x40],	 0x2
	set	0x20, %o7
	stha	%l2,	[%l7 + %o7] 0x11
	nop
	setx	0x04748217,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f27
	bgu,a,pt	%xcc,	loop_2787
	srlx	%i2,	0x12,	%l0
	st	%f2,	[%l7 + 0x50]
	fmovspos	%xcc,	%f1,	%f2
loop_2787:
	alignaddr	%l6,	%i0,	%o6
	edge8n	%l1,	%g5,	%o1
	edge32l	%g6,	%g1,	%g3
	edge32ln	%g2,	%i6,	%i5
	edge8l	%i3,	%l3,	%l5
	fnot2s	%f25,	%f6
	fone	%f6
	array8	%i4,	%o7,	%o4
	sra	%g7,	0x15,	%o0
	ld	[%l7 + 0x78],	%f14
	nop
	setx	0x3DB7E8B7E568469A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xD10754B8A690C80F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f8,	%f10
	nop
	setx	loop_2788,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%o5,	%i7,	%g4
	nop
	setx	0xEABB7F27E070D508,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	mova	%xcc,	%o2,	%i1
loop_2788:
	fbg,a	%fcc2,	loop_2789
	fmovscc	%icc,	%f19,	%f4
	umulcc	%l4,	%l2,	%i2
	xnorcc	%o3,	0x1754,	%l0
loop_2789:
	array8	%i0,	%o6,	%l6
	nop
	fitod	%f0,	%f4
	orcc	%l1,	%g5,	%o1
	st	%f25,	[%l7 + 0x34]
	alignaddr	%g6,	%g3,	%g1
	andn	%i6,	0x023F,	%g2
	umul	%i3,	0x0FC0,	%l3
	std	%f12,	[%l7 + 0x48]
	movrne	%i5,	0x1F7,	%l5
	edge8l	%o7,	%i4,	%o4
	membar	0x2B
	alignaddr	%g7,	%o5,	%o0
	add	%g4,	%i7,	%i1
	fbn,a	%fcc2,	loop_2790
	tgu	%icc,	0x1
	tne	%icc,	0x4
	movle	%icc,	%l4,	%o2
loop_2790:
	sdivcc	%i2,	0x16CB,	%l2
	andncc	%l0,	%o3,	%o6
	edge32l	%l6,	%i0,	%g5
	sir	0x019E
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble,a	%fcc0,	loop_2791
	stx	%l1,	[%l7 + 0x20]
	fbuge	%fcc0,	loop_2792
	movvc	%icc,	%g6,	%g3
loop_2791:
	fcmpeq32	%f18,	%f4,	%g1
	fors	%f31,	%f11,	%f4
loop_2792:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
	bvs,pn	%icc,	loop_2793
	edge16n	%g2,	%i3,	%l3
	movleu	%icc,	%i6,	%l5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%o7,	%i5
loop_2793:
	bne,pt	%xcc,	loop_2794
	fba	%fcc0,	loop_2795
	movle	%icc,	%o4,	%i4
	tvs	%icc,	0x1
loop_2794:
	tge	%icc,	0x4
loop_2795:
	fmovsne	%icc,	%f24,	%f11
	tvs	%xcc,	0x2
	sub	%g7,	0x0BA1,	%o5
	fsrc1s	%f24,	%f5
	popc	%g4,	%o0
	movl	%icc,	%i7,	%l4
	move	%xcc,	%i1,	%o2
	fblg	%fcc3,	loop_2796
	fbue,a	%fcc1,	loop_2797
	tg	%icc,	0x0
	addcc	%i2,	0x07B8,	%l2
loop_2796:
	udivx	%l0,	0x06FC,	%o3
loop_2797:
	tsubcc	%l6,	0x1DF4,	%i0
	andcc	%g5,	%o6,	%g6
	tsubcc	%l1,	0x1048,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%g3,	%g2,	%o1
	addcc	%l3,	0x0A76,	%i6
	tneg	%icc,	0x3
	orcc	%l5,	%i3,	%o7
	edge32ln	%i5,	%o4,	%g7
	ldstub	[%l7 + 0x41],	%o5
	st	%f13,	[%l7 + 0x3C]
	wr	%g0,	0x2a,	%asi
	stxa	%g4,	[%l7 + 0x30] %asi
	membar	#Sync
	tl	%icc,	0x0
	edge16ln	%i4,	%i7,	%o0
	orn	%l4,	0x029C,	%i1
	umul	%i2,	%o2,	%l0
	set	0x18, %o1
	swapa	[%l7 + %o1] 0x81,	%l2
	orcc	%o3,	%l6,	%g5
	bn,a,pt	%icc,	loop_2798
	sdiv	%o6,	0x123A,	%i0
	fpadd32s	%f24,	%f24,	%f17
	lduw	[%l7 + 0x74],	%l1
loop_2798:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g6,	0x0A39,	%g3
	srl	%g2,	0x07,	%o1
	fnot2	%f28,	%f14
	fmul8x16au	%f22,	%f14,	%f10
	andncc	%g1,	%i6,	%l5
	set	0x18, %l2
	lda	[%l7 + %l2] 0x88,	%f24
	movrgez	%i3,	0x394,	%l3
	movrne	%i5,	%o4,	%g7
	fmovsge	%xcc,	%f20,	%f31
	srlx	%o5,	0x18,	%o7
	fandnot1	%f10,	%f28,	%f30
	nop
	fitod	%f14,	%f16
	movre	%g4,	0x338,	%i7
	nop
	setx	0xA6E8E40EFD08D504,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f12
	tn	%icc,	0x3
	edge32l	%i4,	%l4,	%i1
	orn	%i2,	%o2,	%o0
	nop
	setx	0xF0FB6B9A53B16CDB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f16
	srl	%l2,	0x1E,	%o3
	edge8	%l6,	%g5,	%l0
	orn	%i0,	0x157F,	%o6
	movpos	%xcc,	%l1,	%g3
	tcc	%icc,	0x0
	alignaddr	%g6,	%g2,	%o1
	nop
	setx	0x7ADD8DEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x470286A5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f16,	%f24
	addcc	%g1,	0x1EFC,	%l5
	set	0x0E, %i1
	stha	%i3,	[%l7 + %i1] 0x2f
	membar	#Sync
	fmovrdlez	%l3,	%f20,	%f24
	bvs,pt	%icc,	loop_2799
	or	%i6,	%o4,	%i5
	fbuge,a	%fcc0,	loop_2800
	fmovsa	%icc,	%f23,	%f5
loop_2799:
	fmovdne	%xcc,	%f14,	%f24
	fpackfix	%f8,	%f15
loop_2800:
	andcc	%o5,	%o7,	%g7
	mulscc	%i7,	%i4,	%g4
	taddcctv	%l4,	0x015D,	%i1
	mova	%icc,	%i2,	%o2
	sdiv	%l2,	0x0AD3,	%o0
	sllx	%l6,	%g5,	%o3
	movgu	%icc,	%i0,	%l0
	mulscc	%o6,	0x15F6,	%g3
	st	%f14,	[%l7 + 0x2C]
	edge16n	%l1,	%g2,	%o1
	membar	0x74
	fmovsa	%xcc,	%f3,	%f17
	alignaddr	%g1,	%l5,	%i3
	bgu,a,pt	%icc,	loop_2801
	ldsw	[%l7 + 0x68],	%g6
	xor	%l3,	%o4,	%i5
	tn	%icc,	0x4
loop_2801:
	addccc	%i6,	%o5,	%o7
	fbo	%fcc1,	loop_2802
	fors	%f1,	%f13,	%f30
	lduh	[%l7 + 0x36],	%g7
	tcs	%xcc,	0x1
loop_2802:
	edge16l	%i7,	%g4,	%l4
	tl	%icc,	0x7
	movrgez	%i1,	0x168,	%i2
	movrgez	%i4,	0x0B6,	%o2
	fbne,a	%fcc3,	loop_2803
	ldd	[%l7 + 0x38],	%o0
	sethi	0x0BCD,	%l2
	edge32ln	%g5,	%l6,	%o3
loop_2803:
	movg	%xcc,	%l0,	%i0
	te	%xcc,	0x6
	movrlez	%g3,	%o6,	%g2
	membar	0x31
	sdivx	%o1,	0x0BC1,	%l1
	swap	[%l7 + 0x24],	%g1
	movrlz	%i3,	0x235,	%l5
	alignaddrl	%g6,	%l3,	%o4
	stbar
	bge	%xcc,	loop_2804
	brgez	%i5,	loop_2805
	orn	%o5,	%o7,	%i6
	udivcc	%i7,	0x1929,	%g7
loop_2804:
	membar	0x01
loop_2805:
	mulx	%g4,	%l4,	%i2
	edge16n	%i4,	%i1,	%o2
	fcmpgt32	%f0,	%f30,	%l2
	wr	%g0,	0x80,	%asi
	stba	%g5,	[%l7 + 0x13] %asi
	nop
	fitos	%f5,	%f3
	fstox	%f3,	%f0
	fxtos	%f0,	%f24
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x38] %asi,	%o0
	movrlez	%l6,	0x040,	%o3
	fmovrslez	%l0,	%f5,	%f13
	udiv	%g3,	0x0F24,	%i0
	edge16	%g2,	%o1,	%o6
	fmovrdgz	%g1,	%f20,	%f0
	movre	%l1,	0x16D,	%i3
	array32	%l5,	%g6,	%o4
	set	0x54, %g1
	ldsha	[%l7 + %g1] 0x81,	%i5
	fbn	%fcc0,	loop_2806
	edge32l	%o5,	%o7,	%i6
	fbue	%fcc2,	loop_2807
	fbo	%fcc2,	loop_2808
loop_2806:
	fmovda	%icc,	%f27,	%f20
	movle	%xcc,	%l3,	%i7
loop_2807:
	srlx	%g7,	%l4,	%i2
loop_2808:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	tgu	%xcc,	0x6
	tne	%xcc,	0x1
	movg	%xcc,	%i1,	%o2
	fmovdvc	%xcc,	%f25,	%f15
	stw	%i4,	[%l7 + 0x44]
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movne	%icc,	%g5,	%l2
	array16	%o0,	%o3,	%l0
	array32	%g3,	%i0,	%g2
	ba	loop_2809
	tne	%icc,	0x7
	tge	%icc,	0x1
	bvc,pt	%xcc,	loop_2810
loop_2809:
	tl	%icc,	0x7
	bl,pt	%icc,	loop_2811
	fbul	%fcc1,	loop_2812
loop_2810:
	fmovsa	%xcc,	%f20,	%f16
	ld	[%l7 + 0x58],	%f23
loop_2811:
	xorcc	%l6,	0x024E,	%o1
loop_2812:
	fbue	%fcc2,	loop_2813
	movle	%xcc,	%o6,	%g1
	fmovrdgez	%l1,	%f2,	%f8
	taddcc	%l5,	%i3,	%g6
loop_2813:
	edge16n	%i5,	%o5,	%o7
	fmovsle	%xcc,	%f24,	%f25
	sir	0x1BF1
	tleu	%xcc,	0x1
	alignaddr	%i6,	%l3,	%o4
	udivcc	%g7,	0x1E88,	%l4
	tcc	%xcc,	0x5
	movleu	%xcc,	%i2,	%i7
	taddcctv	%i1,	%o2,	%g4
	addcc	%g5,	%i4,	%o0
	tsubcctv	%l2,	%o3,	%g3
	st	%f21,	[%l7 + 0x20]
	edge32ln	%i0,	%l0,	%g2
	srax	%l6,	%o1,	%g1
	sdivcc	%l1,	0x07DB,	%o6
	xnorcc	%l5,	%i3,	%i5
	fmovrdlz	%o5,	%f4,	%f10
	set	0x30, %o0
	sta	%f3,	[%l7 + %o0] 0x81
	brlez	%o7,	loop_2814
	edge16	%i6,	%g6,	%l3
	faligndata	%f2,	%f22,	%f8
	tleu	%icc,	0x2
loop_2814:
	tg	%xcc,	0x1
	sllx	%g7,	%l4,	%o4
	tcs	%xcc,	0x2
	bne	%xcc,	loop_2815
	fexpand	%f12,	%f22
	fmovdvs	%icc,	%f7,	%f30
	srax	%i7,	%i2,	%i1
loop_2815:
	fba	%fcc2,	loop_2816
	movre	%g4,	0x1BA,	%g5
	andn	%o2,	0x1179,	%o0
	sir	0x16DA
loop_2816:
	xnor	%l2,	0x1AAC,	%o3
	fcmpeq16	%f28,	%f26,	%g3
	array32	%i4,	%i0,	%g2
	taddcctv	%l0,	0x0C2E,	%l6
	ldd	[%l7 + 0x20],	%f22
	fmovsleu	%xcc,	%f24,	%f14
	alignaddr	%o1,	%l1,	%o6
	and	%l5,	0x061E,	%g1
	fmovse	%icc,	%f29,	%f3
	tcc	%icc,	0x3
	sub	%i3,	%o5,	%o7
	nop
	setx loop_2817, %l0, %l1
	jmpl %l1, %i6
	fmovs	%f1,	%f1
	set	0x2C, %l1
	ldsba	[%l7 + %l1] 0x11,	%i5
loop_2817:
	sethi	0x18AA,	%g6
	edge32	%l3,	%l4,	%o4
	tvc	%xcc,	0x6
	ld	[%l7 + 0x58],	%f14
	movre	%g7,	0x0CB,	%i2
	sir	0x025B
	fbu,a	%fcc0,	loop_2818
	addccc	%i1,	0x07DA,	%i7
	wr	%g0,	0x11,	%asi
	sta	%f28,	[%l7 + 0x68] %asi
loop_2818:
	orcc	%g4,	0x0B72,	%g5
	ldd	[%l7 + 0x48],	%o2
	movg	%xcc,	%o0,	%l2
	xnorcc	%o3,	0x0675,	%g3
	fcmple16	%f12,	%f18,	%i0
	movrgez	%g2,	0x12B,	%l0
	movn	%icc,	%l6,	%o1
	fandnot2	%f0,	%f0,	%f16
	alignaddr	%i4,	%o6,	%l1
	andcc	%g1,	%i3,	%o5
	movre	%l5,	%o7,	%i6
	tvc	%icc,	0x3
	umul	%i5,	0x15B7,	%l3
	tgu	%xcc,	0x4
	fmovdcc	%icc,	%f7,	%f6
	srax	%l4,	0x1E,	%g6
	fabss	%f6,	%f5
	fmovdpos	%xcc,	%f0,	%f21
	xor	%o4,	%i2,	%i1
	stbar
	fand	%f4,	%f8,	%f28
	subc	%g7,	0x0DED,	%g4
	bcs,a	%icc,	loop_2819
	fbl	%fcc2,	loop_2820
	udiv	%i7,	0x0523,	%o2
	ld	[%l7 + 0x5C],	%f0
loop_2819:
	sra	%o0,	%l2,	%o3
loop_2820:
	call	loop_2821
	fmovdl	%icc,	%f24,	%f11
	nop
	fitos	%f19,	%f10
	add	%g5,	%i0,	%g3
loop_2821:
	tpos	%xcc,	0x5
	nop
	setx loop_2822, %l0, %l1
	jmpl %l1, %g2
	movrlez	%l0,	%o1,	%l6
	orcc	%o6,	%l1,	%g1
	tne	%xcc,	0x5
loop_2822:
	edge16	%i4,	%i3,	%l5
	fmovsneg	%icc,	%f30,	%f17
	fornot1	%f26,	%f8,	%f12
	set	0x7C, %i2
	ldswa	[%l7 + %i2] 0x15,	%o5
	movle	%icc,	%i6,	%o7
	wr	%g0,	0x89,	%asi
	sta	%f5,	[%l7 + 0x3C] %asi
	orcc	%l3,	%i5,	%l4
	edge16n	%o4,	%i2,	%i1
	subcc	%g6,	0x1E10,	%g7
	brlez,a	%i7,	loop_2823
	smulcc	%g4,	0x167F,	%o2
	xnorcc	%o0,	%o3,	%g5
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x26] %asi,	%l2
loop_2823:
	tl	%xcc,	0x3
	fmovsgu	%icc,	%f21,	%f21
	edge32ln	%i0,	%g3,	%l0
	popc	0x0375,	%o1
	ble,a,pt	%icc,	loop_2824
	fornot2	%f30,	%f14,	%f30
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%l6,	%o6
loop_2824:
	nop
	fitod	%f0,	%f0
	fdtos	%f0,	%f18
	movre	%g2,	0x2BD,	%g1
	or	%l1,	0x1737,	%i4
	addccc	%i3,	%l5,	%i6
	orncc	%o5,	%o7,	%l3
	fcmple16	%f6,	%f22,	%i5
	fpadd32s	%f9,	%f5,	%f13
	membar	0x56
	fpmerge	%f23,	%f13,	%f18
	brlz	%l4,	loop_2825
	stb	%o4,	[%l7 + 0x40]
	stw	%i1,	[%l7 + 0x0C]
	movl	%xcc,	%i2,	%g6
loop_2825:
	movrlz	%g7,	%g4,	%o2
	sdivx	%i7,	0x0A06,	%o0
	srlx	%o3,	0x0E,	%l2
	edge8l	%g5,	%i0,	%g3
	ldsh	[%l7 + 0x34],	%l0
	ld	[%l7 + 0x3C],	%f7
	pdist	%f2,	%f20,	%f28
	brgz,a	%l6,	loop_2826
	movcs	%xcc,	%o1,	%g2
	fmovrslez	%g1,	%f20,	%f12
	stx	%l1,	[%l7 + 0x40]
loop_2826:
	edge16	%i4,	%o6,	%i3
	mulx	%l5,	%i6,	%o7
	nop
	setx loop_2827, %l0, %l1
	jmpl %l1, %o5
	movrgez	%i5,	0x0C4,	%l3
	fba	%fcc2,	loop_2828
	andn	%l4,	0x0B00,	%o4
loop_2827:
	tvc	%xcc,	0x3
	stx	%i2,	[%l7 + 0x78]
loop_2828:
	bg	%icc,	loop_2829
	fbu,a	%fcc3,	loop_2830
	nop
	set	0x3E, %l3
	ldsh	[%l7 + %l3],	%g6
	brgez,a	%i1,	loop_2831
loop_2829:
	stx	%g7,	[%l7 + 0x48]
loop_2830:
	tle	%icc,	0x3
	andncc	%o2,	%i7,	%g4
loop_2831:
	nop
	setx	0x85A87CDB096898CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xB3CF6C6AD8F77D0D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f28,	%f20
	taddcctv	%o3,	%o0,	%g5
	flush	%l7 + 0x60
	tgu	%icc,	0x7
	st	%f15,	[%l7 + 0x24]
	fmul8x16au	%f5,	%f14,	%f20
	mova	%xcc,	%l2,	%g3
	set	0x3C, %l0
	swapa	[%l7 + %l0] 0x10,	%i0
	nop
	fitos	%f9,	%f1
	tvs	%xcc,	0x5
	fbg,a	%fcc0,	loop_2832
	mova	%icc,	%l6,	%o1
	edge8l	%g2,	%l0,	%g1
	fmovdpos	%icc,	%f11,	%f5
loop_2832:
	udivx	%l1,	0x07C0,	%o6
	tpos	%icc,	0x4
	addc	%i3,	%i4,	%i6
	fpmerge	%f25,	%f10,	%f8
	udivx	%o7,	0x1577,	%l5
	lduh	[%l7 + 0x58],	%i5
	st	%f18,	[%l7 + 0x64]
	wr	%g0,	0x89,	%asi
	stha	%l3,	[%l7 + 0x12] %asi
	te	%xcc,	0x1
	nop
	setx	0xCF5C67DCFAD6EE9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f6
	fsrc1	%f6,	%f12
	fpack32	%f2,	%f26,	%f4
	mova	%icc,	%o5,	%l4
	set	0x52, %l4
	ldsha	[%l7 + %l4] 0x88,	%i2
	edge16	%o4,	%i1,	%g6
	fpadd32	%f18,	%f4,	%f20
	movge	%icc,	%g7,	%i7
	edge16l	%o2,	%o3,	%g4
	fpsub32	%f24,	%f16,	%f26
	sra	%g5,	0x12,	%o0
	movrne	%l2,	0x22A,	%g3
	bn,a,pn	%xcc,	loop_2833
	fble,a	%fcc0,	loop_2834
	fba,a	%fcc3,	loop_2835
	edge32	%i0,	%o1,	%g2
loop_2833:
	edge16n	%l0,	%l6,	%l1
loop_2834:
	bshuffle	%f26,	%f22,	%f28
loop_2835:
	sir	0x1A04
	fmovsl	%xcc,	%f12,	%f16
	tne	%icc,	0x4
	fmovrdlz	%g1,	%f26,	%f4
	udiv	%i3,	0x1EB3,	%i4
	movrne	%o6,	%o7,	%i6
	fxors	%f25,	%f3,	%f14
	fsrc1	%f10,	%f6
	tle	%icc,	0x7
	tleu	%xcc,	0x0
	tleu	%icc,	0x4
	tn	%xcc,	0x4
	ldsh	[%l7 + 0x2A],	%i5
	tcc	%xcc,	0x2
	addccc	%l5,	%o5,	%l3
	fabss	%f19,	%f6
	sir	0x1716
	movge	%xcc,	%l4,	%i2
	edge32n	%o4,	%g6,	%g7
	ldd	[%l7 + 0x38],	%f28
	addcc	%i1,	%o2,	%o3
	ble,a	loop_2836
	movgu	%xcc,	%g4,	%g5
	membar	#Sync
	set	0x40, %i3
	ldda	[%l7 + %i3] 0xf9,	%f16
loop_2836:
	addcc	%o0,	0x0637,	%i7
	lduh	[%l7 + 0x0C],	%g3
	addccc	%l2,	%o1,	%g2
	fba,a	%fcc3,	loop_2837
	fmovs	%f23,	%f17
	fsrc1s	%f1,	%f9
	flush	%l7 + 0x64
loop_2837:
	xorcc	%l0,	%l6,	%l1
	movg	%icc,	%g1,	%i3
	fmovda	%xcc,	%f23,	%f22
	movgu	%xcc,	%i0,	%o6
	tg	%xcc,	0x2
	xnorcc	%i4,	%i6,	%o7
	set	0x20, %i6
	ldda	[%l7 + %i6] 0x22,	%l4
	stw	%o5,	[%l7 + 0x7C]
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x20] %asi,	%l3
	andn	%l4,	%i2,	%o4
	tpos	%xcc,	0x0
	tsubcctv	%g6,	0x0BB0,	%g7
	fandnot2s	%f21,	%f22,	%f8
	ldd	[%l7 + 0x58],	%i4
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x28] %asi,	%o2
	fpadd16	%f22,	%f8,	%f26
	orn	%i1,	0x0786,	%o3
	edge16	%g4,	%o0,	%g5
	orn	%i7,	%l2,	%o1
	ldub	[%l7 + 0x35],	%g3
	srl	%l0,	%g2,	%l6
	sdivcc	%l1,	0x001F,	%i3
	nop
	setx	0x6E36EF5C707029DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	edge32l	%i0,	%o6,	%g1
	bl,a	loop_2838
	nop
	set	0x51, %i0
	stb	%i6,	[%l7 + %i0]
	bne,pn	%xcc,	loop_2839
	fmul8sux16	%f16,	%f18,	%f4
loop_2838:
	addccc	%i4,	0x0C10,	%o7
	fmovdle	%icc,	%f17,	%f29
loop_2839:
	brgz	%l5,	loop_2840
	movcc	%icc,	%o5,	%l3
	ldub	[%l7 + 0x13],	%i2
	alignaddrl	%l4,	%g6,	%o4
loop_2840:
	popc	0x0D4D,	%i5
	udivcc	%g7,	0x1778,	%i1
	tge	%xcc,	0x3
	wr	%g0,	0x19,	%asi
	stba	%o3,	[%l7 + 0x35] %asi
	tcc	%icc,	0x6
	bpos,a,pn	%xcc,	loop_2841
	fmovda	%xcc,	%f5,	%f15
	fzeros	%f23
	fmovsne	%xcc,	%f30,	%f29
loop_2841:
	sdivcc	%o2,	0x1DDB,	%o0
	movrne	%g4,	%g5,	%l2
	mova	%icc,	%i7,	%o1
	tgu	%icc,	0x7
	movg	%icc,	%l0,	%g3
	umulcc	%l6,	%g2,	%i3
	move	%xcc,	%l1,	%i0
	smul	%o6,	%g1,	%i6
	array32	%i4,	%l5,	%o7
	tneg	%icc,	0x1
	nop
	set	0x7C, %o4
	ldsw	[%l7 + %o4],	%l3
	movrgz	%o5,	0x1AE,	%l4
	tcc	%icc,	0x3
	fmovrdlz	%g6,	%f12,	%f28
	fxors	%f24,	%f5,	%f20
	fpadd16s	%f13,	%f16,	%f16
	nop
	setx	0xC22EBD492DDDCC71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x3D4EA9BBBE59738D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f30,	%f12
	move	%icc,	%o4,	%i5
	brgz	%i2,	loop_2842
	nop
	setx	0x418CAB05,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0xE4D6CB3C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f23,	%f0
	st	%f2,	[%l7 + 0x38]
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x80,	%f0
loop_2842:
	fornot1	%f22,	%f30,	%f4
	fbo	%fcc0,	loop_2843
	fmovdleu	%icc,	%f4,	%f19
	prefetch	[%l7 + 0x6C],	 0x1
	fandnot2	%f8,	%f22,	%f16
loop_2843:
	fzero	%f4
	edge32ln	%i1,	%g7,	%o2
	nop
	setx	loop_2844,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbu,a	%fcc0,	loop_2845
	movrne	%o3,	%g4,	%o0
	fbuge	%fcc3,	loop_2846
loop_2844:
	mova	%icc,	%l2,	%g5
loop_2845:
	fbule,a	%fcc3,	loop_2847
	sdivx	%o1,	0x17CC,	%l0
loop_2846:
	tne	%icc,	0x4
	edge8l	%i7,	%g3,	%g2
loop_2847:
	srax	%l6,	%i3,	%l1
	edge8n	%i0,	%g1,	%o6
	movneg	%icc,	%i6,	%i4
	movpos	%icc,	%l5,	%l3
	wr	%g0,	0xe2,	%asi
	stwa	%o7,	[%l7 + 0x6C] %asi
	membar	#Sync
	tg	%icc,	0x1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] 0x0c,	%l4,	%o5
	fcmpne16	%f26,	%f14,	%o4
	and	%g6,	0x0ADB,	%i5
	fmovsneg	%icc,	%f12,	%f16
	nop
	setx loop_2848, %l0, %l1
	jmpl %l1, %i2
	ldub	[%l7 + 0x2F],	%g7
	movrlz	%o2,	0x26B,	%i1
	edge8ln	%g4,	%o3,	%l2
loop_2848:
	ta	%icc,	0x6
	tsubcctv	%o0,	0x18E9,	%o1
	smul	%l0,	%i7,	%g5
	fbu	%fcc3,	loop_2849
	taddcctv	%g2,	0x01D1,	%g3
	fpadd16	%f0,	%f20,	%f20
	mulscc	%i3,	0x00C4,	%l6
loop_2849:
	movne	%xcc,	%l1,	%g1
	ba,a,pt	%icc,	loop_2850
	edge16ln	%o6,	%i6,	%i0
	edge16n	%l5,	%i4,	%l3
	addcc	%l4,	%o5,	%o7
loop_2850:
	sll	%g6,	0x04,	%i5
	fmovsleu	%xcc,	%f26,	%f22
	fcmpgt16	%f28,	%f4,	%o4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x64] %asi,	%g7
	bg,a,pt	%xcc,	loop_2851
	movrgez	%o2,	%i2,	%g4
	fmovspos	%xcc,	%f24,	%f12
	ldsb	[%l7 + 0x7C],	%i1
loop_2851:
	tsubcc	%l2,	0x1F13,	%o0
	tvs	%xcc,	0x4
	fbe,a	%fcc3,	loop_2852
	addcc	%o1,	0x0DE2,	%o3
	movcc	%xcc,	%i7,	%l0
	fnot2	%f28,	%f30
loop_2852:
	nop
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge16	%g5,	%g2,	%i3
	edge8ln	%l6,	%g3,	%l1
	nop
	setx	0xF055174F,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	fsrc1	%f24,	%f10
	set	0x6A, %g5
	stha	%o6,	[%l7 + %g5] 0x2a
	membar	#Sync
	movge	%xcc,	%i6,	%i0
	move	%icc,	%g1,	%i4
	fmovse	%xcc,	%f22,	%f15
	movrlz	%l5,	%l4,	%l3
	taddcctv	%o5,	%g6,	%i5
	edge32	%o4,	%g7,	%o2
	umulcc	%o7,	0x102C,	%g4
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x68] %asi,	%i2
	bne,a	%xcc,	loop_2853
	fmovdvc	%icc,	%f13,	%f10
	move	%xcc,	%i1,	%o0
	fpadd32s	%f0,	%f5,	%f6
loop_2853:
	be	%icc,	loop_2854
	movne	%icc,	%l2,	%o3
	fandnot2	%f6,	%f24,	%f26
	sub	%o1,	%i7,	%g5
loop_2854:
	movneg	%xcc,	%g2,	%l0
	subcc	%i3,	0x1A46,	%l6
	set	0x21, %i4
	ldsba	[%l7 + %i4] 0x18,	%l1
	edge16ln	%o6,	%g3,	%i6
	alignaddrl	%g1,	%i0,	%i4
	fcmpgt16	%f18,	%f22,	%l5
	subc	%l4,	0x0938,	%l3
	fbne,a	%fcc2,	loop_2855
	fnot1s	%f16,	%f10
	ldsb	[%l7 + 0x2E],	%g6
	movrgz	%i5,	0x1DE,	%o4
loop_2855:
	subc	%g7,	0x1CBB,	%o2
	movcc	%xcc,	%o7,	%g4
	fmuld8ulx16	%f11,	%f22,	%f14
	umul	%o5,	%i1,	%i2
	swap	[%l7 + 0x48],	%l2
	andncc	%o3,	%o1,	%i7
	tgu	%icc,	0x3
	nop
	setx loop_2856, %l0, %l1
	jmpl %l1, %o0
	bcc,a	loop_2857
	udivx	%g2,	0x05B7,	%l0
	sra	%g5,	%i3,	%l6
loop_2856:
	subccc	%l1,	%o6,	%g3
loop_2857:
	fzero	%f14
	fnot2	%f26,	%f10
	smulcc	%i6,	0x061A,	%i0
	movpos	%xcc,	%g1,	%i4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x72] %asi,	%l4
	addcc	%l3,	0x1734,	%g6
	fpsub16	%f4,	%f30,	%f20
	movleu	%xcc,	%i5,	%o4
	bne,pt	%xcc,	loop_2858
	edge32	%g7,	%l5,	%o7
	fmovdcc	%xcc,	%f21,	%f22
	add	%o2,	%o5,	%i1
loop_2858:
	movrgez	%g4,	0x145,	%l2
	tvs	%xcc,	0x3
	orncc	%o3,	0x1FE1,	%i2
	tleu	%xcc,	0x7
	tn	%xcc,	0x3
	ldub	[%l7 + 0x52],	%i7
	movvs	%icc,	%o1,	%g2
	mulx	%l0,	0x1F8A,	%o0
	brgez,a	%g5,	loop_2859
	lduh	[%l7 + 0x5E],	%i3
	movvs	%xcc,	%l6,	%o6
	tsubcctv	%g3,	0x117B,	%i6
loop_2859:
	move	%xcc,	%l1,	%i0
	movrlez	%g1,	0x36B,	%i4
	add	%l4,	%g6,	%l3
	mulx	%o4,	%i5,	%l5
	umulcc	%o7,	0x0963,	%o2
	edge32	%o5,	%g7,	%g4
	brgez,a	%i1,	loop_2860
	fandnot2s	%f20,	%f27,	%f12
	tcc	%xcc,	0x6
	tcc	%xcc,	0x7
loop_2860:
	bl,a	loop_2861
	addccc	%o3,	%i2,	%i7
	ldd	[%l7 + 0x58],	%f14
	set	0x38, %l5
	lduba	[%l7 + %l5] 0x18,	%o1
loop_2861:
	fbge,a	%fcc1,	loop_2862
	nop
	setx	loop_2863,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdgez	%l2,	%f14,	%f10
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x64] %asi,	%l0
loop_2862:
	nop
	setx	0xE389DDE4959F8AC9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xAC62E837ED472BD0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f10,	%f26
loop_2863:
	mulscc	%g2,	%g5,	%o0
	wr	%g0,	0x89,	%asi
	stba	%l6,	[%l7 + 0x2C] %asi
	taddcctv	%o6,	0x1E0B,	%g3
	mulx	%i3,	0x06FA,	%i6
	fzero	%f22
	subccc	%i0,	0x1E1A,	%g1
	st	%f12,	[%l7 + 0x20]
	fba,a	%fcc2,	loop_2864
	ldsb	[%l7 + 0x34],	%i4
	movrne	%l4,	%g6,	%l3
	movrgez	%l1,	%o4,	%i5
loop_2864:
	xnorcc	%l5,	%o2,	%o7
	or	%o5,	%g7,	%i1
	subc	%o3,	%g4,	%i2
	ba,pn	%icc,	loop_2865
	sdiv	%o1,	0x0409,	%i7
	movle	%xcc,	%l2,	%l0
	tleu	%xcc,	0x1
loop_2865:
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f22
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x51] %asi,	%g5
	fmul8x16	%f27,	%f14,	%f28
	orn	%g2,	0x1298,	%l6
	tcc	%xcc,	0x0
	tle	%icc,	0x1
	srl	%o6,	0x01,	%g3
	lduh	[%l7 + 0x62],	%o0
	tn	%xcc,	0x0
	fbue	%fcc1,	loop_2866
	sdivx	%i3,	0x067B,	%i6
	fmovsvs	%xcc,	%f22,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2866:
	fmul8x16	%f28,	%f8,	%f28
	edge16n	%i0,	%g1,	%i4
	andncc	%g6,	%l4,	%l1
	edge8ln	%l3,	%o4,	%l5
	fsrc2s	%f16,	%f20
	mova	%icc,	%i5,	%o7
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x62] %asi,	%o2
	fmovrdgez	%g7,	%f16,	%f4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x10] %asi,	%i1
	movrne	%o5,	0x201,	%o3
	udivcc	%g4,	0x1F30,	%o1
	tle	%icc,	0x1
	movre	%i7,	0x20F,	%i2
	addccc	%l0,	0x089A,	%l2
	andn	%g2,	%g5,	%o6
	umul	%l6,	%o0,	%i3
	fmovrdgez	%g3,	%f24,	%f0
	bleu,a	%xcc,	loop_2867
	xnor	%i6,	%i0,	%i4
	bne,a,pt	%xcc,	loop_2868
	sdiv	%g1,	0x189F,	%g6
loop_2867:
	andncc	%l1,	%l4,	%o4
	udivx	%l5,	0x15C6,	%l3
loop_2868:
	fones	%f9
	bne	%icc,	loop_2869
	fbl	%fcc2,	loop_2870
	fpadd32s	%f24,	%f27,	%f5
	set	0x3C, %g2
	swapa	[%l7 + %g2] 0x80,	%i5
loop_2869:
	popc	0x08F4,	%o7
loop_2870:
	bcs	loop_2871
	fmuld8sux16	%f21,	%f30,	%f4
	mulx	%g7,	0x028D,	%i1
	nop
	setx	0x406E8BEC,	%l0,	%l6
	st	%l6,	[%l7 + 0x34]
	ld	[%l7 + 0x34],	%fsr
loop_2871:
	lduh	[%l7 + 0x12],	%o2
	udiv	%o5,	0x108C,	%o3
	srl	%g4,	%i7,	%o1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%l0
	fmovdgu	%xcc,	%f28,	%f22
	movleu	%icc,	%g2,	%l2
	fpsub32	%f4,	%f24,	%f10
	mulx	%g5,	0x16F8,	%o6
	movrgez	%l6,	0x23E,	%o0
	tn	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i3,	0x15A7,	%i6
	st	%f14,	[%l7 + 0x44]
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f24
	sethi	0x18EC,	%g3
	fone	%f12
	sdivcc	%i4,	0x1756,	%i0
	sllx	%g6,	%l1,	%g1
	popc	0x0916,	%l4
	bn,pt	%xcc,	loop_2872
	nop
	setx	0xF7D7B7D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f5
	andncc	%o4,	%l3,	%i5
	edge8ln	%o7,	%g7,	%l5
loop_2872:
	fmovdge	%xcc,	%f19,	%f13
	stx	%o2,	[%l7 + 0x08]
	fsrc2s	%f24,	%f20
	edge8n	%i1,	%o5,	%g4
	fblg,a	%fcc1,	loop_2873
	edge8l	%i7,	%o3,	%o1
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x28] %asi,	%i2
loop_2873:
	udivx	%l0,	0x0DA9,	%g2
	alignaddr	%g5,	%o6,	%l6
	fsrc1s	%f12,	%f31
	fmovdgu	%icc,	%f26,	%f6
	prefetch	[%l7 + 0x7C],	 0x2
	sdivcc	%l2,	0x0C26,	%o0
	movrlez	%i6,	0x27C,	%i3
	tsubcc	%g3,	%i4,	%i0
	fors	%f15,	%f22,	%f7
	brz	%l1,	loop_2874
	edge32l	%g1,	%g6,	%l4
	edge32l	%o4,	%i5,	%l3
	set	0x46, %g6
	lduha	[%l7 + %g6] 0x14,	%g7
loop_2874:
	fcmple16	%f4,	%f26,	%o7
	swap	[%l7 + 0x70],	%l5
	nop
	setx	0xE62D1FE6729D012F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x9C6C243D341BAB6D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f18,	%f22
	udivx	%i1,	0x0ABF,	%o5
	brlz,a	%o2,	loop_2875
	movg	%icc,	%i7,	%g4
	fmul8x16al	%f17,	%f4,	%f4
	orcc	%o1,	%i2,	%o3
loop_2875:
	tleu	%xcc,	0x0
	movgu	%xcc,	%g2,	%g5
	movrgez	%o6,	0x247,	%l0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x18,	%l2,	%l6
	tn	%xcc,	0x6
	fabss	%f9,	%f23
	edge16	%o0,	%i3,	%g3
	array8	%i6,	%i0,	%i4
	tg	%icc,	0x0
	xnor	%g1,	0x01B6,	%g6
	fmul8sux16	%f28,	%f20,	%f10
	std	%f22,	[%l7 + 0x48]
	movle	%xcc,	%l4,	%l1
	fblg	%fcc1,	loop_2876
	movl	%icc,	%o4,	%l3
	and	%i5,	%g7,	%o7
	andncc	%i1,	%l5,	%o5
loop_2876:
	fbn,a	%fcc3,	loop_2877
	sdiv	%o2,	0x1878,	%g4
	lduh	[%l7 + 0x1A],	%i7
	tne	%xcc,	0x0
loop_2877:
	popc	0x0484,	%o1
	udivx	%o3,	0x0962,	%g2
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f20
	fxtod	%f20,	%f30
	fmovsn	%icc,	%f9,	%f5
	fsrc2	%f28,	%f2
	tge	%xcc,	0x4
	alignaddrl	%g5,	%o6,	%i2
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x68] %asi,	%l2
	movge	%icc,	%l0,	%l6
	movne	%xcc,	%o0,	%i3
	bleu,pt	%xcc,	loop_2878
	nop
	setx loop_2879, %l0, %l1
	jmpl %l1, %i6
	edge32ln	%i0,	%g3,	%i4
	edge16n	%g6,	%g1,	%l4
loop_2878:
	fnegs	%f17,	%f12
loop_2879:
	ldsh	[%l7 + 0x78],	%l1
	edge16l	%l3,	%i5,	%o4
	bge,a,pt	%xcc,	loop_2880
	bpos,pt	%icc,	loop_2881
	fmovd	%f24,	%f24
	movrgz	%g7,	0x1F6,	%i1
loop_2880:
	fbo	%fcc2,	loop_2882
loop_2881:
	srl	%l5,	0x08,	%o5
	movrlez	%o7,	%o2,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2882:
	fcmpgt16	%f18,	%f18,	%i7
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o1
	fmovrsne	%g2,	%f11,	%f2
	tneg	%xcc,	0x2
	nop
	fitod	%f6,	%f0
	fdtox	%f0,	%f10
	nop
	setx	0xB2DBD01AB05F42C5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	orncc	%o3,	0x13D3,	%g5
	nop
	fitos	%f15,	%f5
	addcc	%o6,	%i2,	%l0
	tn	%xcc,	0x4
	sllx	%l6,	%o0,	%i3
	ldstub	[%l7 + 0x08],	%i6
	set	0x08, %o3
	ldxa	[%l7 + %o3] 0x18,	%i0
	te	%icc,	0x6
	movleu	%icc,	%l2,	%g3
	nop
	setx	0xF0530A6D,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	movrlez	%i4,	%g1,	%l4
	fmovdle	%xcc,	%f12,	%f11
	lduh	[%l7 + 0x64],	%l1
	brgez	%g6,	loop_2883
	edge16l	%i5,	%o4,	%g7
	tcs	%icc,	0x4
	xnorcc	%i1,	%l5,	%l3
loop_2883:
	bne,pn	%icc,	loop_2884
	fbule,a	%fcc0,	loop_2885
	fbg	%fcc1,	loop_2886
	srl	%o7,	0x1B,	%o2
loop_2884:
	flush	%l7 + 0x54
loop_2885:
	andncc	%o5,	%i7,	%o1
loop_2886:
	tcc	%xcc,	0x6
	array16	%g2,	%g4,	%g5
	tleu	%xcc,	0x7
	movrgez	%o6,	0x003,	%i2
	subcc	%o3,	0x12C4,	%l6
	bcs,pn	%xcc,	loop_2887
	array32	%o0,	%l0,	%i6
	fmovsge	%xcc,	%f15,	%f31
	fmuld8sux16	%f0,	%f20,	%f20
loop_2887:
	xnorcc	%i0,	0x1955,	%i3
	be,a	%icc,	loop_2888
	stb	%g3,	[%l7 + 0x57]
	mova	%icc,	%i4,	%g1
	fbl,a	%fcc2,	loop_2889
loop_2888:
	nop
	fitod	%f4,	%f22
	fdtos	%f22,	%f3
	nop
	fitos	%f10,	%f8
	fstod	%f8,	%f28
	fcmple32	%f18,	%f30,	%l4
loop_2889:
	movleu	%icc,	%l2,	%l1
	st	%f14,	[%l7 + 0x44]
	ld	[%l7 + 0x48],	%f28
	srl	%i5,	0x13,	%o4
	umulcc	%g7,	0x0A76,	%g6
	movcc	%xcc,	%l5,	%i1
	nop
	setx	0x7D1C0387406A0463,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	edge32l	%l3,	%o2,	%o7
	edge8ln	%o5,	%o1,	%g2
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
	mulscc	%g5,	%o6,	%i2
	fpadd32s	%f25,	%f1,	%f17
	movvc	%xcc,	%g4,	%o3
	prefetch	[%l7 + 0x78],	 0x1
	subc	%l6,	0x1D90,	%l0
	fpack16	%f24,	%f25
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f16
	fxtod	%f16,	%f8
	ldsw	[%l7 + 0x70],	%o0
	fblg,a	%fcc1,	loop_2890
	tleu	%icc,	0x2
	set	0x0C, %o5
	stwa	%i0,	[%l7 + %o5] 0x80
loop_2890:
	fnor	%f22,	%f14,	%f0
	ta	%xcc,	0x2
	movrlz	%i6,	0x230,	%i3
	edge16	%i4,	%g1,	%l4
	array32	%l2,	%l1,	%i5
	umulcc	%o4,	%g7,	%g6
	orn	%l5,	%i1,	%l3
	tneg	%xcc,	0x3
	edge16n	%o2,	%o7,	%o5
	bn,a,pn	%icc,	loop_2891
	movpos	%icc,	%g3,	%g2
	tl	%icc,	0x6
	movpos	%icc,	%i7,	%o1
loop_2891:
	flush	%l7 + 0x3C
	nop
	setx	0xF832B577,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x289D6126,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f30,	%f0
	fmovscc	%icc,	%f5,	%f31
	movre	%o6,	%g5,	%g4
	st	%f8,	[%l7 + 0x2C]
	nop
	setx loop_2892, %l0, %l1
	jmpl %l1, %i2
	smulcc	%o3,	%l6,	%l0
	udiv	%o0,	0x025D,	%i6
	edge32n	%i0,	%i4,	%g1
loop_2892:
	edge8ln	%i3,	%l2,	%l1
	movrlz	%i5,	%l4,	%o4
	fbule	%fcc0,	loop_2893
	fandnot2s	%f19,	%f25,	%f3
	fmovdcc	%icc,	%f12,	%f21
	or	%g7,	0x1CCF,	%l5
loop_2893:
	edge32n	%i1,	%l3,	%g6
	movcs	%icc,	%o7,	%o5
	fones	%f8
	fbu,a	%fcc1,	loop_2894
	ldsw	[%l7 + 0x44],	%g3
	sdivx	%o2,	0x02F5,	%i7
	nop
	fitod	%f2,	%f16
	fdtos	%f16,	%f4
loop_2894:
	tsubcc	%g2,	%o6,	%g5
	movrlz	%g4,	%o1,	%o3
	sll	%l6,	%l0,	%o0
	tgu	%xcc,	0x5
	tsubcc	%i6,	0x0FCF,	%i2
	edge32n	%i4,	%i0,	%g1
	brnz,a	%i3,	loop_2895
	nop
	setx	0x7DF869D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x08B381C0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fdivs	%f18,	%f30,	%f31
	fpackfix	%f12,	%f28
	ldstub	[%l7 + 0x17],	%l2
loop_2895:
	edge16ln	%i5,	%l4,	%l1
	ldd	[%l7 + 0x68],	%f10
	udivx	%o4,	0x0294,	%g7
	fbuge	%fcc2,	loop_2896
	nop
	setx	0xF899790F628BB7FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xFCDAF4DCB1D97017,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f6,	%f10
	te	%xcc,	0x7
	taddcctv	%i1,	0x00B2,	%l5
loop_2896:
	fmovse	%icc,	%f6,	%f17
	tg	%icc,	0x1
	smulcc	%g6,	%o7,	%l3
	set	0x18, %l6
	ldsha	[%l7 + %l6] 0x81,	%o5
	ld	[%l7 + 0x58],	%f26
	xnor	%g3,	0x1FCC,	%o2
	edge16n	%i7,	%o6,	%g5
	move	%xcc,	%g2,	%g4
	addccc	%o1,	%l6,	%l0
	prefetch	[%l7 + 0x34],	 0x3
	movn	%icc,	%o3,	%o0
	te	%icc,	0x2
	fbne	%fcc3,	loop_2897
	fmovda	%icc,	%f2,	%f1
	fandnot1	%f24,	%f20,	%f12
	fands	%f20,	%f11,	%f30
loop_2897:
	alignaddr	%i2,	%i4,	%i0
	udivx	%g1,	0x0DD8,	%i6
	fmovsvs	%xcc,	%f3,	%f1
	umul	%i3,	%i5,	%l4
	movn	%icc,	%l2,	%l1
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x20] %asi,	%o4
	edge16ln	%i1,	%l5,	%g6
	movneg	%icc,	%o7,	%l3
	move	%icc,	%o5,	%g7
	or	%o2,	0x10BB,	%i7
	umul	%o6,	%g3,	%g2
	sir	0x1BA2
	fmovd	%f10,	%f4
	xnor	%g4,	0x1248,	%g5
	nop
	setx	0x02F63EFC7EEAD159,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xA83FC572E7E9A8E4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f30,	%f16
	fmul8x16	%f16,	%f6,	%f30
	add	%o1,	%l6,	%l0
	subc	%o0,	%o3,	%i2
	bl	%icc,	loop_2898
	tpos	%xcc,	0x1
	fbug,a	%fcc3,	loop_2899
	tsubcctv	%i0,	%i4,	%i6
loop_2898:
	array32	%g1,	%i5,	%i3
	sdiv	%l2,	0x1748,	%l4
loop_2899:
	st	%f23,	[%l7 + 0x14]
	edge16	%o4,	%i1,	%l5
	movn	%xcc,	%l1,	%g6
	orncc	%l3,	0x1084,	%o5
	alignaddr	%o7,	%o2,	%i7
	xor	%g7,	0x0277,	%g3
	addccc	%g2,	0x004B,	%o6
	fmovsa	%xcc,	%f11,	%f1
	fmovsneg	%icc,	%f6,	%f23
	fcmple16	%f20,	%f30,	%g5
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x18] %asi,	%g4
	udivx	%o1,	0x1B43,	%l0
	fands	%f12,	%f2,	%f30
	movvs	%xcc,	%l6,	%o0
	and	%o3,	%i2,	%i4
	nop
	fitos	%f4,	%f27
	fstod	%f27,	%f8
	array16	%i6,	%g1,	%i5
	set	0x48, %g7
	stwa	%i3,	[%l7 + %g7] 0x2b
	membar	#Sync
	fblg	%fcc3,	loop_2900
	movgu	%icc,	%i0,	%l2
	brz,a	%l4,	loop_2901
	fmovdl	%xcc,	%f27,	%f14
loop_2900:
	addc	%i1,	0x0219,	%l5
	tleu	%icc,	0x0
loop_2901:
	ba,pn	%xcc,	loop_2902
	nop
	setx	0xC919AF8F706BE1AE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fcmpgt16	%f12,	%f2,	%o4
	fpsub16	%f30,	%f2,	%f0
loop_2902:
	mulx	%g6,	%l3,	%l1
	tpos	%xcc,	0x7
	fcmpeq32	%f24,	%f28,	%o5
	bcc,a,pn	%xcc,	loop_2903
	fblg,a	%fcc1,	loop_2904
	smul	%o7,	%i7,	%g7
	fandnot2s	%f30,	%f3,	%f11
loop_2903:
	membar	0x59
loop_2904:
	taddcctv	%g3,	0x1B72,	%g2
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%o2
	tsubcctv	%o6,	0x1E40,	%g5
	fpack16	%f16,	%f28
	movrlez	%g4,	0x34C,	%l0
	nop
	setx	loop_2905,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fabsd	%f16,	%f20
	edge16n	%l6,	%o0,	%o3
	fbge	%fcc3,	loop_2906
loop_2905:
	edge16l	%o1,	%i4,	%i6
	set	0x1C, %g4
	lduha	[%l7 + %g4] 0x14,	%i2
loop_2906:
	mulx	%i5,	%g1,	%i3
	edge8ln	%i0,	%l4,	%l2
	addccc	%i1,	%o4,	%l5
	andcc	%l3,	%l1,	%o5
	movrgez	%o7,	0x377,	%i7
	flush	%l7 + 0x60
	te	%icc,	0x3
	fpadd16	%f20,	%f30,	%f0
	sll	%g6,	0x0D,	%g3
	bvc,a	%xcc,	loop_2907
	movneg	%xcc,	%g2,	%o2
	fmul8x16au	%f13,	%f2,	%f0
	fmovd	%f26,	%f22
loop_2907:
	fpack16	%f16,	%f22
	sub	%o6,	0x1B9C,	%g7
	movneg	%icc,	%g5,	%l0
	set	0x4A, %g3
	lduha	[%l7 + %g3] 0x14,	%g4
	subccc	%o0,	%o3,	%o1
	fcmpne32	%f26,	%f4,	%l6
	movcs	%icc,	%i4,	%i6
	tneg	%icc,	0x7
	brgez	%i5,	loop_2908
	fones	%f23
	movl	%xcc,	%g1,	%i3
	edge16n	%i0,	%i2,	%l2
loop_2908:
	bleu,a	loop_2909
	xnorcc	%i1,	0x074D,	%l4
	fbue,a	%fcc1,	loop_2910
	add	%o4,	%l3,	%l1
loop_2909:
	fcmpne16	%f4,	%f12,	%o5
	sra	%o7,	0x18,	%l5
loop_2910:
	fmuld8ulx16	%f7,	%f31,	%f4
	nop
	setx	0xD3FF42BEF05ED5BB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	ldsb	[%l7 + 0x74],	%g6
	movrlz	%g3,	%g2,	%i7
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o2
	fmovsl	%xcc,	%f4,	%f15
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x58] %asi,	%o6
	sra	%g7,	0x1C,	%l0
	alignaddrl	%g4,	%g5,	%o3
	movre	%o1,	%o0,	%l6
	fbge,a	%fcc2,	loop_2911
	fbe,a	%fcc0,	loop_2912
	sir	0x01C4
	tle	%icc,	0x1
loop_2911:
	subc	%i6,	0x0414,	%i5
loop_2912:
	movl	%xcc,	%g1,	%i3
	edge8ln	%i0,	%i4,	%l2
	tsubcctv	%i1,	0x0FCD,	%l4
	tcs	%xcc,	0x0
	mova	%icc,	%i2,	%l3
	fbe	%fcc2,	loop_2913
	fmovdneg	%icc,	%f15,	%f14
	nop
	setx	loop_2914,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%l1,	%o5,	%o7
loop_2913:
	sdivx	%o4,	0x0A5E,	%g6
	movvs	%icc,	%l5,	%g3
loop_2914:
	mova	%icc,	%g2,	%o2
	fba,a	%fcc0,	loop_2915
	udivx	%o6,	0x19C6,	%i7
	ldsh	[%l7 + 0x40],	%l0
	movvc	%icc,	%g4,	%g7
loop_2915:
	tne	%icc,	0x5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%o3,	%o1
	fmovsne	%xcc,	%f13,	%f5
	edge8ln	%g5,	%l6,	%i6
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f6
	fxtod	%f6,	%f18
	movge	%icc,	%i5,	%g1
	srax	%i3,	%o0,	%i0
	nop
	fitod	%f2,	%f26
	fdtox	%f26,	%f4
	nop
	setx	0x845DC67640AEBB07,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f16
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x50] %asi,	%i4
	xorcc	%i1,	%l2,	%i2
	brz,a	%l3,	loop_2916
	fmovsne	%xcc,	%f11,	%f23
	nop
	setx loop_2917, %l0, %l1
	jmpl %l1, %l1
	movleu	%xcc,	%o5,	%o7
loop_2916:
	udivx	%o4,	0x0F1E,	%g6
	ta	%icc,	0x6
loop_2917:
	brgez,a	%l4,	loop_2918
	fbu	%fcc3,	loop_2919
	fnot1	%f14,	%f14
	bpos,pn	%xcc,	loop_2920
loop_2918:
	smulcc	%l5,	%g3,	%g2
loop_2919:
	edge32ln	%o6,	%o2,	%i7
	fba	%fcc1,	loop_2921
loop_2920:
	fmuld8ulx16	%f17,	%f13,	%f20
	bn,a,pt	%xcc,	loop_2922
	add	%l0,	%g4,	%g7
loop_2921:
	addc	%o3,	%g5,	%o1
	fmovdne	%icc,	%f1,	%f24
loop_2922:
	or	%l6,	0x0979,	%i6
	fxor	%f12,	%f28,	%f10
	taddcc	%i5,	%i3,	%g1
	sllx	%i0,	0x18,	%i4
	fbl,a	%fcc2,	loop_2923
	fmuld8ulx16	%f12,	%f21,	%f4
	movgu	%icc,	%o0,	%i1
	mulscc	%l2,	0x1F8B,	%i2
loop_2923:
	nop
	set	0x68, %i7
	std	%f18,	[%l7 + %i7]
	mulscc	%l1,	%o5,	%o7
	fmovdcs	%xcc,	%f15,	%f9
	sll	%l3,	%g6,	%l4
	movrlz	%l5,	0x374,	%g3
	fmovdl	%icc,	%f18,	%f31
	array8	%o4,	%o6,	%g2
	bge	%icc,	loop_2924
	nop
	setx	0xB891C6E94CC9C7B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xE5E0EB12C4A12ABF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f18,	%f12
	xorcc	%o2,	%i7,	%g4
	orn	%g7,	0x025B,	%l0
loop_2924:
	ld	[%l7 + 0x2C],	%f31
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%xcc,	0x2
	subc	%o3,	0x163B,	%o1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l6,	%g5
	ldd	[%l7 + 0x50],	%f26
	array8	%i5,	%i6,	%i3
	tgu	%xcc,	0x6
	flush	%l7 + 0x10
	bge,pt	%xcc,	loop_2925
	prefetch	[%l7 + 0x44],	 0x0
	fbu,a	%fcc1,	loop_2926
	fones	%f24
loop_2925:
	ld	[%l7 + 0x0C],	%f18
	fmovsneg	%icc,	%f29,	%f18
loop_2926:
	tvs	%xcc,	0x1
	orn	%i0,	0x1F71,	%i4
	fnegs	%f3,	%f27
	fmovsge	%icc,	%f2,	%f0
	andcc	%o0,	0x035A,	%g1
	sllx	%i1,	0x0C,	%l2
	fcmpgt16	%f2,	%f4,	%l1
	fnot2	%f6,	%f6
	xnor	%i2,	0x18CC,	%o7
	bcc,pn	%icc,	loop_2927
	sra	%o5,	%g6,	%l4
	movg	%icc,	%l3,	%l5
	tcc	%icc,	0x7
loop_2927:
	stbar
	popc	0x09DD,	%g3
	edge8	%o6,	%g2,	%o4
	bl,a	%xcc,	loop_2928
	addc	%i7,	%o2,	%g7
	movrlz	%g4,	0x3E7,	%o3
	fcmpgt32	%f30,	%f12,	%o1
loop_2928:
	nop
	setx	0xDA5FB9F2116FF49A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x8B03CEEE6F0060BC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f10,	%f8
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2818
!	Type x   	: 1216
!	Type cti   	: 2928
!	Type f   	: 4504
!	Type i   	: 13534
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x456B19B0
.word 0xD1135968
.word 0xD48DAB8A
.word 0xA524BAAA
.word 0xA734FBE0
.word 0x6494DF0E
.word 0x42DCA6C1
.word 0x96D05937
.word 0x982361A6
.word 0xC100F2F8
.word 0x79C611DD
.word 0x601A762E
.word 0x52DD8387
.word 0xAF7A48DC
.word 0xF02D3F9E
.word 0xF0C28F2F
.word 0xB3A09674
.word 0x2F3445AB
.word 0x565F0CB2
.word 0xA2A3B0A0
.word 0x610126DD
.word 0xD40F53FE
.word 0xBF21AB0C
.word 0xCCB7E022
.word 0x42AFB928
.word 0x68DFCDAB
.word 0xD02CE731
.word 0x30A9EC7A
.word 0x6B1986E7
.word 0xBC706022
.word 0x88B99F64
.word 0xD0A5A8AA
.word 0xA3082C84
.word 0xA093BD94
.word 0xC55FAC3A
.word 0xA1CA20ED
.word 0x6A66379F
.word 0x4EA888E4
.word 0x6E37EA5F
.word 0x07325C72
.word 0x0C3E08FA
.word 0x7A3DF68C
.word 0x51A1721E
.word 0xF605E91D
.word 0x5F5D4934
.word 0xE36655AD
.word 0xD3032ED8
.word 0x4D6BA7C5
.word 0xBCC83999
.word 0xADDE4AB6
.word 0x64052BF3
.word 0x10E333CC
.word 0x5CE507C2
.word 0xC12524D8
.word 0xEFD41A8C
.word 0x610BAA39
.word 0xA67AA035
.word 0x101F81BE
.word 0x061D2EEC
.word 0xE3198D18
.word 0x831E8B67
.word 0x95770391
.word 0x5D60BC21
.word 0xA967D264
.end
