/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f17.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f17.s,v 1.1 2007/05/11 17:22:27 drp Exp $"
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
	setx	0x9AF3938FA047A874,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0x9,	%g2
	set	0x3,	%g3
	set	0x8,	%g4
	set	0xE,	%g5
	set	0x8,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x2,	%i1
	set	-0x8,	%i2
	set	-0xC,	%i3
	set	-0x9,	%i4
	set	-0xC,	%i5
	set	-0xB,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x0F6C56AC,	%l0
	set	0x1D25491B,	%l1
	set	0x264AB5BA,	%l2
	set	0x686C4353,	%l3
	set	0x40E3DD41,	%l4
	set	0x2A690B69,	%l5
	set	0x5F20CB0C,	%l6
	!# Output registers
	set	-0x13E2,	%o0
	set	-0x1453,	%o1
	set	-0x14CA,	%o2
	set	0x04AC,	%o3
	set	0x07D6,	%o4
	set	-0x13A4,	%o5
	set	0x0593,	%o6
	set	0x0EBE,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x37764B4AF831BE22)
	INIT_TH_FP_REG(%l7,%f2,0xC9BA9007E082B599)
	INIT_TH_FP_REG(%l7,%f4,0xAC7BD06E8CE693E1)
	INIT_TH_FP_REG(%l7,%f6,0xDF9384401A231CAC)
	INIT_TH_FP_REG(%l7,%f8,0x64EBE2E0BF5EC5C5)
	INIT_TH_FP_REG(%l7,%f10,0xAE7D538A09EB840C)
	INIT_TH_FP_REG(%l7,%f12,0xCD2F5113C7DA0980)
	INIT_TH_FP_REG(%l7,%f14,0xF249918943AA7CFC)
	INIT_TH_FP_REG(%l7,%f16,0xE132AAC11B7ABBC1)
	INIT_TH_FP_REG(%l7,%f18,0x6F8299DCD7BBA688)
	INIT_TH_FP_REG(%l7,%f20,0xC0C466C7B4149F61)
	INIT_TH_FP_REG(%l7,%f22,0xC3E138A80749923C)
	INIT_TH_FP_REG(%l7,%f24,0x181B1B39D72AAB02)
	INIT_TH_FP_REG(%l7,%f26,0xB0F92BD6F9579335)
	INIT_TH_FP_REG(%l7,%f28,0x847518B5CAB776D5)
	INIT_TH_FP_REG(%l7,%f30,0x40B6E05B29D4F985)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	ldsh	[%l7 + 0x3C],	%l0
	tl	%xcc,	0x3
	tcs	%icc,	0x7
	bne,a,pn	%icc,	loop_1
	edge8l	%o3,	%i1,	%g2
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x10] %asi,	%g7
loop_1:
	std	%f28,	[%l7 + 0x30]
	movrgz	%g5,	0x052,	%o4
	fmovdvs	%icc,	%f0,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i3,	0x191A,	%l4
	orcc	%o7,	%o2,	%i4
	xor	%i7,	0x1164,	%g6
	subcc	%o1,	%i0,	%i6
	alignaddr	%o5,	%l1,	%l3
	edge16	%g4,	%l6,	%g1
	subcc	%l2,	%o0,	%l5
	brnz	%g3,	loop_2
	lduw	[%l7 + 0x34],	%i5
	fornot1	%f18,	%f2,	%f26
	xorcc	%o6,	0x120A,	%i2
loop_2:
	xor	%l0,	0x1F6D,	%o3
	fmovdl	%xcc,	%f18,	%f4
	udiv	%g2,	0x1E0E,	%i1
	movrgz	%g5,	0x297,	%o4
	fabsd	%f4,	%f2
	nop
	setx	0x0D3F7FCC85D0BD31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f16
	sra	%g7,	0x02,	%i3
	edge8ln	%o7,	%o2,	%i4
	fmuld8sux16	%f25,	%f28,	%f20
	tvc	%xcc,	0x7
	ble,a,pt	%xcc,	loop_3
	tpos	%xcc,	0x2
	fabss	%f1,	%f6
	tg	%xcc,	0x6
loop_3:
	xorcc	%i7,	%l4,	%g6
	edge8n	%o1,	%i6,	%o5
	brlz	%l1,	loop_4
	udivx	%i0,	0x0D56,	%g4
	sll	%l6,	0x06,	%l3
	fnors	%f8,	%f0,	%f18
loop_4:
	nop
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x14] %asi,	%l2
	lduw	[%l7 + 0x68],	%o0
	nop
	setx	loop_5,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%l5,	0x0F68,	%g1
	xor	%g3,	0x1B44,	%o6
	fmovdg	%icc,	%f27,	%f9
loop_5:
	sth	%i2,	[%l7 + 0x7C]
	fmovrslz	%i5,	%f20,	%f19
	tg	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x28] %asi,	%l0
	taddcc	%g2,	%i1,	%o3
	udivcc	%o4,	0x17B3,	%g5
	fbn,a	%fcc3,	loop_6
	ta	%xcc,	0x0
	ba,a	loop_7
	popc	%g7,	%o7
loop_6:
	sdivcc	%o2,	0x0F21,	%i4
	fmovsleu	%xcc,	%f1,	%f4
loop_7:
	movrlez	%i7,	%l4,	%i3
	edge32l	%o1,	%i6,	%g6
	fpadd16s	%f0,	%f24,	%f0
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%o5
	tn	%icc,	0x6
	fmovdvc	%icc,	%f24,	%f15
	movcc	%xcc,	%l1,	%i0
	set	0x40, %i0
	stda	%f16,	[%l7 + %i0] 0xf9
	membar	#Sync
	movle	%icc,	%l6,	%l3
	lduh	[%l7 + 0x64],	%g4
	movgu	%xcc,	%o0,	%l5
	edge8l	%l2,	%g3,	%g1
	addc	%o6,	0x00E5,	%i5
	edge32n	%l0,	%g2,	%i2
	fmovdge	%icc,	%f9,	%f13
	array8	%i1,	%o3,	%g5
	fones	%f26
	brlz	%o4,	loop_8
	fnot2s	%f20,	%f4
	umul	%o7,	%g7,	%o2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x10] %asi,	%i7
loop_8:
	lduw	[%l7 + 0x58],	%l4
	movvs	%xcc,	%i3,	%o1
	movg	%xcc,	%i6,	%g6
	movvc	%icc,	%i4,	%l1
	movgu	%icc,	%o5,	%i0
	subc	%l3,	0x187E,	%l6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%g4
	movleu	%icc,	%l5,	%o0
	addcc	%g3,	0x0234,	%l2
	movrlez	%o6,	%i5,	%g1
	brz	%l0,	loop_9
	fnegs	%f12,	%f28
	fpack16	%f2,	%f1
	edge16n	%g2,	%i2,	%i1
loop_9:
	nop
	fitod	%f12,	%f20
	xnor	%o3,	%o4,	%o7
	stb	%g7,	[%l7 + 0x76]
	umulcc	%o2,	0x0647,	%i7
	fabss	%f14,	%f26
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x2C] %asi,	%f21
	movcs	%xcc,	%l4,	%i3
	alignaddr	%g5,	%i6,	%g6
	fmovrdgz	%o1,	%f2,	%f2
	array16	%l1,	%o5,	%i4
	nop
	set	0x70, %l2
	ldsw	[%l7 + %l2],	%l3
	orcc	%i0,	0x07A5,	%l6
	orncc	%g4,	%l5,	%o0
	bleu,a	%icc,	loop_10
	movvs	%icc,	%g3,	%o6
	swap	[%l7 + 0x24],	%i5
	taddcctv	%g1,	0x0BC6,	%l2
loop_10:
	edge16n	%l0,	%g2,	%i2
	edge16	%i1,	%o3,	%o7
	array32	%g7,	%o4,	%o2
	ta	%icc,	0x1
	call	loop_11
	be,a,pn	%icc,	loop_12
	ldd	[%l7 + 0x08],	%i6
	movcs	%icc,	%l4,	%g5
loop_11:
	fmul8sux16	%f4,	%f16,	%f10
loop_12:
	movrne	%i6,	%i3,	%o1
	movgu	%icc,	%l1,	%g6
	add	%l7,	0x60,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%i4
	std	%f20,	[%l7 + 0x30]
	fexpand	%f19,	%f4
	udivcc	%i0,	0x01F8,	%l6
	brgz,a	%g4,	loop_13
	movl	%xcc,	%l5,	%o0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x88,	%f16
loop_13:
	mova	%xcc,	%g3,	%o6
	movl	%xcc,	%i5,	%g1
	mova	%xcc,	%l3,	%l0
	fpsub32	%f0,	%f18,	%f2
	tvc	%xcc,	0x6
	taddcc	%g2,	0x19D0,	%l2
	prefetch	[%l7 + 0x28],	 0x0
	fmovs	%f24,	%f27
	fxor	%f26,	%f20,	%f24
	move	%icc,	%i2,	%o3
	movneg	%icc,	%o7,	%g7
	bneg,a,pt	%xcc,	loop_14
	tsubcctv	%o4,	%o2,	%i1
	subc	%l4,	0x02A7,	%i7
	nop
	fitod	%f4,	%f14
	fdtoi	%f14,	%f5
loop_14:
	fbug,a	%fcc3,	loop_15
	sethi	0x002C,	%i6
	movl	%xcc,	%g5,	%i3
	umul	%l1,	%g6,	%o5
loop_15:
	orn	%o1,	%i4,	%l6
	movn	%icc,	%i0,	%l5
	umul	%o0,	0x17C7,	%g3
	fnegd	%f18,	%f18
	mulx	%g4,	%o6,	%i5
	edge32l	%g1,	%l0,	%g2
	movne	%icc,	%l3,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x0
	tvc	%icc,	0x3
	addcc	%o3,	0x1381,	%l2
	movvs	%xcc,	%g7,	%o7
	sdivx	%o2,	0x10FD,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x5C, %o5
	ldswa	[%l7 + %o5] 0x18,	%o4
	andcc	%l4,	0x104C,	%i7
	ldstub	[%l7 + 0x08],	%g5
	addccc	%i3,	0x13FE,	%i6
	sethi	0x0DC6,	%l1
	array8	%o5,	%o1,	%g6
	wr	%g0,	0x2a,	%asi
	stxa	%i4,	[%l7 + 0x28] %asi
	membar	#Sync
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x1e,	%f16
	umul	%l6,	%i0,	%o0
	nop
	fitod	%f8,	%f18
	fdtoi	%f18,	%f5
	nop
	fitos	%f13,	%f18
	fstox	%f18,	%f14
	sdiv	%l5,	0x1CC8,	%g4
	subccc	%g3,	0x0BCB,	%i5
	smulcc	%o6,	%g1,	%l0
	fbl,a	%fcc0,	loop_16
	pdist	%f24,	%f6,	%f14
	sdivcc	%l3,	0x1014,	%i2
	fbne,a	%fcc0,	loop_17
loop_16:
	andncc	%g2,	%l2,	%g7
	fbuge,a	%fcc2,	loop_18
	fpsub32	%f8,	%f22,	%f16
loop_17:
	fmul8x16al	%f22,	%f31,	%f16
	ldsb	[%l7 + 0x5C],	%o3
loop_18:
	fabss	%f18,	%f3
	movrlez	%o7,	%i1,	%o2
	fones	%f6
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x60] %asi,	%o4
	array8	%i7,	%l4,	%g5
	subcc	%i3,	%i6,	%l1
	edge8l	%o5,	%g6,	%o1
	nop
	setx	loop_19,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpadd32	%f0,	%f16,	%f18
	orn	%l6,	%i4,	%o0
	for	%f14,	%f20,	%f24
loop_19:
	ta	%xcc,	0x4
	fandnot1s	%f0,	%f15,	%f26
	st	%f7,	[%l7 + 0x2C]
	fmovrse	%l5,	%f17,	%f8
	tne	%xcc,	0x1
	bn,a,pt	%xcc,	loop_20
	movn	%icc,	%i0,	%g4
	edge16n	%g3,	%o6,	%i5
	fmovrdne	%g1,	%f4,	%f16
loop_20:
	ldd	[%l7 + 0x18],	%l2
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%i2
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f12
	nop
	setx	0x37DD15F6E054A862,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fbu	%fcc2,	loop_21
	smul	%l0,	0x16EC,	%g2
	tg	%xcc,	0x1
	fpadd16s	%f7,	%f7,	%f6
loop_21:
	orcc	%l2,	%g7,	%o3
	ldsh	[%l7 + 0x68],	%o7
	edge8	%i1,	%o4,	%i7
	fmul8sux16	%f8,	%f22,	%f8
	edge16l	%l4,	%g5,	%o2
	tcs	%icc,	0x5
	movre	%i6,	0x3E9,	%i3
	edge8n	%l1,	%o5,	%o1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	mulscc	%i4,	0x012F,	%g6
	xor	%o0,	0x0F4E,	%l5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x10] %asi,	%g4
	tge	%icc,	0x5
	fbul,a	%fcc3,	loop_22
	ld	[%l7 + 0x0C],	%f30
	xorcc	%g3,	0x0AF9,	%i0
	tvc	%xcc,	0x7
loop_22:
	movrlez	%o6,	0x14F,	%i5
	subc	%g1,	%l3,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i2,	%l2,	%g7
	bleu,a	loop_23
	nop
	fitos	%f7,	%f12
	array8	%o3,	%g2,	%o7
	tleu	%xcc,	0x3
loop_23:
	fbne,a	%fcc2,	loop_24
	movleu	%xcc,	%o4,	%i7
	movpos	%xcc,	%l4,	%i1
	ble,a	%icc,	loop_25
loop_24:
	popc	%o2,	%g5
	ldd	[%l7 + 0x38],	%i2
	prefetch	[%l7 + 0x60],	 0x3
loop_25:
	fmovrslez	%l1,	%f16,	%f16
	fands	%f18,	%f4,	%f12
	sra	%o5,	0x12,	%i6
	sll	%o1,	0x17,	%i4
	edge8	%l6,	%o0,	%l5
	sdiv	%g6,	0x16B2,	%g4
	tpos	%xcc,	0x3
	fornot1	%f2,	%f2,	%f12
	stbar
	subcc	%g3,	0x1EF2,	%i0
	call	loop_26
	smulcc	%o6,	0x0D34,	%i5
	fmovsvs	%icc,	%f15,	%f28
	subc	%l3,	%l0,	%i2
loop_26:
	fcmpgt16	%f28,	%f20,	%g1
	move	%icc,	%l2,	%o3
	nop
	setx	0x519C9E4E0F031FC1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xBF158B1943D3EE40,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f14,	%f16
	taddcc	%g2,	0x01F1,	%o7
	edge32n	%o4,	%g7,	%i7
	te	%xcc,	0x0
	set	0x54, %l5
	stwa	%i1,	[%l7 + %l5] 0x81
	edge8n	%o2,	%l4,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba,pn	%xcc,	loop_27
	add	%i3,	0x15B7,	%l1
	sir	0x0A40
	fabsd	%f8,	%f20
loop_27:
	movge	%xcc,	%i6,	%o5
	tge	%icc,	0x6
	edge8	%o1,	%l6,	%i4
	array8	%l5,	%o0,	%g4
	subcc	%g3,	0x01D1,	%g6
	sethi	0x08C2,	%o6
	fbug	%fcc2,	loop_28
	edge16l	%i5,	%i0,	%l0
	movvs	%icc,	%l3,	%i2
	edge32l	%l2,	%g1,	%o3
loop_28:
	sdiv	%o7,	0x1FCA,	%g2
	fmovrslez	%g7,	%f8,	%f31
	bleu,pt	%xcc,	loop_29
	sub	%o4,	0x1852,	%i7
	brgz	%i1,	loop_30
	fmovsneg	%xcc,	%f10,	%f28
loop_29:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x42] %asi,	%l4
loop_30:
	edge8	%g5,	%i3,	%o2
	membar	0x28
	array8	%i6,	%l1,	%o5
	ldx	[%l7 + 0x68],	%l6
	andn	%i4,	0x0AE2,	%o1
	fandnot2	%f28,	%f6,	%f10
	orn	%l5,	%o0,	%g3
	edge16ln	%g6,	%g4,	%i5
	sra	%o6,	%l0,	%i0
	edge16ln	%i2,	%l2,	%l3
	movl	%xcc,	%g1,	%o3
	fbu,a	%fcc2,	loop_31
	tpos	%icc,	0x0
	movle	%icc,	%g2,	%o7
	bshuffle	%f30,	%f4,	%f22
loop_31:
	tne	%xcc,	0x5
	fmovrslz	%g7,	%f30,	%f20
	sir	0x16F3
	sra	%o4,	%i7,	%l4
	mulscc	%i1,	0x1CA7,	%g5
	sethi	0x1858,	%i3
	tcs	%xcc,	0x5
	nop
	fitos	%f12,	%f28
	fstox	%f28,	%f24
	call	loop_32
	bvc	loop_33
	ta	%xcc,	0x7
	popc	0x18F4,	%o2
loop_32:
	stw	%l1,	[%l7 + 0x08]
loop_33:
	tpos	%xcc,	0x5
	fmul8ulx16	%f12,	%f10,	%f0
	movvs	%icc,	%o5,	%l6
	tsubcctv	%i4,	%i6,	%l5
	edge8ln	%o1,	%g3,	%o0
	set	0x14, %o7
	sta	%f12,	[%l7 + %o7] 0x04
	mulx	%g6,	0x0F82,	%g4
	movneg	%xcc,	%o6,	%l0
	array8	%i0,	%i5,	%i2
	fmul8x16	%f0,	%f16,	%f2
	mulscc	%l3,	%g1,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbe	%fcc3,	loop_34
	subc	%l2,	0x094B,	%o7
	nop
	fitod	%f25,	%f28
	udiv	%g2,	0x18C3,	%g7
loop_34:
	edge16l	%o4,	%i7,	%i1
	fpackfix	%f10,	%f11
	fbne,a	%fcc3,	loop_35
	xnor	%g5,	%l4,	%i3
	st	%f3,	[%l7 + 0x40]
	edge32n	%l1,	%o2,	%l6
loop_35:
	tl	%xcc,	0x1
	xnorcc	%i4,	0x135C,	%i6
	stb	%l5,	[%l7 + 0x4A]
	nop
	setx	0x1AB700375FF8B357,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x467A6313D2A69D67,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f2,	%f14
	fmovscs	%xcc,	%f8,	%f10
	fmovd	%f2,	%f18
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x44] %asi,	%o5
	andn	%o1,	%g3,	%o0
	fmovrdgz	%g4,	%f10,	%f28
	edge32n	%o6,	%l0,	%g6
	and	%i0,	0x1F35,	%i2
	bne,a,pt	%icc,	loop_36
	alignaddrl	%l3,	%g1,	%i5
	movrlez	%o3,	0x159,	%l2
	fbuge,a	%fcc2,	loop_37
loop_36:
	tg	%icc,	0x4
	std	%f20,	[%l7 + 0x10]
	edge32n	%g2,	%g7,	%o7
loop_37:
	andncc	%o4,	%i7,	%g5
	edge32n	%i1,	%l4,	%i3
	edge8ln	%o2,	%l1,	%i4
	fcmple32	%f8,	%f18,	%l6
	be	%icc,	loop_38
	fbug	%fcc0,	loop_39
	orcc	%l5,	0x1E5D,	%i6
	movpos	%xcc,	%o1,	%o5
loop_38:
	subcc	%o0,	0x010E,	%g3
loop_39:
	movrgz	%o6,	0x072,	%l0
	edge16ln	%g4,	%g6,	%i2
	srl	%i0,	%g1,	%i5
	nop
	fitod	%f6,	%f10
	fdtoi	%f10,	%f26
	movrlez	%l3,	%o3,	%l2
	fmovd	%f12,	%f30
	andcc	%g7,	0x0687,	%o7
	movg	%icc,	%o4,	%i7
	move	%xcc,	%g5,	%i1
	taddcctv	%l4,	%g2,	%o2
	fmovsgu	%icc,	%f23,	%f14
	orncc	%i3,	%l1,	%i4
	edge16n	%l5,	%l6,	%o1
	orcc	%i6,	0x0CD5,	%o0
	fors	%f18,	%f2,	%f16
	srlx	%g3,	%o6,	%o5
	addcc	%g4,	%g6,	%l0
	fmovdn	%icc,	%f10,	%f18
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%i2,	%i0
	popc	0x15A2,	%g1
	xorcc	%i5,	%l3,	%l2
	nop
	fitod	%f28,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o3,	0x022B,	%o7
	taddcc	%g7,	%i7,	%o4
	movleu	%icc,	%i1,	%g5
	movvs	%icc,	%g2,	%l4
	edge8	%o2,	%i3,	%l1
	array8	%l5,	%i4,	%l6
	taddcc	%o1,	0x10EF,	%i6
	movrne	%o0,	%g3,	%o5
	andn	%o6,	0x1710,	%g4
	bcc,a,pt	%icc,	loop_40
	nop
	fitos	%f5,	%f30
	fstod	%f30,	%f18
	fpmerge	%f15,	%f0,	%f22
	tvs	%xcc,	0x5
loop_40:
	nop
	setx	0x683A368EE41466CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x09280B96FE4610C4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f24,	%f24
	tcs	%icc,	0x0
	and	%g6,	0x0550,	%l0
	fblg	%fcc0,	loop_41
	tcc	%xcc,	0x2
	movl	%icc,	%i2,	%g1
	brlz	%i5,	loop_42
loop_41:
	fpmerge	%f3,	%f2,	%f0
	fmovdl	%icc,	%f22,	%f6
	movrgez	%l3,	%i0,	%l2
loop_42:
	addcc	%o7,	%g7,	%i7
	movvc	%xcc,	%o4,	%i1
	fpack32	%f12,	%f12,	%f30
	move	%icc,	%g5,	%g2
	movrlz	%l4,	%o2,	%o3
	movvc	%xcc,	%i3,	%l1
	std	%f14,	[%l7 + 0x50]
	edge8l	%l5,	%l6,	%i4
	movrgez	%i6,	%o1,	%g3
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x30] %asi,	%o0
	brlz	%o6,	loop_43
	fble,a	%fcc0,	loop_44
	xor	%o5,	0x03C8,	%g6
	ldsw	[%l7 + 0x5C],	%l0
loop_43:
	tgu	%xcc,	0x1
loop_44:
	brgez,a	%i2,	loop_45
	movge	%xcc,	%g4,	%g1
	movge	%icc,	%i5,	%l3
	brz	%i0,	loop_46
loop_45:
	fmovdvc	%xcc,	%f28,	%f12
	movrgez	%l2,	0x3AC,	%o7
	tl	%xcc,	0x1
loop_46:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x22] %asi,	%i7
	wr	%g0,	0x04,	%asi
	stha	%o4,	[%l7 + 0x62] %asi
	subc	%g7,	0x19AA,	%i1
	lduh	[%l7 + 0x5E],	%g5
	taddcctv	%g2,	%o2,	%o3
	fmovdge	%xcc,	%f12,	%f24
	movg	%xcc,	%i3,	%l1
	tg	%xcc,	0x4
	movl	%xcc,	%l5,	%l6
	tle	%icc,	0x5
	ta	%icc,	0x4
	stw	%l4,	[%l7 + 0x20]
	brgz	%i6,	loop_47
	ba,pn	%icc,	loop_48
	edge16n	%i4,	%o1,	%o0
	edge8n	%g3,	%o6,	%g6
loop_47:
	tsubcc	%o5,	0x0B9B,	%i2
loop_48:
	fmovsl	%xcc,	%f6,	%f2
	brgez	%g4,	loop_49
	fsrc1	%f8,	%f22
	fmovrsgz	%g1,	%f22,	%f19
	orcc	%l0,	%l3,	%i5
loop_49:
	udiv	%i0,	0x03EF,	%o7
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f2
	fxtod	%f2,	%f26
	xnorcc	%i7,	0x0A53,	%l2
	te	%xcc,	0x7
	brlz	%o4,	loop_50
	nop
	setx	0x4E4020B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xDD8F8243,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fsubs	%f2,	%f15,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x22],	%i1
loop_50:
	brnz	%g5,	loop_51
	tneg	%icc,	0x3
	set	0x48, %g1
	swapa	[%l7 + %g1] 0x19,	%g7
loop_51:
	tleu	%xcc,	0x6
	edge8	%g2,	%o2,	%i3
	fpsub32s	%f5,	%f17,	%f20
	fmovdcs	%icc,	%f0,	%f7
	stb	%o3,	[%l7 + 0x29]
	sllx	%l5,	0x03,	%l1
	alignaddrl	%l6,	%i6,	%i4
	nop
	setx loop_52, %l0, %l1
	jmpl %l1, %l4
	fmovdpos	%icc,	%f16,	%f23
	smulcc	%o1,	0x0E01,	%o0
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x14
loop_52:
	alignaddr	%o6,	%g3,	%g6
	popc	0x081E,	%i2
	set	0x50, %g4
	ldda	[%l7 + %g4] 0x27,	%o4
	tgu	%xcc,	0x1
	fmovscs	%icc,	%f7,	%f7
	sethi	0x0CC6,	%g1
	movrlz	%l0,	0x10D,	%g4
	nop
	setx	0x63B7864741E38FD9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f8
	sethi	0x1571,	%l3
	fbue	%fcc3,	loop_53
	sdivcc	%i5,	0x02F5,	%o7
	edge32l	%i7,	%l2,	%o4
	array8	%i0,	%i1,	%g5
loop_53:
	fmovrsgz	%g2,	%f10,	%f21
	xor	%o2,	0x1DCA,	%g7
	movl	%xcc,	%i3,	%o3
	fpack32	%f24,	%f2,	%f14
	fmovsneg	%icc,	%f15,	%f6
	nop
	setx	0xF84C344DF1D8A4E0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x0485A4C2617F481D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f14,	%f20
	fsrc2s	%f10,	%f21
	call	loop_54
	bvs,a,pn	%xcc,	loop_55
	sdivx	%l1,	0x1384,	%l6
	movcs	%icc,	%i6,	%i4
loop_54:
	fcmple16	%f4,	%f0,	%l4
loop_55:
	taddcc	%o1,	%l5,	%o6
	sdiv	%o0,	0x027C,	%g6
	fmovspos	%icc,	%f12,	%f4
	taddcc	%i2,	%o5,	%g1
	sethi	0x1C29,	%l0
	bl,a	loop_56
	orn	%g4,	0x0E98,	%l3
	fsrc1s	%f18,	%f17
	set	0x50, %l0
	ldswa	[%l7 + %l0] 0x14,	%g3
loop_56:
	membar	0x4E
	subccc	%o7,	0x084B,	%i5
	fmul8x16al	%f5,	%f4,	%f2
	tg	%xcc,	0x7
	ble,a,pn	%icc,	loop_57
	fmul8ulx16	%f2,	%f0,	%f0
	swap	[%l7 + 0x58],	%l2
	fsrc2	%f18,	%f16
loop_57:
	swap	[%l7 + 0x44],	%i7
	srax	%o4,	%i0,	%g5
	set	0x60, %g7
	sta	%f4,	[%l7 + %g7] 0x89
	fbe	%fcc0,	loop_58
	taddcctv	%i1,	0x12AB,	%o2
	tle	%icc,	0x4
	prefetch	[%l7 + 0x74],	 0x1
loop_58:
	movcs	%icc,	%g2,	%g7
	sll	%i3,	0x07,	%o3
	udivcc	%l1,	0x0C95,	%i6
	tg	%xcc,	0x7
	edge8n	%l6,	%l4,	%i4
	fmovdn	%icc,	%f29,	%f21
	brlz,a	%o1,	loop_59
	ld	[%l7 + 0x5C],	%f10
	movrne	%o6,	%l5,	%g6
	movrgez	%i2,	%o0,	%g1
loop_59:
	bgu,a,pn	%icc,	loop_60
	fmovdvc	%icc,	%f10,	%f27
	fbge,a	%fcc1,	loop_61
	fba	%fcc2,	loop_62
loop_60:
	bg	loop_63
	taddcc	%o5,	%g4,	%l3
loop_61:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62:
	stx	%g3,	[%l7 + 0x38]
loop_63:
	andn	%o7,	%l0,	%l2
	edge32n	%i5,	%o4,	%i0
	fandnot2	%f4,	%f6,	%f14
	xor	%i7,	%g5,	%i1
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x0B] %asi,	%o2
	move	%icc,	%g7,	%i3
	movcc	%icc,	%o3,	%l1
	movrlez	%i6,	0x26A,	%g2
	fmovsl	%icc,	%f17,	%f28
	popc	%l6,	%i4
	set	0x30, %i7
	ldda	[%l7 + %i7] 0x22,	%o0
	for	%f14,	%f14,	%f20
	movrgz	%o6,	%l4,	%g6
	mulscc	%l5,	0x1057,	%i2
	fandnot2	%f16,	%f24,	%f14
	array16	%o0,	%g1,	%o5
	xnorcc	%g4,	%g3,	%o7
	tcs	%xcc,	0x1
	brlez	%l0,	loop_64
	tcc	%icc,	0x5
	movrgz	%l3,	0x151,	%l2
	set	0x40, %i6
	stda	%f0,	[%l7 + %i6] 0xf0
	membar	#Sync
loop_64:
	movne	%icc,	%i5,	%i0
	srlx	%o4,	0x1B,	%g5
	xnorcc	%i1,	0x08AC,	%i7
	subcc	%g7,	0x0EE5,	%i3
	fcmpne16	%f8,	%f4,	%o3
	edge16ln	%l1,	%i6,	%o2
	addc	%l6,	0x047D,	%g2
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x64] %asi
	wr	%g0,	0x81,	%asi
	stwa	%o1,	[%l7 + 0x78] %asi
	movpos	%icc,	%i4,	%o6
	xnor	%g6,	%l4,	%l5
	fbn	%fcc0,	loop_65
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x2
	xor	%o0,	%g1,	%o5
loop_65:
	edge32ln	%i2,	%g4,	%o7
	fnot2	%f0,	%f14
	fmovde	%xcc,	%f23,	%f18
	array32	%g3,	%l0,	%l3
	ta	%icc,	0x2
	movcs	%icc,	%l2,	%i0
	tle	%icc,	0x0
	bvc,a	loop_66
	umul	%i5,	0x132A,	%o4
	movre	%i1,	0x308,	%i7
	fble,a	%fcc1,	loop_67
loop_66:
	movle	%icc,	%g5,	%g7
	tcs	%icc,	0x2
	nop
	setx	0xFD4E998F2048B61C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_67:
	fmovdl	%icc,	%f0,	%f6
	set	0x218, %g5
	ldxa	[%g0 + %g5] 0x52,	%i3
	srax	%o3,	0x10,	%i6
	stx	%o2,	[%l7 + 0x10]
	mulx	%l1,	%g2,	%l6
	tg	%icc,	0x1
	be,a	loop_68
	bleu	%icc,	loop_69
	movcc	%icc,	%o1,	%o6
	movrgz	%g6,	%i4,	%l4
loop_68:
	brlez,a	%l5,	loop_70
loop_69:
	add	%g1,	%o5,	%o0
	bcc,a	%icc,	loop_71
	tpos	%xcc,	0x0
loop_70:
	srlx	%i2,	0x06,	%g4
	tg	%icc,	0x1
loop_71:
	tsubcc	%g3,	%o7,	%l3
	movre	%l2,	%i0,	%l0
	orncc	%o4,	%i1,	%i7
	edge8n	%g5,	%i5,	%g7
	fnegd	%f4,	%f2
	tcc	%xcc,	0x1
	popc	0x0CE9,	%o3
	stw	%i3,	[%l7 + 0x1C]
	fmovdvs	%xcc,	%f28,	%f5
	fmovsleu	%icc,	%f10,	%f30
	sdiv	%i6,	0x10B3,	%o2
	ld	[%l7 + 0x60],	%f31
	addcc	%l1,	%g2,	%l6
	xorcc	%o6,	0x12D3,	%g6
	movcs	%icc,	%i4,	%l4
	fmovsvc	%icc,	%f1,	%f23
	bcs,a,pt	%xcc,	loop_72
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o1,	0x17EA,	%g1
	fsrc2s	%f2,	%f13
loop_72:
	ldstub	[%l7 + 0x2B],	%o5
	tn	%xcc,	0x6
	sir	0x0ED5
	ld	[%l7 + 0x70],	%f18
	sdiv	%l5,	0x0D2B,	%i2
	fornot2	%f14,	%f16,	%f12
	mulscc	%g4,	%o0,	%o7
	fbule,a	%fcc1,	loop_73
	andcc	%g3,	0x1C4E,	%l2
	nop
	setx	loop_74,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sllx	%l3,	0x0C,	%l0
loop_73:
	alignaddr	%i0,	%o4,	%i7
	nop
	setx	0xC8610E0A000463A8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x272DFD4231DF8060,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f28,	%f12
loop_74:
	edge8l	%g5,	%i1,	%i5
	tcs	%icc,	0x2
	mova	%icc,	%g7,	%o3
	sra	%i3,	%o2,	%l1
	xorcc	%g2,	0x1788,	%i6
	fpadd16s	%f0,	%f18,	%f29
	array16	%l6,	%o6,	%g6
	bgu,a,pn	%icc,	loop_75
	fmovdl	%xcc,	%f3,	%f24
	tg	%xcc,	0x0
	tleu	%xcc,	0x4
loop_75:
	ldx	[%l7 + 0x40],	%i4
	fpadd32	%f8,	%f20,	%f4
	fmovrslez	%o1,	%f21,	%f6
	fcmpgt16	%f14,	%f22,	%l4
	addccc	%o5,	%g1,	%l5
	udivx	%g4,	0x1042,	%o0
	movcs	%xcc,	%o7,	%i2
	fmovrdgez	%l2,	%f22,	%f24
	edge16l	%g3,	%l3,	%i0
	xnor	%l0,	0x1992,	%o4
	xor	%i7,	0x0B26,	%g5
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x7A] %asi,	%i1
	array8	%i5,	%o3,	%i3
	tneg	%icc,	0x6
	fmovrdne	%o2,	%f4,	%f10
	orn	%l1,	%g7,	%i6
	tg	%xcc,	0x4
	nop
	fitos	%f11,	%f25
	fstox	%f25,	%f30
	bcc,a,pn	%xcc,	loop_76
	udiv	%g2,	0x1CD6,	%o6
	wr	%g0,	0xea,	%asi
	stwa	%l6,	[%l7 + 0x5C] %asi
	membar	#Sync
loop_76:
	ba,pn	%icc,	loop_77
	ldx	[%l7 + 0x68],	%i4
	nop
	setx	0xCF12D4FC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xEE412493,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f8,	%f7
	smul	%o1,	0x161F,	%l4
loop_77:
	fmovrdne	%o5,	%f20,	%f6
	add	%g6,	0x163F,	%g1
	fmovrdgez	%g4,	%f6,	%f0
	tvs	%icc,	0x7
	umulcc	%l5,	%o0,	%o7
	and	%l2,	%i2,	%g3
	tcs	%icc,	0x5
	addc	%l3,	0x12AE,	%l0
	fmovdcc	%xcc,	%f17,	%f7
	fcmpne16	%f2,	%f18,	%o4
	wr	%g0,	0x88,	%asi
	stwa	%i7,	[%l7 + 0x3C] %asi
	edge16	%g5,	%i1,	%i0
	fbne,a	%fcc3,	loop_78
	sdiv	%o3,	0x14EF,	%i5
	fpack16	%f2,	%f18
	srl	%o2,	0x15,	%l1
loop_78:
	fmovsgu	%xcc,	%f5,	%f11
	umul	%i3,	0x1DF8,	%g7
	fxors	%f27,	%f15,	%f20
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	taddcc	%g2,	%o6,	%l6
	orn	%i6,	0x1C82,	%i4
	andn	%o1,	0x0A27,	%o5
	lduh	[%l7 + 0x2A],	%l4
	fmul8x16	%f22,	%f22,	%f26
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x40] %asi,	%g1
	tcc	%icc,	0x4
	bneg,pn	%xcc,	loop_79
	ldd	[%l7 + 0x18],	%f18
	edge8n	%g6,	%g4,	%l5
	bge	%xcc,	loop_80
loop_79:
	movn	%icc,	%o7,	%o0
	movre	%i2,	%l2,	%l3
	fbg	%fcc1,	loop_81
loop_80:
	fbn,a	%fcc3,	loop_82
	movrlz	%l0,	0x3D4,	%o4
	wr	%g0,	0xea,	%asi
	ldda	[%l7 + 0x30] %asi,	%g2
loop_81:
	edge16l	%g5,	%i1,	%i0
loop_82:
	brlez	%o3,	loop_83
	fbne	%fcc0,	loop_84
	fsrc2s	%f9,	%f3
	nop
	setx	0x5A36930A20753E26,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_83:
	st	%f7,	[%l7 + 0x24]
loop_84:
	fpsub16s	%f9,	%f17,	%f8
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bg,a,pn	%icc,	loop_85
	fbe	%fcc0,	loop_86
	fmovd	%f24,	%f14
	movpos	%icc,	%i5,	%o2
loop_85:
	movcc	%icc,	%l1,	%i7
loop_86:
	taddcc	%i3,	0x1EB0,	%g2
	mulx	%o6,	%l6,	%g7
	tgu	%xcc,	0x1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%i4,	%i6
	subcc	%o1,	%o5,	%g1
	nop
	setx	loop_87,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsa	%icc,	%f5,	%f1
	tvs	%xcc,	0x0
	tne	%xcc,	0x6
loop_87:
	fmovdn	%xcc,	%f12,	%f6
	bvs,a,pn	%icc,	loop_88
	fmul8x16al	%f11,	%f19,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%icc,	%f19,	%f24
loop_88:
	umul	%g6,	0x1A3A,	%l4
	edge8	%g4,	%o7,	%l5
	nop
	fitos	%f4,	%f1
	fstoi	%f1,	%f22
	set	0x21, %g6
	stba	%o0,	[%l7 + %g6] 0x27
	membar	#Sync
	movge	%icc,	%l2,	%l3
	movcc	%icc,	%i2,	%o4
	fbne,a	%fcc3,	loop_89
	taddcc	%l0,	0x09CF,	%g5
	mulx	%g3,	0x16ED,	%i0
	fmul8x16au	%f11,	%f7,	%f30
loop_89:
	fbue,a	%fcc1,	loop_90
	bvc,a	%icc,	loop_91
	movvs	%xcc,	%i1,	%o3
	array32	%i5,	%l1,	%i7
loop_90:
	subcc	%i3,	%o2,	%g2
loop_91:
	brlz	%l6,	loop_92
	udivx	%o6,	0x1D0B,	%i4
	fbg,a	%fcc3,	loop_93
	tsubcc	%g7,	0x1E40,	%o1
loop_92:
	mulx	%i6,	%g1,	%o5
	sra	%g6,	0x03,	%l4
loop_93:
	bg,a	loop_94
	movleu	%icc,	%g4,	%o7
	set	0x74, %o4
	stwa	%l5,	[%l7 + %o4] 0x10
loop_94:
	edge16l	%o0,	%l3,	%i2
	orcc	%o4,	0x04AD,	%l2
	set	0x38, %o6
	stha	%g5,	[%l7 + %o6] 0x2b
	membar	#Sync
	ta	%icc,	0x2
	fmovdvc	%icc,	%f10,	%f16
	fandnot2s	%f24,	%f9,	%f12
	bvc,pn	%xcc,	loop_95
	call	loop_96
	mulscc	%l0,	0x1BE9,	%i0
	nop
	fitod	%f13,	%f6
loop_95:
	fcmple16	%f14,	%f16,	%g3
loop_96:
	nop
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x10
	brz,a	%o3,	loop_97
	sra	%i1,	%i5,	%l1
	movrgz	%i7,	0x206,	%i3
	fxnors	%f25,	%f23,	%f29
loop_97:
	fmovrdlz	%o2,	%f8,	%f12
	stw	%l6,	[%l7 + 0x48]
	movcs	%icc,	%o6,	%g2
	movcc	%xcc,	%i4,	%o1
	fbg,a	%fcc2,	loop_98
	fmovrdlez	%i6,	%f2,	%f6
	brz	%g1,	loop_99
	nop
	fitos	%f10,	%f19
	fstoi	%f19,	%f21
loop_98:
	fandnot1s	%f6,	%f6,	%f3
	tcs	%icc,	0x4
loop_99:
	bneg,a	%xcc,	loop_100
	ble,a	%icc,	loop_101
	bg,a,pn	%icc,	loop_102
	te	%xcc,	0x5
loop_100:
	fmovsleu	%xcc,	%f30,	%f21
loop_101:
	fmuld8ulx16	%f11,	%f0,	%f18
loop_102:
	tge	%icc,	0x6
	bne,pn	%xcc,	loop_103
	membar	0x77
	movneg	%icc,	%g7,	%g6
	fbule,a	%fcc3,	loop_104
loop_103:
	movleu	%icc,	%l4,	%g4
	orcc	%o7,	%o5,	%o0
	fbn	%fcc0,	loop_105
loop_104:
	fmovsa	%xcc,	%f8,	%f13
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x1e,	%f16
loop_105:
	fnot1s	%f1,	%f13
	ldd	[%l7 + 0x60],	%f4
	subcc	%l5,	%i2,	%o4
	xnorcc	%l2,	%l3,	%g5
	stb	%l0,	[%l7 + 0x52]
	alignaddr	%g3,	%o3,	%i1
	sdiv	%i5,	0x1D7C,	%l1
	edge16n	%i7,	%i0,	%i3
	fpack16	%f4,	%f28
	bvs	loop_106
	sethi	0x0C3C,	%o2
	and	%l6,	%o6,	%g2
	stw	%i4,	[%l7 + 0x18]
loop_106:
	edge32n	%o1,	%i6,	%g1
	smul	%g6,	%l4,	%g4
	udivcc	%g7,	0x0560,	%o5
	ldx	[%l7 + 0x18],	%o0
	srlx	%l5,	0x03,	%o7
	set	0x40, %o1
	ldswa	[%l7 + %o1] 0x18,	%o4
	movre	%i2,	0x0E6,	%l2
	fmovdcs	%icc,	%f23,	%f16
	tgu	%icc,	0x5
	sub	%g5,	0x1A23,	%l3
	movcc	%icc,	%l0,	%g3
	and	%o3,	0x082E,	%i1
	te	%xcc,	0x2
	movrlez	%i5,	0x26A,	%i7
	edge32ln	%i0,	%l1,	%i3
	movg	%xcc,	%o2,	%l6
	tsubcc	%g2,	0x11D7,	%i4
	array16	%o6,	%i6,	%o1
	fsrc1	%f16,	%f12
	srl	%g1,	%l4,	%g6
	movrne	%g7,	0x170,	%o5
	tne	%xcc,	0x5
	movne	%xcc,	%g4,	%l5
	tpos	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a	%xcc,	loop_107
	bshuffle	%f28,	%f12,	%f26
	tpos	%icc,	0x0
	tl	%xcc,	0x0
loop_107:
	addcc	%o7,	%o0,	%i2
	edge32	%o4,	%g5,	%l2
	taddcctv	%l3,	%l0,	%g3
	umulcc	%i1,	%o3,	%i7
	nop
	fitod	%f29,	%f8
	smul	%i5,	%i0,	%i3
	xnorcc	%o2,	0x0E0B,	%l1
	edge16l	%g2,	%i4,	%l6
	edge32l	%i6,	%o1,	%o6
	st	%f4,	[%l7 + 0x6C]
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x80,	%f0
	stbar
	movneg	%icc,	%l4,	%g6
	fmovrdlz	%g1,	%f26,	%f12
	fcmple32	%f14,	%f10,	%g7
	bleu,a	%icc,	loop_108
	fmovspos	%icc,	%f15,	%f10
	bcs,a,pn	%icc,	loop_109
	fpadd32	%f4,	%f6,	%f14
loop_108:
	movrgz	%o5,	%g4,	%l5
	addcc	%o7,	0x1BA1,	%i2
loop_109:
	movcs	%xcc,	%o0,	%g5
	bne,pt	%icc,	loop_110
	orcc	%l2,	0x1747,	%o4
	bcc,a	loop_111
	sdivcc	%l0,	0x01CD,	%l3
loop_110:
	fornot1s	%f15,	%f26,	%f20
	movge	%icc,	%i1,	%g3
loop_111:
	or	%o3,	0x0926,	%i7
	edge8n	%i5,	%i3,	%i0
	addc	%o2,	0x0B99,	%g2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%i4,	%l6
	movrne	%l1,	%o1,	%o6
	stb	%l4,	[%l7 + 0x32]
	tvs	%icc,	0x1
	fmovsge	%icc,	%f25,	%f6
	alignaddrl	%i6,	%g6,	%g1
	nop
	fitod	%f2,	%f10
	fdtoi	%f10,	%f7
	movcs	%icc,	%g7,	%g4
	tsubcc	%l5,	0x1A0F,	%o7
	fornot2	%f18,	%f14,	%f4
	edge8n	%i2,	%o0,	%o5
	sll	%g5,	0x05,	%o4
	array16	%l2,	%l3,	%i1
	movrne	%g3,	0x343,	%l0
	tl	%xcc,	0x5
	edge32ln	%i7,	%i5,	%o3
	bge	%icc,	loop_112
	andncc	%i3,	%o2,	%i0
	alignaddrl	%g2,	%l6,	%l1
	tsubcc	%i4,	%o1,	%l4
loop_112:
	sdiv	%i6,	0x04E7,	%o6
	movleu	%xcc,	%g1,	%g7
	ld	[%l7 + 0x60],	%f23
	movrgz	%g6,	0x26C,	%g4
	xnor	%l5,	0x1F6C,	%o7
	fcmple32	%f4,	%f26,	%o0
	srlx	%i2,	%g5,	%o4
	or	%l2,	%o5,	%i1
	tle	%icc,	0x2
	sir	0x0A91
	brlez	%l3,	loop_113
	bcs,a,pt	%icc,	loop_114
	edge8ln	%g3,	%i7,	%l0
	edge16l	%i5,	%o3,	%o2
loop_113:
	bleu	%xcc,	loop_115
loop_114:
	fandnot2s	%f8,	%f4,	%f10
	tsubcc	%i3,	0x1287,	%i0
	andcc	%g2,	%l6,	%l1
loop_115:
	movne	%icc,	%i4,	%l4
	tgu	%icc,	0x3
	fmuld8sux16	%f15,	%f17,	%f4
	fpadd16s	%f9,	%f15,	%f18
	tvs	%icc,	0x4
	tneg	%xcc,	0x6
	fones	%f5
	andn	%i6,	0x032C,	%o1
	edge16ln	%o6,	%g1,	%g6
	tl	%icc,	0x6
	fxor	%f14,	%f16,	%f0
	fandnot2s	%f19,	%f19,	%f4
	edge8	%g4,	%g7,	%l5
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x48] %asi,	%o7
	tpos	%xcc,	0x0
	set	0x65, %o0
	lduba	[%l7 + %o0] 0x81,	%o0
	nop
	setx	0xC04EAD5A,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	array16	%i2,	%g5,	%o4
	bgu,a,pn	%icc,	loop_116
	fmovscs	%icc,	%f12,	%f22
	tsubcc	%o5,	0x10F2,	%i1
	set	0x3C, %l6
	lda	[%l7 + %l6] 0x89,	%f21
loop_116:
	fmovde	%icc,	%f16,	%f1
	move	%xcc,	%l3,	%g3
	udivx	%l2,	0x0294,	%i7
	movgu	%xcc,	%i5,	%o3
	fmovsgu	%icc,	%f18,	%f12
	fcmpeq16	%f8,	%f4,	%o2
	mulscc	%l0,	%i3,	%g2
	fmovrslez	%i0,	%f0,	%f30
	tn	%xcc,	0x1
	sth	%l6,	[%l7 + 0x76]
	fmovsvs	%icc,	%f9,	%f15
	movrlez	%l1,	%i4,	%i6
	srax	%o1,	%l4,	%o6
	fsrc1	%f20,	%f22
	movrgz	%g6,	0x139,	%g4
	fba,a	%fcc2,	loop_117
	fandnot2s	%f1,	%f12,	%f29
	ldub	[%l7 + 0x79],	%g1
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f0
loop_117:
	movrne	%g7,	%o7,	%l5
	and	%o0,	0x09EA,	%i2
	orn	%g5,	0x0F34,	%o5
	fnand	%f24,	%f16,	%f14
	fbe	%fcc1,	loop_118
	sllx	%o4,	0x14,	%i1
	fbn,a	%fcc0,	loop_119
	fabsd	%f24,	%f22
loop_118:
	addc	%l3,	%l2,	%i7
	for	%f6,	%f24,	%f14
loop_119:
	sdivx	%i5,	0x106D,	%o3
	nop
	fitos	%f13,	%f23
	fstox	%f23,	%f14
	movrne	%g3,	%o2,	%l0
	array8	%g2,	%i3,	%i0
	brnz,a	%l6,	loop_120
	xnorcc	%l1,	0x16F3,	%i6
	xorcc	%i4,	0x0413,	%l4
	subcc	%o1,	%o6,	%g6
loop_120:
	nop
	setx	0x8CDB3F1FF6982DA1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xEDE1F02BBF47466A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f10,	%f18
	addcc	%g4,	0x1D70,	%g1
	brnz,a	%g7,	loop_121
	tle	%icc,	0x7
	nop
	setx	loop_122,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%icc,	0x4
loop_121:
	edge16n	%l5,	%o7,	%i2
	edge16l	%g5,	%o5,	%o4
loop_122:
	movvc	%xcc,	%i1,	%o0
	bvs,a	loop_123
	tsubcc	%l2,	0x080B,	%l3
	edge16n	%i7,	%i5,	%o3
	fnot2s	%f29,	%f16
loop_123:
	xnorcc	%o2,	%l0,	%g3
	popc	%g2,	%i0
	xnor	%i3,	0x031F,	%l6
	fors	%f22,	%f9,	%f30
	tvc	%icc,	0x6
	sethi	0x11F3,	%l1
	andncc	%i4,	%l4,	%o1
	fornot2	%f22,	%f2,	%f0
	set	0x41, %g2
	lduba	[%l7 + %g2] 0x10,	%i6
	movrgez	%o6,	0x3F5,	%g4
	movrlez	%g1,	%g6,	%l5
	andn	%g7,	0x0BCE,	%o7
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x19
	swap	[%l7 + 0x28],	%i2
	orncc	%g5,	%o4,	%i1
	ldd	[%l7 + 0x30],	%f22
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f8
	fmovdleu	%xcc,	%f9,	%f24
	movvc	%xcc,	%o0,	%o5
	udivx	%l2,	0x1731,	%l3
	xorcc	%i5,	%i7,	%o3
	tvs	%xcc,	0x7
	tleu	%xcc,	0x3
	movge	%icc,	%o2,	%l0
	fbg	%fcc0,	loop_124
	fnegd	%f14,	%f6
	fmul8ulx16	%f24,	%f4,	%f12
	popc	0x0463,	%g3
loop_124:
	alignaddr	%g2,	%i3,	%i0
	subc	%l1,	%l6,	%l4
	udivx	%i4,	0x15A9,	%i6
	subc	%o6,	%g4,	%o1
	ta	%xcc,	0x3
	sethi	0x0D16,	%g1
	srlx	%g6,	0x13,	%g7
	tgu	%xcc,	0x4
	fblg,a	%fcc2,	loop_125
	edge16n	%l5,	%o7,	%g5
	sub	%o4,	0x05D4,	%i1
	stb	%i2,	[%l7 + 0x3B]
loop_125:
	srax	%o0,	%l2,	%l3
	fbul,a	%fcc3,	loop_126
	fpsub16s	%f0,	%f16,	%f6
	udiv	%i5,	0x031E,	%i7
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x40] %asi,	%o5
loop_126:
	sllx	%o2,	0x09,	%l0
	fbl,a	%fcc3,	loop_127
	movne	%icc,	%o3,	%g3
	mulscc	%g2,	0x18CC,	%i0
	brz,a	%i3,	loop_128
loop_127:
	subccc	%l6,	%l1,	%l4
	movleu	%xcc,	%i4,	%o6
	andncc	%g4,	%o1,	%i6
loop_128:
	nop
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x2f,	%g6
	edge32	%g1,	%l5,	%o7
	tle	%icc,	0x4
	addccc	%g5,	0x1953,	%o4
	movleu	%xcc,	%g7,	%i1
	tgu	%xcc,	0x3
	edge32ln	%o0,	%i2,	%l2
	fbul	%fcc1,	loop_129
	andncc	%l3,	%i5,	%i7
	taddcc	%o5,	%l0,	%o3
	nop
	setx	0x281FC900F7FD1DE2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x124714E7E49F13D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f2,	%f4
loop_129:
	add	%g3,	0x0F60,	%g2
	fnands	%f24,	%f17,	%f6
	tn	%icc,	0x3
	addc	%i0,	%i3,	%l6
	movg	%icc,	%o2,	%l1
	bneg,pn	%xcc,	loop_130
	tne	%xcc,	0x6
	fmovd	%f6,	%f24
	movrlz	%i4,	0x1C3,	%l4
loop_130:
	tleu	%xcc,	0x5
	subccc	%g4,	%o1,	%i6
	sdivcc	%g6,	0x066A,	%g1
	movrne	%l5,	%o6,	%g5
	fmovdcc	%xcc,	%f20,	%f18
	sdivx	%o7,	0x1802,	%g7
	tge	%icc,	0x6
	tge	%xcc,	0x4
	tleu	%icc,	0x5
	tle	%icc,	0x7
	fmul8ulx16	%f22,	%f6,	%f28
	nop
	setx loop_131, %l0, %l1
	jmpl %l1, %o4
	bpos	%icc,	loop_132
	andncc	%o0,	%i1,	%i2
	nop
	setx	0xBECA86E1CBC80865,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f26
loop_131:
	popc	%l2,	%l3
loop_132:
	fpadd16s	%f26,	%f8,	%f29
	tg	%xcc,	0x4
	stb	%i5,	[%l7 + 0x1C]
	fnegs	%f25,	%f20
	ta	%icc,	0x0
	fbn,a	%fcc2,	loop_133
	movrgz	%i7,	%o5,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x7C],	%g3
loop_133:
	nop
	setx	0x145B43F8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x2BEDB68A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f12,	%f14
	taddcc	%g2,	%i0,	%o3
	xnorcc	%i3,	%o2,	%l1
	fmovsvc	%icc,	%f14,	%f25
	fmovrdlz	%l6,	%f22,	%f28
	ble	%icc,	loop_134
	tvs	%icc,	0x3
	bn,a,pn	%xcc,	loop_135
	sdivcc	%l4,	0x10A9,	%g4
loop_134:
	nop
	fitos	%f1,	%f7
	fstox	%f7,	%f18
	fxtos	%f18,	%f22
	edge32n	%o1,	%i6,	%i4
loop_135:
	edge32ln	%g1,	%g6,	%o6
	xorcc	%l5,	%g5,	%g7
	xorcc	%o4,	%o0,	%i1
	movrlz	%o7,	0x2BF,	%i2
	ldsb	[%l7 + 0x53],	%l3
	ld	[%l7 + 0x44],	%f17
	sir	0x1CFB
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x54] %asi,	%f9
	tn	%xcc,	0x2
	fpsub16	%f28,	%f0,	%f22
	movrne	%l2,	0x01C,	%i7
	srlx	%o5,	%i5,	%l0
	sdivcc	%g2,	0x08F0,	%i0
	movpos	%icc,	%o3,	%g3
	fxnor	%f0,	%f14,	%f0
	array16	%i3,	%l1,	%l6
	tsubcc	%l4,	0x11F2,	%o2
	tg	%icc,	0x4
	stw	%o1,	[%l7 + 0x2C]
	fones	%f18
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x42] %asi,	%i6
	fnors	%f10,	%f1,	%f13
	ba	%xcc,	loop_136
	edge16l	%g4,	%g1,	%i4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x2C] %asi,	%o6
loop_136:
	array8	%l5,	%g5,	%g7
	srlx	%g6,	0x1C,	%o4
	edge16ln	%i1,	%o7,	%o0
	mulscc	%l3,	%l2,	%i7
	movle	%xcc,	%o5,	%i2
	movrgez	%l0,	%i5,	%g2
	xnorcc	%i0,	0x1323,	%g3
	movrgez	%i3,	0x1DF,	%o3
	fcmple32	%f6,	%f6,	%l1
	bleu	%xcc,	loop_137
	tcc	%xcc,	0x2
	orn	%l6,	0x0989,	%o2
	st	%f25,	[%l7 + 0x34]
loop_137:
	fmovdcc	%xcc,	%f23,	%f8
	fcmpne32	%f8,	%f28,	%l4
	sdivx	%i6,	0x115B,	%g4
	tn	%xcc,	0x4
	fmovs	%f15,	%f19
	movneg	%xcc,	%g1,	%i4
	set	0x348, %l4
	nop 	! 	stxa	%o6,	[%g0 + %l4] 0x40 ripped by fixASI40.pl
	bgu	loop_138
	movneg	%xcc,	%l5,	%o1
	popc	0x0CBE,	%g7
	tleu	%icc,	0x7
loop_138:
	fmovdneg	%icc,	%f19,	%f12
	movcc	%xcc,	%g6,	%g5
	nop
	setx	0x31690887EF2CA590,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9176ADA13C40BF65,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f0,	%f12
	movcc	%icc,	%o4,	%o7
	set	0x77, %l3
	stba	%o0,	[%l7 + %l3] 0x0c
	add	%i1,	%l3,	%l2
	umul	%i7,	%i2,	%o5
	bg,pn	%xcc,	loop_139
	array16	%l0,	%g2,	%i5
	ldd	[%l7 + 0x78],	%f4
	movgu	%xcc,	%i0,	%g3
loop_139:
	subcc	%i3,	%o3,	%l1
	fbue	%fcc0,	loop_140
	fxnor	%f26,	%f18,	%f28
	sdivx	%o2,	0x1F68,	%l4
	edge8n	%i6,	%g4,	%g1
loop_140:
	fmovrsne	%l6,	%f28,	%f6
	edge32l	%i4,	%l5,	%o6
	orn	%o1,	0x1413,	%g6
	fornot2	%f20,	%f2,	%f4
	fmovde	%icc,	%f6,	%f22
	movvc	%xcc,	%g5,	%o4
	movvc	%xcc,	%o7,	%g7
	edge16n	%i1,	%o0,	%l2
	prefetch	[%l7 + 0x10],	 0x0
	for	%f8,	%f26,	%f6
	tleu	%icc,	0x5
	tleu	%icc,	0x2
	fmovda	%icc,	%f20,	%f4
	movpos	%xcc,	%i7,	%l3
	fblg,a	%fcc1,	loop_141
	call	loop_142
	movvs	%xcc,	%i2,	%l0
	srax	%o5,	0x19,	%g2
loop_141:
	tge	%icc,	0x5
loop_142:
	andcc	%i0,	%i5,	%g3
	nop
	setx	0xC13BCCFE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x966BB2C6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f23,	%f13
	tcs	%icc,	0x2
	sir	0x0587
	movge	%xcc,	%o3,	%i3
	fbule,a	%fcc1,	loop_143
	tne	%xcc,	0x3
	fblg,a	%fcc0,	loop_144
	fmul8ulx16	%f26,	%f2,	%f0
loop_143:
	tge	%icc,	0x6
	and	%l1,	%l4,	%o2
loop_144:
	subc	%g4,	%g1,	%i6
	udivcc	%l6,	0x1717,	%l5
	brlez,a	%o6,	loop_145
	tgu	%icc,	0x5
	smul	%o1,	0x089A,	%i4
	tvs	%icc,	0x5
loop_145:
	array8	%g6,	%o4,	%g5
	add	%o7,	0x0E79,	%g7
	xor	%o0,	%i1,	%l2
	add	%l3,	%i2,	%i7
	movle	%xcc,	%l0,	%g2
	xor	%o5,	0x0716,	%i0
	fnegs	%f16,	%f26
	movcs	%icc,	%g3,	%i5
	fbu,a	%fcc3,	loop_146
	brlez	%i3,	loop_147
	addcc	%o3,	0x116D,	%l1
	mulscc	%o2,	%l4,	%g1
loop_146:
	fblg	%fcc3,	loop_148
loop_147:
	fmovscc	%xcc,	%f17,	%f4
	ldstub	[%l7 + 0x5F],	%g4
	lduw	[%l7 + 0x64],	%l6
loop_148:
	sdiv	%i6,	0x1A5B,	%o6
	fmovsl	%icc,	%f0,	%f1
	umul	%l5,	%o1,	%i4
	bcc,pt	%icc,	loop_149
	tneg	%xcc,	0x4
	fbule	%fcc1,	loop_150
	membar	0x04
loop_149:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o4,	%g6,	%o7
loop_150:
	andn	%g7,	%o0,	%i1
	sdiv	%g5,	0x11F7,	%l2
	set	0x8, %i0
	stxa	%i2,	[%g0 + %i0] 0x4f
	smul	%l3,	%i7,	%l0
	tcs	%xcc,	0x1
	fpackfix	%f12,	%f13
	lduh	[%l7 + 0x6C],	%g2
	subc	%i0,	%o5,	%i5
	edge32	%g3,	%i3,	%o3
	fandnot1	%f24,	%f6,	%f14
	tle	%icc,	0x6
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x36] %asi,	%l1
	fmovdge	%icc,	%f4,	%f10
	movn	%icc,	%o2,	%g1
	edge16	%g4,	%l4,	%i6
	sra	%l6,	%o6,	%l5
	nop
	set	0x49, %l2
	stb	%i4,	[%l7 + %l2]
	movvs	%xcc,	%o4,	%g6
	fpadd16	%f0,	%f2,	%f10
	movg	%xcc,	%o7,	%o1
	fcmpeq16	%f24,	%f20,	%o0
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%g7,	%i1
	fmul8x16	%f6,	%f2,	%f14
	fpsub32	%f16,	%f26,	%f8
	movvc	%xcc,	%g5,	%i2
	srlx	%l2,	0x07,	%i7
	fmovsa	%icc,	%f11,	%f30
	fmovrslez	%l3,	%f23,	%f30
	movvc	%xcc,	%l0,	%i0
	nop
	setx	loop_151,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movne	%icc,	%o5,	%g2
	movge	%xcc,	%i5,	%g3
	set	0x2C, %i1
	lduha	[%l7 + %i1] 0x81,	%o3
loop_151:
	addccc	%i3,	0x0641,	%o2
	movgu	%xcc,	%g1,	%l1
	ldx	[%l7 + 0x60],	%g4
	movg	%xcc,	%l4,	%l6
	umulcc	%i6,	0x191A,	%o6
	edge8ln	%l5,	%i4,	%g6
	tg	%icc,	0x3
	nop
	setx	0xF8B49099406E2FF3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	tg	%icc,	0x6
	movg	%xcc,	%o7,	%o1
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%o4,	%g7
	nop
	fitos	%f2,	%f9
	fstod	%f9,	%f8
	movre	%i1,	%g5,	%o0
	nop
	set	0x78, %o5
	ldsw	[%l7 + %o5],	%i2
	movpos	%xcc,	%l2,	%l3
	brlez,a	%l0,	loop_152
	mulscc	%i0,	%i7,	%o5
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x78] %asi,	%g2
loop_152:
	fnot1s	%f25,	%f4
	edge32ln	%g3,	%o3,	%i5
	nop
	setx	0xA15999330F04C087,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x12DDFA83F354D36C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f22,	%f12
	movn	%xcc,	%i3,	%g1
	tvc	%xcc,	0x4
	bn	%icc,	loop_153
	bvs,pn	%icc,	loop_154
	fbe,a	%fcc2,	loop_155
	xor	%l1,	0x02E1,	%g4
loop_153:
	and	%l4,	0x14E8,	%o2
loop_154:
	nop
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x74] %asi,	%l6
loop_155:
	orcc	%o6,	0x07F3,	%l5
	edge32ln	%i6,	%i4,	%g6
	lduw	[%l7 + 0x44],	%o1
	fmovrdlz	%o4,	%f18,	%f24
	edge8l	%g7,	%i1,	%o7
	smul	%g5,	%i2,	%o0
	ldd	[%l7 + 0x28],	%l2
	nop
	setx loop_156, %l0, %l1
	jmpl %l1, %l0
	movle	%icc,	%l2,	%i0
	fnegs	%f23,	%f3
	edge32ln	%o5,	%g2,	%g3
loop_156:
	fmul8sux16	%f20,	%f24,	%f10
	fbuge	%fcc0,	loop_157
	nop
	fitod	%f1,	%f18
	movleu	%xcc,	%i7,	%o3
	xnorcc	%i3,	0x154B,	%i5
loop_157:
	movne	%icc,	%l1,	%g1
	sethi	0x1EC3,	%g4
	ldstub	[%l7 + 0x1A],	%l4
	fbul,a	%fcc3,	loop_158
	fxor	%f28,	%f8,	%f18
	xnor	%l6,	%o2,	%l5
	srl	%o6,	%i6,	%g6
loop_158:
	fbge,a	%fcc3,	loop_159
	array16	%i4,	%o4,	%g7
	fmovsge	%xcc,	%f4,	%f12
	addccc	%o1,	%o7,	%g5
loop_159:
	movneg	%icc,	%i1,	%i2
	te	%xcc,	0x2
	srl	%o0,	0x04,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l2,	%l0,	%i0
	set	0x08, %o2
	sta	%f10,	[%l7 + %o2] 0x14
	nop
	fitos	%f13,	%f19
	fstod	%f19,	%f2
	fmovde	%icc,	%f21,	%f16
	ldstub	[%l7 + 0x33],	%g2
	fmovrdgez	%g3,	%f16,	%f28
	tge	%icc,	0x5
	fmovda	%xcc,	%f28,	%f13
	edge32l	%i7,	%o3,	%i3
	sethi	0x13C0,	%i5
	tge	%icc,	0x1
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o5
	fbuge	%fcc1,	loop_160
	orn	%l1,	%g4,	%l4
	tsubcctv	%l6,	0x03C0,	%o2
	bgu	loop_161
loop_160:
	xor	%l5,	%g1,	%o6
	movvc	%icc,	%g6,	%i4
	tle	%xcc,	0x0
loop_161:
	array8	%i6,	%o4,	%g7
	movleu	%xcc,	%o1,	%g5
	subccc	%o7,	0x1EC3,	%i2
	sdivx	%o0,	0x1508,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%icc,	0x4
	ld	[%l7 + 0x2C],	%f19
	movpos	%xcc,	%l2,	%l0
	edge32l	%i0,	%i1,	%g3
	bshuffle	%f18,	%f24,	%f22
	fpsub16s	%f22,	%f16,	%f29
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x26] %asi,	%g2
	fmovsleu	%xcc,	%f17,	%f6
	tge	%xcc,	0x2
	movrlez	%o3,	0x0FA,	%i3
	movcs	%xcc,	%i7,	%o5
	fmovrdgez	%l1,	%f2,	%f12
	movpos	%xcc,	%g4,	%i5
	nop
	fitos	%f6,	%f3
	fstod	%f3,	%f8
	fabss	%f0,	%f14
	tge	%icc,	0x7
	srlx	%l4,	%l6,	%l5
	fcmpgt32	%f22,	%f8,	%o2
	movcc	%icc,	%o6,	%g6
	membar	0x19
	sub	%g1,	0x0103,	%i6
	subccc	%i4,	0x0195,	%g7
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	movl	%xcc,	%o4,	%o1
	set	0x28, %i5
	ldsha	[%l7 + %i5] 0x81,	%o7
	wr	%g0,	0x04,	%asi
	stxa	%g5,	[%l7 + 0x28] %asi
	fmovdle	%icc,	%f6,	%f23
	popc	0x1EF8,	%o0
	fmovrdlez	%l3,	%f24,	%f6
	fmovdvc	%icc,	%f27,	%f29
	smulcc	%i2,	%l0,	%l2
	ldsw	[%l7 + 0x1C],	%i1
	taddcctv	%g3,	0x0181,	%i0
	movne	%icc,	%o3,	%g2
	ldstub	[%l7 + 0x22],	%i3
	st	%f18,	[%l7 + 0x0C]
	xnorcc	%o5,	%l1,	%i7
	fmovsgu	%xcc,	%f6,	%f23
	edge32l	%i5,	%g4,	%l4
	nop
	setx	0x9E6F30EB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x69B6299F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fsubs	%f21,	%f12,	%f26
	nop
	setx	0x4038E5F548CE006A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f20
	andncc	%l6,	%o2,	%o6
	nop
	fitos	%f2,	%f13
	fstox	%f13,	%f26
	fxtos	%f26,	%f2
	nop
	setx	0x71A1CDDE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x26CD1F3E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fadds	%f25,	%f10,	%f0
	tsubcctv	%l5,	0x0E99,	%g6
	array32	%i6,	%i4,	%g7
	orcc	%g1,	0x08D2,	%o4
	set	0x2E, %l5
	ldsba	[%l7 + %l5] 0x88,	%o7
	wr	%g0,	0x0c,	%asi
	sta	%f23,	[%l7 + 0x74] %asi
	tgu	%icc,	0x4
	edge8l	%o1,	%g5,	%o0
	bn	loop_162
	fnot1	%f28,	%f10
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x54] %asi,	%i2
loop_162:
	movn	%icc,	%l3,	%l2
	prefetch	[%l7 + 0x38],	 0x3
	wr	%g0,	0x2f,	%asi
	stba	%i1,	[%l7 + 0x52] %asi
	membar	#Sync
	edge8n	%g3,	%i0,	%l0
	movl	%xcc,	%o3,	%g2
	andn	%o5,	0x121A,	%l1
	movvs	%icc,	%i3,	%i7
	membar	0x6D
	array32	%i5,	%g4,	%l4
	fmovscc	%xcc,	%f23,	%f0
	fmovsn	%icc,	%f19,	%f25
	movg	%xcc,	%l6,	%o6
	edge8l	%l5,	%g6,	%o2
	edge8l	%i4,	%g7,	%i6
	bge,pt	%xcc,	loop_163
	taddcctv	%g1,	0x1FAE,	%o7
	fmovsgu	%xcc,	%f29,	%f31
	movrgz	%o4,	0x2A3,	%o1
loop_163:
	srl	%g5,	%o0,	%l3
	prefetch	[%l7 + 0x30],	 0x3
	tvs	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge,a	%fcc2,	loop_164
	bn,a,pn	%icc,	loop_165
	movleu	%xcc,	%i2,	%i1
	fcmple32	%f16,	%f10,	%l2
loop_164:
	edge32n	%g3,	%l0,	%i0
loop_165:
	smul	%g2,	0x0D1E,	%o5
	fbne	%fcc0,	loop_166
	popc	%l1,	%i3
	tge	%xcc,	0x2
	fornot1	%f30,	%f14,	%f4
loop_166:
	umulcc	%o3,	0x0A78,	%i7
	edge8ln	%g4,	%i5,	%l4
	andncc	%o6,	%l6,	%g6
	movvc	%icc,	%o2,	%l5
	andcc	%i4,	0x133E,	%i6
	tg	%xcc,	0x4
	udiv	%g7,	0x1E27,	%g1
	movcc	%icc,	%o4,	%o1
	tpos	%icc,	0x0
	orcc	%g5,	0x19CF,	%o7
	st	%f14,	[%l7 + 0x40]
	fpmerge	%f13,	%f8,	%f2
	mulscc	%o0,	0x14F9,	%i2
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i1
	edge16n	%l2,	%l3,	%l0
	ldub	[%l7 + 0x4C],	%g3
	xorcc	%g2,	0x059F,	%o5
	and	%l1,	0x1D84,	%i0
	sir	0x0DF1
	udiv	%o3,	0x108F,	%i3
	srax	%g4,	0x0B,	%i5
	bvc	loop_167
	edge32	%l4,	%o6,	%i7
	fone	%f20
	fcmpne32	%f26,	%f0,	%l6
loop_167:
	fpmerge	%f25,	%f16,	%f28
	orcc	%o2,	0x1D5A,	%g6
	fmuld8sux16	%f26,	%f25,	%f0
	array16	%l5,	%i4,	%g7
	fabsd	%f22,	%f30
	fbu	%fcc1,	loop_168
	fmul8x16au	%f18,	%f0,	%f2
	sll	%i6,	0x0F,	%g1
	ta	%icc,	0x0
loop_168:
	tgu	%xcc,	0x7
	tsubcc	%o4,	0x09CE,	%g5
	fbge,a	%fcc3,	loop_169
	addcc	%o7,	0x0E71,	%o0
	fmuld8ulx16	%f22,	%f8,	%f8
	brgz	%i2,	loop_170
loop_169:
	edge32	%i1,	%o1,	%l3
	fcmpeq16	%f0,	%f4,	%l2
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x18
loop_170:
	fcmpgt32	%f28,	%f30,	%l0
	smul	%g2,	0x0018,	%g3
	orn	%l1,	%i0,	%o5
	movrgez	%i3,	0x3DB,	%g4
	wr	%g0,	0x11,	%asi
	sta	%f29,	[%l7 + 0x0C] %asi
	fmuld8sux16	%f30,	%f16,	%f2
	fmovdvc	%xcc,	%f8,	%f5
	set	0x5D, %l1
	lduba	[%l7 + %l1] 0x18,	%i5
	sub	%o3,	%l4,	%i7
	tne	%xcc,	0x0
	nop
	setx	loop_171,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpeq32	%f18,	%f30,	%l6
	fmovda	%xcc,	%f10,	%f15
	sdivcc	%o2,	0x017D,	%g6
loop_171:
	array16	%l5,	%i4,	%g7
	ldsb	[%l7 + 0x44],	%o6
	andcc	%g1,	0x16DB,	%i6
	fnegs	%f14,	%f1
	fxor	%f26,	%f8,	%f30
	alignaddrl	%g5,	%o7,	%o4
	addcc	%i2,	%o0,	%i1
	fmovsn	%xcc,	%f29,	%f11
	bcc,pt	%xcc,	loop_172
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
	stw	%l3,	[%l7 + 0x30]
	stb	%o1,	[%l7 + 0x42]
loop_172:
	ldsw	[%l7 + 0x18],	%l2
loop_173:
	fcmpeq16	%f16,	%f26,	%l0
	movle	%icc,	%g3,	%g2
	nop
	fitos	%f10,	%f31
	fstoi	%f31,	%f6
	std	%f26,	[%l7 + 0x08]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_174
	tpos	%icc,	0x5
	addc	%l1,	0x1BD6,	%o5
	fmovs	%f18,	%f17
loop_174:
	fbo	%fcc1,	loop_175
	movvc	%xcc,	%i0,	%g4
	movne	%icc,	%i3,	%i5
	taddcctv	%l4,	0x0A52,	%i7
loop_175:
	edge8	%o3,	%l6,	%g6
	srlx	%l5,	0x1E,	%i4
	nop
	setx	0x5C884A9500553B3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	movrlz	%g7,	%o6,	%o2
	edge16ln	%g1,	%i6,	%g5
	ta	%xcc,	0x2
	stx	%o7,	[%l7 + 0x60]
	edge8ln	%i2,	%o0,	%i1
	sll	%o4,	%l3,	%l2
	bcs	loop_176
	edge32l	%o1,	%l0,	%g2
	set	0x69, %o7
	lduba	[%l7 + %o7] 0x88,	%g3
loop_176:
	edge8l	%l1,	%i0,	%o5
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x5C] %asi,	%f8
	udiv	%i3,	0x12AC,	%g4
	andn	%i5,	0x05E5,	%i7
	bpos,pn	%icc,	loop_177
	srl	%o3,	0x14,	%l4
	tvc	%xcc,	0x7
	mulx	%l6,	0x0DF0,	%l5
loop_177:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	mulscc	%i4,	%g6,	%g7
	set	0x48, %g4
	ldxa	[%l7 + %g4] 0x88,	%o2
	set	0x40, %l0
	stda	%f16,	[%l7 + %l0] 0x17
	membar	#Sync
	fble	%fcc0,	loop_178
	subccc	%g1,	%i6,	%o6
	xnorcc	%g5,	%o7,	%o0
	srl	%i1,	%i2,	%l3
loop_178:
	edge32	%l2,	%o1,	%l0
	sdivx	%o4,	0x16A4,	%g2
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
	alignaddr	%l1,	%g3,	%i0
	tl	%xcc,	0x3
	nop
	setx	0x57A84362F65DBCFC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f2
loop_179:
	fbe,a	%fcc1,	loop_180
	andn	%i3,	0x170D,	%o5
	tcs	%xcc,	0x2
	subccc	%g4,	0x1439,	%i7
loop_180:
	andncc	%i5,	%l4,	%l6
	sethi	0x0AB3,	%l5
	fble	%fcc3,	loop_181
	tcc	%xcc,	0x3
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
loop_181:
	fbo	%fcc0,	loop_182
	edge16l	%g6,	%i4,	%o2
	fbl,a	%fcc1,	loop_183
	array16	%g1,	%i6,	%g7
loop_182:
	nop
	set	0x58, %g7
	ldswa	[%l7 + %g7] 0x15,	%g5
loop_183:
	addcc	%o6,	0x0B8D,	%o7
	nop
	setx	0xB23C407ED792F041,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f28
	fbug,a	%fcc0,	loop_184
	movge	%icc,	%o0,	%i2
	srlx	%i1,	0x03,	%l3
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f6
	fxtod	%f6,	%f20
loop_184:
	popc	%o1,	%l0
	edge16	%o4,	%g2,	%l1
	ldsw	[%l7 + 0x3C],	%l2
	movn	%icc,	%i0,	%g3
	ldstub	[%l7 + 0x55],	%i3
	smulcc	%g4,	%o5,	%i5
	movpos	%xcc,	%i7,	%l4
	stbar
	bneg,a	%xcc,	loop_185
	nop
	setx	0x51B47BFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x2ACFF831,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fadds	%f1,	%f22,	%f14
	sdiv	%l6,	0x1405,	%o3
	movleu	%icc,	%g6,	%i4
loop_185:
	array16	%o2,	%l5,	%g1
	mulx	%g7,	%i6,	%g5
	fbul,a	%fcc2,	loop_186
	andcc	%o6,	0x1721,	%o0
	brlez,a	%o7,	loop_187
	sethi	0x15F9,	%i1
loop_186:
	subc	%l3,	%i2,	%l0
	fandnot2	%f0,	%f26,	%f16
loop_187:
	movne	%xcc,	%o4,	%g2
	bcc,pn	%icc,	loop_188
	popc	%l1,	%o1
	srl	%l2,	0x09,	%i0
	sll	%g3,	%i3,	%o5
loop_188:
	udiv	%i5,	0x17E1,	%i7
	fble,a	%fcc0,	loop_189
	tn	%icc,	0x4
	smul	%l4,	%g4,	%l6
	set	0x128, %i6
	nop 	! 	stxa	%g6,	[%g0 + %i6] 0x40 ripped by fixASI40.pl
loop_189:
	subcc	%i4,	%o2,	%o3
	nop
	setx	loop_190,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%xcc,	%l5,	%g1
	tneg	%xcc,	0x2
	fxor	%f6,	%f10,	%f20
loop_190:
	array8	%g7,	%i6,	%g5
	xorcc	%o6,	%o0,	%o7
	movge	%icc,	%i1,	%i2
	fmovdcc	%xcc,	%f15,	%f17
	movl	%icc,	%l0,	%l3
	srax	%o4,	%g2,	%l1
	set	0x14, %i7
	swapa	[%l7 + %i7] 0x0c,	%o1
	subccc	%i0,	%l2,	%g3
	edge32	%i3,	%o5,	%i7
	bcc	loop_191
	smulcc	%i5,	%l4,	%g4
	pdist	%f14,	%f0,	%f4
	fsrc1	%f28,	%f30
loop_191:
	std	%f18,	[%l7 + 0x40]
	nop
	setx	0xBF8038C1582F8267,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f26
	ldsw	[%l7 + 0x7C],	%g6
	movle	%icc,	%i4,	%l6
	te	%xcc,	0x0
	fmovrdgz	%o2,	%f30,	%f10
	addccc	%o3,	%g1,	%g7
	tge	%icc,	0x5
	movn	%xcc,	%i6,	%l5
	tneg	%xcc,	0x3
	brz	%g5,	loop_192
	mulx	%o6,	%o0,	%i1
	nop
	fitos	%f2,	%f4
	fstod	%f4,	%f30
	edge8ln	%i2,	%l0,	%l3
loop_192:
	tleu	%icc,	0x2
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	tne	%icc,	0x6
	bleu,a,pt	%icc,	loop_193
	bpos,a,pn	%icc,	loop_194
	fmovscs	%icc,	%f18,	%f24
	tg	%icc,	0x1
loop_193:
	fbne	%fcc0,	loop_195
loop_194:
	nop
	fitos	%f10,	%f13
	fstox	%f13,	%f4
	fxtos	%f4,	%f7
	udivx	%o4,	0x11B5,	%o7
	brlez	%g2,	loop_196
loop_195:
	subc	%o1,	0x1A54,	%l1
	popc	0x0E4B,	%i0
	tg	%icc,	0x2
loop_196:
	movvc	%xcc,	%l2,	%g3
	fands	%f11,	%f1,	%f24
	movvs	%xcc,	%i3,	%o5
	ba,a,pt	%icc,	loop_197
	ble	loop_198
	stb	%i7,	[%l7 + 0x4B]
	bshuffle	%f2,	%f0,	%f28
loop_197:
	edge16ln	%l4,	%g4,	%g6
loop_198:
	sethi	0x07BD,	%i4
	andncc	%l6,	%o2,	%i5
	edge32ln	%o3,	%g1,	%i6
	stbar
	addc	%l5,	%g5,	%o6
	fmovrslez	%g7,	%f10,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o0,	%i2
	fnands	%f27,	%f17,	%f1
	subc	%l0,	%l3,	%o4
	fbuge,a	%fcc1,	loop_199
	fmovdpos	%icc,	%f29,	%f10
	fmovsneg	%icc,	%f16,	%f22
	faligndata	%f28,	%f24,	%f24
loop_199:
	taddcc	%i1,	0x00EF,	%g2
	orn	%o1,	0x1CD8,	%o7
	sllx	%l1,	0x0F,	%i0
	movvs	%xcc,	%l2,	%g3
	fba,a	%fcc1,	loop_200
	fmovrdgez	%i3,	%f18,	%f20
	xnor	%i7,	%o5,	%g4
	or	%l4,	%g6,	%i4
loop_200:
	subc	%l6,	0x114E,	%i5
	sir	0x132D
	swap	[%l7 + 0x4C],	%o2
	ldsb	[%l7 + 0x42],	%g1
	fsrc1	%f2,	%f0
	smulcc	%i6,	%o3,	%l5
	fmuld8ulx16	%f25,	%f1,	%f6
	movcc	%xcc,	%o6,	%g7
	movvc	%icc,	%g5,	%o0
	movleu	%icc,	%l0,	%i2
	sethi	0x1DD0,	%l3
	sir	0x1F2B
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] 0x18,	%o4,	%g2
	xnor	%o1,	0x1AA4,	%i1
	sdivx	%o7,	0x1962,	%l1
	bcs,pt	%icc,	loop_201
	fpsub32	%f6,	%f10,	%f22
	udiv	%i0,	0x1C3F,	%l2
	tgu	%xcc,	0x3
loop_201:
	brnz,a	%g3,	loop_202
	ldsw	[%l7 + 0x28],	%i3
	set	0x09, %g5
	lduba	[%l7 + %g5] 0x11,	%i7
loop_202:
	move	%xcc,	%g4,	%l4
	fbne,a	%fcc3,	loop_203
	brlez	%o5,	loop_204
	prefetch	[%l7 + 0x78],	 0x2
	subcc	%i4,	0x04E4,	%l6
loop_203:
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f2
	fxtod	%f2,	%f30
loop_204:
	fmovrsgez	%g6,	%f14,	%f2
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x76] %asi,	%i5
	sdivcc	%o2,	0x154F,	%g1
	edge8l	%i6,	%l5,	%o3
	fmovsvc	%xcc,	%f13,	%f2
	umulcc	%o6,	%g5,	%g7
	mulscc	%l0,	0x1E46,	%o0
	fpack16	%f22,	%f7
	lduw	[%l7 + 0x64],	%i2
	smul	%o4,	0x12A5,	%g2
	edge16n	%l3,	%o1,	%i1
	sra	%l1,	0x06,	%o7
	bpos,a,pn	%xcc,	loop_205
	movneg	%icc,	%i0,	%l2
	subcc	%i3,	%i7,	%g4
	fble	%fcc1,	loop_206
loop_205:
	xnor	%g3,	0x0F0B,	%l4
	udivx	%i4,	0x1901,	%l6
	andcc	%o5,	%g6,	%o2
loop_206:
	movre	%i5,	0x042,	%g1
	sethi	0x053B,	%l5
	addc	%i6,	0x09C8,	%o6
	fmovdleu	%icc,	%f19,	%f30
	array32	%o3,	%g7,	%g5
	movg	%xcc,	%o0,	%i2
	sub	%l0,	%g2,	%l3
	sdiv	%o1,	0x16F2,	%o4
	movleu	%xcc,	%l1,	%i1
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%i0
	fornot2s	%f27,	%f19,	%f26
	edge8l	%l2,	%i3,	%o7
	subc	%g4,	0x1F6B,	%g3
	addc	%l4,	0x101E,	%i4
	nop
	setx	0x809DDAFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x1BD78FE1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f15,	%f2
	tl	%icc,	0x6
	mulx	%l6,	0x0B7C,	%o5
	andcc	%g6,	0x0374,	%i7
	sra	%o2,	0x0E,	%g1
	move	%icc,	%l5,	%i6
	fnot2s	%f7,	%f15
	bvs	%xcc,	loop_207
	tcs	%xcc,	0x6
	movcs	%xcc,	%i5,	%o6
	nop
	setx	0x41F9C0122059D1A5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_207:
	edge32	%g7,	%g5,	%o3
	edge16l	%o0,	%l0,	%g2
	bneg,pn	%xcc,	loop_208
	stw	%i2,	[%l7 + 0x4C]
	edge32n	%o1,	%l3,	%l1
	umulcc	%o4,	0x03EC,	%i0
loop_208:
	edge32	%i1,	%l2,	%i3
	movpos	%xcc,	%o7,	%g4
	tsubcctv	%g3,	%l4,	%l6
	movrgz	%o5,	0x2ED,	%g6
	stb	%i7,	[%l7 + 0x34]
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%i4,	%g1
	mulx	%o2,	%l5,	%i5
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%o6
	movle	%icc,	%i6,	%g7
	srlx	%o3,	%g5,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x6
	movcc	%xcc,	%g2,	%l0
	umul	%i2,	0x150E,	%l3
	edge8l	%o1,	%l1,	%i0
	set	0x50, %o4
	ldsba	[%l7 + %o4] 0x11,	%i1
	fnands	%f5,	%f11,	%f5
	sdivx	%o4,	0x0357,	%l2
	fmovrdlez	%i3,	%f10,	%f22
	movle	%xcc,	%g4,	%g3
	edge32l	%o7,	%l4,	%o5
	move	%icc,	%g6,	%i7
	movleu	%xcc,	%i4,	%l6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] 0x88,	%o2,	%g1
	tle	%xcc,	0x3
	ta	%xcc,	0x5
	tvc	%xcc,	0x3
	edge32l	%l5,	%i5,	%o6
	movleu	%xcc,	%i6,	%o3
	fmovrsgz	%g7,	%f27,	%f24
	srl	%g5,	0x15,	%g2
	mulx	%o0,	0x1939,	%i2
	tcc	%icc,	0x6
	movne	%xcc,	%l0,	%o1
	addc	%l1,	%i0,	%l3
	nop
	set	0x22, %i3
	ldub	[%l7 + %i3],	%i1
	nop
	fitod	%f21,	%f2
	nop
	setx	0xCF5BA3F8105F6594,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fsrc2s	%f23,	%f25
	add	%l2,	%i3,	%g4
	movg	%icc,	%o4,	%o7
	fbuge	%fcc2,	loop_209
	orncc	%g3,	%l4,	%o5
	nop
	setx	0x1B04F43F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x095CA14E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fmuls	%f17,	%f25,	%f19
	udiv	%g6,	0x071D,	%i4
loop_209:
	bn,pt	%icc,	loop_210
	bn,a	%icc,	loop_211
	movl	%icc,	%i7,	%l6
	orncc	%g1,	0x0A1B,	%o2
loop_210:
	nop
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x38] %asi,	%l5
loop_211:
	nop
	set	0x6E, %o1
	ldstuba	[%l7 + %o1] 0x0c,	%o6
	movre	%i5,	0x322,	%o3
	movre	%i6,	%g7,	%g5
	srlx	%o0,	%g2,	%l0
	add	%o1,	%i2,	%i0
	mulscc	%l1,	0x0C0C,	%i1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x64] %asi,	%l2
	fabsd	%f26,	%f10
	addccc	%i3,	%g4,	%l3
	movre	%o7,	%o4,	%l4
	umulcc	%o5,	%g3,	%g6
	movvs	%icc,	%i4,	%l6
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x50] %asi,	%g0
	alignaddr	%o2,	%l5,	%i7
	movl	%xcc,	%i5,	%o6
	umul	%i6,	%o3,	%g7
	tg	%xcc,	0x5
	tsubcc	%g5,	%o0,	%g2
	sdiv	%l0,	0x113D,	%i2
	movrne	%i0,	0x0AD,	%o1
	lduw	[%l7 + 0x48],	%i1
	fcmpgt32	%f24,	%f16,	%l2
	tvc	%icc,	0x7
	tne	%icc,	0x7
	movvs	%xcc,	%l1,	%g4
	tvs	%xcc,	0x4
	tpos	%xcc,	0x6
	ldsh	[%l7 + 0x4C],	%i3
	bvc,pt	%icc,	loop_212
	alignaddrl	%o7,	%l3,	%l4
	xnorcc	%o5,	0x13A8,	%g3
	fmul8x16au	%f1,	%f8,	%f18
loop_212:
	movrne	%g6,	0x039,	%o4
	fnors	%f4,	%f21,	%f8
	fpackfix	%f24,	%f4
	fbuge,a	%fcc0,	loop_213
	movvs	%icc,	%i4,	%l6
	edge16	%g1,	%l5,	%o2
	array16	%i7,	%i5,	%i6
loop_213:
	orn	%o6,	%g7,	%o3
	wr	%g0,	0x88,	%asi
	ldda	[%l7 + 0x40] %asi,	%o0
	taddcc	%g5,	%l0,	%i2
	umulcc	%i0,	%o1,	%i1
	sll	%g2,	%l1,	%l2
	array8	%g4,	%i3,	%o7
	movgu	%xcc,	%l4,	%l3
	st	%f13,	[%l7 + 0x3C]
	xorcc	%o5,	0x1571,	%g3
	tn	%icc,	0x5
	brgz	%g6,	loop_214
	fmovrsgz	%o4,	%f9,	%f23
	fbn,a	%fcc3,	loop_215
	movrlz	%i4,	%g1,	%l5
loop_214:
	fandnot2	%f8,	%f26,	%f6
	fzero	%f24
loop_215:
	movpos	%xcc,	%l6,	%o2
	nop
	fitod	%f0,	%f0
	fdtoi	%f0,	%f24
	fpack16	%f10,	%f13
	alignaddrl	%i7,	%i6,	%o6
	stx	%g7,	[%l7 + 0x10]
	tl	%icc,	0x4
	mova	%icc,	%o3,	%o0
	edge8ln	%g5,	%l0,	%i2
	fornot2s	%f1,	%f12,	%f28
	edge32ln	%i0,	%o1,	%i5
	movge	%icc,	%i1,	%l1
	tsubcc	%g2,	0x0179,	%g4
	set	0x78, %o3
	sta	%f22,	[%l7 + %o3] 0x88
	movle	%xcc,	%i3,	%o7
	membar	0x77
	nop
	setx	loop_216,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movcs	%icc,	%l4,	%l3
	fmovrsgz	%l2,	%f4,	%f12
	mulscc	%g3,	%o5,	%o4
loop_216:
	nop
	setx	0xC3437148,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	fsqrts	%f22,	%f24
	fsrc2	%f26,	%f28
	sub	%g6,	%i4,	%l5
	movge	%icc,	%g1,	%o2
	nop
	set	0x5C, %i2
	stw	%i7,	[%l7 + %i2]
	srax	%i6,	%o6,	%g7
	alignaddrl	%l6,	%o3,	%g5
	fzeros	%f7
	tcs	%icc,	0x5
	fmuld8sux16	%f7,	%f22,	%f26
	mulscc	%o0,	%l0,	%i0
	sll	%o1,	0x05,	%i2
	fbg	%fcc1,	loop_217
	fmovdpos	%icc,	%f7,	%f30
	orn	%i5,	0x1945,	%l1
	movcc	%xcc,	%g2,	%g4
loop_217:
	be,pn	%icc,	loop_218
	membar	0x7F
	fandnot2	%f8,	%f26,	%f20
	movcc	%xcc,	%i1,	%o7
loop_218:
	fmovsneg	%icc,	%f4,	%f15
	std	%f0,	[%l7 + 0x68]
	fbul	%fcc1,	loop_219
	addccc	%i3,	%l4,	%l2
	call	loop_220
	movge	%icc,	%l3,	%g3
loop_219:
	nop
	set	0x1C, %l6
	lda	[%l7 + %l6] 0x18,	%f24
loop_220:
	nop
	setx	0x4A8BC2C0F51CC545,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x4EDD5C68D2C3C7B0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f10,	%f16
	bpos,pt	%xcc,	loop_221
	fnand	%f18,	%f18,	%f2
	andn	%o4,	0x1EDC,	%g6
	movn	%xcc,	%i4,	%l5
loop_221:
	sethi	0x1BBF,	%o5
	fcmpne32	%f24,	%f12,	%g1
	sub	%o2,	%i7,	%i6
	fbuge,a	%fcc0,	loop_222
	sdiv	%o6,	0x1E1D,	%g7
	addcc	%l6,	0x1495,	%g5
	addc	%o3,	0x0C74,	%o0
loop_222:
	sra	%l0,	%i0,	%o1
	bvc,pt	%icc,	loop_223
	fmovrse	%i5,	%f18,	%f25
	addcc	%i2,	0x0E29,	%g2
	fcmple16	%f8,	%f8,	%l1
loop_223:
	fmovrdgez	%i1,	%f8,	%f24
	fbe,a	%fcc3,	loop_224
	popc	0x1B3B,	%g4
	tleu	%icc,	0x1
	mova	%xcc,	%o7,	%l4
loop_224:
	brz	%l2,	loop_225
	andn	%l3,	%i3,	%o4
	ta	%icc,	0x7
	edge32	%g3,	%i4,	%g6
loop_225:
	alignaddr	%o5,	%l5,	%o2
	ba,pn	%icc,	loop_226
	bn,a,pn	%icc,	loop_227
	fblg	%fcc2,	loop_228
	fcmpeq32	%f30,	%f22,	%g1
loop_226:
	fmovrdgz	%i6,	%f6,	%f2
loop_227:
	popc	%o6,	%i7
loop_228:
	edge8ln	%g7,	%l6,	%g5
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x11] %asi,	%o0
	fxor	%f6,	%f14,	%f24
	sll	%l0,	0x16,	%o3
	movge	%xcc,	%o1,	%i5
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x4B] %asi,	%i0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x7C] %asi,	%i2
	sllx	%g2,	%l1,	%i1
	andn	%o7,	%l4,	%l2
	mova	%xcc,	%l3,	%g4
	movn	%icc,	%o4,	%i3
	srl	%i4,	0x14,	%g6
	nop
	fitod	%f8,	%f18
	fdtos	%f18,	%f9
	edge8	%o5,	%l5,	%o2
	alignaddr	%g1,	%g3,	%i6
	be	loop_229
	movg	%xcc,	%i7,	%o6
	addc	%l6,	0x0B96,	%g5
	tleu	%xcc,	0x2
loop_229:
	alignaddr	%o0,	%l0,	%g7
	sra	%o3,	0x1D,	%o1
	set	0x1a0, %o0
	nop 	! 	nop 	! 	ldxa	[%g0 + %o0] 0x40,	%i0 ripped by fixASI40.pl ripped by fixASI40.pl
	xor	%i5,	0x1F36,	%i2
	nop
	setx	0x106FD8FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	fmul8sux16	%f4,	%f16,	%f28
	edge16ln	%l1,	%g2,	%i1
	fmovdl	%xcc,	%f5,	%f22
	tge	%icc,	0x2
	tleu	%icc,	0x7
	srax	%l4,	%l2,	%l3
	add	%o7,	%g4,	%o4
	edge32ln	%i3,	%i4,	%o5
	sdiv	%l5,	0x15AA,	%o2
	fba,a	%fcc1,	loop_230
	orn	%g6,	%g3,	%g1
	sth	%i6,	[%l7 + 0x44]
	subcc	%i7,	0x0C22,	%l6
loop_230:
	ble	loop_231
	fornot2s	%f28,	%f7,	%f18
	fbl	%fcc0,	loop_232
	mova	%icc,	%g5,	%o6
loop_231:
	fbe	%fcc2,	loop_233
	sllx	%l0,	%o0,	%o3
loop_232:
	fnot1	%f26,	%f22
	set	0x70, %g3
	stwa	%o1,	[%l7 + %g3] 0x14
loop_233:
	tvc	%xcc,	0x2
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x30] %asi,	%i0
	array8	%g7,	%i5,	%l1
	alignaddrl	%g2,	%i1,	%l4
	bvc,a	%icc,	loop_234
	fpsub32	%f0,	%f22,	%f10
	movrne	%l2,	0x1D0,	%i2
	fmovdvc	%xcc,	%f25,	%f4
loop_234:
	nop
	fitos	%f8,	%f19
	fstox	%f19,	%f24
	fxtos	%f24,	%f23
	andncc	%l3,	%g4,	%o7
	fmovdl	%icc,	%f10,	%f16
	nop
	setx	0x9C1F38CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f3
	fmovsgu	%xcc,	%f30,	%f13
	tne	%xcc,	0x0
	orcc	%o4,	%i3,	%i4
	movn	%xcc,	%l5,	%o2
	fpadd16s	%f15,	%f29,	%f16
	fnand	%f4,	%f18,	%f28
	brgz,a	%o5,	loop_235
	stbar
	bgu,a,pn	%icc,	loop_236
	fsrc1s	%f2,	%f4
loop_235:
	edge32l	%g6,	%g3,	%i6
	tne	%xcc,	0x1
loop_236:
	brnz	%g1,	loop_237
	fble	%fcc2,	loop_238
	faligndata	%f14,	%f22,	%f28
	edge16	%i7,	%g5,	%l6
loop_237:
	array32	%o6,	%l0,	%o0
loop_238:
	movgu	%icc,	%o3,	%o1
	sub	%g7,	%i0,	%l1
	taddcc	%g2,	%i5,	%l4
	edge32n	%l2,	%i1,	%l3
	fmul8ulx16	%f22,	%f24,	%f28
	sdiv	%g4,	0x0703,	%i2
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o4
	fxnor	%f20,	%f24,	%f14
	fmovdpos	%icc,	%f17,	%f13
	nop
	setx	0x349FDF3AF065B724,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	set	0x18, %g2
	swapa	[%l7 + %g2] 0x10,	%o7
	orn	%i3,	0x179C,	%l5
	fcmpeq32	%f2,	%f30,	%o2
	set	0x3C, %i4
	lduwa	[%l7 + %i4] 0x04,	%o5
	nop
	fitos	%f11,	%f16
	fbuge,a	%fcc1,	loop_239
	andn	%i4,	0x104B,	%g6
	movleu	%icc,	%g3,	%g1
	edge16n	%i6,	%i7,	%l6
loop_239:
	movrgez	%g5,	0x2B1,	%o6
	tvs	%xcc,	0x6
	xor	%o0,	0x1D9B,	%l0
	movrlez	%o3,	0x134,	%o1
	fsrc1	%f22,	%f22
	fbne,a	%fcc2,	loop_240
	array16	%i0,	%l1,	%g7
	movrgz	%i5,	0x107,	%g2
	ldd	[%l7 + 0x68],	%l4
loop_240:
	array16	%l2,	%i1,	%l3
	nop
	setx	0xDD595F8D006E1667,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	andn	%i2,	0x1A16,	%g4
	ldstub	[%l7 + 0x2C],	%o4
	edge16ln	%i3,	%l5,	%o7
	ldstub	[%l7 + 0x68],	%o5
	fmovsleu	%icc,	%f14,	%f21
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%i4
	bcs,a	loop_241
	andcc	%g6,	0x0B7F,	%o2
	subc	%g3,	%g1,	%i7
	fsrc1s	%f30,	%f11
loop_241:
	fpmerge	%f4,	%f21,	%f12
	taddcc	%l6,	0x0B6D,	%g5
	movrlez	%i6,	%o6,	%o0
	ldx	[%l7 + 0x48],	%l0
	orncc	%o1,	%o3,	%l1
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x1e
	membar	#Sync
	fmovscs	%xcc,	%f16,	%f29
	tleu	%icc,	0x6
	movneg	%icc,	%i0,	%i5
	ta	%xcc,	0x0
	fornot2	%f2,	%f24,	%f12
	wr	%g0,	0x2a,	%asi
	stxa	%g7,	[%l7 + 0x48] %asi
	membar	#Sync
	and	%g2,	0x1F4F,	%l2
	fmovsneg	%xcc,	%f3,	%f5
	ldx	[%l7 + 0x28],	%i1
	tge	%xcc,	0x3
	ldx	[%l7 + 0x28],	%l3
	fpadd32	%f20,	%f24,	%f24
	fmovde	%xcc,	%f3,	%f15
	sdiv	%l4,	0x172B,	%i2
	set	0x70, %i0
	prefetcha	[%l7 + %i0] 0x18,	 0x2
	wr	%g0,	0x81,	%asi
	sta	%f20,	[%l7 + 0x38] %asi
	set	0x18, %i1
	prefetcha	[%l7 + %i1] 0x04,	 0x0
	fmovrdgez	%i3,	%f2,	%f2
	bg,pt	%icc,	loop_242
	mova	%icc,	%l5,	%o5
	movg	%icc,	%o7,	%g6
	movg	%xcc,	%o2,	%i4
loop_242:
	nop
	fitos	%f26,	%f22
	fxnor	%f8,	%f6,	%f30
	taddcctv	%g1,	%g3,	%i7
	movge	%xcc,	%g5,	%l6
	nop
	setx	0xD2500B1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xBB8A114F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fmuls	%f24,	%f4,	%f10
	srax	%o6,	%o0,	%l0
	xor	%i6,	%o3,	%o1
	fsrc2	%f14,	%f30
	umulcc	%i0,	%l1,	%i5
	sdivcc	%g2,	0x0551,	%l2
	fcmpeq32	%f24,	%f28,	%i1
	brnz,a	%l3,	loop_243
	alignaddr	%g7,	%l4,	%i2
	addcc	%o4,	%g4,	%i3
	fcmpgt16	%f26,	%f26,	%o5
loop_243:
	nop
	wr	%g0,	0x89,	%asi
	stba	%l5,	[%l7 + 0x09] %asi
	nop
	set	0x28, %o5
	ldsw	[%l7 + %o5],	%g6
	fbe	%fcc0,	loop_244
	bne,a	%xcc,	loop_245
	bleu,a	%xcc,	loop_246
	xor	%o2,	0x091E,	%o7
loop_244:
	andcc	%g1,	%i4,	%i7
loop_245:
	ldsb	[%l7 + 0x12],	%g5
loop_246:
	umulcc	%g3,	%l6,	%o0
	nop
	setx loop_247, %l0, %l1
	jmpl %l1, %o6
	te	%xcc,	0x6
	alignaddrl	%l0,	%i6,	%o3
	fzero	%f18
loop_247:
	te	%icc,	0x4
	set	0x74, %o2
	swapa	[%l7 + %o2] 0x18,	%o1
	orn	%l1,	0x0FFF,	%i5
	movrgez	%g2,	%l2,	%i0
	udivx	%l3,	0x185C,	%g7
	sir	0x0C63
	tvc	%xcc,	0x7
	nop
	setx	0x3EE69405,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x0B4FF499,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f24,	%f23
	nop
	fitos	%f11,	%f5
	fstox	%f5,	%f4
	fxtos	%f4,	%f19
	fandnot1	%f16,	%f6,	%f20
	set	0x28, %l2
	stxa	%i1,	[%l7 + %l2] 0x15
	addccc	%i2,	0x0799,	%o4
	movrlz	%l4,	%i3,	%o5
	brz,a	%l5,	loop_248
	subcc	%g4,	0x0C52,	%o2
	tge	%xcc,	0x3
	brgz,a	%o7,	loop_249
loop_248:
	edge32ln	%g1,	%i4,	%g6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7D] %asi,	%g5
loop_249:
	nop
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x04,	%i6
	movgu	%icc,	%l6,	%o0
	nop
	set	0x6F, %g1
	stb	%o6,	[%l7 + %g1]
	fnegs	%f1,	%f10
	bcc,a,pt	%icc,	loop_250
	fmovsneg	%icc,	%f7,	%f12
	or	%g3,	0x15F9,	%l0
	sdiv	%o3,	0x0C31,	%i6
loop_250:
	alignaddr	%o1,	%l1,	%i5
	edge32n	%g2,	%i0,	%l3
	andcc	%g7,	0x1F72,	%i1
	nop
	setx	0x63E18A84405FC892,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	taddcctv	%i2,	%o4,	%l4
	nop
	setx	0xAEAB635E806E52CA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fxnor	%f18,	%f12,	%f30
	move	%xcc,	%i3,	%l2
	te	%xcc,	0x2
	movneg	%xcc,	%l5,	%o5
	movleu	%xcc,	%o2,	%o7
	andncc	%g4,	%i4,	%g6
	udivcc	%g1,	0x1918,	%g5
	orn	%i7,	%o0,	%o6
	fbul,a	%fcc2,	loop_251
	bshuffle	%f18,	%f26,	%f16
	sir	0x06D0
	fbuge,a	%fcc0,	loop_252
loop_251:
	lduw	[%l7 + 0x60],	%g3
	ldub	[%l7 + 0x22],	%l0
	fblg	%fcc2,	loop_253
loop_252:
	fmovrsgz	%l6,	%f16,	%f18
	movne	%icc,	%o3,	%o1
	xnorcc	%i6,	%i5,	%g2
loop_253:
	tle	%icc,	0x3
	orcc	%l1,	%l3,	%i0
	edge32l	%g7,	%i1,	%i2
	srlx	%o4,	%i3,	%l4
	ldd	[%l7 + 0x78],	%f14
	mulscc	%l5,	0x06EF,	%l2
	fmovrsgez	%o5,	%f12,	%f10
	fnegd	%f10,	%f26
	bg,a	%icc,	loop_254
	sllx	%o2,	%g4,	%i4
	tleu	%xcc,	0x0
	tneg	%xcc,	0x0
loop_254:
	subc	%g6,	0x19EA,	%g1
	add	%o7,	%i7,	%o0
	fpsub16	%f0,	%f6,	%f30
	add	%o6,	%g3,	%g5
	fmovrdne	%l6,	%f8,	%f4
	set	0x18, %i5
	lduha	[%l7 + %i5] 0x89,	%o3
	tleu	%xcc,	0x2
	taddcctv	%o1,	0x1B29,	%l0
	fmuld8ulx16	%f29,	%f0,	%f14
	fsrc1s	%f7,	%f1
	set	0x30, %l1
	sta	%f13,	[%l7 + %l1] 0x10
	fpadd16	%f24,	%f28,	%f12
	addcc	%i5,	%g2,	%i6
	tneg	%xcc,	0x0
	udivx	%l3,	0x0969,	%i0
	faligndata	%f0,	%f6,	%f4
	fmovrdlez	%g7,	%f4,	%f20
	umulcc	%l1,	0x1AD4,	%i2
	brlz,a	%i1,	loop_255
	movvc	%xcc,	%i3,	%o4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
loop_255:
	sdivcc	%l2,	0x0800,	%o5
	fbo	%fcc2,	loop_256
	popc	0x1752,	%o2
	edge32n	%g4,	%i4,	%g6
	andcc	%g1,	0x126A,	%l5
loop_256:
	tne	%icc,	0x4
	movn	%xcc,	%o7,	%i7
	flush	%l7 + 0x6C
	edge8n	%o0,	%o6,	%g5
	smul	%g3,	0x0C86,	%l6
	taddcc	%o3,	0x1937,	%l0
	nop
	setx	0xA02E609B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xA7B5505F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f20,	%f29
	andcc	%o1,	0x0E1A,	%i5
	nop
	fitos	%f12,	%f0
	fstox	%f0,	%f26
	fmovde	%xcc,	%f10,	%f16
	movleu	%icc,	%g2,	%i6
	fbge	%fcc3,	loop_257
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x2BB0B951604BC120,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	set	0x16, %g4
	ldsba	[%l7 + %g4] 0x0c,	%l3
loop_257:
	nop
	setx	0x2FDD1A72,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f4
	movne	%icc,	%g7,	%l1
	mulscc	%i2,	%i1,	%i3
	umulcc	%o4,	0x0680,	%l4
	fmovdle	%xcc,	%f21,	%f2
	taddcctv	%i0,	0x08B8,	%o5
	ta	%xcc,	0x5
	fba,a	%fcc0,	loop_258
	edge8ln	%o2,	%g4,	%l2
	nop
	setx	0xAE097146,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x4C193D70,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f7,	%f24
	fpsub32s	%f12,	%f22,	%f27
loop_258:
	fcmpne32	%f30,	%f0,	%i4
	sdivx	%g1,	0x0F01,	%l5
	ba,pn	%icc,	loop_259
	edge8n	%g6,	%o7,	%o0
	nop
	fitod	%f0,	%f22
	fdtoi	%f22,	%f26
	fxnor	%f2,	%f18,	%f16
loop_259:
	mulx	%o6,	%g5,	%i7
	umulcc	%l6,	0x0F12,	%g3
	andcc	%o3,	0x0321,	%o1
	xorcc	%i5,	0x1601,	%l0
	fnot2	%f12,	%f20
	movrlez	%g2,	%i6,	%l3
	bl,a,pn	%xcc,	loop_260
	andcc	%l1,	0x1D65,	%g7
	stw	%i1,	[%l7 + 0x58]
	srlx	%i3,	%o4,	%l4
loop_260:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%i0,	0x1065,	%o5
	fmovsne	%xcc,	%f22,	%f12
	fmovdn	%icc,	%f4,	%f0
	alignaddr	%o2,	%i2,	%l2
	fmovsvc	%icc,	%f17,	%f0
	fmovdle	%icc,	%f29,	%f30
	alignaddrl	%i4,	%g4,	%l5
	movrlez	%g6,	%o7,	%o0
	edge32	%g1,	%o6,	%g5
	movpos	%xcc,	%i7,	%g3
	movl	%icc,	%o3,	%l6
	fmovrsgez	%i5,	%f2,	%f11
	tg	%icc,	0x3
	nop
	fitos	%f2,	%f5
	fstoi	%f5,	%f19
	subc	%l0,	%o1,	%g2
	tvs	%xcc,	0x6
	tcs	%xcc,	0x3
	bcc,a	loop_261
	movcc	%xcc,	%l3,	%i6
	fexpand	%f2,	%f18
	tne	%xcc,	0x1
loop_261:
	stbar
	nop
	setx	0x0EACDBD6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xB17964EC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f14,	%f26
	movge	%icc,	%l1,	%i1
	edge16l	%g7,	%i3,	%o4
	or	%i0,	0x14E8,	%o5
	fsrc1	%f6,	%f8
	movpos	%xcc,	%l4,	%i2
	fones	%f19
	fnors	%f8,	%f9,	%f16
	fnot1s	%f15,	%f23
	nop
	setx	loop_262,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16au	%f5,	%f19,	%f20
	tsubcctv	%l2,	0x158B,	%i4
	movle	%xcc,	%g4,	%l5
loop_262:
	bcs	%xcc,	loop_263
	fmovdcc	%icc,	%f13,	%f18
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x14
loop_263:
	fornot2s	%f0,	%f24,	%f12
	mulscc	%o2,	0x1DB4,	%g6
	ba,a,pt	%icc,	loop_264
	subc	%o7,	0x0416,	%o0
	fsrc1s	%f1,	%f31
	fmovrdgez	%o6,	%f12,	%f22
loop_264:
	andncc	%g1,	%g5,	%g3
	fnot1	%f0,	%f2
	tg	%xcc,	0x3
	nop
	setx	0x5BEB5499,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f4
	orncc	%o3,	0x1DBC,	%i7
	edge32	%i5,	%l6,	%l0
	movpos	%xcc,	%g2,	%l3
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	setx	0xEE729C02E07B7251,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fmovs	%f3,	%f6
	stbar
	edge16	%i6,	%o1,	%i1
	orncc	%l1,	%g7,	%o4
	movrlz	%i3,	0x26B,	%i0
	andcc	%o5,	%i2,	%l4
	mulx	%i4,	0x1222,	%g4
	nop
	fitos	%f30,	%f23
	udivx	%l5,	0x16E4,	%o2
	tne	%icc,	0x2
	nop
	fitos	%f14,	%f1
	fstox	%f1,	%f30
	tsubcctv	%g6,	%l2,	%o7
	udivx	%o6,	0x0FF8,	%o0
	fmuld8sux16	%f24,	%f26,	%f24
	tpos	%xcc,	0x1
	subc	%g1,	0x0229,	%g3
	fbul,a	%fcc3,	loop_265
	tvs	%icc,	0x5
	wr	%g0,	0x18,	%asi
	stha	%o3,	[%l7 + 0x1A] %asi
loop_265:
	te	%icc,	0x0
	ldsb	[%l7 + 0x2E],	%i7
	edge16n	%g5,	%i5,	%l6
	fabsd	%f24,	%f6
	movrgez	%g2,	%l0,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_266,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movge	%xcc,	%o1,	%l3
	sub	%i1,	0x1151,	%l1
	fbug,a	%fcc0,	loop_267
loop_266:
	edge32l	%o4,	%i3,	%i0
	nop
	setx	0x6E24BAC81BFC88DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x6AFD50942DBE4860,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f8,	%f20
	tne	%xcc,	0x6
loop_267:
	brlez,a	%g7,	loop_268
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f16
	fbug	%fcc3,	loop_269
loop_268:
	st	%f26,	[%l7 + 0x5C]
	sethi	0x18BA,	%o5
	nop
	setx	0x82649482505D5711,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_269:
	bvs	loop_270
	udiv	%l4,	0x11AE,	%i2
	bvs	loop_271
	fones	%f30
loop_270:
	fpsub32	%f30,	%f30,	%f30
	ldub	[%l7 + 0x62],	%i4
loop_271:
	tsubcctv	%g4,	0x0D0C,	%l5
	fbug	%fcc2,	loop_272
	tsubcctv	%g6,	0x0A72,	%l2
	bge,pn	%xcc,	loop_273
	fcmpne32	%f16,	%f22,	%o7
loop_272:
	orcc	%o2,	0x08BA,	%o6
	nop
	setx loop_274, %l0, %l1
	jmpl %l1, %o0
loop_273:
	fpack32	%f20,	%f4,	%f10
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f30
	fxtod	%f30,	%f14
	orcc	%g3,	%o3,	%i7
loop_274:
	fcmple32	%f18,	%f0,	%g5
	fmovdpos	%xcc,	%f12,	%f18
	bneg,a,pt	%xcc,	loop_275
	tleu	%xcc,	0x1
	movl	%xcc,	%g1,	%i5
	fmovsn	%xcc,	%f29,	%f19
loop_275:
	tle	%xcc,	0x5
	fbul	%fcc2,	loop_276
	edge8	%l6,	%g2,	%i6
	sir	0x136B
	or	%l0,	0x0FE7,	%l3
loop_276:
	edge8l	%o1,	%l1,	%o4
	fandnot2s	%f28,	%f0,	%f0
	array32	%i1,	%i0,	%i3
	udiv	%o5,	0x0B78,	%g7
	ble	%icc,	loop_277
	sllx	%i2,	0x18,	%l4
	andn	%i4,	%g4,	%l5
	sll	%l2,	0x09,	%o7
loop_277:
	fxnor	%f28,	%f28,	%f6
	fmovsn	%xcc,	%f26,	%f12
	nop
	setx loop_278, %l0, %l1
	jmpl %l1, %g6
	subcc	%o2,	%o0,	%o6
	bneg,a	loop_279
	nop
	setx	0xA06FC57D,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
loop_278:
	brnz	%o3,	loop_280
	edge32	%g3,	%g5,	%g1
loop_279:
	movvs	%xcc,	%i7,	%l6
	fxors	%f6,	%f20,	%f19
loop_280:
	sir	0x11C9
	orcc	%g2,	0x1D97,	%i6
	fmovdg	%xcc,	%f8,	%f26
	movgu	%xcc,	%i5,	%l3
	lduw	[%l7 + 0x44],	%o1
	alignaddrl	%l0,	%o4,	%l1
	addc	%i1,	%i3,	%i0
	array16	%o5,	%g7,	%i2
	ldsh	[%l7 + 0x38],	%l4
	smulcc	%g4,	0x1840,	%i4
	ta	%icc,	0x2
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x61] %asi,	%l5
	st	%f16,	[%l7 + 0x74]
	movrgz	%o7,	%l2,	%o2
	movneg	%xcc,	%o0,	%o6
	sethi	0x0376,	%g6
	addccc	%o3,	%g5,	%g1
	edge32n	%i7,	%l6,	%g2
	subccc	%i6,	%g3,	%i5
	addccc	%l3,	0x0E32,	%o1
	tgu	%icc,	0x3
	tge	%xcc,	0x1
	movgu	%xcc,	%o4,	%l0
	ldstub	[%l7 + 0x46],	%i1
	fmovrse	%i3,	%f4,	%f12
	srlx	%l1,	0x0C,	%i0
	fmul8x16al	%f4,	%f31,	%f8
	movrgz	%g7,	%i2,	%l4
	fmovrsgez	%g4,	%f25,	%f1
	fpadd16	%f24,	%f8,	%f28
	edge8ln	%i4,	%l5,	%o7
	tcc	%xcc,	0x1
	fbl	%fcc3,	loop_281
	movgu	%icc,	%o5,	%o2
	edge32n	%l2,	%o6,	%g6
	fandnot2	%f6,	%f30,	%f22
loop_281:
	orncc	%o3,	%g5,	%o0
	fcmpne16	%f22,	%f24,	%i7
	udivcc	%l6,	0x0073,	%g1
	xnorcc	%g2,	0x1CF1,	%i6
	tg	%xcc,	0x4
	tsubcc	%i5,	%g3,	%l3
	and	%o4,	0x1402,	%o1
	nop
	set	0x56, %g7
	lduh	[%l7 + %g7],	%i1
	tvs	%icc,	0x4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x1E] %asi,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%i3,	loop_282
	tgu	%xcc,	0x7
	set	0x28, %i6
	lduwa	[%l7 + %i6] 0x88,	%i0
loop_282:
	bvs,a,pt	%xcc,	loop_283
	ldx	[%l7 + 0x20],	%l1
	srl	%i2,	0x18,	%g7
	tsubcctv	%g4,	0x0AF3,	%l4
loop_283:
	fmovsne	%xcc,	%f27,	%f18
	fmovsle	%xcc,	%f19,	%f12
	andncc	%i4,	%l5,	%o5
	fnor	%f20,	%f16,	%f8
	sir	0x1CFB
	tge	%xcc,	0x5
	fandnot2	%f12,	%f26,	%f6
	xnor	%o7,	%o2,	%l2
	fmovspos	%icc,	%f6,	%f12
	fpadd16s	%f6,	%f5,	%f1
	andn	%g6,	0x0AD9,	%o3
	fpsub16s	%f28,	%f24,	%f19
	movleu	%icc,	%o6,	%g5
	addccc	%i7,	%o0,	%l6
	movleu	%icc,	%g1,	%i6
	te	%xcc,	0x7
	fpsub16s	%f28,	%f18,	%f5
	movrlez	%i5,	%g2,	%l3
	movneg	%xcc,	%o4,	%g3
	umulcc	%i1,	%o1,	%l0
	sdiv	%i3,	0x0B11,	%l1
	brgz,a	%i2,	loop_284
	brz	%g7,	loop_285
	srl	%g4,	0x09,	%i0
	tge	%xcc,	0x2
loop_284:
	array32	%l4,	%l5,	%i4
loop_285:
	umul	%o5,	%o2,	%l2
	srlx	%g6,	%o3,	%o6
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x1c0] %asi,	%o7 ripped by fixASI40.pl ripped by fixASI40.pl
	brgz,a	%i7,	loop_286
	orcc	%g5,	0x1E5A,	%l6
	sethi	0x1F75,	%g1
	sdivcc	%i6,	0x02B8,	%i5
loop_286:
	ldsw	[%l7 + 0x48],	%o0
	fcmple16	%f0,	%f28,	%l3
	fxnor	%f28,	%f22,	%f30
	popc	%o4,	%g2
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x50] %asi,	%g3
	fand	%f24,	%f18,	%f30
	nop
	fitos	%f12,	%f15
	fstod	%f15,	%f26
	umul	%i1,	0x0857,	%l0
	edge16	%i3,	%l1,	%i2
	movpos	%icc,	%o1,	%g4
	brgz,a	%i0,	loop_287
	srl	%g7,	%l4,	%l5
	stw	%o5,	[%l7 + 0x3C]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_287:
	tgu	%xcc,	0x2
	brgez,a	%i4,	loop_288
	edge16	%o2,	%l2,	%o3
	orcc	%o6,	0x0DE8,	%g6
	movle	%xcc,	%i7,	%o7
loop_288:
	pdist	%f2,	%f22,	%f14
	and	%g5,	%g1,	%l6
	nop
	setx	0x2064CC0E,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	movrgz	%i6,	%i5,	%l3
	edge16n	%o4,	%g2,	%o0
	movcs	%icc,	%g3,	%l0
	sll	%i3,	0x0E,	%i1
	set	0x74, %o7
	ldsha	[%l7 + %o7] 0x15,	%l1
	fbule	%fcc0,	loop_289
	movleu	%xcc,	%i2,	%o1
	tpos	%icc,	0x0
	ta	%icc,	0x4
loop_289:
	movle	%icc,	%i0,	%g4
	set	0x18, %i7
	stba	%l4,	[%l7 + %i7] 0x10
	sethi	0x067D,	%g7
	movn	%xcc,	%o5,	%l5
	edge8	%i4,	%l2,	%o2
	taddcctv	%o3,	0x1C09,	%g6
	ba,a	%icc,	loop_290
	tvs	%xcc,	0x5
	and	%o6,	0x1FA5,	%o7
	edge16ln	%i7,	%g1,	%g5
loop_290:
	edge8ln	%i6,	%i5,	%l6
	fmovdcc	%xcc,	%f1,	%f3
	movl	%xcc,	%o4,	%g2
	ta	%icc,	0x5
	bcc,a,pn	%icc,	loop_291
	fmovdleu	%icc,	%f31,	%f0
	movvs	%icc,	%o0,	%g3
	nop
	fitos	%f18,	%f12
loop_291:
	fmovdpos	%icc,	%f8,	%f29
	tl	%icc,	0x0
	lduh	[%l7 + 0x42],	%l3
	edge8l	%i3,	%i1,	%l1
	taddcctv	%i2,	%o1,	%i0
	movrne	%l0,	0x09C,	%g4
	call	loop_292
	orcc	%g7,	%o5,	%l4
	fexpand	%f17,	%f28
	movl	%xcc,	%i4,	%l5
loop_292:
	fsrc1	%f6,	%f28
	fmovdge	%xcc,	%f3,	%f13
	fandnot2s	%f14,	%f19,	%f5
	pdist	%f14,	%f28,	%f30
	subc	%l2,	0x1832,	%o3
	taddcc	%o2,	0x14B9,	%g6
	wr	%g0,	0x2a,	%asi
	stba	%o7,	[%l7 + 0x77] %asi
	membar	#Sync
	bl	%xcc,	loop_293
	bshuffle	%f26,	%f8,	%f4
	xnor	%o6,	%g1,	%g5
	edge16	%i6,	%i5,	%i7
loop_293:
	fcmpeq16	%f14,	%f24,	%l6
	edge8n	%o4,	%g2,	%o0
	edge32ln	%l3,	%g3,	%i3
	srax	%i1,	0x1C,	%l1
	or	%o1,	0x08BF,	%i0
	fmovdg	%icc,	%f23,	%f11
	brgez	%i2,	loop_294
	movneg	%xcc,	%g4,	%l0
	subc	%o5,	%g7,	%l4
	fbuge	%fcc1,	loop_295
loop_294:
	fble	%fcc1,	loop_296
	ldsh	[%l7 + 0x7C],	%i4
	tpos	%icc,	0x5
loop_295:
	ta	%xcc,	0x2
loop_296:
	xorcc	%l2,	0x1382,	%l5
	set	0x30, %g6
	stwa	%o2,	[%l7 + %g6] 0x80
	tsubcc	%g6,	%o7,	%o3
	nop
	fitos	%f10,	%f23
	fstox	%f23,	%f20
	fxtos	%f20,	%f24
	fpack16	%f0,	%f19
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x50] %asi,	%g0
	st	%f12,	[%l7 + 0x44]
	movne	%xcc,	%o6,	%i6
	edge32	%i5,	%g5,	%i7
	fmovscc	%xcc,	%f20,	%f30
	nop
	fitod	%f6,	%f8
	fdtoi	%f8,	%f17
	array32	%o4,	%l6,	%g2
	xnor	%o0,	0x1FF4,	%g3
	fmul8x16au	%f15,	%f19,	%f10
	movl	%xcc,	%l3,	%i1
	bshuffle	%f24,	%f0,	%f0
	tsubcc	%l1,	%o1,	%i3
	edge16ln	%i2,	%i0,	%l0
	fba,a	%fcc3,	loop_297
	nop
	setx	loop_298,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_299,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%o5,	%g7,	%g4
loop_297:
	movcs	%icc,	%i4,	%l4
loop_298:
	membar	0x5C
loop_299:
	sra	%l2,	0x12,	%o2
	sra	%g6,	0x0F,	%l5
	lduw	[%l7 + 0x48],	%o7
	udivcc	%g1,	0x198E,	%o6
	andcc	%i6,	%i5,	%g5
	nop
	setx	0xE071982A,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	fmul8sux16	%f26,	%f26,	%f4
	udivx	%o3,	0x1A9D,	%o4
	popc	%i7,	%l6
	edge32n	%g2,	%o0,	%g3
	bvc,a	%icc,	loop_300
	bn,a,pt	%xcc,	loop_301
	tvc	%xcc,	0x6
	fmovsle	%icc,	%f9,	%f28
loop_300:
	addccc	%l3,	%l1,	%o1
loop_301:
	stw	%i1,	[%l7 + 0x28]
	bcs,a,pn	%icc,	loop_302
	edge16	%i2,	%i0,	%l0
	fmovsl	%xcc,	%f15,	%f28
	umulcc	%o5,	%i3,	%g4
loop_302:
	sth	%i4,	[%l7 + 0x6A]
	bshuffle	%f28,	%f22,	%f12
	tpos	%xcc,	0x4
	bne,pt	%icc,	loop_303
	swap	[%l7 + 0x30],	%g7
	andncc	%l2,	%l4,	%o2
	tge	%icc,	0x7
loop_303:
	xor	%l5,	0x19CA,	%o7
	set	0x5C, %o6
	ldsha	[%l7 + %o6] 0x80,	%g1
	movvc	%xcc,	%g6,	%o6
	mulscc	%i6,	%i5,	%o3
	movneg	%xcc,	%g5,	%i7
	fmovdvc	%xcc,	%f22,	%f12
	andn	%o4,	0x1720,	%g2
	membar	0x10
	array32	%o0,	%g3,	%l3
	tg	%icc,	0x2
	tg	%xcc,	0x1
	edge8l	%l1,	%o1,	%i1
	fbe,a	%fcc3,	loop_304
	udiv	%l6,	0x0D47,	%i2
	fnors	%f25,	%f20,	%f21
	udivcc	%i0,	0x0808,	%l0
loop_304:
	tn	%xcc,	0x0
	array16	%o5,	%g4,	%i3
	set	0x58, %o4
	ldswa	[%l7 + %o4] 0x19,	%g7
	bpos,a	loop_305
	alignaddrl	%i4,	%l4,	%o2
	movge	%xcc,	%l5,	%o7
	ld	[%l7 + 0x20],	%f17
loop_305:
	ldsw	[%l7 + 0x58],	%g1
	set	0x68, %g5
	ldswa	[%l7 + %g5] 0x15,	%l2
	add	%o6,	0x0B96,	%g6
	tvc	%xcc,	0x5
	fbn	%fcc0,	loop_306
	sll	%i5,	0x01,	%i6
	movleu	%icc,	%o3,	%g5
	edge8ln	%i7,	%g2,	%o4
loop_306:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%l3
	movrlez	%g3,	%o1,	%l1
	te	%xcc,	0x6
	tg	%icc,	0x0
	edge8n	%l6,	%i2,	%i0
	faligndata	%f28,	%f8,	%f8
	fmovdneg	%xcc,	%f1,	%f27
	edge16n	%i1,	%l0,	%g4
	movvs	%xcc,	%i3,	%g7
	mova	%xcc,	%o5,	%l4
	movrne	%i4,	0x060,	%o2
	membar	0x46
	taddcc	%l5,	%o7,	%g1
	tcs	%icc,	0x4
	fba,a	%fcc1,	loop_307
	fornot1	%f22,	%f30,	%f26
	movn	%xcc,	%l2,	%o6
	movgu	%xcc,	%i5,	%i6
loop_307:
	smul	%g6,	0x0E4A,	%o3
	fmovsle	%icc,	%f16,	%f14
	movleu	%xcc,	%g5,	%i7
	movn	%icc,	%g2,	%o4
	bpos,a	loop_308
	fcmple16	%f10,	%f24,	%o0
	fnegs	%f16,	%f19
	alignaddr	%l3,	%g3,	%l1
loop_308:
	tsubcc	%l6,	0x06B9,	%i2
	brnz,a	%i0,	loop_309
	ldsh	[%l7 + 0x58],	%o1
	fmovs	%f0,	%f23
	fpack16	%f22,	%f1
loop_309:
	tne	%xcc,	0x0
	smulcc	%i1,	0x154E,	%g4
	brnz,a	%i3,	loop_310
	movvs	%icc,	%g7,	%o5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x58] %asi,	%l0
loop_310:
	nop
	setx	loop_311,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	popc	%l4,	%o2
	tleu	%xcc,	0x0
	edge16	%i4,	%l5,	%g1
loop_311:
	movrlez	%o7,	0x2EC,	%l2
	movrgz	%i5,	%o6,	%i6
	edge32ln	%g6,	%g5,	%o3
	fmovrse	%g2,	%f30,	%f15
	tl	%xcc,	0x0
	movrgz	%i7,	%o0,	%l3
	xor	%g3,	%o4,	%l6
	sdivcc	%i2,	0x1157,	%l1
	tge	%icc,	0x1
	nop
	setx	0x0A0AAFF2A7E710BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f16
	movcc	%icc,	%i0,	%o1
	bleu	%xcc,	loop_312
	edge32	%i1,	%g4,	%i3
	bl,pn	%xcc,	loop_313
	udivcc	%g7,	0x160F,	%l0
loop_312:
	bcs,a	%icc,	loop_314
	fmul8ulx16	%f24,	%f0,	%f28
loop_313:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f4,	%f9
loop_314:
	fmovd	%f4,	%f2
	nop
	setx	0xBEA1C464607E3E65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	te	%xcc,	0x7
	fcmpeq32	%f8,	%f24,	%l4
	tneg	%xcc,	0x4
	addc	%o5,	%i4,	%o2
	move	%icc,	%g1,	%l5
	edge8l	%o7,	%i5,	%o6
	ldstub	[%l7 + 0x7D],	%l2
	movcc	%xcc,	%g6,	%i6
	movgu	%xcc,	%g5,	%o3
	umulcc	%i7,	0x0683,	%o0
	fmovdpos	%xcc,	%f30,	%f20
	andncc	%l3,	%g2,	%g3
	subc	%o4,	%i2,	%l1
	movrne	%i0,	%l6,	%i1
	edge8	%o1,	%g4,	%i3
	edge16n	%l0,	%g7,	%o5
	movl	%xcc,	%i4,	%l4
	fbl,a	%fcc2,	loop_315
	orcc	%g1,	%o2,	%o7
	fmovde	%icc,	%f13,	%f16
	orcc	%i5,	%o6,	%l2
loop_315:
	fmovsvc	%xcc,	%f27,	%f22
	sdivcc	%g6,	0x1E66,	%l5
	movne	%icc,	%i6,	%o3
	set	0x08, %i3
	ldxa	[%l7 + %i3] 0x15,	%i7
	tne	%xcc,	0x1
	fmovrdgez	%o0,	%f10,	%f4
	sub	%g5,	0x03EC,	%g2
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x40] %asi,	%l2
	movrne	%g3,	0x1FE,	%o4
	mulscc	%i2,	%i0,	%l1
	movrne	%l6,	0x2DD,	%o1
	edge32	%i1,	%i3,	%l0
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
	fmovsne	%icc,	%f8,	%f5
	brgez	%g4,	loop_317
	ldsw	[%l7 + 0x24],	%g7
loop_316:
	edge16l	%i4,	%o5,	%l4
	andncc	%g1,	%o7,	%i5
loop_317:
	andn	%o2,	%l2,	%g6
	movcc	%xcc,	%o6,	%l5
	fxor	%f6,	%f6,	%f18
	edge16ln	%i6,	%i7,	%o3
	mulscc	%g5,	0x1023,	%o0
	set	0x18, %o1
	stxa	%g2,	[%l7 + %o1] 0x2a
	membar	#Sync
	taddcctv	%l3,	0x12F9,	%o4
	subc	%i2,	0x07FD,	%i0
	tgu	%xcc,	0x6
	sethi	0x1F7C,	%g3
	fbne,a	%fcc2,	loop_318
	sdivx	%l1,	0x1A77,	%o1
	movgu	%xcc,	%l6,	%i3
	tne	%icc,	0x3
loop_318:
	fpadd16	%f4,	%f18,	%f26
	srlx	%i1,	%l0,	%g4
	bge,a,pt	%xcc,	loop_319
	mulx	%i4,	%g7,	%l4
	set	0x30, %o3
	stwa	%g1,	[%l7 + %o3] 0x2b
	membar	#Sync
loop_319:
	edge8	%o7,	%o5,	%i5
	fmovdge	%xcc,	%f30,	%f11
	movne	%icc,	%l2,	%g6
	set	0x56, %l6
	lduha	[%l7 + %l6] 0x0c,	%o2
	fxnor	%f24,	%f20,	%f0
	sra	%l5,	%i6,	%i7
	tsubcctv	%o3,	0x06C2,	%g5
	sdivcc	%o0,	0x0D4F,	%g2
	edge16l	%o6,	%l3,	%i2
	fmovsneg	%icc,	%f5,	%f14
	pdist	%f16,	%f14,	%f24
	fmovrslez	%i0,	%f28,	%f25
	movrgz	%g3,	0x14C,	%o4
	edge16l	%o1,	%l6,	%l1
	bcc	loop_320
	fmul8x16	%f12,	%f14,	%f10
	movvs	%icc,	%i1,	%i3
	movleu	%xcc,	%g4,	%l0
loop_320:
	fcmple32	%f2,	%f10,	%g7
	move	%xcc,	%i4,	%l4
	nop
	setx	0x6B5AE3FED04BF8F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	edge16ln	%g1,	%o5,	%o7
	fnot1	%f12,	%f20
	movrne	%l2,	0x031,	%i5
	movrlez	%o2,	0x1AD,	%l5
	movleu	%icc,	%i6,	%g6
	srl	%o3,	%g5,	%o0
	fsrc2s	%f28,	%f5
	ldx	[%l7 + 0x40],	%g2
	add	%o6,	0x06A9,	%l3
	fsrc2s	%f8,	%f3
	set	0x40, %o0
	stda	%f0,	[%l7 + %o0] 0x15
	edge16l	%i7,	%i2,	%g3
	fmovsn	%icc,	%f13,	%f19
	movn	%xcc,	%o4,	%i0
	xnorcc	%l6,	0x1C89,	%o1
	ldsh	[%l7 + 0x2E],	%i1
	te	%xcc,	0x7
	mulscc	%l1,	0x06DA,	%g4
	set	0x24, %g3
	lduwa	[%l7 + %g3] 0x14,	%l0
	ldub	[%l7 + 0x35],	%i3
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x1A] %asi,	%g7
	orcc	%l4,	0x07C0,	%i4
	movrlez	%o5,	%o7,	%l2
	edge8ln	%g1,	%i5,	%o2
	andncc	%i6,	%g6,	%o3
	bneg,a,pn	%icc,	loop_321
	stx	%l5,	[%l7 + 0x28]
	popc	0x197E,	%g5
	addccc	%o0,	0x1828,	%g2
loop_321:
	stbar
	ldx	[%l7 + 0x60],	%o6
	nop
	set	0x3C, %g2
	ldsw	[%l7 + %g2],	%i7
	movrlz	%l3,	%g3,	%i2
	alignaddrl	%i0,	%o4,	%o1
	tne	%xcc,	0x4
	ta	%xcc,	0x7
	fzeros	%f17
	fbl,a	%fcc1,	loop_322
	movcs	%xcc,	%l6,	%i1
	flush	%l7 + 0x4C
	fbo	%fcc0,	loop_323
loop_322:
	bg,a,pt	%xcc,	loop_324
	sll	%l1,	%g4,	%i3
	sub	%g7,	0x0A30,	%l4
loop_323:
	fmul8sux16	%f24,	%f10,	%f2
loop_324:
	subc	%i4,	%l0,	%o5
	movneg	%icc,	%l2,	%g1
	tne	%xcc,	0x4
	movpos	%xcc,	%i5,	%o7
	addccc	%o2,	%i6,	%g6
	sdivx	%o3,	0x130C,	%l5
	fmovs	%f12,	%f1
	fbule	%fcc1,	loop_325
	fmovrsgz	%g5,	%f12,	%f31
	udivcc	%o0,	0x170A,	%g2
	sub	%o6,	%l3,	%i7
loop_325:
	fabsd	%f0,	%f6
	fmul8ulx16	%f16,	%f22,	%f28
	movg	%icc,	%i2,	%g3
	umul	%i0,	0x08C4,	%o1
	fmovsleu	%icc,	%f23,	%f16
	movneg	%icc,	%o4,	%l6
	movvc	%icc,	%i1,	%l1
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x89,	%i3,	%g4
	udivcc	%g7,	0x08C1,	%l4
	move	%icc,	%l0,	%o5
	ble	%icc,	loop_326
	stw	%l2,	[%l7 + 0x24]
	fabsd	%f24,	%f28
	fbug	%fcc3,	loop_327
loop_326:
	fnot2	%f12,	%f30
	addcc	%i4,	0x171D,	%g1
	taddcctv	%o7,	%o2,	%i6
loop_327:
	movle	%xcc,	%i5,	%o3
	tg	%xcc,	0x3
	fsrc2	%f6,	%f28
	ldub	[%l7 + 0x63],	%g6
	fandnot1	%f10,	%f4,	%f20
	sdiv	%g5,	0x17A6,	%l5
	mulscc	%g2,	%o6,	%l3
	movcc	%icc,	%o0,	%i7
	set	0x33, %i2
	lduba	[%l7 + %i2] 0x88,	%i2
	bvs,pn	%xcc,	loop_328
	brgez	%g3,	loop_329
	tvc	%xcc,	0x0
	andncc	%o1,	%i0,	%o4
loop_328:
	movpos	%xcc,	%l6,	%i1
loop_329:
	fxors	%f3,	%f7,	%f5
	array32	%l1,	%i3,	%g7
	fmovdleu	%icc,	%f23,	%f19
	edge32ln	%g4,	%l4,	%o5
	sir	0x094C
	sll	%l0,	%i4,	%l2
	movrne	%g1,	0x2B1,	%o7
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sdivx	%o2,	0x1DDF,	%i5
	stbar
	brgz	%i6,	loop_330
	edge32n	%g6,	%o3,	%l5
	and	%g5,	%g2,	%l3
	fbge,a	%fcc3,	loop_331
loop_330:
	edge16n	%o6,	%i7,	%o0
	nop
	setx	0xD2FA7223,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x9AE76927,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fsubs	%f30,	%f6,	%f29
	movvc	%icc,	%i2,	%g3
loop_331:
	fornot2s	%f10,	%f16,	%f7
	tle	%icc,	0x5
	fpsub32	%f0,	%f10,	%f14
	fmovde	%icc,	%f17,	%f1
	fnot2	%f4,	%f16
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x1E],	%i0
	fsrc1s	%f0,	%f28
	fmovrdlz	%o1,	%f16,	%f10
	movrlz	%o4,	0x16C,	%l6
	movn	%xcc,	%i1,	%i3
	fmovrslez	%l1,	%f15,	%f16
	popc	0x187A,	%g4
	tvs	%icc,	0x0
	fandnot2	%f12,	%f8,	%f20
	movneg	%xcc,	%l4,	%o5
	tsubcctv	%l0,	0x1ADB,	%g7
	tsubcc	%i4,	0x180E,	%l2
	edge16	%o7,	%o2,	%i5
	tne	%icc,	0x0
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x89,	%g1,	%i6
	orncc	%g6,	0x16AC,	%o3
	fbge	%fcc1,	loop_332
	nop
	set	0x3E, %i4
	sth	%l5,	[%l7 + %i4]
	addccc	%g2,	0x19DE,	%g5
	bcc,a	%xcc,	loop_333
loop_332:
	call	loop_334
	movrlez	%l3,	0x3E6,	%o6
	movg	%icc,	%i7,	%i2
loop_333:
	swap	[%l7 + 0x1C],	%o0
loop_334:
	xor	%i0,	0x01E3,	%g3
	smul	%o4,	0x032A,	%l6
	movrlz	%i1,	0x37B,	%i3
	be,a	loop_335
	sub	%o1,	0x1175,	%l1
	brgez,a	%g4,	loop_336
	tpos	%icc,	0x7
loop_335:
	xorcc	%l4,	0x0EB6,	%l0
	sir	0x0966
loop_336:
	orcc	%g7,	%o5,	%i4
	xnor	%o7,	0x0DE1,	%o2
	movcc	%xcc,	%i5,	%l2
	movcc	%icc,	%i6,	%g1
	set	0x48, %l3
	prefetcha	[%l7 + %l3] 0x89,	 0x0
	fbge	%fcc2,	loop_337
	bg	loop_338
	tvc	%xcc,	0x6
	subc	%l5,	0x0D0F,	%g2
loop_337:
	movn	%xcc,	%g5,	%g6
loop_338:
	edge32l	%l3,	%o6,	%i7
	movle	%xcc,	%i2,	%o0
	array8	%i0,	%g3,	%l6
	or	%o4,	%i1,	%o1
	bvc,a,pt	%icc,	loop_339
	fmovd	%f10,	%f2
	nop
	set	0x60, %i0
	stx	%l1,	[%l7 + %i0]
	fmovdpos	%icc,	%f20,	%f25
loop_339:
	srax	%g4,	%l4,	%i3
	for	%f2,	%f18,	%f4
	nop
	setx	0xD77A1C1AF75D417F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x153DEB8349C65532,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f12,	%f16
	edge8ln	%g7,	%o5,	%l0
	bcc,pn	%icc,	loop_340
	fnot1s	%f24,	%f23
	te	%xcc,	0x7
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_340:
	fba	%fcc3,	loop_341
	xor	%i4,	0x175E,	%o2
	xor	%i5,	0x134D,	%o7
	fbge,a	%fcc2,	loop_342
loop_341:
	array8	%l2,	%i6,	%o3
	nop
	setx	loop_343,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	faligndata	%f26,	%f16,	%f2
loop_342:
	tgu	%icc,	0x2
	mova	%icc,	%l5,	%g1
loop_343:
	tgu	%icc,	0x3
	ldsw	[%l7 + 0x20],	%g2
	movvs	%xcc,	%g6,	%l3
	movrlez	%o6,	%g5,	%i7
	fzeros	%f14
	stw	%o0,	[%l7 + 0x10]
	stbar
	fmovscc	%xcc,	%f11,	%f28
	mulscc	%i2,	0x14AC,	%i0
	fba,a	%fcc2,	loop_344
	fmovrse	%g3,	%f2,	%f6
	tsubcc	%o4,	0x1AC2,	%l6
	fbo	%fcc0,	loop_345
loop_344:
	fmovscs	%icc,	%f6,	%f23
	movg	%xcc,	%i1,	%o1
	std	%f12,	[%l7 + 0x20]
loop_345:
	andn	%g4,	0x0663,	%l4
	fmovsge	%xcc,	%f15,	%f25
	movcc	%icc,	%l1,	%g7
	fmovdle	%icc,	%f21,	%f21
	nop
	setx	0x049EE93A20638012,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fmovrdne	%o5,	%f30,	%f10
	andncc	%i3,	%i4,	%l0
	fors	%f20,	%f1,	%f5
	fpackfix	%f0,	%f31
	fbule	%fcc1,	loop_346
	movvc	%xcc,	%i5,	%o7
	fmovsge	%icc,	%f28,	%f4
	andn	%l2,	%i6,	%o3
loop_346:
	tcs	%xcc,	0x3
	ta	%xcc,	0x2
	udivx	%o2,	0x06D7,	%g1
	edge8n	%l5,	%g6,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o6,	%g5
	edge32ln	%g2,	%o0,	%i2
	ta	%icc,	0x5
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i7
	te	%icc,	0x5
	and	%i0,	0x1804,	%o4
	edge32l	%g3,	%l6,	%i1
	set	0x78, %i1
	lduwa	[%l7 + %i1] 0x15,	%g4
	stb	%o1,	[%l7 + 0x70]
	membar	0x68
	fmovdvc	%icc,	%f7,	%f8
	add	%l4,	%g7,	%o5
	or	%l1,	0x1817,	%i3
	fmovsge	%icc,	%f13,	%f0
	fble	%fcc3,	loop_347
	xnor	%i4,	0x0280,	%l0
	mulscc	%o7,	%l2,	%i5
	fmovrsne	%o3,	%f25,	%f8
loop_347:
	nop
	setx	0x707A42D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	taddcc	%o2,	%i6,	%l5
	te	%icc,	0x1
	fornot2s	%f14,	%f23,	%f17
	fmovsne	%xcc,	%f9,	%f0
	movg	%icc,	%g6,	%g1
	te	%xcc,	0x2
	udivcc	%l3,	0x1E15,	%o6
	edge8ln	%g2,	%g5,	%o0
	bshuffle	%f28,	%f22,	%f16
	movvs	%xcc,	%i2,	%i0
	lduw	[%l7 + 0x0C],	%i7
	wr	%g0,	0x81,	%asi
	stwa	%o4,	[%l7 + 0x3C] %asi
	addc	%l6,	0x0E31,	%i1
	ble	%xcc,	loop_348
	sll	%g3,	0x0E,	%o1
	movg	%xcc,	%g4,	%l4
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x50] %asi,	%o5
loop_348:
	array16	%l1,	%i3,	%i4
	sra	%l0,	%g7,	%o7
	movre	%i5,	0x1B5,	%l2
	brnz	%o3,	loop_349
	fmuld8ulx16	%f17,	%f19,	%f28
	fnegd	%f12,	%f20
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o2
	casa	[%l6] %asi,	%o2,	%l5
loop_349:
	fmovsg	%icc,	%f23,	%f11
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc3,	loop_350
	movg	%icc,	%g6,	%g1
	xnor	%i6,	0x1286,	%o6
	ldd	[%l7 + 0x30],	%f22
loop_350:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l3,	%g5,	%g2
	call	loop_351
	fmovrslez	%o0,	%f7,	%f28
	sethi	0x1CE0,	%i0
	edge32n	%i7,	%i2,	%o4
loop_351:
	orcc	%l6,	%g3,	%i1
	brz,a	%g4,	loop_352
	stx	%o1,	[%l7 + 0x68]
	set	0x42, %l4
	stha	%o5,	[%l7 + %l4] 0x18
loop_352:
	ldd	[%l7 + 0x10],	%f20
	movleu	%xcc,	%l1,	%l4
	be,pt	%xcc,	loop_353
	array8	%i4,	%i3,	%g7
	fmovdn	%xcc,	%f1,	%f20
	movne	%icc,	%l0,	%i5
loop_353:
	sllx	%o7,	%o3,	%o2
	movcc	%icc,	%l5,	%l2
	fmovdn	%icc,	%f24,	%f16
	fmovdgu	%icc,	%f25,	%f28
	movrne	%g6,	0x0A7,	%g1
	te	%icc,	0x4
	fsrc2s	%f25,	%f29
	udivx	%o6,	0x1C4D,	%l3
	set	0x5C, %o2
	stwa	%g5,	[%l7 + %o2] 0x19
	move	%xcc,	%g2,	%o0
	tleu	%xcc,	0x3
	nop
	setx	0xFA4C138D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0xB63308A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f9,	%f14
	edge8	%i0,	%i7,	%i6
	edge8ln	%o4,	%i2,	%l6
	ta	%xcc,	0x2
	membar	0x04
	tvc	%xcc,	0x5
	ldx	[%l7 + 0x68],	%g3
	sdivx	%g4,	0x1591,	%i1
	set	0x10, %l2
	ldsha	[%l7 + %l2] 0x89,	%o1
	tleu	%xcc,	0x3
	addccc	%l1,	0x0724,	%l4
	edge16	%o5,	%i3,	%g7
	tn	%icc,	0x1
	sdiv	%l0,	0x1D19,	%i5
	bge,pn	%xcc,	loop_354
	brz,a	%o7,	loop_355
	fcmpne32	%f4,	%f28,	%i4
	bcs	%xcc,	loop_356
loop_354:
	fmovd	%f2,	%f14
loop_355:
	sethi	0x1CC7,	%o3
	fmovsvc	%icc,	%f28,	%f25
loop_356:
	fmuld8ulx16	%f1,	%f16,	%f16
	sir	0x1148
	be	loop_357
	mulx	%l5,	0x1847,	%l2
	movvc	%xcc,	%g6,	%g1
	fnor	%f26,	%f14,	%f30
loop_357:
	fmovdneg	%xcc,	%f11,	%f28
	fzero	%f20
	movcs	%xcc,	%o2,	%l3
	movg	%icc,	%o6,	%g2
	ldsw	[%l7 + 0x60],	%o0
	subccc	%i0,	0x04E3,	%i7
	nop
	setx	0x36E61FF3AECDA60D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x853DE5ADAA3BCC0C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f12,	%f10
	srax	%g5,	0x1B,	%o4
	andncc	%i6,	%i2,	%g3
	ldd	[%l7 + 0x78],	%f20
	movleu	%icc,	%l6,	%g4
	orcc	%o1,	0x0020,	%l1
	subcc	%l4,	%o5,	%i1
	fmovdleu	%icc,	%f15,	%f12
	fmovsge	%xcc,	%f0,	%f12
	wr	%g0,	0xea,	%asi
	stha	%i3,	[%l7 + 0x4E] %asi
	membar	#Sync
	brz,a	%g7,	loop_358
	array32	%l0,	%i5,	%o7
	ba,pt	%icc,	loop_359
	ble	%xcc,	loop_360
loop_358:
	popc	%i4,	%o3
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x46] %asi,	%l2
loop_359:
	umul	%l5,	%g1,	%g6
loop_360:
	andn	%o2,	0x1661,	%l3
	sethi	0x0C70,	%o6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i0
	casa	[%l6] 0x80,	%i0,	%g2
	movgu	%xcc,	%g5,	%o4
	nop
	setx	0xE8C5154D1416D59A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f30
	andcc	%i6,	0x05DD,	%i7
	fmovsvc	%icc,	%f25,	%f31
	edge32l	%i2,	%g3,	%g4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	taddcc	%o1,	0x18B7,	%l1
	movneg	%xcc,	%l6,	%o5
	alignaddr	%l4,	%i1,	%i3
	addccc	%l0,	0x17EE,	%i5
	sub	%o7,	%i4,	%g7
	movgu	%xcc,	%l2,	%o3
	ldsw	[%l7 + 0x7C],	%g1
	fmovdgu	%xcc,	%f29,	%f1
	fnand	%f2,	%f0,	%f20
	tl	%icc,	0x7
	addcc	%g6,	%l5,	%l3
	fmovdcc	%xcc,	%f4,	%f25
	addc	%o2,	%o0,	%o6
	edge32l	%i0,	%g5,	%g2
	mulscc	%i6,	%o4,	%i7
	mulscc	%g3,	0x0D03,	%g4
	srlx	%o1,	%i2,	%l6
	fbug,a	%fcc0,	loop_361
	sdivcc	%o5,	0x0A3D,	%l1
	smul	%l4,	0x17EA,	%i1
	edge8	%l0,	%i3,	%o7
loop_361:
	movl	%xcc,	%i4,	%g7
	tneg	%icc,	0x2
	subcc	%l2,	%i5,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g6,	0x1C31,	%l5
	edge8n	%g1,	%o2,	%l3
	ldx	[%l7 + 0x28],	%o0
	movne	%icc,	%i0,	%o6
	ldsb	[%l7 + 0x1D],	%g5
	or	%g2,	%i6,	%o4
	sra	%i7,	%g3,	%g4
	subc	%o1,	%i2,	%o5
	fmovdgu	%xcc,	%f20,	%f12
	stb	%l1,	[%l7 + 0x65]
	fbe	%fcc1,	loop_362
	nop
	setx	0x2F0B26EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x11,	%asi
	stba	%l4,	[%l7 + 0x75] %asi
loop_362:
	andcc	%l6,	%i1,	%i3
	fand	%f16,	%f12,	%f16
	edge16l	%o7,	%l0,	%i4
	srlx	%g7,	%i5,	%l2
	fbul,a	%fcc2,	loop_363
	addccc	%o3,	%l5,	%g6
	andn	%g1,	%o2,	%l3
	tcc	%icc,	0x1
loop_363:
	nop
	setx	0x921F5034,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x7C7945DE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f7,	%f3
	subc	%o0,	0x1243,	%i0
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f2
	subccc	%o6,	0x1A64,	%g5
	sethi	0x0F68,	%g2
	movcs	%icc,	%i6,	%o4
	sllx	%g3,	%i7,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xC1992AA7188032A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x5167FF61E2C78B6D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f6,	%f4
	tge	%icc,	0x6
	stb	%o1,	[%l7 + 0x3F]
	fmovdcc	%icc,	%f27,	%f25
	addcc	%o5,	%i2,	%l4
	tge	%icc,	0x6
	srlx	%l6,	%i1,	%i3
	fxor	%f6,	%f0,	%f18
	movre	%l1,	0x2B8,	%o7
	nop
	setx	0x363B00363EE909BA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x7660C5B5B8E15D39,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f8,	%f18
	bpos	loop_364
	flush	%l7 + 0x60
	mulx	%l0,	%i4,	%g7
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f24
	fxtod	%f24,	%f16
loop_364:
	ba,a	loop_365
	fpadd32s	%f4,	%f19,	%f22
	te	%icc,	0x6
	mova	%icc,	%l2,	%o3
loop_365:
	movl	%xcc,	%i5,	%g6
	tle	%xcc,	0x6
	mova	%icc,	%l5,	%o2
	movn	%icc,	%g1,	%o0
	add	%l3,	0x0D0A,	%i0
	movge	%xcc,	%g5,	%g2
	fmovrde	%i6,	%f0,	%f16
	addc	%o6,	0x1538,	%g3
	ldub	[%l7 + 0x1E],	%i7
	fbn	%fcc0,	loop_366
	addcc	%g4,	%o1,	%o4
	bneg,a,pn	%icc,	loop_367
	membar	0x67
loop_366:
	mulx	%i2,	%o5,	%l6
	nop
	setx	0x68CB3260,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xA826EE4A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f20,	%f2
loop_367:
	brlz	%i1,	loop_368
	be,a,pt	%xcc,	loop_369
	sdiv	%i3,	0x0749,	%l1
	bge,a	loop_370
loop_368:
	brlez,a	%o7,	loop_371
loop_369:
	fpsub16	%f20,	%f12,	%f14
	array8	%l0,	%i4,	%g7
loop_370:
	tne	%icc,	0x4
loop_371:
	fmovsneg	%icc,	%f13,	%f9
	movrlez	%l4,	%l2,	%o3
	fmovsleu	%xcc,	%f23,	%f15
	subcc	%i5,	0x1F20,	%l5
	bcc,a,pn	%icc,	loop_372
	add	%o2,	%g6,	%o0
	tgu	%xcc,	0x1
	tge	%icc,	0x5
loop_372:
	subc	%l3,	%i0,	%g5
	fcmpgt16	%f20,	%f18,	%g1
	movle	%icc,	%i6,	%g2
	movg	%icc,	%g3,	%o6
	set	0x16, %l5
	stba	%g4,	[%l7 + %l5] 0x15
	fxnors	%f30,	%f6,	%f19
	brlez	%i7,	loop_373
	movgu	%xcc,	%o1,	%o4
	fmovsvs	%icc,	%f0,	%f31
	xor	%i2,	%o5,	%i1
loop_373:
	array32	%i3,	%l6,	%o7
	sub	%l0,	%i4,	%l1
	edge16ln	%l4,	%l2,	%g7
	call	loop_374
	fmovscc	%xcc,	%f7,	%f11
	call	loop_375
	tne	%xcc,	0x5
loop_374:
	ta	%icc,	0x7
	set	0x50, %o5
	ldswa	[%l7 + %o5] 0x10,	%o3
loop_375:
	bgu,a	loop_376
	xor	%i5,	0x1E20,	%o2
	fbu	%fcc1,	loop_377
	edge32	%g6,	%l5,	%l3
loop_376:
	subcc	%o0,	%i0,	%g1
	tgu	%icc,	0x7
loop_377:
	movvs	%xcc,	%g5,	%i6
	sub	%g3,	0x1A70,	%o6
	edge8l	%g4,	%g2,	%o1
	fbue	%fcc2,	loop_378
	movrgz	%i7,	%i2,	%o5
	set	0x42, %i5
	stha	%o4,	[%l7 + %i5] 0x2a
	membar	#Sync
loop_378:
	movcc	%icc,	%i1,	%l6
	movrlez	%o7,	%l0,	%i4
	fmovspos	%icc,	%f10,	%f29
	movre	%l1,	0x205,	%l4
	fmul8sux16	%f26,	%f14,	%f4
	tsubcctv	%i3,	0x1414,	%l2
	edge16ln	%o3,	%i5,	%o2
	lduw	[%l7 + 0x64],	%g7
	move	%icc,	%l5,	%g6
	nop
	setx	loop_379,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx loop_380, %l0, %l1
	jmpl %l1, %o0
	nop
	fitos	%f9,	%f24
	fstod	%f24,	%f0
	fmovdl	%xcc,	%f6,	%f20
loop_379:
	fmovdgu	%icc,	%f24,	%f8
loop_380:
	fmovs	%f17,	%f6
	tge	%xcc,	0x5
	alignaddrl	%l3,	%i0,	%g1
	brgez	%i6,	loop_381
	std	%f0,	[%l7 + 0x68]
	edge8	%g3,	%o6,	%g4
	array32	%g5,	%o1,	%g2
loop_381:
	edge8l	%i2,	%o5,	%i7
	move	%xcc,	%i1,	%o4
	tpos	%xcc,	0x1
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x10] %asi,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x41, %g1
	lduba	[%l7 + %g1] 0x14,	%l0
	mova	%icc,	%i4,	%l1
	nop
	setx	0xD05C63C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	movrgz	%l4,	%o7,	%i3
	fmovdne	%xcc,	%f5,	%f13
	nop
	setx	0xD99B6AE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xEFB9F86A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fadds	%f28,	%f31,	%f24
	nop
	setx	0x1CDF64E5FAB6D540,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x82C429C8EC03FB73,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f26,	%f0
	brgz,a	%o3,	loop_382
	ldsw	[%l7 + 0x54],	%l2
	tl	%icc,	0x7
	faligndata	%f26,	%f8,	%f0
loop_382:
	fpadd32s	%f4,	%f29,	%f15
	nop
	setx	0x1895B856,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xAD8E24F8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f2,	%f27
	tne	%xcc,	0x4
	srax	%i5,	%o2,	%g7
	sethi	0x137E,	%g6
	andcc	%l5,	%l3,	%o0
	tpos	%icc,	0x0
	xnorcc	%g1,	%i0,	%g3
	tne	%icc,	0x1
	sub	%i6,	%o6,	%g5
	move	%xcc,	%g4,	%g2
	sdivx	%o1,	0x18A5,	%o5
	fmovsne	%xcc,	%f15,	%f13
	tgu	%xcc,	0x3
	fmovrslez	%i7,	%f30,	%f28
	srl	%i2,	0x06,	%i1
	sir	0x1801
	flush	%l7 + 0x3C
	srax	%o4,	%l6,	%l0
	movvs	%xcc,	%i4,	%l4
	edge16	%l1,	%i3,	%o7
	fmovdpos	%xcc,	%f19,	%f23
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o3
	brlez	%l2,	loop_383
	mulscc	%i5,	%o2,	%g6
	sdivx	%g7,	0x0A00,	%l5
	edge32n	%l3,	%g1,	%i0
loop_383:
	edge32ln	%g3,	%o0,	%i6
	sethi	0x0CF2,	%o6
	tcc	%xcc,	0x6
	fnot1	%f22,	%f6
	orncc	%g5,	%g2,	%g4
	popc	0x08AC,	%o5
	brlz	%o1,	loop_384
	fpack32	%f6,	%f14,	%f14
	nop
	setx	0xD9F739C4CF59DBDD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xEF17CB6A40FC0407,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f8,	%f14
	array8	%i7,	%i2,	%o4
loop_384:
	udivx	%l6,	0x02A5,	%i1
	sll	%i4,	%l0,	%l1
	fmul8x16au	%f11,	%f17,	%f20
	movrne	%i3,	0x114,	%o7
	movre	%l4,	%o3,	%i5
	movleu	%xcc,	%o2,	%g6
	edge32ln	%l2,	%l5,	%g7
	fnor	%f16,	%f14,	%f24
	tle	%icc,	0x2
	tcs	%icc,	0x5
	fmul8x16al	%f28,	%f21,	%f24
	fmovde	%icc,	%f14,	%f17
	fmovdvs	%xcc,	%f26,	%f15
	fmovdleu	%icc,	%f23,	%f0
	te	%xcc,	0x4
	sdivcc	%g1,	0x127A,	%l3
	move	%xcc,	%i0,	%o0
	movne	%xcc,	%i6,	%g3
	ldd	[%l7 + 0x58],	%f22
	movrlez	%g5,	0x1D8,	%g2
	prefetch	[%l7 + 0x54],	 0x2
	xor	%o6,	%g4,	%o5
	fcmple16	%f4,	%f4,	%o1
	array32	%i2,	%i7,	%o4
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i4,	%l0
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l6
	nop
	setx	0xDEC716F2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x7096E3C1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f12,	%f21
	fornot1s	%f12,	%f9,	%f22
	movle	%xcc,	%i3,	%o7
	nop
	setx	0xCCCF0D2FD07FCB93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%l1,	%l4
	flush	%l7 + 0x3C
	movgu	%icc,	%o3,	%i5
	movpos	%xcc,	%g6,	%o2
	edge32	%l5,	%l2,	%g1
	smulcc	%l3,	%g7,	%i0
	add	%i6,	0x0F20,	%g3
	edge8	%g5,	%o0,	%g2
	udivcc	%g4,	0x04B7,	%o5
	movcs	%xcc,	%o1,	%i2
	edge32ln	%i7,	%o4,	%o6
	tle	%icc,	0x2
	tl	%icc,	0x5
	tle	%xcc,	0x5
	fmul8x16al	%f5,	%f26,	%f6
	udivx	%i1,	0x03A1,	%i4
	edge16ln	%l0,	%l6,	%i3
	fxor	%f14,	%f30,	%f18
	andcc	%l1,	%l4,	%o3
	edge16	%o7,	%i5,	%g6
	movle	%xcc,	%l5,	%o2
	movcs	%icc,	%l2,	%l3
	for	%f4,	%f8,	%f12
	edge8l	%g1,	%i0,	%g7
	move	%icc,	%i6,	%g5
	bpos	%xcc,	loop_385
	membar	0x39
	fmovde	%icc,	%f14,	%f27
	edge16l	%g3,	%g2,	%o0
loop_385:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g4,	%o1,	%o5
	movre	%i7,	%o4,	%o6
	fmovsn	%xcc,	%f11,	%f3
	fblg	%fcc2,	loop_386
	udivcc	%i1,	0x0666,	%i2
	bcs,pn	%icc,	loop_387
	andcc	%i4,	0x0CF7,	%l0
loop_386:
	fmovdvs	%icc,	%f0,	%f17
	fxor	%f24,	%f4,	%f8
loop_387:
	tgu	%xcc,	0x1
	bpos,a	loop_388
	taddcc	%l6,	0x0D53,	%l1
	fornot1	%f2,	%f16,	%f20
	ba,a	loop_389
loop_388:
	stx	%l4,	[%l7 + 0x38]
	ldstub	[%l7 + 0x77],	%o3
	fbl	%fcc3,	loop_390
loop_389:
	bcc,a,pt	%xcc,	loop_391
	popc	%o7,	%i5
	xorcc	%i3,	%l5,	%g6
loop_390:
	fmovde	%icc,	%f31,	%f15
loop_391:
	xorcc	%l2,	%l3,	%g1
	sra	%i0,	0x1F,	%o2
	tvc	%xcc,	0x0
	fcmpgt32	%f6,	%f20,	%g7
	xor	%i6,	0x10B5,	%g3
	fcmple16	%f8,	%f18,	%g5
	add	%o0,	%g2,	%g4
	fmovdn	%xcc,	%f9,	%f9
	fpadd32s	%f2,	%f10,	%f3
	movn	%icc,	%o1,	%o5
	orncc	%i7,	%o4,	%i1
	fpack32	%f14,	%f28,	%f14
	fbo,a	%fcc0,	loop_392
	fabss	%f28,	%f0
	tneg	%icc,	0x2
	movvs	%xcc,	%o6,	%i4
loop_392:
	array8	%i2,	%l6,	%l0
	fpadd32	%f12,	%f14,	%f16
	mulscc	%l4,	%l1,	%o7
	tle	%xcc,	0x3
	fblg	%fcc2,	loop_393
	fpsub32	%f6,	%f8,	%f20
	tcc	%xcc,	0x2
	fnegs	%f26,	%f3
loop_393:
	tvs	%xcc,	0x3
	bl	loop_394
	fmul8ulx16	%f24,	%f8,	%f22
	ldub	[%l7 + 0x0D],	%o3
	set	0x40, %g4
	lda	[%l7 + %g4] 0x88,	%f8
loop_394:
	andn	%i3,	%l5,	%g6
	fandnot2	%f14,	%f4,	%f24
	movrne	%l2,	%i5,	%l3
	udiv	%i0,	0x0AB0,	%g1
	tcs	%xcc,	0x0
	udiv	%o2,	0x0666,	%g7
	lduw	[%l7 + 0x6C],	%i6
	addccc	%g5,	%g3,	%o0
	brz	%g4,	loop_395
	movcc	%xcc,	%g2,	%o5
	set	0x50, %l1
	ldxa	[%l7 + %l1] 0x89,	%o1
loop_395:
	fbge,a	%fcc1,	loop_396
	tge	%xcc,	0x1
	fbu,a	%fcc2,	loop_397
	fandnot1	%f14,	%f12,	%f8
loop_396:
	tl	%icc,	0x0
	edge16l	%i7,	%o4,	%i1
loop_397:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%o6,	%f24,	%f18
	set	0x5C, %g7
	sta	%f4,	[%l7 + %g7] 0x18
	edge16n	%i4,	%l6,	%i2
	fnot2s	%f0,	%f28
	edge32ln	%l4,	%l1,	%l0
	taddcc	%o7,	0x05A2,	%i3
	movvs	%xcc,	%l5,	%o3
	tle	%icc,	0x7
	or	%g6,	%i5,	%l3
	lduh	[%l7 + 0x64],	%i0
	sir	0x11E6
	subccc	%l2,	0x0E31,	%g1
	movre	%o2,	%g7,	%i6
	fornot2s	%f22,	%f19,	%f13
	sethi	0x08E3,	%g3
	te	%xcc,	0x4
	umul	%o0,	%g5,	%g4
	fmovsa	%icc,	%f15,	%f5
	edge32	%o5,	%g2,	%i7
	tvs	%icc,	0x0
	tn	%icc,	0x3
	ld	[%l7 + 0x14],	%f26
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f6
	fxtod	%f6,	%f14
	movrlez	%o1,	%i1,	%o4
	edge8	%i4,	%o6,	%i2
	edge32	%l4,	%l6,	%l0
	smul	%l1,	%o7,	%l5
	movpos	%xcc,	%i3,	%g6
	addc	%o3,	%l3,	%i5
	nop
	set	0x70, %i6
	std	%f30,	[%l7 + %i6]
	fbug	%fcc3,	loop_398
	edge32ln	%l2,	%i0,	%o2
	ble,a,pn	%xcc,	loop_399
	udivcc	%g1,	0x1AF0,	%i6
loop_398:
	subc	%g3,	%o0,	%g7
	alignaddrl	%g5,	%o5,	%g4
loop_399:
	array16	%i7,	%g2,	%o1
	edge8	%i1,	%i4,	%o6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%xcc,	%f10,	%f5
	alignaddr	%l4,	%l6,	%l0
	fabsd	%f16,	%f26
	bge	loop_400
	nop
	fitod	%f0,	%f6
	fdtos	%f6,	%f5
	add	%o4,	0x05E3,	%o7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] 0x88,	%l5,	%l1
loop_400:
	subcc	%g6,	%o3,	%i3
	fexpand	%f11,	%f28
	mova	%icc,	%i5,	%l3
	fandnot1	%f24,	%f4,	%f6
	umul	%l2,	%o2,	%g1
	subcc	%i6,	%g3,	%o0
	udivx	%g7,	0x06C5,	%g5
	add	%l7,	0x54,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x88,	%o5,	%i0
	udivx	%g4,	0x0C79,	%i7
	edge8l	%g2,	%o1,	%i1
	movrlez	%i4,	0x3B1,	%o6
	tne	%xcc,	0x2
	edge32l	%l4,	%l6,	%l0
	smul	%o4,	%o7,	%l5
	fmul8x16	%f28,	%f18,	%f14
	brz,a	%i2,	loop_401
	call	loop_402
	bg	loop_403
	edge8n	%l1,	%o3,	%i3
loop_401:
	edge8	%g6,	%i5,	%l2
loop_402:
	tn	%icc,	0x7
loop_403:
	nop
	set	0x24, %o7
	lda	[%l7 + %o7] 0x89,	%f19
	movl	%icc,	%o2,	%l3
	sllx	%g1,	0x03,	%i6
	lduw	[%l7 + 0x38],	%o0
	or	%g7,	0x159D,	%g5
	addcc	%g3,	%o5,	%i0
	fmovrslz	%i7,	%f25,	%f20
	edge32ln	%g2,	%o1,	%g4
	wr	%g0,	0x88,	%asi
	sta	%f17,	[%l7 + 0x78] %asi
	movne	%icc,	%i1,	%o6
	movre	%l4,	%i4,	%l6
	bvc,pn	%icc,	loop_404
	edge8ln	%o4,	%l0,	%o7
	edge8	%i2,	%l1,	%o3
	xorcc	%l5,	0x0250,	%g6
loop_404:
	and	%i5,	%i3,	%l2
	udiv	%o2,	0x0E28,	%g1
	pdist	%f8,	%f6,	%f30
	tvc	%xcc,	0x4
	fcmpeq16	%f4,	%f8,	%l3
	brnz,a	%i6,	loop_405
	fbne	%fcc3,	loop_406
	edge16l	%o0,	%g7,	%g5
	umul	%g3,	0x09DD,	%i0
loop_405:
	movneg	%xcc,	%o5,	%i7
loop_406:
	brnz,a	%g2,	loop_407
	fpsub16	%f0,	%f26,	%f10
	mulscc	%o1,	0x0D62,	%g4
	popc	0x1F31,	%i1
loop_407:
	tle	%xcc,	0x5
	bshuffle	%f4,	%f28,	%f0
	fmovsle	%icc,	%f10,	%f22
	tl	%xcc,	0x5
	set	0x4C, %i7
	lduha	[%l7 + %i7] 0x89,	%l4
	srax	%o6,	0x1A,	%l6
	movcc	%xcc,	%i4,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f2,	%f20
	nop
	fitos	%f11,	%f6
	fstod	%f6,	%f10
	ta	%icc,	0x0
	fone	%f10
	tgu	%icc,	0x0
	bgu,a,pt	%xcc,	loop_408
	brlez	%o7,	loop_409
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i2,	%l0
loop_408:
	srl	%l1,	0x03,	%o3
loop_409:
	udiv	%l5,	0x1757,	%g6
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fnot2	%f16,	%f16
	tneg	%xcc,	0x4
	fnegs	%f12,	%f1
	set	0x68, %g6
	lduwa	[%l7 + %g6] 0x80,	%i3
	tvc	%xcc,	0x6
	edge16n	%i5,	%o2,	%l2
	udiv	%g1,	0x163A,	%i6
	addc	%l3,	%g7,	%o0
	sra	%g5,	%i0,	%o5
	stb	%g3,	[%l7 + 0x77]
	fmovscs	%icc,	%f9,	%f20
	movpos	%xcc,	%g2,	%i7
	movge	%xcc,	%g4,	%i1
	nop
	fitod	%f4,	%f8
	fdtos	%f8,	%f20
	ldsb	[%l7 + 0x2C],	%l4
	fbul	%fcc2,	loop_410
	tl	%icc,	0x6
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_410:
	ldd	[%l7 + 0x38],	%o6
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o1
	array32	%i4,	%l6,	%o4
	fbn,a	%fcc1,	loop_411
	nop
	setx	0x0871330F4DA21A82,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x940A967041393F9B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fsubd	%f30,	%f22,	%f0
	subccc	%o7,	%i2,	%l1
	fmovs	%f31,	%f18
loop_411:
	alignaddrl	%o3,	%l5,	%g6
	fcmple16	%f16,	%f8,	%i3
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x28] %asi,	%i5
	fmovda	%xcc,	%f3,	%f24
	popc	0x09DD,	%o2
	movrlez	%l0,	0x1D1,	%l2
	xorcc	%i6,	0x1BAA,	%l3
	movne	%xcc,	%g1,	%g7
	wr	%g0,	0x57,	%asi
	stxa	%g5,	[%g0 + 0x0] %asi
	edge16ln	%o0,	%i0,	%g3
	fmovsn	%icc,	%f17,	%f26
	sll	%o5,	0x14,	%g2
	movne	%xcc,	%g4,	%i1
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x0
	tsubcc	%o6,	%i7,	%i4
	fxnor	%f28,	%f26,	%f0
	edge16	%l6,	%o4,	%o7
	fbug,a	%fcc0,	loop_412
	array16	%i2,	%o1,	%l1
	brz	%l5,	loop_413
	movcs	%icc,	%o3,	%g6
loop_412:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i3,	%o2
loop_413:
	fmovdcs	%icc,	%f6,	%f21
	sdiv	%i5,	0x1C9D,	%l0
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movvc	%icc,	%i6,	%l3
	edge32n	%g1,	%l2,	%g7
	fmul8x16au	%f18,	%f21,	%f10
	fnot1	%f10,	%f0
	fnands	%f24,	%f3,	%f20
	bgu,a	%xcc,	loop_414
	andcc	%o0,	%g5,	%g3
	edge8ln	%i0,	%g2,	%o5
	edge8n	%i1,	%l4,	%g4
loop_414:
	subc	%o6,	%i7,	%l6
	move	%xcc,	%i4,	%o7
	tcc	%icc,	0x7
	nop
	setx	0x4666272940682B0F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	umulcc	%o4,	%i2,	%l1
	tvs	%icc,	0x6
	bl	%icc,	loop_415
	movrlz	%o1,	0x2DC,	%o3
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x6B] %asi,	%l5
loop_415:
	movleu	%xcc,	%i3,	%g6
	movn	%xcc,	%i5,	%l0
	sub	%i6,	%o2,	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbg,a	%fcc0,	loop_416
	fone	%f14
	tsubcc	%l2,	%g7,	%l3
	move	%xcc,	%g5,	%o0
loop_416:
	bne	%icc,	loop_417
	addc	%g3,	%i0,	%g2
	alignaddrl	%o5,	%l4,	%g4
	edge16n	%i1,	%i7,	%o6
loop_417:
	sdivcc	%i4,	0x0305,	%l6
	edge32	%o7,	%i2,	%l1
	tvs	%icc,	0x6
	alignaddrl	%o4,	%o1,	%l5
	andn	%i3,	0x15E0,	%g6
	fbge,a	%fcc0,	loop_418
	mulscc	%o3,	%l0,	%i6
	andcc	%i5,	%o2,	%l2
	fmovdgu	%xcc,	%f12,	%f17
loop_418:
	array32	%g1,	%l3,	%g5
	edge8ln	%g7,	%o0,	%g3
	edge16l	%g2,	%o5,	%l4
	srl	%i0,	0x10,	%g4
	fnands	%f23,	%f10,	%f28
	array8	%i7,	%o6,	%i4
	fbug,a	%fcc0,	loop_419
	movneg	%icc,	%i1,	%l6
	array32	%o7,	%l1,	%o4
	fpsub16	%f4,	%f30,	%f16
loop_419:
	umul	%i2,	0x1555,	%l5
	bcs,a,pn	%icc,	loop_420
	fnors	%f10,	%f16,	%f26
	fbuge	%fcc2,	loop_421
	fzeros	%f19
loop_420:
	fmul8x16al	%f23,	%f3,	%f14
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f12
	fxtod	%f12,	%f4
loop_421:
	fmovdne	%icc,	%f24,	%f1
	array8	%o1,	%g6,	%i3
	fmovsvc	%icc,	%f31,	%f23
	fba,a	%fcc2,	loop_422
	fornot1	%f18,	%f20,	%f28
	edge32n	%o3,	%l0,	%i6
	orncc	%i5,	0x16E8,	%o2
loop_422:
	fexpand	%f19,	%f18
	sdivx	%g1,	0x1A30,	%l3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x1C] %asi,	%l2
	tn	%icc,	0x3
	srlx	%g7,	0x04,	%g5
	fnegd	%f0,	%f2
	fsrc2	%f30,	%f10
	edge8	%o0,	%g2,	%g3
	orncc	%l4,	0x1C37,	%i0
	fnot1s	%f12,	%f1
	fblg,a	%fcc2,	loop_423
	lduw	[%l7 + 0x7C],	%g4
	wr	%g0,	0x18,	%asi
	stha	%o5,	[%l7 + 0x18] %asi
loop_423:
	mova	%xcc,	%o6,	%i4
	fabsd	%f30,	%f0
	fbule,a	%fcc1,	loop_424
	bg,pn	%icc,	loop_425
	movrgz	%i1,	%l6,	%i7
	bleu	%icc,	loop_426
loop_424:
	ldsb	[%l7 + 0x7A],	%o7
loop_425:
	edge32	%o4,	%l1,	%l5
	set	0x3F, %o6
	lduba	[%l7 + %o6] 0x18,	%i2
loop_426:
	orncc	%o1,	0x1E54,	%i3
	set	0x24, %o4
	stwa	%o3,	[%l7 + %o4] 0x10
	xnor	%g6,	%i6,	%i5
	stbar
	xor	%l0,	0x1E0F,	%g1
	stx	%o2,	[%l7 + 0x58]
	smul	%l3,	%l2,	%g5
	ble,pn	%icc,	loop_427
	fnand	%f4,	%f20,	%f14
	subcc	%g7,	%g2,	%g3
	xnorcc	%l4,	%i0,	%o0
loop_427:
	fpadd16s	%f27,	%f1,	%f19
	xnor	%o5,	0x04D8,	%o6
	tvc	%icc,	0x2
	fmovsne	%xcc,	%f29,	%f8
	edge16l	%g4,	%i1,	%l6
	set	0x5E, %l0
	ldsha	[%l7 + %l0] 0x18,	%i4
	nop
	fitod	%f8,	%f30
	fdtos	%f30,	%f16
	umulcc	%o7,	0x1781,	%i7
	fblg	%fcc1,	loop_428
	orcc	%o4,	0x1804,	%l1
	fmovscc	%xcc,	%f16,	%f21
	nop
	fitos	%f1,	%f13
	fstoi	%f13,	%f28
loop_428:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x20] %asi,	%f8
	set	0x7C, %g5
	ldsba	[%l7 + %g5] 0x80,	%l5
	movpos	%icc,	%o1,	%i2
	nop
	setx	loop_429,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	te	%xcc,	0x2
	stbar
	tneg	%icc,	0x7
loop_429:
	sll	%o3,	0x1D,	%g6
	ldd	[%l7 + 0x40],	%i6
	edge16l	%i3,	%l0,	%g1
	fpadd32s	%f3,	%f18,	%f15
	fmovs	%f7,	%f3
	fbe,a	%fcc3,	loop_430
	mova	%xcc,	%o2,	%i5
	edge16	%l3,	%g5,	%l2
	movge	%icc,	%g2,	%g3
loop_430:
	addc	%g7,	0x0E9A,	%l4
	sdiv	%i0,	0x04EE,	%o0
	sir	0x1ED0
	movvc	%xcc,	%o6,	%o5
	fmovrsgz	%i1,	%f23,	%f9
	tge	%icc,	0x0
	andncc	%l6,	%i4,	%g4
	xnorcc	%i7,	0x0FC9,	%o4
	nop
	fitos	%f0,	%f5
	fstoi	%f5,	%f29
	sub	%o7,	%l1,	%l5
	umul	%o1,	%i2,	%g6
	udiv	%i6,	0x13BE,	%o3
	brlez,a	%i3,	loop_431
	addc	%g1,	0x0E52,	%l0
	be,a,pn	%xcc,	loop_432
	nop
	setx loop_433, %l0, %l1
	jmpl %l1, %i5
loop_431:
	ldd	[%l7 + 0x10],	%o2
	edge32n	%g5,	%l3,	%g2
loop_432:
	stb	%l2,	[%l7 + 0x6F]
loop_433:
	fbug,a	%fcc3,	loop_434
	edge16ln	%g7,	%l4,	%g3
	set	0x30, %i3
	stha	%o0,	[%l7 + %i3] 0x88
loop_434:
	nop
	setx	0x79569E53,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x7CAA3699,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f25,	%f16
	nop
	setx	0x2CA2A10A237D1F3B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f8
	tvs	%icc,	0x4
	srlx	%o6,	%i0,	%i1
	andn	%l6,	0x14FA,	%i4
	edge16n	%g4,	%i7,	%o4
	fmovsgu	%xcc,	%f15,	%f25
	xor	%o5,	0x101F,	%o7
	bg,a,pt	%xcc,	loop_435
	ldsw	[%l7 + 0x6C],	%l1
	brlz	%o1,	loop_436
	subccc	%i2,	%l5,	%i6
loop_435:
	movneg	%xcc,	%o3,	%g6
	fmovdgu	%xcc,	%f27,	%f16
loop_436:
	fxor	%f4,	%f6,	%f30
	fbne,a	%fcc1,	loop_437
	fble,a	%fcc0,	loop_438
	nop
	setx	0xB056E60F,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	prefetch	[%l7 + 0x2C],	 0x1
loop_437:
	tvc	%icc,	0x1
loop_438:
	fmovs	%f15,	%f20
	addc	%i3,	0x0A2B,	%l0
	nop
	set	0x7E, %o1
	sth	%i5,	[%l7 + %o1]
	fmovsge	%icc,	%f20,	%f26
	udiv	%o2,	0x1A18,	%g1
	set	0x348, %o3
	nop 	! 	stxa	%g5,	[%g0 + %o3] 0x40 ripped by fixASI40.pl
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	prefetch	[%l7 + 0x18],	 0x3
	movne	%icc,	%g2,	%l3
	movleu	%xcc,	%l2,	%l4
	udivx	%g7,	0x17D8,	%g3
	tg	%xcc,	0x0
	nop
	setx	loop_439,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgez	%o6,	0x0DB,	%o0
	sethi	0x1EA4,	%i1
	smul	%l6,	0x0456,	%i4
loop_439:
	edge8l	%g4,	%i0,	%o4
	fmovdgu	%xcc,	%f14,	%f14
	edge8n	%o5,	%o7,	%i7
	lduw	[%l7 + 0x1C],	%o1
	nop
	fitod	%f31,	%f28
	bgu,pt	%xcc,	loop_440
	array16	%i2,	%l5,	%l1
	bl,pn	%icc,	loop_441
	fmovrsgz	%o3,	%f23,	%f27
loop_440:
	sub	%i6,	0x15A7,	%i3
	edge16ln	%g6,	%l0,	%i5
loop_441:
	mulscc	%o2,	0x1F27,	%g1
	movcc	%icc,	%g2,	%g5
	prefetch	[%l7 + 0x08],	 0x0
	movrlz	%l3,	%l2,	%g7
	st	%f9,	[%l7 + 0x64]
	set	0x50, %o0
	sta	%f25,	[%l7 + %o0] 0x89
	orcc	%g3,	0x11BF,	%l4
	nop
	set	0x76, %l6
	lduh	[%l7 + %l6],	%o0
	fmovdge	%icc,	%f17,	%f24
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o6
	array32	%i1,	%l6,	%i4
	tsubcc	%g4,	0x109A,	%o4
	or	%i0,	0x0D27,	%o5
	sub	%o7,	0x1628,	%i7
	fmovdvc	%icc,	%f26,	%f22
	swap	[%l7 + 0x1C],	%i2
	nop
	setx	0xBCCFD8AE2AE88A19,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f24
	fblg	%fcc3,	loop_442
	tg	%icc,	0x2
	lduw	[%l7 + 0x40],	%o1
	tvs	%xcc,	0x1
loop_442:
	mova	%xcc,	%l5,	%l1
	fors	%f2,	%f18,	%f21
	nop
	set	0x2C, %g3
	ldsh	[%l7 + %g3],	%o3
	tvs	%xcc,	0x6
	fmovrdlez	%i6,	%f24,	%f30
	tvs	%icc,	0x0
	movvs	%icc,	%i3,	%g6
	movge	%xcc,	%l0,	%i5
	fbne,a	%fcc0,	loop_443
	fbe,a	%fcc2,	loop_444
	movg	%xcc,	%g1,	%g2
	edge16l	%o2,	%g5,	%l2
loop_443:
	addcc	%g7,	%g3,	%l4
loop_444:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f22
	tsubcctv	%l3,	0x1F1C,	%o6
	sra	%o0,	0x02,	%i1
	orcc	%i4,	%l6,	%o4
	tvc	%icc,	0x5
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x60] %asi,	%g4
	wr	%g0,	0xe2,	%asi
	stwa	%i0,	[%l7 + 0x38] %asi
	membar	#Sync
	movrgez	%o5,	%i7,	%o7
	andn	%i2,	0x1854,	%o1
	edge16	%l1,	%o3,	%i6
	movrgez	%i3,	%g6,	%l5
	sir	0x1F3D
	alignaddr	%i5,	%g1,	%g2
	fbn,a	%fcc0,	loop_445
	nop
	setx	0x506AAEAE29B58D50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xC3E0148A5555571B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f2,	%f20
	nop
	setx	0xDBFAE473,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f11
	fbne	%fcc3,	loop_446
loop_445:
	tg	%xcc,	0x6
	fnands	%f2,	%f22,	%f21
	fnand	%f18,	%f28,	%f10
loop_446:
	nop
	set	0x10, %g2
	prefetcha	[%l7 + %g2] 0x10,	 0x1
	brnz,a	%o2,	loop_447
	movge	%xcc,	%l2,	%g7
	tneg	%xcc,	0x4
	fmovrse	%g5,	%f6,	%f18
loop_447:
	fmovsa	%icc,	%f18,	%f6
	ldstub	[%l7 + 0x73],	%l4
	movl	%icc,	%l3,	%o6
	ldsh	[%l7 + 0x32],	%o0
	set	0x40, %i2
	stda	%f16,	[%l7 + %i2] 0x18
	tcs	%xcc,	0x2
	taddcc	%i1,	%g3,	%l6
	wr	%g0,	0xe3,	%asi
	stxa	%o4,	[%l7 + 0x40] %asi
	membar	#Sync
	ldd	[%l7 + 0x70],	%i4
	ldsh	[%l7 + 0x6A],	%g4
	brz,a	%i0,	loop_448
	movrlez	%o5,	%i7,	%o7
	movn	%xcc,	%o1,	%i2
	tvc	%icc,	0x1
loop_448:
	fmovdleu	%xcc,	%f15,	%f29
	flush	%l7 + 0x38
	movcc	%xcc,	%o3,	%i6
	orn	%l1,	0x0F31,	%g6
	edge8n	%i3,	%l5,	%g1
	nop
	set	0x40, %l3
	prefetch	[%l7 + %l3],	 0x1
	umulcc	%i5,	0x04CB,	%l0
	sethi	0x1338,	%g2
	membar	#Sync
	set	0x40, %i0
	ldda	[%l7 + %i0] 0x1f,	%f0
	lduh	[%l7 + 0x1E],	%o2
	subccc	%g7,	%g5,	%l2
	xor	%l3,	%o6,	%l4
	array32	%i1,	%g3,	%o0
	mulx	%o4,	%l6,	%g4
	brnz	%i0,	loop_449
	tne	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x38] %asi,	%i4
loop_449:
	nop
	setx	0xA1280AFE307AFF0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movvc	%xcc,	%i7,	%o7
	orn	%o5,	%o1,	%i2
	brgez,a	%i6,	loop_450
	sra	%o3,	0x0D,	%l1
	wr	%g0,	0x88,	%asi
	sta	%f17,	[%l7 + 0x44] %asi
loop_450:
	fsrc2	%f20,	%f18
	nop
	setx	loop_451,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tl	%xcc,	0x2
	bne	loop_452
	nop
	setx	0x504C893E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x7709A4DC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f26,	%f23
loop_451:
	tleu	%icc,	0x1
	set	0x6C, %i4
	stwa	%g6,	[%l7 + %i4] 0x2b
	membar	#Sync
loop_452:
	addcc	%l5,	%g1,	%i5
	fones	%f26
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x74] %asi,	%l0
	orncc	%g2,	%i3,	%o2
	ldub	[%l7 + 0x11],	%g7
	membar	0x03
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4D] %asi,	%g5
	brz,a	%l3,	loop_453
	ldub	[%l7 + 0x10],	%l2
	movpos	%xcc,	%o6,	%i1
	membar	0x3B
loop_453:
	nop
	set	0x30, %i1
	sta	%f5,	[%l7 + %i1] 0x04
	edge32l	%l4,	%g3,	%o0
	movle	%icc,	%o4,	%g4
	movl	%icc,	%i0,	%i4
	fmovse	%xcc,	%f2,	%f31
	set	0x30, %l4
	sta	%f12,	[%l7 + %l4] 0x80
	fmovrdlz	%l6,	%f20,	%f30
	edge16ln	%o7,	%i7,	%o1
	bcc,a,pn	%icc,	loop_454
	ble	loop_455
	movvc	%xcc,	%o5,	%i2
	tgu	%xcc,	0x2
loop_454:
	edge8	%i6,	%o3,	%g6
loop_455:
	movn	%icc,	%l1,	%l5
	tvc	%xcc,	0x4
	tge	%icc,	0x0
	udivcc	%g1,	0x198C,	%i5
	tsubcctv	%l0,	%i3,	%g2
	tle	%icc,	0x4
	tne	%xcc,	0x1
	set	0x40, %o2
	stda	%f0,	[%l7 + %o2] 0x11
	bvs	%icc,	loop_456
	nop
	setx	0xEF39E6DE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xE1A9A186,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f29,	%f31
	movle	%icc,	%o2,	%g7
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x42] %asi,	%l3
loop_456:
	tgu	%xcc,	0x7
	fcmple16	%f16,	%f2,	%g5
	edge8ln	%l2,	%i1,	%l4
	smulcc	%g3,	0x1E25,	%o6
	movrlez	%o0,	0x2F2,	%o4
	sub	%g4,	0x0104,	%i4
	alignaddrl	%i0,	%l6,	%i7
	addc	%o1,	0x0C41,	%o5
	flush	%l7 + 0x20
	movrlez	%i2,	0x37F,	%o7
	fbule	%fcc1,	loop_457
	std	%f28,	[%l7 + 0x58]
	umul	%o3,	%i6,	%g6
	fble	%fcc2,	loop_458
loop_457:
	udiv	%l1,	0x0857,	%l5
	movrlez	%g1,	0x1A1,	%i5
	tsubcc	%i3,	%l0,	%o2
loop_458:
	bvc	loop_459
	alignaddrl	%g2,	%g7,	%g5
	tvc	%xcc,	0x0
	stx	%l2,	[%l7 + 0x20]
loop_459:
	lduh	[%l7 + 0x20],	%i1
	fpackfix	%f26,	%f29
	movle	%icc,	%l3,	%l4
	bne,pt	%xcc,	loop_460
	sdiv	%o6,	0x0653,	%o0
	stw	%g3,	[%l7 + 0x5C]
	ldx	[%l7 + 0x58],	%o4
loop_460:
	xnorcc	%i4,	0x0772,	%i0
	fmovde	%xcc,	%f20,	%f14
	umul	%l6,	%i7,	%o1
	fmovrdlez	%o5,	%f18,	%f8
	set	0x40, %l5
	lduba	[%l7 + %l5] 0x11,	%i2
	edge32n	%g4,	%o3,	%i6
	movne	%xcc,	%g6,	%o7
	fmul8x16	%f23,	%f16,	%f2
	orn	%l1,	%g1,	%l5
	taddcctv	%i3,	%l0,	%i5
	array32	%g2,	%o2,	%g7
	mulscc	%l2,	0x0EAD,	%i1
	xorcc	%g5,	%l3,	%o6
	fbn,a	%fcc1,	loop_461
	edge32	%o0,	%l4,	%g3
	fmovs	%f13,	%f1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_461:
	tgu	%xcc,	0x0
	bcs,a,pt	%icc,	loop_462
	membar	0x2D
	tl	%xcc,	0x0
	bleu	loop_463
loop_462:
	sdiv	%i4,	0x02FB,	%i0
	xorcc	%l6,	%i7,	%o4
	lduw	[%l7 + 0x18],	%o5
loop_463:
	movre	%o1,	0x0FD,	%g4
	tsubcctv	%o3,	%i2,	%i6
	bneg,a,pn	%icc,	loop_464
	fbge	%fcc0,	loop_465
	edge16ln	%g6,	%l1,	%g1
	tpos	%xcc,	0x0
loop_464:
	edge8l	%l5,	%i3,	%o7
loop_465:
	orn	%l0,	%i5,	%o2
	orncc	%g2,	0x0C1B,	%l2
	fmovrse	%g7,	%f15,	%f8
	bcs,a,pt	%icc,	loop_466
	bneg,a,pt	%xcc,	loop_467
	mova	%icc,	%g5,	%i1
	mova	%xcc,	%l3,	%o6
loop_466:
	nop
	set	0x7C, %o5
	lduwa	[%l7 + %o5] 0x19,	%o0
loop_467:
	tne	%icc,	0x4
	brgez,a	%l4,	loop_468
	nop
	setx	0x2652F1B4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x5D61150A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f20,	%f1
	movrlez	%g3,	0x309,	%i0
	movcs	%icc,	%i4,	%l6
loop_468:
	fbg	%fcc0,	loop_469
	fnegs	%f18,	%f10
	srax	%o4,	%o5,	%i7
	edge8l	%o1,	%o3,	%g4
loop_469:
	movl	%icc,	%i2,	%i6
	smulcc	%l1,	0x11D9,	%g1
	lduh	[%l7 + 0x0A],	%g6
	mulx	%i3,	%o7,	%l5
	edge8l	%l0,	%i5,	%g2
	taddcctv	%l2,	0x1393,	%o2
	movn	%xcc,	%g5,	%g7
	fbl	%fcc0,	loop_470
	stx	%i1,	[%l7 + 0x48]
	tg	%xcc,	0x1
	tcc	%xcc,	0x3
loop_470:
	movcc	%icc,	%o6,	%o0
	addcc	%l4,	0x069C,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l3,	0x01D0,	%i0
	smul	%l6,	0x04BB,	%i4
	edge16l	%o5,	%i7,	%o1
	mova	%xcc,	%o4,	%g4
	movne	%icc,	%o3,	%i6
	bshuffle	%f2,	%f16,	%f4
	and	%i2,	0x1D46,	%l1
	fandnot1s	%f13,	%f2,	%f5
	te	%icc,	0x0
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x74] %asi,	%g1
	movre	%i3,	%o7,	%l5
	ldsh	[%l7 + 0x4C],	%l0
	tleu	%xcc,	0x6
	flush	%l7 + 0x1C
	fbne	%fcc0,	loop_471
	umul	%g6,	%i5,	%g2
	tl	%xcc,	0x7
	fbne	%fcc2,	loop_472
loop_471:
	fbn,a	%fcc3,	loop_473
	movne	%xcc,	%o2,	%g5
	movge	%xcc,	%l2,	%i1
loop_472:
	alignaddrl	%o6,	%o0,	%l4
loop_473:
	mova	%xcc,	%g7,	%g3
	mulscc	%i0,	0x06F8,	%l6
	nop
	setx	0x3DDD93BE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x82ADFF33,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fdivs	%f29,	%f25,	%f22
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
	bpos,pn	%xcc,	loop_474
	fands	%f24,	%f23,	%f1
	fba	%fcc2,	loop_475
	fcmple16	%f10,	%f2,	%l3
loop_474:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f1,	%f22
loop_475:
	smul	%i7,	0x0B8E,	%o5
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x18] %asi,	%o1
	ldsh	[%l7 + 0x12],	%o4
	umul	%o3,	0x037B,	%i6
	srlx	%g4,	%i2,	%l1
	mova	%xcc,	%i3,	%g1
	fpsub32	%f0,	%f12,	%f24
	nop
	set	0x30, %i5
	sth	%o7,	[%l7 + %i5]
	array32	%l0,	%g6,	%l5
	srlx	%g2,	0x0D,	%o2
	umul	%g5,	%l2,	%i5
	movcc	%icc,	%i1,	%o6
	ldx	[%l7 + 0x78],	%o0
	taddcc	%l4,	0x0CFC,	%g3
	add	%i0,	%g7,	%l6
	movrgez	%l3,	%i7,	%o5
	set	0x4E, %g1
	lduha	[%l7 + %g1] 0x0c,	%i4
	fornot1	%f26,	%f4,	%f6
	mulscc	%o1,	%o4,	%i6
	tcs	%icc,	0x1
	tle	%icc,	0x6
	fxors	%f3,	%f16,	%f24
	addc	%g4,	0x1D0B,	%i2
	movle	%xcc,	%l1,	%o3
	tleu	%icc,	0x2
	fnot2	%f2,	%f30
	movrlez	%i3,	%o7,	%l0
	fmovdpos	%icc,	%f15,	%f10
	fandnot2s	%f4,	%f0,	%f29
	tvc	%xcc,	0x4
	fmul8ulx16	%f8,	%f16,	%f16
	flush	%l7 + 0x44
	sdiv	%g1,	0x08B2,	%g6
	movneg	%icc,	%l5,	%g2
	fornot2	%f6,	%f10,	%f6
	taddcc	%g5,	0x0508,	%o2
	fone	%f28
	tge	%icc,	0x5
	fmovdneg	%icc,	%f7,	%f16
	membar	0x41
	sdiv	%i5,	0x0133,	%i1
	movrne	%l2,	%o0,	%o6
	movcc	%icc,	%l4,	%i0
	sir	0x0917
	movrne	%g7,	0x2FB,	%l6
	edge8ln	%l3,	%g3,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i4,	%o5,	%o4
	wr	%g0,	0x89,	%asi
	stxa	%o1,	[%l7 + 0x78] %asi
	srlx	%i6,	%g4,	%i2
	ldsh	[%l7 + 0x4E],	%l1
	movvs	%icc,	%o3,	%o7
	alignaddr	%l0,	%g1,	%i3
	or	%g6,	%l5,	%g5
	fmovspos	%xcc,	%f9,	%f12
	orn	%o2,	0x0B23,	%i5
	udivx	%g2,	0x0107,	%l2
	fbe	%fcc2,	loop_476
	nop
	setx	loop_477,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	swap	[%l7 + 0x3C],	%i1
	nop
	setx loop_478, %l0, %l1
	jmpl %l1, %o0
loop_476:
	bneg,a	%icc,	loop_479
loop_477:
	tsubcc	%l4,	0x094E,	%i0
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x2C] %asi,	%g7
loop_478:
	fmovdn	%icc,	%f16,	%f29
loop_479:
	fbl,a	%fcc3,	loop_480
	ldsb	[%l7 + 0x34],	%l6
	fpmerge	%f5,	%f21,	%f10
	orn	%o6,	0x13FE,	%g3
loop_480:
	nop
	fitos	%f3,	%f13
	fstoi	%f13,	%f22
	sllx	%l3,	0x03,	%i4
	tn	%icc,	0x4
	or	%i7,	%o4,	%o1
	edge16ln	%o5,	%i6,	%i2
	fmovsne	%icc,	%f12,	%f22
	alignaddr	%l1,	%g4,	%o3
	fmovrslez	%o7,	%f9,	%f0
	movrlez	%l0,	%i3,	%g1
	fpack16	%f30,	%f0
	stbar
	fornot1s	%f4,	%f15,	%f30
	udivx	%l5,	0x039E,	%g5
	movrgz	%o2,	%g6,	%g2
	sub	%l2,	%i1,	%o0
	set	0x60, %l2
	sta	%f29,	[%l7 + %l2] 0x18
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i5
	brgz,a	%i0,	loop_481
	tneg	%icc,	0x7
	fmovda	%icc,	%f0,	%f29
	tcs	%icc,	0x1
loop_481:
	subc	%g7,	%l6,	%l4
	fmovde	%icc,	%f13,	%f24
	fmovsa	%xcc,	%f22,	%f21
	fbuge,a	%fcc2,	loop_482
	nop
	fitod	%f11,	%f24
	movge	%icc,	%o6,	%g3
	edge16	%i4,	%l3,	%o4
loop_482:
	fpadd32	%f12,	%f6,	%f28
	set	0x40, %l1
	lduba	[%l7 + %l1] 0x10,	%i7
	tne	%xcc,	0x6
	xor	%o5,	0x1499,	%i6
	fble	%fcc2,	loop_483
	edge16n	%i2,	%l1,	%o1
	bg,a,pn	%xcc,	loop_484
	tne	%icc,	0x2
loop_483:
	ldd	[%l7 + 0x70],	%o2
	movne	%icc,	%o7,	%g4
loop_484:
	ldub	[%l7 + 0x7C],	%i3
	sra	%l0,	%g1,	%l5
	movcc	%xcc,	%g5,	%g6
	brgz	%o2,	loop_485
	fmovscc	%icc,	%f13,	%f4
	call	loop_486
	movgu	%xcc,	%l2,	%g2
loop_485:
	tl	%xcc,	0x5
	add	%o0,	0x141B,	%i5
loop_486:
	udivx	%i0,	0x0C0B,	%i1
	tne	%xcc,	0x6
	bcc	loop_487
	fmovscc	%xcc,	%f31,	%f23
	alignaddr	%g7,	%l4,	%o6
	membar	#Sync
	set	0x40, %g4
	ldda	[%l7 + %g4] 0xf8,	%f16
loop_487:
	edge16	%g3,	%i4,	%l6
	tge	%xcc,	0x7
	movcs	%icc,	%o4,	%l3
	bn,pn	%icc,	loop_488
	swap	[%l7 + 0x4C],	%i7
	fbg,a	%fcc1,	loop_489
	tcc	%xcc,	0x1
loop_488:
	xorcc	%o5,	%i2,	%l1
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x14] %asi,	%o1
loop_489:
	xorcc	%i6,	0x10D1,	%o7
	fmovscs	%icc,	%f7,	%f18
	ba	loop_490
	sethi	0x03D6,	%o3
	tl	%icc,	0x6
	sir	0x0BFE
loop_490:
	edge16ln	%i3,	%g4,	%g1
	sll	%l5,	0x0C,	%l0
	tge	%xcc,	0x7
	ldd	[%l7 + 0x60],	%f20
	tn	%icc,	0x7
	call	loop_491
	sll	%g6,	%g5,	%o2
	xor	%g2,	%l2,	%o0
	fpsub16	%f12,	%f26,	%f14
loop_491:
	tgu	%icc,	0x5
	fmovrdgez	%i5,	%f6,	%f16
	umulcc	%i0,	0x00EE,	%g7
	fnegd	%f0,	%f16
	movle	%xcc,	%l4,	%o6
	nop
	fitos	%f26,	%f12
	movl	%xcc,	%i1,	%g3
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x30] %asi,	%i6
	xnor	%i4,	0x076E,	%l3
	fbo,a	%fcc3,	loop_492
	movcc	%xcc,	%o4,	%o5
	orn	%i2,	0x184F,	%l1
	sdiv	%i7,	0x10D3,	%i6
loop_492:
	xor	%o1,	0x1BD0,	%o7
	bge,pt	%xcc,	loop_493
	smulcc	%i3,	%g4,	%g1
	edge8l	%o3,	%l5,	%g6
	fmovsle	%xcc,	%f21,	%f30
loop_493:
	fmovs	%f10,	%f4
	brlz,a	%g5,	loop_494
	fbne,a	%fcc0,	loop_495
	edge32n	%o2,	%g2,	%l0
	movcs	%xcc,	%o0,	%i5
loop_494:
	xnor	%i0,	0x17D8,	%l2
loop_495:
	and	%l4,	0x0324,	%o6
	smul	%g7,	0x103F,	%i1
	addccc	%l6,	0x029D,	%g3
	fmovrde	%i4,	%f0,	%f18
	movvc	%icc,	%l3,	%o4
	tne	%xcc,	0x7
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x52] %asi,	%o5
	udivcc	%i2,	0x1CB8,	%l1
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x38] %asi,	%i7
	fmul8x16au	%f21,	%f2,	%f18
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x20] %asi,	%i6
	fmovrdlz	%o7,	%f4,	%f2
	smulcc	%o1,	%g4,	%g1
	and	%i3,	%l5,	%g6
	orncc	%o3,	%g5,	%o2
	fmovrsgez	%l0,	%f24,	%f26
	movrgez	%o0,	0x246,	%i5
	movg	%xcc,	%g2,	%i0
	xorcc	%l2,	%l4,	%o6
	tle	%xcc,	0x3
	movg	%icc,	%i1,	%g7
	umul	%l6,	%g3,	%i4
	sth	%o4,	[%l7 + 0x36]
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x38] %asi,	%l3
	fmovdvs	%icc,	%f8,	%f16
	fmul8sux16	%f0,	%f28,	%f8
	tsubcc	%i2,	0x1A63,	%o5
	set	0x42, %g7
	ldsha	[%l7 + %g7] 0x88,	%i7
	sir	0x0C95
	orn	%i6,	%o7,	%l1
	fmovdcs	%icc,	%f3,	%f29
	tgu	%xcc,	0x3
	fmovdleu	%xcc,	%f26,	%f14
	ldd	[%l7 + 0x68],	%f10
	fbuge	%fcc0,	loop_496
	edge32l	%g4,	%o1,	%g1
	subc	%l5,	%i3,	%g6
	array16	%g5,	%o3,	%l0
loop_496:
	xor	%o2,	%i5,	%g2
	tgu	%icc,	0x7
	fornot2s	%f17,	%f0,	%f31
	tvs	%icc,	0x5
	fble,a	%fcc3,	loop_497
	andcc	%o0,	%i0,	%l4
	fmul8x16au	%f15,	%f7,	%f16
	edge32	%o6,	%l2,	%i1
loop_497:
	movgu	%icc,	%l6,	%g7
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x0c,	%g3,	%i4
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f26
	sllx	%o4,	0x12,	%l3
	fbl,a	%fcc3,	loop_498
	fbue	%fcc0,	loop_499
	umul	%o5,	%i2,	%i7
	edge8	%o7,	%l1,	%i6
loop_498:
	fmul8x16al	%f0,	%f24,	%f24
loop_499:
	tge	%xcc,	0x1
	movrgez	%g4,	0x10E,	%o1
	edge8	%l5,	%g1,	%i3
	tcc	%xcc,	0x1
	orcc	%g5,	0x0155,	%o3
	tcs	%xcc,	0x1
	alignaddr	%l0,	%o2,	%g6
	fpadd16s	%f16,	%f20,	%f8
	brgz	%g2,	loop_500
	movleu	%icc,	%i5,	%i0
	sll	%o0,	%o6,	%l4
	subcc	%l2,	%i1,	%g7
loop_500:
	mulx	%g3,	0x15B7,	%i4
	sdivcc	%l6,	0x109D,	%l3
	movleu	%xcc,	%o4,	%i2
	bge,a,pt	%xcc,	loop_501
	ldx	[%l7 + 0x48],	%i7
	set	0x64, %i6
	ldstuba	[%l7 + %i6] 0x10,	%o7
loop_501:
	tg	%icc,	0x6
	subcc	%l1,	%i6,	%g4
	sll	%o5,	0x18,	%l5
	fmul8x16au	%f13,	%f19,	%f20
	udivcc	%g1,	0x0778,	%o1
	set	0x63, %i7
	ldsba	[%l7 + %i7] 0x19,	%g5
	edge16	%o3,	%i3,	%l0
	set	0x4A, %g6
	stba	%g6,	[%l7 + %g6] 0xea
	membar	#Sync
	tsubcctv	%o2,	%i5,	%g2
	sdivx	%o0,	0x0AC5,	%i0
	movrlez	%l4,	%l2,	%o6
	edge16l	%i1,	%g3,	%i4
	te	%icc,	0x6
	fand	%f24,	%f22,	%f20
	edge8l	%l6,	%l3,	%g7
	set	0x58, %o6
	lduwa	[%l7 + %o6] 0x10,	%i2
	nop
	setx	0xE10B82E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xB3FA3A37,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f30,	%f21
	brlz,a	%i7,	loop_502
	sethi	0x1DDA,	%o7
	std	%f6,	[%l7 + 0x58]
	fnot1	%f24,	%f14
loop_502:
	nop
	fitod	%f6,	%f26
	fdtox	%f26,	%f10
	movcs	%xcc,	%l1,	%o4
	array32	%g4,	%i6,	%o5
	fpadd16s	%f23,	%f5,	%f23
	mulx	%g1,	0x0C43,	%l5
	edge8n	%o1,	%o3,	%g5
	fmovscs	%xcc,	%f24,	%f19
	tle	%xcc,	0x3
	bshuffle	%f12,	%f10,	%f12
	movneg	%xcc,	%i3,	%l0
	fbne	%fcc3,	loop_503
	fbne	%fcc2,	loop_504
	tne	%icc,	0x0
	subccc	%g6,	%i5,	%g2
loop_503:
	sethi	0x06FD,	%o0
loop_504:
	nop
	wr	%g0,	0x80,	%asi
	stwa	%o2,	[%l7 + 0x54] %asi
	and	%i0,	0x0486,	%l4
	pdist	%f4,	%f14,	%f26
	nop
	setx	0x9EF0495A168A6654,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xB6E95159C57CDAB4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f8,	%f2
	tpos	%icc,	0x0
	addc	%o6,	%l2,	%i1
	ldsb	[%l7 + 0x46],	%i4
	bgu,a,pn	%icc,	loop_505
	mulx	%l6,	0x1CDA,	%l3
	fcmpeq16	%f0,	%f2,	%g3
	fbule,a	%fcc1,	loop_506
loop_505:
	xnorcc	%i2,	0x0105,	%g7
	set	0x24, %o7
	ldsha	[%l7 + %o7] 0x10,	%o7
loop_506:
	fpadd16	%f16,	%f0,	%f6
	fsrc2	%f2,	%f26
	sll	%l1,	0x1D,	%i7
	sub	%g4,	0x0ED4,	%i6
	ld	[%l7 + 0x18],	%f4
	nop
	setx	0xD6D16452D508DFA0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x58A703F27DAD4CFB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f30,	%f6
	movleu	%icc,	%o4,	%g1
	popc	%o5,	%l5
	alignaddrl	%o1,	%g5,	%o3
	set	0x5A, %l0
	stba	%l0,	[%l7 + %l0] 0x80
	movcc	%xcc,	%i3,	%g6
	srl	%g2,	%o0,	%o2
	smul	%i5,	0x1395,	%l4
	fornot2	%f22,	%f16,	%f30
	tsubcctv	%o6,	0x0220,	%l2
	set	0x20, %o4
	stwa	%i0,	[%l7 + %o4] 0x89
	movle	%icc,	%i1,	%l6
	orncc	%l3,	0x135D,	%g3
	udivcc	%i4,	0x1275,	%g7
	orcc	%i2,	0x0A1C,	%l1
	stw	%o7,	[%l7 + 0x64]
	popc	0x0E23,	%i7
	set	0x24, %g5
	lda	[%l7 + %g5] 0x15,	%f13
	set	0x1A, %i3
	lduba	[%l7 + %i3] 0x11,	%i6
	fmovs	%f11,	%f7
	srax	%o4,	0x1D,	%g1
	for	%f30,	%f0,	%f8
	fmovsvs	%icc,	%f31,	%f26
	fmovdleu	%xcc,	%f25,	%f1
	alignaddrl	%o5,	%g4,	%o1
	movrlez	%l5,	0x276,	%o3
	nop
	setx	0x97143C61,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xA4C2C6EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f14,	%f2
	fzero	%f6
	andn	%g5,	%l0,	%g6
	membar	0x03
	tle	%xcc,	0x5
	tneg	%xcc,	0x5
	fpsub32	%f12,	%f0,	%f2
	subc	%i3,	0x009A,	%o0
	tvc	%xcc,	0x7
	fpack16	%f10,	%f19
	srl	%o2,	%g2,	%i5
	addccc	%l4,	0x089B,	%l2
	edge16l	%i0,	%i1,	%l6
	sdivx	%o6,	0x0AB4,	%g3
	fmovdgu	%icc,	%f29,	%f31
	umulcc	%i4,	0x159A,	%g7
	fmovdle	%xcc,	%f25,	%f9
	xnorcc	%i2,	%l1,	%l3
	sra	%i7,	0x13,	%i6
	fnors	%f7,	%f16,	%f26
	bcc,pt	%xcc,	loop_507
	fbe,a	%fcc0,	loop_508
	sll	%o4,	0x03,	%o7
	smulcc	%g1,	%g4,	%o5
loop_507:
	nop
	wr	%g0,	0x04,	%asi
	sta	%f6,	[%l7 + 0x44] %asi
loop_508:
	fmovd	%f12,	%f26
	edge32n	%o1,	%l5,	%o3
	movpos	%icc,	%l0,	%g5
	fpadd32	%f22,	%f16,	%f12
	be,a	loop_509
	brnz	%g6,	loop_510
	nop
	setx	0xCE675B500049E483,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fbg,a	%fcc1,	loop_511
loop_509:
	fone	%f4
loop_510:
	bgu,pt	%icc,	loop_512
	fpsub16s	%f29,	%f24,	%f15
loop_511:
	fnot1s	%f4,	%f6
	sth	%o0,	[%l7 + 0x38]
loop_512:
	movleu	%xcc,	%o2,	%g2
	fnands	%f0,	%f26,	%f22
	array32	%i3,	%l4,	%i5
	array8	%i0,	%l2,	%i1
	or	%o6,	%g3,	%i4
	xnorcc	%l6,	%i2,	%g7
	add	%l1,	0x18DB,	%l3
	smul	%i6,	%i7,	%o7
	fmovdcc	%icc,	%f8,	%f11
	fmuld8sux16	%f21,	%f21,	%f24
	fmovsl	%xcc,	%f16,	%f3
	brgez,a	%o4,	loop_513
	sdivcc	%g4,	0x173A,	%g1
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x64] %asi,	%f28
loop_513:
	subccc	%o1,	0x1B52,	%l5
	tsubcctv	%o3,	%o5,	%g5
	sethi	0x0A5A,	%g6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x18] %asi,	%l0
	array32	%o0,	%o2,	%i3
	xnorcc	%g2,	%l4,	%i5
	bn,a	%xcc,	loop_514
	edge32	%i0,	%l2,	%o6
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x23] %asi,	%g3
loop_514:
	sll	%i1,	0x14,	%i4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x34] %asi,	%i2
	movrgez	%g7,	0x3BC,	%l6
	tgu	%xcc,	0x2
	edge32ln	%l1,	%i6,	%i7
	subccc	%o7,	0x11BC,	%l3
	tvc	%xcc,	0x5
	edge16n	%g4,	%o4,	%g1
	edge16	%o1,	%o3,	%l5
	brz,a	%g5,	loop_515
	tpos	%icc,	0x1
	movrlz	%o5,	%g6,	%l0
	movcs	%xcc,	%o2,	%o0
loop_515:
	fmul8sux16	%f30,	%f28,	%f28
	movvs	%icc,	%g2,	%i3
	bge,a	%xcc,	loop_516
	edge16n	%l4,	%i5,	%i0
	srlx	%o6,	0x0E,	%l2
	array8	%g3,	%i1,	%i2
loop_516:
	bge,a	%icc,	loop_517
	movn	%icc,	%g7,	%l6
	tsubcctv	%l1,	%i6,	%i4
	fbo,a	%fcc0,	loop_518
loop_517:
	edge16l	%i7,	%l3,	%o7
	movvs	%xcc,	%g4,	%g1
	fpsub32s	%f13,	%f8,	%f25
loop_518:
	bneg,a	%icc,	loop_519
	tge	%icc,	0x5
	bcs,a	%icc,	loop_520
	xor	%o1,	0x0162,	%o4
loop_519:
	tne	%icc,	0x2
	edge32ln	%l5,	%g5,	%o3
loop_520:
	srax	%g6,	0x1B,	%o5
	smulcc	%o2,	0x0F02,	%o0
	array16	%g2,	%l0,	%l4
	edge32n	%i3,	%i0,	%o6
	edge16	%l2,	%i5,	%i1
	bge,pn	%icc,	loop_521
	fbule	%fcc3,	loop_522
	bge,pn	%icc,	loop_523
	xorcc	%g3,	%g7,	%i2
loop_521:
	udiv	%l1,	0x0791,	%l6
loop_522:
	orn	%i4,	0x1ABE,	%i6
loop_523:
	ta	%icc,	0x3
	fmul8x16al	%f11,	%f15,	%f28
	fnands	%f5,	%f31,	%f30
	xnor	%l3,	0x0BE5,	%o7
	edge16n	%i7,	%g4,	%g1
	movrgez	%o4,	0x31B,	%o1
	xorcc	%l5,	0x0D4B,	%g5
	fones	%f14
	movrne	%g6,	0x0F2,	%o5
	andncc	%o2,	%o3,	%o0
	mulx	%l0,	%g2,	%l4
	smul	%i0,	%i3,	%l2
	alignaddr	%i5,	%i1,	%o6
	mulscc	%g3,	%g7,	%i2
	fpadd16	%f4,	%f0,	%f16
	nop
	setx	0x5B43B4E407782D1B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xDFC1B12DF41E4233,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f20,	%f26
	addcc	%l1,	%i4,	%l6
	movcs	%icc,	%i6,	%o7
	nop
	fitod	%f8,	%f22
	fdtoi	%f22,	%f31
	wr	%g0,	0xe2,	%asi
	stha	%i7,	[%l7 + 0x78] %asi
	membar	#Sync
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	stw	%l3,	[%l7 + 0x08]
	tle	%xcc,	0x5
	orcc	%g4,	0x1947,	%g1
	smul	%o4,	%l5,	%o1
	addcc	%g5,	%o5,	%g6
	xnorcc	%o2,	0x1F42,	%o0
	movcs	%xcc,	%o3,	%g2
	tcc	%icc,	0x6
	tl	%xcc,	0x2
	fsrc1s	%f0,	%f11
	nop
	set	0x6C, %o1
	lduh	[%l7 + %o1],	%l0
	fpadd32	%f24,	%f8,	%f10
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
	fmovdvs	%xcc,	%f3,	%f29
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f30
	fxtod	%f30,	%f4
	edge16n	%l4,	%i0,	%i3
loop_524:
	fxnors	%f5,	%f29,	%f1
	edge32n	%i5,	%l2,	%o6
	movvs	%xcc,	%i1,	%g7
	ldd	[%l7 + 0x78],	%f10
	fpsub32	%f20,	%f16,	%f20
	udiv	%i2,	0x1C25,	%l1
	addc	%i4,	0x10F3,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l6,	%o7,	%i6
	xnor	%i7,	0x1EAB,	%g4
	fmovdg	%xcc,	%f28,	%f23
	xor	%g1,	%l3,	%l5
	edge8n	%o1,	%g5,	%o4
	sdivcc	%o5,	0x0740,	%o2
	umul	%o0,	0x0493,	%o3
	wr	%g0,	0x19,	%asi
	ldstuba	[%l7 + 0x1B] %asi,	%g6
	array8	%g2,	%l0,	%l4
	bpos,a	loop_525
	sth	%i3,	[%l7 + 0x16]
	orcc	%i5,	%i0,	%l2
	orncc	%o6,	%g7,	%i1
loop_525:
	mulscc	%l1,	0x19D8,	%i2
	fmovdpos	%icc,	%f12,	%f26
	fba	%fcc3,	loop_526
	or	%g3,	0x1CA0,	%l6
	ldsb	[%l7 + 0x36],	%i4
	tpos	%icc,	0x4
loop_526:
	movcc	%icc,	%i6,	%o7
	sdivx	%g4,	0x0783,	%i7
	mova	%icc,	%l3,	%g1
	bg,a,pn	%icc,	loop_527
	brlez,a	%o1,	loop_528
	subccc	%l5,	%o4,	%g5
	edge16ln	%o2,	%o0,	%o5
loop_527:
	tne	%xcc,	0x0
loop_528:
	taddcctv	%g6,	%o3,	%l0
	nop
	fitos	%f13,	%f4
	fxor	%f10,	%f14,	%f26
	addc	%g2,	%l4,	%i5
	fmovrdlez	%i0,	%f12,	%f8
	bvc,a	%icc,	loop_529
	orncc	%l2,	0x004E,	%i3
	fmul8x16al	%f10,	%f18,	%f16
	fbug,a	%fcc3,	loop_530
loop_529:
	bvs,a,pt	%icc,	loop_531
	fbul	%fcc0,	loop_532
	tneg	%icc,	0x3
loop_530:
	movrgez	%o6,	%g7,	%l1
loop_531:
	mova	%icc,	%i1,	%g3
loop_532:
	tn	%xcc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l6,	%i2
	movl	%icc,	%i6,	%i4
	movg	%icc,	%o7,	%g4
	nop
	set	0x5C, %o3
	ldsh	[%l7 + %o3],	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i7,	%o1,	%l5
	movg	%xcc,	%g1,	%o4
	smul	%g5,	0x0D6D,	%o0
	alignaddr	%o2,	%o5,	%g6
	xnorcc	%l0,	0x174E,	%o3
	tcc	%xcc,	0x4
	edge32ln	%g2,	%i5,	%i0
	fmovda	%xcc,	%f8,	%f9
	movre	%l4,	%l2,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f23,	%f24
	tge	%icc,	0x0
	movleu	%icc,	%g7,	%o6
	subcc	%l1,	%i1,	%l6
	tsubcctv	%i2,	%i6,	%g3
	subc	%i4,	%o7,	%l3
	movrgez	%g4,	0x218,	%o1
	nop
	setx	0xA859595760450DF8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	popc	0x0D21,	%i7
	tpos	%xcc,	0x1
	lduw	[%l7 + 0x2C],	%g1
	popc	0x08F9,	%l5
	fpadd32	%f4,	%f10,	%f4
	movvc	%xcc,	%o4,	%g5
	te	%icc,	0x2
	edge32ln	%o2,	%o0,	%g6
	udivcc	%o5,	0x1286,	%l0
	movpos	%xcc,	%g2,	%i5
	addcc	%o3,	0x1016,	%l4
	movgu	%xcc,	%i0,	%l2
	tvc	%xcc,	0x2
	tgu	%xcc,	0x3
	set	0x48, %o0
	ldxa	[%l7 + %o0] 0x89,	%g7
	nop
	setx	loop_533,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnorcc	%i3,	0x13ED,	%l1
	ld	[%l7 + 0x28],	%f30
	bleu,a,pn	%icc,	loop_534
loop_533:
	edge16ln	%i1,	%l6,	%o6
	andncc	%i6,	%g3,	%i2
	xorcc	%o7,	%l3,	%i4
loop_534:
	array8	%g4,	%o1,	%g1
	nop
	setx	0x0052CC70F07F1E13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	wr	%g0,	0x11,	%asi
	stha	%l5,	[%l7 + 0x7A] %asi
	membar	0x21
	taddcc	%i7,	0x1B24,	%o4
	fbne	%fcc0,	loop_535
	subcc	%o2,	0x058F,	%g5
	tle	%xcc,	0x5
	umulcc	%g6,	%o0,	%l0
loop_535:
	movgu	%icc,	%g2,	%o5
	wr	%g0,	0xeb,	%asi
	stha	%o3,	[%l7 + 0x32] %asi
	membar	#Sync
	set	0x40, %g3
	lda	[%l7 + %g3] 0x81,	%f11
	fbne,a	%fcc2,	loop_536
	tleu	%xcc,	0x6
	edge16ln	%i5,	%i0,	%l4
	fmovdvc	%icc,	%f21,	%f3
loop_536:
	popc	0x1264,	%l2
	fpsub32s	%f4,	%f30,	%f23
	movgu	%xcc,	%g7,	%l1
	fabss	%f0,	%f24
	smul	%i3,	0x193A,	%l6
	nop
	setx	0x869AD82610064328,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x3F08B777BF9D1E37,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f12,	%f30
	movn	%xcc,	%o6,	%i6
	stbar
	sth	%g3,	[%l7 + 0x48]
	udiv	%i1,	0x0F4F,	%i2
	subc	%l3,	%i4,	%o7
	subc	%g4,	%o1,	%g1
	addccc	%l5,	0x0885,	%i7
	bpos,a	%xcc,	loop_537
	orcc	%o4,	%g5,	%o2
	subcc	%g6,	0x07C2,	%l0
	fbue	%fcc0,	loop_538
loop_537:
	or	%o0,	%g2,	%o5
	subccc	%i5,	0x09A6,	%o3
	movge	%icc,	%i0,	%l2
loop_538:
	fbul,a	%fcc1,	loop_539
	bne,a	loop_540
	edge16	%l4,	%g7,	%i3
	edge32	%l6,	%l1,	%i6
loop_539:
	andncc	%g3,	%i1,	%o6
loop_540:
	move	%xcc,	%i2,	%l3
	ba,a	%icc,	loop_541
	array8	%i4,	%o7,	%o1
	tgu	%xcc,	0x0
	tvs	%xcc,	0x3
loop_541:
	tsubcc	%g4,	0x097D,	%g1
	fba	%fcc2,	loop_542
	andncc	%i7,	%l5,	%g5
	fbo	%fcc0,	loop_543
	movl	%icc,	%o2,	%g6
loop_542:
	move	%icc,	%o4,	%o0
	tl	%icc,	0x2
loop_543:
	sdivcc	%l0,	0x05DA,	%o5
	array16	%i5,	%g2,	%o3
	movg	%xcc,	%l2,	%i0
	sll	%g7,	0x14,	%i3
	fmovdl	%icc,	%f17,	%f21
	tneg	%xcc,	0x0
	fbule,a	%fcc0,	loop_544
	srl	%l6,	0x18,	%l4
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x59] %asi,	%i6
loop_544:
	fxor	%f10,	%f24,	%f30
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	mova	%xcc,	%g3,	%l1
	tcc	%icc,	0x2
	srlx	%i1,	%o6,	%i2
	smulcc	%i4,	%l3,	%o1
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x64] %asi,	%g4
	movn	%xcc,	%g1,	%i7
	subccc	%l5,	0x1B64,	%g5
	alignaddr	%o2,	%o7,	%o4
	nop
	setx	0x5EEA798D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x04AB85FA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fdivs	%f27,	%f27,	%f31
	addcc	%g6,	%l0,	%o0
	sllx	%o5,	%g2,	%o3
	swap	[%l7 + 0x40],	%i5
	fsrc1	%f26,	%f24
	sra	%i0,	%l2,	%i3
	flush	%l7 + 0x54
	or	%g7,	%l4,	%l6
	nop
	fitos	%f9,	%f21
	fstox	%f21,	%f10
	fxtos	%f10,	%f5
	edge16	%g3,	%l1,	%i1
	tne	%icc,	0x0
	brlez	%o6,	loop_545
	tcs	%xcc,	0x4
	ldstub	[%l7 + 0x7D],	%i2
	tne	%xcc,	0x0
loop_545:
	lduw	[%l7 + 0x2C],	%i4
	alignaddr	%l3,	%i6,	%o1
	fmovdcs	%icc,	%f22,	%f23
	movleu	%icc,	%g4,	%i7
	tl	%xcc,	0x5
	fmovsle	%xcc,	%f20,	%f6
	edge32n	%l5,	%g1,	%o2
	sllx	%g5,	%o4,	%o7
	movvc	%xcc,	%g6,	%o0
	tcc	%xcc,	0x5
	edge16ln	%o5,	%l0,	%o3
	movvc	%icc,	%i5,	%g2
	brnz	%l2,	loop_546
	umul	%i3,	%g7,	%i0
	subcc	%l6,	%l4,	%g3
	tgu	%icc,	0x2
loop_546:
	array32	%i1,	%o6,	%i2
	fornot2s	%f30,	%f12,	%f2
	fpsub16	%f30,	%f6,	%f12
	membar	0x2A
	tneg	%icc,	0x0
	nop
	fitos	%f14,	%f2
	fstod	%f2,	%f14
	tge	%icc,	0x3
	xnor	%i4,	0x06EA,	%l3
	tvc	%xcc,	0x7
	lduw	[%l7 + 0x74],	%l1
	nop
	setx	0x1C281BCD5070A343,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	subc	%o1,	0x059F,	%g4
	taddcctv	%i6,	0x0409,	%i7
	alignaddrl	%g1,	%o2,	%l5
	movvs	%icc,	%g5,	%o4
	fmovdn	%icc,	%f4,	%f19
	umul	%g6,	0x11DE,	%o7
	tne	%xcc,	0x6
	movrlz	%o0,	0x28A,	%o5
	bneg,a	%icc,	loop_547
	ldsw	[%l7 + 0x2C],	%o3
	smul	%l0,	0x0677,	%i5
	nop
	fitos	%f10,	%f11
	fstox	%f11,	%f0
	fxtos	%f0,	%f13
loop_547:
	tcc	%icc,	0x3
	fbo,a	%fcc0,	loop_548
	fmovdl	%icc,	%f5,	%f21
	nop
	setx	0x9BD13909272C4431,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xB32C625E83D74AF4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f0,	%f14
	fmovsle	%icc,	%f5,	%f3
loop_548:
	fmovde	%icc,	%f31,	%f21
	edge8	%g2,	%l2,	%i3
	umulcc	%i0,	0x18F2,	%l6
	fnegd	%f18,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l4,	%g3,	%i1
	ldstub	[%l7 + 0x4C],	%o6
	movg	%icc,	%i2,	%g7
	alignaddr	%i4,	%l1,	%o1
	bgu	%xcc,	loop_549
	lduw	[%l7 + 0x34],	%g4
	fbue,a	%fcc2,	loop_550
	sllx	%l3,	%i7,	%g1
loop_549:
	fmovsvs	%xcc,	%f2,	%f22
	nop
	setx	0xA7820DA270643001,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
loop_550:
	nop
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf1,	%f16
	addc	%i6,	%l5,	%g5
	fmovdvs	%xcc,	%f25,	%f14
	fbu	%fcc2,	loop_551
	movrgz	%o4,	0x147,	%g6
	fmul8ulx16	%f18,	%f2,	%f16
	srl	%o7,	%o0,	%o5
loop_551:
	fmovs	%f30,	%f15
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x71] %asi,	%o3
	fnor	%f16,	%f26,	%f0
	fmovrsne	%o2,	%f5,	%f1
	movneg	%xcc,	%l0,	%i5
	brnz	%l2,	loop_552
	sir	0x10EF
	std	%f24,	[%l7 + 0x68]
	orn	%g2,	%i0,	%i3
loop_552:
	sdiv	%l6,	0x1BC0,	%g3
	udivcc	%l4,	0x1A3B,	%o6
	fmovdpos	%xcc,	%f31,	%f27
	fbuge,a	%fcc3,	loop_553
	fbuge	%fcc1,	loop_554
	te	%xcc,	0x1
	set	0x40, %i2
	ldda	[%l7 + %i2] 0x89,	%f16
loop_553:
	orn	%i2,	%g7,	%i4
loop_554:
	std	%f2,	[%l7 + 0x78]
	smul	%l1,	0x0D7B,	%o1
	xnor	%g4,	0x1364,	%i1
	fmul8x16	%f9,	%f0,	%f20
	move	%xcc,	%i7,	%l3
	movg	%icc,	%g1,	%l5
	tneg	%xcc,	0x2
	fbl,a	%fcc1,	loop_555
	array16	%i6,	%g5,	%g6
	smul	%o4,	0x0C7D,	%o0
	movl	%icc,	%o7,	%o5
loop_555:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%o2,	%o3
	call	loop_556
	sdivcc	%i5,	0x1E0D,	%l0
	fbul	%fcc0,	loop_557
	ta	%xcc,	0x3
loop_556:
	be	%icc,	loop_558
	srl	%g2,	%i0,	%i3
loop_557:
	array16	%l6,	%g3,	%l4
	andn	%l2,	0x02C0,	%o6
loop_558:
	edge8	%i2,	%g7,	%l1
	tgu	%xcc,	0x3
	subcc	%o1,	0x03A2,	%g4
	sll	%i1,	0x13,	%i7
	nop
	fitos	%f9,	%f9
	fstox	%f9,	%f20
	fxtos	%f20,	%f3
	sdiv	%i4,	0x0C44,	%g1
	movle	%icc,	%l5,	%l3
	bge,a,pt	%xcc,	loop_559
	tsubcctv	%i6,	0x16A6,	%g5
	array32	%g6,	%o4,	%o7
	move	%icc,	%o5,	%o0
loop_559:
	edge8ln	%o3,	%o2,	%l0
	edge16	%g2,	%i0,	%i5
	mova	%xcc,	%i3,	%l6
	smul	%l4,	%g3,	%o6
	tne	%icc,	0x5
	xnor	%l2,	0x1217,	%g7
	fmovsvc	%icc,	%f10,	%f22
	xnorcc	%l1,	%o1,	%i2
	lduh	[%l7 + 0x52],	%i1
	umul	%g4,	0x05B5,	%i4
	xnor	%g1,	0x1F07,	%i7
	alignaddr	%l5,	%i6,	%l3
	set	0x48, %g2
	prefetcha	[%l7 + %g2] 0x0c,	 0x1
	tvc	%xcc,	0x6
	addccc	%o4,	0x1842,	%o7
	movneg	%xcc,	%g5,	%o0
	smulcc	%o3,	0x1795,	%o2
	bcc	loop_560
	tne	%icc,	0x2
	movleu	%icc,	%o5,	%g2
	fmovsn	%icc,	%f10,	%f13
loop_560:
	nop
	setx	0x6211B055,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f29
	sethi	0x1104,	%i0
	membar	0x14
	brlez	%l0,	loop_561
	sllx	%i3,	0x10,	%l6
	tge	%icc,	0x6
	srlx	%l4,	0x05,	%g3
loop_561:
	nop
	set	0x24, %l3
	stw	%i5,	[%l7 + %l3]
	fmovrdlz	%o6,	%f0,	%f6
	or	%l2,	%g7,	%o1
	edge8l	%i2,	%l1,	%i1
	bcc,a	%icc,	loop_562
	orncc	%g4,	%g1,	%i4
	udiv	%i7,	0x1E83,	%i6
	movrgz	%l5,	%g6,	%l3
loop_562:
	edge32n	%o4,	%g5,	%o0
	te	%xcc,	0x3
	stx	%o3,	[%l7 + 0x20]
	movcc	%xcc,	%o2,	%o5
	fmovdle	%icc,	%f7,	%f27
	tpos	%icc,	0x1
	fpadd16	%f2,	%f26,	%f18
	mulx	%g2,	%i0,	%o7
	fpadd16	%f30,	%f28,	%f6
	fmovdcs	%xcc,	%f6,	%f31
	bcc,a,pt	%xcc,	loop_563
	movneg	%icc,	%i3,	%l6
	bg	%icc,	loop_564
	xor	%l4,	0x03CF,	%g3
loop_563:
	movg	%icc,	%l0,	%i5
	fnot1s	%f25,	%f24
loop_564:
	umulcc	%l2,	%g7,	%o1
	movne	%xcc,	%o6,	%l1
	array32	%i1,	%g4,	%i2
	orncc	%i4,	0x12E4,	%g1
	and	%i6,	0x0E82,	%l5
	bl,a,pn	%xcc,	loop_565
	fornot2s	%f30,	%f8,	%f20
	fmovsne	%xcc,	%f26,	%f26
	tsubcc	%g6,	%i7,	%l3
loop_565:
	fnor	%f6,	%f28,	%f12
	movgu	%icc,	%g5,	%o4
	edge16	%o3,	%o0,	%o2
	brnz,a	%g2,	loop_566
	sub	%i0,	%o5,	%i3
	nop
	setx	loop_567,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movl	%xcc,	%l6,	%o7
loop_566:
	xorcc	%g3,	%l0,	%l4
	movvs	%xcc,	%l2,	%g7
loop_567:
	addccc	%o1,	0x11FB,	%i5
	movvc	%icc,	%o6,	%l1
	movl	%icc,	%i1,	%i2
	fbu,a	%fcc2,	loop_568
	sir	0x0B6E
	tge	%icc,	0x7
	nop
	setx	0xE1166E70,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f16
loop_568:
	fmul8x16	%f0,	%f26,	%f8
	fcmple16	%f20,	%f2,	%i4
	andn	%g4,	0x023B,	%i6
	te	%icc,	0x0
	movleu	%icc,	%g1,	%g6
	bl,a	loop_569
	xorcc	%i7,	0x1EEA,	%l3
	stbar
	fmovrde	%l5,	%f26,	%f4
loop_569:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f12
	fzeros	%f23
	udivcc	%o4,	0x0ED5,	%o3
	subcc	%o0,	%o2,	%g5
	umulcc	%g2,	0x10A2,	%o5
	wr	%g0,	0x11,	%asi
	stba	%i0,	[%l7 + 0x4F] %asi
	sdiv	%l6,	0x06D3,	%o7
	movne	%icc,	%g3,	%l0
	tsubcctv	%i3,	%l4,	%l2
	fxors	%f22,	%f8,	%f8
	edge8l	%g7,	%i5,	%o1
	movg	%xcc,	%l1,	%o6
	fnors	%f14,	%f0,	%f22
	edge16ln	%i2,	%i4,	%g4
	ldd	[%l7 + 0x70],	%f26
	edge8n	%i6,	%i1,	%g6
	fxnors	%f30,	%f26,	%f2
	movg	%icc,	%i7,	%g1
	bpos	loop_570
	mulscc	%l3,	0x19CF,	%o4
	fcmpne16	%f22,	%f6,	%o3
	ld	[%l7 + 0x40],	%f0
loop_570:
	fnot2	%f28,	%f2
	fbu,a	%fcc3,	loop_571
	xnorcc	%o0,	0x00DB,	%l5
	fzero	%f30
	movrgz	%o2,	%g2,	%g5
loop_571:
	movle	%icc,	%i0,	%o5
	move	%icc,	%l6,	%g3
	fandnot1	%f24,	%f30,	%f14
	sethi	0x01AD,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o7,	0x0094,	%i3
	move	%icc,	%l4,	%g7
	movcc	%icc,	%i5,	%l2
	brgez,a	%o1,	loop_572
	and	%o6,	0x0CF6,	%i2
	tn	%icc,	0x5
	alignaddrl	%i4,	%g4,	%i6
loop_572:
	nop
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tvc	%xcc,	0x4
	array32	%i1,	%g6,	%l1
	tge	%xcc,	0x6
	nop
	setx	0xF522AB27,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x4D8E9A38,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f21,	%f0
	edge8l	%g1,	%i7,	%l3
	bn,a,pn	%icc,	loop_573
	bcs,a	loop_574
	xnorcc	%o4,	0x0F50,	%o3
	umulcc	%l5,	%o0,	%g2
loop_573:
	bvc,a,pt	%xcc,	loop_575
loop_574:
	pdist	%f14,	%f10,	%f24
	set	0x30, %i4
	stba	%o2,	[%l7 + %i4] 0x89
loop_575:
	movge	%xcc,	%i0,	%o5
	fmovdcs	%icc,	%f27,	%f8
	movrlez	%l6,	0x261,	%g5
	wr	%g0,	0x11,	%asi
	stxa	%l0,	[%l7 + 0x48] %asi
	stbar
	tn	%icc,	0x1
	fbug,a	%fcc2,	loop_576
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o7,	%g3,	%l4
	ldstub	[%l7 + 0x50],	%g7
loop_576:
	nop
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x10] %asi,	%i3
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fcmpne32	%f28,	%f0,	%i5
	edge32	%l2,	%o1,	%i2
	fbuge	%fcc2,	loop_577
	fnot1s	%f3,	%f28
	bcs,pt	%icc,	loop_578
	andncc	%o6,	%i4,	%g4
loop_577:
	nop
	wr	%g0,	0xeb,	%asi
	stwa	%i1,	[%l7 + 0x60] %asi
	membar	#Sync
loop_578:
	fnot1	%f30,	%f12
	membar	0x3E
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f2,	%f14
	fstox	%f14,	%f14
	tle	%icc,	0x2
	fbug,a	%fcc0,	loop_579
	movg	%xcc,	%g6,	%l1
	edge8n	%i6,	%i7,	%g1
	fbge,a	%fcc0,	loop_580
loop_579:
	fcmple32	%f12,	%f26,	%l3
	movn	%xcc,	%o3,	%o4
	xorcc	%l5,	0x157F,	%o0
loop_580:
	sdivx	%o2,	0x05E2,	%i0
	fbuge,a	%fcc0,	loop_581
	tvs	%xcc,	0x6
	fxors	%f9,	%f16,	%f30
	nop
	setx	0x25937BBD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	fsqrts	%f2,	%f31
loop_581:
	sllx	%o5,	%g2,	%l6
	fmovdne	%xcc,	%f14,	%f27
	subccc	%l0,	%o7,	%g3
	mova	%xcc,	%l4,	%g5
	fbul,a	%fcc3,	loop_582
	bl,a,pt	%xcc,	loop_583
	movrgz	%i3,	%g7,	%l2
	andncc	%o1,	%i5,	%o6
loop_582:
	fcmpeq16	%f0,	%f28,	%i4
loop_583:
	edge32n	%g4,	%i2,	%g6
	ta	%xcc,	0x7
	xnor	%i1,	0x0954,	%l1
	movne	%icc,	%i7,	%i6
	fbge	%fcc2,	loop_584
	fmul8ulx16	%f0,	%f26,	%f8
	movvc	%xcc,	%l3,	%g1
	udivx	%o4,	0x0B8B,	%l5
loop_584:
	sdivx	%o3,	0x09FC,	%o2
	bgu,pt	%xcc,	loop_585
	andncc	%i0,	%o0,	%o5
	fmovrde	%g2,	%f30,	%f24
	fornot1s	%f28,	%f20,	%f11
loop_585:
	fmovdcc	%xcc,	%f16,	%f12
	fandnot2	%f10,	%f2,	%f16
	nop
	setx	0xA539DCD1D91C2860,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x46471E8684E84FDC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f10,	%f8
	ldsb	[%l7 + 0x26],	%l6
	fmovdge	%xcc,	%f31,	%f8
	nop
	fitos	%f8,	%f29
	fstoi	%f29,	%f2
	edge32l	%o7,	%g3,	%l4
	nop
	fitos	%f6,	%f5
	fstox	%f5,	%f18
	fxtos	%f18,	%f16
	subc	%g5,	%i3,	%g7
	fbo,a	%fcc0,	loop_586
	brnz	%l0,	loop_587
	be,a,pn	%icc,	loop_588
	movvc	%icc,	%l2,	%o1
loop_586:
	fbule	%fcc0,	loop_589
loop_587:
	mulx	%o6,	%i5,	%g4
loop_588:
	nop
	fitod	%f27,	%f16
	popc	%i4,	%g6
loop_589:
	taddcctv	%i2,	0x0BC8,	%l1
	movcc	%icc,	%i1,	%i7
	fsrc2	%f0,	%f0
	fcmpeq32	%f0,	%f28,	%l3
	fpsub16s	%f28,	%f9,	%f17
	movleu	%icc,	%g1,	%o4
	te	%icc,	0x2
	smul	%l5,	0x0FAE,	%o3
	movrlez	%i6,	0x241,	%o2
	fpack32	%f12,	%f2,	%f12
	movcc	%xcc,	%i0,	%o0
	set	0x7B, %i1
	ldstuba	[%l7 + %i1] 0x0c,	%o5
	fbule	%fcc0,	loop_590
	alignaddr	%l6,	%o7,	%g2
	andcc	%l4,	0x118B,	%g3
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x78] %asi,	%g5
loop_590:
	faligndata	%f24,	%f16,	%f8
	movle	%xcc,	%g7,	%l0
	ldub	[%l7 + 0x1E],	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x50
	set	0x2C, %i0
	stwa	%l2,	[%l7 + %i0] 0x0c
	edge16n	%o1,	%i5,	%o6
	nop
	fitod	%f7,	%f24
	ldsw	[%l7 + 0x74],	%g4
	lduh	[%l7 + 0x14],	%g6
	mulx	%i4,	0x0A6B,	%i2
	smul	%l1,	0x1B10,	%i7
	tgu	%icc,	0x7
	fone	%f4
	stbar
	edge8l	%l3,	%i1,	%g1
	umulcc	%l5,	%o4,	%i6
	fand	%f16,	%f24,	%f10
	fbg,a	%fcc0,	loop_591
	flush	%l7 + 0x38
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o2
loop_591:
	fmovdvs	%icc,	%f21,	%f29
	xorcc	%o3,	0x07A0,	%o0
	and	%i0,	%l6,	%o5
	edge16n	%o7,	%g2,	%l4
	movrlz	%g3,	%g5,	%g7
	fpack32	%f14,	%f30,	%f24
	and	%i3,	%l0,	%o1
	call	loop_592
	add	%i5,	%l2,	%o6
	movrgez	%g6,	%g4,	%i4
	movleu	%xcc,	%i2,	%i7
loop_592:
	fbul	%fcc1,	loop_593
	bg,a	loop_594
	move	%icc,	%l3,	%i1
	tne	%icc,	0x6
loop_593:
	bneg,pt	%icc,	loop_595
loop_594:
	array16	%g1,	%l1,	%o4
	nop
	setx	loop_596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%xcc,	0x5
loop_595:
	xor	%i6,	%l5,	%o2
	sdivcc	%o0,	0x0EE6,	%o3
loop_596:
	orcc	%i0,	0x1C1D,	%o5
	sir	0x150F
	subc	%l6,	0x07BE,	%g2
	movne	%xcc,	%l4,	%o7
	addcc	%g5,	%g7,	%i3
	brgez	%l0,	loop_597
	fmovrslz	%o1,	%f8,	%f0
	fbu,a	%fcc1,	loop_598
	edge32ln	%i5,	%l2,	%o6
loop_597:
	fmovdneg	%icc,	%f23,	%f14
	xnorcc	%g3,	0x0DD3,	%g6
loop_598:
	fmovs	%f16,	%f15
	xnorcc	%i4,	0x058F,	%i2
	movrgez	%g4,	0x377,	%i7
	movrgez	%l3,	%g1,	%l1
	movrlez	%i1,	0x2A2,	%o4
	tsubcc	%l5,	%i6,	%o0
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%o3
	array16	%i0,	%o2,	%l6
	fbue	%fcc0,	loop_599
	movn	%xcc,	%o5,	%l4
	ba,a,pt	%xcc,	loop_600
	taddcc	%g2,	0x0A49,	%g5
loop_599:
	fbge,a	%fcc3,	loop_601
	fmovrdne	%g7,	%f18,	%f14
loop_600:
	andcc	%o7,	%i3,	%o1
	movneg	%xcc,	%l0,	%l2
loop_601:
	tle	%icc,	0x3
	subcc	%o6,	%i5,	%g3
	ldx	[%l7 + 0x20],	%i4
	tsubcctv	%i2,	0x067B,	%g4
	fbul	%fcc1,	loop_602
	or	%i7,	%l3,	%g6
	edge16ln	%g1,	%l1,	%o4
	movpos	%xcc,	%l5,	%i6
loop_602:
	tne	%icc,	0x1
	tcc	%icc,	0x2
	tneg	%xcc,	0x0
	edge32n	%o0,	%i1,	%o3
	sra	%o2,	%l6,	%o5
	srlx	%i0,	%l4,	%g2
	subc	%g7,	0x149E,	%o7
	edge32l	%g5,	%i3,	%l0
	fsrc2	%f30,	%f12
	tgu	%icc,	0x7
	umul	%o1,	%o6,	%i5
	fmovdpos	%icc,	%f31,	%f7
	tge	%xcc,	0x4
	sir	0x07D8
	membar	0x51
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f0
	fxtod	%f0,	%f14
	fmovrdlz	%g3,	%f14,	%f4
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
	brgz	%l2,	loop_604
	orncc	%i2,	0x0C5B,	%i4
	fnors	%f13,	%f31,	%f3
loop_603:
	nop
	setx loop_605, %l0, %l1
	jmpl %l1, %g4
loop_604:
	fmovrdgz	%l3,	%f18,	%f30
	set	0x64, %l4
	ldswa	[%l7 + %l4] 0x15,	%g6
loop_605:
	movne	%icc,	%g1,	%l1
	taddcctv	%o4,	0x0384,	%l5
	umul	%i7,	0x1D10,	%o0
	tle	%icc,	0x2
	subcc	%i1,	0x1B6D,	%o3
	fornot2	%f18,	%f4,	%f28
	fzeros	%f31
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fba,a	%fcc1,	loop_606
	nop
	setx	0xB4DFC4871DB39F05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xA7F172FE4ED212F2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f8,	%f4
	fmovsneg	%icc,	%f2,	%f24
	movl	%xcc,	%o2,	%i6
loop_606:
	subcc	%o5,	0x18BD,	%l6
	popc	0x1B92,	%l4
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x210] %asi,	%g2
	umulcc	%g7,	0x1EE0,	%o7
	swap	[%l7 + 0x7C],	%i0
	mova	%icc,	%g5,	%l0
	subc	%o1,	%o6,	%i5
	stx	%i3,	[%l7 + 0x30]
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x58] %asi,	%g3
	tsubcc	%l2,	0x1075,	%i2
	nop
	fitod	%f28,	%f22
	fnegs	%f0,	%f15
	sub	%i4,	0x05BA,	%g4
	lduh	[%l7 + 0x4A],	%g6
	fpadd32s	%f13,	%f5,	%f17
	flush	%l7 + 0x6C
	fmovrslz	%g1,	%f14,	%f28
	brnz,a	%l3,	loop_607
	lduw	[%l7 + 0x1C],	%l1
	movvs	%xcc,	%l5,	%o4
	tgu	%xcc,	0x6
loop_607:
	movvs	%icc,	%i7,	%i1
	tge	%xcc,	0x7
	movne	%xcc,	%o3,	%o2
	addccc	%o0,	0x13E7,	%o5
	fbul	%fcc2,	loop_608
	tg	%icc,	0x5
	addcc	%l6,	%i6,	%g2
	fmovsle	%icc,	%f28,	%f29
loop_608:
	bn,pn	%xcc,	loop_609
	tsubcctv	%l4,	0x1727,	%o7
	membar	0x56
	fbge	%fcc1,	loop_610
loop_609:
	fmovdneg	%icc,	%f2,	%f12
	movgu	%icc,	%g7,	%g5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
loop_610:
	tsubcctv	%o1,	0x0CE6,	%i0
	st	%f0,	[%l7 + 0x7C]
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x38] %asi,	%i5
	membar	0x3E
	andn	%i3,	%g3,	%o6
	bvs,a,pn	%xcc,	loop_611
	nop
	setx	loop_612,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movre	%l2,	%i4,	%g4
	fmovdle	%icc,	%f18,	%f21
loop_611:
	movrne	%g6,	%g1,	%l3
loop_612:
	tl	%xcc,	0x4
	orn	%i2,	%l5,	%l1
	tvc	%xcc,	0x0
	tneg	%xcc,	0x7
	movvs	%icc,	%i7,	%i1
	fones	%f26
	fmovsa	%icc,	%f23,	%f21
	bvc	%icc,	loop_613
	edge32n	%o4,	%o2,	%o3
	tleu	%icc,	0x7
	sdivx	%o0,	0x00E5,	%o5
loop_613:
	nop
	wr	%g0,	0x23,	%asi
	stwa	%l6,	[%l7 + 0x70] %asi
	membar	#Sync
	fmovsn	%xcc,	%f16,	%f8
	tgu	%xcc,	0x0
	andn	%g2,	0x181A,	%i6
	movvs	%icc,	%l4,	%o7
	tcc	%xcc,	0x6
	orn	%g7,	0x16FB,	%g5
	movle	%xcc,	%l0,	%i0
	ldsw	[%l7 + 0x74],	%o1
	smulcc	%i5,	%g3,	%i3
	fmovdpos	%icc,	%f23,	%f6
	add	%o6,	%i4,	%g4
	fbug,a	%fcc1,	loop_614
	array16	%l2,	%g6,	%l3
	sdivcc	%i2,	0x1F40,	%l5
	alignaddrl	%l1,	%i7,	%i1
loop_614:
	fmul8x16al	%f25,	%f13,	%f2
	fone	%f4
	move	%xcc,	%o4,	%g1
	array16	%o3,	%o2,	%o5
	movleu	%xcc,	%l6,	%o0
	tgu	%xcc,	0x6
	movne	%xcc,	%i6,	%g2
	fmul8x16	%f3,	%f16,	%f4
	fmovdle	%icc,	%f24,	%f13
	ldsw	[%l7 + 0x38],	%o7
	movvs	%xcc,	%l4,	%g7
	tvs	%xcc,	0x4
	andncc	%g5,	%i0,	%o1
	movn	%icc,	%i5,	%g3
	fmovrdne	%l0,	%f8,	%f24
	movrgez	%i3,	%o6,	%g4
	fmovrde	%l2,	%f24,	%f26
	movrgz	%i4,	%l3,	%i2
	alignaddrl	%l5,	%l1,	%i7
	mulx	%g6,	%i1,	%o4
	fmovdne	%xcc,	%f26,	%f21
	movvc	%icc,	%o3,	%g1
	array8	%o2,	%l6,	%o0
	array8	%o5,	%g2,	%i6
	mulscc	%l4,	0x10F1,	%g7
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x52] %asi,	%g5
	fmovrde	%o7,	%f16,	%f4
	alignaddr	%i0,	%o1,	%g3
	fandnot1	%f28,	%f20,	%f4
	xnorcc	%l0,	%i3,	%o6
	movg	%xcc,	%i5,	%g4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x18] %asi,	%l2
	popc	0x1A7D,	%i4
	movl	%xcc,	%i2,	%l5
	popc	0x1907,	%l3
	fmovsgu	%xcc,	%f11,	%f14
	edge16n	%i7,	%g6,	%i1
	wr	%g0,	0xe2,	%asi
	stwa	%l1,	[%l7 + 0x20] %asi
	membar	#Sync
	tle	%icc,	0x0
	membar	0x45
	nop
	setx	0xF1D06C9E3AF003D7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f26
	srlx	%o4,	%o3,	%o2
	fmovrse	%l6,	%f23,	%f24
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x1E] %asi,	%g1
	fnand	%f14,	%f20,	%f16
	mulscc	%o5,	%g2,	%i6
	fpack16	%f6,	%f10
	movrgez	%o0,	%g7,	%l4
	orncc	%o7,	0x1EF2,	%g5
	fornot1	%f6,	%f18,	%f6
	tle	%icc,	0x7
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x49] %asi,	%o1
	fmovdl	%xcc,	%f18,	%f15
	fmovdg	%icc,	%f12,	%f30
	movneg	%icc,	%g3,	%i0
	fbul	%fcc3,	loop_615
	fmovrsgz	%i3,	%f24,	%f21
	fmovsneg	%icc,	%f3,	%f17
	call	loop_616
loop_615:
	movgu	%icc,	%l0,	%i5
	brnz	%o6,	loop_617
	tn	%icc,	0x5
loop_616:
	orcc	%l2,	%i4,	%g4
	set	0x8, %l5
	ldxa	[%g0 + %l5] 0x21,	%i2
loop_617:
	movleu	%xcc,	%l3,	%l5
	subcc	%g6,	0x1BC3,	%i7
	be,a,pt	%icc,	loop_618
	fbe	%fcc3,	loop_619
	tge	%icc,	0x7
	srax	%l1,	%i1,	%o3
loop_618:
	andcc	%o2,	0x1246,	%o4
loop_619:
	be,a,pn	%xcc,	loop_620
	xnorcc	%g1,	%l6,	%o5
	movle	%xcc,	%i6,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_620:
	movge	%icc,	%g7,	%g2
	fmovrslez	%l4,	%f15,	%f10
	fmovdcs	%xcc,	%f1,	%f3
	sdivcc	%g5,	0x15D5,	%o7
	bvc,pt	%xcc,	loop_621
	taddcctv	%o1,	%i0,	%g3
	tsubcctv	%i3,	0x0F65,	%i5
	fble	%fcc3,	loop_622
loop_621:
	fmovsvc	%icc,	%f19,	%f0
	bg,a	loop_623
	fmovda	%xcc,	%f1,	%f14
loop_622:
	fba,a	%fcc0,	loop_624
	srlx	%l0,	0x07,	%o6
loop_623:
	move	%xcc,	%l2,	%i4
	mulx	%g4,	%l3,	%l5
loop_624:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%g6,	%i2
	sir	0x0A5A
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i7,	%l1,	%i1
	tvc	%xcc,	0x5
	movrlez	%o3,	0x23C,	%o2
	fbe	%fcc0,	loop_625
	nop
	setx	loop_626,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%g1,	%l6,	%o4
	movvc	%xcc,	%i6,	%o0
loop_625:
	edge16	%g7,	%o5,	%g2
loop_626:
	addc	%g5,	0x0CC4,	%o7
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l4
	edge32n	%o1,	%g3,	%i0
	sra	%i3,	0x15,	%i5
	tge	%xcc,	0x6
	nop
	setx	0x004B3F2B,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	stbar
	fmovdpos	%icc,	%f11,	%f17
	edge32n	%l0,	%l2,	%o6
	edge32ln	%g4,	%i4,	%l5
	for	%f30,	%f18,	%f20
	nop
	setx	0xAEACC4081079E31C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	udiv	%l3,	0x16D3,	%g6
	stb	%i7,	[%l7 + 0x3B]
	edge32n	%i2,	%l1,	%o3
	movrgez	%i1,	%o2,	%l6
	fsrc2s	%f30,	%f21
	bcc,pt	%icc,	loop_627
	subcc	%g1,	%i6,	%o0
	fmovdle	%xcc,	%f14,	%f13
	mova	%icc,	%o4,	%o5
loop_627:
	movneg	%icc,	%g7,	%g5
	or	%g2,	0x03F4,	%o7
	fxor	%f2,	%f12,	%f24
	umulcc	%l4,	0x0E5F,	%g3
	fpack16	%f0,	%f24
	mova	%xcc,	%o1,	%i3
	srlx	%i0,	%l0,	%l2
	smulcc	%i5,	0x12F2,	%o6
	fexpand	%f21,	%f14
	movleu	%xcc,	%g4,	%i4
	tcs	%xcc,	0x0
	srax	%l5,	0x1A,	%g6
	edge32n	%l3,	%i7,	%l1
	tg	%xcc,	0x3
	fones	%f27
	addc	%i2,	%i1,	%o2
	edge32l	%l6,	%g1,	%o3
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x58] %asi,	%o0
	tpos	%xcc,	0x7
	alignaddrl	%i6,	%o4,	%g7
	nop
	setx	0x645E50A6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x409DE523,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f2,	%f13
	umulcc	%g5,	0x110E,	%o5
	sethi	0x1CB4,	%g2
	fmovsvc	%xcc,	%f14,	%f11
	tneg	%xcc,	0x5
	sethi	0x070C,	%o7
	edge16ln	%g3,	%l4,	%o1
	fnegs	%f3,	%f26
	alignaddr	%i0,	%l0,	%l2
	movgu	%xcc,	%i5,	%o6
	movl	%icc,	%g4,	%i4
	ta	%icc,	0x1
	fmovs	%f15,	%f3
	fblg,a	%fcc2,	loop_628
	tn	%xcc,	0x0
	bne,a	loop_629
	fmovdg	%xcc,	%f31,	%f27
loop_628:
	edge32l	%i3,	%l5,	%g6
	fmovsn	%xcc,	%f1,	%f25
loop_629:
	fmovrdgez	%l3,	%f24,	%f26
	movn	%xcc,	%l1,	%i7
	xnor	%i2,	0x11AB,	%i1
	edge8n	%l6,	%o2,	%g1
	taddcctv	%o0,	0x0C2E,	%o3
	fmovrslez	%i6,	%f20,	%f20
	fmuld8ulx16	%f10,	%f4,	%f20
	fornot1s	%f30,	%f24,	%f4
	fmovsn	%xcc,	%f21,	%f21
	ldd	[%l7 + 0x10],	%f0
	movle	%icc,	%o4,	%g7
	fblg,a	%fcc3,	loop_630
	edge16ln	%o5,	%g5,	%g2
	nop
	fitos	%f3,	%f25
	fstoi	%f25,	%f19
	umulcc	%g3,	0x166F,	%o7
loop_630:
	bpos	%xcc,	loop_631
	edge8l	%o1,	%l4,	%l0
	fmovdpos	%icc,	%f5,	%f15
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x57] %asi,	%l2
loop_631:
	edge16l	%i5,	%o6,	%i0
	movle	%xcc,	%g4,	%i3
	fble,a	%fcc1,	loop_632
	edge16n	%l5,	%g6,	%l3
	sdivcc	%l1,	0x1656,	%i4
	nop
	setx	loop_633,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_632:
	movneg	%icc,	%i2,	%i7
	sub	%i1,	0x0E42,	%l6
	tl	%xcc,	0x2
loop_633:
	udivcc	%o2,	0x08F5,	%o0
	nop
	fitos	%f10,	%f22
	fstox	%f22,	%f24
	ldd	[%l7 + 0x08],	%f16
	edge8l	%g1,	%o3,	%i6
	movne	%xcc,	%o4,	%g7
	movn	%xcc,	%g5,	%g2
	movpos	%icc,	%g3,	%o7
	fand	%f8,	%f4,	%f22
	nop
	fitos	%f10,	%f23
	fstox	%f23,	%f20
	fxtos	%f20,	%f25
	mulx	%o1,	%l4,	%o5
	fmovspos	%icc,	%f12,	%f6
	fblg	%fcc1,	loop_634
	movrlez	%l2,	%l0,	%i5
	movg	%xcc,	%o6,	%i0
	nop
	fitos	%f4,	%f12
	fstoi	%f12,	%f26
loop_634:
	nop
	fitos	%f9,	%f19
	fstox	%f19,	%f10
	fxtos	%f10,	%f30
	sub	%g4,	%i3,	%l5
	fbule,a	%fcc3,	loop_635
	tneg	%icc,	0x6
	movne	%xcc,	%g6,	%l1
	bvs,pt	%icc,	loop_636
loop_635:
	fmovscc	%icc,	%f24,	%f24
	movre	%l3,	0x109,	%i2
	tne	%icc,	0x0
loop_636:
	edge32l	%i7,	%i4,	%i1
	srax	%o2,	%o0,	%g1
	tsubcctv	%o3,	%i6,	%o4
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf1,	%f0
	addccc	%l6,	%g5,	%g2
	edge32n	%g3,	%o7,	%g7
	tne	%icc,	0x0
	fpack32	%f30,	%f30,	%f20
	movrlz	%l4,	0x2AB,	%o1
	and	%l2,	%l0,	%i5
	fbue	%fcc3,	loop_637
	taddcc	%o6,	0x0FAA,	%o5
	movg	%xcc,	%i0,	%i3
	sllx	%g4,	0x0A,	%g6
loop_637:
	edge8ln	%l1,	%l5,	%l3
	tsubcc	%i7,	%i2,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i4,	%o0,	%g1
	stx	%o2,	[%l7 + 0x30]
	call	loop_638
	fsrc1	%f22,	%f28
	add	%o3,	%i6,	%o4
	subc	%g5,	0x1134,	%l6
loop_638:
	tcs	%icc,	0x6
	array8	%g3,	%o7,	%g2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%g7,	%o1
	move	%icc,	%l4,	%l2
	fbl	%fcc3,	loop_639
	nop
	setx	0x295AB1CA207A711C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	lduh	[%l7 + 0x14],	%i5
	set	0x4C, %o2
	sta	%f13,	[%l7 + %o2] 0x88
loop_639:
	movge	%icc,	%l0,	%o6
	sra	%i0,	%o5,	%g4
	movcc	%xcc,	%i3,	%g6
	ba	loop_640
	movgu	%xcc,	%l5,	%l1
	move	%xcc,	%i7,	%i2
	ta	%icc,	0x7
loop_640:
	bleu,a	loop_641
	sdivx	%l3,	0x1E93,	%i4
	movleu	%icc,	%i1,	%g1
	movrlez	%o2,	0x1DE,	%o3
loop_641:
	fmovrslz	%o0,	%f19,	%f8
	andncc	%o4,	%i6,	%g5
	smulcc	%l6,	%o7,	%g2
	fcmpeq32	%f4,	%f6,	%g7
	tn	%icc,	0x3
	fzeros	%f23
	sdivcc	%g3,	0x013F,	%l4
	subc	%l2,	%o1,	%i5
	fmovdcs	%icc,	%f7,	%f11
	fmovscc	%icc,	%f19,	%f13
	set	0x20, %g1
	ldda	[%l7 + %g1] 0xea,	%o6
	edge8l	%i0,	%o5,	%l0
	nop
	set	0x2A, %i5
	stb	%i3,	[%l7 + %i5]
	smulcc	%g6,	%g4,	%l5
	fbue,a	%fcc2,	loop_642
	taddcc	%i7,	%i2,	%l3
	flush	%l7 + 0x18
	set	0x5A, %l2
	stha	%i4,	[%l7 + %l2] 0x11
loop_642:
	bne,a	%xcc,	loop_643
	movneg	%icc,	%i1,	%g1
	andncc	%l1,	%o2,	%o3
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x4C] %asi,	%f5
loop_643:
	tleu	%xcc,	0x1
	fpadd16	%f20,	%f18,	%f2
	nop
	setx loop_644, %l0, %l1
	jmpl %l1, %o0
	brz,a	%o4,	loop_645
	sir	0x1A34
	fmovscc	%icc,	%f26,	%f17
loop_644:
	nop
	setx	0xC2DFDFCCB81FD2AE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xDF78C19C28B6F17F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f8,	%f10
loop_645:
	sdiv	%i6,	0x00DC,	%l6
	movcc	%xcc,	%o7,	%g2
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x6E] %asi,	%g7
	popc	%g3,	%l4
	fpadd32s	%f15,	%f21,	%f24
	bl,a	%icc,	loop_646
	and	%l2,	0x02EC,	%o1
	nop
	setx	0xD8BE6BB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x9E777814,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f24,	%f11
	fmovsa	%xcc,	%f13,	%f18
loop_646:
	popc	0x1F99,	%g5
	subcc	%o6,	%i0,	%i5
	and	%o5,	%i3,	%l0
	fnot2s	%f14,	%f11
	tg	%icc,	0x7
	tneg	%icc,	0x6
	fmovsa	%xcc,	%f21,	%f31
	movle	%icc,	%g6,	%g4
	udivcc	%l5,	0x07A3,	%i2
	smul	%l3,	0x0E4F,	%i4
	nop
	setx loop_647, %l0, %l1
	jmpl %l1, %i1
	movn	%xcc,	%i7,	%l1
	nop
	setx	0x12BC17CFD06449FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	subccc	%o2,	0x032B,	%o3
loop_647:
	bvs,a	loop_648
	edge16ln	%o0,	%o4,	%i6
	fmovdvs	%xcc,	%f20,	%f14
	popc	%l6,	%g1
loop_648:
	udivx	%g2,	0x01E4,	%o7
	fornot2s	%f4,	%f17,	%f9
	edge32l	%g7,	%g3,	%l2
	udivcc	%o1,	0x070F,	%l4
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x18] %asi,	%g5
	smul	%o6,	0x17F6,	%i0
	bcc,a,pt	%xcc,	loop_649
	fbne,a	%fcc1,	loop_650
	sll	%i5,	%o5,	%i3
	udivx	%g6,	0x09AD,	%l0
loop_649:
	tle	%xcc,	0x2
loop_650:
	xnorcc	%l5,	0x08E2,	%g4
	subccc	%i2,	%l3,	%i4
	fexpand	%f7,	%f4
	fcmpne16	%f6,	%f6,	%i7
	movvc	%xcc,	%l1,	%i1
	fornot2s	%f18,	%f5,	%f10
	fbg	%fcc0,	loop_651
	udiv	%o2,	0x12DD,	%o0
	fornot1	%f24,	%f30,	%f18
	fble	%fcc1,	loop_652
loop_651:
	fba,a	%fcc1,	loop_653
	brlz,a	%o3,	loop_654
	xor	%o4,	0x0655,	%l6
loop_652:
	array8	%i6,	%g1,	%g2
loop_653:
	andcc	%g7,	0x09B5,	%o7
loop_654:
	brz	%l2,	loop_655
	sdiv	%o1,	0x0E7D,	%l4
	tcs	%icc,	0x4
	tge	%xcc,	0x3
loop_655:
	movrlz	%g5,	%o6,	%i0
	edge8n	%g3,	%o5,	%i3
	edge8	%i5,	%g6,	%l5
	orncc	%g4,	%l0,	%i2
	fmuld8ulx16	%f3,	%f4,	%f2
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l3
	edge32ln	%i7,	%l1,	%i4
	te	%xcc,	0x0
	fmovdcs	%xcc,	%f18,	%f5
	nop
	fitod	%f0,	%f14
	fdtoi	%f14,	%f2
	brlz,a	%o2,	loop_656
	orcc	%i1,	%o0,	%o4
	fbue	%fcc2,	loop_657
	fpsub32s	%f9,	%f26,	%f23
loop_656:
	movle	%icc,	%l6,	%i6
	movle	%icc,	%o3,	%g2
loop_657:
	edge16ln	%g7,	%g1,	%o7
	movl	%xcc,	%o1,	%l4
	popc	0x1094,	%l2
	fmovsge	%icc,	%f4,	%f22
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
	tg	%xcc,	0x6
	edge16n	%g5,	%i0,	%g3
	set	0x08, %l1
	lduwa	[%l7 + %l1] 0x80,	%o5
loop_658:
	xor	%o6,	0x1D84,	%i3
	umulcc	%i5,	%l5,	%g4
	fmovdcc	%xcc,	%f17,	%f30
	tn	%xcc,	0x7
	xnorcc	%l0,	%g6,	%i2
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%l1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2C] %asi,	%i7
	or	%i4,	0x13E5,	%o2
	fmovdle	%icc,	%f10,	%f3
	set	0x78, %g4
	stha	%o0,	[%l7 + %g4] 0x04
	edge16l	%o4,	%i1,	%l6
	orcc	%i6,	%g2,	%o3
	orncc	%g7,	%g1,	%o1
	edge8n	%o7,	%l2,	%l4
	edge8l	%i0,	%g3,	%o5
	sll	%g5,	%i3,	%o6
	membar	0x4C
	stb	%l5,	[%l7 + 0x55]
	orncc	%g4,	0x01F7,	%i5
	nop
	setx	loop_659,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	udivcc	%g6,	0x0389,	%l0
	movne	%xcc,	%l3,	%l1
	edge16	%i7,	%i4,	%i2
loop_659:
	ldd	[%l7 + 0x10],	%f6
	movcs	%xcc,	%o2,	%o0
	ldstub	[%l7 + 0x62],	%o4
	movl	%xcc,	%l6,	%i1
	nop
	fitos	%f16,	%f0
	tge	%xcc,	0x3
	fblg,a	%fcc0,	loop_660
	tl	%icc,	0x2
	movg	%xcc,	%g2,	%i6
	smulcc	%o3,	%g1,	%o1
loop_660:
	movl	%icc,	%g7,	%l2
	andncc	%l4,	%i0,	%o7
	tvc	%xcc,	0x1
	addc	%o5,	0x1165,	%g3
	orn	%g5,	%o6,	%i3
	tcc	%icc,	0x6
	tsubcctv	%g4,	0x1AAC,	%l5
	mova	%icc,	%g6,	%i5
	stw	%l3,	[%l7 + 0x58]
	fandnot2s	%f19,	%f9,	%f18
	sdivx	%l0,	0x096F,	%i7
	bl,pt	%xcc,	loop_661
	fmovscs	%xcc,	%f15,	%f13
	fpack32	%f4,	%f18,	%f24
	lduh	[%l7 + 0x62],	%l1
loop_661:
	nop
	setx	loop_662,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	st	%f18,	[%l7 + 0x40]
	bvs	loop_663
	tgu	%xcc,	0x6
loop_662:
	edge8ln	%i4,	%o2,	%i2
	tcs	%xcc,	0x3
loop_663:
	srl	%o0,	%l6,	%o4
	smul	%i1,	%g2,	%i6
	umul	%o3,	0x1986,	%o1
	tpos	%icc,	0x6
	edge32ln	%g7,	%l2,	%g1
	fabsd	%f4,	%f10
	fbo	%fcc3,	loop_664
	nop
	setx	0xCAA2AEC0D6C6DB6D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xFBA79430EBF222D7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f12,	%f0
	fbn,a	%fcc0,	loop_665
	fmovrslz	%i0,	%f15,	%f17
loop_664:
	fbuge,a	%fcc2,	loop_666
	tvs	%xcc,	0x1
loop_665:
	subcc	%o7,	%o5,	%l4
	fmovdn	%icc,	%f7,	%f15
loop_666:
	nop
	set	0x48, %i6
	stwa	%g5,	[%l7 + %i6] 0xea
	membar	#Sync
	xnor	%g3,	0x15AD,	%i3
	st	%f4,	[%l7 + 0x0C]
	move	%icc,	%g4,	%o6
	movleu	%icc,	%g6,	%i5
	tgu	%xcc,	0x0
	umulcc	%l3,	%l5,	%i7
	tn	%xcc,	0x1
	andcc	%l1,	%l0,	%i4
	tleu	%icc,	0x6
	movcs	%xcc,	%o2,	%o0
	nop
	setx	0xF3CBF45D51428CA9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x490B49749339E2A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f4,	%f20
	fmovsleu	%icc,	%f22,	%f12
	smul	%i2,	%o4,	%l6
	fandnot2s	%f5,	%f14,	%f26
	srlx	%i1,	%g2,	%i6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o3,	%o1
	mulx	%g7,	%l2,	%g1
	tn	%xcc,	0x7
	orcc	%o7,	0x1A29,	%i0
	nop
	set	0x4A, %i7
	ldsh	[%l7 + %i7],	%o5
	edge8	%l4,	%g5,	%g3
	orn	%i3,	0x1306,	%o6
	tle	%icc,	0x0
	brgez,a	%g4,	loop_667
	fmuld8ulx16	%f19,	%f10,	%f10
	tsubcc	%i5,	0x0713,	%l3
	fmovda	%icc,	%f28,	%f22
loop_667:
	movrlez	%g6,	0x1B0,	%i7
	fexpand	%f21,	%f16
	addccc	%l1,	0x1B5C,	%l0
	movrlez	%l5,	%i4,	%o0
	fandnot2	%f8,	%f18,	%f0
	fpack16	%f4,	%f0
	tneg	%icc,	0x1
	srax	%o2,	0x17,	%o4
	ldsb	[%l7 + 0x30],	%l6
	call	loop_668
	fbue,a	%fcc2,	loop_669
	ldub	[%l7 + 0x56],	%i2
	movcc	%icc,	%g2,	%i1
loop_668:
	movrne	%i6,	0x14C,	%o3
loop_669:
	stbar
	ldsb	[%l7 + 0x52],	%o1
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x24] %asi,	%l2
	tne	%icc,	0x4
	tleu	%icc,	0x5
	tpos	%icc,	0x7
	fmuld8sux16	%f29,	%f26,	%f28
	tl	%xcc,	0x5
	ble,a	loop_670
	movpos	%icc,	%g1,	%g7
	fandnot1s	%f11,	%f6,	%f17
	sdiv	%i0,	0x144B,	%o7
loop_670:
	fmul8x16	%f2,	%f18,	%f30
	array8	%l4,	%g5,	%o5
	sir	0x1538
	ldx	[%l7 + 0x50],	%i3
	fmovdne	%icc,	%f22,	%f31
	lduh	[%l7 + 0x5C],	%o6
	udiv	%g4,	0x096F,	%i5
	movg	%icc,	%l3,	%g6
	tpos	%xcc,	0x1
	sethi	0x0269,	%i7
	ldsh	[%l7 + 0x4E],	%g3
	sir	0x03CE
	nop
	setx	0xB413826C06C531A1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xBE612BF40C089439,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fmuld	%f14,	%f26,	%f14
	mova	%xcc,	%l1,	%l5
	fzeros	%f10
	wr	%g0,	0xe3,	%asi
	stxa	%i4,	[%l7 + 0x78] %asi
	membar	#Sync
	ld	[%l7 + 0x0C],	%f13
	edge16n	%l0,	%o2,	%o0
	fxnors	%f13,	%f1,	%f25
	edge32ln	%l6,	%i2,	%o4
	nop
	fitod	%f6,	%f28
	fdtos	%f28,	%f3
	movrlz	%g2,	%i1,	%o3
	stb	%o1,	[%l7 + 0x7B]
	bne	%icc,	loop_671
	movvc	%xcc,	%l2,	%g1
	edge32	%i6,	%g7,	%o7
	nop
	setx	0xB060FD27,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
loop_671:
	tneg	%icc,	0x0
	and	%l4,	%i0,	%o5
	nop
	setx	0x18C75741FFC98D37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x28BDB89158655A87,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f12,	%f8
	tne	%xcc,	0x0
	umulcc	%g5,	%i3,	%g4
	nop
	setx	0xAAD8559FAD93D14F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x4796154244C8E0EF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f18,	%f10
	xor	%i5,	0x0913,	%l3
	movvc	%xcc,	%o6,	%g6
	movg	%xcc,	%i7,	%g3
	bcs,a	%icc,	loop_672
	fbo	%fcc1,	loop_673
	sub	%l5,	0x0FDD,	%l1
	mulscc	%l0,	%i4,	%o0
loop_672:
	nop
	setx	0x4D2D96FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x84BE9D8D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f5,	%f14
loop_673:
	nop
	setx	0x8BC95D5F4A0933CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f14
	sub	%o2,	0x1206,	%i2
	nop
	setx	0x90578B8C,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	movcs	%icc,	%o4,	%g2
	sub	%l6,	%o3,	%o1
	fones	%f24
	fbne	%fcc2,	loop_674
	popc	%i1,	%g1
	udivcc	%l2,	0x0C8E,	%g7
	fbue	%fcc1,	loop_675
loop_674:
	subcc	%i6,	0x04F5,	%l4
	srl	%i0,	0x03,	%o7
	tg	%icc,	0x1
loop_675:
	edge32l	%g5,	%i3,	%g4
	movgu	%xcc,	%o5,	%i5
	bneg,pt	%icc,	loop_676
	nop
	setx	loop_677,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%icc,	0x4
	subcc	%l3,	%g6,	%o6
loop_676:
	tsubcctv	%g3,	%l5,	%i7
loop_677:
	edge16	%l1,	%i4,	%l0
	fmovrdgz	%o2,	%f20,	%f24
	or	%i2,	%o4,	%o0
	mova	%xcc,	%l6,	%o3
	ba,pn	%xcc,	loop_678
	fmovdn	%icc,	%f1,	%f26
	mulscc	%o1,	%i1,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_678:
	movne	%icc,	%g2,	%l2
	sdiv	%g7,	0x1C4B,	%i6
	stw	%i0,	[%l7 + 0x6C]
	orn	%l4,	%o7,	%i3
	ldub	[%l7 + 0x1E],	%g4
	srl	%g5,	%i5,	%l3
	add	%g6,	%o5,	%o6
	xor	%l5,	0x0B7F,	%g3
	movge	%icc,	%i7,	%l1
	fmovsn	%xcc,	%f13,	%f21
	fcmpeq32	%f2,	%f28,	%i4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%o2,	%l0
	fbg	%fcc3,	loop_679
	andncc	%o4,	%o0,	%i2
	array32	%o3,	%l6,	%o1
	movpos	%xcc,	%i1,	%g2
loop_679:
	fblg	%fcc1,	loop_680
	fmovsvs	%icc,	%f8,	%f30
	fones	%f24
	tvc	%xcc,	0x3
loop_680:
	edge32ln	%l2,	%g1,	%i6
	nop
	setx	loop_681,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcc	loop_682
	nop
	setx	loop_683,	%l0,	%l1
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
loop_681:
	alignaddrl	%g7,	%i0,	%o7
loop_682:
	tge	%icc,	0x6
loop_683:
	edge8l	%l4,	%g4,	%g5
	xnorcc	%i5,	%l3,	%i3
	bne,pt	%xcc,	loop_684
	fmovda	%icc,	%f9,	%f25
	set	0x3C, %g7
	ldswa	[%l7 + %g7] 0x18,	%o5
loop_684:
	nop
	setx	loop_685,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	set	0x7C, %g6
	ldsw	[%l7 + %g6],	%g6
	fcmpgt16	%f14,	%f22,	%o6
	tgu	%xcc,	0x1
loop_685:
	edge32l	%l5,	%g3,	%i7
	tle	%icc,	0x1
	array32	%l1,	%i4,	%l0
	movpos	%xcc,	%o4,	%o0
	xnor	%i2,	0x0B36,	%o3
	tne	%xcc,	0x5
	brnz	%o2,	loop_686
	movrlz	%l6,	0x38D,	%i1
	edge8ln	%g2,	%l2,	%o1
	add	%g1,	%g7,	%i6
loop_686:
	add	%i0,	%o7,	%g4
	movne	%xcc,	%g5,	%i5
	xor	%l3,	%l4,	%i3
	subccc	%o5,	0x0F05,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l5,	0x0637,	%g3
	orn	%i7,	0x1835,	%o6
	sdiv	%l1,	0x1B87,	%l0
	andncc	%o4,	%i4,	%i2
	movrgez	%o0,	%o2,	%l6
	srl	%o3,	%i1,	%l2
	set	0x20, %o6
	swapa	[%l7 + %o6] 0x80,	%g2
	smul	%o1,	%g7,	%i6
	movneg	%icc,	%g1,	%o7
	fble	%fcc1,	loop_687
	movneg	%xcc,	%i0,	%g4
	stw	%i5,	[%l7 + 0x0C]
	edge32n	%l3,	%g5,	%i3
loop_687:
	popc	%l4,	%g6
	set	0x74, %o7
	sta	%f8,	[%l7 + %o7] 0x04
	tsubcctv	%l5,	%g3,	%i7
	bvc	loop_688
	fbuge,a	%fcc0,	loop_689
	fbe	%fcc1,	loop_690
	nop
	setx	0xCE9667F09658F8D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xD11D2027005F6A6F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f26,	%f24
loop_688:
	movrlez	%o6,	0x06B,	%o5
loop_689:
	fmovse	%icc,	%f30,	%f21
loop_690:
	andncc	%l1,	%l0,	%i4
	orncc	%i2,	0x11A7,	%o0
	tg	%icc,	0x3
	fmovrde	%o4,	%f16,	%f16
	fmovdge	%icc,	%f16,	%f13
	membar	0x03
	stbar
	xorcc	%o2,	0x0AAD,	%o3
	tge	%icc,	0x3
	fand	%f30,	%f24,	%f30
	nop
	setx loop_691, %l0, %l1
	jmpl %l1, %l6
	fpmerge	%f15,	%f12,	%f16
	nop
	setx	loop_692,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brlz,a	%l2,	loop_693
loop_691:
	nop
	setx	loop_694,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdpos	%icc,	%f26,	%f12
loop_692:
	fba	%fcc3,	loop_695
loop_693:
	sethi	0x10DA,	%g2
loop_694:
	fpack16	%f26,	%f5
	fnot2	%f2,	%f22
loop_695:
	fmovde	%icc,	%f29,	%f21
	fnor	%f12,	%f18,	%f6
	movrgez	%o1,	0x238,	%i1
	fmuld8ulx16	%f30,	%f25,	%f30
	fand	%f18,	%f6,	%f10
	tsubcctv	%i6,	%g7,	%o7
	call	loop_696
	movl	%icc,	%g1,	%g4
	bleu,pn	%icc,	loop_697
	fnor	%f28,	%f16,	%f4
loop_696:
	taddcctv	%i0,	%i5,	%l3
	fbe,a	%fcc0,	loop_698
loop_697:
	umulcc	%i3,	%l4,	%g5
	prefetch	[%l7 + 0x20],	 0x2
	tvs	%icc,	0x5
loop_698:
	tn	%icc,	0x7
	stx	%l5,	[%l7 + 0x48]
	movcc	%xcc,	%g6,	%g3
	movrgz	%o6,	%i7,	%l1
	bvc	loop_699
	fmovrdne	%o5,	%f2,	%f30
	movg	%icc,	%l0,	%i2
	bvs,a	%xcc,	loop_700
loop_699:
	tge	%icc,	0x1
	fmovrslez	%o0,	%f31,	%f5
	umulcc	%i4,	%o2,	%o3
loop_700:
	xor	%o4,	0x1EB2,	%l2
	fmovdgu	%icc,	%f3,	%f21
	alignaddr	%g2,	%l6,	%i1
	udiv	%o1,	0x170F,	%g7
	addccc	%i6,	%g1,	%g4
	tcc	%icc,	0x7
	fors	%f0,	%f27,	%f2
	nop
	fitod	%f0,	%f16
	fdtox	%f16,	%f12
	fxtod	%f12,	%f8
	movpos	%icc,	%o7,	%i0
	fbl,a	%fcc3,	loop_701
	udivx	%l3,	0x08CC,	%i5
	faligndata	%f16,	%f8,	%f4
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%l4
loop_701:
	addcc	%l5,	%g6,	%g5
	bne,a,pn	%xcc,	loop_702
	fmovdvc	%icc,	%f0,	%f17
	xorcc	%o6,	0x0794,	%i7
	fpackfix	%f22,	%f5
loop_702:
	nop
	set	0x51, %l0
	ldsba	[%l7 + %l0] 0x89,	%l1
	sub	%g3,	0x1123,	%l0
	tn	%xcc,	0x0
	edge8ln	%o5,	%o0,	%i2
	tsubcc	%i4,	%o2,	%o3
	smul	%l2,	0x1ABB,	%g2
	subc	%l6,	0x0EE7,	%o4
	std	%f18,	[%l7 + 0x18]
	set	0x40, %g5
	ldxa	[%l7 + %g5] 0x18,	%i1
	te	%icc,	0x0
	sra	%g7,	0x0D,	%i6
	taddcc	%o1,	%g4,	%o7
	and	%i0,	0x13B1,	%l3
	fxors	%f26,	%f18,	%f17
	fxors	%f12,	%f17,	%f7
	fmovrdgez	%i5,	%f16,	%f4
	array32	%g1,	%i3,	%l5
	fmovsle	%xcc,	%f31,	%f12
	edge16	%l4,	%g5,	%g6
	or	%o6,	0x127D,	%l1
	andn	%g3,	0x0AD1,	%l0
	fsrc2s	%f25,	%f12
	fnand	%f8,	%f6,	%f30
	edge32ln	%i7,	%o5,	%o0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%i4
	fpsub32	%f6,	%f0,	%f0
	fmovdpos	%icc,	%f0,	%f27
	fblg,a	%fcc1,	loop_703
	andcc	%o2,	0x030A,	%o3
	xnorcc	%g2,	0x1BFE,	%l6
	edge32	%l2,	%o4,	%i1
loop_703:
	fbu	%fcc2,	loop_704
	orn	%i6,	0x04BB,	%o1
	fexpand	%f20,	%f12
	fmul8x16al	%f7,	%f25,	%f26
loop_704:
	tge	%icc,	0x4
	fbug,a	%fcc2,	loop_705
	ldstub	[%l7 + 0x23],	%g4
	fblg	%fcc3,	loop_706
	mulx	%g7,	0x096E,	%i0
loop_705:
	fmovdleu	%xcc,	%f26,	%f20
	nop
	setx	0xB11F307C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x1E0C4D7E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f1,	%f15
loop_706:
	movleu	%icc,	%o7,	%i5
	udiv	%l3,	0x12DE,	%g1
	andn	%l5,	0x06A3,	%i3
	mova	%icc,	%l4,	%g5
	movgu	%icc,	%o6,	%g6
	fandnot2	%f8,	%f14,	%f2
	brgez	%l1,	loop_707
	bgu,a	%icc,	loop_708
	ld	[%l7 + 0x28],	%f5
	tsubcctv	%l0,	%i7,	%g3
loop_707:
	orcc	%o0,	%o5,	%i4
loop_708:
	subccc	%o2,	0x1450,	%i2
	faligndata	%f24,	%f30,	%f22
	fnegs	%f8,	%f21
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f20
	fmovsgu	%xcc,	%f6,	%f4
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x4C] %asi,	%g2
	andncc	%o3,	%l2,	%o4
	nop
	setx	0x71B47F6A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x0C8CE36F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f6,	%f12
	fmovrslez	%i1,	%f24,	%f3
	bneg,pn	%xcc,	loop_709
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f16
	fxtod	%f16,	%f0
	tne	%xcc,	0x1
	udivx	%l6,	0x0394,	%i6
loop_709:
	subcc	%g4,	0x0F1F,	%g7
	mova	%xcc,	%o1,	%o7
	fcmpne16	%f16,	%f26,	%i5
	fornot1	%f28,	%f22,	%f24
	fands	%f0,	%f11,	%f22
	fornot2	%f30,	%f6,	%f24
	fnands	%f11,	%f31,	%f12
	alignaddrl	%l3,	%g1,	%i0
	fnegs	%f19,	%f16
	fpackfix	%f14,	%f23
	tsubcc	%i3,	%l5,	%l4
	subccc	%o6,	0x0226,	%g6
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bgu,a	%icc,	loop_710
	move	%xcc,	%l1,	%g5
	ldd	[%l7 + 0x30],	%f4
	sethi	0x0887,	%l0
loop_710:
	andncc	%g3,	%o0,	%i7
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x74] %asi,	%o5
	brgz	%i4,	loop_711
	edge8ln	%i2,	%g2,	%o2
	movrgz	%o3,	0x1C5,	%l2
	edge32ln	%o4,	%l6,	%i6
loop_711:
	fsrc1s	%f11,	%f16
	fnegd	%f30,	%f6
	or	%g4,	%g7,	%o1
	stw	%o7,	[%l7 + 0x1C]
	tsubcctv	%i5,	%l3,	%g1
	tg	%icc,	0x6
	movrlz	%i1,	%i0,	%i3
	ldub	[%l7 + 0x62],	%l4
	tneg	%xcc,	0x7
	fmovdvs	%xcc,	%f25,	%f2
	movleu	%icc,	%o6,	%l5
	tge	%icc,	0x0
	movneg	%icc,	%g6,	%g5
	tleu	%xcc,	0x4
	sdivx	%l1,	0x0440,	%g3
	and	%l0,	0x0FBC,	%i7
	ta	%xcc,	0x6
	bn	%xcc,	loop_712
	lduw	[%l7 + 0x24],	%o5
	movrlz	%o0,	%i2,	%g2
	edge16ln	%i4,	%o2,	%l2
loop_712:
	movvs	%icc,	%o4,	%o3
	xorcc	%i6,	0x1F19,	%l6
	sth	%g4,	[%l7 + 0x2C]
	andn	%g7,	0x1EB5,	%o1
	te	%xcc,	0x3
	movcc	%xcc,	%i5,	%o7
	fbul,a	%fcc1,	loop_713
	fmovde	%xcc,	%f16,	%f28
	tvs	%xcc,	0x2
	fmovscc	%icc,	%f5,	%f3
loop_713:
	bg	loop_714
	array16	%g1,	%i1,	%l3
	umul	%i0,	%i3,	%o6
	alignaddrl	%l5,	%l4,	%g6
loop_714:
	tg	%icc,	0x6
	or	%g5,	0x1BE7,	%g3
	fmovsg	%xcc,	%f3,	%f6
	array32	%l0,	%l1,	%i7
	fmovspos	%xcc,	%f8,	%f4
	tvs	%icc,	0x0
	fcmpgt32	%f26,	%f20,	%o5
	alignaddrl	%o0,	%g2,	%i2
	tvc	%xcc,	0x3
	set	0x16, %i3
	lduha	[%l7 + %i3] 0x04,	%i4
	tvc	%xcc,	0x4
	fnor	%f20,	%f16,	%f14
	or	%l2,	0x14B4,	%o4
	bleu,a,pt	%icc,	loop_715
	sdiv	%o3,	0x19AF,	%o2
	nop
	fitos	%f7,	%f25
	fstox	%f25,	%f20
	fxtos	%f20,	%f11
	fmovdneg	%icc,	%f3,	%f10
loop_715:
	nop
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x108] %asi,	%l6
	tn	%xcc,	0x5
	fmuld8ulx16	%f3,	%f19,	%f0
	movre	%g4,	0x115,	%i6
	smul	%g7,	0x0F6B,	%o1
	bl,a,pt	%icc,	loop_716
	bvs,a,pn	%xcc,	loop_717
	fnors	%f18,	%f2,	%f1
	fcmple32	%f16,	%f26,	%i5
loop_716:
	bleu	loop_718
loop_717:
	fand	%f20,	%f28,	%f14
	tneg	%xcc,	0x2
	fmovrdne	%g1,	%f10,	%f30
loop_718:
	fble	%fcc1,	loop_719
	sllx	%o7,	%l3,	%i1
	popc	0x1406,	%i3
	movrlz	%i0,	%o6,	%l4
loop_719:
	movrne	%g6,	0x17B,	%g5
	fone	%f22
	edge8n	%g3,	%l0,	%l5
	stb	%l1,	[%l7 + 0x1F]
	nop
	setx	0x36C665F461B1E48F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x8BCA6FDB4337DA5A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f4,	%f2
	movre	%o5,	0x00A,	%o0
	brgez	%g2,	loop_720
	orcc	%i7,	%i2,	%l2
	edge16l	%i4,	%o3,	%o2
	fmovrslez	%o4,	%f25,	%f19
loop_720:
	nop
	fitos	%f12,	%f25
	fstod	%f25,	%f16
	fabss	%f16,	%f16
	bg	loop_721
	bpos,a,pt	%icc,	loop_722
	nop
	setx	loop_723,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x0C],	%l6
loop_721:
	fmuld8sux16	%f10,	%f4,	%f28
loop_722:
	movrgz	%g4,	0x083,	%g7
loop_723:
	fxor	%f2,	%f26,	%f10
	sub	%o1,	0x0734,	%i5
	nop
	setx	0xE762DFF8D78912CD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xB6163DE3B480D048,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f20,	%f24
	edge8	%i6,	%o7,	%g1
	fmovdcc	%icc,	%f13,	%f14
	set	0x18, %o4
	prefetcha	[%l7 + %o4] 0x80,	 0x2
	movrlz	%l3,	0x394,	%i0
	set	0x7C, %o3
	swapa	[%l7 + %o3] 0x04,	%o6
	nop
	setx	0x4E5683B180463D96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	wr	%g0,	0x81,	%asi
	stxa	%i3,	[%l7 + 0x10] %asi
	fbn,a	%fcc2,	loop_724
	movvs	%icc,	%l4,	%g6
	ta	%icc,	0x6
	nop
	fitos	%f25,	%f14
loop_724:
	orn	%g3,	%g5,	%l5
	faligndata	%f20,	%f6,	%f4
	sllx	%l0,	0x0F,	%l1
	alignaddrl	%o0,	%g2,	%i7
	movle	%icc,	%o5,	%i2
	mova	%xcc,	%l2,	%o3
	movrne	%i4,	0x2F7,	%o4
	and	%l6,	0x0A16,	%o2
	sra	%g7,	%g4,	%o1
	movvs	%xcc,	%i6,	%o7
	movle	%icc,	%i5,	%i1
	set	0x46, %o1
	stha	%g1,	[%l7 + %o1] 0xe2
	membar	#Sync
	tne	%xcc,	0x1
	fba	%fcc2,	loop_725
	fmovdg	%icc,	%f0,	%f10
	sethi	0x0BC0,	%l3
	sll	%i0,	0x1C,	%o6
loop_725:
	srax	%i3,	%l4,	%g3
	tpos	%xcc,	0x5
	udiv	%g6,	0x1ACB,	%g5
	edge8	%l0,	%l1,	%l5
	and	%o0,	0x09D7,	%g2
	fcmple32	%f0,	%f14,	%o5
	orcc	%i2,	%l2,	%i7
	smul	%i4,	0x10E7,	%o4
	brlz	%o3,	loop_726
	nop
	set	0x38, %g3
	stb	%l6,	[%l7 + %g3]
	fmovspos	%icc,	%f2,	%f24
	fnegs	%f27,	%f4
loop_726:
	edge16ln	%g7,	%o2,	%o1
	movrlz	%i6,	%g4,	%i5
	fsrc1s	%f16,	%f9
	fornot2	%f20,	%f14,	%f14
	membar	0x70
	fmovdleu	%xcc,	%f25,	%f12
	orn	%i1,	0x1592,	%o7
	brnz	%g1,	loop_727
	fmovdcs	%icc,	%f18,	%f10
	nop
	fitos	%f5,	%f22
	fstox	%f22,	%f14
	fand	%f2,	%f22,	%f28
loop_727:
	move	%icc,	%l3,	%o6
	sdivcc	%i3,	0x029E,	%l4
	tge	%xcc,	0x6
	lduh	[%l7 + 0x08],	%g3
	tsubcc	%i0,	0x1AA1,	%g6
	fmovrslz	%g5,	%f11,	%f27
	array16	%l1,	%l5,	%l0
	sllx	%g2,	%o0,	%o5
	fandnot1	%f0,	%f22,	%f6
	movleu	%xcc,	%i2,	%l2
	tn	%icc,	0x5
	fmovscc	%icc,	%f12,	%f19
	fbuge,a	%fcc0,	loop_728
	fmovscs	%icc,	%f26,	%f24
	sub	%i7,	0x13CB,	%o4
	brlez,a	%i4,	loop_729
loop_728:
	bne,a,pn	%xcc,	loop_730
	smulcc	%o3,	0x1191,	%l6
	fmovsgu	%icc,	%f18,	%f11
loop_729:
	array32	%g7,	%o1,	%o2
loop_730:
	sllx	%g4,	0x02,	%i6
	fbg	%fcc0,	loop_731
	faligndata	%f0,	%f2,	%f16
	mova	%icc,	%i1,	%o7
	edge8n	%g1,	%l3,	%i5
loop_731:
	nop
	setx loop_732, %l0, %l1
	jmpl %l1, %i3
	array16	%l4,	%g3,	%o6
	add	%i0,	0x1E9B,	%g6
	sdivcc	%g5,	0x0165,	%l1
loop_732:
	brz,a	%l0,	loop_733
	movleu	%xcc,	%l5,	%o0
	umulcc	%g2,	0x02ED,	%i2
	add	%l2,	0x1D30,	%i7
loop_733:
	movle	%xcc,	%o5,	%o4
	sdivx	%i4,	0x0CDE,	%l6
	bneg,pn	%icc,	loop_734
	ldsh	[%l7 + 0x3E],	%o3
	addcc	%o1,	%g7,	%g4
	fpadd32	%f22,	%f14,	%f14
loop_734:
	tne	%icc,	0x4
	orcc	%o2,	%i6,	%o7
	wr	%g0,	0x18,	%asi
	ldxa	[%l7 + 0x28] %asi,	%g1
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x5C] %asi,	%l3
	tvs	%xcc,	0x5
	movrlz	%i5,	0x264,	%i3
	fbo	%fcc2,	loop_735
	umul	%l4,	0x00D9,	%g3
	add	%o6,	%i1,	%g6
	mova	%xcc,	%i0,	%g5
loop_735:
	smul	%l0,	%l5,	%o0
	movrlz	%g2,	0x345,	%i2
	stb	%l1,	[%l7 + 0x09]
	xnor	%l2,	0x0A5D,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o4,	%i4,	%o5
	fbe,a	%fcc1,	loop_736
	fmovsge	%xcc,	%f25,	%f22
	membar	0x2C
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f8
	fxtod	%f8,	%f24
loop_736:
	tsubcctv	%o3,	0x1E91,	%l6
	movn	%xcc,	%g7,	%o1
	srl	%g4,	0x06,	%o2
	edge16l	%i6,	%o7,	%g1
	tcs	%icc,	0x4
	fmovdneg	%xcc,	%f7,	%f30
	ldub	[%l7 + 0x2B],	%i5
	stb	%i3,	[%l7 + 0x10]
	tn	%icc,	0x0
	array8	%l4,	%g3,	%l3
	fpack32	%f14,	%f0,	%f14
	bcs	loop_737
	fbg	%fcc3,	loop_738
	tne	%icc,	0x0
	movrlz	%o6,	%g6,	%i1
loop_737:
	te	%xcc,	0x0
loop_738:
	movl	%icc,	%g5,	%i0
	fba	%fcc1,	loop_739
	fmovrse	%l5,	%f28,	%f19
	smulcc	%l0,	0x020A,	%o0
	sdiv	%g2,	0x0D60,	%l1
loop_739:
	fors	%f1,	%f9,	%f1
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%f16
	movgu	%xcc,	%i2,	%i7
	umulcc	%l2,	%i4,	%o5
	fcmple32	%f22,	%f6,	%o3
	tge	%xcc,	0x3
	tleu	%icc,	0x2
	ta	%xcc,	0x7
	fsrc1s	%f17,	%f5
	mulscc	%l6,	%o4,	%o1
	tne	%icc,	0x0
	andn	%g4,	0x1A48,	%g7
	fornot2s	%f6,	%f5,	%f1
	movvs	%icc,	%i6,	%o2
	brgez	%o7,	loop_740
	swap	[%l7 + 0x10],	%i5
	edge32l	%g1,	%l4,	%g3
	brgez,a	%i3,	loop_741
loop_740:
	movre	%l3,	0x0FE,	%g6
	xor	%o6,	0x0DA8,	%g5
	ldd	[%l7 + 0x30],	%i0
loop_741:
	bvc,pt	%xcc,	loop_742
	sub	%l5,	0x1A9B,	%i0
	te	%xcc,	0x1
	movpos	%icc,	%o0,	%l0
loop_742:
	nop
	setx	0x317FCEFF806390B8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	movvc	%xcc,	%g2,	%i2
	bshuffle	%f14,	%f16,	%f12
	brlz,a	%l1,	loop_743
	tsubcc	%l2,	%i4,	%o5
	fzero	%f20
	fnot2	%f2,	%f12
loop_743:
	brgz,a	%i7,	loop_744
	srl	%l6,	%o4,	%o1
	fands	%f12,	%f27,	%f18
	and	%o3,	0x0028,	%g7
loop_744:
	movne	%icc,	%g4,	%i6
	bl,a	%icc,	loop_745
	movn	%icc,	%o2,	%i5
	tl	%xcc,	0x3
	sub	%g1,	%o7,	%l4
loop_745:
	fnands	%f9,	%f7,	%f21
	fcmpgt32	%f14,	%f18,	%i3
	ldstub	[%l7 + 0x1C],	%g3
	fbuge	%fcc0,	loop_746
	nop
	setx	0x9CB12699C2E87620,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xF3C5D8D9C70B8087,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f6,	%f24
	tvs	%xcc,	0x2
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x64] %asi,	%g6
loop_746:
	sdiv	%o6,	0x1A45,	%l3
	xorcc	%i1,	%l5,	%g5
	xor	%i0,	0x1859,	%l0
	movrgez	%o0,	%g2,	%i2
	tge	%icc,	0x3
	smulcc	%l1,	0x0436,	%i4
	movpos	%icc,	%l2,	%o5
	movvc	%icc,	%l6,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	be	loop_747
	ldd	[%l7 + 0x38],	%f12
	stw	%o1,	[%l7 + 0x54]
	std	%f0,	[%l7 + 0x40]
loop_747:
	nop
	set	0x4A, %i2
	ldstuba	[%l7 + %i2] 0x10,	%o3
	and	%o4,	0x01A8,	%g4
	flush	%l7 + 0x14
	sdivx	%i6,	0x0A75,	%o2
	andcc	%i5,	0x0E7E,	%g1
	edge8l	%g7,	%l4,	%i3
	bge	%xcc,	loop_748
	brgez	%g3,	loop_749
	tcc	%icc,	0x7
	edge16	%g6,	%o7,	%o6
loop_748:
	edge16n	%i1,	%l3,	%g5
loop_749:
	fabss	%f10,	%f21
	andn	%l5,	%l0,	%i0
	array8	%g2,	%o0,	%i2
	mova	%xcc,	%l1,	%i4
	ba	loop_750
	xor	%o5,	0x0439,	%l6
	andncc	%i7,	%l2,	%o1
	ldsw	[%l7 + 0x70],	%o4
loop_750:
	umul	%g4,	%i6,	%o3
	set	0x69, %o0
	lduba	[%l7 + %o0] 0x80,	%o2
	addccc	%i5,	%g7,	%l4
	bne,pn	%icc,	loop_751
	movvs	%xcc,	%i3,	%g3
	brz	%g1,	loop_752
	tneg	%icc,	0x2
loop_751:
	fone	%f12
	subcc	%g6,	%o6,	%o7
loop_752:
	xnorcc	%i1,	%l3,	%g5
	addccc	%l5,	0x1AA1,	%i0
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l0
	tsubcctv	%g2,	0x0FBE,	%o0
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x2A] %asi,	%l1
	subccc	%i4,	%o5,	%i2
	bcc	loop_753
	sllx	%l6,	%i7,	%l2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x5
loop_753:
	tle	%xcc,	0x5
	addc	%o4,	0x1857,	%o1
	edge32	%i6,	%g4,	%o3
	edge16n	%i5,	%g7,	%o2
	stbar
	tle	%xcc,	0x4
	sethi	0x17DB,	%l4
	fnand	%f28,	%f2,	%f16
	fmovscc	%icc,	%f8,	%f11
	nop
	setx	0x404DBCD9,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	brlez,a	%i3,	loop_754
	sdivcc	%g3,	0x0204,	%g1
	srax	%g6,	%o6,	%i1
	tsubcctv	%o7,	%g5,	%l5
loop_754:
	subc	%l3,	%l0,	%g2
	sdivx	%o0,	0x1240,	%l1
	movrlz	%i4,	%o5,	%i2
	movrgz	%i0,	0x1E8,	%l6
	stw	%l2,	[%l7 + 0x0C]
	addcc	%o4,	0x183D,	%o1
	movcc	%xcc,	%i6,	%i7
	for	%f28,	%f16,	%f2
	sdivcc	%o3,	0x16E4,	%g4
	subccc	%g7,	0x17EF,	%i5
	bpos,pt	%xcc,	loop_755
	movrgez	%l4,	%i3,	%o2
	fbo	%fcc1,	loop_756
	st	%f28,	[%l7 + 0x1C]
loop_755:
	tne	%icc,	0x4
	fmovscs	%xcc,	%f4,	%f23
loop_756:
	edge8l	%g1,	%g3,	%o6
	xnorcc	%g6,	0x07E7,	%o7
	edge16n	%g5,	%i1,	%l5
	nop
	set	0x78, %l3
	ldsb	[%l7 + %l3],	%l0
	fone	%f16
	bge,a,pt	%xcc,	loop_757
	tl	%xcc,	0x4
	fble,a	%fcc1,	loop_758
	udivx	%g2,	0x18AE,	%l3
loop_757:
	movre	%l1,	0x1EE,	%i4
	fcmpgt32	%f14,	%f2,	%o0
loop_758:
	fmovsvc	%xcc,	%f10,	%f23
	nop
	set	0x38, %i4
	ldx	[%l7 + %i4],	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%o5,	%i0
	edge32	%l2,	%o4,	%l6
	movl	%icc,	%o1,	%i7
	or	%i6,	%g4,	%g7
	taddcctv	%o3,	%i5,	%i3
	movge	%xcc,	%l4,	%o2
	fmovdl	%xcc,	%f1,	%f21
	edge16l	%g1,	%o6,	%g3
	nop
	fitod	%f11,	%f10
	or	%g6,	%o7,	%g5
	movge	%icc,	%l5,	%l0
	fbul	%fcc0,	loop_759
	fbug,a	%fcc1,	loop_760
	movcc	%xcc,	%g2,	%l3
	ldsh	[%l7 + 0x2E],	%i1
loop_759:
	fpadd32s	%f22,	%f12,	%f29
loop_760:
	movl	%xcc,	%l1,	%i4
	fbuge,a	%fcc3,	loop_761
	subccc	%i2,	%o5,	%o0
	movrgez	%l2,	%o4,	%l6
	addcc	%o1,	%i0,	%i6
loop_761:
	fba,a	%fcc0,	loop_762
	movrgez	%g4,	0x24B,	%g7
	movrgez	%i7,	%i5,	%i3
	movrlez	%l4,	0x1BA,	%o2
loop_762:
	brlz	%o3,	loop_763
	alignaddrl	%o6,	%g3,	%g6
	sethi	0x0CA4,	%o7
	sdiv	%g1,	0x02CF,	%g5
loop_763:
	smulcc	%l0,	%g2,	%l5
	fbl	%fcc1,	loop_764
	movcc	%icc,	%i1,	%l1
	tg	%xcc,	0x4
	fmovrdlez	%l3,	%f28,	%f18
loop_764:
	ld	[%l7 + 0x2C],	%f3
	stb	%i2,	[%l7 + 0x44]
	tneg	%icc,	0x6
	edge8ln	%o5,	%i4,	%l2
	nop
	setx	0xC049C247,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	tpos	%xcc,	0x7
	sub	%o4,	%o0,	%l6
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f18
	fxtos	%f18,	%f2
	fxor	%f4,	%f4,	%f30
	fcmpgt32	%f12,	%f2,	%i0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x40] %asi,	%o1
	movge	%icc,	%i6,	%g4
	lduw	[%l7 + 0x30],	%g7
	tl	%icc,	0x2
	or	%i5,	%i7,	%l4
	tvs	%xcc,	0x3
	movle	%icc,	%o2,	%o3
	movrgez	%o6,	0x135,	%i3
	ba,pt	%xcc,	loop_765
	te	%xcc,	0x2
	movgu	%icc,	%g3,	%o7
	addccc	%g1,	0x09D1,	%g6
loop_765:
	subcc	%l0,	%g2,	%g5
	te	%icc,	0x3
	wr	%g0,	0x10,	%asi
	sta	%f28,	[%l7 + 0x64] %asi
	fmovdl	%xcc,	%f9,	%f3
	fmovdle	%icc,	%f12,	%f2
	subc	%i1,	%l5,	%l3
	set	0x24, %g2
	swapa	[%l7 + %g2] 0x0c,	%l1
	bl,a	loop_766
	tge	%xcc,	0x6
	fbu	%fcc2,	loop_767
	pdist	%f4,	%f28,	%f8
loop_766:
	udivx	%o5,	0x0868,	%i2
	membar	0x60
loop_767:
	movneg	%icc,	%i4,	%l2
	prefetch	[%l7 + 0x54],	 0x1
	subccc	%o0,	0x0B73,	%l6
	for	%f0,	%f28,	%f2
	addcc	%i0,	0x1F56,	%o4
	fpmerge	%f27,	%f29,	%f30
	and	%i6,	%o1,	%g4
	edge8l	%i5,	%i7,	%g7
	xorcc	%l4,	%o3,	%o2
	srax	%o6,	%g3,	%o7
	tg	%xcc,	0x6
	ldstub	[%l7 + 0x0B],	%i3
	nop
	setx	loop_768,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mulx	%g6,	%l0,	%g1
	fcmpeq16	%f12,	%f22,	%g2
	taddcctv	%g5,	0x11F0,	%l5
loop_768:
	fexpand	%f4,	%f14
	fmuld8sux16	%f7,	%f19,	%f0
	sdivx	%i1,	0x027C,	%l3
	tle	%icc,	0x4
	orn	%l1,	%o5,	%i2
	movneg	%xcc,	%l2,	%o0
	fpackfix	%f24,	%f2
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	fsrc2	%f12,	%f24
	subcc	%l6,	0x1646,	%i0
	sdiv	%i4,	0x0930,	%i6
	tle	%icc,	0x2
	taddcc	%o4,	0x1CAF,	%o1
	bcs,pn	%xcc,	loop_769
	xorcc	%i5,	%g4,	%i7
	bg,a	%xcc,	loop_770
	ta	%icc,	0x7
loop_769:
	ba,a,pt	%icc,	loop_771
	ld	[%l7 + 0x34],	%f14
loop_770:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x50] %asi
loop_771:
	ldub	[%l7 + 0x16],	%l4
	movrne	%o3,	0x25D,	%g7
	nop
	setx	0x722A3FBC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x6E52E08B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f16,	%f26
	movrlz	%o6,	%g3,	%o7
	nop
	set	0x42, %i0
	sth	%i3,	[%l7 + %i0]
	fcmpgt32	%f22,	%f22,	%g6
	for	%f4,	%f10,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x0E],	%o2
	tg	%icc,	0x7
	udiv	%l0,	0x10AC,	%g1
	fmul8x16au	%f23,	%f6,	%f14
	edge16ln	%g2,	%l5,	%g5
	movcc	%icc,	%l3,	%l1
	fcmpne16	%f2,	%f20,	%o5
	taddcctv	%i1,	0x1ACE,	%i2
	fmovdvc	%xcc,	%f23,	%f10
	xor	%o0,	%l6,	%l2
	sll	%i4,	%i0,	%i6
	prefetch	[%l7 + 0x34],	 0x1
	andncc	%o1,	%i5,	%o4
	brgez	%i7,	loop_772
	smul	%l4,	%o3,	%g7
	nop
	setx	0x344520CCD3DCC376,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x28D9E2E9DBDA5142,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f12,	%f2
	array16	%o6,	%g4,	%o7
loop_772:
	udivx	%i3,	0x1CFA,	%g6
	nop
	setx	0x17BDE547248C0714,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x14C38CF20C503129,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f4,	%f4
	addcc	%g3,	%l0,	%o2
	movvc	%icc,	%g1,	%g2
	edge16l	%g5,	%l5,	%l3
	bleu,a,pt	%icc,	loop_773
	edge8ln	%l1,	%i1,	%o5
	fbne,a	%fcc0,	loop_774
	subccc	%i2,	0x06EA,	%l6
loop_773:
	fcmple32	%f28,	%f14,	%o0
	movcs	%icc,	%i4,	%l2
loop_774:
	stb	%i0,	[%l7 + 0x3E]
	bne,a	loop_775
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcs	%icc,	0x0
	set	0x18, %i1
	lduba	[%l7 + %i1] 0x0c,	%o1
loop_775:
	xor	%i6,	0x0A38,	%i5
	sllx	%i7,	0x15,	%o4
	tneg	%icc,	0x6
	tl	%icc,	0x3
	popc	0x1406,	%o3
	movrgz	%l4,	0x399,	%g7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] %asi,	%o6,	%g4
	fbul	%fcc1,	loop_776
	movrgez	%o7,	%i3,	%g6
	taddcctv	%g3,	0x0D64,	%l0
	mulx	%g1,	%g2,	%g5
loop_776:
	or	%o2,	%l3,	%l1
	and	%l5,	%i1,	%o5
	fpadd16	%f18,	%f28,	%f28
	movrgez	%i2,	%l6,	%o0
	sir	0x0132
	taddcctv	%i4,	%i0,	%l2
	tneg	%icc,	0x1
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x0
	srlx	%i5,	%i7,	%o4
	fblg	%fcc3,	loop_777
	fmovdgu	%icc,	%f11,	%f31
	wr	%g0,	0x80,	%asi
	sta	%f12,	[%l7 + 0x68] %asi
loop_777:
	nop
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x10] %asi,	%o3
	mulscc	%l4,	0x11F7,	%o1
	movcs	%icc,	%o6,	%g7
	sdivx	%g4,	0x0713,	%i3
	movge	%icc,	%o7,	%g6
	movvs	%icc,	%g3,	%l0
	brnz,a	%g1,	loop_778
	fand	%f14,	%f28,	%f18
	fabsd	%f30,	%f0
	set	0x20, %l5
	ldda	[%l7 + %l5] 0x24,	%g4
loop_778:
	edge8	%g2,	%l3,	%o2
	edge16	%l1,	%l5,	%i1
	movge	%icc,	%o5,	%i2
	tsubcctv	%l6,	%i4,	%o0
	fpsub16	%f6,	%f20,	%f20
	fmovsneg	%icc,	%f7,	%f28
	mulscc	%i0,	0x000B,	%l2
	movgu	%xcc,	%i6,	%i7
	fba	%fcc1,	loop_779
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i5
	casxa	[%l6] %asi,	%i5,	%o4
loop_779:
	array32	%o3,	%l4,	%o1
	nop
	setx loop_780, %l0, %l1
	jmpl %l1, %g7
	tpos	%icc,	0x5
	be,a	loop_781
	fone	%f18
loop_780:
	fmovrdgez	%o6,	%f30,	%f8
	fbuge	%fcc2,	loop_782
loop_781:
	fnot1	%f26,	%f14
	tleu	%xcc,	0x1
	sdivx	%i3,	0x07F4,	%o7
loop_782:
	andncc	%g6,	%g3,	%l0
	edge32ln	%g4,	%g1,	%g5
	fbne,a	%fcc3,	loop_783
	fbne,a	%fcc2,	loop_784
	smul	%g2,	%l3,	%l1
	sra	%o2,	0x13,	%l5
loop_783:
	nop
	setx loop_785, %l0, %l1
	jmpl %l1, %i1
loop_784:
	sir	0x1AF3
	stx	%o5,	[%l7 + 0x40]
	sethi	0x1DB1,	%i2
loop_785:
	nop
	setx loop_786, %l0, %l1
	jmpl %l1, %i4
	tleu	%xcc,	0x1
	bn,pt	%icc,	loop_787
	tneg	%icc,	0x2
loop_786:
	fmovsne	%icc,	%f27,	%f14
	array16	%l6,	%o0,	%i0
loop_787:
	nop
	setx	0x707D41C8,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	movrgez	%i6,	%i7,	%i5
	movrgez	%l2,	%o4,	%l4
	edge16	%o3,	%g7,	%o6
	nop
	setx	loop_788,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movleu	%xcc,	%i3,	%o1
	nop
	setx	0x3A6D87C10B6FBFC9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f4
	fsrc1s	%f12,	%f10
loop_788:
	bgu,pn	%xcc,	loop_789
	tge	%icc,	0x5
	tle	%xcc,	0x2
	stbar
loop_789:
	tcc	%icc,	0x4
	tneg	%icc,	0x2
	movrlz	%o7,	0x114,	%g6
	movne	%xcc,	%g3,	%g4
	ldd	[%l7 + 0x08],	%l0
	popc	0x126E,	%g1
	edge16	%g5,	%g2,	%l1
	ble,a	%xcc,	loop_790
	fmovsvs	%icc,	%f18,	%f29
	edge16n	%o2,	%l5,	%l3
	xnor	%i1,	%i2,	%o5
loop_790:
	movn	%xcc,	%l6,	%o0
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x2A] %asi,	%i4
	smul	%i0,	%i6,	%i5
	xor	%i7,	%o4,	%l2
	tl	%xcc,	0x0
	tn	%xcc,	0x7
	srax	%l4,	%o3,	%g7
	movl	%icc,	%o6,	%i3
	fmovsleu	%icc,	%f10,	%f22
	stb	%o1,	[%l7 + 0x7E]
	movvs	%icc,	%g6,	%g3
	edge16n	%o7,	%g4,	%g1
	nop
	setx	0xD0513420,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	sllx	%g5,	0x17,	%g2
	edge32l	%l1,	%o2,	%l5
	fmovrsgz	%l0,	%f14,	%f16
	srlx	%i1,	%i2,	%l3
	addc	%o5,	%o0,	%i4
	tl	%icc,	0x4
	edge32n	%i0,	%i6,	%i5
	array16	%l6,	%i7,	%o4
	sub	%l4,	0x0C34,	%l2
	edge8	%g7,	%o6,	%o3
	movn	%xcc,	%o1,	%i3
	movrlz	%g3,	0x375,	%g6
	fbge	%fcc0,	loop_791
	movre	%o7,	%g1,	%g5
	wr	%g0,	0x27,	%asi
	stha	%g2,	[%l7 + 0x48] %asi
	membar	#Sync
loop_791:
	edge16l	%g4,	%o2,	%l5
	lduw	[%l7 + 0x48],	%l0
	fandnot2s	%f17,	%f6,	%f30
	nop
	fitod	%f6,	%f28
	fdtoi	%f28,	%f17
	alignaddr	%l1,	%i2,	%i1
	edge16	%l3,	%o0,	%i4
	fnands	%f16,	%f12,	%f28
	fnot2s	%f12,	%f12
	fpack32	%f30,	%f10,	%f28
	smul	%o5,	%i6,	%i0
	bgu	loop_792
	tgu	%xcc,	0x3
	swap	[%l7 + 0x0C],	%i5
	edge32ln	%l6,	%o4,	%i7
loop_792:
	sra	%l2,	%l4,	%o6
	sra	%o3,	%g7,	%o1
	flush	%l7 + 0x6C
	mulx	%i3,	0x0BF2,	%g6
	fbuge	%fcc3,	loop_793
	edge8ln	%g3,	%o7,	%g1
	stbar
	edge32n	%g2,	%g4,	%o2
loop_793:
	edge32n	%l5,	%g5,	%l0
	fbule,a	%fcc2,	loop_794
	xnor	%l1,	0x1E90,	%i1
	sra	%i2,	0x1E,	%o0
	bgu,a	%xcc,	loop_795
loop_794:
	nop
	setx	0xF9568BFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xE3117350,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f8,	%f0
	edge32ln	%l3,	%i4,	%i6
	edge16n	%o5,	%i5,	%i0
loop_795:
	andcc	%o4,	%l6,	%l2
	membar	0x72
	tgu	%icc,	0x0
	fmul8ulx16	%f26,	%f24,	%f30
	xorcc	%l4,	0x0B24,	%i7
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%o6
	taddcc	%o3,	0x1304,	%o1
	fmovsvs	%icc,	%f6,	%f20
	fnot2s	%f6,	%f3
	movrgez	%g7,	%g6,	%g3
	bleu	%xcc,	loop_796
	edge8l	%o7,	%i3,	%g2
	xorcc	%g1,	0x0B2C,	%o2
	fmul8x16	%f15,	%f16,	%f12
loop_796:
	edge16	%l5,	%g4,	%l0
	alignaddr	%g5,	%i1,	%i2
	movvc	%xcc,	%o0,	%l1
	fmovda	%icc,	%f11,	%f17
	fmovrdgz	%l3,	%f8,	%f18
	movrne	%i6,	%o5,	%i5
	set	0x28, %l4
	stha	%i0,	[%l7 + %l4] 0x22
	membar	#Sync
	bl,a,pn	%icc,	loop_797
	andncc	%i4,	%l6,	%o4
	addccc	%l2,	0x1BD5,	%i7
	nop
	setx	loop_798,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_797:
	movrgz	%o6,	%o3,	%o1
	fmovda	%icc,	%f20,	%f12
	fcmpgt32	%f8,	%f30,	%l4
loop_798:
	fmovsleu	%xcc,	%f21,	%f13
	sdivcc	%g6,	0x099D,	%g3
	addc	%o7,	%i3,	%g2
	tn	%xcc,	0x6
	set	0x68, %o5
	prefetcha	[%l7 + %o5] 0x19,	 0x0
	edge8l	%g7,	%l5,	%o2
	edge32n	%l0,	%g5,	%i1
	set	0x10, %g1
	lda	[%l7 + %g1] 0x19,	%f31
	move	%xcc,	%g4,	%i2
	set	0x08, %o2
	prefetcha	[%l7 + %o2] 0x89,	 0x0
	movre	%o0,	%i6,	%o5
	fsrc2s	%f17,	%f18
	fors	%f25,	%f3,	%f8
	te	%icc,	0x1
	sllx	%l3,	%i0,	%i5
	array16	%i4,	%o4,	%l6
	movvs	%icc,	%i7,	%l2
	srl	%o3,	0x0E,	%o6
	srlx	%l4,	%g6,	%g3
	edge32n	%o1,	%i3,	%o7
	set	0x38, %i5
	stha	%g1,	[%l7 + %i5] 0x81
	stx	%g7,	[%l7 + 0x30]
	fmuld8ulx16	%f19,	%f10,	%f28
	sll	%l5,	%g2,	%l0
	ba,pt	%icc,	loop_799
	ba	%icc,	loop_800
	subccc	%g5,	0x137B,	%i1
	fbu	%fcc1,	loop_801
loop_799:
	move	%icc,	%g4,	%o2
loop_800:
	orncc	%l1,	%o0,	%i2
	ldd	[%l7 + 0x40],	%f14
loop_801:
	fbe,a	%fcc2,	loop_802
	fmovrsne	%i6,	%f10,	%f2
	andcc	%o5,	0x0E30,	%l3
	movgu	%icc,	%i0,	%i5
loop_802:
	nop
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x7B] %asi,	%i4
	edge16n	%l6,	%i7,	%l2
	fandnot1s	%f26,	%f27,	%f23
	nop
	setx	0x74EEF63091A632E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x7BB3847B25344210,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	faddd	%f26,	%f26,	%f30
	fsrc1s	%f13,	%f10
	sdivx	%o3,	0x099A,	%o6
	sdivx	%l4,	0x0E1D,	%g6
	edge16n	%o4,	%o1,	%i3
	sdivcc	%g3,	0x1723,	%g1
	sdiv	%o7,	0x06D9,	%l5
	fmovdvc	%xcc,	%f8,	%f5
	tcc	%icc,	0x0
	taddcctv	%g7,	0x1A19,	%l0
	tg	%icc,	0x6
	addcc	%g5,	%i1,	%g4
	edge8l	%g2,	%l1,	%o2
	tgu	%icc,	0x0
	movvc	%xcc,	%o0,	%i2
	or	%o5,	%i6,	%l3
	fmovsvs	%icc,	%f22,	%f8
	srax	%i5,	0x1E,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i0,	%l6,	%i7
	movvs	%xcc,	%l2,	%o3
	fmovrslz	%l4,	%f2,	%f20
	taddcc	%o6,	%g6,	%o4
	fmovdcs	%xcc,	%f19,	%f4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o1
	subccc	%g3,	%o7,	%g1
	andncc	%g7,	%l5,	%g5
	edge32n	%i1,	%l0,	%g2
	umulcc	%g4,	%l1,	%o2
	popc	%o0,	%o5
	ble,pt	%xcc,	loop_803
	nop
	set	0x48, %l1
	lduw	[%l7 + %l1],	%i6
	add	%l3,	%i5,	%i4
	movpos	%icc,	%i0,	%l6
loop_803:
	ba,a,pt	%icc,	loop_804
	fnands	%f3,	%f18,	%f1
	movg	%icc,	%i2,	%i7
	fpsub16	%f16,	%f8,	%f28
loop_804:
	ldstub	[%l7 + 0x13],	%o3
	subc	%l2,	%o6,	%g6
	or	%l4,	%i3,	%o4
	movrgez	%g3,	0x1F7,	%o1
	fba,a	%fcc3,	loop_805
	movn	%xcc,	%o7,	%g7
	array8	%g1,	%g5,	%i1
	fpsub32	%f6,	%f26,	%f4
loop_805:
	sll	%l5,	%g2,	%l0
	fzero	%f18
	sdivx	%g4,	0x1E1A,	%l1
	tpos	%xcc,	0x1
	movvs	%xcc,	%o2,	%o5
	tvc	%xcc,	0x4
	orncc	%o0,	0x0297,	%l3
	tn	%icc,	0x2
	brgez,a	%i6,	loop_806
	srl	%i5,	%i0,	%l6
	array8	%i2,	%i7,	%i4
	smulcc	%o3,	%o6,	%g6
loop_806:
	nop
	set	0x78, %g4
	lda	[%l7 + %g4] 0x15,	%f0
	fnot1	%f22,	%f14
	wr	%g0,	0x11,	%asi
	stba	%l4,	[%l7 + 0x42] %asi
	fmovrdlez	%i3,	%f0,	%f24
	fbuge	%fcc3,	loop_807
	tcs	%icc,	0x3
	movre	%o4,	0x305,	%l2
	wr	%g0,	0x89,	%asi
	stba	%g3,	[%l7 + 0x6D] %asi
loop_807:
	mulscc	%o1,	0x1CB7,	%o7
	edge8n	%g1,	%g7,	%g5
	movrgez	%i1,	%g2,	%l0
	bg,a	loop_808
	movleu	%icc,	%l5,	%l1
	std	%f8,	[%l7 + 0x18]
	set	0x20, %l2
	ldsba	[%l7 + %l2] 0x0c,	%g4
loop_808:
	fcmpne32	%f4,	%f30,	%o2
	set	0x58, %i7
	stwa	%o0,	[%l7 + %i7] 0x2b
	membar	#Sync
	orcc	%l3,	0x1172,	%i6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%i5
	bl,pn	%xcc,	loop_809
	smul	%o5,	0x1ED3,	%i0
	brlez,a	%i2,	loop_810
	umul	%l6,	0x0B96,	%i4
loop_809:
	sdiv	%o3,	0x18E0,	%i7
	fones	%f13
loop_810:
	alignaddr	%g6,	%o6,	%l4
	fbg	%fcc2,	loop_811
	bne,a,pt	%xcc,	loop_812
	fxnor	%f6,	%f20,	%f20
	edge32ln	%i3,	%o4,	%l2
loop_811:
	movcc	%xcc,	%o1,	%g3
loop_812:
	array32	%o7,	%g1,	%g7
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x68] %asi,	%g5
	movgu	%xcc,	%i1,	%g2
	fxors	%f11,	%f13,	%f11
	fpsub16s	%f11,	%f6,	%f29
	bn,pn	%xcc,	loop_813
	add	%l0,	0x1694,	%l5
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x44] %asi,	%l1
loop_813:
	nop
	setx	loop_814,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	prefetch	[%l7 + 0x6C],	 0x2
	fmovrslez	%g4,	%f22,	%f28
	movne	%xcc,	%o0,	%l3
loop_814:
	movrlez	%i6,	%i5,	%o5
	brgez	%o2,	loop_815
	fmovsn	%xcc,	%f10,	%f13
	bn,a	loop_816
	fpsub16s	%f6,	%f0,	%f18
loop_815:
	orcc	%i2,	%i0,	%l6
	umul	%o3,	%i7,	%i4
loop_816:
	movrgez	%o6,	0x0D8,	%l4
	orcc	%i3,	0x1057,	%g6
	movrlez	%o4,	%o1,	%g3
	nop
	setx	0xE624C7DBF032D9EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f2
	tcs	%xcc,	0x1
	ldub	[%l7 + 0x1C],	%o7
	xnorcc	%g1,	0x0953,	%l2
	fmovrde	%g7,	%f12,	%f6
	fsrc1s	%f18,	%f14
	bshuffle	%f28,	%f10,	%f30
	membar	0x35
	fbul	%fcc2,	loop_817
	tvc	%xcc,	0x4
	movleu	%icc,	%g5,	%g2
	fmovd	%f4,	%f26
loop_817:
	andcc	%l0,	%l5,	%l1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x65] %asi,	%i1
	orcc	%g4,	%o0,	%i6
	fnot1	%f26,	%f12
	fnegs	%f5,	%f20
	sir	0x18D5
	array32	%i5,	%l3,	%o5
	set	0x60, %g7
	sta	%f13,	[%l7 + %g7] 0x10
	ldx	[%l7 + 0x70],	%i2
	orn	%i0,	0x117E,	%l6
	fpadd32	%f8,	%f20,	%f6
	fmovrde	%o3,	%f18,	%f16
	alignaddrl	%i7,	%i4,	%o2
	fblg,a	%fcc2,	loop_818
	nop
	setx	loop_819,	%l0,	%l1
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
	fpsub16	%f0,	%f16,	%f8
loop_818:
	nop
	setx	0xAC25C45D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	fsqrts	%f15,	%f5
loop_819:
	movre	%o6,	%l4,	%i3
	brz	%g6,	loop_820
	ldsh	[%l7 + 0x30],	%o4
	fnot2s	%f22,	%f0
	fnegd	%f8,	%f20
loop_820:
	edge32l	%g3,	%o1,	%g1
	edge8n	%l2,	%o7,	%g5
	ldsb	[%l7 + 0x6C],	%g7
	array16	%l0,	%l5,	%l1
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x1A] %asi,	%i1
	ldub	[%l7 + 0x7C],	%g2
	ldsw	[%l7 + 0x08],	%o0
	ble,a	%xcc,	loop_821
	tcc	%xcc,	0x0
	fbug	%fcc0,	loop_822
	xnorcc	%i6,	0x0F2F,	%g4
loop_821:
	movrgz	%l3,	0x080,	%i5
	taddcctv	%i2,	0x1DC5,	%i0
loop_822:
	swap	[%l7 + 0x1C],	%l6
	orcc	%o5,	%o3,	%i7
	tg	%xcc,	0x1
	bne,pn	%icc,	loop_823
	edge32n	%i4,	%o6,	%l4
	or	%o2,	0x1F1A,	%g6
	tpos	%xcc,	0x6
loop_823:
	bneg,a	%xcc,	loop_824
	fnands	%f2,	%f14,	%f22
	addcc	%i3,	%g3,	%o4
	fmovrsne	%o1,	%f9,	%f18
loop_824:
	movneg	%xcc,	%l2,	%g1
	nop
	setx	loop_825,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%o7,	0x10ED,	%g5
	movvc	%xcc,	%l0,	%g7
	fbn	%fcc1,	loop_826
loop_825:
	fornot2	%f24,	%f8,	%f4
	bg,a,pt	%xcc,	loop_827
	smulcc	%l1,	%i1,	%g2
loop_826:
	sdivcc	%o0,	0x089D,	%i6
	fpsub32	%f30,	%f18,	%f12
loop_827:
	sdivx	%g4,	0x10EA,	%l5
	fsrc2	%f24,	%f28
	fnands	%f3,	%f28,	%f20
	movcc	%icc,	%l3,	%i5
	orcc	%i0,	%i2,	%o5
	bgu	%xcc,	loop_828
	and	%l6,	%o3,	%i7
	tle	%icc,	0x1
	edge8n	%i4,	%l4,	%o2
loop_828:
	fmovrslz	%g6,	%f14,	%f0
	ldd	[%l7 + 0x20],	%o6
	movrne	%g3,	0x375,	%o4
	taddcc	%o1,	0x18B6,	%i3
	tl	%icc,	0x5
	sir	0x0048
	nop
	setx	0x4B3BFCC5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f4
	brz,a	%l2,	loop_829
	nop
	setx	loop_830,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xnor	%o7,	0x0922,	%g1
	sir	0x0999
loop_829:
	nop
	setx	0xB5B8A26C5072247D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_830:
	call	loop_831
	fbge	%fcc0,	loop_832
	srlx	%l0,	0x0E,	%g7
	bshuffle	%f22,	%f28,	%f8
loop_831:
	bge,pn	%xcc,	loop_833
loop_832:
	fornot1	%f24,	%f0,	%f26
	alignaddr	%l1,	%i1,	%g2
	sdivx	%g5,	0x0865,	%i6
loop_833:
	fnot1s	%f17,	%f4
	fmuld8sux16	%f19,	%f29,	%f26
	fnand	%f24,	%f26,	%f30
	alignaddr	%g4,	%o0,	%l5
	fmovrslz	%i5,	%f12,	%f28
	addc	%i0,	0x1510,	%l3
	tcs	%icc,	0x7
	edge32n	%o5,	%i2,	%l6
	tleu	%icc,	0x4
	nop
	fitod	%f26,	%f24
	edge8n	%i7,	%i4,	%o3
	nop
	setx	0x59167C2484701561,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f20
	addccc	%o2,	0x049E,	%g6
	ldd	[%l7 + 0x48],	%f10
	fbug,a	%fcc2,	loop_834
	brgez	%o6,	loop_835
	movrgz	%l4,	0x3A8,	%o4
	tge	%icc,	0x3
loop_834:
	tneg	%icc,	0x0
loop_835:
	nop
	fitod	%f14,	%f24
	fmovse	%icc,	%f22,	%f14
	movg	%icc,	%o1,	%g3
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i3
	te	%icc,	0x2
	edge8	%l2,	%g1,	%o7
	lduw	[%l7 + 0x1C],	%l0
	fnot2s	%f0,	%f15
	nop
	setx loop_836, %l0, %l1
	jmpl %l1, %l1
	sll	%g7,	%i1,	%g5
	set	0x38, %i6
	lduwa	[%l7 + %i6] 0x19,	%g2
loop_836:
	fbug,a	%fcc2,	loop_837
	srl	%g4,	%i6,	%l5
	xnor	%i5,	%o0,	%i0
	fbo	%fcc3,	loop_838
loop_837:
	fbn,a	%fcc3,	loop_839
	bvc	loop_840
	alignaddrl	%l3,	%o5,	%i2
loop_838:
	movcs	%icc,	%i7,	%i4
loop_839:
	nop
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x42] %asi,	%l6
loop_840:
	edge16ln	%o2,	%g6,	%o3
	call	loop_841
	nop
	setx	0x5CBE3214,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f25
	ba,a,pn	%icc,	loop_842
	fmovrsgez	%o6,	%f11,	%f10
loop_841:
	fbo	%fcc0,	loop_843
	stx	%l4,	[%l7 + 0x50]
loop_842:
	taddcc	%o1,	0x0854,	%g3
	tleu	%xcc,	0x6
loop_843:
	faligndata	%f28,	%f6,	%f14
	taddcc	%o4,	0x13ED,	%l2
	fbu,a	%fcc2,	loop_844
	brnz	%g1,	loop_845
	tg	%icc,	0x3
	fble,a	%fcc0,	loop_846
loop_844:
	or	%o7,	0x10F9,	%l0
loop_845:
	fmovrde	%i3,	%f16,	%f6
	alignaddr	%g7,	%l1,	%g5
loop_846:
	brgez,a	%i1,	loop_847
	ldd	[%l7 + 0x30],	%g4
	set	0x56, %o6
	stha	%g2,	[%l7 + %o6] 0x0c
loop_847:
	fpack32	%f22,	%f8,	%f20
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%i6
	xorcc	%i5,	0x1903,	%o0
	movrne	%i0,	0x2E2,	%l3
	and	%l5,	0x09A6,	%i2
	ldstub	[%l7 + 0x6B],	%o5
	subc	%i7,	%i4,	%o2
	move	%icc,	%g6,	%l6
	bpos,a,pt	%xcc,	loop_848
	fbue,a	%fcc0,	loop_849
	sra	%o6,	%l4,	%o3
	ta	%xcc,	0x1
loop_848:
	brnz,a	%o1,	loop_850
loop_849:
	fcmpeq16	%f26,	%f20,	%g3
	umulcc	%l2,	0x1B6F,	%o4
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x3
loop_850:
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f24
	fxtod	%f24,	%f22
	tcc	%icc,	0x1
	tle	%icc,	0x3
	fone	%f16
	movcc	%xcc,	%g1,	%l0
	orcc	%g7,	0x14A1,	%l1
	nop
	setx	0x33D2DA35006CCF9C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	sub	%i3,	%i1,	%g5
	addccc	%g2,	%g4,	%i6
	fmovsl	%icc,	%f15,	%f17
	tl	%xcc,	0x7
	sra	%o0,	0x17,	%i5
	sdivcc	%l3,	0x05E3,	%i0
	fmovdvc	%icc,	%f11,	%f12
	alignaddr	%i2,	%o5,	%l5
	movcs	%icc,	%i4,	%i7
	alignaddr	%g6,	%o2,	%l6
	set	0x34, %l0
	sta	%f8,	[%l7 + %l0] 0x0c
	edge8	%l4,	%o6,	%o1
	fmuld8ulx16	%f26,	%f15,	%f14
	tne	%icc,	0x0
	fmovdvc	%xcc,	%f0,	%f8
	fbn,a	%fcc0,	loop_851
	andncc	%o3,	%l2,	%o4
	ta	%xcc,	0x5
	sdivcc	%g3,	0x1638,	%o7
loop_851:
	fmovdpos	%icc,	%f13,	%f16
	ba,a,pn	%xcc,	loop_852
	andn	%l0,	%g1,	%l1
	fbu	%fcc0,	loop_853
	tleu	%xcc,	0x4
loop_852:
	mulx	%i3,	0x0050,	%i1
	tgu	%xcc,	0x1
loop_853:
	addccc	%g7,	0x19D6,	%g5
	fmovde	%icc,	%f2,	%f1
	sll	%g2,	0x00,	%g4
	nop
	setx	0xADAE13CD40659CC8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	alignaddr	%i6,	%i5,	%o0
	movvs	%xcc,	%i0,	%i2
	membar	0x61
	movn	%xcc,	%l3,	%l5
	ldub	[%l7 + 0x13],	%i4
	fandnot2s	%f1,	%f17,	%f20
	mulscc	%i7,	%g6,	%o5
	faligndata	%f28,	%f20,	%f22
	fblg	%fcc2,	loop_854
	edge8l	%o2,	%l4,	%l6
	move	%icc,	%o6,	%o1
	bge,a	%icc,	loop_855
loop_854:
	udiv	%o3,	0x0E81,	%o4
	tn	%xcc,	0x0
	fbn	%fcc2,	loop_856
loop_855:
	fbl,a	%fcc3,	loop_857
	fnand	%f6,	%f24,	%f30
	ldd	[%l7 + 0x40],	%g2
loop_856:
	movge	%xcc,	%o7,	%l0
loop_857:
	fbule	%fcc1,	loop_858
	swap	[%l7 + 0x18],	%l2
	tn	%xcc,	0x1
	fpadd32s	%f0,	%f16,	%f17
loop_858:
	nop
	setx	0x1BC1204531E2EE09,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x5F820F04015C8117,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f18,	%f4
	movvc	%icc,	%l1,	%g1
	fnegd	%f12,	%f0
	bcs,a	%xcc,	loop_859
	fpsub16	%f0,	%f8,	%f30
	movn	%icc,	%i1,	%g7
	tleu	%icc,	0x6
loop_859:
	orncc	%i3,	%g2,	%g5
	tneg	%xcc,	0x3
	taddcctv	%i6,	%i5,	%o0
	membar	0x5A
	sra	%g4,	%i0,	%l3
	fmovdleu	%icc,	%f3,	%f16
	tvs	%icc,	0x6
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%f20
	taddcc	%i2,	%l5,	%i4
	tne	%icc,	0x3
	brgz,a	%i7,	loop_860
	sdivx	%g6,	0x0162,	%o2
	membar	0x47
	edge32	%o5,	%l4,	%o6
loop_860:
	brlez	%o1,	loop_861
	edge8ln	%o3,	%o4,	%g3
	fbne	%fcc0,	loop_862
	sdivcc	%l6,	0x1232,	%l0
loop_861:
	fblg	%fcc3,	loop_863
	bge	loop_864
loop_862:
	nop
	fitos	%f3,	%f30
	fstod	%f30,	%f6
	sra	%o7,	%l1,	%g1
loop_863:
	mulscc	%l2,	%g7,	%i3
loop_864:
	movcc	%xcc,	%i1,	%g5
	orcc	%i6,	%i5,	%g2
	set	0x0A, %g5
	lduha	[%l7 + %g5] 0x15,	%o0
	tsubcc	%g4,	0x1ABC,	%l3
	tsubcctv	%i2,	0x1D72,	%l5
	edge32n	%i4,	%i0,	%g6
	sllx	%o2,	%i7,	%o5
	bcs	%icc,	loop_865
	movvs	%xcc,	%o6,	%o1
	xnorcc	%l4,	%o4,	%g3
	movge	%xcc,	%l6,	%o3
loop_865:
	fzero	%f28
	nop
	fitos	%f14,	%f11
	fstox	%f11,	%f6
	fxtos	%f6,	%f13
	nop
	setx loop_866, %l0, %l1
	jmpl %l1, %o7
	mulscc	%l0,	%g1,	%l1
	fmovsl	%xcc,	%f0,	%f29
	stw	%l2,	[%l7 + 0x54]
loop_866:
	fbe,a	%fcc3,	loop_867
	nop
	fitod	%f6,	%f10
	be,pn	%icc,	loop_868
	sdivx	%i3,	0x04F1,	%i1
loop_867:
	srlx	%g7,	%i6,	%g5
	udivx	%i5,	0x1512,	%o0
loop_868:
	movl	%xcc,	%g2,	%l3
	edge16n	%g4,	%i2,	%l5
	taddcc	%i4,	0x08F3,	%g6
	fmuld8sux16	%f15,	%f15,	%f24
	fnot2	%f16,	%f4
	alignaddr	%o2,	%i7,	%o5
	popc	%o6,	%i0
	array32	%o1,	%l4,	%g3
	srl	%o4,	0x18,	%l6
	and	%o3,	%l0,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x20] %asi,	%g1
	tl	%icc,	0x6
	tcs	%xcc,	0x0
	brnz	%l2,	loop_869
	addc	%i3,	0x0C75,	%l1
	flush	%l7 + 0x58
	fpack32	%f10,	%f30,	%f28
loop_869:
	edge8l	%i1,	%i6,	%g5
	call	loop_870
	movcs	%xcc,	%i5,	%o0
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_870:
	xor	%g7,	0x1C92,	%l3
	and	%g4,	0x192B,	%g2
	bleu,a,pn	%xcc,	loop_871
	fmovrdgez	%i2,	%f0,	%f12
	popc	0x076C,	%l5
	movpos	%xcc,	%i4,	%o2
loop_871:
	sub	%i7,	%g6,	%o5
	orcc	%i0,	0x1B0C,	%o6
	addcc	%o1,	%l4,	%o4
	movcc	%xcc,	%g3,	%l6
	fmovdcs	%icc,	%f26,	%f12
	movcc	%icc,	%o3,	%l0
	nop
	set	0x08, %o4
	ldd	[%l7 + %o4],	%g0
	movneg	%xcc,	%l2,	%i3
	and	%o7,	%l1,	%i1
	stbar
	tl	%xcc,	0x7
	bcs,a	loop_872
	subcc	%i6,	%g5,	%i5
	nop
	fitod	%f16,	%f2
	ldd	[%l7 + 0x58],	%g6
loop_872:
	addccc	%l3,	%g4,	%o0
	taddcc	%g2,	0x1D9F,	%i2
	sethi	0x0834,	%i4
	ldd	[%l7 + 0x40],	%f16
	stx	%l5,	[%l7 + 0x58]
	tneg	%icc,	0x7
	udivx	%i7,	0x0406,	%g6
	xnorcc	%o2,	%o5,	%o6
	srl	%i0,	%o1,	%l4
	movrgez	%o4,	%g3,	%o3
	edge32l	%l6,	%g1,	%l2
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	movn	%icc,	%i3,	%o7
	edge32ln	%l1,	%i1,	%g5
	tneg	%icc,	0x7
	flush	%l7 + 0x5C
	fmovrsgez	%i6,	%f27,	%f9
	edge8ln	%g7,	%l3,	%g4
	tsubcc	%o0,	%g2,	%i2
	fbul	%fcc0,	loop_873
	movl	%icc,	%i4,	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%l5,	%g6
loop_873:
	umulcc	%o2,	%i7,	%o6
	membar	0x55
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o5
	taddcctv	%o1,	0x1AED,	%l4
	orn	%o4,	0x1EDE,	%i0
	edge16ln	%o3,	%l6,	%g3
	alignaddr	%l2,	%l0,	%g1
	fmul8x16	%f4,	%f24,	%f6
	fandnot2s	%f2,	%f23,	%f9
	movgu	%icc,	%i3,	%o7
	umul	%l1,	0x10EE,	%g5
	nop
	setx	loop_874,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tn	%xcc,	0x3
	tpos	%icc,	0x0
	tpos	%icc,	0x0
loop_874:
	nop
	set	0x22, %o3
	stha	%i6,	[%l7 + %o3] 0x27
	membar	#Sync
	nop
	setx	0x7305211A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x15FC7CF7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f1,	%f24
	mulx	%g7,	%l3,	%g4
	fmovdvc	%icc,	%f12,	%f30
	movvs	%icc,	%o0,	%i1
	movpos	%icc,	%i2,	%g2
	fpsub16s	%f14,	%f28,	%f0
	ld	[%l7 + 0x48],	%f11
	subc	%i5,	0x1ADA,	%l5
	mulx	%g6,	%i4,	%i7
	set	0x18, %o1
	stxa	%o2,	[%l7 + %o1] 0x23
	membar	#Sync
	fble	%fcc0,	loop_875
	umul	%o6,	0x00BA,	%o5
	fmovdvc	%icc,	%f24,	%f19
	sdiv	%l4,	0x1445,	%o4
loop_875:
	tcc	%icc,	0x6
	movcs	%icc,	%o1,	%i0
	movneg	%icc,	%o3,	%l6
	orn	%g3,	0x0CCD,	%l2
	ldd	[%l7 + 0x30],	%l0
	nop
	set	0x3E, %i3
	ldsh	[%l7 + %i3],	%i3
	tpos	%icc,	0x2
	srl	%g1,	0x10,	%o7
	movleu	%icc,	%l1,	%g5
	edge32n	%g7,	%l3,	%g4
	fand	%f20,	%f4,	%f22
	alignaddrl	%o0,	%i1,	%i2
	xnorcc	%g2,	0x0E81,	%i5
	fbg	%fcc0,	loop_876
	fmul8x16al	%f14,	%f10,	%f26
	be,a	%xcc,	loop_877
	taddcctv	%i6,	%g6,	%l5
loop_876:
	ldd	[%l7 + 0x38],	%i6
	subc	%i4,	0x1AE7,	%o2
loop_877:
	sll	%o6,	%l4,	%o5
	sllx	%o1,	0x0B,	%i0
	addc	%o4,	%l6,	%g3
	sllx	%l2,	0x08,	%l0
	edge32ln	%o3,	%i3,	%o7
	tcc	%icc,	0x5
	sir	0x0144
	bl,pn	%icc,	loop_878
	addc	%g1,	0x036A,	%l1
	srax	%g7,	%l3,	%g5
	bn,a	%icc,	loop_879
loop_878:
	tcc	%icc,	0x2
	fbn	%fcc1,	loop_880
	fnegd	%f2,	%f0
loop_879:
	move	%xcc,	%g4,	%o0
	tge	%icc,	0x2
loop_880:
	bleu,a	loop_881
	umulcc	%i2,	%g2,	%i1
	nop
	set	0x78, %l6
	ldx	[%l7 + %l6],	%i5
	array32	%g6,	%i6,	%i7
loop_881:
	orcc	%i4,	%l5,	%o2
	tcc	%icc,	0x0
	edge16l	%o6,	%l4,	%o5
	tcc	%xcc,	0x2
	edge32n	%o1,	%i0,	%o4
	movcc	%icc,	%l6,	%g3
	udivcc	%l0,	0x0504,	%l2
	fmovscc	%icc,	%f10,	%f27
	fnot2	%f14,	%f26
	orcc	%i3,	%o7,	%g1
	xnorcc	%l1,	0x0E04,	%g7
	ldsw	[%l7 + 0x20],	%o3
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x81,	 0x2
	edge32n	%g4,	%l3,	%i2
	add	%o0,	0x01DB,	%i1
	bpos,a	loop_882
	brlez,a	%i5,	loop_883
	addccc	%g6,	0x1C41,	%g2
	tcc	%icc,	0x2
loop_882:
	nop
	fitod	%f12,	%f10
loop_883:
	nop
	setx	0x0FEF859AFB727280,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f16
	fbg,a	%fcc1,	loop_884
	udivcc	%i7,	0x0593,	%i6
	set	0x2F, %i2
	stba	%l5,	[%l7 + %i2] 0x22
	membar	#Sync
loop_884:
	addccc	%i4,	%o2,	%l4
	sdivx	%o5,	0x13FF,	%o6
	movrlz	%i0,	%o1,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l6,	0x06F3,	%l0
	add	%g3,	0x09F9,	%l2
	movneg	%xcc,	%o7,	%g1
	umulcc	%i3,	0x04B0,	%g7
	movrgez	%l1,	%g5,	%o3
	edge32	%g4,	%i2,	%l3
	movg	%icc,	%o0,	%i5
	fmul8x16	%f23,	%f0,	%f16
	ldd	[%l7 + 0x38],	%i0
	fbue	%fcc2,	loop_885
	fmovrdlz	%g2,	%f0,	%f24
	edge32	%i7,	%i6,	%l5
	membar	0x77
loop_885:
	nop
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x4D] %asi,	%i4
	movcc	%icc,	%o2,	%g6
	bpos	%xcc,	loop_886
	xnorcc	%l4,	%o5,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o1,	0x0707,	%i0
loop_886:
	array8	%l6,	%o4,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%l2,	%g3
	nop
	setx	0x2B52A504B316CCB6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB178280C8F2D77A4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f18,	%f12
	tpos	%icc,	0x1
	pdist	%f6,	%f16,	%f0
	fpadd32	%f26,	%f4,	%f14
	ba,pt	%xcc,	loop_887
	xor	%g1,	%i3,	%o7
	nop
	set	0x08, %l3
	stx	%l1,	[%l7 + %l3]
	fbge	%fcc0,	loop_888
loop_887:
	bvc	loop_889
	sub	%g7,	%g5,	%g4
	srax	%o3,	%i2,	%o0
loop_888:
	edge8n	%l3,	%i5,	%g2
loop_889:
	fmovrslz	%i1,	%f4,	%f31
	fornot2	%f16,	%f28,	%f4
	fnot2s	%f17,	%f3
	umulcc	%i7,	0x1C62,	%i6
	fbne	%fcc2,	loop_890
	for	%f18,	%f6,	%f24
	fmovrdlz	%i4,	%f28,	%f2
	wr	%g0,	0x27,	%asi
	stha	%o2,	[%l7 + 0x66] %asi
	membar	#Sync
loop_890:
	movleu	%xcc,	%l5,	%l4
	tsubcc	%o5,	0x0F35,	%g6
	wr	%g0,	0x81,	%asi
	sta	%f10,	[%l7 + 0x6C] %asi
	sub	%o6,	0x171A,	%o1
	ldsb	[%l7 + 0x76],	%l6
	fmovrdlez	%o4,	%f4,	%f16
	fandnot1s	%f20,	%f28,	%f31
	subc	%i0,	0x04D2,	%l0
	fmovdvc	%xcc,	%f17,	%f0
	movgu	%icc,	%g3,	%g1
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movne	%icc,	%l2,	%i3
	edge16n	%l1,	%g7,	%o7
	fornot2	%f10,	%f0,	%f10
	edge16	%g5,	%g4,	%o3
	edge8	%o0,	%i2,	%i5
	edge16	%l3,	%g2,	%i1
	swap	[%l7 + 0x50],	%i6
	ldsb	[%l7 + 0x48],	%i4
	nop
	setx	0x3CD76C99,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x884A920D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f13,	%f9
	tn	%icc,	0x1
	nop
	setx	loop_891,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0x2C0F3BB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f28
	fands	%f18,	%f4,	%f16
	tl	%icc,	0x1
loop_891:
	tpos	%icc,	0x5
	array32	%o2,	%i7,	%l5
	sdivcc	%l4,	0x0C5F,	%g6
	fmovrde	%o5,	%f2,	%f26
	ldd	[%l7 + 0x48],	%f14
	movn	%icc,	%o6,	%l6
	fmovdn	%xcc,	%f10,	%f23
	udiv	%o1,	0x1229,	%o4
	membar	#Sync
	set	0x40, %o0
	ldda	[%l7 + %o0] 0xf1,	%f0
	fsrc1	%f12,	%f10
	movre	%i0,	0x3AC,	%l0
	fcmpgt32	%f24,	%f0,	%g3
	tge	%icc,	0x3
	fmul8x16al	%f24,	%f3,	%f26
	nop
	setx	0x23A5E4575FF5F788,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x2AC9F40EA56FBBB8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f24,	%f24
	fba	%fcc0,	loop_892
	tge	%icc,	0x6
	set	0x50, %i4
	ldda	[%l7 + %i4] 0x89,	%g0
loop_892:
	st	%f27,	[%l7 + 0x44]
	nop
	fitod	%f12,	%f14
	fdtos	%f14,	%f19
	movcs	%icc,	%l2,	%i3
	sethi	0x1512,	%l1
	edge32l	%g7,	%o7,	%g5
	fbge	%fcc3,	loop_893
	movne	%icc,	%o3,	%o0
	orn	%g4,	%i2,	%l3
	sub	%g2,	%i1,	%i5
loop_893:
	tsubcctv	%i6,	%i4,	%i7
	nop
	setx	0xF3646F04,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x1C171B1D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f13,	%f19
	fors	%f26,	%f16,	%f15
	movrne	%l5,	0x26B,	%o2
	nop
	setx	0x207EA451,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f20
	fxtod	%f20,	%f24
	stb	%g6,	[%l7 + 0x4A]
	xnor	%l4,	%o6,	%o5
	udivcc	%o1,	0x058B,	%l6
	fmovdvs	%xcc,	%f5,	%f17
	fornot1	%f6,	%f22,	%f26
	tn	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	sta	%f13,	[%l7 + 0x14] %asi
	mova	%xcc,	%o4,	%i0
	fmuld8sux16	%f6,	%f25,	%f8
	tne	%icc,	0x5
	tneg	%icc,	0x7
	sethi	0x1032,	%l0
	movrgez	%g1,	%l2,	%i3
	sra	%g3,	0x15,	%g7
	fpack32	%f6,	%f12,	%f6
	nop
	setx loop_894, %l0, %l1
	jmpl %l1, %l1
	movge	%icc,	%g5,	%o7
	fmovsgu	%icc,	%f19,	%f12
	nop
	setx	0xC99D8DC646A6318B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x5748BAAB150CB932,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f22,	%f30
loop_894:
	fbug	%fcc2,	loop_895
	xnorcc	%o0,	0x1371,	%g4
	tne	%xcc,	0x5
	orcc	%i2,	0x0EA9,	%l3
loop_895:
	fmovdle	%icc,	%f28,	%f5
	bleu,a	%xcc,	loop_896
	orncc	%g2,	%i1,	%i5
	and	%o3,	0x0A4D,	%i4
	movg	%xcc,	%i7,	%i6
loop_896:
	tneg	%icc,	0x2
	call	loop_897
	fcmpgt32	%f6,	%f4,	%o2
	fmovsneg	%xcc,	%f14,	%f0
	bge,pt	%icc,	loop_898
loop_897:
	fpadd16	%f10,	%f12,	%f10
	edge32ln	%l5,	%l4,	%o6
	ta	%xcc,	0x5
loop_898:
	xnor	%g6,	%o1,	%o5
	brlz	%l6,	loop_899
	fnot2s	%f3,	%f24
	movcs	%xcc,	%i0,	%o4
	fmovrdgez	%l0,	%f20,	%f8
loop_899:
	tgu	%xcc,	0x6
	movre	%g1,	%i3,	%g3
	bn,a	%xcc,	loop_900
	fble	%fcc2,	loop_901
	or	%l2,	0x144F,	%g7
	udiv	%l1,	0x0D1E,	%o7
loop_900:
	add	%o0,	%g5,	%i2
loop_901:
	addcc	%g4,	%g2,	%i1
	fcmpne32	%f20,	%f10,	%i5
	sll	%o3,	%i4,	%l3
	alignaddr	%i6,	%o2,	%l5
	taddcc	%i7,	%l4,	%g6
	sra	%o1,	0x11,	%o5
	movn	%xcc,	%l6,	%i0
	smulcc	%o4,	%o6,	%g1
	andcc	%l0,	%g3,	%l2
	addcc	%i3,	0x0549,	%l1
	fbu,a	%fcc3,	loop_902
	sdivx	%o7,	0x1685,	%o0
	ta	%icc,	0x3
	andcc	%g5,	%i2,	%g7
loop_902:
	fnot1s	%f12,	%f24
	fnands	%f9,	%f19,	%f15
	bvc,a	loop_903
	ldx	[%l7 + 0x28],	%g4
	bgu,a	%xcc,	loop_904
	sdiv	%g2,	0x048F,	%i1
loop_903:
	edge8ln	%i5,	%i4,	%o3
	fmovse	%xcc,	%f14,	%f8
loop_904:
	taddcc	%i6,	0x1493,	%l3
	orn	%l5,	0x1D6E,	%o2
	nop
	setx	0x8CBB7988D073808B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	fabsd	%f18,	%f0
	fbge,a	%fcc2,	loop_905
	fmovdneg	%icc,	%f0,	%f22
	fandnot1s	%f11,	%f28,	%f8
	sll	%l4,	0x05,	%i7
loop_905:
	mova	%icc,	%o1,	%o5
	edge16n	%l6,	%g6,	%o4
	fbg	%fcc3,	loop_906
	fxor	%f4,	%f14,	%f30
	membar	0x36
	edge16n	%o6,	%g1,	%l0
loop_906:
	tn	%icc,	0x6
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
	nop
	setx	0x80704167,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	sethi	0x0229,	%i0
	xnor	%l2,	%g3,	%i3
loop_907:
	fpack32	%f20,	%f2,	%f6
	stb	%o7,	[%l7 + 0x43]
	bvc,a	%xcc,	loop_908
	ba,pn	%xcc,	loop_909
	tvc	%xcc,	0x4
	edge8n	%l1,	%g5,	%i2
loop_908:
	movcs	%xcc,	%g7,	%o0
loop_909:
	movcc	%xcc,	%g2,	%g4
	sir	0x14F4
	tsubcctv	%i5,	%i1,	%o3
	edge8l	%i6,	%l3,	%i4
	orcc	%o2,	0x1874,	%l5
	tl	%xcc,	0x3
	edge16ln	%i7,	%o1,	%l4
	fmovdn	%icc,	%f16,	%f22
	alignaddrl	%o5,	%g6,	%l6
	set	0x58, %i0
	stwa	%o6,	[%l7 + %i0] 0x89
	addccc	%o4,	%g1,	%i0
	ldsw	[%l7 + 0x5C],	%l2
	subccc	%g3,	%i3,	%l0
	tneg	%xcc,	0x2
	movg	%xcc,	%l1,	%o7
	udivx	%i2,	0x00A2,	%g5
	tn	%icc,	0x7
	array32	%o0,	%g2,	%g4
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x30] %asi,	%i5
	ldsb	[%l7 + 0x3D],	%i1
	fmovdneg	%icc,	%f1,	%f18
	movcc	%icc,	%g7,	%o3
	fmovda	%icc,	%f10,	%f9
	fbo	%fcc3,	loop_910
	flush	%l7 + 0x24
	movl	%xcc,	%i6,	%l3
	nop
	fitod	%f4,	%f8
	fdtoi	%f8,	%f16
loop_910:
	srlx	%i4,	%l5,	%o2
	edge32n	%o1,	%l4,	%o5
	stw	%g6,	[%l7 + 0x60]
	or	%i7,	%l6,	%o4
	edge32	%g1,	%i0,	%l2
	smul	%g3,	%o6,	%l0
	fcmpne16	%f4,	%f16,	%i3
	ble	loop_911
	umul	%o7,	0x1FD2,	%l1
	nop
	set	0x4C, %i1
	ldsw	[%l7 + %i1],	%i2
	xnorcc	%o0,	0x1805,	%g5
loop_911:
	fmovsge	%icc,	%f8,	%f0
	std	%f28,	[%l7 + 0x48]
	mulscc	%g4,	0x123E,	%i5
	movrlz	%i1,	0x116,	%g2
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
	fors	%f13,	%f26,	%f8
	edge32ln	%o3,	%i6,	%l3
	movrne	%g7,	%l5,	%i4
loop_912:
	movne	%xcc,	%o2,	%o1
	mova	%icc,	%o5,	%l4
	fpsub16s	%f18,	%f5,	%f18
	move	%xcc,	%i7,	%g6
	fbug	%fcc0,	loop_913
	srl	%o4,	%g1,	%l6
	tsubcc	%i0,	%l2,	%o6
	mova	%icc,	%g3,	%i3
loop_913:
	edge16n	%o7,	%l0,	%l1
	subc	%o0,	0x030C,	%g5
	subcc	%i2,	0x1BD1,	%i5
	move	%icc,	%g4,	%i1
	fnors	%f13,	%f23,	%f22
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x54] %asi,	%o3
	alignaddr	%i6,	%l3,	%g7
	fmovdneg	%icc,	%f28,	%f4
	add	%l5,	0x14AF,	%g2
	movle	%icc,	%i4,	%o1
	fpackfix	%f8,	%f1
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x18] %asi,	%f10
	sll	%o5,	%o2,	%l4
	smulcc	%i7,	%g6,	%g1
	nop
	setx	0xB977684D705E9B8F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	udiv	%l6,	0x1A12,	%o4
	movge	%xcc,	%i0,	%o6
	bgu,pn	%icc,	loop_914
	tneg	%xcc,	0x3
	fbe,a	%fcc0,	loop_915
	sra	%l2,	0x06,	%g3
loop_914:
	ba,pn	%xcc,	loop_916
	move	%xcc,	%i3,	%o7
loop_915:
	fmul8sux16	%f14,	%f12,	%f0
	or	%l1,	0x04C4,	%l0
loop_916:
	fpackfix	%f2,	%f23
	fxors	%f9,	%f7,	%f12
	edge16	%g5,	%i2,	%i5
	fornot1s	%f25,	%f1,	%f18
	tpos	%icc,	0x2
	fsrc1	%f22,	%f6
	movneg	%icc,	%o0,	%i1
	edge32l	%g4,	%i6,	%o3
	set	0x20, %l5
	ldsha	[%l7 + %l5] 0x81,	%l3
	bpos,a	loop_917
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l5,	%g2,	%i4
	fnot2	%f30,	%f0
loop_917:
	bl,pt	%xcc,	loop_918
	ldub	[%l7 + 0x16],	%g7
	fone	%f18
	sub	%o1,	%o5,	%o2
loop_918:
	brgz,a	%l4,	loop_919
	edge16l	%i7,	%g6,	%g1
	orcc	%l6,	0x1E90,	%o4
	fmovd	%f20,	%f4
loop_919:
	bcc	%xcc,	loop_920
	st	%f6,	[%l7 + 0x6C]
	fcmpeq32	%f12,	%f0,	%o6
	fnor	%f10,	%f20,	%f20
loop_920:
	membar	0x23
	movgu	%xcc,	%l2,	%i0
	andn	%g3,	0x1D55,	%i3
	addc	%l1,	0x0765,	%l0
	movrne	%g5,	%o7,	%i5
	movgu	%icc,	%o0,	%i1
	movn	%icc,	%i2,	%g4
	movre	%i6,	0x0BC,	%l3
	andncc	%l5,	%g2,	%i4
	edge32l	%o3,	%o1,	%o5
	fble,a	%fcc2,	loop_921
	andncc	%g7,	%o2,	%i7
	edge8n	%g6,	%g1,	%l6
	sdivx	%o4,	0x0528,	%l4
loop_921:
	fxors	%f28,	%f26,	%f4
	fornot2	%f18,	%f8,	%f0
	fmovdl	%xcc,	%f27,	%f25
	nop
	set	0x68, %l4
	ldx	[%l7 + %l4],	%o6
	xor	%l2,	%g3,	%i0
	edge32	%i3,	%l1,	%l0
	fornot2s	%f15,	%f17,	%f1
	xorcc	%o7,	0x0781,	%g5
	movrlz	%o0,	0x230,	%i1
	popc	%i2,	%i5
	movg	%icc,	%i6,	%g4
	flush	%l7 + 0x10
	brgz	%l3,	loop_922
	fmovdne	%xcc,	%f30,	%f30
	fsrc1s	%f6,	%f30
	movle	%icc,	%l5,	%g2
loop_922:
	st	%f28,	[%l7 + 0x54]
	edge32ln	%i4,	%o3,	%o5
	fnot1	%f18,	%f12
	fabsd	%f4,	%f22
	tgu	%xcc,	0x0
	fmovrse	%g7,	%f10,	%f19
	add	%l7,	0x38,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x04,	%o1,	%i7
	edge16	%g6,	%g1,	%o2
	fmovspos	%xcc,	%f9,	%f4
	udivx	%o4,	0x02BD,	%l6
	sethi	0x0EC6,	%l4
	addc	%l2,	0x06A8,	%g3
	movgu	%xcc,	%i0,	%i3
	xorcc	%o6,	%l0,	%o7
	movge	%icc,	%g5,	%o0
	edge8n	%l1,	%i2,	%i5
	bgu	loop_923
	udiv	%i1,	0x1552,	%g4
	tg	%xcc,	0x3
	lduw	[%l7 + 0x78],	%l3
loop_923:
	fmovdn	%icc,	%f25,	%f13
	bvc,a,pn	%xcc,	loop_924
	fpack32	%f26,	%f0,	%f16
	brnz,a	%i6,	loop_925
	sra	%g2,	0x03,	%l5
loop_924:
	srl	%i4,	0x1E,	%o3
	or	%o5,	0x1547,	%g7
loop_925:
	fxors	%f26,	%f27,	%f18
	fmovrde	%o1,	%f16,	%f8
	fmovde	%xcc,	%f24,	%f24
	tg	%xcc,	0x6
	bcs,a,pn	%icc,	loop_926
	ldsb	[%l7 + 0x79],	%i7
	nop
	setx loop_927, %l0, %l1
	jmpl %l1, %g1
	tsubcc	%g6,	0x0303,	%o2
loop_926:
	tl	%xcc,	0x5
	sdiv	%l6,	0x106C,	%o4
loop_927:
	sdivx	%l2,	0x0C71,	%g3
	fcmpne16	%f24,	%f0,	%l4
	nop
	setx	loop_928,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%xcc,	%i3,	%o6
	movrlez	%l0,	0x16A,	%o7
	nop
	fitod	%f16,	%f30
loop_928:
	edge16ln	%i0,	%o0,	%g5
	sub	%i2,	0x0240,	%l1
	edge32l	%i5,	%i1,	%g4
	edge8ln	%l3,	%g2,	%i6
	fsrc2s	%f18,	%f1
	movpos	%xcc,	%l5,	%i4
	nop
	set	0x68, %o5
	ldsw	[%l7 + %o5],	%o5
	fmul8ulx16	%f8,	%f24,	%f14
	ble,a,pn	%icc,	loop_929
	fbul	%fcc3,	loop_930
	brz,a	%o3,	loop_931
	smul	%g7,	%i7,	%o1
loop_929:
	tpos	%icc,	0x3
loop_930:
	fnegd	%f24,	%f30
loop_931:
	fbge	%fcc0,	loop_932
	movleu	%icc,	%g1,	%o2
	orncc	%l6,	%o4,	%g6
	movleu	%icc,	%l2,	%g3
loop_932:
	sdivx	%i3,	0x19D2,	%l4
	ldub	[%l7 + 0x61],	%l0
	edge16n	%o7,	%o6,	%i0
	array8	%o0,	%i2,	%g5
	srlx	%i5,	%i1,	%l1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	setx loop_933, %l0, %l1
	jmpl %l1, %l3
	fbl	%fcc3,	loop_934
	tcc	%icc,	0x1
	bcc,pt	%xcc,	loop_935
loop_933:
	srax	%g4,	%i6,	%l5
loop_934:
	bgu,pt	%xcc,	loop_936
	tl	%xcc,	0x1
loop_935:
	ldsh	[%l7 + 0x42],	%g2
	fors	%f4,	%f3,	%f21
loop_936:
	ldd	[%l7 + 0x28],	%i4
	wr	%g0,	0x10,	%asi
	stba	%o3,	[%l7 + 0x1E] %asi
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fmovrse	%g7,	%f23,	%f27
	subcc	%o5,	%i7,	%g1
	ldd	[%l7 + 0x38],	%f16
	te	%icc,	0x2
	fmovrdgz	%o1,	%f10,	%f4
	movg	%icc,	%o2,	%o4
	sir	0x011B
	st	%f13,	[%l7 + 0x60]
	tgu	%xcc,	0x7
	movge	%icc,	%g6,	%l2
	set	0x0D, %g2
	stba	%g3,	[%l7 + %g2] 0x2a
	membar	#Sync
	tcs	%icc,	0x1
	subc	%l6,	0x0580,	%i3
	alignaddrl	%l4,	%o7,	%l0
	fones	%f7
	bn	%xcc,	loop_937
	movcs	%icc,	%i0,	%o6
	brnz	%i2,	loop_938
	sllx	%o0,	0x0B,	%g5
loop_937:
	edge8l	%i1,	%l1,	%l3
	set	0x5C, %o2
	lduha	[%l7 + %o2] 0x15,	%g4
loop_938:
	andncc	%i6,	%l5,	%g2
	mulscc	%i5,	0x1B74,	%o3
	mulscc	%i4,	%g7,	%o5
	fbuge,a	%fcc0,	loop_939
	edge8	%g1,	%o1,	%i7
	edge32n	%o4,	%g6,	%o2
	fmovs	%f0,	%f18
loop_939:
	sra	%l2,	0x05,	%l6
	std	%f22,	[%l7 + 0x78]
	sllx	%i3,	%l4,	%o7
	smul	%g3,	0x1F61,	%i0
	andcc	%l0,	0x10E2,	%o6
	edge8	%o0,	%i2,	%i1
	fors	%f9,	%f22,	%f1
	movrgz	%g5,	%l3,	%l1
	smul	%g4,	0x0E2E,	%l5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x0C] %asi,	%i6
	ldd	[%l7 + 0x38],	%f12
	fpadd16s	%f3,	%f27,	%f0
	fexpand	%f29,	%f30
	udiv	%i5,	0x07A7,	%g2
	edge8n	%o3,	%i4,	%o5
	edge16ln	%g1,	%o1,	%g7
	add	%l7,	0x40,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x18,	%o4,	%i7
	ta	%xcc,	0x7
	tl	%xcc,	0x6
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x3a8] %asi,	%g6 ripped by fixASI40.pl ripped by fixASI40.pl
	brnz	%l2,	loop_940
	edge8n	%l6,	%o2,	%i3
	umul	%o7,	%l4,	%g3
	edge16n	%i0,	%o6,	%o0
loop_940:
	sub	%i2,	%l0,	%g5
	lduh	[%l7 + 0x22],	%l3
	bcc,pt	%icc,	loop_941
	fcmple16	%f22,	%f22,	%i1
	orn	%l1,	0x1A2C,	%g4
	tn	%icc,	0x5
loop_941:
	movn	%icc,	%i6,	%i5
	addccc	%l5,	%g2,	%o3
	xor	%i4,	%o5,	%o1
	edge16ln	%g1,	%o4,	%g7
	fbo,a	%fcc1,	loop_942
	orncc	%i7,	%l2,	%l6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x19,	%o2,	%i3
loop_942:
	nop
	setx	loop_943,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpadd32s	%f2,	%f14,	%f19
	tge	%xcc,	0x3
	stw	%g6,	[%l7 + 0x28]
loop_943:
	udivcc	%o7,	0x071C,	%g3
	xorcc	%i0,	%o6,	%l4
	movvc	%icc,	%o0,	%l0
	fmovscc	%icc,	%f9,	%f14
	orcc	%i2,	%l3,	%i1
	tgu	%icc,	0x4
	edge32l	%l1,	%g5,	%g4
	move	%icc,	%i5,	%l5
	mova	%icc,	%g2,	%o3
	tl	%icc,	0x7
	edge32ln	%i6,	%o5,	%i4
	subccc	%o1,	0x1210,	%o4
	movrgz	%g7,	%i7,	%l2
	prefetch	[%l7 + 0x70],	 0x3
	ldd	[%l7 + 0x40],	%i6
	ba,pt	%xcc,	loop_944
	fcmpgt32	%f24,	%f6,	%o2
	and	%g1,	%g6,	%o7
	membar	#Sync
	set	0x40, %i5
	ldda	[%l7 + %i5] 0xf1,	%f16
loop_944:
	fmovdleu	%xcc,	%f29,	%f0
	fmovs	%f12,	%f5
	smulcc	%i3,	0x0DD2,	%i0
	fcmple32	%f4,	%f8,	%g3
	tg	%xcc,	0x5
	tvs	%xcc,	0x4
	tvc	%xcc,	0x1
	movcc	%xcc,	%o6,	%l4
	umul	%l0,	%o0,	%l3
	edge8ln	%i1,	%l1,	%g5
	movgu	%xcc,	%i2,	%i5
	subccc	%g4,	0x053C,	%l5
	edge16ln	%g2,	%i6,	%o3
	movcc	%icc,	%i4,	%o5
	nop
	fitod	%f10,	%f14
	fdtos	%f14,	%f10
	sllx	%o4,	0x0F,	%o1
	ldsh	[%l7 + 0x4E],	%g7
	movleu	%icc,	%l2,	%i7
	tleu	%icc,	0x1
	srax	%l6,	%g1,	%o2
	edge32ln	%o7,	%g6,	%i3
	taddcctv	%i0,	0x1D9E,	%o6
	movrgz	%l4,	0x15F,	%l0
	alignaddrl	%o0,	%g3,	%i1
	array32	%l1,	%g5,	%i2
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x44] %asi,	%i5
	fnot1s	%f19,	%f21
	xnor	%g4,	0x172A,	%l5
	sdivx	%g2,	0x15B2,	%i6
	set	0x58, %l1
	lduwa	[%l7 + %l1] 0x11,	%l3
	brgez	%o3,	loop_945
	mulx	%o5,	0x16BD,	%i4
	sll	%o4,	%g7,	%l2
	prefetch	[%l7 + 0x20],	 0x0
loop_945:
	andcc	%i7,	0x1DA9,	%l6
	orncc	%g1,	0x0BC6,	%o2
	nop
	setx	0x1EC6E9F0A446963A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xBD77138997736DD8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f6,	%f28
	taddcc	%o1,	0x14A6,	%g6
	edge16n	%i3,	%o7,	%i0
	move	%xcc,	%l4,	%o6
	fmovdvc	%icc,	%f21,	%f20
	fones	%f13
	or	%l0,	0x1C5A,	%o0
	tsubcctv	%g3,	0x08B2,	%i1
	sth	%l1,	[%l7 + 0x78]
	std	%f18,	[%l7 + 0x28]
	fnegs	%f20,	%f4
	edge16l	%i2,	%g5,	%g4
	nop
	setx	0xE525F08A20664BEF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x098B41296254A63E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f24,	%f22
	tcs	%xcc,	0x0
	nop
	setx	0x1FFF3C3690BE847A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x34E6614AE89A17A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f2,	%f10
	udivcc	%l5,	0x13A6,	%i5
	edge16	%i6,	%g2,	%l3
	fnot1s	%f13,	%f0
	edge16l	%o3,	%i4,	%o5
	lduw	[%l7 + 0x60],	%g7
	stw	%l2,	[%l7 + 0x58]
	alignaddrl	%o4,	%l6,	%g1
	fmovdpos	%xcc,	%f29,	%f29
	sdivcc	%o2,	0x09ED,	%o1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g6
	movvc	%xcc,	%i7,	%i3
	movgu	%xcc,	%o7,	%i0
	tneg	%xcc,	0x2
	fbu,a	%fcc1,	loop_946
	sdivcc	%l4,	0x176C,	%o6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x4A] %asi,	%o0
loop_946:
	smulcc	%l0,	%i1,	%g3
	ldd	[%l7 + 0x30],	%l0
	nop
	set	0x0C, %g1
	ldstub	[%l7 + %g1],	%g5
	fxnors	%f13,	%f5,	%f14
	fmovdvc	%icc,	%f0,	%f25
	nop
	set	0x08, %g4
	ldx	[%l7 + %g4],	%i2
	movge	%icc,	%g4,	%l5
	brz,a	%i5,	loop_947
	ldsw	[%l7 + 0x44],	%i6
	bcs	loop_948
	andcc	%g2,	0x19F1,	%o3
loop_947:
	nop
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x60] %asi,	%i4
loop_948:
	ld	[%l7 + 0x50],	%f4
	bne,a	%icc,	loop_949
	andn	%l3,	0x1D7E,	%g7
	sdiv	%o5,	0x1E17,	%l2
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x30] %asi,	%l6
loop_949:
	orcc	%o4,	0x1D79,	%g1
	fnot1s	%f27,	%f28
	edge16ln	%o1,	%o2,	%i7
	fone	%f4
	fnot2	%f14,	%f26
	nop
	setx loop_950, %l0, %l1
	jmpl %l1, %i3
	fbn	%fcc1,	loop_951
	edge32l	%g6,	%o7,	%l4
	taddcc	%o6,	%o0,	%i0
loop_950:
	tsubcctv	%l0,	%g3,	%l1
loop_951:
	fmovsleu	%icc,	%f9,	%f23
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x0c
	bleu,a,pn	%icc,	loop_952
	subc	%i1,	%i2,	%g5
	bpos,a,pn	%xcc,	loop_953
	fpsub16s	%f29,	%f13,	%f20
loop_952:
	fnor	%f30,	%f12,	%f4
	tpos	%icc,	0x3
loop_953:
	nop
	set	0x15, %g7
	ldsba	[%l7 + %g7] 0x04,	%l5
	brlez,a	%i5,	loop_954
	nop
	setx	0xFC178FB36433F45A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x42D904957FA0B151,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f22,	%f16
	fpadd16	%f24,	%f6,	%f22
	subccc	%g4,	0x022B,	%i6
loop_954:
	fble,a	%fcc3,	loop_955
	fnors	%f29,	%f29,	%f7
	edge32ln	%o3,	%g2,	%l3
	movrgz	%g7,	0x280,	%i4
loop_955:
	tsubcctv	%l2,	0x12A8,	%o5
	movre	%l6,	0x1E3,	%o4
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	addccc	%g1,	0x1E1C,	%o1
	fmovsa	%xcc,	%f18,	%f11
	tsubcctv	%i7,	0x11FC,	%i3
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x5E] %asi,	%g6
	fxnors	%f12,	%f14,	%f29
	array32	%o2,	%l4,	%o7
	edge32ln	%o6,	%o0,	%i0
	ldstub	[%l7 + 0x0F],	%l0
	bvs,a	loop_956
	fmovsgu	%xcc,	%f19,	%f9
	movn	%icc,	%l1,	%g3
	set	0x28, %i6
	prefetcha	[%l7 + %i6] 0x88,	 0x0
loop_956:
	xorcc	%g5,	0x1E6D,	%l5
	fmovdge	%icc,	%f10,	%f6
	nop
	setx	0x1046E22A09E16F5C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB7570EAC6389092F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f16,	%f16
	fbn,a	%fcc1,	loop_957
	movrlz	%i5,	0x3EA,	%i2
	nop
	setx	0x689D63B8AF151D02,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xFA9BF4E9A4E71736,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f16,	%f12
	fmovspos	%xcc,	%f21,	%f27
loop_957:
	flush	%l7 + 0x60
	tg	%icc,	0x5
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	movrlez	%i6,	0x326,	%o3
	fnot2	%f26,	%f4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%g4,	%g2
	array8	%l3,	%i4,	%g7
	bgu,pt	%xcc,	loop_958
	fpsub32s	%f3,	%f30,	%f7
	edge32l	%l2,	%l6,	%o4
	subc	%o5,	0x153B,	%o1
loop_958:
	array32	%g1,	%i7,	%g6
	sdivx	%i3,	0x062D,	%o2
	umulcc	%l4,	0x0924,	%o7
	sub	%o6,	0x0987,	%o0
	ldd	[%l7 + 0x68],	%l0
	ba,pt	%xcc,	loop_959
	tsubcc	%l1,	0x130C,	%g3
	movcs	%icc,	%i0,	%i1
	fnands	%f12,	%f4,	%f31
loop_959:
	ldd	[%l7 + 0x68],	%f24
	movrlez	%g5,	%i5,	%l5
	orn	%i6,	%i2,	%o3
	movne	%icc,	%g4,	%l3
	fmovdleu	%xcc,	%f22,	%f20
	srl	%g2,	0x03,	%g7
	fnands	%f4,	%f3,	%f16
	movcs	%xcc,	%i4,	%l6
	fmovscs	%icc,	%f12,	%f7
	bpos,a	%xcc,	loop_960
	fxnors	%f2,	%f1,	%f21
	bleu,a	%icc,	loop_961
	fornot1s	%f20,	%f21,	%f3
loop_960:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o4,	%l2
loop_961:
	subccc	%o1,	0x0087,	%o5
	tl	%icc,	0x0
	fbug	%fcc1,	loop_962
	tvs	%icc,	0x5
	bvc,pt	%xcc,	loop_963
	membar	0x55
loop_962:
	movn	%xcc,	%g1,	%i7
	movre	%i3,	0x211,	%o2
loop_963:
	fmovsleu	%xcc,	%f21,	%f19
	fandnot1	%f0,	%f8,	%f28
	movrgez	%g6,	0x1D7,	%o7
	orncc	%o6,	0x13FC,	%o0
	nop
	setx	loop_964,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	umulcc	%l0,	%l1,	%l4
	fmovdn	%xcc,	%f3,	%f28
	nop
	fitos	%f13,	%f15
	fstox	%f15,	%f4
loop_964:
	taddcctv	%i0,	%i1,	%g5
	fnor	%f12,	%f24,	%f14
	nop
	fitos	%f3,	%f12
	fstoi	%f12,	%f14
	sdivcc	%i5,	0x05AB,	%l5
	fbue,a	%fcc3,	loop_965
	move	%xcc,	%g3,	%i6
	movre	%o3,	0x26D,	%g4
	sll	%i2,	0x07,	%l3
loop_965:
	edge16ln	%g7,	%i4,	%l6
	orcc	%g2,	%o4,	%o1
	subc	%l2,	0x0CCB,	%g1
	tn	%xcc,	0x3
	tsubcctv	%i7,	0x1263,	%o5
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x0
	fbge,a	%fcc3,	loop_966
	bne,a	loop_967
	taddcctv	%g6,	0x0E6E,	%o2
	smulcc	%o6,	0x1277,	%o7
loop_966:
	andn	%o0,	%l1,	%l4
loop_967:
	edge8ln	%l0,	%i1,	%g5
	nop
	setx	0x991AB42E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x73B590AA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f30,	%f8
	movg	%icc,	%i0,	%l5
	bleu	%icc,	loop_968
	movgu	%xcc,	%i5,	%g3
	bleu	loop_969
	sub	%i6,	0x179A,	%g4
loop_968:
	fmul8sux16	%f8,	%f10,	%f0
	edge8ln	%o3,	%i2,	%g7
loop_969:
	nop
	setx	0xD3785566B2C07357,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x2A956DA590492781,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f20,	%f4
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x30] %asi,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc1,	loop_970
	edge16n	%l3,	%i4,	%l6
	fnegs	%f11,	%f22
	movvc	%icc,	%g2,	%o1
loop_970:
	fmovrse	%o4,	%f4,	%f27
	ldx	[%l7 + 0x10],	%g1
	ldsh	[%l7 + 0x5A],	%i7
	fandnot2	%f22,	%f12,	%f14
	flush	%l7 + 0x64
	bl,pt	%icc,	loop_971
	tg	%xcc,	0x7
	srax	%o5,	0x07,	%i3
	movl	%xcc,	%g6,	%o2
loop_971:
	fmovsgu	%icc,	%f3,	%f29
	ldsw	[%l7 + 0x3C],	%l2
	fsrc2	%f12,	%f8
	fandnot2s	%f18,	%f27,	%f17
	add	%l7,	0x78,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o7,	%o0
	movge	%icc,	%l1,	%o6
	edge32n	%l4,	%i1,	%g5
	fbo	%fcc0,	loop_972
	brgez,a	%l0,	loop_973
	ldstub	[%l7 + 0x37],	%l5
	srlx	%i5,	0x07,	%i0
loop_972:
	prefetch	[%l7 + 0x4C],	 0x0
loop_973:
	stx	%i6,	[%l7 + 0x48]
	move	%xcc,	%g4,	%g3
	fbn	%fcc2,	loop_974
	sethi	0x071D,	%o3
	nop
	setx	loop_975,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bl,a	loop_976
loop_974:
	fbue,a	%fcc1,	loop_977
	movrlz	%g7,	0x1CF,	%i2
loop_975:
	tne	%xcc,	0x6
loop_976:
	array16	%l3,	%l6,	%g2
loop_977:
	fmovrdne	%o1,	%f22,	%f4
	tn	%xcc,	0x0
	move	%icc,	%o4,	%i4
	orn	%g1,	0x05AD,	%o5
	sdivcc	%i3,	0x068D,	%i7
	set	0x08, %i7
	sta	%f28,	[%l7 + %i7] 0x19
	fnot2	%f22,	%f30
	orncc	%g6,	0x1C82,	%l2
	xnor	%o2,	%o0,	%o7
	subcc	%o6,	%l4,	%l1
	fmovrdlz	%g5,	%f2,	%f4
	tsubcc	%l0,	0x1D84,	%i1
	set	0x2E, %o6
	stba	%i5,	[%l7 + %o6] 0x2b
	membar	#Sync
	bpos,a	loop_978
	movrlz	%l5,	0x1D3,	%i6
	movle	%xcc,	%g4,	%g3
	ldd	[%l7 + 0x30],	%f16
loop_978:
	fmul8x16	%f0,	%f28,	%f16
	fmovdn	%xcc,	%f11,	%f30
	nop
	fitod	%f4,	%f18
	fdtox	%f18,	%f26
	fxtod	%f26,	%f28
	fors	%f31,	%f21,	%f16
	movrgez	%o3,	0x142,	%g7
	fpmerge	%f25,	%f22,	%f20
	set	0x7A, %g6
	lduba	[%l7 + %g6] 0x89,	%i2
	nop
	setx	0x5E3CC220071513CE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x2564D8E1A0C8FFA9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f4,	%f22
	edge8l	%l3,	%i0,	%g2
	edge8	%o1,	%l6,	%i4
	fbne	%fcc3,	loop_979
	andcc	%g1,	0x13B1,	%o5
	udivcc	%o4,	0x14A5,	%i3
	nop
	setx	0x54E98DE9D027A326,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f10
loop_979:
	nop
	setx	0x788C62D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xAC72300F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f14,	%f11
	or	%g6,	%i7,	%l2
	addc	%o0,	%o7,	%o2
	bpos,a,pn	%icc,	loop_980
	tcc	%xcc,	0x6
	movcs	%icc,	%o6,	%l1
	andcc	%l4,	%g5,	%i1
loop_980:
	fmovsle	%icc,	%f15,	%f11
	add	%i5,	0x143E,	%l0
	bvc	%icc,	loop_981
	lduh	[%l7 + 0x44],	%i6
	fpack16	%f0,	%f22
	tvs	%xcc,	0x6
loop_981:
	umulcc	%l5,	0x1EE9,	%g3
	movpos	%xcc,	%g4,	%g7
	fbn,a	%fcc0,	loop_982
	subc	%i2,	%l3,	%o3
	movgu	%xcc,	%g2,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_982:
	mulscc	%o1,	0x1CE8,	%l6
	set	0x43, %l0
	ldstuba	[%l7 + %l0] 0x11,	%i4
	nop
	setx	0x67AC85B914AD74B1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6A33DFE58AF1770A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f18,	%f16
	popc	0x1220,	%o5
	smul	%o4,	%i3,	%g1
	movg	%icc,	%i7,	%g6
	membar	0x31
	movre	%o0,	0x233,	%o7
	edge16n	%o2,	%o6,	%l1
	ldub	[%l7 + 0x45],	%l4
	edge32n	%l2,	%g5,	%i5
	udiv	%i1,	0x163B,	%l0
	edge8ln	%i6,	%g3,	%g4
	andcc	%g7,	%i2,	%l3
	fnor	%f28,	%f0,	%f12
	andn	%o3,	0x0AE9,	%g2
	fpadd32	%f4,	%f4,	%f4
	edge8n	%i0,	%o1,	%l5
	andncc	%i4,	%o5,	%o4
	sllx	%i3,	0x18,	%g1
	ldub	[%l7 + 0x79],	%i7
	orncc	%l6,	0x0F74,	%o0
	edge8l	%o7,	%g6,	%o6
	srlx	%o2,	0x12,	%l4
	fsrc2	%f0,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f6,	%f20,	%l2
	movrgz	%g5,	0x030,	%i5
	movcs	%icc,	%l1,	%i1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x3C] %asi,	%l0
	edge16n	%g3,	%g4,	%g7
	fandnot2	%f2,	%f2,	%f22
	te	%xcc,	0x7
	fmovde	%xcc,	%f25,	%f18
	andn	%i6,	0x0D20,	%l3
	fmovdgu	%xcc,	%f29,	%f6
	for	%f22,	%f8,	%f14
	movgu	%xcc,	%i2,	%o3
	fbne,a	%fcc1,	loop_983
	tpos	%icc,	0x3
	srax	%g2,	%i0,	%o1
	movrlez	%i4,	%o5,	%o4
loop_983:
	edge8l	%i3,	%g1,	%l5
	mova	%xcc,	%l6,	%i7
	alignaddr	%o0,	%o7,	%o6
	fmovspos	%icc,	%f17,	%f25
	bcc,a	loop_984
	orn	%o2,	0x1D19,	%l4
	bcs,a,pt	%icc,	loop_985
	movneg	%xcc,	%l2,	%g5
loop_984:
	movge	%xcc,	%g6,	%i5
	movleu	%xcc,	%l1,	%i1
loop_985:
	movne	%icc,	%l0,	%g3
	array32	%g4,	%i6,	%g7
	movne	%icc,	%i2,	%l3
	or	%o3,	0x1871,	%g2
	fcmpne32	%f14,	%f24,	%o1
	umulcc	%i4,	%i0,	%o4
	edge8n	%o5,	%g1,	%i3
	andncc	%l6,	%i7,	%l5
	sra	%o0,	%o6,	%o7
	bcs,a,pn	%icc,	loop_986
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f10
	fxtod	%f10,	%f30
	movne	%xcc,	%l4,	%o2
	sethi	0x142A,	%g5
loop_986:
	subccc	%g6,	0x18A7,	%i5
	stbar
	movrlz	%l2,	0x1F8,	%l1
	orncc	%i1,	%g3,	%g4
	movvs	%xcc,	%i6,	%g7
	fors	%f17,	%f28,	%f27
	sir	0x19E2
	sethi	0x1B4F,	%i2
	umul	%l0,	0x0C4B,	%o3
	tpos	%icc,	0x5
	edge16l	%l3,	%o1,	%g2
	flush	%l7 + 0x0C
	addccc	%i4,	0x1181,	%i0
	alignaddrl	%o5,	%g1,	%i3
	fmuld8sux16	%f15,	%f17,	%f28
	subc	%o4,	%l6,	%l5
	addccc	%o0,	%i7,	%o7
	umulcc	%l4,	%o2,	%g5
	fsrc2s	%f16,	%f22
	fpsub16	%f24,	%f0,	%f30
	addcc	%o6,	%i5,	%g6
	ldd	[%l7 + 0x58],	%f10
	edge32ln	%l1,	%l2,	%i1
	fmovspos	%xcc,	%f20,	%f21
	nop
	setx	0xC052774D,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	bcs,pn	%icc,	loop_987
	movrne	%g3,	%i6,	%g7
	fmovdne	%icc,	%f31,	%f28
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_987:
	movleu	%icc,	%g4,	%i2
	tpos	%xcc,	0x6
	fmovspos	%icc,	%f5,	%f15
	subcc	%o3,	0x138C,	%l0
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x3
	brlez,a	%l3,	loop_988
	edge8ln	%i4,	%i0,	%o5
	subc	%g2,	%i3,	%g1
	nop
	fitos	%f15,	%f2
loop_988:
	fornot1	%f8,	%f12,	%f18
	movneg	%icc,	%o4,	%l6
	sethi	0x0E97,	%l5
	sdivcc	%o0,	0x005D,	%o7
	movleu	%icc,	%i7,	%o2
	ld	[%l7 + 0x60],	%f8
	movge	%icc,	%l4,	%g5
	subccc	%o6,	%i5,	%l1
	edge8l	%g6,	%l2,	%i1
	fand	%f22,	%f22,	%f0
	subccc	%g3,	%g7,	%g4
	set	0x0C, %o7
	lduwa	[%l7 + %o7] 0x04,	%i6
	edge32l	%o3,	%i2,	%o1
	subccc	%l3,	%l0,	%i4
	andn	%o5,	0x1192,	%i0
	fnegd	%f12,	%f14
	umul	%g2,	%g1,	%i3
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x2C] %asi,	%f24
	set	0x30, %g5
	lduba	[%l7 + %g5] 0x19,	%l6
	array32	%l5,	%o0,	%o4
	movvs	%icc,	%i7,	%o7
	fmovrdlez	%o2,	%f24,	%f2
	wr	%g0,	0x52,	%asi
	stxa	%g5,	[%g0 + 0x218] %asi
	movleu	%icc,	%l4,	%o6
	movre	%i5,	0x188,	%g6
	sra	%l1,	0x1F,	%i1
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bge,a,pt	%xcc,	loop_989
	bvc,a,pt	%icc,	loop_990
	movpos	%icc,	%l2,	%g3
	fbn	%fcc1,	loop_991
loop_989:
	orncc	%g4,	%i6,	%g7
loop_990:
	array8	%i2,	%o1,	%l3
	movn	%icc,	%l0,	%o3
loop_991:
	sethi	0x1F8D,	%o5
	movg	%xcc,	%i4,	%g2
	edge32ln	%g1,	%i3,	%i0
	nop
	fitos	%f11,	%f9
	fstoi	%f9,	%f9
	xor	%l5,	%l6,	%o4
	fbo	%fcc0,	loop_992
	movrgez	%o0,	%i7,	%o7
	bneg,a	%icc,	loop_993
	be,pn	%icc,	loop_994
loop_992:
	fpsub32	%f12,	%f24,	%f4
	wr	%g0,	0x2f,	%asi
	stwa	%g5,	[%l7 + 0x20] %asi
	membar	#Sync
loop_993:
	fnand	%f6,	%f26,	%f30
loop_994:
	xnor	%l4,	0x167F,	%o6
	tgu	%xcc,	0x0
	xorcc	%i5,	0x0321,	%o2
	flush	%l7 + 0x70
	movvs	%icc,	%l1,	%g6
	fbug	%fcc3,	loop_995
	tge	%icc,	0x1
	xor	%i1,	%l2,	%g3
	movrgez	%i6,	0x27C,	%g4
loop_995:
	fmovdcc	%xcc,	%f18,	%f0
	te	%xcc,	0x2
	set	0x60, %o3
	ldda	[%l7 + %o3] 0xe2,	%i2
	fpsub32s	%f19,	%f13,	%f6
	ld	[%l7 + 0x18],	%f8
	srl	%g7,	0x07,	%o1
	edge16	%l0,	%o3,	%l3
	andcc	%i4,	%g2,	%g1
	fbl,a	%fcc2,	loop_996
	mova	%xcc,	%i3,	%i0
	sdivcc	%o5,	0x166A,	%l5
	andn	%o4,	0x0579,	%o0
loop_996:
	fpack16	%f4,	%f9
	be,a,pt	%icc,	loop_997
	mulscc	%l6,	0x02E1,	%i7
	movg	%xcc,	%g5,	%o7
	addcc	%l4,	%i5,	%o2
loop_997:
	brnz,a	%o6,	loop_998
	stb	%g6,	[%l7 + 0x7C]
	udiv	%i1,	0x0203,	%l2
	array16	%l1,	%g3,	%i6
loop_998:
	fmovdpos	%xcc,	%f29,	%f16
	bvc,a,pn	%icc,	loop_999
	mova	%icc,	%g4,	%i2
	flush	%l7 + 0x6C
	fbo,a	%fcc3,	loop_1000
loop_999:
	movcc	%icc,	%g7,	%l0
	movle	%xcc,	%o3,	%l3
	udiv	%i4,	0x0CE2,	%o1
loop_1000:
	fors	%f3,	%f10,	%f2
	mova	%icc,	%g1,	%g2
	ldub	[%l7 + 0x34],	%i0
	movrgz	%i3,	0x1F4,	%o5
	edge32n	%l5,	%o4,	%l6
	alignaddrl	%i7,	%g5,	%o7
	xnorcc	%l4,	%o0,	%o2
	set	0x18, %o1
	stwa	%i5,	[%l7 + %o1] 0xea
	membar	#Sync
	sdivcc	%g6,	0x1811,	%o6
	sll	%l2,	%i1,	%g3
	stb	%i6,	[%l7 + 0x41]
	call	loop_1001
	sll	%l1,	%i2,	%g7
	fbl,a	%fcc1,	loop_1002
	brz,a	%g4,	loop_1003
loop_1001:
	fmovsleu	%icc,	%f22,	%f24
	add	%l7,	0x60,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l0,	%o3
loop_1002:
	fmuld8sux16	%f15,	%f0,	%f22
loop_1003:
	fbo,a	%fcc2,	loop_1004
	fba	%fcc3,	loop_1005
	xnorcc	%i4,	%l3,	%g1
	fbne	%fcc3,	loop_1006
loop_1004:
	srlx	%g2,	0x13,	%i0
loop_1005:
	bgu,a,pn	%xcc,	loop_1007
	movcc	%icc,	%i3,	%o1
loop_1006:
	edge16n	%l5,	%o5,	%o4
	st	%f6,	[%l7 + 0x28]
loop_1007:
	movrgz	%l6,	0x202,	%g5
	srl	%i7,	%l4,	%o7
	sub	%o2,	%i5,	%g6
	movl	%icc,	%o6,	%o0
	sll	%i1,	%l2,	%g3
	tn	%icc,	0x1
	move	%xcc,	%l1,	%i2
	fbl,a	%fcc0,	loop_1008
	taddcc	%i6,	%g4,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x62, %i3
	sth	%g7,	[%l7 + %i3]
loop_1008:
	nop
	setx	0x02ABDDF1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x30D7506F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f24,	%f20
	fornot1	%f26,	%f18,	%f8
	fbule,a	%fcc2,	loop_1009
	tcc	%icc,	0x6
	prefetch	[%l7 + 0x6C],	 0x0
	tneg	%icc,	0x7
loop_1009:
	brz	%o3,	loop_1010
	mova	%xcc,	%i4,	%l3
	movleu	%icc,	%g2,	%g1
	fpmerge	%f11,	%f22,	%f22
loop_1010:
	fxnors	%f17,	%f24,	%f9
	nop
	setx loop_1011, %l0, %l1
	jmpl %l1, %i3
	fmul8x16au	%f3,	%f22,	%f8
	te	%icc,	0x4
	sub	%o1,	0x0A4A,	%i0
loop_1011:
	tpos	%icc,	0x0
	sll	%l5,	0x00,	%o5
	stb	%l6,	[%l7 + 0x21]
	edge32n	%g5,	%o4,	%l4
	movle	%xcc,	%i7,	%o2
	fmovdn	%xcc,	%f16,	%f17
	fmovdleu	%xcc,	%f29,	%f19
	tge	%icc,	0x6
	fble	%fcc3,	loop_1012
	lduw	[%l7 + 0x3C],	%i5
	movgu	%xcc,	%g6,	%o7
	tle	%icc,	0x7
loop_1012:
	popc	0x16DB,	%o0
	fbule,a	%fcc3,	loop_1013
	tn	%xcc,	0x0
	movgu	%icc,	%o6,	%l2
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x76] %asi,	%g3
loop_1013:
	fbug	%fcc1,	loop_1014
	fbule,a	%fcc1,	loop_1015
	fmovdl	%xcc,	%f31,	%f0
	xor	%i1,	%l1,	%i2
loop_1014:
	sth	%i6,	[%l7 + 0x56]
loop_1015:
	nop
	wr	%g0,	0x2a,	%asi
	stwa	%l0,	[%l7 + 0x1C] %asi
	membar	#Sync
	fmovrse	%g4,	%f11,	%f24
	tvc	%icc,	0x4
	movl	%xcc,	%o3,	%i4
	set	0x64, %l6
	stha	%l3,	[%l7 + %l6] 0xeb
	membar	#Sync
	fmovsgu	%icc,	%f3,	%f4
	fbe	%fcc1,	loop_1016
	fxnors	%f25,	%f1,	%f23
	set	0x0A, %o4
	lduba	[%l7 + %o4] 0x81,	%g7
loop_1016:
	array8	%g2,	%i3,	%g1
	sll	%o1,	0x0F,	%l5
	tle	%xcc,	0x7
	fcmpne32	%f18,	%f16,	%o5
	edge32n	%l6,	%i0,	%g5
	nop
	fitod	%f6,	%f30
	fdtoi	%f30,	%f16
	brnz	%l4,	loop_1017
	xnor	%o4,	%i7,	%o2
	alignaddrl	%i5,	%g6,	%o7
	fpsub32	%f2,	%f22,	%f20
loop_1017:
	tne	%icc,	0x0
	array16	%o6,	%l2,	%g3
	for	%f28,	%f6,	%f20
	umul	%i1,	0x19CA,	%l1
	tle	%icc,	0x7
	fbo,a	%fcc1,	loop_1018
	bne,pn	%xcc,	loop_1019
	fbe,a	%fcc2,	loop_1020
	fmovrsgz	%o0,	%f9,	%f30
loop_1018:
	popc	0x0868,	%i6
loop_1019:
	tle	%xcc,	0x2
loop_1020:
	fmovdvs	%xcc,	%f23,	%f12
	for	%f0,	%f26,	%f6
	fmovsleu	%icc,	%f26,	%f25
	fnot1s	%f3,	%f3
	movcs	%xcc,	%l0,	%i2
	tsubcctv	%o3,	0x1937,	%i4
	addc	%g4,	0x0F34,	%g7
	smul	%g2,	%l3,	%i3
	flush	%l7 + 0x60
	nop
	set	0x0C, %i2
	stw	%g1,	[%l7 + %i2]
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x16] %asi,	%l5
	sdivx	%o1,	0x0F0C,	%l6
	movrgz	%i0,	0x3BE,	%g5
	fmuld8ulx16	%f20,	%f15,	%f28
	edge8	%l4,	%o5,	%i7
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%o2
	fbuge	%fcc1,	loop_1021
	orn	%i5,	%g6,	%o4
	fmovse	%xcc,	%f30,	%f23
	addcc	%o6,	0x19C5,	%o7
loop_1021:
	srlx	%l2,	0x06,	%i1
	movre	%g3,	%o0,	%l1
	srlx	%i6,	0x03,	%l0
	addccc	%i2,	0x0648,	%o3
	taddcctv	%i4,	%g4,	%g7
	fblg	%fcc3,	loop_1022
	swap	[%l7 + 0x14],	%l3
	mulscc	%i3,	%g1,	%l5
	or	%g2,	%l6,	%i0
loop_1022:
	edge32n	%g5,	%o1,	%o5
	movcs	%xcc,	%l4,	%i7
	umulcc	%o2,	%g6,	%i5
	addc	%o4,	%o6,	%l2
	fmovsleu	%xcc,	%f1,	%f12
	move	%icc,	%i1,	%o7
	fsrc2s	%f16,	%f9
	xnorcc	%o0,	%l1,	%g3
	ble,a	loop_1023
	array16	%i6,	%l0,	%i2
	edge16n	%o3,	%g4,	%g7
	sllx	%i4,	%l3,	%g1
loop_1023:
	smul	%l5,	%g2,	%i3
	fmovda	%icc,	%f2,	%f19
	nop
	set	0x40, %g3
	ldx	[%l7 + %g3],	%i0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x40] %asi,	%l6
	tgu	%xcc,	0x4
	fbne,a	%fcc3,	loop_1024
	edge16n	%o1,	%g5,	%o5
	fbuge,a	%fcc3,	loop_1025
	bge,a	loop_1026
loop_1024:
	tcs	%xcc,	0x1
	srl	%i7,	0x03,	%l4
loop_1025:
	addccc	%g6,	0x08F0,	%i5
loop_1026:
	movrlz	%o2,	0x2A8,	%o4
	udiv	%o6,	0x1D7B,	%i1
	srlx	%o7,	%l2,	%l1
	bne	loop_1027
	fbuge	%fcc0,	loop_1028
	movrne	%g3,	0x228,	%o0
	umul	%l0,	%i6,	%o3
loop_1027:
	sllx	%i2,	%g7,	%i4
loop_1028:
	nop
	setx	0xB9E070B01FBC9385,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xD9401BC900974D4A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f24,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbug	%fcc0,	loop_1029
	nop
	setx	0xD4965BEBB0B96B62,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x279B3E4964C62605,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f22,	%f24
	fmovde	%xcc,	%f28,	%f5
	smulcc	%l3,	0x0258,	%g1
loop_1029:
	or	%l5,	%g4,	%i3
	nop
	setx loop_1030, %l0, %l1
	jmpl %l1, %i0
	sdiv	%g2,	0x04EA,	%o1
	udivx	%g5,	0x14F2,	%l6
	movcc	%xcc,	%i7,	%l4
loop_1030:
	array16	%o5,	%i5,	%o2
	movvs	%xcc,	%o4,	%g6
	movne	%icc,	%i1,	%o7
	ldub	[%l7 + 0x7E],	%l2
	st	%f6,	[%l7 + 0x7C]
	brz	%l1,	loop_1031
	movne	%xcc,	%g3,	%o6
	fandnot1	%f22,	%f22,	%f0
	nop
	fitos	%f1,	%f4
	fstod	%f4,	%f14
loop_1031:
	fmovsg	%xcc,	%f21,	%f2
	std	%f6,	[%l7 + 0x20]
	set	0x38, %o0
	ldswa	[%l7 + %o0] 0x15,	%o0
	tn	%xcc,	0x4
	fbule	%fcc2,	loop_1032
	fcmpgt32	%f2,	%f18,	%l0
	tpos	%icc,	0x6
	udiv	%o3,	0x0452,	%i6
loop_1032:
	stx	%i2,	[%l7 + 0x10]
	edge16n	%i4,	%g7,	%g1
	srl	%l3,	%g4,	%i3
	ba,pn	%icc,	loop_1033
	edge32n	%i0,	%g2,	%l5
	tgu	%icc,	0x0
	tvs	%xcc,	0x1
loop_1033:
	movge	%xcc,	%g5,	%l6
	umulcc	%o1,	%l4,	%o5
	tleu	%icc,	0x5
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x2f,	%i6
	tneg	%xcc,	0x6
	for	%f20,	%f22,	%f30
	taddcctv	%o2,	0x1B5C,	%i5
	brnz,a	%o4,	loop_1034
	orncc	%g6,	0x0F74,	%i1
	movge	%icc,	%o7,	%l2
	sdivcc	%g3,	0x0A19,	%l1
loop_1034:
	fpadd16s	%f23,	%f17,	%f23
	movneg	%xcc,	%o0,	%o6
	movrgz	%l0,	0x123,	%i6
	alignaddr	%o3,	%i4,	%i2
	mova	%icc,	%g1,	%g7
	srl	%g4,	0x1B,	%l3
	movrne	%i3,	%i0,	%l5
	fands	%f30,	%f28,	%f24
	movre	%g2,	%g5,	%l6
	fmovdle	%icc,	%f13,	%f17
	srl	%o1,	%l4,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%o2,	0x1E8B,	%i5
	nop
	set	0x78, %l3
	lduh	[%l7 + %l3],	%o5
	xnorcc	%g6,	0x006F,	%i1
	movre	%o4,	0x3E7,	%l2
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%l1
	udivcc	%o0,	0x1699,	%o7
	set	0x0C, %i0
	ldswa	[%l7 + %i0] 0x14,	%l0
	set	0x70, %i1
	stha	%i6,	[%l7 + %i1] 0x88
	movvs	%xcc,	%o3,	%o6
	fmovscc	%xcc,	%f7,	%f29
	fbul,a	%fcc1,	loop_1035
	fpadd32	%f14,	%f20,	%f14
	fones	%f15
	fpsub16	%f28,	%f28,	%f10
loop_1035:
	addcc	%i2,	%i4,	%g7
	bgu	%icc,	loop_1036
	subccc	%g4,	0x054E,	%g1
	alignaddr	%l3,	%i0,	%l5
	te	%xcc,	0x1
loop_1036:
	fmovsleu	%xcc,	%f18,	%f21
	movpos	%icc,	%g2,	%i3
	fnegd	%f26,	%f12
	fcmpgt32	%f12,	%f4,	%g5
	fbl	%fcc1,	loop_1037
	ldsb	[%l7 + 0x48],	%o1
	fba,a	%fcc3,	loop_1038
	smul	%l6,	0x16C4,	%l4
loop_1037:
	fmuld8sux16	%f12,	%f17,	%f22
	tpos	%icc,	0x7
loop_1038:
	fmuld8sux16	%f31,	%f9,	%f28
	addc	%o2,	0x0405,	%i5
	sll	%i7,	0x16,	%g6
	sethi	0x0743,	%i1
	fsrc1	%f28,	%f8
	tsubcctv	%o4,	%o5,	%l2
	brz	%l1,	loop_1039
	fandnot1	%f20,	%f16,	%f8
	movrlz	%g3,	0x390,	%o0
	fabsd	%f22,	%f14
loop_1039:
	tcs	%icc,	0x2
	fmul8x16au	%f22,	%f22,	%f10
	fsrc2s	%f3,	%f3
	or	%o7,	0x1650,	%l0
	fmovsn	%icc,	%f20,	%f4
	bpos,a,pn	%icc,	loop_1040
	movge	%xcc,	%o3,	%o6
	tge	%icc,	0x4
	tvc	%icc,	0x1
loop_1040:
	fmovrdne	%i6,	%f4,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i2,	%i4,	%g7
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x1
	tpos	%xcc,	0x3
	ld	[%l7 + 0x4C],	%f30
	tgu	%xcc,	0x4
	ldsw	[%l7 + 0x78],	%g4
	movne	%icc,	%l3,	%l5
	fxor	%f16,	%f26,	%f14
	movrgez	%g2,	0x203,	%i3
	membar	0x5E
	sdivcc	%g5,	0x1BE0,	%o1
	ba	loop_1041
	fbuge,a	%fcc1,	loop_1042
	sir	0x081E
	umul	%l6,	0x181A,	%i0
loop_1041:
	xor	%l4,	%o2,	%i5
loop_1042:
	fbe	%fcc3,	loop_1043
	movrgz	%i7,	0x3F1,	%g6
	sdiv	%i1,	0x14B0,	%o5
	brgez,a	%l2,	loop_1044
loop_1043:
	movpos	%xcc,	%o4,	%l1
	and	%o0,	%g3,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1044:
	taddcc	%o7,	0x043A,	%o3
	tpos	%xcc,	0x5
	te	%xcc,	0x7
	fbue	%fcc2,	loop_1045
	andn	%o6,	0x1E5F,	%i2
	mova	%icc,	%i4,	%i6
	movcs	%icc,	%g1,	%g4
loop_1045:
	udivcc	%l3,	0x007A,	%g7
	brgz,a	%g2,	loop_1046
	edge32l	%l5,	%i3,	%o1
	tpos	%icc,	0x2
	tsubcctv	%l6,	%i0,	%g5
loop_1046:
	movvc	%icc,	%l4,	%i5
	array32	%i7,	%g6,	%o2
	array32	%i1,	%l2,	%o5
	bcs,pt	%xcc,	loop_1047
	bneg	loop_1048
	fba	%fcc3,	loop_1049
	edge8ln	%o4,	%o0,	%l1
loop_1047:
	nop
	set	0x10, %l4
	lda	[%l7 + %l4] 0x11,	%f28
loop_1048:
	fpadd16s	%f14,	%f30,	%f30
loop_1049:
	smul	%l0,	%o7,	%g3
	nop
	setx	0x6E5DD22B4AD66624,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x5A9EC7D967279BFE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f26,	%f20
	fbue	%fcc0,	loop_1050
	srlx	%o3,	0x15,	%o6
	sdivcc	%i4,	0x0815,	%i2
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf9,	%f16
loop_1050:
	tl	%xcc,	0x1
	nop
	setx	0x0EA36848,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x69B169A9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fsubs	%f13,	%f14,	%f26
	tle	%icc,	0x1
	sub	%g1,	%i6,	%l3
	call	loop_1051
	movrlz	%g7,	%g2,	%g4
	fbul,a	%fcc2,	loop_1052
	movne	%icc,	%i3,	%o1
loop_1051:
	tgu	%xcc,	0x0
	sub	%l6,	0x0885,	%l5
loop_1052:
	ldd	[%l7 + 0x18],	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%i0,	%g5
	ldstub	[%l7 + 0x26],	%i5
	nop
	setx loop_1053, %l0, %l1
	jmpl %l1, %l4
	xorcc	%g6,	0x0B9D,	%o2
	fmuld8sux16	%f15,	%f25,	%f4
	smulcc	%i7,	%l2,	%o5
loop_1053:
	fbuge	%fcc0,	loop_1054
	subc	%i1,	%o0,	%l1
	brlez,a	%l0,	loop_1055
	std	%f20,	[%l7 + 0x48]
loop_1054:
	movrgz	%o4,	%g3,	%o7
	fbule	%fcc3,	loop_1056
loop_1055:
	edge8	%o3,	%o6,	%i4
	andn	%i2,	%g1,	%i6
	brgez,a	%g7,	loop_1057
loop_1056:
	nop
	setx	0xBB43D532E07A9E0C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	sdiv	%g2,	0x1BCF,	%l3
	sdivcc	%g4,	0x104C,	%i3
loop_1057:
	fand	%f28,	%f10,	%f0
	ld	[%l7 + 0x70],	%f19
	edge8	%o1,	%l6,	%i0
	fbug,a	%fcc1,	loop_1058
	fbule	%fcc3,	loop_1059
	xnorcc	%g5,	0x0119,	%i5
	smulcc	%l4,	%g6,	%l5
loop_1058:
	bgu,a	%icc,	loop_1060
loop_1059:
	nop
	setx	0x9B9BA89D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0x1852C2B0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fsubs	%f17,	%f31,	%f0
	set	0x74, %l5
	ldswa	[%l7 + %l5] 0x19,	%o2
loop_1060:
	sll	%i7,	0x08,	%l2
	fbo,a	%fcc0,	loop_1061
	nop
	setx	0x81820560,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0xE092FF87,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f10,	%f19
	tgu	%icc,	0x6
	umulcc	%i1,	%o0,	%o5
loop_1061:
	nop
	fitos	%f10,	%f5
	fstox	%f5,	%f14
	fxtos	%f14,	%f17
	udivx	%l1,	0x0039,	%o4
	sir	0x1DD6
	fbne,a	%fcc3,	loop_1062
	fpadd32s	%f14,	%f3,	%f0
	nop
	setx	0x85DDBF6669A3E481,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x896E23594CE76E20,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f18,	%f28
	ldd	[%l7 + 0x10],	%f2
loop_1062:
	ldstub	[%l7 + 0x0F],	%l0
	edge8	%o7,	%o3,	%g3
	taddcctv	%i4,	0x04C0,	%o6
	fmovscs	%xcc,	%f1,	%f9
	addc	%g1,	%i2,	%g7
	fbule,a	%fcc1,	loop_1063
	movvc	%xcc,	%g2,	%i6
	fmovsleu	%icc,	%f29,	%f8
	addcc	%l3,	%i3,	%o1
loop_1063:
	umulcc	%g4,	%l6,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x7
	edge16n	%i5,	%l4,	%i0
	tpos	%icc,	0x5
	alignaddr	%l5,	%g6,	%i7
	movleu	%icc,	%l2,	%o2
	movpos	%icc,	%o0,	%i1
	sub	%o5,	0x1F21,	%o4
	sethi	0x04BB,	%l1
	stbar
	add	%o7,	%o3,	%g3
	umulcc	%i4,	0x05A2,	%l0
	brgez,a	%g1,	loop_1064
	fmul8sux16	%f26,	%f12,	%f22
	bneg,pn	%xcc,	loop_1065
	nop
	setx	loop_1066,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1064:
	movge	%xcc,	%o6,	%g7
	fbuge	%fcc2,	loop_1067
loop_1065:
	nop
	fitod	%f10,	%f12
	fdtos	%f12,	%f13
loop_1066:
	fbu	%fcc2,	loop_1068
	fnands	%f27,	%f16,	%f25
loop_1067:
	fmovdle	%icc,	%f31,	%f13
	srl	%i2,	%i6,	%l3
loop_1068:
	fnands	%f23,	%f4,	%f16
	nop
	set	0x3F, %g2
	ldub	[%l7 + %g2],	%g2
	movrgez	%o1,	0x1FC,	%i3
	taddcc	%l6,	0x1D96,	%g5
	bge,a	loop_1069
	fblg,a	%fcc2,	loop_1070
	movcc	%icc,	%g4,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1069:
	tpos	%xcc,	0x6
loop_1070:
	smulcc	%i0,	0x1617,	%l5
	fba	%fcc2,	loop_1071
	fandnot1	%f0,	%f16,	%f12
	nop
	setx	0xA678BA7FD6C9E614,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC08A0C956E9DBBA4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f30,	%f16
	stbar
loop_1071:
	sir	0x11E5
	or	%g6,	0x1748,	%l4
	sir	0x0B64
	xorcc	%i7,	%l2,	%o0
	fmovsl	%icc,	%f23,	%f3
	tcs	%icc,	0x0
	andncc	%o2,	%i1,	%o4
	nop
	fitos	%f24,	%f17
	movneg	%icc,	%o5,	%o7
	fbug	%fcc1,	loop_1072
	taddcctv	%l1,	%g3,	%o3
	tl	%icc,	0x1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1072:
	srlx	%i4,	0x00,	%g1
	umul	%l0,	%o6,	%g7
	fmovdpos	%xcc,	%f5,	%f19
	movpos	%icc,	%i2,	%i6
	fornot1s	%f8,	%f24,	%f21
	and	%g2,	0x0764,	%o1
	sdivcc	%l3,	0x12F0,	%l6
	bvc,a,pn	%icc,	loop_1073
	umulcc	%g5,	0x1AC5,	%g4
	fbu	%fcc2,	loop_1074
	orncc	%i3,	0x1C2E,	%i5
loop_1073:
	fbu	%fcc2,	loop_1075
	srl	%i0,	%g6,	%l4
loop_1074:
	fabss	%f9,	%f29
	tg	%icc,	0x0
loop_1075:
	alignaddrl	%i7,	%l5,	%l2
	bvs,a,pn	%icc,	loop_1076
	movne	%xcc,	%o0,	%i1
	faligndata	%f14,	%f28,	%f12
	fmul8x16al	%f24,	%f12,	%f22
loop_1076:
	edge8	%o2,	%o5,	%o4
	brnz,a	%l1,	loop_1077
	tsubcctv	%g3,	%o3,	%i4
	orn	%o7,	%l0,	%g1
	fpsub16s	%f3,	%f19,	%f13
loop_1077:
	movcs	%xcc,	%o6,	%i2
	nop
	fitos	%f11,	%f1
	fstod	%f1,	%f28
	movrne	%i6,	0x1F9,	%g2
	array32	%g7,	%o1,	%l6
	array8	%g5,	%l3,	%g4
	xor	%i5,	0x072D,	%i0
	bgu	loop_1078
	orncc	%i3,	0x0B8A,	%l4
	addcc	%g6,	0x0CF0,	%l5
	alignaddr	%l2,	%i7,	%o0
loop_1078:
	fbge,a	%fcc1,	loop_1079
	orncc	%o2,	%o5,	%i1
	movgu	%xcc,	%o4,	%g3
	movn	%icc,	%o3,	%l1
loop_1079:
	fmovsvs	%xcc,	%f27,	%f0
	fors	%f29,	%f0,	%f24
	bge,pt	%xcc,	loop_1080
	tsubcctv	%i4,	0x14DA,	%l0
	edge32ln	%g1,	%o7,	%i2
	stb	%i6,	[%l7 + 0x1E]
loop_1080:
	nop
	setx loop_1081, %l0, %l1
	jmpl %l1, %o6
	fmovdleu	%xcc,	%f3,	%f17
	udivx	%g7,	0x046D,	%o1
	fornot2	%f14,	%f20,	%f18
loop_1081:
	nop
	fitos	%f14,	%f13
	fstox	%f13,	%f18
	fxtos	%f18,	%f31
	nop
	fitos	%f8,	%f17
	fstox	%f17,	%f6
	tn	%icc,	0x0
	ba,a,pt	%xcc,	loop_1082
	srl	%l6,	0x13,	%g5
	ldd	[%l7 + 0x58],	%f20
	sllx	%l3,	%g4,	%i5
loop_1082:
	fbge,a	%fcc2,	loop_1083
	edge16	%i0,	%i3,	%g2
	fsrc1	%f10,	%f12
	or	%g6,	0x0B9A,	%l5
loop_1083:
	tvs	%xcc,	0x6
	smul	%l4,	0x0994,	%l2
	brlez	%o0,	loop_1084
	fandnot2	%f22,	%f6,	%f12
	edge16	%o2,	%o5,	%i1
	tsubcctv	%i7,	0x1E36,	%g3
loop_1084:
	nop
	setx	0xF0739470,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	array8	%o4,	%o3,	%l1
	fbg	%fcc1,	loop_1085
	srax	%i4,	0x0A,	%g1
	movpos	%icc,	%o7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1085:
	bge,pt	%xcc,	loop_1086
	nop
	set	0x36, %i5
	lduh	[%l7 + %i5],	%i2
	ldx	[%l7 + 0x28],	%o6
	fbg	%fcc1,	loop_1087
loop_1086:
	taddcc	%i6,	%o1,	%l6
	set	0x64, %l1
	lduwa	[%l7 + %l1] 0x0c,	%g7
loop_1087:
	xnorcc	%g5,	%l3,	%g4
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x19
	fsrc1s	%f4,	%f13
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1F77,	%i5
	umulcc	%i0,	%g2,	%g6
	tneg	%icc,	0x1
	movpos	%icc,	%i3,	%l4
	fmovse	%xcc,	%f3,	%f25
	bvc,pn	%icc,	loop_1088
	fmul8x16au	%f30,	%f29,	%f20
	tge	%xcc,	0x4
	fbe	%fcc0,	loop_1089
loop_1088:
	fxnor	%f8,	%f18,	%f2
	array16	%l5,	%o0,	%l2
	fnot1	%f8,	%f2
loop_1089:
	umulcc	%o5,	0x1B6B,	%i1
	fbn,a	%fcc0,	loop_1090
	xnorcc	%o2,	%i7,	%g3
	edge16	%o4,	%o3,	%l1
	fand	%f16,	%f2,	%f26
loop_1090:
	add	%g1,	0x0C16,	%i4
	fbule	%fcc0,	loop_1091
	bcs,a,pt	%xcc,	loop_1092
	edge16n	%o7,	%l0,	%o6
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1091:
	fmovrsgez	%i2,	%f5,	%f20
loop_1092:
	nop
	setx	loop_1093,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fexpand	%f9,	%f20
	smul	%o1,	0x0B42,	%i6
	fbo,a	%fcc3,	loop_1094
loop_1093:
	movn	%icc,	%l6,	%g5
	movpos	%xcc,	%l3,	%g4
	fbge,a	%fcc3,	loop_1095
loop_1094:
	nop
	fitod	%f8,	%f22
	fbug,a	%fcc0,	loop_1096
	fmovrdlz	%g7,	%f16,	%f6
loop_1095:
	movleu	%xcc,	%i0,	%i5
	movcc	%xcc,	%g6,	%i3
loop_1096:
	tsubcctv	%g2,	%l4,	%o0
	nop
	fitod	%f19,	%f0
	movrgz	%l5,	0x25E,	%l2
	andncc	%o5,	%i1,	%o2
	tneg	%xcc,	0x4
	tpos	%xcc,	0x7
	edge8ln	%g3,	%o4,	%o3
	fbue	%fcc1,	loop_1097
	bge,a,pn	%xcc,	loop_1098
	tn	%icc,	0x6
	fbo,a	%fcc2,	loop_1099
loop_1097:
	fmovspos	%icc,	%f20,	%f31
loop_1098:
	fpsub32	%f16,	%f4,	%f10
	fmovspos	%icc,	%f19,	%f9
loop_1099:
	fones	%f11
	array16	%l1,	%g1,	%i4
	fcmpeq32	%f20,	%f8,	%o7
	xorcc	%l0,	0x04D2,	%o6
	fbule,a	%fcc3,	loop_1100
	fbue,a	%fcc3,	loop_1101
	fnand	%f26,	%f10,	%f22
	bg,a	%icc,	loop_1102
loop_1100:
	fblg	%fcc1,	loop_1103
loop_1101:
	fmovdvc	%icc,	%f11,	%f29
	fbug,a	%fcc1,	loop_1104
loop_1102:
	edge8n	%i7,	%o1,	%i2
loop_1103:
	fpadd16s	%f1,	%f15,	%f17
	sra	%i6,	0x11,	%l6
loop_1104:
	mulscc	%g5,	%l3,	%g7
	fmovdneg	%xcc,	%f18,	%f5
	ldx	[%l7 + 0x18],	%i0
	tvc	%xcc,	0x2
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x50] %asi,	%g4
	array16	%i5,	%i3,	%g6
	fnot2s	%f15,	%f24
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g2
	umulcc	%l4,	%l5,	%o0
	sllx	%l2,	0x15,	%o5
	fmovdgu	%icc,	%f29,	%f31
	fbg,a	%fcc2,	loop_1105
	tneg	%icc,	0x5
	sra	%i1,	%o2,	%g3
	fmovrse	%o4,	%f1,	%f27
loop_1105:
	movrgz	%l1,	0x2E5,	%o3
	tgu	%xcc,	0x1
	te	%xcc,	0x3
	fzeros	%f3
	fxnors	%f27,	%f15,	%f20
	smulcc	%g1,	%o7,	%i4
	mulscc	%o6,	0x1924,	%l0
	array8	%i7,	%i2,	%o1
	edge8	%i6,	%g5,	%l3
	tl	%xcc,	0x5
	movrne	%l6,	0x2DA,	%g7
	tcc	%xcc,	0x0
	xor	%g4,	0x09DF,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i0,	0x03AA,	%g6
	fbue	%fcc1,	loop_1106
	te	%icc,	0x4
	movrlez	%i3,	%l4,	%l5
	sdiv	%g2,	0x1FF0,	%l2
loop_1106:
	popc	0x0426,	%o0
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x48] %asi,	%i1
	udiv	%o2,	0x1364,	%o5
	alignaddrl	%g3,	%o4,	%l1
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	xorcc	%o3,	%g1,	%o7
	xnorcc	%o6,	0x1CAB,	%i4
	tneg	%icc,	0x1
	fmovsneg	%xcc,	%f2,	%f18
	pdist	%f26,	%f16,	%f18
	movge	%icc,	%i7,	%l0
	nop
	fitod	%f4,	%f10
	fdtos	%f10,	%f31
	add	%l7,	0x08,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] %asi,	%o1,	%i6
	alignaddr	%g5,	%i2,	%l3
	nop
	setx	0xD07D406D,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	lduh	[%l7 + 0x78],	%l6
	movne	%icc,	%g4,	%g7
	movn	%xcc,	%i5,	%g6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%i0
	lduw	[%l7 + 0x74],	%l4
	movcs	%xcc,	%g2,	%l2
	sth	%l5,	[%l7 + 0x2A]
	xnorcc	%i1,	0x049E,	%o0
	sdiv	%o2,	0x111F,	%o5
	tgu	%icc,	0x0
	movl	%icc,	%g3,	%o4
	tgu	%icc,	0x5
	nop
	fitod	%f6,	%f0
	fdtox	%f0,	%f12
	ldd	[%l7 + 0x48],	%f22
	andncc	%l1,	%g1,	%o3
	tl	%xcc,	0x7
	move	%xcc,	%o6,	%o7
	edge16ln	%i4,	%i7,	%o1
	tsubcctv	%l0,	0x0426,	%g5
	edge8l	%i6,	%i2,	%l3
	fpsub32	%f18,	%f16,	%f2
	fbg	%fcc0,	loop_1107
	sdivcc	%l6,	0x1846,	%g4
	call	loop_1108
	tcs	%xcc,	0x2
loop_1107:
	bcc,a,pn	%icc,	loop_1109
	edge16	%i5,	%g6,	%i3
loop_1108:
	nop
	setx	0xE06CC11F,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	movcc	%xcc,	%g7,	%l4
loop_1109:
	tge	%icc,	0x2
	sdivx	%g2,	0x1F02,	%l2
	fand	%f18,	%f28,	%f2
	be,a,pn	%xcc,	loop_1110
	alignaddrl	%i0,	%l5,	%i1
	bcc,pt	%icc,	loop_1111
	fmovrdlez	%o0,	%f12,	%f0
loop_1110:
	nop
	wr	%g0,	0x10,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
loop_1111:
	sdivcc	%g3,	0x1EF8,	%o2
	fmovsneg	%icc,	%f13,	%f17
	sub	%l1,	0x0456,	%g1
	fmovdpos	%icc,	%f22,	%f22
	fbul,a	%fcc0,	loop_1112
	tvs	%xcc,	0x1
	tcs	%xcc,	0x3
	mulscc	%o4,	0x02A3,	%o3
loop_1112:
	fxnor	%f8,	%f2,	%f2
	sll	%o6,	0x02,	%o7
	umul	%i4,	%o1,	%i7
	edge16n	%l0,	%i6,	%i2
	taddcctv	%l3,	%l6,	%g5
	call	loop_1113
	srax	%g4,	0x0C,	%i5
	or	%g6,	0x12D0,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1113:
	add	%g7,	0x0BF4,	%g2
	sir	0x0D2C
	sllx	%l4,	0x0A,	%l2
	move	%xcc,	%i0,	%i1
	set	0x4C, %g1
	ldswa	[%l7 + %g1] 0x10,	%o0
	nop
	fitod	%f3,	%f6
	movl	%xcc,	%o5,	%l5
	fmuld8ulx16	%f0,	%f14,	%f24
	stb	%g3,	[%l7 + 0x14]
	fzero	%f4
	umul	%o2,	0x0C93,	%l1
	stb	%o4,	[%l7 + 0x46]
	fbuge	%fcc1,	loop_1114
	tcc	%xcc,	0x1
	fmovsleu	%xcc,	%f29,	%f24
	srax	%o3,	0x09,	%o6
loop_1114:
	bn,pn	%icc,	loop_1115
	movn	%xcc,	%o7,	%i4
	tvc	%xcc,	0x3
	bn	loop_1116
loop_1115:
	movneg	%xcc,	%o1,	%g1
	bg	loop_1117
	orncc	%i7,	%l0,	%i6
loop_1116:
	fnegd	%f8,	%f0
	movcs	%xcc,	%l3,	%i2
loop_1117:
	nop
	add	%l7,	0x74,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%g5,	%g4
	movg	%xcc,	%i5,	%g6
	movle	%xcc,	%l6,	%g7
	fbo,a	%fcc1,	loop_1118
	movl	%icc,	%g2,	%i3
	sdivx	%l2,	0x0721,	%l4
	sra	%i0,	%o0,	%o5
loop_1118:
	nop
	set	0x18, %l2
	ldswa	[%l7 + %l2] 0x80,	%l5
	movre	%g3,	%i1,	%l1
	orcc	%o4,	%o2,	%o6
	brz,a	%o3,	loop_1119
	addccc	%o7,	%i4,	%o1
	movgu	%xcc,	%g1,	%i7
	te	%xcc,	0x5
loop_1119:
	movvs	%icc,	%i6,	%l3
	stx	%i2,	[%l7 + 0x08]
	fmovsn	%icc,	%f18,	%f14
	fmuld8sux16	%f3,	%f3,	%f2
	sdivcc	%l0,	0x1A4C,	%g5
	nop
	fitod	%f8,	%f0
	fdtox	%f0,	%f14
	tvs	%icc,	0x5
	fmovd	%f14,	%f0
	fbue	%fcc1,	loop_1120
	movneg	%xcc,	%g4,	%i5
	nop
	fitod	%f2,	%f10
	fdtoi	%f10,	%f24
	set	0x3A, %g7
	ldstuba	[%l7 + %g7] 0x10,	%l6
loop_1120:
	edge16n	%g6,	%g7,	%g2
	addc	%i3,	0x0022,	%l2
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f22
	fxtod	%f22,	%f2
	edge8l	%i0,	%o0,	%o5
	udivcc	%l5,	0x1670,	%g3
	array8	%i1,	%l4,	%l1
	movne	%icc,	%o4,	%o6
	nop
	setx	loop_1121,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fzeros	%f7
	movn	%icc,	%o2,	%o7
	movl	%xcc,	%i4,	%o1
loop_1121:
	brnz	%o3,	loop_1122
	ldsh	[%l7 + 0x76],	%g1
	sllx	%i7,	%i6,	%i2
	tleu	%xcc,	0x1
loop_1122:
	sll	%l3,	0x09,	%g5
	edge16ln	%l0,	%i5,	%g4
	srlx	%l6,	%g6,	%g7
	movg	%xcc,	%g2,	%l2
	alignaddrl	%i3,	%o0,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%o5,	%f26,	%f29
	bne	loop_1123
	fbn	%fcc2,	loop_1124
	edge32	%g3,	%i1,	%l5
	lduw	[%l7 + 0x44],	%l1
loop_1123:
	popc	0x18BE,	%o4
loop_1124:
	sir	0x1357
	fmovsgu	%icc,	%f26,	%f15
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f26,	[%l7 + 0x70]
	nop
	set	0x4A, %g4
	ldsb	[%l7 + %g4],	%l4
	tn	%xcc,	0x3
	addcc	%o6,	0x1466,	%o7
	movrlez	%o2,	0x0B3,	%o1
	movvc	%xcc,	%o3,	%g1
	taddcc	%i7,	%i4,	%i2
	set	0x0C, %i7
	lduha	[%l7 + %i7] 0x19,	%i6
	xorcc	%g5,	%l3,	%i5
	sdiv	%l0,	0x09A7,	%g4
	bge	loop_1125
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%icc,	%f4,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1125:
	fmovrdgez	%l6,	%f4,	%f6
	fmovrslez	%g6,	%f10,	%f29
	movvc	%xcc,	%g2,	%g7
	fabss	%f14,	%f19
	tcc	%icc,	0x4
	fmovscs	%icc,	%f27,	%f25
	xorcc	%l2,	%i3,	%o0
	call	loop_1126
	edge8	%i0,	%o5,	%g3
	fzero	%f4
	subccc	%i1,	0x1F5A,	%l1
loop_1126:
	udiv	%o4,	0x03C9,	%l5
	tcs	%xcc,	0x7
	andn	%l4,	0x12FB,	%o6
	ta	%icc,	0x4
	bshuffle	%f12,	%f26,	%f14
	umul	%o2,	%o7,	%o3
	movvc	%icc,	%g1,	%o1
	srl	%i4,	0x03,	%i7
	nop
	set	0x0E, %i6
	lduh	[%l7 + %i6],	%i2
	edge32n	%i6,	%g5,	%i5
	fmovscc	%icc,	%f0,	%f12
	tne	%xcc,	0x6
	alignaddrl	%l0,	%l3,	%l6
	fone	%f8
	fornot1s	%f17,	%f20,	%f4
	st	%f25,	[%l7 + 0x34]
	tneg	%xcc,	0x1
	brnz	%g4,	loop_1127
	array8	%g6,	%g2,	%g7
	bcc,a,pt	%xcc,	loop_1128
	edge32	%i3,	%o0,	%i0
loop_1127:
	subccc	%l2,	%o5,	%g3
	tvs	%icc,	0x7
loop_1128:
	nop
	set	0x20, %o6
	lduba	[%l7 + %o6] 0x14,	%i1
	fmovde	%icc,	%f12,	%f31
	brgz	%l1,	loop_1129
	fmovdvc	%xcc,	%f8,	%f4
	srl	%o4,	0x16,	%l4
	fmovsa	%xcc,	%f28,	%f26
loop_1129:
	fpadd32s	%f6,	%f22,	%f21
	udiv	%o6,	0x0D1C,	%l5
	udiv	%o2,	0x1A44,	%o7
	sdivx	%o3,	0x06BD,	%g1
	addccc	%i4,	0x024E,	%o1
	brgz	%i7,	loop_1130
	fpack32	%f12,	%f30,	%f8
	movrgz	%i6,	0x36C,	%g5
	ta	%xcc,	0x4
loop_1130:
	addcc	%i5,	0x07BD,	%l0
	fnand	%f10,	%f6,	%f18
	call	loop_1131
	tcs	%icc,	0x6
	movre	%i2,	%l3,	%l6
	move	%xcc,	%g4,	%g6
loop_1131:
	fbl,a	%fcc2,	loop_1132
	nop
	fitod	%f26,	%f4
	movgu	%xcc,	%g7,	%g2
	xorcc	%i3,	0x1F02,	%i0
loop_1132:
	sdiv	%o0,	0x17AC,	%o5
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x08] %asi,	%l2
	udivcc	%g3,	0x1A8C,	%l1
	stbar
	edge16	%o4,	%l4,	%i1
	fbe,a	%fcc0,	loop_1133
	bn	loop_1134
	tvc	%icc,	0x0
	edge8n	%l5,	%o6,	%o2
loop_1133:
	movvc	%xcc,	%o7,	%o3
loop_1134:
	fbule,a	%fcc2,	loop_1135
	sub	%i4,	%g1,	%i7
	fmovdg	%xcc,	%f2,	%f31
	movcc	%xcc,	%o1,	%g5
loop_1135:
	edge16ln	%i5,	%i6,	%i2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%l0
	udiv	%l6,	0x02D4,	%l3
	ld	[%l7 + 0x14],	%f6
	fbo	%fcc3,	loop_1136
	bl	%xcc,	loop_1137
	fmovde	%icc,	%f16,	%f5
	movcc	%icc,	%g4,	%g6
loop_1136:
	pdist	%f18,	%f4,	%f22
loop_1137:
	tg	%icc,	0x1
	sethi	0x14FF,	%g2
	sra	%g7,	%i0,	%i3
	fornot1s	%f9,	%f28,	%f24
	edge32	%o5,	%o0,	%l2
	nop
	setx	0xA8E29DFDF9EA470A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x2F7257A13679BEE3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f26,	%f14
	tgu	%xcc,	0x6
	sub	%l1,	%g3,	%o4
	nop
	setx	0xB042D7C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	orncc	%l4,	0x1D5C,	%l5
	fmovde	%icc,	%f24,	%f28
	fmovrslez	%i1,	%f7,	%f4
	brnz	%o6,	loop_1138
	subccc	%o2,	0x1229,	%o7
	ta	%icc,	0x6
	edge16	%i4,	%g1,	%o3
loop_1138:
	tleu	%xcc,	0x5
	umulcc	%i7,	%o1,	%g5
	sethi	0x0A16,	%i6
	fpackfix	%f2,	%f25
	nop
	setx	0x10411B01,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	fandnot2	%f2,	%f18,	%f26
	set	0x22, %l0
	lduba	[%l7 + %l0] 0x14,	%i5
	brlz	%l0,	loop_1139
	array32	%i2,	%l6,	%g4
	edge16n	%g6,	%l3,	%g7
	edge16l	%i0,	%g2,	%i3
loop_1139:
	fornot1s	%f2,	%f26,	%f28
	st	%f24,	[%l7 + 0x64]
	fmovdneg	%xcc,	%f13,	%f21
	fbule,a	%fcc1,	loop_1140
	brnz	%o5,	loop_1141
	edge32ln	%o0,	%l1,	%g3
	fmovdvc	%icc,	%f31,	%f10
loop_1140:
	fmovscc	%xcc,	%f1,	%f6
loop_1141:
	fpadd16s	%f31,	%f19,	%f27
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f28
	brnz,a	%o4,	loop_1142
	tsubcctv	%l2,	0x1951,	%l4
	bg,a	%icc,	loop_1143
	fmovspos	%icc,	%f30,	%f22
loop_1142:
	stb	%l5,	[%l7 + 0x23]
	taddcc	%i1,	0x1F29,	%o2
loop_1143:
	mulscc	%o7,	0x02F4,	%i4
	movrgz	%g1,	0x2E5,	%o3
	orn	%o6,	0x01A4,	%o1
	edge16ln	%g5,	%i7,	%i5
	sir	0x1A9E
	movrgez	%l0,	0x1ED,	%i6
	tvs	%xcc,	0x6
	fmovdgu	%icc,	%f28,	%f14
	std	%f12,	[%l7 + 0x20]
	addccc	%i2,	%l6,	%g6
	tl	%xcc,	0x1
	taddcc	%l3,	%g4,	%g7
	sdivcc	%g2,	0x0809,	%i0
	tleu	%icc,	0x7
	fcmpne32	%f16,	%f12,	%i3
	fmovdvs	%xcc,	%f25,	%f7
	orcc	%o0,	%l1,	%g3
	fmovdg	%icc,	%f17,	%f26
	fsrc2s	%f7,	%f11
	fmuld8ulx16	%f20,	%f27,	%f12
	fbul,a	%fcc1,	loop_1144
	bneg,a,pn	%xcc,	loop_1145
	stbar
	fba,a	%fcc2,	loop_1146
loop_1144:
	subccc	%o4,	0x01E6,	%o5
loop_1145:
	fone	%f10
	set	0x0D, %o7
	lduba	[%l7 + %o7] 0x88,	%l2
loop_1146:
	add	%l4,	0x0A77,	%l5
	addc	%i1,	%o7,	%o2
	tleu	%xcc,	0x7
	set	0x1C, %o3
	lduwa	[%l7 + %o3] 0x80,	%g1
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	array32	%i4,	%o6,	%o3
	udivcc	%o1,	0x0146,	%i7
	lduh	[%l7 + 0x20],	%g5
	movrgez	%l0,	0x1FD,	%i6
	fcmple16	%f4,	%f8,	%i2
	ta	%xcc,	0x0
	xorcc	%l6,	%g6,	%i5
	fmovdcc	%icc,	%f7,	%f7
	fmovrdlz	%g4,	%f24,	%f22
	ldub	[%l7 + 0x54],	%l3
	sth	%g7,	[%l7 + 0x10]
	edge16	%g2,	%i0,	%o0
	movrne	%i3,	%g3,	%l1
	edge32n	%o4,	%l2,	%l4
	faligndata	%f16,	%f0,	%f0
	sll	%l5,	%o5,	%o7
	ldsw	[%l7 + 0x5C],	%o2
	addccc	%i1,	0x1596,	%i4
	sdiv	%g1,	0x0108,	%o3
	fbl,a	%fcc3,	loop_1147
	xnor	%o1,	%o6,	%g5
	udivx	%l0,	0x0C0D,	%i7
	bpos,a,pt	%icc,	loop_1148
loop_1147:
	ta	%icc,	0x2
	flush	%l7 + 0x14
	sra	%i6,	%l6,	%i2
loop_1148:
	tvc	%xcc,	0x1
	edge8	%g6,	%i5,	%g4
	bpos,a	%xcc,	loop_1149
	nop
	fitod	%f4,	%f22
	fdtox	%f22,	%f30
	fnegs	%f0,	%f7
	nop
	set	0x60, %g5
	ldstub	[%l7 + %g5],	%g7
loop_1149:
	or	%g2,	%l3,	%o0
	edge8l	%i0,	%g3,	%i3
	wr	%g0,	0x2b,	%asi
	stwa	%o4,	[%l7 + 0x5C] %asi
	membar	#Sync
	fand	%f8,	%f14,	%f4
	be,a	%xcc,	loop_1150
	sdivx	%l1,	0x0096,	%l4
	sir	0x042B
	nop
	setx	0x604B9AB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
loop_1150:
	fnand	%f0,	%f20,	%f2
	set	0x2E, %i3
	stha	%l5,	[%l7 + %i3] 0xe2
	membar	#Sync
	sdiv	%l2,	0x042A,	%o5
	fpadd16	%f12,	%f20,	%f4
	ldsb	[%l7 + 0x73],	%o2
	nop
	fitod	%f9,	%f16
	xnor	%o7,	%i1,	%g1
	edge16ln	%i4,	%o1,	%o3
	fbl,a	%fcc1,	loop_1151
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
	xnor	%o6,	0x1B27,	%g5
	fmovsl	%xcc,	%f25,	%f30
loop_1151:
	nop
	setx loop_1153, %l0, %l1
	jmpl %l1, %i7
loop_1152:
	tcs	%xcc,	0x0
	bpos	%icc,	loop_1154
	movvc	%xcc,	%i6,	%l6
loop_1153:
	nop
	setx loop_1155, %l0, %l1
	jmpl %l1, %i2
	umulcc	%g6,	%i5,	%g4
loop_1154:
	fmovscs	%icc,	%f14,	%f29
	mulx	%l0,	0x167F,	%g7
loop_1155:
	srl	%g2,	%l3,	%o0
	fmovsleu	%xcc,	%f8,	%f28
	fandnot2	%f12,	%f6,	%f24
	or	%i0,	%i3,	%o4
	tl	%xcc,	0x4
	fpsub32	%f6,	%f18,	%f28
	stbar
	addccc	%l1,	0x09AF,	%g3
	edge8n	%l4,	%l5,	%o5
	fandnot1	%f8,	%f12,	%f18
	fblg	%fcc3,	loop_1156
	movne	%xcc,	%o2,	%o7
	orcc	%i1,	%l2,	%g1
	edge32l	%o1,	%i4,	%o3
loop_1156:
	fzeros	%f12
	orncc	%g5,	%i7,	%o6
	call	loop_1157
	fmuld8ulx16	%f7,	%f8,	%f28
	nop
	set	0x46, %l6
	sth	%l6,	[%l7 + %l6]
	mova	%xcc,	%i6,	%g6
loop_1157:
	ldsb	[%l7 + 0x67],	%i2
	sdivx	%g4,	0x0DEC,	%i5
	nop
	fitod	%f4,	%f6
	taddcctv	%l0,	%g2,	%l3
	sir	0x1EAD
	smulcc	%o0,	%i0,	%i3
	fbl	%fcc1,	loop_1158
	fmovsa	%icc,	%f3,	%f27
	tcs	%icc,	0x7
	addcc	%g7,	0x0871,	%l1
loop_1158:
	movge	%xcc,	%o4,	%l4
	subccc	%l5,	0x08C2,	%g3
	fmovsge	%xcc,	%f17,	%f0
	movrne	%o2,	%o5,	%i1
	fands	%f18,	%f0,	%f3
	udivcc	%l2,	0x16A0,	%g1
	sdiv	%o7,	0x1322,	%o1
	fpsub32	%f6,	%f30,	%f20
	fbule	%fcc1,	loop_1159
	sdiv	%i4,	0x025E,	%o3
	fornot1	%f30,	%f22,	%f16
	bvs,pt	%xcc,	loop_1160
loop_1159:
	alignaddr	%i7,	%o6,	%l6
	array16	%i6,	%g5,	%g6
	fsrc1s	%f29,	%f20
loop_1160:
	nop
	setx	0x89AD4010B04D5573,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	movcc	%icc,	%g4,	%i2
	set	0x66, %o1
	ldsha	[%l7 + %o1] 0x15,	%l0
	set	0x6B, %o4
	ldstuba	[%l7 + %o4] 0x18,	%i5
	nop
	fitos	%f2,	%f28
	fstod	%f28,	%f24
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x0C] %asi,	%g2
	fbl	%fcc0,	loop_1161
	nop
	fitos	%f2,	%f24
	fstod	%f24,	%f10
	udivcc	%l3,	0x03B7,	%i0
	edge8ln	%i3,	%o0,	%g7
loop_1161:
	or	%o4,	%l1,	%l5
	fnot2	%f14,	%f16
	sll	%g3,	0x15,	%l4
	xnorcc	%o2,	0x1BA0,	%o5
	ba,pn	%icc,	loop_1162
	movl	%xcc,	%i1,	%g1
	or	%o7,	%l2,	%i4
	fzero	%f10
loop_1162:
	mulx	%o3,	0x17D6,	%o1
	movrlz	%i7,	%l6,	%i6
	udivx	%g5,	0x0E84,	%o6
	stbar
	tneg	%xcc,	0x0
	srl	%g6,	0x02,	%g4
	sethi	0x194C,	%l0
	be,pn	%icc,	loop_1163
	fbge,a	%fcc1,	loop_1164
	movrgez	%i5,	0x187,	%i2
	addc	%g2,	0x0038,	%i0
loop_1163:
	prefetch	[%l7 + 0x28],	 0x2
loop_1164:
	fcmple16	%f12,	%f0,	%i3
	membar	0x30
	fpadd16	%f28,	%f10,	%f2
	mulscc	%l3,	0x0BD8,	%o0
	sdivcc	%o4,	0x00B1,	%l1
	flush	%l7 + 0x68
	fbue,a	%fcc2,	loop_1165
	sllx	%g7,	%l5,	%g3
	set	0x1C, %g3
	ldswa	[%l7 + %g3] 0x14,	%o2
loop_1165:
	smul	%o5,	0x1C0B,	%l4
	xor	%g1,	%o7,	%i1
	te	%xcc,	0x0
	fbl	%fcc0,	loop_1166
	orncc	%i4,	%o3,	%l2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o1,	%l6
loop_1166:
	nop
	wr	%g0,	0x2f,	%asi
	stha	%i6,	[%l7 + 0x5C] %asi
	membar	#Sync
	stb	%i7,	[%l7 + 0x13]
	srax	%g5,	0x08,	%g6
	tsubcc	%o6,	0x0FEB,	%l0
	fnot1s	%f13,	%f27
	fmovrdlz	%g4,	%f22,	%f2
	popc	%i2,	%i5
	nop
	setx	loop_1167,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbne,a	%fcc3,	loop_1168
	fsrc1	%f24,	%f0
	mova	%icc,	%g2,	%i3
loop_1167:
	tl	%xcc,	0x5
loop_1168:
	fcmple32	%f24,	%f28,	%i0
	fxnors	%f29,	%f28,	%f9
	membar	0x0C
	fbuge	%fcc2,	loop_1169
	bpos,pn	%xcc,	loop_1170
	edge16l	%l3,	%o0,	%o4
	movcs	%xcc,	%g7,	%l1
loop_1169:
	udivcc	%g3,	0x0A00,	%o2
loop_1170:
	bg,a	%icc,	loop_1171
	tcs	%xcc,	0x7
	movvc	%icc,	%l5,	%l4
	tvs	%icc,	0x6
loop_1171:
	popc	%o5,	%o7
	xnor	%i1,	0x00B6,	%g1
	flush	%l7 + 0x34
	fandnot1	%f16,	%f4,	%f16
	nop
	setx	loop_1172,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16ln	%i4,	%l2,	%o1
	sir	0x015A
	sll	%o3,	0x0F,	%l6
loop_1172:
	fmovsneg	%icc,	%f23,	%f16
	fbe	%fcc2,	loop_1173
	fmovrsgez	%i7,	%f27,	%f2
	call	loop_1174
	nop
	setx	loop_1175,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1173:
	fnegd	%f22,	%f18
	nop
	setx	0xC11FAC3FE9EE6A8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x9756B50CC126F2D4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f18,	%f26
loop_1174:
	alignaddrl	%g5,	%g6,	%o6
loop_1175:
	movl	%xcc,	%i6,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x6
	fpadd16	%f16,	%f30,	%f26
	set	0x68, %i2
	prefetcha	[%l7 + %i2] 0x14,	 0x2
	stx	%i5,	[%l7 + 0x50]
	tgu	%icc,	0x1
	bg,a	loop_1176
	subccc	%l0,	0x0EA3,	%i3
	smulcc	%i0,	%l3,	%g2
	add	%l7,	0x28,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%o4
	casxa	[%l6] 0x0c,	%o4,	%g7
loop_1176:
	movvs	%icc,	%o0,	%l1
	movn	%icc,	%g3,	%l5
	fbg,a	%fcc2,	loop_1177
	ta	%icc,	0x2
	sra	%o2,	0x0F,	%o5
	fcmpeq16	%f0,	%f20,	%o7
loop_1177:
	fblg	%fcc0,	loop_1178
	orn	%i1,	0x11B0,	%g1
	or	%i4,	%l2,	%o1
	tleu	%icc,	0x2
loop_1178:
	nop
	setx	0x63EF408E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	fsqrts	%f24,	%f14
	nop
	setx	0x496FCA8B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x9B7B3FA6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f0,	%f10
	fmovdgu	%xcc,	%f14,	%f31
	tcc	%icc,	0x3
	tcc	%xcc,	0x4
	udivx	%l4,	0x1A8A,	%o3
	orncc	%l6,	%i7,	%g6
	edge32	%o6,	%i6,	%g5
	andncc	%g4,	%i2,	%l0
	edge16ln	%i3,	%i0,	%i5
	udivx	%l3,	0x0449,	%g2
	fnot2s	%f8,	%f18
	set	0x1C, %i4
	ldsha	[%l7 + %i4] 0x14,	%o4
	nop
	set	0x24, %l3
	ldub	[%l7 + %l3],	%g7
	fbug	%fcc3,	loop_1179
	fones	%f14
	ldstub	[%l7 + 0x3C],	%l1
	fbuge	%fcc1,	loop_1180
loop_1179:
	mulx	%o0,	%l5,	%o2
	taddcc	%g3,	0x177C,	%o5
	sdiv	%o7,	0x1EBF,	%i1
loop_1180:
	fxnors	%f27,	%f28,	%f0
	bcc,pn	%xcc,	loop_1181
	movle	%xcc,	%g1,	%l2
	edge8	%o1,	%l4,	%i4
	ldsw	[%l7 + 0x54],	%o3
loop_1181:
	fbue,a	%fcc1,	loop_1182
	xorcc	%l6,	0x13E6,	%g6
	and	%o6,	0x0523,	%i6
	alignaddrl	%g5,	%g4,	%i7
loop_1182:
	edge32	%l0,	%i3,	%i0
	addc	%i5,	0x0D54,	%l3
	sra	%g2,	0x1E,	%o4
	edge16ln	%i2,	%g7,	%o0
	fbe	%fcc1,	loop_1183
	tgu	%xcc,	0x5
	nop
	set	0x5B, %o0
	ldub	[%l7 + %o0],	%l1
	bvs,a,pn	%icc,	loop_1184
loop_1183:
	tsubcctv	%l5,	%g3,	%o5
	stw	%o7,	[%l7 + 0x34]
	lduh	[%l7 + 0x3A],	%o2
loop_1184:
	tpos	%xcc,	0x4
	edge32n	%i1,	%l2,	%g1
	movpos	%icc,	%l4,	%o1
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x1A] %asi,	%o3
	movrgz	%l6,	%g6,	%i4
	for	%f4,	%f22,	%f4
	ba,a	%xcc,	loop_1185
	movvc	%icc,	%o6,	%i6
	movvc	%xcc,	%g4,	%g5
	movvs	%icc,	%i7,	%l0
loop_1185:
	nop
	setx	0x4E9CD04A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x9C93A319,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f6,	%f17
	fcmpne32	%f4,	%f12,	%i0
	tcc	%xcc,	0x4
	fbo,a	%fcc1,	loop_1186
	array8	%i5,	%l3,	%g2
	set	0x40, %i1
	ldxa	[%l7 + %i1] 0x0c,	%i3
loop_1186:
	array8	%o4,	%g7,	%o0
	bgu,pt	%icc,	loop_1187
	membar	0x7E
	ba,pn	%icc,	loop_1188
	fxors	%f18,	%f3,	%f24
loop_1187:
	fmul8x16au	%f3,	%f18,	%f8
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] 0x88,	%l1,	%l5
loop_1188:
	movgu	%icc,	%g3,	%i2
	sllx	%o7,	0x09,	%o2
	ldub	[%l7 + 0x17],	%o5
	movrgez	%i1,	0x1F9,	%g1
	fbg,a	%fcc2,	loop_1189
	smulcc	%l4,	0x1890,	%o1
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x1B] %asi,	%l2
loop_1189:
	sllx	%o3,	0x06,	%l6
	addc	%g6,	%i4,	%i6
	tne	%icc,	0x1
	tcc	%xcc,	0x7
	subcc	%g4,	0x04BF,	%g5
	bg	%xcc,	loop_1190
	addccc	%i7,	0x1E8D,	%l0
	add	%i0,	0x0C06,	%i5
	swap	[%l7 + 0x64],	%l3
loop_1190:
	movrgez	%o6,	%i3,	%o4
	tpos	%xcc,	0x2
	nop
	fitos	%f8,	%f0
	array16	%g2,	%g7,	%l1
	nop
	setx	0x96784E9E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x1ECF3F29,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f4,	%f23
	set	0x5C, %l4
	stwa	%o0,	[%l7 + %l4] 0x88
	nop
	fitos	%f9,	%f21
	fstod	%f21,	%f2
	fbu	%fcc0,	loop_1191
	fnand	%f30,	%f26,	%f8
	fzero	%f0
	move	%xcc,	%l5,	%i2
loop_1191:
	edge32n	%g3,	%o7,	%o5
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x3D] %asi,	%o2
	stx	%g1,	[%l7 + 0x30]
	fpadd32s	%f14,	%f4,	%f21
	fands	%f29,	%f0,	%f2
	orcc	%l4,	%i1,	%l2
	subcc	%o1,	%o3,	%l6
	movl	%icc,	%g6,	%i6
	sir	0x0453
	fcmpeq16	%f10,	%f6,	%i4
	edge8ln	%g5,	%i7,	%g4
	movre	%l0,	0x3B5,	%i0
	brgz,a	%l3,	loop_1192
	fmovdg	%icc,	%f8,	%f30
	srl	%o6,	0x17,	%i3
	tsubcctv	%o4,	0x1E77,	%g2
loop_1192:
	taddcc	%i5,	0x043B,	%g7
	addccc	%o0,	%l5,	%i2
	taddcctv	%l1,	%o7,	%g3
	tsubcc	%o2,	%g1,	%l4
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%l2
	bcs,a	loop_1193
	fbl	%fcc3,	loop_1194
	ta	%icc,	0x6
	movg	%xcc,	%i1,	%o1
loop_1193:
	sra	%l6,	%o3,	%i6
loop_1194:
	tsubcc	%i4,	0x1ECC,	%g6
	tle	%icc,	0x5
	udivcc	%i7,	0x0DAD,	%g5
	taddcc	%g4,	%l0,	%i0
	te	%icc,	0x3
	fmovrsgz	%l3,	%f29,	%f6
	fmovdge	%icc,	%f16,	%f24
	movne	%xcc,	%o6,	%i3
	xnor	%o4,	0x1CAD,	%i5
	edge16	%g7,	%g2,	%l5
	fble	%fcc0,	loop_1195
	tcc	%xcc,	0x5
	tn	%icc,	0x0
	andcc	%o0,	%l1,	%o7
loop_1195:
	bcs,a,pt	%icc,	loop_1196
	udivcc	%i2,	0x15EB,	%o2
	tsubcc	%g3,	0x0A10,	%l4
	fmovdn	%icc,	%f11,	%f28
loop_1196:
	tcs	%icc,	0x3
	wr	%g0,	0x89,	%asi
	stxa	%g1,	[%l7 + 0x68] %asi
	orncc	%o5,	0x128A,	%i1
	fcmpgt16	%f0,	%f28,	%o1
	srl	%l6,	0x14,	%o3
	nop
	setx	0x1CDEE0B0006ED5D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	movre	%l2,	0x23F,	%i6
	bg	%xcc,	loop_1197
	tvc	%icc,	0x0
	fbn,a	%fcc1,	loop_1198
	sll	%g6,	%i4,	%g5
loop_1197:
	ld	[%l7 + 0x10],	%f24
	or	%i7,	0x1B73,	%g4
loop_1198:
	tle	%xcc,	0x3
	movrgez	%i0,	%l0,	%o6
	fxnor	%f12,	%f24,	%f16
	fpadd16s	%f26,	%f8,	%f25
	movvs	%xcc,	%i3,	%l3
	udivcc	%o4,	0x0A27,	%i5
	fmovsle	%icc,	%f20,	%f11
	set	0x50, %o5
	lda	[%l7 + %o5] 0x89,	%f28
	fand	%f14,	%f16,	%f10
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x48] %asi,	%g2
	edge16ln	%l5,	%g7,	%o0
	ba,pn	%icc,	loop_1199
	nop
	setx	0x4007ED32D647047F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xC9188D9B230DF165,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f30,	%f0
	brz	%l1,	loop_1200
	smulcc	%o7,	%i2,	%g3
loop_1199:
	lduw	[%l7 + 0x78],	%o2
	movn	%xcc,	%g1,	%o5
loop_1200:
	ta	%xcc,	0x3
	array8	%i1,	%l4,	%o1
	sdiv	%l6,	0x04D4,	%o3
	addccc	%i6,	0x0EB9,	%g6
	edge32	%i4,	%l2,	%i7
	nop
	setx	0xD9AA01402068D19F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	te	%xcc,	0x6
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f24
	tne	%xcc,	0x4
	tl	%icc,	0x4
	fmovdvs	%xcc,	%f21,	%f19
	bvc	loop_1201
	tleu	%icc,	0x6
	edge32l	%g5,	%g4,	%l0
	ba,a,pt	%xcc,	loop_1202
loop_1201:
	subccc	%i0,	0x097A,	%i3
	sll	%o6,	0x11,	%o4
	fmovda	%icc,	%f27,	%f12
loop_1202:
	bneg,pn	%icc,	loop_1203
	bneg,a,pn	%icc,	loop_1204
	membar	0x24
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x2
loop_1203:
	fbne,a	%fcc1,	loop_1205
loop_1204:
	fmul8sux16	%f20,	%f20,	%f14
	tsubcctv	%i5,	0x0960,	%l5
	udivcc	%g7,	0x1D83,	%g2
loop_1205:
	edge32n	%l1,	%o7,	%o0
	edge8n	%i2,	%o2,	%g1
	fandnot2s	%f15,	%f4,	%f7
	nop
	setx	0x5051908D,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	orn	%g3,	%o5,	%i1
	nop
	setx	0x8C5A8DC7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x230D699B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f29,	%f6
	fmovsne	%xcc,	%f28,	%f5
	move	%icc,	%o1,	%l6
	alignaddr	%o3,	%i6,	%l4
	fmovrde	%i4,	%f12,	%f20
	stb	%g6,	[%l7 + 0x18]
	ld	[%l7 + 0x3C],	%f20
	tle	%icc,	0x4
	tsubcc	%l2,	0x18EF,	%i7
	fmovsneg	%icc,	%f27,	%f8
	umulcc	%g4,	0x0309,	%g5
	movrlz	%i0,	0x19C,	%l0
	be,a	loop_1206
	movne	%icc,	%i3,	%o4
	tcc	%xcc,	0x2
	subccc	%l3,	%o6,	%i5
loop_1206:
	udivx	%g7,	0x03F0,	%l5
	edge32	%l1,	%o7,	%o0
	bpos,a,pn	%xcc,	loop_1207
	be	loop_1208
	xnor	%i2,	0x02EF,	%o2
	fbo,a	%fcc1,	loop_1209
loop_1207:
	sll	%g1,	%g2,	%g3
loop_1208:
	fbul	%fcc1,	loop_1210
	fnot2	%f16,	%f10
loop_1209:
	st	%f22,	[%l7 + 0x20]
	sllx	%o5,	0x1C,	%o1
loop_1210:
	nop
	set	0x38, %i0
	ldswa	[%l7 + %i0] 0x88,	%l6
	fmovdcc	%xcc,	%f27,	%f20
	brgez,a	%o3,	loop_1211
	addccc	%i1,	%i6,	%i4
	edge32	%g6,	%l4,	%i7
	fornot2	%f28,	%f10,	%f24
loop_1211:
	array32	%g4,	%g5,	%i0
	fmovdn	%xcc,	%f10,	%f29
	subccc	%l0,	%i3,	%l2
	bvc,a,pn	%icc,	loop_1212
	mulx	%l3,	0x074F,	%o4
	nop
	fitos	%f6,	%f20
	edge8ln	%o6,	%i5,	%l5
loop_1212:
	xnor	%l1,	%g7,	%o0
	edge16	%i2,	%o2,	%g1
	sethi	0x08E5,	%g2
	flush	%l7 + 0x68
	movrgez	%g3,	%o5,	%o1
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%o7
	srax	%o3,	%l6,	%i6
	bge,a	%xcc,	loop_1213
	movrne	%i1,	%g6,	%l4
	tn	%xcc,	0x0
	addccc	%i7,	0x10D8,	%g4
loop_1213:
	array16	%g5,	%i4,	%i0
	fpack16	%f22,	%f10
	movn	%xcc,	%l0,	%l2
	movn	%icc,	%l3,	%o4
	tl	%xcc,	0x6
	bl,a	loop_1214
	fxnors	%f9,	%f21,	%f4
	tcs	%xcc,	0x4
	srlx	%o6,	%i5,	%i3
loop_1214:
	fmovspos	%icc,	%f27,	%f27
	fbo	%fcc2,	loop_1215
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l1,	%g7
	edge16n	%o0,	%l5,	%i2
loop_1215:
	movn	%icc,	%o2,	%g1
	movvs	%xcc,	%g2,	%g3
	movcc	%icc,	%o5,	%o1
	edge32ln	%o3,	%o7,	%l6
	set	0x24, %g2
	lduha	[%l7 + %g2] 0x88,	%i6
	fmovde	%icc,	%f15,	%f9
	movne	%icc,	%i1,	%g6
	sethi	0x0048,	%l4
	fmovscc	%icc,	%f1,	%f5
	sir	0x0748
	tgu	%xcc,	0x7
	tcs	%xcc,	0x6
	wr	%g0,	0x10,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	xor	%i7,	0x18F4,	%g5
	bne,a,pt	%xcc,	loop_1216
	nop
	setx	0xB055C681,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fbl	%fcc2,	loop_1217
	movrlz	%i4,	0x068,	%g4
loop_1216:
	bn,a	loop_1218
	taddcc	%l0,	0x070F,	%l2
loop_1217:
	fmovsleu	%xcc,	%f11,	%f25
	fmovsvc	%icc,	%f17,	%f11
loop_1218:
	fbn	%fcc1,	loop_1219
	orcc	%l3,	0x1833,	%o4
	bgu,pt	%xcc,	loop_1220
	edge8	%i0,	%i5,	%o6
loop_1219:
	bcc,a	loop_1221
	orcc	%l1,	%g7,	%i3
loop_1220:
	fsrc2	%f10,	%f0
	bcc,a,pn	%xcc,	loop_1222
loop_1221:
	edge8n	%o0,	%i2,	%l5
	edge16n	%g1,	%g2,	%g3
	nop
	fitos	%f18,	%f28
loop_1222:
	ldsb	[%l7 + 0x1F],	%o2
	wr	%g0,	0x2f,	%asi
	stwa	%o5,	[%l7 + 0x34] %asi
	membar	#Sync
	popc	%o1,	%o7
	set	0x40, %i5
	stda	%f16,	[%l7 + %i5] 0x0c
	edge16	%l6,	%i6,	%i1
	fmovde	%icc,	%f16,	%f8
	sdivx	%o3,	0x10D0,	%l4
	fsrc1	%f22,	%f0
	stbar
	brgz	%g6,	loop_1223
	fmovsleu	%icc,	%f17,	%f13
	movvs	%xcc,	%i7,	%g5
	fbue,a	%fcc3,	loop_1224
loop_1223:
	tle	%icc,	0x2
	smulcc	%i4,	0x0C40,	%g4
	sdivx	%l0,	0x15DC,	%l3
loop_1224:
	fpadd16s	%f19,	%f28,	%f29
	fmovdle	%icc,	%f14,	%f30
	addccc	%l2,	0x0DD2,	%i0
	bne	%icc,	loop_1225
	fmovscc	%icc,	%f10,	%f12
	fbul	%fcc3,	loop_1226
	bne,a	%xcc,	loop_1227
loop_1225:
	fand	%f12,	%f2,	%f6
	movgu	%xcc,	%i5,	%o4
loop_1226:
	nop
	set	0x58, %l5
	swapa	[%l7 + %l5] 0x80,	%l1
loop_1227:
	smulcc	%o6,	%g7,	%o0
	movge	%icc,	%i2,	%i3
	brgz	%l5,	loop_1228
	movge	%icc,	%g2,	%g1
	fmovda	%xcc,	%f18,	%f5
	set	0x30, %l1
	stxa	%g3,	[%g0 + %l1] 0x4f
loop_1228:
	tn	%icc,	0x6
	ldsb	[%l7 + 0x4D],	%o2
	std	%f0,	[%l7 + 0x50]
	fbul	%fcc0,	loop_1229
	edge32	%o5,	%o7,	%l6
	fmovs	%f28,	%f12
	movg	%icc,	%o1,	%i1
loop_1229:
	taddcc	%i6,	0x061B,	%l4
	fnors	%f9,	%f20,	%f18
	fpadd16	%f12,	%f8,	%f10
	bneg,a,pn	%icc,	loop_1230
	bg,pt	%xcc,	loop_1231
	bneg,a,pt	%icc,	loop_1232
	tneg	%icc,	0x2
loop_1230:
	add	%o3,	0x049A,	%g6
loop_1231:
	xnorcc	%i7,	0x045A,	%g5
loop_1232:
	ta	%icc,	0x2
	tsubcc	%i4,	0x0F9C,	%g4
	srl	%l3,	%l0,	%l2
	andn	%i5,	%o4,	%l1
	st	%f30,	[%l7 + 0x20]
	movge	%xcc,	%o6,	%i0
	bn,a,pt	%icc,	loop_1233
	subccc	%o0,	0x1F2C,	%i2
	orcc	%i3,	0x0FD4,	%g7
	fpsub16	%f12,	%f28,	%f8
loop_1233:
	nop
	setx	0x277BE203C3D87C8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x543F8B876AD89371,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f30,	%f8
	and	%g2,	0x1F64,	%g1
	be,pt	%xcc,	loop_1234
	tvs	%icc,	0x1
	edge8ln	%g3,	%l5,	%o2
	array16	%o7,	%l6,	%o1
loop_1234:
	movcs	%icc,	%o5,	%i1
	fnot2s	%f26,	%f27
	movn	%xcc,	%i6,	%l4
	udivx	%o3,	0x19D5,	%i7
	movle	%icc,	%g5,	%i4
	edge32	%g6,	%g4,	%l3
	fand	%f28,	%f30,	%f20
	alignaddrl	%l2,	%i5,	%l0
	fmovrdlez	%o4,	%f24,	%f16
	edge16l	%l1,	%o6,	%i0
	stb	%i2,	[%l7 + 0x5E]
	addcc	%o0,	%g7,	%i3
	fmovdleu	%icc,	%f0,	%f7
	andncc	%g2,	%g1,	%l5
	edge16ln	%o2,	%g3,	%l6
	udivcc	%o7,	0x013C,	%o5
	fone	%f20
	fcmple32	%f22,	%f8,	%o1
	fbo	%fcc2,	loop_1235
	fmovsle	%xcc,	%f12,	%f0
	nop
	fitos	%f18,	%f0
	fmovsg	%xcc,	%f2,	%f23
loop_1235:
	fmovrse	%i1,	%f19,	%f2
	fbn	%fcc0,	loop_1236
	fandnot1s	%f16,	%f6,	%f5
	fxnor	%f16,	%f8,	%f2
	sdiv	%i6,	0x0A85,	%o3
loop_1236:
	tl	%icc,	0x0
	fbl	%fcc0,	loop_1237
	edge32ln	%i7,	%l4,	%g5
	fbu,a	%fcc0,	loop_1238
	mulx	%g6,	0x0B0A,	%g4
loop_1237:
	brgz,a	%i4,	loop_1239
	tneg	%xcc,	0x3
loop_1238:
	nop
	setx	0x2412D663,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xBF5104F2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f2,	%f6
	orcc	%l3,	0x1EA5,	%l2
loop_1239:
	brlz	%i5,	loop_1240
	edge8	%o4,	%l1,	%o6
	fandnot2s	%f9,	%f21,	%f10
	and	%i0,	0x0562,	%l0
loop_1240:
	bleu,a	%icc,	loop_1241
	fmovdpos	%xcc,	%f27,	%f10
	membar	0x7A
	fbg,a	%fcc0,	loop_1242
loop_1241:
	nop
	set	0x36, %o2
	ldub	[%l7 + %o2],	%i2
	edge16	%g7,	%i3,	%g2
	fexpand	%f25,	%f6
loop_1242:
	nop
	setx	0xE18CA571D06DFA71,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	ldsw	[%l7 + 0x5C],	%g1
	fors	%f11,	%f24,	%f5
	movne	%icc,	%l5,	%o0
	fors	%f18,	%f12,	%f27
	movrgez	%g3,	%o2,	%l6
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x6C] %asi,	%o5
	fbuge,a	%fcc3,	loop_1243
	edge8l	%o1,	%o7,	%i1
	movrne	%o3,	%i7,	%l4
	sra	%g5,	0x0C,	%g6
loop_1243:
	fmovspos	%xcc,	%f18,	%f14
	edge16	%g4,	%i4,	%i6
	edge8l	%l2,	%i5,	%l3
	tne	%icc,	0x5
	ldx	[%l7 + 0x40],	%l1
	fble,a	%fcc0,	loop_1244
	move	%icc,	%o4,	%o6
	te	%icc,	0x0
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x1D] %asi,	%l0
loop_1244:
	nop
	setx	0xD06A3152,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x45DB0E4C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f25,	%f26
	nop
	setx	0xC04129B0,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x77] %asi,	%i0
	alignaddr	%i2,	%i3,	%g7
	prefetch	[%l7 + 0x3C],	 0x1
	subccc	%g1,	0x1587,	%g2
	sdivcc	%l5,	0x03EE,	%g3
	mova	%xcc,	%o2,	%l6
	tneg	%xcc,	0x4
	movpos	%xcc,	%o5,	%o1
	edge8n	%o0,	%o7,	%i1
	set	0x74, %l2
	stwa	%i7,	[%l7 + %l2] 0xe3
	membar	#Sync
	fcmpne32	%f30,	%f4,	%o3
	xnor	%g5,	%g6,	%g4
	nop
	setx	0x31404058667E89FC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xBF8B7316DA89139A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f30,	%f26
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%i4,	%i6
	tcc	%xcc,	0x5
	movneg	%xcc,	%l2,	%i5
	srlx	%l4,	%l1,	%o4
	fandnot1	%f18,	%f28,	%f24
	orcc	%o6,	0x0039,	%l0
	fands	%f1,	%f12,	%f31
	movn	%icc,	%l3,	%i2
	andn	%i3,	0x04F8,	%i0
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%g0
	tl	%icc,	0x5
	srlx	%g7,	0x1E,	%g2
	fmovda	%icc,	%f10,	%f0
	alignaddrl	%g3,	%o2,	%l5
	movl	%xcc,	%o5,	%l6
	tvs	%icc,	0x6
	srax	%o0,	%o7,	%o1
	andn	%i7,	%o3,	%i1
	ldub	[%l7 + 0x2B],	%g5
	fand	%f24,	%f6,	%f28
	or	%g6,	0x004C,	%i4
	udivx	%i6,	0x1609,	%g4
	set	0x64, %g4
	lda	[%l7 + %g4] 0x14,	%f29
	fmovdgu	%icc,	%f20,	%f12
	orcc	%l2,	0x1834,	%i5
	fmuld8ulx16	%f13,	%f22,	%f26
	fbn	%fcc1,	loop_1245
	orcc	%l4,	0x0EE1,	%l1
	array32	%o6,	%l0,	%o4
	smulcc	%i2,	0x1F4D,	%i3
loop_1245:
	sir	0x11C3
	fbug	%fcc2,	loop_1246
	mulscc	%i0,	0x072D,	%g1
	tvs	%xcc,	0x1
	bg	loop_1247
loop_1246:
	srl	%l3,	0x08,	%g2
	fnegs	%f24,	%f2
	tneg	%xcc,	0x3
loop_1247:
	xor	%g3,	0x120C,	%g7
	nop
	setx	0xA5F0AB7E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x6CE8F89F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f13,	%f14
	edge16ln	%l5,	%o5,	%o2
	edge8	%o0,	%o7,	%l6
	orn	%i7,	0x019C,	%o1
	fmovdcc	%icc,	%f5,	%f10
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x0
	edge32ln	%i1,	%g6,	%g5
	te	%xcc,	0x4
	ldstub	[%l7 + 0x50],	%i4
	fpsub32s	%f6,	%f14,	%f14
	te	%icc,	0x0
	movn	%xcc,	%g4,	%l2
	movleu	%icc,	%i6,	%i5
	fbg,a	%fcc3,	loop_1248
	fornot1s	%f20,	%f22,	%f19
	be,a	%icc,	loop_1249
	srlx	%l4,	0x06,	%o6
loop_1248:
	fnand	%f30,	%f20,	%f6
	nop
	fitos	%f12,	%f4
	fstoi	%f4,	%f3
loop_1249:
	fbg,a	%fcc3,	loop_1250
	fnands	%f25,	%f6,	%f24
	std	%f30,	[%l7 + 0x18]
	movge	%xcc,	%l1,	%o4
loop_1250:
	edge16ln	%l0,	%i2,	%i0
	tvs	%icc,	0x1
	tvc	%xcc,	0x1
	or	%g1,	0x0F44,	%l3
	fornot2	%f30,	%f10,	%f20
	tpos	%icc,	0x3
	sllx	%g2,	0x11,	%i3
	movgu	%xcc,	%g7,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%xcc,	0x4
	fones	%f31
	orcc	%o5,	%o2,	%g3
	nop
	setx	0x95B0DE293CB41773,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x6D06E08856E221EF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f28,	%f10
	udivx	%o0,	0x1B88,	%o7
	fmovrslez	%i7,	%f18,	%f4
	fabss	%f21,	%f31
	swap	[%l7 + 0x68],	%l6
	tcc	%icc,	0x3
	movcc	%icc,	%o3,	%o1
	movrgez	%i1,	%g6,	%g5
	tleu	%icc,	0x2
	tvc	%icc,	0x2
	nop
	setx	0xA0850724,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xC345AF93,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f14,	%f6
	tsubcctv	%i4,	%g4,	%i6
	brgez	%i5,	loop_1251
	xnor	%l4,	0x016D,	%l2
	membar	0x43
	tcs	%xcc,	0x7
loop_1251:
	nop
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x44] %asi,	%l1
	tpos	%xcc,	0x5
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf0
	membar	#Sync
	movgu	%xcc,	%o6,	%l0
	tsubcc	%i2,	%i0,	%o4
	nop
	setx	0x92D91FAC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x65161FE0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f24,	%f17
	st	%f17,	[%l7 + 0x1C]
	bgu	%icc,	loop_1252
	movrgz	%g1,	0x1F5,	%g2
	tge	%xcc,	0x3
	tpos	%icc,	0x5
loop_1252:
	sdiv	%l3,	0x1B7C,	%g7
	nop
	setx	0x5CBE3133783DC2ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xCA627F6FC8301EDF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f2,	%f28
	sdiv	%i3,	0x0121,	%o5
	movcs	%xcc,	%l5,	%o2
	andcc	%o0,	0x0382,	%o7
	array32	%i7,	%l6,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o1,	0x14F0,	%i1
	edge8l	%g6,	%o3,	%g5
	udivcc	%i4,	0x0993,	%i6
	edge32n	%g4,	%i5,	%l2
	nop
	setx	0xA8985826DDEBE007,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x52B4D92B593D3362,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f4,	%f2
	te	%xcc,	0x7
	bcc,a,pt	%icc,	loop_1253
	addcc	%l4,	0x00C0,	%o6
	subccc	%l0,	0x0126,	%l1
	fmovdle	%icc,	%f4,	%f17
loop_1253:
	fmovdge	%icc,	%f8,	%f16
	movne	%icc,	%i0,	%o4
	fmovrsgez	%i2,	%f31,	%f7
	fbuge	%fcc0,	loop_1254
	sra	%g2,	0x17,	%g1
	sdivcc	%g7,	0x1AA5,	%l3
	fnot2	%f6,	%f10
loop_1254:
	pdist	%f2,	%f6,	%f18
	smul	%o5,	%l5,	%o2
	movre	%o0,	%o7,	%i3
	tg	%icc,	0x5
	edge16	%l6,	%i7,	%o1
	xnor	%g3,	0x1D1B,	%g6
	fmuld8sux16	%f21,	%f15,	%f12
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i1,	%g5
	edge8n	%o3,	%i4,	%i6
	srax	%g4,	%l2,	%l4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	call	loop_1255
	popc	0x092E,	%o6
	nop
	fitod	%f10,	%f26
	fdtox	%f26,	%f14
	movcs	%icc,	%l0,	%l1
loop_1255:
	xnor	%i0,	%i5,	%o4
	fcmple16	%f8,	%f16,	%i2
	set	0x60, %i7
	ldda	[%l7 + %i7] 0x04,	%g0
	movpos	%icc,	%g7,	%g2
	udivcc	%o5,	0x186F,	%l5
	movrgez	%l3,	%o0,	%o2
	sub	%o7,	0x04CD,	%i3
	fmul8x16au	%f26,	%f2,	%f10
	sra	%i7,	0x19,	%o1
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x08] %asi,	%l6
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x10] %asi,	%g6
	fmovsgu	%xcc,	%f27,	%f12
	lduw	[%l7 + 0x6C],	%g3
	tg	%icc,	0x1
	fmovdcc	%xcc,	%f22,	%f18
	movvc	%icc,	%i1,	%g5
	udivcc	%i4,	0x1229,	%o3
	tn	%icc,	0x6
	orn	%i6,	%g4,	%l2
	orncc	%l4,	0x1106,	%l0
	andn	%l1,	0x0F27,	%i0
	fpadd16s	%f10,	%f30,	%f31
	movvs	%icc,	%o6,	%i5
	edge16	%o4,	%i2,	%g1
	xnor	%g7,	0x080B,	%g2
	taddcc	%l5,	0x1F32,	%o5
	ta	%xcc,	0x5
	movg	%xcc,	%l3,	%o2
	tg	%icc,	0x1
	tvc	%icc,	0x4
	set	0x74, %i6
	lda	[%l7 + %i6] 0x89,	%f22
	brnz,a	%o0,	loop_1256
	movge	%icc,	%i3,	%o7
	edge32	%o1,	%i7,	%g6
	bneg,a	%xcc,	loop_1257
loop_1256:
	taddcctv	%g3,	0x1686,	%l6
	tvc	%xcc,	0x2
	bpos,pn	%xcc,	loop_1258
loop_1257:
	umulcc	%g5,	%i4,	%i1
	andn	%i6,	%o3,	%g4
	fmovdl	%xcc,	%f6,	%f21
loop_1258:
	fpack16	%f6,	%f18
	bgu,pn	%icc,	loop_1259
	fbuge	%fcc1,	loop_1260
	tvs	%xcc,	0x7
	fxnors	%f8,	%f4,	%f1
loop_1259:
	tsubcc	%l2,	%l0,	%l1
loop_1260:
	srl	%l4,	0x17,	%o6
	fbe	%fcc0,	loop_1261
	movrgez	%i5,	0x3AF,	%o4
	fnot1	%f20,	%f8
	sll	%i2,	0x02,	%g1
loop_1261:
	edge16	%g7,	%i0,	%l5
	edge32l	%o5,	%l3,	%o2
	edge32n	%o0,	%i3,	%g2
	fandnot2	%f2,	%f26,	%f24
	edge8	%o1,	%i7,	%g6
	tge	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f6,	%f8
	fdtos	%f8,	%f2
	te	%xcc,	0x5
	orn	%o7,	%g3,	%l6
	set	0x40, %o6
	stxa	%g5,	[%l7 + %o6] 0x2a
	membar	#Sync
	sll	%i1,	%i6,	%i4
	srlx	%g4,	%l2,	%l0
	fmul8x16au	%f3,	%f6,	%f12
	mulscc	%o3,	0x08B7,	%l4
	call	loop_1262
	fbge,a	%fcc0,	loop_1263
	movrgez	%o6,	0x233,	%l1
	fmovrse	%o4,	%f26,	%f6
loop_1262:
	fabss	%f30,	%f19
loop_1263:
	smulcc	%i5,	%g1,	%g7
	stx	%i0,	[%l7 + 0x30]
	brlez	%l5,	loop_1264
	tge	%xcc,	0x1
	tsubcc	%o5,	%l3,	%o2
	movn	%icc,	%i2,	%o0
loop_1264:
	movl	%icc,	%g2,	%o1
	bleu,pn	%icc,	loop_1265
	fmovdleu	%icc,	%f30,	%f3
	movrgz	%i3,	%g6,	%i7
	stbar
loop_1265:
	fnands	%f29,	%f19,	%f24
	bcc,pt	%xcc,	loop_1266
	edge32ln	%o7,	%g3,	%l6
	fbe,a	%fcc0,	loop_1267
	swap	[%l7 + 0x6C],	%g5
loop_1266:
	stb	%i1,	[%l7 + 0x70]
	brlez,a	%i4,	loop_1268
loop_1267:
	sdivcc	%g4,	0x1673,	%i6
	fpack32	%f8,	%f2,	%f14
	fpadd32s	%f29,	%f26,	%f1
loop_1268:
	stw	%l2,	[%l7 + 0x64]
	fxor	%f8,	%f30,	%f4
	sir	0x1A05
	fbne	%fcc2,	loop_1269
	fsrc2	%f20,	%f18
	umul	%l0,	%l4,	%o6
	sub	%o3,	0x1EE8,	%o4
loop_1269:
	taddcc	%i5,	0x09B9,	%g1
	movpos	%icc,	%g7,	%i0
	nop
	setx	0xE6659974A0EB1CFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f22
	tge	%icc,	0x6
	fmovrsgz	%l5,	%f1,	%f3
	movneg	%icc,	%o5,	%l1
	xnorcc	%o2,	%i2,	%l3
	bg,a	%icc,	loop_1270
	fble,a	%fcc3,	loop_1271
	edge16n	%o0,	%o1,	%g2
	brgez,a	%g6,	loop_1272
loop_1270:
	bgu,a	%icc,	loop_1273
loop_1271:
	tge	%icc,	0x0
	array32	%i7,	%i3,	%g3
loop_1272:
	tvs	%xcc,	0x0
loop_1273:
	addc	%l6,	%o7,	%i1
	movpos	%xcc,	%i4,	%g4
	fexpand	%f15,	%f10
	nop
	fitod	%f14,	%f30
	orncc	%g5,	0x068F,	%l2
	wr	%g0,	0x04,	%asi
	ldxa	[%l7 + 0x20] %asi,	%l0
	edge32ln	%i6,	%o6,	%o3
	nop
	set	0x39, %l0
	ldub	[%l7 + %l0],	%o4
	tn	%icc,	0x1
	or	%i5,	%g1,	%l4
	be	loop_1274
	fmovscs	%xcc,	%f9,	%f15
	tsubcctv	%i0,	%l5,	%g7
	sub	%o5,	%o2,	%i2
loop_1274:
	edge32n	%l3,	%l1,	%o0
	nop
	fitos	%f3,	%f14
	fstod	%f14,	%f4
	sra	%o1,	0x03,	%g6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x5C] %asi,	%i7
	movl	%icc,	%g2,	%i3
	fsrc2	%f0,	%f16
	edge8ln	%g3,	%l6,	%o7
	for	%f24,	%f0,	%f8
	xor	%i1,	%g4,	%i4
	nop
	setx	0x802692DB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x5D2AD26C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f1,	%f14
	and	%g5,	%l2,	%i6
	addcc	%o6,	0x01A2,	%o3
	mulscc	%l0,	0x1084,	%i5
	set	0x50, %g6
	sta	%f13,	[%l7 + %g6] 0x18
	bvc,a,pt	%xcc,	loop_1275
	subc	%g1,	%o4,	%i0
	bn,a	loop_1276
	brgez,a	%l4,	loop_1277
loop_1275:
	edge8l	%l5,	%o5,	%o2
	movcs	%icc,	%g7,	%i2
loop_1276:
	fbule,a	%fcc0,	loop_1278
loop_1277:
	fcmple32	%f0,	%f16,	%l3
	tn	%xcc,	0x3
	movl	%icc,	%o0,	%l1
loop_1278:
	brnz,a	%g6,	loop_1279
	fmovsvs	%icc,	%f3,	%f10
	array32	%o1,	%g2,	%i7
	srax	%g3,	0x16,	%i3
loop_1279:
	nop
	setx	0x138A4A67D7FBCE5E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f16
	fnegs	%f29,	%f4
	tg	%xcc,	0x2
	xorcc	%l6,	0x176F,	%o7
	nop
	setx	loop_1280,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%g4,	%i1,	%i4
	orcc	%l2,	0x0B6A,	%g5
	te	%xcc,	0x3
loop_1280:
	fmovdgu	%icc,	%f25,	%f28
	fmovsle	%xcc,	%f16,	%f22
	fsrc1s	%f28,	%f22
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fbge,a	%fcc3,	loop_1281
	stbar
	edge32ln	%o6,	%i6,	%l0
	andncc	%i5,	%g1,	%o3
loop_1281:
	fmovdpos	%icc,	%f31,	%f30
	bcs,a	loop_1282
	fmovsne	%xcc,	%f18,	%f31
	nop
	setx loop_1283, %l0, %l1
	jmpl %l1, %i0
	andcc	%l4,	%o4,	%o5
loop_1282:
	movcc	%xcc,	%l5,	%g7
	fcmple32	%f18,	%f8,	%o2
loop_1283:
	nop
	set	0x40, %o7
	ldx	[%l7 + %o7],	%l3
	flush	%l7 + 0x48
	te	%xcc,	0x2
	membar	0x4B
	movrlez	%i2,	0x074,	%l1
	fpadd32s	%f22,	%f29,	%f26
	sll	%g6,	0x1A,	%o0
	movrne	%o1,	%g2,	%g3
	fmovdvc	%icc,	%f18,	%f19
	xor	%i7,	%l6,	%o7
	movg	%xcc,	%i3,	%g4
	ld	[%l7 + 0x18],	%f13
	fba,a	%fcc3,	loop_1284
	movn	%xcc,	%i1,	%i4
	edge8n	%l2,	%g5,	%i6
	nop
	setx	0x8AC35AB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xC71DB522,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fadds	%f0,	%f18,	%f7
loop_1284:
	edge16n	%l0,	%i5,	%o6
	tn	%icc,	0x7
	te	%icc,	0x6
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fmul8ulx16	%f30,	%f18,	%f12
	bvs	loop_1285
	fandnot2	%f12,	%f14,	%f24
	set	0x78, %g5
	lduba	[%l7 + %g5] 0x11,	%g1
loop_1285:
	fmovsge	%xcc,	%f16,	%f11
	fmovdcs	%xcc,	%f24,	%f7
	edge16l	%o3,	%i0,	%o4
	bvc	%xcc,	loop_1286
	fmovde	%xcc,	%f12,	%f18
	xnor	%l4,	0x093D,	%l5
	xnorcc	%g7,	%o2,	%o5
loop_1286:
	swap	[%l7 + 0x08],	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%i2,	0x0973,	%g6
	nop
	setx	0x876F6F7724DB234C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f22
	array16	%l1,	%o0,	%g2
	fexpand	%f3,	%f20
	edge32l	%o1,	%i7,	%g3
	fmovd	%f8,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f18,	%f4,	%f24
	popc	0x0CAE,	%o7
	add	%i3,	%g4,	%l6
	udivcc	%i4,	0x07F8,	%l2
	fbul	%fcc3,	loop_1287
	fcmple32	%f22,	%f26,	%g5
	fmuld8ulx16	%f21,	%f14,	%f20
	xor	%i1,	0x08F7,	%l0
loop_1287:
	array8	%i5,	%o6,	%g1
	movle	%icc,	%o3,	%i0
	ldsh	[%l7 + 0x32],	%i6
	tl	%icc,	0x7
	addcc	%o4,	0x1084,	%l4
	stw	%l5,	[%l7 + 0x30]
	fmovsvc	%xcc,	%f6,	%f16
	sub	%g7,	0x0C49,	%o5
	or	%o2,	%i2,	%l3
	umul	%g6,	0x009F,	%l1
	bvs	loop_1288
	edge16n	%o0,	%o1,	%g2
	sll	%g3,	%o7,	%i7
	taddcctv	%g4,	%l6,	%i4
loop_1288:
	udivx	%i3,	0x06E3,	%l2
	fpsub16s	%f21,	%f7,	%f21
	tne	%xcc,	0x2
	movrlez	%g5,	0x3C9,	%l0
	or	%i5,	%o6,	%i1
	xor	%o3,	0x0AF9,	%g1
	nop
	setx	loop_1289,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnors	%f7,	%f6,	%f23
	fmovsgu	%xcc,	%f9,	%f9
	movl	%icc,	%i0,	%o4
loop_1289:
	mova	%icc,	%i6,	%l5
	array32	%g7,	%o5,	%l4
	edge32n	%o2,	%l3,	%g6
	pdist	%f22,	%f26,	%f24
	umulcc	%l1,	%i2,	%o1
	movrgz	%g2,	0x181,	%o0
	srl	%o7,	%i7,	%g3
	be	%xcc,	loop_1290
	fandnot2	%f14,	%f6,	%f24
	udivcc	%l6,	0x0F56,	%i4
	set	0x118, %i3
	nop 	! 	nop 	! 	ldxa	[%g0 + %i3] 0x40,	%g4 ripped by fixASI40.pl ripped by fixASI40.pl
loop_1290:
	edge8l	%i3,	%g5,	%l2
	movre	%l0,	%i5,	%o6
	fpackfix	%f10,	%f12
	lduw	[%l7 + 0x78],	%i1
	fbge,a	%fcc2,	loop_1291
	xnor	%g1,	%o3,	%i0
	movrgz	%o4,	%l5,	%g7
	fmovsg	%icc,	%f26,	%f16
loop_1291:
	fornot1s	%f1,	%f26,	%f6
	fmovdne	%xcc,	%f11,	%f7
	udivx	%i6,	0x1120,	%l4
	sir	0x00D2
	movrgz	%o5,	%l3,	%o2
	st	%f10,	[%l7 + 0x68]
	smul	%g6,	0x1359,	%l1
	edge8n	%o1,	%i2,	%g2
	fbl,a	%fcc0,	loop_1292
	fpadd32s	%f23,	%f14,	%f21
	edge8ln	%o0,	%i7,	%o7
	taddcc	%l6,	0x0F1C,	%g3
loop_1292:
	nop
	fitos	%f6,	%f29
	fstox	%f29,	%f26
	movpos	%xcc,	%g4,	%i4
	movl	%xcc,	%g5,	%i3
	movge	%icc,	%l0,	%i5
	movrlz	%l2,	0x10A,	%i1
	tsubcctv	%o6,	0x0B10,	%g1
	andn	%i0,	0x070E,	%o4
	sdiv	%o3,	0x1F9E,	%g7
	edge16n	%i6,	%l5,	%o5
	movn	%xcc,	%l4,	%l3
	movvc	%xcc,	%o2,	%g6
	movrgz	%o1,	%l1,	%g2
	fbu	%fcc0,	loop_1293
	fxors	%f12,	%f21,	%f23
	brlz,a	%o0,	loop_1294
	fcmpeq16	%f12,	%f4,	%i7
loop_1293:
	bneg,pt	%icc,	loop_1295
	fands	%f12,	%f24,	%f17
loop_1294:
	mulx	%i2,	0x0ED2,	%o7
	edge8n	%l6,	%g4,	%g3
loop_1295:
	fbuge,a	%fcc0,	loop_1296
	nop
	fitod	%f2,	%f8
	fdtoi	%f8,	%f10
	tcs	%icc,	0x2
	sll	%i4,	0x1D,	%g5
loop_1296:
	nop
	set	0x36, %l6
	ldstuba	[%l7 + %l6] 0x0c,	%l0
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	edge16n	%i3,	%l2,	%i1
	umulcc	%i5,	0x1328,	%o6
	ldsh	[%l7 + 0x64],	%i0
	subcc	%g1,	%o3,	%o4
	set	0x5A, %o3
	ldsha	[%l7 + %o3] 0x11,	%g7
	tcs	%xcc,	0x7
	bne,pt	%icc,	loop_1297
	taddcctv	%l5,	0x1ED4,	%i6
	prefetch	[%l7 + 0x44],	 0x0
	xnor	%l4,	0x1A6B,	%o5
loop_1297:
	fands	%f17,	%f21,	%f25
	fbne,a	%fcc0,	loop_1298
	bcc,a	%xcc,	loop_1299
	mova	%xcc,	%l3,	%o2
	tvs	%xcc,	0x7
loop_1298:
	nop
	fitod	%f10,	%f22
	fdtoi	%f22,	%f5
loop_1299:
	sethi	0x0265,	%g6
	fmul8x16	%f5,	%f12,	%f14
	edge16l	%l1,	%o1,	%o0
	set	0x78, %o4
	lda	[%l7 + %o4] 0x80,	%f9
	and	%g2,	0x1689,	%i2
	tgu	%icc,	0x2
	stx	%i7,	[%l7 + 0x60]
	fble	%fcc2,	loop_1300
	nop
	setx	0x8AE080D92A85EE5D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f8
	srl	%l6,	0x01,	%g4
	fnegd	%f24,	%f18
loop_1300:
	movrlz	%g3,	0x11E,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%o7,	%l0
	set	0x38, %o1
	sta	%f8,	[%l7 + %o1] 0x10
	movn	%xcc,	%i3,	%g5
	fmovdge	%xcc,	%f16,	%f28
	nop
	fitod	%f12,	%f10
	fdtos	%f10,	%f29
	tvc	%xcc,	0x0
	mulscc	%l2,	0x19C6,	%i5
	call	loop_1301
	edge16n	%o6,	%i1,	%i0
	edge32l	%g1,	%o3,	%g7
	lduw	[%l7 + 0x10],	%o4
loop_1301:
	xor	%i6,	0x0778,	%l5
	nop
	setx	0x405609B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	umulcc	%l4,	0x1CBC,	%o5
	movre	%o2,	0x28E,	%g6
	sub	%l1,	0x08D0,	%o1
	fnands	%f27,	%f27,	%f16
	tg	%icc,	0x7
	taddcc	%l3,	%o0,	%g2
	fblg	%fcc3,	loop_1302
	movcs	%xcc,	%i7,	%i2
	edge8n	%l6,	%g3,	%i4
	taddcc	%g4,	%l0,	%o7
loop_1302:
	nop
	setx loop_1303, %l0, %l1
	jmpl %l1, %g5
	ldub	[%l7 + 0x7D],	%l2
	nop
	setx	0x1CA99692,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f2
	brnz	%i5,	loop_1304
loop_1303:
	brlez,a	%i3,	loop_1305
	andncc	%o6,	%i1,	%i0
	move	%xcc,	%o3,	%g1
loop_1304:
	array8	%o4,	%g7,	%i6
loop_1305:
	edge32l	%l5,	%o5,	%l4
	bl,a	%xcc,	loop_1306
	tneg	%icc,	0x3
	fcmple16	%f18,	%f14,	%g6
	mova	%xcc,	%o2,	%l1
loop_1306:
	tcc	%icc,	0x7
	srax	%o1,	%l3,	%g2
	fbn	%fcc1,	loop_1307
	fmovsvc	%xcc,	%f25,	%f20
	tgu	%xcc,	0x7
	ta	%xcc,	0x6
loop_1307:
	array32	%o0,	%i7,	%i2
	membar	0x5C
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x3B] %asi,	%l6
	fsrc1s	%f26,	%f12
	nop
	fitos	%f11,	%f29
	fstoi	%f29,	%f17
	or	%i4,	%g4,	%g3
	taddcctv	%o7,	%g5,	%l0
	tvs	%icc,	0x4
	brnz	%i5,	loop_1308
	fcmpne16	%f30,	%f12,	%l2
	tn	%xcc,	0x2
	fors	%f30,	%f3,	%f18
loop_1308:
	tne	%icc,	0x2
	swap	[%l7 + 0x40],	%i3
	sll	%i1,	0x08,	%o6
	tneg	%icc,	0x7
	movgu	%xcc,	%o3,	%g1
	edge16ln	%i0,	%o4,	%i6
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x80,	%f16
	ta	%icc,	0x6
	set	0x58, %i4
	lda	[%l7 + %i4] 0x80,	%f18
	sub	%l5,	%o5,	%g7
	tl	%xcc,	0x7
	add	%l4,	0x15B9,	%o2
	sdivx	%l1,	0x1C10,	%g6
	array8	%l3,	%o1,	%o0
	fands	%f3,	%f23,	%f21
	addccc	%g2,	%i2,	%l6
	movre	%i4,	%i7,	%g4
	tn	%icc,	0x1
	fmovrse	%o7,	%f13,	%f20
	addccc	%g3,	%g5,	%l0
	brgz,a	%l2,	loop_1309
	fpackfix	%f0,	%f11
	fsrc2s	%f31,	%f18
	tne	%icc,	0x5
loop_1309:
	sra	%i3,	0x11,	%i5
	swap	[%l7 + 0x28],	%o6
	set	0x4C, %l3
	stha	%o3,	[%l7 + %l3] 0x10
	movgu	%xcc,	%g1,	%i1
	alignaddr	%i0,	%i6,	%l5
	movl	%icc,	%o5,	%o4
	faligndata	%f16,	%f8,	%f28
	fnegs	%f17,	%f17
	alignaddrl	%g7,	%l4,	%o2
	xnorcc	%l1,	%l3,	%g6
	fmul8x16al	%f28,	%f22,	%f20
	edge8n	%o0,	%o1,	%g2
	ldub	[%l7 + 0x64],	%l6
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x48] %asi,	%i4
	edge8n	%i2,	%i7,	%g4
	ba,a,pt	%icc,	loop_1310
	nop
	setx	0xC96DA3D4B072D6A6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fmovda	%icc,	%f25,	%f14
	movrne	%g3,	%o7,	%g5
loop_1310:
	subc	%l2,	%l0,	%i3
	tneg	%xcc,	0x1
	bshuffle	%f12,	%f14,	%f16
	movrne	%i5,	%o6,	%o3
	movrlez	%g1,	%i0,	%i1
	orn	%i6,	%l5,	%o5
	umulcc	%g7,	%o4,	%o2
	ldsh	[%l7 + 0x48],	%l1
	nop
	set	0x40, %o0
	stx	%l3,	[%l7 + %o0]
	tg	%xcc,	0x3
	fpmerge	%f16,	%f13,	%f4
	xor	%l4,	0x127E,	%o0
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x10,	%f16
	smul	%o1,	0x0650,	%g6
	edge16n	%l6,	%g2,	%i2
	bge,pn	%icc,	loop_1311
	bne,a,pn	%xcc,	loop_1312
	fbue	%fcc2,	loop_1313
	fones	%f15
loop_1311:
	sth	%i7,	[%l7 + 0x70]
loop_1312:
	fmovs	%f26,	%f14
loop_1313:
	fexpand	%f2,	%f4
	sdiv	%i4,	0x02ED,	%g4
	taddcctv	%g3,	%g5,	%o7
	fmovdle	%icc,	%f6,	%f17
	fcmple32	%f16,	%f20,	%l0
	edge8ln	%l2,	%i3,	%i5
	nop
	setx	0xE183D29213FC8371,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x865946D26F9CBC8F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f18,	%f4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o3,	%g1,	%o6
	movrgz	%i1,	%i0,	%i6
	fmovsvc	%xcc,	%f8,	%f3
	movl	%icc,	%l5,	%o5
	tvs	%icc,	0x1
	movg	%xcc,	%o4,	%o2
	nop
	fitod	%f10,	%f8
	fdtox	%f8,	%f14
	tpos	%icc,	0x3
	movle	%icc,	%l1,	%g7
	fnegd	%f4,	%f16
	movn	%xcc,	%l3,	%l4
	fbne	%fcc0,	loop_1314
	mova	%icc,	%o1,	%g6
	fmovsleu	%icc,	%f26,	%f23
	movvs	%xcc,	%o0,	%l6
loop_1314:
	move	%xcc,	%g2,	%i7
	sllx	%i2,	0x18,	%i4
	fxnor	%f2,	%f18,	%f0
	umul	%g3,	0x1C8A,	%g4
	nop
	setx	0x5A9D7A8AF7BBBFF2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x488E98B59B26396E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fsubd	%f24,	%f10,	%f30
	mulx	%o7,	%g5,	%l0
	nop
	fitos	%f7,	%f1
	fstox	%f1,	%f14
	fxtos	%f14,	%f21
	fmovsgu	%xcc,	%f22,	%f7
	fbu	%fcc1,	loop_1315
	srax	%l2,	0x0F,	%i5
	tcs	%icc,	0x3
	edge32n	%i3,	%g1,	%o6
loop_1315:
	srax	%i1,	%i0,	%i6
	andcc	%o3,	%o5,	%o4
	subc	%l5,	0x1178,	%o2
	call	loop_1316
	sllx	%l1,	%g7,	%l4
	tle	%xcc,	0x6
	taddcc	%l3,	%o1,	%o0
loop_1316:
	prefetch	[%l7 + 0x3C],	 0x2
	set	0x4A, %l4
	lduba	[%l7 + %l4] 0x14,	%g6
	array16	%g2,	%i7,	%i2
	or	%i4,	%g3,	%g4
	fbl	%fcc1,	loop_1317
	orcc	%o7,	0x1282,	%g5
	movrgez	%l0,	%l2,	%i5
	fbg	%fcc3,	loop_1318
loop_1317:
	nop
	fitod	%f6,	%f26
	fdtox	%f26,	%f18
	andncc	%l6,	%i3,	%g1
	tle	%xcc,	0x2
loop_1318:
	or	%i1,	0x0A50,	%i0
	fnegs	%f23,	%f17
	fmovspos	%xcc,	%f3,	%f28
	edge16ln	%o6,	%o3,	%i6
	bgu,pn	%xcc,	loop_1319
	fbge	%fcc3,	loop_1320
	sir	0x19DD
	tpos	%icc,	0x0
loop_1319:
	edge8	%o5,	%o4,	%l5
loop_1320:
	movl	%icc,	%l1,	%o2
	taddcc	%g7,	%l3,	%l4
	bvc,pt	%xcc,	loop_1321
	nop
	setx	0x60521108,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	tl	%xcc,	0x4
	sll	%o0,	%g6,	%g2
loop_1321:
	xnor	%o1,	%i2,	%i4
	edge32ln	%g3,	%g4,	%i7
	edge8	%g5,	%l0,	%o7
	fbul,a	%fcc2,	loop_1322
	mulx	%i5,	0x18F7,	%l6
	fnand	%f30,	%f30,	%f6
	xorcc	%l2,	0x02FD,	%i3
loop_1322:
	srlx	%i1,	%g1,	%i0
	edge16ln	%o3,	%i6,	%o6
	nop
	setx	0x5A91AC95804C8BA0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	udivcc	%o5,	0x1E03,	%o4
	movn	%icc,	%l5,	%l1
	tcs	%icc,	0x6
	bn,a,pt	%icc,	loop_1323
	alignaddr	%o2,	%l3,	%g7
	umulcc	%o0,	0x044F,	%g6
	sth	%g2,	[%l7 + 0x5E]
loop_1323:
	tg	%xcc,	0x4
	or	%l4,	%i2,	%o1
	bn,pt	%xcc,	loop_1324
	and	%i4,	%g3,	%g4
	move	%xcc,	%i7,	%l0
	fnegd	%f4,	%f8
loop_1324:
	nop
	setx	0x4AC203B9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x24341619,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f13,	%f29
	movneg	%icc,	%o7,	%i5
	edge32	%l6,	%l2,	%i3
	nop
	setx	0xBE1171623054BE31,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fble,a	%fcc0,	loop_1325
	add	%i1,	0x0C89,	%g1
	fones	%f7
	fnot2s	%f31,	%f15
loop_1325:
	tge	%xcc,	0x2
	tsubcc	%i0,	%g5,	%i6
	xorcc	%o6,	0x1742,	%o5
	fbuge	%fcc0,	loop_1326
	edge32l	%o4,	%o3,	%l1
	movgu	%icc,	%o2,	%l3
	udivx	%g7,	0x1F70,	%o0
loop_1326:
	fble	%fcc2,	loop_1327
	nop
	setx	0xCD321E4AA1B4EE16,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x33B47B2ADF463D65,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f30,	%f10
	udivx	%l5,	0x0BAE,	%g2
	fpadd16s	%f17,	%f6,	%f4
loop_1327:
	xnor	%g6,	0x15B6,	%i2
	sll	%l4,	%i4,	%g3
	edge8l	%o1,	%g4,	%i7
	movl	%xcc,	%l0,	%o7
	fabss	%f16,	%f3
	edge32l	%l6,	%l2,	%i5
	fmul8x16al	%f30,	%f31,	%f0
	ldsw	[%l7 + 0x1C],	%i3
	srl	%g1,	0x1B,	%i0
	fmovsn	%xcc,	%f14,	%f18
	nop
	setx	0x363A4DFEA0755321,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	srax	%i1,	0x1F,	%g5
	fornot1	%f14,	%f30,	%f12
	sllx	%o6,	%o5,	%i6
	subcc	%o3,	%l1,	%o4
	bshuffle	%f26,	%f12,	%f30
	tneg	%xcc,	0x4
	lduh	[%l7 + 0x4A],	%o2
	orn	%l3,	%g7,	%o0
	movleu	%xcc,	%g2,	%l5
	movrgz	%i2,	%g6,	%l4
	subc	%g3,	%o1,	%g4
	fbul	%fcc3,	loop_1328
	edge8l	%i7,	%i4,	%l0
	movgu	%xcc,	%o7,	%l2
	movrgz	%l6,	%i3,	%i5
loop_1328:
	srl	%i0,	%i1,	%g5
	fmovse	%icc,	%f12,	%f27
	tsubcc	%g1,	0x1200,	%o5
	tleu	%icc,	0x7
	array16	%i6,	%o3,	%l1
	fmovdpos	%icc,	%f7,	%f3
	movrlez	%o6,	0x1E3,	%o4
	ldub	[%l7 + 0x73],	%l3
	set	0x44, %o5
	sta	%f10,	[%l7 + %o5] 0x14
	sdivx	%g7,	0x18FE,	%o2
	xnor	%g2,	0x1716,	%o0
	fnegs	%f11,	%f14
	set	0x78, %i2
	prefetcha	[%l7 + %i2] 0x88,	 0x2
	movgu	%icc,	%g6,	%l4
	mulscc	%i2,	0x0DE7,	%g3
	set	0x44, %i0
	swapa	[%l7 + %i0] 0x18,	%o1
	fmovscc	%icc,	%f21,	%f11
	fmovrslez	%g4,	%f30,	%f7
	bgu	loop_1329
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i4,	%i7
	srlx	%l0,	%l2,	%l6
loop_1329:
	umul	%o7,	%i5,	%i3
	tge	%xcc,	0x5
	stbar
	array32	%i1,	%g5,	%i0
	orn	%o5,	0x1269,	%i6
	stx	%o3,	[%l7 + 0x08]
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x68] %asi,	%l1
	fmovscc	%xcc,	%f19,	%f13
	fmovsg	%xcc,	%f30,	%f18
	edge8ln	%o6,	%o4,	%g1
	andncc	%g7,	%o2,	%g2
	fmovsa	%icc,	%f3,	%f24
	andcc	%o0,	%l5,	%g6
	fmovdcs	%xcc,	%f27,	%f12
	movrne	%l3,	%l4,	%i2
	tvc	%icc,	0x3
	srax	%g3,	0x0A,	%o1
	wr	%g0,	0x2f,	%asi
	stwa	%g4,	[%l7 + 0x10] %asi
	membar	#Sync
	or	%i7,	0x19B9,	%l0
	brnz	%l2,	loop_1330
	or	%i4,	%o7,	%l6
	bn,pt	%icc,	loop_1331
	orn	%i3,	0x02AB,	%i5
loop_1330:
	ldsb	[%l7 + 0x56],	%g5
	flush	%l7 + 0x74
loop_1331:
	tn	%icc,	0x0
	taddcc	%i0,	0x1FA0,	%i1
	fnegs	%f17,	%f17
	movneg	%xcc,	%i6,	%o3
	fcmple16	%f0,	%f4,	%o5
	lduh	[%l7 + 0x40],	%o6
	fbe,a	%fcc1,	loop_1332
	mulx	%l1,	%o4,	%g1
	fmul8ulx16	%f0,	%f28,	%f20
	swap	[%l7 + 0x10],	%g7
loop_1332:
	tg	%xcc,	0x1
	tvs	%xcc,	0x3
	sra	%g2,	%o0,	%o2
	udiv	%l5,	0x0285,	%g6
	movvs	%icc,	%l4,	%i2
	movl	%icc,	%l3,	%o1
	ta	%xcc,	0x5
	fblg	%fcc2,	loop_1333
	sdivcc	%g4,	0x0C79,	%i7
	fblg,a	%fcc1,	loop_1334
	subcc	%l0,	0x0DEF,	%l2
loop_1333:
	xnorcc	%g3,	0x09E5,	%i4
	subccc	%o7,	0x1938,	%l6
loop_1334:
	udivcc	%i3,	0x1656,	%i5
	fexpand	%f30,	%f22
	faligndata	%f0,	%f10,	%f20
	nop
	setx	0x19A5655F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x037928B4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f3,	%f1
	subcc	%i0,	0x1D16,	%i1
	orcc	%i6,	0x110A,	%g5
	edge32l	%o5,	%o3,	%o6
	movn	%icc,	%l1,	%o4
	and	%g1,	%g7,	%o0
	tcs	%icc,	0x2
	movge	%icc,	%o2,	%g2
	sth	%l5,	[%l7 + 0x14]
	edge32l	%l4,	%g6,	%i2
	fnors	%f10,	%f1,	%f30
	movpos	%xcc,	%l3,	%g4
	edge16n	%o1,	%l0,	%i7
	fbue	%fcc1,	loop_1335
	smul	%g3,	0x0184,	%l2
	tne	%xcc,	0x4
	tsubcctv	%o7,	0x16B8,	%l6
loop_1335:
	nop
	wr	%g0,	0xe2,	%asi
	stba	%i3,	[%l7 + 0x7A] %asi
	membar	#Sync
	st	%f0,	[%l7 + 0x50]
	fpadd16s	%f15,	%f11,	%f1
	taddcc	%i4,	0x0C8E,	%i0
	te	%icc,	0x3
	srlx	%i1,	0x02,	%i5
	move	%icc,	%g5,	%i6
	bn,a,pn	%icc,	loop_1336
	fmovsne	%xcc,	%f10,	%f30
	tg	%xcc,	0x7
	edge8l	%o3,	%o6,	%l1
loop_1336:
	edge32ln	%o4,	%g1,	%g7
	sra	%o5,	%o0,	%o2
	movre	%g2,	0x356,	%l4
	fbg,a	%fcc3,	loop_1337
	sdivcc	%l5,	0x1B19,	%g6
	movvc	%xcc,	%l3,	%g4
	fbo,a	%fcc1,	loop_1338
loop_1337:
	xnorcc	%i2,	0x1E69,	%o1
	movrlz	%i7,	0x14B,	%l0
	fnand	%f20,	%f26,	%f24
loop_1338:
	subccc	%l2,	%g3,	%o7
	orn	%i3,	0x1ECB,	%i4
	tpos	%icc,	0x2
	xorcc	%i0,	%l6,	%i5
	set	0x60, %i5
	swapa	[%l7 + %i5] 0x81,	%g5
	stx	%i6,	[%l7 + 0x68]
	fblg	%fcc3,	loop_1339
	ldsh	[%l7 + 0x46],	%i1
	ba	loop_1340
	array8	%o3,	%o6,	%o4
loop_1339:
	tvc	%icc,	0x7
	fsrc1s	%f23,	%f24
loop_1340:
	nop
	set	0x18, %l5
	std	%f20,	[%l7 + %l5]
	nop
	fitos	%f0,	%f2
	fstoi	%f2,	%f29
	for	%f26,	%f20,	%f8
	set	0x24, %l1
	stwa	%l1,	[%l7 + %l1] 0x15
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x68] %asi,	%g7
	stbar
	stw	%o5,	[%l7 + 0x6C]
	nop
	setx	0x406F6D38,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	movge	%icc,	%o0,	%g1
	fmovde	%xcc,	%f0,	%f18
	ta	%xcc,	0x6
	swap	[%l7 + 0x20],	%o2
	xor	%g2,	0x100D,	%l4
	bcs,pt	%icc,	loop_1341
	fornot2	%f22,	%f30,	%f18
	edge32l	%g6,	%l3,	%l5
	bvc,pt	%icc,	loop_1342
loop_1341:
	andn	%i2,	%g4,	%i7
	add	%o1,	%l2,	%l0
	edge16l	%o7,	%g3,	%i3
loop_1342:
	alignaddrl	%i0,	%l6,	%i5
	tcs	%icc,	0x4
	sll	%g5,	%i6,	%i1
	andn	%i4,	0x1635,	%o6
	fbuge	%fcc2,	loop_1343
	addcc	%o4,	0x1898,	%l1
	sdiv	%g7,	0x0098,	%o3
	movrgz	%o5,	%g1,	%o0
loop_1343:
	add	%o2,	0x1794,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f10,	%f2
	fmovda	%icc,	%f14,	%f22
	nop
	setx	loop_1344,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	ldx	[%l7 + 0x50],	%g6
	be,a	%icc,	loop_1345
	ba,a,pn	%xcc,	loop_1346
loop_1344:
	fmovrsgez	%l3,	%f29,	%f7
	ldx	[%l7 + 0x08],	%l4
loop_1345:
	popc	0x114D,	%i2
loop_1346:
	fnot2	%f20,	%f30
	movne	%xcc,	%l5,	%i7
	fmovrslez	%g4,	%f18,	%f9
	taddcc	%l2,	0x0BF0,	%o1
	movrne	%l0,	0x0A3,	%g3
	udivcc	%o7,	0x1EDD,	%i3
	array32	%i0,	%i5,	%l6
	ble,a	loop_1347
	smulcc	%g5,	%i1,	%i4
	edge32ln	%o6,	%i6,	%l1
	fmovdne	%xcc,	%f4,	%f29
loop_1347:
	tvc	%xcc,	0x4
	fbne	%fcc1,	loop_1348
	addccc	%o4,	%g7,	%o5
	ldub	[%l7 + 0x62],	%o3
	stw	%g1,	[%l7 + 0x30]
loop_1348:
	movcs	%xcc,	%o2,	%g2
	fmovdl	%xcc,	%f21,	%f22
	membar	0x14
	fsrc2s	%f8,	%f27
	ldsh	[%l7 + 0x74],	%g6
	fcmple32	%f16,	%f20,	%l3
	mova	%icc,	%o0,	%l4
	tvc	%icc,	0x0
	alignaddrl	%i2,	%l5,	%g4
	and	%i7,	0x1EFC,	%l2
	tl	%xcc,	0x3
	stb	%l0,	[%l7 + 0x16]
	smulcc	%o1,	0x12B3,	%o7
	edge16ln	%i3,	%g3,	%i5
	alignaddrl	%l6,	%i0,	%i1
	movpos	%xcc,	%g5,	%i4
	taddcc	%i6,	0x1C9E,	%o6
	movre	%l1,	0x102,	%g7
	bcc,a,pn	%icc,	loop_1349
	tleu	%icc,	0x5
	swap	[%l7 + 0x3C],	%o4
	fmovrslz	%o5,	%f21,	%f2
loop_1349:
	fpsub16	%f28,	%f0,	%f8
	array32	%o3,	%o2,	%g1
	tne	%xcc,	0x0
	fandnot2s	%f10,	%f31,	%f1
	fsrc1	%f16,	%f12
	addc	%g6,	0x0FEF,	%g2
	bgu,a	%xcc,	loop_1350
	fbo,a	%fcc2,	loop_1351
	xnorcc	%o0,	%l4,	%i2
	movcc	%icc,	%l5,	%g4
loop_1350:
	move	%icc,	%l3,	%l2
loop_1351:
	srax	%i7,	%l0,	%o7
	addccc	%o1,	0x1428,	%g3
	taddcctv	%i5,	0x0D6A,	%i3
	udivx	%i0,	0x0A6C,	%l6
	set	0x35, %o2
	ldsba	[%l7 + %o2] 0x14,	%i1
	fmovsle	%xcc,	%f15,	%f9
	movcs	%icc,	%g5,	%i6
	sdivx	%o6,	0x1F53,	%i4
	move	%icc,	%l1,	%g7
	orncc	%o5,	0x1060,	%o4
	fabsd	%f28,	%f30
	sub	%o2,	%g1,	%o3
	membar	#Sync
	set	0x40, %l2
	ldda	[%l7 + %l2] 0xf0,	%f0
	tpos	%xcc,	0x6
	fbuge,a	%fcc0,	loop_1352
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g6,	%g2,	%l4
	edge16ln	%i2,	%l5,	%g4
loop_1352:
	st	%f25,	[%l7 + 0x3C]
	sll	%l3,	%o0,	%i7
	fbuge,a	%fcc1,	loop_1353
	movn	%icc,	%l0,	%l2
	movrlz	%o1,	%o7,	%g3
	movne	%icc,	%i5,	%i0
loop_1353:
	fcmpgt32	%f10,	%f8,	%l6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i1,	%g5
	udiv	%i6,	0x11CE,	%i3
	ld	[%l7 + 0x54],	%f29
	sra	%i4,	%o6,	%g7
	fexpand	%f16,	%f16
	edge32ln	%o5,	%o4,	%l1
	ldd	[%l7 + 0x48],	%f24
	movre	%g1,	0x05E,	%o2
	smulcc	%o3,	0x1915,	%g6
	sdiv	%g2,	0x1F2B,	%i2
	tge	%xcc,	0x7
	movrlz	%l4,	%g4,	%l3
	fbge,a	%fcc1,	loop_1354
	array32	%o0,	%l5,	%i7
	movleu	%xcc,	%l0,	%l2
	move	%icc,	%o7,	%g3
loop_1354:
	tl	%xcc,	0x6
	srlx	%o1,	0x1C,	%i5
	srlx	%l6,	0x17,	%i1
	tl	%xcc,	0x4
	fabss	%f26,	%f22
	fbge	%fcc1,	loop_1355
	tneg	%icc,	0x0
	smulcc	%i0,	0x0970,	%g5
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x40] %asi,	%i6
loop_1355:
	movgu	%icc,	%i3,	%i4
	fmovdvc	%icc,	%f11,	%f1
	set	0x60, %g1
	ldxa	[%l7 + %g1] 0x0c,	%o6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x1C] %asi,	%f25
	fblg,a	%fcc2,	loop_1356
	bcs	%xcc,	loop_1357
	fabsd	%f30,	%f14
	fxors	%f4,	%f19,	%f14
loop_1356:
	tcc	%xcc,	0x6
loop_1357:
	sra	%o5,	%g7,	%o4
	sdivcc	%g1,	0x0097,	%l1
	tcc	%xcc,	0x7
	move	%xcc,	%o2,	%o3
	umulcc	%g6,	%i2,	%g2
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0xf1
	membar	#Sync
	fbne,a	%fcc3,	loop_1358
	smulcc	%l4,	%g4,	%o0
	tn	%xcc,	0x1
	orncc	%l3,	0x0A91,	%i7
loop_1358:
	srax	%l5,	%l2,	%l0
	nop
	setx	0x40532DCE,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	edge8ln	%g3,	%o7,	%o1
	taddcc	%l6,	%i5,	%i0
	bn,a	%icc,	loop_1359
	fmovsgu	%xcc,	%f5,	%f0
	fmovscc	%icc,	%f18,	%f31
	fmovdneg	%icc,	%f4,	%f30
loop_1359:
	swap	[%l7 + 0x70],	%g5
	popc	%i6,	%i1
	tsubcc	%i3,	0x1024,	%i4
	stb	%o6,	[%l7 + 0x5F]
	movcs	%icc,	%o5,	%o4
	edge16ln	%g7,	%g1,	%l1
	movne	%xcc,	%o3,	%o2
	fmovse	%icc,	%f15,	%f1
	fmovdleu	%xcc,	%f5,	%f19
	ldub	[%l7 + 0x40],	%g6
	tleu	%icc,	0x7
	edge16ln	%g2,	%l4,	%g4
	edge8	%i2,	%o0,	%l3
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f14
	fxtod	%f14,	%f4
	fmovsa	%xcc,	%f22,	%f22
	edge16l	%i7,	%l5,	%l2
	be,a	loop_1360
	edge8n	%g3,	%l0,	%o1
	te	%xcc,	0x0
	fmovdneg	%xcc,	%f26,	%f14
loop_1360:
	nop
	setx	0x0231B416,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xE6E1BE0E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fmuls	%f22,	%f17,	%f31
	udivcc	%o7,	0x0789,	%i5
	fabss	%f17,	%f7
	movneg	%icc,	%i0,	%l6
	subccc	%i6,	0x0469,	%g5
	fpadd16	%f22,	%f18,	%f2
	nop
	setx	0x5B9ED5339952DFCD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f6
	fmovdle	%xcc,	%f23,	%f26
	wr	%g0,	0x27,	%asi
	stba	%i3,	[%l7 + 0x5D] %asi
	membar	#Sync
	brz,a	%i4,	loop_1361
	bvs,pn	%xcc,	loop_1362
	mova	%xcc,	%i1,	%o5
	edge16n	%o4,	%g7,	%o6
loop_1361:
	fmovrdgez	%g1,	%f22,	%f14
loop_1362:
	fmovdvc	%icc,	%f27,	%f7
	fmul8sux16	%f20,	%f6,	%f26
	movre	%l1,	%o3,	%o2
	array16	%g6,	%l4,	%g2
	edge16n	%g4,	%o0,	%i2
	fmovdneg	%icc,	%f23,	%f20
	udivx	%i7,	0x09F1,	%l3
	ldsh	[%l7 + 0x5C],	%l5
	fbl	%fcc2,	loop_1363
	bvs,a,pn	%icc,	loop_1364
	edge16ln	%g3,	%l0,	%o1
	nop
	setx	0x6B08963A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f18
loop_1363:
	tle	%xcc,	0x0
loop_1364:
	movrne	%o7,	%i5,	%l2
	or	%i0,	%l6,	%i6
	fpsub32s	%f29,	%f8,	%f20
	bcs,pn	%icc,	loop_1365
	te	%icc,	0x0
	brnz	%i3,	loop_1366
	array16	%i4,	%i1,	%g5
loop_1365:
	movvs	%xcc,	%o4,	%g7
	bl	%icc,	loop_1367
loop_1366:
	alignaddr	%o5,	%g1,	%o6
	subc	%l1,	0x1930,	%o2
	set	0x1D, %g7
	stba	%o3,	[%l7 + %g7] 0x80
loop_1367:
	bg,a,pn	%xcc,	loop_1368
	orncc	%g6,	%l4,	%g4
	andcc	%g2,	0x1559,	%i2
	movg	%xcc,	%o0,	%i7
loop_1368:
	sir	0x07AA
	sir	0x0E8B
	nop
	fitod	%f12,	%f18
	fdtos	%f18,	%f7
	edge32	%l5,	%g3,	%l3
	fmovsvs	%icc,	%f19,	%f25
	ldstub	[%l7 + 0x2D],	%o1
	nop
	setx	0x68649CA3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x841E416D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fsubs	%f18,	%f22,	%f30
	fpsub32s	%f7,	%f0,	%f4
	tcs	%icc,	0x5
	sub	%o7,	%l0,	%i5
	edge32	%l2,	%i0,	%l6
	fmovrde	%i6,	%f8,	%f6
	movrgez	%i3,	0x07C,	%i1
	tvs	%xcc,	0x1
	nop
	setx	0x0883929D8BB5E6D3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x2A232FEDD55E49C6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f22,	%f8
	membar	0x44
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] 0x88,	%i4,	%o4
	orcc	%g5,	0x1C87,	%g7
	fbue	%fcc3,	loop_1369
	lduh	[%l7 + 0x2C],	%g1
	tle	%xcc,	0x1
	sdivcc	%o6,	0x08EC,	%l1
loop_1369:
	movre	%o5,	0x2C2,	%o3
	bcc,a	loop_1370
	fandnot1s	%f8,	%f28,	%f23
	set	0x70, %i7
	lduwa	[%l7 + %i7] 0x04,	%o2
loop_1370:
	movvc	%xcc,	%g6,	%l4
	st	%f13,	[%l7 + 0x60]
	add	%g4,	0x070F,	%g2
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
	tg	%xcc,	0x5
	movleu	%xcc,	%o0,	%i2
	sll	%i7,	%l5,	%g3
loop_1371:
	nop
	set	0x32, %g4
	stha	%o1,	[%l7 + %g4] 0x0c
	srl	%l3,	%o7,	%l0
	movg	%xcc,	%i5,	%l2
	fbul	%fcc3,	loop_1372
	movl	%icc,	%l6,	%i6
	movvc	%icc,	%i3,	%i0
	ble,a	%icc,	loop_1373
loop_1372:
	fmovsleu	%xcc,	%f14,	%f17
	bgu,a	%xcc,	loop_1374
	fmovscs	%xcc,	%f7,	%f4
loop_1373:
	popc	%i4,	%o4
	movpos	%icc,	%i1,	%g5
loop_1374:
	nop
	set	0x20, %o6
	stxa	%g7,	[%l7 + %o6] 0x18
	tn	%xcc,	0x1
	fmul8x16au	%f2,	%f12,	%f24
	edge8l	%o6,	%g1,	%o5
	tle	%icc,	0x4
	fornot1	%f22,	%f30,	%f10
	and	%l1,	0x0F53,	%o2
	xnorcc	%o3,	%l4,	%g6
	fmovdle	%xcc,	%f13,	%f26
	orn	%g2,	%o0,	%g4
	bl,a,pt	%icc,	loop_1375
	or	%i2,	%l5,	%i7
	nop
	set	0x70, %i6
	stx	%g3,	[%l7 + %i6]
	nop
	setx	loop_1376,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1375:
	fmovrsgez	%l3,	%f9,	%f2
	sethi	0x004F,	%o7
	movl	%xcc,	%o1,	%l0
loop_1376:
	add	%i5,	%l6,	%l2
	sllx	%i3,	%i0,	%i4
	sub	%i6,	%i1,	%o4
	fbg	%fcc1,	loop_1377
	mova	%icc,	%g7,	%o6
	fnands	%f27,	%f5,	%f14
	fzero	%f6
loop_1377:
	edge32l	%g1,	%g5,	%l1
	nop
	setx loop_1378, %l0, %l1
	jmpl %l1, %o2
	subcc	%o3,	%o5,	%g6
	umulcc	%g2,	%l4,	%o0
	tpos	%icc,	0x2
loop_1378:
	bshuffle	%f16,	%f30,	%f0
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	fitos	%f12,	%f15
	fstox	%f15,	%f16
	bg	loop_1379
	orn	%i2,	0x1ACC,	%l5
	edge8	%g4,	%i7,	%g3
	addc	%o7,	%o1,	%l3
loop_1379:
	ldd	[%l7 + 0x30],	%l0
	fnot1s	%f13,	%f13
	addc	%l6,	%i5,	%l2
	smulcc	%i0,	%i4,	%i3
	movrne	%i1,	%o4,	%g7
	smul	%i6,	0x03B9,	%o6
	bcs,a,pn	%icc,	loop_1380
	mulx	%g1,	0x075B,	%g5
	te	%xcc,	0x4
	fornot2s	%f2,	%f14,	%f28
loop_1380:
	fbule	%fcc3,	loop_1381
	movge	%xcc,	%l1,	%o2
	fnor	%f6,	%f28,	%f16
	addc	%o3,	%g6,	%g2
loop_1381:
	call	loop_1382
	movrgez	%o5,	%o0,	%i2
	be,pt	%icc,	loop_1383
	edge16n	%l5,	%g4,	%l4
loop_1382:
	andncc	%g3,	%i7,	%o7
	fnors	%f0,	%f13,	%f27
loop_1383:
	bcs	loop_1384
	fbn	%fcc2,	loop_1385
	move	%icc,	%o1,	%l3
	st	%f11,	[%l7 + 0x30]
loop_1384:
	smulcc	%l0,	0x09BF,	%l6
loop_1385:
	sdivx	%i5,	0x06AC,	%l2
	edge8ln	%i0,	%i4,	%i3
	andn	%i1,	%o4,	%i6
	edge16l	%g7,	%g1,	%o6
	ta	%icc,	0x2
	fmovdle	%icc,	%f23,	%f25
	addccc	%g5,	0x0B8B,	%o2
	movrgez	%l1,	0x1BD,	%o3
	for	%f22,	%f24,	%f28
	udiv	%g2,	0x0AE7,	%g6
	taddcctv	%o0,	0x1483,	%i2
	edge16ln	%o5,	%g4,	%l4
	nop
	setx	0x89B50156,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xA7A5BE78,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fmuls	%f28,	%f0,	%f1
	movvs	%xcc,	%g3,	%l5
	bn,a	%icc,	loop_1386
	srlx	%o7,	0x0F,	%i7
	ldstub	[%l7 + 0x35],	%o1
	xorcc	%l0,	%l3,	%l6
loop_1386:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%i5,	%i0
	movleu	%xcc,	%l2,	%i4
	xor	%i1,	%o4,	%i6
	movgu	%icc,	%i3,	%g7
	orn	%o6,	0x0DC9,	%g5
	umul	%o2,	0x1F69,	%l1
	tcs	%xcc,	0x4
	fbul,a	%fcc2,	loop_1387
	taddcc	%g1,	%g2,	%g6
	bpos	loop_1388
	movleu	%xcc,	%o3,	%o0
loop_1387:
	addc	%i2,	0x163B,	%g4
	array32	%l4,	%o5,	%l5
loop_1388:
	tsubcc	%o7,	%g3,	%o1
	tcc	%icc,	0x0
	bvc	loop_1389
	fpmerge	%f26,	%f26,	%f2
	for	%f2,	%f18,	%f24
	fmovsl	%xcc,	%f3,	%f2
loop_1389:
	movpos	%icc,	%i7,	%l0
	fpsub32	%f10,	%f6,	%f12
	sra	%l6,	%i5,	%i0
	fmovscc	%xcc,	%f7,	%f18
	tsubcc	%l3,	0x0C75,	%l2
	xor	%i4,	0x0523,	%i1
	nop
	set	0x2A, %g6
	ldsh	[%l7 + %g6],	%o4
	sth	%i3,	[%l7 + 0x26]
	orcc	%g7,	0x1959,	%o6
	tpos	%xcc,	0x5
	tvs	%xcc,	0x0
	fbo	%fcc3,	loop_1390
	udiv	%i6,	0x051A,	%o2
	movg	%icc,	%g5,	%l1
	movrgez	%g1,	%g6,	%g2
loop_1390:
	nop
	setx	loop_1391,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	be,pt	%icc,	loop_1392
	fmul8ulx16	%f2,	%f0,	%f22
	movrgez	%o3,	%i2,	%g4
loop_1391:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1392:
	nop
	set	0x28, %l0
	sta	%f5,	[%l7 + %l0] 0x19
	stx	%l4,	[%l7 + 0x38]
	nop
	setx	loop_1393,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fnegs	%f11,	%f1
	sub	%o0,	0x0651,	%o5
	sdivcc	%o7,	0x0A51,	%l5
loop_1393:
	bcc	%xcc,	loop_1394
	bvc,pt	%icc,	loop_1395
	movrlez	%g3,	%o1,	%i7
	ld	[%l7 + 0x50],	%f23
loop_1394:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%l6,	%i5
loop_1395:
	udiv	%i0,	0x199A,	%l3
	fmovrde	%l2,	%f20,	%f20
	movg	%icc,	%i4,	%i1
	alignaddr	%o4,	%l0,	%i3
	fcmpeq16	%f2,	%f10,	%o6
	fmul8x16al	%f7,	%f13,	%f18
	umul	%i6,	%o2,	%g5
	smul	%l1,	0x00A0,	%g7
	udivcc	%g1,	0x1069,	%g2
	stx	%o3,	[%l7 + 0x30]
	sllx	%i2,	0x05,	%g4
	fpadd32	%f4,	%f26,	%f2
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
	stb	%g6,	[%l7 + 0x2B]
	wr	%g0,	0x10,	%asi
	stba	%l4,	[%l7 + 0x2C] %asi
loop_1396:
	orcc	%o0,	0x070B,	%o7
	bgu,pn	%icc,	loop_1397
	smul	%l5,	0x183D,	%g3
	bcc,a	loop_1398
	subc	%o1,	0x0E28,	%i7
loop_1397:
	movrgz	%l6,	%i5,	%o5
	bvc,a,pn	%xcc,	loop_1399
loop_1398:
	nop
	setx loop_1400, %l0, %l1
	jmpl %l1, %i0
	or	%l2,	%i4,	%i1
	sethi	0x0FCE,	%l3
loop_1399:
	orn	%l0,	%o4,	%o6
loop_1400:
	fandnot1s	%f31,	%f23,	%f4
	tvc	%icc,	0x4
	fand	%f12,	%f0,	%f14
	fors	%f29,	%f28,	%f15
	sub	%i3,	%o2,	%g5
	movpos	%xcc,	%i6,	%l1
	tn	%icc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g7,	%g2,	%g1
	movrne	%o3,	0x0F9,	%i2
	fmovsgu	%icc,	%f1,	%f22
	xor	%g4,	0x0B48,	%g6
	nop
	setx	0x06E42EC2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x6DDAAAC1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f6,	%f1
	nop
	setx	0x768D188C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x2F9567C7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f12,	%f2
	edge16l	%o0,	%o7,	%l5
	add	%l4,	0x0F40,	%g3
	fandnot2	%f28,	%f20,	%f16
	ld	[%l7 + 0x34],	%f24
	fmovrdgz	%o1,	%f28,	%f28
	movrgz	%i7,	%i5,	%l6
	brlz	%i0,	loop_1401
	movleu	%xcc,	%l2,	%o5
	membar	0x61
	bl,a	loop_1402
loop_1401:
	ldub	[%l7 + 0x26],	%i4
	tsubcctv	%i1,	%l3,	%o4
	addccc	%o6,	%l0,	%i3
loop_1402:
	edge32l	%g5,	%o2,	%l1
	std	%f24,	[%l7 + 0x10]
	alignaddrl	%g7,	%g2,	%i6
	set	0x3C, %g5
	lda	[%l7 + %g5] 0x10,	%f16
	mulx	%o3,	%i2,	%g4
	add	%g6,	%o0,	%g1
	fmovda	%xcc,	%f2,	%f24
	fpmerge	%f29,	%f23,	%f30
	orn	%l5,	%o7,	%l4
	orn	%g3,	%i7,	%i5
	fmovrsne	%o1,	%f3,	%f23
	edge16	%l6,	%l2,	%i0
	fmovdvc	%icc,	%f0,	%f3
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i4
	casxa	[%l6] %asi,	%i4,	%i1
	orcc	%o5,	%o4,	%o6
	movrne	%l0,	0x0C6,	%l3
	sdivx	%g5,	0x1A44,	%i3
	movgu	%xcc,	%l1,	%g7
	fbn,a	%fcc1,	loop_1403
	fornot2s	%f25,	%f8,	%f2
	tn	%icc,	0x7
	brnz,a	%g2,	loop_1404
loop_1403:
	tsubcc	%o2,	%i6,	%o3
	addccc	%i2,	0x1F9A,	%g6
	xnorcc	%o0,	%g1,	%l5
loop_1404:
	srl	%o7,	0x1A,	%l4
	edge16n	%g4,	%g3,	%i5
	movrlez	%o1,	%i7,	%l2
	edge16l	%i0,	%l6,	%i1
	te	%xcc,	0x0
	edge8	%i4,	%o5,	%o6
	move	%xcc,	%l0,	%l3
	nop
	setx	0x49D8A549905544F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	fpadd16	%f28,	%f22,	%f2
	fble	%fcc1,	loop_1405
	fmovsvs	%xcc,	%f15,	%f24
	ldsw	[%l7 + 0x44],	%g5
	fpsub16	%f0,	%f16,	%f14
loop_1405:
	ldub	[%l7 + 0x65],	%i3
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f15
	lduh	[%l7 + 0x14],	%o4
	smul	%g7,	%l1,	%g2
	tne	%icc,	0x6
	edge32l	%o2,	%o3,	%i6
	sir	0x0CA8
	fsrc1	%f28,	%f6
	udivx	%g6,	0x1E25,	%o0
	array32	%i2,	%g1,	%o7
	tn	%xcc,	0x6
	movrgz	%l5,	%l4,	%g3
	umul	%i5,	%g4,	%i7
	xor	%o1,	0x06B5,	%l2
	sub	%l6,	0x0945,	%i1
	wr	%g0,	0x88,	%asi
	sta	%f23,	[%l7 + 0x70] %asi
	addcc	%i0,	%o5,	%o6
	or	%l0,	%l3,	%i4
	nop
	set	0x39, %o7
	stb	%i3,	[%l7 + %o7]
	fandnot1	%f10,	%f10,	%f4
	fmovdge	%icc,	%f21,	%f30
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x2A] %asi,	%g5
	fnegs	%f29,	%f17
	alignaddrl	%o4,	%g7,	%l1
	movle	%icc,	%g2,	%o2
	set	0x61, %l6
	stba	%o3,	[%l7 + %l6] 0x2f
	membar	#Sync
	fbo	%fcc1,	loop_1406
	edge8l	%g6,	%o0,	%i2
	tneg	%icc,	0x5
	be,a,pn	%icc,	loop_1407
loop_1406:
	edge8n	%g1,	%i6,	%l5
	mova	%icc,	%o7,	%l4
	ta	%xcc,	0x3
loop_1407:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%xcc,	%f27,	%f18
	tg	%icc,	0x0
	movleu	%xcc,	%i5,	%g4
	sra	%i7,	%o1,	%l2
	tl	%icc,	0x5
	fandnot1	%f0,	%f24,	%f20
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x58] %asi,	%l6
	ba,a,pn	%icc,	loop_1408
	nop
	setx loop_1409, %l0, %l1
	jmpl %l1, %g3
	brlez	%i1,	loop_1410
	fmovdcs	%xcc,	%f21,	%f15
loop_1408:
	tne	%xcc,	0x1
loop_1409:
	sethi	0x1496,	%i0
loop_1410:
	flush	%l7 + 0x44
	tsubcc	%o6,	0x0734,	%o5
	fbn,a	%fcc2,	loop_1411
	edge8n	%l3,	%l0,	%i3
	mulx	%g5,	0x03FD,	%o4
	bvs	%icc,	loop_1412
loop_1411:
	tvs	%icc,	0x1
	edge16n	%i4,	%g7,	%g2
	set	0x70, %o3
	lduba	[%l7 + %o3] 0x04,	%o2
loop_1412:
	edge16l	%o3,	%g6,	%o0
	ta	%icc,	0x5
	sra	%l1,	0x12,	%i2
	movne	%xcc,	%i6,	%l5
	movne	%xcc,	%g1,	%o7
	movrlez	%i5,	%l4,	%i7
	fmovdvc	%xcc,	%f30,	%f7
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
	ta	%xcc,	0x6
	smul	%g4,	%l2,	%o1
	movl	%icc,	%l6,	%i1
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%g3
	stb	%o6,	[%l7 + 0x21]
	edge32ln	%i0,	%o5,	%l0
	ta	%xcc,	0x1
	fba	%fcc3,	loop_1413
	orn	%i3,	0x1DB4,	%g5
	movrne	%l3,	0x16E,	%o4
	tgu	%icc,	0x2
loop_1413:
	subc	%g7,	%g2,	%o2
	bneg,pn	%icc,	loop_1414
	sethi	0x0EBE,	%o3
	sir	0x0D74
	bleu,a,pt	%xcc,	loop_1415
loop_1414:
	sir	0x07DF
	nop
	setx	0x6CBF230DE5399301,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xD093062DF5C5657B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f12,	%f16
	andcc	%g6,	%i4,	%o0
loop_1415:
	add	%i2,	0x0C89,	%l1
	flush	%l7 + 0x50
	movvc	%xcc,	%l5,	%i6
	sdivx	%o7,	0x11B6,	%i5
	fmul8x16al	%f14,	%f18,	%f2
	set	0x10, %o4
	lduha	[%l7 + %o4] 0x04,	%l4
	movrlez	%i7,	%g1,	%l2
	xnor	%o1,	0x0483,	%g4
	stw	%l6,	[%l7 + 0x54]
	fmovspos	%icc,	%f12,	%f9
	fmovrsne	%g3,	%f13,	%f9
	edge16n	%o6,	%i1,	%o5
	addcc	%l0,	0x1EDC,	%i0
	srax	%i3,	0x13,	%l3
	or	%g5,	0x054A,	%o4
	fmovs	%f5,	%f12
	movg	%icc,	%g7,	%g2
	fbug	%fcc2,	loop_1416
	sdivcc	%o2,	0x18EE,	%o3
	edge32ln	%g6,	%o0,	%i2
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%l1,	%i4
loop_1416:
	fmovscc	%xcc,	%f21,	%f17
	tneg	%xcc,	0x5
	fmovrslez	%i6,	%f2,	%f14
	nop
	fitos	%f11,	%f15
	fstox	%f15,	%f12
	fmovsvs	%xcc,	%f21,	%f24
	movgu	%xcc,	%l5,	%i5
	or	%l4,	%o7,	%i7
	orn	%l2,	%o1,	%g1
	swap	[%l7 + 0x4C],	%l6
	sra	%g3,	0x1D,	%g4
	tgu	%icc,	0x5
	edge32l	%i1,	%o5,	%l0
	te	%icc,	0x1
	edge8	%o6,	%i0,	%l3
	tne	%xcc,	0x0
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x7E] %asi,	%i3
	edge16n	%g5,	%g7,	%o4
	tgu	%xcc,	0x5
	movrne	%g2,	0x06A,	%o3
	srax	%g6,	%o0,	%i2
	smulcc	%l1,	%i4,	%o2
	srlx	%l5,	0x06,	%i5
	tpos	%xcc,	0x5
	ldsh	[%l7 + 0x16],	%i6
	sdivcc	%o7,	0x1CDD,	%l4
	ble,a,pt	%xcc,	loop_1417
	taddcc	%l2,	0x0C66,	%o1
	fmovs	%f13,	%f10
	umul	%i7,	%l6,	%g1
loop_1417:
	bne	%xcc,	loop_1418
	subccc	%g4,	%g3,	%o5
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i1,	%l0
loop_1418:
	movcc	%icc,	%i0,	%o6
	add	%l7,	0x40,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%g5
	sll	%g7,	0x07,	%i3
	sllx	%g2,	0x18,	%o3
	tvs	%xcc,	0x0
	ble,a	%xcc,	loop_1419
	tvs	%xcc,	0x1
	edge16ln	%g6,	%o4,	%i2
	tn	%xcc,	0x0
loop_1419:
	tgu	%xcc,	0x3
	edge16	%o0,	%l1,	%o2
	fpack16	%f26,	%f24
	movrne	%i4,	0x2A9,	%l5
	tsubcc	%i5,	0x07D8,	%i6
	bpos	loop_1420
	xorcc	%l4,	0x0533,	%l2
	umul	%o7,	%i7,	%l6
	movcs	%xcc,	%o1,	%g1
loop_1420:
	udivcc	%g3,	0x1BEE,	%g4
	movvs	%icc,	%o5,	%i1
	swap	[%l7 + 0x18],	%i0
	udivx	%o6,	0x0A70,	%l0
	be,pn	%xcc,	loop_1421
	fmovrdlz	%l3,	%f16,	%f30
	ldsb	[%l7 + 0x1A],	%g5
	lduh	[%l7 + 0x5A],	%i3
loop_1421:
	nop
	fitod	%f12,	%f30
	bneg,pn	%xcc,	loop_1422
	tl	%icc,	0x5
	sethi	0x1529,	%g2
	xnor	%g7,	%g6,	%o4
loop_1422:
	tneg	%icc,	0x7
	ld	[%l7 + 0x08],	%f6
	edge8l	%i2,	%o0,	%l1
	array8	%o2,	%o3,	%i4
	udivcc	%i5,	0x0CC1,	%i6
	movvs	%xcc,	%l5,	%l4
	sllx	%l2,	0x1D,	%o7
	bleu,a	loop_1423
	membar	0x2A
	set	0x70, %i3
	ldda	[%l7 + %i3] 0x2e,	%i6
loop_1423:
	st	%f24,	[%l7 + 0x34]
	set	0x34, %o1
	ldsha	[%l7 + %o1] 0x11,	%i7
	mulscc	%o1,	0x0E2E,	%g1
	set	0x70, %g3
	ldda	[%l7 + %g3] 0x80,	%g4
	add	%g3,	0x098A,	%o5
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x5C] %asi,	%i1
	st	%f10,	[%l7 + 0x50]
	array16	%o6,	%l0,	%l3
	movrlez	%g5,	0x2EC,	%i3
	movge	%xcc,	%g2,	%g7
	tg	%icc,	0x2
	fmovdl	%icc,	%f21,	%f22
	nop
	fitos	%f2,	%f1
	movrne	%g6,	%o4,	%i0
	bne,pn	%xcc,	loop_1424
	te	%xcc,	0x1
	tg	%xcc,	0x3
	nop
	fitos	%f7,	%f8
	fstod	%f8,	%f30
loop_1424:
	tneg	%icc,	0x3
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x20] %asi,	%o0
	sdivcc	%i2,	0x04FE,	%l1
	lduh	[%l7 + 0x0C],	%o3
	xor	%i4,	0x12CD,	%i5
	umulcc	%i6,	0x0C15,	%o2
	subcc	%l5,	%l2,	%o7
	edge16	%l6,	%l4,	%o1
	wr	%g0,	0x81,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	sdivcc	%g1,	0x1E7D,	%g4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x81
	sub	%i7,	0x09A4,	%o5
	fpadd16	%f30,	%f8,	%f14
	brnz	%i1,	loop_1425
	fone	%f20
	movcs	%xcc,	%g3,	%o6
	nop
	setx	loop_1426,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1425:
	movgu	%xcc,	%l0,	%g5
	udiv	%l3,	0x0807,	%g2
	sra	%i3,	0x14,	%g7
loop_1426:
	fbu,a	%fcc0,	loop_1427
	te	%icc,	0x1
	fmovsneg	%xcc,	%f3,	%f10
	movne	%icc,	%o4,	%g6
loop_1427:
	fmovsn	%xcc,	%f2,	%f15
	ta	%icc,	0x0
	stbar
	xnor	%i0,	%o0,	%l1
	nop
	fitod	%f12,	%f24
	fdtos	%f24,	%f7
	mova	%icc,	%o3,	%i2
	nop
	setx	0x4A36D940,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xF2B4486C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f30,	%f23
	fands	%f27,	%f7,	%f7
	bcc,a	%xcc,	loop_1428
	xnor	%i4,	0x041B,	%i6
	fmovdpos	%xcc,	%f17,	%f9
	fzeros	%f18
loop_1428:
	array8	%i5,	%o2,	%l5
	addcc	%l2,	%o7,	%l6
	movre	%o1,	0x088,	%l4
	subccc	%g4,	0x0ADF,	%g1
	be,a,pn	%icc,	loop_1429
	addcc	%o5,	0x1A36,	%i1
	srax	%g3,	%o6,	%l0
	swap	[%l7 + 0x40],	%i7
loop_1429:
	fblg	%fcc2,	loop_1430
	xor	%g5,	0x1284,	%g2
	ldsh	[%l7 + 0x1A],	%i3
	addcc	%l3,	0x1FD2,	%o4
loop_1430:
	or	%g7,	%g6,	%i0
	edge16	%l1,	%o3,	%o0
	sra	%i4,	0x1A,	%i2
	stx	%i5,	[%l7 + 0x10]
	mulscc	%o2,	0x1070,	%i6
	fmovrde	%l2,	%f2,	%f14
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x0F] %asi,	%l5
	tne	%xcc,	0x5
	fbne,a	%fcc0,	loop_1431
	ble	loop_1432
	movgu	%icc,	%l6,	%o7
	sra	%l4,	0x1A,	%g4
loop_1431:
	nop
	set	0x70, %i4
	swapa	[%l7 + %i4] 0x0c,	%g1
loop_1432:
	umul	%o1,	%i1,	%g3
	bleu	loop_1433
	umulcc	%o6,	%o5,	%i7
	mulscc	%g5,	%g2,	%l0
	movvs	%icc,	%i3,	%l3
loop_1433:
	bgu,pt	%icc,	loop_1434
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%xcc,	0x6
	taddcctv	%o4,	0x16EB,	%g6
loop_1434:
	brgz	%g7,	loop_1435
	call	loop_1436
	umul	%i0,	%l1,	%o0
	fmovsa	%icc,	%f30,	%f30
loop_1435:
	movne	%xcc,	%i4,	%o3
loop_1436:
	fnot1s	%f15,	%f15
	brz	%i5,	loop_1437
	srl	%o2,	0x13,	%i2
	smulcc	%l2,	0x08E8,	%l5
	edge32	%l6,	%o7,	%l4
loop_1437:
	movcc	%xcc,	%g4,	%g1
	srlx	%o1,	%i1,	%i6
	tgu	%icc,	0x1
	nop
	setx loop_1438, %l0, %l1
	jmpl %l1, %o6
	fbl,a	%fcc1,	loop_1439
	fmovrse	%o5,	%f5,	%f5
	movne	%icc,	%i7,	%g5
loop_1438:
	fbg,a	%fcc1,	loop_1440
loop_1439:
	addccc	%g3,	%l0,	%g2
	brlez	%l3,	loop_1441
	fmovrdgez	%i3,	%f0,	%f24
loop_1440:
	tcs	%icc,	0x1
	fbuge	%fcc1,	loop_1442
loop_1441:
	tle	%icc,	0x0
	tsubcctv	%g6,	0x0B04,	%g7
	movpos	%icc,	%o4,	%l1
loop_1442:
	nop
	fitos	%f3,	%f11
	fstod	%f11,	%f12
	edge8	%i0,	%o0,	%o3
	fors	%f2,	%f11,	%f3
	nop
	fitos	%f14,	%f21
	fstox	%f21,	%f22
	fxtos	%f22,	%f1
	sdivcc	%i5,	0x195B,	%i4
	tneg	%xcc,	0x2
	sllx	%i2,	%o2,	%l5
	xor	%l2,	0x17F4,	%l6
	fmovdvs	%xcc,	%f1,	%f17
	sllx	%l4,	%g4,	%o7
	fblg	%fcc1,	loop_1443
	umulcc	%o1,	0x09B1,	%g1
	fmovs	%f21,	%f22
	edge32l	%i1,	%i6,	%o5
loop_1443:
	tsubcctv	%o6,	0x1F12,	%g5
	tgu	%icc,	0x1
	alignaddr	%g3,	%l0,	%g2
	nop
	setx	0x44C48A5B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xC597EF98,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fmuls	%f20,	%f2,	%f17
	umul	%l3,	%i7,	%g6
	subc	%g7,	%i3,	%l1
	fmovscs	%icc,	%f31,	%f25
	movneg	%xcc,	%o4,	%o0
	nop
	fitod	%f6,	%f30
	fdtoi	%f30,	%f29
	xor	%o3,	%i0,	%i4
	udivcc	%i2,	0x1503,	%i5
	tn	%icc,	0x5
	srax	%l5,	0x18,	%l2
	fbu	%fcc1,	loop_1444
	movrlz	%l6,	%o2,	%l4
	alignaddrl	%g4,	%o7,	%g1
	fsrc2s	%f20,	%f9
loop_1444:
	sdiv	%i1,	0x133F,	%o1
	edge32ln	%o5,	%i6,	%o6
	brz,a	%g3,	loop_1445
	edge8n	%l0,	%g5,	%l3
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x70] %asi,	%g2
loop_1445:
	alignaddrl	%g6,	%g7,	%i3
	wr	%g0,	0xeb,	%asi
	stba	%l1,	[%l7 + 0x20] %asi
	membar	#Sync
	edge8l	%o4,	%o0,	%o3
	bvs	loop_1446
	alignaddr	%i7,	%i0,	%i2
	fbug	%fcc3,	loop_1447
	tsubcc	%i5,	%i4,	%l5
loop_1446:
	movne	%xcc,	%l6,	%l2
	bvc,a	%xcc,	loop_1448
loop_1447:
	subc	%l4,	0x0616,	%o2
	fmovsvs	%icc,	%f7,	%f11
	fmovde	%icc,	%f30,	%f26
loop_1448:
	edge32l	%o7,	%g1,	%i1
	mulx	%o1,	%o5,	%g4
	edge8	%o6,	%i6,	%l0
	edge16l	%g3,	%l3,	%g5
	umulcc	%g6,	%g2,	%i3
	tvs	%xcc,	0x5
	bvc,pt	%icc,	loop_1449
	fmovsle	%xcc,	%f13,	%f0
	fmovsvc	%icc,	%f14,	%f5
	brnz,a	%g7,	loop_1450
loop_1449:
	nop
	fitod	%f12,	%f12
	fdtos	%f12,	%f12
	tcc	%icc,	0x3
	tsubcctv	%o4,	0x14E7,	%l1
loop_1450:
	tcc	%xcc,	0x3
	nop
	setx	0x61C4CAA9605ED1E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	fbg	%fcc1,	loop_1451
	tvs	%xcc,	0x7
	nop
	setx	0x8A43E02275B16C2E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xE6B0C27CC926AC31,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f20,	%f16
	andncc	%o3,	%o0,	%i0
loop_1451:
	fpadd16	%f0,	%f10,	%f0
	fbue	%fcc3,	loop_1452
	movrlez	%i2,	%i7,	%i5
	fones	%f0
	mova	%icc,	%i4,	%l5
loop_1452:
	prefetch	[%l7 + 0x6C],	 0x1
	movneg	%icc,	%l6,	%l2
	movrlez	%o2,	%l4,	%o7
	te	%xcc,	0x1
	umul	%i1,	0x1EDA,	%o1
	move	%xcc,	%o5,	%g4
	tpos	%icc,	0x2
	sllx	%o6,	%i6,	%l0
	movrgez	%g1,	%l3,	%g3
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x15,	%f16
	edge32n	%g5,	%g2,	%i3
	sub	%g6,	%o4,	%g7
	edge8l	%o3,	%l1,	%o0
	tsubcc	%i2,	%i0,	%i5
	edge8n	%i4,	%l5,	%i7
	srlx	%l6,	0x00,	%o2
	sdiv	%l4,	0x02CF,	%l2
	nop
	setx	loop_1453,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%o7,	%i1
	set	0x0F, %o0
	lduba	[%l7 + %o0] 0x80,	%o5
loop_1453:
	edge32n	%o1,	%g4,	%o6
	fcmple16	%f20,	%f6,	%l0
	tl	%xcc,	0x4
	set	0x0C, %l4
	stwa	%i6,	[%l7 + %l4] 0x18
	array8	%l3,	%g1,	%g5
	fmovd	%f4,	%f12
	sir	0x17D9
	fornot1s	%f10,	%f14,	%f24
	xnorcc	%g3,	0x0A8F,	%i3
	fmovdvc	%xcc,	%f23,	%f11
	edge8n	%g6,	%o4,	%g7
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f24
	fxtod	%f24,	%f16
	fornot2s	%f13,	%f4,	%f10
	umul	%g2,	0x14B1,	%o3
	movleu	%xcc,	%l1,	%i2
	set	0x110, %i2
	ldxa	[%g0 + %i2] 0x21,	%i0
	srlx	%o0,	%i5,	%l5
	xor	%i4,	0x1723,	%l6
	lduh	[%l7 + 0x4C],	%i7
	subccc	%l4,	%o2,	%o7
	tcs	%xcc,	0x2
	srlx	%l2,	0x07,	%o5
	tle	%icc,	0x4
	udivcc	%o1,	0x0C4F,	%g4
	fbl	%fcc3,	loop_1454
	fmovsleu	%xcc,	%f17,	%f19
	te	%xcc,	0x1
	tge	%xcc,	0x0
loop_1454:
	fxnors	%f0,	%f31,	%f12
	tvc	%icc,	0x4
	add	%o6,	%i1,	%l0
	set	0x2F, %i0
	ldstuba	[%l7 + %i0] 0x88,	%i6
	fmovsvs	%xcc,	%f0,	%f13
	brz,a	%g1,	loop_1455
	brz,a	%l3,	loop_1456
	tne	%icc,	0x7
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g3,	%g5
loop_1455:
	udivx	%g6,	0x1D8C,	%o4
loop_1456:
	fmovrdne	%g7,	%f4,	%f16
	nop
	fitos	%f9,	%f27
	fstox	%f27,	%f0
	fxtos	%f0,	%f4
	edge16	%g2,	%i3,	%l1
	bvc,a,pn	%xcc,	loop_1457
	fba,a	%fcc2,	loop_1458
	tneg	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1457:
	smul	%i2,	%i0,	%o3
loop_1458:
	fpsub16	%f12,	%f8,	%f22
	set	0x0A, %i5
	lduha	[%l7 + %i5] 0x89,	%i5
	umul	%l5,	0x0091,	%o0
	fxnors	%f3,	%f27,	%f18
	ldstub	[%l7 + 0x32],	%l6
	fnegd	%f20,	%f20
	mova	%icc,	%i7,	%i4
	movvs	%icc,	%l4,	%o2
	popc	0x0FDA,	%l2
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	sdivcc	%o5,	0x045D,	%o7
	mulx	%o1,	%o6,	%i1
	tpos	%icc,	0x1
	umul	%g4,	0x0BCF,	%l0
	fnot2	%f8,	%f20
	fmovdcc	%xcc,	%f1,	%f12
	ba,a,pn	%xcc,	loop_1459
	tl	%xcc,	0x7
	andncc	%i6,	%l3,	%g3
	sll	%g5,	%g1,	%g6
loop_1459:
	subccc	%g7,	%o4,	%g2
	edge32n	%i3,	%i2,	%l1
	tn	%icc,	0x5
	tvs	%icc,	0x2
	movleu	%xcc,	%i0,	%i5
	st	%f7,	[%l7 + 0x70]
	tpos	%icc,	0x1
	array8	%o3,	%l5,	%l6
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x62] %asi,	%i7
	nop
	set	0x4C, %o5
	lduw	[%l7 + %o5],	%i4
	fpadd32s	%f16,	%f28,	%f29
	alignaddr	%o0,	%l4,	%o2
	or	%o5,	%l2,	%o7
	brz,a	%o6,	loop_1460
	smul	%o1,	0x1868,	%i1
	fnor	%f18,	%f4,	%f4
	umul	%g4,	%i6,	%l0
loop_1460:
	sra	%g3,	%l3,	%g5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f12,	%f24,	%f14
	tsubcctv	%g6,	0x1CB1,	%g1
	addc	%g7,	%o4,	%i3
	fxnors	%f8,	%f20,	%f28
	andn	%i2,	%l1,	%i0
	fpadd32	%f30,	%f24,	%f12
	tpos	%icc,	0x1
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fxnor	%f20,	%f6,	%f24
	move	%xcc,	%i5,	%o3
	tsubcc	%g2,	%l6,	%i7
	sra	%l5,	0x12,	%i4
	set	0x14, %l1
	ldswa	[%l7 + %l1] 0x19,	%o0
	brgez	%l4,	loop_1461
	fandnot1s	%f8,	%f27,	%f22
	sethi	0x0C97,	%o5
	xor	%o2,	%l2,	%o6
loop_1461:
	taddcc	%o1,	0x164E,	%i1
	fzeros	%f23
	addcc	%o7,	0x0EBA,	%g4
	fpackfix	%f20,	%f20
	orncc	%i6,	0x0C14,	%l0
	xor	%l3,	%g3,	%g6
	popc	0x01DB,	%g1
	sdivcc	%g7,	0x0DED,	%g5
	srax	%o4,	0x1F,	%i2
	fcmpeq32	%f10,	%f12,	%l1
	fandnot1	%f0,	%f12,	%f20
	taddcctv	%i0,	%i3,	%i5
	alignaddr	%g2,	%o3,	%i7
	fmovsvc	%xcc,	%f18,	%f27
	sll	%l5,	%i4,	%o0
	movrne	%l4,	%l6,	%o5
	sethi	0x055A,	%o2
	movle	%icc,	%l2,	%o6
	movvs	%icc,	%o1,	%o7
	edge16	%i1,	%g4,	%i6
	tle	%xcc,	0x3
	fpack32	%f20,	%f20,	%f16
	nop
	setx	0xDCA65055,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xBF06F1CA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f27,	%f1
	fbug,a	%fcc0,	loop_1462
	fcmpeq32	%f12,	%f12,	%l0
	tsubcc	%g3,	%l3,	%g1
	xnorcc	%g7,	%g6,	%g5
loop_1462:
	fcmpeq16	%f26,	%f4,	%i2
	sethi	0x10D8,	%o4
	wr	%g0,	0x19,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fxnors	%f14,	%f26,	%f28
	fpadd16	%f4,	%f26,	%f20
	fcmpgt16	%f2,	%f4,	%l1
	movrgez	%i0,	%i3,	%i5
	wr	%g0,	0x88,	%asi
	stba	%g2,	[%l7 + 0x78] %asi
	tneg	%xcc,	0x3
	xnorcc	%i7,	0x1646,	%l5
	ldd	[%l7 + 0x48],	%i4
	fmovsvs	%xcc,	%f23,	%f22
	srl	%o3,	%o0,	%l4
	nop
	fitod	%f4,	%f6
	fdtos	%f6,	%f30
	fbue,a	%fcc0,	loop_1463
	movle	%icc,	%l6,	%o5
	movneg	%icc,	%l2,	%o2
	tvs	%icc,	0x2
loop_1463:
	movvs	%xcc,	%o6,	%o1
	popc	0x09F5,	%i1
	movg	%icc,	%g4,	%o7
	sdivcc	%i6,	0x0849,	%l0
	addcc	%l3,	%g1,	%g3
	addc	%g6,	0x1EC4,	%g5
	tne	%xcc,	0x0
	subc	%g7,	%i2,	%o4
	bvs,a,pt	%xcc,	loop_1464
	mulscc	%i0,	0x1E5B,	%i3
	movge	%icc,	%l1,	%i5
	xnorcc	%i7,	%g2,	%l5
loop_1464:
	movn	%xcc,	%i4,	%o3
	array8	%l4,	%o0,	%l6
	bne,pn	%icc,	loop_1465
	tne	%icc,	0x4
	array32	%l2,	%o2,	%o5
	orn	%o1,	0x0470,	%o6
loop_1465:
	st	%f29,	[%l7 + 0x64]
	movvs	%icc,	%i1,	%g4
	swap	[%l7 + 0x14],	%o7
	fmovdn	%icc,	%f9,	%f8
	brz,a	%i6,	loop_1466
	bcs,a	%xcc,	loop_1467
	bl	%icc,	loop_1468
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1466:
	movgu	%xcc,	%l3,	%g1
loop_1467:
	nop
	set	0x35, %o2
	stba	%l0,	[%l7 + %o2] 0x0c
loop_1468:
	tleu	%xcc,	0x0
	fbo,a	%fcc1,	loop_1469
	or	%g3,	0x05E8,	%g6
	fmovsgu	%icc,	%f6,	%f18
	nop
	setx	0xBDDCFFC6C0A7E19E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xACE43CDE1CB376D8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f14,	%f22
loop_1469:
	movg	%xcc,	%g5,	%g7
	fcmpgt32	%f2,	%f16,	%i2
	edge32l	%i0,	%i3,	%l1
	sub	%i5,	0x06C7,	%o4
	be,a	%icc,	loop_1470
	tvc	%xcc,	0x2
	tvc	%xcc,	0x3
	or	%g2,	0x0D0E,	%i7
loop_1470:
	fnot1s	%f4,	%f12
	edge16	%i4,	%l5,	%o3
	andcc	%l4,	%o0,	%l2
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	popc	0x022C,	%o2
	stw	%o5,	[%l7 + 0x3C]
	fbn,a	%fcc2,	loop_1471
	mova	%icc,	%o1,	%l6
	ble	%icc,	loop_1472
	nop
	setx	0xD8F4ED1BC06CD84A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_1471:
	nop
	setx	0x1ECD73E7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f2
	movvs	%xcc,	%o6,	%i1
loop_1472:
	andncc	%o7,	%g4,	%i6
	edge32	%l3,	%g1,	%l0
	set	0x3C, %l5
	ldstuba	[%l7 + %l5] 0x80,	%g3
	fornot1s	%f23,	%f23,	%f18
	nop
	setx loop_1473, %l0, %l1
	jmpl %l1, %g6
	taddcctv	%g5,	0x116A,	%i2
	tpos	%xcc,	0x3
	tcc	%icc,	0x5
loop_1473:
	tleu	%xcc,	0x1
	nop
	setx	0xC00E925B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f3
	tge	%icc,	0x3
	smul	%i0,	0x11E7,	%i3
	movrgz	%l1,	0x014,	%g7
	fabss	%f21,	%f5
	addcc	%o4,	0x0AE8,	%i5
	movcs	%icc,	%i7,	%g2
	fcmple32	%f28,	%f16,	%l5
	fbu	%fcc0,	loop_1474
	fnors	%f19,	%f8,	%f30
	fmovrdne	%o3,	%f26,	%f4
	set	0x7C, %l2
	lda	[%l7 + %l2] 0x14,	%f26
loop_1474:
	fbl	%fcc0,	loop_1475
	xnor	%l4,	%i4,	%l2
	nop
	setx	0x684BC5C0F079A9C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	udiv	%o2,	0x1F33,	%o5
loop_1475:
	sth	%o1,	[%l7 + 0x6A]
	bshuffle	%f18,	%f0,	%f10
	fmovrsgez	%o0,	%f4,	%f2
	set	0x60, %g2
	stxa	%o6,	[%l7 + %g2] 0xeb
	membar	#Sync
	fmovrdlz	%l6,	%f16,	%f2
	set	0x0C, %g7
	stha	%o7,	[%l7 + %g7] 0x23
	membar	#Sync
	srl	%g4,	0x1C,	%i1
	edge8l	%l3,	%g1,	%i6
	move	%icc,	%g3,	%l0
	array32	%g5,	%i2,	%g6
	subccc	%i0,	0x0B43,	%l1
	orcc	%g7,	%o4,	%i3
	edge8n	%i5,	%g2,	%i7
	andncc	%l5,	%o3,	%i4
	movrlez	%l2,	0x2E8,	%l4
	ble,a,pt	%xcc,	loop_1476
	fbl,a	%fcc3,	loop_1477
	bpos,a	%xcc,	loop_1478
	and	%o5,	%o1,	%o0
loop_1476:
	orcc	%o2,	0x00F2,	%o6
loop_1477:
	tvs	%xcc,	0x7
loop_1478:
	fandnot2	%f2,	%f6,	%f0
	nop
	setx	0xDB7C03DB1C163D5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xAAC856180146B678,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f28,	%f26
	fsrc1s	%f2,	%f5
	fabsd	%f24,	%f6
	edge16l	%l6,	%g4,	%o7
	movn	%xcc,	%i1,	%l3
	addc	%g1,	%g3,	%i6
	mulscc	%l0,	%i2,	%g6
	mulscc	%g5,	%i0,	%l1
	nop
	setx	0xF3814DB57A05F3B0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x77EF78A013BE18B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f8,	%f24
	fbl,a	%fcc0,	loop_1479
	sllx	%g7,	%i3,	%o4
	brnz,a	%g2,	loop_1480
	bg,a	%icc,	loop_1481
loop_1479:
	brz	%i7,	loop_1482
	tpos	%icc,	0x5
loop_1480:
	movg	%icc,	%l5,	%o3
loop_1481:
	tn	%xcc,	0x2
loop_1482:
	tl	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x0
	tgu	%icc,	0x1
	smul	%i4,	%i5,	%l4
	brlz	%o5,	loop_1483
	mova	%xcc,	%o1,	%l2
	pdist	%f22,	%f16,	%f0
	addcc	%o2,	%o6,	%o0
loop_1483:
	fornot2	%f12,	%f4,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f23,	%f5,	%f22
	fandnot1	%f24,	%f12,	%f28
	brgz,a	%l6,	loop_1484
	bcs	loop_1485
	tle	%xcc,	0x7
	set	0x40, %g1
	swapa	[%l7 + %g1] 0x89,	%g4
loop_1484:
	sth	%i1,	[%l7 + 0x10]
loop_1485:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x62] %asi,	%l3
	fmul8ulx16	%f2,	%f24,	%f8
	movg	%xcc,	%o7,	%g3
	taddcc	%i6,	%l0,	%g1
	fmovdg	%xcc,	%f7,	%f9
	nop
	setx	0x20750AAD,	%l0,	%l6
	st	%l6,	[%l7 + 0x5C]
	ld	[%l7 + 0x5C],	%fsr
	fbu	%fcc3,	loop_1486
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f10,	%f14
	nop
	setx	loop_1487,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1486:
	fpackfix	%f26,	%f7
	movl	%icc,	%i2,	%g5
	add	%i0,	0x07FE,	%l1
loop_1487:
	bl	loop_1488
	andn	%g6,	%i3,	%g7
	srax	%o4,	0x1D,	%i7
	fbue	%fcc0,	loop_1489
loop_1488:
	fbg,a	%fcc2,	loop_1490
	edge8l	%g2,	%l5,	%i4
	tpos	%icc,	0x1
loop_1489:
	tl	%icc,	0x0
loop_1490:
	sll	%o3,	0x1A,	%i5
	sub	%o5,	0x18E1,	%o1
	subcc	%l4,	0x11E5,	%l2
	movpos	%icc,	%o6,	%o2
	nop
	fitos	%f0,	%f29
	fstox	%f29,	%f8
	fxtos	%f8,	%f31
	udivcc	%l6,	0x1213,	%g4
	srlx	%i1,	%l3,	%o7
	be,a	%icc,	loop_1491
	pdist	%f20,	%f18,	%f20
	popc	0x08B1,	%g3
	tsubcctv	%i6,	%l0,	%o0
loop_1491:
	fmovdne	%xcc,	%f16,	%f8
	orn	%g1,	0x1291,	%i2
	fmovrdgz	%g5,	%f0,	%f6
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x28] %asi,	%l1
	edge16ln	%i0,	%g6,	%g7
	movrgz	%o4,	%i7,	%i3
	orcc	%l5,	0x0147,	%i4
	tg	%xcc,	0x1
	addccc	%o3,	%i5,	%g2
	sdivx	%o1,	0x154A,	%o5
	sub	%l4,	0x0B43,	%l2
	movcs	%icc,	%o6,	%o2
	movne	%xcc,	%l6,	%g4
	nop
	setx	loop_1492,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%xcc,	%l3,	%o7
	tcs	%icc,	0x3
	nop
	fitod	%f4,	%f24
	fdtos	%f24,	%f17
loop_1492:
	fornot1s	%f10,	%f25,	%f16
	fbne,a	%fcc1,	loop_1493
	movrne	%i1,	0x274,	%g3
	fbug	%fcc3,	loop_1494
	fmovdvs	%icc,	%f22,	%f23
loop_1493:
	taddcc	%l0,	0x1F94,	%i6
	fexpand	%f4,	%f2
loop_1494:
	udivx	%o0,	0x0972,	%i2
	sethi	0x1D41,	%g1
	mulscc	%l1,	%g5,	%g6
	srlx	%i0,	%g7,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fba,a	%fcc2,	loop_1495
	ldub	[%l7 + 0x4C],	%i3
	fpadd32s	%f29,	%f2,	%f1
	fpadd16s	%f31,	%f16,	%f7
loop_1495:
	fmovdgu	%icc,	%f25,	%f16
	fbge,a	%fcc2,	loop_1496
	fblg,a	%fcc0,	loop_1497
	addccc	%l5,	%o4,	%o3
	udivx	%i4,	0x1E74,	%g2
loop_1496:
	nop
	setx	0x16B50A3B037B47A3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xA6ED872B534A3A3B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f18,	%f14
loop_1497:
	fpsub16	%f10,	%f2,	%f0
	fornot2	%f30,	%f4,	%f22
	fmul8x16al	%f15,	%f27,	%f6
	movneg	%xcc,	%o1,	%i5
	sth	%l4,	[%l7 + 0x38]
	fblg	%fcc3,	loop_1498
	edge8l	%o5,	%o6,	%l2
	edge8	%l6,	%g4,	%l3
	nop
	setx	0x1980CB101074FE65,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
loop_1498:
	taddcc	%o7,	0x10C1,	%i1
	fmovsa	%xcc,	%f22,	%f2
	brgz	%g3,	loop_1499
	fble	%fcc0,	loop_1500
	sll	%l0,	%i6,	%o2
	udivcc	%i2,	0x1BAA,	%o0
loop_1499:
	fmovscc	%xcc,	%f10,	%f3
loop_1500:
	udiv	%l1,	0x0F0A,	%g1
	sethi	0x03BF,	%g6
	udivcc	%i0,	0x1D9F,	%g5
	and	%i7,	0x12F4,	%i3
	orncc	%l5,	%g7,	%o3
	movrlz	%o4,	%g2,	%i4
	orcc	%i5,	0x08D5,	%l4
	movg	%icc,	%o1,	%o6
	fmovs	%f3,	%f28
	tvc	%xcc,	0x7
	movcs	%xcc,	%o5,	%l2
	swap	[%l7 + 0x60],	%l6
	tsubcc	%l3,	%g4,	%o7
	sllx	%i1,	0x12,	%g3
	st	%f31,	[%l7 + 0x10]
	tleu	%icc,	0x0
	addccc	%l0,	0x1AF6,	%i6
	nop
	setx	loop_1501,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	membar	0x42
	andncc	%i2,	%o0,	%o2
	srlx	%l1,	0x16,	%g6
loop_1501:
	nop
	set	0x5A, %i7
	lduba	[%l7 + %i7] 0x0c,	%i0
	sdivcc	%g5,	0x0209,	%i7
	movn	%icc,	%g1,	%l5
	fbue	%fcc3,	loop_1502
	bn,a,pt	%icc,	loop_1503
	fnegd	%f2,	%f28
	tsubcc	%g7,	0x038A,	%i3
loop_1502:
	nop
	set	0x30, %o6
	sta	%f18,	[%l7 + %o6] 0x04
loop_1503:
	te	%icc,	0x3
	edge32ln	%o4,	%g2,	%i4
	tn	%icc,	0x6
	be,a	loop_1504
	tneg	%xcc,	0x1
	edge8	%o3,	%i5,	%l4
	bcc,pn	%icc,	loop_1505
loop_1504:
	fmovdneg	%icc,	%f14,	%f23
	srlx	%o6,	%o1,	%l2
	fornot2	%f30,	%f30,	%f6
loop_1505:
	fnands	%f7,	%f1,	%f10
	orcc	%l6,	%l3,	%g4
	edge8ln	%o5,	%i1,	%o7
	stw	%g3,	[%l7 + 0x64]
	xorcc	%i6,	0x013F,	%i2
	nop
	setx	loop_1506,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovse	%xcc,	%f31,	%f20
	fabsd	%f8,	%f14
	bpos,pn	%xcc,	loop_1507
loop_1506:
	sllx	%l0,	0x0B,	%o0
	bleu,a	%xcc,	loop_1508
	array32	%o2,	%g6,	%i0
loop_1507:
	nop
	fitos	%f5,	%f29
	fstox	%f29,	%f6
	fnegd	%f12,	%f0
loop_1508:
	fbl,a	%fcc0,	loop_1509
	movgu	%icc,	%l1,	%i7
	ldsh	[%l7 + 0x2C],	%g5
	bl,pn	%icc,	loop_1510
loop_1509:
	fabsd	%f30,	%f22
	edge8ln	%g1,	%l5,	%g7
	edge32	%i3,	%o4,	%i4
loop_1510:
	tsubcctv	%g2,	%i5,	%l4
	fpadd32s	%f1,	%f11,	%f3
	xnor	%o6,	0x0C5C,	%o3
	xnorcc	%o1,	0x08C0,	%l6
	set	0x40, %g4
	ldsha	[%l7 + %g4] 0x10,	%l3
	mova	%xcc,	%g4,	%o5
	movne	%xcc,	%i1,	%l2
	fmovrdlz	%g3,	%f30,	%f14
	std	%f18,	[%l7 + 0x40]
	set	0x50, %i6
	prefetcha	[%l7 + %i6] 0x89,	 0x2
	te	%icc,	0x7
	set	0x50, %l0
	stha	%o7,	[%l7 + %l0] 0x89
	tsubcc	%i2,	%l0,	%o2
	fmovsle	%icc,	%f12,	%f24
	umulcc	%g6,	%o0,	%i0
	umulcc	%l1,	0x1DF2,	%g5
	sll	%i7,	0x18,	%l5
	sllx	%g1,	0x17,	%g7
	andn	%i3,	%i4,	%g2
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x38] %asi,	%o4
	movcc	%icc,	%l4,	%o6
	edge32l	%o3,	%o1,	%l6
	fandnot1s	%f31,	%f4,	%f22
	fornot2s	%f3,	%f30,	%f24
	brgez,a	%l3,	loop_1511
	tleu	%icc,	0x0
	umul	%g4,	%i5,	%o5
	andn	%i1,	%g3,	%i6
loop_1511:
	nop
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x58] %asi,	%o7
	movne	%icc,	%i2,	%l2
	movcc	%xcc,	%o2,	%l0
	array16	%g6,	%o0,	%i0
	array32	%g5,	%l1,	%l5
	fbl,a	%fcc3,	loop_1512
	fbul,a	%fcc0,	loop_1513
	brlez,a	%g1,	loop_1514
	stx	%i7,	[%l7 + 0x58]
loop_1512:
	add	%i3,	0x0D58,	%i4
loop_1513:
	bgu,a	loop_1515
loop_1514:
	udiv	%g2,	0x0105,	%o4
	stbar
	srax	%g7,	%l4,	%o3
loop_1515:
	udivcc	%o6,	0x0023,	%l6
	nop
	setx	0x7E4A7132C2DA0D92,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x472536CCD5F1DBA0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f10,	%f24
	bge,pn	%icc,	loop_1516
	tleu	%xcc,	0x3
	fmovrdgz	%l3,	%f10,	%f10
	fblg,a	%fcc0,	loop_1517
loop_1516:
	movneg	%xcc,	%g4,	%i5
	tle	%xcc,	0x0
	srl	%o5,	0x04,	%o1
loop_1517:
	tcc	%icc,	0x6
	wr	%g0,	0xe3,	%asi
	stha	%g3,	[%l7 + 0x5E] %asi
	membar	#Sync
	fblg,a	%fcc2,	loop_1518
	call	loop_1519
	fbul,a	%fcc0,	loop_1520
	stbar
loop_1518:
	umulcc	%i1,	0x036F,	%i6
loop_1519:
	nop
	set	0x18, %g6
	prefetcha	[%l7 + %g6] 0x10,	 0x2
loop_1520:
	movrne	%i2,	0x3A2,	%o2
	fmovrdlz	%l0,	%f4,	%f4
	edge8ln	%g6,	%l2,	%o0
	bg,a,pt	%icc,	loop_1521
	fands	%f26,	%f14,	%f11
	fand	%f10,	%f20,	%f10
	mulscc	%g5,	%i0,	%l5
loop_1521:
	addccc	%g1,	%i7,	%l1
	fpadd32s	%f15,	%f5,	%f10
	taddcc	%i3,	0x1EB1,	%i4
	edge32	%o4,	%g2,	%l4
	sth	%o3,	[%l7 + 0x7E]
	sethi	0x1EDA,	%o6
	orcc	%g7,	%l6,	%l3
	edge8n	%i5,	%o5,	%g4
	faligndata	%f16,	%f6,	%f26
	edge32l	%g3,	%i1,	%o1
	array32	%o7,	%i6,	%o2
	sethi	0x1080,	%l0
	sra	%i2,	0x1F,	%l2
	fmovrse	%o0,	%f29,	%f8
	fand	%f14,	%f20,	%f18
	tl	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bgu,a	loop_1522
	fpsub32	%f26,	%f20,	%f4
	fbl	%fcc1,	loop_1523
	fbo	%fcc0,	loop_1524
loop_1522:
	nop
	setx	0x6FD6CC2BA07178F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	tgu	%icc,	0x4
loop_1523:
	nop
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x6E] %asi,	%g5
loop_1524:
	smul	%i0,	0x13E3,	%g6
	array16	%g1,	%l5,	%i7
	movvs	%icc,	%l1,	%i3
	fmovde	%xcc,	%f14,	%f28
	stbar
	nop
	fitos	%f28,	%f1
	nop
	set	0x7B, %o7
	stb	%i4,	[%l7 + %o7]
	edge8n	%o4,	%l4,	%g2
	bcs,pt	%icc,	loop_1525
	bn,a	loop_1526
	nop
	setx loop_1527, %l0, %l1
	jmpl %l1, %o3
	tge	%icc,	0x2
loop_1525:
	edge32l	%o6,	%l6,	%g7
loop_1526:
	nop
	set	0x46, %g5
	sth	%l3,	[%l7 + %g5]
loop_1527:
	sir	0x022E
	nop
	fitod	%f20,	%f26
	xorcc	%i5,	0x0D75,	%g4
	movleu	%xcc,	%g3,	%i1
	fbule,a	%fcc1,	loop_1528
	nop
	fitod	%f2,	%f16
	fdtoi	%f16,	%f31
	fbule,a	%fcc1,	loop_1529
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1528:
	fmovdcs	%xcc,	%f29,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1529:
	array16	%o5,	%o7,	%i6
	srlx	%o1,	%o2,	%l0
	fnor	%f14,	%f20,	%f10
	addc	%i2,	0x0605,	%o0
	set	0x50, %o3
	prefetcha	[%l7 + %o3] 0x15,	 0x3
	fornot1s	%f24,	%f10,	%f12
	edge32l	%i0,	%g6,	%l2
	fexpand	%f31,	%f0
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f4
	fxtod	%f4,	%f18
	mulx	%g1,	%l5,	%l1
	edge8	%i7,	%i4,	%o4
	fmovrsne	%l4,	%f20,	%f14
	movleu	%icc,	%g2,	%o3
	addc	%o6,	%i3,	%g7
	edge32ln	%l3,	%l6,	%i5
	set	0x55, %l6
	lduba	[%l7 + %l6] 0x81,	%g3
	bleu	%icc,	loop_1530
	smulcc	%g4,	%i1,	%o7
	xorcc	%i6,	0x0CE8,	%o1
	sdivx	%o2,	0x1E09,	%o5
loop_1530:
	nop
	setx	0x83A679C5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f10
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%i2,	0x1A70,	%l0
	edge32l	%g5,	%o0,	%i0
	fornot2s	%f22,	%f0,	%f24
	brlz	%l2,	loop_1531
	ldd	[%l7 + 0x30],	%g6
	array32	%l5,	%l1,	%g1
	movl	%icc,	%i4,	%i7
loop_1531:
	movrgz	%l4,	0x238,	%o4
	fpsub16s	%f2,	%f2,	%f4
	tge	%xcc,	0x4
	movrne	%o3,	%o6,	%g2
	sethi	0x0706,	%g7
	movl	%xcc,	%i3,	%l3
	edge32	%l6,	%i5,	%g3
	movleu	%icc,	%i1,	%o7
	smul	%i6,	%g4,	%o2
	tgu	%icc,	0x2
	tvs	%xcc,	0x5
	call	loop_1532
	fmuld8sux16	%f14,	%f0,	%f14
	fmovrsgez	%o5,	%f22,	%f2
	edge8	%o1,	%l0,	%g5
loop_1532:
	tcs	%xcc,	0x2
	smulcc	%i2,	%i0,	%l2
	orn	%o0,	0x188D,	%l5
	fpsub32	%f26,	%f10,	%f12
	mulx	%g6,	0x17AA,	%g1
	addcc	%i4,	%i7,	%l1
	udivcc	%l4,	0x02D7,	%o4
	brlez,a	%o3,	loop_1533
	movleu	%xcc,	%o6,	%g7
	movre	%g2,	%l3,	%i3
	sth	%i5,	[%l7 + 0x1A]
loop_1533:
	subcc	%g3,	%l6,	%i1
	xnor	%i6,	0x0956,	%o7
	nop
	setx	0xA0750897,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	te	%icc,	0x4
	edge16l	%o2,	%g4,	%o5
	umul	%o1,	%l0,	%g5
	movgu	%icc,	%i2,	%l2
	bge,pt	%xcc,	loop_1534
	sll	%o0,	0x13,	%i0
	movleu	%icc,	%g6,	%g1
	addccc	%l5,	0x1EB9,	%i4
loop_1534:
	orncc	%i7,	0x1772,	%l1
	sdivx	%l4,	0x1FAF,	%o3
	movleu	%xcc,	%o4,	%g7
	movrgz	%o6,	0x0D0,	%l3
	or	%g2,	0x041C,	%i5
	fbuge,a	%fcc2,	loop_1535
	tsubcc	%i3,	%l6,	%i1
	fbue,a	%fcc0,	loop_1536
	fones	%f9
loop_1535:
	movrlez	%g3,	0x395,	%o7
	brz	%o2,	loop_1537
loop_1536:
	movn	%icc,	%g4,	%i6
	edge8l	%o1,	%l0,	%o5
	ldsb	[%l7 + 0x58],	%i2
loop_1537:
	tle	%icc,	0x5
	subcc	%g5,	%o0,	%i0
	edge16ln	%l2,	%g6,	%g1
	tgu	%xcc,	0x6
	subc	%l5,	%i7,	%l1
	tl	%icc,	0x2
	fmovrsgz	%l4,	%f31,	%f26
	udivx	%o3,	0x1692,	%i4
	fmovrdgz	%o4,	%f14,	%f8
	edge16l	%o6,	%g7,	%l3
	ldub	[%l7 + 0x45],	%g2
	fpack16	%f30,	%f14
	fble	%fcc2,	loop_1538
	array16	%i5,	%l6,	%i1
	taddcctv	%g3,	%o7,	%o2
	fnors	%f22,	%f24,	%f1
loop_1538:
	edge8n	%g4,	%i6,	%o1
	fmovd	%f4,	%f20
	set	0x10, %i3
	ldda	[%l7 + %i3] 0x89,	%l0
	edge16l	%o5,	%i2,	%i3
	sll	%o0,	0x09,	%g5
	movge	%xcc,	%i0,	%g6
	fmovdvs	%xcc,	%f15,	%f9
	bg,a,pn	%xcc,	loop_1539
	edge32l	%g1,	%l2,	%i7
	edge16n	%l1,	%l4,	%l5
	set	0x32, %o4
	lduba	[%l7 + %o4] 0x11,	%o3
loop_1539:
	fbuge	%fcc1,	loop_1540
	fxnor	%f0,	%f28,	%f8
	tle	%icc,	0x3
	nop
	fitos	%f7,	%f20
	fstox	%f20,	%f24
loop_1540:
	movrlez	%i4,	%o6,	%o4
	tge	%xcc,	0x1
	fbul,a	%fcc2,	loop_1541
	umulcc	%g7,	0x0BB3,	%g2
	tvs	%xcc,	0x2
	ldx	[%l7 + 0x48],	%l3
loop_1541:
	sll	%l6,	%i5,	%i1
	fmovrsgz	%o7,	%f3,	%f17
	set	0x18, %o1
	ldxa	[%g0 + %o1] 0x50,	%o2
	edge8	%g4,	%i6,	%o1
	stx	%l0,	[%l7 + 0x20]
	mulscc	%o5,	%i2,	%g3
	nop
	setx	0xA906EFC3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x25F2D7DD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fsubs	%f24,	%f15,	%f18
	movle	%xcc,	%o0,	%i3
	edge8n	%i0,	%g5,	%g1
	fzeros	%f4
	edge32	%g6,	%i7,	%l1
	brz,a	%l4,	loop_1542
	movrne	%l2,	%o3,	%l5
	fbue	%fcc1,	loop_1543
	nop
	fitos	%f10,	%f19
	fstox	%f19,	%f12
	fxtos	%f12,	%f28
loop_1542:
	movrgz	%o6,	%i4,	%o4
	bneg,pn	%xcc,	loop_1544
loop_1543:
	movgu	%xcc,	%g2,	%l3
	fbu,a	%fcc3,	loop_1545
	array8	%l6,	%i5,	%g7
loop_1544:
	nop
	fitod	%f28,	%f10
	orncc	%i1,	0x0E11,	%o7
loop_1545:
	orcc	%g4,	0x1EEF,	%i6
	fmovs	%f21,	%f21
	fmovsvs	%icc,	%f22,	%f16
	nop
	fitod	%f10,	%f6
	nop
	fitos	%f11,	%f13
	fstoi	%f13,	%f19
	add	%o2,	0x15D9,	%o1
	movgu	%xcc,	%o5,	%i2
	sub	%g3,	%l0,	%i3
	alignaddrl	%o0,	%g5,	%i0
	te	%xcc,	0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g1,	%i7,	%l1
	edge32	%g6,	%l4,	%l2
	edge16l	%o3,	%l5,	%i4
	fmul8sux16	%f28,	%f2,	%f16
	movle	%xcc,	%o4,	%o6
	edge8l	%g2,	%l6,	%l3
	fmovsg	%xcc,	%f21,	%f29
	tcs	%icc,	0x0
	tneg	%xcc,	0x3
	ldub	[%l7 + 0x0C],	%g7
	edge32	%i1,	%o7,	%g4
	fmovrsne	%i6,	%f20,	%f21
	sethi	0x171F,	%i5
	fnand	%f8,	%f26,	%f26
	subccc	%o2,	%o1,	%i2
	fbn,a	%fcc0,	loop_1546
	or	%o5,	0x07D0,	%l0
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1546:
	mulscc	%i3,	0x0663,	%g3
	fabss	%f11,	%f23
	xor	%o0,	%g5,	%g1
	umul	%i7,	%l1,	%g6
	movvc	%icc,	%l4,	%i0
	tsubcc	%l2,	0x191B,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f23,	[%l7 + 0x54]
	sra	%i4,	%o3,	%o6
	fbu,a	%fcc3,	loop_1547
	sub	%g2,	%l6,	%l3
	fsrc2s	%f30,	%f27
	taddcctv	%o4,	%i1,	%o7
loop_1547:
	brz	%g7,	loop_1548
	tg	%xcc,	0x5
	udivcc	%g4,	0x1328,	%i6
	fmovrsgez	%o2,	%f13,	%f9
loop_1548:
	fmovrsgz	%i5,	%f21,	%f24
	fbug,a	%fcc2,	loop_1549
	udiv	%i2,	0x092F,	%o5
	smul	%l0,	%o1,	%g3
	movg	%xcc,	%o0,	%g5
loop_1549:
	fbule	%fcc2,	loop_1550
	lduh	[%l7 + 0x48],	%i3
	addcc	%i7,	%l1,	%g6
	taddcc	%g1,	%i0,	%l2
loop_1550:
	movl	%xcc,	%l5,	%l4
	bcc,a,pn	%icc,	loop_1551
	mulscc	%i4,	%o3,	%o6
	movle	%xcc,	%l6,	%l3
	nop
	setx loop_1552, %l0, %l1
	jmpl %l1, %o4
loop_1551:
	andncc	%i1,	%o7,	%g7
	sethi	0x1F7A,	%g4
	subccc	%g2,	0x0982,	%i6
loop_1552:
	and	%o2,	0x1B10,	%i2
	fbe	%fcc3,	loop_1553
	fmovscs	%icc,	%f14,	%f25
	movleu	%xcc,	%i5,	%o5
	stw	%l0,	[%l7 + 0x1C]
loop_1553:
	stbar
	edge16n	%o1,	%o0,	%g5
	fcmpgt16	%f8,	%f28,	%i3
	tvs	%icc,	0x3
	movne	%xcc,	%i7,	%g3
	fone	%f30
	call	loop_1554
	movcc	%icc,	%g6,	%g1
	set	0x28, %g3
	stha	%l1,	[%l7 + %g3] 0x27
	membar	#Sync
loop_1554:
	fble,a	%fcc0,	loop_1555
	movrne	%l2,	0x2AA,	%l5
	fbul,a	%fcc0,	loop_1556
	array8	%i0,	%l4,	%o3
loop_1555:
	fble,a	%fcc0,	loop_1557
	movg	%icc,	%o6,	%i4
loop_1556:
	edge8	%l3,	%o4,	%i1
	sdivcc	%o7,	0x198B,	%g7
loop_1557:
	fcmpgt32	%f18,	%f16,	%l6
	srax	%g2,	%g4,	%i6
	sllx	%i2,	%o2,	%i5
	movg	%xcc,	%o5,	%o1
	sdivcc	%l0,	0x0D82,	%g5
	edge16	%i3,	%i7,	%g3
	fpsub32	%f24,	%f6,	%f4
	xorcc	%o0,	0x0B22,	%g6
	subcc	%l1,	%g1,	%l2
	nop
	fitod	%f0,	%f10
	movge	%xcc,	%i0,	%l5
	nop
	fitos	%f2,	%f29
	fstod	%f29,	%f10
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x28] %asi,	%o3
	edge8l	%o6,	%i4,	%l4
	bpos,a,pn	%icc,	loop_1558
	orn	%o4,	%i1,	%l3
	edge16	%o7,	%l6,	%g2
	fmovdne	%xcc,	%f4,	%f14
loop_1558:
	fbo	%fcc0,	loop_1559
	fcmpeq32	%f4,	%f10,	%g4
	movl	%xcc,	%g7,	%i6
	sra	%o2,	%i2,	%i5
loop_1559:
	movrlez	%o5,	0x349,	%o1
	fandnot1s	%f13,	%f27,	%f21
	xor	%g5,	0x08EF,	%i3
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x30] %asi,	%l0
	fcmpeq16	%f10,	%f28,	%i7
	smulcc	%g3,	%g6,	%l1
	pdist	%f8,	%f26,	%f6
	fmovrdgz	%g1,	%f16,	%f2
	fmovsg	%icc,	%f19,	%f5
	movre	%o0,	0x08B,	%i0
	stbar
	taddcc	%l2,	0x1C80,	%l5
	fmul8x16	%f17,	%f12,	%f26
	set	0x54, %l3
	stha	%o3,	[%l7 + %l3] 0x14
	tge	%icc,	0x3
	sethi	0x15DE,	%o6
	fbo,a	%fcc0,	loop_1560
	sth	%l4,	[%l7 + 0x4E]
	fmovrsgez	%o4,	%f25,	%f5
	membar	0x0F
loop_1560:
	tle	%xcc,	0x6
	addccc	%i1,	%l3,	%o7
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	nop
	setx	0xC530C672,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xAAD77D26,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f2,	%f3
	sdivcc	%i4,	0x119C,	%g2
	sir	0x069C
	movneg	%icc,	%l6,	%g7
	tne	%xcc,	0x5
	sir	0x09A9
	fzero	%f12
	tg	%icc,	0x6
	orn	%g4,	%i6,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i2,	0x078F,	%i5
	sub	%o5,	%g5,	%o1
	edge32ln	%l0,	%i7,	%g3
	for	%f30,	%f8,	%f14
	movn	%icc,	%i3,	%l1
	te	%icc,	0x2
	subccc	%g6,	%o0,	%g1
	sra	%l2,	%l5,	%o3
	movrgz	%i0,	0x06E,	%l4
	fsrc2s	%f0,	%f16
	movrne	%o6,	%i1,	%o4
	te	%icc,	0x1
	nop
	fitod	%f29,	%f24
	edge32l	%o7,	%l3,	%g2
	edge32ln	%i4,	%l6,	%g4
	fmovdneg	%icc,	%f13,	%f5
	fmovrsgz	%i6,	%f5,	%f7
	udiv	%o2,	0x086D,	%g7
	tl	%xcc,	0x6
	orncc	%i2,	0x0E13,	%o5
	brgz,a	%g5,	loop_1561
	fmovsvs	%icc,	%f30,	%f9
	bn,a	loop_1562
	and	%o1,	%l0,	%i5
loop_1561:
	bge,a	loop_1563
	mulscc	%g3,	0x15C2,	%i3
loop_1562:
	bne,a,pt	%icc,	loop_1564
	bgu,a,pt	%xcc,	loop_1565
loop_1563:
	lduw	[%l7 + 0x54],	%l1
	tleu	%xcc,	0x5
loop_1564:
	movleu	%xcc,	%g6,	%o0
loop_1565:
	tsubcctv	%g1,	0x08B2,	%l2
	fpmerge	%f27,	%f12,	%f30
	smul	%i7,	0x04D7,	%o3
	ba,pn	%xcc,	loop_1566
	movneg	%xcc,	%l5,	%i0
	fmul8ulx16	%f30,	%f0,	%f6
	sllx	%o6,	0x13,	%l4
loop_1566:
	movrgez	%o4,	%o7,	%i1
	bl,a	loop_1567
	tg	%icc,	0x4
	tsubcc	%l3,	0x015C,	%i4
	bg,pn	%xcc,	loop_1568
loop_1567:
	bneg,a,pn	%xcc,	loop_1569
	fmovrdlz	%l6,	%f22,	%f20
	set	0x3E, %i1
	stba	%g4,	[%l7 + %i1] 0x14
loop_1568:
	orncc	%g2,	0x1219,	%o2
loop_1569:
	fcmpne32	%f6,	%f2,	%g7
	xnor	%i6,	%i2,	%o5
	movrne	%o1,	0x37D,	%l0
	or	%g5,	0x12EA,	%i5
	fblg	%fcc3,	loop_1570
	addc	%i3,	%l1,	%g3
	fcmpgt32	%f28,	%f26,	%g6
	ldsb	[%l7 + 0x09],	%o0
loop_1570:
	popc	0x0054,	%l2
	ble,pt	%xcc,	loop_1571
	brnz	%i7,	loop_1572
	brlz,a	%g1,	loop_1573
	ldd	[%l7 + 0x18],	%f14
loop_1571:
	tgu	%icc,	0x7
loop_1572:
	fmovde	%icc,	%f2,	%f31
loop_1573:
	movn	%icc,	%o3,	%i0
	mova	%icc,	%l5,	%o6
	srlx	%l4,	0x04,	%o7
	brgez	%o4,	loop_1574
	fmovse	%xcc,	%f14,	%f20
	andcc	%l3,	%i4,	%l6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%i1
loop_1574:
	tne	%icc,	0x1
	tcs	%icc,	0x5
	movcs	%icc,	%g2,	%o2
	array8	%i6,	%i2,	%g7
	fpadd16	%f2,	%f6,	%f30
	xor	%o1,	%o5,	%g5
	movn	%icc,	%l0,	%i3
	edge32n	%l1,	%g3,	%i5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%l2
	be,pn	%icc,	loop_1575
	fba	%fcc3,	loop_1576
	bvc,a,pt	%xcc,	loop_1577
	udiv	%i7,	0x0F8B,	%g6
loop_1575:
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%f28
loop_1576:
	fbg	%fcc3,	loop_1578
loop_1577:
	movrgez	%o3,	%i0,	%g1
	sdivcc	%l5,	0x09D6,	%l4
	lduh	[%l7 + 0x3E],	%o6
loop_1578:
	fpack16	%f2,	%f29
	movvs	%xcc,	%o7,	%l3
	stbar
	fnot1	%f14,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i4,	%o4,	%g4
	movle	%icc,	%i1,	%l6
	fmuld8ulx16	%f11,	%f30,	%f0
	fmovdleu	%xcc,	%f11,	%f5
	nop
	fitod	%f8,	%f10
	fdtos	%f10,	%f16
	movcs	%xcc,	%g2,	%i6
	edge16l	%i2,	%o2,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f20,	%f26
	edge16l	%g7,	%g5,	%l0
	sir	0x19E5
	bpos,a,pn	%xcc,	loop_1579
	tvs	%xcc,	0x0
	mulx	%i3,	0x1371,	%o5
	stw	%g3,	[%l7 + 0x10]
loop_1579:
	movrgez	%l1,	0x24F,	%o0
	xnorcc	%l2,	%i7,	%i5
	alignaddrl	%g6,	%o3,	%i0
	swap	[%l7 + 0x34],	%g1
	tle	%xcc,	0x0
	stb	%l4,	[%l7 + 0x75]
	set	0x47, %i2
	lduba	[%l7 + %i2] 0x80,	%l5
	tgu	%xcc,	0x7
	fblg,a	%fcc3,	loop_1580
	udivx	%o6,	0x039A,	%o7
	movvs	%xcc,	%l3,	%o4
	fandnot2s	%f6,	%f8,	%f2
loop_1580:
	edge8l	%i4,	%i1,	%g4
	swap	[%l7 + 0x7C],	%g2
	fmovrdgz	%i6,	%f14,	%f18
	sdivcc	%i2,	0x1F17,	%l6
	fsrc1	%f2,	%f8
	movpos	%xcc,	%o2,	%o1
	fand	%f8,	%f18,	%f16
	pdist	%f30,	%f12,	%f30
	taddcctv	%g5,	0x02E7,	%g7
	nop
	set	0x18, %l4
	std	%f20,	[%l7 + %l4]
	add	%l7,	0x18,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l0,	%i3
	mulscc	%g3,	%o5,	%l1
	movleu	%icc,	%o0,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc,a,pt	%icc,	loop_1581
	fmovsa	%icc,	%f20,	%f24
	nop
	setx	0xC011C6D7D7452613,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x314DCF981BEAE6CB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f12,	%f10
	subcc	%i5,	0x122B,	%i7
loop_1581:
	fmovdle	%icc,	%f19,	%f16
	nop
	fitos	%f0,	%f25
	fstox	%f25,	%f18
	fxtos	%f18,	%f2
	tvs	%icc,	0x4
	movne	%xcc,	%o3,	%i0
	orn	%g1,	0x0C5A,	%l4
	srl	%g6,	%o6,	%l5
	fmovsg	%icc,	%f2,	%f31
	fbne	%fcc1,	loop_1582
	movcc	%xcc,	%o7,	%o4
	xnorcc	%i4,	0x0D15,	%i1
	ldsw	[%l7 + 0x60],	%l3
loop_1582:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f16,	%f26,	%f24
	nop
	setx	0x6168BE71A238E424,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f12
	fmul8sux16	%f12,	%f24,	%f0
	tl	%xcc,	0x6
	fmovdge	%xcc,	%f29,	%f22
	array16	%g2,	%i6,	%g4
	set	0x2D, %i5
	lduba	[%l7 + %i5] 0x19,	%l6
	ldd	[%l7 + 0x70],	%i2
	andcc	%o1,	0x00B7,	%g5
	subccc	%g7,	%l0,	%o2
	sllx	%i3,	%o5,	%l1
	movgu	%icc,	%g3,	%o0
	xor	%l2,	0x13B7,	%i5
	movn	%xcc,	%o3,	%i7
	sllx	%g1,	%l4,	%g6
	te	%icc,	0x5
	smul	%i0,	0x1020,	%o6
	orncc	%l5,	%o7,	%o4
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x64] %asi,	%i4
	fbuge,a	%fcc3,	loop_1583
	ldd	[%l7 + 0x28],	%f8
	movcc	%xcc,	%i1,	%g2
	fmovsle	%icc,	%f21,	%f4
loop_1583:
	lduh	[%l7 + 0x7C],	%l3
	popc	0x0A5D,	%g4
	tvc	%xcc,	0x4
	fpadd16s	%f2,	%f18,	%f0
	fmul8sux16	%f18,	%f10,	%f24
	movpos	%xcc,	%l6,	%i2
	fcmpeq32	%f24,	%f4,	%i6
	edge32ln	%g5,	%o1,	%g7
	udivcc	%l0,	0x0A95,	%o2
	tcc	%icc,	0x0
	fmul8sux16	%f0,	%f4,	%f18
	edge32n	%o5,	%l1,	%i3
	bgu,pn	%xcc,	loop_1584
	mulx	%o0,	%g3,	%i5
	nop
	setx	0x2529B416,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x183C596A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f21,	%f24
	bg,pt	%icc,	loop_1585
loop_1584:
	fbue,a	%fcc2,	loop_1586
	ldx	[%l7 + 0x08],	%l2
	and	%o3,	0x1771,	%g1
loop_1585:
	ldub	[%l7 + 0x75],	%i7
loop_1586:
	sethi	0x029F,	%g6
	sir	0x0085
	xorcc	%i0,	%o6,	%l5
	alignaddrl	%o7,	%o4,	%l4
	edge32n	%i4,	%i1,	%g2
	tle	%xcc,	0x4
	addcc	%l3,	0x1A8B,	%l6
	add	%g4,	%i6,	%g5
	fands	%f3,	%f10,	%f11
	fmovdgu	%icc,	%f6,	%f21
	movre	%o1,	%g7,	%i2
	fandnot1s	%f9,	%f9,	%f11
	udivcc	%l0,	0x092A,	%o5
	fandnot1	%f10,	%f12,	%f20
	fmovdgu	%xcc,	%f6,	%f15
	swap	[%l7 + 0x24],	%o2
	udivx	%i3,	0x16E0,	%o0
	movpos	%xcc,	%l1,	%i5
	bleu,pt	%xcc,	loop_1587
	tsubcctv	%l2,	0x1AB0,	%o3
	tl	%icc,	0x6
	movrne	%g1,	0x034,	%i7
loop_1587:
	fpadd32	%f8,	%f26,	%f22
	fbue,a	%fcc3,	loop_1588
	edge32ln	%g6,	%g3,	%o6
	tl	%icc,	0x1
	udiv	%i0,	0x1772,	%o7
loop_1588:
	mova	%icc,	%l5,	%l4
	fandnot2s	%f31,	%f3,	%f24
	fbug,a	%fcc1,	loop_1589
	fmul8ulx16	%f12,	%f4,	%f8
	fxors	%f23,	%f15,	%f2
	fbug,a	%fcc2,	loop_1590
loop_1589:
	fnors	%f12,	%f29,	%f20
	set	0x40, %o5
	stwa	%i4,	[%l7 + %o5] 0x15
loop_1590:
	tgu	%icc,	0x5
	udivx	%i1,	0x1BB8,	%o4
	fsrc2	%f4,	%f30
	movre	%g2,	0x092,	%l3
	umulcc	%l6,	0x0845,	%g4
	fzeros	%f27
	tl	%icc,	0x1
	edge32l	%g5,	%o1,	%i6
	alignaddr	%g7,	%i2,	%o5
	fmovrslez	%l0,	%f7,	%f29
	nop
	setx	0xDB967155,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x3CE946C4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f22,	%f12
	fsrc2	%f20,	%f28
	subc	%o2,	0x1FAA,	%i3
	tvs	%xcc,	0x0
	popc	0x1612,	%l1
	faligndata	%f4,	%f6,	%f30
	bl	loop_1591
	smulcc	%i5,	%l2,	%o0
	bcc	%xcc,	loop_1592
	tpos	%icc,	0x0
loop_1591:
	ta	%icc,	0x0
	smulcc	%o3,	0x0D3E,	%i7
loop_1592:
	edge8ln	%g1,	%g3,	%o6
	smulcc	%g6,	%o7,	%i0
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x70] %asi,	%l4
	tle	%xcc,	0x3
	movpos	%icc,	%l5,	%i1
	movpos	%icc,	%o4,	%i4
	movpos	%icc,	%g2,	%l3
	fmovdvs	%xcc,	%f8,	%f3
	xor	%g4,	0x0D90,	%g5
	tpos	%icc,	0x6
	fsrc2	%f2,	%f30
	addccc	%l6,	0x0A30,	%o1
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
	alignaddrl	%i6,	%g7,	%o5
	subc	%l0,	0x1306,	%i2
	bcs,pt	%icc,	loop_1593
	fbn,a	%fcc3,	loop_1594
	fpsub16s	%f26,	%f16,	%f25
	edge32n	%o2,	%l1,	%i5
loop_1593:
	movrgz	%i3,	%l2,	%o3
loop_1594:
	movrlez	%i7,	0x2D1,	%g1
	subccc	%o0,	%o6,	%g3
	fpadd16	%f2,	%f4,	%f10
	array32	%g6,	%i0,	%l4
	move	%icc,	%o7,	%i1
	edge16ln	%l5,	%i4,	%o4
	tvs	%xcc,	0x7
	nop
	setx	0x06673875C1870C3D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xA37656D1E90209B1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f20,	%f0
	fbuge	%fcc3,	loop_1595
	stx	%g2,	[%l7 + 0x18]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%g4,	%g5
loop_1595:
	lduh	[%l7 + 0x1C],	%l6
	fbuge	%fcc3,	loop_1596
	xorcc	%o1,	0x0B6C,	%i6
	movne	%icc,	%g7,	%l3
	membar	0x6C
loop_1596:
	andcc	%l0,	0x1514,	%o5
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x0c
	or	%o2,	0x1888,	%i2
	movrlez	%i5,	%l1,	%l2
	fmul8x16au	%f26,	%f2,	%f14
	fmovdge	%icc,	%f9,	%f0
	fandnot2s	%f11,	%f25,	%f29
	bn,a	%xcc,	loop_1597
	tpos	%icc,	0x6
	fmovrdlez	%i3,	%f28,	%f8
	edge8	%o3,	%g1,	%o0
loop_1597:
	alignaddr	%o6,	%i7,	%g6
	tleu	%icc,	0x0
	mulscc	%i0,	0x1BAD,	%l4
	brnz,a	%g3,	loop_1598
	move	%xcc,	%i1,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l5,	%o4
loop_1598:
	fmovrdlz	%g2,	%f22,	%f2
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x4C] %asi,	%i4
	xnorcc	%g4,	%l6,	%g5
	sdiv	%o1,	0x09A6,	%g7
	tgu	%icc,	0x0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x6C] %asi,	%i6
	movre	%l3,	0x006,	%l0
	nop
	setx	loop_1599,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tg	%xcc,	0x6
	fcmple32	%f2,	%f20,	%o5
	tle	%icc,	0x2
loop_1599:
	std	%f28,	[%l7 + 0x70]
	mulx	%o2,	0x0FCB,	%i2
	sdivx	%l1,	0x16FA,	%i5
	move	%icc,	%i3,	%l2
	taddcctv	%g1,	0x1D5F,	%o0
	fmovdl	%xcc,	%f17,	%f4
	tpos	%icc,	0x7
	sdivcc	%o3,	0x04C3,	%o6
	subcc	%i7,	0x1D66,	%g6
	set	0x8, %o2
	stxa	%i0,	[%g0 + %o2] 0x21
	prefetch	[%l7 + 0x4C],	 0x1
	fmovsvc	%xcc,	%f13,	%f20
	bneg,pt	%icc,	loop_1600
	srax	%g3,	0x10,	%l4
	fmovspos	%icc,	%f6,	%f11
	edge8	%i1,	%o7,	%o4
loop_1600:
	udiv	%l5,	0x06F9,	%g2
	bvs,a,pt	%xcc,	loop_1601
	udivx	%g4,	0x1AE2,	%l6
	nop
	setx	0xC0952773,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x0F55A318,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f1,	%f25
	edge32n	%i4,	%o1,	%g7
loop_1601:
	fbne	%fcc1,	loop_1602
	movne	%icc,	%g5,	%i6
	wr	%g0,	0x11,	%asi
	stxa	%l0,	[%l7 + 0x40] %asi
loop_1602:
	lduh	[%l7 + 0x6E],	%o5
	nop
	fitos	%f8,	%f26
	fstoi	%f26,	%f26
	movcs	%xcc,	%l3,	%o2
	sir	0x1776
	movne	%icc,	%i2,	%l1
	movvc	%icc,	%i5,	%l2
	flush	%l7 + 0x4C
	tleu	%xcc,	0x1
	subccc	%i3,	%o0,	%g1
	ldd	[%l7 + 0x38],	%f12
	tne	%xcc,	0x2
	xnor	%o3,	0x12D9,	%i7
	brlez	%g6,	loop_1603
	ldub	[%l7 + 0x4A],	%i0
	edge16l	%o6,	%g3,	%l4
	bpos,a	loop_1604
loop_1603:
	call	loop_1605
	fmovrdlez	%i1,	%f14,	%f16
	tleu	%icc,	0x5
loop_1604:
	ble,pt	%xcc,	loop_1606
loop_1605:
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
	add	%o7,	%o4,	%l5
	nop
	set	0x3D, %l5
	stb	%g4,	[%l7 + %l5]
loop_1606:
	fmovsn	%icc,	%f22,	%f4
loop_1607:
	fandnot2	%f2,	%f0,	%f26
	movrlez	%g2,	%l6,	%i4
	fbl	%fcc3,	loop_1608
	srax	%g7,	%o1,	%i6
	movcc	%icc,	%g5,	%o5
	edge32n	%l0,	%o2,	%l3
loop_1608:
	edge16	%l1,	%i2,	%l2
	wr	%g0,	0x23,	%asi
	stha	%i3,	[%l7 + 0x32] %asi
	membar	#Sync
	fblg,a	%fcc2,	loop_1609
	movrlz	%i5,	0x238,	%o0
	nop
	setx	0x1F6F0523,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x9F39FC98,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f11,	%f4
	sir	0x153F
loop_1609:
	smul	%g1,	0x0AD1,	%o3
	popc	%g6,	%i7
	smulcc	%o6,	%i0,	%l4
	nop
	setx loop_1610, %l0, %l1
	jmpl %l1, %i1
	sll	%o7,	0x04,	%o4
	fmovdge	%icc,	%f24,	%f5
	movvs	%xcc,	%g3,	%g4
loop_1610:
	te	%xcc,	0x5
	tle	%icc,	0x7
	fbg	%fcc3,	loop_1611
	taddcc	%g2,	0x0DDB,	%l5
	sll	%i4,	0x1E,	%l6
	edge8n	%g7,	%o1,	%g5
loop_1611:
	fcmpeq32	%f20,	%f6,	%i6
	bn	loop_1612
	array32	%l0,	%o2,	%o5
	fba,a	%fcc0,	loop_1613
	edge16l	%l3,	%i2,	%l2
loop_1612:
	andn	%l1,	0x173F,	%i3
	set	0x25, %i0
	stba	%i5,	[%l7 + %i0] 0x14
loop_1613:
	fcmpeq32	%f16,	%f0,	%g1
	edge32ln	%o3,	%o0,	%i7
	edge16l	%o6,	%i0,	%g6
	movrlz	%i1,	0x001,	%l4
	addc	%o4,	%o7,	%g3
	tn	%xcc,	0x4
	sub	%g2,	%g4,	%l5
	srl	%i4,	0x0B,	%l6
	movrlz	%o1,	%g7,	%i6
	tvs	%icc,	0x1
	ta	%xcc,	0x0
	alignaddr	%g5,	%o2,	%l0
	ldx	[%l7 + 0x48],	%o5
	ldd	[%l7 + 0x68],	%f4
	edge32	%l3,	%i2,	%l2
	movvs	%icc,	%l1,	%i3
	fpsub32	%f6,	%f20,	%f2
	fmul8x16au	%f19,	%f3,	%f30
	edge16l	%g1,	%o3,	%o0
	movgu	%icc,	%i5,	%o6
	array32	%i7,	%g6,	%i1
	movne	%xcc,	%l4,	%i0
	movl	%icc,	%o4,	%o7
	udivcc	%g2,	0x12D9,	%g3
	movl	%icc,	%l5,	%i4
	srlx	%l6,	0x00,	%g4
	array32	%o1,	%i6,	%g5
	fmul8sux16	%f16,	%f12,	%f16
	fmovde	%xcc,	%f2,	%f22
	edge8ln	%g7,	%o2,	%l0
	fnand	%f6,	%f24,	%f12
	st	%f28,	[%l7 + 0x28]
	srax	%o5,	%l3,	%i2
	tneg	%xcc,	0x2
	tpos	%icc,	0x2
	orn	%l1,	0x0147,	%i3
	sub	%g1,	%l2,	%o3
	udivcc	%i5,	0x1911,	%o6
	add	%i7,	%o0,	%g6
	prefetch	[%l7 + 0x2C],	 0x3
	movle	%icc,	%l4,	%i1
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fnors	%f19,	%f1,	%f1
	tsubcc	%o4,	%o7,	%g2
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x1E] %asi,	%i0
	fmovd	%f26,	%f4
	movl	%icc,	%g3,	%l5
	nop
	setx	0x73FA3016F80CF969,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x39EECBF71856114C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f22,	%f20
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x22] %asi,	%l6
	mova	%xcc,	%g4,	%o1
	alignaddrl	%i6,	%i4,	%g5
	tl	%xcc,	0x7
	bcs	%xcc,	loop_1614
	fand	%f4,	%f8,	%f26
	brlez	%g7,	loop_1615
	nop
	setx	0x7507CF0F02BAB18D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x0FBA3504980D47DA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f28,	%f14
loop_1614:
	fpsub32	%f0,	%f26,	%f6
	movge	%icc,	%l0,	%o5
loop_1615:
	nop
	setx	loop_1616,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	addc	%o2,	%l3,	%l1
	movrgz	%i3,	%i2,	%g1
	bleu,pt	%icc,	loop_1617
loop_1616:
	movrgez	%o3,	0x228,	%i5
	bcc	%xcc,	loop_1618
	tle	%xcc,	0x7
loop_1617:
	fsrc1s	%f24,	%f31
	set	0x34, %g2
	lduha	[%l7 + %g2] 0x18,	%o6
loop_1618:
	ldsh	[%l7 + 0x72],	%i7
	bshuffle	%f16,	%f28,	%f20
	umulcc	%l2,	%o0,	%g6
	bl,a	%xcc,	loop_1619
	xnor	%i1,	%l4,	%o4
	fxnor	%f16,	%f10,	%f10
	bcs,a,pn	%icc,	loop_1620
loop_1619:
	fmovsvc	%icc,	%f11,	%f18
	addccc	%o7,	%i0,	%g3
	fmovsvs	%xcc,	%f28,	%f5
loop_1620:
	fxnor	%f10,	%f30,	%f18
	prefetch	[%l7 + 0x74],	 0x1
	fbg,a	%fcc0,	loop_1621
	bge,a	loop_1622
	tge	%xcc,	0x0
	bgu,pn	%icc,	loop_1623
loop_1621:
	tle	%xcc,	0x5
loop_1622:
	smul	%l5,	%l6,	%g2
	xnorcc	%g4,	%o1,	%i6
loop_1623:
	edge16n	%i4,	%g5,	%l0
	fandnot2s	%f29,	%f27,	%f18
	smulcc	%g7,	0x0010,	%o2
	fnegd	%f20,	%f4
	movl	%xcc,	%o5,	%l1
	nop
	setx	loop_1624,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdle	%xcc,	%f24,	%f9
	fmovsneg	%xcc,	%f3,	%f8
	xnor	%l3,	0x069C,	%i2
loop_1624:
	tle	%xcc,	0x6
	movgu	%icc,	%i3,	%g1
	sth	%i5,	[%l7 + 0x18]
	orncc	%o3,	0x12AE,	%o6
	fbu	%fcc2,	loop_1625
	movpos	%xcc,	%l2,	%i7
	tneg	%icc,	0x1
	tle	%icc,	0x4
loop_1625:
	fbn,a	%fcc0,	loop_1626
	call	loop_1627
	xorcc	%g6,	%o0,	%l4
	xor	%o4,	0x07D8,	%o7
loop_1626:
	fmovda	%icc,	%f29,	%f0
loop_1627:
	popc	%i1,	%g3
	sethi	0x136A,	%l5
	te	%icc,	0x6
	andn	%i0,	%l6,	%g4
	ta	%icc,	0x5
	udivx	%g2,	0x03D0,	%o1
	taddcc	%i4,	%i6,	%g5
	ldx	[%l7 + 0x10],	%g7
	array8	%l0,	%o2,	%l1
	bl,pt	%icc,	loop_1628
	be	loop_1629
	sdivcc	%l3,	0x0FD1,	%i2
	or	%o5,	%i3,	%i5
loop_1628:
	fbe,a	%fcc2,	loop_1630
loop_1629:
	tvc	%icc,	0x7
	sdiv	%o3,	0x1DC6,	%o6
	fba,a	%fcc3,	loop_1631
loop_1630:
	tle	%xcc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbue	%fcc0,	loop_1632
loop_1631:
	nop
	setx	0x6CD160A062F1D962,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x59460A2F59B47FA1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f20,	%f6
	set	0x7C, %l2
	stha	%l2,	[%l7 + %l2] 0x89
loop_1632:
	addcc	%g1,	%g6,	%o0
	fbule	%fcc3,	loop_1633
	sra	%l4,	%i7,	%o7
	sir	0x169E
	nop
	setx	0x0333EE97438E3DAD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x25BDFFB2C5216CC4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f10,	%f6
loop_1633:
	tl	%icc,	0x3
	fmovsgu	%xcc,	%f27,	%f5
	sdivcc	%i1,	0x0CDA,	%o4
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x3B] %asi,	%g3
	movn	%icc,	%l5,	%i0
	andncc	%l6,	%g4,	%o1
	movre	%g2,	0x23C,	%i4
	edge16ln	%g5,	%g7,	%l0
	movpos	%icc,	%i6,	%l1
	orcc	%o2,	%l3,	%o5
	movcs	%icc,	%i3,	%i2
	call	loop_1634
	movvc	%xcc,	%o3,	%o6
	stb	%i5,	[%l7 + 0x72]
	fmovd	%f8,	%f4
loop_1634:
	xor	%g1,	0x1D05,	%g6
	edge8ln	%l2,	%l4,	%i7
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f12
	bn	%xcc,	loop_1635
	mulscc	%o0,	0x1CDB,	%i1
	tl	%icc,	0x1
	fbge	%fcc1,	loop_1636
loop_1635:
	bvc,a	%icc,	loop_1637
	orncc	%o7,	0x1F10,	%o4
	fmovdvs	%icc,	%f9,	%f13
loop_1636:
	alignaddrl	%l5,	%g3,	%i0
loop_1637:
	sdivx	%g4,	0x1D6A,	%l6
	fmul8x16	%f28,	%f28,	%f26
	std	%f0,	[%l7 + 0x30]
	array16	%g2,	%i4,	%o1
	movn	%icc,	%g5,	%l0
	movvs	%icc,	%g7,	%i6
	edge32n	%o2,	%l3,	%l1
	fmovsgu	%icc,	%f5,	%f15
	movne	%xcc,	%i3,	%i2
	udivcc	%o3,	0x125B,	%o5
	movpos	%xcc,	%o6,	%g1
	fornot1	%f20,	%f16,	%f4
	tl	%icc,	0x0
	fmovsa	%icc,	%f2,	%f20
	fcmple32	%f8,	%f14,	%i5
	movrne	%g6,	%l2,	%i7
	fbl	%fcc0,	loop_1638
	te	%icc,	0x1
	umulcc	%l4,	%i1,	%o0
	tg	%xcc,	0x2
loop_1638:
	nop
	fitod	%f2,	%f28
	fdtos	%f28,	%f17
	ldd	[%l7 + 0x20],	%o4
	tsubcc	%l5,	0x0A0F,	%o7
	bge	%xcc,	loop_1639
	fmovsvc	%xcc,	%f27,	%f29
	taddcctv	%i0,	0x087D,	%g3
	tne	%icc,	0x2
loop_1639:
	fbn	%fcc2,	loop_1640
	fnegd	%f0,	%f10
	subccc	%l6,	%g4,	%i4
	tgu	%icc,	0x5
loop_1640:
	fsrc2s	%f9,	%f17
	fmovsle	%icc,	%f24,	%f29
	fbe	%fcc0,	loop_1641
	fsrc1	%f0,	%f4
	sir	0x1570
	fones	%f27
loop_1641:
	fbne,a	%fcc1,	loop_1642
	fsrc2	%f14,	%f0
	set	0x50, %g1
	ldswa	[%l7 + %g1] 0x10,	%g2
loop_1642:
	movrlez	%g5,	0x014,	%o1
	addcc	%l0,	0x03D7,	%i6
	sdivcc	%o2,	0x06A4,	%g7
	move	%icc,	%l1,	%l3
	sdiv	%i2,	0x0088,	%o3
	fbg	%fcc1,	loop_1643
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o5,	0x1F,	%o6
	ldd	[%l7 + 0x38],	%g0
loop_1643:
	nop
	set	0x48, %g7
	lduba	[%l7 + %g7] 0x81,	%i5
	ldd	[%l7 + 0x48],	%i2
	bg,a	loop_1644
	stx	%l2,	[%l7 + 0x08]
	fmovsg	%icc,	%f15,	%f2
	tsubcctv	%i7,	%l4,	%g6
loop_1644:
	edge32n	%i1,	%o0,	%l5
	set	0x5C, %i7
	lduha	[%l7 + %i7] 0x18,	%o4
	movrgz	%i0,	%o7,	%l6
	movcs	%icc,	%g4,	%g3
	movrne	%g2,	%g5,	%i4
	ldx	[%l7 + 0x60],	%l0
	fandnot2s	%f8,	%f5,	%f5
	sub	%o1,	%i6,	%g7
	edge8n	%o2,	%l3,	%i2
	sllx	%l1,	%o3,	%o6
	lduh	[%l7 + 0x52],	%g1
	taddcc	%o5,	0x080E,	%i5
	tgu	%xcc,	0x6
	ldd	[%l7 + 0x18],	%f28
	fmovspos	%icc,	%f14,	%f0
	fbule,a	%fcc2,	loop_1645
	fbue,a	%fcc2,	loop_1646
	fmovde	%xcc,	%f10,	%f25
	array16	%l2,	%i3,	%i7
loop_1645:
	nop
	fitod	%f21,	%f24
loop_1646:
	fmovsne	%icc,	%f3,	%f3
	fmovdneg	%icc,	%f27,	%f26
	nop
	fitod	%f8,	%f26
	fdtos	%f26,	%f19
	bgu,a,pn	%xcc,	loop_1647
	movrne	%g6,	%i1,	%l4
	ldd	[%l7 + 0x40],	%l4
	and	%o4,	%o0,	%i0
loop_1647:
	fbg	%fcc3,	loop_1648
	fzeros	%f22
	tl	%xcc,	0x5
	bleu,a	%xcc,	loop_1649
loop_1648:
	edge16	%l6,	%o7,	%g3
	fnot2	%f14,	%f0
	movrlez	%g4,	%g2,	%g5
loop_1649:
	tvs	%xcc,	0x0
	array16	%l0,	%o1,	%i6
	sir	0x0338
	wr	%g0,	0x89,	%asi
	stxa	%g7,	[%l7 + 0x18] %asi
	movrgz	%o2,	0x0D0,	%l3
	fblg,a	%fcc1,	loop_1650
	addccc	%i2,	%i4,	%o3
	nop
	setx	0x472ED231,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f5
	te	%icc,	0x0
loop_1650:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	set	0x62, %g4
	lduha	[%l7 + %g4] 0x81,	%l1
	sir	0x0C79
	tvc	%xcc,	0x1
	tn	%xcc,	0x6
	fmovdge	%icc,	%f17,	%f0
	array32	%o6,	%o5,	%i5
	edge16n	%g1,	%i3,	%l2
	brgz	%g6,	loop_1651
	movrlez	%i1,	%l4,	%l5
	edge16ln	%i7,	%o0,	%i0
	tpos	%xcc,	0x3
loop_1651:
	udivcc	%o4,	0x1FB7,	%o7
	fcmpne16	%f28,	%f26,	%l6
	sra	%g4,	0x1F,	%g2
	fbo	%fcc2,	loop_1652
	bpos,a,pt	%icc,	loop_1653
	fbul	%fcc3,	loop_1654
	xor	%g5,	%l0,	%g3
loop_1652:
	ldx	[%l7 + 0x48],	%i6
loop_1653:
	tneg	%xcc,	0x0
loop_1654:
	sllx	%g7,	0x0A,	%o1
	subc	%l3,	0x1965,	%i2
	fmul8ulx16	%f30,	%f2,	%f0
	fsrc2s	%f13,	%f2
	popc	%o2,	%o3
	subcc	%i4,	%l1,	%o5
	movne	%xcc,	%o6,	%i5
	fnot1s	%f14,	%f20
	swap	[%l7 + 0x48],	%g1
	te	%icc,	0x0
	fcmple16	%f0,	%f16,	%i3
	bl,pn	%xcc,	loop_1655
	fands	%f18,	%f23,	%f8
	fmovdvs	%icc,	%f29,	%f11
	alignaddrl	%g6,	%i1,	%l2
loop_1655:
	alignaddr	%l5,	%i7,	%l4
	ba	%xcc,	loop_1656
	edge16l	%i0,	%o4,	%o0
	tsubcctv	%o7,	0x17B0,	%g4
	fpmerge	%f4,	%f7,	%f6
loop_1656:
	or	%g2,	%l6,	%l0
	tvs	%icc,	0x1
	fornot1	%f30,	%f8,	%f12
	fornot2	%f0,	%f10,	%f30
	srlx	%g3,	%i6,	%g7
	fnor	%f26,	%f18,	%f18
	nop
	fitos	%f0,	%f30
	fstoi	%f30,	%f21
	brnz,a	%g5,	loop_1657
	ba,pt	%xcc,	loop_1658
	edge8l	%l3,	%i2,	%o1
	fandnot1s	%f19,	%f0,	%f19
loop_1657:
	nop
	setx	0xF0702120,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
loop_1658:
	movre	%o2,	0x176,	%i4
	edge16n	%o3,	%l1,	%o6
	andn	%i5,	%o5,	%i3
	bcc	loop_1659
	edge32	%g6,	%i1,	%l2
	sir	0x07DF
	movvc	%xcc,	%l5,	%g1
loop_1659:
	sdiv	%i7,	0x0A68,	%i0
	fbue,a	%fcc2,	loop_1660
	nop
	fitos	%f3,	%f31
	fstod	%f31,	%f20
	sdiv	%l4,	0x1FD9,	%o4
	fnegs	%f1,	%f8
loop_1660:
	bge,pt	%icc,	loop_1661
	ldub	[%l7 + 0x35],	%o7
	movleu	%xcc,	%g4,	%o0
	bge,pt	%xcc,	loop_1662
loop_1661:
	array8	%l6,	%g2,	%g3
	fxor	%f20,	%f8,	%f24
	fmovrdgez	%l0,	%f8,	%f14
loop_1662:
	movcs	%xcc,	%g7,	%g5
	movvs	%xcc,	%i6,	%i2
	edge32	%l3,	%o1,	%o2
	fmovsvc	%icc,	%f23,	%f6
	edge8	%i4,	%o3,	%o6
	stb	%i5,	[%l7 + 0x1F]
	fcmple32	%f16,	%f6,	%l1
	set	0x5B, %i6
	ldstuba	[%l7 + %i6] 0x80,	%i3
	brnz,a	%o5,	loop_1663
	fxnors	%f21,	%f19,	%f15
	lduh	[%l7 + 0x20],	%g6
	movre	%l2,	0x127,	%l5
loop_1663:
	movrne	%i1,	0x272,	%g1
	movre	%i0,	%i7,	%l4
	edge32l	%o7,	%o4,	%g4
	stx	%l6,	[%l7 + 0x58]
	fones	%f8
	orcc	%g2,	%g3,	%l0
	ble,pn	%xcc,	loop_1664
	movleu	%icc,	%o0,	%g7
	edge32ln	%i6,	%i2,	%l3
	set	0x10, %l0
	ldstuba	[%l7 + %l0] 0x11,	%o1
loop_1664:
	edge8l	%o2,	%g5,	%o3
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x74] %asi,	%i4
	bleu	loop_1665
	orn	%o6,	%i5,	%i3
	movpos	%icc,	%o5,	%l1
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x2
loop_1665:
	move	%icc,	%l5,	%i1
	movrne	%l2,	%i0,	%g1
	set	0x10, %o6
	prefetcha	[%l7 + %o6] 0x89,	 0x2
	movl	%icc,	%i7,	%o7
	udivx	%o4,	0x0F04,	%g4
	call	loop_1666
	fbne,a	%fcc0,	loop_1667
	tle	%xcc,	0x2
	xor	%g2,	%g3,	%l0
loop_1666:
	be	%icc,	loop_1668
loop_1667:
	fcmpeq32	%f8,	%f12,	%o0
	set	0x60, %g6
	swapa	[%l7 + %g6] 0x80,	%l6
loop_1668:
	fblg,a	%fcc0,	loop_1669
	taddcc	%i6,	%g7,	%i2
	fbn,a	%fcc2,	loop_1670
	be,a	loop_1671
loop_1669:
	andcc	%o1,	%l3,	%o2
	alignaddrl	%g5,	%o3,	%i4
loop_1670:
	std	%f8,	[%l7 + 0x60]
loop_1671:
	movre	%i5,	0x351,	%o6
	taddcc	%i3,	%o5,	%g6
	tl	%icc,	0x5
	edge32n	%l5,	%l1,	%l2
	orn	%i1,	%g1,	%i0
	fxnor	%f6,	%f30,	%f28
	fbne,a	%fcc0,	loop_1672
	edge8	%l4,	%i7,	%o7
	or	%g4,	%o4,	%g2
	fbuge,a	%fcc2,	loop_1673
loop_1672:
	udivx	%l0,	0x1677,	%o0
	movn	%xcc,	%l6,	%i6
	mulscc	%g7,	0x02D4,	%i2
loop_1673:
	ta	%xcc,	0x4
	swap	[%l7 + 0x3C],	%o1
	ta	%icc,	0x0
	movl	%xcc,	%g3,	%l3
	fmul8x16au	%f18,	%f1,	%f16
	srlx	%o2,	0x1B,	%g5
	fnand	%f18,	%f16,	%f12
	edge16ln	%o3,	%i4,	%i5
	sdivcc	%o6,	0x102F,	%o5
	move	%xcc,	%g6,	%i3
	subccc	%l5,	0x1870,	%l1
	nop
	setx	0xF81FE3C1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0xE9F14946,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f15,	%f7
	edge32	%i1,	%l2,	%i0
	srax	%g1,	%i7,	%l4
	swap	[%l7 + 0x50],	%g4
	wr	%g0,	0x27,	%asi
	stha	%o7,	[%l7 + 0x5E] %asi
	membar	#Sync
	orcc	%o4,	0x07AF,	%l0
	movrne	%g2,	0x085,	%l6
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x34] %asi,	%o0
	stbar
	tvc	%icc,	0x1
	nop
	setx	0xA9D76C11405A95BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fcmpgt32	%f8,	%f28,	%g7
	fpack16	%f6,	%f8
	tpos	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f16,	%f4,	%f12
	orncc	%i6,	%i2,	%g3
	bvc,a	loop_1674
	nop
	fitod	%f19,	%f16
	sdivcc	%o1,	0x1FAC,	%o2
	movrne	%g5,	%l3,	%o3
loop_1674:
	bcc	loop_1675
	prefetch	[%l7 + 0x24],	 0x3
	nop
	setx	0x6CB76B70D3BE41EA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x3F4C6C76FFF81BA2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f20,	%f24
	fmovsgu	%xcc,	%f29,	%f7
loop_1675:
	sir	0x02EF
	edge16	%i4,	%o6,	%o5
	fbg	%fcc0,	loop_1676
	orcc	%g6,	0x1B2C,	%i5
	edge16	%l5,	%i3,	%i1
	movn	%xcc,	%l1,	%i0
loop_1676:
	ld	[%l7 + 0x24],	%f15
	brlz,a	%g1,	loop_1677
	fmovsvc	%xcc,	%f24,	%f11
	smulcc	%i7,	%l4,	%g4
	movg	%xcc,	%l2,	%o4
loop_1677:
	xorcc	%l0,	0x18A0,	%g2
	udiv	%o7,	0x11F6,	%l6
	srax	%g7,	0x12,	%i6
	tgu	%xcc,	0x1
	mova	%xcc,	%o0,	%i2
	tl	%xcc,	0x1
	te	%icc,	0x1
	edge32l	%g3,	%o2,	%g5
	nop
	setx	0x4D013D74,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x47AAF7A1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f5,	%f28
	array8	%o1,	%o3,	%l3
	array16	%o6,	%o5,	%i4
	fmovdneg	%xcc,	%f11,	%f20
	nop
	fitod	%f2,	%f4
	fdtos	%f4,	%f17
	xorcc	%g6,	%l5,	%i5
	tsubcc	%i1,	%l1,	%i0
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x37] %asi,	%i3
	sra	%g1,	%l4,	%g4
	movpos	%icc,	%i7,	%o4
	tneg	%xcc,	0x5
	tleu	%icc,	0x3
	edge16l	%l2,	%l0,	%g2
	ldub	[%l7 + 0x19],	%l6
	move	%icc,	%g7,	%i6
	movne	%xcc,	%o0,	%i2
	fmovdvc	%icc,	%f17,	%f21
	or	%g3,	0x10B8,	%o7
	tle	%xcc,	0x5
	fmovdge	%xcc,	%f27,	%f10
	movrlz	%o2,	%g5,	%o1
	set	0x3C, %o7
	lduha	[%l7 + %o7] 0x88,	%l3
	brz	%o6,	loop_1678
	fbule	%fcc1,	loop_1679
	nop
	setx	0xDD10E64F14910AF5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f20
	tle	%icc,	0x0
loop_1678:
	edge32ln	%o5,	%o3,	%g6
loop_1679:
	membar	0x4B
	brlz	%l5,	loop_1680
	tcs	%xcc,	0x4
	ldub	[%l7 + 0x1A],	%i4
	fbo	%fcc2,	loop_1681
loop_1680:
	edge32l	%i1,	%l1,	%i0
	fors	%f5,	%f28,	%f9
	nop
	setx	0x538225CD1B1EB0C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xE9C6D69539FA78A8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f24,	%f20
loop_1681:
	tsubcctv	%i3,	%i5,	%l4
	ba,a	loop_1682
	edge32	%g4,	%g1,	%o4
	srax	%i7,	0x17,	%l2
	movleu	%icc,	%l0,	%l6
loop_1682:
	bcs,a	loop_1683
	nop
	setx	0x31CDD6AEF5E9243F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f16
	nop
	setx	0xA6C3243B8058E4DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	subcc	%g7,	%i6,	%g2
loop_1683:
	nop
	set	0x70, %g5
	stwa	%i2,	[%l7 + %g5] 0xeb
	membar	#Sync
	or	%o0,	%g3,	%o2
	fcmpgt32	%f14,	%f24,	%o7
	sdivcc	%g5,	0x1057,	%l3
	move	%icc,	%o1,	%o6
	fpadd32	%f10,	%f18,	%f10
	movn	%icc,	%o3,	%g6
	edge16	%l5,	%o5,	%i1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i4,	%l1
	te	%icc,	0x5
	andcc	%i0,	0x0E2A,	%i3
	te	%xcc,	0x7
	movcs	%icc,	%l4,	%g4
	te	%icc,	0x5
	set	0x44, %l6
	swapa	[%l7 + %l6] 0x11,	%i5
	andcc	%o4,	0x0890,	%g1
	fmovdcc	%xcc,	%f24,	%f21
	fmovdn	%icc,	%f8,	%f0
	movg	%xcc,	%i7,	%l0
	wr	%g0,	0x80,	%asi
	sta	%f12,	[%l7 + 0x18] %asi
	sdiv	%l6,	0x0EBA,	%l2
	tg	%icc,	0x6
	fpadd32	%f6,	%f20,	%f0
	movvs	%xcc,	%g7,	%i6
	taddcc	%i2,	0x1568,	%o0
	array32	%g2,	%g3,	%o7
	fbue	%fcc3,	loop_1684
	fbug	%fcc2,	loop_1685
	sllx	%g5,	%l3,	%o2
	udiv	%o6,	0x00F3,	%o3
loop_1684:
	sub	%g6,	0x12A3,	%o1
loop_1685:
	srax	%o5,	0x1F,	%i1
	tvc	%xcc,	0x5
	sdivcc	%i4,	0x04CE,	%l5
	tcc	%xcc,	0x1
	stw	%l1,	[%l7 + 0x24]
	fmovsge	%icc,	%f30,	%f6
	fmovse	%xcc,	%f14,	%f17
	bvc,pn	%xcc,	loop_1686
	fmovrdgez	%i0,	%f30,	%f20
	edge8l	%l4,	%i3,	%g4
	stx	%i5,	[%l7 + 0x58]
loop_1686:
	nop
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o4,	%i7
	fmovdg	%xcc,	%f20,	%f31
	mova	%icc,	%l0,	%l6
	fmovrdlez	%g1,	%f14,	%f4
	nop
	setx	0xEC4B16C8ED3B0CED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f16
	orcc	%g7,	0x1E20,	%i6
	nop
	setx	0x0E8C527405CEE8A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f26
	fbne,a	%fcc2,	loop_1687
	ldx	[%l7 + 0x60],	%l2
	alignaddrl	%i2,	%o0,	%g2
	subcc	%g3,	%o7,	%g5
loop_1687:
	fsrc2	%f22,	%f28
	movge	%icc,	%o2,	%o6
	movleu	%xcc,	%l3,	%g6
	bleu,a,pt	%xcc,	loop_1688
	bvs,a,pn	%xcc,	loop_1689
	mova	%xcc,	%o3,	%o1
	movn	%icc,	%i1,	%o5
loop_1688:
	movvc	%icc,	%l5,	%l1
loop_1689:
	move	%icc,	%i4,	%l4
	sdivx	%i0,	0x157E,	%g4
	bl	loop_1690
	move	%icc,	%i5,	%o4
	nop
	setx	0x57A2F76F6FFB59E4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xE77F18D55C28B080,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f2,	%f14
	udivx	%i7,	0x0506,	%l0
loop_1690:
	mulx	%l6,	0x1731,	%i3
	tvc	%xcc,	0x3
	addccc	%g7,	%i6,	%l2
	edge8ln	%g1,	%i2,	%g2
	tpos	%xcc,	0x3
	tvc	%icc,	0x7
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x78] %asi,	%o0
	orncc	%o7,	0x1E04,	%g3
	smul	%o2,	%g5,	%o6
	edge16l	%l3,	%o3,	%g6
	ba,pn	%xcc,	loop_1691
	andncc	%i1,	%o5,	%o1
	sdivx	%l1,	0x0BCB,	%i4
	nop
	fitos	%f13,	%f0
	fstox	%f0,	%f22
loop_1691:
	ldstub	[%l7 + 0x11],	%l5
	smul	%i0,	0x0EE3,	%g4
	movrgz	%l4,	%i5,	%i7
	tg	%xcc,	0x7
	sdivcc	%o4,	0x1B39,	%l6
	fbug,a	%fcc2,	loop_1692
	fmovrdgz	%i3,	%f8,	%f14
	andcc	%l0,	0x18D7,	%i6
	xnorcc	%g7,	%l2,	%i2
loop_1692:
	prefetch	[%l7 + 0x78],	 0x2
	stw	%g2,	[%l7 + 0x20]
	taddcc	%o0,	0x140C,	%g1
	bgu,a,pn	%xcc,	loop_1693
	sll	%o7,	%o2,	%g5
	nop
	fitod	%f30,	%f2
	edge8ln	%g3,	%o6,	%l3
loop_1693:
	movrne	%g6,	0x2E0,	%o3
	fblg,a	%fcc0,	loop_1694
	movvs	%icc,	%o5,	%o1
	fbug,a	%fcc1,	loop_1695
	tvc	%icc,	0x3
loop_1694:
	sethi	0x16C7,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1695:
	alignaddr	%i1,	%l5,	%i0
	st	%f2,	[%l7 + 0x30]
	movrlez	%i4,	%l4,	%i5
	tg	%xcc,	0x1
	andcc	%i7,	0x181C,	%g4
	sethi	0x17CC,	%l6
	ta	%icc,	0x5
	edge16n	%o4,	%l0,	%i6
	edge8n	%g7,	%l2,	%i3
	bleu	loop_1696
	fmovsge	%icc,	%f13,	%f19
	umul	%i2,	%o0,	%g1
	ta	%xcc,	0x1
loop_1696:
	movcc	%icc,	%g2,	%o7
	movgu	%xcc,	%g5,	%o2
	fmovrslez	%g3,	%f15,	%f15
	nop
	fitos	%f4,	%f13
	fstod	%f13,	%f8
	edge32l	%o6,	%g6,	%o3
	std	%f26,	[%l7 + 0x68]
	edge16l	%o5,	%o1,	%l1
	tg	%icc,	0x0
	fnegs	%f16,	%f19
	sub	%i1,	0x1109,	%l5
	fmovsne	%xcc,	%f31,	%f20
	tne	%xcc,	0x1
	andncc	%i0,	%l3,	%l4
	fxnor	%f16,	%f0,	%f24
	movcc	%xcc,	%i5,	%i4
	sra	%g4,	0x0F,	%l6
	xor	%i7,	%o4,	%l0
	edge16	%i6,	%l2,	%g7
	xor	%i3,	0x16CA,	%i2
	fpadd16s	%f14,	%f6,	%f20
	movvc	%xcc,	%g1,	%o0
	fmovdvs	%icc,	%f27,	%f14
	andcc	%g2,	0x04EF,	%o7
	nop
	setx	0x105C07C314708B30,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x96FCBE55EA290512,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f14,	%f28
	fmovse	%icc,	%f25,	%f22
	bg,pn	%xcc,	loop_1697
	movre	%g5,	0x06A,	%g3
	wr	%g0,	0x10,	%asi
	stba	%o6,	[%l7 + 0x0A] %asi
loop_1697:
	fmovsle	%xcc,	%f2,	%f16
	ldsw	[%l7 + 0x14],	%g6
	movg	%icc,	%o3,	%o2
	edge16n	%o5,	%o1,	%l1
	te	%icc,	0x0
	xnor	%l5,	%i0,	%l3
	smul	%i1,	%l4,	%i5
	xorcc	%g4,	%i4,	%i7
	srax	%o4,	0x01,	%l0
	smulcc	%i6,	%l6,	%l2
	movl	%icc,	%i3,	%i2
	fpsub32s	%f4,	%f9,	%f18
	fmovdl	%icc,	%f21,	%f5
	ldsh	[%l7 + 0x4C],	%g1
	add	%o0,	%g7,	%g2
	taddcctv	%g5,	0x073C,	%o7
	bn	%icc,	loop_1698
	udiv	%o6,	0x0A68,	%g6
	fmovrsgz	%g3,	%f15,	%f14
	nop
	setx	0x107008D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
loop_1698:
	movrne	%o3,	%o2,	%o5
	movpos	%icc,	%o1,	%l1
	fsrc2s	%f3,	%f7
	fmovsne	%icc,	%f21,	%f11
	srax	%i0,	%l5,	%i1
	fmovda	%xcc,	%f16,	%f27
	array32	%l4,	%l3,	%g4
	membar	0x37
	movge	%icc,	%i4,	%i5
	ldstub	[%l7 + 0x72],	%i7
	edge32	%l0,	%i6,	%o4
	fsrc2s	%f16,	%f26
	tsubcc	%l6,	0x0D2F,	%i3
	movcc	%xcc,	%l2,	%i2
	movge	%xcc,	%o0,	%g7
	ldstub	[%l7 + 0x6D],	%g1
	fbug	%fcc0,	loop_1699
	lduh	[%l7 + 0x38],	%g2
	movcs	%icc,	%g5,	%o7
	fcmpeq16	%f12,	%f24,	%g6
loop_1699:
	bleu,a,pn	%xcc,	loop_1700
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%g3,	0x0265,	%o6
	movg	%xcc,	%o3,	%o2
loop_1700:
	ba,a	loop_1701
	fpadd32s	%f6,	%f23,	%f25
	bgu,a	loop_1702
	nop
	fitos	%f2,	%f1
	fstox	%f1,	%f14
	fxtos	%f14,	%f0
loop_1701:
	fbge	%fcc1,	loop_1703
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1702:
	xnor	%o1,	0x15A6,	%o5
	fblg	%fcc0,	loop_1704
loop_1703:
	tpos	%icc,	0x6
	edge16ln	%i0,	%l1,	%i1
	edge16l	%l5,	%l4,	%g4
loop_1704:
	edge8n	%l3,	%i4,	%i5
	tneg	%xcc,	0x2
	fbge	%fcc2,	loop_1705
	movge	%icc,	%i7,	%l0
	nop
	setx	0xC91F7625206C4384,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	bcs,a,pn	%xcc,	loop_1706
loop_1705:
	nop
	fitod	%f4,	%f4
	fdtox	%f4,	%f28
	fblg,a	%fcc3,	loop_1707
	fmul8sux16	%f8,	%f14,	%f0
loop_1706:
	fmovdcc	%xcc,	%f27,	%f10
	sub	%i6,	%o4,	%l6
loop_1707:
	movleu	%icc,	%i3,	%l2
	ldstub	[%l7 + 0x63],	%i2
	edge32n	%g7,	%g1,	%o0
	fba	%fcc2,	loop_1708
	andcc	%g2,	0x1A0B,	%o7
	ta	%icc,	0x2
	udivx	%g5,	0x1298,	%g6
loop_1708:
	bvs	%xcc,	loop_1709
	nop
	setx	loop_1710,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitos	%f3,	%f6
	fbne	%fcc1,	loop_1711
loop_1709:
	fmovdl	%xcc,	%f5,	%f17
loop_1710:
	brgez	%o6,	loop_1712
	nop
	setx	0xE188746E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x0D49C192,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f5,	%f25
loop_1711:
	fcmpne32	%f12,	%f16,	%g3
	sll	%o2,	%o1,	%o3
loop_1712:
	lduw	[%l7 + 0x38],	%i0
	movneg	%xcc,	%l1,	%o5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l5,	%l4
	fbe,a	%fcc2,	loop_1713
	tvs	%xcc,	0x5
	tsubcctv	%g4,	%i1,	%i4
	array32	%i5,	%l3,	%i7
loop_1713:
	udiv	%l0,	0x187E,	%o4
	flush	%l7 + 0x14
	tsubcc	%l6,	%i6,	%i3
	bleu,pt	%icc,	loop_1714
	fornot1	%f20,	%f0,	%f16
	fmovda	%icc,	%f9,	%f4
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x10] %asi,	%i2
loop_1714:
	st	%f17,	[%l7 + 0x7C]
	udiv	%l2,	0x11B7,	%g7
	movgu	%icc,	%g1,	%g2
	udivcc	%o0,	0x086B,	%o7
	bne,a	%xcc,	loop_1715
	fbo,a	%fcc0,	loop_1716
	xnorcc	%g6,	%o6,	%g5
	ldsw	[%l7 + 0x60],	%g3
loop_1715:
	movrlez	%o2,	0x138,	%o1
loop_1716:
	edge32ln	%o3,	%i0,	%o5
	addcc	%l1,	%l4,	%l5
	fmovsvs	%xcc,	%f11,	%f5
	umulcc	%i1,	0x0EB3,	%i4
	tle	%icc,	0x4
	fpack32	%f10,	%f6,	%f2
	set	0x70, %o3
	ldda	[%l7 + %o3] 0xea,	%i4
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f2
	fxtod	%f2,	%f30
	movne	%xcc,	%g4,	%i7
	fsrc2	%f14,	%f22
	fmovspos	%xcc,	%f2,	%f28
	movpos	%xcc,	%l3,	%l0
	tg	%xcc,	0x1
	and	%l6,	%i6,	%o4
	smulcc	%i2,	%i3,	%l2
	edge32ln	%g1,	%g7,	%g2
	ldsw	[%l7 + 0x38],	%o7
	edge32ln	%g6,	%o6,	%g5
	movge	%icc,	%o0,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o1,	%o3,	%g3
	movre	%i0,	0x3B3,	%o5
	movrlz	%l1,	0x274,	%l5
	xnor	%i1,	0x097C,	%i4
	fbuge,a	%fcc3,	loop_1717
	movrlez	%l4,	0x042,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f12,	%f30,	%f22
loop_1717:
	bl,pt	%icc,	loop_1718
	tsubcctv	%i7,	0x01EE,	%g4
	add	%l3,	%l0,	%i6
	fornot2	%f10,	%f30,	%f0
loop_1718:
	edge32n	%o4,	%i2,	%l6
	fmovsle	%xcc,	%f6,	%f31
	movg	%xcc,	%i3,	%l2
	movpos	%xcc,	%g7,	%g1
	fcmpgt16	%f12,	%f28,	%o7
	fmovde	%xcc,	%f1,	%f4
	fbge,a	%fcc3,	loop_1719
	fmovsgu	%xcc,	%f13,	%f14
	and	%g6,	%g2,	%o6
	sub	%g5,	0x1B78,	%o0
loop_1719:
	fxor	%f6,	%f0,	%f6
	fcmpeq16	%f20,	%f2,	%o2
	for	%f4,	%f22,	%f18
	fabss	%f1,	%f0
	ble,a,pn	%xcc,	loop_1720
	prefetch	[%l7 + 0x70],	 0x3
	fcmpeq16	%f12,	%f22,	%o3
	subcc	%g3,	0x0788,	%o1
loop_1720:
	fbul	%fcc0,	loop_1721
	movrgz	%i0,	0x134,	%o5
	tle	%icc,	0x1
	tsubcc	%l5,	0x0CCB,	%i1
loop_1721:
	edge32	%l1,	%l4,	%i4
	mulscc	%i5,	0x1008,	%i7
	fbuge,a	%fcc2,	loop_1722
	umul	%l3,	%g4,	%l0
	movvs	%icc,	%i6,	%i2
	tg	%icc,	0x0
loop_1722:
	srl	%l6,	0x1C,	%o4
	nop
	fitos	%f16,	%f1
	fbn,a	%fcc1,	loop_1723
	sub	%l2,	%g7,	%i3
	movleu	%icc,	%g1,	%g6
	ba,a	loop_1724
loop_1723:
	array8	%g2,	%o6,	%g5
	movgu	%xcc,	%o0,	%o2
	tcc	%icc,	0x6
loop_1724:
	nop
	fitos	%f29,	%f18
	bcs	%xcc,	loop_1725
	tvs	%xcc,	0x1
	fcmpeq16	%f14,	%f28,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1725:
	tneg	%xcc,	0x2
	flush	%l7 + 0x14
	fmuld8sux16	%f28,	%f22,	%f24
	andn	%o3,	0x02CB,	%o1
	ldstub	[%l7 + 0x3C],	%g3
	te	%icc,	0x7
	movrne	%o5,	%l5,	%i1
	edge8l	%l1,	%l4,	%i0
	xorcc	%i4,	%i5,	%i7
	fbg,a	%fcc0,	loop_1726
	array8	%g4,	%l3,	%i6
	fands	%f3,	%f20,	%f10
	fxors	%f7,	%f1,	%f4
loop_1726:
	nop
	wr	%g0,	0x22,	%asi
	stxa	%i2,	[%l7 + 0x48] %asi
	membar	#Sync
	array32	%l6,	%l0,	%o4
	edge16n	%l2,	%g7,	%g1
	brlz,a	%g6,	loop_1727
	sir	0x11B3
	orn	%i3,	0x0EE6,	%g2
	tne	%xcc,	0x4
loop_1727:
	mova	%xcc,	%g5,	%o6
	swap	[%l7 + 0x54],	%o2
	fbe	%fcc3,	loop_1728
	movre	%o0,	%o7,	%o1
	bg,pn	%icc,	loop_1729
	sdiv	%o3,	0x16AB,	%o5
loop_1728:
	edge8n	%l5,	%i1,	%l1
	fmovrdlez	%l4,	%f6,	%f16
loop_1729:
	array8	%g3,	%i4,	%i5
	mulscc	%i0,	%g4,	%i7
	membar	0x50
	fbn,a	%fcc0,	loop_1730
	or	%i6,	0x0BAA,	%l3
	wr	%g0,	0x81,	%asi
	stwa	%i2,	[%l7 + 0x0C] %asi
loop_1730:
	brnz	%l6,	loop_1731
	movg	%icc,	%o4,	%l2
	array32	%l0,	%g7,	%g1
	add	%l7,	0x7C,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] 0x88,	%i3,	%g6
loop_1731:
	or	%g2,	%o6,	%g5
	movrgz	%o2,	0x13F,	%o0
	popc	0x0D65,	%o1
	movne	%xcc,	%o7,	%o5
	fzero	%f14
	movleu	%icc,	%o3,	%i1
	nop
	setx	loop_1732,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsneg	%icc,	%f5,	%f14
	sllx	%l1,	0x16,	%l4
	sll	%g3,	0x14,	%l5
loop_1732:
	ldd	[%l7 + 0x08],	%f16
	fmovrdlez	%i5,	%f10,	%f10
	st	%f20,	[%l7 + 0x78]
	sir	0x18E2
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f20
	fxtod	%f20,	%f8
	movvc	%icc,	%i4,	%g4
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
	sir	0x1C67
	tne	%xcc,	0x0
	fsrc1	%f30,	%f0
loop_1733:
	movvc	%icc,	%i7,	%i0
	membar	0x61
	fbn,a	%fcc3,	loop_1734
	sir	0x0973
	sth	%l3,	[%l7 + 0x08]
	mulx	%i6,	0x1B53,	%i2
loop_1734:
	movcs	%icc,	%l6,	%o4
	movge	%icc,	%l0,	%g7
	tl	%xcc,	0x5
	ble,a	%xcc,	loop_1735
	fbue,a	%fcc2,	loop_1736
	subc	%l2,	0x0749,	%g1
	fblg	%fcc2,	loop_1737
loop_1735:
	faligndata	%f14,	%f12,	%f22
loop_1736:
	movrne	%i3,	0x1CC,	%g2
	taddcctv	%o6,	%g6,	%g5
loop_1737:
	bl,a	%icc,	loop_1738
	tsubcctv	%o0,	0x0090,	%o1
	tsubcctv	%o2,	%o7,	%o5
	fabss	%f0,	%f6
loop_1738:
	xnorcc	%o3,	0x030E,	%l1
	bcc	%xcc,	loop_1739
	umul	%l4,	%g3,	%i1
	fbug,a	%fcc1,	loop_1740
	subc	%l5,	0x0D52,	%i5
loop_1739:
	edge32	%i4,	%i7,	%i0
	smulcc	%l3,	%g4,	%i6
loop_1740:
	ldsb	[%l7 + 0x5F],	%l6
	brlz,a	%o4,	loop_1741
	bl,a	loop_1742
	addccc	%i2,	0x05F0,	%l0
	smulcc	%l2,	%g7,	%i3
loop_1741:
	fmovdcc	%xcc,	%f21,	%f17
loop_1742:
	nop
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sdiv	%g2,	0x0404,	%g1
	nop
	fitod	%f12,	%f2
	fdtoi	%f2,	%f5
	fcmpgt32	%f22,	%f22,	%o6
	prefetch	[%l7 + 0x54],	 0x1
	move	%xcc,	%g6,	%g5
	movrlez	%o1,	0x23C,	%o2
	nop
	setx	0x5FAE3D8EB814BE10,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x3030764C53563861,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f18,	%f4
	bleu,a,pn	%icc,	loop_1743
	fands	%f14,	%f10,	%f12
	array16	%o7,	%o0,	%o5
	xor	%o3,	%l1,	%l4
loop_1743:
	nop
	set	0x16, %o4
	ldstuba	[%l7 + %o4] 0x04,	%i1
	fmovsneg	%xcc,	%f6,	%f13
	fsrc1	%f0,	%f24
	nop
	fitod	%f20,	%f12
	bvs,a,pt	%icc,	loop_1744
	mulx	%g3,	%l5,	%i5
	bn,a	%icc,	loop_1745
	andcc	%i4,	%i0,	%i7
loop_1744:
	or	%g4,	0x039A,	%i6
	edge16l	%l6,	%l3,	%i2
loop_1745:
	nop
	fitos	%f11,	%f17
	fstoi	%f17,	%f31
	movrgz	%l0,	0x340,	%o4
	fmovsneg	%xcc,	%f12,	%f24
	fcmpne32	%f6,	%f22,	%g7
	tgu	%xcc,	0x1
	bne,a	loop_1746
	andn	%l2,	%i3,	%g1
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x5E] %asi,	%g2
loop_1746:
	ldsh	[%l7 + 0x56],	%o6
	fandnot1	%f6,	%f28,	%f14
	addc	%g6,	0x0343,	%o1
	umul	%g5,	%o7,	%o0
	fbul	%fcc3,	loop_1747
	call	loop_1748
	edge8ln	%o5,	%o3,	%o2
	orncc	%l1,	%i1,	%g3
loop_1747:
	addcc	%l5,	%i5,	%l4
loop_1748:
	fmovdn	%xcc,	%f4,	%f26
	fandnot2s	%f20,	%f3,	%f25
	tsubcc	%i4,	0x0DEF,	%i0
	udivx	%i7,	0x156E,	%g4
	tcs	%xcc,	0x0
	umul	%l6,	0x1926,	%i6
	fbl,a	%fcc3,	loop_1749
	sdivx	%l3,	0x19F1,	%i2
	tl	%xcc,	0x0
	ldx	[%l7 + 0x08],	%o4
loop_1749:
	fnors	%f26,	%f14,	%f21
	fbge,a	%fcc0,	loop_1750
	movvs	%icc,	%l0,	%l2
	set	0x40, %i3
	prefetcha	[%l7 + %i3] 0x14,	 0x2
loop_1750:
	ldsb	[%l7 + 0x2D],	%g1
	array32	%g2,	%o6,	%g6
	bcs,pt	%icc,	loop_1751
	sdivcc	%o1,	0x1023,	%i3
	fbg,a	%fcc0,	loop_1752
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f24
	fxtod	%f24,	%f28
loop_1751:
	fmovrsgz	%g5,	%f9,	%f14
	bvc,pn	%xcc,	loop_1753
loop_1752:
	taddcc	%o0,	0x081B,	%o7
	ldstub	[%l7 + 0x11],	%o3
	mulscc	%o2,	%l1,	%i1
loop_1753:
	movrgz	%g3,	0x3C7,	%l5
	tcc	%xcc,	0x4
	fornot2s	%f1,	%f16,	%f18
	mova	%xcc,	%i5,	%o5
	bvc,a	%xcc,	loop_1754
	sethi	0x0B91,	%l4
	movg	%icc,	%i4,	%i7
	lduw	[%l7 + 0x30],	%g4
loop_1754:
	fsrc1	%f18,	%f24
	movg	%xcc,	%l6,	%i0
	fblg	%fcc2,	loop_1755
	lduh	[%l7 + 0x5E],	%l3
	sir	0x0FFB
	movgu	%xcc,	%i2,	%o4
loop_1755:
	nop
	set	0x50, %o1
	sta	%f14,	[%l7 + %o1] 0x10
	stb	%i6,	[%l7 + 0x73]
	array32	%l2,	%l0,	%g7
	edge8l	%g1,	%o6,	%g6
	fmovda	%xcc,	%f22,	%f15
	fxnors	%f16,	%f15,	%f28
	fabsd	%f20,	%f10
	tcs	%xcc,	0x3
	fmovdvs	%xcc,	%f7,	%f27
	xorcc	%o1,	0x06D3,	%i3
	mulx	%g5,	0x1D3F,	%g2
	array32	%o0,	%o7,	%o3
	edge32	%o2,	%l1,	%i1
	alignaddr	%l5,	%i5,	%o5
	fnot1s	%f0,	%f2
	xnor	%l4,	%i4,	%g3
	fmovda	%icc,	%f0,	%f3
	movrlez	%i7,	%l6,	%g4
	xorcc	%i0,	%i2,	%l3
	ldsw	[%l7 + 0x48],	%i6
	fmovrdne	%l2,	%f26,	%f24
	movl	%icc,	%l0,	%o4
	tvc	%xcc,	0x5
	movle	%icc,	%g7,	%o6
	nop
	set	0x33, %g3
	stb	%g6,	[%l7 + %g3]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f3,	%f19
	ta	%icc,	0x4
	array32	%o1,	%g1,	%g5
	fmul8x16	%f27,	%f6,	%f24
	ldsh	[%l7 + 0x48],	%g2
	fba	%fcc3,	loop_1756
	fble,a	%fcc0,	loop_1757
	fbule	%fcc1,	loop_1758
	tvs	%icc,	0x0
loop_1756:
	mulx	%o0,	0x1B43,	%o7
loop_1757:
	addcc	%o3,	0x00F6,	%i3
loop_1758:
	taddcc	%l1,	%o2,	%i1
	brnz	%i5,	loop_1759
	fcmple32	%f30,	%f26,	%l5
	movvs	%icc,	%o5,	%l4
	fmovsg	%icc,	%f31,	%f20
loop_1759:
	membar	0x4D
	fbuge	%fcc1,	loop_1760
	fnot2	%f12,	%f6
	sdiv	%g3,	0x10AB,	%i4
	brz,a	%i7,	loop_1761
loop_1760:
	array32	%l6,	%i0,	%g4
	movcs	%xcc,	%i2,	%l3
	srl	%l2,	%i6,	%o4
loop_1761:
	movrgez	%g7,	%o6,	%l0
	te	%icc,	0x5
	fmul8x16au	%f28,	%f23,	%f14
	movrlez	%g6,	%o1,	%g1
	array32	%g2,	%g5,	%o7
	fmovspos	%icc,	%f11,	%f18
	fxors	%f30,	%f15,	%f19
	fmovs	%f18,	%f27
	fblg	%fcc0,	loop_1762
	movre	%o3,	0x16A,	%i3
	addc	%l1,	%o2,	%o0
	movneg	%icc,	%i1,	%l5
loop_1762:
	ldsh	[%l7 + 0x4C],	%o5
	fmovsleu	%xcc,	%f9,	%f0
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x10
	sub	%i5,	0x036F,	%g3
	tg	%icc,	0x2
	fmovsgu	%icc,	%f22,	%f15
	addcc	%l4,	%i7,	%i4
	fsrc1	%f8,	%f24
	orn	%i0,	%l6,	%i2
	st	%f16,	[%l7 + 0x08]
	movcs	%xcc,	%g4,	%l2
	andncc	%i6,	%o4,	%l3
	sll	%o6,	%l0,	%g6
	bcc,a	loop_1763
	fornot1	%f12,	%f2,	%f24
	sir	0x08AF
	bcs,pn	%xcc,	loop_1764
loop_1763:
	nop
	setx	0xE27D58A6DAB1BE88,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x63444D5C2501A3CD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f30,	%f16
	tneg	%icc,	0x6
	mulscc	%o1,	%g1,	%g7
loop_1764:
	fandnot1s	%f16,	%f21,	%f17
	fpack16	%f8,	%f3
	edge32	%g5,	%o7,	%o3
	movleu	%icc,	%i3,	%l1
	fmovd	%f8,	%f2
	subcc	%g2,	0x08AD,	%o2
	fcmple16	%f6,	%f6,	%i1
	tvc	%icc,	0x3
	tpos	%icc,	0x1
	andn	%o0,	%o5,	%i5
	fble,a	%fcc1,	loop_1765
	udivx	%l5,	0x1B85,	%l4
	bvc,a,pn	%xcc,	loop_1766
	tne	%icc,	0x4
loop_1765:
	xor	%i7,	%g3,	%i0
	bcc,a	loop_1767
loop_1766:
	movrgz	%i4,	%i2,	%g4
	sllx	%l6,	0x19,	%i6
	set	0x7F, %i1
	ldstuba	[%l7 + %i1] 0x04,	%l2
loop_1767:
	tneg	%icc,	0x6
	addc	%o4,	0x0017,	%l3
	fexpand	%f10,	%f28
	edge32n	%l0,	%g6,	%o6
	umul	%g1,	0x1BC4,	%o1
	bpos,pn	%icc,	loop_1768
	fnands	%f22,	%f17,	%f28
	edge32ln	%g5,	%g7,	%o7
	sllx	%i3,	%o3,	%g2
loop_1768:
	srlx	%o2,	0x0D,	%l1
	nop
	set	0x20, %o0
	stw	%i1,	[%l7 + %o0]
	brgz,a	%o0,	loop_1769
	movre	%o5,	%i5,	%l4
	tg	%xcc,	0x0
	fsrc2	%f4,	%f28
loop_1769:
	alignaddrl	%l5,	%i7,	%g3
	tsubcc	%i4,	0x0361,	%i0
	membar	0x59
	movrgz	%i2,	%l6,	%i6
	movrlz	%l2,	0x26A,	%g4
	movl	%xcc,	%o4,	%l0
	andn	%g6,	0x0D89,	%l3
	taddcctv	%g1,	0x013D,	%o6
	nop
	setx	loop_1770,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bshuffle	%f30,	%f28,	%f6
	brnz,a	%g5,	loop_1771
	ldsw	[%l7 + 0x68],	%o1
loop_1770:
	movg	%icc,	%o7,	%g7
	ta	%icc,	0x7
loop_1771:
	tgu	%xcc,	0x4
	or	%o3,	%g2,	%o2
	sllx	%l1,	%i3,	%i1
	smulcc	%o5,	0x0517,	%i5
	tge	%icc,	0x3
	tge	%xcc,	0x6
	tpos	%icc,	0x1
	edge8n	%o0,	%l4,	%i7
	subccc	%g3,	%i4,	%i0
	ldsw	[%l7 + 0x60],	%i2
	orn	%l6,	0x0F9F,	%l5
	ldd	[%l7 + 0x58],	%f2
	sir	0x0684
	fcmpgt16	%f16,	%f2,	%i6
	fmovsge	%xcc,	%f11,	%f18
	fxnors	%f6,	%f22,	%f13
	set	0x22, %i4
	ldsha	[%l7 + %i4] 0x11,	%l2
	fmovrdlez	%o4,	%f4,	%f4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0FFC,	%l0
	ldsh	[%l7 + 0x30],	%g6
	set	0x38, %i2
	stxa	%g4,	[%l7 + %i2] 0x2a
	membar	#Sync
	tle	%icc,	0x3
	edge32	%l3,	%o6,	%g1
	movrlz	%g5,	%o7,	%g7
	bgu,a	loop_1772
	andn	%o1,	%o3,	%o2
	flush	%l7 + 0x0C
	fmovrslez	%l1,	%f27,	%f10
loop_1772:
	fmul8x16al	%f24,	%f11,	%f18
	sub	%i3,	0x1D94,	%g2
	edge32	%o5,	%i5,	%i1
	edge32l	%o0,	%l4,	%g3
	swap	[%l7 + 0x78],	%i7
	array32	%i4,	%i2,	%i0
	orn	%l6,	%i6,	%l2
	brlez	%l5,	loop_1773
	prefetch	[%l7 + 0x60],	 0x2
	tle	%icc,	0x0
	fcmpne16	%f28,	%f10,	%o4
loop_1773:
	nop
	setx	0xE167C6A052085770,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x523F2670C587DEEB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f10,	%f0
	nop
	fitos	%f10,	%f3
	fstox	%f3,	%f14
	fbue	%fcc2,	loop_1774
	nop
	fitod	%f30,	%f14
	orcc	%g6,	%g4,	%l0
	tpos	%xcc,	0x6
loop_1774:
	bpos,a	%icc,	loop_1775
	fzero	%f4
	tvc	%icc,	0x1
	fble,a	%fcc3,	loop_1776
loop_1775:
	udiv	%l3,	0x1D85,	%g1
	edge8l	%g5,	%o7,	%g7
	smul	%o1,	0x1337,	%o3
loop_1776:
	srl	%o2,	0x15,	%o6
	tvc	%icc,	0x7
	fmovs	%f26,	%f5
	array32	%l1,	%i3,	%g2
	movre	%o5,	%i5,	%o0
	edge16	%i1,	%g3,	%i7
	movl	%xcc,	%l4,	%i4
	lduh	[%l7 + 0x54],	%i2
	addcc	%l6,	%i0,	%l2
	wr	%g0,	0x0c,	%asi
	stba	%i6,	[%l7 + 0x7A] %asi
	sdiv	%o4,	0x08FA,	%g6
	fmovse	%xcc,	%f5,	%f11
	fbule	%fcc1,	loop_1777
	xnor	%g4,	%l5,	%l3
	nop
	setx loop_1778, %l0, %l1
	jmpl %l1, %l0
	udiv	%g1,	0x03D4,	%o7
loop_1777:
	fba,a	%fcc2,	loop_1779
	tleu	%icc,	0x0
loop_1778:
	andncc	%g7,	%o1,	%o3
	or	%o2,	%g5,	%o6
loop_1779:
	udivx	%l1,	0x16EA,	%g2
	bg	loop_1780
	bvs,a	%xcc,	loop_1781
	sethi	0x030C,	%o5
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f14
loop_1780:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%i5
loop_1781:
	sth	%i3,	[%l7 + 0x32]
	fbo,a	%fcc1,	loop_1782
	bcs,a,pn	%xcc,	loop_1783
	fnegs	%f30,	%f28
	umul	%o0,	%g3,	%i1
loop_1782:
	nop
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x3D] %asi,	%l4
loop_1783:
	nop
	wr	%g0,	0x81,	%asi
	stba	%i7,	[%l7 + 0x6C] %asi
	fmul8sux16	%f12,	%f16,	%f30
	pdist	%f10,	%f2,	%f24
	tle	%icc,	0x7
	tge	%icc,	0x4
	set	0x4C, %i5
	lduwa	[%l7 + %i5] 0x89,	%i2
	fmovrsne	%i4,	%f8,	%f30
	edge8ln	%i0,	%l6,	%i6
	fmovdneg	%xcc,	%f29,	%f15
	andncc	%l2,	%g6,	%g4
	sub	%l5,	%o4,	%l0
	sth	%g1,	[%l7 + 0x10]
	mulx	%l3,	%o7,	%g7
	or	%o3,	0x03C2,	%o2
	edge32ln	%g5,	%o6,	%l1
	tgu	%icc,	0x6
	movge	%icc,	%g2,	%o5
	sllx	%i5,	%i3,	%o1
	brgez	%o0,	loop_1784
	andcc	%i1,	0x165C,	%l4
	andncc	%i7,	%g3,	%i2
	and	%i0,	0x18F5,	%l6
loop_1784:
	nop
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x81,	 0x2
	brgez	%l2,	loop_1785
	movrlz	%g6,	0x271,	%i4
	tne	%icc,	0x5
	popc	%g4,	%l5
loop_1785:
	fand	%f8,	%f16,	%f14
	movne	%xcc,	%l0,	%g1
	array16	%o4,	%l3,	%o7
	wr	%g0,	0x23,	%asi
	stxa	%g7,	[%l7 + 0x10] %asi
	membar	#Sync
	sir	0x14AF
	fbue	%fcc1,	loop_1786
	ldsw	[%l7 + 0x2C],	%o2
	movrlz	%g5,	0x294,	%o3
	sra	%o6,	0x03,	%l1
loop_1786:
	movpos	%xcc,	%o5,	%i5
	fornot2	%f20,	%f14,	%f18
	fsrc2s	%f2,	%f26
	array32	%i3,	%g2,	%o1
	mulx	%i1,	0x117A,	%l4
	movrlz	%i7,	%o0,	%i2
	sllx	%i0,	0x08,	%l6
	fandnot1s	%f19,	%f15,	%f27
	edge8ln	%g3,	%i6,	%l2
	fcmpgt32	%f14,	%f20,	%i4
	tsubcctv	%g4,	0x1CEF,	%g6
	tvs	%xcc,	0x2
	movrne	%l5,	%l0,	%o4
	bleu,pt	%icc,	loop_1787
	ble,pt	%xcc,	loop_1788
	nop
	setx loop_1789, %l0, %l1
	jmpl %l1, %l3
	fbl	%fcc0,	loop_1790
loop_1787:
	edge32n	%g1,	%g7,	%o2
loop_1788:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1789:
	subc	%o7,	%g5,	%o3
loop_1790:
	xorcc	%o6,	%l1,	%i5
	tcc	%xcc,	0x5
	orn	%i3,	%g2,	%o5
	subccc	%i1,	0x14C1,	%o1
	fmovsne	%icc,	%f29,	%f6
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x89
	nop
	setx	0x8E0EBBCF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x59891192,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f9,	%f11
	popc	0x1002,	%l4
	array16	%o0,	%i2,	%i7
	mulx	%i0,	0x1022,	%g3
	fmovdleu	%xcc,	%f19,	%f22
	fmovs	%f7,	%f9
	stb	%l6,	[%l7 + 0x7B]
	brz	%i6,	loop_1791
	xor	%l2,	0x08B0,	%g4
	fands	%f4,	%f2,	%f22
	movl	%xcc,	%i4,	%g6
loop_1791:
	fmuld8ulx16	%f1,	%f22,	%f30
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6B] %asi,	%l0
	ldsw	[%l7 + 0x4C],	%l5
	tvc	%xcc,	0x7
	movg	%icc,	%l3,	%g1
	tleu	%icc,	0x7
	orncc	%g7,	0x148D,	%o2
	fbe	%fcc3,	loop_1792
	bcs,pn	%xcc,	loop_1793
	fnegd	%f18,	%f30
	stbar
loop_1792:
	edge32n	%o4,	%o7,	%o3
loop_1793:
	edge16ln	%g5,	%o6,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i3,	%g2,	%l1
	fbg,a	%fcc1,	loop_1794
	fbe	%fcc2,	loop_1795
	movl	%icc,	%i1,	%o1
	fornot2	%f28,	%f8,	%f10
loop_1794:
	edge32l	%l4,	%o0,	%i2
loop_1795:
	fmovdgu	%icc,	%f22,	%f31
	bl,a	loop_1796
	fnor	%f12,	%f26,	%f6
	set	0x70, %o5
	swapa	[%l7 + %o5] 0x80,	%o5
loop_1796:
	and	%i0,	%g3,	%i7
	add	%l7,	0x20,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i6
	casxa	[%l6] 0x11,	%i6,	%l6
	fcmpeq32	%f10,	%f20,	%l2
	tvs	%xcc,	0x6
	edge8	%i4,	%g4,	%g6
	fbg	%fcc1,	loop_1797
	tleu	%icc,	0x3
	ldx	[%l7 + 0x70],	%l0
	bvs,pt	%icc,	loop_1798
loop_1797:
	mulscc	%l5,	%g1,	%l3
	movvs	%icc,	%o2,	%g7
	movrne	%o7,	%o4,	%o3
loop_1798:
	srl	%g5,	0x03,	%o6
	fmovspos	%icc,	%f21,	%f19
	subccc	%i5,	%i3,	%g2
	movpos	%icc,	%l1,	%i1
	fble,a	%fcc1,	loop_1799
	brgez,a	%l4,	loop_1800
	nop
	setx	loop_1801,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ta	%icc,	0x3
loop_1799:
	nop
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x69] %asi,	%o0
loop_1800:
	tl	%xcc,	0x2
loop_1801:
	tsubcc	%i2,	0x1F65,	%o5
	wr	%g0,	0x88,	%asi
	stba	%i0,	[%l7 + 0x46] %asi
	sir	0x14FD
	tsubcc	%g3,	%i7,	%i6
	fcmpeq16	%f16,	%f10,	%l6
	fbug	%fcc3,	loop_1802
	orcc	%o1,	0x0CE6,	%l2
	movl	%xcc,	%i4,	%g6
	fbul,a	%fcc3,	loop_1803
loop_1802:
	fmovdvs	%xcc,	%f20,	%f13
	sra	%g4,	0x07,	%l5
	tn	%xcc,	0x3
loop_1803:
	edge8	%g1,	%l0,	%o2
	movrlez	%g7,	0x0E1,	%o7
	te	%icc,	0x4
	edge8ln	%l3,	%o4,	%g5
	and	%o6,	%o3,	%i5
	subccc	%i3,	0x12AF,	%l1
	ldstub	[%l7 + 0x2D],	%i1
	membar	0x07
	bshuffle	%f6,	%f16,	%f14
	nop
	setx	loop_1804,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrgz	%l4,	%o0,	%i2
	tn	%icc,	0x4
	fnand	%f0,	%f6,	%f22
loop_1804:
	fandnot2s	%f2,	%f12,	%f13
	brlez,a	%g2,	loop_1805
	movrne	%o5,	%i0,	%g3
	fpackfix	%f22,	%f25
	array8	%i6,	%i7,	%o1
loop_1805:
	subccc	%l6,	%l2,	%i4
	subcc	%g6,	%g4,	%l5
	tl	%icc,	0x4
	movge	%xcc,	%g1,	%l0
	tge	%xcc,	0x6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x68] %asi,	%g7
	tge	%xcc,	0x2
	tpos	%icc,	0x2
	fba,a	%fcc3,	loop_1806
	fbue	%fcc0,	loop_1807
	stw	%o7,	[%l7 + 0x7C]
	tsubcctv	%l3,	%o4,	%o2
loop_1806:
	fbge,a	%fcc2,	loop_1808
loop_1807:
	fnot2	%f12,	%f0
	fors	%f10,	%f12,	%f23
	fmovdge	%xcc,	%f17,	%f7
loop_1808:
	tg	%xcc,	0x1
	nop
	setx	0x6AF4F0FD504C3D8C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	movl	%xcc,	%g5,	%o3
	fmovdgu	%icc,	%f23,	%f29
	smulcc	%i5,	%i3,	%l1
	bgu,pt	%icc,	loop_1809
	fcmpne32	%f8,	%f18,	%o6
	edge32	%l4,	%o0,	%i1
	fmovdcs	%icc,	%f9,	%f25
loop_1809:
	movg	%xcc,	%g2,	%i2
	movne	%icc,	%o5,	%g3
	ldd	[%l7 + 0x70],	%i0
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x44] %asi,	%i7
	movgu	%xcc,	%o1,	%i6
	stbar
	nop
	fitos	%f3,	%f22
	fstox	%f22,	%f6
	be	loop_1810
	movrlez	%l6,	0x0F6,	%l2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x36] %asi,	%i4
loop_1810:
	subcc	%g6,	0x1045,	%l5
	udiv	%g4,	0x1CB4,	%g1
	movge	%icc,	%l0,	%g7
	sdivcc	%o7,	0x1AEE,	%l3
	sethi	0x1A69,	%o2
	movrgz	%o4,	%g5,	%i5
	swap	[%l7 + 0x0C],	%o3
	fnot1	%f14,	%f4
	st	%f31,	[%l7 + 0x14]
	movrne	%i3,	0x250,	%o6
	fcmple32	%f16,	%f18,	%l4
	fands	%f14,	%f4,	%f9
	edge16ln	%l1,	%i1,	%o0
	sll	%g2,	%i2,	%g3
	set	0x6A, %l5
	stha	%i0,	[%l7 + %l5] 0x89
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x78] %asi,	%i7
	edge16ln	%o1,	%i6,	%l6
	sir	0x014A
	xnorcc	%l2,	%i4,	%g6
	addc	%o5,	%l5,	%g4
	fmovrsgez	%l0,	%f4,	%f21
	flush	%l7 + 0x50
	sir	0x072C
	movvs	%icc,	%g7,	%o7
	xor	%l3,	%o2,	%o4
	add	%g5,	0x16B6,	%i5
	fmovdge	%xcc,	%f26,	%f7
	fbl	%fcc1,	loop_1811
	mova	%icc,	%g1,	%o3
	fmovd	%f14,	%f28
	sllx	%i3,	%l4,	%o6
loop_1811:
	movrlz	%l1,	%o0,	%g2
	taddcctv	%i1,	0x1104,	%i2
	fabsd	%f16,	%f20
	fnands	%f3,	%f20,	%f11
	bvs	loop_1812
	smul	%i0,	%g3,	%o1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x60] %asi,	%f15
loop_1812:
	movcc	%icc,	%i7,	%l6
	nop
	fitod	%f10,	%f2
	fdtos	%f2,	%f1
	fmovspos	%xcc,	%f26,	%f24
	umulcc	%l2,	%i6,	%g6
	movrne	%o5,	0x26F,	%l5
	nop
	setx	0xE2EB88820F400D3C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x7454909BFA462EC1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f6,	%f4
	fmovdne	%xcc,	%f7,	%f0
	edge32l	%i4,	%l0,	%g4
	ldsw	[%l7 + 0x3C],	%o7
	fmovdn	%icc,	%f8,	%f14
	brlez	%g7,	loop_1813
	edge8n	%l3,	%o4,	%g5
	tne	%icc,	0x7
	bpos	loop_1814
loop_1813:
	move	%icc,	%o2,	%i5
	sdiv	%o3,	0x1C62,	%g1
	membar	0x66
loop_1814:
	fpmerge	%f15,	%f29,	%f26
	nop
	setx	loop_1815,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	xor	%i3,	%o6,	%l4
	fmul8x16au	%f13,	%f16,	%f26
	movneg	%icc,	%o0,	%l1
loop_1815:
	edge16ln	%i1,	%i2,	%i0
	fmovsgu	%xcc,	%f1,	%f1
	fnot1s	%f16,	%f11
	add	%g2,	%o1,	%g3
	tleu	%xcc,	0x1
	alignaddr	%l6,	%l2,	%i6
	bpos	loop_1816
	movrlz	%i7,	%o5,	%g6
	array8	%i4,	%l5,	%g4
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x18
loop_1816:
	subccc	%l0,	%g7,	%l3
	umulcc	%o7,	0x1F1F,	%g5
	fmovscc	%icc,	%f15,	%f23
	fabss	%f7,	%f28
	st	%f18,	[%l7 + 0x70]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x18],	%f10
	bcs	%xcc,	loop_1817
	addc	%o2,	%o4,	%i5
	edge8l	%o3,	%g1,	%i3
	tleu	%xcc,	0x3
loop_1817:
	membar	0x23
	bneg	loop_1818
	movrne	%l4,	0x2A5,	%o0
	movcc	%icc,	%l1,	%i1
	ldd	[%l7 + 0x28],	%f10
loop_1818:
	st	%f14,	[%l7 + 0x28]
	movvs	%icc,	%i2,	%i0
	nop
	fitod	%f24,	%f28
	movvs	%xcc,	%g2,	%o1
	alignaddr	%g3,	%l6,	%l2
	smul	%o6,	%i7,	%o5
	tcc	%xcc,	0x0
	fpadd16	%f30,	%f8,	%f28
	fcmple32	%f20,	%f18,	%i6
	fnors	%f20,	%f17,	%f31
	addcc	%g6,	%l5,	%g4
	edge8ln	%i4,	%g7,	%l0
	bvs,pn	%xcc,	loop_1819
	brlez	%o7,	loop_1820
	bshuffle	%f16,	%f30,	%f16
	sra	%g5,	%l3,	%o2
loop_1819:
	fbuge,a	%fcc1,	loop_1821
loop_1820:
	fmovrsgez	%o4,	%f12,	%f20
	taddcc	%i5,	%g1,	%i3
	fmovdvc	%xcc,	%f21,	%f10
loop_1821:
	fbuge,a	%fcc3,	loop_1822
	movleu	%icc,	%o3,	%o0
	fpsub32	%f26,	%f26,	%f0
	udiv	%l1,	0x17D5,	%i1
loop_1822:
	prefetch	[%l7 + 0x48],	 0x2
	tgu	%xcc,	0x7
	movrgz	%l4,	0x1E9,	%i0
	set	0x0C, %g2
	ldswa	[%l7 + %g2] 0x89,	%i2
	sethi	0x1377,	%g2
	orcc	%o1,	%l6,	%l2
	fba	%fcc1,	loop_1823
	bvc,a,pt	%icc,	loop_1824
	srax	%o6,	%g3,	%i7
	udivx	%o5,	0x07BE,	%i6
loop_1823:
	array32	%l5,	%g6,	%i4
loop_1824:
	addccc	%g4,	0x0134,	%g7
	fmovdvs	%icc,	%f23,	%f0
	fpadd32s	%f29,	%f31,	%f0
	set	0x28, %l2
	prefetcha	[%l7 + %l2] 0x11,	 0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%xcc,	%f0,	%f30
	fmovdneg	%xcc,	%f18,	%f5
	tge	%icc,	0x5
	mova	%xcc,	%g5,	%l0
	bl,a,pn	%icc,	loop_1825
	tleu	%xcc,	0x1
	movrgez	%l3,	0x2C6,	%o2
	fexpand	%f2,	%f16
loop_1825:
	ba,pt	%xcc,	loop_1826
	sth	%i5,	[%l7 + 0x48]
	nop
	setx	loop_1827,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tg	%icc,	0x6
loop_1826:
	fmovrdgz	%o4,	%f2,	%f10
	edge8l	%i3,	%g1,	%o3
loop_1827:
	movre	%o0,	%l1,	%l4
	fcmpeq32	%f4,	%f12,	%i0
	fbg	%fcc1,	loop_1828
	sdiv	%i2,	0x180F,	%i1
	brnz	%g2,	loop_1829
	movge	%xcc,	%o1,	%l6
loop_1828:
	fbne	%fcc1,	loop_1830
	or	%l2,	0x1840,	%g3
loop_1829:
	brgz,a	%i7,	loop_1831
	edge8n	%o6,	%i6,	%l5
loop_1830:
	taddcctv	%g6,	0x0144,	%o5
	sllx	%i4,	0x12,	%g4
loop_1831:
	fnegd	%f26,	%f18
	srax	%g7,	%g5,	%l0
	sth	%l3,	[%l7 + 0x34]
	sllx	%o7,	0x15,	%o2
	bne,a	%xcc,	loop_1832
	tle	%icc,	0x4
	movrne	%i5,	%o4,	%i3
	fmovse	%xcc,	%f13,	%f9
loop_1832:
	nop
	set	0x08, %o2
	swapa	[%l7 + %o2] 0x80,	%g1
	edge16l	%o0,	%o3,	%l1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x20] %asi,	%f29
	fnot2	%f14,	%f24
	ta	%icc,	0x1
	lduh	[%l7 + 0x18],	%i0
	fbe,a	%fcc2,	loop_1833
	brlez,a	%l4,	loop_1834
	orn	%i2,	0x0EF0,	%i1
	edge16l	%g2,	%l6,	%o1
loop_1833:
	orncc	%g3,	%i7,	%l2
loop_1834:
	movl	%xcc,	%i6,	%o6
	bcs,pt	%xcc,	loop_1835
	tcs	%xcc,	0x6
	srlx	%l5,	%o5,	%i4
	movg	%icc,	%g6,	%g7
loop_1835:
	edge32	%g5,	%g4,	%l0
	movge	%icc,	%l3,	%o2
	bge,pt	%xcc,	loop_1836
	add	%o7,	%i5,	%o4
	addccc	%g1,	%i3,	%o0
	set	0x38, %g1
	lda	[%l7 + %g1] 0x88,	%f24
loop_1836:
	smul	%l1,	0x0158,	%i0
	wr	%g0,	0x2b,	%asi
	stba	%o3,	[%l7 + 0x7D] %asi
	membar	#Sync
	tne	%icc,	0x4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x15] %asi,	%i2
	tcs	%icc,	0x2
	movgu	%xcc,	%l4,	%g2
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x5B] %asi,	%i1
	edge16l	%o1,	%g3,	%i7
	nop
	setx	0x7EDD11B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f31
	nop
	fitos	%f4,	%f13
	fstoi	%f13,	%f20
	mulx	%l6,	0x07F9,	%l2
	nop
	setx	loop_1837,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tgu	%xcc,	0x6
	xnorcc	%i6,	%l5,	%o6
	taddcctv	%i4,	0x1F9F,	%g6
loop_1837:
	fmovsl	%xcc,	%f26,	%f25
	nop
	setx	0x3F83F9AC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f2
	fbug,a	%fcc1,	loop_1838
	edge16l	%g7,	%g5,	%g4
	tle	%xcc,	0x0
	tsubcc	%o5,	%l0,	%o2
loop_1838:
	movne	%icc,	%l3,	%i5
	mulx	%o4,	0x1CD1,	%g1
	mulx	%o7,	0x07C5,	%i3
	movrgez	%o0,	%i0,	%l1
	fmovsleu	%xcc,	%f7,	%f2
	tvc	%xcc,	0x0
	fpadd32s	%f17,	%f28,	%f6
	tcs	%icc,	0x1
	call	loop_1839
	nop
	setx	0x3F89DF15B0531DA4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	addccc	%o3,	0x19C9,	%i2
	fmovrslez	%l4,	%f28,	%f1
loop_1839:
	nop
	fitod	%f8,	%f0
	fdtoi	%f0,	%f5
	fxnors	%f19,	%f11,	%f17
	set	0x70, %i7
	stwa	%g2,	[%l7 + %i7] 0x80
	movl	%icc,	%o1,	%i1
	mulx	%i7,	0x09A2,	%l6
	nop
	setx	0x1C9FC838C053C4F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f0
	tl	%xcc,	0x7
	tcs	%icc,	0x0
	bge,pt	%icc,	loop_1840
	sethi	0x1F24,	%l2
	smulcc	%i6,	0x1063,	%l5
	orcc	%o6,	%g3,	%g6
loop_1840:
	fpadd16s	%f4,	%f29,	%f31
	srax	%g7,	%g5,	%g4
	alignaddrl	%o5,	%l0,	%o2
	edge16ln	%i4,	%l3,	%o4
	movrlz	%i5,	%o7,	%i3
	nop
	setx	0x55EF44FF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0xA9DB3B2C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f25,	%f4
	tleu	%icc,	0x1
	and	%g1,	%o0,	%l1
	ba,pn	%xcc,	loop_1841
	nop
	fitod	%f12,	%f8
	fdtox	%f8,	%f0
	sth	%o3,	[%l7 + 0x2C]
	edge16ln	%i2,	%i0,	%g2
loop_1841:
	tvs	%xcc,	0x4
	subc	%l4,	0x160D,	%i1
	ldstub	[%l7 + 0x3C],	%i7
	fxnors	%f17,	%f6,	%f1
	sth	%l6,	[%l7 + 0x12]
	array32	%l2,	%o1,	%l5
	srax	%i6,	0x0C,	%g3
	tneg	%icc,	0x0
	fpack32	%f18,	%f12,	%f12
	te	%xcc,	0x4
	movrgz	%o6,	0x273,	%g6
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x1C] %asi,	%g7
	set	0x5E, %g7
	stha	%g5,	[%l7 + %g7] 0x11
	fzeros	%f11
	fbule	%fcc3,	loop_1842
	addcc	%g4,	0x1530,	%o5
	umul	%l0,	%o2,	%i4
	ldub	[%l7 + 0x6F],	%o4
loop_1842:
	fpsub16	%f24,	%f6,	%f26
	udivcc	%l3,	0x15D2,	%i5
	movle	%icc,	%i3,	%o7
	edge32l	%o0,	%l1,	%g1
	nop
	fitos	%f7,	%f30
	fstod	%f30,	%f4
	nop
	fitod	%f10,	%f4
	tg	%xcc,	0x7
	edge8l	%i2,	%o3,	%g2
	sub	%i0,	0x1FB5,	%l4
	set	0x0C, %g4
	stwa	%i1,	[%l7 + %g4] 0x15
	fmovse	%xcc,	%f2,	%f28
	nop
	setx	0xD047D00FD065055D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	subccc	%i7,	%l2,	%l6
	ld	[%l7 + 0x30],	%f3
	srax	%o1,	0x0B,	%i6
	udiv	%g3,	0x1286,	%o6
	edge32n	%l5,	%g6,	%g5
	ldstub	[%l7 + 0x45],	%g4
	bl	loop_1843
	brlez	%g7,	loop_1844
	sra	%l0,	0x15,	%o2
	sll	%i4,	%o5,	%o4
loop_1843:
	taddcc	%l3,	%i3,	%o7
loop_1844:
	sdivcc	%o0,	0x18CB,	%l1
	movvs	%xcc,	%g1,	%i2
	sdivcc	%o3,	0x1259,	%g2
	movneg	%xcc,	%i5,	%l4
	xnorcc	%i0,	%i1,	%i7
	tleu	%icc,	0x5
	fbn,a	%fcc2,	loop_1845
	add	%l2,	0x008D,	%o1
	fbo	%fcc2,	loop_1846
	edge8ln	%i6,	%g3,	%o6
loop_1845:
	fcmpgt16	%f26,	%f24,	%l5
	lduw	[%l7 + 0x30],	%g6
loop_1846:
	fcmpeq16	%f16,	%f18,	%l6
	smul	%g5,	0x056A,	%g4
	array8	%g7,	%l0,	%o2
	tne	%xcc,	0x3
	addcc	%o5,	%o4,	%i4
	addccc	%i3,	0x0057,	%l3
	movrgz	%o7,	0x090,	%o0
	bg,a	%xcc,	loop_1847
	fbg	%fcc3,	loop_1848
	addccc	%g1,	%i2,	%o3
	edge8	%g2,	%l1,	%i5
loop_1847:
	faligndata	%f24,	%f30,	%f14
loop_1848:
	sethi	0x0947,	%l4
	sra	%i0,	%i7,	%l2
	xnor	%o1,	0x018A,	%i6
	fnot2s	%f16,	%f1
	fmovsa	%xcc,	%f13,	%f17
	srl	%g3,	%o6,	%l5
	alignaddrl	%g6,	%l6,	%i1
	fsrc2s	%f9,	%f3
	fmovrsgez	%g4,	%f14,	%f19
	subc	%g5,	0x0F64,	%g7
	set	0x68, %i6
	lduwa	[%l7 + %i6] 0x04,	%l0
	subc	%o5,	0x1E55,	%o4
	xor	%o2,	%i4,	%l3
	ta	%icc,	0x4
	popc	%i3,	%o7
	nop
	fitod	%f10,	%f14
	fdtoi	%f14,	%f23
	fmovsge	%icc,	%f21,	%f24
	xorcc	%o0,	0x0117,	%i2
	fmovscs	%icc,	%f6,	%f14
	popc	0x0CDE,	%g1
	tge	%xcc,	0x4
	ta	%xcc,	0x3
	fmovspos	%xcc,	%f11,	%f4
	edge32n	%o3,	%l1,	%i5
	movvs	%xcc,	%g2,	%l4
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x24] %asi,	%f28
	fmovrse	%i7,	%f23,	%f14
	xorcc	%l2,	%o1,	%i6
	fbo,a	%fcc2,	loop_1849
	fpadd32	%f24,	%f24,	%f18
	edge16n	%g3,	%i0,	%l5
	nop
	fitod	%f2,	%f8
loop_1849:
	tg	%icc,	0x4
	fbe	%fcc1,	loop_1850
	bne,pn	%xcc,	loop_1851
	tne	%icc,	0x2
	fandnot1	%f0,	%f18,	%f2
loop_1850:
	fmovd	%f22,	%f0
loop_1851:
	umulcc	%o6,	%l6,	%i1
	taddcc	%g4,	%g5,	%g7
	edge8ln	%l0,	%o5,	%g6
	te	%icc,	0x3
	tvc	%xcc,	0x2
	edge16l	%o2,	%o4,	%i4
	sdiv	%i3,	0x19A1,	%o7
	bne,a	loop_1852
	fxors	%f2,	%f12,	%f6
	and	%l3,	%i2,	%o0
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x1f
	membar	#Sync
loop_1852:
	orcc	%g1,	%o3,	%i5
	tg	%xcc,	0x3
	fmovdneg	%icc,	%f22,	%f14
	srlx	%l1,	0x0B,	%l4
	fbule	%fcc1,	loop_1853
	taddcc	%g2,	%i7,	%o1
	tn	%icc,	0x7
	fpadd32s	%f15,	%f27,	%f26
loop_1853:
	movcs	%xcc,	%i6,	%g3
	nop
	setx	loop_1854,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpne32	%f6,	%f6,	%i0
	movrne	%l5,	%l2,	%o6
	tneg	%xcc,	0x5
loop_1854:
	movl	%xcc,	%l6,	%i1
	nop
	setx	loop_1855,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sethi	0x1F24,	%g5
	fandnot2	%f10,	%f6,	%f2
	srlx	%g7,	%l0,	%o5
loop_1855:
	tpos	%icc,	0x0
	edge8l	%g6,	%o2,	%g4
	taddcctv	%i4,	%i3,	%o7
	edge32n	%l3,	%o4,	%o0
	sll	%g1,	%i2,	%i5
	tn	%icc,	0x1
	mulx	%o3,	%l4,	%g2
	movle	%xcc,	%l1,	%i7
	fnand	%f24,	%f10,	%f4
	srl	%i6,	0x18,	%o1
	edge16l	%g3,	%l5,	%l2
	mova	%icc,	%o6,	%l6
	fbo,a	%fcc2,	loop_1856
	movrne	%i1,	%g5,	%i0
	nop
	setx loop_1857, %l0, %l1
	jmpl %l1, %l0
	movg	%xcc,	%o5,	%g7
loop_1856:
	bneg,a	loop_1858
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f30
	fxtod	%f30,	%f10
loop_1857:
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
	movle	%xcc,	%g6,	%g4
loop_1858:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x48] %asi,	%i4
loop_1859:
	movge	%icc,	%i3,	%o2
	tge	%xcc,	0x6
	add	%o7,	%l3,	%o0
	fmovdn	%xcc,	%f29,	%f15
	andncc	%o4,	%g1,	%i2
	fmovsl	%xcc,	%f28,	%f20
	nop
	setx	0x02A72D9461EDC899,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xE041CBAFDB48AF76,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f16,	%f22
	fxor	%f20,	%f30,	%f22
	ldsb	[%l7 + 0x7B],	%i5
	tgu	%xcc,	0x1
	bvs,pn	%icc,	loop_1860
	fble,a	%fcc0,	loop_1861
	nop
	setx	loop_1862,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%icc,	%l4,	%o3
loop_1860:
	edge16	%l1,	%g2,	%i7
loop_1861:
	nop
	fitod	%f22,	%f14
loop_1862:
	tvc	%icc,	0x7
	set	0x1A, %l0
	lduha	[%l7 + %l0] 0x19,	%o1
	nop
	setx	0x0735B7A3D064AEF4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fmovrsgez	%i6,	%f31,	%f4
	brgez,a	%g3,	loop_1863
	movrlz	%l2,	0x2D5,	%l5
	call	loop_1864
	andcc	%l6,	%o6,	%g5
loop_1863:
	sra	%i0,	%l0,	%i1
	tcc	%xcc,	0x4
loop_1864:
	fnot2s	%f26,	%f8
	mulscc	%o5,	0x0879,	%g6
	ble,a	%icc,	loop_1865
	membar	0x2B
	fcmple32	%f6,	%f26,	%g7
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x08] %asi,	%i4
loop_1865:
	nop
	set	0x08, %o7
	swapa	[%l7 + %o7] 0x81,	%g4
	fblg,a	%fcc3,	loop_1866
	udiv	%i3,	0x1B2C,	%o2
	bneg,a	loop_1867
	fmovrsne	%o7,	%f12,	%f23
loop_1866:
	movvc	%icc,	%l3,	%o4
	bl,a	loop_1868
loop_1867:
	edge8ln	%o0,	%i2,	%i5
	tpos	%icc,	0x4
	xorcc	%g1,	%l4,	%l1
loop_1868:
	smul	%g2,	%i7,	%o3
	fbu	%fcc1,	loop_1869
	nop
	setx	0x720432618E0C5F59,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x27F25E2BC549F9BB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f26,	%f24
	taddcc	%i6,	%o1,	%g3
	set	0x73, %g5
	ldsba	[%l7 + %g5] 0x88,	%l5
loop_1869:
	nop
	set	0x4C, %g6
	stwa	%l2,	[%l7 + %g6] 0xe3
	membar	#Sync
	movneg	%xcc,	%o6,	%g5
	set	0x210, %o3
	ldxa	[%g0 + %o3] 0x52,	%l6
	mova	%xcc,	%l0,	%i0
	fmovdgu	%icc,	%f27,	%f7
	sub	%i1,	0x0F8F,	%o5
	smul	%g6,	0x0480,	%g7
	movvc	%icc,	%i4,	%i3
	fsrc2s	%f21,	%f3
	edge16	%g4,	%o2,	%o7
	fmuld8ulx16	%f24,	%f15,	%f8
	fxnors	%f11,	%f22,	%f28
	wr	%g0,	0x89,	%asi
	stha	%o4,	[%l7 + 0x2A] %asi
	ldd	[%l7 + 0x78],	%f0
	fmovdvs	%xcc,	%f18,	%f29
	orn	%l3,	%o0,	%i5
	ldsw	[%l7 + 0x40],	%i2
	nop
	fitod	%f4,	%f4
	fdtos	%f4,	%f21
	tpos	%xcc,	0x4
	smul	%g1,	%l1,	%g2
	move	%icc,	%l4,	%o3
	nop
	setx	0x847BC1F63073D006,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	set	0x36, %o4
	ldsba	[%l7 + %o4] 0x11,	%i7
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x7D] %asi,	%i6
	and	%o1,	0x0810,	%g3
	nop
	setx	0x3AF919F7107905FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movg	%xcc,	%l5,	%o6
	fxnor	%f8,	%f14,	%f2
	xor	%g5,	%l2,	%l6
	fmul8ulx16	%f22,	%f16,	%f20
	fbuge	%fcc0,	loop_1870
	nop
	fitod	%f0,	%f10
	movleu	%icc,	%l0,	%i0
	mulscc	%o5,	%i1,	%g6
loop_1870:
	fmovrslez	%g7,	%f27,	%f12
	fcmpgt32	%f6,	%f4,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i4,	0x1C8A,	%g4
	bpos	loop_1871
	movrne	%o7,	%o2,	%o4
	nop
	setx	0x38187BCA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0xB38CA2F7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f7,	%f25
	tsubcc	%l3,	%o0,	%i2
loop_1871:
	bg	loop_1872
	nop
	setx	0x0973BC5E5F8D00FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4D59EFB1B22B7579,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f2,	%f22
	tcs	%xcc,	0x5
	tsubcctv	%i5,	0x15F2,	%l1
loop_1872:
	movcs	%xcc,	%g2,	%l4
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o3
	fexpand	%f24,	%f30
	fble	%fcc0,	loop_1873
	movne	%xcc,	%g1,	%i6
	sllx	%o1,	0x1B,	%i7
	bneg	%xcc,	loop_1874
loop_1873:
	fmovs	%f8,	%f17
	movneg	%xcc,	%l5,	%g3
	brnz,a	%o6,	loop_1875
loop_1874:
	ldsh	[%l7 + 0x10],	%g5
	fbuge	%fcc3,	loop_1876
	fbg	%fcc0,	loop_1877
loop_1875:
	pdist	%f28,	%f30,	%f0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1876:
	fbug	%fcc0,	loop_1878
loop_1877:
	tle	%xcc,	0x2
	fmovsneg	%xcc,	%f19,	%f28
	tcc	%xcc,	0x6
loop_1878:
	sll	%l2,	%l6,	%i0
	fmovsleu	%icc,	%f31,	%f26
	udivcc	%o5,	0x1ACC,	%i1
	stb	%l0,	[%l7 + 0x3D]
	movvc	%icc,	%g6,	%i3
	set	0x2E, %i3
	ldsha	[%l7 + %i3] 0x81,	%i4
	fmovdpos	%xcc,	%f17,	%f9
	xorcc	%g4,	0x0AD3,	%o7
	bneg,a	%xcc,	loop_1879
	bvc,a,pt	%xcc,	loop_1880
	taddcc	%o2,	%o4,	%g7
	set	0x0C, %o1
	lduwa	[%l7 + %o1] 0x0c,	%l3
loop_1879:
	fblg,a	%fcc1,	loop_1881
loop_1880:
	move	%icc,	%o0,	%i2
	tcc	%xcc,	0x4
	sth	%l1,	[%l7 + 0x14]
loop_1881:
	fcmpgt16	%f22,	%f26,	%g2
	sllx	%i5,	0x04,	%l4
	srax	%o3,	0x0A,	%i6
	fnot1	%f20,	%f30
	umulcc	%g1,	%i7,	%l5
	fbug,a	%fcc1,	loop_1882
	tsubcc	%o1,	0x178D,	%o6
	movpos	%icc,	%g5,	%g3
	tge	%xcc,	0x3
loop_1882:
	sdiv	%l2,	0x1A21,	%l6
	bge,a	%icc,	loop_1883
	sll	%i0,	%o5,	%i1
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x22] %asi,	%l0
loop_1883:
	fpsub32s	%f30,	%f27,	%f13
	srax	%g6,	%i4,	%i3
	array8	%o7,	%o2,	%g4
	taddcc	%g7,	0x1BC0,	%o4
	srlx	%o0,	0x08,	%i2
	edge32l	%l1,	%g2,	%l3
	fmovscs	%xcc,	%f19,	%f2
	fbge,a	%fcc1,	loop_1884
	be,a,pn	%icc,	loop_1885
	fmovrdgz	%l4,	%f10,	%f28
	nop
	fitod	%f18,	%f14
loop_1884:
	movcs	%icc,	%i5,	%i6
loop_1885:
	udivcc	%o3,	0x1DB9,	%i7
	fbe,a	%fcc2,	loop_1886
	fandnot1s	%f2,	%f27,	%f25
	orncc	%g1,	0x1178,	%l5
	movrlez	%o1,	0x3F1,	%o6
loop_1886:
	te	%icc,	0x6
	sdivcc	%g3,	0x136A,	%l2
	sdivcc	%g5,	0x06C9,	%i0
	st	%f4,	[%l7 + 0x68]
	nop
	fitos	%f3,	%f1
	fstoi	%f1,	%f23
	fbl,a	%fcc1,	loop_1887
	xnor	%o5,	%l6,	%i1
	bcc	%xcc,	loop_1888
	xnor	%g6,	0x0E9E,	%l0
loop_1887:
	bcs,a	%icc,	loop_1889
	fmovd	%f12,	%f4
loop_1888:
	taddcctv	%i4,	0x1EB0,	%o7
	brgez,a	%o2,	loop_1890
loop_1889:
	movg	%xcc,	%g4,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g7,	0x0F37,	%o0
loop_1890:
	movrgz	%i2,	%l1,	%o4
	edge8	%g2,	%l3,	%i5
	fmul8ulx16	%f18,	%f18,	%f8
	udivcc	%i6,	0x0CE7,	%l4
	fbo	%fcc1,	loop_1891
	fmovsg	%icc,	%f10,	%f31
	sth	%o3,	[%l7 + 0x6C]
	movg	%icc,	%g1,	%l5
loop_1891:
	andcc	%o1,	%i7,	%o6
	orn	%g3,	0x0DCA,	%l2
	fmovdcs	%icc,	%f26,	%f7
	edge32n	%g5,	%i0,	%l6
	stbar
	movrne	%o5,	0x0CD,	%i1
	fmovsgu	%icc,	%f12,	%f29
	andn	%l0,	0x06B1,	%i4
	andcc	%g6,	%o2,	%o7
	fmovrdgz	%g4,	%f20,	%f20
	mova	%xcc,	%i3,	%g7
	fmovsn	%icc,	%f2,	%f7
	fbe,a	%fcc2,	loop_1892
	movg	%icc,	%i2,	%l1
	tge	%icc,	0x2
	fmovrse	%o4,	%f14,	%f16
loop_1892:
	nop
	set	0x40, %g3
	sth	%g2,	[%l7 + %g3]
	edge32	%l3,	%o0,	%i5
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%i6
	fxors	%f14,	%f29,	%f0
	fbuge,a	%fcc3,	loop_1893
	sdivcc	%o3,	0x0634,	%l4
	fnands	%f12,	%f29,	%f24
	umul	%g1,	0x0243,	%l5
loop_1893:
	bpos,a	%xcc,	loop_1894
	movge	%icc,	%o1,	%i7
	tsubcc	%o6,	0x0721,	%l2
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x28] %asi,	%f16
loop_1894:
	nop
	set	0x28, %l3
	swapa	[%l7 + %l3] 0x19,	%g5
	ldd	[%l7 + 0x40],	%f30
	fmul8sux16	%f10,	%f4,	%f26
	movpos	%icc,	%i0,	%g3
	bcs	%icc,	loop_1895
	fbe	%fcc0,	loop_1896
	array8	%o5,	%i1,	%l0
	fcmpne32	%f16,	%f6,	%l6
loop_1895:
	tne	%icc,	0x0
loop_1896:
	alignaddr	%i4,	%g6,	%o2
	array16	%o7,	%i3,	%g7
	brz	%g4,	loop_1897
	ta	%xcc,	0x4
	xor	%l1,	%i2,	%o4
	mova	%xcc,	%g2,	%o0
loop_1897:
	fmovrdlez	%i5,	%f10,	%f2
	sdiv	%i6,	0x17A2,	%l3
	fpadd16	%f12,	%f2,	%f12
	udivcc	%o3,	0x18EA,	%g1
	fmovdcc	%xcc,	%f25,	%f25
	bcs	%xcc,	loop_1898
	movrne	%l4,	0x1C9,	%o1
	membar	0x34
	stw	%i7,	[%l7 + 0x4C]
loop_1898:
	call	loop_1899
	brlz,a	%l5,	loop_1900
	edge32n	%o6,	%g5,	%i0
	set	0x40, %o0
	stha	%g3,	[%l7 + %o0] 0x81
loop_1899:
	edge32n	%l2,	%i1,	%l0
loop_1900:
	umulcc	%l6,	%o5,	%i4
	fmovdle	%icc,	%f9,	%f10
	tvs	%xcc,	0x2
	sll	%g6,	%o7,	%i3
	fbg,a	%fcc2,	loop_1901
	nop
	setx	0x4FD15D75,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC14DA825,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f17,	%f31
	nop
	fitos	%f1,	%f25
	fstod	%f25,	%f26
	call	loop_1902
loop_1901:
	orncc	%g7,	%o2,	%l1
	movrgz	%i2,	0x16F,	%g4
	subc	%o4,	0x0797,	%o0
loop_1902:
	ble,a	loop_1903
	udiv	%g2,	0x008E,	%i6
	movvc	%icc,	%i5,	%o3
	movrlez	%g1,	%l3,	%o1
loop_1903:
	srl	%l4,	0x0C,	%i7
	andn	%o6,	%g5,	%i0
	movge	%icc,	%l5,	%l2
	tn	%xcc,	0x1
	tcs	%icc,	0x4
	addcc	%g3,	%l0,	%i1
	nop
	set	0x60, %i1
	std	%f4,	[%l7 + %i1]
	movrgz	%l6,	0x0D5,	%o5
	andncc	%g6,	%i4,	%i3
	bn,pt	%icc,	loop_1904
	brlez,a	%g7,	loop_1905
	movg	%xcc,	%o2,	%o7
	fmovdvc	%icc,	%f11,	%f17
loop_1904:
	fmovsneg	%xcc,	%f24,	%f22
loop_1905:
	andcc	%l1,	0x092B,	%i2
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x15
	set	0x25, %i5
	ldsba	[%l7 + %i5] 0x15,	%g4
	brlz,a	%o4,	loop_1906
	srax	%o0,	%g2,	%i6
	fmovsvc	%icc,	%f25,	%f13
	andn	%i5,	%o3,	%l3
loop_1906:
	fmovsle	%xcc,	%f11,	%f20
	srax	%g1,	%l4,	%i7
	fmovda	%icc,	%f21,	%f10
	xor	%o1,	%g5,	%i0
	umulcc	%l5,	%l2,	%g3
	movne	%icc,	%o6,	%i1
	subccc	%l0,	0x0225,	%l6
	sllx	%g6,	%o5,	%i3
	brlez,a	%i4,	loop_1907
	xnorcc	%o2,	0x0E70,	%g7
	edge32	%o7,	%l1,	%g4
	udiv	%i2,	0x05FD,	%o4
loop_1907:
	mova	%icc,	%o0,	%g2
	bgu,a	loop_1908
	array32	%i5,	%i6,	%o3
	add	%l3,	%g1,	%i7
	orcc	%l4,	%o1,	%i0
loop_1908:
	fnot2s	%f17,	%f23
	or	%l5,	0x0C5B,	%g5
	andcc	%g3,	%l2,	%i1
	tcc	%xcc,	0x1
	umulcc	%l0,	%o6,	%l6
	xnorcc	%o5,	%g6,	%i3
	wr	%g0,	0x19,	%asi
	sta	%f14,	[%l7 + 0x20] %asi
	brlz	%o2,	loop_1909
	move	%xcc,	%g7,	%o7
	wr	%g0,	0xe3,	%asi
	stha	%l1,	[%l7 + 0x22] %asi
	membar	#Sync
loop_1909:
	smulcc	%g4,	%i4,	%i2
	xor	%o4,	%g2,	%i5
	sdivcc	%o0,	0x055C,	%o3
	fornot2	%f22,	%f26,	%f0
	mova	%xcc,	%i6,	%l3
	xor	%i7,	0x0FE5,	%l4
	addccc	%g1,	0x04CD,	%i0
	fmovspos	%icc,	%f10,	%f22
	nop
	setx	0x5B15E5AE88B6C7FE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x351D6884DE915F2C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f24,	%f16
	fexpand	%f18,	%f2
	bl,a,pn	%xcc,	loop_1910
	taddcctv	%l5,	%o1,	%g5
	subcc	%g3,	%i1,	%l0
	bshuffle	%f8,	%f24,	%f30
loop_1910:
	tle	%xcc,	0x3
	fbul,a	%fcc2,	loop_1911
	addcc	%o6,	0x15E5,	%l6
	fbuge	%fcc0,	loop_1912
	tpos	%icc,	0x4
loop_1911:
	fmovsneg	%icc,	%f6,	%f3
	movcs	%xcc,	%o5,	%g6
loop_1912:
	fmuld8sux16	%f23,	%f10,	%f0
	fbuge,a	%fcc1,	loop_1913
	brgz	%l2,	loop_1914
	bcs,a,pn	%icc,	loop_1915
	fxor	%f8,	%f4,	%f24
loop_1913:
	membar	0x03
loop_1914:
	udivx	%o2,	0x15D9,	%i3
loop_1915:
	mulx	%g7,	%o7,	%g4
	andn	%l1,	%i4,	%o4
	set	0x27, %l4
	ldstuba	[%l7 + %l4] 0x89,	%i2
	fbuge	%fcc2,	loop_1916
	fbg,a	%fcc1,	loop_1917
	ldsh	[%l7 + 0x0C],	%i5
	edge8ln	%g2,	%o0,	%i6
loop_1916:
	bn	%xcc,	loop_1918
loop_1917:
	movleu	%icc,	%l3,	%o3
	stb	%l4,	[%l7 + 0x34]
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f20
	fxtod	%f20,	%f28
loop_1918:
	edge32ln	%g1,	%i0,	%i7
	fmovspos	%xcc,	%f23,	%f7
	subccc	%l5,	%g5,	%o1
	te	%icc,	0x1
	udivx	%g3,	0x11DB,	%i1
	fcmple32	%f0,	%f30,	%o6
	fornot1	%f16,	%f0,	%f12
	movge	%xcc,	%l0,	%l6
	fone	%f28
	fbue	%fcc0,	loop_1919
	tn	%icc,	0x4
	nop
	fitod	%f16,	%f6
	edge16ln	%o5,	%g6,	%l2
loop_1919:
	fbge	%fcc1,	loop_1920
	fxnor	%f10,	%f28,	%f20
	ldstub	[%l7 + 0x60],	%o2
	edge16n	%g7,	%i3,	%o7
loop_1920:
	brgez	%g4,	loop_1921
	sdiv	%i4,	0x102E,	%l1
	addcc	%i2,	0x0678,	%o4
	movg	%icc,	%i5,	%o0
loop_1921:
	fcmpne32	%f14,	%f2,	%g2
	umul	%l3,	%i6,	%l4
	tg	%icc,	0x5
	wr	%g0,	0xea,	%asi
	stba	%o3,	[%l7 + 0x7D] %asi
	membar	#Sync
	fba,a	%fcc0,	loop_1922
	orcc	%i0,	%g1,	%l5
	array8	%i7,	%o1,	%g5
	fmovdcs	%xcc,	%f10,	%f18
loop_1922:
	or	%g3,	%o6,	%l0
	fexpand	%f17,	%f10
	fmovdle	%xcc,	%f9,	%f19
	umulcc	%l6,	%i1,	%o5
	movrlz	%g6,	%o2,	%l2
	edge32l	%g7,	%i3,	%o7
	fblg	%fcc2,	loop_1923
	tl	%xcc,	0x5
	edge16ln	%g4,	%i4,	%l1
	move	%xcc,	%i2,	%o4
loop_1923:
	edge16l	%o0,	%g2,	%l3
	stx	%i6,	[%l7 + 0x60]
	tne	%xcc,	0x1
	nop
	setx	0x32CFCE142FED5212,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x7E40F2A0405B95DE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f20,	%f26
	mulx	%i5,	%o3,	%l4
	brz	%i0,	loop_1924
	movgu	%xcc,	%g1,	%l5
	movpos	%xcc,	%o1,	%g5
	fpadd16	%f30,	%f24,	%f10
loop_1924:
	tpos	%xcc,	0x3
	fmovsa	%xcc,	%f3,	%f12
	array8	%g3,	%o6,	%l0
	movn	%xcc,	%l6,	%i1
	srl	%o5,	%i7,	%g6
	edge32l	%l2,	%g7,	%o2
	fmovda	%icc,	%f9,	%f30
	fsrc2s	%f19,	%f13
	orcc	%o7,	0x13CF,	%i3
	mulx	%i4,	%g4,	%l1
	brz	%o4,	loop_1925
	movleu	%xcc,	%i2,	%o0
	fmul8x16al	%f27,	%f13,	%f26
	xnorcc	%g2,	0x0582,	%i6
loop_1925:
	subc	%i5,	%o3,	%l3
	ldd	[%l7 + 0x30],	%f2
	fmovsge	%icc,	%f13,	%f16
	mulscc	%i0,	%g1,	%l5
	sethi	0x0927,	%o1
	fornot1s	%f18,	%f0,	%f21
	fmovsn	%xcc,	%f14,	%f21
	movvs	%icc,	%l4,	%g5
	bpos,a,pt	%icc,	loop_1926
	nop
	setx	0x954483D0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xDADF490B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f27,	%f7
	edge16	%g3,	%o6,	%l6
	subccc	%i1,	0x1F55,	%o5
loop_1926:
	movrlez	%i7,	%g6,	%l2
	set	0x54, %i2
	stba	%g7,	[%l7 + %i2] 0x88
	nop
	fitod	%f2,	%f4
	fdtox	%f4,	%f22
	fandnot2s	%f18,	%f23,	%f8
	nop
	setx loop_1927, %l0, %l1
	jmpl %l1, %o2
	tleu	%icc,	0x1
	movge	%icc,	%o7,	%i3
	nop
	setx	0x3C423F439F8EADA6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0x992748D948C6CB1A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f16,	%f22
loop_1927:
	nop
	setx loop_1928, %l0, %l1
	jmpl %l1, %l0
	fnot1s	%f23,	%f29
	ldx	[%l7 + 0x58],	%g4
	fmovsa	%icc,	%f23,	%f27
loop_1928:
	tgu	%xcc,	0x0
	movpos	%xcc,	%i4,	%l1
	fbe	%fcc2,	loop_1929
	movleu	%icc,	%o4,	%o0
	movge	%xcc,	%i2,	%i6
	movpos	%xcc,	%i5,	%o3
loop_1929:
	fmovsn	%xcc,	%f23,	%f15
	brnz,a	%l3,	loop_1930
	udivcc	%i0,	0x16C3,	%g2
	ble,pt	%icc,	loop_1931
	movleu	%icc,	%l5,	%g1
loop_1930:
	fmovdneg	%icc,	%f11,	%f13
	bcc,pn	%xcc,	loop_1932
loop_1931:
	nop
	setx	0x31AE27DA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x07F9FDA2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fdivs	%f13,	%f0,	%f22
	xnorcc	%l4,	0x1D98,	%o1
	sir	0x0B15
loop_1932:
	xnor	%g3,	%o6,	%l6
	nop
	setx	0xA0CC7C69D1A53009,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f4
	tl	%xcc,	0x5
	fmovdneg	%icc,	%f14,	%f13
	sra	%i1,	%o5,	%g5
	fmovsne	%xcc,	%f21,	%f9
	movgu	%xcc,	%g6,	%l2
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x65] %asi,	%g7
	nop
	setx	0x850A474D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x51A91278,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f30,	%f11
	fbg	%fcc3,	loop_1933
	fmovrdlez	%o2,	%f2,	%f24
	movvc	%xcc,	%i7,	%o7
	fmovde	%xcc,	%f30,	%f4
loop_1933:
	and	%i3,	0x157F,	%g4
	nop
	setx	0x7B384717,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x0F545035,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f7,	%f31
	nop
	fitod	%f10,	%f24
	fdtoi	%f24,	%f19
	nop
	setx	0xE5BFCB5AB2FEE4A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x3BA11FB460D11BCC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f8,	%f24
	addccc	%i4,	%l1,	%l0
	nop
	setx	0x6F71891BF9B5B01F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xE767FE6784E6795A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f4,	%f18
	fbul,a	%fcc0,	loop_1934
	fbul	%fcc1,	loop_1935
	fone	%f10
	nop
	fitos	%f1,	%f6
	fstox	%f6,	%f2
loop_1934:
	tsubcc	%o0,	%i2,	%o4
loop_1935:
	movpos	%icc,	%i5,	%i6
	ldsw	[%l7 + 0x6C],	%l3
	movcc	%xcc,	%o3,	%i0
	fbule	%fcc3,	loop_1936
	fblg	%fcc0,	loop_1937
	sll	%l5,	0x0B,	%g1
	fmovsa	%xcc,	%f11,	%f4
loop_1936:
	udivcc	%g2,	0x07AA,	%l4
loop_1937:
	ldstub	[%l7 + 0x3F],	%o1
	ba	loop_1938
	movleu	%xcc,	%g3,	%l6
	addc	%i1,	0x1021,	%o5
	subc	%g5,	%g6,	%l2
loop_1938:
	edge8n	%g7,	%o2,	%o6
	tle	%xcc,	0x7
	fmovrdgez	%o7,	%f30,	%f22
	bl,a,pt	%icc,	loop_1939
	fpsub16s	%f18,	%f1,	%f11
	fandnot1s	%f5,	%f2,	%f24
	or	%i3,	0x0B1E,	%i7
loop_1939:
	fmovdl	%icc,	%f26,	%f25
	tsubcc	%g4,	%i4,	%l0
	edge16ln	%o0,	%l1,	%i2
	fone	%f30
	brlz	%i5,	loop_1940
	srl	%i6,	0x0A,	%l3
	move	%icc,	%o4,	%i0
	sll	%o3,	%l5,	%g1
loop_1940:
	movl	%icc,	%g2,	%l4
	umul	%g3,	0x1C45,	%o1
	fsrc1	%f10,	%f26
	fpadd32	%f6,	%f6,	%f10
	addccc	%i1,	0x173A,	%o5
	fmovsl	%icc,	%f9,	%f17
	alignaddr	%l6,	%g6,	%l2
	tne	%icc,	0x2
	tsubcctv	%g5,	0x0F11,	%o2
	nop
	fitos	%f4,	%f24
	fstoi	%f24,	%f26
	subcc	%o6,	%g7,	%o7
	movn	%xcc,	%i7,	%i3
	movleu	%xcc,	%g4,	%i4
	orcc	%l0,	0x0443,	%l1
	sdiv	%i2,	0x08C3,	%i5
	fbge,a	%fcc2,	loop_1941
	array16	%o0,	%l3,	%i6
	udivx	%o4,	0x0CE7,	%i0
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x4C] %asi,	%o3
loop_1941:
	mova	%xcc,	%g1,	%l5
	edge16l	%g2,	%g3,	%o1
	be,pt	%xcc,	loop_1942
	ldd	[%l7 + 0x70],	%l4
	movge	%xcc,	%i1,	%l6
	edge8	%g6,	%o5,	%g5
loop_1942:
	tge	%icc,	0x5
	fmovrdgz	%o2,	%f22,	%f18
	fpsub32	%f10,	%f2,	%f0
	tl	%xcc,	0x3
	pdist	%f24,	%f10,	%f2
	movge	%xcc,	%o6,	%g7
	movcc	%xcc,	%o7,	%i7
	ba,a	%icc,	loop_1943
	umul	%i3,	0x0E45,	%l2
	tsubcc	%g4,	0x0F5E,	%i4
	ldsh	[%l7 + 0x1A],	%l1
loop_1943:
	mova	%icc,	%l0,	%i2
	sethi	0x05F1,	%i5
	set	0x3B, %o5
	stba	%l3,	[%l7 + %o5] 0x2b
	membar	#Sync
	move	%icc,	%i6,	%o4
	sdivcc	%i0,	0x0200,	%o0
	tneg	%xcc,	0x4
	fexpand	%f11,	%f14
	fpackfix	%f4,	%f7
	tg	%xcc,	0x3
	fpadd32	%f4,	%f18,	%f28
	fnegs	%f23,	%f16
	fblg,a	%fcc2,	loop_1944
	fba,a	%fcc1,	loop_1945
	xnor	%g1,	%o3,	%l5
	array8	%g3,	%g2,	%l4
loop_1944:
	mulscc	%o1,	%i1,	%g6
loop_1945:
	bge,pn	%icc,	loop_1946
	bpos,a,pt	%icc,	loop_1947
	fmovs	%f19,	%f24
	bgu	%icc,	loop_1948
loop_1946:
	orncc	%o5,	%g5,	%l6
loop_1947:
	xnor	%o2,	0x12DC,	%o6
	tle	%icc,	0x5
loop_1948:
	ldsh	[%l7 + 0x6C],	%o7
	fmuld8ulx16	%f13,	%f6,	%f10
	ldx	[%l7 + 0x38],	%g7
	wr	%g0,	0x27,	%asi
	stha	%i3,	[%l7 + 0x76] %asi
	membar	#Sync
	fabss	%f23,	%f15
	faligndata	%f16,	%f0,	%f26
	fmovsvs	%xcc,	%f19,	%f23
	set	0x30, %l1
	ldxa	[%g0 + %l1] 0x4f,	%i7
	edge8ln	%l2,	%i4,	%l1
	subcc	%g4,	0x0B68,	%i2
	edge32l	%i5,	%l3,	%l0
	fbug	%fcc2,	loop_1949
	edge8	%i6,	%o4,	%o0
	tl	%icc,	0x5
	sdivx	%i0,	0x025D,	%o3
loop_1949:
	edge16n	%l5,	%g3,	%g2
	fbo	%fcc2,	loop_1950
	membar	0x45
	srax	%g1,	%l4,	%i1
	movrgez	%g6,	0x197,	%o1
loop_1950:
	fpsub32s	%f9,	%f31,	%f13
	fmovsneg	%icc,	%f10,	%f11
	fpsub16s	%f29,	%f13,	%f27
	xor	%g5,	%l6,	%o5
	sdivx	%o6,	0x1E96,	%o2
	set	0x5E, %i0
	ldsba	[%l7 + %i0] 0x04,	%o7
	fmovrde	%g7,	%f0,	%f24
	smul	%i3,	0x1F85,	%l2
	smul	%i4,	0x1336,	%l1
	sll	%i7,	0x12,	%g4
	xnorcc	%i5,	0x03DD,	%l3
	sub	%i2,	0x1B25,	%l0
	brlz,a	%o4,	loop_1951
	addc	%i6,	%i0,	%o3
	srax	%l5,	0x06,	%g3
	or	%o0,	0x04BB,	%g1
loop_1951:
	tvc	%icc,	0x0
	brlez,a	%l4,	loop_1952
	fandnot2s	%f26,	%f11,	%f31
	fxors	%f24,	%f0,	%f7
	nop
	setx	loop_1953,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1952:
	andcc	%g2,	0x058A,	%i1
	udiv	%o1,	0x1C39,	%g5
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%i6
loop_1953:
	umulcc	%o5,	0x071A,	%g6
	fbul,a	%fcc1,	loop_1954
	ldsh	[%l7 + 0x6A],	%o6
	for	%f2,	%f24,	%f0
	fmul8x16al	%f18,	%f24,	%f2
loop_1954:
	edge32n	%o7,	%g7,	%o2
	fsrc2s	%f11,	%f23
	te	%xcc,	0x0
	nop
	fitos	%f0,	%f21
	fstod	%f21,	%f26
	fbl,a	%fcc3,	loop_1955
	sdiv	%i3,	0x043D,	%l2
	bcc,a	loop_1956
	xnor	%i4,	%l1,	%i7
loop_1955:
	fmovrdne	%i5,	%f24,	%f30
	fmovscs	%icc,	%f4,	%f20
loop_1956:
	popc	%l3,	%i2
	edge8n	%g4,	%o4,	%l0
	fxnor	%f14,	%f6,	%f0
	movpos	%xcc,	%i6,	%i0
	nop
	fitos	%f28,	%f26
	st	%f9,	[%l7 + 0x64]
	movpos	%xcc,	%l5,	%g3
	fmovsneg	%xcc,	%f9,	%f18
	fmovscc	%icc,	%f2,	%f14
	fmul8x16	%f31,	%f16,	%f18
	call	loop_1957
	fnegd	%f2,	%f20
	array8	%o0,	%o3,	%g1
	fbn	%fcc0,	loop_1958
loop_1957:
	movre	%l4,	%g2,	%o1
	edge16l	%i1,	%l6,	%o5
	fmovrdgz	%g6,	%f8,	%f4
loop_1958:
	xnor	%o6,	0x1D04,	%o7
	taddcctv	%g5,	%g7,	%o2
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f20
	brgz	%i3,	loop_1959
	tge	%icc,	0x4
	movcc	%xcc,	%l2,	%l1
	fcmpne16	%f12,	%f28,	%i4
loop_1959:
	ldsw	[%l7 + 0x20],	%i7
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x40] %asi,	%f11
	edge8l	%i5,	%l3,	%i2
	udivx	%o4,	0x1155,	%l0
	tsubcctv	%g4,	0x1430,	%i6
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x54] %asi,	%i0
	wr	%g0,	0x2b,	%asi
	stxa	%g3,	[%l7 + 0x38] %asi
	membar	#Sync
	tgu	%icc,	0x2
	nop
	set	0x36, %l2
	lduh	[%l7 + %l2],	%o0
	edge8ln	%l5,	%o3,	%l4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%g1
	fornot1	%f0,	%f8,	%f26
	mova	%xcc,	%g2,	%i1
	fxnor	%f30,	%f26,	%f2
	nop
	setx	0x51639DA4B068C3BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fxors	%f30,	%f3,	%f7
	movcc	%icc,	%l6,	%o5
	fmovsne	%xcc,	%f8,	%f6
	edge32l	%g6,	%o1,	%o7
	fmovd	%f16,	%f14
	udiv	%g5,	0x0A42,	%g7
	fbo	%fcc3,	loop_1960
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o6,	%i3,	%l2
	tvc	%icc,	0x4
loop_1960:
	tg	%xcc,	0x4
	fmovrslez	%l1,	%f30,	%f2
	ldsh	[%l7 + 0x30],	%i4
	fmovsl	%icc,	%f14,	%f28
	fmovs	%f25,	%f11
	set	0x5E, %o2
	lduba	[%l7 + %o2] 0x14,	%i7
	move	%icc,	%i5,	%l3
	subc	%i2,	0x0487,	%o4
	movneg	%xcc,	%o2,	%l0
	orn	%i6,	0x07F7,	%i0
	edge32	%g3,	%o0,	%l5
	edge8n	%g4,	%o3,	%g1
	tleu	%xcc,	0x2
	fmovsn	%icc,	%f29,	%f11
	and	%g2,	%l4,	%i1
	fandnot2s	%f0,	%f16,	%f21
	bvs,a,pn	%xcc,	loop_1961
	sir	0x06E5
	addcc	%o5,	0x0723,	%g6
	bg	loop_1962
loop_1961:
	fbne	%fcc2,	loop_1963
	movrlez	%o1,	0x205,	%o7
	lduh	[%l7 + 0x54],	%l6
loop_1962:
	edge32l	%g5,	%o6,	%g7
loop_1963:
	fmuld8sux16	%f26,	%f6,	%f10
	movcc	%xcc,	%i3,	%l1
	fmovdl	%icc,	%f20,	%f23
	fbu	%fcc0,	loop_1964
	movre	%i4,	%l2,	%i7
	udiv	%l3,	0x044A,	%i2
	addccc	%i5,	0x0137,	%o2
loop_1964:
	movrlez	%l0,	%o4,	%i6
	fones	%f4
	nop
	setx	loop_1965,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stb	%g3,	[%l7 + 0x34]
	bcc,a,pt	%xcc,	loop_1966
	tpos	%xcc,	0x5
loop_1965:
	movn	%icc,	%i0,	%o0
	mulscc	%l5,	%g4,	%g1
loop_1966:
	membar	0x74
	nop
	setx	0x6F151E1E535C6A5D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x8572C16A79B25310,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f0,	%f14
	movvc	%icc,	%g2,	%l4
	movg	%icc,	%o3,	%o5
	fmovdne	%icc,	%f24,	%f19
	fble	%fcc1,	loop_1967
	nop
	setx	0x6E17B7CB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x6F31A79C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f22,	%f24
	wr	%g0,	0x19,	%asi
	lda	[%l7 + 0x2C] %asi,	%f11
loop_1967:
	fpadd16	%f30,	%f10,	%f22
	fbg	%fcc0,	loop_1968
	mulx	%g6,	0x04EB,	%i1
	smulcc	%o7,	%o1,	%g5
	fble,a	%fcc1,	loop_1969
loop_1968:
	sir	0x1D8D
	ta	%xcc,	0x6
	movrlez	%l6,	%o6,	%i3
loop_1969:
	edge32n	%g7,	%i4,	%l1
	sethi	0x1FA9,	%i7
	fmul8x16al	%f17,	%f21,	%f16
	fmovrsgez	%l3,	%f31,	%f27
	sllx	%i2,	0x1E,	%i5
	tvc	%icc,	0x7
	ld	[%l7 + 0x38],	%f28
	fornot2	%f12,	%f10,	%f8
	nop
	setx loop_1970, %l0, %l1
	jmpl %l1, %l2
	ldd	[%l7 + 0x50],	%f30
	movvs	%xcc,	%l0,	%o2
	addc	%o4,	%g3,	%i0
loop_1970:
	edge8n	%i6,	%o0,	%l5
	st	%f31,	[%l7 + 0x60]
	edge32	%g1,	%g4,	%g2
	andncc	%l4,	%o3,	%o5
	sll	%g6,	0x1D,	%i1
	udivcc	%o1,	0x122E,	%o7
	movle	%icc,	%l6,	%g5
	fbo,a	%fcc2,	loop_1971
	tsubcc	%i3,	0x029B,	%g7
	fbl	%fcc1,	loop_1972
	tle	%icc,	0x5
loop_1971:
	popc	0x1A22,	%o6
	tsubcc	%l1,	0x1B89,	%i7
loop_1972:
	bl,a	%xcc,	loop_1973
	fzero	%f28
	movcs	%icc,	%l3,	%i2
	fcmple16	%f4,	%f12,	%i5
loop_1973:
	edge32n	%l2,	%l0,	%o2
	fpsub32s	%f18,	%f19,	%f13
	bcc,pn	%icc,	loop_1974
	bleu	%icc,	loop_1975
	taddcc	%i4,	%g3,	%i0
	fabsd	%f30,	%f2
loop_1974:
	ba,pt	%xcc,	loop_1976
loop_1975:
	ldd	[%l7 + 0x20],	%o4
	udivcc	%i6,	0x1796,	%l5
	edge32ln	%g1,	%g4,	%o0
loop_1976:
	array32	%l4,	%g2,	%o5
	taddcc	%g6,	%o3,	%o1
	set	0x0, %g2
	stxa	%i1,	[%g0 + %g2] 0x5f
	bleu	loop_1977
	tsubcctv	%l6,	%o7,	%g5
	orncc	%i3,	%g7,	%l1
	array8	%o6,	%i7,	%i2
loop_1977:
	xnorcc	%l3,	%i5,	%l2
	movg	%xcc,	%o2,	%i4
	and	%l0,	%i0,	%o4
	srlx	%g3,	0x1B,	%i6
	sir	0x0E11
	sth	%l5,	[%l7 + 0x34]
	sdiv	%g1,	0x198B,	%o0
	sdivx	%g4,	0x0C2E,	%g2
	edge32ln	%o5,	%g6,	%l4
	array16	%o3,	%o1,	%l6
	movg	%icc,	%i1,	%g5
	alignaddr	%i3,	%g7,	%o7
	edge16n	%l1,	%i7,	%o6
	fmovdl	%icc,	%f9,	%f3
	add	%l3,	%i5,	%l2
	ldd	[%l7 + 0x50],	%o2
	xnor	%i2,	%i4,	%l0
	tcc	%icc,	0x7
	tgu	%xcc,	0x7
	fcmple32	%f0,	%f16,	%i0
	fmovdvc	%xcc,	%f30,	%f0
	xorcc	%o4,	%i6,	%l5
	fabsd	%f8,	%f20
	bleu,a,pt	%icc,	loop_1978
	edge8	%g3,	%g1,	%g4
	fnor	%f26,	%f18,	%f12
	popc	0x067E,	%o0
loop_1978:
	subcc	%g2,	%o5,	%g6
	lduh	[%l7 + 0x1A],	%l4
	smulcc	%o3,	0x1657,	%o1
	tcs	%icc,	0x4
	ta	%xcc,	0x5
	sdiv	%i1,	0x1373,	%g5
	taddcc	%l6,	0x0D75,	%g7
	or	%o7,	%i3,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l1,	0x19F9,	%o6
	fmovsa	%icc,	%f28,	%f11
	fble	%fcc0,	loop_1979
	srl	%i5,	%l2,	%l3
	edge16l	%o2,	%i2,	%l0
	sethi	0x1C1C,	%i4
loop_1979:
	fmul8x16	%f2,	%f12,	%f18
	tsubcc	%o4,	%i0,	%i6
	swap	[%l7 + 0x18],	%l5
	movrgz	%g3,	%g4,	%g1
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x2C] %asi,	%g2
	srlx	%o5,	0x17,	%g6
	edge16	%o0,	%o3,	%o1
	fpsub32	%f18,	%f14,	%f18
	fbl,a	%fcc1,	loop_1980
	array16	%l4,	%g5,	%i1
	membar	0x06
	move	%icc,	%g7,	%l6
loop_1980:
	movge	%xcc,	%o7,	%i7
	sra	%i3,	0x17,	%l1
	tneg	%xcc,	0x2
	fsrc1	%f24,	%f12
	nop
	fitos	%f1,	%f22
	fstox	%f22,	%f18
	fxnor	%f4,	%f28,	%f8
	fandnot2	%f2,	%f10,	%f6
	mulscc	%o6,	0x174E,	%i5
	movrne	%l3,	0x26F,	%o2
	fbg,a	%fcc3,	loop_1981
	bg,a,pn	%xcc,	loop_1982
	movcs	%icc,	%l2,	%l0
	addccc	%i4,	%o4,	%i0
loop_1981:
	subccc	%i6,	%l5,	%g3
loop_1982:
	movleu	%xcc,	%g4,	%i2
	popc	%g1,	%o5
	srlx	%g2,	0x05,	%o0
	ldsh	[%l7 + 0x52],	%o3
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x4A] %asi,	%g6
	edge8ln	%o1,	%g5,	%l4
	nop
	setx loop_1983, %l0, %l1
	jmpl %l1, %i1
	move	%xcc,	%g7,	%o7
	fblg,a	%fcc1,	loop_1984
	tn	%xcc,	0x6
loop_1983:
	nop
	setx	0xB3766CAF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xB4FE257E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fdivs	%f26,	%f27,	%f21
	sdivcc	%i7,	0x0A17,	%l6
loop_1984:
	fand	%f4,	%f24,	%f4
	brgez,a	%l1,	loop_1985
	fnors	%f9,	%f10,	%f22
	edge8l	%o6,	%i3,	%l3
	bcc,pt	%icc,	loop_1986
loop_1985:
	fmovdleu	%icc,	%f27,	%f30
	alignaddr	%o2,	%i5,	%l0
	wr	%g0,	0x10,	%asi
	stba	%l2,	[%l7 + 0x7C] %asi
loop_1986:
	fmovdl	%xcc,	%f22,	%f30
	fblg	%fcc0,	loop_1987
	or	%o4,	%i0,	%i6
	movrlez	%l5,	0x0DA,	%i4
	umul	%g4,	%i2,	%g1
loop_1987:
	tn	%icc,	0x3
	mulscc	%o5,	%g2,	%g3
	taddcc	%o0,	0x066E,	%o3
	fexpand	%f7,	%f4
	flush	%l7 + 0x4C
	addcc	%g6,	%g5,	%o1
	nop
	set	0x20, %i7
	lduw	[%l7 + %i7],	%l4
	orn	%g7,	0x16AC,	%o7
	set	0x7E, %g1
	ldstuba	[%l7 + %g1] 0x89,	%i1
	fmovsgu	%icc,	%f8,	%f17
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x3
	fmovsge	%icc,	%f1,	%f22
	fornot1s	%f16,	%f1,	%f2
	movneg	%icc,	%l6,	%l1
	fmovrdlez	%i3,	%f10,	%f18
	brnz	%l3,	loop_1988
	fmul8x16au	%f20,	%f26,	%f12
	fpmerge	%f21,	%f14,	%f20
	sub	%o2,	%i5,	%o6
loop_1988:
	or	%l2,	0x01A5,	%o4
	fmovsge	%xcc,	%f11,	%f19
	std	%f28,	[%l7 + 0x48]
	fmul8x16	%f2,	%f10,	%f22
	array16	%i0,	%i6,	%l5
	srlx	%i4,	0x16,	%l0
	movn	%icc,	%g4,	%g1
	orn	%i2,	%g2,	%g3
	brlz,a	%o0,	loop_1989
	nop
	setx	0xFEDD179DFCEE68E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x4ACEA5011E1E3299,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f20,	%f4
	edge32ln	%o5,	%g6,	%o3
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o1
loop_1989:
	alignaddrl	%g5,	%g7,	%o7
	fnot1s	%f16,	%f0
	tvc	%xcc,	0x0
	edge16n	%l4,	%i1,	%l6
	fbue,a	%fcc3,	loop_1990
	orcc	%i7,	0x0A13,	%l1
	nop
	fitod	%f17,	%f4
	andncc	%l3,	%o2,	%i5
loop_1990:
	fmovrslez	%i3,	%f18,	%f1
	fblg	%fcc2,	loop_1991
	movn	%xcc,	%l2,	%o4
	fble,a	%fcc2,	loop_1992
	addcc	%i0,	%o6,	%l5
loop_1991:
	tleu	%xcc,	0x0
	brgez	%i6,	loop_1993
loop_1992:
	fmovsne	%xcc,	%f17,	%f31
	fmovrdlz	%i4,	%f2,	%f10
	nop
	fitos	%f9,	%f1
	fstox	%f1,	%f22
	fxtos	%f22,	%f12
loop_1993:
	andncc	%g4,	%l0,	%g1
	fsrc2	%f14,	%f26
	array16	%g2,	%i2,	%o0
	tge	%xcc,	0x7
	tvs	%icc,	0x3
	popc	%o5,	%g6
	movl	%icc,	%o3,	%g3
	fmovrdlez	%o1,	%f8,	%f2
	orncc	%g7,	%g5,	%o7
	movpos	%xcc,	%i1,	%l6
	addc	%l4,	%l1,	%i7
	smul	%l3,	%o2,	%i5
	addcc	%l2,	0x01C5,	%i3
	movne	%icc,	%i0,	%o4
	movrlez	%o6,	0x265,	%l5
	ta	%icc,	0x4
	tge	%icc,	0x5
	brz,a	%i6,	loop_1994
	stbar
	fmovsg	%icc,	%f12,	%f18
	fblg,a	%fcc1,	loop_1995
loop_1994:
	brlz	%i4,	loop_1996
	smul	%l0,	%g4,	%g1
	wr	%g0,	0x88,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_1995:
	alignaddrl	%g2,	%i2,	%o5
loop_1996:
	tg	%icc,	0x0
	fbue,a	%fcc3,	loop_1997
	fsrc2	%f26,	%f4
	tge	%icc,	0x3
	fones	%f6
loop_1997:
	fnegs	%f17,	%f6
	fble	%fcc1,	loop_1998
	mulx	%g6,	%o0,	%o3
	orncc	%o1,	0x0D54,	%g3
	movl	%icc,	%g5,	%g7
loop_1998:
	array16	%o7,	%l6,	%i1
	movpos	%icc,	%l4,	%l1
	addcc	%i7,	0x065E,	%l3
	subccc	%o2,	0x07AE,	%i5
	andncc	%i3,	%i0,	%o4
	subc	%l2,	0x1FAA,	%l5
	movl	%xcc,	%o6,	%i6
	addcc	%i4,	0x12A1,	%g4
	nop
	setx	0x70687AD9,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	movle	%icc,	%l0,	%g1
	movvs	%icc,	%i2,	%o5
	edge16l	%g2,	%o0,	%o3
	movre	%o1,	0x30E,	%g6
	subc	%g5,	%g3,	%o7
	nop
	fitod	%f8,	%f22
	fdtoi	%f22,	%f2
	mulx	%g7,	%i1,	%l4
	bcc,pt	%icc,	loop_1999
	andncc	%l1,	%i7,	%l6
	tg	%icc,	0x7
	fpadd32s	%f17,	%f31,	%f17
loop_1999:
	movvs	%xcc,	%l3,	%o2
	addccc	%i3,	0x1616,	%i5
	fxor	%f8,	%f16,	%f2
	popc	0x1D0F,	%o4
	movrlez	%l2,	0x0E6,	%i0
	movcs	%xcc,	%l5,	%i6
	tsubcctv	%i4,	%o6,	%g4
	bpos,pn	%xcc,	loop_2000
	fbug	%fcc0,	loop_2001
	edge8	%l0,	%g1,	%i2
	udivcc	%g2,	0x031D,	%o0
loop_2000:
	udivcc	%o5,	0x10DD,	%o1
loop_2001:
	tle	%xcc,	0x0
	edge8l	%o3,	%g5,	%g3
	movle	%icc,	%o7,	%g6
	set	0x60, %g4
	ldswa	[%l7 + %g4] 0x88,	%i1
	nop
	set	0x5C, %i6
	lduw	[%l7 + %i6],	%l4
	stbar
	nop
	set	0x74, %g7
	lduh	[%l7 + %g7],	%g7
	taddcc	%l1,	0x03D7,	%l6
	fmovsa	%xcc,	%f10,	%f7
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4D] %asi,	%i7
	xor	%o2,	%l3,	%i5
	and	%i3,	%o4,	%l2
	orcc	%l5,	%i6,	%i4
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f30
	tg	%xcc,	0x4
	addccc	%i0,	0x09BC,	%o6
	movcc	%xcc,	%g4,	%g1
	movvs	%icc,	%i2,	%g2
	bneg,a,pt	%icc,	loop_2002
	fbug	%fcc2,	loop_2003
	tne	%icc,	0x6
	mulx	%l0,	%o0,	%o5
loop_2002:
	movvc	%icc,	%o1,	%g5
loop_2003:
	nop
	setx	loop_2004,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sub	%o3,	0x0661,	%o7
	nop
	setx	0x2FF074E4D22C0E78,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x23B8857EB0DAC51E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f6,	%f14
	andncc	%g6,	%g3,	%l4
loop_2004:
	movle	%xcc,	%g7,	%i1
	xor	%l1,	%l6,	%i7
	bcs	%icc,	loop_2005
	fnegs	%f11,	%f4
	ldd	[%l7 + 0x78],	%l2
	srlx	%o2,	%i5,	%i3
loop_2005:
	sethi	0x0FC0,	%o4
	set	0x38, %o6
	swapa	[%l7 + %o6] 0x88,	%l5
	tneg	%icc,	0x1
	fbl,a	%fcc2,	loop_2006
	tpos	%xcc,	0x6
	tl	%icc,	0x6
	sdiv	%l2,	0x181B,	%i4
loop_2006:
	tpos	%xcc,	0x3
	ld	[%l7 + 0x2C],	%f21
	movrlez	%i0,	0x3D8,	%i6
	ta	%icc,	0x7
	nop
	set	0x7E, %o7
	lduh	[%l7 + %o7],	%o6
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x74] %asi,	%f20
	fcmple16	%f2,	%f18,	%g1
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x20] %asi,	%i2
	tsubcctv	%g2,	%l0,	%o0
	stb	%g4,	[%l7 + 0x45]
	nop
	fitos	%f27,	%f17
	fands	%f27,	%f19,	%f11
	umul	%o1,	%g5,	%o3
	movrgez	%o7,	0x1A7,	%g6
	smulcc	%g3,	0x0985,	%o5
	bgu,a,pn	%icc,	loop_2007
	addcc	%l4,	0x00D3,	%i1
	fnors	%f11,	%f6,	%f23
	smulcc	%l1,	0x16CC,	%l6
loop_2007:
	sethi	0x192E,	%i7
	set	0x08, %g5
	stxa	%g7,	[%l7 + %g5] 0x15
	orncc	%l3,	0x0E6C,	%o2
	fmovdpos	%icc,	%f17,	%f9
	stw	%i3,	[%l7 + 0x64]
	movrlez	%i5,	0x1B8,	%l5
	bg,pt	%icc,	loop_2008
	fmovda	%xcc,	%f25,	%f14
	mova	%xcc,	%o4,	%i4
	fbule,a	%fcc0,	loop_2009
loop_2008:
	umulcc	%i0,	0x1E9A,	%l2
	nop
	fitos	%f13,	%f0
	fstox	%f0,	%f28
	bge,a	loop_2010
loop_2009:
	or	%i6,	%o6,	%g1
	udivx	%g2,	0x06D0,	%i2
	taddcctv	%l0,	%g4,	%o1
loop_2010:
	srax	%o0,	0x13,	%o3
	edge8	%g5,	%g6,	%o7
	udivcc	%o5,	0x06CA,	%g3
	fbuge	%fcc0,	loop_2011
	edge32n	%l4,	%i1,	%l6
	orncc	%i7,	%g7,	%l1
	movpos	%xcc,	%l3,	%i3
loop_2011:
	andn	%o2,	%l5,	%i5
	movgu	%xcc,	%i4,	%i0
	movvc	%icc,	%l2,	%o4
	set	0x76, %g6
	stha	%i6,	[%l7 + %g6] 0x27
	membar	#Sync
	movne	%xcc,	%o6,	%g1
	umul	%i2,	%g2,	%g4
	fmul8x16au	%f13,	%f23,	%f20
	brz,a	%l0,	loop_2012
	subccc	%o0,	%o3,	%g5
	umul	%o1,	%g6,	%o7
	subccc	%g3,	%l4,	%o5
loop_2012:
	sir	0x0ECA
	popc	0x0BA9,	%l6
	fbul,a	%fcc0,	loop_2013
	movg	%icc,	%i1,	%g7
	nop
	setx	loop_2014,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tn	%icc,	0x1
loop_2013:
	fmovdg	%xcc,	%f23,	%f15
	umulcc	%l1,	%l3,	%i7
loop_2014:
	addc	%o2,	%i3,	%l5
	tcc	%icc,	0x5
	add	%i4,	0x1292,	%i5
	bleu	loop_2015
	fmovdn	%xcc,	%f2,	%f1
	udivx	%i0,	0x02D8,	%l2
	array8	%i6,	%o6,	%o4
loop_2015:
	nop
	wr	%g0,	0xeb,	%asi
	stha	%g1,	[%l7 + 0x0A] %asi
	membar	#Sync
	bg,a,pn	%icc,	loop_2016
	brnz,a	%g2,	loop_2017
	array32	%i2,	%g4,	%o0
	tcc	%xcc,	0x5
loop_2016:
	fcmpeq16	%f30,	%f14,	%l0
loop_2017:
	fblg,a	%fcc3,	loop_2018
	orn	%o3,	0x0917,	%g5
	andncc	%g6,	%o7,	%g3
	taddcctv	%l4,	%o5,	%o1
loop_2018:
	fnands	%f19,	%f27,	%f8
	bne,pt	%icc,	loop_2019
	movpos	%xcc,	%i1,	%g7
	movcs	%icc,	%l6,	%l1
	orncc	%l3,	%i7,	%o2
loop_2019:
	movre	%l5,	0x297,	%i3
	fmovdn	%xcc,	%f16,	%f11
	fmovspos	%xcc,	%f18,	%f25
	fbue	%fcc3,	loop_2020
	movrne	%i4,	%i0,	%i5
	set	0x7C, %l0
	ldstuba	[%l7 + %l0] 0x0c,	%i6
loop_2020:
	tsubcctv	%o6,	0x06A0,	%l2
	xor	%o4,	0x0E61,	%g1
	popc	0x1A8D,	%g2
	tcc	%xcc,	0x1
	movn	%icc,	%g4,	%i2
	or	%o0,	%o3,	%l0
	ldub	[%l7 + 0x0F],	%g5
	fxor	%f16,	%f6,	%f4
	nop
	setx	0x5E0E956E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x187720CC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f2,	%f21
	tcs	%xcc,	0x4
	movrlez	%o7,	%g6,	%l4
	srax	%o5,	0x11,	%g3
	tvs	%xcc,	0x3
	fzero	%f30
	fmul8x16	%f21,	%f10,	%f20
	st	%f14,	[%l7 + 0x68]
	fbne,a	%fcc3,	loop_2021
	xor	%o1,	0x06A1,	%i1
	prefetch	[%l7 + 0x58],	 0x0
	sir	0x18DD
loop_2021:
	edge32	%g7,	%l6,	%l1
	fmovdvs	%icc,	%f15,	%f29
	xorcc	%l3,	0x0B52,	%o2
	orncc	%i7,	0x0181,	%i3
	sll	%l5,	0x17,	%i4
	set	0x78, %o4
	prefetcha	[%l7 + %o4] 0x80,	 0x0
	edge16	%i0,	%i6,	%l2
	andcc	%o6,	%o4,	%g2
	movle	%xcc,	%g1,	%i2
	fnegd	%f12,	%f24
	sir	0x08FB
	movpos	%icc,	%g4,	%o3
	orcc	%l0,	0x098F,	%o0
	move	%xcc,	%g5,	%g6
	fxnors	%f5,	%f10,	%f27
	flush	%l7 + 0x58
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%l4
	smul	%o7,	%g3,	%o1
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x70] %asi,	%f27
	bgu,a	loop_2022
	fnegd	%f0,	%f10
	tvc	%xcc,	0x5
	fba	%fcc3,	loop_2023
loop_2022:
	ldsh	[%l7 + 0x60],	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgz	%i1,	loop_2024
loop_2023:
	nop
	setx	0x97EE3D82,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x12AD4855,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fsubs	%f27,	%f25,	%f4
	alignaddr	%l6,	%g7,	%l3
	flush	%l7 + 0x3C
loop_2024:
	movn	%xcc,	%l1,	%o2
	fbule	%fcc1,	loop_2025
	fbo	%fcc2,	loop_2026
	smul	%i3,	0x0CA3,	%i7
	orn	%i4,	0x1BBF,	%i5
loop_2025:
	fmovscs	%icc,	%f23,	%f12
loop_2026:
	sll	%l5,	%i0,	%i6
	fandnot1s	%f22,	%f28,	%f22
	bshuffle	%f6,	%f28,	%f20
	tg	%icc,	0x3
	tge	%xcc,	0x6
	nop
	setx loop_2027, %l0, %l1
	jmpl %l1, %o6
	te	%xcc,	0x3
	fxors	%f25,	%f20,	%f10
	ble,pt	%icc,	loop_2028
loop_2027:
	bcc,a,pn	%icc,	loop_2029
	tne	%icc,	0x3
	fbule,a	%fcc1,	loop_2030
loop_2028:
	ldd	[%l7 + 0x68],	%l2
loop_2029:
	fble,a	%fcc3,	loop_2031
	umulcc	%o4,	%g1,	%g2
loop_2030:
	nop
	setx	0xC27DC645,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xC9878B63,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f20,	%f23
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x50] %asi,	%g4
loop_2031:
	alignaddrl	%i2,	%l0,	%o3
	nop
	set	0x10, %o3
	lduw	[%l7 + %o3],	%g5
	edge32l	%g6,	%o0,	%o7
	nop
	setx	0x8E05016085985FD9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF49C5CB281FCF1E7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f30,	%f28
	movcs	%icc,	%g3,	%l4
	fmovsne	%xcc,	%f22,	%f0
	te	%xcc,	0x4
	movn	%xcc,	%o1,	%o5
	fblg	%fcc3,	loop_2032
	movneg	%icc,	%l6,	%i1
	wr	%g0,	0x2b,	%asi
	stba	%g7,	[%l7 + 0x4D] %asi
	membar	#Sync
loop_2032:
	fnors	%f27,	%f24,	%f24
	sdivx	%l3,	0x1A70,	%o2
	srl	%l1,	%i3,	%i7
	fba	%fcc3,	loop_2033
	tneg	%icc,	0x4
	tvc	%xcc,	0x0
	fones	%f10
loop_2033:
	sll	%i4,	0x16,	%i5
	sll	%i0,	%i6,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldstub	[%l7 + 0x48],	%l5
	wr	%g0,	0xea,	%asi
	stha	%o4,	[%l7 + 0x78] %asi
	membar	#Sync
	array16	%l2,	%g2,	%g1
	sllx	%i2,	0x04,	%l0
	movg	%icc,	%o3,	%g4
	movvc	%xcc,	%g6,	%o0
	or	%g5,	%o7,	%g3
	tneg	%xcc,	0x2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f14
	fxtod	%f14,	%f14
	fmovsge	%icc,	%f24,	%f25
	fpsub16s	%f4,	%f0,	%f26
	stx	%o5,	[%l7 + 0x20]
	edge32	%l6,	%o1,	%i1
	fpackfix	%f10,	%f5
	array16	%g7,	%l3,	%l1
	subccc	%o2,	0x01ED,	%i3
	sub	%i4,	0x1A43,	%i5
	addc	%i7,	0x0021,	%i6
	set	0x70, %o1
	ldda	[%l7 + %o1] 0xea,	%i0
	udivcc	%o6,	0x0B08,	%l5
	sll	%o4,	%g2,	%l2
	edge16l	%i2,	%l0,	%o3
	nop
	fitos	%f9,	%f21
	fstox	%f21,	%f0
	fxtos	%f0,	%f2
	tle	%xcc,	0x3
	fmovdvc	%icc,	%f18,	%f8
	be,a	loop_2034
	fbge	%fcc0,	loop_2035
	fpadd16	%f0,	%f4,	%f6
	edge32ln	%g4,	%g1,	%g6
loop_2034:
	fpadd16	%f26,	%f2,	%f24
loop_2035:
	fpackfix	%f26,	%f2
	set	0x40, %g3
	stda	%f0,	[%l7 + %g3] 0x1e
	membar	#Sync
	movleu	%xcc,	%o0,	%g5
	stb	%o7,	[%l7 + 0x1E]
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0xf0
	membar	#Sync
	fcmpgt32	%f14,	%f18,	%g3
	brz,a	%l4,	loop_2036
	sdivx	%o5,	0x1595,	%o1
	brlz,a	%i1,	loop_2037
	ble,a	loop_2038
loop_2036:
	edge8n	%g7,	%l3,	%l6
	orn	%o2,	%l1,	%i3
loop_2037:
	sdiv	%i4,	0x03FE,	%i5
loop_2038:
	xor	%i7,	%i0,	%i6
	subccc	%l5,	0x05FC,	%o6
	movrlez	%o4,	%g2,	%i2
	nop
	fitos	%f14,	%f9
	fstox	%f9,	%f30
	fxnors	%f9,	%f5,	%f23
	fbule	%fcc2,	loop_2039
	alignaddr	%l2,	%o3,	%l0
	fmovdge	%icc,	%f17,	%f28
	sra	%g1,	0x04,	%g6
loop_2039:
	ta	%xcc,	0x2
	andn	%o0,	0x171D,	%g5
	tpos	%xcc,	0x2
	subc	%o7,	%g4,	%l4
	fmovdneg	%icc,	%f30,	%f11
	fpack16	%f20,	%f13
	srl	%g3,	0x0F,	%o1
	srax	%i1,	%g7,	%o5
	movrlz	%l3,	0x05D,	%l6
	movleu	%icc,	%o2,	%l1
	tvc	%icc,	0x2
	srlx	%i3,	0x17,	%i5
	edge16ln	%i7,	%i4,	%i0
	edge8n	%l5,	%o6,	%i6
	movpos	%icc,	%g2,	%o4
	fors	%f15,	%f14,	%f30
	bg	loop_2040
	fbg,a	%fcc1,	loop_2041
	fors	%f2,	%f24,	%f0
	membar	0x52
loop_2040:
	fpack32	%f8,	%f4,	%f24
loop_2041:
	call	loop_2042
	movge	%xcc,	%i2,	%l2
	add	%o3,	0x17ED,	%g1
	add	%l7,	0x34,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l0,	%o0
loop_2042:
	bcs,a	loop_2043
	orncc	%g5,	0x1B8C,	%o7
	movcs	%xcc,	%g6,	%l4
	sllx	%g4,	%o1,	%i1
loop_2043:
	fmovsle	%icc,	%f7,	%f4
	tge	%xcc,	0x2
	edge16	%g3,	%o5,	%g7
	nop
	setx	0xA06A9EA8,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	xnorcc	%l3,	%l6,	%l1
	sir	0x0E06
	addcc	%o2,	0x0A4B,	%i5
	fzeros	%f1
	set	0x60, %l6
	ldda	[%l7 + %l6] 0xea,	%i2
	fmovrse	%i4,	%f14,	%f3
	fmul8sux16	%f26,	%f4,	%f24
	andn	%i7,	0x032D,	%l5
	sll	%i0,	0x13,	%i6
	movpos	%icc,	%g2,	%o6
	movn	%icc,	%i2,	%o4
	sll	%l2,	0x13,	%g1
	fmovsge	%icc,	%f24,	%f31
	fmovrdgz	%o3,	%f2,	%f26
	movne	%icc,	%l0,	%g5
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x0c,	%f0
	fmovsne	%xcc,	%f7,	%f6
	mulscc	%o0,	0x0CEE,	%g6
	fbug,a	%fcc2,	loop_2044
	lduw	[%l7 + 0x4C],	%o7
	fnot2s	%f13,	%f23
	sdiv	%g4,	0x052B,	%o1
loop_2044:
	sir	0x19A1
	fand	%f8,	%f12,	%f30
	membar	0x7F
	sub	%l4,	0x01F0,	%i1
	edge32l	%o5,	%g3,	%g7
	movne	%xcc,	%l3,	%l6
	movl	%xcc,	%o2,	%i5
	mulx	%l1,	0x0B80,	%i4
	taddcctv	%i7,	%i3,	%l5
	edge8n	%i6,	%g2,	%i0
	udivcc	%i2,	0x0D96,	%o4
	or	%l2,	%o6,	%g1
	membar	0x5E
	fcmpne16	%f2,	%f12,	%l0
	sub	%g5,	0x111E,	%o3
	fbge	%fcc1,	loop_2045
	srax	%o0,	0x11,	%g6
	fpsub32s	%f8,	%f26,	%f6
	fble	%fcc1,	loop_2046
loop_2045:
	array16	%o7,	%o1,	%l4
	movle	%xcc,	%g4,	%o5
	movre	%i1,	0x219,	%g7
loop_2046:
	fnot2s	%f27,	%f10
	udiv	%l3,	0x0E12,	%l6
	tvs	%icc,	0x0
	bcs,pt	%xcc,	loop_2047
	fpadd16s	%f13,	%f29,	%f0
	fbge	%fcc1,	loop_2048
	fors	%f5,	%f0,	%f27
loop_2047:
	udivcc	%o2,	0x0B76,	%g3
	fmovsneg	%icc,	%f2,	%f6
loop_2048:
	tle	%xcc,	0x7
	membar	#Sync
	set	0x40, %l3
	ldda	[%l7 + %l3] 0xf0,	%f0
	set	0x74, %i4
	lduha	[%l7 + %i4] 0x14,	%i5
	tleu	%xcc,	0x0
	sdiv	%l1,	0x1CC2,	%i4
	movge	%xcc,	%i3,	%l5
	set	0x24, %i5
	lduwa	[%l7 + %i5] 0x81,	%i7
	movpos	%icc,	%i6,	%i0
	edge16n	%i2,	%o4,	%l2
	fcmple32	%f6,	%f6,	%o6
	fmovrdlez	%g2,	%f0,	%f8
	movrne	%g1,	0x0FB,	%g5
	andcc	%o3,	%l0,	%o0
	mulx	%g6,	0x1FF3,	%o1
	orn	%o7,	0x18C4,	%l4
	flush	%l7 + 0x18
	fmovrde	%g4,	%f20,	%f4
	fexpand	%f18,	%f2
	lduw	[%l7 + 0x58],	%i1
	fsrc1	%f4,	%f14
	add	%l7,	0x40,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%o5,	%l3
	sllx	%l6,	0x0E,	%o2
	xnorcc	%g7,	0x1C1B,	%i5
	nop
	fitos	%f7,	%f19
	fstoi	%f19,	%f12
	tcc	%icc,	0x5
	brlez,a	%g3,	loop_2049
	sth	%i4,	[%l7 + 0x78]
	fbo,a	%fcc1,	loop_2050
	nop
	setx	0x5DCD3AF3FCA37651,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x87BC63D7C1798CC5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f20,	%f18
loop_2049:
	move	%icc,	%l1,	%i3
	wr	%g0,	0x81,	%asi
	stba	%i7,	[%l7 + 0x12] %asi
loop_2050:
	nop
	setx	0x1643E296,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xD2756A7A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f13,	%f31
	fmovse	%icc,	%f0,	%f8
	nop
	setx	0x5F2FC5AF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x3D177DA0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f19,	%f25
	fandnot1s	%f18,	%f8,	%f5
	tsubcctv	%i6,	%l5,	%i2
	edge8ln	%i0,	%o4,	%o6
	edge16n	%l2,	%g1,	%g5
	bne,a	loop_2051
	movge	%icc,	%g2,	%o3
	fmovdcc	%icc,	%f22,	%f21
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x4A] %asi,	%l0
loop_2051:
	movcs	%icc,	%g6,	%o0
	flush	%l7 + 0x18
	mulscc	%o7,	0x0DB5,	%o1
	alignaddrl	%g4,	%i1,	%o5
	fnor	%f4,	%f16,	%f0
	tleu	%xcc,	0x4
	edge8ln	%l3,	%l4,	%l6
	xnor	%o2,	%g7,	%g3
	nop
	setx	0x29CD2014,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0xBF986FB6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f24,	%f12
	edge32l	%i5,	%i4,	%l1
	sra	%i3,	0x09,	%i6
	fbe,a	%fcc2,	loop_2052
	orncc	%l5,	0x0CDB,	%i2
	edge8n	%i7,	%o4,	%o6
	bpos,a,pt	%icc,	loop_2053
loop_2052:
	lduh	[%l7 + 0x7E],	%l2
	movne	%icc,	%g1,	%i0
	tn	%xcc,	0x1
loop_2053:
	nop
	setx	loop_2054,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	stw	%g5,	[%l7 + 0x48]
	edge32l	%g2,	%l0,	%g6
	fmul8x16au	%f0,	%f28,	%f0
loop_2054:
	movcc	%icc,	%o0,	%o7
	udivx	%o1,	0x0D43,	%g4
	fcmpeq16	%f20,	%f16,	%i1
	srl	%o3,	%l3,	%l4
	fpadd16s	%f21,	%f21,	%f23
	tle	%xcc,	0x7
	srl	%o5,	%l6,	%g7
	tcc	%xcc,	0x4
	set	0x58, %l4
	prefetcha	[%l7 + %l4] 0x11,	 0x2
	andn	%o2,	0x1B85,	%i4
	lduw	[%l7 + 0x28],	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	flush	%l7 + 0x34
	nop
	setx	0xB0E2EA3F60627984,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	mulx	%i5,	0x1731,	%i6
	smul	%i3,	0x0B22,	%i2
	tvs	%xcc,	0x4
	subccc	%l5,	0x0263,	%o4
	movleu	%xcc,	%o6,	%l2
	wr	%g0,	0x04,	%asi
	stba	%i7,	[%l7 + 0x5B] %asi
	fmovrdlz	%g1,	%f22,	%f26
	smul	%i0,	%g5,	%g2
	popc	0x1A43,	%l0
	addccc	%o0,	%o7,	%g6
	set	0x7C, %i1
	ldswa	[%l7 + %i1] 0x88,	%o1
	tneg	%icc,	0x7
	tge	%icc,	0x3
	edge16ln	%g4,	%o3,	%i1
	tsubcc	%l3,	0x151B,	%l4
	membar	0x4F
	bge,a	%xcc,	loop_2055
	movge	%icc,	%o5,	%g7
	edge32n	%g3,	%o2,	%i4
	sir	0x1A81
loop_2055:
	xorcc	%l6,	0x0978,	%l1
	brgez,a	%i5,	loop_2056
	sub	%i3,	%i6,	%l5
	nop
	setx loop_2057, %l0, %l1
	jmpl %l1, %i2
	brgz,a	%o4,	loop_2058
loop_2056:
	edge32ln	%l2,	%i7,	%g1
	xor	%o6,	%i0,	%g2
loop_2057:
	fmovrdlz	%g5,	%f6,	%f30
loop_2058:
	edge8ln	%l0,	%o0,	%o7
	edge32n	%g6,	%o1,	%g4
	movrlez	%i1,	0x3DD,	%o3
	movrgez	%l3,	0x3F6,	%o5
	movre	%l4,	0x0C3,	%g3
	fzeros	%f23
	sdiv	%o2,	0x02EE,	%i4
	tge	%icc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%l6,	%g7
	sll	%l1,	%i5,	%i3
	nop
	setx	0xE3498D7F81BBDA5B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xE35F7B96036768FF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fsubd	%f2,	%f18,	%f6
	edge16ln	%i6,	%i2,	%o4
	fmovdn	%xcc,	%f6,	%f0
	tleu	%icc,	0x6
	edge16	%l5,	%l2,	%g1
	fbug	%fcc2,	loop_2059
	array8	%i7,	%o6,	%g2
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x70] %asi,	%i0
loop_2059:
	udivcc	%g5,	0x0EA1,	%o0
	nop
	setx	0x9F9543D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0xCFCF7B4B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f27,	%f19
	xnor	%o7,	%g6,	%l0
	sllx	%g4,	0x18,	%o1
	stw	%i1,	[%l7 + 0x30]
	te	%icc,	0x3
	add	%o3,	%o5,	%l4
	wr	%g0,	0x0c,	%asi
	sta	%f14,	[%l7 + 0x3C] %asi
	fmovdle	%xcc,	%f26,	%f27
	udiv	%l3,	0x11E8,	%g3
	edge32n	%o2,	%l6,	%i4
	movrne	%l1,	%g7,	%i3
	nop
	setx	0xE06FF918,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	addcc	%i5,	%i6,	%i2
	addc	%o4,	0x0243,	%l2
	mova	%icc,	%g1,	%l5
	fcmpne16	%f26,	%f12,	%i7
	ldsh	[%l7 + 0x40],	%g2
	fmovdneg	%xcc,	%f11,	%f4
	tl	%icc,	0x4
	tneg	%icc,	0x0
	movcc	%icc,	%o6,	%i0
	bne,a	%xcc,	loop_2060
	fandnot2	%f0,	%f2,	%f0
	bneg	loop_2061
	xnor	%o0,	0x16A2,	%o7
loop_2060:
	std	%f30,	[%l7 + 0x78]
	alignaddrl	%g5,	%g6,	%l0
loop_2061:
	sub	%o1,	%g4,	%i1
	edge16l	%o5,	%o3,	%l4
	array16	%l3,	%g3,	%l6
	fornot2	%f12,	%f20,	%f10
	movcs	%icc,	%o2,	%l1
	wr	%g0,	0x04,	%asi
	stwa	%i4,	[%l7 + 0x14] %asi
	fsrc1s	%f26,	%f16
	bn	%icc,	loop_2062
	andcc	%g7,	0x191D,	%i3
	fornot1	%f18,	%f26,	%f22
	fbuge,a	%fcc0,	loop_2063
loop_2062:
	sethi	0x071E,	%i6
	set	0x46, %i2
	lduha	[%l7 + %i2] 0x89,	%i2
loop_2063:
	sdivx	%o4,	0x0AE8,	%i5
	fmovsl	%icc,	%f9,	%f25
	subccc	%l2,	%g1,	%i7
	mova	%xcc,	%l5,	%o6
	array16	%g2,	%o0,	%i0
	fabsd	%f2,	%f30
	sdivx	%o7,	0x1038,	%g6
	xor	%l0,	%o1,	%g4
	tne	%icc,	0x1
	for	%f14,	%f6,	%f20
	or	%g5,	0x1FCB,	%i1
	tne	%icc,	0x7
	array8	%o5,	%o3,	%l4
	fmovsl	%xcc,	%f31,	%f30
	sdivcc	%l3,	0x0EDF,	%l6
	fba,a	%fcc3,	loop_2064
	movre	%o2,	%g3,	%i4
	movn	%icc,	%g7,	%i3
	movle	%xcc,	%l1,	%i2
loop_2064:
	fcmpgt16	%f8,	%f24,	%o4
	sdiv	%i6,	0x07D4,	%l2
	or	%i5,	0x0956,	%i7
	alignaddrl	%g1,	%l5,	%g2
	add	%o0,	0x18D4,	%o6
	movrlez	%o7,	0x13D,	%g6
	bleu,pn	%icc,	loop_2065
	edge32	%l0,	%o1,	%g4
	subccc	%g5,	%i1,	%i0
	sir	0x1C06
loop_2065:
	smulcc	%o5,	0x07F2,	%l4
	nop
	fitos	%f8,	%f9
	fstod	%f9,	%f0
	sra	%l3,	%o3,	%o2
	nop
	setx loop_2066, %l0, %l1
	jmpl %l1, %g3
	tle	%icc,	0x5
	fmovsg	%icc,	%f16,	%f31
	sdivcc	%i4,	0x1FA5,	%l6
loop_2066:
	orcc	%i3,	0x06A0,	%g7
	tsubcctv	%i2,	%l1,	%o4
	mulscc	%l2,	%i5,	%i6
	and	%i7,	0x0CA4,	%g1
	bne,a	%icc,	loop_2067
	tsubcctv	%g2,	%o0,	%l5
	movn	%icc,	%o6,	%o7
	sllx	%g6,	%o1,	%g4
loop_2067:
	bvs,a,pn	%icc,	loop_2068
	udivx	%l0,	0x162B,	%g5
	tsubcc	%i1,	0x0FC3,	%i0
	movneg	%icc,	%o5,	%l4
loop_2068:
	taddcctv	%o3,	%o2,	%l3
	fmovdgu	%xcc,	%f20,	%f28
	fmovda	%xcc,	%f1,	%f17
	movvc	%xcc,	%g3,	%i4
	umul	%l6,	0x03AB,	%g7
	fpadd16	%f24,	%f28,	%f18
	fsrc1s	%f3,	%f3
	fmovdcs	%icc,	%f21,	%f9
	edge8ln	%i3,	%l1,	%o4
	movre	%l2,	0x375,	%i2
	orn	%i6,	%i5,	%g1
	popc	0x03B6,	%i7
	tcs	%icc,	0x2
	array8	%o0,	%g2,	%l5
	swap	[%l7 + 0x3C],	%o6
	movrgez	%g6,	0x3CB,	%o1
	sdiv	%g4,	0x0C28,	%l0
	swap	[%l7 + 0x54],	%o7
	brgez,a	%i1,	loop_2069
	sethi	0x1260,	%g5
	and	%i0,	0x05FE,	%o5
	nop
	setx	0x00A451B0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	fsqrts	%f23,	%f21
loop_2069:
	fmovse	%icc,	%f10,	%f28
	or	%o3,	%o2,	%l4
	brz	%l3,	loop_2070
	movre	%g3,	0x1C5,	%l6
	udivcc	%g7,	0x199A,	%i4
	tvc	%xcc,	0x5
loop_2070:
	bcs,a,pt	%icc,	loop_2071
	addccc	%i3,	0x03C4,	%l1
	movle	%xcc,	%o4,	%i2
	ba,a	%xcc,	loop_2072
loop_2071:
	std	%f0,	[%l7 + 0x08]
	fcmpeq16	%f30,	%f10,	%l2
	fxor	%f24,	%f22,	%f10
loop_2072:
	array32	%i6,	%g1,	%i5
	bl,pt	%icc,	loop_2073
	fmovsl	%xcc,	%f20,	%f13
	sllx	%i7,	%g2,	%l5
	bpos,pt	%icc,	loop_2074
loop_2073:
	nop
	setx	0x40755087,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	move	%icc,	%o0,	%o6
	mulscc	%o1,	%g4,	%l0
loop_2074:
	tcs	%xcc,	0x2
	nop
	fitod	%f10,	%f22
	fdtox	%f22,	%f4
	fmovsl	%icc,	%f18,	%f25
	and	%g6,	0x1136,	%o7
	fmovrdgez	%g5,	%f26,	%f4
	movle	%xcc,	%i0,	%i1
	fmovde	%icc,	%f4,	%f10
	xnor	%o3,	%o2,	%l4
	fbu	%fcc0,	loop_2075
	fbu,a	%fcc2,	loop_2076
	fmovrsgez	%o5,	%f25,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2075:
	fnot1	%f18,	%f6
loop_2076:
	fxors	%f16,	%f10,	%f5
	fmovsa	%xcc,	%f27,	%f25
	tgu	%xcc,	0x1
	movrne	%g3,	0x0E0,	%l6
	or	%l3,	0x1618,	%g7
	udivx	%i3,	0x07C6,	%l1
	brnz,a	%o4,	loop_2077
	lduw	[%l7 + 0x7C],	%i4
	tsubcctv	%l2,	%i2,	%g1
	tsubcc	%i5,	0x0BDB,	%i7
loop_2077:
	nop
	setx	0x74131166605F1C43,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fmul8x16au	%f27,	%f0,	%f10
	movre	%i6,	0x296,	%l5
	movneg	%xcc,	%o0,	%o6
	orcc	%o1,	0x084D,	%g4
	movleu	%icc,	%g2,	%g6
	fones	%f9
	fbe,a	%fcc3,	loop_2078
	fbn,a	%fcc0,	loop_2079
	srax	%l0,	%o7,	%g5
	edge16l	%i0,	%i1,	%o2
loop_2078:
	fmovdleu	%icc,	%f30,	%f14
loop_2079:
	sub	%o3,	0x0982,	%l4
	fbu,a	%fcc1,	loop_2080
	srl	%o5,	0x0B,	%l6
	fmovdg	%icc,	%f0,	%f4
	te	%icc,	0x2
loop_2080:
	fones	%f13
	movre	%l3,	%g3,	%i3
	bcc,pn	%xcc,	loop_2081
	array32	%l1,	%g7,	%i4
	taddcctv	%o4,	0x1E7C,	%l2
	movl	%icc,	%i2,	%g1
loop_2081:
	edge32ln	%i7,	%i6,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f4,	%f30
	movrne	%l5,	%o0,	%o6
	bvs,pt	%xcc,	loop_2082
	ba,a,pt	%icc,	loop_2083
	bvc,pt	%icc,	loop_2084
	smulcc	%g4,	0x142B,	%g2
loop_2082:
	fmovsn	%icc,	%f17,	%f12
loop_2083:
	nop
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x1F] %asi,	%g6
loop_2084:
	fmul8sux16	%f24,	%f20,	%f0
	bn	loop_2085
	sra	%l0,	%o1,	%o7
	tvc	%icc,	0x7
	fbu	%fcc2,	loop_2086
loop_2085:
	fbn	%fcc2,	loop_2087
	movre	%g5,	%i0,	%o2
	move	%icc,	%o3,	%i1
loop_2086:
	add	%o5,	0x10C8,	%l6
loop_2087:
	movl	%xcc,	%l3,	%l4
	fxors	%f11,	%f19,	%f15
	fbule	%fcc0,	loop_2088
	edge8n	%g3,	%i3,	%g7
	lduh	[%l7 + 0x74],	%i4
	edge32l	%o4,	%l2,	%l1
loop_2088:
	ldstub	[%l7 + 0x4B],	%g1
	fpsub32s	%f5,	%f18,	%f2
	set	0x4E, %o5
	stha	%i2,	[%l7 + %o5] 0x27
	membar	#Sync
	bl,a	loop_2089
	addccc	%i7,	%i6,	%l5
	set	0x34, %i0
	sta	%f0,	[%l7 + %i0] 0x89
loop_2089:
	bl	loop_2090
	brgez	%o0,	loop_2091
	array8	%i5,	%o6,	%g4
	bl	%xcc,	loop_2092
loop_2090:
	fands	%f5,	%f8,	%f0
loop_2091:
	movge	%icc,	%g6,	%l0
	sllx	%g2,	0x0E,	%o7
loop_2092:
	nop
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x50] %asi,	%o0
	tneg	%icc,	0x0
	tsubcctv	%g5,	%o2,	%i0
	fabsd	%f4,	%f4
	swap	[%l7 + 0x0C],	%i1
	fbl,a	%fcc2,	loop_2093
	sir	0x0EAB
	flush	%l7 + 0x28
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x88,	%f16
loop_2093:
	fcmple32	%f24,	%f28,	%o3
	tn	%icc,	0x3
	edge16ln	%o5,	%l6,	%l3
	set	0x56, %l2
	stba	%l4,	[%l7 + %l2] 0x10
	bpos,pn	%xcc,	loop_2094
	fpack16	%f26,	%f12
	fmovrdgez	%g3,	%f0,	%f16
	edge32l	%g7,	%i4,	%i3
loop_2094:
	bneg,a,pt	%icc,	loop_2095
	alignaddrl	%l2,	%l1,	%o4
	movrne	%g1,	0x0A2,	%i2
	bl	loop_2096
loop_2095:
	movpos	%icc,	%i6,	%i7
	bleu,pt	%xcc,	loop_2097
	fmovrdgez	%o0,	%f12,	%f0
loop_2096:
	addcc	%i5,	%l5,	%o6
	movrlez	%g6,	0x26D,	%g4
loop_2097:
	udiv	%l0,	0x077C,	%g2
	movleu	%xcc,	%o1,	%g5
	ldsw	[%l7 + 0x14],	%o2
	bne,a	loop_2098
	nop
	setx loop_2099, %l0, %l1
	jmpl %l1, %i0
	fmovdpos	%icc,	%f17,	%f6
	tsubcc	%i1,	0x18D6,	%o7
loop_2098:
	srl	%o5,	%l6,	%l3
loop_2099:
	fpack32	%f18,	%f16,	%f10
	fnands	%f1,	%f10,	%f16
	umul	%l4,	%o3,	%g3
	brlez,a	%g7,	loop_2100
	movcs	%icc,	%i4,	%i3
	std	%f10,	[%l7 + 0x20]
	movleu	%icc,	%l2,	%l1
loop_2100:
	orncc	%o4,	0x0721,	%g1
	nop
	setx loop_2101, %l0, %l1
	jmpl %l1, %i6
	fabss	%f7,	%f26
	movpos	%xcc,	%i7,	%i2
	or	%i5,	%o0,	%o6
loop_2101:
	fpadd32s	%f9,	%f20,	%f29
	movcc	%icc,	%l5,	%g4
	tleu	%icc,	0x0
	sub	%g6,	%g2,	%l0
	array32	%o1,	%o2,	%g5
	bne,a	%xcc,	loop_2102
	movrgz	%i1,	%i0,	%o7
	andn	%o5,	0x0048,	%l6
	orcc	%l3,	%l4,	%g3
loop_2102:
	tpos	%icc,	0x6
	fmovse	%icc,	%f9,	%f25
	movre	%g7,	0x0B0,	%i4
	brlz	%i3,	loop_2103
	tn	%xcc,	0x5
	movrgez	%o3,	%l2,	%l1
	ba,a,pn	%xcc,	loop_2104
loop_2103:
	fmovspos	%xcc,	%f25,	%f15
	andn	%o4,	0x13EA,	%i6
	movgu	%icc,	%i7,	%g1
loop_2104:
	prefetch	[%l7 + 0x5C],	 0x2
	movvs	%xcc,	%i5,	%i2
	fandnot1s	%f6,	%f2,	%f1
	edge16l	%o6,	%o0,	%l5
	alignaddrl	%g6,	%g4,	%g2
	move	%xcc,	%o1,	%o2
	tcs	%icc,	0x5
	array8	%g5,	%l0,	%i0
	movleu	%xcc,	%i1,	%o7
	fandnot2	%f0,	%f16,	%f10
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x7C] %asi,	%o5
	srax	%l6,	0x01,	%l3
	tsubcctv	%l4,	0x178C,	%g3
	fmovrsne	%i4,	%f14,	%f6
	tn	%icc,	0x5
	bneg,pt	%xcc,	loop_2105
	edge8ln	%g7,	%o3,	%l2
	sdiv	%l1,	0x0B2D,	%o4
	movg	%xcc,	%i3,	%i7
loop_2105:
	tvs	%icc,	0x0
	fors	%f22,	%f0,	%f13
	stx	%g1,	[%l7 + 0x30]
	swap	[%l7 + 0x74],	%i6
	fmul8ulx16	%f10,	%f30,	%f28
	nop
	setx	0x7301F9C1705DE7AA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tne	%xcc,	0x5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%i5,	%o6
	bvc	loop_2106
	fba,a	%fcc1,	loop_2107
	fbe,a	%fcc0,	loop_2108
	tleu	%xcc,	0x7
loop_2106:
	fand	%f14,	%f28,	%f22
loop_2107:
	taddcctv	%i2,	0x08BA,	%o0
loop_2108:
	ba,a,pt	%xcc,	loop_2109
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f8,	%f12,	%f12
	fone	%f0
loop_2109:
	tvc	%icc,	0x3
	membar	0x71
	fnot2	%f30,	%f22
	nop
	fitos	%f12,	%f20
	fstoi	%f20,	%f29
	fbg	%fcc2,	loop_2110
	fblg	%fcc1,	loop_2111
	fornot1s	%f29,	%f21,	%f16
	udiv	%l5,	0x009E,	%g6
loop_2110:
	udiv	%g2,	0x1F7D,	%o1
loop_2111:
	nop
	set	0x65, %o2
	ldub	[%l7 + %o2],	%o2
	subcc	%g5,	%g4,	%i0
	or	%i1,	0x11C5,	%o7
	fmovdg	%xcc,	%f19,	%f24
	lduh	[%l7 + 0x6A],	%o5
	movgu	%xcc,	%l0,	%l3
	tneg	%xcc,	0x3
	popc	%l4,	%g3
	tne	%icc,	0x4
	xnorcc	%i4,	0x16F1,	%l6
	fmovdcc	%icc,	%f13,	%f7
	or	%g7,	%l2,	%o3
	fbuge	%fcc0,	loop_2112
	stw	%o4,	[%l7 + 0x38]
	movpos	%xcc,	%i3,	%l1
	add	%g1,	0x1CE3,	%i6
loop_2112:
	fbo,a	%fcc3,	loop_2113
	fcmpeq32	%f8,	%f30,	%i7
	umulcc	%o6,	%i5,	%o0
	srl	%i2,	%g6,	%g2
loop_2113:
	tvs	%icc,	0x7
	bcc,pn	%icc,	loop_2114
	fba,a	%fcc3,	loop_2115
	fmovsvs	%icc,	%f27,	%f14
	fbue	%fcc3,	loop_2116
loop_2114:
	mulx	%l5,	0x087F,	%o2
loop_2115:
	movcc	%xcc,	%g5,	%g4
	fmovdleu	%xcc,	%f0,	%f27
loop_2116:
	fbe,a	%fcc1,	loop_2117
	fandnot2	%f30,	%f12,	%f0
	prefetch	[%l7 + 0x08],	 0x2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2117:
	fmovrdlz	%o1,	%f28,	%f22
	fmovd	%f4,	%f4
	edge32ln	%i0,	%i1,	%o5
	sdivcc	%l0,	0x18EF,	%l3
	edge8l	%o7,	%g3,	%l4
	movge	%xcc,	%i4,	%g7
	fxors	%f25,	%f16,	%f20
	movrlez	%l2,	%l6,	%o3
	movle	%xcc,	%i3,	%o4
	fbg	%fcc1,	loop_2118
	tg	%icc,	0x5
	movrgez	%l1,	%i6,	%g1
	alignaddr	%i7,	%i5,	%o0
loop_2118:
	tge	%xcc,	0x1
	fnegs	%f11,	%f23
	fornot1s	%f26,	%f24,	%f14
	edge32n	%i2,	%o6,	%g2
	movcs	%xcc,	%l5,	%g6
	addccc	%o2,	0x1C34,	%g4
	ld	[%l7 + 0x7C],	%f14
	brlz	%g5,	loop_2119
	edge32ln	%i0,	%o1,	%i1
	fmovrdgez	%o5,	%f28,	%f24
	udivx	%l0,	0x0D80,	%l3
loop_2119:
	nop
	add	%l7,	0x24,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%l4
	orcc	%i4,	0x10A2,	%g7
	fmovsleu	%icc,	%f17,	%f4
	tpos	%icc,	0x3
	sra	%o7,	%l2,	%o3
	st	%f24,	[%l7 + 0x48]
	nop
	fitos	%f7,	%f29
	fstox	%f29,	%f6
	xnorcc	%i3,	%o4,	%l1
	sub	%i6,	%l6,	%g1
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	ldstub	[%l7 + 0x5F],	%i7
	fblg,a	%fcc3,	loop_2120
	nop
	setx loop_2121, %l0, %l1
	jmpl %l1, %i5
	addcc	%i2,	0x199C,	%o0
	edge8ln	%g2,	%o6,	%l5
loop_2120:
	alignaddrl	%g6,	%g4,	%o2
loop_2121:
	andn	%i0,	%o1,	%g5
	fornot2	%f4,	%f16,	%f26
	tl	%icc,	0x3
	fmovrde	%i1,	%f16,	%f22
	movneg	%icc,	%l0,	%l3
	sll	%g3,	0x0F,	%o5
	movrlz	%i4,	%l4,	%g7
	orn	%l2,	0x07C4,	%o7
	bvs	%xcc,	loop_2122
	fbule,a	%fcc0,	loop_2123
	fsrc2s	%f7,	%f4
	fmovsl	%icc,	%f1,	%f29
loop_2122:
	edge16n	%o3,	%i3,	%o4
loop_2123:
	andncc	%l1,	%i6,	%l6
	nop
	set	0x61, %g2
	stb	%i7,	[%l7 + %g2]
	udiv	%g1,	0x114B,	%i5
	nop
	set	0x30, %l5
	ldx	[%l7 + %l5],	%i2
	srax	%g2,	0x05,	%o6
	sra	%o0,	0x03,	%g6
	nop
	setx	0x94B06EF8C3F35055,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f30
	move	%xcc,	%l5,	%o2
	xor	%g4,	0x1685,	%o1
	bgu,a,pn	%xcc,	loop_2124
	subcc	%i0,	%i1,	%l0
	fnands	%f17,	%f21,	%f21
	set	0x56, %i7
	stha	%l3,	[%l7 + %i7] 0xea
	membar	#Sync
loop_2124:
	sub	%g3,	%o5,	%i4
	ba,a,pt	%xcc,	loop_2125
	fmovde	%xcc,	%f22,	%f4
	tleu	%icc,	0x0
	fmovdpos	%xcc,	%f10,	%f7
loop_2125:
	nop
	wr	%g0,	0xf9,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	orn	%g5,	%g7,	%l2
	ldsh	[%l7 + 0x50],	%o7
	fabsd	%f2,	%f6
	fmovdge	%xcc,	%f3,	%f22
	umulcc	%o3,	%l4,	%i3
	tvs	%icc,	0x5
	flush	%l7 + 0x48
	fmovrdlez	%o4,	%f4,	%f20
	fbge	%fcc2,	loop_2126
	sdivcc	%i6,	0x0C0C,	%l6
	edge8l	%i7,	%g1,	%i5
	fbl,a	%fcc1,	loop_2127
loop_2126:
	sdivx	%l1,	0x128C,	%i2
	set	0x6E, %g1
	ldstuba	[%l7 + %g1] 0x19,	%o6
loop_2127:
	tgu	%icc,	0x5
	taddcctv	%o0,	0x0294,	%g2
	tpos	%xcc,	0x3
	fbu,a	%fcc1,	loop_2128
	movre	%g6,	%o2,	%l5
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f8
	fxtod	%f8,	%f28
	bneg	%xcc,	loop_2129
loop_2128:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f30,	%f22,	%f14
	fmul8ulx16	%f4,	%f2,	%f16
loop_2129:
	movcc	%icc,	%o1,	%g4
	udivx	%i0,	0x1468,	%l0
	ba,pt	%xcc,	loop_2130
	and	%i1,	%g3,	%o5
	movvs	%icc,	%l3,	%i4
	wr	%g0,	0x2a,	%asi
	stwa	%g5,	[%l7 + 0x58] %asi
	membar	#Sync
loop_2130:
	fpadd32s	%f24,	%f14,	%f7
	edge32ln	%g7,	%o7,	%o3
	edge8l	%l2,	%i3,	%o4
	bcc,pn	%icc,	loop_2131
	fbn	%fcc3,	loop_2132
	srlx	%i6,	0x0A,	%l6
	bpos,a	loop_2133
loop_2131:
	tge	%xcc,	0x3
loop_2132:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x26] %asi,	%i7
loop_2133:
	tsubcctv	%l4,	0x04C2,	%i5
	for	%f0,	%f18,	%f6
	edge32n	%g1,	%i2,	%o6
	alignaddr	%l1,	%o0,	%g6
	ba,a,pt	%icc,	loop_2134
	alignaddrl	%o2,	%l5,	%o1
	srl	%g2,	0x18,	%i0
	fcmpne16	%f18,	%f6,	%g4
loop_2134:
	swap	[%l7 + 0x20],	%i1
	fbul,a	%fcc1,	loop_2135
	tle	%icc,	0x7
	edge8n	%g3,	%l0,	%o5
	fmovse	%xcc,	%f22,	%f19
loop_2135:
	movvs	%icc,	%i4,	%l3
	nop
	set	0x70, %i6
	stw	%g5,	[%l7 + %i6]
	array32	%o7,	%g7,	%l2
	ldub	[%l7 + 0x22],	%o3
	smul	%o4,	0x1CD9,	%i3
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	tsubcctv	%i6,	%l4,	%i7
	fba,a	%fcc3,	loop_2136
	bcs	%icc,	loop_2137
	edge32	%i5,	%g1,	%o6
	add	%i2,	%l1,	%o0
loop_2136:
	xnor	%o2,	%g6,	%o1
loop_2137:
	nop
	fitod	%f8,	%f4
	fdtoi	%f4,	%f27
	subcc	%g2,	%i0,	%g4
	set	0x7C, %g4
	lduba	[%l7 + %g4] 0x10,	%i1
	tvs	%icc,	0x4
	array8	%g3,	%l5,	%o5
	set	0x40, %g7
	stda	%f0,	[%l7 + %g7] 0x04
	nop
	setx	0x746E77B58061A189,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	movvc	%icc,	%l0,	%l3
	pdist	%f4,	%f4,	%f16
	ta	%xcc,	0x5
	fmul8x16au	%f6,	%f24,	%f12
	umulcc	%g5,	%o7,	%i4
	fcmpgt32	%f26,	%f4,	%g7
	set	0x70, %o6
	ldsba	[%l7 + %o6] 0x81,	%o3
	taddcctv	%o4,	0x0D1D,	%i3
	set	0x50, %o7
	ldda	[%l7 + %o7] 0x80,	%i6
	movrne	%l2,	0x246,	%l4
	fone	%f6
	bcs,a	%xcc,	loop_2138
	tsubcctv	%i7,	%i6,	%g1
	udivcc	%i5,	0x1148,	%o6
	edge8l	%l1,	%i2,	%o2
loop_2138:
	sra	%g6,	0x18,	%o1
	tcs	%icc,	0x2
	movn	%xcc,	%g2,	%i0
	array32	%g4,	%o0,	%i1
	fmovsg	%icc,	%f28,	%f30
	nop
	setx	0x27E5D8BE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x58B876D5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f14,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l5,	0x0257,	%o5
	sra	%g3,	%l3,	%l0
	mulx	%o7,	0x064B,	%g5
	fxnors	%f24,	%f28,	%f1
	fmuld8ulx16	%f10,	%f30,	%f24
	std	%f28,	[%l7 + 0x40]
	addcc	%i4,	0x0642,	%g7
	nop
	fitos	%f3,	%f0
	fstox	%f0,	%f6
	ta	%icc,	0x6
	mulscc	%o4,	0x1DB0,	%o3
	bne,pt	%icc,	loop_2139
	fcmpeq16	%f6,	%f12,	%l6
	fmovdvs	%xcc,	%f0,	%f6
	popc	0x0EB1,	%i3
loop_2139:
	movgu	%xcc,	%l2,	%i7
	tcc	%icc,	0x0
	fmovsleu	%xcc,	%f24,	%f8
	fxnor	%f28,	%f14,	%f28
	fbug,a	%fcc2,	loop_2140
	or	%i6,	%g1,	%l4
	tsubcc	%o6,	%i5,	%i2
	te	%icc,	0x2
loop_2140:
	mulx	%l1,	0x0B3D,	%o2
	bpos,a,pn	%icc,	loop_2141
	movl	%icc,	%g6,	%g2
	fxnor	%f12,	%f6,	%f8
	umulcc	%o1,	%g4,	%i0
loop_2141:
	fmovdl	%xcc,	%f28,	%f8
	nop
	setx	0xE71ED21C15ADB1E2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x9D068A84B81D3908,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f6,	%f24
	ldx	[%l7 + 0x50],	%i1
	edge16	%o0,	%l5,	%o5
	movl	%icc,	%l3,	%g3
	fmovsneg	%icc,	%f27,	%f0
	sethi	0x0198,	%o7
	movneg	%icc,	%g5,	%l0
	sethi	0x0887,	%i4
	membar	0x0E
	array16	%o4,	%g7,	%l6
	set	0x48, %g5
	lda	[%l7 + %g5] 0x11,	%f8
	udiv	%o3,	0x0073,	%i3
	mulx	%l2,	0x0AB4,	%i6
	sir	0x00C7
	std	%f30,	[%l7 + 0x08]
	fmovdl	%xcc,	%f22,	%f3
	movrgez	%g1,	0x1AE,	%i7
	bgu,a,pt	%xcc,	loop_2142
	orn	%l4,	0x017C,	%i5
	tvc	%icc,	0x3
	addccc	%o6,	0x1F53,	%i2
loop_2142:
	xnor	%o2,	%g6,	%g2
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%o1
	fmul8x16al	%f8,	%f1,	%f24
	bleu,pn	%xcc,	loop_2143
	tge	%xcc,	0x6
	alignaddr	%l1,	%g4,	%i0
	add	%l7,	0x08,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] %asi,	%i1,	%l5
loop_2143:
	brnz,a	%o0,	loop_2144
	orncc	%o5,	%l3,	%o7
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
loop_2144:
	orcc	%g5,	0x0456,	%l0
	addccc	%i4,	0x0C50,	%o4
	tvc	%icc,	0x4
	bgu,a	loop_2145
	fbule,a	%fcc1,	loop_2146
	addcc	%l6,	0x1218,	%g7
	fmovsl	%xcc,	%f26,	%f0
loop_2145:
	array32	%i3,	%l2,	%o3
loop_2146:
	tneg	%xcc,	0x1
	movvc	%icc,	%g1,	%i7
	edge8n	%i6,	%i5,	%o6
	movvc	%xcc,	%l4,	%i2
	fmovdvc	%icc,	%f10,	%f30
	fmovdn	%icc,	%f9,	%f24
	edge32	%o2,	%g6,	%o1
	fnors	%f11,	%f15,	%f22
	tsubcctv	%l1,	%g4,	%g2
	array16	%i1,	%i0,	%o0
	fabss	%f3,	%f21
	taddcctv	%l5,	0x181F,	%l3
	movle	%icc,	%o5,	%o7
	fpsub16s	%f23,	%f19,	%f31
	movvc	%icc,	%g3,	%g5
	array32	%l0,	%i4,	%l6
	edge32l	%g7,	%i3,	%o4
	nop
	set	0x3E, %l0
	sth	%l2,	[%l7 + %l0]
	movvc	%xcc,	%o3,	%i7
	andncc	%i6,	%g1,	%o6
	srlx	%i5,	0x13,	%l4
	fmovrdlz	%o2,	%f20,	%f16
	ldsw	[%l7 + 0x0C],	%i2
	stbar
	fmovd	%f14,	%f12
	prefetch	[%l7 + 0x54],	 0x1
	umulcc	%g6,	%o1,	%g4
	umulcc	%g2,	0x09C8,	%i1
	taddcc	%l1,	0x1999,	%o0
	te	%icc,	0x0
	bcs,a,pn	%xcc,	loop_2147
	sllx	%i0,	0x17,	%l3
	orcc	%o5,	0x11BF,	%o7
	srlx	%l5,	0x0B,	%g5
loop_2147:
	tpos	%xcc,	0x0
	tne	%xcc,	0x5
	smulcc	%l0,	%i4,	%g3
	smul	%l6,	0x0153,	%i3
	ba,a	%xcc,	loop_2148
	nop
	setx	loop_2149,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdvs	%icc,	%f22,	%f7
	xnorcc	%g7,	%l2,	%o4
loop_2148:
	tvs	%icc,	0x4
loop_2149:
	nop
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%o3,	%i7
	fxnor	%f30,	%f18,	%f4
	brz,a	%g1,	loop_2150
	fandnot2	%f8,	%f4,	%f0
	fandnot1	%f28,	%f20,	%f8
	set	0x70, %g6
	lda	[%l7 + %g6] 0x18,	%f15
loop_2150:
	fbue	%fcc0,	loop_2151
	fpsub32	%f6,	%f14,	%f18
	andn	%i6,	%o6,	%i5
	fnegd	%f6,	%f4
loop_2151:
	movg	%icc,	%l4,	%o2
	fcmpne16	%f18,	%f28,	%g6
	movpos	%icc,	%o1,	%i2
	array32	%g4,	%g2,	%i1
	orncc	%o0,	0x0A27,	%i0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l1
	casa	[%l6] %asi,	%l1,	%o5
	sra	%o7,	0x1D,	%l3
	array16	%l5,	%g5,	%l0
	smulcc	%i4,	%l6,	%i3
	movneg	%xcc,	%g7,	%l2
	nop
	setx	0xC5D13A17,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xF88EA5FA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fsubs	%f4,	%f8,	%f1
	brlz,a	%g3,	loop_2152
	sll	%o3,	0x08,	%o4
	bcc,pt	%xcc,	loop_2153
	popc	0x0BB9,	%i7
loop_2152:
	edge32l	%i6,	%o6,	%g1
	udivcc	%l4,	0x08EA,	%i5
loop_2153:
	nop
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x40] %asi,	%o2
	edge8l	%g6,	%o1,	%g4
	tvs	%xcc,	0x4
	udivcc	%i2,	0x1F52,	%g2
	addcc	%i1,	0x0E3A,	%o0
	fnand	%f28,	%f30,	%f24
	stbar
	set	0x28, %o3
	stba	%l1,	[%l7 + %o3] 0x80
	movpos	%xcc,	%i0,	%o7
	orncc	%o5,	0x1718,	%l3
	edge8ln	%g5,	%l5,	%i4
	movne	%icc,	%l6,	%i3
	tge	%xcc,	0x5
	tsubcctv	%g7,	%l0,	%l2
	tge	%xcc,	0x6
	nop
	fitos	%f13,	%f14
	fstod	%f14,	%f12
	fbge,a	%fcc3,	loop_2154
	fmovs	%f6,	%f28
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x48] %asi,	%f9
loop_2154:
	movrgez	%g3,	%o4,	%i7
	tsubcc	%i6,	0x10D5,	%o6
	addc	%o3,	0x03A2,	%g1
	fbue,a	%fcc3,	loop_2155
	nop
	setx	0x97A992E130701A35,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	xnorcc	%l4,	%i5,	%g6
	ta	%icc,	0x7
loop_2155:
	udivcc	%o1,	0x0A28,	%g4
	tl	%xcc,	0x1
	sir	0x0D88
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o2,	%i2,	%g2
	edge32l	%i1,	%o0,	%i0
	fpadd32	%f8,	%f12,	%f0
	fbg	%fcc0,	loop_2156
	add	%o7,	0x0EA3,	%l1
	movg	%xcc,	%l3,	%g5
	tneg	%icc,	0x6
loop_2156:
	xnorcc	%o5,	0x123E,	%i4
	sll	%l5,	%i3,	%l6
	fors	%f13,	%f22,	%f16
	andcc	%g7,	%l0,	%g3
	tg	%xcc,	0x7
	alignaddr	%l2,	%o4,	%i6
	tvs	%icc,	0x0
	movrlz	%o6,	0x03C,	%i7
	bl,a,pn	%xcc,	loop_2157
	movleu	%xcc,	%g1,	%o3
	brgz,a	%l4,	loop_2158
	edge16ln	%i5,	%o1,	%g6
loop_2157:
	fmovs	%f30,	%f2
	sra	%o2,	0x07,	%g4
loop_2158:
	fpackfix	%f12,	%f9
	sdivx	%i2,	0x1165,	%g2
	movl	%icc,	%o0,	%i0
	addccc	%i1,	0x1639,	%o7
	fandnot1s	%f21,	%f10,	%f17
	fbo	%fcc0,	loop_2159
	sub	%l3,	0x16FE,	%g5
	tneg	%xcc,	0x7
	subc	%l1,	%i4,	%o5
loop_2159:
	movl	%icc,	%l5,	%i3
	tcs	%icc,	0x6
	lduw	[%l7 + 0x7C],	%g7
	flush	%l7 + 0x44
	fmovdleu	%xcc,	%f24,	%f0
	sdiv	%l6,	0x0CC8,	%g3
	ldd	[%l7 + 0x78],	%f26
	mulx	%l2,	%o4,	%i6
	edge32	%o6,	%l0,	%g1
	fbu	%fcc3,	loop_2160
	move	%icc,	%i7,	%o3
	fnot2s	%f3,	%f6
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l4,	%o1
loop_2160:
	bvs	%icc,	loop_2161
	fbu,a	%fcc3,	loop_2162
	ldub	[%l7 + 0x56],	%g6
	pdist	%f28,	%f14,	%f0
loop_2161:
	edge32	%o2,	%i5,	%g4
loop_2162:
	mova	%icc,	%g2,	%i2
	xor	%o0,	%i0,	%i1
	nop
	setx	loop_2163,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	fitos	%f10,	%f13
	fstod	%f13,	%f12
	srl	%o7,	0x14,	%l3
	set	0x6A, %o4
	ldsha	[%l7 + %o4] 0x04,	%g5
loop_2163:
	nop
	setx loop_2164, %l0, %l1
	jmpl %l1, %l1
	fmovrsgez	%i4,	%f14,	%f6
	movcs	%xcc,	%o5,	%i3
	fnot2s	%f27,	%f17
loop_2164:
	orn	%g7,	0x0010,	%l5
	tleu	%icc,	0x1
	movrne	%l6,	0x27B,	%g3
	movre	%l2,	%o4,	%i6
	nop
	setx	0xAFB30447EAC105FD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x01AC413DD8092F80,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f0,	%f24
	edge16l	%o6,	%l0,	%g1
	fabsd	%f8,	%f22
	sir	0x1E4D
	tpos	%icc,	0x5
	srax	%o3,	%i7,	%l4
	brgz,a	%g6,	loop_2165
	stbar
	movleu	%xcc,	%o1,	%i5
	array16	%o2,	%g4,	%g2
loop_2165:
	umulcc	%i2,	%o0,	%i1
	tne	%icc,	0x1
	fone	%f12
	srl	%i0,	%o7,	%g5
	fmovrsne	%l3,	%f14,	%f28
	movn	%icc,	%l1,	%o5
	xnorcc	%i3,	%g7,	%i4
	addcc	%l5,	%g3,	%l2
	nop
	setx	loop_2166,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ba,a,pn	%xcc,	loop_2167
	fpadd32	%f20,	%f24,	%f10
	smulcc	%l6,	%i6,	%o4
loop_2166:
	fble,a	%fcc3,	loop_2168
loop_2167:
	tge	%xcc,	0x0
	movleu	%xcc,	%l0,	%o6
	smulcc	%o3,	0x18A9,	%g1
loop_2168:
	movne	%icc,	%i7,	%l4
	ldd	[%l7 + 0x40],	%g6
	tl	%xcc,	0x4
	mulscc	%i5,	0x06DC,	%o2
	nop
	setx	0x007665BC,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	sdiv	%o1,	0x1737,	%g2
	udivcc	%g4,	0x0FAE,	%o0
	movvs	%xcc,	%i1,	%i0
	fnot1s	%f13,	%f1
	nop
	fitod	%f2,	%f0
	fdtox	%f0,	%f26
	addc	%o7,	0x018D,	%i2
	nop
	setx	0x51DFC14F63048EB0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x680CAD9AE20D9DFE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f18,	%f18
	edge32l	%g5,	%l3,	%o5
	edge32n	%i3,	%g7,	%l1
	array8	%l5,	%i4,	%g3
	edge32n	%l2,	%l6,	%o4
	tsubcctv	%l0,	%i6,	%o3
	fblg,a	%fcc0,	loop_2169
	fbg,a	%fcc2,	loop_2170
	sdivcc	%g1,	0x0DD7,	%i7
	nop
	setx	0x4E7CC38D7BBD7826,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xAB87F66FB3E038DD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f2,	%f24
loop_2169:
	ba	loop_2171
loop_2170:
	ldd	[%l7 + 0x70],	%l4
	array8	%o6,	%g6,	%i5
	mulx	%o2,	0x0108,	%g2
loop_2171:
	fmovdne	%icc,	%f2,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o1,	%o0
	subccc	%i1,	%g4,	%i0
	fmovsleu	%xcc,	%f28,	%f7
	fpsub32s	%f24,	%f22,	%f31
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	movgu	%icc,	%g5,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l3,	%o5
	srl	%g7,	0x0D,	%i3
	umul	%l5,	0x10CD,	%l1
	sll	%i4,	%g3,	%l2
	ldx	[%l7 + 0x68],	%l6
	fornot1s	%f18,	%f7,	%f0
	stb	%l0,	[%l7 + 0x65]
	orn	%o4,	%o3,	%g1
	fsrc2	%f2,	%f12
	fpack16	%f16,	%f31
	tneg	%icc,	0x2
	pdist	%f0,	%f8,	%f0
	bcc	loop_2172
	fnot1s	%f24,	%f28
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x34] %asi,	%i6
loop_2172:
	tleu	%icc,	0x0
	fnegs	%f1,	%f17
	udivcc	%i7,	0x014E,	%l4
	fbge,a	%fcc1,	loop_2173
	srlx	%o6,	0x09,	%g6
	fxors	%f11,	%f28,	%f0
	fmul8sux16	%f14,	%f0,	%f16
loop_2173:
	smulcc	%o2,	0x04EA,	%i5
	tne	%icc,	0x6
	movvc	%icc,	%o1,	%o0
	sir	0x0C6B
	tleu	%icc,	0x6
	udivcc	%i1,	0x1CC6,	%g2
	fzero	%f6
	set	0x10, %o1
	ldxa	[%g0 + %o1] 0x20,	%i0
	bgu,a	%icc,	loop_2174
	faligndata	%f20,	%f26,	%f20
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g4
loop_2174:
	mulscc	%g5,	%i2,	%l3
	sethi	0x0667,	%o7
	srl	%o5,	0x0C,	%g7
	tg	%icc,	0x6
	for	%f18,	%f6,	%f2
	edge32l	%l5,	%l1,	%i3
	edge8	%g3,	%i4,	%l2
	nop
	fitod	%f30,	%f20
	orcc	%l6,	0x183F,	%o4
	taddcctv	%o3,	0x1376,	%g1
	umul	%l0,	%i7,	%l4
	movcc	%xcc,	%i6,	%g6
	edge32n	%o6,	%o2,	%o1
	fmovrdlez	%o0,	%f10,	%f28
	fbu	%fcc1,	loop_2175
	andcc	%i1,	%i5,	%g2
	brlez	%g4,	loop_2176
	movrgz	%g5,	0x0C3,	%i2
loop_2175:
	swap	[%l7 + 0x08],	%i0
	tgu	%icc,	0x5
loop_2176:
	andncc	%l3,	%o5,	%g7
	movrlz	%l5,	0x1E9,	%o7
	array32	%l1,	%g3,	%i4
	xor	%l2,	0x04F6,	%l6
	lduh	[%l7 + 0x68],	%o4
	ldd	[%l7 + 0x50],	%i2
	udivx	%g1,	0x17A5,	%l0
	set	0x4C, %g3
	ldsha	[%l7 + %g3] 0x89,	%i7
	xnor	%o3,	%i6,	%l4
	movn	%icc,	%g6,	%o6
	movle	%xcc,	%o1,	%o2
	alignaddr	%i1,	%i5,	%o0
	fandnot2	%f22,	%f22,	%f6
	sdivx	%g4,	0x0BB6,	%g5
	sll	%g2,	0x1D,	%i0
	wr	%g0,	0x11,	%asi
	lda	[%l7 + 0x50] %asi,	%f9
	sllx	%l3,	%i2,	%g7
	sethi	0x1782,	%o5
	addcc	%o7,	0x0BAD,	%l1
	movrlz	%g3,	0x2A1,	%l5
	membar	0x45
	fpadd16s	%f4,	%f28,	%f16
	edge16n	%l2,	%l6,	%o4
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x60] %asi,	%i2
	fmovs	%f9,	%f5
	movleu	%icc,	%i4,	%l0
	move	%icc,	%i7,	%o3
	edge8ln	%i6,	%g1,	%l4
	fbl,a	%fcc2,	loop_2177
	fmovrdgz	%g6,	%f2,	%f28
	alignaddr	%o1,	%o6,	%o2
	stbar
loop_2177:
	ldd	[%l7 + 0x18],	%i0
	brz	%o0,	loop_2178
	fbne,a	%fcc0,	loop_2179
	movne	%icc,	%i5,	%g4
	movvc	%icc,	%g5,	%g2
loop_2178:
	fmuld8sux16	%f17,	%f17,	%f6
loop_2179:
	fpadd16s	%f17,	%f4,	%f11
	or	%i0,	0x1F39,	%l3
	fbu,a	%fcc0,	loop_2180
	umulcc	%i2,	0x139D,	%o5
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
loop_2180:
	movl	%icc,	%l1,	%g7
	tne	%icc,	0x7
	te	%icc,	0x6
	movcc	%xcc,	%g3,	%l2
	smulcc	%l6,	%o4,	%l5
	brlz	%i4,	loop_2181
	edge16	%i3,	%i7,	%l0
	bn,a,pn	%icc,	loop_2182
	andncc	%i6,	%g1,	%l4
loop_2181:
	alignaddrl	%o3,	%o1,	%o6
	edge8ln	%g6,	%o2,	%i1
loop_2182:
	subc	%i5,	%o0,	%g4
	popc	0x0E10,	%g2
	fornot2	%f18,	%f28,	%f24
	or	%i0,	0x194D,	%g5
	tcs	%icc,	0x4
	fpack16	%f10,	%f14
	movg	%xcc,	%i2,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f22,	%f15,	%f14
	tvc	%xcc,	0x3
	fba,a	%fcc2,	loop_2183
	mova	%xcc,	%o7,	%o5
	move	%xcc,	%g7,	%l1
	movneg	%xcc,	%l2,	%l6
loop_2183:
	mulscc	%g3,	%o4,	%l5
	orn	%i4,	0x05AD,	%i7
	bshuffle	%f8,	%f0,	%f24
	movvc	%xcc,	%l0,	%i3
	edge16l	%g1,	%l4,	%o3
	fnegd	%f28,	%f10
	add	%l7,	0x44,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%o1,	%o6
	edge32ln	%g6,	%i6,	%o2
	brgz	%i1,	loop_2184
	addc	%o0,	%g4,	%i5
	tn	%xcc,	0x1
	edge32n	%g2,	%g5,	%i0
loop_2184:
	array32	%i2,	%o7,	%o5
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x10,	%f16
	fcmple16	%f22,	%f24,	%l3
	sra	%l1,	0x0A,	%g7
	movle	%icc,	%l6,	%g3
	mova	%icc,	%o4,	%l5
	edge8ln	%l2,	%i4,	%l0
	brz,a	%i7,	loop_2185
	nop
	fitod	%f20,	%f22
	bvs,a	loop_2186
	bgu,a	loop_2187
loop_2185:
	movrlez	%i3,	%g1,	%l4
	movle	%icc,	%o3,	%o6
loop_2186:
	nop
	set	0x30, %o0
	lduba	[%l7 + %o0] 0x0c,	%o1
loop_2187:
	fpmerge	%f14,	%f26,	%f12
	movcs	%xcc,	%i6,	%g6
	bleu,a	loop_2188
	udivx	%i1,	0x0C9D,	%o2
	fmovdleu	%xcc,	%f8,	%f13
	movcc	%xcc,	%o0,	%i5
loop_2188:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	edge16ln	%g2,	%g4,	%i0
	subc	%g5,	0x1EA2,	%o7
	movvc	%icc,	%o5,	%i2
	brgez,a	%l1,	loop_2189
	fand	%f14,	%f20,	%f4
	add	%g7,	0x04EB,	%l6
	xnor	%l3,	%o4,	%g3
loop_2189:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bg,a,pt	%icc,	loop_2190
	tsubcc	%l2,	%i4,	%l5
	fxnor	%f20,	%f30,	%f20
	bgu,a	%xcc,	loop_2191
loop_2190:
	udivx	%i7,	0x114B,	%l0
	bvc	loop_2192
	tsubcctv	%i3,	%g1,	%o3
loop_2191:
	movre	%o6,	0x080,	%l4
	smul	%i6,	%o1,	%i1
loop_2192:
	fsrc1	%f16,	%f16
	bcc,a,pt	%icc,	loop_2193
	fnors	%f30,	%f14,	%f29
	set	0x10, %i3
	ldxa	[%l7 + %i3] 0x14,	%g6
loop_2193:
	edge32l	%o2,	%i5,	%o0
	srl	%g4,	0x1D,	%g2
	tvc	%icc,	0x3
	nop
	fitos	%f15,	%f19
	fsrc1	%f14,	%f8
	orncc	%g5,	0x06FE,	%o7
	set	0x108, %l3
	ldxa	[%g0 + %l3] 0x52,	%o5
	tg	%xcc,	0x1
	movg	%icc,	%i2,	%i0
	movneg	%xcc,	%g7,	%l6
	fnand	%f18,	%f26,	%f20
	ta	%xcc,	0x0
	move	%xcc,	%l3,	%l1
	edge8n	%o4,	%g3,	%i4
	fbn,a	%fcc1,	loop_2194
	tleu	%icc,	0x2
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x0c,	%f0
loop_2194:
	bne,pn	%xcc,	loop_2195
	fbe	%fcc3,	loop_2196
	orncc	%l2,	0x076E,	%i7
	movl	%xcc,	%l0,	%i3
loop_2195:
	prefetch	[%l7 + 0x30],	 0x1
loop_2196:
	edge32l	%l5,	%g1,	%o6
	sethi	0x08A4,	%o3
	nop
	setx	loop_2197,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbul	%fcc2,	loop_2198
	fmul8x16al	%f25,	%f12,	%f4
	sub	%l4,	%o1,	%i1
loop_2197:
	tge	%xcc,	0x6
loop_2198:
	nop
	set	0x66, %l4
	lduha	[%l7 + %l4] 0x11,	%g6
	sdivcc	%i6,	0x1D27,	%i5
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x7B] %asi,	%o0
	orncc	%o2,	0x1EB8,	%g4
	movcc	%xcc,	%g2,	%o7
	xor	%o5,	%g5,	%i2
	fbue	%fcc0,	loop_2199
	nop
	fitod	%f18,	%f20
	fandnot1s	%f20,	%f20,	%f31
	edge8n	%g7,	%i0,	%l3
loop_2199:
	fnot1s	%f14,	%f6
	fones	%f3
	tpos	%icc,	0x0
	andcc	%l6,	%o4,	%g3
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x89
	tg	%xcc,	0x7
	tle	%xcc,	0x0
	fbo,a	%fcc3,	loop_2200
	ba,pn	%icc,	loop_2201
	movre	%i4,	0x2EA,	%l2
	fba,a	%fcc0,	loop_2202
loop_2200:
	alignaddrl	%l1,	%l0,	%i3
loop_2201:
	tneg	%icc,	0x6
	movcc	%xcc,	%l5,	%g1
loop_2202:
	fxnor	%f20,	%f26,	%f6
	sdivcc	%i7,	0x01E4,	%o6
	nop
	fitos	%f31,	%f4
	andcc	%o3,	0x1D34,	%o1
	edge16l	%l4,	%i1,	%i6
	set	0x26, %i2
	stba	%i5,	[%l7 + %i2] 0x11
	fzeros	%f28
	brz,a	%g6,	loop_2203
	edge16ln	%o0,	%o2,	%g2
	fmovdvc	%icc,	%f14,	%f11
	sll	%g4,	0x09,	%o7
loop_2203:
	fnands	%f23,	%f23,	%f24
	umul	%o5,	0x0D53,	%i2
	fbule	%fcc3,	loop_2204
	movleu	%xcc,	%g5,	%g7
	sra	%i0,	0x15,	%l3
	tge	%icc,	0x5
loop_2204:
	fmovsne	%icc,	%f25,	%f3
	xorcc	%o4,	0x167B,	%g3
	ldsw	[%l7 + 0x18],	%l6
	ldub	[%l7 + 0x2E],	%l2
	taddcctv	%l1,	0x1F88,	%i4
	mova	%icc,	%l0,	%l5
	nop
	fitod	%f4,	%f8
	fdtox	%f8,	%f20
	fxtod	%f20,	%f18
	fbug,a	%fcc3,	loop_2205
	te	%xcc,	0x6
	movl	%icc,	%i3,	%g1
	movrgez	%o6,	%o3,	%i7
loop_2205:
	xnorcc	%l4,	0x0468,	%o1
	and	%i6,	0x141B,	%i5
	bl,a	loop_2206
	nop
	setx	0x505F8CA7,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	taddcctv	%g6,	%o0,	%i1
	udivx	%g2,	0x1272,	%g4
loop_2206:
	movcs	%xcc,	%o7,	%o2
	nop
	setx loop_2207, %l0, %l1
	jmpl %l1, %o5
	sdiv	%g5,	0x1AE5,	%g7
	fbule,a	%fcc2,	loop_2208
	sethi	0x03A1,	%i0
loop_2207:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2208:
	mova	%xcc,	%i2,	%o4
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x70] %asi,	%g3
	addc	%l3,	0x1F92,	%l6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x4B] %asi,	%l2
	tvs	%xcc,	0x7
	smulcc	%l1,	0x070D,	%i4
	bne,a	loop_2209
	srax	%l0,	%l5,	%i3
	fcmpne32	%f8,	%f10,	%g1
	array8	%o6,	%o3,	%l4
loop_2209:
	sdivcc	%o1,	0x1E4D,	%i7
	be,a	%icc,	loop_2210
	nop
	set	0x6F, %o5
	ldub	[%l7 + %o5],	%i6
	tge	%icc,	0x4
	fbule,a	%fcc2,	loop_2211
loop_2210:
	edge32	%g6,	%o0,	%i1
	fmovdvc	%xcc,	%f17,	%f18
	movrne	%g2,	0x221,	%i5
loop_2211:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o7,	0x2D3,	%o2
	bneg,a,pn	%xcc,	loop_2212
	udiv	%g4,	0x01F0,	%o5
	or	%g5,	%i0,	%i2
	movl	%icc,	%g7,	%o4
loop_2212:
	fpsub16	%f14,	%f12,	%f28
	ldsw	[%l7 + 0x14],	%l3
	nop
	setx	0x3CF837F71050B454,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	ld	[%l7 + 0x40],	%f14
	taddcc	%l6,	%g3,	%l2
	movge	%icc,	%i4,	%l1
	brlez	%l5,	loop_2213
	nop
	setx	0xEDA4288F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x173C07D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fsubs	%f20,	%f2,	%f17
	movrne	%i3,	0x2FE,	%l0
	udivx	%o6,	0x004F,	%o3
loop_2213:
	bn,pt	%icc,	loop_2214
	movneg	%xcc,	%g1,	%l4
	movle	%xcc,	%i7,	%o1
	umulcc	%i6,	%o0,	%g6
loop_2214:
	nop
	setx	0x105C00C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	membar	0x50
	fornot1s	%f5,	%f28,	%f0
	fmovrdne	%i1,	%f28,	%f6
	set	0x7C, %i5
	lduha	[%l7 + %i5] 0x11,	%g2
	stbar
	fbe,a	%fcc3,	loop_2215
	sllx	%i5,	%o7,	%o2
	bgu,a	loop_2216
	bge,pn	%xcc,	loop_2217
loop_2215:
	bleu	loop_2218
	fbuge	%fcc0,	loop_2219
loop_2216:
	movrlz	%o5,	0x0A0,	%g5
loop_2217:
	movge	%icc,	%g4,	%i2
loop_2218:
	fmovspos	%icc,	%f31,	%f22
loop_2219:
	fmul8x16	%f30,	%f28,	%f8
	ldd	[%l7 + 0x78],	%f30
	fmul8x16al	%f13,	%f10,	%f16
	swap	[%l7 + 0x38],	%g7
	edge8n	%i0,	%l3,	%l6
	fmovdvs	%icc,	%f29,	%f23
	xor	%o4,	%g3,	%i4
	sethi	0x1024,	%l2
	movrgez	%l1,	0x3B6,	%l5
	fmovrsne	%l0,	%f24,	%f28
	taddcc	%i3,	0x0411,	%o3
	fornot1	%f10,	%f10,	%f2
	wr	%g0,	0xea,	%asi
	stxa	%o6,	[%l7 + 0x70] %asi
	membar	#Sync
	orn	%l4,	0x1F55,	%i7
	nop
	fitos	%f20,	%f5
	ld	[%l7 + 0x30],	%f2
	movg	%xcc,	%o1,	%i6
	fmovrdlz	%o0,	%f2,	%f24
	for	%f2,	%f0,	%f2
	ble	loop_2220
	subcc	%g6,	%i1,	%g2
	udivx	%g1,	0x1C4E,	%i5
	tleu	%xcc,	0x4
loop_2220:
	move	%xcc,	%o7,	%o2
	tn	%xcc,	0x7
	movcc	%icc,	%g5,	%g4
	nop
	setx	0x64061C9081C724E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x6141AD2D4AAB7FDA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f12,	%f22
	membar	0x54
	tle	%xcc,	0x4
	call	loop_2221
	ld	[%l7 + 0x38],	%f3
	lduw	[%l7 + 0x08],	%o5
	fbu	%fcc0,	loop_2222
loop_2221:
	fmovsleu	%xcc,	%f22,	%f23
	edge16l	%i2,	%i0,	%g7
	movn	%icc,	%l3,	%o4
loop_2222:
	nop
	fitos	%f10,	%f1
	fstox	%f1,	%f22
	fxtos	%f22,	%f12
	movre	%l6,	0x15F,	%g3
	mulscc	%i4,	0x0FCE,	%l2
	fnands	%f8,	%f7,	%f25
	set	0x28, %i0
	prefetcha	[%l7 + %i0] 0x14,	 0x0
	movrlz	%l0,	0x0AE,	%i3
	mova	%icc,	%o3,	%o6
	tg	%xcc,	0x6
	fmovsneg	%icc,	%f31,	%f1
	smul	%l1,	0x1106,	%l4
	fabss	%f24,	%f21
	sir	0x0127
	srax	%i7,	0x0B,	%o1
	brz,a	%o0,	loop_2223
	move	%xcc,	%i6,	%g6
	add	%i1,	0x01A5,	%g1
	bne,a,pt	%icc,	loop_2224
loop_2223:
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f14
	fbuge	%fcc1,	loop_2225
	tleu	%icc,	0x1
loop_2224:
	movcc	%xcc,	%g2,	%o7
	tl	%xcc,	0x0
loop_2225:
	movre	%i5,	0x1EC,	%o2
	movvc	%icc,	%g5,	%g4
	fmovrsgz	%i2,	%f11,	%f2
	fpadd32s	%f31,	%f6,	%f10
	fmovdcc	%icc,	%f6,	%f31
	fba,a	%fcc1,	loop_2226
	tg	%icc,	0x1
	bl,a,pt	%xcc,	loop_2227
	fmuld8sux16	%f10,	%f21,	%f16
loop_2226:
	addc	%i0,	%o5,	%g7
	addc	%l3,	%o4,	%g3
loop_2227:
	edge16l	%i4,	%l2,	%l5
	brnz,a	%l6,	loop_2228
	array32	%l0,	%i3,	%o6
	faligndata	%f20,	%f2,	%f14
	call	loop_2229
loop_2228:
	move	%xcc,	%l1,	%l4
	edge8	%i7,	%o1,	%o3
	nop
	set	0x4C, %l2
	lduw	[%l7 + %l2],	%o0
loop_2229:
	fones	%f1
	fmovdcc	%xcc,	%f26,	%f11
	addc	%g6,	0x0910,	%i6
	nop
	setx	loop_2230,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovd	%f24,	%f18
	subccc	%g1,	%g2,	%i1
	nop
	fitos	%f7,	%f3
	fstoi	%f3,	%f31
loop_2230:
	stb	%i5,	[%l7 + 0x0A]
	te	%icc,	0x5
	fcmpne16	%f14,	%f10,	%o7
	bne,a,pt	%xcc,	loop_2231
	movneg	%icc,	%g5,	%o2
	srl	%g4,	%i2,	%o5
	fbne,a	%fcc0,	loop_2232
loop_2231:
	alignaddrl	%i0,	%g7,	%o4
	stx	%l3,	[%l7 + 0x18]
	fmovsa	%xcc,	%f8,	%f8
loop_2232:
	tg	%icc,	0x0
	fpackfix	%f22,	%f27
	movne	%icc,	%i4,	%g3
	bne,a	loop_2233
	edge16n	%l2,	%l6,	%l5
	movg	%xcc,	%i3,	%o6
	xnor	%l0,	0x0F62,	%l4
loop_2233:
	fbg,a	%fcc3,	loop_2234
	fbg	%fcc2,	loop_2235
	fmovrdlez	%l1,	%f12,	%f8
	edge32l	%i7,	%o1,	%o3
loop_2234:
	nop
	set	0x30, %o2
	stx	%o0,	[%l7 + %o2]
loop_2235:
	movvs	%icc,	%g6,	%g1
	set	0x56, %g2
	lduba	[%l7 + %g2] 0x88,	%g2
	bvc,a	loop_2236
	fexpand	%f6,	%f0
	movrlz	%i6,	%i5,	%i1
	fpackfix	%f16,	%f10
loop_2236:
	fbue,a	%fcc2,	loop_2237
	fsrc2	%f22,	%f0
	fpack32	%f24,	%f2,	%f30
	wr	%g0,	0x0c,	%asi
	stba	%g5,	[%l7 + 0x0E] %asi
loop_2237:
	or	%o7,	0x0F4B,	%o2
	fmovsle	%xcc,	%f29,	%f13
	subccc	%g4,	0x1E8F,	%i2
	xorcc	%o5,	%g7,	%i0
	movg	%xcc,	%l3,	%o4
	fabsd	%f18,	%f8
	movrne	%i4,	%l2,	%l6
	tsubcc	%l5,	0x1838,	%g3
	subccc	%i3,	0x1544,	%o6
	ldx	[%l7 + 0x10],	%l0
	andn	%l1,	%i7,	%o1
	movrgz	%l4,	0x072,	%o3
	fandnot2	%f2,	%f8,	%f4
	smulcc	%o0,	%g1,	%g6
	fmovdle	%icc,	%f29,	%f31
	ba,a	loop_2238
	sdiv	%i6,	0x1F61,	%i5
	sth	%i1,	[%l7 + 0x08]
	tleu	%icc,	0x1
loop_2238:
	fsrc2s	%f31,	%f17
	edge16	%g5,	%o7,	%o2
	sra	%g2,	0x12,	%g4
	sra	%i2,	0x1B,	%g7
	fbn,a	%fcc3,	loop_2239
	tleu	%icc,	0x1
	fmuld8ulx16	%f26,	%f31,	%f24
	tne	%icc,	0x7
loop_2239:
	edge32ln	%i0,	%l3,	%o5
	subcc	%i4,	0x1D37,	%l2
	tge	%xcc,	0x2
	tleu	%xcc,	0x6
	edge16	%o4,	%l6,	%g3
	nop
	setx	0xB8CD0E2C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x009D61A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f18,	%f3
	fmovdvc	%icc,	%f26,	%f29
	xor	%i3,	%o6,	%l0
	edge16n	%l1,	%l5,	%i7
	tpos	%xcc,	0x4
	sdivcc	%o1,	0x1E7A,	%o3
	fpadd32	%f12,	%f8,	%f4
	prefetch	[%l7 + 0x44],	 0x3
	movrlez	%l4,	0x13C,	%g1
	edge32ln	%o0,	%i6,	%g6
	fpsub16	%f12,	%f12,	%f12
	mova	%icc,	%i5,	%i1
	st	%f21,	[%l7 + 0x10]
	udivcc	%g5,	0x1F42,	%o2
	fmovsgu	%icc,	%f28,	%f18
	flush	%l7 + 0x24
	tneg	%icc,	0x4
	subcc	%g2,	0x05FB,	%o7
	fmovdcs	%icc,	%f21,	%f4
	bg,pn	%icc,	loop_2240
	tne	%icc,	0x5
	subccc	%i2,	%g4,	%i0
	movrlz	%g7,	0x3F5,	%l3
loop_2240:
	alignaddr	%o5,	%i4,	%l2
	sethi	0x00E9,	%l6
	fbuge,a	%fcc2,	loop_2241
	lduh	[%l7 + 0x0E],	%o4
	movrgz	%g3,	0x08C,	%i3
	set	0x78, %l5
	sta	%f2,	[%l7 + %l5] 0x10
loop_2241:
	nop
	setx	loop_2242,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sth	%o6,	[%l7 + 0x44]
	bleu,a	%xcc,	loop_2243
	fmovsge	%xcc,	%f31,	%f31
loop_2242:
	xor	%l1,	%l5,	%i7
	umul	%o1,	0x1205,	%l0
loop_2243:
	tneg	%xcc,	0x3
	fornot1	%f24,	%f22,	%f20
	edge32	%o3,	%l4,	%g1
	udivx	%o0,	0x137E,	%i6
	std	%f0,	[%l7 + 0x10]
	subccc	%i5,	0x03A6,	%i1
	udiv	%g5,	0x0A51,	%o2
	movvc	%xcc,	%g6,	%o7
	set	0x36, %l1
	ldsha	[%l7 + %l1] 0x04,	%g2
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%g4
	smulcc	%i2,	%g7,	%i0
	edge16ln	%l3,	%i4,	%o5
	movrgez	%l6,	%o4,	%l2
	mulx	%g3,	%o6,	%l1
	mova	%icc,	%l5,	%i7
	andcc	%i3,	%o1,	%l0
	and	%l4,	0x1B76,	%o3
	fble,a	%fcc3,	loop_2244
	fbul,a	%fcc3,	loop_2245
	bleu,a	loop_2246
	mulx	%g1,	0x07A1,	%o0
loop_2244:
	edge8n	%i6,	%i1,	%i5
loop_2245:
	fmovdge	%xcc,	%f1,	%f10
loop_2246:
	subcc	%o2,	%g6,	%g5
	ldd	[%l7 + 0x40],	%f16
	and	%g2,	%o7,	%g4
	call	loop_2247
	edge16	%g7,	%i2,	%i0
	fors	%f25,	%f31,	%f29
	orn	%i4,	%l3,	%o5
loop_2247:
	addccc	%l6,	%l2,	%o4
	fbge,a	%fcc3,	loop_2248
	xor	%g3,	0x1CD7,	%o6
	orncc	%l5,	%i7,	%i3
	movre	%l1,	0x043,	%o1
loop_2248:
	taddcctv	%l4,	0x0464,	%o3
	fnands	%f12,	%f6,	%f21
	swap	[%l7 + 0x40],	%g1
	nop
	setx	0x504FC96D,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	movrne	%l0,	0x2C4,	%i6
	movcs	%xcc,	%i1,	%o0
	umulcc	%o2,	0x0602,	%i5
	xorcc	%g6,	0x1CB4,	%g5
	tcs	%xcc,	0x5
	tsubcc	%o7,	%g2,	%g7
	fcmpne16	%f2,	%f4,	%g4
	set	0x78, %g1
	stxa	%i0,	[%l7 + %g1] 0x2a
	membar	#Sync
	movl	%icc,	%i2,	%l3
	orn	%i4,	0x1EF0,	%l6
	edge8l	%o5,	%l2,	%o4
	fmovdge	%icc,	%f28,	%f13
	mova	%xcc,	%g3,	%o6
	nop
	fitos	%f3,	%f3
	fstox	%f3,	%f22
	fxtos	%f22,	%f5
	sllx	%i7,	%i3,	%l5
	fmovdl	%icc,	%f7,	%f13
	fbn	%fcc3,	loop_2249
	fmuld8ulx16	%f15,	%f15,	%f18
	subc	%l1,	0x0B2B,	%o1
	fxor	%f12,	%f2,	%f30
loop_2249:
	movvc	%xcc,	%l4,	%g1
	nop
	set	0x0E, %i6
	stb	%l0,	[%l7 + %i6]
	tneg	%icc,	0x1
	fba,a	%fcc2,	loop_2250
	umul	%o3,	%i1,	%o0
	udivx	%o2,	0x1DCF,	%i5
	movne	%xcc,	%g6,	%i6
loop_2250:
	fpadd32	%f30,	%f10,	%f28
	ble,a	%xcc,	loop_2251
	array8	%o7,	%g2,	%g7
	stbar
	lduh	[%l7 + 0x52],	%g5
loop_2251:
	nop
	setx	0x707D0B10,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	tvs	%icc,	0x7
	movneg	%icc,	%i0,	%i2
	bneg,pt	%icc,	loop_2252
	tcc	%xcc,	0x3
	movg	%icc,	%l3,	%g4
	orcc	%i4,	%o5,	%l6
loop_2252:
	nop
	setx	0x407E3FFA,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fpsub32	%f2,	%f12,	%f6
	fxnors	%f1,	%f16,	%f23
	smul	%l2,	%g3,	%o6
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x44] %asi,	%i7
	move	%xcc,	%i3,	%l5
	srlx	%l1,	%o4,	%o1
	set	0x2C, %g4
	stha	%g1,	[%l7 + %g4] 0x23
	membar	#Sync
	fbge,a	%fcc3,	loop_2253
	movle	%icc,	%l0,	%o3
	sdiv	%i1,	0x1F23,	%l4
	prefetch	[%l7 + 0x08],	 0x3
loop_2253:
	fbue,a	%fcc1,	loop_2254
	fmovrslez	%o0,	%f16,	%f3
	bn,a,pt	%icc,	loop_2255
	popc	0x0C7E,	%i5
loop_2254:
	array32	%g6,	%o2,	%o7
	tg	%xcc,	0x3
loop_2255:
	nop
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movne	%xcc,	%g2,	%i6
	bl,a,pn	%icc,	loop_2256
	tcc	%icc,	0x5
	umulcc	%g5,	0x0FD8,	%i0
	ble,pn	%icc,	loop_2257
loop_2256:
	movgu	%xcc,	%g7,	%i2
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
loop_2257:
	ta	%xcc,	0x4
	taddcctv	%g4,	0x1F3E,	%i4
	sdiv	%l6,	0x0303,	%o5
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x26] %asi,	%l2
	fmul8sux16	%f8,	%f22,	%f4
	tsubcctv	%o6,	%i7,	%g3
	udivx	%l5,	0x0BD1,	%l1
	orcc	%i3,	%o4,	%o1
	andn	%g1,	%l0,	%i1
	addc	%l4,	0x0CFE,	%o0
	smul	%o3,	0x0C4E,	%g6
	sdivx	%i5,	0x1DCE,	%o7
	bpos	loop_2258
	fbug	%fcc1,	loop_2259
	sra	%o2,	%g2,	%i6
	tn	%icc,	0x0
loop_2258:
	nop
	setx	loop_2260,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2259:
	subc	%g5,	0x13EC,	%i0
	movn	%icc,	%g7,	%i2
	nop
	setx loop_2261, %l0, %l1
	jmpl %l1, %g4
loop_2260:
	smulcc	%i4,	0x0731,	%l6
	edge32l	%l3,	%o5,	%l2
	edge16n	%o6,	%i7,	%l5
loop_2261:
	mulscc	%l1,	0x0CC9,	%g3
	movge	%xcc,	%i3,	%o4
	nop
	fitod	%f4,	%f24
	fdtoi	%f24,	%f1
	bpos	loop_2262
	fbe,a	%fcc1,	loop_2263
	lduw	[%l7 + 0x14],	%g1
	srl	%o1,	%l0,	%l4
loop_2262:
	tcc	%xcc,	0x2
loop_2263:
	fbul	%fcc1,	loop_2264
	addccc	%o0,	0x1411,	%o3
	addccc	%i1,	0x16E6,	%i5
	add	%g6,	0x08FD,	%o2
loop_2264:
	xorcc	%o7,	%i6,	%g2
	set	0x6C, %g7
	lduha	[%l7 + %g7] 0x80,	%i0
	movle	%xcc,	%g5,	%g7
	sdivcc	%g4,	0x1AF7,	%i2
	ta	%xcc,	0x3
	subcc	%l6,	%i4,	%l3
	tpos	%icc,	0x7
	edge8	%o5,	%l2,	%o6
	xnor	%l5,	%i7,	%l1
	set	0x3E, %i7
	ldsba	[%l7 + %i7] 0x15,	%i3
	movre	%g3,	%g1,	%o1
	ldsh	[%l7 + 0x58],	%l0
	movcc	%icc,	%l4,	%o4
	fnor	%f6,	%f20,	%f8
	movrlez	%o0,	%i1,	%o3
	popc	%g6,	%o2
	std	%f12,	[%l7 + 0x18]
	tvs	%icc,	0x6
	flush	%l7 + 0x48
	taddcctv	%i5,	%o7,	%g2
	movn	%xcc,	%i6,	%i0
	bl,pn	%icc,	loop_2265
	bpos,a,pt	%icc,	loop_2266
	xnor	%g7,	%g5,	%i2
	addc	%g4,	%i4,	%l3
loop_2265:
	nop
	wr	%g0,	0xea,	%asi
	stba	%l6,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2266:
	subcc	%l2,	%o5,	%o6
	fabsd	%f14,	%f24
	fmovscs	%icc,	%f0,	%f5
	addccc	%i7,	0x158B,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x72],	%i3
	fbne,a	%fcc0,	loop_2267
	move	%icc,	%g3,	%l5
	fblg	%fcc0,	loop_2268
	fmovspos	%icc,	%f30,	%f29
loop_2267:
	bn,pn	%icc,	loop_2269
	fands	%f13,	%f12,	%f12
loop_2268:
	edge8n	%g1,	%o1,	%l0
	mulx	%l4,	%o4,	%o0
loop_2269:
	fbn,a	%fcc1,	loop_2270
	ba	loop_2271
	flush	%l7 + 0x4C
	nop
	setx	0xAC170E77,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x769C92C8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f4,	%f24
loop_2270:
	tne	%icc,	0x5
loop_2271:
	move	%xcc,	%o3,	%i1
	edge8l	%g6,	%i5,	%o2
	edge32n	%o7,	%i6,	%g2
	fmovdn	%icc,	%f17,	%f20
	fmul8sux16	%f22,	%f18,	%f30
	orcc	%i0,	0x04DB,	%g5
	fbul,a	%fcc0,	loop_2272
	stbar
	edge32	%g7,	%i2,	%g4
	fmovdvs	%icc,	%f10,	%f5
loop_2272:
	fmovscc	%icc,	%f1,	%f15
	fxors	%f7,	%f19,	%f0
	tge	%icc,	0x1
	srlx	%l3,	0x01,	%i4
	smul	%l2,	0x07ED,	%o5
	brz	%l6,	loop_2273
	swap	[%l7 + 0x24],	%i7
	pdist	%f0,	%f12,	%f18
	fmovde	%icc,	%f23,	%f26
loop_2273:
	udivcc	%o6,	0x1770,	%i3
	addccc	%g3,	0x1EC5,	%l1
	andncc	%g1,	%o1,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l5,	%l4,	%o4
	brnz	%o3,	loop_2274
	smulcc	%i1,	%o0,	%g6
	nop
	fitod	%f10,	%f16
	fdtox	%f16,	%f30
	fxtod	%f30,	%f28
	fmuld8ulx16	%f9,	%f26,	%f4
loop_2274:
	fcmple32	%f12,	%f2,	%o2
	fmovsneg	%xcc,	%f5,	%f24
	edge16n	%o7,	%i6,	%i5
	edge16ln	%i0,	%g5,	%g7
	pdist	%f26,	%f18,	%f26
	fornot2	%f28,	%f22,	%f20
	wr	%g0,	0x89,	%asi
	sta	%f3,	[%l7 + 0x60] %asi
	tcc	%xcc,	0x4
	fbu	%fcc2,	loop_2275
	andcc	%g2,	%g4,	%l3
	subcc	%i2,	%l2,	%o5
	nop
	fitos	%f9,	%f10
	fstoi	%f10,	%f15
loop_2275:
	membar	0x4C
	fnands	%f10,	%f30,	%f14
	andcc	%l6,	0x0D7F,	%i7
	xnorcc	%o6,	%i4,	%i3
	fabsd	%f0,	%f2
	array16	%g3,	%g1,	%o1
	fnot2s	%f7,	%f30
	subccc	%l1,	%l0,	%l4
	fcmpgt32	%f14,	%f30,	%o4
	swap	[%l7 + 0x70],	%o3
	fand	%f18,	%f12,	%f30
	edge16	%l5,	%o0,	%g6
	wr	%g0,	0x88,	%asi
	sta	%f5,	[%l7 + 0x54] %asi
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x14,	%f0
	edge32	%i1,	%o7,	%i6
	movle	%icc,	%o2,	%i0
	movneg	%icc,	%i5,	%g7
	movg	%xcc,	%g5,	%g4
	smul	%l3,	%i2,	%g2
	edge16n	%o5,	%l2,	%l6
	brlez,a	%i7,	loop_2276
	nop
	fitos	%f18,	%f19
	nop
	setx	0xAECED308B8B6EB81,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xDA148019DC8686E5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f24,	%f16
	addc	%i4,	%o6,	%i3
loop_2276:
	edge16	%g1,	%g3,	%l1
	fmuld8sux16	%f5,	%f31,	%f20
	tl	%xcc,	0x2
	fcmple32	%f2,	%f4,	%o1
	nop
	setx	loop_2277,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	brgz,a	%l4,	loop_2278
	orcc	%l0,	%o4,	%o3
	tge	%icc,	0x2
loop_2277:
	fbu	%fcc3,	loop_2279
loop_2278:
	fmovrdgez	%l5,	%f12,	%f8
	movleu	%xcc,	%o0,	%g6
	brz,a	%i1,	loop_2280
loop_2279:
	fornot1s	%f5,	%f24,	%f12
	movcs	%icc,	%o7,	%o2
	ldsw	[%l7 + 0x18],	%i0
loop_2280:
	movre	%i6,	%g7,	%g5
	edge8l	%g4,	%i5,	%l3
	edge8ln	%g2,	%o5,	%i2
	nop
	fitos	%f14,	%f5
	fstox	%f5,	%f10
	xnor	%l2,	%i7,	%l6
	te	%xcc,	0x7
	fbn,a	%fcc1,	loop_2281
	edge16n	%i4,	%o6,	%i3
	set	0x70, %g5
	stxa	%g1,	[%l7 + %g5] 0x2b
	membar	#Sync
loop_2281:
	fmovscs	%icc,	%f25,	%f2
	brlez,a	%l1,	loop_2282
	movcc	%icc,	%g3,	%l4
	fpack16	%f6,	%f25
	sllx	%l0,	0x18,	%o4
loop_2282:
	stb	%o3,	[%l7 + 0x14]
	set	0x50, %l0
	ldxa	[%l7 + %l0] 0x15,	%o1
	mova	%icc,	%o0,	%l5
	edge8l	%g6,	%i1,	%o7
	membar	#Sync
	set	0x40, %o7
	ldda	[%l7 + %o7] 0xf1,	%f0
	and	%o2,	0x09FE,	%i6
	movvs	%xcc,	%i0,	%g5
	umulcc	%g4,	0x0601,	%g7
	fornot2s	%f29,	%f21,	%f5
	fmovsvs	%xcc,	%f6,	%f5
	fmovrse	%l3,	%f2,	%f0
	brnz,a	%g2,	loop_2283
	swap	[%l7 + 0x58],	%o5
	fpack16	%f2,	%f18
	alignaddr	%i2,	%i5,	%i7
loop_2283:
	fmovdn	%xcc,	%f8,	%f19
	orcc	%l2,	0x029D,	%i4
	sethi	0x0E65,	%o6
	bne,a	%xcc,	loop_2284
	fmovsn	%icc,	%f8,	%f25
	fandnot2	%f2,	%f8,	%f8
	mulx	%i3,	%g1,	%l6
loop_2284:
	movrgez	%l1,	%g3,	%l0
	nop
	setx	0x90DE25FBCEE5854E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f28
	edge8	%o4,	%o3,	%o1
	fmovscs	%icc,	%f5,	%f31
	tg	%xcc,	0x3
	orncc	%o0,	0x0B71,	%l5
	xor	%g6,	%l4,	%i1
	array8	%o2,	%o7,	%i6
	smulcc	%g5,	%g4,	%g7
	umulcc	%l3,	0x1D5F,	%g2
	edge8	%o5,	%i0,	%i2
	stb	%i5,	[%l7 + 0x3A]
	fpack32	%f20,	%f16,	%f22
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x6C] %asi,	%l2
	tpos	%xcc,	0x4
	edge16	%i7,	%i4,	%o6
	sll	%i3,	%l6,	%l1
	umulcc	%g3,	%l0,	%o4
	movpos	%xcc,	%g1,	%o3
	set	0x1C, %o3
	lda	[%l7 + %o3] 0x89,	%f2
	bcs,a	%xcc,	loop_2285
	fandnot1s	%f3,	%f3,	%f14
	set	0x0, %g6
	stxa	%o0,	[%g0 + %g6] 0x57
loop_2285:
	edge16n	%o1,	%l5,	%g6
	tneg	%xcc,	0x6
	nop
	setx	0xEB7E6D3A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x9981E010,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f13,	%f12
	for	%f28,	%f26,	%f8
	nop
	fitod	%f0,	%f20
	fdtox	%f20,	%f2
	srlx	%l4,	0x09,	%o2
	fpadd16	%f0,	%f12,	%f18
	prefetch	[%l7 + 0x48],	 0x2
	bgu,a,pt	%icc,	loop_2286
	brnz,a	%i1,	loop_2287
	xnorcc	%i6,	0x00D7,	%g5
	fmovdne	%xcc,	%f18,	%f24
loop_2286:
	fmovdcc	%icc,	%f6,	%f26
loop_2287:
	fcmpne16	%f14,	%f8,	%o7
	fmovsneg	%xcc,	%f30,	%f1
	flush	%l7 + 0x0C
	ldsb	[%l7 + 0x5F],	%g4
	stx	%l3,	[%l7 + 0x50]
	nop
	setx	0x52241182B07E5829,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	sub	%g7,	0x1493,	%o5
	srax	%g2,	0x02,	%i2
	fmovda	%icc,	%f8,	%f29
	xor	%i0,	0x0CD8,	%i5
	movle	%xcc,	%l2,	%i4
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f10
	fxtod	%f10,	%f22
	fmovrsne	%o6,	%f14,	%f16
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x0C] %asi,	%f2
	taddcctv	%i3,	0x0569,	%l6
	movneg	%xcc,	%i7,	%g3
	array32	%l0,	%o4,	%g1
	brnz	%l1,	loop_2288
	fmovrsgz	%o3,	%f2,	%f30
	fbg,a	%fcc3,	loop_2289
	ldsw	[%l7 + 0x28],	%o0
loop_2288:
	ble	loop_2290
	edge16	%o1,	%g6,	%l5
loop_2289:
	fbug,a	%fcc2,	loop_2291
	edge32l	%l4,	%i1,	%i6
loop_2290:
	fpsub16	%f10,	%f12,	%f8
	edge32ln	%g5,	%o2,	%o7
loop_2291:
	srax	%g4,	0x1A,	%l3
	fpackfix	%f8,	%f6
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x70] %asi,	 0x2
	bl,a,pn	%icc,	loop_2292
	xorcc	%o5,	0x085E,	%g2
	sra	%i2,	%i5,	%l2
	udivx	%i4,	0x0E28,	%i0
loop_2292:
	brgez,a	%o6,	loop_2293
	bcc	loop_2294
	fpack32	%f22,	%f2,	%f20
	fbug	%fcc0,	loop_2295
loop_2293:
	movn	%xcc,	%i3,	%l6
loop_2294:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x4C] %asi,	%f2
loop_2295:
	fmuld8ulx16	%f2,	%f18,	%f28
	tsubcc	%g3,	%l0,	%i7
	ba,pn	%xcc,	loop_2296
	srlx	%g1,	0x0E,	%o4
	fble	%fcc2,	loop_2297
	fpsub32	%f16,	%f2,	%f2
loop_2296:
	fmovrdgez	%l1,	%f24,	%f10
	bne,pt	%xcc,	loop_2298
loop_2297:
	tgu	%icc,	0x7
	set	0x60, %o4
	sta	%f13,	[%l7 + %o4] 0x11
loop_2298:
	move	%icc,	%o3,	%o0
	movne	%xcc,	%o1,	%l5
	sllx	%g6,	0x01,	%i1
	movge	%xcc,	%l4,	%g5
	tleu	%icc,	0x1
	fmovrse	%i6,	%f11,	%f17
	fbu	%fcc0,	loop_2299
	xor	%o2,	0x06B3,	%g4
	move	%icc,	%l3,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2299:
	addccc	%g7,	%g2,	%o5
	fsrc1s	%f6,	%f2
	array32	%i2,	%i5,	%i4
	tvs	%icc,	0x7
	movge	%xcc,	%l2,	%o6
	fblg	%fcc3,	loop_2300
	for	%f24,	%f30,	%f2
	move	%xcc,	%i3,	%i0
	array16	%l6,	%l0,	%g3
loop_2300:
	and	%i7,	0x0705,	%g1
	srlx	%o4,	%o3,	%o0
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fornot2s	%f0,	%f21,	%f18
	fbule	%fcc3,	loop_2301
	fors	%f24,	%f16,	%f3
	nop
	setx	0xCB9E5B3E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xC4F2606B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fdivs	%f23,	%f31,	%f25
	sdivcc	%l1,	0x0BAD,	%l5
loop_2301:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x2
	fmovrslez	%g6,	%f1,	%f2
	tgu	%xcc,	0x1
	bl,pt	%icc,	loop_2302
	movl	%xcc,	%o1,	%l4
	sllx	%g5,	%i1,	%o2
	taddcc	%i6,	%l3,	%g4
loop_2302:
	taddcc	%o7,	%g7,	%o5
	edge8l	%i2,	%g2,	%i4
	fblg,a	%fcc1,	loop_2303
	orncc	%i5,	0x0DE4,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbl,a	%fcc2,	loop_2304
loop_2303:
	popc	%l2,	%i3
	bleu,a,pt	%xcc,	loop_2305
	xor	%l6,	%l0,	%g3
loop_2304:
	edge8l	%i7,	%g1,	%o4
	add	%o3,	0x06E9,	%i0
loop_2305:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu,a	%fcc3,	loop_2306
	movrlez	%o0,	%l5,	%g6
	fcmpeq16	%f22,	%f22,	%l1
	edge16l	%o1,	%g5,	%i1
loop_2306:
	fzero	%f22
	subccc	%l4,	0x022F,	%i6
	sub	%o2,	0x0B24,	%g4
	fsrc1	%f14,	%f10
	and	%l3,	%g7,	%o7
	edge8ln	%i2,	%o5,	%g2
	set	0x12, %g3
	stha	%i4,	[%l7 + %g3] 0x88
	tleu	%xcc,	0x6
	movl	%xcc,	%o6,	%i5
	mulx	%l2,	%i3,	%l0
	fmovrdgz	%g3,	%f20,	%f2
	brgez	%i7,	loop_2307
	umul	%l6,	0x12B7,	%g1
	be,a	%xcc,	loop_2308
	movcc	%xcc,	%o3,	%i0
loop_2307:
	movre	%o0,	0x3EF,	%o4
	ldx	[%l7 + 0x40],	%l5
loop_2308:
	nop
	setx	0x26DD3C139713A40C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x92844B0967340B96,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f0,	%f10
	edge16ln	%l1,	%g6,	%g5
	edge16n	%o1,	%l4,	%i6
	fbne	%fcc2,	loop_2309
	fnand	%f4,	%f6,	%f26
	sra	%o2,	0x1A,	%i1
	nop
	setx	0xA7F2A83CC0551A8B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_2309:
	st	%f21,	[%l7 + 0x20]
	tgu	%xcc,	0x2
	fnot1	%f20,	%f18
	movl	%icc,	%l3,	%g4
	bgu	loop_2310
	fpadd16s	%f0,	%f8,	%f0
	taddcc	%o7,	0x13E9,	%g7
	fble	%fcc3,	loop_2311
loop_2310:
	fmovse	%xcc,	%f20,	%f23
	tvs	%xcc,	0x3
	tcs	%icc,	0x5
loop_2311:
	edge16ln	%i2,	%g2,	%o5
	movrlez	%i4,	0x3AD,	%i5
	bgu,pt	%icc,	loop_2312
	flush	%l7 + 0x78
	taddcc	%l2,	%o6,	%i3
	edge8ln	%l0,	%i7,	%l6
loop_2312:
	movg	%icc,	%g3,	%o3
	smul	%g1,	0x17AA,	%i0
	edge8l	%o0,	%l5,	%o4
	ble,a	%icc,	loop_2313
	movneg	%xcc,	%l1,	%g5
	movre	%o1,	%g6,	%i6
	sethi	0x1AE9,	%l4
loop_2313:
	bge,pn	%xcc,	loop_2314
	call	loop_2315
	movre	%o2,	0x2F8,	%l3
	wr	%g0,	0x27,	%asi
	stha	%g4,	[%l7 + 0x64] %asi
	membar	#Sync
loop_2314:
	tle	%icc,	0x1
loop_2315:
	fbug	%fcc2,	loop_2316
	orcc	%i1,	%g7,	%i2
	popc	0x19C7,	%g2
	movcs	%icc,	%o7,	%o5
loop_2316:
	prefetch	[%l7 + 0x54],	 0x3
	taddcctv	%i4,	0x0E1B,	%i5
	tcs	%xcc,	0x1
	srlx	%l2,	%i3,	%o6
	nop
	setx	loop_2317,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%l0,	0x1012,	%l6
	fmovse	%icc,	%f21,	%f15
	tg	%icc,	0x7
loop_2317:
	nop
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x2
	taddcctv	%o3,	%g1,	%i0
	fmovrsne	%g3,	%f10,	%f12
	nop
	setx	0xF7AB0837F37EAA08,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB494D9C9F9A573CD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f16,	%f20
	sethi	0x14E5,	%l5
	nop
	setx	loop_2318,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tcs	%xcc,	0x1
	tgu	%xcc,	0x3
	bgu,pn	%icc,	loop_2319
loop_2318:
	nop
	set	0x1C, %o1
	ldsw	[%l7 + %o1],	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x7C],	%o0
loop_2319:
	fmovdne	%xcc,	%f30,	%f29
	ba	%icc,	loop_2320
	udiv	%l1,	0x1F44,	%g5
	fbu,a	%fcc2,	loop_2321
	sth	%g6,	[%l7 + 0x66]
loop_2320:
	stbar
	fornot1	%f4,	%f30,	%f22
loop_2321:
	movne	%icc,	%o1,	%l4
	ldub	[%l7 + 0x6E],	%o2
	tcs	%xcc,	0x0
	fmovrdne	%i6,	%f20,	%f26
	andcc	%l3,	0x07F8,	%i1
	umul	%g7,	%g4,	%i2
	andncc	%g2,	%o7,	%i4
	movne	%xcc,	%i5,	%l2
	fones	%f20
	nop
	setx	loop_2322,	%l0,	%l1
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
	bneg,pn	%icc,	loop_2323
	fbue,a	%fcc2,	loop_2324
loop_2322:
	tgu	%icc,	0x5
	ble	%xcc,	loop_2325
loop_2323:
	movleu	%xcc,	%o5,	%o6
loop_2324:
	addccc	%i3,	0x0FFE,	%l6
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f4
	fxtod	%f4,	%f18
loop_2325:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bneg,a	loop_2326
	andn	%i7,	0x1B52,	%l0
	bleu	%icc,	loop_2327
	umul	%o3,	0x0C5B,	%i0
loop_2326:
	edge8n	%g1,	%g3,	%l5
	sra	%o0,	0x02,	%o4
loop_2327:
	brgez	%g5,	loop_2328
	nop
	fitod	%f2,	%f26
	fdtoi	%f26,	%f15
	fbn	%fcc0,	loop_2329
	subccc	%l1,	0x1401,	%o1
loop_2328:
	fbu,a	%fcc0,	loop_2330
	andn	%g6,	%l4,	%i6
loop_2329:
	te	%xcc,	0x1
	movg	%icc,	%o2,	%i1
loop_2330:
	addccc	%g7,	%l3,	%g4
	array32	%i2,	%g2,	%o7
	fbule	%fcc0,	loop_2331
	movrne	%i5,	0x1FD,	%i4
	sra	%l2,	0x12,	%o6
	andn	%i3,	0x0F30,	%o5
loop_2331:
	nop
	wr	%g0,	0x0c,	%asi
	stha	%l6,	[%l7 + 0x74] %asi
	fmovrse	%i7,	%f10,	%f16
	fbul,a	%fcc1,	loop_2332
	te	%xcc,	0x0
	movrne	%o3,	%i0,	%l0
	fbul,a	%fcc3,	loop_2333
loop_2332:
	udivx	%g1,	0x1D54,	%l5
	subccc	%g3,	0x0DCE,	%o0
	edge8	%g5,	%l1,	%o1
loop_2333:
	andn	%g6,	0x11A2,	%o4
	array32	%l4,	%o2,	%i1
	array8	%i6,	%g7,	%g4
	movne	%icc,	%i2,	%g2
	movvs	%icc,	%o7,	%l3
	fbe	%fcc1,	loop_2334
	move	%xcc,	%i5,	%i4
	std	%f30,	[%l7 + 0x38]
	mulx	%o6,	%l2,	%o5
loop_2334:
	smul	%l6,	0x0026,	%i7
	orn	%o3,	0x042D,	%i0
	brnz,a	%i3,	loop_2335
	tne	%xcc,	0x2
	tcc	%xcc,	0x1
	tn	%xcc,	0x2
loop_2335:
	sll	%g1,	%l5,	%g3
	brgez,a	%o0,	loop_2336
	fnot2	%f14,	%f10
	movrlz	%g5,	0x213,	%l0
	edge8	%l1,	%o1,	%g6
loop_2336:
	mulx	%l4,	0x1CA1,	%o2
	fmovd	%f16,	%f10
	movge	%xcc,	%i1,	%o4
	fmovrdne	%g7,	%f2,	%f30
	array32	%i6,	%g4,	%i2
	fornot1	%f6,	%f20,	%f18
	movcs	%xcc,	%g2,	%l3
	ldx	[%l7 + 0x20],	%o7
	be	%icc,	loop_2337
	ble,a	loop_2338
	ldsh	[%l7 + 0x12],	%i4
	sub	%i5,	%o6,	%o5
loop_2337:
	nop
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x7A] %asi,	%l6
loop_2338:
	nop
	set	0x58, %l6
	swapa	[%l7 + %l6] 0x10,	%i7
	sdiv	%o3,	0x0B48,	%l2
	movge	%icc,	%i0,	%i3
	movvc	%icc,	%g1,	%g3
	set	0x10, %o0
	ldswa	[%l7 + %o0] 0x88,	%o0
	taddcctv	%l5,	%l0,	%g5
	set	0x10, %l3
	ldda	[%l7 + %l3] 0x19,	%o0
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fornot1	%f30,	%f12,	%f14
	edge32ln	%g6,	%l4,	%o2
	tleu	%icc,	0x7
	ldd	[%l7 + 0x40],	%l0
	fands	%f28,	%f22,	%f0
	umul	%i1,	%g7,	%o4
	set	0x0E, %i3
	ldstuba	[%l7 + %i3] 0x19,	%i6
	tpos	%icc,	0x7
	movvs	%xcc,	%i2,	%g2
	udivx	%l3,	0x1A15,	%o7
	tge	%icc,	0x3
	udivx	%g4,	0x0BAB,	%i5
	tg	%xcc,	0x7
	fba,a	%fcc1,	loop_2339
	movre	%o6,	0x153,	%i4
	mulscc	%l6,	0x09C2,	%o5
	subccc	%i7,	%l2,	%o3
loop_2339:
	tcs	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i0,	%i3,	%g3
	be,a	%xcc,	loop_2340
	edge8n	%o0,	%l5,	%l0
	nop
	setx	loop_2341,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16l	%g5,	%g1,	%o1
loop_2340:
	ldstub	[%l7 + 0x11],	%l4
	tcs	%icc,	0x3
loop_2341:
	movrne	%o2,	%g6,	%i1
	set	0x2C, %l4
	lda	[%l7 + %l4] 0x10,	%f2
	tpos	%xcc,	0x3
	tsubcc	%l1,	%g7,	%o4
	nop
	setx	0x00DF0B7FC2E345F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x47F94291386351AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f0,	%f20
	fble,a	%fcc1,	loop_2342
	movgu	%icc,	%i6,	%i2
	fbn	%fcc3,	loop_2343
	udiv	%l3,	0x1AE9,	%g2
loop_2342:
	fblg	%fcc1,	loop_2344
	fbn	%fcc1,	loop_2345
loop_2343:
	fbue	%fcc1,	loop_2346
	movge	%xcc,	%g4,	%o7
loop_2344:
	add	%i5,	0x1183,	%i4
loop_2345:
	fcmple32	%f20,	%f18,	%l6
loop_2346:
	brlez,a	%o5,	loop_2347
	mova	%xcc,	%i7,	%o6
	movrgez	%l2,	%i0,	%o3
	subc	%g3,	%i3,	%l5
loop_2347:
	add	%o0,	0x1E11,	%l0
	array32	%g5,	%g1,	%o1
	fbug	%fcc2,	loop_2348
	tgu	%icc,	0x3
	sub	%l4,	%g6,	%i1
	te	%xcc,	0x0
loop_2348:
	fba,a	%fcc2,	loop_2349
	bvc,a,pn	%icc,	loop_2350
	fbu,a	%fcc3,	loop_2351
	andcc	%o2,	%g7,	%o4
loop_2349:
	smul	%l1,	%i6,	%l3
loop_2350:
	movrne	%g2,	0x2AE,	%i2
loop_2351:
	edge16	%g4,	%i5,	%i4
	fbul,a	%fcc1,	loop_2352
	call	loop_2353
	bpos	loop_2354
	array8	%l6,	%o5,	%o7
loop_2352:
	udiv	%o6,	0x072B,	%i7
loop_2353:
	fmovd	%f4,	%f0
loop_2354:
	tleu	%icc,	0x1
	move	%icc,	%l2,	%i0
	srax	%g3,	%i3,	%l5
	edge16n	%o0,	%l0,	%g5
	xor	%o3,	0x1EFF,	%g1
	bvc,a	%xcc,	loop_2355
	lduw	[%l7 + 0x20],	%l4
	array16	%g6,	%o1,	%o2
	nop
	fitos	%f2,	%f25
	fstox	%f25,	%f18
	fxtos	%f18,	%f20
loop_2355:
	fpadd16s	%f15,	%f21,	%f25
	mulscc	%g7,	%o4,	%i1
	membar	0x57
	fpsub16s	%f8,	%f5,	%f31
	umul	%l1,	%l3,	%i6
	bge	loop_2356
	tsubcctv	%i2,	%g2,	%g4
	fpsub16s	%f27,	%f26,	%f10
	movle	%xcc,	%i4,	%i5
loop_2356:
	fmovde	%xcc,	%f23,	%f26
	move	%xcc,	%l6,	%o7
	taddcc	%o6,	%i7,	%o5
	movne	%xcc,	%l2,	%i0
	tleu	%xcc,	0x1
	bl,a,pt	%xcc,	loop_2357
	movvs	%icc,	%g3,	%i3
	mulscc	%o0,	%l5,	%g5
	edge8l	%o3,	%g1,	%l4
loop_2357:
	subccc	%g6,	%o1,	%o2
	movrne	%l0,	0x111,	%g7
	fbul,a	%fcc0,	loop_2358
	call	loop_2359
	sub	%i1,	%o4,	%l1
	call	loop_2360
loop_2358:
	tvc	%xcc,	0x5
loop_2359:
	mova	%xcc,	%i6,	%i2
	bvs	%xcc,	loop_2361
loop_2360:
	tl	%icc,	0x2
	call	loop_2362
	popc	%l3,	%g2
loop_2361:
	movrgez	%g4,	0x10C,	%i5
	fsrc2s	%f0,	%f28
loop_2362:
	fmovse	%icc,	%f27,	%f13
	movgu	%xcc,	%l6,	%i4
	umulcc	%o7,	0x0C3E,	%o6
	subc	%i7,	%l2,	%i0
	popc	%g3,	%o5
	movrgez	%i3,	0x218,	%l5
	array16	%g5,	%o0,	%o3
	fble,a	%fcc3,	loop_2363
	taddcc	%l4,	0x0640,	%g1
	edge8n	%g6,	%o2,	%o1
	or	%g7,	0x12FF,	%l0
loop_2363:
	movgu	%xcc,	%o4,	%i1
	xor	%i6,	%i2,	%l1
	sdiv	%g2,	0x0922,	%g4
	bcc,a,pt	%xcc,	loop_2364
	fmul8x16al	%f1,	%f0,	%f30
	array8	%i5,	%l3,	%i4
	movle	%icc,	%l6,	%o7
loop_2364:
	nop
	set	0x20, %i1
	prefetcha	[%l7 + %i1] 0x14,	 0x3
	stb	%l2,	[%l7 + 0x6C]
	popc	0x0FF8,	%i0
	smul	%g3,	%o5,	%i3
	fbl	%fcc1,	loop_2365
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tneg	%xcc,	0x5
	fbue	%fcc2,	loop_2366
loop_2365:
	array32	%o6,	%g5,	%o0
	movrgez	%l5,	0x1F9,	%l4
	stw	%g1,	[%l7 + 0x18]
loop_2366:
	nop
	wr	%g0,	0x80,	%asi
	stba	%o3,	[%l7 + 0x7C] %asi
	bpos,pt	%icc,	loop_2367
	edge8l	%g6,	%o1,	%g7
	movg	%xcc,	%l0,	%o4
	set	0x50, %i2
	lda	[%l7 + %i2] 0x14,	%f30
loop_2367:
	movre	%o2,	0x254,	%i1
	edge8	%i6,	%l1,	%g2
	orcc	%i2,	0x0CDA,	%i5
	sir	0x0716
	lduw	[%l7 + 0x28],	%l3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%l6
	sethi	0x10BA,	%o7
	subcc	%g4,	0x1E37,	%l2
	nop
	fitos	%f11,	%f31
	set	0x46, %i4
	lduba	[%l7 + %i4] 0x81,	%i0
	and	%g3,	%i7,	%i3
	addc	%o5,	0x1A47,	%o6
	stx	%g5,	[%l7 + 0x50]
	tcs	%icc,	0x6
	orncc	%o0,	%l4,	%l5
	ldsh	[%l7 + 0x42],	%g1
	bcc,a,pt	%icc,	loop_2368
	ldstub	[%l7 + 0x32],	%g6
	fpsub32	%f10,	%f2,	%f12
	be,a,pt	%icc,	loop_2369
loop_2368:
	fbl	%fcc3,	loop_2370
	sdiv	%o1,	0x1645,	%g7
	tl	%xcc,	0x1
loop_2369:
	bpos,pt	%icc,	loop_2371
loop_2370:
	move	%xcc,	%o3,	%o4
	sll	%o2,	0x12,	%i1
	movpos	%xcc,	%l0,	%l1
loop_2371:
	be,a	loop_2372
	sll	%g2,	%i2,	%i6
	fandnot2s	%f4,	%f27,	%f12
	umul	%i5,	0x1BCA,	%l3
loop_2372:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x75] %asi,	%l6
	popc	%i4,	%g4
	ldstub	[%l7 + 0x70],	%l2
	taddcc	%o7,	0x13AE,	%g3
	bvc,a	%xcc,	loop_2373
	fand	%f2,	%f26,	%f30
	movleu	%xcc,	%i0,	%i3
	fabsd	%f14,	%f28
loop_2373:
	nop
	wr	%g0,	0x04,	%asi
	stwa	%i7,	[%l7 + 0x4C] %asi
	edge32l	%o5,	%g5,	%o6
	nop
	fitod	%f4,	%f28
	fdtoi	%f28,	%f19
	te	%xcc,	0x1
	std	%f26,	[%l7 + 0x48]
	add	%l7,	0x70,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] 0x04,	%l4,	%o0
	movrlz	%l5,	0x148,	%g6
	subc	%g1,	0x1EA3,	%g7
	bvc	%xcc,	loop_2374
	be	loop_2375
	fmul8x16	%f13,	%f26,	%f6
	subccc	%o3,	0x18B1,	%o4
loop_2374:
	fbuge,a	%fcc1,	loop_2376
loop_2375:
	fbn,a	%fcc1,	loop_2377
	fmovdcc	%xcc,	%f12,	%f28
	brz,a	%o1,	loop_2378
loop_2376:
	sra	%o2,	%l0,	%l1
loop_2377:
	fsrc2	%f22,	%f4
	tgu	%xcc,	0x4
loop_2378:
	udiv	%i1,	0x18FF,	%g2
	add	%i6,	%i2,	%i5
	tle	%icc,	0x6
	add	%l6,	%l3,	%i4
	add	%l2,	0x15C7,	%g4
	andncc	%o7,	%g3,	%i3
	fmovsl	%xcc,	%f25,	%f20
	fbu,a	%fcc2,	loop_2379
	fmul8x16al	%f0,	%f12,	%f0
	or	%i7,	%o5,	%i0
	mulscc	%o6,	0x1AE7,	%g5
loop_2379:
	nop
	set	0x218, %i5
	ldxa	[%g0 + %i5] 0x52,	%l4
	umulcc	%l5,	0x0D44,	%g6
	edge32ln	%o0,	%g7,	%o3
	movl	%xcc,	%o4,	%g1
	bneg,a	loop_2380
	swap	[%l7 + 0x48],	%o2
	fandnot2s	%f5,	%f19,	%f28
	fcmpne32	%f8,	%f16,	%o1
loop_2380:
	movge	%xcc,	%l1,	%i1
	ldstub	[%l7 + 0x31],	%g2
	udivx	%i6,	0x0E02,	%l0
	fsrc1	%f30,	%f6
	edge32ln	%i2,	%i5,	%l6
	edge16ln	%l3,	%i4,	%g4
	tge	%xcc,	0x6
	taddcctv	%l2,	0x0469,	%o7
	edge32ln	%g3,	%i7,	%o5
	fnors	%f3,	%f21,	%f0
	movle	%xcc,	%i3,	%i0
	bcs,a	%icc,	loop_2381
	tneg	%icc,	0x4
	move	%icc,	%o6,	%l4
	brgz	%l5,	loop_2382
loop_2381:
	movcs	%xcc,	%g6,	%g5
	fsrc2s	%f2,	%f28
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x2B] %asi,	%g7
loop_2382:
	umulcc	%o0,	%o3,	%o4
	udiv	%o2,	0x0A46,	%g1
	fblg	%fcc1,	loop_2383
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlez	%l1,	loop_2384
	fands	%f19,	%f6,	%f29
loop_2383:
	edge8l	%i1,	%g2,	%i6
	fsrc1	%f10,	%f26
loop_2384:
	nop
	fitod	%f8,	%f22
	fdtoi	%f22,	%f19
	fmovrslez	%l0,	%f8,	%f26
	movge	%xcc,	%o1,	%i2
	fbl	%fcc1,	loop_2385
	sth	%l6,	[%l7 + 0x38]
	orncc	%l3,	0x1D7B,	%i5
	fcmpeq32	%f8,	%f22,	%i4
loop_2385:
	tsubcc	%g4,	0x12C3,	%o7
	edge8ln	%l2,	%g3,	%i7
	fblg	%fcc0,	loop_2386
	andn	%o5,	0x0591,	%i3
	addccc	%i0,	0x14EE,	%l4
	tg	%xcc,	0x1
loop_2386:
	fble,a	%fcc0,	loop_2387
	nop
	setx	0x689F08CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f22
	tg	%xcc,	0x4
	fpsub16	%f26,	%f12,	%f2
loop_2387:
	fnegs	%f10,	%f8
	bcs,a,pn	%xcc,	loop_2388
	alignaddr	%l5,	%o6,	%g6
	bg,pt	%xcc,	loop_2389
	edge8l	%g7,	%g5,	%o3
loop_2388:
	xor	%o0,	0x0015,	%o4
	nop
	setx	0xCE37FF01,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f4
loop_2389:
	nop
	set	0x28, %i0
	lda	[%l7 + %i0] 0x04,	%f17
	fmovdg	%xcc,	%f28,	%f14
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g1
	casa	[%l6] 0x80,	%g1,	%l1
	movg	%xcc,	%o2,	%g2
	udiv	%i6,	0x0FCF,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o1,	0x0A9A,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i1,	%l6
	tvc	%xcc,	0x5
	subc	%i5,	%l3,	%i4
	fmovsneg	%xcc,	%f20,	%f14
	tvc	%icc,	0x7
	and	%g4,	%o7,	%g3
	edge8ln	%i7,	%l2,	%o5
	nop
	set	0x37, %l2
	ldub	[%l7 + %l2],	%i0
	movle	%icc,	%l4,	%i3
	fornot2	%f22,	%f18,	%f22
	te	%icc,	0x3
	taddcc	%o6,	0x18DC,	%l5
	brz,a	%g7,	loop_2390
	edge8n	%g6,	%o3,	%o0
	fmovdne	%icc,	%f7,	%f16
	tvc	%icc,	0x5
loop_2390:
	tl	%xcc,	0x7
	xor	%g5,	%g1,	%o4
	xnor	%o2,	0x160A,	%l1
	movn	%xcc,	%i6,	%l0
	movneg	%icc,	%o1,	%i2
	movcc	%icc,	%g2,	%i1
	edge8l	%i5,	%l6,	%i4
	tl	%icc,	0x2
	tvc	%icc,	0x7
	nop
	setx	0xF42D9C34,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x4BC2B061,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fmuls	%f14,	%f27,	%f15
	edge8	%g4,	%l3,	%g3
	set	0x64, %o2
	lda	[%l7 + %o2] 0x04,	%f30
	movneg	%xcc,	%i7,	%l2
	addc	%o5,	%o7,	%l4
	fcmpgt16	%f22,	%f30,	%i0
	brnz	%o6,	loop_2391
	taddcctv	%i3,	0x174B,	%g7
	bneg,a,pt	%xcc,	loop_2392
	edge8l	%l5,	%g6,	%o0
loop_2391:
	tcs	%icc,	0x7
	bpos,a,pt	%icc,	loop_2393
loop_2392:
	fba	%fcc3,	loop_2394
	fmovrdlez	%g5,	%f16,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2393:
	fmovdn	%icc,	%f11,	%f8
loop_2394:
	fcmpeq32	%f24,	%f18,	%g1
	set	0x10, %g2
	ldxa	[%g0 + %g2] 0x21,	%o4
	call	loop_2395
	sllx	%o2,	%l1,	%o3
	fbe,a	%fcc2,	loop_2396
	fble,a	%fcc0,	loop_2397
loop_2395:
	std	%f22,	[%l7 + 0x30]
	fmuld8sux16	%f7,	%f4,	%f2
loop_2396:
	movge	%xcc,	%l0,	%i6
loop_2397:
	alignaddr	%o1,	%g2,	%i1
	sethi	0x1A0D,	%i2
	movrgz	%l6,	%i5,	%i4
	movre	%l3,	%g3,	%i7
	stx	%l2,	[%l7 + 0x20]
	edge8	%o5,	%g4,	%o7
	movvs	%xcc,	%i0,	%o6
	fmul8sux16	%f30,	%f4,	%f24
	nop
	fitod	%f6,	%f14
	fdtoi	%f14,	%f25
	xor	%i3,	0x0937,	%l4
	ldd	[%l7 + 0x20],	%f10
	fcmpne16	%f0,	%f20,	%l5
	tneg	%icc,	0x5
	edge8	%g6,	%o0,	%g5
	nop
	setx	0x17B84EE8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x61375BE1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f10,	%f21
	sdivx	%g7,	0x08F9,	%o4
	mova	%xcc,	%g1,	%o2
	movne	%icc,	%l1,	%l0
	fsrc2s	%f12,	%f1
	tvc	%icc,	0x2
	fmovdpos	%icc,	%f23,	%f26
	smulcc	%i6,	0x02BC,	%o3
	membar	0x59
	fbne,a	%fcc2,	loop_2398
	or	%o1,	%g2,	%i2
	call	loop_2399
	edge8l	%i1,	%i5,	%i4
loop_2398:
	movne	%icc,	%l6,	%l3
	tge	%icc,	0x0
loop_2399:
	tge	%xcc,	0x7
	nop
	set	0x78, %l5
	lduw	[%l7 + %l5],	%i7
	add	%l7,	0x38,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] %asi,	%g3,	%l2
	tg	%icc,	0x6
	fornot2s	%f12,	%f21,	%f27
	tcs	%icc,	0x1
	fsrc1s	%f25,	%f9
	movrlz	%g4,	0x3ED,	%o7
	sth	%i0,	[%l7 + 0x7E]
	movgu	%xcc,	%o5,	%o6
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x60] %asi,	%l4
	xor	%l5,	0x106A,	%g6
	fandnot2	%f26,	%f4,	%f14
	sll	%o0,	%g5,	%i3
	bcc,pt	%icc,	loop_2400
	tvc	%xcc,	0x7
	st	%f10,	[%l7 + 0x30]
	ba,pn	%xcc,	loop_2401
loop_2400:
	xor	%o4,	0x0A50,	%g1
	orncc	%o2,	%g7,	%l0
	movrgez	%l1,	0x377,	%o3
loop_2401:
	edge8n	%o1,	%g2,	%i2
	tvs	%xcc,	0x2
	fbge	%fcc1,	loop_2402
	array16	%i6,	%i1,	%i5
	swap	[%l7 + 0x2C],	%i4
	faligndata	%f24,	%f8,	%f6
loop_2402:
	edge16n	%l3,	%i7,	%g3
	xnorcc	%l2,	0x1D08,	%g4
	mulscc	%o7,	0x1594,	%i0
	movpos	%xcc,	%l6,	%o5
	nop
	fitod	%f4,	%f4
	fdtox	%f4,	%f4
	fpack16	%f2,	%f22
	sdiv	%o6,	0x097E,	%l4
	tneg	%xcc,	0x1
	udiv	%l5,	0x1AA0,	%g6
	movrne	%o0,	0x03B,	%g5
	tl	%xcc,	0x1
	xor	%i3,	0x091B,	%g1
	fbu	%fcc3,	loop_2403
	fsrc1	%f12,	%f28
	sll	%o4,	0x18,	%o2
	nop
	fitod	%f2,	%f6
	fdtos	%f6,	%f21
loop_2403:
	udiv	%g7,	0x163E,	%l0
	udivcc	%l1,	0x1A56,	%o3
	set	0x6C, %o5
	swapa	[%l7 + %o5] 0x10,	%o1
	fmovdl	%xcc,	%f29,	%f6
	smul	%i2,	0x0D27,	%i6
	sra	%i1,	0x0E,	%g2
	lduh	[%l7 + 0x6C],	%i5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%l3,	%i7
	xnor	%i4,	0x13C7,	%g3
	smulcc	%l2,	%o7,	%i0
	edge32n	%l6,	%g4,	%o5
	fsrc1s	%f10,	%f11
	movneg	%icc,	%l4,	%l5
	movrlz	%g6,	%o0,	%o6
	fblg,a	%fcc2,	loop_2404
	edge32ln	%g5,	%i3,	%o4
	umul	%o2,	0x1455,	%g7
	andn	%g1,	%l1,	%o3
loop_2404:
	stw	%l0,	[%l7 + 0x2C]
	edge32	%o1,	%i6,	%i2
	ta	%icc,	0x4
	edge32ln	%i1,	%g2,	%l3
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x38] %asi,	%i7
	alignaddr	%i4,	%g3,	%i5
	xor	%l2,	%i0,	%o7
	fmovsge	%icc,	%f17,	%f16
	move	%xcc,	%g4,	%o5
	fba,a	%fcc3,	loop_2405
	subccc	%l6,	%l5,	%g6
	nop
	setx	0xA04C02FC,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	ldstub	[%l7 + 0x3D],	%o0
loop_2405:
	fmovsl	%xcc,	%f10,	%f1
	andn	%l4,	0x191E,	%g5
	edge16	%i3,	%o4,	%o6
	fzeros	%f3
	movre	%g7,	0x100,	%g1
	xnorcc	%l1,	%o3,	%o2
	movrlez	%o1,	0x11A,	%i6
	movrgz	%i2,	0x275,	%i1
	fmovse	%icc,	%f27,	%f16
	fxnor	%f26,	%f10,	%f10
	fnot1s	%f23,	%f18
	andncc	%l0,	%g2,	%i7
	smulcc	%i4,	0x0E20,	%g3
	orcc	%l3,	0x0E91,	%i5
	movne	%xcc,	%i0,	%o7
	set	0x0, %l1
	ldxa	[%g0 + %l1] 0x58,	%g4
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x60] %asi,	%o4
	ldsh	[%l7 + 0x54],	%l6
	srax	%l5,	%g6,	%l2
	edge8	%o0,	%g5,	%i3
	movgu	%icc,	%o4,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%g7,	%f14,	%f10
	ldsb	[%l7 + 0x24],	%l4
	movvc	%xcc,	%g1,	%o3
	smul	%l1,	0x0EED,	%o1
	smulcc	%o2,	%i2,	%i1
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x3C] %asi,	%f15
	ba,a,pt	%icc,	loop_2406
	array8	%i6,	%g2,	%l0
	fpadd32s	%f22,	%f30,	%f5
	std	%f26,	[%l7 + 0x68]
loop_2406:
	fsrc2	%f10,	%f10
	movrgz	%i4,	0x35B,	%g3
	umul	%i7,	0x04D7,	%l3
	edge8l	%i0,	%o7,	%g4
	umulcc	%i5,	0x1CF1,	%o5
	fmovrdne	%l5,	%f2,	%f24
	smul	%g6,	%l6,	%l2
	movrne	%g5,	0x3E1,	%i3
	addccc	%o0,	%o6,	%o4
	taddcc	%g7,	0x01FC,	%l4
	fmovda	%icc,	%f7,	%f17
	taddcc	%o3,	0x004E,	%g1
	udiv	%l1,	0x08BD,	%o1
	movl	%icc,	%i2,	%o2
	tneg	%xcc,	0x2
	array8	%i6,	%g2,	%l0
	xnorcc	%i4,	0x0544,	%g3
	movneg	%icc,	%i1,	%l3
	bvs,a,pn	%icc,	loop_2407
	edge16	%i7,	%i0,	%o7
	andcc	%i5,	%o5,	%g4
	brlz	%l5,	loop_2408
loop_2407:
	nop
	setx	loop_2409,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%l6,	%g6,	%g5
	movre	%i3,	0x298,	%o0
loop_2408:
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f0
	fxtod	%f0,	%f28
loop_2409:
	ta	%icc,	0x3
	orcc	%l2,	0x107D,	%o6
	nop
	setx	0xFCC4B99C1A8B4DE0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x9EA739F7647E7FB8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f30,	%f8
	orn	%g7,	%o4,	%o3
	brgz,a	%g1,	loop_2410
	smul	%l1,	0x01BA,	%o1
	edge32	%i2,	%l4,	%i6
	tl	%icc,	0x3
loop_2410:
	tsubcc	%g2,	%o2,	%i4
	alignaddr	%l0,	%i1,	%l3
	movvc	%icc,	%g3,	%i0
	sub	%i7,	%o7,	%i5
	fmul8sux16	%f10,	%f26,	%f24
	fmovdn	%xcc,	%f28,	%f21
	add	%g4,	0x1E3D,	%o5
	set	0x30, %i6
	ldxa	[%l7 + %i6] 0x80,	%l5
	membar	0x09
	fmovrse	%l6,	%f22,	%f25
	movre	%g5,	0x1F5,	%i3
	nop
	setx	loop_2411,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x047B
	sra	%o0,	0x1D,	%l2
	mulscc	%o6,	0x1BEB,	%g7
loop_2411:
	ldd	[%l7 + 0x68],	%f22
	movgu	%xcc,	%g6,	%o4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x78] %asi,	%o3
	fbe,a	%fcc1,	loop_2412
	sdivx	%l1,	0x0986,	%g1
	bvc,pn	%xcc,	loop_2413
	xnor	%i2,	%o1,	%i6
loop_2412:
	fsrc2s	%f1,	%f5
	bleu,pt	%xcc,	loop_2414
loop_2413:
	edge16	%g2,	%l4,	%i4
	movg	%xcc,	%l0,	%i1
	and	%l3,	%g3,	%o2
loop_2414:
	brgz	%i0,	loop_2415
	edge32	%i7,	%o7,	%i5
	movle	%icc,	%g4,	%o5
	fandnot2	%f20,	%f12,	%f8
loop_2415:
	andcc	%l6,	%l5,	%i3
	fabsd	%f22,	%f12
	xnor	%o0,	0x0F0B,	%l2
	sdivcc	%o6,	0x0050,	%g5
	set	0x08, %g4
	ldswa	[%l7 + %g4] 0x04,	%g7
	fnegs	%f7,	%f5
	mulx	%g6,	%o3,	%o4
	nop
	fitos	%f11,	%f6
	fstoi	%f6,	%f2
	fbge	%fcc1,	loop_2416
	edge32	%g1,	%l1,	%o1
	fnot1s	%f6,	%f9
	bpos,a,pt	%xcc,	loop_2417
loop_2416:
	stw	%i2,	[%l7 + 0x08]
	movcc	%xcc,	%g2,	%l4
	membar	0x49
loop_2417:
	sdivcc	%i4,	0x0212,	%i6
	fors	%f31,	%f22,	%f27
	alignaddr	%i1,	%l0,	%g3
	wr	%g0,	0xea,	%asi
	stba	%l3,	[%l7 + 0x58] %asi
	membar	#Sync
	mulscc	%o2,	0x1DB3,	%i0
	addcc	%i7,	%i5,	%g4
	movneg	%icc,	%o5,	%o7
	lduw	[%l7 + 0x30],	%l6
	tne	%icc,	0x4
	fpackfix	%f20,	%f13
	tsubcctv	%l5,	0x02D9,	%i3
	popc	%l2,	%o6
	addc	%o0,	%g5,	%g6
	tl	%xcc,	0x7
	orncc	%g7,	0x04C2,	%o3
	subccc	%o4,	%g1,	%l1
	edge32n	%o1,	%g2,	%l4
	movcs	%xcc,	%i4,	%i2
	set	0x6C, %g1
	sta	%f30,	[%l7 + %g1] 0x80
	edge8	%i1,	%l0,	%g3
	sra	%l3,	0x1D,	%o2
	taddcc	%i0,	%i6,	%i5
	fcmpgt16	%f6,	%f28,	%i7
	bcs,pt	%icc,	loop_2418
	fmovscc	%xcc,	%f6,	%f12
	movl	%xcc,	%o5,	%o7
	fxnors	%f14,	%f2,	%f16
loop_2418:
	nop
	setx	loop_2419,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%l6,	%l5,	%i3
	tle	%xcc,	0x6
	addccc	%g4,	%o6,	%o0
loop_2419:
	sir	0x0A11
	movge	%icc,	%l2,	%g5
	fpsub16	%f28,	%f22,	%f0
	bge,a	loop_2420
	membar	0x25
	andncc	%g7,	%o3,	%o4
	edge16l	%g1,	%l1,	%o1
loop_2420:
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f24
	sub	%g2,	%l4,	%g6
	edge16l	%i4,	%i1,	%l0
	movneg	%icc,	%g3,	%l3
	ta	%xcc,	0x4
	fmovse	%xcc,	%f8,	%f13
	fnot2	%f2,	%f24
	fble,a	%fcc3,	loop_2421
	nop
	setx	0xDC21B47F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xDDB6DD4D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f17,	%f9
	fornot2s	%f13,	%f13,	%f7
	fnor	%f10,	%f28,	%f4
loop_2421:
	movne	%xcc,	%i2,	%i0
	fpsub32s	%f22,	%f12,	%f31
	srax	%o2,	%i5,	%i7
	fmovdvs	%icc,	%f1,	%f17
	movgu	%xcc,	%o5,	%o7
	fmovdge	%icc,	%f13,	%f18
	alignaddrl	%l6,	%l5,	%i6
	fnot1s	%f12,	%f28
	movrgez	%i3,	%g4,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l2,	%o0
	sdivx	%g5,	0x1719,	%g7
	bvc,a	loop_2422
	nop
	set	0x48, %g7
	lduw	[%l7 + %g7],	%o3
	addcc	%g1,	%l1,	%o4
	tcc	%icc,	0x6
loop_2422:
	movge	%xcc,	%o1,	%l4
	fbue,a	%fcc0,	loop_2423
	movrgez	%g2,	0x0DD,	%i4
	fnors	%f13,	%f15,	%f12
	add	%i1,	0x0E87,	%l0
loop_2423:
	brnz	%g3,	loop_2424
	edge16	%l3,	%i2,	%g6
	set	0x2C, %o6
	lduwa	[%l7 + %o6] 0x14,	%o2
loop_2424:
	edge32ln	%i0,	%i5,	%i7
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x40] %asi,	%f14
	membar	#Sync
	set	0x40, %g5
	ldda	[%l7 + %g5] 0xf1,	%f16
	fbu	%fcc3,	loop_2425
	fnot1s	%f25,	%f23
	ldd	[%l7 + 0x10],	%o4
	udivx	%l6,	0x1D91,	%o7
loop_2425:
	mulx	%i6,	0x1B51,	%i3
	nop
	setx loop_2426, %l0, %l1
	jmpl %l1, %g4
	tcc	%xcc,	0x0
	and	%o6,	0x0611,	%l5
	fmovrdlez	%o0,	%f20,	%f0
loop_2426:
	fbug,a	%fcc2,	loop_2427
	orncc	%l2,	%g7,	%o3
	membar	#Sync
	wr	%g0,	0x17,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2427:
	membar	0x11
	stw	%g1,	[%l7 + 0x60]
	edge32	%g5,	%l1,	%o1
	movrne	%o4,	0x039,	%l4
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x20] %asi,	%i4
	sdiv	%i1,	0x0321,	%g2
	mulscc	%g3,	0x1287,	%l3
	flush	%l7 + 0x2C
	fbuge,a	%fcc3,	loop_2428
	fabsd	%f12,	%f18
	nop
	setx	0xCC5D1E1FA7DE6B45,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xEC2EC3B350FFC236,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f8,	%f12
	movrgz	%l0,	0x307,	%i2
loop_2428:
	edge16n	%o2,	%g6,	%i0
	tne	%icc,	0x2
	nop
	fitod	%f4,	%f18
	fdtos	%f18,	%f16
	smul	%i7,	%i5,	%o5
	taddcc	%l6,	0x0672,	%o7
	udiv	%i3,	0x0F07,	%g4
	tneg	%icc,	0x3
	bne,pt	%icc,	loop_2429
	fmovdn	%icc,	%f6,	%f4
	taddcc	%i6,	0x076C,	%o6
	fpadd32	%f22,	%f30,	%f26
loop_2429:
	xorcc	%l5,	0x1070,	%l2
	edge16ln	%g7,	%o3,	%g1
	udiv	%g5,	0x0672,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o0,	%o4,	%o1
	tcs	%xcc,	0x1
	movl	%xcc,	%i4,	%l4
	fmovrslez	%g2,	%f9,	%f15
	umulcc	%i1,	0x098F,	%g3
	mulx	%l3,	%i2,	%o2
	edge8l	%l0,	%g6,	%i7
	nop
	setx loop_2430, %l0, %l1
	jmpl %l1, %i5
	ldd	[%l7 + 0x28],	%i0
	ta	%xcc,	0x2
	set	0x68, %o7
	sta	%f17,	[%l7 + %o7] 0x15
loop_2430:
	tne	%xcc,	0x6
	sll	%l6,	0x06,	%o7
	xorcc	%o5,	0x03EA,	%i3
	movrgz	%g4,	0x0B1,	%o6
	srax	%l5,	0x17,	%l2
	subc	%g7,	%i6,	%o3
	tne	%xcc,	0x6
	movrlez	%g1,	0x245,	%l1
	smul	%g5,	%o0,	%o4
	tneg	%icc,	0x0
	fmovsvs	%xcc,	%f28,	%f8
	fandnot1	%f14,	%f20,	%f12
	fbl	%fcc0,	loop_2431
	sra	%i4,	%l4,	%o1
	smul	%i1,	%g3,	%l3
	nop
	fitod	%f0,	%f24
	fdtoi	%f24,	%f24
loop_2431:
	array32	%i2,	%g2,	%l0
	andcc	%o2,	0x09EB,	%i7
	sub	%i5,	0x0832,	%g6
	fbuge,a	%fcc0,	loop_2432
	subcc	%l6,	%i0,	%o7
	mulscc	%i3,	%o5,	%o6
	tsubcctv	%l5,	%g4,	%g7
loop_2432:
	umulcc	%l2,	%i6,	%o3
	membar	0x23
	movleu	%icc,	%l1,	%g1
	srax	%o0,	%o4,	%i4
	edge8ln	%g5,	%l4,	%o1
	stbar
	udivx	%i1,	0x103B,	%l3
	fbug,a	%fcc0,	loop_2433
	andn	%i2,	%g3,	%l0
	tle	%xcc,	0x6
	ble,a,pt	%xcc,	loop_2434
loop_2433:
	edge8ln	%o2,	%g2,	%i7
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x58] %asi,	%f10
loop_2434:
	fmul8x16	%f27,	%f2,	%f2
	ldsh	[%l7 + 0x4C],	%g6
	tle	%xcc,	0x5
	fmul8sux16	%f10,	%f20,	%f30
	nop
	setx	loop_2435,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bne	%xcc,	loop_2436
	tneg	%icc,	0x7
	umul	%i5,	%i0,	%o7
loop_2435:
	movrgez	%l6,	0x10B,	%o5
loop_2436:
	nop
	wr	%g0,	0x18,	%asi
	stxa	%o6,	[%l7 + 0x10] %asi
	udivx	%i3,	0x1150,	%l5
	nop
	fitos	%f11,	%f21
	fstox	%f21,	%f6
	fxtos	%f6,	%f26
	tn	%icc,	0x7
	fxor	%f30,	%f10,	%f12
	mulscc	%g7,	0x1B07,	%l2
	mova	%xcc,	%i6,	%o3
	fbn	%fcc0,	loop_2437
	subccc	%g4,	0x18C0,	%g1
	array8	%l1,	%o4,	%o0
	ldd	[%l7 + 0x10],	%f16
loop_2437:
	array8	%g5,	%l4,	%o1
	edge32	%i1,	%i4,	%l3
	udiv	%g3,	0x0555,	%l0
	fands	%f7,	%f28,	%f26
	fpmerge	%f17,	%f19,	%f28
	xorcc	%i2,	0x1E2D,	%o2
	movl	%icc,	%i7,	%g2
	stw	%i5,	[%l7 + 0x54]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%o7
	fpsub16s	%f2,	%f3,	%f16
	fmul8sux16	%f10,	%f10,	%f26
	set	0x0C, %l0
	lduha	[%l7 + %l0] 0x15,	%g6
	move	%icc,	%o5,	%o6
	fmovsneg	%icc,	%f7,	%f0
	fbug	%fcc0,	loop_2438
	tsubcctv	%i3,	0x1CF7,	%l6
	fands	%f21,	%f8,	%f14
	popc	0x166C,	%g7
loop_2438:
	bge,pn	%xcc,	loop_2439
	orcc	%l2,	0x14A9,	%l5
	popc	0x069C,	%i6
	edge8ln	%o3,	%g4,	%l1
loop_2439:
	sdivx	%g1,	0x049A,	%o4
	smulcc	%o0,	0x0921,	%g5
	fone	%f8
	bge,pn	%xcc,	loop_2440
	array16	%l4,	%o1,	%i1
	alignaddr	%i4,	%g3,	%l0
	movcc	%xcc,	%l3,	%i2
loop_2440:
	umul	%i7,	0x01B4,	%g2
	sub	%o2,	%i0,	%i5
	movcs	%icc,	%o7,	%o5
	edge16ln	%o6,	%g6,	%i3
	edge8	%l6,	%l2,	%g7
	sir	0x017B
	sir	0x1C6C
	tvc	%icc,	0x0
	fmovspos	%xcc,	%f22,	%f16
	stw	%l5,	[%l7 + 0x1C]
	edge32l	%o3,	%i6,	%l1
	umul	%g4,	0x180D,	%o4
	sdivx	%o0,	0x17A3,	%g5
	ta	%icc,	0x2
	stbar
	xnor	%g1,	%o1,	%l4
	edge16ln	%i4,	%i1,	%g3
	fnands	%f1,	%f31,	%f28
	sethi	0x0E69,	%l3
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x59] %asi,	%l0
	andn	%i2,	0x0147,	%i7
	tl	%icc,	0x1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g2
	andn	%i0,	%o2,	%i5
	sdiv	%o5,	0x144C,	%o6
	set	0x5C, %g6
	lduba	[%l7 + %g6] 0x10,	%o7
	movle	%icc,	%i3,	%l6
	fbo,a	%fcc1,	loop_2441
	pdist	%f14,	%f16,	%f8
	movcc	%icc,	%g6,	%l2
	alignaddrl	%g7,	%l5,	%i6
loop_2441:
	sllx	%l1,	0x1B,	%g4
	ld	[%l7 + 0x68],	%f16
	fmovdle	%icc,	%f2,	%f7
	fabss	%f7,	%f1
	nop
	setx	0xB0965871,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xF01FB369,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fmuls	%f12,	%f16,	%f12
	taddcctv	%o3,	%o0,	%g5
	mulscc	%o4,	%o1,	%l4
	sll	%i4,	0x16,	%g1
	taddcctv	%i1,	0x029E,	%l3
	edge16ln	%g3,	%i2,	%i7
	sllx	%l0,	0x0F,	%g2
	array16	%o2,	%i5,	%i0
	movpos	%xcc,	%o6,	%o7
	edge8l	%o5,	%i3,	%g6
	or	%l2,	0x0744,	%l6
	bvs,pt	%icc,	loop_2442
	bcs,pn	%icc,	loop_2443
	orncc	%g7,	%l5,	%l1
	tsubcctv	%g4,	%o3,	%i6
loop_2442:
	fbo,a	%fcc0,	loop_2444
loop_2443:
	movrlez	%o0,	%g5,	%o4
	fnegd	%f18,	%f30
	wr	%g0,	0x19,	%asi
	stha	%l4,	[%l7 + 0x64] %asi
loop_2444:
	tneg	%icc,	0x6
	xnorcc	%o1,	0x01AB,	%i4
	wr	%g0,	0x23,	%asi
	stba	%g1,	[%l7 + 0x4A] %asi
	membar	#Sync
	add	%l3,	%i1,	%i2
	orcc	%g3,	0x15C9,	%l0
	set	0x66, %o4
	ldsha	[%l7 + %o4] 0x80,	%g2
	add	%o2,	%i5,	%i0
	fsrc1s	%f13,	%f21
	nop
	setx	0x75BBA813,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xA0E30B63,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f2,	%f6
	array32	%i7,	%o6,	%o7
	array32	%i3,	%g6,	%l2
	movcc	%icc,	%o5,	%g7
	bl,pt	%xcc,	loop_2445
	tcs	%icc,	0x2
	movg	%xcc,	%l6,	%l5
	array16	%g4,	%o3,	%i6
loop_2445:
	sllx	%l1,	%o0,	%o4
	srlx	%l4,	%g5,	%i4
	bcc,a	loop_2446
	add	%g1,	0x1209,	%o1
	taddcc	%l3,	%i2,	%g3
	srl	%l0,	0x10,	%g2
loop_2446:
	flush	%l7 + 0x74
	fnot1	%f16,	%f16
	bl,a,pt	%icc,	loop_2447
	fmovdn	%icc,	%f4,	%f26
	edge8n	%o2,	%i1,	%i5
	subcc	%i0,	0x1FD6,	%i7
loop_2447:
	fmovdneg	%icc,	%f18,	%f19
	addcc	%o6,	%i3,	%g6
	fsrc2	%f28,	%f2
	sdiv	%l2,	0x1FCB,	%o7
	sra	%o5,	0x04,	%l6
	edge16l	%g7,	%g4,	%l5
	tge	%xcc,	0x1
	tne	%icc,	0x4
	set	0x0C, %o3
	stwa	%i6,	[%l7 + %o3] 0x80
	xnor	%l1,	0x0611,	%o0
	fsrc2	%f28,	%f26
	nop
	setx	0xD07F8BCB,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	fba	%fcc0,	loop_2448
	movne	%icc,	%o3,	%l4
	movrne	%o4,	%i4,	%g5
	fmovsne	%icc,	%f17,	%f5
loop_2448:
	stx	%o1,	[%l7 + 0x70]
	nop
	setx	0xB9439258307DF712,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	bgu,a,pt	%icc,	loop_2449
	move	%icc,	%l3,	%g1
	nop
	setx	0xF9B027EF1DF114EC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xCE3209537E94F174,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f2,	%f6
	srax	%g3,	0x00,	%l0
loop_2449:
	bvs,a	loop_2450
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvs	%xcc,	0x2
	sub	%g2,	0x1E76,	%i2
loop_2450:
	orcc	%i1,	0x0ED2,	%o2
	fabss	%f14,	%f0
	movcc	%icc,	%i0,	%i5
	add	%o6,	0x1018,	%i7
	xorcc	%g6,	%l2,	%o7
	fsrc2	%f4,	%f6
	tcs	%icc,	0x3
	tn	%icc,	0x1
	move	%icc,	%i3,	%l6
	and	%o5,	0x106F,	%g7
	sdivx	%g4,	0x0316,	%l5
	fcmpeq16	%f2,	%f18,	%i6
	or	%o0,	0x05B3,	%o3
	srax	%l4,	0x15,	%o4
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i4,	%l1
	bcc,a,pt	%icc,	loop_2451
	tvs	%xcc,	0x7
	movneg	%icc,	%g5,	%l3
	fmovsne	%icc,	%f3,	%f15
loop_2451:
	movcs	%xcc,	%o1,	%g1
	ta	%icc,	0x2
	subcc	%g3,	0x1B94,	%g2
	fmul8x16al	%f16,	%f2,	%f24
	edge32	%i2,	%l0,	%o2
	fmovdne	%xcc,	%f10,	%f8
	edge8ln	%i0,	%i5,	%i1
	array8	%o6,	%g6,	%i7
	set	0x30, %o1
	ldda	[%l7 + %o1] 0x0c,	%o6
	edge16	%l2,	%i3,	%l6
	ta	%xcc,	0x3
	tvs	%icc,	0x1
	wr	%g0,	0x10,	%asi
	sta	%f8,	[%l7 + 0x58] %asi
	edge8ln	%g7,	%g4,	%o5
	tpos	%icc,	0x4
	sir	0x189F
	movrlez	%l5,	%o0,	%i6
	alignaddr	%o3,	%o4,	%i4
	xnor	%l4,	0x05C2,	%g5
	movpos	%icc,	%l3,	%l1
	bvs,pt	%icc,	loop_2452
	edge16	%o1,	%g3,	%g1
	fmovdneg	%icc,	%f15,	%f1
	umul	%g2,	0x17B1,	%l0
loop_2452:
	tsubcctv	%i2,	%o2,	%i5
	array32	%i0,	%i1,	%g6
	edge8ln	%i7,	%o7,	%l2
	stbar
	movneg	%icc,	%i3,	%l6
	xnorcc	%g7,	%g4,	%o5
	stb	%o6,	[%l7 + 0x42]
	stbar
	tneg	%xcc,	0x1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] 0x81,	%l5,	%o0
	fpack32	%f2,	%f20,	%f2
	movvs	%icc,	%i6,	%o4
	bgu,pt	%xcc,	loop_2453
	orncc	%o3,	0x1854,	%l4
	orn	%i4,	%g5,	%l3
	movpos	%xcc,	%l1,	%g3
loop_2453:
	fmovsne	%xcc,	%f7,	%f1
	set	0x40, %l6
	stda	%f0,	[%l7 + %l6] 0x88
	addccc	%o1,	%g2,	%g1
	move	%xcc,	%l0,	%o2
	fmovdcc	%xcc,	%f5,	%f29
	orncc	%i5,	0x1724,	%i0
	fmul8x16	%f5,	%f16,	%f26
	fmovsge	%icc,	%f31,	%f6
	move	%xcc,	%i2,	%i1
	umul	%g6,	%o7,	%l2
	flush	%l7 + 0x30
	fmovsa	%xcc,	%f21,	%f8
	ldsw	[%l7 + 0x4C],	%i3
	sdiv	%i7,	0x1FCE,	%l6
	set	0x2C, %o0
	lduwa	[%l7 + %o0] 0x19,	%g7
	addccc	%o5,	%g4,	%o6
	orn	%l5,	%i6,	%o0
	fmovdne	%icc,	%f15,	%f10
	and	%o4,	%o3,	%l4
	bleu,a,pt	%icc,	loop_2454
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f18
	fxtod	%f18,	%f18
	tgu	%icc,	0x7
	movrgz	%i4,	0x119,	%g5
loop_2454:
	nop
	set	0x7E, %l3
	lduha	[%l7 + %l3] 0x89,	%l1
	tge	%icc,	0x0
	andncc	%g3,	%l3,	%g2
	edge8n	%o1,	%l0,	%o2
	fble,a	%fcc3,	loop_2455
	edge32n	%g1,	%i5,	%i2
	udivx	%i0,	0x0FC2,	%i1
	srl	%o7,	%g6,	%l2
loop_2455:
	edge16l	%i7,	%i3,	%g7
	edge32ln	%o5,	%g4,	%o6
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movvc	%xcc,	%l6,	%i6
	fbue	%fcc1,	loop_2456
	edge8ln	%o0,	%o4,	%o3
	fpsub32s	%f13,	%f17,	%f26
	tpos	%icc,	0x7
loop_2456:
	fmovsgu	%xcc,	%f30,	%f4
	fexpand	%f4,	%f18
	fbne,a	%fcc1,	loop_2457
	ldub	[%l7 + 0x3A],	%l4
	ldub	[%l7 + 0x70],	%i4
	taddcc	%l5,	0x0C7C,	%l1
loop_2457:
	and	%g5,	0x1F6F,	%g3
	tn	%icc,	0x2
	movl	%icc,	%g2,	%l3
	movn	%xcc,	%o1,	%o2
	lduh	[%l7 + 0x40],	%g1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl,pn	%icc,	loop_2458
	addc	%i5,	%l0,	%i2
	or	%i0,	%i1,	%o7
	nop
	fitos	%f9,	%f21
	fstox	%f21,	%f22
	fxtos	%f22,	%f30
loop_2458:
	bshuffle	%f2,	%f4,	%f0
	fmovdg	%xcc,	%f26,	%f12
	stx	%g6,	[%l7 + 0x20]
	tn	%icc,	0x6
	stb	%i7,	[%l7 + 0x54]
	movrlz	%i3,	%g7,	%l2
	fmul8x16al	%f17,	%f31,	%f2
	tpos	%icc,	0x6
	edge8ln	%g4,	%o5,	%l6
	sdivcc	%i6,	0x0DF5,	%o0
	sdivcc	%o4,	0x1D03,	%o6
	fbe	%fcc2,	loop_2459
	fpadd16s	%f8,	%f25,	%f26
	fbug,a	%fcc0,	loop_2460
	fmovspos	%icc,	%f22,	%f11
loop_2459:
	srax	%l4,	%o3,	%l5
	sdivcc	%l1,	0x0D9F,	%i4
loop_2460:
	ldd	[%l7 + 0x20],	%f0
	nop
	setx	0x12BAD6B72599FB95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x66EF7EDFA205B620,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f2,	%f6
	tn	%xcc,	0x4
	call	loop_2461
	nop
	setx	0x1EBF456F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f28
	brlez	%g3,	loop_2462
	movg	%icc,	%g5,	%g2
loop_2461:
	movn	%xcc,	%l3,	%o1
	fblg	%fcc3,	loop_2463
loop_2462:
	tleu	%xcc,	0x5
	xorcc	%g1,	0x007E,	%i5
	fpsub32	%f22,	%f18,	%f20
loop_2463:
	edge32ln	%l0,	%i2,	%o2
	tsubcctv	%i1,	%i0,	%o7
	taddcctv	%i7,	0x02EC,	%i3
	brgz	%g7,	loop_2464
	tvc	%icc,	0x2
	movpos	%icc,	%l2,	%g4
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x11] %asi,	%g6
loop_2464:
	fbne,a	%fcc0,	loop_2465
	sllx	%o5,	%l6,	%o0
	fpadd16s	%f9,	%f29,	%f10
	fmovdge	%xcc,	%f7,	%f16
loop_2465:
	fpadd32	%f30,	%f18,	%f12
	array16	%i6,	%o6,	%l4
	xorcc	%o4,	0x1450,	%l5
	alignaddrl	%l1,	%i4,	%g3
	fpsub16	%f10,	%f28,	%f26
	sub	%o3,	0x1361,	%g2
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x04
	set	0x5C, %l4
	stwa	%g5,	[%l7 + %l4] 0x80
	array8	%o1,	%l3,	%i5
	fpsub16s	%f18,	%f27,	%f20
	fbl	%fcc1,	loop_2466
	nop
	setx	0x1D88DCE84C0C314D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xC7A497100050B60F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f14,	%f16
	tge	%xcc,	0x1
	srlx	%l0,	%g1,	%o2
loop_2466:
	fpsub16	%f20,	%f0,	%f18
	andncc	%i2,	%i1,	%i0
	tn	%icc,	0x3
	fbe,a	%fcc2,	loop_2467
	nop
	setx	0x76726190B07EF5E6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	edge8n	%o7,	%i7,	%i3
	fandnot2s	%f6,	%f23,	%f7
loop_2467:
	nop
	set	0x58, %i1
	sta	%f18,	[%l7 + %i1] 0x88
	udivx	%g7,	0x15F8,	%g4
	movpos	%icc,	%g6,	%o5
	alignaddr	%l6,	%l2,	%o0
	movcc	%icc,	%i6,	%l4
	fcmpne16	%f6,	%f6,	%o4
	flush	%l7 + 0x08
	nop
	setx	loop_2468,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%o6,	0x117A,	%l1
	movge	%icc,	%l5,	%g3
	array16	%o3,	%g2,	%i4
loop_2468:
	stx	%o1,	[%l7 + 0x10]
	fcmpgt32	%f10,	%f4,	%g5
	fabss	%f19,	%f28
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	stx	%l3,	[%l7 + 0x60]
	tne	%icc,	0x5
	addcc	%l0,	0x0844,	%g1
	mova	%xcc,	%i5,	%i2
	xor	%i1,	%i0,	%o7
	umul	%i7,	0x0C23,	%i3
	ldd	[%l7 + 0x38],	%f30
	nop
	setx	0xC072DB9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x3C]
	ld	[%l7 + 0x3C],	%fsr
	fcmple16	%f30,	%f22,	%o2
	edge16l	%g7,	%g6,	%o5
	addc	%l6,	%g4,	%l2
	movneg	%xcc,	%i6,	%o0
	bgu,a	loop_2469
	ld	[%l7 + 0x70],	%f11
	fmovrdne	%o4,	%f14,	%f6
	ldd	[%l7 + 0x48],	%l4
loop_2469:
	add	%o6,	0x1479,	%l5
	set	0x54, %g3
	ldswa	[%l7 + %g3] 0x0c,	%g3
	set	0x27, %i2
	lduba	[%l7 + %i2] 0x81,	%l1
	ldd	[%l7 + 0x38],	%f0
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	fmovs	%f30,	%f5
	movrlez	%g2,	0x0CD,	%o1
	movrlz	%g5,	0x02C,	%i4
	movrgz	%l0,	0x2F7,	%g1
	sdiv	%l3,	0x1AED,	%i5
	taddcctv	%i1,	%i0,	%o7
	mulx	%i7,	0x0F40,	%i3
	umulcc	%i2,	%o2,	%g7
	mulx	%o5,	%g6,	%g4
	sdivx	%l6,	0x15B9,	%i6
	smulcc	%o0,	0x0B3A,	%l2
	alignaddr	%o4,	%l4,	%l5
	fand	%f28,	%f18,	%f26
	fmovs	%f22,	%f2
	fbl,a	%fcc2,	loop_2470
	movle	%xcc,	%g3,	%o6
	andn	%o3,	%g2,	%o1
	movneg	%xcc,	%l1,	%g5
loop_2470:
	addc	%l0,	0x007B,	%g1
	tcs	%icc,	0x5
	edge16	%l3,	%i5,	%i1
	bn	loop_2471
	ble,a	%icc,	loop_2472
	addcc	%i0,	0x0F24,	%i4
	movg	%xcc,	%i7,	%i3
loop_2471:
	sub	%i2,	%o2,	%g7
loop_2472:
	fcmpeq16	%f2,	%f16,	%o7
	tvs	%icc,	0x2
	ble,a,pt	%xcc,	loop_2473
	tg	%icc,	0x0
	bge,a	loop_2474
	fmul8sux16	%f30,	%f28,	%f20
loop_2473:
	srax	%o5,	%g4,	%l6
	mova	%xcc,	%i6,	%g6
loop_2474:
	edge8l	%l2,	%o0,	%l4
	st	%f22,	[%l7 + 0x18]
	wr	%g0,	0x17,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	srl	%o4,	%l5,	%o6
	set	0x19, %i4
	lduba	[%l7 + %i4] 0x15,	%g3
	addc	%o3,	0x0CC9,	%o1
	array8	%l1,	%g2,	%l0
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%g5
	movrgez	%g1,	%l3,	%i5
	fmovrslez	%i1,	%f10,	%f26
	addcc	%i0,	0x118F,	%i7
	tcc	%icc,	0x3
	nop
	setx	0xA0582BB3,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
	srl	%i3,	0x0E,	%i2
	movcs	%icc,	%o2,	%g7
	movne	%xcc,	%i4,	%o5
	movrlez	%g4,	0x15A,	%o7
	fmovs	%f26,	%f16
	umulcc	%l6,	%i6,	%l2
	set	0x4D, %i5
	lduba	[%l7 + %i5] 0x04,	%o0
	faligndata	%f2,	%f18,	%f22
	std	%f30,	[%l7 + 0x10]
	movl	%icc,	%l4,	%o4
	edge8	%l5,	%g6,	%g3
	alignaddr	%o3,	%o1,	%l1
	movvs	%icc,	%o6,	%l0
	edge8n	%g2,	%g5,	%g1
	srl	%i5,	%i1,	%i0
	fcmpne32	%f26,	%f28,	%i7
	movl	%icc,	%i3,	%i2
	movrne	%l3,	0x109,	%g7
	movpos	%xcc,	%i4,	%o2
	tcc	%icc,	0x3
	edge32ln	%g4,	%o7,	%o5
	tcc	%icc,	0x4
	nop
	setx	0xAD577FC0F6FAEDF9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x139F2F702463305E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f4,	%f18
	umul	%i6,	%l2,	%l6
	edge16ln	%l4,	%o0,	%o4
	movg	%icc,	%l5,	%g6
	orcc	%g3,	%o3,	%l1
	fmovdn	%xcc,	%f2,	%f13
	fpadd32	%f0,	%f14,	%f30
	udivx	%o1,	0x1111,	%l0
	fmovrdlez	%o6,	%f20,	%f18
	udivx	%g2,	0x17AC,	%g1
	membar	0x36
	nop
	setx	0x0057CD0C,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	fbn	%fcc2,	loop_2475
	bshuffle	%f24,	%f26,	%f4
	fmovrdlz	%g5,	%f14,	%f28
	call	loop_2476
loop_2475:
	fmovrdgez	%i1,	%f18,	%f26
	smul	%i0,	%i5,	%i7
	fmovdcs	%icc,	%f3,	%f18
loop_2476:
	nop
	set	0x14, %i0
	ldswa	[%l7 + %i0] 0x88,	%i2
	tcs	%xcc,	0x6
	fbule	%fcc2,	loop_2477
	sdivx	%i3,	0x033F,	%g7
	call	loop_2478
	fbe	%fcc3,	loop_2479
loop_2477:
	faligndata	%f0,	%f24,	%f18
	fandnot1s	%f15,	%f17,	%f7
loop_2478:
	movle	%icc,	%i4,	%l3
loop_2479:
	add	%g4,	%o7,	%o2
	fornot1s	%f10,	%f24,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f6,	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_2480,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bn,a,pn	%xcc,	loop_2481
	movl	%xcc,	%o5,	%l2
	nop
	setx	0xACAA8B5D804B05FF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
loop_2480:
	ldsb	[%l7 + 0x2F],	%l6
loop_2481:
	movl	%xcc,	%i6,	%o0
	brgz	%o4,	loop_2482
	alignaddr	%l4,	%l5,	%g6
	fbo	%fcc2,	loop_2483
	fmovsneg	%icc,	%f9,	%f31
loop_2482:
	tne	%icc,	0x4
	movle	%icc,	%g3,	%o3
loop_2483:
	xnorcc	%l1,	0x1560,	%l0
	tleu	%xcc,	0x2
	fandnot2s	%f5,	%f10,	%f2
	taddcc	%o6,	0x121F,	%o1
	subcc	%g1,	0x0B58,	%g5
	orcc	%i1,	0x1EAC,	%i0
	movle	%xcc,	%g2,	%i5
	addccc	%i2,	0x115B,	%i3
	mulx	%i7,	0x017C,	%i4
	fble,a	%fcc0,	loop_2484
	sdiv	%g7,	0x083D,	%l3
	tvs	%xcc,	0x4
	brgz,a	%g4,	loop_2485
loop_2484:
	edge16l	%o2,	%o5,	%o7
	for	%f4,	%f0,	%f22
	std	%f10,	[%l7 + 0x30]
loop_2485:
	sra	%l6,	%l2,	%o0
	ta	%xcc,	0x7
	edge32l	%o4,	%l4,	%i6
	sll	%l5,	0x10,	%g6
	mova	%xcc,	%g3,	%l1
	smulcc	%l0,	%o6,	%o3
	srlx	%g1,	%g5,	%o1
	fors	%f30,	%f14,	%f15
	fbo	%fcc3,	loop_2486
	sllx	%i0,	%i1,	%i5
	edge16ln	%g2,	%i3,	%i7
	tn	%xcc,	0x4
loop_2486:
	srax	%i4,	0x1F,	%g7
	umul	%i2,	0x1D91,	%g4
	xnorcc	%o2,	%l3,	%o7
	fnors	%f9,	%f5,	%f31
	movvc	%icc,	%o5,	%l2
	sth	%l6,	[%l7 + 0x38]
	fmovsleu	%xcc,	%f15,	%f21
	udivx	%o4,	0x0E62,	%o0
	mulscc	%i6,	%l4,	%l5
	addc	%g6,	%l1,	%g3
	umul	%o6,	0x0340,	%o3
	sdiv	%l0,	0x0BB7,	%g5
	fmovrse	%g1,	%f24,	%f17
	sth	%o1,	[%l7 + 0x7E]
	movpos	%xcc,	%i0,	%i1
	smul	%g2,	%i5,	%i7
	nop
	setx	loop_2487,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmul8x16	%f14,	%f14,	%f10
	swap	[%l7 + 0x18],	%i4
	andncc	%g7,	%i3,	%g4
loop_2487:
	movrne	%i2,	%l3,	%o7
	bvc	loop_2488
	edge32	%o2,	%o5,	%l6
	tle	%xcc,	0x0
	fbn	%fcc3,	loop_2489
loop_2488:
	udivcc	%o4,	0x1C6A,	%l2
	fsrc2s	%f27,	%f29
	tneg	%xcc,	0x1
loop_2489:
	stb	%o0,	[%l7 + 0x0F]
	edge16l	%l4,	%l5,	%g6
	fmul8ulx16	%f30,	%f6,	%f24
	fbu	%fcc1,	loop_2490
	sir	0x0614
	sra	%l1,	0x11,	%i6
	nop
	set	0x54, %o2
	ldub	[%l7 + %o2],	%g3
loop_2490:
	tl	%xcc,	0x3
	sub	%o3,	0x0FC2,	%l0
	stx	%o6,	[%l7 + 0x58]
	ldd	[%l7 + 0x08],	%f18
	movrlz	%g1,	0x2A1,	%g5
	edge32n	%i0,	%o1,	%i1
	xnor	%i5,	0x0211,	%i7
	add	%i4,	0x117C,	%g7
	mova	%xcc,	%g2,	%g4
	fsrc1s	%f12,	%f8
	movl	%icc,	%i2,	%l3
	movneg	%icc,	%o7,	%i3
	nop
	fitos	%f14,	%f15
	fstoi	%f15,	%f19
	alignaddr	%o2,	%l6,	%o4
	orn	%l2,	%o5,	%l4
	array16	%l5,	%o0,	%l1
	fmovdle	%icc,	%f29,	%f29
	xorcc	%g6,	0x017B,	%g3
	edge8n	%i6,	%l0,	%o3
	stb	%o6,	[%l7 + 0x66]
	fand	%f0,	%f4,	%f6
	fbl,a	%fcc2,	loop_2491
	edge16	%g5,	%g1,	%i0
	fmovdleu	%icc,	%f26,	%f27
	tl	%icc,	0x1
loop_2491:
	edge16n	%o1,	%i5,	%i7
	bvc,pt	%icc,	loop_2492
	brlz	%i1,	loop_2493
	nop
	fitos	%f3,	%f11
	fstox	%f11,	%f18
	fxtos	%f18,	%f29
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%g7,	%g2
loop_2492:
	popc	%i4,	%g4
loop_2493:
	fsrc1s	%f22,	%f29
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%i2
	casa	[%l6] %asi,	%i2,	%l3
	fblg,a	%fcc3,	loop_2494
	movcs	%icc,	%o7,	%o2
	tneg	%xcc,	0x0
	subccc	%i3,	0x0B91,	%l6
loop_2494:
	array8	%l2,	%o5,	%l4
	movleu	%icc,	%l5,	%o4
	addcc	%o0,	0x1236,	%g6
	fand	%f16,	%f24,	%f26
	fnot1s	%f7,	%f4
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x3
	mova	%xcc,	%i6,	%l0
	nop
	setx	0xE071D183,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	srax	%o3,	%l1,	%g5
	edge8l	%o6,	%i0,	%o1
	bleu	loop_2495
	tcs	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	sta	%f12,	[%l7 + 0x14] %asi
loop_2495:
	andn	%i5,	%i7,	%i1
	xnorcc	%g7,	0x10F2,	%g1
	array16	%i4,	%g4,	%i2
	fzero	%f18
	lduw	[%l7 + 0x2C],	%l3
	movrlez	%o7,	0x3A7,	%o2
	tne	%xcc,	0x3
	edge8l	%i3,	%g2,	%l6
	sllx	%o5,	0x16,	%l4
	tvc	%icc,	0x6
	tcc	%xcc,	0x6
	fone	%f8
	fzero	%f12
	membar	0x52
	fmovrdgez	%l5,	%f30,	%f28
	tge	%xcc,	0x5
	movrgez	%l2,	%o0,	%o4
	popc	0x096D,	%g6
	fmovsle	%xcc,	%f18,	%f26
	edge32l	%g3,	%i6,	%o3
	brgez	%l1,	loop_2496
	xnorcc	%g5,	%o6,	%l0
	tcc	%icc,	0x6
	te	%xcc,	0x6
loop_2496:
	nop
	set	0x48, %l2
	ldub	[%l7 + %l2],	%o1
	movleu	%xcc,	%i5,	%i0
	set	0x68, %l5
	stxa	%i7,	[%l7 + %l5] 0xeb
	membar	#Sync
	be,pn	%xcc,	loop_2497
	edge32l	%g7,	%g1,	%i1
	fbe,a	%fcc3,	loop_2498
	sra	%g4,	%i2,	%i4
loop_2497:
	fcmpeq32	%f12,	%f26,	%l3
	movcs	%xcc,	%o7,	%o2
loop_2498:
	sub	%g2,	%l6,	%i3
	fmovsl	%icc,	%f5,	%f14
	bn,pt	%icc,	loop_2499
	andncc	%o5,	%l5,	%l2
	stb	%o0,	[%l7 + 0x12]
	fnors	%f30,	%f18,	%f31
loop_2499:
	umul	%l4,	0x0236,	%o4
	edge8ln	%g6,	%i6,	%g3
	udivcc	%l1,	0x07CF,	%g5
	fnot1s	%f31,	%f7
	lduw	[%l7 + 0x48],	%o3
	xorcc	%l0,	0x0EEC,	%o6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o1,	%i5
	xnor	%i7,	0x1174,	%g7
	edge16n	%g1,	%i0,	%i1
	pdist	%f4,	%f16,	%f8
	movn	%xcc,	%g4,	%i2
	sll	%i4,	0x1C,	%l3
	set	0x24, %g2
	lduwa	[%l7 + %g2] 0x0c,	%o7
	ble	%xcc,	loop_2500
	orcc	%o2,	%g2,	%i3
	set	0x26, %l1
	lduha	[%l7 + %l1] 0x19,	%o5
loop_2500:
	subccc	%l6,	%l5,	%l2
	mova	%xcc,	%o0,	%o4
	fbge	%fcc0,	loop_2501
	bcs,a,pt	%icc,	loop_2502
	udiv	%g6,	0x0704,	%i6
	edge32n	%l4,	%g3,	%g5
loop_2501:
	movpos	%xcc,	%l1,	%o3
loop_2502:
	bn,a	%icc,	loop_2503
	movge	%xcc,	%l0,	%o6
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x5C] %asi,	%f1
loop_2503:
	mulscc	%i5,	0x12EC,	%o1
	mulx	%i7,	0x1FEE,	%g7
	nop
	fitod	%f0,	%f28
	fdtos	%f28,	%f22
	edge8ln	%g1,	%i1,	%g4
	xnor	%i2,	%i0,	%i4
	nop
	setx	0x12752A1B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x979037E6,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f22,	%f31
	fmuld8ulx16	%f27,	%f6,	%f24
	tsubcctv	%l3,	%o2,	%o7
	tle	%icc,	0x5
	movl	%xcc,	%g2,	%o5
	nop
	fitod	%f8,	%f8
	fdtox	%f8,	%f30
	fxtod	%f30,	%f14
	edge16n	%i3,	%l6,	%l5
	umulcc	%l2,	%o4,	%o0
	tge	%xcc,	0x6
	sdivcc	%i6,	0x1E0E,	%l4
	umulcc	%g3,	%g5,	%l1
	fbue	%fcc2,	loop_2504
	fnand	%f2,	%f26,	%f30
	fmovsg	%xcc,	%f18,	%f15
	orncc	%g6,	%o3,	%o6
loop_2504:
	fpsub16s	%f19,	%f28,	%f23
	fbl	%fcc2,	loop_2505
	bneg,a,pn	%icc,	loop_2506
	umulcc	%l0,	0x08B5,	%i5
	taddcc	%o1,	%i7,	%g1
loop_2505:
	edge16n	%i1,	%g4,	%i2
loop_2506:
	sir	0x1A8E
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x68] %asi,	%g7
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0xf8,	%f0
	tcs	%icc,	0x4
	edge8n	%i0,	%i4,	%l3
	movre	%o2,	%g2,	%o5
	move	%xcc,	%i3,	%o7
	bge,a	loop_2507
	ldx	[%l7 + 0x58],	%l5
	smulcc	%l2,	0x0A0F,	%o4
	edge16	%l6,	%i6,	%o0
loop_2507:
	fmuld8ulx16	%f18,	%f14,	%f4
	set	0x70, %i6
	lduwa	[%l7 + %i6] 0x04,	%l4
	tneg	%xcc,	0x0
	tne	%icc,	0x2
	nop
	setx	0x1EB62EC60FCE739D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x3FCF66E8B7E335CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f30,	%f26
	addccc	%g5,	%g3,	%g6
	udiv	%o3,	0x0D28,	%l1
	popc	0x087C,	%o6
	tsubcctv	%l0,	%o1,	%i7
	be,a	loop_2508
	nop
	setx	loop_2509,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	xnorcc	%i5,	0x08C6,	%i1
	edge16ln	%g4,	%g1,	%i2
loop_2508:
	stb	%i0,	[%l7 + 0x67]
loop_2509:
	tvc	%xcc,	0x6
	nop
	setx	0x50177FE1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x89642E34,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fdivs	%f21,	%f10,	%f14
	or	%g7,	0x15E0,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i4,	0x030,	%g2
	mulx	%o5,	%o2,	%o7
	move	%icc,	%l5,	%l2
	sdiv	%i3,	0x14D5,	%o4
	andncc	%i6,	%l6,	%l4
	umulcc	%g5,	%o0,	%g6
	add	%g3,	0x1A05,	%o3
	fmovrdgez	%o6,	%f20,	%f0
	fmovsgu	%icc,	%f1,	%f12
	nop
	fitos	%f30,	%f4
	array8	%l0,	%o1,	%l1
	nop
	fitod	%f4,	%f24
	ldd	[%l7 + 0x08],	%i4
	fmovd	%f12,	%f20
	tvs	%xcc,	0x3
	fsrc1s	%f2,	%f3
	te	%icc,	0x5
	edge16ln	%i7,	%i1,	%g4
	fmovrdlz	%g1,	%f4,	%f20
	bg	loop_2510
	taddcctv	%i2,	%g7,	%l3
	mulx	%i0,	0x1A92,	%g2
	fmuld8sux16	%f3,	%f16,	%f8
loop_2510:
	array32	%i4,	%o5,	%o7
	addc	%l5,	%o2,	%l2
	tle	%xcc,	0x3
	movg	%xcc,	%o4,	%i3
	flush	%l7 + 0x58
	wr	%g0,	0x10,	%asi
	stha	%l6,	[%l7 + 0x34] %asi
	udiv	%l4,	0x01F8,	%i6
	tleu	%xcc,	0x4
	sllx	%g5,	%g6,	%g3
	srl	%o0,	%o3,	%l0
	bneg,a,pn	%icc,	loop_2511
	nop
	setx	0x304A205B,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	movn	%xcc,	%o1,	%o6
	movrlz	%l1,	0x352,	%i5
loop_2511:
	or	%i1,	%g4,	%i7
	fbe	%fcc1,	loop_2512
	nop
	setx	0x00797438,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	fsqrts	%f10,	%f18
	array16	%i2,	%g7,	%g1
	ldsw	[%l7 + 0x58],	%l3
loop_2512:
	faligndata	%f14,	%f24,	%f22
	fbul	%fcc2,	loop_2513
	tneg	%xcc,	0x6
	or	%i0,	%i4,	%g2
	edge32	%o5,	%o7,	%o2
loop_2513:
	edge32l	%l5,	%l2,	%i3
	fbug,a	%fcc1,	loop_2514
	nop
	fitod	%f23,	%f10
	array32	%l6,	%l4,	%o4
	ble,a,pn	%icc,	loop_2515
loop_2514:
	fmovrsgz	%g5,	%f15,	%f17
	movre	%g6,	%i6,	%o0
	fmovsn	%xcc,	%f20,	%f4
loop_2515:
	bgu,a	loop_2516
	move	%xcc,	%g3,	%l0
	fnegd	%f12,	%f4
	edge8ln	%o3,	%o6,	%l1
loop_2516:
	nop
	setx loop_2517, %l0, %l1
	jmpl %l1, %i5
	smulcc	%i1,	%g4,	%o1
	andcc	%i2,	%i7,	%g1
	array32	%g7,	%i0,	%i4
loop_2517:
	tvc	%icc,	0x5
	tle	%icc,	0x4
	ld	[%l7 + 0x7C],	%f9
	wr	%g0,	0x1e,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	orncc	%g2,	%l3,	%o7
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	movle	%icc,	%l5,	%o5
	srlx	%l2,	%i3,	%l4
	fbl	%fcc2,	loop_2518
	nop
	setx	0x8B6C257B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xAA23E75C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f21,	%f28
	fmovdleu	%icc,	%f29,	%f4
	movpos	%xcc,	%l6,	%o4
loop_2518:
	array8	%g6,	%i6,	%g5
	te	%xcc,	0x3
	sub	%o0,	%l0,	%g3
	edge8l	%o3,	%l1,	%o6
	sllx	%i5,	%i1,	%g4
	edge8ln	%i2,	%o1,	%i7
	tne	%xcc,	0x2
	xnor	%g1,	0x0FAA,	%g7
	fmovrse	%i4,	%f12,	%f21
	movg	%xcc,	%g2,	%i0
	xnorcc	%o7,	0x1DD0,	%o2
	fmuld8sux16	%f0,	%f20,	%f12
	xor	%l3,	0x18C7,	%l5
	movle	%xcc,	%o5,	%l2
	srl	%l4,	0x0C,	%l6
	subcc	%o4,	%i3,	%g6
	bneg,pn	%xcc,	loop_2519
	lduh	[%l7 + 0x24],	%g5
	edge8	%i6,	%o0,	%g3
	movrgz	%o3,	%l0,	%l1
loop_2519:
	bleu,a,pn	%icc,	loop_2520
	movn	%xcc,	%o6,	%i5
	sll	%i1,	0x12,	%i2
	tn	%icc,	0x1
loop_2520:
	bpos,a,pn	%xcc,	loop_2521
	fmovdcs	%xcc,	%f24,	%f25
	fmovdgu	%icc,	%f8,	%f0
	bvs,a,pn	%xcc,	loop_2522
loop_2521:
	fmovdcs	%xcc,	%f27,	%f19
	fones	%f27
	tge	%xcc,	0x3
loop_2522:
	brgz	%o1,	loop_2523
	tsubcctv	%g4,	0x12A1,	%g1
	andn	%g7,	%i7,	%g2
	tneg	%icc,	0x1
loop_2523:
	fbg,a	%fcc1,	loop_2524
	move	%icc,	%i0,	%o7
	fcmpeq32	%f8,	%f26,	%i4
	sethi	0x05FF,	%l3
loop_2524:
	fmovdvc	%icc,	%f6,	%f29
	tsubcctv	%l5,	%o5,	%o2
	set	0x43, %g1
	stba	%l4,	[%l7 + %g1] 0x2f
	membar	#Sync
	nop
	set	0x68, %g4
	sth	%l2,	[%l7 + %g4]
	movgu	%xcc,	%l6,	%i3
	xorcc	%o4,	0x1BDE,	%g6
	fzeros	%f1
	set	0x24, %i7
	swapa	[%l7 + %i7] 0x10,	%i6
	nop
	fitod	%f10,	%f8
	fdtoi	%f8,	%f30
	te	%icc,	0x1
	fmovrdne	%o0,	%f8,	%f4
	fornot2s	%f15,	%f14,	%f19
	fbue,a	%fcc3,	loop_2525
	udiv	%g3,	0x1EEA,	%g5
	movvs	%icc,	%o3,	%l1
	edge16l	%l0,	%i5,	%o6
loop_2525:
	popc	0x13B1,	%i2
	fmul8x16au	%f10,	%f1,	%f4
	movleu	%xcc,	%i1,	%o1
	fmovdle	%xcc,	%f16,	%f4
	edge8l	%g1,	%g7,	%g4
	tvs	%icc,	0x7
	fbu,a	%fcc0,	loop_2526
	xnor	%g2,	%i0,	%o7
	brgz	%i7,	loop_2527
	fnot1s	%f6,	%f30
loop_2526:
	tle	%icc,	0x3
	alignaddr	%i4,	%l3,	%l5
loop_2527:
	andn	%o5,	0x13F0,	%l4
	bl,a,pt	%icc,	loop_2528
	fmuld8sux16	%f0,	%f16,	%f20
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x17] %asi,	%l2
loop_2528:
	mulscc	%o2,	%i3,	%o4
	movrne	%g6,	0x3EF,	%l6
	tvs	%xcc,	0x6
	fba	%fcc3,	loop_2529
	fbue,a	%fcc1,	loop_2530
	fexpand	%f5,	%f22
	movrne	%o0,	%g3,	%g5
loop_2529:
	udivx	%i6,	0x1DDD,	%l1
loop_2530:
	te	%xcc,	0x4
	and	%l0,	%o3,	%o6
	nop
	fitod	%f6,	%f16
	fdtoi	%f16,	%f22
	sll	%i5,	0x01,	%i2
	tl	%icc,	0x0
	fmovsneg	%xcc,	%f7,	%f23
	bvs,a	loop_2531
	bvc,a,pt	%xcc,	loop_2532
	sll	%o1,	%g1,	%g7
	movre	%g4,	%g2,	%i0
loop_2531:
	edge32	%i1,	%o7,	%i4
loop_2532:
	brlez,a	%l3,	loop_2533
	andncc	%l5,	%i7,	%o5
	fble	%fcc0,	loop_2534
	tvc	%xcc,	0x2
loop_2533:
	movleu	%icc,	%l4,	%l2
	orncc	%i3,	%o4,	%g6
loop_2534:
	nop
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x5C] %asi,	%l6
	sdivx	%o2,	0x035D,	%o0
	fbug,a	%fcc1,	loop_2535
	tl	%icc,	0x0
	nop
	fitod	%f8,	%f22
	nop
	setx	0xFC7D903D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xE4FD8856,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fdivs	%f4,	%f17,	%f16
loop_2535:
	movgu	%xcc,	%g3,	%i6
	movrlz	%l1,	%l0,	%g5
	taddcc	%o3,	0x08A4,	%o6
	edge16l	%i5,	%o1,	%g1
	udivx	%g7,	0x005B,	%g4
	lduw	[%l7 + 0x78],	%g2
	movrgz	%i2,	%i1,	%i0
	sra	%o7,	%i4,	%l5
	fmovdleu	%icc,	%f22,	%f18
	std	%f14,	[%l7 + 0x10]
	nop
	setx	0x8635D1C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xA7D06B39,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f0,	%f0
	tl	%xcc,	0x0
	fpmerge	%f24,	%f27,	%f20
	flush	%l7 + 0x4C
	move	%xcc,	%l3,	%o5
	fmovsa	%xcc,	%f15,	%f31
	tge	%icc,	0x3
	tgu	%xcc,	0x5
	bge	%icc,	loop_2536
	udivx	%i7,	0x0EAB,	%l4
	andn	%l2,	0x053E,	%o4
	movl	%xcc,	%i3,	%g6
loop_2536:
	fmovdvc	%xcc,	%f16,	%f10
	set	0x30, %g7
	stwa	%o2,	[%l7 + %g7] 0xe2
	membar	#Sync
	fpadd32	%f24,	%f4,	%f4
	addcc	%l6,	%o0,	%g3
	bgu,a	%xcc,	loop_2537
	sdiv	%l1,	0x1B0D,	%l0
	fbug,a	%fcc2,	loop_2538
	popc	%g5,	%i6
loop_2537:
	ldsh	[%l7 + 0x38],	%o3
	movvs	%xcc,	%o6,	%i5
loop_2538:
	bvs,a,pt	%icc,	loop_2539
	fblg,a	%fcc3,	loop_2540
	xorcc	%g1,	%g7,	%o1
	taddcc	%g2,	%g4,	%i1
loop_2539:
	addc	%i0,	%o7,	%i2
loop_2540:
	nop
	set	0x20, %g5
	ldxa	[%l7 + %g5] 0x89,	%i4
	movrgz	%l5,	0x09D,	%l3
	array32	%i7,	%l4,	%o5
	movvc	%xcc,	%o4,	%l2
	fpadd32s	%f21,	%f30,	%f19
	movpos	%xcc,	%g6,	%o2
	bcc,a,pn	%icc,	loop_2541
	brlez,a	%i3,	loop_2542
	and	%o0,	0x0FA4,	%g3
	st	%f15,	[%l7 + 0x58]
loop_2541:
	nop
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%l1,	%l0
loop_2542:
	be,a	%xcc,	loop_2543
	prefetch	[%l7 + 0x64],	 0x2
	and	%l6,	0x1A7B,	%i6
	ld	[%l7 + 0x6C],	%f12
loop_2543:
	nop
	setx	0x4780F0777514E785,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x9344F84B9C833C80,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	faddd	%f24,	%f6,	%f28
	fcmple32	%f12,	%f30,	%g5
	movleu	%xcc,	%o6,	%o3
	fornot2	%f4,	%f12,	%f8
	movrgez	%g1,	%g7,	%i5
	bvs,a	%xcc,	loop_2544
	tvs	%icc,	0x6
	fmovsge	%xcc,	%f21,	%f1
	edge32ln	%g2,	%g4,	%o1
loop_2544:
	ta	%xcc,	0x0
	tne	%icc,	0x2
	array16	%i1,	%o7,	%i2
	alignaddr	%i0,	%i4,	%l3
	smulcc	%i7,	0x0B43,	%l4
	mulscc	%o5,	%l5,	%l2
	set	0x28, %o7
	stha	%o4,	[%l7 + %o7] 0x18
	brgz	%g6,	loop_2545
	srax	%o2,	0x09,	%o0
	smul	%i3,	%l1,	%g3
	nop
	setx	0xB2C25B3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xF26FEA76,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f21,	%f22
loop_2545:
	movvc	%icc,	%l6,	%i6
	fmovrsgez	%g5,	%f31,	%f1
	udivcc	%o6,	0x0195,	%l0
	sllx	%g1,	0x16,	%o3
	bgu,a,pn	%icc,	loop_2546
	edge8ln	%i5,	%g7,	%g2
	fba,a	%fcc1,	loop_2547
	tsubcc	%o1,	%i1,	%g4
loop_2546:
	nop
	fitod	%f22,	%f8
	tvs	%xcc,	0x2
loop_2547:
	fpadd32	%f22,	%f16,	%f10
	alignaddrl	%i2,	%i0,	%i4
	fmul8x16	%f8,	%f14,	%f30
	fmovda	%icc,	%f7,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l3,	%o7
	xorcc	%l4,	0x1DFD,	%o5
	fand	%f28,	%f28,	%f24
	tpos	%icc,	0x2
	movrgz	%i7,	%l2,	%o4
	tge	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	stha	%l5,	[%l7 + 0x4A] %asi
	sdivx	%o2,	0x1830,	%o0
	xor	%g6,	0x0E6F,	%l1
	movpos	%icc,	%i3,	%g3
	ba,a	loop_2548
	tsubcctv	%i6,	0x16C5,	%l6
	addc	%g5,	0x0563,	%o6
	fmovsg	%xcc,	%f17,	%f0
loop_2548:
	srax	%g1,	0x16,	%o3
	fpadd16s	%f27,	%f19,	%f6
	subc	%l0,	%i5,	%g2
	smul	%g7,	0x0443,	%i1
	fmovsne	%xcc,	%f12,	%f18
	array32	%o1,	%i2,	%g4
	umulcc	%i0,	0x1545,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l3,	%o7,	%l4
	tneg	%xcc,	0x0
	edge16n	%i7,	%o5,	%o4
	edge8	%l2,	%l5,	%o2
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o0
	sethi	0x0543,	%l1
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	ldstub	[%l7 + 0x71],	%g3
	fmovdge	%icc,	%f1,	%f5
	stx	%i6,	[%l7 + 0x10]
	bneg,a	loop_2549
	fpadd16s	%f25,	%f21,	%f27
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x80] %asi,	%g6
loop_2549:
	movne	%icc,	%g5,	%l6
	xorcc	%o6,	%o3,	%g1
	edge16ln	%l0,	%g2,	%g7
	orn	%i1,	%o1,	%i5
	smulcc	%g4,	%i2,	%i0
	fpadd32s	%f0,	%f24,	%f25
	set	0x40, %o6
	stda	%f16,	[%l7 + %o6] 0x1f
	membar	#Sync
	movneg	%xcc,	%i4,	%o7
	edge16l	%l3,	%i7,	%o5
	umulcc	%o4,	%l4,	%l2
	edge32	%l5,	%o2,	%o0
	taddcc	%i3,	%g3,	%i6
	ldsw	[%l7 + 0x5C],	%l1
	set	0x29, %g6
	stba	%g5,	[%l7 + %g6] 0x10
	fone	%f2
	udivcc	%l6,	0x07D0,	%g6
	srlx	%o3,	0x1A,	%o6
	movn	%icc,	%l0,	%g1
	fmovrsne	%g7,	%f3,	%f22
	tpos	%xcc,	0x7
	nop
	setx	0x4F1F5EDD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xCA1527EA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f31,	%f15
	tneg	%xcc,	0x5
	nop
	setx	0x405E2E6F,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	addccc	%i1,	0x1E5B,	%g2
	addcc	%i5,	%g4,	%o1
	orn	%i2,	0x0200,	%i0
	movcc	%xcc,	%o7,	%i4
	fcmple32	%f16,	%f8,	%l3
	subcc	%o5,	%i7,	%o4
	mulx	%l2,	0x1319,	%l5
	subc	%o2,	%l4,	%o0
	movrlz	%g3,	0x3B4,	%i6
	fcmpgt32	%f14,	%f8,	%l1
	addcc	%i3,	%g5,	%g6
	smulcc	%l6,	%o3,	%l0
	fmovdvc	%xcc,	%f27,	%f14
	taddcctv	%o6,	%g7,	%i1
	edge16	%g1,	%i5,	%g2
	fandnot1s	%f6,	%f4,	%f22
	sdivx	%g4,	0x0F6A,	%i2
	set	0x74, %l0
	lduwa	[%l7 + %l0] 0x14,	%o1
	te	%icc,	0x2
	fcmpeq16	%f18,	%f20,	%o7
	orncc	%i0,	%l3,	%i4
	fmovsge	%icc,	%f8,	%f10
	nop
	fitod	%f12,	%f8
	fdtos	%f8,	%f16
	subccc	%o5,	0x06D8,	%i7
	bl,pt	%xcc,	loop_2550
	fmovrdlez	%l2,	%f4,	%f30
	andcc	%l5,	%o4,	%l4
	orncc	%o0,	%o2,	%g3
loop_2550:
	srlx	%i6,	%i3,	%g5
	udivx	%g6,	0x0FCE,	%l1
	tle	%xcc,	0x5
	srlx	%l6,	0x01,	%o3
	sdivcc	%o6,	0x08E3,	%g7
	edge16l	%i1,	%g1,	%i5
	orncc	%g2,	0x1788,	%g4
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	orncc	%l0,	0x0980,	%o7
	fpadd16s	%f26,	%f22,	%f12
	movge	%xcc,	%i0,	%o1
	tpos	%icc,	0x6
	edge8ln	%l3,	%o5,	%i4
	ld	[%l7 + 0x78],	%f18
	movle	%xcc,	%l2,	%i7
	fbue	%fcc1,	loop_2551
	tvc	%icc,	0x1
	edge32	%o4,	%l5,	%o0
	sdivcc	%o2,	0x02F2,	%l4
loop_2551:
	fmovdneg	%xcc,	%f24,	%f19
	fmovrse	%g3,	%f7,	%f7
	movrgez	%i3,	%i6,	%g6
	bge	%icc,	loop_2552
	call	loop_2553
	fmovsle	%icc,	%f3,	%f9
	move	%xcc,	%g5,	%l1
loop_2552:
	tsubcctv	%l6,	%o3,	%g7
loop_2553:
	udiv	%o6,	0x0D91,	%i1
	nop
	setx	0x3E61E19A4C5A386A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x6D23EE04E1D962B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f26,	%f10
	movrgez	%i5,	0x10C,	%g2
	udiv	%g1,	0x1024,	%g4
	move	%xcc,	%l0,	%i2
	fbu,a	%fcc1,	loop_2554
	fpack16	%f16,	%f10
	stbar
	array16	%o7,	%i0,	%l3
loop_2554:
	movcc	%icc,	%o5,	%o1
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	stxa	%i4,	[%g0 + 0x1c0] %asi ripped by fixASI40.pl ripped by fixASI40.pl
	edge32n	%i7,	%l2,	%o4
	mova	%xcc,	%o0,	%l5
	xor	%l4,	%g3,	%o2
	fandnot1s	%f4,	%f10,	%f0
	udiv	%i6,	0x0DE4,	%g6
	movleu	%icc,	%i3,	%g5
	and	%l6,	%l1,	%g7
	addcc	%o6,	0x1A46,	%o3
	tne	%xcc,	0x1
	fmuld8ulx16	%f5,	%f5,	%f18
	nop
	fitos	%f13,	%f10
	fstod	%f10,	%f20
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f14
	fxtod	%f14,	%f14
	mulscc	%i1,	0x0782,	%i5
	fone	%f22
	fbu	%fcc0,	loop_2555
	tl	%icc,	0x6
	taddcctv	%g1,	0x008D,	%g2
	wr	%g0,	0x80,	%asi
	stba	%g4,	[%l7 + 0x30] %asi
loop_2555:
	array32	%l0,	%i2,	%i0
	tl	%icc,	0x4
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movl	%xcc,	%o7,	%l3
	stb	%o1,	[%l7 + 0x1E]
	fbe,a	%fcc0,	loop_2556
	nop
	fitod	%f7,	%f30
	wr	%g0,	0x10,	%asi
	stwa	%i4,	[%l7 + 0x08] %asi
loop_2556:
	bleu	loop_2557
	fpmerge	%f30,	%f16,	%f30
	srl	%o5,	%i7,	%o4
	andn	%l2,	%o0,	%l4
loop_2557:
	srl	%l5,	0x03,	%g3
	smulcc	%i6,	%o2,	%i3
	tleu	%xcc,	0x4
	sll	%g6,	%g5,	%l6
	tgu	%icc,	0x1
	ta	%xcc,	0x7
	array32	%g7,	%o6,	%o3
	alignaddr	%i1,	%i5,	%g1
	array16	%l1,	%g2,	%g4
	edge16n	%l0,	%i0,	%o7
	movneg	%icc,	%i2,	%o1
	stbar
	tpos	%icc,	0x0
	fblg	%fcc1,	loop_2558
	movneg	%xcc,	%l3,	%i4
	brgez,a	%i7,	loop_2559
	fbne,a	%fcc2,	loop_2560
loop_2558:
	alignaddr	%o5,	%o4,	%l2
	set	0x30, %o4
	lda	[%l7 + %o4] 0x18,	%f20
loop_2559:
	nop
	setx	0xCD3AD0D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f15
loop_2560:
	fpack16	%f6,	%f5
	ldstub	[%l7 + 0x08],	%o0
	alignaddrl	%l5,	%g3,	%l4
	alignaddrl	%o2,	%i3,	%i6
	movrgez	%g6,	%g5,	%l6
	fnor	%f2,	%f30,	%f10
	move	%icc,	%o6,	%o3
	movcs	%icc,	%i1,	%g7
	fcmpeq16	%f20,	%f12,	%i5
	nop
	setx	loop_2561,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	mova	%xcc,	%l1,	%g1
	edge8ln	%g2,	%g4,	%l0
	mova	%icc,	%o7,	%i2
loop_2561:
	brz,a	%o1,	loop_2562
	bvs,a	loop_2563
	alignaddrl	%l3,	%i4,	%i0
	movrlz	%o5,	%o4,	%i7
loop_2562:
	fmovsvs	%icc,	%f5,	%f17
loop_2563:
	sdiv	%o0,	0x1676,	%l5
	orcc	%l2,	0x0CF3,	%l4
	array16	%o2,	%i3,	%i6
	tg	%xcc,	0x1
	bge,a	%icc,	loop_2564
	nop
	setx	0x1077F564,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	prefetch	[%l7 + 0x2C],	 0x3
	bneg,pt	%xcc,	loop_2565
loop_2564:
	tn	%xcc,	0x1
	edge8	%g3,	%g5,	%g6
	tleu	%xcc,	0x0
loop_2565:
	tleu	%icc,	0x0
	stb	%o6,	[%l7 + 0x17]
	movvs	%icc,	%l6,	%i1
	fbge,a	%fcc0,	loop_2566
	umulcc	%g7,	%o3,	%l1
	prefetch	[%l7 + 0x6C],	 0x1
	fnands	%f0,	%f15,	%f30
loop_2566:
	tg	%xcc,	0x0
	fmovdleu	%xcc,	%f20,	%f4
	stx	%i5,	[%l7 + 0x30]
	sdivx	%g2,	0x0C0A,	%g1
	alignaddr	%g4,	%o7,	%l0
	sdiv	%o1,	0x0C4C,	%i2
	add	%l3,	0x15FC,	%i4
	fones	%f16
	sra	%o5,	0x1C,	%o4
	taddcctv	%i7,	0x1368,	%o0
	tsubcc	%i0,	%l2,	%l4
	udiv	%o2,	0x0745,	%l5
	call	loop_2567
	movvc	%xcc,	%i3,	%i6
	nop
	setx loop_2568, %l0, %l1
	jmpl %l1, %g3
	move	%icc,	%g5,	%o6
loop_2567:
	bge,a	%icc,	loop_2569
	tneg	%icc,	0x7
loop_2568:
	tn	%xcc,	0x0
	ldsw	[%l7 + 0x20],	%g6
loop_2569:
	fmovdn	%xcc,	%f0,	%f28
	ldd	[%l7 + 0x70],	%i6
	orncc	%g7,	%i1,	%l1
	addc	%o3,	0x0491,	%i5
	taddcc	%g2,	0x09E4,	%g1
	array32	%g4,	%o7,	%l0
	fbg	%fcc1,	loop_2570
	tle	%xcc,	0x5
	xor	%o1,	%i2,	%l3
	tl	%icc,	0x4
loop_2570:
	sir	0x0AF8
	st	%f5,	[%l7 + 0x68]
	ldd	[%l7 + 0x08],	%f10
	udivcc	%i4,	0x1F78,	%o5
	ldstub	[%l7 + 0x0F],	%o4
	xorcc	%i7,	0x1B67,	%o0
	move	%icc,	%l2,	%l4
	ble,a,pt	%icc,	loop_2571
	move	%xcc,	%o2,	%i0
	fsrc1	%f16,	%f2
	nop
	fitos	%f6,	%f23
loop_2571:
	subcc	%l5,	0x0D50,	%i3
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f16
	tgu	%xcc,	0x6
	umul	%i6,	%g3,	%g5
	bl,a,pt	%icc,	loop_2572
	edge8	%g6,	%l6,	%g7
	fba	%fcc3,	loop_2573
	xor	%o6,	0x09CF,	%i1
loop_2572:
	fpsub16s	%f24,	%f30,	%f14
	and	%o3,	%l1,	%i5
loop_2573:
	nop
	set	0x58, %o3
	stwa	%g1,	[%l7 + %o3] 0x15
	set	0x28, %l6
	ldxa	[%g0 + %l6] 0x4f,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x10
	edge8	%g2,	%l0,	%o7
	srlx	%i2,	0x0D,	%o1
	andncc	%l3,	%o5,	%o4
	ldsb	[%l7 + 0x0D],	%i4
	call	loop_2574
	movrgez	%i7,	%o0,	%l2
	brlz,a	%l4,	loop_2575
	tge	%xcc,	0x1
loop_2574:
	tcs	%xcc,	0x6
	nop
	setx	loop_2576,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2575:
	srl	%i0,	0x0A,	%o2
	movvs	%xcc,	%i3,	%i6
	tvc	%icc,	0x7
loop_2576:
	subcc	%g3,	%l5,	%g6
	addc	%l6,	0x1F36,	%g7
	ble	loop_2577
	fcmpgt16	%f22,	%f22,	%o6
	xnorcc	%i1,	0x0AA5,	%o3
	edge8n	%l1,	%g5,	%g1
loop_2577:
	fzeros	%f27
	tne	%xcc,	0x0
	sllx	%g4,	%g2,	%l0
	nop
	setx loop_2578, %l0, %l1
	jmpl %l1, %i5
	srl	%i2,	0x07,	%o7
	fpack16	%f24,	%f10
	fble,a	%fcc1,	loop_2579
loop_2578:
	sllx	%o1,	%o5,	%o4
	brgez,a	%i4,	loop_2580
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2579:
	movrgez	%i7,	0x3F1,	%l3
	fmovdcs	%xcc,	%f26,	%f3
loop_2580:
	srl	%l2,	%o0,	%i0
	udiv	%l4,	0x194B,	%i3
	edge16ln	%i6,	%g3,	%l5
	bneg,pn	%xcc,	loop_2581
	membar	0x3C
	smul	%g6,	%l6,	%o2
	movcc	%icc,	%o6,	%i1
loop_2581:
	ldd	[%l7 + 0x20],	%f10
	fcmpeq32	%f2,	%f12,	%o3
	flush	%l7 + 0x10
	ldsh	[%l7 + 0x22],	%g7
	edge32	%l1,	%g1,	%g4
	fmovsvs	%xcc,	%f17,	%f13
	bpos,a,pt	%xcc,	loop_2582
	orn	%g2,	%g5,	%i5
	popc	0x0121,	%i2
	andncc	%o7,	%o1,	%l0
loop_2582:
	andcc	%o5,	%i4,	%i7
	fxnors	%f13,	%f25,	%f18
	orcc	%l3,	%o4,	%l2
	tneg	%icc,	0x5
	tvc	%xcc,	0x0
	fnot1s	%f8,	%f7
	tge	%icc,	0x3
	fbo	%fcc3,	loop_2583
	array8	%o0,	%l4,	%i0
	edge8ln	%i6,	%i3,	%g3
	sir	0x0247
loop_2583:
	tpos	%icc,	0x7
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x0A] %asi,	%g6
	bcs	%xcc,	loop_2584
	tpos	%icc,	0x5
	edge16ln	%l5,	%o2,	%o6
	sdivx	%i1,	0x14F8,	%l6
loop_2584:
	fpack32	%f14,	%f28,	%f10
	fone	%f18
	umulcc	%g7,	%l1,	%o3
	add	%g1,	0x1DF3,	%g4
	brgz,a	%g5,	loop_2585
	sra	%g2,	0x14,	%i2
	movrne	%o7,	0x2C2,	%o1
	umul	%i5,	0x0E9D,	%l0
loop_2585:
	sir	0x0292
	membar	0x01
	tvc	%xcc,	0x1
	fmovdl	%icc,	%f18,	%f29
	set	0x120, %l3
	ldxa	[%g0 + %l3] 0x52,	%o5
	brlez,a	%i4,	loop_2586
	fnot1	%f28,	%f16
	fpadd32s	%f26,	%f19,	%f27
	srax	%i7,	0x01,	%l3
loop_2586:
	fzero	%f2
	edge32l	%l2,	%o0,	%l4
	nop
	setx	0xF2923783,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x3EF13971,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f2,	%f28
	xnorcc	%i0,	0x0054,	%i6
	tle	%xcc,	0x6
	tl	%xcc,	0x1
	add	%l7,	0x74,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] %asi,	%o4,	%g3
	movrne	%g6,	%l5,	%o2
	bcc,a	%xcc,	loop_2587
	fmul8sux16	%f8,	%f16,	%f22
	fzero	%f8
	tpos	%icc,	0x7
loop_2587:
	smul	%i3,	0x00DA,	%o6
	nop
	setx	0x26D1647772C5DCF2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f28
	umul	%i1,	0x0BB0,	%g7
	udiv	%l6,	0x1046,	%o3
	nop
	fitos	%f18,	%f0
	fmovrdlz	%l1,	%f0,	%f22
	fabsd	%f20,	%f16
	nop
	setx loop_2588, %l0, %l1
	jmpl %l1, %g4
	edge16ln	%g1,	%g5,	%i2
	set	0x5C, %i3
	ldstuba	[%l7 + %i3] 0x89,	%o7
loop_2588:
	bgu,pt	%icc,	loop_2589
	tl	%xcc,	0x7
	movrlz	%g2,	%i5,	%o1
	fmovdvs	%xcc,	%f23,	%f10
loop_2589:
	fmovsg	%xcc,	%f20,	%f1
	brgz	%o5,	loop_2590
	edge32l	%l0,	%i4,	%i7
	taddcc	%l3,	%o0,	%l4
	movvc	%icc,	%i0,	%l2
loop_2590:
	movrlez	%i6,	0x159,	%o4
	edge32ln	%g3,	%l5,	%o2
	alignaddr	%i3,	%o6,	%i1
	bleu,pn	%xcc,	loop_2591
	movre	%g7,	0x078,	%l6
	movcs	%icc,	%o3,	%l1
	orcc	%g6,	0x04B4,	%g1
loop_2591:
	tvc	%icc,	0x5
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x11] %asi,	%g5
	movge	%xcc,	%i2,	%g4
	edge16n	%g2,	%o7,	%o1
	fpadd16s	%f4,	%f1,	%f8
	tne	%icc,	0x1
	movg	%icc,	%i5,	%o5
	udivcc	%i4,	0x03BB,	%l0
	stbar
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x88,	%f0
	alignaddr	%i7,	%l3,	%l4
	movrlez	%i0,	%o0,	%l2
	movrgz	%i6,	0x3A0,	%g3
	fbo	%fcc3,	loop_2592
	tg	%icc,	0x5
	tg	%xcc,	0x0
	popc	0x12FB,	%o4
loop_2592:
	lduw	[%l7 + 0x14],	%o2
	tn	%xcc,	0x0
	tsubcctv	%i3,	%o6,	%i1
	bcs	%xcc,	loop_2593
	array16	%l5,	%l6,	%g7
	udivcc	%l1,	0x1E6F,	%o3
	fmovsneg	%icc,	%f5,	%f18
loop_2593:
	sub	%g1,	0x0DCF,	%g5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x89,	%i2,	%g6
	mulx	%g4,	%g2,	%o7
	call	loop_2594
	addcc	%o1,	%i5,	%i4
	tcs	%icc,	0x3
	array8	%l0,	%o5,	%i7
loop_2594:
	movleu	%icc,	%l4,	%i0
	movle	%icc,	%l3,	%o0
	bn,pn	%icc,	loop_2595
	nop
	setx	loop_2596,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsleu	%icc,	%f5,	%f22
	fmovrsgez	%i6,	%f17,	%f19
loop_2595:
	ld	[%l7 + 0x08],	%f7
loop_2596:
	srax	%g3,	0x12,	%l2
	edge16l	%o2,	%i3,	%o4
	bcc,a,pt	%icc,	loop_2597
	brlez,a	%o6,	loop_2598
	te	%xcc,	0x5
	nop
	setx	0x5A52C89D8FE68C05,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f12
loop_2597:
	fsrc2s	%f3,	%f29
loop_2598:
	fmovsleu	%xcc,	%f1,	%f28
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i1,	%l6,	%g7
	smulcc	%l5,	%l1,	%o3
	fors	%f28,	%f2,	%f20
	brz	%g5,	loop_2599
	move	%xcc,	%g1,	%g6
	tsubcc	%g4,	%i2,	%g2
	ble,a,pt	%icc,	loop_2600
loop_2599:
	andncc	%o1,	%o7,	%i5
	bn,pn	%xcc,	loop_2601
	nop
	setx	0xFF9488DEB0658FEA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
loop_2600:
	xorcc	%l0,	%o5,	%i4
	sir	0x0650
loop_2601:
	mulx	%l4,	0x08E3,	%i0
	edge8ln	%l3,	%o0,	%i6
	fmovsleu	%icc,	%f24,	%f26
	edge16n	%i7,	%l2,	%g3
	brgez,a	%i3,	loop_2602
	bg,pt	%icc,	loop_2603
	movvs	%xcc,	%o4,	%o2
	fbule,a	%fcc3,	loop_2604
loop_2602:
	be,a	%icc,	loop_2605
loop_2603:
	sethi	0x1B97,	%i1
	fbul,a	%fcc0,	loop_2606
loop_2604:
	fmovrslez	%l6,	%f10,	%f14
loop_2605:
	movcs	%xcc,	%o6,	%g7
	udivcc	%l1,	0x0C66,	%o3
loop_2606:
	bneg,a	%icc,	loop_2607
	xnor	%l5,	0x05C0,	%g1
	brnz	%g6,	loop_2608
	movcc	%xcc,	%g4,	%i2
loop_2607:
	movcc	%icc,	%g5,	%g2
	sdivx	%o1,	0x0524,	%i5
loop_2608:
	fmovdpos	%xcc,	%f9,	%f5
	fandnot2s	%f6,	%f13,	%f24
	fbul,a	%fcc3,	loop_2609
	fcmpgt32	%f24,	%f14,	%l0
	edge32ln	%o7,	%i4,	%l4
	edge16l	%o5,	%l3,	%i0
loop_2609:
	fmovrsgz	%o0,	%f8,	%f10
	umul	%i7,	0x144F,	%l2
	edge16ln	%g3,	%i6,	%o4
	bvc	%xcc,	loop_2610
	tsubcctv	%i3,	0x0B6E,	%o2
	fpadd16s	%f2,	%f17,	%f15
	fpadd32s	%f10,	%f23,	%f25
loop_2610:
	tg	%icc,	0x4
	udivcc	%i1,	0x1C84,	%l6
	fnot1	%f14,	%f4
	set	0x20, %l4
	ldda	[%l7 + %l4] 0x19,	%o6
	wr	%g0,	0x2a,	%asi
	stxa	%g7,	[%l7 + 0x20] %asi
	membar	#Sync
	tvc	%icc,	0x6
	movle	%xcc,	%o3,	%l1
	tle	%icc,	0x4
	xnor	%l5,	%g6,	%g1
	array8	%i2,	%g4,	%g5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	edge32ln	%g2,	%l0,	%i5
	bge,pt	%icc,	loop_2611
	ble	%icc,	loop_2612
	edge32ln	%o7,	%i4,	%l4
	edge32n	%l3,	%o5,	%o0
loop_2611:
	srl	%i0,	%l2,	%g3
loop_2612:
	addc	%i7,	%o4,	%i3
	fmovdleu	%xcc,	%f19,	%f10
	array16	%o2,	%i6,	%l6
	movcs	%icc,	%i1,	%g7
	array32	%o3,	%l1,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l5,	%g1,	%g6
	sir	0x1947
	bpos,a,pn	%xcc,	loop_2613
	swap	[%l7 + 0x0C],	%i2
	addc	%g5,	%g4,	%o1
	set	0x36, %i1
	ldsba	[%l7 + %i1] 0x19,	%l0
loop_2613:
	fbl	%fcc3,	loop_2614
	fmovrsne	%i5,	%f13,	%f17
	ldub	[%l7 + 0x41],	%o7
	tg	%xcc,	0x4
loop_2614:
	sra	%g2,	0x1D,	%i4
	bne,a	loop_2615
	umul	%l4,	%l3,	%o5
	sdivx	%i0,	0x0F2F,	%o0
	movrlez	%g3,	0x3A5,	%i7
loop_2615:
	nop
	wr	%g0,	0x0c,	%asi
	sta	%f25,	[%l7 + 0x1C] %asi
	bneg,pn	%icc,	loop_2616
	movvs	%icc,	%o4,	%i3
	fblg	%fcc1,	loop_2617
	addccc	%o2,	%i6,	%l2
loop_2616:
	ble,a	loop_2618
	fandnot1s	%f24,	%f22,	%f18
loop_2617:
	fmovrdlez	%i1,	%f0,	%f12
	bge,pt	%icc,	loop_2619
loop_2618:
	nop
	set	0x70, %i2
	std	%f14,	[%l7 + %i2]
	fands	%f17,	%f27,	%f19
	subc	%l6,	%g7,	%l1
loop_2619:
	addcc	%o6,	0x07FE,	%o3
	movneg	%icc,	%l5,	%g6
	fmovscc	%icc,	%f12,	%f28
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x70] %asi,	%g1
	fnot1	%f24,	%f12
	edge16n	%i2,	%g5,	%g4
	ba,a,pn	%icc,	loop_2620
	tcc	%icc,	0x2
	movrlz	%o1,	0x3D3,	%i5
	tne	%icc,	0x5
loop_2620:
	nop
	wr	%g0,	0x2a,	%asi
	stba	%l0,	[%l7 + 0x2B] %asi
	membar	#Sync
	edge32l	%g2,	%i4,	%o7
	srax	%l4,	%o5,	%l3
	mova	%icc,	%o0,	%g3
	tge	%xcc,	0x2
	mulx	%i7,	0x19A2,	%i0
	movrne	%o4,	0x028,	%i3
	edge8ln	%o2,	%i6,	%i1
	umulcc	%l2,	%g7,	%l1
	array32	%l6,	%o3,	%o6
	sdivx	%l5,	0x0068,	%g1
	mulscc	%i2,	0x0B90,	%g5
	fexpand	%f16,	%f18
	movcs	%icc,	%g4,	%o1
	bvs,a,pt	%icc,	loop_2621
	fandnot2	%f14,	%f12,	%f4
	orcc	%g6,	%l0,	%g2
	ta	%icc,	0x2
loop_2621:
	edge8	%i4,	%o7,	%l4
	edge8	%i5,	%o5,	%l3
	fmovdcc	%xcc,	%f12,	%f13
	mulx	%o0,	%i7,	%g3
	srax	%o4,	0x1C,	%i0
	fnand	%f30,	%f18,	%f0
	fbg	%fcc3,	loop_2622
	movle	%xcc,	%i3,	%i6
	add	%l7,	0x50,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] %asi,	%o2,	%l2
loop_2622:
	fone	%f18
	move	%icc,	%i1,	%g7
	tcs	%icc,	0x6
	stbar
	movge	%xcc,	%l6,	%l1
	set	0x14, %g3
	swapa	[%l7 + %g3] 0x0c,	%o6
	udivx	%l5,	0x169F,	%o3
	srlx	%g1,	%i2,	%g5
	brlez	%g4,	loop_2623
	xor	%o1,	%l0,	%g2
	sdiv	%g6,	0x10FE,	%o7
	edge32ln	%l4,	%i4,	%o5
loop_2623:
	nop
	setx	0x605817CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	udivx	%l3,	0x1D95,	%i5
	edge16	%i7,	%g3,	%o0
	edge32l	%i0,	%i3,	%i6
	udivx	%o4,	0x07B7,	%l2
	bgu,a,pt	%xcc,	loop_2624
	tg	%xcc,	0x4
	edge16	%o2,	%g7,	%i1
	addcc	%l1,	%o6,	%l5
loop_2624:
	umulcc	%o3,	0x0CCC,	%g1
	fmovsl	%xcc,	%f14,	%f9
	bpos	%xcc,	loop_2625
	edge16ln	%l6,	%g5,	%i2
	edge16n	%o1,	%g4,	%g2
	smulcc	%g6,	0x086E,	%l0
loop_2625:
	fmuld8ulx16	%f7,	%f9,	%f2
	bcs,a,pt	%xcc,	loop_2626
	ble,a	loop_2627
	ldx	[%l7 + 0x58],	%o7
	fmovsvs	%icc,	%f3,	%f29
loop_2626:
	edge32l	%i4,	%o5,	%l4
loop_2627:
	fbe,a	%fcc3,	loop_2628
	andn	%i5,	%i7,	%l3
	tcs	%icc,	0x2
	sll	%g3,	0x11,	%i0
loop_2628:
	movleu	%icc,	%o0,	%i6
	andn	%i3,	%l2,	%o2
	tne	%xcc,	0x7
	move	%icc,	%g7,	%i1
	popc	0x013D,	%o4
	fpackfix	%f28,	%f16
	prefetch	[%l7 + 0x50],	 0x3
	fmovrdgz	%l1,	%f14,	%f10
	edge16	%l5,	%o3,	%g1
	udivx	%l6,	0x1E01,	%o6
	nop
	setx	0x166BDB82,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x2110FFC5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fsubs	%f3,	%f18,	%f26
	xnorcc	%i2,	0x0567,	%o1
	movleu	%icc,	%g5,	%g4
	movcs	%icc,	%g2,	%l0
	fmovrsgz	%o7,	%f14,	%f19
	umul	%g6,	0x180A,	%i4
	fmovrdlez	%l4,	%f30,	%f0
	sra	%o5,	0x0C,	%i5
	brlz,a	%l3,	loop_2629
	fmovsg	%xcc,	%f21,	%f27
	movl	%xcc,	%i7,	%i0
	andn	%o0,	0x03DA,	%g3
loop_2629:
	movge	%icc,	%i6,	%i3
	movvc	%xcc,	%l2,	%g7
	movleu	%icc,	%o2,	%o4
	tn	%icc,	0x7
	edge16l	%l1,	%l5,	%o3
	tne	%xcc,	0x7
	fmovrsgz	%g1,	%f15,	%f9
	fcmpgt16	%f30,	%f4,	%l6
	bpos	%icc,	loop_2630
	orncc	%o6,	0x0567,	%i2
	umul	%o1,	0x03F0,	%i1
	addcc	%g5,	%g4,	%g2
loop_2630:
	addccc	%o7,	%l0,	%i4
	movrgz	%g6,	0x382,	%l4
	movrgz	%i5,	0x197,	%l3
	tcc	%icc,	0x3
	fmovrde	%o5,	%f20,	%f10
	fmul8sux16	%f24,	%f8,	%f12
	be,a,pn	%xcc,	loop_2631
	fandnot1	%f12,	%f20,	%f14
	fmovsn	%icc,	%f22,	%f17
	fbe,a	%fcc3,	loop_2632
loop_2631:
	sir	0x1F15
	bne,a	%icc,	loop_2633
	nop
	fitos	%f6,	%f20
	fstox	%f20,	%f24
loop_2632:
	movvc	%icc,	%i7,	%o0
	fmovrsne	%g3,	%f19,	%f20
loop_2633:
	stx	%i0,	[%l7 + 0x10]
	edge8l	%i6,	%l2,	%g7
	andn	%i3,	0x1788,	%o4
	alignaddr	%o2,	%l1,	%l5
	subcc	%g1,	%o3,	%o6
	fblg,a	%fcc3,	loop_2634
	xor	%i2,	%l6,	%i1
	fbule	%fcc1,	loop_2635
	sdivx	%g5,	0x085C,	%g4
loop_2634:
	array8	%o1,	%o7,	%l0
	srlx	%i4,	%g2,	%g6
loop_2635:
	nop
	setx	0xB7C9975200D2A8C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xFE417B6709DAABC4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f22,	%f16
	tleu	%icc,	0x4
	fandnot2s	%f8,	%f20,	%f5
	tle	%xcc,	0x6
	fmovde	%xcc,	%f25,	%f16
	sllx	%i5,	%l3,	%l4
	sdivcc	%i7,	0x0F8E,	%o0
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x1F] %asi,	%g3
	mulscc	%i0,	0x08CC,	%o5
	fpackfix	%f16,	%f3
	fmovdcs	%xcc,	%f25,	%f18
	bpos	loop_2636
	movvc	%xcc,	%l2,	%g7
	umulcc	%i3,	0x1E86,	%o4
	wr	%g0,	0x2a,	%asi
	stxa	%i6,	[%l7 + 0x50] %asi
	membar	#Sync
loop_2636:
	fsrc2s	%f0,	%f24
	tsubcctv	%o2,	0x10ED,	%l5
	tvc	%icc,	0x5
	fnot1s	%f17,	%f19
	movre	%g1,	0x089,	%l1
	sll	%o6,	0x0E,	%o3
	brnz,a	%i2,	loop_2637
	xnorcc	%l6,	%g5,	%g4
	fmuld8ulx16	%f18,	%f14,	%f28
	sra	%o1,	0x1C,	%i1
loop_2637:
	fbul,a	%fcc3,	loop_2638
	edge16n	%l0,	%i4,	%g2
	tle	%icc,	0x2
	fbuge	%fcc2,	loop_2639
loop_2638:
	alignaddrl	%o7,	%i5,	%g6
	wr	%g0,	0x18,	%asi
	sta	%f7,	[%l7 + 0x24] %asi
loop_2639:
	udiv	%l4,	0x1012,	%l3
	ta	%xcc,	0x6
	nop
	setx	loop_2640,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	andncc	%i7,	%o0,	%g3
	set	0x69, %i5
	ldstuba	[%l7 + %i5] 0x80,	%o5
loop_2640:
	movrlz	%i0,	%g7,	%l2
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x6B] %asi,	%o4
	pdist	%f4,	%f2,	%f6
	fandnot2s	%f13,	%f3,	%f21
	nop
	setx	0x73A92C90,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xE557B949,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f21,	%f25
	stbar
	wr	%g0,	0xea,	%asi
	stwa	%i6,	[%l7 + 0x08] %asi
	membar	#Sync
	umulcc	%i3,	%l5,	%g1
	fexpand	%f31,	%f10
	brnz,a	%l1,	loop_2641
	nop
	setx	0xD18C1026,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x06721855,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f7,	%f16
	ld	[%l7 + 0x54],	%f27
	fmovse	%xcc,	%f14,	%f22
loop_2641:
	stbar
	movre	%o2,	0x3A0,	%o6
	subccc	%o3,	0x03E1,	%i2
	fxnors	%f22,	%f9,	%f8
	fbe,a	%fcc3,	loop_2642
	fmovda	%xcc,	%f22,	%f26
	fpadd16s	%f28,	%f2,	%f23
	tsubcc	%l6,	%g5,	%g4
loop_2642:
	array16	%i1,	%o1,	%l0
	sdiv	%i4,	0x167A,	%g2
	array16	%o7,	%i5,	%l4
	brlez	%l3,	loop_2643
	tl	%xcc,	0x7
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x10] %asi,	 0x2
loop_2643:
	orn	%o0,	%g3,	%g6
	edge16l	%o5,	%i0,	%g7
	st	%f23,	[%l7 + 0x14]
	tsubcc	%l2,	0x1598,	%i6
	tcc	%icc,	0x4
	fnand	%f24,	%f6,	%f4
	wr	%g0,	0x81,	%asi
	stxa	%i3,	[%l7 + 0x38] %asi
	brlz	%l5,	loop_2644
	sir	0x0B0E
	taddcctv	%o4,	0x07E6,	%l1
	fsrc1s	%f9,	%f7
loop_2644:
	tvs	%icc,	0x0
	fcmpeq32	%f0,	%f16,	%o2
	tne	%icc,	0x1
	brgez,a	%o6,	loop_2645
	xorcc	%g1,	0x08DC,	%o3
	wr	%g0,	0x04,	%asi
	swapa	[%l7 + 0x34] %asi,	%l6
loop_2645:
	nop
	fitod	%f4,	%f26
	fdtoi	%f26,	%f30
	sllx	%i2,	0x17,	%g4
	andcc	%g5,	%o1,	%l0
	fand	%f24,	%f26,	%f24
	movrlez	%i4,	%g2,	%o7
	andn	%i5,	%l4,	%i1
	brgz,a	%l3,	loop_2646
	andncc	%i7,	%g3,	%o0
	fmovsa	%icc,	%f1,	%f21
	fmovsgu	%icc,	%f3,	%f12
loop_2646:
	nop
	setx	0xCDFBEDE44F7F9928,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x8B5C73E9C73DE54C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f0,	%f24
	andn	%g6,	0x04F5,	%o5
	udivx	%g7,	0x1F55,	%i0
	fbe,a	%fcc1,	loop_2647
	st	%f9,	[%l7 + 0x24]
	fpsub32	%f26,	%f14,	%f28
	be	%icc,	loop_2648
loop_2647:
	brgz,a	%i6,	loop_2649
	umul	%i3,	%l5,	%l2
	sethi	0x158F,	%l1
loop_2648:
	bneg	loop_2650
loop_2649:
	tcs	%icc,	0x2
	addccc	%o4,	0x167C,	%o2
	xorcc	%g1,	0x00EF,	%o6
loop_2650:
	bvc,a	loop_2651
	sir	0x052A
	lduh	[%l7 + 0x36],	%o3
	mova	%xcc,	%i2,	%l6
loop_2651:
	fpadd16s	%f10,	%f7,	%f8
	tvs	%xcc,	0x6
	movrlez	%g5,	%o1,	%l0
	set	0x18, %i0
	stxa	%g4,	[%l7 + %i0] 0x81
	xor	%i4,	%g2,	%i5
	fmovsg	%xcc,	%f30,	%f3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l4,	%i1
	fcmpeq16	%f6,	%f2,	%l3
	fmovdne	%xcc,	%f31,	%f7
	edge32	%i7,	%g3,	%o0
	nop
	setx	0xB0427C93,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	tsubcc	%g6,	%o7,	%o5
	edge32	%i0,	%i6,	%g7
	movgu	%icc,	%l5,	%i3
	movrlz	%l1,	0x3F5,	%o4
	fmovdne	%icc,	%f3,	%f2
	call	loop_2652
	nop
	fitos	%f4,	%f1
	fstox	%f1,	%f28
	fxtos	%f28,	%f24
	brz	%l2,	loop_2653
	umulcc	%o2,	%g1,	%o6
loop_2652:
	alignaddrl	%o3,	%l6,	%g5
	srl	%o1,	0x17,	%i2
loop_2653:
	movl	%xcc,	%g4,	%i4
	udiv	%l0,	0x1E5F,	%g2
	edge16	%l4,	%i1,	%l3
	fpsub16s	%f9,	%f0,	%f27
	nop
	fitod	%f29,	%f24
	umulcc	%i5,	0x129B,	%i7
	xnorcc	%o0,	%g6,	%o7
	nop
	fitod	%f12,	%f30
	fdtoi	%f30,	%f12
	fcmpgt32	%f18,	%f4,	%o5
	udivcc	%i0,	0x09CC,	%g3
	fpsub32s	%f24,	%f30,	%f26
	taddcc	%g7,	%i6,	%i3
	sethi	0x09E3,	%l1
	brgz,a	%o4,	loop_2654
	sir	0x16B6
	fmul8x16	%f7,	%f4,	%f2
	ldsh	[%l7 + 0x3C],	%l2
loop_2654:
	be	loop_2655
	fbul,a	%fcc1,	loop_2656
	fbul,a	%fcc2,	loop_2657
	nop
	setx	loop_2658,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_2655:
	bleu	loop_2659
loop_2656:
	and	%l5,	%o2,	%g1
loop_2657:
	fmovsvc	%icc,	%f12,	%f12
loop_2658:
	edge16l	%o6,	%l6,	%g5
loop_2659:
	sir	0x0D84
	wr	%g0,	0x22,	%asi
	stwa	%o1,	[%l7 + 0x08] %asi
	membar	#Sync
	tcc	%icc,	0x5
	fnor	%f24,	%f2,	%f6
	ldstub	[%l7 + 0x72],	%i2
	tne	%icc,	0x1
	srlx	%o3,	0x09,	%i4
	mova	%xcc,	%g4,	%l0
	array8	%g2,	%l4,	%l3
	movcs	%xcc,	%i1,	%i5
	orcc	%i7,	0x0446,	%g6
	movrlez	%o0,	%o7,	%o5
	tneg	%xcc,	0x5
	be,a	%icc,	loop_2660
	fmuld8ulx16	%f22,	%f4,	%f20
	std	%f6,	[%l7 + 0x50]
	movgu	%xcc,	%g3,	%i0
loop_2660:
	tpos	%icc,	0x2
	tsubcc	%g7,	%i6,	%l1
	edge32l	%i3,	%o4,	%l2
	nop
	setx	loop_2661,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movcc	%icc,	%o2,	%l5
	edge16l	%o6,	%l6,	%g5
	tsubcctv	%g1,	0x0444,	%i2
loop_2661:
	fpsub32	%f4,	%f30,	%f8
	set	0x6C, %o2
	sta	%f7,	[%l7 + %o2] 0x04
	fmovse	%xcc,	%f25,	%f11
	sdiv	%o3,	0x1B67,	%i4
	tl	%xcc,	0x4
	udivx	%g4,	0x08AF,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l0,	%l4,	%g2
	alignaddrl	%i1,	%l3,	%i7
	tleu	%icc,	0x7
	add	%l7,	0x60,	%l6
	wr	%g0,	0x19,	%asi
	lda	[%l6] %asi,	%g6
	casa	[%l6] 0x19,	%g6,	%i5
	tsubcc	%o7,	%o5,	%g3
	fbuge	%fcc1,	loop_2662
	stbar
	ldd	[%l7 + 0x28],	%o0
	fmovdcs	%icc,	%f19,	%f15
loop_2662:
	subc	%g7,	0x0A50,	%i0
	movvs	%xcc,	%l1,	%i6
	tpos	%icc,	0x3
	or	%o4,	%i3,	%o2
	fmul8sux16	%f30,	%f30,	%f10
	movrgez	%l5,	0x13E,	%o6
	andn	%l6,	0x0507,	%l2
	andcc	%g5,	0x18FF,	%i2
	mulscc	%o3,	%i4,	%g1
	set	0x4A, %l2
	ldsha	[%l7 + %l2] 0x81,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l0,	%l4,	%o1
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x64] %asi,	%f20
	array8	%i1,	%l3,	%g2
	sethi	0x06E2,	%i7
	srlx	%g6,	0x08,	%i5
	andn	%o7,	%o5,	%o0
	brlez	%g7,	loop_2663
	edge8l	%i0,	%g3,	%l1
	sra	%o4,	%i3,	%o2
	tne	%xcc,	0x6
loop_2663:
	tcc	%xcc,	0x3
	set	0x30, %l5
	prefetcha	[%l7 + %l5] 0x04,	 0x1
	set	0x40, %i4
	stda	%f16,	[%l7 + %i4] 0x0c
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%o6
	nop
	set	0x20, %g2
	stb	%i6,	[%l7 + %g2]
	sir	0x1FC3
	alignaddrl	%l2,	%l6,	%g5
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	taddcctv	%i4,	0x14DB,	%i2
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x81,	%asi
	casa	[%l6] %asi,	%g1,	%l0
	fble	%fcc2,	loop_2664
	fpmerge	%f4,	%f10,	%f2
	fmovscs	%xcc,	%f7,	%f20
	stbar
loop_2664:
	tle	%xcc,	0x2
	fsrc2s	%f22,	%f28
	mulx	%g4,	%l4,	%i1
	edge8	%l3,	%o1,	%g2
	tl	%xcc,	0x3
	fcmpne16	%f6,	%f0,	%i7
	te	%icc,	0x6
	ld	[%l7 + 0x10],	%f19
	fornot1	%f20,	%f20,	%f4
	umul	%g6,	%i5,	%o5
	srax	%o7,	%g7,	%i0
	srl	%o0,	%g3,	%l1
	bvs,a,pt	%icc,	loop_2665
	taddcctv	%o4,	%o2,	%l5
	st	%f5,	[%l7 + 0x70]
	movvs	%xcc,	%o6,	%i6
loop_2665:
	and	%l2,	0x148E,	%i3
	tcc	%icc,	0x2
	xorcc	%l6,	%g5,	%i4
	smul	%i2,	%o3,	%g1
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x24] %asi,	%g4
	edge32ln	%l0,	%l4,	%l3
	sub	%o1,	0x0B38,	%i1
	fornot2s	%f28,	%f22,	%f28
	andcc	%g2,	%i7,	%i5
	srl	%o5,	%g6,	%o7
	movrlez	%g7,	%i0,	%o0
	set	0x0C, %l1
	stha	%g3,	[%l7 + %l1] 0x89
	edge32l	%o4,	%o2,	%l1
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x61] %asi,	%o6
	movrlez	%l5,	%l2,	%i3
	fexpand	%f6,	%f26
	fmovdvc	%icc,	%f13,	%f9
	pdist	%f0,	%f20,	%f20
	fbu,a	%fcc2,	loop_2666
	bcc	loop_2667
	ldub	[%l7 + 0x0C],	%l6
	brlz	%i6,	loop_2668
loop_2666:
	fabsd	%f28,	%f18
loop_2667:
	fbl	%fcc1,	loop_2669
	array32	%i4,	%g5,	%o3
loop_2668:
	sllx	%g1,	%i2,	%l0
	xor	%g4,	%l3,	%o1
loop_2669:
	array8	%i1,	%l4,	%i7
	fbue,a	%fcc3,	loop_2670
	fmuld8ulx16	%f13,	%f9,	%f18
	fxors	%f8,	%f12,	%f26
	call	loop_2671
loop_2670:
	movvc	%xcc,	%g2,	%o5
	nop
	fitos	%f10,	%f31
	fstoi	%f31,	%f19
	bgu,a	%icc,	loop_2672
loop_2671:
	bvs,pn	%icc,	loop_2673
	fcmpgt32	%f4,	%f6,	%i5
	subcc	%g6,	%g7,	%o7
loop_2672:
	sub	%i0,	%o0,	%g3
loop_2673:
	brgz	%o2,	loop_2674
	movneg	%icc,	%o4,	%l1
	movrlz	%l5,	%o6,	%l2
	tvc	%icc,	0x2
loop_2674:
	fmul8x16	%f8,	%f8,	%f26
	fmovse	%icc,	%f11,	%f1
	set	0x72, %i6
	stha	%l6,	[%l7 + %i6] 0x0c
	array32	%i6,	%i4,	%g5
	tl	%xcc,	0x0
	nop
	setx	loop_2675,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcs,a,pn	%icc,	loop_2676
	andn	%i3,	%o3,	%g1
	andncc	%l0,	%g4,	%l3
loop_2675:
	fsrc1s	%f23,	%f23
loop_2676:
	edge8	%o1,	%i1,	%l4
	fmovdpos	%xcc,	%f18,	%f2
	taddcc	%i7,	%g2,	%i2
	sethi	0x0822,	%i5
	nop
	fitos	%f10,	%f26
	fstox	%f26,	%f18
	nop
	fitod	%f0,	%f20
	fdtos	%f20,	%f29
	sdivx	%g6,	0x0739,	%o5
	udivx	%o7,	0x06F4,	%i0
	fnegs	%f30,	%f2
	fmovs	%f4,	%f26
	movg	%icc,	%o0,	%g3
	array8	%o2,	%g7,	%l1
	fnot1	%f8,	%f0
	edge8	%o4,	%o6,	%l2
	fbne,a	%fcc3,	loop_2677
	fmovrsgez	%l5,	%f31,	%f9
	movl	%xcc,	%l6,	%i4
	sethi	0x194A,	%g5
loop_2677:
	alignaddrl	%i6,	%i3,	%g1
	edge16ln	%o3,	%g4,	%l3
	stbar
	fbu	%fcc3,	loop_2678
	tl	%icc,	0x5
	fbn,a	%fcc2,	loop_2679
	andn	%l0,	%o1,	%i1
loop_2678:
	addcc	%i7,	%l4,	%g2
	fbl	%fcc0,	loop_2680
loop_2679:
	subccc	%i5,	%i2,	%g6
	fzeros	%f13
	fnands	%f18,	%f22,	%f31
loop_2680:
	nop
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x18] %asi,	%o7
	tcs	%xcc,	0x1
	tvc	%xcc,	0x7
	movg	%icc,	%i0,	%o0
	tl	%icc,	0x6
	sub	%g3,	%o5,	%g7
	bn,a,pn	%icc,	loop_2681
	popc	0x1158,	%l1
	fmovsne	%xcc,	%f16,	%f14
	tpos	%xcc,	0x6
loop_2681:
	tn	%icc,	0x4
	edge8	%o4,	%o6,	%o2
	fbule	%fcc3,	loop_2682
	brgz	%l2,	loop_2683
	subc	%l5,	%l6,	%g5
	bl	%icc,	loop_2684
loop_2682:
	nop
	setx	0xC1CE0D93,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	fsqrts	%f31,	%f11
loop_2683:
	fbule,a	%fcc3,	loop_2685
	movg	%xcc,	%i6,	%i3
loop_2684:
	fbg,a	%fcc0,	loop_2686
	fbul,a	%fcc3,	loop_2687
loop_2685:
	alignaddr	%g1,	%i4,	%g4
	fmovdleu	%icc,	%f15,	%f19
loop_2686:
	edge32l	%o3,	%l3,	%o1
loop_2687:
	fbuge,a	%fcc1,	loop_2688
	movpos	%xcc,	%l0,	%i1
	movcc	%icc,	%l4,	%i7
	movne	%icc,	%g2,	%i5
loop_2688:
	xorcc	%g6,	0x1B66,	%i2
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x89,	%o7,	%o0
	sdivx	%i0,	0x1335,	%o5
	bg,pn	%xcc,	loop_2689
	orcc	%g3,	0x1781,	%l1
	orcc	%o4,	%g7,	%o6
	movrlez	%l2,	0x177,	%l5
loop_2689:
	orncc	%o2,	%l6,	%i6
	tvc	%icc,	0x4
	andncc	%i3,	%g5,	%i4
	movrgez	%g1,	%g4,	%l3
	addc	%o3,	%l0,	%i1
	fors	%f6,	%f22,	%f26
	movrne	%l4,	%i7,	%g2
	xorcc	%i5,	%o1,	%i2
	stw	%g6,	[%l7 + 0x78]
	fmovsvs	%xcc,	%f22,	%f19
	sra	%o0,	0x14,	%i0
	subcc	%o7,	0x1E39,	%o5
	brz	%l1,	loop_2690
	movle	%xcc,	%o4,	%g7
	sir	0x1A06
	movl	%xcc,	%o6,	%g3
loop_2690:
	alignaddr	%l2,	%o2,	%l6
	subcc	%i6,	%i3,	%g5
	move	%icc,	%i4,	%l5
	fmovse	%xcc,	%f14,	%f29
	bgu,pt	%icc,	loop_2691
	edge32n	%g1,	%g4,	%o3
	addccc	%l0,	0x193A,	%i1
	xnor	%l3,	%l4,	%i7
loop_2691:
	nop
	set	0x40, %g1
	prefetch	[%l7 + %g1],	 0x2
	umulcc	%g2,	%i5,	%o1
	st	%f2,	[%l7 + 0x68]
	ta	%icc,	0x0
	fmovdle	%xcc,	%f17,	%f29
	brz,a	%i2,	loop_2692
	fabsd	%f4,	%f30
	bg,a,pn	%xcc,	loop_2693
	sllx	%o0,	%i0,	%o7
loop_2692:
	edge32ln	%o5,	%g6,	%l1
	wr	%g0,	0x88,	%asi
	ldstuba	[%l7 + 0x4A] %asi,	%g7
loop_2693:
	fbu,a	%fcc0,	loop_2694
	xorcc	%o4,	%o6,	%g3
	alignaddr	%l2,	%l6,	%i6
	fcmple32	%f20,	%f20,	%i3
loop_2694:
	movge	%icc,	%o2,	%i4
	movrlez	%g5,	0x001,	%l5
	movrne	%g4,	0x18D,	%g1
	movn	%xcc,	%o3,	%l0
	flush	%l7 + 0x30
	edge16	%l3,	%l4,	%i7
	orn	%g2,	0x0D8C,	%i1
	nop
	fitos	%f11,	%f4
	fstod	%f4,	%f6
	and	%o1,	%i5,	%o0
	fandnot1	%f22,	%f2,	%f18
	bvc,a,pn	%icc,	loop_2695
	tle	%xcc,	0x7
	set	0x40, %o5
	stda	%f16,	[%l7 + %o5] 0x88
loop_2695:
	edge32l	%i2,	%i0,	%o5
	tleu	%xcc,	0x7
	swap	[%l7 + 0x7C],	%o7
	fpadd16	%f6,	%f26,	%f12
	ldsh	[%l7 + 0x12],	%l1
	xnorcc	%g7,	%o4,	%g6
	movvs	%icc,	%g3,	%l2
	edge16n	%l6,	%o6,	%i6
	umulcc	%o2,	0x1303,	%i4
	taddcc	%g5,	0x1FC7,	%i3
	bg,a	%icc,	loop_2696
	fpadd16	%f10,	%f0,	%f2
	stw	%l5,	[%l7 + 0x60]
	popc	%g4,	%o3
loop_2696:
	popc	%l0,	%g1
	fsrc2	%f4,	%f6
	alignaddr	%l4,	%i7,	%l3
	set	0x24, %g4
	swapa	[%l7 + %g4] 0x18,	%i1
	bne	%icc,	loop_2697
	edge8	%g2,	%i5,	%o0
	xorcc	%i2,	%i0,	%o1
	membar	0x4D
loop_2697:
	umul	%o5,	%l1,	%o7
	edge16n	%o4,	%g6,	%g3
	edge16	%g7,	%l6,	%o6
	smul	%l2,	0x044D,	%i6
	fmovdvs	%icc,	%f28,	%f15
	xorcc	%i4,	0x020C,	%o2
	edge32n	%g5,	%l5,	%g4
	xorcc	%i3,	0x039B,	%o3
	nop
	setx	loop_2698,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8	%g1,	%l0,	%i7
	fxor	%f8,	%f30,	%f14
	fandnot2	%f6,	%f26,	%f18
loop_2698:
	fmovrdlz	%l4,	%f20,	%f2
	fmovrse	%i1,	%f20,	%f15
	set	0x7C, %g7
	lduwa	[%l7 + %g7] 0x14,	%g2
	tge	%icc,	0x0
	ba,a,pn	%icc,	loop_2699
	fmovdcs	%icc,	%f16,	%f29
	mova	%icc,	%l3,	%o0
	fmovrsne	%i5,	%f27,	%f22
loop_2699:
	fbe	%fcc2,	loop_2700
	edge32l	%i2,	%i0,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l1,	%o7
loop_2700:
	umulcc	%o1,	%g6,	%g3
	tneg	%icc,	0x5
	srlx	%g7,	0x1F,	%l6
	fbule,a	%fcc0,	loop_2701
	sethi	0x1F24,	%o4
	fcmpgt16	%f24,	%f2,	%o6
	or	%l2,	0x04F6,	%i4
loop_2701:
	edge16l	%i6,	%o2,	%g5
	fmovse	%icc,	%f8,	%f5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l5,	0x1151,	%i3
	ta	%xcc,	0x7
	popc	0x1101,	%o3
	movrgez	%g1,	0x3F6,	%g4
	array8	%i7,	%l4,	%l0
	edge8ln	%g2,	%l3,	%o0
	movrlz	%i5,	0x350,	%i1
	st	%f14,	[%l7 + 0x5C]
	fmovse	%icc,	%f19,	%f30
	fnand	%f6,	%f10,	%f26
	array8	%i2,	%o5,	%i0
	fmovsg	%icc,	%f18,	%f15
	set	0x6C, %g5
	swapa	[%l7 + %g5] 0x04,	%o7
	wr	%g0,	0x80,	%asi
	stwa	%l1,	[%l7 + 0x6C] %asi
	sll	%o1,	0x06,	%g3
	edge8	%g6,	%l6,	%o4
	nop
	fitos	%f5,	%f17
	fstox	%f17,	%f26
	fxtos	%f26,	%f7
	fba,a	%fcc1,	loop_2702
	movge	%icc,	%g7,	%o6
	fmovdpos	%xcc,	%f10,	%f18
	bge	%xcc,	loop_2703
loop_2702:
	or	%i4,	0x0419,	%l2
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f20
	fxtod	%f20,	%f26
	tl	%icc,	0x4
loop_2703:
	tpos	%xcc,	0x2
	nop
	setx	loop_2704,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnot2s	%f11,	%f9
	mulscc	%o2,	0x1E62,	%g5
	set	0x0C, %o7
	ldswa	[%l7 + %o7] 0x15,	%i6
loop_2704:
	srlx	%i3,	0x16,	%l5
	nop
	fitos	%f2,	%f10
	fstod	%f10,	%f4
	movre	%o3,	0x0B1,	%g1
	te	%xcc,	0x4
	bvs,a	%icc,	loop_2705
	edge8	%i7,	%g4,	%l0
	lduh	[%l7 + 0x14],	%l4
	srlx	%l3,	%o0,	%i5
loop_2705:
	fble	%fcc2,	loop_2706
	tcc	%icc,	0x3
	fnors	%f16,	%f19,	%f7
	fbule,a	%fcc0,	loop_2707
loop_2706:
	ba	loop_2708
	fmovrslez	%g2,	%f31,	%f31
	membar	#Sync
	set	0x40, %o6
	ldda	[%l7 + %o6] 0x17,	%f16
loop_2707:
	fmovda	%icc,	%f2,	%f29
loop_2708:
	nop
	set	0x49, %g6
	ldstuba	[%l7 + %g6] 0x04,	%i1
	bn,a	%icc,	loop_2709
	nop
	fitod	%f5,	%f12
	andncc	%i2,	%o5,	%i0
	movvs	%xcc,	%l1,	%o1
loop_2709:
	movgu	%xcc,	%g3,	%o7
	ldub	[%l7 + 0x5C],	%l6
	edge16l	%o4,	%g6,	%o6
	sethi	0x177D,	%g7
	mulx	%i4,	%l2,	%o2
	xor	%g5,	0x0583,	%i6
	fbn,a	%fcc2,	loop_2710
	movrgz	%l5,	%i3,	%g1
	edge32n	%o3,	%i7,	%l0
	xnorcc	%l4,	0x0645,	%g4
loop_2710:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%l3,	0x0107,	%o0
	alignaddrl	%g2,	%i1,	%i5
	movre	%i2,	%o5,	%i0
	movn	%icc,	%l1,	%g3
	brgz,a	%o1,	loop_2711
	membar	0x06
	edge16l	%o7,	%o4,	%l6
	sra	%g6,	%o6,	%i4
loop_2711:
	sth	%l2,	[%l7 + 0x5C]
	umulcc	%o2,	%g5,	%g7
	movcc	%xcc,	%i6,	%i3
	sll	%g1,	%o3,	%l5
	sll	%i7,	0x10,	%l0
	fmovdg	%xcc,	%f4,	%f14
	edge8ln	%l4,	%l3,	%g4
	taddcctv	%g2,	%i1,	%o0
	edge16ln	%i2,	%i5,	%i0
	add	%o5,	%l1,	%o1
	mulscc	%o7,	0x1F41,	%o4
	brnz	%g3,	loop_2712
	fbe,a	%fcc0,	loop_2713
	fblg,a	%fcc3,	loop_2714
	sdivx	%l6,	0x02F6,	%o6
loop_2712:
	xor	%i4,	%l2,	%o2
loop_2713:
	lduw	[%l7 + 0x4C],	%g5
loop_2714:
	nop
	set	0x52, %l0
	ldsha	[%l7 + %l0] 0x19,	%g7
	fpadd16s	%f8,	%f5,	%f26
	edge16l	%i6,	%i3,	%g1
	ldd	[%l7 + 0x68],	%o2
	move	%icc,	%g6,	%i7
	xnorcc	%l5,	%l0,	%l3
	andn	%l4,	%g2,	%g4
	alignaddrl	%i1,	%o0,	%i2
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	brlez	%i5,	loop_2715
	fpadd16	%f26,	%f16,	%f26
	bgu	%xcc,	loop_2716
	movvc	%icc,	%i0,	%o5
loop_2715:
	array16	%l1,	%o1,	%o7
	orn	%g3,	0x0FB2,	%l6
loop_2716:
	nop
	set	0x38, %o4
	lduba	[%l7 + %o4] 0x19,	%o4
	fmul8ulx16	%f4,	%f18,	%f30
	srl	%o6,	%l2,	%i4
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x3
	tge	%icc,	0x4
	sub	%g5,	0x0A53,	%g7
	subccc	%i3,	0x1EA3,	%i6
	movrgez	%o3,	%g6,	%g1
	addcc	%l5,	0x09AD,	%l0
	fmovscc	%xcc,	%f30,	%f20
	sdiv	%i7,	0x018E,	%l4
	fxnors	%f27,	%f21,	%f5
	umulcc	%l3,	0x1376,	%g2
	orncc	%i1,	%o0,	%g4
	edge32ln	%i5,	%i0,	%o5
	movrlz	%i2,	%o1,	%o7
	taddcctv	%g3,	%l1,	%l6
	movge	%xcc,	%o6,	%l2
	movne	%xcc,	%o4,	%o2
	xorcc	%i4,	0x0D71,	%g7
	std	%f28,	[%l7 + 0x28]
	fmovdcc	%icc,	%f15,	%f5
	fmovdcs	%icc,	%f24,	%f4
	tl	%icc,	0x5
	fbo	%fcc2,	loop_2717
	sll	%i3,	0x1C,	%i6
	sllx	%g5,	%g6,	%g1
	tcc	%xcc,	0x0
loop_2717:
	fcmpeq32	%f30,	%f20,	%l5
	call	loop_2718
	fpsub16	%f14,	%f28,	%f4
	tle	%xcc,	0x5
	edge32l	%l0,	%i7,	%l4
loop_2718:
	edge8ln	%o3,	%g2,	%i1
	fnand	%f4,	%f26,	%f26
	tneg	%xcc,	0x3
	udivcc	%l3,	0x1C23,	%o0
	tneg	%icc,	0x4
	tvc	%xcc,	0x0
	tgu	%xcc,	0x3
	sdivx	%i5,	0x0BC1,	%i0
	alignaddrl	%g4,	%i2,	%o1
	bn,a,pn	%icc,	loop_2719
	tge	%icc,	0x0
	mulscc	%o7,	0x1C4D,	%g3
	movvc	%xcc,	%l1,	%o5
loop_2719:
	tsubcc	%l6,	%o6,	%l2
	fbo,a	%fcc2,	loop_2720
	xnorcc	%o2,	%o4,	%g7
	fmovdpos	%icc,	%f21,	%f0
	fbo	%fcc1,	loop_2721
loop_2720:
	fmovrse	%i4,	%f13,	%f18
	edge16n	%i3,	%i6,	%g5
	st	%f31,	[%l7 + 0x70]
loop_2721:
	addcc	%g6,	%l5,	%g1
	addccc	%i7,	%l0,	%o3
	fxors	%f0,	%f14,	%f4
	edge32	%l4,	%i1,	%l3
	stw	%g2,	[%l7 + 0x54]
	bge,a,pn	%icc,	loop_2722
	mulscc	%o0,	%i0,	%g4
	tneg	%icc,	0x0
	movg	%icc,	%i2,	%o1
loop_2722:
	be,a,pt	%xcc,	loop_2723
	sub	%i5,	0x1E66,	%o7
	fbul,a	%fcc0,	loop_2724
	xor	%g3,	%o5,	%l1
loop_2723:
	edge32ln	%o6,	%l2,	%l6
	sll	%o4,	0x0B,	%o2
loop_2724:
	array8	%i4,	%g7,	%i3
	fcmple16	%f24,	%f26,	%g5
	brgz,a	%i6,	loop_2725
	fmovsne	%xcc,	%f10,	%f19
	subccc	%g6,	%l5,	%g1
	sdiv	%l0,	0x0B2B,	%o3
loop_2725:
	fmovsleu	%icc,	%f13,	%f25
	fbe,a	%fcc3,	loop_2726
	bgu,a,pn	%xcc,	loop_2727
	mulscc	%l4,	0x101F,	%i1
	set	0x7A, %i7
	ldsha	[%l7 + %i7] 0x18,	%l3
loop_2726:
	mulx	%g2,	0x0B68,	%o0
loop_2727:
	mova	%xcc,	%i7,	%g4
	andncc	%i2,	%i0,	%o1
	fmovdvc	%icc,	%f2,	%f10
	sll	%i5,	0x03,	%o7
	nop
	setx	0x83D0C9B0304F4897,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fbge,a	%fcc2,	loop_2728
	movvc	%icc,	%g3,	%l1
	set	0x5C, %l6
	ldswa	[%l7 + %l6] 0x18,	%o6
loop_2728:
	tge	%xcc,	0x0
	array8	%l2,	%o5,	%o4
	sth	%l6,	[%l7 + 0x62]
	movgu	%xcc,	%o2,	%i4
	stb	%i3,	[%l7 + 0x15]
	fzeros	%f8
	sdivcc	%g5,	0x1DBF,	%g7
	fmovrdlz	%g6,	%f12,	%f12
	array32	%l5,	%g1,	%l0
	brgz	%i6,	loop_2729
	bvc,a,pt	%xcc,	loop_2730
	brgz	%l4,	loop_2731
	fpsub16s	%f14,	%f29,	%f23
loop_2729:
	addcc	%i1,	0x0583,	%l3
loop_2730:
	fmovsvs	%icc,	%f7,	%f10
loop_2731:
	flush	%l7 + 0x2C
	edge8n	%g2,	%o0,	%i7
	fnands	%f5,	%f0,	%f20
	fbn,a	%fcc2,	loop_2732
	udivx	%o3,	0x1E14,	%i2
	bneg,a	loop_2733
	srl	%g4,	0x05,	%i0
loop_2732:
	edge16ln	%i5,	%o7,	%o1
	nop
	setx	0x1C2CA52E40666FFA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
loop_2733:
	brnz	%l1,	loop_2734
	subc	%o6,	0x036B,	%l2
	movne	%icc,	%o5,	%g3
	fnot2	%f16,	%f4
loop_2734:
	array32	%l6,	%o2,	%o4
	tleu	%icc,	0x5
	addccc	%i4,	%i3,	%g7
	fnot2	%f4,	%f4
	movle	%icc,	%g5,	%l5
	ldstub	[%l7 + 0x71],	%g1
	movcs	%icc,	%g6,	%l0
	set	0x36, %o1
	lduha	[%l7 + %o1] 0x80,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x5C] %asi,	%f28
	sir	0x093F
	fcmpne32	%f26,	%f22,	%l4
	subccc	%i1,	%g2,	%l3
	stx	%i7,	[%l7 + 0x58]
	tl	%icc,	0x1
	fnot1s	%f19,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_2735,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	prefetch	[%l7 + 0x20],	 0x2
	movn	%icc,	%o0,	%o3
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x6A] %asi,	%i2
loop_2735:
	movneg	%icc,	%g4,	%i5
	movge	%xcc,	%i0,	%o7
	fmovdvc	%icc,	%f0,	%f24
	xnorcc	%l1,	%o1,	%l2
	movg	%xcc,	%o5,	%o6
	fpadd32	%f26,	%f18,	%f26
	udivx	%g3,	0x1C90,	%l6
	edge8l	%o2,	%i4,	%i3
	nop
	fitos	%f12,	%f9
	fstox	%f9,	%f10
	fxtos	%f10,	%f28
	fbu	%fcc0,	loop_2736
	fbg,a	%fcc2,	loop_2737
	edge32l	%g7,	%o4,	%g5
	sdiv	%g1,	0x16BD,	%l5
loop_2736:
	smulcc	%l0,	0x1293,	%g6
loop_2737:
	fpadd32s	%f15,	%f6,	%f21
	movl	%icc,	%l4,	%i1
	smulcc	%i6,	0x0CAA,	%g2
	fmovsneg	%xcc,	%f14,	%f27
	edge16l	%l3,	%o0,	%o3
	movcc	%icc,	%i7,	%g4
	fmovsl	%icc,	%f20,	%f14
	subcc	%i5,	%i2,	%i0
	fbl	%fcc1,	loop_2738
	edge16n	%l1,	%o7,	%l2
	andcc	%o1,	%o5,	%g3
	addc	%o6,	%o2,	%l6
loop_2738:
	nop
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x0c
	ble,a	%xcc,	loop_2739
	addccc	%i4,	0x1A0F,	%i3
	xorcc	%o4,	%g7,	%g1
	udiv	%g5,	0x0594,	%l5
loop_2739:
	movpos	%icc,	%g6,	%l4
	subcc	%i1,	0x033C,	%l0
	fpsub16	%f30,	%f28,	%f18
	tsubcc	%g2,	%l3,	%o0
	edge8n	%i6,	%i7,	%g4
	tl	%xcc,	0x1
	brlez	%i5,	loop_2740
	fmovsn	%xcc,	%f16,	%f19
	edge8n	%o3,	%i0,	%i2
	set	0x0, %o3
	stxa	%o7,	[%g0 + %o3] 0x57
loop_2740:
	fba	%fcc1,	loop_2741
	udiv	%l1,	0x152D,	%o1
	bneg,pn	%xcc,	loop_2742
	fmovrsne	%o5,	%f24,	%f25
loop_2741:
	nop
	set	0x34, %i3
	ldswa	[%l7 + %i3] 0x89,	%g3
loop_2742:
	fmovdneg	%icc,	%f12,	%f2
	fxnor	%f24,	%f12,	%f18
	addccc	%o6,	0x01F7,	%o2
	umulcc	%l2,	0x107F,	%i4
	move	%icc,	%i3,	%l6
	sllx	%g7,	%g1,	%o4
	smul	%l5,	%g6,	%g5
	ble,a,pn	%xcc,	loop_2743
	fmovse	%xcc,	%f27,	%f4
	fxors	%f20,	%f19,	%f16
	brnz	%l4,	loop_2744
loop_2743:
	tcc	%icc,	0x0
	fmovspos	%xcc,	%f24,	%f21
	subccc	%l0,	0x0EB2,	%i1
loop_2744:
	tpos	%icc,	0x6
	ldsb	[%l7 + 0x33],	%g2
	srlx	%o0,	%l3,	%i7
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f4
	ldx	[%l7 + 0x30],	%g4
	fbn	%fcc1,	loop_2745
	tgu	%xcc,	0x3
	movne	%icc,	%i6,	%o3
	movgu	%xcc,	%i5,	%i0
loop_2745:
	movcs	%xcc,	%o7,	%l1
	edge16ln	%i2,	%o1,	%g3
	and	%o6,	0x0881,	%o5
	nop
	setx loop_2746, %l0, %l1
	jmpl %l1, %l2
	membar	0x2B
	movrlez	%i4,	0x2D4,	%o2
	fmovdle	%icc,	%f10,	%f13
loop_2746:
	nop
	set	0x58, %o0
	ldd	[%l7 + %o0],	%i6
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f0
	fbuge	%fcc3,	loop_2747
	brz,a	%g7,	loop_2748
	tgu	%xcc,	0x0
	faligndata	%f6,	%f6,	%f8
loop_2747:
	fnot2	%f24,	%f0
loop_2748:
	array32	%g1,	%i3,	%l5
	tgu	%icc,	0x3
	bpos,a,pn	%xcc,	loop_2749
	movre	%g6,	0x2F7,	%o4
	srlx	%l4,	0x06,	%g5
	tleu	%xcc,	0x5
loop_2749:
	bvc	loop_2750
	fone	%f8
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x30] %asi,	%i1
loop_2750:
	edge16ln	%g2,	%l0,	%o0
	sdiv	%i7,	0x13A3,	%l3
	nop
	setx	loop_2751,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmuld8ulx16	%f20,	%f9,	%f6
	andcc	%g4,	%i6,	%i5
	addc	%o3,	0x00F8,	%o7
loop_2751:
	ldd	[%l7 + 0x60],	%i0
	andn	%l1,	%i2,	%o1
	movrne	%o6,	0x3E6,	%o5
	edge8ln	%l2,	%g3,	%i4
	nop
	setx	0x0070CF7C,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	movrlez	%o2,	0x342,	%l6
	for	%f24,	%f18,	%f2
	fcmpne32	%f30,	%f2,	%g1
	sll	%g7,	0x0F,	%i3
	tcc	%icc,	0x1
	fabsd	%f4,	%f0
	subccc	%g6,	0x14ED,	%o4
	tcs	%icc,	0x4
	addccc	%l5,	0x12F7,	%l4
	umul	%i1,	%g2,	%g5
	ldd	[%l7 + 0x78],	%f0
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%o0
	bcs,pn	%icc,	loop_2752
	fmovspos	%xcc,	%f9,	%f29
	nop
	setx	0x33D69583,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x3A36937F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f17
	fdivs	%f17,	%f16,	%f6
	fbug	%fcc3,	loop_2753
loop_2752:
	bpos	loop_2754
	fnors	%f10,	%f22,	%f24
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2753:
	nop
	setx loop_2755, %l0, %l1
	jmpl %l1, %i7
loop_2754:
	sllx	%l0,	%l3,	%i6
	fbuge	%fcc1,	loop_2756
	fmovsle	%icc,	%f29,	%f19
loop_2755:
	andncc	%i5,	%g4,	%o3
	edge8n	%o7,	%l1,	%i0
loop_2756:
	fpackfix	%f2,	%f25
	movn	%icc,	%i2,	%o1
	for	%f8,	%f10,	%f12
	srax	%o6,	%l2,	%o5
	xor	%i4,	%g3,	%o2
	xnorcc	%g1,	%l6,	%g7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%g6,	%o4
	bge,a,pn	%xcc,	loop_2757
	membar	0x1E
	edge8n	%l5,	%l4,	%i1
	fmovdvs	%icc,	%f31,	%f30
loop_2757:
	sth	%g2,	[%l7 + 0x52]
	tsubcc	%i3,	0x080E,	%o0
	fbo	%fcc0,	loop_2758
	movpos	%icc,	%i7,	%g5
	xnorcc	%l0,	0x1F85,	%i6
	fba	%fcc1,	loop_2759
loop_2758:
	srl	%i5,	0x1D,	%l3
	sra	%o3,	0x1D,	%o7
	movre	%g4,	%i0,	%l1
loop_2759:
	bn,a,pn	%xcc,	loop_2760
	alignaddr	%o1,	%o6,	%l2
	bg,a	%icc,	loop_2761
	tleu	%xcc,	0x5
loop_2760:
	orcc	%o5,	%i4,	%g3
	tg	%icc,	0x0
loop_2761:
	ta	%xcc,	0x2
	bn,pt	%xcc,	loop_2762
	lduh	[%l7 + 0x2A],	%o2
	movleu	%xcc,	%i2,	%g1
	umulcc	%g7,	0x0F78,	%l6
loop_2762:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fbug,a	%fcc3,	loop_2763
	tpos	%icc,	0x5
	mulx	%g6,	%o4,	%l5
	orn	%i1,	0x159D,	%g2
loop_2763:
	nop
	setx	loop_2764,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbg,a	%fcc3,	loop_2765
	move	%xcc,	%i3,	%o0
	edge8l	%l4,	%g5,	%l0
loop_2764:
	tn	%xcc,	0x7
loop_2765:
	fsrc1s	%f2,	%f22
	srlx	%i7,	0x02,	%i5
	tgu	%icc,	0x4
	te	%icc,	0x2
	movge	%icc,	%l3,	%o3
	sll	%i6,	%o7,	%i0
	edge32ln	%g4,	%l1,	%o1
	sra	%o6,	0x01,	%l2
	nop
	setx	0xD829C569405D6BFF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fands	%f23,	%f23,	%f12
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x60] %asi,	%o5
	fmovsle	%xcc,	%f11,	%f16
	smul	%i4,	%g3,	%o2
	stw	%g1,	[%l7 + 0x6C]
	nop
	setx	0x96D477AD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xC1B7DD54,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fadds	%f23,	%f16,	%f22
	fmovrse	%g7,	%f3,	%f1
	movrgz	%l6,	%i2,	%o4
	set	0x64, %l4
	lduba	[%l7 + %l4] 0x80,	%g6
	tleu	%xcc,	0x5
	movle	%icc,	%i1,	%g2
	movrgez	%i3,	0x121,	%o0
	ldub	[%l7 + 0x3E],	%l5
	set	0x33, %g3
	ldstuba	[%l7 + %g3] 0x88,	%g5
	fxor	%f20,	%f24,	%f0
	array8	%l4,	%l0,	%i7
	addc	%l3,	0x1B77,	%i5
	nop
	set	0x39, %i5
	ldstub	[%l7 + %i5],	%o3
	fbne	%fcc2,	loop_2766
	fmovrsgz	%o7,	%f25,	%f21
	fbe	%fcc3,	loop_2767
	fpackfix	%f28,	%f5
loop_2766:
	be,a	%icc,	loop_2768
	fmovdcs	%icc,	%f21,	%f18
loop_2767:
	bleu,a	loop_2769
	fmovrsgz	%i6,	%f29,	%f4
loop_2768:
	te	%icc,	0x6
	stx	%g4,	[%l7 + 0x38]
loop_2769:
	nop
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x52] %asi,	%l1
	tsubcctv	%i0,	0x11A0,	%o6
	bge	%icc,	loop_2770
	udiv	%l2,	0x153B,	%o1
	brnz,a	%i4,	loop_2771
	movn	%icc,	%g3,	%o5
loop_2770:
	fmovdle	%icc,	%f16,	%f15
	movn	%xcc,	%o2,	%g1
loop_2771:
	fbne,a	%fcc2,	loop_2772
	move	%xcc,	%g7,	%l6
	orcc	%o4,	%g6,	%i2
	fmuld8ulx16	%f16,	%f14,	%f14
loop_2772:
	fbe,a	%fcc1,	loop_2773
	taddcc	%g2,	0x1423,	%i3
	edge8ln	%i1,	%o0,	%l5
	tg	%xcc,	0x2
loop_2773:
	fandnot2s	%f17,	%f10,	%f8
	xorcc	%l4,	%g5,	%i7
	fmovspos	%icc,	%f28,	%f9
	fmovrdlez	%l3,	%f30,	%f20
	subc	%l0,	%i5,	%o3
	smulcc	%i6,	0x1D35,	%g4
	sir	0x13BF
	tl	%xcc,	0x4
	movl	%xcc,	%o7,	%i0
	array8	%l1,	%o6,	%l2
	movcs	%xcc,	%o1,	%i4
	smulcc	%g3,	%o2,	%o5
	movl	%icc,	%g1,	%g7
	bvs,pt	%xcc,	loop_2774
	fblg,a	%fcc0,	loop_2775
	movrgez	%o4,	0x26B,	%g6
	bl,pt	%xcc,	loop_2776
loop_2774:
	be,a	%icc,	loop_2777
loop_2775:
	tge	%icc,	0x7
	bl	%xcc,	loop_2778
loop_2776:
	orcc	%i2,	%l6,	%g2
loop_2777:
	bcs,a,pn	%xcc,	loop_2779
	bneg,a	loop_2780
loop_2778:
	smul	%i1,	%i3,	%o0
	ldsb	[%l7 + 0x72],	%l4
loop_2779:
	edge8ln	%g5,	%l5,	%i7
loop_2780:
	tcs	%xcc,	0x5
	fcmple16	%f12,	%f12,	%l0
	st	%f9,	[%l7 + 0x54]
	orncc	%i5,	%l3,	%o3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%icc,	0x7
	fxors	%f5,	%f15,	%f19
	alignaddrl	%g4,	%o7,	%i0
	wr	%g0,	0xea,	%asi
	stba	%i6,	[%l7 + 0x32] %asi
	membar	#Sync
	movre	%o6,	0x07F,	%l2
	nop
	setx	0xD10120712BA15CDE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f22
	set	0x74, %i0
	swapa	[%l7 + %i0] 0x80,	%l1
	alignaddrl	%i4,	%o1,	%o2
	fornot1	%f30,	%f16,	%f16
	fone	%f4
	tpos	%icc,	0x4
	ta	%xcc,	0x3
	edge16	%o5,	%g3,	%g1
	stx	%g7,	[%l7 + 0x10]
	sir	0x01A8
	tcc	%icc,	0x2
	fpack32	%f30,	%f24,	%f14
	movre	%g6,	%i2,	%o4
	andn	%l6,	0x0FB7,	%g2
	brz	%i1,	loop_2781
	array8	%i3,	%l4,	%o0
	nop
	fitod	%f2,	%f6
	fdtos	%f6,	%f7
	edge8ln	%g5,	%i7,	%l5
loop_2781:
	bne,a	%icc,	loop_2782
	bcs,a,pt	%xcc,	loop_2783
	bvc,a	loop_2784
	be,a	loop_2785
loop_2782:
	movrlz	%l0,	0x0DA,	%l3
loop_2783:
	fbge,a	%fcc0,	loop_2786
loop_2784:
	nop
	set	0x5C, %i2
	stw	%o3,	[%l7 + %i2]
loop_2785:
	movle	%xcc,	%g4,	%o7
	tne	%icc,	0x6
loop_2786:
	alignaddrl	%i5,	%i6,	%o6
	nop
	set	0x74, %l2
	sth	%i0,	[%l7 + %l2]
	sdiv	%l1,	0x1169,	%i4
	movn	%icc,	%o1,	%o2
	lduw	[%l7 + 0x4C],	%o5
	mulscc	%g3,	0x1855,	%g1
	tg	%xcc,	0x0
	and	%l2,	%g6,	%i2
	tleu	%xcc,	0x6
	mulscc	%g7,	0x1EC7,	%l6
	tcs	%xcc,	0x6
	movrgez	%g2,	0x384,	%i1
	fpadd16s	%f13,	%f11,	%f7
	tn	%icc,	0x3
	movge	%icc,	%o4,	%i3
	tcs	%icc,	0x2
	xorcc	%o0,	%l4,	%i7
	movcc	%icc,	%l5,	%g5
	xnor	%l0,	0x1F36,	%o3
	fzero	%f10
	subcc	%l3,	0x1571,	%g4
	edge16l	%i5,	%o7,	%i6
	fandnot1s	%f16,	%f22,	%f2
	fnegs	%f9,	%f13
	sth	%o6,	[%l7 + 0x2E]
	tne	%icc,	0x5
	edge8ln	%i0,	%l1,	%i4
	subccc	%o2,	0x1869,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	swap	[%l7 + 0x10],	%o1
	movpos	%xcc,	%g1,	%g3
	wr	%g0,	0x5f,	%asi
	stxa	%g6,	[%g0 + 0x0] %asi
	fnot1s	%f12,	%f24
	fornot2s	%f30,	%f25,	%f16
	membar	0x78
	te	%xcc,	0x3
	sethi	0x0740,	%i2
	swap	[%l7 + 0x70],	%g7
	fmul8x16al	%f3,	%f14,	%f22
	fmuld8sux16	%f20,	%f2,	%f16
	fmovrdgz	%l2,	%f8,	%f22
	tl	%xcc,	0x5
	edge32	%g2,	%i1,	%o4
	fpadd32	%f28,	%f0,	%f28
	movl	%xcc,	%l6,	%i3
	fmovdge	%xcc,	%f30,	%f25
	subcc	%l4,	%i7,	%l5
	xorcc	%g5,	%o0,	%o3
	fmovdneg	%icc,	%f13,	%f11
	fmovdne	%xcc,	%f3,	%f3
	fpadd32s	%f3,	%f12,	%f22
	subc	%l0,	%l3,	%i5
	fsrc1s	%f20,	%f16
	movpos	%xcc,	%o7,	%i6
	std	%f30,	[%l7 + 0x70]
	fbule	%fcc2,	loop_2787
	movrlz	%g4,	0x091,	%o6
	sth	%l1,	[%l7 + 0x60]
	movrgez	%i0,	0x2C0,	%o2
loop_2787:
	or	%i4,	%o5,	%o1
	tgu	%xcc,	0x6
	tpos	%icc,	0x6
	and	%g3,	0x0EE7,	%g1
	subc	%g6,	%i2,	%l2
	tsubcc	%g2,	0x1C64,	%g7
	fmovdg	%xcc,	%f12,	%f21
	fpadd16	%f12,	%f30,	%f20
	edge16l	%o4,	%i1,	%l6
	movne	%icc,	%i3,	%l4
	sdivcc	%i7,	0x0F82,	%l5
	tcs	%icc,	0x4
	edge16ln	%o0,	%o3,	%l0
	fmovsne	%xcc,	%f31,	%f29
	sethi	0x1FFF,	%g5
	set	0x50, %l5
	prefetcha	[%l7 + %l5] 0x15,	 0x0
	umulcc	%o7,	0x18F3,	%i6
	stb	%l3,	[%l7 + 0x48]
	taddcctv	%g4,	0x0A74,	%o6
	movneg	%xcc,	%i0,	%l1
	movne	%xcc,	%i4,	%o5
	sdivcc	%o1,	0x1691,	%g3
	st	%f16,	[%l7 + 0x70]
	set	0x50, %o2
	ldda	[%l7 + %o2] 0x0c,	%o2
	edge16l	%g6,	%g1,	%l2
	fcmpeq16	%f30,	%f24,	%g2
	movl	%icc,	%g7,	%i2
	movrne	%o4,	0x038,	%i1
	nop
	setx	0xD6C8A415,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x7C626D9A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f4,	%f16
	for	%f4,	%f10,	%f16
	taddcc	%i3,	%l6,	%i7
	edge16	%l5,	%o0,	%o3
	nop
	setx	0x5DA06A635888EABE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f10
	fbne	%fcc2,	loop_2788
	tleu	%icc,	0x5
	te	%xcc,	0x1
	edge32	%l0,	%l4,	%g5
loop_2788:
	nop
	set	0x66, %i4
	ldsha	[%l7 + %i4] 0x89,	%i5
	tneg	%icc,	0x7
	fbu	%fcc0,	loop_2789
	tleu	%icc,	0x3
	taddcc	%o7,	%l3,	%g4
	bgu,pt	%xcc,	loop_2790
loop_2789:
	bshuffle	%f20,	%f6,	%f28
	popc	0x1E41,	%i6
	nop
	setx	0xBD2FC746,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x779B8C5B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f2,	%f21
loop_2790:
	tneg	%icc,	0x1
	sdivcc	%i0,	0x0431,	%o6
	tcs	%icc,	0x6
	set	0x46, %g2
	ldsha	[%l7 + %g2] 0x14,	%i4
	bn	%icc,	loop_2791
	tvs	%icc,	0x3
	edge8ln	%l1,	%o1,	%o5
	srax	%g3,	0x05,	%o2
loop_2791:
	nop
	setx	loop_2792,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldd	[%l7 + 0x68],	%g0
	fmovsleu	%xcc,	%f26,	%f18
	fbul	%fcc0,	loop_2793
loop_2792:
	bcc,a,pt	%xcc,	loop_2794
	sth	%g6,	[%l7 + 0x2E]
	movpos	%icc,	%g2,	%g7
loop_2793:
	fmovse	%icc,	%f4,	%f5
loop_2794:
	ld	[%l7 + 0x18],	%f15
	fmovdl	%xcc,	%f15,	%f9
	movne	%icc,	%l2,	%o4
	bcs,a	loop_2795
	udivcc	%i1,	0x03DC,	%i2
	xnorcc	%i3,	0x120C,	%i7
	fnot2	%f22,	%f12
loop_2795:
	tvs	%icc,	0x7
	bshuffle	%f2,	%f22,	%f8
	fmovrdlz	%l6,	%f18,	%f10
	fmovdvs	%icc,	%f12,	%f13
	mova	%xcc,	%l5,	%o3
	nop
	setx	0xE19436DAC061F66B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	subc	%o0,	0x0DAC,	%l0
	fnegs	%f15,	%f5
	fbul,a	%fcc0,	loop_2796
	popc	0x1F85,	%g5
	edge8ln	%l4,	%i5,	%l3
	fpack32	%f12,	%f2,	%f28
loop_2796:
	sdivx	%o7,	0x14D9,	%i6
	andn	%g4,	%o6,	%i0
	edge8l	%l1,	%o1,	%i4
	movcs	%icc,	%g3,	%o2
	umulcc	%g1,	%g6,	%o5
	tsubcc	%g7,	%g2,	%o4
	alignaddrl	%l2,	%i1,	%i3
	nop
	setx	0x1F29D8B103FBB8FA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f12
	sllx	%i7,	0x0A,	%i2
	edge16l	%l5,	%o3,	%l6
	fcmpne16	%f8,	%f14,	%l0
	srl	%g5,	%l4,	%i5
	sir	0x170A
	fmul8x16au	%f13,	%f3,	%f2
	udiv	%o0,	0x0172,	%l3
	tleu	%icc,	0x6
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x38] %asi,	%f6
	udivcc	%i6,	0x16FA,	%g4
	nop
	fitod	%f12,	%f24
	fdtox	%f24,	%f6
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x26] %asi,	%o6
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x08] %asi,	%o7
	edge8l	%i0,	%l1,	%o1
	nop
	setx	0x206908AF,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	sra	%g3,	0x1A,	%i4
	xor	%o2,	0x18D3,	%g6
	fnand	%f22,	%f26,	%f2
	set	0x76, %l1
	lduba	[%l7 + %l1] 0x18,	%g1
	fmuld8sux16	%f11,	%f29,	%f6
	fnegs	%f27,	%f4
	nop
	fitod	%f12,	%f22
	fdtos	%f22,	%f8
	fpadd32	%f12,	%f14,	%f8
	sra	%o5,	%g7,	%g2
	fmuld8sux16	%f6,	%f4,	%f2
	mova	%icc,	%o4,	%l2
	movrgz	%i3,	%i7,	%i2
	stw	%i1,	[%l7 + 0x2C]
	mova	%xcc,	%l5,	%l6
	fmul8x16	%f17,	%f0,	%f2
	tl	%xcc,	0x7
	fbne,a	%fcc3,	loop_2797
	alignaddrl	%l0,	%o3,	%l4
	addc	%g5,	0x1D3F,	%i5
	popc	%o0,	%l3
loop_2797:
	tvs	%icc,	0x1
	tleu	%icc,	0x1
	lduw	[%l7 + 0x70],	%i6
	fbge	%fcc2,	loop_2798
	fmovspos	%xcc,	%f11,	%f8
	addc	%o6,	0x1C31,	%g4
	tle	%icc,	0x6
loop_2798:
	movneg	%xcc,	%o7,	%i0
	umul	%l1,	%g3,	%i4
	movne	%icc,	%o2,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o1,	%o5,	%g1
	fmovse	%xcc,	%f15,	%f7
	nop
	setx	0xF056C967,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	bne	loop_2799
	ba,a,pn	%xcc,	loop_2800
	for	%f6,	%f18,	%f10
	subcc	%g7,	0x02BA,	%g2
loop_2799:
	sdivx	%o4,	0x033C,	%l2
loop_2800:
	stb	%i7,	[%l7 + 0x5B]
	bgu,a	%xcc,	loop_2801
	nop
	setx loop_2802, %l0, %l1
	jmpl %l1, %i3
	fbo,a	%fcc0,	loop_2803
	smulcc	%i1,	%i2,	%l6
loop_2801:
	taddcc	%l5,	%o3,	%l4
loop_2802:
	xnorcc	%g5,	%i5,	%o0
loop_2803:
	movrlz	%l3,	0x21E,	%i6
	or	%o6,	0x14EA,	%l0
	array32	%g4,	%i0,	%l1
	fornot2s	%f4,	%f19,	%f12
	smul	%g3,	%o7,	%o2
	and	%g6,	0x1E77,	%o1
	edge16	%i4,	%o5,	%g1
	sir	0x1C77
	fblg,a	%fcc1,	loop_2804
	bneg	loop_2805
	nop
	setx	0xA9BBED34,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x9BCC3F52,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fsubs	%f26,	%f13,	%f4
	tleu	%xcc,	0x0
loop_2804:
	fones	%f14
loop_2805:
	stb	%g2,	[%l7 + 0x48]
	ld	[%l7 + 0x40],	%f18
	swap	[%l7 + 0x58],	%g7
	sub	%l2,	%i7,	%o4
	faligndata	%f10,	%f16,	%f14
	fabsd	%f20,	%f6
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x70] %asi,	%i0
	st	%f20,	[%l7 + 0x74]
	movge	%xcc,	%i3,	%l6
	set	0x28, %i6
	stxa	%i2,	[%l7 + %i6] 0xeb
	membar	#Sync
	tl	%xcc,	0x3
	ble,pt	%xcc,	loop_2806
	mulx	%o3,	%l4,	%g5
	sdiv	%i5,	0x1FCE,	%o0
	brgez,a	%l3,	loop_2807
loop_2806:
	tvs	%xcc,	0x2
	edge32l	%l5,	%o6,	%l0
	edge16l	%i6,	%i0,	%g4
loop_2807:
	fcmpgt32	%f14,	%f20,	%l1
	sdivx	%o7,	0x062D,	%o2
	sll	%g3,	0x0B,	%g6
	andcc	%i4,	0x1B8D,	%o5
	fbo,a	%fcc0,	loop_2808
	fnot2	%f18,	%f12
	nop
	fitos	%f9,	%f0
	fstoi	%f0,	%f2
	movrgz	%g1,	0x29D,	%o1
loop_2808:
	xor	%g7,	%g2,	%l2
	and	%i7,	0x1305,	%o4
	edge32ln	%i3,	%i1,	%i2
	xnorcc	%o3,	%l4,	%l6
	fsrc2s	%f25,	%f12
	edge16l	%g5,	%i5,	%o0
	addc	%l5,	%o6,	%l0
	alignaddrl	%i6,	%i0,	%l3
	movg	%xcc,	%g4,	%o7
	movle	%xcc,	%l1,	%o2
	movl	%icc,	%g6,	%g3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i4,	%o5,	%g1
	subccc	%o1,	0x0639,	%g7
	fnot2	%f22,	%f10
	movl	%xcc,	%g2,	%i7
	andncc	%o4,	%i3,	%i1
	fmovspos	%icc,	%f22,	%f9
	te	%xcc,	0x3
	st	%f22,	[%l7 + 0x38]
	movle	%icc,	%l2,	%i2
	sdivx	%l4,	0x0A9D,	%l6
	orcc	%o3,	0x0B07,	%i5
	bpos,a	%icc,	loop_2809
	fors	%f12,	%f12,	%f3
	nop
	fitos	%f10,	%f25
	fstox	%f25,	%f16
	fxtos	%f16,	%f10
	fmovrdgez	%o0,	%f0,	%f18
loop_2809:
	array32	%g5,	%l5,	%o6
	sub	%i6,	0x076B,	%i0
	tcs	%xcc,	0x3
	tneg	%xcc,	0x1
	orncc	%l3,	%g4,	%l0
	tneg	%icc,	0x5
	fmovsl	%xcc,	%f2,	%f5
	fnands	%f10,	%f15,	%f25
	ldd	[%l7 + 0x28],	%o6
	fand	%f14,	%f6,	%f18
	fabss	%f1,	%f29
	set	0x10, %o5
	ldda	[%l7 + %o5] 0x18,	%o2
	movrgez	%l1,	%g3,	%g6
	fcmpeq32	%f6,	%f18,	%i4
	movcc	%icc,	%g1,	%o5
	movcc	%icc,	%o1,	%g2
	umul	%g7,	0x1430,	%o4
	edge16n	%i3,	%i7,	%l2
	fsrc1	%f8,	%f8
	movge	%icc,	%i1,	%i2
	fmovrslez	%l6,	%f10,	%f12
	edge16	%l4,	%i5,	%o3
	nop
	fitod	%f2,	%f6
	mulscc	%o0,	%l5,	%o6
	add	%l7,	0x48,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] %asi,	%g5,	%i0
	wr	%g0,	0x0c,	%asi
	stba	%i6,	[%l7 + 0x7E] %asi
	edge32ln	%l3,	%l0,	%o7
	subc	%o2,	%g4,	%g3
	set	0x28, %g4
	ldxa	[%l7 + %g4] 0x10,	%g6
	fcmpne32	%f14,	%f0,	%i4
	fmovde	%xcc,	%f1,	%f12
	sir	0x0539
	tvs	%icc,	0x1
	movgu	%icc,	%l1,	%o5
	array16	%o1,	%g2,	%g7
	ldsh	[%l7 + 0x70],	%g1
	fbn,a	%fcc3,	loop_2810
	sethi	0x1137,	%i3
	xnorcc	%o4,	%l2,	%i1
	bvs	%icc,	loop_2811
loop_2810:
	nop
	setx	0xC9C2AE46,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f4
	tvc	%xcc,	0x5
	std	%f12,	[%l7 + 0x30]
loop_2811:
	fmovrde	%i2,	%f20,	%f4
	tl	%icc,	0x4
	udivcc	%l6,	0x0444,	%i7
	movgu	%xcc,	%l4,	%o3
	tleu	%xcc,	0x6
	tl	%icc,	0x2
	movvs	%icc,	%o0,	%l5
	tn	%xcc,	0x4
	popc	%i5,	%o6
	tvs	%xcc,	0x2
	tcs	%icc,	0x6
	mulx	%g5,	0x1C10,	%i0
	fmovse	%xcc,	%f7,	%f13
	xor	%i6,	0x0F6A,	%l3
	bne,a,pt	%icc,	loop_2812
	bcc	%xcc,	loop_2813
	fsrc1	%f0,	%f2
	smulcc	%o7,	%l0,	%o2
loop_2812:
	movrgez	%g4,	%g6,	%g3
loop_2813:
	tneg	%icc,	0x5
	orcc	%l1,	0x19CB,	%i4
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x50] %asi,	%o1
	movn	%icc,	%o5,	%g7
	te	%icc,	0x7
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x64] %asi,	%f0
	ta	%icc,	0x7
	sra	%g1,	0x1E,	%i3
	edge16n	%g2,	%o4,	%l2
	addc	%i1,	%i2,	%i7
	movle	%xcc,	%l4,	%o3
	fabss	%f25,	%f29
	edge32n	%l6,	%l5,	%o0
	and	%i5,	%o6,	%g5
	sllx	%i0,	0x18,	%l3
	bleu,a,pn	%icc,	loop_2814
	array16	%o7,	%i6,	%o2
	smul	%g4,	0x0E91,	%g6
	fcmple32	%f10,	%f4,	%g3
loop_2814:
	srax	%l0,	%l1,	%o1
	xnorcc	%i4,	0x01FA,	%g7
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x39] %asi,	%g1
	movn	%xcc,	%o5,	%g2
	orn	%o4,	%i3,	%i1
	fmovsl	%xcc,	%f27,	%f4
	sra	%i2,	0x1F,	%i7
	smul	%l2,	%l4,	%l6
	tsubcc	%o3,	%o0,	%l5
	tne	%xcc,	0x0
	brnz,a	%o6,	loop_2815
	tsubcctv	%g5,	0x1A35,	%i5
	flush	%l7 + 0x08
	addc	%l3,	%i0,	%o7
loop_2815:
	nop
	setx	0x93664EFAAB0768B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x08218BE80B6C8911,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f28,	%f20
	nop
	setx	loop_2816,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%i6,	%o2,	%g4
	fmovdcc	%icc,	%f4,	%f23
	movl	%xcc,	%g3,	%g6
loop_2816:
	movge	%xcc,	%l0,	%o1
	movrlz	%l1,	0x1FB,	%g7
	nop
	setx	0xF703869C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x34A8C846,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f2,	%f27
	fmuld8sux16	%f30,	%f27,	%f14
	fbuge,a	%fcc2,	loop_2817
	fmovd	%f30,	%f4
	movl	%icc,	%g1,	%o5
	fmovs	%f6,	%f29
loop_2817:
	nop
	setx	0x8E9EC65A1CEA709C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xBFB05BC53BD87D46,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f8,	%f2
	movle	%xcc,	%g2,	%i4
	fmovdle	%xcc,	%f13,	%f8
	bgu	loop_2818
	swap	[%l7 + 0x64],	%o4
	fmovsle	%xcc,	%f3,	%f17
	smulcc	%i3,	%i2,	%i1
loop_2818:
	stbar
	edge8n	%i7,	%l2,	%l4
	sth	%o3,	[%l7 + 0x22]
	fmovdvs	%icc,	%f9,	%f12
	tneg	%xcc,	0x7
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x28] %asi,	%l6
	tge	%xcc,	0x0
	fpmerge	%f7,	%f17,	%f18
	sth	%l5,	[%l7 + 0x2E]
	fxors	%f1,	%f10,	%f17
	subccc	%o0,	%o6,	%i5
	edge16l	%g5,	%i0,	%l3
	nop
	fitos	%f3,	%f25
	fstod	%f25,	%f6
	fbuge	%fcc0,	loop_2819
	andncc	%i6,	%o2,	%o7
	subc	%g3,	0x0782,	%g4
	mulscc	%l0,	0x0F41,	%o1
loop_2819:
	movvs	%xcc,	%l1,	%g6
	popc	0x0007,	%g1
	movl	%xcc,	%o5,	%g2
	bgu,a	loop_2820
	edge16l	%i4,	%o4,	%i3
	bneg,pn	%icc,	loop_2821
	srl	%i2,	%g7,	%i1
loop_2820:
	movrlez	%l2,	%i7,	%o3
	array32	%l4,	%l6,	%l5
loop_2821:
	ldd	[%l7 + 0x18],	%o0
	taddcc	%i5,	0x0224,	%o6
	set	0x4C, %g1
	sta	%f12,	[%l7 + %g1] 0x80
	subcc	%g5,	%l3,	%i6
	sir	0x00CD
	udivcc	%o2,	0x0AE2,	%o7
	xorcc	%i0,	%g4,	%g3
	tsubcctv	%o1,	%l1,	%g6
	bneg,a,pt	%xcc,	loop_2822
	smul	%g1,	%l0,	%g2
	taddcc	%o5,	%o4,	%i3
	te	%xcc,	0x7
loop_2822:
	ldsb	[%l7 + 0x25],	%i2
	fsrc1	%f16,	%f12
	fmovscs	%xcc,	%f14,	%f7
	fbe	%fcc3,	loop_2823
	srlx	%i4,	0x1F,	%i1
	fmovrdgez	%l2,	%f2,	%f12
	movg	%xcc,	%g7,	%i7
loop_2823:
	andn	%o3,	0x0D87,	%l6
	array8	%l5,	%l4,	%i5
	sllx	%o6,	%g5,	%l3
	edge32	%i6,	%o2,	%o0
	fones	%f4
	bvs	%xcc,	loop_2824
	alignaddr	%o7,	%g4,	%g3
	taddcctv	%i0,	%o1,	%l1
	fbg	%fcc0,	loop_2825
loop_2824:
	taddcctv	%g1,	0x0A79,	%g6
	sdivcc	%g2,	0x07C1,	%l0
	alignaddr	%o4,	%i3,	%i2
loop_2825:
	fornot1	%f2,	%f2,	%f14
	sra	%i4,	%i1,	%o5
	srlx	%l2,	0x1B,	%i7
	tgu	%icc,	0x3
	mulscc	%g7,	0x148E,	%l6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x24] %asi,	%l5
	edge8	%l4,	%i5,	%o6
	nop
	setx loop_2826, %l0, %l1
	jmpl %l1, %o3
	edge32n	%g5,	%i6,	%l3
	fba,a	%fcc3,	loop_2827
	te	%xcc,	0x3
loop_2826:
	add	%o0,	%o7,	%g4
	fmovs	%f27,	%f5
loop_2827:
	movrne	%o2,	0x33A,	%i0
	ldd	[%l7 + 0x20],	%o0
	set	0x6E, %g7
	stha	%g3,	[%l7 + %g7] 0x80
	fmovrsne	%l1,	%f17,	%f26
	fbug	%fcc3,	loop_2828
	fmovsge	%icc,	%f2,	%f19
	bge,a	loop_2829
	orcc	%g1,	%g6,	%l0
loop_2828:
	fmul8sux16	%f0,	%f22,	%f20
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2829:
	fmovrdgez	%o4,	%f30,	%f24
	tsubcctv	%g2,	%i2,	%i4
	fbne	%fcc0,	loop_2830
	mulx	%i1,	%o5,	%l2
	and	%i3,	%g7,	%i7
	bvs	loop_2831
loop_2830:
	mulx	%l6,	%l5,	%l4
	movle	%xcc,	%o6,	%i5
	nop
	setx loop_2832, %l0, %l1
	jmpl %l1, %o3
loop_2831:
	fnot2s	%f4,	%f27
	fcmpeq32	%f26,	%f22,	%i6
	mulx	%l3,	0x1D0A,	%g5
loop_2832:
	mova	%icc,	%o7,	%g4
	edge16ln	%o2,	%i0,	%o0
	fbue,a	%fcc3,	loop_2833
	and	%o1,	%l1,	%g1
	addcc	%g6,	%g3,	%o4
	sra	%l0,	%g2,	%i4
loop_2833:
	movle	%icc,	%i1,	%i2
	nop
	setx	0xC061F2ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	umul	%o5,	0x0F7A,	%i3
	fbl	%fcc2,	loop_2834
	movcs	%xcc,	%g7,	%i7
	array8	%l6,	%l2,	%l5
	fmul8ulx16	%f8,	%f6,	%f30
loop_2834:
	movpos	%icc,	%o6,	%l4
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x24] %asi,	%f13
	prefetch	[%l7 + 0x50],	 0x0
	movg	%xcc,	%o3,	%i6
	nop
	setx	loop_2835,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bg,a,pt	%icc,	loop_2836
	tvc	%xcc,	0x2
	fxnors	%f10,	%f27,	%f23
loop_2835:
	nop
	set	0x64, %g5
	lda	[%l7 + %g5] 0x18,	%f17
loop_2836:
	fmovdg	%xcc,	%f30,	%f7
	subccc	%l3,	%i5,	%g5
	mulscc	%o7,	0x136D,	%o2
	tvs	%xcc,	0x0
	tsubcc	%g4,	%i0,	%o1
	sllx	%l1,	%g1,	%o0
	mulx	%g6,	%o4,	%l0
	set	0x60, %o7
	stwa	%g2,	[%l7 + %o7] 0x2a
	membar	#Sync
	fbge	%fcc1,	loop_2837
	fsrc2s	%f0,	%f25
	andn	%i4,	%g3,	%i1
	fmovrse	%o5,	%f25,	%f28
loop_2837:
	andncc	%i2,	%i3,	%g7
	tpos	%xcc,	0x7
	or	%l6,	0x13E8,	%l2
	srlx	%i7,	0x02,	%o6
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%l4,	%o3
	movcs	%icc,	%i6,	%l3
	brz,a	%i5,	loop_2838
	umul	%g5,	0x1009,	%o7
	sllx	%o2,	%g4,	%i0
	tneg	%xcc,	0x7
loop_2838:
	mulscc	%l5,	0x0B64,	%l1
	nop
	setx	0x9DA00C760AF50772,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0xA9DE8AFEED8BB341,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f10,	%f10
	te	%xcc,	0x2
	bgu,a,pn	%icc,	loop_2839
	fcmple32	%f6,	%f28,	%o1
	fandnot2	%f14,	%f12,	%f4
	bneg,a	%icc,	loop_2840
loop_2839:
	edge8ln	%g1,	%g6,	%o4
	bvs,pt	%xcc,	loop_2841
	movle	%icc,	%l0,	%o0
loop_2840:
	nop
	set	0x56, %o6
	stha	%g2,	[%l7 + %o6] 0x89
loop_2841:
	sir	0x08F1
	edge32n	%g3,	%i4,	%i1
	movcc	%xcc,	%i2,	%o5
	fmovsvs	%xcc,	%f14,	%f9
	std	%f16,	[%l7 + 0x30]
	edge16n	%i3,	%l6,	%g7
	fcmpeq32	%f26,	%f24,	%i7
	and	%o6,	%l4,	%o3
	fmovde	%icc,	%f22,	%f20
	srlx	%l2,	0x03,	%i6
	orn	%i5,	0x19A9,	%l3
	edge32ln	%g5,	%o7,	%o2
	sdiv	%g4,	0x166F,	%i0
	set	0x70, %l0
	lda	[%l7 + %l0] 0x14,	%f27
	fmovda	%xcc,	%f30,	%f20
	movrgz	%l1,	%o1,	%g1
	bleu,a,pn	%icc,	loop_2842
	xor	%l5,	0x07E2,	%o4
	umulcc	%g6,	0x03AE,	%o0
	sub	%l0,	0x0869,	%g2
loop_2842:
	fmovdneg	%icc,	%f20,	%f18
	ld	[%l7 + 0x48],	%f1
	set	0x14, %g6
	swapa	[%l7 + %g6] 0x80,	%i4
	set	0x40, %o4
	stda	%f16,	[%l7 + %o4] 0x1f
	membar	#Sync
	tneg	%xcc,	0x5
	fmovsleu	%xcc,	%f13,	%f9
	tsubcctv	%g3,	%i1,	%i2
	fble	%fcc1,	loop_2843
	tvc	%xcc,	0x1
	fcmpgt32	%f28,	%f18,	%i3
	sra	%o5,	0x0B,	%l6
loop_2843:
	fbu,a	%fcc2,	loop_2844
	tvc	%icc,	0x1
	wr	%g0,	0xe2,	%asi
	stha	%i7,	[%l7 + 0x20] %asi
	membar	#Sync
loop_2844:
	smulcc	%g7,	0x0F07,	%o6
	fbuge	%fcc3,	loop_2845
	movn	%xcc,	%o3,	%l2
	sth	%l4,	[%l7 + 0x42]
	mova	%icc,	%i6,	%i5
loop_2845:
	fble,a	%fcc2,	loop_2846
	orn	%l3,	%g5,	%o2
	stx	%g4,	[%l7 + 0x08]
	bgu	loop_2847
loop_2846:
	sra	%o7,	0x1D,	%i0
	movpos	%xcc,	%l1,	%o1
	array16	%l5,	%g1,	%o4
loop_2847:
	tvs	%xcc,	0x0
	wr	%g0,	0x88,	%asi
	stba	%g6,	[%l7 + 0x19] %asi
	xor	%o0,	0x028D,	%l0
	brlez,a	%i4,	loop_2848
	sdiv	%g2,	0x061C,	%i1
	te	%xcc,	0x0
	bgu,pt	%icc,	loop_2849
loop_2848:
	sdivx	%g3,	0x0116,	%i3
	edge16ln	%i2,	%o5,	%i7
	movle	%icc,	%g7,	%o6
loop_2849:
	movgu	%xcc,	%l6,	%l2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f20,	%f29,	%f11
	fbule,a	%fcc1,	loop_2850
	sethi	0x1020,	%o3
	movne	%xcc,	%l4,	%i5
	bshuffle	%f0,	%f4,	%f4
loop_2850:
	st	%f5,	[%l7 + 0x44]
	tsubcctv	%l3,	0x1A10,	%g5
	pdist	%f22,	%f26,	%f26
	tvc	%xcc,	0x4
	addcc	%o2,	0x197C,	%g4
	tvs	%icc,	0x7
	fandnot2	%f18,	%f14,	%f4
	andncc	%o7,	%i6,	%l1
	subcc	%o1,	%l5,	%g1
	movl	%xcc,	%i0,	%o4
	flush	%l7 + 0x5C
	taddcc	%o0,	0x005D,	%g6
	movl	%xcc,	%i4,	%l0
	ble,a	%icc,	loop_2851
	fmovspos	%xcc,	%f21,	%f16
	set	0x78, %l6
	ldswa	[%l7 + %l6] 0x04,	%i1
loop_2851:
	nop
	wr	%g0,	0xe3,	%asi
	stwa	%g2,	[%l7 + 0x4C] %asi
	membar	#Sync
	udiv	%g3,	0x1E56,	%i2
	movg	%icc,	%o5,	%i7
	nop
	setx	loop_2852,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andn	%g7,	0x0620,	%i3
	edge16n	%l6,	%o6,	%l2
	ble,a	loop_2853
loop_2852:
	addc	%o3,	0x03A7,	%l4
	brgz,a	%i5,	loop_2854
	array16	%l3,	%o2,	%g4
loop_2853:
	fmul8x16	%f22,	%f26,	%f8
	sra	%o7,	%i6,	%l1
loop_2854:
	tsubcc	%o1,	%g5,	%l5
	fpsub32s	%f4,	%f25,	%f12
	orn	%g1,	0x1F3F,	%o4
	sra	%i0,	0x1A,	%o0
	sethi	0x0194,	%g6
	nop
	setx	0x8A9AE41995E809DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x4879D559B4A6AFCE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f20,	%f2
	std	%f6,	[%l7 + 0x20]
	fmovdle	%xcc,	%f7,	%f25
	movrlez	%l0,	%i1,	%i4
	wr	%g0,	0xea,	%asi
	stxa	%g3,	[%l7 + 0x08] %asi
	membar	#Sync
	xnor	%g2,	0x1C90,	%o5
	array8	%i2,	%i7,	%g7
	set	0x50, %o1
	prefetcha	[%l7 + %o1] 0x10,	 0x0
	srax	%l6,	%l2,	%o6
	tleu	%icc,	0x1
	fcmpne32	%f0,	%f10,	%l4
	edge32ln	%i5,	%l3,	%o2
	fbul	%fcc2,	loop_2855
	swap	[%l7 + 0x24],	%g4
	orn	%o3,	0x0DD5,	%i6
	fsrc1s	%f24,	%f0
loop_2855:
	bgu,pt	%xcc,	loop_2856
	fble,a	%fcc1,	loop_2857
	tpos	%icc,	0x6
	xor	%l1,	0x05F0,	%o1
loop_2856:
	movre	%g5,	%o7,	%l5
loop_2857:
	nop
	setx	0xFAAC1839EF3AC858,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x8C94578FF13011A0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f28,	%f14
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x0c
	nop
	setx	0xA59373E4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x265AE82B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f8,	%f4
	tsubcc	%o4,	%g1,	%i0
	taddcc	%g6,	%o0,	%i1
	fbuge,a	%fcc1,	loop_2858
	fpsub32s	%f25,	%f17,	%f9
	movleu	%icc,	%l0,	%g3
	umulcc	%i4,	0x1C8A,	%g2
loop_2858:
	udiv	%o5,	0x0C3E,	%i7
	nop
	fitos	%f5,	%f15
	fstoi	%f15,	%f22
	mova	%icc,	%g7,	%i3
	fmovrsgz	%i2,	%f11,	%f6
	edge16n	%l6,	%l2,	%o6
	movneg	%icc,	%i5,	%l4
	fble,a	%fcc2,	loop_2859
	fmovscc	%xcc,	%f9,	%f25
	alignaddrl	%l3,	%g4,	%o3
	andncc	%i6,	%l1,	%o2
loop_2859:
	fexpand	%f11,	%f28
	fbe,a	%fcc0,	loop_2860
	ldd	[%l7 + 0x50],	%f24
	set	0x0F, %i7
	stba	%g5,	[%l7 + %i7] 0x89
loop_2860:
	prefetch	[%l7 + 0x48],	 0x1
	st	%f29,	[%l7 + 0x18]
	tpos	%icc,	0x4
	fmovse	%icc,	%f14,	%f12
	movpos	%icc,	%o7,	%l5
	edge32ln	%o4,	%g1,	%o1
	movleu	%icc,	%i0,	%o0
	fmovdcs	%icc,	%f16,	%f1
	tg	%icc,	0x2
	movg	%icc,	%g6,	%i1
	tvs	%xcc,	0x0
	tl	%icc,	0x4
	fabss	%f0,	%f24
	fxnors	%f5,	%f23,	%f30
	tn	%icc,	0x7
	movleu	%icc,	%g3,	%i4
	mulscc	%g2,	%o5,	%l0
	nop
	setx	0x4C2ABD0C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x1E09C434,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f4,	%f6
	andn	%i7,	0x08C5,	%i3
	nop
	setx	loop_2861,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32n	%i2,	%l6,	%g7
	srlx	%l2,	%i5,	%o6
	xnorcc	%l4,	0x19A4,	%g4
loop_2861:
	subcc	%o3,	%l3,	%i6
	tvc	%icc,	0x0
	movrgz	%l1,	%o2,	%g5
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%l5
	fbule,a	%fcc3,	loop_2862
	ld	[%l7 + 0x34],	%f22
	fmul8x16	%f21,	%f20,	%f28
	tle	%xcc,	0x1
loop_2862:
	taddcc	%o4,	0x01CC,	%g1
	popc	%o7,	%i0
	smul	%o0,	%g6,	%o1
	movn	%xcc,	%g3,	%i4
	mulx	%i1,	%o5,	%g2
	fbule,a	%fcc3,	loop_2863
	umul	%l0,	%i7,	%i2
	bpos,a,pt	%icc,	loop_2864
	fandnot1s	%f23,	%f2,	%f2
loop_2863:
	andncc	%l6,	%g7,	%l2
	edge16	%i5,	%o6,	%i3
loop_2864:
	fmovdg	%icc,	%f3,	%f3
	tsubcctv	%l4,	%g4,	%l3
	brnz	%o3,	loop_2865
	edge16n	%l1,	%o2,	%i6
	fmul8x16al	%f25,	%f30,	%f20
	xnorcc	%l5,	%g5,	%o4
loop_2865:
	fbn,a	%fcc3,	loop_2866
	ldstub	[%l7 + 0x55],	%g1
	bshuffle	%f8,	%f6,	%f22
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x08] %asi,	%o7
loop_2866:
	fbo	%fcc0,	loop_2867
	tge	%icc,	0x3
	fmovdcc	%icc,	%f17,	%f22
	nop
	setx	0x377B8FA3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x1D121533,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fsubs	%f31,	%f16,	%f29
loop_2867:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%g6
	fbg,a	%fcc2,	loop_2868
	or	%i0,	%g3,	%o1
	movpos	%icc,	%i1,	%i4
	set	0x24, %i3
	stwa	%g2,	[%l7 + %i3] 0x10
loop_2868:
	fmul8x16au	%f13,	%f14,	%f0
	sdivcc	%o5,	0x0226,	%l0
	alignaddr	%i7,	%l6,	%g7
	movne	%icc,	%l2,	%i5
	movrlz	%i2,	%i3,	%l4
	addccc	%o6,	0x1629,	%l3
	edge32ln	%g4,	%o3,	%l1
	fmovscs	%xcc,	%f23,	%f8
	tneg	%xcc,	0x1
	tge	%xcc,	0x5
	ble,a,pt	%icc,	loop_2869
	fcmple32	%f22,	%f14,	%o2
	umul	%i6,	%l5,	%o4
	fone	%f12
loop_2869:
	fzero	%f28
	xnor	%g1,	0x09CC,	%g5
	sll	%o0,	%o7,	%i0
	fbue	%fcc1,	loop_2870
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f21,	%f0,	%f22
	tpos	%xcc,	0x2
loop_2870:
	nop
	set	0x50, %o3
	swapa	[%l7 + %o3] 0x88,	%g3
	srax	%g6,	%i1,	%i4
	fands	%f27,	%f25,	%f26
	movvc	%xcc,	%o1,	%g2
	sll	%o5,	%i7,	%l0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g7,	0x06AB,	%l2
	taddcc	%l6,	0x043B,	%i5
	mulscc	%i2,	%i3,	%l4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%l3
	casxa	[%l6] %asi,	%l3,	%g4
	ta	%xcc,	0x6
	brlez,a	%o3,	loop_2871
	fbule,a	%fcc1,	loop_2872
	movleu	%xcc,	%o6,	%l1
	edge8n	%i6,	%l5,	%o2
loop_2871:
	fcmple32	%f0,	%f18,	%g1
loop_2872:
	tsubcctv	%g5,	%o0,	%o4
	mulx	%o7,	%g3,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i0,	0x0D73,	%i4
	mova	%icc,	%o1,	%g2
	tvc	%xcc,	0x5
	movl	%xcc,	%i1,	%o5
	bgu,a,pn	%xcc,	loop_2873
	srlx	%i7,	0x1C,	%g7
	tsubcctv	%l2,	%l0,	%i5
	swap	[%l7 + 0x74],	%l6
loop_2873:
	smulcc	%i2,	0x1733,	%l4
	srl	%i3,	%l3,	%g4
	tl	%xcc,	0x7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] %asi,	%o3,	%o6
	fornot2	%f14,	%f12,	%f18
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f28
	edge32	%l1,	%l5,	%o2
	or	%i6,	0x0D81,	%g1
	brgz	%g5,	loop_2874
	nop
	fitod	%f10,	%f20
	fdtoi	%f20,	%f25
	sll	%o0,	%o7,	%o4
	set	0x56, %o0
	stha	%g6,	[%l7 + %o0] 0x80
loop_2874:
	fmovd	%f14,	%f2
	udivx	%i0,	0x16AA,	%i4
	fmovrsne	%g3,	%f7,	%f20
	tl	%icc,	0x4
	edge8ln	%g2,	%i1,	%o1
	movre	%i7,	%g7,	%o5
	nop
	setx	0xB06D69FE,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	edge32	%l2,	%l0,	%l6
	nop
	setx loop_2875, %l0, %l1
	jmpl %l1, %i2
	sub	%i5,	0x118D,	%l4
	fsrc1	%f28,	%f26
	tcc	%icc,	0x7
loop_2875:
	prefetch	[%l7 + 0x10],	 0x0
	umulcc	%l3,	0x10BC,	%g4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x6B] %asi,	%o3
	fble	%fcc2,	loop_2876
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i3,	0x3BA,	%o6
	srax	%l1,	0x07,	%l5
loop_2876:
	fxors	%f30,	%f24,	%f26
	ta	%xcc,	0x1
	stx	%o2,	[%l7 + 0x58]
	movrlez	%g1,	%i6,	%g5
	fmovdneg	%xcc,	%f11,	%f13
	fabss	%f7,	%f4
	xnor	%o7,	%o0,	%g6
	fmovsneg	%xcc,	%f21,	%f23
	xor	%o4,	0x15FF,	%i0
	fmovsg	%xcc,	%f18,	%f8
	udiv	%i4,	0x197B,	%g3
	wr	%g0,	0x88,	%asi
	lduha	[%l7 + 0x68] %asi,	%i1
	tsubcctv	%o1,	0x0327,	%g2
	bpos,pn	%xcc,	loop_2877
	edge8l	%g7,	%o5,	%i7
	movcs	%icc,	%l0,	%l6
	ld	[%l7 + 0x38],	%f24
loop_2877:
	tsubcc	%i2,	0x165D,	%l2
	edge16n	%l4,	%i5,	%g4
	sdiv	%o3,	0x110D,	%l3
	udiv	%i3,	0x0787,	%o6
	addcc	%l1,	0x0F79,	%l5
	alignaddrl	%g1,	%i6,	%o2
	addccc	%o7,	0x163A,	%o0
	bleu,pn	%xcc,	loop_2878
	nop
	setx	loop_2879,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%g6,	%o4,	%i0
	mulx	%g5,	0x1594,	%g3
loop_2878:
	nop
	setx	0xD0644B23,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xE36E478C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fdivs	%f22,	%f31,	%f10
loop_2879:
	brgez	%i4,	loop_2880
	fabss	%f16,	%f27
	andncc	%i1,	%o1,	%g7
	umulcc	%g2,	0x1B4E,	%o5
loop_2880:
	udiv	%l0,	0x134E,	%i7
	orn	%l6,	%i2,	%l4
	tne	%icc,	0x2
	fmovrsgz	%i5,	%f1,	%f24
	tsubcctv	%l2,	%g4,	%l3
	tgu	%icc,	0x5
	brlz,a	%o3,	loop_2881
	fand	%f24,	%f18,	%f10
	nop
	set	0x3C, %l4
	ldsw	[%l7 + %l4],	%i3
	movge	%icc,	%l1,	%l5
loop_2881:
	tneg	%xcc,	0x2
	orcc	%g1,	0x0FA6,	%o6
	fmovd	%f28,	%f18
	ldd	[%l7 + 0x10],	%i6
	nop
	fitos	%f3,	%f31
	fstox	%f31,	%f20
	mulscc	%o2,	%o7,	%g6
	brlz	%o0,	loop_2882
	nop
	setx	0x8712489A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x2B46E07D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fadds	%f14,	%f20,	%f31
	alignaddrl	%o4,	%g5,	%i0
	fmovscc	%icc,	%f31,	%f13
loop_2882:
	fpadd32	%f0,	%f2,	%f6
	andn	%g3,	%i1,	%i4
	fnot1s	%f26,	%f13
	movneg	%xcc,	%o1,	%g7
	tgu	%xcc,	0x2
	add	%l7,	0x08,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] 0x89,	%o5,	%l0
	fzero	%f28
	lduh	[%l7 + 0x12],	%g2
	bneg	%icc,	loop_2883
	fba	%fcc0,	loop_2884
	fcmpgt16	%f20,	%f2,	%l6
	taddcctv	%i2,	0x185C,	%i7
loop_2883:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2884:
	bneg,a	loop_2885
	alignaddr	%i5,	%l4,	%l2
	ld	[%l7 + 0x58],	%f16
	tg	%icc,	0x1
loop_2885:
	nop
	set	0x24, %i1
	stha	%l3,	[%l7 + %i1] 0xe2
	membar	#Sync
	fbg	%fcc2,	loop_2886
	fmovrsne	%o3,	%f23,	%f3
	fmovrsne	%i3,	%f20,	%f9
	fbue	%fcc0,	loop_2887
loop_2886:
	taddcc	%l1,	0x0765,	%l5
	xorcc	%g1,	%o6,	%i6
	movgu	%xcc,	%g4,	%o2
loop_2887:
	fpsub32s	%f6,	%f4,	%f18
	wr	%g0,	0x81,	%asi
	stha	%g6,	[%l7 + 0x70] %asi
	add	%l7,	0x08,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o7
	casxa	[%l6] %asi,	%o7,	%o4
	nop
	setx loop_2888, %l0, %l1
	jmpl %l1, %o0
	fpsub16s	%f29,	%f0,	%f15
	fmovdneg	%icc,	%f25,	%f9
	movge	%icc,	%i0,	%g3
loop_2888:
	edge16ln	%i1,	%i4,	%g5
	brgz	%g7,	loop_2889
	lduh	[%l7 + 0x1A],	%o5
	or	%l0,	0x08FC,	%g2
	xor	%l6,	0x1836,	%o1
loop_2889:
	tn	%xcc,	0x2
	nop
	setx	0x00641597,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	taddcctv	%i7,	0x18DA,	%i5
	edge8l	%l4,	%l2,	%i2
	alignaddrl	%l3,	%o3,	%l1
	sdivx	%i3,	0x17B9,	%l5
	edge32n	%o6,	%g1,	%i6
	srlx	%g4,	%g6,	%o7
	bpos,a	loop_2890
	ld	[%l7 + 0x54],	%f28
	edge16n	%o4,	%o0,	%o2
	alignaddr	%g3,	%i1,	%i0
loop_2890:
	movge	%xcc,	%i4,	%g7
	edge32	%o5,	%l0,	%g2
	smulcc	%g5,	%l6,	%o1
	bn,a	loop_2891
	addcc	%i7,	%i5,	%l4
	edge32	%l2,	%l3,	%i2
	fmovdg	%icc,	%f23,	%f31
loop_2891:
	sdiv	%l1,	0x0616,	%o3
	andn	%l5,	%i3,	%o6
	tge	%xcc,	0x1
	movn	%xcc,	%g1,	%g4
	tvc	%xcc,	0x0
	sdiv	%g6,	0x182A,	%i6
	andcc	%o4,	0x0C49,	%o0
	xor	%o2,	0x0222,	%g3
	flush	%l7 + 0x6C
	movrlz	%o7,	%i0,	%i1
	popc	%i4,	%o5
	fbo,a	%fcc1,	loop_2892
	edge16l	%g7,	%g2,	%l0
	ba,a	%icc,	loop_2893
	fnot2	%f30,	%f0
loop_2892:
	edge16n	%l6,	%g5,	%o1
	tg	%xcc,	0x5
loop_2893:
	sll	%i5,	%l4,	%i7
	sdivx	%l3,	0x00E3,	%i2
	bneg,a,pn	%xcc,	loop_2894
	ba,pt	%icc,	loop_2895
	addccc	%l1,	0x13BE,	%o3
	and	%l5,	0x0050,	%i3
loop_2894:
	movre	%o6,	0x198,	%g1
loop_2895:
	movge	%xcc,	%l2,	%g4
	fcmpne32	%f20,	%f8,	%g6
	movneg	%icc,	%o4,	%i6
	bg	loop_2896
	fbn,a	%fcc1,	loop_2897
	udivcc	%o2,	0x06CB,	%g3
	sllx	%o0,	0x0E,	%i0
loop_2896:
	for	%f14,	%f6,	%f8
loop_2897:
	fble,a	%fcc0,	loop_2898
	faligndata	%f10,	%f0,	%f18
	edge32l	%o7,	%i4,	%i1
	smulcc	%g7,	%o5,	%g2
loop_2898:
	tcc	%icc,	0x2
	sllx	%l6,	0x06,	%l0
	movrgz	%g5,	%i5,	%l4
	subcc	%o1,	%l3,	%i7
	fxor	%f18,	%f8,	%f22
	taddcctv	%i2,	%l1,	%l5
	edge32n	%i3,	%o6,	%o3
	movrlz	%g1,	0x0EF,	%l2
	fbul	%fcc3,	loop_2899
	xnor	%g4,	%o4,	%g6
	edge32ln	%o2,	%g3,	%i6
	tl	%icc,	0x7
loop_2899:
	array16	%o0,	%i0,	%o7
	nop
	fitos	%f6,	%f8
	fstox	%f8,	%f18
	bgu,a	%icc,	loop_2900
	sir	0x0D78
	fbu	%fcc3,	loop_2901
	fbl,a	%fcc2,	loop_2902
loop_2900:
	membar	0x0D
	fnegs	%f27,	%f31
loop_2901:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2902:
	andncc	%i1,	%i4,	%g7
	edge16n	%o5,	%l6,	%g2
	fble	%fcc0,	loop_2903
	andcc	%g5,	%i5,	%l4
	nop
	fitos	%f2,	%f2
	fstoi	%f2,	%f10
	movg	%xcc,	%o1,	%l0
loop_2903:
	tcc	%icc,	0x7
	fmovscs	%icc,	%f7,	%f24
	xorcc	%l3,	%i2,	%i7
	fsrc1s	%f4,	%f20
	nop
	setx	0x24ED409A546725E3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xAEF7EEC881185491,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f12,	%f20
	tleu	%icc,	0x1
	bpos,a,pt	%xcc,	loop_2904
	tvs	%xcc,	0x2
	ble	%xcc,	loop_2905
	bleu,pt	%icc,	loop_2906
loop_2904:
	andcc	%l1,	%i3,	%o6
	wr	%g0,	0x89,	%asi
	stba	%l5,	[%l7 + 0x6A] %asi
loop_2905:
	tleu	%xcc,	0x7
loop_2906:
	array8	%o3,	%g1,	%g4
	stbar
	sra	%o4,	%l2,	%g6
	edge8l	%o2,	%g3,	%i6
	tpos	%icc,	0x0
	tvs	%xcc,	0x7
	nop
	fitos	%f12,	%f22
	fstod	%f22,	%f16
	sllx	%o0,	0x09,	%i0
	movrlz	%o7,	%i4,	%g7
	xor	%o5,	0x0848,	%l6
	and	%i1,	%g5,	%g2
	movrgez	%i5,	%l4,	%o1
	and	%l3,	%l0,	%i2
	fpsub16s	%f2,	%f30,	%f6
	membar	0x7F
	brlez	%l1,	loop_2907
	fmovsneg	%icc,	%f8,	%f23
	ta	%icc,	0x6
	tsubcc	%i3,	%o6,	%i7
loop_2907:
	xnorcc	%l5,	0x045F,	%o3
	movrlez	%g4,	%g1,	%l2
	andncc	%o4,	%g6,	%g3
	ldsw	[%l7 + 0x6C],	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x08] %asi,	%o0
	movvc	%xcc,	%o2,	%i0
	fbug	%fcc2,	loop_2908
	orncc	%o7,	0x1A2D,	%i4
	fmovsne	%xcc,	%f24,	%f31
	nop
	setx	loop_2909,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2908:
	fmovrslz	%o5,	%f7,	%f10
	andcc	%l6,	%i1,	%g7
	edge16	%g2,	%i5,	%g5
loop_2909:
	std	%f10,	[%l7 + 0x18]
	movcs	%xcc,	%o1,	%l3
	array32	%l4,	%i2,	%l1
	taddcc	%l0,	0x04E4,	%o6
	tneg	%icc,	0x3
	srlx	%i7,	0x17,	%l5
	bpos	%icc,	loop_2910
	st	%f5,	[%l7 + 0x38]
	fpsub32s	%f20,	%f3,	%f23
	sethi	0x0617,	%i3
loop_2910:
	movcs	%icc,	%o3,	%g1
	fble,a	%fcc0,	loop_2911
	tsubcctv	%l2,	0x1445,	%g4
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x48] %asi,	%g6
loop_2911:
	move	%icc,	%o4,	%g3
	fxnor	%f8,	%f26,	%f14
	fpadd32s	%f16,	%f5,	%f8
	fnot1s	%f1,	%f4
	fbul,a	%fcc1,	loop_2912
	ldd	[%l7 + 0x68],	%i6
	fxors	%f9,	%f18,	%f12
	fmovdvs	%icc,	%f15,	%f25
loop_2912:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o2,	%i0
	ta	%xcc,	0x2
	tvs	%icc,	0x1
	add	%o7,	%i4,	%o0
	fbo	%fcc3,	loop_2913
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
	orcc	%l6,	0x13B6,	%o5
	wr	%g0,	0x27,	%asi
	stxa	%i1,	[%l7 + 0x08] %asi
	membar	#Sync
loop_2913:
	addcc	%g2,	0x1315,	%g7
loop_2914:
	bcc,a	loop_2915
	sdivx	%g5,	0x1925,	%i5
	set	0x58, %i5
	ldxa	[%l7 + %i5] 0x19,	%l3
loop_2915:
	movvc	%icc,	%l4,	%i2
	mova	%xcc,	%o1,	%l1
	movgu	%icc,	%l0,	%o6
	movrgz	%i7,	0x3A2,	%i3
	andn	%o3,	0x017D,	%g1
	add	%l7,	0x54,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%g4
	umulcc	%l5,	%g6,	%o4
	tcs	%xcc,	0x2
	orcc	%g3,	%i6,	%i0
	flush	%l7 + 0x5C
	movle	%icc,	%o2,	%o7
	sir	0x1B30
	umulcc	%o0,	%i4,	%o5
	edge16n	%l6,	%g2,	%i1
	ldstub	[%l7 + 0x40],	%g5
	movne	%icc,	%i5,	%g7
	fbe,a	%fcc1,	loop_2916
	fmovdneg	%xcc,	%f10,	%f10
	fmovrdgez	%l4,	%f18,	%f10
	xor	%l3,	0x0975,	%i2
loop_2916:
	sir	0x1383
	tle	%icc,	0x4
	movpos	%xcc,	%l1,	%o1
	or	%l0,	0x0209,	%i7
	tvc	%icc,	0x4
	movg	%xcc,	%o6,	%i3
	and	%o3,	%l2,	%g4
	addcc	%l5,	0x1094,	%g1
	tle	%xcc,	0x3
	movpos	%xcc,	%o4,	%g6
	subcc	%g3,	0x169C,	%i6
	tg	%xcc,	0x4
	andn	%i0,	%o2,	%o0
	addcc	%i4,	%o7,	%o5
	srl	%l6,	0x01,	%g2
	fnands	%f11,	%f18,	%f4
	fmovdvc	%xcc,	%f11,	%f8
	movcc	%xcc,	%g5,	%i5
	fmul8x16au	%f13,	%f31,	%f2
	fxor	%f14,	%f8,	%f4
	tn	%icc,	0x4
	set	0x10, %i0
	lda	[%l7 + %i0] 0x89,	%f19
	smul	%g7,	%l4,	%i1
	andncc	%l3,	%i2,	%o1
	fmovdg	%icc,	%f14,	%f0
	xorcc	%l0,	0x021B,	%i7
	nop
	fitos	%f31,	%f9
	srlx	%o6,	0x04,	%l1
	udivx	%i3,	0x1641,	%l2
	addc	%g4,	0x176D,	%o3
	tcs	%icc,	0x6
	udiv	%l5,	0x0EA6,	%g1
	fmovse	%xcc,	%f4,	%f27
	fmovdleu	%icc,	%f9,	%f31
	tcs	%icc,	0x0
	membar	0x7D
	smul	%g6,	%g3,	%i6
	fmovrdne	%i0,	%f4,	%f16
	movrgez	%o2,	0x131,	%o0
	bvc,pn	%icc,	loop_2917
	movvs	%icc,	%i4,	%o4
	udivcc	%o7,	0x0432,	%l6
	xor	%g2,	0x134D,	%o5
loop_2917:
	movgu	%icc,	%i5,	%g7
	edge16n	%l4,	%i1,	%g5
	fmovsle	%icc,	%f13,	%f6
	tle	%xcc,	0x3
	andncc	%l3,	%i2,	%l0
	movrgez	%o1,	0x2EF,	%i7
	movle	%icc,	%o6,	%i3
	taddcc	%l2,	%l1,	%g4
	mulscc	%l5,	%g1,	%o3
	edge16l	%g6,	%g3,	%i6
	be,a,pt	%icc,	loop_2918
	addccc	%i0,	0x1975,	%o0
	tvs	%icc,	0x3
	bn	loop_2919
loop_2918:
	nop
	set	0x48, %g3
	stx	%i4,	[%l7 + %g3]
	set	0x18, %l2
	stxa	%o2,	[%g0 + %l2] 0x4f
loop_2919:
	tsubcctv	%o4,	%o7,	%l6
	fmovsvc	%xcc,	%f11,	%f4
	lduh	[%l7 + 0x7C],	%g2
	sdivx	%i5,	0x0766,	%g7
	tge	%icc,	0x6
	fbge	%fcc1,	loop_2920
	ldx	[%l7 + 0x18],	%o5
	smul	%l4,	0x0EF1,	%g5
	array32	%l3,	%i2,	%i1
loop_2920:
	alignaddrl	%l0,	%i7,	%o1
	fmovrsgz	%i3,	%f28,	%f7
	subccc	%l2,	%o6,	%g4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%g1
	tge	%xcc,	0x0
	faligndata	%f20,	%f20,	%f12
	ldstub	[%l7 + 0x48],	%l1
	bgu,a	loop_2921
	fabsd	%f16,	%f16
	movcc	%icc,	%o3,	%g3
	edge16	%g6,	%i0,	%i6
loop_2921:
	tsubcc	%o0,	0x1B4E,	%i4
	subcc	%o2,	0x10BC,	%o7
	mulscc	%o4,	%g2,	%i5
	edge32l	%l6,	%g7,	%l4
	edge8l	%o5,	%g5,	%l3
	membar	0x5D
	subc	%i1,	%l0,	%i2
	andn	%i7,	0x08DF,	%o1
	sth	%l2,	[%l7 + 0x64]
	brgez,a	%o6,	loop_2922
	ta	%icc,	0x7
	bvc,a	loop_2923
	brgz	%i3,	loop_2924
loop_2922:
	lduw	[%l7 + 0x28],	%l5
	fcmpeq32	%f18,	%f12,	%g4
loop_2923:
	nop
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2924:
	addc	%g1,	%l1,	%g3
	nop
	set	0x34, %i2
	ldsw	[%l7 + %i2],	%o3
	subc	%g6,	0x09DC,	%i0
	fmovsvs	%xcc,	%f3,	%f10
	edge16ln	%i6,	%i4,	%o2
	smul	%o7,	0x00EC,	%o0
	fble,a	%fcc2,	loop_2925
	popc	%g2,	%o4
	prefetch	[%l7 + 0x40],	 0x2
	popc	%l6,	%g7
loop_2925:
	sllx	%l4,	%o5,	%g5
	fpadd32	%f8,	%f4,	%f20
	tge	%icc,	0x2
	movrlz	%l3,	%i5,	%i1
	fmovdneg	%xcc,	%f2,	%f27
	sll	%i2,	0x1A,	%i7
	movle	%icc,	%l0,	%o1
	fmovd	%f30,	%f18
	edge16l	%o6,	%l2,	%l5
	tgu	%icc,	0x6
	set	0x44, %o2
	lda	[%l7 + %o2] 0x18,	%f23
	movne	%icc,	%g4,	%g1
	mova	%xcc,	%i3,	%l1
	sir	0x138E
	edge16l	%g3,	%g6,	%i0
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x54] %asi,	%o3
	ldsb	[%l7 + 0x1C],	%i4
	fandnot1	%f8,	%f0,	%f6
	nop
	setx	0xD1FEED4D705A38D9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	nop
	setx	0x14403D6614603C94,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x37E2AF21948C57C5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f8,	%f24
	ldub	[%l7 + 0x3A],	%o2
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] %asi,	%o7,	%o0
	bne,a	%icc,	loop_2926
	andn	%g2,	%o4,	%i6
	andn	%g7,	%l6,	%o5
	addccc	%g5,	%l4,	%l3
loop_2926:
	tl	%icc,	0x7
	movgu	%icc,	%i5,	%i2
	andn	%i7,	0x00FF,	%l0
	array16	%i1,	%o1,	%o6
	movgu	%icc,	%l2,	%l5
	movvc	%icc,	%g4,	%g1
	movvc	%xcc,	%l1,	%g3
	tgu	%icc,	0x1
	sdivcc	%g6,	0x191A,	%i3
	orncc	%o3,	%i0,	%o2
	tne	%icc,	0x2
	bgu,pn	%icc,	loop_2927
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x60],	%f2
	orn	%i4,	%o7,	%o0
loop_2927:
	or	%o4,	0x156C,	%i6
	be,pt	%icc,	loop_2928
	movrne	%g7,	%g2,	%l6
	bn	%icc,	loop_2929
	orcc	%o5,	0x0E12,	%g5
loop_2928:
	tcs	%xcc,	0x5
	srax	%l4,	%i5,	%i2
loop_2929:
	pdist	%f0,	%f24,	%f18
	fnegd	%f28,	%f12
	brgez	%l3,	loop_2930
	fandnot2s	%f23,	%f28,	%f25
	subcc	%l0,	0x06CE,	%i7
	mulscc	%o1,	%i1,	%l2
loop_2930:
	lduw	[%l7 + 0x58],	%l5
	srax	%o6,	0x18,	%g1
	edge8	%l1,	%g4,	%g6
	bcc,pt	%icc,	loop_2931
	fbo	%fcc2,	loop_2932
	edge16n	%i3,	%o3,	%i0
	xorcc	%o2,	%g3,	%o7
loop_2931:
	movgu	%xcc,	%o0,	%o4
loop_2932:
	edge8ln	%i6,	%i4,	%g2
	bn,a,pn	%icc,	loop_2933
	orn	%g7,	%l6,	%g5
	wr	%g0,	0xe2,	%asi
	stha	%l4,	[%l7 + 0x0C] %asi
	membar	#Sync
loop_2933:
	movvs	%xcc,	%i5,	%o5
	movleu	%icc,	%l3,	%l0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x14] %asi,	%i2
	bneg,a,pt	%xcc,	loop_2934
	fmovrdgz	%o1,	%f12,	%f30
	xnorcc	%i7,	0x1062,	%i1
	fbue,a	%fcc1,	loop_2935
loop_2934:
	fmovrdlz	%l5,	%f20,	%f8
	edge8ln	%l2,	%o6,	%l1
	array8	%g1,	%g6,	%i3
loop_2935:
	bleu,a	loop_2936
	fbue,a	%fcc3,	loop_2937
	move	%xcc,	%o3,	%g4
	sll	%o2,	%i0,	%g3
loop_2936:
	edge16l	%o0,	%o4,	%i6
loop_2937:
	fmul8x16al	%f17,	%f0,	%f2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i4,	%o7
	fnors	%f14,	%f4,	%f10
	nop
	fitos	%f14,	%f8
	fstox	%f8,	%f28
	add	%g2,	%l6,	%g5
	srl	%l4,	0x19,	%g7
	edge32l	%i5,	%l3,	%o5
	xnor	%i2,	%o1,	%l0
	bvs,a	loop_2938
	edge8	%i1,	%i7,	%l5
	sethi	0x1E40,	%o6
	sth	%l2,	[%l7 + 0x16]
loop_2938:
	edge32l	%l1,	%g1,	%g6
	fmovspos	%icc,	%f5,	%f21
	fandnot2	%f18,	%f2,	%f8
	and	%o3,	0x156D,	%g4
	movpos	%xcc,	%o2,	%i3
	smul	%g3,	%o0,	%i0
	orn	%i6,	0x0B18,	%o4
	edge32	%i4,	%g2,	%l6
	set	0x70, %i4
	stxa	%g5,	[%l7 + %i4] 0x2f
	membar	#Sync
	ta	%xcc,	0x1
	orcc	%l4,	0x1C7D,	%o7
	movrgez	%i5,	%g7,	%o5
	fmovda	%icc,	%f17,	%f2
	movrgez	%i2,	%o1,	%l3
	movpos	%xcc,	%i1,	%l0
	mulscc	%l5,	%i7,	%l2
	fbg,a	%fcc0,	loop_2939
	fmovsn	%xcc,	%f21,	%f8
	bg,a	loop_2940
	xnor	%o6,	0x0316,	%l1
loop_2939:
	tne	%xcc,	0x6
	movleu	%xcc,	%g1,	%o3
loop_2940:
	edge16l	%g4,	%g6,	%o2
	fand	%f0,	%f18,	%f8
	wr	%g0,	0x1f,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	movneg	%xcc,	%i3,	%g3
	fandnot1	%f0,	%f26,	%f12
	alignaddrl	%o0,	%i6,	%o4
	sdivcc	%i4,	0x02E0,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g2,	%g5,	%l4
	fbge,a	%fcc1,	loop_2941
	ba	loop_2942
	udiv	%l6,	0x0264,	%i5
	add	%o7,	0x1641,	%g7
loop_2941:
	bcc,a	%icc,	loop_2943
loop_2942:
	fba	%fcc3,	loop_2944
	array16	%i2,	%o5,	%l3
	mova	%icc,	%i1,	%o1
loop_2943:
	fmovsne	%icc,	%f5,	%f28
loop_2944:
	tsubcctv	%l5,	%i7,	%l0
	tg	%xcc,	0x4
	edge8	%l2,	%l1,	%o6
	nop
	setx	0x607A133A,	%l0,	%l6
	st	%l6,	[%l7 + 0x44]
	ld	[%l7 + 0x44],	%fsr
	smul	%o3,	0x1AD1,	%g4
	edge32	%g1,	%g6,	%i3
	movcs	%icc,	%g3,	%o0
	umulcc	%i6,	%o2,	%i4
	edge32n	%i0,	%g2,	%g5
	fmovsn	%icc,	%f3,	%f8
	edge16l	%o4,	%l6,	%i5
	bg	%xcc,	loop_2945
	mulx	%l4,	%g7,	%o7
	movrgz	%o5,	%i2,	%l3
	move	%icc,	%i1,	%l5
loop_2945:
	fbul,a	%fcc0,	loop_2946
	sdivx	%i7,	0x01E2,	%o1
	array16	%l0,	%l2,	%o6
	fxor	%f14,	%f14,	%f2
loop_2946:
	bcc,a	loop_2947
	fexpand	%f14,	%f22
	fpack16	%f10,	%f28
	nop
	setx	0x1C3916FA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x253E1D9C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f5,	%f5
loop_2947:
	fcmpgt16	%f0,	%f16,	%l1
	movgu	%xcc,	%o3,	%g1
	movre	%g4,	0x130,	%i3
	sth	%g3,	[%l7 + 0x74]
	movvc	%icc,	%g6,	%i6
	popc	0x009F,	%o2
	fmovdcc	%icc,	%f25,	%f22
	movleu	%icc,	%i4,	%o0
	tcc	%xcc,	0x5
	edge8l	%g2,	%i0,	%o4
	movrlez	%l6,	0x132,	%i5
	orncc	%g5,	0x0989,	%g7
	brlez,a	%l4,	loop_2948
	add	%o7,	0x14AD,	%o5
	sdiv	%l3,	0x1642,	%i1
	nop
	set	0x38, %l5
	stw	%l5,	[%l7 + %l5]
loop_2948:
	nop
	setx	0x1048BEE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	sir	0x1CD4
	xnorcc	%i2,	%i7,	%o1
	tl	%xcc,	0x2
	edge8n	%l0,	%l2,	%l1
	movn	%xcc,	%o6,	%g1
	fmovsvs	%icc,	%f18,	%f7
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x17
	membar	#Sync
	wr	%g0,	0x19,	%asi
	sta	%f4,	[%l7 + 0x10] %asi
	tleu	%icc,	0x2
	fpadd16s	%f4,	%f4,	%f0
	mulx	%o3,	0x013F,	%i3
	udivx	%g3,	0x1D64,	%g4
	array8	%g6,	%o2,	%i4
	faligndata	%f30,	%f6,	%f16
	fbul,a	%fcc2,	loop_2949
	edge32n	%i6,	%g2,	%i0
	mulscc	%o0,	0x1AA7,	%l6
	andncc	%i5,	%g5,	%o4
loop_2949:
	bgu,a,pn	%icc,	loop_2950
	edge16n	%g7,	%o7,	%o5
	edge16n	%l3,	%i1,	%l4
	alignaddr	%i2,	%i7,	%o1
loop_2950:
	subcc	%l5,	%l2,	%l1
	srlx	%l0,	%o6,	%o3
	brgz	%g1,	loop_2951
	movgu	%icc,	%i3,	%g3
	movrne	%g6,	%g4,	%o2
	tcc	%xcc,	0x5
loop_2951:
	subc	%i4,	0x061C,	%i6
	edge16ln	%i0,	%o0,	%l6
	movneg	%xcc,	%i5,	%g2
	tgu	%xcc,	0x2
	movpos	%icc,	%g5,	%g7
	fnors	%f22,	%f14,	%f12
	tvs	%xcc,	0x5
	movre	%o4,	%o7,	%o5
	fmovde	%icc,	%f27,	%f2
	sir	0x0628
	xnor	%l3,	0x0988,	%l4
	fmovspos	%icc,	%f21,	%f10
	srl	%i2,	0x0B,	%i1
	orcc	%i7,	%l5,	%l2
	movleu	%xcc,	%o1,	%l0
	sethi	0x151E,	%l1
	orncc	%o3,	%g1,	%i3
	fmovse	%icc,	%f0,	%f0
	xorcc	%g3,	%o6,	%g4
	xor	%g6,	0x1B4E,	%o2
	tleu	%xcc,	0x5
	ldd	[%l7 + 0x70],	%f30
	movneg	%icc,	%i4,	%i6
	lduh	[%l7 + 0x0E],	%o0
	nop
	setx loop_2952, %l0, %l1
	jmpl %l1, %l6
	tsubcc	%i0,	0x1C33,	%i5
	fsrc2s	%f24,	%f28
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x81,	%f16
loop_2952:
	fbe	%fcc0,	loop_2953
	udivx	%g2,	0x1A98,	%g7
	andn	%o4,	0x00CC,	%o7
	edge8n	%g5,	%l3,	%o5
loop_2953:
	fbuge	%fcc3,	loop_2954
	movle	%xcc,	%i2,	%i1
	ld	[%l7 + 0x48],	%f8
	movpos	%icc,	%l4,	%l5
loop_2954:
	fsrc1	%f6,	%f22
	fbg,a	%fcc1,	loop_2955
	tneg	%xcc,	0x2
	fmovrdne	%l2,	%f2,	%f12
	tvc	%icc,	0x3
loop_2955:
	tgu	%icc,	0x3
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f20
	fxtod	%f20,	%f2
	tpos	%xcc,	0x0
	fxors	%f18,	%f16,	%f20
	sdivx	%i7,	0x1FD3,	%o1
	alignaddrl	%l0,	%o3,	%g1
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
	edge16n	%l1,	%i3,	%g3
	subcc	%g4,	%g6,	%o6
	fmovscs	%icc,	%f25,	%f15
loop_2956:
	tcc	%icc,	0x6
	ldstub	[%l7 + 0x55],	%i4
	addccc	%i6,	%o2,	%l6
	movvc	%icc,	%i0,	%i5
	smul	%g2,	0x17FD,	%o0
	addcc	%g7,	%o4,	%g5
	xnor	%o7,	0x00B7,	%o5
	fpack16	%f24,	%f25
	fbg,a	%fcc3,	loop_2957
	mulscc	%l3,	%i2,	%i1
	srax	%l5,	0x09,	%l2
	nop
	setx	0xD02BDB9E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xC9FB6916,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fdivs	%f6,	%f11,	%f19
loop_2957:
	mova	%xcc,	%l4,	%i7
	fmovrdlz	%o1,	%f14,	%f0
	array8	%o3,	%g1,	%l1
	set	0x34, %i6
	ldswa	[%l7 + %i6] 0x81,	%l0
	umul	%i3,	%g3,	%g4
	fbn,a	%fcc2,	loop_2958
	mulx	%o6,	%g6,	%i6
	taddcctv	%o2,	%i4,	%l6
	subc	%i0,	0x10D4,	%i5
loop_2958:
	edge16n	%g2,	%o0,	%o4
	edge8ln	%g7,	%o7,	%g5
	tge	%xcc,	0x6
	brgez	%l3,	loop_2959
	fornot2s	%f8,	%f1,	%f2
	movvc	%xcc,	%i2,	%i1
	tsubcc	%o5,	%l2,	%l5
loop_2959:
	movrgez	%i7,	0x2D0,	%l4
	fpackfix	%f4,	%f1
	nop
	setx	loop_2960,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movleu	%icc,	%o3,	%g1
	set	0x50, %o5
	ldda	[%l7 + %o5] 0x10,	%o0
loop_2960:
	sdivx	%l0,	0x142A,	%i3
	movneg	%xcc,	%l1,	%g4
	movn	%icc,	%g3,	%o6
	lduw	[%l7 + 0x68],	%i6
	edge8ln	%o2,	%g6,	%l6
	umulcc	%i4,	%i0,	%g2
	umulcc	%o0,	0x08A0,	%o4
	lduw	[%l7 + 0x2C],	%g7
	sll	%i5,	0x19,	%g5
	nop
	fitos	%f10,	%f31
	fstoi	%f31,	%f9
	fsrc1	%f30,	%f2
	bvc,a	%icc,	loop_2961
	popc	0x037D,	%l3
	fones	%f14
	ba,pt	%xcc,	loop_2962
loop_2961:
	movl	%xcc,	%i2,	%i1
	add	%o7,	%l2,	%o5
	add	%i7,	0x0CE6,	%l4
loop_2962:
	nop
	fitos	%f14,	%f23
	fstox	%f23,	%f0
	fxtos	%f0,	%f26
	nop
	setx	0xC4AA5893607720FB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	nop
	set	0x20, %g1
	stw	%l5,	[%l7 + %g1]
	movvc	%icc,	%o3,	%o1
	fbe,a	%fcc0,	loop_2963
	fcmpeq32	%f20,	%f4,	%g1
	udivx	%i3,	0x0E4F,	%l1
	st	%f21,	[%l7 + 0x0C]
loop_2963:
	array16	%l0,	%g4,	%g3
	fmovdcs	%xcc,	%f29,	%f12
	tpos	%icc,	0x4
	array8	%i6,	%o6,	%g6
	edge32	%o2,	%l6,	%i0
	fnot1s	%f1,	%f2
	edge16n	%g2,	%o0,	%i4
	movle	%xcc,	%g7,	%o4
	tpos	%xcc,	0x3
	bvc,pn	%xcc,	loop_2964
	fnot1s	%f20,	%f26
	fone	%f12
	edge32	%g5,	%i5,	%i2
loop_2964:
	taddcc	%i1,	0x0A93,	%l3
	fbne	%fcc1,	loop_2965
	prefetch	[%l7 + 0x20],	 0x2
	fornot1s	%f11,	%f13,	%f17
	movleu	%icc,	%l2,	%o5
loop_2965:
	fxor	%f24,	%f18,	%f2
	call	loop_2966
	movleu	%icc,	%o7,	%l4
	fmovsge	%icc,	%f29,	%f2
	umul	%l5,	0x08E4,	%i7
loop_2966:
	movpos	%icc,	%o1,	%g1
	membar	0x40
	tgu	%icc,	0x1
	subccc	%o3,	0x19E4,	%l1
	fmovdge	%icc,	%f12,	%f0
	bvc	%xcc,	loop_2967
	xnor	%i3,	%g4,	%g3
	fxors	%f1,	%f3,	%f18
	nop
	setx	0x606F3A87,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
loop_2967:
	bl	%xcc,	loop_2968
	subccc	%i6,	%o6,	%l0
	tcc	%xcc,	0x5
	andn	%g6,	%l6,	%i0
loop_2968:
	movcc	%xcc,	%g2,	%o2
	subc	%o0,	%g7,	%i4
	fmovrse	%o4,	%f13,	%f8
	subccc	%g5,	%i5,	%i1
	orcc	%i2,	0x19DB,	%l3
	move	%icc,	%l2,	%o7
	fornot2	%f12,	%f8,	%f10
	stx	%o5,	[%l7 + 0x40]
	set	0x74, %g4
	lduwa	[%l7 + %g4] 0x04,	%l4
	nop
	setx	0xDD5AC91949E87D2F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x94D2E8660C0D6614,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f24,	%f30
	brgz,a	%l5,	loop_2969
	fmul8x16al	%f10,	%f14,	%f12
	orn	%o1,	%g1,	%o3
	taddcctv	%i7,	%i3,	%g4
loop_2969:
	brlz,a	%g3,	loop_2970
	flush	%l7 + 0x44
	prefetch	[%l7 + 0x38],	 0x3
	fbu	%fcc3,	loop_2971
loop_2970:
	addccc	%i6,	0x046C,	%o6
	addc	%l0,	0x1EDA,	%l1
	subc	%l6,	0x134F,	%g6
loop_2971:
	fbug,a	%fcc0,	loop_2972
	lduh	[%l7 + 0x1E],	%i0
	fones	%f30
	ldd	[%l7 + 0x58],	%f6
loop_2972:
	fones	%f0
	taddcc	%o2,	0x0D59,	%o0
	bleu,pt	%icc,	loop_2973
	nop
	fitod	%f12,	%f10
	fdtox	%f10,	%f10
	xor	%g7,	%g2,	%o4
	fmovdl	%icc,	%f11,	%f3
loop_2973:
	movn	%icc,	%i4,	%i5
	lduw	[%l7 + 0x2C],	%i1
	array16	%i2,	%l3,	%g5
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	udivx	%l2,	0x0D02,	%o5
	nop
	setx	0x831E29FC0400EE2B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xF4191C15843146A7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f30,	%f18
	prefetch	[%l7 + 0x44],	 0x2
	nop
	fitos	%f2,	%f25
	fstox	%f25,	%f0
	fbuge,a	%fcc2,	loop_2974
	fcmpgt16	%f18,	%f2,	%o7
	srax	%l4,	0x08,	%o1
	tge	%icc,	0x4
loop_2974:
	fbg	%fcc1,	loop_2975
	fsrc1s	%f1,	%f0
	stb	%l5,	[%l7 + 0x13]
	fmovsleu	%icc,	%f3,	%f15
loop_2975:
	tl	%icc,	0x1
	set	0x70, %g7
	swapa	[%l7 + %g7] 0x0c,	%g1
	umul	%o3,	0x1B7E,	%i3
	edge8ln	%i7,	%g4,	%g3
	fmovdle	%xcc,	%f8,	%f25
	sir	0x080C
	umul	%i6,	%o6,	%l1
	movrgz	%l0,	%l6,	%i0
	fnot2	%f30,	%f30
	popc	%g6,	%o0
	array16	%g7,	%g2,	%o4
	tg	%xcc,	0x4
	alignaddrl	%o2,	%i5,	%i1
	movne	%icc,	%i2,	%i4
	srlx	%l3,	0x15,	%l2
	orn	%g5,	%o7,	%l4
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x7F] %asi,	%o1
	fbe,a	%fcc3,	loop_2976
	taddcctv	%o5,	%l5,	%g1
	sth	%i3,	[%l7 + 0x38]
	andn	%i7,	%g4,	%o3
loop_2976:
	movle	%icc,	%i6,	%o6
	fpack32	%f4,	%f0,	%f10
	fmovsneg	%xcc,	%f22,	%f14
	brgz	%l1,	loop_2977
	umul	%g3,	0x0A98,	%l6
	movn	%xcc,	%i0,	%l0
	edge16	%g6,	%g7,	%o0
loop_2977:
	fmovscs	%icc,	%f29,	%f22
	srlx	%g2,	%o2,	%o4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x118] %asi,	%i5 ripped by fixASI40.pl ripped by fixASI40.pl
	xorcc	%i1,	%i2,	%i4
	subccc	%l3,	0x0628,	%l2
	addc	%o7,	0x18B8,	%l4
	wr	%g0,	0x57,	%asi
	stxa	%g5,	[%g0 + 0x0] %asi
	movpos	%icc,	%o1,	%o5
	alignaddrl	%l5,	%i3,	%i7
	fmovrdlz	%g4,	%f28,	%f4
	movg	%icc,	%o3,	%g1
	edge16l	%i6,	%o6,	%l1
	edge8	%l6,	%i0,	%g3
	smulcc	%l0,	0x17FE,	%g7
	tge	%xcc,	0x6
	fble,a	%fcc0,	loop_2978
	fbug,a	%fcc2,	loop_2979
	fmovscs	%icc,	%f11,	%f7
	move	%xcc,	%g6,	%o0
loop_2978:
	fpackfix	%f20,	%f17
loop_2979:
	alignaddrl	%o2,	%o4,	%i5
	nop
	setx	loop_2980,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udiv	%g2,	0x167D,	%i1
	fbo	%fcc2,	loop_2981
	array32	%i2,	%l3,	%l2
loop_2980:
	te	%xcc,	0x4
	tge	%icc,	0x7
loop_2981:
	tcs	%xcc,	0x6
	stbar
	array16	%o7,	%i4,	%g5
	fmovrdgz	%o1,	%f28,	%f4
	fmovdle	%icc,	%f18,	%f19
	udiv	%o5,	0x11AD,	%l5
	fmovdcs	%xcc,	%f1,	%f0
	call	loop_2982
	srl	%l4,	0x0E,	%i7
	addc	%g4,	0x0D31,	%o3
	fmovrse	%g1,	%f1,	%f17
loop_2982:
	ble	loop_2983
	tsubcc	%i6,	%o6,	%l1
	umulcc	%l6,	%i3,	%g3
	movrlz	%i0,	%l0,	%g7
loop_2983:
	srl	%g6,	%o0,	%o4
	fmovscc	%xcc,	%f30,	%f6
	subcc	%o2,	%i5,	%i1
	fmovdneg	%xcc,	%f30,	%f3
	tgu	%xcc,	0x5
	fbo,a	%fcc2,	loop_2984
	membar	0x07
	faligndata	%f0,	%f10,	%f16
	fble	%fcc3,	loop_2985
loop_2984:
	movleu	%icc,	%i2,	%l3
	fbug	%fcc3,	loop_2986
	tsubcc	%g2,	%l2,	%i4
loop_2985:
	nop
	wr	%g0,	0x11,	%asi
	ldxa	[%l7 + 0x30] %asi,	%o7
loop_2986:
	nop
	setx	loop_2987,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bcc,pn	%xcc,	loop_2988
	fbe,a	%fcc2,	loop_2989
	ldstub	[%l7 + 0x31],	%o1
loop_2987:
	fbu,a	%fcc2,	loop_2990
loop_2988:
	bvc,pn	%icc,	loop_2991
loop_2989:
	sir	0x1419
	bgu	%icc,	loop_2992
loop_2990:
	tsubcc	%o5,	%l5,	%l4
loop_2991:
	fnegd	%f6,	%f18
	fmovdcc	%icc,	%f15,	%f30
loop_2992:
	sdiv	%g5,	0x1023,	%g4
	addcc	%i7,	0x1283,	%g1
	smulcc	%o3,	%o6,	%i6
	fmovdge	%icc,	%f8,	%f22
	fmovsvs	%xcc,	%f29,	%f8
	bpos,pn	%icc,	loop_2993
	xnorcc	%l1,	%l6,	%g3
	st	%f3,	[%l7 + 0x68]
	addccc	%i0,	%i3,	%g7
loop_2993:
	xor	%l0,	%g6,	%o0
	fba	%fcc0,	loop_2994
	srlx	%o2,	%o4,	%i5
	mulx	%i2,	0x0141,	%l3
	fmovrslz	%g2,	%f12,	%f8
loop_2994:
	bpos,pt	%xcc,	loop_2995
	udiv	%l2,	0x15B1,	%i1
	tgu	%icc,	0x3
	te	%icc,	0x4
loop_2995:
	fbu	%fcc1,	loop_2996
	udivcc	%o7,	0x1C91,	%i4
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x64] %asi,	%f9
loop_2996:
	movre	%o5,	0x36A,	%l5
	set	0x50, %o7
	stwa	%o1,	[%l7 + %o7] 0x88
	ba,a,pt	%xcc,	loop_2997
	udiv	%l4,	0x1F72,	%g4
	bneg,a	loop_2998
	add	%i7,	0x1802,	%g1
loop_2997:
	fpack32	%f0,	%f8,	%f26
	tle	%xcc,	0x5
loop_2998:
	sir	0x19F8
	set	0x68, %g5
	lduha	[%l7 + %g5] 0x19,	%o3
	membar	0x65
	ldd	[%l7 + 0x48],	%g4
	movl	%icc,	%i6,	%o6
	srl	%l1,	%l6,	%i0
	edge8l	%i3,	%g7,	%l0
	movrne	%g6,	0x04D,	%o0
	bcs,a	loop_2999
	orcc	%o2,	0x061E,	%o4
	andcc	%i5,	0x1E55,	%g3
	tcs	%icc,	0x0
loop_2999:
	fmovrdgez	%l3,	%f22,	%f12
	fmovdn	%xcc,	%f16,	%f9
	sra	%i2,	0x10,	%l2
	sll	%g2,	0x0F,	%o7
	tvc	%xcc,	0x3
	fnand	%f4,	%f0,	%f10
	tge	%xcc,	0x1
	set	0x58, %o6
	swapa	[%l7 + %o6] 0x0c,	%i4
	ldsh	[%l7 + 0x4A],	%o5
	ldsw	[%l7 + 0x7C],	%i1
	brlz	%l5,	loop_3000
	ldstub	[%l7 + 0x18],	%o1
	bvs,pt	%icc,	loop_3001
	srlx	%g4,	0x08,	%i7
loop_3000:
	nop
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g1
loop_3001:
	fmovdgu	%xcc,	%f3,	%f8
	movrlez	%l4,	%g5,	%i6
	sethi	0x1EC2,	%o3
	sllx	%o6,	0x12,	%l6
	addc	%l1,	0x0DFE,	%i0
	tpos	%icc,	0x4
	brlez	%g7,	loop_3002
	xor	%i3,	%g6,	%o0
	taddcctv	%o2,	0x0979,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3002:
	addc	%o4,	%g3,	%i5
	bne,pn	%icc,	loop_3003
	fbule,a	%fcc0,	loop_3004
	for	%f0,	%f0,	%f6
	fmuld8ulx16	%f11,	%f7,	%f8
loop_3003:
	stx	%l3,	[%l7 + 0x78]
loop_3004:
	tne	%xcc,	0x1
	edge16n	%l2,	%i2,	%g2
	wr	%g0,	0x18,	%asi
	sta	%f4,	[%l7 + 0x14] %asi
	fbue,a	%fcc0,	loop_3005
	fbge	%fcc2,	loop_3006
	edge8n	%o7,	%o5,	%i4
	movrne	%i1,	%l5,	%g4
loop_3005:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3006:
	prefetch	[%l7 + 0x0C],	 0x0
	fpsub16	%f24,	%f30,	%f22
	set	0x50, %g6
	lduwa	[%l7 + %g6] 0x19,	%o1
	tcc	%icc,	0x1
	ldsb	[%l7 + 0x52],	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f12,	%f24,	%f4
	movcc	%xcc,	%g1,	%g5
	fone	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i6,	%l4,	%o3
	fmul8sux16	%f28,	%f18,	%f10
	fbug,a	%fcc0,	loop_3007
	sir	0x1B77
	movrne	%o6,	0x095,	%l1
	movleu	%xcc,	%l6,	%g7
loop_3007:
	fmovrdlz	%i3,	%f6,	%f12
	fmovdvs	%xcc,	%f3,	%f27
	sth	%i0,	[%l7 + 0x7E]
	fabss	%f23,	%f17
	mova	%xcc,	%o0,	%o2
	popc	0x04FE,	%l0
	fmovsa	%icc,	%f27,	%f0
	sra	%g6,	0x00,	%o4
	fbne	%fcc0,	loop_3008
	movgu	%xcc,	%g3,	%i5
	fpackfix	%f24,	%f15
	mova	%icc,	%l2,	%i2
loop_3008:
	movcc	%xcc,	%g2,	%o7
	addcc	%l3,	%i4,	%i1
	xor	%l5,	0x0591,	%o5
	fmovdleu	%xcc,	%f27,	%f19
	fbul,a	%fcc1,	loop_3009
	movrgez	%g4,	0x389,	%i7
	edge32	%o1,	%g1,	%g5
	taddcc	%l4,	0x1B99,	%o3
loop_3009:
	movg	%xcc,	%i6,	%o6
	array8	%l1,	%g7,	%l6
	orn	%i3,	%o0,	%o2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%l0,	%g6,	%o4
	edge16ln	%g3,	%i0,	%l2
	set	0x54, %o4
	sta	%f5,	[%l7 + %o4] 0x81
	taddcc	%i5,	%g2,	%i2
	fandnot2s	%f27,	%f10,	%f3
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x1F] %asi,	%o7
	ldsb	[%l7 + 0x37],	%l3
	subcc	%i4,	%i1,	%l5
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x46] %asi,	%g4
	subcc	%i7,	0x15FD,	%o1
	popc	0x1275,	%g1
	xor	%o5,	0x0AC9,	%g5
	brgz,a	%l4,	loop_3010
	fcmpne32	%f24,	%f30,	%o3
	or	%i6,	%l1,	%o6
	tpos	%xcc,	0x5
loop_3010:
	smul	%g7,	0x00E1,	%i3
	alignaddr	%l6,	%o2,	%l0
	ldsw	[%l7 + 0x40],	%o0
	brlz	%g6,	loop_3011
	sll	%g3,	%i0,	%l2
	srlx	%o4,	0x1A,	%g2
	movrne	%i5,	%i2,	%o7
loop_3011:
	movvc	%xcc,	%l3,	%i4
	call	loop_3012
	std	%f14,	[%l7 + 0x40]
	addcc	%i1,	0x05FC,	%l5
	set	0x54, %l0
	sta	%f20,	[%l7 + %l0] 0x11
loop_3012:
	edge8l	%i7,	%g4,	%o1
	movl	%xcc,	%g1,	%o5
	movrlz	%l4,	%o3,	%g5
	and	%l1,	0x05C6,	%i6
	edge32ln	%o6,	%i3,	%g7
	tgu	%icc,	0x4
	orncc	%o2,	%l6,	%l0
	nop
	setx	0x452BDD82207D8DED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	nop
	setx	0x6B90B55E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xE7EA6519,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f12,	%f21
	fmovdneg	%icc,	%f15,	%f31
	movg	%icc,	%o0,	%g3
	taddcctv	%g6,	0x0F0B,	%i0
	nop
	fitos	%f5,	%f8
	fstox	%f8,	%f16
	movcs	%xcc,	%l2,	%o4
	call	loop_3013
	brgez	%g2,	loop_3014
	bgu,pt	%xcc,	loop_3015
	orn	%i5,	0x1180,	%i2
loop_3013:
	tcc	%xcc,	0x1
loop_3014:
	brlez	%o7,	loop_3016
loop_3015:
	tsubcctv	%i4,	0x184C,	%l3
	movrlez	%i1,	%l5,	%i7
	tg	%icc,	0x7
loop_3016:
	fbug	%fcc1,	loop_3017
	tleu	%icc,	0x4
	tge	%xcc,	0x5
	edge32l	%o1,	%g1,	%g4
loop_3017:
	movpos	%xcc,	%o5,	%o3
	edge16l	%l4,	%l1,	%i6
	fbe,a	%fcc0,	loop_3018
	orcc	%o6,	%g5,	%i3
	mulx	%g7,	%o2,	%l6
	nop
	setx	0x6245CA681047CCD3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_3018:
	nop
	set	0x7F, %l6
	ldstuba	[%l7 + %l6] 0x80,	%o0
	tgu	%xcc,	0x7
	movcc	%xcc,	%l0,	%g6
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x18] %asi,	%f16
	xnorcc	%g3,	%i0,	%o4
	fpsub32s	%f9,	%f16,	%f8
	nop
	fitod	%f9,	%f4
	wr	%g0,	0x18,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l2
	tsubcctv	%i5,	0x07FA,	%i2
	edge32ln	%g2,	%o7,	%l3
	tsubcc	%i4,	0x1EEC,	%l5
	edge8	%i7,	%i1,	%o1
	ldsw	[%l7 + 0x18],	%g1
	edge8l	%g4,	%o3,	%o5
	subcc	%l1,	0x138C,	%l4
	fandnot1s	%f20,	%f7,	%f27
	bneg,pn	%xcc,	loop_3019
	tleu	%icc,	0x0
	edge8	%o6,	%g5,	%i6
	fmovrdlz	%g7,	%f30,	%f16
loop_3019:
	nop
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x18] %asi,	 0x1
	sdivcc	%l6,	0x0BDA,	%o2
	edge8	%o0,	%l0,	%g3
	movge	%icc,	%g6,	%i0
	sll	%l2,	0x03,	%o4
	fpadd32	%f30,	%f16,	%f26
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x30] %asi,	%i5
	nop
	fitos	%f12,	%f2
	fstoi	%f2,	%f11
	fbug	%fcc3,	loop_3020
	movvc	%xcc,	%i2,	%g2
	subccc	%l3,	%i4,	%l5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x74] %asi,	%o7
loop_3020:
	nop
	fitos	%f9,	%f24
	fstoi	%f24,	%f30
	tn	%xcc,	0x0
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x0E] %asi,	%i7
	alignaddr	%o1,	%i1,	%g1
	sra	%g4,	%o3,	%l1
	movrgz	%l4,	0x161,	%o6
	fandnot2s	%f18,	%f31,	%f16
	ta	%icc,	0x2
	wr	%g0,	0x88,	%asi
	stxa	%o5,	[%l7 + 0x18] %asi
	edge8	%g5,	%g7,	%i3
	tgu	%xcc,	0x2
	udiv	%l6,	0x0F83,	%i6
	bg,a,pt	%icc,	loop_3021
	nop
	setx loop_3022, %l0, %l1
	jmpl %l1, %o2
	mulscc	%l0,	0x13B6,	%o0
	call	loop_3023
loop_3021:
	mulx	%g3,	%g6,	%l2
loop_3022:
	ldd	[%l7 + 0x50],	%o4
	tleu	%icc,	0x6
loop_3023:
	bn,a	%xcc,	loop_3024
	tne	%icc,	0x5
	movrgez	%i0,	%i2,	%g2
	mulx	%l3,	%i5,	%i4
loop_3024:
	sllx	%l5,	%i7,	%o7
	movrgz	%i1,	%g1,	%g4
	sub	%o1,	%o3,	%l1
	edge8l	%o6,	%o5,	%l4
	fands	%f14,	%f10,	%f5
	popc	0x1A42,	%g5
	andn	%g7,	0x1CB9,	%i3
	set	0x50, %l3
	ldsha	[%l7 + %l3] 0x18,	%i6
	bn	loop_3025
	add	%l6,	0x0679,	%l0
	ta	%icc,	0x5
	fnegs	%f14,	%f8
loop_3025:
	addcc	%o2,	0x1266,	%o0
	tl	%icc,	0x2
	fbug,a	%fcc2,	loop_3026
	subcc	%g3,	0x1EFC,	%g6
	fbug,a	%fcc3,	loop_3027
	edge8	%l2,	%o4,	%i0
loop_3026:
	fmovsvs	%xcc,	%f20,	%f8
	movg	%xcc,	%i2,	%g2
loop_3027:
	alignaddr	%i5,	%i4,	%l3
	fabss	%f30,	%f11
	array32	%i7,	%o7,	%l5
	subc	%g1,	%i1,	%g4
	fornot2	%f16,	%f24,	%f6
	movleu	%xcc,	%o1,	%o3
	set	0x7E, %o1
	ldsha	[%l7 + %o1] 0x18,	%o6
	tsubcc	%l1,	%l4,	%g5
	addc	%g7,	%o5,	%i6
	xor	%i3,	%l0,	%l6
	fba	%fcc0,	loop_3028
	tge	%xcc,	0x1
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x39] %asi,	%o0
loop_3028:
	xnor	%g3,	0x050D,	%g6
	bcs,pn	%xcc,	loop_3029
	alignaddrl	%o2,	%l2,	%o4
	movn	%icc,	%i0,	%i2
	sub	%i5,	%i4,	%g2
loop_3029:
	taddcctv	%l3,	0x105D,	%i7
	flush	%l7 + 0x48
	edge16n	%l5,	%o7,	%i1
	movvs	%icc,	%g4,	%o1
	fblg,a	%fcc1,	loop_3030
	tsubcc	%g1,	0x0531,	%o3
	ldstub	[%l7 + 0x4B],	%l1
	fbn	%fcc2,	loop_3031
loop_3030:
	fmovdn	%icc,	%f17,	%f10
	move	%icc,	%l4,	%o6
	ble,a	%icc,	loop_3032
loop_3031:
	call	loop_3033
	movrgz	%g5,	%o5,	%i6
	edge8	%g7,	%l0,	%l6
loop_3032:
	mulx	%i3,	%g3,	%g6
loop_3033:
	xor	%o0,	%o2,	%o4
	tle	%xcc,	0x1
	srlx	%i0,	0x0C,	%l2
	movgu	%xcc,	%i5,	%i2
	sdivcc	%g2,	0x0382,	%l3
	fxnors	%f13,	%f15,	%f0
	sllx	%i7,	0x13,	%i4
	fmovde	%icc,	%f13,	%f10
	fmovsgu	%icc,	%f31,	%f10
	movl	%xcc,	%o7,	%l5
	edge16	%i1,	%o1,	%g1
	fnot2s	%f10,	%f19
	fsrc2	%f24,	%f20
	srlx	%g4,	0x08,	%l1
	array16	%o3,	%l4,	%o6
	tvc	%icc,	0x2
	fblg	%fcc3,	loop_3034
	and	%g5,	0x010D,	%o5
	fnot2s	%f28,	%f25
	fcmpgt16	%f6,	%f14,	%i6
loop_3034:
	tg	%xcc,	0x1
	fcmpne16	%f14,	%f22,	%l0
	subc	%g7,	%i3,	%g3
	tl	%icc,	0x3
	fpsub32	%f24,	%f30,	%f8
	orn	%g6,	%l6,	%o0
	taddcc	%o2,	0x0037,	%o4
	taddcctv	%l2,	0x1104,	%i0
	umulcc	%i5,	0x0796,	%g2
	fnand	%f10,	%f2,	%f22
	movneg	%icc,	%l3,	%i2
	fpsub16	%f6,	%f14,	%f6
	ldx	[%l7 + 0x78],	%i4
	sra	%o7,	%l5,	%i7
	fbue	%fcc2,	loop_3035
	bne,pt	%icc,	loop_3036
	movleu	%icc,	%o1,	%i1
	set	0x24, %i3
	sta	%f16,	[%l7 + %i3] 0x14
loop_3035:
	xnor	%g1,	0x1E54,	%l1
loop_3036:
	fmovdle	%xcc,	%f16,	%f23
	fmovspos	%icc,	%f12,	%f24
	membar	0x71
	bcs,a	%icc,	loop_3037
	bvc,a,pt	%icc,	loop_3038
	movrne	%o3,	%l4,	%o6
	alignaddrl	%g4,	%g5,	%o5
loop_3037:
	fmovsg	%icc,	%f26,	%f6
loop_3038:
	tcs	%xcc,	0x7
	nop
	setx loop_3039, %l0, %l1
	jmpl %l1, %l0
	fbule,a	%fcc0,	loop_3040
	add	%g7,	0x1AB9,	%i6
	fbn	%fcc0,	loop_3041
loop_3039:
	addcc	%g3,	%g6,	%i3
loop_3040:
	fbg	%fcc2,	loop_3042
	fmovdleu	%icc,	%f18,	%f20
loop_3041:
	nop
	fitos	%f4,	%f23
	fstoi	%f23,	%f12
	movvc	%icc,	%o0,	%l6
loop_3042:
	edge32	%o2,	%l2,	%i0
	edge8	%o4,	%i5,	%l3
	edge8	%i2,	%g2,	%i4
	add	%l7,	0x64,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] %asi,	%o7,	%l5
	brgz,a	%i7,	loop_3043
	tpos	%xcc,	0x7
	subccc	%i1,	0x193E,	%g1
	tcc	%icc,	0x5
loop_3043:
	nop
	setx	loop_3044,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%xcc,	%o1,	%o3
	fmovdne	%icc,	%f25,	%f10
	fxors	%f9,	%f12,	%f9
loop_3044:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x6
	tne	%icc,	0x7
	movrne	%l1,	0x354,	%l4
	stx	%g4,	[%l7 + 0x18]
	tg	%xcc,	0x1
	and	%g5,	0x0D0D,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tge	%xcc,	0x4
	orncc	%o5,	%l0,	%g7
	stx	%i6,	[%l7 + 0x10]
	fnands	%f0,	%f29,	%f1
	sethi	0x1F38,	%g3
	sdiv	%g6,	0x0BDA,	%i3
	set	0x5A, %i7
	stha	%o0,	[%l7 + %i7] 0x11
	movvc	%xcc,	%o2,	%l6
	umulcc	%l2,	%i0,	%o4
	set	0x14, %o3
	stwa	%l3,	[%l7 + %o3] 0xe3
	membar	#Sync
	tneg	%icc,	0x3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x1
	fpsub16	%f2,	%f22,	%f24
	fnegs	%f8,	%f17
	set	0x74, %o0
	sta	%f20,	[%l7 + %o0] 0x80
	orcc	%g2,	%i5,	%i4
	edge8l	%l5,	%o7,	%i1
	fmovdl	%icc,	%f12,	%f12
	fmovrsgz	%g1,	%f17,	%f0
	subcc	%i7,	0x17B4,	%o1
	andn	%o3,	0x0A34,	%l4
	nop
	setx	0x605C9C79,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	fnot1	%f10,	%f26
	bne,a,pn	%icc,	loop_3045
	fmovsn	%xcc,	%f2,	%f26
	edge32l	%g4,	%l1,	%g5
	edge32l	%o5,	%l0,	%g7
loop_3045:
	fmovrslz	%i6,	%f15,	%f18
	sethi	0x01DB,	%g3
	addccc	%o6,	%g6,	%i3
	nop
	setx	0x79E2240940508E97,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fblg	%fcc2,	loop_3046
	fandnot2	%f2,	%f26,	%f8
	tvc	%icc,	0x3
	sdivx	%o0,	0x111F,	%l6
loop_3046:
	bpos,a	%xcc,	loop_3047
	movgu	%icc,	%o2,	%l2
	fbne	%fcc3,	loop_3048
	stb	%o4,	[%l7 + 0x15]
loop_3047:
	movleu	%icc,	%l3,	%i2
	set	0x68, %i1
	lduwa	[%l7 + %i1] 0x0c,	%i0
loop_3048:
	bvc,a	loop_3049
	faligndata	%f22,	%f6,	%f12
	fcmpne32	%f18,	%f16,	%g2
	tge	%icc,	0x1
loop_3049:
	sdiv	%i4,	0x1743,	%i5
	brz	%o7,	loop_3050
	movneg	%icc,	%i1,	%l5
	fmul8x16	%f1,	%f14,	%f26
	brz	%g1,	loop_3051
loop_3050:
	fbl	%fcc0,	loop_3052
	fpadd16s	%f1,	%f18,	%f8
	tne	%icc,	0x2
loop_3051:
	movvs	%icc,	%i7,	%o3
loop_3052:
	be,pt	%xcc,	loop_3053
	array32	%l4,	%g4,	%l1
	addccc	%o1,	0x1639,	%o5
	fbu	%fcc3,	loop_3054
loop_3053:
	ldsb	[%l7 + 0x15],	%l0
	std	%f8,	[%l7 + 0x10]
	sdivcc	%g7,	0x07A9,	%i6
loop_3054:
	bne	loop_3055
	sra	%g5,	0x11,	%o6
	tle	%xcc,	0x1
	fbuge,a	%fcc2,	loop_3056
loop_3055:
	movge	%icc,	%g6,	%g3
	popc	%o0,	%l6
	fmovsneg	%xcc,	%f30,	%f6
loop_3056:
	umul	%o2,	%i3,	%l2
	fmovdleu	%xcc,	%f12,	%f11
	bgu,a	%xcc,	loop_3057
	membar	0x23
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o4
loop_3057:
	movneg	%icc,	%i2,	%i0
	bvs	%xcc,	loop_3058
	orcc	%g2,	%i4,	%l3
	faligndata	%f18,	%f30,	%f30
	be,a,pn	%xcc,	loop_3059
loop_3058:
	udiv	%i5,	0x162E,	%i1
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x63] %asi,	%l5
loop_3059:
	nop
	set	0x41, %l4
	stb	%o7,	[%l7 + %l4]
	edge16	%g1,	%i7,	%l4
	orcc	%g4,	%l1,	%o1
	movn	%xcc,	%o5,	%l0
	edge32n	%g7,	%i6,	%o3
	srl	%o6,	%g5,	%g6
	alignaddrl	%g3,	%o0,	%l6
	srl	%i3,	%o2,	%l2
	sdiv	%o4,	0x13F0,	%i2
	set	0x68, %i5
	ldswa	[%l7 + %i5] 0x88,	%i0
	fmovrse	%g2,	%f15,	%f31
	fandnot1s	%f19,	%f19,	%f11
	smul	%i4,	0x096C,	%i5
	edge8l	%i1,	%l3,	%o7
	movneg	%icc,	%l5,	%g1
	movgu	%xcc,	%l4,	%g4
	tcc	%icc,	0x6
	nop
	set	0x0B, %g3
	ldub	[%l7 + %g3],	%i7
	andcc	%o1,	%o5,	%l0
	edge32	%l1,	%g7,	%i6
	fcmpeq16	%f20,	%f6,	%o3
	fmovde	%icc,	%f11,	%f17
	tleu	%icc,	0x5
	set	0x0C, %l2
	lduwa	[%l7 + %l2] 0x19,	%g5
	udiv	%o6,	0x08DA,	%g6
	ldstub	[%l7 + 0x0A],	%g3
	array32	%o0,	%i3,	%l6
	fmovs	%f27,	%f24
	edge32l	%l2,	%o2,	%o4
	xorcc	%i0,	0x176B,	%i2
	fbu	%fcc1,	loop_3060
	movle	%xcc,	%i4,	%g2
	membar	0x0F
	fba,a	%fcc0,	loop_3061
loop_3060:
	tpos	%icc,	0x2
	array8	%i5,	%l3,	%o7
	fmovdneg	%xcc,	%f5,	%f22
loop_3061:
	flush	%l7 + 0x60
	movneg	%xcc,	%l5,	%i1
	membar	#Sync
	set	0x40, %i2
	ldda	[%l7 + %i2] 0xf9,	%f16
	ld	[%l7 + 0x48],	%f9
	sethi	0x12F7,	%g1
	fxor	%f12,	%f4,	%f14
	be,a,pn	%xcc,	loop_3062
	nop
	setx	0xE94616470074A2BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	movrgz	%l4,	%g4,	%i7
	st	%f1,	[%l7 + 0x34]
loop_3062:
	tleu	%xcc,	0x3
	nop
	setx	0xD4DDD4058C3BA92F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x99A8366065E65FF4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f2,	%f14
	tcc	%icc,	0x4
	movrne	%o5,	0x3C0,	%l0
	movg	%icc,	%l1,	%o1
	set	0x28, %i0
	ldxa	[%l7 + %i0] 0x81,	%g7
	add	%i6,	0x0B41,	%o3
	alignaddr	%o6,	%g5,	%g3
	edge16	%g6,	%i3,	%o0
	movvs	%xcc,	%l6,	%o2
	add	%l7,	0x14,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%i0
	fmovdleu	%xcc,	%f24,	%f29
	movne	%xcc,	%i2,	%l2
	umulcc	%i4,	0x053D,	%g2
	tsubcctv	%i5,	0x1AF7,	%l3
	movcs	%xcc,	%o7,	%i1
	tgu	%xcc,	0x6
	brgez,a	%g1,	loop_3063
	fzero	%f28
	edge8	%l4,	%g4,	%l5
	udivx	%i7,	0x0457,	%o5
loop_3063:
	taddcctv	%l0,	0x0E74,	%o1
	tge	%icc,	0x6
	brz	%l1,	loop_3064
	orncc	%i6,	0x1E6C,	%g7
	movcs	%xcc,	%o3,	%g5
	movneg	%icc,	%o6,	%g6
loop_3064:
	fmovdneg	%xcc,	%f20,	%f16
	brnz	%g3,	loop_3065
	nop
	setx	loop_3066,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ld	[%l7 + 0x44],	%f5
	prefetch	[%l7 + 0x64],	 0x2
loop_3065:
	tl	%xcc,	0x6
loop_3066:
	nop
	wr	%g0,	0x2a,	%asi
	ldda	[%l7 + 0x70] %asi,	%i2
	fandnot2s	%f10,	%f2,	%f3
	sra	%l6,	0x1E,	%o2
	stbar
	fmovsl	%xcc,	%f3,	%f13
	tg	%icc,	0x0
	udivx	%o0,	0x16AC,	%o4
	sdivx	%i2,	0x1E79,	%l2
	nop
	setx	0x206D4060,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	nop
	fitod	%f4,	%f26
	fdtoi	%f26,	%f11
	fmovsvc	%xcc,	%f23,	%f28
	subc	%i0,	0x1540,	%g2
	nop
	setx loop_3067, %l0, %l1
	jmpl %l1, %i4
	nop
	setx	loop_3068,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%l3,	%i5,	%o7
	bshuffle	%f8,	%f8,	%f6
loop_3067:
	movleu	%icc,	%i1,	%l4
loop_3068:
	nop
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x27,	%g0
	movg	%icc,	%g4,	%l5
	sdivx	%o5,	0x0EE1,	%l0
	wr	%g0,	0x11,	%asi
	stba	%i7,	[%l7 + 0x79] %asi
	tpos	%icc,	0x7
	alignaddrl	%l1,	%i6,	%g7
	edge8	%o1,	%g5,	%o6
	fmovdvs	%icc,	%f29,	%f31
	te	%xcc,	0x7
	or	%o3,	0x0457,	%g6
	tvs	%icc,	0x3
	smulcc	%i3,	%g3,	%l6
	tg	%icc,	0x3
	movle	%xcc,	%o0,	%o4
	tle	%xcc,	0x5
	orcc	%i2,	0x180B,	%o2
	tne	%xcc,	0x3
	sir	0x0FA2
	nop
	setx	0xF35E9413D14C9E79,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x2E5CBE6DB139C3F9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f14,	%f28
	movl	%xcc,	%i0,	%g2
	fbg,a	%fcc3,	loop_3069
	popc	%i4,	%l2
	fpsub32s	%f12,	%f13,	%f14
	smulcc	%l3,	0x038C,	%i5
loop_3069:
	ldstub	[%l7 + 0x2F],	%o7
	wr	%g0,	0xf9,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	andcc	%l4,	%g1,	%i1
	brgez,a	%l5,	loop_3070
	fbuge	%fcc3,	loop_3071
	fones	%f16
	fmovrslz	%g4,	%f30,	%f8
loop_3070:
	movgu	%xcc,	%o5,	%l0
loop_3071:
	tneg	%xcc,	0x2
	membar	0x32
	tle	%xcc,	0x7
	subcc	%i7,	%l1,	%i6
	fpackfix	%f4,	%f19
	xor	%g7,	%g5,	%o6
	subcc	%o3,	%g6,	%i3
	nop
	setx loop_3072, %l0, %l1
	jmpl %l1, %o1
	ldsh	[%l7 + 0x54],	%g3
	membar	0x76
	brz,a	%o0,	loop_3073
loop_3072:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f10,	%f8
	sdivx	%o4,	0x032F,	%l6
loop_3073:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f22
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x10,	%f0
	tcs	%icc,	0x0
	add	%i2,	0x0CC1,	%i0
	add	%g2,	0x0E45,	%i4
	std	%f22,	[%l7 + 0x40]
	sir	0x153C
	movpos	%icc,	%l2,	%l3
	tvc	%xcc,	0x7
	bpos,a	loop_3074
	udivcc	%i5,	0x0BB8,	%o7
	std	%f16,	[%l7 + 0x60]
	stx	%l4,	[%l7 + 0x50]
loop_3074:
	fcmpeq16	%f28,	%f4,	%o2
	addc	%i1,	0x0E02,	%l5
	edge16ln	%g1,	%o5,	%l0
	movvc	%xcc,	%g4,	%i7
	fbu,a	%fcc0,	loop_3075
	fmovdge	%xcc,	%f13,	%f28
	movrgez	%l1,	0x2AE,	%i6
	sub	%g7,	%o6,	%o3
loop_3075:
	and	%g5,	0x1B57,	%g6
	sdiv	%o1,	0x1407,	%i3
	movcs	%icc,	%o0,	%o4
	stw	%l6,	[%l7 + 0x78]
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldd	[%l7 + 0x48],	%f14
	fbule,a	%fcc2,	loop_3076
	alignaddr	%i2,	%g3,	%g2
	mulx	%i4,	0x128A,	%i0
	mulx	%l3,	0x1C34,	%i5
loop_3076:
	tcs	%xcc,	0x0
	edge8n	%o7,	%l4,	%l2
	fcmpeq16	%f18,	%f14,	%i1
	orcc	%l5,	0x079A,	%g1
	movneg	%xcc,	%o5,	%o2
	bpos,pt	%xcc,	loop_3077
	ta	%xcc,	0x1
	nop
	fitod	%f13,	%f20
	fmuld8sux16	%f1,	%f1,	%f10
loop_3077:
	movle	%icc,	%l0,	%i7
	bleu,a	%icc,	loop_3078
	array32	%g4,	%i6,	%l1
	membar	0x13
	sllx	%g7,	0x01,	%o3
loop_3078:
	swap	[%l7 + 0x14],	%o6
	fmovrse	%g5,	%f11,	%f0
	fmovspos	%icc,	%f26,	%f16
	movrgz	%g6,	0x3E0,	%o1
	movrne	%i3,	%o4,	%o0
	fbule	%fcc0,	loop_3079
	umul	%i2,	0x04DB,	%g3
	edge32	%l6,	%g2,	%i4
	edge32ln	%l3,	%i0,	%o7
loop_3079:
	nop
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x14,	%i4
	wr	%g0,	0x89,	%asi
	stha	%l4,	[%l7 + 0x50] %asi
	tleu	%xcc,	0x4
	tpos	%icc,	0x5
	tsubcctv	%i1,	0x0F01,	%l5
	edge32	%l2,	%g1,	%o5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] 0x18,	%o2,	%l0
	fxor	%f30,	%f20,	%f4
	edge32	%g4,	%i6,	%l1
	edge8ln	%i7,	%g7,	%o6
	nop
	fitod	%f9,	%f14
	fmovdne	%icc,	%f8,	%f6
	tpos	%xcc,	0x6
	fnot2s	%f3,	%f4
	andncc	%o3,	%g5,	%o1
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g6,	%o4
	stbar
	fors	%f8,	%f11,	%f25
	edge16	%i3,	%i2,	%o0
	fmovdcs	%xcc,	%f25,	%f28
	orcc	%l6,	%g3,	%g2
	nop
	setx	loop_3080,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%l3,	0x157A,	%i0
	subccc	%i4,	0x0CE5,	%i5
	array16	%l4,	%o7,	%l5
loop_3080:
	movleu	%xcc,	%l2,	%i1
	fcmpeq16	%f14,	%f20,	%o5
	bne,pn	%icc,	loop_3081
	movre	%o2,	%l0,	%g1
	movne	%icc,	%g4,	%l1
	bge,pt	%xcc,	loop_3082
loop_3081:
	nop
	setx	0x1CEAF4492D1FBF94,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	fsqrtd	%f28,	%f16
	alignaddrl	%i7,	%g7,	%i6
	mulx	%o6,	%o3,	%g5
loop_3082:
	edge8n	%g6,	%o4,	%i3
	st	%f9,	[%l7 + 0x0C]
	addccc	%i2,	%o1,	%l6
	edge32ln	%o0,	%g3,	%g2
	bshuffle	%f8,	%f18,	%f2
	fblg	%fcc3,	loop_3083
	fble,a	%fcc3,	loop_3084
	fmovdne	%icc,	%f23,	%f3
	movrne	%i0,	%i4,	%i5
loop_3083:
	fmovdcs	%xcc,	%f21,	%f21
loop_3084:
	nop
	set	0x5C, %g2
	ldsb	[%l7 + %g2],	%l4
	array8	%l3,	%o7,	%l2
	fand	%f28,	%f6,	%f22
	move	%icc,	%l5,	%i1
	wr	%g0,	0x04,	%asi
	sta	%f13,	[%l7 + 0x5C] %asi
	movneg	%xcc,	%o5,	%o2
	fpsub32s	%f4,	%f29,	%f8
	srl	%g1,	0x06,	%l0
	fmovdle	%icc,	%f18,	%f5
	set	0x20, %i6
	sta	%f24,	[%l7 + %i6] 0x88
	udivx	%g4,	0x0E4A,	%l1
	sdivx	%g7,	0x0E57,	%i7
	fandnot1s	%f23,	%f26,	%f28
	addccc	%i6,	%o3,	%g5
	brnz,a	%g6,	loop_3085
	add	%o6,	0x0C57,	%o4
	srl	%i2,	0x1E,	%i3
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x24] %asi,	%f27
loop_3085:
	add	%o1,	0x1DE0,	%o0
	set	0x40, %o5
	ldsba	[%l7 + %o5] 0x0c,	%l6
	fandnot1s	%f27,	%f14,	%f4
	smulcc	%g2,	%g3,	%i4
	brgez,a	%i0,	loop_3086
	fmuld8sux16	%f1,	%f17,	%f0
	movrne	%i5,	0x125,	%l4
	mulscc	%l3,	%o7,	%l2
loop_3086:
	add	%i1,	0x136E,	%o5
	fnot2	%f6,	%f10
	edge8l	%o2,	%l5,	%g1
	tvc	%xcc,	0x0
	movge	%icc,	%g4,	%l1
	nop
	setx	0xCED9C4D6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x9677D282,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fmuls	%f5,	%f7,	%f30
	ta	%icc,	0x6
	be,a	%xcc,	loop_3087
	sdivx	%l0,	0x1C35,	%i7
	stw	%g7,	[%l7 + 0x6C]
	umulcc	%i6,	%g5,	%g6
loop_3087:
	array32	%o6,	%o4,	%i2
	alignaddrl	%i3,	%o3,	%o1
	tpos	%icc,	0x5
	fbule,a	%fcc1,	loop_3088
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o0,	0x0E60,	%g2
	edge32l	%l6,	%i4,	%g3
loop_3088:
	fcmpeq16	%f2,	%f28,	%i5
	tpos	%icc,	0x3
	bleu,pn	%icc,	loop_3089
	fblg	%fcc2,	loop_3090
	umul	%l4,	0x0F83,	%l3
	tpos	%xcc,	0x0
loop_3089:
	nop

loop_3090:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2769
!	Type x   	: 1234
!	Type cti   	: 3090
!	Type f   	: 4526
!	Type i   	: 13381
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x3738B4E6
.word 0x61616E0C
.word 0x7922DFC9
.word 0xD2EEB168
.word 0xA592E988
.word 0x94422085
.word 0x9E005F64
.word 0xDBF5F173
.word 0x343DF0B5
.word 0xCCD058B3
.word 0x7DE1E3E4
.word 0xD54FA81F
.word 0x13590A6C
.word 0xBE165628
.word 0x652A2885
.word 0x247B1682
.word 0x7E252B19
.word 0xF0B6DEE3
.word 0x6E21C258
.word 0x9D841830
.word 0x7E344D82
.word 0x0F1948EB
.word 0x363DFAB6
.word 0x2E6CFFF1
.word 0x988B27DA
.word 0x918857DF
.word 0xEC42BD6F
.word 0x34579EBE
.word 0x2D1EED4A
.word 0x57D0E4BC
.word 0x75D431BE
.word 0x60DBB738
.word 0xB7F182EB
.word 0x7B7B7F4C
.word 0x8EA57323
.word 0x013DB705
.word 0x8E07F054
.word 0x7F111164
.word 0x276A1226
.word 0x831F85C8
.word 0xB784A151
.word 0xE3C39C1F
.word 0xCC3AF645
.word 0xA8D56D32
.word 0x1E0D6F72
.word 0x1C113CB1
.word 0xD2E5E76A
.word 0x1C6FEBA1
.word 0xFA935A3F
.word 0x0FE947E1
.word 0x97328B20
.word 0xFB0CFDA9
.word 0xAB81A7BC
.word 0xC8DB369D
.word 0x2D8DAC7D
.word 0xBB5BDB32
.word 0x6A4A0B95
.word 0x0450CBCD
.word 0x024B008C
.word 0x19670F9B
.word 0x99EFE9F3
.word 0x0261F6F9
.word 0x9DCEA43B
.word 0xC0A67238
.end
