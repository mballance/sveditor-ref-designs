/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_basic3_f5.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_basic3_f5.s,v 1.1 2007/05/11 17:22:23 drp Exp $"
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
	setx	0x092AF55F804D0564,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x4,	%g1
	set	0x1,	%g2
	set	0x6,	%g3
	set	0xD,	%g4
	set	0x1,	%g5
	set	0xB,	%g6
	set	0x9,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0xF,	%i1
	set	-0x4,	%i2
	set	-0xC,	%i3
	set	-0x9,	%i4
	set	-0x5,	%i5
	set	-0x7,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x67D7BD9F,	%l0
	set	0x6273400B,	%l1
	set	0x082A223C,	%l2
	set	0x472CC0A3,	%l3
	set	0x3FAE03EA,	%l4
	set	0x71FAEC3D,	%l5
	set	0x4CB660FF,	%l6
	!# Output registers
	set	-0x0AFF,	%o0
	set	-0x03E7,	%o1
	set	0x1855,	%o2
	set	-0x1C75,	%o3
	set	-0x036B,	%o4
	set	-0x0C25,	%o5
	set	-0x13E5,	%o6
	set	0x1252,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x1E35DC2E57A4E2E5)
	INIT_TH_FP_REG(%l7,%f2,0xC35659B6FB591813)
	INIT_TH_FP_REG(%l7,%f4,0xCF6282397D729F4A)
	INIT_TH_FP_REG(%l7,%f6,0x28A305D2D10B2697)
	INIT_TH_FP_REG(%l7,%f8,0x7C361CB94C08E049)
	INIT_TH_FP_REG(%l7,%f10,0x26C6CACBB3C0C106)
	INIT_TH_FP_REG(%l7,%f12,0x9B5327C06080389D)
	INIT_TH_FP_REG(%l7,%f14,0x8C42D7D58479E1BA)
	INIT_TH_FP_REG(%l7,%f16,0x90D155E158DDA0F6)
	INIT_TH_FP_REG(%l7,%f18,0x702765B73AC28EC4)
	INIT_TH_FP_REG(%l7,%f20,0x88C5D3853CD4EFD9)
	INIT_TH_FP_REG(%l7,%f22,0x9853315709928CD9)
	INIT_TH_FP_REG(%l7,%f24,0xEE2456D095FF9F1A)
	INIT_TH_FP_REG(%l7,%f26,0x12121BA4DA2D6175)
	INIT_TH_FP_REG(%l7,%f28,0xC23BBF79C9468801)
	INIT_TH_FP_REG(%l7,%f30,0x1063C7DE88D82965)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	movg	%icc,	%i0,	%i1
	addccc	%o5,	0x0F99,	%g6
	add	%i4,	0x0B89,	%g7
	fmovse	%icc,	%f30,	%f23
	srax	%g3,	0x07,	%l2
	bleu,a	loop_1
	tpos	%xcc,	0x7
	membar	0x32
	fnot2s	%f3,	%f0
loop_1:
	smul	%i7,	0x18DC,	%o7
	edge16ln	%o6,	%g4,	%l4
	fmovsl	%icc,	%f20,	%f2
	movle	%xcc,	%o1,	%i5
	tl	%icc,	0x4
	edge8ln	%g1,	%i6,	%l6
	fmovde	%xcc,	%f4,	%f0
	prefetch	[%l7 + 0x48],	 0x3
	and	%l5,	0x0766,	%o0
	andcc	%o2,	%g5,	%g2
	stw	%l0,	[%l7 + 0x7C]
	fpsub32	%f8,	%f4,	%f30
	addccc	%l1,	%o4,	%o3
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x32] %asi,	%i3
	fandnot1	%f0,	%f30,	%f4
	sub	%l3,	0x0CD7,	%i2
	fmovdcs	%icc,	%f30,	%f26
	sdivcc	%i1,	0x17C7,	%o5
	fmovrdgz	%g6,	%f4,	%f28
	ldsb	[%l7 + 0x70],	%i4
	array32	%i0,	%g7,	%l2
	edge16l	%g3,	%i7,	%o6
	stw	%g4,	[%l7 + 0x64]
	fcmpne32	%f2,	%f30,	%o7
	tcs	%xcc,	0x7
	sllx	%o1,	0x1C,	%i5
	addc	%l4,	0x1651,	%i6
	ld	[%l7 + 0x10],	%f6
	xnorcc	%g1,	0x1415,	%l5
	movvc	%icc,	%o0,	%l6
	sllx	%g5,	0x07,	%o2
	movg	%icc,	%g2,	%l0
	wr	%g0,	0x18,	%asi
	stwa	%l1,	[%l7 + 0x1C] %asi
	fba	%fcc1,	loop_2
	fcmpgt32	%f20,	%f8,	%o3
	tg	%xcc,	0x7
	ldd	[%l7 + 0x70],	%f24
loop_2:
	tge	%icc,	0x4
	fcmpne32	%f22,	%f18,	%o4
	movrgz	%l3,	%i2,	%i1
	lduh	[%l7 + 0x6A],	%i3
	tneg	%xcc,	0x3
	xnor	%o5,	0x05DF,	%g6
	fmovspos	%icc,	%f18,	%f24
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x08] %asi,	%i0
	tne	%xcc,	0x4
	sir	0x0AE8
	set	0x14, %o7
	stwa	%g7,	[%l7 + %o7] 0x23
	membar	#Sync
	sir	0x0BD1
	tg	%icc,	0x6
	udiv	%l2,	0x0447,	%g3
	subc	%i7,	0x1020,	%o6
	popc	%i4,	%g4
	tcs	%icc,	0x7
	brlz	%o7,	loop_3
	bn,pt	%icc,	loop_4
	movpos	%xcc,	%i5,	%l4
	set	0x34, %l4
	swapa	[%l7 + %l4] 0x04,	%o1
loop_3:
	smul	%g1,	0x1A26,	%i6
loop_4:
	subccc	%o0,	%l5,	%g5
	movpos	%xcc,	%l6,	%o2
	tcs	%icc,	0x6
	movg	%icc,	%g2,	%l1
	bl,pn	%xcc,	loop_5
	xnor	%l0,	%o3,	%o4
	array16	%i2,	%i1,	%l3
	xnorcc	%i3,	%o5,	%i0
loop_5:
	taddcc	%g6,	%g7,	%g3
	smul	%i7,	%o6,	%i4
	bne,a	%xcc,	loop_6
	stbar
	tpos	%icc,	0x4
	edge32ln	%g4,	%l2,	%i5
loop_6:
	movvc	%icc,	%l4,	%o7
	udivcc	%g1,	0x0210,	%i6
	tg	%icc,	0x3
	edge8ln	%o0,	%o1,	%g5
	movn	%xcc,	%l6,	%o2
	edge8ln	%g2,	%l1,	%l0
	movleu	%xcc,	%l5,	%o3
	edge16l	%i2,	%o4,	%i1
	fsrc1	%f26,	%f6
	tgu	%xcc,	0x2
	orcc	%i3,	0x1B83,	%l3
	movvc	%icc,	%o5,	%g6
	xor	%g7,	0x1BEB,	%g3
	fbn	%fcc1,	loop_7
	fpadd16s	%f19,	%f26,	%f30
	movre	%i7,	%i0,	%i4
	fcmple16	%f18,	%f10,	%o6
loop_7:
	fmovsg	%icc,	%f31,	%f18
	fmovsne	%icc,	%f7,	%f4
	movle	%icc,	%g4,	%l2
	orn	%l4,	%o7,	%i5
	mova	%icc,	%g1,	%o0
	std	%f22,	[%l7 + 0x70]
	mova	%xcc,	%o1,	%i6
	lduw	[%l7 + 0x7C],	%l6
	fmovscc	%xcc,	%f26,	%f23
	fsrc2s	%f8,	%f15
	tsubcc	%o2,	0x0592,	%g5
	wr	%g0,	0x27,	%asi
	stha	%g2,	[%l7 + 0x30] %asi
	membar	#Sync
	movl	%xcc,	%l0,	%l5
	movcc	%icc,	%o3,	%i2
	tne	%icc,	0x6
	fxnor	%f24,	%f28,	%f4
	wr	%g0,	0x2f,	%asi
	stxa	%o4,	[%l7 + 0x60] %asi
	membar	#Sync
	movrlez	%i1,	%l1,	%l3
	membar	0x14
	flush	%l7 + 0x6C
	tneg	%xcc,	0x6
	udiv	%o5,	0x0FF6,	%i3
	set	0x70, %i6
	stda	%g6,	[%l7 + %i6] 0x2f
	membar	#Sync
	movvc	%icc,	%g7,	%i7
	movrlz	%g3,	%i0,	%o6
	ble,pn	%icc,	loop_8
	srax	%i4,	0x19,	%l2
	sdiv	%l4,	0x1817,	%g4
	tneg	%xcc,	0x1
loop_8:
	movrgz	%o7,	%g1,	%i5
	subccc	%o1,	%i6,	%l6
	fmovscs	%xcc,	%f4,	%f11
	edge8n	%o2,	%o0,	%g5
	subcc	%l0,	0x0CE0,	%g2
	movne	%xcc,	%l5,	%o3
	fbuge,a	%fcc2,	loop_9
	tg	%icc,	0x6
	popc	%o4,	%i1
	fbo,a	%fcc2,	loop_10
loop_9:
	tge	%icc,	0x6
	fmovsleu	%xcc,	%f13,	%f31
	fsrc1	%f2,	%f14
loop_10:
	movneg	%xcc,	%l1,	%l3
	movre	%o5,	0x06B,	%i2
	be	loop_11
	fbe,a	%fcc2,	loop_12
	fmul8x16au	%f2,	%f4,	%f2
	fmovsa	%icc,	%f8,	%f23
loop_11:
	fones	%f16
loop_12:
	alignaddrl	%i3,	%g6,	%g7
	bgu,a	loop_13
	move	%xcc,	%g3,	%i0
	fmovdn	%icc,	%f19,	%f11
	edge32	%o6,	%i7,	%i4
loop_13:
	tl	%xcc,	0x2
	movg	%icc,	%l4,	%g4
	popc	0x05A4,	%l2
	swap	[%l7 + 0x44],	%g1
	fandnot1s	%f11,	%f15,	%f13
	movrgez	%o7,	0x3C7,	%o1
	movl	%xcc,	%i5,	%i6
	movrlez	%o2,	0x036,	%o0
	array8	%g5,	%l6,	%g2
	movle	%icc,	%l5,	%l0
	set	0x6C, %l5
	stwa	%o3,	[%l7 + %l5] 0x81
	movg	%xcc,	%i1,	%o4
	addc	%l1,	%o5,	%i2
	alignaddrl	%l3,	%i3,	%g6
	taddcc	%g3,	0x1E71,	%g7
	sllx	%i0,	0x07,	%o6
	wr	%g0,	0x19,	%asi
	stda	%i6,	[%l7 + 0x40] %asi
	tge	%xcc,	0x4
	fbul,a	%fcc3,	loop_14
	sdiv	%i4,	0x0627,	%g4
	fpsub32s	%f30,	%f2,	%f17
	bne,a	%icc,	loop_15
loop_14:
	fmovdcc	%icc,	%f18,	%f28
	sllx	%l2,	0x1D,	%g1
	movre	%o7,	%l4,	%i5
loop_15:
	movpos	%icc,	%o1,	%o2
	srax	%o0,	0x11,	%i6
	fmovdle	%xcc,	%f19,	%f15
	edge16ln	%l6,	%g5,	%g2
	fones	%f3
	sdivx	%l0,	0x10A4,	%l5
	udivcc	%o3,	0x001F,	%o4
	alignaddr	%l1,	%i1,	%i2
	fmovrsgz	%o5,	%f28,	%f11
	array8	%i3,	%l3,	%g3
	movpos	%xcc,	%g7,	%g6
	movre	%o6,	0x055,	%i7
	tpos	%icc,	0x7
	ble,a	%icc,	loop_16
	add	%i0,	%g4,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x58
loop_16:
	udivx	%l2,	0x1E6F,	%g1
	and	%o7,	%l4,	%o1
	sir	0x14A6
	movre	%i5,	0x244,	%o2
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x13] %asi,	%o0
	mova	%icc,	%i6,	%g5
	edge8ln	%g2,	%l0,	%l5
	sdivx	%l6,	0x00A1,	%o3
	brlez	%l1,	loop_17
	fmovda	%xcc,	%f29,	%f12
	fnand	%f0,	%f30,	%f20
	nop
	setx loop_18, %l0, %l1
	jmpl %l1, %o4
loop_17:
	addccc	%i2,	%i1,	%i3
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
	srl	%o5,	%g3,	%l3
loop_18:
	ldd	[%l7 + 0x78],	%g6
	andcc	%o6,	%g6,	%i0
loop_19:
	fbue	%fcc3,	loop_20
	flush	%l7 + 0x24
	sdiv	%g4,	0x0B9A,	%i7
	fabss	%f28,	%f17
loop_20:
	ba,pt	%icc,	loop_21
	movle	%icc,	%i4,	%l2
	fornot2s	%f19,	%f11,	%f10
	move	%xcc,	%o7,	%g1
loop_21:
	popc	0x171D,	%o1
	movneg	%icc,	%i5,	%o2
	edge8n	%l4,	%i6,	%o0
	mulx	%g5,	%l0,	%g2
	sth	%l5,	[%l7 + 0x76]
	fmovs	%f2,	%f0
	stb	%l6,	[%l7 + 0x77]
	movge	%xcc,	%l1,	%o4
	edge16	%o3,	%i2,	%i1
	fbg,a	%fcc2,	loop_22
	alignaddr	%i3,	%g3,	%o5
	fble	%fcc3,	loop_23
	udiv	%l3,	0x12D6,	%o6
loop_22:
	nop
	wr	%g0,	0xeb,	%asi
	stda	%g6,	[%l7 + 0x08] %asi
	membar	#Sync
loop_23:
	nop
	set	0x13, %g2
	ldstuba	[%l7 + %g2] 0x0c,	%i0
	tcs	%icc,	0x2
	fsrc2s	%f31,	%f10
	fnot1s	%f27,	%f15
	faligndata	%f0,	%f24,	%f12
	tge	%xcc,	0x6
	subccc	%g7,	0x16BE,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f14,	%f14,	%f26
	fmovdcs	%xcc,	%f30,	%f0
	edge32n	%i4,	%g4,	%o7
	andncc	%g1,	%o1,	%i5
	orcc	%o2,	%l4,	%i6
	fblg	%fcc3,	loop_24
	sdiv	%o0,	0x0E36,	%l2
	subc	%g5,	0x1BF3,	%g2
	tvc	%icc,	0x5
loop_24:
	array8	%l5,	%l0,	%l6
	sllx	%o4,	0x1A,	%o3
	bn	loop_25
	movcs	%icc,	%l1,	%i1
	move	%xcc,	%i3,	%i2
	and	%o5,	%l3,	%g3
loop_25:
	xnorcc	%g6,	%i0,	%g7
	prefetch	[%l7 + 0x28],	 0x0
	bgu	%xcc,	loop_26
	fand	%f16,	%f22,	%f14
	tvc	%icc,	0x4
	movrlz	%i7,	0x04C,	%o6
loop_26:
	array16	%g4,	%i4,	%g1
	brgez	%o7,	loop_27
	tle	%icc,	0x1
	array16	%o1,	%i5,	%l4
	edge32	%o2,	%o0,	%l2
loop_27:
	stbar
	nop
	setx loop_28, %l0, %l1
	jmpl %l1, %g5
	tsubcctv	%i6,	0x1C28,	%l5
	movpos	%icc,	%g2,	%l0
	tsubcc	%o4,	0x0D7E,	%o3
loop_28:
	orncc	%l1,	%i1,	%l6
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x0
	bgu	loop_29
	edge8	%i2,	%l3,	%g3
	edge32	%g6,	%o5,	%g7
	stx	%i0,	[%l7 + 0x48]
loop_29:
	edge8n	%i7,	%g4,	%o6
	set	0x50, %g1
	lda	[%l7 + %g1] 0x10,	%f19
	fcmpne32	%f2,	%f2,	%g1
	movl	%xcc,	%i4,	%o7
	sethi	0x145B,	%i5
	fmovsne	%xcc,	%f11,	%f20
	fnands	%f21,	%f23,	%f7
	movcc	%icc,	%l4,	%o1
	ldd	[%l7 + 0x08],	%f26
	brgz,a	%o0,	loop_30
	andcc	%o2,	0x0142,	%g5
	edge32ln	%i6,	%l2,	%g2
	xnorcc	%l0,	0x159C,	%l5
loop_30:
	fmovdneg	%icc,	%f14,	%f15
	umulcc	%o4,	%l1,	%o3
	ldub	[%l7 + 0x48],	%l6
	subcc	%i1,	%i3,	%l3
	edge8n	%g3,	%i2,	%o5
	tneg	%icc,	0x0
	bneg	%icc,	loop_31
	te	%icc,	0x5
	mulx	%g6,	0x1447,	%i0
	movre	%i7,	0x2A7,	%g7
loop_31:
	andncc	%g4,	%o6,	%g1
	bleu,a	%icc,	loop_32
	fmovsleu	%icc,	%f2,	%f30
	fmovdpos	%icc,	%f1,	%f21
	set	0x10, %i4
	ldda	[%l7 + %i4] 0xe2,	%i4
loop_32:
	move	%xcc,	%o7,	%l4
	fands	%f20,	%f23,	%f6
	sir	0x0C0C
	array32	%i5,	%o1,	%o2
	subccc	%g5,	%o0,	%i6
	sdivx	%g2,	0x08CD,	%l2
	tvs	%xcc,	0x7
	tvs	%xcc,	0x3
	fmovsneg	%icc,	%f2,	%f9
	fbue	%fcc2,	loop_33
	tg	%xcc,	0x2
	edge32ln	%l5,	%o4,	%l1
	orn	%l0,	0x1002,	%o3
loop_33:
	fba,a	%fcc0,	loop_34
	fbo,a	%fcc3,	loop_35
	srax	%l6,	%i1,	%l3
	udiv	%g3,	0x004D,	%i2
loop_34:
	sdiv	%i3,	0x0A22,	%o5
loop_35:
	fnor	%f18,	%f24,	%f6
	fbg,a	%fcc2,	loop_36
	fnand	%f16,	%f16,	%f24
	fbge	%fcc1,	loop_37
	sir	0x191D
loop_36:
	nop
	set	0x48, %g7
	std	%g6,	[%l7 + %g7]
	membar	0x6F
loop_37:
	sll	%i7,	0x1B,	%i0
	alignaddr	%g4,	%g7,	%o6
	fmovrsgez	%g1,	%f25,	%f27
	alignaddr	%o7,	%l4,	%i5
	lduw	[%l7 + 0x44],	%o1
	sethi	0x059E,	%i4
	bpos,a,pn	%icc,	loop_38
	stbar
	nop
	setx	loop_39,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc2	%f18,	%f6
loop_38:
	fsrc1	%f0,	%f6
	set	0x70, %o0
	stxa	%g5,	[%l7 + %o0] 0x0c
loop_39:
	fcmple16	%f28,	%f18,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%o2,	%f28,	%f0
	fbne,a	%fcc2,	loop_40
	stw	%g2,	[%l7 + 0x38]
	smul	%i6,	%l5,	%l2
	sll	%l1,	0x17,	%o4
loop_40:
	srax	%o3,	%l0,	%l6
	movl	%icc,	%l3,	%g3
	movle	%xcc,	%i1,	%i3
	subccc	%i2,	0x012A,	%g6
	set	0x118, %i2
	stxa	%o5,	[%g0 + %i2] 0x52
	edge32	%i7,	%i0,	%g4
	tgu	%xcc,	0x6
	movvs	%xcc,	%o6,	%g1
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%g7
	movg	%icc,	%o7,	%l4
	brgz,a	%o1,	loop_41
	brnz,a	%i4,	loop_42
	smulcc	%g5,	0x0F2D,	%i5
	movvc	%icc,	%o0,	%g2
loop_41:
	fbo,a	%fcc0,	loop_43
loop_42:
	xnorcc	%o2,	%i6,	%l5
	stx	%l2,	[%l7 + 0x20]
	array8	%o4,	%o3,	%l0
loop_43:
	udiv	%l6,	0x1FC4,	%l3
	fands	%f26,	%f8,	%f12
	alignaddr	%g3,	%i1,	%l1
	orncc	%i2,	0x056A,	%i3
	movgu	%icc,	%o5,	%i7
	fxnor	%f2,	%f14,	%f4
	fbuge	%fcc1,	loop_44
	stw	%i0,	[%l7 + 0x10]
	fexpand	%f25,	%f20
	taddcc	%g4,	%g6,	%g1
loop_44:
	movrlez	%o6,	%g7,	%l4
	wr	%g0,	0x88,	%asi
	stwa	%o1,	[%l7 + 0x1C] %asi
	fzero	%f30
	fcmple16	%f28,	%f24,	%i4
	wr	%g0,	0x19,	%asi
	stda	%o6,	[%l7 + 0x30] %asi
	srlx	%i5,	0x05,	%g5
	tg	%xcc,	0x4
	movl	%icc,	%o0,	%g2
	addcc	%i6,	0x18D8,	%o2
	bvs,a,pt	%icc,	loop_45
	sllx	%l5,	0x12,	%o4
	tg	%icc,	0x1
	addcc	%o3,	%l0,	%l2
loop_45:
	stb	%l6,	[%l7 + 0x20]
	movvs	%icc,	%l3,	%g3
	fcmpeq32	%f24,	%f4,	%i1
	tg	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	sta	%f17,	[%l7 + 0x64] %asi
	sub	%i2,	%l1,	%o5
	brlez	%i3,	loop_46
	movneg	%xcc,	%i0,	%i7
	ldsh	[%l7 + 0x36],	%g4
	bleu,a	loop_47
loop_46:
	std	%f18,	[%l7 + 0x18]
	tg	%icc,	0x1
	set	0x78, %o4
	ldxa	[%l7 + %o4] 0x89,	%g6
loop_47:
	alignaddr	%o6,	%g1,	%g7
	array8	%o1,	%i4,	%l4
	fmovsvc	%xcc,	%f23,	%f16
	movneg	%icc,	%i5,	%g5
	edge16l	%o0,	%o7,	%i6
	edge32l	%o2,	%g2,	%l5
	fxnor	%f16,	%f30,	%f14
	fornot1	%f2,	%f4,	%f14
	std	%o4,	[%l7 + 0x30]
	orcc	%l0,	%o3,	%l2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%l3
	movleu	%icc,	%g3,	%l6
	taddcc	%i2,	0x1A79,	%l1
	ta	%xcc,	0x0
	nop
	set	0x40, %i3
	stx	%i1,	[%l7 + %i3]
	bn,a,pn	%icc,	loop_48
	bge,a,pt	%xcc,	loop_49
	fmovsneg	%xcc,	%f0,	%f25
	movvs	%xcc,	%i3,	%o5
loop_48:
	nop
	setx	loop_50,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_49:
	tvc	%xcc,	0x5
	alignaddr	%i7,	%i0,	%g4
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x62] %asi,	%g6
loop_50:
	fmovdcc	%icc,	%f23,	%f13
	taddcc	%g1,	0x00A7,	%g7
	popc	0x1527,	%o6
	fmovrsgz	%i4,	%f28,	%f4
	udivcc	%l4,	0x0CA8,	%i5
	fpadd16s	%f13,	%f13,	%f4
	subcc	%o1,	0x1A4F,	%o0
	fpadd16	%f30,	%f2,	%f20
	sethi	0x1B44,	%o7
	set	0x40, %i1
	ldsba	[%l7 + %i1] 0x88,	%i6
	movleu	%icc,	%g5,	%o2
	sdiv	%g2,	0x0F38,	%l5
	fone	%f14
	fornot2	%f14,	%f12,	%f28
	movl	%xcc,	%l0,	%o3
	move	%icc,	%o4,	%l3
	fornot1s	%f17,	%f25,	%f24
	subccc	%g3,	%l6,	%i2
	and	%l2,	0x1BD5,	%i1
	tleu	%icc,	0x1
	movvs	%xcc,	%i3,	%l1
	fbe	%fcc0,	loop_51
	udivx	%o5,	0x169C,	%i0
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x74] %asi,	%g4
loop_51:
	fmovrsgz	%g6,	%f6,	%f30
	sdivcc	%g1,	0x18E1,	%i7
	fbu	%fcc1,	loop_52
	udivcc	%g7,	0x19E7,	%i4
	fmovdneg	%xcc,	%f9,	%f20
	edge8	%l4,	%i5,	%o6
loop_52:
	andncc	%o1,	%o0,	%i6
	ldsb	[%l7 + 0x74],	%g5
	fpadd16	%f20,	%f10,	%f24
	fbule,a	%fcc1,	loop_53
	sdivx	%o2,	0x11FB,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l5,	0x0EB,	%l0
loop_53:
	xorcc	%o3,	%o7,	%o4
	ldx	[%l7 + 0x68],	%l3
	smulcc	%l6,	%i2,	%g3
	movre	%l2,	0x1BA,	%i1
	fexpand	%f30,	%f14
	fsrc2s	%f26,	%f17
	tge	%xcc,	0x5
	set	0x5A, %g5
	ldstuba	[%l7 + %g5] 0x18,	%l1
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x11,	%f16
	fbue,a	%fcc2,	loop_54
	xnorcc	%o5,	%i3,	%i0
	fsrc1s	%f24,	%f10
	edge32ln	%g6,	%g1,	%i7
loop_54:
	ldsh	[%l7 + 0x50],	%g4
	fmovdcc	%xcc,	%f28,	%f9
	movrlz	%i4,	0x2DD,	%g7
	tcs	%icc,	0x6
	fmovsa	%icc,	%f29,	%f4
	fmovdgu	%icc,	%f24,	%f11
	movle	%icc,	%i5,	%o6
	ldub	[%l7 + 0x09],	%o1
	tsubcc	%l4,	0x068E,	%o0
	set	0x38, %i5
	stxa	%i6,	[%l7 + %i5] 0x19
	udiv	%o2,	0x0A92,	%g5
	sra	%g2,	0x07,	%l5
	tsubcc	%l0,	%o3,	%o7
	bneg,a,pt	%xcc,	loop_55
	bcc	%icc,	loop_56
	fsrc2	%f10,	%f22
	fones	%f24
loop_55:
	brlz	%l3,	loop_57
loop_56:
	edge32	%o4,	%i2,	%l6
	sdivcc	%l2,	0x1D7F,	%g3
	te	%icc,	0x3
loop_57:
	udiv	%i1,	0x1B64,	%o5
	fmovdg	%icc,	%f17,	%f5
	movvc	%xcc,	%i3,	%i0
	mova	%icc,	%l1,	%g6
	fones	%f2
	stbar
	brnz,a	%g1,	loop_58
	xorcc	%i7,	0x0582,	%g4
	siam	0x7
	fbule	%fcc1,	loop_59
loop_58:
	movre	%i4,	0x06E,	%i5
	fcmpd	%fcc0,	%f24,	%f12
	ldd	[%l7 + 0x30],	%f8
loop_59:
	tgu	%xcc,	0x1
	sdivcc	%o6,	0x02EB,	%o1
	movcs	%icc,	%g7,	%l4
	sth	%o0,	[%l7 + 0x3C]
	smulcc	%i6,	0x08F3,	%g5
	movcc	%xcc,	%o2,	%l5
	nop
	setx loop_60, %l0, %l1
	jmpl %l1, %l0
	lduw	[%l7 + 0x40],	%o3
	lduw	[%l7 + 0x48],	%o7
	array8	%l3,	%g2,	%i2
loop_60:
	srlx	%l6,	0x1B,	%o4
	fpmerge	%f7,	%f23,	%f28
	nop
	setx	loop_61,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%g3,	0x1790,	%i1
	array16	%l2,	%o5,	%i0
	taddcctv	%i3,	0x02E0,	%l1
loop_61:
	edge16n	%g1,	%i7,	%g4
	udivcc	%i4,	0x1455,	%i5
	tg	%xcc,	0x7
	wr	%g0,	0x18,	%asi
	stda	%o6,	[%l7 + 0x58] %asi
	movleu	%icc,	%o1,	%g7
	wr	%g0,	0x88,	%asi
	sta	%f14,	[%l7 + 0x7C] %asi
	alignaddr	%l4,	%o0,	%g6
	addccc	%i6,	0x121B,	%g5
	movvc	%icc,	%l5,	%l0
	tvs	%xcc,	0x5
	movge	%xcc,	%o2,	%o7
	fmovsneg	%icc,	%f22,	%f14
	sir	0x1750
	fbuge,a	%fcc3,	loop_62
	brlz,a	%o3,	loop_63
	orn	%g2,	0x12EE,	%l3
	sdiv	%i2,	0x144F,	%l6
loop_62:
	sllx	%g3,	%o4,	%i1
loop_63:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x7A] %asi,	%i0
	movre	%o5,	%i3,	%g1
	subccc	%i7,	0x0D15,	%g4
	movn	%xcc,	%l1,	%i4
	udiv	%i5,	0x15EC,	%o1
	edge32ln	%g7,	%l4,	%o6
	edge32l	%o0,	%g6,	%i6
	movgu	%icc,	%l5,	%g5
	sllx	%o2,	%l0,	%o7
	ld	[%l7 + 0x18],	%f21
	alignaddrl	%g2,	%o3,	%l3
	fpadd16s	%f15,	%f16,	%f9
	subc	%l6,	0x14AC,	%g3
	array16	%i2,	%o4,	%l2
	fbg	%fcc2,	loop_64
	fbul	%fcc1,	loop_65
	and	%i0,	0x1E9A,	%i1
	umulcc	%o5,	%g1,	%i3
loop_64:
	add	%g4,	%l1,	%i7
loop_65:
	fmul8x16	%f30,	%f0,	%f30
	fcmpeq32	%f24,	%f14,	%i5
	movl	%icc,	%o1,	%i4
	sth	%g7,	[%l7 + 0x08]
	tl	%xcc,	0x4
	move	%icc,	%l4,	%o0
	movg	%xcc,	%o6,	%g6
	tleu	%icc,	0x2
	brlez	%l5,	loop_66
	fzero	%f24
	te	%icc,	0x6
	fmovsgu	%xcc,	%f3,	%f6
loop_66:
	movne	%icc,	%g5,	%o2
	smulcc	%i6,	0x0C37,	%l0
	movge	%icc,	%g2,	%o7
	wr	%g0,	0x2b,	%asi
	stwa	%l3,	[%l7 + 0x64] %asi
	membar	#Sync
	brgz,a	%o3,	loop_67
	ldub	[%l7 + 0x30],	%g3
	sdivcc	%l6,	0x087E,	%i2
	alignaddr	%l2,	%o4,	%i1
loop_67:
	tneg	%xcc,	0x0
	bpos,a,pt	%icc,	loop_68
	tn	%xcc,	0x1
	taddcc	%i0,	0x1398,	%o5
	xor	%i3,	%g1,	%l1
loop_68:
	movcc	%icc,	%g4,	%i7
	fnot2	%f0,	%f8
	tcc	%xcc,	0x5
	fmovsgu	%xcc,	%f18,	%f0
	bcc	loop_69
	fnand	%f26,	%f24,	%f28
	tvc	%xcc,	0x5
	tl	%xcc,	0x3
loop_69:
	fcmpgt32	%f12,	%f2,	%i5
	subcc	%o1,	0x1FC0,	%g7
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x08] %asi,	%f10
	stb	%i4,	[%l7 + 0x5D]
	tl	%icc,	0x5
	nop
	set	0x20, %l2
	std	%o0,	[%l7 + %l2]
	fmul8sux16	%f22,	%f4,	%f20
	ldd	[%l7 + 0x50],	%l4
	ldstub	[%l7 + 0x7A],	%g6
	movcc	%icc,	%o6,	%l5
	fmovdne	%xcc,	%f14,	%f25
	membar	0x37
	stw	%o2,	[%l7 + 0x60]
	fbg,a	%fcc0,	loop_70
	nop
	setx loop_71, %l0, %l1
	jmpl %l1, %i6
	fmovsvc	%icc,	%f15,	%f5
	movgu	%icc,	%g5,	%l0
loop_70:
	bl	loop_72
loop_71:
	xnor	%g2,	0x1C9A,	%o7
	sllx	%o3,	%l3,	%l6
	orn	%g3,	0x015C,	%i2
loop_72:
	tcs	%icc,	0x0
	fabss	%f4,	%f23
	movcs	%xcc,	%l2,	%i1
	movg	%xcc,	%o4,	%i0
	fcmpne16	%f20,	%f22,	%o5
	orcc	%g1,	%i3,	%l1
	sdivcc	%i7,	0x1FB9,	%g4
	fandnot1s	%f30,	%f17,	%f6
	sra	%i5,	0x01,	%o1
	set	0x2D, %l3
	lduba	[%l7 + %l3] 0x19,	%g7
	movge	%xcc,	%o0,	%l4
	add	%i4,	%g6,	%o6
	movrlez	%o2,	0x34F,	%i6
	and	%g5,	0x1B7D,	%l5
	tcs	%xcc,	0x0
	bvs,a	%icc,	loop_73
	movrgez	%g2,	%o7,	%l0
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_73:
	tle	%xcc,	0x6
	fandnot1s	%f30,	%f3,	%f24
	movrgz	%o3,	%l3,	%g3
	fcmped	%fcc0,	%f0,	%f20
	fmovrslez	%i2,	%f25,	%f1
	fpadd16	%f12,	%f24,	%f30
	sra	%l6,	%l2,	%o4
	fmovrdlez	%i0,	%f8,	%f8
	andncc	%i1,	%o5,	%g1
	sllx	%l1,	%i7,	%i3
	movgu	%icc,	%g4,	%i5
	movrlz	%o1,	0x1CD,	%o0
	fnot1	%f12,	%f20
	movge	%icc,	%g7,	%l4
	fbne	%fcc1,	loop_74
	fbo	%fcc2,	loop_75
	mulx	%i4,	0x084F,	%o6
	edge16n	%g6,	%i6,	%o2
loop_74:
	fxor	%f14,	%f2,	%f16
loop_75:
	stbar
	orcc	%l5,	0x1F89,	%g5
	edge16	%g2,	%o7,	%l0
	tsubcc	%o3,	%l3,	%i2
	movneg	%xcc,	%g3,	%l2
	edge16l	%l6,	%i0,	%i1
	wr	%g0,	0x11,	%asi
	stda	%o4,	[%l7 + 0x20] %asi
	brz,a	%o5,	loop_76
	sdivx	%l1,	0x00FF,	%i7
	membar	0x4B
	tge	%xcc,	0x1
loop_76:
	nop
	wr	%g0,	0x81,	%asi
	stwa	%g1,	[%l7 + 0x28] %asi
	orncc	%g4,	0x09D7,	%i3
	swap	[%l7 + 0x28],	%o1
	udivx	%i5,	0x1D78,	%o0
	udivcc	%l4,	0x16D1,	%g7
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x54] %asi,	%o6
	fmovrdne	%i4,	%f30,	%f12
	srlx	%g6,	%o2,	%i6
	movl	%icc,	%l5,	%g5
	tvc	%xcc,	0x3
	orn	%g2,	0x0C9F,	%l0
	movn	%icc,	%o3,	%l3
	edge16l	%i2,	%g3,	%l2
	movgu	%icc,	%o7,	%i0
	mulx	%l6,	%o4,	%i1
	ta	%xcc,	0x0
	edge8ln	%o5,	%i7,	%g1
	smul	%g4,	0x0A23,	%i3
	tge	%xcc,	0x3
	array16	%o1,	%l1,	%o0
	addcc	%l4,	%i5,	%g7
	tneg	%xcc,	0x2
	ta	%xcc,	0x2
	fmovde	%xcc,	%f27,	%f2
	udivcc	%i4,	0x0067,	%o6
	tsubcc	%o2,	%i6,	%l5
	edge8l	%g6,	%g2,	%l0
	brz,a	%g5,	loop_77
	fble	%fcc3,	loop_78
	bneg,a,pt	%xcc,	loop_79
	brlz,a	%l3,	loop_80
loop_77:
	movg	%icc,	%i2,	%g3
loop_78:
	fmovrslz	%o3,	%f21,	%f30
loop_79:
	fmovdl	%icc,	%f31,	%f4
loop_80:
	array16	%o7,	%l2,	%i0
	umul	%l6,	0x0B0A,	%o4
	std	%o4,	[%l7 + 0x50]
	fpadd16	%f10,	%f10,	%f24
	fbo,a	%fcc3,	loop_81
	alignaddr	%i1,	%g1,	%g4
	movle	%icc,	%i3,	%i7
	subccc	%l1,	0x1982,	%o0
loop_81:
	fabsd	%f30,	%f20
	bne,a,pt	%icc,	loop_82
	fmul8x16	%f19,	%f14,	%f22
	ld	[%l7 + 0x2C],	%f4
	fbg,a	%fcc3,	loop_83
loop_82:
	call	loop_84
	movleu	%xcc,	%l4,	%o1
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x50] %asi,	%i4
loop_83:
	movrgz	%i4,	%g7,	%o2
loop_84:
	bgu	loop_85
	mova	%icc,	%o6,	%i6
	fmovrdne	%l5,	%f28,	%f16
	fmovsne	%icc,	%f26,	%f13
loop_85:
	movcc	%xcc,	%g6,	%g2
	addc	%g5,	0x1E97,	%l3
	edge32l	%i2,	%l0,	%g3
	ldd	[%l7 + 0x38],	%o2
	fba	%fcc2,	loop_86
	andcc	%o7,	%l2,	%i0
	popc	0x0586,	%l6
	ld	[%l7 + 0x14],	%f9
loop_86:
	nop
	setx loop_87, %l0, %l1
	jmpl %l1, %o5
	nop
	set	0x58, %g6
	ldx	[%l7 + %g6],	%i1
	tgu	%icc,	0x1
	addccc	%g1,	0x0FC9,	%o4
loop_87:
	movneg	%xcc,	%g4,	%i3
	movge	%xcc,	%i7,	%o0
	movneg	%icc,	%l1,	%o1
	stbar
	popc	%i5,	%l4
	fmuld8sux16	%f12,	%f23,	%f4
	movn	%icc,	%i4,	%o2
	bn	%icc,	loop_88
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g7,	0x038B,	%o6
	fcmpd	%fcc0,	%f28,	%f10
loop_88:
	nop
	set	0x18, %i7
	lduw	[%l7 + %i7],	%i6
	edge8n	%l5,	%g2,	%g5
	fmovrdgz	%g6,	%f10,	%f6
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x50] %asi,	%i2
	udiv	%l3,	0x15B3,	%g3
	tle	%icc,	0x6
	movvs	%icc,	%l0,	%o3
	movl	%icc,	%o7,	%i0
	brgz	%l6,	loop_89
	fnot2	%f10,	%f22
	set	0x40, %o2
	lduwa	[%l7 + %o2] 0x11,	%l2
loop_89:
	alignaddrl	%i1,	%o5,	%o4
	tvs	%xcc,	0x4
	fbl	%fcc1,	loop_90
	orncc	%g1,	%g4,	%i3
	sub	%o0,	%l1,	%i7
	andcc	%i5,	%l4,	%o1
loop_90:
	nop
	setx loop_91, %l0, %l1
	jmpl %l1, %i4
	tsubcc	%o2,	%g7,	%o6
	tn	%xcc,	0x6
	tcs	%icc,	0x0
loop_91:
	udivcc	%i6,	0x070C,	%g2
	fba,a	%fcc1,	loop_92
	tl	%xcc,	0x3
	fmovde	%xcc,	%f26,	%f21
	andncc	%l5,	%g5,	%i2
loop_92:
	fxnors	%f1,	%f8,	%f0
	xor	%l3,	0x0D0C,	%g3
	edge8n	%g6,	%l0,	%o7
	edge32ln	%i0,	%l6,	%o3
	fbu,a	%fcc0,	loop_93
	movle	%xcc,	%l2,	%i1
	tgu	%xcc,	0x6
	swap	[%l7 + 0x74],	%o4
loop_93:
	subccc	%o5,	%g4,	%i3
	fbne	%fcc2,	loop_94
	ba	loop_95
	fbge,a	%fcc0,	loop_96
	ta	%icc,	0x2
loop_94:
	movre	%o0,	%g1,	%i7
loop_95:
	nop
	set	0x14, %l6
	stwa	%l1,	[%l7 + %l6] 0x88
loop_96:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l4,	%i5
	sth	%o1,	[%l7 + 0x72]
	fmovrslez	%o2,	%f4,	%f3
	movcc	%xcc,	%g7,	%i4
	edge8n	%i6,	%g2,	%o6
	fbge,a	%fcc2,	loop_97
	bgu,pt	%icc,	loop_98
	stx	%g5,	[%l7 + 0x18]
	movcs	%icc,	%i2,	%l5
loop_97:
	array8	%l3,	%g3,	%l0
loop_98:
	umul	%g6,	%i0,	%o7
	std	%o2,	[%l7 + 0x48]
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
	wr	%g0,	0xea,	%asi
	stwa	%i1,	[%l7 + 0x40] %asi
	membar	#Sync
	edge8l	%l6,	%o5,	%g4
	edge16n	%i3,	%o4,	%g1
	edge16ln	%i7,	%o0,	%l1
	smulcc	%i5,	0x0956,	%l4
	fcmple32	%f10,	%f8,	%o1
	bpos,a	loop_99
	bpos,a,pt	%xcc,	loop_100
	tgu	%icc,	0x6
	flush	%l7 + 0x6C
loop_99:
	andn	%o2,	0x076C,	%i4
loop_100:
	fors	%f25,	%f6,	%f6
	sllx	%i6,	0x1C,	%g2
	edge32ln	%o6,	%g7,	%g5
	movge	%icc,	%l5,	%i2
	sllx	%l3,	0x11,	%l0
	movrlz	%g6,	0x1A5,	%i0
	stw	%o7,	[%l7 + 0x30]
	srax	%g3,	%o3,	%i1
	fbl	%fcc2,	loop_101
	addcc	%l2,	%l6,	%o5
	movrgez	%i3,	0x24F,	%g4
	srlx	%o4,	%i7,	%o0
loop_101:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%l1
	array32	%i5,	%l4,	%o1
	andn	%g1,	%o2,	%i6
	sub	%i4,	%o6,	%g2
	fcmpgt16	%f12,	%f30,	%g7
	stw	%g5,	[%l7 + 0x08]
	tl	%icc,	0x7
	andncc	%i2,	%l3,	%l5
	fmovsa	%xcc,	%f2,	%f0
	sdiv	%l0,	0x09E4,	%i0
	andn	%g6,	%g3,	%o7
	popc	%i1,	%l2
	fabss	%f22,	%f4
	udivx	%l6,	0x0AF8,	%o3
	tne	%icc,	0x6
	edge16n	%o5,	%i3,	%g4
	fmovrsne	%i7,	%f6,	%f9
	tsubcc	%o0,	%o4,	%l1
	movg	%xcc,	%l4,	%i5
	movvc	%icc,	%g1,	%o2
	array32	%i6,	%o1,	%o6
	fpadd16s	%f20,	%f13,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f26,	%f22,	%i4
	xorcc	%g2,	%g7,	%i2
	edge32ln	%l3,	%g5,	%l0
	nop
	setx	loop_102,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldsw	[%l7 + 0x70],	%l5
	bvs,a	loop_103
	orcc	%i0,	0x0F81,	%g6
loop_102:
	nop
	set	0x76, %o1
	lduha	[%l7 + %o1] 0x0c,	%o7
loop_103:
	fmovda	%icc,	%f11,	%f4
	stw	%i1,	[%l7 + 0x38]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f13,	%f9
	movleu	%icc,	%l2,	%l6
	fmovda	%icc,	%f19,	%f20
	ldsh	[%l7 + 0x24],	%g3
	movne	%icc,	%o5,	%o3
	pdist	%f10,	%f30,	%f12
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i3,	%g4
	subcc	%o0,	0x1A0F,	%i7
	sll	%o4,	%l1,	%i5
	fpmerge	%f19,	%f7,	%f28
	ldsw	[%l7 + 0x64],	%l4
	ta	%xcc,	0x4
	ld	[%l7 + 0x1C],	%f19
	udiv	%o2,	0x1201,	%i6
	movrgez	%o1,	%g1,	%i4
	fmovsvc	%icc,	%f15,	%f31
	fba	%fcc1,	loop_104
	fornot2	%f0,	%f8,	%f20
	fble	%fcc3,	loop_105
	tl	%icc,	0x2
loop_104:
	fsrc1	%f14,	%f30
	udivcc	%o6,	0x1468,	%g7
loop_105:
	movg	%xcc,	%i2,	%g2
	fabss	%f19,	%f31
	fzero	%f16
	srlx	%g5,	%l0,	%l5
	tneg	%icc,	0x1
	fbn,a	%fcc0,	loop_106
	fmul8x16al	%f5,	%f19,	%f10
	fcmpne16	%f30,	%f10,	%i0
	fpack16	%f26,	%f19
loop_106:
	xor	%l3,	0x152A,	%g6
	fbne,a	%fcc2,	loop_107
	tpos	%xcc,	0x1
	membar	0x65
	lduh	[%l7 + 0x0C],	%i1
loop_107:
	std	%f30,	[%l7 + 0x40]
	edge32n	%l2,	%o7,	%l6
	tsubcc	%g3,	%o3,	%i3
	tcs	%icc,	0x5
	fmovd	%f28,	%f14
	array8	%o5,	%o0,	%i7
	orncc	%g4,	%o4,	%l1
	stbar
	movrlez	%i5,	%o2,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x81,	%i6,	%o1
	brlez,a	%i4,	loop_108
	tl	%xcc,	0x1
	fblg,a	%fcc1,	loop_109
	fnors	%f7,	%f28,	%f23
loop_108:
	smul	%g1,	%o6,	%g7
	movn	%xcc,	%i2,	%g5
loop_109:
	tne	%xcc,	0x0
	tg	%xcc,	0x4
	add	%l0,	%l5,	%i0
	udivx	%l3,	0x1B9C,	%g6
	ldstub	[%l7 + 0x65],	%g2
	sdivx	%l2,	0x071C,	%i1
	fcmpes	%fcc1,	%f31,	%f2
	edge16ln	%l6,	%o7,	%g3
	tl	%icc,	0x4
	edge32	%o3,	%i3,	%o5
	sllx	%i7,	%g4,	%o0
	std	%f6,	[%l7 + 0x08]
	fmul8ulx16	%f22,	%f20,	%f14
	fmovscs	%xcc,	%f6,	%f10
	popc	0x01A4,	%o4
	edge16n	%i5,	%l1,	%l4
	bneg	%icc,	loop_110
	smul	%i6,	%o2,	%i4
	subccc	%o1,	0x0B97,	%g1
	fmovde	%xcc,	%f28,	%f25
loop_110:
	movrlez	%g7,	%o6,	%g5
	movgu	%xcc,	%l0,	%l5
	tl	%icc,	0x3
	orn	%i0,	%l3,	%i2
	fnot1s	%f13,	%f14
	bcc,pt	%xcc,	loop_111
	or	%g2,	0x0AB5,	%g6
	edge16ln	%i1,	%l2,	%o7
	bgu	loop_112
loop_111:
	xorcc	%g3,	%l6,	%o3
	tpos	%icc,	0x3
	fmovdcc	%xcc,	%f22,	%f31
loop_112:
	mova	%xcc,	%i3,	%i7
	lduh	[%l7 + 0x5C],	%g4
	movrgez	%o0,	%o4,	%i5
	movcc	%xcc,	%l1,	%l4
	edge16ln	%o5,	%o2,	%i4
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fnot2s	%f9,	%f8
	te	%icc,	0x6
	fxor	%f20,	%f16,	%f20
	srl	%o1,	0x09,	%g1
	swap	[%l7 + 0x08],	%g7
	fornot1	%f30,	%f30,	%f22
	stw	%i6,	[%l7 + 0x38]
	movl	%icc,	%g5,	%o6
	umulcc	%l5,	%l0,	%l3
	fmovdn	%icc,	%f14,	%f26
	tne	%xcc,	0x1
	edge8n	%i0,	%g2,	%i2
	taddcctv	%i1,	0x0EAA,	%l2
	tvc	%icc,	0x3
	set	0x40, %o3
	lduha	[%l7 + %o3] 0x89,	%o7
	fornot1	%f2,	%f0,	%f24
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g3
	popc	0x1918,	%g6
	orncc	%o3,	%l6,	%i7
	movrlz	%i3,	%o0,	%g4
	fnand	%f26,	%f24,	%f28
	tn	%icc,	0x3
	fmovdvs	%icc,	%f3,	%f5
	fmovsl	%icc,	%f20,	%f16
	tvc	%xcc,	0x0
	edge8n	%i5,	%l1,	%l4
	tle	%icc,	0x0
	fblg	%fcc2,	loop_113
	edge8	%o5,	%o4,	%o2
	fmovsa	%icc,	%f26,	%f4
	fbo	%fcc3,	loop_114
loop_113:
	umul	%o1,	0x09B8,	%g1
	movcs	%xcc,	%g7,	%i6
	pdist	%f8,	%f28,	%f24
loop_114:
	sll	%i4,	%g5,	%l5
	udivx	%o6,	0x0D08,	%l0
	fmovrslz	%i0,	%f13,	%f21
	move	%icc,	%g2,	%l3
	membar	0x07
	taddcctv	%i2,	%i1,	%o7
	srlx	%g3,	%g6,	%o3
	movge	%icc,	%l6,	%l2
	set	0x7C, %g4
	lduwa	[%l7 + %g4] 0x81,	%i7
	movrlz	%i3,	0x3AC,	%o0
	tne	%icc,	0x5
	umul	%g4,	%l1,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,pt	%xcc,	loop_115
	edge16l	%o5,	%l4,	%o4
	tsubcctv	%o1,	0x0ECF,	%g1
	fmovrde	%o2,	%f10,	%f2
loop_115:
	edge16ln	%g7,	%i6,	%i4
	fmovdvs	%xcc,	%f1,	%f9
	movne	%xcc,	%g5,	%o6
	fsrc1s	%f5,	%f4
	set	0x40, %i0
	ldxa	[%l7 + %i0] 0x19,	%l5
	lduh	[%l7 + 0x60],	%l0
	srax	%g2,	%i0,	%i2
	movg	%icc,	%l3,	%i1
	bneg,pn	%xcc,	loop_116
	array16	%o7,	%g6,	%o3
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x10,	%f16
loop_116:
	tg	%xcc,	0x6
	fors	%f9,	%f26,	%f28
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x34] %asi,	%g3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc1,	loop_117
	fpackfix	%f16,	%f12
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x0c
loop_117:
	tgu	%xcc,	0x6
	movg	%icc,	%l2,	%l6
	fmovrsne	%i7,	%f30,	%f15
	fzeros	%f10
	array32	%i3,	%g4,	%l1
	bn	loop_118
	fmovrdgez	%i5,	%f30,	%f28
	orn	%o5,	0x0C67,	%o0
	edge16	%o4,	%o1,	%g1
loop_118:
	nop
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x56] %asi,	%l4
	fmovs	%f5,	%f7
	fones	%f3
	brgz,a	%g7,	loop_119
	taddcc	%o2,	0x18DD,	%i6
	fnand	%f26,	%f28,	%f14
	fpsub16s	%f4,	%f11,	%f3
loop_119:
	edge8	%g5,	%i4,	%o6
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x61] %asi,	%l0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%g2,	%l5
	subc	%i0,	%i2,	%i1
	sllx	%o7,	0x0B,	%g6
	addc	%o3,	%l3,	%g3
	edge16ln	%l2,	%i7,	%l6
	xor	%g4,	0x1FAD,	%i3
	alignaddrl	%i5,	%l1,	%o0
	movrlz	%o4,	0x340,	%o1
	nop
	setx	loop_120,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	or	%o5,	%g1,	%l4
	fba	%fcc2,	loop_121
	taddcc	%o2,	0x163C,	%g7
loop_120:
	fmovdl	%icc,	%f9,	%f30
	umulcc	%g5,	%i4,	%o6
loop_121:
	fbne,a	%fcc0,	loop_122
	membar	0x44
	fmovrdgz	%l0,	%f8,	%f10
	fbo,a	%fcc0,	loop_123
loop_122:
	movcc	%xcc,	%g2,	%i6
	edge8n	%i0,	%i2,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_123:
	fmul8x16	%f13,	%f12,	%f26
	fbne,a	%fcc1,	loop_124
	fmovrdlz	%o7,	%f18,	%f4
	fmovrsgz	%i1,	%f28,	%f20
	fors	%f9,	%f16,	%f4
loop_124:
	movle	%icc,	%g6,	%o3
	mulx	%l3,	%l2,	%i7
	udiv	%l6,	0x1BE3,	%g3
	fnor	%f2,	%f8,	%f20
	nop
	setx loop_125, %l0, %l1
	jmpl %l1, %g4
	fbug	%fcc1,	loop_126
	edge8ln	%i3,	%i5,	%l1
	orcc	%o0,	%o1,	%o4
loop_125:
	nop
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_126:
	fmovsvc	%icc,	%f14,	%f11
	fbul,a	%fcc0,	loop_127
	bg,a	%icc,	loop_128
	tvc	%icc,	0x2
	movgu	%icc,	%g1,	%l4
loop_127:
	movgu	%xcc,	%o5,	%o2
loop_128:
	movrlz	%g5,	%i4,	%o6
	sll	%l0,	%g7,	%g2
	fcmpne32	%f24,	%f8,	%i6
	movrlez	%i2,	%i0,	%l5
	set	0x44, %g3
	swapa	[%l7 + %g3] 0x89,	%i1
	edge32ln	%o7,	%o3,	%g6
	or	%l3,	%l2,	%l6
	movvs	%xcc,	%g3,	%i7
	stw	%g4,	[%l7 + 0x24]
	taddcc	%i5,	%i3,	%o0
	or	%o1,	%o4,	%l1
	edge16ln	%g1,	%o5,	%o2
	ldd	[%l7 + 0x38],	%f28
	swap	[%l7 + 0x44],	%l4
	sll	%i4,	%g5,	%l0
	movle	%icc,	%g7,	%o6
	fble,a	%fcc2,	loop_129
	fexpand	%f5,	%f16
	umulcc	%i6,	0x1C07,	%g2
	edge16ln	%i2,	%i0,	%i1
loop_129:
	bge,pt	%icc,	loop_130
	fmovdvs	%xcc,	%f3,	%f13
	ba,a	%icc,	loop_131
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_130:
	array32	%l5,	%o3,	%o7
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%g6
loop_131:
	sdiv	%l3,	0x0DD4,	%l6
	array8	%g3,	%l2,	%i7
	prefetch	[%l7 + 0x78],	 0x1
	bvs,a,pn	%icc,	loop_132
	fmovsl	%icc,	%f18,	%f1
	edge16l	%g4,	%i3,	%o0
	fmovscc	%xcc,	%f19,	%f24
loop_132:
	fmovsle	%icc,	%f12,	%f15
	nop
	setx	loop_133,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%o1,	0x039A,	%o4
	tle	%xcc,	0x0
	bge,a	%icc,	loop_134
loop_133:
	call	loop_135
	umulcc	%l1,	0x0FBF,	%i5
	mova	%icc,	%o5,	%g1
loop_134:
	fzeros	%f28
loop_135:
	fmovrslez	%l4,	%f14,	%f28
	taddcctv	%i4,	0x0D17,	%g5
	edge16ln	%o2,	%l0,	%g7
	edge8ln	%o6,	%g2,	%i2
	sll	%i6,	%i0,	%l5
	bcc,a	loop_136
	orncc	%i1,	0x1D24,	%o7
	fxor	%f10,	%f18,	%f6
	fbl	%fcc3,	loop_137
loop_136:
	edge32ln	%o3,	%l3,	%l6
	and	%g6,	0x1DF7,	%l2
	sub	%g3,	0x1494,	%g4
loop_137:
	addccc	%i7,	%o0,	%i3
	movle	%icc,	%o4,	%o1
	sdiv	%i5,	0x1C2E,	%l1
	tsubcctv	%o5,	%g1,	%i4
	sllx	%g5,	%o2,	%l0
	fmovdcs	%icc,	%f3,	%f25
	fba	%fcc0,	loop_138
	bn,pt	%icc,	loop_139
	mulscc	%g7,	%o6,	%l4
	edge8	%i2,	%i6,	%g2
loop_138:
	movcc	%xcc,	%l5,	%i1
loop_139:
	andncc	%i0,	%o3,	%l3
	fmovda	%xcc,	%f16,	%f4
	movre	%l6,	%o7,	%l2
	fmul8x16au	%f8,	%f24,	%f16
	tvc	%icc,	0x3
	edge16	%g6,	%g4,	%i7
	tg	%icc,	0x5
	fones	%f12
	swap	[%l7 + 0x60],	%g3
	fmul8x16al	%f27,	%f6,	%f12
	edge32l	%i3,	%o0,	%o4
	edge8ln	%i5,	%l1,	%o1
	tge	%icc,	0x1
	fmovdcc	%icc,	%f24,	%f2
	add	%o5,	0x1D9E,	%i4
	fxors	%f2,	%f23,	%f4
	movvc	%xcc,	%g1,	%g5
	set	0x3D, %o7
	lduba	[%l7 + %o7] 0x0c,	%o2
	set	0x18, %l4
	ldswa	[%l7 + %l4] 0x18,	%g7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	movrgez	%l4,	0x228,	%i2
	udiv	%l0,	0x0236,	%i6
	alignaddrl	%g2,	%l5,	%i0
	sdivx	%o3,	0x06B2,	%i1
	stbar
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x30] %asi,	%l2
	fmul8x16al	%f25,	%f9,	%f10
	xnorcc	%l6,	%o7,	%l2
	tle	%xcc,	0x5
	fpadd32	%f2,	%f24,	%f28
	and	%g6,	0x0EBD,	%i7
	tge	%icc,	0x1
	fsrc2s	%f16,	%f16
	set	0x7A, %o5
	stha	%g4,	[%l7 + %o5] 0x0c
	orncc	%i3,	0x1AA6,	%g3
	movpos	%icc,	%o0,	%i5
	andncc	%o4,	%l1,	%o5
	fmul8ulx16	%f30,	%f22,	%f6
	tl	%xcc,	0x5
	sdivcc	%o1,	0x0678,	%i4
	brlez	%g5,	loop_140
	nop
	setx	loop_141,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivx	%g1,	0x125C,	%o2
	edge32ln	%o6,	%g7,	%i2
loop_140:
	nop
	set	0x2E, %l5
	stha	%l4,	[%l7 + %l5] 0xe3
	membar	#Sync
loop_141:
	srlx	%i6,	%l0,	%g2
	ldd	[%l7 + 0x30],	%f22
	tl	%icc,	0x6
	edge32n	%i0,	%l5,	%o3
	sdivcc	%i1,	0x1896,	%l3
	ldsh	[%l7 + 0x1E],	%l6
	and	%o7,	%g6,	%i7
	bl,a,pn	%icc,	loop_142
	movcc	%xcc,	%l2,	%i3
	tl	%xcc,	0x3
	tcc	%icc,	0x7
loop_142:
	udivx	%g3,	0x14AE,	%o0
	addcc	%g4,	%i5,	%o4
	fcmpne32	%f24,	%f10,	%l1
	sllx	%o5,	0x0E,	%o1
	addccc	%i4,	%g5,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bne	%xcc,	loop_143
	orn	%o6,	%g7,	%g1
	set	0x68, %g2
	ldswa	[%l7 + %g2] 0x19,	%i2
loop_143:
	movn	%xcc,	%i6,	%l4
	udiv	%g2,	0x0BED,	%i0
	array32	%l0,	%o3,	%i1
	ldstub	[%l7 + 0x43],	%l3
	movle	%xcc,	%l5,	%o7
	movcc	%xcc,	%g6,	%l6
	fbo,a	%fcc0,	loop_144
	edge8	%l2,	%i3,	%g3
	subc	%o0,	%i7,	%i5
	sir	0x0F98
loop_144:
	tcs	%icc,	0x4
	fxnor	%f10,	%f22,	%f18
	tgu	%xcc,	0x3
	wr	%g0,	0x11,	%asi
	sta	%f27,	[%l7 + 0x48] %asi
	xnor	%o4,	%l1,	%o5
	movle	%icc,	%o1,	%i4
	tsubcc	%g5,	0x0394,	%o2
	fble	%fcc0,	loop_145
	ldd	[%l7 + 0x40],	%f28
	fcmpes	%fcc2,	%f2,	%f11
	edge8	%g4,	%o6,	%g7
loop_145:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%icc,	0x1
	movle	%icc,	%g1,	%i6
	udivcc	%l4,	0x193B,	%i2
	alignaddr	%g2,	%l0,	%o3
	movrne	%i0,	%i1,	%l3
	mulx	%l5,	0x1A71,	%g6
	move	%icc,	%o7,	%l2
	fpsub16s	%f8,	%f3,	%f23
	mulscc	%i3,	0x1E71,	%l6
	tne	%xcc,	0x1
	movvc	%icc,	%o0,	%g3
	tn	%icc,	0x4
	fmovsge	%icc,	%f0,	%f7
	xorcc	%i7,	0x1D67,	%o4
	fornot1s	%f24,	%f26,	%f17
	subccc	%l1,	0x1136,	%o5
	srlx	%o1,	%i5,	%g5
	udiv	%o2,	0x097C,	%g4
	subc	%o6,	0x04B5,	%g7
	tsubcctv	%g1,	%i6,	%i4
	tcs	%icc,	0x6
	fmovscs	%xcc,	%f27,	%f31
	fmovrslz	%i2,	%f15,	%f13
	smulcc	%l4,	%g2,	%l0
	fmovscc	%icc,	%f17,	%f13
	array32	%o3,	%i0,	%l3
	fpsub16	%f4,	%f22,	%f0
	srlx	%l5,	%g6,	%i1
	fmovrdne	%l2,	%f16,	%f24
	te	%xcc,	0x6
	edge32ln	%o7,	%l6,	%o0
	st	%f3,	[%l7 + 0x1C]
	udivx	%i3,	0x15B5,	%g3
	sdivx	%i7,	0x19E5,	%o4
	fmovse	%icc,	%f14,	%f31
	bl,a	loop_146
	tl	%xcc,	0x1
	udivx	%o5,	0x037A,	%l1
	bpos,pt	%icc,	loop_147
loop_146:
	fcmple16	%f18,	%f22,	%o1
	edge8n	%i5,	%o2,	%g5
	sethi	0x0B24,	%g4
loop_147:
	fmovsneg	%xcc,	%f22,	%f12
	srax	%g7,	0x01,	%o6
	edge32	%g1,	%i6,	%i4
	xnor	%i2,	%l4,	%l0
	tsubcctv	%g2,	0x1410,	%i0
	udiv	%o3,	0x07D2,	%l5
	movvs	%icc,	%g6,	%i1
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x1B] %asi,	%l2
	fmovsl	%xcc,	%f4,	%f27
	fmovs	%f28,	%f7
	membar	0x1B
	bn	loop_148
	array8	%l3,	%o7,	%o0
	umulcc	%l6,	%i3,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_148:
	xor	%o4,	%g3,	%o5
	nop
	setx	loop_149,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8ulx16	%f6,	%f9,	%f26
	bvs,pt	%icc,	loop_150
	bne,pn	%xcc,	loop_151
loop_149:
	tleu	%xcc,	0x0
	fmovsne	%xcc,	%f3,	%f27
loop_150:
	array32	%o1,	%l1,	%i5
loop_151:
	nop
	wr	%g0,	0x1f,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	taddcctv	%g5,	0x05F4,	%g4
	xorcc	%o2,	%g7,	%g1
	set	0x64, %i6
	ldswa	[%l7 + %i6] 0x81,	%o6
	movre	%i6,	%i2,	%l4
	edge8ln	%l0,	%i4,	%i0
	fors	%f25,	%f11,	%f9
	fbo	%fcc3,	loop_152
	fmovrsgz	%o3,	%f5,	%f7
	fnands	%f12,	%f15,	%f30
	movrgez	%g2,	0x013,	%g6
loop_152:
	nop
	wr	%g0,	0x22,	%asi
	stha	%l5,	[%l7 + 0x60] %asi
	membar	#Sync
	fsrc1	%f6,	%f10
	movvs	%xcc,	%l2,	%l3
	fba,a	%fcc0,	loop_153
	movvc	%xcc,	%i1,	%o0
	fmovsl	%icc,	%f11,	%f10
	edge16ln	%o7,	%l6,	%i7
loop_153:
	fbg	%fcc0,	loop_154
	fones	%f16
	fble	%fcc0,	loop_155
	fmuld8ulx16	%f22,	%f27,	%f10
loop_154:
	fmovrdlz	%i3,	%f22,	%f16
	srl	%g3,	0x17,	%o5
loop_155:
	tsubcc	%o1,	%l1,	%o4
	std	%g4,	[%l7 + 0x40]
	set	0x3C, %g1
	sta	%f8,	[%l7 + %g1] 0x10
	xor	%g4,	%i5,	%g7
	fbg	%fcc3,	loop_156
	bgu	loop_157
	brgez,a	%g1,	loop_158
	edge8n	%o2,	%o6,	%i6
loop_156:
	sdivcc	%l4,	0x095D,	%i2
loop_157:
	xor	%l0,	0x1F22,	%i4
loop_158:
	fbug,a	%fcc3,	loop_159
	bleu,a	%xcc,	loop_160
	fmovsl	%icc,	%f15,	%f15
	xnorcc	%i0,	%g2,	%g6
loop_159:
	movcs	%xcc,	%l5,	%l2
loop_160:
	nop
	set	0x42, %i4
	lduh	[%l7 + %i4],	%o3
	fmovsleu	%icc,	%f2,	%f0
	ld	[%l7 + 0x28],	%f24
	fmovdne	%icc,	%f9,	%f7
	bshuffle	%f6,	%f26,	%f26
	fbu	%fcc0,	loop_161
	movl	%icc,	%i1,	%o0
	andcc	%o7,	0x1ECA,	%l6
	udiv	%l3,	0x0BEE,	%i3
loop_161:
	fmul8x16	%f21,	%f30,	%f30
	fsrc2	%f0,	%f14
	andcc	%g3,	0x1507,	%o5
	sdivcc	%i7,	0x04A5,	%o1
	addc	%l1,	%g5,	%o4
	array32	%i5,	%g4,	%g7
	fmovsge	%xcc,	%f27,	%f15
	sdiv	%g1,	0x08AB,	%o2
	fbug	%fcc3,	loop_162
	fmovdneg	%xcc,	%f27,	%f31
	fmovsneg	%xcc,	%f8,	%f0
	fmovdcs	%xcc,	%f24,	%f19
loop_162:
	fmovdvc	%xcc,	%f30,	%f9
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	array16	%i6,	%l4,	%i2
	lduh	[%l7 + 0x68],	%i4
	fornot2s	%f4,	%f25,	%f24
	call	loop_163
	addc	%i0,	0x0C64,	%l0
	xorcc	%g2,	0x04FC,	%l5
	ldd	[%l7 + 0x78],	%g6
loop_163:
	tl	%icc,	0x3
	and	%o3,	0x0E4F,	%l2
	movg	%xcc,	%i1,	%o7
	edge32	%o0,	%l6,	%i3
	array16	%g3,	%l3,	%o5
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%f2
	bcs	loop_164
	movl	%xcc,	%i7,	%l1
	sir	0x1E5C
	movge	%xcc,	%o1,	%g5
loop_164:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x75] %asi,	%o4
	set	0x58, %i2
	stda	%i4,	[%l7 + %i2] 0x2a
	membar	#Sync
	srl	%g7,	%g1,	%g4
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x18,	%f0
	xor	%o6,	0x0C48,	%o2
	fpack16	%f24,	%f9
	udivcc	%i6,	0x1AF8,	%i2
	wr	%g0,	0x19,	%asi
	stxa	%l4,	[%l7 + 0x48] %asi
	addc	%i4,	0x14E5,	%i0
	sllx	%g2,	%l0,	%l5
	sllx	%o3,	%l2,	%g6
	add	%o7,	0x1677,	%o0
	movre	%i1,	%l6,	%g3
	movvc	%icc,	%l3,	%i3
	fbuge	%fcc1,	loop_165
	fcmpne16	%f22,	%f6,	%i7
	wr	%g0,	0x2a,	%asi
	stda	%o4,	[%l7 + 0x08] %asi
	membar	#Sync
loop_165:
	movge	%icc,	%l1,	%g5
	edge32ln	%o4,	%o1,	%i5
	edge16ln	%g1,	%g7,	%o6
	fandnot2	%f2,	%f12,	%f20
	call	loop_166
	edge8l	%o2,	%g4,	%i6
	fbul,a	%fcc0,	loop_167
	orn	%l4,	0x1B7E,	%i2
loop_166:
	and	%i4,	%i0,	%l0
	array16	%g2,	%l5,	%l2
loop_167:
	addc	%g6,	0x0BDD,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o3,	0x07CA,	%o0
	set	0x30, %g7
	ldswa	[%l7 + %g7] 0x0c,	%l6
	movcc	%icc,	%i1,	%l3
	bge,pt	%icc,	loop_168
	ldsb	[%l7 + 0x08],	%i3
	flush	%l7 + 0x44
	fnot2s	%f21,	%f20
loop_168:
	srl	%g3,	0x1B,	%i7
	mulx	%l1,	%o5,	%o4
	mulscc	%g5,	0x0AFF,	%o1
	call	loop_169
	movrgez	%i5,	%g7,	%g1
	fnegs	%f12,	%f18
	sdivx	%o2,	0x1C21,	%o6
loop_169:
	nop
	set	0x54, %i3
	swapa	[%l7 + %i3] 0x0c,	%i6
	movvs	%xcc,	%g4,	%i2
	orn	%i4,	%i0,	%l0
	fabss	%f0,	%f20
	nop
	set	0x30, %g5
	std	%g2,	[%l7 + %g5]
	orcc	%l5,	0x1E79,	%l2
	fcmple32	%f4,	%f30,	%l4
	umulcc	%g6,	%o3,	%o7
	tvs	%icc,	0x3
	xnorcc	%l6,	%o0,	%i1
	tvc	%icc,	0x4
	movcs	%icc,	%i3,	%l3
	tle	%icc,	0x5
	fmovsvc	%icc,	%f29,	%f29
	swap	[%l7 + 0x08],	%g3
	tcc	%xcc,	0x5
	subc	%i7,	0x09A4,	%l1
	fornot2	%f0,	%f26,	%f4
	movre	%o5,	0x0F2,	%g5
	edge32n	%o1,	%o4,	%i5
	sra	%g1,	%o2,	%g7
	fnot2s	%f30,	%f11
	tvs	%xcc,	0x2
	fbuge,a	%fcc2,	loop_170
	fcmpne16	%f10,	%f6,	%o6
	fmovrse	%g4,	%f15,	%f10
	sll	%i2,	%i4,	%i0
loop_170:
	udivcc	%l0,	0x0AFB,	%i6
	mulx	%l5,	0x1156,	%g2
	movvc	%icc,	%l4,	%g6
	array32	%l2,	%o3,	%l6
	tn	%icc,	0x1
	fandnot2s	%f14,	%f21,	%f2
	movrgez	%o7,	0x1C3,	%i1
	stbar
	te	%icc,	0x2
	movvc	%icc,	%o0,	%l3
	ldstub	[%l7 + 0x5E],	%g3
	fmul8ulx16	%f8,	%f30,	%f12
	subcc	%i7,	%i3,	%o5
	sdivcc	%g5,	0x10CC,	%l1
	lduh	[%l7 + 0x76],	%o1
	udiv	%i5,	0x19BB,	%o4
	alignaddr	%g1,	%o2,	%o6
	fmovrsgz	%g7,	%f31,	%f13
	edge8n	%g4,	%i2,	%i4
	fabsd	%f14,	%f14
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
	stx	%i0,	[%l7 + 0x60]
	mova	%xcc,	%l5,	%i6
	tneg	%xcc,	0x3
	tleu	%xcc,	0x6
	bne,a	%xcc,	loop_171
	srlx	%l4,	%g2,	%g6
	fmovdne	%icc,	%f17,	%f1
	fpsub32s	%f28,	%f4,	%f23
loop_171:
	srlx	%o3,	0x08,	%l2
	taddcc	%o7,	%i1,	%o0
	set	0x11, %l1
	ldstuba	[%l7 + %l1] 0x10,	%l6
	edge32	%l3,	%i7,	%i3
	fbn	%fcc2,	loop_172
	fxor	%f8,	%f24,	%f28
	xorcc	%g3,	0x0F63,	%o5
	movl	%icc,	%g5,	%o1
loop_172:
	fone	%f28
	fmovrse	%i5,	%f14,	%f29
	set	0x60, %i5
	lda	[%l7 + %i5] 0x04,	%f25
	tl	%xcc,	0x6
	popc	%l1,	%o4
	fmovsne	%xcc,	%f27,	%f6
	xor	%o2,	0x0AD1,	%g1
	fmovdvc	%xcc,	%f11,	%f16
	mova	%xcc,	%g7,	%g4
	tcs	%icc,	0x7
	srax	%o6,	%i2,	%i4
	edge32n	%l0,	%i0,	%i6
	srlx	%l4,	0x0A,	%g2
	addc	%l5,	%o3,	%g6
	tsubcctv	%l2,	%i1,	%o7
	xorcc	%l6,	%o0,	%l3
	tne	%xcc,	0x2
	movrgez	%i3,	%i7,	%o5
	fpadd32s	%f4,	%f4,	%f3
	fmuld8ulx16	%f7,	%f5,	%f12
	fmovrslz	%g3,	%f5,	%f18
	xor	%o1,	0x1BBD,	%g5
	movcs	%icc,	%i5,	%o4
	fmovrdgez	%l1,	%f18,	%f24
	taddcc	%o2,	%g7,	%g1
	udiv	%o6,	0x0A4E,	%g4
	udivcc	%i2,	0x197F,	%l0
	movvc	%xcc,	%i4,	%i6
	sra	%l4,	%i0,	%g2
	xorcc	%l5,	0x14FD,	%o3
	fbne	%fcc2,	loop_173
	xnor	%l2,	0x06E5,	%i1
	ldsh	[%l7 + 0x50],	%o7
	fpmerge	%f30,	%f22,	%f6
loop_173:
	edge32ln	%g6,	%l6,	%o0
	fbug,a	%fcc2,	loop_174
	fmovsge	%xcc,	%f13,	%f5
	orn	%i3,	0x1D09,	%i7
	movre	%l3,	0x144,	%g3
loop_174:
	fbe,a	%fcc2,	loop_175
	sra	%o1,	%g5,	%i5
	array8	%o5,	%o4,	%l1
	fble	%fcc3,	loop_176
loop_175:
	fbe,a	%fcc2,	loop_177
	smulcc	%g7,	%g1,	%o6
	tcc	%xcc,	0x6
loop_176:
	andncc	%g4,	%i2,	%l0
loop_177:
	edge8ln	%i4,	%i6,	%l4
	subcc	%i0,	%g2,	%l5
	movrne	%o3,	%o2,	%l2
	addccc	%i1,	0x1199,	%g6
	edge8	%o7,	%l6,	%o0
	tcs	%icc,	0x1
	mulscc	%i7,	%l3,	%i3
	xorcc	%o1,	0x1999,	%g5
	ta	%xcc,	0x2
	movpos	%xcc,	%i5,	%g3
	fzero	%f22
	edge8ln	%o4,	%o5,	%g7
	fnors	%f19,	%f17,	%f19
	mulscc	%g1,	%o6,	%l1
	sdivx	%g4,	0x1FCE,	%i2
	fpsub16	%f12,	%f2,	%f14
	bne,a	loop_178
	orn	%i4,	%i6,	%l4
	movrlz	%i0,	%g2,	%l5
	edge32ln	%l0,	%o3,	%o2
loop_178:
	movg	%xcc,	%i1,	%g6
	fmovsl	%icc,	%f20,	%f25
	xorcc	%l2,	%o7,	%o0
	fpadd32s	%f5,	%f10,	%f31
	edge8	%l6,	%l3,	%i3
	array16	%i7,	%g5,	%o1
	tvc	%icc,	0x5
	xnor	%i5,	%g3,	%o5
	fmovdneg	%xcc,	%f21,	%f11
	ta	%icc,	0x0
	sethi	0x030C,	%g7
	bcc,a	%icc,	loop_179
	fmovrdgez	%g1,	%f28,	%f8
	andcc	%o6,	%o4,	%l1
	add	%i2,	%g4,	%i6
loop_179:
	fnand	%f30,	%f12,	%f24
	ldsh	[%l7 + 0x18],	%l4
	movrne	%i4,	%i0,	%l5
	tsubcc	%g2,	0x0D93,	%o3
	add	%o2,	0x1F8E,	%i1
	andn	%g6,	%l2,	%l0
	ba,a,pt	%xcc,	loop_180
	edge16n	%o0,	%l6,	%o7
	sth	%l3,	[%l7 + 0x6C]
	fbge	%fcc2,	loop_181
loop_180:
	or	%i3,	0x007E,	%g5
	movre	%o1,	%i7,	%g3
	orn	%o5,	%i5,	%g7
loop_181:
	mova	%icc,	%g1,	%o4
	alignaddrl	%o6,	%i2,	%l1
	brnz,a	%g4,	loop_182
	fnot1s	%f20,	%f14
	sra	%i6,	0x1C,	%l4
	tvs	%xcc,	0x4
loop_182:
	srlx	%i4,	0x00,	%i0
	nop
	set	0x18, %l2
	stx	%g2,	[%l7 + %l2]
	fcmped	%fcc0,	%f0,	%f0
	edge8n	%l5,	%o3,	%i1
	fpadd16	%f30,	%f14,	%f18
	fmovrsgez	%g6,	%f19,	%f19
	fmovsl	%xcc,	%f16,	%f18
	movrgez	%o2,	0x39A,	%l0
	alignaddr	%o0,	%l6,	%o7
	tsubcctv	%l3,	%l2,	%i3
	fmovsl	%icc,	%f9,	%f1
	array8	%o1,	%i7,	%g3
	bcs,pn	%xcc,	loop_183
	ldsh	[%l7 + 0x54],	%o5
	movrgz	%g5,	%i5,	%g7
	tge	%xcc,	0x2
loop_183:
	fcmpeq32	%f14,	%f6,	%g1
	sllx	%o6,	%o4,	%i2
	movvs	%icc,	%g4,	%i6
	fnot1	%f6,	%f28
	and	%l4,	%i4,	%l1
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x3
	fabss	%f1,	%f26
	bl,a,pt	%xcc,	loop_184
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g2,	0x07C6,	%o3
	fzeros	%f5
loop_184:
	mulx	%l5,	%i1,	%g6
	move	%xcc,	%o2,	%l0
	mulx	%l6,	%o7,	%o0
	ldsw	[%l7 + 0x74],	%l3
	movre	%i3,	0x263,	%l2
	ta	%xcc,	0x1
	fmovrsgz	%i7,	%f9,	%f3
	fmovdcs	%icc,	%f28,	%f15
	movgu	%xcc,	%o1,	%o5
	array8	%g3,	%g5,	%i5
	mulscc	%g7,	0x129F,	%g1
	fbne	%fcc2,	loop_185
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f28,	%f4,	%o6
	set	0x4C, %i1
	swapa	[%l7 + %i1] 0x10,	%i2
loop_185:
	mova	%icc,	%o4,	%g4
	sdivcc	%l4,	0x1468,	%i6
	ldsw	[%l7 + 0x38],	%i4
	srlx	%i0,	%l1,	%g2
	fmovspos	%icc,	%f30,	%f3
	orcc	%o3,	0x14A7,	%l5
	sub	%i1,	%g6,	%l0
	fcmpes	%fcc1,	%f30,	%f12
	for	%f6,	%f26,	%f14
	fcmpeq32	%f24,	%f6,	%o2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l6,	%o0
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	alignaddrl	%l3,	%o7,	%l2
	or	%i3,	0x0260,	%i7
	xor	%o5,	%o1,	%g5
	fand	%f8,	%f20,	%f30
	movrne	%i5,	0x3E6,	%g3
	fandnot2	%f18,	%f4,	%f26
	xnor	%g1,	0x0478,	%g7
	tsubcctv	%i2,	%o4,	%o6
	fand	%f6,	%f10,	%f12
	fmul8x16au	%f31,	%f18,	%f12
	srax	%g4,	0x14,	%l4
	subccc	%i6,	%i4,	%l1
	fmovse	%xcc,	%f8,	%f30
	fpsub16	%f22,	%f18,	%f28
	edge16ln	%g2,	%o3,	%l5
	mulx	%i1,	%i0,	%g6
	fnegd	%f28,	%f8
	subccc	%l0,	0x1C3A,	%o2
	movcs	%xcc,	%l6,	%o0
	mova	%icc,	%o7,	%l3
	fbn,a	%fcc0,	loop_186
	edge16l	%i3,	%l2,	%i7
	nop
	set	0x13, %l3
	ldstub	[%l7 + %l3],	%o1
	alignaddrl	%o5,	%g5,	%g3
loop_186:
	movre	%i5,	%g1,	%i2
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	std	%f18,	[%l7 + 0x10]
	tsubcc	%g7,	%o4,	%o6
	set	0x38, %i7
	stxa	%l4,	[%l7 + %i7] 0x88
	fble,a	%fcc1,	loop_187
	smul	%i6,	%i4,	%g4
	smul	%l1,	0x00BE,	%g2
	tcc	%icc,	0x4
loop_187:
	brgz	%l5,	loop_188
	movrne	%o3,	%i1,	%i0
	sllx	%g6,	%l0,	%o2
	srax	%o0,	%o7,	%l6
loop_188:
	xnor	%l3,	%i3,	%l2
	tge	%icc,	0x3
	fbug	%fcc2,	loop_189
	subccc	%i7,	%o1,	%g5
	tneg	%icc,	0x3
	movgu	%xcc,	%g3,	%o5
loop_189:
	stbar
	fmovrslz	%g1,	%f11,	%f5
	movrgz	%i2,	%i5,	%g7
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x10] %asi,	%f5
	stb	%o6,	[%l7 + 0x7A]
	sll	%o4,	%l4,	%i6
	tge	%xcc,	0x0
	fbul,a	%fcc3,	loop_190
	brnz	%i4,	loop_191
	subc	%l1,	%g2,	%l5
	sethi	0x03F6,	%g4
loop_190:
	umul	%o3,	%i0,	%i1
loop_191:
	movrlez	%g6,	%l0,	%o0
	tgu	%xcc,	0x4
	movrne	%o2,	0x09B,	%l6
	srl	%l3,	0x11,	%i3
	mova	%icc,	%o7,	%l2
	wr	%g0,	0x11,	%asi
	stda	%i6,	[%l7 + 0x08] %asi
	movne	%icc,	%o1,	%g5
	tvc	%xcc,	0x7
	set	0x50, %o2
	sta	%f8,	[%l7 + %o2] 0x81
	sdivcc	%g3,	0x0859,	%o5
	smulcc	%i2,	%g1,	%g7
	addc	%i5,	0x0635,	%o6
	fmovd	%f4,	%f16
	fcmpne16	%f6,	%f8,	%l4
	fmovd	%f28,	%f24
	membar	0x0E
	flush	%l7 + 0x68
	tn	%xcc,	0x5
	sdivcc	%i6,	0x09DD,	%i4
	subcc	%l1,	%g2,	%l5
	movleu	%xcc,	%g4,	%o3
	addcc	%o4,	%i1,	%g6
	membar	0x47
	fzero	%f20
	fcmpne16	%f6,	%f16,	%l0
	orcc	%i0,	%o2,	%l6
	tsubcc	%l3,	0x1E7C,	%i3
	tsubcctv	%o0,	0x1853,	%l2
	fandnot1s	%f19,	%f23,	%f2
	set	0x64, %l6
	lduwa	[%l7 + %l6] 0x18,	%o7
	fbul,a	%fcc1,	loop_192
	nop
	setx loop_193, %l0, %l1
	jmpl %l1, %o1
	tvs	%xcc,	0x2
	subc	%g5,	%g3,	%o5
loop_192:
	udivcc	%i2,	0x102B,	%g1
loop_193:
	edge8l	%g7,	%i7,	%o6
	edge32ln	%i5,	%l4,	%i6
	nop
	set	0x14, %g6
	prefetch	[%l7 + %g6],	 0x2
	movvc	%xcc,	%i4,	%g2
	edge8l	%l5,	%l1,	%g4
	st	%f21,	[%l7 + 0x3C]
	edge32n	%o4,	%i1,	%g6
	bvs,pn	%xcc,	loop_194
	andncc	%o3,	%l0,	%i0
	movle	%icc,	%o2,	%l6
	sra	%l3,	%i3,	%l2
loop_194:
	orn	%o7,	%o0,	%g5
	movrlz	%g3,	0x1C8,	%o1
	tgu	%icc,	0x3
	stbar
	orncc	%i2,	%g1,	%g7
	movcc	%xcc,	%i7,	%o6
	fnot1	%f28,	%f8
	movrgz	%i5,	%l4,	%o5
	bg,a,pn	%icc,	loop_195
	fbg,a	%fcc0,	loop_196
	tleu	%icc,	0x5
	for	%f22,	%f4,	%f18
loop_195:
	movrlez	%i4,	0x28C,	%i6
loop_196:
	bn,a,pn	%icc,	loop_197
	sdiv	%g2,	0x0A85,	%l1
	fmovs	%f27,	%f19
	sll	%g4,	%l5,	%o4
loop_197:
	udivcc	%i1,	0x1EAC,	%o3
	tcs	%icc,	0x1
	edge32n	%l0,	%i0,	%g6
	tn	%icc,	0x6
	wr	%g0,	0x19,	%asi
	stda	%i6,	[%l7 + 0x48] %asi
	fbl,a	%fcc2,	loop_198
	tg	%icc,	0x7
	movpos	%icc,	%l3,	%o2
	wr	%g0,	0x27,	%asi
	stwa	%i3,	[%l7 + 0x18] %asi
	membar	#Sync
loop_198:
	nop
	setx	loop_199,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fone	%f4
	movgu	%icc,	%o7,	%l2
	subc	%g5,	%o0,	%g3
loop_199:
	fmovrdlez	%o1,	%f10,	%f20
	tne	%xcc,	0x7
	sdivx	%g1,	0x1660,	%g7
	set	0x52, %o1
	ldstuba	[%l7 + %o1] 0x04,	%i2
	fbg,a	%fcc1,	loop_200
	movl	%icc,	%o6,	%i5
	wr	%g0,	0x80,	%asi
	stda	%i6,	[%l7 + 0x78] %asi
loop_200:
	movne	%icc,	%l4,	%o5
	tpos	%xcc,	0x2
	fbul	%fcc0,	loop_201
	ldd	[%l7 + 0x10],	%i4
	fpmerge	%f29,	%f21,	%f30
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x10] %asi,	%i6
loop_201:
	siam	0x7
	orcc	%g2,	%l1,	%g4
	std	%f24,	[%l7 + 0x68]
	set	0x16, %o3
	lduba	[%l7 + %o3] 0x15,	%l5
	tsubcc	%o4,	%i1,	%l0
	subccc	%o3,	%g6,	%i0
	mulscc	%l6,	0x1FEE,	%l3
	udivcc	%i3,	0x0D65,	%o2
	movrlz	%o7,	%l2,	%g5
	fmovdgu	%icc,	%f11,	%f1
	movcc	%icc,	%o0,	%o1
	fcmpes	%fcc3,	%f19,	%f19
	nop
	set	0x50, %i0
	std	%f30,	[%l7 + %i0]
	alignaddr	%g1,	%g3,	%g7
	sethi	0x0F68,	%i2
	fmovrdne	%i5,	%f22,	%f12
	alignaddr	%o6,	%l4,	%i7
	fmul8ulx16	%f18,	%f10,	%f10
	nop
	set	0x1D, %g4
	ldsb	[%l7 + %g4],	%i4
	alignaddrl	%o5,	%g2,	%l1
	movrgez	%i6,	0x012,	%l5
	fba	%fcc2,	loop_202
	subcc	%o4,	%i1,	%g4
	movvc	%xcc,	%l0,	%o3
	fmul8x16	%f25,	%f18,	%f8
loop_202:
	mova	%xcc,	%i0,	%g6
	fors	%f19,	%f30,	%f22
	edge32l	%l3,	%l6,	%i3
	tneg	%xcc,	0x2
	edge16l	%o7,	%l2,	%o2
	fmovdpos	%xcc,	%f14,	%f22
	andn	%o0,	0x1C78,	%g5
	movcc	%icc,	%g1,	%g3
	tge	%xcc,	0x3
	edge8n	%o1,	%g7,	%i2
	fbuge	%fcc3,	loop_203
	fsrc2s	%f24,	%f28
	sllx	%i5,	0x07,	%o6
	edge8	%l4,	%i4,	%o5
loop_203:
	fnot1	%f20,	%f14
	fnand	%f24,	%f4,	%f6
	set	0x58, %o6
	stha	%i7,	[%l7 + %o6] 0x89
	set	0x10, %l0
	lda	[%l7 + %l0] 0x88,	%f31
	fpack16	%f12,	%f24
	mulscc	%g2,	%i6,	%l5
	subcc	%o4,	%i1,	%g4
	fmul8ulx16	%f18,	%f12,	%f6
	nop
	set	0x6C, %o7
	prefetch	[%l7 + %o7],	 0x0
	fbul,a	%fcc2,	loop_204
	movl	%icc,	%l0,	%o3
	bg,pt	%xcc,	loop_205
	fmovs	%f0,	%f10
loop_204:
	ldd	[%l7 + 0x48],	%f16
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%f2
loop_205:
	fbl,a	%fcc2,	loop_206
	umulcc	%l1,	%g6,	%l3
	movrgez	%i0,	0x1BC,	%i3
	movrgez	%l6,	%l2,	%o2
loop_206:
	movvc	%xcc,	%o0,	%o7
	sir	0x0F7F
	movrgez	%g5,	0x047,	%g3
	fmovsle	%xcc,	%f3,	%f12
	swap	[%l7 + 0x24],	%o1
	fornot1	%f26,	%f12,	%f28
	std	%f6,	[%l7 + 0x30]
	tneg	%icc,	0x1
	movpos	%xcc,	%g1,	%g7
	sir	0x1109
	fxnor	%f14,	%f22,	%f0
	movvc	%icc,	%i2,	%i5
	orncc	%o6,	0x14AB,	%i4
	xnor	%l4,	%i7,	%g2
	addcc	%i6,	0x169F,	%o5
	movre	%o4,	0x32B,	%l5
	edge32l	%i1,	%g4,	%o3
	edge16ln	%l0,	%l1,	%g6
	edge32	%i0,	%i3,	%l3
	set	0x78, %o5
	lduwa	[%l7 + %o5] 0x04,	%l2
	fnot1s	%f21,	%f27
	fmovsl	%xcc,	%f29,	%f23
	mulx	%l6,	%o0,	%o2
	alignaddr	%g5,	%g3,	%o1
	movge	%icc,	%o7,	%g7
	prefetch	[%l7 + 0x14],	 0x2
	edge32n	%g1,	%i2,	%i5
	subc	%o6,	%i4,	%i7
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
	andn	%l4,	0x03F3,	%g2
	tn	%xcc,	0x2
	movre	%o5,	%o4,	%i6
loop_207:
	sllx	%l5,	0x04,	%g4
	prefetch	[%l7 + 0x74],	 0x3
	orcc	%o3,	%i1,	%l0
	subccc	%l1,	0x088E,	%g6
	fcmpgt32	%f16,	%f14,	%i3
	ldsw	[%l7 + 0x38],	%l3
	te	%icc,	0x5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] %asi,	%i0,	%l2
	orcc	%l6,	%o0,	%o2
	nop
	set	0x68, %l4
	ldx	[%l7 + %l4],	%g5
	add	%o1,	%o7,	%g3
	sdivcc	%g7,	0x1895,	%g1
	set	0x50, %g2
	stda	%i4,	[%l7 + %g2] 0x10
	sdivx	%o6,	0x0E94,	%i2
	set	0x34, %l5
	stha	%i7,	[%l7 + %l5] 0x04
	brnz	%i4,	loop_208
	add	%l4,	%o5,	%o4
	sdivx	%g2,	0x049E,	%l5
	bvs,a	loop_209
loop_208:
	popc	%g4,	%o3
	movl	%icc,	%i1,	%i6
	movge	%xcc,	%l0,	%l1
loop_209:
	edge16ln	%g6,	%i3,	%i0
	fsrc1s	%f22,	%f18
	st	%f19,	[%l7 + 0x68]
	movcc	%icc,	%l3,	%l6
	fmovd	%f12,	%f18
	bpos,pt	%icc,	loop_210
	fxors	%f5,	%f21,	%f12
	xnorcc	%o0,	%o2,	%g5
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x81
loop_210:
	xorcc	%l2,	0x0F34,	%o1
	tpos	%icc,	0x3
	fmovsl	%icc,	%f19,	%f20
	sdiv	%g3,	0x1800,	%o7
	tleu	%icc,	0x2
	movne	%icc,	%g7,	%i5
	movpos	%icc,	%o6,	%g1
	call	loop_211
	sir	0x00CF
	edge16l	%i2,	%i4,	%i7
	popc	0x1CE1,	%o5
loop_211:
	sdivcc	%o4,	0x10B6,	%g2
	tcc	%icc,	0x2
	edge8ln	%l4,	%l5,	%g4
	movvs	%icc,	%o3,	%i6
	fbge,a	%fcc3,	loop_212
	movcc	%icc,	%i1,	%l1
	fbl,a	%fcc1,	loop_213
	edge32n	%g6,	%l0,	%i3
loop_212:
	xor	%l3,	%i0,	%o0
	movpos	%icc,	%o2,	%l6
loop_213:
	fpmerge	%f15,	%f9,	%f16
	andn	%g5,	0x0FA0,	%o1
	edge16	%g3,	%l2,	%g7
	edge32l	%o7,	%o6,	%i5
	movvs	%icc,	%g1,	%i4
	nop
	setx	loop_214,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%i7,	%o5,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g2,	0x0A81,	%l4
loop_214:
	tge	%xcc,	0x1
	fmovdpos	%xcc,	%f20,	%f23
	fmovdn	%xcc,	%f7,	%f8
	bvs	loop_215
	tn	%icc,	0x4
	bcc,a,pn	%icc,	loop_216
	and	%l5,	%i2,	%o3
loop_215:
	srlx	%g4,	%i1,	%i6
	sllx	%l1,	0x00,	%g6
loop_216:
	fpmerge	%f9,	%f2,	%f24
	xorcc	%i3,	%l3,	%l0
	tn	%icc,	0x5
	subcc	%o0,	%i0,	%o2
	smul	%l6,	%g5,	%o1
	tvc	%xcc,	0x7
	set	0x3C, %i6
	ldswa	[%l7 + %i6] 0x11,	%l2
	move	%xcc,	%g7,	%o7
	smulcc	%o6,	%g3,	%g1
	udiv	%i4,	0x11FD,	%i7
	set	0x38, %o0
	stha	%o5,	[%l7 + %o0] 0x18
	nop
	setx	loop_217,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%o4,	%g2,	%l4
	smul	%i5,	0x181E,	%l5
	movge	%icc,	%i2,	%g4
loop_217:
	add	%o3,	0x1D41,	%i1
	set	0x46, %i2
	lduha	[%l7 + %i2] 0x04,	%i6
	fmovsvc	%xcc,	%f20,	%f7
	ldub	[%l7 + 0x74],	%l1
	tleu	%icc,	0x1
	sth	%i3,	[%l7 + 0x2C]
	movrne	%l3,	0x18C,	%g6
	tleu	%icc,	0x5
	and	%o0,	%l0,	%i0
	movvs	%xcc,	%o2,	%l6
	andn	%o1,	0x0AE3,	%l2
	mulscc	%g5,	0x1BE8,	%g7
	array16	%o7,	%o6,	%g1
	array16	%g3,	%i7,	%i4
	sll	%o4,	%o5,	%l4
	fmovsg	%icc,	%f0,	%f15
	bn,a,pn	%icc,	loop_218
	fornot1	%f0,	%f20,	%f8
	set	0x0C, %i4
	stwa	%g2,	[%l7 + %i4] 0x15
loop_218:
	edge16	%l5,	%i2,	%i5
	fabss	%f22,	%f31
	andcc	%o3,	%g4,	%i1
	sllx	%l1,	0x18,	%i3
	subccc	%l3,	0x1CF4,	%g6
	fbule,a	%fcc2,	loop_219
	bneg,a	loop_220
	movl	%icc,	%o0,	%i6
	sub	%l0,	%o2,	%i0
loop_219:
	sll	%l6,	%o1,	%l2
loop_220:
	fmovdle	%xcc,	%f15,	%f20
	fnand	%f10,	%f2,	%f14
	fmovdgu	%xcc,	%f21,	%f1
	tg	%xcc,	0x5
	orncc	%g5,	0x07E2,	%g7
	fnegs	%f18,	%f22
	xnor	%o6,	0x1C8C,	%g1
	brgez,a	%o7,	loop_221
	or	%g3,	0x062B,	%i7
	udivx	%o4,	0x0500,	%i4
	wr	%g0,	0x23,	%asi
	stwa	%o5,	[%l7 + 0x28] %asi
	membar	#Sync
loop_221:
	movg	%xcc,	%l4,	%l5
	bcc	%xcc,	loop_222
	movrlez	%i2,	0x330,	%g2
	orn	%o3,	0x139C,	%i5
	bpos,pn	%icc,	loop_223
loop_222:
	brnz	%g4,	loop_224
	bcs,a,pt	%xcc,	loop_225
	edge8n	%i1,	%l1,	%i3
loop_223:
	xorcc	%g6,	0x0B5C,	%l3
loop_224:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x89,	%i6,	%o0
loop_225:
	nop
	set	0x3A, %g7
	ldsha	[%l7 + %g7] 0x15,	%o2
	fnot2s	%f1,	%f2
	edge16l	%l0,	%l6,	%o1
	tge	%icc,	0x4
	tsubcctv	%l2,	0x05A9,	%g5
	udiv	%g7,	0x18D0,	%o6
	ldx	[%l7 + 0x70],	%g1
	ta	%icc,	0x1
	tn	%icc,	0x1
	tge	%icc,	0x3
	fexpand	%f7,	%f6
	mulx	%i0,	%g3,	%i7
	movrlz	%o4,	0x16F,	%i4
	fmovrsgez	%o7,	%f30,	%f11
	array8	%o5,	%l5,	%i2
	fmovrdlez	%l4,	%f0,	%f18
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x35] %asi,	%o3
	stx	%i5,	[%l7 + 0x68]
	prefetch	[%l7 + 0x3C],	 0x1
	fsrc1	%f26,	%f16
	movcc	%icc,	%g4,	%g2
	set	0x3C, %i3
	lda	[%l7 + %i3] 0x0c,	%f21
	nop
	setx	loop_226,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sra	%l1,	0x1C,	%i3
	movvs	%xcc,	%g6,	%l3
	smulcc	%i6,	0x1E04,	%o0
loop_226:
	fxor	%f28,	%f6,	%f0
	movrgez	%i1,	0x063,	%o2
	fexpand	%f15,	%f4
	tgu	%xcc,	0x0
	movneg	%icc,	%l0,	%l6
	stb	%l2,	[%l7 + 0x47]
	edge32ln	%o1,	%g5,	%o6
	andncc	%g1,	%g7,	%i0
	set	0x30, %g5
	ldswa	[%l7 + %g5] 0x81,	%i7
	tle	%icc,	0x2
	movpos	%icc,	%g3,	%i4
	call	loop_227
	tl	%xcc,	0x5
	sll	%o7,	0x03,	%o5
	movvs	%xcc,	%l5,	%o4
loop_227:
	ta	%icc,	0x5
	edge16ln	%i2,	%o3,	%i5
	sub	%g4,	0x1A95,	%l4
	sub	%g2,	0x11FC,	%l1
	fbug,a	%fcc3,	loop_228
	sdivx	%g6,	0x1669,	%i3
	fbule,a	%fcc3,	loop_229
	alignaddr	%l3,	%i6,	%i1
loop_228:
	xor	%o0,	%o2,	%l0
	fbl	%fcc0,	loop_230
loop_229:
	xor	%l2,	0x1A9F,	%o1
	subccc	%l6,	%o6,	%g1
	tge	%xcc,	0x0
loop_230:
	fnot1	%f20,	%f26
	bneg	loop_231
	movre	%g7,	0x1AB,	%g5
	membar	0x18
	edge8n	%i0,	%g3,	%i7
loop_231:
	or	%o7,	0x00B7,	%o5
	edge8ln	%l5,	%i4,	%o4
	movpos	%icc,	%o3,	%i2
	andn	%i5,	%l4,	%g2
	sub	%g4,	0x18BC,	%l1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	smul	%i3,	0x1380,	%l3
	bpos,a,pt	%xcc,	loop_232
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g6,	%i6,	%o0
	fbg,a	%fcc3,	loop_233
loop_232:
	edge8	%o2,	%i1,	%l0
	brgez,a	%l2,	loop_234
	stx	%o1,	[%l7 + 0x38]
loop_233:
	brgz,a	%o6,	loop_235
	movre	%g1,	%g7,	%l6
loop_234:
	stx	%i0,	[%l7 + 0x08]
	fcmpes	%fcc0,	%f21,	%f28
loop_235:
	edge8ln	%g3,	%i7,	%o7
	fmovsvs	%icc,	%f24,	%f20
	sll	%o5,	%l5,	%i4
	set	0x12, %l1
	stha	%g5,	[%l7 + %l1] 0x80
	movrlez	%o4,	0x2D7,	%i2
	orncc	%i5,	%o3,	%g2
	tgu	%xcc,	0x3
	fba	%fcc2,	loop_236
	movvs	%xcc,	%l4,	%l1
	fpmerge	%f15,	%f30,	%f20
	udivcc	%g4,	0x1B10,	%l3
loop_236:
	fcmpeq32	%f8,	%f10,	%i3
	flush	%l7 + 0x7C
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g6,	0x2DB,	%o0
	brgz,a	%i6,	loop_237
	st	%f24,	[%l7 + 0x08]
	sdiv	%i1,	0x065E,	%l0
	tvc	%xcc,	0x5
loop_237:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x50, %o4
	stxa	%o2,	[%l7 + %o4] 0x27
	membar	#Sync
	mulscc	%l2,	%o1,	%o6
	bne,a,pn	%xcc,	loop_238
	fones	%f25
	tge	%xcc,	0x3
	fmovdge	%icc,	%f6,	%f10
loop_238:
	move	%xcc,	%g1,	%g7
	edge32ln	%l6,	%g3,	%i0
	sdivcc	%o7,	0x0CA6,	%i7
	fbu,a	%fcc2,	loop_239
	tpos	%icc,	0x3
	edge32l	%o5,	%l5,	%i4
	fmovrdlez	%g5,	%f28,	%f10
loop_239:
	fand	%f2,	%f28,	%f12
	fcmpgt32	%f18,	%f16,	%o4
	andn	%i5,	0x1336,	%o3
	st	%f28,	[%l7 + 0x38]
	array16	%i2,	%g2,	%l1
	srl	%g4,	%l4,	%i3
	bge,a,pn	%xcc,	loop_240
	bgu	%icc,	loop_241
	array8	%l3,	%o0,	%i6
	srax	%i1,	%g6,	%l0
loop_240:
	brgez,a	%o2,	loop_242
loop_241:
	xnor	%o1,	%l2,	%g1
	mova	%icc,	%g7,	%l6
	bleu,pt	%xcc,	loop_243
loop_242:
	fmovdneg	%xcc,	%f7,	%f12
	edge32l	%g3,	%o6,	%o7
	taddcctv	%i0,	0x0101,	%o5
loop_243:
	xor	%l5,	%i7,	%g5
	fpsub16	%f26,	%f10,	%f24
	fornot1	%f30,	%f24,	%f2
	fmovdn	%icc,	%f8,	%f22
	membar	0x1E
	sdiv	%o4,	0x07F0,	%i4
	fmul8x16al	%f27,	%f13,	%f24
	andn	%o3,	0x0747,	%i5
	edge8n	%i2,	%g2,	%g4
	brgez,a	%l4,	loop_244
	movle	%icc,	%i3,	%l3
	edge16n	%l1,	%o0,	%i6
	movrgz	%i1,	0x3CC,	%g6
loop_244:
	movge	%xcc,	%o2,	%l0
	sra	%l2,	0x0C,	%g1
	set	0x10, %i5
	stda	%g6,	[%l7 + %i5] 0xea
	membar	#Sync
	andncc	%l6,	%g3,	%o1
	tvs	%xcc,	0x7
	fabsd	%f2,	%f2
	fone	%f26
	fmovsneg	%xcc,	%f25,	%f10
	fmuld8ulx16	%f8,	%f6,	%f12
	umulcc	%o7,	%o6,	%o5
	fmovd	%f10,	%f18
	edge8l	%i0,	%l5,	%g5
	tl	%xcc,	0x3
	umulcc	%i7,	0x00BD,	%o4
	fpackfix	%f0,	%f31
	orcc	%o3,	0x1D61,	%i5
	mulx	%i4,	0x083A,	%i2
	fcmpne32	%f2,	%f4,	%g4
	array16	%l4,	%g2,	%i3
	bvs,a	loop_245
	edge8ln	%l3,	%o0,	%i6
	fcmpes	%fcc0,	%f2,	%f0
	edge16ln	%l1,	%i1,	%g6
loop_245:
	nop
	add	%l7,	0x48,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%o2,	%l2
	xnorcc	%l0,	0x12C1,	%g7
	movvc	%xcc,	%g1,	%g3
	fornot2s	%f21,	%f11,	%f5
	fnot2s	%f22,	%f6
	movpos	%xcc,	%l6,	%o1
	ld	[%l7 + 0x50],	%f2
	edge8n	%o6,	%o7,	%o5
	fbe	%fcc2,	loop_246
	stw	%i0,	[%l7 + 0x1C]
	movcs	%icc,	%l5,	%g5
	movg	%icc,	%o4,	%i7
loop_246:
	movrne	%i5,	0x261,	%o3
	smulcc	%i4,	%g4,	%i2
	fbuge	%fcc1,	loop_247
	fsrc1	%f2,	%f24
	sll	%g2,	%l4,	%l3
	set	0x38, %l2
	lda	[%l7 + %l2] 0x89,	%f1
loop_247:
	fmovsle	%xcc,	%f31,	%f15
	sir	0x110E
	srax	%o0,	0x04,	%i6
	array32	%i3,	%l1,	%g6
	fmovrslez	%o2,	%f16,	%f7
	popc	%l2,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x22,	%asi
	stxa	%l0,	[%l7 + 0x78] %asi
	membar	#Sync
	fba,a	%fcc3,	loop_248
	bvs,pn	%icc,	loop_249
	fcmped	%fcc0,	%f4,	%f20
	movrgez	%g1,	%g3,	%l6
loop_248:
	xor	%o1,	%g7,	%o7
loop_249:
	fbu,a	%fcc1,	loop_250
	tpos	%xcc,	0x4
	std	%f2,	[%l7 + 0x10]
	fmovrse	%o6,	%f22,	%f26
loop_250:
	tg	%icc,	0x3
	bvc,a,pn	%icc,	loop_251
	fandnot2	%f24,	%f16,	%f16
	tge	%xcc,	0x2
	stw	%i0,	[%l7 + 0x08]
loop_251:
	smulcc	%l5,	0x1BCD,	%g5
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o4
	fpsub16	%f16,	%f30,	%f0
	movrgz	%o5,	0x058,	%i7
	xor	%o3,	0x0941,	%i5
	movrgez	%i4,	%g4,	%g2
	fmovrslez	%l4,	%f17,	%f16
	fxors	%f2,	%f26,	%f0
	stbar
	edge8	%l3,	%i2,	%o0
	taddcc	%i6,	%i3,	%l1
	edge8n	%o2,	%l2,	%g6
	sub	%i1,	0x128D,	%l0
	fcmpgt32	%f4,	%f14,	%g1
	fmovsn	%xcc,	%f1,	%f25
	smulcc	%l6,	%o1,	%g7
	movl	%xcc,	%o7,	%g3
	edge8l	%o6,	%l5,	%i0
	fones	%f24
	movrne	%g5,	0x1B7,	%o5
	srlx	%i7,	0x04,	%o3
	fmovsleu	%icc,	%f31,	%f1
	movcc	%icc,	%i5,	%o4
	brlz,a	%g4,	loop_252
	bge,a,pn	%icc,	loop_253
	fzeros	%f5
	bl,a,pn	%icc,	loop_254
loop_252:
	fzero	%f12
loop_253:
	srl	%g2,	0x07,	%i4
	movrlz	%l4,	0x074,	%l3
loop_254:
	edge32	%i2,	%i6,	%o0
	fbug,a	%fcc3,	loop_255
	tsubcc	%i3,	%l1,	%l2
	sub	%o2,	%g6,	%l0
	tsubcctv	%g1,	0x1587,	%i1
loop_255:
	move	%xcc,	%o1,	%g7
	add	%o7,	0x1DC0,	%g3
	siam	0x1
	orncc	%o6,	%l5,	%i0
	fmovscc	%xcc,	%f21,	%f31
	movcs	%xcc,	%g5,	%o5
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%i7
	be	loop_256
	tcs	%xcc,	0x0
	tsubcc	%l6,	%i5,	%o3
	subcc	%o4,	0x0C21,	%g2
loop_256:
	movrgez	%g4,	0x34F,	%i4
	fmovsl	%xcc,	%f21,	%f6
	fones	%f20
	tsubcc	%l3,	0x0C19,	%i2
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x20] %asi,	%i6
	udivx	%o0,	0x1316,	%i3
	nop
	setx	loop_257,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbuge,a	%fcc0,	loop_258
	array16	%l1,	%l2,	%o2
	tcc	%xcc,	0x3
loop_257:
	udiv	%g6,	0x11D1,	%l4
loop_258:
	fnegd	%f14,	%f28
	fmovda	%icc,	%f17,	%f4
	movre	%l0,	%g1,	%o1
	tgu	%xcc,	0x6
	xorcc	%g7,	0x1C08,	%o7
	movpos	%icc,	%i1,	%o6
	brlz	%g3,	loop_259
	subccc	%i0,	%l5,	%o5
	smulcc	%g5,	0x19CA,	%i7
	sllx	%l6,	0x16,	%o3
loop_259:
	tleu	%icc,	0x0
	edge8n	%o4,	%i5,	%g4
	umulcc	%i4,	0x0CF6,	%g2
	fmovdl	%xcc,	%f18,	%f2
	addcc	%i2,	%i6,	%o0
	fbu	%fcc2,	loop_260
	bne	loop_261
	sdiv	%l3,	0x04E1,	%i3
	nop
	setx loop_262, %l0, %l1
	jmpl %l1, %l1
loop_260:
	fmul8x16	%f29,	%f20,	%f12
loop_261:
	fbg	%fcc3,	loop_263
	and	%l2,	%o2,	%l4
loop_262:
	edge16ln	%l0,	%g1,	%o1
	stx	%g6,	[%l7 + 0x48]
loop_263:
	ta	%icc,	0x3
	bshuffle	%f8,	%f0,	%f16
	fandnot1s	%f17,	%f27,	%f28
	set	0x40, %l3
	ldda	[%l7 + %l3] 0x15,	%f0
	set	0x1C, %i1
	swapa	[%l7 + %i1] 0x04,	%g7
	tn	%icc,	0x6
	fbul	%fcc3,	loop_264
	sdivx	%o7,	0x1531,	%o6
	fpack16	%f24,	%f19
	mulscc	%i1,	%g3,	%l5
loop_264:
	fble,a	%fcc0,	loop_265
	fba	%fcc0,	loop_266
	mulscc	%o5,	%g5,	%i0
	edge8l	%i7,	%o3,	%l6
loop_265:
	sdiv	%o4,	0x0F0D,	%g4
loop_266:
	std	%i4,	[%l7 + 0x70]
	mulscc	%g2,	0x1082,	%i2
	siam	0x2
	bleu,pt	%icc,	loop_267
	alignaddr	%i6,	%i5,	%o0
	edge8	%l3,	%l1,	%i3
	fcmps	%fcc3,	%f13,	%f11
loop_267:
	smulcc	%o2,	%l2,	%l0
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x40] %asi,	%l4
	set	0x12, %i7
	ldstuba	[%l7 + %i7] 0x88,	%g1
	xnorcc	%o1,	%g7,	%g6
	fmovrdne	%o7,	%f14,	%f26
	fbne,a	%fcc0,	loop_268
	fzero	%f2
	ldx	[%l7 + 0x48],	%o6
	andn	%g3,	%l5,	%o5
loop_268:
	edge8	%g5,	%i1,	%i0
	and	%i7,	0x05AD,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o4,	0x007F,	%o3
	xor	%g4,	0x0B5B,	%g2
	fbu	%fcc2,	loop_269
	movre	%i4,	0x1C9,	%i6
	taddcc	%i5,	0x1A65,	%i2
	fpadd32	%f20,	%f8,	%f8
loop_269:
	fba,a	%fcc1,	loop_270
	movrlz	%l3,	0x379,	%l1
	movrne	%o0,	0x36A,	%i3
	tle	%xcc,	0x1
loop_270:
	umulcc	%o2,	%l2,	%l4
	fnot2s	%f9,	%f31
	movrlz	%l0,	0x2BF,	%g1
	edge8l	%g7,	%g6,	%o7
	swap	[%l7 + 0x64],	%o6
	bleu	%xcc,	loop_271
	fmovdvs	%xcc,	%f14,	%f9
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x50] %asi,	%g3
loop_271:
	sethi	0x0749,	%o1
	movcc	%xcc,	%o5,	%l5
	fpadd32s	%f6,	%f1,	%f24
	fba	%fcc2,	loop_272
	fone	%f16
	movgu	%icc,	%g5,	%i1
	fmovdne	%icc,	%f15,	%f28
loop_272:
	fmovdne	%icc,	%f3,	%f17
	sdiv	%i0,	0x0D62,	%l6
	sdivx	%i7,	0x04AF,	%o4
	xor	%o3,	%g2,	%g4
	stb	%i6,	[%l7 + 0x3F]
	ta	%xcc,	0x3
	fbuge,a	%fcc0,	loop_273
	movrgez	%i5,	0x22A,	%i2
	set	0x2C, %o2
	stwa	%l3,	[%l7 + %o2] 0x22
	membar	#Sync
loop_273:
	edge8	%l1,	%o0,	%i3
	fandnot1s	%f6,	%f8,	%f16
	tgu	%icc,	0x4
	addcc	%o2,	%l2,	%l4
	brlez,a	%i4,	loop_274
	tvs	%icc,	0x0
	fmovsneg	%icc,	%f2,	%f21
	fsrc1s	%f27,	%f4
loop_274:
	movrlez	%g1,	0x192,	%l0
	xor	%g6,	0x1342,	%o7
	andncc	%o6,	%g7,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc0,	loop_275
	fmovsn	%xcc,	%f1,	%f2
	subcc	%g3,	%o5,	%l5
	movle	%xcc,	%i1,	%g5
loop_275:
	bg	%icc,	loop_276
	nop
	setx loop_277, %l0, %l1
	jmpl %l1, %i0
	xnor	%i7,	0x069A,	%o4
	taddcc	%l6,	0x04F0,	%g2
loop_276:
	nop
	setx	loop_278,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_277:
	fmovdvc	%icc,	%f3,	%f30
	bcc,a,pn	%icc,	loop_279
	fpsub16	%f10,	%f4,	%f6
loop_278:
	nop
	setx	loop_280,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fxors	%f15,	%f7,	%f6
loop_279:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x12] %asi,	%o3
loop_280:
	brgz	%i6,	loop_281
	tn	%icc,	0x4
	edge16	%g4,	%i2,	%i5
	and	%l3,	0x15C2,	%o0
loop_281:
	xorcc	%i3,	%o2,	%l2
	ta	%icc,	0x3
	fmovsge	%xcc,	%f5,	%f28
	fbo	%fcc1,	loop_282
	movvs	%icc,	%l1,	%i4
	sdivcc	%l4,	0x1A04,	%l0
	array8	%g1,	%o7,	%g6
loop_282:
	edge32l	%g7,	%o1,	%g3
	smulcc	%o6,	%o5,	%l5
	subc	%g5,	%i0,	%i1
	tle	%icc,	0x4
	bge,pt	%icc,	loop_283
	srl	%i7,	%o4,	%l6
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x23,	%o2
loop_283:
	fmovsge	%icc,	%f29,	%f31
	movrlez	%i6,	%g2,	%i2
	add	%g4,	0x0949,	%i5
	movrlez	%l3,	%i3,	%o2
	subc	%o0,	0x0130,	%l1
	prefetch	[%l7 + 0x0C],	 0x0
	set	0x1C, %o1
	ldsha	[%l7 + %o1] 0x88,	%i4
	fba	%fcc2,	loop_284
	alignaddr	%l2,	%l0,	%l4
	te	%xcc,	0x0
	ld	[%l7 + 0x10],	%f25
loop_284:
	movvs	%icc,	%o7,	%g6
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x44] %asi,	%g1
	srl	%g7,	%g3,	%o1
	array16	%o5,	%o6,	%g5
	addc	%i0,	%l5,	%i7
	fone	%f30
	ldsw	[%l7 + 0x70],	%o4
	fbug	%fcc2,	loop_285
	array32	%i1,	%l6,	%o3
	fmuld8ulx16	%f18,	%f15,	%f10
	set	0x60, %o3
	ldxa	[%l7 + %o3] 0x88,	%i6
loop_285:
	fand	%f18,	%f18,	%f6
	xorcc	%i2,	0x1FCC,	%g2
	bvc	%xcc,	loop_286
	addcc	%i5,	0x0EB7,	%g4
	movvc	%xcc,	%i3,	%l3
	umulcc	%o2,	%l1,	%o0
loop_286:
	xnorcc	%l2,	0x0136,	%i4
	set	0x3C, %g6
	sta	%f29,	[%l7 + %g6] 0x0c
	fmul8x16	%f4,	%f0,	%f16
	fcmpeq16	%f30,	%f8,	%l0
	move	%xcc,	%l4,	%o7
	fzeros	%f26
	alignaddrl	%g1,	%g6,	%g7
	edge16l	%o1,	%g3,	%o6
	set	0x3B, %g4
	ldsba	[%l7 + %g4] 0x80,	%g5
	array16	%i0,	%l5,	%i7
	set	0x30, %o6
	ldxa	[%l7 + %o6] 0x19,	%o5
	fblg,a	%fcc0,	loop_287
	fnot2	%f10,	%f10
	fmovdcs	%xcc,	%f29,	%f1
	fbn	%fcc0,	loop_288
loop_287:
	edge32l	%i1,	%o4,	%o3
	edge16n	%l6,	%i2,	%i6
	tpos	%xcc,	0x3
loop_288:
	sub	%g2,	%g4,	%i3
	and	%i5,	%l3,	%l1
	movrgz	%o0,	%l2,	%i4
	tne	%xcc,	0x1
	movgu	%xcc,	%o2,	%l0
	srl	%o7,	0x11,	%g1
	stbar
	tpos	%xcc,	0x7
	popc	%g6,	%g7
	movrlz	%l4,	0x165,	%g3
	tleu	%xcc,	0x0
	ta	%xcc,	0x0
	fcmps	%fcc2,	%f10,	%f26
	xnorcc	%o6,	0x0D29,	%o1
	siam	0x1
	tn	%xcc,	0x1
	bge	%icc,	loop_289
	movg	%xcc,	%i0,	%g5
	srl	%l5,	%i7,	%o5
	smul	%o4,	%o3,	%l6
loop_289:
	subcc	%i1,	%i6,	%i2
	ldub	[%l7 + 0x53],	%g2
	ldd	[%l7 + 0x60],	%f20
	sir	0x1C7F
	movrlez	%g4,	%i5,	%l3
	fcmpgt16	%f12,	%f26,	%l1
	fsrc2s	%f21,	%f28
	movcc	%xcc,	%o0,	%i3
	swap	[%l7 + 0x6C],	%l2
	fbl	%fcc3,	loop_290
	movg	%icc,	%i4,	%o2
	be,pt	%xcc,	loop_291
	fpack16	%f2,	%f15
loop_290:
	addccc	%l0,	0x1C19,	%o7
	tge	%icc,	0x5
loop_291:
	fbge	%fcc3,	loop_292
	st	%f13,	[%l7 + 0x5C]
	tle	%icc,	0x1
	srl	%g1,	%g7,	%l4
loop_292:
	array16	%g6,	%g3,	%o1
	ldd	[%l7 + 0x10],	%i0
	sdivx	%o6,	0x09CF,	%l5
	movne	%icc,	%i7,	%o5
	movrgez	%o4,	%g5,	%l6
	fnot2s	%f6,	%f23
	movl	%xcc,	%i1,	%o3
	edge8l	%i6,	%g2,	%g4
	fbne,a	%fcc0,	loop_293
	mova	%xcc,	%i5,	%l3
	fbu	%fcc2,	loop_294
	bne	loop_295
loop_293:
	stbar
	movrlez	%l1,	0x12B,	%o0
loop_294:
	brgez,a	%i3,	loop_296
loop_295:
	tgu	%icc,	0x2
	tleu	%icc,	0x6
	edge8l	%l2,	%i4,	%o2
loop_296:
	ldsw	[%l7 + 0x7C],	%i2
	fmovda	%xcc,	%f15,	%f2
	and	%l0,	0x1645,	%g1
	srlx	%o7,	0x12,	%l4
	fmovda	%xcc,	%f26,	%f22
	tne	%xcc,	0x5
	fpackfix	%f14,	%f29
	umul	%g7,	%g6,	%g3
	movcc	%icc,	%o1,	%o6
	umulcc	%l5,	0x0F88,	%i0
	orcc	%i7,	%o5,	%o4
	fmovdleu	%icc,	%f10,	%f11
	umulcc	%g5,	0x0228,	%l6
	fmovrse	%i1,	%f8,	%f8
	movpos	%xcc,	%o3,	%i6
	fmul8x16au	%f22,	%f2,	%f14
	tgu	%xcc,	0x5
	fmovrdgez	%g4,	%f14,	%f6
	edge32ln	%i5,	%l3,	%l1
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x24] %asi,	%o0
	edge16ln	%i3,	%l2,	%i4
	movrne	%g2,	%o2,	%l0
	bne,pn	%icc,	loop_297
	fpadd16	%f2,	%f28,	%f8
	movrlz	%g1,	%o7,	%l4
	tne	%icc,	0x4
loop_297:
	tvs	%icc,	0x3
	movle	%icc,	%i2,	%g6
	fone	%f14
	sllx	%g7,	%o1,	%g3
	fbue	%fcc3,	loop_298
	array16	%o6,	%l5,	%i7
	fbn,a	%fcc2,	loop_299
	fxors	%f30,	%f1,	%f2
loop_298:
	movn	%xcc,	%o5,	%o4
	brgez	%g5,	loop_300
loop_299:
	bpos,a,pn	%xcc,	loop_301
	fmovdvs	%xcc,	%f15,	%f15
	edge8n	%l6,	%i0,	%i1
loop_300:
	edge8ln	%o3,	%g4,	%i6
loop_301:
	brz	%l3,	loop_302
	fmovrslz	%l1,	%f28,	%f6
	addc	%o0,	%i3,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_302:
	ldd	[%l7 + 0x28],	%l2
	sllx	%g2,	0x02,	%i4
	edge8	%l0,	%o2,	%o7
	udivx	%g1,	0x1560,	%i2
	fands	%f2,	%f9,	%f22
	fmul8ulx16	%f0,	%f0,	%f0
	srl	%g6,	0x0E,	%l4
	andncc	%o1,	%g7,	%o6
	udivcc	%g3,	0x01EA,	%l5
	movrgez	%o5,	0x165,	%o4
	fmovdge	%xcc,	%f19,	%f15
	tn	%icc,	0x0
	sdivcc	%i7,	0x19E2,	%g5
	fbue	%fcc2,	loop_303
	movge	%xcc,	%i0,	%l6
	sir	0x00DA
	udiv	%i1,	0x1316,	%o3
loop_303:
	sra	%i6,	%g4,	%l1
	xnor	%o0,	0x1FC6,	%l3
	ta	%xcc,	0x7
	fpsub32	%f14,	%f26,	%f6
	brlz	%i3,	loop_304
	subc	%l2,	%i5,	%g2
	orn	%i4,	0x1375,	%o2
	fpadd16	%f20,	%f2,	%f22
loop_304:
	movrgez	%o7,	%g1,	%l0
	fpsub32s	%f2,	%f2,	%f17
	fmovrsgz	%i2,	%f31,	%f16
	movneg	%xcc,	%l4,	%o1
	fnors	%f3,	%f31,	%f18
	wr	%g0,	0x81,	%asi
	stba	%g7,	[%l7 + 0x28] %asi
	brgez,a	%g6,	loop_305
	edge32ln	%o6,	%g3,	%l5
	movge	%xcc,	%o5,	%o4
	fmovsn	%xcc,	%f20,	%f24
loop_305:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%xcc,	0x3
	srl	%g5,	%i0,	%l6
	andn	%i7,	0x046A,	%o3
	fmovsl	%icc,	%f4,	%f15
	fandnot2	%f18,	%f22,	%f20
	wr	%g0,	0x88,	%asi
	stda	%i0,	[%l7 + 0x78] %asi
	fpmerge	%f31,	%f12,	%f2
	sdiv	%g4,	0x0A71,	%l1
	movpos	%icc,	%o0,	%i6
	sdivcc	%l3,	0x1296,	%i3
	ldub	[%l7 + 0x6A],	%i5
	fba	%fcc3,	loop_306
	fcmpd	%fcc1,	%f16,	%f30
	sll	%l2,	%g2,	%i4
	movl	%icc,	%o2,	%o7
loop_306:
	umulcc	%l0,	0x13F5,	%g1
	edge8l	%i2,	%o1,	%l4
	subcc	%g6,	%o6,	%g3
	fnot1	%f6,	%f28
	movvs	%xcc,	%l5,	%o5
	fmovrde	%g7,	%f0,	%f12
	stw	%g5,	[%l7 + 0x08]
	ldsw	[%l7 + 0x50],	%o4
	fpack16	%f2,	%f0
	tvs	%xcc,	0x7
	fcmps	%fcc1,	%f29,	%f29
	edge8	%l6,	%i0,	%o3
	edge8n	%i7,	%g4,	%l1
	orncc	%o0,	%i6,	%i1
	tcc	%icc,	0x7
	fmuld8sux16	%f3,	%f3,	%f18
	fcmpgt16	%f24,	%f26,	%i3
	ldsh	[%l7 + 0x2C],	%i5
	fmovrsgez	%l3,	%f21,	%f28
	fmovdge	%icc,	%f4,	%f10
	mulscc	%g2,	0x1FB3,	%l2
	taddcc	%o2,	%o7,	%l0
	xnorcc	%i4,	0x0517,	%g1
	movneg	%xcc,	%o1,	%i2
	call	loop_307
	orn	%g6,	0x0AD5,	%o6
	edge8n	%l4,	%l5,	%o5
	tle	%xcc,	0x2
loop_307:
	fmovrslez	%g7,	%f28,	%f5
	addcc	%g5,	%g3,	%o4
	set	0x34, %l0
	sta	%f25,	[%l7 + %l0] 0x18
	fnot1s	%f26,	%f19
	fand	%f6,	%f28,	%f28
	fmovsa	%icc,	%f21,	%f20
	tneg	%xcc,	0x6
	edge8ln	%l6,	%i0,	%i7
	movrne	%o3,	%g4,	%l1
	movrlz	%i6,	%o0,	%i3
	array16	%i5,	%i1,	%g2
	movge	%icc,	%l2,	%l3
	subcc	%o2,	%o7,	%l0
	wr	%g0,	0x89,	%asi
	sta	%f31,	[%l7 + 0x7C] %asi
	fpsub32s	%f2,	%f31,	%f23
	fcmpgt32	%f2,	%f28,	%g1
	set	0x4C, %i0
	swapa	[%l7 + %i0] 0x81,	%o1
	nop
	set	0x78, %g3
	ldx	[%l7 + %g3],	%i2
	bvs,a,pt	%xcc,	loop_308
	ble	%icc,	loop_309
	alignaddr	%i4,	%o6,	%l4
	tg	%icc,	0x4
loop_308:
	bleu,pn	%xcc,	loop_310
loop_309:
	te	%icc,	0x4
	movcs	%xcc,	%l5,	%g6
	fmovrdgez	%o5,	%f12,	%f30
loop_310:
	movne	%icc,	%g7,	%g5
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x68] %asi,	%g3
	tgu	%xcc,	0x7
	fnegd	%f2,	%f24
	fbue,a	%fcc0,	loop_311
	xnorcc	%o4,	0x07D4,	%l6
	udivcc	%i7,	0x09BF,	%o3
	subcc	%i0,	%g4,	%l1
loop_311:
	te	%xcc,	0x4
	xorcc	%o0,	%i6,	%i5
	movpos	%xcc,	%i1,	%g2
	fpadd16	%f2,	%f4,	%f2
	array8	%i3,	%l3,	%o2
	wr	%g0,	0xe2,	%asi
	stwa	%o7,	[%l7 + 0x7C] %asi
	membar	#Sync
	fblg,a	%fcc1,	loop_312
	orncc	%l0,	0x03C2,	%l2
	tl	%icc,	0x3
	tne	%icc,	0x5
loop_312:
	movn	%xcc,	%o1,	%i2
	taddcc	%g1,	0x058C,	%o6
	ldd	[%l7 + 0x10],	%l4
	subccc	%i4,	%l5,	%o5
	fmovrde	%g7,	%f6,	%f10
	edge8	%g6,	%g3,	%g5
	tle	%xcc,	0x1
	swap	[%l7 + 0x54],	%o4
	set	0x64, %o7
	stwa	%i7,	[%l7 + %o7] 0x2a
	membar	#Sync
	sdiv	%o3,	0x1CF0,	%i0
	edge32ln	%g4,	%l1,	%o0
	bcc	loop_313
	srl	%i6,	%i5,	%i1
	edge8n	%g2,	%l6,	%i3
	fmovsne	%icc,	%f0,	%f18
loop_313:
	be,a,pt	%icc,	loop_314
	sllx	%o2,	%l3,	%l0
	sdivx	%o7,	0x1187,	%o1
	fabsd	%f4,	%f0
loop_314:
	nop
	set	0x0C, %o5
	lda	[%l7 + %o5] 0x88,	%f19
	fmovsg	%xcc,	%f28,	%f17
	bvc,pt	%icc,	loop_315
	movrlz	%l2,	0x377,	%i2
	tl	%icc,	0x7
	fmovrse	%g1,	%f24,	%f24
loop_315:
	movpos	%xcc,	%l4,	%o6
	fpsub16	%f10,	%f26,	%f16
	edge16n	%i4,	%l5,	%o5
	movrlez	%g7,	0x3BB,	%g6
	fandnot2s	%f14,	%f27,	%f30
	sub	%g3,	0x1597,	%o4
	tvs	%icc,	0x5
	alignaddr	%i7,	%o3,	%i0
	tpos	%xcc,	0x5
	addc	%g4,	0x19B7,	%g5
	srl	%l1,	0x0F,	%o0
	bcs,pt	%icc,	loop_316
	st	%f21,	[%l7 + 0x10]
	movg	%icc,	%i6,	%i5
	ta	%xcc,	0x4
loop_316:
	nop
	set	0x0C, %g2
	stwa	%g2,	[%l7 + %g2] 0x14
	movgu	%icc,	%i1,	%l6
	fpack32	%f12,	%f16,	%f6
	sth	%i3,	[%l7 + 0x34]
	sdivx	%l3,	0x1601,	%l0
	tpos	%icc,	0x7
	brlz,a	%o7,	loop_317
	andcc	%o2,	0x1AD5,	%o1
	bshuffle	%f8,	%f26,	%f26
	sub	%i2,	%l2,	%l4
loop_317:
	nop
	set	0x40, %l5
	lduba	[%l7 + %l5] 0x11,	%o6
	membar	0x32
	movvs	%xcc,	%g1,	%i4
	udiv	%l5,	0x1AAB,	%o5
	udiv	%g6,	0x08F5,	%g7
	movrgez	%o4,	%i7,	%o3
	ldsw	[%l7 + 0x7C],	%g3
	ldx	[%l7 + 0x20],	%g4
	sth	%i0,	[%l7 + 0x64]
	prefetch	[%l7 + 0x38],	 0x0
	edge16n	%l1,	%g5,	%i6
	movle	%icc,	%i5,	%g2
	xnorcc	%i1,	%o0,	%i3
	move	%icc,	%l6,	%l0
	fmovrde	%o7,	%f30,	%f2
	lduw	[%l7 + 0x70],	%l3
	fandnot1s	%f1,	%f6,	%f3
	xnor	%o1,	0x1C59,	%i2
	sdivcc	%l2,	0x0282,	%o2
	udivx	%o6,	0x162A,	%g1
	brnz,a	%l4,	loop_318
	sir	0x1AFD
	bvs,a	loop_319
	array32	%i4,	%o5,	%g6
loop_318:
	membar	0x0D
	edge8n	%g7,	%l5,	%i7
loop_319:
	fxor	%f20,	%f26,	%f22
	tcc	%icc,	0x6
	fandnot1s	%f3,	%f30,	%f22
	xor	%o3,	0x193F,	%g3
	edge32n	%g4,	%o4,	%l1
	sra	%g5,	0x17,	%i0
	fmul8ulx16	%f2,	%f26,	%f0
	movleu	%xcc,	%i5,	%g2
	fmovsg	%icc,	%f11,	%f29
	stw	%i1,	[%l7 + 0x50]
	movcs	%xcc,	%o0,	%i6
	movrgz	%i3,	0x21B,	%l0
	ldub	[%l7 + 0x2D],	%o7
	fmovdn	%xcc,	%f27,	%f10
	fnand	%f0,	%f2,	%f30
	set	0x30, %g1
	ldda	[%l7 + %g1] 0xe3,	%l2
	tpos	%icc,	0x6
	fmovrslez	%l6,	%f10,	%f13
	movleu	%icc,	%i2,	%l2
	fmul8sux16	%f28,	%f22,	%f18
	fmovsn	%icc,	%f25,	%f15
	movneg	%icc,	%o1,	%o2
	sdiv	%o6,	0x0EC1,	%g1
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	subc	%l4,	0x1FB5,	%i4
	tsubcctv	%g6,	%o5,	%l5
	sub	%g7,	%i7,	%g3
	fandnot2s	%f31,	%f17,	%f6
	tleu	%icc,	0x3
	movgu	%xcc,	%o3,	%g4
	fone	%f12
	bneg	loop_320
	xnorcc	%l1,	%o4,	%i0
	orncc	%g5,	%i5,	%i1
	array16	%o0,	%g2,	%i3
loop_320:
	tn	%icc,	0x7
	addccc	%l0,	%i6,	%l3
	stbar
	edge16	%o7,	%i2,	%l2
	subcc	%l6,	%o2,	%o1
	mova	%xcc,	%g1,	%o6
	movcs	%xcc,	%i4,	%g6
	movvs	%icc,	%l4,	%o5
	taddcc	%g7,	%i7,	%g3
	brgz	%l5,	loop_321
	fmovs	%f11,	%f24
	brgz,a	%o3,	loop_322
	andcc	%l1,	%o4,	%g4
loop_321:
	fmovrdlez	%i0,	%f22,	%f14
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf0
	membar	#Sync
loop_322:
	alignaddr	%g5,	%i5,	%i1
	mulx	%g2,	%o0,	%l0
	fmovscc	%xcc,	%f19,	%f10
	brnz	%i3,	loop_323
	sdiv	%i6,	0x1633,	%o7
	fabss	%f30,	%f2
	fmovrslz	%i2,	%f21,	%f9
loop_323:
	addccc	%l2,	%l3,	%l6
	movneg	%xcc,	%o2,	%g1
	fble	%fcc3,	loop_324
	fmovsvc	%icc,	%f21,	%f21
	fmovsg	%icc,	%f17,	%f31
	movg	%xcc,	%o1,	%o6
loop_324:
	fbo	%fcc3,	loop_325
	xorcc	%i4,	%l4,	%o5
	sllx	%g6,	0x16,	%g7
	movrlz	%g3,	0x2EE,	%l5
loop_325:
	fbue	%fcc3,	loop_326
	udivx	%i7,	0x0B65,	%l1
	fmovda	%xcc,	%f24,	%f24
	movle	%icc,	%o3,	%g4
loop_326:
	te	%xcc,	0x7
	brlz,a	%i0,	loop_327
	nop
	set	0x46, %l4
	ldub	[%l7 + %l4],	%o4
	movl	%xcc,	%g5,	%i1
	movcc	%xcc,	%g2,	%i5
loop_327:
	xnorcc	%l0,	0x0053,	%i3
	andn	%o0,	0x135D,	%o7
	movrgez	%i6,	0x375,	%i2
	fnegd	%f24,	%f8
	sethi	0x165E,	%l3
	movge	%xcc,	%l2,	%o2
	umulcc	%l6,	%o1,	%o6
	edge8	%g1,	%i4,	%o5
	std	%f26,	[%l7 + 0x20]
	edge8ln	%l4,	%g7,	%g6
	fabss	%f7,	%f11
	array8	%l5,	%i7,	%l1
	fone	%f24
	brgz	%o3,	loop_328
	array8	%g3,	%g4,	%o4
	te	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	sta	%f22,	[%l7 + 0x0C] %asi
loop_328:
	fmovrse	%i0,	%f20,	%f2
	mova	%icc,	%i1,	%g2
	fbo	%fcc1,	loop_329
	fmovscc	%icc,	%f30,	%f2
	fbge,a	%fcc0,	loop_330
	addccc	%i5,	0x1E8D,	%l0
loop_329:
	bpos,a,pn	%icc,	loop_331
	bneg	%icc,	loop_332
loop_330:
	fbg	%fcc0,	loop_333
	fble	%fcc1,	loop_334
loop_331:
	addc	%g5,	%i3,	%o0
loop_332:
	fmovsl	%xcc,	%f18,	%f24
loop_333:
	fbn,a	%fcc1,	loop_335
loop_334:
	edge16l	%i6,	%i2,	%l3
	array16	%l2,	%o2,	%l6
	taddcc	%o7,	%o6,	%g1
loop_335:
	array16	%o1,	%i4,	%o5
	fzeros	%f14
	fnot2	%f6,	%f30
	fpack16	%f14,	%f28
	fmovscs	%xcc,	%f10,	%f22
	popc	0x0F47,	%l4
	bgu,pt	%icc,	loop_336
	fblg	%fcc0,	loop_337
	fbe	%fcc2,	loop_338
	mova	%icc,	%g6,	%g7
loop_336:
	nop
	set	0x3C, %i2
	sta	%f17,	[%l7 + %i2] 0x11
loop_337:
	fand	%f18,	%f18,	%f18
loop_338:
	fone	%f16
	addccc	%l5,	0x1D34,	%i7
	fbuge,a	%fcc3,	loop_339
	movne	%xcc,	%o3,	%g3
	tcc	%icc,	0x2
	nop
	setx	loop_340,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_339:
	movrne	%l1,	0x368,	%o4
	srl	%i0,	0x12,	%g4
	nop
	setx	loop_341,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_340:
	fand	%f18,	%f10,	%f26
	fmul8x16au	%f19,	%f11,	%f26
	ta	%icc,	0x0
loop_341:
	udivx	%g2,	0x1307,	%i5
	edge8	%i1,	%l0,	%i3
	subcc	%o0,	0x19D9,	%i6
	tsubcc	%i2,	0x045D,	%l3
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x11,	%f16
	andncc	%g5,	%o2,	%l6
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf9,	%f16
	movle	%icc,	%l2,	%o6
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%g1
	smulcc	%o7,	%o1,	%i4
	tneg	%xcc,	0x2
	array8	%o5,	%l4,	%g6
	fpadd16	%f10,	%f2,	%f8
	fmovdle	%icc,	%f15,	%f5
	sdivx	%g7,	0x08E4,	%i7
	edge32	%o3,	%l5,	%l1
	fbul	%fcc0,	loop_342
	std	%g2,	[%l7 + 0x68]
	edge8l	%o4,	%g4,	%g2
	edge16ln	%i0,	%i5,	%i1
loop_342:
	tle	%icc,	0x0
	xor	%i3,	%l0,	%i6
	stx	%i2,	[%l7 + 0x10]
	tsubcctv	%o0,	0x0376,	%l3
	tl	%xcc,	0x4
	sll	%g5,	%l6,	%o2
	ta	%icc,	0x7
	ld	[%l7 + 0x48],	%f29
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x50] %asi,	%l2
	tn	%xcc,	0x4
	bshuffle	%f16,	%f16,	%f26
	fornot2	%f28,	%f8,	%f2
	tsubcc	%g1,	0x11DD,	%o6
	subcc	%o7,	0x10DF,	%o1
	movle	%icc,	%o5,	%l4
	fnot2	%f0,	%f22
	fandnot2	%f28,	%f18,	%f10
	tle	%xcc,	0x5
	bcc	loop_343
	fbul	%fcc3,	loop_344
	fmovscs	%icc,	%f17,	%f7
	mulx	%i4,	0x1CAC,	%g6
loop_343:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x18] %asi,	%i7
loop_344:
	udivx	%g7,	0x17E3,	%o3
	sll	%l1,	0x03,	%l5
	array32	%g3,	%o4,	%g4
	edge16l	%g2,	%i5,	%i0
	alignaddr	%i3,	%i1,	%i6
	alignaddr	%l0,	%i2,	%o0
	alignaddrl	%l3,	%g5,	%o2
	sub	%l6,	0x1B0D,	%l2
	array32	%o6,	%g1,	%o7
	nop
	set	0x44, %i3
	lduw	[%l7 + %i3],	%o5
	set	0x78, %i4
	lda	[%l7 + %i4] 0x04,	%f1
	fmovdcs	%xcc,	%f23,	%f2
	stw	%l4,	[%l7 + 0x18]
	addcc	%i4,	0x1D88,	%g6
	umulcc	%o1,	%g7,	%i7
	addc	%o3,	%l5,	%l1
	mova	%icc,	%o4,	%g3
	nop
	set	0x28, %l1
	std	%g4,	[%l7 + %l1]
	fmovrdlz	%i5,	%f14,	%f4
	sir	0x0A5A
	edge16ln	%g2,	%i0,	%i1
	fpmerge	%f2,	%f23,	%f14
	tl	%xcc,	0x5
	movl	%icc,	%i3,	%i6
	fnegs	%f29,	%f0
	fmovrse	%l0,	%f31,	%f2
	movg	%xcc,	%o0,	%l3
	fmovsneg	%xcc,	%f7,	%f7
	fpsub16	%f2,	%f2,	%f2
	xorcc	%g5,	%i2,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o2,	%o6,	%g1
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	stx	%o7,	[%l7 + 0x18]
	bpos,a	loop_345
	edge32	%l2,	%l4,	%o5
	prefetch	[%l7 + 0x54],	 0x2
	tcc	%xcc,	0x5
loop_345:
	umulcc	%g6,	%i4,	%o1
	sub	%g7,	%i7,	%o3
	sllx	%l1,	0x00,	%l5
	ldsb	[%l7 + 0x35],	%g3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x3E] %asi,	%g4
	movg	%icc,	%o4,	%g2
	alignaddr	%i0,	%i5,	%i3
	tn	%xcc,	0x7
	edge16ln	%i6,	%l0,	%o0
	edge16	%l3,	%i1,	%g5
	udivx	%i2,	0x0A5F,	%o2
	stx	%o6,	[%l7 + 0x38]
	ldstub	[%l7 + 0x0C],	%l6
	andn	%g1,	0x0266,	%o7
	wr	%g0,	0x23,	%asi
	stha	%l2,	[%l7 + 0x6E] %asi
	membar	#Sync
	fpadd16s	%f0,	%f21,	%f16
	fmovscs	%xcc,	%f4,	%f11
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x64] %asi,	%l4
	srl	%o5,	%i4,	%o1
	edge8ln	%g7,	%g6,	%o3
	wr	%g0,	0x11,	%asi
	ldsba	[%l7 + 0x50] %asi,	%i7
	tneg	%icc,	0x0
	andn	%l1,	0x1D30,	%l5
	movg	%xcc,	%g3,	%o4
	movle	%xcc,	%g4,	%i0
	fmovrdgez	%g2,	%f6,	%f26
	orncc	%i3,	%i5,	%l0
	edge8l	%i6,	%l3,	%i1
	flush	%l7 + 0x60
	sub	%o0,	%g5,	%o2
	set	0x40, %o4
	stxa	%i2,	[%l7 + %o4] 0x81
	set	0x78, %g5
	lda	[%l7 + %g5] 0x11,	%f26
	sllx	%o6,	0x11,	%g1
	brlez	%l6,	loop_346
	fxors	%f17,	%f27,	%f3
	srl	%o7,	0x15,	%l2
	tge	%xcc,	0x2
loop_346:
	edge32l	%l4,	%o5,	%i4
	movrlez	%g7,	0x137,	%o1
	membar	0x36
	movvs	%icc,	%g6,	%o3
	fpsub16s	%f23,	%f8,	%f2
	fandnot1	%f10,	%f20,	%f18
	edge32ln	%l1,	%l5,	%g3
	membar	0x0A
	fbul	%fcc2,	loop_347
	mulx	%i7,	0x0B10,	%o4
	movre	%i0,	0x24C,	%g2
	brlez	%g4,	loop_348
loop_347:
	sir	0x19FA
	andcc	%i3,	%i5,	%i6
	fmovse	%icc,	%f20,	%f15
loop_348:
	fba	%fcc3,	loop_349
	orncc	%l3,	%i1,	%l0
	umulcc	%o0,	0x0D3D,	%g5
	ld	[%l7 + 0x5C],	%f4
loop_349:
	st	%f16,	[%l7 + 0x58]
	sdivcc	%o2,	0x0DF1,	%i2
	fbg	%fcc0,	loop_350
	movne	%icc,	%o6,	%g1
	mova	%xcc,	%l6,	%o7
	lduw	[%l7 + 0x7C],	%l4
loop_350:
	fbo	%fcc3,	loop_351
	xnor	%l2,	0x086F,	%o5
	subcc	%g7,	%i4,	%o1
	smulcc	%g6,	%o3,	%l1
loop_351:
	fnands	%f11,	%f0,	%f29
	fpsub16s	%f23,	%f7,	%f21
	sll	%g3,	%i7,	%l5
	orcc	%o4,	0x0E5C,	%g2
	movpos	%xcc,	%i0,	%i3
	fcmps	%fcc0,	%f17,	%f14
	fsrc1s	%f17,	%f5
	movl	%icc,	%g4,	%i5
	movvs	%xcc,	%l3,	%i1
	movre	%i6,	0x1C7,	%l0
	srl	%g5,	0x1A,	%o2
	fpadd16	%f0,	%f22,	%f6
	edge32l	%i2,	%o6,	%g1
	tneg	%icc,	0x0
	ble,a	loop_352
	sll	%o0,	0x04,	%o7
	fpadd16	%f20,	%f2,	%f0
	sra	%l4,	0x15,	%l2
loop_352:
	te	%icc,	0x2
	or	%l6,	0x0536,	%g7
	nop
	setx loop_353, %l0, %l1
	jmpl %l1, %o5
	brlez	%i4,	loop_354
	umulcc	%o1,	0x1B8F,	%g6
	movrgz	%o3,	%g3,	%i7
loop_353:
	edge8n	%l1,	%o4,	%l5
loop_354:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f2,	[%l7 + 0x10] %asi
	addc	%g2,	%i0,	%i3
	addc	%g4,	%l3,	%i5
	sir	0x1B4B
	fsrc2	%f20,	%f30
	stbar
	fandnot1	%f12,	%f2,	%f12
	fbe,a	%fcc2,	loop_355
	ldsw	[%l7 + 0x20],	%i1
	movn	%xcc,	%i6,	%l0
	set	0x50, %i5
	ldda	[%l7 + %i5] 0x0c,	%o2
loop_355:
	edge16l	%g5,	%i2,	%g1
	move	%xcc,	%o0,	%o7
	bvs	%icc,	loop_356
	tcc	%xcc,	0x4
	fpack32	%f28,	%f12,	%f16
	sra	%o6,	0x09,	%l4
loop_356:
	sethi	0x17BD,	%l6
	std	%l2,	[%l7 + 0x38]
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	array32	%i4,	%o1,	%g7
	fmovde	%xcc,	%f6,	%f23
	addc	%o3,	%g3,	%i7
	bne,pt	%xcc,	loop_357
	fbuge,a	%fcc0,	loop_358
	fsrc2	%f2,	%f2
	or	%l1,	%o4,	%g6
loop_357:
	movvs	%icc,	%l5,	%i0
loop_358:
	movvc	%xcc,	%i3,	%g4
	edge32l	%g2,	%l3,	%i5
	ldx	[%l7 + 0x38],	%i1
	nop
	set	0x2E, %l2
	ldsh	[%l7 + %l2],	%l0
	fmovsneg	%icc,	%f12,	%f18
	sethi	0x15BF,	%i6
	bcc,a	%xcc,	loop_359
	edge32	%o2,	%g5,	%g1
	movvs	%xcc,	%i2,	%o0
	add	%o7,	0x09A0,	%l4
loop_359:
	fbu,a	%fcc0,	loop_360
	udivcc	%o6,	0x02D2,	%l6
	array16	%l2,	%i4,	%o5
	or	%o1,	0x0B08,	%o3
loop_360:
	mulscc	%g3,	0x1315,	%i7
	tvc	%icc,	0x5
	edge8n	%g7,	%o4,	%g6
	smul	%l5,	%i0,	%l1
	mova	%icc,	%i3,	%g4
	brz,a	%l3,	loop_361
	xor	%g2,	%i1,	%l0
	movl	%xcc,	%i6,	%i5
	tgu	%xcc,	0x5
loop_361:
	tsubcctv	%o2,	0x0956,	%g1
	popc	0x1833,	%g5
	orcc	%o0,	0x075A,	%o7
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x64] %asi,	%f18
	fbo	%fcc0,	loop_362
	fzero	%f16
	fbe	%fcc0,	loop_363
	andn	%l4,	%i2,	%l6
loop_362:
	edge16	%o6,	%l2,	%o5
	brgz,a	%i4,	loop_364
loop_363:
	edge32	%o3,	%g3,	%i7
	fxor	%f24,	%f4,	%f4
	fnors	%f27,	%f3,	%f23
loop_364:
	bg	loop_365
	bpos,a,pn	%xcc,	loop_366
	tcc	%xcc,	0x0
	fmovscs	%xcc,	%f1,	%f28
loop_365:
	tsubcctv	%g7,	0x0E6F,	%o1
loop_366:
	subc	%o4,	0x0247,	%l5
	fsrc1s	%f7,	%f24
	movl	%xcc,	%i0,	%g6
	ta	%xcc,	0x4
	fbl	%fcc2,	loop_367
	edge32	%i3,	%g4,	%l3
	fpsub16	%f18,	%f30,	%f4
	fnot2	%f12,	%f4
loop_367:
	taddcc	%g2,	%i1,	%l0
	andncc	%i6,	%i5,	%l1
	bg,a	loop_368
	fbe,a	%fcc1,	loop_369
	movg	%icc,	%g1,	%o2
	fbuge	%fcc0,	loop_370
loop_368:
	fbl	%fcc2,	loop_371
loop_369:
	movrlz	%g5,	%o7,	%o0
	fpadd16s	%f30,	%f11,	%f6
loop_370:
	be	loop_372
loop_371:
	movleu	%xcc,	%l4,	%i2
	fcmple16	%f16,	%f16,	%l6
	movge	%icc,	%l2,	%o6
loop_372:
	nop
	wr	%g0,	0x88,	%asi
	sta	%f28,	[%l7 + 0x68] %asi
	ble	%icc,	loop_373
	fpsub16	%f16,	%f30,	%f14
	movrgz	%i4,	0x190,	%o5
	movg	%xcc,	%o3,	%i7
loop_373:
	fmovrdne	%g7,	%f20,	%f18
	sdivx	%g3,	0x134F,	%o1
	fmovrsgz	%o4,	%f15,	%f23
	alignaddrl	%i0,	%l5,	%g6
	tgu	%xcc,	0x3
	fbuge	%fcc0,	loop_374
	fbn,a	%fcc3,	loop_375
	fmuld8ulx16	%f9,	%f1,	%f16
	fba,a	%fcc2,	loop_376
loop_374:
	tg	%icc,	0x7
loop_375:
	nop
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x04
loop_376:
	lduh	[%l7 + 0x3A],	%i3
	stw	%l3,	[%l7 + 0x24]
	movrne	%g4,	%g2,	%i1
	fzero	%f4
	fones	%f10
	tsubcc	%l0,	%i5,	%l1
	tneg	%icc,	0x2
	bn,a,pt	%xcc,	loop_377
	xnor	%i6,	0x1197,	%g1
	subccc	%g5,	%o2,	%o7
	tne	%icc,	0x2
loop_377:
	mova	%xcc,	%o0,	%i2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f8
	movcc	%icc,	%l6,	%l2
	fbge,a	%fcc0,	loop_378
	ble,a,pt	%icc,	loop_379
	subc	%l4,	%o6,	%o5
	tneg	%xcc,	0x1
loop_378:
	fmovsne	%icc,	%f28,	%f23
loop_379:
	srl	%i4,	%i7,	%g7
	bshuffle	%f12,	%f28,	%f4
	te	%icc,	0x7
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x2E] %asi,	%o3
	fornot2s	%f23,	%f14,	%f23
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%g3
	movrlez	%o4,	0x237,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz	%i0,	loop_380
	tsubcc	%i3,	0x1E43,	%g6
	movgu	%xcc,	%l3,	%g2
	tvc	%icc,	0x7
loop_380:
	bl	%icc,	loop_381
	fandnot1s	%f30,	%f25,	%f14
	array8	%g4,	%i1,	%i5
	nop
	setx	loop_382,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_381:
	xorcc	%l0,	%i6,	%l1
	fnegd	%f10,	%f20
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x0c,	%g1,	%o2
loop_382:
	movne	%xcc,	%g5,	%o7
	fand	%f16,	%f18,	%f18
	fbu,a	%fcc3,	loop_383
	pdist	%f8,	%f8,	%f16
	bl	%icc,	loop_384
	tle	%xcc,	0x0
loop_383:
	nop
	set	0x0A, %i1
	ldsba	[%l7 + %i1] 0x10,	%i2
loop_384:
	fmovrdlz	%l6,	%f8,	%f2
	sra	%o0,	%l4,	%o6
	movrne	%o5,	%i4,	%l2
	membar	0x7A
	be,a	%xcc,	loop_385
	edge32	%g7,	%o3,	%o1
	bvc,pn	%icc,	loop_386
	siam	0x0
loop_385:
	fcmpeq32	%f26,	%f16,	%i7
	sll	%o4,	0x15,	%l5
loop_386:
	edge8n	%i0,	%g3,	%i3
	smulcc	%l3,	0x1B14,	%g6
	fpackfix	%f18,	%f16
	tleu	%icc,	0x2
	fmovsn	%xcc,	%f1,	%f1
	fxnor	%f14,	%f4,	%f0
	edge8l	%g2,	%i1,	%g4
	tle	%xcc,	0x5
	fmul8x16al	%f0,	%f5,	%f30
	andncc	%i5,	%l0,	%l1
	edge16l	%i6,	%g1,	%g5
	smulcc	%o2,	%o7,	%l6
	movge	%icc,	%o0,	%l4
	edge8	%o6,	%o5,	%i2
	fmovsgu	%icc,	%f9,	%f9
	tvs	%xcc,	0x3
	udivcc	%l2,	0x113C,	%g7
	swap	[%l7 + 0x68],	%o3
	movg	%icc,	%o1,	%i4
	sllx	%o4,	%i7,	%l5
	st	%f6,	[%l7 + 0x48]
	fnand	%f8,	%f4,	%f12
	mulscc	%i0,	0x1B97,	%i3
	or	%g3,	0x0898,	%g6
	fbe	%fcc3,	loop_387
	edge8	%g2,	%i1,	%l3
	brz,a	%g4,	loop_388
	sllx	%l0,	0x1A,	%l1
loop_387:
	sdiv	%i5,	0x10E6,	%g1
	set	0x33, %i7
	stba	%i6,	[%l7 + %i7] 0x23
	membar	#Sync
loop_388:
	sth	%g5,	[%l7 + 0x7E]
	fbue	%fcc0,	loop_389
	and	%o7,	0x11B9,	%o2
	fornot2	%f16,	%f30,	%f2
	bge,a	loop_390
loop_389:
	pdist	%f30,	%f22,	%f24
	tvc	%icc,	0x7
	ldstub	[%l7 + 0x6D],	%o0
loop_390:
	fornot2s	%f7,	%f5,	%f8
	fabss	%f23,	%f15
	sir	0x0D03
	or	%l6,	%o6,	%l4
	alignaddr	%o5,	%l2,	%i2
	edge32l	%g7,	%o1,	%i4
	srax	%o4,	%i7,	%o3
	movcc	%xcc,	%i0,	%i3
	addccc	%l5,	0x04F4,	%g3
	std	%g6,	[%l7 + 0x50]
	srl	%g2,	0x1E,	%l3
	taddcc	%g4,	%i1,	%l0
	ble	loop_391
	bleu,a,pn	%xcc,	loop_392
	fnot1	%f26,	%f24
	tsubcctv	%i5,	0x05DD,	%g1
loop_391:
	edge16l	%l1,	%i6,	%o7
loop_392:
	fbn,a	%fcc0,	loop_393
	move	%icc,	%g5,	%o0
	fmul8x16au	%f28,	%f13,	%f28
	sethi	0x1539,	%l6
loop_393:
	fbg	%fcc0,	loop_394
	movcs	%xcc,	%o2,	%o6
	bleu	loop_395
	smulcc	%l4,	0x08A9,	%l2
loop_394:
	movn	%xcc,	%i2,	%g7
	ba	loop_396
loop_395:
	subccc	%o5,	0x1EDC,	%o1
	edge16	%o4,	%i4,	%o3
	or	%i0,	%i7,	%l5
loop_396:
	addcc	%g3,	%i3,	%g2
	array32	%l3,	%g6,	%i1
	fnot2s	%f7,	%f19
	movgu	%xcc,	%g4,	%l0
	edge16	%g1,	%i5,	%i6
	fbue,a	%fcc3,	loop_397
	orncc	%l1,	0x11C3,	%o7
	fmovsne	%xcc,	%f25,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_397:
	bneg,pt	%icc,	loop_398
	edge8l	%g5,	%o0,	%o2
	andncc	%l6,	%o6,	%l2
	andncc	%l4,	%g7,	%i2
loop_398:
	movvs	%icc,	%o1,	%o4
	srax	%i4,	0x08,	%o5
	xnorcc	%i0,	%o3,	%i7
	brz,a	%l5,	loop_399
	edge32ln	%g3,	%i3,	%g2
	st	%f7,	[%l7 + 0x10]
	mulscc	%g6,	%i1,	%l3
loop_399:
	udivcc	%l0,	0x18DA,	%g1
	fpsub32s	%f4,	%f4,	%f28
	sdivx	%g4,	0x14D3,	%i5
	sethi	0x0F87,	%i6
	tleu	%xcc,	0x3
	fmovrsne	%l1,	%f10,	%f27
	andn	%g5,	%o7,	%o0
	tgu	%xcc,	0x3
	umul	%l6,	%o6,	%o2
	edge8l	%l2,	%l4,	%i2
	smulcc	%g7,	%o4,	%o1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x64] %asi,	%f10
	wr	%g0,	0xe2,	%asi
	stxa	%i4,	[%l7 + 0x48] %asi
	membar	#Sync
	tvs	%xcc,	0x2
	movvs	%icc,	%o5,	%i0
	nop
	set	0x39, %o2
	stb	%i7,	[%l7 + %o2]
	fcmple16	%f2,	%f28,	%l5
	sdivcc	%o3,	0x0E70,	%g3
	srax	%g2,	%i3,	%i1
	tcc	%icc,	0x0
	ld	[%l7 + 0x10],	%f4
	fmovdn	%icc,	%f24,	%f31
	bcs,pn	%xcc,	loop_400
	ba,a	loop_401
	tgu	%icc,	0x0
	andncc	%g6,	%l3,	%l0
loop_400:
	fmovscc	%xcc,	%f9,	%f29
loop_401:
	sth	%g4,	[%l7 + 0x14]
	alignaddrl	%g1,	%i6,	%i5
	array32	%g5,	%o7,	%o0
	fnegs	%f20,	%f30
	movle	%xcc,	%l1,	%l6
	sdivx	%o2,	0x1457,	%o6
	fmovda	%xcc,	%f21,	%f0
	movrne	%l4,	%i2,	%l2
	for	%f2,	%f12,	%f12
	fmuld8sux16	%f20,	%f13,	%f28
	alignaddr	%g7,	%o4,	%o1
	wr	%g0,	0xeb,	%asi
	stda	%o4,	[%l7 + 0x50] %asi
	membar	#Sync
	addccc	%i4,	0x177E,	%i0
	mulscc	%l5,	0x1852,	%i7
	nop
	setx	loop_402,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmuld8ulx16	%f17,	%f29,	%f16
	fmovsvs	%icc,	%f1,	%f6
	fbul,a	%fcc0,	loop_403
loop_402:
	fsrc1	%f6,	%f0
	tn	%icc,	0x2
	nop
	set	0x08, %o1
	ldsw	[%l7 + %o1],	%o3
loop_403:
	movg	%icc,	%g2,	%i3
	sra	%g3,	0x18,	%g6
	fmuld8ulx16	%f21,	%f5,	%f28
	fmovdcc	%icc,	%f22,	%f15
	mulx	%i1,	%l3,	%g4
	subccc	%l0,	%g1,	%i6
	brnz	%i5,	loop_404
	mova	%icc,	%o7,	%g5
	xnorcc	%l1,	%l6,	%o2
	tneg	%icc,	0x0
loop_404:
	ba,pn	%xcc,	loop_405
	movge	%icc,	%o0,	%o6
	fbn	%fcc2,	loop_406
	fmovscs	%xcc,	%f0,	%f16
loop_405:
	fmovsa	%xcc,	%f4,	%f15
	popc	%i2,	%l4
loop_406:
	movvc	%icc,	%l2,	%o4
	fpack32	%f4,	%f2,	%f16
	fmovdcc	%xcc,	%f22,	%f20
	xnorcc	%o1,	0x1009,	%o5
	be,pt	%xcc,	loop_407
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i4,	%i0,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_407:
	movpos	%xcc,	%l5,	%i7
	brnz	%o3,	loop_408
	movneg	%icc,	%i3,	%g2
	xor	%g6,	0x05B9,	%g3
	movneg	%icc,	%i1,	%l3
loop_408:
	ta	%icc,	0x3
	fbule,a	%fcc3,	loop_409
	tsubcc	%g4,	%l0,	%i6
	edge16ln	%g1,	%i5,	%o7
	fbe,a	%fcc3,	loop_410
loop_409:
	smulcc	%g5,	0x1F56,	%l1
	movgu	%xcc,	%o2,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_410:
	addccc	%o6,	0x0F40,	%i2
	tsubcc	%o0,	0x0817,	%l4
	wr	%g0,	0xea,	%asi
	stba	%l2,	[%l7 + 0x43] %asi
	membar	#Sync
	udiv	%o1,	0x0075,	%o4
	sir	0x0D3C
	movre	%o5,	%i4,	%g7
	mulx	%i0,	0x0E2C,	%i7
	bvs	loop_411
	movge	%xcc,	%l5,	%o3
	movgu	%xcc,	%g2,	%g6
	sub	%i3,	%g3,	%l3
loop_411:
	prefetch	[%l7 + 0x38],	 0x0
	be	loop_412
	fmovdl	%icc,	%f28,	%f13
	taddcc	%g4,	%l0,	%i1
	andncc	%i6,	%g1,	%o7
loop_412:
	addccc	%i5,	0x10C7,	%g5
	set	0x54, %l6
	swapa	[%l7 + %l6] 0x19,	%l1
	movrlz	%l6,	%o6,	%o2
	tleu	%xcc,	0x4
	movn	%icc,	%o0,	%i2
	fbo,a	%fcc0,	loop_413
	xnorcc	%l4,	0x02D6,	%l2
	edge8n	%o1,	%o4,	%i4
	edge8l	%o5,	%g7,	%i7
loop_413:
	fmovscs	%icc,	%f12,	%f8
	bvs,a	%xcc,	loop_414
	movn	%icc,	%i0,	%o3
	fabss	%f20,	%f6
	tgu	%icc,	0x4
loop_414:
	ldsw	[%l7 + 0x3C],	%l5
	fmovrsgez	%g2,	%f31,	%f24
	set	0x22, %g6
	lduba	[%l7 + %g6] 0x89,	%i3
	fmul8x16al	%f20,	%f31,	%f26
	or	%g3,	%g6,	%l3
	mulscc	%g4,	%l0,	%i6
	alignaddr	%g1,	%i1,	%i5
	movleu	%icc,	%g5,	%l1
	fbug	%fcc1,	loop_415
	mulx	%o7,	0x016C,	%l6
	fbue	%fcc0,	loop_416
	movrne	%o6,	0x148,	%o0
loop_415:
	and	%o2,	%i2,	%l4
	srl	%o1,	%o4,	%i4
loop_416:
	nop
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x81,	%o5
	fbug	%fcc2,	loop_417
	bvc,pn	%xcc,	loop_418
	movge	%xcc,	%l2,	%i7
	fbue	%fcc3,	loop_419
loop_417:
	add	%i0,	%o3,	%g7
loop_418:
	fnands	%f19,	%f2,	%f6
	tsubcc	%l5,	0x0498,	%g2
loop_419:
	movvc	%xcc,	%i3,	%g3
	movvc	%xcc,	%l3,	%g4
	edge16ln	%l0,	%g6,	%g1
	fmovscs	%xcc,	%f1,	%f4
	addcc	%i1,	%i5,	%g5
	sdiv	%i6,	0x1DA3,	%l1
	brnz,a	%l6,	loop_420
	te	%xcc,	0x7
	set	0x78, %o6
	sta	%f15,	[%l7 + %o6] 0x15
loop_420:
	bvc,a,pt	%icc,	loop_421
	tle	%icc,	0x0
	edge16ln	%o7,	%o0,	%o6
	subcc	%o2,	0x0EDB,	%i2
loop_421:
	movrgez	%l4,	0x25B,	%o4
	te	%icc,	0x4
	movle	%xcc,	%o1,	%o5
	smulcc	%i4,	%i7,	%l2
	tg	%xcc,	0x0
	sdivcc	%i0,	0x05EE,	%g7
	sra	%o3,	%l5,	%g2
	fbn	%fcc2,	loop_422
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x40] %asi,	%i3
loop_422:
	bn,a	loop_423
	bgu,a,pt	%xcc,	loop_424
	lduh	[%l7 + 0x22],	%g3
	array8	%g4,	%l0,	%g6
loop_423:
	ta	%icc,	0x2
loop_424:
	fpadd32	%f18,	%f2,	%f20
	bn,pn	%icc,	loop_425
	smul	%g1,	%l3,	%i5
	array32	%g5,	%i1,	%l1
	or	%l6,	0x0327,	%i6
loop_425:
	smul	%o7,	%o6,	%o2
	mulx	%i2,	0x1050,	%l4
	fpackfix	%f24,	%f20
	addc	%o0,	%o1,	%o4
	wr	%g0,	0x0c,	%asi
	stda	%o4,	[%l7 + 0x48] %asi
	bcc	%icc,	loop_426
	fbule,a	%fcc2,	loop_427
	fmovrsgez	%i7,	%f3,	%f1
	fmovdgu	%xcc,	%f18,	%f18
loop_426:
	fors	%f16,	%f23,	%f3
loop_427:
	movleu	%xcc,	%i4,	%l2
	tge	%xcc,	0x6
	movle	%xcc,	%g7,	%o3
	ldsb	[%l7 + 0x19],	%i0
	tne	%xcc,	0x0
	edge32n	%g2,	%i3,	%g3
	taddcctv	%g4,	0x1F68,	%l5
	movn	%xcc,	%g6,	%l0
	edge8ln	%l3,	%g1,	%g5
	sra	%i5,	%i1,	%l6
	fpadd16	%f16,	%f6,	%f24
	brz	%l1,	loop_428
	tl	%icc,	0x2
	movrgz	%i6,	0x17B,	%o7
	fba	%fcc3,	loop_429
loop_428:
	edge16ln	%o6,	%i2,	%o2
	movrgez	%l4,	0x0EE,	%o1
	taddcc	%o4,	%o0,	%o5
loop_429:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%l2
	addccc	%i4,	%g7,	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%i3
	sir	0x1541
	bcs,a,pn	%xcc,	loop_430
	tcc	%icc,	0x6
	mova	%xcc,	%g3,	%g2
	te	%icc,	0x7
loop_430:
	tcc	%icc,	0x3
	xnor	%l5,	0x128C,	%g6
	bge,pn	%xcc,	loop_431
	andn	%g4,	%l3,	%l0
	edge16	%g5,	%i5,	%g1
	fmovdvs	%xcc,	%f23,	%f21
loop_431:
	bl,a	loop_432
	prefetch	[%l7 + 0x68],	 0x0
	set	0x18, %o3
	ldswa	[%l7 + %o3] 0x89,	%l6
loop_432:
	fbul,a	%fcc2,	loop_433
	array32	%l1,	%i1,	%i6
	fcmpeq16	%f10,	%f0,	%o6
	sdivcc	%o7,	0x1CC6,	%o2
loop_433:
	ldstub	[%l7 + 0x25],	%l4
	movneg	%xcc,	%i2,	%o4
	udiv	%o1,	0x0954,	%o5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o0,	%l2
	edge8n	%i4,	%i7,	%g7
	tvc	%icc,	0x3
	sdiv	%i0,	0x0F51,	%i3
	edge16l	%o3,	%g3,	%l5
	membar	0x2F
	set	0x2C, %i0
	swapa	[%l7 + %i0] 0x88,	%g6
	edge16l	%g4,	%g2,	%l3
	fcmpeq16	%f28,	%f26,	%l0
	fmul8x16au	%f19,	%f3,	%f22
	tvc	%xcc,	0x5
	movle	%icc,	%g5,	%i5
	ta	%icc,	0x2
	fnot1	%f6,	%f0
	movcs	%icc,	%l6,	%g1
	edge32l	%i1,	%i6,	%l1
	fpackfix	%f24,	%f22
	fmovdvs	%icc,	%f25,	%f15
	movn	%icc,	%o6,	%o2
	andcc	%l4,	%i2,	%o7
	fmovdl	%icc,	%f6,	%f21
	sdiv	%o4,	0x1B76,	%o1
	movneg	%icc,	%o0,	%o5
	taddcc	%l2,	%i7,	%i4
	te	%icc,	0x4
	fcmpgt16	%f24,	%f2,	%g7
	udivx	%i0,	0x153C,	%o3
	bpos	loop_434
	fmovdcc	%xcc,	%f2,	%f1
	fmovspos	%icc,	%f4,	%f1
	taddcc	%g3,	%l5,	%g6
loop_434:
	movg	%xcc,	%g4,	%g2
	sdiv	%i3,	0x045D,	%l3
	movg	%xcc,	%g5,	%i5
	ble,a	loop_435
	ta	%xcc,	0x5
	brgez,a	%l6,	loop_436
	sdivcc	%l0,	0x0A50,	%i1
loop_435:
	sir	0x12EF
	ldsb	[%l7 + 0x12],	%i6
loop_436:
	prefetch	[%l7 + 0x18],	 0x1
	fexpand	%f29,	%f20
	tl	%xcc,	0x7
	edge8l	%l1,	%g1,	%o6
	smul	%l4,	%o2,	%i2
	fnors	%f2,	%f9,	%f5
	xorcc	%o4,	%o1,	%o0
	movre	%o7,	%o5,	%i7
	fmovdgu	%icc,	%f23,	%f25
	tpos	%icc,	0x6
	array8	%l2,	%i4,	%i0
	brgez	%o3,	loop_437
	fblg,a	%fcc2,	loop_438
	fmovrdgez	%g7,	%f6,	%f0
	bpos,a,pn	%xcc,	loop_439
loop_437:
	fbge,a	%fcc3,	loop_440
loop_438:
	andcc	%g3,	%l5,	%g4
	brz,a	%g2,	loop_441
loop_439:
	fbn	%fcc0,	loop_442
loop_440:
	tsubcctv	%g6,	0x09B5,	%l3
	xnor	%i3,	0x1C8D,	%g5
loop_441:
	fornot1s	%f19,	%f8,	%f22
loop_442:
	move	%icc,	%i5,	%l6
	ld	[%l7 + 0x60],	%f26
	bvs,a	%xcc,	loop_443
	edge16l	%l0,	%i6,	%l1
	srl	%i1,	%g1,	%o6
	stbar
loop_443:
	fsrc2s	%f31,	%f16
	udivcc	%o2,	0x1ED3,	%i2
	fbul	%fcc1,	loop_444
	movrlz	%l4,	0x2FE,	%o4
	tne	%icc,	0x3
	fmovdleu	%icc,	%f1,	%f12
loop_444:
	srax	%o0,	0x06,	%o7
	tneg	%xcc,	0x5
	array16	%o1,	%o5,	%l2
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%i4
	movcs	%icc,	%i0,	%o3
	fnor	%f14,	%f6,	%f14
	ldx	[%l7 + 0x50],	%i7
	tl	%xcc,	0x3
	tleu	%xcc,	0x6
	fmovrdgz	%g7,	%f18,	%f14
	addc	%l5,	0x03B4,	%g3
	andcc	%g2,	%g4,	%l3
	movrne	%g6,	%g5,	%i3
	fcmpne16	%f2,	%f20,	%i5
	fcmpd	%fcc0,	%f12,	%f2
	bvc,pt	%xcc,	loop_445
	fmovsle	%xcc,	%f19,	%f7
	ldd	[%l7 + 0x18],	%l0
	fcmped	%fcc2,	%f12,	%f24
loop_445:
	tsubcctv	%l6,	%l1,	%i1
	movrlz	%g1,	%i6,	%o2
	addc	%o6,	0x192C,	%i2
	tpos	%xcc,	0x4
	movcc	%icc,	%o4,	%o0
	swap	[%l7 + 0x68],	%o7
	movcc	%icc,	%l4,	%o5
	tn	%icc,	0x3
	xnor	%o1,	%l2,	%i4
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%i0
	set	0x10, %g3
	stxa	%o3,	[%l7 + %g3] 0xea
	membar	#Sync
	addcc	%i7,	%g7,	%l5
	edge16ln	%g3,	%g4,	%l3
	array32	%g6,	%g5,	%i3
	subc	%i5,	0x0654,	%l0
	fands	%f17,	%f6,	%f17
	move	%icc,	%l6,	%l1
	fzeros	%f20
	taddcc	%g2,	0x15D9,	%i1
	tvc	%icc,	0x3
	fzeros	%f8
	fnors	%f11,	%f21,	%f28
	andncc	%g1,	%i6,	%o2
	tg	%xcc,	0x4
	movvs	%icc,	%i2,	%o6
	fands	%f27,	%f13,	%f4
	taddcctv	%o0,	%o7,	%o4
	movge	%icc,	%l4,	%o1
	set	0x18, %o7
	lduwa	[%l7 + %o7] 0x18,	%l2
	brlz,a	%o5,	loop_446
	alignaddr	%i4,	%o3,	%i0
	fmovsa	%icc,	%f4,	%f0
	tvc	%xcc,	0x3
loop_446:
	umulcc	%i7,	0x0785,	%g7
	movg	%xcc,	%g3,	%g4
	movrlz	%l5,	%l3,	%g6
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x64] %asi,	%g5
	fsrc1	%f18,	%f26
	fmovdle	%xcc,	%f25,	%f28
	fnor	%f24,	%f14,	%f8
	prefetch	[%l7 + 0x2C],	 0x0
	array32	%i5,	%l0,	%i3
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x55] %asi,	%l6
	movl	%xcc,	%g2,	%l1
	fmovsneg	%xcc,	%f14,	%f3
	fcmpd	%fcc2,	%f0,	%f12
	fpsub32s	%f26,	%f29,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%xcc,	%f12,	%f11
	srax	%g1,	%i1,	%o2
	fsrc1s	%f6,	%f19
	bpos,a,pn	%icc,	loop_447
	fandnot2	%f30,	%f30,	%f22
	tg	%icc,	0x0
	fblg	%fcc1,	loop_448
loop_447:
	flush	%l7 + 0x34
	fxnors	%f13,	%f24,	%f21
	brnz,a	%i2,	loop_449
loop_448:
	movrgez	%i6,	0x1D5,	%o6
	nop
	setx loop_450, %l0, %l1
	jmpl %l1, %o0
	addc	%o4,	%o7,	%o1
loop_449:
	smul	%l4,	%l2,	%i4
	fornot1s	%f25,	%f18,	%f24
loop_450:
	movleu	%xcc,	%o3,	%i0
	tvs	%icc,	0x7
	tcs	%xcc,	0x5
	edge8n	%o5,	%g7,	%i7
	edge32n	%g4,	%g3,	%l3
	edge16l	%l5,	%g6,	%i5
	edge16	%l0,	%g5,	%l6
	tne	%xcc,	0x7
	siam	0x0
	fbul,a	%fcc1,	loop_451
	array8	%g2,	%l1,	%i3
	tpos	%xcc,	0x0
	fbne,a	%fcc0,	loop_452
loop_451:
	fmovde	%xcc,	%f6,	%f9
	movrgez	%g1,	0x2E8,	%o2
	xorcc	%i1,	%i2,	%i6
loop_452:
	movvs	%icc,	%o0,	%o4
	bg	loop_453
	alignaddr	%o6,	%o1,	%o7
	set	0x7F, %o5
	ldsba	[%l7 + %o5] 0x10,	%l4
loop_453:
	movgu	%xcc,	%l2,	%i4
	tl	%xcc,	0x6
	addc	%o3,	0x19D9,	%i0
	subcc	%o5,	0x1EC4,	%g7
	alignaddrl	%i7,	%g4,	%l3
	call	loop_454
	subccc	%g3,	0x0EC3,	%l5
	alignaddrl	%i5,	%l0,	%g6
	edge32n	%g5,	%l6,	%g2
loop_454:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x30] %asi,	%i3
	fnegd	%f26,	%f0
	fsrc2	%f16,	%f4
	xorcc	%l1,	%o2,	%g1
	fxnors	%f26,	%f20,	%f7
	tl	%xcc,	0x4
	alignaddr	%i1,	%i6,	%o0
	movne	%xcc,	%i2,	%o4
	udiv	%o6,	0x13EB,	%o7
	addcc	%o1,	%l4,	%i4
	brlez	%o3,	loop_455
	fmovrdgz	%l2,	%f24,	%f6
	edge16	%i0,	%o5,	%i7
	fcmpeq32	%f2,	%f18,	%g4
loop_455:
	subccc	%l3,	%g7,	%g3
	subccc	%l5,	0x14F9,	%i5
	tsubcctv	%l0,	0x0AE4,	%g5
	fand	%f26,	%f30,	%f30
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x78] %asi,	%f17
	brnz	%g6,	loop_456
	fcmped	%fcc1,	%f20,	%f24
	for	%f0,	%f30,	%f0
	fxnor	%f10,	%f24,	%f10
loop_456:
	fsrc2s	%f10,	%f21
	ldx	[%l7 + 0x20],	%g2
	tsubcc	%l6,	%l1,	%i3
	srax	%g1,	%i1,	%i6
	fmovse	%xcc,	%f16,	%f24
	tle	%icc,	0x2
	array16	%o2,	%i2,	%o0
	tleu	%xcc,	0x0
	tg	%icc,	0x5
	xnor	%o4,	0x12EA,	%o6
	be,a,pn	%icc,	loop_457
	fcmpes	%fcc3,	%f26,	%f4
	tvs	%icc,	0x0
	sub	%o1,	0x108C,	%o7
loop_457:
	fmul8ulx16	%f12,	%f8,	%f8
	tge	%icc,	0x5
	edge16n	%i4,	%o3,	%l2
	sra	%l4,	%o5,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g4,	0x3E1,	%l3
	smul	%g7,	0x17C9,	%i0
	ta	%icc,	0x3
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x10] %asi,	%f29
	sir	0x0544
	subccc	%l5,	0x0CD5,	%g3
	bleu,a	%icc,	loop_458
	fbge,a	%fcc1,	loop_459
	move	%icc,	%i5,	%l0
	brgz	%g6,	loop_460
loop_458:
	fornot1s	%f31,	%f9,	%f26
loop_459:
	orncc	%g2,	0x02BE,	%g5
	sra	%l6,	0x02,	%l1
loop_460:
	fmovdge	%icc,	%f9,	%f24
	fcmpne32	%f20,	%f12,	%i3
	edge16ln	%i1,	%g1,	%o2
	fnand	%f16,	%f8,	%f18
	orn	%i6,	0x0C81,	%i2
	edge16	%o4,	%o0,	%o6
	sll	%o1,	%i4,	%o7
	srl	%o3,	%l4,	%l2
	membar	0x35
	fpack32	%f10,	%f26,	%f26
	tge	%icc,	0x1
	udiv	%o5,	0x0061,	%g4
	edge16l	%i7,	%g7,	%l3
	edge16l	%i0,	%l5,	%i5
	nop
	set	0x28, %g2
	prefetch	[%l7 + %g2],	 0x2
	bpos	%xcc,	loop_461
	umul	%g3,	%g6,	%g2
	andncc	%l0,	%g5,	%l1
	edge32	%i3,	%i1,	%l6
loop_461:
	movl	%xcc,	%g1,	%o2
	array32	%i2,	%o4,	%i6
	fxnor	%f22,	%f8,	%f26
	array32	%o0,	%o1,	%o6
	edge16ln	%o7,	%i4,	%l4
	sllx	%l2,	0x05,	%o5
	movneg	%xcc,	%o3,	%i7
	movrlz	%g7,	0x3B3,	%l3
	movle	%icc,	%g4,	%l5
	fcmple16	%f2,	%f6,	%i0
	tn	%icc,	0x5
	fpack32	%f14,	%f18,	%f26
	movleu	%xcc,	%g3,	%g6
	edge32l	%g2,	%i5,	%g5
	udiv	%l1,	0x18A9,	%i3
	movrgez	%l0,	%l6,	%g1
	add	%o2,	0x036D,	%i1
	tsubcc	%i2,	0x1E38,	%o4
	bge,a	loop_462
	fmul8x16al	%f24,	%f0,	%f2
	udiv	%o0,	0x0145,	%o1
	fmovsvc	%xcc,	%f6,	%f1
loop_462:
	andcc	%o6,	0x0E5A,	%i6
	ba,a,pn	%icc,	loop_463
	tle	%xcc,	0x6
	fands	%f1,	%f22,	%f3
	subccc	%i4,	0x0E1A,	%l4
loop_463:
	xnor	%o7,	%o5,	%l2
	udiv	%i7,	0x025A,	%o3
	fcmped	%fcc0,	%f4,	%f2
	movg	%xcc,	%g7,	%l3
	srlx	%g4,	0x1B,	%l5
	fmovscc	%icc,	%f8,	%f7
	ld	[%l7 + 0x60],	%f22
	ba,pt	%xcc,	loop_464
	movvc	%xcc,	%g3,	%g6
	fcmpd	%fcc1,	%f22,	%f2
	umul	%i0,	%i5,	%g2
loop_464:
	movpos	%icc,	%l1,	%i3
	tle	%icc,	0x1
	movrgz	%g5,	0x162,	%l6
	mulscc	%l0,	%o2,	%i1
	fmovdg	%icc,	%f27,	%f24
	srlx	%i2,	0x19,	%g1
	fmuld8ulx16	%f23,	%f4,	%f14
	prefetch	[%l7 + 0x44],	 0x0
	edge8n	%o4,	%o0,	%o6
	std	%f16,	[%l7 + 0x08]
	xorcc	%i6,	0x1E3D,	%o1
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	addc	%i4,	0x1D0C,	%l4
	xnor	%o7,	0x09C4,	%l2
	tpos	%xcc,	0x1
	fnors	%f3,	%f28,	%f30
	fmovsgu	%xcc,	%f30,	%f7
	movn	%xcc,	%i7,	%o5
	set	0x34, %l0
	ldswa	[%l7 + %l0] 0x10,	%o3
	sllx	%l3,	0x19,	%g7
	fpack32	%f30,	%f20,	%f12
	sub	%l5,	0x049D,	%g3
	fmovd	%f14,	%f2
	fmul8x16al	%f26,	%f25,	%f10
	brnz	%g4,	loop_465
	xorcc	%i0,	%g6,	%g2
	ldub	[%l7 + 0x70],	%l1
	ldub	[%l7 + 0x79],	%i3
loop_465:
	udivx	%i5,	0x0F60,	%g5
	tle	%icc,	0x6
	fmovdn	%icc,	%f10,	%f20
	wr	%g0,	0x2f,	%asi
	stha	%l0,	[%l7 + 0x76] %asi
	membar	#Sync
	subcc	%o2,	%l6,	%i2
	movneg	%xcc,	%g1,	%i1
	sdivx	%o0,	0x11B4,	%o6
	nop
	setx loop_466, %l0, %l1
	jmpl %l1, %o4
	siam	0x6
	srl	%o1,	0x13,	%i6
	movcc	%xcc,	%i4,	%o7
loop_466:
	bpos	loop_467
	taddcc	%l4,	0x14FC,	%i7
	movrgz	%l2,	0x3B8,	%o3
	fmul8x16al	%f15,	%f14,	%f24
loop_467:
	fmovdcc	%icc,	%f12,	%f26
	ld	[%l7 + 0x24],	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l3,	%g7
	wr	%g0,	0x18,	%asi
	stxa	%o5,	[%l7 + 0x58] %asi
	prefetch	[%l7 + 0x08],	 0x2
	set	0x5E, %g1
	stha	%g3,	[%l7 + %g1] 0xeb
	membar	#Sync
	subccc	%l5,	0x0E38,	%i0
	ldd	[%l7 + 0x48],	%f10
	nop
	setx	loop_468,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%xcc,	%g6,	%g2
	srlx	%g4,	%l1,	%i5
	umul	%g5,	0x1204,	%l0
loop_468:
	fzero	%f28
	addc	%i3,	%o2,	%i2
	sir	0x0CAD
	bneg,a,pn	%icc,	loop_469
	ta	%icc,	0x0
	fandnot2	%f24,	%f28,	%f6
	array16	%l6,	%g1,	%i1
loop_469:
	addc	%o6,	0x1234,	%o0
	array16	%o4,	%o1,	%i6
	fmul8sux16	%f12,	%f26,	%f22
	movge	%xcc,	%o7,	%l4
	movpos	%xcc,	%i7,	%l2
	movcc	%icc,	%i4,	%o3
	fcmpd	%fcc0,	%f24,	%f0
	movgu	%icc,	%g7,	%l3
	fbn	%fcc3,	loop_470
	nop
	setx	loop_471,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_472,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fandnot1	%f4,	%f30,	%f22
loop_470:
	fcmpes	%fcc0,	%f31,	%f3
loop_471:
	nop
	membar	#Sync
	set	0x40, %i6
	ldda	[%l7 + %i6] 0xf1,	%f0
loop_472:
	tvs	%icc,	0x4
	tpos	%xcc,	0x5
	movvs	%xcc,	%g3,	%o5
	sdivx	%i0,	0x16D1,	%l5
	tl	%icc,	0x4
	be,pn	%xcc,	loop_473
	movgu	%xcc,	%g2,	%g6
	edge8l	%g4,	%i5,	%l1
	sllx	%l0,	0x0C,	%i3
loop_473:
	tsubcctv	%g5,	0x1FBD,	%i2
	sdivx	%l6,	0x1F2A,	%o2
	nop
	setx loop_474, %l0, %l1
	jmpl %l1, %g1
	sir	0x0868
	edge32ln	%o6,	%i1,	%o0
	membar	0x48
loop_474:
	movpos	%xcc,	%o4,	%i6
	nop
	setx	loop_475,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movre	%o7,	0x1BB,	%l4
	brlez,a	%o1,	loop_476
	tne	%xcc,	0x5
loop_475:
	movg	%icc,	%l2,	%i4
	tsubcc	%i7,	0x129F,	%g7
loop_476:
	fmovscs	%icc,	%f16,	%f30
	set	0x40, %l5
	ldswa	[%l7 + %l5] 0x15,	%o3
	movrlz	%g3,	0x2BD,	%o5
	set	0x50, %l4
	ldxa	[%l7 + %l4] 0x10,	%l3
	fors	%f5,	%f18,	%f15
	edge16ln	%l5,	%g2,	%i0
	ldx	[%l7 + 0x48],	%g4
	stb	%i5,	[%l7 + 0x48]
	fmul8x16	%f13,	%f28,	%f26
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x4C] %asi,	%l1
	orcc	%l0,	0x0E79,	%i3
	array32	%g6,	%i2,	%l6
	sth	%g5,	[%l7 + 0x44]
	subcc	%g1,	0x01D2,	%o2
	ld	[%l7 + 0x4C],	%f4
	swap	[%l7 + 0x54],	%o6
	edge32ln	%i1,	%o4,	%i6
	fbn	%fcc3,	loop_477
	st	%f13,	[%l7 + 0x6C]
	movrne	%o7,	%l4,	%o0
	movge	%xcc,	%o1,	%i4
loop_477:
	sir	0x0442
	movcs	%icc,	%l2,	%g7
	fba	%fcc3,	loop_478
	smulcc	%i7,	0x1651,	%o3
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g3
loop_478:
	edge32n	%l3,	%l5,	%o5
	movcs	%icc,	%g2,	%i0
	xorcc	%g4,	0x08E1,	%l1
	be,pn	%icc,	loop_479
	movl	%icc,	%i5,	%l0
	fmovsle	%xcc,	%f10,	%f2
	tl	%icc,	0x4
loop_479:
	addc	%i3,	0x1130,	%g6
	movneg	%icc,	%i2,	%g5
	bvs,a,pn	%xcc,	loop_480
	fcmped	%fcc3,	%f4,	%f0
	fmovse	%xcc,	%f1,	%f26
	tsubcc	%g1,	0x17E5,	%l6
loop_480:
	bgu	%xcc,	loop_481
	fcmpne32	%f4,	%f16,	%o6
	set	0x10, %o0
	stxa	%o2,	[%l7 + %o0] 0x18
loop_481:
	fnand	%f14,	%f22,	%f4
	edge32	%i1,	%i6,	%o7
	fcmpne16	%f12,	%f2,	%l4
	smul	%o0,	0x0298,	%o1
	or	%i4,	0x11B9,	%o4
	movvc	%xcc,	%l2,	%i7
	set	0x54, %i2
	stwa	%o3,	[%l7 + %i2] 0x2f
	membar	#Sync
	tgu	%icc,	0x4
	umul	%g7,	0x06F9,	%g3
	fmovdleu	%xcc,	%f9,	%f18
	set	0x24, %i3
	lda	[%l7 + %i3] 0x11,	%f5
	bpos,a,pt	%xcc,	loop_482
	bl,a,pt	%icc,	loop_483
	membar	0x25
	andcc	%l5,	%l3,	%g2
loop_482:
	movvs	%icc,	%i0,	%g4
loop_483:
	brgz	%l1,	loop_484
	fandnot2	%f16,	%f8,	%f8
	tvs	%icc,	0x7
	fcmpeq32	%f20,	%f26,	%i5
loop_484:
	sub	%l0,	0x12B6,	%o5
	nop
	setx	loop_485,	%l0,	%l1
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
	set	0x20, %i4
	stxa	%g6,	[%l7 + %i4] 0x81
loop_485:
	nop
	setx	loop_486,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%i2,	0x07D7,	%g5
	ldd	[%l7 + 0x28],	%f6
	fnegs	%f27,	%f15
loop_486:
	bne,a	%xcc,	loop_487
	fmovd	%f18,	%f16
	orncc	%i3,	%g1,	%o6
	xnorcc	%o2,	0x1D66,	%l6
loop_487:
	te	%icc,	0x3
	fmovd	%f8,	%f10
	fcmps	%fcc3,	%f29,	%f7
	bcc	%icc,	loop_488
	fmovdne	%icc,	%f27,	%f4
	movrgez	%i1,	0x14A,	%o7
	bneg,a	loop_489
loop_488:
	fmovdl	%xcc,	%f14,	%f6
	fxnors	%f20,	%f28,	%f28
	fbne	%fcc2,	loop_490
loop_489:
	bcs	loop_491
	srl	%i6,	%l4,	%o0
	fmovdle	%xcc,	%f13,	%f14
loop_490:
	tleu	%icc,	0x1
loop_491:
	edge8ln	%o1,	%o4,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i7,	%i4,	%g7
	fxors	%f11,	%f25,	%f15
	edge8	%g3,	%o3,	%l5
	fbge,a	%fcc0,	loop_492
	movrgz	%g2,	%l3,	%g4
	edge8	%l1,	%i0,	%i5
	fmovsne	%xcc,	%f4,	%f13
loop_492:
	fabsd	%f0,	%f10
	tge	%xcc,	0x3
	tle	%icc,	0x0
	mova	%xcc,	%l0,	%o5
	tg	%xcc,	0x3
	orcc	%g6,	%g5,	%i3
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g1,	%o6
	fmovscc	%xcc,	%f23,	%f9
	orncc	%o2,	%l6,	%i2
	movre	%i1,	%i6,	%l4
	popc	%o7,	%o0
	smulcc	%o4,	%o1,	%l2
	fnands	%f7,	%f14,	%f27
	edge8n	%i7,	%g7,	%g3
	fmovsleu	%xcc,	%f20,	%f6
	fornot1	%f6,	%f22,	%f10
	mova	%xcc,	%o3,	%i4
	xnorcc	%g2,	%l3,	%l5
	edge8n	%l1,	%g4,	%i0
	set	0x20, %l1
	stxa	%i5,	[%g0 + %l1] 0x4f
	ldd	[%l7 + 0x68],	%f22
	tgu	%icc,	0x1
	bge	loop_493
	movn	%xcc,	%l0,	%g6
	tneg	%xcc,	0x7
	tle	%xcc,	0x7
loop_493:
	st	%f3,	[%l7 + 0x7C]
	fmovdl	%icc,	%f9,	%f15
	alignaddr	%o5,	%i3,	%g1
	bneg	loop_494
	array16	%g5,	%o2,	%o6
	ldsh	[%l7 + 0x2A],	%l6
	and	%i2,	%i6,	%i1
loop_494:
	brgez,a	%o7,	loop_495
	fpack16	%f24,	%f1
	edge32ln	%o0,	%l4,	%o1
	for	%f22,	%f16,	%f6
loop_495:
	fmovrdne	%l2,	%f28,	%f10
	lduh	[%l7 + 0x0C],	%o4
	addcc	%i7,	%g7,	%o3
	fmovrse	%i4,	%f9,	%f30
	sub	%g3,	0x10C6,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x7
	xnorcc	%l5,	0x1AED,	%g2
	sllx	%g4,	%l1,	%i0
	addc	%l0,	%g6,	%o5
	tneg	%xcc,	0x5
	popc	%i3,	%i5
	fmul8sux16	%f2,	%f20,	%f12
	array16	%g5,	%g1,	%o2
	movgu	%icc,	%o6,	%l6
	fmovdl	%icc,	%f3,	%f17
	tpos	%icc,	0x4
	fmuld8ulx16	%f11,	%f21,	%f20
	call	loop_496
	movge	%xcc,	%i2,	%i1
	wr	%g0,	0xe2,	%asi
	stwa	%i6,	[%l7 + 0x1C] %asi
	membar	#Sync
loop_496:
	subccc	%o7,	0x1298,	%o0
	tge	%icc,	0x1
	fexpand	%f23,	%f14
	smulcc	%o1,	%l4,	%o4
	movrgez	%i7,	%l2,	%g7
	bcc,a,pn	%xcc,	loop_497
	nop
	set	0x08, %g7
	stb	%o3,	[%l7 + %g7]
	mulx	%i4,	0x1538,	%l3
	andncc	%g3,	%g2,	%l5
loop_497:
	movre	%g4,	0x167,	%i0
	bg,a,pt	%icc,	loop_498
	fmovrdlez	%l1,	%f8,	%f26
	udivx	%g6,	0x1714,	%l0
	movleu	%icc,	%i3,	%o5
loop_498:
	bvc,a,pn	%icc,	loop_499
	subcc	%i5,	%g5,	%g1
	subc	%o2,	0x068A,	%o6
	fbug	%fcc0,	loop_500
loop_499:
	tcs	%icc,	0x4
	or	%l6,	%i1,	%i2
	fornot2	%f30,	%f0,	%f12
loop_500:
	tleu	%xcc,	0x5
	movneg	%icc,	%o7,	%i6
	fbne,a	%fcc0,	loop_501
	fcmpgt32	%f22,	%f24,	%o1
	sth	%l4,	[%l7 + 0x08]
	fcmpgt32	%f0,	%f12,	%o4
loop_501:
	sub	%i7,	%l2,	%o0
	movrne	%g7,	0x243,	%o3
	ldd	[%l7 + 0x20],	%f18
	tge	%xcc,	0x1
	bn,a	loop_502
	tcc	%icc,	0x4
	ldd	[%l7 + 0x60],	%i4
	movvc	%icc,	%l3,	%g2
loop_502:
	fmovsneg	%xcc,	%f11,	%f16
	xorcc	%g3,	%l5,	%i0
	fxnors	%f17,	%f22,	%f29
	fmovsvs	%icc,	%f21,	%f10
	udivcc	%g4,	0x01AB,	%g6
	sth	%l1,	[%l7 + 0x3A]
	tvs	%xcc,	0x2
	umulcc	%i3,	0x17C2,	%l0
	brlz	%o5,	loop_503
	fzero	%f30
	set	0x50, %g5
	lduwa	[%l7 + %g5] 0x80,	%g5
loop_503:
	bpos,pn	%xcc,	loop_504
	popc	0x035B,	%i5
	brgz,a	%o2,	loop_505
	movne	%icc,	%o6,	%l6
loop_504:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f12,	[%l7 + 0x20] %asi
loop_505:
	fbe,a	%fcc1,	loop_506
	udivcc	%i1,	0x1CA0,	%i2
	srl	%g1,	%o7,	%o1
	fmovse	%xcc,	%f26,	%f12
loop_506:
	std	%i6,	[%l7 + 0x78]
	bgu	%icc,	loop_507
	umulcc	%o4,	%l4,	%l2
	movvc	%xcc,	%o0,	%i7
	subc	%o3,	%g7,	%i4
loop_507:
	orn	%g2,	0x148A,	%g3
	swap	[%l7 + 0x54],	%l3
	and	%l5,	0x0FD8,	%i0
	siam	0x4
	ldsb	[%l7 + 0x17],	%g4
	srax	%g6,	%l1,	%l0
	addccc	%i3,	0x17FD,	%o5
	xnorcc	%g5,	%i5,	%o6
	tle	%xcc,	0x1
	edge32ln	%l6,	%o2,	%i1
	fmul8x16	%f20,	%f24,	%f10
	fcmpne32	%f30,	%f30,	%i2
	xnorcc	%o7,	0x1F64,	%g1
	xnorcc	%o1,	%i6,	%l4
	bl,a	%xcc,	loop_508
	fnands	%f9,	%f25,	%f2
	for	%f30,	%f30,	%f14
	call	loop_509
loop_508:
	xor	%o4,	%l2,	%o0
	swap	[%l7 + 0x7C],	%o3
	movleu	%icc,	%g7,	%i7
loop_509:
	stbar
	std	%g2,	[%l7 + 0x48]
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x51] %asi,	%g3
	fba	%fcc0,	loop_510
	tl	%xcc,	0x1
	fmovd	%f12,	%f14
	fmovrse	%i4,	%f7,	%f1
loop_510:
	fpsub32s	%f10,	%f30,	%f25
	taddcc	%l3,	%l5,	%i0
	alignaddrl	%g6,	%l1,	%g4
	brgz	%i3,	loop_511
	movrgz	%l0,	0x12C,	%g5
	edge32ln	%i5,	%o6,	%o5
	fba	%fcc0,	loop_512
loop_511:
	movrgz	%o2,	%l6,	%i1
	fmovspos	%icc,	%f23,	%f3
	movrlez	%i2,	0x0E0,	%o7
loop_512:
	bn,a,pn	%icc,	loop_513
	tcc	%icc,	0x3
	fcmple32	%f10,	%f6,	%g1
	set	0x30, %o4
	lduwa	[%l7 + %o4] 0x10,	%o1
loop_513:
	nop
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x48] %asi,	%i6
	membar	0x57
	std	%f6,	[%l7 + 0x40]
	membar	0x42
	movcs	%xcc,	%o4,	%l2
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%o3
	tsubcctv	%o0,	0x15F9,	%i7
	edge32n	%g2,	%g7,	%g3
	fpadd32	%f16,	%f24,	%f18
	andcc	%l3,	0x1EC6,	%l5
	fmovscc	%xcc,	%f11,	%f24
	edge8	%i4,	%i0,	%g6
	fmovd	%f2,	%f10
	fcmpeq16	%f18,	%f10,	%g4
	movle	%xcc,	%i3,	%l0
	movvc	%xcc,	%g5,	%l1
	fmul8ulx16	%f18,	%f30,	%f10
	tgu	%xcc,	0x2
	edge16n	%o6,	%i5,	%o5
	lduh	[%l7 + 0x10],	%o2
	subcc	%l6,	%i2,	%i1
	andncc	%g1,	%o7,	%i6
	fbn,a	%fcc0,	loop_514
	taddcc	%o1,	%l2,	%o4
	tvc	%icc,	0x0
	addcc	%l4,	%o3,	%o0
loop_514:
	fmovsa	%xcc,	%f20,	%f23
	fbe,a	%fcc2,	loop_515
	sir	0x1F8C
	tleu	%xcc,	0x1
	movn	%icc,	%g2,	%g7
loop_515:
	movcc	%icc,	%g3,	%i7
	movrlz	%l3,	%i4,	%l5
	ldsh	[%l7 + 0x20],	%g6
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tl	%xcc,	0x6
	fblg	%fcc0,	loop_516
	brgz,a	%g4,	loop_517
	tleu	%xcc,	0x2
	sdiv	%i3,	0x1C8B,	%i0
loop_516:
	add	%g5,	0x1184,	%l0
loop_517:
	fble	%fcc3,	loop_518
	sir	0x1981
	edge16ln	%o6,	%l1,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_518:
	edge8	%o2,	%l6,	%i2
	edge8n	%o5,	%g1,	%i1
	popc	0x17EE,	%i6
	bshuffle	%f28,	%f10,	%f10
	orncc	%o1,	0x0B43,	%l2
	smul	%o4,	%o7,	%o3
	movvc	%xcc,	%l4,	%o0
	tvs	%icc,	0x1
	subc	%g2,	0x1B6F,	%g3
	tcs	%xcc,	0x5
	movleu	%xcc,	%i7,	%g7
	tleu	%xcc,	0x0
	nop
	setx loop_519, %l0, %l1
	jmpl %l1, %i4
	tle	%icc,	0x0
	edge8n	%l3,	%g6,	%g4
	movre	%i3,	0x29C,	%i0
loop_519:
	tgu	%xcc,	0x3
	nop
	setx loop_520, %l0, %l1
	jmpl %l1, %g5
	fxor	%f8,	%f28,	%f16
	fpadd16	%f20,	%f24,	%f16
	call	loop_521
loop_520:
	tgu	%xcc,	0x2
	edge16l	%l5,	%o6,	%l1
	bl,a	%icc,	loop_522
loop_521:
	movl	%icc,	%i5,	%o2
	ldd	[%l7 + 0x38],	%f6
	fbue,a	%fcc1,	loop_523
loop_522:
	sll	%l0,	0x0C,	%i2
	std	%o4,	[%l7 + 0x10]
	popc	%l6,	%i1
loop_523:
	udivx	%g1,	0x0615,	%i6
	srlx	%l2,	%o4,	%o7
	fnot2	%f22,	%f28
	fmovsleu	%icc,	%f10,	%f26
	smulcc	%o3,	0x0DC2,	%l4
	array16	%o1,	%o0,	%g3
	tneg	%icc,	0x0
	subcc	%g2,	0x1360,	%i7
	popc	%g7,	%i4
	movpos	%xcc,	%g6,	%g4
	sub	%i3,	0x06F0,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g5,	%l3,	%o6
	fmovsvs	%icc,	%f4,	%f16
	fmovsg	%xcc,	%f12,	%f22
	swap	[%l7 + 0x7C],	%l1
	tgu	%xcc,	0x3
	tl	%xcc,	0x3
	sethi	0x0B7B,	%l5
	siam	0x6
	movrgez	%i5,	%l0,	%i2
	nop
	set	0x48, %i5
	ldx	[%l7 + %i5],	%o2
	set	0x1E, %l3
	lduha	[%l7 + %l3] 0x14,	%o5
	movrne	%l6,	%i1,	%g1
	tg	%icc,	0x6
	movcs	%xcc,	%l2,	%o4
	brgz	%o7,	loop_524
	edge16	%o3,	%i6,	%o1
	fone	%f14
	add	%o0,	0x1D0A,	%g3
loop_524:
	ldsh	[%l7 + 0x2C],	%l4
	xorcc	%i7,	0x1E0D,	%g2
	brgz	%g7,	loop_525
	taddcctv	%g6,	0x0D0B,	%i4
	fmovsl	%xcc,	%f28,	%f10
	fcmpeq16	%f2,	%f6,	%g4
loop_525:
	movge	%xcc,	%i3,	%g5
	andn	%i0,	0x0C85,	%o6
	fba	%fcc3,	loop_526
	srax	%l1,	%l5,	%i5
	brlez,a	%l0,	loop_527
	bl,a	%xcc,	loop_528
loop_526:
	fmovsgu	%xcc,	%f8,	%f2
	fmovdcs	%icc,	%f29,	%f19
loop_527:
	smulcc	%i2,	%l3,	%o2
loop_528:
	movrgez	%l6,	0x392,	%o5
	set	0x48, %l2
	stha	%i1,	[%l7 + %l2] 0x19
	wr	%g0,	0x2a,	%asi
	stba	%g1,	[%l7 + 0x0E] %asi
	membar	#Sync
	brlz	%o4,	loop_529
	movn	%xcc,	%l2,	%o7
	mova	%xcc,	%o3,	%i6
	sllx	%o0,	%g3,	%o1
loop_529:
	bleu,a,pn	%xcc,	loop_530
	ldsw	[%l7 + 0x5C],	%i7
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_530:
	edge8n	%l4,	%g7,	%g6
	fba	%fcc2,	loop_531
	prefetch	[%l7 + 0x08],	 0x2
	movrgz	%g2,	0x2AD,	%g4
	membar	0x6C
loop_531:
	taddcctv	%i3,	%i4,	%i0
	te	%icc,	0x6
	faligndata	%f2,	%f10,	%f18
	ldd	[%l7 + 0x30],	%f30
	fbn	%fcc2,	loop_532
	andcc	%o6,	0x1AC8,	%g5
	movle	%icc,	%l5,	%i5
	movre	%l0,	%i2,	%l1
loop_532:
	fnand	%f10,	%f18,	%f14
	movrgez	%l3,	%o2,	%o5
	fsrc2	%f2,	%f10
	edge8	%l6,	%g1,	%o4
	ta	%icc,	0x1
	tsubcc	%i1,	%l2,	%o3
	fmuld8ulx16	%f13,	%f28,	%f10
	fbu,a	%fcc2,	loop_533
	orn	%i6,	%o7,	%o0
	wr	%g0,	0x11,	%asi
	sta	%f0,	[%l7 + 0x24] %asi
loop_533:
	xnor	%o1,	%i7,	%l4
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x2e,	%g6
	call	loop_534
	fcmpgt32	%f14,	%f28,	%g6
	tvc	%icc,	0x7
	bvc,pn	%xcc,	loop_535
loop_534:
	and	%g2,	0x1F10,	%g4
	fmovdneg	%xcc,	%f3,	%f26
	fabsd	%f22,	%f20
loop_535:
	sdivx	%i3,	0x0C5C,	%g3
	lduh	[%l7 + 0x28],	%i0
	and	%o6,	%g5,	%i4
	brgez,a	%i5,	loop_536
	fands	%f5,	%f5,	%f22
	ldstub	[%l7 + 0x29],	%l5
	fbge,a	%fcc3,	loop_537
loop_536:
	smul	%i2,	0x1BE0,	%l0
	ble,a,pt	%xcc,	loop_538
	movl	%icc,	%l3,	%o2
loop_537:
	addccc	%o5,	0x0C0C,	%l1
	tg	%icc,	0x0
loop_538:
	std	%f22,	[%l7 + 0x58]
	taddcc	%l6,	%o4,	%i1
	ldx	[%l7 + 0x10],	%l2
	fnor	%f16,	%f30,	%f18
	movcs	%xcc,	%o3,	%i6
	swap	[%l7 + 0x48],	%g1
	wr	%g0,	0x2b,	%asi
	stda	%o0,	[%l7 + 0x78] %asi
	membar	#Sync
	tle	%icc,	0x4
	array32	%o1,	%i7,	%l4
	wr	%g0,	0x5f,	%asi
	stxa	%o7,	[%g0 + 0x0] %asi
	edge8ln	%g7,	%g2,	%g6
	fmul8x16	%f28,	%f16,	%f18
	xnor	%i3,	0x100C,	%g3
	sllx	%g4,	0x11,	%i0
	alignaddr	%g5,	%i4,	%i5
	movpos	%xcc,	%l5,	%i2
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x64] %asi,	%o6
	movre	%l3,	%o2,	%o5
	smul	%l0,	%l6,	%l1
	addccc	%o4,	0x158F,	%l2
	movvs	%icc,	%i1,	%o3
	movg	%icc,	%i6,	%g1
	edge32	%o0,	%o1,	%i7
	sth	%o7,	[%l7 + 0x1C]
	std	%f22,	[%l7 + 0x08]
	nop
	set	0x62, %i7
	ldub	[%l7 + %i7],	%g7
	edge32n	%g2,	%g6,	%i3
	bgu,pt	%xcc,	loop_539
	mova	%icc,	%l4,	%g3
	sir	0x0B5E
	addc	%i0,	0x1695,	%g4
loop_539:
	andn	%g5,	%i5,	%l5
	tle	%icc,	0x4
	udivcc	%i4,	0x16A7,	%o6
	alignaddr	%l3,	%i2,	%o2
	bn,a	%xcc,	loop_540
	bneg	loop_541
	movneg	%icc,	%l0,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_540:
	srax	%l1,	%o4,	%l2
loop_541:
	tcs	%icc,	0x4
	fbue	%fcc0,	loop_542
	movre	%i1,	%o5,	%i6
	fbo	%fcc1,	loop_543
	xnorcc	%o3,	%g1,	%o0
loop_542:
	brgz	%i7,	loop_544
	ldx	[%l7 + 0x50],	%o7
loop_543:
	sra	%g7,	0x0A,	%g2
	movvc	%xcc,	%g6,	%o1
loop_544:
	tpos	%icc,	0x1
	sll	%i3,	0x12,	%g3
	edge32ln	%l4,	%g4,	%i0
	bl,a	%xcc,	loop_545
	movrgz	%i5,	0x283,	%g5
	fmovrdgz	%i4,	%f8,	%f24
	ldub	[%l7 + 0x23],	%o6
loop_545:
	fnand	%f8,	%f24,	%f16
	xor	%l3,	0x0F2F,	%l5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x78] %asi,	%o2
	fble,a	%fcc1,	loop_546
	bvc,pn	%icc,	loop_547
	fpackfix	%f30,	%f27
	umul	%l0,	0x073E,	%i2
loop_546:
	nop
	wr	%g0,	0xe2,	%asi
	stba	%l6,	[%l7 + 0x73] %asi
	membar	#Sync
loop_547:
	edge16l	%l1,	%l2,	%o4
	fbl,a	%fcc2,	loop_548
	ldstub	[%l7 + 0x4D],	%o5
	bpos	loop_549
	fpmerge	%f28,	%f10,	%f30
loop_548:
	smulcc	%i6,	0x0B22,	%o3
	move	%icc,	%i1,	%g1
loop_549:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc	%xcc,	loop_550
	array8	%i7,	%o0,	%g7
	udivx	%g2,	0x19FE,	%g6
	wr	%g0,	0x80,	%asi
	sta	%f6,	[%l7 + 0x58] %asi
loop_550:
	bpos,a,pt	%icc,	loop_551
	fxors	%f8,	%f8,	%f17
	edge16ln	%o1,	%o7,	%i3
	subcc	%l4,	0x011A,	%g3
loop_551:
	fmovda	%xcc,	%f21,	%f0
	fmovsleu	%xcc,	%f8,	%f26
	sra	%g4,	%i5,	%g5
	fcmpne32	%f20,	%f16,	%i4
	fmovde	%icc,	%f22,	%f26
	fbge	%fcc3,	loop_552
	sethi	0x10B3,	%o6
	fnands	%f19,	%f1,	%f22
	movrgez	%i0,	%l3,	%o2
loop_552:
	ldsb	[%l7 + 0x61],	%l5
	brnz,a	%i2,	loop_553
	move	%icc,	%l0,	%l1
	srax	%l2,	0x15,	%o4
	edge16	%l6,	%i6,	%o5
loop_553:
	xnor	%o3,	%g1,	%i7
	tne	%xcc,	0x1
	tge	%icc,	0x6
	edge32	%o0,	%g7,	%g2
	tgu	%icc,	0x2
	add	%g6,	%o1,	%o7
	fabsd	%f6,	%f20
	fmovdg	%icc,	%f25,	%f4
	orn	%i1,	0x14D0,	%l4
	fbule	%fcc3,	loop_554
	tge	%xcc,	0x5
	sdivcc	%g3,	0x13E4,	%i3
	edge16ln	%i5,	%g4,	%i4
loop_554:
	fcmpne32	%f10,	%f10,	%o6
	bleu	%icc,	loop_555
	std	%g4,	[%l7 + 0x50]
	wr	%g0,	0x80,	%asi
	stda	%i0,	[%l7 + 0x40] %asi
loop_555:
	edge16	%o2,	%l5,	%l3
	bvs,a,pn	%icc,	loop_556
	sdivcc	%l0,	0x0083,	%i2
	fbuge,a	%fcc1,	loop_557
	or	%l2,	0x1D49,	%o4
loop_556:
	fcmpgt16	%f4,	%f10,	%l6
	tleu	%icc,	0x4
loop_557:
	fmovdl	%xcc,	%f3,	%f25
	lduw	[%l7 + 0x50],	%l1
	udivx	%o5,	0x1802,	%o3
	smulcc	%i6,	0x189B,	%i7
	edge8l	%g1,	%g7,	%o0
	alignaddrl	%g6,	%o1,	%o7
	subc	%i1,	0x0B6F,	%g2
	xnor	%l4,	%i3,	%g3
	tvs	%xcc,	0x5
	fba,a	%fcc3,	loop_558
	fmovscc	%xcc,	%f17,	%f1
	tne	%icc,	0x4
	nop
	setx	loop_559,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_558:
	stbar
	array32	%i5,	%i4,	%g4
	tge	%xcc,	0x1
loop_559:
	movrlz	%g5,	%i0,	%o2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o6
	nop
	set	0x0C, %o2
	stw	%l5,	[%l7 + %o2]
	edge32	%l3,	%i2,	%l2
	fcmple16	%f4,	%f20,	%l0
	fmovsne	%icc,	%f3,	%f31
	udivcc	%o4,	0x099A,	%l1
	brgz,a	%l6,	loop_560
	tle	%xcc,	0x2
	srl	%o3,	0x08,	%i6
	xorcc	%i7,	%g1,	%g7
loop_560:
	bg,a	%xcc,	loop_561
	brgz	%o5,	loop_562
	fmovdpos	%icc,	%f2,	%f23
	fmuld8sux16	%f20,	%f25,	%f26
loop_561:
	fpadd16	%f28,	%f30,	%f8
loop_562:
	nop
	set	0x08, %l6
	stxa	%g6,	[%l7 + %l6] 0x80
	prefetch	[%l7 + 0x54],	 0x3
	fabsd	%f20,	%f20
	bgu,pt	%xcc,	loop_563
	bcc,pt	%icc,	loop_564
	movrlz	%o1,	0x061,	%o7
	fbo	%fcc1,	loop_565
loop_563:
	fmovdn	%icc,	%f13,	%f20
loop_564:
	umul	%o0,	%i1,	%g2
	be,pn	%xcc,	loop_566
loop_565:
	fornot1s	%f7,	%f9,	%f2
	set	0x1C, %o1
	sta	%f14,	[%l7 + %o1] 0x04
loop_566:
	edge8ln	%i3,	%l4,	%g3
	wr	%g0,	0x89,	%asi
	stxa	%i4,	[%l7 + 0x20] %asi
	sdivcc	%g4,	0x155A,	%g5
	wr	%g0,	0xe3,	%asi
	stha	%i5,	[%l7 + 0x10] %asi
	membar	#Sync
	orn	%i0,	0x1018,	%o2
	fble,a	%fcc2,	loop_567
	movl	%xcc,	%l5,	%l3
	faligndata	%f4,	%f18,	%f8
	brz	%o6,	loop_568
loop_567:
	fandnot2s	%f0,	%f28,	%f7
	movcs	%xcc,	%i2,	%l0
	fmovdle	%icc,	%f14,	%f14
loop_568:
	nop
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l2
	std	%l0,	[%l7 + 0x10]
	alignaddrl	%l6,	%o4,	%i6
	popc	0x030D,	%o3
	xnorcc	%g1,	0x0282,	%i7
	nop
	setx loop_569, %l0, %l1
	jmpl %l1, %g7
	taddcctv	%o5,	%g6,	%o1
	sir	0x13A0
	wr	%g0,	0x27,	%asi
	stba	%o7,	[%l7 + 0x0C] %asi
	membar	#Sync
loop_569:
	faligndata	%f24,	%f30,	%f14
	mova	%xcc,	%o0,	%g2
	fxnors	%f6,	%f0,	%f8
	edge32l	%i1,	%i3,	%l4
	tleu	%icc,	0x2
	subccc	%i4,	%g4,	%g5
	call	loop_570
	udiv	%i5,	0x07F6,	%g3
	taddcctv	%i0,	0x1987,	%o2
	call	loop_571
loop_570:
	fors	%f1,	%f9,	%f30
	edge16	%l5,	%l3,	%o6
	fmovdleu	%icc,	%f27,	%f28
loop_571:
	fcmpes	%fcc1,	%f14,	%f2
	fpadd32s	%f29,	%f6,	%f29
	movrne	%i2,	%l0,	%l1
	fsrc2s	%f0,	%f9
	movl	%xcc,	%l2,	%l6
	movrlz	%o4,	0x33F,	%i6
	movrgez	%o3,	0x2AC,	%g1
	fpadd32	%f22,	%f26,	%f20
	sdivx	%g7,	0x1416,	%i7
	fpsub16s	%f29,	%f6,	%f11
	edge32n	%o5,	%o1,	%g6
	edge16ln	%o7,	%g2,	%i1
	mulscc	%i3,	0x00AC,	%o0
	udiv	%i4,	0x05C5,	%g4
	fnot1s	%f22,	%f12
	membar	0x18
	and	%g5,	%l4,	%i5
	taddcctv	%i0,	0x0528,	%o2
	bn,a	loop_572
	nop
	set	0x0C, %g4
	sth	%l5,	[%l7 + %g4]
	ta	%icc,	0x5
	set	0x42, %g6
	lduha	[%l7 + %g6] 0x15,	%g3
loop_572:
	bl,a	%icc,	loop_573
	bn,a,pt	%xcc,	loop_574
	sub	%l3,	0x0FB7,	%o6
	alignaddrl	%l0,	%i2,	%l1
loop_573:
	fmovd	%f2,	%f2
loop_574:
	fmovs	%f11,	%f4
	edge8n	%l6,	%l2,	%i6
	sra	%o4,	0x0D,	%o3
	edge8	%g1,	%i7,	%g7
	fand	%f2,	%f12,	%f18
	sra	%o5,	0x00,	%g6
	wr	%g0,	0x88,	%asi
	sta	%f26,	[%l7 + 0x74] %asi
	array32	%o1,	%g2,	%o7
	bshuffle	%f18,	%f22,	%f4
	srl	%i3,	%o0,	%i4
	movle	%icc,	%g4,	%i1
	fzero	%f24
	tne	%xcc,	0x6
	tgu	%xcc,	0x0
	udivx	%l4,	0x0576,	%i5
	fbne	%fcc1,	loop_575
	andcc	%g5,	0x0CDF,	%o2
	fbu	%fcc1,	loop_576
	fnot2	%f14,	%f6
loop_575:
	move	%icc,	%l5,	%i0
	tneg	%icc,	0x6
loop_576:
	tsubcc	%g3,	0x002A,	%l3
	fmovrsgez	%l0,	%f31,	%f8
	movne	%xcc,	%i2,	%o6
	mova	%xcc,	%l1,	%l2
	fands	%f28,	%f26,	%f15
	movvc	%xcc,	%i6,	%o4
	fcmped	%fcc0,	%f12,	%f14
	edge16	%o3,	%g1,	%l6
	tne	%xcc,	0x5
	movn	%icc,	%i7,	%o5
	edge8l	%g6,	%o1,	%g7
	edge32l	%g2,	%o7,	%o0
	taddcctv	%i4,	0x0318,	%i3
	fsrc2s	%f0,	%f19
	fcmpeq16	%f16,	%f2,	%i1
	popc	0x1FC2,	%l4
	fbe,a	%fcc0,	loop_577
	fcmps	%fcc0,	%f20,	%f21
	fpack16	%f30,	%f12
	orcc	%g4,	0x10F9,	%g5
loop_577:
	bn,pn	%xcc,	loop_578
	tge	%icc,	0x1
	andcc	%o2,	%i5,	%l5
	tneg	%icc,	0x2
loop_578:
	and	%g3,	%i0,	%l0
	movvs	%xcc,	%l3,	%o6
	wr	%g0,	0xf0,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	be,pt	%xcc,	loop_579
	stw	%i2,	[%l7 + 0x74]
	set	0x0C, %o6
	swapa	[%l7 + %o6] 0x11,	%l2
loop_579:
	be,a	%icc,	loop_580
	edge16l	%i6,	%l1,	%o3
	subcc	%o4,	%l6,	%g1
	ba,a	%icc,	loop_581
loop_580:
	alignaddr	%o5,	%g6,	%i7
	set	0x20, %i0
	ldxa	[%l7 + %i0] 0x04,	%g7
loop_581:
	array8	%g2,	%o1,	%o7
	tcs	%xcc,	0x4
	movcc	%xcc,	%o0,	%i4
	movre	%i1,	0x025,	%i3
	fpadd32	%f30,	%f6,	%f10
	movrgez	%l4,	%g5,	%g4
	ldd	[%l7 + 0x48],	%f30
	movrlz	%i5,	0x30E,	%l5
	fcmpgt32	%f24,	%f8,	%g3
	movcs	%xcc,	%i0,	%o2
	ld	[%l7 + 0x20],	%f13
	fbn	%fcc3,	loop_582
	addcc	%l0,	%l3,	%i2
	fornot1	%f6,	%f12,	%f28
	movl	%xcc,	%o6,	%i6
loop_582:
	fbn	%fcc2,	loop_583
	fpadd16s	%f11,	%f10,	%f4
	move	%xcc,	%l1,	%l2
	fcmpd	%fcc0,	%f30,	%f12
loop_583:
	orncc	%o4,	0x0543,	%o3
	movne	%icc,	%l6,	%o5
	fcmps	%fcc2,	%f25,	%f3
	sdivcc	%g1,	0x1578,	%i7
	brz,a	%g6,	loop_584
	mulscc	%g7,	%g2,	%o1
	fcmped	%fcc2,	%f10,	%f14
	andcc	%o0,	0x1F85,	%i4
loop_584:
	nop
	setx	loop_585,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fba,a	%fcc3,	loop_586
	subccc	%o7,	0x0095,	%i3
	movgu	%icc,	%i1,	%g5
loop_585:
	andcc	%l4,	%i5,	%g4
loop_586:
	fbug	%fcc1,	loop_587
	fmul8sux16	%f8,	%f4,	%f18
	edge16n	%g3,	%i0,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_587:
	umulcc	%l0,	0x1051,	%l3
	tgu	%icc,	0x1
	ldx	[%l7 + 0x40],	%i2
	addc	%l5,	%o6,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x3
	edge8l	%i6,	%l2,	%o3
	sllx	%o4,	0x00,	%o5
	fexpand	%f23,	%f16
	addcc	%l6,	%i7,	%g1
	fmul8ulx16	%f26,	%f16,	%f14
	fmovda	%xcc,	%f9,	%f2
	sub	%g7,	%g6,	%o1
	fpsub32	%f24,	%f20,	%f2
	mulx	%o0,	%i4,	%o7
	movleu	%xcc,	%g2,	%i3
	ldx	[%l7 + 0x08],	%i1
	fmul8x16	%f10,	%f20,	%f24
	fmovdcc	%xcc,	%f27,	%f31
	edge8l	%g5,	%l4,	%g4
	wr	%g0,	0x52,	%asi
	stxa	%i5,	[%g0 + 0x218] %asi
	tle	%xcc,	0x2
	tvs	%xcc,	0x3
	mulx	%i0,	0x1B8D,	%g3
	fbule,a	%fcc0,	loop_588
	tg	%xcc,	0x4
	tg	%icc,	0x6
	stbar
loop_588:
	fbue	%fcc0,	loop_589
	orncc	%l0,	0x0C48,	%l3
	xnor	%i2,	%o2,	%o6
	subc	%l5,	%l1,	%i6
loop_589:
	subccc	%o3,	0x162D,	%l2
	ba	%xcc,	loop_590
	subcc	%o4,	%l6,	%o5
	popc	0x1ED0,	%i7
	mova	%xcc,	%g7,	%g1
loop_590:
	subccc	%g6,	%o0,	%i4
	move	%icc,	%o7,	%g2
	array32	%o1,	%i1,	%g5
	nop
	setx	loop_591,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbn,a	%fcc1,	loop_592
	movre	%l4,	0x337,	%g4
	bvc,pn	%xcc,	loop_593
loop_591:
	movpos	%icc,	%i3,	%i5
loop_592:
	fpsub16s	%f26,	%f19,	%f26
	movcs	%xcc,	%g3,	%l0
loop_593:
	movg	%icc,	%i0,	%i2
	fmovd	%f18,	%f20
	fsrc2	%f22,	%f12
	tvs	%xcc,	0x0
	movrlz	%l3,	%o6,	%l5
	orn	%o2,	%l1,	%o3
	xorcc	%l2,	0x0283,	%i6
	fmovscs	%xcc,	%f12,	%f1
	sethi	0x0AC5,	%o4
	movge	%xcc,	%l6,	%o5
	fbul	%fcc3,	loop_594
	fbule,a	%fcc2,	loop_595
	movg	%icc,	%g7,	%i7
	fpmerge	%f20,	%f6,	%f16
loop_594:
	xor	%g1,	%g6,	%i4
loop_595:
	edge8n	%o0,	%g2,	%o7
	fmovda	%xcc,	%f0,	%f2
	fand	%f12,	%f22,	%f8
	fbue,a	%fcc2,	loop_596
	fbg,a	%fcc0,	loop_597
	srlx	%o1,	0x1F,	%g5
	fcmpgt16	%f6,	%f30,	%l4
loop_596:
	fmovspos	%xcc,	%f2,	%f1
loop_597:
	edge32l	%g4,	%i3,	%i5
	movrne	%i1,	0x00B,	%l0
	edge16	%i0,	%i2,	%l3
	edge16l	%g3,	%o6,	%o2
	sdivcc	%l1,	0x0A35,	%o3
	subc	%l5,	%i6,	%l2
	fcmpd	%fcc0,	%f16,	%f12
	movne	%xcc,	%l6,	%o4
	edge16l	%o5,	%g7,	%i7
	bneg,a,pt	%icc,	loop_598
	movn	%xcc,	%g1,	%g6
	fxnor	%f12,	%f12,	%f6
	fsrc2	%f18,	%f16
loop_598:
	alignaddrl	%o0,	%g2,	%i4
	sub	%o1,	%o7,	%g5
	fmovs	%f25,	%f17
	edge32	%l4,	%i3,	%i5
	fones	%f14
	nop
	setx	loop_599,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge,a,pt	%xcc,	loop_600
	orn	%i1,	0x0CB4,	%l0
	set	0x6E, %g3
	lduba	[%l7 + %g3] 0x14,	%i0
loop_599:
	mova	%xcc,	%i2,	%l3
loop_600:
	tsubcctv	%g4,	%o6,	%g3
	edge16	%l1,	%o2,	%l5
	ldx	[%l7 + 0x28],	%i6
	movleu	%icc,	%o3,	%l6
	tg	%xcc,	0x3
	movcc	%icc,	%l2,	%o4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0A] %asi,	%o5
	nop
	setx	loop_601,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%i7,	0x00D1,	%g7
	fbne,a	%fcc3,	loop_602
	sdivcc	%g6,	0x1901,	%o0
loop_601:
	nop
	wr	%g0,	0x2f,	%asi
	stwa	%g1,	[%l7 + 0x64] %asi
	membar	#Sync
loop_602:
	fmovsleu	%xcc,	%f3,	%f30
	subcc	%i4,	%o1,	%g2
	orcc	%g5,	0x1161,	%o7
	movgu	%icc,	%i3,	%i5
	udivcc	%l4,	0x1149,	%i1
	tn	%xcc,	0x1
	fsrc2s	%f5,	%f21
	fnands	%f13,	%f27,	%f23
	srl	%i0,	0x0C,	%l0
	fnegs	%f3,	%f6
	bvc,a,pn	%icc,	loop_603
	fmovdcs	%xcc,	%f26,	%f25
	bge,a,pt	%icc,	loop_604
	movrne	%l3,	%g4,	%i2
loop_603:
	std	%o6,	[%l7 + 0x40]
	fmovsa	%icc,	%f27,	%f21
loop_604:
	smulcc	%l1,	0x10AA,	%o2
	edge8ln	%l5,	%i6,	%g3
	fpackfix	%f6,	%f31
	movne	%icc,	%l6,	%o3
	bleu,a	loop_605
	xnor	%l2,	0x08FA,	%o4
	membar	0x02
	movcc	%xcc,	%o5,	%g7
loop_605:
	fmovd	%f18,	%f18
	tcc	%xcc,	0x3
	array32	%i7,	%g6,	%o0
	fmovsl	%icc,	%f31,	%f22
	smul	%i4,	0x0D48,	%g1
	tcs	%xcc,	0x6
	movcs	%xcc,	%o1,	%g5
	fbe,a	%fcc3,	loop_606
	srl	%g2,	0x17,	%i3
	and	%o7,	0x12EE,	%i5
	set	0x40, %o7
	stda	%f16,	[%l7 + %o7] 0xf0
	membar	#Sync
loop_606:
	tpos	%xcc,	0x0
	te	%xcc,	0x7
	bpos	%icc,	loop_607
	xorcc	%l4,	%i0,	%l0
	fabss	%f7,	%f15
	movrne	%l3,	0x3BC,	%i1
loop_607:
	subcc	%i2,	0x052D,	%g4
	sdivx	%o6,	0x1020,	%l1
	fmovsgu	%xcc,	%f17,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l5,	%o2,	%i6
	srax	%l6,	0x16,	%o3
	alignaddrl	%l2,	%g3,	%o4
	std	%g6,	[%l7 + 0x48]
	sra	%o5,	0x0B,	%g6
	lduh	[%l7 + 0x54],	%o0
	std	%f20,	[%l7 + 0x60]
	sdivcc	%i4,	0x003F,	%g1
	ldsb	[%l7 + 0x18],	%o1
	bcc,a,pn	%icc,	loop_608
	edge32n	%i7,	%g5,	%i3
	swap	[%l7 + 0x1C],	%o7
	alignaddrl	%i5,	%g2,	%i0
loop_608:
	mova	%icc,	%l0,	%l4
	movpos	%xcc,	%l3,	%i1
	sub	%g4,	0x0E61,	%i2
	tcs	%xcc,	0x7
	fpsub32s	%f30,	%f29,	%f2
	nop
	setx	loop_609,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32n	%l1,	%l5,	%o2
	movgu	%xcc,	%o6,	%l6
	movrgz	%i6,	%l2,	%g3
loop_609:
	array8	%o3,	%o4,	%g7
	xorcc	%o5,	%g6,	%o0
	movvs	%icc,	%i4,	%o1
	edge16ln	%g1,	%g5,	%i7
	fornot1s	%f1,	%f27,	%f30
	ldsw	[%l7 + 0x44],	%o7
	fcmple16	%f26,	%f0,	%i3
	set	0x20, %o3
	stxa	%i5,	[%l7 + %o3] 0x04
	fmovrdgez	%i0,	%f10,	%f26
	fmovdgu	%xcc,	%f21,	%f31
	udivx	%l0,	0x1406,	%l4
	movcc	%icc,	%g2,	%l3
	add	%g4,	0x1EE7,	%i1
	andncc	%l1,	%l5,	%i2
	movcs	%xcc,	%o2,	%l6
	fornot2	%f20,	%f6,	%f30
	flush	%l7 + 0x08
	array32	%o6,	%i6,	%g3
	swap	[%l7 + 0x14],	%l2
	xnor	%o3,	0x0D61,	%o4
	fornot1s	%f19,	%f28,	%f13
	sllx	%g7,	%g6,	%o0
	popc	0x10DB,	%i4
	or	%o5,	0x1AD9,	%g1
	brz	%g5,	loop_610
	movn	%xcc,	%o1,	%o7
	tsubcc	%i7,	%i5,	%i0
	be,pn	%xcc,	loop_611
loop_610:
	brz	%l0,	loop_612
	movrlez	%i3,	%g2,	%l4
	movge	%icc,	%l3,	%g4
loop_611:
	fbn	%fcc0,	loop_613
loop_612:
	tl	%icc,	0x0
	fmovsl	%xcc,	%f31,	%f26
	tvs	%icc,	0x0
loop_613:
	andn	%i1,	0x1A0D,	%l1
	fornot2	%f22,	%f28,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l5,	[%l7 + 0x62]
	tneg	%icc,	0x6
	edge32n	%i2,	%l6,	%o2
	addc	%o6,	%i6,	%l2
	sra	%g3,	0x1B,	%o4
	set	0x68, %g2
	lduha	[%l7 + %g2] 0x10,	%g7
	std	%f6,	[%l7 + 0x48]
	bg	loop_614
	ta	%xcc,	0x4
	movvc	%icc,	%g6,	%o3
	tcs	%icc,	0x0
loop_614:
	prefetch	[%l7 + 0x6C],	 0x3
	pdist	%f6,	%f26,	%f8
	and	%o0,	%i4,	%o5
	fcmpeq32	%f24,	%f24,	%g5
	edge8ln	%g1,	%o1,	%i7
	edge8	%i5,	%i0,	%l0
	tcs	%icc,	0x3
	fpmerge	%f18,	%f14,	%f10
	bcs,a	%icc,	loop_615
	ldub	[%l7 + 0x76],	%i3
	movre	%g2,	0x2BE,	%l4
	fandnot2s	%f7,	%f6,	%f11
loop_615:
	ldstub	[%l7 + 0x72],	%o7
	tsubcctv	%g4,	0x0ED3,	%i1
	movg	%xcc,	%l1,	%l5
	edge8	%l3,	%i2,	%o2
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x64] %asi,	%o6
	andn	%l6,	0x1ECF,	%i6
	fmovrdne	%l2,	%f14,	%f4
	movleu	%icc,	%g3,	%o4
	fpsub32s	%f3,	%f6,	%f4
	edge32l	%g6,	%g7,	%o0
	pdist	%f30,	%f18,	%f2
	movge	%xcc,	%i4,	%o5
	edge8ln	%g5,	%o3,	%o1
	orn	%i7,	0x070E,	%i5
	addccc	%i0,	%l0,	%g1
	movle	%xcc,	%g2,	%i3
	ble	%xcc,	loop_616
	fabsd	%f4,	%f6
	tsubcctv	%l4,	0x0AF0,	%o7
	fbg	%fcc0,	loop_617
loop_616:
	movge	%icc,	%i1,	%l1
	fbu,a	%fcc0,	loop_618
	array8	%g4,	%l5,	%i2
loop_617:
	fmovdle	%icc,	%f8,	%f3
	edge8	%o2,	%l3,	%l6
loop_618:
	fbule	%fcc2,	loop_619
	mulx	%o6,	%l2,	%i6
	movrne	%o4,	0x0F2,	%g6
	fpsub32	%f22,	%f16,	%f10
loop_619:
	movvc	%xcc,	%g3,	%o0
	addc	%i4,	0x084F,	%g7
	xor	%o5,	%g5,	%o1
	movg	%icc,	%o3,	%i5
	lduh	[%l7 + 0x4A],	%i0
	fpadd16	%f6,	%f10,	%f8
	movleu	%icc,	%l0,	%i7
	fbue,a	%fcc3,	loop_620
	xnorcc	%g2,	0x1AF8,	%g1
	movgu	%xcc,	%i3,	%o7
	set	0x54, %o5
	sta	%f9,	[%l7 + %o5] 0x18
loop_620:
	sdivcc	%l4,	0x136D,	%i1
	xorcc	%g4,	0x0A8D,	%l5
	srax	%i2,	%o2,	%l1
	mova	%icc,	%l6,	%o6
	taddcctv	%l2,	%l3,	%i6
	movg	%xcc,	%o4,	%g6
	tsubcc	%o0,	0x1A85,	%g3
	smulcc	%g7,	0x0CDB,	%i4
	set	0x28, %g1
	stxa	%g5,	[%g0 + %g1] 0x4f
	srlx	%o1,	%o5,	%i5
	fpack32	%f20,	%f20,	%f20
	xnorcc	%o3,	0x191F,	%l0
	brz,a	%i7,	loop_621
	movrlez	%i0,	0x320,	%g1
	edge16n	%g2,	%o7,	%i3
	fmul8x16al	%f27,	%f18,	%f30
loop_621:
	movpos	%xcc,	%i1,	%g4
	sdiv	%l4,	0x1AC9,	%l5
	fbge	%fcc1,	loop_622
	movl	%xcc,	%o2,	%l1
	movgu	%icc,	%i2,	%l6
	stbar
loop_622:
	call	loop_623
	sdiv	%o6,	0x107F,	%l3
	array32	%l2,	%o4,	%g6
	movpos	%xcc,	%i6,	%g3
loop_623:
	movpos	%icc,	%g7,	%o0
	sdiv	%i4,	0x0C7A,	%o1
	set	0x26, %i6
	ldsha	[%l7 + %i6] 0x18,	%o5
	tsubcctv	%g5,	%o3,	%l0
	fsrc1s	%f8,	%f18
	tl	%icc,	0x1
	sdivx	%i5,	0x0763,	%i7
	fmovdge	%icc,	%f14,	%f5
	edge8	%g1,	%i0,	%g2
	fpackfix	%f20,	%f4
	popc	%i3,	%o7
	sdiv	%g4,	0x0B5F,	%i1
	tpos	%xcc,	0x5
	sethi	0x18E9,	%l5
	fmovsge	%xcc,	%f29,	%f8
	addccc	%o2,	%l4,	%i2
	set	0x8, %l0
	ldxa	[%g0 + %l0] 0x21,	%l6
	brgz	%o6,	loop_624
	sdivx	%l3,	0x13B7,	%l1
	set	0x71, %l4
	stba	%o4,	[%l7 + %l4] 0x10
loop_624:
	fnands	%f0,	%f24,	%f7
	movg	%xcc,	%l2,	%g6
	array8	%g3,	%g7,	%o0
	bn	%icc,	loop_625
	flush	%l7 + 0x34
	fnot2s	%f21,	%f20
	fnors	%f0,	%f27,	%f15
loop_625:
	bl,a,pn	%icc,	loop_626
	fcmpeq32	%f28,	%f18,	%i4
	tneg	%xcc,	0x1
	movcs	%icc,	%i6,	%o1
loop_626:
	nop
	set	0x3C, %o0
	ldsba	[%l7 + %o0] 0x19,	%o5
	ldub	[%l7 + 0x53],	%g5
	fsrc1s	%f29,	%f17
	bcc,pt	%xcc,	loop_627
	ld	[%l7 + 0x10],	%f30
	std	%o2,	[%l7 + 0x70]
	fbug,a	%fcc0,	loop_628
loop_627:
	addcc	%l0,	0x16BA,	%i5
	te	%icc,	0x4
	array8	%i7,	%g1,	%g2
loop_628:
	fbl,a	%fcc1,	loop_629
	brgez	%i0,	loop_630
	sll	%o7,	0x18,	%i3
	ba,a,pn	%xcc,	loop_631
loop_629:
	edge16l	%i1,	%g4,	%l5
loop_630:
	andcc	%l4,	0x111D,	%o2
	ldstub	[%l7 + 0x73],	%l6
loop_631:
	tge	%xcc,	0x2
	stbar
	fbe	%fcc3,	loop_632
	edge16	%o6,	%i2,	%l1
	fmul8ulx16	%f18,	%f16,	%f24
	bcs,a	%xcc,	loop_633
loop_632:
	fmovdvc	%xcc,	%f16,	%f14
	alignaddrl	%l3,	%o4,	%l2
	sllx	%g3,	0x1A,	%g6
loop_633:
	srax	%o0,	0x0A,	%g7
	edge16	%i6,	%o1,	%i4
	fpsub32	%f0,	%f26,	%f24
	and	%g5,	%o3,	%l0
	fcmple32	%f6,	%f4,	%i5
	sethi	0x199E,	%i7
	smul	%g1,	0x178B,	%o5
	membar	0x5E
	fnot1s	%f7,	%f2
	fornot1	%f22,	%f0,	%f8
	movrne	%i0,	0x29A,	%o7
	movvs	%xcc,	%i3,	%i1
	tneg	%xcc,	0x4
	tcs	%xcc,	0x5
	add	%g4,	0x0514,	%g2
	umulcc	%l5,	%o2,	%l6
	stb	%o6,	[%l7 + 0x75]
	pdist	%f22,	%f12,	%f8
	srlx	%l4,	%l1,	%l3
	fmovrdlez	%i2,	%f28,	%f26
	movrlez	%l2,	%g3,	%g6
	tvs	%xcc,	0x3
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	subc	%o0,	0x1907,	%g7
	tn	%icc,	0x4
	and	%o4,	0x0F21,	%o1
	bpos,a,pn	%xcc,	loop_634
	ldstub	[%l7 + 0x50],	%i4
	sir	0x007C
	mulscc	%i6,	0x10FB,	%o3
loop_634:
	movg	%xcc,	%g5,	%i5
	subccc	%l0,	0x0EAE,	%g1
	movge	%icc,	%i7,	%i0
	orcc	%o7,	0x118D,	%o5
	xor	%i1,	0x0E7F,	%i3
	fmovsvc	%xcc,	%f18,	%f20
	alignaddrl	%g4,	%g2,	%l5
	mova	%xcc,	%l6,	%o6
	udiv	%o2,	0x1190,	%l1
	andn	%l4,	0x009C,	%i2
	ldsh	[%l7 + 0x78],	%l3
	movg	%xcc,	%g3,	%l2
	srax	%g6,	%g7,	%o4
	nop
	setx	loop_635,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivx	%o1,	0x1EB0,	%i4
	sdiv	%o0,	0x1E10,	%i6
	alignaddrl	%o3,	%i5,	%g5
loop_635:
	edge16l	%l0,	%g1,	%i0
	tle	%xcc,	0x7
	movrgez	%o7,	%i7,	%i1
	bneg,a,pn	%xcc,	loop_636
	move	%xcc,	%i3,	%o5
	fmovdvc	%xcc,	%f27,	%f3
	movleu	%xcc,	%g4,	%l5
loop_636:
	movrgz	%l6,	%g2,	%o2
	movrlez	%o6,	%l4,	%i2
	sll	%l3,	0x0F,	%l1
	xnor	%l2,	%g6,	%g3
	fmovdcc	%icc,	%f26,	%f21
	movrgz	%o4,	%o1,	%g7
	tleu	%icc,	0x4
	orn	%i4,	0x0D34,	%i6
	stbar
	edge16ln	%o0,	%o3,	%i5
	ta	%xcc,	0x2
	fmul8x16au	%f30,	%f8,	%f16
	alignaddr	%l0,	%g5,	%i0
	fmovdneg	%icc,	%f6,	%f23
	set	0x31, %l5
	lduba	[%l7 + %l5] 0x18,	%g1
	umul	%o7,	0x060D,	%i1
	andcc	%i7,	%i3,	%g4
	tsubcctv	%o5,	%l6,	%l5
	addc	%o2,	0x0477,	%g2
	fmovrdgez	%o6,	%f18,	%f20
	faligndata	%f14,	%f26,	%f24
	and	%l4,	%l3,	%l1
	xnor	%i2,	0x083A,	%l2
	umulcc	%g6,	0x1342,	%o4
	mulx	%o1,	%g7,	%g3
	brnz	%i6,	loop_637
	movrgz	%o0,	%o3,	%i5
	fbuge,a	%fcc1,	loop_638
	subcc	%l0,	%g5,	%i0
loop_637:
	xor	%g1,	0x1343,	%i4
	movneg	%xcc,	%o7,	%i1
loop_638:
	array32	%i3,	%g4,	%i7
	edge8ln	%o5,	%l5,	%l6
	sdivcc	%g2,	0x1A55,	%o2
	bn,a,pt	%icc,	loop_639
	fmovrdgez	%o6,	%f4,	%f30
	fmovsleu	%xcc,	%f21,	%f27
	and	%l3,	0x17CD,	%l1
loop_639:
	fxnor	%f4,	%f18,	%f10
	fmovscs	%xcc,	%f18,	%f17
	fmovdcc	%xcc,	%f31,	%f0
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x1D] %asi,	%l4
	te	%xcc,	0x3
	andncc	%i2,	%g6,	%l2
	edge8n	%o4,	%g7,	%g3
	edge32n	%o1,	%i6,	%o0
	edge32	%i5,	%l0,	%g5
	addcc	%o3,	%g1,	%i4
	tneg	%xcc,	0x3
	fones	%f25
	sdiv	%i0,	0x029A,	%o7
	membar	0x3C
	subcc	%i3,	0x0FD2,	%i1
	array8	%g4,	%o5,	%i7
	xorcc	%l6,	%g2,	%o2
	flush	%l7 + 0x34
	tvc	%xcc,	0x0
	edge16n	%o6,	%l3,	%l5
	sir	0x077B
	addc	%l1,	0x1AB8,	%i2
	tl	%xcc,	0x2
	fmovrde	%g6,	%f24,	%f18
	sethi	0x0F5D,	%l4
	tsubcctv	%l2,	0x0258,	%o4
	fmovrsgez	%g3,	%f12,	%f16
	movcs	%icc,	%o1,	%i6
	udivcc	%g7,	0x0A62,	%o0
	movleu	%xcc,	%i5,	%l0
	movleu	%icc,	%g5,	%g1
	edge16	%o3,	%i4,	%o7
	fbge	%fcc0,	loop_640
	orn	%i3,	%i0,	%g4
	edge8n	%i1,	%o5,	%i7
	tsubcc	%g2,	0x02EC,	%o2
loop_640:
	addccc	%l6,	%l3,	%l5
	udiv	%o6,	0x1661,	%l1
	bgu	loop_641
	ble,a	%xcc,	loop_642
	fmovdcc	%xcc,	%f3,	%f28
	brlz	%i2,	loop_643
loop_641:
	sllx	%g6,	0x06,	%l4
loop_642:
	nop
	set	0x70, %i2
	ldxa	[%l7 + %i2] 0x04,	%o4
loop_643:
	or	%g3,	%o1,	%l2
	fmovsne	%xcc,	%f26,	%f24
	nop
	setx loop_644, %l0, %l1
	jmpl %l1, %i6
	fmovsne	%xcc,	%f15,	%f13
	movl	%xcc,	%g7,	%i5
	movvs	%icc,	%o0,	%l0
loop_644:
	call	loop_645
	fmovscc	%icc,	%f2,	%f12
	set	0x28, %i4
	stwa	%g5,	[%l7 + %i4] 0x11
loop_645:
	sra	%o3,	0x10,	%i4
	fmovrdlz	%o7,	%f6,	%f6
	edge16	%i3,	%g1,	%i0
	movrne	%g4,	0x148,	%o5
	bshuffle	%f16,	%f28,	%f20
	fbne	%fcc2,	loop_646
	sllx	%i7,	%i1,	%g2
	fbl,a	%fcc2,	loop_647
	brgez,a	%o2,	loop_648
loop_646:
	edge8l	%l6,	%l5,	%l3
	fsrc1	%f30,	%f24
loop_647:
	te	%xcc,	0x7
loop_648:
	fmovsge	%xcc,	%f5,	%f1
	tcs	%icc,	0x0
	lduw	[%l7 + 0x3C],	%o6
	fmul8sux16	%f4,	%f20,	%f0
	mova	%xcc,	%i2,	%l1
	fbul,a	%fcc3,	loop_649
	addc	%l4,	0x04F0,	%g6
	tcs	%icc,	0x3
	movne	%icc,	%o4,	%g3
loop_649:
	fsrc1	%f18,	%f2
	orcc	%o1,	%l2,	%i6
	ba,a,pn	%icc,	loop_650
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tl	%xcc,	0x6
	tsubcc	%i5,	0x1C61,	%g7
loop_650:
	nop
	setx loop_651, %l0, %l1
	jmpl %l1, %o0
	fmovsne	%xcc,	%f27,	%f1
	orcc	%g5,	0x0628,	%l0
	fmovse	%icc,	%f16,	%f28
loop_651:
	edge16l	%o3,	%o7,	%i4
	smul	%i3,	0x1F2A,	%i0
	smulcc	%g4,	0x1358,	%o5
	fmovsleu	%xcc,	%f24,	%f30
	te	%xcc,	0x3
	set	0x110, %l1
	nop 	! 	nop 	! 	ldxa	[%g0 + %l1] 0x40,	%g1 ripped by fixASI40.pl ripped by fixASI40.pl
	fbuge	%fcc2,	loop_652
	fmovdneg	%icc,	%f6,	%f2
	array8	%i1,	%g2,	%i7
	movrgez	%l6,	%o2,	%l3
loop_652:
	movneg	%icc,	%o6,	%l5
	movle	%xcc,	%l1,	%i2
	ldd	[%l7 + 0x70],	%f26
	brlz	%l4,	loop_653
	swap	[%l7 + 0x74],	%g6
	tge	%icc,	0x5
	movl	%icc,	%g3,	%o1
loop_653:
	ld	[%l7 + 0x70],	%f7
	brlz,a	%o4,	loop_654
	udivx	%l2,	0x0148,	%i6
	bneg,pn	%xcc,	loop_655
	alignaddr	%g7,	%o0,	%i5
loop_654:
	array8	%l0,	%o3,	%g5
	sdivcc	%i4,	0x0E8F,	%i3
loop_655:
	movrgez	%o7,	%g4,	%i0
	fbug	%fcc2,	loop_656
	fmovrde	%o5,	%f14,	%f12
	fmovda	%xcc,	%f17,	%f3
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
loop_656:
	movne	%icc,	%g2,	%i7
	set	0x50, %g7
	ldsha	[%l7 + %g7] 0x18,	%i1
	sir	0x17C6
	movne	%xcc,	%l6,	%o2
	movvc	%xcc,	%l3,	%l5
	array8	%l1,	%o6,	%i2
	fble	%fcc2,	loop_657
	edge16ln	%g6,	%l4,	%g3
	umulcc	%o4,	0x19F1,	%o1
	sll	%i6,	%g7,	%o0
loop_657:
	tn	%xcc,	0x7
	edge32ln	%i5,	%l2,	%l0
	or	%o3,	0x074B,	%i4
	tl	%xcc,	0x1
	fmovdleu	%icc,	%f9,	%f31
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x2C] %asi,	%i3
	sub	%g5,	%o7,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bpos,a,pn	%xcc,	loop_658
	bcc,a	%xcc,	loop_659
	movcc	%icc,	%i0,	%g1
	sir	0x0BEA
loop_658:
	edge16	%o5,	%i7,	%i1
loop_659:
	sub	%l6,	0x0014,	%g2
	fxnors	%f21,	%f5,	%f3
	nop
	setx	loop_660,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%l3,	%l5,	%l1
	movrlez	%o2,	%i2,	%g6
	tcs	%icc,	0x0
loop_660:
	array8	%o6,	%g3,	%o4
	taddcc	%l4,	0x1942,	%i6
	fnor	%f0,	%f30,	%f28
	taddcc	%o1,	%o0,	%i5
	tpos	%icc,	0x6
	smul	%g7,	%l2,	%l0
	movrgz	%o3,	%i3,	%i4
	tsubcctv	%o7,	0x022A,	%g4
	fpack16	%f8,	%f5
	srl	%g5,	0x0C,	%g1
	edge16ln	%i0,	%o5,	%i7
	movge	%xcc,	%i1,	%l6
	movcc	%xcc,	%l3,	%g2
	set	0x64, %g5
	ldsha	[%l7 + %g5] 0x15,	%l1
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	edge32ln	%i2,	%g6,	%o6
	mulx	%g3,	%o2,	%o4
	ld	[%l7 + 0x4C],	%f2
	subc	%i6,	0x012E,	%o1
	fand	%f18,	%f16,	%f18
	fnot2s	%f9,	%f6
	tle	%icc,	0x3
	movneg	%icc,	%l4,	%o0
	subcc	%g7,	%l2,	%l0
	orn	%o3,	0x13D4,	%i5
	fbn,a	%fcc3,	loop_661
	xor	%i3,	%i4,	%g4
	call	loop_662
	movvs	%icc,	%g5,	%o7
loop_661:
	sdiv	%g1,	0x15B2,	%i0
	tsubcc	%i7,	0x0ED7,	%o5
loop_662:
	te	%xcc,	0x4
	tgu	%xcc,	0x7
	tleu	%icc,	0x0
	fmovscc	%xcc,	%f23,	%f14
	movvs	%icc,	%i1,	%l3
	edge8l	%l6,	%g2,	%l1
	fbn,a	%fcc1,	loop_663
	movpos	%xcc,	%i2,	%l5
	edge16	%g6,	%g3,	%o2
	tvc	%xcc,	0x3
loop_663:
	fcmple32	%f20,	%f6,	%o6
	orncc	%i6,	%o1,	%l4
	ta	%icc,	0x3
	fcmple32	%f10,	%f10,	%o4
	array32	%o0,	%g7,	%l0
	sdiv	%l2,	0x0682,	%i5
	popc	%o3,	%i4
	smul	%i3,	%g5,	%g4
	bleu,a,pn	%xcc,	loop_664
	bleu	%xcc,	loop_665
	sll	%g1,	%o7,	%i7
	fbue,a	%fcc1,	loop_666
loop_664:
	andncc	%o5,	%i1,	%i0
loop_665:
	fsrc1s	%f15,	%f0
	fcmpd	%fcc1,	%f6,	%f10
loop_666:
	tsubcctv	%l3,	0x13F2,	%l6
	fsrc2	%f8,	%f6
	or	%l1,	%i2,	%g2
	fcmps	%fcc3,	%f22,	%f6
	fpsub32	%f2,	%f0,	%f4
	set	0x2B, %o4
	stba	%g6,	[%l7 + %o4] 0xeb
	membar	#Sync
	orcc	%l5,	%o2,	%o6
	srl	%g3,	%i6,	%l4
	membar	0x35
	movge	%icc,	%o1,	%o0
	fbe	%fcc2,	loop_667
	edge8n	%o4,	%l0,	%l2
	fmul8sux16	%f0,	%f26,	%f16
	fmul8x16	%f0,	%f8,	%f20
loop_667:
	andn	%g7,	%i5,	%o3
	movcs	%icc,	%i4,	%g5
	taddcctv	%i3,	0x0255,	%g1
	subccc	%o7,	%i7,	%o5
	bcc,a	%icc,	loop_668
	sdiv	%g4,	0x1447,	%i1
	movre	%i0,	%l6,	%l1
	fpackfix	%f0,	%f12
loop_668:
	tneg	%xcc,	0x6
	fnand	%f26,	%f22,	%f6
	srax	%i2,	0x10,	%l3
	or	%g6,	%g2,	%o2
	sll	%o6,	0x01,	%g3
	tvc	%xcc,	0x6
	membar	0x3E
	array8	%l5,	%i6,	%o1
	sir	0x0F82
	fmovrsne	%l4,	%f13,	%f12
	tvc	%icc,	0x1
	fmovdl	%xcc,	%f21,	%f9
	sra	%o0,	%o4,	%l2
	lduh	[%l7 + 0x6A],	%l0
	call	loop_669
	tvs	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%g7
loop_669:
	umul	%i5,	%o3,	%g5
	brlez	%i3,	loop_670
	sll	%g1,	0x04,	%i4
	orcc	%o7,	%i7,	%o5
	brz	%i1,	loop_671
loop_670:
	for	%f30,	%f16,	%f24
	tpos	%xcc,	0x2
	fmovd	%f30,	%f20
loop_671:
	nop
	set	0x60, %i5
	swapa	[%l7 + %i5] 0x19,	%i0
	ldub	[%l7 + 0x5D],	%l6
	nop
	setx loop_672, %l0, %l1
	jmpl %l1, %g4
	movleu	%xcc,	%i2,	%l1
	tg	%xcc,	0x5
	set	0x30, %l3
	ldxa	[%g0 + %l3] 0x50,	%g6
loop_672:
	sdiv	%l3,	0x1FC2,	%g2
	movvc	%icc,	%o6,	%o2
	prefetch	[%l7 + 0x74],	 0x2
	andncc	%l5,	%i6,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x4
	fblg,a	%fcc3,	loop_673
	ldstub	[%l7 + 0x43],	%l4
	bcc	%xcc,	loop_674
	umulcc	%o1,	0x0D3D,	%o4
loop_673:
	nop
	setx loop_675, %l0, %l1
	jmpl %l1, %l2
	xnor	%o0,	%g7,	%l0
loop_674:
	fmovsg	%icc,	%f8,	%f13
	stb	%o3,	[%l7 + 0x66]
loop_675:
	alignaddr	%g5,	%i5,	%g1
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i4
	fmul8x16al	%f10,	%f8,	%f14
	fcmpes	%fcc0,	%f20,	%f11
	movle	%icc,	%o7,	%i3
	mulscc	%i7,	0x0E86,	%o5
	mulx	%i0,	0x18B5,	%l6
	bvc,pn	%xcc,	loop_676
	fmovsvc	%icc,	%f18,	%f17
	fmovrde	%i1,	%f0,	%f6
	fmovdcs	%icc,	%f30,	%f16
loop_676:
	move	%icc,	%g4,	%i2
	sll	%g6,	%l3,	%g2
	movgu	%xcc,	%o6,	%o2
	sethi	0x1E90,	%l1
	movrlez	%l5,	%g3,	%i6
	fnor	%f16,	%f30,	%f28
	lduh	[%l7 + 0x6C],	%o1
	ldstub	[%l7 + 0x17],	%l4
	alignaddrl	%l2,	%o4,	%o0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] 0x80,	%l0,	%o3
	array32	%g5,	%g7,	%i5
	brnz	%g1,	loop_677
	brlez	%o7,	loop_678
	xorcc	%i3,	%i4,	%o5
	array16	%i7,	%l6,	%i0
loop_677:
	move	%icc,	%g4,	%i2
loop_678:
	flush	%l7 + 0x34
	fbuge	%fcc1,	loop_679
	fbge,a	%fcc1,	loop_680
	flush	%l7 + 0x74
	tcs	%xcc,	0x3
loop_679:
	fmovsvc	%icc,	%f14,	%f20
loop_680:
	fnand	%f20,	%f12,	%f12
	fmovrdgz	%g6,	%f8,	%f20
	fsrc1s	%f12,	%f16
	tpos	%xcc,	0x7
	tl	%xcc,	0x2
	tleu	%xcc,	0x0
	fbuge	%fcc0,	loop_681
	fbn,a	%fcc0,	loop_682
	umulcc	%l3,	%g2,	%o6
	movpos	%xcc,	%i1,	%o2
loop_681:
	fone	%f8
loop_682:
	orn	%l1,	0x1138,	%g3
	fmovdvc	%icc,	%f12,	%f2
	bneg,a	%xcc,	loop_683
	movrgez	%i6,	%l5,	%o1
	sra	%l2,	%o4,	%o0
	taddcc	%l4,	0x0340,	%l0
loop_683:
	sra	%o3,	%g5,	%g7
	brz	%g1,	loop_684
	movvc	%xcc,	%o7,	%i5
	fpadd16	%f26,	%f18,	%f8
	te	%icc,	0x0
loop_684:
	fbge,a	%fcc2,	loop_685
	ble,pn	%icc,	loop_686
	subccc	%i4,	0x14CD,	%i3
	movcs	%icc,	%o5,	%i7
loop_685:
	taddcctv	%l6,	%g4,	%i0
loop_686:
	fcmpne32	%f0,	%f22,	%i2
	addccc	%g6,	%l3,	%o6
	fsrc1	%f22,	%f22
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	fcmped	%fcc3,	%f26,	%f4
	wr	%g0,	0x81,	%asi
	stha	%i1,	[%l7 + 0x58] %asi
	fpack16	%f20,	%f28
	and	%l1,	%o2,	%i6
	fpack32	%f12,	%f20,	%f22
	fmovscs	%xcc,	%f19,	%f12
	tcc	%icc,	0x0
	fmovsa	%xcc,	%f3,	%f21
	fmovdvc	%icc,	%f14,	%f3
	fbule,a	%fcc3,	loop_687
	subcc	%l5,	%g3,	%o1
	subc	%o4,	%l2,	%o0
	xorcc	%l0,	%l4,	%o3
loop_687:
	movcs	%icc,	%g5,	%g1
	fmovrde	%o7,	%f6,	%f0
	bvs,a,pn	%xcc,	loop_688
	bleu	%xcc,	loop_689
	movcs	%icc,	%i5,	%i4
	popc	%i3,	%o5
loop_688:
	nop
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
loop_689:
	fbul,a	%fcc3,	loop_690
	alignaddrl	%g7,	%g4,	%i0
	ble,a	%xcc,	loop_691
	siam	0x4
loop_690:
	fmovdgu	%xcc,	%f20,	%f25
	fmovd	%f12,	%f20
loop_691:
	nop
	setx loop_692, %l0, %l1
	jmpl %l1, %i2
	udivcc	%l6,	0x04A7,	%l3
	movneg	%xcc,	%o6,	%g2
	edge16l	%i1,	%l1,	%o2
loop_692:
	nop
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x04,	%f0
	ta	%icc,	0x5
	membar	0x51
	movpos	%xcc,	%g6,	%i6
	fcmpd	%fcc1,	%f24,	%f22
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	bshuffle	%f0,	%f8,	%f8
	edge16n	%o1,	%l5,	%l2
	andncc	%o0,	%o4,	%l0
	ldd	[%l7 + 0x60],	%o2
	tvc	%icc,	0x6
	fmovdl	%icc,	%f12,	%f29
	bvc	loop_693
	fmovdl	%xcc,	%f29,	%f21
	ldx	[%l7 + 0x70],	%l4
	movpos	%xcc,	%g1,	%o7
loop_693:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%icc,	0x3
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x10,	%g5,	%i5
	fmul8x16	%f6,	%f0,	%f26
	tg	%icc,	0x6
	mulscc	%i4,	0x02FD,	%i3
	stx	%o5,	[%l7 + 0x50]
	set	0x0, %i1
	stxa	%i7,	[%g0 + %i1] 0x57
	set	0x52, %i7
	lduha	[%l7 + %i7] 0x15,	%g4
	edge16n	%i0,	%i2,	%g7
	add	%l7,	0x24,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%l6,	%l3
	wr	%g0,	0x5f,	%asi
	stxa	%o6,	[%g0 + 0x0] %asi
	alignaddrl	%i1,	%l1,	%o2
	tneg	%icc,	0x7
	bneg	%xcc,	loop_694
	movg	%icc,	%g2,	%g6
	mova	%icc,	%g3,	%i6
	movleu	%icc,	%l5,	%o1
loop_694:
	fcmpd	%fcc3,	%f2,	%f22
	orn	%l2,	0x1978,	%o0
	fbne,a	%fcc2,	loop_695
	sll	%l0,	0x1E,	%o3
	fsrc1s	%f22,	%f0
	ld	[%l7 + 0x74],	%f10
loop_695:
	fmovdleu	%xcc,	%f12,	%f5
	fpsub16	%f14,	%f10,	%f10
	bvs	loop_696
	fsrc2s	%f14,	%f30
	tneg	%icc,	0x5
	sethi	0x02E8,	%l4
loop_696:
	movrgez	%o4,	0x051,	%g1
	movrlz	%o7,	0x354,	%g5
	bne,pt	%icc,	loop_697
	tsubcctv	%i5,	0x0E86,	%i4
	umul	%o5,	0x089E,	%i7
	fmovrslz	%i3,	%f0,	%f3
loop_697:
	movre	%g4,	0x244,	%i2
	fmovdg	%xcc,	%f3,	%f10
	tcs	%xcc,	0x7
	movrlez	%g7,	%l6,	%l3
	xnorcc	%i0,	%i1,	%l1
	popc	%o2,	%o6
	fbule	%fcc1,	loop_698
	membar	0x48
	be,pn	%icc,	loop_699
	fmovse	%icc,	%f12,	%f26
loop_698:
	movrlz	%g2,	%g6,	%g3
	bge,pn	%xcc,	loop_700
loop_699:
	edge16ln	%l5,	%o1,	%l2
	sir	0x05DE
	brlz	%o0,	loop_701
loop_700:
	mulx	%i6,	0x16F9,	%o3
	ba,a	loop_702
	fornot1s	%f0,	%f15,	%f19
loop_701:
	tn	%xcc,	0x3
	fcmpeq16	%f30,	%f6,	%l4
loop_702:
	ba,pt	%xcc,	loop_703
	array32	%l0,	%o4,	%o7
	udiv	%g5,	0x14A8,	%i5
	fmovdge	%icc,	%f4,	%f9
loop_703:
	fmovrslz	%g1,	%f1,	%f2
	fbne	%fcc3,	loop_704
	edge32	%o5,	%i4,	%i3
	be,a	%xcc,	loop_705
	mulscc	%g4,	%i2,	%i7
loop_704:
	movvc	%icc,	%g7,	%l3
	sdiv	%l6,	0x083E,	%i0
loop_705:
	bpos,a,pn	%icc,	loop_706
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%i1,	%f26,	%f15
	edge16n	%l1,	%o6,	%o2
loop_706:
	add	%g6,	%g3,	%l5
	stbar
	fmovd	%f30,	%f22
	edge8ln	%o1,	%l2,	%o0
	sethi	0x11D4,	%g2
	fcmps	%fcc1,	%f26,	%f27
	nop
	setx loop_707, %l0, %l1
	jmpl %l1, %i6
	orncc	%l4,	0x077B,	%o3
	fmul8sux16	%f6,	%f20,	%f2
	edge16ln	%o4,	%o7,	%l0
loop_707:
	nop
	set	0x0C, %o2
	sta	%f29,	[%l7 + %o2] 0x04
	tl	%icc,	0x3
	ldd	[%l7 + 0x78],	%f24
	ldsb	[%l7 + 0x11],	%i5
	addc	%g1,	0x1970,	%o5
	udivcc	%i4,	0x190C,	%g5
	fors	%f20,	%f24,	%f14
	sll	%i3,	%g4,	%i2
	mulscc	%g7,	0x07FF,	%l3
	subccc	%l6,	0x14B5,	%i0
	fbo	%fcc3,	loop_708
	ldsw	[%l7 + 0x30],	%i7
	xor	%i1,	%l1,	%o2
	fbg	%fcc2,	loop_709
loop_708:
	edge8ln	%g6,	%g3,	%l5
	fmovd	%f8,	%f28
	orncc	%o1,	%l2,	%o6
loop_709:
	tpos	%icc,	0x0
	udivx	%g2,	0x0121,	%i6
	movpos	%xcc,	%l4,	%o3
	umul	%o4,	%o0,	%o7
	fmovsgu	%icc,	%f15,	%f27
	fxors	%f6,	%f24,	%f6
	edge32	%l0,	%g1,	%i5
	srax	%o5,	0x17,	%g5
	fmovsvs	%icc,	%f10,	%f7
	stbar
	movg	%xcc,	%i4,	%g4
	tgu	%xcc,	0x1
	tsubcctv	%i2,	0x07DD,	%g7
	wr	%g0,	0x10,	%asi
	stba	%i3,	[%l7 + 0x7D] %asi
	udivx	%l3,	0x009C,	%l6
	tgu	%icc,	0x3
	xnor	%i0,	%i7,	%l1
	xor	%o2,	%g6,	%i1
	fnegs	%f31,	%f24
	alignaddrl	%l5,	%g3,	%l2
	movn	%xcc,	%o6,	%g2
	fpadd16s	%f14,	%f10,	%f29
	or	%o1,	0x161B,	%l4
	mulx	%o3,	0x0CDB,	%o4
	orcc	%o0,	0x1DCF,	%i6
	wr	%g0,	0x11,	%asi
	stda	%o6,	[%l7 + 0x68] %asi
	movcs	%xcc,	%l0,	%g1
	xnorcc	%i5,	%o5,	%g5
	alignaddrl	%g4,	%i2,	%g7
	flush	%l7 + 0x58
	edge16n	%i3,	%i4,	%l3
	movgu	%icc,	%i0,	%i7
	fandnot1	%f18,	%f28,	%f22
	stb	%l1,	[%l7 + 0x67]
	fbn,a	%fcc0,	loop_710
	alignaddr	%o2,	%g6,	%l6
	smul	%i1,	%l5,	%l2
	st	%f17,	[%l7 + 0x10]
loop_710:
	or	%o6,	%g3,	%g2
	brz	%l4,	loop_711
	add	%o3,	0x1D02,	%o1
	bcc,pt	%xcc,	loop_712
	ta	%icc,	0x1
loop_711:
	fbge	%fcc3,	loop_713
	brnz,a	%o4,	loop_714
loop_712:
	membar	0x3E
	edge32ln	%i6,	%o0,	%l0
loop_713:
	edge16	%g1,	%i5,	%o5
loop_714:
	edge32	%o7,	%g4,	%g5
	fcmpeq32	%f2,	%f2,	%g7
	movge	%xcc,	%i2,	%i3
	sllx	%l3,	0x17,	%i4
	popc	0x110D,	%i0
	xorcc	%i7,	%l1,	%g6
	subccc	%o2,	%i1,	%l6
	movrlez	%l5,	0x2E5,	%l2
	srax	%g3,	%g2,	%l4
	subc	%o6,	0x11E7,	%o3
	andcc	%o4,	0x14DC,	%o1
	array8	%i6,	%o0,	%g1
	sub	%i5,	%o5,	%o7
	array32	%l0,	%g4,	%g5
	xnorcc	%g7,	%i3,	%l3
	orcc	%i2,	%i4,	%i7
	fmovrsne	%l1,	%f6,	%f5
	srlx	%i0,	%g6,	%i1
	fornot1s	%f26,	%f8,	%f2
	tneg	%icc,	0x3
	stb	%o2,	[%l7 + 0x49]
	fxnor	%f28,	%f24,	%f20
	ldx	[%l7 + 0x78],	%l6
	taddcc	%l2,	%g3,	%g2
	sethi	0x1C94,	%l5
	udivx	%o6,	0x116C,	%l4
	and	%o3,	0x175D,	%o4
	fnors	%f27,	%f5,	%f3
	bshuffle	%f26,	%f4,	%f16
	tcc	%xcc,	0x0
	tleu	%icc,	0x3
	move	%xcc,	%i6,	%o0
	sdivx	%g1,	0x1670,	%i5
	fpsub16	%f28,	%f2,	%f4
	umul	%o5,	0x15BE,	%o1
	tvs	%xcc,	0x5
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x3C] %asi,	%f14
	bn,a	%xcc,	loop_715
	movn	%icc,	%l0,	%g4
	addc	%g5,	%o7,	%i3
	taddcc	%l3,	%g7,	%i4
loop_715:
	fnot1	%f30,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i7,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i0,	0x07,	%l1
	movge	%xcc,	%g6,	%i1
	edge8ln	%l6,	%l2,	%o2
	brgz,a	%g3,	loop_716
	be,pn	%xcc,	loop_717
	swap	[%l7 + 0x48],	%l5
	fbule	%fcc2,	loop_718
loop_716:
	movrgez	%g2,	%l4,	%o3
loop_717:
	movge	%xcc,	%o6,	%i6
	fmovrsne	%o4,	%f31,	%f18
loop_718:
	ta	%icc,	0x1
	fxnors	%f27,	%f24,	%f0
	te	%xcc,	0x2
	stb	%o0,	[%l7 + 0x33]
	subc	%i5,	0x123D,	%o5
	sdiv	%g1,	0x1D18,	%o1
	sdivcc	%g4,	0x1F4B,	%g5
	bcc,a	loop_719
	addc	%l0,	%i3,	%o7
	movrgz	%g7,	0x398,	%i4
	udiv	%l3,	0x0047,	%i2
loop_719:
	movn	%xcc,	%i7,	%l1
	edge8n	%g6,	%i1,	%i0
	brlz,a	%l2,	loop_720
	prefetch	[%l7 + 0x10],	 0x3
	fbn	%fcc0,	loop_721
	fabss	%f18,	%f25
loop_720:
	udivcc	%o2,	0x1F8E,	%g3
	andncc	%l5,	%l6,	%l4
loop_721:
	edge16l	%o3,	%o6,	%i6
	call	loop_722
	srl	%o4,	%o0,	%i5
	fone	%f0
	set	0x14, %i3
	swapa	[%l7 + %i3] 0x88,	%o5
loop_722:
	movpos	%xcc,	%g2,	%g1
	fmul8x16	%f17,	%f6,	%f22
	orcc	%g4,	%o1,	%l0
	sethi	0x1582,	%g5
	set	0x3C, %o1
	ldswa	[%l7 + %o1] 0x89,	%i3
	edge16	%g7,	%i4,	%l3
	movl	%icc,	%o7,	%i7
	movl	%icc,	%l1,	%i2
	movgu	%icc,	%i1,	%i0
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x50] %asi,	%l2
	bcs,a,pt	%xcc,	loop_723
	ldstub	[%l7 + 0x68],	%g6
	smul	%g3,	%l5,	%l6
	bge,pt	%icc,	loop_724
loop_723:
	movl	%xcc,	%l4,	%o3
	edge8n	%o2,	%o6,	%o4
	fnot1s	%f27,	%f17
loop_724:
	bg,a,pn	%xcc,	loop_725
	orncc	%o0,	%i6,	%i5
	umulcc	%o5,	0x159A,	%g1
	fbu	%fcc0,	loop_726
loop_725:
	ldsb	[%l7 + 0x1C],	%g2
	set	0x40, %g4
	ldda	[%l7 + %g4] 0x89,	%f0
loop_726:
	bvs	%icc,	loop_727
	tcs	%icc,	0x4
	add	%g4,	%o1,	%g5
	sllx	%l0,	0x03,	%i3
loop_727:
	tcs	%xcc,	0x7
	tcc	%xcc,	0x7
	brlz,a	%i4,	loop_728
	fcmpgt32	%f18,	%f12,	%g7
	array8	%o7,	%i7,	%l3
	nop
	setx	loop_729,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_728:
	fmovspos	%icc,	%f6,	%f9
	addccc	%i2,	%i1,	%l1
	movcc	%xcc,	%i0,	%g6
loop_729:
	edge8ln	%g3,	%l2,	%l5
	fxnors	%f25,	%f0,	%f29
	ldsb	[%l7 + 0x6D],	%l4
	set	0x2F, %l6
	stba	%o3,	[%l7 + %l6] 0x19
	udivx	%o2,	0x1F8D,	%l6
	fmovrslz	%o6,	%f24,	%f0
	edge8l	%o4,	%o0,	%i6
	fnegd	%f16,	%f24
	xnor	%i5,	0x0D0C,	%g1
	tle	%icc,	0x0
	addccc	%o5,	%g2,	%g4
	fmovdl	%xcc,	%f13,	%f26
	fcmpne16	%f2,	%f6,	%o1
	tvs	%icc,	0x6
	nop
	set	0x38, %g6
	ldd	[%l7 + %g6],	%f8
	movcc	%icc,	%g5,	%i3
	edge16	%l0,	%i4,	%o7
	fmovsvc	%xcc,	%f15,	%f3
	fpackfix	%f18,	%f8
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x64] %asi,	%f21
	brlez,a	%i7,	loop_730
	sll	%l3,	0x05,	%g7
	te	%icc,	0x5
	sethi	0x1229,	%i1
loop_730:
	add	%i2,	%i0,	%l1
	lduh	[%l7 + 0x26],	%g3
	fbu	%fcc3,	loop_731
	fpadd32s	%f4,	%f2,	%f18
	subc	%l2,	%g6,	%l5
	fmovdge	%xcc,	%f6,	%f10
loop_731:
	nop
	set	0x20, %o6
	stwa	%o3,	[%l7 + %o6] 0x2b
	membar	#Sync
	taddcctv	%o2,	0x0315,	%l4
	tleu	%xcc,	0x4
	brnz	%l6,	loop_732
	udivx	%o4,	0x0091,	%o0
	tcs	%icc,	0x6
	movge	%xcc,	%i6,	%o6
loop_732:
	st	%f2,	[%l7 + 0x18]
	smul	%g1,	%o5,	%i5
	fmovdle	%icc,	%f31,	%f18
	sdiv	%g4,	0x0F3B,	%o1
	fmovrdgez	%g5,	%f8,	%f22
	sub	%g2,	%l0,	%i3
	fnand	%f10,	%f24,	%f20
	tneg	%xcc,	0x4
	tsubcc	%o7,	0x0079,	%i7
	andcc	%i4,	%l3,	%i1
	movrgez	%i2,	%g7,	%i0
	addc	%l1,	0x0918,	%l2
	movle	%icc,	%g3,	%g6
	fcmpne32	%f16,	%f10,	%o3
	sethi	0x1383,	%l5
	movrgez	%l4,	%l6,	%o2
	movcs	%xcc,	%o0,	%i6
	array32	%o4,	%o6,	%o5
	srlx	%i5,	%g4,	%g1
	edge32l	%o1,	%g2,	%g5
	edge16	%l0,	%o7,	%i3
	movvs	%xcc,	%i4,	%i7
	te	%icc,	0x0
	set	0x60, %i0
	stda	%i0,	[%l7 + %i0] 0x10
	fnot2	%f6,	%f20
	brnz	%l3,	loop_733
	fmovdgu	%xcc,	%f0,	%f21
	taddcctv	%i2,	0x1D46,	%g7
	movn	%icc,	%l1,	%l2
loop_733:
	fsrc1s	%f13,	%f1
	xnor	%g3,	%i0,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l5,	%l4,	%o3
	edge32n	%o2,	%l6,	%i6
	add	%l7,	0x14,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%o6
	fones	%f11
	tne	%xcc,	0x7
	popc	0x1396,	%o5
	orcc	%o4,	%i5,	%g1
	fmovsl	%icc,	%f16,	%f26
	sir	0x1B94
	srl	%g4,	%g2,	%o1
	movrlz	%g5,	0x338,	%l0
	tvs	%icc,	0x4
	movg	%xcc,	%i3,	%i4
	xorcc	%o7,	%i1,	%i7
	fxors	%f2,	%f12,	%f14
	tge	%xcc,	0x0
	xorcc	%i2,	%g7,	%l3
	tsubcctv	%l2,	0x0000,	%l1
	edge32n	%i0,	%g6,	%g3
	orcc	%l4,	%l5,	%o2
	fmovrsne	%l6,	%f2,	%f20
	brgz,a	%i6,	loop_734
	fbule,a	%fcc2,	loop_735
	tn	%xcc,	0x4
	tpos	%xcc,	0x7
loop_734:
	fbu,a	%fcc0,	loop_736
loop_735:
	xorcc	%o0,	%o6,	%o5
	smulcc	%o4,	%o3,	%g1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x3A] %asi,	%i5
loop_736:
	swap	[%l7 + 0x18],	%g2
	bvc,a	%icc,	loop_737
	fcmpeq32	%f30,	%f24,	%g4
	sdivcc	%o1,	0x0F92,	%l0
	stx	%i3,	[%l7 + 0x48]
loop_737:
	ldd	[%l7 + 0x38],	%f14
	tne	%icc,	0x5
	movcs	%icc,	%i4,	%o7
	set	0x34, %g3
	swapa	[%l7 + %g3] 0x80,	%g5
	call	loop_738
	srlx	%i7,	%i2,	%g7
	sethi	0x179F,	%l3
	fsrc2	%f12,	%f6
loop_738:
	tleu	%icc,	0x6
	movrgez	%l2,	0x12D,	%i1
	fmovdcs	%icc,	%f5,	%f22
	fbne	%fcc0,	loop_739
	fmovrsne	%l1,	%f27,	%f0
	stb	%g6,	[%l7 + 0x52]
	array16	%g3,	%l4,	%i0
loop_739:
	movn	%xcc,	%o2,	%l5
	set	0x28, %o3
	prefetcha	[%l7 + %o3] 0x11,	 0x0
	mulx	%o0,	%i6,	%o6
	tsubcctv	%o5,	%o3,	%g1
	movn	%icc,	%i5,	%g2
	edge8ln	%o4,	%o1,	%g4
	tsubcctv	%i3,	0x1EAF,	%l0
	bgu	loop_740
	sra	%o7,	0x0C,	%g5
	andcc	%i7,	%i2,	%i4
	lduh	[%l7 + 0x74],	%l3
loop_740:
	fcmpgt16	%f8,	%f14,	%l2
	fornot2s	%f20,	%f20,	%f21
	movleu	%icc,	%g7,	%i1
	fmovse	%xcc,	%f20,	%f4
	fpsub16s	%f30,	%f11,	%f29
	bl,a,pn	%xcc,	loop_741
	brgez,a	%l1,	loop_742
	tgu	%xcc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_741:
	subc	%g3,	0x182D,	%l4
loop_742:
	subccc	%g6,	0x15D7,	%i0
	edge8	%o2,	%l5,	%l6
	stw	%i6,	[%l7 + 0x60]
	tneg	%xcc,	0x1
	umulcc	%o6,	%o5,	%o0
	fpadd32	%f4,	%f4,	%f6
	addccc	%o3,	%i5,	%g2
	fmovs	%f16,	%f27
	movleu	%icc,	%g1,	%o1
	addc	%o4,	%i3,	%g4
	andn	%l0,	%o7,	%i7
	andncc	%i2,	%g5,	%l3
	smul	%i4,	0x16BF,	%l2
	fmovrsgez	%g7,	%f17,	%f5
	sir	0x128D
	edge16l	%i1,	%l1,	%g3
	fpsub16s	%f13,	%f18,	%f26
	sdivx	%g6,	0x050D,	%l4
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o2
	move	%icc,	%i0,	%l6
	movgu	%icc,	%i6,	%l5
	wr	%g0,	0x20,	%asi
	stxa	%o5,	[%g0 + 0x18] %asi
	movvc	%xcc,	%o6,	%o0
	mulx	%i5,	%o3,	%g1
	tle	%icc,	0x6
	fmovsge	%icc,	%f18,	%f4
	set	0x18, %g2
	lduwa	[%l7 + %g2] 0x0c,	%g2
	fcmpgt32	%f24,	%f20,	%o4
	stx	%o1,	[%l7 + 0x40]
	movcc	%icc,	%g4,	%l0
	udivx	%o7,	0x0511,	%i7
	bne,a,pt	%icc,	loop_743
	fxnor	%f8,	%f30,	%f22
	andncc	%i3,	%i2,	%g5
	or	%l3,	0x1BE1,	%i4
loop_743:
	edge16ln	%g7,	%i1,	%l1
	movrgez	%g3,	0x355,	%l2
	edge8n	%l4,	%o2,	%g6
	be	loop_744
	brlez	%l6,	loop_745
	fsrc1s	%f17,	%f19
	te	%icc,	0x2
loop_744:
	fnors	%f7,	%f3,	%f3
loop_745:
	bgu,a,pn	%icc,	loop_746
	edge16	%i0,	%l5,	%i6
	sdiv	%o6,	0x1F56,	%o0
	edge32	%i5,	%o5,	%g1
loop_746:
	fmovs	%f13,	%f23
	bgu,a	loop_747
	xorcc	%g2,	%o3,	%o4
	fbul	%fcc3,	loop_748
	sethi	0x036C,	%g4
loop_747:
	edge32	%o1,	%o7,	%l0
	bvs,pn	%icc,	loop_749
loop_748:
	edge16	%i3,	%i2,	%i7
	or	%g5,	0x11A4,	%i4
	move	%icc,	%g7,	%l3
loop_749:
	bleu,pt	%icc,	loop_750
	fpsub16s	%f6,	%f29,	%f15
	fmovrde	%l1,	%f20,	%f12
	tpos	%icc,	0x1
loop_750:
	tg	%icc,	0x4
	fmovsl	%icc,	%f20,	%f2
	set	0x18, %o7
	swapa	[%l7 + %o7] 0x88,	%i1
	taddcctv	%g3,	%l4,	%l2
	popc	0x1BA2,	%o2
	srlx	%g6,	%l6,	%i0
	bl,a,pn	%xcc,	loop_751
	sllx	%l5,	0x11,	%i6
	taddcc	%o0,	%o6,	%i5
	sll	%g1,	%o5,	%g2
loop_751:
	ldd	[%l7 + 0x20],	%f4
	srlx	%o4,	0x0A,	%g4
	sir	0x01B7
	movvs	%icc,	%o3,	%o1
	stbar
	bg	%icc,	loop_752
	te	%xcc,	0x3
	tn	%xcc,	0x7
	movg	%xcc,	%o7,	%l0
loop_752:
	nop
	set	0x56, %o5
	stha	%i2,	[%l7 + %o5] 0x2f
	membar	#Sync
	fbo,a	%fcc2,	loop_753
	fexpand	%f0,	%f24
	movrgz	%i3,	0x1E5,	%i7
	set	0x1C, %i6
	stwa	%i4,	[%l7 + %i6] 0x27
	membar	#Sync
loop_753:
	addc	%g5,	%l3,	%g7
	fzeros	%f8
	tne	%icc,	0x7
	stb	%l1,	[%l7 + 0x0F]
	andn	%i1,	0x0C00,	%g3
	edge32l	%l2,	%o2,	%g6
	tge	%xcc,	0x0
	movrgz	%l4,	%i0,	%l5
	be,a	%xcc,	loop_754
	tgu	%xcc,	0x7
	addccc	%l6,	0x109D,	%o0
	tne	%icc,	0x5
loop_754:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f18,	%f0,	%f18
	movcs	%xcc,	%i6,	%i5
	move	%xcc,	%o6,	%o5
	lduh	[%l7 + 0x6A],	%g1
	array16	%g2,	%g4,	%o3
	andn	%o1,	0x04D7,	%o4
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x16
	membar	#Sync
	tne	%xcc,	0x2
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x60] %asi,	%o7
	fbl,a	%fcc3,	loop_755
	tcs	%xcc,	0x2
	set	0x48, %g1
	lduba	[%l7 + %g1] 0x19,	%i2
loop_755:
	array16	%i3,	%l0,	%i4
	subcc	%g5,	0x1748,	%i7
	edge32l	%l3,	%g7,	%i1
	addc	%l1,	0x1968,	%g3
	bge,a	loop_756
	xnor	%o2,	%l2,	%l4
	array8	%g6,	%l5,	%l6
	ldsh	[%l7 + 0x2C],	%o0
loop_756:
	flush	%l7 + 0x2C
	tvc	%xcc,	0x7
	fmul8x16au	%f16,	%f4,	%f16
	fbge	%fcc2,	loop_757
	sdiv	%i0,	0x1F50,	%i5
	addccc	%o6,	%i6,	%g1
	wr	%g0,	0x23,	%asi
	stha	%g2,	[%l7 + 0x56] %asi
	membar	#Sync
loop_757:
	sdivcc	%g4,	0x0E74,	%o5
	movre	%o3,	%o4,	%o1
	bleu,a	loop_758
	fzeros	%f27
	fands	%f25,	%f14,	%f24
	and	%o7,	0x073A,	%i3
loop_758:
	fbne,a	%fcc1,	loop_759
	fbu,a	%fcc1,	loop_760
	movrgz	%l0,	0x1BC,	%i4
	tn	%xcc,	0x4
loop_759:
	fxor	%f26,	%f6,	%f6
loop_760:
	add	%g5,	%i7,	%i2
	ldsw	[%l7 + 0x08],	%g7
	tg	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l3,	%l1,	%i1
	fmovs	%f30,	%f27
	movrgez	%o2,	%l2,	%g3
	set	0x110, %l4
	stxa	%g6,	[%g0 + %l4] 0x21
	sdivx	%l5,	0x1F21,	%l4
	brgz	%l6,	loop_761
	fmovse	%icc,	%f5,	%f0
	tg	%icc,	0x3
	orcc	%o0,	%i0,	%i5
loop_761:
	movvs	%icc,	%o6,	%i6
	sra	%g2,	0x1E,	%g4
	sethi	0x013B,	%g1
	xnorcc	%o5,	%o4,	%o3
	udivx	%o1,	0x1DD2,	%i3
	add	%o7,	0x128A,	%i4
	addcc	%l0,	%g5,	%i2
	tsubcctv	%i7,	%g7,	%l3
	udiv	%l1,	0x04C6,	%o2
	tg	%xcc,	0x4
	fbule,a	%fcc2,	loop_762
	edge16n	%l2,	%i1,	%g6
	fpadd32	%f28,	%f30,	%f30
	sll	%g3,	0x14,	%l5
loop_762:
	orcc	%l4,	0x1732,	%l6
	array32	%o0,	%i5,	%o6
	fmul8x16	%f11,	%f16,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc3,	%f15,	%f16
	fornot2s	%f19,	%f12,	%f30
	movrlz	%i6,	%g2,	%i0
	wr	%g0,	0xeb,	%asi
	stba	%g4,	[%l7 + 0x0F] %asi
	membar	#Sync
	ta	%xcc,	0x4
	movleu	%xcc,	%g1,	%o4
	add	%o3,	0x0DE3,	%o5
	orn	%i3,	%o1,	%o7
	array32	%i4,	%g5,	%i2
	fbug,a	%fcc3,	loop_763
	orn	%i7,	0x0B97,	%g7
	fpack16	%f30,	%f2
	fmovdcc	%xcc,	%f6,	%f19
loop_763:
	movrgez	%l3,	0x19B,	%l0
	subcc	%l1,	%l2,	%i1
	fbue	%fcc0,	loop_764
	fornot2s	%f1,	%f5,	%f19
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x18,	 0x3
loop_764:
	subcc	%g3,	0x0DF7,	%o2
	edge16ln	%l4,	%l6,	%l5
	movge	%icc,	%o0,	%o6
	bcs,pn	%xcc,	loop_765
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%xcc,	%f15,	%f20
	brgz,a	%i5,	loop_766
loop_765:
	fmovdl	%icc,	%f21,	%f0
	movcc	%xcc,	%g2,	%i6
	umul	%g4,	%g1,	%i0
loop_766:
	fone	%f18
	fnot1s	%f19,	%f11
	udivx	%o4,	0x111A,	%o3
	fmovrdlz	%i3,	%f8,	%f8
	fnot1	%f18,	%f30
	tl	%icc,	0x2
	sllx	%o1,	%o7,	%i4
	fmovspos	%icc,	%f14,	%f19
	array8	%o5,	%g5,	%i2
	sdivx	%g7,	0x130A,	%i7
	tcc	%xcc,	0x1
	movpos	%xcc,	%l0,	%l3
	stx	%l1,	[%l7 + 0x60]
	xor	%l2,	%i1,	%g6
	ldd	[%l7 + 0x60],	%f24
	edge16n	%g3,	%l4,	%o2
	fmul8x16au	%f12,	%f21,	%f16
	fba,a	%fcc2,	loop_767
	fsrc2s	%f5,	%f19
	movvs	%xcc,	%l6,	%l5
	edge32	%o6,	%i5,	%o0
loop_767:
	fbule	%fcc1,	loop_768
	xor	%g2,	0x0123,	%g4
	fbge	%fcc2,	loop_769
	lduw	[%l7 + 0x40],	%g1
loop_768:
	andncc	%i0,	%o4,	%o3
	edge16ln	%i6,	%i3,	%o7
loop_769:
	nop
	set	0x18, %o0
	swapa	[%l7 + %o0] 0x89,	%i4
	andncc	%o5,	%o1,	%g5
	sll	%g7,	0x08,	%i7
	movcc	%xcc,	%l0,	%i2
	set	0x48, %i2
	swapa	[%l7 + %i2] 0x81,	%l3
	smulcc	%l1,	0x042F,	%l2
	fbu	%fcc3,	loop_770
	ba,pt	%xcc,	loop_771
	tcs	%icc,	0x6
	bl	%xcc,	loop_772
loop_770:
	tn	%icc,	0x3
loop_771:
	fbug	%fcc0,	loop_773
	andncc	%i1,	%g6,	%l4
loop_772:
	xor	%g3,	0x0944,	%o2
	fmovdn	%icc,	%f25,	%f6
loop_773:
	fabsd	%f10,	%f6
	movleu	%xcc,	%l5,	%o6
	alignaddrl	%l6,	%i5,	%o0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%g4
	fmovrdgez	%i0,	%f14,	%f6
	fblg	%fcc2,	loop_774
	alignaddrl	%o4,	%g1,	%i6
	edge8	%o3,	%o7,	%i3
	andncc	%o5,	%o1,	%i4
loop_774:
	movgu	%xcc,	%g7,	%i7
	sth	%l0,	[%l7 + 0x38]
	edge32l	%g5,	%i2,	%l1
	bneg,a	%icc,	loop_775
	fornot1s	%f13,	%f21,	%f2
	addc	%l3,	%i1,	%g6
	edge8ln	%l4,	%l2,	%g3
loop_775:
	xnor	%l5,	0x1EE0,	%o6
	movl	%icc,	%l6,	%o2
	fmovsn	%icc,	%f9,	%f11
	umulcc	%i5,	%o0,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x0
	fnot1	%f22,	%f22
	edge16n	%g2,	%i0,	%g1
	ldstub	[%l7 + 0x40],	%i6
	tl	%xcc,	0x0
	brlez,a	%o3,	loop_776
	fors	%f9,	%f10,	%f4
	tcc	%icc,	0x0
	mulx	%o4,	%o7,	%i3
loop_776:
	fmovsl	%xcc,	%f11,	%f19
	fnor	%f6,	%f6,	%f4
	edge16l	%o5,	%i4,	%g7
	movpos	%xcc,	%i7,	%o1
	fsrc2	%f16,	%f16
	sdivx	%l0,	0x0B4D,	%i2
	movleu	%icc,	%g5,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l3,	%g6,	%l4
	addccc	%i1,	%g3,	%l2
	edge8	%l5,	%l6,	%o2
	fmovse	%icc,	%f15,	%f25
	smul	%i5,	0x0730,	%o6
	edge8l	%g4,	%g2,	%o0
	mulx	%i0,	%i6,	%o3
	sethi	0x17ED,	%o4
	fcmple32	%f10,	%f8,	%g1
	sll	%i3,	%o7,	%o5
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i4,	%g7
	brlz	%o1,	loop_777
	fmovdvc	%xcc,	%f4,	%f15
	tvs	%icc,	0x1
	movvc	%xcc,	%l0,	%i2
loop_777:
	udivx	%g5,	0x15FE,	%l1
	ta	%xcc,	0x1
	fmovsge	%xcc,	%f27,	%f14
	prefetch	[%l7 + 0x10],	 0x1
	fcmpgt32	%f10,	%f22,	%i7
	set	0x10, %i4
	stxa	%l3,	[%l7 + %i4] 0x19
	te	%icc,	0x3
	movge	%xcc,	%g6,	%l4
	fzeros	%f7
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x22] %asi,	%g3
	umul	%l2,	%i1,	%l6
	pdist	%f8,	%f20,	%f20
	fandnot2	%f0,	%f10,	%f14
	bleu,a	%xcc,	loop_778
	fmovsg	%icc,	%f11,	%f25
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x08] %asi,	%f8
loop_778:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x64] %asi,	%l5
	array8	%i5,	%o2,	%g4
	fpack32	%f28,	%f24,	%f30
	mulscc	%o6,	0x17B3,	%g2
	sll	%i0,	%o0,	%o3
	movle	%xcc,	%i6,	%o4
	srax	%i3,	0x07,	%o7
	fmovsg	%xcc,	%f5,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x3A, %g7
	lduh	[%l7 + %g7],	%g1
	prefetch	[%l7 + 0x34],	 0x3
	for	%f14,	%f16,	%f26
	edge16n	%o5,	%g7,	%i4
	movrlz	%l0,	%i2,	%o1
	alignaddr	%g5,	%i7,	%l1
	orcc	%g6,	0x0B78,	%l4
	tcs	%xcc,	0x2
	array8	%g3,	%l3,	%l2
	tsubcctv	%i1,	0x0B14,	%l5
	bgu,a	%icc,	loop_779
	sth	%l6,	[%l7 + 0x2E]
	xnor	%o2,	0x0122,	%i5
	edge8	%o6,	%g2,	%i0
loop_779:
	fmovdgu	%icc,	%f13,	%f9
	srl	%o0,	%o3,	%i6
	fmuld8sux16	%f4,	%f25,	%f12
	movvc	%xcc,	%g4,	%i3
	movn	%xcc,	%o7,	%g1
	addccc	%o5,	0x0640,	%o4
	smul	%g7,	0x1BB9,	%i4
	tn	%xcc,	0x7
	tcs	%xcc,	0x2
	stbar
	bvc	%icc,	loop_780
	fpsub32	%f18,	%f12,	%f28
	umulcc	%l0,	0x0A93,	%o1
	fmovdpos	%icc,	%f31,	%f7
loop_780:
	xorcc	%i2,	%i7,	%g5
	set	0x4D, %l1
	ldsba	[%l7 + %l1] 0x18,	%g6
	edge8n	%l4,	%g3,	%l1
	edge8n	%l2,	%i1,	%l3
	fmovdleu	%xcc,	%f27,	%f14
	fmovdgu	%icc,	%f10,	%f13
	tl	%icc,	0x3
	movg	%icc,	%l5,	%o2
	sllx	%i5,	0x17,	%o6
	fbe,a	%fcc2,	loop_781
	ldsb	[%l7 + 0x44],	%g2
	sllx	%l6,	0x00,	%o0
	fmovrsgez	%i0,	%f12,	%f21
loop_781:
	bleu	%icc,	loop_782
	tcc	%icc,	0x6
	fmovsne	%xcc,	%f14,	%f15
	sdiv	%i6,	0x0EDA,	%g4
loop_782:
	fandnot2s	%f10,	%f20,	%f30
	fmovdn	%icc,	%f9,	%f7
	brz	%i3,	loop_783
	fbe,a	%fcc2,	loop_784
	fbule,a	%fcc2,	loop_785
	sir	0x1215
loop_783:
	st	%f15,	[%l7 + 0x1C]
loop_784:
	xorcc	%o7,	0x0567,	%g1
loop_785:
	movvs	%icc,	%o5,	%o4
	edge16n	%o3,	%i4,	%g7
	movleu	%xcc,	%l0,	%o1
	fpack16	%f20,	%f29
	movcs	%icc,	%i7,	%g5
	set	0x60, %o4
	sta	%f28,	[%l7 + %o4] 0x15
	ldd	[%l7 + 0x40],	%g6
	movl	%icc,	%i2,	%l4
	tpos	%icc,	0x1
	smulcc	%l1,	%g3,	%i1
	bcc,a	loop_786
	fmovrdgez	%l3,	%f18,	%f14
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x10] %asi,	%l4
loop_786:
	movvs	%xcc,	%o2,	%i5
	mova	%icc,	%o6,	%l2
	movne	%icc,	%g2,	%o0
	wr	%g0,	0x18,	%asi
	stba	%i0,	[%l7 + 0x5A] %asi
	andn	%l6,	0x1023,	%i6
	bleu	%icc,	loop_787
	edge16ln	%i3,	%o7,	%g4
	std	%f8,	[%l7 + 0x20]
	ldsw	[%l7 + 0x5C],	%o5
loop_787:
	nop
	set	0x7D, %i5
	lduba	[%l7 + %i5] 0x15,	%g1
	ldsw	[%l7 + 0x40],	%o3
	fnot1	%f4,	%f2
	movrlz	%o4,	%g7,	%l0
	sethi	0x0AB9,	%i4
	fmovdcs	%xcc,	%f2,	%f24
	sir	0x01E2
	faligndata	%f0,	%f28,	%f26
	array8	%o1,	%i7,	%g5
	tcs	%icc,	0x4
	brgz,a	%g6,	loop_788
	fmovrslez	%i2,	%f31,	%f15
	fmul8x16	%f18,	%f20,	%f2
	ldd	[%l7 + 0x58],	%f28
loop_788:
	ba,pt	%icc,	loop_789
	andcc	%l4,	0x0C1F,	%l1
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
loop_789:
	edge8l	%g3,	%i1,	%l5
	fba	%fcc3,	loop_790
	udivx	%l3,	0x1A68,	%o2
	te	%icc,	0x2
	sra	%i5,	%o6,	%g2
loop_790:
	tvc	%xcc,	0x5
	tvc	%xcc,	0x6
	tvc	%icc,	0x4
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%l2
	movge	%icc,	%o0,	%i0
	edge8	%i6,	%i3,	%l6
	faligndata	%f2,	%f18,	%f30
	or	%o7,	%g4,	%o5
	udiv	%g1,	0x1A45,	%o4
	wr	%g0,	0x81,	%asi
	stha	%g7,	[%l7 + 0x3A] %asi
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%o3
	umulcc	%l0,	%o1,	%i7
	fcmpne32	%f24,	%f22,	%g5
	flush	%l7 + 0x34
	edge8	%g6,	%i2,	%i4
	array16	%l4,	%l1,	%g3
	addccc	%i1,	%l5,	%o2
	edge32ln	%l3,	%o6,	%i5
	tleu	%xcc,	0x4
	membar	0x4E
	sdivx	%l2,	0x048C,	%g2
	sth	%i0,	[%l7 + 0x1A]
	srax	%i6,	0x1E,	%o0
	ldstub	[%l7 + 0x4A],	%l6
	fzeros	%f0
	orcc	%o7,	%i3,	%o5
	brnz,a	%g4,	loop_791
	movleu	%icc,	%o4,	%g1
	edge8	%g7,	%o3,	%o1
	fpadd32s	%f13,	%f9,	%f31
loop_791:
	nop
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	brnz,a	%i7,	loop_792
	xor	%l0,	%g6,	%g5
	tcc	%xcc,	0x2
	smulcc	%i2,	0x1AFE,	%i4
loop_792:
	fbge,a	%fcc3,	loop_793
	sir	0x02D6
	fbg	%fcc0,	loop_794
	alignaddr	%l4,	%l1,	%i1
loop_793:
	bleu	loop_795
	andn	%l5,	0x1D35,	%o2
loop_794:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x80,	%l3,	%g3
loop_795:
	addcc	%i5,	0x0D83,	%l2
	movcc	%xcc,	%g2,	%o6
	fsrc2s	%f2,	%f24
	sdiv	%i6,	0x0E52,	%i0
	stx	%o0,	[%l7 + 0x08]
	orcc	%o7,	%l6,	%o5
	srax	%g4,	%i3,	%g1
	and	%g7,	%o3,	%o1
	movg	%xcc,	%i7,	%o4
	edge8	%l0,	%g5,	%i2
	subc	%g6,	0x07D9,	%i4
	movrne	%l1,	%l4,	%l5
	fnegs	%f14,	%f26
	taddcc	%o2,	0x10C0,	%l3
	tpos	%icc,	0x3
	popc	%i1,	%i5
	movre	%l2,	0x22E,	%g2
	popc	%g3,	%o6
	bne	%icc,	loop_796
	fcmpgt16	%f28,	%f28,	%i6
	subccc	%o0,	0x0535,	%o7
	ldd	[%l7 + 0x70],	%i0
loop_796:
	sethi	0x13B9,	%l6
	movrlz	%g4,	0x12B,	%i3
	tvc	%icc,	0x3
	orcc	%o5,	%g1,	%o3
	fsrc1	%f12,	%f8
	fpsub16	%f8,	%f26,	%f12
	edge32ln	%o1,	%i7,	%g7
	edge32ln	%l0,	%o4,	%g5
	bl,pn	%xcc,	loop_797
	fmovda	%xcc,	%f11,	%f12
	umulcc	%g6,	%i2,	%l1
	nop
	setx loop_798, %l0, %l1
	jmpl %l1, %l4
loop_797:
	smul	%l5,	0x1215,	%o2
	movcs	%icc,	%i4,	%l3
	xorcc	%i1,	0x090F,	%i5
loop_798:
	alignaddrl	%g2,	%g3,	%o6
	bge	%icc,	loop_799
	bg,a	%xcc,	loop_800
	edge32n	%i6,	%l2,	%o7
	subc	%o0,	0x0C7E,	%l6
loop_799:
	tle	%icc,	0x2
loop_800:
	andn	%i0,	0x0158,	%i3
	pdist	%f10,	%f2,	%f20
	movneg	%icc,	%o5,	%g4
	or	%g1,	%o3,	%i7
	edge16l	%o1,	%l0,	%o4
	orn	%g7,	%g6,	%g5
	add	%l1,	0x1991,	%i2
	xnor	%l4,	0x050D,	%o2
	addc	%l5,	0x01C1,	%l3
	fand	%f6,	%f18,	%f28
	tgu	%xcc,	0x3
	brgez,a	%i1,	loop_801
	movre	%i5,	0x0BA,	%g2
	fsrc1	%f20,	%f30
	sra	%g3,	%i4,	%i6
loop_801:
	edge8	%l2,	%o6,	%o0
	popc	%o7,	%i0
	movrgz	%l6,	0x02B,	%o5
	ldstub	[%l7 + 0x6B],	%i3
	bleu,a	loop_802
	addcc	%g1,	%o3,	%i7
	tvc	%xcc,	0x5
	sllx	%g4,	0x19,	%l0
loop_802:
	tsubcctv	%o4,	%g7,	%o1
	tleu	%xcc,	0x5
	fabsd	%f8,	%f20
	tgu	%icc,	0x6
	tvc	%xcc,	0x1
	set	0x7C, %g5
	lduba	[%l7 + %g5] 0x14,	%g5
	mulx	%g6,	%i2,	%l1
	subc	%o2,	%l5,	%l4
	edge16l	%l3,	%i5,	%i1
	movle	%xcc,	%g2,	%i4
	tl	%xcc,	0x3
	fandnot1	%f26,	%f4,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f20,	%f22,	%i6
	edge32ln	%g3,	%o6,	%l2
	edge16n	%o7,	%i0,	%o0
	edge32ln	%l6,	%o5,	%i3
	movvc	%icc,	%o3,	%i7
	set	0x16, %l2
	lduha	[%l7 + %l2] 0x19,	%g1
	brlz,a	%l0,	loop_803
	fmovdpos	%icc,	%f3,	%f30
	lduw	[%l7 + 0x44],	%g4
	subc	%g7,	0x1EEC,	%o4
loop_803:
	orn	%o1,	0x052C,	%g5
	sub	%i2,	%l1,	%g6
	fmovdl	%xcc,	%f30,	%f17
	movpos	%xcc,	%o2,	%l4
	edge8	%l5,	%i5,	%l3
	movcc	%icc,	%g2,	%i4
	tne	%icc,	0x6
	and	%i6,	0x07C8,	%g3
	movcs	%xcc,	%i1,	%l2
	stbar
	tvc	%xcc,	0x6
	fbg,a	%fcc0,	loop_804
	fmovsa	%icc,	%f24,	%f0
	tge	%xcc,	0x7
	fmovsneg	%xcc,	%f13,	%f31
loop_804:
	ldd	[%l7 + 0x40],	%f24
	bg,pn	%icc,	loop_805
	sdivcc	%o7,	0x0872,	%o6
	bge,pn	%icc,	loop_806
	fmovsge	%icc,	%f15,	%f7
loop_805:
	swap	[%l7 + 0x28],	%i0
	taddcc	%l6,	%o5,	%i3
loop_806:
	sdivx	%o3,	0x049D,	%i7
	movrgez	%g1,	0x0E4,	%l0
	ldd	[%l7 + 0x40],	%f24
	fsrc2	%f10,	%f20
	smulcc	%o0,	%g7,	%o4
	taddcctv	%o1,	0x1CFF,	%g5
	nop
	set	0x1D, %l3
	stb	%i2,	[%l7 + %l3]
	movleu	%xcc,	%l1,	%g4
	fones	%f1
	movpos	%xcc,	%g6,	%l4
	addcc	%o2,	%l5,	%i5
	movl	%icc,	%l3,	%g2
	addccc	%i6,	0x1AE1,	%g3
	prefetch	[%l7 + 0x5C],	 0x0
	edge32l	%i4,	%l2,	%i1
	tn	%xcc,	0x0
	fzeros	%f20
	alignaddrl	%o7,	%i0,	%o6
	fmovdl	%xcc,	%f17,	%f22
	edge32ln	%l6,	%i3,	%o5
	addc	%i7,	0x19E2,	%o3
	fmul8x16	%f30,	%f4,	%f24
	andcc	%l0,	%g1,	%o0
	tgu	%xcc,	0x3
	sdiv	%g7,	0x0818,	%o1
	fbule	%fcc1,	loop_807
	mulscc	%g5,	0x11D2,	%i2
	alignaddr	%o4,	%g4,	%g6
	stbar
loop_807:
	tl	%xcc,	0x0
	fbg	%fcc3,	loop_808
	bvs,pn	%xcc,	loop_809
	smulcc	%l1,	%l4,	%l5
	orn	%o2,	0x0CA8,	%l3
loop_808:
	addcc	%g2,	0x1858,	%i5
loop_809:
	brnz,a	%g3,	loop_810
	edge8l	%i6,	%i4,	%i1
	add	%l2,	%i0,	%o6
	tcc	%xcc,	0x6
loop_810:
	nop
	wr	%g0,	0x50,	%asi
	ldxa	[%g0 + 0x30] %asi,	%l6
	subc	%i3,	0x1D64,	%o5
	fbo	%fcc3,	loop_811
	movrgez	%o7,	0x056,	%i7
	addccc	%l0,	0x19E2,	%g1
	fpadd32	%f2,	%f6,	%f14
loop_811:
	tge	%icc,	0x1
	tl	%icc,	0x1
	add	%l7,	0x74,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x19,	%o3,	%g7
	brgz,a	%o1,	loop_812
	fbne,a	%fcc3,	loop_813
	fandnot1	%f26,	%f24,	%f26
	flush	%l7 + 0x34
loop_812:
	alignaddr	%o0,	%g5,	%o4
loop_813:
	array8	%i2,	%g6,	%g4
	subccc	%l4,	0x0E36,	%l1
	brgez	%l5,	loop_814
	edge32l	%l3,	%g2,	%i5
	smulcc	%o2,	0x14E6,	%i6
	fmovs	%f20,	%f20
loop_814:
	fmul8x16al	%f10,	%f21,	%f10
	andcc	%i4,	%i1,	%g3
	umulcc	%i0,	%l2,	%l6
	movneg	%icc,	%o6,	%i3
	bl,a,pt	%xcc,	loop_815
	faligndata	%f20,	%f16,	%f16
	xor	%o5,	%o7,	%i7
	movg	%icc,	%l0,	%g1
loop_815:
	fmovde	%icc,	%f8,	%f23
	movl	%xcc,	%o3,	%g7
	popc	0x0EA9,	%o0
	tg	%xcc,	0x0
	wr	%g0,	0x04,	%asi
	stda	%o0,	[%l7 + 0x50] %asi
	movneg	%xcc,	%o4,	%i2
	bgu,a	loop_816
	bneg,pn	%xcc,	loop_817
	movleu	%xcc,	%g6,	%g4
	edge16l	%g5,	%l1,	%l5
loop_816:
	ta	%icc,	0x4
loop_817:
	fbe	%fcc3,	loop_818
	fsrc1s	%f11,	%f13
	ldstub	[%l7 + 0x0F],	%l3
	popc	0x1C7E,	%l4
loop_818:
	fmovrdlez	%i5,	%f4,	%f14
	fbg,a	%fcc0,	loop_819
	bshuffle	%f16,	%f2,	%f16
	ldsw	[%l7 + 0x28],	%o2
	ldstub	[%l7 + 0x49],	%i6
loop_819:
	brgz	%g2,	loop_820
	fmovrdlz	%i1,	%f8,	%f22
	bne,a,pn	%icc,	loop_821
	flush	%l7 + 0x30
loop_820:
	fbo,a	%fcc1,	loop_822
	movge	%xcc,	%i4,	%g3
loop_821:
	fcmps	%fcc2,	%f21,	%f1
	fmovrsne	%i0,	%f5,	%f31
loop_822:
	fnot2	%f24,	%f14
	fcmpne16	%f14,	%f10,	%l2
	movvs	%icc,	%o6,	%l6
	bneg,pn	%xcc,	loop_823
	movvc	%icc,	%i3,	%o5
	flush	%l7 + 0x6C
	orncc	%o7,	%l0,	%i7
loop_823:
	srlx	%o3,	0x1A,	%g1
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x36] %asi,	%o0
	movgu	%icc,	%o1,	%o4
	andn	%g7,	0x1A0A,	%i2
	edge16ln	%g4,	%g6,	%g5
	movre	%l5,	0x2F6,	%l1
	fxor	%f20,	%f18,	%f28
	tsubcc	%l4,	%i5,	%o2
	fpsub32	%f26,	%f8,	%f2
	edge32n	%l3,	%i6,	%g2
	lduw	[%l7 + 0x4C],	%i1
	fmul8x16	%f29,	%f12,	%f30
	sllx	%g3,	%i0,	%l2
	umul	%i4,	0x123E,	%l6
	edge8l	%o6,	%o5,	%o7
	edge8l	%i3,	%l0,	%i7
	edge8l	%o3,	%g1,	%o1
	ta	%xcc,	0x0
	fxor	%f14,	%f28,	%f26
	alignaddrl	%o0,	%g7,	%o4
	set	0x60, %i7
	lduha	[%l7 + %i7] 0x15,	%g4
	edge16ln	%g6,	%i2,	%l5
	fbge,a	%fcc1,	loop_824
	tvs	%icc,	0x3
	movrne	%l1,	0x32F,	%g5
	set	0x74, %o2
	lduba	[%l7 + %o2] 0x19,	%l4
loop_824:
	edge16	%o2,	%i5,	%i6
	tleu	%icc,	0x5
	tle	%icc,	0x1
	fpsub32s	%f2,	%f3,	%f29
	bvs	%icc,	loop_825
	siam	0x1
	movrlz	%g2,	%i1,	%g3
	fmovscc	%icc,	%f8,	%f3
loop_825:
	subcc	%l3,	%l2,	%i4
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x26] %asi,	%l6
	fmovdvc	%xcc,	%f0,	%f16
	tsubcc	%i0,	0x1A28,	%o6
	edge8l	%o5,	%i3,	%o7
	udivcc	%l0,	0x12AF,	%o3
	bl,pn	%icc,	loop_826
	alignaddrl	%g1,	%i7,	%o1
	xnor	%o0,	%o4,	%g7
	orncc	%g4,	0x1C9E,	%g6
loop_826:
	fmovdvs	%xcc,	%f25,	%f28
	membar	0x40
	addcc	%l5,	%l1,	%i2
	brlez,a	%g5,	loop_827
	orcc	%o2,	%l4,	%i6
	fbg,a	%fcc3,	loop_828
	tvs	%xcc,	0x3
loop_827:
	fpsub32s	%f15,	%f29,	%f14
	stbar
loop_828:
	movrgez	%g2,	0x276,	%i5
	ldd	[%l7 + 0x10],	%f10
	umul	%g3,	%i1,	%l3
	ta	%icc,	0x4
	fmovsn	%icc,	%f9,	%f5
	tvc	%xcc,	0x3
	movn	%xcc,	%i4,	%l6
	lduw	[%l7 + 0x24],	%l2
	movrgez	%i0,	%o6,	%o5
	sir	0x186D
	ld	[%l7 + 0x34],	%f1
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x2C] %asi,	%o7
	tg	%xcc,	0x5
	fmuld8ulx16	%f3,	%f5,	%f22
	movgu	%xcc,	%i3,	%o3
	taddcc	%g1,	%l0,	%i7
	set	0x48, %i1
	lda	[%l7 + %i1] 0x15,	%f14
	andcc	%o1,	%o0,	%o4
	movl	%icc,	%g7,	%g6
	movgu	%icc,	%l5,	%l1
	sdiv	%g4,	0x1E3E,	%i2
	sdivx	%g5,	0x046C,	%l4
	fbue	%fcc2,	loop_829
	fnand	%f8,	%f6,	%f12
	bg	%icc,	loop_830
	fmovdpos	%xcc,	%f17,	%f14
loop_829:
	sdivx	%o2,	0x0112,	%g2
	smulcc	%i6,	0x0DF8,	%g3
loop_830:
	bgu,pt	%icc,	loop_831
	brz,a	%i5,	loop_832
	tsubcctv	%l3,	0x171E,	%i4
	tsubcc	%i1,	%l2,	%i0
loop_831:
	tgu	%xcc,	0x5
loop_832:
	movgu	%icc,	%o6,	%l6
	tneg	%icc,	0x7
	movleu	%xcc,	%o5,	%i3
	subcc	%o3,	%g1,	%l0
	fbge,a	%fcc0,	loop_833
	brgez	%i7,	loop_834
	be,a,pn	%icc,	loop_835
	std	%f16,	[%l7 + 0x48]
loop_833:
	tg	%icc,	0x3
loop_834:
	movcs	%xcc,	%o1,	%o0
loop_835:
	lduh	[%l7 + 0x34],	%o4
	fmuld8ulx16	%f5,	%f28,	%f8
	movneg	%icc,	%o7,	%g6
	fbug	%fcc3,	loop_836
	fcmpne32	%f30,	%f30,	%g7
	ba,pn	%icc,	loop_837
	alignaddrl	%l5,	%g4,	%l1
loop_836:
	tsubcc	%g5,	0x0C7C,	%i2
	movrgez	%o2,	0x335,	%l4
loop_837:
	fmovse	%xcc,	%f16,	%f30
	smulcc	%g2,	%g3,	%i6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] 0x80,	%i5,	%i4
	add	%i1,	%l2,	%l3
	movneg	%icc,	%i0,	%o6
	bvc,pt	%xcc,	loop_838
	bn,a	loop_839
	movcs	%icc,	%o5,	%i3
	array16	%o3,	%g1,	%l0
loop_838:
	movl	%xcc,	%i7,	%o1
loop_839:
	udivcc	%l6,	0x09E9,	%o0
	call	loop_840
	move	%icc,	%o4,	%g6
	fexpand	%f18,	%f10
	ldsb	[%l7 + 0x20],	%o7
loop_840:
	movcs	%xcc,	%l5,	%g7
	fmuld8ulx16	%f25,	%f29,	%f22
	mulx	%l1,	%g5,	%i2
	fcmped	%fcc1,	%f8,	%f24
	addc	%o2,	%g4,	%l4
	brlz	%g2,	loop_841
	tl	%xcc,	0x3
	fbne	%fcc0,	loop_842
	taddcctv	%i6,	0x132D,	%g3
loop_841:
	membar	0x21
	fnot1	%f2,	%f0
loop_842:
	array16	%i4,	%i1,	%i5
	xor	%l2,	0x19D6,	%l3
	array8	%i0,	%o6,	%i3
	tcs	%xcc,	0x6
	stw	%o5,	[%l7 + 0x6C]
	array16	%o3,	%g1,	%l0
	fxnors	%f29,	%f8,	%f29
	udivcc	%o1,	0x0E18,	%i7
	array32	%l6,	%o0,	%o4
	tne	%icc,	0x7
	mulscc	%o7,	%l5,	%g7
	movl	%icc,	%g6,	%g5
	xorcc	%i2,	0x130F,	%o2
	movgu	%xcc,	%l1,	%l4
	tleu	%xcc,	0x5
	sll	%g2,	%g4,	%g3
	smul	%i6,	%i1,	%i4
	fcmps	%fcc3,	%f19,	%f14
	fbe,a	%fcc2,	loop_843
	fmovs	%f1,	%f21
	edge32ln	%i5,	%l3,	%l2
	fornot1s	%f8,	%f7,	%f24
loop_843:
	andncc	%i0,	%i3,	%o6
	set	0x78, %o1
	ldswa	[%l7 + %o1] 0x81,	%o5
	membar	0x19
	movrlez	%o3,	%g1,	%o1
	srax	%i7,	%l6,	%l0
	alignaddrl	%o0,	%o4,	%o7
	orn	%l5,	0x0A6B,	%g6
	orncc	%g5,	0x1E7B,	%g7
	movpos	%icc,	%o2,	%i2
	srlx	%l1,	%l4,	%g4
	fmovdn	%xcc,	%f20,	%f10
	fand	%f18,	%f0,	%f6
	bvc,a	%icc,	loop_844
	fmovdne	%icc,	%f15,	%f27
	sir	0x1C4F
	fnot1s	%f10,	%f24
loop_844:
	fmovsleu	%xcc,	%f30,	%f7
	brgz	%g2,	loop_845
	movrgz	%i6,	0x0A7,	%i1
	bvs,pn	%icc,	loop_846
	fbule,a	%fcc3,	loop_847
loop_845:
	tvs	%icc,	0x6
	ldstub	[%l7 + 0x25],	%g3
loop_846:
	fmovdvs	%icc,	%f28,	%f24
loop_847:
	udivcc	%i4,	0x1F25,	%l3
	wr	%g0,	0x81,	%asi
	stxa	%i5,	[%l7 + 0x20] %asi
	nop
	set	0x50, %g4
	lduw	[%l7 + %g4],	%l2
	popc	0x0CB0,	%i0
	movrgz	%o6,	%i3,	%o5
	brz,a	%g1,	loop_848
	xor	%o3,	0x1549,	%i7
	fpadd32	%f22,	%f12,	%f26
	movle	%icc,	%o1,	%l6
loop_848:
	popc	%l0,	%o0
	fmovrse	%o4,	%f8,	%f16
	fnot2	%f14,	%f6
	fmovsne	%xcc,	%f9,	%f19
	sllx	%l5,	%o7,	%g6
	movg	%xcc,	%g7,	%g5
	addcc	%o2,	0x1D06,	%l1
	tcs	%xcc,	0x6
	swap	[%l7 + 0x58],	%i2
	sra	%l4,	%g2,	%i6
	movpos	%xcc,	%g4,	%i1
	bl,a	%icc,	loop_849
	lduw	[%l7 + 0x48],	%i4
	ldd	[%l7 + 0x78],	%g2
	sethi	0x0C51,	%i5
loop_849:
	fcmped	%fcc0,	%f6,	%f2
	add	%l3,	0x1DD0,	%l2
	ta	%icc,	0x5
	fmovrdne	%o6,	%f28,	%f10
	fmovsne	%icc,	%f12,	%f28
	srl	%i0,	0x11,	%i3
	movrlez	%o5,	0x0EB,	%g1
	movrgz	%i7,	%o3,	%l6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o1,	%o0
	edge16ln	%o4,	%l5,	%o7
	edge32n	%g6,	%l0,	%g5
	tle	%icc,	0x7
	fmovsvs	%icc,	%f11,	%f6
	brgz	%o2,	loop_850
	movn	%xcc,	%g7,	%l1
	stw	%l4,	[%l7 + 0x1C]
	movrgz	%i2,	0x102,	%g2
loop_850:
	movgu	%xcc,	%i6,	%g4
	umul	%i1,	0x044E,	%g3
	srl	%i4,	0x0C,	%i5
	fmovse	%icc,	%f25,	%f7
	prefetch	[%l7 + 0x60],	 0x2
	fpack16	%f0,	%f29
	edge8n	%l3,	%o6,	%i0
	bne,a	%xcc,	loop_851
	movgu	%icc,	%l2,	%i3
	fpsub32	%f0,	%f26,	%f0
	st	%f25,	[%l7 + 0x44]
loop_851:
	fba	%fcc2,	loop_852
	movrgez	%g1,	0x0B6,	%o5
	wr	%g0,	0x23,	%asi
	stwa	%o3,	[%l7 + 0x18] %asi
	membar	#Sync
loop_852:
	ldx	[%l7 + 0x78],	%i7
	array8	%l6,	%o0,	%o4
	fbne	%fcc1,	loop_853
	fornot2	%f22,	%f26,	%f14
	tpos	%icc,	0x4
	addc	%l5,	%o1,	%g6
loop_853:
	xorcc	%l0,	0x11C7,	%g5
	edge32ln	%o2,	%o7,	%g7
	subcc	%l4,	%i2,	%l1
	stb	%g2,	[%l7 + 0x4D]
	addc	%g4,	%i1,	%i6
	orncc	%i4,	%g3,	%l3
	fbul,a	%fcc3,	loop_854
	fbn	%fcc0,	loop_855
	edge8n	%i5,	%o6,	%l2
	srax	%i0,	0x0E,	%g1
loop_854:
	bge	loop_856
loop_855:
	subc	%i3,	0x1A13,	%o3
	tne	%icc,	0x7
	xorcc	%i7,	%l6,	%o5
loop_856:
	ta	%xcc,	0x4
	ldsb	[%l7 + 0x30],	%o0
	fnegd	%f24,	%f14
	tge	%icc,	0x6
	edge32l	%o4,	%l5,	%g6
	wr	%g0,	0x0c,	%asi
	sta	%f19,	[%l7 + 0x3C] %asi
	sir	0x14BB
	lduh	[%l7 + 0x1A],	%o1
	movle	%xcc,	%g5,	%o2
	edge8ln	%l0,	%o7,	%l4
	xnor	%i2,	%g7,	%l1
	and	%g4,	%i1,	%i6
	tcs	%xcc,	0x0
	fmovsleu	%icc,	%f0,	%f30
	srax	%i4,	0x1F,	%g3
	ldsw	[%l7 + 0x44],	%g2
	edge32	%l3,	%i5,	%o6
	bpos,pt	%xcc,	loop_857
	fmovscs	%icc,	%f2,	%f18
	fcmpne16	%f12,	%f0,	%l2
	fcmpeq32	%f12,	%f18,	%g1
loop_857:
	sdivx	%i0,	0x0DDC,	%i3
	udivcc	%o3,	0x0496,	%l6
	fmovrsgez	%o5,	%f15,	%f25
	edge16ln	%i7,	%o0,	%l5
	movle	%icc,	%o4,	%o1
	array8	%g6,	%o2,	%g5
	bcs	%xcc,	loop_858
	sll	%o7,	0x11,	%l0
	fzero	%f20
	sub	%i2,	%l4,	%g7
loop_858:
	movleu	%xcc,	%l1,	%g4
	subcc	%i6,	%i1,	%i4
	fmovdcs	%icc,	%f24,	%f10
	fmovrslz	%g2,	%f17,	%f27
	stbar
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x10
	tle	%icc,	0x0
	sir	0x1224
	or	%g3,	0x1D9E,	%i5
	movneg	%icc,	%o6,	%l3
	addccc	%l2,	%i0,	%g1
	fbn,a	%fcc1,	loop_859
	sll	%o3,	0x03,	%l6
	srl	%o5,	0x12,	%i3
	popc	%o0,	%i7
loop_859:
	orncc	%l5,	%o4,	%o1
	edge16ln	%o2,	%g6,	%o7
	nop
	set	0x70, %g6
	ldd	[%l7 + %g6],	%l0
	edge8ln	%i2,	%l4,	%g7
	fmovrdlez	%g5,	%f24,	%f2
	swap	[%l7 + 0x54],	%l1
	swap	[%l7 + 0x64],	%g4
	set	0x58, %l6
	sta	%f25,	[%l7 + %l6] 0x11
	popc	0x05E1,	%i6
	tle	%xcc,	0x1
	xnorcc	%i4,	%g2,	%g3
	te	%xcc,	0x3
	udivx	%i5,	0x1CB2,	%i1
	fmovrdgez	%l3,	%f14,	%f2
	edge32l	%l2,	%i0,	%o6
	set	0x30, %i0
	ldda	[%l7 + %i0] 0x2a,	%g0
	tl	%xcc,	0x4
	sethi	0x1400,	%o3
	movcs	%icc,	%o5,	%i3
	umul	%l6,	%i7,	%o0
	array32	%o4,	%o1,	%o2
	movrne	%l5,	%g6,	%l0
	bge	%icc,	loop_860
	fcmpeq16	%f18,	%f4,	%i2
	mova	%xcc,	%o7,	%l4
	wr	%g0,	0x88,	%asi
	stba	%g7,	[%l7 + 0x4F] %asi
loop_860:
	fpsub16s	%f30,	%f17,	%f14
	ldsh	[%l7 + 0x52],	%l1
	std	%f2,	[%l7 + 0x68]
	taddcc	%g4,	0x060F,	%g5
	fnor	%f20,	%f16,	%f28
	fpsub16s	%f3,	%f26,	%f15
	orncc	%i4,	0x14A0,	%i6
	fble	%fcc3,	loop_861
	smulcc	%g2,	0x140A,	%i5
	movl	%icc,	%i1,	%g3
	fmovsleu	%icc,	%f22,	%f31
loop_861:
	movcc	%xcc,	%l3,	%i0
	fpadd16s	%f21,	%f0,	%f3
	fbe	%fcc3,	loop_862
	taddcc	%l2,	0x0793,	%o6
	bg,pn	%xcc,	loop_863
	movrgez	%g1,	%o3,	%i3
loop_862:
	fxnors	%f3,	%f4,	%f17
	movne	%xcc,	%o5,	%i7
loop_863:
	brlez,a	%o0,	loop_864
	brlez	%l6,	loop_865
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o4,	0x222,	%o1
loop_864:
	edge16l	%o2,	%g6,	%l0
loop_865:
	fmovdcc	%xcc,	%f3,	%f28
	udivcc	%i2,	0x0143,	%o7
	add	%l5,	0x042F,	%l4
	wr	%g0,	0x11,	%asi
	stwa	%l1,	[%l7 + 0x70] %asi
	bne	%xcc,	loop_866
	orncc	%g7,	%g5,	%i4
	movneg	%icc,	%g4,	%g2
	sdivx	%i6,	0x0FC8,	%i5
loop_866:
	tsubcc	%g3,	%l3,	%i0
	andncc	%l2,	%o6,	%i1
	subc	%o3,	0x1601,	%i3
	popc	0x0E71,	%g1
	sll	%o5,	%o0,	%l6
	xnor	%o4,	%o1,	%o2
	be	loop_867
	fmovrdne	%i7,	%f22,	%f4
	udivx	%g6,	0x1A77,	%l0
	tle	%icc,	0x6
loop_867:
	nop
	set	0x70, %g3
	ldsba	[%l7 + %g3] 0x88,	%o7
	fbu	%fcc3,	loop_868
	srl	%i2,	0x01,	%l5
	fpackfix	%f22,	%f8
	add	%l7,	0x64,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l1,	%g7
loop_868:
	stbar
	array8	%l4,	%i4,	%g4
	movvs	%xcc,	%g2,	%g5
	for	%f18,	%f24,	%f10
	tsubcctv	%i5,	0x1A0A,	%i6
	orcc	%g3,	%i0,	%l3
	movg	%icc,	%o6,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f2,	%f20,	%f24
	tcs	%icc,	0x3
	set	0x7A, %o3
	lduha	[%l7 + %o3] 0x11,	%o3
	and	%i3,	0x07E1,	%g1
	fmovdpos	%icc,	%f6,	%f8
	taddcctv	%i1,	%o5,	%l6
	fbne	%fcc3,	loop_869
	alignaddr	%o0,	%o1,	%o2
	edge32n	%o4,	%i7,	%l0
	fpack16	%f2,	%f0
loop_869:
	tcs	%icc,	0x0
	fmovrdne	%g6,	%f16,	%f28
	tgu	%xcc,	0x6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%l5
	sllx	%l1,	0x19,	%g7
	movrne	%o7,	%l4,	%i4
	subc	%g4,	%g2,	%i5
	fmovscs	%icc,	%f1,	%f19
	fnands	%f4,	%f24,	%f26
	fcmple16	%f12,	%f30,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc0,	%f16,	%f25
	fba	%fcc1,	loop_870
	tneg	%xcc,	0x4
	fmovscc	%xcc,	%f27,	%f23
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
loop_870:
	fbug	%fcc2,	loop_872
	orn	%g3,	%i0,	%l3
	movleu	%xcc,	%o6,	%l2
loop_871:
	fornot1s	%f0,	%f6,	%f15
loop_872:
	tg	%xcc,	0x1
	edge32	%i6,	%o3,	%g1
	umulcc	%i1,	%i3,	%o5
	fabss	%f2,	%f23
	tgu	%xcc,	0x1
	orn	%l6,	%o0,	%o2
	sdiv	%o1,	0x101B,	%i7
	fcmps	%fcc0,	%f23,	%f20
	movvc	%xcc,	%o4,	%l0
	sdivx	%g6,	0x12F7,	%i2
	fbl	%fcc3,	loop_873
	tn	%icc,	0x1
	bg,pn	%xcc,	loop_874
	movgu	%xcc,	%l5,	%l1
loop_873:
	bge	loop_875
	bgu,a,pn	%xcc,	loop_876
loop_874:
	fcmped	%fcc1,	%f0,	%f24
	add	%g7,	%l4,	%o7
loop_875:
	ldd	[%l7 + 0x30],	%f28
loop_876:
	tcc	%icc,	0x5
	smulcc	%i4,	%g4,	%g2
	umul	%i5,	0x0937,	%g5
	edge16	%g3,	%l3,	%o6
	move	%xcc,	%l2,	%i0
	edge8l	%o3,	%g1,	%i1
	movle	%xcc,	%i6,	%i3
	fbn,a	%fcc3,	loop_877
	xorcc	%o5,	0x13CC,	%l6
	srlx	%o2,	%o1,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_877:
	subccc	%i7,	%l0,	%g6
	sethi	0x1090,	%i2
	fmovdgu	%xcc,	%f26,	%f29
	movrgz	%o4,	%l5,	%l1
	ble	%xcc,	loop_878
	membar	0x1A
	movrgez	%g7,	%l4,	%o7
	fmovrdlz	%g4,	%f12,	%f14
loop_878:
	edge8n	%g2,	%i4,	%g5
	popc	0x1C08,	%i5
	nop
	set	0x20, %g2
	lduh	[%l7 + %g2],	%g3
	ta	%xcc,	0x3
	fmovdge	%icc,	%f7,	%f21
	tge	%xcc,	0x4
	movneg	%xcc,	%o6,	%l3
	bpos	loop_879
	fnands	%f19,	%f30,	%f12
	fbge,a	%fcc3,	loop_880
	movvs	%icc,	%i0,	%o3
loop_879:
	movle	%xcc,	%l2,	%i1
	fors	%f2,	%f2,	%f5
loop_880:
	fmovsgu	%icc,	%f20,	%f27
	alignaddr	%g1,	%i3,	%i6
	bcc,a	%icc,	loop_881
	edge8l	%l6,	%o2,	%o5
	fmovdne	%xcc,	%f18,	%f29
	fand	%f0,	%f24,	%f8
loop_881:
	array16	%o1,	%o0,	%i7
	movrgz	%g6,	%i2,	%l0
	edge32l	%o4,	%l1,	%g7
	ldub	[%l7 + 0x56],	%l5
	fandnot2s	%f16,	%f7,	%f10
	addccc	%o7,	%l4,	%g2
	tg	%icc,	0x3
	edge16n	%g4,	%i4,	%i5
	smulcc	%g5,	%g3,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x2
	movgu	%xcc,	%i0,	%o6
	fblg	%fcc1,	loop_882
	fbuge,a	%fcc0,	loop_883
	movvc	%xcc,	%l2,	%o3
	fmuld8sux16	%f23,	%f14,	%f22
loop_882:
	tcs	%icc,	0x3
loop_883:
	fbl,a	%fcc3,	loop_884
	edge8	%i1,	%i3,	%g1
	ldx	[%l7 + 0x10],	%l6
	set	0x08, %o7
	lduwa	[%l7 + %o7] 0x10,	%o2
loop_884:
	add	%o5,	%o1,	%o0
	fbu,a	%fcc0,	loop_885
	bge	loop_886
	brz	%i7,	loop_887
	xorcc	%g6,	%i6,	%i2
loop_885:
	movcc	%xcc,	%o4,	%l0
loop_886:
	edge32	%l1,	%l5,	%g7
loop_887:
	tvs	%icc,	0x7
	movre	%l4,	%o7,	%g4
	nop
	setx loop_888, %l0, %l1
	jmpl %l1, %i4
	edge8n	%g2,	%g5,	%i5
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x18,	%f0
loop_888:
	fnors	%f23,	%f9,	%f14
	movn	%icc,	%g3,	%i0
	sra	%o6,	%l2,	%l3
	tne	%xcc,	0x1
	fmovdg	%xcc,	%f31,	%f15
	fmovda	%icc,	%f29,	%f12
	edge16ln	%o3,	%i3,	%i1
	call	loop_889
	edge16ln	%l6,	%g1,	%o5
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x10] %asi,	%o2
loop_889:
	pdist	%f8,	%f30,	%f28
	fbue,a	%fcc1,	loop_890
	sth	%o1,	[%l7 + 0x4A]
	movg	%xcc,	%o0,	%i7
	fmovsvc	%icc,	%f29,	%f17
loop_890:
	orn	%i6,	%i2,	%o4
	fandnot1	%f18,	%f14,	%f6
	edge8n	%l0,	%l1,	%g6
	subcc	%l5,	%g7,	%l4
	fbl	%fcc0,	loop_891
	fzero	%f4
	sdivx	%g4,	0x14CF,	%i4
	tsubcc	%g2,	%o7,	%g5
loop_891:
	fmovrdgz	%i5,	%f28,	%f4
	umul	%g3,	0x0769,	%i0
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x71] %asi,	%o6
	fbug,a	%fcc1,	loop_892
	sir	0x1E30
	fpadd32	%f4,	%f30,	%f6
	edge32l	%l2,	%l3,	%o3
loop_892:
	movneg	%xcc,	%i1,	%i3
	xnor	%l6,	0x0900,	%o5
	sll	%g1,	%o1,	%o2
	subcc	%i7,	%o0,	%i2
	lduh	[%l7 + 0x08],	%o4
	movn	%xcc,	%i6,	%l0
	brz,a	%g6,	loop_893
	te	%icc,	0x0
	pdist	%f20,	%f2,	%f2
	fmovscs	%xcc,	%f29,	%f2
loop_893:
	taddcctv	%l5,	%l1,	%g7
	wr	%g0,	0xea,	%asi
	stxa	%l4,	[%l7 + 0x48] %asi
	membar	#Sync
	array32	%i4,	%g2,	%o7
	movrlez	%g4,	0x058,	%i5
	set	0x40, %o6
	stda	%f0,	[%l7 + %o6] 0x18
	fnegd	%f4,	%f30
	bl,a,pn	%xcc,	loop_894
	smulcc	%g3,	%g5,	%o6
	stx	%l2,	[%l7 + 0x10]
	orn	%i0,	%o3,	%i1
loop_894:
	and	%l3,	%i3,	%o5
	fmovrdlz	%g1,	%f30,	%f16
	fcmpgt32	%f4,	%f10,	%l6
	movrne	%o1,	%o2,	%i7
	fpackfix	%f6,	%f13
	fbuge,a	%fcc1,	loop_895
	orn	%i2,	%o0,	%i6
	bcs,a,pt	%icc,	loop_896
	umulcc	%l0,	0x04BA,	%g6
loop_895:
	fmovda	%icc,	%f3,	%f5
	edge8n	%o4,	%l5,	%l1
loop_896:
	edge32l	%l4,	%g7,	%g2
	mulscc	%o7,	0x1D8B,	%g4
	bn,a,pt	%xcc,	loop_897
	bvc	%icc,	loop_898
	bg,pt	%icc,	loop_899
	bn	%xcc,	loop_900
loop_897:
	movcs	%xcc,	%i4,	%i5
loop_898:
	movrgz	%g5,	0x08F,	%o6
loop_899:
	and	%l2,	%g3,	%o3
loop_900:
	nop
	set	0x14, %i6
	ldswa	[%l7 + %i6] 0x80,	%i1
	fmovdne	%icc,	%f6,	%f22
	movrne	%l3,	0x34E,	%i0
	fmovrdlez	%o5,	%f22,	%f24
	edge32	%i3,	%g1,	%l6
	edge8	%o2,	%i7,	%o1
	set	0x78, %g1
	ldswa	[%l7 + %g1] 0x88,	%i2
	smul	%o0,	0x14A8,	%l0
	addccc	%i6,	%o4,	%l5
	movleu	%xcc,	%g6,	%l1
	lduh	[%l7 + 0x34],	%l4
	xor	%g7,	0x1435,	%o7
	ldsh	[%l7 + 0x3A],	%g2
	movcc	%xcc,	%i4,	%g4
	membar	0x75
	addccc	%i5,	0x0390,	%o6
	sdivcc	%g5,	0x1052,	%g3
	fmul8x16au	%f11,	%f15,	%f12
	std	%l2,	[%l7 + 0x28]
	movcs	%icc,	%o3,	%l3
	tcs	%icc,	0x4
	fpsub16	%f26,	%f8,	%f6
	fmul8sux16	%f28,	%f10,	%f24
	movcs	%icc,	%i1,	%o5
	edge32ln	%i3,	%i0,	%g1
	bne,a,pn	%icc,	loop_901
	ldsw	[%l7 + 0x60],	%l6
	sethi	0x108B,	%o2
	fsrc1	%f16,	%f24
loop_901:
	fmovsa	%icc,	%f26,	%f6
	edge16l	%o1,	%i2,	%o0
	bge,a	loop_902
	popc	%l0,	%i7
	edge8	%i6,	%o4,	%l5
	fnegs	%f11,	%f17
loop_902:
	fbne,a	%fcc0,	loop_903
	fbule	%fcc1,	loop_904
	fcmpgt16	%f10,	%f2,	%g6
	bpos	%icc,	loop_905
loop_903:
	membar	0x5E
loop_904:
	fpackfix	%f16,	%f18
	subcc	%l4,	0x1FB2,	%g7
loop_905:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x50, %l4
	ldstub	[%l7 + %l4],	%o7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x70] %asi,	%g2
	umul	%l1,	%g4,	%i5
	bvs	%xcc,	loop_906
	srlx	%o6,	0x03,	%g5
	fmovdg	%xcc,	%f26,	%f0
	sir	0x05E1
loop_906:
	movrlez	%g3,	%l2,	%o3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%i4
	edge8n	%l3,	%o5,	%i1
	fmovdl	%xcc,	%f15,	%f28
	addccc	%i3,	%g1,	%l6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%o1
	udiv	%i2,	0x119D,	%o0
	sra	%l0,	0x12,	%i0
	xorcc	%i6,	0x1B83,	%o4
	xnor	%i7,	%l5,	%g6
	movrgz	%g7,	%l4,	%o7
	fsrc1s	%f10,	%f3
	smul	%g2,	%l1,	%i5
	prefetch	[%l7 + 0x7C],	 0x3
	flush	%l7 + 0x0C
	fmovsg	%xcc,	%f0,	%f17
	movne	%xcc,	%o6,	%g5
	fmovdn	%icc,	%f28,	%f27
	subcc	%g4,	0x015E,	%l2
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x74] %asi,	%f15
	stbar
	ldx	[%l7 + 0x30],	%o3
	set	0x09, %l5
	stba	%i4,	[%l7 + %l5] 0x10
	array8	%g3,	%o5,	%i1
	orcc	%i3,	%g1,	%l6
	edge8n	%o2,	%l3,	%i2
	nop
	setx	loop_907,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bpos	%xcc,	loop_908
	sdivx	%o1,	0x0BF3,	%o0
	fpadd16	%f6,	%f8,	%f0
loop_907:
	xor	%i0,	%i6,	%l0
loop_908:
	ldstub	[%l7 + 0x37],	%i7
	set	0x2C, %o0
	ldswa	[%l7 + %o0] 0x81,	%o4
	tg	%icc,	0x3
	mova	%xcc,	%l5,	%g6
	bleu,a,pn	%icc,	loop_909
	ble,a	loop_910
	lduw	[%l7 + 0x44],	%g7
	srlx	%o7,	%g2,	%l4
loop_909:
	xor	%i5,	%l1,	%o6
loop_910:
	fbg	%fcc2,	loop_911
	ldd	[%l7 + 0x20],	%g4
	fnot1	%f22,	%f12
	brnz,a	%l2,	loop_912
loop_911:
	tne	%icc,	0x7
	edge32ln	%o3,	%i4,	%g3
	fbue,a	%fcc0,	loop_913
loop_912:
	fpadd16s	%f26,	%f16,	%f3
	alignaddrl	%o5,	%g5,	%i3
	fbn,a	%fcc3,	loop_914
loop_913:
	addc	%g1,	%i1,	%l6
	and	%l3,	%i2,	%o2
	smulcc	%o1,	0x07D3,	%o0
loop_914:
	movn	%xcc,	%i6,	%i0
	fmovdneg	%icc,	%f12,	%f8
	array16	%i7,	%l0,	%o4
	stbar
	or	%l5,	%g7,	%g6
	tle	%icc,	0x6
	brlz,a	%o7,	loop_915
	array32	%g2,	%i5,	%l4
	mulx	%o6,	0x0462,	%l1
	tpos	%xcc,	0x5
loop_915:
	tg	%xcc,	0x7
	movre	%g4,	0x188,	%l2
	fmovsle	%icc,	%f13,	%f25
	fmovdneg	%xcc,	%f9,	%f21
	ldd	[%l7 + 0x28],	%f24
	andn	%i4,	%g3,	%o5
	fbge,a	%fcc1,	loop_916
	movle	%icc,	%g5,	%o3
	fmovscc	%icc,	%f23,	%f12
	fbl	%fcc2,	loop_917
loop_916:
	ble,pn	%icc,	loop_918
	or	%i3,	%g1,	%l6
	array32	%l3,	%i1,	%i2
loop_917:
	tcc	%icc,	0x7
loop_918:
	movrgez	%o2,	0x2E0,	%o1
	edge8l	%i6,	%i0,	%i7
	popc	%l0,	%o4
	udiv	%o0,	0x1936,	%l5
	andcc	%g6,	%o7,	%g2
	tne	%icc,	0x5
	brlz,a	%i5,	loop_919
	movvs	%icc,	%g7,	%o6
	wr	%g0,	0x89,	%asi
	sta	%f27,	[%l7 + 0x38] %asi
loop_919:
	tgu	%icc,	0x7
	udivcc	%l4,	0x069E,	%l1
	brnz,a	%g4,	loop_920
	fandnot1s	%f25,	%f5,	%f21
	fbug	%fcc1,	loop_921
	edge32	%l2,	%g3,	%o5
loop_920:
	addc	%g5,	0x15A2,	%o3
	movvc	%icc,	%i4,	%i3
loop_921:
	nop
	set	0x6F, %i2
	ldsba	[%l7 + %i2] 0x19,	%l6
	movpos	%xcc,	%g1,	%i1
	xnor	%l3,	%o2,	%i2
	andn	%o1,	0x0A99,	%i0
	ta	%icc,	0x3
	tcc	%icc,	0x5
	sdiv	%i6,	0x0991,	%l0
	fbuge	%fcc1,	loop_922
	movn	%icc,	%o4,	%o0
	xor	%i7,	0x1388,	%l5
	subccc	%o7,	0x1801,	%g2
loop_922:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%i5
	popc	%g7,	%g6
	tcc	%xcc,	0x5
	fmovsl	%xcc,	%f3,	%f9
	alignaddrl	%o6,	%l1,	%g4
	bn,pt	%xcc,	loop_923
	tn	%xcc,	0x1
	std	%l2,	[%l7 + 0x40]
	fandnot2	%f22,	%f10,	%f20
loop_923:
	sdivx	%g3,	0x0C37,	%o5
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%f22
	edge8l	%l4,	%o3,	%i4
	edge8n	%i3,	%g5,	%l6
	and	%g1,	%l3,	%i1
	edge32l	%i2,	%o1,	%o2
	fbu	%fcc0,	loop_924
	tne	%xcc,	0x1
	tvs	%icc,	0x7
	fmovsvc	%xcc,	%f29,	%f4
loop_924:
	bcs,pt	%xcc,	loop_925
	sth	%i0,	[%l7 + 0x66]
	fnot2s	%f5,	%f26
	fbne,a	%fcc1,	loop_926
loop_925:
	movrlez	%i6,	0x2BC,	%o4
	edge8ln	%l0,	%i7,	%o0
	bvs,a,pn	%icc,	loop_927
loop_926:
	brgez	%l5,	loop_928
	umulcc	%o7,	%i5,	%g2
	andcc	%g6,	0x0ACC,	%o6
loop_927:
	fmovd	%f8,	%f0
loop_928:
	movleu	%xcc,	%g7,	%l1
	edge32n	%g4,	%g3,	%l2
	edge32	%o5,	%o3,	%l4
	tvs	%icc,	0x2
	ldstub	[%l7 + 0x38],	%i3
	fmovscc	%xcc,	%f10,	%f10
	udivx	%i4,	0x1838,	%g5
	fbuge	%fcc1,	loop_929
	movvs	%icc,	%g1,	%l3
	fmovsa	%xcc,	%f29,	%f24
	umul	%i1,	0x1E07,	%i2
loop_929:
	movrlez	%o1,	0x3FB,	%l6
	fbug,a	%fcc2,	loop_930
	tcc	%xcc,	0x1
	edge32n	%o2,	%i6,	%o4
	sdivcc	%i0,	0x055E,	%l0
loop_930:
	nop
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
	movcs	%icc,	%o0,	%l5
	sllx	%o7,	%g2,	%i5
	fabsd	%f28,	%f14
	tne	%xcc,	0x7
	movneg	%xcc,	%g6,	%o6
	tneg	%xcc,	0x5
	edge16ln	%l1,	%g4,	%g7
	sdivcc	%g3,	0x07C9,	%l2
	andncc	%o3,	%o5,	%l4
	fba,a	%fcc2,	loop_931
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0D38
	sethi	0x0968,	%i3
loop_931:
	sra	%i4,	%g1,	%g5
	movrlz	%l3,	0x3B1,	%i2
	brgz,a	%o1,	loop_932
	fbul	%fcc0,	loop_933
	mulx	%i1,	0x1A41,	%l6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o2
loop_932:
	movg	%icc,	%o4,	%i6
loop_933:
	fmul8x16	%f14,	%f6,	%f18
	fmovrsgez	%l0,	%f2,	%f4
	tsubcc	%i0,	0x0A07,	%i7
	edge32ln	%o0,	%o7,	%g2
	fpsub16	%f14,	%f10,	%f4
	movvs	%icc,	%i5,	%l5
	movrne	%o6,	0x269,	%g6
	tle	%icc,	0x1
	tg	%icc,	0x7
	nop
	setx	loop_934,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%g4,	%g7,	%g3
	movrne	%l1,	%o3,	%o5
	ldsb	[%l7 + 0x2B],	%l2
loop_934:
	movvc	%icc,	%l4,	%i4
	tvc	%xcc,	0x4
	array32	%i3,	%g5,	%l3
	andncc	%i2,	%g1,	%i1
	mulscc	%o1,	0x139E,	%l6
	fcmpne32	%f8,	%f20,	%o4
	movn	%icc,	%i6,	%l0
	ldsb	[%l7 + 0x1F],	%o2
	orcc	%i7,	%i0,	%o7
	edge8n	%g2,	%i5,	%l5
	te	%icc,	0x0
	array16	%o0,	%o6,	%g4
	udivcc	%g6,	0x1A6D,	%g3
	siam	0x6
	fxors	%f7,	%f17,	%f28
	movcs	%xcc,	%l1,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%o5,	%f0,	%f26
	movvc	%icc,	%l2,	%g7
	fbl,a	%fcc3,	loop_935
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l4,	%i4
	srl	%g5,	0x07,	%l3
loop_935:
	subccc	%i3,	0x05E2,	%i2
	edge16	%i1,	%g1,	%l6
	ldsh	[%l7 + 0x28],	%o1
	tneg	%xcc,	0x0
	fbe,a	%fcc3,	loop_936
	xor	%o4,	%i6,	%l0
	tgu	%xcc,	0x4
	movrlz	%o2,	%i7,	%o7
loop_936:
	edge16ln	%i0,	%g2,	%i5
	fnors	%f1,	%f11,	%f31
	movvc	%icc,	%l5,	%o0
	movge	%icc,	%o6,	%g4
	movl	%xcc,	%g6,	%g3
	taddcctv	%l1,	0x1952,	%o5
	ldub	[%l7 + 0x56],	%l2
	fpsub32s	%f28,	%f24,	%f21
	ba,a	%xcc,	loop_937
	movrgez	%g7,	%o3,	%l4
	bpos,a,pn	%icc,	loop_938
	movl	%xcc,	%i4,	%g5
loop_937:
	edge8ln	%l3,	%i2,	%i3
	bpos,a	loop_939
loop_938:
	edge8	%g1,	%i1,	%l6
	array32	%o1,	%o4,	%i6
	tneg	%icc,	0x1
loop_939:
	bleu,a	%xcc,	loop_940
	umulcc	%l0,	0x0B29,	%i7
	fmovdleu	%xcc,	%f23,	%f25
	mulscc	%o7,	%i0,	%o2
loop_940:
	edge32l	%i5,	%g2,	%l5
	orn	%o0,	%g4,	%g6
	movl	%icc,	%g3,	%o6
	smul	%o5,	%l1,	%g7
	subc	%o3,	%l4,	%l2
	srl	%i4,	0x1C,	%l3
	fmul8sux16	%f24,	%f22,	%f22
	fbne	%fcc1,	loop_941
	fnegd	%f18,	%f20
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g5,	%i2
loop_941:
	alignaddrl	%i3,	%g1,	%l6
	std	%i0,	[%l7 + 0x38]
	fcmple16	%f0,	%f22,	%o1
	orn	%i6,	0x07C7,	%l0
	andn	%o4,	%i7,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn	%xcc,	loop_942
	fmovdn	%icc,	%f13,	%f28
	set	0x7A, %g7
	stha	%o2,	[%l7 + %g7] 0x81
loop_942:
	edge8l	%i0,	%g2,	%l5
	tg	%xcc,	0x3
	movl	%xcc,	%o0,	%g4
	fone	%f0
	be,pn	%icc,	loop_943
	fbul	%fcc2,	loop_944
	xnorcc	%g6,	%g3,	%i5
	edge8l	%o5,	%o6,	%g7
loop_943:
	movg	%icc,	%o3,	%l1
loop_944:
	std	%f14,	[%l7 + 0x58]
	movre	%l2,	0x2C9,	%l4
	fbn,a	%fcc0,	loop_945
	tleu	%xcc,	0x2
	set	0x35, %l1
	stba	%i4,	[%l7 + %l1] 0xea
	membar	#Sync
loop_945:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%l3,	%i2
	edge16l	%g5,	%g1,	%i3
	srax	%i1,	%o1,	%l6
	fcmpne32	%f6,	%f18,	%i6
	sdivx	%l0,	0x17AB,	%o4
	movcs	%icc,	%i7,	%o7
	edge16	%i0,	%g2,	%o2
	edge32ln	%l5,	%g4,	%g6
	bvc,a	%xcc,	loop_946
	edge16n	%g3,	%i5,	%o0
	fbge	%fcc2,	loop_947
	edge16l	%o5,	%g7,	%o3
loop_946:
	fbl	%fcc0,	loop_948
	brgez,a	%l1,	loop_949
loop_947:
	mulscc	%l2,	0x08CB,	%l4
	fors	%f31,	%f9,	%f15
loop_948:
	fmovdvc	%xcc,	%f5,	%f26
loop_949:
	alignaddrl	%i4,	%o6,	%l3
	ta	%xcc,	0x0
	edge8	%i2,	%g1,	%i3
	movgu	%icc,	%i1,	%g5
	fmovspos	%xcc,	%f11,	%f14
	movn	%icc,	%l6,	%o1
	move	%xcc,	%i6,	%o4
	movcc	%xcc,	%l0,	%i7
	tvs	%xcc,	0x1
	array32	%o7,	%g2,	%i0
	wr	%g0,	0x11,	%asi
	stda	%l4,	[%l7 + 0x38] %asi
	fxnor	%f8,	%f2,	%f2
	andn	%o2,	%g6,	%g3
	fbl	%fcc3,	loop_950
	xorcc	%g4,	0x1D90,	%i5
	stbar
	fpsub16s	%f18,	%f3,	%f21
loop_950:
	movvc	%xcc,	%o5,	%o0
	movgu	%xcc,	%g7,	%o3
	wr	%g0,	0x89,	%asi
	stha	%l1,	[%l7 + 0x1C] %asi
	edge8	%l4,	%i4,	%o6
	brlez,a	%l3,	loop_951
	orncc	%i2,	%l2,	%g1
	fpmerge	%f10,	%f7,	%f16
	array32	%i1,	%g5,	%l6
loop_951:
	nop
	wr	%g0,	0x10,	%asi
	stba	%o1,	[%l7 + 0x1B] %asi
	tneg	%icc,	0x5
	xnorcc	%i6,	%i3,	%l0
	movneg	%xcc,	%i7,	%o4
	edge32ln	%o7,	%g2,	%i0
	movcs	%xcc,	%l5,	%o2
	tl	%xcc,	0x1
	edge8l	%g6,	%g4,	%i5
	add	%o5,	%o0,	%g7
	fpsub32s	%f23,	%f6,	%f2
	edge8	%g3,	%o3,	%l4
	andn	%i4,	%o6,	%l1
	array16	%l3,	%i2,	%l2
	tg	%icc,	0x0
	movpos	%icc,	%i1,	%g5
	movge	%icc,	%g1,	%o1
	movre	%l6,	0x20B,	%i6
	fpsub16	%f30,	%f4,	%f22
	movvs	%icc,	%l0,	%i7
	edge32n	%i3,	%o4,	%g2
	fones	%f13
	smul	%o7,	0x057F,	%l5
	ldub	[%l7 + 0x7F],	%o2
	umul	%i0,	%g4,	%g6
	bgu,pn	%xcc,	loop_952
	tvs	%xcc,	0x0
	umulcc	%i5,	0x12BD,	%o0
	fnot2	%f12,	%f10
loop_952:
	fxnor	%f22,	%f20,	%f4
	alignaddrl	%o5,	%g3,	%o3
	ldsw	[%l7 + 0x44],	%g7
	sllx	%l4,	0x08,	%i4
	fmovsa	%xcc,	%f19,	%f23
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x31] %asi,	%l1
	bn,a,pt	%icc,	loop_953
	fnot2s	%f14,	%f10
	movne	%xcc,	%o6,	%l3
	bleu,a	%xcc,	loop_954
loop_953:
	fbuge,a	%fcc1,	loop_955
	fxor	%f24,	%f28,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_954:
	std	%f10,	[%l7 + 0x38]
loop_955:
	movrgz	%i2,	0x3D8,	%l2
	fmovrsgz	%i1,	%f16,	%f11
	fbu,a	%fcc3,	loop_956
	bn,pn	%icc,	loop_957
	fble,a	%fcc0,	loop_958
	mulx	%g1,	0x11AB,	%o1
loop_956:
	fpack32	%f12,	%f14,	%f18
loop_957:
	fpsub32	%f12,	%f20,	%f4
loop_958:
	movl	%icc,	%g5,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l0,	%i6,	%i3
	st	%f6,	[%l7 + 0x10]
	fandnot2s	%f29,	%f13,	%f14
	fexpand	%f2,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_959,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	orncc	%o4,	%g2,	%i7
	movrlz	%l5,	0x1C3,	%o7
	sllx	%i0,	%o2,	%g6
loop_959:
	taddcctv	%i5,	%g4,	%o5
	prefetch	[%l7 + 0x40],	 0x3
	fpadd32	%f30,	%f14,	%f28
	wr	%g0,	0xe2,	%asi
	stda	%g2,	[%l7 + 0x48] %asi
	membar	#Sync
	ldsw	[%l7 + 0x38],	%o3
	fmovdn	%xcc,	%f15,	%f0
	edge8n	%o0,	%l4,	%i4
	movne	%icc,	%l1,	%g7
	set	0x120, %l0
	stxa	%o6,	[%g0 + %l0] 0x52
	ta	%xcc,	0x6
	addccc	%l3,	%l2,	%i1
	tvc	%xcc,	0x7
	subccc	%i2,	%g1,	%g5
	ld	[%l7 + 0x3C],	%f14
	xnor	%o1,	%l0,	%i6
	edge8	%i3,	%l6,	%g2
	tsubcc	%o4,	%i7,	%l5
	wr	%g0,	0x89,	%asi
	stwa	%i0,	[%l7 + 0x6C] %asi
	fnot2s	%f25,	%f24
	edge8ln	%o2,	%g6,	%o7
	fbge,a	%fcc0,	loop_960
	bl,a	%icc,	loop_961
	brnz	%g4,	loop_962
	movre	%i5,	%o5,	%g3
loop_960:
	movvs	%xcc,	%o0,	%o3
loop_961:
	fbue	%fcc1,	loop_963
loop_962:
	movge	%icc,	%i4,	%l4
	edge32n	%l1,	%o6,	%l3
	movrne	%l2,	%i1,	%g7
loop_963:
	addc	%g1,	%i2,	%g5
	bpos,a,pt	%icc,	loop_964
	fsrc1s	%f0,	%f19
	ldub	[%l7 + 0x6C],	%l0
	orncc	%o1,	0x1970,	%i6
loop_964:
	edge16ln	%i3,	%g2,	%l6
	srlx	%o4,	%i7,	%l5
	fmovdvc	%xcc,	%f22,	%f4
	membar	#Sync
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x16,	%f16
	edge8n	%o2,	%g6,	%o7
	smulcc	%i0,	0x107C,	%i5
	fnands	%f15,	%f20,	%f6
	tsubcctv	%g4,	%o5,	%g3
	st	%f19,	[%l7 + 0x48]
	sethi	0x0BA0,	%o0
	mulx	%i4,	0x1EC4,	%l4
	xorcc	%o3,	0x0D60,	%l1
	brz	%l3,	loop_965
	fmovdg	%icc,	%f23,	%f21
	orcc	%o6,	0x1E5D,	%l2
	fsrc2s	%f22,	%f2
loop_965:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x41] %asi,	%g7
	fxor	%f12,	%f6,	%f24
	movvc	%icc,	%g1,	%i1
	fbug	%fcc0,	loop_966
	tle	%xcc,	0x0
	fexpand	%f15,	%f12
	mulx	%g5,	%l0,	%i2
loop_966:
	edge16n	%o1,	%i6,	%i3
	andcc	%l6,	0x1D6C,	%g2
	fba	%fcc2,	loop_967
	edge8	%i7,	%l5,	%o2
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g6
loop_967:
	addcc	%o4,	0x1322,	%i0
	addc	%i5,	0x0585,	%g4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x28] %asi,	%o7
	orn	%o5,	%g3,	%o0
	smulcc	%l4,	%o3,	%i4
	fmovrdgez	%l3,	%f14,	%f2
	subccc	%o6,	%l2,	%l1
	xorcc	%g1,	0x05E7,	%i1
	edge16l	%g5,	%l0,	%g7
	edge8n	%o1,	%i6,	%i2
	fsrc2s	%f6,	%f9
	xorcc	%l6,	0x0A6B,	%g2
	for	%f22,	%f12,	%f16
	srl	%i7,	%l5,	%o2
	faligndata	%f0,	%f0,	%f6
	fpadd32	%f12,	%f18,	%f8
	bneg,a,pt	%xcc,	loop_968
	fands	%f6,	%f26,	%f26
	edge32l	%g6,	%o4,	%i0
	edge8l	%i3,	%i5,	%g4
loop_968:
	move	%icc,	%o7,	%g3
	mova	%xcc,	%o0,	%l4
	srax	%o3,	0x19,	%o5
	fmovsneg	%xcc,	%f16,	%f4
	addc	%i4,	%l3,	%o6
	movleu	%icc,	%l2,	%l1
	fsrc2	%f0,	%f14
	bcc,pn	%icc,	loop_969
	call	loop_970
	movrne	%g1,	%i1,	%g5
	fsrc1	%f4,	%f26
loop_969:
	be,a	%xcc,	loop_971
loop_970:
	stx	%l0,	[%l7 + 0x78]
	fmovdle	%icc,	%f10,	%f8
	addc	%o1,	%g7,	%i6
loop_971:
	fones	%f19
	fpmerge	%f27,	%f16,	%f10
	fmul8sux16	%f0,	%f24,	%f28
	edge16n	%i2,	%l6,	%g2
	udivx	%l5,	0x0DCF,	%o2
	edge8n	%i7,	%o4,	%g6
	tneg	%xcc,	0x7
	fnot2	%f28,	%f18
	tcc	%icc,	0x7
	fmovrde	%i3,	%f0,	%f12
	fnot2s	%f14,	%f4
	movrne	%i0,	%g4,	%i5
	fmovdg	%xcc,	%f15,	%f31
	ldsw	[%l7 + 0x54],	%o7
	smulcc	%o0,	0x1616,	%l4
	tcs	%xcc,	0x0
	xnorcc	%o3,	0x1D44,	%g3
	fmovrslez	%o5,	%f5,	%f3
	fmuld8ulx16	%f12,	%f19,	%f18
	ba,a	loop_972
	ta	%xcc,	0x4
	sub	%i4,	%l3,	%o6
	nop
	setx	loop_973,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_972:
	bcc	loop_974
	move	%icc,	%l2,	%g1
	movre	%l1,	0x00D,	%g5
loop_973:
	fbul	%fcc0,	loop_975
loop_974:
	orncc	%l0,	%i1,	%g7
	and	%i6,	%i2,	%l6
	fpmerge	%f31,	%f5,	%f28
loop_975:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_976
	mova	%xcc,	%g2,	%l5
	movvc	%xcc,	%o2,	%o1
	mulscc	%o4,	0x04AE,	%g6
loop_976:
	tvc	%xcc,	0x4
	sub	%i7,	%i3,	%i0
	array32	%g4,	%i5,	%o7
	orcc	%l4,	%o3,	%g3
	bleu,pt	%icc,	loop_977
	edge8n	%o0,	%o5,	%i4
	set	0x5E, %i5
	lduba	[%l7 + %i5] 0x89,	%l3
loop_977:
	nop
	set	0x5C, %g5
	sta	%f5,	[%l7 + %g5] 0x0c
	sdivx	%l2,	0x0C5F,	%o6
	tne	%icc,	0x6
	movrne	%l1,	0x230,	%g5
	fnot1	%f10,	%f26
	taddcc	%g1,	0x1E81,	%l0
	fmovdn	%icc,	%f30,	%f3
	fmovse	%xcc,	%f1,	%f2
	movleu	%xcc,	%g7,	%i1
	umulcc	%i2,	0x165A,	%l6
	xor	%g2,	%i6,	%l5
	bge,a	%icc,	loop_978
	fcmpne32	%f18,	%f20,	%o1
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_978:
	fmovsg	%xcc,	%f1,	%f23
	fmovdle	%icc,	%f1,	%f16
	fbuge	%fcc0,	loop_979
	fabss	%f23,	%f29
	subccc	%o4,	0x1B5F,	%g6
	fbue,a	%fcc1,	loop_980
loop_979:
	ldsb	[%l7 + 0x08],	%o2
	andncc	%i3,	%i7,	%i0
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_980:
	membar	0x5E
	edge32l	%g4,	%i5,	%o7
	fmovspos	%xcc,	%f8,	%f11
	stbar
	fxors	%f4,	%f18,	%f29
	movrne	%l4,	%o3,	%g3
	fbue	%fcc0,	loop_981
	sll	%o5,	0x0F,	%i4
	lduw	[%l7 + 0x0C],	%o0
	tneg	%icc,	0x4
loop_981:
	addcc	%l2,	0x070D,	%o6
	tneg	%icc,	0x7
	fbug	%fcc3,	loop_982
	ba,a,pt	%icc,	loop_983
	edge32	%l3,	%l1,	%g5
	nop
	setx loop_984, %l0, %l1
	jmpl %l1, %l0
loop_982:
	fcmple32	%f22,	%f26,	%g1
loop_983:
	umul	%i1,	0x0979,	%g7
	mulscc	%i2,	0x1AFD,	%l6
loop_984:
	tgu	%xcc,	0x7
	fpsub16	%f0,	%f2,	%f14
	array16	%i6,	%l5,	%g2
	brgez	%o4,	loop_985
	tl	%icc,	0x1
	tvs	%xcc,	0x5
	mulx	%g6,	0x1DCF,	%o1
loop_985:
	nop
	setx	loop_986,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16ln	%i3,	%i7,	%o2
	membar	0x60
	set	0x78, %l2
	lda	[%l7 + %l2] 0x11,	%f22
loop_986:
	fnot1s	%f11,	%f11
	fbul,a	%fcc1,	loop_987
	fmul8x16au	%f28,	%f12,	%f16
	set	0x68, %i7
	ldswa	[%l7 + %i7] 0x88,	%g4
loop_987:
	subc	%i5,	0x0B1D,	%o7
	srl	%i0,	0x1A,	%l4
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x10,	%f16
	move	%icc,	%o3,	%o5
	fmovs	%f26,	%f7
	fornot1	%f28,	%f14,	%f28
	edge32	%i4,	%o0,	%l2
	movrlez	%o6,	0x2E8,	%g3
	fbg,a	%fcc1,	loop_988
	movrlez	%l1,	%l3,	%l0
	fmovsvc	%xcc,	%f8,	%f28
	fmovsne	%xcc,	%f2,	%f20
loop_988:
	fmovsne	%icc,	%f14,	%f0
	edge32n	%g1,	%i1,	%g5
	fpackfix	%f24,	%f31
	movrne	%g7,	0x270,	%l6
	ldsw	[%l7 + 0x50],	%i2
	fmovscs	%icc,	%f22,	%f17
	andncc	%l5,	%g2,	%i6
	set	0x74, %i1
	lduwa	[%l7 + %i1] 0x88,	%g6
	fcmped	%fcc0,	%f4,	%f14
	bge,a	%xcc,	loop_989
	and	%o1,	0x1096,	%o4
	fmovrdlz	%i7,	%f22,	%f22
	fmovs	%f7,	%f10
loop_989:
	edge8ln	%o2,	%i3,	%i5
	bg,a	loop_990
	array8	%o7,	%g4,	%l4
	orcc	%o3,	%i0,	%i4
	edge8	%o0,	%l2,	%o5
loop_990:
	xnor	%g3,	%l1,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f0,	%f27,	%f25
	movn	%xcc,	%l0,	%l3
	udiv	%i1,	0x0E79,	%g1
	membar	#Sync
	set	0x40, %o1
	ldda	[%l7 + %o1] 0x1f,	%f0
	tl	%xcc,	0x2
	siam	0x6
	udivx	%g7,	0x1E2C,	%l6
	addccc	%g5,	%i2,	%g2
	fnands	%f27,	%f28,	%f6
	movle	%xcc,	%i6,	%g6
	bne	loop_991
	brgez	%l5,	loop_992
	fors	%f17,	%f13,	%f31
	fabss	%f26,	%f1
loop_991:
	ldub	[%l7 + 0x17],	%o1
loop_992:
	xnorcc	%o4,	%i7,	%i3
	fmovrdlz	%o2,	%f12,	%f24
	bcc,a,pt	%xcc,	loop_993
	popc	0x1E00,	%o7
	fpack32	%f12,	%f8,	%f10
	sub	%i5,	0x14DE,	%g4
loop_993:
	fxors	%f29,	%f19,	%f21
	addc	%l4,	%i0,	%i4
	bne,pt	%icc,	loop_994
	and	%o3,	0x0CE3,	%o0
	ldstub	[%l7 + 0x08],	%o5
	sllx	%g3,	0x04,	%l1
loop_994:
	xnorcc	%o6,	%l0,	%l3
	srlx	%i1,	0x11,	%l2
	fmovscs	%icc,	%f10,	%f16
	fnegd	%f6,	%f26
	edge8n	%g1,	%l6,	%g7
	flush	%l7 + 0x6C
	movre	%g5,	%i2,	%g2
	xorcc	%g6,	%i6,	%l5
	addccc	%o1,	%o4,	%i7
	fornot2	%f20,	%f8,	%f0
	stbar
	fmovrdgez	%i3,	%f18,	%f10
	srax	%o7,	%i5,	%g4
	fmovrse	%l4,	%f24,	%f6
	fpadd16	%f8,	%f4,	%f18
	udivx	%i0,	0x1EB8,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o3,	0x0447,	%o2
	movg	%xcc,	%o5,	%o0
	fsrc1	%f22,	%f12
	fcmped	%fcc2,	%f8,	%f30
	fmuld8sux16	%f2,	%f13,	%f30
	edge32	%g3,	%o6,	%l1
	mova	%icc,	%l0,	%l3
	fmovde	%icc,	%f31,	%f2
	edge16l	%i1,	%l2,	%l6
	tge	%xcc,	0x1
	movrgz	%g7,	%g5,	%i2
	alignaddrl	%g2,	%g6,	%i6
	nop
	setx	loop_995,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fabss	%f4,	%f25
	orn	%g1,	%o1,	%l5
	edge16	%o4,	%i3,	%i7
loop_995:
	movg	%xcc,	%i5,	%o7
	fbne	%fcc0,	loop_996
	fcmpes	%fcc1,	%f30,	%f2
	smul	%l4,	%i0,	%g4
	ba,a	loop_997
loop_996:
	fcmpgt32	%f10,	%f28,	%i4
	tne	%xcc,	0x1
	edge8	%o3,	%o2,	%o5
loop_997:
	tleu	%icc,	0x7
	te	%icc,	0x3
	fmovrsne	%g3,	%f31,	%f17
	ba,a	loop_998
	ta	%xcc,	0x3
	be	%icc,	loop_999
	bneg,pt	%icc,	loop_1000
loop_998:
	nop
	setx loop_1001, %l0, %l1
	jmpl %l1, %o0
	bvc	%xcc,	loop_1002
loop_999:
	movvc	%icc,	%o6,	%l1
loop_1000:
	fbu,a	%fcc2,	loop_1003
loop_1001:
	tsubcc	%l3,	0x07FD,	%i1
loop_1002:
	tneg	%xcc,	0x6
	udiv	%l2,	0x0C26,	%l0
loop_1003:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l6,	%g5,	%g7
	movge	%icc,	%i2,	%g2
	fmovsne	%xcc,	%f14,	%f21
	movvc	%icc,	%i6,	%g6
	tleu	%xcc,	0x0
	srax	%g1,	0x08,	%o1
	tgu	%icc,	0x0
	edge16ln	%o4,	%i3,	%i7
	fmovda	%xcc,	%f12,	%f7
	tle	%xcc,	0x6
	fmovscs	%xcc,	%f2,	%f0
	st	%f20,	[%l7 + 0x24]
	array8	%l5,	%i5,	%l4
	fpack32	%f24,	%f8,	%f20
	srlx	%i0,	0x02,	%g4
	fmovrdlz	%i4,	%f8,	%f24
	brgz,a	%o7,	loop_1004
	alignaddrl	%o3,	%o2,	%g3
	fpackfix	%f28,	%f26
	nop
	setx	loop_1005,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1004:
	sdiv	%o0,	0x16AA,	%o5
	alignaddrl	%l1,	%l3,	%o6
	fble	%fcc2,	loop_1006
loop_1005:
	fbu	%fcc2,	loop_1007
	edge8ln	%i1,	%l0,	%l6
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
loop_1006:
	fmovsge	%icc,	%f19,	%f26
loop_1007:
	array16	%g5,	%i2,	%g2
	fbule	%fcc3,	loop_1008
	fpsub16s	%f2,	%f8,	%f14
	fone	%f0
	brlz,a	%g7,	loop_1009
loop_1008:
	std	%f4,	[%l7 + 0x38]
	movl	%icc,	%i6,	%g6
	edge32	%g1,	%o1,	%i3
loop_1009:
	fandnot2	%f0,	%f24,	%f0
	mulx	%i7,	0x1A1D,	%l5
	stx	%i5,	[%l7 + 0x50]
	fbug	%fcc2,	loop_1010
	tneg	%xcc,	0x7
	set	0x20, %l3
	ldsha	[%l7 + %l3] 0x89,	%o4
loop_1010:
	fmovrdlez	%l4,	%f4,	%f2
	fmuld8sux16	%f7,	%f23,	%f16
	xor	%g4,	0x1E19,	%i0
	fxnor	%f30,	%f6,	%f20
	ldd	[%l7 + 0x40],	%o6
	fble	%fcc0,	loop_1011
	subcc	%i4,	0x0FDD,	%o2
	edge8ln	%o3,	%g3,	%o5
	sll	%o0,	0x01,	%l1
loop_1011:
	nop
	wr	%g0,	0x80,	%asi
	stba	%l3,	[%l7 + 0x4F] %asi
	movpos	%xcc,	%o6,	%l0
	fmovda	%icc,	%f7,	%f13
	fcmped	%fcc3,	%f18,	%f6
	xorcc	%l6,	0x021E,	%l2
	smul	%i1,	%g5,	%i2
	fzero	%f14
	fands	%f23,	%f19,	%f19
	edge8n	%g2,	%i6,	%g6
	sub	%g7,	0x0EEB,	%g1
	fmovdl	%icc,	%f5,	%f30
	edge16ln	%o1,	%i3,	%i7
	edge16n	%i5,	%l5,	%o4
	tcs	%xcc,	0x7
	nop
	setx loop_1012, %l0, %l1
	jmpl %l1, %g4
	tvs	%icc,	0x2
	sll	%i0,	%l4,	%i4
	fmovsgu	%icc,	%f13,	%f19
loop_1012:
	sdivx	%o7,	0x0EEB,	%o2
	edge8n	%g3,	%o3,	%o5
	edge32	%o0,	%l3,	%o6
	fbg,a	%fcc2,	loop_1013
	brnz,a	%l1,	loop_1014
	movne	%xcc,	%l6,	%l2
	fandnot2	%f20,	%f2,	%f6
loop_1013:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i1,	%l0
loop_1014:
	taddcctv	%i2,	0x0076,	%g2
	smul	%i6,	%g6,	%g5
	sir	0x0A25
	movleu	%icc,	%g1,	%o1
	alignaddr	%i3,	%g7,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,pn	%icc,	loop_1015
	srlx	%i5,	0x0C,	%l5
	movg	%xcc,	%g4,	%o4
	bge,a	loop_1016
loop_1015:
	srlx	%i0,	%l4,	%i4
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x25] %asi,	%o7
loop_1016:
	edge16l	%o2,	%g3,	%o5
	movleu	%icc,	%o0,	%o3
	sll	%o6,	%l3,	%l6
	edge16ln	%l2,	%i1,	%l1
	edge32l	%l0,	%i2,	%i6
	sra	%g6,	0x09,	%g2
	movvs	%icc,	%g1,	%o1
	fbo,a	%fcc0,	loop_1017
	movl	%xcc,	%g5,	%g7
	tge	%xcc,	0x2
	taddcc	%i3,	0x19D9,	%i7
loop_1017:
	movrlez	%l5,	%g4,	%o4
	srlx	%i0,	0x17,	%l4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x28] %asi,	%f7
	alignaddrl	%i4,	%o7,	%o2
	sub	%g3,	%i5,	%o0
	bcc,pn	%icc,	loop_1018
	fmovsne	%xcc,	%f14,	%f20
	tg	%xcc,	0x7
	tn	%icc,	0x7
loop_1018:
	movcc	%xcc,	%o3,	%o6
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%o5
	subccc	%l3,	%l2,	%l6
	tsubcc	%l1,	%i1,	%i2
	umulcc	%l0,	%i6,	%g6
	flush	%l7 + 0x54
	edge8n	%g1,	%g2,	%g5
	fmul8x16au	%f14,	%f8,	%f24
	orn	%o1,	0x0ADF,	%i3
	movvs	%xcc,	%i7,	%l5
	tge	%icc,	0x4
	tneg	%icc,	0x2
	fsrc2	%f8,	%f26
	ta	%icc,	0x2
	tl	%xcc,	0x0
	fmovrsne	%g4,	%f1,	%f31
	brgz	%o4,	loop_1019
	or	%i0,	%l4,	%g7
	fbu,a	%fcc2,	loop_1020
	srax	%o7,	0x19,	%o2
loop_1019:
	andcc	%g3,	%i5,	%i4
	or	%o0,	%o3,	%o6
loop_1020:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x57] %asi,	%l3
	popc	%o5,	%l6
	xnorcc	%l2,	0x126E,	%i1
	fbge,a	%fcc1,	loop_1021
	fandnot2s	%f12,	%f26,	%f27
	fsrc2s	%f21,	%f18
	fsrc1	%f16,	%f12
loop_1021:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a,pt	%xcc,	loop_1022
	tsubcctv	%l1,	0x0A3C,	%i2
	tge	%xcc,	0x6
	tpos	%xcc,	0x6
loop_1022:
	fcmpeq32	%f0,	%f12,	%l0
	srlx	%i6,	0x13,	%g6
	xor	%g1,	0x08EB,	%g5
	set	0x38, %g4
	ldsha	[%l7 + %g4] 0x81,	%g2
	fmovrsgz	%i3,	%f31,	%f25
	mulscc	%o1,	0x0D3A,	%l5
	and	%g4,	%o4,	%i0
	fpmerge	%f12,	%f11,	%f8
	umul	%i7,	0x1A0B,	%g7
	alignaddr	%l4,	%o2,	%g3
	ldub	[%l7 + 0x22],	%i5
	array16	%i4,	%o7,	%o3
	subc	%o6,	0x16B6,	%l3
	fandnot2	%f24,	%f6,	%f0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%l6
	tsubcc	%o0,	%l2,	%i1
	fmovrslez	%l1,	%f19,	%f2
	fbn	%fcc1,	loop_1023
	movge	%xcc,	%i2,	%l0
	stx	%g6,	[%l7 + 0x38]
	edge8n	%g1,	%i6,	%g2
loop_1023:
	movcs	%icc,	%g5,	%o1
	tl	%icc,	0x1
	mulx	%i3,	0x08F0,	%l5
	fbue,a	%fcc2,	loop_1024
	movcc	%icc,	%g4,	%i0
	be,a	loop_1025
	edge16	%i7,	%o4,	%l4
loop_1024:
	be,a	%xcc,	loop_1026
	tge	%xcc,	0x6
loop_1025:
	tcc	%icc,	0x4
	movrgz	%o2,	%g7,	%g3
loop_1026:
	tsubcctv	%i5,	0x15FE,	%i4
	xor	%o3,	0x04CB,	%o6
	xnor	%l3,	%o5,	%l6
	brnz	%o0,	loop_1027
	fmul8x16au	%f13,	%f28,	%f22
	srax	%o7,	%i1,	%l1
	bvs,a	%xcc,	loop_1028
loop_1027:
	ld	[%l7 + 0x58],	%f8
	tge	%xcc,	0x6
	faligndata	%f10,	%f26,	%f16
loop_1028:
	bl,a,pn	%xcc,	loop_1029
	tcc	%icc,	0x0
	movgu	%icc,	%l2,	%i2
	srlx	%l0,	0x10,	%g6
loop_1029:
	nop
	set	0x26, %g6
	stha	%g1,	[%l7 + %g6] 0x23
	membar	#Sync
	wr	%g0,	0x80,	%asi
	sta	%f30,	[%l7 + 0x44] %asi
	ldd	[%l7 + 0x48],	%f10
	taddcc	%i6,	0x1983,	%g5
	add	%o1,	%i3,	%g2
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x61] %asi,	%l5
	subcc	%g4,	0x1B2C,	%i0
	std	%o4,	[%l7 + 0x68]
	udiv	%l4,	0x01E0,	%i7
	fmovsneg	%xcc,	%f12,	%f28
	sth	%g7,	[%l7 + 0x16]
	fcmpeq16	%f18,	%f28,	%o2
	tsubcc	%i5,	%g3,	%o3
	alignaddrl	%o6,	%l3,	%o5
	movvc	%icc,	%i4,	%l6
	mulx	%o7,	0x00B8,	%o0
	fmovsvs	%xcc,	%f23,	%f20
	orn	%i1,	0x19E8,	%l2
	xorcc	%l1,	%l0,	%g6
	fabss	%f31,	%f1
	lduw	[%l7 + 0x34],	%i2
	xnor	%g1,	0x0108,	%i6
	fmul8x16al	%f18,	%f1,	%f18
	movrne	%o1,	%i3,	%g5
	fnot1	%f14,	%f28
	fmovrdlez	%g2,	%f22,	%f16
	alignaddr	%l5,	%i0,	%g4
	brz	%l4,	loop_1030
	edge8	%i7,	%o4,	%g7
	prefetch	[%l7 + 0x64],	 0x0
	fbo,a	%fcc3,	loop_1031
loop_1030:
	fcmpne32	%f6,	%f6,	%i5
	fands	%f13,	%f16,	%f15
	add	%g3,	0x0220,	%o2
loop_1031:
	andcc	%o3,	%o6,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i4,	%o5
	srlx	%l6,	0x19,	%o0
	movrne	%o7,	0x139,	%i1
	movgu	%xcc,	%l2,	%l1
	movrlez	%g6,	0x178,	%i2
	ta	%xcc,	0x4
	orncc	%g1,	0x1DFC,	%l0
	tneg	%icc,	0x0
	brz,a	%i6,	loop_1032
	brz,a	%o1,	loop_1033
	addcc	%i3,	0x1A46,	%g5
	or	%l5,	%i0,	%g4
loop_1032:
	bgu,pn	%xcc,	loop_1034
loop_1033:
	fcmple16	%f6,	%f12,	%g2
	movg	%icc,	%i7,	%o4
	movcs	%icc,	%l4,	%g7
loop_1034:
	fmul8ulx16	%f8,	%f8,	%f30
	edge32ln	%g3,	%o2,	%i5
	udiv	%o3,	0x14A7,	%o6
	and	%l3,	0x1FA9,	%o5
	fpackfix	%f28,	%f15
	nop
	set	0x78, %l6
	std	%f24,	[%l7 + %l6]
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tge	%icc,	0x2
	array16	%i4,	%l6,	%o0
	move	%xcc,	%i1,	%o7
	srl	%l2,	%l1,	%g6
	fbule	%fcc0,	loop_1035
	edge16	%i2,	%l0,	%g1
	edge16n	%i6,	%o1,	%g5
	sth	%l5,	[%l7 + 0x30]
loop_1035:
	movle	%xcc,	%i3,	%g4
	fba	%fcc0,	loop_1036
	movre	%g2,	0x0DE,	%i7
	movleu	%xcc,	%o4,	%i0
	srl	%l4,	%g3,	%g7
loop_1036:
	orcc	%i5,	%o3,	%o2
	xnorcc	%o6,	%o5,	%l3
	array8	%i4,	%o0,	%l6
	fmul8x16al	%f22,	%f0,	%f0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	movneg	%xcc,	%i1,	%l1
	movrlz	%l2,	0x025,	%g6
	tgu	%icc,	0x7
	fbl,a	%fcc3,	loop_1037
	xnor	%i2,	0x1A0C,	%g1
	sir	0x1C61
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4C] %asi,	%i6
loop_1037:
	mulx	%l0,	0x0ED5,	%g5
	fcmple16	%f20,	%f16,	%l5
	movpos	%xcc,	%o1,	%g4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x0C] %asi,	%f18
	movpos	%icc,	%g2,	%i7
	addcc	%i3,	%i0,	%l4
	fsrc2s	%f5,	%f12
	fpack16	%f6,	%f20
	set	0x60, %i0
	ldswa	[%l7 + %i0] 0x15,	%g3
	movpos	%xcc,	%o4,	%g7
	set	0x4D, %i3
	stba	%o3,	[%l7 + %i3] 0xeb
	membar	#Sync
	xor	%i5,	%o6,	%o5
	edge32ln	%o2,	%l3,	%o0
	fmul8ulx16	%f4,	%f26,	%f28
	movne	%xcc,	%l6,	%i4
	movrne	%i1,	0x013,	%o7
	fbl	%fcc2,	loop_1038
	array16	%l1,	%l2,	%g6
	subccc	%g1,	%i2,	%i6
	addccc	%l0,	%l5,	%g5
loop_1038:
	orncc	%o1,	0x1E26,	%g2
	fbul,a	%fcc2,	loop_1039
	tpos	%icc,	0x5
	movl	%xcc,	%g4,	%i7
	sra	%i0,	0x0D,	%i3
loop_1039:
	fnand	%f24,	%f24,	%f14
	faligndata	%f22,	%f6,	%f14
	fbuge,a	%fcc0,	loop_1040
	membar	0x3F
	movgu	%xcc,	%l4,	%g3
	stbar
loop_1040:
	umulcc	%g7,	%o3,	%o4
	fmovdcc	%icc,	%f31,	%f31
	orn	%o6,	0x0280,	%i5
	movrgez	%o5,	0x220,	%o2
	andn	%o0,	%l6,	%i4
	fsrc1s	%f5,	%f17
	sdivx	%i1,	0x07CD,	%o7
	wr	%g0,	0x89,	%asi
	stda	%l0,	[%l7 + 0x68] %asi
	fbl	%fcc1,	loop_1041
	fpmerge	%f20,	%f24,	%f4
	fbo	%fcc0,	loop_1042
	edge32n	%l2,	%g6,	%l3
loop_1041:
	smulcc	%g1,	0x1160,	%i6
	andn	%l0,	%l5,	%g5
loop_1042:
	fmovspos	%xcc,	%f28,	%f16
	fones	%f8
	fpackfix	%f30,	%f13
	movrgez	%i2,	%o1,	%g4
	tn	%xcc,	0x4
	mulx	%i7,	0x1DFD,	%g2
	fcmple32	%f0,	%f6,	%i3
	movneg	%icc,	%l4,	%i0
	smul	%g3,	0x1EB1,	%o3
	prefetch	[%l7 + 0x24],	 0x3
	swap	[%l7 + 0x38],	%g7
	fbo	%fcc3,	loop_1043
	umulcc	%o4,	%i5,	%o6
	movvc	%xcc,	%o2,	%o5
	movne	%icc,	%l6,	%o0
loop_1043:
	movleu	%icc,	%i1,	%o7
	xor	%i4,	0x132B,	%l1
	movvc	%icc,	%l2,	%g6
	fmovrdgz	%g1,	%f22,	%f4
	movrne	%l3,	%l0,	%l5
	std	%g4,	[%l7 + 0x50]
	tcc	%icc,	0x0
	fmovda	%xcc,	%f7,	%f8
	taddcctv	%i6,	0x04E0,	%i2
	bg	loop_1044
	tsubcc	%o1,	%i7,	%g2
	movrgz	%i3,	0x2D4,	%g4
	set	0x42, %o3
	stha	%l4,	[%l7 + %o3] 0x15
loop_1044:
	nop
	set	0x5E, %g3
	ldsha	[%l7 + %g3] 0x88,	%g3
	tgu	%icc,	0x1
	edge32n	%i0,	%g7,	%o3
	orncc	%i5,	%o4,	%o6
	edge16ln	%o5,	%o2,	%o0
	movre	%i1,	0x070,	%l6
	std	%i4,	[%l7 + 0x50]
	tcc	%xcc,	0x5
	set	0x7C, %o7
	lduwa	[%l7 + %o7] 0x18,	%l1
	bpos,pn	%xcc,	loop_1045
	fbe,a	%fcc3,	loop_1046
	edge8n	%l2,	%g6,	%g1
	movl	%xcc,	%l3,	%o7
loop_1045:
	edge16ln	%l5,	%g5,	%i6
loop_1046:
	ldx	[%l7 + 0x60],	%i2
	umul	%o1,	0x0D21,	%l0
	tpos	%xcc,	0x0
	movne	%xcc,	%g2,	%i3
	add	%i7,	%l4,	%g4
	fbue	%fcc2,	loop_1047
	stbar
	fmovdcc	%xcc,	%f14,	%f4
	bn,pn	%xcc,	loop_1048
loop_1047:
	fcmpgt16	%f10,	%f20,	%i0
	orncc	%g3,	0x0B62,	%o3
	movge	%icc,	%g7,	%i5
loop_1048:
	edge32	%o4,	%o6,	%o2
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmovs	%f30,	%f23
	tg	%icc,	0x6
	wr	%g0,	0xe2,	%asi
	stda	%o4,	[%l7 + 0x68] %asi
	membar	#Sync
	fpack16	%f0,	%f31
	subcc	%i1,	0x1716,	%o0
	andn	%i4,	%l1,	%l6
	bvc,pn	%xcc,	loop_1049
	fbn,a	%fcc2,	loop_1050
	movcc	%xcc,	%l2,	%g6
	fxor	%f30,	%f16,	%f24
loop_1049:
	tcc	%xcc,	0x7
loop_1050:
	fmovscs	%xcc,	%f15,	%f29
	array32	%g1,	%o7,	%l3
	movvc	%xcc,	%g5,	%l5
	lduw	[%l7 + 0x7C],	%i2
	tne	%icc,	0x7
	fmovdle	%icc,	%f10,	%f9
	movrlz	%o1,	0x374,	%i6
	nop
	setx loop_1051, %l0, %l1
	jmpl %l1, %l0
	tneg	%xcc,	0x3
	ldsb	[%l7 + 0x4A],	%i3
	membar	0x3F
loop_1051:
	taddcctv	%i7,	0x1B3C,	%l4
	tl	%xcc,	0x5
	fpsub32s	%f13,	%f5,	%f22
	fmovdvc	%icc,	%f8,	%f18
	srax	%g4,	%g2,	%g3
	fmovsn	%icc,	%f30,	%f29
	fors	%f14,	%f3,	%f14
	brnz,a	%o3,	loop_1052
	mova	%icc,	%i0,	%i5
	fornot2s	%f13,	%f28,	%f7
	addc	%g7,	0x00F5,	%o6
loop_1052:
	fcmpgt16	%f0,	%f2,	%o2
	taddcc	%o5,	%i1,	%o4
	fmovdg	%icc,	%f2,	%f30
	andncc	%i4,	%l1,	%l6
	smul	%l2,	%g6,	%o0
	fmuld8ulx16	%f25,	%f27,	%f10
	fmuld8sux16	%f1,	%f29,	%f10
	udivcc	%o7,	0x005F,	%l3
	tcs	%xcc,	0x4
	add	%g5,	%l5,	%g1
	nop
	setx	loop_1053,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srax	%o1,	%i6,	%i2
	edge8n	%l0,	%i3,	%l4
	tle	%icc,	0x7
loop_1053:
	sllx	%i7,	0x17,	%g4
	addcc	%g2,	0x11C4,	%g3
	bvc,pt	%xcc,	loop_1054
	ldstub	[%l7 + 0x3A],	%i0
	smulcc	%i5,	%g7,	%o6
	tgu	%icc,	0x3
loop_1054:
	subcc	%o2,	0x0D21,	%o3
	mova	%icc,	%o5,	%o4
	taddcc	%i1,	0x0BDC,	%i4
	tg	%xcc,	0x3
	fmovdle	%xcc,	%f19,	%f25
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	ldd	[%l7 + 0x08],	%f26
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x1A] %asi,	%l6
	movrne	%l1,	%l2,	%g6
	fcmple16	%f14,	%f30,	%o7
	edge8ln	%l3,	%g5,	%l5
	and	%o0,	%o1,	%g1
	ta	%xcc,	0x3
	fsrc2	%f2,	%f24
	fornot2s	%f20,	%f28,	%f7
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x71] %asi,	%i6
	add	%l0,	0x08C1,	%i3
	tcs	%xcc,	0x1
	set	0x60, %o5
	ldda	[%l7 + %o5] 0x24,	%l4
	fbg,a	%fcc1,	loop_1055
	tgu	%icc,	0x6
	edge16	%i7,	%g4,	%g2
	ta	%xcc,	0x3
loop_1055:
	tge	%icc,	0x5
	srax	%i2,	0x0C,	%i0
	nop
	setx loop_1056, %l0, %l1
	jmpl %l1, %g3
	subccc	%g7,	0x02A1,	%o6
	fnot2	%f24,	%f4
	flush	%l7 + 0x6C
loop_1056:
	nop
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf8,	%f0
	set	0x54, %i6
	swapa	[%l7 + %i6] 0x80,	%o2
	fmovrsgez	%o3,	%f16,	%f26
	brnz,a	%o5,	loop_1057
	move	%xcc,	%o4,	%i5
	bvc,a	%xcc,	loop_1058
	nop
	set	0x52, %o6
	lduh	[%l7 + %o6],	%i1
loop_1057:
	movcs	%icc,	%i4,	%l1
	set	0x40, %g1
	lduha	[%l7 + %g1] 0x80,	%l6
loop_1058:
	ldd	[%l7 + 0x10],	%g6
	movl	%icc,	%o7,	%l2
	fcmpeq32	%f14,	%f30,	%g5
	subc	%l3,	%l5,	%o1
	prefetch	[%l7 + 0x1C],	 0x3
	brlz	%o0,	loop_1059
	sdivcc	%i6,	0x0820,	%l0
	and	%i3,	%g1,	%l4
	mulscc	%i7,	0x09B1,	%g4
loop_1059:
	tne	%xcc,	0x1
	udiv	%g2,	0x107C,	%i0
	edge32	%g3,	%i2,	%g7
	movrgez	%o6,	0x16E,	%o3
	fmovsleu	%icc,	%f9,	%f6
	movle	%xcc,	%o5,	%o4
	edge16ln	%i5,	%o2,	%i4
	movle	%icc,	%i1,	%l6
	bcc,a	loop_1060
	xnorcc	%g6,	%o7,	%l2
	bleu,pn	%icc,	loop_1061
	tl	%xcc,	0x1
loop_1060:
	fbl	%fcc1,	loop_1062
	fbo	%fcc1,	loop_1063
loop_1061:
	movcs	%icc,	%l1,	%l3
	tleu	%xcc,	0x1
loop_1062:
	edge32ln	%l5,	%g5,	%o0
loop_1063:
	fmovscc	%xcc,	%f7,	%f4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x56] %asi,	%i6
	addc	%l0,	0x18F1,	%i3
	tneg	%xcc,	0x7
	movleu	%icc,	%g1,	%l4
	fsrc2	%f16,	%f28
	movcc	%icc,	%o1,	%g4
	movrgz	%i7,	0x303,	%g2
	fcmped	%fcc2,	%f6,	%f2
	sra	%i0,	0x0E,	%i2
	fbn	%fcc3,	loop_1064
	fmovdcs	%icc,	%f20,	%f24
	subc	%g7,	0x0FB2,	%g3
	edge16l	%o6,	%o3,	%o4
loop_1064:
	orn	%o5,	0x16E6,	%i5
	fornot2	%f28,	%f12,	%f22
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x7C] %asi,	%f24
	fnors	%f29,	%f5,	%f10
	sllx	%o2,	0x0A,	%i1
	fble	%fcc0,	loop_1065
	orn	%l6,	%g6,	%o7
	edge16n	%l2,	%l1,	%l3
	tneg	%xcc,	0x5
loop_1065:
	fmovscc	%xcc,	%f26,	%f7
	tg	%icc,	0x7
	fandnot2	%f8,	%f30,	%f28
	brgz	%i4,	loop_1066
	xnor	%l5,	%g5,	%o0
	udiv	%i6,	0x09BD,	%l0
	edge32ln	%g1,	%i3,	%o1
loop_1066:
	membar	0x4E
	fmovdle	%icc,	%f9,	%f1
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x0] %asi,	%g4
	fzero	%f10
	tleu	%xcc,	0x3
	movrlz	%i7,	%g2,	%l4
	xnor	%i2,	0x145C,	%g7
	orn	%i0,	0x159D,	%g3
	sir	0x12A6
	fmovsne	%xcc,	%f13,	%f5
	fabsd	%f30,	%f10
	umul	%o6,	0x01E8,	%o3
	fornot2	%f6,	%f8,	%f30
	fmovrse	%o4,	%f13,	%f9
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x5C] %asi,	%i5
	fpsub32s	%f6,	%f0,	%f12
	fmul8x16	%f18,	%f6,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f18,	%f4,	%f24
	ldstub	[%l7 + 0x44],	%o5
	fble,a	%fcc0,	loop_1067
	fmovdne	%icc,	%f4,	%f19
	fornot1s	%f20,	%f31,	%f29
	siam	0x6
loop_1067:
	fones	%f11
	movneg	%icc,	%i1,	%o2
	fble,a	%fcc3,	loop_1068
	edge8n	%g6,	%l6,	%o7
	fbu	%fcc2,	loop_1069
	nop
	setx loop_1070, %l0, %l1
	jmpl %l1, %l1
loop_1068:
	bg,pt	%icc,	loop_1071
	tne	%xcc,	0x6
loop_1069:
	fsrc1s	%f9,	%f7
loop_1070:
	udivcc	%l2,	0x1D8C,	%l3
loop_1071:
	te	%icc,	0x2
	alignaddrl	%i4,	%l5,	%o0
	umulcc	%i6,	0x0366,	%l0
	fmovdge	%icc,	%f2,	%f23
	bl	loop_1072
	bne	loop_1073
	fandnot2s	%f2,	%f23,	%f31
	sllx	%g5,	0x17,	%g1
loop_1072:
	mulx	%i3,	%o1,	%g4
loop_1073:
	call	loop_1074
	movleu	%icc,	%i7,	%g2
	sub	%i2,	0x08F7,	%l4
	fxnor	%f20,	%f28,	%f28
loop_1074:
	nop
	set	0x58, %l5
	stxa	%g7,	[%l7 + %l5] 0x88
	edge32l	%i0,	%o6,	%g3
	fbe,a	%fcc3,	loop_1075
	bgu,a	%icc,	loop_1076
	fmovrdlz	%o4,	%f24,	%f30
	movrlez	%o3,	%i5,	%i1
loop_1075:
	or	%o5,	%g6,	%o2
loop_1076:
	sth	%o7,	[%l7 + 0x0A]
	mulx	%l1,	0x118C,	%l6
	tsubcc	%l3,	%l2,	%i4
	fbne	%fcc3,	loop_1077
	sub	%o0,	0x00C0,	%i6
	pdist	%f10,	%f14,	%f14
	alignaddrl	%l5,	%l0,	%g5
loop_1077:
	umul	%i3,	0x0A4F,	%g1
	set	0x1E, %o0
	ldsha	[%l7 + %o0] 0x80,	%o1
	fbule	%fcc2,	loop_1078
	swap	[%l7 + 0x20],	%g4
	fbe	%fcc0,	loop_1079
	andncc	%i7,	%i2,	%l4
loop_1078:
	edge16n	%g2,	%i0,	%o6
	fmovrslez	%g7,	%f3,	%f28
loop_1079:
	tgu	%icc,	0x2
	set	0x67, %i2
	stba	%o4,	[%l7 + %i2] 0x14
	taddcc	%g3,	0x07B8,	%i5
	fbge	%fcc3,	loop_1080
	fmovda	%xcc,	%f28,	%f19
	tpos	%icc,	0x1
	fmovrdgz	%i1,	%f4,	%f30
loop_1080:
	edge16ln	%o5,	%o3,	%o2
	brlz	%g6,	loop_1081
	edge32l	%l1,	%l6,	%o7
	ldd	[%l7 + 0x28],	%l2
	orncc	%l2,	0x12CD,	%i4
loop_1081:
	fmovscs	%xcc,	%f14,	%f21
	movre	%i6,	%l5,	%o0
	movne	%xcc,	%g5,	%i3
	fbne,a	%fcc2,	loop_1082
	edge8l	%l0,	%g1,	%g4
	movrgz	%i7,	0x0D2,	%i2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x89,	%l4,	%g2
loop_1082:
	addc	%o1,	0x0D91,	%i0
	subcc	%o6,	0x1673,	%o4
	movne	%xcc,	%g3,	%g7
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	bvs,a	loop_1083
	tl	%xcc,	0x6
	tneg	%xcc,	0x2
	taddcc	%i5,	0x08F2,	%o5
loop_1083:
	edge32	%i1,	%o3,	%o2
	edge32n	%l1,	%g6,	%l6
	edge16ln	%l3,	%l2,	%i4
	tsubcc	%i6,	%l5,	%o0
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4D] %asi,	%o7
	fcmpne16	%f12,	%f18,	%i3
	movrlez	%g5,	0x21C,	%g1
	set	0x60, %l4
	prefetcha	[%l7 + %l4] 0x19,	 0x1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x28] %asi,	%f7
	srax	%l0,	%i2,	%i7
	std	%g2,	[%l7 + 0x30]
	sll	%o1,	%l4,	%o6
	edge32	%o4,	%g3,	%i0
	subc	%i5,	%o5,	%i1
	nop
	setx loop_1084, %l0, %l1
	jmpl %l1, %o3
	fcmpne32	%f8,	%f4,	%o2
	fpsub32s	%f7,	%f12,	%f13
	andn	%g7,	%g6,	%l1
loop_1084:
	tneg	%icc,	0x6
	pdist	%f16,	%f20,	%f22
	tge	%xcc,	0x1
	or	%l6,	%l2,	%i4
	movn	%icc,	%i6,	%l3
	andcc	%o0,	0x1F8D,	%o7
	sub	%l5,	%i3,	%g1
	udiv	%g4,	0x0019,	%l0
	fmovdneg	%icc,	%f14,	%f25
	smul	%i2,	0x0B50,	%i7
	fmovsne	%xcc,	%f4,	%f23
	nop
	set	0x1F, %i4
	stb	%g5,	[%l7 + %i4]
	bneg,a	loop_1085
	be,a,pn	%xcc,	loop_1086
	edge8	%o1,	%l4,	%g2
	fmovdg	%icc,	%f16,	%f16
loop_1085:
	movrlz	%o6,	%o4,	%g3
loop_1086:
	xorcc	%i5,	%i0,	%o5
	fbne,a	%fcc1,	loop_1087
	fnot2s	%f20,	%f5
	nop
	set	0x6A, %g7
	ldstub	[%l7 + %g7],	%o3
	movpos	%icc,	%o2,	%g7
loop_1087:
	sdiv	%g6,	0x0FDE,	%l1
	udiv	%l6,	0x1FCB,	%l2
	addcc	%i4,	0x1E2F,	%i6
	xor	%l3,	%o0,	%i1
	smulcc	%l5,	0x0C6F,	%o7
	ldsw	[%l7 + 0x10],	%i3
	fmovsgu	%xcc,	%f22,	%f21
	set	0x38, %l1
	stha	%g1,	[%l7 + %l1] 0x19
	xor	%l0,	0x0659,	%i2
	tvc	%xcc,	0x3
	edge32ln	%i7,	%g5,	%g4
	stw	%o1,	[%l7 + 0x2C]
	fpsub32	%f8,	%f14,	%f14
	alignaddr	%g2,	%o6,	%l4
	faligndata	%f2,	%f0,	%f14
	add	%o4,	%g3,	%i0
	fnegd	%f2,	%f8
	brz	%i5,	loop_1088
	tvs	%icc,	0x6
	alignaddr	%o3,	%o2,	%g7
	tneg	%xcc,	0x3
loop_1088:
	fmuld8ulx16	%f19,	%f25,	%f2
	fmovrdgez	%o5,	%f10,	%f20
	bg	loop_1089
	te	%icc,	0x2
	srax	%g6,	0x0F,	%l6
	tvc	%xcc,	0x1
loop_1089:
	bge,pt	%icc,	loop_1090
	sdiv	%l2,	0x1DE5,	%l1
	fornot2	%f2,	%f18,	%f8
	array8	%i4,	%l3,	%o0
loop_1090:
	or	%i6,	%i1,	%l5
	movcs	%xcc,	%o7,	%i3
	ta	%icc,	0x2
	fmovdgu	%xcc,	%f17,	%f22
	move	%xcc,	%l0,	%g1
	ble,a,pt	%icc,	loop_1091
	tn	%xcc,	0x1
	movg	%xcc,	%i2,	%g5
	fmovrslz	%g4,	%f16,	%f26
loop_1091:
	edge32ln	%i7,	%o1,	%g2
	fmovrse	%l4,	%f12,	%f22
	movgu	%xcc,	%o4,	%g3
	edge16l	%i0,	%o6,	%i5
	movrne	%o3,	0x022,	%o2
	stb	%g7,	[%l7 + 0x25]
	udivcc	%o5,	0x08C7,	%g6
	fmovsn	%icc,	%f4,	%f8
	fcmpgt32	%f24,	%f26,	%l2
	brlz,a	%l6,	loop_1092
	bcs,pn	%icc,	loop_1093
	tpos	%xcc,	0x5
	fmul8ulx16	%f0,	%f12,	%f10
loop_1092:
	nop
	set	0x54, %o4
	ldsw	[%l7 + %o4],	%i4
loop_1093:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x0C, %l0
	stw	%l3,	[%l7 + %l0]
	bpos,a,pt	%xcc,	loop_1094
	bge	loop_1095
	fnot2s	%f8,	%f2
	movrgz	%o0,	0x25F,	%i6
loop_1094:
	nop
	set	0x30, %i5
	ldxa	[%l7 + %i5] 0x04,	%i1
loop_1095:
	sdivcc	%l5,	0x0156,	%l1
	fnor	%f30,	%f22,	%f6
	taddcctv	%i3,	%l0,	%g1
	movpos	%xcc,	%i2,	%o7
	alignaddrl	%g4,	%g5,	%o1
	subcc	%g2,	0x06D6,	%i7
	set	0x5C, %g5
	swapa	[%l7 + %g5] 0x04,	%l4
	srax	%o4,	%g3,	%o6
	xnorcc	%i5,	0x0BFE,	%i0
	alignaddr	%o2,	%o3,	%o5
	srl	%g6,	0x06,	%l2
	sdiv	%g7,	0x0C69,	%i4
	tleu	%icc,	0x0
	fmovdcs	%icc,	%f3,	%f28
	edge32	%l6,	%l3,	%o0
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
	fmovsneg	%xcc,	%f23,	%f0
	fmovrse	%i1,	%f12,	%f18
	or	%i6,	0x1862,	%l5
loop_1096:
	movge	%xcc,	%l1,	%i3
	movg	%xcc,	%l0,	%g1
	movl	%icc,	%o7,	%i2
	fmovdgu	%icc,	%f16,	%f25
	for	%f14,	%f26,	%f22
	tcs	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g4,	%g5,	%g2
	movl	%icc,	%i7,	%o1
	movg	%xcc,	%o4,	%l4
	fbug,a	%fcc2,	loop_1097
	nop
	setx loop_1098, %l0, %l1
	jmpl %l1, %o6
	tpos	%xcc,	0x7
	fmovsg	%xcc,	%f2,	%f27
loop_1097:
	array8	%g3,	%i0,	%i5
loop_1098:
	movre	%o2,	%o3,	%g6
	te	%xcc,	0x4
	ld	[%l7 + 0x0C],	%f20
	te	%xcc,	0x4
	orncc	%o5,	%g7,	%i4
	movneg	%xcc,	%l2,	%l3
	set	0x34, %i7
	lduwa	[%l7 + %i7] 0x04,	%o0
	movrne	%l6,	%i6,	%l5
	movcc	%icc,	%l1,	%i1
	movre	%i3,	0x217,	%l0
	sub	%o7,	0x1E7D,	%i2
	fmovrdlez	%g1,	%f16,	%f24
	movrgez	%g4,	0x211,	%g2
	fmovsge	%icc,	%f14,	%f1
	movrlez	%i7,	0x2E4,	%o1
	alignaddr	%o4,	%g5,	%o6
	udivx	%l4,	0x0C85,	%g3
	fmovde	%xcc,	%f24,	%f26
	fbue	%fcc3,	loop_1099
	movrlz	%i5,	0x3CC,	%i0
	movrlz	%o3,	0x09A,	%g6
	fcmpd	%fcc1,	%f30,	%f18
loop_1099:
	fornot2s	%f18,	%f11,	%f9
	membar	0x3D
	fbg	%fcc1,	loop_1100
	edge16ln	%o5,	%g7,	%i4
	fabsd	%f4,	%f24
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x70] %asi,	%o2
loop_1100:
	fmul8sux16	%f6,	%f24,	%f28
	tge	%xcc,	0x5
	xnor	%l3,	0x156D,	%o0
	fmovscs	%xcc,	%f1,	%f28
	and	%l6,	0x1DA6,	%l2
	move	%xcc,	%i6,	%l5
	add	%i1,	0x0821,	%i3
	edge16ln	%l1,	%l0,	%o7
	umulcc	%g1,	0x0DE5,	%g4
	movrgez	%g2,	0x120,	%i2
	nop
	setx	loop_1101,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tne	%xcc,	0x2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x78] %asi,	%f6
loop_1101:
	sll	%i7,	%o1,	%g5
	fpadd16	%f18,	%f22,	%f6
	umul	%o6,	%o4,	%l4
	set	0x6F, %o2
	ldsba	[%l7 + %o2] 0x15,	%i5
	swap	[%l7 + 0x24],	%g3
	array32	%i0,	%g6,	%o3
	tg	%xcc,	0x6
	edge8l	%g7,	%i4,	%o5
	stb	%o2,	[%l7 + 0x1D]
	umul	%l3,	0x10BC,	%o0
	for	%f16,	%f20,	%f6
	movcs	%xcc,	%l2,	%i6
	nop
	setx	loop_1102,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	be,pt	%xcc,	loop_1103
	membar	0x23
	edge16	%l5,	%i1,	%i3
loop_1102:
	orcc	%l1,	0x17D3,	%l6
loop_1103:
	movcs	%icc,	%l0,	%g1
	xor	%o7,	%g4,	%i2
	tl	%xcc,	0x2
	movn	%icc,	%g2,	%o1
	srax	%i7,	%g5,	%o6
	bpos	loop_1104
	tvc	%xcc,	0x7
	bgu,pt	%xcc,	loop_1105
	array32	%l4,	%i5,	%o4
loop_1104:
	bneg	%icc,	loop_1106
	fbu	%fcc1,	loop_1107
loop_1105:
	tl	%xcc,	0x1
	stb	%g3,	[%l7 + 0x1D]
loop_1106:
	tsubcctv	%g6,	0x11A9,	%o3
loop_1107:
	smulcc	%i0,	%g7,	%i4
	fpsub32s	%f24,	%f24,	%f23
	fbge,a	%fcc0,	loop_1108
	sdivcc	%o5,	0x07D1,	%l3
	sdivx	%o0,	0x1BF3,	%l2
	set	0x18, %i1
	prefetcha	[%l7 + %i1] 0x14,	 0x1
loop_1108:
	andncc	%l5,	%i6,	%i1
	alignaddrl	%i3,	%l1,	%l0
	tsubcc	%l6,	0x01C7,	%o7
	movcc	%icc,	%g1,	%g4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x78] %asi,	%i2
	orcc	%g2,	%o1,	%i7
	smul	%o6,	%g5,	%l4
	fmovrde	%i5,	%f20,	%f10
	xor	%g3,	0x1A0F,	%o4
	fmovdvc	%xcc,	%f18,	%f12
	nop
	set	0x78, %o1
	ldd	[%l7 + %o1],	%g6
	tneg	%icc,	0x0
	movn	%icc,	%i0,	%o3
	pdist	%f10,	%f6,	%f4
	brgez,a	%g7,	loop_1109
	udiv	%o5,	0x03B4,	%l3
	stw	%i4,	[%l7 + 0x48]
	set	0x58, %l2
	lduba	[%l7 + %l2] 0x0c,	%l2
loop_1109:
	ldd	[%l7 + 0x18],	%f12
	tgu	%xcc,	0x7
	umulcc	%o0,	0x0A16,	%o2
	ldstub	[%l7 + 0x4C],	%l5
	sra	%i6,	0x00,	%i3
	subcc	%i1,	%l1,	%l6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x7C] %asi,	%l0
	fpmerge	%f12,	%f3,	%f6
	movgu	%xcc,	%g1,	%g4
	tleu	%icc,	0x5
	movre	%i2,	0x3EF,	%g2
	subccc	%o1,	%i7,	%o7
	tge	%icc,	0x7
	wr	%g0,	0x27,	%asi
	stha	%g5,	[%l7 + 0x44] %asi
	membar	#Sync
	membar	0x01
	fors	%f29,	%f3,	%f7
	movre	%l4,	0x152,	%o6
	te	%icc,	0x4
	edge32	%g3,	%i5,	%g6
	tpos	%xcc,	0x5
	udivcc	%o4,	0x1C20,	%i0
	addccc	%o3,	%g7,	%l3
	sth	%o5,	[%l7 + 0x3E]
	array32	%i4,	%l2,	%o2
	udivx	%l5,	0x12DE,	%o0
	or	%i6,	0x0E59,	%i1
	edge32n	%l1,	%l6,	%i3
	xor	%g1,	%g4,	%i2
	fsrc1	%f4,	%f22
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf1,	%f16
	fones	%f30
	fornot2	%f14,	%f2,	%f0
	andn	%l0,	0x1C55,	%g2
	faligndata	%f0,	%f0,	%f8
	movrlez	%i7,	0x052,	%o7
	wr	%g0,	0x11,	%asi
	stda	%g4,	[%l7 + 0x70] %asi
	fpsub32	%f18,	%f6,	%f26
	fbg	%fcc0,	loop_1110
	tge	%xcc,	0x3
	brgez	%o1,	loop_1111
	bvs,a,pn	%icc,	loop_1112
loop_1110:
	movrgz	%l4,	%g3,	%o6
	fmovrsgz	%i5,	%f29,	%f19
loop_1111:
	xorcc	%o4,	0x1F08,	%g6
loop_1112:
	brlez	%i0,	loop_1113
	tsubcctv	%g7,	%l3,	%o3
	wr	%g0,	0x80,	%asi
	stxa	%o5,	[%l7 + 0x78] %asi
loop_1113:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%i4,	%o2
	movrgez	%l2,	0x2E1,	%l5
	xorcc	%i6,	0x097C,	%i1
	and	%o0,	%l6,	%i3
	fnor	%f4,	%f0,	%f14
	membar	0x61
	orn	%l1,	%g1,	%i2
	andn	%l0,	0x0772,	%g2
	mulscc	%i7,	%o7,	%g4
	fpadd32s	%f27,	%f13,	%f14
	fxnors	%f5,	%f7,	%f5
	fmovdn	%icc,	%f21,	%f29
	subc	%g5,	0x1E55,	%o1
	nop
	setx	loop_1114,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brgz	%g3,	loop_1115
	fbue,a	%fcc2,	loop_1116
	tleu	%icc,	0x2
loop_1114:
	orn	%o6,	0x14BD,	%l4
loop_1115:
	sllx	%i5,	%o4,	%g6
loop_1116:
	sub	%g7,	0x062C,	%i0
	subc	%o3,	%l3,	%o5
	bvs,a,pt	%icc,	loop_1117
	bvc	loop_1118
	tleu	%icc,	0x2
	bn,a,pt	%xcc,	loop_1119
loop_1117:
	edge8n	%o2,	%i4,	%l2
loop_1118:
	tpos	%icc,	0x2
	call	loop_1120
loop_1119:
	movrlz	%l5,	0x36A,	%i6
	lduw	[%l7 + 0x58],	%o0
	brlz,a	%i1,	loop_1121
loop_1120:
	movgu	%icc,	%l6,	%l1
	bcs	loop_1122
	fmovsl	%xcc,	%f30,	%f15
loop_1121:
	fmuld8sux16	%f1,	%f17,	%f4
	alignaddr	%i3,	%g1,	%l0
loop_1122:
	srl	%g2,	0x0A,	%i2
	ldd	[%l7 + 0x18],	%o6
	movrlz	%i7,	%g4,	%o1
	ble,a	loop_1123
	fxnors	%f25,	%f17,	%f24
	set	0x30, %g6
	swapa	[%l7 + %g6] 0x89,	%g3
loop_1123:
	fcmpd	%fcc3,	%f20,	%f18
	and	%g5,	%o6,	%i5
	bn,a,pn	%icc,	loop_1124
	umulcc	%o4,	%g6,	%g7
	subcc	%l4,	0x165F,	%o3
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xe3,	%l2
loop_1124:
	tneg	%xcc,	0x5
	tneg	%icc,	0x7
	umulcc	%i0,	0x178D,	%o2
	fbu	%fcc1,	loop_1125
	udiv	%i4,	0x1F54,	%l2
	movl	%icc,	%o5,	%i6
	fpadd16s	%f7,	%f21,	%f20
loop_1125:
	array32	%o0,	%i1,	%l5
	addccc	%l1,	0x1439,	%i3
	tpos	%icc,	0x6
	edge32	%g1,	%l6,	%l0
	tn	%xcc,	0x5
	edge8ln	%i2,	%o7,	%g2
	fba,a	%fcc3,	loop_1126
	fmovdneg	%icc,	%f21,	%f7
	movcc	%xcc,	%g4,	%i7
	tpos	%icc,	0x3
loop_1126:
	sir	0x02F6
	movrne	%g3,	%o1,	%g5
	fmovdvs	%icc,	%f10,	%f4
	fmovsgu	%icc,	%f28,	%f30
	wr	%g0,	0x80,	%asi
	stha	%o6,	[%l7 + 0x72] %asi
	set	0x48, %l3
	ldswa	[%l7 + %l3] 0x89,	%o4
	edge8ln	%g6,	%g7,	%i5
	orncc	%o3,	%l4,	%l3
	fmovdl	%icc,	%f19,	%f22
	movpos	%icc,	%o2,	%i4
	bvc,a,pt	%icc,	loop_1127
	orn	%l2,	0x0952,	%i0
	tle	%xcc,	0x6
	fpadd16s	%f29,	%f12,	%f20
loop_1127:
	fmovrsgez	%i6,	%f8,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o0,	%o5
	addccc	%l5,	0x1559,	%l1
	fmovdleu	%icc,	%f7,	%f16
	movleu	%xcc,	%i3,	%g1
	fmuld8ulx16	%f24,	%f6,	%f8
	tge	%icc,	0x6
	fmovscc	%icc,	%f1,	%f25
	movneg	%xcc,	%i1,	%l0
	tcs	%xcc,	0x0
	movrne	%l6,	%o7,	%g2
	and	%i2,	0x1396,	%g4
	sethi	0x14F3,	%g3
	fmovrdgez	%o1,	%f16,	%f10
	srax	%i7,	%o6,	%g5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x28] %asi,	%f11
	mova	%xcc,	%g6,	%o4
	taddcc	%i5,	0x1271,	%g7
	umulcc	%l4,	0x107E,	%o3
	edge16l	%l3,	%o2,	%l2
	nop
	setx loop_1128, %l0, %l1
	jmpl %l1, %i0
	fmovdpos	%xcc,	%f23,	%f28
	or	%i6,	0x1BA3,	%i4
	fpadd32	%f26,	%f2,	%f22
loop_1128:
	nop
	wr	%g0,	0x10,	%asi
	stda	%o4,	[%l7 + 0x28] %asi
	tcs	%icc,	0x4
	fxors	%f21,	%f31,	%f31
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fcmpd	%fcc2,	%f26,	%f26
	tge	%icc,	0x0
	fmovrsgez	%l5,	%f17,	%f17
	fbe	%fcc1,	loop_1129
	sdivx	%o0,	0x0FE5,	%i3
	fble,a	%fcc0,	loop_1130
	srl	%g1,	0x0A,	%i1
loop_1129:
	movg	%icc,	%l1,	%l6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x3
loop_1130:
	movneg	%xcc,	%o7,	%g2
	brlz	%i2,	loop_1131
	sub	%g4,	0x0260,	%g3
	edge16l	%i7,	%o6,	%o1
	andcc	%g5,	%g6,	%o4
loop_1131:
	fmovrdne	%i5,	%f0,	%f20
	smul	%g7,	0x13BC,	%o3
	sdivcc	%l4,	0x0E6E,	%o2
	ble	loop_1132
	umulcc	%l3,	0x0BB6,	%i0
	fmovsa	%xcc,	%f19,	%f18
	tvs	%xcc,	0x5
loop_1132:
	tleu	%xcc,	0x3
	edge32	%l2,	%i6,	%i4
	tcc	%icc,	0x1
	brlz,a	%l5,	loop_1133
	edge32n	%o0,	%i3,	%g1
	smulcc	%i1,	%l1,	%o5
	fbue	%fcc2,	loop_1134
loop_1133:
	bneg,a	loop_1135
	movrgz	%l0,	0x348,	%l6
	tge	%icc,	0x0
loop_1134:
	fmovrde	%g2,	%f28,	%f8
loop_1135:
	fxors	%f21,	%f8,	%f4
	sub	%o7,	%i2,	%g4
	sir	0x0E17
	movleu	%icc,	%g3,	%o6
	subc	%i7,	%g5,	%o1
	alignaddr	%g6,	%o4,	%g7
	mulscc	%o3,	0x1394,	%l4
	st	%f5,	[%l7 + 0x50]
	srlx	%o2,	0x11,	%l3
	fpsub32s	%f7,	%f27,	%f25
	tg	%xcc,	0x0
	bl,a,pn	%icc,	loop_1136
	movrne	%i0,	%i5,	%i6
	or	%l2,	%l5,	%o0
	fpadd16s	%f6,	%f28,	%f6
loop_1136:
	fmul8x16au	%f9,	%f22,	%f16
	fbo,a	%fcc3,	loop_1137
	std	%f12,	[%l7 + 0x50]
	srl	%i3,	0x14,	%g1
	tpos	%icc,	0x2
loop_1137:
	ldsw	[%l7 + 0x64],	%i4
	tg	%icc,	0x3
	fbge,a	%fcc3,	loop_1138
	bcc,pn	%icc,	loop_1139
	tcc	%icc,	0x0
	subcc	%l1,	%o5,	%i1
loop_1138:
	tge	%xcc,	0x2
loop_1139:
	mova	%icc,	%l0,	%g2
	fsrc1s	%f11,	%f31
	tn	%xcc,	0x7
	movge	%icc,	%o7,	%l6
	sdivcc	%i2,	0x0BA5,	%g4
	bvs	loop_1140
	xorcc	%o6,	0x0B2F,	%i7
	bgu,pn	%xcc,	loop_1141
	andcc	%g3,	0x02DF,	%g5
loop_1140:
	fbug,a	%fcc3,	loop_1142
	fmul8x16	%f10,	%f6,	%f12
loop_1141:
	te	%icc,	0x3
	movrgez	%o1,	%g6,	%o4
loop_1142:
	sdiv	%g7,	0x0B00,	%o3
	smulcc	%l4,	%o2,	%l3
	brgz	%i0,	loop_1143
	brgz,a	%i5,	loop_1144
	fmovspos	%xcc,	%f21,	%f5
	edge32	%l2,	%l5,	%i6
loop_1143:
	fandnot1s	%f2,	%f7,	%f3
loop_1144:
	brgz	%i3,	loop_1145
	ldsw	[%l7 + 0x78],	%o0
	alignaddrl	%g1,	%l1,	%o5
	taddcctv	%i4,	%i1,	%g2
loop_1145:
	subc	%o7,	%l0,	%l6
	smul	%i2,	0x0D6D,	%o6
	fmovdvs	%xcc,	%f7,	%f25
	orcc	%g4,	0x0F5D,	%g3
	brlez,a	%i7,	loop_1146
	fbug	%fcc2,	loop_1147
	fmovdgu	%icc,	%f27,	%f14
	movvc	%icc,	%o1,	%g5
loop_1146:
	fnors	%f1,	%f23,	%f0
loop_1147:
	nop
	set	0x6C, %i0
	sta	%f26,	[%l7 + %i0] 0x89
	umulcc	%o4,	0x1688,	%g6
	set	0x18, %i3
	sta	%f19,	[%l7 + %i3] 0x04
	bcs,a	loop_1148
	fpsub16	%f20,	%f2,	%f4
	fbo,a	%fcc1,	loop_1149
	sir	0x0B01
loop_1148:
	ldub	[%l7 + 0x34],	%g7
	fmovsa	%icc,	%f24,	%f17
loop_1149:
	andn	%o3,	%o2,	%l4
	movcs	%icc,	%l3,	%i0
	fmovsl	%xcc,	%f6,	%f16
	fmovda	%icc,	%f19,	%f9
	fbne	%fcc0,	loop_1150
	udiv	%l2,	0x16F6,	%i5
	tn	%icc,	0x1
	udivcc	%l5,	0x119E,	%i3
loop_1150:
	edge16n	%o0,	%g1,	%i6
	te	%xcc,	0x5
	movrgz	%o5,	0x2D8,	%i4
	sdivcc	%l1,	0x17E3,	%i1
	movcs	%xcc,	%g2,	%o7
	edge32ln	%l6,	%l0,	%i2
	flush	%l7 + 0x30
	fsrc1s	%f28,	%f24
	brlz,a	%o6,	loop_1151
	udivcc	%g3,	0x1A6F,	%i7
	nop
	set	0x68, %g3
	stx	%g4,	[%l7 + %g3]
	std	%f20,	[%l7 + 0x28]
loop_1151:
	fnot2s	%f24,	%f10
	nop
	setx	loop_1152,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	move	%icc,	%g5,	%o1
	fcmpeq32	%f20,	%f20,	%o4
	prefetch	[%l7 + 0x50],	 0x0
loop_1152:
	srlx	%g7,	%o3,	%o2
	flush	%l7 + 0x4C
	fbuge,a	%fcc2,	loop_1153
	fmul8x16al	%f28,	%f12,	%f10
	edge8l	%g6,	%l4,	%i0
	tleu	%xcc,	0x6
loop_1153:
	edge32l	%l2,	%i5,	%l3
	fblg	%fcc1,	loop_1154
	sdiv	%l5,	0x0799,	%o0
	sdivx	%i3,	0x0600,	%g1
	edge16l	%i6,	%i4,	%o5
loop_1154:
	or	%i1,	%g2,	%l1
	movrgez	%l6,	%o7,	%l0
	fnot2	%f26,	%f0
	edge8l	%i2,	%o6,	%i7
	movgu	%xcc,	%g3,	%g4
	set	0x7C, %o7
	lda	[%l7 + %o7] 0x14,	%f2
	movvc	%xcc,	%o1,	%g5
	udivx	%g7,	0x19A1,	%o3
	xorcc	%o2,	%o4,	%l4
	fmovsn	%xcc,	%f1,	%f24
	fandnot1s	%f4,	%f1,	%f31
	fmovscs	%xcc,	%f13,	%f1
	brlez	%i0,	loop_1155
	andn	%g6,	0x1D59,	%i5
	fmovsl	%xcc,	%f31,	%f0
	movleu	%icc,	%l3,	%l5
loop_1155:
	edge16n	%o0,	%l2,	%g1
	xnor	%i3,	%i4,	%i6
	fmul8ulx16	%f28,	%f22,	%f0
	fmovrdlez	%i1,	%f28,	%f28
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o5
	umul	%g2,	0x1CCF,	%l6
	sdivx	%o7,	0x16F4,	%l0
	movrgez	%i2,	0x0A5,	%o6
	brgz,a	%i7,	loop_1156
	fmovd	%f14,	%f20
	movcc	%xcc,	%l1,	%g3
	mova	%icc,	%g4,	%o1
loop_1156:
	ldsh	[%l7 + 0x2A],	%g7
	tpos	%icc,	0x0
	movcc	%icc,	%o3,	%g5
	sllx	%o2,	%o4,	%l4
	movgu	%xcc,	%g6,	%i5
	subc	%l3,	%l5,	%o0
	smulcc	%l2,	0x1C20,	%g1
	fmovsvs	%icc,	%f20,	%f9
	bne	%icc,	loop_1157
	brz,a	%i0,	loop_1158
	array16	%i4,	%i6,	%i1
	set	0x14, %o5
	lda	[%l7 + %o5] 0x19,	%f17
loop_1157:
	edge32n	%o5,	%i3,	%l6
loop_1158:
	taddcctv	%g2,	0x1773,	%o7
	srlx	%l0,	%o6,	%i2
	tle	%icc,	0x5
	fcmpgt32	%f24,	%f6,	%i7
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x22] %asi,	%g3
	mova	%xcc,	%l1,	%g4
	tsubcc	%g7,	0x0C6A,	%o1
	addc	%g5,	0x0A9B,	%o2
	udivcc	%o3,	0x0BA4,	%o4
	ldstub	[%l7 + 0x55],	%g6
	udiv	%i5,	0x17D4,	%l4
	movpos	%icc,	%l5,	%l3
	be,a,pt	%icc,	loop_1159
	fmovdne	%icc,	%f11,	%f13
	bleu,pt	%xcc,	loop_1160
	array16	%o0,	%g1,	%l2
loop_1159:
	fmovse	%xcc,	%f12,	%f10
	xnorcc	%i4,	0x0A5D,	%i0
loop_1160:
	tpos	%xcc,	0x3
	tneg	%icc,	0x3
	bcs,a	loop_1161
	fcmpeq32	%f14,	%f26,	%i1
	srl	%o5,	%i3,	%i6
	set	0x6A, %o3
	ldsba	[%l7 + %o3] 0x14,	%g2
loop_1161:
	movneg	%icc,	%l6,	%l0
	ba,a,pn	%xcc,	loop_1162
	call	loop_1163
	fble,a	%fcc1,	loop_1164
	nop
	setx	loop_1165,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1162:
	andn	%o6,	0x0F41,	%i2
loop_1163:
	bleu	loop_1166
loop_1164:
	movrne	%i7,	%g3,	%l1
loop_1165:
	edge16l	%g4,	%o7,	%o1
	fcmps	%fcc2,	%f11,	%f27
loop_1166:
	orcc	%g7,	0x0FAB,	%o2
	fmovdg	%xcc,	%f24,	%f16
	fmovs	%f10,	%f18
	srlx	%o3,	%o4,	%g6
	ta	%xcc,	0x7
	movge	%xcc,	%i5,	%l4
	tcc	%icc,	0x2
	xnor	%l5,	%l3,	%o0
	mulscc	%g5,	0x12E0,	%l2
	udiv	%i4,	0x02CD,	%g1
	fbge,a	%fcc1,	loop_1167
	edge16l	%i1,	%i0,	%o5
	tneg	%xcc,	0x7
	movpos	%xcc,	%i6,	%g2
loop_1167:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l6,	%l0
	ldd	[%l7 + 0x10],	%o6
	fbo	%fcc1,	loop_1168
	fornot2s	%f19,	%f15,	%f14
	movleu	%xcc,	%i2,	%i7
	fbuge,a	%fcc1,	loop_1169
loop_1168:
	addccc	%g3,	%i3,	%l1
	smul	%g4,	0x09DB,	%o7
	fpsub32s	%f3,	%f7,	%f23
loop_1169:
	fcmpeq32	%f18,	%f14,	%o1
	srlx	%g7,	0x06,	%o2
	movrlez	%o4,	%o3,	%g6
	bleu,a	loop_1170
	tvc	%icc,	0x6
	fpadd16s	%f29,	%f31,	%f24
	fmovdcc	%xcc,	%f18,	%f3
loop_1170:
	or	%l4,	%i5,	%l5
	orncc	%l3,	%o0,	%l2
	addcc	%g5,	%g1,	%i1
	movrne	%i0,	%i4,	%o5
	set	0x12, %g2
	stba	%i6,	[%l7 + %g2] 0x04
	taddcc	%l6,	0x0321,	%l0
	sir	0x1D42
	edge8ln	%g2,	%i2,	%i7
	fmovde	%icc,	%f15,	%f19
	sdivcc	%o6,	0x0900,	%i3
	sth	%g3,	[%l7 + 0x6E]
	fmovrdlez	%l1,	%f14,	%f10
	brnz,a	%g4,	loop_1171
	movpos	%icc,	%o1,	%o7
	tl	%xcc,	0x1
	fzero	%f8
loop_1171:
	fpadd32s	%f6,	%f8,	%f9
	udiv	%g7,	0x18DA,	%o2
	tcs	%icc,	0x3
	movn	%xcc,	%o4,	%o3
	stbar
	srl	%l4,	0x11,	%g6
	tsubcc	%l5,	%i5,	%o0
	umulcc	%l3,	%g5,	%l2
	udivx	%g1,	0x01CB,	%i0
	movrlz	%i4,	%i1,	%o5
	fmovs	%f23,	%f26
	srax	%l6,	%i6,	%l0
	sethi	0x1AB0,	%g2
	tl	%icc,	0x6
	bge	%icc,	loop_1172
	fmul8x16al	%f21,	%f23,	%f16
	popc	0x0BC6,	%i7
	stw	%o6,	[%l7 + 0x30]
loop_1172:
	addcc	%i3,	%g3,	%l1
	bne	%xcc,	loop_1173
	bcs	loop_1174
	te	%xcc,	0x4
	fnot2	%f0,	%f8
loop_1173:
	fmovsvs	%icc,	%f18,	%f9
loop_1174:
	edge16n	%g4,	%i2,	%o7
	ldx	[%l7 + 0x50],	%o1
	orcc	%o2,	0x166F,	%o4
	movneg	%xcc,	%g7,	%o3
	xnor	%l4,	0x0956,	%l5
	andcc	%g6,	%i5,	%l3
	edge8l	%g5,	%o0,	%l2
	movrne	%i0,	%g1,	%i4
	udivcc	%o5,	0x1122,	%l6
	edge16l	%i1,	%l0,	%g2
	fpsub16	%f12,	%f8,	%f4
	set	0x30, %i6
	ldda	[%l7 + %i6] 0xe2,	%i6
	edge16	%i7,	%i3,	%g3
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x26] %asi,	%o6
	movge	%icc,	%l1,	%i2
	fandnot2s	%f11,	%f5,	%f25
	fnors	%f15,	%f29,	%f4
	andncc	%g4,	%o1,	%o7
	movcc	%xcc,	%o2,	%o4
	mulx	%g7,	%o3,	%l4
	prefetch	[%l7 + 0x6C],	 0x2
	fble	%fcc2,	loop_1175
	movvc	%icc,	%g6,	%i5
	fbo	%fcc3,	loop_1176
	andncc	%l3,	%g5,	%l5
loop_1175:
	tleu	%icc,	0x1
	movcc	%icc,	%l2,	%i0
loop_1176:
	brlz,a	%g1,	loop_1177
	fnot2s	%f20,	%f17
	movn	%xcc,	%o0,	%o5
	orcc	%i4,	%l6,	%i1
loop_1177:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f11,	[%l7 + 0x48] %asi
	bpos,a	loop_1178
	subcc	%l0,	%i6,	%i7
	mulx	%i3,	%g2,	%o6
	movvs	%xcc,	%g3,	%l1
loop_1178:
	udivcc	%i2,	0x1CCC,	%g4
	fmovspos	%icc,	%f16,	%f7
	fbule	%fcc3,	loop_1179
	movvs	%xcc,	%o1,	%o2
	fmul8x16au	%f20,	%f13,	%f20
	fmovdleu	%xcc,	%f9,	%f21
loop_1179:
	ld	[%l7 + 0x4C],	%f24
	movvc	%icc,	%o7,	%g7
	fmovscs	%icc,	%f2,	%f0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o4,	%o3
	fcmpgt16	%f14,	%f22,	%l4
	fmovsvs	%icc,	%f6,	%f17
	bge,pt	%icc,	loop_1180
	movcc	%icc,	%g6,	%l3
	tg	%xcc,	0x4
	orncc	%g5,	0x1573,	%l5
loop_1180:
	orcc	%i5,	0x04E0,	%l2
	tleu	%icc,	0x0
	ldub	[%l7 + 0x63],	%g1
	umul	%o0,	%o5,	%i4
	tleu	%xcc,	0x2
	fcmpne32	%f22,	%f10,	%i0
	fbl	%fcc0,	loop_1181
	ba,a,pt	%xcc,	loop_1182
	orn	%i1,	%l0,	%i6
	sll	%i7,	%l6,	%i3
loop_1181:
	nop
	add	%l7,	0x1C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%g2
loop_1182:
	edge16l	%g3,	%l1,	%i2
	tsubcc	%o1,	0x19DA,	%g4
	andncc	%o7,	%g7,	%o4
	fmovscs	%xcc,	%f15,	%f30
	tne	%xcc,	0x7
	sdiv	%o3,	0x0CDE,	%o2
	subcc	%l4,	%l3,	%g5
	andcc	%l5,	%g6,	%l2
	fxnors	%f28,	%f28,	%f20
	tne	%icc,	0x4
	udivx	%g1,	0x0101,	%i5
	fmovdcs	%xcc,	%f24,	%f11
	subccc	%o5,	0x1B51,	%o0
	fors	%f7,	%f1,	%f18
	subc	%i4,	%i0,	%i1
	edge32l	%l0,	%i6,	%l6
	sth	%i3,	[%l7 + 0x3E]
	alignaddrl	%o6,	%i7,	%g3
	smulcc	%l1,	%i2,	%g2
	fandnot2	%f30,	%f10,	%f10
	stbar
	array8	%o1,	%o7,	%g4
	orn	%g7,	%o3,	%o2
	brgz	%l4,	loop_1183
	andncc	%o4,	%g5,	%l5
	stx	%g6,	[%l7 + 0x60]
	srax	%l3,	0x08,	%l2
loop_1183:
	fcmpgt16	%f4,	%f2,	%g1
	ba,a	loop_1184
	andn	%o5,	0x050D,	%i5
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x64] %asi,	%o0
loop_1184:
	orncc	%i0,	0x0C37,	%i1
	fmovrdgz	%l0,	%f26,	%f18
	tsubcc	%i6,	%i4,	%i3
	set	0x7A, %g1
	lduha	[%l7 + %g1] 0x0c,	%l6
	sll	%o6,	0x1F,	%i7
	fmul8sux16	%f2,	%f26,	%f10
	fandnot1	%f8,	%f22,	%f30
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%g3
	umulcc	%l1,	0x0BC9,	%i2
	fmovs	%f17,	%f0
	bge,a	loop_1185
	fbuge	%fcc2,	loop_1186
	fnor	%f26,	%f4,	%f28
	siam	0x1
loop_1185:
	ld	[%l7 + 0x24],	%f13
loop_1186:
	movpos	%xcc,	%g2,	%o1
	srl	%o7,	%g7,	%o3
	tle	%xcc,	0x4
	bcc	%icc,	loop_1187
	edge8n	%g4,	%o2,	%o4
	fmovsa	%xcc,	%f8,	%f2
	or	%l4,	0x064F,	%l5
loop_1187:
	sdiv	%g5,	0x0ABD,	%g6
	addccc	%l2,	0x1095,	%g1
	popc	%l3,	%i5
	tgu	%xcc,	0x3
	movge	%xcc,	%o0,	%i0
	subccc	%i1,	0x184C,	%o5
	edge32n	%i6,	%l0,	%i3
	umul	%i4,	0x092A,	%l6
	fmovscc	%icc,	%f20,	%f16
	fba	%fcc1,	loop_1188
	sllx	%o6,	0x1A,	%g3
	movgu	%xcc,	%i7,	%l1
	ld	[%l7 + 0x2C],	%f23
loop_1188:
	fmovdleu	%xcc,	%f25,	%f25
	mova	%icc,	%g2,	%i2
	fpsub32s	%f0,	%f27,	%f31
	sub	%o7,	%o1,	%g7
	movcc	%xcc,	%g4,	%o2
	ldd	[%l7 + 0x68],	%o4
	array32	%o3,	%l4,	%g5
	alignaddrl	%l5,	%g6,	%g1
	nop
	set	0x40, %o6
	prefetch	[%l7 + %o6],	 0x3
	fmovda	%xcc,	%f0,	%f13
	sllx	%l3,	0x17,	%i5
	fors	%f13,	%f7,	%f10
	std	%l2,	[%l7 + 0x40]
	movne	%xcc,	%i0,	%o0
	alignaddrl	%o5,	%i6,	%l0
	set	0x10, %l5
	stha	%i1,	[%l7 + %l5] 0x11
	ldd	[%l7 + 0x30],	%f0
	fpsub16	%f8,	%f26,	%f10
	movvc	%icc,	%i3,	%i4
	smulcc	%o6,	%l6,	%g3
	for	%f0,	%f18,	%f14
	udiv	%l1,	0x112B,	%g2
	tne	%icc,	0x7
	add	%i7,	%o7,	%i2
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	ta	%xcc,	0x5
	movpos	%xcc,	%g7,	%g4
	fmovdleu	%icc,	%f3,	%f16
	movrne	%o2,	%o4,	%o1
	tge	%xcc,	0x7
	sethi	0x1D29,	%l4
	bcs,a,pn	%icc,	loop_1189
	fxnor	%f0,	%f26,	%f14
	nop
	set	0x42, %i2
	ldsh	[%l7 + %i2],	%g5
	tg	%icc,	0x6
loop_1189:
	udivx	%o3,	0x04F9,	%l5
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x64] %asi,	%f28
	fmovdl	%xcc,	%f12,	%f15
	ldx	[%l7 + 0x58],	%g1
	movcs	%icc,	%g6,	%i5
	udivcc	%l2,	0x1AED,	%l3
	udivx	%o0,	0x074D,	%o5
	movgu	%icc,	%i0,	%i6
	fmovdgu	%xcc,	%f23,	%f6
	move	%xcc,	%l0,	%i1
	edge16	%i4,	%i3,	%o6
	fmovdvc	%icc,	%f7,	%f24
	fmovdpos	%icc,	%f19,	%f23
	movvc	%icc,	%l6,	%l1
	movleu	%icc,	%g3,	%g2
	movneg	%xcc,	%o7,	%i2
	mulx	%i7,	%g4,	%o2
	fnot1	%f24,	%f26
	taddcctv	%g7,	%o4,	%l4
	te	%xcc,	0x5
	fmul8x16al	%f9,	%f13,	%f8
	brgz,a	%o1,	loop_1190
	fornot1s	%f18,	%f26,	%f13
	fmul8x16	%f0,	%f0,	%f2
	xnorcc	%g5,	%o3,	%g1
loop_1190:
	andncc	%g6,	%i5,	%l2
	fmovrse	%l5,	%f21,	%f1
	movrgz	%o0,	0x128,	%l3
	fandnot2s	%f30,	%f11,	%f0
	edge32	%i0,	%i6,	%o5
	fmovsne	%xcc,	%f26,	%f1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x19,	%i1,	%l0
	fmul8x16	%f2,	%f12,	%f6
	tcc	%xcc,	0x6
	fmovrslz	%i3,	%f25,	%f16
	smul	%i4,	0x04FC,	%l6
	bgu,pt	%xcc,	loop_1191
	addcc	%o6,	%l1,	%g3
	movre	%o7,	0x333,	%i2
	subcc	%g2,	0x145E,	%i7
loop_1191:
	brlz	%o2,	loop_1192
	movre	%g7,	0x249,	%o4
	fpack32	%f24,	%f14,	%f8
	tsubcc	%g4,	%l4,	%o1
loop_1192:
	movpos	%xcc,	%g5,	%o3
	edge8l	%g1,	%i5,	%g6
	fandnot2	%f2,	%f12,	%f30
	fmovdne	%icc,	%f3,	%f30
	movrne	%l5,	0x2B8,	%l2
	movvc	%xcc,	%l3,	%o0
	fbule	%fcc0,	loop_1193
	fmuld8sux16	%f9,	%f30,	%f8
	movrgz	%i0,	0x174,	%o5
	fnor	%f30,	%f14,	%f0
loop_1193:
	movgu	%xcc,	%i6,	%l0
	srl	%i1,	0x01,	%i4
	movrgz	%i3,	0x277,	%o6
	brgez	%l6,	loop_1194
	edge8ln	%l1,	%o7,	%i2
	fmovscc	%xcc,	%f6,	%f17
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x58] %asi,	%g3
loop_1194:
	ld	[%l7 + 0x5C],	%f28
	swap	[%l7 + 0x24],	%i7
	move	%icc,	%g2,	%g7
	tg	%icc,	0x6
	smulcc	%o2,	0x07F1,	%g4
	fmovsge	%xcc,	%f14,	%f14
	fmovsne	%xcc,	%f5,	%f3
	fmovsvc	%icc,	%f1,	%f24
	ldstub	[%l7 + 0x55],	%o4
	fxors	%f15,	%f23,	%f10
	fpackfix	%f24,	%f23
	movcc	%xcc,	%l4,	%o1
	movre	%g5,	%g1,	%i5
	fornot2s	%f23,	%f29,	%f2
	movvs	%xcc,	%o3,	%g6
	bcc,a,pn	%icc,	loop_1195
	flush	%l7 + 0x34
	brlez,a	%l5,	loop_1196
	tcs	%icc,	0x3
loop_1195:
	fmovscc	%xcc,	%f15,	%f11
	tsubcctv	%l3,	0x149F,	%o0
loop_1196:
	ta	%icc,	0x1
	bne,a,pn	%icc,	loop_1197
	udivx	%i0,	0x1489,	%l2
	taddcc	%i6,	%o5,	%i1
	bgu,a,pn	%xcc,	loop_1198
loop_1197:
	fmovrslz	%l0,	%f29,	%f6
	bvs,pn	%icc,	loop_1199
	movgu	%icc,	%i4,	%o6
loop_1198:
	fblg	%fcc2,	loop_1200
	brlz,a	%l6,	loop_1201
loop_1199:
	movrne	%i3,	0x016,	%l1
	fmovdn	%xcc,	%f10,	%f6
loop_1200:
	te	%xcc,	0x5
loop_1201:
	tvs	%xcc,	0x3
	fbug,a	%fcc2,	loop_1202
	umulcc	%i2,	0x1A78,	%g3
	movrlez	%o7,	%g2,	%g7
	fmovdn	%xcc,	%f13,	%f13
loop_1202:
	fmovrsne	%i7,	%f28,	%f23
	tcs	%xcc,	0x4
	addc	%o2,	%g4,	%o4
	movrlz	%o1,	%g5,	%l4
	tneg	%xcc,	0x5
	movvs	%icc,	%g1,	%i5
	ldsw	[%l7 + 0x0C],	%o3
	fmovrse	%l5,	%f21,	%f1
	xnorcc	%g6,	0x12AE,	%o0
	andncc	%i0,	%l3,	%i6
	subcc	%l2,	0x1BE4,	%i1
	movrlz	%l0,	%o5,	%i4
	fands	%f17,	%f17,	%f27
	xor	%o6,	0x0247,	%l6
	set	0x42, %l4
	ldsha	[%l7 + %l4] 0x0c,	%i3
	tsubcctv	%l1,	%g3,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i2,	%g2,	%g7
	te	%icc,	0x4
	fmovrsgz	%i7,	%f26,	%f5
	tle	%xcc,	0x0
	popc	0x1CB5,	%o2
	edge32n	%g4,	%o4,	%o1
	brgez	%l4,	loop_1203
	fandnot1	%f8,	%f30,	%f18
	fmovrsne	%g5,	%f8,	%f17
	edge8ln	%i5,	%o3,	%g1
loop_1203:
	fmovdg	%xcc,	%f15,	%f5
	fblg,a	%fcc2,	loop_1204
	nop
	setx loop_1205, %l0, %l1
	jmpl %l1, %l5
	brgez,a	%g6,	loop_1206
	sir	0x1C7C
loop_1204:
	umul	%i0,	0x1709,	%l3
loop_1205:
	tvc	%xcc,	0x4
loop_1206:
	xorcc	%i6,	%l2,	%o0
	sdivx	%l0,	0x05F7,	%i1
	edge16	%o5,	%i4,	%o6
	set	0x2E, %i4
	ldstuba	[%l7 + %i4] 0x80,	%l6
	fbue	%fcc2,	loop_1207
	andncc	%i3,	%l1,	%o7
	set	0x60, %g7
	stda	%g2,	[%l7 + %g7] 0x88
loop_1207:
	andncc	%i2,	%g2,	%i7
	tg	%icc,	0x0
	smulcc	%o2,	0x149C,	%g4
	edge32l	%o4,	%g7,	%o1
	sllx	%g5,	0x09,	%i5
	fpsub16	%f4,	%f8,	%f18
	bleu	loop_1208
	movneg	%icc,	%o3,	%g1
	ba	%xcc,	loop_1209
	sethi	0x1A45,	%l5
loop_1208:
	fmovrdgez	%l4,	%f6,	%f8
	bpos,a,pt	%xcc,	loop_1210
loop_1209:
	andncc	%g6,	%i0,	%i6
	wr	%g0,	0xeb,	%asi
	stba	%l3,	[%l7 + 0x1D] %asi
	membar	#Sync
loop_1210:
	fpack16	%f2,	%f27
	fmovsvc	%icc,	%f24,	%f3
	sdivcc	%l2,	0x02E9,	%o0
	movcs	%xcc,	%i1,	%l0
	fbug,a	%fcc3,	loop_1211
	fmovdle	%icc,	%f1,	%f1
	addccc	%o5,	%i4,	%o6
	fnors	%f25,	%f21,	%f23
loop_1211:
	fmovscs	%icc,	%f16,	%f3
	ldsw	[%l7 + 0x38],	%i3
	tgu	%xcc,	0x1
	movrlz	%l6,	0x313,	%o7
	membar	0x18
	tpos	%icc,	0x5
	te	%xcc,	0x7
	mulx	%l1,	0x0724,	%g3
	set	0x78, %o0
	stxa	%g2,	[%l7 + %o0] 0xe3
	membar	#Sync
	addccc	%i7,	%o2,	%g4
	sub	%o4,	0x09D8,	%i2
	edge16	%g7,	%o1,	%i5
	movge	%xcc,	%o3,	%g5
	ldstub	[%l7 + 0x5D],	%g1
	stx	%l4,	[%l7 + 0x70]
	subc	%g6,	0x193A,	%i0
	fmovdle	%icc,	%f8,	%f25
	edge8n	%i6,	%l3,	%l2
	popc	%l5,	%o0
	srl	%i1,	%o5,	%l0
	brnz,a	%i4,	loop_1212
	bleu,pn	%icc,	loop_1213
	movn	%xcc,	%i3,	%o6
	alignaddr	%o7,	%l6,	%g3
loop_1212:
	brnz,a	%g2,	loop_1214
loop_1213:
	fandnot1	%f22,	%f26,	%f14
	edge32ln	%i7,	%o2,	%g4
	orn	%o4,	%i2,	%l1
loop_1214:
	fnot1s	%f15,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g7,	0x17E9,	%o1
	tle	%icc,	0x5
	sra	%i5,	%o3,	%g5
	fbge	%fcc1,	loop_1215
	ble,a,pn	%icc,	loop_1216
	mulscc	%g1,	0x1ED8,	%g6
	wr	%g0,	0x19,	%asi
	stwa	%l4,	[%l7 + 0x10] %asi
loop_1215:
	subccc	%i0,	0x0AFE,	%l3
loop_1216:
	tleu	%xcc,	0x0
	ta	%xcc,	0x0
	ldsb	[%l7 + 0x5F],	%i6
	set	0x2D, %l1
	lduba	[%l7 + %l1] 0x81,	%l2
	tgu	%icc,	0x6
	xorcc	%l5,	%i1,	%o5
	brz,a	%o0,	loop_1217
	movrne	%i4,	0x13F,	%i3
	fmovsle	%icc,	%f18,	%f12
	movcs	%xcc,	%o6,	%o7
loop_1217:
	xor	%l6,	%g3,	%l0
	fmovs	%f26,	%f18
	edge8ln	%g2,	%o2,	%i7
	ldub	[%l7 + 0x09],	%g4
	movn	%xcc,	%o4,	%i2
	fmovrsne	%l1,	%f13,	%f30
	subccc	%g7,	%o1,	%i5
	movgu	%xcc,	%o3,	%g1
	wr	%g0,	0x81,	%asi
	stba	%g5,	[%l7 + 0x4A] %asi
	call	loop_1218
	fbge	%fcc2,	loop_1219
	edge32n	%l4,	%g6,	%i0
	bge,a,pn	%icc,	loop_1220
loop_1218:
	tvs	%icc,	0x6
loop_1219:
	udivcc	%i6,	0x1A17,	%l3
	array8	%l2,	%l5,	%i1
loop_1220:
	mulscc	%o5,	0x1A43,	%i4
	fbl	%fcc2,	loop_1221
	subc	%i3,	0x0A51,	%o6
	wr	%g0,	0x81,	%asi
	sta	%f19,	[%l7 + 0x44] %asi
loop_1221:
	fmovscc	%icc,	%f28,	%f15
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x28] %asi,	%o0
	ldd	[%l7 + 0x48],	%f2
	edge32n	%o7,	%l6,	%g3
	ta	%icc,	0x1
	movvs	%icc,	%g2,	%l0
	fbug	%fcc1,	loop_1222
	tcc	%icc,	0x2
	tsubcctv	%i7,	0x0233,	%g4
	tvs	%icc,	0x6
loop_1222:
	nop
	set	0x40, %l0
	stda	%o2,	[%l7 + %l0] 0x0c
	ta	%xcc,	0x6
	addcc	%i2,	0x0A43,	%l1
	and	%o4,	0x0E73,	%o1
	fabsd	%f4,	%f18
	set	0x18, %i5
	stxa	%i5,	[%l7 + %i5] 0x04
	fpadd32s	%f4,	%f26,	%f2
	movvc	%icc,	%o3,	%g1
	subc	%g7,	0x1265,	%g5
	tneg	%icc,	0x1
	sllx	%g6,	%i0,	%l4
	sdivx	%i6,	0x0829,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_1223,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srlx	%l5,	0x19,	%i1
	edge8n	%l2,	%i4,	%i3
	orn	%o5,	0x1D82,	%o6
loop_1223:
	fcmpne32	%f2,	%f6,	%o0
	tcs	%icc,	0x0
	bvc,a	%icc,	loop_1224
	sub	%o7,	0x1955,	%l6
	xnorcc	%g2,	%g3,	%l0
	fmovrde	%g4,	%f8,	%f0
loop_1224:
	movleu	%xcc,	%i7,	%o2
	ldd	[%l7 + 0x20],	%f14
	edge16l	%l1,	%o4,	%o1
	sdiv	%i2,	0x1486,	%i5
	stbar
	bne,a	%icc,	loop_1225
	sethi	0x1654,	%g1
	tneg	%xcc,	0x4
	tg	%xcc,	0x6
loop_1225:
	umul	%g7,	%g5,	%g6
	addcc	%o3,	0x1D3C,	%l4
	wr	%g0,	0x04,	%asi
	sta	%f22,	[%l7 + 0x40] %asi
	srlx	%i0,	0x0B,	%i6
	udiv	%l5,	0x0EEA,	%l3
	fbuge	%fcc3,	loop_1226
	fmul8x16	%f15,	%f6,	%f8
	fbul,a	%fcc1,	loop_1227
	udivcc	%l2,	0x0903,	%i4
loop_1226:
	udiv	%i1,	0x08EA,	%i3
	ldstub	[%l7 + 0x0C],	%o5
loop_1227:
	tne	%icc,	0x5
	fcmpgt32	%f16,	%f6,	%o6
	smul	%o0,	0x02EA,	%o7
	brgez	%g2,	loop_1228
	bcs,pn	%xcc,	loop_1229
	fmovspos	%icc,	%f8,	%f28
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_1228:
	fbul	%fcc3,	loop_1230
loop_1229:
	fmovsg	%icc,	%f5,	%f18
	addccc	%g3,	%l0,	%g4
	sethi	0x1B88,	%i7
loop_1230:
	movg	%xcc,	%o2,	%l6
	movcs	%xcc,	%l1,	%o1
	tl	%icc,	0x0
	sir	0x043E
	fmovdleu	%xcc,	%f25,	%f28
	movvs	%icc,	%i2,	%o4
	wr	%g0,	0xe3,	%asi
	stha	%i5,	[%l7 + 0x74] %asi
	membar	#Sync
	move	%icc,	%g7,	%g1
	array8	%g6,	%g5,	%l4
	array16	%o3,	%i6,	%l5
	xnor	%i0,	%l3,	%l2
	ldsw	[%l7 + 0x2C],	%i4
	faligndata	%f16,	%f18,	%f2
	tleu	%xcc,	0x0
	mulx	%i1,	0x0493,	%i3
	movleu	%xcc,	%o5,	%o0
	brlz,a	%o7,	loop_1231
	nop
	setx	loop_1232,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tneg	%xcc,	0x1
	xor	%g2,	0x1D75,	%o6
loop_1231:
	fmul8x16	%f19,	%f26,	%f24
loop_1232:
	xor	%g3,	0x0AFD,	%l0
	stb	%g4,	[%l7 + 0x72]
	and	%i7,	0x1E2E,	%o2
	movre	%l6,	%o1,	%i2
	movneg	%xcc,	%l1,	%i5
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x1e,	%f16
	tg	%icc,	0x2
	fpadd16s	%f26,	%f13,	%f26
	ldx	[%l7 + 0x10],	%g7
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x68] %asi,	%g1
	tvc	%icc,	0x3
	edge8ln	%g6,	%o4,	%g5
	fmuld8ulx16	%f0,	%f23,	%f24
	fbuge	%fcc3,	loop_1233
	fpsub16	%f4,	%f2,	%f20
	edge8n	%o3,	%l4,	%i6
	movrgez	%l5,	%l3,	%l2
loop_1233:
	fnands	%f16,	%f6,	%f22
	edge16n	%i0,	%i1,	%i3
	fmovdcc	%xcc,	%f13,	%f9
	std	%f18,	[%l7 + 0x50]
	sdivx	%i4,	0x0C73,	%o5
	sdiv	%o0,	0x0E61,	%g2
	andncc	%o6,	%o7,	%l0
	add	%g3,	0x184D,	%i7
	movcc	%xcc,	%g4,	%l6
	subc	%o1,	%i2,	%o2
	fmovrslez	%l1,	%f19,	%f4
	mulscc	%g7,	0x0E76,	%i5
	mova	%icc,	%g6,	%o4
	tcs	%icc,	0x6
	movne	%icc,	%g5,	%g1
	movre	%o3,	%l4,	%l5
	tn	%xcc,	0x1
	sub	%l3,	%i6,	%i0
	brz,a	%i1,	loop_1234
	xnor	%i3,	0x007F,	%l2
	fmuld8sux16	%f14,	%f30,	%f16
	movge	%xcc,	%i4,	%o0
loop_1234:
	fcmpne32	%f12,	%f22,	%g2
	sethi	0x1E28,	%o5
	andcc	%o7,	%l0,	%g3
	ldx	[%l7 + 0x48],	%o6
	movrne	%g4,	%i7,	%o1
	smul	%l6,	%i2,	%l1
	smulcc	%o2,	%i5,	%g7
	movneg	%icc,	%g6,	%o4
	xor	%g5,	%g1,	%o3
	nop
	set	0x11, %i7
	stb	%l4,	[%l7 + %i7]
	fandnot2	%f18,	%f16,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f23,	%f4,	%f28
	fabsd	%f10,	%f20
	movpos	%xcc,	%l3,	%l5
	faligndata	%f4,	%f18,	%f18
	tcs	%icc,	0x0
	mulscc	%i0,	%i1,	%i3
	fnors	%f24,	%f24,	%f29
	wr	%g0,	0x88,	%asi
	stwa	%i6,	[%l7 + 0x74] %asi
	andn	%i4,	0x1C1A,	%l2
	fbe	%fcc3,	loop_1235
	fble	%fcc0,	loop_1236
	edge16l	%o0,	%g2,	%o5
	fmovdneg	%xcc,	%f17,	%f28
loop_1235:
	ldd	[%l7 + 0x58],	%o6
loop_1236:
	movcc	%icc,	%l0,	%o6
	movg	%xcc,	%g3,	%i7
	orncc	%g4,	0x07C1,	%l6
	fbn	%fcc2,	loop_1237
	udivx	%i2,	0x0DEB,	%o1
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
loop_1237:
	move	%icc,	%l1,	%g7
	fcmpes	%fcc2,	%f12,	%f25
	tl	%xcc,	0x7
	movl	%icc,	%g6,	%o4
	xorcc	%g5,	%i5,	%o3
	bg,a	loop_1238
	tle	%icc,	0x4
	movle	%icc,	%l4,	%l3
	fbue,a	%fcc3,	loop_1239
loop_1238:
	fandnot1s	%f2,	%f12,	%f25
	fpadd16s	%f14,	%f23,	%f25
	tge	%icc,	0x3
loop_1239:
	fmovsleu	%icc,	%f15,	%f31
	movrlez	%l5,	0x1C7,	%g1
	fbo,a	%fcc0,	loop_1240
	nop
	setx	loop_1241,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlez,a	%i0,	loop_1242
	add	%i3,	0x1139,	%i1
loop_1240:
	fbn,a	%fcc0,	loop_1243
loop_1241:
	alignaddrl	%i4,	%i6,	%l2
loop_1242:
	subccc	%o0,	0x1D77,	%g2
	move	%icc,	%o7,	%l0
loop_1243:
	sra	%o5,	0x12,	%o6
	alignaddr	%g3,	%i7,	%g4
	edge32ln	%l6,	%o1,	%o2
	tgu	%xcc,	0x4
	fpack16	%f0,	%f16
	tsubcc	%l1,	%i2,	%g7
	fpsub32	%f0,	%f10,	%f22
	edge8	%o4,	%g6,	%i5
	fexpand	%f22,	%f10
	tsubcctv	%o3,	%l4,	%g5
	udivx	%l5,	0x1D5C,	%g1
	srl	%i0,	0x03,	%i3
	add	%i1,	%i4,	%l3
	fsrc1	%f18,	%f4
	fmovscs	%xcc,	%f19,	%f23
	fxnors	%f12,	%f23,	%f11
	umul	%l2,	%i6,	%g2
	stb	%o0,	[%l7 + 0x76]
	umul	%l0,	%o7,	%o6
	fmovscs	%xcc,	%f11,	%f3
	srax	%g3,	0x1E,	%i7
	stbar
	fone	%f28
	orn	%o5,	%g4,	%l6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x72] %asi,	%o2
	fcmpd	%fcc1,	%f30,	%f24
	fpackfix	%f0,	%f17
	fbn,a	%fcc1,	loop_1244
	sll	%o1,	0x12,	%i2
	fbne	%fcc1,	loop_1245
	movre	%g7,	%o4,	%g6
loop_1244:
	tle	%icc,	0x2
	edge8l	%i5,	%o3,	%l1
loop_1245:
	smulcc	%g5,	0x11A8,	%l4
	alignaddrl	%g1,	%i0,	%i3
	bl,a	loop_1246
	movcs	%xcc,	%l5,	%i4
	fba	%fcc2,	loop_1247
	umul	%l3,	%l2,	%i6
loop_1246:
	fbug	%fcc3,	loop_1248
	tvc	%xcc,	0x5
loop_1247:
	fcmped	%fcc3,	%f4,	%f20
	tcs	%xcc,	0x0
loop_1248:
	fzero	%f6
	movgu	%xcc,	%g2,	%i1
	mulscc	%o0,	0x041B,	%o7
	bshuffle	%f14,	%f14,	%f16
	fmul8sux16	%f22,	%f18,	%f8
	fpackfix	%f12,	%f6
	array16	%l0,	%o6,	%g3
	brz	%i7,	loop_1249
	fblg	%fcc0,	loop_1250
	fnot2	%f16,	%f18
	alignaddrl	%g4,	%l6,	%o2
loop_1249:
	popc	%o5,	%o1
loop_1250:
	smulcc	%i2,	0x0211,	%g7
	taddcc	%g6,	0x03E9,	%i5
	tneg	%xcc,	0x4
	bvc,a,pn	%xcc,	loop_1251
	sra	%o3,	0x09,	%o4
	fmovs	%f30,	%f28
	fbul,a	%fcc1,	loop_1252
loop_1251:
	fmovsvs	%icc,	%f13,	%f22
	movrne	%l1,	%l4,	%g1
	membar	0x21
loop_1252:
	fexpand	%f12,	%f0
	sth	%i0,	[%l7 + 0x2A]
	fbe,a	%fcc0,	loop_1253
	tne	%icc,	0x1
	sdivcc	%g5,	0x0110,	%l5
	set	0x68, %o2
	swapa	[%l7 + %o2] 0x19,	%i3
loop_1253:
	movrgez	%l3,	%l2,	%i6
	fbl	%fcc2,	loop_1254
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f28,	%f24
	fbul	%fcc0,	loop_1255
loop_1254:
	sll	%g2,	0x19,	%i4
	xnorcc	%o0,	0x1AD6,	%o7
	membar	0x5D
loop_1255:
	andn	%i1,	%l0,	%o6
	fmovdg	%icc,	%f0,	%f19
	popc	0x0FF8,	%g3
	movg	%icc,	%g4,	%l6
	fbg	%fcc0,	loop_1256
	edge32l	%i7,	%o2,	%o1
	tle	%xcc,	0x6
	bne,a,pt	%icc,	loop_1257
loop_1256:
	tcc	%icc,	0x0
	fbul	%fcc2,	loop_1258
	fmuld8sux16	%f10,	%f10,	%f26
loop_1257:
	movle	%xcc,	%i2,	%g7
	tsubcc	%o5,	%i5,	%g6
loop_1258:
	movvc	%icc,	%o3,	%o4
	fmovdgu	%icc,	%f17,	%f6
	smulcc	%l4,	%l1,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x20,	%asi
	stxa	%g5,	[%g0 + 0x10] %asi
	edge16l	%i0,	%l5,	%i3
	fmovsg	%xcc,	%f18,	%f4
	set	0x48, %o4
	prefetcha	[%l7 + %o4] 0x04,	 0x0
	mova	%icc,	%l2,	%i6
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x16] %asi,	%g2
	edge16n	%i4,	%o7,	%o0
	mulx	%i1,	%o6,	%l0
	tvs	%xcc,	0x6
	addc	%g3,	0x1555,	%g4
	edge8l	%i7,	%o2,	%o1
	set	0x7C, %i1
	stha	%i2,	[%l7 + %i1] 0x0c
	fmovdle	%icc,	%f4,	%f4
	flush	%l7 + 0x4C
	and	%g7,	0x01C0,	%l6
	movneg	%icc,	%i5,	%g6
	add	%o3,	0x1247,	%o4
	fmul8ulx16	%f4,	%f10,	%f8
	fcmpne16	%f22,	%f22,	%o5
	and	%l4,	%l1,	%g1
	fba,a	%fcc0,	loop_1259
	ldsb	[%l7 + 0x1D],	%i0
	orcc	%l5,	0x1DC5,	%i3
	movl	%xcc,	%g5,	%l3
loop_1259:
	std	%l2,	[%l7 + 0x10]
	movcc	%xcc,	%g2,	%i6
	tn	%xcc,	0x5
	add	%i4,	%o7,	%o0
	udivcc	%i1,	0x05DD,	%l0
	fnot2	%f24,	%f4
	be,pn	%icc,	loop_1260
	fnands	%f12,	%f29,	%f22
	fmovsa	%xcc,	%f5,	%f24
	edge8n	%g3,	%o6,	%i7
loop_1260:
	tl	%xcc,	0x1
	and	%g4,	0x1B82,	%o2
	nop
	set	0x0E, %l2
	ldstub	[%l7 + %l2],	%i2
	andcc	%o1,	%g7,	%i5
	fblg	%fcc1,	loop_1261
	ba,pn	%xcc,	loop_1262
	nop
	setx loop_1263, %l0, %l1
	jmpl %l1, %g6
	mulx	%o3,	0x0AF4,	%o4
loop_1261:
	udivx	%l6,	0x0D88,	%l4
loop_1262:
	nop
	set	0x38, %o1
	lda	[%l7 + %o1] 0x80,	%f26
loop_1263:
	fmovd	%f6,	%f4
	movrgz	%o5,	%g1,	%l1
	tpos	%icc,	0x3
	movn	%xcc,	%i0,	%i3
	ldsw	[%l7 + 0x44],	%g5
	or	%l5,	0x029E,	%l3
	movrlz	%g2,	%i6,	%l2
	lduw	[%l7 + 0x50],	%o7
	fmovsleu	%icc,	%f2,	%f0
	orn	%o0,	0x13BF,	%i1
	mova	%xcc,	%i4,	%g3
	move	%xcc,	%o6,	%i7
	wr	%g0,	0x21,	%asi
	stxa	%l0,	[%g0 + 0x110] %asi
	subc	%g4,	0x1B9D,	%i2
	fbue	%fcc0,	loop_1264
	edge8n	%o2,	%g7,	%o1
	fpadd32s	%f19,	%f22,	%f26
	xor	%g6,	0x0ACD,	%o3
loop_1264:
	smul	%i5,	%l6,	%l4
	movvc	%xcc,	%o5,	%g1
	xorcc	%o4,	%l1,	%i0
	tgu	%xcc,	0x4
	movle	%xcc,	%g5,	%i3
	fmovdcs	%xcc,	%f2,	%f24
	fpadd32	%f30,	%f16,	%f0
	fmovdg	%icc,	%f9,	%f4
	sra	%l3,	0x03,	%g2
	set	0x44, %g6
	stha	%i6,	[%l7 + %g6] 0x2f
	membar	#Sync
	move	%icc,	%l5,	%l2
	movn	%icc,	%o7,	%o0
	lduh	[%l7 + 0x20],	%i1
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i4,	%o6
	sethi	0x0CE3,	%i7
	fmovrslez	%l0,	%f27,	%f31
	tleu	%xcc,	0x4
	bvs	%icc,	loop_1265
	subccc	%g3,	%g4,	%o2
	fmovsgu	%icc,	%f7,	%f11
	tleu	%icc,	0x1
loop_1265:
	fsrc2	%f24,	%f10
	brgz	%i2,	loop_1266
	addcc	%g7,	0x18F1,	%o1
	subcc	%o3,	0x0C25,	%g6
	fmovde	%xcc,	%f30,	%f5
loop_1266:
	fxnors	%f23,	%f20,	%f10
	tcc	%icc,	0x5
	flush	%l7 + 0x74
	stbar
	andncc	%i5,	%l4,	%o5
	ldstub	[%l7 + 0x58],	%g1
	mulx	%l6,	%o4,	%i0
	orncc	%g5,	0x168A,	%i3
	udivcc	%l3,	0x1116,	%g2
	set	0x18, %g4
	stxa	%i6,	[%l7 + %g4] 0x81
	movl	%icc,	%l5,	%l2
	udivcc	%l1,	0x17A5,	%o7
	taddcctv	%i1,	%i4,	%o6
	movn	%xcc,	%i7,	%l0
	fbuge	%fcc3,	loop_1267
	movvs	%xcc,	%g3,	%g4
	alignaddrl	%o0,	%i2,	%o2
	mova	%xcc,	%o1,	%g7
loop_1267:
	sllx	%g6,	0x07,	%o3
	movl	%xcc,	%l4,	%i5
	xnor	%g1,	%l6,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o4,	%i0,	%i3
	ldsh	[%l7 + 0x32],	%l3
	and	%g5,	0x1CE5,	%g2
	edge32n	%i6,	%l2,	%l5
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f2
	orcc	%l1,	%i1,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i4,	0x0BB3,	%o6
	umul	%i7,	0x1EE9,	%l0
	fxnor	%f30,	%f10,	%f4
	fandnot2s	%f12,	%f22,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f20,	%f26
	set	0x6E, %l3
	ldstuba	[%l7 + %l3] 0x80,	%g3
	fbue	%fcc3,	loop_1268
	fsrc2	%f6,	%f26
	edge16	%g4,	%i2,	%o2
	addccc	%o0,	0x077B,	%g7
loop_1268:
	tn	%xcc,	0x3
	fnegd	%f30,	%f12
	srl	%o1,	%o3,	%g6
	fmovsneg	%icc,	%f2,	%f10
	fxnors	%f19,	%f28,	%f10
	sdiv	%l4,	0x0364,	%i5
	andncc	%l6,	%o5,	%o4
	fpadd32s	%f31,	%f2,	%f20
	addcc	%g1,	%i3,	%i0
	smulcc	%g5,	%g2,	%i6
	movrne	%l3,	%l2,	%l1
	movne	%icc,	%i1,	%l5
	fsrc2s	%f9,	%f19
	movcs	%icc,	%i4,	%o6
	wr	%g0,	0x80,	%asi
	stha	%o7,	[%l7 + 0x52] %asi
	movgu	%xcc,	%i7,	%l0
	fbule,a	%fcc0,	loop_1269
	movrgez	%g4,	%g3,	%o2
	sdiv	%i2,	0x14AE,	%g7
	fmul8ulx16	%f26,	%f6,	%f2
loop_1269:
	tpos	%xcc,	0x1
	fbue,a	%fcc2,	loop_1270
	tgu	%xcc,	0x0
	edge16l	%o0,	%o1,	%o3
	fbe,a	%fcc0,	loop_1271
loop_1270:
	alignaddrl	%g6,	%i5,	%l6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
loop_1271:
	fcmpgt32	%f22,	%f6,	%o5
	fcmpne32	%f8,	%f22,	%g1
	movgu	%icc,	%o4,	%i3
	set	0x28, %l6
	stha	%g5,	[%l7 + %l6] 0x89
	mulscc	%g2,	0x0375,	%i6
	tcc	%icc,	0x2
	movvc	%xcc,	%l3,	%l2
	bl,a	%xcc,	loop_1272
	fbue,a	%fcc0,	loop_1273
	tn	%icc,	0x2
	mulx	%l1,	%i1,	%l5
loop_1272:
	mova	%icc,	%i0,	%o6
loop_1273:
	andn	%i4,	%i7,	%l0
	andncc	%o7,	%g3,	%o2
	or	%i2,	%g4,	%o0
	fmovdg	%xcc,	%f2,	%f8
	bleu	%icc,	loop_1274
	sdivx	%g7,	0x0DF7,	%o3
	movvs	%xcc,	%g6,	%o1
	tcc	%xcc,	0x2
loop_1274:
	tneg	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f17,	%f14,	%f30
	swap	[%l7 + 0x54],	%l6
	srlx	%i5,	%l4,	%g1
	bneg	loop_1275
	movrne	%o5,	%i3,	%o4
	fmovsvs	%icc,	%f8,	%f18
	fmovrde	%g2,	%f6,	%f8
loop_1275:
	bcc,a,pn	%xcc,	loop_1276
	fxnors	%f18,	%f29,	%f30
	st	%f5,	[%l7 + 0x3C]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1276:
	bvc	loop_1277
	pdist	%f4,	%f18,	%f22
	srl	%i6,	0x1A,	%g5
	edge32l	%l2,	%l1,	%i1
loop_1277:
	sdivx	%l5,	0x0A9D,	%l3
	fxnors	%f18,	%f22,	%f28
	fxnor	%f22,	%f26,	%f10
	fbn,a	%fcc0,	loop_1278
	udivcc	%i0,	0x12A1,	%i4
	fmovd	%f14,	%f6
	movrgz	%i7,	0x035,	%l0
loop_1278:
	tvc	%icc,	0x7
	fxors	%f19,	%f22,	%f20
	fmovrde	%o6,	%f8,	%f12
	sethi	0x0A41,	%g3
	bneg,a	loop_1279
	smulcc	%o7,	0x07E3,	%o2
	umulcc	%i2,	%g4,	%g7
	fsrc1s	%f13,	%f5
loop_1279:
	or	%o3,	0x0E9B,	%o0
	umul	%o1,	%g6,	%i5
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	udivx	%l6,	0x06EA,	%l4
	edge8l	%g1,	%o5,	%i3
	edge8n	%g2,	%i6,	%o4
	xnor	%g5,	%l1,	%i1
	xor	%l2,	%l5,	%l3
	movrgz	%i4,	0x217,	%i7
	edge16ln	%i0,	%l0,	%g3
	fbue	%fcc3,	loop_1280
	fandnot1s	%f31,	%f11,	%f30
	fsrc2	%f28,	%f26
	fnegd	%f8,	%f12
loop_1280:
	ble,a	%icc,	loop_1281
	tge	%icc,	0x6
	fble	%fcc2,	loop_1282
	lduh	[%l7 + 0x36],	%o6
loop_1281:
	faligndata	%f18,	%f30,	%f26
	wr	%g0,	0x80,	%asi
	stha	%o7,	[%l7 + 0x60] %asi
loop_1282:
	nop
	set	0x3D, %i3
	ldstuba	[%l7 + %i3] 0x89,	%i2
	orn	%g4,	%o2,	%o3
	siam	0x4
	orcc	%o0,	%g7,	%o1
	mova	%icc,	%g6,	%i5
	fmovdcs	%xcc,	%f1,	%f19
	tsubcc	%l6,	%g1,	%o5
	sll	%l4,	0x03,	%g2
	fmovrslz	%i6,	%f12,	%f4
	wr	%g0,	0x88,	%asi
	stxa	%i3,	[%l7 + 0x70] %asi
	brnz,a	%o4,	loop_1283
	fcmple16	%f10,	%f30,	%g5
	movcc	%xcc,	%i1,	%l1
	bneg	loop_1284
loop_1283:
	ldstub	[%l7 + 0x77],	%l2
	subccc	%l5,	0x0183,	%l3
	ldsw	[%l7 + 0x58],	%i7
loop_1284:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
	addccc	%l0,	0x1DDC,	%g3
	xnor	%o6,	%o7,	%i2
	fbge	%fcc2,	loop_1285
	fbge	%fcc2,	loop_1286
	membar	0x04
	andncc	%i4,	%g4,	%o2
loop_1285:
	edge16l	%o3,	%o0,	%o1
loop_1286:
	bshuffle	%f12,	%f12,	%f0
	sllx	%g7,	%g6,	%i5
	nop
	setx	loop_1287,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%g1,	%o5,	%l6
	pdist	%f4,	%f26,	%f2
	movn	%icc,	%l4,	%g2
loop_1287:
	fbule	%fcc2,	loop_1288
	fmul8x16au	%f26,	%f10,	%f8
	fcmped	%fcc0,	%f28,	%f4
	edge16ln	%i3,	%o4,	%g5
loop_1288:
	edge32	%i6,	%i1,	%l2
	subccc	%l1,	0x19B4,	%l3
	set	0x30, %i0
	stda	%i6,	[%l7 + %i0] 0x18
	tle	%xcc,	0x6
	fcmpes	%fcc2,	%f8,	%f29
	movvc	%icc,	%l5,	%l0
	array16	%i0,	%g3,	%o6
	movrgez	%o7,	0x341,	%i2
	andncc	%g4,	%o2,	%o3
	and	%i4,	%o1,	%o0
	tneg	%xcc,	0x2
	tsubcctv	%g6,	0x037B,	%g7
	subccc	%g1,	%i5,	%l6
	fandnot1	%f30,	%f12,	%f22
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%l4
	fnot2	%f14,	%f6
	movrne	%g2,	%i3,	%o5
	edge16l	%g5,	%i6,	%o4
	nop
	setx loop_1289, %l0, %l1
	jmpl %l1, %l2
	fbn,a	%fcc1,	loop_1290
	add	%l1,	%i1,	%l3
	fxor	%f16,	%f6,	%f12
loop_1289:
	sllx	%l5,	%i7,	%i0
loop_1290:
	orn	%l0,	%o6,	%o7
	edge16ln	%g3,	%g4,	%o2
	ldsh	[%l7 + 0x30],	%i2
	srax	%i4,	%o3,	%o1
	fbl,a	%fcc3,	loop_1291
	membar	0x59
	sllx	%o0,	0x16,	%g6
	edge32	%g1,	%i5,	%l6
loop_1291:
	brlez	%g7,	loop_1292
	siam	0x1
	add	%g2,	%l4,	%o5
	sllx	%i3,	0x13,	%i6
loop_1292:
	fmovdvc	%xcc,	%f20,	%f9
	sub	%o4,	%l2,	%g5
	addcc	%l1,	%l3,	%i1
	tne	%xcc,	0x2
	srlx	%l5,	0x1A,	%i0
	set	0x58, %o7
	stda	%l0,	[%l7 + %o7] 0x11
	tneg	%icc,	0x4
	fmuld8ulx16	%f25,	%f10,	%f2
	fbn,a	%fcc3,	loop_1293
	tvc	%xcc,	0x6
	fpadd16	%f26,	%f4,	%f30
	brlez,a	%i7,	loop_1294
loop_1293:
	ldsh	[%l7 + 0x2E],	%o7
	fxnors	%f10,	%f6,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1294:
	orn	%o6,	0x1372,	%g4
	movrlez	%g3,	0x0DE,	%i2
	tgu	%xcc,	0x2
	movge	%xcc,	%o2,	%i4
	edge8ln	%o1,	%o0,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%g1,	%f10,	%f26
	set	0x58, %g3
	stda	%o2,	[%l7 + %g3] 0x2b
	membar	#Sync
	movg	%xcc,	%i5,	%g7
	fmovs	%f22,	%f23
	xnor	%l6,	0x1BB3,	%g2
	taddcctv	%l4,	0x1D82,	%o5
	xnor	%i6,	%i3,	%l2
	fmovsvc	%icc,	%f22,	%f31
	set	0x60, %o5
	lduwa	[%l7 + %o5] 0x15,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f4,	%f10
	fbn,a	%fcc1,	loop_1295
	srl	%o4,	0x0B,	%l3
	mulx	%i1,	%l1,	%l5
	udivx	%i0,	0x1E2A,	%l0
loop_1295:
	movgu	%icc,	%o7,	%i7
	fmovde	%xcc,	%f21,	%f19
	tcs	%xcc,	0x3
	fand	%f0,	%f24,	%f0
	sllx	%g4,	%g3,	%i2
	std	%o6,	[%l7 + 0x78]
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x17] %asi,	%o2
	fmovdge	%xcc,	%f21,	%f1
	taddcc	%o1,	0x1DB8,	%o0
	srax	%i4,	%g6,	%g1
	fmovsvc	%xcc,	%f11,	%f20
	edge32	%i5,	%o3,	%l6
	edge16n	%g2,	%l4,	%g7
	movvc	%icc,	%i6,	%i3
	movvs	%xcc,	%l2,	%g5
	or	%o4,	0x157E,	%l3
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x18,	%i1,	%o5
	xnorcc	%l1,	%i0,	%l0
	tn	%icc,	0x3
	fbn	%fcc3,	loop_1296
	mulx	%l5,	%o7,	%g4
	set	0x60, %g2
	stwa	%g3,	[%l7 + %g2] 0xe2
	membar	#Sync
loop_1296:
	ldd	[%l7 + 0x58],	%i6
	mulscc	%i2,	%o6,	%o1
	subc	%o0,	0x0818,	%i4
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x60] %asi,	%g6
	tneg	%icc,	0x2
	edge16ln	%o2,	%g1,	%i5
	alignaddr	%l6,	%o3,	%g2
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x44] %asi,	%l4
	ldd	[%l7 + 0x08],	%g6
	bg,pt	%icc,	loop_1297
	fnands	%f13,	%f9,	%f26
	tne	%icc,	0x5
	udiv	%i6,	0x1958,	%i3
loop_1297:
	movpos	%icc,	%l2,	%o4
	fmovsn	%xcc,	%f25,	%f3
	tpos	%icc,	0x7
	move	%xcc,	%g5,	%l3
	tle	%xcc,	0x5
	bleu,a,pn	%xcc,	loop_1298
	sllx	%i1,	%o5,	%i0
	andncc	%l1,	%l5,	%l0
	stb	%g4,	[%l7 + 0x4A]
loop_1298:
	nop
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf8
	membar	#Sync
	fmovrsgez	%o7,	%f0,	%f22
	membar	0x4B
	bleu	loop_1299
	fmovsge	%icc,	%f2,	%f6
	ldsh	[%l7 + 0x78],	%i7
	mova	%icc,	%i2,	%o6
loop_1299:
	or	%g3,	0x07A8,	%o0
	tcs	%icc,	0x2
	fnors	%f0,	%f18,	%f19
	fcmped	%fcc1,	%f4,	%f20
	bneg,a,pn	%icc,	loop_1300
	tvc	%icc,	0x4
	fsrc2	%f26,	%f4
	sethi	0x1B78,	%i4
loop_1300:
	fmul8sux16	%f16,	%f20,	%f30
	fbge,a	%fcc0,	loop_1301
	brgez	%o1,	loop_1302
	fsrc2s	%f11,	%f2
	movrgez	%o2,	%g1,	%g6
loop_1301:
	fmovscs	%xcc,	%f5,	%f8
loop_1302:
	sub	%i5,	0x0565,	%o3
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x60] %asi,	%i6
	set	0x20, %o3
	swapa	[%l7 + %o3] 0x89,	%g2
	tcs	%xcc,	0x2
	movl	%xcc,	%g7,	%l4
	siam	0x7
	sethi	0x0A84,	%i6
	array16	%l2,	%o4,	%g5
	fcmpes	%fcc0,	%f0,	%f19
	orcc	%i3,	0x1AD6,	%l3
	fbue,a	%fcc0,	loop_1303
	udivx	%i1,	0x00B3,	%i0
	fmovdn	%icc,	%f31,	%f22
	fbge	%fcc1,	loop_1304
loop_1303:
	movpos	%xcc,	%l1,	%o5
	movleu	%icc,	%l0,	%g4
	tsubcc	%o7,	0x0031,	%l5
loop_1304:
	andn	%i2,	%i7,	%g3
	edge32n	%o0,	%i4,	%o1
	fmovdn	%icc,	%f28,	%f31
	fcmpd	%fcc1,	%f8,	%f10
	sethi	0x1C30,	%o6
	orn	%o2,	%g6,	%i5
	edge8n	%g1,	%l6,	%o3
	fmovscs	%icc,	%f12,	%f31
	move	%xcc,	%g2,	%g7
	fmovsa	%xcc,	%f28,	%f3
	movcc	%icc,	%l4,	%l2
	sethi	0x1701,	%o4
	bne,a	loop_1305
	tge	%icc,	0x2
	movn	%xcc,	%i6,	%i3
	set	0x74, %g1
	lduwa	[%l7 + %g1] 0x11,	%l3
loop_1305:
	addc	%g5,	%i0,	%l1
	xnorcc	%i1,	0x15EF,	%l0
	tle	%xcc,	0x3
	nop
	setx	loop_1306,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%xcc,	0x6
	bvs,a	%icc,	loop_1307
	alignaddr	%o5,	%o7,	%g4
loop_1306:
	alignaddrl	%l5,	%i2,	%g3
	tneg	%icc,	0x2
loop_1307:
	or	%i7,	0x0AA4,	%i4
	fmovsneg	%icc,	%f25,	%f10
	movvc	%xcc,	%o0,	%o1
	addccc	%o6,	%o2,	%g6
	brgez,a	%g1,	loop_1308
	smul	%i5,	0x19BD,	%l6
	fpack16	%f30,	%f2
	subc	%g2,	%o3,	%l4
loop_1308:
	fpsub32	%f26,	%f0,	%f6
	fpack32	%f18,	%f24,	%f10
	orncc	%l2,	%o4,	%g7
	fsrc2	%f30,	%f22
	edge16ln	%i6,	%l3,	%g5
	bgu,a	loop_1309
	movg	%xcc,	%i3,	%i0
	fbg,a	%fcc2,	loop_1310
	fabss	%f18,	%f18
loop_1309:
	array8	%i1,	%l0,	%l1
	brz,a	%o5,	loop_1311
loop_1310:
	ldsw	[%l7 + 0x2C],	%o7
	popc	0x1007,	%l5
	addc	%i2,	%g3,	%g4
loop_1311:
	nop
	set	0x78, %o6
	ldxa	[%l7 + %o6] 0x14,	%i4
	membar	0x02
	edge16	%i7,	%o1,	%o0
	fmul8ulx16	%f4,	%f14,	%f14
	sra	%o2,	0x13,	%o6
	array8	%g1,	%i5,	%l6
	fands	%f4,	%f24,	%f16
	edge32n	%g6,	%g2,	%o3
	udiv	%l2,	0x11A4,	%l4
	stw	%g7,	[%l7 + 0x68]
	subcc	%i6,	%o4,	%l3
	fbue,a	%fcc2,	loop_1312
	movrgz	%g5,	%i0,	%i1
	fcmpgt16	%f30,	%f30,	%i3
	te	%xcc,	0x5
loop_1312:
	sdivcc	%l0,	0x0EA8,	%o5
	fmovrslz	%o7,	%f22,	%f13
	prefetch	[%l7 + 0x08],	 0x2
	umulcc	%l5,	0x1FDB,	%i2
	edge8	%l1,	%g3,	%g4
	fmovsg	%xcc,	%f30,	%f1
	orncc	%i4,	0x0C2C,	%o1
	tle	%icc,	0x0
	set	0x34, %i2
	sta	%f23,	[%l7 + %i2] 0x81
	andcc	%i7,	%o2,	%o0
	nop
	setx	loop_1313,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%g1,	%i5,	%o6
	andcc	%g6,	%g2,	%l6
	bvs,pt	%xcc,	loop_1314
loop_1313:
	xor	%l2,	0x0853,	%l4
	fmovrdne	%o3,	%f26,	%f2
	fmovdpos	%xcc,	%f7,	%f9
loop_1314:
	mulscc	%i6,	0x12A1,	%o4
	tsubcctv	%l3,	%g5,	%i0
	fcmps	%fcc0,	%f17,	%f31
	tne	%icc,	0x6
	set	0x58, %l4
	ldsba	[%l7 + %l4] 0x19,	%i1
	umul	%g7,	%i3,	%l0
	xnor	%o7,	0x1552,	%l5
	orn	%o5,	%i2,	%g3
	addcc	%g4,	0x0F40,	%i4
	stx	%l1,	[%l7 + 0x60]
	sll	%o1,	%o2,	%i7
	mulx	%g1,	0x1480,	%o0
	tpos	%xcc,	0x4
	movn	%xcc,	%o6,	%g6
	fcmps	%fcc3,	%f0,	%f23
	fmovdvc	%icc,	%f29,	%f28
	movneg	%icc,	%g2,	%i5
	tsubcctv	%l6,	%l4,	%l2
	bn,a	loop_1315
	sir	0x140D
	fmul8x16au	%f2,	%f30,	%f6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x40] %asi,	%f1
loop_1315:
	fmovdne	%xcc,	%f5,	%f29
	edge16ln	%o3,	%o4,	%i6
	brlz	%l3,	loop_1316
	brgz	%i0,	loop_1317
	fandnot2s	%f17,	%f15,	%f2
	fmovdle	%icc,	%f23,	%f7
loop_1316:
	for	%f0,	%f2,	%f18
loop_1317:
	sdivcc	%i1,	0x0D7C,	%g5
	tg	%xcc,	0x1
	fmovdgu	%xcc,	%f28,	%f20
	tgu	%icc,	0x3
	movre	%i3,	0x005,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne,a	%fcc2,	loop_1318
	ldsw	[%l7 + 0x5C],	%l0
	stw	%l5,	[%l7 + 0x34]
	xnorcc	%o7,	%o5,	%g3
loop_1318:
	tne	%icc,	0x7
	fmovdg	%xcc,	%f2,	%f22
	fmovsneg	%xcc,	%f30,	%f27
	fmovdleu	%xcc,	%f15,	%f11
	udivx	%i2,	0x171F,	%g4
	andn	%i4,	%o1,	%o2
	fornot1s	%f23,	%f16,	%f21
	brnz,a	%l1,	loop_1319
	movg	%icc,	%g1,	%o0
	fsrc2	%f16,	%f26
	fcmpes	%fcc3,	%f3,	%f3
loop_1319:
	srax	%o6,	0x0F,	%i7
	edge8n	%g2,	%g6,	%l6
	flush	%l7 + 0x3C
	sethi	0x1230,	%i5
	fxnors	%f17,	%f1,	%f9
	movrne	%l4,	%l2,	%o3
	set	0x08, %l5
	stxa	%i6,	[%l7 + %l5] 0xe3
	membar	#Sync
	bshuffle	%f12,	%f20,	%f30
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	taddcctv	%i0,	%l3,	%i1
	stw	%i3,	[%l7 + 0x70]
	brnz	%g7,	loop_1320
	andcc	%g5,	%l5,	%o7
	alignaddr	%o5,	%g3,	%l0
	srl	%g4,	0x1B,	%i2
loop_1320:
	fmovsn	%xcc,	%f8,	%f9
	fmovdvs	%xcc,	%f12,	%f15
	nop
	setx	loop_1321,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bvc	loop_1322
	move	%icc,	%o1,	%o2
	taddcc	%l1,	0x0657,	%i4
loop_1321:
	fabss	%f18,	%f14
loop_1322:
	addc	%g1,	0x097F,	%o0
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x48] %asi,	%i7
	edge8	%g2,	%g6,	%l6
	srax	%o6,	%i5,	%l2
	fnor	%f20,	%f18,	%f30
	orn	%o3,	0x0B76,	%i6
	tgu	%icc,	0x3
	fbne,a	%fcc1,	loop_1323
	brgz	%l4,	loop_1324
	fmul8x16	%f2,	%f12,	%f30
	set	0x24, %g7
	sta	%f6,	[%l7 + %g7] 0x04
loop_1323:
	tvs	%xcc,	0x4
loop_1324:
	fmovda	%xcc,	%f1,	%f2
	subc	%i0,	0x0FB4,	%o4
	fmovsg	%xcc,	%f5,	%f2
	set	0x14, %i4
	stwa	%i1,	[%l7 + %i4] 0xeb
	membar	#Sync
	sra	%l3,	%g7,	%g5
	fmovsvs	%icc,	%f27,	%f28
	sethi	0x1427,	%l5
	bne,a	loop_1325
	swap	[%l7 + 0x44],	%i3
	subcc	%o7,	0x02D5,	%o5
	be,pt	%xcc,	loop_1326
loop_1325:
	umulcc	%l0,	0x0FBB,	%g3
	add	%g4,	%o1,	%i2
	lduh	[%l7 + 0x3A],	%l1
loop_1326:
	xnor	%o2,	0x0EF4,	%g1
	fandnot1s	%f25,	%f10,	%f19
	bcc,pt	%xcc,	loop_1327
	fmovspos	%xcc,	%f24,	%f16
	bvc,pn	%icc,	loop_1328
	tsubcctv	%i4,	%i7,	%o0
loop_1327:
	fornot1s	%f20,	%f7,	%f3
	addcc	%g2,	%g6,	%o6
loop_1328:
	nop
	set	0x08, %o0
	std	%i6,	[%l7 + %o0]
	wr	%g0,	0xe3,	%asi
	stxa	%i5,	[%l7 + 0x48] %asi
	membar	#Sync
	fbl,a	%fcc2,	loop_1329
	fandnot2	%f2,	%f30,	%f4
	array16	%o3,	%l2,	%i6
	alignaddr	%i0,	%l4,	%i1
loop_1329:
	fmovd	%f26,	%f12
	array16	%l3,	%g7,	%g5
	std	%o4,	[%l7 + 0x28]
	movle	%icc,	%i3,	%l5
	udivcc	%o5,	0x07DC,	%o7
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x54] %asi,	%l0
	fmovsleu	%icc,	%f13,	%f22
	tl	%icc,	0x0
	and	%g3,	0x1FF3,	%o1
	tvc	%icc,	0x6
	srax	%g4,	0x18,	%i2
	sth	%l1,	[%l7 + 0x0C]
	edge8ln	%g1,	%o2,	%i7
	srl	%i4,	%g2,	%o0
	tgu	%xcc,	0x1
	fnor	%f22,	%f30,	%f24
	tl	%icc,	0x4
	xorcc	%g6,	0x014B,	%l6
	fpsub32s	%f21,	%f0,	%f1
	mulscc	%o6,	%i5,	%l2
	sra	%o3,	0x0B,	%i6
	fbul,a	%fcc2,	loop_1330
	ldstub	[%l7 + 0x3D],	%i0
	set	0x70, %l0
	ldda	[%l7 + %l0] 0xea,	%l4
loop_1330:
	taddcctv	%l3,	%g7,	%g5
	edge16	%i1,	%i3,	%l5
	movg	%xcc,	%o4,	%o7
	move	%icc,	%o5,	%g3
	fble	%fcc0,	loop_1331
	movvs	%icc,	%o1,	%g4
	sdivx	%l0,	0x0296,	%i2
	te	%xcc,	0x5
loop_1331:
	fxor	%f14,	%f8,	%f30
	edge8l	%g1,	%o2,	%l1
	orcc	%i4,	0x127D,	%i7
	movrlz	%g2,	0x3E5,	%o0
	movrlez	%g6,	0x09E,	%l6
	sub	%o6,	0x10AD,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x7E
	subc	%i5,	%i6,	%i0
	sll	%o3,	%l3,	%l4
	fmovsge	%icc,	%f19,	%f11
	xor	%g5,	0x17F8,	%g7
	edge16n	%i3,	%i1,	%o4
	stbar
	subccc	%l5,	0x1BB3,	%o5
	fand	%f24,	%f4,	%f0
	for	%f0,	%f12,	%f2
	fbg,a	%fcc1,	loop_1332
	bshuffle	%f2,	%f18,	%f18
	fpsub32	%f16,	%f6,	%f8
	fbue,a	%fcc2,	loop_1333
loop_1332:
	srlx	%o7,	%g3,	%g4
	edge8n	%o1,	%l0,	%g1
	fpsub16	%f22,	%f14,	%f14
loop_1333:
	fornot2	%f20,	%f16,	%f20
	st	%f9,	[%l7 + 0x30]
	bvs,a	loop_1334
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x5
	bg	loop_1335
loop_1334:
	ldstub	[%l7 + 0x42],	%o2
	addcc	%l1,	0x1D3C,	%i2
	popc	%i4,	%i7
loop_1335:
	tpos	%icc,	0x4
	fmovdn	%icc,	%f28,	%f1
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%o0
	edge8n	%g2,	%l6,	%g6
	brz	%l2,	loop_1336
	sub	%o6,	%i6,	%i5
	sll	%o3,	0x0D,	%l3
	ld	[%l7 + 0x44],	%f17
loop_1336:
	fbug	%fcc1,	loop_1337
	movn	%icc,	%i0,	%l4
	membar	0x45
	tsubcc	%g7,	%i3,	%i1
loop_1337:
	movg	%icc,	%g5,	%o4
	bleu,pn	%icc,	loop_1338
	tpos	%icc,	0x7
	subc	%o5,	%l5,	%g3
	sethi	0x1848,	%g4
loop_1338:
	sdiv	%o1,	0x0B39,	%o7
	fpsub32	%f30,	%f18,	%f28
	movre	%l0,	0x2E5,	%g1
	tvs	%icc,	0x6
	wr	%g0,	0x80,	%asi
	stxa	%l1,	[%l7 + 0x38] %asi
	edge32	%o2,	%i2,	%i4
	movl	%xcc,	%o0,	%i7
	tl	%xcc,	0x3
	fcmpgt32	%f22,	%f8,	%l6
	fmovsle	%xcc,	%f25,	%f16
	fmovdl	%xcc,	%f25,	%f31
	tcc	%icc,	0x6
	edge8l	%g6,	%g2,	%o6
	fmovsge	%xcc,	%f10,	%f2
	tn	%xcc,	0x0
	movneg	%xcc,	%l2,	%i5
	stbar
	ble	loop_1339
	nop
	setx loop_1340, %l0, %l1
	jmpl %l1, %o3
	fmul8sux16	%f30,	%f30,	%f14
	nop
	setx	loop_1341,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1339:
	andcc	%i6,	0x15EB,	%i0
loop_1340:
	movcc	%xcc,	%l3,	%l4
	fpsub16	%f10,	%f24,	%f26
loop_1341:
	movleu	%xcc,	%i3,	%g7
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x398] %asi,	%g5 ripped by fixASI40.pl ripped by fixASI40.pl
	bvc,a	%icc,	loop_1342
	nop
	set	0x38, %i5
	stw	%i1,	[%l7 + %i5]
	edge32l	%o4,	%l5,	%g3
	fpsub16	%f24,	%f16,	%f26
loop_1342:
	fmul8x16au	%f31,	%f17,	%f24
	mulx	%o5,	%o1,	%o7
	mulx	%g4,	0x0F9F,	%l0
	te	%icc,	0x7
	orncc	%l1,	%o2,	%i2
	alignaddr	%i4,	%g1,	%o0
	umul	%i7,	0x1E17,	%g6
	fmul8ulx16	%f22,	%f20,	%f26
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tcs	%icc,	0x2
	fandnot1s	%f30,	%f19,	%f11
	fmovsg	%icc,	%f18,	%f19
	fsrc1s	%f13,	%f8
	stb	%l6,	[%l7 + 0x35]
	edge32n	%o6,	%l2,	%i5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8n	%o3,	%i6,	%i0
	ldsh	[%l7 + 0x2A],	%g2
	edge8ln	%l3,	%i3,	%l4
	edge8n	%g5,	%g7,	%i1
	fmovdn	%xcc,	%f3,	%f1
	array32	%l5,	%o4,	%g3
	or	%o5,	0x10B8,	%o7
	taddcc	%g4,	0x1ED0,	%l0
	fmovrde	%o1,	%f14,	%f10
	fcmped	%fcc1,	%f6,	%f8
	fbo,a	%fcc3,	loop_1343
	edge8n	%o2,	%i2,	%l1
	movpos	%icc,	%i4,	%o0
	fpack16	%f22,	%f11
loop_1343:
	st	%f8,	[%l7 + 0x78]
	fsrc2	%f24,	%f4
	fsrc2s	%f18,	%f8
	tn	%xcc,	0x1
	taddcc	%g1,	%g6,	%i7
	bne,pt	%icc,	loop_1344
	sllx	%l6,	%o6,	%i5
	edge32ln	%o3,	%i6,	%l2
	edge32	%i0,	%g2,	%i3
loop_1344:
	fmovdn	%xcc,	%f1,	%f31
	sir	0x167F
	brgz	%l3,	loop_1345
	membar	0x7C
	smul	%g5,	%g7,	%i1
	fmovrdlez	%l4,	%f0,	%f30
loop_1345:
	orcc	%o4,	%l5,	%g3
	fmul8x16au	%f3,	%f30,	%f12
	and	%o5,	0x1148,	%g4
	sll	%l0,	0x01,	%o7
	sll	%o1,	0x07,	%o2
	sdivx	%i2,	0x0BF9,	%l1
	tcc	%xcc,	0x5
	udivcc	%o0,	0x00C2,	%g1
	fpsub16s	%f19,	%f21,	%f2
	movpos	%icc,	%i4,	%g6
	nop
	set	0x7E, %l1
	ldub	[%l7 + %l1],	%l6
	fmovsg	%icc,	%f17,	%f22
	bg,pn	%xcc,	loop_1346
	edge8	%o6,	%i5,	%i7
	movrne	%o3,	%i6,	%l2
	fmovsn	%icc,	%f10,	%f27
loop_1346:
	nop
	set	0x38, %i7
	lda	[%l7 + %i7] 0x0c,	%f6
	popc	%g2,	%i0
	tgu	%xcc,	0x0
	mulx	%l3,	%i3,	%g5
	ldx	[%l7 + 0x38],	%g7
	bcc,pt	%icc,	loop_1347
	movpos	%xcc,	%l4,	%o4
	fsrc2s	%f6,	%f22
	fbue	%fcc2,	loop_1348
loop_1347:
	sub	%l5,	%g3,	%i1
	and	%g4,	0x188F,	%l0
	edge16	%o7,	%o5,	%o2
loop_1348:
	tne	%xcc,	0x1
	andcc	%i2,	0x0F8F,	%l1
	movpos	%xcc,	%o0,	%o1
	bleu	loop_1349
	or	%g1,	%i4,	%l6
	fblg	%fcc3,	loop_1350
	srlx	%o6,	%g6,	%i7
loop_1349:
	sll	%o3,	0x00,	%i6
	nop
	setx loop_1351, %l0, %l1
	jmpl %l1, %l2
loop_1350:
	alignaddr	%i5,	%i0,	%g2
	lduw	[%l7 + 0x48],	%l3
	fornot1	%f20,	%f30,	%f28
loop_1351:
	array8	%i3,	%g7,	%g5
	array32	%o4,	%l5,	%g3
	movleu	%icc,	%i1,	%l4
	edge8l	%g4,	%o7,	%l0
	fmovsg	%icc,	%f19,	%f29
	movneg	%icc,	%o2,	%o5
	fbug,a	%fcc3,	loop_1352
	te	%icc,	0x6
	bge	%xcc,	loop_1353
	edge32ln	%l1,	%i2,	%o0
loop_1352:
	fxnors	%f18,	%f24,	%f28
	fpackfix	%f18,	%f17
loop_1353:
	nop
	set	0x3C, %g5
	stwa	%o1,	[%l7 + %g5] 0x2f
	membar	#Sync
	ldd	[%l7 + 0x48],	%f6
	tneg	%icc,	0x5
	array16	%g1,	%l6,	%i4
	movpos	%xcc,	%g6,	%i7
	tsubcctv	%o6,	%o3,	%i6
	tleu	%xcc,	0x0
	movvc	%xcc,	%i5,	%l2
	mulscc	%i0,	0x1C9B,	%l3
	stb	%g2,	[%l7 + 0x42]
	fnegs	%f20,	%f30
	movrgz	%g7,	0x089,	%g5
	edge32l	%i3,	%l5,	%g3
	tgu	%icc,	0x1
	edge32n	%i1,	%o4,	%g4
	std	%f10,	[%l7 + 0x58]
	movrne	%l4,	%o7,	%o2
	fbne,a	%fcc1,	loop_1354
	addccc	%l0,	0x12AD,	%l1
	bne,pn	%xcc,	loop_1355
	umulcc	%i2,	%o5,	%o0
loop_1354:
	nop
	wr	%g0,	0x19,	%asi
	stxa	%g1,	[%l7 + 0x28] %asi
loop_1355:
	xorcc	%l6,	0x0967,	%i4
	sethi	0x18E8,	%g6
	stbar
	array32	%i7,	%o1,	%o6
	fabss	%f22,	%f14
	movgu	%icc,	%o3,	%i5
	mulscc	%i6,	%i0,	%l2
	bl,a	loop_1356
	move	%xcc,	%l3,	%g2
	tpos	%xcc,	0x3
	movgu	%icc,	%g5,	%g7
loop_1356:
	taddcc	%i3,	0x04DF,	%l5
	orncc	%g3,	%o4,	%g4
	nop
	set	0x70, %o2
	stx	%l4,	[%l7 + %o2]
	fba	%fcc1,	loop_1357
	mulscc	%i1,	%o7,	%o2
	umul	%l1,	0x1A92,	%i2
	xor	%l0,	0x1B5E,	%o0
loop_1357:
	xor	%o5,	0x0658,	%g1
	fmovdle	%xcc,	%f5,	%f21
	movre	%l6,	0x10A,	%g6
	sdivcc	%i7,	0x0355,	%i4
	xor	%o6,	%o3,	%o1
	fmul8x16al	%f30,	%f6,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%xcc,	%f26,	%f18
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i6
	fbn,a	%fcc2,	loop_1358
	mulscc	%i0,	0x0D82,	%l2
	orcc	%l3,	%i5,	%g5
	edge32l	%g2,	%g7,	%i3
loop_1358:
	fbu,a	%fcc3,	loop_1359
	fcmped	%fcc3,	%f22,	%f14
	movcc	%xcc,	%l5,	%g3
	std	%f22,	[%l7 + 0x30]
loop_1359:
	movgu	%xcc,	%g4,	%o4
	fmovrslz	%l4,	%f30,	%f25
	srax	%o7,	0x1C,	%i1
	fmovrslz	%l1,	%f21,	%f25
	movrgz	%i2,	%l0,	%o0
	fmovdvc	%xcc,	%f3,	%f0
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x30] %asi,	%o2
	addc	%g1,	%o5,	%l6
	fnot1	%f8,	%f18
	tvc	%xcc,	0x7
	subc	%i7,	0x11A0,	%g6
	fmovsleu	%xcc,	%f30,	%f7
	fmuld8ulx16	%f16,	%f9,	%f0
	bcs,pt	%icc,	loop_1360
	fands	%f7,	%f3,	%f3
	add	%i4,	%o3,	%o6
	srl	%o1,	0x1B,	%i0
loop_1360:
	fbge,a	%fcc3,	loop_1361
	edge16ln	%l2,	%l3,	%i6
	edge32l	%g5,	%i5,	%g7
	set	0x78, %o4
	lda	[%l7 + %o4] 0x14,	%f31
loop_1361:
	movrgez	%i3,	%g2,	%l5
	movleu	%icc,	%g3,	%g4
	alignaddr	%o4,	%l4,	%o7
	brnz,a	%i1,	loop_1362
	fmovdcs	%icc,	%f14,	%f2
	srax	%i2,	%l1,	%l0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x81,	%o2,	%g1
loop_1362:
	fpadd16s	%f0,	%f24,	%f11
	smul	%o0,	%l6,	%i7
	prefetch	[%l7 + 0x60],	 0x1
	ta	%icc,	0x1
	movcs	%icc,	%o5,	%i4
	sir	0x04ED
	fpadd32s	%f27,	%f17,	%f6
	pdist	%f10,	%f12,	%f10
	bleu	loop_1363
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc3,	loop_1364
	tle	%icc,	0x6
loop_1363:
	nop
	set	0x08, %i1
	sta	%f7,	[%l7 + %i1] 0x15
loop_1364:
	call	loop_1365
	fnand	%f2,	%f16,	%f6
	movvc	%icc,	%g6,	%o6
	subcc	%o3,	0x081E,	%i0
loop_1365:
	tpos	%icc,	0x1
	sdiv	%o1,	0x1BDA,	%l3
	ldub	[%l7 + 0x0A],	%i6
	srlx	%g5,	0x02,	%i5
	fandnot1	%f24,	%f22,	%f16
	tge	%icc,	0x0
	fcmps	%fcc0,	%f6,	%f16
	xnor	%l2,	0x1F6C,	%g7
	addc	%g2,	%i3,	%l5
	fmovscc	%xcc,	%f16,	%f9
	movleu	%xcc,	%g4,	%o4
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x6C] %asi,	%f9
	bgu,pn	%xcc,	loop_1366
	movrlez	%g3,	%o7,	%l4
	movcc	%icc,	%i2,	%l1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l0
loop_1366:
	fmovdcs	%icc,	%f26,	%f20
	sllx	%i1,	%g1,	%o2
	movrgz	%o0,	%i7,	%o5
	fcmple16	%f18,	%f4,	%l6
	edge32n	%i4,	%o6,	%g6
	xor	%i0,	0x0C91,	%o1
	orn	%l3,	%i6,	%g5
	alignaddr	%i5,	%l2,	%g7
	tne	%icc,	0x5
	ldd	[%l7 + 0x40],	%f6
	brgez,a	%o3,	loop_1367
	brnz,a	%g2,	loop_1368
	sdiv	%l5,	0x0EEF,	%i3
	fmovrslz	%o4,	%f11,	%f11
loop_1367:
	subc	%g4,	0x14CC,	%o7
loop_1368:
	movleu	%xcc,	%g3,	%l4
	tsubcctv	%l1,	%i2,	%i1
	pdist	%f2,	%f0,	%f28
	bvs,pt	%icc,	loop_1369
	tn	%icc,	0x0
	edge32ln	%l0,	%o2,	%o0
	movge	%icc,	%g1,	%o5
loop_1369:
	fmovrsgez	%i7,	%f14,	%f1
	fand	%f30,	%f16,	%f26
	sdivcc	%l6,	0x05D6,	%i4
	andn	%g6,	%o6,	%o1
	fxors	%f5,	%f3,	%f12
	mulscc	%l3,	0x073B,	%i0
	subc	%i6,	%g5,	%l2
	fcmpne32	%f8,	%f10,	%g7
	brgez,a	%o3,	loop_1370
	tne	%icc,	0x2
	subcc	%g2,	%i5,	%i3
	array32	%o4,	%g4,	%l5
loop_1370:
	movl	%icc,	%g3,	%l4
	fcmpne16	%f20,	%f24,	%o7
	tge	%icc,	0x2
	bpos	%xcc,	loop_1371
	sra	%l1,	0x1E,	%i1
	fpsub16s	%f26,	%f15,	%f27
	movneg	%icc,	%l0,	%o2
loop_1371:
	mova	%xcc,	%o0,	%g1
	fnot2	%f4,	%f14
	movl	%icc,	%o5,	%i2
	fpackfix	%f26,	%f17
	tsubcc	%i7,	0x1E40,	%l6
	alignaddr	%i4,	%o6,	%g6
	andn	%l3,	%o1,	%i6
	bne,pt	%icc,	loop_1372
	mulscc	%g5,	%l2,	%g7
	wr	%g0,	0x22,	%asi
	stwa	%o3,	[%l7 + 0x24] %asi
	membar	#Sync
loop_1372:
	tcc	%xcc,	0x5
	pdist	%f26,	%f8,	%f2
	bleu	%icc,	loop_1373
	lduw	[%l7 + 0x7C],	%i0
	fones	%f26
	tne	%xcc,	0x7
loop_1373:
	orn	%g2,	%i3,	%o4
	movrgz	%g4,	%l5,	%g3
	movne	%xcc,	%i5,	%o7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%i1
	fmovsvc	%xcc,	%f9,	%f6
	taddcc	%l0,	0x1C15,	%l4
	fpack16	%f28,	%f23
	tn	%icc,	0x7
	fba,a	%fcc3,	loop_1374
	tvc	%xcc,	0x5
	tn	%xcc,	0x7
	taddcctv	%o0,	0x1B0F,	%g1
loop_1374:
	array8	%o2,	%i2,	%i7
	set	0x78, %o1
	stda	%o4,	[%l7 + %o1] 0x2a
	membar	#Sync
	umul	%i4,	%l6,	%g6
	movn	%xcc,	%l3,	%o1
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x68] %asi,	%f24
	move	%xcc,	%o6,	%g5
	tne	%xcc,	0x7
	tcs	%xcc,	0x3
	edge32n	%i6,	%g7,	%o3
	ba,pn	%xcc,	loop_1375
	fpackfix	%f26,	%f20
	mulscc	%l2,	%g2,	%i0
	array32	%o4,	%i3,	%l5
loop_1375:
	mova	%xcc,	%g4,	%g3
	nop
	setx loop_1376, %l0, %l1
	jmpl %l1, %o7
	edge8	%i5,	%i1,	%l0
	subcc	%l4,	0x1A69,	%o0
	andncc	%l1,	%o2,	%i2
loop_1376:
	xor	%g1,	%i7,	%o5
	movvc	%icc,	%i4,	%l6
	tleu	%xcc,	0x6
	edge32	%l3,	%o1,	%g6
	edge16n	%g5,	%o6,	%g7
	movcc	%xcc,	%i6,	%o3
	brz,a	%l2,	loop_1377
	sll	%g2,	%i0,	%i3
	tl	%xcc,	0x2
	orncc	%o4,	0x0BE5,	%l5
loop_1377:
	fbo,a	%fcc2,	loop_1378
	movcs	%icc,	%g3,	%g4
	movcs	%xcc,	%o7,	%i5
	movne	%xcc,	%i1,	%l4
loop_1378:
	fsrc1s	%f11,	%f27
	set	0x20, %l2
	sta	%f29,	[%l7 + %l2] 0x0c
	add	%l0,	0x140D,	%l1
	edge8	%o2,	%i2,	%g1
	movre	%o0,	%o5,	%i4
	edge8n	%i7,	%l6,	%l3
	alignaddrl	%o1,	%g5,	%g6
	add	%o6,	%i6,	%o3
	subccc	%l2,	%g7,	%i0
	fnegd	%f26,	%f20
	fpadd32s	%f23,	%f24,	%f3
	edge8l	%g2,	%o4,	%l5
	movpos	%icc,	%i3,	%g3
	tg	%xcc,	0x4
	fcmpeq16	%f24,	%f26,	%o7
	bg,pt	%icc,	loop_1379
	tl	%icc,	0x2
	fmuld8sux16	%f28,	%f17,	%f26
	fbg,a	%fcc2,	loop_1380
loop_1379:
	fmovrde	%i5,	%f22,	%f22
	fmovrse	%g4,	%f7,	%f10
	bcs,a,pt	%icc,	loop_1381
loop_1380:
	swap	[%l7 + 0x44],	%i1
	wr	%g0,	0x23,	%asi
	stba	%l0,	[%l7 + 0x64] %asi
	membar	#Sync
loop_1381:
	bgu,pt	%xcc,	loop_1382
	tn	%xcc,	0x6
	taddcctv	%l4,	%l1,	%i2
	addc	%o2,	%o0,	%g1
loop_1382:
	fmul8x16al	%f16,	%f9,	%f6
	edge8	%o5,	%i4,	%l6
	tn	%icc,	0x6
	tpos	%xcc,	0x7
	popc	%i7,	%o1
	brgz	%l3,	loop_1383
	umul	%g5,	0x1A11,	%o6
	movn	%xcc,	%g6,	%i6
	fmovdle	%icc,	%f23,	%f3
loop_1383:
	edge32	%l2,	%g7,	%i0
	edge16	%o3,	%o4,	%l5
	edge16l	%i3,	%g3,	%o7
	movl	%icc,	%g2,	%g4
	andcc	%i1,	0x1783,	%i5
	sir	0x08FD
	fmovsle	%xcc,	%f27,	%f1
	alignaddr	%l4,	%l0,	%i2
	fmovsleu	%xcc,	%f8,	%f6
	ba,a	%xcc,	loop_1384
	udivx	%o2,	0x02FB,	%l1
	bcs,a	%icc,	loop_1385
	fzero	%f14
loop_1384:
	fxor	%f0,	%f10,	%f24
	fmul8x16	%f3,	%f14,	%f10
loop_1385:
	fnand	%f18,	%f10,	%f2
	movrgz	%g1,	0x235,	%o5
	edge32n	%i4,	%l6,	%o0
	orcc	%i7,	0x0464,	%o1
	smul	%l3,	%g5,	%g6
	fxnors	%f25,	%f10,	%f3
	bpos,a,pn	%xcc,	loop_1386
	or	%i6,	0x0B6A,	%l2
	edge32l	%g7,	%i0,	%o3
	fmovdvs	%icc,	%f19,	%f26
loop_1386:
	nop
	set	0x64, %g4
	lduwa	[%l7 + %g4] 0x04,	%o4
	fnot2s	%f28,	%f27
	ba,pt	%xcc,	loop_1387
	stw	%l5,	[%l7 + 0x44]
	movg	%icc,	%o6,	%g3
	fmovdcc	%xcc,	%f27,	%f26
loop_1387:
	nop
	wr	%g0,	0x04,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fornot2	%f0,	%f18,	%f16
	array32	%o7,	%g2,	%i3
	mova	%icc,	%i1,	%i5
	fnot1s	%f17,	%f18
	tvs	%icc,	0x3
	flush	%l7 + 0x5C
	movcs	%xcc,	%l4,	%l0
	fmovrdgz	%g4,	%f8,	%f0
	edge16	%o2,	%i2,	%l1
	mulscc	%g1,	%o5,	%l6
	nop
	setx loop_1388, %l0, %l1
	jmpl %l1, %i4
	xor	%o0,	%o1,	%l3
	bn,pt	%icc,	loop_1389
	mulscc	%i7,	0x137E,	%g5
loop_1388:
	movrne	%i6,	0x0E5,	%l2
	udiv	%g7,	0x0C19,	%g6
loop_1389:
	movn	%xcc,	%o3,	%i0
	taddcc	%l5,	0x1667,	%o4
	srlx	%o6,	%g3,	%g2
	addcc	%i3,	0x0743,	%i1
	movrne	%o7,	%i5,	%l4
	fandnot2	%f12,	%f10,	%f0
	fmuld8sux16	%f30,	%f30,	%f4
	ble,pt	%xcc,	loop_1390
	movvc	%xcc,	%l0,	%o2
	fbule,a	%fcc2,	loop_1391
	bcc,a	loop_1392
loop_1390:
	addccc	%g4,	%i2,	%g1
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf8,	%f16
loop_1391:
	tge	%xcc,	0x7
loop_1392:
	fbo,a	%fcc3,	loop_1393
	movgu	%xcc,	%l1,	%l6
	bvs,pt	%icc,	loop_1394
	orn	%i4,	0x0472,	%o5
loop_1393:
	fmul8ulx16	%f4,	%f26,	%f20
	movvs	%xcc,	%o1,	%l3
loop_1394:
	nop
	wr	%g0,	0x23,	%asi
	stxa	%i7,	[%l7 + 0x38] %asi
	membar	#Sync
	fnegd	%f28,	%f6
	te	%icc,	0x3
	umulcc	%g5,	0x01ED,	%i6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l2,	%o0
	nop
	set	0x28, %g6
	ldsw	[%l7 + %g6],	%g7
	edge16ln	%o3,	%g6,	%i0
	ldsw	[%l7 + 0x60],	%o4
	movrgz	%o6,	%l5,	%g2
	stw	%g3,	[%l7 + 0x10]
	umulcc	%i1,	0x0FD3,	%o7
	set	0x3C, %l6
	ldswa	[%l7 + %l6] 0x0c,	%i3
	bne,pn	%xcc,	loop_1395
	sll	%i5,	%l4,	%o2
	fmovsvc	%icc,	%f30,	%f13
	tge	%icc,	0x0
loop_1395:
	fmovsge	%xcc,	%f4,	%f6
	ldstub	[%l7 + 0x71],	%l0
	set	0x0A, %i3
	ldsha	[%l7 + %i3] 0x14,	%i2
	bne,a	%xcc,	loop_1396
	or	%g4,	%g1,	%l6
	edge8l	%i4,	%o5,	%l1
	array32	%o1,	%l3,	%g5
loop_1396:
	tg	%xcc,	0x0
	fmovrdlez	%i6,	%f12,	%f28
	movl	%icc,	%l2,	%o0
	fmovsge	%icc,	%f1,	%f26
	edge16ln	%i7,	%g7,	%g6
	membar	0x51
	fmovdleu	%xcc,	%f31,	%f1
	edge32	%o3,	%i0,	%o4
	sir	0x1DD3
	srl	%o6,	0x1B,	%g2
	ldstub	[%l7 + 0x0C],	%l5
	movcs	%xcc,	%g3,	%i1
	andcc	%o7,	0x0253,	%i5
	alignaddr	%i3,	%l4,	%o2
	fpsub16s	%f24,	%f21,	%f6
	fands	%f3,	%f7,	%f20
	siam	0x4
	srax	%i2,	0x1B,	%l0
	bneg,a,pt	%icc,	loop_1397
	fornot2	%f8,	%f0,	%f26
	tl	%xcc,	0x0
	edge32n	%g4,	%l6,	%i4
loop_1397:
	fnot2	%f20,	%f2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g1,	%l1
	popc	%o1,	%l3
	udivcc	%o5,	0x11DA,	%g5
	addcc	%i6,	0x1431,	%o0
	flush	%l7 + 0x64
	fornot2	%f10,	%f4,	%f28
	umul	%l2,	0x0414,	%i7
	edge16l	%g6,	%o3,	%g7
	fbug,a	%fcc3,	loop_1398
	fbo,a	%fcc3,	loop_1399
	movvs	%xcc,	%i0,	%o6
	fmovsvc	%icc,	%f18,	%f3
loop_1398:
	fcmpes	%fcc1,	%f22,	%f12
loop_1399:
	fandnot2	%f6,	%f20,	%f10
	and	%g2,	0x1750,	%o4
	movvs	%icc,	%g3,	%i1
	fnegs	%f26,	%f27
	fmovsneg	%icc,	%f25,	%f4
	taddcc	%o7,	%i5,	%i3
	sethi	0x037E,	%l5
	edge16n	%o2,	%l4,	%l0
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%g4
	edge32l	%l6,	%i2,	%g1
	be,a	%icc,	loop_1400
	edge32l	%i4,	%o1,	%l3
	bge,a,pt	%xcc,	loop_1401
	udivx	%l1,	0x1BA3,	%o5
loop_1400:
	sethi	0x1B76,	%i6
	stx	%o0,	[%l7 + 0x78]
loop_1401:
	edge8	%g5,	%l2,	%g6
	fandnot1s	%f5,	%f23,	%f24
	subc	%o3,	%i7,	%g7
	ldsw	[%l7 + 0x14],	%i0
	tsubcc	%g2,	%o4,	%o6
	array8	%g3,	%i1,	%o7
	fones	%f9
	sra	%i3,	0x06,	%i5
	edge8ln	%l5,	%l4,	%o2
	taddcctv	%g4,	%l6,	%l0
	movg	%icc,	%g1,	%i4
	tcc	%icc,	0x5
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	alignaddr	%i2,	%o1,	%l1
	movle	%icc,	%l3,	%o5
	add	%o0,	0x1EBB,	%g5
	fmovdleu	%xcc,	%f27,	%f25
	array8	%l2,	%g6,	%o3
	movne	%icc,	%i7,	%g7
	tge	%icc,	0x0
	membar	0x34
	taddcc	%i6,	%g2,	%i0
	nop
	set	0x0A, %i0
	ldsh	[%l7 + %i0],	%o4
	fnegs	%f31,	%f9
	edge16n	%o6,	%g3,	%i1
	umul	%i3,	%i5,	%o7
	fone	%f30
	fmovrdlz	%l5,	%f6,	%f18
	srl	%o2,	0x04,	%l4
	fmuld8ulx16	%f1,	%f25,	%f4
	movg	%icc,	%g4,	%l6
	fands	%f10,	%f2,	%f29
	ta	%icc,	0x1
	movrne	%l0,	%i4,	%i2
	swap	[%l7 + 0x40],	%g1
	be	%icc,	loop_1402
	fmul8x16au	%f8,	%f29,	%f20
	fmovs	%f27,	%f23
	and	%o1,	%l3,	%o5
loop_1402:
	andncc	%o0,	%l1,	%l2
	fpack16	%f2,	%f30
	umulcc	%g6,	0x07C8,	%g5
	mulx	%i7,	0x0D2B,	%g7
	udiv	%o3,	0x1EF5,	%g2
	fsrc1	%f10,	%f14
	bne,a,pn	%xcc,	loop_1403
	movl	%xcc,	%i0,	%o4
	brz	%o6,	loop_1404
	fmovsleu	%xcc,	%f12,	%f21
loop_1403:
	fsrc2s	%f2,	%f2
	edge16l	%i6,	%i1,	%g3
loop_1404:
	udivcc	%i5,	0x1EFC,	%o7
	xnorcc	%i3,	%o2,	%l5
	xorcc	%l4,	0x1661,	%l6
	brz	%l0,	loop_1405
	fnot2s	%f0,	%f7
	ld	[%l7 + 0x6C],	%f14
	set	0x3C, %o7
	lduha	[%l7 + %o7] 0x88,	%i4
loop_1405:
	fmul8sux16	%f6,	%f6,	%f22
	bn,a,pt	%icc,	loop_1406
	fpsub16s	%f15,	%f8,	%f27
	fnot1s	%f12,	%f22
	edge32n	%i2,	%g1,	%o1
loop_1406:
	ldsh	[%l7 + 0x0E],	%g4
	tsubcctv	%l3,	0x1102,	%o5
	sllx	%o0,	%l2,	%l1
	subccc	%g5,	%i7,	%g7
	set	0x44, %g3
	swapa	[%l7 + %g3] 0x19,	%o3
	movrgz	%g6,	0x06A,	%g2
	bn,a,pt	%xcc,	loop_1407
	tneg	%icc,	0x6
	fmovs	%f27,	%f29
	fpackfix	%f24,	%f6
loop_1407:
	lduh	[%l7 + 0x50],	%o4
	fmul8x16al	%f3,	%f4,	%f6
	wr	%g0,	0x23,	%asi
	stba	%i0,	[%l7 + 0x39] %asi
	membar	#Sync
	movrgz	%o6,	%i1,	%i6
	fmovrsgz	%g3,	%f8,	%f31
	srl	%i5,	0x05,	%o7
	siam	0x3
	addc	%i3,	%o2,	%l4
	fmovrdne	%l6,	%f22,	%f16
	fmovdge	%xcc,	%f21,	%f23
	fandnot2	%f6,	%f12,	%f8
	movrlez	%l5,	%l0,	%i4
	subcc	%g1,	0x1EC6,	%i2
	bvs,a,pt	%xcc,	loop_1408
	sdivx	%g4,	0x01A0,	%o1
	sdivx	%o5,	0x1668,	%o0
	subc	%l2,	%l1,	%g5
loop_1408:
	ldub	[%l7 + 0x1B],	%l3
	tcs	%icc,	0x3
	udiv	%g7,	0x09F8,	%i7
	tle	%xcc,	0x0
	edge8	%g6,	%g2,	%o4
	xnor	%o3,	%o6,	%i0
	sdivcc	%i6,	0x1895,	%g3
	fsrc1	%f24,	%f8
	udivx	%i1,	0x1615,	%o7
	xorcc	%i3,	%o2,	%i5
	nop
	setx	loop_1409,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tcs	%xcc,	0x5
	orncc	%l4,	0x13A4,	%l6
	fnot1s	%f6,	%f3
loop_1409:
	fbe	%fcc0,	loop_1410
	bleu,a	loop_1411
	tl	%xcc,	0x5
	tvs	%xcc,	0x2
loop_1410:
	edge32l	%l0,	%l5,	%i4
loop_1411:
	nop
	set	0x10, %o5
	lda	[%l7 + %o5] 0x10,	%f25
	xorcc	%i2,	%g4,	%g1
	mova	%icc,	%o5,	%o0
	fexpand	%f19,	%f8
	popc	0x16BE,	%l2
	smul	%l1,	%o1,	%g5
	smul	%l3,	%i7,	%g6
	movleu	%icc,	%g7,	%o4
	movvc	%xcc,	%g2,	%o6
	sub	%o3,	%i0,	%i6
	set	0x68, %g2
	prefetcha	[%l7 + %g2] 0x18,	 0x3
	edge8ln	%i1,	%o7,	%o2
	te	%icc,	0x6
	tn	%xcc,	0x6
	brlez,a	%i5,	loop_1412
	array32	%l4,	%i3,	%l6
	fmul8ulx16	%f10,	%f22,	%f20
	tcs	%icc,	0x4
loop_1412:
	nop
	set	0x43, %o3
	ldsba	[%l7 + %o3] 0x89,	%l5
	xnor	%l0,	0x01C3,	%i4
	movle	%xcc,	%g4,	%g1
	fmovdleu	%icc,	%f18,	%f27
	xnor	%i2,	%o0,	%o5
	tgu	%icc,	0x4
	stx	%l1,	[%l7 + 0x08]
	xnor	%o1,	0x0338,	%g5
	edge32	%l2,	%l3,	%g6
	fbge	%fcc1,	loop_1413
	sdivx	%i7,	0x12B3,	%g7
	srl	%g2,	%o4,	%o6
	fbe,a	%fcc3,	loop_1414
loop_1413:
	for	%f30,	%f8,	%f20
	movrgz	%i0,	0x377,	%o3
	popc	0x14F5,	%i6
loop_1414:
	subc	%g3,	0x1209,	%o7
	ldsh	[%l7 + 0x56],	%i1
	fcmpd	%fcc1,	%f0,	%f22
	edge8n	%i5,	%o2,	%l4
	tpos	%xcc,	0x7
	fbu,a	%fcc3,	loop_1415
	umulcc	%i3,	0x03A4,	%l6
	std	%l4,	[%l7 + 0x20]
	orn	%i4,	%g4,	%l0
loop_1415:
	bvs,a,pt	%xcc,	loop_1416
	fbul,a	%fcc1,	loop_1417
	umul	%g1,	%i2,	%o0
	and	%o5,	%l1,	%g5
loop_1416:
	bg	%icc,	loop_1418
loop_1417:
	movvc	%xcc,	%o1,	%l2
	bcs,a	%icc,	loop_1419
	popc	%g6,	%i7
loop_1418:
	subcc	%l3,	0x0B79,	%g7
	movrlz	%g2,	%o4,	%o6
loop_1419:
	fzero	%f12
	fmovrdne	%i0,	%f2,	%f30
	edge8n	%i6,	%o3,	%g3
	ba,a	loop_1420
	tn	%xcc,	0x3
	edge16	%i1,	%o7,	%i5
	set	0x20, %g1
	stda	%o2,	[%l7 + %g1] 0xe3
	membar	#Sync
loop_1420:
	umulcc	%l4,	0x0709,	%l6
	tsubcctv	%i3,	0x0DDF,	%l5
	xor	%i4,	0x0630,	%g4
	sir	0x1F30
	edge8n	%l0,	%i2,	%o0
	array8	%g1,	%l1,	%g5
	andncc	%o5,	%o1,	%l2
	movg	%icc,	%i7,	%l3
	srax	%g7,	%g2,	%g6
	bpos,a	%xcc,	loop_1421
	andcc	%o4,	%i0,	%o6
	membar	0x18
	tsubcctv	%o3,	%i6,	%i1
loop_1421:
	ta	%xcc,	0x4
	fmovdpos	%icc,	%f0,	%f27
	movg	%icc,	%g3,	%o7
	bcs,a,pt	%icc,	loop_1422
	fcmpeq16	%f0,	%f0,	%i5
	add	%l4,	0x0EC8,	%l6
	xor	%o2,	0x1A1D,	%l5
loop_1422:
	sdiv	%i3,	0x03DC,	%g4
	fmovdle	%xcc,	%f5,	%f7
	wr	%g0,	0x27,	%asi
	stba	%l0,	[%l7 + 0x40] %asi
	membar	#Sync
	movl	%icc,	%i4,	%o0
	tsubcctv	%i2,	0x179C,	%l1
	brz	%g5,	loop_1423
	fmovrde	%g1,	%f10,	%f18
	popc	%o1,	%o5
	fmovrsgz	%l2,	%f22,	%f24
loop_1423:
	tneg	%icc,	0x3
	udiv	%l3,	0x0441,	%i7
	tg	%xcc,	0x4
	movne	%icc,	%g7,	%g6
	edge8n	%o4,	%g2,	%i0
	std	%f26,	[%l7 + 0x18]
	movcs	%xcc,	%o6,	%i6
	tgu	%xcc,	0x5
	popc	0x19A3,	%o3
	movpos	%icc,	%g3,	%o7
	alignaddrl	%i5,	%l4,	%l6
	tneg	%icc,	0x1
	set	0x10, %i6
	lduwa	[%l7 + %i6] 0x19,	%i1
	or	%o2,	0x11CA,	%i3
	fmovrsgez	%l5,	%f14,	%f0
	ld	[%l7 + 0x78],	%f30
	set	0x09, %i2
	stba	%l0,	[%l7 + %i2] 0xeb
	membar	#Sync
	srlx	%i4,	%o0,	%i2
	bl,a	%xcc,	loop_1424
	fcmple16	%f28,	%f10,	%g4
	tsubcc	%g5,	0x12B8,	%l1
	fabsd	%f8,	%f16
loop_1424:
	brgz	%o1,	loop_1425
	udivx	%g1,	0x1BA9,	%o5
	membar	0x00
	tsubcc	%l3,	0x17F7,	%l2
loop_1425:
	tleu	%xcc,	0x2
	tg	%icc,	0x7
	ldd	[%l7 + 0x68],	%g6
	movrlz	%g6,	%o4,	%i7
	fxnors	%f16,	%f24,	%f1
	srlx	%i0,	0x17,	%o6
	add	%g2,	0x0B75,	%i6
	fornot1s	%f6,	%f0,	%f2
	movgu	%xcc,	%o3,	%o7
	sdivcc	%i5,	0x09B6,	%g3
	movrlz	%l6,	%l4,	%o2
	sllx	%i3,	%l5,	%l0
	fbule,a	%fcc1,	loop_1426
	subcc	%i1,	%o0,	%i2
	membar	0x18
	movcs	%icc,	%g4,	%g5
loop_1426:
	fcmpeq32	%f14,	%f10,	%i4
	fandnot2	%f16,	%f14,	%f2
	umul	%o1,	0x0CF2,	%g1
	udivx	%o5,	0x0569,	%l3
	fmovsvc	%xcc,	%f24,	%f27
	fnand	%f4,	%f10,	%f26
	movleu	%xcc,	%l1,	%g7
	bcc	%icc,	loop_1427
	sra	%g6,	0x0A,	%o4
	movge	%xcc,	%l2,	%i0
	tcs	%xcc,	0x2
loop_1427:
	srl	%i7,	%o6,	%g2
	swap	[%l7 + 0x30],	%o3
	subc	%i6,	%i5,	%g3
	set	0x50, %l4
	ldda	[%l7 + %l4] 0xe2,	%o6
	fmovsl	%icc,	%f9,	%f22
	fxnor	%f24,	%f16,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x48, %l5
	swapa	[%l7 + %l5] 0x19,	%l6
	and	%l4,	0x073A,	%o2
	tneg	%xcc,	0x7
	brgz,a	%l5,	loop_1428
	fcmpeq16	%f14,	%f2,	%l0
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1428:
	fble	%fcc3,	loop_1429
	movne	%icc,	%i1,	%o0
	tne	%xcc,	0x6
	popc	%i2,	%g4
loop_1429:
	faligndata	%f20,	%f4,	%f10
	array32	%i3,	%i4,	%o1
	movne	%xcc,	%g5,	%o5
	tcs	%icc,	0x7
	st	%f7,	[%l7 + 0x2C]
	alignaddr	%g1,	%l3,	%g7
	alignaddrl	%l1,	%g6,	%o4
	fmovdneg	%xcc,	%f10,	%f1
	movge	%icc,	%l2,	%i7
	set	0x48, %o6
	ldsba	[%l7 + %o6] 0x10,	%i0
	tpos	%xcc,	0x4
	fmovscs	%xcc,	%f13,	%f13
	andcc	%g2,	%o6,	%i6
	movrne	%o3,	0x1B0,	%i5
	and	%o7,	0x1975,	%l6
	swap	[%l7 + 0x48],	%l4
	bcc,a,pt	%xcc,	loop_1430
	std	%f20,	[%l7 + 0x60]
	umul	%o2,	%g3,	%l0
	fmul8x16al	%f8,	%f16,	%f18
loop_1430:
	movneg	%xcc,	%i1,	%o0
	edge32ln	%l5,	%i2,	%i3
	lduh	[%l7 + 0x0A],	%i4
	sdivx	%o1,	0x0941,	%g5
	edge16n	%g4,	%g1,	%o5
	bg	%icc,	loop_1431
	array16	%l3,	%l1,	%g6
	smul	%g7,	0x12C9,	%l2
	fzeros	%f3
loop_1431:
	xorcc	%i7,	%i0,	%g2
	fcmple32	%f24,	%f30,	%o6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] %asi,	%o4,	%i6
	add	%i5,	0x0B6A,	%o7
	umulcc	%l6,	%o3,	%l4
	fbu	%fcc3,	loop_1432
	srax	%o2,	0x1C,	%l0
	tn	%xcc,	0x4
	wr	%g0,	0x2a,	%asi
	stda	%i0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1432:
	smulcc	%g3,	0x07B2,	%o0
	std	%f26,	[%l7 + 0x38]
	xorcc	%l5,	0x0A01,	%i2
	tcc	%icc,	0x7
	tcc	%xcc,	0x1
	edge32n	%i4,	%o1,	%i3
	edge32l	%g5,	%g1,	%o5
	fandnot2	%f28,	%f4,	%f22
	smul	%g4,	%l1,	%l3
	edge32	%g6,	%g7,	%l2
	fsrc2s	%f8,	%f6
	tneg	%icc,	0x1
	orncc	%i7,	0x1C7B,	%g2
	fcmps	%fcc3,	%f8,	%f1
	fnot1	%f22,	%f16
	orncc	%o6,	%i0,	%i6
	edge16l	%o4,	%i5,	%o7
	fmuld8ulx16	%f9,	%f5,	%f10
	edge16n	%l6,	%o3,	%o2
	movl	%xcc,	%l0,	%l4
	tne	%icc,	0x3
	udivcc	%i1,	0x1AF8,	%g3
	set	0x32, %i4
	ldsha	[%l7 + %i4] 0x15,	%o0
	fmovdpos	%xcc,	%f23,	%f26
	movrgez	%i2,	0x0A4,	%i4
	alignaddrl	%o1,	%i3,	%g5
	fands	%f6,	%f7,	%f16
	set	0x68, %g7
	prefetcha	[%l7 + %g7] 0x14,	 0x2
	movrlz	%o5,	%g4,	%l5
	taddcc	%l3,	0x07BC,	%g6
	edge8ln	%l1,	%g7,	%l2
	smulcc	%g2,	%o6,	%i7
	fornot1	%f0,	%f6,	%f16
	brnz	%i6,	loop_1433
	fandnot1	%f14,	%f20,	%f20
	subccc	%o4,	%i0,	%i5
	fmovdg	%xcc,	%f25,	%f17
loop_1433:
	fmovdn	%icc,	%f31,	%f26
	fnor	%f26,	%f26,	%f30
	tsubcctv	%o7,	%o3,	%o2
	ldx	[%l7 + 0x48],	%l6
	fsrc2s	%f14,	%f28
	membar	0x79
	fcmpgt16	%f14,	%f20,	%l0
	bpos,pn	%xcc,	loop_1434
	sllx	%l4,	0x05,	%g3
	brz,a	%o0,	loop_1435
	movrlz	%i2,	0x3B4,	%i1
loop_1434:
	subcc	%i4,	0x0E3B,	%i3
	fmovdleu	%xcc,	%f30,	%f5
loop_1435:
	udivx	%g5,	0x0B49,	%g1
	and	%o5,	%g4,	%l5
	taddcc	%o1,	0x10CA,	%g6
	addccc	%l3,	%l1,	%l2
	std	%g2,	[%l7 + 0x68]
	siam	0x6
	bge,a	%icc,	loop_1436
	fbu,a	%fcc0,	loop_1437
	fmul8sux16	%f2,	%f16,	%f14
	array8	%o6,	%i7,	%i6
loop_1436:
	xor	%o4,	0x133B,	%i0
loop_1437:
	orn	%g7,	%i5,	%o3
	bpos,a,pn	%icc,	loop_1438
	fmovdcc	%icc,	%f25,	%f17
	fabsd	%f22,	%f2
	tleu	%icc,	0x7
loop_1438:
	fsrc1s	%f30,	%f19
	mova	%xcc,	%o2,	%o7
	brlez,a	%l6,	loop_1439
	bvs,a,pt	%icc,	loop_1440
	movn	%icc,	%l4,	%g3
	fblg	%fcc0,	loop_1441
loop_1439:
	edge32	%l0,	%o0,	%i2
loop_1440:
	tle	%icc,	0x6
	alignaddr	%i1,	%i3,	%i4
loop_1441:
	fcmped	%fcc1,	%f4,	%f20
	fmovdn	%xcc,	%f20,	%f29
	movrlz	%g1,	%g5,	%o5
	fpsub16	%f26,	%f28,	%f16
	ldx	[%l7 + 0x48],	%g4
	movrgz	%l5,	%g6,	%o1
	movrgz	%l3,	%l2,	%g2
	fcmple32	%f28,	%f26,	%o6
	fba,a	%fcc3,	loop_1442
	edge8n	%i7,	%i6,	%o4
	movl	%icc,	%l1,	%g7
	subc	%i5,	%i0,	%o3
loop_1442:
	movle	%xcc,	%o2,	%o7
	tcc	%icc,	0x6
	alignaddrl	%l6,	%g3,	%l4
	fnand	%f8,	%f8,	%f10
	bleu,pn	%xcc,	loop_1443
	ba,pt	%icc,	loop_1444
	umulcc	%l0,	%i2,	%i1
	fpack16	%f10,	%f29
loop_1443:
	fmovsleu	%xcc,	%f25,	%f29
loop_1444:
	move	%xcc,	%i3,	%o0
	movcs	%xcc,	%i4,	%g1
	st	%f4,	[%l7 + 0x14]
	sllx	%o5,	0x1B,	%g5
	udivx	%g4,	0x0403,	%g6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%o1
	bl,pn	%xcc,	loop_1445
	fcmpgt32	%f22,	%f14,	%l3
	edge8l	%l2,	%l5,	%g2
	membar	0x11
loop_1445:
	nop
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o6,	%i7
	movge	%xcc,	%i6,	%o4
	udivcc	%g7,	0x0E4F,	%i5
	movl	%xcc,	%i0,	%l1
	smulcc	%o3,	0x1BAD,	%o7
	xnorcc	%l6,	0x02CB,	%g3
	wr	%g0,	0x52,	%asi
	stxa	%l4,	[%g0 + 0x110] %asi
	or	%o2,	%i2,	%l0
	andn	%i3,	%i1,	%o0
	xorcc	%g1,	0x105C,	%i4
	tg	%icc,	0x5
	udiv	%g5,	0x1895,	%o5
	stbar
	st	%f30,	[%l7 + 0x70]
	fbne	%fcc3,	loop_1446
	fors	%f18,	%f24,	%f13
	sethi	0x06E9,	%g6
	fbe,a	%fcc0,	loop_1447
loop_1446:
	tg	%xcc,	0x4
	edge8ln	%g4,	%o1,	%l2
	edge8ln	%l3,	%l5,	%g2
loop_1447:
	xor	%o6,	%i6,	%i7
	sra	%o4,	%g7,	%i0
	nop
	setx	loop_1448,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%i5,	%o3,	%l1
	fmovdgu	%xcc,	%f22,	%f15
	udivcc	%l6,	0x1E21,	%g3
loop_1448:
	nop
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o7
	or	%o2,	0x1244,	%l4
	movrgz	%i2,	%l0,	%i1
	edge32l	%o0,	%g1,	%i4
	fmuld8ulx16	%f13,	%f17,	%f30
	fornot2	%f20,	%f4,	%f22
	popc	%g5,	%o5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i3,	%g4
	or	%o1,	0x0AB7,	%g6
	fmovrse	%l3,	%f13,	%f1
	fzeros	%f11
	set	0x79, %l0
	ldsba	[%l7 + %l0] 0x15,	%l2
	umul	%l5,	0x170D,	%o6
	fmovsleu	%xcc,	%f25,	%f26
	fmovsgu	%icc,	%f3,	%f22
	edge8	%g2,	%i6,	%o4
	set	0x09, %i5
	ldsba	[%l7 + %i5] 0x81,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f28,	%f17,	%f26
	subcc	%i7,	%i5,	%i0
	orn	%l1,	%l6,	%g3
	sra	%o3,	0x0D,	%o7
	mulscc	%o2,	%l4,	%l0
	fmovrdne	%i1,	%f8,	%f0
	fxors	%f13,	%f23,	%f7
	andn	%o0,	0x1749,	%g1
	fmovrde	%i2,	%f28,	%f2
	brnz	%i4,	loop_1449
	bl	loop_1450
	fbue	%fcc0,	loop_1451
	tneg	%xcc,	0x3
loop_1449:
	and	%o5,	%i3,	%g4
loop_1450:
	brgez,a	%g5,	loop_1452
loop_1451:
	tgu	%xcc,	0x0
	prefetch	[%l7 + 0x50],	 0x3
	set	0x42, %o0
	stba	%o1,	[%l7 + %o0] 0x19
loop_1452:
	fmovdvc	%icc,	%f12,	%f6
	fpackfix	%f12,	%f10
	xnor	%g6,	%l2,	%l3
	tneg	%icc,	0x3
	fpadd16s	%f7,	%f11,	%f15
	alignaddrl	%o6,	%g2,	%i6
	te	%icc,	0x1
	te	%icc,	0x4
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf1,	%f0
	ldstub	[%l7 + 0x0B],	%o4
	movn	%xcc,	%l5,	%i7
	umul	%g7,	%i0,	%i5
	taddcctv	%l1,	0x179B,	%g3
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fbo,a	%fcc0,	loop_1453
	fpadd16	%f6,	%f8,	%f8
	movre	%l6,	0x0B0,	%o3
	array8	%o7,	%o2,	%l0
loop_1453:
	tsubcctv	%l4,	%i1,	%o0
	faligndata	%f10,	%f20,	%f22
	fmovdcc	%icc,	%f26,	%f6
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	set	0x41, %i7
	ldsb	[%l7 + %i7],	%g1
	movrlez	%i2,	%o5,	%i4
	fzero	%f0
	movle	%xcc,	%g4,	%g5
	edge16n	%o1,	%g6,	%l2
	edge8n	%l3,	%o6,	%i3
	edge8n	%i6,	%o4,	%l5
	fsrc2	%f20,	%f22
	bg,a,pt	%icc,	loop_1454
	array32	%i7,	%g2,	%i0
	tn	%xcc,	0x7
	fmovscs	%icc,	%f30,	%f26
loop_1454:
	movrne	%i5,	0x0EB,	%g7
	udivcc	%g3,	0x07DB,	%l1
	andncc	%o3,	%o7,	%o2
	set	0x60, %g5
	stwa	%l0,	[%l7 + %g5] 0xea
	membar	#Sync
	array8	%l6,	%i1,	%o0
	fcmped	%fcc2,	%f30,	%f24
	nop
	set	0x1B, %o4
	ldstub	[%l7 + %o4],	%g1
	sethi	0x001D,	%l4
	bn,a	%xcc,	loop_1455
	call	loop_1456
	edge16l	%o5,	%i4,	%i2
	edge8	%g4,	%o1,	%g5
loop_1455:
	lduw	[%l7 + 0x24],	%g6
loop_1456:
	tl	%icc,	0x5
	fmovsl	%icc,	%f20,	%f23
	edge16	%l2,	%o6,	%l3
	movle	%xcc,	%i3,	%o4
	movl	%xcc,	%l5,	%i7
	orcc	%g2,	0x188A,	%i6
	membar	0x0E
	addc	%i0,	0x04AE,	%g7
	lduh	[%l7 + 0x7C],	%g3
	wr	%g0,	0x18,	%asi
	sta	%f27,	[%l7 + 0x24] %asi
	movl	%icc,	%i5,	%l1
	std	%f30,	[%l7 + 0x50]
	movne	%icc,	%o3,	%o7
	srl	%o2,	%l6,	%i1
	tg	%xcc,	0x7
	tl	%xcc,	0x6
	fnot1	%f26,	%f28
	be,a	%icc,	loop_1457
	andncc	%o0,	%g1,	%l4
	fpack16	%f12,	%f30
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%i4
loop_1457:
	fpadd32s	%f13,	%f28,	%f9
	bge,a,pn	%xcc,	loop_1458
	fpsub32	%f18,	%f8,	%f30
	fmovdg	%xcc,	%f24,	%f17
	nop
	set	0x70, %o2
	ldx	[%l7 + %o2],	%i2
loop_1458:
	sllx	%l0,	%o1,	%g4
	tsubcctv	%g6,	%l2,	%o6
	taddcctv	%g5,	%l3,	%i3
	alignaddr	%l5,	%i7,	%o4
	add	%i6,	0x0B79,	%g2
	ta	%icc,	0x0
	edge8l	%i0,	%g7,	%i5
	fpadd16s	%f27,	%f22,	%f4
	movge	%xcc,	%l1,	%g3
	edge8n	%o3,	%o7,	%o2
	fmovrse	%l6,	%f29,	%f17
	xnor	%o0,	0x0DDB,	%i1
	subccc	%g1,	0x105A,	%l4
	edge32n	%i4,	%i2,	%l0
	sethi	0x1919,	%o5
	edge16l	%g4,	%g6,	%l2
	umul	%o1,	0x058E,	%o6
	movleu	%xcc,	%g5,	%l3
	subcc	%l5,	%i7,	%o4
	andn	%i6,	%g2,	%i3
	srlx	%i0,	0x0B,	%g7
	bl,a	%xcc,	loop_1459
	movvs	%icc,	%l1,	%i5
	fmovdge	%xcc,	%f30,	%f2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
loop_1459:
	fmuld8ulx16	%f30,	%f0,	%f24
	umul	%o7,	%o3,	%o2
	umulcc	%l6,	%o0,	%g1
	sub	%i1,	0x0146,	%l4
	bn,a,pt	%xcc,	loop_1460
	movrgz	%i2,	%l0,	%i4
	tsubcctv	%g4,	%g6,	%l2
	tneg	%icc,	0x5
loop_1460:
	edge8l	%o1,	%o6,	%o5
	nop
	set	0x3A, %o1
	lduh	[%l7 + %o1],	%g5
	ldsh	[%l7 + 0x78],	%l5
	xorcc	%i7,	%o4,	%l3
	te	%icc,	0x3
	membar	0x41
	membar	0x17
	nop
	setx	loop_1461,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%icc,	%g2,	%i3
	fmovdle	%xcc,	%f6,	%f15
	edge16ln	%i6,	%i0,	%g7
loop_1461:
	movg	%xcc,	%i5,	%g3
	fbge,a	%fcc3,	loop_1462
	fmovrdgez	%o7,	%f16,	%f24
	udivcc	%o3,	0x0BD5,	%l1
	fbge	%fcc3,	loop_1463
loop_1462:
	nop
	set	0x2C, %l2
	sth	%o2,	[%l7 + %l2]
	fnors	%f8,	%f25,	%f20
	alignaddr	%l6,	%g1,	%o0
loop_1463:
	sdivx	%l4,	0x109A,	%i2
	xor	%i1,	0x1E19,	%l0
	movle	%icc,	%g4,	%g6
	fpadd16s	%f29,	%f10,	%f25
	set	0x08, %g4
	ldxa	[%l7 + %g4] 0x15,	%l2
	add	%o1,	0x000B,	%i4
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x3
	subcc	%g5,	0x11C0,	%l5
	movrlz	%o6,	0x0F6,	%o4
	call	loop_1464
	bge,pn	%icc,	loop_1465
	movg	%xcc,	%l3,	%g2
	sethi	0x1D46,	%i3
loop_1464:
	fnegs	%f3,	%f11
loop_1465:
	movrlez	%i6,	%i7,	%i0
	fba	%fcc1,	loop_1466
	subc	%i5,	%g3,	%g7
	fmul8x16al	%f17,	%f26,	%f2
	fbge	%fcc0,	loop_1467
loop_1466:
	movrne	%o7,	%l1,	%o2
	fpsub32	%f20,	%f14,	%f6
	orcc	%o3,	%l6,	%g1
loop_1467:
	fpadd16s	%f10,	%f14,	%f27
	movvc	%xcc,	%l4,	%o0
	movneg	%xcc,	%i2,	%i1
	subccc	%g4,	%g6,	%l2
	srlx	%o1,	%l0,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovrde	%g5,	%f22,	%f0
	ta	%icc,	0x0
	bshuffle	%f0,	%f0,	%f28
	fmovrdlz	%l5,	%f22,	%f2
	set	0x50, %l3
	ldswa	[%l7 + %l3] 0x88,	%o5
	edge32n	%o4,	%o6,	%g2
	fpack16	%f24,	%f23
	movre	%l3,	%i3,	%i6
	set	0x54, %g6
	sta	%f21,	[%l7 + %g6] 0x0c
	fbne,a	%fcc2,	loop_1468
	edge16l	%i7,	%i5,	%g3
	fpadd32s	%f13,	%f24,	%f4
	bneg,a,pn	%icc,	loop_1469
loop_1468:
	udivx	%i0,	0x0D1F,	%o7
	prefetch	[%l7 + 0x70],	 0x3
	fmovsvc	%icc,	%f7,	%f9
loop_1469:
	edge16ln	%g7,	%o2,	%o3
	tle	%icc,	0x0
	edge32	%l6,	%l1,	%g1
	edge16l	%o0,	%l4,	%i1
	brgz	%i2,	loop_1470
	tcc	%xcc,	0x1
	movrlz	%g4,	0x071,	%l2
	and	%o1,	%g6,	%i4
loop_1470:
	sir	0x195E
	movrlz	%g5,	0x0E5,	%l0
	fbue	%fcc2,	loop_1471
	ldd	[%l7 + 0x30],	%f30
	ble,pt	%xcc,	loop_1472
	fmovsg	%xcc,	%f9,	%f0
loop_1471:
	fabsd	%f26,	%f10
	fbg	%fcc2,	loop_1473
loop_1472:
	bne,pt	%xcc,	loop_1474
	movrlz	%l5,	%o5,	%o4
	fpadd16s	%f14,	%f18,	%f23
loop_1473:
	mulscc	%g2,	0x1461,	%l3
loop_1474:
	mova	%icc,	%i3,	%o6
	sll	%i7,	%i6,	%g3
	srl	%i0,	%i5,	%o7
	umulcc	%o2,	%g7,	%l6
	fmovdcc	%icc,	%f12,	%f25
	mulscc	%o3,	%g1,	%o0
	smulcc	%l4,	0x0D76,	%i1
	fpack32	%f16,	%f24,	%f0
	addcc	%l1,	0x17AE,	%g4
	fmovsn	%xcc,	%f14,	%f16
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	xor	%o1,	%i2,	%i4
	tsubcc	%g6,	0x1DBC,	%l0
	fnot1s	%f5,	%f8
	brnz	%g5,	loop_1475
	sllx	%l5,	%o5,	%g2
	xnor	%o4,	0x017A,	%i3
	movrlez	%o6,	0x3D0,	%l3
loop_1475:
	fpsub32s	%f11,	%f5,	%f15
	sllx	%i6,	0x19,	%i7
	sll	%i0,	%i5,	%o7
	edge32l	%o2,	%g3,	%g7
	or	%o3,	0x13C8,	%l6
	edge16	%g1,	%o0,	%l4
	sdivx	%l1,	0x1E93,	%g4
	movrgz	%l2,	0x1A6,	%o1
	movg	%xcc,	%i2,	%i4
	fsrc1s	%f19,	%f21
	movvc	%xcc,	%i1,	%g6
	sll	%l0,	0x1A,	%l5
	umulcc	%g5,	%g2,	%o5
	tgu	%xcc,	0x4
	mulscc	%o4,	0x1240,	%i3
	array8	%l3,	%i6,	%i7
	mova	%xcc,	%o6,	%i5
	movne	%xcc,	%o7,	%i0
	swap	[%l7 + 0x3C],	%g3
	pdist	%f20,	%f0,	%f8
	and	%o2,	%o3,	%l6
	udivx	%g7,	0x1548,	%g1
	st	%f1,	[%l7 + 0x78]
	movge	%xcc,	%o0,	%l4
	movrne	%l1,	%l2,	%o1
	bcs,a	loop_1476
	bleu,a	%xcc,	loop_1477
	ta	%icc,	0x1
	sdivx	%g4,	0x1ED6,	%i2
loop_1476:
	popc	0x0E95,	%i1
loop_1477:
	bne	loop_1478
	movneg	%icc,	%i4,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x3C
loop_1478:
	sra	%l5,	0x05,	%g5
	sdiv	%g2,	0x0476,	%l0
	bge,a	%icc,	loop_1479
	sdivx	%o5,	0x02F5,	%i3
	edge16	%o4,	%l3,	%i6
	fba	%fcc0,	loop_1480
loop_1479:
	tsubcctv	%o6,	%i7,	%i5
	fmovdcs	%xcc,	%f18,	%f23
	tvc	%icc,	0x6
loop_1480:
	fnot1	%f22,	%f12
	udiv	%o7,	0x1BCA,	%i0
	tgu	%xcc,	0x6
	fmovrse	%g3,	%f25,	%f3
	array8	%o2,	%o3,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brnz	%g1,	loop_1481
	edge32ln	%o0,	%g7,	%l4
	tsubcctv	%l2,	0x0F2D,	%l1
	tneg	%xcc,	0x7
loop_1481:
	fpadd32	%f6,	%f30,	%f18
	tleu	%icc,	0x5
	xor	%o1,	%i2,	%g4
	bne,a	loop_1482
	tpos	%xcc,	0x1
	udivcc	%i1,	0x07F2,	%i4
	mulscc	%l5,	%g6,	%g2
loop_1482:
	sllx	%g5,	%l0,	%i3
	ldd	[%l7 + 0x70],	%o4
	movne	%xcc,	%l3,	%i6
	fblg	%fcc0,	loop_1483
	fcmpeq16	%f14,	%f26,	%o6
	andncc	%i7,	%i5,	%o4
	ba,pn	%icc,	loop_1484
loop_1483:
	ld	[%l7 + 0x1C],	%f25
	fmul8sux16	%f12,	%f12,	%f8
	ldd	[%l7 + 0x08],	%i0
loop_1484:
	sdiv	%g3,	0x1946,	%o2
	sll	%o7,	%l6,	%o3
	bl,pt	%icc,	loop_1485
	srl	%g1,	%g7,	%o0
	tsubcctv	%l2,	%l1,	%l4
	movleu	%icc,	%o1,	%i2
loop_1485:
	edge8ln	%g4,	%i1,	%l5
	tn	%xcc,	0x0
	movrgz	%g6,	0x2CC,	%i4
	sub	%g5,	0x00A3,	%g2
	set	0x0C, %i1
	ldstuba	[%l7 + %i1] 0x80,	%i3
	fpadd32	%f28,	%f24,	%f2
	movpos	%icc,	%l0,	%o5
	fxor	%f10,	%f2,	%f20
	srlx	%i6,	%o6,	%l3
	srl	%i5,	0x05,	%o4
	movne	%xcc,	%i7,	%i0
	umulcc	%o2,	0x1718,	%o7
	edge16ln	%g3,	%o3,	%g1
	edge32n	%l6,	%g7,	%l2
	bn	%xcc,	loop_1486
	fbo	%fcc1,	loop_1487
	smul	%o0,	%l4,	%l1
	xnor	%i2,	0x0893,	%o1
loop_1486:
	fandnot1s	%f3,	%f11,	%f1
loop_1487:
	fxors	%f5,	%f26,	%f27
	alignaddrl	%i1,	%l5,	%g6
	fble,a	%fcc2,	loop_1488
	fmovdpos	%xcc,	%f7,	%f20
	sllx	%i4,	0x09,	%g4
	xnorcc	%g5,	0x04A1,	%g2
loop_1488:
	movcc	%icc,	%l0,	%o5
	udivx	%i6,	0x1F97,	%i3
	stx	%o6,	[%l7 + 0x50]
	sir	0x1765
	edge8n	%l3,	%i5,	%i7
	bl	loop_1489
	move	%icc,	%i0,	%o2
	nop
	setx	loop_1490,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sll	%o7,	%g3,	%o3
loop_1489:
	xorcc	%g1,	%o4,	%l6
	mulscc	%l2,	%o0,	%g7
loop_1490:
	fmovrslz	%l4,	%f26,	%f23
	tgu	%xcc,	0x5
	fmovdge	%icc,	%f8,	%f24
	fmovsneg	%icc,	%f26,	%f22
	fmovdneg	%icc,	%f29,	%f15
	fmovdvc	%icc,	%f7,	%f22
	fandnot1s	%f29,	%f25,	%f19
	movrgez	%l1,	%o1,	%i1
	set	0x22, %i3
	lduha	[%l7 + %i3] 0x89,	%l5
	fandnot1s	%f0,	%f3,	%f21
	taddcctv	%i2,	%g6,	%i4
	nop
	setx loop_1491, %l0, %l1
	jmpl %l1, %g5
	sll	%g4,	%g2,	%o5
	fbg,a	%fcc3,	loop_1492
	movre	%l0,	%i3,	%o6
loop_1491:
	lduh	[%l7 + 0x60],	%i6
	movrne	%l3,	%i7,	%i5
loop_1492:
	bg,a	%xcc,	loop_1493
	srlx	%i0,	0x12,	%o7
	movle	%xcc,	%o2,	%g3
	movrlez	%g1,	0x068,	%o4
loop_1493:
	fand	%f20,	%f18,	%f14
	movvs	%xcc,	%o3,	%l6
	fmovs	%f24,	%f12
	tpos	%icc,	0x1
	fbn	%fcc1,	loop_1494
	sub	%o0,	0x1197,	%g7
	tpos	%xcc,	0x6
	membar	0x6F
loop_1494:
	fmovsvc	%icc,	%f4,	%f29
	addc	%l4,	%l1,	%l2
	set	0x38, %i0
	stxa	%i1,	[%l7 + %i0] 0x81
	tne	%xcc,	0x7
	movgu	%icc,	%l5,	%i2
	edge16n	%o1,	%g6,	%i4
	fpadd32	%f12,	%f14,	%f4
	movrgez	%g5,	0x1CF,	%g2
	movrgez	%o5,	%l0,	%g4
	movvc	%xcc,	%o6,	%i6
	movn	%xcc,	%l3,	%i3
	tsubcctv	%i7,	%i0,	%o7
	set	0x2E, %o7
	stha	%i5,	[%l7 + %o7] 0x04
	fnegd	%f2,	%f12
	fba	%fcc1,	loop_1495
	tn	%xcc,	0x1
	fcmple16	%f24,	%f14,	%o2
	addcc	%g1,	%g3,	%o4
loop_1495:
	fmovsa	%xcc,	%f15,	%f29
	tsubcctv	%l6,	%o0,	%g7
	lduw	[%l7 + 0x78],	%o3
	edge32	%l1,	%l4,	%i1
	andncc	%l2,	%i2,	%l5
	wr	%g0,	0x11,	%asi
	sta	%f30,	[%l7 + 0x4C] %asi
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x60] %asi,	%f28
	umul	%g6,	%i4,	%g5
	bn,a	loop_1496
	tneg	%xcc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ble,a	%icc,	loop_1497
loop_1496:
	sdivcc	%g2,	0x1B41,	%o5
	set	0x20, %l6
	stwa	%l0,	[%l7 + %l6] 0xea
	membar	#Sync
loop_1497:
	srlx	%g4,	0x16,	%o6
	fmovrdlz	%o1,	%f10,	%f8
	fbe,a	%fcc0,	loop_1498
	tl	%icc,	0x1
	set	0x1C, %g3
	ldstuba	[%l7 + %g3] 0x0c,	%l3
loop_1498:
	array8	%i3,	%i7,	%i6
	subc	%i0,	0x10CB,	%o7
	edge16ln	%i5,	%g1,	%g3
	andcc	%o2,	%o4,	%o0
	fornot1	%f18,	%f30,	%f14
	mova	%icc,	%g7,	%o3
	lduw	[%l7 + 0x7C],	%l1
	bg,a,pt	%icc,	loop_1499
	subccc	%l6,	%i1,	%l2
	fand	%f10,	%f6,	%f30
	bgu	loop_1500
loop_1499:
	tneg	%xcc,	0x4
	udivcc	%l4,	0x05BE,	%l5
	faligndata	%f10,	%f0,	%f2
loop_1500:
	fandnot1s	%f3,	%f27,	%f1
	bl,a,pt	%icc,	loop_1501
	taddcctv	%g6,	%i2,	%g5
	fandnot2	%f26,	%f6,	%f10
	fcmpeq32	%f30,	%f24,	%i4
loop_1501:
	lduw	[%l7 + 0x10],	%g2
	tvc	%icc,	0x6
	fmovsvc	%icc,	%f30,	%f15
	fmovrsne	%o5,	%f9,	%f15
	fbn,a	%fcc2,	loop_1502
	edge32ln	%g4,	%l0,	%o6
	stw	%o1,	[%l7 + 0x44]
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%i3
loop_1502:
	brz,a	%i6,	loop_1503
	brnz	%i0,	loop_1504
	movleu	%xcc,	%i7,	%i5
	smulcc	%o7,	0x194B,	%g1
loop_1503:
	fmovdneg	%icc,	%f17,	%f5
loop_1504:
	ldx	[%l7 + 0x60],	%g3
	stbar
	xnor	%o2,	%o4,	%g7
	srlx	%o3,	0x16,	%o0
	add	%l6,	0x15A3,	%i1
	edge32	%l2,	%l1,	%l4
	fbn,a	%fcc2,	loop_1505
	movgu	%xcc,	%l5,	%g6
	popc	0x04B0,	%i2
	ta	%icc,	0x6
loop_1505:
	ldsb	[%l7 + 0x79],	%i4
	orncc	%g2,	%g5,	%g4
	addccc	%l0,	%o5,	%o6
	fmul8ulx16	%f4,	%f18,	%f30
	popc	0x0DBF,	%l3
	bl	loop_1506
	srl	%i3,	0x0A,	%o1
	tsubcctv	%i0,	%i6,	%i7
	mulx	%o7,	0x0EBA,	%g1
loop_1506:
	movvs	%icc,	%g3,	%i5
	fbe,a	%fcc2,	loop_1507
	fones	%f24
	movrgez	%o4,	0x0F9,	%o2
	tcs	%xcc,	0x2
loop_1507:
	xorcc	%g7,	0x1438,	%o3
	udiv	%l6,	0x19E0,	%i1
	fpackfix	%f8,	%f2
	fba,a	%fcc1,	loop_1508
	sdivx	%o0,	0x1032,	%l2
	umul	%l4,	%l1,	%l5
	fsrc1s	%f30,	%f22
loop_1508:
	alignaddrl	%g6,	%i2,	%g2
	fbn,a	%fcc1,	loop_1509
	movne	%xcc,	%i4,	%g5
	array16	%l0,	%g4,	%o6
	and	%o5,	0x127C,	%l3
loop_1509:
	fbug	%fcc2,	loop_1510
	bg,pt	%icc,	loop_1511
	or	%i3,	0x00E0,	%i0
	fmul8x16	%f31,	%f8,	%f20
loop_1510:
	fmovdpos	%xcc,	%f2,	%f9
loop_1511:
	movcs	%icc,	%i6,	%o1
	lduh	[%l7 + 0x1A],	%i7
	umul	%g1,	0x1136,	%g3
	fmovsneg	%icc,	%f4,	%f25
	fzeros	%f16
	fmul8x16al	%f11,	%f27,	%f20
	sdiv	%o7,	0x125D,	%i5
	sub	%o2,	%g7,	%o4
	edge32l	%o3,	%i1,	%l6
	fbule,a	%fcc1,	loop_1512
	taddcc	%l2,	%l4,	%o0
	sllx	%l1,	0x12,	%g6
	movl	%xcc,	%l5,	%i2
loop_1512:
	bg,pn	%icc,	loop_1513
	mulx	%g2,	0x0FEA,	%g5
	nop
	setx loop_1514, %l0, %l1
	jmpl %l1, %i4
	tneg	%icc,	0x5
loop_1513:
	subccc	%l0,	%g4,	%o6
	addccc	%l3,	0x1B4D,	%o5
loop_1514:
	movrgez	%i0,	0x3E5,	%i6
	tvs	%xcc,	0x3
	edge8n	%i3,	%i7,	%o1
	udivx	%g3,	0x166A,	%o7
	fbue	%fcc2,	loop_1515
	bn,a,pn	%icc,	loop_1516
	udivx	%g1,	0x0132,	%i5
	array16	%g7,	%o4,	%o3
loop_1515:
	edge32l	%o2,	%i1,	%l2
loop_1516:
	edge32l	%l6,	%l4,	%o0
	ta	%icc,	0x0
	sdiv	%g6,	0x0883,	%l5
	or	%i2,	%g2,	%g5
	movgu	%icc,	%l1,	%l0
	movrlez	%i4,	0x21C,	%g4
	stw	%o6,	[%l7 + 0x38]
	fandnot1	%f20,	%f26,	%f24
	subc	%l3,	0x0E8B,	%i0
	add	%o5,	0x1E7B,	%i6
	sdiv	%i3,	0x0F95,	%o1
	fnors	%f14,	%f8,	%f19
	fmovse	%icc,	%f24,	%f25
	membar	0x6A
	movgu	%xcc,	%g3,	%i7
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g1
	fbo	%fcc1,	loop_1517
	std	%o6,	[%l7 + 0x10]
	ba	%icc,	loop_1518
	movcc	%xcc,	%g7,	%o4
loop_1517:
	smulcc	%o3,	0x08D8,	%i5
	popc	%o2,	%i1
loop_1518:
	fmovrslz	%l2,	%f14,	%f24
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x53] %asi,	%l4
	sdivx	%o0,	0x0D37,	%g6
	ldstub	[%l7 + 0x14],	%l5
	subcc	%l6,	0x1F00,	%g2
	andn	%i2,	%g5,	%l0
	fblg	%fcc1,	loop_1519
	umulcc	%i4,	%g4,	%o6
	fmovdvs	%xcc,	%f16,	%f4
	movcs	%icc,	%l1,	%i0
loop_1519:
	movl	%icc,	%o5,	%i6
	nop
	setx	loop_1520,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x28, %o5
	ldd	[%l7 + %o5],	%f4
	set	0x50, %g2
	ldda	[%l7 + %g2] 0x24,	%i2
loop_1520:
	or	%l3,	%o1,	%i7
	fcmpeq32	%f16,	%f4,	%g3
	lduw	[%l7 + 0x14],	%o7
	mulx	%g1,	0x1A4A,	%g7
	movn	%xcc,	%o4,	%i5
	tle	%icc,	0x2
	st	%f1,	[%l7 + 0x68]
	movneg	%icc,	%o2,	%o3
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
	tleu	%icc,	0x5
	brlez,a	%l2,	loop_1521
	udivx	%i1,	0x1D15,	%o0
	fnot1s	%f4,	%f13
	brgez	%g6,	loop_1522
loop_1521:
	movrgez	%l5,	0x1EE,	%l4
	array32	%g2,	%l6,	%g5
	ldub	[%l7 + 0x6F],	%l0
loop_1522:
	sethi	0x1EC0,	%i4
	fbn,a	%fcc3,	loop_1523
	fmovscs	%xcc,	%f31,	%f7
	tcs	%icc,	0x7
	siam	0x0
loop_1523:
	tvs	%icc,	0x0
	tn	%xcc,	0x3
	stx	%g4,	[%l7 + 0x78]
	bge,pt	%icc,	loop_1524
	fmovrse	%i2,	%f26,	%f7
	fmovsvc	%xcc,	%f31,	%f9
	tcc	%icc,	0x2
loop_1524:
	flush	%l7 + 0x10
	tsubcctv	%l1,	%o6,	%o5
	nop
	set	0x79, %g1
	stb	%i0,	[%l7 + %g1]
	fmul8x16au	%f29,	%f24,	%f2
	tl	%xcc,	0x2
	mulscc	%i3,	%i6,	%l3
	subcc	%o1,	%i7,	%g3
	brnz	%g1,	loop_1525
	edge16n	%o7,	%o4,	%g7
	orcc	%i5,	0x0C28,	%o3
	sdivx	%o2,	0x017E,	%i1
loop_1525:
	nop
	wr	%g0,	0x81,	%asi
	stba	%o0,	[%l7 + 0x79] %asi
	bge,pn	%xcc,	loop_1526
	ble,a,pt	%icc,	loop_1527
	movrlz	%l2,	%g6,	%l4
	fpadd32s	%f30,	%f28,	%f16
loop_1526:
	sra	%g2,	%l5,	%g5
loop_1527:
	xnorcc	%l6,	%l0,	%g4
	set	0x55, %i6
	ldsba	[%l7 + %i6] 0x19,	%i4
	fbl	%fcc3,	loop_1528
	fnand	%f10,	%f6,	%f18
	movrgz	%l1,	%i2,	%o6
	movl	%xcc,	%o5,	%i0
loop_1528:
	fmovsge	%xcc,	%f26,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc0,	%f25,	%f2
	tleu	%xcc,	0x7
	edge16n	%i3,	%i6,	%l3
	array8	%i7,	%o1,	%g1
	taddcc	%g3,	0x187E,	%o7
	tn	%icc,	0x7
	fandnot2	%f30,	%f26,	%f24
	array8	%o4,	%g7,	%i5
	edge8n	%o3,	%i1,	%o2
	fnors	%f12,	%f21,	%f5
	array32	%l2,	%g6,	%l4
	srl	%o0,	%g2,	%l5
	be,a	loop_1529
	edge8n	%g5,	%l6,	%g4
	fmovsl	%icc,	%f19,	%f7
	edge16n	%l0,	%l1,	%i4
loop_1529:
	fpmerge	%f22,	%f16,	%f28
	edge8ln	%i2,	%o6,	%i0
	move	%xcc,	%o5,	%i3
	taddcc	%l3,	%i7,	%o1
	fbu	%fcc2,	loop_1530
	and	%i6,	0x0D42,	%g1
	wr	%g0,	0x81,	%asi
	stba	%o7,	[%l7 + 0x14] %asi
loop_1530:
	fcmpgt16	%f28,	%f0,	%o4
	set	0x70, %o3
	stha	%g3,	[%l7 + %o3] 0x2f
	membar	#Sync
	fbule	%fcc1,	loop_1531
	bgu,a	loop_1532
	fpadd32	%f4,	%f14,	%f22
	sdivcc	%g7,	0x1383,	%i5
loop_1531:
	taddcc	%i1,	0x1FBE,	%o2
loop_1532:
	fmovrdne	%l2,	%f10,	%f6
	nop
	set	0x72, %l4
	ldsh	[%l7 + %l4],	%o3
	smulcc	%g6,	%o0,	%l4
	bcs,a,pn	%xcc,	loop_1533
	addccc	%g2,	0x09D0,	%g5
	edge32ln	%l5,	%g4,	%l6
	movle	%xcc,	%l1,	%l0
loop_1533:
	sll	%i4,	%i2,	%i0
	edge32ln	%o5,	%i3,	%l3
	bcc,a,pt	%icc,	loop_1534
	ldd	[%l7 + 0x20],	%i6
	mulx	%o6,	0x104A,	%i6
	sdivcc	%o1,	0x119A,	%g1
loop_1534:
	fcmpgt32	%f6,	%f16,	%o7
	call	loop_1535
	fmovsneg	%icc,	%f2,	%f31
	tgu	%xcc,	0x7
	movvc	%xcc,	%o4,	%g7
loop_1535:
	array32	%i5,	%g3,	%i1
	fmul8ulx16	%f4,	%f14,	%f18
	or	%o2,	%l2,	%o3
	sir	0x129B
	and	%o0,	0x10AB,	%g6
	tvs	%icc,	0x7
	tvc	%xcc,	0x5
	movrne	%l4,	0x09E,	%g2
	xor	%g5,	%g4,	%l5
	fmovsle	%icc,	%f23,	%f26
	brnz	%l6,	loop_1536
	movcc	%icc,	%l1,	%i4
	movvc	%icc,	%l0,	%i0
	edge32l	%o5,	%i2,	%l3
loop_1536:
	sdivx	%i7,	0x17DF,	%i3
	fxnor	%f24,	%f24,	%f12
	tne	%icc,	0x7
	movrgz	%i6,	%o6,	%g1
	fcmpeq16	%f26,	%f16,	%o1
	fmovscs	%icc,	%f4,	%f31
	subcc	%o7,	0x0784,	%o4
	sll	%g7,	%i5,	%i1
	fone	%f20
	udiv	%g3,	0x007E,	%o2
	fmovrdne	%l2,	%f6,	%f8
	ta	%icc,	0x6
	edge8	%o0,	%o3,	%g6
	tn	%xcc,	0x1
	array32	%g2,	%l4,	%g5
	tl	%icc,	0x4
	sub	%g4,	0x1FC4,	%l6
	movne	%xcc,	%l5,	%i4
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x5C] %asi,	%l1
	fmovscs	%xcc,	%f30,	%f1
	flush	%l7 + 0x50
	fbge	%fcc2,	loop_1537
	umul	%i0,	%l0,	%i2
	umul	%l3,	%i7,	%o5
	ble	%xcc,	loop_1538
loop_1537:
	faligndata	%f6,	%f12,	%f10
	bleu,a,pt	%xcc,	loop_1539
	fmovsg	%icc,	%f13,	%f22
loop_1538:
	movvs	%xcc,	%i6,	%o6
	membar	0x1C
loop_1539:
	tle	%icc,	0x1
	ba,a	%icc,	loop_1540
	andncc	%g1,	%i3,	%o1
	bgu,a	%xcc,	loop_1541
	tle	%xcc,	0x0
loop_1540:
	fmovrdne	%o4,	%f16,	%f0
	fandnot2s	%f20,	%f27,	%f14
loop_1541:
	nop
	set	0x25, %l5
	ldstub	[%l7 + %l5],	%g7
	fmovda	%xcc,	%f19,	%f0
	fmovsn	%xcc,	%f24,	%f19
	movrgez	%i5,	0x1FC,	%o7
	call	loop_1542
	or	%g3,	0x08C3,	%i1
	udiv	%l2,	0x0ADD,	%o0
	edge32ln	%o2,	%g6,	%g2
loop_1542:
	or	%l4,	%g5,	%g4
	mulscc	%o3,	0x0ABE,	%l5
	addc	%i4,	%l6,	%i0
	fmovd	%f6,	%f6
	ldx	[%l7 + 0x08],	%l1
	smulcc	%l0,	0x0E0E,	%l3
	edge8l	%i2,	%i7,	%o5
	fmovrsne	%o6,	%f26,	%f16
	fands	%f17,	%f13,	%f18
	fmovdgu	%xcc,	%f23,	%f8
	nop
	set	0x3C, %i2
	ldsw	[%l7 + %i2],	%i6
	srl	%i3,	0x1D,	%g1
	call	loop_1543
	mulx	%o1,	0x16E9,	%g7
	tleu	%icc,	0x4
	ble,a,pt	%icc,	loop_1544
loop_1543:
	fbug,a	%fcc1,	loop_1545
	add	%o4,	0x138C,	%i5
	mulscc	%o7,	0x17A9,	%g3
loop_1544:
	fmovde	%icc,	%f27,	%f18
loop_1545:
	or	%i1,	%l2,	%o0
	fbug	%fcc1,	loop_1546
	tgu	%xcc,	0x7
	fcmpgt32	%f6,	%f12,	%g6
	bcc,a	%icc,	loop_1547
loop_1546:
	taddcctv	%g2,	0x0802,	%o2
	std	%f10,	[%l7 + 0x70]
	fmovspos	%icc,	%f3,	%f8
loop_1547:
	stb	%l4,	[%l7 + 0x0D]
	bvs	loop_1548
	fmovd	%f10,	%f16
	fbe	%fcc0,	loop_1549
	taddcc	%g5,	%o3,	%g4
loop_1548:
	fmovdvs	%icc,	%f11,	%f4
	call	loop_1550
loop_1549:
	bpos,a,pt	%icc,	loop_1551
	prefetch	[%l7 + 0x18],	 0x1
	fmovspos	%icc,	%f2,	%f5
loop_1550:
	srl	%i4,	0x07,	%l6
loop_1551:
	stw	%l5,	[%l7 + 0x6C]
	set	0x5C, %i4
	swapa	[%l7 + %i4] 0x10,	%l1
	sub	%i0,	%l0,	%l3
	tsubcctv	%i2,	%o5,	%i7
	fornot1s	%f15,	%f5,	%f12
	movgu	%icc,	%i6,	%i3
	edge16n	%g1,	%o1,	%o6
	movleu	%icc,	%g7,	%o4
	edge32n	%o7,	%g3,	%i1
	tn	%xcc,	0x2
	udivx	%i5,	0x1D17,	%o0
	movvs	%icc,	%l2,	%g2
	subc	%o2,	%g6,	%g5
	brgez,a	%o3,	loop_1552
	srlx	%l4,	0x0F,	%g4
	smul	%l6,	%i4,	%l5
	brlz,a	%i0,	loop_1553
loop_1552:
	nop
	set	0x20, %g7
	stx	%l0,	[%l7 + %g7]
	fmovdleu	%xcc,	%f3,	%f1
	fandnot2	%f14,	%f20,	%f30
loop_1553:
	udiv	%l1,	0x0224,	%l3
	edge16ln	%i2,	%o5,	%i7
	wr	%g0,	0x88,	%asi
	sta	%f3,	[%l7 + 0x68] %asi
	fmovrdne	%i3,	%f20,	%f12
	fmovsa	%xcc,	%f6,	%f12
	movn	%icc,	%g1,	%o1
	edge8	%o6,	%i6,	%o4
	tgu	%icc,	0x0
	brz,a	%g7,	loop_1554
	brz	%g3,	loop_1555
	subcc	%i1,	0x0AD1,	%o7
	ldd	[%l7 + 0x38],	%f12
loop_1554:
	movleu	%xcc,	%i5,	%l2
loop_1555:
	fcmpeq16	%f0,	%f6,	%o0
	fpsub32	%f26,	%f10,	%f24
	array16	%o2,	%g6,	%g5
	fnot1s	%f4,	%f24
	xor	%g2,	%l4,	%o3
	ld	[%l7 + 0x28],	%f9
	udivcc	%l6,	0x113C,	%g4
	smul	%i4,	%l5,	%l0
	and	%l1,	%l3,	%i2
	subccc	%i0,	%i7,	%i3
	brnz,a	%o5,	loop_1556
	or	%o1,	%g1,	%i6
	fcmpne16	%f0,	%f30,	%o4
	add	%g7,	%o6,	%g3
loop_1556:
	fbue	%fcc2,	loop_1557
	sdivx	%i1,	0x08C7,	%o7
	fmovrde	%l2,	%f30,	%f6
	move	%xcc,	%i5,	%o2
loop_1557:
	stw	%o0,	[%l7 + 0x0C]
	edge16l	%g5,	%g6,	%l4
	movrlz	%o3,	%g2,	%g4
	movne	%icc,	%i4,	%l6
	tg	%icc,	0x0
	orncc	%l5,	%l1,	%l3
	fmul8x16al	%f30,	%f13,	%f20
	tge	%xcc,	0x5
	edge32	%i2,	%i0,	%i7
	tg	%xcc,	0x2
	fpsub16	%f20,	%f24,	%f4
	addcc	%l0,	0x0FA0,	%i3
	fmovse	%xcc,	%f7,	%f29
	xnorcc	%o1,	0x0259,	%g1
	srlx	%o5,	0x07,	%i6
	fmovrsgez	%o4,	%f25,	%f3
	xnorcc	%g7,	0x1F33,	%g3
	fsrc2s	%f3,	%f22
	array32	%o6,	%o7,	%l2
	tsubcc	%i1,	%i5,	%o2
	movrlz	%g5,	0x28B,	%g6
	fmovdgu	%xcc,	%f1,	%f12
	edge16l	%o0,	%o3,	%g2
	fmovrslez	%l4,	%f24,	%f3
	sdivcc	%i4,	0x1BAF,	%l6
	fcmpes	%fcc0,	%f25,	%f14
	xnorcc	%l5,	%g4,	%l1
	movn	%xcc,	%l3,	%i2
	sra	%i7,	0x0A,	%l0
	array8	%i0,	%o1,	%g1
	fmovrsgz	%o5,	%f25,	%f26
	alignaddrl	%i6,	%o4,	%g7
	edge32n	%g3,	%i3,	%o6
	edge8	%l2,	%i1,	%i5
	movgu	%icc,	%o7,	%o2
	fcmple16	%f30,	%f22,	%g5
	addcc	%o0,	0x0F7D,	%g6
	fbne	%fcc3,	loop_1558
	subcc	%g2,	%l4,	%o3
	movleu	%icc,	%l6,	%l5
	fbl,a	%fcc1,	loop_1559
loop_1558:
	lduh	[%l7 + 0x0E],	%i4
	add	%l1,	%l3,	%i2
	tcs	%icc,	0x6
loop_1559:
	srax	%i7,	%l0,	%i0
	fandnot1	%f0,	%f4,	%f4
	smulcc	%g4,	%o1,	%g1
	fnot2s	%f6,	%f29
	popc	%i6,	%o5
	brnz,a	%g7,	loop_1560
	sir	0x1F5E
	fmovdcc	%icc,	%f6,	%f2
	edge16n	%o4,	%i3,	%g3
loop_1560:
	nop
	set	0x1C, %l0
	ldswa	[%l7 + %l0] 0x04,	%o6
	subccc	%l2,	0x1CEB,	%i1
	movg	%xcc,	%i5,	%o2
	xorcc	%o7,	%o0,	%g6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%g5
	movrne	%l4,	0x134,	%g2
	fbg	%fcc3,	loop_1561
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o3,	0x1E,	%l6
	array32	%l5,	%i4,	%l3
loop_1561:
	movne	%icc,	%l1,	%i2
	fbe	%fcc0,	loop_1562
	movrgez	%i7,	%l0,	%i0
	ldsw	[%l7 + 0x38],	%o1
	set	0x0, %i5
	ldxa	[%g0 + %i5] 0x58,	%g1
loop_1562:
	sdivcc	%i6,	0x1018,	%g4
	xorcc	%o5,	%g7,	%o4
	fcmpes	%fcc0,	%f21,	%f30
	smulcc	%i3,	%g3,	%o6
	sdivx	%l2,	0x15B4,	%i1
	ldsb	[%l7 + 0x1A],	%i5
	fpmerge	%f12,	%f29,	%f0
	movvs	%icc,	%o7,	%o0
	bvs,pt	%icc,	loop_1563
	fpackfix	%f6,	%f21
	set	0x6C, %o0
	swapa	[%l7 + %o0] 0x19,	%g6
loop_1563:
	edge8	%g5,	%l4,	%g2
	fmovdvc	%icc,	%f28,	%f27
	subcc	%o2,	0x13A1,	%o3
	tpos	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l5,	%l6,	%i4
	fmovsa	%xcc,	%f13,	%f12
	fpadd16s	%f25,	%f6,	%f13
	movl	%xcc,	%l1,	%l3
	ldd	[%l7 + 0x38],	%f2
	movrlz	%i7,	%l0,	%i2
	ta	%xcc,	0x7
	edge16	%i0,	%g1,	%o1
	fmovdge	%xcc,	%f0,	%f5
	tsubcctv	%g4,	%i6,	%o5
	andcc	%o4,	0x0C24,	%g7
	tvs	%icc,	0x6
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x60] %asi,	%g2
	brnz	%i3,	loop_1564
	tsubcctv	%o6,	0x12BD,	%i1
	smulcc	%i5,	0x0212,	%o7
	fornot2	%f14,	%f0,	%f4
loop_1564:
	edge8ln	%o0,	%l2,	%g6
	movn	%xcc,	%l4,	%g5
	xnor	%o2,	%o3,	%g2
	sra	%l6,	0x03,	%i4
	fmovscs	%xcc,	%f27,	%f10
	movrlez	%l5,	%l1,	%i7
	tneg	%icc,	0x7
	ldub	[%l7 + 0x16],	%l3
	movcs	%xcc,	%i2,	%i0
	edge8l	%g1,	%o1,	%l0
	addcc	%i6,	%g4,	%o4
	tvs	%icc,	0x5
	udiv	%o5,	0x0171,	%g7
	movrlez	%g3,	0x279,	%o6
	sdivx	%i1,	0x10BD,	%i5
	fcmple16	%f8,	%f16,	%i3
	nop
	setx loop_1565, %l0, %l1
	jmpl %l1, %o0
	fpsub16s	%f20,	%f24,	%f27
	xnor	%o7,	%g6,	%l2
	tsubcctv	%g5,	0x1578,	%l4
loop_1565:
	fbl	%fcc1,	loop_1566
	tsubcctv	%o3,	0x1B4D,	%o2
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x38] %asi,	%g2
loop_1566:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x3
	ba,pt	%icc,	loop_1567
	movre	%i4,	0x0B3,	%l5
	wr	%g0,	0x27,	%asi
	stha	%l6,	[%l7 + 0x76] %asi
	membar	#Sync
loop_1567:
	stb	%i7,	[%l7 + 0x54]
	fand	%f6,	%f0,	%f8
	sub	%l1,	0x1296,	%l3
	fmul8x16au	%f13,	%f24,	%f18
	fbue,a	%fcc0,	loop_1568
	edge32l	%i0,	%i2,	%g1
	mulscc	%o1,	0x07FC,	%i6
	tle	%xcc,	0x4
loop_1568:
	movrlez	%l0,	%g4,	%o4
	tleu	%xcc,	0x3
	sdivcc	%g7,	0x19D7,	%o5
	set	0x4C, %o6
	stwa	%o6,	[%l7 + %o6] 0x2a
	membar	#Sync
	fmul8x16	%f31,	%f16,	%f10
	fmovdle	%icc,	%f18,	%f28
	umul	%i1,	%i5,	%i3
	orcc	%g3,	0x1E82,	%o0
	udivcc	%g6,	0x1014,	%o7
	movge	%xcc,	%g5,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x10DB
	fxnors	%f16,	%f9,	%f24
	tle	%icc,	0x1
	bgu,a	%icc,	loop_1569
	fmovd	%f2,	%f14
	sdiv	%o3,	0x0B5A,	%o2
	or	%l4,	0x1AD6,	%g2
loop_1569:
	fmuld8ulx16	%f26,	%f14,	%f0
	or	%i4,	0x0D86,	%l6
	movleu	%xcc,	%l5,	%l1
	addccc	%i7,	0x1118,	%l3
	std	%i2,	[%l7 + 0x60]
	edge32ln	%g1,	%o1,	%i6
	membar	0x11
	movre	%l0,	%g4,	%i0
	fcmpes	%fcc1,	%f31,	%f24
	xnor	%g7,	0x0393,	%o5
	movle	%icc,	%o4,	%i1
	fble,a	%fcc1,	loop_1570
	fornot1s	%f25,	%f13,	%f11
	set	0x58, %l1
	ldsba	[%l7 + %l1] 0x10,	%i5
loop_1570:
	udivx	%o6,	0x093A,	%i3
	movcc	%xcc,	%g3,	%g6
	tneg	%icc,	0x3
	tsubcctv	%o7,	0x15E7,	%g5
	andncc	%l2,	%o3,	%o2
	fpmerge	%f26,	%f14,	%f16
	and	%l4,	%g2,	%o0
	add	%i4,	%l6,	%l1
	fones	%f21
	xorcc	%i7,	0x170E,	%l3
	and	%l5,	0x1759,	%g1
	edge16	%i2,	%o1,	%i6
	sra	%g4,	%l0,	%g7
	movrlz	%o5,	0x174,	%i0
	tleu	%xcc,	0x3
	fcmpd	%fcc0,	%f0,	%f18
	fmul8x16al	%f4,	%f31,	%f30
	tge	%icc,	0x1
	edge16n	%o4,	%i1,	%o6
	umul	%i3,	0x118A,	%g3
	addc	%i5,	%o7,	%g6
	fmuld8sux16	%f9,	%f22,	%f4
	xorcc	%l2,	0x0416,	%g5
	srl	%o2,	0x0E,	%o3
	subc	%l4,	%g2,	%o0
	movcc	%icc,	%i4,	%l6
	ldd	[%l7 + 0x70],	%i6
	fmovdne	%xcc,	%f22,	%f17
	movvc	%icc,	%l3,	%l5
	edge16	%l1,	%g1,	%i2
	fones	%f29
	movle	%xcc,	%i6,	%g4
	alignaddr	%o1,	%g7,	%l0
	array8	%i0,	%o5,	%i1
	tcc	%xcc,	0x1
	xorcc	%o4,	%o6,	%g3
	tcs	%xcc,	0x5
	movleu	%icc,	%i5,	%o7
	wr	%g0,	0x11,	%asi
	stha	%i3,	[%l7 + 0x60] %asi
	nop
	set	0x68, %i7
	sth	%l2,	[%l7 + %i7]
	fmovsg	%xcc,	%f12,	%f27
	fmovrse	%g5,	%f5,	%f31
	sdivx	%o2,	0x1727,	%g6
	xnorcc	%o3,	%g2,	%l4
	movpos	%icc,	%i4,	%o0
	fmovsneg	%icc,	%f3,	%f21
	stw	%i7,	[%l7 + 0x78]
	ba,a	%xcc,	loop_1571
	movrgez	%l6,	0x24D,	%l5
	movneg	%icc,	%l3,	%l1
	brnz	%i2,	loop_1572
loop_1571:
	sdiv	%i6,	0x0826,	%g4
	brgez	%g1,	loop_1573
	fmovdg	%xcc,	%f8,	%f4
loop_1572:
	edge8	%o1,	%g7,	%l0
	fmovdn	%icc,	%f12,	%f21
loop_1573:
	addcc	%i0,	%o5,	%o4
	tpos	%xcc,	0x7
	andcc	%o6,	0x185B,	%i1
	movrlz	%i5,	%g3,	%i3
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o7,	%l2
	addcc	%g5,	0x0622,	%g6
	orn	%o3,	0x0D52,	%g2
	tvc	%xcc,	0x2
	movrlez	%l4,	%o2,	%i4
	fmovsn	%xcc,	%f8,	%f3
	edge32l	%i7,	%l6,	%l5
	fandnot2	%f6,	%f10,	%f20
	set	0x78, %o4
	stwa	%o0,	[%l7 + %o4] 0xe3
	membar	#Sync
	edge16n	%l3,	%i2,	%l1
	fbn	%fcc1,	loop_1574
	st	%f15,	[%l7 + 0x14]
	tneg	%icc,	0x7
	mova	%icc,	%g4,	%g1
loop_1574:
	brgez	%i6,	loop_1575
	fors	%f14,	%f21,	%f5
	fmuld8sux16	%f27,	%f1,	%f16
	tcs	%xcc,	0x3
loop_1575:
	addc	%g7,	%o1,	%l0
	stb	%o5,	[%l7 + 0x44]
	or	%o4,	%o6,	%i0
	movrlz	%i1,	%g3,	%i5
	orn	%i3,	0x01E4,	%l2
	movrne	%o7,	0x21A,	%g5
	tne	%xcc,	0x7
	st	%f24,	[%l7 + 0x68]
	tvc	%xcc,	0x3
	bleu,a	%xcc,	loop_1576
	edge16	%o3,	%g6,	%g2
	subc	%l4,	%i4,	%i7
	bleu,a	%icc,	loop_1577
loop_1576:
	fands	%f27,	%f19,	%f18
	fpack16	%f10,	%f7
	fbue	%fcc1,	loop_1578
loop_1577:
	fcmpne32	%f10,	%f8,	%l6
	fandnot2s	%f13,	%f5,	%f0
	sub	%l5,	0x0C6C,	%o0
loop_1578:
	sdivx	%o2,	0x0066,	%l3
	sll	%i2,	%g4,	%l1
	sdivcc	%g1,	0x0785,	%i6
	brgez	%o1,	loop_1579
	movne	%icc,	%l0,	%g7
	popc	%o4,	%o5
	sth	%i0,	[%l7 + 0x4E]
loop_1579:
	movrne	%i1,	%g3,	%i5
	fpack32	%f4,	%f26,	%f22
	tneg	%xcc,	0x3
	movle	%icc,	%i3,	%l2
	bl,a	loop_1580
	edge16n	%o7,	%o6,	%o3
	popc	%g5,	%g6
	wr	%g0,	0x81,	%asi
	sta	%f25,	[%l7 + 0x54] %asi
loop_1580:
	orncc	%g2,	0x0483,	%i4
	edge16l	%i7,	%l6,	%l4
	srax	%o0,	%o2,	%l3
	fandnot1s	%f6,	%f27,	%f12
	ldsw	[%l7 + 0x4C],	%l5
	edge32ln	%g4,	%i2,	%l1
	movpos	%xcc,	%i6,	%o1
	fcmpne32	%f20,	%f14,	%g1
	taddcc	%l0,	0x1034,	%o4
	umul	%o5,	0x187C,	%i0
	bcs,pn	%xcc,	loop_1581
	fpsub16	%f12,	%f0,	%f16
	movcc	%xcc,	%g7,	%i1
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%g3
loop_1581:
	sllx	%l2,	0x11,	%o7
	tcs	%icc,	0x2
	tcs	%icc,	0x0
	nop
	set	0x18, %o2
	ldx	[%l7 + %o2],	%i3
	movre	%o3,	0x3AF,	%o6
	fmovrsne	%g6,	%f11,	%f18
	bge,a,pt	%xcc,	loop_1582
	fmovsvc	%icc,	%f0,	%f27
	fmovdn	%xcc,	%f20,	%f15
	movge	%xcc,	%g5,	%g2
loop_1582:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x44] %asi,	%i7
	fblg,a	%fcc3,	loop_1583
	ta	%xcc,	0x3
	fmovrsgez	%l6,	%f23,	%f26
	tsubcc	%l4,	0x0800,	%i4
loop_1583:
	move	%xcc,	%o2,	%l3
	edge8	%l5,	%g4,	%i2
	fand	%f6,	%f26,	%f22
	fmovrdlez	%l1,	%f4,	%f16
	fmovrdlz	%o0,	%f8,	%f24
	tvs	%icc,	0x0
	taddcc	%i6,	0x0687,	%o1
	subc	%l0,	%o4,	%g1
	fbne	%fcc0,	loop_1584
	tcc	%icc,	0x0
	movrgz	%o5,	%g7,	%i0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x70] %asi,	%i1
loop_1584:
	mova	%xcc,	%g3,	%i5
	movn	%xcc,	%l2,	%i3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x24] %asi,	%o7
	orncc	%o3,	%g6,	%o6
	umulcc	%g2,	%g5,	%l6
	lduh	[%l7 + 0x70],	%i7
	mulx	%l4,	%i4,	%o2
	and	%l3,	%g4,	%l5
	movpos	%xcc,	%l1,	%o0
	fbuge	%fcc2,	loop_1585
	movn	%xcc,	%i6,	%o1
	xorcc	%i2,	0x0951,	%o4
	fble	%fcc3,	loop_1586
loop_1585:
	nop
	setx	loop_1587,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sub	%l0,	%o5,	%g1
	fnot1s	%f19,	%f8
loop_1586:
	fbule	%fcc0,	loop_1588
loop_1587:
	movrlez	%g7,	%i0,	%i1
	sra	%g3,	%i5,	%l2
	movg	%icc,	%o7,	%i3
loop_1588:
	std	%g6,	[%l7 + 0x58]
	edge32n	%o3,	%o6,	%g2
	fblg	%fcc0,	loop_1589
	orn	%l6,	%i7,	%g5
	edge32	%i4,	%l4,	%l3
	nop
	setx	loop_1590,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1589:
	lduw	[%l7 + 0x18],	%g4
	movpos	%xcc,	%o2,	%l5
	siam	0x2
loop_1590:
	ldsb	[%l7 + 0x37],	%o0
	array16	%i6,	%l1,	%i2
	orn	%o4,	0x02CF,	%l0
	fbule,a	%fcc1,	loop_1591
	edge32l	%o1,	%g1,	%o5
	tpos	%xcc,	0x7
	movne	%icc,	%g7,	%i0
loop_1591:
	addc	%g3,	0x031E,	%i1
	tcs	%xcc,	0x6
	bleu,pt	%icc,	loop_1592
	tcs	%icc,	0x4
	subcc	%i5,	0x05EF,	%l2
	movcc	%xcc,	%i3,	%o7
loop_1592:
	fbul	%fcc1,	loop_1593
	umul	%g6,	%o6,	%o3
	fble	%fcc3,	loop_1594
	smul	%g2,	%l6,	%i7
loop_1593:
	andncc	%g5,	%i4,	%l4
	edge8n	%g4,	%o2,	%l3
loop_1594:
	umulcc	%o0,	%l5,	%l1
	movrne	%i6,	0x22C,	%i2
	fsrc2	%f28,	%f0
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%o4,	%l0
	movcs	%icc,	%g1,	%o5
	sub	%o1,	0x0A7F,	%i0
	fnands	%f18,	%f29,	%f10
	fbuge	%fcc0,	loop_1595
	sir	0x0E00
	fmovrslz	%g3,	%f25,	%f21
	fmovrsgz	%i1,	%f11,	%f29
loop_1595:
	nop
	setx	loop_1596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd32	%f24,	%f18,	%f16
	movl	%icc,	%g7,	%l2
	bn,a,pt	%icc,	loop_1597
loop_1596:
	sdivx	%i5,	0x1CFF,	%o7
	alignaddrl	%i3,	%o6,	%g6
	tge	%xcc,	0x3
loop_1597:
	fmovde	%icc,	%f12,	%f14
	bvc,pt	%icc,	loop_1598
	udiv	%g2,	0x0684,	%o3
	orncc	%l6,	0x021D,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1598:
	fmul8x16au	%f27,	%f19,	%f8
	fmovd	%f10,	%f22
	swap	[%l7 + 0x3C],	%i7
	std	%f30,	[%l7 + 0x30]
	edge8l	%i4,	%l4,	%o2
	xnorcc	%g4,	0x1F14,	%l3
	addccc	%o0,	0x01A7,	%l5
	fcmpd	%fcc3,	%f30,	%f6
	fpmerge	%f30,	%f16,	%f14
	andncc	%i6,	%l1,	%o4
	ldstub	[%l7 + 0x58],	%i2
	tneg	%xcc,	0x5
	and	%g1,	0x1267,	%o5
	xnorcc	%o1,	%l0,	%g3
	alignaddrl	%i1,	%i0,	%g7
	movne	%icc,	%i5,	%l2
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x10] %asi,	%o6
	fbuge,a	%fcc2,	loop_1599
	fpsub32s	%f0,	%f9,	%f23
	edge16n	%o6,	%g6,	%g2
	edge8ln	%i3,	%l6,	%o3
loop_1599:
	movvc	%xcc,	%g5,	%i7
	movpos	%xcc,	%i4,	%o2
	movl	%xcc,	%g4,	%l3
	orcc	%o0,	%l4,	%l5
	fbug,a	%fcc2,	loop_1600
	movrlez	%l1,	%o4,	%i6
	subc	%i2,	0x08FB,	%g1
	and	%o1,	0x0D33,	%l0
loop_1600:
	fnot1	%f0,	%f14
	brlz,a	%o5,	loop_1601
	fxnors	%f4,	%f16,	%f26
	edge32ln	%i1,	%i0,	%g7
	sllx	%i5,	%l2,	%o7
loop_1601:
	tle	%xcc,	0x1
	alignaddr	%o6,	%g6,	%g2
	fpmerge	%f14,	%f18,	%f2
	fmovdcs	%icc,	%f9,	%f11
	fornot2	%f28,	%f4,	%f6
	movrlez	%g3,	0x2E6,	%l6
	fbul,a	%fcc3,	loop_1602
	fpadd32	%f0,	%f26,	%f30
	fzero	%f22
	movvs	%icc,	%o3,	%g5
loop_1602:
	fmovsne	%icc,	%f11,	%f19
	fmovscc	%xcc,	%f12,	%f9
	fsrc2s	%f30,	%f6
	be,a	loop_1603
	xor	%i3,	0x1524,	%i7
	umulcc	%i4,	%g4,	%o2
	fmovscc	%icc,	%f8,	%f15
loop_1603:
	brgz	%o0,	loop_1604
	fmul8ulx16	%f8,	%f14,	%f16
	edge16n	%l4,	%l3,	%l5
	bg,pn	%xcc,	loop_1605
loop_1604:
	taddcctv	%o4,	0x148F,	%l1
	subccc	%i6,	0x0FA2,	%g1
	set	0x74, %o1
	stha	%o1,	[%l7 + %o1] 0x2f
	membar	#Sync
loop_1605:
	fmovsvc	%icc,	%f26,	%f14
	fcmpgt16	%f8,	%f22,	%l0
	fmovrdgez	%o5,	%f4,	%f4
	sllx	%i1,	%i0,	%i2
	fbl	%fcc2,	loop_1606
	array32	%i5,	%l2,	%o7
	smulcc	%o6,	%g6,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1606:
	fnors	%f8,	%f17,	%f8
	tl	%icc,	0x4
	smul	%g2,	%g3,	%o3
	nop
	setx	loop_1607,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srax	%l6,	%g5,	%i7
	fcmpne16	%f6,	%f14,	%i4
	ble	loop_1608
loop_1607:
	sethi	0x02D0,	%i3
	movrne	%g4,	0x1BF,	%o2
	sdiv	%l4,	0x01CB,	%l3
loop_1608:
	fands	%f14,	%f14,	%f23
	tcs	%xcc,	0x5
	sll	%o0,	%o4,	%l5
	mova	%icc,	%i6,	%l1
	addcc	%o1,	0x15E1,	%g1
	fbule,a	%fcc1,	loop_1609
	tne	%icc,	0x5
	orn	%l0,	%o5,	%i0
	edge8n	%i1,	%i5,	%l2
loop_1609:
	tle	%icc,	0x2
	call	loop_1610
	tne	%xcc,	0x7
	lduw	[%l7 + 0x6C],	%i2
	orn	%o6,	0x1ED1,	%g6
loop_1610:
	movn	%icc,	%g7,	%o7
	fmovsne	%xcc,	%f15,	%f18
	ldx	[%l7 + 0x70],	%g3
	fmovrsgz	%o3,	%f21,	%f12
	xnorcc	%l6,	0x0696,	%g5
	fmovspos	%icc,	%f22,	%f24
	nop
	setx	loop_1611,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%g2,	0x389,	%i7
	fmovsg	%xcc,	%f2,	%f25
	sra	%i4,	%i3,	%g4
loop_1611:
	fones	%f30
	edge8	%l4,	%o2,	%o0
	edge16	%l3,	%l5,	%o4
	smulcc	%i6,	%l1,	%g1
	movcc	%xcc,	%o1,	%o5
	fbul,a	%fcc1,	loop_1612
	movle	%icc,	%i0,	%l0
	srax	%i5,	%i1,	%i2
	movne	%icc,	%l2,	%o6
loop_1612:
	xnor	%g6,	0x0FB1,	%g7
	movneg	%xcc,	%o7,	%g3
	fmovdleu	%icc,	%f23,	%f3
	sdivcc	%l6,	0x1261,	%o3
	fnegs	%f31,	%f17
	fpsub32s	%f9,	%f9,	%f27
	fbne	%fcc3,	loop_1613
	tneg	%xcc,	0x2
	addcc	%g2,	%i7,	%i4
	edge8l	%i3,	%g4,	%g5
loop_1613:
	ldsw	[%l7 + 0x44],	%l4
	movpos	%xcc,	%o0,	%l3
	fmovdneg	%icc,	%f19,	%f14
	sethi	0x1613,	%l5
	fmovdcs	%icc,	%f25,	%f9
	fmovsn	%xcc,	%f30,	%f14
	fmul8x16au	%f20,	%f9,	%f2
	mulx	%o4,	%o2,	%i6
	fpmerge	%f17,	%f15,	%f20
	sdivcc	%g1,	0x102B,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o5,	0x1347,	%i0
	bvs,a	loop_1614
	tvs	%icc,	0x6
	fand	%f10,	%f12,	%f14
	fble,a	%fcc3,	loop_1615
loop_1614:
	stw	%l0,	[%l7 + 0x70]
	add	%l7,	0x34,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%i5
loop_1615:
	fbule	%fcc2,	loop_1616
	fsrc1	%f28,	%f14
	swap	[%l7 + 0x44],	%i1
	xnorcc	%i2,	0x0C7E,	%l2
loop_1616:
	edge16	%o6,	%g7,	%o7
	lduw	[%l7 + 0x5C],	%g3
	fmovsge	%xcc,	%f2,	%f14
	brz,a	%l6,	loop_1617
	subccc	%g6,	%g2,	%o3
	wr	%g0,	0x81,	%asi
	stha	%i4,	[%l7 + 0x3A] %asi
loop_1617:
	stw	%i3,	[%l7 + 0x70]
	fones	%f5
	fmovs	%f5,	%f6
	fbe	%fcc2,	loop_1618
	fmovdcc	%xcc,	%f21,	%f8
	udivcc	%i7,	0x0CA1,	%g4
	tge	%icc,	0x6
loop_1618:
	andn	%g5,	%l4,	%l3
	tl	%icc,	0x4
	subc	%l5,	%o4,	%o2
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
	ldsb	[%l7 + 0x1B],	%i6
	edge16	%g1,	%o0,	%o5
	movneg	%xcc,	%i0,	%l0
loop_1619:
	movge	%icc,	%o1,	%l1
	fmovs	%f15,	%f3
	prefetch	[%l7 + 0x68],	 0x0
	fcmple16	%f22,	%f16,	%i1
	lduw	[%l7 + 0x24],	%i2
	fmovdcs	%icc,	%f21,	%f8
	wr	%g0,	0x11,	%asi
	stba	%i5,	[%l7 + 0x2C] %asi
	fmul8ulx16	%f30,	%f20,	%f16
	fmovrdgz	%l2,	%f8,	%f30
	addccc	%g7,	0x0FD8,	%o6
	sdivcc	%g3,	0x186B,	%l6
	srax	%o7,	0x1E,	%g2
	tvc	%xcc,	0x3
	fbo	%fcc3,	loop_1620
	mulscc	%o3,	0x13E8,	%g6
	set	0x31, %g5
	ldsba	[%l7 + %g5] 0x04,	%i4
loop_1620:
	std	%f14,	[%l7 + 0x50]
	bleu,a	%xcc,	loop_1621
	tge	%icc,	0x7
	bg,pn	%xcc,	loop_1622
	movrlz	%i7,	%i3,	%g4
loop_1621:
	edge16	%g5,	%l3,	%l4
	addccc	%l5,	%o4,	%i6
loop_1622:
	movleu	%icc,	%o2,	%o0
	std	%f26,	[%l7 + 0x48]
	mulx	%o5,	0x151F,	%i0
	tn	%icc,	0x6
	add	%l7,	0x78,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x10,	%g1,	%o1
	movge	%xcc,	%l0,	%l1
	taddcctv	%i2,	0x0655,	%i5
	flush	%l7 + 0x50
	and	%i1,	0x18D6,	%g7
	fand	%f20,	%f12,	%f10
	tle	%icc,	0x3
	fmovde	%xcc,	%f11,	%f10
	tneg	%xcc,	0x6
	nop
	set	0x18, %l2
	ldd	[%l7 + %l2],	%o6
	set	0x58, %l3
	swapa	[%l7 + %l3] 0x11,	%l2
	tsubcctv	%l6,	%g3,	%g2
	nop
	set	0x58, %g4
	std	%f26,	[%l7 + %g4]
	and	%o3,	%g6,	%i4
	brgz,a	%i7,	loop_1623
	fnands	%f18,	%f10,	%f26
	stx	%o7,	[%l7 + 0x20]
	movrgez	%g4,	%g5,	%l3
loop_1623:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x10] %asi
	fmuld8ulx16	%f5,	%f12,	%f24
	and	%i3,	0x0ED7,	%l4
	movvc	%icc,	%o4,	%l5
	fbg	%fcc0,	loop_1624
	movgu	%icc,	%i6,	%o2
	fornot2	%f30,	%f18,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1624:
	udivx	%o0,	0x0EA9,	%i0
	stw	%o5,	[%l7 + 0x1C]
	fnot1	%f4,	%f4
	subccc	%o1,	%g1,	%l1
	sra	%i2,	0x12,	%i5
	ldsh	[%l7 + 0x30],	%i1
	brgz,a	%g7,	loop_1625
	bg,a,pn	%xcc,	loop_1626
	fabss	%f15,	%f16
	xnor	%l0,	0x1B5B,	%l2
loop_1625:
	be,a	%xcc,	loop_1627
loop_1626:
	fxor	%f4,	%f22,	%f0
	tsubcc	%o6,	%g3,	%g2
	sir	0x05A3
loop_1627:
	tge	%icc,	0x0
	tgu	%xcc,	0x2
	sdivx	%o3,	0x0D2F,	%g6
	edge16	%i4,	%i7,	%o7
	stbar
	fmovsl	%icc,	%f23,	%f23
	tge	%xcc,	0x4
	edge32	%l6,	%g5,	%l3
	fzero	%f30
	or	%i3,	%g4,	%o4
	flush	%l7 + 0x64
	membar	0x05
	fnand	%f4,	%f18,	%f2
	orncc	%l5,	%l4,	%i6
	ba,a	loop_1628
	mova	%icc,	%o2,	%i0
	movrgz	%o0,	%o5,	%g1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x0C] %asi,	%f27
loop_1628:
	fandnot2	%f22,	%f2,	%f6
	move	%xcc,	%l1,	%i2
	edge8n	%o1,	%i1,	%i5
	fone	%f14
	fmovsge	%icc,	%f1,	%f8
	set	0x14, %i1
	stba	%l0,	[%l7 + %i1] 0x15
	fbug,a	%fcc1,	loop_1629
	ble,a,pn	%icc,	loop_1630
	fbug	%fcc1,	loop_1631
	fmovdn	%icc,	%f12,	%f22
loop_1629:
	fmul8x16	%f27,	%f26,	%f28
loop_1630:
	and	%g7,	0x1EA0,	%o6
loop_1631:
	umul	%l2,	0x1BAA,	%g3
	udiv	%o3,	0x1992,	%g6
	fone	%f16
	xor	%i4,	%i7,	%g2
	fbug,a	%fcc1,	loop_1632
	lduw	[%l7 + 0x50],	%l6
	ta	%xcc,	0x3
	fbl	%fcc0,	loop_1633
loop_1632:
	edge32ln	%o7,	%g5,	%l3
	umul	%i3,	0x0CDB,	%g4
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x62] %asi,	%l5
loop_1633:
	tgu	%icc,	0x4
	fmovspos	%icc,	%f28,	%f17
	edge16ln	%o4,	%i6,	%o2
	fmuld8sux16	%f12,	%f2,	%f16
	lduw	[%l7 + 0x5C],	%l4
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x66] %asi,	%i0
	fandnot1s	%f9,	%f8,	%f28
	stb	%o0,	[%l7 + 0x0B]
	faligndata	%f10,	%f6,	%f22
	addccc	%g1,	%l1,	%o5
	fbn,a	%fcc2,	loop_1634
	tg	%icc,	0x0
	movg	%xcc,	%i2,	%i1
	movn	%xcc,	%o1,	%i5
loop_1634:
	fpack32	%f28,	%f28,	%f0
	smulcc	%g7,	0x0EDF,	%o6
	sdivcc	%l2,	0x1A40,	%l0
	ldd	[%l7 + 0x70],	%o2
	siam	0x2
	bvs	%xcc,	loop_1635
	srlx	%g3,	0x01,	%g6
	set	0x50, %g6
	lda	[%l7 + %g6] 0x18,	%f27
loop_1635:
	nop
	setx	loop_1636,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fcmps	%fcc3,	%f11,	%f24
	fxnors	%f4,	%f0,	%f0
	faligndata	%f4,	%f0,	%f16
loop_1636:
	bcs,a	loop_1637
	movn	%xcc,	%i4,	%i7
	srlx	%l6,	%o7,	%g5
	ta	%icc,	0x2
loop_1637:
	fcmpes	%fcc3,	%f6,	%f9
	add	%l3,	%i3,	%g4
	addccc	%g2,	0x1E35,	%o4
	sir	0x07D6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x77] %asi,	%i6
	orncc	%l5,	0x02F0,	%o2
	orncc	%i0,	0x1C30,	%l4
	udivcc	%g1,	0x191F,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x02CB,	%o0
	sir	0x17F4
	brgez	%o5,	loop_1638
	andcc	%i1,	%o1,	%i5
	tge	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1638:
	fzeros	%f1
	move	%xcc,	%i2,	%o6
	ldd	[%l7 + 0x40],	%f28
	call	loop_1639
	smulcc	%g7,	0x1A1F,	%l2
	addcc	%l0,	%o3,	%g6
	edge32ln	%g3,	%i4,	%i7
loop_1639:
	fmovrdlez	%o7,	%f22,	%f0
	edge16l	%g5,	%l3,	%i3
	set	0x44, %i3
	lduha	[%l7 + %i3] 0x80,	%l6
	fmul8x16al	%f30,	%f18,	%f16
	movge	%icc,	%g4,	%g2
	alignaddr	%i6,	%o4,	%l5
	brgez	%o2,	loop_1640
	edge16n	%i0,	%g1,	%l1
	array32	%l4,	%o0,	%o5
	set	0x18, %o7
	ldxa	[%g0 + %o7] 0x50,	%i1
loop_1640:
	fmovrslez	%i5,	%f14,	%f11
	fbl,a	%fcc3,	loop_1641
	movl	%icc,	%i2,	%o1
	tg	%icc,	0x2
	bne	loop_1642
loop_1641:
	fbne	%fcc1,	loop_1643
	bneg,a	%icc,	loop_1644
	fmovdcc	%icc,	%f27,	%f21
loop_1642:
	ba	%xcc,	loop_1645
loop_1643:
	fabss	%f15,	%f12
loop_1644:
	fbu	%fcc1,	loop_1646
	movcs	%icc,	%o6,	%l2
loop_1645:
	tleu	%icc,	0x6
	movcc	%icc,	%g7,	%o3
loop_1646:
	ldub	[%l7 + 0x61],	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g6,	%g3,	%i4
	fmovsle	%icc,	%f20,	%f14
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x28] %asi,	%i7
	edge16n	%g5,	%l3,	%o7
	movneg	%icc,	%i3,	%g4
	movvs	%xcc,	%g2,	%l6
	fnor	%f12,	%f14,	%f4
	orn	%o4,	%l5,	%o2
	edge8	%i6,	%g1,	%l1
	ldsw	[%l7 + 0x48],	%i0
	movpos	%xcc,	%l4,	%o0
	set	0x70, %i0
	lduwa	[%l7 + %i0] 0x11,	%o5
	xnor	%i1,	%i5,	%i2
	taddcc	%o1,	%o6,	%l2
	edge16	%o3,	%g7,	%g6
	tge	%xcc,	0x4
	edge16n	%g3,	%l0,	%i4
	fpackfix	%f26,	%f27
	fbge,a	%fcc0,	loop_1647
	tleu	%icc,	0x1
	set	0x58, %l6
	prefetcha	[%l7 + %l6] 0x18,	 0x1
loop_1647:
	edge32ln	%l3,	%o7,	%i3
	orn	%g5,	%g2,	%g4
	fmovrde	%o4,	%f18,	%f22
	umulcc	%l5,	0x08CE,	%o2
	sdiv	%i6,	0x16C6,	%g1
	fnot1	%f0,	%f22
	fmovdn	%icc,	%f4,	%f31
	sllx	%l6,	0x12,	%l1
	fblg,a	%fcc0,	loop_1648
	fbn	%fcc3,	loop_1649
	addcc	%l4,	0x06C1,	%o0
	fcmple32	%f6,	%f10,	%i0
loop_1648:
	andn	%i1,	%o5,	%i5
loop_1649:
	xnor	%o1,	%o6,	%i2
	tsubcctv	%l2,	%g7,	%o3
	fcmpes	%fcc3,	%f22,	%f2
	ldsb	[%l7 + 0x26],	%g6
	fmovdneg	%icc,	%f3,	%f11
	mulscc	%l0,	%i4,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l3,	%i7
	bcc,a	loop_1650
	fcmps	%fcc0,	%f28,	%f4
	ldx	[%l7 + 0x60],	%i3
	andncc	%g5,	%o7,	%g2
loop_1650:
	fpsub32s	%f24,	%f19,	%f20
	fabsd	%f30,	%f4
	ldd	[%l7 + 0x48],	%o4
	nop
	setx loop_1651, %l0, %l1
	jmpl %l1, %g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l5,	%i6
	fmovsleu	%xcc,	%f17,	%f26
loop_1651:
	sllx	%g1,	0x17,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f22,	%f10,	%f4
	fbn,a	%fcc0,	loop_1652
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
	fmovsneg	%icc,	%f27,	%f21
	andcc	%l6,	%l1,	%o0
loop_1652:
	ta	%icc,	0x5
loop_1653:
	fors	%f14,	%f30,	%f1
	subcc	%i0,	0x1D41,	%i1
	fmovse	%icc,	%f5,	%f25
	movvs	%xcc,	%l4,	%i5
	brz	%o1,	loop_1654
	fbo	%fcc1,	loop_1655
	fsrc2	%f22,	%f2
	fzeros	%f19
loop_1654:
	edge32ln	%o5,	%o6,	%i2
loop_1655:
	srax	%g7,	0x05,	%o3
	movcs	%icc,	%g6,	%l2
	movg	%xcc,	%i4,	%g3
	movg	%xcc,	%l3,	%l0
	tgu	%icc,	0x7
	movrne	%i3,	%g5,	%o7
	fbule,a	%fcc1,	loop_1656
	fbo,a	%fcc3,	loop_1657
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x210, %o5
	ldxa	[%g0 + %o5] 0x52,	%i7
loop_1656:
	movne	%xcc,	%g2,	%g4
loop_1657:
	edge8	%o4,	%l5,	%i6
	sll	%g1,	%o2,	%l1
	fmovsvs	%xcc,	%f14,	%f31
	set	0x3C, %g2
	ldsha	[%l7 + %g2] 0x11,	%l6
	fbge	%fcc2,	loop_1658
	te	%xcc,	0x0
	fmovdg	%icc,	%f11,	%f10
	bg	%xcc,	loop_1659
loop_1658:
	brlez,a	%o0,	loop_1660
	sllx	%i0,	0x08,	%l4
	fbge	%fcc2,	loop_1661
loop_1659:
	andncc	%i1,	%o1,	%i5
loop_1660:
	popc	%o6,	%o5
	fmovrsgz	%i2,	%f1,	%f24
loop_1661:
	tn	%xcc,	0x7
	edge16l	%o3,	%g6,	%l2
	fcmpeq32	%f10,	%f0,	%i4
	tsubcctv	%g7,	0x1C8C,	%l3
	sethi	0x1F6B,	%l0
	ta	%xcc,	0x0
	fbu	%fcc2,	loop_1662
	fmovdgu	%xcc,	%f25,	%f25
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g3
loop_1662:
	fmovsvc	%icc,	%f7,	%f23
	edge32l	%i3,	%g5,	%i7
	edge32n	%o7,	%g4,	%o4
	andcc	%g2,	0x1B71,	%l5
	and	%g1,	%i6,	%l1
	bshuffle	%f8,	%f12,	%f16
	array16	%o2,	%o0,	%l6
	edge16	%l4,	%i1,	%i0
	mova	%xcc,	%i5,	%o1
	tcc	%xcc,	0x4
	orncc	%o5,	%o6,	%o3
	wr	%g0,	0x22,	%asi
	stxa	%g6,	[%l7 + 0x28] %asi
	membar	#Sync
	fpsub32	%f14,	%f0,	%f4
	edge8	%i2,	%i4,	%g7
	tl	%xcc,	0x6
	fbo,a	%fcc3,	loop_1663
	ldub	[%l7 + 0x69],	%l3
	subccc	%l0,	0x14E9,	%l2
	fmovdneg	%xcc,	%f20,	%f8
loop_1663:
	andcc	%g3,	%g5,	%i3
	fbe,a	%fcc1,	loop_1664
	smul	%i7,	%o7,	%g4
	fmovsge	%xcc,	%f18,	%f14
	brlz	%g2,	loop_1665
loop_1664:
	stb	%l5,	[%l7 + 0x4F]
	fmovsne	%icc,	%f18,	%f3
	set	0x48, %g1
	prefetcha	[%l7 + %g1] 0x19,	 0x3
loop_1665:
	sth	%i6,	[%l7 + 0x30]
	movrgz	%o4,	0x3ED,	%o2
	edge32n	%l1,	%l6,	%o0
	subc	%i1,	%l4,	%i0
	fnegs	%f27,	%f16
	fmovrdgez	%o1,	%f18,	%f24
	tvc	%xcc,	0x5
	flush	%l7 + 0x38
	subc	%o5,	%i5,	%o6
	taddcc	%o3,	0x07FF,	%g6
	add	%i4,	0x09CA,	%i2
	set	0x68, %g3
	stda	%l2,	[%l7 + %g3] 0xeb
	membar	#Sync
	array16	%l0,	%l2,	%g7
	brgez	%g5,	loop_1666
	nop
	setx	loop_1667,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mova	%icc,	%i3,	%g3
	ld	[%l7 + 0x74],	%f7
loop_1666:
	fmovrde	%i7,	%f14,	%f6
loop_1667:
	fbule,a	%fcc2,	loop_1668
	edge16ln	%o7,	%g4,	%l5
	movrne	%g1,	%g2,	%i6
	array16	%o2,	%l1,	%l6
loop_1668:
	and	%o4,	%o0,	%i1
	edge32	%i0,	%o1,	%l4
	wr	%g0,	0x0c,	%asi
	sta	%f14,	[%l7 + 0x24] %asi
	movne	%icc,	%o5,	%i5
	set	0x15, %i6
	stba	%o6,	[%l7 + %i6] 0xe2
	membar	#Sync
	edge32n	%g6,	%i4,	%i2
	taddcctv	%l3,	0x0BCC,	%o3
	smulcc	%l2,	%g7,	%l0
	movl	%icc,	%i3,	%g5
	bneg,a,pn	%icc,	loop_1669
	edge32ln	%g3,	%o7,	%g4
	tl	%icc,	0x7
	edge32n	%i7,	%g1,	%l5
loop_1669:
	addc	%g2,	0x08DB,	%i6
	fone	%f2
	fcmpeq16	%f2,	%f2,	%o2
	sethi	0x10D5,	%l1
	movle	%xcc,	%l6,	%o0
	fmovrslz	%o4,	%f19,	%f20
	te	%xcc,	0x7
	set	0x1C, %l4
	ldswa	[%l7 + %l4] 0x04,	%i1
	fbne	%fcc0,	loop_1670
	umul	%o1,	0x0005,	%l4
	tleu	%xcc,	0x6
	fbe,a	%fcc3,	loop_1671
loop_1670:
	fblg,a	%fcc1,	loop_1672
	nop
	set	0x38, %l5
	lduw	[%l7 + %l5],	%i0
	movrlz	%o5,	0x340,	%i5
loop_1671:
	bcc,pn	%xcc,	loop_1673
loop_1672:
	mulscc	%g6,	%i4,	%i2
	fnot2s	%f4,	%f27
	nop
	setx	loop_1674,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1673:
	brnz,a	%o6,	loop_1675
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%l3
loop_1674:
	nop
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x76] %asi,	%l2
loop_1675:
	taddcctv	%g7,	0x0EF2,	%i3
	sdivcc	%g5,	0x0570,	%l0
	tl	%icc,	0x5
	xnor	%o7,	0x13BE,	%g4
	tneg	%icc,	0x5
	udivcc	%i7,	0x1323,	%g1
	fmovrde	%g3,	%f14,	%f6
	alignaddr	%g2,	%i6,	%o2
	srax	%l5,	0x1B,	%l6
	fzero	%f16
	fnors	%f17,	%f21,	%f20
	ldx	[%l7 + 0x70],	%o0
	taddcctv	%l1,	%i1,	%o4
	fmovsl	%xcc,	%f28,	%f10
	xor	%o1,	0x08ED,	%i0
	movvs	%icc,	%l4,	%i5
	edge8n	%g6,	%o5,	%i2
	fmuld8sux16	%f16,	%f10,	%f4
	bleu	loop_1676
	movvs	%xcc,	%o6,	%o3
	mulscc	%i4,	0x0093,	%l3
	subcc	%l2,	0x0F1F,	%i3
loop_1676:
	mulx	%g7,	%l0,	%g5
	ldub	[%l7 + 0x12],	%o7
	mova	%icc,	%g4,	%i7
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x4E] %asi,	%g3
	xorcc	%g2,	%g1,	%i6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x19,	%l5,	%l6
	fnegd	%f22,	%f14
	mulscc	%o2,	0x1150,	%l1
	movpos	%icc,	%i1,	%o0
	fbl,a	%fcc3,	loop_1677
	fmovdg	%icc,	%f22,	%f28
	tge	%icc,	0x1
	fmovsleu	%xcc,	%f0,	%f19
loop_1677:
	subcc	%o4,	%i0,	%o1
	fmovdvs	%icc,	%f18,	%f8
	wr	%g0,	0x2f,	%asi
	stwa	%i5,	[%l7 + 0x54] %asi
	membar	#Sync
	array32	%g6,	%l4,	%o5
	sll	%i2,	%o6,	%o3
	alignaddrl	%i4,	%l2,	%l3
	smul	%i3,	0x1F2B,	%l0
	fmovrdlz	%g5,	%f18,	%f6
	sethi	0x1907,	%o7
	movcs	%xcc,	%g4,	%g7
	tneg	%xcc,	0x1
	movrgez	%g3,	%g2,	%g1
	fbuge	%fcc3,	loop_1678
	movre	%i7,	0x0AE,	%l5
	fmovdl	%xcc,	%f17,	%f10
	movrgz	%l6,	%i6,	%o2
loop_1678:
	fbe	%fcc3,	loop_1679
	xnor	%l1,	0x1A24,	%o0
	std	%f22,	[%l7 + 0x48]
	fnand	%f20,	%f22,	%f30
loop_1679:
	tl	%xcc,	0x7
	bl,a	loop_1680
	move	%icc,	%i1,	%i0
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x30] %asi,	%o4
loop_1680:
	te	%xcc,	0x3
	flush	%l7 + 0x50
	array8	%o1,	%g6,	%i5
	tg	%icc,	0x7
	fcmple32	%f4,	%f26,	%o5
	movg	%xcc,	%i2,	%l4
	fcmpgt16	%f12,	%f24,	%o3
	andncc	%o6,	%i4,	%l2
	fmovdn	%xcc,	%f24,	%f5
	fbu,a	%fcc3,	loop_1681
	edge32ln	%i3,	%l3,	%g5
	mova	%icc,	%o7,	%g4
	xnorcc	%g7,	%g3,	%l0
loop_1681:
	orncc	%g2,	%i7,	%g1
	set	0x0C, %o3
	ldstuba	[%l7 + %o3] 0x81,	%l6
	array8	%i6,	%o2,	%l5
	std	%f22,	[%l7 + 0x60]
	tneg	%icc,	0x3
	umul	%l1,	%o0,	%i0
	tg	%xcc,	0x1
	tgu	%xcc,	0x3
	bg,a,pt	%icc,	loop_1682
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f0,	%f20,	%f16
	fsrc2	%f18,	%f18
loop_1682:
	fexpand	%f9,	%f26
	fmovdl	%icc,	%f25,	%f11
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x14] %asi,	%i1
	lduh	[%l7 + 0x14],	%o4
	fcmpes	%fcc0,	%f26,	%f12
	subccc	%o1,	%i5,	%o5
	bvs,a,pn	%xcc,	loop_1683
	udivcc	%i2,	0x1164,	%g6
	xorcc	%o3,	0x0F8C,	%l4
	bg,pn	%icc,	loop_1684
loop_1683:
	taddcctv	%i4,	0x060E,	%l2
	udivx	%o6,	0x15B3,	%l3
	fpadd32	%f28,	%f2,	%f28
loop_1684:
	sub	%i3,	0x0B00,	%g5
	srax	%g4,	0x10,	%o7
	edge16l	%g3,	%g7,	%l0
	andcc	%i7,	%g1,	%g2
	srl	%l6,	%i6,	%o2
	sir	0x0D2C
	tg	%icc,	0x6
	sdivx	%l1,	0x0D42,	%o0
	swap	[%l7 + 0x6C],	%i0
	andncc	%i1,	%o4,	%o1
	edge8l	%i5,	%l5,	%o5
	and	%g6,	%i2,	%o3
	addc	%l4,	%i4,	%l2
	ld	[%l7 + 0x40],	%f20
	edge8	%l3,	%o6,	%g5
	movleu	%icc,	%i3,	%o7
	smulcc	%g4,	%g7,	%g3
	udivcc	%i7,	0x11DF,	%g1
	fmovdvc	%icc,	%f27,	%f0
	or	%g2,	0x0FC3,	%l0
	add	%l6,	%i6,	%o2
	tl	%xcc,	0x3
	tgu	%xcc,	0x4
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o0
	movg	%xcc,	%l1,	%i1
	umul	%o4,	0x00BB,	%i0
	fcmple32	%f24,	%f18,	%i5
	fblg,a	%fcc3,	loop_1685
	tge	%icc,	0x4
	set	0x47, %i4
	ldstuba	[%l7 + %i4] 0x89,	%o1
loop_1685:
	subccc	%o5,	0x0C64,	%g6
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l5,	%o3
	movne	%icc,	%l4,	%i2
	set	0x70, %g7
	ldda	[%l7 + %g7] 0x2e,	%l2
	movrgez	%i4,	%o6,	%g5
	udivcc	%i3,	0x0270,	%o7
	movle	%xcc,	%l3,	%g4
	tne	%xcc,	0x6
	udiv	%g7,	0x1BEE,	%i7
	movle	%icc,	%g3,	%g1
	fpsub16	%f14,	%f26,	%f14
	tvs	%xcc,	0x4
	fnot1	%f6,	%f20
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x68] %asi,	%f10
	fnegd	%f6,	%f12
	edge32	%l0,	%l6,	%i6
	subcc	%o2,	%o0,	%g2
	srax	%l1,	0x1B,	%i1
	movre	%o4,	%i5,	%i0
	set	0x58, %l0
	stda	%o4,	[%l7 + %l0] 0xe3
	membar	#Sync
	fsrc2s	%f10,	%f23
	fmovscs	%xcc,	%f15,	%f26
	fcmple32	%f12,	%f2,	%o1
	popc	%l5,	%o3
	movl	%xcc,	%g6,	%l4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i4
	array32	%o6,	%g5,	%i3
	movrgz	%l2,	%o7,	%g4
	smulcc	%g7,	%l3,	%g3
	andn	%g1,	0x1B19,	%l0
	ldstub	[%l7 + 0x5F],	%i7
	orcc	%l6,	0x06D5,	%o2
	fsrc2	%f8,	%f30
	edge16ln	%o0,	%i6,	%l1
	tl	%xcc,	0x5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%i1,	%o4
	fandnot1s	%f27,	%f18,	%f28
	addcc	%g2,	0x0DEA,	%i0
	fmovs	%f8,	%f10
	fbe,a	%fcc1,	loop_1686
	nop
	setx	loop_1687,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x4C],	%o5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i5,	%o1
loop_1686:
	fmovsn	%icc,	%f13,	%f3
loop_1687:
	be	%icc,	loop_1688
	array32	%l5,	%g6,	%l4
	brz,a	%o3,	loop_1689
	smulcc	%i2,	0x01C3,	%o6
loop_1688:
	xnorcc	%g5,	%i3,	%i4
	set	0x208, %i2
	ldxa	[%g0 + %i2] 0x52,	%o7
loop_1689:
	fba	%fcc1,	loop_1690
	smul	%g4,	0x1F21,	%l2
	orcc	%l3,	%g3,	%g7
	ldd	[%l7 + 0x60],	%g0
loop_1690:
	fandnot1s	%f13,	%f23,	%f30
	ldstub	[%l7 + 0x23],	%i7
	bcs,pn	%xcc,	loop_1691
	bshuffle	%f10,	%f2,	%f6
	fpack16	%f2,	%f18
	tcs	%xcc,	0x1
loop_1691:
	fornot2s	%f2,	%f23,	%f1
	xnor	%l0,	0x1FA0,	%o2
	movrgez	%o0,	%i6,	%l1
	tcs	%icc,	0x7
	fpsub16s	%f31,	%f31,	%f7
	tge	%xcc,	0x3
	xnor	%l6,	0x18CF,	%i1
	fmovsg	%xcc,	%f9,	%f4
	fmovrdlez	%g2,	%f10,	%f2
	array32	%o4,	%i0,	%o5
	fblg	%fcc3,	loop_1692
	udiv	%i5,	0x14D3,	%l5
	array8	%o1,	%l4,	%o3
	bvs,pn	%xcc,	loop_1693
loop_1692:
	fbo	%fcc0,	loop_1694
	fmovdcs	%xcc,	%f17,	%f5
	movgu	%xcc,	%i2,	%g6
loop_1693:
	std	%f18,	[%l7 + 0x70]
loop_1694:
	edge16ln	%g5,	%i3,	%i4
	fmovsneg	%icc,	%f11,	%f7
	tne	%icc,	0x3
	fbne,a	%fcc0,	loop_1695
	addccc	%o7,	0x0717,	%g4
	set	0x50, %i5
	prefetcha	[%l7 + %i5] 0x11,	 0x0
loop_1695:
	fornot2s	%f14,	%f24,	%f28
	tge	%xcc,	0x5
	tgu	%xcc,	0x5
	movcs	%xcc,	%l2,	%g3
	movge	%xcc,	%l3,	%g7
	and	%g1,	%i7,	%o2
	tg	%icc,	0x0
	brgez	%o0,	loop_1696
	fmovdcs	%icc,	%f4,	%f15
	fbu,a	%fcc0,	loop_1697
	movleu	%xcc,	%i6,	%l1
loop_1696:
	ble,pn	%xcc,	loop_1698
	call	loop_1699
loop_1697:
	xorcc	%l0,	%l6,	%i1
	andn	%g2,	0x0856,	%i0
loop_1698:
	std	%o4,	[%l7 + 0x70]
loop_1699:
	xnor	%o4,	0x1443,	%i5
	edge8ln	%l5,	%l4,	%o3
	edge8l	%o1,	%i2,	%g6
	movrlez	%g5,	%i4,	%i3
	and	%o7,	0x1CCE,	%o6
	or	%g4,	%l2,	%l3
	sdiv	%g3,	0x0C6F,	%g7
	xor	%i7,	%g1,	%o2
	fmovdpos	%xcc,	%f14,	%f21
	movrgz	%i6,	0x25C,	%o0
	orcc	%l0,	0x03BB,	%l6
	fsrc2	%f18,	%f16
	edge8	%i1,	%g2,	%l1
	bn	%icc,	loop_1700
	movrne	%o5,	%o4,	%i5
	fmovdl	%xcc,	%f24,	%f24
	stx	%i0,	[%l7 + 0x10]
loop_1700:
	fzero	%f8
	wr	%g0,	0x2b,	%asi
	stwa	%l5,	[%l7 + 0x28] %asi
	membar	#Sync
	movrne	%o3,	0x0B0,	%o1
	fmovsl	%xcc,	%f30,	%f14
	edge8ln	%l4,	%i2,	%g5
	edge32	%g6,	%i3,	%o7
	alignaddr	%i4,	%g4,	%o6
	sth	%l2,	[%l7 + 0x4A]
	fmovsl	%icc,	%f30,	%f27
	fmovdneg	%icc,	%f4,	%f6
	tcc	%icc,	0x5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	fzeros	%f5
	fpsub16	%f26,	%f14,	%f12
	tcc	%icc,	0x4
	xnor	%g3,	0x1FD2,	%i7
	movleu	%icc,	%g1,	%g7
	ldx	[%l7 + 0x68],	%i6
	movvs	%icc,	%o0,	%l0
	brnz,a	%l6,	loop_1701
	movrne	%o2,	%i1,	%l1
	edge16n	%g2,	%o4,	%o5
	bpos,pn	%xcc,	loop_1702
loop_1701:
	stb	%i0,	[%l7 + 0x10]
	movrlez	%i5,	0x067,	%l5
	smulcc	%o1,	%o3,	%i2
loop_1702:
	fcmps	%fcc2,	%f10,	%f0
	lduh	[%l7 + 0x7C],	%l4
	movrgz	%g6,	%i3,	%g5
	movneg	%xcc,	%o7,	%g4
	brz	%i4,	loop_1703
	smul	%o6,	0x0D9E,	%l3
	movre	%l2,	%i7,	%g1
	fandnot1	%f4,	%f26,	%f2
loop_1703:
	udivx	%g7,	0x1062,	%g3
	fors	%f15,	%f1,	%f0
	movn	%icc,	%i6,	%l0
	mova	%icc,	%o0,	%o2
	xorcc	%i1,	0x1555,	%l6
	sdiv	%g2,	0x0C4A,	%l1
	bg,a	%icc,	loop_1704
	fbule,a	%fcc0,	loop_1705
	fbug,a	%fcc0,	loop_1706
	movg	%icc,	%o5,	%i0
loop_1704:
	movrne	%i5,	%o4,	%l5
loop_1705:
	te	%icc,	0x5
loop_1706:
	edge32	%o1,	%o3,	%l4
	brlz	%g6,	loop_1707
	fmul8ulx16	%f20,	%f12,	%f24
	bcs	loop_1708
	xnor	%i2,	%i3,	%g5
loop_1707:
	xor	%o7,	0x0DEE,	%g4
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x60] %asi,	%f16
loop_1708:
	fmuld8sux16	%f31,	%f27,	%f16
	andncc	%i4,	%o6,	%l2
	fcmpne16	%f6,	%f20,	%l3
	mova	%xcc,	%g1,	%g7
	fbug,a	%fcc3,	loop_1709
	movge	%xcc,	%g3,	%i7
	set	0x6C, %o6
	lda	[%l7 + %o6] 0x15,	%f2
loop_1709:
	fbule,a	%fcc1,	loop_1710
	movne	%xcc,	%i6,	%l0
	brz	%o0,	loop_1711
	fcmpne16	%f20,	%f6,	%i1
loop_1710:
	fmovsneg	%xcc,	%f20,	%f3
	xorcc	%l6,	%o2,	%l1
loop_1711:
	smul	%o5,	%i0,	%i5
	movgu	%xcc,	%g2,	%l5
	umul	%o4,	0x0E0B,	%o3
	subccc	%o1,	%l4,	%g6
	edge32l	%i2,	%g5,	%i3
	bge,pn	%icc,	loop_1712
	tcs	%icc,	0x7
	membar	#Sync
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xf0,	%f16
loop_1712:
	fabss	%f16,	%f18
	tsubcc	%g4,	%i4,	%o7
	subccc	%o6,	%l3,	%l2
	add	%g7,	%g1,	%g3
	sll	%i6,	0x17,	%l0
	fpack32	%f2,	%f28,	%f30
	ldx	[%l7 + 0x28],	%i7
	fpsub16s	%f24,	%f4,	%f4
	sdivcc	%o0,	0x17B8,	%i1
	sethi	0x131E,	%l6
	edge8l	%o2,	%l1,	%o5
	bl,pt	%icc,	loop_1713
	be,a	loop_1714
	fxors	%f3,	%f5,	%f8
	fbul,a	%fcc1,	loop_1715
loop_1713:
	orncc	%i5,	%i0,	%g2
loop_1714:
	tle	%xcc,	0x3
	edge16	%o4,	%o3,	%o1
loop_1715:
	andncc	%l5,	%l4,	%i2
	popc	0x18D8,	%g5
	movgu	%xcc,	%i3,	%g6
	tleu	%xcc,	0x2
	bn	%xcc,	loop_1716
	fbue	%fcc0,	loop_1717
	srl	%i4,	0x01,	%o7
	movrlez	%o6,	%g4,	%l2
loop_1716:
	std	%f20,	[%l7 + 0x58]
loop_1717:
	sir	0x0C6B
	subc	%l3,	0x0A25,	%g1
	tleu	%icc,	0x4
	set	0x24, %o0
	lda	[%l7 + %o0] 0x81,	%f31
	tcc	%icc,	0x6
	addcc	%g7,	%g3,	%l0
	smulcc	%i6,	0x1E61,	%o0
	sllx	%i7,	0x1D,	%l6
	fmovrdgz	%i1,	%f0,	%f14
	tge	%icc,	0x7
	udivcc	%o2,	0x0652,	%l1
	movneg	%icc,	%o5,	%i5
	sll	%g2,	%i0,	%o3
	fpsub16s	%f14,	%f20,	%f2
	edge8ln	%o1,	%l5,	%l4
	fbo	%fcc0,	loop_1718
	fnot2s	%f8,	%f15
	fbul	%fcc1,	loop_1719
	edge16ln	%i2,	%g5,	%i3
loop_1718:
	udivx	%g6,	0x015E,	%o4
	bvs,a	%xcc,	loop_1720
loop_1719:
	tcc	%xcc,	0x1
	sllx	%o7,	%i4,	%g4
	tvs	%xcc,	0x7
loop_1720:
	tpos	%icc,	0x7
	addccc	%o6,	0x109C,	%l2
	fmovsle	%xcc,	%f27,	%f26
	edge32n	%g1,	%l3,	%g7
	stx	%l0,	[%l7 + 0x70]
	edge8l	%i6,	%o0,	%i7
	mulscc	%l6,	%i1,	%o2
	orncc	%l1,	%g3,	%o5
	or	%g2,	%i0,	%o3
	srlx	%i5,	%l5,	%l4
	movg	%xcc,	%o1,	%g5
	swap	[%l7 + 0x10],	%i3
	bn	loop_1721
	fpmerge	%f27,	%f29,	%f16
	orncc	%i2,	0x1F2A,	%g6
	array8	%o4,	%o7,	%g4
loop_1721:
	membar	0x00
	fmovdle	%icc,	%f13,	%f15
	fandnot2s	%f11,	%f21,	%f17
	bge,a	%xcc,	loop_1722
	tsubcc	%o6,	%l2,	%g1
	movgu	%xcc,	%i4,	%g7
	fpadd32	%f30,	%f26,	%f8
loop_1722:
	umulcc	%l3,	0x1A85,	%l0
	alignaddr	%i6,	%o0,	%l6
	mova	%icc,	%i1,	%i7
	brz	%o2,	loop_1723
	edge8n	%g3,	%l1,	%g2
	array16	%o5,	%o3,	%i0
	fmovscs	%xcc,	%f29,	%f4
loop_1723:
	fmovscs	%xcc,	%f22,	%f22
	fornot1s	%f31,	%f12,	%f23
	tcs	%xcc,	0x7
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x57] %asi,	%l5
	edge32l	%l4,	%o1,	%i5
	siam	0x0
	edge8ln	%i3,	%i2,	%g6
	alignaddr	%o4,	%o7,	%g4
	fexpand	%f9,	%f12
	fmovdleu	%xcc,	%f7,	%f27
	bne	loop_1724
	fpackfix	%f20,	%f3
	tvs	%xcc,	0x6
	movcs	%icc,	%o6,	%l2
loop_1724:
	sra	%g1,	0x12,	%g5
	tsubcctv	%i4,	%l3,	%g7
	popc	0x14B6,	%i6
	stbar
	subcc	%o0,	0x04F8,	%l6
	mulscc	%i1,	%l0,	%o2
	movvc	%icc,	%i7,	%g3
	add	%l1,	%o5,	%g2
	edge32l	%i0,	%o3,	%l5
	add	%o1,	%l4,	%i5
	st	%f12,	[%l7 + 0x40]
	sra	%i3,	%i2,	%o4
	movge	%icc,	%o7,	%g4
	edge32n	%o6,	%l2,	%g1
	smulcc	%g5,	%g6,	%i4
	tcc	%xcc,	0x5
	fexpand	%f28,	%f8
	fbug,a	%fcc0,	loop_1725
	movrlz	%g7,	0x320,	%i6
	edge8l	%l3,	%o0,	%l6
	edge8ln	%l0,	%o2,	%i7
loop_1725:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%g3,	%i1
	fpsub16	%f8,	%f0,	%f30
	edge8	%l1,	%g2,	%o5
	sdivx	%i0,	0x0B61,	%o3
	fmul8x16	%f31,	%f2,	%f2
	addccc	%o1,	0x122D,	%l4
	tne	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%i5
	fmovsneg	%xcc,	%f24,	%f27
	sub	%i3,	0x1F60,	%l5
	array8	%o4,	%o7,	%g4
	fmovdneg	%icc,	%f3,	%f9
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o6,	%l2
	tle	%icc,	0x2
	orn	%i2,	%g1,	%g6
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0xf1
	membar	#Sync
	add	%g5,	%i4,	%g7
	fblg,a	%fcc0,	loop_1726
	fmuld8sux16	%f10,	%f4,	%f8
	mova	%xcc,	%l3,	%i6
	fmuld8ulx16	%f26,	%f16,	%f16
loop_1726:
	edge32n	%l6,	%o0,	%o2
	ldsw	[%l7 + 0x40],	%l0
	array32	%i7,	%i1,	%l1
	addcc	%g2,	0x1D4C,	%o5
	tsubcc	%i0,	%g3,	%o1
	lduw	[%l7 + 0x68],	%o3
	edge16ln	%l4,	%i5,	%i3
	bge	%xcc,	loop_1727
	bgu,pn	%icc,	loop_1728
	bleu,a	%xcc,	loop_1729
	udivcc	%l5,	0x1867,	%o7
loop_1727:
	orncc	%o4,	%g4,	%o6
loop_1728:
	nop
	set	0x52, %o2
	ldsba	[%l7 + %o2] 0x04,	%l2
loop_1729:
	tpos	%icc,	0x2
	fxnors	%f2,	%f25,	%f0
	for	%f18,	%f6,	%f22
	edge32n	%i2,	%g1,	%g6
	and	%g5,	0x0762,	%i4
	fmovsg	%icc,	%f2,	%f13
	fmuld8ulx16	%f19,	%f1,	%f14
	sll	%l3,	0x04,	%g7
	tn	%icc,	0x6
	tcs	%xcc,	0x4
	array16	%l6,	%o0,	%i6
	bl,pt	%icc,	loop_1730
	ld	[%l7 + 0x4C],	%f21
	set	0x7C, %o1
	lda	[%l7 + %o1] 0x11,	%f15
loop_1730:
	nop
	wr	%g0,	0x5f,	%asi
	stxa	%o2,	[%g0 + 0x0] %asi
	fmovrdgez	%l0,	%f30,	%f24
	movn	%icc,	%i7,	%l1
	tle	%xcc,	0x2
	mova	%xcc,	%g2,	%i1
	fpadd16s	%f0,	%f28,	%f3
	set	0x40, %g5
	ldxa	[%l7 + %g5] 0x81,	%o5
	or	%i0,	0x03DC,	%o1
	ldd	[%l7 + 0x10],	%f0
	nop
	setx	loop_1731,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	pdist	%f18,	%f2,	%f22
	set	0x58, %i7
	stba	%o3,	[%l7 + %i7] 0x27
	membar	#Sync
loop_1731:
	smulcc	%g3,	0x1522,	%i5
	fcmps	%fcc1,	%f6,	%f3
	subc	%l4,	%i3,	%o7
	fexpand	%f21,	%f4
	fmovs	%f11,	%f1
	addcc	%o4,	0x1A7F,	%g4
	edge8n	%l5,	%o6,	%l2
	fbge,a	%fcc0,	loop_1732
	movcs	%icc,	%i2,	%g6
	membar	0x60
	sdivx	%g5,	0x1DA0,	%g1
loop_1732:
	fcmpd	%fcc1,	%f26,	%f8
	nop
	set	0x40, %l3
	std	%i4,	[%l7 + %l3]
	bvs	loop_1733
	fpmerge	%f15,	%f7,	%f6
	call	loop_1734
	movrlez	%g7,	0x38C,	%l6
loop_1733:
	fors	%f26,	%f0,	%f14
	smul	%l3,	%i6,	%o0
loop_1734:
	fmovdg	%xcc,	%f1,	%f23
	wr	%g0,	0x10,	%asi
	stxa	%l0,	[%l7 + 0x78] %asi
	fpack16	%f20,	%f12
	subc	%o2,	0x0087,	%l1
	movrlez	%i7,	0x21B,	%g2
	bcc,a,pn	%xcc,	loop_1735
	tsubcctv	%o5,	0x0EEC,	%i1
	andncc	%i0,	%o1,	%g3
	std	%o2,	[%l7 + 0x60]
loop_1735:
	fzero	%f14
	set	0x28, %g4
	stda	%i4,	[%l7 + %g4] 0x23
	membar	#Sync
	set	0x54, %l2
	swapa	[%l7 + %l2] 0x18,	%i3
	andn	%o7,	%o4,	%l4
	brgz	%l5,	loop_1736
	fmovse	%xcc,	%f2,	%f6
	movneg	%xcc,	%o6,	%g4
	brlz	%i2,	loop_1737
loop_1736:
	movn	%icc,	%l2,	%g5
	fbue,a	%fcc3,	loop_1738
	alignaddrl	%g6,	%i4,	%g1
loop_1737:
	tsubcctv	%l6,	0x1FF6,	%g7
	alignaddr	%l3,	%i6,	%o0
loop_1738:
	ld	[%l7 + 0x64],	%f3
	fbo	%fcc3,	loop_1739
	sll	%o2,	%l1,	%l0
	srlx	%g2,	%o5,	%i7
	ldub	[%l7 + 0x0C],	%i0
loop_1739:
	srax	%i1,	%o1,	%g3
	fmovrsgz	%i5,	%f16,	%f31
	ta	%xcc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o3,	%i3,	%o7
	edge32	%l4,	%l5,	%o6
	movle	%icc,	%g4,	%o4
	fpmerge	%f4,	%f8,	%f22
	ldstub	[%l7 + 0x0E],	%l2
	sethi	0x1B87,	%g5
	edge32ln	%i2,	%g6,	%i4
	tsubcc	%l6,	%g7,	%g1
	swap	[%l7 + 0x64],	%l3
	edge16n	%o0,	%o2,	%l1
	fmul8ulx16	%f12,	%f26,	%f2
	fnand	%f26,	%f22,	%f30
	sub	%l0,	%g2,	%i6
	bl,a,pn	%xcc,	loop_1740
	tleu	%xcc,	0x7
	sdivcc	%i7,	0x104D,	%i0
	edge16	%o5,	%i1,	%o1
loop_1740:
	sub	%g3,	%o3,	%i3
	fnot1	%f0,	%f12
	nop
	setx	loop_1741,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%o7,	0x16E6,	%l4
	edge32l	%l5,	%i5,	%g4
	sll	%o4,	0x17,	%l2
loop_1741:
	flush	%l7 + 0x58
	sir	0x0521
	fnegd	%f30,	%f24
	tsubcc	%o6,	%i2,	%g5
	or	%i4,	0x03D7,	%l6
	ba,a	%xcc,	loop_1742
	fba,a	%fcc0,	loop_1743
	movrgz	%g6,	%g7,	%g1
	st	%f0,	[%l7 + 0x5C]
loop_1742:
	subcc	%l3,	0x1BD6,	%o0
loop_1743:
	ldd	[%l7 + 0x40],	%l0
	swap	[%l7 + 0x1C],	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fble	%fcc3,	loop_1744
	array8	%l0,	%i6,	%g2
	fpadd16s	%f14,	%f9,	%f31
	edge8l	%i0,	%i7,	%i1
loop_1744:
	edge8	%o1,	%g3,	%o5
	movpos	%icc,	%o3,	%o7
	fmuld8ulx16	%f6,	%f25,	%f20
	wr	%g0,	0x19,	%asi
	sta	%f20,	[%l7 + 0x5C] %asi
	fmovrse	%i3,	%f0,	%f31
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l5,	%l4
	tgu	%icc,	0x5
	flush	%l7 + 0x2C
	bvc	%xcc,	loop_1745
	movge	%xcc,	%g4,	%o4
	array16	%l2,	%i5,	%i2
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x11,	%f0
loop_1745:
	nop
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x64] %asi,	%f14
	movrlz	%g5,	%o6,	%l6
	taddcctv	%i4,	0x1364,	%g7
	fbu,a	%fcc3,	loop_1746
	bn,a,pn	%icc,	loop_1747
	edge8ln	%g6,	%l3,	%g1
	edge8	%l1,	%o0,	%o2
loop_1746:
	fbul	%fcc3,	loop_1748
loop_1747:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l0,	%g2,	%i6
	std	%f22,	[%l7 + 0x70]
loop_1748:
	fpackfix	%f20,	%f27
	movvs	%icc,	%i0,	%i7
	fbn,a	%fcc1,	loop_1749
	movvs	%xcc,	%i1,	%o1
	fpadd32s	%f5,	%f2,	%f17
	stx	%g3,	[%l7 + 0x48]
loop_1749:
	andn	%o3,	%o5,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x28, %i3
	ldswa	[%l7 + %i3] 0x88,	%o7
	tle	%xcc,	0x7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%l4
	xorcc	%g4,	0x0D2D,	%l2
	fbg	%fcc0,	loop_1750
	fcmps	%fcc3,	%f0,	%f12
	ld	[%l7 + 0x64],	%f22
	fnot1s	%f29,	%f9
loop_1750:
	brlez,a	%o4,	loop_1751
	fnegd	%f2,	%f10
	bgu	loop_1752
	fsrc2	%f12,	%f18
loop_1751:
	fmovdne	%icc,	%f13,	%f28
	fmuld8ulx16	%f30,	%f6,	%f2
loop_1752:
	bcs,a,pt	%icc,	loop_1753
	nop
	set	0x68, %o7
	std	%f24,	[%l7 + %o7]
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x40] %asi,	%f16
loop_1753:
	umul	%i5,	%i2,	%g5
	set	0x74, %i1
	sta	%f31,	[%l7 + %i1] 0x0c
	edge8ln	%l6,	%i4,	%g7
	stb	%o6,	[%l7 + 0x3B]
	tvs	%icc,	0x2
	movleu	%icc,	%l3,	%g1
	addcc	%g6,	0x1861,	%l1
	movn	%icc,	%o0,	%o2
	fsrc2s	%f16,	%f15
	tle	%icc,	0x5
	smulcc	%g2,	%i6,	%l0
	bvc	%xcc,	loop_1754
	fone	%f0
	movrlz	%i7,	%i0,	%o1
	movrlz	%i1,	0x350,	%o3
loop_1754:
	fmovdl	%icc,	%f20,	%f17
	fmul8x16	%f5,	%f16,	%f4
	movrlez	%g3,	0x208,	%i3
	tcs	%xcc,	0x4
	siam	0x7
	sdivx	%o7,	0x0260,	%o5
	movrgez	%l5,	0x03B,	%l4
	movcs	%xcc,	%g4,	%o4
	edge32ln	%l2,	%i2,	%g5
	fbul	%fcc0,	loop_1755
	ld	[%l7 + 0x78],	%f12
	fbge,a	%fcc3,	loop_1756
	fmovrdlez	%l6,	%f10,	%f26
loop_1755:
	tle	%icc,	0x3
	tsubcctv	%i4,	%g7,	%i5
loop_1756:
	fandnot2	%f6,	%f0,	%f24
	fandnot1s	%f7,	%f31,	%f17
	edge16n	%l3,	%g1,	%o6
	edge8l	%l1,	%o0,	%g6
	udivx	%g2,	0x1A33,	%i6
	udivcc	%l0,	0x0824,	%o2
	ldsw	[%l7 + 0x74],	%i7
	membar	0x2D
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	fnands	%f5,	%f25,	%f27
	movneg	%xcc,	%i1,	%o3
	edge32ln	%g3,	%o1,	%o7
	edge8n	%i3,	%o5,	%l4
	call	loop_1757
	fzeros	%f14
	fmul8x16al	%f12,	%f5,	%f8
	edge32n	%g4,	%o4,	%l5
loop_1757:
	tsubcctv	%l2,	0x1310,	%g5
	sir	0x03AB
	nop
	setx	loop_1758,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tvc	%xcc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc2,	loop_1759
loop_1758:
	alignaddrl	%i2,	%l6,	%i4
	movl	%xcc,	%i5,	%l3
	fcmps	%fcc0,	%f18,	%f3
loop_1759:
	nop
	setx	loop_1760,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tneg	%xcc,	0x1
	fsrc1	%f14,	%f8
	addccc	%g7,	%g1,	%l1
loop_1760:
	srl	%o0,	%g6,	%g2
	umul	%i6,	%o6,	%l0
	fmovsg	%icc,	%f17,	%f14
	bgu	%icc,	loop_1761
	nop
	setx	loop_1762,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tle	%icc,	0x6
	movne	%xcc,	%o2,	%i7
loop_1761:
	edge32n	%i1,	%i0,	%o3
loop_1762:
	nop
	set	0x41, %l6
	lduba	[%l7 + %l6] 0x04,	%g3
	bgu,pn	%xcc,	loop_1763
	fmovdcc	%icc,	%f13,	%f17
	edge16	%o1,	%o7,	%o5
	sra	%i3,	0x04,	%g4
loop_1763:
	ta	%xcc,	0x5
	fzero	%f12
	movne	%xcc,	%l4,	%o4
	edge8ln	%l5,	%l2,	%g5
	tl	%xcc,	0x1
	movvs	%xcc,	%l6,	%i2
	tneg	%xcc,	0x5
	stx	%i4,	[%l7 + 0x30]
	tsubcc	%i5,	%g7,	%l3
	te	%xcc,	0x0
	addccc	%g1,	%o0,	%l1
	flush	%l7 + 0x14
	fnegs	%f24,	%f5
	fandnot1s	%f28,	%f20,	%f2
	flush	%l7 + 0x20
	set	0x30, %o5
	prefetcha	[%l7 + %o5] 0x14,	 0x2
	fmovrdlz	%i6,	%f30,	%f0
	or	%o6,	0x028C,	%l0
	fmovdpos	%icc,	%f16,	%f27
	fmovdneg	%xcc,	%f4,	%f2
	andcc	%o2,	0x1289,	%i7
	add	%g2,	%i0,	%i1
	fnands	%f0,	%f8,	%f15
	movne	%xcc,	%g3,	%o3
	tleu	%icc,	0x6
	call	loop_1764
	fnot1s	%f2,	%f4
	tle	%xcc,	0x6
	movge	%xcc,	%o1,	%o5
loop_1764:
	fxor	%f2,	%f18,	%f16
	xor	%i3,	%o7,	%g4
	movge	%icc,	%l4,	%o4
	fbne,a	%fcc3,	loop_1765
	fmovdleu	%xcc,	%f31,	%f22
	and	%l5,	0x10C6,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1765:
	brnz,a	%g5,	loop_1766
	tl	%icc,	0x5
	alignaddr	%l6,	%i4,	%i2
	fmul8x16al	%f6,	%f25,	%f12
loop_1766:
	andn	%g7,	%i5,	%g1
	sethi	0x037E,	%o0
	udivcc	%l3,	0x0582,	%g6
	orn	%l1,	0x12D2,	%i6
	tneg	%xcc,	0x6
	ldd	[%l7 + 0x58],	%o6
	fzero	%f22
	edge8	%o2,	%i7,	%g2
	fbl,a	%fcc0,	loop_1767
	orn	%i0,	0x11A8,	%i1
	fmovscs	%xcc,	%f3,	%f13
	set	0x22, %i0
	stba	%g3,	[%l7 + %i0] 0x2a
	membar	#Sync
loop_1767:
	movrgz	%l0,	0x20F,	%o1
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x7C] %asi,	%f8
	brz,a	%o5,	loop_1768
	smul	%o3,	%o7,	%i3
	bgu	loop_1769
	fmovs	%f8,	%f23
loop_1768:
	fmovsge	%xcc,	%f0,	%f15
	fmovs	%f23,	%f25
loop_1769:
	taddcc	%l4,	%g4,	%o4
	movn	%icc,	%l5,	%l2
	fmovrsne	%g5,	%f11,	%f7
	popc	0x1100,	%l6
	edge8l	%i4,	%i2,	%i5
	addccc	%g7,	0x0083,	%o0
	fpack16	%f4,	%f11
	nop
	set	0x56, %g2
	ldsb	[%l7 + %g2],	%l3
	tpos	%xcc,	0x4
	movvc	%xcc,	%g6,	%l1
	fbn	%fcc2,	loop_1770
	bshuffle	%f18,	%f14,	%f0
	fnands	%f24,	%f25,	%f7
	sll	%g1,	0x02,	%i6
loop_1770:
	move	%icc,	%o2,	%o6
	xorcc	%i7,	%g2,	%i0
	fbge	%fcc1,	loop_1771
	array8	%i1,	%g3,	%o1
	stbar
	bl	%xcc,	loop_1772
loop_1771:
	array16	%o5,	%o3,	%l0
	mulscc	%o7,	%l4,	%g4
	bshuffle	%f4,	%f18,	%f8
loop_1772:
	brgez,a	%o4,	loop_1773
	te	%icc,	0x4
	move	%xcc,	%i3,	%l2
	bg,a	loop_1774
loop_1773:
	tge	%xcc,	0x4
	xor	%l5,	0x1BBD,	%l6
	array8	%g5,	%i4,	%i2
loop_1774:
	fbg	%fcc2,	loop_1775
	orcc	%g7,	%i5,	%o0
	fmul8x16	%f29,	%f26,	%f28
	andcc	%g6,	0x0254,	%l1
loop_1775:
	subcc	%l3,	%g1,	%o2
	fpack16	%f0,	%f19
	bpos,pt	%icc,	loop_1776
	fmovrdlez	%i6,	%f4,	%f22
	taddcctv	%o6,	%g2,	%i0
	fpsub16	%f12,	%f14,	%f26
loop_1776:
	edge8n	%i1,	%i7,	%o1
	tsubcc	%o5,	%o3,	%g3
	tleu	%xcc,	0x5
	add	%o7,	%l4,	%l0
	add	%o4,	%i3,	%g4
	ldx	[%l7 + 0x58],	%l2
	fornot1s	%f20,	%f20,	%f21
	movrgz	%l6,	0x10E,	%l5
	ta	%icc,	0x5
	xnor	%i4,	0x1B25,	%i2
	sdivcc	%g7,	0x1449,	%i5
	tneg	%icc,	0x5
	ldsh	[%l7 + 0x16],	%g5
	fcmped	%fcc3,	%f6,	%f26
	fmovdg	%xcc,	%f11,	%f31
	fpmerge	%f12,	%f2,	%f4
	fmovscs	%xcc,	%f17,	%f7
	xnorcc	%o0,	%l1,	%g6
	umul	%g1,	0x1A2F,	%o2
	fxnor	%f20,	%f12,	%f14
	fmovsvs	%xcc,	%f8,	%f7
	andcc	%i6,	%o6,	%g2
	nop
	setx	loop_1777,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%xcc,	%l3,	%i0
	fpack32	%f16,	%f22,	%f16
	faligndata	%f24,	%f2,	%f2
loop_1777:
	bvs,pn	%xcc,	loop_1778
	ld	[%l7 + 0x38],	%f13
	umul	%i7,	0x0185,	%o1
	tl	%icc,	0x2
loop_1778:
	brnz	%i1,	loop_1779
	ld	[%l7 + 0x18],	%f22
	fxnor	%f0,	%f26,	%f28
	sub	%o5,	0x09F3,	%o3
loop_1779:
	movle	%xcc,	%g3,	%o7
	tcc	%icc,	0x7
	fbue,a	%fcc1,	loop_1780
	ta	%xcc,	0x0
	set	0x44, %g3
	lda	[%l7 + %g3] 0x88,	%f28
loop_1780:
	bl	loop_1781
	movge	%icc,	%l0,	%l4
	xnorcc	%o4,	%i3,	%l2
	fpsub32s	%f1,	%f9,	%f12
loop_1781:
	fnor	%f20,	%f20,	%f10
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l6,	%l5
	array8	%i4,	%i2,	%g7
	ldsh	[%l7 + 0x26],	%i5
	fbuge,a	%fcc0,	loop_1782
	fmovdn	%xcc,	%f25,	%f18
	movleu	%xcc,	%g4,	%g5
	tne	%xcc,	0x6
loop_1782:
	taddcc	%l1,	0x1131,	%o0
	bleu	%icc,	loop_1783
	fbo,a	%fcc0,	loop_1784
	fmovdgu	%xcc,	%f11,	%f12
	fmul8ulx16	%f2,	%f28,	%f22
loop_1783:
	movl	%icc,	%g6,	%o2
loop_1784:
	fbe,a	%fcc2,	loop_1785
	xnor	%g1,	0x0FB5,	%o6
	be	loop_1786
	brlez,a	%g2,	loop_1787
loop_1785:
	tsubcc	%l3,	0x180E,	%i6
	ta	%xcc,	0x3
loop_1786:
	fmovdvc	%icc,	%f22,	%f5
loop_1787:
	fpsub32	%f14,	%f4,	%f0
	xorcc	%i0,	%i7,	%i1
	movrgez	%o1,	0x3E6,	%o3
	fandnot1	%f14,	%f6,	%f0
	subcc	%g3,	0x1DBE,	%o7
	array8	%o5,	%l4,	%o4
	movrlz	%i3,	%l2,	%l6
	movne	%xcc,	%l0,	%l5
	orncc	%i4,	0x1525,	%i2
	srl	%g7,	%i5,	%g4
	fexpand	%f0,	%f30
	ld	[%l7 + 0x1C],	%f16
	set	0x48, %g1
	ldsha	[%l7 + %g1] 0x19,	%g5
	movrlz	%o0,	0x243,	%g6
	fbuge,a	%fcc3,	loop_1788
	movl	%xcc,	%l1,	%g1
	fmovdcc	%icc,	%f14,	%f25
	movpos	%xcc,	%o2,	%o6
loop_1788:
	bpos,a	%xcc,	loop_1789
	fornot1	%f12,	%f16,	%f8
	add	%l3,	%i6,	%g2
	sir	0x1CF3
loop_1789:
	fpsub32s	%f16,	%f27,	%f18
	edge32l	%i7,	%i1,	%i0
	bl	%xcc,	loop_1790
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2f,	%asi
	stba	%o1,	[%l7 + 0x76] %asi
	membar	#Sync
loop_1790:
	smul	%g3,	0x0E15,	%o3
	ba,a	%icc,	loop_1791
	sub	%o5,	%o7,	%o4
	st	%f1,	[%l7 + 0x4C]
	tpos	%icc,	0x1
loop_1791:
	fbe,a	%fcc0,	loop_1792
	fcmpes	%fcc3,	%f27,	%f13
	nop
	setx	loop_1793,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnor	%f24,	%f24,	%f16
loop_1792:
	edge8	%i3,	%l2,	%l6
	fcmpeq32	%f6,	%f10,	%l4
loop_1793:
	udivcc	%l0,	0x0847,	%i4
	movrlez	%i2,	0x288,	%l5
	xor	%i5,	0x1E78,	%g7
	array16	%g4,	%g5,	%g6
	move	%icc,	%l1,	%g1
	fbuge,a	%fcc0,	loop_1794
	orcc	%o2,	0x0F5F,	%o0
	sethi	0x0196,	%o6
	bcc,a	loop_1795
loop_1794:
	tsubcctv	%i6,	0x1D6D,	%g2
	tleu	%icc,	0x4
	smulcc	%l3,	0x122C,	%i1
loop_1795:
	tne	%xcc,	0x1
	sdivx	%i7,	0x1C26,	%o1
	brnz	%g3,	loop_1796
	movg	%xcc,	%i0,	%o3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o7,	%o4
loop_1796:
	fmovrsgez	%o5,	%f16,	%f18
	tle	%xcc,	0x0
	bvs,a	loop_1797
	fmovdn	%icc,	%f3,	%f20
	mulx	%i3,	0x1180,	%l2
	pdist	%f24,	%f12,	%f8
loop_1797:
	nop
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x2C] %asi,	%f2
	stw	%l4,	[%l7 + 0x18]
	set	0x68, %i6
	ldxa	[%l7 + %i6] 0x81,	%l0
	movrgez	%i4,	0x1B8,	%l6
	nop
	set	0x6B, %l4
	ldstub	[%l7 + %l4],	%l5
	srl	%i5,	0x19,	%g7
	movrlz	%g4,	%g5,	%g6
	movrlez	%l1,	0x018,	%g1
	fbe	%fcc3,	loop_1798
	udivcc	%i2,	0x0400,	%o2
	brgz,a	%o0,	loop_1799
	or	%o6,	0x0927,	%i6
loop_1798:
	taddcc	%l3,	%g2,	%i1
	nop
	setx	loop_1800,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1799:
	edge8ln	%o1,	%i7,	%g3
	umul	%o3,	%i0,	%o4
	smul	%o5,	0x14EE,	%i3
loop_1800:
	movn	%icc,	%o7,	%l4
	ldx	[%l7 + 0x10],	%l0
	movneg	%xcc,	%l2,	%l6
	andcc	%i4,	%l5,	%g7
	movgu	%xcc,	%i5,	%g4
	udiv	%g6,	0x1554,	%l1
	brgz	%g1,	loop_1801
	tn	%icc,	0x3
	movgu	%icc,	%i2,	%o2
	addccc	%g5,	%o6,	%o0
loop_1801:
	movcs	%icc,	%l3,	%i6
	bne,pn	%icc,	loop_1802
	stx	%g2,	[%l7 + 0x60]
	ldsw	[%l7 + 0x1C],	%i1
	srax	%i7,	0x02,	%g3
loop_1802:
	fxnor	%f18,	%f6,	%f30
	udiv	%o1,	0x1827,	%o3
	sdivcc	%i0,	0x192B,	%o4
	membar	0x64
	movrne	%o5,	%o7,	%i3
	bn,pn	%icc,	loop_1803
	movpos	%xcc,	%l0,	%l2
	edge8l	%l4,	%l6,	%i4
	brlez	%l5,	loop_1804
loop_1803:
	tsubcctv	%i5,	%g7,	%g4
	xnorcc	%l1,	%g6,	%g1
	move	%xcc,	%o2,	%i2
loop_1804:
	ldsb	[%l7 + 0x2A],	%o6
	movl	%icc,	%o0,	%g5
	fbule	%fcc1,	loop_1805
	fpadd32	%f2,	%f10,	%f16
	movle	%icc,	%l3,	%i6
	fmovsne	%xcc,	%f13,	%f4
loop_1805:
	udivx	%i1,	0x1FEC,	%i7
	mulx	%g2,	0x1FDE,	%o1
	movpos	%xcc,	%g3,	%o3
	tvs	%xcc,	0x3
	tcs	%xcc,	0x6
	fpack32	%f14,	%f6,	%f24
	xor	%o4,	0x131A,	%o5
	tpos	%xcc,	0x1
	movneg	%xcc,	%o7,	%i0
	tge	%icc,	0x3
	tne	%xcc,	0x0
	addcc	%l0,	%i3,	%l4
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x15,	%l2
	movneg	%icc,	%i4,	%l5
	ldd	[%l7 + 0x40],	%f8
	fmovsvs	%icc,	%f3,	%f19
	xorcc	%i5,	%l6,	%g7
	fcmped	%fcc2,	%f16,	%f0
	fornot2s	%f18,	%f6,	%f4
	fxnors	%f31,	%f31,	%f6
	fones	%f28
	sllx	%g4,	%l1,	%g6
	fxnors	%f7,	%f14,	%f26
	alignaddr	%g1,	%i2,	%o2
	edge16ln	%o6,	%g5,	%o0
	sra	%i6,	%i1,	%i7
	add	%g2,	%o1,	%g3
	sub	%o3,	0x1D03,	%l3
	edge8	%o5,	%o7,	%o4
	movn	%xcc,	%l0,	%i3
	umul	%i0,	0x11D6,	%l2
	fmovdle	%xcc,	%f21,	%f7
	edge32	%i4,	%l5,	%i5
	tcc	%icc,	0x2
	ta	%icc,	0x5
	fandnot2	%f18,	%f0,	%f20
	fbule,a	%fcc0,	loop_1806
	movne	%icc,	%l6,	%l4
	fpadd16s	%f21,	%f10,	%f25
	set	0x20, %o3
	prefetcha	[%l7 + %o3] 0x88,	 0x0
loop_1806:
	fnegd	%f0,	%f14
	smul	%l1,	%g7,	%g6
	stbar
	edge16	%g1,	%i2,	%o6
	stw	%o2,	[%l7 + 0x24]
	subc	%o0,	0x0A48,	%g5
	sdivx	%i1,	0x1D8B,	%i6
	subccc	%g2,	0x1D01,	%o1
	subccc	%g3,	0x1DE0,	%i7
	move	%xcc,	%o3,	%o5
	fnand	%f0,	%f6,	%f8
	fmovrsgez	%o7,	%f9,	%f29
	fmovrslz	%o4,	%f30,	%f0
	nop
	set	0x52, %i4
	sth	%l3,	[%l7 + %i4]
	bne,a,pn	%icc,	loop_1807
	te	%icc,	0x1
	lduh	[%l7 + 0x5A],	%l0
	movcc	%xcc,	%i3,	%i0
loop_1807:
	movg	%icc,	%i4,	%l5
	fnot2	%f28,	%f28
	edge16	%i5,	%l2,	%l6
	orcc	%l4,	0x1305,	%l1
	stbar
	sdivcc	%g7,	0x0F9F,	%g4
	sra	%g1,	%i2,	%g6
	movvs	%xcc,	%o2,	%o0
	fbo,a	%fcc3,	loop_1808
	smul	%g5,	%o6,	%i1
	umulcc	%g2,	0x118E,	%o1
	move	%icc,	%g3,	%i7
loop_1808:
	xorcc	%i6,	%o3,	%o7
	edge32	%o5,	%o4,	%l3
	alignaddrl	%i3,	%i0,	%l0
	fmovscc	%xcc,	%f18,	%f7
	tcc	%icc,	0x2
	add	%i4,	%l5,	%i5
	fexpand	%f0,	%f12
	andn	%l6,	0x0F9E,	%l4
	umul	%l2,	%l1,	%g7
	movrne	%g1,	%g4,	%g6
	fpadd16s	%f16,	%f17,	%f8
	fandnot1	%f24,	%f10,	%f2
	fmovscs	%icc,	%f14,	%f4
	array32	%o2,	%o0,	%i2
	tg	%xcc,	0x0
	bcc	loop_1809
	sth	%o6,	[%l7 + 0x52]
	brlez,a	%i1,	loop_1810
	fandnot2	%f22,	%f8,	%f0
loop_1809:
	edge8n	%g5,	%g2,	%o1
	wr	%g0,	0x80,	%asi
	stwa	%g3,	[%l7 + 0x74] %asi
loop_1810:
	mova	%xcc,	%i7,	%o3
	fmovsvs	%xcc,	%f26,	%f15
	fmovdle	%xcc,	%f1,	%f16
	addcc	%o7,	0x17F8,	%i6
	tge	%xcc,	0x7
	fpadd32	%f26,	%f22,	%f12
	fxor	%f14,	%f30,	%f14
	ble,pn	%xcc,	loop_1811
	smulcc	%o4,	0x02B0,	%o5
	brnz,a	%l3,	loop_1812
	edge32ln	%i0,	%i3,	%i4
loop_1811:
	brz	%l0,	loop_1813
	ldd	[%l7 + 0x68],	%i4
loop_1812:
	movrne	%l6,	%l5,	%l4
	and	%l1,	0x06B5,	%g7
loop_1813:
	movpos	%xcc,	%g1,	%l2
	movneg	%xcc,	%g4,	%o2
	fsrc2	%f18,	%f26
	fpsub32	%f24,	%f28,	%f2
	swap	[%l7 + 0x28],	%g6
	tvs	%icc,	0x2
	fornot1s	%f8,	%f26,	%f16
	udiv	%o0,	0x0996,	%o6
	subc	%i2,	%g5,	%i1
	st	%f30,	[%l7 + 0x28]
	add	%g2,	0x1E5B,	%g3
	andn	%o1,	0x1E1E,	%i7
	xnorcc	%o3,	%o7,	%i6
	or	%o5,	0x000B,	%l3
	array8	%i0,	%o4,	%i4
	bge,a	loop_1814
	tcs	%icc,	0x2
	movle	%xcc,	%l0,	%i3
	flush	%l7 + 0x38
loop_1814:
	fmovdgu	%icc,	%f12,	%f0
	fbne,a	%fcc1,	loop_1815
	bvc,pn	%xcc,	loop_1816
	call	loop_1817
	orncc	%l6,	0x11C9,	%l5
loop_1815:
	movleu	%xcc,	%i5,	%l4
loop_1816:
	ldd	[%l7 + 0x08],	%g6
loop_1817:
	tleu	%xcc,	0x5
	fands	%f15,	%f27,	%f29
	fmovsg	%xcc,	%f28,	%f19
	sdiv	%l1,	0x0124,	%g1
	fmovsneg	%icc,	%f2,	%f23
	tge	%xcc,	0x6
	edge32n	%g4,	%l2,	%o2
	fnors	%f0,	%f18,	%f21
	andcc	%o0,	0x04F7,	%o6
	tgu	%icc,	0x2
	swap	[%l7 + 0x08],	%i2
	edge16	%g6,	%g5,	%g2
	addcc	%i1,	%g3,	%i7
	array32	%o1,	%o3,	%o7
	sll	%o5,	%l3,	%i6
	bcc,a	%icc,	loop_1818
	edge8ln	%o4,	%i4,	%l0
	movvc	%icc,	%i0,	%l6
	fones	%f6
loop_1818:
	fsrc1	%f20,	%f22
	movleu	%icc,	%i3,	%l5
	fors	%f6,	%f19,	%f26
	movvc	%icc,	%i5,	%g7
	brgez,a	%l1,	loop_1819
	sll	%l4,	0x16,	%g1
	tge	%xcc,	0x1
	fmovsl	%icc,	%f4,	%f18
loop_1819:
	subccc	%g4,	0x150A,	%o2
	mulx	%o0,	0x0FA1,	%o6
	tl	%xcc,	0x5
	edge32l	%l2,	%i2,	%g6
	srl	%g5,	0x00,	%g2
	fmul8x16al	%f11,	%f1,	%f4
	orncc	%i1,	0x0FD0,	%i7
	sdiv	%g3,	0x1DE2,	%o3
	ldsb	[%l7 + 0x76],	%o7
	orcc	%o1,	0x18B2,	%o5
	tcc	%icc,	0x3
	movcc	%xcc,	%i6,	%o4
	fmovrsgez	%l3,	%f4,	%f24
	bg,pn	%xcc,	loop_1820
	fcmpne32	%f22,	%f12,	%i4
	udivx	%i0,	0x15AC,	%l0
	movrgz	%l6,	%l5,	%i3
loop_1820:
	sllx	%i5,	%l1,	%g7
	brlez	%g1,	loop_1821
	tsubcctv	%g4,	0x0BCD,	%o2
	movn	%xcc,	%l4,	%o6
	fexpand	%f30,	%f10
loop_1821:
	nop
	set	0x40, %g7
	lduwa	[%l7 + %g7] 0x81,	%l2
	tne	%xcc,	0x6
	move	%xcc,	%o0,	%g6
	ldstub	[%l7 + 0x7C],	%i2
	bleu,pt	%xcc,	loop_1822
	movrgz	%g5,	0x026,	%g2
	brgz,a	%i7,	loop_1823
	edge32	%i1,	%o3,	%o7
loop_1822:
	array8	%g3,	%o5,	%i6
	tsubcctv	%o1,	%o4,	%l3
loop_1823:
	fbule,a	%fcc1,	loop_1824
	srl	%i0,	%i4,	%l6
	movn	%xcc,	%l5,	%i3
	movleu	%icc,	%i5,	%l1
loop_1824:
	tle	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l0,	%g1
	umulcc	%g4,	0x06CA,	%g7
	fcmpgt16	%f20,	%f12,	%l4
	fmuld8sux16	%f19,	%f20,	%f12
	fmovsl	%icc,	%f27,	%f8
	fsrc1	%f2,	%f0
	nop
	setx loop_1825, %l0, %l1
	jmpl %l1, %o6
	tsubcc	%o2,	%l2,	%o0
	ta	%xcc,	0x7
	movge	%icc,	%g6,	%i2
loop_1825:
	array8	%g2,	%i7,	%i1
	udivx	%o3,	0x1C8F,	%g5
	movrgez	%g3,	%o5,	%o7
	orn	%i6,	0x10D6,	%o4
	fsrc1s	%f25,	%f16
	stx	%o1,	[%l7 + 0x40]
	fandnot1	%f12,	%f8,	%f2
	ldsh	[%l7 + 0x42],	%i0
	orncc	%l3,	%l6,	%i4
	tcc	%xcc,	0x4
	ldub	[%l7 + 0x5A],	%i3
	fble,a	%fcc0,	loop_1826
	fbl,a	%fcc3,	loop_1827
	udiv	%i5,	0x1154,	%l5
	alignaddrl	%l0,	%l1,	%g1
loop_1826:
	edge32ln	%g7,	%g4,	%l4
loop_1827:
	pdist	%f2,	%f0,	%f4
	fabsd	%f22,	%f12
	movge	%icc,	%o6,	%o2
	smulcc	%o0,	%g6,	%i2
	fand	%f20,	%f28,	%f14
	fbl	%fcc1,	loop_1828
	alignaddrl	%g2,	%l2,	%i1
	subcc	%i7,	%o3,	%g5
	sdivx	%g3,	0x15F1,	%o7
loop_1828:
	lduh	[%l7 + 0x16],	%i6
	fbue,a	%fcc3,	loop_1829
	fnands	%f1,	%f24,	%f30
	fmovse	%icc,	%f28,	%f16
	movcc	%xcc,	%o4,	%o1
loop_1829:
	sdivcc	%o5,	0x1610,	%l3
	sllx	%i0,	0x01,	%l6
	movg	%icc,	%i3,	%i4
	stw	%l5,	[%l7 + 0x74]
	fornot1s	%f8,	%f10,	%f9
	fexpand	%f6,	%f16
	bneg,a,pn	%xcc,	loop_1830
	ldsb	[%l7 + 0x2E],	%l0
	and	%i5,	%l1,	%g1
	movg	%xcc,	%g7,	%l4
loop_1830:
	flush	%l7 + 0x38
	fmovrse	%o6,	%f24,	%f27
	edge8l	%o2,	%o0,	%g4
	movvc	%xcc,	%g6,	%g2
	alignaddrl	%i2,	%i1,	%l2
	orn	%i7,	%o3,	%g5
	tcs	%icc,	0x5
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x118] %asi,	%g3
	tneg	%icc,	0x3
	taddcc	%i6,	%o7,	%o1
	fpsub32s	%f23,	%f10,	%f1
	fmovrdlz	%o5,	%f12,	%f28
	movleu	%xcc,	%o4,	%l3
	xor	%i0,	%l6,	%i3
	edge16n	%i4,	%l0,	%l5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%i5
	lduw	[%l7 + 0x70],	%g7
	ldx	[%l7 + 0x58],	%l4
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x18] %asi,	%g1
	ta	%xcc,	0x1
	fsrc2s	%f20,	%f7
	popc	0x03ED,	%o2
	ldsw	[%l7 + 0x78],	%o0
	fmovse	%icc,	%f4,	%f29
	sra	%g4,	%o6,	%g2
	taddcc	%i2,	0x009A,	%i1
	fblg	%fcc1,	loop_1831
	tn	%xcc,	0x5
	sra	%g6,	0x05,	%i7
	mulscc	%l2,	%g5,	%o3
loop_1831:
	tgu	%icc,	0x5
	movrlez	%i6,	%o7,	%g3
	fmovrsgz	%o1,	%f8,	%f17
	array16	%o5,	%o4,	%l3
	addcc	%i0,	%i3,	%l6
	orn	%l0,	%l5,	%l1
	move	%icc,	%i4,	%i5
	xnorcc	%g7,	%g1,	%l4
	te	%xcc,	0x5
	set	0x308, %l0
	nop 	! 	nop 	! 	ldxa	[%g0 + %l0] 0x40,	%o2 ripped by fixASI40.pl ripped by fixASI40.pl
	fmovsleu	%xcc,	%f22,	%f4
	set	0x10, %i2
	ldsha	[%l7 + %i2] 0x14,	%g4
	tcc	%xcc,	0x0
	orn	%o0,	%o6,	%i2
	addcc	%i1,	0x1D46,	%g2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x18] %asi,	%f4
	tpos	%xcc,	0x7
	fand	%f0,	%f10,	%f20
	fandnot2	%f24,	%f0,	%f2
	andn	%g6,	%i7,	%g5
	xorcc	%l2,	0x1EB4,	%i6
	set	0x50, %i5
	sta	%f10,	[%l7 + %i5] 0x14
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x74] %asi,	%o7
	udiv	%g3,	0x1F81,	%o1
	mulscc	%o5,	0x065F,	%o4
	ldd	[%l7 + 0x60],	%f10
	membar	0x23
	edge16	%l3,	%i0,	%o3
	xor	%l6,	0x1BB3,	%l0
	smul	%i3,	0x1415,	%l5
	tn	%icc,	0x6
	orcc	%l1,	0x052F,	%i4
	te	%icc,	0x4
	edge8n	%g7,	%g1,	%l4
	edge16	%o2,	%i5,	%o0
	tne	%icc,	0x2
	tcc	%icc,	0x3
	tn	%xcc,	0x1
	fbl	%fcc1,	loop_1832
	ldsh	[%l7 + 0x52],	%o6
	bcc,a,pt	%xcc,	loop_1833
	brlez,a	%g4,	loop_1834
loop_1832:
	alignaddrl	%i1,	%g2,	%i2
	ldx	[%l7 + 0x08],	%i7
loop_1833:
	fmovrsgz	%g6,	%f12,	%f13
loop_1834:
	edge8ln	%g5,	%l2,	%o7
	movneg	%icc,	%i6,	%o1
	movcs	%xcc,	%o5,	%g3
	fmovda	%icc,	%f16,	%f11
	andcc	%o4,	0x0DD3,	%i0
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x10] %asi,	%l3
	lduw	[%l7 + 0x24],	%l6
	fmovrdlz	%l0,	%f30,	%f4
	fmovsne	%xcc,	%f29,	%f23
	subc	%o3,	%l5,	%i3
	movcs	%xcc,	%l1,	%g7
	for	%f24,	%f22,	%f30
	addcc	%g1,	%l4,	%i4
	fsrc2	%f6,	%f10
	fands	%f1,	%f20,	%f3
	fnot2s	%f29,	%f6
	bg,a	%icc,	loop_1835
	bvs	loop_1836
	movrne	%i5,	%o2,	%o6
	tsubcctv	%o0,	%g4,	%g2
loop_1835:
	fmovrsgz	%i1,	%f4,	%f30
loop_1836:
	te	%icc,	0x2
	flush	%l7 + 0x7C
	set	0x36, %l1
	stha	%i2,	[%l7 + %l1] 0xeb
	membar	#Sync
	orncc	%g6,	0x0BDF,	%g5
	wr	%g0,	0xea,	%asi
	stda	%i6,	[%l7 + 0x70] %asi
	membar	#Sync
	swap	[%l7 + 0x2C],	%o7
	movneg	%xcc,	%i6,	%l2
	ldx	[%l7 + 0x78],	%o1
	stw	%g3,	[%l7 + 0x68]
	srax	%o5,	0x1D,	%o4
	popc	0x06B8,	%i0
	fcmpne32	%f24,	%f26,	%l3
	ta	%xcc,	0x1
	fmovrde	%l0,	%f22,	%f26
	wr	%g0,	0x80,	%asi
	stha	%l6,	[%l7 + 0x6A] %asi
	edge8l	%o3,	%l5,	%i3
	edge32ln	%g7,	%g1,	%l4
	movpos	%xcc,	%i4,	%i5
	sllx	%o2,	%o6,	%l1
	xorcc	%g4,	%o0,	%g2
	movneg	%icc,	%i1,	%i2
	bg,a	%xcc,	loop_1837
	movrgez	%g6,	%g5,	%o7
	stbar
	bgu	loop_1838
loop_1837:
	udivcc	%i6,	0x14FB,	%i7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x74] %asi,	%o1
loop_1838:
	sethi	0x0839,	%l2
	udivcc	%o5,	0x07F1,	%g3
	fbu,a	%fcc1,	loop_1839
	brlz,a	%o4,	loop_1840
	movle	%xcc,	%i0,	%l0
	addcc	%l6,	%l3,	%l5
loop_1839:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1840:
	andn	%i3,	0x05CF,	%o3
	fmul8x16au	%f29,	%f23,	%f22
	alignaddrl	%g7,	%l4,	%i4
	movvc	%icc,	%g1,	%o2
	tneg	%xcc,	0x4
	fors	%f3,	%f11,	%f10
	std	%f30,	[%l7 + 0x48]
	fbuge,a	%fcc3,	loop_1841
	sth	%o6,	[%l7 + 0x54]
	te	%icc,	0x3
	tle	%xcc,	0x6
loop_1841:
	movneg	%icc,	%i5,	%g4
	array8	%l1,	%o0,	%i1
	addcc	%g2,	0x0CFF,	%g6
	nop
	setx	loop_1842,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	std	%g4,	[%l7 + 0x10]
	movrne	%o7,	0x004,	%i2
	fmovdge	%icc,	%f17,	%f15
loop_1842:
	stbar
	xnor	%i6,	0x0224,	%i7
	tsubcctv	%l2,	%o5,	%o1
	xorcc	%o4,	0x1995,	%g3
	set	0x50, %o0
	lda	[%l7 + %o0] 0x04,	%f27
	fbug,a	%fcc1,	loop_1843
	siam	0x1
	and	%i0,	0x1ED5,	%l0
	fsrc1s	%f19,	%f30
loop_1843:
	fpsub32s	%f26,	%f25,	%f4
	tcc	%icc,	0x7
	nop
	set	0x56, %o6
	sth	%l6,	[%l7 + %o6]
	fmovrse	%l3,	%f23,	%f3
	tvs	%icc,	0x0
	mulx	%i3,	0x0D95,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l5,	%l4
	mulx	%g7,	%g1,	%o2
	smulcc	%i4,	0x10ED,	%o6
	be,a,pt	%xcc,	loop_1844
	fmovrsgez	%g4,	%f12,	%f3
	bshuffle	%f6,	%f12,	%f28
	pdist	%f10,	%f10,	%f12
loop_1844:
	fcmpgt32	%f22,	%f0,	%i5
	bvs	%icc,	loop_1845
	movle	%xcc,	%o0,	%l1
	flush	%l7 + 0x4C
	udiv	%i1,	0x1146,	%g2
loop_1845:
	orcc	%g6,	0x0802,	%g5
	ldd	[%l7 + 0x68],	%i2
	fmovsne	%xcc,	%f15,	%f9
	subccc	%o7,	%i7,	%i6
	or	%o5,	%l2,	%o1
	fmovrsgz	%o4,	%f11,	%f22
	mulscc	%g3,	0x07D5,	%l0
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x24] %asi,	%i0
	bl,a,pt	%xcc,	loop_1846
	movpos	%xcc,	%l6,	%i3
	fbne	%fcc0,	loop_1847
	tpos	%icc,	0x7
loop_1846:
	ld	[%l7 + 0x64],	%f30
	set	0x40, %o4
	stwa	%l3,	[%l7 + %o4] 0x2b
	membar	#Sync
loop_1847:
	bl,pn	%icc,	loop_1848
	ldstub	[%l7 + 0x55],	%o3
	wr	%g0,	0x81,	%asi
	sta	%f19,	[%l7 + 0x14] %asi
loop_1848:
	fandnot1s	%f10,	%f7,	%f14
	edge16ln	%l4,	%g7,	%g1
	edge32	%o2,	%l5,	%i4
	brz	%o6,	loop_1849
	orcc	%g4,	%o0,	%l1
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x11,	%i1,	%g2
loop_1849:
	fnot1	%f10,	%f2
	array8	%i5,	%g5,	%g6
	fmul8x16	%f8,	%f20,	%f0
	subccc	%i2,	%o7,	%i6
	bpos	loop_1850
	movrgez	%o5,	%i7,	%l2
	fnors	%f11,	%f31,	%f22
	be,a,pn	%icc,	loop_1851
loop_1850:
	array8	%o4,	%o1,	%g3
	movvs	%xcc,	%i0,	%l0
	and	%l6,	0x00EB,	%i3
loop_1851:
	mulscc	%l3,	%o3,	%g7
	movneg	%xcc,	%g1,	%l4
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovdcs	%icc,	%f6,	%f21
	ld	[%l7 + 0x48],	%f14
	fnand	%f2,	%f24,	%f24
	edge32n	%o2,	%l5,	%i4
	sth	%o6,	[%l7 + 0x22]
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x24] %asi,	%g4
	mova	%xcc,	%l1,	%i1
	membar	0x2F
	movneg	%icc,	%o0,	%g2
	fbu,a	%fcc2,	loop_1852
	brz,a	%i5,	loop_1853
	udivcc	%g5,	0x1AAD,	%g6
	movleu	%xcc,	%o7,	%i6
loop_1852:
	std	%o4,	[%l7 + 0x30]
loop_1853:
	ta	%icc,	0x0
	stbar
	edge16l	%i2,	%i7,	%o4
	set	0x54, %o1
	ldstuba	[%l7 + %o1] 0x10,	%l2
	fbue	%fcc0,	loop_1854
	mulscc	%g3,	0x17A6,	%o1
	orn	%l0,	%i0,	%i3
	movrgez	%l3,	%o3,	%l6
loop_1854:
	tge	%xcc,	0x1
	tle	%icc,	0x6
	ble	%icc,	loop_1855
	tgu	%xcc,	0x6
	set	0x37, %o2
	lduba	[%l7 + %o2] 0x14,	%g1
loop_1855:
	fsrc1	%f8,	%f22
	fbuge	%fcc1,	loop_1856
	xnorcc	%g7,	0x1B3D,	%l4
	fabss	%f19,	%f3
	for	%f6,	%f12,	%f10
loop_1856:
	and	%o2,	%i4,	%o6
	fbul	%fcc3,	loop_1857
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%g4,	%l1
	fcmped	%fcc3,	%f8,	%f8
loop_1857:
	edge16l	%l5,	%i1,	%o0
	prefetch	[%l7 + 0x54],	 0x3
	movg	%icc,	%g2,	%i5
	stx	%g5,	[%l7 + 0x70]
	srax	%g6,	%o7,	%i6
	addccc	%i2,	%i7,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x1C, %i7
	ldsha	[%l7 + %i7] 0x11,	%l2
	fbe	%fcc1,	loop_1858
	add	%g3,	%o1,	%o5
	popc	0x0736,	%l0
	tsubcctv	%i3,	%l3,	%o3
loop_1858:
	addc	%l6,	0x060D,	%i0
	fmovdleu	%xcc,	%f1,	%f18
	fmovdle	%icc,	%f15,	%f31
	fmovsa	%icc,	%f18,	%f9
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x1f
	membar	#Sync
	fbg,a	%fcc0,	loop_1859
	membar	0x0D
	tl	%xcc,	0x2
	ta	%icc,	0x5
loop_1859:
	fpackfix	%f14,	%f7
	edge16n	%g1,	%l4,	%g7
	stbar
	edge8l	%i4,	%o6,	%g4
	sdivcc	%o2,	0x150C,	%l5
	fones	%f3
	te	%xcc,	0x1
	taddcc	%l1,	%i1,	%g2
	ldsb	[%l7 + 0x34],	%o0
	sll	%g5,	0x1E,	%i5
	set	0x14, %g4
	stha	%o7,	[%l7 + %g4] 0x11
	tcc	%xcc,	0x1
	stb	%g6,	[%l7 + 0x36]
	movre	%i6,	0x3FA,	%i2
	std	%f22,	[%l7 + 0x58]
	stx	%i7,	[%l7 + 0x38]
	tge	%icc,	0x6
	edge16	%o4,	%g3,	%l2
	fmovse	%xcc,	%f15,	%f8
	movrne	%o1,	0x321,	%o5
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x6D] %asi,	%l0
	fmovdcc	%icc,	%f21,	%f0
	fabsd	%f22,	%f20
	edge8l	%l3,	%i3,	%o3
	ldstub	[%l7 + 0x6A],	%i0
	movgu	%xcc,	%g1,	%l4
	fbul,a	%fcc2,	loop_1860
	fone	%f30
	fandnot2s	%f15,	%f28,	%f30
	edge16	%g7,	%l6,	%i4
loop_1860:
	brlez,a	%g4,	loop_1861
	call	loop_1862
	taddcctv	%o6,	0x02FD,	%o2
	fbul,a	%fcc3,	loop_1863
loop_1861:
	brgez	%l5,	loop_1864
loop_1862:
	addc	%l1,	0x0821,	%i1
	movcc	%xcc,	%g2,	%g5
loop_1863:
	edge32	%o0,	%i5,	%o7
loop_1864:
	srax	%g6,	%i6,	%i2
	tn	%icc,	0x4
	prefetch	[%l7 + 0x48],	 0x2
	add	%i7,	0x0ECF,	%g3
	tsubcc	%o4,	%l2,	%o5
	fsrc1s	%f10,	%f4
	movrgz	%l0,	0x31F,	%l3
	bneg,a,pt	%xcc,	loop_1865
	edge8ln	%o1,	%o3,	%i3
	bg,a,pn	%xcc,	loop_1866
	tvs	%icc,	0x3
loop_1865:
	nop
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1866:
	bvc,a,pn	%icc,	loop_1867
	fpsub32	%f18,	%f4,	%f8
	movle	%xcc,	%g1,	%i0
	edge32ln	%l4,	%l6,	%i4
loop_1867:
	xor	%g7,	%g4,	%o6
	bcc	%icc,	loop_1868
	movrlz	%l5,	%l1,	%o2
	andn	%i1,	%g5,	%g2
	bleu	%xcc,	loop_1869
loop_1868:
	fpadd32s	%f4,	%f0,	%f14
	fmovdcs	%xcc,	%f9,	%f12
	set	0x10, %l2
	ldswa	[%l7 + %l2] 0x80,	%o0
loop_1869:
	subccc	%o7,	0x1AB6,	%g6
	tne	%icc,	0x3
	edge8	%i6,	%i2,	%i5
	sdivx	%g3,	0x1EC6,	%i7
	edge8	%o4,	%o5,	%l0
	sll	%l2,	%o1,	%o3
	tvs	%icc,	0x1
	addccc	%l3,	%g1,	%i0
	edge8ln	%i3,	%l6,	%l4
	array8	%i4,	%g7,	%o6
	move	%xcc,	%g4,	%l1
	ldsw	[%l7 + 0x0C],	%l5
	fmovdge	%xcc,	%f14,	%f12
	tle	%xcc,	0x4
	tleu	%icc,	0x7
	fmul8x16au	%f15,	%f20,	%f8
	fbge,a	%fcc2,	loop_1870
	mulscc	%o2,	%i1,	%g2
	fnot2s	%f30,	%f9
	fnegs	%f20,	%f30
loop_1870:
	brz,a	%o0,	loop_1871
	fcmpgt32	%f2,	%f24,	%o7
	wr	%g0,	0x0c,	%asi
	stha	%g5,	[%l7 + 0x64] %asi
loop_1871:
	nop
	wr	%g0,	0x04,	%asi
	stba	%g6,	[%l7 + 0x71] %asi
	fandnot2s	%f22,	%f29,	%f17
	tneg	%icc,	0x4
	sdivx	%i6,	0x0144,	%i2
	andn	%i5,	0x1BE1,	%g3
	alignaddrl	%i7,	%o5,	%o4
	membar	0x38
	fmovsneg	%icc,	%f2,	%f4
	sdivcc	%l0,	0x061B,	%l2
	fmovdle	%icc,	%f26,	%f23
	fmovscc	%icc,	%f5,	%f26
	edge32ln	%o1,	%o3,	%l3
	fnot1s	%f8,	%f27
	set	0x43, %g6
	ldstuba	[%l7 + %g6] 0x89,	%g1
	mulx	%i0,	0x1B13,	%l6
	fmovrdgez	%i3,	%f18,	%f30
	fmovrdlz	%i4,	%f20,	%f8
	fmovdge	%icc,	%f22,	%f4
	edge32	%l4,	%o6,	%g4
	mulx	%l1,	0x0D29,	%l5
	orncc	%o2,	0x07F7,	%i1
	sth	%g7,	[%l7 + 0x3E]
	ble,a	loop_1872
	be,a,pn	%icc,	loop_1873
	bge,a,pt	%icc,	loop_1874
	fba	%fcc3,	loop_1875
loop_1872:
	xor	%o0,	0x010E,	%o7
loop_1873:
	alignaddr	%g5,	%g2,	%g6
loop_1874:
	edge16ln	%i2,	%i6,	%i5
loop_1875:
	nop
	set	0x10, %l3
	stxa	%g3,	[%l7 + %l3] 0x80
	movg	%icc,	%o5,	%o4
	ldsb	[%l7 + 0x60],	%l0
	or	%i7,	%l2,	%o3
	or	%o1,	%g1,	%i0
	set	0x70, %i3
	ldda	[%l7 + %i3] 0xe2,	%i6
	set	0x44, %i1
	lda	[%l7 + %i1] 0x0c,	%f23
	edge32ln	%i3,	%l3,	%i4
	subc	%l4,	%o6,	%g4
	tleu	%icc,	0x5
	movle	%xcc,	%l1,	%o2
	set	0x08, %o7
	stha	%l5,	[%l7 + %o7] 0xeb
	membar	#Sync
	tvc	%xcc,	0x0
	tl	%xcc,	0x7
	taddcc	%i1,	0x14F1,	%g7
	sra	%o7,	0x08,	%g5
	smulcc	%g2,	%g6,	%i2
	bl,a	%xcc,	loop_1876
	bcc	loop_1877
	bcs,a,pt	%xcc,	loop_1878
	fmovdgu	%xcc,	%f24,	%f15
loop_1876:
	or	%o0,	%i5,	%i6
loop_1877:
	movrlez	%g3,	%o4,	%l0
loop_1878:
	be,pn	%icc,	loop_1879
	fbo,a	%fcc0,	loop_1880
	fble	%fcc1,	loop_1881
	andn	%i7,	%o5,	%l2
loop_1879:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_1880:
	fbul	%fcc1,	loop_1882
loop_1881:
	udivx	%o1,	0x1CD7,	%g1
	add	%i0,	%l6,	%o3
	fmovdvc	%icc,	%f16,	%f7
loop_1882:
	add	%l3,	%i3,	%i4
	membar	0x2F
	set	0x14, %o5
	ldstuba	[%l7 + %o5] 0x04,	%o6
	subc	%g4,	0x0251,	%l4
	movcc	%icc,	%o2,	%l5
	array8	%i1,	%g7,	%l1
	edge8n	%o7,	%g2,	%g5
	fbue,a	%fcc3,	loop_1883
	udiv	%g6,	0x1D5C,	%o0
	edge8ln	%i2,	%i5,	%i6
	array8	%g3,	%l0,	%i7
loop_1883:
	srl	%o4,	0x18,	%o5
	fnegd	%f18,	%f28
	movrlz	%l2,	%g1,	%o1
	fcmps	%fcc2,	%f2,	%f11
	fbge,a	%fcc2,	loop_1884
	edge16l	%l6,	%i0,	%l3
	fbg,a	%fcc2,	loop_1885
	orn	%o3,	0x0E22,	%i3
loop_1884:
	fmovdcc	%icc,	%f21,	%f12
	tneg	%xcc,	0x5
loop_1885:
	udiv	%o6,	0x1AB2,	%g4
	pdist	%f30,	%f4,	%f26
	fpadd32s	%f24,	%f17,	%f20
	movcs	%xcc,	%i4,	%l4
	edge16ln	%l5,	%i1,	%g7
	smulcc	%l1,	%o2,	%g2
	faligndata	%f6,	%f30,	%f20
	srax	%g5,	%g6,	%o0
	alignaddr	%o7,	%i5,	%i6
	fbn,a	%fcc0,	loop_1886
	xnor	%g3,	0x171C,	%l0
	fbo,a	%fcc2,	loop_1887
	fmovd	%f20,	%f2
loop_1886:
	fcmple32	%f30,	%f24,	%i2
	movvs	%icc,	%i7,	%o4
loop_1887:
	fmovsa	%xcc,	%f24,	%f31
	orcc	%o5,	0x0C32,	%g1
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x10] %asi,	%l2
	fpackfix	%f6,	%f18
	brgez	%o1,	loop_1888
	edge32ln	%l6,	%l3,	%i0
	fnot1s	%f4,	%f19
	fbue	%fcc1,	loop_1889
loop_1888:
	std	%i2,	[%l7 + 0x50]
	fmovsleu	%icc,	%f27,	%f16
	tneg	%xcc,	0x5
loop_1889:
	fcmple16	%f30,	%f6,	%o3
	fxnor	%f24,	%f28,	%f2
	movrgz	%g4,	%o6,	%i4
	xnorcc	%l5,	0x1F16,	%i1
	umul	%l4,	%g7,	%l1
	movrgez	%g2,	%g5,	%o2
	array32	%o0,	%g6,	%o7
	movleu	%icc,	%i6,	%i5
	fabsd	%f16,	%f18
	edge16ln	%l0,	%i2,	%g3
	fcmpne32	%f30,	%f26,	%i7
	edge16l	%o5,	%o4,	%g1
	movrgez	%o1,	0x071,	%l2
	faligndata	%f22,	%f18,	%f18
	fbu,a	%fcc0,	loop_1890
	nop
	setx loop_1891, %l0, %l1
	jmpl %l1, %l6
	fcmpne16	%f30,	%f4,	%i0
	xor	%i3,	%o3,	%l3
loop_1890:
	st	%f15,	[%l7 + 0x74]
loop_1891:
	fbo	%fcc1,	loop_1892
	fbug,a	%fcc0,	loop_1893
	or	%g4,	%o6,	%i4
	srl	%i1,	%l4,	%l5
loop_1892:
	stbar
loop_1893:
	edge32n	%l1,	%g2,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o2,	%g5
	udivx	%o0,	0x0EEA,	%o7
	fors	%f9,	%f19,	%f6
	membar	0x4E
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0A] %asi,	%g6
	ldsw	[%l7 + 0x7C],	%i6
	edge8l	%i5,	%l0,	%g3
	edge8l	%i2,	%o5,	%o4
	tneg	%xcc,	0x0
	fbge	%fcc0,	loop_1894
	brlez	%g1,	loop_1895
	fmovsvc	%icc,	%f6,	%f1
	fnand	%f4,	%f28,	%f30
loop_1894:
	std	%f20,	[%l7 + 0x48]
loop_1895:
	nop
	set	0x68, %l6
	ldxa	[%l7 + %l6] 0x10,	%i7
	fmovdneg	%xcc,	%f2,	%f12
	fmovsvs	%icc,	%f29,	%f4
	srl	%o1,	0x0A,	%l6
	add	%l2,	%i0,	%o3
	set	0x60, %g2
	stxa	%i3,	[%l7 + %g2] 0x27
	membar	#Sync
	edge8l	%g4,	%o6,	%i4
	bpos,a	%icc,	loop_1896
	movrlz	%i1,	%l3,	%l4
	membar	#Sync
	set	0x40, %g3
	ldda	[%l7 + %g3] 0xf0,	%f0
loop_1896:
	fmovse	%icc,	%f13,	%f4
	fandnot1	%f12,	%f6,	%f8
	edge8	%l5,	%g2,	%l1
	sdivx	%g7,	0x0351,	%g5
	set	0x34, %g1
	ldswa	[%l7 + %g1] 0x19,	%o2
	andncc	%o7,	%o0,	%g6
	edge8ln	%i5,	%i6,	%l0
	fbuge,a	%fcc2,	loop_1897
	stbar
	ldsh	[%l7 + 0x14],	%i2
	tcs	%icc,	0x1
loop_1897:
	bge	%icc,	loop_1898
	fmovdcs	%xcc,	%f20,	%f26
	edge32n	%g3,	%o5,	%g1
	sllx	%i7,	%o4,	%l6
loop_1898:
	movcc	%xcc,	%o1,	%l2
	fmovrdne	%o3,	%f26,	%f8
	fbuge,a	%fcc0,	loop_1899
	tsubcc	%i0,	%i3,	%g4
	bpos,a	loop_1900
	fbu,a	%fcc3,	loop_1901
loop_1899:
	andncc	%o6,	%i1,	%l3
	te	%xcc,	0x1
loop_1900:
	fmovrdgz	%i4,	%f4,	%f8
loop_1901:
	fbge,a	%fcc0,	loop_1902
	alignaddrl	%l4,	%g2,	%l1
	movvs	%icc,	%g7,	%l5
	brgz	%g5,	loop_1903
loop_1902:
	tle	%xcc,	0x0
	set	0x30, %i0
	lduba	[%l7 + %i0] 0x10,	%o7
loop_1903:
	sll	%o0,	%g6,	%o2
	tne	%xcc,	0x6
	orcc	%i5,	0x1E27,	%l0
	tl	%xcc,	0x3
	fornot2s	%f6,	%f21,	%f21
	edge16ln	%i6,	%i2,	%o5
	movgu	%icc,	%g3,	%g1
	fnot1	%f8,	%f28
	tg	%xcc,	0x7
	fabsd	%f30,	%f14
	stw	%i7,	[%l7 + 0x34]
	srax	%l6,	%o4,	%o1
	fornot1	%f0,	%f20,	%f26
	fmovrslz	%o3,	%f25,	%f14
	call	loop_1904
	fornot1s	%f10,	%f12,	%f7
	movg	%xcc,	%i0,	%i3
	std	%f24,	[%l7 + 0x40]
loop_1904:
	array16	%l2,	%g4,	%i1
	andn	%l3,	0x11FD,	%o6
	fmovrslz	%i4,	%f0,	%f26
	array16	%l4,	%g2,	%g7
	andncc	%l1,	%g5,	%o7
	call	loop_1905
	movrlez	%l5,	%o0,	%o2
	brgz	%i5,	loop_1906
	and	%l0,	0x05CB,	%g6
loop_1905:
	tneg	%xcc,	0x1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i2,	%i6
loop_1906:
	stb	%g3,	[%l7 + 0x08]
	edge8l	%g1,	%i7,	%o5
	flush	%l7 + 0x5C
	fpsub16s	%f29,	%f4,	%f23
	movgu	%xcc,	%l6,	%o4
	xorcc	%o1,	0x01AB,	%o3
	andncc	%i3,	%l2,	%g4
	mulx	%i1,	%l3,	%i0
	fbo	%fcc2,	loop_1907
	ldsh	[%l7 + 0x5E],	%o6
	fmovsl	%icc,	%f14,	%f11
	popc	%i4,	%l4
loop_1907:
	fandnot2	%f6,	%f6,	%f2
	fmul8x16	%f28,	%f14,	%f0
	fbo	%fcc2,	loop_1908
	array8	%g2,	%g7,	%g5
	fbe	%fcc0,	loop_1909
	brgez	%l1,	loop_1910
loop_1908:
	movneg	%icc,	%o7,	%l5
	xnorcc	%o0,	%i5,	%l0
loop_1909:
	movle	%icc,	%o2,	%i2
loop_1910:
	ldx	[%l7 + 0x28],	%i6
	set	0x48, %l4
	ldsha	[%l7 + %l4] 0x10,	%g3
	xorcc	%g1,	%g6,	%o5
	array8	%l6,	%i7,	%o4
	fmovdne	%icc,	%f15,	%f29
	umul	%o1,	%i3,	%l2
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x1e
	membar	#Sync
	mova	%icc,	%g4,	%o3
	membar	#Sync
	set	0x40, %l5
	ldda	[%l7 + %l5] 0xf9,	%f16
	andcc	%i1,	0x1BB7,	%l3
	tcs	%xcc,	0x6
	lduh	[%l7 + 0x1E],	%o6
	fmovrdne	%i4,	%f4,	%f10
	bvs,a,pn	%xcc,	loop_1911
	sub	%i0,	%g2,	%l4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g7,	%g5
loop_1911:
	nop
	wr	%g0,	0x11,	%asi
	stwa	%o7,	[%l7 + 0x3C] %asi
	fmovdn	%xcc,	%f28,	%f28
	umul	%l1,	0x1491,	%l5
	fbg,a	%fcc1,	loop_1912
	srl	%i5,	0x0D,	%o0
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x52] %asi,	%o2
loop_1912:
	fmovdleu	%xcc,	%f22,	%f19
	edge32l	%l0,	%i2,	%g3
	fnors	%f23,	%f10,	%f30
	mulx	%g1,	%g6,	%o5
	set	0x76, %o3
	ldsha	[%l7 + %o3] 0x0c,	%l6
	smul	%i7,	%o4,	%o1
	ld	[%l7 + 0x38],	%f5
	set	0x20, %g7
	stwa	%i3,	[%l7 + %g7] 0x04
	fmuld8ulx16	%f16,	%f18,	%f12
	fmuld8ulx16	%f25,	%f6,	%f0
	sllx	%i6,	0x1C,	%l2
	xorcc	%g4,	0x1A47,	%o3
	tsubcctv	%l3,	0x0188,	%o6
	set	0x40, %i4
	stda	%f0,	[%l7 + %i4] 0x18
	movcc	%icc,	%i4,	%i1
	movgu	%xcc,	%i0,	%g2
	tcc	%xcc,	0x3
	tvc	%icc,	0x0
	fnegs	%f11,	%f8
	xnorcc	%l4,	%g7,	%o7
	ldx	[%l7 + 0x28],	%l1
	tcs	%xcc,	0x5
	fble,a	%fcc2,	loop_1913
	st	%f0,	[%l7 + 0x40]
	fbe,a	%fcc3,	loop_1914
	movl	%icc,	%g5,	%i5
loop_1913:
	bne,pt	%icc,	loop_1915
	umul	%l5,	%o2,	%o0
loop_1914:
	stx	%i2,	[%l7 + 0x60]
	tsubcctv	%l0,	%g3,	%g1
loop_1915:
	udivx	%g6,	0x096B,	%l6
	fmovdge	%xcc,	%f17,	%f15
	tpos	%icc,	0x1
	sir	0x0B51
	movg	%icc,	%i7,	%o5
	mova	%xcc,	%o1,	%i3
	fnor	%f0,	%f12,	%f12
	movrlz	%o4,	0x242,	%l2
	tge	%xcc,	0x4
	sra	%i6,	%o3,	%g4
	movleu	%xcc,	%l3,	%o6
	bpos,a,pn	%xcc,	loop_1916
	std	%f22,	[%l7 + 0x40]
	edge16	%i1,	%i0,	%g2
	fmovse	%icc,	%f9,	%f23
loop_1916:
	edge16l	%l4,	%i4,	%o7
	sdivcc	%l1,	0x0F9E,	%g5
	fpadd16	%f8,	%f4,	%f24
	udiv	%g7,	0x13AB,	%l5
	movl	%icc,	%o2,	%o0
	te	%icc,	0x3
	edge16n	%i5,	%l0,	%g3
	orcc	%i2,	0x0F0F,	%g1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x20] %asi,	%g6
	addc	%i7,	0x0DB9,	%o5
	xnor	%l6,	%i3,	%o4
	edge32ln	%o1,	%i6,	%o3
	fzero	%f10
	bge,a,pn	%icc,	loop_1917
	srlx	%l2,	0x17,	%g4
	fcmps	%fcc1,	%f8,	%f13
	set	0x68, %i2
	stda	%o6,	[%l7 + %i2] 0x0c
loop_1917:
	brlez,a	%i1,	loop_1918
	sdiv	%l3,	0x1261,	%i0
	mulx	%l4,	0x050D,	%i4
	tl	%xcc,	0x0
loop_1918:
	ta	%xcc,	0x1
	fcmple16	%f2,	%f28,	%o7
	fsrc2s	%f11,	%f26
	tne	%icc,	0x6
	subcc	%g2,	%g5,	%g7
	movcs	%icc,	%l5,	%l1
	movrne	%o2,	%i5,	%l0
	fbul	%fcc1,	loop_1919
	movl	%icc,	%g3,	%o0
	addc	%g1,	0x00C2,	%g6
	set	0x40, %i5
	stda	%f0,	[%l7 + %i5] 0x0c
loop_1919:
	brz	%i2,	loop_1920
	movrgz	%i7,	%l6,	%o5
	tcs	%icc,	0x3
	fmovsg	%xcc,	%f14,	%f5
loop_1920:
	fxnors	%f4,	%f22,	%f2
	tge	%xcc,	0x5
	fornot1s	%f4,	%f0,	%f1
	set	0x3A, %l1
	lduha	[%l7 + %l1] 0x10,	%o4
	brlz	%o1,	loop_1921
	edge8	%i6,	%i3,	%o3
	umul	%l2,	%o6,	%g4
	membar	0x47
loop_1921:
	edge8l	%i1,	%l3,	%i0
	stw	%l4,	[%l7 + 0x6C]
	fbge	%fcc1,	loop_1922
	movcc	%xcc,	%i4,	%g2
	addccc	%g5,	%o7,	%l5
	pdist	%f26,	%f2,	%f10
loop_1922:
	movcs	%xcc,	%l1,	%o2
	umul	%i5,	0x04F5,	%g7
	ldx	[%l7 + 0x40],	%l0
	tcc	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul,a	%fcc2,	loop_1923
	fmovdneg	%xcc,	%f23,	%f22
	sethi	0x0A9F,	%o0
	set	0x54, %o0
	lduwa	[%l7 + %o0] 0x14,	%g3
loop_1923:
	tvc	%icc,	0x2
	tcc	%icc,	0x1
	tsubcctv	%g1,	0x16F9,	%i2
	brz,a	%g6,	loop_1924
	tneg	%icc,	0x3
	mova	%xcc,	%i7,	%o5
	sllx	%o4,	0x07,	%o1
loop_1924:
	fblg	%fcc3,	loop_1925
	tle	%xcc,	0x2
	fcmpne32	%f18,	%f18,	%i6
	orn	%l6,	%o3,	%i3
loop_1925:
	and	%l2,	0x0548,	%g4
	tsubcc	%o6,	%l3,	%i0
	fmovsvs	%xcc,	%f14,	%f20
	fbl,a	%fcc2,	loop_1926
	tleu	%icc,	0x4
	alignaddrl	%l4,	%i4,	%i1
	prefetch	[%l7 + 0x38],	 0x0
loop_1926:
	movg	%icc,	%g5,	%g2
	fmovdl	%icc,	%f4,	%f31
	tge	%xcc,	0x1
	fpack16	%f10,	%f9
	ldstub	[%l7 + 0x6C],	%l5
	xor	%o7,	%o2,	%l1
	alignaddrl	%g7,	%i5,	%o0
	edge16	%g3,	%l0,	%i2
	fors	%f2,	%f29,	%f29
	andn	%g1,	%g6,	%i7
	xnor	%o5,	0x1B7B,	%o1
	nop
	set	0x2A, %o6
	ldsh	[%l7 + %o6],	%o4
	srax	%i6,	%l6,	%i3
	brlez,a	%o3,	loop_1927
	fcmpd	%fcc3,	%f26,	%f26
	alignaddr	%l2,	%o6,	%g4
	alignaddrl	%l3,	%l4,	%i0
loop_1927:
	edge32l	%i4,	%g5,	%i1
	movcs	%icc,	%g2,	%l5
	bleu,pt	%icc,	loop_1928
	std	%o2,	[%l7 + 0x40]
	nop
	setx	loop_1929,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8sux16	%f24,	%f4,	%f24
loop_1928:
	sra	%o7,	%l1,	%i5
	subccc	%g7,	%o0,	%g3
loop_1929:
	srlx	%l0,	0x07,	%g1
	tneg	%xcc,	0x5
	andcc	%i2,	0x1532,	%i7
	smulcc	%g6,	0x1190,	%o5
	movrne	%o4,	0x225,	%o1
	edge16ln	%l6,	%i3,	%i6
	tsubcctv	%o3,	%o6,	%g4
	fmovrdlez	%l2,	%f12,	%f28
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x19
	ldd	[%l7 + 0x20],	%f20
	edge8n	%l4,	%l3,	%i4
	nop
	set	0x58, %o1
	stw	%i0,	[%l7 + %o1]
	edge32l	%g5,	%i1,	%g2
	popc	%l5,	%o7
	xnorcc	%o2,	%i5,	%g7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o0,	%l1
	fzero	%f14
	xnorcc	%l0,	%g3,	%i2
	edge32	%i7,	%g6,	%g1
	mova	%xcc,	%o4,	%o5
	sth	%l6,	[%l7 + 0x5E]
	edge16l	%i3,	%o1,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i6,	%g4
	array8	%o6,	%l2,	%l3
	and	%l4,	0x1E38,	%i4
	fexpand	%f18,	%f28
	subccc	%g5,	0x04B3,	%i1
	fbul	%fcc3,	loop_1930
	tcc	%xcc,	0x5
	movgu	%icc,	%g2,	%i0
	fabsd	%f12,	%f8
loop_1930:
	ba,a,pt	%icc,	loop_1931
	sdivcc	%o7,	0x02B4,	%l5
	edge8ln	%o2,	%i5,	%g7
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x60] %asi,	%o0
loop_1931:
	umul	%l1,	0x0999,	%g3
	tn	%icc,	0x6
	brz,a	%l0,	loop_1932
	fmovrse	%i2,	%f19,	%f11
	sdiv	%g6,	0x1A43,	%g1
	orncc	%i7,	0x0B20,	%o5
loop_1932:
	fmovdpos	%xcc,	%f28,	%f9
	fmovde	%xcc,	%f26,	%f4
	lduw	[%l7 + 0x40],	%o4
	fbn,a	%fcc2,	loop_1933
	ba,a,pt	%icc,	loop_1934
	udivcc	%i3,	0x0A64,	%o1
	fba	%fcc1,	loop_1935
loop_1933:
	edge16	%l6,	%o3,	%i6
loop_1934:
	edge8l	%g4,	%o6,	%l3
	fmovspos	%icc,	%f6,	%f19
loop_1935:
	tcc	%icc,	0x0
	sllx	%l2,	%l4,	%i4
	sir	0x0946
	bcs	loop_1936
	call	loop_1937
	mova	%icc,	%g5,	%i1
	movgu	%xcc,	%g2,	%i0
loop_1936:
	fmovde	%xcc,	%f23,	%f11
loop_1937:
	addcc	%l5,	%o2,	%o7
	fbe	%fcc2,	loop_1938
	movcs	%xcc,	%g7,	%i5
	fbne	%fcc3,	loop_1939
	fbuge,a	%fcc1,	loop_1940
loop_1938:
	be	loop_1941
	fmovse	%xcc,	%f10,	%f10
loop_1939:
	tl	%xcc,	0x0
loop_1940:
	fmovdne	%xcc,	%f15,	%f16
loop_1941:
	array8	%l1,	%o0,	%g3
	tsubcc	%i2,	0x1EC0,	%l0
	tge	%icc,	0x7
	array32	%g6,	%i7,	%o5
	alignaddrl	%o4,	%i3,	%g1
	bneg,pt	%icc,	loop_1942
	array32	%l6,	%o3,	%i6
	sdivcc	%o1,	0x02EC,	%g4
	wr	%g0,	0x0c,	%asi
	stba	%l3,	[%l7 + 0x6C] %asi
loop_1942:
	fmuld8sux16	%f10,	%f13,	%f16
	fcmped	%fcc2,	%f16,	%f14
	stb	%o6,	[%l7 + 0x4E]
	fpsub32	%f8,	%f4,	%f28
	fmovdneg	%xcc,	%f30,	%f11
	orncc	%l4,	0x1A10,	%l2
	nop
	set	0x0E, %o2
	lduh	[%l7 + %o2],	%i4
	fornot1	%f16,	%f20,	%f8
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%xcc,	0x5
	fmovsn	%icc,	%f1,	%f19
	edge8	%i1,	%g2,	%g5
	tl	%icc,	0x5
	orn	%l5,	%i0,	%o2
	fbue,a	%fcc1,	loop_1943
	udivcc	%o7,	0x1454,	%g7
	fpmerge	%f19,	%f3,	%f28
	fpadd16s	%f18,	%f14,	%f12
loop_1943:
	srl	%l1,	0x1E,	%o0
	fnor	%f14,	%f6,	%f28
	ta	%icc,	0x4
	bpos,a	%xcc,	loop_1944
	fblg,a	%fcc3,	loop_1945
	bne,a,pt	%icc,	loop_1946
	fbo	%fcc1,	loop_1947
loop_1944:
	edge16l	%g3,	%i5,	%l0
loop_1945:
	fsrc2s	%f15,	%f7
loop_1946:
	xorcc	%i2,	%g6,	%o5
loop_1947:
	nop
	setx	loop_1948,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%i7,	0x101,	%o4
	fcmple16	%f12,	%f6,	%g1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x0E] %asi,	%i3
loop_1948:
	ldstub	[%l7 + 0x44],	%o3
	fmovd	%f4,	%f20
	sllx	%l6,	%i6,	%o1
	addccc	%l3,	0x060F,	%o6
	tcs	%icc,	0x3
	add	%l4,	0x03DE,	%g4
	addc	%i4,	0x188F,	%l2
	sra	%i1,	%g5,	%l5
	edge16l	%g2,	%o2,	%o7
	srlx	%i0,	0x06,	%l1
	fbg	%fcc2,	loop_1949
	fbu	%fcc2,	loop_1950
	sdivx	%o0,	0x014A,	%g3
	bgu,a,pt	%xcc,	loop_1951
loop_1949:
	movvc	%icc,	%g7,	%i5
loop_1950:
	nop
	set	0x70, %i7
	ldxa	[%l7 + %i7] 0x04,	%i2
loop_1951:
	fand	%f12,	%f10,	%f6
	sllx	%l0,	0x1B,	%g6
	orncc	%o5,	%i7,	%o4
	udiv	%i3,	0x10B7,	%g1
	tsubcc	%l6,	0x1414,	%i6
	ldsw	[%l7 + 0x30],	%o3
	fbge,a	%fcc2,	loop_1952
	fpadd32s	%f28,	%f7,	%f12
	tne	%icc,	0x5
	movrne	%o1,	%l3,	%l4
loop_1952:
	movne	%icc,	%g4,	%o6
	set	0x74, %g5
	swapa	[%l7 + %g5] 0x89,	%l2
	ba,a,pt	%xcc,	loop_1953
	edge16	%i1,	%i4,	%g5
	smul	%g2,	0x0555,	%o2
	sra	%o7,	0x1D,	%i0
loop_1953:
	orn	%l5,	0x12AB,	%l1
	te	%xcc,	0x7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%g7
	set	0x18, %l0
	ldxa	[%l7 + %l0] 0x19,	%g3
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x46] %asi,	%i2
	bcc,a,pt	%icc,	loop_1954
	fmovspos	%xcc,	%f17,	%f9
	fbu	%fcc2,	loop_1955
	and	%l0,	%i5,	%o5
loop_1954:
	brgz,a	%g6,	loop_1956
	fmovscs	%xcc,	%f8,	%f29
loop_1955:
	orn	%o4,	%i7,	%i3
	bl,a,pn	%xcc,	loop_1957
loop_1956:
	tcc	%xcc,	0x7
	bg,a	%xcc,	loop_1958
	tn	%icc,	0x3
loop_1957:
	fbg	%fcc3,	loop_1959
	stb	%g1,	[%l7 + 0x3E]
loop_1958:
	movleu	%icc,	%i6,	%l6
	membar	0x2E
loop_1959:
	tsubcc	%o3,	0x06AE,	%l3
	srlx	%l4,	%g4,	%o6
	std	%o0,	[%l7 + 0x78]
	st	%f5,	[%l7 + 0x7C]
	udivcc	%i1,	0x0F5C,	%i4
	tl	%xcc,	0x5
	fsrc2	%f24,	%f20
	alignaddrl	%l2,	%g5,	%g2
	ba,a,pn	%xcc,	loop_1960
	movrlez	%o7,	%o2,	%l5
	fnot2s	%f17,	%f17
	fbo,a	%fcc0,	loop_1961
loop_1960:
	orncc	%l1,	%i0,	%g7
	xor	%o0,	0x1907,	%g3
	set	0x44, %l2
	ldswa	[%l7 + %l2] 0x11,	%i2
loop_1961:
	movg	%xcc,	%l0,	%o5
	udivx	%i5,	0x0F44,	%g6
	popc	%i7,	%o4
	array16	%i3,	%g1,	%l6
	tpos	%xcc,	0x5
	fmovrde	%i6,	%f30,	%f16
	brlz	%o3,	loop_1962
	movgu	%icc,	%l4,	%g4
	edge32	%o6,	%l3,	%i1
	taddcc	%o1,	0x1A9F,	%l2
loop_1962:
	subcc	%g5,	%g2,	%o7
	srl	%i4,	0x06,	%o2
	movrne	%l1,	%i0,	%g7
	fmovscs	%xcc,	%f26,	%f27
	edge32l	%l5,	%g3,	%o0
	movneg	%xcc,	%i2,	%o5
	addc	%i5,	%l0,	%g6
	xor	%i7,	0x1C2E,	%o4
	ldub	[%l7 + 0x62],	%i3
	tsubcctv	%g1,	0x1769,	%i6
	edge32n	%o3,	%l4,	%l6
	fbug	%fcc0,	loop_1963
	edge32ln	%o6,	%l3,	%i1
	mulx	%g4,	0x1C8E,	%o1
	umul	%g5,	%l2,	%o7
loop_1963:
	fcmple16	%f26,	%f24,	%i4
	fmovdl	%icc,	%f21,	%f22
	fbug,a	%fcc1,	loop_1964
	tg	%xcc,	0x0
	sllx	%g2,	0x15,	%o2
	fmovde	%xcc,	%f20,	%f24
loop_1964:
	bge,a	%xcc,	loop_1965
	fnegs	%f23,	%f25
	movl	%icc,	%i0,	%g7
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x4B] %asi,	%l5
loop_1965:
	xnorcc	%g3,	0x1F29,	%o0
	smul	%i2,	0x0CE2,	%o5
	tsubcc	%l1,	0x042B,	%l0
	set	0x52, %g4
	lduha	[%l7 + %g4] 0x15,	%i5
	edge8	%i7,	%o4,	%g6
	tsubcc	%i3,	%i6,	%g1
	movvc	%xcc,	%o3,	%l6
	std	%f28,	[%l7 + 0x38]
	set	0x12, %l3
	stba	%o6,	[%l7 + %l3] 0x89
	sdivx	%l3,	0x0E22,	%l4
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
	fbn	%fcc1,	loop_1967
	bpos,a	loop_1968
	taddcc	%i1,	0x1CDA,	%o1
loop_1966:
	taddcc	%g5,	%g4,	%l2
loop_1967:
	fcmpne32	%f18,	%f12,	%o7
loop_1968:
	fnot2s	%f31,	%f3
	andncc	%i4,	%g2,	%o2
	subcc	%i0,	%l5,	%g7
	movle	%icc,	%o0,	%g3
	alignaddr	%o5,	%l1,	%i2
	tpos	%icc,	0x3
	srl	%l0,	0x1E,	%i7
	sdiv	%o4,	0x0D98,	%g6
	and	%i5,	0x1D75,	%i3
	edge32ln	%g1,	%i6,	%l6
	movrlez	%o3,	%o6,	%l3
	bgu,a,pn	%icc,	loop_1969
	movl	%icc,	%i1,	%l4
	udivcc	%o1,	0x1742,	%g4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%l2,	%o7
loop_1969:
	movl	%xcc,	%i4,	%g5
	movne	%xcc,	%g2,	%i0
	fmovsl	%xcc,	%f27,	%f3
	stx	%o2,	[%l7 + 0x50]
	array32	%g7,	%l5,	%g3
	edge8l	%o5,	%l1,	%i2
	tvc	%xcc,	0x7
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x88,	%f0
	edge32	%o0,	%l0,	%o4
	bvc,pt	%icc,	loop_1970
	andn	%i7,	%i5,	%g6
	fpackfix	%f10,	%f2
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%i3
loop_1970:
	udiv	%g1,	0x0038,	%i6
	swap	[%l7 + 0x58],	%l6
	sub	%o3,	0x1C9F,	%o6
	fpackfix	%f8,	%f26
	membar	0x1B
	movge	%icc,	%l3,	%i1
	udivx	%o1,	0x1364,	%l4
	movrlz	%l2,	%o7,	%i4
	edge32n	%g4,	%g5,	%g2
	bgu,pt	%xcc,	loop_1971
	orncc	%i0,	0x1A4F,	%o2
	fmul8x16au	%f20,	%f4,	%f30
	fmuld8ulx16	%f20,	%f16,	%f14
loop_1971:
	bshuffle	%f20,	%f28,	%f22
	tgu	%xcc,	0x6
	movrlz	%g7,	%l5,	%o5
	ldstub	[%l7 + 0x79],	%g3
	tne	%icc,	0x3
	fbul	%fcc3,	loop_1972
	ldsh	[%l7 + 0x3C],	%l1
	fzero	%f12
	bpos,a	loop_1973
loop_1972:
	movn	%xcc,	%o0,	%l0
	subcc	%i2,	0x01E6,	%i7
	addccc	%i5,	%o4,	%i3
loop_1973:
	membar	0x44
	movrgz	%g1,	0x1C4,	%i6
	addcc	%l6,	0x1027,	%g6
	array8	%o6,	%o3,	%l3
	set	0x1B, %i3
	ldstuba	[%l7 + %i3] 0x80,	%o1
	xorcc	%i1,	%l2,	%o7
	movleu	%xcc,	%i4,	%g4
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x70] %asi,	%g5
	fexpand	%f28,	%f20
	popc	0x162E,	%g2
	movrlz	%l4,	0x092,	%o2
	fbug	%fcc0,	loop_1974
	sll	%g7,	0x17,	%l5
	tpos	%xcc,	0x2
	or	%o5,	%g3,	%l1
loop_1974:
	fmovrdgez	%o0,	%f18,	%f6
	edge16	%i0,	%i2,	%l0
	fxor	%f6,	%f12,	%f24
	mova	%icc,	%i7,	%i5
	prefetch	[%l7 + 0x6C],	 0x1
	fcmple32	%f18,	%f14,	%i3
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x218] %asi,	%o4
	sra	%i6,	%l6,	%g1
	fpsub16s	%f11,	%f27,	%f23
	tn	%icc,	0x5
	fbu	%fcc3,	loop_1975
	fpsub16s	%f13,	%f3,	%f28
	smul	%o6,	0x1A65,	%o3
	umulcc	%l3,	%g6,	%i1
loop_1975:
	fmovdpos	%icc,	%f18,	%f5
	umulcc	%l2,	0x1E9B,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f20,	[%l7 + 0x74]
	fmovdvc	%xcc,	%f30,	%f18
	fbuge	%fcc0,	loop_1976
	nop
	set	0x40, %i1
	std	%o0,	[%l7 + %i1]
	tvs	%xcc,	0x3
	tvc	%xcc,	0x1
loop_1976:
	stbar
	bge,a,pt	%xcc,	loop_1977
	fbu,a	%fcc3,	loop_1978
	udivcc	%g4,	0x0A77,	%g5
	fpsub32	%f24,	%f10,	%f0
loop_1977:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f7,	[%l7 + 0x18] %asi
loop_1978:
	tvc	%xcc,	0x5
	bl	loop_1979
	mulscc	%i4,	%l4,	%g2
	fbuge	%fcc1,	loop_1980
	taddcc	%g7,	0x014E,	%o2
loop_1979:
	nop
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x1C] %asi,	%f10
loop_1980:
	bge	loop_1981
	umul	%l5,	0x1A1C,	%g3
	sll	%l1,	%o0,	%o5
	movvs	%xcc,	%i0,	%i2
loop_1981:
	fbne	%fcc1,	loop_1982
	sub	%i7,	%i5,	%l0
	edge16	%o4,	%i6,	%l6
	fmovrdgez	%i3,	%f20,	%f18
loop_1982:
	sllx	%o6,	0x09,	%g1
	fbo,a	%fcc1,	loop_1983
	fmul8ulx16	%f0,	%f6,	%f26
	tleu	%xcc,	0x6
	fpack32	%f30,	%f24,	%f20
loop_1983:
	edge16l	%l3,	%g6,	%o3
	bge,pn	%icc,	loop_1984
	fmul8x16au	%f17,	%f27,	%f22
	fmovdcc	%icc,	%f26,	%f26
	tcs	%xcc,	0x6
loop_1984:
	edge32	%l2,	%i1,	%o7
	fzeros	%f6
	tleu	%xcc,	0x6
	srax	%o1,	0x0D,	%g5
	fmuld8sux16	%f24,	%f13,	%f26
	fmovdgu	%xcc,	%f25,	%f26
	ba,a	loop_1985
	fsrc1s	%f28,	%f12
	sdivx	%g4,	0x166C,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1985:
	andcc	%g2,	0x1D19,	%g7
	te	%icc,	0x4
	movrgz	%i4,	0x354,	%l5
	fmovsle	%xcc,	%f8,	%f8
	move	%xcc,	%o2,	%g3
	add	%l1,	%o5,	%o0
	set	0x2E, %o7
	lduha	[%l7 + %o7] 0x0c,	%i0
	tneg	%icc,	0x3
	be	%xcc,	loop_1986
	edge32ln	%i7,	%i2,	%l0
	tne	%icc,	0x2
	fmovsg	%icc,	%f6,	%f25
loop_1986:
	fbug	%fcc3,	loop_1987
	bcs,a	loop_1988
	fbuge,a	%fcc0,	loop_1989
	fmovspos	%xcc,	%f18,	%f4
loop_1987:
	sra	%o4,	%i6,	%l6
loop_1988:
	edge32n	%i3,	%o6,	%g1
loop_1989:
	fmovrslz	%i5,	%f1,	%f14
	sdiv	%g6,	0x0EB4,	%l3
	sth	%o3,	[%l7 + 0x30]
	tneg	%icc,	0x2
	fmovs	%f11,	%f10
	movvc	%xcc,	%l2,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o1,	%g5,	%g4
	tvc	%icc,	0x4
	addc	%i1,	0x0BF2,	%l4
	addcc	%g7,	%g2,	%l5
	srax	%o2,	0x17,	%i4
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x18] %asi,	%f12
	fmovdcc	%icc,	%f9,	%f16
	membar	0x14
	tleu	%xcc,	0x2
	fba	%fcc3,	loop_1990
	fbo,a	%fcc0,	loop_1991
	nop
	set	0x21, %o5
	ldstub	[%l7 + %o5],	%l1
	tle	%xcc,	0x4
loop_1990:
	fmovsn	%xcc,	%f15,	%f17
loop_1991:
	ldsb	[%l7 + 0x35],	%o5
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x22] %asi,	%g3
	array32	%i0,	%i7,	%o0
	fmovdcs	%xcc,	%f20,	%f10
	orn	%i2,	0x1073,	%l0
	orncc	%o4,	0x1862,	%i6
	fmovscs	%xcc,	%f8,	%f17
	edge8ln	%l6,	%o6,	%g1
	edge8	%i3,	%i5,	%l3
	fbug	%fcc2,	loop_1992
	udiv	%o3,	0x004E,	%g6
	edge8	%o7,	%l2,	%g5
	fbug	%fcc0,	loop_1993
loop_1992:
	tg	%xcc,	0x5
	movre	%o1,	%i1,	%g4
	taddcctv	%g7,	0x1297,	%g2
loop_1993:
	srl	%l5,	%l4,	%i4
	fandnot1	%f30,	%f16,	%f0
	bshuffle	%f6,	%f18,	%f16
	fmovdpos	%icc,	%f26,	%f23
	alignaddrl	%l1,	%o2,	%o5
	fmul8x16al	%f6,	%f23,	%f26
	taddcctv	%g3,	0x1FCF,	%i7
	fmovde	%xcc,	%f21,	%f18
	xorcc	%i0,	0x1E46,	%i2
	wr	%g0,	0x11,	%asi
	sta	%f29,	[%l7 + 0x5C] %asi
	wr	%g0,	0xe2,	%asi
	stba	%o0,	[%l7 + 0x62] %asi
	membar	#Sync
	set	0x30, %l6
	ldda	[%l7 + %l6] 0x19,	%l0
	edge16	%o4,	%l6,	%i6
	sub	%g1,	0x1900,	%o6
	srl	%i3,	%l3,	%i5
	ld	[%l7 + 0x7C],	%f11
	sdivx	%o3,	0x1E35,	%g6
	lduh	[%l7 + 0x70],	%o7
	fpsub32	%f10,	%f20,	%f4
	bge	%icc,	loop_1994
	tneg	%xcc,	0x4
	srlx	%g5,	%l2,	%o1
	orcc	%g4,	0x01D3,	%i1
loop_1994:
	fnands	%f14,	%f18,	%f0
	array8	%g7,	%l5,	%l4
	set	0x10, %g3
	ldsba	[%l7 + %g3] 0x14,	%g2
	fmovsvs	%icc,	%f14,	%f17
	tg	%xcc,	0x5
	fmovsleu	%icc,	%f31,	%f25
	movcc	%xcc,	%i4,	%o2
	fmul8sux16	%f6,	%f18,	%f2
	srlx	%l1,	0x1C,	%o5
	fmovspos	%xcc,	%f23,	%f1
	ba,a,pn	%icc,	loop_1995
	bcs	%xcc,	loop_1996
	alignaddrl	%i7,	%g3,	%i2
	addcc	%o0,	0x194F,	%l0
loop_1995:
	tvc	%icc,	0x3
loop_1996:
	nop
	set	0x70, %g2
	ldxa	[%l7 + %g2] 0x11,	%o4
	edge32l	%l6,	%i0,	%g1
	brgez,a	%o6,	loop_1997
	addcc	%i3,	0x1800,	%l3
	fcmple16	%f24,	%f2,	%i6
	sdivcc	%i5,	0x1D8B,	%o3
loop_1997:
	edge16l	%o7,	%g5,	%g6
	xnorcc	%l2,	%o1,	%g4
	fors	%f20,	%f26,	%f2
	ldsh	[%l7 + 0x3A],	%g7
	movgu	%icc,	%i1,	%l5
	fcmple16	%f26,	%f6,	%l4
	fmovrde	%i4,	%f0,	%f20
	ld	[%l7 + 0x60],	%f5
	movcc	%xcc,	%o2,	%l1
	edge16	%o5,	%i7,	%g2
	udiv	%g3,	0x0988,	%i2
	wr	%g0,	0x2b,	%asi
	stwa	%o0,	[%l7 + 0x28] %asi
	membar	#Sync
	wr	%g0,	0x88,	%asi
	stda	%l0,	[%l7 + 0x48] %asi
	sra	%l6,	%i0,	%o4
	set	0x17, %i0
	ldstuba	[%l7 + %i0] 0x11,	%o6
	lduw	[%l7 + 0x70],	%g1
	fcmpeq32	%f18,	%f24,	%i3
	ta	%xcc,	0x4
	brgz	%i6,	loop_1998
	movgu	%icc,	%l3,	%i5
	add	%o7,	%o3,	%g6
	fmovrsne	%l2,	%f1,	%f15
loop_1998:
	or	%g5,	%g4,	%o1
	movrlez	%i1,	%g7,	%l4
	stbar
	and	%l5,	0x0294,	%o2
	array8	%l1,	%i4,	%i7
	siam	0x6
	fpsub16	%f12,	%f8,	%f14
	fmuld8sux16	%f31,	%f9,	%f24
	taddcc	%g2,	0x187A,	%o5
	fbule,a	%fcc2,	loop_1999
	alignaddr	%g3,	%o0,	%i2
	edge8ln	%l0,	%i0,	%l6
	udivcc	%o6,	0x001D,	%o4
loop_1999:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x6
	sub	%g1,	0x1CFC,	%i6
	edge32n	%l3,	%i3,	%i5
	udiv	%o3,	0x1134,	%o7
	movrlez	%l2,	%g6,	%g4
	move	%xcc,	%o1,	%i1
	fmovdcs	%icc,	%f1,	%f16
	tvc	%icc,	0x5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g5,	%g7
	tne	%icc,	0x0
	nop
	setx loop_2000, %l0, %l1
	jmpl %l1, %l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o2,	%l1,	%l4
	xnorcc	%i7,	%i4,	%o5
loop_2000:
	orncc	%g3,	%g2,	%i2
	edge16	%o0,	%l0,	%l6
	orcc	%i0,	%o4,	%o6
	fble	%fcc1,	loop_2001
	tleu	%icc,	0x6
	brgz,a	%i6,	loop_2002
	nop
	setx loop_2003, %l0, %l1
	jmpl %l1, %l3
loop_2001:
	movg	%icc,	%i3,	%i5
	and	%o3,	0x00AC,	%o7
loop_2002:
	orcc	%g1,	%l2,	%g6
loop_2003:
	edge8	%o1,	%i1,	%g4
	edge8l	%g7,	%l5,	%o2
	edge32l	%g5,	%l4,	%l1
	ldx	[%l7 + 0x20],	%i4
	wr	%g0,	0xe2,	%asi
	stxa	%i7,	[%l7 + 0x10] %asi
	membar	#Sync
	fcmple32	%f26,	%f16,	%o5
	bcc,a,pn	%xcc,	loop_2004
	fcmpgt32	%f4,	%f12,	%g3
	fbug	%fcc3,	loop_2005
	tge	%xcc,	0x4
loop_2004:
	ldd	[%l7 + 0x78],	%i2
	nop
	setx loop_2006, %l0, %l1
	jmpl %l1, %g2
loop_2005:
	edge32ln	%o0,	%l6,	%i0
	movleu	%xcc,	%l0,	%o4
	orcc	%i6,	0x1391,	%o6
loop_2006:
	fmovdne	%icc,	%f24,	%f19
	tcc	%xcc,	0x2
	fmovdn	%icc,	%f5,	%f21
	fpackfix	%f10,	%f5
	tge	%xcc,	0x4
	call	loop_2007
	ld	[%l7 + 0x3C],	%f8
	tg	%icc,	0x5
	subcc	%i3,	0x0028,	%i5
loop_2007:
	orcc	%o3,	0x1D83,	%l3
	std	%f2,	[%l7 + 0x48]
	bg,pt	%xcc,	loop_2008
	alignaddrl	%o7,	%l2,	%g6
	set	0x76, %g1
	lduha	[%l7 + %g1] 0x11,	%o1
loop_2008:
	addc	%g1,	%i1,	%g4
	alignaddrl	%l5,	%o2,	%g5
	popc	%g7,	%l4
	edge32l	%l1,	%i7,	%o5
	umul	%i4,	%i2,	%g2
	fmovsleu	%icc,	%f13,	%f16
	subccc	%g3,	%l6,	%o0
	edge8ln	%l0,	%o4,	%i6
	brgez,a	%o6,	loop_2009
	array32	%i0,	%i3,	%i5
	add	%l3,	0x1B86,	%o7
	membar	0x34
loop_2009:
	lduh	[%l7 + 0x7E],	%l2
	tneg	%xcc,	0x2
	fsrc1s	%f4,	%f21
	edge16n	%g6,	%o3,	%g1
	fpackfix	%f0,	%f26
	move	%xcc,	%i1,	%g4
	array32	%l5,	%o2,	%o1
	brlez	%g7,	loop_2010
	edge8n	%l4,	%g5,	%i7
	tg	%xcc,	0x3
	bn	loop_2011
loop_2010:
	array32	%o5,	%l1,	%i4
	movcc	%icc,	%i2,	%g3
	andncc	%l6,	%g2,	%l0
loop_2011:
	addcc	%o0,	%o4,	%i6
	edge32	%i0,	%i3,	%o6
	ble,pn	%xcc,	loop_2012
	sethi	0x0884,	%l3
	movrlz	%o7,	%i5,	%l2
	fmovsn	%xcc,	%f15,	%f11
loop_2012:
	fmovsge	%xcc,	%f27,	%f21
	nop
	set	0x6F, %i6
	stb	%g6,	[%l7 + %i6]
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%i1
	membar	0x06
	fexpand	%f23,	%f10
	movn	%icc,	%g4,	%o3
	brgez,a	%o2,	loop_2013
	sdiv	%l5,	0x1215,	%o1
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0xf1
	membar	#Sync
loop_2013:
	sethi	0x0B93,	%g7
	xorcc	%l4,	0x0FBA,	%g5
	bl,a,pt	%icc,	loop_2014
	orn	%o5,	0x0EAE,	%i7
	edge16ln	%l1,	%i4,	%i2
	sethi	0x0964,	%g3
loop_2014:
	fbul,a	%fcc1,	loop_2015
	bneg	loop_2016
	taddcc	%l6,	0x1608,	%l0
	addc	%o0,	%o4,	%i6
loop_2015:
	tpos	%xcc,	0x3
loop_2016:
	subc	%g2,	0x15A3,	%i3
	sethi	0x035B,	%o6
	movrgz	%l3,	0x19F,	%o7
	fpsub32s	%f8,	%f28,	%f5
	fmovdneg	%icc,	%f22,	%f16
	fbne	%fcc2,	loop_2017
	fbe	%fcc0,	loop_2018
	subc	%i0,	0x1124,	%l2
	fcmped	%fcc3,	%f12,	%f4
loop_2017:
	fornot1	%f18,	%f22,	%f18
loop_2018:
	edge8ln	%g6,	%g1,	%i1
	stw	%g4,	[%l7 + 0x2C]
	ta	%icc,	0x5
	set	0x0C, %l5
	swapa	[%l7 + %l5] 0x11,	%o3
	fbn,a	%fcc2,	loop_2019
	udivx	%o2,	0x0EA1,	%l5
	subccc	%i5,	%o1,	%g7
	tn	%xcc,	0x7
loop_2019:
	mulscc	%l4,	0x1AE8,	%g5
	fbule,a	%fcc0,	loop_2020
	ble,a,pt	%xcc,	loop_2021
	andn	%o5,	%l1,	%i7
	movge	%icc,	%i2,	%i4
loop_2020:
	movrgz	%g3,	0x127,	%l0
loop_2021:
	smulcc	%o0,	%l6,	%o4
	edge16	%g2,	%i3,	%o6
	ldd	[%l7 + 0x60],	%f30
	fpmerge	%f26,	%f16,	%f22
	set	0x40, %o3
	stda	%f0,	[%l7 + %o3] 0x1f
	membar	#Sync
	tsubcc	%i6,	%o7,	%i0
	movge	%icc,	%l2,	%l3
	orncc	%g1,	%i1,	%g6
	ldub	[%l7 + 0x46],	%g4
	stx	%o3,	[%l7 + 0x30]
	movcs	%xcc,	%o2,	%i5
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x58] %asi,	%f4
	fmul8x16al	%f5,	%f2,	%f16
	fsrc1s	%f29,	%f18
	tsubcc	%l5,	0x170C,	%o1
	fba,a	%fcc1,	loop_2022
	sdivcc	%g7,	0x1578,	%l4
	membar	0x68
	umul	%g5,	0x05C1,	%l1
loop_2022:
	movl	%icc,	%i7,	%o5
	edge16l	%i4,	%i2,	%g3
	tvc	%xcc,	0x5
	fcmpes	%fcc2,	%f2,	%f24
	umulcc	%o0,	%l0,	%o4
	mulscc	%g2,	%i3,	%l6
	mulx	%o6,	0x079A,	%o7
	srl	%i6,	0x0B,	%i0
	tge	%xcc,	0x5
	tg	%xcc,	0x2
	tsubcc	%l3,	%g1,	%l2
	fbu	%fcc0,	loop_2023
	sir	0x11DD
	movrlez	%g6,	%i1,	%g4
	fmovsge	%icc,	%f31,	%f29
loop_2023:
	tvc	%icc,	0x6
	fmul8sux16	%f0,	%f26,	%f8
	fmovsge	%icc,	%f2,	%f17
	xnor	%o2,	0x1731,	%o3
	edge16n	%i5,	%o1,	%l5
	xnorcc	%l4,	%g5,	%l1
	addcc	%i7,	%g7,	%i4
	sethi	0x082E,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fblg	%fcc0,	loop_2024
	movrlez	%o5,	%g3,	%l0
	udivx	%o0,	0x180A,	%o4
	sllx	%i3,	0x0B,	%l6
loop_2024:
	movgu	%icc,	%o6,	%g2
	fbu	%fcc0,	loop_2025
	tsubcctv	%i6,	%i0,	%l3
	fmul8ulx16	%f30,	%f8,	%f30
	fmovrsne	%g1,	%f9,	%f23
loop_2025:
	or	%o7,	0x1C39,	%l2
	orncc	%g6,	%i1,	%g4
	edge8ln	%o2,	%i5,	%o3
	udivcc	%o1,	0x0426,	%l5
	edge8ln	%l4,	%l1,	%g5
	fxors	%f21,	%f3,	%f26
	bg,a,pt	%icc,	loop_2026
	movle	%icc,	%g7,	%i4
	lduw	[%l7 + 0x74],	%i7
	udivx	%o5,	0x0FA3,	%i2
loop_2026:
	fble	%fcc2,	loop_2027
	sth	%g3,	[%l7 + 0x34]
	movpos	%icc,	%o0,	%l0
	mova	%xcc,	%o4,	%i3
loop_2027:
	tge	%xcc,	0x2
	fmovsl	%xcc,	%f27,	%f9
	fmovdvc	%icc,	%f10,	%f24
	xnor	%l6,	0x18DC,	%o6
	fcmped	%fcc0,	%f4,	%f20
	tle	%xcc,	0x2
	fpsub16	%f28,	%f10,	%f6
	fmovd	%f20,	%f8
	orn	%g2,	0x0581,	%i0
	and	%i6,	%g1,	%l3
	movl	%icc,	%l2,	%o7
	orn	%i1,	%g4,	%o2
	fbe,a	%fcc1,	loop_2028
	ble,a,pn	%xcc,	loop_2029
	flush	%l7 + 0x7C
	wr	%g0,	0xe3,	%asi
	stxa	%g6,	[%l7 + 0x20] %asi
	membar	#Sync
loop_2028:
	fmovrdgez	%i5,	%f24,	%f24
loop_2029:
	tgu	%xcc,	0x0
	taddcctv	%o3,	%o1,	%l5
	add	%l1,	%g5,	%l4
	addccc	%g7,	0x1FD3,	%i7
	edge32n	%i4,	%o5,	%g3
	srl	%o0,	0x01,	%i2
	fbue	%fcc0,	loop_2030
	ld	[%l7 + 0x70],	%f16
	swap	[%l7 + 0x14],	%o4
	movleu	%xcc,	%i3,	%l0
loop_2030:
	ble,pn	%xcc,	loop_2031
	tgu	%icc,	0x5
	edge16	%o6,	%l6,	%i0
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i6,	%g1
loop_2031:
	fands	%f28,	%f18,	%f29
	edge8ln	%g2,	%l3,	%o7
	set	0x43, %g7
	lduba	[%l7 + %g7] 0x0c,	%i1
	nop
	setx loop_2032, %l0, %l1
	jmpl %l1, %l2
	andncc	%g4,	%g6,	%o2
	movpos	%icc,	%i5,	%o3
	sllx	%o1,	%l1,	%l5
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
	movcs	%icc,	%g5,	%l4
	srax	%i7,	%g7,	%o5
	for	%f4,	%f28,	%f18
loop_2033:
	fblg,a	%fcc3,	loop_2034
	tcs	%icc,	0x4
	ba,a	%xcc,	loop_2035
	movcs	%xcc,	%g3,	%i4
loop_2034:
	nop
	setx loop_2036, %l0, %l1
	jmpl %l1, %i2
	movle	%icc,	%o4,	%o0
loop_2035:
	tneg	%icc,	0x4
	edge16n	%i3,	%o6,	%l0
loop_2036:
	te	%xcc,	0x3
	fmovde	%icc,	%f6,	%f20
	fcmpd	%fcc0,	%f20,	%f10
	alignaddr	%l6,	%i0,	%i6
	set	0x68, %i4
	stha	%g1,	[%l7 + %i4] 0x15
	tpos	%icc,	0x7
	orn	%g2,	%o7,	%l3
	tvs	%icc,	0x4
	nop
	set	0x6C, %i2
	lduh	[%l7 + %i2],	%i1
	smulcc	%g4,	%g6,	%o2
	fbuge	%fcc1,	loop_2037
	andncc	%i5,	%o3,	%o1
	sethi	0x0B36,	%l1
	orn	%l2,	%g5,	%l5
loop_2037:
	orncc	%l4,	%g7,	%o5
	fmuld8sux16	%f31,	%f2,	%f8
	tvc	%xcc,	0x2
	set	0x28, %i5
	stxa	%i7,	[%l7 + %i5] 0x23
	membar	#Sync
	edge16n	%i4,	%i2,	%g3
	tne	%xcc,	0x5
	tsubcctv	%o0,	%o4,	%i3
	te	%xcc,	0x6
	fbu	%fcc3,	loop_2038
	brz	%l0,	loop_2039
	orcc	%o6,	0x0762,	%l6
	ldd	[%l7 + 0x58],	%i6
loop_2038:
	fbl	%fcc0,	loop_2040
loop_2039:
	array16	%i0,	%g1,	%g2
	alignaddrl	%l3,	%o7,	%i1
	tge	%xcc,	0x2
loop_2040:
	tl	%icc,	0x3
	orncc	%g6,	%o2,	%g4
	fpackfix	%f22,	%f19
	brnz	%i5,	loop_2041
	fbg	%fcc0,	loop_2042
	movle	%xcc,	%o1,	%o3
	bne,a	%icc,	loop_2043
loop_2041:
	tn	%xcc,	0x7
loop_2042:
	xnorcc	%l1,	%l2,	%l5
	orncc	%g5,	%g7,	%l4
loop_2043:
	ta	%icc,	0x4
	brlez,a	%i7,	loop_2044
	alignaddr	%o5,	%i4,	%i2
	edge32l	%o0,	%o4,	%g3
	tvc	%icc,	0x4
loop_2044:
	movn	%xcc,	%l0,	%o6
	sllx	%l6,	%i6,	%i0
	fmovdvc	%icc,	%f5,	%f31
	tne	%xcc,	0x1
	andncc	%i3,	%g1,	%l3
	tge	%icc,	0x6
	fbug,a	%fcc2,	loop_2045
	bne,a,pt	%xcc,	loop_2046
	fxnors	%f15,	%f27,	%f29
	movrne	%g2,	0x393,	%i1
loop_2045:
	ldd	[%l7 + 0x50],	%f0
loop_2046:
	std	%f30,	[%l7 + 0x68]
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%g6
	umul	%o2,	0x06C9,	%g4
	xor	%i5,	0x03F3,	%o7
	nop
	set	0x52, %l1
	lduh	[%l7 + %l1],	%o1
	fba	%fcc1,	loop_2047
	movleu	%xcc,	%l1,	%o3
	sdivx	%l5,	0x1A9A,	%g5
	mova	%icc,	%l2,	%g7
loop_2047:
	addcc	%l4,	0x01AB,	%o5
	smulcc	%i7,	%i2,	%i4
	tn	%xcc,	0x5
	pdist	%f30,	%f16,	%f14
	tvc	%icc,	0x7
	fmovrdne	%o0,	%f22,	%f12
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x78] %asi,	%f22
	te	%xcc,	0x6
	taddcctv	%o4,	%g3,	%o6
	te	%xcc,	0x6
	move	%xcc,	%l0,	%i6
	swap	[%l7 + 0x5C],	%l6
	udivx	%i3,	0x0DA4,	%i0
	movcs	%icc,	%l3,	%g2
	smul	%g1,	%g6,	%i1
	tg	%xcc,	0x6
	subcc	%g4,	0x175A,	%i5
	xor	%o2,	%o7,	%l1
	xorcc	%o1,	%l5,	%g5
	fxors	%f13,	%f12,	%f13
	fpadd16	%f4,	%f12,	%f16
	fmovsvs	%icc,	%f14,	%f11
	fbn	%fcc3,	loop_2048
	srax	%l2,	%g7,	%o3
	edge16	%o5,	%i7,	%l4
	fornot1s	%f4,	%f9,	%f31
loop_2048:
	tgu	%icc,	0x2
	set	0x48, %o6
	prefetcha	[%l7 + %o6] 0x14,	 0x1
	edge16n	%o0,	%o4,	%g3
	srlx	%i2,	%o6,	%l0
	edge8n	%i6,	%i3,	%l6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x6C] %asi,	%i0
	sll	%l3,	0x18,	%g2
	alignaddr	%g1,	%i1,	%g4
	umul	%i5,	0x1220,	%g6
	tgu	%icc,	0x5
	flush	%l7 + 0x10
	edge16n	%o7,	%o2,	%o1
	addccc	%l1,	0x148F,	%l5
	movl	%icc,	%g5,	%g7
	sdivcc	%o3,	0x08A6,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i7
	casa	[%l6] %asi,	%i7,	%l2
	movvc	%icc,	%l4,	%o0
	fbge	%fcc3,	loop_2049
	movn	%xcc,	%i4,	%o4
	fmovdcc	%icc,	%f13,	%f1
	stx	%g3,	[%l7 + 0x40]
loop_2049:
	fcmped	%fcc2,	%f8,	%f30
	bn,a	loop_2050
	bn,pt	%xcc,	loop_2051
	tsubcctv	%o6,	%i2,	%l0
	edge32	%i6,	%l6,	%i0
loop_2050:
	smulcc	%i3,	%g2,	%g1
loop_2051:
	movrlez	%l3,	%g4,	%i5
	movrgz	%i1,	%o7,	%g6
	or	%o1,	0x0522,	%o2
	tge	%icc,	0x6
	xor	%l1,	%l5,	%g7
	movcs	%icc,	%g5,	%o5
	bg	loop_2052
	fmovdleu	%xcc,	%f10,	%f6
	or	%i7,	%o3,	%l4
	array32	%l2,	%i4,	%o4
loop_2052:
	move	%icc,	%g3,	%o6
	fbn,a	%fcc3,	loop_2053
	sra	%o0,	%i2,	%i6
	movpos	%icc,	%l6,	%i0
	orncc	%i3,	0x0543,	%l0
loop_2053:
	tg	%icc,	0x1
	edge16ln	%g1,	%l3,	%g2
	te	%xcc,	0x1
	fble,a	%fcc0,	loop_2054
	taddcctv	%i5,	0x143B,	%g4
	move	%icc,	%o7,	%i1
	bne,pt	%xcc,	loop_2055
loop_2054:
	fmuld8sux16	%f25,	%f26,	%f20
	fxors	%f19,	%f29,	%f24
	edge8ln	%g6,	%o1,	%o2
loop_2055:
	nop
	setx loop_2056, %l0, %l1
	jmpl %l1, %l1
	mova	%icc,	%l5,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a	%icc,	loop_2057
loop_2056:
	fmovrdgz	%g7,	%f12,	%f6
	andn	%i7,	%o3,	%l4
	orn	%o5,	0x1EED,	%i4
loop_2057:
	bvs,a	loop_2058
	fxor	%f30,	%f18,	%f30
	edge8n	%o4,	%g3,	%l2
	movre	%o0,	%o6,	%i2
loop_2058:
	movgu	%xcc,	%l6,	%i6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x10] %asi,	%i3
	tn	%icc,	0x0
	te	%icc,	0x6
	taddcc	%l0,	0x0CF0,	%g1
	and	%i0,	0x11E5,	%g2
	movg	%icc,	%l3,	%g4
	array8	%i5,	%i1,	%g6
	fmovdpos	%xcc,	%f28,	%f16
	mulx	%o1,	0x1D9E,	%o7
	fmovsneg	%xcc,	%f18,	%f18
	ldd	[%l7 + 0x20],	%l0
	alignaddr	%o2,	%g5,	%l5
	movpos	%icc,	%g7,	%i7
	fmovdn	%xcc,	%f5,	%f5
	tgu	%icc,	0x6
	alignaddr	%o3,	%o5,	%i4
	fabss	%f14,	%f24
	alignaddrl	%o4,	%l4,	%g3
	sra	%l2,	0x16,	%o6
	taddcc	%i2,	%o0,	%i6
	alignaddrl	%l6,	%l0,	%g1
	wr	%g0,	0x0c,	%asi
	stba	%i3,	[%l7 + 0x0D] %asi
	udiv	%g2,	0x1069,	%i0
	tgu	%icc,	0x2
	mulx	%g4,	%i5,	%l3
	stw	%i1,	[%l7 + 0x58]
	udivcc	%o1,	0x0966,	%o7
	move	%icc,	%l1,	%g6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x38] %asi,	%g5
	andncc	%o2,	%l5,	%g7
	sdiv	%o3,	0x1D99,	%i7
	bleu,pt	%icc,	loop_2059
	movvs	%xcc,	%o5,	%o4
	xorcc	%i4,	0x1556,	%l4
	movrlz	%l2,	%g3,	%o6
loop_2059:
	tvs	%icc,	0x3
	fmovdl	%xcc,	%f15,	%f30
	movne	%xcc,	%o0,	%i2
	andn	%i6,	0x00CC,	%l0
	ldd	[%l7 + 0x30],	%g0
	fmul8sux16	%f16,	%f10,	%f12
	fpack32	%f2,	%f16,	%f24
	smulcc	%i3,	0x1C4F,	%g2
	brlz,a	%l6,	loop_2060
	fmovrdgez	%i0,	%f6,	%f18
	fpack32	%f4,	%f4,	%f2
	orncc	%g4,	%i5,	%i1
loop_2060:
	fbne	%fcc2,	loop_2061
	fmovdne	%xcc,	%f22,	%f3
	orn	%l3,	0x1B92,	%o7
	movge	%xcc,	%o1,	%l1
loop_2061:
	tsubcc	%g6,	0x0E45,	%o2
	brlz,a	%g5,	loop_2062
	edge8n	%l5,	%o3,	%g7
	tne	%icc,	0x5
	set	0x10, %o0
	ldsha	[%l7 + %o0] 0x14,	%o5
loop_2062:
	edge32n	%o4,	%i4,	%l4
	set	0x28, %o1
	swapa	[%l7 + %o1] 0x89,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x6
	smulcc	%g3,	0x0DE4,	%l2
	udivx	%o0,	0x1B13,	%i2
	movrlz	%o6,	%l0,	%i6
	add	%g1,	0x0164,	%g2
	fmovsn	%icc,	%f7,	%f22
	or	%i3,	%i0,	%g4
	edge32n	%i5,	%i1,	%l6
	fpsub16	%f18,	%f0,	%f8
	array8	%o7,	%o1,	%l1
	fcmple32	%f12,	%f2,	%g6
	edge32	%l3,	%g5,	%l5
	brz	%o2,	loop_2063
	movrlez	%o3,	%g7,	%o5
	movpos	%xcc,	%i4,	%l4
	subcc	%o4,	0x0FFA,	%g3
loop_2063:
	fbne	%fcc0,	loop_2064
	movl	%xcc,	%l2,	%i7
	fbl	%fcc0,	loop_2065
	tge	%icc,	0x7
loop_2064:
	bl,a	%icc,	loop_2066
	fsrc2s	%f21,	%f2
loop_2065:
	movg	%xcc,	%i2,	%o6
	alignaddrl	%l0,	%o0,	%g1
loop_2066:
	sdivcc	%i6,	0x056D,	%i3
	sllx	%g2,	%g4,	%i5
	tcs	%icc,	0x1
	or	%i0,	0x1600,	%l6
	movcc	%icc,	%o7,	%i1
	edge16l	%l1,	%g6,	%o1
	fmovsn	%xcc,	%f24,	%f1
	bn,pn	%xcc,	loop_2067
	edge8	%g5,	%l5,	%o2
	ldub	[%l7 + 0x7E],	%o3
	mulx	%g7,	%l3,	%i4
loop_2067:
	mova	%icc,	%l4,	%o4
	movre	%o5,	%g3,	%i7
	tcs	%xcc,	0x3
	fxnor	%f16,	%f22,	%f0
	sdivcc	%l2,	0x0AA0,	%o6
	movleu	%xcc,	%l0,	%i2
	tne	%xcc,	0x6
	nop
	setx	loop_2068,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	std	%g0,	[%l7 + 0x70]
	ldx	[%l7 + 0x68],	%i6
	taddcctv	%o0,	0x17E3,	%g2
loop_2068:
	fmovsleu	%icc,	%f31,	%f1
	fbul	%fcc2,	loop_2069
	tle	%icc,	0x6
	movrlz	%g4,	0x3DC,	%i5
	andcc	%i3,	%l6,	%o7
loop_2069:
	movvc	%xcc,	%i0,	%i1
	edge32ln	%g6,	%l1,	%o1
	edge8	%g5,	%o2,	%l5
	xnor	%g7,	0x1702,	%l3
	movn	%xcc,	%i4,	%o3
	fmovdneg	%xcc,	%f1,	%f15
	array8	%o4,	%o5,	%l4
	ldstub	[%l7 + 0x2E],	%i7
	fmovrsgez	%l2,	%f31,	%f22
	te	%icc,	0x7
	bn,pt	%xcc,	loop_2070
	tvc	%icc,	0x2
	movrne	%g3,	0x048,	%l0
	for	%f24,	%f26,	%f20
loop_2070:
	movre	%i2,	0x344,	%g1
	set	0x3C, %o4
	stba	%i6,	[%l7 + %o4] 0x89
	fexpand	%f26,	%f26
	edge16n	%o6,	%o0,	%g2
	addccc	%g4,	%i3,	%l6
	add	%o7,	%i5,	%i0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%i1
	movcs	%xcc,	%o1,	%g5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x09] %asi,	%o2
	sll	%l5,	%g7,	%l3
	ldsh	[%l7 + 0x66],	%i4
	edge8l	%l1,	%o4,	%o3
	fmovde	%icc,	%f11,	%f25
	nop
	setx loop_2071, %l0, %l1
	jmpl %l1, %o5
	tsubcc	%i7,	%l2,	%g3
	fbn	%fcc1,	loop_2072
	brgz,a	%l4,	loop_2073
loop_2071:
	sub	%l0,	%g1,	%i6
	subcc	%o6,	0x14C9,	%i2
loop_2072:
	brlz	%o0,	loop_2074
loop_2073:
	ldsw	[%l7 + 0x60],	%g2
	fmovsg	%icc,	%f7,	%f8
	sethi	0x068F,	%i3
loop_2074:
	ldstub	[%l7 + 0x1E],	%l6
	fbl	%fcc1,	loop_2075
	udivx	%g4,	0x1970,	%i5
	xorcc	%o7,	%g6,	%i0
	ldub	[%l7 + 0x64],	%i1
loop_2075:
	fbn,a	%fcc2,	loop_2076
	fmovsleu	%icc,	%f5,	%f8
	sdivcc	%g5,	0x05EA,	%o1
	edge32ln	%l5,	%g7,	%o2
loop_2076:
	ldd	[%l7 + 0x18],	%f8
	srax	%l3,	0x08,	%i4
	fornot2	%f24,	%f20,	%f24
	andn	%o4,	0x1086,	%o3
	fmovsa	%icc,	%f10,	%f12
	stb	%o5,	[%l7 + 0x67]
	stx	%i7,	[%l7 + 0x08]
	tneg	%xcc,	0x4
	xorcc	%l2,	%g3,	%l4
	fmovsg	%icc,	%f4,	%f1
	tle	%xcc,	0x1
	tge	%xcc,	0x2
	movne	%icc,	%l0,	%g1
	edge32l	%i6,	%l1,	%i2
	fba	%fcc3,	loop_2077
	movl	%icc,	%o6,	%o0
	bleu,pt	%icc,	loop_2078
	nop
	setx	loop_2079,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2077:
	tpos	%icc,	0x7
	orcc	%i3,	%l6,	%g2
loop_2078:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x0A] %asi,	%i5
loop_2079:
	umul	%g4,	0x01C3,	%o7
	tsubcc	%i0,	%g6,	%i1
	bne,a	%xcc,	loop_2080
	edge16	%g5,	%l5,	%o1
	fbug,a	%fcc3,	loop_2081
	subc	%o2,	0x0AE0,	%l3
loop_2080:
	edge32	%g7,	%i4,	%o3
	fmovsg	%xcc,	%f0,	%f21
loop_2081:
	movleu	%xcc,	%o5,	%o4
	tn	%icc,	0x7
	tvc	%icc,	0x5
	edge8ln	%l2,	%i7,	%g3
	fbe,a	%fcc1,	loop_2082
	tge	%xcc,	0x6
	bne,a,pt	%xcc,	loop_2083
	edge16l	%l4,	%g1,	%l0
loop_2082:
	edge32n	%i6,	%i2,	%l1
	andn	%o6,	%o0,	%l6
loop_2083:
	edge32n	%i3,	%g2,	%g4
	fsrc2s	%f8,	%f14
	fmovdvc	%xcc,	%f20,	%f9
	tvc	%xcc,	0x5
	ldsb	[%l7 + 0x24],	%i5
	bgu,a,pt	%icc,	loop_2084
	add	%o7,	%g6,	%i1
	array16	%g5,	%i0,	%l5
	edge8ln	%o2,	%l3,	%o1
loop_2084:
	orcc	%i4,	0x1737,	%g7
	bl,a,pt	%icc,	loop_2085
	andcc	%o5,	%o4,	%o3
	edge8n	%l2,	%g3,	%i7
	fones	%f17
loop_2085:
	edge32ln	%g1,	%l4,	%l0
	fmovdcs	%xcc,	%f6,	%f29
	popc	0x14C1,	%i6
	brlz,a	%l1,	loop_2086
	edge16l	%o6,	%o0,	%i2
	brgez,a	%i3,	loop_2087
	udivx	%g2,	0x1165,	%l6
loop_2086:
	sllx	%i5,	%g4,	%g6
	popc	0x029E,	%o7
loop_2087:
	nop
	set	0x56, %i7
	stha	%i1,	[%l7 + %i7] 0xeb
	membar	#Sync
	addc	%i0,	0x0580,	%l5
	fmovsgu	%xcc,	%f20,	%f4
	ldsh	[%l7 + 0x58],	%o2
	ldd	[%l7 + 0x78],	%f28
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x54] %asi,	%g5
	mulscc	%l3,	0x0695,	%o1
	mulx	%g7,	0x1E48,	%i4
	movre	%o4,	%o3,	%l2
	bcc,pt	%xcc,	loop_2088
	brgez	%o5,	loop_2089
	edge8ln	%g3,	%g1,	%l4
	udivx	%l0,	0x0392,	%i6
loop_2088:
	xorcc	%i7,	0x18C8,	%o6
loop_2089:
	fpsub16s	%f11,	%f13,	%f3
	srax	%o0,	%i2,	%i3
	membar	0x46
	ta	%xcc,	0x2
	nop
	setx	loop_2090,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%l1,	%l6,	%g2
	fcmple32	%f30,	%f12,	%g4
	lduw	[%l7 + 0x48],	%i5
loop_2090:
	siam	0x2
	edge32ln	%o7,	%i1,	%i0
	alignaddr	%l5,	%g6,	%o2
	array32	%g5,	%l3,	%g7
	addcc	%o1,	0x1620,	%i4
	st	%f29,	[%l7 + 0x50]
	tne	%xcc,	0x3
	fmovdcs	%icc,	%f8,	%f8
	subc	%o3,	0x0A93,	%l2
	andn	%o4,	%o5,	%g3
	fmul8sux16	%f24,	%f10,	%f2
	fbe,a	%fcc0,	loop_2091
	sra	%g1,	0x0C,	%l4
	movcc	%xcc,	%i6,	%l0
	fpsub16	%f26,	%f0,	%f26
loop_2091:
	array32	%i7,	%o6,	%o0
	sllx	%i3,	%l1,	%l6
	bl	loop_2092
	edge16	%i2,	%g4,	%i5
	movvs	%icc,	%o7,	%i1
	flush	%l7 + 0x4C
loop_2092:
	movrlez	%i0,	0x099,	%g2
	movleu	%icc,	%l5,	%g6
	sdivcc	%o2,	0x10F0,	%l3
	tgu	%xcc,	0x4
	bneg,a,pt	%icc,	loop_2093
	add	%g7,	%g5,	%i4
	movcs	%icc,	%o1,	%o3
	brnz	%o4,	loop_2094
loop_2093:
	addc	%o5,	0x1EF9,	%l2
	wr	%g0,	0x80,	%asi
	stba	%g3,	[%l7 + 0x5D] %asi
loop_2094:
	sdivx	%l4,	0x0945,	%i6
	tsubcc	%l0,	%g1,	%o6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x74] %asi,	%i7
	movvc	%xcc,	%i3,	%o0
	fble,a	%fcc2,	loop_2095
	fpadd32s	%f23,	%f14,	%f13
	lduw	[%l7 + 0x3C],	%l6
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i2
loop_2095:
	nop
	set	0x0, %o2
	stxa	%l1,	[%g0 + %o2] 0x57
	tcc	%xcc,	0x3
	movcc	%xcc,	%g4,	%o7
	tpos	%icc,	0x6
	fcmpes	%fcc1,	%f6,	%f8
	sir	0x103E
	fornot1s	%f31,	%f15,	%f7
	prefetch	[%l7 + 0x7C],	 0x0
	fmovdne	%icc,	%f7,	%f3
	orn	%i5,	0x1495,	%i1
	membar	0x55
	stw	%i0,	[%l7 + 0x7C]
	taddcc	%l5,	%g2,	%g6
	st	%f6,	[%l7 + 0x60]
	sir	0x0819
	edge8n	%l3,	%o2,	%g7
	fcmpne32	%f26,	%f0,	%i4
	taddcctv	%o1,	%o3,	%o4
	or	%g5,	0x09C0,	%l2
	edge8n	%o5,	%l4,	%g3
	movneg	%xcc,	%i6,	%l0
	popc	%o6,	%i7
	nop
	setx loop_2096, %l0, %l1
	jmpl %l1, %g1
	array16	%o0,	%i3,	%i2
	movrlez	%l1,	%l6,	%g4
	edge32n	%i5,	%i1,	%i0
loop_2096:
	xnorcc	%l5,	0x0F07,	%g2
	fmovs	%f25,	%f4
	fmovdgu	%xcc,	%f0,	%f5
	sethi	0x1568,	%o7
	fbg,a	%fcc3,	loop_2097
	movvs	%xcc,	%g6,	%l3
	membar	0x32
	alignaddr	%o2,	%g7,	%i4
loop_2097:
	addccc	%o3,	%o4,	%o1
	andncc	%l2,	%o5,	%l4
	mova	%icc,	%g5,	%i6
	fbn,a	%fcc3,	loop_2098
	fmovdneg	%xcc,	%f18,	%f29
	udivcc	%l0,	0x136C,	%o6
	xnorcc	%g3,	0x1F44,	%i7
loop_2098:
	edge16	%o0,	%g1,	%i3
	array16	%i2,	%l1,	%g4
	sub	%l6,	%i1,	%i0
	orncc	%l5,	0x02D1,	%g2
	fble,a	%fcc0,	loop_2099
	ldd	[%l7 + 0x30],	%i4
	edge32l	%o7,	%g6,	%o2
	xorcc	%g7,	%l3,	%i4
loop_2099:
	sra	%o3,	0x17,	%o4
	movrgez	%l2,	%o1,	%l4
	movl	%xcc,	%g5,	%o5
	edge16l	%l0,	%o6,	%i6
	fmovrsgz	%g3,	%f15,	%f13
	move	%icc,	%o0,	%g1
	and	%i3,	0x0114,	%i2
	fabss	%f15,	%f20
	sllx	%i7,	%g4,	%l6
	tl	%icc,	0x4
	fmovsvc	%icc,	%f22,	%f19
	sdiv	%l1,	0x1697,	%i1
	mova	%xcc,	%i0,	%l5
	edge32l	%i5,	%g2,	%g6
	set	0x46, %g5
	ldsha	[%l7 + %g5] 0x14,	%o7
	tsubcctv	%o2,	0x015F,	%g7
	fbl,a	%fcc0,	loop_2100
	fmovdpos	%icc,	%f10,	%f8
	tge	%icc,	0x6
	fbne	%fcc2,	loop_2101
loop_2100:
	tneg	%xcc,	0x5
	xnor	%l3,	%o3,	%i4
	bneg,a,pn	%xcc,	loop_2102
loop_2101:
	taddcctv	%o4,	%l2,	%o1
	movneg	%xcc,	%g5,	%l4
	movg	%xcc,	%l0,	%o6
loop_2102:
	tn	%icc,	0x7
	set	0x4B, %l0
	ldsba	[%l7 + %l0] 0x88,	%o5
	sdivcc	%g3,	0x1BAA,	%o0
	smul	%g1,	%i6,	%i3
	tl	%icc,	0x7
	fmovdge	%icc,	%f11,	%f13
	bgu,a,pn	%xcc,	loop_2103
	tvc	%icc,	0x2
	bg,a,pn	%xcc,	loop_2104
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2103:
	xnorcc	%i7,	%i2,	%l6
	fmovsl	%icc,	%f25,	%f28
loop_2104:
	edge8ln	%l1,	%i1,	%i0
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x10] %asi,	%l5
	smulcc	%g4,	0x1D23,	%i5
	bg,a	%icc,	loop_2105
	fmul8x16	%f9,	%f2,	%f20
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%g6
loop_2105:
	movrne	%o7,	%o2,	%g2
	andncc	%l3,	%g7,	%i4
	orn	%o3,	%o4,	%l2
	sir	0x01A1
	movrgz	%g5,	0x360,	%o1
	movcc	%icc,	%l0,	%o6
	fpsub32s	%f26,	%f13,	%f18
	sdiv	%o5,	0x1E0E,	%l4
	edge16ln	%g3,	%g1,	%i6
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x50] %asi,	%o0
	fbul,a	%fcc2,	loop_2106
	fcmps	%fcc1,	%f5,	%f17
	bl,a	%xcc,	loop_2107
	andn	%i7,	%i3,	%l6
loop_2106:
	std	%l0,	[%l7 + 0x18]
	srax	%i1,	%i2,	%l5
loop_2107:
	tge	%xcc,	0x4
	edge16n	%i0,	%i5,	%g4
	fmovrslez	%o7,	%f11,	%f18
	membar	0x33
	ta	%xcc,	0x1
	movrlez	%g6,	0x15E,	%g2
	std	%f30,	[%l7 + 0x40]
	bg,a	%icc,	loop_2108
	sth	%o2,	[%l7 + 0x76]
	alignaddr	%g7,	%l3,	%o3
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2108:
	bvc,pt	%xcc,	loop_2109
	movneg	%icc,	%i4,	%o4
	movneg	%xcc,	%l2,	%o1
	ba,a,pt	%xcc,	loop_2110
loop_2109:
	smulcc	%l0,	0x05E0,	%o6
	sllx	%o5,	%l4,	%g5
	fornot2s	%f0,	%f1,	%f28
loop_2110:
	fmuld8sux16	%f28,	%f25,	%f26
	edge8ln	%g3,	%g1,	%o0
	pdist	%f26,	%f14,	%f22
	brgz,a	%i6,	loop_2111
	bn,a	loop_2112
	fsrc2s	%f12,	%f7
	bvs,a	loop_2113
loop_2111:
	alignaddr	%i3,	%i7,	%l6
loop_2112:
	fcmpgt16	%f18,	%f4,	%i1
	set	0x64, %l2
	ldstuba	[%l7 + %l2] 0x11,	%l1
loop_2113:
	edge8l	%i2,	%l5,	%i5
	fmovdle	%xcc,	%f20,	%f3
	movrlez	%i0,	%g4,	%g6
	tgu	%xcc,	0x1
	movl	%xcc,	%o7,	%o2
	umulcc	%g7,	0x0500,	%g2
	ta	%icc,	0x2
	membar	0x6A
	movn	%icc,	%o3,	%l3
	edge16n	%i4,	%l2,	%o1
	array32	%o4,	%l0,	%o5
	movcc	%xcc,	%l4,	%o6
	edge16n	%g3,	%g5,	%g1
	or	%o0,	%i6,	%i3
	movrgez	%i7,	0x39E,	%i1
	edge32l	%l6,	%i2,	%l1
	addcc	%l5,	0x1184,	%i0
	srlx	%g4,	0x1C,	%g6
	movl	%icc,	%o7,	%o2
	set	0x78, %l3
	lduwa	[%l7 + %l3] 0x18,	%g7
	array16	%i5,	%g2,	%o3
	array8	%i4,	%l2,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,a	%xcc,	loop_2114
	udivx	%o1,	0x022C,	%l0
	umulcc	%o5,	%o4,	%l4
	movvc	%icc,	%o6,	%g5
loop_2114:
	tle	%xcc,	0x7
	fornot1s	%f29,	%f23,	%f3
	fmovdle	%xcc,	%f7,	%f23
	brz,a	%g3,	loop_2115
	fxnor	%f6,	%f16,	%f6
	umulcc	%o0,	%g1,	%i6
	umul	%i7,	%i3,	%l6
loop_2115:
	fmovrdlez	%i1,	%f4,	%f22
	array16	%l1,	%i2,	%l5
	tn	%xcc,	0x2
	fmovse	%icc,	%f17,	%f21
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%i0
	movg	%icc,	%g6,	%o7
	edge16	%g4,	%g7,	%i5
	stbar
	sll	%o2,	%o3,	%g2
	bleu,pt	%xcc,	loop_2116
	bl,a,pt	%icc,	loop_2117
	movcc	%xcc,	%i4,	%l3
	edge32n	%l2,	%o1,	%o5
loop_2116:
	movrgz	%l0,	0x353,	%o4
loop_2117:
	nop
	set	0x3C, %g4
	stwa	%o6,	[%l7 + %g4] 0x04
	taddcctv	%g5,	0x138C,	%g3
	fornot2s	%f30,	%f27,	%f2
	sub	%l4,	%o0,	%i6
	movpos	%xcc,	%i7,	%i3
	movcc	%xcc,	%l6,	%g1
	andcc	%l1,	%i2,	%l5
	subccc	%i1,	%g6,	%o7
	tcs	%icc,	0x7
	ta	%xcc,	0x5
	prefetch	[%l7 + 0x78],	 0x0
	movneg	%xcc,	%i0,	%g4
	ldsw	[%l7 + 0x7C],	%g7
	srlx	%o2,	%o3,	%g2
	bcc,a	%icc,	loop_2118
	movrlz	%i5,	0x246,	%i4
	orcc	%l2,	0x04C8,	%l3
	sir	0x068E
loop_2118:
	sdiv	%o1,	0x07C6,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o4,	%o6,	%l0
	sra	%g3,	0x1C,	%g5
	addccc	%o0,	%l4,	%i6
	move	%icc,	%i7,	%i3
	edge32	%l6,	%l1,	%i2
	edge16n	%l5,	%g1,	%i1
	mulscc	%g6,	0x0565,	%o7
	andn	%i0,	0x1FA7,	%g4
	ldd	[%l7 + 0x70],	%g6
	bgu,a	%icc,	loop_2119
	udivcc	%o2,	0x07A2,	%g2
	sth	%i5,	[%l7 + 0x0A]
	movl	%xcc,	%i4,	%o3
loop_2119:
	ba,a	%xcc,	loop_2120
	smulcc	%l3,	%l2,	%o1
	fands	%f4,	%f26,	%f3
	tleu	%xcc,	0x2
loop_2120:
	bg	loop_2121
	srlx	%o5,	%o4,	%l0
	fcmpgt16	%f22,	%f20,	%o6
	ldstub	[%l7 + 0x41],	%g5
loop_2121:
	tvc	%icc,	0x0
	wr	%g0,	0xea,	%asi
	stba	%o0,	[%l7 + 0x6F] %asi
	membar	#Sync
	fandnot1	%f14,	%f24,	%f20
	fbul	%fcc3,	loop_2122
	ta	%icc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x30] %asi,	%l4
loop_2122:
	tpos	%icc,	0x6
	tgu	%icc,	0x6
	brgz	%g3,	loop_2123
	andncc	%i7,	%i3,	%i6
	umulcc	%l6,	%l1,	%l5
	ldsh	[%l7 + 0x44],	%i2
loop_2123:
	brnz	%g1,	loop_2124
	movcc	%icc,	%i1,	%g6
	bne	loop_2125
	mulx	%i0,	0x0034,	%g4
loop_2124:
	fbo	%fcc2,	loop_2126
	move	%icc,	%g7,	%o2
loop_2125:
	fmovdg	%xcc,	%f11,	%f24
	brlz,a	%o7,	loop_2127
loop_2126:
	ldub	[%l7 + 0x21],	%g2
	tge	%icc,	0x7
	movrgez	%i5,	0x2F8,	%i4
loop_2127:
	srl	%o3,	%l3,	%l2
	udivcc	%o1,	0x0D2F,	%o5
	bcs,pt	%xcc,	loop_2128
	fbg	%fcc0,	loop_2129
	fabss	%f14,	%f18
	srl	%o4,	0x0F,	%o6
loop_2128:
	andncc	%l0,	%g5,	%l4
loop_2129:
	fpsub32	%f8,	%f6,	%f0
	mulx	%g3,	0x1B2C,	%o0
	udiv	%i3,	0x0BF4,	%i6
	fnor	%f2,	%f18,	%f28
	ldstub	[%l7 + 0x0B],	%l6
	movpos	%xcc,	%l1,	%l5
	tsubcctv	%i2,	0x14BF,	%i7
	tleu	%icc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f2,	%f30,	%f4
	sdivx	%g1,	0x0A50,	%i1
	umulcc	%i0,	0x097D,	%g6
	fmovsgu	%xcc,	%f21,	%f8
	movgu	%xcc,	%g4,	%o2
	nop
	setx	loop_2130,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsvs	%icc,	%f20,	%f9
	fmovrdlez	%o7,	%f4,	%f18
	edge32n	%g7,	%g2,	%i5
loop_2130:
	movrlz	%o3,	%l3,	%i4
	fcmpne32	%f22,	%f28,	%o1
	stbar
	set	0x38, %i3
	ldswa	[%l7 + %i3] 0x10,	%o5
	wr	%g0,	0x22,	%asi
	stda	%o4,	[%l7 + 0x28] %asi
	membar	#Sync
	movrgez	%l2,	0x359,	%o6
	tge	%xcc,	0x2
	ldstub	[%l7 + 0x18],	%l0
	andcc	%g5,	%l4,	%o0
	taddcctv	%i3,	%i6,	%g3
	membar	0x45
	array16	%l6,	%l5,	%i2
	fmovdge	%xcc,	%f13,	%f30
	set	0x48, %i1
	prefetcha	[%l7 + %i1] 0x10,	 0x0
	fmovrsgz	%g1,	%f18,	%f17
	std	%i0,	[%l7 + 0x60]
	bvs	%icc,	loop_2131
	tg	%xcc,	0x1
	orncc	%i0,	0x0F04,	%g6
	tcs	%icc,	0x0
loop_2131:
	ba,pn	%xcc,	loop_2132
	edge32	%l1,	%g4,	%o2
	fcmps	%fcc3,	%f19,	%f10
	membar	0x78
loop_2132:
	movl	%xcc,	%o7,	%g7
	smulcc	%g2,	%o3,	%l3
	fmovdle	%icc,	%f16,	%f20
	andncc	%i4,	%i5,	%o5
	edge8l	%o1,	%l2,	%o4
	bvc,a	%icc,	loop_2133
	bleu,pn	%icc,	loop_2134
	tg	%xcc,	0x3
	udivcc	%l0,	0x0383,	%g5
loop_2133:
	array32	%l4,	%o6,	%o0
loop_2134:
	or	%i3,	0x03C9,	%g3
	std	%f24,	[%l7 + 0x10]
	movrne	%i6,	%l5,	%l6
	nop
	set	0x40, %o7
	std	%i2,	[%l7 + %o7]
	taddcc	%i7,	%g1,	%i1
	ldd	[%l7 + 0x68],	%f18
	tsubcc	%i0,	%g6,	%l1
	edge32n	%o2,	%g4,	%g7
	tgu	%icc,	0x7
	srlx	%g2,	0x08,	%o3
	set	0x5E, %g6
	stha	%l3,	[%l7 + %g6] 0x11
	sllx	%i4,	%i5,	%o7
	andcc	%o5,	%l2,	%o1
	edge32ln	%o4,	%g5,	%l0
	fcmpne32	%f10,	%f24,	%l4
	movrgez	%o6,	0x1FD,	%i3
	sub	%g3,	0x07C6,	%o0
	mulscc	%l5,	%l6,	%i6
	edge8l	%i2,	%g1,	%i7
	nop
	setx loop_2135, %l0, %l1
	jmpl %l1, %i0
	tge	%xcc,	0x4
	array8	%g6,	%l1,	%o2
	bge,a	%xcc,	loop_2136
loop_2135:
	sllx	%g4,	%i1,	%g2
	stbar
	bvs,a	%icc,	loop_2137
loop_2136:
	prefetch	[%l7 + 0x18],	 0x1
	fbne,a	%fcc2,	loop_2138
	subccc	%o3,	0x0684,	%l3
loop_2137:
	sll	%g7,	%i4,	%i5
	stbar
loop_2138:
	sethi	0x0594,	%o7
	addcc	%l2,	0x0589,	%o5
	bcc,a,pt	%xcc,	loop_2139
	flush	%l7 + 0x28
	fmovs	%f22,	%f17
	tvc	%xcc,	0x1
loop_2139:
	fbue	%fcc2,	loop_2140
	fpackfix	%f24,	%f22
	ld	[%l7 + 0x60],	%f5
	subcc	%o4,	%g5,	%o1
loop_2140:
	tl	%xcc,	0x4
	add	%l4,	%o6,	%l0
	tge	%icc,	0x7
	and	%i3,	%o0,	%g3
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	nop
	set	0x1F, %o5
	ldstub	[%l7 + %o5],	%l5
	tge	%xcc,	0x0
	smulcc	%l6,	%i6,	%g1
	udiv	%i7,	0x1E25,	%i0
	ldsb	[%l7 + 0x72],	%i2
	fbule,a	%fcc1,	loop_2141
	movne	%icc,	%l1,	%o2
	add	%g4,	0x194C,	%g6
	ldd	[%l7 + 0x10],	%g2
loop_2141:
	fmul8x16au	%f28,	%f5,	%f12
	orn	%o3,	%i1,	%g7
	set	0x70, %l6
	sta	%f7,	[%l7 + %l6] 0x18
	tsubcc	%l3,	%i4,	%o7
	movge	%icc,	%l2,	%o5
	alignaddrl	%i5,	%g5,	%o4
	addccc	%o1,	%o6,	%l4
	subc	%l0,	0x1357,	%i3
	fbn,a	%fcc0,	loop_2142
	fmovdl	%xcc,	%f12,	%f16
	ldstub	[%l7 + 0x60],	%o0
	fpack32	%f14,	%f18,	%f18
loop_2142:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g3,	%l6,	%i6
	fornot1	%f26,	%f8,	%f8
	bge,a,pt	%icc,	loop_2143
	brz,a	%l5,	loop_2144
	fble,a	%fcc2,	loop_2145
	xnorcc	%g1,	%i0,	%i7
loop_2143:
	movle	%icc,	%l1,	%i2
loop_2144:
	fandnot2	%f22,	%f10,	%f10
loop_2145:
	addc	%o2,	0x14FA,	%g4
	tne	%xcc,	0x1
	srax	%g6,	0x17,	%o3
	movcs	%icc,	%i1,	%g2
	brlez	%l3,	loop_2146
	pdist	%f2,	%f4,	%f10
	and	%i4,	%g7,	%o7
	edge16n	%o5,	%l2,	%g5
loop_2146:
	fandnot2s	%f16,	%f23,	%f7
	edge8l	%o4,	%o1,	%i5
	sra	%o6,	0x1D,	%l4
	edge16	%i3,	%l0,	%o0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x38] %asi,	%l6
	addcc	%g3,	%i6,	%l5
	alignaddrl	%i0,	%g1,	%i7
	andn	%l1,	0x10C6,	%o2
	tl	%xcc,	0x3
	tsubcctv	%i2,	0x08FD,	%g4
	movvs	%xcc,	%g6,	%o3
	stx	%g2,	[%l7 + 0x38]
	edge16n	%i1,	%l3,	%g7
	fsrc2s	%f13,	%f1
	movcc	%icc,	%o7,	%i4
	fmovsl	%xcc,	%f20,	%f26
	fbg	%fcc1,	loop_2147
	movge	%icc,	%l2,	%g5
	fnot2	%f18,	%f14
	movrlz	%o4,	%o5,	%i5
loop_2147:
	fmovdl	%icc,	%f8,	%f0
	sdiv	%o1,	0x1271,	%o6
	fnot2s	%f1,	%f13
	umulcc	%l4,	%l0,	%o0
	movpos	%icc,	%l6,	%i3
	brz,a	%i6,	loop_2148
	fzeros	%f28
	movrlz	%l5,	0x05A,	%g3
	movle	%icc,	%g1,	%i7
loop_2148:
	tge	%icc,	0x4
	edge16l	%l1,	%o2,	%i2
	fmovrdne	%g4,	%f8,	%f24
	set	0x64, %g3
	lduha	[%l7 + %g3] 0x04,	%g6
	srax	%o3,	0x1C,	%g2
	edge8n	%i1,	%l3,	%g7
	mulscc	%i0,	%i4,	%l2
	ble,a	%xcc,	loop_2149
	bn,a	loop_2150
	brnz,a	%g5,	loop_2151
	fnot1s	%f29,	%f9
loop_2149:
	fmovsge	%icc,	%f28,	%f4
loop_2150:
	ldsw	[%l7 + 0x40],	%o7
loop_2151:
	movneg	%icc,	%o5,	%i5
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x12] %asi,	%o4
	orn	%o6,	%o1,	%l0
	ta	%xcc,	0x6
	fmovrde	%l4,	%f10,	%f16
	fmul8sux16	%f14,	%f10,	%f10
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
	ldd	[%l7 + 0x08],	%o0
	move	%icc,	%i3,	%l6
	movpos	%xcc,	%l5,	%i6
	movrlz	%g3,	0x0D7,	%i7
	ta	%xcc,	0x4
	movrlz	%l1,	%g1,	%o2
	sra	%i2,	0x04,	%g4
	or	%g6,	%g2,	%i1
	sth	%o3,	[%l7 + 0x2E]
	movvc	%icc,	%l3,	%i0
	tneg	%xcc,	0x3
	srlx	%i4,	%g7,	%g5
	ta	%icc,	0x3
	movne	%xcc,	%l2,	%o7
	fbl,a	%fcc3,	loop_2152
	lduh	[%l7 + 0x5A],	%i5
	subcc	%o5,	0x0027,	%o4
	movpos	%xcc,	%o1,	%l0
loop_2152:
	fmovrsgz	%o6,	%f0,	%f18
	fmovsl	%xcc,	%f6,	%f9
	popc	%l4,	%i3
	fbule,a	%fcc3,	loop_2153
	tcs	%icc,	0x2
	udivx	%o0,	0x1F91,	%l6
	bshuffle	%f2,	%f24,	%f28
loop_2153:
	fmovsneg	%icc,	%f30,	%f4
	bn,a	loop_2154
	fbg	%fcc1,	loop_2155
	udivcc	%i6,	0x1414,	%l5
	andcc	%g3,	0x07DF,	%i7
loop_2154:
	addcc	%g1,	0x1874,	%o2
loop_2155:
	fandnot1	%f14,	%f10,	%f10
	sllx	%i2,	%g4,	%g6
	movvc	%icc,	%g2,	%l1
	addc	%i1,	0x005F,	%o3
	fbue	%fcc0,	loop_2156
	edge16	%i0,	%l3,	%g7
	set	0x18, %i0
	ldxa	[%l7 + %i0] 0x0c,	%i4
loop_2156:
	addcc	%g5,	0x0FA0,	%l2
	fmovdn	%xcc,	%f0,	%f22
	fbug	%fcc1,	loop_2157
	edge32l	%i5,	%o7,	%o5
	tcs	%icc,	0x0
	call	loop_2158
loop_2157:
	flush	%l7 + 0x08
	fpadd32	%f30,	%f26,	%f20
	fcmpeq32	%f10,	%f26,	%o1
loop_2158:
	st	%f8,	[%l7 + 0x7C]
	fmovdvs	%xcc,	%f17,	%f27
	udiv	%o4,	0x1A22,	%o6
	brnz	%l0,	loop_2159
	brz	%i3,	loop_2160
	tn	%icc,	0x4
	bne,a	%xcc,	loop_2161
loop_2159:
	bl,a	%xcc,	loop_2162
loop_2160:
	bl,pn	%icc,	loop_2163
	edge32l	%o0,	%l4,	%i6
loop_2161:
	fblg	%fcc1,	loop_2164
loop_2162:
	fxnors	%f27,	%f23,	%f15
loop_2163:
	movleu	%icc,	%l5,	%g3
	fbu	%fcc1,	loop_2165
loop_2164:
	for	%f24,	%f22,	%f28
	tl	%icc,	0x0
	sethi	0x1425,	%i7
loop_2165:
	tgu	%icc,	0x4
	brnz	%g1,	loop_2166
	fmul8x16	%f16,	%f6,	%f10
	edge8l	%l6,	%o2,	%i2
	brgez	%g4,	loop_2167
loop_2166:
	movne	%icc,	%g2,	%g6
	movre	%i1,	%o3,	%l1
	fxors	%f24,	%f27,	%f5
loop_2167:
	std	%f26,	[%l7 + 0x58]
	call	loop_2168
	movneg	%icc,	%l3,	%g7
	movn	%icc,	%i0,	%i4
	set	0x6C, %i6
	swapa	[%l7 + %i6] 0x80,	%g5
loop_2168:
	andn	%i5,	0x00D0,	%o7
	bl,a,pt	%xcc,	loop_2169
	tg	%icc,	0x3
	addccc	%o5,	%o1,	%o4
	orncc	%l2,	0x00CD,	%o6
loop_2169:
	faligndata	%f18,	%f18,	%f24
	ta	%icc,	0x4
	tne	%xcc,	0x2
	tsubcc	%l0,	%i3,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%i6,	%o0,	%l5
	and	%g3,	0x0616,	%i7
	sll	%l6,	%o2,	%g1
	movl	%icc,	%i2,	%g4
	edge16n	%g2,	%i1,	%g6
	orncc	%l1,	%o3,	%g7
	sll	%i0,	0x09,	%i4
	fbo,a	%fcc1,	loop_2170
	array16	%l3,	%i5,	%g5
	fmovdneg	%xcc,	%f5,	%f15
	movrlez	%o7,	0x123,	%o1
loop_2170:
	or	%o5,	0x10CC,	%l2
	udiv	%o4,	0x09A7,	%l0
	srax	%i3,	%o6,	%i6
	fcmpd	%fcc0,	%f10,	%f20
	fmovrde	%l4,	%f14,	%f10
	udivx	%l5,	0x1DF7,	%g3
	fnors	%f17,	%f14,	%f19
	array32	%i7,	%l6,	%o0
	edge32	%o2,	%g1,	%i2
	fblg,a	%fcc0,	loop_2171
	array8	%g2,	%i1,	%g4
	fbo,a	%fcc0,	loop_2172
	brz,a	%l1,	loop_2173
loop_2171:
	xnorcc	%o3,	%g6,	%i0
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x14] %asi,	%f11
loop_2172:
	nop
	set	0x4C, %g1
	lduw	[%l7 + %g1],	%g7
loop_2173:
	movl	%xcc,	%i4,	%i5
	fcmple32	%f26,	%f16,	%g5
	movre	%l3,	%o1,	%o7
	umul	%l2,	%o5,	%l0
	bleu	loop_2174
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%o4,	%f14,	%f6
	bcs	loop_2175
loop_2174:
	brgz	%i3,	loop_2176
	subc	%o6,	0x028A,	%l4
	fmovsle	%icc,	%f15,	%f29
loop_2175:
	ta	%icc,	0x2
loop_2176:
	sub	%l5,	%g3,	%i7
	set	0x60, %l5
	ldda	[%l7 + %l5] 0x89,	%i6
	fandnot1	%f18,	%f18,	%f16
	sdivx	%i6,	0x07FB,	%o2
	addcc	%o0,	%i2,	%g2
	fzero	%f4
	movvc	%icc,	%g1,	%g4
	tl	%xcc,	0x0
	faligndata	%f0,	%f20,	%f8
	fcmpd	%fcc0,	%f18,	%f18
	movrlez	%i1,	%o3,	%l1
	fmovdpos	%xcc,	%f1,	%f14
	ldstub	[%l7 + 0x4A],	%g6
	flush	%l7 + 0x38
	std	%f16,	[%l7 + 0x28]
	fbn	%fcc2,	loop_2177
	fand	%f4,	%f16,	%f16
	ldub	[%l7 + 0x54],	%g7
	sdivx	%i4,	0x11F5,	%i0
loop_2177:
	ldub	[%l7 + 0x49],	%i5
	taddcc	%g5,	%l3,	%o7
	movn	%xcc,	%o1,	%o5
	movneg	%icc,	%l0,	%l2
	fmovrslez	%o4,	%f18,	%f9
	movleu	%xcc,	%i3,	%l4
	fmul8ulx16	%f6,	%f28,	%f4
	ba	%icc,	loop_2178
	movleu	%icc,	%l5,	%o6
	array32	%i7,	%l6,	%i6
	movcs	%xcc,	%o2,	%g3
loop_2178:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x78] %asi,	%o0
	bneg,a,pn	%icc,	loop_2179
	fbue	%fcc2,	loop_2180
	tpos	%xcc,	0x0
	edge32ln	%i2,	%g2,	%g1
loop_2179:
	nop
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x27] %asi,	%g4
loop_2180:
	movpos	%icc,	%o3,	%l1
	fbug,a	%fcc2,	loop_2181
	mulx	%i1,	0x012A,	%g6
	alignaddr	%g7,	%i0,	%i4
	fble,a	%fcc3,	loop_2182
loop_2181:
	popc	%g5,	%l3
	mulscc	%o7,	0x1B3B,	%i5
	sra	%o1,	%l0,	%l2
loop_2182:
	fblg,a	%fcc2,	loop_2183
	movge	%icc,	%o4,	%o5
	fmovd	%f4,	%f2
	edge32	%l4,	%l5,	%o6
loop_2183:
	movne	%xcc,	%i3,	%i7
	bneg	loop_2184
	srlx	%l6,	%o2,	%i6
	umulcc	%o0,	0x1F2C,	%g3
	array16	%i2,	%g1,	%g2
loop_2184:
	bl,a	loop_2185
	fmovdle	%xcc,	%f7,	%f0
	fpackfix	%f8,	%f12
	fcmps	%fcc3,	%f30,	%f6
loop_2185:
	fcmpd	%fcc3,	%f18,	%f18
	lduh	[%l7 + 0x16],	%g4
	fbe	%fcc3,	loop_2186
	movrgez	%o3,	0x229,	%l1
	sdivcc	%g6,	0x13FC,	%i1
	sir	0x0A9C
loop_2186:
	fbn	%fcc3,	loop_2187
	udivx	%i0,	0x11AF,	%g7
	te	%icc,	0x2
	fmovrdlz	%i4,	%f6,	%f8
loop_2187:
	fblg,a	%fcc0,	loop_2188
	fmovde	%icc,	%f16,	%f0
	fcmpgt16	%f24,	%f28,	%l3
	mulx	%o7,	0x16AF,	%i5
loop_2188:
	membar	0x19
	orcc	%g5,	0x016D,	%o1
	orcc	%l2,	0x030B,	%l0
	set	0x1F, %l4
	stba	%o5,	[%l7 + %l4] 0xeb
	membar	#Sync
	edge8l	%l4,	%l5,	%o4
	subc	%i3,	0x02D1,	%i7
	sllx	%o6,	%o2,	%l6
	umulcc	%i6,	0x0DAF,	%o0
	bg,a,pn	%icc,	loop_2189
	edge8	%g3,	%i2,	%g2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x2B] %asi,	%g1
loop_2189:
	array8	%o3,	%l1,	%g4
	movpos	%xcc,	%i1,	%g6
	fands	%f26,	%f14,	%f14
	stbar
	tvc	%xcc,	0x6
	fmovrdne	%g7,	%f14,	%f18
	udivx	%i4,	0x078C,	%i0
	fcmpne16	%f2,	%f4,	%o7
	sllx	%i5,	0x17,	%l3
	movrlz	%o1,	0x3FB,	%l2
	movrgez	%l0,	0x156,	%g5
	sir	0x172F
	array32	%l4,	%o5,	%l5
	taddcc	%i3,	0x0E44,	%o4
	subccc	%i7,	0x1333,	%o2
	fandnot1s	%f21,	%f24,	%f10
	fmovdl	%icc,	%f4,	%f20
	fbge,a	%fcc0,	loop_2190
	fbl,a	%fcc1,	loop_2191
	taddcc	%l6,	0x0D79,	%o6
	edge8ln	%i6,	%o0,	%i2
loop_2190:
	movge	%xcc,	%g3,	%g1
loop_2191:
	tcs	%icc,	0x5
	fmovdcs	%xcc,	%f4,	%f4
	fornot2	%f18,	%f20,	%f24
	edge8l	%g2,	%l1,	%o3
	tcc	%xcc,	0x3
	movpos	%xcc,	%g4,	%i1
	bn,a	loop_2192
	sdivcc	%g7,	0x041D,	%g6
	fbl	%fcc0,	loop_2193
	bcs,pn	%xcc,	loop_2194
loop_2192:
	movcs	%xcc,	%i0,	%i4
	brlez	%i5,	loop_2195
loop_2193:
	sdivx	%o7,	0x112F,	%o1
loop_2194:
	udivx	%l3,	0x1439,	%l0
	orncc	%g5,	0x067B,	%l4
loop_2195:
	nop
	set	0x28, %g7
	swapa	[%l7 + %g7] 0x19,	%l2
	fpsub32	%f22,	%f24,	%f30
	movn	%xcc,	%l5,	%o5
	fexpand	%f12,	%f6
	sdivx	%o4,	0x0615,	%i7
	bpos,a,pn	%icc,	loop_2196
	bcs,pn	%xcc,	loop_2197
	fsrc1s	%f25,	%f18
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x11,	%f0
loop_2196:
	sub	%o2,	0x1455,	%i3
loop_2197:
	orn	%l6,	%i6,	%o0
	bvc,a	%icc,	loop_2198
	umul	%o6,	%i2,	%g1
	sllx	%g3,	0x0E,	%g2
	edge32l	%l1,	%o3,	%i1
loop_2198:
	smul	%g4,	%g6,	%g7
	and	%i0,	0x1063,	%i4
	umulcc	%i5,	%o1,	%o7
	xorcc	%l0,	%l3,	%g5
	tcc	%icc,	0x4
	ldsh	[%l7 + 0x74],	%l2
	tneg	%icc,	0x3
	fble	%fcc3,	loop_2199
	udivcc	%l5,	0x0BD5,	%o5
	fbn,a	%fcc0,	loop_2200
	tpos	%icc,	0x3
loop_2199:
	array16	%o4,	%i7,	%o2
	movrlez	%i3,	%l4,	%i6
loop_2200:
	orcc	%o0,	%o6,	%i2
	set	0x18, %i2
	stha	%g1,	[%l7 + %i2] 0xe3
	membar	#Sync
	movleu	%icc,	%g3,	%l6
	fpadd32s	%f7,	%f29,	%f20
	addccc	%l1,	%o3,	%g2
	fand	%f24,	%f0,	%f2
	ld	[%l7 + 0x7C],	%f18
	xnorcc	%i1,	%g4,	%g6
	fcmpgt16	%f24,	%f22,	%g7
	movne	%xcc,	%i0,	%i5
	swap	[%l7 + 0x24],	%i4
	sllx	%o7,	%l0,	%o1
	alignaddr	%g5,	%l2,	%l3
	edge16l	%l5,	%o4,	%o5
	brlz,a	%i7,	loop_2201
	sth	%o2,	[%l7 + 0x38]
	and	%i3,	%l4,	%i6
	membar	0x40
loop_2201:
	ta	%xcc,	0x6
	fblg,a	%fcc3,	loop_2202
	stb	%o0,	[%l7 + 0x5A]
	orncc	%o6,	%g1,	%g3
	sll	%i2,	%l1,	%o3
loop_2202:
	array8	%g2,	%l6,	%i1
	tge	%icc,	0x7
	bleu	loop_2203
	tsubcc	%g4,	0x090A,	%g7
	fmovsle	%xcc,	%f11,	%f9
	tl	%xcc,	0x7
loop_2203:
	fpsub16	%f30,	%f22,	%f6
	fbe	%fcc1,	loop_2204
	fbo	%fcc2,	loop_2205
	fcmped	%fcc3,	%f20,	%f30
	or	%g6,	0x10A4,	%i0
loop_2204:
	tcs	%icc,	0x5
loop_2205:
	addccc	%i4,	%i5,	%l0
	fmovrde	%o1,	%f0,	%f10
	fmovrdlez	%o7,	%f20,	%f18
	movneg	%xcc,	%l2,	%l3
	tcs	%icc,	0x2
	fcmpd	%fcc3,	%f6,	%f28
	fpsub16s	%f27,	%f11,	%f30
	fble	%fcc2,	loop_2206
	ldsb	[%l7 + 0x0C],	%l5
	fmovsg	%icc,	%f10,	%f0
	sdivcc	%g5,	0x1072,	%o4
loop_2206:
	edge8l	%o5,	%o2,	%i7
	tsubcctv	%i3,	0x0640,	%i6
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x3C] %asi,	%l4
	fmovsn	%icc,	%f5,	%f5
	fmovrse	%o0,	%f10,	%f9
	tg	%icc,	0x0
	ble	loop_2207
	sra	%g1,	0x0C,	%o6
	set	0x64, %o3
	sta	%f26,	[%l7 + %o3] 0x18
loop_2207:
	edge32ln	%i2,	%l1,	%g3
	fble,a	%fcc0,	loop_2208
	tsubcc	%o3,	0x08EE,	%g2
	sethi	0x13A6,	%l6
	ldd	[%l7 + 0x28],	%i0
loop_2208:
	fble,a	%fcc0,	loop_2209
	taddcc	%g4,	0x1440,	%g6
	taddcc	%g7,	0x1FAE,	%i4
	edge8l	%i0,	%l0,	%i5
loop_2209:
	fmovrse	%o1,	%f30,	%f12
	bn,a	%icc,	loop_2210
	tge	%icc,	0x3
	edge8	%o7,	%l2,	%l3
	ta	%xcc,	0x1
loop_2210:
	movvs	%xcc,	%g5,	%o4
	movleu	%icc,	%o5,	%l5
	smulcc	%o2,	0x0783,	%i3
	nop
	setx loop_2211, %l0, %l1
	jmpl %l1, %i6
	sdiv	%i7,	0x1578,	%l4
	fandnot1s	%f19,	%f8,	%f17
	sra	%g1,	%o0,	%o6
loop_2211:
	movgu	%icc,	%i2,	%l1
	taddcctv	%o3,	%g3,	%l6
	edge8ln	%i1,	%g4,	%g2
	sdivcc	%g7,	0x10D7,	%g6
	fmovde	%icc,	%f11,	%f23
	movrlz	%i0,	0x2B7,	%i4
	taddcctv	%i5,	0x0419,	%o1
	alignaddrl	%l0,	%o7,	%l2
	sdivx	%l3,	0x012F,	%g5
	fpsub16s	%f22,	%f13,	%f14
	set	0x28, %i5
	stxa	%o4,	[%l7 + %i5] 0x81
	orn	%l5,	0x017C,	%o5
	te	%xcc,	0x2
	tcc	%icc,	0x2
	tl	%icc,	0x3
	fnors	%f1,	%f21,	%f11
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o2
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7D] %asi,	%i6
	movleu	%xcc,	%i7,	%l4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x54] %asi,	%f30
	stbar
	sra	%i3,	0x13,	%g1
	set	0x10, %o6
	stda	%o6,	[%l7 + %o6] 0x14
	srax	%i2,	0x07,	%o0
	sdivx	%o3,	0x01DF,	%g3
	sdivcc	%l6,	0x066E,	%l1
	st	%f15,	[%l7 + 0x78]
	umul	%g4,	%g2,	%i1
	brz,a	%g7,	loop_2212
	tvs	%xcc,	0x1
	brnz	%i0,	loop_2213
	tn	%icc,	0x0
loop_2212:
	bneg,pn	%icc,	loop_2214
	tsubcctv	%g6,	0x179F,	%i5
loop_2213:
	edge32	%o1,	%l0,	%i4
	tvs	%icc,	0x4
loop_2214:
	fmovdleu	%icc,	%f25,	%f13
	sethi	0x1330,	%o7
	tsubcc	%l3,	%g5,	%o4
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x08] %asi,	%l5
	fcmpes	%fcc1,	%f21,	%f2
	edge8n	%l2,	%o2,	%i6
	nop
	set	0x2A, %o0
	ldstub	[%l7 + %o0],	%i7
	stw	%o5,	[%l7 + 0x58]
	brz,a	%i3,	loop_2215
	stx	%l4,	[%l7 + 0x30]
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%g1
loop_2215:
	fmovs	%f23,	%f10
	ba,a	%xcc,	loop_2216
	umulcc	%o0,	%i2,	%g3
	ldx	[%l7 + 0x28],	%l6
	movrgez	%l1,	0x1A2,	%g4
loop_2216:
	add	%g2,	0x18C9,	%o3
	and	%g7,	%i0,	%g6
	xorcc	%i5,	%i1,	%o1
	bleu,a	%icc,	loop_2217
	umulcc	%l0,	%o7,	%l3
	add	%l7,	0x74,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g5,	%i4
loop_2217:
	sllx	%l5,	0x0B,	%o4
	bpos,a,pn	%xcc,	loop_2218
	te	%icc,	0x1
	movcs	%icc,	%l2,	%o2
	bcs,a,pn	%xcc,	loop_2219
loop_2218:
	edge32ln	%i7,	%o5,	%i3
	edge16l	%i6,	%l4,	%g1
	bleu	loop_2220
loop_2219:
	array8	%o0,	%o6,	%i2
	edge16n	%g3,	%l6,	%l1
	fmovda	%xcc,	%f26,	%f21
loop_2220:
	fblg,a	%fcc0,	loop_2221
	lduh	[%l7 + 0x0A],	%g4
	or	%o3,	%g2,	%g7
	bg,pn	%xcc,	loop_2222
loop_2221:
	udivcc	%i0,	0x04F1,	%g6
	brgez,a	%i5,	loop_2223
	fcmpd	%fcc3,	%f22,	%f6
loop_2222:
	tpos	%xcc,	0x5
	fmovsgu	%xcc,	%f31,	%f4
loop_2223:
	bne	loop_2224
	fpmerge	%f10,	%f1,	%f6
	xnor	%o1,	%l0,	%i1
	fbu,a	%fcc1,	loop_2225
loop_2224:
	addccc	%o7,	0x1593,	%l3
	tsubcctv	%i4,	0x1732,	%g5
	fmovd	%f20,	%f28
loop_2225:
	bshuffle	%f20,	%f30,	%f16
	brlz	%o4,	loop_2226
	umul	%l5,	0x1F52,	%o2
	move	%xcc,	%l2,	%o5
	mova	%xcc,	%i3,	%i6
loop_2226:
	edge16l	%l4,	%g1,	%i7
	fcmple16	%f6,	%f16,	%o6
	orncc	%o0,	%g3,	%i2
	mulscc	%l6,	0x18C4,	%g4
	fbg	%fcc3,	loop_2227
	ble,a	%icc,	loop_2228
	tsubcc	%o3,	0x065E,	%g2
	movrgz	%l1,	0x123,	%g7
loop_2227:
	addccc	%g6,	%i0,	%i5
loop_2228:
	flush	%l7 + 0x60
	movrne	%l0,	%i1,	%o1
	movrne	%o7,	%i4,	%g5
	set	0x47, %l1
	ldstuba	[%l7 + %l1] 0x80,	%o4
	sll	%l5,	%l3,	%l2
	fmovrsgz	%o2,	%f0,	%f18
	fbge	%fcc0,	loop_2229
	st	%f10,	[%l7 + 0x6C]
	sllx	%i3,	%o5,	%i6
	taddcc	%g1,	0x1C54,	%i7
loop_2229:
	fxnors	%f23,	%f28,	%f25
	tsubcc	%l4,	0x1A48,	%o0
	fbule	%fcc2,	loop_2230
	orn	%g3,	%o6,	%i2
	tge	%icc,	0x6
	brgz,a	%l6,	loop_2231
loop_2230:
	srl	%o3,	%g4,	%g2
	brz	%g7,	loop_2232
	subc	%l1,	%i0,	%i5
loop_2231:
	srax	%g6,	%l0,	%i1
	subc	%o1,	0x0888,	%o7
loop_2232:
	te	%xcc,	0x7
	tcs	%xcc,	0x1
	andcc	%g5,	0x03ED,	%i4
	addcc	%l5,	0x140B,	%l3
	movvs	%icc,	%l2,	%o2
	wr	%g0,	0x80,	%asi
	stda	%i2,	[%l7 + 0x70] %asi
	bgu,a,pn	%icc,	loop_2233
	bpos,a	%icc,	loop_2234
	fbl	%fcc2,	loop_2235
	movn	%xcc,	%o4,	%o5
loop_2233:
	brgz,a	%g1,	loop_2236
loop_2234:
	movrlz	%i7,	0x226,	%l4
loop_2235:
	fnor	%f20,	%f22,	%f12
	bcc,a	%xcc,	loop_2237
loop_2236:
	tcc	%xcc,	0x3
	movleu	%xcc,	%i6,	%o0
	fba	%fcc3,	loop_2238
loop_2237:
	fbg,a	%fcc2,	loop_2239
	movvs	%icc,	%o6,	%g3
	call	loop_2240
loop_2238:
	movpos	%xcc,	%i2,	%o3
loop_2239:
	fmovscc	%xcc,	%f1,	%f10
	wr	%g0,	0x2f,	%asi
	stba	%g4,	[%l7 + 0x51] %asi
	membar	#Sync
loop_2240:
	addcc	%l6,	0x1ADA,	%g7
	tle	%xcc,	0x6
	umulcc	%g2,	%i0,	%l1
	pdist	%f16,	%f20,	%f20
	alignaddrl	%g6,	%i5,	%l0
	fmovrdne	%i1,	%f14,	%f8
	nop
	setx	loop_2241,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%o1,	%g5,	%i4
	movneg	%icc,	%o7,	%l5
	edge16ln	%l3,	%o2,	%l2
loop_2241:
	sdivcc	%i3,	0x0363,	%o4
	smul	%o5,	0x1A0E,	%i7
	fmovdcc	%xcc,	%f23,	%f31
	fnot2	%f4,	%f8
	fnor	%f30,	%f30,	%f30
	tne	%icc,	0x0
	udivcc	%g1,	0x07A7,	%i6
	edge32ln	%o0,	%l4,	%o6
	xnorcc	%i2,	0x0EBB,	%o3
	edge32	%g4,	%l6,	%g3
	set	0x0F, %o4
	stba	%g7,	[%l7 + %o4] 0xeb
	membar	#Sync
	taddcctv	%g2,	%i0,	%g6
	array8	%l1,	%i5,	%i1
	tsubcc	%l0,	0x19F3,	%o1
	taddcc	%i4,	%g5,	%l5
	xnorcc	%o7,	%l3,	%o2
	ldub	[%l7 + 0x0D],	%l2
	fmovsg	%icc,	%f28,	%f3
	wr	%g0,	0x80,	%asi
	stwa	%o4,	[%l7 + 0x54] %asi
	fmovdvs	%icc,	%f7,	%f1
	fble,a	%fcc2,	loop_2242
	tsubcctv	%o5,	%i7,	%g1
	brgez,a	%i6,	loop_2243
	movl	%icc,	%o0,	%l4
loop_2242:
	edge32n	%o6,	%i2,	%i3
	edge32n	%o3,	%l6,	%g3
loop_2243:
	fcmple32	%f28,	%f0,	%g7
	tvc	%icc,	0x3
	edge32	%g2,	%i0,	%g6
	addcc	%g4,	%l1,	%i1
	movrgz	%i5,	%l0,	%o1
	fba	%fcc3,	loop_2244
	or	%g5,	%i4,	%o7
	fandnot2s	%f2,	%f2,	%f9
	andncc	%l5,	%l3,	%l2
loop_2244:
	edge32l	%o2,	%o4,	%o5
	movrgez	%g1,	%i7,	%i6
	movre	%l4,	%o0,	%o6
	movre	%i3,	%o3,	%l6
	wr	%g0,	0x11,	%asi
	stda	%i2,	[%l7 + 0x40] %asi
	set	0x14, %o1
	sta	%f6,	[%l7 + %o1] 0x19
	tcc	%icc,	0x4
	smulcc	%g7,	%g2,	%i0
	subccc	%g3,	%g4,	%g6
	smul	%l1,	0x0388,	%i1
	fbg	%fcc0,	loop_2245
	tg	%icc,	0x7
	movl	%xcc,	%l0,	%o1
	fcmpeq32	%f4,	%f6,	%g5
loop_2245:
	bne,pt	%xcc,	loop_2246
	smulcc	%i5,	%o7,	%l5
	movgu	%xcc,	%l3,	%l2
	movrlez	%i4,	%o2,	%o5
loop_2246:
	movcc	%icc,	%g1,	%o4
	fmovrdne	%i6,	%f16,	%f4
	xnorcc	%l4,	0x1B9D,	%o0
	movl	%xcc,	%i7,	%i3
	smul	%o6,	0x0042,	%l6
	fmovrsgz	%o3,	%f8,	%f31
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
	sub	%g7,	0x0175,	%i2
	bn	loop_2248
	sdivcc	%i0,	0x08D9,	%g2
loop_2247:
	orcc	%g3,	%g4,	%g6
	fble	%fcc3,	loop_2249
loop_2248:
	xnorcc	%l1,	%l0,	%o1
	tcs	%xcc,	0x4
	tgu	%icc,	0x5
loop_2249:
	tvc	%xcc,	0x5
	array8	%g5,	%i1,	%i5
	movpos	%icc,	%l5,	%l3
	movl	%xcc,	%l2,	%o7
	tvc	%xcc,	0x4
	taddcc	%o2,	%o5,	%g1
	tle	%icc,	0x0
	sdivx	%o4,	0x107B,	%i6
	orn	%l4,	0x0F67,	%i4
	tgu	%xcc,	0x1
	fmovsl	%xcc,	%f20,	%f20
	tn	%icc,	0x2
	sub	%o0,	%i3,	%i7
	fbue,a	%fcc2,	loop_2250
	sllx	%l6,	0x17,	%o6
	edge8l	%g7,	%i2,	%o3
	tneg	%icc,	0x5
loop_2250:
	nop
	wr	%g0,	0x0c,	%asi
	stha	%g2,	[%l7 + 0x3C] %asi
	std	%f28,	[%l7 + 0x20]
	movcc	%icc,	%g3,	%i0
	edge16	%g4,	%l1,	%l0
	membar	0x5F
	set	0x68, %i7
	lduha	[%l7 + %i7] 0x19,	%g6
	smul	%o1,	0x0F15,	%i1
	nop
	setx	loop_2251,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg	%fcc2,	loop_2252
	orncc	%g5,	0x0B38,	%l5
	set	0x58, %o2
	lda	[%l7 + %o2] 0x88,	%f13
loop_2251:
	udivx	%l3,	0x19F5,	%l2
loop_2252:
	fxors	%f29,	%f11,	%f23
	tsubcc	%i5,	0x0581,	%o7
	bne	loop_2253
	edge16l	%o2,	%o5,	%g1
	orn	%i6,	%l4,	%o4
	andn	%i4,	0x0D35,	%i3
loop_2253:
	fbge	%fcc3,	loop_2254
	fcmpne16	%f2,	%f14,	%o0
	movre	%l6,	%i7,	%o6
	move	%icc,	%i2,	%g7
loop_2254:
	ldub	[%l7 + 0x18],	%g2
	fblg	%fcc1,	loop_2255
	bneg,pn	%icc,	loop_2256
	fmovdleu	%xcc,	%f25,	%f23
	bvc,a,pn	%xcc,	loop_2257
loop_2255:
	movre	%g3,	%o3,	%g4
loop_2256:
	ldub	[%l7 + 0x48],	%i0
	umul	%l0,	0x1D9F,	%g6
loop_2257:
	movl	%xcc,	%o1,	%i1
	fpack32	%f4,	%f22,	%f14
	andncc	%g5,	%l5,	%l3
	movl	%xcc,	%l1,	%l2
	fmovdgu	%xcc,	%f7,	%f1
	lduh	[%l7 + 0x54],	%o7
	fpsub32	%f20,	%f16,	%f24
	fmovs	%f17,	%f24
	fmovsleu	%xcc,	%f3,	%f13
	movrgez	%o2,	%i5,	%g1
	set	0x28, %g5
	ldsba	[%l7 + %g5] 0x88,	%o5
	fmovdvc	%xcc,	%f6,	%f10
	orn	%l4,	%i6,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i3,	%i4,	%l6
	orcc	%i7,	%o6,	%i2
	tg	%xcc,	0x2
	fcmpeq16	%f30,	%f4,	%g7
	fba	%fcc3,	loop_2258
	smulcc	%g2,	0x1F3A,	%g3
	addc	%o0,	%o3,	%i0
	edge16n	%g4,	%g6,	%o1
loop_2258:
	fbule	%fcc1,	loop_2259
	tle	%xcc,	0x2
	tpos	%xcc,	0x3
	tne	%icc,	0x0
loop_2259:
	nop
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x24] %asi,	%l0
	move	%xcc,	%g5,	%l5
	ldd	[%l7 + 0x70],	%f14
	edge32ln	%i1,	%l1,	%l3
	fmovrsgz	%l2,	%f29,	%f10
	edge32n	%o7,	%i5,	%o2
	sllx	%o5,	%l4,	%g1
	sir	0x0F1A
	tcc	%xcc,	0x3
	fcmpes	%fcc1,	%f6,	%f7
	fmovdvs	%icc,	%f30,	%f7
	movcc	%icc,	%o4,	%i3
	popc	0x0AED,	%i4
	fbne,a	%fcc1,	loop_2260
	movg	%icc,	%i6,	%l6
	add	%l7,	0x74,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o6,	%i2
loop_2260:
	brlez	%g7,	loop_2261
	umul	%g2,	%i7,	%g3
	pdist	%f16,	%f0,	%f30
	fmovdvs	%xcc,	%f3,	%f17
loop_2261:
	alignaddrl	%o0,	%o3,	%i0
	fmovdge	%xcc,	%f15,	%f1
	fmovdvs	%icc,	%f2,	%f10
	movcc	%xcc,	%g4,	%g6
	ldub	[%l7 + 0x52],	%o1
	sllx	%g5,	0x07,	%l0
	fmul8ulx16	%f30,	%f12,	%f20
	edge16	%i1,	%l5,	%l1
	edge8n	%l3,	%l2,	%o7
	tne	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x40] %asi,	%i5
	fandnot2s	%f26,	%f19,	%f20
	subc	%o5,	0x00CA,	%o2
	smulcc	%g1,	%l4,	%i3
	tgu	%xcc,	0x6
	edge16ln	%o4,	%i4,	%l6
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x15
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	addccc	%i2,	0x0BDF,	%i6
	fbl,a	%fcc0,	loop_2262
	fpackfix	%f18,	%f1
	tcc	%xcc,	0x4
	tl	%icc,	0x4
loop_2262:
	alignaddr	%g7,	%i7,	%g2
	bvs,a	%icc,	loop_2263
	srlx	%o0,	0x11,	%g3
	ldub	[%l7 + 0x51],	%i0
	tcc	%xcc,	0x0
loop_2263:
	fmovrsgz	%o3,	%f23,	%f14
	movre	%g6,	0x028,	%o1
	umul	%g5,	0x1D5F,	%l0
	nop
	setx	loop_2264,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tgu	%xcc,	0x6
	ldd	[%l7 + 0x60],	%f26
	sub	%g4,	0x127D,	%l5
loop_2264:
	tcc	%xcc,	0x6
	fbu,a	%fcc1,	loop_2265
	fmovdvs	%xcc,	%f15,	%f6
	fmovdneg	%icc,	%f0,	%f5
	fcmpd	%fcc2,	%f14,	%f16
loop_2265:
	xor	%l1,	0x1380,	%i1
	addc	%l3,	0x18BD,	%o7
	prefetch	[%l7 + 0x0C],	 0x0
	udivx	%i5,	0x0BFF,	%o5
	fone	%f16
	bn	%xcc,	loop_2266
	orcc	%o2,	%l2,	%g1
	nop
	setx	loop_2267,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%l4,	%i3,	%o4
loop_2266:
	fand	%f30,	%f2,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2267:
	fand	%f24,	%f12,	%f18
	fcmpgt16	%f24,	%f0,	%i4
	bgu,pt	%icc,	loop_2268
	popc	0x16AD,	%o6
	fmovrsne	%l6,	%f25,	%f9
	sll	%i2,	0x0D,	%i6
loop_2268:
	popc	0x0BC3,	%g7
	prefetch	[%l7 + 0x6C],	 0x0
	st	%f20,	[%l7 + 0x38]
	xnorcc	%i7,	%g2,	%g3
	edge32	%o0,	%i0,	%g6
	fands	%f22,	%f7,	%f17
	fba,a	%fcc2,	loop_2269
	bleu,a	%icc,	loop_2270
	fmovdcs	%xcc,	%f29,	%f26
	taddcc	%o1,	%o3,	%g5
loop_2269:
	srlx	%l0,	0x10,	%g4
loop_2270:
	te	%icc,	0x1
	fmovsleu	%icc,	%f7,	%f27
	movle	%xcc,	%l1,	%i1
	subcc	%l3,	0x0870,	%o7
	edge32ln	%i5,	%l5,	%o2
	flush	%l7 + 0x14
	add	%l2,	%o5,	%l4
	nop
	setx loop_2271, %l0, %l1
	jmpl %l1, %g1
	edge32n	%o4,	%i3,	%o6
	edge32	%l6,	%i4,	%i6
	edge16l	%i2,	%g7,	%g2
loop_2271:
	nop
	wr	%g0,	0x22,	%asi
	stwa	%i7,	[%l7 + 0x18] %asi
	membar	#Sync
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x14
	fmul8ulx16	%f10,	%f24,	%f22
	bne,pn	%icc,	loop_2272
	addccc	%g3,	0x1328,	%i0
	fmovdpos	%xcc,	%f23,	%f12
	mova	%icc,	%o0,	%o1
loop_2272:
	sdivcc	%o3,	0x18FC,	%g5
	edge8l	%g6,	%l0,	%g4
	fmul8x16al	%f27,	%f18,	%f6
	set	0x30, %l3
	ldxa	[%l7 + %l3] 0x19,	%i1
	andcc	%l3,	0x1485,	%l1
	subc	%i5,	0x1C4C,	%l5
	fmovdl	%icc,	%f14,	%f9
	movrne	%o2,	0x25D,	%o7
	fandnot1s	%f4,	%f22,	%f30
	movcc	%xcc,	%o5,	%l4
	stx	%g1,	[%l7 + 0x18]
	tge	%xcc,	0x4
	sir	0x1AF0
	tneg	%xcc,	0x3
	movrne	%o4,	%i3,	%l2
	edge32l	%o6,	%l6,	%i4
	orncc	%i6,	%g7,	%g2
	bleu,pt	%icc,	loop_2273
	fmul8x16al	%f23,	%f25,	%f16
	udiv	%i2,	0x0FDF,	%i7
	fmovdg	%icc,	%f10,	%f7
loop_2273:
	addcc	%i0,	%o0,	%g3
	sethi	0x1410,	%o3
	brz	%o1,	loop_2274
	edge8ln	%g6,	%g5,	%g4
	ldstub	[%l7 + 0x70],	%l0
	fzero	%f30
loop_2274:
	addc	%i1,	%l3,	%l1
	bcs	%icc,	loop_2275
	tneg	%icc,	0x2
	movvc	%icc,	%l5,	%i5
	stx	%o2,	[%l7 + 0x68]
loop_2275:
	edge8	%o5,	%l4,	%g1
	fornot1	%f10,	%f6,	%f6
	fmovdle	%icc,	%f19,	%f6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	tn	%xcc,	0x7
	fbule	%fcc0,	loop_2276
	fnors	%f5,	%f28,	%f23
	udivx	%o4,	0x0968,	%i3
	fnands	%f11,	%f1,	%f0
loop_2276:
	movre	%l2,	0x230,	%o6
	bgu	%xcc,	loop_2277
	tge	%xcc,	0x2
	fpack32	%f22,	%f6,	%f28
	fbe	%fcc1,	loop_2278
loop_2277:
	fbl,a	%fcc2,	loop_2279
	popc	0x03F5,	%i4
	fexpand	%f29,	%f0
loop_2278:
	nop
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2279:
	smulcc	%i6,	%g7,	%l6
	sll	%i2,	%g2,	%i7
	fmovdle	%icc,	%f28,	%f18
	edge8n	%i0,	%g3,	%o3
	movneg	%xcc,	%o0,	%g6
	srlx	%g5,	%o1,	%g4
	orcc	%l0,	0x1440,	%l3
	fble,a	%fcc2,	loop_2280
	alignaddrl	%l1,	%l5,	%i5
	movrlz	%o2,	%i1,	%l4
	edge32l	%g1,	%o7,	%o5
loop_2280:
	lduh	[%l7 + 0x52],	%i3
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%l2
	fmovd	%f24,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i4,	%i6,	%o6
	fpadd16	%f30,	%f10,	%f8
	movvs	%xcc,	%g7,	%i2
	udivx	%l6,	0x120A,	%i7
	fmovrdgez	%g2,	%f24,	%f22
	ble,pt	%icc,	loop_2281
	tn	%xcc,	0x3
	edge16l	%g3,	%i0,	%o3
	andncc	%g6,	%o0,	%o1
loop_2281:
	fmovsle	%xcc,	%f15,	%f20
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x3F] %asi,	%g4
	subccc	%l0,	%g5,	%l1
	tneg	%icc,	0x0
	movg	%icc,	%l5,	%l3
	edge32ln	%o2,	%i1,	%i5
	orn	%l4,	%g1,	%o7
	sdivx	%o5,	0x0391,	%i3
	sir	0x14F5
	movgu	%xcc,	%l2,	%o4
	fornot2s	%f27,	%f16,	%f3
	fmovdleu	%xcc,	%f8,	%f24
	for	%f2,	%f24,	%f2
	fone	%f6
	bneg,pt	%icc,	loop_2282
	movrne	%i6,	0x2FF,	%i4
	fcmple32	%f18,	%f16,	%o6
	edge8	%g7,	%i2,	%i7
loop_2282:
	tleu	%xcc,	0x0
	add	%l7,	0x10,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%l6
	movrgez	%g3,	%o3,	%i0
	lduh	[%l7 + 0x08],	%o0
	movn	%icc,	%g6,	%o1
	movrgz	%g4,	%g5,	%l1
	ldsb	[%l7 + 0x3F],	%l0
	edge32ln	%l3,	%o2,	%i1
	movcs	%xcc,	%i5,	%l5
	fandnot2	%f24,	%f4,	%f24
	set	0x38, %i3
	sta	%f5,	[%l7 + %i3] 0x80
	bcc	loop_2283
	fpackfix	%f24,	%f6
	call	loop_2284
	mulscc	%l4,	%g1,	%o5
loop_2283:
	tleu	%icc,	0x0
	stx	%o7,	[%l7 + 0x28]
loop_2284:
	st	%f27,	[%l7 + 0x2C]
	edge8l	%l2,	%i3,	%o4
	brgz,a	%i6,	loop_2285
	fmovdl	%icc,	%f1,	%f26
	edge16n	%i4,	%g7,	%i2
	wr	%g0,	0xe3,	%asi
	stxa	%i7,	[%l7 + 0x48] %asi
	membar	#Sync
loop_2285:
	smulcc	%o6,	%g2,	%g3
	sdivx	%l6,	0x10FD,	%i0
	orn	%o0,	%o3,	%g6
	fbne,a	%fcc0,	loop_2286
	edge8ln	%o1,	%g5,	%l1
	mova	%xcc,	%l0,	%g4
	addcc	%o2,	%l3,	%i1
loop_2286:
	udiv	%l5,	0x00E6,	%l4
	movrne	%i5,	0x31F,	%o5
	subcc	%o7,	0x020D,	%g1
	subc	%l2,	%i3,	%i6
	edge16	%o4,	%g7,	%i2
	orncc	%i4,	0x16C4,	%o6
	xorcc	%i7,	%g3,	%l6
	taddcctv	%g2,	0x0963,	%o0
	bleu,a	loop_2287
	fnegd	%f14,	%f12
	fmovda	%icc,	%f14,	%f19
	taddcctv	%i0,	%o3,	%o1
loop_2287:
	fmul8sux16	%f12,	%f12,	%f26
	sll	%g5,	%l1,	%g6
	fcmpgt32	%f24,	%f2,	%g4
	fandnot2s	%f26,	%f27,	%f3
	tvs	%xcc,	0x1
	fandnot2	%f10,	%f28,	%f2
	sir	0x172C
	nop
	setx	loop_2288,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldstub	[%l7 + 0x32],	%o2
	bge,pt	%xcc,	loop_2289
	smul	%l0,	%i1,	%l5
loop_2288:
	fornot1s	%f28,	%f23,	%f27
	membar	0x38
loop_2289:
	mova	%icc,	%l3,	%i5
	ldd	[%l7 + 0x50],	%f20
	fmovrslez	%o5,	%f16,	%f4
	fsrc1s	%f10,	%f15
	edge16	%o7,	%l4,	%g1
	ldd	[%l7 + 0x60],	%f22
	fpadd32s	%f9,	%f16,	%f0
	fmovdvc	%xcc,	%f17,	%f24
	bvs,a,pt	%icc,	loop_2290
	ldd	[%l7 + 0x18],	%i2
	subc	%i6,	%o4,	%g7
	brz	%i2,	loop_2291
loop_2290:
	movrlez	%l2,	0x3C1,	%i4
	tcc	%icc,	0x1
	fmovsle	%icc,	%f10,	%f29
loop_2291:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%o6
	fblg	%fcc3,	loop_2292
	tcs	%icc,	0x4
	fornot2	%f8,	%f8,	%f6
	edge16ln	%g3,	%i7,	%g2
loop_2292:
	fpsub16s	%f25,	%f31,	%f12
	fpadd16s	%f24,	%f6,	%f29
	array8	%l6,	%i0,	%o0
	siam	0x1
	xnor	%o3,	%o1,	%l1
	xor	%g5,	%g4,	%o2
	fpmerge	%f27,	%f12,	%f30
	add	%g6,	%l0,	%i1
	movpos	%xcc,	%l5,	%i5
	srax	%l3,	%o5,	%o7
	tleu	%icc,	0x6
	nop
	setx	loop_2293,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsgu	%xcc,	%f23,	%f14
	bn	%xcc,	loop_2294
	movle	%xcc,	%l4,	%i3
loop_2293:
	fmovrde	%g1,	%f28,	%f10
	or	%i6,	%g7,	%i2
loop_2294:
	ldub	[%l7 + 0x7E],	%l2
	stx	%i4,	[%l7 + 0x48]
	edge16l	%o4,	%o6,	%i7
	add	%g3,	0x1498,	%g2
	edge16l	%i0,	%l6,	%o3
	edge16ln	%o0,	%o1,	%l1
	stbar
	andcc	%g4,	%g5,	%o2
	tneg	%xcc,	0x1
	fmovdge	%icc,	%f27,	%f13
	tleu	%icc,	0x5
	brlez	%g6,	loop_2295
	flush	%l7 + 0x6C
	fbg	%fcc2,	loop_2296
	alignaddrl	%i1,	%l0,	%i5
loop_2295:
	membar	0x24
	fpadd32s	%f4,	%f16,	%f12
loop_2296:
	movg	%icc,	%l5,	%l3
	xor	%o5,	%l4,	%o7
	brgz,a	%i3,	loop_2297
	subc	%i6,	%g7,	%i2
	ldd	[%l7 + 0x58],	%f6
	edge8	%g1,	%l2,	%i4
loop_2297:
	tle	%xcc,	0x7
	srl	%o4,	%i7,	%o6
	fmul8sux16	%f4,	%f8,	%f26
	nop
	setx	loop_2298,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlz,a	%g2,	loop_2299
	fmovsge	%icc,	%f31,	%f14
	subc	%i0,	0x1951,	%g3
loop_2298:
	membar	0x73
loop_2299:
	sdivx	%l6,	0x189E,	%o3
	edge8	%o1,	%o0,	%l1
	movrgz	%g4,	%g5,	%o2
	fandnot2	%f0,	%f0,	%f28
	mova	%icc,	%i1,	%l0
	ldsh	[%l7 + 0x5E],	%i5
	set	0x3C, %i1
	sta	%f2,	[%l7 + %i1] 0x80
	subc	%l5,	0x0B4B,	%g6
	ld	[%l7 + 0x78],	%f30
	fbu,a	%fcc2,	loop_2300
	fmovrslez	%o5,	%f20,	%f9
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2300:
	taddcc	%l3,	0x14D1,	%o7
	tn	%xcc,	0x1
	tsubcc	%l4,	0x1F10,	%i6
	fpadd32s	%f23,	%f28,	%f4
	movrgz	%g7,	0x0C6,	%i3
	wr	%g0,	0x04,	%asi
	stda	%g0,	[%l7 + 0x50] %asi
	ldd	[%l7 + 0x30],	%l2
	sub	%i4,	0x00B8,	%o4
	addcc	%i7,	%o6,	%i2
	fbge,a	%fcc1,	loop_2301
	swap	[%l7 + 0x40],	%i0
	movcs	%icc,	%g3,	%g2
	srl	%o3,	%o1,	%o0
loop_2301:
	tvs	%xcc,	0x0
	movle	%xcc,	%l6,	%l1
	fmovscs	%xcc,	%f6,	%f8
	sethi	0x1A48,	%g5
	alignaddr	%g4,	%o2,	%i1
	nop
	setx loop_2302, %l0, %l1
	jmpl %l1, %l0
	andncc	%l5,	%g6,	%o5
	udiv	%i5,	0x1421,	%l3
	fbo	%fcc0,	loop_2303
loop_2302:
	movg	%xcc,	%l4,	%o7
	fmovrslez	%g7,	%f20,	%f2
	fbug,a	%fcc1,	loop_2304
loop_2303:
	edge8n	%i3,	%i6,	%l2
	sllx	%i4,	0x1F,	%g1
	andn	%i7,	%o6,	%i2
loop_2304:
	edge8n	%o4,	%g3,	%g2
	movpos	%xcc,	%i0,	%o3
	subccc	%o1,	%o0,	%l1
	ta	%icc,	0x5
	fbue	%fcc2,	loop_2305
	udiv	%l6,	0x186D,	%g5
	udiv	%o2,	0x0392,	%g4
	fexpand	%f6,	%f30
loop_2305:
	xor	%i1,	0x1A2A,	%l5
	fmovdg	%xcc,	%f14,	%f16
	fba,a	%fcc1,	loop_2306
	array32	%g6,	%o5,	%i5
	membar	0x5B
	tcs	%icc,	0x1
loop_2306:
	andn	%l3,	0x197D,	%l0
	bne,pt	%icc,	loop_2307
	brgez	%o7,	loop_2308
	stb	%g7,	[%l7 + 0x1E]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2307:
	nop
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x0c,	%f0
loop_2308:
	fbu,a	%fcc2,	loop_2309
	tvc	%xcc,	0x7
	tg	%xcc,	0x4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x74] %asi,	%l4
loop_2309:
	movrgz	%i3,	0x276,	%i6
	wr	%g0,	0x18,	%asi
	sta	%f6,	[%l7 + 0x74] %asi
	srl	%i4,	0x1F,	%l2
	fornot2	%f16,	%f30,	%f24
	ta	%xcc,	0x3
	ldub	[%l7 + 0x6E],	%g1
	brlez,a	%i7,	loop_2310
	tg	%xcc,	0x1
	subcc	%i2,	0x0898,	%o4
	tvc	%xcc,	0x0
loop_2310:
	tgu	%xcc,	0x7
	fabsd	%f6,	%f2
	fmovrse	%o6,	%f1,	%f24
	edge8	%g2,	%g3,	%o3
	movrlez	%i0,	%o1,	%o0
	mova	%icc,	%l1,	%g5
	subcc	%l6,	0x159E,	%o2
	tge	%xcc,	0x7
	movvs	%xcc,	%i1,	%g4
	fsrc2	%f22,	%f30
	tsubcctv	%g6,	%o5,	%i5
	fpsub32s	%f0,	%f2,	%f3
	tcs	%icc,	0x7
	tneg	%xcc,	0x3
	tl	%icc,	0x7
	mova	%icc,	%l3,	%l5
	siam	0x3
	tvs	%icc,	0x4
	tvc	%icc,	0x1
	std	%f30,	[%l7 + 0x48]
	set	0x3C, %g6
	ldstuba	[%l7 + %g6] 0x81,	%o7
	movgu	%icc,	%g7,	%l4
	bg,a,pt	%icc,	loop_2311
	fsrc1	%f26,	%f14
	fmovrse	%l0,	%f31,	%f28
	bcs,a,pt	%xcc,	loop_2312
loop_2311:
	ldstub	[%l7 + 0x5D],	%i6
	te	%icc,	0x6
	fmul8x16au	%f13,	%f3,	%f18
loop_2312:
	swap	[%l7 + 0x0C],	%i4
	fbo,a	%fcc1,	loop_2313
	flush	%l7 + 0x7C
	movrlz	%l2,	0x3E9,	%i3
	fmovdne	%xcc,	%f18,	%f3
loop_2313:
	tcs	%xcc,	0x0
	udivx	%g1,	0x0ECB,	%i7
	movpos	%icc,	%o4,	%o6
	movne	%xcc,	%i2,	%g2
	fmovsvs	%icc,	%f18,	%f14
	fmuld8ulx16	%f22,	%f1,	%f30
	tvs	%icc,	0x1
	te	%xcc,	0x6
	movre	%o3,	0x345,	%g3
	fbg	%fcc0,	loop_2314
	fexpand	%f11,	%f18
	xnor	%i0,	0x0683,	%o1
	wr	%g0,	0x89,	%asi
	sta	%f14,	[%l7 + 0x34] %asi
loop_2314:
	bn	%xcc,	loop_2315
	fbo,a	%fcc2,	loop_2316
	fxnors	%f13,	%f10,	%f5
	udivcc	%l1,	0x18A9,	%o0
loop_2315:
	lduh	[%l7 + 0x72],	%g5
loop_2316:
	movl	%icc,	%o2,	%i1
	bleu,a,pn	%xcc,	loop_2317
	srlx	%l6,	0x12,	%g4
	fbue	%fcc1,	loop_2318
	brgez	%o5,	loop_2319
loop_2317:
	tn	%icc,	0x1
	mova	%icc,	%g6,	%l3
loop_2318:
	ldx	[%l7 + 0x28],	%l5
loop_2319:
	movcs	%icc,	%i5,	%g7
	sdivcc	%l4,	0x0AB0,	%l0
	siam	0x5
	sll	%i6,	0x1D,	%o7
	fmul8x16au	%f0,	%f19,	%f18
	movleu	%icc,	%i4,	%i3
	st	%f0,	[%l7 + 0x44]
	umulcc	%g1,	%l2,	%i7
	subccc	%o4,	%i2,	%o6
	fzeros	%f25
	movre	%g2,	0x177,	%g3
	fmovscc	%icc,	%f5,	%f2
	fmovrsgez	%o3,	%f25,	%f25
	edge8n	%o1,	%l1,	%o0
	udiv	%i0,	0x1CD2,	%o2
	bcc,pt	%icc,	loop_2320
	bvc,pt	%xcc,	loop_2321
	xorcc	%g5,	0x00B6,	%i1
	sll	%g4,	%l6,	%o5
loop_2320:
	nop
	wr	%g0,	0x23,	%asi
	stba	%l3,	[%l7 + 0x2D] %asi
	membar	#Sync
loop_2321:
	orn	%g6,	0x175F,	%i5
	move	%icc,	%g7,	%l5
	sth	%l4,	[%l7 + 0x50]
	tn	%icc,	0x5
	umul	%i6,	0x057C,	%o7
	edge32l	%l0,	%i3,	%g1
	edge8l	%l2,	%i7,	%i4
	call	loop_2322
	edge32l	%o4,	%i2,	%g2
	tcs	%icc,	0x7
	umul	%g3,	%o3,	%o6
loop_2322:
	fmovrsne	%l1,	%f8,	%f8
	tl	%xcc,	0x3
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	setx	loop_2323,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ble,a	%icc,	loop_2324
	fabss	%f20,	%f19
	movrlez	%o1,	%o0,	%i0
loop_2323:
	mulx	%o2,	%g5,	%g4
loop_2324:
	ldsw	[%l7 + 0x7C],	%l6
	edge8n	%i1,	%o5,	%g6
	ldsw	[%l7 + 0x28],	%l3
	umulcc	%g7,	0x034F,	%i5
	bshuffle	%f30,	%f28,	%f10
	subc	%l5,	%l4,	%o7
	srl	%i6,	0x0A,	%i3
	fble	%fcc0,	loop_2325
	fmuld8sux16	%f20,	%f5,	%f18
	edge32n	%g1,	%l0,	%l2
	fmovd	%f22,	%f0
loop_2325:
	sllx	%i4,	0x14,	%i7
	fmovdneg	%xcc,	%f26,	%f3
	ldsb	[%l7 + 0x64],	%i2
	sir	0x134E
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	fcmps	%fcc1,	%f1,	%f10
	xor	%g3,	0x16AB,	%o3
	umul	%o6,	0x0459,	%g2
	movl	%xcc,	%o1,	%o0
	prefetch	[%l7 + 0x0C],	 0x0
	edge8l	%i0,	%o2,	%l1
	fands	%f9,	%f11,	%f16
	fmovda	%icc,	%f11,	%f0
	movrgz	%g5,	0x104,	%g4
	and	%i1,	0x0054,	%o5
	bneg,a	%icc,	loop_2326
	edge16n	%l6,	%l3,	%g6
	fcmpne32	%f26,	%f4,	%i5
	fmovd	%f22,	%f22
loop_2326:
	movvs	%icc,	%g7,	%l4
	edge16n	%l5,	%o7,	%i3
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tcc	%xcc,	0x0
	andn	%i6,	0x0E58,	%l0
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x2A] %asi,	%g1
	tvc	%icc,	0x4
	fmovdle	%icc,	%f17,	%f27
	bneg,pn	%xcc,	loop_2327
	umulcc	%l2,	0x004B,	%i7
	lduh	[%l7 + 0x3C],	%i2
	fnor	%f26,	%f8,	%f8
loop_2327:
	andn	%o4,	0x1D1F,	%i4
	fmuld8ulx16	%f18,	%f6,	%f16
	fmovdcs	%xcc,	%f9,	%f29
	edge16	%g3,	%o3,	%g2
	andncc	%o1,	%o0,	%o6
	fmovdl	%icc,	%f19,	%f6
	sth	%i0,	[%l7 + 0x26]
	movrgez	%l1,	%o2,	%g4
	edge32l	%i1,	%g5,	%o5
	movvs	%icc,	%l6,	%g6
	nop
	set	0x08, %g4
	ldsb	[%l7 + %g4],	%l3
	fbule,a	%fcc2,	loop_2328
	ta	%xcc,	0x3
	edge32	%i5,	%g7,	%l5
	movre	%l4,	0x28A,	%i3
loop_2328:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] %asi,	%i6,	%o7
	edge8l	%l0,	%g1,	%l2
	fones	%f28
	bgu,pn	%xcc,	loop_2329
	alignaddr	%i2,	%i7,	%i4
	addccc	%g3,	0x0FFE,	%o3
	ldx	[%l7 + 0x60],	%g2
loop_2329:
	taddcctv	%o4,	%o0,	%o1
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x3A] %asi,	%o6
	ta	%xcc,	0x5
	movg	%icc,	%l1,	%o2
	addccc	%g4,	0x0E78,	%i0
	tn	%icc,	0x6
	movrne	%i1,	%o5,	%g5
	fbl	%fcc3,	loop_2330
	bvs	loop_2331
	pdist	%f26,	%f16,	%f10
	bcc,a	loop_2332
loop_2330:
	tge	%icc,	0x0
loop_2331:
	sub	%l6,	0x15BE,	%l3
	nop
	setx	loop_2333,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2332:
	ba,a,pn	%xcc,	loop_2334
	sir	0x0A7E
	bgu,a,pt	%xcc,	loop_2335
loop_2333:
	fbg	%fcc0,	loop_2336
loop_2334:
	xorcc	%i5,	%g6,	%g7
	te	%xcc,	0x1
loop_2335:
	xnor	%l5,	%l4,	%i6
loop_2336:
	bg,pt	%xcc,	loop_2337
	fones	%f9
	lduw	[%l7 + 0x58],	%i3
	edge8ln	%o7,	%l0,	%g1
loop_2337:
	ldub	[%l7 + 0x5F],	%l2
	bshuffle	%f30,	%f4,	%f8
	fmovdl	%xcc,	%f5,	%f1
	movl	%xcc,	%i7,	%i2
	fmovdleu	%icc,	%f25,	%f20
	fpackfix	%f26,	%f20
	fsrc2	%f28,	%f16
	and	%i4,	0x049A,	%o3
	fmovrsgez	%g3,	%f22,	%f24
	edge8	%g2,	%o0,	%o4
	set	0x2E, %o5
	ldstuba	[%l7 + %o5] 0x80,	%o1
	subccc	%l1,	%o2,	%o6
	array8	%g4,	%i0,	%i1
	sra	%o5,	%g5,	%l6
	ta	%xcc,	0x6
	set	0x1C, %g3
	lduha	[%l7 + %g3] 0x89,	%l3
	edge8n	%i5,	%g6,	%l5
	edge16l	%g7,	%i6,	%i3
	subc	%l4,	0x1868,	%o7
	st	%f6,	[%l7 + 0x3C]
	alignaddrl	%l0,	%l2,	%g1
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x0c,	 0x1
	edge16l	%i4,	%o3,	%i2
	fbe,a	%fcc2,	loop_2338
	fnot2s	%f4,	%f2
	edge8	%g3,	%g2,	%o4
	movrgz	%o1,	%l1,	%o0
loop_2338:
	ldsw	[%l7 + 0x40],	%o2
	tgu	%xcc,	0x5
	fandnot2	%f16,	%f2,	%f10
	fbn,a	%fcc3,	loop_2339
	fmovdvc	%xcc,	%f24,	%f31
	fandnot2	%f24,	%f22,	%f26
	fmovs	%f16,	%f16
loop_2339:
	movrlz	%g4,	%i0,	%i1
	movvs	%icc,	%o5,	%g5
	bgu	loop_2340
	tsubcctv	%l6,	%o6,	%l3
	movre	%i5,	0x374,	%l5
	fands	%f27,	%f19,	%f2
loop_2340:
	movneg	%icc,	%g7,	%g6
	tne	%icc,	0x4
	movvs	%xcc,	%i3,	%i6
	xnor	%l4,	0x03E0,	%l0
	sub	%l2,	0x1646,	%g1
	edge32ln	%o7,	%i4,	%i7
	udivcc	%i2,	0x0567,	%g3
	fmovdleu	%xcc,	%f17,	%f15
	edge8	%o3,	%o4,	%o1
	fandnot1s	%f29,	%f21,	%f17
	fmovdleu	%xcc,	%f23,	%f14
	fors	%f8,	%f0,	%f1
	array8	%l1,	%o0,	%o2
	tsubcctv	%g2,	0x1131,	%g4
	sethi	0x1674,	%i1
	fzero	%f10
	stb	%i0,	[%l7 + 0x46]
	sdivcc	%o5,	0x0296,	%l6
	sra	%o6,	%g5,	%l3
	edge16ln	%l5,	%i5,	%g6
	sethi	0x053C,	%i3
	subccc	%i6,	0x07CA,	%l4
	movneg	%icc,	%l0,	%l2
	fzeros	%f14
	xnorcc	%g7,	0x0C0E,	%o7
	fbuge,a	%fcc2,	loop_2341
	subc	%g1,	%i7,	%i4
	sdivx	%g3,	0x10C9,	%i2
	tcc	%xcc,	0x0
loop_2341:
	fandnot2s	%f22,	%f9,	%f12
	umul	%o3,	%o4,	%o1
	and	%o0,	0x1A41,	%l1
	fxor	%f18,	%f30,	%f10
	smul	%g2,	%g4,	%i1
	sethi	0x133D,	%o2
	add	%o5,	0x14ED,	%i0
	fmovde	%xcc,	%f19,	%f24
	xnor	%o6,	0x13DB,	%l6
	set	0x18, %g2
	stba	%l3,	[%l7 + %g2] 0x88
	movre	%l5,	0x24E,	%i5
	xorcc	%g6,	%i3,	%g5
	ldsh	[%l7 + 0x7E],	%i6
	srlx	%l0,	%l4,	%l2
	fmul8ulx16	%f14,	%f0,	%f18
	movcs	%xcc,	%o7,	%g7
	tsubcc	%g1,	%i7,	%i4
	fxors	%f20,	%f24,	%f31
	fmovdne	%xcc,	%f31,	%f11
	sdivcc	%g3,	0x1A78,	%o3
	fbn	%fcc0,	loop_2342
	fmovrdlz	%i2,	%f4,	%f10
	movvc	%icc,	%o1,	%o4
	sir	0x1416
loop_2342:
	tle	%icc,	0x4
	call	loop_2343
	ldd	[%l7 + 0x60],	%l0
	move	%icc,	%g2,	%g4
	addcc	%o0,	0x17C5,	%o2
loop_2343:
	fmovdvs	%xcc,	%f13,	%f0
	andn	%i1,	%i0,	%o5
	sdivcc	%l6,	0x0525,	%o6
	set	0x7C, %i0
	lda	[%l7 + %i0] 0x11,	%f29
	bvs,pn	%xcc,	loop_2344
	edge32n	%l5,	%i5,	%l3
	sir	0x1C79
	fmovdneg	%icc,	%f0,	%f19
loop_2344:
	brlez,a	%i3,	loop_2345
	udivx	%g6,	0x067A,	%g5
	mulscc	%l0,	0x1F82,	%i6
	wr	%g0,	0x11,	%asi
	sta	%f21,	[%l7 + 0x64] %asi
loop_2345:
	tge	%icc,	0x5
	sdivx	%l4,	0x171D,	%l2
	alignaddrl	%g7,	%o7,	%g1
	srax	%i7,	%g3,	%i4
	fmovscc	%xcc,	%f18,	%f16
	fmovsge	%icc,	%f2,	%f31
	srlx	%i2,	%o1,	%o4
	edge32l	%l1,	%o3,	%g2
	brlz	%o0,	loop_2346
	std	%f14,	[%l7 + 0x50]
	tvc	%xcc,	0x3
	flush	%l7 + 0x2C
loop_2346:
	tsubcctv	%g4,	%i1,	%i0
	xnor	%o5,	%l6,	%o2
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	prefetch	[%l7 + 0x74],	 0x2
	tvc	%icc,	0x0
	stb	%o6,	[%l7 + 0x4A]
	udiv	%i5,	0x06BB,	%l5
	movvs	%xcc,	%i3,	%g6
	udiv	%g5,	0x0EF4,	%l0
	tge	%xcc,	0x6
	fmovsn	%xcc,	%f9,	%f9
	tcs	%icc,	0x3
	addccc	%i6,	%l4,	%l3
	xor	%g7,	%o7,	%g1
	tsubcc	%i7,	0x16D6,	%g3
	tsubcc	%l2,	%i2,	%o1
	tge	%xcc,	0x7
	array32	%i4,	%l1,	%o3
	tcc	%xcc,	0x3
	subc	%g2,	0x165C,	%o4
	fmovrslz	%g4,	%f31,	%f22
	array32	%o0,	%i0,	%o5
	tsubcctv	%i1,	%o2,	%o6
	set	0x28, %i6
	stxa	%l6,	[%l7 + %i6] 0xe3
	membar	#Sync
	brz	%i5,	loop_2347
	brgz	%i3,	loop_2348
	fmovsle	%icc,	%f2,	%f12
	andncc	%g6,	%l5,	%g5
loop_2347:
	sub	%l0,	%i6,	%l3
loop_2348:
	sdivcc	%l4,	0x1F2C,	%g7
	fmovspos	%icc,	%f0,	%f19
	sir	0x1BCB
	nop
	set	0x74, %l5
	lduw	[%l7 + %l5],	%g1
	mulx	%o7,	%i7,	%l2
	ldsb	[%l7 + 0x12],	%i2
	brnz,a	%g3,	loop_2349
	fmovscs	%xcc,	%f22,	%f22
	sdivcc	%i4,	0x10CC,	%l1
	edge16n	%o3,	%g2,	%o4
loop_2349:
	fmovscc	%xcc,	%f1,	%f12
	sethi	0x0B84,	%o1
	fxnor	%f22,	%f20,	%f22
	srl	%o0,	0x0B,	%g4
	fmovdl	%xcc,	%f18,	%f17
	movvc	%xcc,	%o5,	%i1
	tle	%icc,	0x2
	fbn,a	%fcc3,	loop_2350
	movgu	%icc,	%i0,	%o6
	fnot1s	%f19,	%f10
	fornot1s	%f26,	%f25,	%f30
loop_2350:
	tn	%xcc,	0x3
	sll	%l6,	0x1C,	%i5
	fnand	%f2,	%f30,	%f22
	ldsw	[%l7 + 0x48],	%o2
	umul	%g6,	%l5,	%i3
	mulscc	%g5,	%i6,	%l0
	movrgez	%l3,	%l4,	%g1
	bcc,a	%xcc,	loop_2351
	nop
	setx	loop_2352,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bge,a	loop_2353
	faligndata	%f16,	%f24,	%f2
loop_2351:
	array8	%g7,	%o7,	%l2
loop_2352:
	movrgz	%i7,	0x11B,	%g3
loop_2353:
	movpos	%xcc,	%i2,	%i4
	movrlez	%o3,	0x374,	%l1
	srax	%g2,	%o4,	%o1
	mova	%icc,	%o0,	%g4
	movvs	%xcc,	%o5,	%i0
	movpos	%xcc,	%o6,	%i1
	movneg	%icc,	%l6,	%i5
	fands	%f22,	%f19,	%f4
	tge	%xcc,	0x0
	fmovdn	%xcc,	%f22,	%f5
	fmovdneg	%icc,	%f18,	%f28
	tcs	%xcc,	0x4
	andncc	%g6,	%l5,	%o2
	udivcc	%g5,	0x054A,	%i6
	flush	%l7 + 0x74
	fpsub32	%f16,	%f30,	%f4
	tvc	%icc,	0x5
	movcs	%icc,	%l0,	%l3
	fpsub32	%f28,	%f30,	%f16
	wr	%g0,	0x27,	%asi
	stba	%l4,	[%l7 + 0x10] %asi
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%g1,	%g7
	andn	%i3,	0x0B25,	%l2
	fpsub32	%f30,	%f12,	%f30
	fandnot1s	%f19,	%f16,	%f3
	bcs	%xcc,	loop_2354
	edge16l	%i7,	%g3,	%o7
	sra	%i2,	%i4,	%o3
	xnor	%g2,	%o4,	%l1
loop_2354:
	nop
	set	0x28, %l4
	lda	[%l7 + %l4] 0x89,	%f2
	fbule	%fcc2,	loop_2355
	sdivx	%o0,	0x0F50,	%o1
	fmul8sux16	%f4,	%f30,	%f22
	flush	%l7 + 0x58
loop_2355:
	movvs	%icc,	%o5,	%i0
	movl	%icc,	%o6,	%g4
	ldsb	[%l7 + 0x0A],	%l6
	stw	%i1,	[%l7 + 0x70]
	fmovrdne	%g6,	%f14,	%f28
	movvs	%icc,	%i5,	%l5
	stbar
	fmovdvc	%xcc,	%f21,	%f22
	mulscc	%g5,	0x142A,	%o2
	fblg	%fcc0,	loop_2356
	sllx	%i6,	%l0,	%l3
	fornot2s	%f28,	%f26,	%f27
	sub	%g1,	0x0823,	%g7
loop_2356:
	bgu	loop_2357
	tpos	%xcc,	0x3
	faligndata	%f6,	%f2,	%f0
	movvs	%xcc,	%l4,	%i3
loop_2357:
	movrlez	%i7,	0x38C,	%l2
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x14] %asi,	%o7
	xnor	%g3,	0x0601,	%i2
	tpos	%xcc,	0x3
	fornot1	%f16,	%f2,	%f28
	tneg	%icc,	0x2
	stx	%o3,	[%l7 + 0x48]
	fmovdn	%icc,	%f13,	%f26
	tcs	%xcc,	0x2
	edge16ln	%g2,	%o4,	%l1
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tl	%icc,	0x5
	taddcctv	%o0,	0x0516,	%o1
	set	0x70, %g7
	stda	%i4,	[%l7 + %g7] 0x0c
	umulcc	%i0,	0x159A,	%o5
	fcmpgt16	%f8,	%f6,	%o6
	set	0x68, %i4
	stxa	%g4,	[%l7 + %i4] 0xe2
	membar	#Sync
	movrlez	%l6,	0x091,	%g6
	faligndata	%f26,	%f4,	%f20
	edge8l	%i1,	%i5,	%g5
	fxors	%f18,	%f7,	%f1
	orn	%l5,	0x0A8C,	%i6
	fmovdge	%icc,	%f21,	%f12
	ldsb	[%l7 + 0x3F],	%l0
	fandnot2s	%f2,	%f31,	%f11
	lduw	[%l7 + 0x2C],	%o2
	brnz,a	%l3,	loop_2358
	ta	%xcc,	0x6
	edge32ln	%g7,	%g1,	%l4
	movrne	%i7,	0x0EC,	%i3
loop_2358:
	fandnot2s	%f5,	%f8,	%f26
	fmovse	%xcc,	%f15,	%f9
	call	loop_2359
	fbule,a	%fcc2,	loop_2360
	siam	0x4
	movn	%xcc,	%l2,	%g3
loop_2359:
	fpack32	%f2,	%f30,	%f14
loop_2360:
	fmovsleu	%xcc,	%f3,	%f14
	fmovsle	%xcc,	%f9,	%f31
	umulcc	%i2,	0x176D,	%o7
	sethi	0x15DC,	%o3
	movcc	%icc,	%o4,	%l1
	bcc,pn	%xcc,	loop_2361
	bl,a,pt	%icc,	loop_2362
	xorcc	%g2,	0x1B61,	%o1
	fmovrslz	%i4,	%f13,	%f22
loop_2361:
	sra	%o0,	%i0,	%o6
loop_2362:
	movrgez	%o5,	%l6,	%g4
	fnegs	%f17,	%f5
	fpackfix	%f28,	%f8
	bn,a,pt	%xcc,	loop_2363
	fmovsne	%xcc,	%f20,	%f16
	edge16ln	%i1,	%i5,	%g5
	sll	%g6,	0x09,	%l5
loop_2363:
	fbge	%fcc2,	loop_2364
	edge32n	%l0,	%o2,	%l3
	fmovde	%icc,	%f24,	%f8
	fbule	%fcc2,	loop_2365
loop_2364:
	nop
	set	0x68, %g1
	stx	%g7,	[%l7 + %g1]
	movrgz	%g1,	0x362,	%l4
	bpos	%xcc,	loop_2366
loop_2365:
	nop
	setx	loop_2367,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mova	%xcc,	%i7,	%i6
	edge8ln	%l2,	%g3,	%i3
loop_2366:
	taddcctv	%i2,	0x19B6,	%o3
loop_2367:
	brnz,a	%o4,	loop_2368
	smulcc	%l1,	%g2,	%o7
	tgu	%icc,	0x6
	xnorcc	%i4,	0x0F61,	%o1
loop_2368:
	subcc	%o0,	0x0F8F,	%i0
	sllx	%o5,	0x1A,	%o6
	std	%g4,	[%l7 + 0x48]
	xorcc	%l6,	%i5,	%g5
	movneg	%xcc,	%g6,	%l5
	mulscc	%i1,	%o2,	%l0
	xnor	%l3,	0x0E7A,	%g7
	tcc	%xcc,	0x5
	tvc	%xcc,	0x3
	nop
	set	0x1C, %i2
	lduw	[%l7 + %i2],	%g1
	fpsub32	%f12,	%f24,	%f28
	fpmerge	%f22,	%f1,	%f2
	prefetch	[%l7 + 0x18],	 0x3
	tpos	%icc,	0x7
	bge,pn	%icc,	loop_2369
	fmovdl	%icc,	%f4,	%f7
	fmul8x16al	%f27,	%f8,	%f28
	tvs	%xcc,	0x2
loop_2369:
	brz	%l4,	loop_2370
	movrgez	%i7,	0x14B,	%i6
	fandnot2	%f4,	%f24,	%f22
	bcc,a,pt	%xcc,	loop_2371
loop_2370:
	sll	%l2,	%i3,	%i2
	edge8ln	%g3,	%o3,	%l1
	add	%o4,	0x138A,	%o7
loop_2371:
	mulx	%g2,	%i4,	%o0
	fmovrdne	%o1,	%f26,	%f18
	andncc	%o5,	%o6,	%g4
	fmovdl	%xcc,	%f3,	%f24
	add	%l6,	%i5,	%g5
	brlz,a	%i0,	loop_2372
	fmovrdgez	%g6,	%f0,	%f30
	fbu,a	%fcc0,	loop_2373
	movge	%xcc,	%l5,	%o2
loop_2372:
	edge32ln	%l0,	%i1,	%g7
	lduw	[%l7 + 0x44],	%g1
loop_2373:
	movn	%icc,	%l3,	%l4
	fmovsneg	%icc,	%f5,	%f21
	fone	%f8
	add	%l7,	0x10,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i6,	%i7
	ldx	[%l7 + 0x20],	%i3
	subccc	%i2,	%g3,	%o3
	sllx	%l2,	0x0F,	%l1
	nop
	set	0x47, %i5
	ldstub	[%l7 + %i5],	%o7
	fcmpne32	%f4,	%f24,	%o4
	subc	%i4,	0x1AAF,	%g2
	ldub	[%l7 + 0x24],	%o0
	fcmped	%fcc1,	%f0,	%f10
	fmovdgu	%xcc,	%f10,	%f30
	sub	%o5,	%o6,	%o1
	xorcc	%l6,	0x0891,	%g4
	xor	%g5,	0x0ED0,	%i5
	andcc	%i0,	%l5,	%o2
	movrlz	%g6,	0x085,	%i1
	st	%f25,	[%l7 + 0x2C]
	fandnot2	%f24,	%f28,	%f8
	fmovrdlz	%g7,	%f0,	%f14
	tn	%icc,	0x3
	call	loop_2374
	orncc	%g1,	%l3,	%l4
	sub	%i6,	0x01E9,	%i7
	for	%f8,	%f28,	%f16
loop_2374:
	movvc	%icc,	%i3,	%i2
	edge8ln	%l0,	%g3,	%l2
	srl	%l1,	0x01,	%o3
	fmovrsgz	%o7,	%f17,	%f15
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x89,	%f0
	movrlz	%i4,	%g2,	%o0
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%f8
	prefetch	[%l7 + 0x10],	 0x0
	fmovs	%f22,	%f4
	nop
	set	0x08, %o0
	stx	%o5,	[%l7 + %o0]
	movn	%icc,	%o4,	%o1
	fmovrse	%o6,	%f12,	%f7
	tvc	%icc,	0x7
	tg	%xcc,	0x7
	ble,a,pt	%xcc,	loop_2375
	tcs	%icc,	0x6
	set	0x60, %l1
	ldda	[%l7 + %l1] 0x89,	%i6
loop_2375:
	srlx	%g5,	0x01,	%g4
	udiv	%i5,	0x02BA,	%i0
	xnorcc	%l5,	%o2,	%i1
	smulcc	%g6,	%g7,	%l3
	xorcc	%l4,	%g1,	%i7
	fnot2	%f30,	%f4
	orncc	%i6,	%i2,	%i3
	udivcc	%g3,	0x0FAD,	%l2
	movcc	%icc,	%l0,	%l1
	sll	%o7,	%i4,	%g2
	wr	%g0,	0x81,	%asi
	stxa	%o3,	[%l7 + 0x10] %asi
	alignaddr	%o0,	%o4,	%o1
	fpsub16	%f28,	%f22,	%f22
	movge	%icc,	%o6,	%l6
	movleu	%icc,	%g5,	%g4
	set	0x38, %o4
	lda	[%l7 + %o4] 0x18,	%f19
	ldx	[%l7 + 0x70],	%i5
	brgz	%i0,	loop_2376
	movrgez	%l5,	0x276,	%o2
	ld	[%l7 + 0x10],	%f25
	stbar
loop_2376:
	tsubcctv	%o5,	0x1C1E,	%i1
	std	%g6,	[%l7 + 0x78]
	set	0x70, %i7
	prefetcha	[%l7 + %i7] 0x80,	 0x3
	fcmpne16	%f28,	%f2,	%l3
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x24] %asi,	%g1
	xorcc	%l4,	%i6,	%i2
	addccc	%i3,	%g3,	%l2
	movrgz	%l0,	0x378,	%i7
	movvs	%icc,	%o7,	%l1
	addccc	%g2,	%o3,	%o0
	edge16l	%o4,	%i4,	%o6
	fmovrdlz	%o1,	%f30,	%f28
	edge8l	%l6,	%g4,	%g5
	prefetch	[%l7 + 0x68],	 0x0
	movle	%xcc,	%i0,	%i5
	tl	%xcc,	0x3
	array16	%l5,	%o5,	%i1
	fpadd32s	%f12,	%f13,	%f2
	fpack16	%f18,	%f5
	orn	%g7,	%o2,	%g6
	fbg	%fcc2,	loop_2377
	sir	0x138C
	xnor	%l3,	0x125F,	%l4
	ldx	[%l7 + 0x48],	%i6
loop_2377:
	subc	%g1,	%i3,	%i2
	mova	%xcc,	%g3,	%l2
	fmovsa	%icc,	%f14,	%f14
	alignaddr	%l0,	%o7,	%l1
	udiv	%g2,	0x1DCD,	%i7
	tpos	%icc,	0x3
	sth	%o3,	[%l7 + 0x18]
	fmul8x16al	%f4,	%f21,	%f26
	subcc	%o0,	0x046C,	%i4
	flush	%l7 + 0x6C
	wr	%g0,	0x19,	%asi
	stba	%o4,	[%l7 + 0x54] %asi
	tle	%icc,	0x2
	array8	%o1,	%o6,	%g4
	tge	%icc,	0x7
	ba,a	loop_2378
	xorcc	%l6,	0x0C8B,	%i0
	tcs	%icc,	0x4
	tle	%icc,	0x5
loop_2378:
	fcmpne32	%f4,	%f28,	%i5
	fsrc2s	%f10,	%f11
	tg	%xcc,	0x1
	fmuld8ulx16	%f6,	%f31,	%f8
	std	%g4,	[%l7 + 0x30]
	edge16l	%o5,	%l5,	%i1
	movcs	%xcc,	%g7,	%g6
	fmovrdgez	%l3,	%f18,	%f18
	sdiv	%l4,	0x0AA9,	%o2
	tleu	%xcc,	0x2
	wr	%g0,	0xeb,	%asi
	stda	%g0,	[%l7 + 0x30] %asi
	membar	#Sync
	fbne	%fcc2,	loop_2379
	xnor	%i6,	%i2,	%i3
	udivcc	%l2,	0x1D53,	%g3
	set	0x68, %o1
	swapa	[%l7 + %o1] 0x11,	%o7
loop_2379:
	fmovrdlez	%l1,	%f4,	%f2
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x36] %asi,	%g2
	and	%i7,	0x02DF,	%o3
	brlz	%o0,	loop_2380
	fxors	%f21,	%f15,	%f6
	umulcc	%i4,	%l0,	%o1
	fcmpgt32	%f10,	%f20,	%o6
loop_2380:
	nop
	set	0x60, %g5
	stxa	%o4,	[%l7 + %g5] 0x14
	fmovrsgz	%g4,	%f19,	%f19
	orn	%i0,	%l6,	%g5
	movrgez	%o5,	0x195,	%i5
	and	%l5,	%g7,	%i1
	set	0x74, %o2
	ldsha	[%l7 + %o2] 0x04,	%l3
	fcmpeq32	%f16,	%f28,	%l4
	srax	%o2,	0x11,	%g1
	fmovd	%f16,	%f12
	fbg	%fcc0,	loop_2381
	movrlz	%i6,	%g6,	%i3
	membar	0x5F
	fmovdcc	%icc,	%f22,	%f10
loop_2381:
	movvc	%icc,	%l2,	%i2
	tg	%icc,	0x2
	movrgez	%o7,	0x323,	%g3
	subc	%g2,	0x0CC5,	%l1
	stw	%o3,	[%l7 + 0x78]
	edge16	%i7,	%o0,	%l0
	movgu	%icc,	%i4,	%o6
	tpos	%xcc,	0x1
	fmovda	%xcc,	%f22,	%f17
	fbge	%fcc0,	loop_2382
	movrgez	%o4,	0x198,	%o1
	movne	%icc,	%i0,	%l6
	stw	%g4,	[%l7 + 0x4C]
loop_2382:
	movl	%icc,	%o5,	%i5
	fxor	%f14,	%f16,	%f14
	tle	%icc,	0x4
	movcc	%xcc,	%g5,	%l5
	fmul8ulx16	%f20,	%f18,	%f24
	std	%i0,	[%l7 + 0x28]
	fcmpgt16	%f20,	%f20,	%l3
	brz,a	%g7,	loop_2383
	edge32n	%o2,	%g1,	%i6
	fandnot1	%f6,	%f24,	%f6
	te	%icc,	0x5
loop_2383:
	alignaddrl	%g6,	%i3,	%l4
	tvc	%icc,	0x2
	bn,a	loop_2384
	umulcc	%i2,	0x0A24,	%l2
	bn,pn	%xcc,	loop_2385
	fmovrdne	%g3,	%f14,	%f12
loop_2384:
	orn	%g2,	0x0D45,	%o7
	set	0x58, %l0
	ldxa	[%l7 + %l0] 0x81,	%o3
loop_2385:
	tcs	%icc,	0x5
	srl	%l1,	%o0,	%i7
	sir	0x1BB0
	bpos	loop_2386
	fmovsn	%xcc,	%f9,	%f17
	sdivx	%i4,	0x132C,	%l0
	fornot2	%f4,	%f26,	%f18
loop_2386:
	bn,a,pn	%icc,	loop_2387
	fcmpeq32	%f0,	%f10,	%o4
	fpackfix	%f20,	%f28
	addc	%o1,	%o6,	%i0
loop_2387:
	ld	[%l7 + 0x58],	%f16
	movrlez	%l6,	0x1BD,	%g4
	mulx	%i5,	%g5,	%l5
	edge8n	%o5,	%l3,	%i1
	tpos	%xcc,	0x4
	prefetch	[%l7 + 0x24],	 0x0
	bgu,a,pt	%xcc,	loop_2388
	array32	%o2,	%g1,	%g7
	fnot1	%f4,	%f22
	movl	%icc,	%i6,	%i3
loop_2388:
	tvc	%xcc,	0x2
	membar	0x42
	movn	%xcc,	%g6,	%l4
	fmovsl	%xcc,	%f2,	%f11
	xnor	%i2,	0x0428,	%l2
	ldd	[%l7 + 0x20],	%g2
	tl	%icc,	0x0
	mulx	%o7,	%g2,	%l1
	fmovdgu	%xcc,	%f23,	%f24
	movpos	%xcc,	%o3,	%i7
	bcc,pn	%xcc,	loop_2389
	bvs,pt	%icc,	loop_2390
	edge8ln	%o0,	%l0,	%o4
	umulcc	%i4,	%o6,	%o1
loop_2389:
	xorcc	%i0,	%g4,	%i5
loop_2390:
	movne	%xcc,	%g5,	%l5
	fmovsneg	%xcc,	%f11,	%f10
	srax	%l6,	0x1D,	%o5
	addcc	%i1,	0x1E68,	%o2
	array8	%l3,	%g7,	%g1
	fcmple32	%f0,	%f24,	%i3
	fmovdvs	%icc,	%f4,	%f21
	fmovrsne	%i6,	%f25,	%f27
	add	%g6,	%i2,	%l2
	fmovsge	%icc,	%f1,	%f7
	tne	%icc,	0x3
	tneg	%icc,	0x0
	movrgez	%l4,	%g3,	%g2
	fble,a	%fcc2,	loop_2391
	srlx	%o7,	%o3,	%i7
	andcc	%l1,	0x08D4,	%o0
	edge32ln	%l0,	%i4,	%o4
loop_2391:
	movg	%xcc,	%o6,	%i0
	movpos	%xcc,	%o1,	%g4
	fand	%f14,	%f2,	%f2
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movn	%xcc,	%g5,	%l5
	sdivx	%i5,	0x073B,	%l6
	orcc	%o5,	0x137C,	%o2
	fmul8x16al	%f29,	%f30,	%f26
	fpadd16	%f20,	%f10,	%f4
	stbar
	edge32	%l3,	%g7,	%g1
	flush	%l7 + 0x70
	sdivcc	%i3,	0x18AE,	%i6
	fmovsle	%icc,	%f10,	%f2
	add	%g6,	%i1,	%l2
	xnor	%i2,	0x1119,	%l4
	fmovse	%xcc,	%f12,	%f15
	xorcc	%g3,	0x0E52,	%g2
	lduw	[%l7 + 0x54],	%o3
	std	%f8,	[%l7 + 0x10]
	tneg	%icc,	0x5
	movg	%xcc,	%i7,	%l1
	srl	%o0,	0x16,	%l0
	movvc	%icc,	%i4,	%o4
	subcc	%o7,	0x0342,	%i0
	movre	%o1,	%g4,	%o6
	fmovdge	%icc,	%f8,	%f20
	fbul	%fcc3,	loop_2392
	ldd	[%l7 + 0x68],	%f24
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
	tvs	%xcc,	0x6
loop_2392:
	tpos	%icc,	0x2
	fmovdpos	%xcc,	%f14,	%f22
loop_2393:
	tl	%icc,	0x5
	edge32n	%g5,	%i5,	%l6
	set	0x74, %l2
	lda	[%l7 + %l2] 0x81,	%f31
	mulx	%o5,	%l5,	%l3
	fmovsge	%icc,	%f7,	%f3
	sra	%g7,	0x03,	%g1
	movneg	%xcc,	%i3,	%o2
	tl	%icc,	0x1
	fmovsa	%icc,	%f31,	%f27
	fors	%f6,	%f22,	%f9
	tcs	%icc,	0x0
	fexpand	%f27,	%f24
	tsubcctv	%i6,	0x10E4,	%i1
	brgez,a	%g6,	loop_2394
	edge32	%i2,	%l2,	%g3
	brlz	%l4,	loop_2395
	fmovsne	%xcc,	%f23,	%f3
loop_2394:
	std	%f28,	[%l7 + 0x10]
	tsubcc	%o3,	0x1942,	%g2
loop_2395:
	nop
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
	fcmpgt32	%f8,	%f16,	%l1
	fcmpne16	%f20,	%f30,	%o0
	edge16	%l0,	%i4,	%o7
	mulx	%o4,	0x1351,	%i0
	tcc	%xcc,	0x7
	fmovrdgez	%g4,	%f14,	%f12
	srl	%o1,	0x0C,	%g5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x0E] %asi,	%i5
	fmovdg	%icc,	%f4,	%f8
	edge8	%l6,	%o6,	%o5
	mulx	%l3,	0x15DB,	%g7
	fxors	%f13,	%f22,	%f0
	udivx	%l5,	0x09FC,	%g1
	sir	0x1E99
	sub	%o2,	0x0AED,	%i3
	srlx	%i6,	%i1,	%g6
	fmovsne	%xcc,	%f11,	%f3
	movn	%xcc,	%i2,	%g3
	edge8l	%l2,	%l4,	%o3
	udiv	%g2,	0x1747,	%l1
	fmovrdlez	%i7,	%f24,	%f28
	array16	%l0,	%o0,	%o7
	umulcc	%o4,	%i4,	%g4
	fmovdl	%icc,	%f17,	%f7
	udivcc	%o1,	0x0D2C,	%g5
	fmovrdlez	%i5,	%f0,	%f28
	movvs	%xcc,	%i0,	%o6
	fmul8sux16	%f22,	%f24,	%f22
	set	0x08, %i3
	ldswa	[%l7 + %i3] 0x10,	%l6
	movneg	%icc,	%o5,	%g7
	srax	%l5,	0x14,	%l3
	movne	%xcc,	%g1,	%o2
	fcmpgt16	%f6,	%f18,	%i3
	edge32	%i1,	%i6,	%i2
	te	%icc,	0x1
	xorcc	%g6,	%l2,	%l4
	andcc	%g3,	%o3,	%l1
	movvc	%xcc,	%g2,	%l0
	tne	%icc,	0x7
	move	%icc,	%i7,	%o7
	add	%o0,	%o4,	%i4
	fmovsleu	%xcc,	%f13,	%f21
	sdiv	%o1,	0x0EA2,	%g5
	ta	%icc,	0x0
	tpos	%icc,	0x2
	fmovscs	%xcc,	%f8,	%f1
	xnor	%g4,	%i5,	%o6
	wr	%g0,	0x89,	%asi
	stwa	%l6,	[%l7 + 0x48] %asi
	bcc,a	loop_2396
	movrne	%o5,	0x141,	%g7
	set	0x30, %l3
	stxa	%l5,	[%l7 + %l3] 0x04
loop_2396:
	edge32	%l3,	%i0,	%o2
	orn	%i3,	%g1,	%i6
	fbge,a	%fcc0,	loop_2397
	fsrc1	%f18,	%f26
	movn	%icc,	%i1,	%g6
	fone	%f8
loop_2397:
	ta	%icc,	0x2
	be	loop_2398
	movne	%icc,	%l2,	%l4
	fmovsneg	%xcc,	%f14,	%f9
	edge8n	%g3,	%i2,	%o3
loop_2398:
	fmul8sux16	%f24,	%f4,	%f10
	subc	%g2,	0x0106,	%l0
	fpsub16s	%f16,	%f2,	%f29
	mova	%xcc,	%i7,	%l1
	edge32l	%o0,	%o4,	%i4
	fmovrde	%o7,	%f24,	%f12
	wr	%g0,	0x81,	%asi
	stba	%g5,	[%l7 + 0x41] %asi
	te	%xcc,	0x5
	movvc	%xcc,	%o1,	%i5
	fmovsne	%xcc,	%f7,	%f8
	edge32	%o6,	%g4,	%o5
	bl,a,pn	%xcc,	loop_2399
	bleu,pt	%icc,	loop_2400
	fpsub16s	%f11,	%f20,	%f14
	ble,a	loop_2401
loop_2399:
	bneg,a,pt	%icc,	loop_2402
loop_2400:
	subcc	%g7,	0x021F,	%l5
	edge8l	%l6,	%l3,	%i0
loop_2401:
	ldx	[%l7 + 0x60],	%o2
loop_2402:
	movvs	%xcc,	%i3,	%i6
	movrlez	%g1,	%i1,	%g6
	fmovrdne	%l2,	%f8,	%f8
	ta	%icc,	0x2
	fpadd16	%f28,	%f22,	%f4
	fpadd32	%f24,	%f2,	%f6
	sdivx	%l4,	0x0835,	%g3
	xorcc	%i2,	0x1481,	%o3
	andn	%g2,	%i7,	%l0
	sub	%o0,	%o4,	%l1
	fmovrdlez	%o7,	%f20,	%f14
	set	0x48, %i1
	ldswa	[%l7 + %i1] 0x81,	%g5
	movneg	%icc,	%o1,	%i4
	andcc	%o6,	0x10CF,	%g4
	array16	%o5,	%i5,	%l5
	edge16n	%l6,	%l3,	%i0
	tsubcctv	%g7,	%i3,	%i6
	fandnot2s	%f24,	%f30,	%f19
	sdivcc	%o2,	0x1A61,	%i1
	ble,a,pn	%xcc,	loop_2403
	be,a	loop_2404
	movre	%g1,	%g6,	%l2
	movrlez	%g3,	%l4,	%o3
loop_2403:
	movl	%icc,	%g2,	%i7
loop_2404:
	movrlez	%l0,	0x2A8,	%i2
	tsubcctv	%o0,	%o4,	%l1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x60] %asi,	%g4
	orn	%o1,	%i4,	%o7
	fornot2s	%f14,	%f12,	%f18
	brlz,a	%g4,	loop_2405
	fmovse	%xcc,	%f0,	%f6
	edge8n	%o5,	%i5,	%o6
	tn	%icc,	0x1
loop_2405:
	tsubcc	%l6,	%l3,	%i0
	movpos	%xcc,	%g7,	%i3
	srl	%i6,	%l5,	%o2
	fors	%f3,	%f21,	%f24
	tge	%icc,	0x2
	sdivx	%i1,	0x106A,	%g1
	fbug	%fcc3,	loop_2406
	andncc	%g6,	%g3,	%l2
	edge16l	%l4,	%o3,	%g2
	nop
	set	0x60, %o7
	ldstub	[%l7 + %o7],	%i7
loop_2406:
	movvc	%xcc,	%l0,	%o0
	mulx	%o4,	%l1,	%g5
	fnegd	%f30,	%f18
	movn	%icc,	%i2,	%i4
	edge8l	%o1,	%o7,	%o5
	be,pt	%icc,	loop_2407
	nop
	setx loop_2408, %l0, %l1
	jmpl %l1, %g4
	fpadd32s	%f7,	%f27,	%f16
	fands	%f15,	%f11,	%f4
loop_2407:
	tgu	%icc,	0x4
loop_2408:
	sdiv	%i5,	0x0D26,	%o6
	fpsub16	%f4,	%f6,	%f14
	tvc	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f29,	%f31
	edge16n	%l3,	%i0,	%g7
	sll	%l6,	%i3,	%l5
	edge16l	%i6,	%i1,	%g1
	and	%g6,	%o2,	%g3
	tcc	%xcc,	0x1
	fmovda	%icc,	%f0,	%f3
	st	%f14,	[%l7 + 0x2C]
	edge32n	%l2,	%o3,	%g2
	sll	%i7,	0x04,	%l0
	movrne	%l4,	%o0,	%l1
	fmuld8ulx16	%f7,	%f25,	%f26
	srax	%o4,	0x11,	%i2
	orn	%g5,	%o1,	%o7
	fblg	%fcc0,	loop_2409
	tne	%xcc,	0x7
	edge16n	%o5,	%i4,	%i5
	edge32	%o6,	%g4,	%l3
loop_2409:
	movleu	%xcc,	%i0,	%l6
	edge8ln	%g7,	%i3,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f26,	%f5
	fmovdcs	%icc,	%f20,	%f19
	xnor	%i1,	0x0313,	%g1
	brlez,a	%l5,	loop_2410
	fbuge	%fcc1,	loop_2411
	array8	%g6,	%g3,	%l2
	alignaddr	%o3,	%o2,	%i7
loop_2410:
	udivx	%l0,	0x1DCF,	%l4
loop_2411:
	edge16l	%g2,	%o0,	%l1
	sll	%i2,	%o4,	%o1
	umulcc	%g5,	0x110D,	%o7
	movpos	%xcc,	%i4,	%o5
	fmovdvs	%xcc,	%f16,	%f6
	movgu	%xcc,	%o6,	%i5
	tcc	%xcc,	0x4
	edge32l	%g4,	%i0,	%l6
	addccc	%g7,	0x0A35,	%i3
	fornot2	%f8,	%f24,	%f16
	fzero	%f18
	movrlz	%i6,	0x16A,	%l3
	st	%f4,	[%l7 + 0x34]
	tg	%icc,	0x4
	sethi	0x0BDC,	%i1
	fornot2s	%f19,	%f19,	%f9
	taddcc	%g1,	%l5,	%g6
	fbl	%fcc3,	loop_2412
	stw	%g3,	[%l7 + 0x6C]
	movre	%l2,	%o3,	%o2
	tleu	%xcc,	0x1
loop_2412:
	fbu,a	%fcc1,	loop_2413
	edge32l	%l0,	%i7,	%l4
	udivx	%o0,	0x0DBC,	%l1
	array32	%g2,	%o4,	%i2
loop_2413:
	edge32ln	%g5,	%o7,	%o1
	tl	%icc,	0x3
	fcmps	%fcc2,	%f7,	%f15
	fxnor	%f22,	%f22,	%f2
	set	0x3C, %g4
	lduwa	[%l7 + %g4] 0x19,	%o5
	bleu,pt	%icc,	loop_2414
	edge32l	%i4,	%i5,	%o6
	tpos	%xcc,	0x4
	membar	0x3E
loop_2414:
	smul	%i0,	0x12D0,	%l6
	movpos	%xcc,	%g7,	%g4
	set	0x50, %g6
	ldswa	[%l7 + %g6] 0x88,	%i3
	tleu	%icc,	0x2
	movrgez	%i6,	%l3,	%g1
	alignaddrl	%l5,	%i1,	%g3
	nop
	set	0x2D, %g3
	ldub	[%l7 + %g3],	%g6
	edge32n	%l2,	%o3,	%o2
	edge16l	%i7,	%l4,	%l0
	pdist	%f2,	%f6,	%f24
	movneg	%xcc,	%l1,	%g2
	subc	%o0,	%i2,	%o4
	fabsd	%f24,	%f28
	add	%g5,	0x1B09,	%o7
	edge16	%o5,	%i4,	%i5
	tvc	%xcc,	0x6
	umul	%o1,	0x08AE,	%i0
	move	%icc,	%o6,	%g7
	alignaddrl	%g4,	%i3,	%l6
	andncc	%i6,	%l3,	%g1
	for	%f24,	%f30,	%f26
	alignaddr	%i1,	%g3,	%g6
	ldsb	[%l7 + 0x33],	%l2
	fmovdpos	%icc,	%f28,	%f17
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%o3,	%f30,	%f0
	taddcc	%o2,	%i7,	%l4
	tgu	%xcc,	0x6
	sdivcc	%l5,	0x0030,	%l1
	sub	%g2,	%l0,	%o0
	bpos	loop_2415
	movne	%xcc,	%i2,	%o4
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x5C] %asi,	%f10
loop_2415:
	edge16l	%g5,	%o7,	%i4
	ta	%icc,	0x3
	wr	%g0,	0xe2,	%asi
	stda	%o4,	[%l7 + 0x68] %asi
	membar	#Sync
	fmovrslz	%i5,	%f26,	%f7
	taddcc	%o1,	0x185F,	%o6
	srl	%g7,	0x19,	%g4
	set	0x64, %o5
	lda	[%l7 + %o5] 0x18,	%f11
	te	%icc,	0x3
	movrne	%i3,	0x361,	%l6
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x11] %asi,	%i0
	movneg	%xcc,	%i6,	%g1
	edge8n	%i1,	%l3,	%g6
	nop
	setx loop_2416, %l0, %l1
	jmpl %l1, %l2
	tleu	%icc,	0x0
	edge16l	%g3,	%o2,	%i7
	bne	loop_2417
loop_2416:
	orncc	%l4,	0x1B28,	%l5
	array8	%o3,	%g2,	%l1
	bleu	%xcc,	loop_2418
loop_2417:
	movvs	%icc,	%l0,	%i2
	sra	%o4,	%o0,	%g5
	sethi	0x0DEF,	%i4
loop_2418:
	addccc	%o7,	%o5,	%o1
	ldsb	[%l7 + 0x7E],	%i5
	movvc	%icc,	%g7,	%o6
	fmovrsne	%g4,	%f10,	%f13
	taddcc	%l6,	%i0,	%i3
	mulscc	%i6,	%i1,	%l3
	fornot1s	%f27,	%f6,	%f11
	wr	%g0,	0x18,	%asi
	stha	%g6,	[%l7 + 0x30] %asi
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x78] %asi,	%l2
	lduh	[%l7 + 0x46],	%g3
	movg	%icc,	%g1,	%i7
	bcc,pn	%xcc,	loop_2419
	movge	%xcc,	%o2,	%l5
	movcs	%xcc,	%l4,	%o3
	xnorcc	%l1,	%l0,	%g2
loop_2419:
	move	%xcc,	%o4,	%o0
	fmovdle	%icc,	%f19,	%f6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i2
	fbge,a	%fcc1,	loop_2420
	flush	%l7 + 0x58
	sllx	%i4,	0x0A,	%g5
	fcmple16	%f22,	%f2,	%o7
loop_2420:
	orcc	%o1,	0x1031,	%i5
	mulx	%o5,	0x0422,	%o6
	taddcctv	%g7,	%g4,	%i0
	andcc	%i3,	%i6,	%i1
	orn	%l3,	%l6,	%g6
	movn	%icc,	%l2,	%g1
	movg	%icc,	%g3,	%o2
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x50] %asi,	%f17
	tle	%icc,	0x0
	sdivx	%i7,	0x0A93,	%l4
	call	loop_2421
	edge32ln	%o3,	%l1,	%l0
	orcc	%l5,	0x1DBE,	%o4
	tsubcc	%o0,	%i2,	%g2
loop_2421:
	fbne,a	%fcc1,	loop_2422
	sll	%i4,	%o7,	%o1
	array32	%g5,	%o5,	%o6
	stx	%g7,	[%l7 + 0x50]
loop_2422:
	fmuld8ulx16	%f5,	%f28,	%f24
	sllx	%g4,	%i0,	%i5
	edge32	%i6,	%i3,	%i1
	fnor	%f2,	%f28,	%f4
	fmovdcc	%xcc,	%f12,	%f9
	fmovs	%f6,	%f21
	taddcctv	%l6,	%l3,	%g6
	xor	%l2,	0x0790,	%g3
	fblg,a	%fcc2,	loop_2423
	udiv	%g1,	0x1280,	%i7
	edge32l	%o2,	%o3,	%l4
	set	0x78, %g2
	stba	%l1,	[%l7 + %g2] 0x27
	membar	#Sync
loop_2423:
	bcc,a	%icc,	loop_2424
	tn	%icc,	0x0
	edge32n	%l5,	%l0,	%o4
	set	0x6A, %i0
	lduha	[%l7 + %i0] 0x0c,	%i2
loop_2424:
	fmovdpos	%xcc,	%f18,	%f22
	xnor	%g2,	%i4,	%o0
	sth	%o7,	[%l7 + 0x50]
	bl,pt	%xcc,	loop_2425
	movcs	%icc,	%o1,	%g5
	movrgz	%o6,	%o5,	%g7
	fbue	%fcc3,	loop_2426
loop_2425:
	edge8n	%i0,	%g4,	%i5
	stx	%i6,	[%l7 + 0x08]
	fands	%f5,	%f11,	%f18
loop_2426:
	edge32n	%i1,	%i3,	%l6
	fmuld8sux16	%f8,	%f10,	%f22
	edge8n	%g6,	%l2,	%g3
	brlz,a	%l3,	loop_2427
	nop
	setx	loop_2428,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%icc,	0x4
	fmovdleu	%xcc,	%f31,	%f30
loop_2427:
	tg	%icc,	0x5
loop_2428:
	movrlz	%i7,	%g1,	%o3
	srl	%o2,	0x03,	%l1
	bge,a,pt	%icc,	loop_2429
	fbne,a	%fcc3,	loop_2430
	ba	%icc,	loop_2431
	udivx	%l5,	0x035B,	%l0
loop_2429:
	udiv	%o4,	0x1376,	%i2
loop_2430:
	sdivcc	%l4,	0x1E97,	%i4
loop_2431:
	ldsh	[%l7 + 0x5A],	%o0
	fbule	%fcc0,	loop_2432
	bg	loop_2433
	bg	%xcc,	loop_2434
	fbe,a	%fcc2,	loop_2435
loop_2432:
	mulx	%o7,	0x0035,	%g2
loop_2433:
	fbge,a	%fcc3,	loop_2436
loop_2434:
	edge32n	%o1,	%o6,	%o5
loop_2435:
	movrne	%g7,	0x1CE,	%g5
	movrgez	%g4,	%i0,	%i6
loop_2436:
	sdivx	%i5,	0x0B96,	%i1
	stw	%i3,	[%l7 + 0x6C]
	subcc	%l6,	%l2,	%g6
	edge16	%l3,	%i7,	%g3
	addcc	%g1,	%o3,	%o2
	std	%l0,	[%l7 + 0x70]
	or	%l0,	0x03D5,	%l5
	movl	%icc,	%o4,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc1,	loop_2437
	fcmpeq16	%f16,	%f18,	%l4
	nop
	setx loop_2438, %l0, %l1
	jmpl %l1, %i4
	srl	%o0,	%o7,	%g2
loop_2437:
	tge	%xcc,	0x7
	addc	%o6,	%o5,	%o1
loop_2438:
	fmovdcs	%icc,	%f23,	%f11
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovsn	%xcc,	%f9,	%f26
	movg	%xcc,	%g5,	%g7
	and	%i0,	%g4,	%i5
	array16	%i1,	%i3,	%i6
	set	0x1C, %i6
	ldswa	[%l7 + %i6] 0x11,	%l2
	tvs	%xcc,	0x7
	sdivcc	%l6,	0x132E,	%g6
	xnor	%l3,	0x0193,	%g3
	subcc	%g1,	0x179F,	%o3
	tneg	%icc,	0x1
	edge32ln	%o2,	%l1,	%l0
	movrgz	%i7,	0x3E5,	%o4
	fcmpd	%fcc0,	%f14,	%f10
	xor	%i2,	%l4,	%i4
	ldstub	[%l7 + 0x55],	%l5
	bpos,a,pt	%xcc,	loop_2439
	edge8n	%o7,	%g2,	%o6
	fbul	%fcc2,	loop_2440
	mova	%icc,	%o0,	%o1
loop_2439:
	tneg	%icc,	0x3
	sub	%g5,	%o5,	%i0
loop_2440:
	subccc	%g4,	0x09DD,	%g7
	ldub	[%l7 + 0x6D],	%i1
	edge8	%i3,	%i5,	%l2
	tge	%icc,	0x2
	orn	%l6,	%i6,	%l3
	membar	0x3B
	swap	[%l7 + 0x4C],	%g6
	ldsh	[%l7 + 0x6C],	%g3
	movleu	%xcc,	%g1,	%o3
	or	%l1,	%o2,	%l0
	umulcc	%o4,	%i7,	%l4
	fbe,a	%fcc1,	loop_2441
	addcc	%i4,	%i2,	%o7
	xor	%g2,	0x1693,	%l5
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0xf9
	membar	#Sync
loop_2441:
	sir	0x00D9
	sdivcc	%o6,	0x1E18,	%o1
	movne	%xcc,	%o0,	%o5
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x74] %asi,	%i0
	tg	%icc,	0x5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x19] %asi,	%g4
	faligndata	%f24,	%f26,	%f30
	brnz,a	%g5,	loop_2442
	fpmerge	%f24,	%f28,	%f8
	andcc	%g7,	%i3,	%i1
	andcc	%l2,	%i5,	%i6
loop_2442:
	sll	%l6,	%g6,	%l3
	xnor	%g3,	%o3,	%g1
	srlx	%o2,	%l1,	%o4
	alignaddr	%i7,	%l4,	%l0
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x78] %asi,	%f31
	ba,pn	%icc,	loop_2443
	fblg	%fcc0,	loop_2444
	bl	%icc,	loop_2445
	fzeros	%f1
loop_2443:
	sth	%i4,	[%l7 + 0x24]
loop_2444:
	fbu,a	%fcc0,	loop_2446
loop_2445:
	move	%xcc,	%i2,	%g2
	fmovde	%icc,	%f19,	%f20
	and	%l5,	0x0CEF,	%o7
loop_2446:
	fbge	%fcc3,	loop_2447
	movpos	%icc,	%o1,	%o0
	fcmpeq16	%f24,	%f12,	%o5
	smul	%o6,	0x0266,	%i0
loop_2447:
	nop
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	andn	%g5,	%i3,	%g7
	fnot1s	%f3,	%f28
	ldub	[%l7 + 0x3E],	%i1
	fbug	%fcc2,	loop_2448
	movvc	%xcc,	%l2,	%i6
	lduw	[%l7 + 0x58],	%l6
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x6A] %asi,	%g6
loop_2448:
	tge	%icc,	0x1
	ldsh	[%l7 + 0x7A],	%i5
	subc	%l3,	%g3,	%g1
	array8	%o3,	%o2,	%o4
	st	%f6,	[%l7 + 0x14]
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x70] %asi,	%i7
	sdivcc	%l1,	0x05A0,	%l0
	sdiv	%i4,	0x1B8F,	%l4
	andn	%i2,	0x1D43,	%l5
	subccc	%g2,	0x0FC0,	%o1
	tcc	%icc,	0x3
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	ba,a,pt	%xcc,	loop_2449
	fpackfix	%f28,	%f2
	andcc	%o7,	0x1F36,	%o5
	srlx	%o6,	%g4,	%i0
loop_2449:
	ta	%xcc,	0x4
	set	0x63, %l4
	stba	%i3,	[%l7 + %l4] 0x2a
	membar	#Sync
	fandnot2s	%f26,	%f29,	%f4
	fmuld8ulx16	%f14,	%f30,	%f12
	sdivcc	%g7,	0x0425,	%i1
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x7C] %asi,	%f18
	xorcc	%g5,	0x05BC,	%i6
	tl	%icc,	0x6
	edge32ln	%l2,	%l6,	%i5
	and	%g6,	0x0A1A,	%g3
	ldsb	[%l7 + 0x22],	%l3
	fpadd32s	%f6,	%f3,	%f10
	movg	%icc,	%o3,	%g1
	xor	%o2,	%o4,	%i7
	lduh	[%l7 + 0x4E],	%l0
	fabsd	%f6,	%f4
	and	%i4,	0x1C31,	%l4
	brz,a	%l1,	loop_2450
	movrlez	%l5,	0x24C,	%i2
	fmovdle	%icc,	%f10,	%f8
	andn	%o1,	%o0,	%o7
loop_2450:
	sdivcc	%o5,	0x11D1,	%o6
	ble,pt	%icc,	loop_2451
	fands	%f6,	%f24,	%f19
	fmovrdlz	%g4,	%f2,	%f12
	fmovsl	%xcc,	%f7,	%f12
loop_2451:
	call	loop_2452
	edge16l	%g2,	%i3,	%g7
	movleu	%icc,	%i1,	%i0
	sethi	0x042C,	%g5
loop_2452:
	nop
	setx	loop_2453,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%i6,	%l6,	%l2
	edge32l	%i5,	%g6,	%l3
	bge,a	%xcc,	loop_2454
loop_2453:
	mulscc	%o3,	0x0D5F,	%g3
	edge32ln	%g1,	%o4,	%o2
	taddcc	%i7,	0x139C,	%i4
loop_2454:
	movgu	%icc,	%l4,	%l1
	call	loop_2455
	fpack32	%f28,	%f12,	%f30
	sra	%l0,	%l5,	%o1
	sethi	0x116A,	%i2
loop_2455:
	movneg	%xcc,	%o7,	%o5
	alignaddr	%o6,	%g4,	%g2
	subcc	%i3,	%g7,	%i1
	flush	%l7 + 0x38
	movrlz	%o0,	%g5,	%i0
	sethi	0x1ABE,	%l6
	tneg	%icc,	0x2
	tle	%icc,	0x1
	set	0x38, %g7
	stxa	%l2,	[%l7 + %g7] 0x18
	taddcctv	%i6,	%i5,	%l3
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x50] %asi,	%o3
	orn	%g3,	0x1BA1,	%g6
	sll	%g1,	0x17,	%o4
	move	%icc,	%i7,	%o2
	tleu	%xcc,	0x0
	tcc	%xcc,	0x3
	nop
	set	0x10, %l6
	std	%l4,	[%l7 + %l6]
	edge8ln	%l1,	%l0,	%i4
	movrlz	%l5,	0x117,	%i2
	fmovrslz	%o7,	%f22,	%f0
	lduh	[%l7 + 0x2C],	%o5
	te	%xcc,	0x3
	ba,a	loop_2456
	bge,a	loop_2457
	xnorcc	%o1,	0x0497,	%o6
	taddcctv	%g4,	%g2,	%g7
loop_2456:
	fbl	%fcc2,	loop_2458
loop_2457:
	fcmpes	%fcc2,	%f7,	%f14
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i3
loop_2458:
	brnz,a	%o0,	loop_2459
	orn	%i1,	0x1726,	%i0
	nop
	setx loop_2460, %l0, %l1
	jmpl %l1, %g5
	edge16n	%l6,	%i6,	%l2
loop_2459:
	smulcc	%l3,	0x06C2,	%i5
	set	0x38, %g1
	stha	%g3,	[%l7 + %g1] 0x0c
loop_2460:
	and	%g6,	0x1525,	%g1
	tg	%xcc,	0x6
	std	%f20,	[%l7 + 0x78]
	edge32n	%o4,	%o3,	%o2
	movge	%icc,	%l4,	%l1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x1
	te	%xcc,	0x0
	tle	%xcc,	0x5
	fmul8sux16	%f30,	%f2,	%f22
	orcc	%i4,	%l0,	%l5
	xnor	%o7,	%o5,	%i2
	bpos,pn	%icc,	loop_2461
	fmovsl	%xcc,	%f5,	%f28
	brz	%o6,	loop_2462
	flush	%l7 + 0x38
loop_2461:
	fbe,a	%fcc2,	loop_2463
	udiv	%g4,	0x03D9,	%o1
loop_2462:
	fmovrdne	%g2,	%f30,	%f22
	andncc	%g7,	%o0,	%i3
loop_2463:
	movrgez	%i0,	%i1,	%g5
	fbn	%fcc2,	loop_2464
	orcc	%l6,	%i6,	%l3
	edge16	%i5,	%g3,	%g6
	prefetch	[%l7 + 0x74],	 0x3
loop_2464:
	subcc	%l2,	%g1,	%o3
	movvs	%icc,	%o4,	%l4
	movne	%xcc,	%o2,	%i7
	addcc	%l1,	0x1064,	%i4
	edge8l	%l5,	%l0,	%o5
	xnor	%o7,	%o6,	%g4
	ldx	[%l7 + 0x20],	%i2
	stw	%g2,	[%l7 + 0x74]
	bgu,a,pn	%xcc,	loop_2465
	udiv	%g7,	0x04E9,	%o1
	fbue	%fcc3,	loop_2466
	edge8	%i3,	%o0,	%i1
loop_2465:
	nop
	set	0x3A, %i2
	ldstub	[%l7 + %i2],	%g5
	movle	%xcc,	%i0,	%l6
loop_2466:
	bvs,a	%xcc,	loop_2467
	fmovdvs	%xcc,	%f7,	%f18
	xnor	%l3,	%i6,	%g3
	tleu	%icc,	0x0
loop_2467:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x30] %asi,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x38, %i4
	std	%f24,	[%l7 + %i4]
	tleu	%xcc,	0x5
	array32	%l2,	%i5,	%o3
	bvc,pt	%xcc,	loop_2468
	and	%o4,	0x177E,	%g1
	and	%o2,	0x038F,	%l4
	tne	%xcc,	0x3
loop_2468:
	tl	%xcc,	0x5
	sdivx	%l1,	0x1261,	%i4
	movvs	%icc,	%i7,	%l5
	fmovrde	%l0,	%f2,	%f30
	fbul,a	%fcc1,	loop_2469
	brlz	%o7,	loop_2470
	xnor	%o6,	%g4,	%o5
	prefetch	[%l7 + 0x54],	 0x0
loop_2469:
	movvs	%icc,	%i2,	%g7
loop_2470:
	fmovdpos	%xcc,	%f22,	%f24
	brgez,a	%o1,	loop_2471
	sll	%g2,	0x07,	%o0
	xorcc	%i1,	%i3,	%g5
	mova	%xcc,	%l6,	%i0
loop_2471:
	udivcc	%l3,	0x1BA4,	%i6
	fmovspos	%xcc,	%f4,	%f4
	bne	%icc,	loop_2472
	taddcc	%g6,	%l2,	%i5
	bvc,pt	%icc,	loop_2473
	edge16l	%o3,	%g3,	%g1
loop_2472:
	andcc	%o4,	%l4,	%o2
	bl	loop_2474
loop_2473:
	fones	%f22
	tcc	%icc,	0x4
	ldstub	[%l7 + 0x0C],	%i4
loop_2474:
	brgz	%l1,	loop_2475
	fnot2s	%f28,	%f4
	set	0x58, %i5
	swapa	[%l7 + %i5] 0x18,	%l5
loop_2475:
	movpos	%xcc,	%l0,	%i7
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x64] %asi,	%o7
	sllx	%o6,	0x0B,	%o5
	tge	%xcc,	0x0
	sir	0x17AD
	fbg	%fcc0,	loop_2476
	movge	%xcc,	%g4,	%i2
	bge,a	%icc,	loop_2477
	tne	%icc,	0x4
loop_2476:
	fpadd32	%f14,	%f12,	%f8
	movg	%xcc,	%g7,	%g2
loop_2477:
	movvs	%xcc,	%o1,	%i1
	bneg	%xcc,	loop_2478
	fpadd32	%f2,	%f10,	%f2
	movleu	%xcc,	%o0,	%g5
	fbu,a	%fcc0,	loop_2479
loop_2478:
	fcmpne32	%f26,	%f0,	%i3
	movne	%xcc,	%i0,	%l3
	fsrc1s	%f12,	%f22
loop_2479:
	array32	%i6,	%g6,	%l6
	movle	%icc,	%l2,	%i5
	movn	%xcc,	%o3,	%g1
	sllx	%g3,	0x18,	%o4
	movvs	%xcc,	%o2,	%i4
	fcmpeq16	%f14,	%f30,	%l1
	sub	%l5,	%l4,	%l0
	array32	%o7,	%i7,	%o6
	fandnot2s	%f28,	%f26,	%f8
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f30,	%f16,	%f8
	movgu	%xcc,	%g4,	%i2
	fbule	%fcc2,	loop_2480
	xorcc	%g7,	0x1889,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x48] %asi,	%o5
loop_2480:
	fbl	%fcc3,	loop_2481
	fnot1	%f26,	%f4
	srlx	%i1,	0x15,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2481:
	edge32ln	%o0,	%i3,	%g5
	andcc	%l3,	0x0E7E,	%i6
	fpsub32	%f8,	%f24,	%f2
	tne	%xcc,	0x4
	fmovrdgz	%g6,	%f8,	%f28
	fmovsle	%xcc,	%f31,	%f31
	mulscc	%l6,	%i0,	%l2
	fnor	%f18,	%f14,	%f0
	sub	%i5,	%g1,	%g3
	tleu	%icc,	0x3
	edge16l	%o4,	%o3,	%i4
	wr	%g0,	0x2f,	%asi
	stba	%o2,	[%l7 + 0x2B] %asi
	membar	#Sync
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l1,	%l5
	brgz,a	%l0,	loop_2482
	bl,pt	%icc,	loop_2483
	fmovsg	%icc,	%f12,	%f25
	fba	%fcc3,	loop_2484
loop_2482:
	edge32l	%l4,	%i7,	%o6
loop_2483:
	nop
	set	0x10, %o6
	ldda	[%l7 + %o6] 0xe3,	%o6
loop_2484:
	stx	%g4,	[%l7 + 0x10]
	fpack32	%f4,	%f6,	%f2
	membar	0x74
	edge16n	%i2,	%g7,	%g2
	fbug	%fcc0,	loop_2485
	ldd	[%l7 + 0x60],	%i0
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x4F] %asi,	%o1
loop_2485:
	xor	%o5,	0x0414,	%o0
	taddcctv	%i3,	0x14FC,	%g5
	fxor	%f4,	%f14,	%f18
	sllx	%i6,	%l3,	%g6
	movrgez	%i0,	%l2,	%l6
	ble,pn	%icc,	loop_2486
	fmovrsne	%g1,	%f25,	%f15
	array16	%i5,	%o4,	%o3
	tge	%icc,	0x5
loop_2486:
	fbne	%fcc3,	loop_2487
	srlx	%i4,	%o2,	%g3
	tcs	%xcc,	0x6
	fbule	%fcc2,	loop_2488
loop_2487:
	movrgez	%l1,	0x356,	%l0
	fmovrdgz	%l5,	%f4,	%f30
	edge8	%l4,	%o6,	%o7
loop_2488:
	movrlez	%g4,	%i2,	%g7
	fmovrslz	%g2,	%f14,	%f1
	fone	%f10
	tpos	%icc,	0x2
	fbu,a	%fcc1,	loop_2489
	movvs	%icc,	%i7,	%o1
	array16	%i1,	%o5,	%i3
	edge32l	%g5,	%o0,	%i6
loop_2489:
	edge32	%l3,	%i0,	%g6
	fandnot2s	%f4,	%f2,	%f8
	fcmpne32	%f26,	%f18,	%l6
	edge8	%l2,	%g1,	%i5
	orcc	%o4,	0x0C3D,	%i4
	tcc	%xcc,	0x3
	std	%o2,	[%l7 + 0x28]
	tsubcc	%o3,	%g3,	%l0
	set	0x38, %o3
	stda	%l0,	[%l7 + %o3] 0x04
	udivx	%l4,	0x089D,	%l5
	fbn,a	%fcc3,	loop_2490
	fxnor	%f2,	%f0,	%f4
	udivx	%o7,	0x0D19,	%g4
	subcc	%o6,	%g7,	%g2
loop_2490:
	for	%f12,	%f14,	%f22
	sethi	0x11BC,	%i2
	nop
	setx loop_2491, %l0, %l1
	jmpl %l1, %o1
	movg	%icc,	%i1,	%i7
	bvs,a,pt	%xcc,	loop_2492
	stbar
loop_2491:
	stb	%o5,	[%l7 + 0x5E]
	xor	%i3,	0x1021,	%g5
loop_2492:
	fmovrdgz	%o0,	%f12,	%f22
	tg	%xcc,	0x1
	addcc	%l3,	0x0611,	%i0
	stw	%i6,	[%l7 + 0x30]
	smulcc	%g6,	0x1802,	%l6
	srlx	%g1,	%l2,	%i5
	tge	%icc,	0x6
	fzero	%f14
	fxnor	%f0,	%f12,	%f16
	tvc	%xcc,	0x0
	bcc,pt	%xcc,	loop_2493
	bvs,a	loop_2494
	fnands	%f16,	%f28,	%f18
	or	%i4,	0x0872,	%o2
loop_2493:
	fbg,a	%fcc0,	loop_2495
loop_2494:
	sra	%o4,	0x19,	%g3
	fmovsleu	%xcc,	%f1,	%f18
	edge32l	%o3,	%l1,	%l4
loop_2495:
	edge32ln	%l0,	%l5,	%o7
	fcmpeq16	%f12,	%f24,	%g4
	sir	0x0C4E
	bcc	loop_2496
	fpack16	%f6,	%f27
	sethi	0x0682,	%o6
	prefetch	[%l7 + 0x48],	 0x1
loop_2496:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f15,	[%l7 + 0x18] %asi
	edge16l	%g7,	%i2,	%o1
	xor	%i1,	0x1B8D,	%g2
	fmovdcc	%xcc,	%f8,	%f31
	fmovsg	%xcc,	%f18,	%f1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%i7,	%o5
	fpsub32s	%f1,	%f23,	%f15
	set	0x50, %l1
	lda	[%l7 + %l1] 0x0c,	%f12
	sdivx	%i3,	0x01F8,	%g5
	ba,a	loop_2497
	movcs	%xcc,	%l3,	%i0
	fone	%f6
	smul	%o0,	0x0C75,	%i6
loop_2497:
	andncc	%g6,	%g1,	%l2
	be	%icc,	loop_2498
	orcc	%l6,	0x19A7,	%i4
	movrne	%o2,	%o4,	%i5
	popc	%o3,	%l1
loop_2498:
	movle	%icc,	%g3,	%l4
	fbu,a	%fcc0,	loop_2499
	fpsub16	%f20,	%f20,	%f12
	te	%icc,	0x7
	fbul	%fcc3,	loop_2500
loop_2499:
	alignaddr	%l0,	%l5,	%o7
	stbar
	fbu,a	%fcc0,	loop_2501
loop_2500:
	sir	0x0686
	tcc	%icc,	0x0
	sllx	%g4,	0x19,	%g7
loop_2501:
	sdivcc	%o6,	0x0CD5,	%o1
	swap	[%l7 + 0x64],	%i1
	bneg,a,pn	%xcc,	loop_2502
	mova	%xcc,	%g2,	%i7
	tvc	%xcc,	0x5
	udivcc	%i2,	0x0F80,	%o5
loop_2502:
	fone	%f28
	fbu,a	%fcc2,	loop_2503
	fcmpeq16	%f24,	%f22,	%i3
	or	%l3,	0x0CCA,	%i0
	sra	%o0,	0x08,	%i6
loop_2503:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g5,	%g1
	movvs	%xcc,	%l2,	%g6
	tsubcctv	%l6,	0x1F6D,	%o2
	movrgz	%i4,	%o4,	%o3
	movge	%xcc,	%l1,	%g3
	movre	%i5,	%l0,	%l4
	fnot2	%f2,	%f2
	bg,pn	%xcc,	loop_2504
	movrlz	%l5,	%o7,	%g4
	fmovsn	%icc,	%f15,	%f23
	tneg	%xcc,	0x4
loop_2504:
	movpos	%xcc,	%g7,	%o6
	orncc	%o1,	%i1,	%g2
	set	0x24, %o0
	swapa	[%l7 + %o0] 0x0c,	%i7
	movvc	%icc,	%i2,	%o5
	taddcc	%i3,	%l3,	%i0
	fmovsa	%xcc,	%f31,	%f13
	fbo,a	%fcc1,	loop_2505
	subc	%i6,	0x03B8,	%o0
	ldd	[%l7 + 0x58],	%f14
	popc	0x05C6,	%g5
loop_2505:
	sll	%g1,	0x10,	%l2
	edge16	%g6,	%l6,	%i4
	fsrc2	%f4,	%f8
	udiv	%o2,	0x1617,	%o3
	bg	%icc,	loop_2506
	sdiv	%o4,	0x1373,	%g3
	brz,a	%i5,	loop_2507
	tne	%icc,	0x3
loop_2506:
	ldd	[%l7 + 0x20],	%f0
	addc	%l0,	%l4,	%l1
loop_2507:
	fbu,a	%fcc1,	loop_2508
	fmovrdgez	%l5,	%f8,	%f12
	addc	%g4,	0x0CA1,	%o7
	bshuffle	%f24,	%f2,	%f14
loop_2508:
	edge16n	%g7,	%o1,	%o6
	xor	%i1,	%i7,	%g2
	movrlz	%o5,	0x35F,	%i2
	edge16ln	%l3,	%i3,	%i6
	lduw	[%l7 + 0x14],	%o0
	xor	%i0,	%g1,	%l2
	tsubcctv	%g6,	0x0249,	%g5
	movneg	%icc,	%i4,	%l6
	movcs	%xcc,	%o2,	%o4
	xnor	%o3,	0x0BC7,	%g3
	te	%xcc,	0x0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	movrlz	%l0,	0x236,	%l4
	brgez	%l1,	loop_2509
	ldsh	[%l7 + 0x4C],	%l5
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2509:
	sdivx	%o7,	0x1260,	%g7
	popc	0x0490,	%o1
	movne	%icc,	%o6,	%g4
	subccc	%i1,	%g2,	%o5
	ta	%xcc,	0x6
	bcc	%xcc,	loop_2510
	movvc	%icc,	%i2,	%l3
	fbue	%fcc1,	loop_2511
	nop
	setx	loop_2512,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2510:
	andcc	%i7,	%i3,	%i6
	alignaddrl	%i0,	%o0,	%g1
loop_2511:
	fblg	%fcc2,	loop_2513
loop_2512:
	sll	%l2,	0x0E,	%g6
	addc	%i4,	0x1683,	%g5
	bvc	%icc,	loop_2514
loop_2513:
	edge8ln	%l6,	%o4,	%o2
	bl,a	%icc,	loop_2515
	fbe	%fcc3,	loop_2516
loop_2514:
	movleu	%icc,	%o3,	%g3
	fzero	%f12
loop_2515:
	sethi	0x1D80,	%i5
loop_2516:
	fbu	%fcc3,	loop_2517
	fba	%fcc2,	loop_2518
	tge	%icc,	0x0
	bl,a,pt	%icc,	loop_2519
loop_2517:
	fnands	%f9,	%f17,	%f31
loop_2518:
	bleu,a	loop_2520
	tneg	%xcc,	0x4
loop_2519:
	movgu	%xcc,	%l0,	%l1
	udiv	%l5,	0x06BA,	%l4
loop_2520:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x23, %o4
	stba	%g7,	[%l7 + %o4] 0x2b
	membar	#Sync
	orcc	%o7,	0x1193,	%o6
	ldx	[%l7 + 0x60],	%g4
	nop
	setx loop_2521, %l0, %l1
	jmpl %l1, %i1
	array16	%o1,	%g2,	%o5
	nop
	setx	loop_2522,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmuld8ulx16	%f4,	%f0,	%f14
loop_2521:
	fbge	%fcc3,	loop_2523
	brlz,a	%l3,	loop_2524
loop_2522:
	edge16ln	%i7,	%i2,	%i3
	umulcc	%i0,	0x1D5A,	%o0
loop_2523:
	movn	%icc,	%g1,	%i6
loop_2524:
	fbul	%fcc3,	loop_2525
	movrlez	%l2,	0x0A1,	%i4
	fcmple16	%f26,	%f24,	%g5
	addcc	%g6,	%o4,	%l6
loop_2525:
	sll	%o3,	%g3,	%o2
	fones	%f15
	wr	%g0,	0x18,	%asi
	stba	%l0,	[%l7 + 0x51] %asi
	movl	%icc,	%i5,	%l5
	sir	0x0B50
	andcc	%l4,	0x15D7,	%g7
	fmovspos	%xcc,	%f9,	%f16
	fmovspos	%xcc,	%f19,	%f5
	fpadd32s	%f22,	%f1,	%f10
	fmovdleu	%xcc,	%f5,	%f25
	smulcc	%o7,	%o6,	%l1
	fmovrdne	%g4,	%f10,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i1,	%g2
	fornot1	%f26,	%f2,	%f20
	fpsub16s	%f0,	%f23,	%f1
	udiv	%o1,	0x0AEC,	%o5
	sra	%l3,	%i7,	%i2
	ldd	[%l7 + 0x50],	%i0
	bshuffle	%f8,	%f14,	%f4
	fmul8x16al	%f28,	%f0,	%f16
	set	0x14, %i7
	ldstuba	[%l7 + %i7] 0x04,	%o0
	wr	%g0,	0x27,	%asi
	stda	%g0,	[%l7 + 0x60] %asi
	membar	#Sync
	call	loop_2526
	brnz,a	%i6,	loop_2527
	movrgez	%l2,	0x264,	%i4
	movle	%xcc,	%i3,	%g6
loop_2526:
	brlez	%g5,	loop_2528
loop_2527:
	movcc	%icc,	%o4,	%o3
	ldub	[%l7 + 0x29],	%g3
	move	%xcc,	%l6,	%o2
loop_2528:
	fmovrdgz	%l0,	%f16,	%f20
	andncc	%i5,	%l4,	%g7
	sdivcc	%o7,	0x1653,	%o6
	movle	%xcc,	%l1,	%l5
	fsrc1	%f30,	%f28
	swap	[%l7 + 0x40],	%g4
	edge32ln	%g2,	%i1,	%o1
	faligndata	%f12,	%f22,	%f12
	set	0x53, %g5
	ldsba	[%l7 + %g5] 0x89,	%o5
	fands	%f6,	%f28,	%f1
	fmovdge	%icc,	%f30,	%f9
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i7,	%l3,	%i0
	movre	%o0,	%g1,	%i6
	tle	%xcc,	0x4
	tneg	%xcc,	0x0
	fmovdleu	%xcc,	%f30,	%f9
	tneg	%xcc,	0x1
	movgu	%icc,	%l2,	%i2
	orn	%i3,	0x06CE,	%g6
	mulscc	%i4,	0x1448,	%g5
	fmovrsgez	%o3,	%f18,	%f27
	srl	%o4,	%l6,	%g3
	edge32l	%l0,	%i5,	%o2
	sth	%l4,	[%l7 + 0x54]
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x14] %asi,	%o7
	andncc	%o6,	%l1,	%g7
	swap	[%l7 + 0x78],	%l5
	mulx	%g2,	%g4,	%o1
	tneg	%icc,	0x3
	sethi	0x05E5,	%o5
	movgu	%icc,	%i7,	%l3
	bshuffle	%f2,	%f16,	%f10
	tvs	%icc,	0x6
	umulcc	%i1,	%o0,	%i0
	prefetch	[%l7 + 0x6C],	 0x2
	edge16	%i6,	%l2,	%g1
	movre	%i2,	%g6,	%i4
	bneg,a	loop_2529
	udivx	%i3,	0x162E,	%o3
	movvs	%icc,	%g5,	%o4
	fsrc1s	%f8,	%f14
loop_2529:
	ldsh	[%l7 + 0x58],	%l6
	ta	%xcc,	0x6
	edge16l	%l0,	%i5,	%o2
	fmovde	%icc,	%f14,	%f12
	std	%f14,	[%l7 + 0x18]
	fblg,a	%fcc0,	loop_2530
	movrlz	%l4,	0x282,	%g3
	sll	%o7,	%o6,	%l1
	fmovrsgez	%g7,	%f27,	%f10
loop_2530:
	fmovsne	%xcc,	%f15,	%f4
	popc	%g2,	%l5
	fmul8ulx16	%f6,	%f12,	%f8
	add	%g4,	0x01DC,	%o1
	be,a	%icc,	loop_2531
	ldsb	[%l7 + 0x1A],	%o5
	orn	%i7,	0x1470,	%l3
	bn,a	%icc,	loop_2532
loop_2531:
	edge16l	%o0,	%i1,	%i6
	sth	%l2,	[%l7 + 0x64]
	fmovsleu	%icc,	%f3,	%f9
loop_2532:
	stx	%g1,	[%l7 + 0x38]
	fandnot1	%f4,	%f26,	%f4
	sll	%i2,	0x1F,	%i0
	fsrc1	%f12,	%f4
	nop
	setx	loop_2533,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddr	%i4,	%i3,	%g6
	fone	%f22
	sllx	%g5,	%o4,	%l6
loop_2533:
	movn	%xcc,	%o3,	%i5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l0,	%o2
	edge32l	%l4,	%o7,	%g3
	sethi	0x1A6E,	%l1
	sdivcc	%o6,	0x13BE,	%g2
	movrgez	%g7,	0x135,	%g4
	add	%o1,	0x17A6,	%l5
	movne	%icc,	%o5,	%i7
	fmovsl	%icc,	%f9,	%f21
	fbne	%fcc1,	loop_2534
	edge16n	%o0,	%l3,	%i1
	tvc	%icc,	0x4
	fands	%f16,	%f14,	%f13
loop_2534:
	fcmpne16	%f14,	%f2,	%l2
	sra	%i6,	%i2,	%g1
	fbl	%fcc1,	loop_2535
	nop
	setx loop_2536, %l0, %l1
	jmpl %l1, %i4
	add	%i3,	%g6,	%i0
	udiv	%g5,	0x0998,	%l6
loop_2535:
	tsubcctv	%o4,	%o3,	%i5
loop_2536:
	nop
	set	0x78, %o2
	ldxa	[%l7 + %o2] 0x18,	%o2
	ta	%icc,	0x3
	movn	%xcc,	%l0,	%l4
	alignaddrl	%g3,	%o7,	%l1
	sllx	%o6,	%g7,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%g2,	%l5
	edge32n	%o5,	%o1,	%i7
	nop
	set	0x75, %l0
	ldstub	[%l7 + %l0],	%l3
	move	%icc,	%o0,	%i1
	edge8n	%l2,	%i6,	%g1
	movrne	%i2,	0x3B0,	%i4
	fmovs	%f0,	%f31
	mova	%xcc,	%i3,	%g6
	nop
	set	0x4C, %o1
	lduw	[%l7 + %o1],	%g5
	subcc	%i0,	0x13E9,	%o4
	movcs	%icc,	%o3,	%i5
	fcmps	%fcc3,	%f30,	%f18
	lduw	[%l7 + 0x5C],	%l6
	edge8l	%o2,	%l4,	%l0
	fpsub16s	%f14,	%f17,	%f10
	fcmpgt16	%f16,	%f16,	%g3
	sdivcc	%o7,	0x193A,	%l1
	umulcc	%o6,	%g4,	%g7
	sdivcc	%g2,	0x0BF9,	%l5
	andn	%o5,	%i7,	%o1
	tl	%xcc,	0x5
	movg	%xcc,	%l3,	%i1
	movle	%icc,	%o0,	%l2
	edge32	%i6,	%g1,	%i4
	edge32ln	%i3,	%i2,	%g5
	movne	%xcc,	%i0,	%g6
	smul	%o3,	%o4,	%l6
	edge32	%o2,	%i5,	%l0
	nop
	setx	loop_2537,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%l4,	0x1A37,	%g3
	bcc,a	loop_2538
	edge8	%o7,	%l1,	%g4
loop_2537:
	sdivx	%g7,	0x18E8,	%g2
	subcc	%l5,	%o5,	%o6
loop_2538:
	fmovrsne	%i7,	%f19,	%f25
	fandnot1s	%f4,	%f13,	%f8
	fble	%fcc3,	loop_2539
	fmovrdlez	%l3,	%f10,	%f30
	fmovscs	%icc,	%f23,	%f18
	sll	%i1,	%o1,	%o0
loop_2539:
	orncc	%i6,	0x166B,	%g1
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x6C] %asi,	%f30
	subccc	%i4,	0x1F94,	%i3
	subc	%i2,	%l2,	%g5
	fandnot1	%f16,	%f8,	%f10
	umul	%g6,	%i0,	%o4
	fmovrdlz	%l6,	%f2,	%f16
	fmovrdlez	%o3,	%f4,	%f16
	movrlez	%o2,	%l0,	%i5
	movre	%l4,	0x00B,	%o7
	umul	%g3,	%g4,	%l1
	movn	%icc,	%g7,	%l5
	brz,a	%g2,	loop_2540
	lduh	[%l7 + 0x1A],	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%i7,	%l3
loop_2540:
	fmovsne	%xcc,	%f31,	%f28
	fbg	%fcc3,	loop_2541
	addcc	%i1,	%o6,	%o0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2D] %asi,	%o1
loop_2541:
	tcs	%icc,	0x0
	fxor	%f30,	%f16,	%f2
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x70] %asi,	%g1
	brnz	%i6,	loop_2542
	xnor	%i3,	0x1D82,	%i2
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x08] %asi,	%l2
loop_2542:
	ldub	[%l7 + 0x51],	%g5
	tle	%xcc,	0x6
	stw	%i4,	[%l7 + 0x74]
	fmovscc	%xcc,	%f8,	%f12
	tg	%xcc,	0x6
	tge	%icc,	0x7
	movgu	%icc,	%g6,	%i0
	udivx	%l6,	0x1A86,	%o3
	andcc	%o2,	0x0DC4,	%o4
	fmovdpos	%icc,	%f8,	%f16
	wr	%g0,	0x81,	%asi
	stxa	%i5,	[%l7 + 0x18] %asi
	movrne	%l4,	0x245,	%l0
	bleu,a	%icc,	loop_2543
	alignaddr	%o7,	%g3,	%l1
	sethi	0x133B,	%g4
	bpos,pt	%icc,	loop_2544
loop_2543:
	edge32	%l5,	%g2,	%o5
	movpos	%icc,	%g7,	%i7
	udivcc	%l3,	0x1A31,	%o6
loop_2544:
	ba,a	%icc,	loop_2545
	tneg	%icc,	0x3
	fsrc2	%f12,	%f24
	orn	%o0,	%i1,	%o1
loop_2545:
	movge	%icc,	%g1,	%i6
	fmovd	%f20,	%f26
	srax	%i3,	%l2,	%i2
	fmovrse	%g5,	%f4,	%f0
	fmovsg	%icc,	%f14,	%f20
	edge8l	%i4,	%g6,	%l6
	fmovrse	%i0,	%f19,	%f6
	fmovdleu	%icc,	%f17,	%f4
	sll	%o2,	0x14,	%o4
	tl	%icc,	0x0
	fmovdpos	%xcc,	%f18,	%f27
	sth	%i5,	[%l7 + 0x14]
	tneg	%xcc,	0x0
	movrgez	%l4,	0x004,	%o3
	move	%icc,	%l0,	%o7
	bcs,a,pt	%xcc,	loop_2546
	tvc	%xcc,	0x7
	sdivcc	%l1,	0x1225,	%g3
	tne	%icc,	0x5
loop_2546:
	ta	%xcc,	0x6
	movl	%xcc,	%l5,	%g4
	movg	%xcc,	%g2,	%g7
	fmovrdlz	%i7,	%f4,	%f20
	xorcc	%l3,	%o6,	%o0
	bleu,a	loop_2547
	edge8l	%i1,	%o5,	%g1
	edge8n	%o1,	%i6,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2547:
	srl	%i2,	0x0F,	%l2
	andn	%i4,	%g6,	%l6
	taddcctv	%g5,	0x14EF,	%i0
	srlx	%o2,	%o4,	%l4
	brlez	%o3,	loop_2548
	movvs	%icc,	%i5,	%l0
	move	%xcc,	%o7,	%l1
	sdiv	%l5,	0x1C1D,	%g3
loop_2548:
	movpos	%xcc,	%g4,	%g7
	tge	%xcc,	0x6
	taddcctv	%i7,	0x1AE2,	%l3
	fblg	%fcc1,	loop_2549
	xor	%o6,	0x00CE,	%o0
	fsrc1	%f10,	%f28
	andcc	%i1,	0x00EC,	%o5
loop_2549:
	fandnot2	%f18,	%f14,	%f2
	xor	%g1,	%g2,	%o1
	fmovs	%f26,	%f18
	ta	%icc,	0x2
	fbl,a	%fcc1,	loop_2550
	movleu	%icc,	%i3,	%i6
	brlez	%l2,	loop_2551
	bleu,a,pn	%icc,	loop_2552
loop_2550:
	tvc	%xcc,	0x5
	bneg,a,pn	%icc,	loop_2553
loop_2551:
	te	%xcc,	0x0
loop_2552:
	fcmple16	%f16,	%f20,	%i2
	sethi	0x1FF3,	%i4
loop_2553:
	sdiv	%g6,	0x014C,	%g5
	and	%i0,	%l6,	%o4
	fmovdcc	%xcc,	%f22,	%f7
	addccc	%l4,	%o2,	%o3
	wr	%g0,	0x11,	%asi
	stxa	%i5,	[%l7 + 0x10] %asi
	bneg,pn	%icc,	loop_2554
	alignaddrl	%l0,	%l1,	%l5
	movpos	%xcc,	%g3,	%g4
	array32	%o7,	%i7,	%g7
loop_2554:
	ld	[%l7 + 0x40],	%f28
	move	%icc,	%l3,	%o6
	addc	%i1,	%o0,	%o5
	edge8	%g2,	%g1,	%i3
	pdist	%f26,	%f28,	%f0
	orncc	%i6,	%o1,	%i2
	udivx	%i4,	0x17B6,	%g6
	popc	%l2,	%g5
	movn	%xcc,	%l6,	%o4
	mulscc	%i0,	0x0557,	%o2
	ldsw	[%l7 + 0x18],	%o3
	fmovrse	%l4,	%f16,	%f5
	smul	%l0,	%i5,	%l5
	edge16ln	%l1,	%g4,	%g3
	alignaddrl	%o7,	%i7,	%l3
	edge16	%g7,	%o6,	%o0
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x58] %asi,	%f8
	bgu	loop_2555
	or	%o5,	0x016D,	%g2
	sdiv	%i1,	0x1FD4,	%i3
	membar	0x6B
loop_2555:
	te	%icc,	0x5
	movrlez	%i6,	0x0DF,	%g1
	move	%xcc,	%i2,	%o1
	subc	%g6,	0x1CC0,	%i4
	fnand	%f16,	%f30,	%f2
	nop
	setx loop_2556, %l0, %l1
	jmpl %l1, %l2
	fcmple32	%f8,	%f16,	%g5
	fmovdne	%xcc,	%f0,	%f8
	movle	%icc,	%o4,	%l6
loop_2556:
	tleu	%icc,	0x3
	tvc	%icc,	0x2
	fmovda	%xcc,	%f17,	%f18
	movpos	%icc,	%i0,	%o2
	add	%l4,	0x1DD2,	%l0
	edge8n	%i5,	%l5,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g4,	0x02BE,	%g3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] 0x89,	%o7,	%i7
	edge8	%o3,	%g7,	%l3
	movrne	%o0,	0x08D,	%o5
	addcc	%o6,	0x0A04,	%g2
	subccc	%i1,	0x1105,	%i3
	array16	%i6,	%i2,	%g1
	fbg,a	%fcc0,	loop_2557
	orn	%o1,	0x1784,	%i4
	fbuge	%fcc3,	loop_2558
	sdivx	%l2,	0x154A,	%g6
loop_2557:
	fmovd	%f6,	%f6
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2558:
	edge8l	%o4,	%l6,	%g5
	orcc	%o2,	%l4,	%i0
	ta	%xcc,	0x4
	ld	[%l7 + 0x68],	%f20
	alignaddr	%i5,	%l5,	%l1
	tsubcc	%g4,	%g3,	%l0
	tn	%icc,	0x5
	fbuge	%fcc1,	loop_2559
	fmovsge	%xcc,	%f22,	%f2
	or	%o7,	%o3,	%i7
	fbue,a	%fcc1,	loop_2560
loop_2559:
	brnz	%l3,	loop_2561
	movvs	%icc,	%g7,	%o5
	movrgz	%o0,	0x03F,	%o6
loop_2560:
	brgez,a	%g2,	loop_2562
loop_2561:
	bne	loop_2563
	tvs	%xcc,	0x5
	add	%l7,	0x44,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i1
	casa	[%l6] 0x0c,	%i1,	%i3
loop_2562:
	tge	%icc,	0x6
loop_2563:
	fmul8x16al	%f26,	%f13,	%f4
	addccc	%i2,	%g1,	%i6
	fmovrdne	%o1,	%f24,	%f28
	taddcc	%l2,	0x0C20,	%g6
	stx	%o4,	[%l7 + 0x78]
	membar	0x73
	te	%xcc,	0x2
	movge	%icc,	%i4,	%l6
	sethi	0x0F0C,	%g5
	tle	%xcc,	0x0
	siam	0x2
	movg	%xcc,	%l4,	%o2
	fcmpes	%fcc1,	%f26,	%f11
	fbge,a	%fcc3,	loop_2564
	edge16	%i0,	%l5,	%i5
	tn	%xcc,	0x5
	xnorcc	%g4,	%g3,	%l0
loop_2564:
	tleu	%xcc,	0x3
	sdiv	%l1,	0x1175,	%o3
	ldsh	[%l7 + 0x32],	%i7
	fpadd32	%f12,	%f28,	%f6
	fbuge,a	%fcc1,	loop_2565
	movneg	%icc,	%o7,	%l3
	mova	%xcc,	%g7,	%o0
	fmovrslz	%o5,	%f14,	%f7
loop_2565:
	sdivx	%o6,	0x14CB,	%i1
	edge8n	%g2,	%i2,	%i3
	srlx	%i6,	%o1,	%l2
	subccc	%g6,	%o4,	%g1
	bcc,a	loop_2566
	fbuge	%fcc3,	loop_2567
	ba,a	loop_2568
	tne	%xcc,	0x0
loop_2566:
	andncc	%i4,	%g5,	%l6
loop_2567:
	tge	%icc,	0x5
loop_2568:
	movn	%xcc,	%o2,	%l4
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x28] %asi,	%i0
	fmovd	%f18,	%f24
	bcs,a,pt	%icc,	loop_2569
	tpos	%xcc,	0x5
	ta	%xcc,	0x7
	fmovscc	%icc,	%f12,	%f7
loop_2569:
	fbul	%fcc1,	loop_2570
	fcmpeq16	%f12,	%f24,	%i5
	alignaddr	%g4,	%l5,	%g3
	movre	%l0,	0x173,	%o3
loop_2570:
	sub	%i7,	%l1,	%o7
	fnot1s	%f28,	%f17
	edge32	%l3,	%o0,	%g7
	subccc	%o6,	%o5,	%g2
	st	%f25,	[%l7 + 0x50]
	te	%icc,	0x0
	te	%xcc,	0x2
	tle	%icc,	0x5
	fpadd16s	%f12,	%f21,	%f6
	taddcc	%i1,	%i3,	%i6
	movrlz	%o1,	%l2,	%g6
	ta	%xcc,	0x2
	bvs,pt	%icc,	loop_2571
	edge32n	%o4,	%g1,	%i4
	movne	%icc,	%g5,	%l6
	fcmpes	%fcc3,	%f16,	%f29
loop_2571:
	bvc,a,pt	%xcc,	loop_2572
	and	%o2,	%l4,	%i0
	brnz	%i5,	loop_2573
	tl	%xcc,	0x0
loop_2572:
	nop
	set	0x1E, %l2
	ldsha	[%l7 + %l2] 0x04,	%i2
loop_2573:
	sub	%g4,	%g3,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l5,	0x0FB3,	%o3
	lduh	[%l7 + 0x18],	%l1
	edge8n	%o7,	%i7,	%o0
	andncc	%l3,	%g7,	%o5
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%g2,	%o6
	andcc	%i3,	%i1,	%i6
	movcs	%icc,	%l2,	%g6
	fpack16	%f12,	%f4
	addc	%o1,	0x187E,	%o4
	subccc	%g1,	0x1E6E,	%i4
	fpsub16s	%f25,	%f19,	%f26
	fmovrsne	%g5,	%f8,	%f23
	tn	%icc,	0x4
	andn	%l6,	0x1002,	%l4
	xor	%i0,	0x1728,	%i5
	orn	%o2,	0x0F3D,	%g4
	movcs	%icc,	%i2,	%g3
	xorcc	%l5,	0x05A6,	%o3
	wr	%g0,	0x18,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	tvc	%icc,	0x7
	nop
	setx loop_2574, %l0, %l1
	jmpl %l1, %l0
	addcc	%l1,	%o7,	%i7
	movrne	%l3,	0x07E,	%g7
	sdivx	%o5,	0x0878,	%g2
loop_2574:
	edge32n	%o0,	%i3,	%i1
	nop
	set	0x40, %l3
	ldx	[%l7 + %l3],	%i6
	fmovdleu	%xcc,	%f0,	%f28
	andn	%l2,	0x0645,	%o6
	srl	%g6,	0x10,	%o1
	movvs	%xcc,	%g1,	%i4
	orcc	%g5,	%o4,	%l4
	mulx	%l6,	%i0,	%o2
	edge16n	%g4,	%i2,	%i5
	fmovscs	%icc,	%f17,	%f12
	xnor	%l5,	%o3,	%l0
	movgu	%xcc,	%g3,	%o7
	alignaddr	%l1,	%l3,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_2575,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tleu	%icc,	0x2
	fxnor	%f6,	%f8,	%f6
	orcc	%o5,	%g2,	%o0
loop_2575:
	fxors	%f17,	%f25,	%f6
	smulcc	%i7,	%i1,	%i6
	mulx	%l2,	%o6,	%i3
	bg,a,pt	%icc,	loop_2576
	edge8n	%o1,	%g6,	%g1
	or	%i4,	0x1DF9,	%o4
	udiv	%l4,	0x12BE,	%g5
loop_2576:
	edge32	%i0,	%l6,	%o2
	fmovdpos	%xcc,	%f24,	%f9
	fmovdgu	%icc,	%f27,	%f27
	udivcc	%i2,	0x0848,	%g4
	ldsw	[%l7 + 0x7C],	%l5
	tcc	%icc,	0x0
	movge	%icc,	%o3,	%l0
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovdcs	%icc,	%f21,	%f3
	subcc	%i5,	0x11A4,	%o7
	fbul	%fcc3,	loop_2577
	brgz	%g3,	loop_2578
	fbue,a	%fcc1,	loop_2579
	bshuffle	%f30,	%f26,	%f4
loop_2577:
	fandnot1s	%f30,	%f9,	%f23
loop_2578:
	tge	%icc,	0x3
loop_2579:
	fmovsge	%icc,	%f12,	%f7
	mova	%xcc,	%l3,	%g7
	fmovsgu	%icc,	%f6,	%f1
	fbug,a	%fcc3,	loop_2580
	edge16ln	%o5,	%l1,	%o0
	sethi	0x02BF,	%i7
	tcs	%icc,	0x0
loop_2580:
	fornot1	%f10,	%f4,	%f30
	movle	%xcc,	%g2,	%i6
	movg	%xcc,	%i1,	%o6
	array32	%l2,	%o1,	%i3
	bvs	%xcc,	loop_2581
	brz,a	%g6,	loop_2582
	ldsh	[%l7 + 0x18],	%g1
	andcc	%o4,	%i4,	%l4
loop_2581:
	movrlz	%i0,	%g5,	%o2
loop_2582:
	fmovrde	%l6,	%f2,	%f12
	array16	%i2,	%l5,	%g4
	fmovrdgez	%o3,	%f22,	%f20
	array32	%l0,	%o7,	%i5
	nop
	set	0x70, %i1
	std	%g2,	[%l7 + %i1]
	sdivx	%g7,	0x0F7D,	%l3
	addcc	%l1,	%o0,	%i7
	sdiv	%o5,	0x0E38,	%g2
	be,pn	%xcc,	loop_2583
	xor	%i1,	%o6,	%l2
	sub	%i6,	%o1,	%i3
	fors	%f14,	%f14,	%f25
loop_2583:
	swap	[%l7 + 0x30],	%g6
	orn	%g1,	%i4,	%o4
	nop
	set	0x6E, %i3
	ldsb	[%l7 + %i3],	%l4
	move	%icc,	%g5,	%o2
	umulcc	%l6,	0x0F61,	%i2
	movg	%icc,	%l5,	%g4
	ldd	[%l7 + 0x28],	%f26
	movne	%xcc,	%o3,	%l0
	fbue,a	%fcc3,	loop_2584
	tgu	%xcc,	0x6
	edge32	%o7,	%i0,	%i5
	tge	%xcc,	0x5
loop_2584:
	fsrc1	%f20,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x0
	fabsd	%f4,	%f4
	fones	%f19
	or	%g7,	0x09DB,	%l3
	movrgez	%g3,	%l1,	%o0
	movge	%xcc,	%i7,	%g2
	prefetch	[%l7 + 0x30],	 0x1
	fzero	%f22
	fbug,a	%fcc2,	loop_2585
	fcmpne32	%f22,	%f18,	%o5
	st	%f16,	[%l7 + 0x14]
	fmovdcs	%icc,	%f7,	%f5
loop_2585:
	addccc	%i1,	%l2,	%o6
	ldub	[%l7 + 0x6C],	%i6
	nop
	set	0x28, %g4
	std	%o0,	[%l7 + %g4]
	ldx	[%l7 + 0x60],	%g6
	andn	%i3,	%g1,	%i4
	movge	%xcc,	%l4,	%g5
	std	%f6,	[%l7 + 0x28]
	fmovsn	%xcc,	%f25,	%f0
	tvs	%xcc,	0x1
	array16	%o2,	%l6,	%i2
	taddcc	%l5,	%g4,	%o3
	tvs	%icc,	0x4
	alignaddr	%l0,	%o4,	%i0
	or	%o7,	%i5,	%g7
	tvs	%icc,	0x3
	swap	[%l7 + 0x7C],	%g3
	srl	%l3,	%o0,	%i7
	add	%g2,	%l1,	%o5
	umulcc	%i1,	0x0876,	%o6
	set	0x2C, %o7
	stwa	%i6,	[%l7 + %o7] 0x22
	membar	#Sync
	srax	%l2,	%g6,	%i3
	fble	%fcc0,	loop_2586
	fpadd16s	%f9,	%f27,	%f27
	movgu	%icc,	%g1,	%i4
	mulx	%l4,	%g5,	%o2
loop_2586:
	xnor	%l6,	%o1,	%l5
	tgu	%icc,	0x1
	tcs	%xcc,	0x2
	edge8n	%i2,	%g4,	%o3
	fabss	%f31,	%f14
	move	%icc,	%l0,	%i0
	movneg	%xcc,	%o7,	%i5
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x73] %asi,	%o4
	tle	%icc,	0x7
	smul	%g7,	%g3,	%o0
	fbul,a	%fcc0,	loop_2587
	fbug,a	%fcc1,	loop_2588
	sdivx	%i7,	0x1AA9,	%l3
	movrgz	%g2,	%l1,	%i1
loop_2587:
	sethi	0x11D9,	%o6
loop_2588:
	sllx	%i6,	0x12,	%l2
	mulx	%g6,	0x02DF,	%i3
	tvc	%xcc,	0x0
	taddcc	%o5,	%g1,	%l4
	edge16l	%g5,	%o2,	%l6
	tl	%icc,	0x3
	stw	%o1,	[%l7 + 0x10]
	orn	%l5,	0x037D,	%i4
	umulcc	%g4,	%i2,	%o3
	subc	%i0,	0x1547,	%o7
	movl	%xcc,	%i5,	%l0
	fmovda	%icc,	%f15,	%f31
	fba,a	%fcc1,	loop_2589
	fcmpeq16	%f4,	%f26,	%o4
	add	%g7,	%o0,	%g3
	mulscc	%l3,	0x1EBE,	%i7
loop_2589:
	movleu	%icc,	%g2,	%l1
	fbo	%fcc1,	loop_2590
	nop
	setx loop_2591, %l0, %l1
	jmpl %l1, %o6
	smulcc	%i1,	%i6,	%l2
	movrgz	%g6,	%o5,	%i3
loop_2590:
	and	%l4,	0x08F0,	%g1
loop_2591:
	udivcc	%o2,	0x0934,	%g5
	srax	%o1,	0x1F,	%l6
	fmovspos	%xcc,	%f0,	%f17
	movne	%icc,	%l5,	%i4
	siam	0x4
	movn	%xcc,	%g4,	%i2
	ldsw	[%l7 + 0x74],	%i0
	ta	%icc,	0x2
	te	%icc,	0x6
	siam	0x3
	tvc	%xcc,	0x4
	pdist	%f30,	%f26,	%f24
	fmovrdne	%o7,	%f6,	%f4
	wr	%g0,	0x23,	%asi
	stda	%o2,	[%l7 + 0x68] %asi
	membar	#Sync
	ldsh	[%l7 + 0x56],	%l0
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
	flush	%l7 + 0x48
	tn	%xcc,	0x5
	udivcc	%o4,	0x013D,	%g7
	ld	[%l7 + 0x3C],	%f28
	ldsh	[%l7 + 0x10],	%o0
	bleu,a,pn	%icc,	loop_2592
	fmovs	%f24,	%f23
	udivx	%g3,	0x1590,	%l3
	movgu	%icc,	%g2,	%l1
loop_2592:
	subcc	%i7,	%i1,	%o6
	srlx	%l2,	%g6,	%o5
	stbar
	movrne	%i6,	%i3,	%g1
	bvs,pn	%icc,	loop_2593
	mulx	%o2,	%l4,	%g5
	sllx	%o1,	%l6,	%i4
	fmovsg	%xcc,	%f3,	%f26
loop_2593:
	nop
	set	0x58, %g3
	stda	%l4,	[%l7 + %g3] 0x81
	brz	%g4,	loop_2594
	tvc	%xcc,	0x2
	edge16ln	%i2,	%o7,	%i0
	fmovdle	%xcc,	%f19,	%f0
loop_2594:
	popc	%l0,	%o3
	ldsw	[%l7 + 0x48],	%o4
	addc	%i5,	0x09B6,	%o0
	andcc	%g3,	%l3,	%g2
	tg	%icc,	0x1
	nop
	set	0x16, %o5
	ldstub	[%l7 + %o5],	%l1
	be	%icc,	loop_2595
	st	%f2,	[%l7 + 0x64]
	movne	%icc,	%g7,	%i7
	fcmpne16	%f18,	%f20,	%i1
loop_2595:
	movrne	%o6,	%l2,	%o5
	edge32n	%g6,	%i3,	%i6
	edge8l	%o2,	%g1,	%l4
	mulx	%o1,	%l6,	%i4
	sub	%g5,	0x1937,	%l5
	smul	%g4,	0x0420,	%o7
	movvs	%icc,	%i2,	%i0
	wr	%g0,	0x81,	%asi
	sta	%f15,	[%l7 + 0x78] %asi
	edge16l	%o3,	%l0,	%o4
	fmovrsne	%i5,	%f21,	%f31
	bvs,pt	%icc,	loop_2596
	taddcctv	%g3,	%l3,	%o0
	ld	[%l7 + 0x24],	%f11
	mova	%icc,	%l1,	%g2
loop_2596:
	fmovdneg	%icc,	%f6,	%f21
	bl,a	loop_2597
	tneg	%xcc,	0x6
	orn	%i7,	0x0F43,	%i1
	fpadd32s	%f15,	%f31,	%f19
loop_2597:
	ldx	[%l7 + 0x08],	%o6
	fmovdcc	%icc,	%f28,	%f8
	sethi	0x152F,	%l2
	fble	%fcc0,	loop_2598
	movvc	%xcc,	%g7,	%o5
	fone	%f18
	fmovd	%f28,	%f26
loop_2598:
	or	%i3,	%g6,	%o2
	fnot2s	%f25,	%f4
	edge8l	%i6,	%g1,	%o1
	fmovrsne	%l4,	%f31,	%f19
	popc	0x0C45,	%i4
	tleu	%xcc,	0x7
	subccc	%g5,	0x0880,	%l6
	movge	%xcc,	%g4,	%o7
	for	%f0,	%f6,	%f20
	fmovrdgez	%i2,	%f8,	%f28
	movgu	%xcc,	%l5,	%o3
	movcc	%icc,	%i0,	%l0
	bneg,a,pt	%icc,	loop_2599
	andncc	%i5,	%g3,	%o4
	fandnot2	%f26,	%f8,	%f30
	fbe,a	%fcc1,	loop_2600
loop_2599:
	movcs	%xcc,	%l3,	%o0
	movpos	%xcc,	%g2,	%i7
	edge8l	%i1,	%l1,	%l2
loop_2600:
	andcc	%g7,	%o5,	%o6
	edge32	%g6,	%i3,	%i6
	movcs	%icc,	%o2,	%o1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x30] %asi,	%f22
	srl	%l4,	0x1F,	%g1
	or	%i4,	%g5,	%g4
	siam	0x1
	subccc	%l6,	0x0E05,	%i2
	mova	%icc,	%l5,	%o7
	fpadd32s	%f19,	%f21,	%f30
	movrgez	%i0,	%o3,	%l0
	fmovsa	%xcc,	%f13,	%f2
	fsrc1s	%f16,	%f18
	fcmpeq32	%f10,	%f2,	%g3
	fmovdvs	%icc,	%f18,	%f19
	bn,a,pt	%icc,	loop_2601
	mova	%xcc,	%i5,	%l3
	subccc	%o4,	0x12E9,	%g2
	movcs	%xcc,	%o0,	%i1
loop_2601:
	sth	%l1,	[%l7 + 0x66]
	movcc	%xcc,	%l2,	%g7
	edge16n	%o5,	%o6,	%g6
	fpack32	%f16,	%f2,	%f6
	ld	[%l7 + 0x0C],	%f4
	ldsb	[%l7 + 0x6D],	%i7
	tle	%xcc,	0x5
	sub	%i3,	%i6,	%o2
	set	0x5E, %g2
	stba	%o1,	[%l7 + %g2] 0xe2
	membar	#Sync
	andn	%l4,	%i4,	%g1
	tvc	%xcc,	0x5
	add	%l7,	0x68,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%g4,	%g5
	movvc	%xcc,	%i2,	%l6
	fbug,a	%fcc2,	loop_2602
	edge8n	%l5,	%i0,	%o7
	fpsub16s	%f0,	%f0,	%f0
	sdiv	%l0,	0x1BFE,	%o3
loop_2602:
	sdivx	%g3,	0x0B26,	%i5
	popc	%o4,	%g2
	movneg	%xcc,	%l3,	%i1
	fmuld8ulx16	%f6,	%f10,	%f22
	array32	%l1,	%l2,	%g7
	xnorcc	%o5,	%o6,	%g6
	srlx	%o0,	0x19,	%i7
	array32	%i6,	%i3,	%o1
	edge32l	%o2,	%i4,	%g1
	stb	%l4,	[%l7 + 0x2B]
	tvs	%xcc,	0x7
	and	%g4,	%g5,	%i2
	fbul,a	%fcc3,	loop_2603
	tle	%xcc,	0x3
	fnegd	%f14,	%f20
	bne,a	%xcc,	loop_2604
loop_2603:
	subccc	%l5,	%i0,	%o7
	faligndata	%f12,	%f4,	%f12
	tcc	%xcc,	0x4
loop_2604:
	or	%l0,	0x1ACD,	%o3
	tge	%xcc,	0x1
	fbg,a	%fcc3,	loop_2605
	mova	%icc,	%l6,	%g3
	popc	0x056D,	%i5
	movrgez	%o4,	0x3B0,	%g2
loop_2605:
	sth	%l3,	[%l7 + 0x22]
	wr	%g0,	0xe2,	%asi
	stwa	%l1,	[%l7 + 0x38] %asi
	membar	#Sync
	or	%l2,	0x0D64,	%g7
	umul	%i1,	0x0E93,	%o5
	bl,a	loop_2606
	fcmple16	%f10,	%f26,	%o6
	bneg,a,pt	%xcc,	loop_2607
	tcs	%xcc,	0x0
loop_2606:
	call	loop_2608
	fbne,a	%fcc1,	loop_2609
loop_2607:
	taddcc	%g6,	0x0D53,	%i7
	sll	%o0,	%i6,	%o1
loop_2608:
	nop
	setx	loop_2610,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2609:
	ble,a,pn	%xcc,	loop_2611
	movge	%xcc,	%i3,	%o2
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%i4,	%l4
loop_2610:
	fxnors	%f2,	%f2,	%f20
loop_2611:
	taddcc	%g4,	0x0A0A,	%g5
	srax	%i2,	%l5,	%g1
	tpos	%xcc,	0x0
	movrne	%i0,	%l0,	%o3
	subc	%l6,	0x0E4F,	%g3
	edge16ln	%i5,	%o4,	%o7
	addccc	%l3,	0x086C,	%g2
	movrlz	%l2,	0x113,	%l1
	movrlz	%g7,	%i1,	%o6
	fmovrde	%g6,	%f6,	%f14
	fmovdvs	%icc,	%f14,	%f16
	fors	%f25,	%f30,	%f29
	movrne	%o5,	%o0,	%i6
	fand	%f16,	%f18,	%f22
	edge32	%i7,	%o1,	%o2
	fsrc1	%f2,	%f8
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x14] %asi,	%i4
	fbuge,a	%fcc2,	loop_2612
	movpos	%xcc,	%l4,	%g4
	tn	%icc,	0x3
	sethi	0x1CB9,	%i3
loop_2612:
	bvs,pn	%xcc,	loop_2613
	fblg,a	%fcc2,	loop_2614
	swap	[%l7 + 0x1C],	%g5
	sllx	%i2,	0x18,	%l5
loop_2613:
	alignaddr	%i0,	%g1,	%o3
loop_2614:
	tneg	%icc,	0x1
	sll	%l6,	0x00,	%g3
	membar	#Sync
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x17,	%f16
	lduw	[%l7 + 0x34],	%i5
	udiv	%o4,	0x14D8,	%l0
	tne	%icc,	0x4
	tcs	%xcc,	0x7
	sllx	%o7,	0x1F,	%l3
	subc	%g2,	%l1,	%l2
	xnor	%i1,	0x0805,	%o6
	bneg	%xcc,	loop_2615
	ldd	[%l7 + 0x38],	%f8
	taddcctv	%g7,	%o5,	%o0
	stx	%i6,	[%l7 + 0x58]
loop_2615:
	andcc	%i7,	%o1,	%g6
	fbug	%fcc3,	loop_2616
	bg,a,pn	%xcc,	loop_2617
	subc	%i4,	0x073E,	%l4
	movrlz	%g4,	%o2,	%g5
loop_2616:
	edge32	%i2,	%l5,	%i3
loop_2617:
	sllx	%g1,	%i0,	%l6
	sllx	%g3,	0x07,	%i5
	fmovscs	%xcc,	%f24,	%f25
	ldx	[%l7 + 0x30],	%o4
	sllx	%l0,	%o3,	%l3
	fmuld8ulx16	%f30,	%f19,	%f2
	fmovscc	%xcc,	%f23,	%f19
	umul	%o7,	%l1,	%l2
	fmovsl	%icc,	%f2,	%f26
	fxnor	%f0,	%f14,	%f24
	srlx	%g2,	0x1D,	%o6
	fmovsge	%xcc,	%f12,	%f4
	andncc	%i1,	%g7,	%o5
	call	loop_2618
	sethi	0x0D22,	%o0
	fpack16	%f4,	%f31
	tle	%icc,	0x6
loop_2618:
	movg	%xcc,	%i6,	%o1
	fmovde	%xcc,	%f6,	%f16
	edge8n	%i7,	%i4,	%g6
	subc	%g4,	%o2,	%g5
	fmovsneg	%xcc,	%f3,	%f24
	array32	%l4,	%i2,	%l5
	fors	%f21,	%f31,	%f1
	alignaddrl	%i3,	%g1,	%i0
	ldsw	[%l7 + 0x38],	%l6
	xor	%i5,	%g3,	%o4
	movle	%icc,	%l0,	%o3
	std	%f10,	[%l7 + 0x08]
	movne	%icc,	%l3,	%o7
	brlez	%l2,	loop_2619
	movrgz	%l1,	0x0DA,	%g2
	edge16ln	%i1,	%g7,	%o6
	fnor	%f14,	%f2,	%f6
loop_2619:
	sth	%o0,	[%l7 + 0x32]
	edge16l	%i6,	%o5,	%o1
	fmovdl	%icc,	%f30,	%f7
	fba,a	%fcc1,	loop_2620
	popc	%i4,	%g6
	fmovdcs	%xcc,	%f18,	%f26
	tge	%xcc,	0x1
loop_2620:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge,a	%fcc3,	loop_2621
	movvc	%xcc,	%g4,	%i7
	fmovsge	%xcc,	%f7,	%f28
	array32	%g5,	%o2,	%i2
loop_2621:
	siam	0x1
	ble,a,pn	%xcc,	loop_2622
	sir	0x1496
	fpadd32s	%f8,	%f0,	%f28
	sdivcc	%l4,	0x0499,	%i3
loop_2622:
	brgz	%l5,	loop_2623
	fnegs	%f16,	%f17
	taddcctv	%i0,	%l6,	%g1
	fmovsvs	%icc,	%f15,	%f31
loop_2623:
	movpos	%xcc,	%g3,	%o4
	taddcc	%l0,	0x1787,	%o3
	smul	%l3,	0x0DDB,	%i5
	tleu	%xcc,	0x5
	tn	%xcc,	0x5
	movg	%xcc,	%l2,	%l1
	nop
	setx	loop_2624,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umul	%o7,	0x1B4E,	%i1
	subccc	%g2,	0x020E,	%o6
	fbl	%fcc2,	loop_2625
loop_2624:
	bcc,a,pt	%icc,	loop_2626
	tge	%xcc,	0x1
	tvs	%xcc,	0x4
loop_2625:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2626:
	tle	%xcc,	0x1
	fpadd32	%f0,	%f16,	%f6
	tpos	%icc,	0x6
	ldsh	[%l7 + 0x16],	%g7
	subc	%i6,	0x0CFC,	%o5
	edge32n	%o1,	%o0,	%g6
	fmovsneg	%icc,	%f4,	%f31
	ldd	[%l7 + 0x18],	%i4
	mova	%icc,	%i7,	%g5
	st	%f7,	[%l7 + 0x20]
	tl	%icc,	0x4
	edge32l	%g4,	%o2,	%l4
	subc	%i3,	0x140A,	%l5
	andn	%i2,	0x05F1,	%i0
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%l6,	%g3
	sub	%g1,	0x08AE,	%l0
	move	%icc,	%o3,	%o4
	udivcc	%i5,	0x1943,	%l2
	te	%icc,	0x6
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%l3
	mova	%xcc,	%l1,	%o7
	set	0x6C, %i0
	lduba	[%l7 + %i0] 0x14,	%g2
	xor	%i1,	%o6,	%g7
	fmovsl	%icc,	%f21,	%f13
	ldsw	[%l7 + 0x54],	%o5
	mulscc	%o1,	0x00A5,	%o0
	st	%f5,	[%l7 + 0x44]
	ta	%icc,	0x6
	taddcc	%i6,	%i4,	%i7
	fpadd16	%f2,	%f28,	%f20
	tge	%xcc,	0x1
	edge32n	%g5,	%g4,	%o2
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x78] %asi,	%g6
	fblg	%fcc3,	loop_2627
	fbu	%fcc1,	loop_2628
	mova	%xcc,	%l4,	%i3
	ldd	[%l7 + 0x58],	%f20
loop_2627:
	edge32l	%l5,	%i2,	%i0
loop_2628:
	nop
	set	0x64, %l4
	stwa	%l6,	[%l7 + %l4] 0x80
	tcs	%xcc,	0x7
	array8	%g1,	%g3,	%o3
	ldsb	[%l7 + 0x5F],	%l0
	bne,pt	%icc,	loop_2629
	tge	%icc,	0x5
	stbar
	membar	0x71
loop_2629:
	srl	%o4,	%l2,	%l3
	wr	%g0,	0x19,	%asi
	stha	%i5,	[%l7 + 0x6A] %asi
	andn	%o7,	0x1E1C,	%g2
	srax	%l1,	0x1F,	%o6
	fexpand	%f0,	%f16
	movpos	%icc,	%g7,	%i1
	movre	%o5,	%o0,	%o1
	subccc	%i6,	%i4,	%i7
	siam	0x3
	alignaddr	%g4,	%g5,	%o2
	mulscc	%g6,	0x12E7,	%l4
	std	%f26,	[%l7 + 0x08]
	or	%i3,	%l5,	%i2
	fmovsvs	%icc,	%f2,	%f22
	sll	%l6,	0x03,	%i0
	stx	%g1,	[%l7 + 0x48]
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x0c,	%o2
	tgu	%icc,	0x7
	xnor	%g3,	%o4,	%l0
	taddcc	%l2,	%i5,	%l3
	bshuffle	%f22,	%f0,	%f30
	fmovdcs	%xcc,	%f28,	%f13
	smulcc	%g2,	%l1,	%o6
	smulcc	%g7,	%o7,	%o5
	taddcc	%o0,	%o1,	%i6
	sub	%i1,	%i4,	%i7
	fornot2	%f6,	%f18,	%f0
	udivcc	%g4,	0x08A6,	%o2
	sdiv	%g5,	0x076E,	%g6
	umulcc	%i3,	0x1443,	%l5
	prefetch	[%l7 + 0x0C],	 0x3
	add	%l4,	0x0075,	%i2
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x20] %asi,	%i0
	sll	%g1,	0x1A,	%l6
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
	edge32ln	%o3,	%o4,	%l2
	tcs	%xcc,	0x4
	fcmpgt32	%f30,	%f28,	%l0
	fcmpne16	%f22,	%f22,	%i5
	membar	0x22
	smul	%g2,	0x1FB6,	%l3
	bl	%xcc,	loop_2630
	edge32l	%l1,	%g7,	%o6
	andncc	%o5,	%o7,	%o1
	movvc	%xcc,	%o0,	%i1
loop_2630:
	umul	%i4,	0x19E1,	%i7
	fexpand	%f19,	%f2
	movn	%icc,	%g4,	%o2
	fcmpgt32	%f18,	%f14,	%i6
	sdivx	%g6,	0x034D,	%g5
	movle	%xcc,	%i3,	%l4
	movl	%icc,	%i2,	%i0
	wr	%g0,	0xe2,	%asi
	stha	%g1,	[%l7 + 0x3C] %asi
	membar	#Sync
	orn	%l6,	0x0E36,	%g3
	edge8l	%o3,	%o4,	%l2
	addc	%l0,	0x1DB0,	%i5
	mulx	%l5,	0x00BD,	%g2
	fba	%fcc1,	loop_2631
	movrgz	%l3,	0x3AD,	%g7
	bn	%icc,	loop_2632
	bgu,pt	%icc,	loop_2633
loop_2631:
	membar	0x2B
	siam	0x1
loop_2632:
	fmovrdlez	%l1,	%f18,	%f28
loop_2633:
	edge8	%o6,	%o5,	%o7
	ldx	[%l7 + 0x38],	%o1
	fcmped	%fcc3,	%f12,	%f22
	array16	%o0,	%i1,	%i7
	tl	%icc,	0x1
	umul	%g4,	0x0343,	%i4
	movl	%xcc,	%o2,	%g6
	or	%g5,	0x1DB1,	%i3
	stw	%i6,	[%l7 + 0x34]
	orncc	%l4,	%i0,	%i2
	movleu	%icc,	%g1,	%l6
	fmul8x16al	%f10,	%f14,	%f8
	add	%o3,	0x0BE4,	%g3
	udivcc	%o4,	0x1964,	%l2
	andncc	%l0,	%i5,	%l5
	addc	%l3,	0x0AF2,	%g7
	fmul8x16	%f21,	%f12,	%f4
	fcmple16	%f26,	%f14,	%l1
	wr	%g0,	0x04,	%asi
	sta	%f10,	[%l7 + 0x34] %asi
	udivcc	%o6,	0x1AA2,	%o5
	tleu	%icc,	0x5
	xor	%g2,	%o7,	%o0
	fsrc2s	%f24,	%f30
	tl	%xcc,	0x4
	subcc	%o1,	%i7,	%i1
	smulcc	%g4,	%o2,	%g6
	fcmpne32	%f16,	%f22,	%g5
	edge16l	%i3,	%i4,	%i6
	fbo	%fcc2,	loop_2634
	fsrc2s	%f19,	%f0
	movgu	%xcc,	%l4,	%i0
	tvs	%icc,	0x2
loop_2634:
	bcs	loop_2635
	movcs	%xcc,	%g1,	%i2
	siam	0x7
	tgu	%icc,	0x7
loop_2635:
	sdiv	%l6,	0x1482,	%g3
	fands	%f29,	%f2,	%f27
	edge8	%o3,	%o4,	%l2
	srlx	%i5,	%l5,	%l0
	fmovda	%xcc,	%f0,	%f27
	taddcctv	%l3,	0x051E,	%l1
	fbue,a	%fcc0,	loop_2636
	tsubcc	%g7,	0x136C,	%o5
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2636:
	addc	%o6,	%o7,	%o0
	alignaddr	%g2,	%o1,	%i7
	andcc	%g4,	0x1E01,	%o2
	popc	%i1,	%g5
	movcc	%icc,	%i3,	%i4
	movle	%icc,	%i6,	%g6
	movrlz	%i0,	0x0B4,	%l4
	edge32ln	%g1,	%l6,	%i2
	tsubcctv	%o3,	%g3,	%o4
	fmovrse	%i5,	%f4,	%f15
	tneg	%xcc,	0x4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l5,	%l2
	alignaddrl	%l0,	%l3,	%g7
	subccc	%l1,	0x00C1,	%o5
	movn	%icc,	%o7,	%o0
	fbg,a	%fcc1,	loop_2637
	tcs	%icc,	0x5
	orncc	%g2,	%o1,	%o6
	movleu	%xcc,	%i7,	%o2
loop_2637:
	nop
	setx	loop_2638,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcs,a,pn	%xcc,	loop_2639
	addc	%i1,	%g4,	%i3
	sdiv	%i4,	0x1F32,	%i6
loop_2638:
	taddcc	%g5,	0x02BB,	%g6
loop_2639:
	taddcc	%l4,	0x1E8B,	%g1
	mulscc	%l6,	0x050A,	%i0
	std	%f28,	[%l7 + 0x70]
	sub	%o3,	0x17C0,	%i2
	fornot2	%f10,	%f28,	%f18
	movneg	%icc,	%g3,	%o4
	tsubcc	%l5,	0x0E58,	%l2
	ble,a,pn	%icc,	loop_2640
	sllx	%l0,	%l3,	%g7
	orcc	%l1,	0x1C45,	%o5
	fmovd	%f10,	%f12
loop_2640:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc3,	loop_2641
	addccc	%i5,	0x19E8,	%o7
	udivcc	%o0,	0x0857,	%o1
	fornot2s	%f1,	%f8,	%f18
loop_2641:
	bpos,a	%xcc,	loop_2642
	fmovdcc	%icc,	%f2,	%f23
	bne,a,pn	%icc,	loop_2643
	and	%o6,	%i7,	%o2
loop_2642:
	movne	%xcc,	%g2,	%i1
	taddcctv	%i3,	0x0FB4,	%i4
loop_2643:
	bpos	loop_2644
	fnand	%f6,	%f28,	%f24
	set	0x110, %l5
	ldxa	[%g0 + %l5] 0x21,	%g4
loop_2644:
	fmul8ulx16	%f20,	%f30,	%f28
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i6,	%g6
	bvs,a,pn	%icc,	loop_2645
	tn	%icc,	0x1
	edge16l	%l4,	%g1,	%l6
	fmovrslz	%g5,	%f29,	%f10
loop_2645:
	fmovdle	%xcc,	%f21,	%f13
	nop
	set	0x46, %g1
	lduh	[%l7 + %g1],	%i0
	edge16ln	%o3,	%i2,	%g3
	ta	%xcc,	0x5
	sdivcc	%o4,	0x0EED,	%l2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l5,	%l3
	srlx	%l0,	0x1B,	%l1
	set	0x60, %i2
	ldxa	[%l7 + %i2] 0x0c,	%g7
	movre	%i5,	%o5,	%o7
	andncc	%o1,	%o0,	%o6
	tleu	%xcc,	0x6
	swap	[%l7 + 0x14],	%o2
	ldstub	[%l7 + 0x2C],	%g2
	fmovdcc	%xcc,	%f22,	%f17
	flush	%l7 + 0x14
	subcc	%i1,	%i7,	%i3
	or	%g4,	0x1924,	%i4
	fmovsneg	%icc,	%f24,	%f1
	sir	0x01BC
	mova	%xcc,	%i6,	%l4
	fmovrsne	%g1,	%f27,	%f26
	fpmerge	%f20,	%f23,	%f4
	call	loop_2646
	movre	%g6,	0x047,	%g5
	nop
	set	0x16, %l6
	lduh	[%l7 + %l6],	%i0
	fmovsneg	%xcc,	%f6,	%f31
loop_2646:
	fandnot1	%f14,	%f24,	%f28
	move	%icc,	%o3,	%i2
	set	0x6E, %i4
	ldsha	[%l7 + %i4] 0x81,	%l6
	mova	%xcc,	%o4,	%g3
	srl	%l5,	0x02,	%l2
	lduh	[%l7 + 0x0C],	%l3
	tcs	%icc,	0x0
	edge32l	%l0,	%g7,	%l1
	smul	%i5,	%o5,	%o1
	addc	%o7,	%o6,	%o0
	tvc	%icc,	0x3
	fsrc1s	%f26,	%f17
	fzeros	%f12
	movg	%xcc,	%o2,	%g2
	nop
	set	0x3C, %o6
	sth	%i1,	[%l7 + %o6]
	bne,a,pt	%xcc,	loop_2647
	fpsub16	%f14,	%f14,	%f30
	tleu	%icc,	0x3
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x2
loop_2647:
	sdivx	%i3,	0x15D1,	%g4
	fpadd16	%f16,	%f18,	%f24
	smulcc	%i6,	0x1BC0,	%i4
	array16	%g1,	%l4,	%g5
	fbuge	%fcc0,	loop_2648
	bne,a,pn	%icc,	loop_2649
	fpackfix	%f16,	%f22
	sdivx	%i0,	0x03D3,	%o3
loop_2648:
	nop
	setx	loop_2650,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2649:
	membar	0x66
	movcc	%xcc,	%i2,	%l6
	movgu	%icc,	%o4,	%g6
loop_2650:
	fmovdge	%icc,	%f23,	%f26
	sth	%g3,	[%l7 + 0x4A]
	stw	%l5,	[%l7 + 0x68]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l3,	%l0,	%g7
	tg	%xcc,	0x6
	subcc	%l1,	%l2,	%o5
	fand	%f18,	%f4,	%f24
	nop
	set	0x78, %o3
	ldsw	[%l7 + %o3],	%i5
	set	0x21, %l1
	ldsba	[%l7 + %l1] 0x18,	%o7
	movrne	%o1,	0x1FA,	%o0
	fbo,a	%fcc3,	loop_2651
	array16	%o2,	%g2,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez	%i1,	loop_2652
loop_2651:
	fnegs	%f28,	%f28
	fmovscc	%icc,	%f28,	%f8
	fnot1s	%f1,	%f23
loop_2652:
	edge32n	%i7,	%g4,	%i3
	fmovda	%xcc,	%f6,	%f5
	alignaddrl	%i6,	%g1,	%i4
	fcmpeq32	%f6,	%f14,	%g5
	movle	%icc,	%i0,	%l4
	bcc,pt	%icc,	loop_2653
	tn	%xcc,	0x1
	movvc	%xcc,	%i2,	%l6
	movle	%icc,	%o3,	%o4
loop_2653:
	tsubcctv	%g6,	0x1E2E,	%l5
	brlez	%l3,	loop_2654
	and	%g3,	0x11A8,	%l0
	tne	%icc,	0x4
	movrgez	%g7,	0x1AF,	%l2
loop_2654:
	edge16n	%o5,	%i5,	%l1
	fornot2	%f14,	%f10,	%f14
	ba,pn	%icc,	loop_2655
	ldub	[%l7 + 0x19],	%o1
	fmovdvs	%icc,	%f21,	%f23
	movre	%o0,	%o7,	%o2
loop_2655:
	movcs	%xcc,	%o6,	%g2
	add	%i7,	%g4,	%i1
	subccc	%i6,	%i3,	%g1
	sdivcc	%g5,	0x1789,	%i0
	fxnor	%f30,	%f20,	%f28
	fmovrde	%i4,	%f14,	%f12
	movrlez	%l4,	%i2,	%o3
	ldd	[%l7 + 0x50],	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x3C],	%l6
	movvs	%xcc,	%l5,	%l3
	addccc	%g6,	0x0B3F,	%g3
	tleu	%icc,	0x3
	sll	%g7,	0x02,	%l2
	move	%icc,	%l0,	%i5
	tle	%icc,	0x4
	fmul8ulx16	%f2,	%f18,	%f18
	tcs	%icc,	0x4
	taddcc	%o5,	%l1,	%o1
	movre	%o0,	0x10C,	%o7
	movg	%xcc,	%o6,	%o2
	sub	%i7,	0x0372,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g4,	%i6
	taddcc	%i1,	%g1,	%i3
	movn	%xcc,	%g5,	%i0
	movn	%icc,	%i4,	%l4
	andcc	%o3,	0x082B,	%o4
	movne	%icc,	%i2,	%l5
	bcc,a	loop_2656
	bcc,a,pn	%xcc,	loop_2657
	movge	%icc,	%l3,	%l6
	movne	%icc,	%g6,	%g3
loop_2656:
	fbl	%fcc3,	loop_2658
loop_2657:
	tcs	%xcc,	0x1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x68] %asi,	%f9
loop_2658:
	fcmped	%fcc2,	%f24,	%f30
	fmovscc	%icc,	%f27,	%f19
	set	0x15, %o0
	stba	%g7,	[%l7 + %o0] 0xeb
	membar	#Sync
	bcc	%xcc,	loop_2659
	tg	%icc,	0x3
	fmovdleu	%icc,	%f5,	%f9
	stx	%l0,	[%l7 + 0x68]
loop_2659:
	xorcc	%l2,	0x03F9,	%i5
	sethi	0x1B4D,	%l1
	for	%f0,	%f2,	%f0
	array8	%o1,	%o0,	%o5
	call	loop_2660
	udivx	%o6,	0x063F,	%o2
	tsubcc	%i7,	0x07D6,	%g2
	movrgez	%o7,	%i6,	%i1
loop_2660:
	tvs	%xcc,	0x0
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x60] %asi,	%g1
	addccc	%i3,	0x1CE7,	%g5
	fpack32	%f4,	%f28,	%f4
	bvc,pn	%icc,	loop_2661
	udivx	%i0,	0x023A,	%i4
	ta	%icc,	0x6
	stb	%g4,	[%l7 + 0x29]
loop_2661:
	nop
	set	0x68, %i5
	std	%f16,	[%l7 + %i5]
	fxnor	%f8,	%f6,	%f24
	edge32n	%l4,	%o4,	%o3
	movvc	%icc,	%i2,	%l3
	sir	0x01C7
	movrlz	%l6,	0x140,	%g6
	fmovde	%icc,	%f7,	%f12
	movpos	%icc,	%g3,	%l5
	alignaddr	%l0,	%l2,	%g7
	brnz	%l1,	loop_2662
	fcmpgt32	%f10,	%f24,	%i5
	sub	%o0,	%o1,	%o5
	movgu	%xcc,	%o2,	%o6
loop_2662:
	mova	%icc,	%g2,	%i7
	fmovrdne	%o7,	%f28,	%f16
	xor	%i1,	%i6,	%g1
	fors	%f8,	%f30,	%f4
	call	loop_2663
	fpack16	%f12,	%f21
	xnor	%i3,	%g5,	%i0
	fmovrdlez	%g4,	%f22,	%f8
loop_2663:
	lduw	[%l7 + 0x20],	%i4
	fbuge	%fcc0,	loop_2664
	sir	0x1246
	ldx	[%l7 + 0x68],	%o4
	bshuffle	%f12,	%f26,	%f6
loop_2664:
	fpadd32s	%f8,	%f6,	%f14
	add	%l4,	0x0CCD,	%i2
	fbul	%fcc0,	loop_2665
	fmovsvc	%icc,	%f23,	%f25
	or	%l3,	0x00F2,	%o3
	edge16l	%g6,	%l6,	%g3
loop_2665:
	edge32n	%l0,	%l5,	%l2
	movne	%xcc,	%l1,	%i5
	fblg,a	%fcc0,	loop_2666
	movneg	%xcc,	%o0,	%o1
	orn	%g7,	0x18A4,	%o2
	fnegs	%f0,	%f27
loop_2666:
	sdiv	%o5,	0x0B89,	%o6
	movrgez	%g2,	0x217,	%o7
	fnands	%f27,	%f4,	%f22
	edge8l	%i1,	%i7,	%g1
	edge8	%i6,	%i3,	%g5
	bn,pn	%icc,	loop_2667
	membar	0x52
	movrlez	%i0,	0x0DC,	%i4
	siam	0x7
loop_2667:
	edge8l	%g4,	%l4,	%o4
	addc	%l3,	0x07EB,	%o3
	orncc	%i2,	0x0939,	%g6
	srax	%g3,	0x0C,	%l0
	brz	%l5,	loop_2668
	movgu	%icc,	%l2,	%l6
	fbl	%fcc1,	loop_2669
	popc	0x1603,	%l1
loop_2668:
	nop
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x75] %asi,	%o0
loop_2669:
	fmovdcs	%xcc,	%f15,	%f8
	brgez,a	%i5,	loop_2670
	addc	%g7,	0x1868,	%o1
	addccc	%o5,	%o6,	%g2
	udivcc	%o2,	0x1EB1,	%o7
loop_2670:
	fmovrslez	%i7,	%f18,	%f2
	ldd	[%l7 + 0x48],	%f16
	udivcc	%i1,	0x0D5F,	%i6
	set	0x0, %i7
	stxa	%g1,	[%g0 + %i7] 0x20
	edge16	%i3,	%i0,	%g5
	brgz	%i4,	loop_2671
	edge8	%g4,	%o4,	%l3
	orncc	%o3,	0x165D,	%l4
	ldsh	[%l7 + 0x4C],	%g6
loop_2671:
	fmul8ulx16	%f0,	%f0,	%f6
	movvc	%xcc,	%g3,	%i2
	edge16	%l0,	%l5,	%l6
	andn	%l2,	%o0,	%l1
	fnegd	%f20,	%f20
	nop
	setx	loop_2672,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%i5,	0x0178,	%o1
	movvs	%xcc,	%g7,	%o5
	set	0x30, %o4
	prefetcha	[%l7 + %o4] 0x81,	 0x3
loop_2672:
	fxors	%f21,	%f22,	%f31
	fnot2	%f26,	%f14
	movrgez	%o2,	%o6,	%o7
	fmovrse	%i1,	%f13,	%f7
	movge	%xcc,	%i7,	%g1
	sdivcc	%i3,	0x1ADC,	%i6
	tn	%icc,	0x7
	movpos	%xcc,	%g5,	%i0
	brlez	%g4,	loop_2673
	movne	%xcc,	%i4,	%o4
	tg	%xcc,	0x1
	fmovrdgez	%o3,	%f28,	%f14
loop_2673:
	array8	%l3,	%g6,	%l4
	movneg	%icc,	%i2,	%l0
	fba,a	%fcc2,	loop_2674
	edge32	%g3,	%l5,	%l6
	set	0x18, %o2
	lda	[%l7 + %o2] 0x88,	%f6
loop_2674:
	movrgez	%l2,	%l1,	%o0
	movre	%i5,	%o1,	%g7
	andcc	%g2,	%o2,	%o6
	fones	%f5
	edge8l	%o5,	%i1,	%i7
	fbge	%fcc1,	loop_2675
	fmovsvs	%icc,	%f15,	%f25
	fxnor	%f20,	%f28,	%f8
	movneg	%icc,	%o7,	%g1
loop_2675:
	or	%i6,	%g5,	%i0
	lduw	[%l7 + 0x60],	%g4
	fcmpgt32	%f10,	%f22,	%i3
	brgez,a	%o4,	loop_2676
	fsrc2	%f26,	%f24
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x1f
	membar	#Sync
loop_2676:
	tg	%icc,	0x7
	tleu	%icc,	0x5
	add	%l7,	0x70,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%l3
	fxnors	%f25,	%f26,	%f16
	or	%g6,	0x1A02,	%l4
	edge32ln	%i4,	%l0,	%i2
	fpadd16	%f14,	%f8,	%f0
	taddcctv	%g3,	0x0A67,	%l5
	fbue	%fcc3,	loop_2677
	fmovsleu	%icc,	%f14,	%f5
	tge	%icc,	0x2
	edge32	%l6,	%l1,	%o0
loop_2677:
	udivx	%i5,	0x039D,	%o1
	bpos	loop_2678
	movle	%icc,	%g7,	%l2
	fcmple16	%f26,	%f6,	%o2
	mulx	%o6,	0x06E4,	%o5
loop_2678:
	array16	%i1,	%g2,	%o7
	sir	0x0FFD
	ta	%xcc,	0x1
	fcmps	%fcc1,	%f23,	%f22
	sdivx	%g1,	0x002A,	%i6
	ldsh	[%l7 + 0x32],	%g5
	set	0x7C, %o1
	lduha	[%l7 + %o1] 0x15,	%i7
	movrgz	%i0,	%i3,	%o4
	fmovsvc	%xcc,	%f16,	%f0
	brz	%o3,	loop_2679
	sir	0x1397
	set	0x48, %g5
	swapa	[%l7 + %g5] 0x0c,	%g4
loop_2679:
	nop
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	edge8ln	%l3,	%g6,	%i4
	array32	%l0,	%l4,	%g3
	stbar
	wr	%g0,	0x2a,	%asi
	stba	%i2,	[%l7 + 0x5A] %asi
	membar	#Sync
	fors	%f20,	%f6,	%f19
	edge32l	%l5,	%l6,	%o0
	fmovde	%icc,	%f16,	%f21
	set	0x7C, %l2
	ldsha	[%l7 + %l2] 0x14,	%l1
	be	loop_2680
	fmovdneg	%xcc,	%f25,	%f23
	edge32	%o1,	%g7,	%i5
	edge16ln	%l2,	%o2,	%o6
loop_2680:
	std	%i0,	[%l7 + 0x20]
	ldd	[%l7 + 0x58],	%f22
	movg	%xcc,	%g2,	%o5
	nop
	setx loop_2681, %l0, %l1
	jmpl %l1, %o7
	fbge	%fcc2,	loop_2682
	fmovrdgz	%i6,	%f2,	%f12
	edge8l	%g1,	%i7,	%g5
loop_2681:
	movle	%icc,	%i3,	%o4
loop_2682:
	edge16	%o3,	%g4,	%i0
	fcmpne32	%f22,	%f6,	%l3
	edge8n	%g6,	%i4,	%l0
	fcmpeq16	%f28,	%f16,	%g3
	sdiv	%i2,	0x0B8D,	%l5
	srl	%l4,	%l6,	%l1
	movvs	%xcc,	%o0,	%o1
	fnors	%f23,	%f18,	%f4
	fpack16	%f20,	%f2
	fmovrdgz	%i5,	%f22,	%f30
	fmovda	%xcc,	%f16,	%f11
	fxnors	%f8,	%f7,	%f26
	tle	%icc,	0x0
	fbg,a	%fcc0,	loop_2683
	fmovse	%icc,	%f3,	%f5
	xnor	%l2,	0x09B5,	%o2
	tl	%icc,	0x3
loop_2683:
	array8	%o6,	%g7,	%i1
	fmovrdgz	%g2,	%f0,	%f8
	bcs,a	%xcc,	loop_2684
	fbuge	%fcc1,	loop_2685
	sra	%o5,	0x18,	%i6
	fmovdg	%xcc,	%f23,	%f26
loop_2684:
	movrlez	%o7,	0x27A,	%g1
loop_2685:
	brz,a	%i7,	loop_2686
	movleu	%icc,	%g5,	%i3
	nop
	setx	loop_2687,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bne,a	%icc,	loop_2688
loop_2686:
	bleu,pt	%icc,	loop_2689
	movvs	%icc,	%o4,	%g4
loop_2687:
	ldsh	[%l7 + 0x1A],	%o3
loop_2688:
	ldsb	[%l7 + 0x18],	%i0
loop_2689:
	fmuld8sux16	%f4,	%f25,	%f16
	addccc	%g6,	0x1167,	%i4
	lduh	[%l7 + 0x08],	%l0
	stw	%g3,	[%l7 + 0x44]
	smul	%l3,	%l5,	%i2
	fmovsleu	%xcc,	%f27,	%f0
	fpsub16s	%f17,	%f21,	%f7
	udivcc	%l6,	0x0900,	%l4
	tvc	%xcc,	0x4
	set	0x10, %i1
	ldda	[%l7 + %i1] 0x88,	%l0
	fpadd32s	%f20,	%f11,	%f30
	bvc,a	%xcc,	loop_2690
	fand	%f28,	%f16,	%f16
	fexpand	%f25,	%f8
	std	%o0,	[%l7 + 0x68]
loop_2690:
	udivcc	%i5,	0x0056,	%o0
	sethi	0x017A,	%o2
	fornot1	%f28,	%f22,	%f14
	nop
	setx	loop_2691,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	te	%xcc,	0x6
	sll	%l2,	0x10,	%g7
	movpos	%icc,	%o6,	%g2
loop_2691:
	std	%f4,	[%l7 + 0x70]
	fmovdne	%icc,	%f31,	%f1
	brgz,a	%o5,	loop_2692
	fmuld8ulx16	%f21,	%f27,	%f6
	sra	%i6,	%o7,	%i1
	movvs	%icc,	%i7,	%g5
loop_2692:
	movre	%g1,	%o4,	%g4
	tsubcc	%o3,	0x16B2,	%i0
	tvs	%icc,	0x3
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	subc	%i3,	0x141D,	%i4
	fcmps	%fcc0,	%f13,	%f6
	mova	%icc,	%l0,	%g3
	tneg	%icc,	0x4
	fbue	%fcc2,	loop_2693
	fmul8sux16	%f2,	%f4,	%f14
	lduw	[%l7 + 0x70],	%l3
	bne,a	loop_2694
loop_2693:
	taddcctv	%g6,	0x121B,	%l5
	movleu	%xcc,	%i2,	%l4
	ldx	[%l7 + 0x08],	%l1
loop_2694:
	fands	%f20,	%f31,	%f30
	tge	%icc,	0x0
	set	0x5C, %i3
	ldsba	[%l7 + %i3] 0x10,	%o1
	fmovsl	%icc,	%f14,	%f28
	fsrc2s	%f16,	%f25
	bl,pt	%xcc,	loop_2695
	andncc	%i5,	%l6,	%o2
	flush	%l7 + 0x70
	movrlz	%l2,	0x115,	%o0
loop_2695:
	fandnot1s	%f6,	%f14,	%f23
	edge32ln	%g7,	%o6,	%o5
	fpack32	%f12,	%f14,	%f10
	movcs	%icc,	%g2,	%o7
	bvs,pn	%icc,	loop_2696
	movl	%icc,	%i1,	%i6
	bleu	%xcc,	loop_2697
	bn	loop_2698
loop_2696:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%i7,	%g1
loop_2697:
	nop
	wr	%g0,	0x22,	%asi
	stxa	%o4,	[%l7 + 0x30] %asi
	membar	#Sync
loop_2698:
	udivx	%g5,	0x0C42,	%o3
	fnot2s	%f13,	%f17
	set	0x0, %l3
	stxa	%g4,	[%g0 + %l3] 0x5f
	tleu	%icc,	0x3
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x2C] %asi,	%i3
	fpack32	%f20,	%f8,	%f12
	movpos	%xcc,	%i4,	%i0
	movvs	%icc,	%g3,	%l3
	nop
	set	0x58, %o7
	prefetch	[%l7 + %o7],	 0x3
	fbule,a	%fcc1,	loop_2699
	tcc	%icc,	0x0
	fcmpeq32	%f30,	%f0,	%l0
	bg,pt	%icc,	loop_2700
loop_2699:
	fmovda	%xcc,	%f19,	%f0
	edge16	%l5,	%g6,	%i2
	movl	%xcc,	%l1,	%o1
loop_2700:
	fmovrdlez	%l4,	%f0,	%f6
	fmovrsgez	%l6,	%f6,	%f6
	add	%o2,	%i5,	%o0
	tneg	%xcc,	0x4
	movrgz	%g7,	0x1C4,	%l2
	bpos	loop_2701
	ldd	[%l7 + 0x60],	%f20
	tn	%xcc,	0x6
	umulcc	%o5,	0x0478,	%o6
loop_2701:
	movcc	%icc,	%o7,	%i1
	fpadd16	%f24,	%f2,	%f4
	fnors	%f31,	%f10,	%f1
	fmovrse	%i6,	%f9,	%f8
	set	0x09, %g3
	ldsba	[%l7 + %g3] 0x81,	%g2
	set	0x1C, %o5
	lda	[%l7 + %o5] 0x0c,	%f20
	fands	%f20,	%f2,	%f17
	flush	%l7 + 0x70
	movpos	%icc,	%g1,	%i7
	fcmpd	%fcc0,	%f10,	%f24
	move	%xcc,	%g5,	%o4
	sub	%o3,	0x0E30,	%g4
	movleu	%icc,	%i3,	%i4
	movg	%icc,	%i0,	%g3
	srl	%l0,	%l3,	%g6
	fexpand	%f30,	%f8
	or	%i2,	0x0023,	%l5
	movpos	%xcc,	%l1,	%o1
	edge32ln	%l6,	%o2,	%i5
	edge8l	%l4,	%g7,	%l2
	bl	%xcc,	loop_2702
	fmovdcc	%icc,	%f13,	%f18
	tl	%xcc,	0x6
	fornot1s	%f23,	%f24,	%f20
loop_2702:
	nop
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x1e,	%f16
	tsubcctv	%o0,	0x187A,	%o6
	movrlz	%o5,	%i1,	%o7
	tneg	%xcc,	0x3
	movrlez	%i6,	%g1,	%g2
	taddcctv	%g5,	0x0B38,	%o4
	orncc	%o3,	%g4,	%i7
	udivcc	%i4,	0x1186,	%i3
	fsrc1	%f8,	%f26
	movrgz	%g3,	0x0C6,	%l0
	nop
	setx	loop_2703,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%i0,	%l3,	%i2
	tcc	%icc,	0x7
	edge8ln	%g6,	%l1,	%o1
loop_2703:
	sir	0x1329
	movl	%icc,	%l6,	%l5
	fbule	%fcc2,	loop_2704
	umul	%i5,	%l4,	%g7
	movrlz	%o2,	%o0,	%o6
	tvs	%icc,	0x5
loop_2704:
	pdist	%f24,	%f6,	%f14
	tl	%icc,	0x6
	umul	%l2,	0x1681,	%o5
	movle	%xcc,	%o7,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i1,	%g1,	%g5
	addcc	%g2,	0x1DAC,	%o3
	sethi	0x0B81,	%g4
	ld	[%l7 + 0x28],	%f24
	edge16n	%i7,	%o4,	%i3
	fpack32	%f8,	%f16,	%f6
	array32	%i4,	%g3,	%l0
	tneg	%xcc,	0x0
	edge32ln	%i0,	%l3,	%g6
	umulcc	%l1,	%i2,	%l6
	andcc	%o1,	0x0AA8,	%i5
	fmul8ulx16	%f8,	%f22,	%f12
	sub	%l4,	%g7,	%l5
	set	0x48, %g6
	ldxa	[%l7 + %g6] 0x14,	%o2
	tsubcctv	%o6,	%o0,	%o5
	fmovde	%icc,	%f11,	%f12
	fmovrdgz	%l2,	%f0,	%f16
	movl	%xcc,	%o7,	%i1
	fzeros	%f31
	alignaddr	%i6,	%g1,	%g2
	ldsb	[%l7 + 0x3C],	%g5
	ldsb	[%l7 + 0x46],	%g4
	movne	%icc,	%o3,	%o4
	movge	%xcc,	%i3,	%i7
	movleu	%xcc,	%i4,	%l0
	fors	%f13,	%f23,	%f0
	nop
	setx loop_2705, %l0, %l1
	jmpl %l1, %i0
	xorcc	%g3,	0x111D,	%l3
	fexpand	%f19,	%f0
	fmovsl	%xcc,	%f7,	%f5
loop_2705:
	tcc	%xcc,	0x3
	tsubcctv	%l1,	0x1031,	%g6
	smul	%l6,	%i2,	%o1
	fble	%fcc3,	loop_2706
	array32	%i5,	%g7,	%l4
	ldub	[%l7 + 0x6A],	%l5
	fmovdne	%xcc,	%f22,	%f25
loop_2706:
	movge	%xcc,	%o6,	%o0
	fandnot2s	%f8,	%f2,	%f4
	fnot2	%f28,	%f10
	srlx	%o2,	0x19,	%l2
	fnands	%f17,	%f3,	%f11
	fpsub32s	%f12,	%f19,	%f22
	smul	%o5,	%i1,	%i6
	bl,pt	%xcc,	loop_2707
	tleu	%icc,	0x7
	andncc	%g1,	%g2,	%o7
	edge16	%g5,	%o3,	%g4
loop_2707:
	fcmpd	%fcc0,	%f28,	%f26
	fcmple16	%f18,	%f26,	%o4
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x81
	smul	%i7,	%i4,	%l0
	stw	%i3,	[%l7 + 0x40]
	movn	%xcc,	%g3,	%l3
	fmovrslz	%l1,	%f30,	%f18
	sdiv	%i0,	0x0D8F,	%l6
	sll	%g6,	%i2,	%o1
	fmovsge	%icc,	%f15,	%f12
	brz	%g7,	loop_2708
	array8	%i5,	%l5,	%o6
	tle	%xcc,	0x1
	fcmps	%fcc1,	%f15,	%f31
loop_2708:
	tsubcc	%l4,	%o0,	%l2
	movrlz	%o2,	%o5,	%i1
	subc	%i6,	0x161E,	%g2
	tvc	%xcc,	0x6
	wr	%g0,	0x22,	%asi
	stwa	%g1,	[%l7 + 0x7C] %asi
	membar	#Sync
	bgu,a,pt	%xcc,	loop_2709
	fmovsg	%xcc,	%f25,	%f12
	fpadd32	%f10,	%f26,	%f22
	udiv	%g5,	0x0F9A,	%o7
loop_2709:
	movn	%icc,	%o3,	%o4
	movg	%icc,	%i7,	%g4
	movcs	%icc,	%i4,	%i3
	udiv	%g3,	0x15F2,	%l3
	andncc	%l1,	%i0,	%l6
	smulcc	%l0,	0x1275,	%g6
	tsubcctv	%o1,	%i2,	%g7
	edge32ln	%i5,	%l5,	%o6
	xor	%l4,	%o0,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc3,	loop_2710
	edge8n	%o5,	%i1,	%o2
	fzero	%f6
	array16	%i6,	%g2,	%g5
loop_2710:
	nop
	add	%l7,	0x08,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g1,	%o7
	movne	%xcc,	%o3,	%i7
	subccc	%g4,	0x178E,	%o4
	movle	%xcc,	%i3,	%g3
	fpack16	%f22,	%f10
	fmovse	%xcc,	%f31,	%f7
	udiv	%i4,	0x1924,	%l1
	fexpand	%f18,	%f4
	edge16ln	%i0,	%l3,	%l0
	bneg,a,pn	%xcc,	loop_2711
	tneg	%icc,	0x2
	be	loop_2712
	tge	%icc,	0x2
loop_2711:
	tn	%xcc,	0x2
	andcc	%l6,	0x06DD,	%o1
loop_2712:
	addcc	%g6,	0x0952,	%g7
	sll	%i2,	0x1F,	%i5
	tcs	%xcc,	0x6
	sdivx	%l5,	0x06E3,	%l4
	bl	%icc,	loop_2713
	fcmple32	%f24,	%f20,	%o0
	sdiv	%o6,	0x073C,	%l2
	fmovdpos	%icc,	%f4,	%f3
loop_2713:
	edge8ln	%i1,	%o5,	%o2
	edge32	%i6,	%g5,	%g2
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x1C] %asi,	%o7
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%i7
	set	0x64, %g4
	ldsha	[%l7 + %g4] 0x11,	%g1
	tge	%xcc,	0x5
	tcc	%icc,	0x7
	movrlez	%g4,	%o4,	%g3
	std	%f24,	[%l7 + 0x58]
	subcc	%i4,	0x169D,	%l1
	fmovrde	%i0,	%f8,	%f22
	brgez	%l3,	loop_2714
	subcc	%l0,	0x02C1,	%l6
	tn	%icc,	0x4
	edge8ln	%i3,	%o1,	%g7
loop_2714:
	tsubcctv	%i2,	%i5,	%g6
	add	%l5,	0x180B,	%l4
	fmovrslez	%o0,	%f24,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge,a	%fcc0,	loop_2715
	fbl,a	%fcc1,	loop_2716
	movgu	%xcc,	%l2,	%i1
	fpadd16	%f30,	%f14,	%f18
loop_2715:
	movne	%icc,	%o6,	%o5
loop_2716:
	tleu	%icc,	0x0
	fpsub32s	%f20,	%f7,	%f5
	tpos	%xcc,	0x1
	fnands	%f8,	%f4,	%f1
	tle	%icc,	0x2
	brz	%i6,	loop_2717
	fmovdn	%xcc,	%f24,	%f21
	srl	%o2,	%g2,	%o7
	fbul	%fcc1,	loop_2718
loop_2717:
	ta	%xcc,	0x1
	sll	%o3,	0x12,	%g5
	fcmpes	%fcc1,	%f14,	%f8
loop_2718:
	fcmpgt16	%f6,	%f22,	%i7
	sdiv	%g4,	0x1859,	%o4
	bg,pt	%xcc,	loop_2719
	movrlz	%g1,	%g3,	%i4
	fmovsgu	%icc,	%f3,	%f8
	tn	%icc,	0x2
loop_2719:
	umulcc	%i0,	0x1426,	%l1
	movvc	%icc,	%l0,	%l6
	subc	%l3,	0x12F2,	%o1
	subc	%g7,	%i3,	%i2
	movrgz	%i5,	0x34E,	%g6
	edge32ln	%l4,	%o0,	%l5
	movl	%xcc,	%i1,	%o6
	sdivcc	%l2,	0x13FE,	%i6
	smul	%o5,	%o2,	%g2
	fmovsg	%icc,	%f5,	%f11
	sllx	%o7,	%g5,	%o3
	bcs,a,pn	%icc,	loop_2720
	orcc	%g4,	0x011A,	%o4
	movrgez	%i7,	%g1,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2720:
	movge	%xcc,	%g3,	%l1
	ldub	[%l7 + 0x66],	%l0
	and	%i0,	%l3,	%o1
	fxors	%f0,	%f29,	%f17
	movre	%l6,	0x01B,	%g7
	fsrc2	%f14,	%f2
	smul	%i3,	%i2,	%g6
	xorcc	%i5,	%l4,	%o0
	addccc	%i1,	%o6,	%l2
	movle	%icc,	%l5,	%o5
	set	0x0C, %i0
	lduwa	[%l7 + %i0] 0x89,	%o2
	edge8n	%i6,	%g2,	%o7
	alignaddr	%g5,	%o3,	%o4
	fmul8sux16	%f30,	%f12,	%f30
	smul	%g4,	0x1F28,	%g1
	alignaddr	%i7,	%g3,	%l1
	addc	%i4,	0x0959,	%l0
	fbe	%fcc2,	loop_2721
	ta	%xcc,	0x1
	tle	%icc,	0x3
	fmovs	%f30,	%f16
loop_2721:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f30,	%f2,	%f30
	movn	%xcc,	%l3,	%o1
	fxor	%f18,	%f10,	%f12
	bgu,a,pt	%icc,	loop_2722
	fnors	%f14,	%f29,	%f27
	fors	%f14,	%f6,	%f25
	movrlez	%l6,	%g7,	%i3
loop_2722:
	and	%i2,	0x03D1,	%g6
	faligndata	%f14,	%f24,	%f10
	edge8	%i5,	%i0,	%o0
	sdiv	%l4,	0x1470,	%i1
	fnegs	%f15,	%f5
	edge8	%l2,	%l5,	%o5
	array32	%o6,	%i6,	%g2
	movn	%xcc,	%o7,	%o2
	fble,a	%fcc2,	loop_2723
	nop
	setx loop_2724, %l0, %l1
	jmpl %l1, %o3
	fbue	%fcc1,	loop_2725
	sra	%o4,	0x0A,	%g4
loop_2723:
	srl	%g5,	%g1,	%i7
loop_2724:
	xnor	%l1,	0x0B0F,	%i4
loop_2725:
	and	%l0,	%l3,	%o1
	fbg,a	%fcc2,	loop_2726
	nop
	set	0x1C, %l4
	sth	%g3,	[%l7 + %l4]
	fbge,a	%fcc2,	loop_2727
	sdivx	%l6,	0x1CE6,	%i3
loop_2726:
	fmovrdgz	%g7,	%f30,	%f18
	movne	%icc,	%g6,	%i5
loop_2727:
	fmovse	%icc,	%f22,	%f7
	alignaddrl	%i2,	%i0,	%l4
	or	%i1,	0x0CC2,	%l2
	array16	%l5,	%o0,	%o6
	fmovdg	%xcc,	%f10,	%f26
	sra	%i6,	0x11,	%g2
	movle	%icc,	%o5,	%o2
	fbug,a	%fcc3,	loop_2728
	andn	%o3,	0x1D43,	%o4
	alignaddr	%o7,	%g4,	%g5
	fbug	%fcc0,	loop_2729
loop_2728:
	fmul8x16al	%f9,	%f18,	%f30
	array16	%i7,	%g1,	%i4
	fnand	%f8,	%f4,	%f20
loop_2729:
	bl,pt	%xcc,	loop_2730
	tleu	%icc,	0x4
	alignaddr	%l1,	%l0,	%l3
	orn	%g3,	%o1,	%l6
loop_2730:
	srlx	%g7,	%g6,	%i5
	membar	0x00
	taddcc	%i2,	%i3,	%l4
	movrgz	%i0,	0x39E,	%l2
	te	%xcc,	0x1
	fornot2	%f22,	%f0,	%f10
	fcmped	%fcc2,	%f16,	%f2
	tne	%xcc,	0x1
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0x17
	membar	#Sync
	wr	%g0,	0x2b,	%asi
	stxa	%l5,	[%l7 + 0x40] %asi
	membar	#Sync
	ldsh	[%l7 + 0x6E],	%o0
	fornot1s	%f23,	%f31,	%f21
	be	loop_2731
	movgu	%xcc,	%o6,	%i1
	subccc	%i6,	%g2,	%o5
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x64] %asi,	%f25
loop_2731:
	lduh	[%l7 + 0x40],	%o3
	fbe,a	%fcc0,	loop_2732
	fnor	%f6,	%f28,	%f6
	mova	%xcc,	%o4,	%o7
	fcmpeq32	%f30,	%f20,	%g4
loop_2732:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x78] %asi,	%g5
	fornot1	%f20,	%f8,	%f6
	fcmpgt16	%f24,	%f20,	%i7
	xorcc	%o2,	0x09BD,	%i4
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%g1,	%l0
	brlez	%l3,	loop_2733
	stbar
	fbge,a	%fcc0,	loop_2734
	and	%l1,	%o1,	%l6
loop_2733:
	sra	%g3,	0x0E,	%g6
	tvc	%xcc,	0x7
loop_2734:
	fandnot2	%f28,	%f0,	%f0
	st	%f25,	[%l7 + 0x3C]
	andcc	%g7,	%i2,	%i3
	taddcc	%l4,	0x134D,	%i0
	stx	%i5,	[%l7 + 0x08]
	fnot2s	%f2,	%f29
	ta	%icc,	0x7
	andncc	%l5,	%o0,	%o6
	tne	%icc,	0x7
	ld	[%l7 + 0x48],	%f4
	be,pt	%icc,	loop_2735
	fmovsa	%icc,	%f10,	%f8
	fmovdcs	%xcc,	%f2,	%f26
	addc	%l2,	0x0D3C,	%i6
loop_2735:
	edge8	%i1,	%o5,	%g2
	siam	0x0
	sub	%o4,	%o7,	%g4
	subcc	%o3,	0x010D,	%i7
	tcc	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g5
	brlez,a	%o2,	loop_2736
	tneg	%icc,	0x1
	fbg,a	%fcc2,	loop_2737
	fmovdge	%xcc,	%f13,	%f27
loop_2736:
	move	%xcc,	%g1,	%l0
	sdivcc	%l3,	0x04BE,	%l1
loop_2737:
	edge32n	%o1,	%i4,	%l6
	movn	%icc,	%g3,	%g6
	movleu	%xcc,	%g7,	%i2
	tgu	%xcc,	0x7
	fcmpne16	%f18,	%f10,	%i3
	array32	%l4,	%i5,	%i0
	tne	%icc,	0x7
	sub	%l5,	0x178B,	%o0
	swap	[%l7 + 0x5C],	%l2
	brgez	%o6,	loop_2738
	fmovdcc	%icc,	%f3,	%f26
	subc	%i1,	%o5,	%i6
	movcc	%xcc,	%g2,	%o4
loop_2738:
	swap	[%l7 + 0x08],	%o7
	movgu	%xcc,	%g4,	%i7
	fornot1s	%f3,	%f25,	%f5
	move	%icc,	%g5,	%o3
	edge16n	%g1,	%o2,	%l0
	fcmpne16	%f16,	%f2,	%l3
	fpadd32s	%f24,	%f8,	%f10
	movleu	%icc,	%l1,	%i4
	orncc	%l6,	%g3,	%g6
	alignaddr	%g7,	%o1,	%i3
	umulcc	%l4,	0x026A,	%i2
	fmovdg	%xcc,	%f31,	%f24
	array16	%i5,	%l5,	%o0
	bneg,a	loop_2739
	movre	%l2,	%o6,	%i0
	movg	%icc,	%i1,	%o5
	fmovdneg	%xcc,	%f20,	%f19
loop_2739:
	tneg	%xcc,	0x2
	subccc	%g2,	0x05F5,	%o4
	sir	0x1FE6
	tsubcctv	%o7,	0x0D8F,	%g4
	prefetch	[%l7 + 0x14],	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i7,	0x0653,	%i6
	srl	%o3,	%g1,	%g5
	brlez,a	%o2,	loop_2740
	movpos	%xcc,	%l3,	%l0
	fandnot1s	%f21,	%f15,	%f14
	move	%xcc,	%i4,	%l6
loop_2740:
	nop
	set	0x50, %g1
	stwa	%g3,	[%l7 + %g1] 0x04
	mova	%icc,	%g6,	%g7
	nop
	set	0x24, %l5
	stb	%o1,	[%l7 + %l5]
	movrlz	%l1,	%i3,	%l4
	fpadd16s	%f18,	%f9,	%f14
	edge16n	%i2,	%l5,	%o0
	movvs	%icc,	%l2,	%o6
	fmovsne	%xcc,	%f14,	%f24
	edge32	%i5,	%i1,	%i0
	fmovrsgez	%g2,	%f21,	%f23
	movrgz	%o4,	%o5,	%g4
	fbn,a	%fcc0,	loop_2741
	tleu	%xcc,	0x5
	fnegd	%f6,	%f20
	udiv	%i7,	0x0574,	%i6
loop_2741:
	tg	%icc,	0x0
	fornot1s	%f19,	%f29,	%f9
	fmovda	%xcc,	%f26,	%f23
	srl	%o3,	0x06,	%g1
	fmovrsne	%g5,	%f26,	%f22
	edge8l	%o7,	%o2,	%l0
	nop
	set	0x50, %i2
	std	%f2,	[%l7 + %i2]
	bvs,a	loop_2742
	movleu	%icc,	%i4,	%l3
	fsrc1s	%f5,	%f15
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x10] %asi,	%g3
loop_2742:
	sra	%l6,	%g7,	%g6
	tsubcc	%l1,	0x135A,	%o1
	fornot2	%f10,	%f0,	%f28
	fmuld8ulx16	%f5,	%f29,	%f30
	edge16ln	%i3,	%l4,	%i2
	movcc	%icc,	%o0,	%l5
	or	%o6,	%l2,	%i5
	edge16ln	%i1,	%g2,	%i0
	fnot1	%f18,	%f12
	tge	%icc,	0x2
	array32	%o4,	%g4,	%i7
	movn	%icc,	%o5,	%i6
	brz	%g1,	loop_2743
	edge8	%o3,	%o7,	%g5
	fnot2	%f22,	%f4
	popc	0x12F9,	%o2
loop_2743:
	addcc	%l0,	0x1256,	%l3
	fpack16	%f6,	%f13
	addcc	%i4,	%l6,	%g7
	fmovrsgez	%g6,	%f27,	%f3
	udivcc	%l1,	0x162F,	%g3
	st	%f11,	[%l7 + 0x64]
	fcmple32	%f2,	%f24,	%i3
	srax	%l4,	%o1,	%o0
	subccc	%i2,	0x03E9,	%o6
	fmovrslez	%l2,	%f30,	%f2
	movvc	%xcc,	%i5,	%i1
	tge	%xcc,	0x3
	fcmpeq16	%f6,	%f12,	%g2
	brnz	%l5,	loop_2744
	fmuld8sux16	%f25,	%f18,	%f20
	fornot1	%f4,	%f8,	%f2
	umul	%o4,	%g4,	%i0
loop_2744:
	tneg	%xcc,	0x3
	movl	%icc,	%o5,	%i6
	fsrc1s	%f9,	%f23
	fmovsle	%xcc,	%f24,	%f11
	stw	%g1,	[%l7 + 0x68]
	popc	0x068F,	%i7
	movvs	%icc,	%o7,	%o3
	fmuld8sux16	%f0,	%f2,	%f8
	fmovdle	%xcc,	%f11,	%f6
	fmovde	%xcc,	%f11,	%f25
	brgez	%g5,	loop_2745
	subc	%o2,	%l3,	%l0
	mova	%xcc,	%i4,	%l6
	tne	%xcc,	0x6
loop_2745:
	ldx	[%l7 + 0x28],	%g6
	fnot2	%f26,	%f10
	andncc	%g7,	%l1,	%i3
	fornot1	%f8,	%f2,	%f10
	sll	%g3,	0x0C,	%l4
	addc	%o0,	0x18E0,	%o1
	movrlz	%o6,	0x053,	%l2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%i1
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x18] %asi,	%i5
	call	loop_2746
	movgu	%xcc,	%l5,	%g2
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x30] %asi,	%g4
loop_2746:
	bvc,a,pn	%icc,	loop_2747
	tcc	%icc,	0x2
	tvc	%xcc,	0x5
	alignaddr	%o4,	%i0,	%i6
loop_2747:
	smul	%o5,	%i7,	%o7
	set	0x1C, %i4
	sta	%f9,	[%l7 + %i4] 0x11
	bge	loop_2748
	edge16n	%o3,	%g5,	%g1
	movleu	%xcc,	%l3,	%o2
	fone	%f8
loop_2748:
	fmovscs	%xcc,	%f26,	%f4
	fmovdl	%icc,	%f12,	%f20
	sdiv	%i4,	0x0C70,	%l0
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x18] %asi,	%g6
	stw	%g7,	[%l7 + 0x50]
	sethi	0x0B77,	%l6
	fcmple32	%f6,	%f8,	%l1
	movne	%xcc,	%g3,	%l4
	ldd	[%l7 + 0x28],	%f20
	stw	%o0,	[%l7 + 0x08]
	fbe	%fcc3,	loop_2749
	sir	0x10D0
	fbo,a	%fcc1,	loop_2750
	fbge,a	%fcc0,	loop_2751
loop_2749:
	subcc	%i3,	%o6,	%o1
	set	0x59, %o6
	lduba	[%l7 + %o6] 0x14,	%l2
loop_2750:
	movge	%xcc,	%i1,	%i5
loop_2751:
	sdiv	%l5,	0x0445,	%g2
	xnorcc	%g4,	%i2,	%o4
	fpsub32s	%f24,	%f0,	%f7
	fbue	%fcc1,	loop_2752
	tsubcctv	%i6,	0x0517,	%i0
	ldx	[%l7 + 0x68],	%i7
	tcs	%xcc,	0x5
loop_2752:
	fcmpne32	%f2,	%f0,	%o5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x89,	%o3,	%o7
	fmovrdgz	%g1,	%f26,	%f8
	stx	%g5,	[%l7 + 0x60]
	fones	%f8
	fble,a	%fcc3,	loop_2753
	fmovsle	%icc,	%f21,	%f12
	fsrc2	%f28,	%f24
	set	0x70, %l6
	stwa	%o2,	[%l7 + %l6] 0x2f
	membar	#Sync
loop_2753:
	subcc	%i4,	0x0E32,	%l0
	sethi	0x1039,	%l3
	movg	%xcc,	%g7,	%g6
	tle	%icc,	0x5
	stx	%l6,	[%l7 + 0x08]
	edge16ln	%l1,	%g3,	%o0
	fbl	%fcc3,	loop_2754
	bvc	loop_2755
	edge32ln	%l4,	%o6,	%o1
	fcmpgt16	%f16,	%f2,	%i3
loop_2754:
	umulcc	%i1,	%l2,	%l5
loop_2755:
	orcc	%g2,	0x1893,	%g4
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i2
	edge16	%i5,	%o4,	%i6
	sethi	0x0964,	%i7
	bg,pn	%xcc,	loop_2756
	fexpand	%f10,	%f6
	bge,pt	%icc,	loop_2757
	movg	%xcc,	%o5,	%i0
loop_2756:
	edge8l	%o3,	%o7,	%g5
	fmovdgu	%icc,	%f17,	%f18
loop_2757:
	sll	%g1,	%o2,	%i4
	ble,pt	%xcc,	loop_2758
	movrne	%l3,	0x369,	%g7
	fmovda	%icc,	%f8,	%f26
	set	0x60, %o3
	ldda	[%l7 + %o3] 0x2f,	%g6
loop_2758:
	tcs	%xcc,	0x4
	popc	%l0,	%l6
	mulx	%g3,	0x13D3,	%l1
	tsubcctv	%o0,	0x009C,	%l4
	fmovdge	%xcc,	%f29,	%f9
	udiv	%o6,	0x17B3,	%i3
	umulcc	%o1,	%i1,	%l2
	tvs	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g2,	0x078B,	%l5
	movleu	%xcc,	%g4,	%i5
	movn	%icc,	%i2,	%i6
	sub	%o4,	%o5,	%i7
	fcmpne16	%f30,	%f28,	%i0
	subcc	%o3,	%o7,	%g5
	edge32	%o2,	%i4,	%l3
	fsrc2	%f30,	%f0
	edge32ln	%g1,	%g7,	%g6
	be,a,pt	%icc,	loop_2759
	subccc	%l0,	0x1F92,	%l6
	add	%l1,	%g3,	%l4
	and	%o0,	%i3,	%o6
loop_2759:
	movrlz	%o1,	0x018,	%l2
	fbuge,a	%fcc0,	loop_2760
	sra	%i1,	%g2,	%l5
	fandnot2s	%f3,	%f25,	%f13
	and	%i5,	%i2,	%i6
loop_2760:
	orn	%o4,	0x168F,	%g4
	sllx	%i7,	0x10,	%i0
	ldsb	[%l7 + 0x36],	%o5
	edge32ln	%o7,	%o3,	%o2
	alignaddrl	%g5,	%i4,	%g1
	fcmple16	%f4,	%f10,	%l3
	fbuge,a	%fcc2,	loop_2761
	tgu	%icc,	0x6
	edge8l	%g7,	%l0,	%g6
	movle	%xcc,	%l1,	%l6
loop_2761:
	stx	%l4,	[%l7 + 0x68]
	srlx	%g3,	%o0,	%o6
	fmovrdgz	%o1,	%f22,	%f14
	tn	%xcc,	0x6
	movre	%i3,	0x12E,	%i1
	bg,a	%icc,	loop_2762
	edge8ln	%l2,	%l5,	%g2
	bleu	%icc,	loop_2763
	fmovsle	%icc,	%f30,	%f30
loop_2762:
	fcmps	%fcc1,	%f31,	%f31
	tvc	%xcc,	0x4
loop_2763:
	nop
	set	0x69, %o0
	ldstuba	[%l7 + %o0] 0x04,	%i5
	smulcc	%i2,	%i6,	%g4
	fmovrsgez	%o4,	%f1,	%f15
	set	0x50, %i5
	stda	%i6,	[%l7 + %i5] 0x11
	fors	%f20,	%f21,	%f4
	fnot2	%f6,	%f12
	edge8ln	%o5,	%i0,	%o7
	fmovsvs	%xcc,	%f3,	%f16
	fnor	%f30,	%f16,	%f2
	tneg	%xcc,	0x1
	array16	%o2,	%g5,	%i4
	fcmple16	%f26,	%f4,	%g1
	movcs	%xcc,	%o3,	%l3
	umulcc	%g7,	0x0D4A,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l0,	%l1,	%l6
	lduw	[%l7 + 0x28],	%l4
	andncc	%o0,	%g3,	%o1
	umulcc	%i3,	0x0700,	%i1
	fmovdn	%xcc,	%f13,	%f9
	xorcc	%l2,	%l5,	%o6
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sdivcc	%i5,	0x0DCD,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a	%xcc,	loop_2764
	ldub	[%l7 + 0x56],	%i6
	movleu	%xcc,	%g4,	%o4
	bneg,a	%icc,	loop_2765
loop_2764:
	movrne	%i7,	0x0CE,	%o5
	set	0x46, %i7
	ldstuba	[%l7 + %i7] 0x81,	%i2
loop_2765:
	or	%i0,	0x1C31,	%o2
	tcc	%xcc,	0x0
	fbug	%fcc2,	loop_2766
	array8	%o7,	%i4,	%g1
	ldx	[%l7 + 0x18],	%g5
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x14
loop_2766:
	fnot2	%f12,	%f18
	movvs	%icc,	%o3,	%l3
	edge32ln	%g6,	%l0,	%g7
	fxor	%f28,	%f2,	%f12
	ble,a	loop_2767
	movn	%xcc,	%l6,	%l1
	addccc	%o0,	0x0178,	%l4
	fxor	%f2,	%f4,	%f20
loop_2767:
	fbue	%fcc0,	loop_2768
	udivcc	%o1,	0x08F5,	%g3
	sdiv	%i3,	0x009D,	%l2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i1,	%l5
loop_2768:
	nop
	set	0x46, %o2
	ldstuba	[%l7 + %o2] 0x19,	%i5
	fbug,a	%fcc3,	loop_2769
	fbne	%fcc2,	loop_2770
	fmovde	%xcc,	%f23,	%f9
	ta	%xcc,	0x3
loop_2769:
	srlx	%o6,	0x07,	%g2
loop_2770:
	movrlez	%i6,	%g4,	%o4
	movvs	%icc,	%o5,	%i7
	sir	0x0CDF
	call	loop_2771
	movpos	%icc,	%i0,	%i2
	tvc	%xcc,	0x2
	and	%o2,	0x1651,	%i4
loop_2771:
	nop
	wr	%g0,	0x19,	%asi
	sta	%f30,	[%l7 + 0x44] %asi
	fpack32	%f24,	%f26,	%f22
	srl	%g1,	%o7,	%o3
	tleu	%xcc,	0x3
	andcc	%g5,	0x1075,	%l3
	bn	loop_2772
	ldsb	[%l7 + 0x20],	%l0
	fones	%f16
	array32	%g6,	%l6,	%g7
loop_2772:
	fnor	%f6,	%f12,	%f16
	std	%f8,	[%l7 + 0x68]
	movne	%icc,	%o0,	%l1
	tge	%xcc,	0x6
	tvc	%icc,	0x2
	movre	%o1,	0x11A,	%l4
	sll	%i3,	%l2,	%i1
	ta	%xcc,	0x7
	edge8ln	%g3,	%l5,	%i5
	tleu	%icc,	0x1
	fblg,a	%fcc1,	loop_2773
	andcc	%g2,	%o6,	%i6
	alignaddrl	%g4,	%o4,	%i7
	tvc	%icc,	0x7
loop_2773:
	ba,a,pn	%xcc,	loop_2774
	bl	%xcc,	loop_2775
	tn	%xcc,	0x7
	sir	0x1A98
loop_2774:
	nop
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2775:
	fmovsneg	%xcc,	%f22,	%f20
	array16	%i0,	%i2,	%o2
	move	%icc,	%i4,	%g1
	siam	0x1
	xorcc	%o5,	%o7,	%g5
	movleu	%icc,	%l3,	%l0
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x0
	bn,a	loop_2776
	prefetch	[%l7 + 0x20],	 0x1
	tl	%icc,	0x5
	movn	%icc,	%l6,	%g6
loop_2776:
	fxors	%f11,	%f13,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x21,	%asi
	stxa	%o0,	[%g0 + 0x110] %asi
	or	%l1,	0x0534,	%o1
	movleu	%xcc,	%l4,	%g7
	fba,a	%fcc2,	loop_2777
	tpos	%icc,	0x5
	array8	%i3,	%l2,	%g3
	sub	%l5,	%i5,	%i1
loop_2777:
	or	%o6,	%i6,	%g4
	edge32ln	%g2,	%o4,	%i7
	fmovscs	%icc,	%f21,	%f13
	ldsh	[%l7 + 0x68],	%i2
	or	%o2,	0x0DEB,	%i0
	ldsh	[%l7 + 0x64],	%g1
	std	%o4,	[%l7 + 0x18]
	andncc	%o7,	%i4,	%g5
	udivcc	%l0,	0x06C1,	%l3
	srax	%l6,	%o3,	%g6
	fmovsvs	%icc,	%f10,	%f0
	fone	%f10
	array8	%o0,	%o1,	%l1
	addccc	%l4,	%i3,	%g7
	nop
	setx loop_2778, %l0, %l1
	jmpl %l1, %g3
	fmovsle	%xcc,	%f30,	%f6
	fmovde	%xcc,	%f12,	%f22
	udivcc	%l5,	0x1E37,	%l2
loop_2778:
	bneg,a	%xcc,	loop_2779
	bvc,a	loop_2780
	fands	%f28,	%f23,	%f19
	mulx	%i1,	0x0295,	%i5
loop_2779:
	tsubcctv	%i6,	%g4,	%o6
loop_2780:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%g2
	fnot2s	%f30,	%f21
	subccc	%i7,	%o4,	%i2
	edge16n	%i0,	%g1,	%o2
	tg	%icc,	0x4
	fbne	%fcc1,	loop_2781
	fmovrde	%o7,	%f10,	%f20
	or	%o5,	%g5,	%i4
	movvc	%xcc,	%l0,	%l3
loop_2781:
	fmovsle	%xcc,	%f29,	%f31
	and	%o3,	0x09BF,	%g6
	fnegs	%f15,	%f2
	fmuld8ulx16	%f11,	%f18,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o0,	%l6
	xor	%l1,	0x1986,	%o1
	movvs	%icc,	%i3,	%g7
	fpadd32	%f24,	%f12,	%f4
	srl	%l4,	0x1E,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l5,	%i1,	%l2
	fornot2s	%f26,	%f0,	%f28
	movrgz	%i6,	%g4,	%i5
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%g2
	fbge	%fcc2,	loop_2782
	tge	%icc,	0x1
	fmovrdlez	%o6,	%f10,	%f26
	fsrc2s	%f22,	%f8
loop_2782:
	fnor	%f20,	%f26,	%f0
	ble,a	%xcc,	loop_2783
	sllx	%o4,	0x06,	%i2
	bg,a	loop_2784
	tgu	%xcc,	0x2
loop_2783:
	fcmpeq32	%f18,	%f16,	%i7
	fblg	%fcc0,	loop_2785
loop_2784:
	array32	%g1,	%o2,	%o7
	sra	%o5,	%g5,	%i4
	orn	%i0,	0x0035,	%l0
loop_2785:
	and	%o3,	0x035B,	%g6
	edge16l	%l3,	%o0,	%l1
	smul	%o1,	0x161F,	%i3
	fbl	%fcc0,	loop_2786
	tne	%icc,	0x5
	udiv	%g7,	0x0758,	%l4
	tn	%icc,	0x7
loop_2786:
	udivx	%l6,	0x0391,	%l5
	xorcc	%i1,	0x1F32,	%g3
	srl	%l2,	0x05,	%i6
	fpsub32	%f22,	%f6,	%f16
	tpos	%xcc,	0x6
	fzero	%f20
	pdist	%f18,	%f10,	%f0
	fpackfix	%f4,	%f5
	fmovsleu	%icc,	%f21,	%f25
	fpsub32	%f22,	%f0,	%f8
	fblg	%fcc2,	loop_2787
	bge	%xcc,	loop_2788
	fmovrdgez	%g4,	%f10,	%f28
	ldd	[%l7 + 0x60],	%f24
loop_2787:
	movgu	%xcc,	%g2,	%o6
loop_2788:
	movvs	%icc,	%o4,	%i5
	sdivcc	%i2,	0x16A7,	%i7
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x04
	add	%o2,	0x185C,	%o7
	xnorcc	%g1,	%g5,	%o5
	fandnot1	%f14,	%f0,	%f14
	orncc	%i4,	0x002A,	%i0
	for	%f10,	%f10,	%f8
	fmovrdgz	%l0,	%f12,	%f8
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o3
	casa	[%l6] 0x88,	%o3,	%l3
	movrgez	%g6,	%o0,	%l1
	fbn	%fcc3,	loop_2789
	srlx	%o1,	0x1E,	%i3
	brnz,a	%l4,	loop_2790
	andncc	%g7,	%l6,	%l5
loop_2789:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%g3,	%l2
loop_2790:
	alignaddr	%i1,	%i6,	%g2
	edge16n	%g4,	%o6,	%o4
	bcs,a	loop_2791
	fpadd32	%f2,	%f26,	%f0
	fbul,a	%fcc1,	loop_2792
	sir	0x05EF
loop_2791:
	tneg	%xcc,	0x3
	sll	%i5,	%i2,	%o2
loop_2792:
	tsubcctv	%o7,	%g1,	%i7
	fbne,a	%fcc0,	loop_2793
	sth	%g5,	[%l7 + 0x08]
	nop
	set	0x30, %l0
	ldx	[%l7 + %l0],	%i4
	bpos,a,pn	%icc,	loop_2794
loop_2793:
	srax	%i0,	%o5,	%l0
	fbue,a	%fcc3,	loop_2795
	bcs,pt	%icc,	loop_2796
loop_2794:
	andcc	%l3,	0x013F,	%o3
	fnegd	%f22,	%f0
loop_2795:
	ldsw	[%l7 + 0x34],	%o0
loop_2796:
	udivx	%l1,	0x007E,	%o1
	fblg	%fcc2,	loop_2797
	movrgez	%i3,	%l4,	%g7
	move	%icc,	%l6,	%g6
	fmovsl	%xcc,	%f19,	%f1
loop_2797:
	fandnot2s	%f26,	%f23,	%f28
	movrlz	%g3,	%l5,	%i1
	edge32ln	%i6,	%g2,	%g4
	nop
	setx loop_2798, %l0, %l1
	jmpl %l1, %o6
	movneg	%xcc,	%o4,	%i5
	fbne	%fcc2,	loop_2799
	std	%i2,	[%l7 + 0x78]
loop_2798:
	fbl,a	%fcc1,	loop_2800
	bne,a,pt	%icc,	loop_2801
loop_2799:
	fmuld8ulx16	%f19,	%f2,	%f8
	movcc	%icc,	%l2,	%o2
loop_2800:
	movn	%xcc,	%o7,	%i7
loop_2801:
	fone	%f22
	nop
	setx	loop_2802,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovdcs	%xcc,	%f3,	%f15
	fmovrse	%g5,	%f14,	%f16
	movrgz	%i4,	%i0,	%o5
loop_2802:
	ba	%xcc,	loop_2803
	tleu	%icc,	0x2
	edge32	%g1,	%l0,	%o3
	edge8n	%o0,	%l1,	%o1
loop_2803:
	tpos	%xcc,	0x2
	fbul,a	%fcc1,	loop_2804
	udivcc	%i3,	0x0783,	%l4
	srlx	%g7,	%l3,	%g6
	taddcctv	%l6,	%l5,	%i1
loop_2804:
	sub	%i6,	%g3,	%g4
	array32	%o6,	%g2,	%o4
	taddcc	%i5,	%l2,	%o2
	movl	%icc,	%i2,	%i7
	edge32ln	%o7,	%i4,	%g5
	edge16	%o5,	%g1,	%i0
	ta	%xcc,	0x6
	bl,a,pn	%icc,	loop_2805
	bpos	loop_2806
	xnor	%l0,	0x16E1,	%o0
	orcc	%l1,	0x0B77,	%o1
loop_2805:
	brnz,a	%i3,	loop_2807
loop_2806:
	ldd	[%l7 + 0x70],	%f8
	bneg	loop_2808
	fmul8sux16	%f0,	%f16,	%f10
loop_2807:
	movge	%xcc,	%l4,	%o3
	movrgez	%l3,	%g6,	%g7
loop_2808:
	fmovdvc	%xcc,	%f27,	%f3
	sdivx	%l6,	0x19AB,	%l5
	subcc	%i1,	%i6,	%g4
	flush	%l7 + 0x28
	array32	%g3,	%o6,	%o4
	fbuge	%fcc3,	loop_2809
	movpos	%icc,	%i5,	%g2
	sub	%o2,	%i2,	%i7
	fmovs	%f18,	%f25
loop_2809:
	taddcc	%l2,	%o7,	%i4
	taddcctv	%g5,	0x0354,	%o5
	xor	%g1,	0x0004,	%l0
	ldsb	[%l7 + 0x31],	%o0
	sethi	0x0835,	%l1
	fmovdcs	%xcc,	%f31,	%f16
	orncc	%i0,	0x0B4A,	%i3
	fmovsvs	%icc,	%f3,	%f0
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x18] %asi,	%l4
	subccc	%o3,	0x0670,	%l3
	movrlz	%o1,	%g7,	%l6
	umulcc	%g6,	0x14D4,	%l5
	set	0x74, %g5
	ldswa	[%l7 + %g5] 0x04,	%i6
	sll	%g4,	%i1,	%g3
	tneg	%xcc,	0x3
	ldd	[%l7 + 0x70],	%f4
	fpackfix	%f12,	%f5
	fmovdpos	%icc,	%f14,	%f8
	xorcc	%o4,	0x1935,	%o6
	subcc	%g2,	%i5,	%i2
	orncc	%i7,	%o2,	%l2
	mulscc	%o7,	0x1AA7,	%g5
	movge	%xcc,	%o5,	%g1
	movrne	%l0,	%o0,	%l1
	movge	%icc,	%i4,	%i0
	andcc	%i3,	0x12C7,	%o3
	tn	%xcc,	0x0
	alignaddrl	%l3,	%o1,	%g7
	fmul8sux16	%f6,	%f12,	%f24
	bne,a	%xcc,	loop_2810
	movvc	%xcc,	%l6,	%g6
	fbuge	%fcc1,	loop_2811
	srl	%l5,	%l4,	%g4
loop_2810:
	edge16n	%i1,	%g3,	%i6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o6,	%g2
loop_2811:
	movcc	%icc,	%i5,	%i2
	movn	%icc,	%o4,	%i7
	fpsub16s	%f13,	%f24,	%f19
	fnand	%f10,	%f10,	%f12
	movre	%l2,	%o7,	%g5
	bn,pt	%xcc,	loop_2812
	bn,a	loop_2813
	edge8ln	%o2,	%o5,	%g1
	fbe	%fcc2,	loop_2814
loop_2812:
	xnor	%o0,	%l0,	%l1
loop_2813:
	tn	%icc,	0x6
	bgu,pn	%xcc,	loop_2815
loop_2814:
	srax	%i4,	0x08,	%i3
	subc	%o3,	%l3,	%o1
	bpos,pn	%icc,	loop_2816
loop_2815:
	smulcc	%i0,	%g7,	%l6
	fba,a	%fcc2,	loop_2817
	membar	0x47
loop_2816:
	movrgez	%g6,	0x31E,	%l4
	st	%f16,	[%l7 + 0x24]
loop_2817:
	fmovdgu	%icc,	%f29,	%f27
	fnands	%f19,	%f9,	%f21
	fandnot2s	%f6,	%f27,	%f11
	array32	%l5,	%g4,	%g3
	tgu	%icc,	0x2
	fble,a	%fcc0,	loop_2818
	edge16n	%i6,	%i1,	%g2
	fbue,a	%fcc2,	loop_2819
	or	%i5,	%i2,	%o6
loop_2818:
	movcc	%xcc,	%o4,	%l2
	movcc	%xcc,	%o7,	%i7
loop_2819:
	udivcc	%g5,	0x0A14,	%o2
	xnorcc	%g1,	%o0,	%l0
	fba	%fcc3,	loop_2820
	std	%l0,	[%l7 + 0x68]
	array8	%i4,	%o5,	%i3
	stx	%o3,	[%l7 + 0x20]
loop_2820:
	nop
	setx	loop_2821,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdne	%icc,	%f5,	%f15
	tge	%icc,	0x5
	addcc	%o1,	0x1CB3,	%l3
loop_2821:
	umulcc	%i0,	%g7,	%g6
	fmovsge	%xcc,	%f5,	%f24
	addccc	%l4,	0x01CE,	%l6
	srlx	%g4,	0x05,	%l5
	ldstub	[%l7 + 0x79],	%g3
	bge	loop_2822
	tgu	%xcc,	0x5
	array32	%i6,	%g2,	%i1
	brz,a	%i2,	loop_2823
loop_2822:
	fmul8ulx16	%f24,	%f6,	%f10
	movrgz	%i5,	%o6,	%l2
	movrgz	%o4,	%i7,	%g5
loop_2823:
	sdivx	%o2,	0x054F,	%g1
	fmovrsne	%o0,	%f6,	%f16
	fmovrdlz	%o7,	%f24,	%f12
	srlx	%l0,	0x13,	%i4
	bvc,a,pt	%xcc,	loop_2824
	sub	%o5,	%i3,	%l1
	srlx	%o3,	%o1,	%l3
	array8	%g7,	%i0,	%g6
loop_2824:
	ldstub	[%l7 + 0x6F],	%l6
	fpsub16	%f10,	%f20,	%f14
	flush	%l7 + 0x54
	fzeros	%f2
	fcmple16	%f12,	%f28,	%g4
	edge16ln	%l4,	%l5,	%g3
	xnorcc	%i6,	%i1,	%i2
	srax	%i5,	0x01,	%g2
	fmuld8sux16	%f14,	%f19,	%f18
	bg,a	%icc,	loop_2825
	sub	%l2,	0x0E80,	%o4
	movn	%xcc,	%o6,	%g5
	fsrc2	%f16,	%f18
loop_2825:
	fpsub16	%f20,	%f8,	%f20
	array32	%i7,	%o2,	%o0
	edge32l	%g1,	%o7,	%l0
	tpos	%icc,	0x3
	fornot2s	%f27,	%f31,	%f17
	ldsh	[%l7 + 0x46],	%i4
	set	0x0C, %l2
	stwa	%i3,	[%l7 + %l2] 0x15
	ldd	[%l7 + 0x70],	%f22
	fmovdcs	%icc,	%f7,	%f18
	tg	%icc,	0x3
	edge8l	%l1,	%o5,	%o3
	set	0x58, %i1
	ldsha	[%l7 + %i1] 0x04,	%o1
	set	0x78, %o1
	stda	%g6,	[%l7 + %o1] 0x0c
	tvc	%xcc,	0x3
	srl	%i0,	0x1C,	%g6
	set	0x44, %i3
	lduba	[%l7 + %i3] 0x04,	%l6
	bshuffle	%f8,	%f10,	%f16
	bl,pn	%icc,	loop_2826
	nop
	setx loop_2827, %l0, %l1
	jmpl %l1, %g4
	fblg	%fcc2,	loop_2828
	sllx	%l3,	0x1D,	%l5
loop_2826:
	fcmple16	%f26,	%f24,	%g3
loop_2827:
	fbul,a	%fcc2,	loop_2829
loop_2828:
	taddcctv	%l4,	%i6,	%i1
	addcc	%i5,	0x1151,	%i2
	movrlz	%l2,	%g2,	%o4
loop_2829:
	bleu,a,pt	%icc,	loop_2830
	fmovdvc	%icc,	%f7,	%f26
	sdivcc	%g5,	0x1862,	%o6
	movrlz	%i7,	0x3DB,	%o2
loop_2830:
	sra	%g1,	%o0,	%o7
	bge,pt	%icc,	loop_2831
	edge8l	%l0,	%i3,	%i4
	tne	%icc,	0x5
	or	%o5,	0x12C5,	%o3
loop_2831:
	taddcctv	%o1,	%g7,	%i0
	and	%l1,	%l6,	%g4
	smul	%l3,	%l5,	%g6
	movge	%icc,	%g3,	%l4
	prefetch	[%l7 + 0x5C],	 0x1
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x09] %asi,	%i6
	subccc	%i1,	0x0B50,	%i2
	brz	%i5,	loop_2832
	srl	%l2,	%g2,	%g5
	udivx	%o6,	0x012C,	%i7
	umul	%o2,	%o4,	%o0
loop_2832:
	fpadd32s	%f5,	%f0,	%f29
	fmovsgu	%xcc,	%f6,	%f25
	movpos	%icc,	%g1,	%l0
	subcc	%o7,	%i3,	%o5
	brz	%o3,	loop_2833
	udivx	%i4,	0x1B51,	%g7
	brnz	%o1,	loop_2834
	fandnot1s	%f12,	%f2,	%f15
loop_2833:
	movre	%l1,	0x341,	%l6
	fblg,a	%fcc2,	loop_2835
loop_2834:
	sethi	0x0E7E,	%g4
	edge8n	%l3,	%l5,	%i0
	fcmpeq16	%f20,	%f28,	%g3
loop_2835:
	move	%xcc,	%l4,	%i6
	edge8l	%g6,	%i1,	%i5
	movg	%icc,	%l2,	%g2
	movl	%icc,	%g5,	%i2
	te	%icc,	0x4
	fmovrdgez	%i7,	%f2,	%f28
	movneg	%xcc,	%o6,	%o2
	tcs	%xcc,	0x6
	set	0x20, %l3
	ldda	[%l7 + %l3] 0x80,	%o0
	bvs,a	loop_2836
	bcs,a,pt	%xcc,	loop_2837
	fmovscs	%icc,	%f8,	%f10
	movle	%icc,	%o4,	%l0
loop_2836:
	taddcc	%o7,	0x0650,	%g1
loop_2837:
	bvs,pt	%xcc,	loop_2838
	sethi	0x16A8,	%i3
	fnors	%f22,	%f13,	%f18
	fmuld8sux16	%f6,	%f1,	%f8
loop_2838:
	brgz	%o5,	loop_2839
	smulcc	%o3,	%g7,	%i4
	umulcc	%o1,	%l6,	%g4
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x70] %asi,	%l2
loop_2839:
	tg	%icc,	0x6
	sir	0x024D
	smul	%l5,	0x11CB,	%i0
	edge8l	%l1,	%g3,	%i6
	taddcctv	%l4,	0x152E,	%i1
	tneg	%icc,	0x0
	movrlez	%i5,	%g6,	%g2
	fmovrde	%l2,	%f2,	%f6
	movge	%icc,	%g5,	%i7
	edge8	%o6,	%o2,	%o0
	brlez	%i2,	loop_2840
	umulcc	%o4,	0x0EA4,	%o7
	subccc	%g1,	%l0,	%o5
	fba,a	%fcc0,	loop_2841
loop_2840:
	fmuld8ulx16	%f25,	%f8,	%f2
	tg	%icc,	0x0
	fzero	%f28
loop_2841:
	fblg	%fcc2,	loop_2842
	movrgez	%o3,	%i3,	%g7
	fmovsl	%icc,	%f26,	%f18
	movvc	%icc,	%o1,	%i4
loop_2842:
	fnegs	%f31,	%f23
	nop
	set	0x5F, %g3
	stb	%g4,	[%l7 + %g3]
	edge32n	%l6,	%l3,	%i0
	tsubcctv	%l1,	%g3,	%l5
	fnot1	%f28,	%f22
	fmovdvs	%icc,	%f0,	%f11
	edge32ln	%l4,	%i6,	%i1
	fmovd	%f0,	%f12
	movrgz	%g6,	0x1E3,	%i5
	ldsb	[%l7 + 0x41],	%g2
	tvc	%icc,	0x2
	nop
	set	0x22, %o5
	ldsh	[%l7 + %o5],	%g5
	prefetch	[%l7 + 0x1C],	 0x3
	srax	%i7,	0x1C,	%l2
	tcc	%xcc,	0x3
	fmovrsgz	%o2,	%f16,	%f16
	andcc	%o0,	0x0D13,	%i2
	andncc	%o4,	%o7,	%o6
	smul	%l0,	0x1E3A,	%o5
	movleu	%icc,	%o3,	%g1
	tle	%xcc,	0x7
	array8	%i3,	%o1,	%g7
	stb	%g4,	[%l7 + 0x6A]
	fmovdcc	%icc,	%f18,	%f22
	ba,a	%xcc,	loop_2843
	fbg	%fcc3,	loop_2844
	bvc,a,pn	%xcc,	loop_2845
	ldstub	[%l7 + 0x45],	%i4
loop_2843:
	movle	%icc,	%l6,	%i0
loop_2844:
	edge16l	%l3,	%l1,	%l5
loop_2845:
	addc	%l4,	%i6,	%i1
	tpos	%icc,	0x5
	movcc	%icc,	%g6,	%g3
	tvs	%xcc,	0x0
	fmovscc	%xcc,	%f19,	%f30
	addc	%g2,	0x0D75,	%i5
	subcc	%i7,	%l2,	%g5
	addc	%o2,	0x1982,	%i2
	bcc,a,pt	%icc,	loop_2846
	movn	%icc,	%o0,	%o7
	xnor	%o6,	0x0CA4,	%l0
	smulcc	%o5,	0x09C6,	%o3
loop_2846:
	movleu	%icc,	%g1,	%i3
	edge32l	%o4,	%g7,	%o1
	srax	%i4,	0x09,	%g4
	movrlez	%l6,	0x1CD,	%l3
	ld	[%l7 + 0x20],	%f11
	mulx	%i0,	%l1,	%l5
	tneg	%xcc,	0x3
	mulx	%l4,	%i6,	%g6
	sdivcc	%i1,	0x0756,	%g2
	fmovsneg	%icc,	%f8,	%f0
	edge16l	%i5,	%g3,	%i7
	edge16n	%g5,	%o2,	%i2
	fmovrsne	%l2,	%f26,	%f24
	te	%icc,	0x0
	andcc	%o7,	%o6,	%l0
	tle	%icc,	0x3
	add	%o5,	0x01BD,	%o0
	udiv	%g1,	0x0660,	%i3
	fcmple32	%f12,	%f24,	%o3
	sllx	%o4,	%o1,	%i4
	edge16l	%g4,	%g7,	%l3
	array16	%i0,	%l1,	%l5
	fmul8x16al	%f1,	%f12,	%f0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x78] %asi,	%l4
	movrgz	%l6,	%g6,	%i6
	taddcc	%g2,	0x15F4,	%i5
	ldstub	[%l7 + 0x2E],	%i1
	fpadd16s	%f20,	%f26,	%f26
	fbue	%fcc3,	loop_2847
	or	%i7,	%g3,	%g5
	movl	%icc,	%i2,	%o2
	tpos	%icc,	0x5
loop_2847:
	swap	[%l7 + 0x64],	%o7
	xnorcc	%l2,	0x09DD,	%o6
	srlx	%o5,	%o0,	%g1
	tne	%icc,	0x0
	fbge	%fcc2,	loop_2848
	andcc	%i3,	0x164C,	%o3
	udiv	%l0,	0x0753,	%o4
	wr	%g0,	0x80,	%asi
	stba	%o1,	[%l7 + 0x75] %asi
loop_2848:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x00A9,	%i4
	tge	%xcc,	0x7
	srl	%g4,	%l3,	%i0
	fexpand	%f15,	%f0
	ldx	[%l7 + 0x50],	%l1
	tne	%xcc,	0x4
	movneg	%xcc,	%l5,	%g7
	tgu	%icc,	0x5
	sll	%l4,	%l6,	%i6
	xnor	%g2,	0x04B3,	%g6
	edge32	%i5,	%i7,	%i1
	sll	%g5,	0x17,	%g3
	sdiv	%o2,	0x184C,	%o7
	membar	#Sync
	set	0x40, %g2
	ldda	[%l7 + %g2] 0xf0,	%f16
	movrlez	%l2,	0x377,	%i2
	ba,a,pt	%xcc,	loop_2849
	swap	[%l7 + 0x20],	%o5
	fnands	%f31,	%f8,	%f17
	nop
	set	0x6A, %g6
	ldub	[%l7 + %g6],	%o6
loop_2849:
	movcc	%icc,	%g1,	%o0
	tvc	%icc,	0x6
	move	%xcc,	%i3,	%o3
	brz	%l0,	loop_2850
	orcc	%o1,	0x1818,	%o4
	smul	%i4,	0x0D64,	%g4
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x48] %asi,	%l3
loop_2850:
	stb	%i0,	[%l7 + 0x62]
	bleu	loop_2851
	edge8n	%l5,	%l1,	%g7
	set	0x4C, %i6
	sta	%f13,	[%l7 + %i6] 0x18
loop_2851:
	umulcc	%l6,	%l4,	%i6
	edge8ln	%g2,	%i5,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i1,	0x0F,	%i7
	bl,pn	%icc,	loop_2852
	fblg,a	%fcc0,	loop_2853
	udivcc	%g3,	0x1D6F,	%g5
	set	0x62, %g4
	stha	%o7,	[%l7 + %g4] 0x14
loop_2852:
	fornot1	%f12,	%f30,	%f28
loop_2853:
	alignaddrl	%o2,	%i2,	%o5
	std	%o6,	[%l7 + 0x10]
	sethi	0x1424,	%l2
	tleu	%icc,	0x2
	fpadd16s	%f1,	%f9,	%f24
	alignaddr	%g1,	%o0,	%i3
	tcs	%xcc,	0x6
	fandnot1s	%f15,	%f13,	%f13
	tn	%xcc,	0x2
	fcmpes	%fcc0,	%f22,	%f13
	movcc	%xcc,	%l0,	%o3
	movle	%icc,	%o4,	%i4
	umulcc	%o1,	0x1A97,	%l3
	mova	%xcc,	%i0,	%l5
	edge8ln	%g4,	%g7,	%l1
	bn,pn	%icc,	loop_2854
	tsubcc	%l4,	%l6,	%i6
	sdivcc	%g2,	0x0103,	%g6
	bpos,pn	%icc,	loop_2855
loop_2854:
	fcmpne32	%f0,	%f22,	%i1
	fxor	%f10,	%f22,	%f8
	edge8	%i7,	%i5,	%g5
loop_2855:
	fpackfix	%f4,	%f28
	fmovsg	%xcc,	%f23,	%f31
	tl	%xcc,	0x2
	umulcc	%o7,	0x190C,	%o2
	umulcc	%i2,	0x0540,	%o5
	udivcc	%o6,	0x1EC4,	%l2
	xnor	%g3,	%g1,	%o0
	bshuffle	%f24,	%f6,	%f14
	fmovdpos	%icc,	%f0,	%f23
	add	%l0,	0x1C90,	%o3
	subcc	%i3,	%i4,	%o1
	fmovdl	%xcc,	%f21,	%f4
	movrne	%o4,	0x3E2,	%l3
	move	%xcc,	%i0,	%l5
	orncc	%g7,	%g4,	%l1
	fmovsgu	%xcc,	%f2,	%f3
	fmul8sux16	%f26,	%f10,	%f30
	ldx	[%l7 + 0x30],	%l6
	fmuld8ulx16	%f18,	%f5,	%f26
	nop
	set	0x70, %o7
	std	%f28,	[%l7 + %o7]
	fexpand	%f1,	%f16
	movn	%icc,	%l4,	%g2
	set	0x30, %i0
	lduba	[%l7 + %i0] 0x11,	%i6
	fcmple16	%f2,	%f22,	%g6
	movrgez	%i1,	%i7,	%g5
	std	%f8,	[%l7 + 0x50]
	tl	%icc,	0x2
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x14] %asi,	%o7
	brgz	%o2,	loop_2856
	fcmpeq16	%f26,	%f2,	%i5
	sir	0x133B
	fbge	%fcc0,	loop_2857
loop_2856:
	fandnot1	%f24,	%f28,	%f14
	siam	0x1
	brgz,a	%i2,	loop_2858
loop_2857:
	alignaddr	%o5,	%o6,	%l2
	movleu	%icc,	%g1,	%o0
	xor	%l0,	%g3,	%i3
loop_2858:
	sir	0x0325
	edge8n	%i4,	%o3,	%o4
	tne	%icc,	0x4
	srlx	%l3,	0x17,	%i0
	nop
	setx	loop_2859,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addcc	%o1,	%l5,	%g7
	subc	%l1,	%l6,	%g4
	nop
	setx	loop_2860,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2859:
	fcmpne16	%f20,	%f12,	%l4
	fmovdneg	%icc,	%f7,	%f19
	taddcc	%i6,	0x0F7F,	%g6
loop_2860:
	fandnot1s	%f23,	%f21,	%f6
	tle	%icc,	0x3
	movl	%icc,	%i1,	%g2
	fands	%f20,	%f13,	%f4
	andcc	%i7,	%o7,	%o2
	sir	0x11A5
	set	0x0C, %g7
	sta	%f11,	[%l7 + %g7] 0x04
	wr	%g0,	0x11,	%asi
	stwa	%i5,	[%l7 + 0x5C] %asi
	fbe	%fcc3,	loop_2861
	andncc	%i2,	%o5,	%g5
	fmovsn	%xcc,	%f28,	%f21
	fpadd16s	%f22,	%f9,	%f14
loop_2861:
	movleu	%icc,	%o6,	%g1
	edge8	%o0,	%l0,	%g3
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%i3
	ldsw	[%l7 + 0x30],	%i4
	alignaddr	%o3,	%o4,	%l2
	umulcc	%i0,	0x0220,	%o1
	subccc	%l3,	0x0F6E,	%g7
	sdivx	%l5,	0x0920,	%l1
	fmovrdlz	%g4,	%f30,	%f28
	udivcc	%l4,	0x038F,	%l6
	orncc	%i6,	%g6,	%i1
	movneg	%xcc,	%g2,	%i7
	movrne	%o7,	%i5,	%i2
	alignaddr	%o2,	%g5,	%o6
	edge32l	%o5,	%o0,	%l0
	tcs	%icc,	0x4
	orncc	%g3,	0x009B,	%i3
	fmovrsne	%g1,	%f18,	%f27
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x0D] %asi,	%i4
	fmovsleu	%icc,	%f11,	%f0
	edge32l	%o3,	%o4,	%l2
	brgez	%o1,	loop_2862
	udiv	%l3,	0x0121,	%g7
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2862:
	tge	%xcc,	0x7
	set	0x7C, %g1
	ldswa	[%l7 + %g1] 0x81,	%l5
	tsubcctv	%l1,	%g4,	%i0
	fpadd16s	%f18,	%f14,	%f3
	tsubcctv	%l4,	%i6,	%l6
	sllx	%g6,	0x07,	%i1
	movrgz	%g2,	0x074,	%i7
	edge8ln	%i5,	%i2,	%o2
	movle	%icc,	%g5,	%o6
	movrgz	%o5,	0x3CE,	%o0
	swap	[%l7 + 0x14],	%o7
	tcs	%icc,	0x2
	movrne	%g3,	%l0,	%i3
	edge32	%g1,	%i4,	%o4
	stx	%l2,	[%l7 + 0x40]
	andn	%o3,	%o1,	%g7
	movne	%icc,	%l3,	%l5
	subcc	%g4,	0x1E31,	%i0
	edge32	%l4,	%l1,	%i6
	fba,a	%fcc1,	loop_2863
	fmul8x16au	%f8,	%f10,	%f26
	andncc	%l6,	%i1,	%g2
	addcc	%g6,	%i7,	%i5
loop_2863:
	edge16	%o2,	%i2,	%o6
	fcmple16	%f24,	%f10,	%o5
	tpos	%xcc,	0x0
	edge32l	%o0,	%o7,	%g3
	edge16	%g5,	%i3,	%l0
	xor	%g1,	%i4,	%l2
	fpsub16	%f4,	%f6,	%f16
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x7C] %asi,	%f3
	alignaddr	%o4,	%o1,	%o3
	edge32	%l3,	%l5,	%g7
	xorcc	%g4,	%l4,	%i0
	ble	%icc,	loop_2864
	or	%l1,	%i6,	%i1
	brgez	%l6,	loop_2865
	edge16l	%g6,	%g2,	%i7
loop_2864:
	mulscc	%o2,	0x0550,	%i5
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x1F] %asi,	%o6
loop_2865:
	add	%i2,	%o5,	%o0
	sdivx	%o7,	0x039C,	%g5
	sir	0x0683
	brgz,a	%g3,	loop_2866
	stx	%l0,	[%l7 + 0x48]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x08, %l5
	ldsha	[%l7 + %l5] 0x15,	%g1
loop_2866:
	tsubcc	%i4,	0x1FC7,	%l2
	taddcctv	%i3,	%o1,	%o4
	std	%f14,	[%l7 + 0x30]
	fmovda	%icc,	%f3,	%f5
	movge	%xcc,	%o3,	%l3
	ta	%xcc,	0x1
	fmovdle	%xcc,	%f15,	%f7
	fmovdcs	%icc,	%f6,	%f9
	faligndata	%f22,	%f14,	%f30
	sdiv	%g7,	0x1870,	%l5
	bcc	loop_2867
	fbuge,a	%fcc2,	loop_2868
	fnot2	%f14,	%f10
	fcmped	%fcc0,	%f30,	%f10
loop_2867:
	fpsub16s	%f7,	%f6,	%f3
loop_2868:
	fbl,a	%fcc3,	loop_2869
	fmovda	%xcc,	%f20,	%f20
	bcs,a,pn	%xcc,	loop_2870
	array16	%l4,	%g4,	%i0
loop_2869:
	te	%icc,	0x6
	wr	%g0,	0xe2,	%asi
	stba	%i6,	[%l7 + 0x13] %asi
	membar	#Sync
loop_2870:
	fand	%f4,	%f18,	%f28
	array32	%l1,	%i1,	%g6
	tvs	%xcc,	0x3
	ldstub	[%l7 + 0x10],	%l6
	array16	%g2,	%o2,	%i7
	tgu	%icc,	0x7
	nop
	set	0x28, %l4
	ldsw	[%l7 + %l4],	%o6
	udivcc	%i5,	0x0EDD,	%i2
	sra	%o5,	0x0C,	%o0
	fmovrse	%o7,	%f24,	%f16
	fandnot1s	%f13,	%f30,	%f17
	fmovsle	%icc,	%f21,	%f0
	srl	%g3,	0x02,	%g5
	edge32ln	%l0,	%g1,	%l2
	alignaddr	%i4,	%o1,	%o4
	fpadd32	%f30,	%f28,	%f6
	fandnot1	%f6,	%f22,	%f24
	fbuge	%fcc1,	loop_2871
	bleu	loop_2872
	bl,a	loop_2873
	orn	%i3,	%o3,	%g7
loop_2871:
	fbne	%fcc0,	loop_2874
loop_2872:
	movle	%icc,	%l5,	%l4
loop_2873:
	edge32	%l3,	%i0,	%g4
	and	%l1,	0x130E,	%i6
loop_2874:
	taddcctv	%g6,	%i1,	%g2
	array32	%l6,	%o2,	%i7
	tpos	%icc,	0x6
	movvc	%xcc,	%o6,	%i2
	movneg	%icc,	%o5,	%i5
	tpos	%xcc,	0x1
	brz	%o7,	loop_2875
	fmovrde	%o0,	%f26,	%f14
	fcmpne16	%f28,	%f2,	%g5
	fandnot2s	%f27,	%f13,	%f17
loop_2875:
	array32	%l0,	%g3,	%l2
	fmovrsgez	%g1,	%f30,	%f30
	bgu,a	loop_2876
	fbl	%fcc2,	loop_2877
	movcc	%xcc,	%o1,	%o4
	fmovrdgez	%i3,	%f24,	%f20
loop_2876:
	fnegs	%f28,	%f2
loop_2877:
	fmovrslz	%i4,	%f31,	%f3
	edge32ln	%o3,	%g7,	%l5
	tcs	%icc,	0x1
	addcc	%l3,	0x1768,	%i0
	edge32l	%l4,	%l1,	%i6
	nop
	setx loop_2878, %l0, %l1
	jmpl %l1, %g4
	fpsub16	%f22,	%f14,	%f14
	tle	%icc,	0x5
	edge32	%i1,	%g6,	%g2
loop_2878:
	fbule,a	%fcc2,	loop_2879
	edge32l	%l6,	%o2,	%i7
	mulscc	%i2,	%o6,	%o5
	fmovsgu	%xcc,	%f11,	%f27
loop_2879:
	edge32l	%i5,	%o7,	%g5
	movcs	%icc,	%l0,	%o0
	tge	%xcc,	0x0
	tgu	%icc,	0x1
	movpos	%xcc,	%l2,	%g3
	tn	%icc,	0x7
	fsrc1s	%f9,	%f2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%g1,	%o1
	bvs,a,pt	%icc,	loop_2880
	movrlz	%o4,	%i4,	%o3
	fmuld8sux16	%f25,	%f28,	%f22
	or	%g7,	%i3,	%l3
loop_2880:
	ta	%xcc,	0x6
	fbue	%fcc2,	loop_2881
	bge,pn	%icc,	loop_2882
	nop
	setx loop_2883, %l0, %l1
	jmpl %l1, %i0
	move	%xcc,	%l4,	%l1
loop_2881:
	movrne	%l5,	0x39A,	%i6
loop_2882:
	sll	%i1,	%g6,	%g2
loop_2883:
	sdiv	%l6,	0x0C6A,	%g4
	movrlz	%i7,	0x2FA,	%o2
	fxnor	%f16,	%f8,	%f24
	nop
	set	0x5C, %i2
	lduh	[%l7 + %i2],	%i2
	movrne	%o6,	%o5,	%i5
	smulcc	%g5,	%l0,	%o7
	membar	0x68
	andncc	%l2,	%g3,	%g1
	subc	%o1,	%o0,	%i4
	fmovrdlz	%o4,	%f30,	%f14
	std	%f30,	[%l7 + 0x18]
	movpos	%xcc,	%o3,	%g7
	edge16ln	%i3,	%l3,	%i0
	or	%l4,	0x171B,	%l5
	set	0x6B, %i4
	stba	%l1,	[%l7 + %i4] 0x80
	edge8l	%i6,	%i1,	%g6
	brgz,a	%l6,	loop_2884
	ldx	[%l7 + 0x30],	%g4
	movl	%icc,	%i7,	%o2
	fxor	%f22,	%f4,	%f10
loop_2884:
	fnegs	%f15,	%f8
	subccc	%g2,	%i2,	%o6
	fcmpes	%fcc1,	%f25,	%f24
	edge32ln	%i5,	%g5,	%o5
	fbul,a	%fcc3,	loop_2885
	mulscc	%o7,	0x0E88,	%l0
	movl	%xcc,	%g3,	%g1
	movleu	%icc,	%l2,	%o0
loop_2885:
	smulcc	%i4,	0x1CF7,	%o1
	mulx	%o4,	0x049C,	%o3
	fblg,a	%fcc3,	loop_2886
	edge8	%g7,	%i3,	%l3
	membar	0x5D
	sdivx	%i0,	0x0FA9,	%l5
loop_2886:
	tl	%icc,	0x2
	fmovrde	%l4,	%f4,	%f30
	ldub	[%l7 + 0x7B],	%l1
	fnegd	%f14,	%f0
	fmovdle	%xcc,	%f13,	%f19
	ldx	[%l7 + 0x18],	%i6
	edge8	%i1,	%l6,	%g4
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x16
	membar	#Sync
	fand	%f20,	%f22,	%f6
	orncc	%i7,	0x1AA2,	%g6
	stb	%o2,	[%l7 + 0x1F]
	tneg	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x0E] %asi,	%g2
	call	loop_2887
	movge	%xcc,	%i2,	%o6
	tvc	%icc,	0x6
	edge16ln	%g5,	%o5,	%i5
loop_2887:
	nop
	set	0x72, %o6
	ldsba	[%l7 + %o6] 0x81,	%l0
	subc	%g3,	%g1,	%o7
	edge8ln	%l2,	%i4,	%o0
	movn	%xcc,	%o4,	%o3
	fsrc1s	%f10,	%f17
	movcs	%xcc,	%o1,	%g7
	bcs	loop_2888
	popc	0x19F8,	%l3
	movl	%icc,	%i3,	%i0
	fornot2s	%f7,	%f9,	%f4
loop_2888:
	stb	%l5,	[%l7 + 0x69]
	andn	%l4,	0x0D4D,	%i6
	subc	%l1,	0x0E10,	%i1
	addcc	%g4,	0x0EE3,	%i7
	and	%l6,	%o2,	%g6
	andncc	%g2,	%o6,	%g5
	orn	%i2,	%i5,	%o5
	or	%l0,	0x1EEA,	%g3
	brlez	%o7,	loop_2889
	sll	%l2,	0x16,	%i4
	fmovsne	%xcc,	%f20,	%f27
	addccc	%g1,	%o0,	%o4
loop_2889:
	srl	%o1,	%o3,	%g7
	edge8n	%l3,	%i3,	%i0
	udivcc	%l4,	0x0E6C,	%i6
	movvs	%icc,	%l1,	%l5
	fmovrde	%g4,	%f24,	%f10
	set	0x3C, %o0
	stwa	%i1,	[%l7 + %o0] 0x2a
	membar	#Sync
	te	%icc,	0x0
	movgu	%icc,	%l6,	%i7
	fmovrslez	%g6,	%f1,	%f13
	fmovscs	%xcc,	%f25,	%f4
	set	0x30, %o3
	lduha	[%l7 + %o3] 0x10,	%g2
	fbe	%fcc3,	loop_2890
	sir	0x1035
	stbar
	xorcc	%o6,	%o2,	%i2
loop_2890:
	sdiv	%g5,	0x1C31,	%o5
	smul	%l0,	%i5,	%o7
	fmovrdlz	%l2,	%f2,	%f8
	fnands	%f25,	%f18,	%f10
	srl	%i4,	%g1,	%g3
	srl	%o4,	0x10,	%o1
	array8	%o0,	%g7,	%o3
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l3
	edge16	%i0,	%l4,	%i3
	movvc	%icc,	%l1,	%i6
	fornot1	%f18,	%f20,	%f16
	wr	%g0,	0x2a,	%asi
	stda	%g4,	[%l7 + 0x18] %asi
	membar	#Sync
	fnands	%f4,	%f22,	%f10
	movne	%icc,	%l5,	%l6
	brlz,a	%i1,	loop_2891
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g6,	0x1ACD,	%i7
	udivcc	%g2,	0x1D16,	%o2
loop_2891:
	edge16l	%o6,	%i2,	%o5
	tneg	%xcc,	0x2
	ldsh	[%l7 + 0x66],	%l0
	bcs,a	loop_2892
	movvs	%xcc,	%i5,	%g5
	ldstub	[%l7 + 0x72],	%o7
	orn	%i4,	%g1,	%g3
loop_2892:
	fbn	%fcc1,	loop_2893
	fornot1s	%f15,	%f1,	%f6
	udiv	%l2,	0x1869,	%o1
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%o4,	%g7
loop_2893:
	fcmpd	%fcc3,	%f10,	%f2
	umul	%o0,	%l3,	%i0
	fmovsge	%icc,	%f7,	%f12
	orcc	%l4,	0x01DA,	%i3
	std	%f22,	[%l7 + 0x28]
	edge16n	%l1,	%i6,	%g4
	movrlez	%l5,	%o3,	%i1
	fbg	%fcc1,	loop_2894
	bneg	loop_2895
	movcs	%icc,	%l6,	%g6
	fnot1s	%f14,	%f16
loop_2894:
	tsubcc	%i7,	%o2,	%g2
loop_2895:
	sdivx	%o6,	0x1988,	%o5
	edge16ln	%i2,	%i5,	%g5
	movrgez	%o7,	0x157,	%l0
	xorcc	%g1,	0x10A2,	%g3
	tvs	%icc,	0x5
	smulcc	%l2,	%i4,	%o4
	fmovsge	%xcc,	%f23,	%f16
	xnor	%g7,	%o0,	%l3
	bne,a	%icc,	loop_2896
	ble,a,pt	%xcc,	loop_2897
	movn	%icc,	%i0,	%l4
	fmovsa	%xcc,	%f30,	%f12
loop_2896:
	std	%o0,	[%l7 + 0x58]
loop_2897:
	edge16	%l1,	%i6,	%i3
	fbl	%fcc3,	loop_2898
	swap	[%l7 + 0x28],	%l5
	smulcc	%o3,	%i1,	%l6
	brz	%g4,	loop_2899
loop_2898:
	subccc	%i7,	%o2,	%g2
	movneg	%xcc,	%o6,	%o5
	taddcc	%i2,	0x1A76,	%g6
loop_2899:
	orcc	%g5,	%i5,	%l0
	movrlz	%g1,	0x201,	%o7
	srax	%l2,	0x10,	%i4
	fmovsleu	%icc,	%f1,	%f17
	std	%f26,	[%l7 + 0x48]
	movrne	%g3,	%o4,	%g7
	fmul8x16au	%f3,	%f31,	%f2
	ldsh	[%l7 + 0x72],	%o0
	tn	%xcc,	0x6
	udivx	%l3,	0x08D6,	%l4
	fnands	%f17,	%f3,	%f28
	fnot1	%f4,	%f30
	fmovdvc	%icc,	%f8,	%f23
	fcmped	%fcc1,	%f18,	%f12
	movrne	%o1,	0x045,	%l1
	tge	%xcc,	0x3
	fmovse	%xcc,	%f5,	%f22
	ldx	[%l7 + 0x18],	%i6
	swap	[%l7 + 0x7C],	%i0
	fmul8x16al	%f25,	%f31,	%f18
	orn	%l5,	0x05A8,	%o3
	fornot2	%f28,	%f8,	%f12
	tneg	%icc,	0x3
	fmovdneg	%xcc,	%f1,	%f28
	orn	%i3,	%i1,	%l6
	movcc	%icc,	%i7,	%o2
	movrlez	%g2,	%o6,	%g4
	tge	%icc,	0x2
	or	%i2,	0x02B0,	%g6
	movneg	%icc,	%g5,	%i5
	array8	%o5,	%l0,	%o7
	srl	%l2,	%i4,	%g3
	wr	%g0,	0x89,	%asi
	stha	%g1,	[%l7 + 0x34] %asi
	tleu	%xcc,	0x2
	bl,a	%icc,	loop_2900
	udivx	%o4,	0x1576,	%o0
	addccc	%l3,	%l4,	%g7
	fmovdvc	%xcc,	%f14,	%f12
loop_2900:
	lduh	[%l7 + 0x6C],	%l1
	fmul8x16al	%f6,	%f20,	%f8
	movn	%xcc,	%i6,	%i0
	fmovd	%f8,	%f10
	sdiv	%l5,	0x0E0C,	%o1
	addcc	%i3,	0x1000,	%i1
	addc	%l6,	%o3,	%o2
	movrne	%i7,	0x2C3,	%o6
	std	%g2,	[%l7 + 0x18]
	fmovdpos	%icc,	%f30,	%f23
	sll	%i2,	%g4,	%g5
	movcc	%xcc,	%g6,	%o5
	fbge,a	%fcc0,	loop_2901
	popc	%i5,	%l0
	bleu,pt	%icc,	loop_2902
	movvs	%xcc,	%l2,	%i4
loop_2901:
	movvs	%icc,	%o7,	%g3
	movne	%icc,	%o4,	%o0
loop_2902:
	fand	%f30,	%f28,	%f0
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x68] %asi,	%l3
	bgu,a	%icc,	loop_2903
	st	%f19,	[%l7 + 0x74]
	bpos	loop_2904
	pdist	%f30,	%f30,	%f20
loop_2903:
	ta	%xcc,	0x3
	tle	%xcc,	0x6
loop_2904:
	fmovd	%f8,	%f10
	tle	%xcc,	0x5
	fblg,a	%fcc1,	loop_2905
	and	%l4,	0x0B4D,	%g7
	fbe,a	%fcc1,	loop_2906
	tne	%xcc,	0x4
loop_2905:
	tn	%xcc,	0x7
	sub	%g1,	%l1,	%i6
loop_2906:
	movrlez	%i0,	%l5,	%o1
	ba,pn	%xcc,	loop_2907
	bpos,a,pn	%xcc,	loop_2908
	subccc	%i3,	0x070E,	%l6
	movpos	%xcc,	%o3,	%o2
loop_2907:
	tneg	%xcc,	0x2
loop_2908:
	srlx	%i1,	%i7,	%o6
	fcmpgt32	%f10,	%f24,	%g2
	smul	%i2,	%g4,	%g6
	wr	%g0,	0x23,	%asi
	stxa	%g5,	[%l7 + 0x78] %asi
	membar	#Sync
	fcmpne16	%f6,	%f18,	%o5
	movle	%icc,	%i5,	%l2
	movrgz	%l0,	0x14B,	%o7
	or	%i4,	%o4,	%g3
	and	%o0,	0x0ECC,	%l3
	fsrc2s	%f16,	%f19
	tpos	%xcc,	0x5
	fmovdne	%xcc,	%f31,	%f21
	tpos	%xcc,	0x3
	nop
	setx	loop_2909,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdvc	%xcc,	%f15,	%f9
	fbue,a	%fcc0,	loop_2910
	nop
	setx	loop_2911,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2909:
	tg	%xcc,	0x1
	set	0x19, %i7
	lduba	[%l7 + %i7] 0x15,	%l4
loop_2910:
	movrgez	%g7,	%g1,	%i6
loop_2911:
	tle	%xcc,	0x7
	edge32l	%l1,	%l5,	%i0
	mulscc	%i3,	%l6,	%o3
	fble,a	%fcc0,	loop_2912
	movl	%icc,	%o1,	%o2
	ldx	[%l7 + 0x78],	%i7
	fmul8x16	%f22,	%f8,	%f4
loop_2912:
	fmovsleu	%xcc,	%f29,	%f3
	sth	%i1,	[%l7 + 0x4E]
	set	0x3B, %i5
	ldstuba	[%l7 + %i5] 0x80,	%o6
	sth	%g2,	[%l7 + 0x26]
	set	0x0, %o2
	stxa	%i2,	[%g0 + %o2] 0x57
	movcs	%icc,	%g4,	%g6
	movneg	%xcc,	%g5,	%o5
	movne	%xcc,	%i5,	%l0
	subc	%o7,	%i4,	%l2
	tcc	%icc,	0x3
	fba,a	%fcc1,	loop_2913
	and	%o4,	0x1CB8,	%g3
	or	%l3,	%l4,	%o0
	fmovdpos	%xcc,	%f27,	%f24
loop_2913:
	smul	%g1,	0x081F,	%g7
	movrlez	%l1,	0x1C2,	%l5
	xor	%i0,	0x1B74,	%i6
	fcmps	%fcc3,	%f13,	%f30
	fmovdg	%icc,	%f5,	%f14
	fbo	%fcc1,	loop_2914
	xorcc	%l6,	0x0AAD,	%o3
	fpack32	%f4,	%f20,	%f2
	tsubcc	%o1,	0x177F,	%i3
loop_2914:
	edge32l	%i7,	%i1,	%o6
	subc	%g2,	%o2,	%g4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	movpos	%xcc,	%i2,	%g5
	sdivcc	%o5,	0x1D61,	%l0
	edge8	%o7,	%i5,	%i4
	sll	%o4,	0x07,	%g3
	xorcc	%l3,	%l4,	%o0
	popc	%l2,	%g1
	fcmpgt32	%f6,	%f8,	%l1
	addccc	%l5,	%i0,	%g7
	tvc	%icc,	0x0
	andn	%i6,	0x0233,	%o3
	fbue	%fcc1,	loop_2915
	stw	%o1,	[%l7 + 0x2C]
	fbug,a	%fcc1,	loop_2916
	sethi	0x0192,	%i3
loop_2915:
	movcs	%icc,	%i7,	%i1
	fbne,a	%fcc1,	loop_2917
loop_2916:
	fors	%f21,	%f1,	%f24
	fpmerge	%f3,	%f6,	%f14
	fblg,a	%fcc2,	loop_2918
loop_2917:
	alignaddrl	%o6,	%g2,	%l6
	fbug,a	%fcc3,	loop_2919
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2918:
	brlz,a	%g4,	loop_2920
	edge8l	%o2,	%g6,	%g5
loop_2919:
	sdivx	%i2,	0x168E,	%l0
	fbl,a	%fcc3,	loop_2921
loop_2920:
	movneg	%xcc,	%o5,	%i5
	tle	%icc,	0x4
	edge16n	%i4,	%o7,	%g3
loop_2921:
	taddcctv	%o4,	0x098D,	%l4
	fmovdl	%xcc,	%f12,	%f5
	movl	%xcc,	%l3,	%l2
	swap	[%l7 + 0x40],	%g1
	fpsub32	%f14,	%f22,	%f16
	call	loop_2922
	ble,a	loop_2923
	fbule	%fcc1,	loop_2924
	fba	%fcc2,	loop_2925
loop_2922:
	fbug,a	%fcc0,	loop_2926
loop_2923:
	tvc	%xcc,	0x0
loop_2924:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2925:
	movneg	%xcc,	%o0,	%l5
loop_2926:
	fba	%fcc0,	loop_2927
	fone	%f2
	sir	0x111B
	movleu	%icc,	%i0,	%g7
loop_2927:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i6,	[%l7 + 0x10]
	ldsw	[%l7 + 0x48],	%l1
	movre	%o3,	0x016,	%i3
	mulx	%o1,	0x1CA0,	%i1
	be,a	loop_2928
	stbar
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x58] %asi,	%i7
loop_2928:
	nop
	set	0x70, %o4
	ldswa	[%l7 + %o4] 0x18,	%o6
	udiv	%g2,	0x14E6,	%g4
	fbg	%fcc3,	loop_2929
	add	%l6,	%o2,	%g5
	andcc	%g6,	0x07C4,	%l0
	fmovsne	%icc,	%f0,	%f12
loop_2929:
	movcs	%xcc,	%o5,	%i2
	taddcctv	%i4,	0x0052,	%o7
	edge32l	%i5,	%o4,	%g3
	edge32	%l3,	%l2,	%l4
	bge	%icc,	loop_2930
	fornot2	%f12,	%f10,	%f12
	fcmped	%fcc0,	%f16,	%f2
	subccc	%o0,	%l5,	%g1
loop_2930:
	fmovrsne	%g7,	%f2,	%f10
	or	%i0,	%l1,	%o3
	alignaddr	%i6,	%i3,	%i1
	prefetch	[%l7 + 0x54],	 0x1
	stb	%i7,	[%l7 + 0x20]
	tcs	%xcc,	0x1
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x78] %asi,	%f17
	xorcc	%o6,	%g2,	%g4
	brgez,a	%o1,	loop_2931
	tcc	%icc,	0x7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%o2
loop_2931:
	bleu,a,pt	%xcc,	loop_2932
	ldub	[%l7 + 0x73],	%g6
	faligndata	%f2,	%f24,	%f4
	popc	0x154A,	%l0
loop_2932:
	fmovdge	%icc,	%f25,	%f16
	movrlz	%o5,	0x136,	%i2
	umulcc	%g5,	0x0751,	%i4
	fbu,a	%fcc2,	loop_2933
	sth	%o7,	[%l7 + 0x6C]
	fpadd16s	%f6,	%f15,	%f29
	andcc	%i5,	%o4,	%g3
loop_2933:
	te	%xcc,	0x6
	addc	%l3,	%l2,	%l4
	addccc	%l5,	0x1F4E,	%g1
	sir	0x193F
	fmovrdgez	%g7,	%f26,	%f16
	fmovrdlez	%o0,	%f28,	%f22
	ldx	[%l7 + 0x58],	%l1
	edge8ln	%i0,	%i6,	%i3
	sra	%o3,	%i7,	%i1
	bgu	loop_2934
	bg,a	loop_2935
	fbn	%fcc3,	loop_2936
	tne	%icc,	0x2
loop_2934:
	edge32ln	%o6,	%g2,	%g4
loop_2935:
	xnorcc	%o1,	%l6,	%g6
loop_2936:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%icc,	%f14,	%f20
	movrne	%o2,	%l0,	%i2
	andncc	%o5,	%g5,	%i4
	taddcc	%i5,	0x1E05,	%o4
	fbuge,a	%fcc1,	loop_2937
	bcc,a	%icc,	loop_2938
	movre	%o7,	%g3,	%l3
	sdivx	%l2,	0x1D9B,	%l5
loop_2937:
	ldub	[%l7 + 0x25],	%g1
loop_2938:
	tvc	%xcc,	0x2
	edge8	%g7,	%l4,	%o0
	fmovdneg	%icc,	%f11,	%f19
	tvs	%xcc,	0x4
	movrlz	%i0,	%i6,	%i3
	tleu	%xcc,	0x0
	fble,a	%fcc3,	loop_2939
	tcs	%icc,	0x1
	fmovrslz	%l1,	%f26,	%f10
	fmovdle	%icc,	%f10,	%f29
loop_2939:
	edge8l	%i7,	%i1,	%o6
	movcs	%xcc,	%o3,	%g2
	ldx	[%l7 + 0x70],	%o1
	fandnot2s	%f21,	%f2,	%f22
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x58] %asi,	%g4
	edge16l	%g6,	%l6,	%l0
	subcc	%o2,	%o5,	%g5
	tl	%icc,	0x2
	fbge	%fcc2,	loop_2940
	movrgz	%i2,	%i4,	%o4
	fabss	%f14,	%f2
	xor	%o7,	%g3,	%l3
loop_2940:
	ta	%icc,	0x4
	fmovdpos	%icc,	%f16,	%f24
	or	%l2,	0x03D3,	%l5
	brz	%i5,	loop_2941
	ldd	[%l7 + 0x40],	%g6
	sdivcc	%g1,	0x041D,	%o0
	subccc	%i0,	%l4,	%i6
loop_2941:
	std	%l0,	[%l7 + 0x38]
	tneg	%icc,	0x3
	lduw	[%l7 + 0x0C],	%i3
	smul	%i1,	%i7,	%o3
	movvs	%icc,	%o6,	%g2
	taddcc	%g4,	0x0D1F,	%o1
	fmovdcc	%xcc,	%f23,	%f25
	fmovrse	%g6,	%f18,	%f8
	membar	0x5D
	or	%l0,	0x02B2,	%l6
	edge16ln	%o2,	%o5,	%i2
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x10] %asi,	%i4
	fcmpes	%fcc1,	%f7,	%f20
	movneg	%icc,	%g5,	%o7
	edge8l	%g3,	%o4,	%l2
	movn	%icc,	%l3,	%l5
	srlx	%g7,	%i5,	%g1
	fmovdcs	%icc,	%f10,	%f30
	brgz	%o0,	loop_2942
	swap	[%l7 + 0x54],	%l4
	fornot2	%f20,	%f4,	%f28
	fsrc2s	%f17,	%f22
loop_2942:
	bg	loop_2943
	fcmpgt32	%f30,	%f26,	%i0
	tcs	%xcc,	0x0
	movneg	%icc,	%l1,	%i6
loop_2943:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i1,	%i7,	%o3
	ldx	[%l7 + 0x60],	%i3
	taddcctv	%o6,	0x1F34,	%g4
	movne	%xcc,	%g2,	%g6
	orncc	%l0,	0x0E69,	%o1
	fmovd	%f18,	%f28
	tleu	%xcc,	0x0
	tvs	%icc,	0x4
	andncc	%o2,	%o5,	%l6
	taddcctv	%i2,	0x0020,	%g5
	tleu	%icc,	0x4
	edge8l	%o7,	%i4,	%g3
	fmovscs	%xcc,	%f27,	%f23
	movl	%icc,	%o4,	%l3
	fmul8sux16	%f24,	%f2,	%f20
	fnors	%f23,	%f8,	%f29
	edge16l	%l5,	%l2,	%g7
	udivcc	%i5,	0x0BE0,	%o0
	movgu	%icc,	%l4,	%i0
	flush	%l7 + 0x54
	orcc	%g1,	0x1F6E,	%i6
	set	0x4C, %l0
	swapa	[%l7 + %l0] 0x89,	%l1
	tl	%icc,	0x6
	fmovdn	%icc,	%f29,	%f3
	fmovsvc	%icc,	%f28,	%f10
	tgu	%xcc,	0x3
	add	%i1,	0x1098,	%o3
	tgu	%xcc,	0x4
	movn	%icc,	%i7,	%i3
	fmovdcc	%xcc,	%f26,	%f24
	fnor	%f4,	%f20,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x0
	addc	%o6,	%g2,	%g6
	sdiv	%g4,	0x0D34,	%l0
	fmovdpos	%xcc,	%f4,	%f17
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x7F] %asi,	%o1
	edge16ln	%o5,	%l6,	%o2
	fpackfix	%f26,	%f10
	movrgez	%i2,	0x216,	%o7
	fmovdleu	%xcc,	%f10,	%f8
	andn	%i4,	0x1581,	%g3
	fpadd32	%f28,	%f20,	%f4
	bcs,a	loop_2944
	xorcc	%o4,	%g5,	%l5
	pdist	%f14,	%f28,	%f16
	fmovrdlz	%l2,	%f28,	%f16
loop_2944:
	edge32l	%g7,	%l3,	%i5
	popc	%l4,	%o0
	tneg	%icc,	0x7
	fbue	%fcc2,	loop_2945
	fmovrde	%i0,	%f20,	%f12
	te	%icc,	0x2
	movneg	%icc,	%i6,	%g1
loop_2945:
	move	%xcc,	%i1,	%l1
	ldsw	[%l7 + 0x68],	%o3
	edge32	%i3,	%o6,	%g2
	movn	%xcc,	%g6,	%g4
	movpos	%xcc,	%l0,	%i7
	fcmpne16	%f22,	%f12,	%o1
	fpadd16s	%f8,	%f1,	%f13
	movcs	%xcc,	%l6,	%o2
	nop
	set	0x14, %l1
	lduw	[%l7 + %l1],	%i2
	movn	%xcc,	%o5,	%i4
	movpos	%icc,	%g3,	%o7
	movle	%icc,	%o4,	%l5
	bl,pt	%icc,	loop_2946
	nop
	set	0x54, %l2
	lduw	[%l7 + %l2],	%g5
	edge8n	%g7,	%l3,	%l2
	fmuld8ulx16	%f7,	%f20,	%f20
loop_2946:
	tneg	%icc,	0x3
	fmul8sux16	%f22,	%f16,	%f20
	fmovde	%xcc,	%f3,	%f6
	add	%l4,	0x0975,	%i5
	fmovrsgez	%i0,	%f9,	%f5
	fmovrdgez	%o0,	%f6,	%f2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%g1,	%i6
	edge8ln	%i1,	%o3,	%i3
	nop
	set	0x24, %g5
	ldsw	[%l7 + %g5],	%l1
	fpackfix	%f14,	%f1
	edge8	%o6,	%g2,	%g4
	edge16l	%g6,	%l0,	%i7
	fpackfix	%f4,	%f8
	move	%xcc,	%o1,	%l6
	sir	0x1558
	edge32l	%o2,	%i2,	%i4
	brgez,a	%o5,	loop_2947
	brlz,a	%o7,	loop_2948
	fone	%f6
	tpos	%icc,	0x3
loop_2947:
	srax	%g3,	%o4,	%l5
loop_2948:
	lduh	[%l7 + 0x2A],	%g5
	taddcctv	%g7,	0x1FE7,	%l3
	taddcc	%l4,	0x0E60,	%l2
	and	%i0,	%o0,	%i5
	udivcc	%g1,	0x19BC,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%i6,	%f20,	%f27
	edge32	%i3,	%l1,	%o3
	fnors	%f30,	%f15,	%f9
	smulcc	%o6,	%g4,	%g2
	subc	%l0,	%i7,	%o1
	subcc	%g6,	0x116A,	%l6
	brz	%i2,	loop_2949
	fblg,a	%fcc0,	loop_2950
	fba	%fcc1,	loop_2951
	srl	%o2,	%o5,	%o7
loop_2949:
	nop
	setx	loop_2952,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2950:
	fsrc2s	%f5,	%f22
loop_2951:
	sdiv	%g3,	0x0F99,	%o4
	movl	%icc,	%l5,	%i4
loop_2952:
	tsubcctv	%g7,	%l3,	%l4
	umulcc	%l2,	0x007C,	%i0
	srl	%g5,	%o0,	%i5
	movleu	%xcc,	%g1,	%i1
	edge32	%i3,	%i6,	%l1
	nop
	setx	loop_2953,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbug	%fcc0,	loop_2954
	te	%xcc,	0x3
	stx	%o3,	[%l7 + 0x40]
loop_2953:
	nop
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x25] %asi,	%o6
loop_2954:
	stbar
	orncc	%g2,	0x0104,	%g4
	fmuld8ulx16	%f13,	%f4,	%f2
	bgu,a,pn	%icc,	loop_2955
	movl	%xcc,	%i7,	%o1
	ldd	[%l7 + 0x38],	%f24
	ldsh	[%l7 + 0x7A],	%l0
loop_2955:
	fpsub16	%f24,	%f14,	%f2
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
	movneg	%xcc,	%g6,	%l6
	sll	%o2,	%i2,	%o7
	bge,a	%xcc,	loop_2957
loop_2956:
	brgez,a	%g3,	loop_2958
	brz,a	%o4,	loop_2959
	edge16n	%l5,	%o5,	%i4
loop_2957:
	nop
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] 0x88,	%l3,	%l4
loop_2958:
	taddcc	%g7,	%l2,	%g5
loop_2959:
	std	%f12,	[%l7 + 0x38]
	addccc	%o0,	%i5,	%i0
	fcmple16	%f14,	%f4,	%g1
	fcmple32	%f22,	%f16,	%i3
	fmovspos	%icc,	%f14,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f30,	%f30,	%f26
	fmovscs	%xcc,	%f26,	%f2
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x80,	%i1
	xnor	%i6,	%l1,	%o6
	mova	%xcc,	%o3,	%g4
	wr	%g0,	0x80,	%asi
	stha	%g2,	[%l7 + 0x6E] %asi
	tsubcc	%i7,	0x1CAB,	%l0
	fmovrsne	%g6,	%f8,	%f26
	andcc	%o1,	0x1896,	%l6
	alignaddr	%i2,	%o2,	%g3
	tcc	%xcc,	0x0
	fbn	%fcc3,	loop_2960
	call	loop_2961
	subccc	%o7,	0x1AFE,	%l5
	fmovdleu	%xcc,	%f17,	%f27
loop_2960:
	fpsub32	%f24,	%f14,	%f26
loop_2961:
	sdivcc	%o5,	0x1DB5,	%o4
	st	%f6,	[%l7 + 0x10]
	orncc	%i4,	0x07D3,	%l4
	edge8n	%g7,	%l3,	%g5
	movrlz	%o0,	0x2CE,	%i5
	srax	%l2,	%i0,	%i3
	addc	%g1,	%i1,	%i6
	fbn,a	%fcc0,	loop_2962
	fcmpgt16	%f18,	%f20,	%o6
	wr	%g0,	0x80,	%asi
	stha	%l1,	[%l7 + 0x3E] %asi
loop_2962:
	udivcc	%o3,	0x05BE,	%g2
	srlx	%i7,	%g4,	%g6
	edge32l	%l0,	%l6,	%o1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x04,	%o2,	%i2
	fcmpgt32	%f20,	%f4,	%g3
	addccc	%o7,	0x199F,	%o5
	edge32ln	%o4,	%i4,	%l5
	ldsh	[%l7 + 0x5E],	%g7
	bn,pt	%xcc,	loop_2963
	fbl,a	%fcc1,	loop_2964
	te	%xcc,	0x0
	tvs	%xcc,	0x0
loop_2963:
	fpadd32s	%f6,	%f0,	%f3
loop_2964:
	fnot2s	%f8,	%f23
	fpmerge	%f24,	%f11,	%f24
	fmovrdlz	%l4,	%f28,	%f28
	andn	%l3,	0x016D,	%o0
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x38] %asi,	%i5
	call	loop_2965
	edge8ln	%g5,	%i0,	%l2
	fmovs	%f11,	%f28
	set	0x50, %i3
	stda	%i2,	[%l7 + %i3] 0x2f
	membar	#Sync
loop_2965:
	andncc	%g1,	%i1,	%i6
	mulx	%l1,	%o3,	%g2
	sdivx	%o6,	0x0B1A,	%i7
	sir	0x0ED8
	movle	%icc,	%g6,	%l0
	taddcctv	%g4,	%l6,	%o1
	fbe	%fcc2,	loop_2966
	fmovrdgz	%i2,	%f30,	%f0
	udivx	%o2,	0x0AE0,	%o7
	tn	%icc,	0x2
loop_2966:
	fxors	%f21,	%f30,	%f25
	fmovsg	%xcc,	%f15,	%f8
	fnands	%f24,	%f31,	%f9
	alignaddrl	%g3,	%o5,	%i4
	tcc	%icc,	0x0
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x0E] %asi,	%l5
	bge,a	%xcc,	loop_2967
	sethi	0x015D,	%o4
	edge16l	%g7,	%l4,	%l3
	tle	%icc,	0x1
loop_2967:
	ldsb	[%l7 + 0x0F],	%o0
	ldstub	[%l7 + 0x2F],	%g5
	array32	%i5,	%l2,	%i3
	tneg	%xcc,	0x3
	fpsub16s	%f7,	%f26,	%f25
	fble,a	%fcc0,	loop_2968
	fornot2s	%f21,	%f21,	%f19
	movrlez	%g1,	0x159,	%i1
	fbn,a	%fcc0,	loop_2969
loop_2968:
	bvc	%xcc,	loop_2970
	edge8n	%i0,	%i6,	%o3
	edge8ln	%l1,	%g2,	%o6
loop_2969:
	prefetch	[%l7 + 0x54],	 0x3
loop_2970:
	andn	%i7,	0x03E4,	%g6
	fmovsle	%icc,	%f24,	%f1
	wr	%g0,	0x11,	%asi
	sta	%f30,	[%l7 + 0x44] %asi
	orn	%g4,	%l6,	%o1
	wr	%g0,	0x10,	%asi
	stwa	%i2,	[%l7 + 0x18] %asi
	umulcc	%o2,	%l0,	%g3
	fone	%f4
	fcmpes	%fcc2,	%f16,	%f18
	srax	%o7,	%i4,	%o5
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fors	%f18,	%f8,	%f19
	andncc	%o4,	%l5,	%l4
	fmul8x16	%f24,	%f2,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1AF0,	%l3
	fmul8x16au	%f30,	%f25,	%f2
	movcc	%xcc,	%g7,	%g5
	brlez,a	%o0,	loop_2971
	edge16n	%i5,	%l2,	%g1
	mulscc	%i3,	%i1,	%i0
	nop
	setx	loop_2972,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2971:
	subcc	%i6,	0x15D0,	%o3
	movg	%icc,	%l1,	%o6
	popc	%g2,	%g6
loop_2972:
	fexpand	%f25,	%f14
	sub	%g4,	%l6,	%i7
	tge	%icc,	0x3
	tneg	%icc,	0x1
	siam	0x3
	fbne,a	%fcc3,	loop_2973
	fmovrsne	%o1,	%f28,	%f22
	fmovdleu	%xcc,	%f3,	%f12
	std	%i2,	[%l7 + 0x50]
loop_2973:
	edge32ln	%o2,	%g3,	%o7
	ldsb	[%l7 + 0x5F],	%i4
	fpadd16s	%f13,	%f22,	%f5
	fnands	%f26,	%f19,	%f31
	sdivcc	%l0,	0x003A,	%o4
	orn	%o5,	%l5,	%l4
	tsubcctv	%l3,	%g7,	%g5
	sethi	0x1204,	%i5
	edge16l	%o0,	%g1,	%l2
	sir	0x0DCA
	fcmpgt32	%f28,	%f0,	%i3
	fbo	%fcc3,	loop_2974
	sub	%i0,	%i6,	%i1
	umul	%l1,	0x1A11,	%o3
	faligndata	%f4,	%f10,	%f12
loop_2974:
	fcmpeq16	%f12,	%f8,	%o6
	edge32	%g6,	%g2,	%l6
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x44] %asi,	%i7
	movleu	%icc,	%g4,	%i2
	udiv	%o1,	0x1E1A,	%o2
	movleu	%icc,	%o7,	%i4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x78] %asi,	%f1
	addcc	%g3,	%o4,	%l0
	fbue,a	%fcc1,	loop_2975
	ba,pt	%xcc,	loop_2976
	fpsub16	%f4,	%f22,	%f26
	edge16ln	%o5,	%l4,	%l5
loop_2975:
	xorcc	%g7,	0x030B,	%l3
loop_2976:
	std	%g4,	[%l7 + 0x10]
	fmovrdgz	%o0,	%f8,	%f26
	umulcc	%i5,	%g1,	%l2
	bcs	loop_2977
	orn	%i3,	0x1A87,	%i0
	movrgz	%i1,	0x046,	%i6
	fmovdg	%icc,	%f25,	%f20
loop_2977:
	stbar
	smulcc	%l1,	%o3,	%o6
	movneg	%icc,	%g2,	%l6
	udiv	%i7,	0x1109,	%g6
	fmovrdlez	%g4,	%f18,	%f4
	fbge,a	%fcc0,	loop_2978
	sll	%i2,	%o2,	%o1
	andn	%i4,	%g3,	%o4
	ble,a,pn	%xcc,	loop_2979
loop_2978:
	tleu	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o7,	%o5
loop_2979:
	fpmerge	%f23,	%f0,	%f2
	fcmpgt16	%f24,	%f2,	%l0
	smul	%l4,	0x1110,	%g7
	fmovdge	%icc,	%f19,	%f16
	fnegs	%f16,	%f15
	edge16	%l5,	%l3,	%g5
	movl	%xcc,	%o0,	%i5
	swap	[%l7 + 0x14],	%l2
	nop
	setx	loop_2980,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%xcc,	0x3
	set	0x18, %i1
	ldxa	[%g0 + %i1] 0x50,	%i3
loop_2980:
	tg	%xcc,	0x2
	ldsh	[%l7 + 0x6A],	%g1
	bl,a,pn	%icc,	loop_2981
	fmovsl	%icc,	%f4,	%f9
	edge16l	%i1,	%i6,	%l1
	sll	%o3,	0x06,	%i0
loop_2981:
	move	%icc,	%o6,	%l6
	fmovsn	%icc,	%f25,	%f5
	array32	%g2,	%i7,	%g6
	tge	%xcc,	0x7
	set	0x70, %l3
	lduha	[%l7 + %l3] 0x15,	%i2
	ldx	[%l7 + 0x18],	%g4
	edge32n	%o2,	%i4,	%g3
	array16	%o4,	%o1,	%o5
	for	%f2,	%f28,	%f2
	alignaddrl	%l0,	%l4,	%g7
	andcc	%o7,	%l3,	%l5
	andcc	%o0,	%i5,	%l2
	fbule,a	%fcc1,	loop_2982
	fornot2s	%f21,	%f24,	%f3
	sdiv	%g5,	0x1D48,	%i3
	edge16ln	%i1,	%i6,	%g1
loop_2982:
	fxnors	%f8,	%f5,	%f9
	fmovsl	%icc,	%f5,	%f25
	movle	%icc,	%o3,	%i0
	movneg	%xcc,	%l1,	%o6
	movgu	%icc,	%l6,	%i7
	tvc	%xcc,	0x1
	movrgz	%g6,	0x336,	%g2
	fmovscc	%icc,	%f22,	%f2
	edge16	%g4,	%o2,	%i4
	ldub	[%l7 + 0x68],	%i2
	bgu,a	%icc,	loop_2983
	ta	%icc,	0x2
	fbug	%fcc3,	loop_2984
	lduh	[%l7 + 0x48],	%g3
loop_2983:
	ldd	[%l7 + 0x40],	%o4
	udivcc	%o1,	0x19B5,	%o5
loop_2984:
	fmovsn	%icc,	%f2,	%f30
	fpsub32s	%f0,	%f31,	%f3
	bleu,a	loop_2985
	tsubcc	%l4,	0x0101,	%g7
	edge8ln	%l0,	%o7,	%l3
	membar	0x07
loop_2985:
	udivcc	%l5,	0x14D8,	%i5
	xnor	%o0,	0x0503,	%g5
	fbn,a	%fcc0,	loop_2986
	popc	%i3,	%i1
	tvc	%xcc,	0x7
	andncc	%i6,	%g1,	%o3
loop_2986:
	edge16n	%l2,	%l1,	%o6
	wr	%g0,	0x2a,	%asi
	stda	%i6,	[%l7 + 0x30] %asi
	membar	#Sync
	nop
	set	0x3E, %o5
	stb	%i0,	[%l7 + %o5]
	edge8	%i7,	%g2,	%g6
	movle	%xcc,	%o2,	%i4
	fmovrslz	%g4,	%f26,	%f5
	wr	%g0,	0xe2,	%asi
	stxa	%i2,	[%l7 + 0x58] %asi
	membar	#Sync
	brlez,a	%g3,	loop_2987
	bshuffle	%f28,	%f22,	%f24
	brgez	%o1,	loop_2988
	tne	%icc,	0x4
loop_2987:
	movrlz	%o4,	0x21E,	%o5
	ldd	[%l7 + 0x28],	%f26
loop_2988:
	sdivcc	%g7,	0x023F,	%l0
	fmovsvc	%xcc,	%f8,	%f2
	fmovdl	%icc,	%f13,	%f27
	fmovrsne	%l4,	%f18,	%f8
	swap	[%l7 + 0x78],	%o7
	movl	%icc,	%l3,	%l5
	set	0x6E, %g2
	stba	%i5,	[%l7 + %g2] 0x04
	tle	%icc,	0x5
	andcc	%o0,	0x007B,	%g5
	fcmped	%fcc0,	%f20,	%f22
	mulx	%i3,	0x1BCD,	%i6
	fbge	%fcc2,	loop_2989
	fmovspos	%xcc,	%f2,	%f7
	movne	%icc,	%g1,	%o3
	bgu	loop_2990
loop_2989:
	andncc	%i1,	%l2,	%o6
	fandnot1	%f10,	%f6,	%f12
	brz,a	%l1,	loop_2991
loop_2990:
	tgu	%xcc,	0x5
	smulcc	%l6,	0x029F,	%i7
	edge8ln	%g2,	%g6,	%i0
loop_2991:
	movpos	%icc,	%o2,	%i4
	wr	%g0,	0x80,	%asi
	sta	%f0,	[%l7 + 0x74] %asi
	bcs,a	%icc,	loop_2992
	movvc	%xcc,	%g4,	%g3
	tsubcc	%i2,	0x1B41,	%o1
	ldd	[%l7 + 0x40],	%f28
loop_2992:
	bvs,a	loop_2993
	addc	%o4,	%o5,	%g7
	array16	%l4,	%l0,	%o7
	fnot1	%f10,	%f22
loop_2993:
	swap	[%l7 + 0x18],	%l3
	tcs	%xcc,	0x1
	tn	%icc,	0x2
	tvc	%icc,	0x2
	alignaddrl	%l5,	%i5,	%o0
	sll	%g5,	%i6,	%g1
	fnot2s	%f16,	%f18
	edge8n	%i3,	%i1,	%o3
	or	%l2,	0x142F,	%o6
	fbuge	%fcc3,	loop_2994
	fmovd	%f18,	%f20
	sll	%l6,	0x0E,	%l1
	brlz,a	%i7,	loop_2995
loop_2994:
	popc	%g6,	%i0
	sdiv	%g2,	0x18BA,	%o2
	fmovdleu	%icc,	%f28,	%f0
loop_2995:
	edge32n	%i4,	%g3,	%g4
	fnot2	%f8,	%f10
	or	%i2,	%o1,	%o4
	tcc	%xcc,	0x3
	andncc	%g7,	%l4,	%l0
	movleu	%icc,	%o7,	%o5
	bl,pn	%icc,	loop_2996
	nop
	setx	loop_2997,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge32	%l5,	%l3,	%o0
	ldd	[%l7 + 0x78],	%g4
loop_2996:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2997:
	xnor	%i6,	0x1286,	%i5
	tcs	%xcc,	0x3
	tleu	%xcc,	0x4
	orcc	%g1,	%i1,	%i3
	popc	%l2,	%o3
	bpos	%icc,	loop_2998
	membar	0x75
	movrne	%o6,	%l1,	%l6
	srl	%i7,	%g6,	%g2
loop_2998:
	movg	%xcc,	%i0,	%o2
	movg	%xcc,	%g3,	%g4
	edge8ln	%i4,	%o1,	%i2
	edge8	%o4,	%l4,	%l0
	fbne,a	%fcc1,	loop_2999
	tgu	%icc,	0x5
	mulscc	%g7,	0x01B4,	%o5
	fbu,a	%fcc0,	loop_3000
loop_2999:
	subcc	%l5,	%o7,	%l3
	tvc	%icc,	0x2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x0c,	%o0,	%i6
loop_3000:
	nop
	set	0x10, %g3
	stxa	%g5,	[%l7 + %g3] 0x04
	fpadd16	%f24,	%f2,	%f2
	set	0x40, %i6
	stda	%f16,	[%l7 + %i6] 0x10
	fmul8x16al	%f6,	%f23,	%f12
	fmul8x16	%f15,	%f16,	%f2
	lduw	[%l7 + 0x3C],	%g1
	movl	%icc,	%i5,	%i3
	fpadd16s	%f25,	%f17,	%f10
	edge8n	%l2,	%i1,	%o6
	fmovsge	%icc,	%f0,	%f1
	sir	0x0685
	orcc	%l1,	0x0467,	%l6
	movrgz	%i7,	%g6,	%g2
	ldd	[%l7 + 0x10],	%f2
	set	0x40, %g4
	stxa	%i0,	[%l7 + %g4] 0x2b
	membar	#Sync
	brgez,a	%o3,	loop_3001
	fmovspos	%icc,	%f0,	%f17
	fnot2	%f16,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3001:
	fcmple16	%f22,	%f28,	%o2
	srl	%g3,	0x15,	%i4
	movrgez	%g4,	0x390,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x08] %asi,	%i2
	tl	%xcc,	0x4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x08] %asi,	%f7
	ta	%xcc,	0x6
	array16	%o4,	%l0,	%g7
	srax	%o5,	0x1D,	%l4
	ble,pt	%icc,	loop_3002
	edge32	%o7,	%l5,	%o0
	orn	%i6,	0x14B5,	%g5
	movge	%icc,	%l3,	%g1
loop_3002:
	edge32n	%i3,	%l2,	%i1
	sllx	%o6,	0x15,	%l1
	tcs	%xcc,	0x1
	bne,a,pt	%xcc,	loop_3003
	movle	%xcc,	%i5,	%l6
	edge32	%g6,	%i7,	%g2
	fandnot1s	%f19,	%f30,	%f14
loop_3003:
	taddcc	%i0,	0x073F,	%o2
	edge8l	%g3,	%o3,	%g4
	tsubcctv	%i4,	0x1D14,	%o1
	wr	%g0,	0x0c,	%asi
	sta	%f11,	[%l7 + 0x0C] %asi
	edge8n	%i2,	%l0,	%g7
	ldx	[%l7 + 0x20],	%o5
	fsrc2s	%f12,	%f4
	fbue	%fcc2,	loop_3004
	andncc	%l4,	%o7,	%o4
	set	0x70, %o7
	sta	%f0,	[%l7 + %o7] 0x80
loop_3004:
	taddcctv	%l5,	%i6,	%g5
	fmovsgu	%xcc,	%f19,	%f31
	fpadd32s	%f11,	%f31,	%f24
	bcc,a,pt	%icc,	loop_3005
	edge16l	%o0,	%l3,	%i3
	fornot2s	%f24,	%f15,	%f24
	mulscc	%l2,	%g1,	%i1
loop_3005:
	srlx	%l1,	0x0D,	%o6
	fmovda	%xcc,	%f21,	%f12
	sdiv	%l6,	0x09EB,	%g6
	xnor	%i5,	0x09DD,	%i7
	sdiv	%i0,	0x0124,	%o2
	st	%f24,	[%l7 + 0x4C]
	umulcc	%g2,	%o3,	%g4
	tneg	%icc,	0x4
	brlz,a	%i4,	loop_3006
	bvc	%xcc,	loop_3007
	swap	[%l7 + 0x40],	%o1
	movcc	%xcc,	%g3,	%l0
loop_3006:
	call	loop_3008
loop_3007:
	fcmpne32	%f20,	%f26,	%i2
	sdivcc	%o5,	0x0AC6,	%g7
	array8	%o7,	%o4,	%l4
loop_3008:
	andcc	%l5,	0x1B9D,	%g5
	array8	%i6,	%o0,	%l3
	addccc	%i3,	0x16A2,	%g1
	edge16n	%i1,	%l2,	%l1
	brnz,a	%o6,	loop_3009
	xor	%g6,	0x0E07,	%l6
	tcc	%icc,	0x1
	andncc	%i5,	%i7,	%i0
loop_3009:
	edge32	%o2,	%g2,	%o3
	srax	%g4,	0x01,	%o1
	fpsub32s	%f3,	%f14,	%f7
	udivcc	%i4,	0x0468,	%g3
	ldstub	[%l7 + 0x33],	%i2
	subccc	%o5,	%l0,	%o7
	addccc	%g7,	0x0871,	%l4
	sdivx	%l5,	0x0207,	%g5
	fmuld8sux16	%f27,	%f5,	%f14
	bcc,a,pn	%xcc,	loop_3010
	umul	%i6,	0x117E,	%o4
	tpos	%icc,	0x2
	fmovrsgz	%o0,	%f21,	%f25
loop_3010:
	fandnot1	%f26,	%f20,	%f8
	taddcctv	%i3,	0x1114,	%g1
	umul	%l3,	0x0280,	%l2
	movcc	%xcc,	%l1,	%o6
	movcc	%xcc,	%i1,	%l6
	brgez,a	%g6,	loop_3011
	movge	%xcc,	%i7,	%i5
	fpmerge	%f23,	%f0,	%f10
	tgu	%xcc,	0x4
loop_3011:
	fcmple16	%f16,	%f0,	%o2
	edge8	%i0,	%o3,	%g4
	brnz	%o1,	loop_3012
	subcc	%g2,	%i4,	%i2
	wr	%g0,	0x19,	%asi
	stba	%g3,	[%l7 + 0x50] %asi
loop_3012:
	sllx	%l0,	0x1D,	%o7
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x14] %asi,	%o5
	xor	%l4,	0x0E88,	%g7
	fabsd	%f26,	%f2
	wr	%g0,	0x2b,	%asi
	stba	%l5,	[%l7 + 0x6B] %asi
	membar	#Sync
	tleu	%icc,	0x1
	edge32ln	%g5,	%i6,	%o4
	fmovdl	%xcc,	%f3,	%f12
	movn	%icc,	%o0,	%g1
	array32	%l3,	%i3,	%l1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o6,	%i1
	tvc	%xcc,	0x6
	xor	%l2,	0x00AA,	%g6
	tl	%xcc,	0x4
	ta	%xcc,	0x6
	tle	%xcc,	0x3
	addc	%i7,	0x1653,	%i5
	stw	%o2,	[%l7 + 0x60]
	movvc	%xcc,	%i0,	%l6
	fone	%f16
	bpos,pt	%icc,	loop_3013
	smul	%o3,	%o1,	%g4
	tn	%xcc,	0x3
	fxors	%f23,	%f13,	%f0
loop_3013:
	ldub	[%l7 + 0x77],	%g2
	tge	%icc,	0x7
	edge8l	%i2,	%g3,	%l0
	movl	%icc,	%o7,	%o5
	and	%i4,	0x1246,	%g7
	sdivcc	%l4,	0x10B6,	%l5
	edge32ln	%i6,	%g5,	%o0
	bleu,a	loop_3014
	popc	%g1,	%o4
	tgu	%icc,	0x2
	set	0x30, %i0
	lduwa	[%l7 + %i0] 0x0c,	%i3
loop_3014:
	xnorcc	%l1,	0x1C53,	%o6
	smul	%i1,	0x1F8F,	%l2
	tcs	%xcc,	0x6
	ldsb	[%l7 + 0x76],	%l3
	movge	%xcc,	%i7,	%i5
	sdivx	%g6,	0x1530,	%i0
	fmovrsgez	%o2,	%f14,	%f7
	nop
	setx	loop_3015,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	std	%i6,	[%l7 + 0x50]
	tsubcctv	%o3,	%o1,	%g4
	fmovrdgez	%i2,	%f18,	%f26
loop_3015:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x50] %asi,	%g2
	movrgz	%l0,	%g2,	%o5
	lduw	[%l7 + 0x58],	%o7
	set	0x30, %g6
	ldda	[%l7 + %g6] 0x2c,	%i4
	fcmpd	%fcc0,	%f20,	%f0
	fpadd32	%f10,	%f20,	%f28
	fmovsgu	%xcc,	%f16,	%f20
	fmovrde	%l4,	%f30,	%f22
	st	%f6,	[%l7 + 0x78]
	array8	%l5,	%i6,	%g7
	xnorcc	%o0,	0x1277,	%g1
	ldd	[%l7 + 0x20],	%g4
	st	%f16,	[%l7 + 0x78]
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x40] %asi,	%f5
	sir	0x0C3B
	set	0x70, %g7
	lda	[%l7 + %g7] 0x04,	%f17
	xor	%i3,	%l1,	%o4
	tvc	%xcc,	0x4
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x61] %asi,	%i1
	xnor	%l2,	%l3,	%o6
	movvs	%icc,	%i5,	%i7
	fmovsneg	%xcc,	%f26,	%f17
	udivcc	%g6,	0x096D,	%o2
	fbue	%fcc3,	loop_3016
	movn	%xcc,	%l6,	%o3
	srlx	%i0,	%o1,	%g4
	ba	loop_3017
loop_3016:
	andcc	%g3,	%l0,	%g2
	or	%i2,	%o7,	%o5
	move	%icc,	%l4,	%i4
loop_3017:
	fone	%f4
	srl	%i6,	0x0A,	%l5
	fbe,a	%fcc3,	loop_3018
	fmovrslz	%g7,	%f12,	%f17
	set	0x18, %l5
	stwa	%g1,	[%l7 + %l5] 0x88
loop_3018:
	edge32n	%o0,	%i3,	%l1
	flush	%l7 + 0x14
	xnor	%o4,	0x09AD,	%g5
	fpadd16s	%f26,	%f14,	%f0
	addcc	%i1,	%l2,	%o6
	alignaddrl	%i5,	%l3,	%i7
	taddcc	%g6,	0x1EE1,	%o2
	movle	%icc,	%o3,	%i0
	sdivcc	%l6,	0x1F85,	%o1
	ldd	[%l7 + 0x48],	%g4
	sethi	0x0682,	%l0
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x11,	%g2,	%g3
	fpsub32s	%f31,	%f27,	%f20
	for	%f4,	%f24,	%f18
	fmovsle	%icc,	%f17,	%f17
	srl	%o7,	%o5,	%l4
	sth	%i4,	[%l7 + 0x7E]
	ldd	[%l7 + 0x60],	%i6
	ba,a	%icc,	loop_3019
	fmovdvs	%icc,	%f30,	%f18
	subccc	%l5,	%i2,	%g1
	stx	%o0,	[%l7 + 0x38]
loop_3019:
	fbge,a	%fcc0,	loop_3020
	xorcc	%g7,	0x1C54,	%i3
	fble	%fcc2,	loop_3021
	fmovsne	%xcc,	%f8,	%f18
loop_3020:
	edge8l	%l1,	%o4,	%i1
	movcs	%xcc,	%g5,	%l2
loop_3021:
	st	%f16,	[%l7 + 0x2C]
	orncc	%i5,	0x09D0,	%o6
	mulx	%l3,	0x1C11,	%g6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%i7
	fpadd32s	%f15,	%f31,	%f28
	tpos	%icc,	0x0
	mova	%xcc,	%o3,	%l6
	bvs,a,pn	%icc,	loop_3022
	taddcc	%o1,	%i0,	%l0
	ldstub	[%l7 + 0x62],	%g4
	set	0x4C, %l4
	lduwa	[%l7 + %l4] 0x0c,	%g3
loop_3022:
	bvc	%xcc,	loop_3023
	smulcc	%o7,	0x0BD0,	%g2
	stb	%o5,	[%l7 + 0x17]
	move	%icc,	%l4,	%i6
loop_3023:
	nop
	set	0x5C, %i2
	stwa	%l5,	[%l7 + %i2] 0x2f
	membar	#Sync
	sra	%i4,	%g1,	%o0
	fnands	%f18,	%f19,	%f26
	movg	%xcc,	%g7,	%i2
	sdivx	%l1,	0x0F03,	%i3
	subcc	%o4,	%i1,	%g5
	move	%icc,	%i5,	%l2
	fornot1	%f16,	%f14,	%f8
	fcmpeq32	%f12,	%f8,	%l3
	movvs	%xcc,	%g6,	%o2
	fmovrdne	%i7,	%f12,	%f14
	fnegs	%f22,	%f9
	movl	%xcc,	%o3,	%l6
	ldsb	[%l7 + 0x15],	%o1
	edge16ln	%o6,	%l0,	%g4
	fnegd	%f10,	%f22
	xnor	%i0,	%o7,	%g3
	edge8l	%o5,	%l4,	%i6
	subc	%g2,	0x06DF,	%l5
	udiv	%i4,	0x0169,	%g1
	movg	%icc,	%g7,	%o0
	tcc	%xcc,	0x7
	edge32l	%i2,	%l1,	%o4
	sethi	0x0EA0,	%i3
	movg	%icc,	%i1,	%g5
	fsrc1s	%f23,	%f26
	edge8n	%l2,	%i5,	%g6
	fblg,a	%fcc0,	loop_3024
	edge32	%l3,	%i7,	%o2
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
loop_3024:
	fxor	%f26,	%f18,	%f22
	edge8n	%o3,	%o1,	%o6
	sethi	0x06DF,	%g4
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x50] %asi,	%f3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tl	%icc,	0x5
	tcc	%xcc,	0x1
	edge16ln	%i0,	%l0,	%g3
	nop
	setx loop_3025, %l0, %l1
	jmpl %l1, %o5
	bg,pt	%icc,	loop_3026
	fmovdvs	%icc,	%f7,	%f5
loop_3025:
	nop

loop_3026:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2838
!	Type x   	: 1288
!	Type cti   	: 3026
!	Type f   	: 4468
!	Type i   	: 13380
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x95B5F482
.word 0x6DECBC79
.word 0x38408FFB
.word 0x420BF569
.word 0xA93A3DAE
.word 0x30A9B9A4
.word 0xAEED4176
.word 0x88BF17C5
.word 0x57375181
.word 0xE58A7249
.word 0x3BFEC82F
.word 0xB8E5825C
.word 0xB491B31B
.word 0x53C994CE
.word 0x5F6E0442
.word 0x8F65F556
.word 0x954F9B81
.word 0x7BC3EDA8
.word 0x68BB93A8
.word 0x3AB710E2
.word 0xBCDF3603
.word 0x0D9563B9
.word 0x51A37865
.word 0x2F036D24
.word 0xEA970A62
.word 0x7DE83F01
.word 0x5D6F150D
.word 0xCC8ADA95
.word 0x937786DE
.word 0x1D5922D2
.word 0xAE708B37
.word 0xF69539BC
.word 0x8872BA70
.word 0x5E7D82E1
.word 0xDBB754CB
.word 0x6266BA67
.word 0xE850382C
.word 0xE84E0AF4
.word 0x69EBFBCE
.word 0xCF60353F
.word 0xB734147A
.word 0xA1B14A90
.word 0xCA872F94
.word 0x4E3ECEF6
.word 0xFEA57398
.word 0x02986C4E
.word 0x3DD1ABAD
.word 0x253812A8
.word 0xF1636C9B
.word 0x52EE5819
.word 0x2538F818
.word 0xFC6B7994
.word 0xC19082CE
.word 0x41AF7CB5
.word 0x2631F551
.word 0xB0E30303
.word 0x7E70D0A4
.word 0x4C31D546
.word 0x08A35AC5
.word 0x30148629
.word 0xCD4B90D7
.word 0xA7B2656B
.word 0xC1073935
.word 0xE8951440
.end
