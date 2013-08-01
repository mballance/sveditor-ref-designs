/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_fsr3_f11.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_fsr3_f11.s,v 1.1 2007/05/11 17:22:26 drp Exp $"
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
	setx	0xF28E02F0C04932CF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xF,	%g1
	set	0x2,	%g2
	set	0xE,	%g3
	set	0x2,	%g4
	set	0xF,	%g5
	set	0xB,	%g6
	set	0x3,	%g7
	!# Input registers
	set	-0xE,	%i0
	set	-0x1,	%i1
	set	-0x2,	%i2
	set	-0xA,	%i3
	set	-0x4,	%i4
	set	-0xF,	%i5
	set	-0xB,	%i6
	set	-0x2,	%i7
	!# Local registers
	set	0x2878267D,	%l0
	set	0x06860CB1,	%l1
	set	0x119EBBA6,	%l2
	set	0x4BE9A32E,	%l3
	set	0x0542A5C6,	%l4
	set	0x01198236,	%l5
	set	0x13208002,	%l6
	!# Output registers
	set	-0x180E,	%o0
	set	-0x07E7,	%o1
	set	-0x173E,	%o2
	set	0x082A,	%o3
	set	-0x1411,	%o4
	set	0x0DBC,	%o5
	set	-0x0D97,	%o6
	set	-0x11F7,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xE03F4F9A604C943F)
	INIT_TH_FP_REG(%l7,%f2,0x3514BFAA5CE5FE7E)
	INIT_TH_FP_REG(%l7,%f4,0x29A7103CA79F307B)
	INIT_TH_FP_REG(%l7,%f6,0x46C8D617D0C42C86)
	INIT_TH_FP_REG(%l7,%f8,0xCFB4C615D0959704)
	INIT_TH_FP_REG(%l7,%f10,0x93D681E71DE11052)
	INIT_TH_FP_REG(%l7,%f12,0x8B3347029D60AB4F)
	INIT_TH_FP_REG(%l7,%f14,0xF64D39AC46945828)
	INIT_TH_FP_REG(%l7,%f16,0x8A8B5AE936C90337)
	INIT_TH_FP_REG(%l7,%f18,0xFDF8C859138C4151)
	INIT_TH_FP_REG(%l7,%f20,0xD4A653F5C0EB3987)
	INIT_TH_FP_REG(%l7,%f22,0xB4B5BAE525E9866D)
	INIT_TH_FP_REG(%l7,%f24,0x8852C1C479F7DA9C)
	INIT_TH_FP_REG(%l7,%f26,0xDD9CB11A9218A1F2)
	INIT_TH_FP_REG(%l7,%f28,0x4778FCB336387FE6)
	INIT_TH_FP_REG(%l7,%f30,0x692CCF10CE006395)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xE61, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fbo,a	%fcc3,	loop_1
	add	%o3,	0x12EC,	%i2
	array8	%g4,	%g5,	%g6
	sdivcc	%i6,	0x1129,	%l2
loop_1:
	fmovse	%icc,	%f3,	%f4
	fble,a	%fcc3,	loop_2
	tn	%icc,	0x1
	alignaddrl	%o4,	%l6,	%o5
	sdivx	%g2,	0x0B55,	%l5
loop_2:
	fabss	%f22,	%f19
	fands	%f8,	%f4,	%f31
	srax	%i0,	0x10,	%o7
	lduh	[%l7 + 0x76],	%o1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x50] %asi,	%f2
	fmovdvc	%xcc,	%f4,	%f31
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,pt	%icc,	loop_3
	smulcc	%i3,	%g7,	%i1
	sdiv	%l4,	0x0B84,	%o6
	fpsub16	%f12,	%f0,	%f14
loop_3:
	tvc	%xcc,	0x2
	bneg,pt	%xcc,	loop_4
	bvc,a,pn	%xcc,	loop_5
	tvs	%xcc,	0x0
	tvc	%icc,	0x0
loop_4:
	umul	%o2,	%l0,	%g1
loop_5:
	tl	%icc,	0x5
	srax	%g3,	0x18,	%l3
	nop
	setx	0xEEA6B19EDE6E5419,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x22600AAA1C07147F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f28,	%f22
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o0
	xnor	%i4,	0x082B,	%i7
	set	0x3B, %l0
	lduba	[%l7 + %l0] 0x10,	%o3
	add	%l1,	0x0789,	%g4
	te	%xcc,	0x7
	alignaddr	%i2,	%g6,	%g5
	fpack16	%f26,	%f17
	umulcc	%l2,	%o4,	%l6
	nop
	setx	0x1B9D34044050A3F8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	nop
	setx	0xB730CAF4FEB94AE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	fsqrtd	%f22,	%f20
	alignaddr	%i6,	%o5,	%l5
	wr	%g0,	0xea,	%asi
	stba	%i0,	[%l7 + 0x44] %asi
	membar	#Sync
	sdiv	%o7,	0x0680,	%o1
	orncc	%i5,	%g2,	%i3
	fbul,a	%fcc1,	loop_6
	addc	%i1,	0x0018,	%g7
	fmovdl	%xcc,	%f29,	%f23
	subc	%l4,	0x1902,	%o2
loop_6:
	nop
	setx	0xD0705CE4,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	fmovscs	%xcc,	%f21,	%f2
	ble,pn	%icc,	loop_7
	orn	%o6,	0x1C3F,	%g1
	fbul	%fcc3,	loop_8
	taddcctv	%g3,	%l3,	%o0
loop_7:
	swap	[%l7 + 0x08],	%i4
	movrgz	%i7,	0x365,	%l0
loop_8:
	fpadd16	%f0,	%f4,	%f8
	fble	%fcc3,	loop_9
	or	%l1,	0x1D19,	%o3
	fbn	%fcc2,	loop_10
	nop
	fitos	%f11,	%f31
	fstox	%f31,	%f16
loop_9:
	fpmerge	%f18,	%f31,	%f16
	bleu,a,pt	%icc,	loop_11
loop_10:
	movrlez	%i2,	0x0D1,	%g4
	edge16ln	%g5,	%l2,	%o4
	membar	0x13
loop_11:
	edge16	%g6,	%l6,	%i6
	bcc,pn	%xcc,	loop_12
	fcmple16	%f10,	%f12,	%l5
	fornot2	%f28,	%f8,	%f18
	tleu	%icc,	0x6
loop_12:
	faligndata	%f28,	%f20,	%f12
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x28] %asi,	%i0
	movrlez	%o5,	%o1,	%o7
	popc	0x096F,	%i5
	orn	%i3,	0x10B0,	%g2
	fbge,a	%fcc1,	loop_13
	fbue	%fcc0,	loop_14
	fbge,a	%fcc3,	loop_15
	mova	%icc,	%g7,	%l4
loop_13:
	tg	%xcc,	0x7
loop_14:
	fmovsn	%xcc,	%f31,	%f22
loop_15:
	tsubcc	%i1,	0x1421,	%o6
	bn,pn	%xcc,	loop_16
	popc	0x1357,	%o2
	fors	%f20,	%f13,	%f6
	and	%g3,	0x0E60,	%l3
loop_16:
	fpsub16s	%f24,	%f22,	%f4
	smul	%g1,	0x0190,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1EAF,	%o0
	movgu	%icc,	%l0,	%i7
	movpos	%icc,	%l1,	%i2
	fmovsa	%xcc,	%f18,	%f24
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x2
	wr	%g0,	0x19,	%asi
	sta	%f25,	[%l7 + 0x54] %asi
	fbn	%fcc0,	loop_17
	movle	%icc,	%g5,	%l2
	array8	%o3,	%g6,	%o4
	taddcctv	%l6,	%l5,	%i0
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
	fbg,a	%fcc3,	loop_19
	tne	%xcc,	0x6
	tleu	%xcc,	0x2
loop_18:
	bpos,a,pt	%xcc,	loop_20
loop_19:
	udiv	%o5,	0x0D17,	%i6
	bcs,pn	%xcc,	loop_21
	sth	%o1,	[%l7 + 0x5E]
loop_20:
	fmovrdgez	%o7,	%f8,	%f0
	fxors	%f19,	%f27,	%f22
loop_21:
	edge16ln	%i5,	%i3,	%g2
	ba,a	loop_22
	fbge,a	%fcc1,	loop_23
	srl	%g7,	%l4,	%o6
	brnz,a	%o2,	loop_24
loop_22:
	udivx	%g3,	0x0C13,	%l3
loop_23:
	movneg	%xcc,	%i1,	%g1
	smul	%i4,	%l0,	%i7
loop_24:
	edge32l	%l1,	%i2,	%o0
	tcc	%xcc,	0x3
	nop
	fitos	%f10,	%f11
	fstox	%f11,	%f28
	fxtos	%f28,	%f22
	movn	%xcc,	%g5,	%g4
	brz	%o3,	loop_25
	movre	%l2,	%o4,	%g6
	fnands	%f3,	%f28,	%f22
	st	%f31,	[%l7 + 0x1C]
loop_25:
	movge	%icc,	%l6,	%i0
	nop
	setx	0x2812D84A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x3C01A8CF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f30,	%f30
	sdiv	%l5,	0x015E,	%i6
	fmovse	%icc,	%f6,	%f24
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x0C] %asi,	%o5
	alignaddr	%o7,	%i5,	%o1
	fmovrdgez	%i3,	%f0,	%f28
	movcs	%icc,	%g2,	%g7
	smulcc	%l4,	%o2,	%o6
	smul	%l3,	%g3,	%g1
	tcs	%icc,	0x1
	xorcc	%i4,	0x0155,	%i1
	array8	%i7,	%l1,	%i2
	movcs	%icc,	%l0,	%o0
	te	%icc,	0x3
	fpadd16	%f30,	%f22,	%f6
	movre	%g5,	0x3C8,	%g4
	edge8ln	%o3,	%o4,	%l2
	bcc,pt	%icc,	loop_26
	bge,a	loop_27
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x10, %l4
	ldx	[%l7 + %l4],	%l6
loop_26:
	tvc	%xcc,	0x5
loop_27:
	tsubcc	%g6,	0x0052,	%i0
	set	0x10, %i2
	ldxa	[%l7 + %i2] 0x04,	%i6
	tpos	%icc,	0x5
	ld	[%l7 + 0x44],	%f8
	tne	%xcc,	0x2
	set	0x30, %i6
	prefetcha	[%l7 + %i6] 0x89,	 0x2
	array8	%o5,	%o7,	%o1
	movvc	%xcc,	%i5,	%i3
	fbg,a	%fcc3,	loop_28
	tneg	%icc,	0x2
	fpadd16s	%f28,	%f29,	%f15
	sub	%g2,	0x039A,	%g7
loop_28:
	sethi	0x138B,	%o2
	movl	%xcc,	%l4,	%o6
	add	%l3,	%g1,	%i4
	nop
	fitos	%f28,	%f18
	edge8l	%g3,	%i7,	%i1
	fbe,a	%fcc1,	loop_29
	fblg,a	%fcc3,	loop_30
	bcc	%xcc,	loop_31
	orncc	%l1,	0x1045,	%l0
loop_29:
	subcc	%i2,	%o0,	%g4
loop_30:
	subccc	%o3,	%o4,	%l2
loop_31:
	xnorcc	%l6,	%g5,	%i0
	edge32ln	%i6,	%g6,	%l5
	fbue,a	%fcc2,	loop_32
	membar	0x20
	te	%xcc,	0x3
	fexpand	%f30,	%f0
loop_32:
	bg,pn	%xcc,	loop_33
	swap	[%l7 + 0x20],	%o7
	nop
	setx	0xE2949202A5E31397,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xEFC76F414B6958AD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fdivd	%f14,	%f2,	%f14
	fnot1s	%f18,	%f5
loop_33:
	be,a	loop_34
	fcmple16	%f22,	%f8,	%o1
	umulcc	%i5,	0x0488,	%i3
	tvc	%icc,	0x2
loop_34:
	fmovrsne	%g2,	%f19,	%f19
	mulx	%g7,	%o2,	%o5
	orncc	%l4,	%l3,	%o6
	taddcctv	%g1,	%g3,	%i4
	te	%xcc,	0x1
	sllx	%i1,	%i7,	%l0
	wr	%g0,	0xe3,	%asi
	stba	%i2,	[%l7 + 0x4E] %asi
	membar	#Sync
	tgu	%icc,	0x3
	tne	%icc,	0x2
	smul	%l1,	0x0AE0,	%o0
	xor	%g4,	%o3,	%o4
	flush	%l7 + 0x30
	edge32ln	%l2,	%g5,	%l6
	nop
	setx	0xF84B71E9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xDAF0B771,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fadds	%f18,	%f14,	%f6
	tne	%icc,	0x5
	smul	%i6,	0x18F7,	%g6
	edge32n	%l5,	%o7,	%i0
	andncc	%i5,	%i3,	%g2
	edge32ln	%o1,	%g7,	%o5
	alignaddrl	%l4,	%o2,	%o6
	movneg	%xcc,	%l3,	%g3
	srlx	%g1,	0x09,	%i1
	fmovd	%f24,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%xcc,	0x0
	fornot1s	%f21,	%f30,	%f17
	movneg	%icc,	%i7,	%i4
	tneg	%xcc,	0x7
	xor	%l0,	0x0A94,	%i2
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f18
	fxtod	%f18,	%f4
	sub	%o0,	0x051A,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f10,	%f6,	%f21
	move	%xcc,	%g4,	%o4
	tn	%icc,	0x0
	fbue	%fcc2,	loop_35
	orncc	%o3,	0x1754,	%l2
	add	%g5,	0x1617,	%l6
	fmovsvs	%icc,	%f11,	%f7
loop_35:
	or	%g6,	0x0694,	%i6
	nop
	setx	0xD063384E,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	add	%l7,	0x68,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] 0x89,	%l5,	%o7
	nop
	setx	0xEAA4DCC2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x2495F8C0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f0,	%f31
	fbge	%fcc1,	loop_36
	movg	%icc,	%i5,	%i3
	sir	0x0E56
	fmul8x16al	%f10,	%f22,	%f14
loop_36:
	nop
	set	0x68, %g4
	ldstuba	[%l7 + %g4] 0x04,	%i0
	fmovs	%f19,	%f6
	array8	%g2,	%o1,	%g7
	movn	%icc,	%l4,	%o5
	fmovde	%icc,	%f13,	%f26
	tgu	%icc,	0x4
	sub	%o6,	%o2,	%l3
	fzeros	%f19
	edge16ln	%g3,	%i1,	%i7
	xor	%i4,	0x0D19,	%g1
	bge,a,pt	%xcc,	loop_37
	fmovrslez	%l0,	%f9,	%f8
	fone	%f20
	pdist	%f0,	%f16,	%f24
loop_37:
	nop
	wr	%g0,	0x0c,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	call	loop_38
	bcs,a	%icc,	loop_39
	edge8l	%o0,	%i2,	%l1
	edge8n	%g4,	%o4,	%l2
loop_38:
	add	%o3,	0x0AE2,	%l6
loop_39:
	tsubcctv	%g6,	0x0ADC,	%i6
	fsrc2	%f16,	%f10
	swap	[%l7 + 0x48],	%l5
	fnot1	%f12,	%f20
	tge	%xcc,	0x1
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x20] %asi,	%o7
	tne	%icc,	0x6
	bvs	%xcc,	loop_40
	add	%i5,	%i3,	%i0
	addccc	%g2,	%g5,	%o1
	umulcc	%g7,	%l4,	%o5
loop_40:
	fmovsleu	%icc,	%f31,	%f2
	fmovdvs	%icc,	%f14,	%f7
	ld	[%l7 + 0x7C],	%f1
	addcc	%o2,	%l3,	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g3,	%i1,	%i4
	edge16n	%g1,	%l0,	%o0
	fmovda	%icc,	%f11,	%f20
	sdiv	%i2,	0x0147,	%l1
	set	0x40, %o5
	stda	%f0,	[%l7 + %o5] 0x16
	membar	#Sync
	fornot1s	%f24,	%f22,	%f14
	movvs	%icc,	%i7,	%o4
	tg	%icc,	0x6
	movg	%icc,	%g4,	%o3
	edge16n	%l6,	%g6,	%i6
	fmovrdgz	%l2,	%f16,	%f24
	ldsh	[%l7 + 0x14],	%o7
	alignaddrl	%i5,	%l5,	%i3
	stx	%g2,	[%l7 + 0x78]
	fxors	%f3,	%f14,	%f14
	ldsw	[%l7 + 0x20],	%g5
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x46] %asi,	%i0
	orcc	%g7,	%l4,	%o5
	fexpand	%f12,	%f8
	andn	%o2,	%o1,	%l3
	mulx	%o6,	%g3,	%i1
	movrgz	%i4,	%l0,	%o0
	srlx	%g1,	0x0D,	%i2
	tleu	%icc,	0x4
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x68] %asi,	%i7
	set	0x2C, %o0
	ldsba	[%l7 + %o0] 0x89,	%l1
	fbge	%fcc0,	loop_41
	subc	%g4,	0x1C90,	%o3
	fnegs	%f13,	%f16
	nop
	setx	0x7CA6D844D0725D72,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
loop_41:
	movvc	%icc,	%l6,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g6,	%l2,	%i6
	sdiv	%o7,	0x0D3A,	%l5
	fmovrslz	%i3,	%f25,	%f26
	nop
	setx	0xB2C6AEBF69EB9CA7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0xC12FE597F335608E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f14,	%f6
	movleu	%xcc,	%i5,	%g5
	brgez,a	%i0,	loop_42
	movrgz	%g2,	0x3D1,	%g7
	fmovsne	%icc,	%f21,	%f15
	taddcctv	%l4,	0x1409,	%o2
loop_42:
	andcc	%o1,	%l3,	%o5
	bne,a	%icc,	loop_43
	fmovdcs	%xcc,	%f31,	%f2
	fmovsvc	%xcc,	%f2,	%f24
	alignaddr	%o6,	%g3,	%i4
loop_43:
	fmovrde	%i1,	%f8,	%f10
	fcmpne32	%f4,	%f20,	%o0
	set	0x10, %o7
	ldsba	[%l7 + %o7] 0x88,	%l0
	edge8ln	%g1,	%i2,	%l1
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x56] %asi,	%g4
	nop
	fitod	%f10,	%f10
	fdtox	%f10,	%f2
	fxtod	%f2,	%f10
	stw	%o3,	[%l7 + 0x60]
	movrgez	%l6,	%o4,	%i7
	sethi	0x1E8F,	%g6
	fbo	%fcc0,	loop_44
	subc	%l2,	0x00FE,	%o7
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x30] %asi,	%l5
loop_44:
	taddcctv	%i6,	%i5,	%i3
	fbl,a	%fcc3,	loop_45
	addccc	%g5,	%i0,	%g2
	bcs,a,pn	%xcc,	loop_46
	tvs	%xcc,	0x3
loop_45:
	movrlz	%g7,	0x136,	%l4
	umulcc	%o1,	%l3,	%o5
loop_46:
	fmovrsgz	%o2,	%f15,	%f11
	smul	%o6,	0x10E8,	%i4
	nop
	setx	0xF3DA2070,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x42EF4042,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f25,	%f6
	movg	%xcc,	%i1,	%o0
	fbuge,a	%fcc3,	loop_47
	edge8ln	%g3,	%l0,	%g1
	fmovsvc	%xcc,	%f19,	%f9
	edge8n	%i2,	%g4,	%l1
loop_47:
	fmul8x16al	%f30,	%f8,	%f22
	smulcc	%o3,	0x1FCE,	%o4
	tl	%xcc,	0x7
	ld	[%l7 + 0x7C],	%f3
	tleu	%icc,	0x0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] %asi,	%l6,	%i7
	fandnot1	%f30,	%f16,	%f22
	subcc	%g6,	0x1A9E,	%o7
	set	0x5C, %g2
	stwa	%l2,	[%l7 + %g2] 0x10
	fmovrde	%i6,	%f6,	%f8
	tge	%xcc,	0x2
	alignaddr	%l5,	%i3,	%i5
	edge32ln	%g5,	%i0,	%g2
	tpos	%icc,	0x2
	addcc	%g7,	%l4,	%o1
	or	%l3,	0x1AB0,	%o2
	smul	%o6,	0x04D4,	%i4
	udivcc	%i1,	0x153B,	%o5
	fmovrse	%o0,	%f24,	%f10
	tvs	%xcc,	0x5
	add	%l0,	%g1,	%g3
	andncc	%i2,	%g4,	%o3
	fmovrdlez	%o4,	%f16,	%f4
	tvc	%xcc,	0x3
	brgz	%l1,	loop_48
	nop
	setx	loop_49,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%l6,	%i7,	%g6
	movl	%xcc,	%o7,	%i6
loop_48:
	nop
	fitos	%f0,	%f15
	fstod	%f15,	%f18
loop_49:
	edge16	%l5,	%l2,	%i5
	tsubcc	%g5,	%i0,	%g2
	tleu	%icc,	0x4
	tvc	%icc,	0x7
	and	%i3,	0x0F85,	%l4
	fcmpgt16	%f6,	%f28,	%g7
	sub	%o1,	0x055E,	%l3
	tleu	%xcc,	0x2
	edge8	%o2,	%o6,	%i4
	movrgez	%i1,	0x059,	%o5
	bcc,pt	%xcc,	loop_50
	bg,pt	%xcc,	loop_51
	tgu	%icc,	0x6
	and	%o0,	%g1,	%l0
loop_50:
	nop
	setx	0xC6B19FD6D7EFD775,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f2
loop_51:
	nop
	fitod	%f6,	%f24
	fdtox	%f24,	%f4
	sll	%g3,	0x0C,	%g4
	andn	%i2,	0x132B,	%o4
	orncc	%l1,	0x0887,	%o3
	movl	%icc,	%i7,	%g6
	subcc	%o7,	0x13D1,	%l6
	fxnors	%f26,	%f1,	%f29
	add	%l5,	%l2,	%i5
	nop
	set	0x2E, %l6
	sth	%g5,	[%l7 + %l6]
	andn	%i0,	0x04E6,	%g2
	xor	%i3,	0x1F17,	%i6
	fmovscs	%icc,	%f27,	%f13
	fbn,a	%fcc1,	loop_52
	fmovda	%icc,	%f15,	%f5
	nop
	setx	0xB978044AA914B3B6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f0
	movgu	%xcc,	%l4,	%g7
loop_52:
	movrgz	%l3,	0x279,	%o2
	fbo	%fcc3,	loop_53
	edge32n	%o6,	%i4,	%o1
	call	loop_54
	taddcctv	%o5,	0x1B88,	%i1
loop_53:
	fsrc1	%f26,	%f16
	umulcc	%o0,	0x00F0,	%l0
loop_54:
	nop
	set	0x30, %g3
	lduwa	[%l7 + %g3] 0x89,	%g1
	stbar
	fbuge	%fcc2,	loop_55
	prefetch	[%l7 + 0x1C],	 0x3
	fmovrdgez	%g3,	%f4,	%f30
	fbl	%fcc0,	loop_56
loop_55:
	stx	%g4,	[%l7 + 0x58]
	fnot2	%f12,	%f22
	orn	%o4,	0x0080,	%i2
loop_56:
	fmovsne	%xcc,	%f28,	%f5
	edge8l	%l1,	%o3,	%i7
	stbar
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x6B] %asi,	%g6
	umul	%l6,	%o7,	%l2
	sll	%l5,	%g5,	%i0
	bg	%xcc,	loop_57
	edge16ln	%i5,	%i3,	%g2
	fblg,a	%fcc0,	loop_58
	fmuld8sux16	%f28,	%f7,	%f0
loop_57:
	edge8ln	%i6,	%g7,	%l4
	movvc	%xcc,	%o2,	%l3
loop_58:
	fxors	%f14,	%f9,	%f15
	subcc	%o6,	0x11FC,	%o1
	tleu	%xcc,	0x3
	movrlez	%o5,	0x0EF,	%i1
	alignaddrl	%i4,	%l0,	%g1
	edge32n	%o0,	%g3,	%g4
	tvs	%xcc,	0x6
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x66] %asi,	%o4
	ldsh	[%l7 + 0x12],	%i2
	taddcc	%o3,	0x1D8F,	%i7
	bn,a	loop_59
	edge8n	%g6,	%l1,	%l6
	fmul8x16	%f8,	%f0,	%f28
	movvs	%xcc,	%o7,	%l2
loop_59:
	orncc	%l5,	0x14BC,	%g5
	te	%xcc,	0x3
	fmovse	%xcc,	%f31,	%f22
	fsrc1s	%f20,	%f29
	xorcc	%i5,	%i0,	%g2
	edge8l	%i6,	%g7,	%l4
	fones	%f13
	edge8n	%i3,	%o2,	%l3
	nop
	setx	loop_60,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	flush	%l7 + 0x74
	sra	%o1,	%o6,	%i1
	orncc	%o5,	%l0,	%i4
loop_60:
	array16	%g1,	%o0,	%g4
	alignaddrl	%o4,	%g3,	%i2
	sll	%i7,	%o3,	%l1
	fbn,a	%fcc3,	loop_61
	fbg,a	%fcc0,	loop_62
	srax	%g6,	0x13,	%o7
	sir	0x1561
loop_61:
	addc	%l6,	%l2,	%g5
loop_62:
	sra	%l5,	%i0,	%g2
	ldsw	[%l7 + 0x30],	%i6
	alignaddrl	%i5,	%l4,	%i3
	sllx	%o2,	0x0E,	%l3
	sethi	0x02A5,	%o1
	add	%l7,	0x58,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] %asi,	%g7,	%o6
	edge16	%i1,	%l0,	%i4
	fbug	%fcc0,	loop_63
	ldub	[%l7 + 0x7B],	%g1
	popc	%o0,	%o5
	array32	%g4,	%o4,	%g3
loop_63:
	movvs	%icc,	%i2,	%i7
	fmovrsgz	%o3,	%f18,	%f1
	mulx	%g6,	%o7,	%l1
	andcc	%l2,	%g5,	%l6
	fmovsvc	%xcc,	%f11,	%f5
	fmovdcs	%xcc,	%f24,	%f25
	movre	%l5,	%i0,	%i6
	edge16n	%i5,	%l4,	%i3
	orcc	%o2,	%g2,	%o1
	mulscc	%l3,	0x1962,	%g7
	movcc	%icc,	%i1,	%l0
	stx	%i4,	[%l7 + 0x30]
	edge32ln	%o6,	%g1,	%o5
	fmovdl	%xcc,	%f0,	%f5
	sdiv	%o0,	0x1D50,	%o4
	edge16n	%g4,	%i2,	%g3
	fbl,a	%fcc0,	loop_64
	orncc	%o3,	0x1F79,	%g6
	tvc	%icc,	0x3
	subccc	%i7,	%l1,	%l2
loop_64:
	fpack32	%f4,	%f24,	%f0
	orn	%g5,	%l6,	%l5
	swap	[%l7 + 0x5C],	%o7
	add	%l7,	0x14,	%l6
	wr	%g0,	0x88,	%asi
	casa	[%l6] 0x88,	%i6,	%i0
	orncc	%l4,	%i5,	%o2
	or	%g2,	%i3,	%l3
	and	%g7,	%i1,	%o1
	movvc	%xcc,	%i4,	%l0
	movle	%xcc,	%o6,	%o5
	fand	%f10,	%f16,	%f2
	fmovrdgz	%o0,	%f2,	%f8
	fmovrdgez	%g1,	%f0,	%f16
	alignaddr	%o4,	%g4,	%i2
	nop
	setx	0x0992C9BB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0xACA5E3AD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fadds	%f15,	%f14,	%f23
	xnorcc	%o3,	0x1E83,	%g6
	call	loop_65
	addccc	%i7,	0x1117,	%l1
	movcc	%icc,	%l2,	%g5
	nop
	setx loop_66, %l0, %l1
	jmpl %l1, %l6
loop_65:
	fbo,a	%fcc0,	loop_67
	sdivcc	%l5,	0x189A,	%o7
	move	%icc,	%i6,	%i0
loop_66:
	subcc	%l4,	%g3,	%i5
loop_67:
	fpmerge	%f30,	%f7,	%f26
	tpos	%icc,	0x3
	tne	%xcc,	0x0
	tg	%xcc,	0x1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%o2
	andncc	%g2,	%i3,	%l3
	edge8	%g7,	%i1,	%o1
	fmul8x16	%f15,	%f0,	%f0
	popc	0x19E0,	%l0
	bpos,pt	%icc,	loop_68
	edge8n	%o6,	%i4,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f0,	%f12,	%f6
loop_68:
	fmovsn	%xcc,	%f3,	%f5
	movcc	%icc,	%o0,	%g1
	edge8n	%g4,	%i2,	%o4
	mulscc	%o3,	0x02B3,	%g6
	sra	%i7,	%l2,	%g5
	fsrc2	%f14,	%f16
	fcmpne32	%f2,	%f28,	%l6
	add	%l7,	0x30,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%l1,	%o7
	or	%i6,	%i0,	%l5
	sdivcc	%g3,	0x1288,	%i5
	fmovrdlz	%l4,	%f6,	%f22
	umul	%g2,	0x0536,	%i3
	movcs	%xcc,	%l3,	%o2
	te	%xcc,	0x7
	bge,pn	%xcc,	loop_69
	fpsub16s	%f17,	%f31,	%f22
	ta	%icc,	0x1
	fsrc1	%f26,	%f20
loop_69:
	fmovsneg	%icc,	%f6,	%f8
	udiv	%g7,	0x1C84,	%i1
	fmovrdlz	%l0,	%f30,	%f28
	tg	%xcc,	0x4
	movn	%icc,	%o6,	%o1
	fmovda	%xcc,	%f28,	%f12
	orncc	%o5,	%o0,	%i4
	fbul	%fcc1,	loop_70
	fbul	%fcc2,	loop_71
	movle	%icc,	%g4,	%i2
	fmovsvc	%icc,	%f14,	%f9
loop_70:
	fpsub16s	%f9,	%f20,	%f4
loop_71:
	movvs	%xcc,	%g1,	%o3
	movn	%icc,	%o4,	%g6
	fmovdvc	%xcc,	%f7,	%f0
	ble,pn	%xcc,	loop_72
	movrlez	%l2,	0x372,	%g5
	ldx	[%l7 + 0x50],	%i7
	and	%l6,	0x10FB,	%l1
loop_72:
	bcs,a	%icc,	loop_73
	movpos	%xcc,	%i6,	%o7
	brz,a	%i0,	loop_74
	fsrc2s	%f27,	%f27
loop_73:
	nop
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x38] %asi,	%f17
loop_74:
	fmovdcc	%icc,	%f31,	%f2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x2a,	%l4
	addcc	%g3,	%i5,	%g2
	array32	%i3,	%l3,	%l4
	movleu	%xcc,	%g7,	%o2
	tge	%icc,	0x7
	edge32l	%l0,	%o6,	%o1
	fzero	%f10
	tvc	%icc,	0x1
	std	%f14,	[%l7 + 0x18]
	bvs,a	loop_75
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x18
loop_75:
	fbl	%fcc0,	loop_76
	fbue,a	%fcc2,	loop_77
	movcs	%xcc,	%i1,	%o5
	fmovrde	%o0,	%f28,	%f2
loop_76:
	srl	%g4,	%i4,	%i2
loop_77:
	edge8	%g1,	%o4,	%g6
	set	0x60, %g1
	ldda	[%l7 + %g1] 0x2f,	%l2
	movrlez	%o3,	%g5,	%l6
	edge16	%i7,	%l1,	%o7
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x78] %asi,	%i6
	sdivcc	%l5,	0x027C,	%i0
	udivx	%i5,	0x1BC9,	%g2
	umulcc	%g3,	%i3,	%l3
	subc	%g7,	%l4,	%l0
	orn	%o2,	0x098D,	%o6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x44] %asi,	%i1
	movrlez	%o5,	0x2B0,	%o0
	bne	%xcc,	loop_78
	edge16ln	%o1,	%g4,	%i4
	movg	%icc,	%g1,	%i2
	array16	%g6,	%o4,	%o3
loop_78:
	nop
	fitod	%f6,	%f4
	fdtox	%f4,	%f22
	orcc	%g5,	%l6,	%i7
	std	%f16,	[%l7 + 0x58]
	ta	%xcc,	0x5
	movl	%xcc,	%l2,	%o7
	udiv	%i6,	0x12B3,	%l5
	fcmple16	%f30,	%f28,	%i0
	fbg,a	%fcc2,	loop_79
	fcmple16	%f16,	%f18,	%l1
	fnands	%f8,	%f17,	%f19
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%i5
loop_79:
	bg,pt	%icc,	loop_80
	fmovsleu	%icc,	%f25,	%f29
	movvc	%icc,	%g2,	%g3
	orcc	%i3,	%l3,	%g7
loop_80:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	array8	%l0,	%o2,	%l4
	edge16	%i1,	%o6,	%o5
	tge	%xcc,	0x1
	fmovrdlez	%o0,	%f22,	%f30
	tpos	%icc,	0x3
	movne	%icc,	%o1,	%i4
	fcmpeq32	%f12,	%f22,	%g1
	edge16n	%i2,	%g6,	%o4
	addcc	%o3,	%g4,	%g5
	andcc	%i7,	%l6,	%l2
	udivx	%o7,	0x1CB6,	%i6
	fnands	%f8,	%f31,	%f13
	movvc	%xcc,	%i0,	%l1
	fmovsa	%icc,	%f20,	%f21
	tge	%xcc,	0x2
	edge8n	%i5,	%g2,	%l5
	movrne	%g3,	0x28D,	%l3
	sdivcc	%i3,	0x02FC,	%g7
	tne	%icc,	0x1
	movre	%l0,	%l4,	%i1
	set	0x18, %o4
	ldxa	[%g0 + %o4] 0x58,	%o2
	edge16	%o5,	%o0,	%o6
	tleu	%xcc,	0x3
	movleu	%xcc,	%i4,	%g1
	subc	%o1,	%g6,	%i2
	edge32l	%o4,	%g4,	%o3
	movvc	%icc,	%g5,	%l6
	orncc	%l2,	0x01B6,	%o7
	fbne	%fcc0,	loop_81
	edge8	%i6,	%i0,	%i7
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%f22
	movrne	%l1,	0x1C1,	%g2
loop_81:
	fnands	%f1,	%f28,	%f5
	fbug,a	%fcc1,	loop_82
	movrlez	%l5,	%i5,	%g3
	ba,a,pn	%xcc,	loop_83
	fmovrde	%i3,	%f10,	%f10
loop_82:
	tle	%xcc,	0x2
	fnot2	%f12,	%f12
loop_83:
	swap	[%l7 + 0x10],	%g7
	movrgez	%l0,	0x296,	%l4
	smulcc	%l3,	0x045A,	%i1
	movrlez	%o2,	0x027,	%o5
	fors	%f18,	%f2,	%f31
	edge8	%o0,	%i4,	%o6
	call	loop_84
	fnegs	%f5,	%f17
	edge8l	%g1,	%o1,	%g6
	tgu	%icc,	0x1
loop_84:
	fbu,a	%fcc1,	loop_85
	edge16	%i2,	%g4,	%o4
	movgu	%xcc,	%o3,	%g5
	nop
	fitos	%f12,	%f13
loop_85:
	nop
	set	0x8, %o3
	stxa	%l6,	[%g0 + %o3] 0x21
	brz	%o7,	loop_86
	fbne,a	%fcc3,	loop_87
	alignaddr	%l2,	%i6,	%i7
	xor	%i0,	0x0C2A,	%g2
loop_86:
	andn	%l5,	0x1366,	%i5
loop_87:
	edge8n	%l1,	%i3,	%g7
	movrlez	%g3,	0x1F2,	%l4
	fbul,a	%fcc3,	loop_88
	nop
	fitos	%f10,	%f28
	movge	%icc,	%l0,	%l3
	nop
	setx	0x15A82D07A051E12D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_88:
	tpos	%xcc,	0x6
	tne	%icc,	0x2
	tleu	%icc,	0x5
	ba,a	%xcc,	loop_89
	fnands	%f15,	%f22,	%f25
	subccc	%o2,	%i1,	%o5
	movle	%xcc,	%i4,	%o0
loop_89:
	fmovdvc	%icc,	%f19,	%f6
	ldsh	[%l7 + 0x0A],	%o6
	fmovrsgez	%g1,	%f10,	%f16
	andn	%o1,	%i2,	%g6
	tpos	%xcc,	0x6
	add	%o4,	%g4,	%o3
	edge8	%l6,	%o7,	%g5
	fornot1	%f24,	%f22,	%f14
	tg	%xcc,	0x1
	fmovdcs	%icc,	%f6,	%f8
	flush	%l7 + 0x54
	orn	%i6,	%l2,	%i7
	fxnor	%f24,	%f16,	%f8
	tcs	%icc,	0x2
	set	0x5B, %l3
	lduba	[%l7 + %l3] 0x19,	%g2
	sdiv	%l5,	0x02FE,	%i0
	nop
	fitod	%f12,	%f26
	fdtox	%f26,	%f14
	edge16	%i5,	%l1,	%i3
	fcmpeq32	%f20,	%f10,	%g3
	movn	%xcc,	%l4,	%g7
	bcs	loop_90
	call	loop_91
	nop
	fitod	%f2,	%f20
	fdtos	%f20,	%f17
	nop
	setx	loop_92,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_90:
	bne,pn	%icc,	loop_93
loop_91:
	bleu,pn	%icc,	loop_94
	fmovdne	%xcc,	%f25,	%f30
loop_92:
	stw	%l3,	[%l7 + 0x74]
loop_93:
	movgu	%xcc,	%o2,	%i1
loop_94:
	tsubcctv	%l0,	%i4,	%o5
	movg	%icc,	%o0,	%o6
	movneg	%icc,	%o1,	%i2
	fmovsgu	%xcc,	%f7,	%f16
	nop
	setx	0xBCCAE2A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x74366A41,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fmuls	%f6,	%f9,	%f21
	tneg	%xcc,	0x5
	tsubcctv	%g1,	0x160A,	%g6
	alignaddrl	%o4,	%g4,	%l6
	set	0x24, %i4
	lda	[%l7 + %i4] 0x81,	%f22
	tcs	%icc,	0x4
	set	0x20, %l5
	ldxa	[%g0 + %l5] 0x20,	%o3
	fmovdle	%icc,	%f30,	%f0
	tle	%xcc,	0x7
	xnor	%g5,	0x07DC,	%i6
	sdivcc	%o7,	0x126B,	%i7
	fbn,a	%fcc3,	loop_95
	andcc	%g2,	0x0BC2,	%l5
	edge16	%l2,	%i0,	%i5
	movre	%l1,	%i3,	%l4
loop_95:
	andncc	%g3,	%l3,	%o2
	stw	%g7,	[%l7 + 0x70]
	fandnot2s	%f17,	%f25,	%f31
	srl	%l0,	%i1,	%o5
	tvs	%xcc,	0x6
	fandnot1	%f14,	%f30,	%f26
	movne	%icc,	%o0,	%i4
	fsrc2s	%f19,	%f10
	bneg,a	loop_96
	movvs	%icc,	%o6,	%i2
	udiv	%o1,	0x1A14,	%g6
	orcc	%g1,	%g4,	%o4
loop_96:
	edge32	%o3,	%l6,	%g5
	or	%o7,	%i6,	%g2
	srl	%i7,	0x08,	%l5
	fpsub32s	%f12,	%f14,	%f2
	flush	%l7 + 0x50
	movne	%icc,	%l2,	%i5
	array8	%i0,	%l1,	%l4
	movn	%xcc,	%g3,	%l3
	tsubcctv	%i3,	0x058B,	%o2
	fmovrdgez	%g7,	%f18,	%f30
	popc	0x0A8A,	%i1
	fmuld8sux16	%f24,	%f17,	%f14
	andncc	%o5,	%l0,	%o0
	addcc	%i4,	0x0FC0,	%i2
	edge16	%o1,	%g6,	%o6
	tleu	%xcc,	0x7
	fnot2s	%f8,	%f24
	srlx	%g1,	0x0F,	%g4
	fmovdleu	%icc,	%f24,	%f18
	movrgez	%o3,	0x371,	%o4
	ldsw	[%l7 + 0x74],	%l6
	nop
	fitod	%f23,	%f14
	ldd	[%l7 + 0x20],	%f12
	fmovrsgez	%o7,	%f26,	%f9
	fmovsge	%xcc,	%f22,	%f17
	andncc	%i6,	%g5,	%i7
	flush	%l7 + 0x54
	mulscc	%l5,	%g2,	%l2
	faligndata	%f14,	%f14,	%f30
	ba,a	loop_97
	tgu	%icc,	0x3
	edge8n	%i5,	%l1,	%i0
	movvc	%xcc,	%l4,	%g3
loop_97:
	mulscc	%l3,	%o2,	%g7
	movvc	%xcc,	%i3,	%o5
	flush	%l7 + 0x14
	movrgz	%l0,	0x1A0,	%i1
	fmovdn	%xcc,	%f11,	%f3
	bn,a,pn	%icc,	loop_98
	movvs	%xcc,	%o0,	%i2
	fands	%f9,	%f29,	%f29
	fcmpne32	%f2,	%f20,	%o1
loop_98:
	fmovsn	%icc,	%f16,	%f7
	tsubcc	%i4,	%g6,	%g1
	subc	%o6,	0x0615,	%g4
	nop
	fitod	%f12,	%f6
	fdtox	%f6,	%f0
	fxtod	%f0,	%f24
	stw	%o3,	[%l7 + 0x10]
	taddcc	%o4,	%l6,	%o7
	tsubcctv	%g5,	0x0BD4,	%i7
	fmul8x16au	%f6,	%f28,	%f14
	ldsb	[%l7 + 0x73],	%l5
	sub	%i6,	%l2,	%i5
	bne,a	loop_99
	fmovdcc	%icc,	%f20,	%f28
	tcs	%xcc,	0x6
	faligndata	%f20,	%f6,	%f28
loop_99:
	srlx	%g2,	0x12,	%l1
	sethi	0x087F,	%i0
	edge16n	%g3,	%l4,	%l3
	fmovdge	%xcc,	%f23,	%f22
	xorcc	%g7,	%i3,	%o2
	movcc	%icc,	%l0,	%o5
	set	0x6C, %l2
	lda	[%l7 + %l2] 0x04,	%f20
	udiv	%i1,	0x1ABB,	%i2
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x2A] %asi,	%o0
	sth	%o1,	[%l7 + 0x54]
	movcc	%icc,	%g6,	%g1
	movrgez	%i4,	%o6,	%o3
	bpos,a,pn	%icc,	loop_100
	udivx	%g4,	0x137A,	%l6
	movre	%o4,	%o7,	%i7
	wr	%g0,	0x19,	%asi
	stwa	%g5,	[%l7 + 0x68] %asi
loop_100:
	fbl	%fcc2,	loop_101
	move	%xcc,	%l5,	%i6
	movrne	%i5,	%g2,	%l2
	nop
	fitos	%f22,	%f17
loop_101:
	edge8n	%i0,	%l1,	%l4
	srax	%l3,	0x1A,	%g3
	fmovrdgz	%g7,	%f26,	%f28
	movneg	%xcc,	%i3,	%l0
	popc	%o5,	%o2
	brlz,a	%i2,	loop_102
	orncc	%i1,	%o0,	%o1
	bcs	%xcc,	loop_103
	stw	%g1,	[%l7 + 0x30]
loop_102:
	fandnot1	%f20,	%f0,	%f6
	fbe,a	%fcc3,	loop_104
loop_103:
	fabss	%f26,	%f8
	umulcc	%g6,	0x16E8,	%i4
	array32	%o3,	%o6,	%l6
loop_104:
	ble,a	loop_105
	nop
	fitos	%f2,	%f11
	fstox	%f11,	%f0
	fxtos	%f0,	%f31
	stw	%g4,	[%l7 + 0x54]
	tgu	%icc,	0x4
loop_105:
	tleu	%icc,	0x2
	alignaddrl	%o7,	%i7,	%o4
	sethi	0x0398,	%l5
	fandnot1	%f8,	%f2,	%f28
	movcc	%xcc,	%i6,	%i5
	bpos	%icc,	loop_106
	movleu	%xcc,	%g5,	%g2
	be,a	%xcc,	loop_107
	fsrc1	%f12,	%f30
loop_106:
	bneg,pt	%xcc,	loop_108
	movrgz	%l2,	%l1,	%i0
loop_107:
	movgu	%icc,	%l3,	%g3
	wr	%g0,	0x80,	%asi
	sta	%f18,	[%l7 + 0x0C] %asi
loop_108:
	movleu	%xcc,	%g7,	%i3
	xor	%l4,	%o5,	%o2
	fba,a	%fcc1,	loop_109
	brlz	%i2,	loop_110
	sth	%i1,	[%l7 + 0x4C]
	addcc	%l0,	0x0123,	%o1
loop_109:
	udiv	%g1,	0x1336,	%o0
loop_110:
	subccc	%g6,	%i4,	%o6
	bn,a	%xcc,	loop_111
	movre	%o3,	0x237,	%l6
	fmovdgu	%icc,	%f4,	%f26
	ta	%xcc,	0x4
loop_111:
	andn	%o7,	%i7,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xB6D6AE4B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f19
	umul	%o4,	0x17A4,	%l5
	fmul8x16	%f9,	%f20,	%f24
	bge,pt	%xcc,	loop_112
	st	%f24,	[%l7 + 0x5C]
	alignaddrl	%i5,	%i6,	%g5
	bl,a,pt	%xcc,	loop_113
loop_112:
	fba,a	%fcc2,	loop_114
	edge16ln	%l2,	%g2,	%l1
	movn	%xcc,	%i0,	%g3
loop_113:
	sll	%g7,	0x05,	%i3
loop_114:
	smulcc	%l4,	%l3,	%o5
	fandnot2	%f8,	%f8,	%f26
	xor	%i2,	%o2,	%l0
	umul	%o1,	0x0558,	%i1
	fmovsl	%icc,	%f14,	%f13
	fmul8x16	%f26,	%f24,	%f12
	edge32ln	%o0,	%g1,	%g6
	ld	[%l7 + 0x14],	%f7
	srl	%i4,	%o6,	%o3
	umulcc	%l6,	0x1D40,	%i7
	edge8l	%g4,	%o7,	%o4
	nop
	setx	0x005B7D98,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xA16BD5E7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f21,	%f25
	fxnors	%f22,	%f16,	%f29
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f2
	tge	%icc,	0x5
	movrgz	%i5,	0x1B8,	%i6
	tcc	%icc,	0x5
	mova	%xcc,	%g5,	%l5
	fnot2	%f20,	%f18
	fornot1s	%f30,	%f28,	%f8
	bne	loop_115
	movrne	%l2,	%g2,	%i0
	alignaddr	%l1,	%g3,	%i3
	nop
	setx	0x948773C0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f31
loop_115:
	brgez	%g7,	loop_116
	fmovsgu	%xcc,	%f12,	%f5
	fsrc1s	%f25,	%f11
	movrne	%l3,	0x030,	%l4
loop_116:
	nop
	membar	#Sync
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x17,	%f0
	and	%o5,	0x1A0F,	%o2
	srl	%i2,	%l0,	%i1
	addc	%o0,	0x04D6,	%g1
	fmovrdgez	%o1,	%f6,	%f6
	brlz,a	%g6,	loop_117
	bcs,a,pn	%icc,	loop_118
	fmovrse	%o6,	%f7,	%f13
	set	0x6E, %i0
	lduha	[%l7 + %i0] 0x18,	%i4
loop_117:
	nop
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
loop_118:
	edge8ln	%l6,	%g4,	%i7
	wr	%g0,	0x04,	%asi
	stwa	%o4,	[%l7 + 0x30] %asi
	tge	%xcc,	0x1
	movrlez	%o7,	0x305,	%i5
	alignaddr	%g5,	%i6,	%l5
	bneg,a	%icc,	loop_119
	bgu,a,pt	%xcc,	loop_120
	sth	%g2,	[%l7 + 0x08]
	fnands	%f29,	%f26,	%f25
loop_119:
	fxors	%f1,	%f18,	%f29
loop_120:
	nop
	set	0x20, %i7
	sta	%f8,	[%l7 + %i7] 0x81
	nop
	setx	0x5F1466505224370D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xA964F3DE8743A146,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	faddd	%f12,	%f0,	%f24
	fmovspos	%xcc,	%f5,	%f7
	bcs,a,pt	%xcc,	loop_121
	move	%xcc,	%l2,	%l1
	fble	%fcc0,	loop_122
	sdivcc	%g3,	0x0BA5,	%i0
loop_121:
	fone	%f28
	taddcctv	%g7,	0x0B5C,	%l3
loop_122:
	nop
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x23,	%l4
	or	%i3,	0x0B2A,	%o2
	ta	%icc,	0x6
	edge16l	%i2,	%o5,	%i1
	tsubcctv	%l0,	%g1,	%o0
	ta	%xcc,	0x4
	array16	%o1,	%o6,	%i4
	bgu,pt	%icc,	loop_123
	stb	%o3,	[%l7 + 0x1F]
	fpsub32	%f30,	%f28,	%f22
	tg	%icc,	0x4
loop_123:
	udivcc	%l6,	0x0E3A,	%g4
	fbo	%fcc2,	loop_124
	fabsd	%f14,	%f26
	orncc	%i7,	%o4,	%g6
	xnor	%i5,	0x1883,	%o7
loop_124:
	fmul8x16au	%f3,	%f14,	%f8
	bpos,pt	%xcc,	loop_125
	movgu	%xcc,	%i6,	%g5
	brgez,a	%g2,	loop_126
	xnor	%l2,	0x04CC,	%l1
loop_125:
	fornot1s	%f6,	%f3,	%f5
	fmovsn	%icc,	%f22,	%f7
loop_126:
	bcs,a,pn	%icc,	loop_127
	movpos	%icc,	%g3,	%i0
	nop
	setx	loop_128,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smulcc	%l5,	%g7,	%l3
loop_127:
	membar	0x47
	ta	%xcc,	0x0
loop_128:
	fpadd16s	%f11,	%f3,	%f28
	tn	%xcc,	0x7
	fba,a	%fcc1,	loop_129
	tsubcc	%i3,	%o2,	%l4
	movcs	%xcc,	%o5,	%i2
	fandnot1s	%f22,	%f8,	%f16
loop_129:
	nop
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x30] %asi,	%i1
	orcc	%g1,	0x1636,	%o0
	call	loop_130
	fbg,a	%fcc3,	loop_131
	fmuld8ulx16	%f1,	%f17,	%f18
	edge32ln	%o1,	%o6,	%l0
loop_130:
	movvs	%xcc,	%i4,	%l6
loop_131:
	movrlz	%o3,	0x0B5,	%i7
	movne	%xcc,	%o4,	%g4
	stx	%i5,	[%l7 + 0x48]
	movrgz	%o7,	%g6,	%i6
	fmovd	%f16,	%f16
	tn	%xcc,	0x7
	edge8l	%g5,	%l2,	%l1
	fblg,a	%fcc0,	loop_132
	srl	%g2,	0x09,	%i0
	ldub	[%l7 + 0x26],	%l5
	xnorcc	%g3,	0x0027,	%g7
loop_132:
	movrne	%i3,	0x109,	%o2
	sir	0x12D9
	fornot1	%f30,	%f6,	%f18
	fbn,a	%fcc3,	loop_133
	membar	0x72
	movvs	%icc,	%l3,	%o5
	movge	%icc,	%i2,	%l4
loop_133:
	fnand	%f12,	%f4,	%f20
	faligndata	%f22,	%f2,	%f0
	fpadd16s	%f25,	%f24,	%f22
	fexpand	%f30,	%f28
	nop
	fitod	%f10,	%f30
	fdtoi	%f30,	%f24
	edge8l	%i1,	%g1,	%o1
	smul	%o0,	0x1143,	%l0
	fnors	%f3,	%f2,	%f10
	tcs	%xcc,	0x1
	or	%i4,	0x15FA,	%o6
	movrlez	%l6,	0x01C,	%o3
	fmovsvs	%icc,	%f27,	%f23
	orn	%i7,	0x0B45,	%g4
	fcmpne32	%f26,	%f0,	%o4
	tgu	%icc,	0x0
	tvc	%xcc,	0x2
	array32	%o7,	%i5,	%g6
	edge32n	%g5,	%i6,	%l1
	edge16n	%l2,	%i0,	%g2
	movrgez	%l5,	0x1B7,	%g7
	fpack16	%f22,	%f21
	fble	%fcc0,	loop_134
	brgez	%i3,	loop_135
	and	%o2,	%g3,	%l3
	addc	%o5,	0x1023,	%i2
loop_134:
	xnor	%l4,	%g1,	%o1
loop_135:
	nop
	set	0x38, %o6
	ldswa	[%l7 + %o6] 0x15,	%i1
	fxor	%f8,	%f22,	%f8
	xnor	%l0,	%i4,	%o6
	fcmpeq32	%f22,	%f24,	%o0
	nop
	setx	0x851305A0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0x9BAAD910,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fsubs	%f10,	%f5,	%f14
	movpos	%xcc,	%l6,	%i7
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
	sra	%g4,	%o3,	%o4
	ldsh	[%l7 + 0x7A],	%o7
	fzero	%f8
	fmovsgu	%icc,	%f1,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x5
	xorcc	%g6,	%g5,	%i5
	subccc	%i6,	0x0114,	%l2
	ldx	[%l7 + 0x70],	%i0
	brz,a	%g2,	loop_136
	pdist	%f0,	%f6,	%f2
	subcc	%l5,	0x08A6,	%g7
	nop
	fitos	%f0,	%f19
	fstoi	%f19,	%f14
loop_136:
	fbo	%fcc3,	loop_137
	edge16	%i3,	%o2,	%g3
	wr	%g0,	0xf8,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_137:
	edge8n	%l3,	%o5,	%l1
	ba	loop_138
	xnor	%i2,	0x110F,	%g1
	fnands	%f24,	%f15,	%f16
	tsubcctv	%l4,	0x18A0,	%i1
loop_138:
	tleu	%xcc,	0x2
	srax	%o1,	%i4,	%l0
	xorcc	%o6,	0x085B,	%l6
	bneg,a	%xcc,	loop_139
	fblg,a	%fcc1,	loop_140
	movg	%icc,	%o0,	%g4
	fmovdn	%icc,	%f10,	%f4
loop_139:
	movre	%o3,	0x0B9,	%o4
loop_140:
	fpadd16s	%f22,	%f8,	%f26
	brlez,a	%i7,	loop_141
	std	%f26,	[%l7 + 0x10]
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x70] %asi,	%g6
loop_141:
	orcc	%o7,	%g5,	%i5
	sll	%i6,	0x18,	%i0
	movrlz	%l2,	%g2,	%l5
	wr	%g0,	0x0c,	%asi
	sta	%f26,	[%l7 + 0x68] %asi
	nop
	set	0x3C, %g6
	stw	%g7,	[%l7 + %g6]
	fnand	%f8,	%f0,	%f8
	fpadd32	%f10,	%f28,	%f22
	ldx	[%l7 + 0x68],	%o2
	tge	%icc,	0x7
	sub	%i3,	%g3,	%o5
	fmovrdlez	%l3,	%f20,	%f26
	bcc	loop_142
	umul	%i2,	0x1B0C,	%g1
	alignaddr	%l1,	%i1,	%l4
	ldub	[%l7 + 0x3C],	%i4
loop_142:
	movleu	%xcc,	%o1,	%o6
	nop
	setx	0x7041D3CF,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	orn	%l6,	0x0439,	%l0
	ta	%icc,	0x5
	andncc	%g4,	%o0,	%o4
	andn	%o3,	0x1DE0,	%i7
	subc	%o7,	0x1564,	%g5
	ld	[%l7 + 0x7C],	%f20
	edge8	%g6,	%i6,	%i0
	flush	%l7 + 0x1C
	brnz,a	%l2,	loop_143
	srl	%g2,	%i5,	%l5
	fones	%f30
	move	%icc,	%g7,	%i3
loop_143:
	fmovrdlz	%o2,	%f26,	%f6
	be	%icc,	loop_144
	fmovdcc	%icc,	%f3,	%f27
	fmul8ulx16	%f2,	%f0,	%f20
	fbo,a	%fcc1,	loop_145
loop_144:
	xorcc	%o5,	0x0568,	%g3
	addc	%l3,	0x169B,	%g1
	movne	%icc,	%i2,	%i1
loop_145:
	nop
	setx	0x55D1ED81,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x18DEE1EB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f17,	%f31
	fones	%f16
	alignaddr	%l4,	%i4,	%o1
	stx	%o6,	[%l7 + 0x70]
	fmovrse	%l1,	%f29,	%f11
	wr	%g0,	0x2f,	%asi
	stha	%l0,	[%l7 + 0x72] %asi
	membar	#Sync
	tne	%icc,	0x2
	fmovdn	%icc,	%f24,	%f10
	call	loop_146
	fxnors	%f26,	%f1,	%f17
	tcs	%xcc,	0x5
	fornot2s	%f19,	%f31,	%f6
loop_146:
	tl	%icc,	0x7
	fmovdvs	%icc,	%f27,	%f3
	fpack16	%f14,	%f17
	xorcc	%l6,	%g4,	%o0
	xorcc	%o3,	0x079D,	%o4
	tpos	%xcc,	0x1
	ta	%icc,	0x1
	subcc	%i7,	0x0028,	%g5
	movl	%xcc,	%o7,	%g6
	movpos	%icc,	%i6,	%l2
	and	%i0,	0x161D,	%g2
	udivx	%i5,	0x0611,	%l5
	fmovsl	%icc,	%f21,	%f3
	movrgez	%g7,	0x05F,	%o2
	set	0x26, %g5
	lduba	[%l7 + %g5] 0x10,	%i3
	fnor	%f10,	%f20,	%f22
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x2B] %asi,	%g3
	fbuge,a	%fcc1,	loop_147
	fmovrdgez	%o5,	%f2,	%f30
	sdivcc	%l3,	0x06FC,	%g1
	tleu	%xcc,	0x4
loop_147:
	xnorcc	%i2,	%l4,	%i4
	sub	%o1,	%o6,	%i1
	edge32	%l0,	%l6,	%g4
	orncc	%o0,	0x112F,	%l1
	srlx	%o4,	0x17,	%o3
	fands	%f25,	%f6,	%f1
	te	%xcc,	0x6
	fblg	%fcc0,	loop_148
	sll	%g5,	0x15,	%o7
	mulscc	%i7,	0x1865,	%i6
	edge32ln	%g6,	%l2,	%g2
loop_148:
	brz	%i0,	loop_149
	fmovscs	%icc,	%f23,	%f23
	subcc	%l5,	%g7,	%i5
	brgz	%i3,	loop_150
loop_149:
	fmovrdne	%o2,	%f0,	%f24
	movre	%o5,	0x34A,	%g3
	edge16n	%g1,	%l3,	%l4
loop_150:
	fandnot1	%f6,	%f8,	%f6
	movne	%xcc,	%i4,	%i2
	set	0x44, %i3
	swapa	[%l7 + %i3] 0x88,	%o6
	faligndata	%f8,	%f12,	%f20
	ldx	[%l7 + 0x58],	%i1
	srl	%l0,	0x1A,	%l6
	movrne	%o1,	0x145,	%o0
	xnor	%l1,	0x1D78,	%o4
	udivx	%o3,	0x0F59,	%g4
	alignaddrl	%g5,	%o7,	%i7
	subc	%i6,	%g6,	%l2
	edge8	%i0,	%g2,	%l5
	udiv	%g7,	0x1A1B,	%i3
	tsubcc	%o2,	0x1A48,	%o5
	smul	%i5,	%g3,	%l3
	nop
	setx	0xFF9EC7ED,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xC109A323,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fadds	%f24,	%f5,	%f22
	fbge,a	%fcc1,	loop_151
	fmovde	%xcc,	%f25,	%f27
	movn	%icc,	%l4,	%i4
	fbule	%fcc1,	loop_152
loop_151:
	nop
	fitos	%f3,	%f20
	fstod	%f20,	%f18
	fbn,a	%fcc1,	loop_153
	popc	%i2,	%o6
loop_152:
	ldd	[%l7 + 0x28],	%f12
	or	%i1,	0x1F5D,	%g1
loop_153:
	nop
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x08] %asi,	%f21
	add	%l6,	0x1851,	%l0
	movn	%icc,	%o0,	%o1
	movn	%xcc,	%o4,	%l1
	ble,pn	%icc,	loop_154
	fbg,a	%fcc2,	loop_155
	tcs	%xcc,	0x3
	movge	%xcc,	%g4,	%g5
loop_154:
	fmul8ulx16	%f26,	%f24,	%f24
loop_155:
	tne	%xcc,	0x0
	sethi	0x16BF,	%o7
	subccc	%o3,	%i6,	%i7
	add	%g6,	0x1DFE,	%i0
	fmovsgu	%xcc,	%f12,	%f1
	ba	loop_156
	edge16ln	%g2,	%l2,	%g7
	addccc	%i3,	0x08AF,	%o2
	udiv	%l5,	0x0988,	%i5
loop_156:
	tg	%icc,	0x5
	and	%o5,	0x1E4D,	%l3
	fmovrdne	%l4,	%f22,	%f12
	fbue,a	%fcc3,	loop_157
	sllx	%g3,	0x07,	%i2
	movneg	%icc,	%o6,	%i4
	fble	%fcc3,	loop_158
loop_157:
	fnot2s	%f25,	%f6
	fpsub16	%f24,	%f16,	%f26
	addc	%g1,	0x0FE3,	%i1
loop_158:
	fnegd	%f28,	%f12
	xnor	%l0,	%o0,	%l6
	fmul8x16au	%f15,	%f13,	%f12
	ldub	[%l7 + 0x0D],	%o1
	fandnot2s	%f19,	%f10,	%f28
	fpsub32s	%f15,	%f20,	%f5
	sdiv	%o4,	0x0768,	%g4
	movcs	%icc,	%g5,	%o7
	udivx	%o3,	0x1371,	%i6
	nop
	set	0x6C, %i1
	lduw	[%l7 + %i1],	%i7
	andncc	%l1,	%g6,	%g2
	array32	%l2,	%i0,	%i3
	stb	%g7,	[%l7 + 0x2F]
	addc	%l5,	%o2,	%o5
	fbn,a	%fcc3,	loop_159
	movn	%icc,	%l3,	%i5
	bne,pn	%xcc,	loop_160
	fsrc1s	%f18,	%f12
loop_159:
	addc	%l4,	%g3,	%i2
	subcc	%i4,	%g1,	%o6
loop_160:
	nop
	setx	0x1BD920D560717908,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fmovspos	%icc,	%f7,	%f7
	tvc	%xcc,	0x3
	edge16ln	%l0,	%i1,	%l6
	fbge,a	%fcc0,	loop_161
	edge32l	%o0,	%o4,	%g4
	te	%icc,	0x3
	subcc	%g5,	0x0DF9,	%o1
loop_161:
	fmovdgu	%xcc,	%f27,	%f21
	xorcc	%o7,	0x0F59,	%o3
	edge8ln	%i6,	%l1,	%i7
	fnegd	%f2,	%f28
	brnz	%g6,	loop_162
	umul	%l2,	%g2,	%i0
	fmul8sux16	%f6,	%f0,	%f0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_162:
	bpos	loop_163
	array16	%i3,	%g7,	%l5
	tgu	%xcc,	0x6
	nop
	fitod	%f26,	%f22
loop_163:
	mulscc	%o5,	0x07A7,	%o2
	te	%xcc,	0x0
	stbar
	te	%icc,	0x0
	fmovspos	%xcc,	%f7,	%f2
	fbug,a	%fcc0,	loop_164
	fmovrsgez	%l3,	%f16,	%f18
	bpos	loop_165
	ld	[%l7 + 0x40],	%f26
loop_164:
	srl	%i5,	0x1D,	%l4
	stbar
loop_165:
	stbar
	srlx	%g3,	0x11,	%i4
	movrgz	%i2,	%g1,	%l0
	movrlez	%o6,	0x07D,	%l6
	movre	%o0,	%i1,	%g4
	movrgez	%g5,	%o1,	%o4
	and	%o3,	0x0F53,	%i6
	edge32n	%o7,	%i7,	%g6
	fpsub16	%f2,	%f26,	%f26
	taddcctv	%l1,	%l2,	%g2
	fbne,a	%fcc0,	loop_166
	movle	%icc,	%i0,	%i3
	tcs	%xcc,	0x4
	te	%xcc,	0x4
loop_166:
	fpsub32	%f0,	%f6,	%f2
	alignaddrl	%g7,	%l5,	%o5
	bge,pt	%xcc,	loop_167
	edge8ln	%o2,	%l3,	%i5
	srlx	%l4,	%i4,	%i2
	sll	%g1,	0x08,	%g3
loop_167:
	fornot1	%f0,	%f26,	%f2
	fpsub16s	%f2,	%f19,	%f29
	array32	%l0,	%l6,	%o0
	sethi	0x0C17,	%o6
	fnands	%f0,	%f13,	%f18
	movrlez	%g4,	%g5,	%i1
	tneg	%xcc,	0x5
	fmovrsne	%o1,	%f24,	%f17
	nop
	setx	0x5CF6001580409AD6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	be,a	loop_168
	bl,a	loop_169
	popc	%o4,	%i6
	smul	%o7,	%o3,	%i7
loop_168:
	udivcc	%l1,	0x12F6,	%g6
loop_169:
	xorcc	%g2,	%l2,	%i0
	xorcc	%i3,	%g7,	%l5
	and	%o2,	0x1C3A,	%o5
	udivx	%l3,	0x08CC,	%l4
	fmovd	%f6,	%f12
	fmovdneg	%icc,	%f14,	%f27
	fcmpeq16	%f12,	%f16,	%i4
	fbue	%fcc3,	loop_170
	nop
	setx	loop_171,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8n	%i2,	%g1,	%g3
	fornot2s	%f12,	%f3,	%f3
loop_170:
	bpos,a	%xcc,	loop_172
loop_171:
	movre	%i5,	0x22F,	%l0
	fsrc1	%f4,	%f24
	ta	%xcc,	0x2
loop_172:
	fmovrde	%l6,	%f22,	%f16
	set	0x44, %l4
	lda	[%l7 + %l4] 0x89,	%f19
	st	%f3,	[%l7 + 0x08]
	set	0x78, %l0
	sta	%f23,	[%l7 + %l0] 0x80
	fble,a	%fcc0,	loop_173
	fbl,a	%fcc3,	loop_174
	fpmerge	%f7,	%f11,	%f12
	ldstub	[%l7 + 0x0B],	%o6
loop_173:
	nop
	set	0x50, %i2
	prefetcha	[%l7 + %i2] 0x10,	 0x1
loop_174:
	udivcc	%g5,	0x1D2D,	%o0
	sll	%o1,	0x08,	%i1
	edge8ln	%i6,	%o7,	%o4
	tg	%icc,	0x6
	bge,a,pt	%icc,	loop_175
	alignaddr	%o3,	%l1,	%i7
	tl	%xcc,	0x3
	add	%g6,	0x12CB,	%l2
loop_175:
	sdiv	%i0,	0x0904,	%i3
	fmovsl	%icc,	%f27,	%f24
	fbe,a	%fcc1,	loop_176
	fmovsvc	%icc,	%f1,	%f24
	sub	%g7,	0x1334,	%g2
	sdivcc	%o2,	0x186E,	%l5
loop_176:
	tpos	%icc,	0x6
	fbul	%fcc1,	loop_177
	bl,pt	%xcc,	loop_178
	tneg	%icc,	0x4
	srax	%o5,	0x03,	%l4
loop_177:
	sir	0x1884
loop_178:
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
	ldstub	[%l7 + 0x50],	%i4
	brnz,a	%i2,	loop_180
	nop
	setx	0x20498E2D,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
loop_179:
	move	%xcc,	%g1,	%l3
	bneg,a	%xcc,	loop_181
loop_180:
	movcs	%icc,	%g3,	%i5
	fbne	%fcc3,	loop_182
	sll	%l0,	0x0D,	%o6
loop_181:
	movrgez	%l6,	0x129,	%g4
	nop
	setx	0x0044B0CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
loop_182:
	stbar
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x7C] %asi,	%f23
	fmovsneg	%icc,	%f3,	%f12
	set	0x40, %g4
	prefetcha	[%l7 + %g4] 0x04,	 0x0
	addc	%g5,	%i1,	%o1
	srax	%i6,	0x16,	%o4
	tsubcc	%o7,	0x1B23,	%o3
	fmul8x16al	%f25,	%f23,	%f8
	fornot1	%f0,	%f28,	%f30
	fmovdvc	%icc,	%f17,	%f15
	bcs,a,pn	%xcc,	loop_183
	movvs	%icc,	%l1,	%i7
	movne	%icc,	%l2,	%g6
	stx	%i3,	[%l7 + 0x08]
loop_183:
	taddcc	%i0,	0x1203,	%g2
	fmovrdlz	%g7,	%f16,	%f24
	taddcctv	%o2,	%o5,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l5,	%i4,	%i2
	movvc	%xcc,	%l3,	%g3
	fmovrdgz	%i5,	%f26,	%f20
	addcc	%l0,	%g1,	%o6
	nop
	set	0x2C, %i6
	sth	%l6,	[%l7 + %i6]
	ldsw	[%l7 + 0x50],	%o0
	nop
	fitos	%f14,	%f27
	stb	%g4,	[%l7 + 0x23]
	addc	%i1,	%g5,	%o1
	tleu	%xcc,	0x1
	smulcc	%o4,	%i6,	%o7
	fba	%fcc3,	loop_184
	alignaddr	%o3,	%i7,	%l1
	move	%icc,	%g6,	%l2
	bn,pn	%icc,	loop_185
loop_184:
	taddcc	%i0,	0x00C7,	%i3
	tsubcc	%g2,	%g7,	%o5
	tl	%xcc,	0x2
loop_185:
	edge32	%o2,	%l4,	%i4
	movvc	%icc,	%l5,	%i2
	andncc	%g3,	%i5,	%l0
	stbar
	tn	%icc,	0x6
	tge	%icc,	0x1
	taddcc	%g1,	%l3,	%o6
	nop
	setx	0x00721F0A,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x60] %asi,	 0x0
	bge	loop_186
	tleu	%xcc,	0x3
	fmovda	%xcc,	%f31,	%f2
	bl,a,pn	%xcc,	loop_187
loop_186:
	tpos	%xcc,	0x4
	bvs,a,pt	%icc,	loop_188
	bvc,pt	%icc,	loop_189
loop_187:
	tleu	%icc,	0x6
	edge16l	%g4,	%i1,	%g5
loop_188:
	edge32n	%o0,	%o1,	%o4
loop_189:
	ldsb	[%l7 + 0x2D],	%o7
	smul	%o3,	0x1AFF,	%i7
	brlz	%l1,	loop_190
	movne	%icc,	%i6,	%g6
	fnegd	%f14,	%f8
	taddcc	%i0,	0x09B9,	%l2
loop_190:
	orcc	%i3,	0x06CB,	%g2
	stx	%g7,	[%l7 + 0x30]
	fmovdle	%icc,	%f16,	%f3
	orcc	%o5,	0x035D,	%o2
	umulcc	%l4,	0x1E93,	%l5
	mova	%xcc,	%i2,	%g3
	fmovrslez	%i5,	%f7,	%f27
	fmovrdlz	%l0,	%f30,	%f16
	ldx	[%l7 + 0x70],	%i4
	xorcc	%g1,	0x193C,	%l3
	nop
	fitos	%f7,	%f11
	fstox	%f11,	%f2
	fxtos	%f2,	%f12
	brgz	%l6,	loop_191
	edge16l	%g4,	%i1,	%o6
	alignaddr	%g5,	%o0,	%o4
	fcmpgt16	%f6,	%f0,	%o7
loop_191:
	nop
	setx	loop_192,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%o3,	%i7,	%l1
	sra	%o1,	%g6,	%i6
	fmovrdgz	%l2,	%f24,	%f30
loop_192:
	be,a	%icc,	loop_193
	array8	%i0,	%i3,	%g2
	or	%g7,	%o5,	%l4
	or	%l5,	%o2,	%i2
loop_193:
	sub	%g3,	%i5,	%i4
	edge32l	%g1,	%l0,	%l3
	fba,a	%fcc3,	loop_194
	orcc	%g4,	0x0740,	%l6
	srl	%o6,	0x1B,	%i1
	movrlz	%o0,	0x088,	%o4
loop_194:
	xor	%g5,	0x0FB8,	%o3
	movrne	%i7,	%o7,	%l1
	brlz	%g6,	loop_195
	sub	%o1,	%l2,	%i6
	tge	%xcc,	0x4
	taddcc	%i3,	0x1C3C,	%g2
loop_195:
	stx	%i0,	[%l7 + 0x50]
	fors	%f31,	%f5,	%f20
	ble,a,pn	%xcc,	loop_196
	fzeros	%f24
	fcmpne16	%f0,	%f12,	%g7
	array8	%o5,	%l5,	%o2
loop_196:
	tneg	%xcc,	0x4
	fmovrdlz	%l4,	%f12,	%f10
	udiv	%i2,	0x04BE,	%i5
	andcc	%g3,	0x1285,	%i4
	bgu,pn	%xcc,	loop_197
	brz	%l0,	loop_198
	addc	%l3,	0x1490,	%g4
	movrgez	%g1,	0x2B9,	%o6
loop_197:
	movvc	%icc,	%l6,	%o0
loop_198:
	fand	%f22,	%f14,	%f8
	std	%f28,	[%l7 + 0x60]
	fpadd16s	%f2,	%f0,	%f9
	mulscc	%i1,	%o4,	%o3
	set	0x0C, %o0
	ldsba	[%l7 + %o0] 0x89,	%i7
	orcc	%g5,	0x0D69,	%l1
	edge32n	%g6,	%o7,	%o1
	tneg	%xcc,	0x3
	brgz,a	%i6,	loop_199
	move	%xcc,	%i3,	%l2
	fmovd	%f28,	%f18
	fbul	%fcc1,	loop_200
loop_199:
	fbu	%fcc2,	loop_201
	alignaddr	%i0,	%g7,	%g2
	movg	%icc,	%l5,	%o2
loop_200:
	alignaddrl	%o5,	%i2,	%i5
loop_201:
	fbug,a	%fcc1,	loop_202
	tge	%xcc,	0x7
	fnegd	%f14,	%f10
	taddcctv	%g3,	%l4,	%i4
loop_202:
	bneg,a,pn	%icc,	loop_203
	taddcc	%l0,	%l3,	%g1
	tne	%icc,	0x0
	fbu	%fcc0,	loop_204
loop_203:
	orcc	%g4,	0x0F17,	%l6
	fnand	%f26,	%f22,	%f6
	xorcc	%o0,	%i1,	%o6
loop_204:
	tcc	%xcc,	0x4
	subc	%o3,	0x0B6D,	%o4
	brgz,a	%g5,	loop_205
	fpadd32	%f24,	%f8,	%f18
	udiv	%l1,	0x1150,	%g6
	brz,a	%i7,	loop_206
loop_205:
	ldx	[%l7 + 0x48],	%o1
	tg	%icc,	0x4
	tsubcctv	%i6,	%i3,	%l2
loop_206:
	udivx	%i0,	0x0D54,	%o7
	taddcctv	%g7,	%g2,	%o2
	tsubcctv	%o5,	%l5,	%i2
	fone	%f6
	udivcc	%i5,	0x0E1D,	%g3
	fnegs	%f9,	%f24
	tne	%icc,	0x4
	tcc	%xcc,	0x1
	stx	%l4,	[%l7 + 0x18]
	bn,pn	%icc,	loop_207
	srl	%i4,	%l3,	%g1
	bn,a,pt	%icc,	loop_208
	brgz,a	%g4,	loop_209
loop_207:
	fone	%f0
	andn	%l6,	0x1C4E,	%o0
loop_208:
	fcmpne32	%f20,	%f24,	%l0
loop_209:
	call	loop_210
	be,a	%icc,	loop_211
	fors	%f26,	%f27,	%f22
	set	0x79, %o5
	lduba	[%l7 + %o5] 0x89,	%i1
loop_210:
	swap	[%l7 + 0x38],	%o3
loop_211:
	fmul8sux16	%f26,	%f26,	%f8
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o4
	movvc	%xcc,	%g5,	%o6
	fmovdl	%icc,	%f7,	%f5
	fmul8x16	%f30,	%f28,	%f18
	ble,pn	%icc,	loop_212
	sra	%g6,	0x06,	%i7
	movle	%icc,	%l1,	%o1
	for	%f10,	%f8,	%f0
loop_212:
	movgu	%icc,	%i6,	%l2
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f16
	fxtod	%f16,	%f6
	fxnors	%f2,	%f4,	%f24
	fcmpgt16	%f12,	%f24,	%i3
	fmovse	%xcc,	%f22,	%f9
	movle	%xcc,	%i0,	%g7
	edge16l	%g2,	%o7,	%o2
	tn	%icc,	0x5
	lduh	[%l7 + 0x58],	%o5
	nop
	setx	0x36BD02D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f29
	movrlz	%i2,	%i5,	%l5
	sir	0x0E21
	fsrc2s	%f10,	%f6
	sra	%g3,	%i4,	%l3
	movpos	%icc,	%g1,	%l4
	mulx	%l6,	0x1C9F,	%g4
	srl	%o0,	%l0,	%i1
	fnors	%f20,	%f11,	%f3
	sth	%o4,	[%l7 + 0x3E]
	movvc	%icc,	%o3,	%g5
	smul	%g6,	%o6,	%i7
	udivx	%o1,	0x129E,	%i6
	fmovsvc	%icc,	%f15,	%f19
	srax	%l2,	0x0F,	%l1
	fmul8x16au	%f0,	%f30,	%f22
	nop
	setx	loop_213,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivcc	%i0,	0x14F9,	%i3
	edge32n	%g2,	%o7,	%g7
	xorcc	%o2,	%o5,	%i2
loop_213:
	nop
	setx loop_214, %l0, %l1
	jmpl %l1, %l5
	andn	%g3,	0x1DEF,	%i5
	tle	%xcc,	0x1
	array16	%l3,	%g1,	%l4
loop_214:
	fones	%f1
	tn	%icc,	0x0
	sllx	%i4,	0x00,	%l6
	fmovrdgz	%o0,	%f20,	%f18
	ba,pn	%xcc,	loop_215
	sllx	%l0,	%g4,	%i1
	fbuge	%fcc3,	loop_216
	andncc	%o4,	%g5,	%o3
loop_215:
	fpadd32	%f6,	%f14,	%f12
	fmovde	%xcc,	%f25,	%f22
loop_216:
	fmuld8sux16	%f9,	%f5,	%f22
	edge8n	%o6,	%g6,	%i7
	udiv	%i6,	0x16B0,	%o1
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movl	%icc,	%l1,	%l2
	movre	%i0,	0x35C,	%g2
	tsubcc	%i3,	%o7,	%g7
	edge16n	%o2,	%o5,	%i2
	bne	loop_217
	tpos	%icc,	0x3
	fmovdneg	%icc,	%f13,	%f0
	sdiv	%g3,	0x12B7,	%l5
loop_217:
	nop
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7B] %asi,	%l3
	tsubcctv	%i5,	0x0106,	%g1
	xnor	%i4,	0x0BF1,	%l6
	set	0x24, %g2
	ldswa	[%l7 + %g2] 0x11,	%l4
	sdiv	%l0,	0x1D20,	%o0
	fmovde	%xcc,	%f23,	%f21
	array8	%g4,	%o4,	%g5
	fbug	%fcc0,	loop_218
	orncc	%o3,	%o6,	%i1
	fbo,a	%fcc3,	loop_219
	mulx	%i7,	0x1CC5,	%g6
loop_218:
	addccc	%o1,	%i6,	%l1
	ble,a,pt	%icc,	loop_220
loop_219:
	movrgz	%i0,	0x11B,	%g2
	movrgz	%l2,	0x0ED,	%i3
	flush	%l7 + 0x10
loop_220:
	movpos	%icc,	%g7,	%o7
	umul	%o5,	0x11B3,	%i2
	movn	%xcc,	%o2,	%g3
	mulscc	%l5,	0x1F2C,	%i5
	edge16n	%l3,	%i4,	%g1
	srax	%l4,	%l6,	%o0
	subccc	%l0,	%g4,	%g5
	movvc	%icc,	%o3,	%o4
	ldsw	[%l7 + 0x14],	%o6
	fmovsa	%xcc,	%f25,	%f4
	bcs	%icc,	loop_221
	fsrc2	%f28,	%f24
	tn	%xcc,	0x4
	fmovrdgez	%i7,	%f14,	%f24
loop_221:
	membar	0x0D
	nop
	fitod	%f27,	%f20
	nop
	setx loop_222, %l0, %l1
	jmpl %l1, %i1
	ldd	[%l7 + 0x18],	%o0
	sdivx	%i6,	0x04C2,	%l1
	brnz,a	%g6,	loop_223
loop_222:
	bl,pn	%icc,	loop_224
	udivx	%g2,	0x182E,	%i0
	udiv	%l2,	0x1253,	%g7
loop_223:
	lduh	[%l7 + 0x0E],	%o7
loop_224:
	bneg,a,pt	%xcc,	loop_225
	subcc	%i3,	0x017E,	%o5
	fmovdvc	%xcc,	%f0,	%f18
	array16	%o2,	%i2,	%g3
loop_225:
	sra	%i5,	%l3,	%l5
	movpos	%icc,	%g1,	%i4
	udiv	%l6,	0x1EA3,	%o0
	tpos	%xcc,	0x0
	taddcc	%l0,	%g4,	%l4
	or	%o3,	0x0DA4,	%g5
	ldstub	[%l7 + 0x5A],	%o4
	umul	%i7,	%i1,	%o1
	sra	%i6,	%o6,	%l1
	array16	%g6,	%i0,	%g2
	sdivx	%g7,	0x18B6,	%l2
	and	%o7,	0x1418,	%i3
	swap	[%l7 + 0x14],	%o2
	nop
	fitos	%f8,	%f7
	fstox	%f7,	%f30
	fxtos	%f30,	%f22
	fpsub32s	%f7,	%f1,	%f19
	srax	%i2,	%o5,	%g3
	ble,pt	%icc,	loop_226
	fpadd32s	%f31,	%f16,	%f5
	mulx	%l3,	%l5,	%g1
	tleu	%icc,	0x1
loop_226:
	nop
	wr	%g0,	0x89,	%asi
	stha	%i5,	[%l7 + 0x16] %asi
	xorcc	%i4,	0x03EB,	%o0
	nop
	fitod	%f27,	%f18
	tge	%icc,	0x3
	wr	%g0,	0x81,	%asi
	sta	%f27,	[%l7 + 0x30] %asi
	subccc	%l6,	0x13D1,	%l0
	fbn,a	%fcc1,	loop_227
	tpos	%xcc,	0x2
	xorcc	%l4,	0x104B,	%o3
	brgz	%g4,	loop_228
loop_227:
	nop
	setx	0x99851684B1F30A85,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xDF56C9EF99DF0145,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fdivd	%f0,	%f16,	%f28
	movrgez	%o4,	0x123,	%i7
	edge32n	%g5,	%o1,	%i6
loop_228:
	tsubcc	%i1,	0x1E03,	%l1
	umul	%o6,	%g6,	%i0
	fmul8ulx16	%f18,	%f24,	%f24
	sdiv	%g2,	0x05F0,	%l2
	stbar
	movvc	%xcc,	%o7,	%g7
	nop
	setx loop_229, %l0, %l1
	jmpl %l1, %i3
	fsrc2	%f14,	%f20
	fbge,a	%fcc3,	loop_230
	edge32n	%i2,	%o5,	%g3
loop_229:
	movrgez	%l3,	%l5,	%g1
	bcc,a,pn	%icc,	loop_231
loop_230:
	movpos	%icc,	%o2,	%i4
	mulscc	%o0,	%i5,	%l6
	bcs	%xcc,	loop_232
loop_231:
	nop
	setx	loop_233,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	call	loop_234
	nop
	setx	loop_235,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_232:
	bg	%xcc,	loop_236
loop_233:
	subccc	%l0,	%o3,	%l4
loop_234:
	srlx	%g4,	0x0D,	%i7
loop_235:
	tvc	%icc,	0x3
loop_236:
	nop
	setx	loop_237,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sth	%o4,	[%l7 + 0x38]
	movcc	%icc,	%o1,	%g5
	tg	%xcc,	0x4
loop_237:
	fbu,a	%fcc3,	loop_238
	tl	%icc,	0x2
	lduw	[%l7 + 0x78],	%i6
	subccc	%l1,	0x10F8,	%o6
loop_238:
	tle	%icc,	0x6
	fmovrdlez	%i1,	%f10,	%f12
	bvs	loop_239
	fabss	%f1,	%f2
	array16	%i0,	%g2,	%g6
	taddcc	%l2,	0x1B7A,	%o7
loop_239:
	fpadd16	%f14,	%f16,	%f20
	sllx	%g7,	%i3,	%o5
	subcc	%i2,	0x0566,	%l3
	fnegs	%f19,	%f23
	tvs	%icc,	0x7
	sub	%g3,	%g1,	%o2
	fone	%f12
	mova	%xcc,	%i4,	%l5
	edge8	%i5,	%l6,	%o0
	movgu	%xcc,	%o3,	%l0
	alignaddrl	%l4,	%g4,	%o4
	sdivcc	%i7,	0x1A3E,	%g5
	tle	%xcc,	0x0
	tpos	%xcc,	0x6
	mulscc	%o1,	%l1,	%o6
	movrlez	%i6,	0x0A4,	%i0
	bcs	%icc,	loop_240
	stb	%i1,	[%l7 + 0x5D]
	edge8n	%g2,	%l2,	%o7
	tgu	%xcc,	0x5
loop_240:
	popc	0x1B1D,	%g7
	wr	%g0,	0x11,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	fbue	%fcc1,	loop_241
	fxnor	%f24,	%f16,	%f10
	set	0x28, %o7
	ldswa	[%l7 + %o7] 0x14,	%g6
loop_241:
	subccc	%o5,	0x15B3,	%i3
	flush	%l7 + 0x44
	movl	%icc,	%i2,	%g3
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%l3
	ldub	[%l7 + 0x31],	%g1
	fmovdl	%xcc,	%f1,	%f19
	fnand	%f24,	%f2,	%f24
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x68] %asi,	%i4
	ldsb	[%l7 + 0x73],	%o2
	fpadd16	%f6,	%f18,	%f10
	tsubcctv	%i5,	%l5,	%o0
	fba,a	%fcc3,	loop_242
	xnorcc	%l6,	%l0,	%l4
	edge32	%g4,	%o4,	%o3
	fmovdg	%icc,	%f16,	%f16
loop_242:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	movleu	%xcc,	%i7,	%o1
	fbge,a	%fcc3,	loop_243
	and	%l1,	%o6,	%g5
	sir	0x0AA6
	fba,a	%fcc3,	loop_244
loop_243:
	bleu,a,pn	%icc,	loop_245
	subcc	%i0,	0x0B71,	%i6
	lduw	[%l7 + 0x78],	%g2
loop_244:
	alignaddr	%i1,	%o7,	%g7
loop_245:
	tge	%icc,	0x0
	andcc	%l2,	0x0E98,	%o5
	tsubcc	%i3,	0x1936,	%i2
	bcc	%xcc,	loop_246
	tgu	%xcc,	0x0
	edge16	%g6,	%g3,	%l3
	tcc	%icc,	0x4
loop_246:
	srl	%i4,	%g1,	%i5
	be,pn	%icc,	loop_247
	edge8n	%o2,	%l5,	%l6
	nop
	set	0x4C, %g3
	ldstub	[%l7 + %g3],	%l0
	fmovrde	%l4,	%f8,	%f10
loop_247:
	std	%f14,	[%l7 + 0x18]
	edge16ln	%o0,	%o4,	%g4
	nop
	setx	0xE6AA96C3601B30BD,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xFE8B973DA7C981F8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f24,	%f10
	fcmpne16	%f6,	%f4,	%i7
	edge16ln	%o3,	%o1,	%o6
	fnand	%f26,	%f20,	%f24
	taddcc	%l1,	0x0D9F,	%i0
	addc	%g5,	%g2,	%i6
	fandnot1	%f8,	%f26,	%f8
	tcc	%xcc,	0x5
	fbg,a	%fcc1,	loop_248
	andn	%i1,	%g7,	%l2
	edge8ln	%o5,	%i3,	%i2
	edge8l	%g6,	%g3,	%o7
loop_248:
	fbe,a	%fcc2,	loop_249
	array16	%i4,	%g1,	%l3
	stx	%i5,	[%l7 + 0x40]
	wr	%g0,	0x81,	%asi
	stba	%l5,	[%l7 + 0x30] %asi
loop_249:
	movleu	%xcc,	%o2,	%l0
	subccc	%l6,	%l4,	%o4
	brlz,a	%g4,	loop_250
	prefetch	[%l7 + 0x10],	 0x3
	fbul	%fcc3,	loop_251
	ldd	[%l7 + 0x38],	%f22
loop_250:
	fsrc2s	%f21,	%f11
	edge8	%o0,	%i7,	%o3
loop_251:
	tn	%icc,	0x2
	ldsh	[%l7 + 0x32],	%o1
	edge8ln	%o6,	%i0,	%l1
	mova	%xcc,	%g5,	%g2
	ta	%xcc,	0x6
	stw	%i1,	[%l7 + 0x38]
	fpsub32s	%f17,	%f21,	%f29
	fornot2s	%f31,	%f17,	%f15
	movpos	%icc,	%g7,	%i6
	lduw	[%l7 + 0x3C],	%l2
	movrlz	%i3,	0x380,	%i2
	sth	%g6,	[%l7 + 0x18]
	edge16n	%o5,	%o7,	%i4
	tcc	%xcc,	0x4
	move	%xcc,	%g1,	%g3
	subccc	%i5,	0x1A01,	%l3
	movrgz	%l5,	%o2,	%l0
	tcs	%xcc,	0x7
	xnor	%l4,	0x10E2,	%o4
	popc	0x110A,	%g4
	and	%o0,	0x0149,	%l6
	edge16ln	%i7,	%o3,	%o1
	edge32	%o6,	%l1,	%i0
	fmovrde	%g2,	%f26,	%f30
	sdiv	%i1,	0x0332,	%g7
	xorcc	%i6,	0x044C,	%l2
	tcc	%icc,	0x0
	andcc	%g5,	0x1DDE,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%g6,	%o5
	edge16	%i3,	%o7,	%i4
	bvc,a	%icc,	loop_252
	fzeros	%f23
	ba,a,pt	%icc,	loop_253
	movrgz	%g1,	0x3BF,	%g3
loop_252:
	mulscc	%l3,	0x14D3,	%l5
	movrlez	%i5,	0x394,	%o2
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
	movvs	%icc,	%l4,	%l0
	subc	%g4,	%o4,	%o0
	tcs	%icc,	0x0
loop_254:
	nop
	wr	%g0,	0x80,	%asi
	stha	%l6,	[%l7 + 0x4E] %asi
	be,pn	%icc,	loop_255
	nop
	fitos	%f6,	%f7
	fstox	%f7,	%f26
	fxtos	%f26,	%f31
	fmovdne	%xcc,	%f23,	%f21
	fmovsgu	%xcc,	%f1,	%f20
loop_255:
	fcmpne32	%f24,	%f26,	%i7
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x22] %asi,	%o1
	fbue,a	%fcc2,	loop_256
	tgu	%icc,	0x6
	edge16l	%o6,	%o3,	%i0
	array16	%g2,	%l1,	%g7
loop_256:
	subc	%i6,	0x0061,	%l2
	andcc	%i1,	%g5,	%g6
	edge8l	%i2,	%o5,	%o7
	mulx	%i4,	%g1,	%g3
	movg	%xcc,	%l3,	%l5
	umul	%i5,	0x179E,	%o2
	movle	%icc,	%l4,	%l0
	te	%xcc,	0x4
	nop
	setx loop_257, %l0, %l1
	jmpl %l1, %g4
	or	%o4,	0x127C,	%o0
	nop
	setx	0xF07876D3,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	fba	%fcc3,	loop_258
loop_257:
	andn	%i3,	0x06E1,	%l6
	srl	%o1,	0x01,	%o6
	movrlez	%o3,	%i7,	%g2
loop_258:
	fnot2	%f10,	%f0
	popc	%i0,	%l1
	array8	%g7,	%l2,	%i6
	nop
	setx	0xCDA063E3A7AD6928,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xFD30C946DFD67948,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f12,	%f10
	bleu,a	%icc,	loop_259
	subccc	%g5,	%i1,	%g6
	stb	%i2,	[%l7 + 0x17]
	smulcc	%o7,	0x009E,	%i4
loop_259:
	tpos	%xcc,	0x3
	edge16n	%o5,	%g1,	%g3
	movg	%icc,	%l3,	%i5
	fbe,a	%fcc1,	loop_260
	fxnors	%f13,	%f2,	%f8
	sdivcc	%o2,	0x049B,	%l4
	brnz	%l5,	loop_261
loop_260:
	fsrc2	%f28,	%f16
	ldsb	[%l7 + 0x2A],	%l0
	tn	%icc,	0x7
loop_261:
	andn	%g4,	0x141E,	%o4
	fmovsa	%icc,	%f29,	%f23
	movrgez	%o0,	0x1F5,	%l6
	edge32ln	%i3,	%o6,	%o1
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x30] %asi,	%o3
	sdivcc	%i7,	0x1F5B,	%i0
	nop
	fitos	%f10,	%f19
	fstox	%f19,	%f8
	fxtos	%f8,	%f1
	bgu,a	%icc,	loop_262
	edge8	%l1,	%g7,	%l2
	tl	%icc,	0x3
	xor	%i6,	%g5,	%i1
loop_262:
	movne	%icc,	%g6,	%i2
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f8
	fxtod	%f8,	%f30
	ble	loop_263
	tsubcctv	%o7,	0x00A6,	%i4
	srlx	%g2,	%o5,	%g3
	mulscc	%l3,	0x1BD4,	%g1
loop_263:
	nop
	set	0x40, %l1
	ldda	[%l7 + %l1] 0xea,	%i4
	smul	%o2,	0x0DDD,	%l5
	stw	%l4,	[%l7 + 0x38]
	wr	%g0,	0x23,	%asi
	stba	%l0,	[%l7 + 0x64] %asi
	membar	#Sync
	sub	%o4,	%o0,	%l6
	udivx	%g4,	0x073A,	%i3
	movn	%xcc,	%o1,	%o3
	edge16ln	%i7,	%o6,	%i0
	nop
	setx	0xB6BFF205D91D5286,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xF25D891FD68E89AD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f4,	%f18
	tcc	%icc,	0x2
	fmovs	%f21,	%f10
	stx	%l1,	[%l7 + 0x48]
	tgu	%xcc,	0x4
	udiv	%g7,	0x1D8F,	%i6
	tvc	%icc,	0x7
	set	0x70, %l6
	ldda	[%l7 + %l6] 0x81,	%l2
	movrne	%g5,	0x21B,	%g6
	fandnot2	%f30,	%f12,	%f14
	nop
	setx	loop_264,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bgu,a,pn	%icc,	loop_265
	udivcc	%i2,	0x00CB,	%i1
	sir	0x021F
loop_264:
	fblg,a	%fcc2,	loop_266
loop_265:
	bcs,a,pn	%xcc,	loop_267
	srlx	%i4,	0x1A,	%g2
	fbue,a	%fcc1,	loop_268
loop_266:
	bvs	loop_269
loop_267:
	xorcc	%o7,	0x1FF0,	%g3
	andncc	%l3,	%g1,	%o5
loop_268:
	ta	%xcc,	0x7
loop_269:
	tgu	%xcc,	0x1
	fxnors	%f22,	%f21,	%f24
	fornot2s	%f14,	%f25,	%f23
	sra	%i5,	%o2,	%l5
	edge16	%l0,	%o4,	%l4
	edge32l	%o0,	%l6,	%i3
	movrgz	%o1,	%o3,	%g4
	or	%i7,	%o6,	%i0
	tgu	%icc,	0x3
	xnor	%g7,	%i6,	%l2
	fpadd32	%f10,	%f0,	%f30
	tge	%icc,	0x1
	subcc	%l1,	%g5,	%g6
	membar	0x18
	alignaddrl	%i2,	%i4,	%g2
	edge16n	%o7,	%g3,	%i1
	fnors	%f3,	%f27,	%f10
	edge16n	%l3,	%o5,	%g1
	fbuge	%fcc3,	loop_270
	movrgz	%i5,	%o2,	%l5
	edge32n	%o4,	%l4,	%l0
	fbug,a	%fcc2,	loop_271
loop_270:
	nop
	setx	0xA9AA455967102B93,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD8BE4C41ED8D1BDE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f0,	%f6
	fmovrdlz	%l6,	%f30,	%f8
	fmovdneg	%icc,	%f21,	%f18
loop_271:
	nop
	wr	%g0,	0x2a,	%asi
	stxa	%o0,	[%l7 + 0x50] %asi
	membar	#Sync
	orncc	%i3,	0x1CF3,	%o1
	xnor	%g4,	%i7,	%o6
	fandnot1	%f16,	%f20,	%f6
	tgu	%icc,	0x3
	subc	%o3,	%i0,	%i6
	ba	loop_272
	tne	%xcc,	0x7
	addcc	%g7,	0x00E0,	%l2
	movrlez	%g5,	%g6,	%i2
loop_272:
	fornot1s	%f13,	%f23,	%f18
	nop
	setx	0x4D1736F4806E896B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	orncc	%l1,	0x09BE,	%g2
	movne	%xcc,	%i4,	%o7
	movrlz	%g3,	%i1,	%o5
	tcc	%icc,	0x7
	call	loop_273
	sir	0x0565
	nop
	setx	0xF05C9CA8,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	tge	%xcc,	0x7
loop_273:
	xor	%l3,	0x108D,	%i5
	st	%f10,	[%l7 + 0x70]
	fbue,a	%fcc1,	loop_274
	xorcc	%o2,	%l5,	%o4
	array8	%l4,	%l0,	%l6
	fbo	%fcc3,	loop_275
loop_274:
	fmovrde	%o0,	%f20,	%f8
	tl	%xcc,	0x2
	movgu	%icc,	%g1,	%i3
loop_275:
	andcc	%o1,	0x0FA5,	%g4
	ta	%xcc,	0x0
	addcc	%o6,	0x0544,	%i7
	tvc	%icc,	0x5
	fbule,a	%fcc3,	loop_276
	edge8ln	%i0,	%i6,	%g7
	brlz,a	%l2,	loop_277
	smul	%o3,	%g6,	%i2
loop_276:
	fzeros	%f5
	or	%g5,	%g2,	%i4
loop_277:
	swap	[%l7 + 0x54],	%o7
	movrgz	%g3,	0x37A,	%l1
	addccc	%i1,	%l3,	%i5
	set	0x78, %g1
	sta	%f24,	[%l7 + %g1] 0x0c
	movre	%o5,	0x14B,	%o2
	fmovdvs	%icc,	%f13,	%f18
	stb	%l5,	[%l7 + 0x7F]
	array8	%l4,	%l0,	%o4
	tleu	%xcc,	0x1
	array32	%l6,	%g1,	%i3
	edge8l	%o0,	%g4,	%o6
	ldub	[%l7 + 0x24],	%o1
	fandnot1	%f20,	%f8,	%f4
	udivcc	%i0,	0x0856,	%i6
	subcc	%i7,	0x1C7F,	%l2
	fmovdcc	%icc,	%f18,	%f29
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g7,	%g6
	edge8n	%i2,	%g5,	%o3
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	fmovsl	%xcc,	%f16,	%f4
	edge32l	%i4,	%g2,	%g3
	fmovrdlz	%o7,	%f28,	%f4
	fand	%f26,	%f26,	%f14
	swap	[%l7 + 0x74],	%i1
	brnz	%l3,	loop_278
	be	loop_279
	mulx	%l1,	%o5,	%i5
	mulx	%o2,	0x0D97,	%l4
loop_278:
	subcc	%l5,	0x1C57,	%l0
loop_279:
	nop
	set	0x56, %o4
	ldsh	[%l7 + %o4],	%l6
	array32	%o4,	%g1,	%i3
	or	%o0,	0x1F40,	%g4
	edge32l	%o6,	%o1,	%i0
	array32	%i6,	%i7,	%l2
	move	%icc,	%g6,	%i2
	mulscc	%g7,	0x06AB,	%g5
	fba	%fcc3,	loop_280
	fble	%fcc0,	loop_281
	movcs	%icc,	%i4,	%o3
	nop
	setx	0x62F8E37031AF3088,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f24
loop_280:
	alignaddrl	%g2,	%g3,	%o7
loop_281:
	fble,a	%fcc3,	loop_282
	bne,a,pn	%xcc,	loop_283
	tge	%xcc,	0x1
	edge32ln	%l3,	%i1,	%l1
loop_282:
	movvc	%xcc,	%i5,	%o5
loop_283:
	bne,a,pn	%xcc,	loop_284
	sdivcc	%o2,	0x14F9,	%l4
	tn	%icc,	0x5
	nop
	setx	0xCA078E5B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xD35CDFE2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fmuls	%f30,	%f18,	%f22
loop_284:
	movrne	%l5,	0x049,	%l0
	movrlz	%l6,	%g1,	%i3
	movn	%xcc,	%o4,	%o0
	fornot2s	%f14,	%f8,	%f8
	nop
	setx	0xF98FFC125F09666B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x4856375988644D24,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f4,	%f30
	brlz	%g4,	loop_285
	srax	%o6,	0x0F,	%i0
	tge	%xcc,	0x6
	bshuffle	%f4,	%f30,	%f16
loop_285:
	edge16ln	%i6,	%o1,	%l2
	bcs,a,pn	%xcc,	loop_286
	movvs	%icc,	%i7,	%i2
	bcs,a,pt	%xcc,	loop_287
	edge16l	%g7,	%g5,	%i4
loop_286:
	andncc	%o3,	%g6,	%g2
	alignaddrl	%g3,	%l3,	%i1
loop_287:
	edge32l	%l1,	%o7,	%o5
	membar	0x11
	call	loop_288
	movleu	%icc,	%o2,	%i5
	edge8n	%l4,	%l5,	%l6
	srlx	%l0,	%g1,	%i3
loop_288:
	edge8	%o4,	%g4,	%o6
	flush	%l7 + 0x24
	addcc	%i0,	%o0,	%i6
	movge	%icc,	%o1,	%i7
	membar	#Sync
	set	0x40, %g7
	ldda	[%l7 + %g7] 0xf1,	%f16
	fmovsl	%xcc,	%f29,	%f29
	tne	%icc,	0x3
	movvc	%icc,	%l2,	%g7
	fbue,a	%fcc0,	loop_289
	ba,a	%xcc,	loop_290
	edge32l	%i2,	%i4,	%g5
	tsubcctv	%g6,	%g2,	%g3
loop_289:
	fone	%f24
loop_290:
	std	%f0,	[%l7 + 0x18]
	tg	%icc,	0x2
	ld	[%l7 + 0x1C],	%f30
	edge8l	%o3,	%i1,	%l1
	bvc,a,pn	%icc,	loop_291
	fmul8ulx16	%f30,	%f0,	%f26
	udiv	%o7,	0x1C38,	%o5
	sra	%o2,	0x16,	%i5
loop_291:
	fmovda	%xcc,	%f31,	%f19
	movl	%icc,	%l3,	%l5
	edge8	%l6,	%l4,	%l0
	movgu	%xcc,	%i3,	%g1
	xorcc	%o4,	0x1B1A,	%g4
	nop
	setx	0xF8066C60006247F7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	sir	0x0B81
	fornot2s	%f24,	%f19,	%f9
	fmovrdgz	%i0,	%f24,	%f20
	addccc	%o0,	0x0F29,	%o6
	udivcc	%o1,	0x1C69,	%i7
	movl	%xcc,	%l2,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x7
	edge32	%i6,	%i2,	%g5
	brlez,a	%i4,	loop_292
	nop
	setx	0x70771D4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	fcmple32	%f14,	%f8,	%g2
	sub	%g6,	0x0841,	%o3
loop_292:
	movne	%xcc,	%g3,	%l1
	fmovsn	%xcc,	%f1,	%f4
	tge	%xcc,	0x3
	tsubcc	%i1,	0x07B6,	%o5
	edge32	%o7,	%i5,	%l3
	movcs	%xcc,	%o2,	%l6
	movcs	%icc,	%l5,	%l0
	fmovsge	%icc,	%f2,	%f12
	array8	%i3,	%g1,	%o4
	movne	%icc,	%l4,	%g4
	tle	%xcc,	0x1
	srlx	%o0,	0x01,	%o6
	set	0x78, %o3
	stha	%i0,	[%l7 + %o3] 0x0c
	tg	%xcc,	0x2
	mova	%xcc,	%o1,	%l2
	ldstub	[%l7 + 0x45],	%i7
	array8	%g7,	%i2,	%i6
	movpos	%icc,	%g5,	%i4
	fpsub16	%f2,	%f28,	%f16
	edge8l	%g2,	%o3,	%g3
	popc	0x1709,	%g6
	bge,a	loop_293
	fnot2	%f26,	%f14
	sllx	%i1,	0x1A,	%o5
	mulx	%l1,	0x1304,	%i5
loop_293:
	xor	%l3,	%o2,	%o7
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] %asi,	%l5,	%l0
	brgez,a	%i3,	loop_294
	movvc	%xcc,	%g1,	%o4
	fpadd32	%f30,	%f20,	%f18
	fbne	%fcc3,	loop_295
loop_294:
	movneg	%xcc,	%l6,	%g4
	nop
	setx	0x1062C9B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	orncc	%o0,	%o6,	%i0
loop_295:
	movpos	%xcc,	%o1,	%l2
	movleu	%xcc,	%i7,	%g7
	add	%i2,	%i6,	%g5
	bne,pt	%icc,	loop_296
	taddcc	%i4,	0x1600,	%l4
	array32	%o3,	%g3,	%g6
	brlz,a	%i1,	loop_297
loop_296:
	bcc	%icc,	loop_298
	or	%o5,	%g2,	%l1
	sethi	0x16DA,	%i5
loop_297:
	andn	%l3,	0x0890,	%o2
loop_298:
	sll	%l5,	0x17,	%l0
	tvs	%icc,	0x2
	mulscc	%o7,	%g1,	%o4
	sdiv	%i3,	0x16BB,	%l6
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x76] %asi,	%g4
	tl	%xcc,	0x4
	set	0x40, %o1
	ldxa	[%l7 + %o1] 0x14,	%o0
	taddcctv	%i0,	0x15B4,	%o6
	sir	0x18F5
	tl	%xcc,	0x1
	xorcc	%l2,	0x0F79,	%i7
	edge16l	%o1,	%i2,	%g7
	fblg	%fcc2,	loop_299
	tneg	%icc,	0x0
	addcc	%g5,	%i4,	%l4
	fmovdne	%icc,	%f18,	%f23
loop_299:
	nop
	setx	0x6D45FC7D8ABDA7CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0xF11097DCECCAFAFB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f28,	%f12
	xnorcc	%i6,	0x17B6,	%g3
	fmovdleu	%icc,	%f14,	%f2
	fmovdgu	%icc,	%f2,	%f13
	stx	%g6,	[%l7 + 0x38]
	tn	%icc,	0x4
	andcc	%o3,	0x1162,	%i1
	std	%f28,	[%l7 + 0x08]
	nop
	fitod	%f8,	%f20
	fdtox	%f20,	%f16
	andn	%o5,	0x04AC,	%l1
	fexpand	%f10,	%f2
	fmovdgu	%icc,	%f3,	%f2
	fxors	%f16,	%f2,	%f11
	swap	[%l7 + 0x14],	%i5
	brz,a	%l3,	loop_300
	nop
	fitos	%f14,	%f28
	fstox	%f28,	%f28
	sllx	%o2,	0x0A,	%l5
	movge	%xcc,	%l0,	%g2
loop_300:
	ldd	[%l7 + 0x50],	%f0
	fbge	%fcc2,	loop_301
	sll	%g1,	0x1D,	%o7
	fmovsvc	%xcc,	%f29,	%f2
	edge16n	%o4,	%l6,	%g4
loop_301:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x60] %asi,	%o0
	tle	%icc,	0x1
	ble	loop_302
	movrne	%i0,	0x3BD,	%i3
	nop
	setx	0xFAD5951C105F6F0B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	te	%icc,	0x6
loop_302:
	nop
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x2
	edge16l	%l2,	%o1,	%i7
	smulcc	%i2,	0x06D2,	%g5
	bcc,a,pn	%xcc,	loop_303
	sub	%i4,	0x187E,	%g7
	xor	%l4,	%g3,	%g6
	movcs	%xcc,	%o3,	%i1
loop_303:
	sth	%o5,	[%l7 + 0x40]
	fmovrslez	%i6,	%f18,	%f4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l1
	casxa	[%l6] 0x89,	%l1,	%l3
	ldub	[%l7 + 0x3C],	%o2
	fzero	%f2
	fpack16	%f8,	%f9
	xnor	%i5,	%l0,	%l5
	nop
	setx	0x7ADB39F0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	fsqrts	%f3,	%f31
	nop
	fitos	%f25,	%f0
	fcmpgt32	%f6,	%f4,	%g1
	taddcctv	%g2,	%o4,	%l6
	sir	0x0F88
	sllx	%o7,	0x1E,	%g4
	srax	%i0,	0x0C,	%o0
	edge8ln	%o6,	%i3,	%o1
	tvs	%icc,	0x4
	sdivx	%i7,	0x0162,	%i2
	tneg	%xcc,	0x3
	movge	%xcc,	%g5,	%i4
	te	%icc,	0x4
	edge8	%l2,	%g7,	%g3
	xorcc	%l4,	%g6,	%o3
	fornot2s	%f31,	%f13,	%f3
	tsubcc	%o5,	0x041F,	%i6
	sll	%l1,	0x0C,	%i1
	fmovrse	%o2,	%f5,	%f26
	tleu	%icc,	0x0
	xorcc	%l3,	%l0,	%i5
	edge8ln	%g1,	%g2,	%o4
	edge8l	%l6,	%o7,	%l5
	fbug,a	%fcc3,	loop_304
	edge32	%g4,	%o0,	%o6
	orncc	%i0,	%o1,	%i7
	addcc	%i2,	%i3,	%i4
loop_304:
	tvs	%icc,	0x0
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tg	%icc,	0x2
	movcc	%icc,	%g5,	%l2
	stbar
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g3
	casxa	[%l6] 0x89,	%g3,	%g7
	fblg	%fcc0,	loop_305
	sra	%g6,	%l4,	%o5
	bn,pn	%icc,	loop_306
	fpmerge	%f1,	%f24,	%f18
loop_305:
	nop
	membar	#Sync
	set	0x40, %i4
	ldda	[%l7 + %i4] 0xf1,	%f0
loop_306:
	tsubcctv	%i6,	%l1,	%o3
	for	%f2,	%f0,	%f30
	addcc	%o2,	0x1A1F,	%i1
	movg	%icc,	%l3,	%l0
	nop
	setx	0xAE2E0E5F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0x6653A37E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f17,	%f17
	movrlz	%i5,	0x2B3,	%g2
	set	0x10, %l5
	ldxa	[%l7 + %l5] 0x15,	%g1
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f10
	fxtod	%f10,	%f12
	fpsub16s	%f29,	%f25,	%f11
	edge32ln	%o4,	%o7,	%l5
	fnegs	%f19,	%f2
	orn	%l6,	%g4,	%o0
	tcc	%xcc,	0x5
	sra	%i0,	%o1,	%o6
	orn	%i2,	%i3,	%i7
	nop
	setx	0x96F4B48AB059550C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	fexpand	%f13,	%f0
	tsubcc	%i4,	%l2,	%g3
	movrgez	%g7,	%g5,	%l4
	smulcc	%o5,	%g6,	%i6
	brz	%o3,	loop_307
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x56],	%o2
	fxnor	%f18,	%f24,	%f18
loop_307:
	ldsh	[%l7 + 0x36],	%l1
	fpsub32	%f8,	%f18,	%f8
	fmul8x16au	%f18,	%f8,	%f8
	fpsub16s	%f19,	%f16,	%f28
	fmovsgu	%xcc,	%f28,	%f17
	tleu	%icc,	0x3
	add	%i1,	0x1D69,	%l0
	fbl,a	%fcc0,	loop_308
	movre	%i5,	0x374,	%g2
	fbue	%fcc3,	loop_309
	bpos,pn	%icc,	loop_310
loop_308:
	sdivcc	%g1,	0x1634,	%o4
	xor	%l3,	%l5,	%l6
loop_309:
	sra	%o7,	%g4,	%o0
loop_310:
	sllx	%i0,	%o1,	%o6
	fpackfix	%f12,	%f28
	tcc	%icc,	0x3
	orn	%i3,	0x10F6,	%i2
	edge32n	%i7,	%i4,	%l2
	fcmpne32	%f26,	%f14,	%g3
	nop
	fitod	%f2,	%f0
	fdtos	%f0,	%f23
	movrgz	%g7,	%l4,	%g5
	alignaddr	%g6,	%i6,	%o3
	tn	%icc,	0x2
	be,a,pt	%icc,	loop_311
	bleu,a	%icc,	loop_312
	tgu	%xcc,	0x7
	subcc	%o2,	0x154F,	%o5
loop_311:
	mulx	%i1,	%l0,	%i5
loop_312:
	stbar
	ta	%xcc,	0x5
	orn	%l1,	0x16F8,	%g2
	umul	%g1,	%l3,	%o4
	bgu,a	loop_313
	addc	%l5,	0x1D22,	%l6
	xorcc	%o7,	%o0,	%g4
	movg	%xcc,	%i0,	%o6
loop_313:
	nop
	setx	0xA2FF521149A6E485,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f16
	movrgz	%i3,	0x0B1,	%i2
	movre	%o1,	%i7,	%l2
	movneg	%icc,	%g3,	%g7
	movn	%xcc,	%l4,	%g5
	fbue	%fcc3,	loop_314
	sll	%g6,	0x1C,	%i4
	tne	%icc,	0x2
	taddcctv	%i6,	0x1024,	%o2
loop_314:
	ldsw	[%l7 + 0x20],	%o3
	tne	%icc,	0x7
	set	0x70, %l2
	stxa	%o5,	[%l7 + %l2] 0xeb
	membar	#Sync
	wr	%g0,	0x88,	%asi
	sta	%f1,	[%l7 + 0x2C] %asi
	nop
	setx	0xFB6EEDD67A6947C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x7F6E85AF3DAFE12E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f8,	%f2
	mova	%xcc,	%l0,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs	%icc,	loop_315
	tleu	%xcc,	0x2
	edge32	%l1,	%g2,	%g1
	nop
	setx	0xBCD9FA136F407D96,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x4883060CDCA7491A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f26,	%f22
loop_315:
	fbuge	%fcc0,	loop_316
	edge8l	%i5,	%o4,	%l3
	move	%xcc,	%l5,	%o7
	fmovdne	%icc,	%f8,	%f5
loop_316:
	ldd	[%l7 + 0x60],	%f0
	movrgz	%o0,	0x3F1,	%l6
	fzeros	%f17
	movcs	%xcc,	%i0,	%g4
	sir	0x1FBA
	edge16l	%i3,	%i2,	%o1
	fmovdcs	%icc,	%f2,	%f30
	fexpand	%f0,	%f22
	srlx	%o6,	%i7,	%g3
	ta	%xcc,	0x4
	fors	%f13,	%f9,	%f29
	fcmpeq16	%f6,	%f10,	%g7
	sir	0x0926
	fcmpeq16	%f22,	%f30,	%l2
	subc	%l4,	0x1CC6,	%g6
	call	loop_317
	edge8ln	%g5,	%i6,	%o2
	movpos	%icc,	%i4,	%o5
	bn,a,pt	%xcc,	loop_318
loop_317:
	fpsub16	%f24,	%f14,	%f16
	fmovscs	%icc,	%f16,	%f3
	andcc	%o3,	%l0,	%i1
loop_318:
	movcs	%xcc,	%g2,	%l1
	array8	%i5,	%g1,	%l3
	brgez,a	%l5,	loop_319
	fmovsgu	%xcc,	%f0,	%f30
	fbl,a	%fcc3,	loop_320
	sll	%o4,	0x16,	%o7
loop_319:
	nop
	fitod	%f30,	%f12
	te	%icc,	0x4
loop_320:
	tgu	%icc,	0x5
	movrlez	%o0,	0x01A,	%i0
	bvc,a	%xcc,	loop_321
	movl	%xcc,	%l6,	%i3
	add	%l7,	0x58,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] 0x04,	%i2,	%g4
loop_321:
	movrgez	%o1,	0x3F0,	%i7
	sethi	0x0111,	%g3
	ta	%xcc,	0x0
	xnor	%g7,	0x041B,	%l2
	alignaddrl	%l4,	%g6,	%g5
	tge	%xcc,	0x4
	fmul8x16	%f26,	%f30,	%f6
	fcmpgt32	%f10,	%f4,	%o6
	fmovrdne	%o2,	%f18,	%f8
	tleu	%icc,	0x6
	udiv	%i4,	0x0AED,	%o5
	movge	%xcc,	%i6,	%l0
	edge32l	%o3,	%i1,	%l1
	flush	%l7 + 0x14
	movle	%xcc,	%g2,	%g1
	fmovdvs	%xcc,	%f28,	%f12
	smul	%l3,	0x1F52,	%i5
	udivx	%o4,	0x1E00,	%o7
	nop
	fitod	%f6,	%f22
	fdtox	%f22,	%f8
	fpsub16s	%f3,	%f13,	%f4
	edge8	%o0,	%l5,	%i0
	and	%i3,	%i2,	%g4
	tvc	%xcc,	0x3
	and	%l6,	%o1,	%g3
	andncc	%i7,	%g7,	%l4
	array16	%g6,	%l2,	%o6
	fmovrsgez	%g5,	%f31,	%f23
	taddcctv	%o2,	%i4,	%o5
	ldd	[%l7 + 0x70],	%l0
	fbu,a	%fcc0,	loop_322
	fcmpne32	%f20,	%f18,	%i6
	tpos	%xcc,	0x3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x2C] %asi,	%i1
loop_322:
	movrgez	%o3,	0x156,	%l1
	addccc	%g2,	0x020A,	%l3
	movrgz	%i5,	0x0BC,	%o4
	fnegs	%f6,	%f0
	brgz	%o7,	loop_323
	and	%g1,	%o0,	%l5
	fbo,a	%fcc2,	loop_324
	edge8n	%i3,	%i0,	%i2
loop_323:
	nop
	set	0x28, %o2
	stha	%l6,	[%l7 + %o2] 0x2f
	membar	#Sync
loop_324:
	bvs,a,pn	%xcc,	loop_325
	movl	%icc,	%g4,	%g3
	edge16l	%i7,	%g7,	%o1
	fmovdle	%xcc,	%f20,	%f17
loop_325:
	be	loop_326
	fnegd	%f28,	%f4
	prefetch	[%l7 + 0x64],	 0x2
	bvs,pn	%xcc,	loop_327
loop_326:
	alignaddr	%g6,	%l2,	%o6
	movrne	%g5,	%l4,	%o2
	movg	%icc,	%i4,	%o5
loop_327:
	bn,a	loop_328
	brz,a	%l0,	loop_329
	mulx	%i1,	%i6,	%l1
	srax	%o3,	0x03,	%l3
loop_328:
	movg	%icc,	%i5,	%g2
loop_329:
	fmovrse	%o4,	%f9,	%f26
	xorcc	%o7,	%o0,	%g1
	fmovrdgz	%l5,	%f0,	%f28
	addc	%i0,	0x0566,	%i2
	tcc	%xcc,	0x5
	tneg	%icc,	0x5
	nop
	fitod	%f8,	%f20
	fdtox	%f20,	%f10
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f8
	fxtod	%f8,	%f12
	movpos	%xcc,	%i3,	%g4
	fpmerge	%f13,	%f5,	%f10
	fnand	%f2,	%f0,	%f14
	edge16n	%g3,	%l6,	%g7
	fandnot1s	%f8,	%f0,	%f15
	set	0x20, %l3
	prefetcha	[%l7 + %l3] 0x0c,	 0x3
	subcc	%o1,	0x01CA,	%l2
	move	%icc,	%o6,	%g6
	taddcctv	%l4,	0x1192,	%o2
	brgez	%i4,	loop_330
	nop
	setx	0x7E2EB846,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x46CCA2CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f8,	%f9
	nop
	setx	0xB2ED1B6E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0xFD2231AD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f6,	%f25
	tneg	%icc,	0x5
loop_330:
	edge8	%g5,	%o5,	%l0
	subccc	%i1,	%i6,	%l1
	nop
	set	0x17, %i0
	stb	%o3,	[%l7 + %i0]
	edge8ln	%i5,	%g2,	%o4
	tn	%xcc,	0x2
	array8	%o7,	%o0,	%l3
	addc	%l5,	0x1AAC,	%g1
	bvc	%xcc,	loop_331
	fandnot2s	%f27,	%f1,	%f0
	movvs	%xcc,	%i2,	%i3
	fpadd16	%f0,	%f4,	%f18
loop_331:
	srl	%g4,	%g3,	%i0
	brlz	%g7,	loop_332
	fbge,a	%fcc0,	loop_333
	or	%l6,	0x1925,	%i7
	fone	%f16
loop_332:
	fbule,a	%fcc1,	loop_334
loop_333:
	fzero	%f2
	bne,a	%icc,	loop_335
	umulcc	%l2,	0x0CB9,	%o6
loop_334:
	fbne,a	%fcc0,	loop_336
	movre	%o1,	0x00C,	%g6
loop_335:
	nop
	set	0x18, %i5
	ldxa	[%g0 + %i5] 0x50,	%o2
loop_336:
	edge32	%l4,	%i4,	%g5
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l0,	%i1
	taddcctv	%o5,	%i6,	%o3
	prefetch	[%l7 + 0x18],	 0x0
	movrne	%i5,	0x2AD,	%l1
	fmovsvs	%xcc,	%f2,	%f14
	fmovrsgz	%o4,	%f10,	%f16
	tneg	%xcc,	0x2
	fmovrdgez	%g2,	%f8,	%f16
	prefetch	[%l7 + 0x38],	 0x2
	fpsub32s	%f21,	%f15,	%f13
	tvc	%icc,	0x4
	fbuge	%fcc1,	loop_337
	srl	%o0,	0x12,	%o7
	orcc	%l3,	0x17B6,	%g1
	tcs	%icc,	0x4
loop_337:
	movvc	%icc,	%i2,	%l5
	movle	%icc,	%i3,	%g4
	umulcc	%g3,	%i0,	%g7
	fcmpgt32	%f24,	%f12,	%l6
	fones	%f20
	fmovsvs	%xcc,	%f10,	%f11
	tne	%icc,	0x2
	faligndata	%f18,	%f26,	%f6
	xnor	%i7,	%l2,	%o6
	fbl,a	%fcc0,	loop_338
	xor	%o1,	0x1EC4,	%g6
	nop
	fitod	%f12,	%f6
	fdtoi	%f6,	%f19
	movvc	%icc,	%l4,	%o2
loop_338:
	fnors	%f5,	%f19,	%f28
	fnand	%f30,	%f26,	%f22
	andncc	%g5,	%l0,	%i4
	tcs	%icc,	0x1
	movrgez	%o5,	%i1,	%o3
	fandnot2s	%f20,	%f25,	%f7
	fbul,a	%fcc1,	loop_339
	nop
	fitos	%f29,	%f25
	edge8l	%i5,	%i6,	%l1
	tvs	%icc,	0x0
loop_339:
	fbg	%fcc0,	loop_340
	tpos	%icc,	0x3
	fmovrsne	%o4,	%f10,	%f7
	smulcc	%o0,	%o7,	%g2
loop_340:
	tvs	%xcc,	0x7
	ldd	[%l7 + 0x08],	%f0
	brgz,a	%g1,	loop_341
	sethi	0x0EE3,	%i2
	edge8l	%l5,	%i3,	%l3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_341:
	ldsw	[%l7 + 0x20],	%g3
	set	0x48, %o6
	stxa	%i0,	[%l7 + %o6] 0x23
	membar	#Sync
	sra	%g4,	0x04,	%l6
	tgu	%icc,	0x7
	bneg,pn	%icc,	loop_342
	move	%icc,	%i7,	%l2
	array8	%g7,	%o6,	%o1
	add	%l4,	%o2,	%g6
loop_342:
	nop
	set	0x14, %i7
	ldub	[%l7 + %i7],	%g5
	bshuffle	%f6,	%f30,	%f18
	nop
	setx	0x481874D988B191A7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xB9085241F4CD18F5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fsubd	%f8,	%f2,	%f28
	move	%icc,	%l0,	%i4
	fmul8ulx16	%f20,	%f20,	%f18
	movre	%i1,	%o3,	%i5
	brgez	%i6,	loop_343
	addccc	%l1,	0x1A4D,	%o4
	edge32ln	%o5,	%o7,	%o0
	sethi	0x0629,	%g1
loop_343:
	subcc	%g2,	0x16FA,	%i2
	fmuld8ulx16	%f23,	%f1,	%f22
	tvs	%xcc,	0x3
	edge16ln	%l5,	%l3,	%i3
	edge32	%i0,	%g3,	%l6
	andcc	%g4,	%l2,	%g7
	fnot1s	%f10,	%f18
	tg	%icc,	0x3
	nop
	fitod	%f8,	%f26
	sdivx	%i7,	0x1396,	%o1
	edge8	%o6,	%o2,	%g6
	fmovsa	%xcc,	%f0,	%f12
	tcs	%xcc,	0x3
	sdiv	%l4,	0x03C9,	%l0
	fmovrsgz	%g5,	%f28,	%f30
	taddcc	%i4,	0x173E,	%i1
	and	%o3,	0x0E33,	%i5
	stb	%l1,	[%l7 + 0x10]
	movpos	%icc,	%o4,	%o5
	fbuge	%fcc3,	loop_344
	fcmpgt16	%f8,	%f22,	%o7
	nop
	setx	0x904E741A,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	fmovdgu	%xcc,	%f31,	%f4
loop_344:
	fmovdcs	%xcc,	%f22,	%f12
	addcc	%i6,	0x1476,	%o0
	alignaddrl	%g2,	%g1,	%l5
	movrlez	%l3,	%i2,	%i0
	tvc	%icc,	0x3
	andcc	%g3,	0x08CF,	%l6
	edge8l	%i3,	%l2,	%g7
	nop
	setx	0xE79CBDD0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xC462BAC0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f16,	%f13
	tgu	%icc,	0x3
	edge8	%i7,	%o1,	%g4
	fbu,a	%fcc3,	loop_345
	bn,pn	%xcc,	loop_346
	sir	0x145C
	nop
	fitos	%f5,	%f13
	fstox	%f13,	%f18
loop_345:
	fand	%f18,	%f26,	%f10
loop_346:
	edge16n	%o2,	%o6,	%g6
	edge16ln	%l0,	%l4,	%g5
	movrlz	%i4,	%i1,	%o3
	call	loop_347
	fmovsne	%xcc,	%f11,	%f24
	nop
	setx loop_348, %l0, %l1
	jmpl %l1, %i5
	movrgez	%l1,	%o4,	%o7
loop_347:
	fbug	%fcc3,	loop_349
	edge8l	%o5,	%i6,	%o0
loop_348:
	edge32ln	%g2,	%g1,	%l3
	fmovrse	%i2,	%f25,	%f6
loop_349:
	nop
	setx	0x17884957,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x045514C7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f7,	%f11
	movl	%xcc,	%i0,	%l5
	edge8l	%l6,	%i3,	%g3
	lduh	[%l7 + 0x22],	%l2
	umulcc	%i7,	0x0528,	%g7
	fcmpne32	%f22,	%f8,	%o1
	bpos	loop_350
	srl	%o2,	0x16,	%g4
	ta	%xcc,	0x6
	tcc	%xcc,	0x5
loop_350:
	nop
	set	0x60, %g6
	lduwa	[%l7 + %g6] 0x89,	%g6
	wr	%g0,	0x81,	%asi
	stxa	%o6,	[%l7 + 0x10] %asi
	edge32	%l0,	%g5,	%l4
	movvc	%xcc,	%i1,	%o3
	tleu	%xcc,	0x3
	array8	%i4,	%i5,	%l1
	fmovsa	%xcc,	%f23,	%f31
	taddcctv	%o4,	0x1492,	%o7
	nop
	setx	0x5933CD16,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x06FDA9FE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fdivs	%f28,	%f24,	%f9
	sub	%i6,	%o0,	%g2
	fnands	%f16,	%f24,	%f28
	udivx	%o5,	0x1D8A,	%g1
	ldd	[%l7 + 0x28],	%l2
	call	loop_351
	tneg	%icc,	0x1
	sll	%i2,	0x16,	%l5
	array8	%l6,	%i0,	%g3
loop_351:
	tsubcc	%l2,	0x1179,	%i7
	set	0x40, %i3
	stwa	%i3,	[%l7 + %i3] 0x2b
	membar	#Sync
	movge	%icc,	%g7,	%o1
	ta	%xcc,	0x1
	sdivx	%g4,	0x0A57,	%o2
	smulcc	%g6,	%o6,	%g5
	fexpand	%f18,	%f14
	movre	%l4,	%l0,	%o3
	fpadd16	%f16,	%f10,	%f16
	fbne	%fcc2,	loop_352
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i4,	[%l7 + 0x38]
	srlx	%i1,	0x02,	%i5
loop_352:
	edge16ln	%o4,	%l1,	%o7
	bg,pt	%xcc,	loop_353
	fbl	%fcc0,	loop_354
	fmovrdgz	%i6,	%f26,	%f20
	alignaddr	%g2,	%o5,	%o0
loop_353:
	nop
	set	0x30, %i1
	stha	%g1,	[%l7 + %i1] 0x10
loop_354:
	tsubcctv	%l3,	0x0E04,	%i2
	sll	%l6,	%l5,	%i0
	orncc	%l2,	0x1F67,	%g3
	bne,pt	%icc,	loop_355
	xor	%i7,	%i3,	%g7
	fcmpeq32	%f6,	%f6,	%g4
	fmovsa	%icc,	%f0,	%f1
loop_355:
	nop
	set	0x38, %l4
	stxa	%o1,	[%l7 + %l4] 0x81
	popc	0x14F6,	%o2
	for	%f18,	%f28,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%o6,	%g5
	taddcc	%l4,	%l0,	%g6
	fpsub16s	%f7,	%f11,	%f1
	bgu,pn	%xcc,	loop_356
	fmovdge	%icc,	%f24,	%f12
	fmovsge	%icc,	%f2,	%f21
	xor	%o3,	%i1,	%i5
loop_356:
	stb	%o4,	[%l7 + 0x70]
	fornot1	%f28,	%f22,	%f18
	smul	%l1,	%i4,	%o7
	sir	0x04F7
	movne	%xcc,	%i6,	%o5
	tsubcc	%o0,	0x08E4,	%g1
	fand	%f14,	%f2,	%f24
	subc	%g2,	%i2,	%l6
	andcc	%l5,	0x19C7,	%i0
	fmovrsne	%l3,	%f6,	%f14
	fmul8sux16	%f18,	%f2,	%f24
	tneg	%icc,	0x1
	udivx	%g3,	0x1859,	%l2
	stbar
	movrlez	%i7,	%g7,	%g4
	orncc	%i3,	%o1,	%o2
	stbar
	sethi	0x1357,	%g5
	movl	%xcc,	%o6,	%l0
	andn	%l4,	%o3,	%g6
	membar	0x2C
	tsubcc	%i1,	%o4,	%i5
	fabsd	%f10,	%f12
	tsubcctv	%i4,	%o7,	%l1
	and	%o5,	%o0,	%i6
	xor	%g2,	%g1,	%i2
	udiv	%l6,	0x1893,	%l5
	movvc	%icc,	%i0,	%l3
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x18
	movgu	%icc,	%l2,	%g3
	fbue	%fcc1,	loop_357
	ba	loop_358
	ldsh	[%l7 + 0x7A],	%i7
	tvc	%icc,	0x0
loop_357:
	fnands	%f17,	%f10,	%f14
loop_358:
	srlx	%g4,	0x01,	%g7
	movgu	%icc,	%i3,	%o2
	tle	%icc,	0x6
	udivcc	%o1,	0x1B74,	%o6
	prefetch	[%l7 + 0x08],	 0x0
	movne	%xcc,	%l0,	%l4
	udivx	%g5,	0x123D,	%o3
	sub	%i1,	0x061A,	%o4
	be,a,pn	%xcc,	loop_359
	brz	%i5,	loop_360
	fbuge,a	%fcc2,	loop_361
	sir	0x1E05
loop_359:
	movleu	%xcc,	%i4,	%g6
loop_360:
	tvc	%icc,	0x6
loop_361:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l1,	0x1317,	%o5
	array16	%o0,	%i6,	%g2
	fabsd	%f0,	%f24
	nop
	setx	0xB0E59FA8F04B8D1F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
	fbe	%fcc2,	loop_362
	movn	%xcc,	%o7,	%i2
	udivcc	%l6,	0x1809,	%g1
	fmovdvs	%icc,	%f19,	%f29
loop_362:
	nop
	set	0x180, %i2
	nop 	! 	nop 	! 	ldxa	[%g0 + %i2] 0x40,	%i0 ripped by fixASI40.pl ripped by fixASI40.pl
	flush	%l7 + 0x28
	array8	%l3,	%l2,	%g3
	ta	%icc,	0x3
	fbl,a	%fcc3,	loop_363
	fbo	%fcc1,	loop_364
	andncc	%l5,	%g4,	%g7
	sethi	0x1A09,	%i7
loop_363:
	bleu	loop_365
loop_364:
	popc	0x1568,	%o2
	sethi	0x1C9B,	%i3
	nop
	setx	0x3A23B5CC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x499C45F7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f16,	%f6
loop_365:
	fcmpeq32	%f16,	%f6,	%o6
	edge32	%l0,	%l4,	%g5
	brlez	%o1,	loop_366
	sub	%i1,	%o4,	%o3
	fbo	%fcc0,	loop_367
	nop
	setx	0x39BC2DB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0x0FF54BDB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f18
	fmuls	%f18,	%f0,	%f12
loop_366:
	fbule,a	%fcc2,	loop_368
	array16	%i4,	%i5,	%g6
loop_367:
	sir	0x12CF
	fble,a	%fcc2,	loop_369
loop_368:
	udiv	%o5,	0x10F1,	%o0
	xor	%i6,	%g2,	%o7
	umulcc	%i2,	%l6,	%l1
loop_369:
	edge16n	%i0,	%g1,	%l3
	sllx	%g3,	0x0C,	%l2
	ldd	[%l7 + 0x30],	%l4
	brgez	%g7,	loop_370
	edge16ln	%i7,	%o2,	%g4
	popc	%i3,	%o6
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x24] %asi,	%f6
loop_370:
	edge16	%l0,	%g5,	%l4
	alignaddrl	%o1,	%i1,	%o3
	fxnor	%f2,	%f26,	%f22
	bneg	%xcc,	loop_371
	addc	%o4,	0x112B,	%i5
	fmovdge	%icc,	%f10,	%f31
	ld	[%l7 + 0x40],	%f15
loop_371:
	movrgez	%i4,	0x0B4,	%o5
	wr	%g0,	0xea,	%asi
	stha	%o0,	[%l7 + 0x34] %asi
	membar	#Sync
	fandnot2	%f6,	%f10,	%f10
	tgu	%icc,	0x3
	brnz	%i6,	loop_372
	movgu	%xcc,	%g2,	%g6
	fabss	%f25,	%f19
	sdivcc	%o7,	0x1CCB,	%i2
loop_372:
	add	%l6,	%i0,	%l1
	nop
	set	0x58, %l0
	lduh	[%l7 + %l0],	%l3
	tleu	%xcc,	0x0
	addcc	%g1,	%g3,	%l5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x11] %asi,	%g7
	mova	%icc,	%i7,	%o2
	andcc	%g4,	0x06B6,	%i3
	udiv	%l2,	0x0438,	%o6
	edge16	%l0,	%g5,	%l4
	mova	%xcc,	%i1,	%o3
	fandnot1	%f28,	%f0,	%f24
	fmovdneg	%icc,	%f22,	%f3
	edge8l	%o1,	%o4,	%i5
	fbue,a	%fcc0,	loop_373
	tneg	%icc,	0x5
	edge16	%i4,	%o0,	%i6
	nop
	setx	0x84DC1D11705DE25E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
loop_373:
	movn	%icc,	%g2,	%o5
	edge32n	%g6,	%o7,	%i2
	movn	%xcc,	%i0,	%l6
	movrne	%l3,	%l1,	%g1
	mova	%icc,	%g3,	%g7
	fands	%f31,	%f19,	%f15
	sub	%i7,	0x1D9E,	%o2
	fmul8x16al	%f19,	%f31,	%f2
	bpos,pt	%icc,	loop_374
	nop
	setx loop_375, %l0, %l1
	jmpl %l1, %g4
	fnors	%f4,	%f30,	%f27
	fpsub32	%f24,	%f14,	%f2
loop_374:
	andcc	%l5,	0x017C,	%i3
loop_375:
	subcc	%l2,	0x0FE2,	%o6
	fmovsvc	%xcc,	%f26,	%f30
	and	%l0,	%g5,	%l4
	movgu	%icc,	%o3,	%i1
	fbuge	%fcc2,	loop_376
	bvc,a	loop_377
	membar	0x2A
	te	%xcc,	0x4
loop_376:
	movpos	%xcc,	%o1,	%o4
loop_377:
	addccc	%i5,	0x161B,	%i4
	tge	%xcc,	0x5
	ta	%xcc,	0x4
	movvs	%xcc,	%o0,	%i6
	movneg	%xcc,	%g2,	%g6
	edge32l	%o5,	%o7,	%i0
	movrlez	%l6,	0x2E2,	%l3
	popc	%i2,	%l1
	sir	0x0212
	fnands	%f17,	%f3,	%f18
	andcc	%g3,	%g1,	%g7
	fbul,a	%fcc1,	loop_378
	nop
	fitod	%f8,	%f2
	fdtox	%f2,	%f14
	fbuge,a	%fcc3,	loop_379
	movleu	%xcc,	%o2,	%g4
loop_378:
	tcs	%xcc,	0x2
	tneg	%xcc,	0x6
loop_379:
	ldsw	[%l7 + 0x3C],	%l5
	array32	%i7,	%l2,	%i3
	fmovrslez	%o6,	%f10,	%f14
	fmovdvs	%icc,	%f28,	%f3
	smul	%l0,	%g5,	%l4
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x0c,	%f0
	sdivcc	%i1,	0x097D,	%o3
	fpack32	%f18,	%f28,	%f18
	smulcc	%o1,	%o4,	%i5
	nop
	fitod	%f0,	%f26
	fpadd16s	%f31,	%f5,	%f31
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x40] %asi,	%i4
	fmovse	%icc,	%f23,	%f22
	umul	%i6,	%g2,	%o0
	tsubcc	%g6,	%o5,	%i0
	fba	%fcc3,	loop_380
	tpos	%xcc,	0x2
	set	0x7C, %g4
	sta	%f16,	[%l7 + %g4] 0x14
loop_380:
	lduw	[%l7 + 0x0C],	%o7
	andn	%l6,	0x04ED,	%i2
	subcc	%l3,	%g3,	%g1
	fpsub16	%f14,	%f26,	%f12
	ta	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x6E] %asi,	%g7
	fbu,a	%fcc3,	loop_381
	popc	%l1,	%o2
	bn	%xcc,	loop_382
	udivcc	%l5,	0x14A2,	%g4
loop_381:
	movle	%xcc,	%i7,	%l2
	fsrc2s	%f21,	%f31
loop_382:
	prefetch	[%l7 + 0x20],	 0x2
	fzero	%f28
	alignaddrl	%i3,	%l0,	%o6
	nop
	setx	loop_383,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%g5,	0x06F4,	%i1
	edge32l	%o3,	%o1,	%o4
	bvc,a,pt	%xcc,	loop_384
loop_383:
	fcmpne16	%f18,	%f14,	%l4
	fands	%f22,	%f24,	%f19
	edge16l	%i4,	%i5,	%i6
loop_384:
	udivx	%o0,	0x1866,	%g2
	movrlz	%g6,	0x2C3,	%o5
	movre	%o7,	0x086,	%l6
	lduw	[%l7 + 0x5C],	%i2
	tsubcctv	%l3,	0x00C5,	%i0
	xnorcc	%g1,	0x046D,	%g3
	fbe	%fcc2,	loop_385
	nop
	setx	0x9094A6D9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	fsqrts	%f27,	%f15
	edge16l	%g7,	%l1,	%l5
	ldd	[%l7 + 0x40],	%f10
loop_385:
	taddcc	%g4,	%i7,	%o2
	popc	0x0B1A,	%i3
	edge16l	%l2,	%o6,	%g5
	tvc	%xcc,	0x6
	ldstub	[%l7 + 0x18],	%l0
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%i1
	casxa	[%l6] 0x88,	%i1,	%o1
	fpsub16s	%f3,	%f31,	%f1
	sll	%o4,	0x14,	%l4
	fmovrdgz	%i4,	%f8,	%f16
	movleu	%icc,	%o3,	%i6
	fmovrslz	%o0,	%f13,	%f18
	te	%icc,	0x0
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x66] %asi,	%g2
	edge8ln	%g6,	%o5,	%o7
	fmovdvc	%icc,	%f19,	%f0
	edge32n	%l6,	%i2,	%i5
	set	0x30, %o5
	sta	%f13,	[%l7 + %o5] 0x14
	fnegs	%f4,	%f25
	sdiv	%l3,	0x0424,	%i0
	fmovdvs	%icc,	%f8,	%f13
	ta	%xcc,	0x4
	movgu	%icc,	%g1,	%g7
	movcc	%xcc,	%g3,	%l5
	addc	%g4,	0x08E1,	%l1
	udiv	%i7,	0x19F9,	%o2
	fpadd32	%f4,	%f12,	%f22
	wr	%g0,	0x0c,	%asi
	ldstuba	[%l7 + 0x21] %asi,	%l2
	movle	%xcc,	%i3,	%g5
	ldsw	[%l7 + 0x54],	%o6
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x1
	xor	%l0,	%o1,	%o4
	ldub	[%l7 + 0x4B],	%l4
	movneg	%xcc,	%o3,	%i6
	umul	%i4,	0x008B,	%o0
	sethi	0x1A77,	%g2
	smul	%g6,	%o7,	%o5
	stbar
	movvs	%icc,	%i2,	%i5
	edge16l	%l3,	%i0,	%g1
	te	%icc,	0x0
	srl	%g7,	0x1E,	%g3
	nop
	set	0x1A, %g2
	ldsh	[%l7 + %g2],	%l5
	fmovdgu	%xcc,	%f18,	%f23
	brgz	%l6,	loop_386
	fbne,a	%fcc3,	loop_387
	edge8	%g4,	%l1,	%i7
	ldsb	[%l7 + 0x4F],	%o2
loop_386:
	ldx	[%l7 + 0x08],	%l2
loop_387:
	addc	%g5,	0x162E,	%i3
	tg	%icc,	0x0
	nop
	fitos	%f25,	%f17
	fmovdcc	%xcc,	%f30,	%f14
	movvc	%xcc,	%o6,	%l0
	tvc	%icc,	0x2
	bl,a,pn	%xcc,	loop_388
	bneg,pn	%icc,	loop_389
	edge32n	%i1,	%o1,	%l4
	fmul8x16au	%f5,	%f23,	%f28
loop_388:
	edge8n	%o4,	%o3,	%i6
loop_389:
	andcc	%i4,	%g2,	%g6
	xor	%o7,	0x1CF5,	%o0
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%i2
	casxa	[%l6] %asi,	%i2,	%o5
	movgu	%icc,	%i5,	%i0
	lduh	[%l7 + 0x40],	%l3
	alignaddr	%g1,	%g3,	%l5
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x30] %asi,	%g6
	edge16n	%l6,	%g4,	%i7
	sllx	%o2,	%l1,	%l2
	sir	0x111C
	swap	[%l7 + 0x10],	%g5
	edge32ln	%i3,	%l0,	%o6
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%l4
	movrgz	%o4,	%i1,	%o3
	edge16n	%i4,	%g2,	%g6
	alignaddr	%i6,	%o7,	%o0
	orncc	%o5,	%i5,	%i2
	popc	%l3,	%i0
	xnorcc	%g3,	%l5,	%g7
	fmovrdlez	%l6,	%f20,	%f8
	sll	%g4,	%i7,	%g1
	movrne	%l1,	0x191,	%l2
	xnorcc	%g5,	0x1D08,	%i3
	fmuld8sux16	%f27,	%f8,	%f12
	movge	%icc,	%o2,	%o6
	udivcc	%l0,	0x0F01,	%o1
	fpadd32	%f4,	%f14,	%f20
	fmovsg	%icc,	%f28,	%f4
	tvs	%icc,	0x1
	or	%o4,	%i1,	%l4
	fmovdleu	%xcc,	%f30,	%f23
	fmovsleu	%xcc,	%f10,	%f3
	stx	%o3,	[%l7 + 0x70]
	set	0x3C, %o7
	stwa	%i4,	[%l7 + %o7] 0x04
	movneg	%icc,	%g2,	%i6
	mulx	%o7,	0x1F91,	%o0
	brlz	%o5,	loop_390
	fsrc2s	%f26,	%f0
	movrne	%i5,	0x1F2,	%g6
	fpack16	%f0,	%f24
loop_390:
	ldub	[%l7 + 0x2B],	%i2
	fmuld8sux16	%f11,	%f4,	%f30
	fornot1	%f6,	%f14,	%f10
	sdivcc	%i0,	0x1D75,	%l3
	wr	%g0,	0x19,	%asi
	swapa	[%l7 + 0x54] %asi,	%l5
	fmovdle	%xcc,	%f7,	%f5
	and	%g7,	0x1C1B,	%l6
	edge32n	%g4,	%g3,	%g1
	movleu	%icc,	%l1,	%i7
	andn	%g5,	0x0DA7,	%i3
	srl	%l2,	0x0C,	%o6
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	srlx	%l0,	0x06,	%o2
	membar	0x3E
	ldx	[%l7 + 0x60],	%o1
	movrne	%i1,	0x29B,	%o4
	tl	%icc,	0x6
	mulx	%l4,	%o3,	%i4
	tgu	%xcc,	0x2
	nop
	setx	0xD0339D4A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xFE90E19C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f31,	%f25
	orcc	%i6,	%o7,	%o0
	addccc	%o5,	%g2,	%g6
	movleu	%icc,	%i5,	%i2
	fands	%f8,	%f2,	%f18
	tsubcctv	%l3,	0x015F,	%l5
	wr	%g0,	0x11,	%asi
	stha	%g7,	[%l7 + 0x40] %asi
	udivx	%l6,	0x11A5,	%i0
	addccc	%g4,	0x0A9B,	%g3
	addcc	%l1,	0x15F8,	%g1
	sir	0x050A
	xnor	%g5,	0x1DAF,	%i3
	lduw	[%l7 + 0x14],	%i7
	orcc	%o6,	%l0,	%o2
	stb	%l2,	[%l7 + 0x45]
	fzeros	%f10
	movn	%icc,	%i1,	%o1
	tg	%xcc,	0x7
	subcc	%o4,	%l4,	%i4
	tne	%icc,	0x1
	fxnor	%f26,	%f20,	%f26
	orcc	%i6,	0x0B40,	%o7
	fnor	%f28,	%f24,	%f2
	movneg	%icc,	%o0,	%o3
	movrgz	%o5,	0x3A3,	%g2
	edge8l	%i5,	%g6,	%i2
	array32	%l5,	%l3,	%g7
	sdiv	%i0,	0x0D6E,	%l6
	sdivx	%g3,	0x0991,	%g4
	sethi	0x0407,	%g1
	nop
	setx	0x04669E30004DD926,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	movneg	%icc,	%g5,	%l1
	movgu	%icc,	%i3,	%o6
	fmovrdne	%i7,	%f14,	%f12
	lduh	[%l7 + 0x12],	%o2
	andncc	%l0,	%l2,	%i1
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x24] %asi,	%o1
	tgu	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f12,	%f0,	%f20
	fbn	%fcc3,	loop_391
	ldsw	[%l7 + 0x78],	%o4
	brlz,a	%l4,	loop_392
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_391:
	taddcctv	%i6,	0x018E,	%o7
	or	%i4,	%o0,	%o3
loop_392:
	prefetch	[%l7 + 0x44],	 0x2
	add	%l7,	0x58,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%o5
	andn	%g6,	%i5,	%l5
	fmovrslz	%l3,	%f31,	%f15
	std	%f0,	[%l7 + 0x28]
	fmovsleu	%xcc,	%f9,	%f7
	fmovrslez	%i2,	%f25,	%f6
	xorcc	%g7,	0x00DF,	%i0
	subccc	%l6,	%g3,	%g1
	fmul8x16	%f12,	%f0,	%f18
	movge	%xcc,	%g5,	%l1
	nop
	setx	0xCA6B428D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f13
	edge32l	%i3,	%o6,	%g4
	pdist	%f4,	%f22,	%f20
	movrlez	%o2,	%l0,	%i7
	wr	%g0,	0x89,	%asi
	stba	%l2,	[%l7 + 0x19] %asi
	fbe,a	%fcc2,	loop_393
	bvs,a	loop_394
	tl	%xcc,	0x1
	sllx	%i1,	0x1E,	%o4
loop_393:
	bleu,a	loop_395
loop_394:
	ldsh	[%l7 + 0x76],	%o1
	bcc	loop_396
	srl	%l4,	0x0E,	%o7
loop_395:
	nop
	setx	0x905AA836,	%l0,	%l6
	st	%l6,	[%l7 + 0x74]
	ld	[%l7 + 0x74],	%fsr
	fpsub16	%f16,	%f18,	%f2
loop_396:
	addccc	%i4,	%o0,	%i6
	fmovrdgz	%g2,	%f16,	%f28
	tsubcc	%o3,	%g6,	%o5
	bvs	loop_397
	fsrc1	%f12,	%f30
	edge8	%i5,	%l3,	%i2
	sir	0x0402
loop_397:
	tsubcc	%g7,	0x1F9E,	%l5
	xnorcc	%l6,	0x1BA5,	%i0
	nop
	setx	0xB2E374E8,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xC7167AEC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fmuls	%f0,	%f16,	%f10
	fmovde	%xcc,	%f17,	%f30
	tg	%icc,	0x4
	move	%icc,	%g1,	%g5
	and	%g3,	0x0B08,	%l1
	wr	%g0,	0x80,	%asi
	lda	[%l7 + 0x20] %asi,	%f28
	tsubcc	%o6,	%i3,	%o2
	fone	%f16
	movn	%icc,	%l0,	%g4
	bcc,a,pt	%icc,	loop_398
	fnands	%f23,	%f26,	%f11
	addc	%i7,	0x0E7E,	%l2
	brlez	%i1,	loop_399
loop_398:
	fbo	%fcc3,	loop_400
	andcc	%o4,	0x045E,	%l4
	array16	%o7,	%i4,	%o0
loop_399:
	tpos	%icc,	0x0
loop_400:
	ld	[%l7 + 0x44],	%f7
	srax	%i6,	0x02,	%g2
	fbue,a	%fcc0,	loop_401
	nop
	setx	0x7C56DC2421715116,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f18
	movge	%xcc,	%o3,	%o1
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f22
	fxtod	%f22,	%f28
loop_401:
	edge8ln	%o5,	%g6,	%i5
	tg	%xcc,	0x7
	popc	%i2,	%l3
	tneg	%icc,	0x1
	nop
	fitod	%f6,	%f28
	fdtoi	%f28,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,a,pn	%xcc,	loop_402
	fbu	%fcc2,	loop_403
	fnor	%f22,	%f20,	%f8
	movneg	%icc,	%g7,	%l6
loop_402:
	mova	%icc,	%l5,	%i0
loop_403:
	ba,pn	%icc,	loop_404
	fmovsge	%icc,	%f14,	%f26
	fmovrsgz	%g5,	%f23,	%f17
	fbule,a	%fcc1,	loop_405
loop_404:
	movcs	%xcc,	%g1,	%g3
	bpos	loop_406
	fbge,a	%fcc1,	loop_407
loop_405:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o6,	%l1
loop_406:
	bge,a	%icc,	loop_408
loop_407:
	brgz,a	%o2,	loop_409
	movrgz	%l0,	0x2DC,	%g4
	movvs	%xcc,	%i3,	%l2
loop_408:
	tvc	%xcc,	0x5
loop_409:
	edge8l	%i7,	%o4,	%l4
	edge16ln	%o7,	%i1,	%i4
	fmovrslz	%i6,	%f1,	%f5
	tg	%icc,	0x7
	set	0x30, %o0
	ldxa	[%l7 + %o0] 0x18,	%g2
	movgu	%icc,	%o3,	%o1
	alignaddrl	%o0,	%o5,	%g6
	movneg	%xcc,	%i5,	%i2
	addc	%g7,	0x114F,	%l3
	fmovrsgez	%l6,	%f10,	%f19
	movpos	%xcc,	%i0,	%g5
	sir	0x13C3
	tcs	%icc,	0x7
	array32	%g1,	%g3,	%l5
	fmovdvc	%icc,	%f15,	%f21
	orcc	%l1,	0x1D5F,	%o2
	fbule,a	%fcc0,	loop_410
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0xB2B54F29,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f0
	orncc	%l0,	0x0C7D,	%o6
loop_410:
	movvc	%icc,	%i3,	%l2
	sdiv	%g4,	0x1199,	%o4
	addcc	%i7,	0x12E9,	%l4
	or	%o7,	0x0B83,	%i1
	popc	%i4,	%g2
	set	0x1A, %l1
	lduba	[%l7 + %l1] 0x0c,	%o3
	nop
	fitos	%f4,	%f19
	fstox	%f19,	%f18
	fxtos	%f18,	%f3
	fmovdneg	%icc,	%f23,	%f1
	edge8ln	%i6,	%o1,	%o0
	tg	%xcc,	0x5
	brgez	%g6,	loop_411
	move	%xcc,	%o5,	%i5
	movrne	%i2,	0x3A5,	%g7
	or	%l6,	%l3,	%g5
loop_411:
	udivcc	%g1,	0x1794,	%g3
	tsubcc	%i0,	%l1,	%l5
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0xf9,	%f0
	addcc	%l0,	%o2,	%i3
	xor	%l2,	%o6,	%o4
	set	0x4B, %g1
	lduba	[%l7 + %g1] 0x0c,	%i7
	smul	%l4,	0x1647,	%o7
	tleu	%icc,	0x7
	fmovdne	%icc,	%f25,	%f18
	movn	%icc,	%i1,	%g4
	edge32ln	%i4,	%g2,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tvc	%xcc,	0x7
	edge32ln	%o3,	%o1,	%o0
	fmovdn	%xcc,	%f7,	%f21
	set	0x7A, %g3
	stha	%o5,	[%l7 + %g3] 0x18
	movvs	%xcc,	%i5,	%i2
	bvs,a	%icc,	loop_412
	smulcc	%g6,	0x0FB4,	%g7
	movne	%xcc,	%l3,	%g5
	move	%xcc,	%l6,	%g3
loop_412:
	sllx	%i0,	%l1,	%g1
	popc	0x0D37,	%l0
	andcc	%o2,	%i3,	%l2
	tge	%icc,	0x1
	udivcc	%o6,	0x01FA,	%l5
	tne	%xcc,	0x7
	addcc	%o4,	0x0D88,	%i7
	nop
	fitos	%f12,	%f28
	fstod	%f28,	%f16
	movpos	%icc,	%l4,	%i1
	bgu,pn	%icc,	loop_413
	tge	%xcc,	0x3
	addc	%g4,	%i4,	%o7
	nop
	fitod	%f12,	%f2
	fdtoi	%f2,	%f0
loop_413:
	sdivx	%i6,	0x18E9,	%o3
	array8	%g2,	%o1,	%o5
	tgu	%icc,	0x2
	movl	%xcc,	%i5,	%o0
	smul	%g6,	0x0F9F,	%i2
	tpos	%icc,	0x6
	fcmpne32	%f30,	%f6,	%g7
	edge32	%g5,	%l3,	%l6
	brlz,a	%i0,	loop_414
	prefetch	[%l7 + 0x50],	 0x2
	andncc	%l1,	%g1,	%l0
	array32	%o2,	%i3,	%l2
loop_414:
	ba,pt	%xcc,	loop_415
	smul	%g3,	%l5,	%o6
	fmovrde	%i7,	%f10,	%f4
	umul	%l4,	%i1,	%o4
loop_415:
	fpsub32	%f22,	%f18,	%f14
	tsubcc	%i4,	%g4,	%i6
	wr	%g0,	0x11,	%asi
	sta	%f11,	[%l7 + 0x20] %asi
	tvs	%icc,	0x5
	wr	%g0,	0x2f,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
	fbg	%fcc2,	loop_416
	tn	%xcc,	0x1
	bcs,pn	%icc,	loop_417
	nop
	fitod	%f10,	%f4
	fdtos	%f4,	%f18
loop_416:
	andncc	%g2,	%o7,	%o5
	fand	%f8,	%f26,	%f6
loop_417:
	sll	%i5,	0x0B,	%o0
	fmovde	%xcc,	%f25,	%f18
	alignaddr	%o1,	%i2,	%g6
	movvc	%xcc,	%g7,	%l3
	orncc	%g5,	0x1205,	%i0
	srax	%l6,	%l1,	%g1
	subcc	%o2,	%i3,	%l2
	movre	%g3,	0x143,	%l0
	fnot1s	%f17,	%f17
	addc	%o6,	0x0959,	%i7
	movneg	%icc,	%l4,	%i1
	movleu	%xcc,	%l5,	%o4
	wr	%g0,	0x2a,	%asi
	stha	%g4,	[%l7 + 0x18] %asi
	membar	#Sync
	ba,pt	%icc,	loop_418
	ld	[%l7 + 0x68],	%f31
	movrlez	%i6,	0x2D5,	%o3
	nop
	setx	loop_419,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_418:
	fmovrdgz	%g2,	%f0,	%f24
	movpos	%xcc,	%o7,	%o5
	bvc,a,pt	%icc,	loop_420
loop_419:
	tn	%icc,	0x0
	tcc	%xcc,	0x4
	sll	%i5,	%o0,	%i4
loop_420:
	edge32ln	%i2,	%o1,	%g7
	sethi	0x1931,	%g6
	srax	%g5,	%i0,	%l6
	tcs	%icc,	0x0
	smulcc	%l3,	%l1,	%g1
	edge16	%i3,	%l2,	%g3
	tcs	%xcc,	0x1
	be,a	%icc,	loop_421
	ld	[%l7 + 0x4C],	%f20
	movl	%icc,	%o2,	%o6
	subcc	%l0,	0x1B13,	%l4
loop_421:
	fbne	%fcc1,	loop_422
	or	%i7,	%i1,	%l5
	umul	%o4,	0x09CE,	%g4
	movgu	%xcc,	%o3,	%g2
loop_422:
	add	%i6,	%o5,	%o7
	addc	%i5,	%i4,	%o0
	ld	[%l7 + 0x64],	%f13
	edge32ln	%o1,	%i2,	%g7
	array32	%g5,	%i0,	%l6
	tcc	%xcc,	0x1
	movrgz	%g6,	%l1,	%g1
	fmul8x16au	%f0,	%f25,	%f18
	nop
	setx	0xC041AB1F,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	addc	%i3,	0x1375,	%l2
	faligndata	%f20,	%f8,	%f2
	brgez,a	%l3,	loop_423
	fnot2s	%f21,	%f23
	fpack16	%f0,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_423:
	movpos	%icc,	%g3,	%o2
	orncc	%l0,	0x1D4B,	%o6
	tle	%icc,	0x5
	orn	%i7,	0x0111,	%l4
	ba,pt	%icc,	loop_424
	fbe,a	%fcc3,	loop_425
	fbne	%fcc3,	loop_426
	mulscc	%i1,	%o4,	%l5
loop_424:
	udivcc	%o3,	0x1A09,	%g2
loop_425:
	nop
	setx	loop_427,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_426:
	taddcctv	%g4,	0x0AC3,	%i6
	ble	%xcc,	loop_428
	fbul,a	%fcc2,	loop_429
loop_427:
	tle	%xcc,	0x6
	edge32ln	%o5,	%i5,	%i4
loop_428:
	brlez	%o0,	loop_430
loop_429:
	andncc	%o7,	%o1,	%g7
	fba,a	%fcc3,	loop_431
	nop
	fitos	%f2,	%f30
loop_430:
	edge8l	%g5,	%i0,	%i2
	tsubcctv	%g6,	0x0301,	%l1
loop_431:
	bneg,a,pt	%xcc,	loop_432
	fors	%f27,	%f18,	%f20
	bshuffle	%f12,	%f30,	%f6
	bcc,a,pt	%xcc,	loop_433
loop_432:
	bcc,a,pn	%icc,	loop_434
	fmul8x16au	%f7,	%f3,	%f20
	edge32ln	%l6,	%g1,	%i3
loop_433:
	brnz	%l2,	loop_435
loop_434:
	xorcc	%g3,	0x0904,	%o2
	sll	%l0,	%o6,	%l3
	nop
	fitos	%f2,	%f20
	fstox	%f20,	%f12
loop_435:
	tpos	%xcc,	0x2
	udivcc	%i7,	0x1069,	%i1
	sdivcc	%l4,	0x0F65,	%l5
	tleu	%icc,	0x4
	edge16l	%o4,	%o3,	%g4
	subccc	%i6,	%g2,	%i5
	membar	0x6D
	fmovrdlez	%o5,	%f4,	%f12
	fmovde	%icc,	%f9,	%f17
	movl	%icc,	%i4,	%o7
	andncc	%o1,	%o0,	%g7
	tpos	%xcc,	0x2
	set	0x3C, %o4
	stha	%g5,	[%l7 + %o4] 0x80
	tg	%xcc,	0x3
	bn,pt	%icc,	loop_436
	movpos	%icc,	%i2,	%g6
	fbug	%fcc3,	loop_437
	array16	%l1,	%i0,	%g1
loop_436:
	fcmpne16	%f12,	%f24,	%i3
	movre	%l2,	%l6,	%g3
loop_437:
	and	%o2,	%o6,	%l3
	edge16ln	%l0,	%i1,	%i7
	tn	%icc,	0x2
	call	loop_438
	addc	%l4,	%l5,	%o4
	te	%icc,	0x0
	fblg	%fcc2,	loop_439
loop_438:
	fmovdcs	%icc,	%f15,	%f22
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f3,	%f0
loop_439:
	fmovsgu	%xcc,	%f22,	%f29
	fmovsle	%xcc,	%f26,	%f16
	nop
	setx	0x549CFC9F25E9E0AF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xD3330896E9BBE6DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f12,	%f0
	alignaddr	%o3,	%i6,	%g2
	ldub	[%l7 + 0x32],	%i5
	ldsh	[%l7 + 0x46],	%g4
	set	0x18, %g7
	sta	%f5,	[%l7 + %g7] 0x81
	edge8ln	%o5,	%o7,	%i4
	subcc	%o0,	0x0275,	%g7
	tcc	%xcc,	0x7
	sll	%g5,	%o1,	%i2
	fbul	%fcc0,	loop_440
	array8	%g6,	%l1,	%g1
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x50] %asi,	%i0
loop_440:
	swap	[%l7 + 0x58],	%l2
	add	%l7,	0x54,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%g3
	movvc	%xcc,	%i3,	%o6
	sub	%o2,	%l0,	%i1
	ldd	[%l7 + 0x48],	%f14
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x2
	fbne	%fcc0,	loop_441
	nop
	setx loop_442, %l0, %l1
	jmpl %l1, %i7
	bshuffle	%f24,	%f22,	%f26
	tn	%xcc,	0x2
loop_441:
	movg	%icc,	%l5,	%l4
loop_442:
	xorcc	%o3,	%o4,	%g2
	fmovdcs	%xcc,	%f19,	%f31
	brgez,a	%i5,	loop_443
	umulcc	%g4,	0x070F,	%i6
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%o7
loop_443:
	nop
	fitod	%f10,	%f30
	fdtox	%f30,	%f12
	smulcc	%i4,	0x0E7A,	%o5
	fmovsvc	%icc,	%f28,	%f4
	array16	%g7,	%g5,	%o0
	alignaddrl	%i2,	%g6,	%l1
	set	0x22, %o3
	ldsba	[%l7 + %o3] 0x04,	%o1
	fmovdn	%icc,	%f27,	%f21
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i0
	casxa	[%l6] %asi,	%i0,	%l2
	movre	%l6,	0x104,	%g3
	ta	%icc,	0x2
	fandnot1	%f16,	%f14,	%f26
	subcc	%i3,	0x1756,	%o6
	stbar
	srlx	%o2,	%g1,	%l0
	movl	%xcc,	%l3,	%i7
	edge32ln	%l5,	%l4,	%i1
	move	%icc,	%o4,	%g2
	xor	%i5,	%g4,	%i6
	add	%o3,	0x0E8B,	%i4
	smulcc	%o5,	%o7,	%g7
	fsrc1s	%f16,	%f12
	tleu	%icc,	0x6
	mulscc	%o0,	%i2,	%g6
	fcmpeq16	%f18,	%f12,	%l1
	movrlez	%g5,	0x14C,	%i0
	wr	%g0,	0x19,	%asi
	stwa	%l2,	[%l7 + 0x74] %asi
	edge32ln	%o1,	%g3,	%i3
	tvc	%xcc,	0x1
	movre	%l6,	0x078,	%o6
	fbl	%fcc0,	loop_444
	subccc	%g1,	%o2,	%l3
	lduh	[%l7 + 0x46],	%i7
	tcc	%xcc,	0x3
loop_444:
	flush	%l7 + 0x34
	andcc	%l5,	0x15B9,	%l4
	movrne	%l0,	0x3FA,	%o4
	xorcc	%g2,	%i5,	%i1
	fpack16	%f14,	%f29
	tl	%xcc,	0x2
	fmul8x16	%f14,	%f4,	%f20
	array16	%i6,	%o3,	%g4
	fmovrslez	%o5,	%f27,	%f26
	set	0x50, %o1
	ldswa	[%l7 + %o1] 0x18,	%o7
	tvc	%icc,	0x0
	tcc	%xcc,	0x3
	stb	%g7,	[%l7 + 0x5D]
	edge8l	%o0,	%i4,	%i2
	fandnot2s	%f10,	%f22,	%f9
	edge32ln	%l1,	%g6,	%i0
	fmovrde	%l2,	%f20,	%f4
	fbg	%fcc0,	loop_445
	movleu	%xcc,	%o1,	%g5
	fandnot1	%f22,	%f6,	%f22
	fmovsleu	%icc,	%f18,	%f11
loop_445:
	smulcc	%i3,	%g3,	%o6
	ldub	[%l7 + 0x2E],	%g1
	move	%icc,	%o2,	%l3
	movn	%xcc,	%i7,	%l6
	bvs	loop_446
	taddcctv	%l5,	0x04C8,	%l0
	fpadd16	%f8,	%f2,	%f16
	subc	%l4,	0x0DCD,	%o4
loop_446:
	tvs	%xcc,	0x2
	prefetch	[%l7 + 0x2C],	 0x3
	fzero	%f26
	ldsh	[%l7 + 0x2E],	%i5
	set	0x40, %l5
	stda	%f0,	[%l7 + %l5] 0x16
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbge	%fcc0,	loop_447
	nop
	setx	loop_448,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tn	%xcc,	0x5
	sub	%g2,	0x0989,	%i1
loop_447:
	te	%icc,	0x7
loop_448:
	movl	%xcc,	%o3,	%i6
	nop
	setx	0x5F153446AA2B4E22,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x66529DFE2E477235,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f28,	%f18
	swap	[%l7 + 0x18],	%g4
	alignaddr	%o5,	%g7,	%o0
	srl	%i4,	%o7,	%i2
	stbar
	edge16n	%l1,	%i0,	%g6
	sra	%l2,	%g5,	%o1
	movle	%icc,	%g3,	%i3
	nop
	set	0x6B, %i4
	ldub	[%l7 + %i4],	%o6
	array32	%g1,	%o2,	%i7
	fmul8sux16	%f12,	%f4,	%f26
	fpack32	%f8,	%f24,	%f12
	movl	%xcc,	%l6,	%l5
	sethi	0x0E1F,	%l3
	membar	0x11
	movrne	%l0,	%o4,	%i5
	edge8	%l4,	%i1,	%o3
	tleu	%xcc,	0x6
	movrgez	%i6,	%g4,	%o5
	mova	%icc,	%g7,	%g2
	lduh	[%l7 + 0x16],	%o0
	fmovsle	%xcc,	%f11,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x1
	brgez	%o7,	loop_449
	fmuld8sux16	%f2,	%f5,	%f20
	ble,a	loop_450
	udiv	%i2,	0x0D2B,	%i4
loop_449:
	ta	%icc,	0x5
	fxor	%f0,	%f0,	%f18
loop_450:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l1,	%g6,	%i0
	orncc	%g5,	%o1,	%l2
	array32	%i3,	%g3,	%o6
	nop
	fitos	%f5,	%f8
	fstox	%f8,	%f4
	nop
	setx	0x66A2564B8415C393,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x27760A89BFA3FF62,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	faddd	%f6,	%f12,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%xcc,	%f24,	%f30
	nop
	setx	0xDA88951662D9A608,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x9F45C8829E160B67,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f8,	%f2
	flush	%l7 + 0x74
	addccc	%g1,	%i7,	%l6
	add	%l7,	0x10,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%o2
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f0
	fxtod	%f0,	%f12
	orcc	%l0,	0x0FE0,	%l3
	stb	%o4,	[%l7 + 0x50]
	fpackfix	%f8,	%f22
	movle	%xcc,	%l4,	%i1
	array8	%o3,	%i6,	%g4
	fpsub32s	%f21,	%f27,	%f9
	brlz,a	%o5,	loop_451
	tneg	%icc,	0x7
	sub	%i5,	%g7,	%g2
	orn	%o0,	%i2,	%o7
loop_451:
	fpadd32	%f28,	%f28,	%f28
	sth	%i4,	[%l7 + 0x1E]
	subc	%g6,	%i0,	%l1
	movrgz	%o1,	0x101,	%g5
	fnot1s	%f9,	%f9
	andn	%l2,	%i3,	%g3
	xor	%o6,	%i7,	%g1
	movrlz	%l6,	0x16D,	%o2
	tl	%icc,	0x1
	tsubcc	%l5,	%l0,	%o4
	brgz	%l3,	loop_452
	srl	%i1,	%l4,	%o3
	fmovdcc	%xcc,	%f3,	%f18
	orcc	%g4,	%i6,	%i5
loop_452:
	movne	%icc,	%g7,	%o5
	movcs	%xcc,	%g2,	%i2
	fblg,a	%fcc1,	loop_453
	tg	%icc,	0x3
	movre	%o0,	%i4,	%o7
	tsubcc	%i0,	%l1,	%o1
loop_453:
	xnor	%g6,	%l2,	%g5
	alignaddrl	%i3,	%o6,	%g3
	set	0x68, %o2
	ldsba	[%l7 + %o2] 0x10,	%g1
	fcmple16	%f10,	%f16,	%l6
	movcs	%xcc,	%o2,	%i7
	tgu	%icc,	0x0
	andcc	%l0,	0x1905,	%l5
	wr	%g0,	0x81,	%asi
	sta	%f24,	[%l7 + 0x38] %asi
	sub	%l3,	0x108A,	%i1
	movvs	%icc,	%o4,	%l4
	andncc	%g4,	%o3,	%i6
	ta	%xcc,	0x2
	udiv	%i5,	0x0C2E,	%o5
	nop
	setx	0xAE3DD44E4C1A186D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x1A91E58B1BD8A7A1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f14,	%f30
	bgu,a,pn	%xcc,	loop_454
	xor	%g2,	0x055C,	%g7
	and	%i2,	0x1AD0,	%i4
	tsubcctv	%o0,	0x1E21,	%o7
loop_454:
	tg	%icc,	0x3
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x64] %asi,	%l1
	fone	%f2
	nop
	fitos	%f6,	%f10
	fstoi	%f10,	%f24
	bvc	%icc,	loop_455
	fmovrse	%i0,	%f5,	%f15
	subccc	%g6,	0x0990,	%o1
	alignaddr	%g5,	%i3,	%o6
loop_455:
	tneg	%icc,	0x1
	fbue,a	%fcc1,	loop_456
	and	%g3,	0x1B7B,	%g1
	taddcc	%l6,	0x10F0,	%l2
	subcc	%i7,	%l0,	%l5
loop_456:
	udivx	%l3,	0x0254,	%i1
	ldstub	[%l7 + 0x2D],	%o4
	fmuld8sux16	%f21,	%f1,	%f18
	nop
	fitos	%f14,	%f29
	fstox	%f29,	%f4
	fxtos	%f4,	%f31
	fbug,a	%fcc0,	loop_457
	array16	%o2,	%l4,	%o3
	or	%g4,	%i5,	%i6
	movrlez	%g2,	0x0A5,	%g7
loop_457:
	bcs	loop_458
	sdivcc	%o5,	0x1733,	%i4
	membar	0x02
	be,a	%icc,	loop_459
loop_458:
	nop
	fitos	%f10,	%f5
	fstod	%f5,	%f28
	umul	%i2,	0x1FAC,	%o0
	nop
	fitos	%f12,	%f6
	fstoi	%f6,	%f3
loop_459:
	smulcc	%o7,	%l1,	%i0
	udivx	%o1,	0x011B,	%g5
	alignaddr	%g6,	%o6,	%g3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x34] %asi,	%g1
	lduh	[%l7 + 0x1E],	%i3
	orn	%l2,	0x00E0,	%l6
	movrlez	%l0,	%l5,	%l3
	fmovsa	%icc,	%f14,	%f11
	edge32	%i7,	%o4,	%i1
	fbge	%fcc0,	loop_460
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brgez,a	%o2,	loop_461
	tle	%icc,	0x2
loop_460:
	bneg,a	loop_462
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_461:
	ta	%icc,	0x3
	lduw	[%l7 + 0x08],	%o3
loop_462:
	srl	%g4,	0x09,	%l4
	udiv	%i6,	0x0EC4,	%g2
	movneg	%xcc,	%i5,	%o5
	tgu	%xcc,	0x5
	movn	%xcc,	%g7,	%i2
	addcc	%o0,	%o7,	%l1
	sdiv	%i4,	0x0DA5,	%i0
	umul	%o1,	%g5,	%g6
	fsrc2s	%f4,	%f3
	tl	%icc,	0x7
	xnorcc	%o6,	0x11CA,	%g1
	membar	0x75
	udivcc	%g3,	0x1454,	%l2
	tcs	%icc,	0x4
	add	%i3,	0x1DF0,	%l6
	tn	%icc,	0x1
	edge8ln	%l0,	%l5,	%l3
	sdivcc	%o4,	0x0A2B,	%i7
	tsubcctv	%i1,	0x1DC9,	%o3
	fones	%f10
	sub	%g4,	0x0496,	%l4
	fpsub32	%f4,	%f4,	%f2
	nop
	set	0x70, %l2
	std	%f22,	[%l7 + %l2]
	edge16l	%i6,	%g2,	%i5
	fnegs	%f10,	%f18
	edge16ln	%o5,	%o2,	%g7
	addc	%i2,	0x1035,	%o0
	tcs	%xcc,	0x7
	edge16l	%l1,	%i4,	%i0
	orcc	%o1,	0x12C0,	%g5
	stb	%o7,	[%l7 + 0x48]
	fmovrslz	%g6,	%f7,	%f20
	ld	[%l7 + 0x14],	%f26
	fandnot2s	%f16,	%f8,	%f6
	fones	%f2
	set	0x40, %i0
	stda	%f0,	[%l7 + %i0] 0x10
	movcs	%xcc,	%o6,	%g1
	xorcc	%g3,	%l2,	%i3
	fbul,a	%fcc1,	loop_463
	fnot1s	%f1,	%f0
	edge8l	%l6,	%l5,	%l3
	smulcc	%o4,	%i7,	%l0
loop_463:
	srl	%o3,	0x1D,	%g4
	tg	%xcc,	0x0
	edge16	%i1,	%i6,	%g2
	sth	%l4,	[%l7 + 0x0C]
	fbge	%fcc3,	loop_464
	fbe	%fcc0,	loop_465
	movle	%xcc,	%i5,	%o5
	fandnot1	%f26,	%f20,	%f6
loop_464:
	array32	%g7,	%i2,	%o0
loop_465:
	tl	%icc,	0x7
	tl	%xcc,	0x0
	bcc,a	loop_466
	stbar
	fxors	%f11,	%f14,	%f4
	fnegd	%f2,	%f12
loop_466:
	taddcctv	%o2,	0x1647,	%l1
	tsubcc	%i4,	%i0,	%g5
	membar	0x03
	tle	%icc,	0x0
	fxor	%f6,	%f24,	%f22
	orncc	%o7,	0x1EF4,	%g6
	fmovdcs	%icc,	%f3,	%f7
	movvs	%xcc,	%o6,	%g1
	bn	%xcc,	loop_467
	tg	%xcc,	0x4
	for	%f16,	%f22,	%f28
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_467:
	nop
	wr	%g0,	0x04,	%asi
	stha	%o1,	[%l7 + 0x3E] %asi
	edge32	%g3,	%l2,	%l6
	ta	%icc,	0x3
	mova	%icc,	%i3,	%l3
	fmovdg	%xcc,	%f26,	%f30
	brlez	%l5,	loop_468
	tg	%xcc,	0x6
	movle	%xcc,	%o4,	%l0
	set	0x35, %i5
	ldstuba	[%l7 + %i5] 0x04,	%o3
loop_468:
	movcs	%xcc,	%i7,	%g4
	nop
	set	0x0C, %o6
	stw	%i6,	[%l7 + %o6]
	ldd	[%l7 + 0x70],	%f28
	array32	%g2,	%l4,	%i5
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x18,	%f16
	nop
	fitod	%f6,	%f4
	fdtos	%f4,	%f16
	subccc	%o5,	0x071E,	%g7
	wr	%g0,	0x80,	%asi
	stwa	%i1,	[%l7 + 0x28] %asi
	tvc	%xcc,	0x4
	mulx	%o0,	%o2,	%l1
	fmovdvs	%xcc,	%f1,	%f14
	bne	loop_469
	brlez,a	%i2,	loop_470
	ld	[%l7 + 0x08],	%f2
	tpos	%icc,	0x0
loop_469:
	ble,a	loop_471
loop_470:
	movg	%xcc,	%i4,	%g5
	brgz,a	%o7,	loop_472
	srl	%g6,	%o6,	%i0
loop_471:
	fxnors	%f22,	%f9,	%f5
	wr	%g0,	0x04,	%asi
	sta	%f8,	[%l7 + 0x08] %asi
loop_472:
	tleu	%icc,	0x0
	sth	%o1,	[%l7 + 0x4C]
	fbg,a	%fcc1,	loop_473
	edge8	%g3,	%g1,	%l6
	sir	0x102B
	fmovsg	%icc,	%f4,	%f8
loop_473:
	movvc	%icc,	%i3,	%l2
	ldsw	[%l7 + 0x0C],	%l3
	umulcc	%l5,	0x069F,	%o4
	nop
	setx	loop_474,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udivx	%l0,	0x102A,	%i7
	popc	0x05D9,	%g4
	ta	%icc,	0x6
loop_474:
	nop
	setx	loop_475,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fcmpgt32	%f14,	%f18,	%o3
	movg	%icc,	%i6,	%g2
	wr	%g0,	0x10,	%asi
	stwa	%i5,	[%l7 + 0x0C] %asi
loop_475:
	movneg	%icc,	%o5,	%g7
	tsubcctv	%i1,	%o0,	%l4
	array8	%l1,	%i2,	%i4
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovrslz	%o2,	%f14,	%f4
	alignaddrl	%g5,	%g6,	%o6
	bcc,a,pn	%icc,	loop_476
	udiv	%o7,	0x19A0,	%i0
	fbule,a	%fcc2,	loop_477
	stb	%g3,	[%l7 + 0x57]
loop_476:
	smulcc	%o1,	%l6,	%i3
	nop
	setx loop_478, %l0, %l1
	jmpl %l1, %l2
loop_477:
	xorcc	%l3,	0x11BB,	%l5
	sir	0x01ED
	fmul8ulx16	%f28,	%f4,	%f24
loop_478:
	fbg	%fcc3,	loop_479
	movpos	%icc,	%o4,	%l0
	sdivx	%g1,	0x1FEA,	%g4
	taddcc	%o3,	%i7,	%i6
loop_479:
	mulx	%g2,	%i5,	%o5
	set	0x40, %g6
	ldda	[%l7 + %g6] 0x19,	%f16
	fandnot1s	%f17,	%f25,	%f16
	fble	%fcc3,	loop_480
	alignaddrl	%g7,	%o0,	%i1
	sdivcc	%l4,	0x1B8D,	%i2
	tvs	%xcc,	0x2
loop_480:
	fpmerge	%f6,	%f1,	%f4
	tge	%xcc,	0x0
	brz,a	%l1,	loop_481
	nop
	fitos	%f1,	%f9
	fstox	%f9,	%f8
	fxtos	%f8,	%f20
	movrlz	%i4,	%o2,	%g5
	smul	%g6,	%o7,	%o6
loop_481:
	subcc	%i0,	0x1E0D,	%g3
	andcc	%l6,	%i3,	%o1
	tg	%icc,	0x2
	edge32ln	%l3,	%l5,	%l2
	xnorcc	%o4,	0x19F9,	%g1
	fornot2	%f26,	%f28,	%f24
	lduh	[%l7 + 0x48],	%g4
	edge32ln	%l0,	%o3,	%i7
	set	0x3E, %l3
	lduba	[%l7 + %l3] 0x10,	%i6
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%i4
	bcc,pt	%icc,	loop_482
	fmovrsgz	%o5,	%f21,	%f3
	nop
	fitos	%f12,	%f16
	fstoi	%f16,	%f24
	tne	%xcc,	0x2
loop_482:
	array32	%g7,	%o0,	%g2
	nop
	set	0x12, %i3
	sth	%l4,	[%l7 + %i3]
	set	0x6B, %i1
	ldsba	[%l7 + %i1] 0x14,	%i2
	tl	%xcc,	0x6
	fmovsn	%icc,	%f28,	%f30
	movvc	%xcc,	%l1,	%i1
	udivcc	%i4,	0x1FF6,	%o2
	tpos	%icc,	0x2
	movg	%xcc,	%g5,	%o7
	sub	%o6,	0x19BB,	%g6
	nop
	setx	0x7060F059,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x89,	%f0
	fsrc2	%f18,	%f20
	movrne	%i0,	%l6,	%g3
	sdivcc	%i3,	0x11FE,	%o1
	wr	%g0,	0x1e,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
	stw	%l3,	[%l7 + 0x44]
	fmuld8sux16	%f12,	%f30,	%f16
	tsubcc	%l2,	0x1058,	%o4
	tcs	%xcc,	0x6
	sub	%g1,	0x1289,	%g4
	or	%l0,	0x0D4C,	%l5
	fxors	%f29,	%f29,	%f21
	fnor	%f20,	%f0,	%f12
	fmovrdgez	%o3,	%f0,	%f14
	prefetch	[%l7 + 0x24],	 0x1
	nop
	setx	0xC4663CA5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x258752ED,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fmuls	%f29,	%f23,	%f1
	fandnot1	%f24,	%f8,	%f2
	bgu,a	loop_483
	movrlz	%i6,	0x0BD,	%i5
	flush	%l7 + 0x1C
	nop
	setx	0x5EC1123A0CE454D0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x1B234F46CE246235,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fmuld	%f24,	%f20,	%f8
loop_483:
	tgu	%xcc,	0x2
	edge32l	%o5,	%g7,	%o0
	fmovdleu	%icc,	%f15,	%f4
	tne	%icc,	0x4
	movcs	%icc,	%i7,	%l4
	nop
	setx	0x65583A12,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	setx	0x09736F1A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fdivs	%f25,	%f7,	%f0
	fbug	%fcc1,	loop_484
	movrgez	%i2,	%g2,	%l1
	set	0x0A, %i2
	lduha	[%l7 + %i2] 0x10,	%i1
loop_484:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o2,	0x1D95,	%i4
	brgz,a	%g5,	loop_485
	and	%o7,	%g6,	%i0
	movrgez	%l6,	%g3,	%o6
	fmovrslez	%o1,	%f2,	%f8
loop_485:
	tl	%icc,	0x4
	tcs	%icc,	0x3
	alignaddr	%i3,	%l3,	%l2
	fmul8ulx16	%f20,	%f16,	%f26
	mova	%icc,	%o4,	%g4
	set	0x4C, %l4
	stwa	%l0,	[%l7 + %l4] 0x18
	edge16	%g1,	%l5,	%i6
	ldsb	[%l7 + 0x57],	%o3
	brgez,a	%i5,	loop_486
	taddcctv	%g7,	0x1BAB,	%o5
	alignaddr	%i7,	%o0,	%l4
	addcc	%g2,	%i2,	%l1
loop_486:
	sll	%o2,	0x07,	%i4
	tleu	%icc,	0x4
	udiv	%g5,	0x098B,	%o7
	mulx	%i1,	0x119A,	%g6
	nop
	setx loop_487, %l0, %l1
	jmpl %l1, %l6
	sub	%g3,	%i0,	%o1
	movre	%i3,	%l3,	%l2
	fsrc2s	%f26,	%f2
loop_487:
	srlx	%o6,	0x0F,	%o4
	ldstub	[%l7 + 0x52],	%l0
	set	0x30, %l0
	ldda	[%l7 + %l0] 0x81,	%g4
	tle	%icc,	0x5
	mova	%icc,	%l5,	%g1
	set	0x08, %i6
	lduwa	[%l7 + %i6] 0x10,	%o3
	fpsub32s	%f11,	%f9,	%f1
	tvc	%xcc,	0x3
	srlx	%i6,	%g7,	%o5
	popc	%i7,	%o0
	fmovdgu	%xcc,	%f9,	%f25
	movne	%icc,	%l4,	%g2
	bg	%xcc,	loop_488
	membar	0x35
	bl,a	%icc,	loop_489
	srax	%i5,	0x01,	%l1
loop_488:
	fbne	%fcc3,	loop_490
	fpsub16s	%f9,	%f31,	%f27
loop_489:
	addccc	%o2,	0x0DC6,	%i2
	movvc	%icc,	%g5,	%i4
loop_490:
	edge32n	%i1,	%g6,	%o7
	brz	%l6,	loop_491
	fpadd32	%f20,	%f16,	%f4
	addcc	%i0,	%o1,	%i3
	fsrc2s	%f11,	%f11
loop_491:
	xnorcc	%g3,	%l2,	%l3
	fmovrsne	%o6,	%f8,	%f28
	edge32n	%o4,	%g4,	%l5
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g1
	umul	%o3,	0x10A3,	%l0
	movrgz	%g7,	%o5,	%i6
	fbue,a	%fcc3,	loop_492
	fmovspos	%icc,	%f16,	%f17
	tvc	%xcc,	0x4
	tpos	%icc,	0x4
loop_492:
	sdivcc	%i7,	0x1AB3,	%o0
	fbl	%fcc3,	loop_493
	mulscc	%g2,	%l4,	%i5
	srlx	%l1,	%i2,	%o2
	array8	%g5,	%i4,	%i1
loop_493:
	fmovsn	%icc,	%f7,	%f15
	movle	%icc,	%o7,	%g6
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	fbo,a	%fcc1,	loop_494
	fbug	%fcc2,	loop_495
	edge32n	%i0,	%i3,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_494:
	array32	%g3,	%l3,	%o6
loop_495:
	mova	%icc,	%l2,	%g4
	alignaddr	%o4,	%g1,	%l5
	taddcctv	%o3,	%l0,	%o5
	set	0x24, %g4
	stba	%i6,	[%l7 + %g4] 0x2f
	membar	#Sync
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x89,	%i7,	%g7
	tcc	%xcc,	0x0
	edge8	%g2,	%o0,	%l4
	edge32n	%i5,	%i2,	%l1
	ta	%xcc,	0x4
	nop
	setx loop_496, %l0, %l1
	jmpl %l1, %g5
	fnegs	%f26,	%f21
	movvs	%xcc,	%i4,	%o2
	brgz,a	%o7,	loop_497
loop_496:
	nop
	fitod	%f8,	%f2
	fdtos	%f2,	%f2
	movge	%xcc,	%g6,	%l6
	alignaddr	%i1,	%i0,	%o1
loop_497:
	fxors	%f9,	%f12,	%f29
	fmuld8ulx16	%f21,	%f10,	%f12
	fbul	%fcc0,	loop_498
	alignaddrl	%g3,	%l3,	%i3
	andn	%l2,	0x09AF,	%o6
	edge8l	%g4,	%g1,	%l5
loop_498:
	movne	%xcc,	%o3,	%o4
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x1D] %asi,	%o5
	membar	0x7A
	tl	%icc,	0x3
	movneg	%icc,	%l0,	%i7
	tcc	%icc,	0x5
	nop
	setx	0x25E42E4F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x409F10FD,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f6,	%f22
	pdist	%f0,	%f2,	%f24
	xnorcc	%g7,	%i6,	%g2
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x18] %asi,	%f2
	tl	%icc,	0x2
	fmovrsgz	%o0,	%f22,	%f29
	fnands	%f27,	%f28,	%f20
	fmovde	%xcc,	%f17,	%f2
	brnz	%l4,	loop_499
	brz	%i2,	loop_500
	fmovsvs	%xcc,	%f26,	%f23
	be,pn	%xcc,	loop_501
loop_499:
	movrgez	%l1,	0x189,	%g5
loop_500:
	movgu	%xcc,	%i4,	%o2
	fmovrdgez	%i5,	%f6,	%f26
loop_501:
	ldstub	[%l7 + 0x58],	%g6
	ldd	[%l7 + 0x30],	%f24
	te	%icc,	0x1
	smulcc	%o7,	0x0783,	%l6
	fmovsvs	%xcc,	%f12,	%f23
	array8	%i1,	%i0,	%o1
	sdivx	%g3,	0x0327,	%l3
	nop
	setx	loop_502,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movle	%xcc,	%i3,	%o6
	tg	%xcc,	0x1
	movge	%xcc,	%g4,	%l2
loop_502:
	addccc	%g1,	0x1FE6,	%l5
	taddcc	%o3,	0x0D13,	%o5
	call	loop_503
	fmovrslez	%o4,	%f1,	%f3
	nop
	setx	loop_504,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdiv	%i7,	0x16AB,	%g7
loop_503:
	bge,a	%icc,	loop_505
	mulx	%i6,	%l0,	%o0
loop_504:
	fbuge	%fcc0,	loop_506
	brlz	%l4,	loop_507
loop_505:
	edge16n	%g2,	%i2,	%g5
	tvs	%icc,	0x2
loop_506:
	fabsd	%f24,	%f2
loop_507:
	movrgz	%i4,	%o2,	%l1
	movneg	%xcc,	%g6,	%i5
	movle	%xcc,	%o7,	%l6
	fpsub16s	%f29,	%f23,	%f22
	movl	%icc,	%i0,	%i1
	smulcc	%g3,	0x1BA4,	%o1
	fors	%f21,	%f28,	%f2
	edge8n	%l3,	%i3,	%g4
	movne	%xcc,	%l2,	%o6
	xorcc	%g1,	0x181C,	%l5
	taddcc	%o5,	0x10EF,	%o3
	movrgz	%i7,	%o4,	%g7
	tvc	%xcc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l0,	0x145,	%i6
	te	%icc,	0x2
	ldx	[%l7 + 0x20],	%o0
	array16	%l4,	%i2,	%g5
	tcc	%icc,	0x2
	edge32n	%g2,	%i4,	%l1
	fba	%fcc2,	loop_508
	tcs	%icc,	0x0
	addccc	%g6,	0x0EA9,	%i5
	tcs	%icc,	0x0
loop_508:
	srlx	%o7,	0x0E,	%o2
	set	0x28, %g2
	prefetcha	[%l7 + %g2] 0x81,	 0x1
	fmovsgu	%xcc,	%f3,	%f13
	andncc	%l6,	%i1,	%o1
	movneg	%xcc,	%g3,	%l3
	edge8	%i3,	%l2,	%o6
	te	%xcc,	0x5
	tpos	%xcc,	0x2
	tle	%icc,	0x2
	bvs,a	loop_509
	movrlez	%g4,	0x14B,	%g1
	movrgez	%o5,	0x374,	%l5
	set	0x4D, %o5
	lduba	[%l7 + %o5] 0x18,	%o3
loop_509:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o4,	%g7,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x28],	 0x2
	edge32	%i6,	%o0,	%i7
	nop
	set	0x6E, %o0
	ldsb	[%l7 + %o0],	%l4
	popc	%i2,	%g2
	set	0x7A, %o7
	lduba	[%l7 + %o7] 0x14,	%g5
	set	0x51, %l1
	stba	%l1,	[%l7 + %l1] 0x15
	sll	%i4,	%g6,	%i5
	xor	%o2,	0x1E87,	%o7
	fsrc1	%f4,	%f18
	tcs	%xcc,	0x6
	fbo,a	%fcc2,	loop_510
	nop
	setx loop_511, %l0, %l1
	jmpl %l1, %i0
	addc	%i1,	0x15D1,	%l6
	fbn	%fcc3,	loop_512
loop_510:
	bge,a	loop_513
loop_511:
	movne	%icc,	%o1,	%g3
	movg	%xcc,	%i3,	%l3
loop_512:
	or	%o6,	%l2,	%g4
loop_513:
	addccc	%g1,	%l5,	%o5
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x44] %asi,	%o4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x10] %asi,	%o3
	edge8l	%g7,	%l0,	%i6
	fbge	%fcc0,	loop_514
	movl	%icc,	%o0,	%l4
	nop
	fitod	%f10,	%f8
	fdtos	%f8,	%f0
	fxor	%f26,	%f28,	%f14
loop_514:
	xnor	%i7,	0x02F6,	%i2
	array32	%g5,	%g2,	%l1
	fmovsne	%xcc,	%f24,	%f2
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x08] %asi,	%g6
	fbue,a	%fcc3,	loop_515
	tne	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcc	%i4,	0x10BA,	%o2
loop_515:
	edge8	%i5,	%o7,	%i0
	brgz,a	%l6,	loop_516
	taddcc	%i1,	0x1EC5,	%g3
	smulcc	%i3,	%o1,	%o6
	sra	%l2,	0x0F,	%g4
loop_516:
	srax	%l3,	%g1,	%o5
	umulcc	%l5,	%o3,	%o4
	ldd	[%l7 + 0x28],	%g6
	nop
	setx	0xD32B689C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0x8C0165B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f3,	%f24
	tsubcctv	%i6,	%o0,	%l0
	bpos,pt	%icc,	loop_517
	srl	%l4,	0x0E,	%i2
	fpsub16s	%f2,	%f20,	%f17
	movne	%icc,	%i7,	%g5
loop_517:
	fbo	%fcc1,	loop_518
	te	%xcc,	0x4
	movn	%xcc,	%l1,	%g2
	tneg	%icc,	0x1
loop_518:
	popc	0x1A01,	%g6
	add	%l7,	0x2C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%i5
	nop
	setx	0xD97D6730D3534D18,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xD3F1DC4B236EFA08,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fmuld	%f18,	%f20,	%f28
	fones	%f26
	fmovsn	%icc,	%f31,	%f0
	umulcc	%o2,	0x1B50,	%i0
	fxnors	%f26,	%f18,	%f12
	mova	%xcc,	%l6,	%o7
	nop
	setx	loop_519,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%g3,	0x12E,	%i3
	movg	%icc,	%i1,	%o1
	fmovrsgz	%o6,	%f20,	%f24
loop_519:
	srax	%g4,	0x07,	%l2
	or	%l3,	0x18EF,	%o5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l5,	%g1
	srlx	%o4,	0x06,	%g7
	bcs,a,pn	%icc,	loop_520
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%f4
	ba,pt	%xcc,	loop_521
loop_520:
	movre	%i6,	0x0F3,	%o3
	fmovspos	%xcc,	%f18,	%f15
	sdivx	%l0,	0x070B,	%l4
loop_521:
	bvs	%icc,	loop_522
	fcmpne32	%f0,	%f8,	%i2
	xorcc	%i7,	%g5,	%l1
	sth	%g2,	[%l7 + 0x5A]
loop_522:
	fmovse	%xcc,	%f5,	%f9
	edge8n	%o0,	%i4,	%i5
	tpos	%icc,	0x1
	be,a,pt	%icc,	loop_523
	fors	%f14,	%f3,	%f14
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x18] %asi,	%g6
loop_523:
	nop
	wr	%g0,	0xe2,	%asi
	stba	%i0,	[%l7 + 0x3A] %asi
	membar	#Sync
	edge16ln	%l6,	%o7,	%o2
	membar	0x5A
	fmovsn	%icc,	%f8,	%f3
	andn	%g3,	0x1310,	%i1
	tneg	%icc,	0x4
	movrlez	%i3,	%o6,	%o1
	sir	0x05C5
	tg	%xcc,	0x1
	fmul8x16au	%f9,	%f2,	%f2
	movrgz	%l2,	0x232,	%l3
	bn,a,pt	%icc,	loop_524
	swap	[%l7 + 0x6C],	%o5
	edge16	%l5,	%g1,	%g4
	andncc	%g7,	%o4,	%i6
loop_524:
	nop
	wr	%g0,	0x89,	%asi
	sta	%f16,	[%l7 + 0x64] %asi
	subc	%l0,	%l4,	%o3
	movleu	%xcc,	%i2,	%g5
	array8	%i7,	%g2,	%o0
	movcs	%xcc,	%i4,	%l1
	array32	%g6,	%i0,	%l6
	array32	%i5,	%o7,	%g3
	membar	0x47
	movcs	%icc,	%i1,	%i3
	fbuge,a	%fcc2,	loop_525
	umulcc	%o6,	%o1,	%o2
	subc	%l2,	0x15FC,	%l3
	movneg	%icc,	%l5,	%o5
loop_525:
	edge16	%g4,	%g1,	%g7
	fpsub32	%f24,	%f8,	%f4
	fmovsne	%icc,	%f7,	%f13
	movcs	%xcc,	%i6,	%l0
	movrgez	%o4,	0x008,	%l4
	edge16l	%i2,	%o3,	%i7
	subc	%g2,	%o0,	%g5
	ba	loop_526
	udiv	%l1,	0x0DC8,	%i4
	alignaddrl	%i0,	%g6,	%l6
	umulcc	%o7,	0x1946,	%i5
loop_526:
	xnor	%i1,	0x1124,	%i3
	edge16n	%g3,	%o6,	%o1
	alignaddrl	%l2,	%l3,	%l5
	flush	%l7 + 0x14
	movre	%o2,	%g4,	%o5
	bge,a,pt	%icc,	loop_527
	tvc	%xcc,	0x1
	bn	loop_528
	fbo,a	%fcc0,	loop_529
loop_527:
	fba	%fcc2,	loop_530
	orcc	%g7,	%i6,	%l0
loop_528:
	subccc	%g1,	%o4,	%l4
loop_529:
	lduw	[%l7 + 0x40],	%o3
loop_530:
	mova	%icc,	%i7,	%i2
	tcs	%icc,	0x2
	edge8l	%g2,	%g5,	%l1
	alignaddr	%i4,	%o0,	%i0
	nop
	set	0x2D, %l6
	stb	%g6,	[%l7 + %l6]
	orncc	%o7,	0x05D8,	%l6
	fnot2s	%f20,	%f0
	movpos	%xcc,	%i5,	%i1
	fmovsg	%xcc,	%f25,	%f17
	fnot1s	%f24,	%f14
	nop
	setx loop_531, %l0, %l1
	jmpl %l1, %g3
	movle	%icc,	%o6,	%o1
	fcmpgt32	%f26,	%f20,	%i3
	lduw	[%l7 + 0x58],	%l2
loop_531:
	nop
	set	0x40, %g3
	lduwa	[%l7 + %g3] 0x11,	%l5
	xorcc	%o2,	%l3,	%g4
	fmovsneg	%icc,	%f21,	%f13
	smulcc	%g7,	%o5,	%i6
	taddcctv	%l0,	%o4,	%g1
	pdist	%f26,	%f2,	%f4
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x54] %asi,	%f18
	fmovrsgz	%l4,	%f11,	%f25
	bcc	%xcc,	loop_532
	nop
	setx loop_533, %l0, %l1
	jmpl %l1, %o3
	fmovsneg	%icc,	%f18,	%f7
	set	0x7C, %o4
	stwa	%i7,	[%l7 + %o4] 0xe3
	membar	#Sync
loop_532:
	fsrc1s	%f27,	%f20
loop_533:
	bcs,a	%xcc,	loop_534
	tcc	%xcc,	0x0
	move	%icc,	%i2,	%g5
	movleu	%xcc,	%l1,	%g2
loop_534:
	bpos,a	loop_535
	sub	%o0,	0x0DAB,	%i4
	orncc	%g6,	%o7,	%l6
	fnegd	%f14,	%f18
loop_535:
	nop
	setx	0xB327116CA186DEBA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	fsqrtd	%f30,	%f16
	tge	%icc,	0x3
	fmuld8sux16	%f1,	%f11,	%f10
	subc	%i5,	%i1,	%g3
	fand	%f4,	%f20,	%f20
	ldsw	[%l7 + 0x4C],	%i0
	addc	%o6,	0x198F,	%i3
	alignaddr	%l2,	%l5,	%o2
	sir	0x0EC5
	nop
	setx	0x9A56655E0A8C64C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	fsqrtd	%f2,	%f6
	fmovrslez	%o1,	%f14,	%f7
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x70] %asi,	%g4
	fmovdcs	%xcc,	%f13,	%f15
	stb	%g7,	[%l7 + 0x1E]
	and	%l3,	%o5,	%l0
	std	%f4,	[%l7 + 0x28]
	mulx	%i6,	0x1A76,	%o4
	edge16ln	%l4,	%o3,	%i7
	bgu,pt	%icc,	loop_536
	fsrc1	%f14,	%f24
	st	%f4,	[%l7 + 0x70]
	andncc	%i2,	%g5,	%l1
loop_536:
	movrgz	%g1,	0x373,	%o0
	add	%l7,	0x6C,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%g6
	nop
	setx	loop_537,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	smulcc	%o7,	0x02C5,	%g2
	movrlez	%i5,	0x338,	%i1
	taddcc	%g3,	0x1813,	%l6
loop_537:
	srl	%i0,	%i3,	%o6
	fcmpgt32	%f22,	%f0,	%l2
	movle	%xcc,	%o2,	%o1
	fmovrdgez	%l5,	%f24,	%f4
	andncc	%g7,	%l3,	%o5
	brnz,a	%l0,	loop_538
	tcs	%icc,	0x0
	taddcctv	%g4,	0x0A89,	%o4
	fba	%fcc3,	loop_539
loop_538:
	movrne	%l4,	%i6,	%i7
	xnor	%i2,	0x1069,	%g5
	tl	%xcc,	0x0
loop_539:
	fmovrslez	%l1,	%f29,	%f26
	subcc	%o3,	0x0E4C,	%g1
	movrne	%o0,	%i4,	%g6
	fbu,a	%fcc3,	loop_540
	movcc	%xcc,	%o7,	%i5
	sll	%g2,	%g3,	%i1
	wr	%g0,	0xea,	%asi
	stha	%i0,	[%l7 + 0x5E] %asi
	membar	#Sync
loop_540:
	nop
	fitos	%f4,	%f5
	fstoi	%f5,	%f6
	bcc	loop_541
	array32	%i3,	%l6,	%o6
	movl	%icc,	%o2,	%l2
	set	0x35, %g7
	stba	%l5,	[%l7 + %g7] 0x0c
loop_541:
	movrgz	%o1,	%g7,	%l3
	move	%icc,	%o5,	%g4
	or	%o4,	0x148B,	%l4
	tsubcc	%l0,	%i6,	%i2
	movrgz	%i7,	0x025,	%l1
	movrne	%o3,	%g5,	%g1
	tge	%xcc,	0x2
	subc	%o0,	%g6,	%o7
	call	loop_542
	fmovrsgz	%i5,	%f3,	%f13
	nop
	setx	0x56B1179EE81E0011,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x1336C981DBCB008B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f4,	%f14
	movvs	%icc,	%g2,	%i4
loop_542:
	fmovdl	%xcc,	%f14,	%f19
	sir	0x13D6
	brnz	%g3,	loop_543
	sir	0x007B
	nop
	fitod	%f0,	%f24
	fdtoi	%f24,	%f5
	fbg	%fcc3,	loop_544
loop_543:
	movpos	%icc,	%i1,	%i0
	smul	%i3,	0x020B,	%l6
	nop
	setx	0xB1312766,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f8
loop_544:
	fors	%f10,	%f21,	%f7
	brlez,a	%o2,	loop_545
	fmovdvc	%icc,	%f23,	%f6
	stx	%o6,	[%l7 + 0x40]
	xor	%l5,	0x0D71,	%o1
loop_545:
	movrlez	%g7,	%l3,	%l2
	fblg,a	%fcc2,	loop_546
	stx	%g4,	[%l7 + 0x10]
	set	0x14, %g1
	lduwa	[%l7 + %g1] 0x18,	%o4
loop_546:
	nop
	set	0x18, %o1
	ldxa	[%g0 + %o1] 0x50,	%o5
	move	%xcc,	%l4,	%l0
	movge	%xcc,	%i6,	%i2
	fmul8x16	%f2,	%f30,	%f8
	call	loop_547
	fcmple16	%f6,	%f18,	%i7
	movne	%xcc,	%l1,	%o3
	fnot1s	%f24,	%f0
loop_547:
	orcc	%g5,	0x0014,	%o0
	tge	%icc,	0x7
	fones	%f6
	stw	%g6,	[%l7 + 0x1C]
	edge8ln	%o7,	%i5,	%g1
	edge32n	%g2,	%i4,	%g3
	sir	0x018A
	fmovd	%f24,	%f0
	fbge	%fcc3,	loop_548
	subc	%i0,	%i1,	%i3
	move	%xcc,	%o2,	%l6
	bcs	%xcc,	loop_549
loop_548:
	edge8n	%l5,	%o6,	%g7
	fcmpgt16	%f12,	%f18,	%o1
	edge32ln	%l2,	%g4,	%l3
loop_549:
	orn	%o5,	0x0D83,	%o4
	bvs,a	loop_550
	xnorcc	%l0,	%l4,	%i6
	andn	%i7,	%i2,	%l1
	edge16n	%o3,	%o0,	%g5
loop_550:
	fmovsvs	%xcc,	%f24,	%f4
	set	0x75, %o3
	stba	%o7,	[%l7 + %o3] 0xeb
	membar	#Sync
	edge16ln	%g6,	%i5,	%g1
	nop
	setx	loop_551,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movrlz	%i4,	%g2,	%i0
	nop
	setx	0x1D99C050,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xA59A5803,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f18,	%f31
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x68] %asi,	%g3
loop_551:
	edge8	%i1,	%o2,	%l6
	bne	loop_552
	movle	%xcc,	%i3,	%l5
	bgu,a,pt	%xcc,	loop_553
	bge,pt	%icc,	loop_554
loop_552:
	membar	0x7A
	tg	%xcc,	0x6
loop_553:
	xnorcc	%g7,	%o1,	%l2
loop_554:
	fmovrslz	%g4,	%f28,	%f29
	tgu	%icc,	0x0
	taddcc	%o6,	0x0C2B,	%o5
	tsubcc	%l3,	%o4,	%l0
	nop
	setx	loop_555,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge8ln	%i6,	%l4,	%i2
	or	%i7,	0x05ED,	%l1
	tleu	%xcc,	0x5
loop_555:
	nop
	set	0x60, %l5
	stwa	%o0,	[%l7 + %l5] 0x22
	membar	#Sync
	fmul8sux16	%f28,	%f14,	%f28
	edge32n	%g5,	%o7,	%o3
	fsrc1s	%f11,	%f10
	bpos,pn	%icc,	loop_556
	popc	%g6,	%g1
	array16	%i5,	%g2,	%i0
	fpadd16	%f22,	%f10,	%f6
loop_556:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x24,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%g3
	movrgz	%o2,	%i1,	%i3
	fmovrslez	%l6,	%f30,	%f31
	srax	%l5,	0x1B,	%g7
	fmovdpos	%xcc,	%f22,	%f28
	fsrc2	%f18,	%f22
	nop
	setx	0xFA8658D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x7723E54B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f13,	%f18
	ldsh	[%l7 + 0x50],	%o1
	fcmpgt16	%f30,	%f6,	%g4
	movcc	%xcc,	%o6,	%l2
	edge8l	%l3,	%o4,	%l0
	addc	%i6,	%o5,	%l4
	xnor	%i7,	0x1FC1,	%i2
	move	%xcc,	%l1,	%g5
	fmovdn	%icc,	%f20,	%f20
	fsrc1s	%f12,	%f4
	fbule	%fcc1,	loop_557
	fpsub32s	%f1,	%f18,	%f3
	taddcc	%o0,	0x1094,	%o7
	movneg	%icc,	%o3,	%g1
loop_557:
	orcc	%g6,	%i5,	%g2
	movrne	%i4,	%g3,	%o2
	fandnot1s	%f21,	%f13,	%f3
	set	0x54, %i4
	lduha	[%l7 + %i4] 0x81,	%i1
	set	0x20, %l2
	ldxa	[%g0 + %l2] 0x4f,	%i3
	fmovse	%icc,	%f22,	%f28
	mulscc	%l6,	0x17E3,	%i0
	tge	%icc,	0x0
	xnorcc	%l5,	%g7,	%g4
	fmovsl	%xcc,	%f30,	%f15
	umul	%o6,	0x019E,	%l2
	movrlez	%o1,	%o4,	%l3
	fblg	%fcc2,	loop_558
	fmovrsgez	%i6,	%f19,	%f12
	edge16n	%l0,	%l4,	%o5
	ta	%xcc,	0x0
loop_558:
	tle	%xcc,	0x0
	subccc	%i7,	0x0C87,	%l1
	smul	%i2,	%g5,	%o0
	nop
	fitos	%f30,	%f31
	edge32	%o3,	%o7,	%g1
	edge32l	%g6,	%i5,	%i4
	for	%f6,	%f28,	%f14
	set	0x2C, %i0
	sta	%f4,	[%l7 + %i0] 0x89
	mova	%icc,	%g3,	%o2
	fmovdge	%xcc,	%f8,	%f17
	array32	%g2,	%i3,	%l6
	udivcc	%i1,	0x1183,	%l5
	ldub	[%l7 + 0x23],	%i0
	fmul8x16au	%f4,	%f19,	%f4
	fmovrdne	%g7,	%f28,	%f2
	tge	%icc,	0x0
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	umulcc	%o6,	0x04EE,	%l2
	bg,a,pt	%xcc,	loop_559
	movcc	%icc,	%g4,	%o4
	fcmple16	%f24,	%f28,	%o1
	array8	%l3,	%l0,	%l4
loop_559:
	edge8	%i6,	%i7,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0E36
	tvc	%icc,	0x6
	addc	%i2,	%o5,	%g5
	fmovsvs	%xcc,	%f30,	%f7
	bvs	%xcc,	loop_560
	sll	%o0,	0x18,	%o7
	movvs	%icc,	%o3,	%g1
	movcs	%xcc,	%g6,	%i4
loop_560:
	bn,a,pn	%xcc,	loop_561
	edge16l	%i5,	%g3,	%o2
	movgu	%icc,	%i3,	%l6
	fands	%f19,	%f24,	%f19
loop_561:
	edge8ln	%i1,	%l5,	%i0
	tcc	%xcc,	0x6
	bcs,a	%icc,	loop_562
	mulx	%g2,	0x07A9,	%g7
	movrlz	%l2,	0x0BD,	%g4
	taddcc	%o6,	0x0E93,	%o4
loop_562:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f6,	%f19
	fstox	%f19,	%f4
	fxtos	%f4,	%f1
	movcc	%icc,	%l3,	%l0
	subccc	%o1,	0x0288,	%l4
	fbe,a	%fcc2,	loop_563
	movre	%i7,	0x29F,	%l1
	ble	%xcc,	loop_564
	tneg	%xcc,	0x1
loop_563:
	sth	%i6,	[%l7 + 0x24]
	tne	%icc,	0x5
loop_564:
	edge32l	%o5,	%i2,	%o0
	sdivx	%o7,	0x197F,	%g5
	bvs,pn	%xcc,	loop_565
	fbne	%fcc1,	loop_566
	nop
	fitos	%f0,	%f23
	fstox	%f23,	%f14
	fxtos	%f14,	%f18
	nop
	setx	0x5063B8FC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	fsqrts	%f9,	%f5
loop_565:
	movpos	%xcc,	%g1,	%o3
loop_566:
	nop
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%i4
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
	nop
	setx	0x55D67A4890747A25,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	fmovrdgz	%g6,	%f0,	%f10
	brlez,a	%i5,	loop_568
loop_567:
	fble,a	%fcc1,	loop_569
	tg	%xcc,	0x5
	movrgz	%o2,	%i3,	%g3
loop_568:
	add	%l6,	%i1,	%l5
loop_569:
	edge8n	%i0,	%g7,	%g2
	nop
	fitos	%f2,	%f7
	fstoi	%f7,	%f26
	array16	%l2,	%g4,	%o6
	mulscc	%o4,	%l0,	%o1
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x14] %asi,	%l3
	nop
	setx	0xE6B3CDFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x003464EE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fdivs	%f11,	%f27,	%f4
	ble	loop_570
	fmovrsne	%l4,	%f16,	%f16
	bcs,a	loop_571
	ldx	[%l7 + 0x20],	%i7
loop_570:
	fbuge	%fcc2,	loop_572
	fmovdcc	%icc,	%f23,	%f29
loop_571:
	fbuge	%fcc2,	loop_573
	movge	%icc,	%l1,	%o5
loop_572:
	bvc,a	%xcc,	loop_574
	or	%i6,	%o0,	%o7
loop_573:
	movrgez	%g5,	0x2CE,	%g1
	fble,a	%fcc2,	loop_575
loop_574:
	fbl,a	%fcc2,	loop_576
	movcc	%icc,	%i2,	%o3
	ldsw	[%l7 + 0x34],	%g6
loop_575:
	edge16l	%i5,	%o2,	%i4
loop_576:
	nop
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	bcc,pn	%xcc,	loop_577
	stx	%g3,	[%l7 + 0x68]
	tpos	%icc,	0x5
	movgu	%xcc,	%l6,	%i1
loop_577:
	movvs	%icc,	%i3,	%l5
	sll	%g7,	%i0,	%g2
	and	%g4,	%o6,	%l2
	movle	%xcc,	%l0,	%o1
	fmul8sux16	%f28,	%f24,	%f22
	tl	%icc,	0x4
	set	0x7B, %i5
	lduba	[%l7 + %i5] 0x18,	%l3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x40] %asi,	%l4
	movneg	%xcc,	%i7,	%l1
	movrlez	%o5,	0x134,	%o4
	swap	[%l7 + 0x5C],	%o0
	fble,a	%fcc0,	loop_578
	stx	%i6,	[%l7 + 0x38]
	tcs	%icc,	0x2
	fble	%fcc2,	loop_579
loop_578:
	edge16n	%o7,	%g5,	%g1
	set	0x08, %o6
	lduwa	[%l7 + %o6] 0x15,	%i2
loop_579:
	fble	%fcc2,	loop_580
	fbg,a	%fcc2,	loop_581
	move	%xcc,	%o3,	%g6
	nop
	setx	0x9D65A446,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x700A9DC8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f4,	%f9
loop_580:
	xorcc	%i5,	0x0915,	%o2
loop_581:
	fcmple32	%f16,	%f4,	%g3
	tg	%icc,	0x6
	fnot2s	%f22,	%f3
	bvs,a	loop_582
	subc	%l6,	%i1,	%i3
	tsubcctv	%l5,	0x1D40,	%i4
	alignaddrl	%i0,	%g2,	%g4
loop_582:
	andcc	%o6,	0x10FC,	%l2
	movge	%icc,	%l0,	%o1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x04,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] 0x04,	%l3,	%g7
	or	%l4,	0x0F68,	%l1
	udivcc	%i7,	0x13B1,	%o4
	fmovscs	%xcc,	%f12,	%f12
	andn	%o5,	%o0,	%o7
	fnands	%f4,	%f2,	%f2
	movneg	%icc,	%i6,	%g1
	edge8	%i2,	%o3,	%g5
	fmovdvs	%icc,	%f20,	%f2
	tpos	%xcc,	0x7
	ble,a,pn	%icc,	loop_583
	array8	%i5,	%o2,	%g3
	fmovsg	%xcc,	%f30,	%f26
	fxnor	%f2,	%f6,	%f16
loop_583:
	bpos	loop_584
	add	%l6,	0x0B48,	%i1
	movre	%g6,	0x10E,	%i3
	ldx	[%l7 + 0x50],	%l5
loop_584:
	brgez	%i4,	loop_585
	nop
	setx	0xFA743A4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	fsqrts	%f28,	%f20
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%g2,	%i0
loop_585:
	movg	%icc,	%o6,	%g4
	edge16n	%l0,	%l2,	%o1
	andn	%g7,	0x09CA,	%l4
	fmul8sux16	%f4,	%f16,	%f12
	nop
	fitod	%f2,	%f8
	fdtos	%f8,	%f17
	udivcc	%l1,	0x135E,	%l3
	fpmerge	%f28,	%f1,	%f0
	smulcc	%i7,	0x0810,	%o5
	taddcctv	%o0,	%o4,	%i6
	add	%l7,	0x44,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] %asi,	%o7,	%i2
	brz,a	%o3,	loop_586
	movle	%xcc,	%g1,	%g5
	movcc	%xcc,	%i5,	%g3
	tvc	%icc,	0x4
loop_586:
	orn	%o2,	%i1,	%g6
	andncc	%i3,	%l6,	%i4
	addccc	%g2,	0x0FD4,	%l5
	tgu	%icc,	0x3
	tl	%icc,	0x7
	tcc	%icc,	0x1
	movle	%xcc,	%i0,	%o6
	fbue,a	%fcc3,	loop_587
	edge32ln	%g4,	%l0,	%o1
	smulcc	%l2,	%l4,	%l1
	fbue,a	%fcc1,	loop_588
loop_587:
	brz,a	%g7,	loop_589
	sub	%i7,	0x02CC,	%o5
	fmul8x16	%f27,	%f22,	%f12
loop_588:
	movvc	%xcc,	%l3,	%o4
loop_589:
	sllx	%i6,	%o7,	%i2
	mulscc	%o3,	%o0,	%g1
	subccc	%i5,	%g5,	%o2
	tvs	%xcc,	0x7
	edge16l	%i1,	%g6,	%g3
	move	%icc,	%i3,	%i4
	ldd	[%l7 + 0x18],	%g2
	nop
	setx loop_590, %l0, %l1
	jmpl %l1, %l5
	movcc	%icc,	%l6,	%i0
	tpos	%xcc,	0x3
	bleu,pn	%xcc,	loop_591
loop_590:
	fbn	%fcc0,	loop_592
	brgz	%o6,	loop_593
	movl	%xcc,	%l0,	%g4
loop_591:
	stb	%o1,	[%l7 + 0x5C]
loop_592:
	sdiv	%l4,	0x17A4,	%l1
loop_593:
	fexpand	%f11,	%f4
	edge32ln	%g7,	%i7,	%o5
	fcmple16	%f22,	%f8,	%l3
	mulscc	%l2,	%i6,	%o4
	taddcctv	%i2,	%o3,	%o0
	sdivx	%g1,	0x15CD,	%o7
	tsubcc	%g5,	0x0DBF,	%i5
	tcc	%xcc,	0x2
	sir	0x0D41
	wr	%g0,	0x18,	%asi
	ldstuba	[%l7 + 0x1D] %asi,	%i1
	movleu	%xcc,	%g6,	%o2
	array32	%i3,	%i4,	%g3
	tcc	%xcc,	0x7
	movneg	%xcc,	%l5,	%l6
	sub	%g2,	0x0198,	%i0
	edge8n	%o6,	%l0,	%g4
	fnand	%f20,	%f16,	%f12
	and	%l4,	0x0BBB,	%l1
	fpsub32	%f8,	%f28,	%f2
	movcs	%icc,	%o1,	%g7
	tcc	%icc,	0x5
	nop
	set	0x7A, %i7
	lduh	[%l7 + %i7],	%i7
	srax	%o5,	0x06,	%l2
	fba	%fcc1,	loop_594
	mova	%xcc,	%i6,	%l3
	nop
	set	0x08, %g6
	stw	%o4,	[%l7 + %g6]
	edge16n	%i2,	%o3,	%g1
loop_594:
	ldsh	[%l7 + 0x58],	%o7
	bneg,pn	%xcc,	loop_595
	movrne	%o0,	%g5,	%i5
	fmovrdgz	%i1,	%f30,	%f20
	tcs	%xcc,	0x2
loop_595:
	tpos	%xcc,	0x5
	bne,a	%xcc,	loop_596
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
	fmovdn	%icc,	%f29,	%f3
loop_596:
	nop
	set	0x14, %o2
	ldsha	[%l7 + %o2] 0x18,	%o2
	xorcc	%g6,	0x0A75,	%i3
	brgez,a	%g3,	loop_597
	fzeros	%f20
	movleu	%xcc,	%i4,	%l5
	bvc,a,pt	%xcc,	loop_598
loop_597:
	fba	%fcc0,	loop_599
	ldx	[%l7 + 0x60],	%l6
	srlx	%g2,	%i0,	%l0
loop_598:
	sethi	0x1219,	%o6
loop_599:
	ldd	[%l7 + 0x78],	%f26
	fbug,a	%fcc3,	loop_600
	fpadd16	%f20,	%f30,	%f8
	movg	%icc,	%l4,	%l1
	umul	%g4,	0x19BD,	%o1
loop_600:
	nop
	set	0x1E, %i3
	ldsh	[%l7 + %i3],	%i7
	tneg	%icc,	0x5
	fmuld8ulx16	%f5,	%f27,	%f14
	array16	%o5,	%g7,	%l2
	nop
	setx loop_601, %l0, %l1
	jmpl %l1, %l3
	add	%i6,	%i2,	%o4
	srl	%g1,	0x09,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_601:
	brlez,a	%o0,	loop_602
	edge8	%g5,	%i5,	%o7
	array8	%i1,	%o2,	%g6
	array32	%i3,	%g3,	%i4
loop_602:
	fcmpne32	%f26,	%f14,	%l5
	or	%l6,	0x18FE,	%g2
	tpos	%xcc,	0x7
	array32	%i0,	%l0,	%o6
	tvc	%icc,	0x7
	udivx	%l4,	0x0D9C,	%l1
	ta	%xcc,	0x2
	nop
	setx	0xA0163877,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x533BE275,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f18,	%f10
	or	%g4,	0x1EE1,	%i7
	tle	%xcc,	0x3
	fpsub16s	%f19,	%f13,	%f12
	stx	%o1,	[%l7 + 0x20]
	fbl	%fcc0,	loop_603
	movg	%xcc,	%g7,	%o5
	add	%l7,	0x34,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%l3
	casa	[%l6] %asi,	%l3,	%l2
loop_603:
	sra	%i6,	%o4,	%g1
	umul	%i2,	0x03C5,	%o3
	movrlz	%o0,	0x1CA,	%i5
	flush	%l7 + 0x74
	edge8ln	%o7,	%i1,	%g5
	fbul,a	%fcc2,	loop_604
	edge32n	%o2,	%i3,	%g6
	srl	%g3,	0x04,	%l5
	st	%f20,	[%l7 + 0x38]
loop_604:
	nop
	setx	0x93A2ABC9BFB3AB4B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x6AF53A4D1F62636E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f2,	%f2
	movrlz	%l6,	0x001,	%g2
	fornot2	%f0,	%f8,	%f16
	orn	%i4,	%l0,	%o6
	movge	%icc,	%i0,	%l1
	bn,a,pt	%icc,	loop_605
	movrlz	%l4,	0x086,	%g4
	taddcc	%o1,	0x0226,	%g7
	xnor	%o5,	0x1F0C,	%i7
loop_605:
	fmul8ulx16	%f6,	%f12,	%f30
	fnegs	%f8,	%f10
	tleu	%xcc,	0x3
	fmovsleu	%icc,	%f25,	%f14
	andn	%l2,	%l3,	%i6
	sub	%o4,	%i2,	%g1
	fexpand	%f13,	%f24
	nop
	setx	0x9386A4E17B0D87F1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x726D6DAFB5C05F0D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fsubd	%f12,	%f26,	%f22
	mulscc	%o3,	%o0,	%i5
	alignaddr	%o7,	%g5,	%o2
	fmovsg	%xcc,	%f8,	%f13
	alignaddrl	%i1,	%g6,	%g3
	udivx	%i3,	0x1DAB,	%l6
	sethi	0x07ED,	%l5
	nop
	fitod	%f18,	%f0
	orn	%g2,	%l0,	%i4
	edge32l	%o6,	%i0,	%l4
	sdivcc	%g4,	0x02FD,	%o1
	orncc	%g7,	%o5,	%i7
	umulcc	%l2,	0x0D51,	%l3
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x16] %asi,	%i6
	bpos,pt	%xcc,	loop_606
	fbne	%fcc0,	loop_607
	fbule	%fcc0,	loop_608
	bvs	%xcc,	loop_609
loop_606:
	nop
	set	0x30, %i1
	stb	%o4,	[%l7 + %i1]
loop_607:
	nop
	set	0x08, %g5
	ldd	[%l7 + %g5],	%l0
loop_608:
	sub	%g1,	0x0588,	%i2
loop_609:
	movgu	%icc,	%o0,	%i5
	umul	%o7,	%o3,	%o2
	nop
	setx	0x01FE8491,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x1F42ADF1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f24,	%f6
	bge,a	loop_610
	addccc	%i1,	0x185C,	%g6
	umul	%g3,	0x1747,	%i3
	sub	%l6,	%l5,	%g2
loop_610:
	udivx	%g5,	0x05D5,	%i4
	fnegs	%f25,	%f29
	bcs	%icc,	loop_611
	bvc,pt	%icc,	loop_612
	fbul	%fcc3,	loop_613
	edge16	%o6,	%i0,	%l0
loop_611:
	fmovdg	%xcc,	%f28,	%f26
loop_612:
	ldsh	[%l7 + 0x48],	%g4
loop_613:
	xorcc	%l4,	%o1,	%o5
	nop
	setx	0x2063290D,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	fmovdne	%icc,	%f9,	%f29
	tle	%xcc,	0x3
	xnor	%g7,	0x1A03,	%i7
	popc	%l2,	%i6
	movleu	%icc,	%l3,	%o4
	taddcctv	%l1,	0x17A8,	%g1
	membar	0x0E
	sra	%i2,	0x06,	%o0
	set	0x64, %i2
	lduwa	[%l7 + %i2] 0x80,	%i5
	xnorcc	%o7,	%o3,	%o2
	fpackfix	%f10,	%f28
	fmovrde	%i1,	%f20,	%f24
	tcs	%xcc,	0x0
	fbug	%fcc0,	loop_614
	tge	%icc,	0x5
	nop
	setx	0x15AA6DFCB5DAB384,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	fsqrtd	%f16,	%f26
	brlez,a	%g3,	loop_615
loop_614:
	bcs,a,pn	%xcc,	loop_616
	fmovdge	%xcc,	%f17,	%f16
	ldstub	[%l7 + 0x4F],	%g6
loop_615:
	tl	%icc,	0x1
loop_616:
	tle	%xcc,	0x3
	sra	%i3,	0x07,	%l6
	fmovrsgz	%l5,	%f14,	%f12
	smulcc	%g2,	%g5,	%i4
	fmovrslez	%o6,	%f14,	%f9
	sir	0x1FFE
	fbo,a	%fcc3,	loop_617
	nop
	setx	0x5816FBA67072F290,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	edge8n	%i0,	%l0,	%l4
	ldsw	[%l7 + 0x58],	%g4
loop_617:
	nop
	setx loop_618, %l0, %l1
	jmpl %l1, %o5
	edge16l	%g7,	%o1,	%i7
	array16	%i6,	%l3,	%l2
	fbg	%fcc2,	loop_619
loop_618:
	bneg,a,pt	%xcc,	loop_620
	fmovdl	%xcc,	%f5,	%f22
	movcc	%icc,	%o4,	%l1
loop_619:
	call	loop_621
loop_620:
	fpsub16	%f6,	%f30,	%f14
	fmovrslez	%i2,	%f16,	%f0
	sub	%g1,	%o0,	%o7
loop_621:
	subcc	%i5,	0x061C,	%o3
	fbl	%fcc1,	loop_622
	ldsh	[%l7 + 0x40],	%o2
	addc	%g3,	0x0C4F,	%g6
	nop
	setx loop_623, %l0, %l1
	jmpl %l1, %i3
loop_622:
	movvc	%xcc,	%i1,	%l6
	te	%xcc,	0x1
	edge16ln	%l5,	%g2,	%g5
loop_623:
	te	%xcc,	0x6
	bge,pn	%icc,	loop_624
	tleu	%icc,	0x1
	fbue,a	%fcc3,	loop_625
	faligndata	%f2,	%f18,	%f30
loop_624:
	fabss	%f8,	%f25
	tg	%xcc,	0x5
loop_625:
	or	%i4,	%i0,	%o6
	andn	%l0,	%g4,	%l4
	taddcc	%g7,	0x05FE,	%o5
	alignaddrl	%o1,	%i7,	%l3
	brgz,a	%l2,	loop_626
	fmovrdne	%o4,	%f26,	%f20
	add	%i6,	%i2,	%g1
	set	0x52, %l3
	stha	%l1,	[%l7 + %l3] 0xea
	membar	#Sync
loop_626:
	nop
	wr	%g0,	0x10,	%asi
	stha	%o7,	[%l7 + 0x18] %asi
	tvc	%icc,	0x7
	fxnor	%f26,	%f8,	%f0
	movrlz	%o0,	0x2FA,	%i5
	xnorcc	%o2,	%g3,	%g6
	udivcc	%i3,	0x118D,	%i1
	edge8l	%o3,	%l5,	%g2
	prefetch	[%l7 + 0x4C],	 0x3
	edge32l	%l6,	%i4,	%g5
	sdivcc	%o6,	0x11FF,	%l0
	tneg	%icc,	0x5
	orncc	%i0,	%g4,	%l4
	set	0x3E, %l4
	stha	%o5,	[%l7 + %l4] 0x15
	movrlez	%g7,	0x1E3,	%i7
	edge32	%l3,	%l2,	%o4
	edge32	%o1,	%i6,	%g1
	movneg	%xcc,	%i2,	%o7
	movgu	%icc,	%o0,	%i5
	fpsub32	%f30,	%f20,	%f8
	set	0x7F, %l0
	stba	%l1,	[%l7 + %l0] 0x80
	sdivcc	%g3,	0x0DA0,	%o2
	fnegs	%f29,	%f5
	tneg	%icc,	0x2
	subcc	%i3,	%i1,	%o3
	ta	%icc,	0x4
	orcc	%l5,	%g2,	%g6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i4,	%l6,	%g5
	fbug	%fcc0,	loop_627
	fnot1	%f28,	%f0
	fmovdcs	%xcc,	%f21,	%f24
	membar	0x7B
loop_627:
	fbu	%fcc0,	loop_628
	tvc	%icc,	0x6
	sra	%o6,	%i0,	%g4
	sra	%l0,	%l4,	%g7
loop_628:
	fmovsn	%icc,	%f18,	%f7
	edge32	%i7,	%l3,	%l2
	umulcc	%o5,	%o1,	%i6
	fornot2s	%f21,	%f18,	%f22
	prefetch	[%l7 + 0x48],	 0x2
	movpos	%xcc,	%g1,	%o4
	ba	%icc,	loop_629
	fxors	%f7,	%f8,	%f28
	srax	%o7,	0x19,	%o0
	bn,pt	%icc,	loop_630
loop_629:
	tvs	%xcc,	0x7
	edge32n	%i2,	%i5,	%l1
	udiv	%o2,	0x0972,	%g3
loop_630:
	fmovd	%f20,	%f10
	edge8ln	%i3,	%i1,	%o3
	ldd	[%l7 + 0x30],	%f6
	tl	%xcc,	0x7
	smul	%l5,	0x0CB4,	%g6
	fcmpgt32	%f18,	%f12,	%i4
	sdivx	%g2,	0x143B,	%l6
	array8	%g5,	%i0,	%g4
	fmovsne	%icc,	%f14,	%f31
	be,a,pn	%icc,	loop_631
	mulscc	%o6,	%l0,	%g7
	ldd	[%l7 + 0x70],	%l4
	brgez	%i7,	loop_632
loop_631:
	fbue,a	%fcc2,	loop_633
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ta	%icc,	0x4
loop_632:
	movne	%icc,	%l3,	%l2
loop_633:
	xorcc	%o1,	%o5,	%g1
	movvs	%icc,	%i6,	%o7
	sethi	0x1D83,	%o4
	taddcc	%o0,	0x07CF,	%i2
	fbuge	%fcc1,	loop_634
	movrgez	%i5,	%l1,	%o2
	move	%icc,	%i3,	%g3
	orncc	%i1,	0x004F,	%o3
loop_634:
	fmovsle	%xcc,	%f6,	%f11
	bleu,pn	%xcc,	loop_635
	sll	%l5,	0x1C,	%i4
	brnz	%g6,	loop_636
	movneg	%icc,	%l6,	%g2
loop_635:
	edge16ln	%g5,	%i0,	%g4
	fmovscs	%icc,	%f30,	%f6
loop_636:
	smul	%l0,	%g7,	%o6
	edge8	%i7,	%l3,	%l4
	edge8ln	%l2,	%o1,	%o5
	udivx	%g1,	0x048C,	%i6
	srax	%o7,	%o0,	%i2
	ld	[%l7 + 0x08],	%f3
	movvc	%icc,	%i5,	%l1
	fcmpgt16	%f4,	%f28,	%o2
	sdiv	%i3,	0x1090,	%g3
	fpsub32	%f0,	%f28,	%f8
	movcc	%xcc,	%o4,	%i1
	bcc,pn	%xcc,	loop_637
	bcc,pn	%icc,	loop_638
	tn	%xcc,	0x0
	sub	%o3,	0x1851,	%i4
loop_637:
	andn	%l5,	%l6,	%g6
loop_638:
	fcmple32	%f26,	%f12,	%g2
	fbule,a	%fcc1,	loop_639
	movg	%icc,	%i0,	%g5
	nop
	setx	loop_640,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subccc	%g4,	%l0,	%g7
loop_639:
	edge32	%o6,	%l3,	%l4
	movrgz	%i7,	0x276,	%o1
loop_640:
	orn	%o5,	0x13D1,	%g1
	array32	%l2,	%o7,	%o0
	addccc	%i2,	0x1903,	%i6
	movne	%icc,	%l1,	%i5
	fbu,a	%fcc1,	loop_641
	sdivcc	%i3,	0x1663,	%g3
	fmovsl	%icc,	%f1,	%f8
	tneg	%icc,	0x5
loop_641:
	fcmple32	%f10,	%f12,	%o4
	mova	%xcc,	%i1,	%o2
	nop
	setx	0x7BAA88430860E43D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f24
	fandnot1s	%f21,	%f11,	%f27
	tgu	%icc,	0x0
	tge	%icc,	0x2
	bpos	loop_642
	bneg,a,pn	%icc,	loop_643
	edge16ln	%i4,	%o3,	%l6
	ble,a	%icc,	loop_644
loop_642:
	movrlz	%g6,	0x0D1,	%l5
loop_643:
	xorcc	%i0,	0x0CA2,	%g2
	srlx	%g5,	0x16,	%g4
loop_644:
	edge16ln	%g7,	%l0,	%l3
	tge	%xcc,	0x1
	fbue,a	%fcc3,	loop_645
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x7
	ld	[%l7 + 0x68],	%f16
loop_645:
	movgu	%xcc,	%o6,	%l4
	srl	%o1,	%i7,	%g1
	set	0x56, %g4
	lduba	[%l7 + %g4] 0x10,	%l2
	sdivx	%o7,	0x0EA6,	%o5
	nop
	fitos	%f27,	%f30
	fmovda	%icc,	%f24,	%f26
	or	%o0,	0x04E8,	%i6
	brlez,a	%l1,	loop_646
	xnor	%i5,	0x0090,	%i2
	srl	%g3,	0x0E,	%o4
	ta	%xcc,	0x6
loop_646:
	sir	0x11C9
	nop
	setx	loop_647,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movle	%xcc,	%i3,	%o2
	for	%f22,	%f18,	%f12
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
loop_647:
	udivx	%o3,	0x016E,	%l6
	fmovsn	%icc,	%f9,	%f1
	sra	%g6,	%l5,	%i4
	edge8n	%g2,	%i0,	%g4
	brgez	%g5,	loop_648
	swap	[%l7 + 0x40],	%l0
	movvc	%icc,	%g7,	%o6
	for	%f14,	%f6,	%f30
loop_648:
	sub	%l3,	0x0A5B,	%l4
	andn	%i7,	0x1A6A,	%g1
	srax	%l2,	%o7,	%o1
	xor	%o5,	0x1808,	%i6
	set	0x49, %g2
	ldstuba	[%l7 + %g2] 0x89,	%l1
	fpsub32s	%f23,	%f23,	%f16
	fble	%fcc1,	loop_649
	bn,a,pt	%icc,	loop_650
	movrgz	%i5,	0x0B9,	%i2
	ldsh	[%l7 + 0x0C],	%g3
loop_649:
	bgu,pn	%xcc,	loop_651
loop_650:
	sdivx	%o0,	0x0318,	%i3
	movge	%xcc,	%o4,	%i1
	set	0x5C, %i6
	lda	[%l7 + %i6] 0x10,	%f11
loop_651:
	move	%xcc,	%o2,	%o3
	udivcc	%l6,	0x1261,	%g6
	membar	0x4A
	movcs	%icc,	%l5,	%i4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g2
	casxa	[%l6] %asi,	%g2,	%g4
	tsubcctv	%g5,	%l0,	%i0
	edge8ln	%o6,	%l3,	%g7
	set	0x61, %o5
	stba	%l4,	[%l7 + %o5] 0x2f
	membar	#Sync
	movrlez	%g1,	%i7,	%l2
	set	0x23, %o0
	ldstuba	[%l7 + %o0] 0x10,	%o1
	nop
	setx	0x006143FD,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	edge32l	%o5,	%i6,	%l1
	alignaddr	%i5,	%o7,	%i2
	fpack32	%f0,	%f18,	%f14
	tn	%icc,	0x6
	mulscc	%g3,	%o0,	%i3
	fsrc2s	%f30,	%f31
	xorcc	%i1,	0x1EC5,	%o4
	edge8	%o3,	%o2,	%g6
	udiv	%l6,	0x0C02,	%i4
	orcc	%g2,	0x1267,	%l5
	sdivx	%g4,	0x131A,	%g5
	move	%xcc,	%i0,	%o6
	umul	%l0,	%l3,	%l4
	bshuffle	%f18,	%f30,	%f0
	movre	%g7,	0x041,	%i7
	brgez,a	%l2,	loop_652
	brz,a	%o1,	loop_653
	movrlz	%o5,	%i6,	%g1
	fbge	%fcc2,	loop_654
loop_652:
	orn	%i5,	0x107A,	%o7
loop_653:
	sth	%l1,	[%l7 + 0x62]
	subc	%g3,	%i2,	%o0
loop_654:
	tcs	%icc,	0x6
	fmovsne	%icc,	%f7,	%f14
	array32	%i3,	%o4,	%i1
	nop
	setx	0x4E69FCF3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x630B95A8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fmuls	%f7,	%f11,	%f23
	movrne	%o2,	%o3,	%l6
	mulscc	%i4,	0x0101,	%g6
	edge32	%g2,	%g4,	%g5
	fmovsa	%icc,	%f31,	%f29
	fexpand	%f7,	%f24
	movrgez	%l5,	0x1C9,	%o6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x42] %asi,	%i0
	fxors	%f10,	%f21,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f23,	%f31
	bgu,a	loop_655
	fcmpgt32	%f22,	%f28,	%l0
	nop
	setx	0xB2967E67DAB36CD8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x7974D9EEA39C2172,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f4,	%f0
	fbul,a	%fcc3,	loop_656
loop_655:
	tn	%icc,	0x1
	edge16n	%l3,	%l4,	%g7
	fbg,a	%fcc2,	loop_657
loop_656:
	fmovspos	%icc,	%f26,	%f20
	fnot1	%f8,	%f2
	addccc	%i7,	0x14DC,	%l2
loop_657:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%i6
	fmovdleu	%icc,	%f7,	%f30
	fnands	%f13,	%f29,	%f24
	fmovscs	%xcc,	%f4,	%f25
	ldd	[%l7 + 0x38],	%f30
	set	0x46, %l1
	lduba	[%l7 + %l1] 0x0c,	%o1
	array32	%g1,	%i5,	%l1
	movrlz	%o7,	0x2FC,	%g3
	alignaddr	%o0,	%i2,	%o4
	fmovsge	%xcc,	%f14,	%f3
	nop
	setx	0x30A7575C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x485E37DA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fmuls	%f16,	%f9,	%f21
	fsrc1s	%f28,	%f13
	fmul8ulx16	%f24,	%f22,	%f22
	fmovde	%xcc,	%f12,	%f5
	tneg	%icc,	0x4
	fsrc1s	%f1,	%f31
	addccc	%i1,	%i3,	%o3
	tneg	%icc,	0x1
	or	%l6,	0x1ADF,	%o2
	xor	%i4,	0x1453,	%g6
	andcc	%g2,	%g5,	%l5
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x7E] %asi,	%g4
	fmovdleu	%icc,	%f14,	%f3
	tne	%xcc,	0x7
	edge8l	%o6,	%i0,	%l3
	tl	%icc,	0x4
	sdiv	%l4,	0x0FC7,	%l0
	tneg	%xcc,	0x3
	fones	%f24
	tsubcc	%g7,	%l2,	%i7
	tsubcc	%o5,	%o1,	%g1
	taddcc	%i6,	0x023C,	%i5
	subc	%o7,	0x14CB,	%g3
	bge,a	%xcc,	loop_658
	alignaddrl	%l1,	%i2,	%o4
	move	%icc,	%i1,	%i3
	ldsh	[%l7 + 0x2E],	%o3
loop_658:
	edge8	%l6,	%o0,	%o2
	bcs,a	loop_659
	alignaddr	%g6,	%i4,	%g2
	movvs	%icc,	%g5,	%g4
	movcs	%xcc,	%o6,	%i0
loop_659:
	fpmerge	%f22,	%f29,	%f6
	mulx	%l3,	0x10AE,	%l5
	movrgz	%l4,	0x13A,	%l0
	fones	%f5
	add	%g7,	%l2,	%i7
	fnor	%f30,	%f20,	%f8
	tleu	%icc,	0x3
	move	%xcc,	%o5,	%o1
	fabsd	%f0,	%f18
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g1
	sub	%i5,	0x0F1E,	%i6
	tl	%icc,	0x3
	fmovscs	%xcc,	%f20,	%f18
	call	loop_660
	ldd	[%l7 + 0x28],	%f20
	set	0x50, %o7
	ldxa	[%l7 + %o7] 0x81,	%o7
loop_660:
	srlx	%l1,	0x02,	%g3
	bvc	loop_661
	udiv	%i2,	0x12FE,	%o4
	fmovrdlz	%i1,	%f8,	%f0
	edge8ln	%i3,	%l6,	%o0
loop_661:
	tvc	%xcc,	0x7
	nop
	set	0x18, %l6
	ldsw	[%l7 + %l6],	%o3
	fzero	%f18
	movrgz	%g6,	0x32E,	%o2
	set	0x10, %g3
	prefetcha	[%l7 + %g3] 0x19,	 0x2
	wr	%g0,	0x11,	%asi
	sta	%f15,	[%l7 + 0x68] %asi
	movn	%icc,	%g5,	%g4
	fmovdcc	%xcc,	%f1,	%f3
	orcc	%i4,	%i0,	%l3
	movne	%icc,	%o6,	%l5
	nop
	setx loop_662, %l0, %l1
	jmpl %l1, %l0
	edge32ln	%l4,	%g7,	%i7
	ldsw	[%l7 + 0x10],	%l2
	umulcc	%o1,	0x0221,	%g1
loop_662:
	tcc	%icc,	0x0
	lduh	[%l7 + 0x20],	%i5
	edge16	%i6,	%o5,	%l1
	or	%g3,	0x122A,	%i2
	fandnot2s	%f12,	%f11,	%f18
	umul	%o7,	0x1B3B,	%o4
	movg	%xcc,	%i1,	%l6
	add	%i3,	0x01E2,	%o3
	fmovdneg	%xcc,	%f18,	%f21
	udiv	%g6,	0x1655,	%o2
	set	0x5D, %g7
	lduba	[%l7 + %g7] 0x18,	%g2
	sdivx	%g5,	0x1D73,	%g4
	edge16ln	%o0,	%i4,	%i0
	or	%l3,	0x1BF6,	%o6
	nop
	setx	loop_663,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fpmerge	%f0,	%f31,	%f14
	add	%l0,	%l5,	%g7
	tgu	%icc,	0x0
loop_663:
	andncc	%l4,	%l2,	%o1
	taddcctv	%g1,	%i5,	%i7
	fnot1	%f20,	%f14
	edge8ln	%o5,	%i6,	%l1
	set	0x40, %o4
	ldda	[%l7 + %o4] 0x11,	%f16
	set	0x8, %o1
	ldxa	[%g0 + %o1] 0x4f,	%i2
	fblg,a	%fcc3,	loop_664
	bvs,a,pn	%icc,	loop_665
	tpos	%icc,	0x4
	tne	%xcc,	0x1
loop_664:
	umulcc	%g3,	0x0BF4,	%o4
loop_665:
	bl,pn	%icc,	loop_666
	fmovda	%icc,	%f6,	%f16
	fmovrde	%i1,	%f2,	%f6
	membar	0x24
loop_666:
	nop
	setx	0x67C357A240462A7A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	edge32n	%l6,	%i3,	%o3
	alignaddrl	%g6,	%o7,	%o2
	subccc	%g5,	0x0924,	%g2
	fmovdcs	%icc,	%f10,	%f20
	movleu	%icc,	%g4,	%i4
	sdiv	%i0,	0x0DFB,	%l3
	add	%l7,	0x68,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x81,	%o0,	%o6
	edge8	%l0,	%l5,	%g7
	tneg	%xcc,	0x4
	udivx	%l4,	0x17C0,	%l2
	mulscc	%o1,	%g1,	%i7
	movneg	%icc,	%o5,	%i6
	tge	%icc,	0x5
	array32	%i5,	%l1,	%i2
	or	%g3,	%o4,	%i1
	movvc	%xcc,	%i3,	%l6
	xnor	%g6,	0x0D3E,	%o7
	edge32ln	%o2,	%o3,	%g2
	edge8l	%g4,	%i4,	%i0
	brnz,a	%l3,	loop_667
	fmovsvc	%icc,	%f1,	%f2
	bg	%icc,	loop_668
	tvc	%icc,	0x5
loop_667:
	tl	%xcc,	0x5
	addc	%o0,	0x0BB8,	%o6
loop_668:
	fble	%fcc2,	loop_669
	fbg	%fcc3,	loop_670
	mova	%xcc,	%l0,	%l5
	alignaddrl	%g7,	%l4,	%g5
loop_669:
	fpack16	%f16,	%f4
loop_670:
	nop
	wr	%g0,	0x80,	%asi
	stha	%o1,	[%l7 + 0x4C] %asi
	swap	[%l7 + 0x60],	%g1
	movrgz	%i7,	%l2,	%o5
	wr	%g0,	0x04,	%asi
	ldstuba	[%l7 + 0x5A] %asi,	%i5
	nop
	setx	0x640398CD717BFFB6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x312FDE3DB3FBACFA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f20,	%f16
	tvc	%xcc,	0x3
	tpos	%icc,	0x5
	fbug,a	%fcc1,	loop_671
	std	%f12,	[%l7 + 0x48]
	edge32	%i6,	%i2,	%l1
	ld	[%l7 + 0x7C],	%f13
loop_671:
	movleu	%icc,	%g3,	%o4
	edge8ln	%i1,	%i3,	%l6
	bgu,a	loop_672
	nop
	setx	loop_673,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	ldsw	[%l7 + 0x34],	%o7
	tn	%xcc,	0x0
loop_672:
	movleu	%icc,	%o2,	%g6
loop_673:
	orcc	%g2,	0x1D68,	%o3
	edge8	%i4,	%i0,	%g4
	fbne,a	%fcc2,	loop_674
	array32	%o0,	%l3,	%l0
	or	%l5,	0x0D57,	%o6
	fbn	%fcc1,	loop_675
loop_674:
	edge16l	%g7,	%g5,	%l4
	fmovrslez	%g1,	%f4,	%f22
	tle	%icc,	0x5
loop_675:
	subc	%o1,	%l2,	%i7
	edge16n	%i5,	%i6,	%o5
	smul	%l1,	0x1AD2,	%g3
	fbue	%fcc3,	loop_676
	fmovsle	%xcc,	%f20,	%f28
	set	0x40, %g1
	stda	%f0,	[%l7 + %g1] 0x18
loop_676:
	fmovscc	%icc,	%f25,	%f14
	tcs	%icc,	0x3
	bvs,a	%xcc,	loop_677
	te	%icc,	0x4
	brz	%i2,	loop_678
	fmovsgu	%icc,	%f24,	%f2
loop_677:
	taddcctv	%o4,	%i1,	%l6
	movneg	%xcc,	%o7,	%i3
loop_678:
	srax	%o2,	0x17,	%g2
	edge32l	%o3,	%i4,	%i0
	move	%icc,	%g4,	%g6
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	array16	%l0,	%l5,	%o6
	ldstub	[%l7 + 0x28],	%g7
	tge	%icc,	0x0
	edge16ln	%g5,	%l3,	%g1
	mulscc	%o1,	%l4,	%l2
	ldub	[%l7 + 0x58],	%i7
	xnorcc	%i5,	0x12C2,	%i6
	nop
	setx	loop_679,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	mulscc	%l1,	0x0EC5,	%g3
	smulcc	%i2,	%o4,	%i1
	mulscc	%o5,	0x0775,	%l6
loop_679:
	array16	%i3,	%o7,	%g2
	tge	%icc,	0x4
	sll	%o2,	0x1E,	%o3
	orn	%i4,	0x06F3,	%i0
	or	%g4,	0x1F5B,	%g6
	fmovsge	%icc,	%f25,	%f10
	fmovde	%xcc,	%f4,	%f28
	movrlz	%l0,	0x04B,	%o0
	fmuld8sux16	%f26,	%f14,	%f26
	tcc	%icc,	0x0
	call	loop_680
	add	%o6,	0x1722,	%g7
	xnor	%l5,	%g5,	%g1
	mova	%xcc,	%l3,	%l4
loop_680:
	flush	%l7 + 0x44
	fble	%fcc1,	loop_681
	fmovsvc	%icc,	%f27,	%f1
	srl	%l2,	0x09,	%o1
	std	%f20,	[%l7 + 0x20]
loop_681:
	udivx	%i7,	0x1A7C,	%i5
	nop
	setx	0xDBDE0B9F5A210C3E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x30C5639B176E8852,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f14,	%f0
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x6C] %asi,	%f14
	brz	%l1,	loop_682
	movn	%xcc,	%i6,	%g3
	subcc	%i2,	%o4,	%o5
	subccc	%i1,	%l6,	%o7
loop_682:
	nop
	setx	0x717A7DB0,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0xA2B886B4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fmuls	%f23,	%f26,	%f22
	set	0x44, %l5
	lda	[%l7 + %l5] 0x14,	%f22
	array32	%g2,	%o2,	%i3
	smul	%o3,	%i4,	%i0
	sra	%g4,	0x1E,	%l0
	sth	%o0,	[%l7 + 0x26]
	membar	0x1C
	fpadd16	%f26,	%f14,	%f6
	bge,pt	%xcc,	loop_683
	tpos	%icc,	0x5
	fmovdge	%icc,	%f16,	%f0
	udivx	%o6,	0x1BD6,	%g7
loop_683:
	fornot1	%f4,	%f24,	%f20
	fbg	%fcc2,	loop_684
	smul	%l5,	0x10C5,	%g5
	xorcc	%g6,	%g1,	%l4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_684:
	edge32	%l3,	%l2,	%i7
	fpackfix	%f20,	%f23
	sdiv	%i5,	0x08B8,	%o1
	stw	%i6,	[%l7 + 0x30]
	array16	%l1,	%i2,	%g3
	nop
	fitod	%f0,	%f2
	fdtos	%f2,	%f25
	movgu	%icc,	%o4,	%o5
	movg	%icc,	%i1,	%o7
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x10] %asi,	%l6
	movn	%xcc,	%g2,	%i3
	andcc	%o3,	0x101C,	%o2
	array32	%i4,	%g4,	%i0
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x50] %asi,	%o0
	subccc	%o6,	%g7,	%l0
	movle	%icc,	%g5,	%l5
	fpadd32	%f24,	%f12,	%f22
	srlx	%g1,	0x0E,	%l4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x18] %asi,	%g6
	wr	%g0,	0x81,	%asi
	stwa	%l2,	[%l7 + 0x68] %asi
	edge16	%l3,	%i5,	%o1
	xnor	%i7,	0x0CA7,	%l1
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x12] %asi,	%i2
	fmuld8ulx16	%f15,	%f0,	%f20
	movvc	%xcc,	%i6,	%g3
	orncc	%o4,	0x1D25,	%i1
	for	%f16,	%f8,	%f24
	array16	%o5,	%l6,	%o7
	set	0x4B, %i4
	lduba	[%l7 + %i4] 0x88,	%i3
	fmovrde	%o3,	%f0,	%f8
	andncc	%o2,	%g2,	%i4
	fba	%fcc1,	loop_685
	fcmple16	%f14,	%f2,	%i0
	fmovsne	%xcc,	%f4,	%f3
	fornot1s	%f28,	%f16,	%f19
loop_685:
	orn	%g4,	%o6,	%o0
	ldd	[%l7 + 0x48],	%f10
	tsubcc	%l0,	0x192B,	%g5
	nop
	setx	loop_686,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovde	%icc,	%f18,	%f3
	xnorcc	%g7,	%g1,	%l5
	addccc	%l4,	%g6,	%l3
loop_686:
	edge16ln	%i5,	%l2,	%o1
	srl	%l1,	%i7,	%i2
	fcmpeq16	%f22,	%f26,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o4,	0x354,	%g3
	ba,a	%xcc,	loop_687
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f28
	fxtod	%f28,	%f2
	xnor	%o5,	0x0607,	%l6
	taddcctv	%o7,	0x07B7,	%i3
loop_687:
	fmovsvc	%icc,	%f28,	%f5
	add	%l7,	0x10,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%i1,	%o3
	add	%o2,	0x1D80,	%i4
	fmovdne	%xcc,	%f14,	%f13
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x46] %asi,	%g2
	srax	%g4,	0x03,	%o6
	fnors	%f27,	%f16,	%f4
	tge	%xcc,	0x3
	edge32n	%o0,	%l0,	%i0
	movrgz	%g5,	%g1,	%g7
	movrgez	%l4,	%g6,	%l3
	mulx	%l5,	%l2,	%i5
	fcmpeq32	%f8,	%f20,	%l1
	fmovdcs	%xcc,	%f9,	%f22
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x62] %asi,	%o1
	edge16	%i7,	%i2,	%i6
	tle	%xcc,	0x6
	tcs	%xcc,	0x2
	call	loop_688
	movl	%xcc,	%o4,	%o5
	umulcc	%l6,	%o7,	%i3
	brlz	%g3,	loop_689
loop_688:
	tvs	%xcc,	0x1
	lduw	[%l7 + 0x7C],	%i1
	udivx	%o3,	0x15CD,	%o2
loop_689:
	orcc	%g2,	0x1844,	%i4
	bvs,a	loop_690
	tcs	%xcc,	0x4
	taddcc	%o6,	0x0642,	%o0
	movg	%icc,	%l0,	%i0
loop_690:
	umul	%g4,	%g5,	%g1
	tgu	%icc,	0x5
	movgu	%icc,	%l4,	%g7
	fnot2s	%f25,	%f0
	movre	%l3,	%g6,	%l5
	fornot2	%f12,	%f22,	%f24
	movle	%icc,	%i5,	%l2
	set	0x40, %l2
	stda	%f0,	[%l7 + %l2] 0x81
	movrlez	%o1,	0x29C,	%l1
	mulscc	%i7,	%i2,	%o4
	orcc	%i6,	%l6,	%o5
	tge	%icc,	0x7
	fmovsg	%xcc,	%f18,	%f17
	fbl,a	%fcc2,	loop_691
	fbue,a	%fcc2,	loop_692
	movrne	%i3,	0x10F,	%g3
	sdivx	%i1,	0x00E2,	%o7
loop_691:
	edge16ln	%o2,	%o3,	%i4
loop_692:
	fbu	%fcc3,	loop_693
	edge8ln	%g2,	%o6,	%o0
	fpsub16s	%f19,	%f3,	%f23
	fzero	%f30
loop_693:
	fbue,a	%fcc0,	loop_694
	edge16	%i0,	%g4,	%l0
	add	%g5,	%l4,	%g1
	movcc	%xcc,	%g7,	%l3
loop_694:
	udivx	%g6,	0x176B,	%l5
	nop
	setx	0x3076110E,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	movpos	%icc,	%l2,	%i5
	tne	%icc,	0x0
	lduw	[%l7 + 0x38],	%l1
	sdivcc	%o1,	0x0B8B,	%i7
	bneg	loop_695
	fpadd16s	%f31,	%f29,	%f27
	brlez	%i2,	loop_696
	brnz	%o4,	loop_697
loop_695:
	orn	%l6,	0x109B,	%i6
	movrne	%o5,	%g3,	%i1
loop_696:
	fmovrslz	%o7,	%f30,	%f25
loop_697:
	udivx	%i3,	0x101A,	%o3
	sra	%i4,	%o2,	%g2
	tge	%xcc,	0x5
	movrlez	%o0,	%o6,	%i0
	edge8l	%g4,	%g5,	%l0
	fornot1	%f30,	%f8,	%f26
	fmovse	%xcc,	%f2,	%f18
	fone	%f2
	fmuld8sux16	%f25,	%f25,	%f22
	tl	%icc,	0x1
	smul	%l4,	0x0DB0,	%g7
	bg	loop_698
	movge	%icc,	%l3,	%g1
	fmovdcs	%icc,	%f13,	%f14
	brlez,a	%g6,	loop_699
loop_698:
	tl	%icc,	0x3
	bl,pt	%xcc,	loop_700
	xnorcc	%l2,	0x0EEA,	%l5
loop_699:
	ldub	[%l7 + 0x44],	%l1
	fabss	%f28,	%f27
loop_700:
	popc	%i5,	%o1
	fpadd16s	%f26,	%f3,	%f12
	fcmpgt16	%f0,	%f16,	%i2
	brgez	%o4,	loop_701
	movrlez	%l6,	%i7,	%o5
	fbug,a	%fcc0,	loop_702
	movpos	%xcc,	%i6,	%g3
loop_701:
	srl	%i1,	0x0A,	%o7
	tcc	%icc,	0x5
loop_702:
	taddcctv	%i3,	%o3,	%o2
	std	%f2,	[%l7 + 0x08]
	alignaddrl	%g2,	%i4,	%o0
	xnorcc	%i0,	0x09A3,	%g4
	subccc	%g5,	%o6,	%l4
	fors	%f28,	%f22,	%f18
	be,a,pn	%xcc,	loop_703
	tcc	%xcc,	0x3
	ld	[%l7 + 0x54],	%f11
	add	%g7,	0x0AFA,	%l0
loop_703:
	srl	%l3,	0x1E,	%g1
	bvs	%icc,	loop_704
	st	%f11,	[%l7 + 0x64]
	umulcc	%l2,	%g6,	%l5
	ldd	[%l7 + 0x20],	%l0
loop_704:
	st	%f28,	[%l7 + 0x28]
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x48] %asi,	%i5
	wr	%g0,	0x81,	%asi
	stha	%i2,	[%l7 + 0x38] %asi
	taddcctv	%o4,	0x0923,	%o1
	movrlez	%l6,	0x344,	%i7
	ldsb	[%l7 + 0x71],	%o5
	brlez,a	%i6,	loop_705
	tcc	%icc,	0x2
	movrgz	%g3,	%i1,	%i3
	fmovdle	%xcc,	%f1,	%f16
loop_705:
	edge32l	%o7,	%o2,	%g2
	edge32l	%o3,	%i4,	%o0
	edge16n	%g4,	%g5,	%i0
	bl,a	loop_706
	fbl,a	%fcc2,	loop_707
	fbne	%fcc1,	loop_708
	fbg	%fcc0,	loop_709
loop_706:
	fmovdgu	%xcc,	%f9,	%f12
loop_707:
	nop
	fitod	%f10,	%f20
loop_708:
	nop
	set	0x50, %i0
	ldxa	[%l7 + %i0] 0x10,	%o6
loop_709:
	fbg,a	%fcc1,	loop_710
	fsrc1	%f30,	%f4
	edge16n	%g7,	%l4,	%l3
	nop
	setx	0xE04F2A44,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
loop_710:
	movcs	%xcc,	%l0,	%g1
	mulscc	%l2,	0x1488,	%g6
	movgu	%xcc,	%l5,	%i5
	srlx	%l1,	0x07,	%i2
	xnorcc	%o4,	0x1C5A,	%o1
	fnand	%f30,	%f14,	%f12
	fba	%fcc3,	loop_711
	fmul8x16al	%f31,	%f3,	%f10
	andcc	%l6,	0x13E6,	%o5
	fmovsle	%xcc,	%f5,	%f16
loop_711:
	movgu	%icc,	%i6,	%i7
	fmovsgu	%icc,	%f19,	%f2
	sethi	0x1B29,	%g3
	bvs,pn	%icc,	loop_712
	movne	%xcc,	%i1,	%o7
	tne	%icc,	0x1
	nop
	set	0x34, %i5
	lduw	[%l7 + %i5],	%o2
loop_712:
	movrlez	%g2,	0x2E9,	%i3
	fbge	%fcc3,	loop_713
	orncc	%o3,	0x1A7F,	%i4
	fpsub32s	%f7,	%f30,	%f22
	movrne	%g4,	%o0,	%g5
loop_713:
	mulscc	%i0,	0x14E3,	%g7
	edge16	%o6,	%l4,	%l3
	movvc	%xcc,	%l0,	%g1
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x70] %asi,	%l2
	tge	%icc,	0x1
	movrne	%l5,	%i5,	%l1
	subccc	%i2,	0x0C22,	%o4
	brgez,a	%o1,	loop_714
	tcc	%icc,	0x0
	bgu,pt	%icc,	loop_715
	ta	%xcc,	0x5
loop_714:
	and	%g6,	%o5,	%l6
	set	0x67, %o6
	stba	%i7,	[%l7 + %o6] 0x80
loop_715:
	nop
	fitod	%f10,	%f14
	fdtos	%f14,	%f9
	edge16n	%g3,	%i1,	%o7
	set	0x60, %i7
	lda	[%l7 + %i7] 0x18,	%f22
	add	%i6,	%o2,	%i3
	edge16n	%g2,	%i4,	%o3
	brgz	%o0,	loop_716
	movrgz	%g4,	0x242,	%i0
	fmovrslez	%g7,	%f4,	%f0
	edge32	%o6,	%l4,	%g5
loop_716:
	movrlez	%l0,	%l3,	%g1
	bg,a	loop_717
	fnand	%f30,	%f14,	%f30
	set	0x4E, %o3
	ldsba	[%l7 + %o3] 0x0c,	%l5
loop_717:
	xnorcc	%l2,	0x0B94,	%i5
	fornot1s	%f2,	%f6,	%f7
	fbug,a	%fcc2,	loop_718
	fzero	%f28
	set	0x16, %o2
	ldstuba	[%l7 + %o2] 0x81,	%i2
loop_718:
	nop
	fitod	%f0,	%f28
	fdtox	%f28,	%f30
	movre	%o4,	%o1,	%g6
	andn	%o5,	0x05E7,	%l1
	move	%icc,	%i7,	%g3
	fbuge,a	%fcc2,	loop_719
	fornot1	%f16,	%f30,	%f12
	mulx	%l6,	%o7,	%i6
	fcmple32	%f2,	%f24,	%i1
loop_719:
	edge16ln	%o2,	%g2,	%i3
	movre	%o3,	%i4,	%o0
	fpack32	%f24,	%f16,	%f16
	bl,pt	%xcc,	loop_720
	tpos	%xcc,	0x2
	movpos	%xcc,	%i0,	%g7
	te	%xcc,	0x3
loop_720:
	tleu	%icc,	0x6
	movl	%xcc,	%o6,	%l4
	fornot2s	%f21,	%f0,	%f23
	sethi	0x064A,	%g4
	fbl,a	%fcc2,	loop_721
	edge32l	%g5,	%l0,	%l3
	ble,pn	%xcc,	loop_722
	orcc	%g1,	%l2,	%i5
loop_721:
	fabss	%f13,	%f9
	ldub	[%l7 + 0x70],	%l5
loop_722:
	sub	%i2,	%o1,	%g6
	bneg,pt	%xcc,	loop_723
	bcc,pn	%xcc,	loop_724
	fbge	%fcc3,	loop_725
	movvc	%icc,	%o4,	%o5
loop_723:
	subc	%l1,	%g3,	%i7
loop_724:
	fmovdne	%icc,	%f28,	%f25
loop_725:
	nop
	fitos	%f11,	%f15
	fstoi	%f15,	%f29
	sdiv	%l6,	0x10CE,	%i6
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x81,	%o6
	fmovscc	%xcc,	%f14,	%f21
	fornot2	%f4,	%f2,	%f26
	fcmpgt32	%f10,	%f22,	%i1
	fnot1	%f26,	%f18
	fcmple16	%f30,	%f28,	%g2
	fble,a	%fcc2,	loop_726
	tge	%icc,	0x2
	sdivcc	%o2,	0x0083,	%o3
	fbo	%fcc2,	loop_727
loop_726:
	fmovrdgez	%i3,	%f18,	%f4
	movg	%xcc,	%i4,	%o0
	edge32l	%g7,	%o6,	%l4
loop_727:
	or	%g4,	%i0,	%g5
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x2E] %asi,	%l0
	xorcc	%g1,	0x0218,	%l3
	smul	%i5,	%l2,	%i2
	movrgez	%o1,	%l5,	%g6
	tge	%xcc,	0x1
	bleu	%xcc,	loop_728
	sdivx	%o5,	0x1CCF,	%l1
	lduh	[%l7 + 0x68],	%o4
	sth	%g3,	[%l7 + 0x7C]
loop_728:
	fmovdneg	%xcc,	%f24,	%f30
	andncc	%i7,	%l6,	%i6
	set	0x7F, %i3
	ldsba	[%l7 + %i3] 0x80,	%o7
	movrgez	%i1,	0x2F5,	%o2
	andn	%o3,	%g2,	%i3
	xorcc	%o0,	%g7,	%o6
	movl	%xcc,	%i4,	%g4
	edge8n	%l4,	%g5,	%l0
	std	%f8,	[%l7 + 0x40]
	ta	%icc,	0x0
	edge32n	%i0,	%l3,	%g1
	movl	%xcc,	%l2,	%i5
	edge32	%i2,	%o1,	%g6
	sra	%l5,	0x1F,	%o5
	add	%l1,	0x0B7E,	%o4
	set	0x40, %g5
	stda	%f16,	[%l7 + %g5] 0x88
	srl	%g3,	%l6,	%i7
	movle	%xcc,	%o7,	%i1
	set	0x10, %i1
	swapa	[%l7 + %i1] 0x89,	%i6
	fmul8sux16	%f0,	%f24,	%f2
	fxor	%f10,	%f8,	%f0
	movleu	%icc,	%o3,	%g2
	sub	%i3,	0x1C37,	%o2
	ldsb	[%l7 + 0x0C],	%g7
	bgu,a	%xcc,	loop_729
	movle	%xcc,	%o6,	%i4
	mova	%icc,	%g4,	%l4
	smulcc	%o0,	%g5,	%i0
loop_729:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x24] %asi,	%l3
	edge8	%l0,	%g1,	%l2
	movvs	%xcc,	%i5,	%o1
	sdivcc	%g6,	0x0106,	%i2
	edge8n	%l5,	%o5,	%o4
	taddcctv	%l1,	0x18E4,	%l6
	fsrc1s	%f25,	%f16
	fmuld8ulx16	%f9,	%f15,	%f2
	stw	%i7,	[%l7 + 0x28]
	subccc	%o7,	%i1,	%i6
	movg	%xcc,	%o3,	%g3
	nop
	fitod	%f0,	%f30
	fdtos	%f30,	%f22
	fmovda	%icc,	%f31,	%f4
	mulscc	%i3,	%o2,	%g7
	or	%g2,	%o6,	%g4
	fbn	%fcc3,	loop_730
	tcc	%xcc,	0x1
	array16	%i4,	%l4,	%o0
	movneg	%xcc,	%i0,	%g5
loop_730:
	array32	%l0,	%l3,	%g1
	fnor	%f26,	%f18,	%f24
	movrne	%l2,	%i5,	%o1
	fbne,a	%fcc0,	loop_731
	alignaddr	%i2,	%g6,	%o5
	subc	%l5,	0x07D7,	%o4
	movrne	%l6,	%l1,	%i7
loop_731:
	movleu	%icc,	%i1,	%o7
	fexpand	%f18,	%f12
	movre	%i6,	%o3,	%g3
	add	%i3,	%g7,	%o2
	movrgz	%g2,	%g4,	%o6
	tneg	%xcc,	0x5
	fsrc1s	%f18,	%f7
	fmovrse	%l4,	%f5,	%f9
	movrne	%o0,	%i4,	%g5
	bge	loop_732
	addcc	%l0,	0x1A5B,	%l3
	edge32l	%i0,	%g1,	%i5
	stb	%l2,	[%l7 + 0x6A]
loop_732:
	alignaddrl	%i2,	%g6,	%o5
	andn	%o1,	0x16F2,	%o4
	fmovrdgz	%l6,	%f26,	%f20
	fpsub16s	%f5,	%f21,	%f13
	movrne	%l5,	0x31F,	%l1
	nop
	fitod	%f2,	%f26
	fdtoi	%f26,	%f2
	mulscc	%i7,	0x0B11,	%o7
	tvs	%icc,	0x6
	tl	%icc,	0x5
	stw	%i6,	[%l7 + 0x10]
	fpack16	%f6,	%f17
	movleu	%icc,	%i1,	%o3
	tn	%xcc,	0x3
	edge32ln	%i3,	%g7,	%o2
	andncc	%g3,	%g4,	%o6
	movneg	%icc,	%l4,	%o0
	ta	%icc,	0x5
	fors	%f1,	%f12,	%f10
	stbar
	tcs	%xcc,	0x2
	movg	%icc,	%i4,	%g5
	tge	%icc,	0x3
	movle	%icc,	%g2,	%l0
	nop
	set	0x1C, %i2
	ldstub	[%l7 + %i2],	%i0
	set	0x40, %l4
	stda	%f0,	[%l7 + %l4] 0x14
	subccc	%l3,	0x0D31,	%g1
	or	%i5,	%l2,	%g6
	andcc	%o5,	0x14C8,	%i2
	fmovsle	%xcc,	%f2,	%f2
	mova	%icc,	%o1,	%l6
	set	0x5C, %l0
	ldswa	[%l7 + %l0] 0x18,	%l5
	movle	%xcc,	%l1,	%o4
	sllx	%o7,	%i7,	%i6
	brnz,a	%o3,	loop_733
	pdist	%f24,	%f8,	%f2
	tvc	%xcc,	0x2
	subc	%i1,	%g7,	%o2
loop_733:
	fbge,a	%fcc1,	loop_734
	nop
	setx	loop_735,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movg	%xcc,	%i3,	%g3
	fmovscc	%xcc,	%f17,	%f9
loop_734:
	movleu	%xcc,	%g4,	%o6
loop_735:
	nop
	fitos	%f8,	%f29
	fstox	%f29,	%f2
	xor	%l4,	0x0D27,	%i4
	fblg,a	%fcc2,	loop_736
	srl	%o0,	0x0E,	%g2
	wr	%g0,	0x0c,	%asi
	stxa	%l0,	[%l7 + 0x70] %asi
loop_736:
	edge8n	%i0,	%g5,	%g1
	ta	%icc,	0x3
	fmovdgu	%xcc,	%f7,	%f14
	nop
	setx	0x2A24A065,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x4D963BB0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f26,	%f2
	smul	%l3,	0x017E,	%i5
	stw	%g6,	[%l7 + 0x54]
	orcc	%l2,	%o5,	%o1
	fmuld8sux16	%f12,	%f28,	%f0
	tg	%icc,	0x6
	fandnot2s	%f29,	%f31,	%f0
	fbu	%fcc2,	loop_737
	mulx	%i2,	0x0B39,	%l5
	movre	%l1,	0x0C8,	%l6
	mulx	%o4,	%o7,	%i7
loop_737:
	umulcc	%o3,	0x1814,	%i6
	xnor	%g7,	%o2,	%i3
	array8	%i1,	%g3,	%o6
	orn	%l4,	0x0DF8,	%g4
	tneg	%icc,	0x3
	tneg	%icc,	0x0
	orn	%i4,	%g2,	%o0
	fexpand	%f21,	%f0
	fzero	%f20
	taddcctv	%i0,	%l0,	%g5
	umul	%l3,	0x1DED,	%i5
	movrne	%g6,	%g1,	%o5
	fmovdleu	%xcc,	%f20,	%f12
	tvc	%xcc,	0x2
	ld	[%l7 + 0x4C],	%f18
	srlx	%l2,	0x14,	%o1
	sth	%i2,	[%l7 + 0x20]
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x30, %g4
	ldsha	[%l7 + %g4] 0x18,	%l1
	fbne	%fcc0,	loop_738
	fmovdne	%icc,	%f7,	%f30
	move	%icc,	%l5,	%l6
	umul	%o4,	%i7,	%o3
loop_738:
	alignaddrl	%i6,	%g7,	%o2
	stw	%o7,	[%l7 + 0x10]
	mulscc	%i3,	0x0732,	%i1
	fmovdcs	%icc,	%f28,	%f21
	array16	%o6,	%l4,	%g4
	movg	%xcc,	%g3,	%i4
	ta	%xcc,	0x2
	sdiv	%g2,	0x1816,	%i0
	tcs	%xcc,	0x2
	edge16	%l0,	%g5,	%l3
	tg	%icc,	0x7
	movl	%xcc,	%i5,	%g6
	fmovrde	%o0,	%f22,	%f8
	fpsub32	%f20,	%f14,	%f14
	set	0x40, %g2
	stxa	%g1,	[%l7 + %g2] 0x88
	nop
	setx	0x7DE60A5E9779A2B9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xD879312A96DDF134,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f22,	%f22
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x2
	wr	%g0,	0x5f,	%asi
	stxa	%o1,	[%g0 + 0x0] %asi
	sllx	%o5,	0x18,	%l1
	and	%l5,	%l6,	%o4
	sra	%i7,	0x04,	%o3
	andcc	%i2,	0x1608,	%g7
	fbug,a	%fcc1,	loop_739
	orn	%i6,	0x08E8,	%o7
	smulcc	%i3,	%i1,	%o6
	movleu	%icc,	%l4,	%g4
loop_739:
	srlx	%o2,	%g3,	%i4
	nop
	fitos	%f14,	%f3
	fstox	%f3,	%f14
	fxtos	%f14,	%f15
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	sth	%g2,	[%l7 + 0x52]
	brnz	%i0,	loop_740
	movrgz	%g5,	0x2C9,	%l0
	orn	%l3,	0x0B70,	%i5
	sdiv	%o0,	0x08B3,	%g1
loop_740:
	bpos,a	%xcc,	loop_741
	fpack16	%f16,	%f11
	edge8l	%g6,	%o1,	%o5
	stb	%l2,	[%l7 + 0x0B]
loop_741:
	nop
	setx loop_742, %l0, %l1
	jmpl %l1, %l5
	array32	%l1,	%l6,	%i7
	fmovsle	%icc,	%f5,	%f11
	fbl	%fcc3,	loop_743
loop_742:
	move	%xcc,	%o3,	%o4
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
loop_743:
	bn,a,pn	%icc,	loop_744
	tvc	%icc,	0x4
	edge8	%i2,	%i6,	%o7
	taddcc	%g7,	0x04AD,	%i1
loop_744:
	fmuld8ulx16	%f25,	%f0,	%f28
	tsubcc	%i3,	0x1EC9,	%o6
	udiv	%g4,	0x1E37,	%o2
	fbuge	%fcc1,	loop_745
	nop
	setx	0x8B808BB9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xD200A2AE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f19,	%f0
	set	0x15, %i6
	ldstuba	[%l7 + %i6] 0x89,	%l4
loop_745:
	fmovdneg	%icc,	%f7,	%f16
	brnz	%i4,	loop_746
	orncc	%g2,	%i0,	%g3
	nop
	setx	loop_747,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8	%l0,	%g5,	%l3
loop_746:
	edge32n	%i5,	%g1,	%o0
	alignaddr	%o1,	%g6,	%l2
loop_747:
	fornot2	%f24,	%f10,	%f4
	and	%o5,	%l5,	%l1
	fandnot2s	%f18,	%f9,	%f22
	movvs	%xcc,	%i7,	%o3
	ldsb	[%l7 + 0x27],	%o4
	array16	%l6,	%i6,	%o7
	fbul	%fcc2,	loop_748
	fbug	%fcc3,	loop_749
	bge,a,pt	%xcc,	loop_750
	movgu	%icc,	%g7,	%i1
loop_748:
	addccc	%i3,	%i2,	%g4
loop_749:
	taddcctv	%o6,	%l4,	%o2
loop_750:
	mulscc	%g2,	0x1AAF,	%i0
	orncc	%g3,	0x17D8,	%i4
	movg	%xcc,	%g5,	%l3
	ldsb	[%l7 + 0x0F],	%i5
	alignaddr	%l0,	%o0,	%g1
	pdist	%f24,	%f12,	%f0
	nop
	setx	loop_751,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	stb	%o1,	[%l7 + 0x10]
	edge16n	%g6,	%o5,	%l5
	subc	%l1,	%i7,	%l2
loop_751:
	xor	%o3,	%o4,	%l6
	fmovrdgz	%o7,	%f30,	%f28
	edge32l	%i6,	%i1,	%g7
	edge16ln	%i3,	%i2,	%o6
	umul	%g4,	0x17AE,	%l4
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movrne	%g2,	0x072,	%o2
	andn	%i0,	0x0AA8,	%g3
	ldd	[%l7 + 0x10],	%f6
	fnors	%f22,	%f22,	%f13
	bne	%icc,	loop_752
	subccc	%g5,	%i4,	%l3
	stbar
	fmovrdgz	%l0,	%f30,	%f28
loop_752:
	udivx	%i5,	0x146C,	%g1
	tge	%xcc,	0x0
	fmovrdlez	%o0,	%f22,	%f16
	xorcc	%g6,	0x1289,	%o1
	xor	%o5,	%l5,	%i7
	tsubcc	%l2,	%l1,	%o3
	udiv	%o4,	0x1E25,	%l6
	tneg	%xcc,	0x2
	subc	%o7,	0x02F3,	%i6
	edge16ln	%i1,	%g7,	%i2
	movrne	%o6,	0x3FA,	%g4
	mova	%icc,	%i3,	%l4
	flush	%l7 + 0x10
	fmovrsgez	%o2,	%f11,	%f19
	nop
	setx	0xF3965C98376C2DE1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xB41EAEACDB83C077,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f16,	%f6
	taddcc	%g2,	%g3,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f8,	%f19
	movg	%icc,	%i4,	%g5
	umul	%l0,	0x1A7E,	%i5
	ta	%xcc,	0x7
	movpos	%xcc,	%l3,	%o0
	srlx	%g6,	0x15,	%g1
	nop
	fitod	%f4,	%f18
	fdtoi	%f18,	%f19
	sra	%o5,	%l5,	%o1
	edge16	%l2,	%l1,	%i7
	stbar
	tne	%xcc,	0x3
	st	%f30,	[%l7 + 0x10]
	subcc	%o3,	0x0F50,	%o4
	srlx	%o7,	0x13,	%i6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l6,	%i1,	%g7
	movgu	%icc,	%o6,	%i2
	movre	%g4,	%l4,	%i3
	subccc	%o2,	0x1291,	%g3
	tn	%icc,	0x0
	movn	%xcc,	%g2,	%i4
	nop
	setx	0x2CC9E3A2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x7C5F6309,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fdivs	%f5,	%f22,	%f6
	and	%i0,	%g5,	%i5
	tl	%xcc,	0x3
	taddcctv	%l0,	%o0,	%l3
	and	%g6,	%g1,	%l5
	movgu	%icc,	%o1,	%l2
	fbg,a	%fcc0,	loop_753
	addc	%l1,	0x1654,	%i7
	call	loop_754
	movgu	%xcc,	%o5,	%o4
loop_753:
	nop
	fitos	%f2,	%f25
	fstox	%f25,	%f16
	fxtos	%f16,	%f23
	orcc	%o7,	%i6,	%o3
loop_754:
	bpos,a	loop_755
	array16	%i1,	%l6,	%g7
	fnot2s	%f18,	%f1
	tl	%icc,	0x2
loop_755:
	nop
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%o6
	subcc	%g4,	%l4,	%i3
	edge16n	%o2,	%g3,	%g2
	move	%icc,	%i4,	%i2
	fmovsgu	%icc,	%f4,	%f12
	mova	%icc,	%i0,	%i5
	ldsh	[%l7 + 0x26],	%l0
	pdist	%f22,	%f8,	%f30
	prefetch	[%l7 + 0x40],	 0x3
	edge8l	%g5,	%l3,	%o0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x81,	%asi
	casxa	[%l6] 0x81,	%g6,	%g1
	movge	%icc,	%o1,	%l2
	move	%xcc,	%l1,	%i7
	edge8	%o5,	%o4,	%l5
	movre	%o7,	%i6,	%o3
	fmuld8sux16	%f13,	%f4,	%f8
	fmovrdlz	%i1,	%f14,	%f6
	edge16l	%l6,	%o6,	%g4
	nop
	setx	0x1F549F26,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f9
	movn	%xcc,	%l4,	%g7
	movrgz	%o2,	%g3,	%g2
	array32	%i4,	%i2,	%i3
	movrlz	%i0,	%l0,	%i5
	fbo,a	%fcc0,	loop_756
	fnegd	%f14,	%f24
	fmovdcc	%xcc,	%f10,	%f14
	bl,a	%icc,	loop_757
loop_756:
	srax	%g5,	%l3,	%g6
	set	0x14, %l3
	lda	[%l7 + %l3] 0x88,	%f20
loop_757:
	tsubcctv	%o0,	%o1,	%g1
	brnz	%l2,	loop_758
	orncc	%i7,	%l1,	%o5
	fandnot2	%f20,	%f20,	%f20
	fcmple16	%f18,	%f12,	%o4
loop_758:
	stx	%o7,	[%l7 + 0x18]
	nop
	setx	0x8EB582A29F1B2093,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x63FE372E13A41C9B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f20,	%f0
	srl	%l5,	%o3,	%i1
	fzeros	%f5
	flush	%l7 + 0x4C
	edge32	%i6,	%o6,	%l6
	movvc	%xcc,	%g4,	%l4
	sra	%o2,	0x1F,	%g7
	addc	%g3,	0x1C21,	%i4
	fmovrdne	%i2,	%f18,	%f26
	movrne	%i3,	0x21E,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g2,	%l0,	%i5
	fmovsl	%xcc,	%f30,	%f6
	xnor	%g5,	0x072F,	%l3
	nop
	setx	0xEB8EE32000734B42,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	edge16l	%g6,	%o1,	%g1
	addc	%o0,	%i7,	%l1
	fmovsl	%icc,	%f28,	%f29
	fbuge,a	%fcc3,	loop_759
	fbl,a	%fcc0,	loop_760
	add	%l2,	0x1D49,	%o5
	ba	loop_761
loop_759:
	fbl	%fcc0,	loop_762
loop_760:
	fpadd32	%f0,	%f0,	%f0
	movneg	%xcc,	%o4,	%l5
loop_761:
	prefetch	[%l7 + 0x2C],	 0x3
loop_762:
	fnegd	%f16,	%f18
	fcmple16	%f22,	%f10,	%o3
	movvs	%icc,	%i1,	%i6
	bvc,a	loop_763
	movleu	%icc,	%o6,	%l6
	movvc	%xcc,	%g4,	%l4
	udiv	%o7,	0x1A59,	%o2
loop_763:
	movvs	%icc,	%g7,	%g3
	addcc	%i2,	%i3,	%i0
	sir	0x01A8
	bne,a	%xcc,	loop_764
	array32	%g2,	%l0,	%i5
	fmovrdne	%g5,	%f20,	%f16
	orcc	%i4,	%l3,	%o1
loop_764:
	nop
	wr	%g0,	0x18,	%asi
	ldsha	[%l7 + 0x2C] %asi,	%g1
	fbule,a	%fcc1,	loop_765
	xorcc	%o0,	0x1E6C,	%i7
	fmovrdne	%g6,	%f24,	%f10
	movrgz	%l2,	0x153,	%l1
loop_765:
	fblg	%fcc0,	loop_766
	fmovdle	%icc,	%f29,	%f0
	umul	%o4,	%l5,	%o5
	edge16	%o3,	%i1,	%i6
loop_766:
	be,a	loop_767
	movcc	%icc,	%o6,	%l6
	smul	%l4,	0x1A56,	%o7
	udivcc	%g4,	0x013D,	%o2
loop_767:
	nop
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%g6
	srlx	%i2,	0x1F,	%i3
	brlz,a	%i0,	loop_768
	array32	%g2,	%g3,	%i5
	movvc	%xcc,	%g5,	%l0
	udiv	%i4,	0x1C88,	%l3
loop_768:
	tvs	%icc,	0x4
	movleu	%icc,	%g1,	%o0
	xnor	%i7,	%g6,	%l2
	movne	%xcc,	%o1,	%l1
	edge32	%o4,	%o5,	%l5
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x58] %asi,	%o3
	set	0x30, %o0
	ldstuba	[%l7 + %o0] 0x89,	%i6
	fmovsvs	%xcc,	%f0,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i1,	%o6,	%l6
	brgz	%l4,	loop_769
	movrgez	%g4,	0x262,	%o2
	ldsb	[%l7 + 0x7B],	%g7
	movpos	%icc,	%o7,	%i3
loop_769:
	sethi	0x1209,	%i2
	edge32n	%i0,	%g3,	%i5
	set	0x41, %l1
	ldstuba	[%l7 + %l1] 0x19,	%g2
	sll	%g5,	%i4,	%l0
	fcmpne16	%f30,	%f22,	%g1
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x6C] %asi,	%l3
	tvs	%xcc,	0x7
	mova	%icc,	%o0,	%i7
	edge8l	%g6,	%o1,	%l1
	ldstub	[%l7 + 0x52],	%o4
	te	%xcc,	0x0
	ld	[%l7 + 0x0C],	%f27
	movge	%icc,	%o5,	%l5
	st	%f28,	[%l7 + 0x2C]
	sdivcc	%l2,	0x1BD6,	%i6
	bleu	%xcc,	loop_770
	movle	%icc,	%o3,	%i1
	movne	%xcc,	%o6,	%l4
	fmovda	%icc,	%f2,	%f11
loop_770:
	movpos	%xcc,	%g4,	%o2
	brgez,a	%l6,	loop_771
	fsrc1	%f2,	%f18
	or	%g7,	0x01D1,	%i3
	movg	%icc,	%o7,	%i0
loop_771:
	brgez,a	%g3,	loop_772
	fmuld8ulx16	%f18,	%f10,	%f16
	xor	%i5,	0x0B57,	%i2
	subcc	%g5,	%g2,	%l0
loop_772:
	nop
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x81,	%f16
	mulx	%i4,	%g1,	%l3
	fmovrslez	%o0,	%f11,	%f26
	fbul,a	%fcc3,	loop_773
	andncc	%i7,	%o1,	%l1
	srl	%g6,	0x12,	%o4
	udivcc	%l5,	0x1315,	%o5
loop_773:
	ta	%icc,	0x3
	array8	%i6,	%o3,	%l2
	st	%f21,	[%l7 + 0x40]
	fbul	%fcc2,	loop_774
	mulx	%o6,	%i1,	%g4
	subc	%l4,	%o2,	%g7
	wr	%g0,	0x19,	%asi
	lduha	[%l7 + 0x54] %asi,	%l6
loop_774:
	stbar
	brnz,a	%i3,	loop_775
	tcc	%icc,	0x0
	tn	%xcc,	0x7
	fmovrsgez	%i0,	%f25,	%f22
loop_775:
	movrlez	%o7,	0x0FA,	%g3
	fzeros	%f1
	movrlez	%i2,	0x05C,	%g5
	sub	%g2,	%i5,	%i4
	srlx	%g1,	0x15,	%l3
	sir	0x10DF
	mova	%xcc,	%l0,	%o0
	tsubcc	%i7,	%o1,	%l1
	fpack16	%f28,	%f3
	ta	%icc,	0x4
	brz	%o4,	loop_776
	orcc	%l5,	0x1E87,	%g6
	stb	%i6,	[%l7 + 0x2E]
	orn	%o5,	%o3,	%o6
loop_776:
	fnor	%f22,	%f30,	%f4
	fmuld8sux16	%f12,	%f19,	%f8
	movre	%i1,	0x2CF,	%g4
	bleu,a,pt	%icc,	loop_777
	sethi	0x0E0F,	%l4
	smulcc	%o2,	%g7,	%l2
	edge16ln	%l6,	%i3,	%o7
loop_777:
	tvs	%xcc,	0x0
	movgu	%xcc,	%g3,	%i2
	movgu	%xcc,	%g5,	%g2
	tn	%icc,	0x4
	ba,a,pt	%xcc,	loop_778
	subc	%i0,	0x0BFC,	%i4
	tgu	%xcc,	0x7
	addccc	%i5,	%g1,	%l0
loop_778:
	andncc	%l3,	%o0,	%o1
	edge32n	%l1,	%o4,	%l5
	edge16	%g6,	%i7,	%i6
	fmovscs	%icc,	%f28,	%f7
	edge16l	%o5,	%o3,	%o6
	fnot2s	%f15,	%f24
	tg	%icc,	0x6
	movcs	%xcc,	%i1,	%g4
	move	%icc,	%l4,	%g7
	tcs	%icc,	0x5
	fble,a	%fcc2,	loop_779
	fbule,a	%fcc3,	loop_780
	addc	%o2,	0x137A,	%l6
	sdivcc	%l2,	0x0B0C,	%o7
loop_779:
	nop
	setx	0xEDA3597E16998364,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x04BF5A1C33EF1F19,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f22,	%f4
loop_780:
	std	%f14,	[%l7 + 0x50]
	edge16	%g3,	%i2,	%i3
	alignaddrl	%g2,	%i0,	%i4
	bneg,a	loop_781
	smulcc	%i5,	0x0053,	%g1
	fmovscc	%icc,	%f19,	%f11
	movl	%xcc,	%g5,	%l3
loop_781:
	brlez	%o0,	loop_782
	tleu	%xcc,	0x0
	xorcc	%o1,	%l0,	%l1
	fbule	%fcc0,	loop_783
loop_782:
	smul	%o4,	%l5,	%i7
	movrgz	%g6,	0x18B,	%o5
	movrlz	%i6,	%o3,	%o6
loop_783:
	sub	%g4,	0x1C86,	%l4
	tcc	%icc,	0x7
	addccc	%g7,	0x0156,	%o2
	ldsw	[%l7 + 0x7C],	%i1
	ldd	[%l7 + 0x18],	%i6
	udivcc	%o7,	0x1345,	%l2
	movrgz	%i2,	%i3,	%g2
	tvs	%xcc,	0x0
	orn	%i0,	0x1BDC,	%g3
	bn,a,pt	%xcc,	loop_784
	umul	%i4,	0x0FDB,	%g1
	fcmple16	%f12,	%f28,	%i5
	srlx	%l3,	0x01,	%g5
loop_784:
	nop
	fitos	%f9,	%f21
	addcc	%o0,	0x01BC,	%o1
	bgu,a,pt	%icc,	loop_785
	tvc	%xcc,	0x1
	tge	%xcc,	0x7
	movvs	%xcc,	%l1,	%o4
loop_785:
	popc	%l5,	%l0
	swap	[%l7 + 0x0C],	%g6
	fandnot2	%f6,	%f28,	%f6
	movleu	%icc,	%o5,	%i7
	srlx	%i6,	%o3,	%g4
	xnorcc	%o6,	%l4,	%g7
	srax	%o2,	0x0F,	%i1
	srax	%o7,	0x13,	%l2
	fblg	%fcc0,	loop_786
	st	%f11,	[%l7 + 0x68]
	taddcc	%l6,	0x074D,	%i2
	tsubcc	%i3,	0x1BD7,	%i0
loop_786:
	edge8ln	%g3,	%i4,	%g2
	edge32l	%g1,	%l3,	%i5
	fbne	%fcc3,	loop_787
	sdivx	%o0,	0x1375,	%o1
	xor	%l1,	%g5,	%l5
	brlz,a	%l0,	loop_788
loop_787:
	fcmpeq16	%f14,	%f30,	%g6
	tvc	%xcc,	0x3
	fpadd32	%f20,	%f14,	%f14
loop_788:
	ld	[%l7 + 0x18],	%f12
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	te	%icc,	0x4
	xnor	%o4,	0x109D,	%i7
	fabsd	%f0,	%f6
	bne,pn	%icc,	loop_789
	add	%i6,	0x1B71,	%o3
	bge,pn	%icc,	loop_790
	fnand	%f20,	%f4,	%f2
loop_789:
	taddcctv	%o5,	0x1433,	%o6
	tneg	%icc,	0x2
loop_790:
	tle	%xcc,	0x5
	te	%xcc,	0x4
	fmovsge	%xcc,	%f7,	%f21
	sdiv	%g4,	0x0D85,	%g7
	nop
	fitos	%f30,	%f26
	fmovrdgz	%o2,	%f28,	%f0
	nop
	setx loop_791, %l0, %l1
	jmpl %l1, %i1
	nop
	setx	0x406FAD32,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	tvc	%xcc,	0x1
	sra	%o7,	0x02,	%l4
loop_791:
	stb	%l2,	[%l7 + 0x72]
	subcc	%l6,	%i3,	%i2
	tge	%icc,	0x1
	fmovdneg	%icc,	%f31,	%f7
	fones	%f17
	te	%icc,	0x4
	tneg	%icc,	0x7
	srl	%i0,	0x06,	%i4
	orn	%g2,	0x028C,	%g1
	set	0x18, %l6
	stxa	%g3,	[%g0 + %l6] 0x4f
	fand	%f4,	%f20,	%f30
	subcc	%l3,	0x0EF3,	%o0
	edge16ln	%i5,	%o1,	%g5
	movrlz	%l1,	0x30A,	%l5
	ldstub	[%l7 + 0x57],	%l0
	sir	0x0C85
	set	0x3A, %g3
	stha	%g6,	[%l7 + %g3] 0x10
	fmovrdne	%o4,	%f6,	%f8
	udiv	%i7,	0x022E,	%i6
	movle	%xcc,	%o5,	%o3
	movvc	%xcc,	%g4,	%g7
	tle	%xcc,	0x1
	sub	%o6,	%o2,	%o7
	fble,a	%fcc3,	loop_792
	te	%xcc,	0x6
	faligndata	%f0,	%f30,	%f26
	mova	%icc,	%i1,	%l2
loop_792:
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f26
	movleu	%xcc,	%l4,	%l6
	fbue	%fcc3,	loop_793
	fbue,a	%fcc2,	loop_794
	udivcc	%i3,	0x003E,	%i0
	sra	%i4,	0x15,	%i2
loop_793:
	umul	%g2,	%g3,	%g1
loop_794:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	prefetch	[%l7 + 0x10],	 0x1
	edge32ln	%o0,	%l3,	%i5
	edge16	%o1,	%l1,	%l5
	srax	%l0,	%g6,	%o4
	tleu	%icc,	0x3
	movrgez	%i7,	0x2B4,	%i6
	subc	%g5,	%o5,	%o3
	smulcc	%g4,	%o6,	%o2
	ta	%xcc,	0x5
	tsubcc	%g7,	%o7,	%l2
	fbu	%fcc1,	loop_795
	fba	%fcc2,	loop_796
	tvc	%icc,	0x7
	sdivx	%l4,	0x1DC0,	%l6
loop_795:
	fbug,a	%fcc0,	loop_797
loop_796:
	fbe,a	%fcc1,	loop_798
	movrlez	%i1,	0x323,	%i0
	set	0x16, %o7
	lduha	[%l7 + %o7] 0x14,	%i4
loop_797:
	bcc,pt	%icc,	loop_799
loop_798:
	edge8	%i3,	%i2,	%g3
	tgu	%xcc,	0x6
	tvc	%xcc,	0x5
loop_799:
	tcs	%xcc,	0x0
	tpos	%xcc,	0x3
	bne,a	%xcc,	loop_800
	tneg	%icc,	0x6
	set	0x10, %o4
	ldda	[%l7 + %o4] 0xe2,	%g2
loop_800:
	movrne	%o0,	%l3,	%i5
	addcc	%o1,	0x0174,	%l1
	andncc	%l5,	%l0,	%g1
	nop
	set	0x0C, %g7
	prefetch	[%l7 + %g7],	 0x3
	array16	%g6,	%i7,	%o4
	sdiv	%i6,	0x0380,	%o5
	brgz	%o3,	loop_801
	umul	%g5,	%g4,	%o2
	popc	0x1249,	%o6
	tcc	%xcc,	0x6
loop_801:
	addcc	%o7,	0x1EED,	%g7
	fpmerge	%f5,	%f28,	%f20
	edge8ln	%l4,	%l2,	%l6
	edge16n	%i1,	%i4,	%i3
	fmovsg	%icc,	%f16,	%f15
	movleu	%xcc,	%i2,	%i0
	tge	%icc,	0x6
	sll	%g2,	%g3,	%o0
	fnand	%f18,	%f28,	%f16
	movneg	%icc,	%l3,	%i5
	umul	%l1,	%o1,	%l5
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	set	0x64, %o1
	stha	%l0,	[%l7 + %o1] 0x2b
	membar	#Sync
	fbl	%fcc2,	loop_802
	sllx	%g6,	%i7,	%o4
	xnor	%g1,	0x172B,	%o5
	movl	%xcc,	%o3,	%g5
loop_802:
	nop
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x14] %asi,	%g4
	set	0x42, %l5
	ldsha	[%l7 + %l5] 0x15,	%o2
	fmovrsne	%i6,	%f22,	%f27
	taddcc	%o7,	0x0E4B,	%g7
	fpsub16	%f12,	%f30,	%f10
	fands	%f4,	%f4,	%f10
	edge8ln	%l4,	%o6,	%l2
	movrlz	%l6,	%i1,	%i3
	brnz	%i2,	loop_803
	orncc	%i0,	0x155A,	%g2
	edge16n	%i4,	%o0,	%g3
	bge,pn	%icc,	loop_804
loop_803:
	addcc	%i5,	%l3,	%l1
	brgz,a	%l5,	loop_805
	alignaddr	%o1,	%g6,	%l0
loop_804:
	fcmple16	%f12,	%f0,	%i7
	ldsh	[%l7 + 0x46],	%o4
loop_805:
	movvc	%xcc,	%o5,	%o3
	te	%icc,	0x3
	fsrc1s	%f28,	%f15
	sir	0x02D6
	fmovsgu	%icc,	%f21,	%f20
	brnz	%g1,	loop_806
	alignaddr	%g5,	%o2,	%i6
	alignaddrl	%o7,	%g4,	%l4
	srlx	%o6,	%g7,	%l2
loop_806:
	nop
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x80,	%i6
	fxnors	%f2,	%f8,	%f5
	brlez	%i1,	loop_807
	fabsd	%f28,	%f14
	fzeros	%f26
	fmovde	%icc,	%f27,	%f26
loop_807:
	nop
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x5F] %asi,	%i3
	set	0x50, %i4
	lduha	[%l7 + %i4] 0x14,	%i2
	fbu	%fcc1,	loop_808
	tle	%xcc,	0x4
	set	0x20, %i0
	stxa	%g2,	[%l7 + %i0] 0xe2
	membar	#Sync
loop_808:
	nop
	set	0x10, %l2
	prefetch	[%l7 + %l2],	 0x3
	fcmple32	%f14,	%f2,	%i0
	bshuffle	%f28,	%f14,	%f14
	edge16l	%o0,	%g3,	%i4
	fmovdg	%icc,	%f15,	%f30
	movl	%xcc,	%i5,	%l3
	array32	%l1,	%l5,	%o1
	fmovrslz	%g6,	%f23,	%f8
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	ldxa	[%l6] %asi,	%l0
	casxa	[%l6] %asi,	%l0,	%o4
	taddcc	%i7,	%o5,	%o3
	fnors	%f10,	%f5,	%f20
	andncc	%g5,	%g1,	%i6
	xnor	%o7,	%o2,	%g4
	wr	%g0,	0x22,	%asi
	stha	%o6,	[%l7 + 0x5A] %asi
	membar	#Sync
	mova	%icc,	%g7,	%l2
	bshuffle	%f2,	%f16,	%f14
	nop
	setx loop_809, %l0, %l1
	jmpl %l1, %l4
	edge16	%l6,	%i3,	%i2
	taddcc	%i1,	0x05D8,	%i0
	set	0x64, %i5
	lduwa	[%l7 + %i5] 0x14,	%o0
loop_809:
	nop
	setx	loop_810,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	udiv	%g2,	0x0F3C,	%i4
	fsrc2s	%f28,	%f13
	xor	%i5,	0x16B4,	%g3
loop_810:
	tgu	%icc,	0x7
	ba,a	loop_811
	umulcc	%l3,	%l1,	%l5
	tn	%icc,	0x3
	movvs	%xcc,	%g6,	%l0
loop_811:
	orcc	%o1,	%i7,	%o5
	movrgz	%o4,	0x36D,	%o3
	mulscc	%g1,	0x04D7,	%g5
	fmovsvs	%icc,	%f19,	%f22
	xor	%i6,	%o7,	%g4
	sethi	0x127A,	%o6
	fbo,a	%fcc1,	loop_812
	tcc	%xcc,	0x4
	set	0x44, %i7
	sta	%f17,	[%l7 + %i7] 0x89
loop_812:
	ldd	[%l7 + 0x68],	%f22
	taddcc	%o2,	%l2,	%l4
	nop
	fitos	%f13,	%f30
	fstoi	%f30,	%f5
	be	loop_813
	ba,a,pt	%xcc,	loop_814
	xnorcc	%l6,	0x0B9A,	%i3
	movl	%xcc,	%i2,	%i1
loop_813:
	tneg	%xcc,	0x3
loop_814:
	movle	%icc,	%i0,	%o0
	tn	%xcc,	0x2
	srax	%g2,	0x06,	%i4
	fpadd16s	%f13,	%f27,	%f14
	fmovsleu	%xcc,	%f12,	%f22
	fmovrdlez	%i5,	%f2,	%f8
	edge8ln	%g3,	%l3,	%l1
	edge16l	%l5,	%g7,	%g6
	move	%icc,	%l0,	%i7
	fcmpgt32	%f2,	%f12,	%o5
	fsrc2	%f12,	%f8
	tvs	%icc,	0x5
	edge32l	%o1,	%o4,	%g1
	fmovrslez	%o3,	%f7,	%f31
	movpos	%icc,	%g5,	%o7
	brgz,a	%i6,	loop_815
	tleu	%icc,	0x2
	ta	%xcc,	0x7
	bcs,pn	%icc,	loop_816
loop_815:
	fmovde	%icc,	%f22,	%f15
	fabsd	%f0,	%f26
	tgu	%icc,	0x2
loop_816:
	tpos	%icc,	0x6
	movge	%xcc,	%g4,	%o2
	xnorcc	%o6,	0x02A1,	%l2
	nop
	setx	0x8755D8D8EBD3F503,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xD5FC1E1F12EAF4AF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f2,	%f28
	xnor	%l4,	0x0FE0,	%i3
	alignaddrl	%l6,	%i1,	%i2
	sth	%o0,	[%l7 + 0x3A]
	xorcc	%i0,	%i4,	%g2
	movne	%icc,	%g3,	%i5
	nop
	setx	0x6FFB997B6657EBDA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0x294E504FD5B72DFD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f6,	%f28
	srlx	%l3,	0x03,	%l5
	tcc	%icc,	0x2
	fbul,a	%fcc3,	loop_817
	fornot2	%f4,	%f22,	%f28
	xorcc	%g7,	0x0502,	%g6
	fnegs	%f24,	%f6
loop_817:
	alignaddrl	%l1,	%i7,	%o5
	array8	%o1,	%l0,	%o4
	te	%icc,	0x0
	edge8ln	%o3,	%g1,	%o7
	nop
	set	0x30, %o6
	ldsh	[%l7 + %o6],	%g5
	set	0x5E, %o2
	stha	%g4,	[%l7 + %o2] 0x2f
	membar	#Sync
	movrne	%i6,	0x06E,	%o6
	movrgez	%l2,	0x35A,	%o2
	fornot1	%f2,	%f16,	%f24
	tg	%xcc,	0x2
	movcs	%icc,	%i3,	%l6
	tne	%xcc,	0x1
	umul	%l4,	%i1,	%i2
	tcc	%xcc,	0x7
	tn	%xcc,	0x5
	edge8l	%i0,	%o0,	%i4
	movvs	%icc,	%g3,	%i5
	fbug,a	%fcc2,	loop_818
	tcc	%xcc,	0x7
	nop
	setx	0x7CA1D51F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x3755012D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fadds	%f12,	%f1,	%f21
	tcc	%icc,	0x1
loop_818:
	nop
	set	0x68, %o3
	stwa	%g2,	[%l7 + %o3] 0xeb
	membar	#Sync
	fmovrsgez	%l3,	%f19,	%f1
	movcs	%icc,	%l5,	%g6
	sub	%l1,	%g7,	%i7
	edge32	%o1,	%l0,	%o4
	tleu	%xcc,	0x7
	movvc	%xcc,	%o3,	%g1
	call	loop_819
	nop
	fitod	%f2,	%f28
	fdtos	%f28,	%f9
	movleu	%icc,	%o7,	%o5
	movne	%icc,	%g4,	%g5
loop_819:
	fsrc1	%f18,	%f16
	movre	%o6,	%l2,	%i6
	array32	%i3,	%o2,	%l4
	fmuld8sux16	%f12,	%f28,	%f0
	edge16ln	%l6,	%i2,	%i0
	andncc	%o0,	%i4,	%i1
	bvc,a,pn	%icc,	loop_820
	movl	%icc,	%g3,	%i5
	set	0x32, %g6
	ldstuba	[%l7 + %g6] 0x10,	%l3
loop_820:
	movn	%icc,	%l5,	%g6
	fones	%f9
	xor	%l1,	%g7,	%i7
	movle	%icc,	%g2,	%l0
	ld	[%l7 + 0x30],	%f16
	tneg	%icc,	0x1
	fcmple16	%f16,	%f26,	%o4
	fmul8x16al	%f7,	%f18,	%f0
	fnegd	%f2,	%f18
	popc	%o3,	%o1
	fcmpne16	%f8,	%f6,	%o7
	nop
	setx	0xABA781D6A8B8E228,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xBC9A18C8C454D4D6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f20,	%f0
	alignaddrl	%o5,	%g4,	%g1
	move	%icc,	%g5,	%l2
	popc	%i6,	%o6
	bvc,a,pt	%xcc,	loop_821
	brnz	%i3,	loop_822
	movg	%xcc,	%o2,	%l4
	movleu	%icc,	%l6,	%i0
loop_821:
	umul	%i2,	0x1CBB,	%i4
loop_822:
	tsubcc	%i1,	%o0,	%i5
	sllx	%g3,	%l3,	%g6
	fnegs	%f8,	%f8
	movre	%l5,	0x03E,	%g7
	wr	%g0,	0x18,	%asi
	stba	%l1,	[%l7 + 0x74] %asi
	stbar
	fcmpgt32	%f10,	%f22,	%i7
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x53] %asi,	%g2
	brlez,a	%l0,	loop_823
	movrgez	%o3,	0x0EA,	%o4
	xor	%o7,	0x18D1,	%o1
	sub	%g4,	%o5,	%g1
loop_823:
	tl	%xcc,	0x0
	udivx	%l2,	0x157E,	%g5
	popc	%o6,	%i3
	tle	%xcc,	0x6
	swap	[%l7 + 0x74],	%o2
	brlz	%i6,	loop_824
	nop
	setx	0xE8018736AB40A13F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x9967792DF46BCE56,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f18,	%f22
	add	%l4,	0x0CC9,	%i0
	fcmpgt32	%f26,	%f26,	%i2
loop_824:
	mova	%icc,	%l6,	%i1
	movn	%icc,	%o0,	%i4
	array16	%i5,	%l3,	%g3
	fcmpgt16	%f20,	%f12,	%g6
	movcs	%icc,	%g7,	%l5
	set	0x7A, %i3
	ldsba	[%l7 + %i3] 0x15,	%i7
	movvc	%xcc,	%g2,	%l1
	movrgz	%o3,	%o4,	%o7
	wr	%g0,	0xeb,	%asi
	stba	%o1,	[%l7 + 0x32] %asi
	membar	#Sync
	fandnot1s	%f17,	%f18,	%f23
	or	%g4,	0x1C27,	%o5
	fcmpeq16	%f22,	%f6,	%l0
	movg	%xcc,	%l2,	%g5
	ta	%icc,	0x4
	be,a	%icc,	loop_825
	nop
	setx	loop_826,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	lduw	[%l7 + 0x10],	%g1
	edge16n	%o6,	%i3,	%o2
loop_825:
	fpsub16	%f12,	%f2,	%f8
loop_826:
	nop
	setx	0x91EDAC84,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0xFEFF076E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f18,	%f10
	movrne	%l4,	0x2D6,	%i0
	addccc	%i2,	0x04AA,	%l6
	tcc	%xcc,	0x0
	fmovs	%f0,	%f0
	fbo	%fcc2,	loop_827
	fmovdvc	%icc,	%f23,	%f7
	ta	%icc,	0x6
	udivx	%i1,	0x031B,	%o0
loop_827:
	array8	%i6,	%i5,	%l3
	nop
	setx	0xC6046EA2607CCF58,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	tsubcctv	%g3,	%i4,	%g7
	xor	%g6,	%i7,	%l5
	movgu	%xcc,	%l1,	%g2
	fba,a	%fcc0,	loop_828
	bneg,a	loop_829
	edge32	%o3,	%o4,	%o1
	fmovsa	%icc,	%f20,	%f1
loop_828:
	movcc	%xcc,	%o7,	%g4
loop_829:
	movvc	%icc,	%l0,	%o5
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x7C] %asi,	%l2
	movrlz	%g1,	%g5,	%o6
	udivx	%i3,	0x0E90,	%l4
	fmul8sux16	%f10,	%f20,	%f12
	flush	%l7 + 0x34
	addcc	%i0,	%o2,	%l6
	fmovdge	%xcc,	%f23,	%f8
	brgez,a	%i2,	loop_830
	fmovrdgz	%i1,	%f24,	%f6
	fxors	%f12,	%f30,	%f17
	umulcc	%o0,	0x0D8C,	%i5
loop_830:
	fnor	%f20,	%f6,	%f16
	tg	%xcc,	0x3
	set	0x10, %i1
	ldswa	[%l7 + %i1] 0x81,	%l3
	fpadd16	%f12,	%f0,	%f12
	movn	%xcc,	%i6,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0756
	tl	%xcc,	0x7
	addc	%g3,	0x0222,	%g7
	movrgz	%g6,	0x3E6,	%l5
	addc	%i7,	0x1753,	%g2
	movgu	%icc,	%l1,	%o4
	sll	%o3,	0x05,	%o1
	xnorcc	%o7,	%l0,	%o5
	membar	0x53
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x60] %asi,	%l2
	fmovdpos	%xcc,	%f21,	%f22
	fble,a	%fcc3,	loop_831
	membar	0x22
	stx	%g4,	[%l7 + 0x58]
	ld	[%l7 + 0x50],	%f7
loop_831:
	movrne	%g5,	0x202,	%g1
	fbg,a	%fcc3,	loop_832
	umul	%i3,	%o6,	%l4
	movrlz	%o2,	%l6,	%i0
	fbuge,a	%fcc1,	loop_833
loop_832:
	tle	%xcc,	0x1
	or	%i1,	0x050E,	%o0
	fcmpgt32	%f2,	%f8,	%i2
loop_833:
	xnorcc	%i5,	0x0246,	%i6
	xorcc	%l3,	0x1AFD,	%g3
	std	%f16,	[%l7 + 0x30]
	lduw	[%l7 + 0x14],	%g7
	xorcc	%i4,	0x176C,	%g6
	fmovscc	%icc,	%f25,	%f25
	tcs	%xcc,	0x6
	edge8	%l5,	%i7,	%g2
	tpos	%xcc,	0x4
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	smulcc	%l1,	0x0FEC,	%o3
	edge16ln	%o1,	%o7,	%o4
	umul	%l0,	0x13AF,	%o5
	srax	%l2,	0x03,	%g4
	ble,a,pt	%xcc,	loop_834
	nop
	setx	0x0CE3856F0052D50F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	udivcc	%g5,	0x0834,	%g1
	fmovdcc	%icc,	%f16,	%f23
loop_834:
	brlz	%o6,	loop_835
	taddcctv	%i3,	0x1D35,	%l4
	andcc	%l6,	%o2,	%i1
	alignaddr	%i0,	%i2,	%i5
loop_835:
	sub	%o0,	%i6,	%g3
	prefetch	[%l7 + 0x18],	 0x3
	nop
	fitod	%f12,	%f22
	fdtoi	%f22,	%f4
	srl	%g7,	0x00,	%i4
	edge8l	%g6,	%l3,	%i7
	subcc	%l5,	%g2,	%l1
	nop
	setx	loop_836,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movpos	%icc,	%o3,	%o7
	ble,pn	%xcc,	loop_837
	edge32l	%o4,	%o1,	%l0
loop_836:
	fcmpeq16	%f8,	%f20,	%o5
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l2
loop_837:
	fmul8x16al	%f10,	%f1,	%f18
	edge32	%g5,	%g1,	%o6
	ble	%xcc,	loop_838
	fpadd32	%f0,	%f28,	%f0
	fcmpne16	%f28,	%f18,	%g4
	nop
	setx loop_839, %l0, %l1
	jmpl %l1, %i3
loop_838:
	tg	%xcc,	0x6
	movl	%xcc,	%l4,	%o2
	sll	%i1,	%l6,	%i2
loop_839:
	tvs	%icc,	0x5
	movre	%i0,	%i5,	%o0
	set	0x14, %g5
	sta	%f28,	[%l7 + %g5] 0x19
	fnand	%f18,	%f30,	%f8
	movge	%icc,	%g3,	%g7
	brgez,a	%i6,	loop_840
	tgu	%xcc,	0x7
	set	0x73, %l4
	stba	%g6,	[%l7 + %l4] 0xeb
	membar	#Sync
loop_840:
	movrlez	%l3,	0x0A5,	%i4
	movne	%xcc,	%l5,	%g2
	nop
	setx	loop_841,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdpos	%xcc,	%f7,	%f19
	umulcc	%l1,	0x1977,	%i7
	tcc	%xcc,	0x0
loop_841:
	edge32ln	%o3,	%o4,	%o7
	fmovsgu	%icc,	%f21,	%f1
	movrne	%l0,	0x1CC,	%o5
	fnegd	%f24,	%f8
	add	%l7,	0x50,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] 0x11,	%o1,	%l2
	subccc	%g5,	0x1602,	%g1
	st	%f8,	[%l7 + 0x10]
	tn	%icc,	0x2
	tn	%xcc,	0x7
	bcc,a	%icc,	loop_842
	sir	0x0B20
	call	loop_843
	movcc	%xcc,	%g4,	%o6
loop_842:
	fpackfix	%f20,	%f15
	nop
	set	0x18, %l0
	ldx	[%l7 + %l0],	%l4
loop_843:
	movne	%icc,	%o2,	%i1
	movcc	%icc,	%i3,	%i2
	fmovdvc	%xcc,	%f20,	%f22
	array8	%i0,	%i5,	%l6
	fmovrde	%g3,	%f28,	%f10
	smul	%g7,	%o0,	%i6
	bl,pn	%icc,	loop_844
	movge	%icc,	%g6,	%i4
	udivcc	%l5,	0x189B,	%l3
	fba	%fcc2,	loop_845
loop_844:
	edge32	%g2,	%i7,	%l1
	orncc	%o4,	%o3,	%l0
	brlz	%o5,	loop_846
loop_845:
	bcs,pt	%xcc,	loop_847
	fmovsne	%xcc,	%f16,	%f6
	bleu,pn	%xcc,	loop_848
loop_846:
	andncc	%o1,	%o7,	%l2
loop_847:
	fnand	%f4,	%f26,	%f24
	fbule	%fcc2,	loop_849
loop_848:
	andncc	%g5,	%g1,	%g4
	call	loop_850
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_849:
	mulx	%o6,	0x055D,	%l4
	udiv	%i1,	0x10B1,	%i3
loop_850:
	movneg	%xcc,	%o2,	%i0
	movrne	%i2,	%l6,	%i5
	udivx	%g7,	0x0A41,	%g3
	ldstub	[%l7 + 0x2B],	%i6
	movvc	%xcc,	%g6,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i4,	%l5,	%g2
	movg	%xcc,	%l3,	%l1
	add	%i7,	%o3,	%o4
	ta	%xcc,	0x6
	edge32ln	%o5,	%l0,	%o7
	sethi	0x1167,	%o1
	tcc	%xcc,	0x0
	tleu	%icc,	0x3
	fmovrse	%g5,	%f12,	%f14
	movne	%xcc,	%l2,	%g4
	edge8n	%o6,	%g1,	%i1
	fornot2	%f4,	%f4,	%f18
	movrgz	%i3,	%o2,	%l4
	sra	%i0,	%i2,	%l6
	fxor	%f22,	%f4,	%f22
	fnors	%f21,	%f18,	%f18
	brnz	%g7,	loop_851
	movg	%icc,	%i5,	%i6
	sir	0x071E
	movcc	%xcc,	%g6,	%o0
loop_851:
	tgu	%xcc,	0x6
	fnor	%f8,	%f20,	%f8
	nop
	setx loop_852, %l0, %l1
	jmpl %l1, %g3
	edge32l	%l5,	%i4,	%l3
	pdist	%f2,	%f8,	%f22
	brlz,a	%g2,	loop_853
loop_852:
	tge	%icc,	0x4
	movvs	%icc,	%i7,	%o3
	fbue	%fcc3,	loop_854
loop_853:
	movneg	%icc,	%o4,	%l1
	movre	%o5,	%l0,	%o1
	ldsh	[%l7 + 0x66],	%o7
loop_854:
	prefetch	[%l7 + 0x30],	 0x0
	movn	%xcc,	%l2,	%g5
	nop
	setx	0x6655D861C043ED06,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	set	0x28, %i2
	stxa	%g4,	[%l7 + %i2] 0x80
	movcc	%icc,	%o6,	%g1
	fpmerge	%f11,	%f20,	%f28
	fcmpgt32	%f26,	%f14,	%i3
	flush	%l7 + 0x40
	fnands	%f4,	%f0,	%f29
	ldx	[%l7 + 0x48],	%i1
	tgu	%xcc,	0x3
	umulcc	%l4,	%i0,	%o2
	xnor	%i2,	%g7,	%i5
	orn	%l6,	0x0378,	%g6
	fmovrsgz	%i6,	%f14,	%f1
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x3A] %asi,	%g3
	std	%f22,	[%l7 + 0x30]
	nop
	setx	0x604E2CF1,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	fble,a	%fcc3,	loop_855
	taddcctv	%l5,	%o0,	%l3
	fpadd32	%f22,	%f2,	%f10
	srlx	%g2,	0x0F,	%i4
loop_855:
	movcc	%xcc,	%i7,	%o3
	fpack32	%f20,	%f22,	%f22
	umulcc	%o4,	0x1CB2,	%o5
	tcc	%xcc,	0x2
	fandnot2s	%f31,	%f2,	%f29
	movneg	%xcc,	%l0,	%l1
	set	0x16, %g2
	ldsha	[%l7 + %g2] 0x80,	%o1
	wr	%g0,	0x26,	%asi
	ldda	[%l7 + 0x30] %asi,	%o6
	fmovrslez	%l2,	%f23,	%f25
	srlx	%g4,	%g5,	%o6
	nop
	setx	0xDD047A1BF8CDF069,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x94517F50616AEF02,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	faddd	%f18,	%f26,	%f20
	bneg,a,pn	%icc,	loop_856
	mova	%icc,	%i3,	%g1
	nop
	setx	0xC3D297411C419F5B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f14
	stb	%i1,	[%l7 + 0x3F]
loop_856:
	fbn	%fcc0,	loop_857
	fnot2s	%f8,	%f26
	edge32n	%i0,	%l4,	%i2
	swap	[%l7 + 0x0C],	%o2
loop_857:
	tcc	%xcc,	0x0
	fmovse	%icc,	%f18,	%f22
	movrgez	%i5,	0x175,	%l6
	ldsb	[%l7 + 0x7D],	%g6
	edge16l	%i6,	%g3,	%g7
	movpos	%icc,	%l5,	%l3
	fandnot2	%f30,	%f18,	%f28
	orncc	%o0,	0x1DD7,	%g2
	faligndata	%f16,	%f12,	%f26
	taddcctv	%i4,	0x056D,	%i7
	taddcc	%o4,	0x05C6,	%o3
	mulscc	%o5,	%l0,	%l1
	std	%f8,	[%l7 + 0x18]
	sdivcc	%o7,	0x1ECE,	%o1
	movleu	%icc,	%g4,	%g5
	bshuffle	%f6,	%f8,	%f10
	movpos	%xcc,	%o6,	%l2
	addc	%g1,	%i1,	%i0
	sub	%i3,	0x107E,	%i2
	brnz	%o2,	loop_858
	te	%xcc,	0x7
	ldsh	[%l7 + 0x3A],	%i5
	movg	%xcc,	%l4,	%l6
loop_858:
	subcc	%i6,	%g6,	%g7
	fble,a	%fcc1,	loop_859
	or	%l5,	0x11B9,	%g3
	sll	%o0,	0x1D,	%g2
	nop
	setx	loop_860,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_859:
	stbar
	fba,a	%fcc1,	loop_861
	fornot1s	%f14,	%f13,	%f16
loop_860:
	nop
	wr	%g0,	0x2f,	%asi
	stba	%i4,	[%l7 + 0x11] %asi
	membar	#Sync
loop_861:
	edge8ln	%l3,	%o4,	%i7
	ldd	[%l7 + 0x08],	%o2
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x78] %asi,	%l0
	fbule,a	%fcc0,	loop_862
	ba	loop_863
	tn	%xcc,	0x2
	brgz,a	%l1,	loop_864
loop_862:
	lduw	[%l7 + 0x7C],	%o7
loop_863:
	brgz,a	%o5,	loop_865
	movg	%icc,	%o1,	%g5
loop_864:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%g4,	%f26,	%f24
loop_865:
	edge8ln	%o6,	%g1,	%l2
	fmul8x16al	%f23,	%f2,	%f4
	xorcc	%i0,	0x1674,	%i3
	fmovsa	%xcc,	%f1,	%f12
	set	0x30, %g4
	prefetcha	[%l7 + %g4] 0x80,	 0x2
	sdivcc	%i1,	0x16B0,	%i5
	tgu	%icc,	0x6
	ble,a,pn	%xcc,	loop_866
	sllx	%o2,	0x04,	%l6
	movre	%i6,	%l4,	%g7
	ta	%icc,	0x3
loop_866:
	array32	%g6,	%l5,	%o0
	edge16	%g3,	%i4,	%g2
	fbul	%fcc0,	loop_867
	movpos	%xcc,	%o4,	%i7
	edge8	%o3,	%l0,	%l3
	fmovs	%f31,	%f0
loop_867:
	tge	%xcc,	0x6
	sra	%o7,	%l1,	%o1
	nop
	fitod	%f6,	%f18
	fdtox	%f18,	%f22
	fxtod	%f22,	%f4
	ba,pt	%xcc,	loop_868
	brlz,a	%g5,	loop_869
	fbuge	%fcc3,	loop_870
	udiv	%o5,	0x15F5,	%o6
loop_868:
	movne	%xcc,	%g1,	%l2
loop_869:
	fnors	%f20,	%f4,	%f4
loop_870:
	stbar
	movl	%icc,	%g4,	%i3
	brlz,a	%i2,	loop_871
	sub	%i0,	0x1D50,	%i1
	andncc	%o2,	%i5,	%l6
	edge8n	%i6,	%g7,	%g6
loop_871:
	fcmpgt16	%f6,	%f24,	%l5
	udiv	%o0,	0x1A72,	%l4
	edge8ln	%g3,	%i4,	%o4
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0xf1
	membar	#Sync
	xor	%g2,	%i7,	%l0
	set	0x34, %i6
	ldswa	[%l7 + %i6] 0x88,	%o3
	movvs	%xcc,	%l3,	%o7
	array16	%l1,	%o1,	%o5
	tvc	%xcc,	0x4
	fpsub16s	%f12,	%f21,	%f9
	wr	%g0,	0x0c,	%asi
	stba	%o6,	[%l7 + 0x52] %asi
	nop
	setx	0x8071FCE2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%fsr
	popc	%g1,	%l2
	movrgez	%g4,	%g5,	%i2
	edge8ln	%i0,	%i3,	%o2
	fsrc2s	%f10,	%f13
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x70] %asi,	%i1
	movl	%icc,	%i5,	%i6
	fmovsle	%xcc,	%f23,	%f31
	edge16l	%l6,	%g7,	%g6
	wr	%g0,	0x0c,	%asi
	sta	%f28,	[%l7 + 0x1C] %asi
	array8	%o0,	%l4,	%l5
	call	loop_872
	tsubcctv	%i4,	0x1C70,	%g3
	srlx	%g2,	%o4,	%l0
	tl	%xcc,	0x5
loop_872:
	edge32l	%o3,	%l3,	%o7
	brlez,a	%i7,	loop_873
	add	%l1,	0x18A8,	%o1
	set	0x68, %o0
	lduwa	[%l7 + %o0] 0x19,	%o6
loop_873:
	fmovrdne	%g1,	%f6,	%f10
	fbe	%fcc2,	loop_874
	nop
	fitos	%f13,	%f18
	fstoi	%f18,	%f14
	fnor	%f26,	%f20,	%f6
	fmovsn	%icc,	%f30,	%f23
loop_874:
	taddcctv	%l2,	0x18D8,	%g4
	bge,pt	%icc,	loop_875
	fbuge	%fcc2,	loop_876
	swap	[%l7 + 0x2C],	%g5
	umulcc	%i2,	%o5,	%i0
loop_875:
	edge16ln	%o2,	%i3,	%i5
loop_876:
	subcc	%i6,	0x0AFB,	%i1
	andn	%g7,	%l6,	%g6
	fxor	%f28,	%f28,	%f6
	movleu	%xcc,	%l4,	%l5
	bne	loop_877
	fmovda	%icc,	%f17,	%f9
	movrgz	%i4,	%o0,	%g3
	edge8n	%o4,	%g2,	%o3
loop_877:
	tge	%xcc,	0x1
	tge	%icc,	0x4
	movre	%l3,	0x307,	%o7
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x7E] %asi,	%i7
	set	0x20, %o5
	prefetcha	[%l7 + %o5] 0x19,	 0x2
	tcc	%xcc,	0x7
	smulcc	%o1,	%o6,	%g1
	fpmerge	%f8,	%f17,	%f26
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l2,	%g4,	%g5
	edge16l	%l1,	%i2,	%i0
	tvc	%xcc,	0x1
	movrgz	%o5,	%i3,	%i5
	movg	%icc,	%i6,	%i1
	bpos,pt	%icc,	loop_878
	nop
	fitod	%f28,	%f22
	movvc	%xcc,	%g7,	%o2
	ldsw	[%l7 + 0x5C],	%g6
loop_878:
	srlx	%l6,	0x02,	%l4
	fmovsa	%xcc,	%f17,	%f27
	fbu	%fcc0,	loop_879
	nop
	setx	0x46D9C909,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x44C9DD5A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fsubs	%f29,	%f29,	%f18
	fxnor	%f10,	%f2,	%f14
	edge32	%i4,	%l5,	%g3
loop_879:
	fnand	%f14,	%f16,	%f26
	fnegs	%f27,	%f5
	movg	%xcc,	%o0,	%o4
	array32	%g2,	%l3,	%o7
	tge	%xcc,	0x6
	ldd	[%l7 + 0x68],	%i6
	fmovrsgez	%l0,	%f2,	%f25
	addccc	%o1,	0x1A19,	%o3
	fmovdge	%icc,	%f27,	%f12
	membar	0x19
	fmuld8sux16	%f1,	%f5,	%f6
	fble	%fcc0,	loop_880
	tl	%xcc,	0x1
	xor	%g1,	0x0ACC,	%l2
	tsubcctv	%o6,	0x0A5E,	%g5
loop_880:
	movrlz	%l1,	0x389,	%g4
	fnor	%f18,	%f24,	%f14
	edge32l	%i2,	%o5,	%i0
	bvs,a,pt	%icc,	loop_881
	andn	%i5,	%i6,	%i1
	fcmple32	%f22,	%f6,	%g7
	fbule	%fcc1,	loop_882
loop_881:
	sdivcc	%i3,	0x079A,	%o2
	fmovscs	%xcc,	%f28,	%f11
	udiv	%l6,	0x1161,	%l4
loop_882:
	membar	0x15
	movleu	%xcc,	%i4,	%g6
	movrne	%l5,	%o0,	%g3
	bl	%xcc,	loop_883
	fpadd16s	%f22,	%f24,	%f19
	fmovsneg	%icc,	%f12,	%f4
	xorcc	%o4,	%l3,	%g2
loop_883:
	movvs	%icc,	%o7,	%i7
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x0c,	%f0
	fbge	%fcc2,	loop_884
	fbo,a	%fcc1,	loop_885
	edge16n	%o1,	%o3,	%g1
	tle	%xcc,	0x1
loop_884:
	array8	%l0,	%o6,	%g5
loop_885:
	bvc	loop_886
	addcc	%l2,	%g4,	%i2
	mulx	%o5,	0x0E17,	%i0
	movrgez	%l1,	%i5,	%i1
loop_886:
	fbug	%fcc0,	loop_887
	fmovrde	%i6,	%f20,	%f28
	fblg,a	%fcc1,	loop_888
	tcc	%xcc,	0x3
loop_887:
	subcc	%i3,	0x1E16,	%g7
	fbue	%fcc0,	loop_889
loop_888:
	alignaddrl	%l6,	%o2,	%l4
	nop
	setx	loop_890,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsgu	%icc,	%f23,	%f0
loop_889:
	bne	loop_891
	fbl	%fcc0,	loop_892
loop_890:
	mulscc	%i4,	0x19C6,	%l5
	movg	%icc,	%g6,	%g3
loop_891:
	umulcc	%o0,	%o4,	%l3
loop_892:
	array16	%g2,	%i7,	%o7
	sll	%o3,	0x07,	%g1
	nop
	fitos	%f3,	%f0
	fstod	%f0,	%f18
	srlx	%l0,	%o1,	%g5
	fmovsa	%icc,	%f18,	%f4
	and	%l2,	0x1566,	%o6
	array32	%i2,	%g4,	%i0
	sdivcc	%l1,	0x030C,	%i5
	udivx	%i1,	0x184F,	%o5
	fors	%f11,	%f14,	%f12
	orn	%i3,	0x1802,	%i6
	movg	%icc,	%l6,	%o2
	nop
	setx	0x0F8A330D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x193919A4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fsubs	%f15,	%f21,	%f17
	fcmpne32	%f0,	%f22,	%g7
	stb	%i4,	[%l7 + 0x70]
	movvs	%xcc,	%l4,	%l5
	move	%xcc,	%g3,	%g6
	fnand	%f16,	%f18,	%f20
	fblg	%fcc2,	loop_893
	umul	%o4,	0x15E4,	%l3
	edge8l	%o0,	%g2,	%i7
	movne	%xcc,	%o3,	%o7
loop_893:
	ldstub	[%l7 + 0x55],	%g1
	sdivcc	%l0,	0x11E6,	%o1
	movpos	%xcc,	%l2,	%g5
	tsubcc	%i2,	%g4,	%i0
	movle	%icc,	%l1,	%o6
	movcc	%icc,	%i5,	%i1
	nop
	fitos	%f10,	%f11
	movne	%xcc,	%i3,	%i6
	bcs,a	%xcc,	loop_894
	ble,a	%icc,	loop_895
	fpadd32s	%f26,	%f9,	%f28
	tge	%icc,	0x2
loop_894:
	movleu	%icc,	%o5,	%o2
loop_895:
	nop
	wr	%g0,	0x80,	%asi
	stxa	%g7,	[%l7 + 0x50] %asi
	array8	%l6,	%i4,	%l5
	sra	%l4,	%g6,	%o4
	srax	%g3,	0x0A,	%o0
	udivx	%l3,	0x054D,	%i7
	movcs	%icc,	%o3,	%g2
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g1
	casxa	[%l6] 0x89,	%g1,	%o7
	sub	%l0,	%l2,	%o1
	fzeros	%f16
	nop
	setx loop_896, %l0, %l1
	jmpl %l1, %g5
	brlz	%g4,	loop_897
	movgu	%icc,	%i2,	%l1
	xnor	%o6,	0x04E2,	%i5
loop_896:
	movl	%icc,	%i0,	%i1
loop_897:
	movrgez	%i6,	0x199,	%i3
	udivcc	%o5,	0x1833,	%g7
	set	0x40, %g3
	ldda	[%l7 + %g3] 0x88,	%f16
	nop
	fitod	%f0,	%f8
	fdtox	%f8,	%f18
	set	0x14, %o7
	ldsha	[%l7 + %o7] 0x19,	%o2
	tsubcctv	%i4,	0x0FCA,	%l6
	nop
	fitos	%f2,	%f5
	nop
	setx	0x96F1FC05,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f22
	xnorcc	%l4,	0x0E72,	%l5
	andcc	%o4,	0x0AA1,	%g6
	tsubcc	%o0,	0x0A9C,	%g3
	fcmpne16	%f18,	%f20,	%i7
	fmovsge	%icc,	%f27,	%f16
	nop
	setx	0xBD8DB1EF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f11
	movrlz	%o3,	0x0E6,	%g2
	fbe	%fcc0,	loop_898
	fsrc1	%f12,	%f4
	fba,a	%fcc3,	loop_899
	alignaddr	%g1,	%l3,	%o7
loop_898:
	mulx	%l0,	0x16B4,	%l2
	movgu	%icc,	%o1,	%g4
loop_899:
	movrlz	%i2,	%g5,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f30,	[%l7 + 0x68]
	udivx	%i5,	0x1D83,	%i0
	fbo,a	%fcc0,	loop_900
	movrlz	%i1,	0x0AF,	%l1
	tl	%icc,	0x6
	fpmerge	%f10,	%f4,	%f22
loop_900:
	smulcc	%i6,	%o5,	%i3
	stbar
	orncc	%g7,	0x0895,	%o2
	fmovsleu	%xcc,	%f14,	%f25
	movg	%icc,	%i4,	%l4
	movcs	%xcc,	%l6,	%l5
	fmul8ulx16	%f0,	%f22,	%f12
	taddcctv	%g6,	0x0C11,	%o4
	edge16ln	%g3,	%o0,	%o3
	lduh	[%l7 + 0x4A],	%i7
	movvc	%xcc,	%g2,	%l3
	tvc	%xcc,	0x1
	mulscc	%o7,	%l0,	%l2
	fmovs	%f27,	%f0
	alignaddr	%o1,	%g4,	%g1
	ldsh	[%l7 + 0x50],	%i2
	ldsb	[%l7 + 0x6F],	%g5
	movre	%o6,	0x208,	%i0
	fmovrdne	%i5,	%f16,	%f24
	orncc	%l1,	0x103C,	%i1
	udivcc	%i6,	0x11E9,	%o5
	movvs	%icc,	%i3,	%g7
	std	%f16,	[%l7 + 0x68]
	edge32l	%i4,	%o2,	%l4
	ldsb	[%l7 + 0x29],	%l5
	stw	%g6,	[%l7 + 0x24]
	sdivcc	%l6,	0x1047,	%g3
	movre	%o0,	0x250,	%o4
	udivcc	%i7,	0x13BA,	%g2
	fnot2s	%f2,	%f4
	fmul8x16au	%f16,	%f8,	%f20
	fmovsle	%xcc,	%f1,	%f19
	alignaddrl	%o3,	%l3,	%l0
	tge	%icc,	0x1
	addcc	%o7,	%o1,	%l2
	edge16ln	%g4,	%g1,	%i2
	stbar
	array8	%o6,	%g5,	%i0
	movn	%xcc,	%i5,	%l1
	wr	%g0,	0x0c,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x1
	tsubcc	%i1,	%i3,	%g7
	add	%l7,	0x48,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%o5,	%o2
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l4
	fands	%f27,	%f13,	%f28
	fmul8sux16	%f2,	%f22,	%f22
	move	%xcc,	%i4,	%g6
	fbue,a	%fcc2,	loop_901
	movrlez	%l5,	0x128,	%g3
	array8	%l6,	%o0,	%i7
	fbo	%fcc3,	loop_902
loop_901:
	fxors	%f12,	%f9,	%f27
	movcs	%xcc,	%o4,	%g2
	mulx	%o3,	0x15F7,	%l0
loop_902:
	orcc	%o7,	%o1,	%l3
	smulcc	%l2,	%g1,	%i2
	bn,a	%xcc,	loop_903
	edge16	%g4,	%g5,	%i0
	movle	%xcc,	%o6,	%l1
	fsrc2s	%f14,	%f26
loop_903:
	orn	%i5,	%i1,	%i3
	edge32l	%i6,	%o5,	%o2
	fmovrsgez	%g7,	%f26,	%f20
	tvs	%xcc,	0x5
	sethi	0x07A6,	%l4
	ld	[%l7 + 0x70],	%f5
	fmovdvs	%xcc,	%f5,	%f8
	array8	%i4,	%g6,	%g3
	mulx	%l5,	0x184B,	%l6
	fsrc1	%f28,	%f8
	nop
	setx	loop_904,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge32l	%o0,	%i7,	%o4
	fandnot1	%f16,	%f18,	%f10
	subccc	%o3,	%l0,	%o7
loop_904:
	brlez,a	%o1,	loop_905
	edge8	%l3,	%l2,	%g1
	udivcc	%i2,	0x13E5,	%g4
	subcc	%g5,	%g2,	%o6
loop_905:
	srax	%i0,	%i5,	%l1
	brlez	%i3,	loop_906
	be,a	%icc,	loop_907
	tgu	%xcc,	0x7
	lduw	[%l7 + 0x7C],	%i1
loop_906:
	nop
	setx	loop_908,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_907:
	movre	%o5,	%i6,	%o2
	alignaddrl	%l4,	%g7,	%i4
	brnz	%g3,	loop_909
loop_908:
	tcc	%icc,	0x5
	fnands	%f23,	%f1,	%f11
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_909:
	tcc	%xcc,	0x1
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x11] %asi,	%l5
	movre	%g6,	%o0,	%i7
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%l6,	%o4
	movleu	%xcc,	%o3,	%l0
	fpackfix	%f8,	%f29
	nop
	fitod	%f6,	%f4
	fdtos	%f4,	%f0
	movvc	%icc,	%o1,	%o7
	sir	0x0410
	fbule,a	%fcc2,	loop_910
	brz	%l2,	loop_911
	nop
	set	0x18, %o4
	ldsw	[%l7 + %o4],	%g1
	fbuge	%fcc3,	loop_912
loop_910:
	xnor	%i2,	%g4,	%g5
loop_911:
	nop
	membar	#Sync
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x17,	%f16
loop_912:
	ble,pt	%icc,	loop_913
	orcc	%g2,	0x029A,	%o6
	ba	%xcc,	loop_914
	mova	%xcc,	%l3,	%i5
loop_913:
	fmovrsne	%l1,	%f27,	%f13
	nop
	setx	0x0843DB28,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f26
loop_914:
	alignaddr	%i0,	%i3,	%i1
	udivcc	%i6,	0x100D,	%o2
	movn	%icc,	%o5,	%g7
	sub	%i4,	%l4,	%l5
	wr	%g0,	0x10,	%asi
	sta	%f19,	[%l7 + 0x2C] %asi
	ldd	[%l7 + 0x70],	%g6
	nop
	fitos	%f7,	%f30
	te	%icc,	0x3
	tge	%icc,	0x1
	tneg	%xcc,	0x5
	fnot1s	%f21,	%f19
	fbue	%fcc3,	loop_915
	sub	%g3,	%o0,	%i7
	tvc	%icc,	0x5
	sdivx	%o4,	0x1692,	%l6
loop_915:
	nop
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x50] %asi,	%o2
	umulcc	%o1,	0x11DE,	%l0
	sir	0x0ACC
	array32	%l2,	%o7,	%i2
	nop
	setx	0xFA359732,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x8E8E4633,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fsubs	%f5,	%f15,	%f26
	fbe	%fcc3,	loop_916
	or	%g4,	%g5,	%g1
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x0E] %asi,	%o6
loop_916:
	movrlez	%g2,	%i5,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i0,	%l3,	%i1
	taddcc	%i3,	0x10FC,	%o2
	fmovdcc	%icc,	%f12,	%f18
	movcc	%icc,	%i6,	%o5
	and	%g7,	0x0864,	%i4
	xnorcc	%l5,	0x182E,	%g6
	fba,a	%fcc1,	loop_917
	movgu	%icc,	%g3,	%o0
	fpadd32s	%f30,	%f9,	%f16
	taddcctv	%l4,	0x00A0,	%o4
loop_917:
	lduh	[%l7 + 0x24],	%l6
	sub	%o3,	%o1,	%i7
	bgu	loop_918
	movneg	%xcc,	%l0,	%l2
	fmovrdlz	%o7,	%f14,	%f2
	std	%f0,	[%l7 + 0x58]
loop_918:
	fba,a	%fcc3,	loop_919
	tsubcc	%g4,	0x039F,	%i2
	bleu,a,pn	%icc,	loop_920
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_919:
	movrne	%g1,	%g5,	%g2
	movrne	%o6,	0x136,	%l1
loop_920:
	nop
	fitos	%f12,	%f20
	fstod	%f20,	%f24
	fmovrsgez	%i5,	%f25,	%f4
	edge16	%l3,	%i1,	%i0
	andn	%o2,	%i3,	%o5
	brz	%i6,	loop_921
	subcc	%g7,	0x1E37,	%i4
	movvs	%xcc,	%l5,	%g6
	edge8l	%o0,	%l4,	%g3
loop_921:
	andncc	%o4,	%l6,	%o1
	bvs,a	loop_922
	tleu	%xcc,	0x2
	edge16ln	%o3,	%l0,	%l2
	movl	%icc,	%i7,	%g4
loop_922:
	sdivx	%i2,	0x1D0A,	%g1
	movvs	%icc,	%o7,	%g2
	tcs	%xcc,	0x3
	bneg	loop_923
	tpos	%xcc,	0x7
	fnands	%f12,	%f25,	%f23
	nop
	setx	0xD87480BA4045B031,	%l0,	%l6
	stx	%l6,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%fsr
loop_923:
	edge8l	%o6,	%g5,	%l1
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x54] %asi,	%l3
	movle	%icc,	%i1,	%i5
	subcc	%i0,	%i3,	%o5
	te	%icc,	0x2
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x88
	udiv	%o2,	0x01B0,	%i6
	brgez,a	%g7,	loop_924
	mova	%xcc,	%l5,	%i4
	tcc	%icc,	0x2
	mova	%xcc,	%g6,	%l4
loop_924:
	fba	%fcc1,	loop_925
	tg	%xcc,	0x3
	array8	%g3,	%o0,	%o4
	set	0x40, %g7
	stda	%f16,	[%l7 + %g7] 0xf9
	membar	#Sync
loop_925:
	fmovsl	%xcc,	%f1,	%f11
	sll	%o1,	%o3,	%l6
	set	0x0C, %l5
	lduwa	[%l7 + %l5] 0x11,	%l2
	tle	%icc,	0x2
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	bge,a,pt	%icc,	loop_926
	movgu	%xcc,	%g4,	%i2
	brgz,a	%i7,	loop_927
	array8	%o7,	%g1,	%o6
loop_926:
	nop
	setx	loop_928,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	loop_929,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_927:
	movcs	%icc,	%g5,	%g2
	edge32n	%l1,	%i1,	%l3
loop_928:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_929:
	edge8n	%i0,	%i3,	%i5
	bneg,a,pn	%xcc,	loop_930
	edge32	%o2,	%i6,	%g7
	edge16ln	%o5,	%i4,	%g6
	tvc	%icc,	0x1
loop_930:
	add	%l4,	%l5,	%o0
	be,pt	%xcc,	loop_931
	fpack16	%f24,	%f27
	umulcc	%o4,	%o1,	%g3
	fsrc2	%f26,	%f24
loop_931:
	andcc	%l6,	0x0D3E,	%o3
	addc	%l0,	%l2,	%i2
	edge32n	%g4,	%i7,	%o7
	bg,a	loop_932
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g1,	0x1E6D,	%g5
	orn	%o6,	0x1860,	%l1
loop_932:
	array8	%i1,	%g2,	%i0
	fba,a	%fcc0,	loop_933
	fnot1s	%f25,	%f1
	edge16	%i3,	%l3,	%i5
	umulcc	%o2,	%i6,	%g7
loop_933:
	mulscc	%o5,	0x18F5,	%g6
	fsrc1s	%f5,	%f3
	fmovdvs	%icc,	%f9,	%f7
	andncc	%i4,	%l4,	%l5
	brlz,a	%o4,	loop_934
	fandnot1	%f12,	%f18,	%f2
	fbuge	%fcc3,	loop_935
	tleu	%xcc,	0x3
loop_934:
	stb	%o1,	[%l7 + 0x7A]
	ldstub	[%l7 + 0x3D],	%g3
loop_935:
	andn	%l6,	%o3,	%l0
	bgu,a,pn	%xcc,	loop_936
	or	%l2,	%o0,	%g4
	nop
	setx	0x937D1F6C255D9A85,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xB466317F6DD135CC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f24,	%f0
	array8	%i2,	%o7,	%g1
loop_936:
	ldx	[%l7 + 0x20],	%g5
	edge32ln	%i7,	%l1,	%o6
	edge16l	%i1,	%g2,	%i0
	tge	%xcc,	0x3
	srl	%l3,	%i3,	%i5
	fandnot1s	%f30,	%f7,	%f13
	movcc	%xcc,	%i6,	%g7
	addccc	%o5,	%g6,	%i4
	subccc	%l4,	0x14E0,	%l5
	set	0x38, %i4
	sta	%f19,	[%l7 + %i4] 0x18
	sdivx	%o2,	0x02F6,	%o1
	tvs	%icc,	0x4
	movn	%icc,	%o4,	%l6
	st	%f25,	[%l7 + 0x6C]
	fbe,a	%fcc2,	loop_937
	and	%o3,	0x0E7D,	%l0
	nop
	setx	0x7C7A6C4D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xAF82CF5E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f19,	%f25
	andcc	%l2,	0x10D6,	%g3
loop_937:
	movrgez	%o0,	0x044,	%g4
	sra	%i2,	%o7,	%g1
	call	loop_938
	nop
	set	0x40, %i0
	std	%f30,	[%l7 + %i0]
	te	%icc,	0x5
	movvc	%xcc,	%i7,	%g5
loop_938:
	movleu	%icc,	%o6,	%i1
	membar	0x02
	alignaddr	%g2,	%l1,	%l3
	movvc	%xcc,	%i3,	%i0
	orncc	%i5,	%i6,	%g7
	nop
	setx	0x7CBAF66B6A2C9FA5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0x76210BF1702A6F7A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fsubd	%f16,	%f30,	%f4
	addcc	%g6,	0x1798,	%i4
	fmovrsgz	%l4,	%f19,	%f20
	sdivcc	%o5,	0x1A4E,	%l5
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x50] %asi,	%o2
	movgu	%icc,	%o4,	%l6
	array16	%o3,	%o1,	%l0
	andncc	%l2,	%g3,	%o0
	movrlz	%g4,	%o7,	%g1
	fmovdpos	%icc,	%f13,	%f5
	tle	%icc,	0x2
	bn	%icc,	loop_939
	edge16ln	%i2,	%i7,	%o6
	fandnot2s	%f2,	%f13,	%f26
	sir	0x18E0
loop_939:
	movrlez	%g5,	0x1CF,	%i1
	edge8ln	%l1,	%l3,	%i3
	sdiv	%g2,	0x1C81,	%i0
	movpos	%icc,	%i5,	%i6
	orncc	%g7,	%i4,	%g6
	fone	%f10
	and	%o5,	%l5,	%o2
	stw	%o4,	[%l7 + 0x5C]
	edge32l	%l4,	%l6,	%o3
	nop
	setx	0x3CF2D401,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f1
	stbar
	movrlez	%o1,	%l2,	%g3
	fmovsle	%xcc,	%f6,	%f9
	tvs	%icc,	0x3
	fpack16	%f30,	%f17
	movleu	%icc,	%l0,	%o0
	ta	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%g4,	%g1,	%o7
	fbuge	%fcc1,	loop_940
	move	%xcc,	%i2,	%o6
	std	%f22,	[%l7 + 0x18]
	fmovscs	%icc,	%f22,	%f24
loop_940:
	udivcc	%g5,	0x004C,	%i1
	taddcc	%l1,	%i7,	%i3
	set	0x68, %g1
	stwa	%l3,	[%l7 + %g1] 0x14
	smul	%i0,	%g2,	%i6
	ta	%xcc,	0x5
	xnorcc	%i5,	%g7,	%i4
	edge16l	%g6,	%l5,	%o2
	movl	%xcc,	%o4,	%o5
	fcmpeq32	%f10,	%f8,	%l6
	nop
	setx	loop_941,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovrde	%o3,	%f6,	%f12
	bne	%xcc,	loop_942
	fpadd16s	%f31,	%f4,	%f29
loop_941:
	fbuge	%fcc2,	loop_943
	movgu	%xcc,	%o1,	%l4
loop_942:
	bneg,a,pn	%icc,	loop_944
	or	%l2,	0x1E77,	%l0
loop_943:
	faligndata	%f8,	%f30,	%f6
	movneg	%xcc,	%g3,	%g4
loop_944:
	popc	%g1,	%o7
	andncc	%i2,	%o6,	%g5
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] 0x11,	%o0,	%i1
	alignaddrl	%l1,	%i3,	%i7
	tsubcctv	%l3,	0x0D0A,	%i0
	fmovs	%f11,	%f2
	array32	%g2,	%i6,	%i5
	umul	%g7,	0x1BCE,	%g6
	nop
	fitod	%f8,	%f14
	fdtoi	%f14,	%f23
	set	0x40, %l2
	stda	%f16,	[%l7 + %l2] 0x1e
	membar	#Sync
	sllx	%i4,	0x12,	%o2
	nop
	fitod	%f15,	%f6
	subccc	%l5,	0x00AE,	%o4
	tge	%xcc,	0x7
	fba	%fcc0,	loop_945
	tgu	%xcc,	0x5
	fbl	%fcc2,	loop_946
	ldsw	[%l7 + 0x34],	%o5
loop_945:
	tle	%icc,	0x7
	fpsub32	%f18,	%f6,	%f30
loop_946:
	fpmerge	%f24,	%f10,	%f10
	bcs	loop_947
	movrgz	%l6,	0x35F,	%o3
	bne,pt	%icc,	loop_948
	tne	%icc,	0x4
loop_947:
	popc	0x1887,	%l4
	andn	%l2,	0x077D,	%o1
loop_948:
	nop
	wr	%g0,	0x04,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	xor	%l0,	0x0A7A,	%g4
	lduh	[%l7 + 0x3E],	%g3
	movrne	%g1,	%o7,	%i2
	fpackfix	%f26,	%f22
	fbul,a	%fcc0,	loop_949
	edge16ln	%o6,	%g5,	%o0
	fpsub32s	%f20,	%f19,	%f4
	alignaddrl	%l1,	%i3,	%i1
loop_949:
	fbge,a	%fcc1,	loop_950
	tcc	%xcc,	0x0
	tcc	%icc,	0x2
	nop
	fitod	%f4,	%f10
	fdtox	%f10,	%f26
	fxtod	%f26,	%f16
loop_950:
	movpos	%xcc,	%l3,	%i0
	movrne	%g2,	0x266,	%i7
	sdiv	%i6,	0x1C37,	%g7
	array16	%g6,	%i5,	%o2
	fmovspos	%xcc,	%f1,	%f27
	sub	%l5,	%o4,	%o5
	ble,a,pt	%xcc,	loop_951
	nop
	setx	0x50680C56,	%l0,	%l6
	st	%l6,	[%l7 + 0x24]
	ld	[%l7 + 0x24],	%fsr
	orn	%l6,	0x0FD7,	%i4
	fpsub16	%f28,	%f12,	%f12
loop_951:
	ldx	[%l7 + 0x40],	%l4
	fsrc1	%f6,	%f0
	fnors	%f8,	%f5,	%f11
	fmovdgu	%icc,	%f17,	%f19
	fmovsg	%icc,	%f20,	%f30
	fbn,a	%fcc0,	loop_952
	fmovrdne	%l2,	%f30,	%f20
	stb	%o3,	[%l7 + 0x54]
	fnands	%f31,	%f0,	%f25
loop_952:
	fcmpgt16	%f6,	%f24,	%l0
	add	%l7,	0x74,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x18,	%o1,	%g4
	tcs	%icc,	0x2
	nop
	setx	0x1C490B27805016D6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	fmovd	%f4,	%f0
	movre	%g1,	%g3,	%o7
	movl	%xcc,	%i2,	%o6
	addccc	%o0,	%g5,	%i3
	movneg	%icc,	%i1,	%l1
	set	0x51, %i5
	stba	%i0,	[%l7 + %i5] 0x11
	movgu	%xcc,	%g2,	%l3
	sir	0x0820
	fpack16	%f10,	%f6
	set	0x60, %i7
	ldxa	[%l7 + %i7] 0x89,	%i7
	tle	%icc,	0x5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i6,	0x1BA9,	%g6
	umulcc	%i5,	0x148B,	%o2
	fmovsne	%xcc,	%f18,	%f9
	tle	%xcc,	0x5
	fmovdvs	%xcc,	%f26,	%f5
	taddcc	%g7,	%l5,	%o5
	array32	%o4,	%i4,	%l6
	sll	%l2,	%o3,	%l0
	smulcc	%o1,	0x0013,	%g4
	bn,a,pn	%icc,	loop_953
	array32	%g1,	%l4,	%o7
	smul	%i2,	%o6,	%g3
	movcs	%icc,	%o0,	%i3
loop_953:
	nop
	fitod	%f8,	%f22
	fdtox	%f22,	%f22
	sdivcc	%i1,	0x1013,	%l1
	movrlz	%g5,	%g2,	%l3
	edge32	%i0,	%i6,	%g6
	mova	%icc,	%i5,	%o2
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x40] %asi,	%i6
	udivcc	%g7,	0x0784,	%l5
	movge	%icc,	%o5,	%i4
	popc	0x00F5,	%l6
	fmul8x16au	%f1,	%f16,	%f14
	edge8l	%l2,	%o3,	%l0
	array8	%o4,	%g4,	%o1
	movg	%xcc,	%g1,	%l4
	sir	0x1E32
	smulcc	%o7,	%i2,	%o6
	umul	%g3,	%i3,	%o0
	movne	%xcc,	%l1,	%i1
	fbue,a	%fcc1,	loop_954
	bvs,a,pn	%xcc,	loop_955
	movrgez	%g5,	0x04D,	%l3
	andncc	%i0,	%g2,	%g6
loop_954:
	nop
	set	0x60, %o6
	ldda	[%l7 + %o6] 0x22,	%i4
loop_955:
	tge	%icc,	0x6
	array8	%o2,	%i6,	%i7
	smul	%g7,	0x1CBA,	%o5
	movle	%xcc,	%l5,	%l6
	nop
	fitos	%f13,	%f28
	fstoi	%f28,	%f24
	srax	%i4,	%o3,	%l0
	tcc	%xcc,	0x0
	nop
	setx	loop_956,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdle	%icc,	%f24,	%f25
	ldd	[%l7 + 0x60],	%f18
	umul	%l2,	%g4,	%o1
loop_956:
	sir	0x1145
	subc	%o4,	%g1,	%l4
	udivcc	%i2,	0x10FC,	%o6
	edge32n	%g3,	%i3,	%o0
	udiv	%o7,	0x0665,	%l1
	bgu,a	%xcc,	loop_957
	andncc	%i1,	%l3,	%g5
	bvc	%icc,	loop_958
	sethi	0x18F3,	%i0
loop_957:
	tvc	%xcc,	0x2
	srax	%g6,	0x15,	%g2
loop_958:
	sra	%o2,	0x1A,	%i5
	fmovsle	%xcc,	%f18,	%f13
	nop
	fitod	%f8,	%f14
	fdtos	%f14,	%f9
	movle	%xcc,	%i7,	%g7
	ldsb	[%l7 + 0x0D],	%o5
	edge32n	%i6,	%l5,	%i4
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
	tvs	%icc,	0x6
	array16	%o3,	%l0,	%l2
	movl	%icc,	%l6,	%o1
loop_959:
	alignaddr	%o4,	%g4,	%l4
	fnands	%f19,	%f2,	%f27
	edge8n	%i2,	%g1,	%o6
	sdiv	%i3,	0x13B8,	%g3
	bl,a	%xcc,	loop_960
	brlez	%o7,	loop_961
	udivcc	%o0,	0x19FB,	%l1
	tpos	%icc,	0x1
loop_960:
	orn	%i1,	%g5,	%i0
loop_961:
	fpack16	%f6,	%f13
	set	0x64, %o2
	lduha	[%l7 + %o2] 0x11,	%g6
	tn	%xcc,	0x3
	nop
	fitos	%f3,	%f9
	fstoi	%f9,	%f5
	nop
	setx	0xDF6C7197AB2113BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x3720D2657C74B7A6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f4,	%f0
	fands	%f1,	%f15,	%f27
	call	loop_962
	sllx	%g2,	0x0C,	%o2
	smul	%i5,	%i7,	%l3
	tcc	%icc,	0x5
loop_962:
	movrne	%o5,	0x0D7,	%g7
	te	%icc,	0x3
	movne	%xcc,	%i6,	%l5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%i4,	%l0
	tpos	%xcc,	0x0
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%l2
	lduw	[%l7 + 0x58],	%l6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%o1,	%g4
	sra	%l4,	0x17,	%i2
	tneg	%xcc,	0x7
	andncc	%g1,	%o6,	%o4
	set	0x60, %g6
	ldda	[%l7 + %g6] 0x2b,	%g2
	tvs	%icc,	0x7
	be	%icc,	loop_963
	nop
	setx	0x3DBD064C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	setx	0x101EE7B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fsubs	%f0,	%f6,	%f19
	set	0x12, %i3
	lduha	[%l7 + %i3] 0x18,	%o7
loop_963:
	sth	%i3,	[%l7 + 0x26]
	ldstub	[%l7 + 0x52],	%l1
	nop
	set	0x58, %i1
	stx	%i1,	[%l7 + %i1]
	mova	%icc,	%g5,	%i0
	nop
	setx	loop_964,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movge	%icc,	%g6,	%g2
	tg	%icc,	0x6
	tsubcc	%o2,	%i5,	%o0
loop_964:
	swap	[%l7 + 0x48],	%i7
	call	loop_965
	movrgez	%l3,	%o5,	%i6
	tsubcc	%g7,	0x18EC,	%l5
	fbg,a	%fcc2,	loop_966
loop_965:
	fornot1	%f26,	%f20,	%f8
	fcmple32	%f24,	%f24,	%i4
	tcs	%icc,	0x7
loop_966:
	fpsub32s	%f1,	%f20,	%f8
	movge	%xcc,	%o3,	%l0
	fandnot1	%f20,	%f0,	%f10
	tvc	%xcc,	0x6
	fands	%f8,	%f5,	%f22
	sethi	0x02BA,	%l6
	movrgez	%o1,	0x3AC,	%g4
	nop
	setx	loop_967,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnors	%f18,	%f11,	%f0
	movvc	%xcc,	%l2,	%l4
	addcc	%i2,	0x0F78,	%o6
loop_967:
	add	%g1,	%o4,	%o7
	andcc	%g3,	0x1208,	%l1
	taddcctv	%i1,	%g5,	%i3
	movne	%xcc,	%i0,	%g2
	te	%icc,	0x6
	udiv	%o2,	0x1D84,	%i5
	tvs	%icc,	0x2
	stbar
	movre	%o0,	%g6,	%i7
	smul	%o5,	%i6,	%l3
	fpsub32s	%f25,	%f18,	%f25
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l5,	0x1968,	%i4
	andcc	%g7,	%l0,	%o3
	edge8l	%l6,	%o1,	%l2
	fornot2	%f4,	%f6,	%f24
	fmovrsgz	%l4,	%f20,	%f29
	udiv	%i2,	0x0B21,	%o6
	std	%f2,	[%l7 + 0x58]
	movvc	%icc,	%g1,	%g4
	sra	%o4,	0x0C,	%g3
	tg	%xcc,	0x4
	tg	%icc,	0x7
	st	%f15,	[%l7 + 0x14]
	edge32l	%l1,	%i1,	%o7
	sth	%i3,	[%l7 + 0x26]
	alignaddrl	%i0,	%g2,	%g5
	fcmpgt16	%f12,	%f6,	%o2
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x88
	fmovrslz	%i5,	%f2,	%f18
	fpsub32s	%f5,	%f22,	%f17
	fabsd	%f4,	%f4
	edge16l	%g6,	%i7,	%o0
	edge16n	%i6,	%o5,	%l3
	nop
	setx	0xFD5C3E885D485098,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f4
	nop
	setx	loop_968,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	bcc,a	%xcc,	loop_969
	movvc	%icc,	%l5,	%g7
	movrlz	%i4,	%o3,	%l0
loop_968:
	taddcc	%o1,	%l6,	%l2
loop_969:
	fbn	%fcc0,	loop_970
	taddcctv	%i2,	0x0D36,	%o6
	movrlz	%l4,	%g4,	%o4
	movpos	%icc,	%g1,	%g3
loop_970:
	movgu	%icc,	%l1,	%i1
	movneg	%xcc,	%o7,	%i3
	sdiv	%g2,	0x0FA0,	%g5
	movn	%icc,	%i0,	%i5
	umulcc	%g6,	%o2,	%o0
	nop
	fitod	%f8,	%f22
	fdtox	%f22,	%f0
	and	%i6,	0x0F99,	%o5
	set	0x30, %o3
	ldxa	[%l7 + %o3] 0x0c,	%l3
	nop
	set	0x29, %l4
	stb	%i7,	[%l7 + %l4]
	smulcc	%l5,	%i4,	%g7
	andcc	%l0,	0x093A,	%o1
	fcmple16	%f12,	%f10,	%l6
	sra	%o3,	0x05,	%i2
	tge	%icc,	0x7
	udiv	%l2,	0x1525,	%l4
	fmovrslz	%o6,	%f18,	%f16
	udiv	%g4,	0x179B,	%g1
	ble,a	%xcc,	loop_971
	faligndata	%f24,	%f14,	%f0
	fand	%f14,	%f16,	%f20
	ta	%icc,	0x7
loop_971:
	movvc	%xcc,	%o4,	%g3
	srl	%l1,	%i1,	%o7
	subc	%i3,	%g5,	%g2
	tge	%icc,	0x6
	and	%i5,	0x07AE,	%i0
	orn	%o2,	0x075E,	%o0
	fornot2s	%f28,	%f21,	%f0
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x64] %asi,	%i6
	nop
	setx loop_972, %l0, %l1
	jmpl %l1, %g6
	tg	%xcc,	0x5
	umulcc	%o5,	0x14A4,	%i7
	set	0x70, %l0
	stha	%l3,	[%l7 + %l0] 0x2a
	membar	#Sync
loop_972:
	for	%f28,	%f12,	%f12
	nop
	setx	0x37D82680E04EB15A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	or	%i4,	0x0F36,	%g7
	array16	%l0,	%o1,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f20,	%f24,	%f24
	fnegs	%f2,	%f5
	membar	0x56
	movneg	%xcc,	%o3,	%i2
	fmul8x16	%f6,	%f14,	%f20
	tge	%xcc,	0x2
	movrlez	%l2,	0x0D7,	%l4
	andn	%o6,	0x0724,	%l5
	nop
	setx	0xB07F51A2,	%l0,	%l6
	st	%l6,	[%l7 + 0x64]
	ld	[%l7 + 0x64],	%fsr
	ldstub	[%l7 + 0x49],	%g4
	addc	%o4,	0x0A3D,	%g1
	subc	%l1,	%i1,	%g3
	udiv	%i3,	0x121E,	%g5
	ldub	[%l7 + 0x18],	%g2
	movle	%icc,	%o7,	%i5
	ldsb	[%l7 + 0x5D],	%i0
	movg	%xcc,	%o2,	%o0
	umul	%g6,	%o5,	%i6
	alignaddrl	%l3,	%i7,	%i4
	brz	%g7,	loop_973
	fbule	%fcc0,	loop_974
	subcc	%o1,	0x0705,	%l0
	for	%f24,	%f28,	%f12
loop_973:
	addcc	%o3,	0x0656,	%l6
loop_974:
	tl	%xcc,	0x4
	fbue	%fcc3,	loop_975
	fors	%f9,	%f16,	%f31
	fbule,a	%fcc2,	loop_976
	tne	%xcc,	0x2
loop_975:
	bgu,a,pn	%icc,	loop_977
	addc	%i2,	%l4,	%l2
loop_976:
	movleu	%icc,	%l5,	%g4
	fbu,a	%fcc2,	loop_978
loop_977:
	fornot2	%f22,	%f18,	%f26
	movrgz	%o6,	%o4,	%g1
	tleu	%xcc,	0x1
loop_978:
	udiv	%i1,	0x1CB8,	%l1
	te	%xcc,	0x5
	umul	%i3,	0x150F,	%g5
	fmovrslz	%g2,	%f14,	%f3
	tcs	%icc,	0x2
	movrgez	%o7,	0x135,	%g3
	sdivcc	%i0,	0x0546,	%o2
	nop
	fitos	%f10,	%f8
	fstoi	%f8,	%f26
	fmovsl	%xcc,	%f22,	%f25
	edge32l	%o0,	%i5,	%g6
	addc	%o5,	0x004D,	%l3
	movn	%xcc,	%i6,	%i7
	movle	%icc,	%i4,	%o1
	edge32n	%g7,	%l0,	%l6
	bg	loop_979
	movre	%i2,	%o3,	%l4
	fmovsleu	%xcc,	%f10,	%f11
	fnot2s	%f27,	%f7
loop_979:
	be,a,pt	%xcc,	loop_980
	movleu	%icc,	%l2,	%l5
	tsubcctv	%o6,	0x04D6,	%g4
	movn	%xcc,	%g1,	%i1
loop_980:
	fmovsge	%xcc,	%f7,	%f1
	xorcc	%l1,	0x1164,	%i3
	movrgz	%g5,	0x0E1,	%o4
	fmovdle	%icc,	%f8,	%f6
	ldsw	[%l7 + 0x24],	%g2
	tcc	%xcc,	0x0
	movleu	%xcc,	%g3,	%i0
	fmovrslz	%o7,	%f3,	%f18
	tgu	%icc,	0x5
	fbo	%fcc3,	loop_981
	srax	%o0,	%o2,	%g6
	movl	%icc,	%o5,	%l3
	fmovdneg	%xcc,	%f5,	%f13
loop_981:
	tvc	%icc,	0x3
	st	%f11,	[%l7 + 0x78]
	flush	%l7 + 0x10
	tg	%xcc,	0x5
	sdivcc	%i6,	0x18CD,	%i5
	movvc	%xcc,	%i4,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o1,	%g7,	%l0
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x54] %asi,	%i2
	nop
	setx	0x120B9960,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	setx	0xC1071CDF,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fadds	%f6,	%f17,	%f24
	ldd	[%l7 + 0x58],	%f4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%o3,	%l6
	taddcctv	%l4,	%l2,	%l5
	fmovrslez	%g4,	%f21,	%f19
	array32	%g1,	%o6,	%i1
	movcc	%xcc,	%l1,	%i3
	fnegs	%f20,	%f11
	move	%icc,	%g5,	%o4
	xnor	%g3,	%g2,	%i0
	movrlez	%o0,	%o7,	%o2
	edge16n	%g6,	%o5,	%i6
	movvc	%icc,	%l3,	%i5
	fmovdvs	%xcc,	%f3,	%f17
	sra	%i7,	0x05,	%i4
	fbuge	%fcc1,	loop_982
	mova	%xcc,	%g7,	%l0
	sdivcc	%o1,	0x1337,	%i2
	movrlez	%l6,	%o3,	%l2
loop_982:
	fblg,a	%fcc2,	loop_983
	addccc	%l4,	%g4,	%l5
	nop
	set	0x28, %g2
	ldd	[%l7 + %g2],	%f4
	srax	%o6,	0x1B,	%i1
loop_983:
	fmovdcs	%xcc,	%f1,	%f14
	tvc	%xcc,	0x0
	tvs	%icc,	0x4
	sub	%g1,	0x15B7,	%i3
	bg,a,pn	%xcc,	loop_984
	fnor	%f22,	%f20,	%f0
	ldd	[%l7 + 0x10],	%l0
	movrlz	%g5,	0x3CC,	%o4
loop_984:
	ldsb	[%l7 + 0x3F],	%g2
	fmovdge	%xcc,	%f17,	%f10
	fxnors	%f7,	%f12,	%f8
	edge32l	%i0,	%o0,	%g3
	movrlez	%o7,	0x261,	%g6
	addc	%o2,	0x0F2D,	%o5
	fmovrsgez	%i6,	%f0,	%f11
	orn	%l3,	0x09AD,	%i5
	fsrc1	%f0,	%f26
	stx	%i4,	[%l7 + 0x38]
	popc	0x0EAD,	%i7
	orcc	%l0,	%g7,	%i2
	srax	%l6,	%o3,	%l2
	stw	%o1,	[%l7 + 0x0C]
	tne	%icc,	0x1
	umul	%l4,	%l5,	%g4
	bge	%xcc,	loop_985
	movne	%icc,	%i1,	%g1
	movcs	%icc,	%i3,	%l1
	popc	0x13D6,	%o6
loop_985:
	subc	%g5,	%o4,	%g2
	fors	%f9,	%f28,	%f30
	movrgz	%i0,	0x21C,	%o0
	set	0x7C, %g4
	stwa	%o7,	[%l7 + %g4] 0x27
	membar	#Sync
	ba,a	loop_986
	tcc	%xcc,	0x4
	sub	%g3,	%g6,	%o2
	orn	%i6,	0x0C97,	%l3
loop_986:
	brz	%i5,	loop_987
	tle	%icc,	0x2
	edge8	%i4,	%o5,	%i7
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x1A] %asi,	%g7
loop_987:
	subc	%l0,	0x0115,	%l6
	movpos	%xcc,	%o3,	%i2
	andcc	%o1,	0x0E75,	%l2
	udivx	%l5,	0x18CC,	%l4
	fmuld8sux16	%f20,	%f15,	%f22
	sdivcc	%g4,	0x0220,	%g1
	fmovsgu	%icc,	%f23,	%f11
	edge16ln	%i1,	%i3,	%l1
	fpadd16s	%f0,	%f19,	%f12
	or	%o6,	0x0DCA,	%o4
	tneg	%xcc,	0x5
	orn	%g5,	%g2,	%o0
	stbar
	tl	%icc,	0x2
	sir	0x16F3
	brz,a	%i0,	loop_988
	ldd	[%l7 + 0x30],	%o6
	sdivcc	%g3,	0x0776,	%g6
	fmovsn	%xcc,	%f31,	%f8
loop_988:
	movpos	%icc,	%i6,	%l3
	sra	%i5,	%i4,	%o2
	array8	%i7,	%o5,	%l0
	fble	%fcc1,	loop_989
	st	%f19,	[%l7 + 0x34]
	nop
	fitos	%f14,	%f27
	fstoi	%f27,	%f26
	movrgez	%l6,	0x314,	%g7
loop_989:
	fmovdle	%xcc,	%f20,	%f25
	fbug,a	%fcc0,	loop_990
	fmovdne	%xcc,	%f31,	%f23
	taddcctv	%o3,	0x157C,	%i2
	tvc	%icc,	0x3
loop_990:
	for	%f30,	%f10,	%f6
	fmovdn	%xcc,	%f9,	%f31
	tcc	%xcc,	0x7
	movrne	%l2,	0x05C,	%l5
	udivcc	%l4,	0x020A,	%o1
	fmovsneg	%icc,	%f29,	%f30
	tsubcc	%g4,	0x18FC,	%g1
	membar	0x15
	set	0x52, %i2
	ldstuba	[%l7 + %i2] 0x11,	%i3
	tgu	%icc,	0x5
	stb	%i1,	[%l7 + 0x62]
	movpos	%xcc,	%l1,	%o6
	umul	%g5,	%g2,	%o4
	fmovsvs	%xcc,	%f26,	%f11
	sir	0x1DCB
	move	%icc,	%i0,	%o0
	fmuld8ulx16	%f22,	%f31,	%f4
	nop
	setx	0x80587AE7,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	fmul8x16	%f9,	%f20,	%f30
	tg	%icc,	0x4
	movpos	%xcc,	%o7,	%g6
	movrlz	%i6,	%l3,	%i5
	fornot1	%f26,	%f26,	%f16
	fmovdne	%xcc,	%f8,	%f0
	addccc	%i4,	0x1982,	%g3
	bcc	%xcc,	loop_991
	fmovdle	%icc,	%f11,	%f0
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i7
loop_991:
	nop
	setx	loop_992,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movre	%o2,	%o5,	%l0
	set	0x60, %l3
	lduwa	[%l7 + %l3] 0x0c,	%l6
loop_992:
	movl	%xcc,	%o3,	%i2
	te	%xcc,	0x2
	fmovrsgz	%l2,	%f14,	%f15
	taddcc	%g7,	0x02B9,	%l5
	orncc	%l4,	0x16CE,	%g4
	array16	%o1,	%g1,	%i3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x50] %asi,	 0x1
	addccc	%l1,	%o6,	%g2
	array8	%g5,	%i0,	%o0
	bn	%icc,	loop_993
	fnors	%f9,	%f15,	%f29
	tcs	%icc,	0x0
	udivx	%o4,	0x1F70,	%g6
loop_993:
	fbe	%fcc3,	loop_994
	movne	%xcc,	%o7,	%l3
	fzero	%f24
	fones	%f24
loop_994:
	nop
	fitos	%f18,	%f3
	movle	%xcc,	%i6,	%i4
	movleu	%icc,	%g3,	%i5
	stw	%i7,	[%l7 + 0x28]
	smul	%o2,	0x115C,	%l0
	nop
	setx loop_995, %l0, %l1
	jmpl %l1, %o5
	and	%l6,	0x1906,	%o3
	popc	0x16D2,	%i2
	edge8	%l2,	%g7,	%l4
loop_995:
	fmovrslez	%g4,	%f11,	%f14
	udivcc	%l5,	0x1EDE,	%g1
	set	0x58, %o0
	swapa	[%l7 + %o0] 0x19,	%o1
	edge32l	%i1,	%i3,	%o6
	fmovrdne	%g2,	%f24,	%f12
	nop
	setx	0x889DF3549F50F54F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f18
	movneg	%xcc,	%g5,	%l1
	mova	%xcc,	%o0,	%o4
	tge	%xcc,	0x1
	movrne	%g6,	0x15B,	%o7
	bgu,a,pt	%xcc,	loop_996
	edge16n	%l3,	%i6,	%i4
	fpsub16	%f20,	%f22,	%f30
	tsubcctv	%g3,	0x0222,	%i5
loop_996:
	nop
	wr	%g0,	0x80,	%asi
	ldsha	[%l7 + 0x30] %asi,	%i7
	udivx	%o2,	0x0508,	%i0
	lduh	[%l7 + 0x60],	%l0
	addc	%l6,	%o5,	%o3
	fornot2s	%f25,	%f9,	%f18
	fxors	%f22,	%f18,	%f14
	nop
	setx loop_997, %l0, %l1
	jmpl %l1, %i2
	ldub	[%l7 + 0x6A],	%g7
	alignaddrl	%l4,	%l2,	%l5
	smul	%g1,	0x0680,	%g4
loop_997:
	srlx	%o1,	%i1,	%i3
	movl	%xcc,	%o6,	%g2
	mulscc	%g5,	%o0,	%o4
	wr	%g0,	0x19,	%asi
	ldsba	[%l7 + 0x20] %asi,	%l1
	brz,a	%g6,	loop_998
	udiv	%o7,	0x1B87,	%l3
	movrlz	%i6,	%i4,	%i5
	xnorcc	%i7,	0x17B8,	%o2
loop_998:
	bneg,a,pn	%icc,	loop_999
	xor	%i0,	%g3,	%l6
	fmovsle	%icc,	%f19,	%f13
	orn	%o5,	%o3,	%l0
loop_999:
	xnor	%g7,	%l4,	%i2
	udivx	%l2,	0x1D97,	%g1
	movrlez	%l5,	%g4,	%i1
	add	%l7,	0x38,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] 0x19,	%i3,	%o1
	edge8	%o6,	%g2,	%o0
	add	%o4,	%g5,	%g6
	membar	0x2D
	fmovd	%f8,	%f4
	fmovdneg	%xcc,	%f19,	%f23
	bvc,a,pt	%icc,	loop_1000
	sub	%o7,	0x1452,	%l1
	tpos	%xcc,	0x6
	xnor	%i6,	%l3,	%i5
loop_1000:
	smul	%i4,	%i7,	%i0
	fbule,a	%fcc3,	loop_1001
	udivx	%g3,	0x021A,	%o2
	edge8ln	%l6,	%o5,	%l0
	andncc	%o3,	%g7,	%i2
loop_1001:
	fmovsne	%icc,	%f12,	%f17
	fnegs	%f0,	%f26
	orcc	%l2,	0x0DE6,	%g1
	smulcc	%l4,	%l5,	%i1
	edge8	%i3,	%g4,	%o6
	addc	%g2,	0x119A,	%o0
	srax	%o4,	%g5,	%g6
	sir	0x0797
	fmovscs	%icc,	%f26,	%f18
	bvs,a	loop_1002
	st	%f5,	[%l7 + 0x5C]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f23,	%f16
loop_1002:
	ba,a	%xcc,	loop_1003
	movneg	%icc,	%o1,	%l1
	bvs,pn	%icc,	loop_1004
	fxor	%f24,	%f0,	%f24
loop_1003:
	movre	%o7,	0x096,	%l3
	orn	%i5,	0x1B79,	%i4
loop_1004:
	fmovdne	%xcc,	%f9,	%f31
	edge32n	%i7,	%i6,	%i0
	sll	%g3,	0x13,	%o2
	fmovdne	%icc,	%f7,	%f31
	brnz,a	%l6,	loop_1005
	fmovsvc	%icc,	%f4,	%f23
	fbo,a	%fcc3,	loop_1006
	bpos	loop_1007
loop_1005:
	fcmpgt32	%f12,	%f18,	%l0
	sll	%o5,	0x1F,	%o3
loop_1006:
	fmovdpos	%xcc,	%f2,	%f28
loop_1007:
	fmovdge	%xcc,	%f14,	%f7
	fmovdcs	%xcc,	%f15,	%f18
	andcc	%i2,	0x0D41,	%g7
	movl	%xcc,	%l2,	%l4
	tvs	%icc,	0x2
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%l5
	casxa	[%l6] %asi,	%l5,	%g1
	tcs	%xcc,	0x1
	tcs	%icc,	0x0
	movrlz	%i1,	0x38B,	%i3
	fmuld8sux16	%f28,	%f30,	%f8
	addc	%g4,	0x092B,	%o6
	popc	%o0,	%g2
	move	%icc,	%o4,	%g5
	fbe	%fcc1,	loop_1008
	movrgz	%g6,	%o1,	%o7
	movvs	%icc,	%l3,	%i5
	sdivcc	%i4,	0x1E94,	%l1
loop_1008:
	tneg	%icc,	0x4
	sra	%i7,	0x1A,	%i6
	tpos	%xcc,	0x6
	tneg	%icc,	0x4
	fpmerge	%f26,	%f5,	%f30
	smul	%i0,	0x1D8E,	%g3
	tneg	%icc,	0x0
	fmovdleu	%xcc,	%f20,	%f9
	fbue	%fcc2,	loop_1009
	movvc	%xcc,	%l6,	%o2
	array8	%o5,	%l0,	%i2
	fmovda	%icc,	%f28,	%f13
loop_1009:
	srax	%o3,	0x03,	%g7
	andcc	%l4,	0x190B,	%l2
	andn	%g1,	0x1D63,	%l5
	sll	%i1,	%g4,	%i3
	movcc	%icc,	%o0,	%o6
	tne	%icc,	0x5
	fmovrde	%o4,	%f0,	%f28
	fnegd	%f20,	%f0
	bn	%xcc,	loop_1010
	nop
	setx	0x7382861B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x336E7818,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fmuls	%f15,	%f28,	%f28
	movrgez	%g5,	0x1E2,	%g2
	subccc	%g6,	%o1,	%o7
loop_1010:
	nop
	setx	0x0B8C3624,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x401A4ED5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f9,	%f6
	mova	%xcc,	%i5,	%l3
	membar	0x28
	movcs	%xcc,	%l1,	%i7
	subcc	%i4,	%i6,	%g3
	nop
	fitod	%f19,	%f20
	orn	%l6,	%i0,	%o2
	fmovde	%xcc,	%f21,	%f22
	movle	%icc,	%o5,	%l0
	brgez,a	%o3,	loop_1011
	fmovdne	%xcc,	%f23,	%f4
	alignaddr	%i2,	%g7,	%l4
	wr	%g0,	0x04,	%asi
	sta	%f5,	[%l7 + 0x40] %asi
loop_1011:
	tl	%xcc,	0x4
	fsrc1	%f10,	%f12
	fbo,a	%fcc1,	loop_1012
	fones	%f18
	set	0x48, %o5
	swapa	[%l7 + %o5] 0x80,	%l2
loop_1012:
	tsubcc	%l5,	%i1,	%g1
	nop
	setx	0xD5F1F7794C7900C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x6E692711223E0172,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f18,	%f10
	fpadd16s	%f0,	%f15,	%f20
	subcc	%g4,	%o0,	%o6
	fbug,a	%fcc0,	loop_1013
	ldsh	[%l7 + 0x3C],	%i3
	movrgez	%g5,	%g2,	%g6
	edge32ln	%o4,	%o7,	%o1
loop_1013:
	brgz	%i5,	loop_1014
	array16	%l1,	%l3,	%i4
	fcmpeq32	%f24,	%f22,	%i6
	andcc	%g3,	0x1AA6,	%l6
loop_1014:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i7,	[%l7 + 0x58]
	set	0x0F, %l1
	ldsba	[%l7 + %l1] 0x18,	%o2
	nop
	setx	0x9A98325BD05F5390,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	tge	%xcc,	0x4
	ldsb	[%l7 + 0x39],	%i0
	nop
	setx	0x3EF1D381,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x1C919F81,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f24,	%f7
	movgu	%icc,	%o5,	%o3
	fnot1	%f10,	%f12
	fones	%f29
	fmul8ulx16	%f12,	%f28,	%f18
	sll	%l0,	0x10,	%g7
	tleu	%xcc,	0x3
	fpack32	%f18,	%f16,	%f2
	ldsw	[%l7 + 0x30],	%i2
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x58] %asi,	%l2
	tsubcctv	%l5,	%l4,	%g1
	movcs	%xcc,	%g4,	%o0
	fmovscs	%icc,	%f28,	%f17
	tvc	%xcc,	0x7
	mulscc	%i1,	%o6,	%i3
	tne	%xcc,	0x1
	fornot1	%f2,	%f10,	%f20
	tl	%icc,	0x6
	wr	%g0,	0xea,	%asi
	stha	%g2,	[%l7 + 0x58] %asi
	membar	#Sync
	membar	0x34
	fmul8sux16	%f20,	%f4,	%f28
	tle	%xcc,	0x3
	srl	%g5,	%o4,	%o7
	tl	%xcc,	0x5
	sdivx	%o1,	0x03A3,	%i5
	bcs,a	loop_1015
	addccc	%g6,	0x10A8,	%l3
	fcmpne16	%f20,	%f18,	%i4
	add	%i6,	%l1,	%g3
loop_1015:
	edge16	%l6,	%o2,	%i0
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movge	%icc,	%i7,	%o5
	edge16l	%l0,	%o3,	%i2
	sdivx	%l2,	0x012B,	%l5
	sdivx	%g7,	0x1949,	%l4
	nop
	setx	0x4DFACCE5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x2EF42B7F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fmuls	%f9,	%f9,	%f24
	movcc	%xcc,	%g4,	%g1
	ldd	[%l7 + 0x50],	%i0
	edge8ln	%o6,	%o0,	%g2
	orcc	%g5,	%o4,	%i3
	fmovd	%f14,	%f26
	edge8l	%o7,	%o1,	%g6
	umul	%l3,	%i5,	%i6
	movpos	%icc,	%l1,	%i4
	sth	%g3,	[%l7 + 0x3E]
	sth	%l6,	[%l7 + 0x68]
	fbug,a	%fcc0,	loop_1016
	lduh	[%l7 + 0x5A],	%o2
	xorcc	%i0,	%i7,	%o5
	tleu	%icc,	0x3
loop_1016:
	smul	%o3,	%i2,	%l0
	swap	[%l7 + 0x10],	%l2
	tvc	%icc,	0x3
	movpos	%xcc,	%g7,	%l4
	tge	%icc,	0x2
	bcc	loop_1017
	ldx	[%l7 + 0x40],	%l5
	fsrc2s	%f12,	%f25
	movneg	%icc,	%g4,	%g1
loop_1017:
	bn,a	%xcc,	loop_1018
	fmovsn	%icc,	%f1,	%f31
	mova	%icc,	%i1,	%o6
	array8	%g2,	%g5,	%o0
loop_1018:
	xnor	%o4,	%i3,	%o1
	fnegs	%f4,	%f12
	movre	%g6,	%l3,	%i5
	taddcctv	%o7,	%l1,	%i6
	umul	%g3,	%i4,	%l6
	ble,a,pt	%xcc,	loop_1019
	mulx	%i0,	%o2,	%o5
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x40] %asi,	%o3
loop_1019:
	fpsub16s	%f1,	%f23,	%f19
	fmovdcc	%icc,	%f4,	%f5
	fbul	%fcc3,	loop_1020
	tleu	%xcc,	0x0
	bvs,a,pt	%xcc,	loop_1021
	popc	0x13C9,	%i2
loop_1020:
	ta	%icc,	0x6
	fmovspos	%icc,	%f2,	%f0
loop_1021:
	array8	%i7,	%l2,	%l0
	edge8	%l4,	%g7,	%l5
	bpos,a,pt	%icc,	loop_1022
	movvs	%icc,	%g4,	%i1
	tl	%xcc,	0x3
	fzeros	%f22
loop_1022:
	bcc,pn	%xcc,	loop_1023
	tn	%icc,	0x6
	ldstub	[%l7 + 0x4F],	%o6
	fmovrslz	%g1,	%f26,	%f23
loop_1023:
	ldsh	[%l7 + 0x6C],	%g2
	fmovsgu	%icc,	%f2,	%f2
	sll	%g5,	%o4,	%o0
	andncc	%o1,	%i3,	%g6
	umulcc	%i5,	%o7,	%l3
	sra	%i6,	0x1B,	%l1
	set	0x46, %i6
	stha	%g3,	[%l7 + %i6] 0x19
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i4,	0x1A0D,	%i0
	bcs,a,pt	%icc,	loop_1024
	movvs	%xcc,	%o2,	%l6
	fpadd16	%f24,	%f28,	%f24
	tg	%xcc,	0x4
loop_1024:
	srax	%o5,	0x13,	%o3
	mulscc	%i7,	0x1F72,	%i2
	te	%xcc,	0x6
	bg	%xcc,	loop_1025
	bgu,a	%xcc,	loop_1026
	fmul8x16au	%f24,	%f2,	%f4
	xorcc	%l2,	0x04F9,	%l4
loop_1025:
	movrlez	%l0,	%l5,	%g7
loop_1026:
	fsrc2	%f28,	%f16
	mulscc	%i1,	%o6,	%g1
	stw	%g2,	[%l7 + 0x38]
	alignaddr	%g4,	%g5,	%o4
	edge8ln	%o0,	%i3,	%g6
	edge32	%o1,	%o7,	%i5
	fmovdle	%icc,	%f10,	%f18
	wr	%g0,	0x88,	%asi
	ldsha	[%l7 + 0x1C] %asi,	%i6
	movne	%icc,	%l1,	%g3
	tg	%icc,	0x1
	andn	%i4,	%i0,	%o2
	tvs	%xcc,	0x4
	andn	%l6,	%l3,	%o3
	fabsd	%f18,	%f22
	movrgez	%o5,	0x2A4,	%i7
	edge8l	%i2,	%l4,	%l2
	fbge,a	%fcc0,	loop_1027
	sdivcc	%l5,	0x08FC,	%g7
	taddcctv	%i1,	%o6,	%l0
	tsubcc	%g1,	0x190A,	%g4
loop_1027:
	fornot1	%f0,	%f26,	%f10
	ldsw	[%l7 + 0x10],	%g5
	edge16n	%g2,	%o4,	%i3
	movrlez	%o0,	0x033,	%g6
	tvc	%icc,	0x4
	sra	%o7,	0x1C,	%i5
	stb	%i6,	[%l7 + 0x1E]
	nop
	setx	loop_1028,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrdlez	%l1,	%f24,	%f26
	umul	%o1,	0x1A4D,	%i4
	stbar
loop_1028:
	mulscc	%g3,	%o2,	%l6
	fmovsne	%icc,	%f18,	%f14
	movre	%l3,	0x102,	%i0
	set	0x58, %o7
	prefetcha	[%l7 + %o7] 0x14,	 0x3
	or	%i7,	0x0AD7,	%o3
	tne	%xcc,	0x6
	fmovrdlez	%l4,	%f28,	%f16
	te	%xcc,	0x4
	andncc	%l2,	%i2,	%l5
	fbg,a	%fcc0,	loop_1029
	subcc	%i1,	0x15E5,	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	casa	[%l6] 0x0c,	%l0,	%g7
loop_1029:
	mulscc	%g4,	%g1,	%g5
	andcc	%o4,	%g2,	%o0
	alignaddr	%g6,	%o7,	%i5
	srax	%i6,	0x00,	%i3
	sethi	0x0C0E,	%l1
	nop
	setx loop_1030, %l0, %l1
	jmpl %l1, %i4
	tvc	%icc,	0x1
	fpack16	%f16,	%f12
	ldx	[%l7 + 0x60],	%g3
loop_1030:
	tneg	%icc,	0x5
	tvs	%xcc,	0x7
	movrlez	%o2,	%o1,	%l3
	faligndata	%f6,	%f22,	%f22
	nop
	setx	0x17CF28C5C022EC87,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xF2C3F633CFFF6A54,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f8,	%f16
	stw	%l6,	[%l7 + 0x74]
	edge16n	%i0,	%i7,	%o5
	fxor	%f8,	%f16,	%f18
	fcmpgt16	%f24,	%f12,	%l4
	tcc	%icc,	0x7
	orcc	%l2,	%i2,	%l5
	sdivx	%o3,	0x033D,	%o6
	add	%i1,	%g7,	%g4
	srlx	%g1,	%g5,	%l0
	edge16	%o4,	%g2,	%o0
	sethi	0x1573,	%g6
	tle	%xcc,	0x6
	fmul8sux16	%f26,	%f18,	%f30
	movrgez	%o7,	%i5,	%i6
	fblg,a	%fcc2,	loop_1031
	fba,a	%fcc2,	loop_1032
	ba	loop_1033
	fbge,a	%fcc3,	loop_1034
loop_1031:
	fcmpgt16	%f14,	%f0,	%l1
loop_1032:
	udivcc	%i3,	0x1BD6,	%i4
loop_1033:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1034:
	movgu	%icc,	%g3,	%o1
	nop
	fitod	%f4,	%f0
	fdtox	%f0,	%f24
	edge16	%l3,	%l6,	%o2
	add	%i7,	%i0,	%l4
	fmovdn	%xcc,	%f4,	%f8
	xnorcc	%o5,	%l2,	%i2
	edge32n	%o3,	%o6,	%l5
	fexpand	%f4,	%f18
	bvc,pn	%icc,	loop_1035
	subccc	%g7,	0x01A8,	%i1
	and	%g4,	0x0E7F,	%g1
	fornot1	%f0,	%f30,	%f18
loop_1035:
	movn	%xcc,	%l0,	%o4
	fmovse	%xcc,	%f26,	%f1
	array32	%g2,	%o0,	%g5
	nop
	setx	loop_1036,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge8n	%g6,	%i5,	%i6
	edge32n	%o7,	%l1,	%i3
	array16	%i4,	%g3,	%l3
loop_1036:
	movl	%xcc,	%o1,	%o2
	set	0x76, %o4
	ldstuba	[%l7 + %o4] 0x80,	%i7
	movge	%xcc,	%i0,	%l4
	udivcc	%l6,	0x1171,	%o5
	fble,a	%fcc3,	loop_1037
	tgu	%icc,	0x1
	edge8ln	%i2,	%l2,	%o3
	nop
	fitod	%f6,	%f28
	fdtox	%f28,	%f4
loop_1037:
	nop
	set	0x2B, %l6
	stba	%o6,	[%l7 + %l6] 0x19
	sll	%g7,	%l5,	%i1
	edge16n	%g1,	%l0,	%g4
	udivx	%o4,	0x15E8,	%g2
	and	%o0,	%g5,	%i5
	srl	%i6,	0x15,	%o7
	movvs	%xcc,	%l1,	%g6
	fmovsa	%icc,	%f16,	%f5
	nop
	setx	0x9372863B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0x5E97BC50,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f16,	%f19
	srl	%i3,	%g3,	%i4
	fmovsge	%xcc,	%f11,	%f30
	bneg,a,pt	%xcc,	loop_1038
	edge8l	%o1,	%o2,	%l3
	bleu,a,pn	%xcc,	loop_1039
	fone	%f28
loop_1038:
	fmovdleu	%icc,	%f12,	%f15
	fsrc2s	%f11,	%f18
loop_1039:
	mova	%icc,	%i7,	%l4
	addccc	%l6,	0x018A,	%i0
	fcmpgt16	%f22,	%f8,	%o5
	bvc	loop_1040
	tcc	%xcc,	0x7
	be	loop_1041
	sdiv	%l2,	0x184C,	%o3
loop_1040:
	umulcc	%i2,	%g7,	%o6
	array8	%i1,	%l5,	%l0
loop_1041:
	edge16	%g4,	%o4,	%g1
	set	0x17, %g3
	lduba	[%l7 + %g3] 0x81,	%o0
	movrlez	%g5,	%g2,	%i5
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x0F] %asi,	%o7
	tle	%xcc,	0x6
	umulcc	%i6,	0x0520,	%l1
	bpos,a,pt	%xcc,	loop_1042
	edge16	%i3,	%g6,	%g3
	call	loop_1043
	fones	%f21
loop_1042:
	nop
	set	0x30, %g7
	stwa	%i4,	[%l7 + %g7] 0x18
loop_1043:
	movcc	%icc,	%o2,	%l3
	movrlz	%o1,	0x0BD,	%i7
	fnegs	%f8,	%f24
	taddcctv	%l4,	%l6,	%o5
	xnorcc	%l2,	0x1130,	%o3
	sdiv	%i0,	0x01A1,	%g7
	movre	%i2,	0x15D,	%i1
	fbuge	%fcc0,	loop_1044
	movvc	%xcc,	%o6,	%l5
	ldstub	[%l7 + 0x64],	%g4
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1044:
	orn	%o4,	0x012C,	%g1
	tneg	%icc,	0x6
	movle	%xcc,	%l0,	%g5
	sllx	%o0,	0x14,	%g2
	fbul	%fcc2,	loop_1045
	nop
	setx	loop_1046,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movvs	%xcc,	%o7,	%i6
	fbg,a	%fcc3,	loop_1047
loop_1045:
	sdiv	%l1,	0x01DF,	%i3
loop_1046:
	addcc	%g6,	0x0B56,	%g3
	fbule,a	%fcc3,	loop_1048
loop_1047:
	membar	0x47
	fnands	%f17,	%f24,	%f19
	srl	%i4,	%i5,	%o2
loop_1048:
	movre	%l3,	%i7,	%o1
	mulx	%l6,	0x0F5D,	%l4
	subccc	%o5,	0x1013,	%l2
	xorcc	%o3,	%g7,	%i2
	tvs	%xcc,	0x3
	tsubcctv	%i1,	%o6,	%i0
	tgu	%icc,	0x5
	fmovda	%xcc,	%f17,	%f23
	andn	%g4,	%l5,	%o4
	membar	0x71
	nop
	setx	0x9A144ED65B50C54B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x22A372C8F1923DF6,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f22,	%f8
	brgz	%g1,	loop_1049
	brgz,a	%g5,	loop_1050
	nop
	setx	0x35081D8E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xAB9F1C59,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f25
	fmuls	%f25,	%f31,	%f2
	andn	%o0,	0x196C,	%g2
loop_1049:
	nop
	set	0x44, %l5
	swapa	[%l7 + %l5] 0x04,	%l0
loop_1050:
	addccc	%i6,	0x19FB,	%l1
	or	%i3,	0x1074,	%g6
	brlez,a	%o7,	loop_1051
	nop
	setx	0xD07B319C,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	umul	%i4,	0x1FDF,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1051:
	ldub	[%l7 + 0x6F],	%o2
	nop
	setx	0xAC4A76B64EE2CA02,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x3554807850D74A06,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f18,	%f24
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tcc	%icc,	0x7
	and	%l3,	%i7,	%o1
	edge16ln	%l6,	%g3,	%o5
	array8	%l2,	%o3,	%l4
	movneg	%icc,	%i2,	%i1
	smulcc	%g7,	%o6,	%i0
	edge32	%g4,	%l5,	%o4
	smul	%g1,	0x01AE,	%g5
	mulscc	%g2,	%l0,	%o0
	xor	%i6,	%i3,	%g6
	fbuge,a	%fcc2,	loop_1052
	fmovsle	%icc,	%f10,	%f2
	fmovrsgz	%l1,	%f12,	%f28
	tcs	%xcc,	0x0
loop_1052:
	xnorcc	%o7,	%i5,	%o2
	tvc	%xcc,	0x0
	xnor	%i4,	0x1A41,	%i7
	smulcc	%o1,	0x0F85,	%l6
	movvs	%xcc,	%g3,	%l3
	fbne,a	%fcc1,	loop_1053
	fbge,a	%fcc3,	loop_1054
	addc	%o5,	0x1368,	%o3
	movgu	%icc,	%l4,	%i2
loop_1053:
	nop
	setx	0xB9968E07,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0xFE7D36B8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f15
	fdivs	%f15,	%f4,	%f16
loop_1054:
	subcc	%i1,	0x1480,	%l2
	stbar
	fmovrsgez	%o6,	%f19,	%f12
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f15
	fnot2	%f12,	%f12
	andn	%g7,	%g4,	%l5
	fblg	%fcc3,	loop_1055
	array32	%o4,	%i0,	%g5
	subc	%g1,	0x0E14,	%l0
	fmovdpos	%icc,	%f11,	%f17
loop_1055:
	fmovrdlz	%g2,	%f18,	%f18
	umulcc	%i6,	0x051B,	%o0
	edge16ln	%i3,	%l1,	%o7
	movvs	%icc,	%g6,	%o2
	fmovsleu	%icc,	%f18,	%f29
	andn	%i4,	%i7,	%o1
	movpos	%icc,	%i5,	%g3
	edge16ln	%l3,	%o5,	%o3
	tsubcc	%l4,	0x154B,	%l6
	fbul	%fcc3,	loop_1056
	fmovdl	%xcc,	%f29,	%f7
	fbe	%fcc2,	loop_1057
	xnorcc	%i2,	%l2,	%i1
loop_1056:
	nop
	set	0x5E, %i4
	ldsha	[%l7 + %i4] 0x14,	%g7
loop_1057:
	edge8	%o6,	%l5,	%o4
	pdist	%f4,	%f14,	%f18
	addcc	%g4,	%g5,	%i0
	andncc	%g1,	%g2,	%l0
	fpsub32	%f8,	%f4,	%f24
	fbe,a	%fcc1,	loop_1058
	movn	%xcc,	%o0,	%i6
	tgu	%xcc,	0x0
	membar	0x3F
loop_1058:
	subcc	%i3,	%o7,	%l1
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	casxa	[%l6] %asi,	%o2,	%g6
	tsubcctv	%i7,	0x1B21,	%o1
	tne	%xcc,	0x6
	tcs	%xcc,	0x5
	fcmpne16	%f6,	%f14,	%i5
	fxnor	%f8,	%f22,	%f6
	sllx	%g3,	%i4,	%o5
	srax	%l3,	%l4,	%o3
	taddcctv	%i2,	%l2,	%i1
	mulx	%g7,	0x00DD,	%l6
	nop
	setx	0x70724C47,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	fmovdcs	%xcc,	%f27,	%f22
	andcc	%o6,	0x06E3,	%o4
	fmovrsgz	%l5,	%f21,	%f29
	xor	%g5,	0x071E,	%g4
	sll	%i0,	0x13,	%g1
	array32	%l0,	%g2,	%i6
	bvc,a	%xcc,	loop_1059
	fnor	%f26,	%f0,	%f8
	movpos	%xcc,	%o0,	%o7
	fnegd	%f24,	%f22
loop_1059:
	tsubcc	%l1,	%i3,	%g6
	tvs	%icc,	0x4
	ld	[%l7 + 0x30],	%f26
	nop
	setx	0x17D3B6097059E75C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldx	[%l7 + 0x28],	%fsr
	st	%f6,	[%l7 + 0x20]
	nop
	setx	0x9312171A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xABA911B7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f5,	%f15
	smul	%i7,	0x0062,	%o2
	set	0x38, %o1
	swapa	[%l7 + %o1] 0x81,	%o1
	ldsw	[%l7 + 0x30],	%i5
	edge8ln	%i4,	%g3,	%o5
	nop
	setx	0x967194ABCB99808F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f12
	movre	%l3,	0x0BD,	%o3
	fnands	%f31,	%f31,	%f6
	fmovda	%icc,	%f29,	%f22
	movcs	%icc,	%i2,	%l4
	srax	%l2,	%i1,	%l6
	fsrc2	%f30,	%f24
	edge8n	%o6,	%g7,	%l5
	edge32ln	%g5,	%o4,	%g4
	movn	%xcc,	%g1,	%l0
	nop
	setx	0x26AC8E07C072D21B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	sdivx	%g2,	0x157F,	%i0
	movgu	%xcc,	%i6,	%o7
	sdiv	%o0,	0x1E3D,	%i3
	fmovsvc	%icc,	%f2,	%f19
	set	0x70, %i0
	ldda	[%l7 + %i0] 0x2f,	%l0
	fmovspos	%icc,	%f22,	%f26
	fble,a	%fcc2,	loop_1060
	tle	%icc,	0x2
	bg,a,pt	%xcc,	loop_1061
	nop
	fitos	%f0,	%f30
	fstoi	%f30,	%f2
loop_1060:
	tgu	%icc,	0x2
	bvs,a,pt	%xcc,	loop_1062
loop_1061:
	tcs	%xcc,	0x0
	te	%icc,	0x3
	taddcctv	%g6,	%o2,	%o1
loop_1062:
	ta	%icc,	0x0
	fmovsvs	%icc,	%f8,	%f27
	bn,pt	%xcc,	loop_1063
	sdiv	%i5,	0x03DE,	%i7
	movcs	%icc,	%i4,	%o5
	edge32	%g3,	%l3,	%i2
loop_1063:
	for	%f14,	%f18,	%f12
	subccc	%o3,	%l2,	%l4
	and	%l6,	%i1,	%g7
	fbul	%fcc0,	loop_1064
	fandnot2s	%f29,	%f21,	%f31
	edge32n	%l5,	%o6,	%o4
	fsrc2s	%f0,	%f12
loop_1064:
	fmovrsne	%g5,	%f20,	%f25
	fsrc1	%f0,	%f26
	movrlez	%g4,	0x02F,	%l0
	array16	%g2,	%i0,	%i6
	tn	%xcc,	0x0
	fpmerge	%f11,	%f20,	%f14
	umul	%o7,	0x0283,	%g1
	edge8n	%o0,	%l1,	%i3
	movrlz	%g6,	0x14A,	%o2
	fzero	%f12
	bcc,pn	%icc,	loop_1065
	fbul,a	%fcc1,	loop_1066
	udivx	%i5,	0x0A7D,	%o1
	set	0x10, %l2
	stwa	%i4,	[%l7 + %l2] 0x22
	membar	#Sync
loop_1065:
	movpos	%xcc,	%i7,	%g3
loop_1066:
	brz	%o5,	loop_1067
	tvc	%icc,	0x1
	sdivcc	%i2,	0x1BA6,	%o3
	taddcctv	%l2,	%l4,	%l6
loop_1067:
	tne	%xcc,	0x2
	srlx	%l3,	0x18,	%g7
	bleu	loop_1068
	movgu	%xcc,	%i1,	%o6
	nop
	setx	0x0F3F2375,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x7CA426D9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fadds	%f31,	%f24,	%f10
	srl	%l5,	0x19,	%o4
loop_1068:
	ta	%xcc,	0x0
	fmovsn	%xcc,	%f20,	%f16
	tle	%xcc,	0x6
	fpack16	%f12,	%f28
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f16
	fxtod	%f16,	%f10
	popc	%g4,	%l0
	array32	%g5,	%i0,	%g2
	fmovdgu	%icc,	%f31,	%f21
	fpack32	%f8,	%f8,	%f18
	move	%xcc,	%o7,	%i6
	fmovscc	%xcc,	%f18,	%f19
	lduw	[%l7 + 0x48],	%o0
	mova	%xcc,	%g1,	%l1
	xor	%g6,	%o2,	%i3
	nop
	setx	loop_1069,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movvc	%xcc,	%i5,	%i4
	subc	%o1,	%g3,	%o5
	subcc	%i7,	0x1742,	%i2
loop_1069:
	fone	%f20
	fzeros	%f9
	tge	%xcc,	0x1
	ldsw	[%l7 + 0x48],	%l2
	wr	%g0,	0x04,	%asi
	lda	[%l7 + 0x30] %asi,	%f22
	movrgz	%o3,	%l4,	%l3
	or	%g7,	%l6,	%o6
	set	0x24, %i5
	lda	[%l7 + %i5] 0x15,	%f11
	fexpand	%f7,	%f24
	movrgz	%l5,	0x2B3,	%i1
	fmul8x16	%f22,	%f30,	%f12
	srlx	%o4,	0x0A,	%g4
	fabss	%f20,	%f31
	edge8n	%g5,	%i0,	%l0
	sir	0x1073
	addccc	%o7,	%g2,	%o0
	bgu	%xcc,	loop_1070
	fnand	%f12,	%f18,	%f16
	tvc	%xcc,	0x2
	bgu,pt	%icc,	loop_1071
loop_1070:
	fmovscs	%icc,	%f5,	%f4
	movg	%xcc,	%g1,	%i6
	sra	%g6,	%l1,	%i3
loop_1071:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i5,	%o2,	%i4
	bne,pt	%xcc,	loop_1072
	fmovrslz	%o1,	%f26,	%f31
	nop
	fitod	%f10,	%f26
	xor	%o5,	0x0AC1,	%i7
loop_1072:
	ldx	[%l7 + 0x10],	%g3
	set	0x0C, %i7
	sta	%f24,	[%l7 + %i7] 0x18
	taddcc	%i2,	%o3,	%l2
	fmuld8ulx16	%f20,	%f10,	%f22
	smulcc	%l4,	0x1DCA,	%g7
	srax	%l3,	0x18,	%o6
	fornot1s	%f24,	%f2,	%f31
	brnz	%l5,	loop_1073
	fpsub32s	%f3,	%f16,	%f29
	sdivx	%i1,	0x02BB,	%l6
	fmovsg	%icc,	%f28,	%f28
loop_1073:
	andn	%o4,	0x0391,	%g5
	faligndata	%f22,	%f22,	%f0
	movneg	%xcc,	%i0,	%g4
	addcc	%l0,	0x0554,	%o7
	edge16ln	%o0,	%g1,	%g2
	fbn,a	%fcc1,	loop_1074
	udivcc	%i6,	0x07E4,	%l1
	tpos	%icc,	0x4
	fpack16	%f26,	%f0
loop_1074:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g6,	%i3
	addc	%i5,	%i4,	%o2
	tsubcc	%o5,	0x1813,	%i7
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x68] %asi,	%f13
	fmovsg	%xcc,	%f22,	%f7
	swap	[%l7 + 0x74],	%o1
	sra	%g3,	0x0F,	%i2
	movl	%icc,	%o3,	%l4
	popc	0x017A,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l3,	%l2,	%l5
	ld	[%l7 + 0x18],	%f20
	orcc	%i1,	0x01F9,	%l6
	tneg	%icc,	0x5
	orcc	%o4,	%g5,	%o6
	movl	%xcc,	%g4,	%l0
	and	%i0,	0x074D,	%o0
	brgz,a	%o7,	loop_1075
	bshuffle	%f22,	%f8,	%f26
	orncc	%g2,	0x1BB7,	%i6
	tleu	%xcc,	0x4
loop_1075:
	fpack16	%f2,	%f26
	mulscc	%g1,	%g6,	%l1
	subccc	%i3,	0x0D86,	%i5
	fpadd16s	%f21,	%f14,	%f17
	pdist	%f18,	%f8,	%f26
	tvc	%icc,	0x6
	movleu	%icc,	%i4,	%o5
	prefetch	[%l7 + 0x3C],	 0x2
	movl	%icc,	%i7,	%o1
	subccc	%o2,	0x144E,	%i2
	fmovsl	%icc,	%f11,	%f21
	edge32	%o3,	%g3,	%g7
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x58] %asi,	%l3
	nop
	fitod	%f19,	%f2
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f6
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	set	0x18, %g1
	ldub	[%l7 + %g1],	%l4
	pdist	%f4,	%f22,	%f8
	srax	%l2,	%l5,	%i1
	fmovdneg	%xcc,	%f8,	%f15
	fble	%fcc2,	loop_1076
	andn	%o4,	0x0B07,	%g5
	movvs	%icc,	%l6,	%o6
	movg	%icc,	%g4,	%l0
loop_1076:
	movvs	%icc,	%o0,	%i0
	movleu	%xcc,	%g2,	%i6
	udivx	%o7,	0x10A4,	%g1
	set	0x40, %o2
	ldda	[%l7 + %o2] 0x04,	%f16
	pdist	%f4,	%f28,	%f0
	sdivcc	%l1,	0x092B,	%g6
	bcc,a,pn	%xcc,	loop_1077
	lduh	[%l7 + 0x10],	%i3
	fmovs	%f25,	%f12
	udivx	%i4,	0x0049,	%o5
loop_1077:
	fcmpeq16	%f24,	%f8,	%i5
	nop
	setx	0x88A551BEDD297398,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x2978A411170EC4D3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f14,	%f6
	set	0x72, %g6
	ldsba	[%l7 + %g6] 0x04,	%o1
	array16	%i7,	%o2,	%i2
	movn	%icc,	%g3,	%o3
	ldub	[%l7 + 0x35],	%l3
	stbar
	bne,a	loop_1078
	fmovsa	%icc,	%f17,	%f27
	fmovdl	%xcc,	%f29,	%f14
	fpack16	%f20,	%f15
loop_1078:
	addcc	%g7,	0x0B6F,	%l2
	tvs	%xcc,	0x0
	movn	%icc,	%l5,	%i1
	movcs	%xcc,	%l4,	%o4
	fmovsvs	%xcc,	%f26,	%f15
	tgu	%xcc,	0x1
	tneg	%xcc,	0x3
	bvc,pn	%icc,	loop_1079
	lduh	[%l7 + 0x58],	%l6
	movrne	%o6,	%g4,	%l0
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%g5
loop_1079:
	fpsub32s	%f21,	%f21,	%f13
	be,a	loop_1080
	xorcc	%g2,	%i0,	%i6
	fmovrse	%o7,	%f7,	%f16
	fornot1s	%f17,	%f26,	%f28
loop_1080:
	sir	0x1B6A
	wr	%g0,	0x2b,	%asi
	stba	%g1,	[%l7 + 0x3B] %asi
	membar	#Sync
	fbug	%fcc2,	loop_1081
	fmovsn	%xcc,	%f28,	%f10
	fnot1s	%f17,	%f7
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1081:
	movge	%icc,	%l1,	%g6
	nop
	set	0x2C, %o6
	ldstub	[%l7 + %o6],	%i3
	xnorcc	%o5,	%i4,	%i5
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	add	%l7,	0x40,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o1
	casa	[%l6] 0x89,	%o1,	%i7
	orn	%o2,	0x0122,	%g3
	tvs	%xcc,	0x5
	fmovscc	%icc,	%f26,	%f12
	add	%o3,	0x0C4A,	%i2
	fpackfix	%f22,	%f22
	movgu	%xcc,	%g7,	%l2
	membar	0x26
	ldsb	[%l7 + 0x67],	%l3
	move	%icc,	%l5,	%l4
	fcmple16	%f28,	%f10,	%o4
	movn	%icc,	%l6,	%o6
	fmovs	%f17,	%f30
	wr	%g0,	0x0c,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i1
	edge8l	%g4,	%o0,	%g5
	brnz,a	%l0,	loop_1082
	tvc	%icc,	0x1
	xnorcc	%g2,	0x08CE,	%i6
	bneg,a	%icc,	loop_1083
loop_1082:
	fmovs	%f27,	%f11
	ld	[%l7 + 0x58],	%f24
	movge	%xcc,	%i0,	%g1
loop_1083:
	movrgez	%l1,	%g6,	%i3
	tg	%xcc,	0x6
	tne	%xcc,	0x4
	set	0x4F, %i1
	lduba	[%l7 + %i1] 0x80,	%o7
	edge16l	%i4,	%i5,	%o5
	brnz	%o1,	loop_1084
	tvc	%icc,	0x0
	sethi	0x0925,	%i7
	sth	%g3,	[%l7 + 0x10]
loop_1084:
	fmul8x16au	%f23,	%f25,	%f18
	edge16n	%o2,	%i2,	%o3
	taddcc	%g7,	0x0810,	%l3
	xnorcc	%l5,	0x1028,	%l2
	edge32	%l4,	%l6,	%o6
	addc	%i1,	0x0291,	%g4
	srl	%o4,	%g5,	%l0
	srl	%o0,	%i6,	%i0
	edge32	%g1,	%g2,	%g6
	edge32ln	%i3,	%l1,	%o7
	umul	%i4,	0x103E,	%i5
	tsubcc	%o1,	%i7,	%o5
	fmovdge	%xcc,	%f0,	%f7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcc	%g3,	0x1296,	%i2
	xorcc	%o3,	0x0801,	%g7
	tsubcc	%o2,	%l3,	%l2
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	addcc	%l4,	0x0C3E,	%l5
	orncc	%l6,	%i1,	%g4
	tcc	%icc,	0x7
	edge8l	%o6,	%g5,	%o4
	tsubcctv	%o0,	0x16E8,	%i6
	fmovspos	%xcc,	%f5,	%f11
	umul	%i0,	0x0DF6,	%l0
	fbue	%fcc0,	loop_1085
	movle	%xcc,	%g2,	%g6
	nop
	fitod	%f2,	%f16
	fdtox	%f16,	%f12
	fxtod	%f12,	%f8
	edge16	%g1,	%l1,	%i3
loop_1085:
	movne	%icc,	%i4,	%i5
	mulx	%o7,	%i7,	%o1
	fmovsn	%icc,	%f5,	%f0
	movl	%xcc,	%g3,	%o5
	fzeros	%f30
	nop
	setx loop_1086, %l0, %l1
	jmpl %l1, %i2
	movrne	%o3,	%o2,	%g7
	bcc,a	%icc,	loop_1087
	sll	%l3,	%l2,	%l5
loop_1086:
	tge	%xcc,	0x5
	and	%l4,	%i1,	%g4
loop_1087:
	nop
	wr	%g0,	0x10,	%asi
	stha	%o6,	[%l7 + 0x78] %asi
	sllx	%l6,	0x0E,	%g5
	movpos	%icc,	%o4,	%o0
	bl,a,pt	%xcc,	loop_1088
	fpsub32	%f16,	%f8,	%f20
	fbug,a	%fcc0,	loop_1089
	sir	0x07CB
loop_1088:
	edge32n	%i0,	%i6,	%l0
	bn,a	%icc,	loop_1090
loop_1089:
	std	%f8,	[%l7 + 0x18]
	array8	%g6,	%g2,	%g1
	fnands	%f30,	%f20,	%f30
loop_1090:
	tpos	%xcc,	0x5
	movcs	%xcc,	%i3,	%i4
	nop
	setx	0xAD23ACBE60D27E25,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB1A99F29BC01D4A3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f4,	%f30
	sdivx	%i5,	0x122C,	%l1
	fcmpgt32	%f18,	%f0,	%o7
	fandnot2s	%f15,	%f6,	%f15
	tge	%icc,	0x3
	movg	%icc,	%o1,	%g3
	fmovdle	%xcc,	%f7,	%f10
	edge32n	%i7,	%i2,	%o5
	sdivx	%o3,	0x067D,	%o2
	fmovs	%f26,	%f25
	fbge	%fcc2,	loop_1091
	movrne	%g7,	0x3CD,	%l2
	tg	%icc,	0x7
	move	%icc,	%l5,	%l4
loop_1091:
	flush	%l7 + 0x54
	nop
	fitos	%f12,	%f9
	fstox	%f9,	%f28
	fxtos	%f28,	%f31
	movl	%xcc,	%l3,	%g4
	tg	%icc,	0x2
	sdivcc	%o6,	0x0463,	%i1
	tl	%icc,	0x0
	xorcc	%g5,	0x14A4,	%o4
	movn	%icc,	%l6,	%i0
	movcs	%icc,	%i6,	%o0
	movpos	%icc,	%l0,	%g2
	srax	%g6,	%g1,	%i3
	tsubcctv	%i4,	0x19FF,	%l1
	orn	%o7,	0x168C,	%i5
	fmovdgu	%xcc,	%f29,	%f31
	subc	%o1,	%i7,	%g3
	bl,a	loop_1092
	fmovscc	%xcc,	%f16,	%f3
	fandnot1	%f30,	%f18,	%f14
	fmovsn	%xcc,	%f13,	%f14
loop_1092:
	fbne,a	%fcc2,	loop_1093
	tge	%xcc,	0x6
	bgu	%icc,	loop_1094
	mulscc	%o5,	%o3,	%o2
loop_1093:
	nop
	set	0x51, %i3
	ldsb	[%l7 + %i3],	%g7
	sdiv	%i2,	0x1362,	%l5
loop_1094:
	fble,a	%fcc1,	loop_1095
	movrlez	%l4,	%l2,	%g4
	movcs	%icc,	%o6,	%l3
	edge32n	%i1,	%g5,	%o4
loop_1095:
	brgez,a	%l6,	loop_1096
	bvs,pt	%xcc,	loop_1097
	mulscc	%i6,	0x1760,	%o0
	mulx	%l0,	%g2,	%i0
loop_1096:
	sir	0x1A80
loop_1097:
	tneg	%xcc,	0x5
	fmovdleu	%xcc,	%f18,	%f18
	movrlez	%g1,	0x1B4,	%i3
	movg	%xcc,	%g6,	%l1
	edge16n	%o7,	%i5,	%i4
	ba,a,pt	%icc,	loop_1098
	add	%i7,	%g3,	%o1
	ldd	[%l7 + 0x28],	%f22
	fmovrsgez	%o3,	%f28,	%f27
loop_1098:
	nop
	wr	%g0,	0x0c,	%asi
	stba	%o5,	[%l7 + 0x09] %asi
	fcmpgt32	%f2,	%f0,	%o2
	pdist	%f12,	%f22,	%f10
	brgz,a	%g7,	loop_1099
	mova	%icc,	%i2,	%l5
	andn	%l4,	%l2,	%o6
	sll	%g4,	%l3,	%g5
loop_1099:
	bne,a	%icc,	loop_1100
	tsubcc	%i1,	0x14AD,	%o4
	stx	%l6,	[%l7 + 0x30]
	fmovdg	%icc,	%f8,	%f6
loop_1100:
	edge8l	%i6,	%o0,	%l0
	movrgz	%i0,	%g2,	%g1
	edge32	%i3,	%g6,	%l1
	tvs	%xcc,	0x6
	wr	%g0,	0x2f,	%asi
	stxa	%o7,	[%l7 + 0x38] %asi
	membar	#Sync
	movneg	%icc,	%i4,	%i7
	fmovdneg	%icc,	%f5,	%f10
	sllx	%i5,	%g3,	%o3
	edge32l	%o5,	%o2,	%g7
	movrlz	%o1,	0x338,	%l5
	subcc	%i2,	%l2,	%o6
	xorcc	%l4,	0x1361,	%g4
	nop
	fitod	%f10,	%f6
	fdtoi	%f6,	%f26
	fmovsl	%icc,	%f21,	%f5
	andcc	%g5,	0x152D,	%l3
	or	%i1,	%l6,	%o4
	tpos	%xcc,	0x5
	tsubcc	%i6,	0x09F1,	%o0
	fpackfix	%f24,	%f27
	add	%i0,	%l0,	%g2
	popc	0x0D30,	%g1
	edge8l	%g6,	%l1,	%o7
	or	%i3,	0x142D,	%i7
	array8	%i4,	%g3,	%i5
	edge8	%o5,	%o2,	%o3
	fba,a	%fcc1,	loop_1101
	mulscc	%g7,	%o1,	%i2
	movle	%icc,	%l2,	%o6
	alignaddrl	%l4,	%l5,	%g5
loop_1101:
	udivcc	%g4,	0x1C94,	%l3
	movle	%icc,	%i1,	%l6
	orn	%i6,	%o4,	%o0
	edge8ln	%l0,	%g2,	%i0
	fnands	%f12,	%f6,	%f26
	movge	%xcc,	%g1,	%l1
	addccc	%o7,	%i3,	%i7
	be,a	%icc,	loop_1102
	sth	%i4,	[%l7 + 0x70]
	fmovrslez	%g6,	%f0,	%f1
	nop
	set	0x60, %o3
	std	%f14,	[%l7 + %o3]
loop_1102:
	fnand	%f10,	%f2,	%f20
	movcc	%icc,	%i5,	%g3
	udivcc	%o2,	0x19CC,	%o5
	tcc	%icc,	0x4
	orn	%o3,	0x0096,	%o1
	tneg	%xcc,	0x1
	movl	%icc,	%g7,	%i2
	fpadd16s	%f12,	%f18,	%f0
	fmovrdlez	%o6,	%f26,	%f18
	fblg,a	%fcc3,	loop_1103
	orcc	%l2,	%l4,	%l5
	bcc,pt	%icc,	loop_1104
	or	%g4,	%l3,	%g5
loop_1103:
	ta	%icc,	0x0
	ble,pn	%icc,	loop_1105
loop_1104:
	fmovrslez	%l6,	%f10,	%f31
	andn	%i6,	0x09DF,	%i1
	subcc	%o4,	0x1E91,	%o0
loop_1105:
	te	%icc,	0x4
	andcc	%l0,	%g2,	%i0
	udivcc	%g1,	0x10DE,	%o7
	bne,a	%xcc,	loop_1106
	movre	%i3,	%l1,	%i7
	fornot1s	%f19,	%f10,	%f30
	edge16	%g6,	%i4,	%i5
loop_1106:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g3,	0x13ED,	%o2
	fxnors	%f6,	%f28,	%f5
	bgu,a	%icc,	loop_1107
	fblg	%fcc1,	loop_1108
	nop
	fitod	%f12,	%f12
	fdtox	%f12,	%f16
	fxtod	%f16,	%f28
	nop
	fitos	%f5,	%f16
	fstoi	%f16,	%f3
loop_1107:
	addcc	%o3,	0x1D6D,	%o5
loop_1108:
	tvc	%xcc,	0x1
	popc	%o1,	%i2
	edge32ln	%g7,	%o6,	%l4
	mulx	%l2,	%l5,	%l3
	edge8n	%g4,	%l6,	%g5
	umul	%i6,	%i1,	%o4
	edge8ln	%l0,	%o0,	%g2
	movre	%i0,	0x095,	%o7
	movrlz	%g1,	0x1C8,	%l1
	movge	%icc,	%i3,	%g6
	sdiv	%i7,	0x01B6,	%i5
	fmovdge	%icc,	%f5,	%f6
	edge32n	%g3,	%i4,	%o3
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x81
	nop
	setx	0xF81EC6EA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f22
	setx	0x87B0BB01,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fadds	%f9,	%f22,	%f27
	fzeros	%f6
	sdivx	%o2,	0x030B,	%o5
	edge32n	%i2,	%g7,	%o1
	fmovse	%icc,	%f5,	%f20
	fandnot1	%f0,	%f30,	%f8
	fnot2	%f28,	%f24
	stb	%o6,	[%l7 + 0x78]
	mova	%icc,	%l4,	%l2
	subc	%l3,	%g4,	%l5
	brnz	%g5,	loop_1109
	movpos	%icc,	%i6,	%i1
	andn	%l6,	%o4,	%o0
	edge8	%l0,	%g2,	%o7
loop_1109:
	sir	0x103C
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f16
	tcs	%xcc,	0x0
	nop
	setx	0x978619F744294C37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f6
	movn	%xcc,	%g1,	%i0
	sdivcc	%i3,	0x1273,	%l1
	bleu,a,pn	%icc,	loop_1110
	xor	%g6,	%i7,	%g3
	andn	%i4,	0x0E50,	%o3
	ld	[%l7 + 0x1C],	%f24
loop_1110:
	edge16l	%o2,	%i5,	%i2
	set	0x40, %g2
	stda	%f16,	[%l7 + %g2] 0x1e
	membar	#Sync
	pdist	%f8,	%f24,	%f6
	ldsb	[%l7 + 0x78],	%g7
	bcc,a,pt	%xcc,	loop_1111
	movg	%icc,	%o1,	%o5
	andncc	%o6,	%l4,	%l3
	udivcc	%l2,	0x16D3,	%g4
loop_1111:
	fbn	%fcc3,	loop_1112
	addcc	%g5,	%l5,	%i1
	movrlz	%l6,	%o4,	%o0
	ba	%icc,	loop_1113
loop_1112:
	movvs	%icc,	%l0,	%i6
	fpsub32	%f24,	%f12,	%f10
	nop
	setx	0xD06DB070,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
loop_1113:
	ba,pn	%icc,	loop_1114
	movcc	%icc,	%g2,	%g1
	movrgz	%i0,	0x272,	%o7
	subc	%i3,	%l1,	%g6
loop_1114:
	call	loop_1115
	xnor	%i7,	%i4,	%o3
	udivx	%o2,	0x04F8,	%i5
	brlez,a	%g3,	loop_1116
loop_1115:
	movrgez	%i2,	%o1,	%g7
	ld	[%l7 + 0x7C],	%f17
	taddcc	%o6,	0x0C00,	%o5
loop_1116:
	and	%l4,	%l2,	%l3
	te	%xcc,	0x7
	fornot1	%f18,	%f4,	%f2
	movn	%icc,	%g5,	%g4
	edge32n	%l5,	%i1,	%l6
	edge8n	%o4,	%o0,	%i6
	ldsw	[%l7 + 0x08],	%g2
	movrne	%l0,	0x0ED,	%i0
	fcmpeq16	%f6,	%f10,	%g1
	sll	%i3,	0x06,	%o7
	xnorcc	%g6,	%l1,	%i7
	ldsb	[%l7 + 0x31],	%i4
	tcs	%icc,	0x1
	set	0x34, %g4
	sta	%f0,	[%l7 + %g4] 0x10
	fbn,a	%fcc3,	loop_1117
	movcc	%xcc,	%o3,	%i5
	movl	%icc,	%o2,	%g3
	andncc	%i2,	%g7,	%o6
loop_1117:
	ble,pn	%icc,	loop_1118
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o5,	%l4
	movvc	%xcc,	%o1,	%l2
loop_1118:
	alignaddr	%l3,	%g5,	%g4
	tg	%xcc,	0x3
	edge32l	%l5,	%i1,	%l6
	fcmpne16	%f28,	%f16,	%o0
	sdivcc	%i6,	0x1831,	%g2
	andn	%o4,	%i0,	%g1
	sdivcc	%l0,	0x177C,	%i3
	movrne	%o7,	%g6,	%l1
	edge8n	%i4,	%i7,	%i5
	popc	0x1CA4,	%o3
	te	%icc,	0x0
	add	%o2,	0x172B,	%g3
	sra	%g7,	%o6,	%i2
	nop
	setx	loop_1119,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdn	%xcc,	%f29,	%f18
	fmovsleu	%icc,	%f26,	%f22
	fbge	%fcc2,	loop_1120
loop_1119:
	tne	%icc,	0x6
	movrlz	%l4,	0x3DD,	%o5
	call	loop_1121
loop_1120:
	movrlez	%o1,	0x260,	%l2
	tsubcc	%l3,	%g5,	%g4
	smul	%i1,	%l6,	%o0
loop_1121:
	nop
	set	0x48, %l0
	swapa	[%l7 + %l0] 0x0c,	%l5
	fba	%fcc3,	loop_1122
	subccc	%i6,	%g2,	%o4
	fbge	%fcc1,	loop_1123
	movne	%xcc,	%g1,	%l0
loop_1122:
	orcc	%i0,	0x033B,	%i3
	alignaddrl	%g6,	%l1,	%i4
loop_1123:
	tsubcctv	%i7,	%i5,	%o3
	movcs	%xcc,	%o7,	%g3
	edge32l	%o2,	%g7,	%o6
	movrlz	%l4,	%o5,	%o1
	fcmpgt32	%f12,	%f16,	%i2
	tl	%icc,	0x4
	fmovsl	%xcc,	%f22,	%f25
	edge16ln	%l2,	%g5,	%l3
	addc	%i1,	0x0C81,	%l6
	fmovsle	%icc,	%f23,	%f2
	fmovscs	%icc,	%f30,	%f11
	movg	%icc,	%o0,	%g4
	orn	%i6,	0x167B,	%l5
	fbg,a	%fcc3,	loop_1124
	umulcc	%g2,	%g1,	%l0
	nop
	fitos	%f13,	%f8
	fstoi	%f8,	%f8
	wr	%g0,	0x81,	%asi
	ldsba	[%l7 + 0x43] %asi,	%o4
loop_1124:
	bg,pn	%xcc,	loop_1125
	movle	%icc,	%i0,	%g6
	fmovrdgz	%l1,	%f4,	%f22
	move	%xcc,	%i4,	%i7
loop_1125:
	st	%f4,	[%l7 + 0x2C]
	addccc	%i3,	%o3,	%i5
	movge	%icc,	%o7,	%g3
	udivcc	%g7,	0x170B,	%o6
	sir	0x1279
	fmovsl	%icc,	%f10,	%f18
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bvs,a	loop_1126
	fxnor	%f28,	%f30,	%f16
	movne	%xcc,	%o2,	%o5
	udivcc	%l4,	0x1F76,	%i2
loop_1126:
	sdiv	%l2,	0x144C,	%g5
	set	0x20, %l3
	stxa	%o1,	[%l7 + %l3] 0xe3
	membar	#Sync
	udivcc	%i1,	0x061E,	%l6
	bleu,pn	%icc,	loop_1127
	nop
	fitod	%f12,	%f28
	fdtoi	%f28,	%f18
	movrlz	%l3,	0x053,	%o0
	fbul	%fcc2,	loop_1128
loop_1127:
	fmovsle	%xcc,	%f21,	%f17
	stx	%i6,	[%l7 + 0x70]
	xorcc	%l5,	0x074F,	%g4
loop_1128:
	nop
	setx	loop_1129,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0x40623C05,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	edge16n	%g1,	%l0,	%g2
	udivcc	%o4,	0x02A6,	%i0
loop_1129:
	tleu	%xcc,	0x1
	fmovdpos	%icc,	%f14,	%f6
	mulx	%l1,	%i4,	%g6
	tgu	%icc,	0x7
	fmovse	%xcc,	%f14,	%f18
	fpsub16	%f22,	%f12,	%f2
	tsubcctv	%i7,	0x1CA3,	%i3
	brnz,a	%i5,	loop_1130
	ldsb	[%l7 + 0x47],	%o7
	tgu	%xcc,	0x0
	fmovsn	%xcc,	%f14,	%f27
loop_1130:
	fcmpne32	%f10,	%f18,	%o3
	movrlez	%g7,	%o6,	%o2
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f24
	srl	%o5,	0x1E,	%g3
	ble,a,pn	%icc,	loop_1131
	fbe	%fcc3,	loop_1132
	movvc	%xcc,	%i2,	%l2
	fcmple32	%f14,	%f30,	%l4
loop_1131:
	srlx	%g5,	0x15,	%i1
loop_1132:
	nop
	wr	%g0,	0x10,	%asi
	sta	%f23,	[%l7 + 0x64] %asi
	fmul8x16au	%f1,	%f27,	%f20
	udivx	%l6,	0x0A10,	%l3
	tn	%xcc,	0x5
	orncc	%o0,	0x134A,	%o1
	std	%f0,	[%l7 + 0x50]
	set	0x21, %o0
	stba	%i6,	[%l7 + %o0] 0x2b
	membar	#Sync
	edge16ln	%g4,	%l5,	%g1
	orcc	%g2,	%l0,	%i0
	array32	%o4,	%i4,	%l1
	fmovdpos	%xcc,	%f4,	%f23
	movcc	%xcc,	%i7,	%g6
	andn	%i3,	0x1C36,	%i5
	ldstub	[%l7 + 0x3A],	%o3
	sllx	%o7,	%o6,	%o2
	array16	%g7,	%o5,	%g3
	fmovscc	%icc,	%f29,	%f21
	andcc	%i2,	0x06D3,	%l2
	fmovdvc	%icc,	%f7,	%f21
	set	0x42, %i2
	ldstuba	[%l7 + %i2] 0x10,	%l4
	std	%f10,	[%l7 + 0x40]
	tgu	%icc,	0x3
	nop
	set	0x4E, %l1
	sth	%g5,	[%l7 + %l1]
	sllx	%i1,	0x03,	%l3
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x3
	swap	[%l7 + 0x58],	%l6
	bshuffle	%f14,	%f20,	%f28
	srax	%i6,	0x04,	%o1
	movne	%xcc,	%g4,	%l5
	sub	%g1,	%l0,	%g2
	movg	%xcc,	%i0,	%i4
	bshuffle	%f30,	%f14,	%f10
	srl	%o4,	0x0D,	%i7
	xor	%l1,	0x07EF,	%g6
	edge32	%i5,	%i3,	%o3
	set	0x2B, %i6
	ldsba	[%l7 + %i6] 0x89,	%o6
	sub	%o7,	%o2,	%o5
	xorcc	%g7,	%g3,	%l2
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x28] %asi,	%l4
	set	0x20, %o7
	ldswa	[%l7 + %o7] 0x10,	%g5
	movcs	%icc,	%i2,	%l3
	edge32ln	%i1,	%o0,	%l6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%o1
	casxa	[%l6] %asi,	%o1,	%i6
	nop
	setx	0xE067217D,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
	tge	%xcc,	0x0
	lduw	[%l7 + 0x18],	%l5
	fcmpeq32	%f24,	%f8,	%g1
	fbule,a	%fcc1,	loop_1133
	fmovdge	%icc,	%f16,	%f23
	tg	%xcc,	0x7
	xor	%l0,	%g2,	%g4
loop_1133:
	movcs	%xcc,	%i4,	%o4
	fpack16	%f18,	%f11
	tneg	%icc,	0x6
	sth	%i0,	[%l7 + 0x0A]
	addc	%i7,	%g6,	%l1
	fblg,a	%fcc2,	loop_1134
	nop
	setx	0xD943198CB12D2CD0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xB795227877DEA74F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f12,	%f24
	edge32ln	%i5,	%i3,	%o6
	brnz,a	%o7,	loop_1135
loop_1134:
	alignaddr	%o2,	%o5,	%o3
	ldsw	[%l7 + 0x38],	%g3
	brlez,a	%g7,	loop_1136
loop_1135:
	taddcctv	%l2,	0x17E9,	%l4
	subcc	%i2,	%l3,	%i1
	tle	%xcc,	0x1
loop_1136:
	for	%f24,	%f26,	%f20
	array8	%o0,	%g5,	%l6
	movvc	%xcc,	%o1,	%l5
	movn	%xcc,	%g1,	%i6
	xor	%l0,	%g2,	%g4
	tn	%icc,	0x4
	subcc	%o4,	%i0,	%i4
	fcmpne32	%f20,	%f0,	%i7
	taddcc	%g6,	%i5,	%i3
	brlez	%l1,	loop_1137
	sra	%o6,	%o7,	%o5
	fmovsneg	%icc,	%f11,	%f1
	edge16n	%o2,	%o3,	%g7
loop_1137:
	nop
	wr	%g0,	0x88,	%asi
	ldxa	[%l7 + 0x78] %asi,	%l2
	edge32l	%g3,	%l4,	%l3
	movgu	%xcc,	%i1,	%o0
	tg	%xcc,	0x4
	xnor	%g5,	%l6,	%i2
	fxors	%f27,	%f28,	%f21
	fmuld8sux16	%f10,	%f9,	%f10
	sdiv	%l5,	0x0E31,	%o1
	fornot1s	%f21,	%f16,	%f9
	ldsw	[%l7 + 0x58],	%g1
	edge16n	%l0,	%i6,	%g2
	tsubcc	%g4,	%o4,	%i4
	tcc	%icc,	0x6
	bneg,pn	%xcc,	loop_1138
	movcc	%xcc,	%i7,	%g6
	wr	%g0,	0xf0,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1138:
	addccc	%i5,	%i3,	%i0
	tn	%icc,	0x0
	call	loop_1139
	ldx	[%l7 + 0x18],	%o6
	edge32ln	%o7,	%l1,	%o5
	movleu	%xcc,	%o3,	%g7
loop_1139:
	fnand	%f2,	%f6,	%f10
	swap	[%l7 + 0x68],	%l2
	ba,a	loop_1140
	edge32	%g3,	%o2,	%l3
	movne	%xcc,	%i1,	%l4
	orn	%o0,	0x168C,	%l6
loop_1140:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbul	%fcc3,	loop_1141
	smul	%g5,	0x0452,	%l5
	brlz,a	%i2,	loop_1142
	ta	%xcc,	0x3
loop_1141:
	brnz,a	%g1,	loop_1143
	fpadd16s	%f14,	%f10,	%f27
loop_1142:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs	%icc,	loop_1144
loop_1143:
	fmovrdgz	%o1,	%f16,	%f18
	nop
	fitos	%f5,	%f17
	fstox	%f17,	%f6
	fxtos	%f6,	%f10
	fba,a	%fcc1,	loop_1145
loop_1144:
	pdist	%f8,	%f4,	%f18
	brz	%i6,	loop_1146
	edge32l	%l0,	%g2,	%g4
loop_1145:
	orn	%o4,	0x1335,	%i4
	set	0x64, %o5
	ldstuba	[%l7 + %o5] 0x80,	%g6
loop_1146:
	movge	%xcc,	%i5,	%i3
	fmovs	%f7,	%f30
	move	%icc,	%i7,	%i0
	sub	%o6,	%o7,	%o5
	movge	%xcc,	%o3,	%l1
	wr	%g0,	0x81,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	stb	%g7,	[%l7 + 0x31]
	fmovrdlz	%g3,	%f22,	%f20
	movl	%icc,	%o2,	%l2
	set	0x40, %l6
	ldda	[%l7 + %l6] 0x19,	%f0
	std	%f20,	[%l7 + 0x40]
	fbule,a	%fcc0,	loop_1147
	xorcc	%l3,	%i1,	%l4
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casa	[%l6] 0x89,	%l6,	%g5
loop_1147:
	alignaddrl	%o0,	%i2,	%g1
	fpackfix	%f26,	%f31
	sdiv	%o1,	0x0867,	%l5
	edge16	%l0,	%g2,	%g4
	bcc,pt	%xcc,	loop_1148
	membar	0x6D
	mova	%icc,	%o4,	%i4
	umulcc	%i6,	0x174C,	%g6
loop_1148:
	movleu	%xcc,	%i3,	%i7
	orncc	%i0,	0x07A2,	%o6
	bneg	%icc,	loop_1149
	move	%xcc,	%o7,	%i5
	movrgez	%o5,	%o3,	%l1
	bneg,pt	%icc,	loop_1150
loop_1149:
	edge16l	%g7,	%g3,	%l2
	movle	%icc,	%o2,	%l3
	andncc	%l4,	%i1,	%g5
loop_1150:
	edge8n	%o0,	%l6,	%i2
	tl	%xcc,	0x4
	edge8l	%g1,	%o1,	%l0
	movpos	%icc,	%g2,	%l5
	nop
	fitos	%f2,	%f5
	fstox	%f5,	%f8
	nop
	fitod	%f6,	%f14
	fdtox	%f14,	%f22
	sll	%g4,	%o4,	%i6
	movcc	%icc,	%i4,	%g6
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x19
	sub	%i7,	%i3,	%o6
	std	%f24,	[%l7 + 0x20]
	fbl,a	%fcc0,	loop_1151
	ldx	[%l7 + 0x58],	%o7
	fxors	%f22,	%f18,	%f4
	subcc	%i5,	%i0,	%o3
loop_1151:
	bvc	%xcc,	loop_1152
	or	%l1,	%g7,	%g3
	subccc	%l2,	%o5,	%o2
	fbl	%fcc0,	loop_1153
loop_1152:
	lduh	[%l7 + 0x12],	%l3
	fble	%fcc3,	loop_1154
	taddcc	%l4,	%i1,	%g5
loop_1153:
	nop
	set	0x70, %g7
	ldd	[%l7 + %g7],	%f24
	movpos	%icc,	%o0,	%l6
loop_1154:
	movvc	%xcc,	%i2,	%g1
	addcc	%o1,	%g2,	%l5
	alignaddrl	%l0,	%o4,	%i6
	fmovsle	%icc,	%f6,	%f9
	set	0x78, %l5
	ldxa	[%l7 + %l5] 0x81,	%i4
	tvc	%icc,	0x1
	tneg	%xcc,	0x4
	taddcc	%g6,	0x00B2,	%g4
	fmovdneg	%icc,	%f31,	%f10
	array32	%i3,	%i7,	%o7
	fsrc2s	%f2,	%f21
	sdiv	%o6,	0x14DC,	%i5
	fpsub32s	%f10,	%f4,	%f16
	fmul8x16	%f15,	%f28,	%f0
	fmovse	%xcc,	%f0,	%f8
	tneg	%icc,	0x7
	ldsw	[%l7 + 0x64],	%o3
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x48] %asi,	%l1
	set	0x24, %i4
	lda	[%l7 + %i4] 0x10,	%f5
	fmovsge	%xcc,	%f5,	%f30
	wr	%g0,	0x80,	%asi
	stxa	%i0,	[%l7 + 0x30] %asi
	brgz,a	%g3,	loop_1155
	nop
	fitos	%f4,	%f29
	fstox	%f29,	%f18
	fxtos	%f18,	%f24
	movleu	%xcc,	%g7,	%o5
	xor	%o2,	%l2,	%l4
loop_1155:
	nop
	setx	loop_1156,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	srl	%i1,	0x19,	%g5
	fbug,a	%fcc1,	loop_1157
	brlz	%o0,	loop_1158
loop_1156:
	mulscc	%l3,	0x1F8F,	%i2
	fmovsl	%icc,	%f6,	%f1
loop_1157:
	edge16n	%g1,	%o1,	%l6
loop_1158:
	xnor	%g2,	%l5,	%l0
	edge16	%o4,	%i6,	%g6
	movge	%xcc,	%g4,	%i3
	set	0x1C, %o4
	lda	[%l7 + %o4] 0x14,	%f29
	tne	%xcc,	0x6
	ba,a	%icc,	loop_1159
	andncc	%i7,	%i4,	%o7
	mulx	%i5,	0x1AE1,	%o3
	tle	%xcc,	0x1
loop_1159:
	bg,a	loop_1160
	movne	%icc,	%l1,	%o6
	bvs	%xcc,	loop_1161
	tn	%icc,	0x5
loop_1160:
	fble,a	%fcc3,	loop_1162
	edge32l	%i0,	%g7,	%o5
loop_1161:
	mulscc	%g3,	%o2,	%l4
	ldd	[%l7 + 0x58],	%i0
loop_1162:
	fandnot1	%f4,	%f20,	%f20
	addcc	%l2,	%g5,	%o0
	membar	#Sync
	wr	%g0,	0xf1,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	fitos	%f2,	%f25
	fstox	%f25,	%f24
	brz	%i2,	loop_1163
	fmovdpos	%icc,	%f2,	%f11
	movrgz	%l3,	%o1,	%l6
	movrne	%g2,	0x266,	%g1
loop_1163:
	edge16l	%l0,	%o4,	%l5
	and	%g6,	0x1A7F,	%g4
	udiv	%i3,	0x1274,	%i7
	tn	%icc,	0x4
	tle	%icc,	0x5
	set	0x50, %i0
	prefetcha	[%l7 + %i0] 0x04,	 0x0
	set	0x78, %o1
	ldswa	[%l7 + %o1] 0x89,	%i4
	smulcc	%o7,	0x0558,	%o3
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x30] %asi,	%i5
	tvs	%icc,	0x2
	faligndata	%f16,	%f0,	%f0
	addccc	%o6,	0x0C1D,	%i0
	edge32	%l1,	%g7,	%o5
	edge8l	%o2,	%l4,	%i1
	umulcc	%l2,	%g5,	%g3
	fmovscs	%icc,	%f28,	%f3
	fones	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i2,	0x080A,	%o0
	tneg	%xcc,	0x3
	fmovscs	%xcc,	%f14,	%f18
	taddcctv	%o1,	0x101F,	%l3
	nop
	fitos	%f0,	%f9
	fstoi	%f9,	%f21
	edge32n	%l6,	%g1,	%l0
	bl,a,pt	%xcc,	loop_1164
	fone	%f18
	sllx	%g2,	0x1C,	%l5
	subccc	%g6,	%o4,	%g4
loop_1164:
	fcmple32	%f24,	%f14,	%i7
	fmovsg	%icc,	%f8,	%f29
	edge16ln	%i3,	%i6,	%i4
	edge32	%o7,	%i5,	%o6
	faligndata	%f4,	%f30,	%f6
	fmul8x16	%f8,	%f0,	%f10
	fmovsleu	%xcc,	%f6,	%f24
	mulscc	%o3,	0x100B,	%l1
	nop
	set	0x5F, %l2
	ldub	[%l7 + %l2],	%g7
	movvc	%xcc,	%i0,	%o2
	fbuge	%fcc3,	loop_1165
	movre	%o5,	%i1,	%l2
	set	0x1C, %i7
	sta	%f10,	[%l7 + %i7] 0x19
loop_1165:
	membar	0x43
	nop
	fitos	%f13,	%f30
	fstox	%f30,	%f16
	sra	%l4,	0x1D,	%g3
	addccc	%g5,	%i2,	%o1
	fblg	%fcc2,	loop_1166
	movgu	%xcc,	%o0,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l7 + 0x2C] %asi,	%f14
loop_1166:
	movne	%xcc,	%g1,	%l0
	sdivx	%l3,	0x01E4,	%g2
	bn,a	%xcc,	loop_1167
	bl,a	loop_1168
	sub	%l5,	0x1258,	%o4
	tsubcctv	%g4,	0x070B,	%i7
loop_1167:
	sethi	0x13A9,	%i3
loop_1168:
	bleu,a,pn	%xcc,	loop_1169
	movgu	%icc,	%g6,	%i6
	fble	%fcc0,	loop_1170
	movrne	%o7,	0x1AF,	%i5
loop_1169:
	mova	%icc,	%i4,	%o6
	bl,a,pt	%xcc,	loop_1171
loop_1170:
	movrgz	%o3,	%g7,	%i0
	sdivx	%l1,	0x0F24,	%o2
	tcc	%icc,	0x1
loop_1171:
	tsubcc	%i1,	%l2,	%l4
	fbuge	%fcc0,	loop_1172
	fmovdne	%icc,	%f7,	%f4
	fbe	%fcc0,	loop_1173
	array32	%o5,	%g3,	%i2
loop_1172:
	smulcc	%o1,	0x1554,	%o0
	andn	%l6,	0x0C25,	%g1
loop_1173:
	nop
	set	0x34, %g1
	ldstuba	[%l7 + %g1] 0x19,	%g5
	movvc	%icc,	%l3,	%l0
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x30] %asi,	%g2
	sethi	0x1558,	%l5
	subccc	%g4,	%i7,	%o4
	addcc	%g6,	0x0913,	%i3
	movrlz	%i6,	%i5,	%o7
	ta	%icc,	0x7
	wr	%g0,	0xea,	%asi
	stba	%o6,	[%l7 + 0x4B] %asi
	membar	#Sync
	brlez,a	%i4,	loop_1174
	tgu	%xcc,	0x2
	tleu	%icc,	0x5
	movrlz	%g7,	%o3,	%l1
loop_1174:
	tg	%xcc,	0x6
	subccc	%i0,	0x1084,	%i1
	movl	%xcc,	%o2,	%l2
	fxnor	%f16,	%f30,	%f26
	ldsb	[%l7 + 0x42],	%o5
	nop
	set	0x22, %o2
	lduh	[%l7 + %o2],	%l4
	move	%icc,	%g3,	%i2
	wr	%g0,	0x22,	%asi
	ldda	[%l7 + 0x60] %asi,	%o0
	brnz,a	%o0,	loop_1175
	edge32ln	%g1,	%l6,	%l3
	tn	%icc,	0x1
	fnegd	%f22,	%f6
loop_1175:
	addc	%g5,	0x1EE0,	%l0
	tpos	%xcc,	0x7
	nop
	setx	loop_1176,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fsrc2s	%f6,	%f7
	fxor	%f26,	%f0,	%f22
	orncc	%l5,	0x1B5A,	%g2
loop_1176:
	smulcc	%g4,	0x1540,	%i7
	sllx	%o4,	0x04,	%g6
	nop
	setx loop_1177, %l0, %l1
	jmpl %l1, %i6
	udivcc	%i3,	0x0851,	%o7
	set	0x48, %g6
	prefetcha	[%l7 + %g6] 0x81,	 0x2
loop_1177:
	umul	%i4,	%g7,	%o3
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x70] %asi,	%o6
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x40] %asi,	%l1
	movneg	%icc,	%i0,	%o2
	subcc	%i1,	0x13DD,	%o5
	add	%l2,	0x1A09,	%l4
	fcmpne16	%f24,	%f22,	%g3
	tneg	%xcc,	0x2
	subcc	%o1,	%o0,	%i2
	edge16n	%l6,	%g1,	%g5
	popc	%l0,	%l5
	movvc	%icc,	%g2,	%l3
	bne,pt	%icc,	loop_1178
	fnot1	%f26,	%f2
	fpack32	%f26,	%f28,	%f4
	fmovsn	%xcc,	%f18,	%f9
loop_1178:
	nop
	setx	0x8438850E1058BDFE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	alignaddr	%i7,	%g4,	%o4
	stw	%g6,	[%l7 + 0x1C]
	orncc	%i3,	%o7,	%i5
	fmovrdlz	%i6,	%f16,	%f16
	fandnot2s	%f7,	%f8,	%f7
	subccc	%i4,	%g7,	%o3
	tcs	%icc,	0x2
	brlz,a	%l1,	loop_1179
	addccc	%i0,	0x1966,	%o2
	edge16n	%i1,	%o6,	%l2
	ta	%xcc,	0x7
loop_1179:
	fones	%f22
	bgu	loop_1180
	sra	%o5,	0x05,	%l4
	edge16l	%g3,	%o0,	%o1
	movvs	%icc,	%i2,	%l6
loop_1180:
	edge8	%g1,	%g5,	%l5
	bcs,a,pn	%icc,	loop_1181
	movrlez	%g2,	%l3,	%i7
	tle	%xcc,	0x0
	sir	0x14D0
loop_1181:
	ta	%icc,	0x6
	stw	%l0,	[%l7 + 0x64]
	lduh	[%l7 + 0x3E],	%g4
	be,pn	%xcc,	loop_1182
	srax	%o4,	%i3,	%o7
	umul	%i5,	%g6,	%i4
	fpadd32s	%f21,	%f23,	%f23
loop_1182:
	edge16n	%g7,	%o3,	%l1
	addccc	%i0,	%i6,	%i1
	mulscc	%o2,	0x191E,	%o6
	edge32l	%l2,	%l4,	%g3
	tneg	%icc,	0x0
	or	%o5,	%o0,	%o1
	edge32ln	%i2,	%g1,	%g5
	movleu	%icc,	%l6,	%g2
	udivcc	%l3,	0x11D9,	%l5
	fexpand	%f21,	%f22
	srl	%l0,	0x1F,	%g4
	nop
	set	0x60, %i5
	stx	%i7,	[%l7 + %i5]
	ldstub	[%l7 + 0x5A],	%i3
	ldd	[%l7 + 0x28],	%o6
	edge16ln	%o4,	%g6,	%i4
	alignaddrl	%g7,	%o3,	%i5
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x54] %asi,	%l1
	nop
	setx	0x70C7E38A70439E99,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	tneg	%icc,	0x2
	tsubcctv	%i0,	%i1,	%o2
	movrgez	%i6,	0x0BB,	%o6
	tpos	%xcc,	0x0
	mova	%xcc,	%l4,	%l2
	fbn	%fcc2,	loop_1183
	srl	%g3,	%o0,	%o1
	umulcc	%o5,	0x0B16,	%g1
	movg	%icc,	%i2,	%g5
loop_1183:
	stx	%l6,	[%l7 + 0x40]
	fpadd16	%f16,	%f30,	%f12
	fnand	%f26,	%f18,	%f28
	fornot2	%f28,	%f24,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%g2,	%l3
	fmovse	%xcc,	%f18,	%f12
	set	0x210, %o6
	ldxa	[%g0 + %o6] 0x52,	%l0
	addcc	%g4,	%l5,	%i7
	sub	%i3,	%o7,	%g6
	fmuld8sux16	%f10,	%f23,	%f30
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f21,	%f20
	fblg,a	%fcc2,	loop_1184
	movleu	%xcc,	%o4,	%i4
	stbar
	brlz,a	%o3,	loop_1185
loop_1184:
	fmovdvc	%icc,	%f3,	%f30
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
	sir	0x1FA8
loop_1185:
	fbule	%fcc1,	loop_1187
	taddcc	%i5,	%l1,	%i0
loop_1186:
	edge32ln	%g7,	%i1,	%o2
	edge16	%i6,	%l4,	%l2
loop_1187:
	nop
	setx	0x4AD3263A504670E7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	mulx	%g3,	0x08F8,	%o6
	edge32n	%o1,	%o0,	%o5
	fbge	%fcc1,	loop_1188
	andncc	%g1,	%i2,	%g5
	subcc	%l6,	0x114F,	%l3
	udivcc	%g2,	0x129F,	%g4
loop_1188:
	fbe	%fcc0,	loop_1189
	movleu	%icc,	%l5,	%l0
	subcc	%i7,	%o7,	%i3
	movcs	%icc,	%g6,	%o4
loop_1189:
	nop
	setx	0xF04D0A9C,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	nop
	setx	0xF244CBFF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x6F7FA4C4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f28,	%f12
	fmovs	%f12,	%f25
	fmovscc	%xcc,	%f24,	%f16
	tcc	%icc,	0x1
	fzero	%f10
	addccc	%o3,	0x140B,	%i4
	tsubcc	%i5,	%l1,	%i0
	movcs	%xcc,	%g7,	%o2
	edge8l	%i1,	%l4,	%i6
	and	%g3,	0x1C02,	%o6
	nop
	setx	0xEC6B175903914757,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xAF7DFB488FA04DF4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f22,	%f12
	stb	%l2,	[%l7 + 0x6B]
	bvc	%icc,	loop_1190
	mulx	%o0,	0x115F,	%o5
	fmovsgu	%icc,	%f10,	%f16
	bge,pn	%xcc,	loop_1191
loop_1190:
	fcmpgt16	%f20,	%f16,	%g1
	edge8	%i2,	%o1,	%g5
	fmovsvs	%xcc,	%f15,	%f29
loop_1191:
	nop
	setx	0x6B6C1333,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0x90CEC914,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f29,	%f28
	fmovsneg	%icc,	%f5,	%f10
	movrne	%l3,	%g2,	%l6
	sethi	0x07CD,	%l5
	bge,pn	%icc,	loop_1192
	brnz	%l0,	loop_1193
	add	%i7,	0x1CF7,	%o7
	movre	%g4,	%i3,	%o4
loop_1192:
	orcc	%g6,	0x15DC,	%o3
loop_1193:
	and	%i5,	0x03A5,	%i4
	nop
	set	0x68, %i3
	stw	%l1,	[%l7 + %i3]
	sll	%g7,	0x19,	%o2
	tsubcc	%i1,	%i0,	%l4
	movpos	%xcc,	%i6,	%o6
	sir	0x027B
	tleu	%icc,	0x3
	bneg,a,pn	%xcc,	loop_1194
	edge16l	%l2,	%g3,	%o0
	addc	%g1,	0x1273,	%o5
	fba,a	%fcc2,	loop_1195
loop_1194:
	sdivcc	%o1,	0x0CEE,	%g5
	tcc	%xcc,	0x7
	bshuffle	%f24,	%f26,	%f28
loop_1195:
	nop
	setx	0x4F5CFC5F30771DC5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	subccc	%i2,	0x145C,	%l3
	movge	%xcc,	%g2,	%l6
	movleu	%icc,	%l0,	%l5
	sth	%i7,	[%l7 + 0x1A]
	fmovsgu	%icc,	%f10,	%f17
	bshuffle	%f2,	%f28,	%f28
	bg,a,pn	%xcc,	loop_1196
	fmovsl	%xcc,	%f4,	%f15
	addcc	%g4,	0x1B20,	%o7
	bne,pn	%icc,	loop_1197
loop_1196:
	popc	0x0313,	%o4
	wr	%g0,	0xeb,	%asi
	stha	%i3,	[%l7 + 0x4A] %asi
	membar	#Sync
loop_1197:
	nop
	setx	0xC085C4D82545A477,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f16
	fbg	%fcc0,	loop_1198
	tvs	%xcc,	0x3
	nop
	set	0x28, %o3
	ldd	[%l7 + %o3],	%o2
	mulx	%g6,	%i4,	%i5
loop_1198:
	xor	%g7,	%o2,	%i1
	orn	%l1,	%l4,	%i6
	nop
	fitos	%f8,	%f29
	fstox	%f29,	%f12
	fxtos	%f12,	%f12
	set	0x20, %i1
	sta	%f0,	[%l7 + %i1] 0x80
	ldsw	[%l7 + 0x20],	%o6
	nop
	fitod	%f10,	%f14
	fdtox	%f14,	%f16
	edge32l	%l2,	%i0,	%g3
	fbule	%fcc1,	loop_1199
	fble,a	%fcc1,	loop_1200
	tle	%xcc,	0x4
	brgz	%o0,	loop_1201
loop_1199:
	bneg,a,pn	%icc,	loop_1202
loop_1200:
	taddcc	%o5,	%g1,	%o1
	srlx	%g5,	%l3,	%g2
loop_1201:
	edge32l	%l6,	%l0,	%l5
loop_1202:
	nop
	setx	0x68DB80EC,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0x28C3D8D1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f2,	%f21
	sdivx	%i2,	0x05A3,	%g4
	sllx	%i7,	0x03,	%o4
	addccc	%i3,	0x0369,	%o7
	add	%g6,	0x10F0,	%o3
	movle	%xcc,	%i5,	%g7
	fbue	%fcc2,	loop_1203
	movne	%xcc,	%i4,	%i1
	subcc	%l1,	0x0EF4,	%o2
	fbu	%fcc3,	loop_1204
loop_1203:
	movpos	%icc,	%l4,	%o6
	fbuge	%fcc3,	loop_1205
	tg	%icc,	0x1
loop_1204:
	brlez	%l2,	loop_1206
	addcc	%i0,	%g3,	%o0
loop_1205:
	fmuld8sux16	%f24,	%f7,	%f16
	srax	%o5,	%i6,	%o1
loop_1206:
	sra	%g5,	0x0C,	%g1
	tleu	%icc,	0x3
	sdiv	%g2,	0x1E11,	%l3
	addcc	%l6,	%l5,	%l0
	addcc	%i2,	%g4,	%o4
	fcmpgt32	%f22,	%f30,	%i7
	andn	%o7,	0x189B,	%g6
	edge8n	%o3,	%i3,	%i5
	movcs	%icc,	%g7,	%i4
	subccc	%l1,	0x0AA0,	%o2
	tvs	%xcc,	0x6
	smul	%l4,	0x004D,	%o6
	fmovsneg	%icc,	%f26,	%f5
	umul	%i1,	0x1464,	%l2
	srlx	%i0,	%o0,	%g3
	xor	%o5,	%i6,	%g5
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o1
	and	%g1,	0x0E8E,	%g2
	faligndata	%f2,	%f20,	%f0
	set	0x52, %l4
	stha	%l3,	[%l7 + %l4] 0xeb
	membar	#Sync
	wr	%g0,	0x89,	%asi
	stba	%l5,	[%l7 + 0x7C] %asi
	movrlez	%l0,	0x115,	%l6
	movcc	%icc,	%g4,	%o4
	smulcc	%i7,	%o7,	%g6
	fmovrdgez	%i2,	%f24,	%f30
	udiv	%o3,	0x0B30,	%i5
	udivcc	%i3,	0x0FA6,	%i4
	ldsb	[%l7 + 0x60],	%l1
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%o2
	movrlez	%g7,	0x033,	%l4
	ld	[%l7 + 0x18],	%f19
	set	0x58, %g5
	stwa	%o6,	[%l7 + %g5] 0x18
	movrlz	%i1,	0x331,	%l2
	bneg,a,pt	%icc,	loop_1207
	tl	%xcc,	0x3
	fmovscc	%xcc,	%f31,	%f14
	smul	%i0,	%g3,	%o5
loop_1207:
	movrne	%o0,	0x04E,	%i6
	alignaddr	%g5,	%g1,	%o1
	movrgez	%g2,	%l5,	%l3
	sir	0x1B9C
	sub	%l6,	0x1C35,	%g4
	tpos	%xcc,	0x7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x20] %asi,	%o4
	edge8l	%i7,	%o7,	%l0
	fbo	%fcc2,	loop_1208
	orncc	%i2,	0x02D5,	%g6
	xorcc	%i5,	0x18B1,	%i3
	udiv	%i4,	0x1318,	%o3
loop_1208:
	addccc	%o2,	0x1C4C,	%g7
	xnor	%l1,	0x1224,	%l4
	fmul8sux16	%f20,	%f8,	%f10
	and	%i1,	%o6,	%l2
	fmovsneg	%xcc,	%f27,	%f14
	fxnor	%f2,	%f14,	%f2
	nop
	set	0x71, %g2
	stb	%i0,	[%l7 + %g2]
	fpadd32	%f18,	%f26,	%f14
	tvs	%icc,	0x1
	movn	%xcc,	%o5,	%o0
	fmovsge	%icc,	%f4,	%f14
	udivx	%i6,	0x0DB7,	%g3
	sdiv	%g5,	0x1AA1,	%o1
	bvc,a,pt	%xcc,	loop_1209
	sllx	%g2,	0x1D,	%l5
	te	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1209:
	sdiv	%g1,	0x0A1E,	%l6
	bl,a,pn	%xcc,	loop_1210
	movleu	%icc,	%g4,	%l3
	tsubcctv	%o4,	%i7,	%o7
	fpack16	%f20,	%f19
loop_1210:
	edge16l	%i2,	%g6,	%l0
	tle	%icc,	0x0
	bshuffle	%f8,	%f18,	%f16
	ba,pt	%xcc,	loop_1211
	movleu	%xcc,	%i3,	%i4
	ta	%icc,	0x6
	xnor	%i5,	%o3,	%g7
loop_1211:
	bl,a	loop_1212
	smulcc	%o2,	%l1,	%l4
	addccc	%i1,	%l2,	%i0
	fmovsa	%icc,	%f21,	%f27
loop_1212:
	stw	%o6,	[%l7 + 0x2C]
	fblg	%fcc0,	loop_1213
	fmovdle	%icc,	%f19,	%f11
	nop
	set	0x40, %g4
	std	%f14,	[%l7 + %g4]
	array8	%o0,	%o5,	%g3
loop_1213:
	tsubcctv	%i6,	0x04F3,	%g5
	fble	%fcc1,	loop_1214
	addcc	%g2,	%o1,	%g1
	tleu	%icc,	0x2
	wr	%g0,	0x04,	%asi
	ldsha	[%l7 + 0x3E] %asi,	%l6
loop_1214:
	te	%icc,	0x0
	movne	%xcc,	%g4,	%l3
	brlez	%l5,	loop_1215
	fsrc1s	%f12,	%f13
	andn	%i7,	%o7,	%o4
	edge32n	%i2,	%g6,	%i3
loop_1215:
	fmovspos	%icc,	%f25,	%f11
	tleu	%icc,	0x1
	addcc	%i4,	%i5,	%o3
	tpos	%icc,	0x1
	ldsw	[%l7 + 0x7C],	%l0
	addccc	%o2,	%g7,	%l1
	srl	%l4,	%l2,	%i0
	edge16l	%i1,	%o6,	%o5
	fbg,a	%fcc3,	loop_1216
	brnz,a	%g3,	loop_1217
	nop
	setx	0x854A65D4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	fsqrts	%f5,	%f5
	edge8ln	%i6,	%o0,	%g2
loop_1216:
	brnz	%g5,	loop_1218
loop_1217:
	umul	%g1,	%l6,	%g4
	tvs	%xcc,	0x3
	edge8n	%l3,	%l5,	%o1
loop_1218:
	udiv	%o7,	0x1EC6,	%i7
	tpos	%xcc,	0x0
	tsubcc	%o4,	%i2,	%g6
	umulcc	%i4,	0x16BD,	%i3
	srlx	%i5,	0x1C,	%l0
	edge32l	%o2,	%o3,	%g7
	fmovs	%f16,	%f7
	fmovsg	%icc,	%f20,	%f10
	udiv	%l1,	0x15B3,	%l4
	set	0x40, %l0
	ldxa	[%l7 + %l0] 0x14,	%l2
	tpos	%xcc,	0x1
	addc	%i0,	%i1,	%o5
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x24] %asi,	%g3
	addccc	%i6,	%o6,	%o0
	fbl	%fcc0,	loop_1219
	smulcc	%g2,	%g1,	%l6
	movle	%icc,	%g5,	%g4
	set	0x50, %o0
	sta	%f4,	[%l7 + %o0] 0x19
loop_1219:
	bne,a,pt	%xcc,	loop_1220
	edge32ln	%l5,	%o1,	%o7
	edge8n	%i7,	%l3,	%i2
	subc	%g6,	0x0BA4,	%i4
loop_1220:
	fmovda	%xcc,	%f8,	%f15
	andncc	%o4,	%i5,	%i3
	ldd	[%l7 + 0x58],	%f26
	umulcc	%l0,	%o3,	%g7
	te	%icc,	0x3
	fmovrslez	%l1,	%f27,	%f15
	fmovrsgez	%l4,	%f26,	%f20
	sllx	%l2,	%i0,	%i1
	edge16ln	%o2,	%g3,	%o5
	movrlez	%i6,	%o6,	%g2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x30] %asi,	%o0
	tleu	%xcc,	0x2
	subccc	%l6,	0x0663,	%g5
	andncc	%g4,	%g1,	%l5
	nop
	setx	loop_1221,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movrlez	%o1,	0x150,	%o7
	ldub	[%l7 + 0x20],	%l3
	stbar
loop_1221:
	addc	%i2,	%i7,	%i4
	array32	%o4,	%g6,	%i5
	bvs,pn	%icc,	loop_1222
	nop
	setx	0x8E6F640D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x8F2F1C6B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f1,	%f10
	tcc	%icc,	0x3
	array16	%i3,	%o3,	%l0
loop_1222:
	ldd	[%l7 + 0x60],	%f26
	mova	%icc,	%l1,	%l4
	nop
	fitos	%f13,	%f30
	fstod	%f30,	%f30
	set	0x68, %i2
	ldsha	[%l7 + %i2] 0x80,	%g7
	subcc	%i0,	0x00D0,	%i1
	tcc	%xcc,	0x3
	array16	%o2,	%g3,	%o5
	movleu	%icc,	%i6,	%o6
	tn	%icc,	0x4
	orncc	%g2,	%o0,	%l2
	sllx	%g5,	%g4,	%l6
	bcc,a	loop_1223
	array32	%g1,	%o1,	%o7
	lduh	[%l7 + 0x62],	%l5
	xnorcc	%l3,	0x0283,	%i2
loop_1223:
	nop
	fitos	%f12,	%f30
	ta	%xcc,	0x1
	andcc	%i4,	%o4,	%i7
	edge8n	%g6,	%i5,	%i3
	edge16ln	%o3,	%l1,	%l4
	brlz	%g7,	loop_1224
	movl	%icc,	%i0,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f10,	%f1,	%f24
loop_1224:
	movleu	%xcc,	%o2,	%i1
	movgu	%icc,	%o5,	%i6
	mulx	%o6,	%g2,	%g3
	fabsd	%f22,	%f8
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] %asi,	%o0,	%g5
	taddcctv	%l2,	%g4,	%l6
	std	%f20,	[%l7 + 0x48]
	fmuld8sux16	%f16,	%f3,	%f12
	fmul8x16	%f24,	%f16,	%f28
	subcc	%o1,	%o7,	%g1
	andncc	%l5,	%l3,	%i2
	tleu	%xcc,	0x1
	fmul8x16au	%f27,	%f28,	%f14
	wr	%g0,	0x2a,	%asi
	stha	%o4,	[%l7 + 0x3E] %asi
	membar	#Sync
	bgu,a,pn	%icc,	loop_1225
	fors	%f6,	%f25,	%f26
	fmovs	%f24,	%f2
	fpadd32s	%f18,	%f15,	%f25
loop_1225:
	movrgz	%i4,	%i7,	%i5
	alignaddr	%i3,	%o3,	%g6
	set	0x28, %l1
	lduha	[%l7 + %l1] 0x81,	%l4
	movrne	%g7,	0x2F4,	%i0
	bcs,pt	%icc,	loop_1226
	array16	%l0,	%o2,	%l1
	tn	%icc,	0x0
	movrgz	%i1,	0x0FC,	%o5
loop_1226:
	sir	0x17D5
	swap	[%l7 + 0x18],	%o6
	mova	%xcc,	%g2,	%g3
	udivcc	%o0,	0x1638,	%g5
	andn	%l2,	%i6,	%l6
	nop
	setx	0x582C3DC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x646622F3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fmuls	%f19,	%f23,	%f19
	tpos	%icc,	0x0
	sethi	0x008C,	%o1
	set	0x60, %l3
	lduha	[%l7 + %l3] 0x89,	%o7
	fbul	%fcc3,	loop_1227
	edge32n	%g4,	%l5,	%g1
	fbe,a	%fcc0,	loop_1228
	call	loop_1229
loop_1227:
	udivx	%l3,	0x189F,	%i2
	tleu	%xcc,	0x1
loop_1228:
	xnorcc	%i4,	%o4,	%i7
loop_1229:
	fmovsa	%icc,	%f14,	%f4
	fornot2	%f30,	%f24,	%f18
	bn,pn	%icc,	loop_1230
	tvs	%icc,	0x4
	sth	%i3,	[%l7 + 0x5C]
	array16	%i5,	%g6,	%l4
loop_1230:
	sll	%g7,	0x1E,	%o3
	movpos	%icc,	%i0,	%l0
	movre	%l1,	%o2,	%o5
	ldsb	[%l7 + 0x74],	%o6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f19,	%f20
	tne	%icc,	0x1
	fandnot1s	%f5,	%f5,	%f18
	array16	%i1,	%g2,	%g3
	brlez	%o0,	loop_1231
	addccc	%g5,	0x1880,	%l2
	smulcc	%l6,	%i6,	%o1
	edge16	%o7,	%g4,	%g1
loop_1231:
	subc	%l5,	%l3,	%i4
	tg	%xcc,	0x6
	movrgez	%o4,	%i2,	%i7
	bvc	%icc,	loop_1232
	edge32l	%i3,	%i5,	%l4
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x14] %asi,	%g6
loop_1232:
	bcc	loop_1233
	popc	0x152E,	%o3
	prefetch	[%l7 + 0x40],	 0x3
	edge16ln	%g7,	%l0,	%i0
loop_1233:
	fmovrdgz	%l1,	%f4,	%f12
	bleu	loop_1234
	tgu	%icc,	0x7
	prefetch	[%l7 + 0x40],	 0x2
	sdivx	%o5,	0x11EE,	%o6
loop_1234:
	srlx	%o2,	%i1,	%g3
	fpadd16	%f22,	%f30,	%f16
	st	%f4,	[%l7 + 0x50]
	fcmpeq16	%f24,	%f30,	%o0
	fmul8ulx16	%f12,	%f22,	%f16
	fnot2s	%f7,	%f6
	ldstub	[%l7 + 0x61],	%g5
	fmul8sux16	%f22,	%f28,	%f10
	set	0x70, %o7
	sta	%f23,	[%l7 + %o7] 0x15
	orn	%l2,	%g2,	%i6
	srax	%l6,	%o7,	%o1
	sth	%g4,	[%l7 + 0x14]
	sdivx	%g1,	0x0402,	%l3
	fble	%fcc3,	loop_1235
	bcc,a,pt	%xcc,	loop_1236
	fmul8x16al	%f3,	%f6,	%f4
	movleu	%xcc,	%i4,	%o4
loop_1235:
	movvs	%icc,	%l5,	%i7
loop_1236:
	mova	%icc,	%i3,	%i2
	ble,a	%xcc,	loop_1237
	edge32n	%l4,	%g6,	%o3
	bcs,pn	%xcc,	loop_1238
	nop
	fitos	%f3,	%f20
	fstod	%f20,	%f20
loop_1237:
	subc	%g7,	%l0,	%i0
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x89,	%f0
loop_1238:
	fcmpeq16	%f22,	%f22,	%l1
	addccc	%i5,	%o5,	%o6
	tsubcctv	%i1,	0x17C8,	%g3
	add	%l7,	0x20,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o2,	%g5
	srlx	%l2,	0x1B,	%g2
	ldsw	[%l7 + 0x60],	%o0
	edge8l	%i6,	%l6,	%o7
	fnors	%f14,	%f19,	%f27
	brz	%g4,	loop_1239
	nop
	setx	loop_1240,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fnegs	%f23,	%f16
	stx	%o1,	[%l7 + 0x70]
loop_1239:
	movl	%xcc,	%g1,	%l3
loop_1240:
	smul	%o4,	0x18CA,	%i4
	addc	%l5,	0x174A,	%i3
	movrgz	%i2,	%i7,	%l4
	movle	%icc,	%g6,	%o3
	fbug	%fcc2,	loop_1241
	fnor	%f22,	%f8,	%f18
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x58] %asi,	%l0
loop_1241:
	fmovrdne	%g7,	%f22,	%f26
	and	%i0,	%i5,	%l1
	ldstub	[%l7 + 0x3E],	%o6
	srlx	%o5,	0x1F,	%i1
	movle	%xcc,	%o2,	%g5
	set	0x73, %o5
	stba	%l2,	[%l7 + %o5] 0xeb
	membar	#Sync
	fmovrsne	%g3,	%f27,	%f3
	brnz	%o0,	loop_1242
	tvc	%xcc,	0x0
	mulscc	%g2,	0x0527,	%l6
	movcs	%icc,	%i6,	%o7
loop_1242:
	xnor	%o1,	0x1C79,	%g1
	movvs	%icc,	%l3,	%o4
	move	%icc,	%g4,	%l5
	mulscc	%i3,	0x0569,	%i4
	edge16ln	%i7,	%l4,	%g6
	subcc	%o3,	0x03FE,	%l0
	nop
	setx	0x3BF161CE08930D50,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x6EBEF21A4D373568,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f24,	%f12
	ta	%icc,	0x2
	fandnot2s	%f7,	%f10,	%f15
	movcc	%xcc,	%g7,	%i0
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x44] %asi,	%i5
	fbge	%fcc2,	loop_1243
	array32	%l1,	%i2,	%o5
	tne	%icc,	0x2
	wr	%g0,	0x21,	%asi
	ldxa	[%g0 + 0x8] %asi,	%o6
loop_1243:
	tleu	%xcc,	0x0
	udiv	%i1,	0x16FA,	%o2
	membar	0x5A
	move	%icc,	%l2,	%g5
	xnor	%g3,	0x119D,	%o0
	fcmple16	%f26,	%f28,	%l6
	ldd	[%l7 + 0x30],	%f28
	ld	[%l7 + 0x44],	%f18
	fbue	%fcc0,	loop_1244
	tge	%icc,	0x7
	orcc	%i6,	%o7,	%o1
	fpack32	%f6,	%f30,	%f28
loop_1244:
	sethi	0x00FC,	%g2
	prefetch	[%l7 + 0x74],	 0x2
	movleu	%icc,	%g1,	%l3
	tcc	%xcc,	0x2
	sll	%o4,	0x10,	%l5
	fmul8x16al	%f7,	%f21,	%f22
	fones	%f1
	fmovd	%f28,	%f24
	mova	%xcc,	%g4,	%i4
	sll	%i3,	0x08,	%l4
	fmovdn	%icc,	%f13,	%f21
	prefetch	[%l7 + 0x28],	 0x0
	smulcc	%g6,	0x0B51,	%o3
	andn	%i7,	0x0EA5,	%l0
	srlx	%g7,	0x05,	%i5
	nop
	setx	0x905B532A,	%l0,	%l6
	st	%l6,	[%l7 + 0x4C]
	ld	[%l7 + 0x4C],	%fsr
	pdist	%f8,	%f30,	%f30
	sth	%l1,	[%l7 + 0x64]
	edge8n	%i0,	%i2,	%o6
	subcc	%o5,	%i1,	%l2
	stw	%g5,	[%l7 + 0x4C]
	tne	%xcc,	0x4
	andn	%g3,	%o2,	%l6
	subcc	%o0,	%o7,	%o1
	tvs	%icc,	0x3
	fble,a	%fcc0,	loop_1245
	tg	%icc,	0x5
	edge32l	%g2,	%g1,	%i6
	sir	0x13D8
loop_1245:
	ldstub	[%l7 + 0x5C],	%o4
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%l4
	edge8l	%g4,	%i4,	%l3
	subcc	%i3,	%g6,	%o3
	fcmpne32	%f16,	%f12,	%l4
	array32	%i7,	%l0,	%g7
	bcs	%xcc,	loop_1246
	bge,a,pn	%xcc,	loop_1247
	alignaddr	%i5,	%i0,	%i2
	umulcc	%o6,	%o5,	%l1
loop_1246:
	fpsub32s	%f8,	%f8,	%f10
loop_1247:
	fbule,a	%fcc0,	loop_1248
	taddcc	%i1,	%g5,	%l2
	tneg	%icc,	0x4
	array16	%g3,	%l6,	%o0
loop_1248:
	nop
	set	0x40, %g7
	ldda	[%l7 + %g7] 0x04,	%f16
	edge16l	%o2,	%o7,	%g2
	fxnors	%f20,	%f16,	%f10
	orncc	%o1,	%g1,	%o4
	fmul8x16au	%f3,	%f13,	%f0
	nop
	fitos	%f12,	%f23
	fstox	%f23,	%f8
	fxtos	%f8,	%f29
	bneg,a	%icc,	loop_1249
	fornot1	%f26,	%f0,	%f28
	fmovrdlz	%l5,	%f20,	%f18
	edge32ln	%i6,	%g4,	%l3
loop_1249:
	movne	%xcc,	%i3,	%i4
	taddcc	%g6,	%o3,	%l4
	fmul8x16au	%f28,	%f13,	%f30
	tg	%icc,	0x1
	fpadd16	%f30,	%f30,	%f2
	fxors	%f20,	%f18,	%f31
	and	%l0,	%i7,	%i5
	mulscc	%g7,	0x11A0,	%i0
	umul	%i2,	0x189A,	%o5
	fmovd	%f30,	%f10
	nop
	setx	0x7E4A3A3D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f9
	nop
	set	0x7C, %g3
	stw	%l1,	[%l7 + %g3]
	bleu,pn	%icc,	loop_1250
	flush	%l7 + 0x64
	udiv	%o6,	0x1F79,	%g5
	fmovsleu	%icc,	%f22,	%f23
loop_1250:
	edge8	%i1,	%l2,	%g3
	prefetch	[%l7 + 0x64],	 0x2
	sth	%l6,	[%l7 + 0x7C]
	fcmpne32	%f22,	%f4,	%o0
	ba,pn	%icc,	loop_1251
	fornot2s	%f23,	%f29,	%f31
	tsubcc	%o2,	0x15F8,	%g2
	nop
	fitos	%f1,	%f6
	fstox	%f6,	%f14
loop_1251:
	fbul,a	%fcc1,	loop_1252
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f8,	%f24,	%f2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1252:
	andcc	%o7,	0x0EBB,	%g1
	swap	[%l7 + 0x44],	%o4
	fbn	%fcc2,	loop_1253
	tsubcctv	%o1,	%i6,	%l5
	edge16n	%l3,	%i3,	%g4
	fbug	%fcc3,	loop_1254
loop_1253:
	tne	%icc,	0x0
	movcs	%xcc,	%i4,	%o3
	tle	%icc,	0x0
loop_1254:
	and	%g6,	0x0269,	%l4
	edge16n	%i7,	%i5,	%g7
	srl	%i0,	%l0,	%i2
	nop
	set	0x0B, %i4
	ldsb	[%l7 + %i4],	%o5
	sllx	%l1,	%o6,	%g5
	brlz	%i1,	loop_1255
	fbul,a	%fcc3,	loop_1256
	sllx	%l2,	0x19,	%g3
	edge32l	%l6,	%o0,	%o2
loop_1255:
	bvc,a,pn	%icc,	loop_1257
loop_1256:
	sir	0x0CAF
	bvc,a	%xcc,	loop_1258
	nop
	fitos	%f4,	%f19
	fstox	%f19,	%f18
	fxtos	%f18,	%f31
loop_1257:
	movre	%o7,	0x29F,	%g2
	movrne	%o4,	0x14A,	%o1
loop_1258:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g1,	0x0501,	%l5
	fmovdvs	%xcc,	%f3,	%f0
	ble,a,pn	%xcc,	loop_1259
	movle	%icc,	%l3,	%i3
	movrne	%i6,	%i4,	%g4
	set	0x60, %o4
	lduha	[%l7 + %o4] 0x0c,	%o3
loop_1259:
	movrgz	%g6,	%l4,	%i5
	fmovsl	%xcc,	%f11,	%f18
	edge16ln	%i7,	%g7,	%i0
	nop
	fitos	%f5,	%f25
	fstox	%f25,	%f8
	fxtos	%f8,	%f13
	nop
	setx	0x5AEE2E47304227C9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	edge16	%l0,	%o5,	%i2
	bl,a,pt	%icc,	loop_1260
	fmovrdgez	%l1,	%f24,	%f20
	addcc	%g5,	0x0602,	%o6
	array32	%l2,	%g3,	%i1
loop_1260:
	edge32l	%l6,	%o2,	%o0
	edge32l	%g2,	%o4,	%o7
	xnorcc	%o1,	0x1CF3,	%g1
	edge32n	%l5,	%i3,	%l3
	bg	loop_1261
	array16	%i6,	%i4,	%o3
	edge8n	%g4,	%g6,	%i5
	orcc	%l4,	%i7,	%g7
loop_1261:
	movrne	%i0,	0x175,	%o5
	prefetch	[%l7 + 0x2C],	 0x2
	movvs	%xcc,	%i2,	%l1
	fmovrslz	%l0,	%f28,	%f5
	nop
	set	0x20, %l5
	std	%f8,	[%l7 + %l5]
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f14
	fxtod	%f14,	%f22
	andncc	%g5,	%l2,	%o6
	set	0x14, %i0
	stha	%i1,	[%l7 + %i0] 0xe3
	membar	#Sync
	addccc	%g3,	0x00AA,	%o2
	brlz,a	%l6,	loop_1262
	bcc,a,pt	%xcc,	loop_1263
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o0,	%o4,	%g2
loop_1262:
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%o0
loop_1263:
	orncc	%g1,	%o7,	%l5
	andn	%i3,	%i6,	%l3
	bpos,pn	%icc,	loop_1264
	brlez	%o3,	loop_1265
	edge16n	%g4,	%g6,	%i5
	movl	%xcc,	%l4,	%i7
loop_1264:
	nop
	set	0x28, %i7
	lduba	[%l7 + %i7] 0x15,	%g7
loop_1265:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i4,	[%l7 + 0x12]
	brlez	%o5,	loop_1266
	brgez,a	%i2,	loop_1267
	fblg,a	%fcc2,	loop_1268
	fabsd	%f10,	%f8
loop_1266:
	movne	%icc,	%l1,	%l0
loop_1267:
	nop
	set	0x28, %g1
	prefetcha	[%l7 + %g1] 0x11,	 0x1
loop_1268:
	fmovdcs	%xcc,	%f30,	%f26
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x80
	edge32ln	%g5,	%l2,	%i1
	edge16l	%g3,	%o2,	%l6
	brnz	%o6,	loop_1269
	tl	%xcc,	0x0
	movrgz	%o4,	0x23B,	%o0
	tvs	%xcc,	0x6
loop_1269:
	edge16l	%g2,	%o1,	%o7
	movl	%xcc,	%l5,	%g1
	prefetch	[%l7 + 0x4C],	 0x1
	te	%xcc,	0x2
	mulscc	%i3,	%l3,	%i6
	nop
	setx	0xD23BB290,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x646C1EFC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fdivs	%f3,	%f1,	%f21
	movvc	%xcc,	%o3,	%g6
	movrlz	%i5,	%l4,	%i7
	sdivcc	%g7,	0x1DCE,	%i4
	edge8n	%o5,	%g4,	%i2
	xnor	%l1,	0x1BD5,	%i0
	movrne	%g5,	0x166,	%l0
	tgu	%icc,	0x5
	std	%f16,	[%l7 + 0x48]
	fmovsgu	%icc,	%f0,	%f20
	edge32n	%i1,	%g3,	%l2
	alignaddrl	%l6,	%o6,	%o4
	orcc	%o2,	0x191F,	%o0
	bgu	loop_1270
	tne	%xcc,	0x5
	or	%o1,	0x001B,	%g2
	edge16	%l5,	%o7,	%g1
loop_1270:
	andcc	%i3,	0x1C58,	%l3
	smulcc	%i6,	0x1DDF,	%o3
	lduh	[%l7 + 0x22],	%i5
	or	%l4,	%g6,	%i7
	fabsd	%f30,	%f8
	movge	%xcc,	%g7,	%i4
	and	%g4,	%i2,	%l1
	array16	%o5,	%g5,	%i0
	fbul,a	%fcc2,	loop_1271
	prefetch	[%l7 + 0x34],	 0x1
	tne	%xcc,	0x7
	smulcc	%l0,	%g3,	%i1
loop_1271:
	tne	%xcc,	0x1
	movpos	%xcc,	%l2,	%o6
	udiv	%o4,	0x1696,	%o2
	sll	%l6,	%o0,	%o1
	umul	%g2,	0x14BA,	%o7
	set	0x20, %g6
	sta	%f20,	[%l7 + %g6] 0x04
	movvc	%xcc,	%g1,	%i3
	movrne	%l3,	%i6,	%o3
	movl	%icc,	%i5,	%l4
	movg	%icc,	%l5,	%i7
	udiv	%g7,	0x05F1,	%i4
	andn	%g4,	0x0D82,	%i2
	edge32n	%l1,	%g6,	%o5
	wr	%g0,	0x18,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	umulcc	%g5,	0x1500,	%l0
	movre	%g3,	0x39B,	%i1
	tsubcc	%l2,	0x08B6,	%o6
	bl,a,pn	%xcc,	loop_1272
	fzero	%f2
	movrne	%i0,	%o4,	%o2
	tle	%xcc,	0x6
loop_1272:
	movrne	%o0,	0x165,	%o1
	movle	%icc,	%l6,	%o7
	te	%icc,	0x3
	tgu	%icc,	0x2
	fmovdl	%icc,	%f27,	%f24
	membar	0x5D
	sethi	0x010E,	%g2
	movn	%xcc,	%i3,	%l3
	nop
	setx	0x90549B38,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	nop
	set	0x18, %o1
	std	%f30,	[%l7 + %o1]
	movvs	%xcc,	%i6,	%o3
	set	0x74, %i5
	lduwa	[%l7 + %i5] 0x19,	%g1
	andcc	%l4,	%i5,	%i7
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x30] %asi,	%l5
	fmovdle	%xcc,	%f30,	%f6
	nop
	setx	0xCFED2B48,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xCAF331FC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f3,	%f14
	edge8n	%i4,	%g7,	%g4
	fble	%fcc3,	loop_1273
	tneg	%xcc,	0x7
	fbne,a	%fcc1,	loop_1274
	orncc	%i2,	%g6,	%l1
loop_1273:
	tge	%xcc,	0x0
	array32	%g5,	%o5,	%l0
loop_1274:
	fpackfix	%f8,	%f2
	fbo	%fcc1,	loop_1275
	edge8ln	%g3,	%l2,	%o6
	tcc	%icc,	0x2
	edge8	%i0,	%i1,	%o4
loop_1275:
	bleu,pt	%xcc,	loop_1276
	movcc	%xcc,	%o0,	%o1
	subccc	%l6,	%o7,	%g2
	popc	%i3,	%o2
loop_1276:
	sllx	%i6,	%o3,	%g1
	andn	%l3,	0x156A,	%l4
	wr	%g0,	0x2f,	%asi
	stba	%i7,	[%l7 + 0x47] %asi
	membar	#Sync
	movrne	%i5,	0x2C9,	%l5
	movge	%icc,	%i4,	%g7
	srl	%i2,	%g4,	%g6
	edge8l	%g5,	%o5,	%l1
	fmovrsgez	%l0,	%f11,	%f27
	tsubcc	%l2,	%o6,	%i0
	edge8ln	%i1,	%g3,	%o0
	sir	0x18DD
	tsubcctv	%o1,	0x0616,	%l6
	tge	%icc,	0x6
	tleu	%xcc,	0x1
	brz,a	%o4,	loop_1277
	fmovrdlez	%o7,	%f12,	%f30
	movre	%i3,	0x0FD,	%o2
	fblg,a	%fcc2,	loop_1278
loop_1277:
	movcs	%icc,	%g2,	%o3
	move	%xcc,	%g1,	%l3
	fzero	%f24
loop_1278:
	brlez	%i6,	loop_1279
	sll	%l4,	0x1D,	%i7
	tpos	%xcc,	0x4
	xor	%l5,	0x17AA,	%i4
loop_1279:
	tsubcc	%i5,	%g7,	%i2
	fmovdge	%xcc,	%f13,	%f12
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
	fandnot2	%f22,	%f10,	%f2
	bn,pt	%xcc,	loop_1280
	tvs	%icc,	0x1
	tsubcc	%g5,	%o5,	%l1
	tne	%xcc,	0x7
loop_1280:
	smul	%g4,	0x1C91,	%l0
	subcc	%o6,	0x170A,	%l2
	fnands	%f20,	%f15,	%f20
	tgu	%xcc,	0x1
	orn	%i0,	0x07D9,	%g3
	tgu	%icc,	0x7
	tneg	%xcc,	0x0
	bcs	loop_1281
	addc	%i1,	0x12CC,	%o0
	nop
	fitod	%f12,	%f12
	fdtos	%f12,	%f16
	movrlez	%l6,	%o1,	%o4
loop_1281:
	array16	%o7,	%o2,	%i3
	sdiv	%g2,	0x14D4,	%g1
	fandnot2s	%f30,	%f5,	%f3
	fmovsn	%icc,	%f3,	%f14
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x44] %asi,	%l3
	udiv	%o3,	0x0320,	%l4
	bn,pt	%icc,	loop_1282
	tcs	%xcc,	0x3
	movge	%icc,	%i7,	%i6
	udivx	%l5,	0x1B3E,	%i4
loop_1282:
	tge	%xcc,	0x6
	set	0x10, %i3
	stxa	%g7,	[%l7 + %i3] 0x81
	nop
	setx	0xAFD63D1C,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	setx	0xF691DE3F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f0,	%f19
	tne	%xcc,	0x4
	brz,a	%i5,	loop_1283
	movrgez	%i2,	0x0A9,	%g6
	set	0x3D, %o3
	ldstuba	[%l7 + %o3] 0x80,	%o5
loop_1283:
	edge32n	%g5,	%g4,	%l1
	taddcc	%o6,	%l2,	%l0
	udiv	%g3,	0x0025,	%i1
	set	0x10, %o6
	ldda	[%l7 + %o6] 0xe3,	%o0
	edge16l	%i0,	%o1,	%l6
	edge32l	%o4,	%o2,	%i3
	edge16	%o7,	%g1,	%l3
	andcc	%o3,	%l4,	%g2
	srlx	%i6,	0x1A,	%l5
	fmovrdne	%i7,	%f4,	%f2
	fble,a	%fcc0,	loop_1284
	andncc	%g7,	%i4,	%i5
	fble	%fcc0,	loop_1285
	fmovde	%icc,	%f7,	%f17
loop_1284:
	fbue,a	%fcc0,	loop_1286
	orncc	%g6,	%i2,	%o5
loop_1285:
	brlz,a	%g5,	loop_1287
	tge	%icc,	0x7
loop_1286:
	ta	%icc,	0x7
	fmovrslz	%l1,	%f28,	%f23
loop_1287:
	fmovrdlez	%g4,	%f10,	%f28
	sdivx	%l2,	0x0762,	%l0
	fmovsgu	%xcc,	%f19,	%f29
	srax	%o6,	%g3,	%o0
	fmovdge	%xcc,	%f26,	%f10
	tn	%xcc,	0x2
	tneg	%xcc,	0x4
	nop
	setx	0x305BA34A,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	fnot2s	%f14,	%f6
	movvs	%xcc,	%i1,	%o1
	nop
	fitos	%f14,	%f12
	fstox	%f12,	%f26
	swap	[%l7 + 0x2C],	%i0
	alignaddr	%l6,	%o4,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o7,	%g1
	stx	%l3,	[%l7 + 0x60]
	fmovsl	%icc,	%f5,	%f23
	fnot2	%f30,	%f28
	sth	%o2,	[%l7 + 0x74]
	fbne,a	%fcc1,	loop_1288
	andcc	%l4,	0x1B3D,	%g2
	fbn	%fcc0,	loop_1289
	movrgez	%o3,	%i6,	%l5
loop_1288:
	array32	%g7,	%i4,	%i7
	mova	%icc,	%g6,	%i2
loop_1289:
	nop
	setx	loop_1290,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fpsub32s	%f14,	%f17,	%f26
	popc	0x1EF1,	%i5
	xnorcc	%g5,	0x02F1,	%o5
loop_1290:
	movcc	%xcc,	%g4,	%l2
	mova	%xcc,	%l1,	%l0
	fmovse	%xcc,	%f13,	%f23
	movrgez	%g3,	0x2D6,	%o0
	tsubcctv	%o6,	%i1,	%i0
	nop
	setx loop_1291, %l0, %l1
	jmpl %l1, %l6
	or	%o1,	0x0A4A,	%i3
	movneg	%icc,	%o4,	%g1
	movcc	%xcc,	%l3,	%o7
loop_1291:
	nop
	set	0x30, %l4
	ldstuba	[%l7 + %l4] 0x88,	%l4
	edge32n	%o2,	%g2,	%i6
	tl	%xcc,	0x3
	fandnot2	%f28,	%f12,	%f4
	fpack32	%f26,	%f2,	%f8
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x0c
	umulcc	%o3,	0x05FD,	%g7
	fbug	%fcc1,	loop_1292
	mova	%xcc,	%l5,	%i4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x011E
loop_1292:
	sdivx	%g6,	0x0A87,	%i2
	srax	%i7,	%g5,	%o5
	fabss	%f23,	%f10
	bl,pt	%xcc,	loop_1293
	add	%i5,	%l2,	%g4
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x34] %asi,	%l1
loop_1293:
	nop
	fitod	%f2,	%f22
	fdtoi	%f22,	%f8
	set	0x48, %g5
	prefetcha	[%l7 + %g5] 0x80,	 0x3
	add	%l0,	%o6,	%i1
	fors	%f12,	%f1,	%f20
	tleu	%icc,	0x1
	edge8ln	%i0,	%l6,	%o1
	umulcc	%o0,	%i3,	%o4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g1,	%l3,	%o7
	be	%xcc,	loop_1294
	ldsw	[%l7 + 0x48],	%o2
	edge16l	%g2,	%l4,	%o3
	sllx	%i6,	%g7,	%l5
loop_1294:
	tleu	%icc,	0x7
	movrgz	%i4,	0x2F5,	%g6
	tne	%icc,	0x5
	sdiv	%i2,	0x0D7B,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x04,	%asi
	sta	%f9,	[%l7 + 0x54] %asi
	fone	%f12
	alignaddr	%o5,	%i5,	%l2
	tleu	%xcc,	0x0
	ta	%xcc,	0x5
	nop
	setx	0x58B94F968A382C83,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f20
	stb	%g4,	[%l7 + 0x28]
	nop
	setx	0x05A1CD92286C83F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x3EF46906B9D90E33,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fdivd	%f4,	%f14,	%f24
	bleu	loop_1295
	fblg,a	%fcc1,	loop_1296
	edge32n	%l1,	%g3,	%l0
	sir	0x1F97
loop_1295:
	subc	%o6,	%i1,	%g5
loop_1296:
	fbe	%fcc2,	loop_1297
	sub	%l6,	%o1,	%i0
	movvs	%xcc,	%o0,	%o4
	sll	%g1,	%l3,	%i3
loop_1297:
	sth	%o2,	[%l7 + 0x38]
	movle	%icc,	%g2,	%l4
	edge32l	%o7,	%o3,	%i6
	movvs	%icc,	%g7,	%i4
	ldd	[%l7 + 0x58],	%g6
	movrlz	%l5,	%i7,	%i2
	orn	%o5,	0x0941,	%l2
	addcc	%i5,	0x0D57,	%l1
	sllx	%g3,	%l0,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f4,	%f30
	fbg	%fcc1,	loop_1298
	fbg	%fcc3,	loop_1299
	edge8	%o6,	%g5,	%l6
	movrne	%o1,	0x379,	%i0
loop_1298:
	fcmpne16	%f8,	%f24,	%i1
loop_1299:
	fnors	%f28,	%f12,	%f19
	fmuld8sux16	%f12,	%f25,	%f18
	fpadd16s	%f8,	%f18,	%f25
	ldsb	[%l7 + 0x43],	%o4
	movneg	%icc,	%g1,	%o0
	move	%xcc,	%i3,	%o2
	tn	%icc,	0x2
	ldsw	[%l7 + 0x74],	%g2
	bn,a,pt	%xcc,	loop_1300
	bvc	loop_1301
	edge32l	%l3,	%o7,	%l4
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x18] %asi,	%i6
loop_1300:
	nop
	wr	%g0,	0x22,	%asi
	stwa	%o3,	[%l7 + 0x58] %asi
	membar	#Sync
loop_1301:
	addc	%i4,	%g6,	%g7
	edge32	%i7,	%l5,	%i2
	addcc	%o5,	%i5,	%l2
	fpsub16s	%f27,	%f23,	%f30
	taddcctv	%g3,	0x09E2,	%l0
	fnand	%f20,	%f22,	%f12
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	ldd	[%l7 + 0x18],	%f0
	movpos	%icc,	%g4,	%l1
	addcc	%g5,	0x15E8,	%l6
	stbar
	edge32l	%o6,	%o1,	%i1
	nop
	fitod	%f6,	%f14
	fdtos	%f14,	%f15
	fnors	%f7,	%f12,	%f4
	movrlez	%i0,	0x2BA,	%o4
	alignaddrl	%g1,	%i3,	%o2
	edge16n	%g2,	%o0,	%l3
	movcs	%icc,	%o7,	%l4
	orncc	%i6,	0x116F,	%o3
	sdivcc	%i4,	0x0598,	%g7
	mulx	%i7,	%l5,	%i2
	fmovd	%f18,	%f14
	movcc	%xcc,	%g6,	%o5
	srl	%l2,	0x09,	%i5
	xor	%l0,	0x0B05,	%g4
	subccc	%g3,	%g5,	%l1
	fornot1s	%f17,	%f21,	%f7
	brlez	%o6,	loop_1302
	stb	%l6,	[%l7 + 0x70]
	brz	%i1,	loop_1303
	fmovdl	%xcc,	%f22,	%f16
loop_1302:
	addcc	%i0,	0x03B1,	%o4
	addcc	%g1,	%o1,	%i3
loop_1303:
	movg	%icc,	%o2,	%o0
	fbug	%fcc1,	loop_1304
	sir	0x1CCA
	fcmpgt32	%f22,	%f4,	%l3
	bg	%icc,	loop_1305
loop_1304:
	tvs	%xcc,	0x2
	movpos	%xcc,	%g2,	%l4
	subcc	%i6,	0x0756,	%o7
loop_1305:
	tn	%xcc,	0x4
	lduh	[%l7 + 0x74],	%o3
	fabsd	%f22,	%f8
	movleu	%xcc,	%i4,	%i7
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x24] %asi,	%f5
	xnorcc	%g7,	%l5,	%g6
	lduw	[%l7 + 0x5C],	%o5
	add	%l7,	0x48,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%l2
	casxa	[%l6] 0x88,	%l2,	%i5
	stx	%l0,	[%l7 + 0x28]
	fnot2	%f28,	%f2
	stb	%g4,	[%l7 + 0x22]
	alignaddrl	%i2,	%g5,	%g3
	tge	%icc,	0x0
	edge8	%o6,	%l1,	%i1
	add	%l7,	0x44,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%l6,	%i0
	fmovsneg	%icc,	%f6,	%f29
	set	0x4E, %g2
	ldsha	[%l7 + %g2] 0x19,	%g1
	nop
	setx	0x8D6E34A36009D592,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xF80144A2D2C569E0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fdivd	%f30,	%f20,	%f24
	subc	%o4,	0x02BF,	%i3
	edge16l	%o1,	%o2,	%o0
	fnegd	%f22,	%f22
	fornot2s	%f8,	%f16,	%f28
	ldstub	[%l7 + 0x3B],	%l3
	set	0x220, %l0
	ldxa	[%g0 + %l0] 0x52,	%l4
	set	0x70, %g4
	ldxa	[%l7 + %g4] 0x14,	%i6
	movn	%icc,	%o7,	%g2
	sll	%o3,	0x05,	%i7
	ldsw	[%l7 + 0x64],	%i4
	edge16	%g7,	%l5,	%o5
	umulcc	%l2,	%g6,	%l0
	sra	%g4,	0x0E,	%i2
	movge	%icc,	%i5,	%g3
	edge8l	%o6,	%g5,	%l1
	edge16l	%l6,	%i1,	%i0
	tneg	%xcc,	0x6
	edge32l	%o4,	%g1,	%o1
	tcs	%xcc,	0x3
	andcc	%i3,	%o2,	%l3
	edge16ln	%o0,	%l4,	%o7
	fmul8sux16	%f16,	%f14,	%f18
	movgu	%icc,	%g2,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o3,	%i7
	srl	%i4,	0x1B,	%l5
	edge8	%o5,	%g7,	%g6
	tcs	%icc,	0x1
	brz,a	%l0,	loop_1306
	ldub	[%l7 + 0x38],	%l2
	movpos	%xcc,	%i2,	%g4
	tneg	%icc,	0x1
loop_1306:
	tsubcc	%g3,	0x16B8,	%i5
	xorcc	%o6,	%g5,	%l1
	fbe	%fcc3,	loop_1307
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l6,	%i0,	%o4
	bleu,a	%xcc,	loop_1308
loop_1307:
	movvc	%icc,	%g1,	%o1
	fmovrde	%i3,	%f8,	%f20
	srlx	%i1,	%o2,	%l3
loop_1308:
	addcc	%l4,	0x1B91,	%o0
	addc	%o7,	0x039A,	%g2
	set	0x08, %o0
	stwa	%o3,	[%l7 + %o0] 0x0c
	movcs	%xcc,	%i7,	%i4
	sll	%l5,	0x0A,	%o5
	movl	%icc,	%i6,	%g7
	alignaddr	%l0,	%l2,	%i2
	array32	%g6,	%g3,	%g4
	umulcc	%o6,	%i5,	%l1
	sethi	0x1CAA,	%g5
	fandnot1	%f20,	%f18,	%f28
	set	0x3C, %i2
	lduwa	[%l7 + %i2] 0x11,	%i0
	sir	0x06F5
	fmovdn	%xcc,	%f29,	%f26
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o4
	wr	%g0,	0x04,	%asi
	ldsba	[%l7 + 0x0F] %asi,	%l6
	edge16l	%g1,	%i3,	%i1
	stb	%o1,	[%l7 + 0x4A]
	brlez	%o2,	loop_1309
	popc	0x18BA,	%l4
	movneg	%icc,	%o0,	%l3
	srl	%g2,	%o7,	%o3
loop_1309:
	movle	%icc,	%i7,	%l5
	tle	%xcc,	0x7
	tgu	%icc,	0x5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x5C] %asi,	%f20
	mova	%xcc,	%i4,	%o5
	movrne	%g7,	0x174,	%i6
	mulx	%l0,	%l2,	%g6
	movvc	%xcc,	%g3,	%g4
	fpadd32s	%f7,	%f14,	%f12
	ba,a	%icc,	loop_1310
	membar	0x76
	xor	%o6,	0x0513,	%i2
	tl	%xcc,	0x2
loop_1310:
	movneg	%xcc,	%l1,	%g5
	udivcc	%i5,	0x1B4E,	%i0
	fnegs	%f27,	%f13
	fbo	%fcc3,	loop_1311
	udivcc	%l6,	0x0EA2,	%o4
	tge	%icc,	0x6
	tgu	%xcc,	0x1
loop_1311:
	movl	%icc,	%i3,	%i1
	edge8ln	%o1,	%g1,	%l4
	movne	%icc,	%o2,	%o0
	fbul	%fcc0,	loop_1312
	movvc	%icc,	%g2,	%l3
	set	0x20, %l3
	lda	[%l7 + %l3] 0x89,	%f8
loop_1312:
	movrgez	%o3,	0x0E2,	%i7
	movrgz	%o7,	%l5,	%o5
	sth	%i4,	[%l7 + 0x2C]
	stw	%g7,	[%l7 + 0x64]
	nop
	fitos	%f21,	%f7
	bcc,pn	%icc,	loop_1313
	popc	%l0,	%i6
	call	loop_1314
	movcs	%xcc,	%l2,	%g6
loop_1313:
	swap	[%l7 + 0x40],	%g4
	tgu	%xcc,	0x5
loop_1314:
	subcc	%g3,	%o6,	%i2
	movge	%xcc,	%g5,	%l1
	fmul8sux16	%f6,	%f28,	%f22
	tgu	%icc,	0x7
	umul	%i0,	%i5,	%l6
	fpadd16	%f22,	%f12,	%f30
	fbu	%fcc0,	loop_1315
	fbg,a	%fcc3,	loop_1316
	ldsh	[%l7 + 0x08],	%o4
	smul	%i3,	%o1,	%g1
loop_1315:
	xnor	%i1,	0x0892,	%l4
loop_1316:
	fpack16	%f8,	%f24
	tleu	%xcc,	0x2
	movgu	%xcc,	%o0,	%g2
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
	xnorcc	%o2,	0x103D,	%o3
	membar	0x79
	tsubcc	%o7,	0x1E9B,	%i7
	lduw	[%l7 + 0x64],	%o5
	fmovdle	%icc,	%f25,	%f31
	movrlz	%i4,	%l5,	%g7
	array32	%i6,	%l0,	%l2
	nop
	setx	0x825791A91B8D9A10,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x05DC3720E6F62221,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f26,	%f6
	xor	%g6,	%g3,	%o6
	tge	%icc,	0x5
	popc	0x0E57,	%i2
	movrlz	%g5,	0x1F1,	%l1
	movle	%icc,	%g4,	%i0
	fpack32	%f6,	%f30,	%f24
	nop
	setx	loop_1317,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	smul	%l6,	0x040A,	%i5
	fpsub32s	%f20,	%f2,	%f11
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x55] %asi,	%i3
loop_1317:
	xnorcc	%o1,	%o4,	%g1
	ldsh	[%l7 + 0x2A],	%i1
	tsubcctv	%l4,	%o0,	%l3
	fnegd	%f22,	%f18
	tg	%xcc,	0x4
	tle	%icc,	0x5
	addccc	%g2,	0x0948,	%o3
	te	%xcc,	0x1
	fbule,a	%fcc2,	loop_1318
	andncc	%o2,	%o7,	%i7
	umulcc	%i4,	0x1115,	%o5
	movrlz	%l5,	0x26C,	%g7
loop_1318:
	bcc	loop_1319
	movne	%icc,	%l0,	%l2
	wr	%g0,	0x89,	%asi
	sta	%f4,	[%l7 + 0x40] %asi
loop_1319:
	andn	%g6,	%g3,	%o6
	orcc	%i6,	%g5,	%l1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g4,	%i0,	%i2
	ldsh	[%l7 + 0x58],	%l6
	popc	%i3,	%o1
	tle	%xcc,	0x1
	taddcc	%o4,	%i5,	%i1
	ldub	[%l7 + 0x54],	%g1
	alignaddrl	%o0,	%l3,	%l4
	taddcctv	%g2,	%o2,	%o7
	fmovsl	%icc,	%f24,	%f14
	prefetch	[%l7 + 0x7C],	 0x0
	fmovrdgez	%i7,	%f26,	%f16
	movl	%icc,	%i4,	%o3
	bcc,a,pt	%icc,	loop_1320
	fbn	%fcc1,	loop_1321
	ta	%xcc,	0x6
	fmovsgu	%icc,	%f19,	%f29
loop_1320:
	edge8	%o5,	%g7,	%l5
loop_1321:
	udivx	%l2,	0x006B,	%g6
	movg	%xcc,	%g3,	%l0
	add	%l7,	0x40,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i6,	%o6
	array8	%l1,	%g5,	%g4
	flush	%l7 + 0x30
	umul	%i0,	0x080E,	%i2
	fandnot1s	%f9,	%f2,	%f4
	and	%l6,	0x143E,	%o1
	fmul8x16al	%f20,	%f29,	%f30
	fones	%f13
	fmul8sux16	%f2,	%f2,	%f10
	edge16ln	%i3,	%o4,	%i1
	movvs	%xcc,	%i5,	%o0
	bg,pn	%icc,	loop_1322
	edge32n	%g1,	%l3,	%g2
	set	0x40, %l1
	ldda	[%l7 + %l1] 0x10,	%f0
loop_1322:
	mulscc	%o2,	%o7,	%l4
	add	%i7,	0x0A9B,	%o3
	wr	%g0,	0x21,	%asi
	stxa	%i4,	[%g0 + 0x110] %asi
	bvs,pn	%icc,	loop_1323
	alignaddrl	%g7,	%o5,	%l5
	edge32n	%l2,	%g3,	%g6
	tsubcctv	%l0,	0x1703,	%i6
loop_1323:
	xnor	%o6,	0x17A6,	%g5
	xnor	%g4,	0x13CE,	%i0
	umul	%i2,	0x1F89,	%l1
	fnor	%f24,	%f2,	%f26
	xnor	%l6,	0x0994,	%i3
	bvs,a	loop_1324
	fba,a	%fcc2,	loop_1325
	fbu,a	%fcc1,	loop_1326
	movg	%icc,	%o1,	%o4
loop_1324:
	edge32l	%i5,	%i1,	%g1
loop_1325:
	movrne	%o0,	0x09B,	%g2
loop_1326:
	movn	%xcc,	%l3,	%o2
	subcc	%l4,	%i7,	%o7
	call	loop_1327
	sll	%o3,	%g7,	%o5
	edge32n	%i4,	%l2,	%l5
	or	%g6,	0x151F,	%g3
loop_1327:
	sth	%i6,	[%l7 + 0x38]
	fcmpne16	%f14,	%f6,	%o6
	sethi	0x1400,	%l0
	std	%f18,	[%l7 + 0x20]
	fpsub32	%f22,	%f26,	%f14
	sdiv	%g4,	0x1093,	%g5
	set	0x50, %o7
	ldsha	[%l7 + %o7] 0x89,	%i2
	nop
	setx	0x873DC78AA2FC2A8D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xDDD966B61A68F883,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fsubd	%f10,	%f20,	%f2
	movge	%icc,	%i0,	%l1
	movne	%xcc,	%i3,	%o1
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	subccc	%l6,	0x161A,	%i5
	tneg	%icc,	0x5
	bpos,pt	%xcc,	loop_1328
	bshuffle	%f20,	%f20,	%f30
	ba,a,pt	%xcc,	loop_1329
	fbug,a	%fcc0,	loop_1330
loop_1328:
	sub	%i1,	%o4,	%g1
	movcc	%xcc,	%o0,	%g2
loop_1329:
	nop
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x40] %asi,	 0x1
loop_1330:
	fbuge,a	%fcc3,	loop_1331
	nop
	fitod	%f17,	%f16
	xnor	%o2,	%l4,	%o7
	movn	%icc,	%o3,	%g7
loop_1331:
	fands	%f30,	%f2,	%f18
	bneg	loop_1332
	xnorcc	%i7,	%i4,	%o5
	fmovdvc	%icc,	%f24,	%f21
	udiv	%l5,	0x12BD,	%g6
loop_1332:
	bg,pt	%icc,	loop_1333
	fbn,a	%fcc0,	loop_1334
	sethi	0x02A5,	%l2
	edge16	%g3,	%i6,	%o6
loop_1333:
	and	%l0,	%g5,	%i2
loop_1334:
	subc	%i0,	%g4,	%i3
	array8	%l1,	%l6,	%o1
	movrne	%i1,	0x102,	%o4
	movre	%g1,	0x079,	%o0
	mova	%icc,	%i5,	%g2
	set	0x60, %o5
	stxa	%l3,	[%l7 + %o5] 0xea
	membar	#Sync
	movvc	%icc,	%l4,	%o2
	fmovsleu	%icc,	%f21,	%f12
	addc	%o3,	%o7,	%i7
	fpsub32s	%f17,	%f11,	%f11
	wr	%g0,	0x80,	%asi
	stxa	%g7,	[%l7 + 0x28] %asi
	fcmple32	%f24,	%f10,	%o5
	movrlez	%l5,	0x307,	%i4
	wr	%g0,	0x27,	%asi
	stba	%g6,	[%l7 + 0x4B] %asi
	membar	#Sync
	subccc	%g3,	0x1542,	%l2
	fmovsleu	%icc,	%f30,	%f27
	tcs	%icc,	0x4
	movleu	%xcc,	%i6,	%o6
	fmovrdgz	%g5,	%f26,	%f6
	addcc	%i2,	0x1F45,	%i0
	nop
	setx	0x738F5CBA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x8BCA09BC,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fdivs	%f16,	%f14,	%f19
	movleu	%xcc,	%l0,	%i3
	edge8	%g4,	%l6,	%l1
	andncc	%o1,	%o4,	%g1
	bgu,a	%xcc,	loop_1335
	or	%i1,	%i5,	%o0
	move	%icc,	%g2,	%l4
	movneg	%xcc,	%o2,	%o3
loop_1335:
	tleu	%xcc,	0x7
	andcc	%o7,	0x1F4A,	%l3
	fbue	%fcc0,	loop_1336
	edge8n	%i7,	%g7,	%o5
	fornot1	%f16,	%f8,	%f24
	mulscc	%l5,	0x05B9,	%g6
loop_1336:
	tle	%xcc,	0x1
	udiv	%g3,	0x1267,	%i4
	srl	%l2,	%o6,	%i6
	sir	0x0C73
	edge8ln	%g5,	%i2,	%l0
	fpsub16	%f20,	%f8,	%f6
	movre	%i0,	%g4,	%i3
	orncc	%l6,	0x0566,	%l1
	movcc	%xcc,	%o4,	%g1
	membar	0x4C
	taddcctv	%o1,	%i1,	%o0
	tle	%xcc,	0x3
	umulcc	%i5,	0x0E1C,	%g2
	tleu	%xcc,	0x5
	tsubcctv	%o2,	%l4,	%o7
	membar	0x06
	fands	%f15,	%f12,	%f10
	movvc	%xcc,	%o3,	%l3
	fzero	%f20
	fcmpne16	%f14,	%f4,	%i7
	nop
	setx	loop_1337,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sdivx	%g7,	0x05C9,	%l5
	st	%f11,	[%l7 + 0x70]
	movpos	%icc,	%g6,	%o5
loop_1337:
	xorcc	%i4,	%g3,	%o6
	andn	%l2,	%i6,	%i2
	edge8ln	%g5,	%l0,	%i0
	fbe,a	%fcc1,	loop_1338
	fnegd	%f20,	%f0
	fmovdl	%xcc,	%f26,	%f24
	nop
	setx loop_1339, %l0, %l1
	jmpl %l1, %g4
loop_1338:
	array8	%i3,	%l6,	%o4
	edge32ln	%g1,	%o1,	%l1
	membar	0x0C
loop_1339:
	tvs	%xcc,	0x5
	lduh	[%l7 + 0x3E],	%i1
	lduh	[%l7 + 0x62],	%i5
	movn	%xcc,	%g2,	%o0
	movrgez	%l4,	0x1A4,	%o2
	edge16ln	%o3,	%o7,	%i7
	taddcctv	%l3,	0x1838,	%g7
	sll	%g6,	0x17,	%l5
	addccc	%o5,	%i4,	%o6
	udivcc	%g3,	0x115F,	%i6
	alignaddr	%l2,	%g5,	%i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l0,	%i0
	fzeros	%f14
	mulx	%i3,	0x051F,	%l6
	fbu	%fcc0,	loop_1340
	or	%g4,	%g1,	%o1
	tne	%xcc,	0x1
	tne	%icc,	0x0
loop_1340:
	andcc	%l1,	%i1,	%i5
	movrne	%g2,	0x1CD,	%o4
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x20] %asi,	%o0
	nop
	fitos	%f2,	%f30
	fzeros	%f31
	sub	%o2,	0x109E,	%o3
	bgu,pn	%icc,	loop_1341
	ldstub	[%l7 + 0x6A],	%o7
	tcs	%icc,	0x4
	fmovd	%f0,	%f30
loop_1341:
	membar	0x2E
	add	%l7,	0x18,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] %asi,	%l4,	%l3
	bn,pt	%xcc,	loop_1342
	udivx	%i7,	0x1B1B,	%g7
	edge8l	%g6,	%o5,	%l5
	mulx	%i4,	%o6,	%g3
loop_1342:
	fnor	%f24,	%f16,	%f0
	move	%icc,	%i6,	%l2
	movrlz	%i2,	0x198,	%l0
	array32	%g5,	%i3,	%l6
	swap	[%l7 + 0x34],	%g4
	wr	%g0,	0x10,	%asi
	ldstuba	[%l7 + 0x26] %asi,	%g1
	addccc	%i0,	0x0FCD,	%o1
	udiv	%i1,	0x0CF7,	%l1
	fblg	%fcc3,	loop_1343
	fpack32	%f24,	%f12,	%f20
	bvs	%icc,	loop_1344
	brz	%g2,	loop_1345
loop_1343:
	and	%i5,	0x0918,	%o4
	stx	%o0,	[%l7 + 0x50]
loop_1344:
	ldub	[%l7 + 0x3A],	%o2
loop_1345:
	ba	%xcc,	loop_1346
	fxors	%f2,	%f8,	%f3
	sub	%o7,	0x0AAD,	%l4
	fmovscs	%xcc,	%f25,	%f23
loop_1346:
	fbu,a	%fcc1,	loop_1347
	bcs,a,pn	%icc,	loop_1348
	membar	0x2E
	ldsw	[%l7 + 0x20],	%o3
loop_1347:
	sethi	0x1003,	%l3
loop_1348:
	fpadd32	%f22,	%f10,	%f18
	sub	%g7,	0x1006,	%i7
	movle	%xcc,	%g6,	%o5
	sra	%i4,	%l5,	%o6
	fornot1s	%f1,	%f25,	%f10
	popc	%g3,	%l2
	fandnot1	%f6,	%f26,	%f20
	smulcc	%i6,	%l0,	%i2
	swap	[%l7 + 0x68],	%i3
	edge32n	%g5,	%l6,	%g4
	taddcc	%g1,	%i0,	%i1
	fpadd32	%f2,	%f20,	%f0
	wr	%g0,	0x2a,	%asi
	stba	%l1,	[%l7 + 0x77] %asi
	membar	#Sync
	membar	0x60
	sub	%o1,	%g2,	%o4
	bpos,a,pt	%icc,	loop_1349
	addcc	%o0,	%o2,	%o7
	movne	%icc,	%l4,	%o3
	set	0x64, %i6
	stwa	%i5,	[%l7 + %i6] 0x11
loop_1349:
	fcmple16	%f16,	%f0,	%l3
	bvs,pt	%xcc,	loop_1350
	movpos	%xcc,	%g7,	%g6
	tn	%icc,	0x2
	be,a,pt	%icc,	loop_1351
loop_1350:
	subc	%i7,	0x197D,	%o5
	edge8	%i4,	%o6,	%g3
	ta	%xcc,	0x1
loop_1351:
	movpos	%icc,	%l2,	%i6
	fmovrsgez	%l0,	%f9,	%f9
	tn	%icc,	0x1
	fzeros	%f31
	movle	%icc,	%l5,	%i2
	prefetch	[%l7 + 0x68],	 0x0
	tl	%xcc,	0x0
	sth	%i3,	[%l7 + 0x4A]
	alignaddr	%g5,	%g4,	%g1
	tg	%icc,	0x4
	movgu	%xcc,	%i0,	%i1
	movn	%xcc,	%l6,	%o1
	subc	%l1,	%o4,	%g2
	add	%o2,	0x1771,	%o0
	bn,a	%xcc,	loop_1352
	sra	%o7,	0x04,	%o3
	udivx	%i5,	0x056A,	%l3
	set	0x40, %l6
	ldswa	[%l7 + %l6] 0x15,	%g7
loop_1352:
	te	%icc,	0x3
	fbg	%fcc3,	loop_1353
	subc	%g6,	%i7,	%l4
	subc	%i4,	%o5,	%g3
	nop
	setx	0xEDAF5F1B6FA9F1F4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4DE09872A58E10C0,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f24,	%f0
loop_1353:
	bvs,a	loop_1354
	udiv	%o6,	0x080E,	%l2
	fornot2	%f8,	%f16,	%f2
	edge8ln	%l0,	%i6,	%i2
loop_1354:
	bcs,a	loop_1355
	edge8ln	%i3,	%g5,	%g4
	nop
	fitos	%f4,	%f5
	fstoi	%f5,	%f20
	ldd	[%l7 + 0x08],	%f4
loop_1355:
	nop
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g1
	sdiv	%i0,	0x0025,	%l5
	tn	%xcc,	0x0
	bg	loop_1356
	edge8	%l6,	%o1,	%l1
	orcc	%i1,	0x1489,	%g2
	sdivcc	%o2,	0x0DAB,	%o4
loop_1356:
	sir	0x01C9
	tpos	%xcc,	0x3
	tsubcctv	%o0,	%o7,	%i5
	udivx	%o3,	0x0C32,	%g7
	set	0x70, %g7
	stha	%l3,	[%l7 + %g7] 0x15
	sdiv	%g6,	0x06C0,	%l4
	fbge,a	%fcc3,	loop_1357
	xorcc	%i7,	0x0DF7,	%i4
	movvs	%icc,	%g3,	%o6
	tcs	%xcc,	0x5
loop_1357:
	fnands	%f20,	%f22,	%f16
	xor	%o5,	%l0,	%i6
	movgu	%icc,	%i2,	%i3
	tleu	%xcc,	0x3
	edge16n	%l2,	%g5,	%g4
	addccc	%i0,	%l5,	%l6
	fzeros	%f0
	srl	%g1,	%l1,	%o1
	xnorcc	%g2,	%o2,	%o4
	edge8	%i1,	%o0,	%i5
	movvc	%xcc,	%o7,	%o3
	ld	[%l7 + 0x68],	%f22
	fpadd16	%f6,	%f26,	%f14
	movrlez	%l3,	%g6,	%g7
	fornot1s	%f28,	%f15,	%f3
	stbar
	add	%l7,	0x30,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x89,	%l4,	%i7
	fble,a	%fcc0,	loop_1358
	brlz	%g3,	loop_1359
	fmovsle	%icc,	%f14,	%f13
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x48] %asi,	%o6
loop_1358:
	fmovsg	%xcc,	%f29,	%f5
loop_1359:
	tge	%icc,	0x0
	nop
	setx	0x7855DB3586F76695,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xF097479BAD52CE1C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f16,	%f12
	fpadd32	%f22,	%f22,	%f6
	fmovrslz	%o5,	%f3,	%f7
	sdiv	%l0,	0x07F3,	%i6
	fmovdcc	%xcc,	%f7,	%f12
	srax	%i4,	%i2,	%i3
	fmovsne	%xcc,	%f19,	%f21
	sdivcc	%l2,	0x065B,	%g4
	and	%i0,	%g5,	%l5
	call	loop_1360
	be,pt	%icc,	loop_1361
	st	%f5,	[%l7 + 0x24]
	nop
	setx	0xFB3E4EBF3C9D7959,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xB4B4779F6797A637,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f22,	%f22
loop_1360:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x53] %asi,	%l6
loop_1361:
	sdivcc	%l1,	0x18F6,	%o1
	nop
	fitos	%f18,	%f19
	edge16ln	%g1,	%o2,	%g2
	bleu,a	%icc,	loop_1362
	movgu	%icc,	%i1,	%o0
	array8	%i5,	%o4,	%o7
	movl	%icc,	%l3,	%g6
loop_1362:
	edge8n	%o3,	%l4,	%g7
	tl	%icc,	0x7
	smulcc	%i7,	0x12A4,	%o6
	xorcc	%g3,	0x1009,	%l0
	umulcc	%o5,	0x0CE4,	%i6
	movre	%i2,	0x2C6,	%i3
	tle	%xcc,	0x2
	alignaddrl	%i4,	%g4,	%l2
	fmovrdne	%g5,	%f2,	%f10
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x1B] %asi,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x081B
	xnor	%i0,	%l6,	%l1
	tn	%xcc,	0x2
	tsubcc	%o1,	0x055C,	%o2
	fcmpne16	%f0,	%f22,	%g2
	fzero	%f10
	set	0x1D, %i4
	ldstuba	[%l7 + %i4] 0x11,	%i1
	subc	%o0,	0x109B,	%g1
	fzeros	%f7
	bgu,a	loop_1363
	xor	%i5,	0x08C5,	%o7
	alignaddrl	%o4,	%l3,	%o3
	subc	%l4,	%g6,	%g7
loop_1363:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%o6,	%i7
	fmovrdlz	%g3,	%f4,	%f0
	move	%icc,	%l0,	%i6
	mova	%xcc,	%i2,	%i3
	fmovsl	%icc,	%f25,	%f28
	stbar
	stbar
	tsubcc	%i4,	%g4,	%o5
	fornot1s	%f16,	%f21,	%f5
	array32	%l2,	%l5,	%g5
	umulcc	%l6,	0x1D46,	%i0
	tl	%icc,	0x2
	xorcc	%o1,	0x0945,	%o2
	fmovsvc	%xcc,	%f16,	%f26
	tsubcctv	%g2,	%i1,	%o0
	sethi	0x0EB3,	%g1
	fands	%f15,	%f8,	%f29
	subc	%i5,	0x07E1,	%o7
	edge16n	%l1,	%l3,	%o3
	fbue	%fcc1,	loop_1364
	edge8n	%l4,	%o4,	%g6
	orn	%o6,	%i7,	%g3
	tle	%icc,	0x2
loop_1364:
	brlz,a	%g7,	loop_1365
	andcc	%l0,	0x0A11,	%i6
	fba,a	%fcc0,	loop_1366
	fmovdcs	%xcc,	%f28,	%f31
loop_1365:
	movgu	%xcc,	%i3,	%i4
	addcc	%i2,	%o5,	%l2
loop_1366:
	fmovdvs	%icc,	%f29,	%f6
	add	%g4,	0x1452,	%l5
	ldub	[%l7 + 0x75],	%l6
	sethi	0x14B3,	%g5
	sir	0x0E6E
	lduh	[%l7 + 0x18],	%o1
	edge32	%i0,	%g2,	%o2
	movne	%icc,	%o0,	%i1
	sdiv	%i5,	0x1D83,	%o7
	sllx	%l1,	%l3,	%g1
	ld	[%l7 + 0x08],	%f3
	fmovsa	%icc,	%f2,	%f16
	popc	0x11F8,	%l4
	fmovs	%f10,	%f22
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x38] %asi,	%o4
	movge	%xcc,	%o3,	%o6
	subcc	%i7,	%g6,	%g7
	bn,a,pn	%icc,	loop_1367
	move	%icc,	%g3,	%l0
	orn	%i6,	0x0769,	%i3
	mova	%icc,	%i2,	%i4
loop_1367:
	fbn,a	%fcc0,	loop_1368
	movneg	%icc,	%o5,	%l2
	fmovsn	%icc,	%f22,	%f30
	sdiv	%l5,	0x1A55,	%l6
loop_1368:
	fxor	%f28,	%f30,	%f28
	fmovrdne	%g4,	%f8,	%f0
	bne,a	%xcc,	loop_1369
	subc	%o1,	0x116B,	%i0
	popc	%g2,	%g5
	bgu,a	loop_1370
loop_1369:
	subccc	%o0,	0x0B8E,	%i1
	xnor	%i5,	%o7,	%o2
	tle	%icc,	0x3
loop_1370:
	movre	%l1,	%g1,	%l3
	movn	%icc,	%l4,	%o4
	movleu	%xcc,	%o3,	%o6
	orncc	%i7,	%g6,	%g3
	wr	%g0,	0x80,	%asi
	stha	%l0,	[%l7 + 0x34] %asi
	bvc	%icc,	loop_1371
	sir	0x0105
	bneg	%xcc,	loop_1372
	membar	0x3B
loop_1371:
	edge8ln	%i6,	%i3,	%i2
	mova	%icc,	%g7,	%i4
loop_1372:
	ta	%xcc,	0x6
	movrne	%o5,	0x0F5,	%l2
	fbne	%fcc2,	loop_1373
	tvs	%xcc,	0x2
	alignaddrl	%l5,	%l6,	%g4
	array8	%i0,	%g2,	%g5
loop_1373:
	fpadd32	%f2,	%f2,	%f28
	sir	0x0DDA
	udiv	%o0,	0x1CDE,	%i1
	ldsb	[%l7 + 0x2F],	%i5
	tn	%xcc,	0x6
	mulscc	%o7,	0x0DB9,	%o2
	popc	%l1,	%g1
	set	0x68, %o4
	ldxa	[%l7 + %o4] 0x14,	%o1
	nop
	fitos	%f8,	%f10
	fstox	%f10,	%f18
	fpadd32	%f2,	%f16,	%f30
	set	0x4C, %l5
	lda	[%l7 + %l5] 0x15,	%f31
	te	%xcc,	0x2
	mulscc	%l4,	%l3,	%o4
	fbul,a	%fcc1,	loop_1374
	sub	%o6,	%o3,	%g6
	array32	%i7,	%l0,	%g3
	sllx	%i3,	0x07,	%i2
loop_1374:
	bvs,pt	%xcc,	loop_1375
	subcc	%g7,	0x11CB,	%i6
	tcs	%icc,	0x0
	ta	%icc,	0x1
loop_1375:
	fmovdle	%xcc,	%f9,	%f23
	bvs,a	%xcc,	loop_1376
	orncc	%o5,	0x035B,	%i4
	nop
	setx loop_1377, %l0, %l1
	jmpl %l1, %l5
	fsrc2s	%f13,	%f6
loop_1376:
	ldstub	[%l7 + 0x30],	%l6
	subc	%l2,	0x0CE4,	%g4
loop_1377:
	sll	%g2,	0x04,	%g5
	bl,a	%icc,	loop_1378
	edge8	%o0,	%i0,	%i5
	call	loop_1379
	array8	%i1,	%o7,	%l1
loop_1378:
	xnor	%g1,	%o2,	%l4
	fmuld8sux16	%f2,	%f10,	%f10
loop_1379:
	movrne	%o1,	0x2DD,	%o4
	andn	%o6,	%o3,	%g6
	fmovdl	%xcc,	%f20,	%f3
	ldd	[%l7 + 0x08],	%l2
	edge32ln	%l0,	%g3,	%i3
	fba,a	%fcc3,	loop_1380
	movleu	%icc,	%i2,	%g7
	tvc	%icc,	0x3
	fmovsvs	%xcc,	%f17,	%f19
loop_1380:
	add	%i7,	0x0806,	%o5
	set	0x1A, %g3
	ldsba	[%l7 + %g3] 0x89,	%i6
	udivx	%l5,	0x187F,	%i4
	tvs	%xcc,	0x2
	edge16l	%l2,	%g4,	%g2
	tge	%xcc,	0x7
	move	%icc,	%g5,	%o0
	stb	%i0,	[%l7 + 0x68]
	movrgz	%i5,	0x17F,	%i1
	fblg	%fcc3,	loop_1381
	xor	%l6,	0x1657,	%o7
	udivx	%g1,	0x0119,	%l1
	tgu	%icc,	0x7
loop_1381:
	call	loop_1382
	orcc	%o2,	0x0734,	%l4
	bvs	loop_1383
	array16	%o1,	%o6,	%o4
loop_1382:
	ta	%xcc,	0x2
	udivcc	%o3,	0x0468,	%g6
loop_1383:
	movge	%icc,	%l0,	%l3
	fmovdn	%icc,	%f19,	%f13
	ld	[%l7 + 0x18],	%f7
	sll	%i3,	%g3,	%g7
	fbe,a	%fcc1,	loop_1384
	xnor	%i7,	0x1D85,	%i2
	tne	%icc,	0x7
	fmovsne	%icc,	%f31,	%f1
loop_1384:
	flush	%l7 + 0x70
	tcc	%icc,	0x3
	fmovrdne	%o5,	%f20,	%f0
	fnot2	%f10,	%f4
	movpos	%icc,	%i6,	%i4
	sub	%l5,	0x0719,	%l2
	subcc	%g2,	%g5,	%g4
	movcs	%xcc,	%o0,	%i5
	fbne,a	%fcc3,	loop_1385
	fmovdpos	%xcc,	%f24,	%f30
	tpos	%xcc,	0x0
	edge16l	%i1,	%l6,	%i0
loop_1385:
	fmovdn	%xcc,	%f22,	%f22
	edge32l	%o7,	%l1,	%g1
	brnz,a	%l4,	loop_1386
	tle	%xcc,	0x5
	tpos	%icc,	0x0
	swap	[%l7 + 0x30],	%o2
loop_1386:
	orn	%o6,	%o4,	%o1
	fblg	%fcc2,	loop_1387
	fmovdneg	%xcc,	%f4,	%f12
	movrgez	%g6,	0x103,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1387:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f26,	%f6
	fble,a	%fcc2,	loop_1388
	edge16	%l3,	%i3,	%o3
	ldub	[%l7 + 0x14],	%g7
	ta	%xcc,	0x2
loop_1388:
	nop
	set	0x48, %l2
	ldsha	[%l7 + %l2] 0x88,	%g3
	array16	%i2,	%i7,	%o5
	membar	0x4F
	edge16n	%i6,	%l5,	%i4
	movre	%g2,	%g5,	%l2
	edge32n	%g4,	%o0,	%i1
	swap	[%l7 + 0x7C],	%l6
	fmovdvs	%icc,	%f13,	%f10
	fcmple16	%f26,	%f20,	%i5
	bvs,a,pt	%xcc,	loop_1389
	nop
	fitos	%f8,	%f7
	fstox	%f7,	%f18
	edge8	%o7,	%i0,	%g1
	fpadd16	%f14,	%f26,	%f28
loop_1389:
	fmovrsne	%l4,	%f7,	%f11
	fmovdge	%xcc,	%f3,	%f8
	smul	%l1,	0x0F7B,	%o2
	tge	%icc,	0x2
	srlx	%o4,	%o1,	%g6
	tle	%xcc,	0x4
	ldx	[%l7 + 0x08],	%l0
	brlz	%o6,	loop_1390
	fbn	%fcc0,	loop_1391
	andn	%i3,	0x0139,	%l3
	fbg	%fcc0,	loop_1392
loop_1390:
	orncc	%g7,	%o3,	%g3
loop_1391:
	tcs	%xcc,	0x1
	ba,a,pn	%icc,	loop_1393
loop_1392:
	tcs	%xcc,	0x6
	flush	%l7 + 0x50
	fbl	%fcc2,	loop_1394
loop_1393:
	tsubcc	%i2,	%i7,	%o5
	edge32	%i6,	%i4,	%l5
	ta	%xcc,	0x1
loop_1394:
	fbge,a	%fcc2,	loop_1395
	fbg,a	%fcc1,	loop_1396
	nop
	setx	0xF0456E1D,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	fbue,a	%fcc2,	loop_1397
loop_1395:
	fpackfix	%f30,	%f18
loop_1396:
	fbe,a	%fcc0,	loop_1398
	andncc	%g2,	%g5,	%l2
loop_1397:
	tn	%xcc,	0x4
	fbue,a	%fcc0,	loop_1399
loop_1398:
	orncc	%g4,	0x0FD9,	%o0
	ld	[%l7 + 0x38],	%f28
	sra	%i1,	0x0A,	%l6
loop_1399:
	taddcctv	%i5,	%i0,	%o7
	tsubcctv	%g1,	%l4,	%l1
	edge8n	%o2,	%o1,	%g6
	fmovdpos	%icc,	%f30,	%f4
	fcmpeq16	%f4,	%f4,	%o4
	andcc	%l0,	%o6,	%l3
	brgz,a	%i3,	loop_1400
	movcs	%icc,	%g7,	%o3
	mulx	%g3,	%i7,	%o5
	fmovrsgz	%i2,	%f4,	%f29
loop_1400:
	ldub	[%l7 + 0x63],	%i4
	edge16ln	%i6,	%g2,	%l5
	fmovrsne	%g5,	%f26,	%f21
	fbu	%fcc1,	loop_1401
	bcs,pt	%icc,	loop_1402
	edge32n	%g4,	%o0,	%i1
	tcc	%icc,	0x0
loop_1401:
	or	%l6,	%l2,	%i5
loop_1402:
	fnegs	%f23,	%f10
	bvs,pn	%icc,	loop_1403
	subcc	%i0,	0x0563,	%g1
	fmovdvs	%icc,	%f11,	%f15
	add	%l7,	0x28,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%l4
	casa	[%l6] 0x18,	%l4,	%o7
loop_1403:
	fbl,a	%fcc1,	loop_1404
	umulcc	%l1,	%o2,	%o1
	tle	%xcc,	0x1
	fmovdneg	%xcc,	%f15,	%f29
loop_1404:
	srlx	%g6,	%l0,	%o4
	bge	%xcc,	loop_1405
	fmovrsgz	%l3,	%f25,	%f29
	wr	%g0,	0x19,	%asi
	sta	%f30,	[%l7 + 0x08] %asi
loop_1405:
	movleu	%xcc,	%o6,	%g7
	add	%i3,	%o3,	%g3
	fpadd16s	%f5,	%f12,	%f8
	andn	%i7,	0x09F7,	%i2
	andcc	%o5,	0x164F,	%i4
	tvs	%icc,	0x4
	movg	%icc,	%i6,	%g2
	movle	%icc,	%g5,	%g4
	fmul8sux16	%f20,	%f6,	%f4
	subcc	%l5,	0x11DE,	%o0
	srl	%l6,	%i1,	%l2
	fmovdne	%icc,	%f17,	%f16
	alignaddrl	%i5,	%i0,	%g1
	movle	%icc,	%o7,	%l4
	set	0x48, %i0
	stxa	%o2,	[%l7 + %i0] 0x2a
	membar	#Sync
	sll	%l1,	%o1,	%g6
	orn	%l0,	0x0688,	%o4
	movvs	%xcc,	%l3,	%o6
	xorcc	%g7,	%i3,	%o3
	sir	0x0ADC
	fpadd32	%f2,	%f30,	%f20
	popc	%i7,	%i2
	fmovsleu	%icc,	%f0,	%f18
	movvc	%xcc,	%o5,	%i4
	andn	%g3,	%g2,	%i6
	movrlez	%g4,	0x140,	%l5
	smul	%o0,	0x0DA1,	%g5
	brlez	%i1,	loop_1406
	sra	%l2,	%l6,	%i0
	andn	%i5,	%g1,	%l4
	movcs	%icc,	%o2,	%l1
loop_1406:
	ldsh	[%l7 + 0x6A],	%o7
	for	%f12,	%f28,	%f10
	movgu	%xcc,	%g6,	%o1
	add	%o4,	%l3,	%l0
	umul	%o6,	%g7,	%o3
	tpos	%icc,	0x5
	bcs	loop_1407
	fnot1s	%f3,	%f10
	smul	%i7,	%i3,	%i2
	movge	%icc,	%o5,	%i4
loop_1407:
	fxnor	%f24,	%f24,	%f26
	bn,a	loop_1408
	nop
	setx	0x796E484E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f28
	set	0x72, %i7
	stba	%g3,	[%l7 + %i7] 0x27
	membar	#Sync
loop_1408:
	fbue,a	%fcc2,	loop_1409
	edge16l	%i6,	%g4,	%g2
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	lda	[%l6] %asi,	%l5
	casa	[%l6] %asi,	%l5,	%g5
loop_1409:
	bn,a,pn	%xcc,	loop_1410
	srax	%i1,	0x1F,	%l2
	udivx	%o0,	0x0F74,	%i0
	popc	0x1524,	%l6
loop_1410:
	fblg,a	%fcc1,	loop_1411
	tg	%xcc,	0x5
	edge32ln	%i5,	%g1,	%o2
	movneg	%icc,	%l1,	%l4
loop_1411:
	movg	%icc,	%g6,	%o7
	fmovdge	%icc,	%f13,	%f9
	andncc	%o1,	%o4,	%l3
	alignaddr	%o6,	%l0,	%g7
	edge8l	%o3,	%i7,	%i2
	movpos	%icc,	%i3,	%o5
	orncc	%i4,	0x1C56,	%g3
	subc	%g4,	%g2,	%l5
	mulx	%g5,	%i6,	%l2
	array8	%o0,	%i1,	%l6
	mulx	%i0,	%g1,	%o2
	movle	%icc,	%l1,	%i5
	fmovdpos	%icc,	%f2,	%f21
	fsrc1	%f8,	%f0
	tpos	%icc,	0x3
	movge	%icc,	%g6,	%l4
	addcc	%o1,	%o7,	%o4
	brz,a	%l3,	loop_1412
	fmovdcs	%icc,	%f2,	%f7
	brlz,a	%l0,	loop_1413
	movrlez	%o6,	%o3,	%i7
loop_1412:
	brgz	%i2,	loop_1414
	taddcctv	%i3,	0x033C,	%o5
loop_1413:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%g7,	%f1,	%f27
loop_1414:
	fble	%fcc3,	loop_1415
	fpsub32s	%f10,	%f3,	%f19
	fmul8x16al	%f29,	%f30,	%f30
	orn	%g3,	%i4,	%g2
loop_1415:
	tne	%icc,	0x0
	wr	%g0,	0xf1,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	fcmple16	%f6,	%f30,	%g4
	fbge,a	%fcc2,	loop_1416
	fmovdle	%xcc,	%f23,	%f13
	movl	%xcc,	%g5,	%l5
	wr	%g0,	0x81,	%asi
	lduha	[%l7 + 0x60] %asi,	%i6
loop_1416:
	sub	%o0,	%i1,	%l2
	movgu	%xcc,	%l6,	%i0
	for	%f16,	%f14,	%f16
	and	%g1,	%o2,	%i5
	fbn	%fcc2,	loop_1417
	addcc	%g6,	0x1A62,	%l4
	movne	%xcc,	%o1,	%l1
	edge8n	%o4,	%l3,	%o7
loop_1417:
	fmovdcs	%xcc,	%f15,	%f7
	bpos,pn	%icc,	loop_1418
	nop
	setx	0x5CC2C3561044EF70,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1418:
	brz,a	%o6,	loop_1419
	fnands	%f22,	%f15,	%f5
	udivx	%l0,	0x0BA6,	%o3
	edge32n	%i7,	%i2,	%o5
loop_1419:
	fmul8x16	%f8,	%f10,	%f14
	brlez,a	%g7,	loop_1420
	popc	%g3,	%i4
	tle	%xcc,	0x5
	addc	%i3,	%g2,	%g5
loop_1420:
	fble,a	%fcc0,	loop_1421
	ldx	[%l7 + 0x20],	%g4
	move	%icc,	%i6,	%l5
	bn,a	%icc,	loop_1422
loop_1421:
	umulcc	%o0,	0x04C0,	%i1
	xnor	%l6,	0x1DA6,	%l2
	movge	%xcc,	%g1,	%o2
loop_1422:
	movrlz	%i5,	%i0,	%l4
	set	0x7C, %g1
	ldswa	[%l7 + %g1] 0x81,	%g6
	set	0x48, %g6
	sta	%f20,	[%l7 + %g6] 0x10
	sethi	0x18F2,	%o1
	movgu	%icc,	%o4,	%l3
	movgu	%xcc,	%o7,	%o6
	movpos	%icc,	%l1,	%l0
	fabss	%f30,	%f14
	alignaddrl	%i7,	%i2,	%o5
	movrne	%g7,	%o3,	%i4
	fmovrsne	%i3,	%f19,	%f24
	nop
	fitod	%f12,	%f4
	fdtoi	%f4,	%f14
	udivcc	%g2,	0x06D5,	%g5
	tcc	%xcc,	0x2
	fsrc2	%f20,	%f28
	fmovsvs	%icc,	%f10,	%f6
	edge16l	%g3,	%g4,	%l5
	set	0x78, %o2
	stwa	%i6,	[%l7 + %o2] 0xe3
	membar	#Sync
	movvc	%icc,	%i1,	%o0
	ta	%icc,	0x5
	fcmpne16	%f8,	%f26,	%l2
	fnor	%f12,	%f0,	%f6
	addc	%g1,	0x1CAA,	%l6
	orn	%i5,	%i0,	%o2
	andcc	%g6,	0x1728,	%l4
	fmovsgu	%icc,	%f27,	%f31
	sllx	%o1,	%l3,	%o4
	array16	%o7,	%o6,	%l0
	movrne	%i7,	0x162,	%l1
	fmovsneg	%xcc,	%f25,	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbne	%fcc0,	loop_1423
	fmovdleu	%xcc,	%f7,	%f0
	tl	%icc,	0x1
	tcs	%icc,	0x1
loop_1423:
	movvc	%xcc,	%o5,	%i2
	fmovdge	%xcc,	%f2,	%f14
	move	%xcc,	%o3,	%g7
	taddcc	%i3,	%g2,	%i4
	sub	%g5,	%g4,	%l5
	xnor	%i6,	%i1,	%g3
	set	0x78, %o1
	lda	[%l7 + %o1] 0x81,	%f8
	fcmpeq32	%f8,	%f2,	%l2
	fmovrslez	%o0,	%f30,	%f26
	sub	%l6,	%g1,	%i0
	tsubcc	%o2,	%g6,	%l4
	edge32n	%i5,	%o1,	%l3
	edge8ln	%o4,	%o6,	%o7
	sdiv	%i7,	0x11C2,	%l1
	nop
	fitos	%f2,	%f3
	fstox	%f3,	%f16
	fxtos	%f16,	%f23
	sdivcc	%o5,	0x091C,	%l0
	ldx	[%l7 + 0x30],	%i2
	srl	%g7,	%i3,	%o3
	brgez,a	%i4,	loop_1424
	ldd	[%l7 + 0x18],	%g2
	edge8ln	%g4,	%g5,	%i6
	andcc	%l5,	%g3,	%l2
loop_1424:
	stb	%o0,	[%l7 + 0x22]
	sdivcc	%i1,	0x17AD,	%g1
	fmovdvc	%icc,	%f17,	%f8
	fmul8x16au	%f1,	%f10,	%f16
	bne,a,pn	%xcc,	loop_1425
	addcc	%l6,	0x1DBC,	%o2
	orcc	%g6,	0x01E7,	%l4
	flush	%l7 + 0x20
loop_1425:
	bge,a,pn	%icc,	loop_1426
	mova	%xcc,	%i0,	%i5
	fmovrslez	%o1,	%f4,	%f14
	sir	0x09DC
loop_1426:
	brz,a	%l3,	loop_1427
	tsubcc	%o6,	0x1F58,	%o7
	fnors	%f22,	%f15,	%f9
	taddcc	%o4,	%i7,	%l1
loop_1427:
	movrlz	%o5,	%l0,	%g7
	smulcc	%i3,	0x1C96,	%i2
	sethi	0x1E64,	%o3
	taddcctv	%i4,	0x07F8,	%g2
	bcc,pt	%xcc,	loop_1428
	nop
	setx	0x5A4AD55DCB0A3D06,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xDEE01E70EC0AB3DB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f6,	%f22
	sir	0x1AA2
	orncc	%g4,	0x17ED,	%g5
loop_1428:
	ldd	[%l7 + 0x10],	%f24
	fxnors	%f1,	%f9,	%f17
	fmovdgu	%xcc,	%f19,	%f24
	fbule	%fcc2,	loop_1429
	fornot2s	%f20,	%f6,	%f29
	fmovd	%f10,	%f16
	move	%icc,	%i6,	%g3
loop_1429:
	ldx	[%l7 + 0x20],	%l2
	fbug,a	%fcc0,	loop_1430
	movcs	%icc,	%o0,	%i1
	sra	%l5,	0x1B,	%l6
	fmul8x16al	%f25,	%f16,	%f12
loop_1430:
	udiv	%g1,	0x05BF,	%g6
	fmovsg	%icc,	%f17,	%f5
	movpos	%xcc,	%o2,	%l4
	fbug	%fcc1,	loop_1431
	edge8	%i0,	%o1,	%i5
	te	%xcc,	0x1
	ldub	[%l7 + 0x7F],	%o6
loop_1431:
	srax	%o7,	0x00,	%o4
	alignaddr	%l3,	%l1,	%o5
	lduw	[%l7 + 0x58],	%l0
	add	%l7,	0x60,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i7,	%i3
	tcs	%xcc,	0x6
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x68] %asi,	%i2
	movg	%xcc,	%g7,	%o3
	fpsub32s	%f31,	%f19,	%f2
	movrlz	%g2,	0x260,	%i4
	movgu	%xcc,	%g4,	%i6
	nop
	setx	0x4362C8701A2B7865,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xEFD69F04861A6CA4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f12
	fmuld	%f12,	%f2,	%f10
	popc	0x156E,	%g5
	srl	%l2,	%g3,	%o0
	fbg	%fcc2,	loop_1432
	bpos,a,pn	%icc,	loop_1433
	fmovsvs	%icc,	%f3,	%f24
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1432:
	bgu,pn	%icc,	loop_1434
loop_1433:
	te	%icc,	0x5
	udivx	%i1,	0x063E,	%l5
	andn	%g1,	%g6,	%l6
loop_1434:
	sra	%l4,	0x0E,	%o2
	flush	%l7 + 0x18
	fmul8sux16	%f16,	%f4,	%f26
	movge	%icc,	%i0,	%i5
	xnorcc	%o6,	%o7,	%o4
	set	0x68, %i3
	prefetcha	[%l7 + %i3] 0x0c,	 0x3
	movcs	%xcc,	%l1,	%o5
	wr	%g0,	0xe2,	%asi
	stba	%l0,	[%l7 + 0x2C] %asi
	membar	#Sync
	fsrc2	%f8,	%f0
	movrlez	%i7,	%o1,	%i2
	edge32	%g7,	%o3,	%g2
	array32	%i4,	%g4,	%i6
	addc	%i3,	0x0253,	%g5
	movrlz	%l2,	%g3,	%o0
	bcc,a	%xcc,	loop_1435
	andn	%i1,	%g1,	%g6
	edge8l	%l5,	%l4,	%o2
	array32	%l6,	%i5,	%i0
loop_1435:
	brlez,a	%o7,	loop_1436
	fandnot1s	%f30,	%f1,	%f5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o4,	%l3,	%o6
loop_1436:
	subcc	%l1,	%o5,	%l0
	edge16	%o1,	%i2,	%g7
	ldsw	[%l7 + 0x5C],	%o3
	mulx	%g2,	0x169D,	%i4
	movleu	%icc,	%i7,	%g4
	ldd	[%l7 + 0x60],	%i2
	movle	%xcc,	%g5,	%i6
	fmovd	%f0,	%f14
	nop
	fitod	%f10,	%f0
	fdtos	%f0,	%f11
	fpsub16	%f24,	%f8,	%f28
	lduh	[%l7 + 0x78],	%g3
	fbo,a	%fcc1,	loop_1437
	membar	0x10
	add	%l2,	0x1906,	%i1
	nop
	fitos	%f5,	%f27
	fstod	%f27,	%f2
loop_1437:
	smul	%g1,	%g6,	%o0
	fpackfix	%f28,	%f12
	nop
	set	0x28, %i5
	stx	%l4,	[%l7 + %i5]
	tvs	%icc,	0x1
	wr	%g0,	0x88,	%asi
	stba	%o2,	[%l7 + 0x4F] %asi
	tcs	%xcc,	0x2
	brlez,a	%l6,	loop_1438
	membar	0x57
	edge32l	%i5,	%l5,	%i0
	add	%l7,	0x14,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o7
	casa	[%l6] 0x80,	%o7,	%o4
loop_1438:
	movvs	%icc,	%l3,	%l1
	bl,a	loop_1439
	fsrc1s	%f26,	%f20
	movg	%xcc,	%o5,	%o6
	bvs,pt	%icc,	loop_1440
loop_1439:
	nop
	setx	0xB2A3FDB339A0B2E8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xAFE5F1B28888A5B7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fdivd	%f20,	%f30,	%f28
	sllx	%o1,	%l0,	%g7
	fbug	%fcc0,	loop_1441
loop_1440:
	ldsw	[%l7 + 0x30],	%i2
	fandnot2s	%f27,	%f13,	%f18
	movn	%xcc,	%g2,	%o3
loop_1441:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x16, %o6
	ldsh	[%l7 + %o6],	%i7
	fbn	%fcc1,	loop_1442
	xnorcc	%g4,	%i3,	%i4
	tsubcctv	%g5,	%i6,	%g3
	umul	%i1,	0x0B6D,	%l2
loop_1442:
	nop
	set	0x30, %o3
	ldxa	[%g0 + %o3] 0x50,	%g1
	movle	%icc,	%o0,	%g6
	edge32l	%l4,	%o2,	%i5
	taddcc	%l5,	0x008A,	%l6
	fmovsgu	%xcc,	%f11,	%f7
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	subccc	%i0,	0x1F49,	%o4
	nop
	fitos	%f1,	%f4
	fstoi	%f4,	%f22
	tn	%xcc,	0x4
	udivcc	%l3,	0x06EA,	%o7
	mova	%icc,	%l1,	%o6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x70] %asi,	%o1
	mova	%xcc,	%l0,	%g7
	flush	%l7 + 0x64
	be,a,pn	%xcc,	loop_1443
	tgu	%icc,	0x2
	stw	%o5,	[%l7 + 0x5C]
	array32	%g2,	%i2,	%i7
loop_1443:
	tneg	%icc,	0x6
	tpos	%icc,	0x5
	tsubcc	%o3,	%g4,	%i3
	movge	%icc,	%g5,	%i4
	tne	%xcc,	0x4
	tg	%icc,	0x0
	xnorcc	%g3,	0x0E12,	%i1
	movgu	%icc,	%l2,	%g1
	set	0x62, %i1
	ldsba	[%l7 + %i1] 0x14,	%i6
	wr	%g0,	0x19,	%asi
	sta	%f0,	[%l7 + 0x60] %asi
	udivcc	%o0,	0x006C,	%g6
	movle	%icc,	%l4,	%i5
	tneg	%icc,	0x1
	bcs,a	%icc,	loop_1444
	fpsub16s	%f24,	%f9,	%f10
	addcc	%o2,	0x1894,	%l6
	taddcc	%i0,	0x0EBF,	%l5
loop_1444:
	membar	0x24
	movrgez	%l3,	0x333,	%o4
	movrgz	%o7,	%o6,	%o1
	fbo,a	%fcc0,	loop_1445
	bn,pt	%xcc,	loop_1446
	edge32ln	%l0,	%g7,	%l1
	nop
	fitod	%f23,	%f30
loop_1445:
	fmovrdlez	%g2,	%f16,	%f4
loop_1446:
	udivcc	%i2,	0x1705,	%o5
	bleu	%xcc,	loop_1447
	sir	0x06C4
	array32	%o3,	%i7,	%g4
	ldub	[%l7 + 0x40],	%i3
loop_1447:
	fnands	%f17,	%f0,	%f4
	alignaddr	%g5,	%g3,	%i1
	array8	%l2,	%i4,	%g1
	tvs	%xcc,	0x2
	fornot2s	%f0,	%f19,	%f31
	fpack32	%f12,	%f26,	%f18
	andn	%o0,	%i6,	%l4
	alignaddrl	%i5,	%o2,	%g6
	tcs	%icc,	0x5
	udiv	%l6,	0x0751,	%l5
	stw	%l3,	[%l7 + 0x64]
	fandnot2	%f10,	%f18,	%f10
	mulx	%o4,	0x0DDF,	%o7
	call	loop_1448
	lduw	[%l7 + 0x20],	%i0
	fmovsvc	%xcc,	%f10,	%f1
	movcc	%icc,	%o6,	%o1
loop_1448:
	taddcctv	%g7,	0x0CF3,	%l1
	brnz,a	%l0,	loop_1449
	fmovdne	%icc,	%f9,	%f11
	nop
	set	0x68, %l4
	std	%f28,	[%l7 + %l4]
	tl	%icc,	0x7
loop_1449:
	edge16ln	%g2,	%o5,	%o3
	subcc	%i2,	0x1D6F,	%i7
	fmovs	%f12,	%f29
	popc	%g4,	%g5
	add	%g3,	%i1,	%l2
	edge16n	%i4,	%g1,	%o0
	tcc	%icc,	0x2
	array16	%i6,	%l4,	%i5
	sllx	%o2,	0x1F,	%i3
	nop
	setx loop_1450, %l0, %l1
	jmpl %l1, %g6
	fmovdn	%xcc,	%f10,	%f2
	fmul8ulx16	%f12,	%f30,	%f24
	movvs	%icc,	%l5,	%l6
loop_1450:
	fbul	%fcc2,	loop_1451
	sdivcc	%l3,	0x0D9B,	%o7
	taddcctv	%o4,	0x1FC5,	%i0
	array32	%o6,	%g7,	%l1
loop_1451:
	movrlez	%l0,	%g2,	%o5
	mova	%icc,	%o1,	%i2
	fones	%f30
	prefetch	[%l7 + 0x20],	 0x2
	fbge	%fcc0,	loop_1452
	tcc	%icc,	0x5
	taddcctv	%o3,	%i7,	%g5
	ble,pt	%xcc,	loop_1453
loop_1452:
	be,a,pt	%icc,	loop_1454
	fpadd16	%f0,	%f26,	%f0
	nop
	setx	loop_1455,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
loop_1453:
	fmovdleu	%icc,	%f11,	%f18
loop_1454:
	fmovrslz	%g3,	%f18,	%f11
	tne	%icc,	0x5
loop_1455:
	fmovscc	%xcc,	%f10,	%f29
	set	0x38, %g5
	lduba	[%l7 + %g5] 0x88,	%g4
	movrne	%i1,	%l2,	%g1
	ldsh	[%l7 + 0x0C],	%o0
	fbne,a	%fcc2,	loop_1456
	ldd	[%l7 + 0x38],	%i6
	fmovdle	%icc,	%f11,	%f14
	array8	%l4,	%i4,	%i5
loop_1456:
	mova	%icc,	%o2,	%g6
	stb	%i3,	[%l7 + 0x65]
	fmovdcc	%icc,	%f3,	%f10
	alignaddr	%l6,	%l3,	%o7
	andn	%o4,	0x17C1,	%l5
	st	%f28,	[%l7 + 0x48]
	movl	%icc,	%o6,	%g7
	udiv	%i0,	0x0CB3,	%l1
	xor	%l0,	%g2,	%o1
	sra	%i2,	0x03,	%o5
	fmovse	%xcc,	%f25,	%f30
	bshuffle	%f18,	%f16,	%f4
	bne,a	%xcc,	loop_1457
	orncc	%i7,	%g5,	%g3
	fcmpeq16	%f14,	%f26,	%o3
	edge8n	%g4,	%i1,	%g1
loop_1457:
	edge8ln	%o0,	%i6,	%l4
	addc	%i4,	%i5,	%l2
	nop
	fitos	%f12,	%f20
	fstox	%f20,	%f2
	std	%f2,	[%l7 + 0x08]
	orncc	%o2,	%i3,	%g6
	fble,a	%fcc2,	loop_1458
	movpos	%icc,	%l6,	%o7
	bpos,a	%icc,	loop_1459
	add	%l3,	0x05FF,	%o4
loop_1458:
	fmovrse	%l5,	%f13,	%f11
	tsubcc	%o6,	0x1916,	%g7
loop_1459:
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
	tg	%xcc,	0x3
	movneg	%xcc,	%l1,	%l0
	movpos	%xcc,	%i0,	%g2
loop_1460:
	andncc	%o1,	%i2,	%o5
	fmovsl	%xcc,	%f31,	%f0
	tpos	%icc,	0x5
	movgu	%xcc,	%g5,	%g3
	wr	%g0,	0x22,	%asi
	stha	%i7,	[%l7 + 0x5C] %asi
	membar	#Sync
	ldub	[%l7 + 0x77],	%g4
	edge16	%i1,	%g1,	%o0
	move	%icc,	%i6,	%o3
	fmovrdgez	%i4,	%f14,	%f12
	fnot1	%f20,	%f18
	umul	%i5,	0x0499,	%l4
	fbu	%fcc0,	loop_1461
	fmovdpos	%xcc,	%f10,	%f7
	movrgz	%o2,	0x3BE,	%l2
	sll	%i3,	0x03,	%l6
loop_1461:
	sll	%o7,	0x18,	%l3
	sllx	%o4,	0x00,	%l5
	wr	%g0,	0x2f,	%asi
	stwa	%o6,	[%l7 + 0x14] %asi
	membar	#Sync
	std	%f0,	[%l7 + 0x20]
	fbg,a	%fcc2,	loop_1462
	tge	%icc,	0x3
	subc	%g7,	0x02FB,	%g6
	bshuffle	%f6,	%f6,	%f2
loop_1462:
	movpos	%xcc,	%l1,	%i0
	stb	%g2,	[%l7 + 0x2C]
	fmovrslez	%o1,	%f8,	%f22
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l0,	0x1415,	%o5
	movvc	%icc,	%i2,	%g3
	udiv	%i7,	0x0742,	%g5
	lduw	[%l7 + 0x34],	%g4
	add	%l7,	0x5C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g1,	%i1
	fmovdg	%icc,	%f30,	%f5
	movrne	%o0,	%i6,	%o3
	fnand	%f30,	%f8,	%f18
	tl	%icc,	0x5
	fabss	%f23,	%f26
	fzero	%f8
	sllx	%i4,	0x1A,	%i5
	edge16l	%o2,	%l2,	%i3
	or	%l4,	0x0D20,	%l6
	movrlz	%o7,	0x009,	%o4
	srax	%l5,	0x0F,	%l3
	movne	%icc,	%g7,	%g6
	tvc	%xcc,	0x3
	ba	loop_1463
	mova	%xcc,	%o6,	%i0
	fnegs	%f21,	%f11
	nop
	setx	0x6E3BFDCED0EC41D5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xBAA8D5D7102DBC3A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f16,	%f28
loop_1463:
	tcs	%xcc,	0x7
	te	%xcc,	0x2
	udivcc	%l1,	0x1E66,	%g2
	movrne	%l0,	0x319,	%o1
	fnor	%f0,	%f22,	%f10
	set	0x4A, %g2
	lduha	[%l7 + %g2] 0x04,	%o5
	movre	%g3,	%i7,	%g5
	fmul8ulx16	%f16,	%f6,	%f24
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x60] %asi,	%i2
	srlx	%g1,	0x01,	%g4
	movpos	%xcc,	%o0,	%i6
	subc	%o3,	%i4,	%i1
	movge	%icc,	%o2,	%i5
	fmul8x16au	%f7,	%f3,	%f10
	nop
	set	0x18, %g4
	stx	%i3,	[%l7 + %g4]
	fnegd	%f24,	%f18
	fsrc1s	%f3,	%f13
	orn	%l2,	0x16D5,	%l6
	fbge	%fcc0,	loop_1464
	brlz,a	%o7,	loop_1465
	movrlz	%o4,	%l4,	%l5
	addcc	%g7,	%g6,	%l3
loop_1464:
	array32	%o6,	%l1,	%i0
loop_1465:
	movvc	%icc,	%g2,	%o1
	edge8ln	%l0,	%o5,	%g3
	tgu	%icc,	0x6
	sethi	0x104E,	%g5
	bge,pt	%icc,	loop_1466
	flush	%l7 + 0x54
	fbu,a	%fcc3,	loop_1467
	movle	%xcc,	%i7,	%g1
loop_1466:
	tsubcctv	%g4,	%o0,	%i6
	fmovsneg	%icc,	%f22,	%f17
loop_1467:
	array8	%i2,	%o3,	%i1
	fpadd16s	%f25,	%f8,	%f1
	movgu	%icc,	%i4,	%o2
	fxors	%f13,	%f14,	%f20
	ta	%icc,	0x1
	tsubcc	%i3,	%i5,	%l6
	sethi	0x12BB,	%o7
	tvs	%icc,	0x5
	fmovdleu	%xcc,	%f30,	%f9
	fpadd32	%f22,	%f20,	%f18
	call	loop_1468
	ldsb	[%l7 + 0x39],	%o4
	nop
	setx	loop_1469,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	and	%l2,	0x1D58,	%l5
loop_1468:
	bn,pn	%icc,	loop_1470
	membar	0x7F
loop_1469:
	srlx	%g7,	0x03,	%g6
	movne	%icc,	%l3,	%l4
loop_1470:
	edge32	%o6,	%i0,	%g2
	fmovdgu	%xcc,	%f3,	%f7
	srl	%o1,	0x00,	%l0
	movleu	%xcc,	%o5,	%g3
	tneg	%icc,	0x7
	ble,pt	%icc,	loop_1471
	movne	%icc,	%g5,	%l1
	bvs,a,pn	%xcc,	loop_1472
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1471:
	fpack32	%f10,	%f24,	%f24
	membar	0x0B
loop_1472:
	sdivx	%g1,	0x0054,	%i7
	bcs,a,pn	%xcc,	loop_1473
	pdist	%f30,	%f14,	%f4
	fmovrsgz	%o0,	%f1,	%f11
	movrlz	%g4,	0x056,	%i2
loop_1473:
	alignaddr	%o3,	%i1,	%i6
	xnor	%o2,	0x0F7F,	%i4
	orncc	%i5,	%i3,	%o7
	movre	%o4,	0x094,	%l6
	for	%f20,	%f26,	%f14
	set	0x28, %o0
	sta	%f24,	[%l7 + %o0] 0x11
	fnegd	%f8,	%f8
	tne	%icc,	0x0
	brlz,a	%l2,	loop_1474
	udivx	%g7,	0x08EB,	%g6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tne	%xcc,	0x1
loop_1474:
	array32	%l3,	%l5,	%o6
	fsrc1s	%f24,	%f0
	bge,a,pn	%icc,	loop_1475
	tleu	%icc,	0x7
	set	0x4F, %i2
	ldsba	[%l7 + %i2] 0x04,	%l4
loop_1475:
	smul	%i0,	%o1,	%g2
	fmovrslez	%o5,	%f24,	%f22
	umul	%l0,	%g3,	%l1
	lduh	[%l7 + 0x22],	%g1
	movrlez	%g5,	0x1B0,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g4,	%i2,	%o3
	nop
	setx	0x2A9A0E15CDB87E29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xA665019E0A4886A2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fsubd	%f22,	%f4,	%f20
	tsubcc	%o0,	%i6,	%o2
	edge8n	%i1,	%i5,	%i3
	srax	%o7,	%o4,	%l6
	movpos	%xcc,	%i4,	%g7
	lduh	[%l7 + 0x12],	%g6
	udivcc	%l3,	0x140C,	%l2
	xorcc	%l5,	0x0B0F,	%o6
	sra	%l4,	0x0C,	%i0
	fmovsg	%icc,	%f13,	%f16
	set	0x40, %l3
	stda	%f16,	[%l7 + %l3] 0x89
	subccc	%o1,	%o5,	%g2
	movgu	%xcc,	%g3,	%l0
	orcc	%l1,	0x1BB9,	%g5
	addc	%i7,	%g1,	%i2
	edge32ln	%o3,	%o0,	%g4
	bg,a	loop_1476
	membar	0x7D
	srl	%o2,	%i1,	%i5
	movre	%i3,	%i6,	%o7
loop_1476:
	fbl	%fcc2,	loop_1477
	tneg	%icc,	0x2
	set	0x72, %l0
	stba	%o4,	[%l7 + %l0] 0x2b
	membar	#Sync
loop_1477:
	lduw	[%l7 + 0x44],	%l6
	movne	%icc,	%g7,	%g6
	movvs	%icc,	%l3,	%i4
	fbul,a	%fcc1,	loop_1478
	fbl	%fcc3,	loop_1479
	udivx	%l2,	0x0CAF,	%l5
	movg	%icc,	%l4,	%i0
loop_1478:
	movrgz	%o6,	0x12C,	%o5
loop_1479:
	tneg	%xcc,	0x1
	call	loop_1480
	movl	%xcc,	%g2,	%g3
	fsrc1s	%f1,	%f0
	brnz,a	%l0,	loop_1481
loop_1480:
	edge32l	%l1,	%g5,	%o1
	taddcc	%i7,	%g1,	%o3
	alignaddrl	%i2,	%g4,	%o2
loop_1481:
	and	%i1,	%o0,	%i5
	movleu	%xcc,	%i3,	%i6
	movge	%icc,	%o4,	%l6
	array16	%g7,	%o7,	%l3
	bneg,pt	%xcc,	loop_1482
	nop
	fitos	%f11,	%f9
	fstod	%f9,	%f10
	tvc	%icc,	0x6
	umul	%i4,	%l2,	%g6
loop_1482:
	fbe,a	%fcc0,	loop_1483
	andcc	%l4,	0x145F,	%i0
	fble	%fcc1,	loop_1484
	brlz	%l5,	loop_1485
loop_1483:
	udiv	%o6,	0x0EC8,	%g2
	edge16l	%g3,	%o5,	%l1
loop_1484:
	te	%icc,	0x7
loop_1485:
	movgu	%icc,	%g5,	%l0
	fsrc1s	%f28,	%f10
	andn	%i7,	%g1,	%o3
	edge16	%i2,	%g4,	%o2
	xor	%i1,	0x10DA,	%o0
	edge32ln	%o1,	%i5,	%i3
	fornot2	%f16,	%f8,	%f24
	xorcc	%i6,	%l6,	%o4
	tsubcc	%o7,	%l3,	%i4
	ldstub	[%l7 + 0x44],	%g7
	udivcc	%l2,	0x05F6,	%l4
	movrlez	%i0,	0x3CB,	%l5
	alignaddrl	%g6,	%g2,	%g3
	nop
	setx	0x855E376B4043E537,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	tge	%xcc,	0x2
	tcc	%xcc,	0x1
	tsubcctv	%o5,	%o6,	%l1
	fmovdvc	%icc,	%f25,	%f9
	movgu	%xcc,	%l0,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tn	%xcc,	0x0
	movrlz	%g1,	%g5,	%o3
	brnz	%g4,	loop_1486
	alignaddrl	%i2,	%o2,	%o0
	taddcc	%o1,	0x02E4,	%i5
	subccc	%i3,	0x05AB,	%i6
loop_1486:
	fbn	%fcc2,	loop_1487
	srlx	%l6,	0x15,	%o4
	popc	0x1BC2,	%o7
	nop
	set	0x72, %l1
	ldstub	[%l7 + %l1],	%l3
loop_1487:
	ldub	[%l7 + 0x77],	%i4
	bshuffle	%f26,	%f26,	%f0
	brlz,a	%g7,	loop_1488
	fba	%fcc2,	loop_1489
	fmovrdlez	%l2,	%f30,	%f2
	fnands	%f10,	%f22,	%f6
loop_1488:
	stbar
loop_1489:
	or	%i1,	%i0,	%l5
	movcs	%icc,	%g6,	%l4
	movl	%xcc,	%g3,	%o5
	fbne,a	%fcc1,	loop_1490
	smulcc	%o6,	%g2,	%l0
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x60] %asi,	%i7
loop_1490:
	alignaddrl	%g1,	%l1,	%o3
	ldx	[%l7 + 0x20],	%g5
	tsubcc	%i2,	0x02C3,	%o2
	fabsd	%f8,	%f10
	sll	%o0,	%o1,	%g4
	tgu	%icc,	0x5
	tsubcc	%i5,	%i3,	%l6
	movcs	%icc,	%o4,	%o7
	orncc	%i6,	%l3,	%i4
	xnor	%g7,	%i1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l2,	%g6,	%l4
	subc	%l5,	%g3,	%o5
	movn	%icc,	%g2,	%l0
	nop
	setx	0x907B5074,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	xorcc	%o6,	0x028D,	%i7
	fsrc2	%f22,	%f30
	tneg	%xcc,	0x3
	fbge,a	%fcc2,	loop_1491
	bcs,a,pt	%icc,	loop_1492
	ldstub	[%l7 + 0x0B],	%g1
	fmovdleu	%icc,	%f17,	%f0
loop_1491:
	tg	%xcc,	0x1
loop_1492:
	movleu	%icc,	%o3,	%g5
	set	0x10, %o7
	stxa	%l1,	[%l7 + %o7] 0x19
	movle	%xcc,	%o2,	%i2
	fsrc2s	%f12,	%f15
	orcc	%o0,	%o1,	%i5
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x20] %asi,	%i2
	fands	%f9,	%f17,	%f19
	membar	#Sync
	set	0x40, %o5
	ldda	[%l7 + %o5] 0x1e,	%f0
	ta	%icc,	0x0
	andcc	%g4,	%o4,	%l6
	fblg,a	%fcc0,	loop_1493
	brz,a	%o7,	loop_1494
	sdivcc	%i6,	0x0A0D,	%i4
	fba,a	%fcc0,	loop_1495
loop_1493:
	mulx	%g7,	0x1374,	%l3
loop_1494:
	fmul8ulx16	%f4,	%f6,	%f26
	srl	%i1,	%i0,	%l2
loop_1495:
	srl	%g6,	0x0D,	%l4
	edge8l	%g3,	%o5,	%l5
	taddcctv	%g2,	%o6,	%l0
	movvs	%icc,	%i7,	%o3
	fmuld8ulx16	%f31,	%f29,	%f4
	array32	%g1,	%g5,	%l1
	mulscc	%o2,	0x0BE9,	%i2
	fnot2s	%f12,	%f30
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f10
	umul	%o1,	0x087F,	%o0
	st	%f10,	[%l7 + 0x20]
	set	0x20, %l6
	ldda	[%l7 + %l6] 0x26,	%i4
	tg	%icc,	0x2
	edge16l	%g4,	%o4,	%i3
	edge8l	%l6,	%o7,	%i6
	tn	%xcc,	0x5
	srl	%g7,	0x06,	%i4
	prefetch	[%l7 + 0x70],	 0x1
	nop
	setx	0x504A9FBC,	%l0,	%l6
	st	%l6,	[%l7 + 0x58]
	ld	[%l7 + 0x58],	%fsr
	fandnot2s	%f7,	%f27,	%f7
	fpsub32s	%f25,	%f16,	%f28
	fones	%f2
	bcc,a,pt	%icc,	loop_1496
	nop
	fitos	%f6,	%f21
	movre	%l3,	0x0B2,	%i1
	xnorcc	%l2,	%i0,	%g6
loop_1496:
	orn	%l4,	0x09EE,	%g3
	array8	%l5,	%o5,	%o6
	fcmple16	%f4,	%f16,	%l0
	edge16	%g2,	%o3,	%g1
	subccc	%g5,	%i7,	%l1
	bg,a	%xcc,	loop_1497
	fmovde	%xcc,	%f26,	%f19
	srlx	%i2,	%o1,	%o2
	tge	%xcc,	0x4
loop_1497:
	addcc	%o0,	%g4,	%o4
	tsubcc	%i3,	%i5,	%o7
	addc	%i6,	0x06B5,	%l6
	add	%i4,	0x07A9,	%l3
	edge32n	%i1,	%l2,	%i0
	srax	%g6,	0x14,	%g7
	movrlz	%g3,	%l5,	%l4
	tvc	%xcc,	0x0
	wr	%g0,	0x89,	%asi
	stwa	%o5,	[%l7 + 0x18] %asi
	or	%o6,	0x0CB4,	%g2
	tpos	%xcc,	0x5
	xor	%l0,	%o3,	%g5
	movge	%icc,	%g1,	%l1
	fpackfix	%f16,	%f14
	fxor	%f20,	%f10,	%f18
	tcc	%icc,	0x0
	mulscc	%i2,	%i7,	%o1
	brgz,a	%o2,	loop_1498
	ldd	[%l7 + 0x08],	%f26
	fmul8ulx16	%f2,	%f20,	%f16
	fmovsvc	%xcc,	%f16,	%f18
loop_1498:
	srax	%o0,	%g4,	%i3
	fsrc1	%f24,	%f24
	add	%o4,	%i5,	%o7
	tsubcc	%l6,	%i4,	%l3
	fmul8ulx16	%f6,	%f0,	%f4
	bvs,a	loop_1499
	bl,pn	%icc,	loop_1500
	movvc	%xcc,	%i6,	%l2
	movle	%xcc,	%i1,	%i0
loop_1499:
	nop
	set	0x40, %i6
	ldda	[%l7 + %i6] 0x88,	%f0
loop_1500:
	xor	%g6,	%g7,	%l5
	fpackfix	%f4,	%f26
	fbug	%fcc3,	loop_1501
	ta	%icc,	0x7
	nop
	fitod	%f0,	%f6
	fdtox	%f6,	%f4
	mulscc	%l4,	%g3,	%o5
loop_1501:
	fmovdg	%xcc,	%f5,	%f2
	bshuffle	%f22,	%f18,	%f12
	movl	%icc,	%g2,	%l0
	bg	%icc,	loop_1502
	fsrc1	%f12,	%f8
	tvc	%xcc,	0x1
	subccc	%o6,	0x1074,	%o3
loop_1502:
	ta	%icc,	0x1
	fpackfix	%f0,	%f5
	fcmpgt16	%f28,	%f14,	%g5
	array16	%g1,	%i2,	%i7
	sra	%l1,	0x19,	%o2
	fmovscs	%xcc,	%f28,	%f11
	fpsub16	%f24,	%f8,	%f8
	tsubcc	%o0,	0x1418,	%g4
	edge8n	%o1,	%i3,	%i5
	fmovrdgz	%o7,	%f8,	%f12
	movcs	%icc,	%o4,	%i4
	nop
	fitod	%f6,	%f30
	fdtox	%f30,	%f2
	srl	%l6,	0x12,	%l3
	bl	%xcc,	loop_1503
	add	%l2,	%i6,	%i0
	edge16	%g6,	%g7,	%i1
	movrlz	%l4,	%l5,	%g3
loop_1503:
	srl	%o5,	0x1C,	%g2
	bn,a,pn	%xcc,	loop_1504
	fxors	%f18,	%f10,	%f9
	fors	%f0,	%f11,	%f17
	edge32	%o6,	%l0,	%o3
loop_1504:
	fnot1	%f30,	%f16
	movrne	%g1,	%g5,	%i2
	fmovdcs	%icc,	%f15,	%f26
	fsrc1s	%f12,	%f0
	movge	%icc,	%l1,	%i7
	ble,a	loop_1505
	edge8ln	%o2,	%g4,	%o0
	sub	%o1,	0x1011,	%i5
	fmovspos	%icc,	%f6,	%f2
loop_1505:
	fbn	%fcc3,	loop_1506
	xnor	%o7,	%i3,	%i4
	sethi	0x1E19,	%l6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1506:
	fmovdl	%icc,	%f10,	%f20
	movleu	%xcc,	%l3,	%o4
	tsubcctv	%l2,	%i0,	%g6
	fpsub32	%f8,	%f24,	%f6
	movvs	%xcc,	%g7,	%i6
	fmuld8sux16	%f31,	%f30,	%f20
	tpos	%xcc,	0x3
	fmovdcc	%xcc,	%f8,	%f16
	mova	%icc,	%l4,	%l5
	movge	%xcc,	%g3,	%o5
	fba	%fcc1,	loop_1507
	ldd	[%l7 + 0x58],	%g2
	fornot1	%f0,	%f16,	%f24
	srax	%o6,	%l0,	%o3
loop_1507:
	xorcc	%g1,	%i1,	%i2
	fabsd	%f6,	%f18
	ldd	[%l7 + 0x40],	%l0
	srlx	%i7,	0x0A,	%g5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x04,	%asi
	ldxa	[%l6] %asi,	%o2
	casxa	[%l6] 0x04,	%o2,	%g4
	edge16ln	%o0,	%i5,	%o7
	smul	%o1,	%i3,	%i4
	tge	%icc,	0x2
	sdivx	%l6,	0x1D6C,	%o4
	sll	%l2,	%i0,	%l3
	srlx	%g6,	%i6,	%g7
	movgu	%icc,	%l5,	%l4
	fandnot2	%f14,	%f28,	%f6
	tsubcc	%o5,	0x04CE,	%g2
	ldd	[%l7 + 0x70],	%o6
	move	%icc,	%l0,	%o3
	wr	%g0,	0x80,	%asi
	sta	%f11,	[%l7 + 0x18] %asi
	fsrc2s	%f18,	%f4
	fsrc1	%f20,	%f8
	fmovrsgez	%g3,	%f30,	%f28
	set	0x40, %i4
	ldda	[%l7 + %i4] 0x88,	%f16
	orn	%g1,	%i2,	%l1
	subc	%i1,	%g5,	%i7
	tne	%xcc,	0x3
	fornot2	%f24,	%f18,	%f14
	fmovde	%xcc,	%f21,	%f26
	movvc	%icc,	%o2,	%g4
	nop
	setx	0xCBF280E9AF8315B2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xD4ABE8A8980FE66E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f6,	%f30
	edge16l	%i5,	%o7,	%o1
	mulscc	%i3,	0x1853,	%o0
	fmovdg	%xcc,	%f1,	%f21
	tpos	%icc,	0x6
	tle	%xcc,	0x7
	membar	0x67
	mulx	%i4,	0x05AA,	%l6
	edge32	%o4,	%i0,	%l2
	tvc	%xcc,	0x0
	movl	%icc,	%g6,	%l3
	edge8	%g7,	%l5,	%l4
	addccc	%o5,	0x1375,	%i6
	edge32l	%g2,	%o6,	%l0
	sub	%g3,	0x11E7,	%o3
	wr	%g0,	0x19,	%asi
	stba	%g1,	[%l7 + 0x72] %asi
	movrlz	%l1,	%i1,	%g5
	xnor	%i2,	%o2,	%g4
	andcc	%i5,	0x1A3C,	%o7
	alignaddr	%o1,	%i3,	%i7
	fmovdcs	%icc,	%f30,	%f29
	movvs	%icc,	%i4,	%l6
	addcc	%o4,	%i0,	%o0
	fmovrdlz	%l2,	%f2,	%f20
	orncc	%g6,	0x0014,	%g7
	movvc	%icc,	%l5,	%l4
	st	%f5,	[%l7 + 0x3C]
	movcs	%icc,	%l3,	%i6
	fcmpeq32	%f18,	%f10,	%g2
	stx	%o5,	[%l7 + 0x18]
	set	0x7B, %o4
	ldstuba	[%l7 + %o4] 0x80,	%o6
	ldsh	[%l7 + 0x3A],	%l0
	orncc	%g3,	%g1,	%l1
	bshuffle	%f2,	%f16,	%f14
	edge8ln	%i1,	%o3,	%g5
	tsubcctv	%i2,	%o2,	%i5
	movrlz	%o7,	0x011,	%g4
	fnands	%f26,	%f2,	%f5
	tne	%xcc,	0x6
	set	0x70, %g7
	lduha	[%l7 + %g7] 0x10,	%o1
	orcc	%i3,	%i7,	%l6
	move	%icc,	%o4,	%i4
	tl	%xcc,	0x4
	movrlez	%i0,	%l2,	%g6
	edge16n	%g7,	%l5,	%l4
	fmuld8sux16	%f15,	%f28,	%f16
	and	%l3,	%i6,	%g2
	edge8	%o5,	%o0,	%l0
	edge16n	%o6,	%g3,	%g1
	nop
	setx	0x513E55E210752364,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	stx	%l1,	[%l7 + 0x40]
	movleu	%xcc,	%o3,	%i1
	mulx	%i2,	%o2,	%i5
	fandnot2	%f12,	%f14,	%f16
	orcc	%o7,	0x0DAC,	%g5
	nop
	setx loop_1508, %l0, %l1
	jmpl %l1, %o1
	srl	%g4,	%i3,	%i7
	ldd	[%l7 + 0x20],	%f26
	movleu	%xcc,	%o4,	%l6
loop_1508:
	sub	%i0,	0x1596,	%i4
	fmovsn	%xcc,	%f19,	%f17
	tcc	%icc,	0x1
	movrgz	%l2,	0x292,	%g7
	sethi	0x1CF4,	%g6
	orcc	%l4,	0x1F78,	%l3
	bvs	loop_1509
	array8	%l5,	%g2,	%o5
	movrgez	%i6,	0x178,	%o0
	nop
	fitod	%f5,	%f26
loop_1509:
	movneg	%icc,	%l0,	%g3
	nop
	setx	0xF30B93B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f14
	brgez	%g1,	loop_1510
	nop
	setx	0x433743B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x6D603A23,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f25,	%f25
	ba,a,pt	%xcc,	loop_1511
	array16	%l1,	%o6,	%o3
loop_1510:
	fxnor	%f0,	%f6,	%f4
	movn	%icc,	%i2,	%i1
loop_1511:
	fbge	%fcc1,	loop_1512
	srlx	%o2,	0x0E,	%o7
	subcc	%i5,	%o1,	%g5
	edge32	%g4,	%i7,	%o4
loop_1512:
	edge32n	%l6,	%i3,	%i4
	andncc	%i0,	%g7,	%g6
	sir	0x0D30
	tg	%xcc,	0x5
	nop
	setx	0x583D1C83906B70B8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fmul8sux16	%f6,	%f24,	%f16
	tn	%icc,	0x1
	tl	%icc,	0x7
	tvs	%icc,	0x7
	nop
	setx	0x92EB9EFADC536F60,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x71B9CBF25504B43A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f26,	%f4
	fmuld8sux16	%f8,	%f5,	%f2
	orncc	%l2,	%l3,	%l4
	ldd	[%l7 + 0x10],	%l4
	movl	%xcc,	%g2,	%o5
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	fmovspos	%icc,	%f10,	%f10
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x32] %asi,	%o0
	srlx	%l0,	%g3,	%g1
	movvs	%xcc,	%l1,	%i6
	sub	%o6,	%o3,	%i2
	tvc	%xcc,	0x6
	udiv	%i1,	0x12BD,	%o2
	edge8	%o7,	%i5,	%g5
	movvs	%icc,	%g4,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x22AB93B0D0615096,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	ldub	[%l7 + 0x1B],	%o1
	sra	%o4,	0x1F,	%i3
	sdivx	%i4,	0x0C75,	%l6
	xnor	%i0,	0x1A3F,	%g6
	array16	%l2,	%g7,	%l3
	udivx	%l4,	0x174D,	%g2
	fbg,a	%fcc3,	loop_1513
	addccc	%l5,	%o0,	%o5
	nop
	fitod	%f4,	%f20
	fdtoi	%f20,	%f28
	tsubcc	%l0,	0x016C,	%g3
loop_1513:
	movl	%xcc,	%l1,	%i6
	brlez,a	%g1,	loop_1514
	fmuld8ulx16	%f9,	%f5,	%f6
	ldub	[%l7 + 0x42],	%o3
	fmovsg	%xcc,	%f14,	%f2
loop_1514:
	popc	%i2,	%o6
	movneg	%xcc,	%i1,	%o7
	movle	%icc,	%i5,	%o2
	fcmpgt32	%f30,	%f16,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g5,	0x01,	%o1
	fble	%fcc0,	loop_1515
	tpos	%xcc,	0x0
	sir	0x0516
	fmovdg	%icc,	%f12,	%f8
loop_1515:
	fmovs	%f16,	%f31
	fandnot1	%f6,	%f16,	%f2
	alignaddr	%i7,	%o4,	%i4
	orncc	%i3,	0x0C18,	%l6
	stw	%g6,	[%l7 + 0x20]
	tle	%xcc,	0x0
	brz	%i0,	loop_1516
	tleu	%xcc,	0x7
	addcc	%l2,	0x0057,	%g7
	fmovrde	%l3,	%f14,	%f6
loop_1516:
	mulscc	%g2,	0x091A,	%l5
	nop
	setx	0x9AB4D4615CEC8758,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	fsqrtd	%f14,	%f2
	edge16l	%l4,	%o0,	%l0
	stw	%o5,	[%l7 + 0x30]
	tvc	%xcc,	0x1
	nop
	setx	0x8050C9A3,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	tne	%xcc,	0x5
	set	0x4E, %g3
	lduha	[%l7 + %g3] 0x81,	%g3
	taddcc	%l1,	%g1,	%o3
	bpos,a	loop_1517
	fxors	%f14,	%f12,	%f7
	andncc	%i2,	%o6,	%i1
	set	0x48, %l2
	ldxa	[%l7 + %l2] 0x89,	%i6
loop_1517:
	srax	%i5,	0x15,	%o2
	brz,a	%g4,	loop_1518
	bne,pn	%xcc,	loop_1519
	sir	0x1D1E
	movleu	%xcc,	%g5,	%o7
loop_1518:
	fxnor	%f0,	%f10,	%f12
loop_1519:
	or	%o1,	0x1E2A,	%i7
	subc	%i4,	0x0255,	%i3
	movrlez	%o4,	0x3C0,	%l6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g6,	%i0
	tvs	%icc,	0x1
	ld	[%l7 + 0x40],	%f21
	tpos	%xcc,	0x2
	lduh	[%l7 + 0x4C],	%l2
	st	%f10,	[%l7 + 0x20]
	flush	%l7 + 0x6C
	ta	%icc,	0x0
	addccc	%l3,	%g7,	%g2
	movn	%icc,	%l4,	%l5
	sth	%l0,	[%l7 + 0x26]
	fbl	%fcc0,	loop_1520
	tle	%xcc,	0x7
	bne	loop_1521
	array16	%o5,	%g3,	%l1
loop_1520:
	tsubcctv	%o0,	%g1,	%i2
	fmul8x16au	%f11,	%f18,	%f6
loop_1521:
	ta	%icc,	0x2
	fornot1s	%f25,	%f31,	%f23
	fbu	%fcc2,	loop_1522
	smul	%o3,	0x1D03,	%i1
	mulx	%o6,	0x0F43,	%i6
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x3F] %asi,	%i5
loop_1522:
	ldd	[%l7 + 0x20],	%f6
	std	%f4,	[%l7 + 0x48]
	flush	%l7 + 0x58
	or	%o2,	0x0E09,	%g4
	addc	%o7,	%o1,	%g5
	xor	%i7,	%i4,	%i3
	edge16l	%o4,	%l6,	%g6
	bn,a	%icc,	loop_1523
	movcs	%icc,	%l2,	%i0
	sdiv	%l3,	0x1DC2,	%g2
	set	0x64, %i0
	lduwa	[%l7 + %i0] 0x19,	%g7
loop_1523:
	edge16	%l5,	%l0,	%o5
	fmovdne	%icc,	%f19,	%f12
	nop
	fitod	%f4,	%f16
	fdtos	%f16,	%f31
	bpos,pn	%icc,	loop_1524
	brlz	%g3,	loop_1525
	fcmpgt16	%f14,	%f12,	%l1
	sir	0x1A80
loop_1524:
	movne	%icc,	%l4,	%o0
loop_1525:
	sub	%g1,	0x17FA,	%i2
	srl	%o3,	%i1,	%o6
	bvs	loop_1526
	tge	%xcc,	0x6
	addccc	%i5,	%i6,	%g4
	udivcc	%o7,	0x1D1D,	%o2
loop_1526:
	mova	%xcc,	%o1,	%i7
	sllx	%g5,	%i3,	%o4
	mova	%xcc,	%l6,	%i4
	movvs	%icc,	%g6,	%i0
	fcmpgt16	%f24,	%f24,	%l3
	nop
	setx	0x03F95DDB8DD9CC01,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x3D1876E1F5063B9A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f24,	%f8
	brgz,a	%g2,	loop_1527
	movl	%icc,	%l2,	%g7
	addc	%l5,	%l0,	%g3
	fmul8x16au	%f20,	%f20,	%f18
loop_1527:
	xor	%o5,	%l4,	%l1
	fpmerge	%f24,	%f17,	%f14
	membar	0x78
	sllx	%g1,	0x09,	%i2
	tl	%xcc,	0x6
	edge16	%o3,	%o0,	%i1
	fblg,a	%fcc0,	loop_1528
	edge32l	%o6,	%i5,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brz,a	%i6,	loop_1529
loop_1528:
	fbg	%fcc2,	loop_1530
	edge16l	%o2,	%o7,	%i7
	addccc	%o1,	%i3,	%g5
loop_1529:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1530:
	orncc	%l6,	%o4,	%i4
	edge8n	%g6,	%i0,	%l3
	wr	%g0,	0x10,	%asi
	ldsha	[%l7 + 0x64] %asi,	%l2
	movcc	%icc,	%g2,	%l5
	udivx	%l0,	0x0F24,	%g7
	fbug	%fcc3,	loop_1531
	nop
	setx	0x891FA1629D485ECC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x566B0C34CB2A1DDF,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fsubd	%f26,	%f8,	%f30
	movcs	%xcc,	%g3,	%o5
	stw	%l1,	[%l7 + 0x28]
loop_1531:
	lduh	[%l7 + 0x26],	%g1
	brlez	%l4,	loop_1532
	sdivx	%o3,	0x1B0B,	%o0
	edge8n	%i2,	%o6,	%i1
	xnorcc	%i5,	%g4,	%o2
loop_1532:
	sra	%i6,	0x1E,	%o7
	fandnot2	%f6,	%f18,	%f0
	srl	%o1,	%i7,	%i3
	tne	%xcc,	0x3
	movgu	%xcc,	%l6,	%o4
	brgez,a	%g5,	loop_1533
	fnot2s	%f19,	%f7
	edge16ln	%g6,	%i0,	%l3
	addccc	%l2,	0x07AF,	%g2
loop_1533:
	tle	%xcc,	0x1
	nop
	fitos	%f28,	%f31
	fcmpgt32	%f26,	%f24,	%i4
	array16	%l0,	%g7,	%g3
	movrlez	%o5,	%l5,	%l1
	tne	%icc,	0x1
	orn	%l4,	%g1,	%o0
	fmul8ulx16	%f12,	%f20,	%f16
	ldsw	[%l7 + 0x38],	%o3
	membar	0x0B
	udivcc	%i2,	0x05C5,	%o6
	fnot2	%f30,	%f28
	set	0x30, %l5
	ldda	[%l7 + %l5] 0xe3,	%i4
	array32	%g4,	%i1,	%i6
	fbue,a	%fcc3,	loop_1534
	be,pn	%icc,	loop_1535
	std	%f16,	[%l7 + 0x30]
	addccc	%o7,	0x14BF,	%o1
loop_1534:
	taddcctv	%o2,	%i3,	%l6
loop_1535:
	sdiv	%o4,	0x0BA7,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	movg	%xcc,	%g6,	%i7
	fsrc2	%f24,	%f28
	edge8ln	%l3,	%l2,	%g2
	movcc	%icc,	%i4,	%l0
	swap	[%l7 + 0x4C],	%g7
	fmovrde	%g3,	%f6,	%f30
	pdist	%f14,	%f12,	%f4
	fmovsge	%icc,	%f16,	%f18
	nop
	set	0x38, %i7
	sth	%o5,	[%l7 + %i7]
	xnor	%l5,	0x181C,	%l1
	edge8n	%i0,	%g1,	%o0
	bleu,a	%icc,	loop_1536
	movrlez	%o3,	0x35E,	%i2
	array8	%l4,	%o6,	%g4
	bne	%xcc,	loop_1537
loop_1536:
	movn	%icc,	%i5,	%i6
	srlx	%o7,	%i1,	%o1
	tcs	%xcc,	0x4
loop_1537:
	tneg	%xcc,	0x2
	fble,a	%fcc2,	loop_1538
	fmovsg	%icc,	%f23,	%f9
	edge32l	%i3,	%o2,	%o4
	fabsd	%f8,	%f10
loop_1538:
	ldstub	[%l7 + 0x64],	%l6
	movrgez	%g6,	%i7,	%l3
	edge8	%g5,	%l2,	%i4
	taddcc	%g2,	%g7,	%g3
	fmovdpos	%xcc,	%f4,	%f10
	mulx	%l0,	%o5,	%l1
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	bge,pt	%icc,	loop_1539
	movcc	%icc,	%l5,	%o0
	fmovrdlz	%o3,	%f8,	%f30
	set	0x56, %g6
	ldsba	[%l7 + %g6] 0x18,	%g1
loop_1539:
	array8	%i2,	%o6,	%l4
	tpos	%icc,	0x1
	nop
	setx	0xC01F45C9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f15
	setx	0x948CF154,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fadds	%f13,	%f15,	%f1
	subccc	%g4,	0x1E5A,	%i6
	movvs	%xcc,	%o7,	%i1
	tcc	%icc,	0x3
	movn	%xcc,	%o1,	%i3
	fble	%fcc2,	loop_1540
	ldd	[%l7 + 0x78],	%i4
	tleu	%icc,	0x2
	fones	%f12
loop_1540:
	fble	%fcc0,	loop_1541
	edge8ln	%o2,	%l6,	%g6
	movle	%xcc,	%o4,	%i7
	move	%xcc,	%l3,	%g5
loop_1541:
	movne	%icc,	%i4,	%g2
	wr	%g0,	0x89,	%asi
	sta	%f7,	[%l7 + 0x30] %asi
	sethi	0x0694,	%l2
	udiv	%g7,	0x0A18,	%l0
	nop
	fitod	%f8,	%f4
	fdtoi	%f4,	%f27
	edge8n	%g3,	%o5,	%l1
	tgu	%xcc,	0x5
	fornot1s	%f15,	%f23,	%f13
	array8	%i0,	%o0,	%l5
	or	%g1,	0x0CC6,	%i2
	popc	0x1876,	%o6
	nop
	setx	0x6ED2265576DBC191,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xF15295F94861571A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fmuld	%f10,	%f26,	%f0
	fmovdleu	%icc,	%f14,	%f6
	movrlz	%l4,	%o3,	%g4
	set	0x14, %o2
	swapa	[%l7 + %o2] 0x18,	%o7
	movrne	%i6,	0x309,	%i1
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x76] %asi,	%o1
	flush	%l7 + 0x3C
	movrgz	%i3,	%o2,	%i5
	edge32ln	%l6,	%o4,	%g6
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x38] %asi,	%i7
	xorcc	%g5,	0x1232,	%l3
	sllx	%g2,	0x1A,	%l2
	fmovdcc	%icc,	%f3,	%f6
	ldd	[%l7 + 0x28],	%g6
	ldx	[%l7 + 0x08],	%i4
	array8	%g3,	%l0,	%l1
	bl,a	loop_1542
	movl	%icc,	%o5,	%i0
	wr	%g0,	0x89,	%asi
	lda	[%l7 + 0x60] %asi,	%f4
loop_1542:
	xnorcc	%o0,	%l5,	%i2
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	bg,a,pn	%icc,	loop_1543
	tle	%icc,	0x5
	nop
	setx	0x535E6DDE71CF3DF5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x261AAEEDCFB8AA9E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f0,	%f26
	nop
	setx	0x02E2D091,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0x6084B447,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f29
	fadds	%f29,	%f8,	%f14
loop_1543:
	movvs	%xcc,	%o6,	%g1
	set	0x4C, %o1
	lduwa	[%l7 + %o1] 0x19,	%o3
	nop
	fitos	%f0,	%f30
	fstoi	%f30,	%f15
	edge32n	%l4,	%g4,	%i6
	popc	0x04CD,	%i1
	bpos	%icc,	loop_1544
	tgu	%xcc,	0x3
	udiv	%o7,	0x057E,	%i3
	orcc	%o2,	0x0ECD,	%o1
loop_1544:
	nop
	wr	%g0,	0x23,	%asi
	stxa	%l6,	[%l7 + 0x08] %asi
	membar	#Sync
	edge8	%o4,	%i5,	%i7
	edge32l	%g6,	%g5,	%l3
	sll	%g2,	0x1D,	%g7
	fcmpgt16	%f26,	%f16,	%l2
	flush	%l7 + 0x40
	fpadd32s	%f16,	%f20,	%f24
	wr	%g0,	0x11,	%asi
	swapa	[%l7 + 0x1C] %asi,	%g3
	fbue	%fcc3,	loop_1545
	nop
	fitos	%f19,	%f16
	wr	%g0,	0x88,	%asi
	lda	[%l7 + 0x28] %asi,	%f8
loop_1545:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%l1
	tl	%icc,	0x2
	bshuffle	%f22,	%f8,	%f10
	sll	%o5,	0x13,	%i0
	stbar
	movrgz	%l0,	%o0,	%i2
	fbue,a	%fcc0,	loop_1546
	fnors	%f6,	%f4,	%f6
	fmovrde	%l5,	%f4,	%f4
	nop
	setx	0xB4D01A46619B2F3D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x06F87BC372422088,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f26,	%f4
loop_1546:
	array8	%o6,	%o3,	%l4
	subccc	%g4,	%g1,	%i6
	addccc	%i1,	0x1DE6,	%o7
	bne,a,pt	%xcc,	loop_1547
	fmovdcc	%icc,	%f17,	%f11
	edge16l	%o2,	%o1,	%i3
	movrgez	%o4,	%l6,	%i5
loop_1547:
	fpack32	%f0,	%f14,	%f30
	sdivcc	%g6,	0x1220,	%i7
	fcmpgt16	%f24,	%f18,	%g5
	srlx	%l3,	0x14,	%g7
	fones	%f16
	tsubcc	%l2,	%g3,	%g2
	fornot2s	%f4,	%f16,	%f13
	edge8ln	%i4,	%l1,	%i0
	fpadd16	%f22,	%f6,	%f6
	faligndata	%f12,	%f2,	%f26
	tl	%xcc,	0x5
	movrne	%o5,	0x29D,	%o0
	movvc	%icc,	%i2,	%l5
	prefetch	[%l7 + 0x18],	 0x3
	fones	%f20
	fbo,a	%fcc3,	loop_1548
	tpos	%icc,	0x1
	fpadd16s	%f10,	%f20,	%f19
	bvc,a,pn	%icc,	loop_1549
loop_1548:
	fmovdvc	%xcc,	%f30,	%f22
	orncc	%l0,	0x0F09,	%o3
	srlx	%l4,	%o6,	%g1
loop_1549:
	and	%i6,	0x1F4B,	%g4
	udivcc	%i1,	0x1EFF,	%o2
	nop
	fitod	%f10,	%f2
	fdtox	%f2,	%f2
	ba,a,pt	%icc,	loop_1550
	orncc	%o7,	%i3,	%o4
	xorcc	%o1,	%i5,	%g6
	nop
	setx	0xD07449C9,	%l0,	%l6
	st	%l6,	[%l7 + 0x54]
	ld	[%l7 + 0x54],	%fsr
loop_1550:
	movre	%l6,	0x24A,	%i7
	orncc	%l3,	%g5,	%g7
	fbne	%fcc0,	loop_1551
	orncc	%g3,	%g2,	%l2
	xnor	%l1,	0x110C,	%i0
	movrgez	%o5,	%i4,	%o0
loop_1551:
	fbu,a	%fcc2,	loop_1552
	nop
	fitod	%f29,	%f16
	alignaddrl	%l5,	%i2,	%o3
	tg	%icc,	0x1
loop_1552:
	fbn,a	%fcc3,	loop_1553
	bcs,a,pn	%xcc,	loop_1554
	mulx	%l4,	0x10AF,	%l0
	edge8n	%o6,	%i6,	%g1
loop_1553:
	ba,a	%xcc,	loop_1555
loop_1554:
	movcc	%xcc,	%i1,	%o2
	fcmpeq16	%f16,	%f26,	%o7
	add	%l7,	0x68,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x11,	%g4,	%o4
loop_1555:
	edge16l	%o1,	%i5,	%i3
	movn	%icc,	%g6,	%l6
	tl	%xcc,	0x6
	stbar
	movneg	%icc,	%l3,	%g5
	fzeros	%f18
	fnot2	%f16,	%f16
	array8	%i7,	%g3,	%g7
	edge32	%g2,	%l1,	%l2
	fblg	%fcc0,	loop_1556
	tleu	%xcc,	0x6
	fornot1s	%f4,	%f20,	%f29
	tle	%xcc,	0x1
loop_1556:
	fmul8x16au	%f15,	%f31,	%f22
	stb	%i0,	[%l7 + 0x24]
	andcc	%i4,	0x0B90,	%o0
	fnot1s	%f27,	%f5
	udivcc	%o5,	0x030F,	%i2
	membar	#Sync
	set	0x40, %g1
	ldda	[%l7 + %g1] 0x16,	%f16
	bge	%xcc,	loop_1557
	fmovrde	%o3,	%f22,	%f2
	tcs	%xcc,	0x0
	nop
	fitod	%f12,	%f10
	fdtos	%f10,	%f19
loop_1557:
	xor	%l5,	%l0,	%l4
	wr	%g0,	0x2a,	%asi
	stxa	%i6,	[%l7 + 0x68] %asi
	membar	#Sync
	srl	%g1,	0x0C,	%o6
	fmovdpos	%icc,	%f23,	%f18
	fcmpne16	%f30,	%f28,	%i1
	srl	%o2,	%o7,	%o4
	edge32n	%o1,	%i5,	%g4
	movrgz	%i3,	0x105,	%l6
	add	%l3,	0x184A,	%g5
	lduh	[%l7 + 0x14],	%i7
	movl	%xcc,	%g3,	%g7
	sethi	0x0FD6,	%g6
	sllx	%l1,	%g2,	%i0
	fpadd16s	%f5,	%f15,	%f23
	bpos,a	loop_1558
	orcc	%i4,	0x00A2,	%l2
	fpackfix	%f24,	%f27
	udiv	%o5,	0x1CBF,	%o0
loop_1558:
	tne	%icc,	0x0
	fmul8x16al	%f23,	%f6,	%f20
	nop
	set	0x2E, %i5
	lduh	[%l7 + %i5],	%i2
	fmovsne	%icc,	%f14,	%f9
	movgu	%icc,	%o3,	%l0
	tn	%xcc,	0x7
	movvs	%xcc,	%l5,	%i6
	movg	%icc,	%g1,	%o6
	fxors	%f8,	%f29,	%f28
	stb	%l4,	[%l7 + 0x46]
	fmovse	%xcc,	%f15,	%f9
	nop
	setx	loop_1559,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movn	%icc,	%i1,	%o2
	ble	loop_1560
	array16	%o7,	%o4,	%i5
loop_1559:
	umulcc	%g4,	0x19B9,	%o1
	fmovd	%f0,	%f8
loop_1560:
	fmovsneg	%xcc,	%f0,	%f11
	mulx	%l6,	%i3,	%l3
	movvs	%xcc,	%i7,	%g5
	set	0x40, %i3
	stda	%f0,	[%l7 + %i3] 0x88
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	movpos	%icc,	%g7,	%g6
	tl	%xcc,	0x1
	brgez	%l1,	loop_1561
	xorcc	%g2,	%g3,	%i0
	tpos	%xcc,	0x5
	edge16l	%i4,	%l2,	%o0
loop_1561:
	nop
	set	0x6C, %o6
	ldswa	[%l7 + %o6] 0x04,	%i2
	fcmpne32	%f12,	%f4,	%o3
	xor	%o5,	%l5,	%i6
	addcc	%l0,	%g1,	%o6
	movn	%xcc,	%l4,	%o2
	tsubcctv	%i1,	%o7,	%i5
	sdivcc	%o4,	0x1D2B,	%o1
	edge8n	%l6,	%g4,	%i3
	set	0x58, %i1
	swapa	[%l7 + %i1] 0x18,	%l3
	srl	%g5,	%g7,	%g6
	movre	%l1,	0x1DB,	%g2
	edge32n	%i7,	%i0,	%g3
	fmovrsgez	%l2,	%f11,	%f6
	udiv	%i4,	0x0445,	%i2
	fmul8ulx16	%f10,	%f0,	%f12
	edge16n	%o0,	%o3,	%l5
	movne	%xcc,	%i6,	%o5
	edge32l	%g1,	%l0,	%o6
	xnor	%l4,	0x1F00,	%o2
	brlz	%i1,	loop_1562
	movneg	%xcc,	%o7,	%o4
	tsubcctv	%i5,	%l6,	%o1
	nop
	setx	0x2D9B55A2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f17
	fsqrts	%f17,	%f26
loop_1562:
	addcc	%i3,	%l3,	%g4
	orcc	%g5,	%g7,	%l1
	edge16	%g6,	%g2,	%i7
	movn	%icc,	%i0,	%l2
	movrgez	%i4,	0x20F,	%g3
	smulcc	%i2,	%o3,	%l5
	smul	%o0,	0x15DF,	%i6
	sdivcc	%g1,	0x0AA2,	%l0
	edge32l	%o6,	%l4,	%o5
	brlz,a	%o2,	loop_1563
	brgz,a	%i1,	loop_1564
	fmovd	%f12,	%f22
	mulx	%o7,	%i5,	%o4
loop_1563:
	fnors	%f2,	%f22,	%f31
loop_1564:
	tge	%icc,	0x4
	movn	%xcc,	%l6,	%i3
	brgz	%l3,	loop_1565
	smulcc	%g4,	0x1D2A,	%g5
	fmovsge	%xcc,	%f30,	%f25
	fmovrse	%o1,	%f19,	%f10
loop_1565:
	fmovdcc	%xcc,	%f12,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g7,	%l1,	%g6
	brlez	%g2,	loop_1566
	mulscc	%i7,	0x13ED,	%i0
	membar	0x3B
	bgu,a,pn	%xcc,	loop_1567
loop_1566:
	nop
	setx	0xB8E1FF35,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xE59E94D0,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f13
	fmuls	%f13,	%f13,	%f4
	bneg,pn	%icc,	loop_1568
	array8	%l2,	%i4,	%g3
loop_1567:
	nop
	fitod	%f3,	%f6
	te	%icc,	0x6
loop_1568:
	movvc	%xcc,	%o3,	%l5
	lduh	[%l7 + 0x1C],	%o0
	fpack32	%f24,	%f20,	%f26
	call	loop_1569
	tne	%xcc,	0x4
	te	%icc,	0x1
	fxnor	%f10,	%f0,	%f28
loop_1569:
	fexpand	%f25,	%f12
	sub	%i2,	%g1,	%l0
	tleu	%xcc,	0x1
	movrlz	%i6,	0x196,	%o6
	fones	%f15
	mulx	%o5,	%o2,	%l4
	taddcctv	%i1,	%i5,	%o7
	fors	%f7,	%f27,	%f11
	movrgz	%o4,	0x1F6,	%l6
	fmovdvc	%xcc,	%f29,	%f3
	fbo	%fcc3,	loop_1570
	fmovrde	%i3,	%f26,	%f24
	bn	%xcc,	loop_1571
	popc	%g4,	%g5
loop_1570:
	fmovrdgz	%l3,	%f0,	%f8
	addccc	%g7,	0x08BE,	%l1
loop_1571:
	fbl,a	%fcc1,	loop_1572
	bvc	%icc,	loop_1573
	fxnor	%f14,	%f22,	%f12
	fandnot2s	%f30,	%f10,	%f2
loop_1572:
	tvc	%xcc,	0x7
loop_1573:
	sllx	%o1,	0x18,	%g2
	set	0x31, %o3
	stba	%g6,	[%l7 + %o3] 0x14
	ldsh	[%l7 + 0x58],	%i7
	orcc	%l2,	0x1DF5,	%i4
	and	%i0,	%g3,	%o3
	fxors	%f27,	%f15,	%f16
	srax	%l5,	%o0,	%g1
	mova	%icc,	%l0,	%i6
	ta	%xcc,	0x1
	fsrc2	%f10,	%f10
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbu	%fcc0,	loop_1574
	andcc	%i2,	0x0E12,	%o5
	movcs	%xcc,	%o2,	%l4
	and	%o6,	0x16D9,	%i1
loop_1574:
	nop
	wr	%g0,	0x80,	%asi
	sta	%f1,	[%l7 + 0x30] %asi
	brlz	%i5,	loop_1575
	xnorcc	%o7,	%l6,	%o4
	st	%f4,	[%l7 + 0x44]
	fmovdvc	%xcc,	%f31,	%f31
loop_1575:
	array16	%i3,	%g5,	%g4
	edge16l	%g7,	%l3,	%l1
	fands	%f15,	%f23,	%f10
	smulcc	%o1,	0x0291,	%g6
	prefetch	[%l7 + 0x10],	 0x1
	edge16	%g2,	%l2,	%i7
	fmovsa	%icc,	%f22,	%f20
	bn,a,pt	%xcc,	loop_1576
	movle	%icc,	%i0,	%i4
	movvs	%icc,	%g3,	%o3
	fbuge,a	%fcc3,	loop_1577
loop_1576:
	edge32ln	%o0,	%g1,	%l0
	brgez,a	%l5,	loop_1578
	te	%icc,	0x5
loop_1577:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	brlz,a	%i6,	loop_1579
loop_1578:
	movcc	%icc,	%o5,	%o2
	bpos	loop_1580
	fmovdcs	%icc,	%f28,	%f25
loop_1579:
	tcs	%xcc,	0x2
	tcs	%icc,	0x4
loop_1580:
	fmovdcs	%icc,	%f29,	%f4
	taddcctv	%i2,	%l4,	%i1
	set	0x40, %l4
	ldda	[%l7 + %l4] 0x80,	%f0
	fbge	%fcc0,	loop_1581
	movneg	%icc,	%o6,	%i5
	movl	%xcc,	%l6,	%o7
	movpos	%xcc,	%o4,	%g5
loop_1581:
	alignaddr	%g4,	%g7,	%l3
	nop
	fitod	%f0,	%f18
	fdtox	%f18,	%f24
	fxtod	%f24,	%f2
	set	0x60, %g2
	ldswa	[%l7 + %g2] 0x04,	%l1
	edge8l	%i3,	%g6,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x30] %asi,	%g2
	fmovdvc	%xcc,	%f4,	%f22
	edge32	%i7,	%l2,	%i0
	bvs,a,pt	%icc,	loop_1582
	add	%i4,	%g3,	%o0
	edge32l	%g1,	%l0,	%o3
	tge	%icc,	0x4
loop_1582:
	tne	%xcc,	0x6
	mova	%xcc,	%i6,	%l5
	mulscc	%o2,	0x1D42,	%i2
	set	0x40, %g4
	stda	%f0,	[%l7 + %g4] 0x1e
	membar	#Sync
	for	%f28,	%f16,	%f28
	std	%f6,	[%l7 + 0x58]
	popc	%l4,	%o5
	sllx	%o6,	%i1,	%i5
	fpsub32	%f24,	%f4,	%f10
	orn	%o7,	0x0A44,	%l6
	sethi	0x1AA9,	%o4
	subccc	%g5,	%g4,	%g7
	fmovsle	%xcc,	%f29,	%f20
	movleu	%xcc,	%l3,	%l1
	fmuld8ulx16	%f23,	%f22,	%f0
	lduh	[%l7 + 0x4A],	%g6
	mova	%icc,	%i3,	%o1
	fpack32	%f16,	%f20,	%f10
	edge8ln	%i7,	%g2,	%i0
	movneg	%xcc,	%i4,	%g3
	fmovrde	%o0,	%f4,	%f28
	andcc	%g1,	0x1DE4,	%l0
	fornot1s	%f2,	%f1,	%f26
	srl	%o3,	%i6,	%l5
	edge8ln	%o2,	%l2,	%i2
	movne	%xcc,	%o5,	%l4
	edge16ln	%i1,	%i5,	%o6
	tcc	%icc,	0x4
	array8	%o7,	%l6,	%o4
	fbul,a	%fcc1,	loop_1583
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stbar
	fmovrsne	%g5,	%f10,	%f22
loop_1583:
	fmul8x16	%f21,	%f4,	%f6
	movgu	%icc,	%g7,	%l3
	edge8l	%l1,	%g4,	%i3
	fzero	%f8
	fpadd32	%f0,	%f10,	%f10
	mova	%xcc,	%o1,	%g6
	for	%f26,	%f2,	%f26
	fmovscc	%icc,	%f21,	%f25
	orncc	%g2,	%i0,	%i4
	ld	[%l7 + 0x68],	%f1
	tge	%xcc,	0x0
	add	%g3,	0x1BED,	%o0
	nop
	setx	0x8EE30C80,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x37297B4D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f14,	%f28
	ldsb	[%l7 + 0x7B],	%i7
	fbn	%fcc0,	loop_1584
	smul	%l0,	0x17E8,	%o3
	fsrc1	%f14,	%f4
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%i6
loop_1584:
	bl	%xcc,	loop_1585
	fandnot1s	%f27,	%f27,	%f4
	move	%xcc,	%g1,	%o2
	prefetch	[%l7 + 0x5C],	 0x1
loop_1585:
	xorcc	%l5,	%l2,	%i2
	addcc	%l4,	%i1,	%i5
	ble,a,pt	%icc,	loop_1586
	bvc	loop_1587
	udivx	%o6,	0x1031,	%o5
	edge8n	%l6,	%o4,	%g5
loop_1586:
	tvc	%xcc,	0x5
loop_1587:
	fbe,a	%fcc0,	loop_1588
	tge	%xcc,	0x1
	fbul	%fcc0,	loop_1589
	nop
	setx loop_1590, %l0, %l1
	jmpl %l1, %g7
loop_1588:
	sdivx	%l3,	0x080C,	%o7
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x5D] %asi,	%l1
loop_1589:
	orncc	%i3,	%g4,	%g6
loop_1590:
	sdivx	%g2,	0x1C4C,	%i0
	addc	%o1,	%g3,	%i4
	fnot1	%f22,	%f18
	edge32ln	%o0,	%l0,	%i7
	udivx	%o3,	0x16F3,	%g1
	edge8l	%o2,	%l5,	%l2
	ldx	[%l7 + 0x30],	%i2
	srlx	%i6,	0x0A,	%i1
	xorcc	%l4,	%i5,	%o6
	ldx	[%l7 + 0x70],	%o5
	array8	%l6,	%g5,	%o4
	mulscc	%g7,	%l3,	%o7
	set	0x40, %o0
	ldda	[%l7 + %o0] 0x18,	%f0
	umulcc	%i3,	%g4,	%l1
	bleu,pn	%icc,	loop_1591
	brlz	%g2,	loop_1592
	movn	%xcc,	%g6,	%i0
	udivx	%o1,	0x0CD0,	%g3
loop_1591:
	nop
	set	0x16, %g5
	lduha	[%l7 + %g5] 0x80,	%i4
loop_1592:
	movre	%o0,	0x1B2,	%l0
	fmovdn	%xcc,	%f15,	%f9
	bneg,a,pn	%icc,	loop_1593
	tvc	%icc,	0x2
	st	%f16,	[%l7 + 0x30]
	sllx	%o3,	0x03,	%g1
loop_1593:
	tvs	%xcc,	0x7
	smulcc	%i7,	%l5,	%o2
	bshuffle	%f12,	%f16,	%f26
	tleu	%xcc,	0x4
	fmovsg	%xcc,	%f5,	%f23
	fmovs	%f0,	%f5
	fpack32	%f4,	%f28,	%f18
	nop
	setx	0xC99C79A4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xC16A2C47,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fmuls	%f1,	%f16,	%f21
	edge32n	%l2,	%i2,	%i6
	udiv	%i1,	0x11B4,	%i5
	be,a,pn	%icc,	loop_1594
	umul	%o6,	%l4,	%l6
	tpos	%xcc,	0x3
	movre	%o5,	0x37A,	%g5
loop_1594:
	move	%xcc,	%o4,	%l3
	tcc	%xcc,	0x7
	fmovrdlz	%o7,	%f14,	%f4
	sir	0x1630
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%f14
	fmovdcs	%icc,	%f30,	%f27
	bg,a	loop_1595
	edge32l	%g7,	%g4,	%l1
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x38] %asi,	%g2
loop_1595:
	sllx	%g6,	%i0,	%o1
	array32	%i3,	%i4,	%g3
	fmuld8sux16	%f9,	%f13,	%f12
	tge	%xcc,	0x3
	movrne	%o0,	0x1E8,	%l0
	fmovrsne	%o3,	%f9,	%f17
	for	%f24,	%f30,	%f28
	fmovdne	%xcc,	%f31,	%f28
	umul	%i7,	%l5,	%g1
	xor	%l2,	%i2,	%i6
	ldd	[%l7 + 0x40],	%f18
	movvs	%xcc,	%i1,	%i5
	sll	%o6,	0x0F,	%l4
	andncc	%l6,	%o2,	%o5
	taddcc	%g5,	%o4,	%l3
	sdiv	%g7,	0x0BF6,	%o7
	fmovsne	%icc,	%f10,	%f3
	movpos	%icc,	%g4,	%g2
	sub	%l1,	%i0,	%g6
	popc	%o1,	%i3
	bgu,a	%icc,	loop_1596
	ld	[%l7 + 0x74],	%f2
	movrgz	%i4,	%g3,	%l0
	nop
	setx loop_1597, %l0, %l1
	jmpl %l1, %o0
loop_1596:
	movre	%i7,	%o3,	%g1
	edge16ln	%l2,	%l5,	%i2
	fmovsneg	%icc,	%f27,	%f29
loop_1597:
	fornot1	%f4,	%f0,	%f24
	bgu,pt	%xcc,	loop_1598
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i1,	%i6
	bgu,pt	%icc,	loop_1599
loop_1598:
	tvs	%xcc,	0x1
	subc	%o6,	%l4,	%i5
	fpmerge	%f26,	%f29,	%f8
loop_1599:
	fpack32	%f4,	%f14,	%f0
	sllx	%l6,	%o2,	%g5
	sir	0x138D
	ldsh	[%l7 + 0x1A],	%o4
	bcc,a	%icc,	loop_1600
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f6
	udivx	%o5,	0x1977,	%g7
	fmovdpos	%xcc,	%f28,	%f22
loop_1600:
	movneg	%icc,	%o7,	%l3
	fone	%f16
	add	%l7,	0x58,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] %asi,	%g2,	%l1
	sub	%g4,	%g6,	%o1
	st	%f9,	[%l7 + 0x74]
	edge8	%i3,	%i4,	%g3
	alignaddr	%l0,	%i0,	%i7
	st	%f28,	[%l7 + 0x64]
	or	%o3,	%g1,	%l2
	fbo	%fcc1,	loop_1601
	move	%xcc,	%o0,	%i2
	tvs	%xcc,	0x1
	fcmple32	%f10,	%f26,	%i1
loop_1601:
	umul	%i6,	%l5,	%o6
	brgz,a	%i5,	loop_1602
	fbul	%fcc2,	loop_1603
	movvc	%icc,	%l6,	%l4
	movn	%icc,	%g5,	%o4
loop_1602:
	sdiv	%o2,	0x1A43,	%g7
loop_1603:
	fbu	%fcc2,	loop_1604
	fmovda	%xcc,	%f18,	%f14
	sdivcc	%o5,	0x0822,	%o7
	tvc	%icc,	0x2
loop_1604:
	te	%xcc,	0x1
	movvc	%xcc,	%g2,	%l3
	movvc	%icc,	%l1,	%g6
	movcc	%icc,	%g4,	%o1
	tle	%icc,	0x4
	movrne	%i3,	0x32A,	%i4
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0xf8
	membar	#Sync
	fabss	%f4,	%f2
	tpos	%icc,	0x2
	edge8l	%l0,	%i0,	%g3
	pdist	%f2,	%f26,	%f2
	fbuge,a	%fcc1,	loop_1605
	bgu,a	%icc,	loop_1606
	fpackfix	%f18,	%f24
	stb	%o3,	[%l7 + 0x2D]
loop_1605:
	ble	%icc,	loop_1607
loop_1606:
	nop
	fitos	%f4,	%f15
	membar	0x61
	mova	%xcc,	%g1,	%l2
loop_1607:
	be,pn	%icc,	loop_1608
	nop
	setx	0xAC046E748FB7DC06,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f28
	setx	0x2C6D5521A0EF1979,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fmuld	%f0,	%f28,	%f26
	nop
	fitod	%f4,	%f4
	fdtoi	%f4,	%f27
	fors	%f27,	%f24,	%f28
loop_1608:
	edge16l	%i7,	%i2,	%i1
	wr	%g0,	0x80,	%asi
	sta	%f28,	[%l7 + 0x24] %asi
	mova	%xcc,	%i6,	%l5
	bcs,a,pn	%xcc,	loop_1609
	ta	%xcc,	0x7
	fbe,a	%fcc2,	loop_1610
	fpadd32s	%f5,	%f26,	%f2
loop_1609:
	bn,a,pt	%icc,	loop_1611
	fmovrdne	%o6,	%f24,	%f28
loop_1610:
	sra	%o0,	0x0F,	%i5
	tge	%icc,	0x4
loop_1611:
	fbne	%fcc1,	loop_1612
	mova	%xcc,	%l6,	%l4
	nop
	fitos	%f3,	%f18
	fstox	%f18,	%f26
	fpsub32	%f24,	%f12,	%f16
loop_1612:
	fandnot1	%f8,	%f2,	%f30
	fxnors	%f7,	%f15,	%f10
	alignaddr	%o4,	%o2,	%g5
	fpsub32s	%f3,	%f24,	%f30
	move	%icc,	%g7,	%o7
	movrgz	%o5,	0x0A5,	%g2
	fnot1	%f14,	%f20
	movleu	%xcc,	%l1,	%l3
	edge8	%g6,	%g4,	%o1
	and	%i3,	0x1121,	%l0
	edge16ln	%i4,	%g3,	%i0
	subc	%o3,	0x08A4,	%g1
	tvs	%icc,	0x7
	sir	0x0AAB
	tge	%icc,	0x5
	fbge,a	%fcc3,	loop_1613
	move	%xcc,	%l2,	%i7
	edge16ln	%i2,	%i1,	%l5
	udiv	%o6,	0x138A,	%o0
loop_1613:
	tg	%xcc,	0x4
	fbne,a	%fcc0,	loop_1614
	nop
	fitos	%f5,	%f3
	edge32ln	%i6,	%i5,	%l6
	fbo,a	%fcc1,	loop_1615
loop_1614:
	fpsub16	%f22,	%f10,	%f2
	bleu,a	%icc,	loop_1616
	movpos	%icc,	%l4,	%o2
loop_1615:
	sub	%g5,	0x0450,	%g7
	fbe,a	%fcc2,	loop_1617
loop_1616:
	srax	%o4,	%o5,	%g2
	addccc	%o7,	0x1141,	%l3
	brgez,a	%g6,	loop_1618
loop_1617:
	andn	%l1,	0x13C9,	%o1
	tsubcctv	%i3,	%g4,	%l0
	fmovdvc	%icc,	%f5,	%f31
loop_1618:
	tvc	%xcc,	0x1
	bneg	loop_1619
	movrne	%g3,	%i4,	%i0
	sdivx	%o3,	0x1217,	%g1
	te	%icc,	0x4
loop_1619:
	fpadd16s	%f14,	%f22,	%f11
	orcc	%l2,	0x1BAC,	%i7
	ble,a	loop_1620
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f4
	add	%i2,	0x1DFF,	%i1
	movl	%icc,	%o6,	%o0
loop_1620:
	bvc,a	loop_1621
	brz,a	%i6,	loop_1622
	edge32ln	%l5,	%l6,	%i5
	te	%xcc,	0x7
loop_1621:
	xnor	%o2,	0x100F,	%l4
loop_1622:
	fmovrslz	%g7,	%f23,	%f28
	edge32l	%o4,	%o5,	%g2
	nop
	setx	0x6DA2E3F7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x6D980F1D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f26,	%f28
	edge8n	%o7,	%l3,	%g5
	sub	%l1,	0x12AB,	%g6
	tvs	%icc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f8,	%f1,	%f22
	movre	%i3,	0x2F6,	%g4
	xor	%o1,	%g3,	%i4
	array32	%l0,	%o3,	%g1
	movrgez	%i0,	0x121,	%l2
	fmovsvs	%icc,	%f12,	%f25
	mova	%icc,	%i2,	%i1
	edge16n	%i7,	%o6,	%i6
	edge16	%o0,	%l6,	%l5
	xnorcc	%o2,	%l4,	%i5
	fmovsvs	%xcc,	%f28,	%f4
	movrlez	%o4,	%o5,	%g2
	sdiv	%g7,	0x08FF,	%l3
	add	%o7,	%g5,	%l1
	fandnot2s	%f28,	%f11,	%f18
	tcs	%xcc,	0x1
	fmovsgu	%xcc,	%f22,	%f31
	set	0x2C, %l3
	ldsha	[%l7 + %l3] 0x80,	%i3
	movvc	%icc,	%g6,	%g4
	fpmerge	%f31,	%f19,	%f20
	srl	%o1,	0x03,	%g3
	movrne	%l0,	0x2AF,	%i4
	movleu	%icc,	%o3,	%i0
	fba	%fcc1,	loop_1623
	movcs	%icc,	%g1,	%l2
	fandnot2s	%f14,	%f18,	%f30
	xor	%i1,	0x0611,	%i7
loop_1623:
	ble,a	loop_1624
	tle	%icc,	0x7
	bn,a,pt	%xcc,	loop_1625
	fpadd32s	%f28,	%f19,	%f13
loop_1624:
	subc	%i2,	%i6,	%o6
	fbule,a	%fcc0,	loop_1626
loop_1625:
	fcmpgt32	%f18,	%f24,	%l6
	edge32n	%l5,	%o2,	%l4
	movle	%xcc,	%i5,	%o4
loop_1626:
	st	%f28,	[%l7 + 0x20]
	movle	%icc,	%o0,	%g2
	subcc	%g7,	%o5,	%l3
	nop
	setx loop_1627, %l0, %l1
	jmpl %l1, %g5
	stx	%l1,	[%l7 + 0x18]
	movrgez	%i3,	%g6,	%o7
	and	%g4,	%g3,	%l0
loop_1627:
	nop
	set	0x10, %o7
	ldd	[%l7 + %o7],	%f20
	movvc	%icc,	%o1,	%o3
	fmovsle	%icc,	%f11,	%f24
	srl	%i4,	%i0,	%l2
	edge32n	%g1,	%i1,	%i7
	nop
	setx	loop_1628,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16n	%i2,	%i6,	%o6
	move	%xcc,	%l6,	%l5
	ldsw	[%l7 + 0x4C],	%l4
loop_1628:
	alignaddrl	%i5,	%o4,	%o2
	umul	%g2,	0x02AD,	%g7
	tpos	%xcc,	0x1
	nop
	fitod	%f10,	%f22
	fdtos	%f22,	%f0
	ldsh	[%l7 + 0x54],	%o0
	fmul8ulx16	%f22,	%f28,	%f2
	xnorcc	%l3,	0x16F3,	%o5
	umulcc	%g5,	0x1ABC,	%i3
	fands	%f17,	%f25,	%f25
	fble	%fcc1,	loop_1629
	xor	%g6,	0x04F1,	%l1
	movrgz	%g4,	0x00E,	%g3
	fxors	%f17,	%f27,	%f6
loop_1629:
	sdiv	%l0,	0x1B9B,	%o7
	for	%f10,	%f26,	%f26
	fmovsa	%xcc,	%f27,	%f20
	movn	%icc,	%o3,	%o1
	popc	%i0,	%i4
	sth	%g1,	[%l7 + 0x2C]
	xnorcc	%i1,	%l2,	%i2
	movcs	%xcc,	%i6,	%o6
	movneg	%icc,	%l6,	%i7
	udivx	%l5,	0x0EE3,	%l4
	movpos	%icc,	%o4,	%o2
	mulx	%i5,	0x1766,	%g2
	tneg	%xcc,	0x5
	fors	%f18,	%f20,	%f5
	edge16l	%g7,	%o0,	%l3
	movcs	%xcc,	%o5,	%i3
	edge16l	%g6,	%l1,	%g4
	movl	%xcc,	%g3,	%g5
	movg	%icc,	%l0,	%o7
	fmovrsgez	%o3,	%f7,	%f31
	add	%i0,	0x131C,	%i4
	movpos	%icc,	%g1,	%o1
	fbule,a	%fcc0,	loop_1630
	popc	0x0FCE,	%l2
	fmovrsgez	%i1,	%f10,	%f17
	fcmpeq32	%f22,	%f0,	%i2
loop_1630:
	orncc	%o6,	%l6,	%i6
	addccc	%i7,	0x15DA,	%l5
	fmovsle	%icc,	%f7,	%f15
	move	%xcc,	%o4,	%l4
	movrgz	%i5,	%o2,	%g2
	smul	%o0,	%g7,	%l3
	nop
	setx	loop_1631,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	brz,a	%o5,	loop_1632
	orn	%i3,	%l1,	%g6
	fnand	%f30,	%f8,	%f20
loop_1631:
	orncc	%g3,	%g4,	%l0
loop_1632:
	ldd	[%l7 + 0x68],	%f6
	udivx	%o7,	0x09D8,	%o3
	nop
	setx	0xE0615DCC,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	nop
	fitos	%f6,	%f19
	taddcc	%i0,	0x1F00,	%i4
	movrlez	%g1,	%g5,	%o1
	fmovdneg	%xcc,	%f29,	%f20
	fandnot1s	%f23,	%f27,	%f28
	array32	%i1,	%l2,	%i2
	xnor	%l6,	0x07C2,	%o6
	xnorcc	%i7,	0x149A,	%i6
	movg	%xcc,	%l5,	%o4
	nop
	setx	0xEA551487B04A2E27,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	fnot1	%f26,	%f12
	sllx	%l4,	%o2,	%i5
	movvc	%icc,	%g2,	%g7
	for	%f4,	%f0,	%f8
	tsubcc	%o0,	%o5,	%i3
	fbn	%fcc2,	loop_1633
	addc	%l1,	%g6,	%g3
	addcc	%l3,	0x1F07,	%g4
	fxnor	%f20,	%f2,	%f14
loop_1633:
	tpos	%icc,	0x4
	movcs	%xcc,	%o7,	%l0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o3,	%i4,	%g1
	tneg	%xcc,	0x0
	brnz	%i0,	loop_1634
	andn	%o1,	0x0202,	%g5
	fpack32	%f22,	%f0,	%f16
	fsrc2s	%f4,	%f8
loop_1634:
	ta	%xcc,	0x7
	bge,pn	%icc,	loop_1635
	movrlez	%l2,	0x239,	%i2
	fbu	%fcc0,	loop_1636
	subc	%i1,	%o6,	%l6
loop_1635:
	nop
	wr	%g0,	0x81,	%asi
	prefetcha	[%l7 + 0x30] %asi,	 0x3
loop_1636:
	nop
	fitod	%f0,	%f24
	fbul	%fcc3,	loop_1637
	stb	%l5,	[%l7 + 0x6F]
	fnot1	%f8,	%f8
	edge16	%o4,	%l4,	%o2
loop_1637:
	movcs	%xcc,	%i5,	%g2
	tne	%icc,	0x3
	tpos	%icc,	0x6
	ba	%icc,	loop_1638
	fornot1	%f0,	%f8,	%f14
	tge	%xcc,	0x0
	fmovrdlez	%g7,	%f22,	%f12
loop_1638:
	popc	%i6,	%o5
	udivcc	%i3,	0x1319,	%l1
	sth	%o0,	[%l7 + 0x26]
	tneg	%xcc,	0x4
	set	0x77, %l1
	ldsba	[%l7 + %l1] 0x14,	%g3
	fandnot1	%f18,	%f10,	%f30
	movle	%xcc,	%g6,	%g4
	fmovdg	%xcc,	%f19,	%f12
	edge32n	%l3,	%l0,	%o3
	fmovdl	%icc,	%f29,	%f2
	movpos	%icc,	%o7,	%i4
	sth	%i0,	[%l7 + 0x2A]
	orncc	%o1,	%g5,	%g1
	fba	%fcc3,	loop_1639
	tcs	%icc,	0x0
	edge8	%l2,	%i2,	%o6
	sdiv	%i1,	0x0D1B,	%l6
loop_1639:
	tcc	%xcc,	0x6
	fpadd16	%f30,	%f10,	%f12
	array32	%i7,	%l5,	%o4
	be,pn	%icc,	loop_1640
	sllx	%l4,	0x10,	%i5
	sir	0x00EF
	bleu,pn	%icc,	loop_1641
loop_1640:
	movl	%icc,	%g2,	%o2
	xor	%i6,	0x09B8,	%g7
	movleu	%icc,	%i3,	%l1
loop_1641:
	movrne	%o5,	0x0DD,	%g3
	set	0x0C, %l6
	lduwa	[%l7 + %l6] 0x10,	%g6
	edge16	%g4,	%o0,	%l0
	set	0x1E, %o5
	ldsha	[%l7 + %o5] 0x14,	%l3
	movcs	%xcc,	%o7,	%o3
	add	%i4,	%o1,	%i0
	set	0x7A, %i4
	ldsba	[%l7 + %i4] 0x04,	%g1
	fmovdgu	%xcc,	%f2,	%f24
	sethi	0x0AF5,	%g5
	orn	%i2,	0x12BA,	%o6
	andn	%l2,	%l6,	%i7
	andncc	%i1,	%l5,	%l4
	taddcc	%o4,	%i5,	%o2
	addccc	%i6,	%g2,	%i3
	movvc	%xcc,	%g7,	%l1
	prefetch	[%l7 + 0x34],	 0x3
	and	%o5,	%g6,	%g3
	fandnot2s	%f30,	%f13,	%f7
	edge16l	%o0,	%l0,	%l3
	tsubcctv	%o7,	0x0540,	%g4
	fpsub16s	%f0,	%f16,	%f23
	fnor	%f2,	%f16,	%f6
	umul	%o3,	%o1,	%i4
	srl	%g1,	%g5,	%i2
	nop
	setx	loop_1642,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fblg	%fcc3,	loop_1643
	fcmpeq32	%f30,	%f8,	%i0
	edge16n	%l2,	%l6,	%o6
loop_1642:
	ldx	[%l7 + 0x60],	%i1
loop_1643:
	nop
	set	0x1A, %o4
	lduba	[%l7 + %o4] 0x14,	%i7
	set	0x70, %g7
	lduwa	[%l7 + %g7] 0x14,	%l4
	tleu	%icc,	0x3
	fmovsneg	%xcc,	%f14,	%f10
	bne,a	%xcc,	loop_1644
	array16	%o4,	%i5,	%o2
	array16	%l5,	%i6,	%g2
	wr	%g0,	0x16,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1644:
	sra	%i3,	0x10,	%g7
	tvs	%xcc,	0x3
	umulcc	%l1,	%o5,	%g6
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x58] %asi,	%o0
	udivcc	%l0,	0x0C71,	%g3
	movneg	%xcc,	%l3,	%g4
	fbe,a	%fcc3,	loop_1645
	ldub	[%l7 + 0x20],	%o7
	movgu	%xcc,	%o1,	%i4
	sub	%o3,	0x1C8E,	%g5
loop_1645:
	tl	%xcc,	0x7
	nop
	setx	loop_1646,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movneg	%xcc,	%g1,	%i0
	sll	%i2,	%l2,	%l6
	fble	%fcc0,	loop_1647
loop_1646:
	edge8l	%o6,	%i1,	%l4
	array8	%i7,	%o4,	%i5
	movcc	%xcc,	%l5,	%i6
loop_1647:
	tneg	%icc,	0x3
	srlx	%o2,	0x09,	%i3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tle	%icc,	0x6
	tvc	%icc,	0x0
	bneg,a	%xcc,	loop_1648
	umulcc	%g7,	0x0DAA,	%l1
	fmovdn	%xcc,	%f4,	%f1
	stw	%g2,	[%l7 + 0x70]
loop_1648:
	lduh	[%l7 + 0x2C],	%o5
	nop
	set	0x7A, %g3
	ldsh	[%l7 + %g3],	%o0
	set	0x3C, %i6
	sta	%f27,	[%l7 + %i6] 0x89
	fsrc2	%f6,	%f14
	edge8ln	%g6,	%g3,	%l3
	fmovd	%f28,	%f2
	sll	%g4,	0x1C,	%l0
	call	loop_1649
	brlz,a	%o1,	loop_1650
	fmovsle	%icc,	%f15,	%f26
	array16	%i4,	%o7,	%o3
loop_1649:
	xor	%g1,	0x1FBE,	%i0
loop_1650:
	st	%f17,	[%l7 + 0x48]
	edge8	%g5,	%l2,	%l6
	set	0x56, %i0
	stba	%o6,	[%l7 + %i0] 0x80
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i2,	%i1
	fmovsa	%xcc,	%f16,	%f22
	movcs	%xcc,	%i7,	%l4
	movvs	%xcc,	%i5,	%l5
	fnors	%f30,	%f4,	%f12
	movpos	%xcc,	%i6,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x18,	%asi
	stha	%i3,	[%l7 + 0x2A] %asi
	wr	%g0,	0x81,	%asi
	sta	%f20,	[%l7 + 0x74] %asi
	edge16l	%o2,	%l1,	%g2
	bcc,a,pn	%icc,	loop_1651
	tle	%xcc,	0x7
	flush	%l7 + 0x38
	nop
	setx	0x904756E2,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
loop_1651:
	fmovrse	%o5,	%f31,	%f6
	array32	%g7,	%o0,	%g3
	nop
	setx	loop_1652,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
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
	array16	%l3,	%g4,	%g6
	fbge,a	%fcc3,	loop_1654
loop_1652:
	sdivcc	%l0,	0x14FF,	%o1
loop_1653:
	array16	%i4,	%o7,	%g1
	fands	%f27,	%f19,	%f11
loop_1654:
	fbue	%fcc3,	loop_1655
	movne	%icc,	%o3,	%g5
	fnot2s	%f13,	%f23
	tne	%icc,	0x6
loop_1655:
	fsrc2	%f30,	%f8
	fnot1s	%f2,	%f26
	orncc	%l2,	0x06E3,	%l6
	fmovdne	%xcc,	%f3,	%f1
	fnot1s	%f21,	%f4
	tpos	%icc,	0x3
	movrlez	%o6,	%i2,	%i0
	nop
	setx	0x5056D359,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
	tn	%icc,	0x3
	fbul	%fcc2,	loop_1656
	array8	%i1,	%i7,	%l4
	fba,a	%fcc3,	loop_1657
	mova	%icc,	%i5,	%i6
loop_1656:
	nop
	wr	%g0,	0x10,	%asi
	ldsba	[%l7 + 0x0A] %asi,	%o4
loop_1657:
	movrgz	%l5,	%o2,	%i3
	ldsh	[%l7 + 0x2C],	%l1
	tcs	%icc,	0x1
	fbo,a	%fcc0,	loop_1658
	movgu	%xcc,	%o5,	%g2
	tvs	%icc,	0x2
	sdivx	%o0,	0x1C2C,	%g3
loop_1658:
	nop
	set	0x3C, %l5
	lda	[%l7 + %l5] 0x88,	%f22
	bcc,pt	%xcc,	loop_1659
	xnorcc	%g7,	%l3,	%g6
	fbu	%fcc3,	loop_1660
	lduw	[%l7 + 0x58],	%g4
loop_1659:
	andcc	%l0,	%o1,	%o7
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x64] %asi,	%i4
loop_1660:
	movre	%o3,	0x398,	%g1
	tvc	%icc,	0x7
	tvc	%xcc,	0x1
	andcc	%g5,	%l2,	%o6
	sllx	%i2,	0x07,	%l6
	ld	[%l7 + 0x60],	%f16
	set	0x40, %l2
	ldswa	[%l7 + %l2] 0x89,	%i0
	lduh	[%l7 + 0x5A],	%i7
	fmovrslez	%l4,	%f11,	%f29
	ldd	[%l7 + 0x48],	%i0
	fnot2	%f20,	%f28
	movvc	%xcc,	%i5,	%o4
	fmovdl	%icc,	%f26,	%f25
	addccc	%l5,	%o2,	%i6
	edge32n	%l1,	%o5,	%i3
	fbuge	%fcc0,	loop_1661
	popc	%g2,	%g3
	sllx	%g7,	%l3,	%o0
	popc	%g6,	%g4
loop_1661:
	andcc	%l0,	0x1825,	%o7
	orn	%i4,	0x10FF,	%o3
	subccc	%o1,	0x036E,	%g1
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
	te	%xcc,	0x1
	bvs,a	loop_1662
	edge8n	%l2,	%o6,	%i2
	fbul	%fcc1,	loop_1663
	fmovs	%f22,	%f8
loop_1662:
	movl	%icc,	%l6,	%g5
	movn	%icc,	%i0,	%l4
loop_1663:
	umulcc	%i7,	%i5,	%i1
	orcc	%l5,	%o4,	%i6
	orcc	%l1,	%o2,	%o5
	fandnot2	%f24,	%f14,	%f6
	movcc	%icc,	%g2,	%i3
	andcc	%g3,	%g7,	%o0
	sdivcc	%l3,	0x0A1D,	%g6
	fmul8x16	%f7,	%f16,	%f28
	stx	%l0,	[%l7 + 0x40]
	bpos,a,pn	%xcc,	loop_1664
	movvs	%xcc,	%g4,	%o7
	alignaddrl	%o3,	%i4,	%o1
	alignaddr	%g1,	%o6,	%i2
loop_1664:
	nop
	setx loop_1665, %l0, %l1
	jmpl %l1, %l6
	tne	%icc,	0x1
	movle	%icc,	%g5,	%l2
	fnot1	%f14,	%f28
loop_1665:
	nop
	set	0x40, %i7
	ldda	[%l7 + %i7] 0x14,	%f0
	sir	0x039B
	fmovrdlez	%i0,	%f12,	%f2
	movpos	%icc,	%l4,	%i7
	fbl	%fcc0,	loop_1666
	ldsw	[%l7 + 0x64],	%i5
	addc	%l5,	0x0AF9,	%o4
	bvc,a,pn	%icc,	loop_1667
loop_1666:
	movpos	%icc,	%i6,	%l1
	movrgez	%i1,	%o5,	%o2
	fmovscs	%xcc,	%f28,	%f17
loop_1667:
	fsrc2	%f30,	%f26
	nop
	set	0x68, %g6
	ldsb	[%l7 + %g6],	%g2
	fexpand	%f16,	%f2
	and	%g3,	0x08A7,	%g7
	sdivcc	%i3,	0x06D0,	%o0
	andn	%g6,	%l0,	%g4
	ldx	[%l7 + 0x70],	%l3
	set	0x40, %o1
	stda	%f16,	[%l7 + %o1] 0x88
	addccc	%o7,	0x12CC,	%i4
	tle	%xcc,	0x3
	taddcc	%o1,	%g1,	%o3
	fnegd	%f20,	%f6
	andn	%o6,	0x1EA5,	%i2
	fpsub32s	%f0,	%f17,	%f17
	xor	%l6,	%l2,	%g5
	fbn	%fcc0,	loop_1668
	swap	[%l7 + 0x14],	%i0
	nop
	setx	loop_1669,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0xA861CF0F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x2A0DF64A,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fdivs	%f10,	%f24,	%f31
loop_1668:
	alignaddrl	%l4,	%i7,	%i5
	movcc	%icc,	%l5,	%o4
loop_1669:
	fcmpne32	%f20,	%f30,	%l1
	fmovrdgez	%i6,	%f20,	%f26
	call	loop_1670
	edge32n	%i1,	%o5,	%o2
	set	0x74, %o2
	stba	%g3,	[%l7 + %o2] 0x10
loop_1670:
	be	loop_1671
	fbn,a	%fcc0,	loop_1672
	fbne,a	%fcc2,	loop_1673
	movgu	%xcc,	%g2,	%g7
loop_1671:
	mulscc	%o0,	0x0DE3,	%i3
loop_1672:
	fmovsg	%icc,	%f0,	%f18
loop_1673:
	fmovrsne	%l0,	%f6,	%f2
	move	%xcc,	%g4,	%g6
	udivcc	%l3,	0x0BBC,	%i4
	bn	%icc,	loop_1674
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o1,	%g1
	nop
	fitod	%f6,	%f6
	fdtox	%f6,	%f2
	fxtod	%f2,	%f26
loop_1674:
	movge	%icc,	%o3,	%o6
	nop
	set	0x2C, %i5
	stb	%o7,	[%l7 + %i5]
	addc	%l6,	%i2,	%g5
	set	0x77, %i3
	stba	%i0,	[%l7 + %i3] 0xe2
	membar	#Sync
	edge16n	%l4,	%l2,	%i5
	addccc	%i7,	%o4,	%l5
	fbge	%fcc0,	loop_1675
	orncc	%l1,	%i1,	%i6
	fones	%f31
	set	0x60, %g1
	lduha	[%l7 + %g1] 0x10,	%o2
loop_1675:
	edge8n	%o5,	%g2,	%g7
	set	0x43, %i1
	stba	%g3,	[%l7 + %i1] 0x0c
	fcmpeq32	%f12,	%f4,	%i3
	tgu	%icc,	0x0
	subccc	%l0,	0x132F,	%o0
	brgez,a	%g4,	loop_1676
	xorcc	%g6,	%l3,	%o1
	set	0x38, %o6
	stxa	%g1,	[%l7 + %o6] 0x15
loop_1676:
	bleu	%xcc,	loop_1677
	taddcc	%o3,	0x0647,	%i4
	fbo,a	%fcc2,	loop_1678
	fmovdneg	%xcc,	%f24,	%f16
loop_1677:
	fcmpeq16	%f8,	%f8,	%o6
	fmovscs	%xcc,	%f16,	%f31
loop_1678:
	fornot1s	%f4,	%f21,	%f25
	movne	%icc,	%l6,	%o7
	nop
	setx	0x5B509601B07701DF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	fpadd16s	%f28,	%f15,	%f19
	movrlz	%g5,	0x124,	%i2
	addc	%l4,	%l2,	%i0
	brz	%i7,	loop_1679
	addccc	%o4,	%l5,	%l1
	movl	%xcc,	%i1,	%i6
	array32	%i5,	%o5,	%o2
loop_1679:
	sethi	0x11BC,	%g7
	tcc	%icc,	0x1
	ldsh	[%l7 + 0x24],	%g2
	alignaddrl	%g3,	%l0,	%o0
	fmovde	%icc,	%f6,	%f19
	edge16l	%i3,	%g6,	%g4
	tvs	%icc,	0x5
	tneg	%icc,	0x1
	fbge,a	%fcc3,	loop_1680
	addc	%o1,	%l3,	%o3
	stw	%g1,	[%l7 + 0x30]
	fble,a	%fcc2,	loop_1681
loop_1680:
	edge16n	%i4,	%o6,	%o7
	nop
	setx	0x24EFBE5445B1059D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x1662F86D81160FF4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	faddd	%f28,	%f26,	%f16
	mulx	%g5,	%i2,	%l4
loop_1681:
	addccc	%l2,	%i0,	%l6
	smulcc	%o4,	%i7,	%l1
	call	loop_1682
	alignaddrl	%i1,	%i6,	%i5
	tl	%icc,	0x5
	alignaddrl	%o5,	%l5,	%o2
loop_1682:
	bg	%xcc,	loop_1683
	taddcc	%g2,	%g3,	%g7
	tvs	%xcc,	0x3
	alignaddr	%l0,	%i3,	%g6
loop_1683:
	orcc	%o0,	%g4,	%l3
	stbar
	swap	[%l7 + 0x30],	%o1
	set	0x66, %o3
	ldsha	[%l7 + %o3] 0x15,	%g1
	tvc	%icc,	0x1
	movrgez	%o3,	0x227,	%i4
	nop
	set	0x24, %g2
	prefetch	[%l7 + %g2],	 0x2
	wr	%g0,	0x81,	%asi
	ldsha	[%l7 + 0x28] %asi,	%o6
	fpack32	%f22,	%f12,	%f2
	add	%o7,	0x09F5,	%g5
	orn	%l4,	0x1B38,	%i2
	edge16l	%l2,	%i0,	%o4
	edge32l	%i7,	%l1,	%i1
	membar	0x62
	orncc	%i6,	%i5,	%l6
	add	%l7,	0x54,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] 0x10,	%o5,	%o2
	fnot2s	%f24,	%f10
	srl	%l5,	%g3,	%g2
	movrne	%l0,	0x296,	%i3
	prefetch	[%l7 + 0x30],	 0x0
	sir	0x1BE2
	nop
	fitos	%f14,	%f27
	fstod	%f27,	%f24
	popc	%g7,	%o0
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	orn	%g4,	0x0B37,	%g6
	smulcc	%o1,	%g1,	%o3
	srax	%l3,	%o6,	%i4
	movneg	%icc,	%g5,	%o7
	nop
	setx	0x688DA6ED1050B28D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	brlz	%l4,	loop_1684
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
	edge32n	%l2,	%i0,	%i2
	fxors	%f2,	%f28,	%f18
loop_1684:
	xorcc	%i7,	0x187B,	%l1
loop_1685:
	and	%i1,	%o4,	%i5
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x6B] %asi,	%l6
	smul	%i6,	0x0952,	%o5
	tge	%icc,	0x6
	umul	%o2,	%l5,	%g2
	fmovd	%f22,	%f8
	fbug,a	%fcc3,	loop_1686
	nop
	setx	0x0074AB56,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	orn	%l0,	%i3,	%g3
	fmovda	%xcc,	%f20,	%f1
loop_1686:
	nop
	setx	0xC79854C9606B6AB3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	fornot2	%f14,	%f20,	%f8
	nop
	setx loop_1687, %l0, %l1
	jmpl %l1, %g7
	sdivx	%g4,	0x07FD,	%o0
	ble	%xcc,	loop_1688
	bgu,a	loop_1689
loop_1687:
	sllx	%g6,	%g1,	%o1
	fmovsne	%icc,	%f23,	%f16
loop_1688:
	movrgz	%l3,	0x315,	%o3
loop_1689:
	fcmpne32	%f12,	%f20,	%i4
	alignaddrl	%g5,	%o6,	%o7
	mulx	%l2,	0x01EA,	%l4
	mulscc	%i2,	0x1988,	%i7
	sllx	%i0,	0x1E,	%l1
	tn	%xcc,	0x3
	tleu	%icc,	0x3
	sdivcc	%i1,	0x0C4C,	%i5
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x30] %asi,	%o4
	nop
	setx	loop_1690,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovdgu	%xcc,	%f8,	%f12
	movneg	%xcc,	%i6,	%l6
	and	%o2,	0x1553,	%l5
loop_1690:
	std	%f16,	[%l7 + 0x10]
	ba,pn	%xcc,	loop_1691
	fmul8x16au	%f7,	%f31,	%f18
	edge16	%g2,	%l0,	%o5
	smulcc	%g3,	%i3,	%g7
loop_1691:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o0
	casxa	[%l6] 0x80,	%o0,	%g6
	xnor	%g1,	0x05D8,	%o1
	tge	%icc,	0x0
	brlz,a	%g4,	loop_1692
	fornot2s	%f8,	%f19,	%f10
	edge8	%o3,	%i4,	%g5
	movcs	%icc,	%o6,	%l3
loop_1692:
	subcc	%o7,	%l4,	%l2
	bvs,pt	%xcc,	loop_1693
	tneg	%xcc,	0x3
	tvs	%icc,	0x6
	ba,a	%xcc,	loop_1694
loop_1693:
	udivx	%i7,	0x1442,	%i2
	edge16l	%l1,	%i0,	%i5
	sethi	0x1871,	%o4
loop_1694:
	tsubcc	%i6,	0x0B2D,	%i1
	fmuld8ulx16	%f29,	%f31,	%f22
	add	%l6,	0x15A0,	%l5
	fcmpgt16	%f4,	%f24,	%g2
	brgez,a	%l0,	loop_1695
	array16	%o2,	%g3,	%o5
	fpack32	%f18,	%f10,	%f12
	bgu	loop_1696
loop_1695:
	tl	%icc,	0x4
	bl,a,pt	%icc,	loop_1697
	fornot2	%f22,	%f26,	%f30
loop_1696:
	fba	%fcc1,	loop_1698
	fornot1	%f30,	%f20,	%f28
loop_1697:
	fba,a	%fcc1,	loop_1699
	xorcc	%i3,	0x1B67,	%o0
loop_1698:
	fzeros	%f28
	nop
	setx	0xAEC60EB5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x7E631C62,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fadds	%f26,	%f12,	%f20
loop_1699:
	fcmpgt16	%f22,	%f26,	%g6
	edge8n	%g7,	%g1,	%o1
	tn	%xcc,	0x6
	addc	%o3,	%g4,	%i4
	edge32n	%o6,	%g5,	%l3
	ldsb	[%l7 + 0x51],	%o7
	fnot1s	%f26,	%f8
	srl	%l4,	%l2,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i2,	0x0C8D,	%i0
	movle	%icc,	%i5,	%o4
	addccc	%i6,	0x0910,	%l1
	nop
	setx	0xCE29D6D7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x8A03947F,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f24,	%f9
	or	%l6,	%i1,	%l5
	movcc	%icc,	%l0,	%o2
	wr	%g0,	0x20,	%asi
	ldxa	[%g0 + 0x8] %asi,	%g3
	edge16	%o5,	%i3,	%o0
	movg	%xcc,	%g6,	%g7
	edge32l	%g1,	%g2,	%o1
	tn	%icc,	0x5
	tneg	%icc,	0x1
	fxnors	%f21,	%f20,	%f24
	tvc	%xcc,	0x3
	movl	%icc,	%o3,	%g4
	movvc	%xcc,	%i4,	%o6
	lduw	[%l7 + 0x5C],	%l3
	movg	%xcc,	%g5,	%l4
	fmovsg	%xcc,	%f2,	%f29
	fmovsneg	%icc,	%f26,	%f22
	movrgz	%l2,	0x239,	%o7
	udiv	%i7,	0x1978,	%i2
	call	loop_1700
	fmovrsgz	%i0,	%f24,	%f10
	movg	%icc,	%o4,	%i5
	add	%i6,	%l1,	%l6
loop_1700:
	fbule,a	%fcc1,	loop_1701
	subcc	%i1,	%l5,	%o2
	movpos	%icc,	%l0,	%g3
	fexpand	%f1,	%f26
loop_1701:
	movne	%icc,	%i3,	%o0
	brgz	%o5,	loop_1702
	fbge	%fcc0,	loop_1703
	fornot1s	%f17,	%f0,	%f30
	fbule,a	%fcc2,	loop_1704
loop_1702:
	tl	%xcc,	0x0
loop_1703:
	sdivcc	%g6,	0x1193,	%g1
	nop
	setx	0x95E4DAAF1AED059B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xBF4BD3926AA9A59C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	faddd	%f10,	%f24,	%f26
loop_1704:
	umulcc	%g2,	%g7,	%o1
	stbar
	tsubcc	%g4,	0x054D,	%i4
	edge32l	%o3,	%o6,	%g5
	edge32n	%l3,	%l4,	%l2
	fmovsle	%xcc,	%f0,	%f1
	srl	%o7,	%i7,	%i2
	taddcc	%o4,	0x07F4,	%i5
	bne,pt	%icc,	loop_1705
	fmuld8ulx16	%f5,	%f18,	%f6
	addc	%i0,	0x0195,	%l1
	popc	%l6,	%i6
loop_1705:
	tgu	%icc,	0x0
	be,a,pt	%icc,	loop_1706
	movne	%icc,	%i1,	%l5
	bl,a,pt	%icc,	loop_1707
	movre	%l0,	%g3,	%i3
loop_1706:
	fpsub16s	%f17,	%f11,	%f3
	and	%o0,	0x0711,	%o2
loop_1707:
	fba,a	%fcc2,	loop_1708
	movrgz	%o5,	%g1,	%g6
	fxnor	%f16,	%f16,	%f22
	mulscc	%g7,	0x1AA8,	%o1
loop_1708:
	andcc	%g4,	0x1AB3,	%g2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x58] %asi,	%i4
	sdiv	%o3,	0x1AD0,	%g5
	movcs	%icc,	%o6,	%l3
	fbg,a	%fcc0,	loop_1709
	fexpand	%f15,	%f8
	mulscc	%l2,	%l4,	%o7
	fnors	%f1,	%f31,	%f3
loop_1709:
	movrne	%i2,	0x289,	%i7
	fors	%f10,	%f9,	%f1
	nop
	fitod	%f12,	%f2
	fdtox	%f2,	%f12
	fbg	%fcc1,	loop_1710
	ldsh	[%l7 + 0x7A],	%i5
	fmovdg	%xcc,	%f18,	%f19
	andcc	%i0,	%l1,	%l6
loop_1710:
	nop
	setx	loop_1711,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsneg	%xcc,	%f20,	%f28
	sll	%i6,	0x14,	%o4
	wr	%g0,	0xe2,	%asi
	stba	%l5,	[%l7 + 0x3C] %asi
	membar	#Sync
loop_1711:
	xnor	%i1,	%l0,	%g3
	alignaddrl	%i3,	%o0,	%o2
	edge8ln	%g1,	%o5,	%g7
	bcc,a	%xcc,	loop_1712
	stb	%o1,	[%l7 + 0x68]
	bcs,a	%xcc,	loop_1713
	sir	0x1531
loop_1712:
	fxnors	%f12,	%f2,	%f21
	fmovde	%xcc,	%f24,	%f9
loop_1713:
	fpadd16	%f4,	%f16,	%f22
	tvs	%xcc,	0x2
	ldsb	[%l7 + 0x1B],	%g6
	fmul8ulx16	%f24,	%f2,	%f8
	edge32ln	%g2,	%i4,	%o3
	tcs	%icc,	0x6
	fmovrdne	%g5,	%f12,	%f22
	movrlez	%o6,	%l3,	%l2
	set	0x78, %l4
	sta	%f13,	[%l7 + %l4] 0x88
	movcs	%xcc,	%g4,	%l4
	fpadd16	%f20,	%f8,	%f6
	addccc	%o7,	0x1B4A,	%i2
	movneg	%xcc,	%i7,	%i5
	movrlz	%l1,	0x00E,	%i0
	subccc	%i6,	%o4,	%l6
	fornot1	%f16,	%f14,	%f12
	nop
	setx	0x205560D2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	fsqrts	%f26,	%f22
	fba,a	%fcc0,	loop_1714
	movg	%xcc,	%i1,	%l5
	mulscc	%g3,	0x0157,	%i3
	array32	%l0,	%o0,	%o2
loop_1714:
	srax	%o5,	0x03,	%g1
	fbe	%fcc1,	loop_1715
	fmovdl	%icc,	%f30,	%f4
	edge8l	%g7,	%g6,	%g2
	fcmpgt16	%f0,	%f30,	%o1
loop_1715:
	tvc	%xcc,	0x7
	ldx	[%l7 + 0x08],	%i4
	fmovrsgez	%o3,	%f5,	%f0
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tsubcc	%g5,	%l3,	%l2
	fmovdn	%xcc,	%f21,	%f30
	udiv	%o6,	0x025A,	%l4
	udiv	%o7,	0x169E,	%g4
	fmovsneg	%icc,	%f18,	%f22
	nop
	setx	0x907DA2D8,	%l0,	%l6
	st	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%fsr
	wr	%g0,	0x19,	%asi
	lduwa	[%l7 + 0x5C] %asi,	%i2
	edge8ln	%i7,	%i5,	%i0
	fbge	%fcc0,	loop_1716
	udivcc	%l1,	0x00C4,	%i6
	srlx	%o4,	0x1A,	%l6
	xorcc	%i1,	0x1B30,	%g3
loop_1716:
	edge32n	%l5,	%i3,	%o0
	membar	0x6D
	bg	%xcc,	loop_1717
	membar	0x10
	fornot1s	%f29,	%f28,	%f24
	addcc	%o2,	%l0,	%o5
loop_1717:
	edge16n	%g7,	%g6,	%g2
	edge32n	%o1,	%i4,	%o3
	tn	%icc,	0x6
	fmovrsne	%g5,	%f1,	%f24
	set	0x18, %o0
	ldxa	[%g0 + %o0] 0x58,	%l3
	edge16	%g1,	%o6,	%l2
	bcc,a,pn	%icc,	loop_1718
	nop
	setx	0xEEA7DCA7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f24
	setx	0x6596634D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f23
	fsubs	%f23,	%f24,	%f26
	mulscc	%o7,	%g4,	%i2
	movne	%icc,	%i7,	%l4
loop_1718:
	edge16n	%i5,	%i0,	%l1
	nop
	setx	0xD3811DAD,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xF01BC522,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fmuls	%f31,	%f13,	%f16
	srlx	%o4,	0x08,	%i6
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l6,	%i1
	fpadd32s	%f6,	%f16,	%f12
	alignaddrl	%g3,	%l5,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x60, %g4
	ldxa	[%l7 + %g4] 0x04,	%o2
	xorcc	%l0,	0x021A,	%o5
	ldsw	[%l7 + 0x44],	%i3
	movrgez	%g6,	%g2,	%o1
	fcmple16	%f0,	%f14,	%g7
	edge16	%i4,	%g5,	%o3
	membar	#Sync
	wr	%g0,	0xf8,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	movcs	%xcc,	%g1,	%l3
	movge	%xcc,	%o6,	%l2
	bcs	loop_1719
	array16	%o7,	%g4,	%i2
	movge	%xcc,	%i7,	%i5
	fnegd	%f12,	%f8
loop_1719:
	xorcc	%l4,	%l1,	%o4
	stbar
	fbo	%fcc0,	loop_1720
	movre	%i6,	0x245,	%i0
	xorcc	%l6,	0x1909,	%i1
	tg	%icc,	0x5
loop_1720:
	udivcc	%l5,	0x072C,	%g3
	sllx	%o2,	%l0,	%o5
	taddcc	%o0,	0x14C0,	%i3
	fbge	%fcc3,	loop_1721
	udivcc	%g2,	0x1FB3,	%o1
	tne	%icc,	0x1
	udivx	%g7,	0x0B8B,	%g6
loop_1721:
	ldsb	[%l7 + 0x45],	%i4
	fbne,a	%fcc1,	loop_1722
	nop
	setx	0x9063AFF6,	%l0,	%l6
	st	%l6,	[%l7 + 0x38]
	ld	[%l7 + 0x38],	%fsr
	set	0x20, %l0
	lda	[%l7 + %l0] 0x04,	%f3
loop_1722:
	edge32n	%o3,	%g1,	%l3
	sra	%o6,	0x05,	%l2
	edge16n	%g5,	%o7,	%i2
	movl	%icc,	%i7,	%g4
	fbu	%fcc1,	loop_1723
	stw	%l4,	[%l7 + 0x0C]
	fbg,a	%fcc0,	loop_1724
	mova	%icc,	%i5,	%l1
loop_1723:
	move	%xcc,	%o4,	%i0
	srl	%i6,	0x1F,	%l6
loop_1724:
	smulcc	%l5,	%g3,	%o2
	nop
	fitos	%f8,	%f19
	fstox	%f19,	%f6
	fxtos	%f6,	%f24
	movle	%icc,	%l0,	%i1
	sra	%o0,	0x02,	%o5
	tpos	%icc,	0x7
	movrgz	%i3,	0x26D,	%o1
	sll	%g7,	%g6,	%i4
	ldsw	[%l7 + 0x50],	%g2
	orcc	%o3,	%g1,	%l3
	andn	%o6,	0x0A6C,	%l2
	tn	%xcc,	0x2
	fnegs	%f23,	%f18
	udiv	%g5,	0x0B78,	%o7
	ldsb	[%l7 + 0x3D],	%i7
	tl	%icc,	0x1
	fbug,a	%fcc1,	loop_1725
	xor	%g4,	%l4,	%i2
	ldsw	[%l7 + 0x0C],	%l1
	std	%f10,	[%l7 + 0x58]
loop_1725:
	nop
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x76] %asi,	%i5
	orncc	%i0,	%o4,	%l6
	alignaddrl	%l5,	%g3,	%o2
	sethi	0x0FFF,	%i6
	umul	%l0,	%i1,	%o5
	orcc	%i3,	%o1,	%g7
	fcmpgt32	%f26,	%f20,	%g6
	andcc	%o0,	%i4,	%o3
	tsubcc	%g1,	0x0037,	%l3
	xor	%o6,	%l2,	%g2
	udivcc	%o7,	0x14E4,	%i7
	taddcc	%g5,	0x1C7C,	%g4
	fmovse	%xcc,	%f17,	%f26
	set	0x70, %l3
	stwa	%i2,	[%l7 + %l3] 0x88
	edge32n	%l1,	%l4,	%i0
	tleu	%icc,	0x6
	andcc	%i5,	0x19B6,	%l6
	edge16l	%l5,	%g3,	%o4
	wr	%g0,	0x52,	%asi
	stxa	%o2,	[%g0 + 0x108] %asi
	edge16ln	%i6,	%l0,	%i1
	movl	%icc,	%i3,	%o5
	fsrc2	%f30,	%f30
	orcc	%g7,	0x1B60,	%o1
	fbo,a	%fcc2,	loop_1726
	movrlz	%o0,	%g6,	%i4
	fnand	%f12,	%f4,	%f20
	add	%l7,	0x64,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%o3,	%g1
loop_1726:
	be,a	%xcc,	loop_1727
	edge8ln	%l3,	%o6,	%g2
	orncc	%l2,	%o7,	%i7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1727:
	movne	%icc,	%g4,	%g5
	mova	%icc,	%l1,	%i2
	fbu	%fcc1,	loop_1728
	fmovdvs	%xcc,	%f11,	%f28
	array8	%l4,	%i0,	%l6
	edge16ln	%i5,	%g3,	%l5
loop_1728:
	fmovdcs	%xcc,	%f7,	%f18
	ldsh	[%l7 + 0x42],	%o2
	subcc	%o4,	0x18D2,	%i6
	movpos	%icc,	%i1,	%l0
	fmul8x16	%f9,	%f16,	%f20
	fmovsle	%xcc,	%f31,	%f1
	brgz,a	%o5,	loop_1729
	fmovsgu	%icc,	%f20,	%f15
	array8	%i3,	%o1,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1729:
	orncc	%g7,	0x0B1A,	%i4
	andn	%o3,	%g6,	%l3
	move	%icc,	%g1,	%o6
	add	%l7,	0x68,	%l6
	wr	%g0,	0x0c,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] 0x0c,	%l2,	%g2
	movgu	%icc,	%o7,	%g4
	taddcctv	%g5,	0x14D6,	%l1
	bn,a,pt	%xcc,	loop_1730
	nop
	setx	0x9706B3553E1FA605,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f26
	tg	%icc,	0x2
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x2F] %asi,	%i2
loop_1730:
	ld	[%l7 + 0x60],	%f0
	fbl	%fcc2,	loop_1731
	fpsub32s	%f0,	%f31,	%f25
	bpos,a	loop_1732
	fmovdcc	%icc,	%f21,	%f27
loop_1731:
	movne	%icc,	%i7,	%l4
	te	%icc,	0x5
loop_1732:
	umulcc	%l6,	0x03CD,	%i0
	fbu	%fcc1,	loop_1733
	smul	%g3,	0x0116,	%l5
	movre	%i5,	%o2,	%i6
	subccc	%o4,	%i1,	%l0
loop_1733:
	addc	%i3,	0x1202,	%o5
	fcmpeq32	%f6,	%f12,	%o0
	set	0x3A, %o7
	ldstuba	[%l7 + %o7] 0x81,	%o1
	subc	%g7,	0x1A0B,	%i4
	fpack32	%f20,	%f12,	%f26
	fsrc2s	%f6,	%f28
	set	0x3E, %i2
	lduha	[%l7 + %i2] 0x04,	%g6
	taddcctv	%l3,	%g1,	%o3
	fexpand	%f10,	%f20
	move	%icc,	%o6,	%l2
	tle	%xcc,	0x0
	te	%icc,	0x6
	and	%g2,	%g4,	%g5
	fbul,a	%fcc1,	loop_1734
	tn	%icc,	0x3
	brz,a	%o7,	loop_1735
	edge8l	%l1,	%i7,	%i2
loop_1734:
	nop
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_1735:
	fbn	%fcc1,	loop_1736
	tcs	%xcc,	0x2
	umul	%l6,	%i0,	%g3
	bge,a	%icc,	loop_1737
loop_1736:
	fcmpgt16	%f12,	%f4,	%l4
	add	%l5,	%i5,	%o2
	edge8	%o4,	%i1,	%i6
loop_1737:
	fmul8x16	%f8,	%f20,	%f14
	mulx	%i3,	0x1510,	%l0
	movcs	%xcc,	%o5,	%o1
	alignaddr	%g7,	%i4,	%o0
	fpsub16	%f28,	%f12,	%f28
	or	%g6,	%g1,	%l3
	nop
	fitod	%f10,	%f24
	fdtox	%f24,	%f0
	set	0x20, %l6
	prefetcha	[%l7 + %l6] 0x81,	 0x3
	ldd	[%l7 + 0x20],	%f22
	sdivx	%o3,	0x0C7A,	%l2
	alignaddr	%g2,	%g4,	%o7
	addc	%l1,	%g5,	%i7
	fbn	%fcc2,	loop_1738
	ldsb	[%l7 + 0x21],	%i2
	fandnot2s	%f3,	%f14,	%f23
	movgu	%xcc,	%i0,	%g3
loop_1738:
	nop
	set	0x75, %l1
	ldsba	[%l7 + %l1] 0x04,	%l6
	movrlez	%l5,	0x0F4,	%l4
	and	%i5,	%o2,	%o4
	sll	%i1,	0x04,	%i3
	mulx	%i6,	0x1432,	%o5
	mulx	%o1,	%l0,	%i4
	fba,a	%fcc2,	loop_1739
	swap	[%l7 + 0x64],	%g7
	brnz	%o0,	loop_1740
	movrgz	%g6,	%g1,	%l3
loop_1739:
	nop
	setx	loop_1741,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	loop_1742,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_1740:
	movne	%xcc,	%o3,	%l2
	andcc	%g2,	0x0F44,	%o6
loop_1741:
	tvs	%icc,	0x6
loop_1742:
	tpos	%icc,	0x5
	movl	%xcc,	%o7,	%g4
	sub	%l1,	0x01C5,	%i7
	wr	%g0,	0x18,	%asi
	stba	%g5,	[%l7 + 0x73] %asi
	fmovsleu	%icc,	%f9,	%f9
	movrlez	%i0,	0x07F,	%g3
	bcc,pn	%xcc,	loop_1743
	tvc	%icc,	0x4
	andcc	%i2,	%l5,	%l4
	fxors	%f3,	%f6,	%f13
loop_1743:
	tgu	%xcc,	0x0
	addccc	%i5,	%l6,	%o2
	membar	#Sync
	wr	%g0,	0xf0,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	nop
	setx	loop_1744,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovrsgz	%o4,	%f26,	%f4
	sdiv	%i3,	0x07BE,	%i1
	sdiv	%o5,	0x0C98,	%i6
loop_1744:
	xnor	%l0,	%o1,	%g7
	membar	0x6D
	movre	%o0,	0x07D,	%g6
	ldsh	[%l7 + 0x20],	%g1
	fblg,a	%fcc3,	loop_1745
	movrlz	%i4,	%o3,	%l2
	udivx	%g2,	0x1AD6,	%l3
	nop
	fitos	%f13,	%f17
	fstox	%f17,	%f14
	fxtos	%f14,	%f25
loop_1745:
	brgez,a	%o7,	loop_1746
	orcc	%o6,	%l1,	%i7
	brz,a	%g5,	loop_1747
	lduw	[%l7 + 0x54],	%g4
loop_1746:
	bcc,a,pt	%icc,	loop_1748
	call	loop_1749
loop_1747:
	andn	%g3,	%i0,	%i2
	tle	%xcc,	0x6
loop_1748:
	nop
	wr	%g0,	0x2e,	%asi
	ldda	[%l7 + 0x20] %asi,	%l4
loop_1749:
	fmovsneg	%icc,	%f16,	%f25
	xnor	%l4,	%l6,	%o2
	move	%icc,	%i5,	%i3
	set	0x4F, %i4
	lduba	[%l7 + %i4] 0x80,	%o4
	fmovdg	%xcc,	%f1,	%f20
	mulscc	%o5,	0x12A0,	%i6
	nop
	fitos	%f1,	%f24
	fstox	%f24,	%f10
	fpadd32	%f12,	%f28,	%f24
	ble,a	loop_1750
	edge32l	%l0,	%i1,	%o1
	sra	%o0,	%g7,	%g1
	nop
	fitod	%f8,	%f24
	fdtox	%f24,	%f20
loop_1750:
	fmovdvs	%xcc,	%f14,	%f9
	addc	%i4,	0x15F6,	%o3
	subc	%g6,	0x16C8,	%g2
	set	0x08, %o5
	stxa	%l2,	[%l7 + %o5] 0x2f
	membar	#Sync
	sdivx	%o7,	0x144F,	%o6
	edge8ln	%l1,	%l3,	%i7
	bpos,pt	%icc,	loop_1751
	alignaddr	%g4,	%g5,	%i0
	and	%g3,	%i2,	%l5
	addccc	%l6,	%l4,	%o2
loop_1751:
	tne	%xcc,	0x1
	or	%i3,	0x04BE,	%i5
	edge32	%o5,	%i6,	%o4
	movle	%icc,	%i1,	%o1
	fnand	%f24,	%f18,	%f24
	fnot1	%f8,	%f28
	fcmpgt16	%f30,	%f14,	%o0
	movrlz	%g7,	%l0,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x41],	%g1
	fmul8ulx16	%f22,	%f28,	%f22
	lduh	[%l7 + 0x5A],	%o3
	fcmpne16	%f20,	%f14,	%g2
	edge8ln	%l2,	%g6,	%o7
	sra	%o6,	%l3,	%i7
	fmovs	%f22,	%f7
	movpos	%icc,	%l1,	%g4
	edge8ln	%g5,	%g3,	%i2
	fand	%f0,	%f26,	%f24
	sra	%i0,	0x11,	%l6
	sethi	0x03B0,	%l5
	ld	[%l7 + 0x1C],	%f3
	fmovsgu	%xcc,	%f25,	%f11
	fnot2s	%f24,	%f17
	ldsw	[%l7 + 0x64],	%l4
	edge8ln	%o2,	%i5,	%o5
	set	0x26, %g7
	stba	%i3,	[%l7 + %g7] 0x04
	st	%f12,	[%l7 + 0x54]
	edge16n	%i6,	%o4,	%o1
	addc	%i1,	%o0,	%l0
	edge16	%i4,	%g1,	%g7
	andcc	%g2,	0x0CA3,	%l2
	xor	%g6,	%o3,	%o6
	fzeros	%f13
	fsrc1s	%f21,	%f31
	tg	%icc,	0x6
	movleu	%icc,	%l3,	%i7
	mulscc	%o7,	0x1D18,	%l1
	edge16n	%g5,	%g3,	%i2
	mulscc	%i0,	%l6,	%l5
	array32	%g4,	%l4,	%o2
	addcc	%o5,	0x1C02,	%i3
	ldstub	[%l7 + 0x3B],	%i5
	prefetch	[%l7 + 0x74],	 0x2
	ldub	[%l7 + 0x21],	%o4
	tleu	%xcc,	0x2
	alignaddrl	%i6,	%o1,	%o0
	sdivx	%i1,	0x0AB5,	%l0
	xorcc	%g1,	%g7,	%i4
	set	0x34, %o4
	swapa	[%l7 + %o4] 0x88,	%l2
	popc	%g6,	%o3
	fmovdpos	%xcc,	%f0,	%f20
	st	%f8,	[%l7 + 0x18]
	fmovrse	%g2,	%f23,	%f13
	fcmpeq32	%f26,	%f26,	%l3
	fmovdne	%xcc,	%f20,	%f17
	sub	%o6,	0x1A8C,	%o7
	nop
	setx loop_1752, %l0, %l1
	jmpl %l1, %i7
	fcmpeq16	%f16,	%f18,	%g5
	orncc	%l1,	%g3,	%i0
	bleu	%icc,	loop_1753
loop_1752:
	xnor	%i2,	%l5,	%l6
	fpsub32s	%f29,	%f21,	%f1
	fbug,a	%fcc3,	loop_1754
loop_1753:
	fmovdn	%xcc,	%f1,	%f31
	fmovsg	%icc,	%f31,	%f14
	movgu	%xcc,	%g4,	%l4
loop_1754:
	movre	%o2,	0x0BD,	%o5
	tneg	%xcc,	0x7
	popc	%i3,	%o4
	udiv	%i5,	0x1E08,	%o1
	edge32l	%i6,	%o0,	%l0
	fbue	%fcc3,	loop_1755
	movrlz	%i1,	0x1A7,	%g1
	movge	%icc,	%i4,	%l2
	movne	%icc,	%g7,	%g6
loop_1755:
	array16	%g2,	%l3,	%o3
	set	0x18, %g3
	sta	%f1,	[%l7 + %g3] 0x19
	sll	%o7,	0x05,	%o6
	movgu	%xcc,	%i7,	%l1
	te	%icc,	0x7
	te	%icc,	0x6
	movrgez	%g5,	0x180,	%g3
	movrlez	%i2,	0x176,	%i0
	wr	%g0,	0x0c,	%asi
	sta	%f28,	[%l7 + 0x40] %asi
	movn	%icc,	%l6,	%g4
	movrgez	%l4,	0x1C3,	%l5
	srax	%o2,	0x10,	%i3
	srlx	%o5,	0x0A,	%i5
	sir	0x114D
	fsrc2s	%f9,	%f14
	tvc	%xcc,	0x1
	movneg	%xcc,	%o1,	%i6
	tgu	%icc,	0x6
	movn	%xcc,	%o0,	%o4
	ld	[%l7 + 0x54],	%f20
	tl	%xcc,	0x3
	tgu	%xcc,	0x6
	nop
	setx	0x8B618707FA25268D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xCB99BE39DF86D4B9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f22,	%f6
	be,pn	%xcc,	loop_1756
	orncc	%i1,	%l0,	%i4
	membar	0x5B
	stx	%l2,	[%l7 + 0x20]
loop_1756:
	addc	%g1,	0x04FD,	%g6
	brgez	%g2,	loop_1757
	fbuge,a	%fcc1,	loop_1758
	tg	%icc,	0x7
	movrlez	%l3,	0x0AB,	%g7
loop_1757:
	edge8n	%o3,	%o6,	%o7
loop_1758:
	nop
	setx	0x037E1BCED8789C4D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x9A0D53541A74756B,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	faddd	%f30,	%f10,	%f22
	sdiv	%l1,	0x106E,	%i7
	alignaddr	%g3,	%i2,	%i0
	stw	%l6,	[%l7 + 0x40]
	move	%icc,	%g4,	%l4
	fmul8sux16	%f4,	%f4,	%f14
	tsubcc	%g5,	0x09E6,	%l5
	fmovdcs	%icc,	%f26,	%f15
	bneg,a,pt	%icc,	loop_1759
	movg	%xcc,	%o2,	%i3
	fmovscc	%xcc,	%f19,	%f11
	alignaddrl	%o5,	%i5,	%i6
loop_1759:
	sra	%o1,	%o0,	%o4
	nop
	fitos	%f5,	%f21
	fstox	%f21,	%f6
	fxtos	%f6,	%f28
	fsrc1s	%f8,	%f24
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x2
	tne	%icc,	0x7
	addcc	%i1,	0x1666,	%l2
	fcmpgt32	%f10,	%f30,	%g1
	edge32ln	%g6,	%g2,	%l3
	stx	%i4,	[%l7 + 0x68]
	te	%xcc,	0x0
	sub	%o3,	0x1027,	%g7
	udivcc	%o7,	0x0EBF,	%o6
	fmovdvc	%xcc,	%f10,	%f13
	nop
	setx loop_1760, %l0, %l1
	jmpl %l1, %l1
	fmovdcs	%xcc,	%f8,	%f21
	nop
	set	0x3F, %i0
	ldub	[%l7 + %i0],	%g3
	umulcc	%i7,	0x185C,	%i2
loop_1760:
	movneg	%icc,	%l6,	%g4
	orn	%i0,	%g5,	%l5
	movvs	%icc,	%o2,	%l4
	brz,a	%o5,	loop_1761
	udivx	%i3,	0x128D,	%i6
	andcc	%o1,	%i5,	%o0
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
loop_1761:
	edge16ln	%l0,	%i1,	%o4
	movleu	%xcc,	%l2,	%g1
	subc	%g2,	%g6,	%l3
loop_1762:
	array8	%o3,	%g7,	%i4
	smul	%o6,	%l1,	%g3
	nop
	set	0x38, %i6
	std	%f28,	[%l7 + %i6]
	fpadd16	%f26,	%f4,	%f4
	set	0x58, %l5
	swapa	[%l7 + %l5] 0x18,	%o7
	smul	%i7,	0x0FA4,	%i2
	srl	%g4,	%i0,	%g5
	edge8ln	%l5,	%l6,	%l4
	edge8ln	%o5,	%i3,	%o2
	movrgz	%o1,	%i5,	%i6
	te	%xcc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o0,	0x0E89,	%i1
	addccc	%l0,	%l2,	%o4
	edge32n	%g2,	%g1,	%g6
	wr	%g0,	0x0c,	%asi
	lduha	[%l7 + 0x70] %asi,	%l3
	tvs	%xcc,	0x2
	fpadd32s	%f15,	%f10,	%f28
	add	%l7,	0x68,	%l6
	wr	%g0,	0x10,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] %asi,	%o3,	%g7
	lduh	[%l7 + 0x2E],	%i4
	fmovse	%icc,	%f3,	%f10
	edge8ln	%o6,	%l1,	%g3
	nop
	setx	0x7076A017,	%l0,	%l6
	st	%l6,	[%l7 + 0x6C]
	ld	[%l7 + 0x6C],	%fsr
	tcs	%icc,	0x1
	nop
	setx	0x8878990B03BDD7CB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0x8C080D9556A583C9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f20,	%f4
	xor	%i7,	%i2,	%g4
	brlz	%o7,	loop_1763
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i0,	0x121C,	%g5
	udivcc	%l5,	0x1984,	%l6
loop_1763:
	fxors	%f2,	%f29,	%f25
	tleu	%icc,	0x5
	set	0x50, %i7
	stha	%o5,	[%l7 + %i7] 0x23
	membar	#Sync
	xnor	%i3,	0x03C9,	%l4
	movl	%xcc,	%o1,	%i5
	add	%o2,	%o0,	%i1
	ldsb	[%l7 + 0x49],	%i6
	addc	%l0,	%l2,	%g2
	movrlz	%g1,	%o4,	%g6
	edge32ln	%o3,	%l3,	%g7
	tsubcctv	%i4,	%l1,	%g3
	tgu	%icc,	0x4
	lduw	[%l7 + 0x3C],	%o6
	array8	%i2,	%i7,	%g4
	subcc	%o7,	%g5,	%l5
	xnorcc	%l6,	0x17E2,	%o5
	fcmple16	%f4,	%f20,	%i0
	swap	[%l7 + 0x20],	%i3
	tcs	%xcc,	0x2
	nop
	fitod	%f10,	%f30
	fdtox	%f30,	%f12
	fmovrdgez	%o1,	%f24,	%f20
	swap	[%l7 + 0x6C],	%i5
	fbe	%fcc1,	loop_1764
	fpack16	%f6,	%f30
	fpadd16s	%f3,	%f4,	%f16
	ldsh	[%l7 + 0x7E],	%l4
loop_1764:
	tgu	%xcc,	0x0
	fpsub32s	%f23,	%f10,	%f12
	tleu	%icc,	0x7
	array8	%o0,	%o2,	%i6
	fmovrdne	%l0,	%f28,	%f4
	bcc	loop_1765
	movl	%xcc,	%i1,	%g2
	srlx	%l2,	0x07,	%g1
	fnot2	%f24,	%f14
loop_1765:
	tpos	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g6,	%o3,	%l3
	ldsh	[%l7 + 0x4A],	%g7
	and	%i4,	0x144A,	%o4
	and	%g3,	0x060E,	%o6
	tsubcc	%l1,	%i2,	%i7
	bgu,a	%icc,	loop_1766
	flush	%l7 + 0x78
	srl	%g4,	0x07,	%o7
	brnz,a	%g5,	loop_1767
loop_1766:
	fzero	%f0
	fmovsneg	%xcc,	%f0,	%f4
	fnot2	%f30,	%f18
loop_1767:
	fcmpeq16	%f12,	%f20,	%l6
	fpadd32	%f14,	%f0,	%f8
	nop
	setx	0xB2E58EEB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	fsqrts	%f14,	%f19
	bl	%xcc,	loop_1768
	fmovrslz	%o5,	%f16,	%f30
	bl,a,pt	%icc,	loop_1769
	udiv	%l5,	0x1A77,	%i3
loop_1768:
	sdivx	%i0,	0x04FB,	%i5
	nop
	setx	0x7A876E6F404418DA,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
loop_1769:
	nop
	set	0x30, %g6
	stw	%l4,	[%l7 + %g6]
	lduh	[%l7 + 0x3E],	%o0
	fmovsneg	%xcc,	%f6,	%f12
	tl	%xcc,	0x3
	set	0x60, %l2
	lduwa	[%l7 + %l2] 0x88,	%o2
	nop
	setx	loop_1770,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	array16	%o1,	%i6,	%l0
	nop
	setx	0x6E23DECA,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xFD5E7BB4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fadds	%f19,	%f12,	%f15
	edge16n	%i1,	%g2,	%l2
loop_1770:
	taddcc	%g1,	%o3,	%g6
	tg	%xcc,	0x0
	wr	%g0,	0x81,	%asi
	stba	%l3,	[%l7 + 0x7D] %asi
	wr	%g0,	0x89,	%asi
	stwa	%i4,	[%l7 + 0x60] %asi
	tsubcctv	%g7,	%g3,	%o6
	edge8n	%o4,	%l1,	%i7
	movvs	%icc,	%i2,	%o7
	movrlz	%g5,	0x27D,	%l6
	or	%o5,	%g4,	%l5
	movl	%icc,	%i0,	%i3
	fmovrdgz	%i5,	%f18,	%f10
	bvc,a,pt	%icc,	loop_1771
	sra	%o0,	0x0C,	%o2
	movleu	%xcc,	%o1,	%l4
	addcc	%l0,	0x1513,	%i1
loop_1771:
	tcs	%icc,	0x4
	sub	%i6,	0x1CBD,	%g2
	popc	%l2,	%g1
	fmuld8sux16	%f3,	%f28,	%f16
	and	%g6,	0x1111,	%l3
	smul	%i4,	0x0638,	%o3
	ble	%icc,	loop_1772
	sllx	%g3,	%o6,	%g7
	movle	%icc,	%l1,	%o4
	edge16	%i7,	%i2,	%g5
loop_1772:
	orncc	%o7,	%o5,	%l6
	andncc	%l5,	%i0,	%i3
	fbue	%fcc1,	loop_1773
	tvs	%xcc,	0x5
	tg	%icc,	0x1
	fbuge,a	%fcc3,	loop_1774
loop_1773:
	sth	%g4,	[%l7 + 0x3E]
	add	%o0,	%i5,	%o1
	wr	%g0,	0x58,	%asi
	ldxa	[%g0 + 0x18] %asi,	%l4
loop_1774:
	smul	%l0,	0x0A47,	%o2
	movneg	%xcc,	%i1,	%i6
	fcmpne32	%f26,	%f16,	%l2
	subccc	%g2,	0x1FCE,	%g1
	stx	%l3,	[%l7 + 0x58]
	xnor	%i4,	%o3,	%g3
	movvc	%xcc,	%o6,	%g7
	tpos	%xcc,	0x6
	movvc	%xcc,	%g6,	%l1
	tsubcctv	%o4,	%i7,	%g5
	movn	%icc,	%o7,	%i2
	tl	%icc,	0x6
	tn	%xcc,	0x6
	xnorcc	%o5,	%l6,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f0,	%f26,	%i0
	sra	%i3,	0x13,	%g4
	taddcc	%i5,	0x0750,	%o0
	bg	%icc,	loop_1775
	sub	%l4,	%l0,	%o2
	fbu	%fcc0,	loop_1776
	movneg	%icc,	%o1,	%i6
loop_1775:
	fmovde	%icc,	%f10,	%f10
	orn	%i1,	0x1ADE,	%g2
loop_1776:
	fnot1	%f30,	%f26
	fmovdg	%xcc,	%f16,	%f17
	sllx	%g1,	0x19,	%l2
	movrgz	%l3,	%i4,	%g3
	add	%o6,	%g7,	%g6
	ldd	[%l7 + 0x30],	%l0
	edge8l	%o3,	%o4,	%i7
	bne	loop_1777
	smul	%o7,	0x17BA,	%i2
	array32	%g5,	%o5,	%l6
	movcs	%xcc,	%i0,	%l5
loop_1777:
	sllx	%g4,	%i5,	%i3
	fnegs	%f14,	%f12
	tn	%xcc,	0x3
	movrlez	%o0,	0x10D,	%l0
	sth	%l4,	[%l7 + 0x2E]
	fandnot1s	%f12,	%f13,	%f28
	edge32n	%o1,	%i6,	%o2
	andncc	%i1,	%g1,	%l2
	tleu	%xcc,	0x4
	movcc	%xcc,	%g2,	%i4
	ld	[%l7 + 0x78],	%f28
	nop
	fitod	%f8,	%f2
	umul	%g3,	%o6,	%l3
	fpmerge	%f10,	%f26,	%f20
	bvs	loop_1778
	movgu	%icc,	%g6,	%g7
	movn	%icc,	%o3,	%l1
	fmovdcs	%xcc,	%f6,	%f16
loop_1778:
	ldsw	[%l7 + 0x10],	%i7
	alignaddr	%o4,	%o7,	%i2
	movle	%xcc,	%g5,	%o5
	xor	%l6,	0x14EA,	%l5
	subc	%i0,	0x184A,	%i5
	fsrc1s	%f1,	%f29
	nop
	setx loop_1779, %l0, %l1
	jmpl %l1, %i3
	movrgez	%g4,	0x354,	%l0
	tcc	%icc,	0x5
	nop
	setx	0x3753F7E1FDB6EF80,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x612B72CF3F1A75B3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f8,	%f2
loop_1779:
	bge	loop_1780
	brlez,a	%l4,	loop_1781
	brlz	%o0,	loop_1782
	fbue	%fcc3,	loop_1783
loop_1780:
	orncc	%o1,	0x04F0,	%o2
loop_1781:
	lduw	[%l7 + 0x28],	%i1
loop_1782:
	movle	%icc,	%i6,	%l2
loop_1783:
	edge8ln	%g1,	%g2,	%g3
	mova	%icc,	%o6,	%l3
	edge16l	%i4,	%g7,	%o3
	movvs	%icc,	%l1,	%g6
	bgu,pt	%xcc,	loop_1784
	fbo	%fcc0,	loop_1785
	nop
	fitos	%f28,	%f27
	set	0x79, %o1
	ldsba	[%l7 + %o1] 0x18,	%i7
loop_1784:
	fba,a	%fcc0,	loop_1786
loop_1785:
	movrlz	%o4,	0x2AF,	%o7
	alignaddr	%i2,	%g5,	%o5
	fabsd	%f2,	%f0
loop_1786:
	taddcc	%l6,	%l5,	%i0
	movrgz	%i5,	0x2C2,	%i3
	tl	%icc,	0x4
	edge32n	%g4,	%l4,	%l0
	fsrc2s	%f15,	%f27
	fbul	%fcc0,	loop_1787
	udivcc	%o0,	0x127E,	%o2
	fmovrdgez	%i1,	%f30,	%f16
	srl	%o1,	0x08,	%l2
loop_1787:
	tl	%icc,	0x7
	tge	%icc,	0x4
	movrlz	%i6,	0x16D,	%g1
	fba	%fcc2,	loop_1788
	bgu	%xcc,	loop_1789
	or	%g2,	0x1AAE,	%g3
	movgu	%xcc,	%l3,	%i4
loop_1788:
	sdivcc	%o6,	0x1E9E,	%o3
loop_1789:
	bge,pn	%icc,	loop_1790
	subc	%l1,	0x1617,	%g7
	ldsh	[%l7 + 0x3C],	%g6
	andn	%o4,	0x162C,	%o7
loop_1790:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f13
	fandnot2s	%f15,	%f3,	%f16
	edge16n	%i2,	%g5,	%i7
	brz	%o5,	loop_1791
	movcc	%icc,	%l5,	%i0
	mulscc	%l6,	0x07B9,	%i3
	fpadd32	%f30,	%f12,	%f14
loop_1791:
	tgu	%icc,	0x6
	sdivx	%i5,	0x1D43,	%l4
	orn	%l0,	%g4,	%o0
	edge32n	%o2,	%i1,	%o1
	bge,a,pt	%icc,	loop_1792
	movre	%l2,	0x067,	%i6
	addcc	%g1,	%g3,	%g2
	array8	%i4,	%l3,	%o3
loop_1792:
	tvs	%icc,	0x6
	movrgez	%o6,	%l1,	%g7
	set	0x20, %i5
	ldda	[%l7 + %i5] 0x04,	%o4
	nop
	set	0x58, %o2
	std	%f24,	[%l7 + %o2]
	add	%g6,	%i2,	%g5
	orn	%o7,	0x02BB,	%i7
	bge,a,pt	%xcc,	loop_1793
	ldd	[%l7 + 0x60],	%f0
	movpos	%icc,	%o5,	%i0
	fbo	%fcc0,	loop_1794
loop_1793:
	movvc	%xcc,	%l5,	%i3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] 0x80,	%l6,	%i5
loop_1794:
	tgu	%xcc,	0x7
	array32	%l0,	%g4,	%o0
	set	0x6C, %g1
	lduha	[%l7 + %g1] 0x10,	%o2
	fmovsvs	%icc,	%f13,	%f16
	tvs	%xcc,	0x2
	brgz	%l4,	loop_1795
	fmovdneg	%icc,	%f25,	%f4
	srax	%o1,	0x09,	%l2
	fbo	%fcc3,	loop_1796
loop_1795:
	fandnot2	%f8,	%f20,	%f0
	edge8n	%i6,	%g1,	%g3
	orcc	%g2,	0x176F,	%i1
loop_1796:
	ldd	[%l7 + 0x08],	%f16
	mulx	%l3,	0x1CC3,	%i4
	andncc	%o6,	%l1,	%g7
	movvc	%icc,	%o4,	%o3
	fnot2s	%f25,	%f10
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x20] %asi,	%f31
	orcc	%i2,	%g5,	%o7
	sir	0x02C7
	sir	0x128A
	fblg	%fcc0,	loop_1797
	edge8l	%i7,	%o5,	%g6
	fand	%f28,	%f2,	%f30
	nop
	fitod	%f6,	%f6
	fdtoi	%f6,	%f3
loop_1797:
	fmovdcc	%xcc,	%f24,	%f23
	andn	%i0,	%l5,	%i3
	wr	%g0,	0x0c,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	addccc	%l6,	%l0,	%i5
	popc	%o0,	%g4
	movg	%icc,	%o2,	%o1
	bpos	%xcc,	loop_1798
	bvc,pt	%xcc,	loop_1799
	tne	%icc,	0x1
	movvs	%xcc,	%l2,	%l4
loop_1798:
	sllx	%g1,	0x15,	%i6
loop_1799:
	movre	%g3,	0x34A,	%g2
	bge,a	loop_1800
	stb	%l3,	[%l7 + 0x23]
	movneg	%icc,	%i4,	%i1
	ldd	[%l7 + 0x78],	%f8
loop_1800:
	bg,a,pt	%icc,	loop_1801
	fmovsleu	%xcc,	%f5,	%f6
	tvs	%xcc,	0x1
	alignaddr	%o6,	%g7,	%l1
loop_1801:
	ldsw	[%l7 + 0x54],	%o3
	smulcc	%o4,	%i2,	%o7
	and	%g5,	%o5,	%g6
	fornot1s	%f13,	%f22,	%f8
	fandnot1	%f10,	%f20,	%f28
	tne	%icc,	0x2
	tpos	%xcc,	0x3
	udivx	%i0,	0x0647,	%i7
	tgu	%xcc,	0x5
	subcc	%l5,	0x1407,	%l6
	and	%i3,	%i5,	%l0
	tle	%icc,	0x6
	sethi	0x0E1A,	%o0
	fba	%fcc2,	loop_1802
	add	%o2,	0x19A2,	%g4
	fcmple16	%f4,	%f4,	%l2
	fmovsvc	%xcc,	%f14,	%f2
loop_1802:
	tvs	%xcc,	0x7
	tpos	%icc,	0x7
	fabss	%f22,	%f9
	fbe	%fcc2,	loop_1803
	movcs	%xcc,	%l4,	%g1
	udivx	%i6,	0x036B,	%o1
	brlz	%g2,	loop_1804
loop_1803:
	taddcc	%g3,	0x17E5,	%i4
	sethi	0x1150,	%l3
	addccc	%i1,	0x1B0E,	%o6
loop_1804:
	mulx	%l1,	%o3,	%g7
	nop
	fitos	%f2,	%f23
	fstox	%f23,	%f24
	fxtos	%f24,	%f12
	fone	%f22
	ble,a	%xcc,	loop_1805
	movl	%xcc,	%i2,	%o4
	pdist	%f6,	%f2,	%f14
	fnot2	%f0,	%f22
loop_1805:
	bg,a	%xcc,	loop_1806
	movcc	%xcc,	%o7,	%o5
	udivx	%g5,	0x0486,	%g6
	alignaddrl	%i0,	%l5,	%l6
loop_1806:
	nop
	add	%l7,	0x18,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] %asi,	%i7,	%i3
	movn	%xcc,	%i5,	%o0
	set	0x1F, %i1
	ldstuba	[%l7 + %i1] 0x88,	%o2
	fbul	%fcc2,	loop_1807
	fmovdleu	%icc,	%f3,	%f0
	fbu	%fcc3,	loop_1808
	fmovrsne	%l0,	%f29,	%f24
loop_1807:
	fmovsle	%icc,	%f19,	%f26
	tsubcctv	%l2,	0x189B,	%g4
loop_1808:
	orn	%g1,	%l4,	%o1
	fsrc1	%f20,	%f18
	edge32l	%g2,	%g3,	%i4
	xnor	%l3,	%i6,	%i1
	fmovsne	%icc,	%f20,	%f26
	ldx	[%l7 + 0x68],	%o6
	nop
	fitos	%f17,	%f25
	edge8ln	%l1,	%o3,	%i2
	sdivcc	%o4,	0x06BA,	%o7
	movge	%xcc,	%g7,	%g5
	movrlz	%g6,	%o5,	%i0
	sra	%l5,	0x1F,	%l6
	brgz,a	%i7,	loop_1809
	nop
	fitos	%f21,	%f6
	fbne	%fcc2,	loop_1810
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1809:
	movcc	%icc,	%i5,	%i3
	and	%o0,	0x148B,	%o2
loop_1810:
	fmovdne	%icc,	%f18,	%f7
	brz	%l0,	loop_1811
	swap	[%l7 + 0x0C],	%l2
	sdiv	%g4,	0x0230,	%l4
	fpadd32	%f26,	%f22,	%f2
loop_1811:
	srax	%g1,	0x02,	%g2
	ldsb	[%l7 + 0x4B],	%o1
	fmovrde	%i4,	%f16,	%f22
	ldx	[%l7 + 0x10],	%g3
	nop
	setx	loop_1812,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fbne,a	%fcc0,	loop_1813
	ldx	[%l7 + 0x08],	%i6
	fbo,a	%fcc2,	loop_1814
loop_1812:
	fbge,a	%fcc3,	loop_1815
loop_1813:
	bpos,a,pt	%icc,	loop_1816
	fmovrdlez	%l3,	%f12,	%f2
loop_1814:
	tneg	%xcc,	0x1
loop_1815:
	edge8l	%o6,	%i1,	%o3
loop_1816:
	tleu	%icc,	0x7
	movrgz	%i2,	%o4,	%o7
	set	0x4B, %i3
	ldsba	[%l7 + %i3] 0x04,	%l1
	movrlez	%g7,	%g6,	%g5
	fmovdleu	%icc,	%f2,	%f7
	bn,pt	%icc,	loop_1817
	brgz,a	%i0,	loop_1818
	sllx	%o5,	0x08,	%l5
	sir	0x0665
loop_1817:
	smul	%i7,	0x1AB6,	%l6
loop_1818:
	addc	%i3,	0x08DE,	%o0
	sll	%o2,	%i5,	%l0
	fmovdle	%icc,	%f26,	%f30
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x40] %asi,	%l2
	brz	%g4,	loop_1819
	fpadd16	%f6,	%f12,	%f0
	set	0x30, %o6
	lda	[%l7 + %o6] 0x11,	%f12
loop_1819:
	movg	%icc,	%g1,	%l4
	array32	%g2,	%i4,	%g3
	be,a	%icc,	loop_1820
	andncc	%i6,	%l3,	%o6
	movcs	%icc,	%i1,	%o3
	fmovde	%icc,	%f13,	%f28
loop_1820:
	movrne	%o1,	0x142,	%o4
	tneg	%icc,	0x3
	call	loop_1821
	movneg	%xcc,	%o7,	%i2
	movge	%xcc,	%l1,	%g7
	sir	0x0065
loop_1821:
	sllx	%g5,	%i0,	%g6
	fbe,a	%fcc1,	loop_1822
	edge32n	%l5,	%o5,	%i7
	flush	%l7 + 0x14
	edge8n	%i3,	%o0,	%l6
loop_1822:
	ldsb	[%l7 + 0x1C],	%o2
	call	loop_1823
	edge8ln	%l0,	%l2,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%g4,	%g1
loop_1823:
	udivcc	%l4,	0x1309,	%g2
	sdivcc	%i4,	0x0FC2,	%g3
	fbne,a	%fcc2,	loop_1824
	fxor	%f10,	%f30,	%f0
	tsubcc	%i6,	0x1D44,	%l3
	tcc	%xcc,	0x6
loop_1824:
	and	%i1,	0x022C,	%o3
	set	0x0A, %o3
	ldsha	[%l7 + %o3] 0x19,	%o6
	tneg	%icc,	0x2
	fbn,a	%fcc0,	loop_1825
	ble,a	loop_1826
	stx	%o4,	[%l7 + 0x40]
	addc	%o7,	%o1,	%l1
loop_1825:
	smulcc	%g7,	%g5,	%i0
loop_1826:
	bvc,a	loop_1827
	fmovda	%xcc,	%f11,	%f6
	taddcctv	%g6,	%i2,	%l5
	brgz,a	%o5,	loop_1828
loop_1827:
	subc	%i3,	%i7,	%l6
	udivx	%o0,	0x13A9,	%o2
	nop
	setx loop_1829, %l0, %l1
	jmpl %l1, %l2
loop_1828:
	bpos,a,pn	%icc,	loop_1830
	fands	%f30,	%f10,	%f7
	fcmpne16	%f20,	%f0,	%l0
loop_1829:
	edge8ln	%i5,	%g4,	%l4
loop_1830:
	nop
	setx	0xE05E923C,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	edge32ln	%g1,	%g2,	%g3
	brlez	%i6,	loop_1831
	tneg	%xcc,	0x6
	movn	%xcc,	%l3,	%i1
	fbge	%fcc1,	loop_1832
loop_1831:
	movcs	%icc,	%o3,	%o6
	fbule	%fcc3,	loop_1833
	nop
	setx loop_1834, %l0, %l1
	jmpl %l1, %o4
loop_1832:
	tg	%xcc,	0x1
	mova	%xcc,	%o7,	%i4
loop_1833:
	fbul	%fcc3,	loop_1835
loop_1834:
	fmovrsgez	%l1,	%f25,	%f1
	tleu	%xcc,	0x0
	ldsh	[%l7 + 0x7A],	%o1
loop_1835:
	array16	%g5,	%i0,	%g7
	tsubcc	%i2,	0x1F2A,	%g6
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
	tge	%icc,	0x5
	umulcc	%o5,	0x0D66,	%i3
	set	0x3E, %l4
	lduha	[%l7 + %l4] 0x89,	%l5
loop_1836:
	nop
	fitos	%f13,	%f25
	fstox	%f25,	%f26
	orcc	%l6,	%i7,	%o2
	tl	%xcc,	0x6
	stb	%o0,	[%l7 + 0x57]
	nop
	setx	0xE3755CEDC13949B7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f4
	fpadd32	%f20,	%f4,	%f6
	fnands	%f6,	%f13,	%f19
	edge32ln	%l2,	%l0,	%g4
	ldstub	[%l7 + 0x3D],	%i5
	movle	%xcc,	%l4,	%g2
	xnorcc	%g3,	0x01D2,	%i6
	mulx	%l3,	%i1,	%o3
	fornot2	%f28,	%f28,	%f12
	ldx	[%l7 + 0x70],	%o6
	mulx	%o4,	%o7,	%g1
	fmovse	%icc,	%f14,	%f11
	fmovrdne	%l1,	%f6,	%f4
	fmovdvc	%xcc,	%f30,	%f5
	set	0x72, %g2
	lduha	[%l7 + %g2] 0x88,	%i4
	tcc	%icc,	0x2
	fornot2	%f4,	%f6,	%f16
	array32	%g5,	%i0,	%o1
	mulx	%i2,	%g7,	%g6
	stx	%i3,	[%l7 + 0x08]
	ba	%xcc,	loop_1837
	fnors	%f29,	%f2,	%f28
	te	%xcc,	0x0
	umul	%o5,	%l6,	%i7
loop_1837:
	udiv	%o2,	0x093B,	%l5
	fpsub16s	%f8,	%f8,	%f7
	srax	%o0,	0x09,	%l2
	set	0x20, %g5
	ldda	[%l7 + %g5] 0xea,	%l0
	movle	%xcc,	%i5,	%l4
	edge8	%g4,	%g3,	%i6
	addcc	%g2,	0x0C63,	%l3
	fpsub32s	%f19,	%f14,	%f2
	sdiv	%o3,	0x11F2,	%i1
	bg,a,pn	%icc,	loop_1838
	ldsh	[%l7 + 0x5A],	%o6
	fbue,a	%fcc3,	loop_1839
	nop
	fitod	%f25,	%f2
loop_1838:
	srax	%o7,	0x0A,	%o4
	nop
	fitos	%f14,	%f3
	fstox	%f3,	%f8
loop_1839:
	umul	%l1,	0x0688,	%g1
	set	0x6E, %g4
	ldstuba	[%l7 + %g4] 0x80,	%g5
	tg	%xcc,	0x1
	tge	%xcc,	0x1
	fmovdneg	%xcc,	%f19,	%f1
	sdivcc	%i0,	0x0AC1,	%i4
	tle	%xcc,	0x5
	wr	%g0,	0x04,	%asi
	lduwa	[%l7 + 0x18] %asi,	%i2
	addccc	%o1,	0x15E3,	%g6
	fbuge,a	%fcc2,	loop_1840
	subccc	%g7,	0x1B9B,	%o5
	tleu	%icc,	0x4
	srax	%i3,	%l6,	%o2
loop_1840:
	fmovrde	%l5,	%f2,	%f8
	addcc	%i7,	%o0,	%l2
	edge32n	%i5,	%l0,	%g4
	fbug,a	%fcc0,	loop_1841
	stbar
	srl	%l4,	%g3,	%i6
	edge16l	%g2,	%l3,	%o3
loop_1841:
	fxor	%f2,	%f2,	%f4
	edge32	%o6,	%o7,	%o4
	sdiv	%l1,	0x02EB,	%g1
	nop
	fitos	%f11,	%f11
	fstoi	%f11,	%f5
	sdiv	%i1,	0x09A2,	%g5
	array8	%i4,	%i2,	%i0
	fmovrdlez	%o1,	%f28,	%f28
	sllx	%g7,	0x0E,	%g6
	movge	%xcc,	%o5,	%i3
	bvc,a	%xcc,	loop_1842
	sdivx	%l6,	0x0884,	%o2
	tge	%icc,	0x7
	movrgz	%i7,	0x3CB,	%l5
loop_1842:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%icc,	%f19,	%f14
	edge32	%l2,	%i5,	%l0
	tg	%icc,	0x1
	fbul	%fcc1,	loop_1843
	fpadd32	%f8,	%f20,	%f26
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x08] %asi,	%o0
loop_1843:
	bshuffle	%f2,	%f22,	%f2
	fmovrdne	%g4,	%f24,	%f20
	edge8l	%l4,	%i6,	%g2
	swap	[%l7 + 0x50],	%l3
	movgu	%xcc,	%o3,	%o6
	addccc	%o7,	%o4,	%g3
	or	%l1,	%g1,	%i1
	fmovse	%icc,	%f28,	%f5
	sethi	0x0ED9,	%i4
	fcmpne32	%f4,	%f14,	%g5
	add	%l7,	0x78,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%i2,	%o1
	movrne	%g7,	%i0,	%o5
	tsubcc	%g6,	%l6,	%o2
	wr	%g0,	0x23,	%asi
	ldda	[%l7 + 0x40] %asi,	%i2
	fmovrdgz	%l5,	%f12,	%f6
	nop
	setx	0x857ECF0CCF293B6C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9E98B3126C12BF3A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f24
	fdivd	%f24,	%f0,	%f6
	be,a	%xcc,	loop_1844
	fpackfix	%f12,	%f0
	addcc	%i7,	0x0CBB,	%i5
	edge16ln	%l0,	%o0,	%l2
loop_1844:
	xorcc	%l4,	%g4,	%i6
	tcc	%icc,	0x3
	fmovsgu	%icc,	%f11,	%f14
	fpsub16	%f14,	%f6,	%f24
	and	%l3,	%g2,	%o6
	tne	%xcc,	0x3
	be,a	%icc,	loop_1845
	bg,pt	%xcc,	loop_1846
	edge16n	%o3,	%o4,	%o7
	addccc	%l1,	%g3,	%g1
loop_1845:
	andncc	%i1,	%g5,	%i4
loop_1846:
	movvs	%icc,	%i2,	%g7
	edge32ln	%o1,	%o5,	%i0
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	ldxa	[%l6] %asi,	%g6
	casxa	[%l6] 0x89,	%g6,	%l6
	tvc	%xcc,	0x7
	ble,a,pn	%xcc,	loop_1847
	prefetch	[%l7 + 0x24],	 0x1
	movrgz	%i3,	0x03F,	%l5
	ba	loop_1848
loop_1847:
	ldd	[%l7 + 0x60],	%o2
	subccc	%i5,	0x0215,	%l0
	nop
	fitos	%f13,	%f12
	fstox	%f12,	%f4
loop_1848:
	edge16ln	%o0,	%i7,	%l2
	bge,a,pn	%xcc,	loop_1849
	sra	%g4,	0x1B,	%l4
	nop
	fitos	%f0,	%f21
	fstox	%f21,	%f26
	fxtos	%f26,	%f5
	tn	%icc,	0x0
loop_1849:
	umul	%l3,	%g2,	%o6
	fbe	%fcc1,	loop_1850
	fpackfix	%f22,	%f6
	tle	%xcc,	0x5
	bgu,a	%xcc,	loop_1851
loop_1850:
	taddcctv	%o3,	0x1673,	%o4
	stb	%o7,	[%l7 + 0x69]
	fzeros	%f14
loop_1851:
	umul	%l1,	%g3,	%g1
	movre	%i6,	0x2FD,	%i1
	set	0x74, %l0
	lduwa	[%l7 + %l0] 0x80,	%g5
	movn	%xcc,	%i2,	%g7
	fbule,a	%fcc3,	loop_1852
	srax	%o1,	%o5,	%i0
	wr	%g0,	0xf1,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_1852:
	fcmpeq32	%f6,	%f8,	%g6
	tsubcc	%l6,	%i3,	%i4
	add	%o2,	%l5,	%l0
	sra	%i5,	0x1D,	%i7
	movrgz	%l2,	0x38C,	%o0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%icc,	%f18,	%f18
	set	0x14, %l3
	ldswa	[%l7 + %l3] 0x89,	%l4
	movrgez	%g4,	0x3AC,	%g2
	ldx	[%l7 + 0x30],	%o6
	sub	%l3,	%o4,	%o3
	movvc	%xcc,	%l1,	%o7
	xnorcc	%g1,	0x012C,	%i6
	sth	%g3,	[%l7 + 0x2C]
	movrlz	%g5,	0x39A,	%i1
	edge32ln	%g7,	%o1,	%o5
	fabss	%f21,	%f18
	ta	%xcc,	0x3
	fpack16	%f6,	%f6
	tle	%xcc,	0x7
	array16	%i0,	%i2,	%l6
	brgz	%g6,	loop_1853
	sub	%i4,	%i3,	%l5
	fsrc1	%f28,	%f10
	add	%l7,	0x10,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] %asi,	%o2,	%i5
loop_1853:
	fmovdcc	%xcc,	%f19,	%f27
	edge16n	%i7,	%l0,	%o0
	fpackfix	%f22,	%f17
	tne	%xcc,	0x3
	array8	%l2,	%g4,	%g2
	fmovsvs	%icc,	%f28,	%f5
	add	%l7,	0x08,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%o6
	casxa	[%l6] %asi,	%o6,	%l4
	tneg	%xcc,	0x6
	te	%icc,	0x4
	addc	%l3,	%o3,	%o4
	tle	%icc,	0x1
	fmul8x16au	%f9,	%f15,	%f30
	umul	%o7,	%l1,	%g1
	ldsb	[%l7 + 0x10],	%g3
	xorcc	%i6,	0x08F8,	%g5
	tpos	%xcc,	0x5
	smul	%g7,	0x02F1,	%i1
	tne	%xcc,	0x1
	bgu	%icc,	loop_1854
	movneg	%icc,	%o1,	%o5
	edge16	%i0,	%l6,	%g6
	fnor	%f8,	%f28,	%f12
loop_1854:
	andn	%i4,	%i3,	%l5
	addcc	%i2,	0x159D,	%i5
	umul	%i7,	0x1107,	%o2
	set	0x60, %o0
	ldda	[%l7 + %o0] 0x27,	%l0
	fmovrdlz	%l2,	%f0,	%f28
	tl	%xcc,	0x2
	mulx	%o0,	%g2,	%g4
	ta	%xcc,	0x2
	array32	%o6,	%l3,	%o3
	fmovdgu	%icc,	%f10,	%f5
	st	%f2,	[%l7 + 0x10]
	fmuld8ulx16	%f15,	%f23,	%f20
	mova	%icc,	%l4,	%o7
	sllx	%l1,	%g1,	%g3
	tgu	%icc,	0x7
	orn	%i6,	%g5,	%o4
	addc	%i1,	%o1,	%g7
	umul	%o5,	%i0,	%g6
	add	%i4,	%l6,	%l5
	set	0x30, %o7
	stxa	%i3,	[%l7 + %o7] 0x27
	membar	#Sync
	fnot2	%f2,	%f28
	sir	0x03CA
	fbe	%fcc2,	loop_1855
	movn	%icc,	%i2,	%i5
	movl	%xcc,	%o2,	%i7
	addccc	%l0,	%o0,	%g2
loop_1855:
	bshuffle	%f14,	%f26,	%f0
	edge16	%g4,	%l2,	%l3
	edge8ln	%o3,	%l4,	%o7
	set	0x6C, %l6
	swapa	[%l7 + %l6] 0x89,	%o6
	array16	%l1,	%g3,	%i6
	fbu,a	%fcc1,	loop_1856
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g1,	%g5,	%o4
	fmovsvs	%icc,	%f21,	%f21
loop_1856:
	brlez	%o1,	loop_1857
	move	%xcc,	%i1,	%o5
	udiv	%i0,	0x185F,	%g7
	edge16n	%i4,	%g6,	%l6
loop_1857:
	movne	%icc,	%l5,	%i2
	fmovdge	%xcc,	%f7,	%f3
	movre	%i5,	0x2F3,	%i3
	fmul8x16al	%f7,	%f0,	%f0
	andcc	%i7,	%o2,	%l0
	sir	0x0C10
	fmovrdgez	%o0,	%f30,	%f12
	fmovsleu	%icc,	%f30,	%f21
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x5A] %asi,	%g4
	wr	%g0,	0x89,	%asi
	lduwa	[%l7 + 0x48] %asi,	%g2
	movrlez	%l3,	%l2,	%l4
	sir	0x18F8
	sdivx	%o7,	0x06DF,	%o3
	fbn	%fcc1,	loop_1858
	nop
	setx	loop_1859,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bpos,a,pn	%icc,	loop_1860
	subc	%l1,	0x11CD,	%o6
loop_1858:
	brlz,a	%i6,	loop_1861
loop_1859:
	ble,pt	%xcc,	loop_1862
loop_1860:
	fmovsleu	%icc,	%f2,	%f22
	wr	%g0,	0x2c,	%asi
	ldda	[%l7 + 0x30] %asi,	%g0
loop_1861:
	movrlz	%g3,	%o4,	%o1
loop_1862:
	fpsub16s	%f25,	%f29,	%f7
	add	%g5,	%o5,	%i0
	xnorcc	%i1,	0x184E,	%i4
	nop
	fitod	%f8,	%f14
	fdtox	%f14,	%f0
	move	%icc,	%g6,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%icc,	0x2
	set	0x70, %i2
	prefetcha	[%l7 + %i2] 0x04,	 0x2
	nop
	setx	0x4BBEF978206572A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	ldx	[%l7 + 0x38],	%l6
	bn,a,pn	%icc,	loop_1863
	tleu	%icc,	0x0
	brz,a	%i5,	loop_1864
	fbne	%fcc2,	loop_1865
loop_1863:
	fbuge	%fcc1,	loop_1866
	fxor	%f20,	%f0,	%f16
loop_1864:
	subccc	%i2,	0x1682,	%i3
loop_1865:
	te	%icc,	0x1
loop_1866:
	edge16n	%o2,	%i7,	%o0
	nop
	setx	0x53ADBED4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	fsqrts	%f8,	%f15
	xnor	%l0,	%g4,	%l3
	mulscc	%l2,	0x0B89,	%g2
	movn	%xcc,	%l4,	%o7
	tsubcctv	%l1,	0x19F6,	%o6
	udivcc	%o3,	0x030A,	%g1
	addcc	%g3,	%o4,	%i6
	movvc	%icc,	%o1,	%o5
	or	%g5,	0x05EA,	%i1
	subc	%i0,	0x038F,	%g6
	fbl,a	%fcc3,	loop_1867
	stx	%i4,	[%l7 + 0x20]
	orcc	%l5,	0x1A69,	%g7
	fnands	%f14,	%f13,	%f25
loop_1867:
	fxor	%f12,	%f6,	%f4
	fmovrde	%l6,	%f4,	%f12
	fbne	%fcc3,	loop_1868
	movrlz	%i5,	0x0E5,	%i2
	movleu	%xcc,	%i3,	%o2
	bneg,a	%xcc,	loop_1869
loop_1868:
	ldd	[%l7 + 0x48],	%o0
	sub	%i7,	%g4,	%l0
	addccc	%l3,	0x1146,	%g2
loop_1869:
	tneg	%xcc,	0x0
	srax	%l4,	%o7,	%l1
	srl	%l2,	%o6,	%o3
	srlx	%g3,	%g1,	%i6
	movgu	%xcc,	%o1,	%o4
	andn	%g5,	0x0D65,	%i1
	fmovs	%f16,	%f26
	tge	%icc,	0x4
	array16	%o5,	%g6,	%i0
	andn	%l5,	%i4,	%g7
	edge8	%i5,	%i2,	%i3
	taddcc	%l6,	%o0,	%i7
	sra	%o2,	%l0,	%l3
	fmovdvc	%icc,	%f23,	%f28
	edge8l	%g4,	%l4,	%g2
	fmovda	%xcc,	%f21,	%f25
	tsubcctv	%l1,	0x1D3E,	%l2
	fandnot2s	%f21,	%f27,	%f30
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x38] %asi,	%o7
	tg	%xcc,	0x4
	tleu	%xcc,	0x5
	movge	%xcc,	%o3,	%o6
	tge	%icc,	0x1
	brgez,a	%g3,	loop_1870
	stx	%i6,	[%l7 + 0x48]
	udiv	%g1,	0x0D0B,	%o1
	te	%xcc,	0x0
loop_1870:
	ldsb	[%l7 + 0x77],	%g5
	fmovdcs	%icc,	%f21,	%f8
	wr	%g0,	0x19,	%asi
	ldda	[%l7 + 0x30] %asi,	%i0
	lduw	[%l7 + 0x50],	%o4
	nop
	setx	0xBA8A68E620B63398,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xB93C7778FC36FBAA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	faddd	%f0,	%f18,	%f24
	st	%f5,	[%l7 + 0x60]
	fpadd16s	%f0,	%f7,	%f24
	tn	%xcc,	0x6
	tle	%xcc,	0x1
	sethi	0x04A8,	%o5
	fbne,a	%fcc0,	loop_1871
	movvc	%xcc,	%g6,	%l5
	ldsb	[%l7 + 0x29],	%i0
	std	%f26,	[%l7 + 0x38]
loop_1871:
	tcs	%xcc,	0x1
	alignaddrl	%i4,	%i5,	%g7
	brlez,a	%i2,	loop_1872
	movrgez	%l6,	0x1AF,	%i3
	movrlez	%i7,	0x157,	%o0
	sethi	0x19C1,	%l0
loop_1872:
	udiv	%o2,	0x0B55,	%g4
	lduh	[%l7 + 0x6E],	%l3
	popc	%l4,	%l1
	fmovrdne	%g2,	%f6,	%f28
	edge16n	%l2,	%o7,	%o3
	fbug	%fcc0,	loop_1873
	fbne,a	%fcc3,	loop_1874
	tne	%icc,	0x7
	movrne	%o6,	0x39F,	%i6
loop_1873:
	membar	0x23
loop_1874:
	tvs	%icc,	0x4
	tl	%xcc,	0x6
	add	%g1,	0x031B,	%g3
	movne	%xcc,	%o1,	%i1
	tvc	%xcc,	0x1
	sir	0x14DD
	wr	%g0,	0x11,	%asi
	stha	%o4,	[%l7 + 0x66] %asi
	bn,pt	%icc,	loop_1875
	mulx	%o5,	%g6,	%l5
	ldd	[%l7 + 0x48],	%i0
	movrlez	%i4,	0x22B,	%g5
loop_1875:
	movneg	%icc,	%g7,	%i2
	move	%xcc,	%l6,	%i3
	movg	%xcc,	%i7,	%o0
	tl	%xcc,	0x7
	movre	%i5,	%o2,	%l0
	prefetch	[%l7 + 0x74],	 0x2
	wr	%g0,	0x11,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	mulx	%g4,	%l3,	%l4
	set	0x38, %l1
	stwa	%g2,	[%l7 + %l1] 0x14
	stbar
	bvs,a,pn	%icc,	loop_1876
	edge8l	%l1,	%l2,	%o3
	edge8n	%o6,	%o7,	%i6
	srlx	%g1,	%o1,	%g3
loop_1876:
	andcc	%i1,	0x1600,	%o4
	edge16l	%g6,	%o5,	%i0
	fpackfix	%f26,	%f0
	movle	%icc,	%l5,	%i4
	tle	%xcc,	0x2
	set	0x6A, %o5
	stha	%g7,	[%l7 + %o5] 0x22
	membar	#Sync
	movre	%i2,	0x23A,	%l6
	tcc	%icc,	0x4
	orn	%i3,	%g5,	%i7
	edge32l	%i5,	%o2,	%o0
	fbul	%fcc0,	loop_1877
	movge	%icc,	%l0,	%g4
	fexpand	%f12,	%f0
	fmovrslz	%l4,	%f14,	%f3
loop_1877:
	fmovdcs	%xcc,	%f3,	%f23
	edge32n	%l3,	%l1,	%g2
	movcs	%icc,	%o3,	%l2
	addc	%o6,	%o7,	%i6
	sdiv	%g1,	0x1C4F,	%o1
	movrlez	%i1,	%g3,	%o4
	fandnot1s	%f7,	%f6,	%f28
	nop
	fitod	%f6,	%f22
	fdtos	%f22,	%f23
	movg	%xcc,	%o5,	%g6
	popc	0x0D92,	%i0
	fbul,a	%fcc3,	loop_1878
	sethi	0x091B,	%i4
	movrgz	%g7,	0x2DF,	%l5
	bcs,a	%xcc,	loop_1879
loop_1878:
	movvs	%icc,	%i2,	%l6
	ld	[%l7 + 0x2C],	%f11
	lduw	[%l7 + 0x1C],	%i3
loop_1879:
	tsubcc	%i7,	%i5,	%g5
	or	%o0,	%o2,	%g4
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	nop
	setx loop_1880, %l0, %l1
	jmpl %l1, %l0
	sdiv	%l3,	0x0770,	%l4
	movgu	%xcc,	%l1,	%g2
	ldsb	[%l7 + 0x56],	%l2
loop_1880:
	sth	%o6,	[%l7 + 0x08]
	lduw	[%l7 + 0x40],	%o7
	movleu	%icc,	%o3,	%g1
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%i6,	%i1
	addccc	%g3,	0x0E0E,	%o4
	brlez,a	%o5,	loop_1881
	taddcc	%o1,	%i0,	%i4
	addc	%g6,	%g7,	%l5
	orncc	%l6,	0x18E8,	%i2
loop_1881:
	smulcc	%i3,	%i7,	%i5
	mulx	%g5,	0x0B00,	%o2
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%g4
	casa	[%l6] %asi,	%g4,	%o0
	brgez,a	%l0,	loop_1882
	movn	%icc,	%l4,	%l3
	movrgz	%g2,	%l1,	%l2
	edge32	%o6,	%o7,	%o3
loop_1882:
	ldd	[%l7 + 0x28],	%f20
	fmovrdne	%g1,	%f26,	%f22
	tn	%xcc,	0x7
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	tpos	%icc,	0x0
	srax	%i6,	0x09,	%g3
	prefetch	[%l7 + 0x64],	 0x1
	xnorcc	%o4,	0x0A15,	%i1
	fands	%f23,	%f29,	%f6
	srax	%o1,	0x0F,	%i0
	add	%l7,	0x30,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] 0x80,	%o5,	%g6
	tge	%xcc,	0x4
	edge8n	%g7,	%i4,	%l6
	fcmpne32	%f0,	%f6,	%l5
	fpmerge	%f17,	%f2,	%f16
	fbl	%fcc1,	loop_1883
	flush	%l7 + 0x68
	edge16ln	%i3,	%i7,	%i2
	tgu	%xcc,	0x4
loop_1883:
	sth	%g5,	[%l7 + 0x0E]
	orncc	%o2,	%i5,	%g4
	tvs	%icc,	0x6
	edge32n	%o0,	%l4,	%l3
	sra	%g2,	%l0,	%l1
	edge16	%l2,	%o6,	%o7
	sll	%g1,	%o3,	%i6
	fbl	%fcc0,	loop_1884
	stbar
	fmovrdlz	%g3,	%f16,	%f8
	fmovdvs	%icc,	%f30,	%f23
loop_1884:
	tneg	%xcc,	0x7
	fmul8x16al	%f31,	%f30,	%f24
	tpos	%xcc,	0x4
	array16	%i1,	%o1,	%i0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f20,	%f2,	%f12
	array32	%o4,	%g6,	%g7
	andn	%i4,	%l6,	%l5
	edge8n	%i3,	%o5,	%i2
	movvs	%xcc,	%g5,	%i7
	movvc	%xcc,	%o2,	%i5
	andcc	%o0,	%l4,	%l3
	faligndata	%f16,	%f2,	%f28
	std	%f14,	[%l7 + 0x68]
	addcc	%g2,	%g4,	%l0
	subccc	%l2,	0x19C4,	%o6
	fmul8ulx16	%f30,	%f16,	%f22
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x7C] %asi,	%o7
	prefetch	[%l7 + 0x70],	 0x1
	movn	%icc,	%g1,	%l1
	movgu	%icc,	%i6,	%o3
	srlx	%g3,	%i1,	%o1
	edge32	%i0,	%g6,	%o4
	movg	%xcc,	%i4,	%g7
	fble	%fcc0,	loop_1885
	nop
	setx	0xA65032C1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xC262AB60,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fsubs	%f8,	%f12,	%f26
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x20] %asi,	%i6
loop_1885:
	orncc	%l5,	0x0F1C,	%o5
	fcmple32	%f26,	%f18,	%i3
	bne,a,pt	%xcc,	loop_1886
	edge32n	%i2,	%i7,	%g5
	call	loop_1887
	edge8ln	%o2,	%i5,	%l4
loop_1886:
	sll	%l3,	%o0,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1887:
	fmovrdlz	%l0,	%f16,	%f10
	movrlez	%g2,	0x02E,	%l2
	edge8	%o7,	%g1,	%o6
	tl	%icc,	0x0
	edge16	%i6,	%l1,	%o3
	alignaddr	%g3,	%o1,	%i1
	nop
	setx	0x0A4497E1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0x9B73D62B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f30,	%f2
	stbar
	or	%g6,	%o4,	%i0
	addcc	%i4,	0x1C81,	%g7
	tne	%icc,	0x6
	tsubcctv	%l6,	%o5,	%i3
	stbar
	udivcc	%l5,	0x10A2,	%i2
	mulscc	%g5,	%i7,	%i5
	movgu	%icc,	%o2,	%l3
	sth	%l4,	[%l7 + 0x3E]
	mulscc	%g4,	%o0,	%g2
	addccc	%l0,	%l2,	%g1
	movpos	%xcc,	%o6,	%o7
	brz	%l1,	loop_1888
	sub	%i6,	%o3,	%o1
	movgu	%icc,	%i1,	%g6
	and	%g3,	0x0697,	%i0
loop_1888:
	tle	%icc,	0x6
	bleu,a	%xcc,	loop_1889
	fbul	%fcc0,	loop_1890
	movrlez	%o4,	%i4,	%l6
	movcs	%icc,	%o5,	%i3
loop_1889:
	nop
	set	0x54, %g7
	sta	%f25,	[%l7 + %g7] 0x19
loop_1890:
	nop
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x3C] %asi,	%g7
	tleu	%xcc,	0x4
	srax	%i2,	0x07,	%l5
	smul	%g5,	0x0852,	%i5
	bgu,a	%xcc,	loop_1891
	fone	%f12
	be,a,pt	%xcc,	loop_1892
	fmovrde	%o2,	%f22,	%f8
loop_1891:
	addcc	%l3,	%l4,	%i7
	fbug	%fcc2,	loop_1893
loop_1892:
	edge16	%o0,	%g4,	%g2
	edge32	%l2,	%g1,	%o6
	te	%icc,	0x1
loop_1893:
	move	%icc,	%l0,	%l1
	fmovsle	%icc,	%f9,	%f8
	fbue	%fcc1,	loop_1894
	movre	%i6,	0x2E2,	%o7
	edge32l	%o1,	%i1,	%g6
	orncc	%o3,	0x1AC0,	%i0
loop_1894:
	tcc	%xcc,	0x1
	edge16ln	%g3,	%i4,	%o4
	orncc	%o5,	0x1B95,	%l6
	movn	%icc,	%g7,	%i3
	tsubcctv	%l5,	%g5,	%i2
	and	%i5,	%l3,	%l4
	mulscc	%o2,	0x0D3C,	%i7
	fbne	%fcc0,	loop_1895
	addccc	%o0,	%g4,	%l2
	udiv	%g1,	0x02DE,	%o6
	tcc	%icc,	0x4
loop_1895:
	brgz,a	%g2,	loop_1896
	subcc	%l1,	%i6,	%l0
	set	0x08, %i4
	ldxa	[%l7 + %i4] 0x15,	%o7
loop_1896:
	fsrc2s	%f23,	%f22
	movcs	%xcc,	%o1,	%i1
	ldd	[%l7 + 0x58],	%f10
	fpsub32	%f28,	%f0,	%f2
	movrgez	%g6,	%i0,	%g3
	movge	%xcc,	%i4,	%o4
	fmovdvc	%icc,	%f26,	%f1
	tge	%icc,	0x1
	movl	%icc,	%o3,	%o5
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x38] %asi,	%l6
	movrlez	%g7,	%i3,	%l5
	fmovrslez	%i2,	%f28,	%f28
	srax	%g5,	0x1E,	%i5
	std	%f30,	[%l7 + 0x50]
	fexpand	%f9,	%f16
	subccc	%l3,	0x112D,	%l4
	fmovsl	%xcc,	%f11,	%f24
	edge32ln	%i7,	%o2,	%o0
	edge32n	%g4,	%l2,	%o6
	brlz,a	%g2,	loop_1897
	fmul8sux16	%f30,	%f8,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f20,	%f14,	%l1
loop_1897:
	or	%g1,	%i6,	%o7
	move	%xcc,	%l0,	%o1
	fcmpne16	%f0,	%f22,	%g6
	array16	%i0,	%i1,	%g3
	fmul8ulx16	%f22,	%f4,	%f30
	tgu	%icc,	0x5
	tcs	%xcc,	0x6
	alignaddr	%i4,	%o3,	%o5
	fmovrslez	%l6,	%f29,	%f9
	nop
	setx	0x5583EA5B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x7858A0A2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fdivs	%f9,	%f9,	%f4
	xorcc	%o4,	%g7,	%l5
	fsrc2	%f20,	%f6
	movge	%xcc,	%i3,	%g5
	tsubcc	%i5,	0x0C2F,	%l3
	fbule,a	%fcc1,	loop_1898
	be,a	%icc,	loop_1899
	srax	%i2,	0x0D,	%i7
	movpos	%xcc,	%l4,	%o0
loop_1898:
	tsubcc	%o2,	0x05FB,	%g4
loop_1899:
	sra	%l2,	0x19,	%g2
	srlx	%l1,	%o6,	%i6
	movvs	%xcc,	%g1,	%l0
	movge	%xcc,	%o7,	%g6
	movpos	%xcc,	%i0,	%i1
	prefetch	[%l7 + 0x08],	 0x3
	fmovsvs	%icc,	%f9,	%f17
	tvs	%xcc,	0x7
	set	0x24, %g3
	lduwa	[%l7 + %g3] 0x11,	%o1
	umul	%g3,	%i4,	%o3
	movne	%icc,	%o5,	%l6
	array16	%o4,	%g7,	%l5
	srax	%g5,	0x18,	%i5
	edge8n	%l3,	%i3,	%i7
	ldub	[%l7 + 0x75],	%i2
	movgu	%xcc,	%o0,	%l4
	ldd	[%l7 + 0x70],	%f28
	smul	%o2,	0x0A7A,	%g4
	tvs	%icc,	0x5
	ldstub	[%l7 + 0x70],	%l2
	mulx	%l1,	%o6,	%i6
	be	%xcc,	loop_1900
	bneg,a	%xcc,	loop_1901
	sethi	0x0850,	%g2
	movvs	%xcc,	%l0,	%o7
loop_1900:
	andncc	%g1,	%i0,	%g6
loop_1901:
	fbne,a	%fcc1,	loop_1902
	fmovdleu	%icc,	%f22,	%f19
	brlez	%o1,	loop_1903
	prefetch	[%l7 + 0x0C],	 0x3
loop_1902:
	edge32l	%g3,	%i1,	%i4
	tl	%xcc,	0x5
loop_1903:
	nop
	set	0x2E, %o4
	lduha	[%l7 + %o4] 0x18,	%o5
	nop
	fitod	%f12,	%f14
	fdtox	%f14,	%f10
	fxtod	%f10,	%f30
	movvs	%xcc,	%o3,	%l6
	ldstub	[%l7 + 0x51],	%o4
	edge8ln	%l5,	%g5,	%g7
	movn	%xcc,	%i5,	%i3
	edge32l	%i7,	%i2,	%l3
	ldsh	[%l7 + 0x6E],	%l4
	orcc	%o0,	0x13AD,	%g4
	set	0x6B, %i0
	stba	%l2,	[%l7 + %i0] 0x11
	add	%o2,	0x0E6C,	%l1
	alignaddrl	%o6,	%g2,	%i6
	xor	%l0,	0x10BF,	%o7
	andn	%g1,	%g6,	%o1
	fmovdge	%xcc,	%f25,	%f6
	mova	%xcc,	%g3,	%i0
	call	loop_1904
	fbule,a	%fcc1,	loop_1905
	fands	%f11,	%f26,	%f31
	movvs	%xcc,	%i1,	%o5
loop_1904:
	ta	%icc,	0x1
loop_1905:
	andcc	%o3,	0x0F94,	%l6
	sethi	0x0116,	%o4
	ldd	[%l7 + 0x58],	%f14
	edge8l	%l5,	%i4,	%g5
	ldstub	[%l7 + 0x3B],	%i5
	set	0x18, %i6
	stha	%i3,	[%l7 + %i6] 0x15
	tle	%xcc,	0x6
	udivx	%g7,	0x0E44,	%i7
	fpadd32	%f6,	%f12,	%f10
	st	%f31,	[%l7 + 0x50]
	edge8n	%i2,	%l4,	%o0
	orcc	%l3,	%g4,	%l2
	fbg,a	%fcc2,	loop_1906
	nop
	setx	0x6BC9B975,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0x341C15F1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f30
	fadds	%f30,	%f1,	%f25
	fornot1s	%f12,	%f20,	%f31
	nop
	setx	0x8FF986AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0xBA0CD187,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f26
	fmuls	%f26,	%f11,	%f22
loop_1906:
	add	%o2,	0x04CC,	%o6
	udivcc	%g2,	0x1B22,	%l1
	subcc	%i6,	0x0D3F,	%o7
	smul	%g1,	%g6,	%o1
	ta	%icc,	0x4
	fbue,a	%fcc2,	loop_1907
	udiv	%l0,	0x179B,	%g3
	andncc	%i0,	%o5,	%i1
	edge8ln	%o3,	%l6,	%l5
loop_1907:
	fmuld8ulx16	%f12,	%f9,	%f22
	popc	%o4,	%i4
	udivcc	%g5,	0x0B09,	%i5
	movg	%icc,	%i3,	%g7
	edge16	%i2,	%l4,	%i7
	nop
	fitod	%f8,	%f16
	fdtos	%f16,	%f3
	fmovrsgz	%o0,	%f7,	%f29
	fbule	%fcc1,	loop_1908
	udivx	%g4,	0x18D2,	%l3
	fmovsge	%icc,	%f5,	%f31
	bneg,a,pt	%xcc,	loop_1909
loop_1908:
	fpsub16s	%f0,	%f28,	%f3
	tl	%xcc,	0x5
	movcs	%xcc,	%o2,	%l2
loop_1909:
	nop
	setx loop_1910, %l0, %l1
	jmpl %l1, %o6
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%g2
	bgu,pn	%xcc,	loop_1911
	fmovsvc	%xcc,	%f1,	%f6
loop_1910:
	fmovdleu	%xcc,	%f4,	%f1
	sdiv	%l1,	0x1558,	%o7
loop_1911:
	addcc	%g1,	0x14C0,	%i6
	movrgz	%o1,	%g6,	%g3
	fmovs	%f24,	%f28
	xnor	%l0,	0x1D30,	%i0
	movpos	%icc,	%i1,	%o5
	for	%f2,	%f22,	%f6
	fblg,a	%fcc3,	loop_1912
	srax	%o3,	0x1B,	%l5
	sdivcc	%o4,	0x0D9B,	%l6
	smul	%g5,	0x135D,	%i5
loop_1912:
	ldub	[%l7 + 0x67],	%i4
	taddcctv	%g7,	0x1C4D,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l4,	%i3,	%o0
	tpos	%xcc,	0x2
	nop
	fitod	%f12,	%f16
	fdtos	%f16,	%f10
	tg	%icc,	0x7
	subccc	%i7,	0x1D75,	%l3
	edge16	%g4,	%l2,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x62, %g6
	ldsba	[%l7 + %g6] 0x11,	%o6
	stw	%g2,	[%l7 + 0x6C]
	stbar
	nop
	fitos	%f6,	%f5
	edge32l	%o7,	%l1,	%i6
	sdiv	%o1,	0x0FCA,	%g1
	tsubcc	%g6,	0x09C0,	%l0
	set	0x20, %l2
	stxa	%g3,	[%l7 + %l2] 0x2b
	membar	#Sync
	fmovde	%icc,	%f12,	%f6
	bcs,a	loop_1913
	smul	%i1,	%i0,	%o5
	edge32ln	%l5,	%o4,	%o3
	membar	0x03
loop_1913:
	umulcc	%l6,	%i5,	%i4
	edge32ln	%g7,	%i2,	%g5
	fornot1	%f24,	%f2,	%f30
	array8	%l4,	%o0,	%i7
	tn	%icc,	0x4
	fbug	%fcc0,	loop_1914
	tleu	%icc,	0x6
	add	%l3,	%g4,	%i3
	sdiv	%o2,	0x0972,	%o6
loop_1914:
	edge32	%g2,	%l2,	%o7
	edge16l	%l1,	%o1,	%i6
	bvc	%icc,	loop_1915
	fmovscs	%xcc,	%f21,	%f5
	movl	%icc,	%g6,	%g1
	fsrc2	%f30,	%f0
loop_1915:
	fnand	%f24,	%f8,	%f22
	fmovdle	%icc,	%f18,	%f0
	wr	%g0,	0x88,	%asi
	lduba	[%l7 + 0x2D] %asi,	%l0
	fpackfix	%f12,	%f31
	stx	%g3,	[%l7 + 0x68]
	nop
	fitos	%f5,	%f17
	fstod	%f17,	%f12
	tsubcctv	%i1,	0x1C45,	%o5
	fmovrdlz	%i0,	%f28,	%f20
	movvs	%icc,	%l5,	%o4
	tvc	%xcc,	0x0
	sethi	0x17ED,	%l6
	nop
	setx	0x4084ADA81256A7DB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f20
	fbug	%fcc3,	loop_1916
	stb	%i5,	[%l7 + 0x48]
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f8,	%f8,	%f20
loop_1916:
	fands	%f5,	%f31,	%f19
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i4,	%o3,	%i2
	movrgez	%g5,	%g7,	%l4
	tsubcc	%o0,	0x0903,	%i7
	movcs	%icc,	%g4,	%i3
	for	%f16,	%f24,	%f30
	fmul8x16	%f1,	%f8,	%f26
	subc	%l3,	%o2,	%o6
	andcc	%l2,	0x10F8,	%g2
	fpadd16s	%f26,	%f25,	%f3
	movneg	%icc,	%l1,	%o7
	addcc	%o1,	%i6,	%g1
	membar	0x1D
	st	%f13,	[%l7 + 0x68]
	stw	%l0,	[%l7 + 0x7C]
	ldsb	[%l7 + 0x0F],	%g6
	fmul8ulx16	%f2,	%f24,	%f12
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x60] %asi,	%i1
	fmul8x16au	%f20,	%f12,	%f26
	smulcc	%g3,	0x17A7,	%o5
	nop
	setx loop_1917, %l0, %l1
	jmpl %l1, %l5
	srlx	%o4,	0x05,	%l6
	edge8ln	%i0,	%i5,	%o3
	sethi	0x0E33,	%i4
loop_1917:
	fmovdn	%xcc,	%f15,	%f1
	tvs	%icc,	0x2
	sllx	%g5,	0x01,	%g7
	flush	%l7 + 0x34
	movrgz	%i2,	0x1D0,	%l4
	srl	%i7,	0x0C,	%g4
	set	0x3E, %o1
	lduba	[%l7 + %o1] 0x11,	%i3
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%o0
	wr	%g0,	0x81,	%asi
	sta	%f6,	[%l7 + 0x54] %asi
	smul	%o2,	%l3,	%o6
	andcc	%g2,	%l2,	%o7
	bleu,pn	%icc,	loop_1918
	movn	%icc,	%l1,	%o1
	sethi	0x1487,	%i6
	sdivcc	%g1,	0x0FF1,	%g6
loop_1918:
	fmovdgu	%icc,	%f25,	%f14
	brgz,a	%i1,	loop_1919
	move	%icc,	%l0,	%o5
	umul	%g3,	0x198A,	%l5
	fpsub32s	%f21,	%f20,	%f10
loop_1919:
	edge8	%l6,	%i0,	%o4
	bvc,a,pt	%icc,	loop_1920
	xnorcc	%o3,	0x1A21,	%i5
	xnorcc	%i4,	%g7,	%i2
	fmovrdlez	%g5,	%f4,	%f26
loop_1920:
	udivx	%i7,	0x0749,	%g4
	orncc	%i3,	0x133E,	%o0
	edge16n	%l4,	%l3,	%o2
	fmovsge	%icc,	%f12,	%f5
	edge32l	%o6,	%g2,	%o7
	st	%f7,	[%l7 + 0x0C]
	movl	%icc,	%l1,	%o1
	edge32n	%i6,	%l2,	%g1
	movl	%xcc,	%g6,	%i1
	fornot1s	%f8,	%f29,	%f25
	fxors	%f0,	%f17,	%f7
	movpos	%xcc,	%o5,	%l0
	orn	%g3,	%l5,	%i0
	sdivcc	%o4,	0x1BFC,	%l6
	tg	%xcc,	0x0
	umulcc	%o3,	0x1626,	%i5
	movneg	%icc,	%i4,	%i2
	fmul8x16	%f25,	%f22,	%f8
	fxor	%f2,	%f14,	%f12
	stbar
	fpadd16	%f28,	%f30,	%f0
	bg,pt	%xcc,	loop_1921
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g7,	[%l7 + 0x0C]
	fsrc1	%f8,	%f16
loop_1921:
	nop
	fitod	%f0,	%f30
	fdtos	%f30,	%f29
	tpos	%xcc,	0x2
	wr	%g0,	0x10,	%asi
	sta	%f12,	[%l7 + 0x14] %asi
	xnor	%g5,	0x13BB,	%g4
	srl	%i7,	%i3,	%o0
	tvs	%xcc,	0x2
	fsrc2s	%f13,	%f30
	set	0x64, %i5
	swapa	[%l7 + %i5] 0x89,	%l3
	fmovrsgez	%o2,	%f17,	%f8
	srlx	%l4,	0x1E,	%o6
	movrgz	%o7,	%g2,	%o1
	nop
	set	0x7B, %g1
	ldstub	[%l7 + %g1],	%i6
	for	%f4,	%f2,	%f20
	nop
	fitos	%f10,	%f29
	fstoi	%f29,	%f15
	or	%l2,	0x0453,	%l1
	tsubcctv	%g6,	0x045A,	%g1
	mova	%xcc,	%o5,	%l0
	fsrc2s	%f0,	%f2
	ldstub	[%l7 + 0x3E],	%g3
	nop
	setx	0x607ADDC9,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	fbn,a	%fcc1,	loop_1922
	fones	%f8
	umulcc	%i1,	%i0,	%o4
	taddcc	%l5,	%l6,	%i5
loop_1922:
	fabsd	%f26,	%f8
	fmovdvc	%icc,	%f13,	%f27
	movge	%icc,	%o3,	%i2
	std	%f10,	[%l7 + 0x78]
	stb	%i4,	[%l7 + 0x3F]
	nop
	setx	0x5394D4B72AC60A5A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x4B2FEC18D3D151AA,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f2,	%f26
	fmovdg	%xcc,	%f0,	%f14
	movl	%xcc,	%g5,	%g7
	fmovsl	%xcc,	%f3,	%f17
	udivx	%i7,	0x0B71,	%i3
	array8	%o0,	%g4,	%o2
	for	%f4,	%f2,	%f2
	fmovsl	%icc,	%f5,	%f26
	edge8l	%l4,	%o6,	%l3
	fpsub16s	%f23,	%f5,	%f0
	fmovdl	%icc,	%f18,	%f3
	sllx	%o7,	%o1,	%g2
	array16	%l2,	%l1,	%i6
	tn	%xcc,	0x1
	movvs	%icc,	%g6,	%g1
	fmovrslz	%l0,	%f5,	%f7
	alignaddr	%g3,	%i1,	%i0
	bvs,pn	%xcc,	loop_1923
	movrgez	%o5,	0x142,	%o4
	fble	%fcc0,	loop_1924
	subcc	%l5,	%i5,	%o3
loop_1923:
	sdiv	%i2,	0x01F7,	%l6
	tpos	%icc,	0x6
loop_1924:
	movrlz	%i4,	0x127,	%g5
	andcc	%g7,	%i3,	%o0
	xor	%i7,	%g4,	%o2
	andncc	%o6,	%l3,	%o7
	movgu	%xcc,	%l4,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g2,	%l2,	%i6
	brnz,a	%l1,	loop_1925
	nop
	setx	loop_1926,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orn	%g6,	0x1519,	%l0
	nop
	setx loop_1927, %l0, %l1
	jmpl %l1, %g3
loop_1925:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1926:
	edge8	%i1,	%i0,	%g1
	lduw	[%l7 + 0x14],	%o4
loop_1927:
	fors	%f12,	%f7,	%f31
	movne	%xcc,	%l5,	%i5
	brgz,a	%o5,	loop_1928
	fmovsle	%xcc,	%f8,	%f12
	edge16ln	%i2,	%l6,	%i4
	subccc	%o3,	%g7,	%g5
loop_1928:
	fmovscs	%icc,	%f28,	%f23
	or	%o0,	0x170C,	%i7
	nop
	setx loop_1929, %l0, %l1
	jmpl %l1, %g4
	sir	0x12FD
	nop
	fitod	%f6,	%f8
	fdtox	%f8,	%f16
	fxtod	%f16,	%f0
	fabsd	%f14,	%f22
loop_1929:
	orn	%i3,	0x140A,	%o2
	udivcc	%l3,	0x138A,	%o6
	xnor	%l4,	0x1710,	%o1
	sdiv	%g2,	0x0F62,	%o7
	membar	0x5F
	ldd	[%l7 + 0x20],	%i6
	bl,a,pn	%xcc,	loop_1930
	movpos	%icc,	%l1,	%l2
	edge32l	%g6,	%l0,	%g3
	bl	loop_1931
loop_1930:
	ldx	[%l7 + 0x38],	%i1
	ldub	[%l7 + 0x18],	%g1
	sdiv	%i0,	0x0A2A,	%o4
loop_1931:
	nop
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%l5
	fmovdcc	%xcc,	%f19,	%f14
	movge	%icc,	%o5,	%i5
	movleu	%xcc,	%l6,	%i2
	addccc	%o3,	%g7,	%i4
	membar	0x49
	sethi	0x112B,	%o0
	sra	%g5,	0x1E,	%g4
	fmovd	%f0,	%f8
	andn	%i3,	0x19FA,	%i7
	subccc	%l3,	%o2,	%o6
	movvs	%xcc,	%o1,	%g2
	fbue,a	%fcc1,	loop_1932
	tcc	%xcc,	0x2
	udivx	%o7,	0x05A0,	%l4
	sethi	0x1D63,	%l1
loop_1932:
	sdivx	%i6,	0x03B1,	%l2
	tsubcctv	%l0,	0x1C82,	%g3
	fba	%fcc1,	loop_1933
	umulcc	%g6,	%i1,	%g1
	array16	%o4,	%l5,	%i0
	fba	%fcc0,	loop_1934
loop_1933:
	be,pn	%xcc,	loop_1935
	movcc	%icc,	%o5,	%l6
	udiv	%i5,	0x0DCA,	%o3
loop_1934:
	fsrc1	%f12,	%f20
loop_1935:
	flush	%l7 + 0x64
	orn	%i2,	%i4,	%o0
	fbg	%fcc2,	loop_1936
	movl	%icc,	%g7,	%g5
	fors	%f28,	%f30,	%f23
	and	%g4,	0x0B93,	%i7
loop_1936:
	tpos	%icc,	0x3
	tl	%xcc,	0x3
	fmovsgu	%icc,	%f12,	%f22
	bl,pt	%xcc,	loop_1937
	subccc	%l3,	0x0E3B,	%i3
	add	%o2,	0x03DA,	%o6
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x24] %asi,	%g2
loop_1937:
	nop
	set	0x4C, %o2
	ldsha	[%l7 + %o2] 0x19,	%o1
	tge	%xcc,	0x2
	andn	%o7,	0x1E8D,	%l1
	movrlz	%i6,	0x028,	%l4
	ld	[%l7 + 0x5C],	%f9
	xorcc	%l2,	0x0676,	%g3
	edge8ln	%l0,	%g6,	%g1
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x70] %asi,	%o4
	fabss	%f26,	%f14
	srax	%l5,	%i0,	%i1
	tge	%xcc,	0x7
	fbu,a	%fcc1,	loop_1938
	stbar
	bne,pn	%xcc,	loop_1939
	nop
	setx	0x2AA267015D5F1CB3,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xB4BC744940E27871,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fdivd	%f28,	%f26,	%f0
loop_1938:
	edge16n	%l6,	%o5,	%i5
	edge32n	%i2,	%o3,	%o0
loop_1939:
	edge8n	%i4,	%g5,	%g7
	tvs	%icc,	0x4
	addccc	%i7,	0x0166,	%g4
	fmovdge	%xcc,	%f8,	%f12
	fmovde	%xcc,	%f21,	%f11
	bl,a,pn	%xcc,	loop_1940
	brlez,a	%l3,	loop_1941
	pdist	%f2,	%f0,	%f14
	andn	%i3,	%o2,	%o6
loop_1940:
	nop
	setx	0x0C7FCCACC0612606,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
loop_1941:
	mulscc	%o1,	%o7,	%l1
	mulscc	%i6,	%l4,	%l2
	bvc,pt	%icc,	loop_1942
	alignaddr	%g2,	%l0,	%g6
	set	0x7F, %i1
	lduba	[%l7 + %i1] 0x18,	%g3
loop_1942:
	brgez,a	%g1,	loop_1943
	bgu,a,pt	%xcc,	loop_1944
	ldstub	[%l7 + 0x78],	%l5
	fsrc1	%f18,	%f4
loop_1943:
	lduh	[%l7 + 0x2E],	%o4
loop_1944:
	brnz	%i0,	loop_1945
	tpos	%icc,	0x4
	ldx	[%l7 + 0x68],	%i1
	movneg	%icc,	%l6,	%o5
loop_1945:
	andcc	%i5,	%i2,	%o3
	tge	%icc,	0x2
	mova	%icc,	%i4,	%g5
	fmovdneg	%xcc,	%f3,	%f23
	nop
	fitod	%f12,	%f28
	or	%g7,	%i7,	%g4
	movrlez	%l3,	0x29A,	%i3
	fmovd	%f20,	%f8
	mova	%xcc,	%o2,	%o0
	popc	%o6,	%o7
	fbu,a	%fcc2,	loop_1946
	ldsh	[%l7 + 0x5A],	%l1
	movgu	%xcc,	%i6,	%o1
	be	%xcc,	loop_1947
loop_1946:
	orcc	%l2,	0x17D2,	%l4
	tpos	%xcc,	0x6
	wr	%g0,	0x2b,	%asi
	ldda	[%l7 + 0x70] %asi,	%g2
loop_1947:
	movrgez	%g6,	%l0,	%g1
	movgu	%xcc,	%g3,	%l5
	tsubcc	%i0,	%i1,	%o4
	subcc	%o5,	%i5,	%i2
	sllx	%l6,	0x13,	%o3
	tvc	%xcc,	0x0
	movne	%xcc,	%i4,	%g7
	movrne	%g5,	%i7,	%l3
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f8
	bcc	loop_1948
	movvc	%xcc,	%i3,	%g4
	bcs	loop_1949
	subcc	%o0,	0x1BA1,	%o6
loop_1948:
	fba,a	%fcc0,	loop_1950
	nop
	setx	0xE07B8ACB,	%l0,	%l6
	st	%l6,	[%l7 + 0x68]
	ld	[%l7 + 0x68],	%fsr
loop_1949:
	and	%o2,	0x1C6D,	%o7
	edge32	%i6,	%l1,	%l2
loop_1950:
	bn,a	loop_1951
	edge8n	%o1,	%l4,	%g6
	edge32n	%g2,	%l0,	%g1
	tl	%xcc,	0x6
loop_1951:
	ld	[%l7 + 0x08],	%f22
	ldsb	[%l7 + 0x18],	%l5
	ld	[%l7 + 0x54],	%f26
	bshuffle	%f4,	%f8,	%f0
	orncc	%i0,	0x0262,	%i1
	sir	0x09CF
	flush	%l7 + 0x6C
	stw	%o4,	[%l7 + 0x4C]
	nop
	setx	0x0B078554,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x6E28ACC7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fdivs	%f12,	%f4,	%f10
	orn	%o5,	%g3,	%i2
	fand	%f28,	%f10,	%f18
	set	0x6A, %i3
	ldsba	[%l7 + %i3] 0x15,	%i5
	fbo,a	%fcc3,	loop_1952
	fpadd16s	%f6,	%f31,	%f15
	fmovrslz	%l6,	%f10,	%f5
	sdiv	%i4,	0x1FEE,	%g7
loop_1952:
	nop
	fitod	%f2,	%f18
	fdtox	%f18,	%f6
	fxtod	%f6,	%f10
	nop
	set	0x60, %o6
	stx	%o3,	[%l7 + %o6]
	bge,a,pt	%xcc,	loop_1953
	bleu,a,pt	%xcc,	loop_1954
	sll	%i7,	0x1D,	%g5
	fbug	%fcc2,	loop_1955
loop_1953:
	fexpand	%f25,	%f28
loop_1954:
	andncc	%l3,	%g4,	%o0
	fmovsg	%icc,	%f28,	%f13
loop_1955:
	brz,a	%o6,	loop_1956
	srax	%i3,	%o7,	%i6
	movre	%l1,	%l2,	%o1
	taddcctv	%o2,	0x1241,	%l4
loop_1956:
	nop
	setx loop_1957, %l0, %l1
	jmpl %l1, %g6
	sethi	0x1021,	%l0
	wr	%g0,	0x11,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x2
loop_1957:
	nop
	fitod	%f4,	%f28
	fdtox	%f28,	%f28
	tle	%icc,	0x0
	membar	0x30
	wr	%g0,	0x88,	%asi
	sta	%f16,	[%l7 + 0x10] %asi
	edge8	%g2,	%l5,	%i0
	prefetch	[%l7 + 0x7C],	 0x1
	edge32l	%o4,	%o5,	%i1
	fone	%f24
	andcc	%g3,	0x0776,	%i2
	subcc	%i5,	%i4,	%l6
	array16	%o3,	%g7,	%g5
	ldsh	[%l7 + 0x32],	%i7
	tgu	%xcc,	0x2
	tle	%icc,	0x6
	umulcc	%g4,	0x0F22,	%o0
	sdiv	%o6,	0x10F6,	%l3
	addcc	%i3,	%o7,	%i6
	ble,a,pn	%icc,	loop_1958
	tl	%xcc,	0x1
	fmovrdne	%l2,	%f26,	%f14
	nop
	setx	0x738CAF0AF26AD497,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f8
loop_1958:
	movcc	%xcc,	%o1,	%l1
	add	%o2,	0x13DF,	%l4
	fmovrsgez	%g6,	%f0,	%f20
	movcc	%icc,	%g1,	%l0
	orn	%g2,	0x05BA,	%l5
	set	0x5C, %l4
	ldswa	[%l7 + %l4] 0x11,	%i0
	move	%icc,	%o5,	%o4
	fmovdcs	%xcc,	%f12,	%f26
	fbn	%fcc2,	loop_1959
	tge	%xcc,	0x1
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x7C] %asi,	%g3
loop_1959:
	tle	%xcc,	0x1
	movrgz	%i1,	%i2,	%i5
	be,a	%xcc,	loop_1960
	bcc,pn	%xcc,	loop_1961
	tn	%xcc,	0x0
	fmovrse	%l6,	%f29,	%f10
loop_1960:
	srax	%o3,	0x0E,	%i4
loop_1961:
	nop
	setx	0x8C3E22A17A907151,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x9B9493CFE1F65EDD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fsubd	%f20,	%f0,	%f8
	taddcc	%g7,	0x0735,	%i7
	bge,a	loop_1962
	andn	%g5,	%o0,	%g4
	udiv	%o6,	0x0E16,	%l3
	tle	%xcc,	0x2
loop_1962:
	edge16ln	%o7,	%i6,	%l2
	fbe,a	%fcc2,	loop_1963
	mova	%xcc,	%o1,	%i3
	fnot2	%f28,	%f28
	movrgez	%l1,	%o2,	%g6
loop_1963:
	tvc	%xcc,	0x3
	xorcc	%l4,	0x19AA,	%g1
	srax	%l0,	0x12,	%g2
	udiv	%i0,	0x0B23,	%o5
	fpmerge	%f16,	%f10,	%f4
	set	0x20, %o3
	ldswa	[%l7 + %o3] 0x15,	%o4
	nop
	setx	0xA9A001ADD2BBEF3F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x9031BF25D34DE219,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fsubd	%f4,	%f26,	%f6
	bcs,pt	%xcc,	loop_1964
	fandnot1	%f4,	%f20,	%f0
	ble	%xcc,	loop_1965
	fbne,a	%fcc1,	loop_1966
loop_1964:
	tpos	%xcc,	0x6
	tsubcctv	%l5,	0x0A83,	%i1
loop_1965:
	edge32n	%g3,	%i5,	%l6
loop_1966:
	bl,pt	%icc,	loop_1967
	fzero	%f12
	edge16n	%o3,	%i2,	%i4
	fba,a	%fcc1,	loop_1968
loop_1967:
	fandnot1s	%f21,	%f12,	%f25
	fexpand	%f1,	%f28
	fmovdge	%xcc,	%f27,	%f23
loop_1968:
	tge	%icc,	0x5
	fnand	%f20,	%f18,	%f16
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g7,	%g5,	%o0
	brlz,a	%i7,	loop_1969
	nop
	setx	0xD7288335,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f7
	ldsh	[%l7 + 0x52],	%g4
	udiv	%l3,	0x0912,	%o6
loop_1969:
	tn	%icc,	0x2
	array32	%o7,	%l2,	%i6
	fble,a	%fcc0,	loop_1970
	nop
	setx	0x331BECB7E049029C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	tle	%icc,	0x6
	ba,a,pn	%xcc,	loop_1971
loop_1970:
	sub	%i3,	0x0D1C,	%o1
	movrlez	%l1,	%g6,	%o2
	movrgz	%g1,	%l4,	%g2
loop_1971:
	fpsub16s	%f30,	%f16,	%f8
	movg	%xcc,	%l0,	%o5
	movpos	%xcc,	%o4,	%l5
	wr	%g0,	0x18,	%asi
	ldswa	[%l7 + 0x18] %asi,	%i0
	sdivcc	%i1,	0x05FE,	%g3
	fsrc1s	%f19,	%f23
	edge8ln	%i5,	%l6,	%o3
	array16	%i4,	%i2,	%g5
	fpack32	%f18,	%f30,	%f26
	wr	%g0,	0x10,	%asi
	sta	%f20,	[%l7 + 0x28] %asi
	add	%o0,	0x00A3,	%i7
	popc	%g4,	%l3
	mulx	%o6,	%o7,	%l2
	fpack32	%f24,	%f6,	%f4
	subc	%i6,	%i3,	%o1
	udivcc	%g7,	0x187B,	%l1
	addccc	%g6,	%g1,	%l4
	nop
	setx	0x714ADE9B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xDBA5A521,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f21,	%f5
	nop
	setx	0x20497C45,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	fbug	%fcc3,	loop_1972
	ldub	[%l7 + 0x54],	%o2
	edge32	%g2,	%o5,	%l0
	brlz	%l5,	loop_1973
loop_1972:
	taddcctv	%o4,	0x0AF5,	%i1
	sth	%i0,	[%l7 + 0x3C]
	bge,a	loop_1974
loop_1973:
	addc	%g3,	%i5,	%o3
	movneg	%xcc,	%i4,	%l6
	edge8n	%i2,	%g5,	%o0
loop_1974:
	movrlez	%i7,	%g4,	%l3
	movle	%xcc,	%o6,	%o7
	set	0x60, %g2
	lduwa	[%l7 + %g2] 0x80,	%l2
	std	%f12,	[%l7 + 0x60]
	fmul8x16al	%f30,	%f12,	%f26
	nop
	setx	loop_1975,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	alignaddr	%i6,	%i3,	%g7
	sdivx	%o1,	0x1C23,	%g6
	membar	0x44
loop_1975:
	nop
	set	0x08, %g4
	stwa	%l1,	[%l7 + %g4] 0x89
	fcmpgt16	%f10,	%f4,	%l4
	movrgez	%g1,	%o2,	%o5
	tl	%xcc,	0x3
	te	%icc,	0x3
	fpsub32s	%f21,	%f14,	%f6
	movrlz	%g2,	%l0,	%l5
	tcs	%xcc,	0x6
	movgu	%xcc,	%i1,	%i0
	nop
	setx	0xDCAFDEFB507DA767,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	movrlz	%g3,	0x24B,	%o4
	fmul8x16al	%f2,	%f7,	%f10
	movrlez	%i5,	%o3,	%l6
	smul	%i4,	%g5,	%o0
	fcmpgt32	%f4,	%f2,	%i2
	movne	%icc,	%g4,	%l3
	umul	%i7,	0x1A66,	%o6
	movrlez	%l2,	0x267,	%o7
	fbe,a	%fcc0,	loop_1976
	edge8	%i6,	%i3,	%o1
	mulscc	%g7,	%g6,	%l1
	fmovdneg	%icc,	%f9,	%f4
loop_1976:
	tne	%xcc,	0x5
	movvc	%xcc,	%l4,	%o2
	srax	%o5,	0x0C,	%g1
	fmovrdlz	%g2,	%f12,	%f30
	edge32n	%l5,	%l0,	%i0
	movge	%xcc,	%g3,	%o4
	tg	%icc,	0x6
	move	%xcc,	%i5,	%i1
	addcc	%l6,	0x1983,	%o3
	edge32l	%i4,	%g5,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o0,	0x1D4C,	%l3
	movle	%xcc,	%i7,	%o6
	andn	%g4,	%o7,	%i6
	fandnot2	%f28,	%f14,	%f2
	stx	%i3,	[%l7 + 0x38]
	ldd	[%l7 + 0x38],	%f26
	movcs	%icc,	%o1,	%l2
	movle	%xcc,	%g7,	%g6
	movne	%icc,	%l4,	%o2
	mova	%icc,	%l1,	%g1
	sub	%g2,	0x1ED8,	%o5
	movgu	%xcc,	%l5,	%i0
	udivcc	%g3,	0x0531,	%l0
	array16	%i5,	%i1,	%o4
	set	0x20, %g5
	stba	%l6,	[%l7 + %g5] 0x2f
	membar	#Sync
	membar	0x67
	and	%i4,	0x0619,	%g5
	set	0x40, %l3
	stda	%f0,	[%l7 + %l3] 0x80
	fones	%f24
	add	%l7,	0x70,	%l6
	wr	%g0,	0x88,	%asi
	ldxa	[%l6] %asi,	%o3
	casxa	[%l6] 0x88,	%o3,	%o0
	fmovrsgz	%l3,	%f10,	%f30
	xor	%i2,	0x00D6,	%i7
	fxor	%f26,	%f24,	%f12
	movle	%icc,	%g4,	%o6
	bn,a,pt	%icc,	loop_1977
	edge8l	%i6,	%i3,	%o1
	fbl	%fcc1,	loop_1978
	fpadd16	%f28,	%f12,	%f10
loop_1977:
	movn	%xcc,	%l2,	%g7
	fmul8x16al	%f22,	%f5,	%f8
loop_1978:
	udivcc	%o7,	0x1C03,	%g6
	bne,a,pn	%icc,	loop_1979
	srax	%l4,	%o2,	%l1
	fpadd16	%f22,	%f14,	%f10
	fxnor	%f24,	%f12,	%f6
loop_1979:
	taddcctv	%g2,	0x0330,	%o5
	tne	%xcc,	0x6
	movre	%l5,	0x3F0,	%i0
	fmovdvc	%xcc,	%f25,	%f12
	fsrc1s	%f18,	%f2
	mova	%xcc,	%g1,	%l0
	tsubcctv	%g3,	%i5,	%i1
	fmovsvc	%xcc,	%f23,	%f6
	ldsb	[%l7 + 0x49],	%o4
	ldd	[%l7 + 0x60],	%i6
	fbg	%fcc1,	loop_1980
	ldub	[%l7 + 0x74],	%i4
	movvc	%icc,	%o3,	%o0
	fornot2	%f30,	%f6,	%f10
loop_1980:
	xor	%l3,	0x0EBE,	%g5
	nop
	fitos	%f14,	%f3
	fstox	%f3,	%f10
	fxtos	%f10,	%f28
	sllx	%i7,	%g4,	%i2
	movl	%icc,	%i6,	%o6
	umul	%o1,	%i3,	%g7
	set	0x5F, %l0
	stba	%o7,	[%l7 + %l0] 0x89
	array32	%l2,	%g6,	%l4
	umul	%o2,	%l1,	%g2
	movcs	%xcc,	%l5,	%o5
	udiv	%i0,	0x1B59,	%g1
	subcc	%g3,	0x0BBE,	%l0
	fmovrdlz	%i5,	%f14,	%f0
	movrne	%i1,	%o4,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l6,	%o3,	%o0
	brnz	%l3,	loop_1981
	ldd	[%l7 + 0x78],	%f12
	fble,a	%fcc0,	loop_1982
	subc	%i7,	%g5,	%i2
loop_1981:
	andncc	%g4,	%i6,	%o6
	taddcc	%o1,	0x0AB9,	%i3
loop_1982:
	tvs	%xcc,	0x1
	sdiv	%o7,	0x107A,	%g7
	set	0x40, %o7
	ldda	[%l7 + %o7] 0x81,	%f16
	te	%xcc,	0x4
	movg	%icc,	%l2,	%g6
	ba	loop_1983
	add	%o2,	0x00B7,	%l1
	sdivcc	%g2,	0x0FE1,	%l5
	ble,pn	%icc,	loop_1984
loop_1983:
	fpadd32	%f10,	%f6,	%f8
	and	%o5,	0x1838,	%l4
	brgz,a	%i0,	loop_1985
loop_1984:
	fmovscc	%xcc,	%f2,	%f25
	nop
	set	0x20, %o0
	stw	%g1,	[%l7 + %o0]
	set	0x7F, %l6
	ldstuba	[%l7 + %l6] 0x19,	%g3
loop_1985:
	brlez,a	%i5,	loop_1986
	ba	loop_1987
	fnot2s	%f9,	%f23
	ldstub	[%l7 + 0x2C],	%l0
loop_1986:
	stw	%i1,	[%l7 + 0x08]
loop_1987:
	tle	%xcc,	0x4
	edge32l	%i4,	%o4,	%o3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o0,	0x1022,	%l3
	andcc	%i7,	0x01F8,	%l6
	set	0x4C, %i2
	stwa	%i2,	[%l7 + %i2] 0xe3
	membar	#Sync
	mulx	%g4,	0x1D73,	%i6
	sll	%g5,	0x13,	%o1
	edge8	%o6,	%i3,	%g7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbuge	%fcc0,	loop_1988
	move	%icc,	%o7,	%g6
	nop
	fitod	%f8,	%f22
	fdtox	%f22,	%f12
	set	0x3E, %o5
	lduba	[%l7 + %o5] 0x10,	%o2
loop_1988:
	movleu	%icc,	%l2,	%l1
	movgu	%xcc,	%g2,	%l5
	sub	%l4,	0x1AAB,	%o5
	movrlz	%i0,	%g1,	%i5
	movleu	%icc,	%g3,	%l0
	addccc	%i4,	0x19E9,	%o4
	for	%f6,	%f24,	%f22
	edge32l	%o3,	%i1,	%o0
	sllx	%i7,	%l6,	%l3
	sth	%g4,	[%l7 + 0x5C]
	swap	[%l7 + 0x28],	%i6
	prefetch	[%l7 + 0x50],	 0x3
	tg	%icc,	0x5
	fmovrse	%i2,	%f9,	%f8
	tvs	%icc,	0x2
	array32	%g5,	%o1,	%i3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g7,	%o7,	%o6
	fmovdle	%icc,	%f23,	%f29
	sdiv	%g6,	0x1A96,	%l2
	set	0x40, %l1
	stda	%f16,	[%l7 + %l1] 0x19
	edge16	%l1,	%g2,	%l5
	fone	%f30
	sllx	%l4,	0x06,	%o5
	movrgz	%o2,	%g1,	%i0
	edge8n	%i5,	%g3,	%i4
	edge16	%o4,	%o3,	%l0
	sdivcc	%i1,	0x0AA7,	%i7
	movvs	%icc,	%l6,	%l3
	sra	%g4,	0x18,	%i6
	tne	%xcc,	0x5
	movpos	%xcc,	%o0,	%i2
	set	0x79, %i4
	ldsba	[%l7 + %i4] 0x11,	%g5
	ta	%icc,	0x2
	udivx	%i3,	0x0FCB,	%g7
	set	0x1E, %g3
	lduba	[%l7 + %g3] 0x14,	%o7
	xorcc	%o6,	0x10CD,	%o1
	bleu	%icc,	loop_1989
	fmovsge	%icc,	%f23,	%f1
	movge	%xcc,	%l2,	%g6
	fmovrse	%g2,	%f29,	%f13
loop_1989:
	ldub	[%l7 + 0x18],	%l1
	addccc	%l5,	%o5,	%l4
	fmovsgu	%icc,	%f5,	%f14
	tvs	%icc,	0x6
	wr	%g0,	0x81,	%asi
	swapa	[%l7 + 0x74] %asi,	%o2
	movg	%icc,	%i0,	%i5
	nop
	setx loop_1990, %l0, %l1
	jmpl %l1, %g3
	udiv	%g1,	0x1733,	%i4
	addcc	%o3,	%l0,	%o4
	fornot2	%f20,	%f14,	%f24
loop_1990:
	fblg	%fcc1,	loop_1991
	tge	%icc,	0x5
	or	%i7,	%l6,	%l3
	movgu	%xcc,	%g4,	%i1
loop_1991:
	ldstub	[%l7 + 0x62],	%i6
	fpack16	%f16,	%f30
	fbue	%fcc1,	loop_1992
	ta	%icc,	0x7
	fcmpgt16	%f20,	%f30,	%i2
	fmovrslz	%o0,	%f12,	%f17
loop_1992:
	sth	%i3,	[%l7 + 0x14]
	edge32	%g7,	%o7,	%o6
	lduh	[%l7 + 0x6E],	%g5
	movvc	%icc,	%l2,	%g6
	nop
	setx	0xDA342107A204DCBE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	fsqrtd	%f0,	%f16
	add	%g2,	%o1,	%l5
	fmovrslz	%o5,	%f28,	%f1
	umul	%l1,	%o2,	%l4
	nop
	setx	loop_1993,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcc	%i5,	0x0C20,	%g3
	movre	%i0,	%i4,	%o3
	tn	%icc,	0x5
loop_1993:
	fbne,a	%fcc1,	loop_1994
	fxor	%f16,	%f14,	%f6
	fmovdgu	%xcc,	%f21,	%f25
	xnorcc	%g1,	0x038B,	%l0
loop_1994:
	move	%icc,	%o4,	%i7
	xnor	%l3,	%g4,	%i1
	movvc	%icc,	%i6,	%l6
	movrgez	%o0,	%i2,	%i3
	call	loop_1995
	brgz	%g7,	loop_1996
	orn	%o7,	0x1641,	%o6
	alignaddr	%g5,	%g6,	%l2
loop_1995:
	sra	%o1,	0x02,	%l5
loop_1996:
	edge16n	%g2,	%o5,	%l1
	array16	%l4,	%i5,	%o2
	orcc	%i0,	0x187D,	%g3
	sdivcc	%i4,	0x13C5,	%o3
	movcc	%xcc,	%l0,	%o4
	movl	%xcc,	%g1,	%i7
	edge8n	%g4,	%i1,	%l3
	add	%l7,	0x40,	%l6
	wr	%g0,	0x88,	%asi
	casxa	[%l6] 0x88,	%l6,	%i6
	srlx	%o0,	0x08,	%i3
	fbue	%fcc3,	loop_1997
	edge8l	%g7,	%i2,	%o7
	movneg	%xcc,	%g5,	%o6
	andcc	%l2,	0x064A,	%g6
loop_1997:
	smulcc	%o1,	%g2,	%l5
	stw	%l1,	[%l7 + 0x24]
	ta	%xcc,	0x5
	addccc	%o5,	%i5,	%l4
	fbl	%fcc1,	loop_1998
	sethi	0x0F84,	%o2
	set	0x0C, %o4
	ldswa	[%l7 + %o4] 0x89,	%i0
loop_1998:
	edge8ln	%i4,	%g3,	%o3
	edge8	%l0,	%g1,	%o4
	ldx	[%l7 + 0x68],	%i7
	bl,a	loop_1999
	tle	%xcc,	0x2
	movge	%icc,	%i1,	%l3
	fmovrsne	%g4,	%f23,	%f7
loop_1999:
	tge	%icc,	0x3
	movn	%icc,	%l6,	%i6
	set	0x7C, %g7
	ldsba	[%l7 + %g7] 0x0c,	%o0
	nop
	setx	loop_2000,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tsubcctv	%i3,	%i2,	%g7
	movcs	%xcc,	%g5,	%o7
	fbu,a	%fcc0,	loop_2001
loop_2000:
	sth	%o6,	[%l7 + 0x6C]
	andncc	%l2,	%o1,	%g6
	tgu	%xcc,	0x1
loop_2001:
	ldd	[%l7 + 0x70],	%f4
	srax	%l5,	%l1,	%g2
	brgz	%o5,	loop_2002
	or	%l4,	0x122A,	%o2
	fmovdle	%icc,	%f1,	%f26
	wr	%g0,	0x80,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
loop_2002:
	sllx	%i5,	0x1A,	%i0
	stw	%i4,	[%l7 + 0x5C]
	fble,a	%fcc2,	loop_2003
	nop
	setx	0x1F148C54688EDFF1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f20
	sdiv	%g3,	0x0DD0,	%l0
	movrlz	%g1,	%o3,	%o4
loop_2003:
	alignaddrl	%i7,	%l3,	%g4
	mova	%xcc,	%l6,	%i1
	tge	%icc,	0x7
	set	0x30, %i6
	stwa	%o0,	[%l7 + %i6] 0x80
	wr	%g0,	0x80,	%asi
	stwa	%i3,	[%l7 + 0x30] %asi
	fcmpeq32	%f16,	%f2,	%i2
	fmovsge	%xcc,	%f30,	%f21
	fnand	%f22,	%f24,	%f20
	set	0x70, %i0
	ldswa	[%l7 + %i0] 0x80,	%g7
	fbn	%fcc3,	loop_2004
	sethi	0x19E1,	%g5
	brlez,a	%o7,	loop_2005
	edge32ln	%i6,	%l2,	%o6
loop_2004:
	movrgez	%o1,	%g6,	%l1
	tgu	%icc,	0x3
loop_2005:
	movneg	%xcc,	%g2,	%l5
	fmovdcs	%xcc,	%f31,	%f13
	andn	%l4,	%o2,	%o5
	membar	0x13
	fbl	%fcc0,	loop_2006
	fmovrdgez	%i0,	%f16,	%f10
	fmovdl	%xcc,	%f6,	%f0
	sra	%i4,	%g3,	%i5
loop_2006:
	fbl	%fcc1,	loop_2007
	subc	%g1,	%l0,	%o4
	smulcc	%o3,	0x130D,	%i7
	fble	%fcc0,	loop_2008
loop_2007:
	ldsh	[%l7 + 0x52],	%g4
	andn	%l3,	0x0DCB,	%i1
	tcc	%icc,	0x4
loop_2008:
	brgz	%l6,	loop_2009
	udivcc	%i3,	0x1F36,	%i2
	te	%icc,	0x2
	movleu	%icc,	%g7,	%o0
loop_2009:
	stbar
	ble,pn	%xcc,	loop_2010
	sra	%g5,	%i6,	%l2
	edge8l	%o6,	%o1,	%o7
	ldsw	[%l7 + 0x24],	%l1
loop_2010:
	nop
	set	0x18, %i7
	ldxa	[%g0 + %i7] 0x50,	%g6
	brlez,a	%g2,	loop_2011
	sdivx	%l5,	0x138C,	%l4
	bcc,a,pn	%icc,	loop_2012
	sra	%o2,	%i0,	%i4
loop_2011:
	tvc	%icc,	0x2
	sethi	0x0859,	%g3
loop_2012:
	movcs	%icc,	%o5,	%i5
	fandnot1s	%f12,	%f6,	%f22
	tn	%xcc,	0x3
	movleu	%xcc,	%g1,	%o4
	mova	%icc,	%o3,	%i7
	movrne	%l0,	0x324,	%g4
	fbne,a	%fcc2,	loop_2013
	fmovrslz	%l3,	%f20,	%f20
	movne	%icc,	%i1,	%l6
	alignaddrl	%i2,	%g7,	%o0
loop_2013:
	fornot1s	%f12,	%f20,	%f19
	fnegs	%f28,	%f11
	alignaddrl	%g5,	%i3,	%l2
	popc	0x02C5,	%o6
	bl,pt	%icc,	loop_2014
	fnand	%f28,	%f28,	%f14
	prefetch	[%l7 + 0x6C],	 0x2
	edge16n	%i6,	%o1,	%o7
loop_2014:
	fmul8x16al	%f12,	%f30,	%f12
	ldstub	[%l7 + 0x16],	%g6
	nop
	setx	loop_2015,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	edge16	%g2,	%l1,	%l5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x10] %asi,	%l4
loop_2015:
	tge	%xcc,	0x1
	sir	0x0C37
	wr	%g0,	0x89,	%asi
	prefetcha	[%l7 + 0x68] %asi,	 0x3
	sdiv	%i0,	0x1C2A,	%g3
	fzero	%f30
	set	0x40, %l2
	ldda	[%l7 + %l2] 0x88,	%f0
	fble	%fcc0,	loop_2016
	movrgez	%i4,	0x26A,	%o5
	fbg	%fcc2,	loop_2017
	fmul8sux16	%f28,	%f26,	%f10
loop_2016:
	mova	%icc,	%i5,	%g1
	tsubcc	%o4,	0x0ABA,	%i7
loop_2017:
	fmovrse	%l0,	%f29,	%f11
	fpadd16s	%f13,	%f26,	%f11
	movrgz	%o3,	%l3,	%g4
	fbuge	%fcc2,	loop_2018
	taddcc	%i1,	%l6,	%i2
	xnorcc	%o0,	0x0EAB,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2018:
	fcmpgt16	%f28,	%f14,	%g7
	brz,a	%i3,	loop_2019
	fbu	%fcc1,	loop_2020
	movne	%icc,	%l2,	%o6
	fnot1	%f4,	%f28
loop_2019:
	fbug,a	%fcc1,	loop_2021
loop_2020:
	sdivx	%o1,	0x0C72,	%i6
	array32	%g6,	%g2,	%l1
	add	%l7,	0x50,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] %asi,	%l5,	%o7
loop_2021:
	subc	%o2,	0x04D1,	%l4
	xnorcc	%g3,	0x16AA,	%i4
	fmovdle	%xcc,	%f12,	%f4
	movrgez	%o5,	0x17F,	%i5
	alignaddr	%i0,	%o4,	%i7
	move	%xcc,	%l0,	%o3
	movle	%icc,	%g1,	%g4
	tne	%icc,	0x6
	movvs	%icc,	%l3,	%i1
	nop
	fitos	%f1,	%f9
	fstoi	%f9,	%f2
	set	0x3C, %g6
	lduwa	[%l7 + %g6] 0x15,	%l6
	fmovrslez	%i2,	%f3,	%f14
	array8	%g5,	%o0,	%i3
	ta	%icc,	0x3
	andn	%g7,	0x06B7,	%o6
	st	%f4,	[%l7 + 0x20]
	te	%xcc,	0x0
	bgu,a,pn	%xcc,	loop_2022
	movrlez	%o1,	0x29E,	%i6
	taddcc	%l2,	%g2,	%l1
	xnorcc	%l5,	0x0A3A,	%g6
loop_2022:
	nop
	set	0x70, %l5
	lduh	[%l7 + %l5],	%o2
	fbu,a	%fcc0,	loop_2023
	srl	%o7,	%g3,	%l4
	mova	%xcc,	%o5,	%i5
	edge8	%i4,	%i0,	%i7
loop_2023:
	tn	%xcc,	0x3
	addc	%l0,	0x14EA,	%o4
	orn	%g1,	%o3,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f18,	%f4,	%f26
	fmovsgu	%icc,	%f10,	%f8
	fmovdgu	%xcc,	%f13,	%f17
	fmovrslz	%i1,	%f12,	%f31
	array16	%l6,	%i2,	%g4
	wr	%g0,	0x27,	%asi
	ldda	[%l7 + 0x40] %asi,	%o0
	taddcc	%g5,	%i3,	%o6
	nop
	fitod	%f5,	%f16
	tg	%icc,	0x7
	tsubcctv	%g7,	0x1B1D,	%i6
	tne	%icc,	0x6
	ldd	[%l7 + 0x68],	%f0
	fbge	%fcc3,	loop_2024
	movg	%xcc,	%o1,	%g2
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
loop_2024:
	udivcc	%l2,	0x0313,	%l1
	fmovdl	%icc,	%f21,	%f4
	sub	%g6,	0x0488,	%o2
	edge32l	%l5,	%g3,	%l4
	tcc	%icc,	0x5
	fands	%f16,	%f1,	%f16
	add	%o7,	%o5,	%i4
	lduw	[%l7 + 0x08],	%i0
	edge32	%i5,	%l0,	%o4
	movn	%icc,	%g1,	%o3
	wr	%g0,	0xeb,	%asi
	ldda	[%l7 + 0x20] %asi,	%l2
	fmovdcc	%xcc,	%f13,	%f25
	set	0x6C, %o1
	stba	%i1,	[%l7 + %o1] 0xe2
	membar	#Sync
	ta	%xcc,	0x6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x54
	set	0x70, %i5
	swapa	[%l7 + %i5] 0x18,	%i7
	fbule,a	%fcc0,	loop_2025
	smulcc	%i2,	0x0ED1,	%l6
	nop
	fitos	%f1,	%f4
	fandnot2s	%f6,	%f15,	%f20
loop_2025:
	fsrc1	%f18,	%f30
	wr	%g0,	0x80,	%asi
	lduha	[%l7 + 0x4E] %asi,	%g4
	tpos	%xcc,	0x7
	set	0x40, %o2
	stda	%f16,	[%l7 + %o2] 0x18
	fbl	%fcc1,	loop_2026
	nop
	fitos	%f0,	%f27
	fstod	%f27,	%f6
	brgz	%g5,	loop_2027
	faligndata	%f0,	%f16,	%f6
loop_2026:
	nop
	fitos	%f4,	%f11
	fstoi	%f11,	%f21
	edge16	%i3,	%o0,	%g7
loop_2027:
	sir	0x1B7A
	movvc	%icc,	%i6,	%o6
	fmovrdgz	%o1,	%f20,	%f22
	fmovrdgz	%g2,	%f10,	%f30
	movgu	%icc,	%l2,	%l1
	ta	%xcc,	0x4
	movcc	%xcc,	%g6,	%l5
	andncc	%g3,	%o2,	%o7
	srax	%o5,	%i4,	%i0
	edge32l	%l4,	%i5,	%l0
	tvs	%icc,	0x7
	wr	%g0,	0xe3,	%asi
	stxa	%o4,	[%l7 + 0x48] %asi
	membar	#Sync
	set	0x7C, %g1
	ldswa	[%l7 + %g1] 0x19,	%o3
	movrlz	%l3,	%i1,	%i7
	movrgez	%g1,	%i2,	%l6
	tn	%xcc,	0x1
	fmovdneg	%xcc,	%f12,	%f13
	edge8n	%g5,	%i3,	%g4
	fmovsvs	%xcc,	%f23,	%f4
	edge32	%o0,	%i6,	%g7
	movcc	%xcc,	%o6,	%g2
	fcmple32	%f0,	%f12,	%o1
	bgu	%xcc,	loop_2028
	sdivx	%l1,	0x141C,	%g6
	subccc	%l2,	%l5,	%g3
	edge8n	%o7,	%o2,	%i4
loop_2028:
	membar	0x0D
	srax	%i0,	0x17,	%l4
	taddcctv	%i5,	0x1082,	%o5
	nop
	setx	loop_2029,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fmovsgu	%xcc,	%f19,	%f4
	bne,a	loop_2030
	fpack32	%f30,	%f30,	%f2
loop_2029:
	taddcctv	%l0,	0x0E76,	%o3
	movg	%xcc,	%o4,	%i1
loop_2030:
	tcc	%xcc,	0x6
	bleu,a,pn	%xcc,	loop_2031
	movleu	%icc,	%i7,	%g1
	nop
	setx	0xE906B03C1DF7ECBF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0x7BA97C09C577DA46,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f26,	%f6
	fnegd	%f6,	%f22
loop_2031:
	bcs,a	%xcc,	loop_2032
	andcc	%i2,	%l3,	%g5
	membar	0x18
	movrlz	%i3,	0x098,	%g4
loop_2032:
	tcs	%xcc,	0x7
	andncc	%l6,	%o0,	%g7
	bcs,a	%xcc,	loop_2033
	tg	%icc,	0x6
	and	%o6,	0x099B,	%i6
	array16	%o1,	%l1,	%g2
loop_2033:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l2,	0x1ED2,	%l5
	brgez	%g6,	loop_2034
	nop
	setx	0x9C44F8FF,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xCF50F8D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fsubs	%f7,	%f12,	%f28
	array8	%o7,	%o2,	%g3
	bpos,a,pt	%icc,	loop_2035
loop_2034:
	xnor	%i0,	0x16FC,	%i4
	tl	%icc,	0x7
	fornot2	%f6,	%f18,	%f14
loop_2035:
	lduh	[%l7 + 0x44],	%i5
	movrlez	%o5,	%l0,	%o3
	ldsb	[%l7 + 0x36],	%l4
	and	%i1,	%i7,	%g1
	brlz,a	%i2,	loop_2036
	mulscc	%o4,	0x13C3,	%g5
	srl	%l3,	0x1A,	%i3
	fand	%f8,	%f12,	%f12
loop_2036:
	movge	%icc,	%l6,	%o0
	orncc	%g4,	0x0607,	%g7
	mulscc	%o6,	0x183A,	%o1
	bg,a	%xcc,	loop_2037
	umulcc	%i6,	0x0DCA,	%g2
	brgz	%l2,	loop_2038
	bl	loop_2039
loop_2037:
	nop
	setx	0x57DE30A6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0xDC0FAE94,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f0
	fdivs	%f0,	%f28,	%f20
	udiv	%l1,	0x1052,	%g6
loop_2038:
	xnorcc	%o7,	%o2,	%l5
loop_2039:
	addcc	%i0,	0x1FE5,	%g3
	sub	%i5,	0x1ACC,	%i4
	edge8	%o5,	%l0,	%l4
	smulcc	%o3,	0x00CD,	%i1
	movpos	%xcc,	%i7,	%i2
	fmovdvc	%icc,	%f15,	%f28
	bl,a,pn	%icc,	loop_2040
	smulcc	%g1,	%o4,	%g5
	array16	%l3,	%i3,	%l6
	sdivx	%g4,	0x0750,	%o0
loop_2040:
	sllx	%g7,	0x0A,	%o6
	be,pt	%icc,	loop_2041
	movle	%icc,	%i6,	%g2
	array16	%l2,	%o1,	%l1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2041:
	fandnot1s	%f14,	%f19,	%f1
	edge16n	%o7,	%g6,	%l5
	add	%i0,	%o2,	%i5
	subcc	%i4,	%o5,	%g3
	edge32l	%l4,	%o3,	%i1
	tne	%icc,	0x5
	wr	%g0,	0x88,	%asi
	stba	%l0,	[%l7 + 0x73] %asi
	orncc	%i2,	%g1,	%i7
	subcc	%o4,	%l3,	%g5
	movrgz	%i3,	0x28B,	%l6
	fpack32	%f18,	%f12,	%f8
	tgu	%xcc,	0x2
	fxnor	%f28,	%f10,	%f6
	sdiv	%g4,	0x1154,	%o0
	xnor	%g7,	0x1FEC,	%i6
	alignaddrl	%g2,	%l2,	%o6
	smulcc	%o1,	0x0FCE,	%l1
	fmovdgu	%xcc,	%f0,	%f7
	fmovse	%xcc,	%f13,	%f27
	bne,pn	%xcc,	loop_2042
	bne,a	%icc,	loop_2043
	movre	%g6,	%o7,	%l5
	tgu	%icc,	0x6
loop_2042:
	fblg,a	%fcc1,	loop_2044
loop_2043:
	alignaddr	%i0,	%o2,	%i4
	fmovrsgz	%o5,	%f21,	%f21
	ldsb	[%l7 + 0x4D],	%i5
loop_2044:
	sir	0x1059
	addccc	%l4,	0x0818,	%o3
	orncc	%i1,	0x1F77,	%g3
	fmovsneg	%icc,	%f10,	%f9
	array16	%l0,	%i2,	%i7
	andcc	%g1,	0x028D,	%o4
	sth	%l3,	[%l7 + 0x70]
	add	%l7,	0x48,	%l6
	wr	%g0,	0x18,	%asi
	lda	[%l6] %asi,	%g5
	casa	[%l6] %asi,	%g5,	%l6
	fand	%f22,	%f8,	%f18
	nop
	setx	0x807C955B,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	fmovrsne	%g4,	%f20,	%f29
	udiv	%i3,	0x00DA,	%g7
	movrlez	%o0,	0x3C5,	%g2
	tg	%icc,	0x2
	fmovdvc	%icc,	%f15,	%f14
	tn	%xcc,	0x7
	subccc	%l2,	%i6,	%o1
	sir	0x182F
	sub	%o6,	%l1,	%g6
	subc	%o7,	%l5,	%i0
	edge32	%i4,	%o2,	%i5
	orcc	%l4,	%o3,	%o5
	edge8	%g3,	%i1,	%i2
	nop
	fitod	%f0,	%f26
	fdtos	%f26,	%f11
	nop
	setx	0xC576D139C3DD7423,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x8DB795781557ECF2,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fmuld	%f16,	%f24,	%f24
	fbuge	%fcc0,	loop_2045
	array32	%i7,	%g1,	%o4
	ldsw	[%l7 + 0x38],	%l0
	orncc	%l3,	%g5,	%l6
loop_2045:
	edge32	%g4,	%g7,	%o0
	tle	%icc,	0x6
	fmovrsgez	%i3,	%f2,	%f26
	bneg,pt	%xcc,	loop_2046
	movgu	%icc,	%l2,	%i6
	stb	%g2,	[%l7 + 0x3D]
	tvs	%xcc,	0x0
loop_2046:
	fmovse	%icc,	%f14,	%f19
	brnz	%o1,	loop_2047
	tvc	%xcc,	0x3
	edge32l	%l1,	%g6,	%o7
	bn,pn	%icc,	loop_2048
loop_2047:
	fornot1	%f26,	%f2,	%f8
	fornot1	%f0,	%f16,	%f4
	fandnot1	%f4,	%f4,	%f24
loop_2048:
	flush	%l7 + 0x68
	fmovdn	%icc,	%f27,	%f21
	set	0x60, %i3
	sta	%f22,	[%l7 + %i3] 0x88
	fpsub16s	%f8,	%f24,	%f23
	smulcc	%l5,	0x1077,	%i0
	brlez	%i4,	loop_2049
	nop
	fitod	%f12,	%f30
	fdtoi	%f30,	%f12
	umul	%o6,	0x03E1,	%o2
	taddcc	%l4,	0x1B5B,	%i5
loop_2049:
	movrlz	%o3,	0x087,	%g3
	tn	%icc,	0x4
	edge32ln	%o5,	%i2,	%i7
	tcs	%xcc,	0x3
	set	0x0C, %o6
	stwa	%i1,	[%l7 + %o6] 0xe3
	membar	#Sync
	movrgz	%g1,	0x1F8,	%o4
	add	%l0,	%g5,	%l3
	alignaddr	%g4,	%g7,	%o0
	movcc	%xcc,	%i3,	%l6
	fbu	%fcc2,	loop_2050
	fbuge,a	%fcc2,	loop_2051
	fbul	%fcc1,	loop_2052
	fabss	%f15,	%f19
loop_2050:
	array16	%l2,	%g2,	%i6
loop_2051:
	orncc	%o1,	%g6,	%o7
loop_2052:
	fbl	%fcc1,	loop_2053
	movne	%xcc,	%l1,	%l5
	xor	%i4,	0x0BCB,	%o6
	ldub	[%l7 + 0x2B],	%o2
loop_2053:
	fsrc1	%f4,	%f6
	edge32n	%l4,	%i0,	%i5
	movle	%xcc,	%o3,	%g3
	nop
	fitos	%f8,	%f18
	fstod	%f18,	%f30
	fmovsne	%xcc,	%f3,	%f9
	bleu	%xcc,	loop_2054
	sllx	%o5,	%i2,	%i1
	tge	%icc,	0x1
	sethi	0x0EF6,	%g1
loop_2054:
	brnz,a	%o4,	loop_2055
	fcmpgt16	%f24,	%f22,	%i7
	xor	%l0,	0x12DD,	%l3
	nop
	setx	0x7FDACD9FA38C5B74,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	setx	0x984CBA21D68874A7,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fdivd	%f26,	%f10,	%f16
loop_2055:
	edge16ln	%g5,	%g7,	%o0
	stx	%g4,	[%l7 + 0x48]
	fmovsge	%xcc,	%f31,	%f29
	edge32l	%l6,	%l2,	%i3
	fmovsa	%xcc,	%f29,	%f25
	movrgez	%g2,	0x0BE,	%i6
	sra	%g6,	0x18,	%o1
	mulscc	%o7,	0x170D,	%l5
	xor	%l1,	0x1B2B,	%o6
	lduh	[%l7 + 0x5E],	%i4
	fpadd32	%f16,	%f24,	%f0
	tgu	%icc,	0x2
	be,a,pn	%icc,	loop_2056
	fbule	%fcc2,	loop_2057
	taddcc	%l4,	%o2,	%i5
	xnorcc	%i0,	%g3,	%o3
loop_2056:
	prefetch	[%l7 + 0x10],	 0x1
loop_2057:
	udiv	%i2,	0x1B5B,	%i1
	edge16ln	%g1,	%o4,	%o5
	tcs	%icc,	0x4
	nop
	setx	0x4241288724BB3D94,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x4B651FAA9F646969,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f24,	%f0
	fmovsvs	%icc,	%f28,	%f27
	movrlez	%i7,	0x0B8,	%l0
	fmovda	%icc,	%f8,	%f8
	edge32n	%l3,	%g7,	%g5
	movrne	%g4,	%o0,	%l6
	fornot1s	%f26,	%f9,	%f11
	set	0x10, %l4
	lda	[%l7 + %l4] 0x04,	%f18
	te	%icc,	0x7
	fbue,a	%fcc0,	loop_2058
	fmovsleu	%icc,	%f28,	%f7
	fbe,a	%fcc0,	loop_2059
	smulcc	%i3,	%g2,	%i6
loop_2058:
	edge8	%g6,	%l2,	%o7
	andncc	%l5,	%l1,	%o6
loop_2059:
	bl,pt	%xcc,	loop_2060
	xorcc	%i4,	%l4,	%o2
	fandnot2s	%f6,	%f15,	%f1
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x46] %asi,	%o1
loop_2060:
	nop
	setx	0xEFFBC5C4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	setx	0x3F2A05E5,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fdivs	%f19,	%f18,	%f3
	nop
	setx	0xEBB9B045DBCCE731,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x83B71AAC656F61AB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	faddd	%f16,	%f2,	%f0
	movge	%xcc,	%i0,	%i5
	edge32	%o3,	%i2,	%g3
	fmovse	%xcc,	%f1,	%f31
	set	0x40, %o3
	ldsha	[%l7 + %o3] 0x18,	%i1
	nop
	fitod	%f2,	%f14
	fdtox	%f14,	%f8
	fxtod	%f8,	%f4
	movrlz	%o4,	0x2FF,	%o5
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x2
	fpmerge	%f16,	%f4,	%f24
	sllx	%g1,	0x11,	%l0
	ta	%xcc,	0x3
	wr	%g0,	0x18,	%asi
	swapa	[%l7 + 0x24] %asi,	%g7
	set	0x4B, %g2
	lduba	[%l7 + %g2] 0x15,	%g5
	xor	%g4,	%l3,	%l6
	edge8	%o0,	%g2,	%i6
	array32	%i3,	%g6,	%l2
	taddcctv	%o7,	0x1154,	%l1
	srax	%o6,	%l5,	%i4
	orcc	%o2,	0x0409,	%o1
	array16	%l4,	%i0,	%i5
	tcs	%icc,	0x0
	tleu	%icc,	0x2
	edge16	%i2,	%g3,	%i1
	fbg	%fcc2,	loop_2061
	srax	%o3,	0x05,	%o5
	addccc	%i7,	%o4,	%l0
	orcc	%g7,	%g1,	%g4
loop_2061:
	ldx	[%l7 + 0x70],	%l3
	alignaddrl	%l6,	%o0,	%g2
	tpos	%xcc,	0x4
	nop
	setx	loop_2062,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	subcc	%i6,	%g5,	%i3
	nop
	setx	0x086BF9F960704C49,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	movleu	%icc,	%g6,	%l2
loop_2062:
	xnorcc	%o7,	%l1,	%o6
	udiv	%i4,	0x14AD,	%o2
	sdivcc	%l5,	0x0E36,	%o1
	fblg	%fcc0,	loop_2063
	fmovda	%icc,	%f7,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l4,	%i0,	%i2
loop_2063:
	addccc	%g3,	0x1EFD,	%i5
	movpos	%icc,	%i1,	%o3
	fbue	%fcc3,	loop_2064
	fpadd16s	%f17,	%f5,	%f9
	fbe	%fcc2,	loop_2065
	bge	loop_2066
loop_2064:
	nop
	setx	0xA5BC39194A441447,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xE0E9DA76B4111F93,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	fsubd	%f14,	%f6,	%f24
	fnot1	%f2,	%f16
loop_2065:
	fmovdvs	%icc,	%f9,	%f29
loop_2066:
	edge16n	%o5,	%o4,	%l0
	tneg	%xcc,	0x6
	fmovscs	%xcc,	%f22,	%f8
	andncc	%i7,	%g7,	%g1
	movg	%icc,	%l3,	%g4
	fmovdcs	%xcc,	%f17,	%f5
	tsubcctv	%o0,	%g2,	%l6
	tcs	%icc,	0x6
	tn	%xcc,	0x5
	subc	%i6,	%i3,	%g5
	nop
	setx loop_2067, %l0, %l1
	jmpl %l1, %l2
	bgu,pn	%icc,	loop_2068
	movvc	%xcc,	%g6,	%l1
	fcmpgt16	%f28,	%f30,	%o7
loop_2067:
	edge16n	%o6,	%o2,	%l5
loop_2068:
	fmovd	%f30,	%f22
	fmovrdlz	%o1,	%f10,	%f28
	movl	%icc,	%l4,	%i4
	edge32n	%i2,	%i0,	%g3
	nop
	setx	0x801EEE98,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0x00DC682D,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f19
	fsubs	%f19,	%f19,	%f23
	movl	%xcc,	%i5,	%i1
	addccc	%o5,	0x1A01,	%o3
	xorcc	%o4,	0x0600,	%i7
	fbul,a	%fcc3,	loop_2069
	umulcc	%g7,	%l0,	%g1
	ble,pn	%xcc,	loop_2070
	subc	%l3,	0x10B6,	%o0
loop_2069:
	tn	%xcc,	0x0
	ldsb	[%l7 + 0x64],	%g2
loop_2070:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f14,	%f11
	movg	%icc,	%g4,	%i6
	bcs,pt	%xcc,	loop_2071
	tsubcc	%i3,	0x0C51,	%g5
	xor	%l2,	0x1A84,	%g6
	edge8n	%l6,	%o7,	%l1
loop_2071:
	bgu	loop_2072
	fmovs	%f1,	%f23
	fbg,a	%fcc3,	loop_2073
	nop
	fitod	%f6,	%f10
	fdtox	%f10,	%f22
	fxtod	%f22,	%f4
loop_2072:
	udivx	%o6,	0x0DBA,	%o2
	tsubcc	%o1,	0x0A6B,	%l4
loop_2073:
	ldsh	[%l7 + 0x4A],	%l5
	andn	%i2,	0x0E3C,	%i4
	fandnot1	%f28,	%f8,	%f4
	movleu	%icc,	%i0,	%g3
	fmovdleu	%xcc,	%f10,	%f23
	movvs	%xcc,	%i5,	%o5
	edge16l	%i1,	%o4,	%o3
	fmovrdne	%g7,	%f24,	%f18
	sllx	%i7,	%l0,	%g1
	subc	%o0,	0x11D8,	%l3
	tl	%icc,	0x6
	xnor	%g2,	%i6,	%i3
	tleu	%xcc,	0x3
	bne	loop_2074
	ld	[%l7 + 0x7C],	%f18
	movrgz	%g4,	%l2,	%g6
	fbue,a	%fcc3,	loop_2075
loop_2074:
	array16	%l6,	%o7,	%l1
	xnor	%o6,	0x11E5,	%g5
	tgu	%xcc,	0x1
loop_2075:
	or	%o1,	0x13DD,	%l4
	and	%l5,	0x0361,	%i2
	tvs	%xcc,	0x1
	sdivcc	%o2,	0x1C6A,	%i4
	tg	%icc,	0x5
	movcs	%xcc,	%g3,	%i5
	orn	%o5,	%i0,	%i1
	fbul	%fcc0,	loop_2076
	bleu,a,pn	%xcc,	loop_2077
	tpos	%icc,	0x0
	fbne,a	%fcc0,	loop_2078
loop_2076:
	udiv	%o4,	0x157C,	%o3
loop_2077:
	fmul8sux16	%f8,	%f10,	%f4
	orncc	%g7,	0x00A1,	%i7
loop_2078:
	udivcc	%g1,	0x1813,	%o0
	addccc	%l3,	0x0050,	%g2
	brgz	%i6,	loop_2079
	xnor	%l0,	%i3,	%g4
	umul	%g6,	0x0E89,	%l6
	movgu	%xcc,	%o7,	%l2
loop_2079:
	xnorcc	%l1,	0x185E,	%o6
	fbo	%fcc3,	loop_2080
	movre	%g5,	%l4,	%l5
	srlx	%o1,	0x05,	%o2
	add	%i4,	0x07C5,	%g3
loop_2080:
	edge32ln	%i5,	%i2,	%o5
	fmuld8sux16	%f3,	%f10,	%f24
	tsubcc	%i1,	0x0523,	%i0
	lduw	[%l7 + 0x48],	%o3
	fmovdge	%icc,	%f18,	%f29
	tpos	%xcc,	0x4
	smulcc	%g7,	%o4,	%g1
	membar	0x6D
	fbn	%fcc0,	loop_2081
	or	%o0,	%i7,	%g2
	movcs	%icc,	%l3,	%i6
	srl	%i3,	0x05,	%l0
loop_2081:
	lduw	[%l7 + 0x30],	%g4
	fblg,a	%fcc0,	loop_2082
	tsubcc	%l6,	%g6,	%o7
	fmovrslz	%l1,	%f29,	%f1
	ble	%xcc,	loop_2083
loop_2082:
	nop
	fitod	%f6,	%f0
	fdtos	%f0,	%f20
	smul	%l2,	%g5,	%l4
	movleu	%icc,	%o6,	%l5
loop_2083:
	nop
	wr	%g0,	0x89,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	set	0x60, %i1
	ldda	[%l7 + %i1] 0x10,	%o0
	fmul8x16	%f23,	%f18,	%f6
	andncc	%i4,	%g3,	%i5
	movrgez	%o2,	%o5,	%i2
	andncc	%i0,	%i1,	%o3
	movg	%xcc,	%o4,	%g7
	orncc	%o0,	%g1,	%g2
	wr	%g0,	0x80,	%asi
	stha	%l3,	[%l7 + 0x5C] %asi
	fbge,a	%fcc3,	loop_2084
	or	%i7,	0x1D4D,	%i3
	sdivx	%l0,	0x04CA,	%i6
	tpos	%xcc,	0x5
loop_2084:
	subc	%g4,	%g6,	%o7
	fba	%fcc1,	loop_2085
	ldsh	[%l7 + 0x70],	%l6
	udivx	%l2,	0x1A95,	%g5
	set	0x28, %g4
	stxa	%l4,	[%l7 + %g4] 0x89
loop_2085:
	nop
	set	0x24, %g5
	stwa	%o6,	[%l7 + %g5] 0x19
	fmovdvc	%icc,	%f14,	%f28
	movle	%icc,	%l5,	%o1
	sra	%l1,	%g3,	%i4
	nop
	setx	0x7814CF90305AC172,	%l0,	%l6
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x38],	%fsr
	sll	%i5,	%o2,	%i2
	fcmple32	%f30,	%f12,	%i0
	fbuge,a	%fcc1,	loop_2086
	flush	%l7 + 0x54
	nop
	fitos	%f8,	%f21
	fstox	%f21,	%f2
	fxtos	%f2,	%f1
	fbe	%fcc2,	loop_2087
loop_2086:
	ble,a,pn	%xcc,	loop_2088
	edge16n	%i1,	%o3,	%o4
	andcc	%o5,	0x025E,	%g7
loop_2087:
	tcc	%icc,	0x2
loop_2088:
	ta	%xcc,	0x4
	membar	0x07
	fzero	%f4
	stb	%g1,	[%l7 + 0x73]
	fbue,a	%fcc0,	loop_2089
	ldd	[%l7 + 0x10],	%f20
	set	0x2C, %l3
	stwa	%g2,	[%l7 + %l3] 0x15
loop_2089:
	taddcctv	%o0,	%l3,	%i3
	movrlz	%i7,	0x33B,	%l0
	stb	%g4,	[%l7 + 0x66]
	umulcc	%g6,	%o7,	%i6
	udivx	%l2,	0x0AE2,	%l6
	tsubcctv	%l4,	%g5,	%l5
	sethi	0x0805,	%o6
	fors	%f18,	%f17,	%f13
	fbu	%fcc3,	loop_2090
	fbug,a	%fcc1,	loop_2091
	fbn,a	%fcc0,	loop_2092
	nop
	fitod	%f8,	%f22
	fdtoi	%f22,	%f9
loop_2090:
	fpsub16s	%f5,	%f29,	%f8
loop_2091:
	fsrc2	%f18,	%f12
loop_2092:
	smulcc	%o1,	%g3,	%i4
	sll	%l1,	%o2,	%i5
	fcmpeq32	%f30,	%f2,	%i2
	umulcc	%i1,	0x1586,	%o3
	tgu	%icc,	0x5
	fbl	%fcc1,	loop_2093
	fmovdleu	%icc,	%f16,	%f0
	ldd	[%l7 + 0x68],	%i0
	nop
	setx	0xEF4EADF9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	setx	0x1C61E2B8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f25,	%f26
loop_2093:
	tl	%icc,	0x6
	movrlez	%o4,	%g7,	%g1
	array16	%g2,	%o0,	%l3
	movleu	%xcc,	%o5,	%i3
	edge8n	%l0,	%i7,	%g6
	andn	%o7,	0x03A4,	%g4
	orn	%i6,	%l6,	%l2
	fmovsvs	%xcc,	%f31,	%f20
	tle	%icc,	0x3
	or	%l4,	%g5,	%l5
	orncc	%o6,	%o1,	%i4
	tl	%icc,	0x4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g3,	%o2
	tge	%xcc,	0x3
	fmovrdne	%i5,	%f24,	%f18
	movpos	%xcc,	%i2,	%i1
	movre	%o3,	0x3E5,	%i0
	fsrc2	%f12,	%f18
	smul	%l1,	0x0AEA,	%o4
	edge16l	%g7,	%g2,	%o0
	fmovrse	%l3,	%f11,	%f30
	nop
	setx	0x26AE7288,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	fsqrts	%f12,	%f12
	fbne,a	%fcc2,	loop_2094
	fand	%f22,	%f30,	%f12
	mova	%icc,	%g1,	%o5
	udiv	%l0,	0x1B6F,	%i7
loop_2094:
	movrne	%i3,	%g6,	%o7
	xor	%g4,	0x1D06,	%i6
	swap	[%l7 + 0x7C],	%l2
	array32	%l6,	%g5,	%l4
	movneg	%xcc,	%o6,	%l5
	fcmple32	%f6,	%f2,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g3,	%o2,	%i4
	fmovda	%xcc,	%f19,	%f3
	edge8n	%i5,	%i1,	%o3
	smul	%i0,	%l1,	%o4
	fmovdvs	%xcc,	%f21,	%f21
	fmul8x16	%f7,	%f18,	%f28
	mova	%icc,	%g7,	%g2
	move	%xcc,	%o0,	%i2
	fbg	%fcc0,	loop_2095
	fpadd16s	%f4,	%f0,	%f6
	fbue	%fcc0,	loop_2096
	bleu,a,pt	%xcc,	loop_2097
loop_2095:
	fmovrslez	%g1,	%f11,	%f21
	edge8n	%o5,	%l0,	%l3
loop_2096:
	nop
	fitod	%f16,	%f26
loop_2097:
	fbe	%fcc3,	loop_2098
	edge8l	%i3,	%i7,	%o7
	set	0x10, %l0
	lduba	[%l7 + %l0] 0x14,	%g4
loop_2098:
	fmovrsgez	%i6,	%f5,	%f13
	movge	%xcc,	%l2,	%l6
	movrne	%g6,	%g5,	%o6
	nop
	setx	loop_2099,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tle	%icc,	0x1
	fmovse	%icc,	%f11,	%f21
	edge16n	%l4,	%l5,	%o1
loop_2099:
	popc	0x1342,	%g3
	xorcc	%i4,	0x05F7,	%o2
	tg	%xcc,	0x5
	nop
	set	0x10, %o7
	ldsw	[%l7 + %o7],	%i5
	tge	%xcc,	0x2
	movge	%icc,	%o3,	%i0
	addc	%i1,	0x15B9,	%o4
	fmovsvc	%xcc,	%f6,	%f10
	fmovs	%f29,	%f8
	fpsub32s	%f16,	%f11,	%f22
	mulx	%g7,	%g2,	%o0
	fmovdle	%xcc,	%f24,	%f9
	taddcc	%l1,	%g1,	%i2
	movre	%l0,	0x356,	%l3
	fmovrsgez	%o5,	%f12,	%f13
	popc	%i3,	%i7
	edge16	%g4,	%i6,	%o7
	swap	[%l7 + 0x48],	%l6
	subcc	%g6,	0x1333,	%l2
	alignaddr	%o6,	%g5,	%l4
	taddcc	%l5,	%g3,	%i4
	tg	%xcc,	0x2
	brgz	%o2,	loop_2100
	umul	%o1,	%o3,	%i5
	fandnot2s	%f17,	%f14,	%f7
	sra	%i0,	0x14,	%i1
loop_2100:
	fcmpeq16	%f30,	%f12,	%g7
	movpos	%icc,	%g2,	%o0
	or	%l1,	%o4,	%g1
	movge	%icc,	%i2,	%l0
	nop
	fitod	%f3,	%f24
	fandnot2	%f30,	%f24,	%f8
	ta	%xcc,	0x7
	movrlez	%l3,	0x385,	%i3
	tg	%icc,	0x7
	fornot2s	%f13,	%f6,	%f1
	udivx	%i7,	0x1FF0,	%g4
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x78] %asi,	%o5
	edge8l	%o7,	%i6,	%g6
	set	0x40, %o0
	ldxa	[%l7 + %o0] 0x19,	%l2
	fandnot2	%f16,	%f10,	%f10
	be,a,pt	%xcc,	loop_2101
	movvc	%icc,	%o6,	%l6
	umulcc	%g5,	%l5,	%g3
	tl	%icc,	0x5
loop_2101:
	taddcc	%i4,	0x0F9A,	%l4
	set	0x7E, %i2
	lduha	[%l7 + %i2] 0x11,	%o2
	tneg	%icc,	0x3
	tsubcc	%o1,	0x0B44,	%i5
	movgu	%xcc,	%o3,	%i1
	set	0x40, %l6
	stda	%f16,	[%l7 + %l6] 0x89
	fornot2s	%f13,	%f4,	%f27
	taddcc	%g7,	%i0,	%o0
	wr	%g0,	0x81,	%asi
	stba	%g2,	[%l7 + 0x64] %asi
	tcs	%icc,	0x3
	orcc	%o4,	0x1034,	%g1
	movrgez	%i2,	%l1,	%l0
	umul	%i3,	0x1997,	%l3
	fbne	%fcc1,	loop_2102
	edge8l	%g4,	%o5,	%i7
	fnegd	%f8,	%f30
	swap	[%l7 + 0x3C],	%o7
loop_2102:
	fandnot2	%f16,	%f14,	%f24
	tleu	%icc,	0x5
	subccc	%g6,	%i6,	%o6
	lduh	[%l7 + 0x7C],	%l2
	fsrc2s	%f7,	%f23
	srl	%l6,	0x12,	%l5
	fpadd32s	%f13,	%f0,	%f24
	nop
	fitod	%f8,	%f10
	fdtox	%f10,	%f8
	fxtod	%f8,	%f10
	nop
	setx	0xEE25FCA1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	fsqrts	%f19,	%f19
	fbul	%fcc2,	loop_2103
	fbule	%fcc2,	loop_2104
	fnegd	%f10,	%f2
	fbu,a	%fcc3,	loop_2105
loop_2103:
	orn	%g3,	0x1B4C,	%g5
loop_2104:
	alignaddrl	%l4,	%i4,	%o1
	movl	%icc,	%i5,	%o3
loop_2105:
	udivcc	%i1,	0x0075,	%o2
	movn	%icc,	%i0,	%g7
	fpsub32	%f14,	%f24,	%f18
	movge	%xcc,	%g2,	%o0
	sll	%o4,	%i2,	%l1
	nop
	setx	0x804CE1CA,	%l0,	%l6
	st	%l6,	[%l7 + 0x14]
	ld	[%l7 + 0x14],	%fsr
	tvs	%icc,	0x7
	movrlz	%g1,	%i3,	%l0
	nop
	setx	0x4CCFF8B3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	setx	0xA88911CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f31
	fdivs	%f31,	%f29,	%f16
	srlx	%g4,	0x1C,	%l3
	set	0x44, %o5
	stha	%i7,	[%l7 + %o5] 0x18
	srl	%o7,	0x19,	%g6
	andncc	%i6,	%o5,	%l2
	umulcc	%l6,	0x0300,	%l5
	te	%xcc,	0x7
	fpsub32	%f18,	%f20,	%f10
	tn	%xcc,	0x2
	edge32l	%o6,	%g5,	%l4
	umulcc	%i4,	0x14E8,	%g3
	tpos	%icc,	0x0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tpos	%xcc,	0x1
	movn	%icc,	%i5,	%o3
	movpos	%xcc,	%i1,	%o1
	array16	%i0,	%o2,	%g2
	xnor	%o0,	%g7,	%o4
	tcc	%xcc,	0x2
	array32	%l1,	%i2,	%i3
	movge	%icc,	%l0,	%g4
	taddcc	%l3,	0x0364,	%g1
	movl	%icc,	%o7,	%g6
	tle	%icc,	0x7
	mulx	%i7,	%o5,	%l2
	sdivx	%i6,	0x16CB,	%l6
	orn	%l5,	0x074F,	%o6
	udivx	%l4,	0x1051,	%i4
	xnorcc	%g5,	0x02C4,	%i5
	ble,pt	%icc,	loop_2106
	alignaddr	%o3,	%i1,	%o1
	movl	%xcc,	%i0,	%o2
	movneg	%icc,	%g2,	%o0
loop_2106:
	xor	%g3,	%o4,	%g7
	sll	%i2,	%i3,	%l0
	edge8l	%g4,	%l1,	%l3
	tg	%xcc,	0x6
	movpos	%icc,	%o7,	%g6
	srax	%g1,	0x08,	%o5
	sra	%i7,	0x00,	%l2
	move	%icc,	%l6,	%l5
	ldx	[%l7 + 0x70],	%i6
	wr	%g0,	0x22,	%asi
	stha	%l4,	[%l7 + 0x1C] %asi
	membar	#Sync
	fmovda	%xcc,	%f15,	%f25
	fmovdle	%xcc,	%f21,	%f13
	srl	%o6,	%i4,	%g5
	movre	%i5,	0x364,	%o3
	fbue,a	%fcc2,	loop_2107
	lduh	[%l7 + 0x2C],	%i1
	fandnot2s	%f6,	%f16,	%f23
	fcmpeq32	%f12,	%f30,	%o1
loop_2107:
	bne	%icc,	loop_2108
	edge16	%i0,	%g2,	%o2
	tleu	%xcc,	0x1
	edge32l	%o0,	%g3,	%o4
loop_2108:
	array16	%g7,	%i2,	%i3
	set	0x28, %i4
	prefetcha	[%l7 + %i4] 0x81,	 0x1
	fbl	%fcc3,	loop_2109
	nop
	setx	0x6068FE3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	alignaddr	%l1,	%l3,	%l0
	fbe	%fcc0,	loop_2110
loop_2109:
	mova	%xcc,	%g6,	%o7
	fbule	%fcc3,	loop_2111
	srlx	%g1,	%o5,	%l2
loop_2110:
	fmovdcs	%icc,	%f0,	%f11
	add	%l7,	0x70,	%l6
	wr	%g0,	0x80,	%asi
	casxa	[%l6] %asi,	%l6,	%i7
loop_2111:
	fnands	%f12,	%f22,	%f3
	sth	%l5,	[%l7 + 0x1A]
	be,a	%icc,	loop_2112
	sdiv	%l4,	0x11CA,	%o6
	fmovscs	%icc,	%f20,	%f5
	fmovrslez	%i6,	%f31,	%f31
loop_2112:
	umul	%g5,	%i4,	%i5
	fmovrdgez	%o3,	%f6,	%f16
	movrlz	%i1,	0x127,	%o1
	movcc	%icc,	%i0,	%g2
	membar	0x26
	andncc	%o2,	%g3,	%o4
	sra	%o0,	0x09,	%i2
	andncc	%g7,	%g4,	%i3
	pdist	%f10,	%f24,	%f14
	ld	[%l7 + 0x1C],	%f10
	sethi	0x14CC,	%l3
	move	%xcc,	%l1,	%g6
	fornot1	%f18,	%f24,	%f22
	fmovdl	%xcc,	%f9,	%f13
	fbule,a	%fcc2,	loop_2113
	smulcc	%l0,	%o7,	%g1
	movrne	%o5,	%l6,	%i7
	mova	%icc,	%l2,	%l4
loop_2113:
	tpos	%xcc,	0x1
	movre	%o6,	%l5,	%i6
	andncc	%g5,	%i4,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o3,	0x1085,	%i1
	add	%o1,	%g2,	%i0
	alignaddrl	%o2,	%g3,	%o0
	fpadd16s	%f0,	%f7,	%f24
	edge16ln	%o4,	%g7,	%g4
	sra	%i2,	%l3,	%i3
	bvc,a	loop_2114
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	membar	0x4C
	bg,a,pt	%xcc,	loop_2115
loop_2114:
	fbe,a	%fcc2,	loop_2116
	bl	loop_2117
	nop
	setx	0x1DC4101457AD6AF8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x2860454F2535D8FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fdivd	%f6,	%f22,	%f14
loop_2115:
	movre	%l1,	%g6,	%o7
loop_2116:
	movne	%icc,	%l0,	%o5
loop_2117:
	udiv	%l6,	0x003E,	%i7
	ta	%icc,	0x6
	nop
	setx	0xB045B3B1,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	fmovda	%icc,	%f7,	%f30
	bgu	%xcc,	loop_2118
	tsubcc	%l2,	0x0E17,	%l4
	brz,a	%g1,	loop_2119
	umul	%o6,	%i6,	%g5
loop_2118:
	andn	%l5,	%i5,	%o3
	movrgez	%i1,	0x0E5,	%i4
loop_2119:
	fnot2	%f12,	%f8
	array8	%g2,	%o1,	%i0
	fmovrslz	%o2,	%f8,	%f10
	or	%o0,	0x0C19,	%o4
	nop
	fitod	%f4,	%f6
	fdtoi	%f6,	%f17
	tcc	%xcc,	0x6
	umul	%g3,	0x01DA,	%g7
	move	%icc,	%g4,	%i2
	taddcc	%i3,	%l1,	%l3
	fmovs	%f13,	%f12
	taddcc	%o7,	0x0B5D,	%l0
	movcs	%icc,	%g6,	%l6
	fpsub32s	%f20,	%f9,	%f15
	set	0x50, %l1
	lduba	[%l7 + %l1] 0x04,	%o5
	ldsb	[%l7 + 0x13],	%i7
	nop
	setx	0x36626216,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f21
	edge32	%l4,	%l2,	%g1
	tpos	%xcc,	0x1
	movleu	%icc,	%o6,	%i6
	tsubcc	%g5,	%l5,	%i5
	sllx	%i1,	0x0E,	%i4
	edge32n	%o3,	%o1,	%i0
	tn	%icc,	0x4
	fzeros	%f6
	edge16	%o2,	%o0,	%o4
	lduw	[%l7 + 0x5C],	%g2
	bleu,pn	%xcc,	loop_2120
	sethi	0x173F,	%g7
	sllx	%g4,	%i2,	%i3
	fmovrsne	%l1,	%f24,	%f14
loop_2120:
	fbu,a	%fcc0,	loop_2121
	fsrc2	%f28,	%f24
	sll	%g3,	%o7,	%l3
	subcc	%l0,	%l6,	%o5
loop_2121:
	movg	%icc,	%i7,	%l4
	bcs,a,pn	%xcc,	loop_2122
	andn	%l2,	%g1,	%g6
	smul	%o6,	%i6,	%l5
	movg	%xcc,	%g5,	%i1
loop_2122:
	nop
	set	0x63, %g3
	ldsba	[%l7 + %g3] 0x80,	%i4
	orncc	%i5,	%o3,	%o1
	stb	%i0,	[%l7 + 0x39]
	tn	%xcc,	0x3
	udivcc	%o0,	0x0F09,	%o2
	fbg,a	%fcc0,	loop_2123
	addcc	%o4,	%g7,	%g2
	movvs	%icc,	%g4,	%i2
	flush	%l7 + 0x68
loop_2123:
	subcc	%i3,	%g3,	%o7
	ldsh	[%l7 + 0x1A],	%l1
	popc	%l0,	%l3
	sub	%o5,	0x19DF,	%l6
	or	%i7,	%l2,	%g1
	sll	%g6,	%o6,	%i6
	movre	%l5,	%l4,	%i1
	movpos	%icc,	%i4,	%i5
	xor	%o3,	0x0BE3,	%o1
	edge16l	%i0,	%g5,	%o2
	orncc	%o0,	0x10AC,	%g7
	fcmpgt32	%f10,	%f22,	%g2
	orcc	%g4,	%o4,	%i2
	sdiv	%g3,	0x1FDD,	%o7
	stx	%l1,	[%l7 + 0x70]
	fmovsleu	%xcc,	%f6,	%f16
	fmovrse	%i3,	%f2,	%f29
	movvs	%xcc,	%l3,	%l0
	fmovsne	%icc,	%f20,	%f19
	edge32ln	%l6,	%i7,	%o5
	edge8	%g1,	%l2,	%o6
	movrgz	%i6,	0x2CD,	%g6
	fble	%fcc3,	loop_2124
	movrne	%l4,	%i1,	%i4
	edge16n	%i5,	%l5,	%o3
	alignaddrl	%i0,	%g5,	%o1
loop_2124:
	nop
	set	0x22, %g7
	ldsba	[%l7 + %g7] 0x11,	%o2
	sllx	%o0,	0x1A,	%g2
	taddcctv	%g7,	%g4,	%o4
	movgu	%icc,	%g3,	%i2
	popc	%l1,	%o7
	fbe	%fcc1,	loop_2125
	movgu	%icc,	%i3,	%l0
	set	0x70, %o4
	ldxa	[%l7 + %o4] 0x80,	%l3
loop_2125:
	stb	%i7,	[%l7 + 0x29]
	bcs,a	%icc,	loop_2126
	taddcctv	%o5,	0x1301,	%g1
	ld	[%l7 + 0x54],	%f14
	udivcc	%l6,	0x0D7D,	%l2
loop_2126:
	movne	%icc,	%i6,	%o6
	fpadd16	%f2,	%f12,	%f22
	flush	%l7 + 0x48
	nop
	fitod	%f30,	%f18
	bg	%icc,	loop_2127
	tvc	%xcc,	0x6
	membar	0x15
	andncc	%g6,	%i1,	%l4
loop_2127:
	array8	%i4,	%i5,	%o3
	subc	%i0,	0x02E8,	%l5
	fmovsle	%icc,	%f20,	%f14
	ldstub	[%l7 + 0x2E],	%g5
	fmovsneg	%icc,	%f23,	%f14
	brz,a	%o1,	loop_2128
	fpackfix	%f14,	%f10
	xnor	%o0,	0x0C92,	%g2
	tvs	%icc,	0x4
loop_2128:
	fnot1s	%f28,	%f27
	fnot1	%f30,	%f28
	xnor	%o2,	%g4,	%g7
	fpsub16s	%f17,	%f13,	%f2
	udiv	%g3,	0x1FD3,	%o4
	fmovrdgez	%l1,	%f0,	%f28
	orn	%o7,	%i3,	%l0
	wr	%g0,	0x10,	%asi
	stha	%l3,	[%l7 + 0x52] %asi
	orncc	%i7,	%i2,	%o5
	set	0x40, %i0
	swapa	[%l7 + %i0] 0x89,	%l6
	tvs	%xcc,	0x4
	udiv	%g1,	0x18F9,	%i6
	tle	%icc,	0x3
	sll	%o6,	%g6,	%l2
	smul	%i1,	%i4,	%l4
	faligndata	%f16,	%f30,	%f4
	edge16l	%i5,	%i0,	%l5
	udivx	%o3,	0x07A5,	%g5
	edge16n	%o1,	%g2,	%o0
	smul	%g4,	%g7,	%g3
	bn,pn	%xcc,	loop_2129
	stw	%o4,	[%l7 + 0x48]
	movl	%xcc,	%o2,	%o7
	fmovde	%icc,	%f3,	%f15
loop_2129:
	stx	%l1,	[%l7 + 0x70]
	ble	%xcc,	loop_2130
	array8	%l0,	%i3,	%i7
	movle	%icc,	%i2,	%o5
	fpackfix	%f8,	%f9
loop_2130:
	udivcc	%l3,	0x1A86,	%g1
	tcs	%xcc,	0x3
	tg	%xcc,	0x0
	subc	%i6,	0x0D1B,	%o6
	brz	%g6,	loop_2131
	nop
	setx	0x08D27259A8EE6ED7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xB52D5675AAF08509,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fdivd	%f2,	%f4,	%f10
	fexpand	%f26,	%f18
	tvs	%icc,	0x7
loop_2131:
	movrlz	%l6,	0x2C5,	%l2
	movpos	%xcc,	%i1,	%i4
	popc	0x1EEF,	%i5
	tsubcctv	%i0,	%l4,	%l5
	srax	%o3,	%g5,	%g2
	set	0x48, %i6
	prefetcha	[%l7 + %i6] 0x0c,	 0x3
	tn	%xcc,	0x1
	nop
	fitos	%f0,	%f12
	fstod	%f12,	%f14
	be,a	%icc,	loop_2132
	sethi	0x0109,	%o0
	sdiv	%g7,	0x1CF4,	%g4
	call	loop_2133
loop_2132:
	orncc	%o4,	%g3,	%o7
	taddcc	%o2,	0x1003,	%l1
	array8	%i3,	%i7,	%i2
loop_2133:
	movg	%xcc,	%l0,	%o5
	xnor	%l3,	%g1,	%o6
	fmovsgu	%xcc,	%f13,	%f11
	xnor	%g6,	0x19A2,	%i6
	orncc	%l6,	0x10E2,	%l2
	te	%icc,	0x1
	set	0x24, %i7
	lduwa	[%l7 + %i7] 0x11,	%i1
	nop
	fitod	%f10,	%f18
	fdtox	%f18,	%f14
	fxtod	%f14,	%f6
	movpos	%xcc,	%i4,	%i5
	array32	%i0,	%l4,	%o3
	edge32n	%g5,	%l5,	%o1
	movvc	%icc,	%o0,	%g2
	set	0x2C, %g6
	stwa	%g7,	[%l7 + %g6] 0x22
	membar	#Sync
	fmovsleu	%icc,	%f30,	%f31
	mulx	%g4,	0x0F8B,	%g3
	udivx	%o4,	0x08A7,	%o2
	tsubcctv	%l1,	0x0710,	%o7
	sir	0x03CA
	udivx	%i3,	0x1DF9,	%i7
	movrgz	%i2,	0x065,	%o5
	xnorcc	%l3,	%g1,	%o6
	fblg,a	%fcc0,	loop_2134
	movcc	%icc,	%g6,	%i6
	tn	%icc,	0x0
	ldsb	[%l7 + 0x7C],	%l0
loop_2134:
	movg	%icc,	%l2,	%i1
	nop
	setx	loop_2135,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fmovsn	%xcc,	%f6,	%f3
	movvc	%xcc,	%i4,	%l6
	edge16	%i5,	%i0,	%l4
loop_2135:
	sdiv	%o3,	0x07E2,	%l5
	edge16	%o1,	%o0,	%g5
	xnorcc	%g7,	0x0FF6,	%g4
	move	%icc,	%g3,	%g2
	subc	%o4,	0x06E7,	%o2
	add	%l7,	0x50,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%o7,	%l1
	xorcc	%i7,	0x0164,	%i3
	bvs,a	%icc,	loop_2136
	alignaddr	%i2,	%l3,	%o5
	edge32	%g1,	%o6,	%g6
	mulscc	%i6,	0x1294,	%l0
loop_2136:
	fpadd16s	%f6,	%f13,	%f20
	add	%l7,	0x30,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%l2,	%i4
	set	0x46, %l2
	ldsba	[%l7 + %l2] 0x0c,	%l6
	fand	%f4,	%f28,	%f30
	movl	%icc,	%i1,	%i0
	set	0x40, %l5
	ldda	[%l7 + %l5] 0x10,	%f16
	andn	%l4,	0x16B8,	%i5
	tle	%icc,	0x0
	tcc	%xcc,	0x2
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x64] %asi,	%l5
	mulx	%o1,	0x15D1,	%o0
	bneg,pt	%xcc,	loop_2137
	tsubcc	%o3,	%g5,	%g7
	nop
	setx	loop_2138,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movgu	%xcc,	%g4,	%g3
loop_2137:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%o4
	casa	[%l6] %asi,	%o4,	%g2
loop_2138:
	tgu	%icc,	0x4
	taddcctv	%o7,	%o2,	%i7
	sdiv	%l1,	0x1878,	%i3
	sdiv	%l3,	0x043E,	%i2
	fblg	%fcc1,	loop_2139
	andcc	%g1,	0x0BB2,	%o5
	fmovsvs	%icc,	%f1,	%f11
	fmovrdlez	%g6,	%f12,	%f24
loop_2139:
	nop
	setx	loop_2140,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%icc,	%i6,	%o6
	te	%xcc,	0x2
	movrgez	%l0,	%l2,	%i4
loop_2140:
	udiv	%l6,	0x08A1,	%i0
	fsrc2	%f28,	%f20
	edge8l	%i1,	%i5,	%l4
	sdivx	%o1,	0x01D8,	%o0
	edge8l	%l5,	%o3,	%g5
	brgez	%g4,	loop_2141
	addccc	%g7,	0x075F,	%o4
	xor	%g3,	0x0F9E,	%g2
	popc	%o7,	%i7
loop_2141:
	sir	0x1991
	edge32ln	%l1,	%i3,	%l3
	addccc	%i2,	%o2,	%g1
	movge	%xcc,	%g6,	%i6
	fnegd	%f14,	%f14
	nop
	fitos	%f2,	%f19
	fstoi	%f19,	%f16
	fbo	%fcc1,	loop_2142
	fxors	%f21,	%f14,	%f24
	fabss	%f29,	%f9
	brlez,a	%o5,	loop_2143
loop_2142:
	fmovdgu	%xcc,	%f29,	%f13
	or	%o6,	%l0,	%l2
	movn	%xcc,	%i4,	%i0
loop_2143:
	fmovse	%xcc,	%f12,	%f15
	ta	%xcc,	0x4
	sth	%l6,	[%l7 + 0x3A]
	fmovrsgez	%i5,	%f9,	%f30
	lduh	[%l7 + 0x76],	%l4
	tge	%icc,	0x0
	orn	%i1,	0x17A0,	%o1
	nop
	set	0x18, %o1
	ldd	[%l7 + %o1],	%f28
	movre	%l5,	0x39B,	%o0
	umul	%o3,	%g4,	%g7
	subccc	%o4,	0x0E2D,	%g5
	sth	%g2,	[%l7 + 0x5A]
	edge16n	%o7,	%g3,	%l1
	sra	%i3,	%i7,	%l3
	tvc	%xcc,	0x1
	brnz	%i2,	loop_2144
	fmovdvc	%xcc,	%f0,	%f21
	movge	%xcc,	%o2,	%g6
	edge16l	%i6,	%o5,	%o6
loop_2144:
	srax	%g1,	0x0E,	%l0
	sll	%i4,	%i0,	%l2
	array32	%l6,	%l4,	%i1
	tleu	%icc,	0x1
	fpadd32	%f20,	%f16,	%f16
	sub	%o1,	0x0916,	%i5
	tvc	%icc,	0x1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l5,	%o0,	%g4
	udivx	%g7,	0x0222,	%o4
	udivcc	%g5,	0x097D,	%g2
	nop
	fitos	%f5,	%f22
	fstox	%f22,	%f20
	sllx	%o3,	%g3,	%l1
	brgz	%i3,	loop_2145
	movcs	%xcc,	%i7,	%o7
	movl	%icc,	%i2,	%l3
	fpsub16s	%f9,	%f27,	%f0
loop_2145:
	st	%f21,	[%l7 + 0x74]
	brz	%o2,	loop_2146
	udivx	%i6,	0x128E,	%o5
	addcc	%o6,	%g6,	%l0
	bvc	%xcc,	loop_2147
loop_2146:
	or	%g1,	0x1DCF,	%i0
	sub	%l2,	0x110C,	%i4
	bcs,pn	%icc,	loop_2148
loop_2147:
	movrne	%l4,	0x381,	%l6
	tvs	%xcc,	0x0
	fmovdvc	%icc,	%f29,	%f25
loop_2148:
	and	%o1,	0x05DE,	%i5
	flush	%l7 + 0x64
	tpos	%xcc,	0x5
	tg	%xcc,	0x1
	set	0x40, %i5
	sta	%f18,	[%l7 + %i5] 0x89
	edge8l	%i1,	%o0,	%l5
	movneg	%icc,	%g4,	%o4
	nop
	fitod	%f6,	%f26
	fdtoi	%f26,	%f5
	sll	%g7,	%g2,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f4,	%f21
	fstod	%f21,	%f14
	fnot2	%f4,	%f10
	movrgz	%o3,	%g3,	%i3
	fblg,a	%fcc1,	loop_2149
	st	%f23,	[%l7 + 0x3C]
	edge32l	%i7,	%l1,	%o7
	subcc	%l3,	0x0C63,	%i2
loop_2149:
	fsrc1s	%f0,	%f10
	fmovrsgez	%o2,	%f21,	%f23
	fandnot1	%f12,	%f30,	%f24
	edge32	%o5,	%o6,	%i6
	tsubcctv	%g6,	%g1,	%i0
	movrne	%l2,	%i4,	%l0
	subc	%l4,	%o1,	%l6
	tleu	%icc,	0x0
	fcmple16	%f4,	%f18,	%i5
	fmovdcc	%icc,	%f3,	%f4
	fmovsle	%xcc,	%f21,	%f28
	udivcc	%i1,	0x19AE,	%l5
	bshuffle	%f24,	%f12,	%f10
	fcmpne16	%f20,	%f4,	%o0
	array8	%o4,	%g4,	%g2
	fmovse	%icc,	%f29,	%f4
	umulcc	%g7,	%g5,	%o3
	fmovd	%f12,	%f14
	tl	%xcc,	0x7
	mova	%icc,	%g3,	%i7
	fmovsvc	%icc,	%f29,	%f26
	bvc,a	loop_2150
	edge8l	%l1,	%i3,	%l3
	andn	%o7,	0x1660,	%i2
	movrne	%o2,	0x07A,	%o5
loop_2150:
	movrlez	%o6,	0x16E,	%g6
	array8	%g1,	%i0,	%i6
	fmovd	%f4,	%f14
	fsrc2s	%f0,	%f30
	sra	%l2,	0x0A,	%l0
	fbl	%fcc2,	loop_2151
	sdiv	%i4,	0x1E1C,	%l4
	taddcctv	%o1,	%l6,	%i1
	fxor	%f0,	%f4,	%f6
loop_2151:
	edge16n	%l5,	%o0,	%i5
	bcs,a	%xcc,	loop_2152
	fmovrdgz	%o4,	%f26,	%f22
	tleu	%xcc,	0x3
	nop
	fitos	%f0,	%f21
	fstox	%f21,	%f2
loop_2152:
	popc	%g4,	%g2
	fbue,a	%fcc2,	loop_2153
	alignaddrl	%g5,	%o3,	%g3
	edge16n	%g7,	%i7,	%i3
	set	0x18, %g1
	stxa	%l1,	[%l7 + %g1] 0xe2
	membar	#Sync
loop_2153:
	fmovsg	%icc,	%f21,	%f31
	fxnors	%f3,	%f2,	%f15
	fbuge,a	%fcc0,	loop_2154
	fexpand	%f28,	%f14
	move	%icc,	%o7,	%l3
	nop
	fitos	%f4,	%f5
	fstox	%f5,	%f8
	fxtos	%f8,	%f20
loop_2154:
	fcmple32	%f24,	%f4,	%o2
	edge8n	%i2,	%o6,	%o5
	sdiv	%g6,	0x03BB,	%g1
	flush	%l7 + 0x34
	fbug	%fcc0,	loop_2155
	fba,a	%fcc3,	loop_2156
	stbar
	ld	[%l7 + 0x4C],	%f7
loop_2155:
	fmuld8sux16	%f31,	%f6,	%f2
loop_2156:
	nop
	set	0x54, %o2
	stwa	%i0,	[%l7 + %o2] 0xe2
	membar	#Sync
	orncc	%i6,	%l2,	%i4
	taddcc	%l4,	%o1,	%l0
	set	0x54, %i3
	stwa	%i1,	[%l7 + %i3] 0x2f
	membar	#Sync
	movl	%xcc,	%l6,	%l5
	set	0x7C, %o6
	ldsha	[%l7 + %o6] 0x80,	%o0
	fbl,a	%fcc0,	loop_2157
	xor	%i5,	%o4,	%g4
	tsubcctv	%g5,	%g2,	%o3
	fbg	%fcc3,	loop_2158
loop_2157:
	tcc	%xcc,	0x2
	move	%icc,	%g3,	%i7
	umul	%g7,	0x0F85,	%l1
loop_2158:
	sdivcc	%i3,	0x1540,	%o7
	bgu,pt	%icc,	loop_2159
	fones	%f18
	orn	%l3,	%i2,	%o2
	pdist	%f30,	%f30,	%f10
loop_2159:
	sdiv	%o6,	0x0876,	%o5
	nop
	fitod	%f10,	%f0
	fdtos	%f0,	%f25
	tvs	%icc,	0x5
	movle	%icc,	%g1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i6,	%l2,	%i4
	fmovrsne	%g6,	%f21,	%f3
	andncc	%l4,	%l0,	%o1
	sdiv	%i1,	0x05A6,	%l5
	fandnot1s	%f20,	%f6,	%f5
	movge	%xcc,	%o0,	%i5
	nop
	setx	0x29F9A156305AF462,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l6,	%o4,	%g5
	taddcc	%g2,	%g4,	%g3
	movcc	%icc,	%o3,	%i7
	orncc	%g7,	%l1,	%o7
	movg	%xcc,	%l3,	%i2
	popc	%i3,	%o6
	bneg,a,pt	%icc,	loop_2160
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o5,	%o2
	orcc	%i0,	0x1D21,	%g1
loop_2160:
	fmovdvc	%xcc,	%f17,	%f28
	movg	%xcc,	%i6,	%l2
	movg	%xcc,	%g6,	%l4
	edge16	%l0,	%o1,	%i4
	fand	%f28,	%f4,	%f0
	tle	%xcc,	0x1
	tn	%xcc,	0x6
	orn	%i1,	0x09F7,	%o0
	fsrc2s	%f19,	%f8
	fmovs	%f9,	%f7
	set	0x38, %l4
	prefetcha	[%l7 + %l4] 0x19,	 0x0
	fbu	%fcc3,	loop_2161
	st	%f11,	[%l7 + 0x58]
	ba	%xcc,	loop_2162
	array8	%l6,	%o4,	%g5
loop_2161:
	edge16	%l5,	%g4,	%g2
	sir	0x0748
loop_2162:
	fbg	%fcc0,	loop_2163
	nop
	set	0x58, %g2
	sth	%g3,	[%l7 + %g2]
	movvc	%icc,	%i7,	%g7
	movrgz	%o3,	0x10C,	%o7
loop_2163:
	brnz,a	%l1,	loop_2164
	movge	%xcc,	%l3,	%i3
	edge8ln	%o6,	%i2,	%o2
	taddcctv	%i0,	0x0FFC,	%o5
loop_2164:
	subccc	%g1,	%l2,	%g6
	fmovscc	%xcc,	%f27,	%f16
	subc	%l4,	0x05F1,	%l0
	tgu	%icc,	0x3
	addcc	%o1,	0x0292,	%i4
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x110] %asi,	%i1
	fmovrdgez	%o0,	%f12,	%f20
	nop
	setx	loop_2165,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srl	%i5,	0x08,	%i6
	tg	%xcc,	0x6
	sdiv	%l6,	0x1D41,	%o4
loop_2165:
	sub	%g5,	0x0F92,	%l5
	sra	%g4,	0x12,	%g2
	bcc	loop_2166
	nop
	setx	0x26E9168A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f2
	setx	0xD5FDB3C2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fadds	%f22,	%f2,	%f21
	andncc	%i7,	%g7,	%g3
	fnor	%f0,	%f24,	%f4
loop_2166:
	sub	%o3,	%o7,	%l1
	popc	0x062E,	%l3
	andncc	%o6,	%i2,	%i3
	addcc	%i0,	0x17C2,	%o2
	addc	%o5,	%g1,	%l2
	fandnot1	%f16,	%f10,	%f20
	set	0x40, %i1
	ldda	[%l7 + %i1] 0x0c,	%f0
	edge16	%g6,	%l4,	%l0
	movrlez	%o1,	%i4,	%i1
	subcc	%o0,	0x03F5,	%i6
	edge16n	%i5,	%o4,	%l6
	movrgz	%g5,	0x2A2,	%l5
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%g2
	movre	%g4,	%g7,	%g3
	fbn	%fcc0,	loop_2167
	udivcc	%i7,	0x0BB1,	%o3
	wr	%g0,	0x11,	%asi
	ldswa	[%l7 + 0x58] %asi,	%l1
loop_2167:
	ble,a,pt	%xcc,	loop_2168
	bn,a	%icc,	loop_2169
	edge16	%l3,	%o6,	%o7
	edge32n	%i2,	%i0,	%i3
loop_2168:
	nop
	wr	%g0,	0x2b,	%asi
	stxa	%o2,	[%l7 + 0x10] %asi
	membar	#Sync
loop_2169:
	move	%icc,	%o5,	%g1
	udiv	%l2,	0x072D,	%g6
	sra	%l4,	0x1A,	%o1
	movvc	%icc,	%l0,	%i1
	nop
	setx loop_2170, %l0, %l1
	jmpl %l1, %i4
	fabsd	%f8,	%f8
	bn,a	%xcc,	loop_2171
	bvc	loop_2172
loop_2170:
	flush	%l7 + 0x7C
	smulcc	%i6,	0x09A7,	%o0
loop_2171:
	sdiv	%o4,	0x074C,	%l6
loop_2172:
	nop
	set	0x64, %o3
	stwa	%i5,	[%l7 + %o3] 0x11
	movrne	%g5,	0x368,	%l5
	wr	%g0,	0x22,	%asi
	stba	%g4,	[%l7 + 0x5D] %asi
	membar	#Sync
	udivx	%g7,	0x063D,	%g2
	edge32l	%g3,	%o3,	%l1
	sth	%l3,	[%l7 + 0x76]
	be,a	%xcc,	loop_2173
	srlx	%i7,	%o7,	%o6
	ldx	[%l7 + 0x58],	%i0
	nop
	fitos	%f4,	%f23
	fstox	%f23,	%f22
	fxtos	%f22,	%f27
loop_2173:
	brgez,a	%i2,	loop_2174
	tcc	%xcc,	0x4
	orncc	%o2,	%i3,	%o5
	edge32n	%l2,	%g6,	%g1
loop_2174:
	movn	%xcc,	%l4,	%l0
	set	0x7C, %g5
	stwa	%o1,	[%l7 + %g5] 0x89
	brnz	%i4,	loop_2175
	sdivx	%i6,	0x0BBF,	%o0
	edge32n	%i1,	%l6,	%i5
	movne	%icc,	%g5,	%l5
loop_2175:
	and	%o4,	0x1EBF,	%g7
	brlz,a	%g4,	loop_2176
	fmovdvs	%xcc,	%f28,	%f10
	fnot1	%f10,	%f6
	fornot2	%f20,	%f28,	%f2
loop_2176:
	nop
	setx	0x88935AF5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x38E56AD9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f26,	%f29
	movge	%xcc,	%g3,	%o3
	tne	%icc,	0x0
	brz	%g2,	loop_2177
	fmovsge	%xcc,	%f26,	%f29
	fornot2s	%f4,	%f8,	%f1
	fmovdcc	%icc,	%f19,	%f21
loop_2177:
	andcc	%l3,	%l1,	%i7
	fpack32	%f18,	%f12,	%f16
	fmul8x16au	%f24,	%f20,	%f14
	fcmpne32	%f26,	%f20,	%o7
	bcc	loop_2178
	and	%i0,	%i2,	%o6
	nop
	set	0x0F, %g4
	ldsb	[%l7 + %g4],	%i3
	alignaddr	%o5,	%o2,	%l2
loop_2178:
	nop
	add	%l7,	0x20,	%l6
	wr	%g0,	0x0c,	%asi
	casxa	[%l6] %asi,	%g1,	%l4
	fexpand	%f1,	%f28
	movrgez	%l0,	%o1,	%g6
	bpos,a,pn	%icc,	loop_2179
	andn	%i4,	%i6,	%i1
	sra	%o0,	0x0A,	%i5
	bg,pn	%icc,	loop_2180
loop_2179:
	mova	%xcc,	%l6,	%g5
	brlz,a	%l5,	loop_2181
	tl	%icc,	0x3
loop_2180:
	array16	%g7,	%o4,	%g3
	xnor	%o3,	0x1EA8,	%g2
loop_2181:
	edge16n	%l3,	%l1,	%g4
	fmovsge	%xcc,	%f2,	%f1
	addccc	%i7,	0x0BCB,	%i0
	umul	%o7,	0x08CD,	%o6
	bg,a,pt	%xcc,	loop_2182
	ba,a,pn	%xcc,	loop_2183
	fbue,a	%fcc2,	loop_2184
	tsubcctv	%i2,	%i3,	%o5
loop_2182:
	edge16ln	%l2,	%o2,	%l4
loop_2183:
	smul	%l0,	0x0B0C,	%g1
loop_2184:
	nop
	set	0x4E, %l3
	stha	%o1,	[%l7 + %l3] 0x18
	fpadd32s	%f30,	%f12,	%f2
	popc	%i4,	%g6
	ba	loop_2185
	bleu,a	%xcc,	loop_2186
	tcc	%xcc,	0x1
	movl	%xcc,	%i1,	%i6
loop_2185:
	sra	%i5,	0x15,	%l6
loop_2186:
	umul	%g5,	%o0,	%l5
	taddcctv	%g7,	%o4,	%g3
	array8	%o3,	%l3,	%l1
	smulcc	%g2,	%g4,	%i0
	udiv	%o7,	0x0DEF,	%i7
	lduw	[%l7 + 0x4C],	%i2
	movleu	%icc,	%i3,	%o6
	tneg	%icc,	0x4
	be,a,pt	%xcc,	loop_2187
	faligndata	%f28,	%f8,	%f6
	tleu	%xcc,	0x0
	te	%xcc,	0x7
loop_2187:
	bl,pt	%icc,	loop_2188
	edge8n	%o5,	%l2,	%l4
	movvc	%icc,	%l0,	%g1
	movl	%icc,	%o2,	%i4
loop_2188:
	fcmpeq32	%f26,	%f30,	%g6
	te	%xcc,	0x7
	movrlez	%o1,	0x2C2,	%i1
	movrgz	%i6,	0x29A,	%l6
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x27] %asi,	%g5
	orncc	%i5,	%o0,	%l5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbule,a	%fcc2,	loop_2189
	sll	%g7,	%o4,	%o3
	nop
	fitod	%f12,	%f20
	fdtos	%f20,	%f27
	edge32ln	%l3,	%g3,	%l1
loop_2189:
	fors	%f20,	%f6,	%f29
	addcc	%g2,	0x05E0,	%g4
	fcmpne32	%f20,	%f4,	%i0
	movvs	%icc,	%o7,	%i7
	fmul8sux16	%f8,	%f24,	%f20
	edge32l	%i2,	%i3,	%o6
	nop
	fitos	%f8,	%f15
	fstox	%f15,	%f26
	fxtos	%f26,	%f9
	call	loop_2190
	fands	%f10,	%f30,	%f19
	edge16ln	%o5,	%l4,	%l2
	movcs	%xcc,	%l0,	%g1
loop_2190:
	ba,a	loop_2191
	movg	%icc,	%i4,	%g6
	tvc	%icc,	0x4
	movcc	%icc,	%o2,	%i1
loop_2191:
	brlz	%i6,	loop_2192
	smul	%o1,	%l6,	%g5
	orncc	%o0,	0x0995,	%l5
	edge8n	%i5,	%o4,	%o3
loop_2192:
	movrlz	%g7,	%l3,	%g3
	fors	%f5,	%f8,	%f10
	ldsh	[%l7 + 0x08],	%g2
	orncc	%l1,	0x1F1E,	%g4
	bpos,a	%icc,	loop_2193
	lduw	[%l7 + 0x30],	%i0
	ldx	[%l7 + 0x38],	%i7
	movcs	%icc,	%i2,	%o7
loop_2193:
	movrlz	%o6,	%i3,	%o5
	and	%l2,	0x02AA,	%l0
	movneg	%icc,	%g1,	%l4
	xorcc	%i4,	%g6,	%o2
	wr	%g0,	0x23,	%asi
	stha	%i6,	[%l7 + 0x60] %asi
	membar	#Sync
	bcs,a,pt	%xcc,	loop_2194
	edge8	%i1,	%l6,	%o1
	fmul8x16au	%f19,	%f22,	%f28
	tle	%icc,	0x1
loop_2194:
	srlx	%g5,	0x00,	%l5
	fpsub32	%f30,	%f24,	%f6
	lduw	[%l7 + 0x34],	%o0
	xor	%i5,	0x1A6E,	%o4
	edge8n	%o3,	%g7,	%l3
	tsubcctv	%g2,	0x047D,	%g3
	flush	%l7 + 0x08
	fmovrdlz	%l1,	%f24,	%f22
	bge,a	loop_2195
	fbul,a	%fcc2,	loop_2196
	udivx	%i0,	0x0DC1,	%g4
	fxors	%f7,	%f26,	%f25
loop_2195:
	fmovsgu	%xcc,	%f13,	%f17
loop_2196:
	brgz	%i7,	loop_2197
	ta	%xcc,	0x0
	taddcc	%i2,	%o6,	%o7
	fbg,a	%fcc0,	loop_2198
loop_2197:
	tcc	%xcc,	0x2
	wr	%g0,	0x0c,	%asi
	ldsba	[%l7 + 0x3F] %asi,	%i3
loop_2198:
	edge16	%o5,	%l0,	%l2
	alignaddrl	%l4,	%i4,	%g1
	ble,a,pt	%xcc,	loop_2199
	movne	%icc,	%g6,	%o2
	mova	%xcc,	%i6,	%i1
	edge16ln	%o1,	%g5,	%l5
loop_2199:
	sll	%l6,	%i5,	%o0
	prefetch	[%l7 + 0x6C],	 0x2
	stx	%o3,	[%l7 + 0x10]
	edge32l	%g7,	%l3,	%g2
	stb	%g3,	[%l7 + 0x63]
	sllx	%o4,	%i0,	%g4
	mulx	%l1,	0x12CB,	%i7
	nop
	fitod	%f12,	%f16
	fdtox	%f16,	%f20
	umulcc	%i2,	%o6,	%i3
	bne	%xcc,	loop_2200
	bcc,a	loop_2201
	array32	%o7,	%l0,	%l2
	movpos	%icc,	%o5,	%l4
loop_2200:
	brnz	%i4,	loop_2202
loop_2201:
	movne	%icc,	%g6,	%g1
	tcs	%xcc,	0x0
	fands	%f10,	%f20,	%f3
loop_2202:
	movleu	%icc,	%o2,	%i1
	umul	%i6,	%g5,	%o1
	tgu	%icc,	0x7
	umul	%l6,	%l5,	%o0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i5,	%g7,	%o3
	fexpand	%f28,	%f14
	movvc	%icc,	%l3,	%g2
	tpos	%xcc,	0x5
	fmovrdgz	%o4,	%f12,	%f22
	sir	0x1751
	or	%i0,	0x1DF9,	%g3
	umul	%l1,	0x1230,	%g4
	tleu	%xcc,	0x3
	sllx	%i7,	0x16,	%o6
	tge	%xcc,	0x2
	edge32	%i3,	%o7,	%i2
	fmovrsne	%l0,	%f10,	%f19
	nop
	setx	0xD6B1A7C46CFEDB13,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	setx	0xA2C1954EE23DB452,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f0
	fsubd	%f0,	%f6,	%f12
	edge32n	%o5,	%l2,	%l4
	wr	%g0,	0x18,	%asi
	lduba	[%l7 + 0x12] %asi,	%i4
	set	0x40, %l0
	stda	%f0,	[%l7 + %l0] 0x88
	stbar
	wr	%g0,	0x19,	%asi
	ldxa	[%l7 + 0x48] %asi,	%g1
	fpack16	%f14,	%f11
	edge16n	%g6,	%o2,	%i1
	fandnot1s	%f31,	%f7,	%f19
	wr	%g0,	0x11,	%asi
	lduba	[%l7 + 0x42] %asi,	%i6
	edge8	%o1,	%g5,	%l6
	for	%f14,	%f26,	%f24
	fcmpeq32	%f8,	%f28,	%l5
	tvs	%icc,	0x3
	movcs	%icc,	%o0,	%g7
	edge8	%o3,	%l3,	%i5
	sdiv	%o4,	0x142F,	%g2
	fxnors	%f18,	%f28,	%f27
	bcc,a,pt	%icc,	loop_2203
	edge32	%g3,	%i0,	%g4
	tn	%icc,	0x0
	edge8l	%i7,	%l1,	%i3
loop_2203:
	fmovscs	%icc,	%f23,	%f22
	array32	%o7,	%i2,	%o6
	nop
	setx	0x413EED04007F1E4E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x20]
	ldx	[%l7 + 0x20],	%fsr
	fsrc1	%f10,	%f10
	sll	%l0,	%l2,	%l4
	umul	%i4,	%g1,	%g6
	tvc	%xcc,	0x0
	fmul8x16au	%f13,	%f16,	%f30
	add	%l7,	0x68,	%l6
	wr	%g0,	0x19,	%asi
	casxa	[%l6] %asi,	%o5,	%i1
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x75] %asi,	%o2
	udivcc	%i6,	0x19D0,	%o1
	addcc	%l6,	%l5,	%g5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o0
	casa	[%l6] 0x80,	%o0,	%o3
	fcmpne32	%f4,	%f20,	%g7
	orcc	%i5,	0x0CBA,	%l3
	taddcctv	%g2,	%o4,	%g3
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%f14
	fmul8sux16	%f4,	%f2,	%f0
	fba,a	%fcc3,	loop_2204
	mulx	%i0,	0x1F0C,	%g4
	movg	%xcc,	%l1,	%i3
	stbar
loop_2204:
	tn	%xcc,	0x2
	set	0x2C, %o0
	lda	[%l7 + %o0] 0x88,	%f29
	orncc	%o7,	%i7,	%i2
	fbg	%fcc1,	loop_2205
	mulx	%o6,	0x06E2,	%l0
	sir	0x1472
	udivcc	%l2,	0x07B0,	%i4
loop_2205:
	brnz	%g1,	loop_2206
	edge32ln	%g6,	%o5,	%l4
	nop
	setx	0x8CEA6C454805474B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0xB79C0CC6DFE67767,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f20
	fmuld	%f20,	%f22,	%f2
	fmovrdlez	%i1,	%f18,	%f4
loop_2206:
	fors	%f5,	%f28,	%f13
	bn,pn	%xcc,	loop_2207
	stw	%i6,	[%l7 + 0x6C]
	movrlz	%o2,	0x1DB,	%o1
	andcc	%l5,	%g5,	%l6
loop_2207:
	fnot2	%f30,	%f16
	addc	%o3,	0x06D4,	%g7
	movrgz	%o0,	0x171,	%l3
	movleu	%xcc,	%i5,	%g2
	sub	%g3,	%o4,	%g4
	tvc	%xcc,	0x5
	xor	%l1,	%i0,	%i3
	set	0x78, %l6
	stha	%o7,	[%l7 + %l6] 0x27
	membar	#Sync
	tvs	%xcc,	0x4
	subcc	%i7,	0x037F,	%i2
	movgu	%icc,	%o6,	%l0
	tgu	%xcc,	0x7
	fmovdcs	%icc,	%f31,	%f6
	tne	%icc,	0x1
	sdivx	%l2,	0x173C,	%i4
	edge32	%g1,	%g6,	%o5
	brgz	%l4,	loop_2208
	popc	%i6,	%i1
	fmovdl	%icc,	%f11,	%f28
	fpackfix	%f10,	%f11
loop_2208:
	movrlez	%o1,	%l5,	%o2
	edge8ln	%l6,	%o3,	%g7
	ldsh	[%l7 + 0x56],	%g5
	edge16	%o0,	%i5,	%l3
	xnor	%g3,	0x1581,	%g2
	nop
	fitos	%f9,	%f29
	fstox	%f29,	%f30
	fxtos	%f30,	%f7
	wr	%g0,	0x80,	%asi
	ldda	[%l7 + 0x10] %asi,	%o4
	edge8l	%g4,	%l1,	%i3
	tl	%xcc,	0x2
	sdivcc	%o7,	0x1DD5,	%i0
	tn	%xcc,	0x0
	fcmple16	%f10,	%f6,	%i2
	movrgz	%o6,	0x18A,	%i7
	mulx	%l2,	0x108F,	%i4
	fmovdpos	%xcc,	%f13,	%f9
	sra	%g1,	%l0,	%g6
	array16	%l4,	%o5,	%i1
	subcc	%i6,	0x0558,	%l5
	ldstub	[%l7 + 0x0B],	%o2
	edge8ln	%l6,	%o3,	%o1
	movg	%xcc,	%g7,	%o0
	move	%icc,	%i5,	%l3
	tl	%icc,	0x3
	move	%icc,	%g3,	%g2
	tvc	%icc,	0x4
	fbg,a	%fcc2,	loop_2209
	xnorcc	%g5,	0x0F3E,	%o4
	andn	%l1,	0x1EC4,	%i3
	mulx	%o7,	%i0,	%i2
loop_2209:
	udivcc	%g4,	0x0F51,	%i7
	srax	%o6,	%l2,	%g1
	fabsd	%f18,	%f16
	bne,pn	%icc,	loop_2210
	ldstub	[%l7 + 0x40],	%l0
	bl,pn	%icc,	loop_2211
	nop
	fitos	%f13,	%f7
	fstoi	%f7,	%f16
loop_2210:
	andncc	%g6,	%l4,	%o5
	nop
	fitos	%f1,	%f10
	fstod	%f10,	%f16
loop_2211:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i1,	0x1EA2,	%i6
	bcs,a,pn	%icc,	loop_2212
	umul	%i4,	0x0927,	%o2
	movne	%icc,	%l6,	%l5
	orncc	%o1,	0x068B,	%o3
loop_2212:
	taddcc	%g7,	%i5,	%l3
	fcmpeq32	%f18,	%f0,	%g3
	fones	%f26
	movrgz	%g2,	0x077,	%g5
	mova	%xcc,	%o4,	%l1
	fbn,a	%fcc1,	loop_2213
	fpsub16s	%f11,	%f28,	%f15
	edge16n	%o0,	%o7,	%i0
	fba,a	%fcc3,	loop_2214
loop_2213:
	fmovrsne	%i3,	%f29,	%f22
	edge16	%i2,	%g4,	%o6
	movg	%icc,	%i7,	%g1
loop_2214:
	sub	%l0,	%l2,	%g6
	fxors	%f18,	%f23,	%f30
	bgu,pn	%icc,	loop_2215
	fmul8x16al	%f28,	%f10,	%f10
	andcc	%l4,	%i1,	%o5
	andn	%i4,	%o2,	%l6
loop_2215:
	nop
	fitod	%f14,	%f18
	subccc	%l5,	0x029E,	%i6
	popc	0x12CB,	%o3
	orncc	%g7,	0x0404,	%i5
	stw	%o1,	[%l7 + 0x54]
	fba,a	%fcc3,	loop_2216
	fmovrdgz	%g3,	%f22,	%f30
	set	0x3C, %i2
	ldstuba	[%l7 + %i2] 0x80,	%l3
loop_2216:
	nop
	add	%l7,	0x54,	%l6
	wr	%g0,	0x19,	%asi
	casa	[%l6] 0x19,	%g5,	%o4
	nop
	fitod	%f8,	%f16
	fdtos	%f16,	%f26
	fandnot1	%f18,	%f4,	%f8
	sir	0x00D1
	fmovscc	%xcc,	%f19,	%f16
	fbu	%fcc0,	loop_2217
	udivcc	%l1,	0x02DD,	%g2
	addc	%o0,	0x16B0,	%i0
	array16	%o7,	%i2,	%i3
loop_2217:
	fbge	%fcc1,	loop_2218
	fandnot2s	%f28,	%f30,	%f4
	xorcc	%o6,	%g4,	%i7
	mulx	%g1,	0x04BC,	%l0
loop_2218:
	udivx	%g6,	0x190D,	%l4
	movpos	%xcc,	%l2,	%i1
	bge	%icc,	loop_2219
	edge32l	%o5,	%i4,	%l6
	stb	%l5,	[%l7 + 0x59]
	brlez,a	%i6,	loop_2220
loop_2219:
	fbg	%fcc2,	loop_2221
	fmovrdgz	%o3,	%f22,	%f16
	ba,pn	%icc,	loop_2222
loop_2220:
	fmovrslez	%o2,	%f0,	%f27
loop_2221:
	array32	%g7,	%i5,	%g3
	umulcc	%l3,	%o1,	%g5
loop_2222:
	stbar
	movl	%xcc,	%l1,	%o4
	fmovrsgz	%g2,	%f21,	%f15
	fba,a	%fcc2,	loop_2223
	nop
	fitod	%f12,	%f0
	fdtox	%f0,	%f2
	fmovdvc	%icc,	%f28,	%f24
	nop
	setx	loop_2224,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
loop_2223:
	fxnor	%f4,	%f10,	%f30
	movl	%icc,	%o0,	%i0
	sll	%i2,	%o7,	%o6
loop_2224:
	movrgz	%g4,	%i3,	%i7
	alignaddrl	%l0,	%g1,	%l4
	nop
	setx	0x229812B7,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0x8875815E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f22
	fsubs	%f22,	%f20,	%f13
	edge32	%l2,	%g6,	%i1
	mova	%icc,	%o5,	%i4
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f10
	fxtod	%f10,	%f4
	membar	0x1A
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x5C] %asi,	%l5
	flush	%l7 + 0x34
	tsubcctv	%i6,	0x1B4A,	%o3
	set	0x1D, %o5
	ldstuba	[%l7 + %o5] 0x80,	%l6
	tl	%icc,	0x4
	edge32l	%o2,	%g7,	%g3
	bcc,a,pn	%xcc,	loop_2225
	move	%xcc,	%l3,	%o1
	tge	%xcc,	0x4
	fbu	%fcc1,	loop_2226
loop_2225:
	fmovsvs	%xcc,	%f30,	%f30
	edge32l	%i5,	%g5,	%l1
	nop
	setx loop_2227, %l0, %l1
	jmpl %l1, %o4
loop_2226:
	tge	%icc,	0x0
	sra	%g2,	0x07,	%i0
	srlx	%i2,	0x15,	%o7
loop_2227:
	te	%icc,	0x0
	fbo,a	%fcc2,	loop_2228
	fnot2s	%f5,	%f17
	fbule,a	%fcc0,	loop_2229
	te	%xcc,	0x1
loop_2228:
	tne	%xcc,	0x3
	tg	%icc,	0x1
loop_2229:
	add	%o0,	0x1B6C,	%o6
	array8	%g4,	%i3,	%l0
	tvs	%icc,	0x6
	fpsub16	%f6,	%f14,	%f8
	wr	%g0,	0x0c,	%asi
	stwa	%g1,	[%l7 + 0x24] %asi
	fpsub32	%f20,	%f10,	%f16
	tneg	%xcc,	0x4
	movvc	%xcc,	%i7,	%l2
	tne	%xcc,	0x4
	fmovrdlz	%g6,	%f30,	%f20
	wr	%g0,	0x10,	%asi
	stxa	%l4,	[%l7 + 0x18] %asi
	orcc	%i1,	%o5,	%l5
	fbu	%fcc1,	loop_2230
	bl,pt	%xcc,	loop_2231
	array8	%i4,	%o3,	%l6
	edge8ln	%o2,	%i6,	%g3
loop_2230:
	movrne	%g7,	%l3,	%i5
loop_2231:
	tsubcc	%g5,	0x17A6,	%l1
	andcc	%o1,	0x17F0,	%o4
	mulscc	%i0,	0x0C81,	%i2
	bgu	%xcc,	loop_2232
	xorcc	%o7,	0x16CF,	%g2
	fnot1s	%f11,	%f13
	fmovscs	%icc,	%f31,	%f6
loop_2232:
	xor	%o0,	0x0D59,	%g4
	ldx	[%l7 + 0x40],	%i3
	bl,a,pn	%xcc,	loop_2233
	brlez	%l0,	loop_2234
	bge,a	%xcc,	loop_2235
	edge32n	%o6,	%g1,	%l2
loop_2233:
	srax	%i7,	0x08,	%l4
loop_2234:
	nop
	setx	0xE4B58D48,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0xB91D6FC9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fsubs	%f11,	%f12,	%f9
loop_2235:
	tleu	%xcc,	0x2
	tneg	%icc,	0x7
	stb	%i1,	[%l7 + 0x6E]
	fbue,a	%fcc0,	loop_2236
	tne	%icc,	0x2
	lduh	[%l7 + 0x32],	%g6
	fnot2s	%f4,	%f14
loop_2236:
	ldx	[%l7 + 0x48],	%l5
	bneg,pt	%xcc,	loop_2237
	smul	%o5,	%o3,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f12,	%f6,	%l6
loop_2237:
	fornot2s	%f0,	%f27,	%f12
	udivcc	%o2,	0x12C9,	%i6
	nop
	setx	0xD87968C700748539,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	tsubcc	%g3,	%l3,	%i5
	tpos	%xcc,	0x0
	tle	%xcc,	0x7
	fmovdcc	%icc,	%f17,	%f13
	fpadd16	%f2,	%f12,	%f12
	ldx	[%l7 + 0x08],	%g7
	brgz	%l1,	loop_2238
	nop
	fitos	%f12,	%f28
	fstod	%f28,	%f0
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x4E] %asi,	%o1
loop_2238:
	and	%o4,	0x1E2D,	%g5
	stx	%i2,	[%l7 + 0x28]
	tle	%xcc,	0x7
	tcs	%icc,	0x5
	mulx	%i0,	%o7,	%g2
	edge32ln	%g4,	%o0,	%l0
	nop
	setx	0x535BBB5B6E666F9D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0x278D09974BBF4C70,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f30
	fmuld	%f30,	%f18,	%f4
	srlx	%i3,	%o6,	%g1
	andcc	%i7,	%l2,	%i1
	nop
	setx	0x169212914C4B2B91,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x35F24F9AE213AEAB,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	faddd	%f22,	%f14,	%f18
	or	%g6,	%l5,	%l4
	brgez,a	%o3,	loop_2239
	fpack16	%f12,	%f10
	orcc	%o5,	0x0CD4,	%i4
	edge16ln	%l6,	%o2,	%i6
loop_2239:
	tg	%xcc,	0x6
	edge16	%l3,	%g3,	%g7
	set	0x44, %i4
	lduwa	[%l7 + %i4] 0x89,	%l1
	movneg	%icc,	%i5,	%o4
	fmovsa	%xcc,	%f22,	%f18
	st	%f11,	[%l7 + 0x14]
	fmovdge	%xcc,	%f0,	%f6
	sethi	0x1492,	%o1
	subc	%i2,	0x0E0F,	%i0
	fsrc2	%f10,	%f20
	bneg	loop_2240
	movrlz	%g5,	%o7,	%g4
	bne,a,pt	%xcc,	loop_2241
	srl	%o0,	%g2,	%l0
loop_2240:
	sdivx	%i3,	0x042D,	%g1
	umul	%o6,	%l2,	%i7
loop_2241:
	nop
	setx	0xE8318C663F6E725D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0xE8682108E9D0E4CD,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	faddd	%f2,	%f12,	%f12
	bl,pt	%icc,	loop_2242
	fmul8ulx16	%f16,	%f30,	%f2
	tsubcc	%i1,	0x0EDE,	%l5
	sth	%g6,	[%l7 + 0x1A]
loop_2242:
	ldd	[%l7 + 0x68],	%l4
	fpadd16	%f16,	%f30,	%f30
	movne	%icc,	%o3,	%o5
	edge16n	%l6,	%o2,	%i4
	fpsub32s	%f24,	%f30,	%f13
	bl,a	loop_2243
	bn,a,pn	%xcc,	loop_2244
	alignaddr	%i6,	%l3,	%g7
	sra	%l1,	%g3,	%i5
loop_2243:
	ld	[%l7 + 0x1C],	%f14
loop_2244:
	nop
	set	0x7C, %g3
	stha	%o1,	[%l7 + %g3] 0xe2
	membar	#Sync
	tne	%xcc,	0x3
	movle	%xcc,	%o4,	%i0
	bshuffle	%f22,	%f28,	%f26
	tsubcctv	%g5,	%o7,	%g4
	fandnot1	%f8,	%f22,	%f10
	set	0x40, %l1
	stda	%f0,	[%l7 + %l1] 0x88
	ldub	[%l7 + 0x65],	%i2
	tge	%xcc,	0x2
	nop
	setx	0x304D1830,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	fmovsleu	%icc,	%f25,	%f12
	udiv	%o0,	0x1146,	%g2
	brgz	%l0,	loop_2245
	udivcc	%g1,	0x05C2,	%i3
	stx	%o6,	[%l7 + 0x48]
	call	loop_2246
loop_2245:
	taddcctv	%l2,	0x08EF,	%i1
	nop
	setx	0xF0AB791252B677F6,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	setx	0xEC7697FE7062FDDC,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f26
	fmuld	%f26,	%f26,	%f4
	tl	%icc,	0x4
loop_2246:
	fors	%f18,	%f1,	%f22
	movvc	%icc,	%i7,	%l5
	tn	%icc,	0x0
	sra	%l4,	0x0E,	%g6
	udivcc	%o3,	0x02B0,	%l6
	edge8ln	%o2,	%i4,	%i6
	fabss	%f11,	%f0
	array8	%l3,	%o5,	%l1
	srl	%g7,	0x16,	%i5
	fbuge	%fcc2,	loop_2247
	movrne	%o1,	0x1F5,	%o4
	tgu	%xcc,	0x7
	flush	%l7 + 0x40
loop_2247:
	nop
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x74] %asi,	%i0
	xor	%g5,	%o7,	%g3
	nop
	setx	0xF06CE251,	%l0,	%l6
	st	%l6,	[%l7 + 0x7C]
	ld	[%l7 + 0x7C],	%fsr
	alignaddr	%g4,	%o0,	%g2
	fmovd	%f10,	%f12
	fnor	%f2,	%f12,	%f6
	nop
	setx loop_2248, %l0, %l1
	jmpl %l1, %l0
	add	%g1,	%i3,	%i2
	mulx	%l2,	0x11E3,	%o6
	fmovsn	%xcc,	%f6,	%f1
loop_2248:
	fnot2s	%f20,	%f19
	fmul8sux16	%f16,	%f20,	%f26
	for	%f20,	%f4,	%f0
	movrgez	%i1,	0x20A,	%l5
	wr	%g0,	0x04,	%asi
	stwa	%i7,	[%l7 + 0x28] %asi
	bvs	%xcc,	loop_2249
	tsubcctv	%g6,	0x1BD0,	%l4
	nop
	setx loop_2250, %l0, %l1
	jmpl %l1, %o3
	fpsub16s	%f3,	%f31,	%f21
loop_2249:
	nop
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x6C] %asi,	%o2
loop_2250:
	alignaddr	%i4,	%i6,	%l6
	fnot2s	%f23,	%f5
	fxnors	%f22,	%f26,	%f4
	add	%o5,	0x1B77,	%l1
	membar	0x30
	fpack32	%f2,	%f0,	%f6
	te	%icc,	0x5
	brlz	%l3,	loop_2251
	tcc	%xcc,	0x5
	andn	%i5,	0x1F19,	%g7
	orcc	%o1,	%o4,	%g5
loop_2251:
	be,a	loop_2252
	mulx	%i0,	0x1C44,	%g3
	fmovdgu	%xcc,	%f18,	%f5
	ba	%xcc,	loop_2253
loop_2252:
	sllx	%g4,	0x1C,	%o7
	umulcc	%o0,	%l0,	%g2
	tcc	%xcc,	0x6
loop_2253:
	and	%g1,	0x02E9,	%i3
	fnors	%f13,	%f13,	%f7
	edge8l	%l2,	%o6,	%i1
	fpsub32	%f2,	%f12,	%f12
	mova	%xcc,	%l5,	%i7
	movvc	%icc,	%i2,	%l4
	bl,pn	%icc,	loop_2254
	xor	%g6,	%o2,	%o3
	fmovsneg	%icc,	%f10,	%f17
	sra	%i6,	0x19,	%i4
loop_2254:
	fmovsl	%xcc,	%f1,	%f21
	set	0x52, %o4
	stha	%o5,	[%l7 + %o4] 0x2f
	membar	#Sync
	edge32ln	%l1,	%l3,	%l6
	srax	%g7,	0x1B,	%o1
	subc	%i5,	0x0F0B,	%g5
	nop
	setx	0xAB3C6A02,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f23
	setx	0x96266F88,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f1
	fdivs	%f1,	%f23,	%f26
	array16	%i0,	%g3,	%o4
	tgu	%xcc,	0x5
	fmovrdgz	%g4,	%f12,	%f18
	bpos,a,pt	%icc,	loop_2255
	addcc	%o7,	%o0,	%g2
	movrlez	%g1,	0x12D,	%l0
	fmovrdlz	%i3,	%f20,	%f12
loop_2255:
	stw	%o6,	[%l7 + 0x4C]
	smul	%l2,	0x0042,	%i1
	ba,a	loop_2256
	smul	%i7,	0x1F8B,	%l5
	udivcc	%l4,	0x112B,	%g6
	bne	loop_2257
loop_2256:
	movl	%xcc,	%i2,	%o3
	fmul8ulx16	%f10,	%f12,	%f28
	tvs	%xcc,	0x0
loop_2257:
	fmovrdlez	%o2,	%f24,	%f0
	tl	%icc,	0x0
	nop
	fitod	%f12,	%f30
	fdtos	%f30,	%f3
	subcc	%i4,	0x1337,	%i6
	ba,pn	%xcc,	loop_2258
	tge	%xcc,	0x6
	addcc	%o5,	0x0159,	%l1
	fmovsn	%icc,	%f28,	%f18
loop_2258:
	flush	%l7 + 0x48
	pdist	%f22,	%f14,	%f0
	array16	%l6,	%l3,	%o1
	sdiv	%g7,	0x1FC9,	%i5
	and	%g5,	%g3,	%i0
	umulcc	%g4,	%o7,	%o4
	move	%icc,	%o0,	%g1
	edge8ln	%g2,	%l0,	%o6
	add	%l2,	0x0165,	%i3
	ld	[%l7 + 0x2C],	%f25
	movneg	%icc,	%i1,	%l5
	bpos,a,pn	%xcc,	loop_2259
	array32	%i7,	%l4,	%i2
	tn	%xcc,	0x0
	stx	%o3,	[%l7 + 0x30]
loop_2259:
	taddcctv	%g6,	%o2,	%i6
	movrlz	%o5,	0x2FC,	%i4
	fnands	%f6,	%f16,	%f3
	tleu	%xcc,	0x2
	fands	%f13,	%f0,	%f20
	tcc	%xcc,	0x1
	fmovsl	%xcc,	%f30,	%f26
	ldx	[%l7 + 0x68],	%l6
	add	%l3,	%o1,	%l1
	xnorcc	%g7,	%i5,	%g3
	sth	%i0,	[%l7 + 0x7E]
	fandnot2s	%f22,	%f1,	%f9
	tl	%xcc,	0x3
	edge32	%g4,	%g5,	%o7
	fba,a	%fcc0,	loop_2260
	fmovsgu	%icc,	%f22,	%f18
	movvs	%icc,	%o4,	%o0
	fnot1s	%f30,	%f26
loop_2260:
	movrlz	%g1,	%g2,	%o6
	array32	%l0,	%i3,	%i1
	udivcc	%l2,	0x1568,	%i7
	edge32n	%l5,	%i2,	%o3
	andcc	%l4,	0x02D8,	%o2
	array8	%i6,	%g6,	%i4
	alignaddrl	%o5,	%l6,	%o1
	bneg	loop_2261
	fnor	%f26,	%f14,	%f22
	addcc	%l3,	%g7,	%l1
	nop
	fitod	%f12,	%f12
	fdtoi	%f12,	%f31
loop_2261:
	bleu,a,pn	%icc,	loop_2262
	umul	%g3,	0x1243,	%i5
	fornot2s	%f2,	%f20,	%f16
	xorcc	%g4,	%i0,	%g5
loop_2262:
	fmovda	%xcc,	%f0,	%f30
	nop
	setx	0x8043CD96,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x38174B49,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fdivs	%f8,	%f9,	%f19
	movle	%icc,	%o7,	%o0
	fmovsgu	%icc,	%f6,	%f10
	movle	%icc,	%o4,	%g1
	tgu	%xcc,	0x6
	array16	%o6,	%l0,	%i3
	bvc	loop_2263
	movrlz	%i1,	%l2,	%i7
	smul	%g2,	0x0EE3,	%l5
	orn	%o3,	%l4,	%o2
loop_2263:
	fbul,a	%fcc2,	loop_2264
	nop
	fitod	%f12,	%f2
	sdivx	%i6,	0x193B,	%g6
	set	0x68, %i0
	lduba	[%l7 + %i0] 0x11,	%i4
loop_2264:
	sir	0x0D08
	and	%o5,	0x131C,	%l6
	taddcctv	%i2,	0x1074,	%l3
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x24] %asi,	%f29
	fmovdcc	%icc,	%f9,	%f15
	tge	%icc,	0x2
	fpadd16	%f30,	%f18,	%f18
	or	%g7,	%o1,	%g3
	xorcc	%l1,	%i5,	%g4
	mulx	%i0,	0x10CF,	%g5
	ldsb	[%l7 + 0x14],	%o0
	bshuffle	%f12,	%f22,	%f12
	fbuge	%fcc0,	loop_2265
	tpos	%icc,	0x4
	fmovdvs	%xcc,	%f7,	%f2
	edge16ln	%o4,	%o7,	%g1
loop_2265:
	nop
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x24] %asi,	%o6
	movrgz	%i3,	%i1,	%l2
	subc	%i7,	%l0,	%l5
	sth	%o3,	[%l7 + 0x58]
	tl	%xcc,	0x6
	fbule	%fcc1,	loop_2266
	movle	%xcc,	%g2,	%o2
	mova	%xcc,	%l4,	%g6
	array16	%i4,	%i6,	%l6
loop_2266:
	tne	%xcc,	0x0
	membar	0x07
	movvc	%xcc,	%o5,	%i2
	movrgz	%g7,	0x0BF,	%l3
	wr	%g0,	0x81,	%asi
	lda	[%l7 + 0x7C] %asi,	%f1
	fors	%f30,	%f8,	%f4
	movvs	%icc,	%o1,	%l1
	movge	%icc,	%i5,	%g4
	movre	%g3,	0x009,	%i0
	add	%g5,	0x1D6E,	%o0
	stb	%o4,	[%l7 + 0x79]
	fblg,a	%fcc0,	loop_2267
	addccc	%g1,	%o6,	%o7
	tge	%icc,	0x0
	xorcc	%i1,	0x00E6,	%i3
loop_2267:
	fand	%f6,	%f30,	%f26
	fcmpgt32	%f28,	%f6,	%i7
	or	%l0,	0x14C4,	%l2
	lduw	[%l7 + 0x38],	%l5
	bcc,a,pn	%icc,	loop_2268
	sir	0x10A0
	edge32l	%g2,	%o2,	%l4
	andcc	%o3,	0x1C06,	%g6
loop_2268:
	tsubcc	%i6,	0x1043,	%i4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f8,	%f9,	%f20
	sethi	0x050C,	%o5
	edge16n	%l6,	%g7,	%i2
	fmovsge	%icc,	%f24,	%f10
	subc	%o1,	%l3,	%i5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x80,	%asi
	ldxa	[%l6] %asi,	%g4
	casxa	[%l6] 0x80,	%g4,	%g3
	movleu	%xcc,	%i0,	%l1
	edge8l	%g5,	%o0,	%g1
	fornot2s	%f2,	%f4,	%f30
	sll	%o4,	%o6,	%i1
	movneg	%icc,	%i3,	%o7
	movrne	%l0,	0x2B7,	%l2
	brz	%i7,	loop_2269
	movvc	%xcc,	%g2,	%l5
	fbule	%fcc0,	loop_2270
	fbo,a	%fcc3,	loop_2271
loop_2269:
	alignaddrl	%o2,	%l4,	%o3
	brlz	%g6,	loop_2272
loop_2270:
	fmovdvc	%icc,	%f8,	%f5
loop_2271:
	nop
	set	0x36, %g7
	lduba	[%l7 + %g7] 0x10,	%i4
loop_2272:
	ldub	[%l7 + 0x7B],	%i6
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x38] %asi,	%l6
	fmovrdgz	%g7,	%f16,	%f28
	fcmpeq16	%f14,	%f8,	%o5
	set	0x30, %i6
	ldda	[%l7 + %i6] 0x19,	%o0
	nop
	fitos	%f5,	%f17
	fstoi	%f17,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tleu	%xcc,	0x6
	movn	%xcc,	%i2,	%l3
	movrlz	%g4,	0x3EC,	%i5
	mova	%icc,	%i0,	%g3
	fbul,a	%fcc0,	loop_2273
	sdivx	%l1,	0x062A,	%o0
	edge32n	%g1,	%o4,	%g5
	fandnot2	%f16,	%f14,	%f28
loop_2273:
	tsubcctv	%i1,	%i3,	%o7
	set	0x10, %g6
	stxa	%o6,	[%g0 + %g6] 0x21
	edge32	%l2,	%l0,	%g2
	tge	%icc,	0x2
	andn	%i7,	%o2,	%l4
	wr	%g0,	0x04,	%asi
	lduba	[%l7 + 0x60] %asi,	%o3
	membar	#Sync
	set	0x40, %i7
	ldda	[%l7 + %i7] 0xf9,	%f0
	add	%l5,	%g6,	%i4
	fpadd32s	%f21,	%f18,	%f0
	alignaddr	%l6,	%g7,	%i6
	brlz	%o5,	loop_2274
	sth	%i2,	[%l7 + 0x26]
	fblg,a	%fcc3,	loop_2275
	ldsw	[%l7 + 0x78],	%o1
loop_2274:
	movrlz	%l3,	0x0D4,	%g4
	swap	[%l7 + 0x08],	%i0
loop_2275:
	addcc	%i5,	0x19C3,	%g3
	wr	%g0,	0x88,	%asi
	swapa	[%l7 + 0x1C] %asi,	%l1
	te	%xcc,	0x5
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x64] %asi,	%g1
	stbar
	brgz	%o4,	loop_2276
	brgz	%o0,	loop_2277
	sethi	0x0A84,	%i1
	umulcc	%i3,	0x19EE,	%g5
loop_2276:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2277:
	array8	%o6,	%o7,	%l2
	brz	%g2,	loop_2278
	fmovsge	%xcc,	%f22,	%f26
	nop
	setx	0xFA0D8CB2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f9
	setx	0x1F00360C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f20
	fdivs	%f20,	%f9,	%f30
	tsubcctv	%l0,	%o2,	%i7
loop_2278:
	sdivx	%l4,	0x15DF,	%o3
	brgez,a	%g6,	loop_2279
	array8	%l5,	%l6,	%i4
	set	0x4C, %l2
	lda	[%l7 + %l2] 0x14,	%f24
loop_2279:
	orncc	%g7,	%o5,	%i2
	mova	%icc,	%o1,	%i6
	sra	%g4,	0x0A,	%l3
	mulscc	%i0,	0x0247,	%g3
	tne	%xcc,	0x3
	fmovrslez	%i5,	%f8,	%f22
	ta	%xcc,	0x2
	sra	%l1,	0x0B,	%g1
	tcc	%icc,	0x7
	set	0x70, %l5
	ldda	[%l7 + %l5] 0x2c,	%o0
	movne	%xcc,	%i1,	%i3
	movl	%icc,	%o4,	%o6
	set	0x34, %i5
	lduwa	[%l7 + %i5] 0x81,	%g5
	call	loop_2280
	sethi	0x09FA,	%o7
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l2,	%l0,	%g2
loop_2280:
	umulcc	%i7,	0x150B,	%o2
	movleu	%xcc,	%o3,	%l4
	set	0x10, %o1
	ldda	[%l7 + %o1] 0x2c,	%g6
	ldd	[%l7 + 0x68],	%l4
	subc	%i4,	%l6,	%g7
	fmovsvc	%xcc,	%f17,	%f25
	movvs	%xcc,	%o5,	%i2
	movl	%xcc,	%i6,	%g4
	fmovrdne	%o1,	%f10,	%f2
	fmovsl	%xcc,	%f6,	%f18
	or	%l3,	0x0404,	%g3
	bgu	%icc,	loop_2281
	edge8ln	%i5,	%i0,	%l1
	edge32n	%o0,	%g1,	%i3
	fpsub16s	%f25,	%f20,	%f9
loop_2281:
	bleu,a	%icc,	loop_2282
	edge8l	%o4,	%o6,	%i1
	fmovspos	%xcc,	%f23,	%f24
	edge16l	%g5,	%o7,	%l2
loop_2282:
	fmovd	%f16,	%f26
	bshuffle	%f20,	%f8,	%f14
	fcmpeq32	%f18,	%f2,	%g2
	fmovdvs	%icc,	%f0,	%f2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i7,	%l0,	%o3
	bneg	loop_2283
	tvs	%icc,	0x0
	tle	%icc,	0x2
	fmovsl	%icc,	%f11,	%f19
loop_2283:
	xnor	%l4,	0x1A3C,	%o2
	movrne	%l5,	0x0C8,	%i4
	nop
	setx	0xE1B2AF38642CDA15,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	fsqrtd	%f18,	%f12
	sdiv	%g6,	0x1128,	%l6
	bcc,a	%xcc,	loop_2284
	fmovdneg	%icc,	%f31,	%f19
	tne	%icc,	0x3
	stbar
loop_2284:
	xorcc	%g7,	0x04E2,	%o5
	xnorcc	%i6,	0x17E5,	%g4
	movleu	%icc,	%o1,	%l3
	fbn	%fcc3,	loop_2285
	bl	%icc,	loop_2286
	fbn,a	%fcc2,	loop_2287
	fornot2s	%f14,	%f21,	%f25
loop_2285:
	array16	%i2,	%g3,	%i0
loop_2286:
	sllx	%l1,	%i5,	%g1
loop_2287:
	fbug	%fcc2,	loop_2288
	sdivcc	%i3,	0x1ADC,	%o0
	udivx	%o6,	0x0F66,	%o4
	tn	%icc,	0x2
loop_2288:
	fmovdn	%xcc,	%f14,	%f0
	fmovsgu	%icc,	%f5,	%f7
	edge8l	%i1,	%g5,	%l2
	orncc	%g2,	%o7,	%l0
	srlx	%i7,	%o3,	%l4
	edge16n	%l5,	%i4,	%o2
	fmovdg	%xcc,	%f16,	%f23
	sll	%g6,	0x1F,	%g7
	orn	%l6,	%o5,	%g4
	srlx	%o1,	0x0C,	%l3
	movne	%xcc,	%i6,	%g3
	mulx	%i0,	0x1D69,	%l1
	sllx	%i5,	%i2,	%i3
	udivcc	%g1,	0x03F0,	%o6
	fbn	%fcc1,	loop_2289
	bleu	%icc,	loop_2290
	nop
	setx	0x6BB71F332F7E9A2D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD469C81AF5564CA9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f10
	fdivd	%f10,	%f0,	%f18
	te	%xcc,	0x3
loop_2289:
	nop
	setx	0xD12F193821952D45,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f16
loop_2290:
	movrgez	%o4,	%i1,	%g5
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%o0,	%l2
	nop
	setx	0x7491AC28,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x4892200E,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f12
	fsubs	%f12,	%f4,	%f0
	edge8	%g2,	%l0,	%o7
	tpos	%xcc,	0x3
	movvc	%icc,	%i7,	%o3
	srl	%l5,	0x1A,	%l4
	tsubcc	%o2,	%g6,	%i4
	fmovscc	%xcc,	%f13,	%f5
	nop
	setx	0x0A96DCD9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f1
	setx	0xCB0F0BEB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f27
	fmuls	%f27,	%f1,	%f21
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bl	%xcc,	loop_2291
	and	%l6,	0x1AFC,	%g7
	nop
	setx	0xF079A0A1,	%l0,	%l6
	st	%l6,	[%l7 + 0x0C]
	ld	[%l7 + 0x0C],	%fsr
	movneg	%icc,	%g4,	%o1
loop_2291:
	sdiv	%l3,	0x1965,	%i6
	lduh	[%l7 + 0x20],	%o5
	sllx	%g3,	0x1C,	%i0
	fbo	%fcc2,	loop_2292
	edge16n	%i5,	%i2,	%i3
	nop
	fitos	%f4,	%f21
	fstox	%f21,	%f4
	fxtos	%f4,	%f11
	movrlz	%l1,	0x3B9,	%o6
loop_2292:
	fpadd32s	%f27,	%f21,	%f5
	set	0x26, %o2
	stba	%g1,	[%l7 + %o2] 0xe3
	membar	#Sync
	edge32	%o4,	%i1,	%o0
	alignaddr	%g5,	%g2,	%l2
	array16	%o7,	%i7,	%o3
	wr	%g0,	0x4f,	%asi
	ldxa	[%g0 + 0x0] %asi,	%l5
	tcs	%icc,	0x2
	std	%f2,	[%l7 + 0x38]
	movcs	%xcc,	%l4,	%o2
	brgz,a	%l0,	loop_2293
	array16	%i4,	%g6,	%l6
	fandnot2s	%f16,	%f0,	%f18
	wr	%g0,	0x18,	%asi
	sta	%f8,	[%l7 + 0x28] %asi
loop_2293:
	fbue,a	%fcc2,	loop_2294
	fbg	%fcc3,	loop_2295
	movcc	%xcc,	%g7,	%g4
	fmovdneg	%xcc,	%f1,	%f6
loop_2294:
	tneg	%icc,	0x1
loop_2295:
	tpos	%xcc,	0x7
	andcc	%o1,	%i6,	%l3
	umulcc	%g3,	%o5,	%i0
	add	%i2,	%i5,	%l1
	movgu	%icc,	%o6,	%i3
	movleu	%icc,	%g1,	%i1
	sth	%o4,	[%l7 + 0x0E]
	movvc	%xcc,	%o0,	%g5
	tsubcctv	%l2,	%o7,	%g2
	fornot2s	%f4,	%f16,	%f24
	tne	%xcc,	0x6
	movge	%icc,	%o3,	%i7
	fbl,a	%fcc0,	loop_2296
	fbo,a	%fcc1,	loop_2297
	taddcctv	%l4,	0x0935,	%o2
	stbar
loop_2296:
	fmovsg	%icc,	%f7,	%f4
loop_2297:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bn,a	%xcc,	loop_2298
	ldsw	[%l7 + 0x20],	%l0
	movle	%xcc,	%l5,	%g6
	ta	%icc,	0x7
loop_2298:
	tpos	%xcc,	0x4
	smul	%i4,	0x035F,	%g7
	bcs,a	loop_2299
	alignaddrl	%g4,	%l6,	%i6
	fnot2	%f12,	%f0
	fmul8sux16	%f12,	%f26,	%f26
loop_2299:
	fmovdn	%icc,	%f27,	%f29
	bcc,a	%xcc,	loop_2300
	fmovs	%f16,	%f29
	tgu	%icc,	0x7
	ldd	[%l7 + 0x10],	%f14
loop_2300:
	swap	[%l7 + 0x40],	%o1
	fabsd	%f2,	%f4
	fmovdgu	%xcc,	%f15,	%f7
	alignaddrl	%l3,	%o5,	%i0
	andn	%g3,	%i5,	%l1
	st	%f10,	[%l7 + 0x40]
	fmovde	%xcc,	%f28,	%f6
	tge	%icc,	0x0
	movrgz	%i2,	0x08E,	%o6
	brlez,a	%i3,	loop_2301
	alignaddr	%g1,	%o4,	%i1
	movleu	%xcc,	%g5,	%l2
	tleu	%icc,	0x7
loop_2301:
	move	%icc,	%o0,	%o7
	tneg	%xcc,	0x2
	bge,a,pn	%icc,	loop_2302
	ld	[%l7 + 0x14],	%f6
	edge8	%g2,	%i7,	%o3
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f30
	fxtod	%f30,	%f12
loop_2302:
	tvc	%icc,	0x0
	wr	%g0,	0x18,	%asi
	ldsba	[%l7 + 0x1C] %asi,	%l4
	fpsub16	%f2,	%f10,	%f28
	ldd	[%l7 + 0x30],	%f28
	nop
	setx	0x205A1F11,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	set	0x48, %g1
	lduha	[%l7 + %g1] 0x0c,	%o2
	fmovse	%icc,	%f7,	%f3
	andncc	%l0,	%g6,	%l5
	popc	0x120F,	%i4
	movgu	%xcc,	%g4,	%l6
	tne	%xcc,	0x3
	bleu	%xcc,	loop_2303
	movg	%xcc,	%i6,	%o1
	fba,a	%fcc2,	loop_2304
	andncc	%g7,	%l3,	%i0
loop_2303:
	udivcc	%g3,	0x1C26,	%i5
	edge8n	%l1,	%o5,	%o6
loop_2304:
	fsrc1	%f26,	%f20
	movneg	%icc,	%i3,	%i2
	xor	%g1,	0x165E,	%i1
	subc	%o4,	%g5,	%l2
	for	%f4,	%f4,	%f10
	fxnors	%f11,	%f0,	%f1
	fbn,a	%fcc2,	loop_2305
	udivcc	%o7,	0x1E5E,	%g2
	lduh	[%l7 + 0x32],	%i7
	edge16l	%o3,	%l4,	%o0
loop_2305:
	lduh	[%l7 + 0x0E],	%l0
	fmovrsne	%g6,	%f12,	%f25
	xor	%l5,	0x1409,	%o2
	set	0x60, %i3
	sta	%f8,	[%l7 + %i3] 0x81
	tne	%icc,	0x3
	movge	%icc,	%g4,	%i4
	tsubcc	%l6,	%o1,	%g7
	fabsd	%f20,	%f30
	umulcc	%i6,	%i0,	%l3
	for	%f10,	%f14,	%f30
	xnor	%g3,	%l1,	%i5
	movgu	%icc,	%o5,	%i3
	movle	%icc,	%i2,	%g1
	movleu	%xcc,	%i1,	%o6
	bvs,pn	%xcc,	loop_2306
	orncc	%g5,	%l2,	%o7
	stb	%o4,	[%l7 + 0x17]
	fmovdl	%xcc,	%f29,	%f2
loop_2306:
	xorcc	%i7,	0x17A7,	%o3
	edge16ln	%g2,	%o0,	%l0
	te	%xcc,	0x5
	fnot1	%f24,	%f18
	edge16n	%g6,	%l5,	%l4
	fmovdvs	%icc,	%f27,	%f20
	udivx	%o2,	0x11C8,	%g4
	nop
	setx	0x30550FD9,	%l0,	%l6
	st	%l6,	[%l7 + 0x30]
	ld	[%l7 + 0x30],	%fsr
	sub	%l6,	0x0D00,	%i4
	array8	%g7,	%o1,	%i0
	udivcc	%i6,	0x1FF0,	%g3
	tvs	%xcc,	0x3
	movre	%l1,	0x2E7,	%i5
	movn	%icc,	%l3,	%o5
	fmovrdgez	%i3,	%f0,	%f6
	fmovdl	%xcc,	%f14,	%f30
	bgu,pt	%icc,	loop_2307
	bgu,a	loop_2308
	movn	%xcc,	%i2,	%g1
	subccc	%o6,	%g5,	%l2
loop_2307:
	mova	%icc,	%o7,	%o4
loop_2308:
	bge	loop_2309
	fsrc1s	%f30,	%f21
	orncc	%i7,	0x1825,	%i1
	array32	%o3,	%g2,	%o0
loop_2309:
	xnor	%g6,	%l0,	%l4
	edge16ln	%l5,	%g4,	%o2
	sth	%i4,	[%l7 + 0x70]
	smulcc	%g7,	0x0676,	%l6
	movgu	%xcc,	%o1,	%i6
	xor	%g3,	0x094A,	%i0
	nop
	setx	0xE048CD64,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	movl	%icc,	%i5,	%l3
	movrgez	%o5,	%i3,	%i2
	sub	%l1,	%o6,	%g5
	movn	%xcc,	%l2,	%o7
	srlx	%g1,	0x00,	%o4
	tpos	%icc,	0x1
	movge	%xcc,	%i7,	%i1
	movrgz	%g2,	0x3BD,	%o3
	umul	%o0,	%g6,	%l4
	movcs	%icc,	%l0,	%g4
	sub	%o2,	0x1DB0,	%i4
	fpack32	%f2,	%f26,	%f4
	wr	%g0,	0x10,	%asi
	lda	[%l7 + 0x58] %asi,	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l5,	%l6,	%o1
	andcc	%i6,	%g7,	%i0
	fbge	%fcc2,	loop_2310
	move	%icc,	%g3,	%i5
	tvs	%xcc,	0x1
	bcc	loop_2311
loop_2310:
	movre	%l3,	0x341,	%o5
	stbar
	fnot1s	%f12,	%f23
loop_2311:
	ta	%xcc,	0x5
	fnor	%f0,	%f2,	%f24
	and	%i2,	%i3,	%l1
	st	%f12,	[%l7 + 0x68]
	tl	%icc,	0x0
	fmovsge	%icc,	%f7,	%f19
	tvs	%icc,	0x1
	tvs	%icc,	0x2
	bne	loop_2312
	tcc	%xcc,	0x4
	sir	0x00A4
	membar	0x29
loop_2312:
	edge16l	%o6,	%l2,	%g5
	bge,a,pn	%icc,	loop_2313
	movleu	%icc,	%o7,	%o4
	nop
	set	0x50, %o6
	std	%f2,	[%l7 + %o6]
	andcc	%i7,	%g1,	%i1
loop_2313:
	fbge	%fcc2,	loop_2314
	fand	%f18,	%f28,	%f14
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g2,	0x0B26,	%o0
loop_2314:
	sub	%o3,	%l4,	%l0
	sra	%g6,	%o2,	%i4
	lduh	[%l7 + 0x6A],	%g4
	xorcc	%l5,	0x0CC0,	%o1
	fandnot1	%f28,	%f30,	%f4
	and	%l6,	0x1410,	%g7
	taddcctv	%i0,	%g3,	%i5
	ldub	[%l7 + 0x43],	%i6
	bl,pn	%xcc,	loop_2315
	fmovd	%f0,	%f10
	sra	%l3,	%i2,	%i3
	nop
	fitos	%f9,	%f9
	fstox	%f9,	%f4
loop_2315:
	udivx	%o5,	0x1B8F,	%l1
	sdiv	%l2,	0x03C6,	%o6
	subcc	%g5,	0x00E2,	%o4
	edge8l	%o7,	%g1,	%i1
	sub	%i7,	0x1874,	%g2
	movge	%icc,	%o3,	%o0
	nop
	setx	loop_2316,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	fand	%f0,	%f2,	%f20
	addc	%l0,	0x1F78,	%g6
	fbg,a	%fcc0,	loop_2317
loop_2316:
	ld	[%l7 + 0x30],	%f9
	nop
	setx	loop_2318,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bl,a,pn	%xcc,	loop_2319
loop_2317:
	fmovdvc	%xcc,	%f17,	%f21
	tg	%xcc,	0x0
loop_2318:
	addccc	%o2,	0x0502,	%i4
loop_2319:
	nop
	setx	0xB129D145,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f28
	setx	0x7E7DD6B2,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f21
	fadds	%f21,	%f28,	%f12
	te	%icc,	0x0
	bcc,a,pt	%icc,	loop_2320
	fandnot1s	%f26,	%f15,	%f10
	alignaddr	%l4,	%g4,	%o1
	edge16l	%l5,	%g7,	%l6
loop_2320:
	fpsub32s	%f15,	%f13,	%f28
	tpos	%xcc,	0x0
	fabsd	%f26,	%f26
	srl	%i0,	0x0D,	%g3
	wr	%g0,	0x27,	%asi
	stwa	%i6,	[%l7 + 0x60] %asi
	membar	#Sync
	movre	%l3,	%i5,	%i2
	ld	[%l7 + 0x6C],	%f8
	tgu	%icc,	0x7
	sub	%i3,	%l1,	%l2
	smul	%o6,	0x037A,	%g5
	add	%l7,	0x50,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%o5
	casa	[%l6] %asi,	%o5,	%o7
	tge	%icc,	0x0
	nop
	fitos	%f10,	%f11
	fstod	%f11,	%f22
	ldd	[%l7 + 0x10],	%o4
	bvc,pt	%icc,	loop_2321
	sll	%g1,	%i7,	%g2
	fmovdcc	%icc,	%f9,	%f19
	tgu	%icc,	0x0
loop_2321:
	tsubcctv	%o3,	0x1B3C,	%o0
	fmovrdlez	%i1,	%f26,	%f0
	array8	%l0,	%o2,	%i4
	lduw	[%l7 + 0x10],	%l4
	movleu	%icc,	%g6,	%o1
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x6A] %asi,	%g4
	fbge,a	%fcc3,	loop_2322
	fmovscs	%xcc,	%f19,	%f21
	umulcc	%l5,	0x19EC,	%g7
	ba	loop_2323
loop_2322:
	sdiv	%l6,	0x1676,	%g3
	fpackfix	%f18,	%f26
	edge8n	%i0,	%l3,	%i6
loop_2323:
	srlx	%i5,	%i3,	%l1
	tne	%icc,	0x1
	alignaddr	%l2,	%o6,	%g5
	fmovdcc	%icc,	%f11,	%f10
	stx	%i2,	[%l7 + 0x70]
	and	%o7,	%o4,	%o5
	ta	%xcc,	0x0
	fba	%fcc3,	loop_2324
	taddcctv	%g1,	%g2,	%o3
	set	0x36, %l4
	stha	%o0,	[%l7 + %l4] 0x18
loop_2324:
	brlez	%i7,	loop_2325
	andcc	%i1,	0x1E2B,	%l0
	sra	%i4,	0x0D,	%l4
	tneg	%icc,	0x1
loop_2325:
	ldx	[%l7 + 0x38],	%o2
	sdivcc	%g6,	0x10A9,	%o1
	xnorcc	%l5,	0x1226,	%g4
	edge8	%g7,	%l6,	%i0
	movrgz	%g3,	%l3,	%i6
	movne	%icc,	%i5,	%l1
	set	0x6C, %i1
	lda	[%l7 + %i1] 0x10,	%f18
	alignaddrl	%l2,	%o6,	%i3
	movrgez	%g5,	%o7,	%i2
	edge16	%o4,	%o5,	%g2
	nop
	set	0x24, %o3
	prefetch	[%l7 + %o3],	 0x2
	sdivcc	%o3,	0x0FA2,	%o0
	brz,a	%i7,	loop_2326
	fbg,a	%fcc3,	loop_2327
	fornot2	%f2,	%f0,	%f24
	sdivx	%g1,	0x1FA2,	%i1
loop_2326:
	udivx	%i4,	0x0ED4,	%l4
loop_2327:
	subc	%o2,	%l0,	%o1
	fandnot2s	%f29,	%f25,	%f20
	movvc	%xcc,	%g6,	%l5
	edge32	%g7,	%g4,	%l6
	wr	%g0,	0x10,	%asi
	stba	%i0,	[%l7 + 0x4C] %asi
	andncc	%l3,	%g3,	%i6
	array8	%i5,	%l1,	%o6
	sllx	%l2,	0x1F,	%g5
	umul	%o7,	0x11CB,	%i2
	nop
	setx	0x5E940E4A80463652,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	setx	0x3D3A83BC6BDB9922,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f12,	%f4
	ldstub	[%l7 + 0x51],	%o4
	addccc	%o5,	%g2,	%i3
	fmovdl	%icc,	%f12,	%f17
	movcc	%xcc,	%o3,	%i7
	tl	%icc,	0x7
	orncc	%g1,	%o0,	%i1
	movvs	%icc,	%l4,	%o2
	movn	%xcc,	%i4,	%o1
	fmovdl	%icc,	%f30,	%f2
	srl	%l0,	0x05,	%g6
	fpsub32	%f10,	%f30,	%f26
	fbg	%fcc3,	loop_2328
	fmovrsgz	%l5,	%f11,	%f16
	sdivcc	%g4,	0x100B,	%g7
	fornot2	%f26,	%f14,	%f22
loop_2328:
	nop
	set	0x2C, %g5
	stb	%i0,	[%l7 + %g5]
	movne	%icc,	%l3,	%l6
	fmovrsgez	%i6,	%f3,	%f19
	nop
	setx	0xD688A7A9A05A9C19,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f21,	%f5
	array8	%g3,	%l1,	%o6
	movgu	%icc,	%i5,	%g5
	edge16n	%o7,	%i2,	%l2
	fmovdcs	%icc,	%f13,	%f1
	edge16n	%o5,	%g2,	%i3
	ldsw	[%l7 + 0x5C],	%o4
	alignaddr	%o3,	%i7,	%g1
	nop
	setx	0x169BA7F9,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f18
	fsqrts	%f18,	%f0
	sdivcc	%o0,	0x1AC7,	%l4
	fmovsgu	%xcc,	%f0,	%f12
	fnor	%f16,	%f10,	%f12
	movrne	%i1,	%o2,	%o1
	set	0x5A, %g4
	lduba	[%l7 + %g4] 0x81,	%l0
	set	0x4C, %g2
	lduwa	[%l7 + %g2] 0x89,	%i4
	movpos	%xcc,	%g6,	%g4
	brlez,a	%g7,	loop_2329
	subccc	%i0,	%l3,	%l5
	nop
	setx	0x6AAC4F465CB24F32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0x54036BAFB741BF2E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	fmuld	%f4,	%f8,	%f6
	fornot1	%f14,	%f2,	%f6
loop_2329:
	fmovrdgez	%l6,	%f0,	%f16
	nop
	setx	loop_2330,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	swap	[%l7 + 0x50],	%g3
	tcs	%xcc,	0x0
	and	%i6,	0x051C,	%o6
loop_2330:
	array16	%l1,	%i5,	%o7
	fnor	%f2,	%f6,	%f24
	udivcc	%i2,	0x1A71,	%l2
	srlx	%o5,	0x0B,	%g5
	fmovspos	%xcc,	%f7,	%f21
	movcs	%icc,	%g2,	%o4
	sll	%o3,	%i3,	%i7
	fmovscc	%icc,	%f1,	%f14
	brlz,a	%g1,	loop_2331
	fpadd32s	%f17,	%f17,	%f1
	ldd	[%l7 + 0x48],	%f16
	tvs	%xcc,	0x1
loop_2331:
	movne	%icc,	%o0,	%i1
	bvs,a	loop_2332
	taddcc	%l4,	0x024D,	%o1
	movne	%icc,	%o2,	%i4
	sdivcc	%g6,	0x1959,	%g4
loop_2332:
	nop
	setx	loop_2333,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tgu	%icc,	0x5
	array16	%g7,	%i0,	%l0
	fnot2s	%f21,	%f2
loop_2333:
	orn	%l5,	%l6,	%l3
	fxor	%f6,	%f22,	%f2
	edge32	%g3,	%i6,	%o6
	fbue	%fcc1,	loop_2334
	nop
	setx	loop_2335,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movneg	%icc,	%i5,	%o7
	fabss	%f18,	%f30
loop_2334:
	sethi	0x0236,	%l1
loop_2335:
	movgu	%xcc,	%l2,	%o5
	nop
	setx	loop_2336,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%i2,	%g2,	%g5
	st	%f5,	[%l7 + 0x64]
	movcc	%xcc,	%o3,	%o4
loop_2336:
	tge	%xcc,	0x0
	array32	%i3,	%i7,	%g1
	array32	%o0,	%l4,	%i1
	edge32l	%o1,	%o2,	%i4
	edge8	%g4,	%g6,	%i0
	edge32	%g7,	%l0,	%l5
	subccc	%l3,	0x18A2,	%l6
	orcc	%i6,	0x0374,	%g3
	tneg	%icc,	0x4
	te	%xcc,	0x1
	fba	%fcc1,	loop_2337
	movvs	%xcc,	%i5,	%o7
	nop
	setx	0x098C0687567B4A27,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f6
	fbuge,a	%fcc2,	loop_2338
loop_2337:
	for	%f28,	%f30,	%f20
	pdist	%f18,	%f8,	%f26
	sdiv	%l1,	0x1077,	%l2
loop_2338:
	udiv	%o5,	0x0A64,	%o6
	fmovsvs	%icc,	%f29,	%f10
	set	0x46, %l3
	lduha	[%l7 + %l3] 0x88,	%g2
	brlz,a	%i2,	loop_2339
	movrgz	%o3,	0x13E,	%o4
	fmul8x16au	%f17,	%f7,	%f30
	ld	[%l7 + 0x3C],	%f3
loop_2339:
	umulcc	%i3,	%g5,	%i7
	fcmple16	%f12,	%f20,	%g1
	movl	%icc,	%o0,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l4,	%o2
	move	%xcc,	%i4,	%g4
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x60] %asi,	%g6
	fzero	%f20
	fexpand	%f26,	%f22
	tn	%icc,	0x4
	tsubcc	%o1,	0x1B37,	%g7
	fmovdge	%icc,	%f10,	%f12
	fmul8ulx16	%f18,	%f6,	%f4
	movrlz	%l0,	%i0,	%l3
	and	%l5,	%l6,	%i6
	fornot1s	%f18,	%f5,	%f13
	ldd	[%l7 + 0x38],	%i4
	taddcctv	%g3,	%o7,	%l1
	fors	%f5,	%f27,	%f6
	fbe	%fcc0,	loop_2340
	tvc	%icc,	0x4
	tpos	%xcc,	0x5
	tle	%icc,	0x5
loop_2340:
	fors	%f2,	%f21,	%f2
	udiv	%l2,	0x0DF4,	%o5
	popc	%o6,	%g2
	edge32	%o3,	%i2,	%o4
	edge8ln	%i3,	%i7,	%g1
	fabss	%f0,	%f2
	udivcc	%o0,	0x0457,	%i1
	movvs	%icc,	%l4,	%o2
	fbu	%fcc0,	loop_2341
	alignaddr	%i4,	%g5,	%g6
	fmovdg	%icc,	%f23,	%f4
	stbar
loop_2341:
	tcc	%xcc,	0x7
	faligndata	%f8,	%f2,	%f0
	addccc	%o1,	%g7,	%l0
	bg,a	loop_2342
	andncc	%g4,	%l3,	%l5
	movcc	%icc,	%i0,	%i6
	fzeros	%f11
loop_2342:
	nop
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x7B] %asi,	%i5
	bcs	%icc,	loop_2343
	fmul8ulx16	%f4,	%f28,	%f4
	andcc	%l6,	0x1D65,	%g3
	add	%o7,	0x082C,	%l1
loop_2343:
	call	loop_2344
	tge	%xcc,	0x7
	edge16n	%l2,	%o6,	%o5
	array8	%g2,	%o3,	%i2
loop_2344:
	fmovdne	%icc,	%f31,	%f21
	set	0x10, %l0
	ldda	[%l7 + %l0] 0xe2,	%i2
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%i7
	ldub	[%l7 + 0x69],	%o4
	tsubcc	%g1,	%i1,	%l4
	set	0x58, %o0
	stwa	%o0,	[%l7 + %o0] 0xeb
	membar	#Sync
	sllx	%i4,	0x13,	%o2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g5,	%g6,	%o1
	xnor	%g7,	0x1B54,	%g4
	movrlez	%l3,	0x012,	%l0
	tsubcc	%i0,	0x1764,	%l5
	fblg	%fcc1,	loop_2345
	movn	%icc,	%i6,	%i5
	fblg	%fcc0,	loop_2346
	taddcc	%g3,	%l6,	%l1
loop_2345:
	edge32l	%o7,	%o6,	%l2
	fmuld8sux16	%f16,	%f11,	%f8
loop_2346:
	movge	%xcc,	%g2,	%o5
	ldx	[%l7 + 0x28],	%o3
	fmovrdlz	%i3,	%f4,	%f26
	sdivcc	%i2,	0x1725,	%o4
	movle	%xcc,	%i7,	%g1
	add	%l7,	0x0C,	%l6
	wr	%g0,	0x11,	%asi
	casa	[%l6] %asi,	%i1,	%l4
	stw	%i4,	[%l7 + 0x4C]
	bn,pn	%xcc,	loop_2347
	fpack32	%f28,	%f12,	%f26
	movneg	%icc,	%o0,	%o2
	tsubcctv	%g6,	0x084C,	%o1
loop_2347:
	udivcc	%g5,	0x1BA3,	%g4
	movvs	%icc,	%g7,	%l0
	membar	0x08
	edge16n	%i0,	%l3,	%l5
	move	%icc,	%i6,	%g3
	movge	%icc,	%l6,	%l1
	edge16n	%o7,	%o6,	%l2
	fbug	%fcc2,	loop_2348
	tl	%xcc,	0x5
	xorcc	%i5,	0x0B5D,	%g2
	edge16l	%o3,	%o5,	%i2
loop_2348:
	fornot1	%f16,	%f24,	%f2
	udivcc	%i3,	0x0C78,	%o4
	te	%icc,	0x1
	edge8l	%i7,	%g1,	%l4
	set	0x60, %l6
	prefetcha	[%l7 + %l6] 0x15,	 0x1
	sra	%o0,	%o2,	%i1
	ldsh	[%l7 + 0x5C],	%g6
	movl	%icc,	%g5,	%g4
	fmovdneg	%xcc,	%f29,	%f14
	srlx	%o1,	%g7,	%l0
	fsrc1s	%f15,	%f16
	srax	%l3,	0x1B,	%i0
	fzero	%f0
	fcmpgt32	%f18,	%f16,	%i6
	fmovdneg	%xcc,	%f25,	%f0
	movl	%xcc,	%g3,	%l5
	or	%l6,	%l1,	%o6
	udiv	%o7,	0x0FDC,	%i5
	fmovdge	%xcc,	%f19,	%f9
	udivcc	%l2,	0x055B,	%g2
	andcc	%o3,	%o5,	%i3
	mova	%icc,	%i2,	%i7
	tcs	%icc,	0x7
	fpsub32s	%f1,	%f5,	%f13
	for	%f30,	%f22,	%f6
	array8	%g1,	%l4,	%o4
	fbul,a	%fcc2,	loop_2349
	movre	%i4,	%o0,	%i1
	fsrc2s	%f15,	%f27
	movrgez	%g6,	%g5,	%g4
loop_2349:
	umul	%o2,	%o1,	%g7
	add	%l3,	0x07BC,	%l0
	set	0x54, %i2
	stwa	%i6,	[%l7 + %i2] 0x2b
	membar	#Sync
	tg	%xcc,	0x2
	st	%f26,	[%l7 + 0x6C]
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x6C] %asi,	%g3
	subccc	%i0,	%l5,	%l1
	fmovrse	%o6,	%f1,	%f14
	nop
	set	0x70, %o5
	lduw	[%l7 + %o5],	%o7
	ldx	[%l7 + 0x40],	%i5
	movn	%xcc,	%l2,	%l6
	movleu	%icc,	%g2,	%o5
	orcc	%i3,	%i2,	%i7
	fmovrsgz	%g1,	%f16,	%f9
	xnor	%o3,	%l4,	%o4
	ldsb	[%l7 + 0x5D],	%o0
	add	%i4,	0x19C3,	%g6
	fmovdneg	%icc,	%f19,	%f29
	movpos	%xcc,	%g5,	%g4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f6,	%f0,	%f8
	fmovscc	%icc,	%f25,	%f17
	fcmpgt16	%f12,	%f6,	%i1
	ble,a	%xcc,	loop_2350
	movrgz	%o2,	%g7,	%l3
	fmovdcc	%icc,	%f1,	%f18
	fmovdpos	%icc,	%f5,	%f14
loop_2350:
	st	%f26,	[%l7 + 0x70]
	brgz,a	%l0,	loop_2351
	fmovdle	%icc,	%f13,	%f20
	swap	[%l7 + 0x6C],	%i6
	ta	%icc,	0x6
loop_2351:
	and	%g3,	%o1,	%l5
	andn	%l1,	%o6,	%o7
	popc	%i0,	%i5
	movneg	%xcc,	%l6,	%l2
	array32	%g2,	%i3,	%o5
	tl	%icc,	0x6
	udivcc	%i7,	0x13CA,	%i2
	wr	%g0,	0x27,	%asi
	stxa	%g1,	[%l7 + 0x48] %asi
	membar	#Sync
	addcc	%o3,	%l4,	%o0
	fba,a	%fcc1,	loop_2352
	fmovsl	%icc,	%f19,	%f0
	set	0x40, %g3
	stda	%f16,	[%l7 + %g3] 0x80
loop_2352:
	bneg,pn	%xcc,	loop_2353
	lduw	[%l7 + 0x3C],	%o4
	xnor	%g6,	%g5,	%i4
	std	%f30,	[%l7 + 0x48]
loop_2353:
	fmovrsgz	%i1,	%f7,	%f31
	subc	%g4,	0x0932,	%o2
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f12
	set	0x08, %i4
	lduwa	[%l7 + %i4] 0x80,	%g7
	flush	%l7 + 0x78
	movcs	%xcc,	%l0,	%l3
	fmuld8sux16	%f10,	%f10,	%f24
	sub	%g3,	%o1,	%i6
	subc	%l1,	%l5,	%o6
	movg	%icc,	%o7,	%i5
	andncc	%l6,	%i0,	%l2
	mulscc	%g2,	0x0561,	%i3
	bneg,a	%icc,	loop_2354
	ldub	[%l7 + 0x32],	%o5
	fcmpne32	%f14,	%f6,	%i2
	tn	%icc,	0x1
loop_2354:
	sllx	%g1,	0x1D,	%i7
	tgu	%icc,	0x5
	movcs	%xcc,	%l4,	%o0
	xnor	%o3,	0x0760,	%g6
	nop
	setx	loop_2355,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	movgu	%icc,	%g5,	%o4
	sll	%i1,	0x13,	%i4
	lduw	[%l7 + 0x64],	%o2
loop_2355:
	movpos	%xcc,	%g7,	%l0
	edge16n	%g4,	%l3,	%o1
	xorcc	%i6,	0x0F4F,	%g3
	movre	%l1,	%l5,	%o6
	movl	%icc,	%o7,	%i5
	fmuld8ulx16	%f5,	%f20,	%f4
	movge	%xcc,	%l6,	%l2
	movrgez	%g2,	%i3,	%i0
	edge32n	%o5,	%i2,	%i7
	udivcc	%l4,	0x0AF7,	%o0
	edge16	%o3,	%g1,	%g5
	tcs	%icc,	0x4
	fmovdgu	%icc,	%f26,	%f26
	movrlz	%g6,	0x2C4,	%i1
	umul	%o4,	%o2,	%g7
	fcmpne16	%f6,	%f18,	%i4
	bneg	loop_2356
	taddcc	%l0,	0x171F,	%g4
	addccc	%l3,	0x03ED,	%i6
	addccc	%g3,	%l1,	%o1
loop_2356:
	fmovsneg	%icc,	%f13,	%f9
	addc	%o6,	%l5,	%o7
	udivcc	%i5,	0x0D43,	%l2
	xnor	%g2,	0x03DB,	%i3
	ldub	[%l7 + 0x08],	%l6
	tle	%icc,	0x5
	stx	%i0,	[%l7 + 0x60]
	sra	%i2,	0x07,	%i7
	fpadd16	%f14,	%f24,	%f10
	nop
	setx	0x605F5571,	%l0,	%l6
	st	%l6,	[%l7 + 0x50]
	ld	[%l7 + 0x50],	%fsr
	movgu	%icc,	%l4,	%o5
	andn	%o0,	0x095B,	%g1
	fmovdle	%icc,	%f23,	%f10
	nop
	fitos	%f9,	%f11
	fstox	%f11,	%f26
	fxtos	%f26,	%f4
	addc	%g5,	0x1F98,	%g6
	fmovdpos	%xcc,	%f16,	%f23
	movleu	%icc,	%o3,	%o4
	subc	%o2,	0x1D0B,	%i1
	set	0x5C, %o4
	lduha	[%l7 + %o4] 0x19,	%i4
	srl	%l0,	%g4,	%l3
	fbule	%fcc0,	loop_2357
	srlx	%i6,	%g3,	%g7
	udivx	%o1,	0x0F6E,	%l1
	array32	%l5,	%o7,	%i5
loop_2357:
	edge32	%o6,	%l2,	%g2
	sub	%i3,	0x0828,	%i0
	array16	%l6,	%i2,	%i7
	mulscc	%l4,	0x0B2D,	%o0
	edge32ln	%g1,	%g5,	%g6
	srax	%o5,	%o4,	%o3
	brz,a	%o2,	loop_2358
	addcc	%i1,	%l0,	%g4
	sdiv	%l3,	0x1B40,	%i6
	sdiv	%g3,	0x034D,	%g7
loop_2358:
	nop
	fitos	%f12,	%f11
	fstox	%f11,	%f10
	fxtos	%f10,	%f5
	array32	%i4,	%l1,	%l5
	addccc	%o7,	%o1,	%i5
	xor	%l2,	%g2,	%i3
	tcc	%xcc,	0x3
	alignaddrl	%o6,	%l6,	%i2
	fmovdleu	%icc,	%f28,	%f23
	fmovsleu	%xcc,	%f19,	%f24
	fbug,a	%fcc1,	loop_2359
	movrgz	%i0,	0x2E4,	%l4
	edge16ln	%o0,	%g1,	%i7
	xorcc	%g6,	0x04A4,	%g5
loop_2359:
	nop
	set	0x2C, %l1
	lduha	[%l7 + %l1] 0x0c,	%o4
	fmovsne	%icc,	%f15,	%f9
	orn	%o3,	%o5,	%o2
	nop
	setx loop_2360, %l0, %l1
	jmpl %l1, %i1
	udiv	%g4,	0x024D,	%l0
	or	%l3,	%g3,	%g7
	udivcc	%i4,	0x007F,	%l1
loop_2360:
	srlx	%i6,	0x08,	%l5
	movne	%icc,	%o7,	%i5
	tcc	%icc,	0x7
	tge	%xcc,	0x4
	array8	%o1,	%g2,	%l2
	nop
	setx	0x660781C3,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xC2B42D54,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f8
	fmuls	%f8,	%f30,	%f26
	movcc	%icc,	%o6,	%i3
	xnor	%l6,	0x01ED,	%i2
	wr	%g0,	0x11,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	tsubcctv	%l4,	%i0,	%g1
	sub	%i7,	0x0C6E,	%o0
	udivcc	%g5,	0x1DDF,	%o4
	nop
	fitos	%f3,	%f1
	fstox	%f1,	%f4
	fxtos	%f4,	%f13
	te	%icc,	0x6
	sub	%o3,	%g6,	%o2
	mulx	%i1,	%g4,	%l0
	fzero	%f22
	ldx	[%l7 + 0x48],	%l3
	alignaddr	%g3,	%g7,	%i4
	tl	%icc,	0x1
	fbl,a	%fcc2,	loop_2361
	fpmerge	%f17,	%f6,	%f0
	tcs	%xcc,	0x6
	movleu	%icc,	%o5,	%l1
loop_2361:
	movleu	%icc,	%l5,	%o7
	wr	%g0,	0x89,	%asi
	stxa	%i5,	[%l7 + 0x10] %asi
	fmovdcs	%xcc,	%f9,	%f8
	brgz,a	%i6,	loop_2362
	fcmpne32	%f22,	%f30,	%o1
	set	0x30, %i0
	ldda	[%l7 + %i0] 0x14,	%g2
loop_2362:
	andcc	%l2,	%o6,	%l6
	tle	%xcc,	0x1
	fmovdne	%icc,	%f29,	%f28
	tneg	%xcc,	0x6
	sdivx	%i2,	0x032D,	%l4
	edge16ln	%i3,	%i0,	%i7
	mulx	%g1,	%o0,	%g5
	tneg	%icc,	0x6
	orn	%o4,	0x1D26,	%g6
	movleu	%icc,	%o2,	%i1
	fmovdn	%icc,	%f27,	%f1
	edge16ln	%g4,	%o3,	%l3
	xnorcc	%l0,	%g3,	%i4
	alignaddrl	%o5,	%g7,	%l5
	fble,a	%fcc2,	loop_2363
	movgu	%icc,	%o7,	%i5
	movpos	%icc,	%l1,	%i6
	fcmpgt16	%f2,	%f30,	%o1
loop_2363:
	fsrc2	%f0,	%f30
	and	%l2,	0x07D0,	%o6
	fbl	%fcc2,	loop_2364
	fbo,a	%fcc3,	loop_2365
	taddcc	%l6,	%g2,	%l4
	edge32l	%i2,	%i3,	%i7
loop_2364:
	nop
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x3C] %asi,	%i0
loop_2365:
	nop
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x18] %asi,	%g1
	ba,pn	%xcc,	loop_2366
	movre	%o0,	0x1A7,	%o4
	taddcctv	%g6,	0x1763,	%o2
	edge8ln	%i1,	%g5,	%g4
loop_2366:
	fbule,a	%fcc2,	loop_2367
	stx	%l3,	[%l7 + 0x10]
	movre	%l0,	0x08A,	%g3
	sir	0x076D
loop_2367:
	sub	%o3,	%o5,	%g7
	subc	%i4,	%l5,	%o7
	xnor	%l1,	%i6,	%o1
	tl	%icc,	0x5
	movvs	%icc,	%l2,	%o6
	movvs	%xcc,	%l6,	%g2
	movrlz	%i5,	%l4,	%i3
	set	0x20, %g7
	prefetcha	[%l7 + %g7] 0x19,	 0x1
	udivcc	%i7,	0x01C4,	%i0
	srax	%o0,	0x00,	%g1
	ldd	[%l7 + 0x30],	%g6
	set	0x30, %g6
	prefetcha	[%l7 + %g6] 0x0c,	 0x0
	fcmpne16	%f12,	%f6,	%i1
	tcc	%icc,	0x6
	set	0x2F, %i6
	ldsba	[%l7 + %i6] 0x14,	%o4
	nop
	setx	0xD16C4B05,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f8
	setx	0xF693AD4B,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fmuls	%f11,	%f8,	%f18
	subc	%g5,	0x0596,	%g4
	movvs	%xcc,	%l0,	%l3
	fzero	%f24
	movrne	%g3,	0x25B,	%o3
	movre	%g7,	%i4,	%o5
	sub	%o7,	0x1900,	%l5
	tle	%xcc,	0x7
	movge	%xcc,	%i6,	%l1
	orcc	%l2,	0x12C4,	%o1
	movgu	%xcc,	%o6,	%g2
	sdivcc	%i5,	0x1E26,	%l6
	orcc	%l4,	%i2,	%i7
	ldsh	[%l7 + 0x42],	%i0
	membar	0x16
	fbule	%fcc3,	loop_2368
	fmul8x16al	%f5,	%f27,	%f26
	fmovsvs	%icc,	%f13,	%f13
	tsubcc	%i3,	0x17A7,	%g1
loop_2368:
	mova	%xcc,	%o0,	%o2
	tcs	%icc,	0x0
	brz,a	%g6,	loop_2369
	fmovsge	%xcc,	%f29,	%f2
	sdivx	%i1,	0x1D61,	%o4
	tne	%icc,	0x0
loop_2369:
	movvc	%xcc,	%g4,	%l0
	udivcc	%g5,	0x1937,	%g3
	movle	%xcc,	%l3,	%g7
	movge	%xcc,	%i4,	%o5
	smulcc	%o3,	0x0AB7,	%o7
	fbn,a	%fcc2,	loop_2370
	srax	%l5,	0x18,	%l1
	sth	%l2,	[%l7 + 0x24]
	andn	%o1,	0x0935,	%i6
loop_2370:
	array8	%o6,	%i5,	%l6
	movl	%xcc,	%l4,	%i2
	edge16l	%i7,	%i0,	%i3
	udivcc	%g1,	0x0427,	%o0
	fpackfix	%f8,	%f28
	sllx	%g2,	0x08,	%g6
	fbule,a	%fcc2,	loop_2371
	tcc	%icc,	0x3
	sub	%o2,	0x0E23,	%i1
	andcc	%o4,	0x0D9F,	%g4
loop_2371:
	fmovd	%f0,	%f6
	addccc	%g5,	0x051F,	%l0
	prefetch	[%l7 + 0x70],	 0x0
	membar	0x7F
	udiv	%g3,	0x10EC,	%g7
	tleu	%icc,	0x6
	bn,a	%icc,	loop_2372
	edge32l	%l3,	%o5,	%i4
	edge32n	%o3,	%o7,	%l1
	fone	%f2
loop_2372:
	xor	%l5,	%l2,	%i6
	movl	%icc,	%o6,	%o1
	alignaddrl	%i5,	%l6,	%i2
	tge	%icc,	0x1
	edge16	%i7,	%l4,	%i3
	andcc	%i0,	%o0,	%g2
	edge32	%g1,	%g6,	%i1
	edge8ln	%o4,	%g4,	%o2
	edge16l	%g5,	%l0,	%g7
	set	0x1c0, %i7
	nop 	! 	nop 	! 	ldxa	[%g0 + %i7] 0x40,	%g3 ripped by fixASI40.pl ripped by fixASI40.pl
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x71] %asi,	%l3
	ba	%xcc,	loop_2373
	nop
	setx	loop_2374,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvc	%icc,	0x1
	set	0x79, %l2
	ldstuba	[%l7 + %l2] 0x19,	%o5
loop_2373:
	fabsd	%f8,	%f24
loop_2374:
	ba	loop_2375
	array16	%i4,	%o3,	%l1
	fcmpne16	%f28,	%f20,	%o7
	te	%xcc,	0x6
loop_2375:
	orcc	%l5,	%l2,	%i6
	fble,a	%fcc0,	loop_2376
	movpos	%xcc,	%o1,	%i5
	fxnor	%f18,	%f14,	%f30
	alignaddrl	%l6,	%o6,	%i2
loop_2376:
	move	%icc,	%l4,	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f0,	%f7
	xorcc	%i3,	0x1D86,	%i0
	brlz	%o0,	loop_2377
	fornot2	%f14,	%f28,	%f10
	movrne	%g2,	%g1,	%i1
	movrne	%o4,	0x3C3,	%g6
loop_2377:
	fpackfix	%f6,	%f24
	brlz	%o2,	loop_2378
	tcc	%icc,	0x6
	movge	%icc,	%g4,	%l0
	edge8n	%g7,	%g3,	%g5
loop_2378:
	andcc	%o5,	%l3,	%o3
	tle	%xcc,	0x6
	sir	0x1C1C
	add	%l1,	%o7,	%l5
	orn	%l2,	%i6,	%o1
	tvs	%xcc,	0x7
	edge8ln	%i4,	%l6,	%o6
	srl	%i5,	%l4,	%i2
	lduw	[%l7 + 0x1C],	%i3
	edge32	%i0,	%i7,	%o0
	set	0x5A, %i5
	lduha	[%l7 + %i5] 0x18,	%g1
	fble	%fcc3,	loop_2379
	tle	%xcc,	0x0
	bcc,pt	%icc,	loop_2380
	sdivcc	%g2,	0x01CD,	%i1
loop_2379:
	swap	[%l7 + 0x3C],	%o4
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x08] %asi,	%g6
loop_2380:
	movpos	%icc,	%g4,	%o2
	fnot2	%f10,	%f26
	swap	[%l7 + 0x50],	%l0
	movvc	%xcc,	%g7,	%g3
	brz	%g5,	loop_2381
	edge32n	%l3,	%o5,	%o3
	mulscc	%o7,	%l5,	%l1
	fsrc1	%f26,	%f2
loop_2381:
	ldsb	[%l7 + 0x7C],	%l2
	srax	%i6,	%i4,	%l6
	popc	%o6,	%o1
	xnor	%i5,	%l4,	%i3
	addccc	%i2,	0x1292,	%i0
	fbule	%fcc2,	loop_2382
	bne,a,pt	%icc,	loop_2383
	fmovdvc	%xcc,	%f8,	%f25
	smul	%i7,	%o0,	%g2
loop_2382:
	tle	%icc,	0x3
loop_2383:
	fmovdle	%icc,	%f25,	%f15
	set	0x28, %l5
	lda	[%l7 + %l5] 0x88,	%f19
	bleu,pt	%icc,	loop_2384
	fzeros	%f20
	membar	0x57
	fbg,a	%fcc0,	loop_2385
loop_2384:
	bge,a,pn	%icc,	loop_2386
	fbul,a	%fcc1,	loop_2387
	udivx	%g1,	0x1C97,	%i1
loop_2385:
	fxnor	%f22,	%f24,	%f4
loop_2386:
	mulscc	%o4,	0x1233,	%g4
loop_2387:
	ldd	[%l7 + 0x18],	%o2
	tsubcctv	%g6,	%l0,	%g3
	srax	%g5,	%l3,	%o5
	fmovs	%f25,	%f30
	fbg	%fcc1,	loop_2388
	fandnot1s	%f31,	%f0,	%f5
	prefetch	[%l7 + 0x70],	 0x3
	fbl,a	%fcc1,	loop_2389
loop_2388:
	brlz,a	%g7,	loop_2390
	ba,pt	%icc,	loop_2391
	fandnot2	%f20,	%f0,	%f28
loop_2389:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2390:
	fble	%fcc3,	loop_2392
loop_2391:
	edge8ln	%o7,	%o3,	%l5
	orn	%l1,	0x135E,	%i6
	edge32ln	%i4,	%l2,	%l6
loop_2392:
	udiv	%o1,	0x1F7D,	%i5
	ba,pn	%icc,	loop_2393
	ba,pn	%icc,	loop_2394
	nop
	fitod	%f4,	%f6
	fdtox	%f6,	%f12
	fxtod	%f12,	%f12
	bne,a	loop_2395
loop_2393:
	movrgez	%o6,	%l4,	%i3
loop_2394:
	brgz,a	%i0,	loop_2396
	orn	%i2,	%o0,	%g2
loop_2395:
	bshuffle	%f0,	%f12,	%f2
	andcc	%g1,	0x199F,	%i7
loop_2396:
	bgu,a,pn	%icc,	loop_2397
	fbg,a	%fcc1,	loop_2398
	ldd	[%l7 + 0x48],	%i0
	orn	%g4,	%o2,	%g6
loop_2397:
	edge16l	%l0,	%o4,	%g5
loop_2398:
	smul	%g3,	0x17A9,	%l3
	tvs	%xcc,	0x2
	brnz,a	%g7,	loop_2399
	fmovrde	%o7,	%f12,	%f6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o3,	%l5,	%l1
loop_2399:
	te	%xcc,	0x4
	membar	0x61
	tvs	%xcc,	0x3
	nop
	setx	0xA2E30AEDD3A007F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f10
	fsqrtd	%f10,	%f4
	fand	%f2,	%f16,	%f24
	andn	%o5,	0x03D5,	%i4
	add	%l7,	0x70,	%l6
	wr	%g0,	0x11,	%asi
	lda	[%l6] %asi,	%l2
	casa	[%l6] %asi,	%l2,	%i6
	udiv	%l6,	0x0723,	%i5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x1C] %asi,	%o1
	tgu	%icc,	0x3
	wr	%g0,	0x88,	%asi
	ldswa	[%l7 + 0x30] %asi,	%o6
	tneg	%icc,	0x3
	mulscc	%i3,	%l4,	%i2
	sdiv	%o0,	0x0185,	%i0
	edge16n	%g2,	%i7,	%g1
	fmovrdne	%i1,	%f4,	%f0
	fbn,a	%fcc2,	loop_2400
	fpmerge	%f27,	%f3,	%f4
	bne	%xcc,	loop_2401
	fand	%f18,	%f28,	%f28
loop_2400:
	udiv	%g4,	0x150C,	%o2
	movrlz	%g6,	0x3D4,	%l0
loop_2401:
	edge16n	%g5,	%g3,	%o4
	sll	%l3,	%o7,	%o3
	alignaddr	%l5,	%g7,	%l1
	sdivcc	%o5,	0x0798,	%l2
	and	%i4,	0x1E71,	%i6
	subc	%l6,	%i5,	%o1
	sdivx	%i3,	0x0D81,	%l4
	movgu	%icc,	%o6,	%i2
	fpackfix	%f22,	%f6
	fmul8x16au	%f11,	%f4,	%f24
	edge16ln	%o0,	%i0,	%g2
	fmovdvc	%xcc,	%f4,	%f27
	movrne	%g1,	0x36C,	%i1
	fxnors	%f15,	%f24,	%f21
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	set	0x71, %o2
	stba	%i7,	[%l7 + %o2] 0xe2
	membar	#Sync
	fmovde	%icc,	%f29,	%f21
	fbn,a	%fcc3,	loop_2402
	edge8	%g4,	%o2,	%g6
	addccc	%g5,	0x12A8,	%g3
	umulcc	%o4,	0x19A8,	%l0
loop_2402:
	tgu	%xcc,	0x6
	movge	%icc,	%l3,	%o7
	wr	%g0,	0x24,	%asi
	ldda	[%l7 + 0x20] %asi,	%o2
	fmovdcs	%icc,	%f13,	%f17
	bvs,pn	%icc,	loop_2403
	movcs	%xcc,	%l5,	%l1
	fmul8sux16	%f4,	%f2,	%f6
	fmovrdlz	%o5,	%f14,	%f10
loop_2403:
	movvs	%icc,	%g7,	%l2
	movl	%xcc,	%i6,	%l6
	movl	%xcc,	%i4,	%o1
	fmovde	%xcc,	%f31,	%f31
	edge16l	%i5,	%l4,	%o6
	srlx	%i2,	%o0,	%i0
	fmovsl	%xcc,	%f11,	%f16
	subccc	%g2,	%i3,	%g1
	addcc	%i7,	0x145F,	%i1
	tsubcctv	%g4,	0x1B7A,	%o2
	fsrc1s	%f26,	%f29
	tle	%icc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fbn,a	%fcc3,	loop_2404
	fble,a	%fcc1,	loop_2405
	alignaddr	%g5,	%g3,	%o4
	bleu	loop_2406
loop_2404:
	movn	%xcc,	%g6,	%l3
loop_2405:
	edge8ln	%o7,	%l0,	%l5
	udivcc	%o3,	0x06F4,	%o5
loop_2406:
	bcs	loop_2407
	fpadd32	%f12,	%f26,	%f20
	prefetch	[%l7 + 0x78],	 0x1
	fmovdneg	%icc,	%f21,	%f13
loop_2407:
	nop
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x40] %asi,	%f0
	set	0x14, %g1
	lduwa	[%l7 + %g1] 0x18,	%g7
	bn,pn	%icc,	loop_2408
	fpmerge	%f9,	%f16,	%f0
	mova	%icc,	%l1,	%l2
	fmovscs	%icc,	%f25,	%f13
loop_2408:
	movre	%l6,	%i6,	%o1
	taddcctv	%i4,	%i5,	%o6
	edge16ln	%i2,	%l4,	%o0
	tsubcctv	%g2,	0x0635,	%i3
	sir	0x1CB8
	ba,a,pt	%xcc,	loop_2409
	sdiv	%i0,	0x0A6B,	%i7
	array8	%i1,	%g4,	%o2
	fmovspos	%icc,	%f8,	%f16
loop_2409:
	st	%f13,	[%l7 + 0x38]
	alignaddr	%g1,	%g5,	%o4
	fmovrdlz	%g3,	%f0,	%f6
	umulcc	%l3,	%g6,	%l0
	edge16	%o7,	%o3,	%o5
	stb	%g7,	[%l7 + 0x19]
	bleu	loop_2410
	bneg,a,pn	%icc,	loop_2411
	ldsw	[%l7 + 0x30],	%l1
	fble	%fcc1,	loop_2412
loop_2410:
	edge32l	%l2,	%l5,	%l6
loop_2411:
	movg	%icc,	%o1,	%i4
	move	%icc,	%i5,	%o6
loop_2412:
	movrne	%i2,	%l4,	%o0
	fsrc2s	%f30,	%f15
	brlez,a	%g2,	loop_2413
	edge16ln	%i6,	%i3,	%i0
	fpackfix	%f0,	%f1
	movcs	%icc,	%i1,	%i7
loop_2413:
	mulx	%o2,	%g4,	%g5
	tg	%icc,	0x5
	fpadd32s	%f14,	%f8,	%f5
	xor	%g1,	0x1457,	%g3
	std	%f10,	[%l7 + 0x50]
	fmovrdlz	%o4,	%f28,	%f8
	tneg	%icc,	0x1
	sth	%g6,	[%l7 + 0x26]
	fnands	%f12,	%f12,	%f2
	sdiv	%l3,	0x1AC7,	%o7
	fble	%fcc2,	loop_2414
	movvc	%xcc,	%l0,	%o5
	tsubcc	%o3,	%g7,	%l2
	orn	%l5,	%l6,	%o1
loop_2414:
	movrne	%i4,	%i5,	%o6
	edge16ln	%i2,	%l1,	%l4
	andncc	%g2,	%i6,	%i3
	edge32	%i0,	%o0,	%i1
	nop
	fitos	%f8,	%f9
	fstox	%f9,	%f28
	fxtos	%f28,	%f18
	be,pn	%icc,	loop_2415
	nop
	fitos	%f14,	%f25
	fstox	%f25,	%f0
	alignaddr	%i7,	%g4,	%g5
	movge	%icc,	%o2,	%g3
loop_2415:
	tn	%xcc,	0x0
	sethi	0x1E4B,	%o4
	and	%g6,	%g1,	%l3
	fmovrsgz	%l0,	%f19,	%f17
	tsubcc	%o5,	%o7,	%g7
	tsubcctv	%l2,	0x1355,	%o3
	edge32	%l6,	%l5,	%o1
	brz	%i4,	loop_2416
	movne	%xcc,	%o6,	%i5
	fnegd	%f0,	%f12
	sllx	%i2,	0x05,	%l4
loop_2416:
	smul	%l1,	%g2,	%i6
	movrne	%i0,	0x116,	%i3
	nop
	fitos	%f2,	%f2
	fstoi	%f2,	%f18
	fmovrsne	%i1,	%f19,	%f27
	mulscc	%i7,	0x0C51,	%g4
	or	%g5,	0x0BD6,	%o2
	fmovsa	%icc,	%f31,	%f17
	movgu	%xcc,	%g3,	%o0
	fcmple16	%f14,	%f22,	%g6
	alignaddrl	%o4,	%l3,	%l0
	sub	%g1,	%o7,	%g7
	movvc	%icc,	%l2,	%o5
	sra	%l6,	%o3,	%l5
	sub	%i4,	0x0823,	%o1
	ldstub	[%l7 + 0x4E],	%o6
	xnorcc	%i2,	%l4,	%l1
	movleu	%xcc,	%g2,	%i5
	fmovdgu	%xcc,	%f10,	%f19
	brlz	%i0,	loop_2417
	array16	%i6,	%i1,	%i7
	fmovsleu	%icc,	%f5,	%f28
	andcc	%g4,	0x131D,	%g5
loop_2417:
	ta	%xcc,	0x4
	prefetch	[%l7 + 0x40],	 0x2
	add	%l7,	0x20,	%l6
	wr	%g0,	0x89,	%asi
	lda	[%l6] %asi,	%i3
	casa	[%l6] %asi,	%i3,	%g3
	sll	%o2,	%g6,	%o0
	subcc	%l3,	%o4,	%g1
	bn,pn	%icc,	loop_2418
	orncc	%o7,	%l0,	%g7
	movne	%xcc,	%o5,	%l6
	xnor	%o3,	0x1795,	%l5
loop_2418:
	sub	%i4,	%l2,	%o1
	st	%f10,	[%l7 + 0x58]
	fmovdvc	%icc,	%f24,	%f4
	brgez,a	%o6,	loop_2419
	orcc	%l4,	0x10B3,	%l1
	movne	%xcc,	%i2,	%i5
	sra	%g2,	0x1C,	%i6
loop_2419:
	fandnot2	%f26,	%f16,	%f0
	fmovsge	%xcc,	%f9,	%f6
	fexpand	%f15,	%f20
	movrlez	%i1,	0x077,	%i0
	movrlz	%g4,	0x10C,	%g5
	edge32	%i3,	%g3,	%i7
	tn	%icc,	0x0
	set	0x4A, %o1
	lduba	[%l7 + %o1] 0x15,	%o2
	tgu	%icc,	0x3
	membar	#Sync
	wr	%g0,	0x16,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	subc	%g6,	%l3,	%o0
	bpos	%xcc,	loop_2420
	tne	%xcc,	0x2
	nop
	setx	0x7F82393F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0xF31758D7,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fsubs	%f16,	%f13,	%f4
	movne	%xcc,	%g1,	%o4
loop_2420:
	movle	%xcc,	%o7,	%g7
	movrgez	%l0,	%o5,	%o3
	edge8	%l6,	%l5,	%i4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%o1,	%o6
	movvc	%xcc,	%l4,	%l1
	subccc	%i2,	%l2,	%g2
	bne,a	%xcc,	loop_2421
	bcc,a	%xcc,	loop_2422
	nop
	setx	0xA3FFFB2BC54A391B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f22
	setx	0x602DA90925867EB1,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f22,	%f28
	umulcc	%i5,	0x1CD0,	%i6
loop_2421:
	faligndata	%f20,	%f6,	%f22
loop_2422:
	brgez,a	%i0,	loop_2423
	fblg	%fcc0,	loop_2424
	popc	%g4,	%g5
	bvs,pn	%xcc,	loop_2425
loop_2423:
	movpos	%icc,	%i3,	%g3
loop_2424:
	prefetch	[%l7 + 0x2C],	 0x1
	array8	%i7,	%i1,	%o2
loop_2425:
	subcc	%l3,	%g6,	%o0
	set	0x46, %o6
	stha	%g1,	[%l7 + %o6] 0x2b
	membar	#Sync
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x48] %asi,	 0x0
	edge32	%g7,	%o4,	%l0
	fsrc1	%f4,	%f0
	movge	%xcc,	%o5,	%l6
	or	%l5,	%i4,	%o1
	smulcc	%o3,	0x0CF1,	%o6
	ldd	[%l7 + 0x60],	%f0
	subc	%l4,	0x1B4E,	%i2
	sub	%l2,	%l1,	%g2
	edge32	%i5,	%i0,	%i6
	movg	%icc,	%g4,	%g5
	set	0x40, %l4
	stda	%f16,	[%l7 + %l4] 0xf1
	membar	#Sync
	andncc	%g3,	%i3,	%i7
	prefetch	[%l7 + 0x0C],	 0x3
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitod	%f25,	%f10
	udivx	%i1,	0x0422,	%o2
	xorcc	%l3,	0x0E52,	%o0
	movleu	%xcc,	%g1,	%g6
	sdivcc	%g7,	0x02B2,	%o4
	wr	%g0,	0x81,	%asi
	stwa	%o7,	[%l7 + 0x10] %asi
	flush	%l7 + 0x5C
	movn	%xcc,	%o5,	%l0
	membar	0x0F
	nop
	setx loop_2426, %l0, %l1
	jmpl %l1, %l5
	taddcc	%l6,	%i4,	%o3
	tn	%xcc,	0x1
	xnor	%o1,	0x093D,	%l4
loop_2426:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	lda	[%l6] %asi,	%o6
	casa	[%l6] 0x10,	%o6,	%l2
	fpadd16	%f16,	%f14,	%f26
	edge16	%i2,	%l1,	%i5
	nop
	fitos	%f11,	%f12
	fstoi	%f12,	%f26
	membar	0x69
	nop
	setx	0x95DC350A90491B29,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x1A] %asi,	%i0
	fmul8x16au	%f25,	%f27,	%f28
	fmovdleu	%xcc,	%f5,	%f10
	tne	%xcc,	0x5
	tsubcctv	%g2,	0x0C60,	%g4
	fones	%f21
	smul	%i6,	0x16A6,	%g5
	fnands	%f2,	%f27,	%f1
	fbe	%fcc1,	loop_2427
	movcc	%icc,	%i3,	%g3
	edge32ln	%i7,	%i1,	%o2
	fmul8x16au	%f16,	%f9,	%f10
loop_2427:
	nop
	setx	loop_2428,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	be,pt	%icc,	loop_2429
	nop
	setx	0xFACC96F1,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	setx	0x19B830FB,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f9
	fsubs	%f9,	%f13,	%f6
	fmul8x16	%f1,	%f8,	%f22
loop_2428:
	fbge	%fcc3,	loop_2430
loop_2429:
	fors	%f17,	%f16,	%f8
	xnorcc	%l3,	0x0645,	%g1
	bvs	%icc,	loop_2431
loop_2430:
	add	%g6,	0x1883,	%o0
	sllx	%o4,	0x04,	%o7
	fcmpeq16	%f26,	%f6,	%g7
loop_2431:
	subccc	%o5,	0x1013,	%l5
	array16	%l0,	%i4,	%l6
	fones	%f12
	mova	%xcc,	%o1,	%o3
	movl	%icc,	%l4,	%o6
	movrgez	%l2,	%l1,	%i5
	edge8	%i0,	%i2,	%g4
	ldx	[%l7 + 0x58],	%g2
	sub	%g5,	0x1ECD,	%i3
	fbge	%fcc1,	loop_2432
	array8	%i6,	%i7,	%g3
	umulcc	%o2,	0x11C8,	%l3
	nop
	setx loop_2433, %l0, %l1
	jmpl %l1, %g1
loop_2432:
	bg,a,pn	%xcc,	loop_2434
	stbar
	wr	%g0,	0x19,	%asi
	ldsha	[%l7 + 0x2A] %asi,	%g6
loop_2433:
	sra	%o0,	%i1,	%o4
loop_2434:
	swap	[%l7 + 0x78],	%g7
	fmovrsne	%o7,	%f15,	%f27
	movrlz	%l5,	%o5,	%i4
	movge	%icc,	%l0,	%o1
	fbl,a	%fcc2,	loop_2435
	sdivx	%o3,	0x0EA5,	%l4
	fmovrslz	%o6,	%f3,	%f29
	andcc	%l6,	%l1,	%i5
loop_2435:
	fmuld8sux16	%f24,	%f3,	%f30
	sdivx	%l2,	0x1AAA,	%i0
	movcs	%xcc,	%i2,	%g2
	tpos	%xcc,	0x3
	orncc	%g4,	0x0BBD,	%i3
	te	%xcc,	0x7
	subccc	%i6,	0x0B11,	%g5
	movl	%xcc,	%i7,	%g3
	fmovdvs	%xcc,	%f7,	%f0
	andcc	%o2,	0x0E70,	%l3
	stw	%g6,	[%l7 + 0x14]
	tpos	%xcc,	0x2
	fornot2s	%f29,	%f7,	%f22
	nop
	setx	0x175B447E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x47BCF2A3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fdivs	%f14,	%f11,	%f1
	alignaddrl	%o0,	%i1,	%g1
	sub	%o4,	0x0C81,	%g7
	tle	%xcc,	0x5
	movrlez	%l5,	0x1D1,	%o5
	nop
	fitos	%f0,	%f28
	fstod	%f28,	%f30
	nop
	setx	loop_2436,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	alignaddrl	%o7,	%l0,	%o1
	wr	%g0,	0x88,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
loop_2436:
	movneg	%xcc,	%o3,	%i4
	xorcc	%l4,	0x0F62,	%o6
	add	%l7,	0x70,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] 0x89,	%l6,	%l1
	tneg	%xcc,	0x3
	srlx	%i5,	%l2,	%i0
	fbue	%fcc2,	loop_2437
	fmovsvs	%icc,	%f24,	%f16
	fnegs	%f22,	%f1
	bneg,a	%xcc,	loop_2438
loop_2437:
	srlx	%g2,	0x1A,	%i2
	srl	%i3,	0x0F,	%g4
	fmovdleu	%icc,	%f19,	%f10
loop_2438:
	sll	%i6,	0x19,	%g5
	subcc	%g3,	%i7,	%o2
	movle	%xcc,	%g6,	%l3
	fmovsne	%icc,	%f10,	%f15
	tvc	%xcc,	0x4
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x7C] %asi,	%i1
	set	0x40, %i3
	stda	%f16,	[%l7 + %i3] 0x11
	orcc	%g1,	%o0,	%g7
	sra	%o4,	%l5,	%o5
	edge8	%o7,	%o1,	%o3
	movg	%xcc,	%l0,	%i4
	fnot1s	%f0,	%f27
	subccc	%o6,	%l6,	%l1
	tl	%icc,	0x1
	wr	%g0,	0x10,	%asi
	swapa	[%l7 + 0x58] %asi,	%l4
	fandnot1s	%f9,	%f1,	%f7
	orcc	%l2,	%i5,	%i0
	ldub	[%l7 + 0x53],	%g2
	edge32n	%i2,	%i3,	%i6
	fble	%fcc2,	loop_2439
	array32	%g4,	%g5,	%g3
	fmovsvc	%xcc,	%f20,	%f21
	set	0x60, %o3
	ldda	[%l7 + %o3] 0x89,	%o2
loop_2439:
	fmovsne	%xcc,	%f20,	%f2
	movvc	%xcc,	%g6,	%i7
	andn	%i1,	%g1,	%o0
	edge8	%l3,	%g7,	%l5
	srl	%o4,	0x18,	%o7
	fpackfix	%f30,	%f25
	taddcc	%o5,	%o1,	%l0
	fornot1	%f20,	%f8,	%f24
	array16	%o3,	%i4,	%l6
	tvs	%icc,	0x0
	fba	%fcc2,	loop_2440
	fpsub32	%f2,	%f4,	%f24
	fmovdle	%icc,	%f28,	%f2
	fors	%f10,	%f21,	%f8
loop_2440:
	te	%xcc,	0x4
	set	0x58, %g5
	stha	%o6,	[%l7 + %g5] 0x22
	membar	#Sync
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu,a,pt	%icc,	loop_2441
	edge32	%l4,	%l2,	%l1
	edge32l	%i5,	%g2,	%i0
	fpack32	%f14,	%f6,	%f18
loop_2441:
	xorcc	%i3,	0x14ED,	%i6
	fpsub16s	%f0,	%f20,	%f13
	fbe,a	%fcc1,	loop_2442
	fmovsvc	%icc,	%f26,	%f15
	bne,a	loop_2443
	mova	%xcc,	%g4,	%g5
loop_2442:
	tpos	%icc,	0x4
	lduh	[%l7 + 0x3C],	%i2
loop_2443:
	tge	%icc,	0x3
	nop
	setx loop_2444, %l0, %l1
	jmpl %l1, %g3
	movl	%xcc,	%o2,	%g6
	fmovsvc	%xcc,	%f10,	%f2
	edge32ln	%i1,	%i7,	%o0
loop_2444:
	membar	0x15
	bshuffle	%f0,	%f30,	%f24
	ldsb	[%l7 + 0x55],	%l3
	movne	%icc,	%g1,	%g7
	mulx	%l5,	0x0ECE,	%o7
	orcc	%o4,	0x1228,	%o5
	fnot1	%f26,	%f22
	movg	%icc,	%l0,	%o1
	bcc,pt	%xcc,	loop_2445
	srax	%o3,	0x14,	%l6
	fnands	%f20,	%f20,	%f21
	tneg	%xcc,	0x5
loop_2445:
	sir	0x1F4E
	edge8	%o6,	%l4,	%i4
	fmovsgu	%xcc,	%f8,	%f25
	fzeros	%f4
	fmovspos	%icc,	%f14,	%f30
	fones	%f26
	tvc	%icc,	0x5
	movgu	%icc,	%l1,	%l2
	edge16n	%g2,	%i5,	%i3
	ldd	[%l7 + 0x68],	%f14
	fxnors	%f17,	%f19,	%f31
	swap	[%l7 + 0x10],	%i6
	movre	%g4,	0x1A3,	%g5
	sethi	0x1CAC,	%i2
	smul	%g3,	%i0,	%g6
	fbo,a	%fcc3,	loop_2446
	fsrc1	%f24,	%f6
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2446:
	movre	%o2,	%i1,	%i7
	movrlz	%o0,	%l3,	%g7
	udivcc	%g1,	0x1676,	%l5
	udivcc	%o4,	0x1A64,	%o5
	movle	%xcc,	%l0,	%o7
	fmovsle	%icc,	%f15,	%f11
	brlz	%o3,	loop_2447
	fmovrsne	%o1,	%f16,	%f22
	fxors	%f25,	%f29,	%f20
	sethi	0x18F2,	%l6
loop_2447:
	fabss	%f0,	%f23
	flush	%l7 + 0x20
	mulx	%o6,	0x01C5,	%l4
	set	0x40, %i1
	stda	%f0,	[%l7 + %i1] 0x19
	for	%f24,	%f4,	%f2
	addcc	%i4,	0x1680,	%l1
	movneg	%xcc,	%g2,	%l2
	move	%icc,	%i5,	%i3
	movrgz	%g4,	0x11C,	%i6
	ldsw	[%l7 + 0x30],	%g5
	fbn,a	%fcc2,	loop_2448
	movvc	%xcc,	%g3,	%i2
	set	0x59, %g2
	stba	%g6,	[%l7 + %g2] 0x88
loop_2448:
	movcs	%xcc,	%o2,	%i1
	sdivx	%i7,	0x1272,	%i0
	stbar
	sir	0x182F
	sethi	0x0CC9,	%l3
	fmovde	%xcc,	%f19,	%f27
	fbne	%fcc1,	loop_2449
	fpsub32s	%f17,	%f23,	%f25
	edge32l	%o0,	%g7,	%l5
	xorcc	%o4,	%g1,	%l0
loop_2449:
	movrlz	%o5,	0x31C,	%o3
	set	0x40, %g4
	stda	%f16,	[%l7 + %g4] 0x80
	bn,pn	%xcc,	loop_2450
	tsubcc	%o1,	%l6,	%o7
	andcc	%o6,	0x180B,	%l4
	add	%l1,	%g2,	%l2
loop_2450:
	brgez,a	%i5,	loop_2451
	tsubcctv	%i4,	0x1881,	%g4
	set	0x33, %l0
	ldstuba	[%l7 + %l0] 0x10,	%i3
loop_2451:
	brlez,a	%i6,	loop_2452
	edge32ln	%g3,	%g5,	%g6
	movrlz	%o2,	0x0C9,	%i2
	nop
	set	0x28, %o7
	lduh	[%l7 + %o7],	%i7
loop_2452:
	mulx	%i0,	%l3,	%i1
	mulscc	%g7,	0x0C43,	%o0
	ldsh	[%l7 + 0x4A],	%o4
	taddcctv	%g1,	0x0CF6,	%l0
	bgu,pt	%icc,	loop_2453
	edge32ln	%o5,	%o3,	%l5
	wr	%g0,	0x18,	%asi
	prefetcha	[%l7 + 0x58] %asi,	 0x0
loop_2453:
	fbu,a	%fcc3,	loop_2454
	sll	%l6,	%o7,	%o6
	move	%xcc,	%l4,	%g2
	and	%l2,	0x06A1,	%l1
loop_2454:
	movne	%xcc,	%i4,	%g4
	taddcctv	%i5,	0x1EEF,	%i6
	edge32	%i3,	%g3,	%g5
	mova	%xcc,	%o2,	%g6
	edge16n	%i7,	%i0,	%l3
	addc	%i2,	%i1,	%g7
	xor	%o0,	%g1,	%l0
	sir	0x01C3
	fpsub16s	%f17,	%f3,	%f4
	ldstub	[%l7 + 0x1C],	%o5
	edge32ln	%o3,	%o4,	%l5
	addcc	%l6,	0x0727,	%o1
	membar	0x03
	tcc	%icc,	0x6
	srl	%o7,	%o6,	%g2
	tne	%xcc,	0x5
	fbn,a	%fcc0,	loop_2455
	subc	%l4,	0x0937,	%l1
	fmovs	%f19,	%f11
	bneg	loop_2456
loop_2455:
	ldsh	[%l7 + 0x1E],	%i4
	subc	%g4,	0x13A6,	%i5
	movne	%icc,	%l2,	%i3
loop_2456:
	fsrc1s	%f18,	%f26
	umul	%i6,	%g3,	%o2
	tsubcctv	%g6,	0x18E4,	%i7
	edge32n	%i0,	%l3,	%i2
	fmovsge	%icc,	%f2,	%f10
	bn,a,pn	%icc,	loop_2457
	movvs	%xcc,	%g5,	%i1
	bshuffle	%f12,	%f26,	%f14
	xor	%g7,	0x1609,	%g1
loop_2457:
	movleu	%xcc,	%l0,	%o0
	sll	%o3,	%o5,	%o4
	srlx	%l6,	%l5,	%o1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o7,	%o6,	%l4
	movvs	%icc,	%l1,	%g2
	bshuffle	%f22,	%f0,	%f24
	fxor	%f26,	%f10,	%f6
	movre	%g4,	0x02F,	%i4
	umulcc	%l2,	%i3,	%i5
	pdist	%f24,	%f6,	%f26
	udivcc	%g3,	0x10AE,	%i6
	wr	%g0,	0x80,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	fmovrdgz	%i7,	%f0,	%f4
	orncc	%i0,	0x1CAC,	%g6
	movre	%i2,	0x0B7,	%g5
	fmovspos	%xcc,	%f8,	%f24
	fmovrdgz	%l3,	%f6,	%f28
	and	%g7,	0x1186,	%i1
	wr	%g0,	0x88,	%asi
	ldsba	[%l7 + 0x1E] %asi,	%g1
	subc	%l0,	0x1543,	%o3
	tleu	%xcc,	0x7
	tcs	%icc,	0x0
	nop
	setx	0x8DCD99EC107EC210,	%l0,	%l6
	stx	%l6,	[%l7 + 0x60]
	ldx	[%l7 + 0x60],	%fsr
	edge32	%o5,	%o4,	%o0
	fpsub16s	%f16,	%f14,	%f4
	tsubcc	%l5,	%o1,	%l6
	movg	%xcc,	%o6,	%o7
	edge16n	%l1,	%g2,	%g4
	bvs	%xcc,	loop_2458
	fbue	%fcc0,	loop_2459
	orn	%l4,	0x04F5,	%i4
	edge8ln	%l2,	%i5,	%g3
loop_2458:
	sub	%i3,	%o2,	%i7
loop_2459:
	movpos	%icc,	%i6,	%g6
	tcs	%icc,	0x1
	bgu	%xcc,	loop_2460
	ldstub	[%l7 + 0x5C],	%i0
	srl	%g5,	0x10,	%i2
	fmovdg	%xcc,	%f0,	%f19
loop_2460:
	subc	%g7,	0x0F68,	%l3
	move	%xcc,	%g1,	%l0
	orncc	%o3,	%i1,	%o4
	orn	%o5,	%l5,	%o0
	fmovsleu	%icc,	%f11,	%f21
	tneg	%icc,	0x1
	ldsh	[%l7 + 0x48],	%o1
	tsubcctv	%o6,	0x1FC2,	%l6
	tsubcctv	%l1,	%g2,	%o7
	movrlz	%l4,	0x333,	%g4
	bcc,pt	%icc,	loop_2461
	taddcctv	%l2,	%i4,	%i5
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%i3
	casxa	[%l6] %asi,	%i3,	%o2
loop_2461:
	mulx	%i7,	%i6,	%g3
	tne	%icc,	0x7
	movneg	%xcc,	%g6,	%i0
	fzero	%f2
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x2A] %asi,	%i2
	andncc	%g7,	%g5,	%g1
	andncc	%l3,	%o3,	%l0
	tgu	%xcc,	0x4
	fmovrdlez	%o4,	%f14,	%f8
	edge16ln	%i1,	%o5,	%l5
	or	%o1,	%o6,	%o0
	edge8ln	%l1,	%g2,	%o7
	stx	%l4,	[%l7 + 0x08]
	movrgz	%l6,	0x066,	%g4
	nop
	setx	loop_2462,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	fitos	%f14,	%f5
	fstox	%f5,	%f6
	fxtos	%f6,	%f5
	nop
	setx	0xB04F520B,	%l0,	%l6
	st	%l6,	[%l7 + 0x1C]
	ld	[%l7 + 0x1C],	%fsr
	addccc	%i4,	%i5,	%l2
loop_2462:
	sra	%o2,	0x0E,	%i3
	edge32	%i6,	%i7,	%g6
	fnor	%f12,	%f10,	%f24
	bg,pn	%xcc,	loop_2463
	fpadd16s	%f16,	%f31,	%f16
	and	%g3,	%i0,	%i2
	popc	0x0CDC,	%g5
loop_2463:
	tneg	%icc,	0x5
	smulcc	%g7,	0x16F6,	%l3
	move	%xcc,	%g1,	%l0
	membar	#Sync
	wr	%g0,	0x1f,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
	orcc	%o4,	0x16CE,	%o3
	umulcc	%i1,	%l5,	%o5
	and	%o1,	0x1160,	%o0
	set	0x74, %o0
	stha	%l1,	[%l7 + %o0] 0xea
	membar	#Sync
	edge16n	%g2,	%o7,	%o6
	orcc	%l4,	%g4,	%l6
	orn	%i4,	0x0E16,	%l2
	array16	%o2,	%i3,	%i5
	array16	%i6,	%g6,	%g3
	fmovsge	%icc,	%f14,	%f24
	edge16	%i7,	%i2,	%g5
	bleu,pt	%icc,	loop_2464
	bgu,a	%xcc,	loop_2465
	stx	%i0,	[%l7 + 0x28]
	membar	0x6E
loop_2464:
	nop
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f16
loop_2465:
	move	%icc,	%l3,	%g7
	tgu	%xcc,	0x5
	fcmpne32	%f14,	%f8,	%l0
	edge32ln	%g1,	%o3,	%i1
	smul	%o4,	0x12C7,	%o5
	sra	%l5,	%o1,	%l1
	popc	0x09EB,	%o0
	sub	%g2,	0x18E5,	%o7
	array16	%l4,	%o6,	%g4
	movge	%xcc,	%i4,	%l2
	tsubcc	%l6,	0x02F0,	%o2
	srlx	%i5,	%i6,	%g6
	fbge	%fcc1,	loop_2466
	bcc,a	%xcc,	loop_2467
	mulscc	%g3,	%i3,	%i7
	tneg	%xcc,	0x2
loop_2466:
	fmovsne	%icc,	%f29,	%f14
loop_2467:
	taddcc	%g5,	%i2,	%l3
	stbar
	sir	0x1DE0
	fbule	%fcc1,	loop_2468
	bne,a,pt	%xcc,	loop_2469
	array32	%i0,	%l0,	%g1
	fbl,a	%fcc0,	loop_2470
loop_2468:
	fnot1s	%f20,	%f7
loop_2469:
	sir	0x0478
	udiv	%g7,	0x063F,	%i1
loop_2470:
	bcs,pn	%xcc,	loop_2471
	edge16ln	%o4,	%o3,	%o5
	andn	%o1,	%l5,	%l1
	nop
	setx	0x008BB693,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f12
	setx	0x2BB23703,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fmuls	%f2,	%f12,	%f27
loop_2471:
	stw	%g2,	[%l7 + 0x30]
	lduh	[%l7 + 0x7A],	%o0
	bg	%xcc,	loop_2472
	brnz	%l4,	loop_2473
	bneg,pn	%xcc,	loop_2474
	ldub	[%l7 + 0x47],	%o6
loop_2472:
	brgz	%g4,	loop_2475
loop_2473:
	sll	%i4,	%o7,	%l2
loop_2474:
	fcmpgt32	%f8,	%f20,	%l6
	edge32	%o2,	%i6,	%g6
loop_2475:
	bvc	loop_2476
	fmul8ulx16	%f6,	%f20,	%f0
	wr	%g0,	0x11,	%asi
	ldsha	[%l7 + 0x52] %asi,	%g3
loop_2476:
	fmovdl	%icc,	%f6,	%f23
	movvs	%xcc,	%i3,	%i7
	edge8	%g5,	%i2,	%i5
	ble,a,pt	%icc,	loop_2477
	edge32ln	%i0,	%l0,	%l3
	fbug	%fcc3,	loop_2478
	tvc	%icc,	0x3
loop_2477:
	movrgz	%g1,	0x28D,	%g7
	tl	%xcc,	0x7
loop_2478:
	addcc	%i1,	%o3,	%o5
	xnor	%o4,	%l5,	%o1
	wr	%g0,	0x10,	%asi
	stwa	%l1,	[%l7 + 0x34] %asi
	andn	%o0,	0x02AC,	%l4
	sll	%g2,	%o6,	%i4
	fbg,a	%fcc2,	loop_2479
	fmovdvc	%xcc,	%f26,	%f12
	fbn,a	%fcc2,	loop_2480
	movn	%xcc,	%o7,	%l2
loop_2479:
	fmovsne	%xcc,	%f20,	%f7
	bneg,a	loop_2481
loop_2480:
	fpsub16	%f26,	%f6,	%f12
	edge32	%g4,	%o2,	%l6
	udiv	%i6,	0x1836,	%g6
loop_2481:
	nop
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x50] %asi,	%i3
	edge8l	%i7,	%g3,	%g5
	fmovrse	%i5,	%f5,	%f13
	fornot2s	%f9,	%f5,	%f10
	fmovdvc	%icc,	%f6,	%f4
	tpos	%xcc,	0x5
	wr	%g0,	0x80,	%asi
	stxa	%i2,	[%l7 + 0x70] %asi
	tpos	%icc,	0x6
	stw	%i0,	[%l7 + 0x70]
	fxnors	%f28,	%f30,	%f12
	tsubcctv	%l0,	0x0EC7,	%g1
	fornot2	%f24,	%f6,	%f10
	xor	%l3,	0x07FC,	%i1
	edge16l	%g7,	%o5,	%o4
	movrgez	%o3,	0x108,	%l5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x28] %asi,	 0x0
	movrlez	%o0,	%o1,	%l4
	set	0x0A, %l3
	ldsha	[%l7 + %l3] 0x81,	%o6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	wr	%g0,	0x0c,	%asi
	lduba	[%l7 + 0x17] %asi,	%g2
	stbar
	ldd	[%l7 + 0x38],	%f10
	tgu	%icc,	0x5
	sll	%i4,	0x1A,	%l2
	edge32ln	%o7,	%g4,	%o2
	edge32l	%i6,	%g6,	%l6
	smul	%i3,	%i7,	%g3
	orcc	%g5,	0x1768,	%i2
	edge8n	%i0,	%l0,	%i5
	ldsh	[%l7 + 0x1E],	%l3
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x30] %asi,	%f8
	membar	0x2A
	ble	%xcc,	loop_2482
	fpackfix	%f8,	%f29
	edge16	%i1,	%g7,	%g1
	ldsh	[%l7 + 0x74],	%o5
loop_2482:
	mulx	%o3,	0x1909,	%l5
	fmovsneg	%icc,	%f1,	%f25
	edge32n	%l1,	%o4,	%o1
	movleu	%xcc,	%o0,	%l4
	addccc	%o6,	%g2,	%i4
	edge32ln	%o7,	%g4,	%l2
	set	0x18, %i2
	stha	%o2,	[%l7 + %i2] 0xe3
	membar	#Sync
	bvs,pt	%xcc,	loop_2483
	tvc	%icc,	0x7
	set	0x62, %o5
	ldsba	[%l7 + %o5] 0x15,	%i6
loop_2483:
	taddcctv	%l6,	%g6,	%i3
	tle	%icc,	0x0
	taddcctv	%i7,	%g3,	%i2
	ldx	[%l7 + 0x28],	%i0
	fbue	%fcc3,	loop_2484
	fmovdleu	%icc,	%f7,	%f7
	nop
	fitod	%f2,	%f20
	fdtox	%f20,	%f0
	fmovsge	%xcc,	%f22,	%f26
loop_2484:
	umul	%l0,	%g5,	%l3
	fmovsneg	%xcc,	%f14,	%f7
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x4C] %asi,	%i5
	brlz,a	%g7,	loop_2485
	fnot1s	%f23,	%f0
	tleu	%xcc,	0x0
	edge8n	%g1,	%o5,	%o3
loop_2485:
	fxnor	%f26,	%f22,	%f22
	taddcc	%i1,	%l5,	%l1
	nop
	fitos	%f10,	%f23
	fbul	%fcc2,	loop_2486
	fmovsa	%xcc,	%f26,	%f5
	pdist	%f30,	%f0,	%f8
	edge16	%o4,	%o0,	%l4
loop_2486:
	bcs,a	%xcc,	loop_2487
	brnz	%o1,	loop_2488
	fzeros	%f9
	fmovsge	%icc,	%f25,	%f29
loop_2487:
	fandnot1	%f22,	%f12,	%f6
loop_2488:
	ta	%xcc,	0x1
	andcc	%g2,	0x0BA4,	%o6
	ta	%xcc,	0x1
	bcc,a	loop_2489
	fmovrse	%i4,	%f11,	%f18
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bleu	%xcc,	loop_2490
loop_2489:
	xor	%o7,	0x1E17,	%l2
	ldx	[%l7 + 0x28],	%g4
	fba,a	%fcc1,	loop_2491
loop_2490:
	fmovrsgz	%i6,	%f13,	%f15
	wr	%g0,	0x0c,	%asi
	sta	%f14,	[%l7 + 0x20] %asi
loop_2491:
	edge32l	%l6,	%o2,	%g6
	fnegd	%f24,	%f12
	edge16n	%i7,	%g3,	%i3
	movrgz	%i0,	%i2,	%l0
	set	0x64, %l6
	ldsha	[%l7 + %l6] 0x19,	%g5
	orncc	%l3,	%i5,	%g7
	brlz	%o5,	loop_2492
	movl	%xcc,	%o3,	%g1
	sra	%i1,	0x1E,	%l5
	fbn,a	%fcc1,	loop_2493
loop_2492:
	nop
	setx	0x4EAD9AF0B74A1799,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0xD762C8E6694E679F,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fdivd	%f8,	%f0,	%f22
	addc	%l1,	0x0C27,	%o4
	bcs	%xcc,	loop_2494
loop_2493:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o0,	%l4
	movne	%xcc,	%o1,	%g2
loop_2494:
	nop
	fitod	%f3,	%f24
	addc	%o6,	0x047B,	%o7
	fbe,a	%fcc3,	loop_2495
	nop
	setx	loop_2496,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcctv	%l2,	0x1347,	%g4
	sdiv	%i4,	0x1B89,	%i6
loop_2495:
	nop
	set	0x48, %g3
	stwa	%o2,	[%l7 + %g3] 0x2b
	membar	#Sync
loop_2496:
	alignaddr	%l6,	%g6,	%i7
	fmovspos	%icc,	%f25,	%f24
	or	%g3,	%i3,	%i0
	fabss	%f27,	%f12
	nop
	set	0x18, %i4
	lduw	[%l7 + %i4],	%i2
	fpadd16s	%f31,	%f21,	%f23
	fmovse	%icc,	%f6,	%f16
	brnz	%g5,	loop_2497
	sub	%l0,	0x1A8A,	%i5
	fpmerge	%f20,	%f2,	%f0
	taddcctv	%l3,	%o5,	%g7
loop_2497:
	nop
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x5C] %asi,	%o3
	addcc	%i1,	%l5,	%g1
	nop
	fitod	%f0,	%f10
	fdtoi	%f10,	%f21
	tvs	%xcc,	0x5
	wr	%g0,	0x19,	%asi
	prefetcha	[%l7 + 0x08] %asi,	 0x0
	and	%o4,	0x1BD5,	%o0
	edge16	%l4,	%o1,	%o6
	and	%o7,	0x0EAE,	%l2
	addc	%g2,	%g4,	%i6
	sir	0x07D1
	nop
	setx	0x1054D524,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	bge,a,pt	%icc,	loop_2498
	array32	%o2,	%l6,	%i4
	bge	loop_2499
	fsrc1	%f18,	%f20
loop_2498:
	xor	%g6,	0x0336,	%i7
	tge	%xcc,	0x7
loop_2499:
	alignaddr	%g3,	%i0,	%i2
	sllx	%g5,	0x0C,	%i3
	tge	%icc,	0x7
	fandnot2	%f18,	%f6,	%f10
	ldsw	[%l7 + 0x58],	%i5
	popc	%l0,	%l3
	set	0x5C, %o4
	lduwa	[%l7 + %o4] 0x11,	%o5
	alignaddr	%g7,	%i1,	%l5
	movge	%xcc,	%o3,	%l1
	mova	%icc,	%o4,	%g1
	sdivx	%l4,	0x151C,	%o0
	taddcc	%o6,	0x0861,	%o1
	smul	%l2,	0x1FC9,	%o7
	bne	%xcc,	loop_2500
	fcmple32	%f14,	%f22,	%g2
	nop
	setx	0x8571513E706C8894,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0x68B8CADF0BF8CBB9,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f24,	%f6
	set	0x24, %i0
	ldstuba	[%l7 + %i0] 0x04,	%i6
loop_2500:
	lduh	[%l7 + 0x1C],	%o2
	sth	%l6,	[%l7 + 0x62]
	movrne	%g4,	%i4,	%g6
	sdivcc	%i7,	0x0D2C,	%i0
	edge8n	%i2,	%g3,	%i3
	membar	0x28
	set	0x12, %g7
	ldsha	[%l7 + %g7] 0x04,	%g5
	tg	%xcc,	0x5
	set	0x1E, %l1
	lduha	[%l7 + %l1] 0x11,	%l0
	tgu	%icc,	0x6
	mulscc	%i5,	0x1FA3,	%l3
	mova	%xcc,	%o5,	%g7
	addccc	%i1,	%o3,	%l5
	fxor	%f6,	%f20,	%f10
	srl	%o4,	%g1,	%l4
	tsubcctv	%o0,	0x1F6F,	%o6
	taddcc	%l1,	%o1,	%o7
	subcc	%l2,	%g2,	%i6
	edge32	%o2,	%l6,	%g4
	set	0x60, %i6
	lda	[%l7 + %i6] 0x18,	%f20
	tge	%xcc,	0x6
	orn	%i4,	0x1814,	%i7
	movrlz	%g6,	0x11C,	%i2
	set	0x70, %g6
	ldswa	[%l7 + %g6] 0x14,	%g3
	fmovrsgez	%i3,	%f2,	%f27
	edge16n	%i0,	%g5,	%l0
	movvs	%icc,	%i5,	%l3
	movrlez	%o5,	0x1F6,	%g7
	fornot1	%f28,	%f10,	%f6
	subc	%o3,	0x1F9C,	%i1
	fmovdcs	%icc,	%f11,	%f22
	st	%f27,	[%l7 + 0x08]
	subc	%o4,	0x197D,	%l5
	bge,pn	%xcc,	loop_2501
	srlx	%g1,	0x1D,	%l4
	edge16n	%o0,	%l1,	%o6
	movl	%xcc,	%o1,	%l2
loop_2501:
	tneg	%xcc,	0x2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g2,	[%l7 + 0x34]
	xnor	%i6,	%o2,	%o7
	mulscc	%g4,	%i4,	%i7
	fmovsgu	%xcc,	%f18,	%f29
	nop
	fitod	%f17,	%f22
	srlx	%l6,	%i2,	%g3
	bg	%icc,	loop_2502
	movrgz	%g6,	0x2DB,	%i3
	nop
	setx	0x076D459EB7C7B27E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	fsqrtd	%f20,	%f14
	bshuffle	%f12,	%f16,	%f26
loop_2502:
	stb	%g5,	[%l7 + 0x1F]
	xnor	%i0,	%i5,	%l3
	nop
	setx	loop_2503,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sllx	%l0,	%o5,	%g7
	bvc,a,pn	%icc,	loop_2504
	movrlz	%i1,	0x31F,	%o3
loop_2503:
	sth	%o4,	[%l7 + 0x30]
	fmovsvc	%xcc,	%f16,	%f18
loop_2504:
	smul	%l5,	%l4,	%o0
	fbge,a	%fcc1,	loop_2505
	smulcc	%l1,	%g1,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o6,	%g2,	%i6
loop_2505:
	fmovsa	%icc,	%f5,	%f1
	nop
	setx	0x92F062A8C0426891,	%l0,	%l6
	stx	%l6,	[%l7 + 0x10]
	ldx	[%l7 + 0x10],	%fsr
	set	0x40, %i7
	stda	%f16,	[%l7 + %i7] 0xf1
	membar	#Sync
	or	%l2,	0x05BC,	%o2
	ta	%icc,	0x4
	tle	%icc,	0x2
	addcc	%g4,	0x1E1C,	%i4
	edge16	%i7,	%o7,	%l6
	brgez	%g3,	loop_2506
	fpack16	%f4,	%f2
	movle	%xcc,	%i2,	%g6
	mulscc	%i3,	0x1962,	%g5
loop_2506:
	fnors	%f9,	%f9,	%f11
	brlz	%i5,	loop_2507
	bvc,a,pt	%xcc,	loop_2508
	movrgez	%l3,	%l0,	%i0
	fpadd32s	%f27,	%f21,	%f12
loop_2507:
	bn,pt	%icc,	loop_2509
loop_2508:
	fsrc2	%f8,	%f16
	wr	%g0,	0x16,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	membar	#Sync
loop_2509:
	movrgez	%g7,	0x2DE,	%o5
	sll	%o3,	0x1D,	%o4
	edge8ln	%l5,	%l4,	%o0
	umulcc	%i1,	0x1C2D,	%l1
	sdivcc	%g1,	0x0BE9,	%o1
	tleu	%xcc,	0x6
	movcc	%icc,	%o6,	%i6
	andcc	%l2,	0x18F4,	%g2
	edge32l	%g4,	%i4,	%i7
	set	0x2C, %l2
	stwa	%o2,	[%l7 + %l2] 0x2f
	membar	#Sync
	movrlz	%l6,	0x21A,	%o7
	udivcc	%i2,	0x003F,	%g6
	fmovse	%icc,	%f11,	%f13
	fbge	%fcc3,	loop_2510
	nop
	fitod	%f12,	%f22
	fdtoi	%f22,	%f10
	bcs,a	%xcc,	loop_2511
	taddcc	%g3,	%i3,	%g5
loop_2510:
	udiv	%i5,	0x12CE,	%l3
	movrlez	%l0,	0x34C,	%g7
loop_2511:
	nop
	set	0x20, %i5
	ldsb	[%l7 + %i5],	%o5
	addc	%o3,	0x0D1F,	%o4
	movcc	%xcc,	%l5,	%l4
	fpack16	%f4,	%f31
	bleu	loop_2512
	fxors	%f22,	%f20,	%f8
	sra	%o0,	0x0E,	%i0
	subc	%l1,	%i1,	%o1
loop_2512:
	tsubcctv	%o6,	%g1,	%i6
	nop
	setx	0xD25BC04941B7424F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f26
	fsqrtd	%f26,	%f10
	fornot1s	%f23,	%f18,	%f31
	edge8l	%l2,	%g2,	%g4
	fbule	%fcc2,	loop_2513
	nop
	setx	0xDC28BAFB,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f20
	setx	0xFF4CA7CE,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f14
	fsubs	%f14,	%f20,	%f19
	tgu	%icc,	0x7
	fmovsn	%icc,	%f13,	%f21
loop_2513:
	fpack32	%f6,	%f4,	%f30
	ldsw	[%l7 + 0x50],	%i4
	subccc	%i7,	%o2,	%l6
	srl	%o7,	%g6,	%g3
	movrgez	%i3,	0x051,	%i2
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x60] %asi,	%g5
	be,a	%xcc,	loop_2514
	fmuld8ulx16	%f9,	%f19,	%f14
	xnorcc	%l3,	0x15EE,	%l0
	movrgz	%i5,	0x020,	%g7
loop_2514:
	movcc	%xcc,	%o3,	%o4
	movvs	%icc,	%o5,	%l5
	fbuge,a	%fcc3,	loop_2515
	movpos	%icc,	%l4,	%o0
	edge32	%i0,	%i1,	%o1
	nop
	setx	0x80485EB1,	%l0,	%l6
	st	%l6,	[%l7 + 0x20]
	ld	[%l7 + 0x20],	%fsr
loop_2515:
	tl	%icc,	0x0
	fba,a	%fcc1,	loop_2516
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%l0
	addccc	%o6,	0x1AAB,	%i6
	fabsd	%f10,	%f0
loop_2516:
	sdivcc	%l2,	0x016C,	%g2
	wr	%g0,	0x88,	%asi
	lduwa	[%l7 + 0x20] %asi,	%g4
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x6B] %asi,	%i4
	std	%f18,	[%l7 + 0x50]
	movgu	%xcc,	%g1,	%o2
	fmovsl	%xcc,	%f18,	%f30
	alignaddr	%l6,	%o7,	%g6
	movn	%xcc,	%g3,	%i7
	move	%icc,	%i3,	%g5
	edge32	%l3,	%i2,	%l0
	bl,a,pt	%icc,	loop_2517
	movg	%xcc,	%i5,	%o3
	sdivcc	%g7,	0x146F,	%o5
	fbn,a	%fcc2,	loop_2518
loop_2517:
	bcc,pn	%icc,	loop_2519
	fbuge	%fcc0,	loop_2520
	sll	%o4,	%l5,	%l4
loop_2518:
	nop
	set	0x4C, %l5
	ldsha	[%l7 + %l5] 0x0c,	%i0
loop_2519:
	tn	%icc,	0x3
loop_2520:
	subcc	%o0,	0x048D,	%o1
	umulcc	%l1,	0x1680,	%o6
	ble	%icc,	loop_2521
	fba,a	%fcc0,	loop_2522
	bl,a	%xcc,	loop_2523
	tsubcctv	%i6,	0x0009,	%i1
loop_2521:
	or	%l2,	0x1373,	%g4
loop_2522:
	tn	%icc,	0x1
loop_2523:
	movrgz	%g2,	%g1,	%o2
	movleu	%icc,	%l6,	%o7
	set	0x32, %g1
	stha	%g6,	[%l7 + %g1] 0xea
	membar	#Sync
	membar	#Sync
	wr	%g0,	0x1e,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	tge	%xcc,	0x7
	ldub	[%l7 + 0x1B],	%i4
	ldsb	[%l7 + 0x13],	%g3
	edge16	%i3,	%g5,	%i7
	sth	%i2,	[%l7 + 0x7E]
	andcc	%l3,	0x0196,	%i5
	edge8l	%o3,	%l0,	%o5
	wr	%g0,	0x11,	%asi
	stxa	%o4,	[%l7 + 0x08] %asi
	fmovsne	%icc,	%f25,	%f25
	movrgz	%g7,	0x299,	%l5
	bneg,a,pt	%xcc,	loop_2524
	orncc	%i0,	0x09DB,	%l4
	xnor	%o0,	0x184F,	%o1
	fmovdle	%xcc,	%f6,	%f23
loop_2524:
	bgu,pt	%xcc,	loop_2525
	be,a,pt	%xcc,	loop_2526
	srlx	%o6,	0x14,	%i6
	movge	%xcc,	%i1,	%l2
loop_2525:
	movne	%icc,	%l1,	%g4
loop_2526:
	tle	%xcc,	0x6
	wr	%g0,	0x80,	%asi
	lduba	[%l7 + 0x3D] %asi,	%g1
	array16	%g2,	%l6,	%o7
	fmovrslz	%o2,	%f2,	%f11
	taddcctv	%i4,	%g6,	%g3
	fandnot2	%f20,	%f22,	%f6
	fmovrse	%i3,	%f22,	%f18
	fmovsleu	%xcc,	%f20,	%f19
	fcmpeq16	%f10,	%f22,	%g5
	fmovrdlz	%i7,	%f18,	%f28
	fmul8x16au	%f29,	%f20,	%f30
	sir	0x1B9D
	bvc,a,pt	%xcc,	loop_2527
	edge32	%l3,	%i2,	%i5
	movre	%o3,	0x1FC,	%o5
	movcs	%xcc,	%o4,	%l0
loop_2527:
	bg,a,pn	%xcc,	loop_2528
	array16	%l5,	%g7,	%i0
	tcc	%xcc,	0x2
	nop
	setx	0x3FA0974F27B56C23,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0x51864B8809E69A29,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f14
	faddd	%f14,	%f2,	%f2
loop_2528:
	st	%f25,	[%l7 + 0x78]
	movg	%xcc,	%l4,	%o1
	movrgz	%o0,	%i6,	%o6
	movrne	%i1,	0x02C,	%l2
	smul	%g4,	%g1,	%l1
	nop
	fitod	%f8,	%f28
	fdtos	%f28,	%f14
	fbue,a	%fcc1,	loop_2529
	fands	%f8,	%f10,	%f28
	fmovse	%xcc,	%f20,	%f22
	ldx	[%l7 + 0x08],	%g2
loop_2529:
	nop
	fitos	%f11,	%f29
	fstoi	%f29,	%f4
	fmovdvs	%icc,	%f8,	%f0
	movrlez	%o7,	0x31A,	%l6
	sra	%o2,	0x09,	%i4
	fsrc2	%f4,	%f30
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x34] %asi,	%g6
	stbar
	mova	%xcc,	%i3,	%g5
	umul	%g3,	0x0376,	%l3
	movn	%icc,	%i2,	%i5
	fmuld8sux16	%f22,	%f21,	%f14
	fmovs	%f12,	%f24
	xnor	%i7,	0x12DF,	%o5
	bl	loop_2530
	movrgz	%o3,	0x026,	%l0
	edge32n	%l5,	%g7,	%i0
	xnor	%o4,	%l4,	%o1
loop_2530:
	move	%xcc,	%i6,	%o0
	fcmple16	%f4,	%f28,	%i1
	fpsub16	%f8,	%f0,	%f14
	movleu	%icc,	%l2,	%g4
	ldsh	[%l7 + 0x12],	%o6
	movle	%xcc,	%l1,	%g2
	membar	0x4E
	fandnot1	%f12,	%f20,	%f2
	fmovdge	%icc,	%f8,	%f8
	subcc	%o7,	0x1CAB,	%l6
	sub	%g1,	%o2,	%g6
	orcc	%i3,	%g5,	%i4
	fnands	%f29,	%f23,	%f5
	fmul8sux16	%f0,	%f16,	%f20
	fbue,a	%fcc0,	loop_2531
	edge16ln	%g3,	%l3,	%i2
	sllx	%i5,	0x11,	%o5
	smul	%o3,	%l0,	%i7
loop_2531:
	popc	%l5,	%i0
	sll	%o4,	0x00,	%l4
	sir	0x10B9
	add	%l7,	0x38,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] %asi,	%g7,	%i6
	fmovdne	%xcc,	%f24,	%f12
	movpos	%xcc,	%o1,	%i1
	orncc	%l2,	%g4,	%o6
	fmul8ulx16	%f2,	%f24,	%f28
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x66] %asi,	%l1
	movcc	%icc,	%o0,	%o7
	call	loop_2532
	edge16	%l6,	%g2,	%o2
	ldsb	[%l7 + 0x5A],	%g1
	pdist	%f22,	%f2,	%f12
loop_2532:
	fmovsle	%xcc,	%f5,	%f8
	nop
	fitos	%f10,	%f31
	fstod	%f31,	%f12
	fbn	%fcc1,	loop_2533
	fmovrde	%i3,	%f10,	%f16
	edge32ln	%g6,	%g5,	%i4
	fblg	%fcc1,	loop_2534
loop_2533:
	fmovrslez	%l3,	%f2,	%f17
	stw	%g3,	[%l7 + 0x40]
	tvc	%icc,	0x5
loop_2534:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i5,	%o5
	movl	%icc,	%o3,	%l0
	fmovrslz	%i2,	%f3,	%f1
	orncc	%l5,	0x1AA9,	%i0
	fnegs	%f23,	%f8
	sllx	%i7,	%o4,	%l4
	call	loop_2535
	movgu	%xcc,	%g7,	%o1
	xor	%i1,	0x1613,	%l2
	fbg	%fcc2,	loop_2536
loop_2535:
	nop
	set	0x27, %o1
	ldub	[%l7 + %o1],	%g4
	movrgz	%o6,	%i6,	%o0
	tgu	%icc,	0x6
loop_2536:
	orncc	%l1,	%o7,	%g2
	movcs	%xcc,	%l6,	%g1
	nop
	setx	0xB39312538B6270F2,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f30
	setx	0xE06CB5334CD8D971,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	fmuld	%f8,	%f30,	%f20
	and	%o2,	%g6,	%i3
	edge8ln	%i4,	%l3,	%g3
	popc	0x0F45,	%i5
	add	%l7,	0x58,	%l6
	wr	%g0,	0x81,	%asi
	ldxa	[%l6] %asi,	%g5
	casxa	[%l6] 0x81,	%g5,	%o3
	fpackfix	%f26,	%f1
	orncc	%o5,	0x092C,	%i2
	bn,a,pt	%icc,	loop_2537
	movvs	%icc,	%l5,	%i0
	nop
	setx	loop_2538,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	sir	0x0E1E
loop_2537:
	sir	0x18A9
	edge32	%l0,	%o4,	%l4
loop_2538:
	fpsub16	%f28,	%f20,	%f24
	bn	loop_2539
	addc	%i7,	%o1,	%i1
	sdiv	%l2,	0x1E0C,	%g4
	fbn	%fcc1,	loop_2540
loop_2539:
	fpack16	%f12,	%f27
	edge32n	%g7,	%i6,	%o0
	stbar
loop_2540:
	movge	%icc,	%l1,	%o6
	fbl	%fcc0,	loop_2541
	move	%xcc,	%o7,	%l6
	movrlz	%g2,	%o2,	%g1
	add	%g6,	0x0FE4,	%i4
loop_2541:
	xnorcc	%i3,	%g3,	%i5
	fmovdgu	%xcc,	%f31,	%f0
	fbo,a	%fcc2,	loop_2542
	fxor	%f10,	%f2,	%f14
	bshuffle	%f28,	%f16,	%f8
	ldstub	[%l7 + 0x74],	%g5
loop_2542:
	nop
	wr	%g0,	0x52,	%asi
	ldxa	[%g0 + 0x210] %asi,	%o3
	bg,pt	%icc,	loop_2543
	edge32ln	%l3,	%o5,	%i2
	bgu,a	loop_2544
	xor	%l5,	0x1A73,	%l0
loop_2543:
	tge	%icc,	0x0
	movvc	%xcc,	%o4,	%l4
loop_2544:
	nop
	set	0x5E, %l4
	lduha	[%l7 + %l4] 0x80,	%i0
	tvc	%xcc,	0x4
	alignaddr	%o1,	%i7,	%l2
	lduh	[%l7 + 0x1C],	%g4
	fbul	%fcc2,	loop_2545
	fands	%f1,	%f27,	%f17
	srlx	%i1,	0x19,	%g7
	be,a	%xcc,	loop_2546
loop_2545:
	ba	loop_2547
	edge16	%o0,	%i6,	%o6
	stw	%o7,	[%l7 + 0x28]
loop_2546:
	fsrc2s	%f16,	%f18
loop_2547:
	fandnot2	%f20,	%f8,	%f10
	nop
	setx	0x4D7B3C52A34013A9,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0x7800CD9CD27BD6D4,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f4,	%f8
	srlx	%l1,	0x1E,	%g2
	sll	%o2,	%l6,	%g6
	fpackfix	%f30,	%f11
	movcc	%icc,	%g1,	%i4
	nop
	setx	0x85E4AC5B0D81478C,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	setx	0xA578A03C1E9B03E8,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f8
	faddd	%f8,	%f8,	%f2
	sllx	%g3,	%i3,	%i5
	subcc	%o3,	%l3,	%g5
	andncc	%i2,	%o5,	%l5
	wr	%g0,	0x18,	%asi
	lduha	[%l7 + 0x58] %asi,	%o4
	fmovsvs	%icc,	%f2,	%f15
	movpos	%xcc,	%l0,	%l4
	umulcc	%o1,	0x012F,	%i0
	andn	%i7,	%g4,	%l2
	andncc	%i1,	%g7,	%i6
	tleu	%xcc,	0x5
	fmovse	%xcc,	%f25,	%f25
	andncc	%o0,	%o7,	%l1
	fbug	%fcc3,	loop_2548
	alignaddr	%g2,	%o2,	%l6
	movrgz	%g6,	0x228,	%g1
	movrgez	%o6,	%i4,	%i3
loop_2548:
	fabsd	%f22,	%f26
	srl	%g3,	0x07,	%o3
	fxor	%f12,	%f10,	%f30
	movn	%xcc,	%i5,	%l3
	tge	%icc,	0x7
	umul	%g5,	%i2,	%o5
	set	0x2A, %i3
	stha	%l5,	[%l7 + %i3] 0xe3
	membar	#Sync
	xnorcc	%l0,	0x00F2,	%l4
	set	0x40, %o3
	ldda	[%l7 + %o3] 0x10,	%f16
	movrlez	%o4,	0x02F,	%o1
	bge,a,pt	%xcc,	loop_2549
	tl	%xcc,	0x3
	alignaddrl	%i7,	%g4,	%l2
	fmul8x16au	%f28,	%f9,	%f16
loop_2549:
	addc	%i0,	%i1,	%g7
	xor	%o0,	0x0E57,	%o7
	bgu	%xcc,	loop_2550
	fbne	%fcc2,	loop_2551
	fbne	%fcc3,	loop_2552
	sethi	0x1225,	%l1
loop_2550:
	fmovs	%f26,	%f26
loop_2551:
	subc	%g2,	%o2,	%i6
loop_2552:
	tsubcc	%g6,	0x11F6,	%g1
	tpos	%icc,	0x4
	bn	%xcc,	loop_2553
	tle	%icc,	0x1
	nop
	fitos	%f4,	%f5
	fstox	%f5,	%f6
	fxtos	%f6,	%f27
	addccc	%l6,	0x13C1,	%i4
loop_2553:
	or	%i3,	%o6,	%o3
	fmovde	%icc,	%f20,	%f18
	move	%xcc,	%g3,	%l3
	nop
	fitod	%f12,	%f4
	fdtos	%f4,	%f22
	udiv	%g5,	0x0B09,	%i5
	brlz,a	%i2,	loop_2554
	tne	%icc,	0x1
	nop
	fitod	%f2,	%f20
	fdtoi	%f20,	%f15
	tn	%xcc,	0x0
loop_2554:
	edge32l	%l5,	%o5,	%l4
	fornot2	%f10,	%f22,	%f6
	movg	%icc,	%l0,	%o4
	set	0x21, %o6
	ldsba	[%l7 + %o6] 0x19,	%i7
	or	%o1,	0x083A,	%l2
	movne	%icc,	%i0,	%i1
	nop
	setx	0x7FF856AC3C5D319F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f8
	fsqrtd	%f8,	%f10
	bcs,pt	%xcc,	loop_2555
	ldd	[%l7 + 0x30],	%f8
	edge16ln	%g7,	%o0,	%g4
	sub	%o7,	0x06F1,	%l1
loop_2555:
	nop
	setx	loop_2556,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	nop
	setx	0xD5751335,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f5
	setx	0xE6BD90EA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f11
	fadds	%f11,	%f5,	%f11
	movle	%xcc,	%o2,	%g2
	sir	0x0BF2
loop_2556:
	nop
	fitos	%f1,	%f17
	fstod	%f17,	%f22
	smulcc	%g6,	0x0869,	%i6
	mova	%xcc,	%l6,	%g1
	edge8	%i3,	%o6,	%i4
	stbar
	movcc	%xcc,	%o3,	%g3
	brgez	%g5,	loop_2557
	nop
	setx	0x1EB7AF09,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xF0E80604,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f10
	fadds	%f10,	%f16,	%f0
	movneg	%icc,	%i5,	%i2
	nop
	setx	0x0AA2F0EBA3A66A7F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	fsqrtd	%f4,	%f22
loop_2557:
	nop
	setx	0x606F0629,	%l0,	%l6
	st	%l6,	[%l7 + 0x60]
	ld	[%l7 + 0x60],	%fsr
	tsubcctv	%l5,	%l3,	%o5
	movgu	%icc,	%l0,	%l4
	fble,a	%fcc3,	loop_2558
	fmul8x16	%f5,	%f4,	%f22
	fmovs	%f12,	%f4
	move	%icc,	%i7,	%o1
loop_2558:
	udiv	%o4,	0x1AE7,	%l2
	fnors	%f5,	%f6,	%f17
	fmul8x16au	%f8,	%f18,	%f4
	fsrc1s	%f30,	%f17
	movrne	%i0,	%i1,	%g7
	nop
	fitos	%f9,	%f18
	fstod	%f18,	%f4
	ldstub	[%l7 + 0x70],	%g4
	mulscc	%o0,	%o7,	%l1
	bpos,a	loop_2559
	andncc	%o2,	%g6,	%i6
	nop
	setx	loop_2560,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movg	%xcc,	%l6,	%g1
loop_2559:
	ldub	[%l7 + 0x7F],	%g2
	ldub	[%l7 + 0x5F],	%i3
loop_2560:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i4,	%o6
	fmovdcs	%xcc,	%f0,	%f17
	movrgez	%o3,	0x0AE,	%g5
	fmovscc	%xcc,	%f1,	%f15
	alignaddr	%g3,	%i5,	%l5
	fpadd32s	%f23,	%f4,	%f30
	orn	%l3,	%o5,	%l0
	fba,a	%fcc1,	loop_2561
	srax	%i2,	0x11,	%l4
	wr	%g0,	0x0c,	%asi
	lduwa	[%l7 + 0x0C] %asi,	%o1
loop_2561:
	sir	0x18D9
	tl	%xcc,	0x0
	tneg	%icc,	0x0
	sir	0x1DD6
	fbul	%fcc2,	loop_2562
	fnot1s	%f25,	%f6
	movrgz	%i7,	0x1F0,	%o4
	srlx	%l2,	0x09,	%i1
loop_2562:
	movgu	%xcc,	%g7,	%i0
	addcc	%g4,	%o7,	%l1
	movne	%xcc,	%o0,	%g6
	fxnor	%f8,	%f18,	%f28
	movn	%icc,	%i6,	%o2
	tcs	%icc,	0x3
	tvs	%xcc,	0x5
	te	%icc,	0x4
	fornot1	%f12,	%f6,	%f0
	tn	%icc,	0x1
	ldd	[%l7 + 0x50],	%f18
	sethi	0x16D6,	%g1
	xnorcc	%l6,	%g2,	%i4
	srlx	%o6,	%i3,	%o3
	edge8	%g3,	%g5,	%l5
	mulx	%i5,	%l3,	%l0
	movgu	%icc,	%i2,	%l4
	array32	%o1,	%o5,	%o4
	movpos	%icc,	%l2,	%i7
	edge16	%i1,	%g7,	%g4
	fbo,a	%fcc0,	loop_2563
	tgu	%xcc,	0x0
	lduh	[%l7 + 0x72],	%i0
	movle	%icc,	%l1,	%o0
loop_2563:
	fmovsle	%xcc,	%f18,	%f2
	sdiv	%o7,	0x1E32,	%i6
	set	0x40, %i1
	swapa	[%l7 + %i1] 0x0c,	%g6
	fpsub16	%f8,	%f6,	%f6
	fabss	%f25,	%f31
	subccc	%o2,	0x0480,	%g1
	fandnot1	%f14,	%f26,	%f26
	std	%f4,	[%l7 + 0x68]
	edge32ln	%g2,	%i4,	%l6
	mulscc	%i3,	%o6,	%o3
	fabss	%f31,	%f23
	wr	%g0,	0x19,	%asi
	sta	%f4,	[%l7 + 0x58] %asi
	movre	%g3,	%g5,	%i5
	udivx	%l5,	0x167A,	%l0
	fxors	%f2,	%f1,	%f10
	fmovd	%f12,	%f0
	call	loop_2564
	movcs	%xcc,	%l3,	%i2
	ldub	[%l7 + 0x2F],	%l4
	subcc	%o5,	%o1,	%o4
loop_2564:
	fpack16	%f12,	%f9
	fbul	%fcc3,	loop_2565
	tle	%icc,	0x1
	add	%l7,	0x3C,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%l2,	%i1
loop_2565:
	sll	%i7,	%g4,	%i0
	fmovrsne	%l1,	%f20,	%f13
	fbe	%fcc1,	loop_2566
	or	%o0,	0x0EAC,	%g7
	bn,a,pn	%icc,	loop_2567
	brnz,a	%i6,	loop_2568
loop_2566:
	fmovdgu	%xcc,	%f1,	%f23
	membar	0x4B
loop_2567:
	fnor	%f26,	%f16,	%f4
loop_2568:
	call	loop_2569
	taddcc	%g6,	%o7,	%g1
	lduw	[%l7 + 0x74],	%g2
	andcc	%o2,	%l6,	%i3
loop_2569:
	movleu	%icc,	%o6,	%i4
	fmovrsgz	%o3,	%f4,	%f25
	tsubcctv	%g5,	0x0257,	%i5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x48] %asi,	%g3
	fmovrslz	%l5,	%f14,	%f29
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l0,	0x1679,	%l3
	nop
	setx	0x69FD7B256050F7E5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	nop
	fitos	%f1,	%f31
	fstoi	%f31,	%f16
	fmovsle	%icc,	%f24,	%f25
	lduw	[%l7 + 0x30],	%l4
	movn	%icc,	%o5,	%o1
	taddcctv	%i2,	0x0E38,	%o4
	tleu	%xcc,	0x3
	addc	%l2,	%i1,	%g4
	edge32n	%i0,	%i7,	%o0
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x50] %asi,	%g6
	fabss	%f15,	%f11
	movrgez	%l1,	%g6,	%i6
	bneg,pn	%icc,	loop_2570
	fbue	%fcc2,	loop_2571
	nop
	fitos	%f0,	%f16
	fstox	%f16,	%f4
	brlez	%o7,	loop_2572
loop_2570:
	udivx	%g1,	0x0B9E,	%o2
loop_2571:
	nop
	setx	0x21B7A0C8804F026D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x78]
	ldx	[%l7 + 0x78],	%fsr
	tcs	%icc,	0x6
loop_2572:
	nop
	fitos	%f0,	%f28
	fstoi	%f28,	%f19
	brgez,a	%l6,	loop_2573
	tcs	%xcc,	0x6
	srax	%g2,	%o6,	%i4
	movrlez	%i3,	0x38D,	%g5
loop_2573:
	array32	%o3,	%g3,	%i5
	wr	%g0,	0x11,	%asi
	ldstuba	[%l7 + 0x1A] %asi,	%l5
	movvs	%xcc,	%l0,	%l4
	fandnot2	%f8,	%f16,	%f6
	udivcc	%l3,	0x0EFB,	%o5
	nop
	setx loop_2574, %l0, %l1
	jmpl %l1, %i2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o1,	0x02EC,	%l2
	fmovrdlez	%o4,	%f30,	%f16
loop_2574:
	tge	%icc,	0x2
	tge	%icc,	0x2
	brgez	%g4,	loop_2575
	std	%f14,	[%l7 + 0x50]
	fbule,a	%fcc2,	loop_2576
	brnz	%i1,	loop_2577
loop_2575:
	fmovsvc	%icc,	%f28,	%f27
	fmovrsgz	%i0,	%f22,	%f30
loop_2576:
	nop
	setx	0x49CCC570,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f14
	setx	0x1472F9B3,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f4
	fadds	%f4,	%f14,	%f27
loop_2577:
	edge32n	%i7,	%o0,	%g7
	array32	%g6,	%i6,	%l1
	fmovdleu	%xcc,	%f30,	%f12
	movg	%icc,	%o7,	%g1
	orcc	%l6,	%g2,	%o6
	edge16ln	%o2,	%i3,	%i4
	fmovda	%icc,	%f11,	%f1
	andn	%g5,	0x1933,	%g3
	fmovrdlz	%o3,	%f10,	%f14
	tg	%xcc,	0x3
	popc	%l5,	%i5
	movrlez	%l4,	%l0,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i2,	%o1,	%l3
	subccc	%o4,	%l2,	%i1
	edge16	%g4,	%i0,	%i7
	umulcc	%o0,	0x1ADD,	%g6
	tne	%icc,	0x7
	fbo	%fcc0,	loop_2578
	movle	%xcc,	%g7,	%l1
	tcs	%xcc,	0x1
	fandnot2	%f2,	%f2,	%f4
loop_2578:
	brlez	%i6,	loop_2579
	and	%g1,	0x1277,	%o7
	tvc	%xcc,	0x7
	fmovdleu	%xcc,	%f23,	%f10
loop_2579:
	edge32n	%l6,	%o6,	%g2
	sdiv	%o2,	0x0F79,	%i4
	bleu,a,pn	%xcc,	loop_2580
	umulcc	%i3,	%g3,	%o3
	sdivcc	%l5,	0x1903,	%g5
	movg	%icc,	%l4,	%l0
loop_2580:
	fpack32	%f6,	%f24,	%f18
	movgu	%xcc,	%o5,	%i2
	andcc	%o1,	0x1563,	%i5
	umul	%o4,	%l3,	%l2
	movrne	%g4,	%i0,	%i1
	fmovsleu	%xcc,	%f9,	%f5
	nop
	fitos	%f7,	%f27
	fstox	%f27,	%f12
	fxtos	%f12,	%f6
	fpsub16	%f6,	%f8,	%f22
	fnot1	%f4,	%f2
	nop
	set	0x7A, %g2
	ldub	[%l7 + %g2],	%i7
	andn	%g6,	0x068D,	%o0
	fbu,a	%fcc1,	loop_2581
	taddcc	%l1,	%g7,	%g1
	fbge,a	%fcc2,	loop_2582
	ldub	[%l7 + 0x64],	%i6
loop_2581:
	nop
	fitod	%f8,	%f18
	fdtos	%f18,	%f0
	srl	%l6,	%o6,	%g2
loop_2582:
	edge32n	%o7,	%i4,	%o2
	tge	%icc,	0x4
	brgez,a	%i3,	loop_2583
	fmovdg	%icc,	%f17,	%f16
	and	%o3,	0x1B86,	%l5
	fblg	%fcc1,	loop_2584
loop_2583:
	movcs	%icc,	%g5,	%l4
	addcc	%g3,	0x09F1,	%l0
	xnorcc	%o5,	0x1A12,	%o1
loop_2584:
	edge32	%i5,	%o4,	%i2
	subc	%l2,	0x1355,	%l3
	fbge	%fcc2,	loop_2585
	xnorcc	%i0,	0x1E83,	%g4
	bcc,pn	%icc,	loop_2586
	movvs	%xcc,	%i1,	%i7
loop_2585:
	stbar
	taddcctv	%o0,	%g6,	%g7
loop_2586:
	edge32l	%l1,	%g1,	%i6
	brlez,a	%o6,	loop_2587
	movpos	%icc,	%l6,	%o7
	alignaddrl	%i4,	%o2,	%i3
	fpsub32s	%f12,	%f1,	%f22
loop_2587:
	move	%icc,	%o3,	%g2
	fmovsgu	%icc,	%f16,	%f15
	membar	0x43
	nop
	setx	0x4B704BFCA06993C8,	%l0,	%l6
	stx	%l6,	[%l7 + 0x58]
	ldx	[%l7 + 0x58],	%fsr
	sub	%l5,	0x0781,	%l4
	bge	loop_2588
	fbge	%fcc2,	loop_2589
	orncc	%g5,	%g3,	%l0
	movre	%o5,	%i5,	%o1
loop_2588:
	tpos	%xcc,	0x1
loop_2589:
	nop
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o4
	sll	%l2,	0x0E,	%l3
	edge8	%i2,	%i0,	%i1
	wr	%g0,	0x18,	%asi
	stwa	%i7,	[%l7 + 0x14] %asi
	sdivx	%g4,	0x09CF,	%o0
	ldx	[%l7 + 0x30],	%g6
	andcc	%g7,	%g1,	%l1
	st	%f18,	[%l7 + 0x50]
	ld	[%l7 + 0x38],	%f12
	set	0x40, %g5
	ldda	[%l7 + %g5] 0x19,	%f16
	alignaddrl	%i6,	%l6,	%o6
	movgu	%xcc,	%o7,	%i4
	fmovsneg	%icc,	%f23,	%f15
	edge16ln	%o2,	%i3,	%o3
	movre	%g2,	0x1F0,	%l4
	nop
	setx	0xEEC10563547C2D52,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x6352A380E678139D,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fmuld	%f22,	%f14,	%f2
	fmovrdgez	%g5,	%f4,	%f18
	alignaddr	%g3,	%l5,	%l0
	edge16n	%o5,	%i5,	%o1
	subc	%o4,	%l2,	%i2
	fmovrdne	%l3,	%f6,	%f0
	edge8n	%i1,	%i0,	%i7
	set	0x64, %l0
	lduwa	[%l7 + %l0] 0x81,	%o0
	tg	%xcc,	0x6
	tcs	%xcc,	0x7
	set	0x68, %g4
	prefetcha	[%l7 + %g4] 0x19,	 0x1
	fmovrslz	%g4,	%f16,	%f4
	movvc	%icc,	%g1,	%l1
	wr	%g0,	0xe2,	%asi
	stwa	%i6,	[%l7 + 0x24] %asi
	membar	#Sync
	addc	%l6,	%o6,	%g7
	ldub	[%l7 + 0x2F],	%i4
	tge	%icc,	0x7
	fpmerge	%f0,	%f22,	%f28
	taddcc	%o2,	0x0DDE,	%o7
	fmovrslz	%o3,	%f28,	%f29
	sub	%g2,	%i3,	%g5
	movrgz	%l4,	%g3,	%l0
	bpos	loop_2590
	fmovrsgez	%l5,	%f0,	%f28
	brgz,a	%i5,	loop_2591
	membar	0x2F
loop_2590:
	nop
	fitos	%f1,	%f11
	fstox	%f11,	%f24
	mova	%xcc,	%o5,	%o4
loop_2591:
	movne	%icc,	%l2,	%i2
	ldd	[%l7 + 0x60],	%f10
	fmovscs	%icc,	%f25,	%f19
	subc	%l3,	0x08AA,	%o1
	tpos	%icc,	0x3
	stw	%i1,	[%l7 + 0x44]
	alignaddr	%i0,	%o0,	%i7
	faligndata	%f6,	%f0,	%f18
	movrlz	%g4,	0x01A,	%g1
	sdivcc	%g6,	0x1C45,	%l1
	ld	[%l7 + 0x08],	%f0
	andn	%i6,	0x1B74,	%l6
	sdivcc	%g7,	0x1401,	%o6
	ta	%icc,	0x5
	taddcctv	%o2,	%i4,	%o3
	st	%f2,	[%l7 + 0x68]
	sethi	0x1562,	%o7
	sub	%i3,	%g2,	%g5
	fbn	%fcc3,	loop_2592
	srax	%l4,	0x16,	%g3
	stb	%l5,	[%l7 + 0x3C]
	fmovsneg	%icc,	%f18,	%f11
loop_2592:
	edge8ln	%i5,	%o5,	%o4
	array16	%l0,	%i2,	%l3
	fmovs	%f2,	%f0
	umulcc	%l2,	0x1D90,	%i1
	srax	%o1,	%o0,	%i7
	mulx	%g4,	%i0,	%g1
	and	%g6,	0x0D3B,	%l1
	fbule,a	%fcc1,	loop_2593
	ta	%icc,	0x5
	tge	%icc,	0x3
	add	%l7,	0x10,	%l6
	wr	%g0,	0x04,	%asi
	casa	[%l6] 0x04,	%i6,	%g7
loop_2593:
	bleu,a	%xcc,	loop_2594
	brgz	%o6,	loop_2595
	fmovd	%f18,	%f10
	flush	%l7 + 0x40
loop_2594:
	tne	%icc,	0x0
loop_2595:
	edge8	%l6,	%o2,	%i4
	set	0x50, %o0
	ldswa	[%l7 + %o0] 0x14,	%o3
	andn	%i3,	%o7,	%g2
	tpos	%xcc,	0x0
	fcmpne32	%f14,	%f26,	%l4
	te	%icc,	0x1
	fbu	%fcc0,	loop_2596
	andcc	%g5,	0x093C,	%l5
	bcc,a,pn	%xcc,	loop_2597
	movcs	%icc,	%g3,	%i5
loop_2596:
	xor	%o5,	0x185C,	%l0
	sub	%i2,	0x036F,	%l3
loop_2597:
	subc	%l2,	%i1,	%o4
	orcc	%o0,	%i7,	%o1
	nop
	setx	0x0DE22136FF99349A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f16
	setx	0xA70DBE2308A9197A,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fdivd	%f18,	%f16,	%f28
	ta	%xcc,	0x0
	smul	%i0,	0x1589,	%g1
	fmovrdlz	%g6,	%f8,	%f8
	tvc	%xcc,	0x4
	umul	%g4,	0x1D62,	%i6
	ldx	[%l7 + 0x38],	%g7
	movrlez	%l1,	%l6,	%o6
	alignaddr	%i4,	%o2,	%o3
	tge	%xcc,	0x0
	sll	%i3,	%o7,	%g2
	edge16ln	%l4,	%g5,	%g3
	movneg	%xcc,	%i5,	%l5
	sub	%l0,	0x16FE,	%o5
	lduh	[%l7 + 0x38],	%i2
	brgez,a	%l2,	loop_2598
	movcc	%xcc,	%l3,	%i1
	udivx	%o4,	0x19F9,	%i7
	move	%xcc,	%o1,	%i0
loop_2598:
	fmovsge	%icc,	%f24,	%f26
	tgu	%xcc,	0x3
	fmovdcs	%xcc,	%f26,	%f30
	fmuld8sux16	%f4,	%f30,	%f14
	fxor	%f28,	%f12,	%f26
	ta	%icc,	0x4
	fcmple32	%f6,	%f30,	%g1
	ldd	[%l7 + 0x50],	%o0
	tge	%icc,	0x5
	fnegd	%f28,	%f30
	movrgz	%g4,	0x35B,	%g6
	fornot1	%f20,	%f0,	%f10
	array16	%i6,	%g7,	%l6
	fbug	%fcc3,	loop_2599
	edge32	%l1,	%o6,	%o2
	movpos	%icc,	%o3,	%i3
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x44] %asi,	%i4
loop_2599:
	movn	%xcc,	%g2,	%o7
	tl	%icc,	0x6
	sdiv	%g5,	0x1796,	%l4
	tsubcctv	%g3,	0x1BCA,	%i5
	sir	0x09BC
	movrlez	%l5,	0x3AB,	%l0
	tcc	%icc,	0x7
	movvs	%icc,	%i2,	%o5
	flush	%l7 + 0x14
	xnor	%l3,	0x0B96,	%i1
	nop
	setx loop_2600, %l0, %l1
	jmpl %l1, %l2
	or	%o4,	0x05EB,	%i7
	fpack16	%f26,	%f7
	movcs	%icc,	%o1,	%i0
loop_2600:
	fmovdne	%icc,	%f23,	%f30
	wr	%g0,	0x81,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	edge32n	%o0,	%g1,	%g6
	brlz,a	%g4,	loop_2601
	fcmple32	%f24,	%f2,	%i6
	move	%icc,	%g7,	%l1
	tn	%icc,	0x6
loop_2601:
	bvs,a,pt	%icc,	loop_2602
	nop
	setx	0x1A31A4AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f10
	setx	0x90E2FD51,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fmuls	%f3,	%f10,	%f5
	nop
	setx	0x3321FBD4,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f26
	setx	0x16C76428,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f6
	fsubs	%f6,	%f26,	%f29
	tleu	%icc,	0x3
loop_2602:
	fmovdpos	%xcc,	%f18,	%f19
	edge8	%o6,	%o2,	%o3
	edge32n	%l6,	%i3,	%g2
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i4,	%g5,	%o7
	movgu	%icc,	%g3,	%i5
	bvs,a,pt	%xcc,	loop_2603
	ta	%xcc,	0x4
	nop 	! 	nop 	! 	wr	%g0,	0x40,	%asi ripped by fixASI40.pl ripped by fixASI40.pl
	nop 	! 	nop 	! 	ldxa	[%g0 + 0x160] %asi,	%l5 ripped by fixASI40.pl ripped by fixASI40.pl
loop_2603:
	fsrc1	%f26,	%f16
	movcc	%xcc,	%l0,	%l4
	edge16	%i2,	%l3,	%i1
	te	%xcc,	0x2
	movl	%icc,	%l2,	%o5
	nop
	setx	0x9D8D1052,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0x3239F952,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f5
	fadds	%f5,	%f21,	%f14
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x54] %asi,	%i7
	fbne	%fcc3,	loop_2604
	edge8n	%o4,	%i0,	%o0
	fbne	%fcc2,	loop_2605
	move	%xcc,	%g1,	%o1
loop_2604:
	movge	%icc,	%g4,	%g6
	bneg,pn	%xcc,	loop_2606
loop_2605:
	movge	%icc,	%g7,	%i6
	nop
	fitos	%f1,	%f10
	fstox	%f10,	%f22
	edge16l	%o6,	%o2,	%l1
loop_2606:
	membar	0x24
	tvs	%icc,	0x6
	bcc,a	%icc,	loop_2607
	bpos	loop_2608
	tn	%xcc,	0x2
	sdivcc	%l6,	0x0E97,	%i3
loop_2607:
	fmovrsgez	%g2,	%f31,	%f29
loop_2608:
	nop
	fitod	%f8,	%f28
	fdtoi	%f28,	%f29
	ldd	[%l7 + 0x18],	%o2
	array16	%i4,	%o7,	%g3
	wr	%g0,	0x81,	%asi
	ldxa	[%l7 + 0x30] %asi,	%g5
	tneg	%xcc,	0x0
	srax	%l5,	0x08,	%i5
	fmovrdlez	%l0,	%f2,	%f12
	ba,pt	%icc,	loop_2609
	xorcc	%l4,	%i2,	%i1
	move	%xcc,	%l2,	%o5
	set	0x66, %l3
	stha	%i7,	[%l7 + %l3] 0x80
loop_2609:
	ta	%xcc,	0x1
	mulx	%l3,	0x1916,	%o4
	fbg,a	%fcc3,	loop_2610
	edge8	%o0,	%g1,	%i0
	fxnors	%f14,	%f30,	%f19
	edge32n	%g4,	%g6,	%o1
loop_2610:
	tvc	%icc,	0x3
	movvs	%xcc,	%g7,	%i6
	wr	%g0,	0x80,	%asi
	ldsba	[%l7 + 0x21] %asi,	%o6
	fpsub32s	%f27,	%f0,	%f11
	popc	0x123A,	%l1
	add	%l7,	0x18,	%l6
	wr	%g0,	0x18,	%asi
	casa	[%l6] %asi,	%l6,	%o2
	movn	%xcc,	%g2,	%i3
	udiv	%i4,	0x0679,	%o3
	smulcc	%g3,	%o7,	%g5
	movn	%icc,	%l5,	%l0
	wr	%g0,	0x10,	%asi
	ldxa	[%l7 + 0x50] %asi,	%i5
	udivx	%l4,	0x00E6,	%i1
	fcmpeq16	%f30,	%f2,	%i2
	bvc,a,pn	%xcc,	loop_2611
	fbue	%fcc0,	loop_2612
	array8	%o5,	%i7,	%l3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2611:
	andncc	%o4,	%o0,	%l2
loop_2612:
	tvs	%xcc,	0x0
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g1,	%i0,	%g4
	sdiv	%o1,	0x0ED0,	%g6
	sethi	0x0757,	%g7
	tpos	%xcc,	0x6
	array8	%i6,	%o6,	%l6
	sir	0x188D
	ld	[%l7 + 0x30],	%f17
	fsrc2s	%f8,	%f12
	fbule,a	%fcc0,	loop_2613
	bl,pn	%xcc,	loop_2614
	movcc	%xcc,	%o2,	%l1
	movrne	%g2,	%i3,	%o3
loop_2613:
	edge32n	%g3,	%i4,	%g5
loop_2614:
	nop
	set	0x68, %o7
	prefetcha	[%l7 + %o7] 0x15,	 0x2
	fmovrsne	%l0,	%f9,	%f10
	movrgez	%i5,	%l5,	%l4
	tcs	%xcc,	0x3
	nop
	setx	0x40DA189700499411,	%l0,	%l6
	stx	%l6,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%fsr
	edge16	%i2,	%i1,	%o5
	xnor	%i7,	0x146D,	%l3
	subccc	%o0,	%o4,	%l2
	edge16n	%g1,	%i0,	%g4
	call	loop_2615
	fbe,a	%fcc3,	loop_2616
	fpsub16s	%f20,	%f21,	%f27
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2615:
	sra	%o1,	%g7,	%g6
loop_2616:
	srl	%o6,	0x11,	%i6
	subcc	%o2,	0x1269,	%l1
	edge16	%g2,	%i3,	%l6
	stw	%g3,	[%l7 + 0x20]
	subcc	%i4,	0x101E,	%g5
	edge32	%o3,	%l0,	%i5
	tl	%xcc,	0x2
	mova	%xcc,	%l5,	%l4
	and	%i2,	0x1F2D,	%i1
	or	%o5,	0x0097,	%o7
	fmovrdlz	%l3,	%f6,	%f24
	fmovscs	%icc,	%f1,	%f9
	fabss	%f1,	%f24
	fmovrsne	%i7,	%f14,	%f20
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x58] %asi,	%o0
	fcmpeq32	%f24,	%f6,	%l2
	tle	%icc,	0x2
	fmovd	%f4,	%f0
	edge32l	%o4,	%i0,	%g4
	std	%f12,	[%l7 + 0x20]
	bvs,pn	%xcc,	loop_2617
	popc	0x1FC0,	%o1
	fmovdcc	%xcc,	%f31,	%f20
	tne	%icc,	0x7
loop_2617:
	movrlz	%g7,	%g1,	%o6
	orncc	%g6,	0x1683,	%i6
	xor	%o2,	%g2,	%i3
	movvc	%icc,	%l1,	%g3
	bg,a	%xcc,	loop_2618
	edge8l	%i4,	%l6,	%g5
	tge	%xcc,	0x0
	edge16l	%o3,	%i5,	%l0
loop_2618:
	nop
	set	0x30, %o5
	ldda	[%l7 + %o5] 0xe3,	%l4
	addcc	%i2,	0x195D,	%l5
	subc	%i1,	0x00E2,	%o7
	movne	%icc,	%l3,	%i7
	tsubcc	%o0,	%l2,	%o5
	fmovdle	%icc,	%f5,	%f2
	fcmpne32	%f4,	%f26,	%o4
	movvc	%xcc,	%g4,	%o1
	fsrc1s	%f8,	%f19
	umulcc	%g7,	%g1,	%i0
	movvc	%xcc,	%g6,	%i6
	fmovdgu	%xcc,	%f6,	%f21
	movvs	%icc,	%o2,	%o6
	fba	%fcc0,	loop_2619
	and	%g2,	%l1,	%g3
	movrlez	%i4,	0x199,	%l6
	tcs	%xcc,	0x5
loop_2619:
	subcc	%g5,	0x0D18,	%o3
	alignaddr	%i5,	%l0,	%l4
	fcmple32	%f14,	%f20,	%i3
	or	%l5,	%i1,	%o7
	bneg,pn	%xcc,	loop_2620
	movcs	%icc,	%i2,	%i7
	fnot2s	%f31,	%f30
	addccc	%o0,	0x0856,	%l3
loop_2620:
	or	%l2,	0x00C7,	%o5
	brgez	%o4,	loop_2621
	add	%o1,	0x09AC,	%g7
	edge8ln	%g1,	%g4,	%i0
	alignaddr	%i6,	%o2,	%g6
loop_2621:
	nop
	set	0x7C, %l6
	swapa	[%l7 + %l6] 0x89,	%g2
	fmovsne	%icc,	%f10,	%f0
	movle	%icc,	%o6,	%l1
	smul	%g3,	%l6,	%g5
	addccc	%o3,	0x0709,	%i4
	fmovdge	%xcc,	%f27,	%f20
	movre	%l0,	0x0AB,	%l4
	set	0x38, %i2
	prefetcha	[%l7 + %i2] 0x10,	 0x2
	taddcc	%i3,	%l5,	%o7
	xnorcc	%i2,	0x0B8A,	%i7
	movne	%xcc,	%o0,	%i1
	fmovrde	%l2,	%f10,	%f10
	nop
	setx	loop_2622,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tge	%xcc,	0x5
	fblg,a	%fcc1,	loop_2623
	nop
	setx	0xE5A08920E15FE5EB,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xB284B0A9C64BB0A5,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fmuld	%f28,	%f2,	%f20
loop_2622:
	movcs	%xcc,	%o5,	%o4
	fzeros	%f2
loop_2623:
	edge8l	%l3,	%o1,	%g1
	fble,a	%fcc1,	loop_2624
	movvc	%icc,	%g4,	%g7
	set	0x46, %i4
	lduha	[%l7 + %i4] 0x10,	%i6
loop_2624:
	fpadd32	%f16,	%f20,	%f10
	tneg	%xcc,	0x7
	fzero	%f26
	fbge,a	%fcc0,	loop_2625
	fpadd16s	%f26,	%f4,	%f30
	udiv	%i0,	0x1F59,	%g6
	brz,a	%o2,	loop_2626
loop_2625:
	bne	loop_2627
	brgez,a	%g2,	loop_2628
	movneg	%icc,	%o6,	%g3
loop_2626:
	tsubcctv	%l6,	0x0C7B,	%g5
loop_2627:
	sir	0x0AB3
loop_2628:
	subc	%o3,	%l1,	%i4
	fbuge,a	%fcc0,	loop_2629
	fmovs	%f26,	%f17
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ba	loop_2630
loop_2629:
	fmovrde	%l0,	%f30,	%f14
	movgu	%xcc,	%l4,	%i5
	membar	0x11
loop_2630:
	popc	%i3,	%l5
	call	loop_2631
	bge,a	loop_2632
	tneg	%xcc,	0x0
	edge32n	%o7,	%i2,	%o0
loop_2631:
	andn	%i7,	0x1110,	%l2
loop_2632:
	nop
	set	0x08, %g3
	prefetcha	[%l7 + %g3] 0x14,	 0x2
	fmovrsgz	%o5,	%f28,	%f26
	fblg,a	%fcc0,	loop_2633
	sll	%o4,	%l3,	%o1
	tcc	%icc,	0x7
	tsubcctv	%g4,	%g1,	%i6
loop_2633:
	udiv	%i0,	0x0ABD,	%g6
	fmovsne	%icc,	%f1,	%f12
	brgz	%o2,	loop_2634
	udivx	%g7,	0x1108,	%o6
	tvs	%xcc,	0x0
	srl	%g2,	%l6,	%g3
loop_2634:
	movrgz	%o3,	%l1,	%i4
	movrlez	%l0,	0x3D1,	%g5
	wr	%g0,	0x89,	%asi
	lduha	[%l7 + 0x6E] %asi,	%i5
	tpos	%icc,	0x3
	edge8ln	%l4,	%i3,	%l5
	wr	%g0,	0x18,	%asi
	lda	[%l7 + 0x6C] %asi,	%f11
	ldd	[%l7 + 0x08],	%f22
	movvs	%icc,	%o7,	%o0
	bne,pn	%xcc,	loop_2635
	tl	%xcc,	0x6
	movrne	%i7,	0x129,	%l2
	nop
	fitod	%f0,	%f10
	fdtoi	%f10,	%f30
loop_2635:
	fble,a	%fcc0,	loop_2636
	fcmpgt16	%f16,	%f2,	%i2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f16,	%f22,	%o5
loop_2636:
	sll	%o4,	%l3,	%o1
	mulscc	%i1,	%g1,	%i6
	std	%f14,	[%l7 + 0x38]
	nop
	setx	loop_2637,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	umul	%g4,	%i0,	%o2
	fmovdn	%xcc,	%f24,	%f30
	be	loop_2638
loop_2637:
	movcs	%xcc,	%g6,	%o6
	orncc	%g2,	%g7,	%g3
	and	%o3,	%l1,	%l6
loop_2638:
	movrlz	%i4,	%g5,	%i5
	prefetch	[%l7 + 0x30],	 0x2
	fbg	%fcc0,	loop_2639
	nop
	setx	0xA2A726E9AD92803A,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f20
	setx	0xEE6B8ADB96903A2C,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f18
	fsubd	%f18,	%f20,	%f30
	set	0x53, %o4
	ldsba	[%l7 + %o4] 0x0c,	%l0
loop_2639:
	addcc	%i3,	0x1658,	%l5
	bgu	%icc,	loop_2640
	edge8ln	%l4,	%o0,	%o7
	xnorcc	%l2,	%i2,	%o5
	sdiv	%o4,	0x0DB0,	%i7
loop_2640:
	edge16	%o1,	%l3,	%g1
	membar	0x55
	movpos	%icc,	%i6,	%i1
	xorcc	%g4,	%o2,	%g6
	lduw	[%l7 + 0x58],	%o6
	add	%i0,	%g7,	%g2
	edge32	%g3,	%l1,	%o3
	ba,a	loop_2641
	brnz	%i4,	loop_2642
	fpsub32	%f0,	%f20,	%f10
	set	0x6F, %g7
	ldsba	[%l7 + %g7] 0x88,	%g5
loop_2641:
	bg,a,pt	%icc,	loop_2643
loop_2642:
	fnands	%f12,	%f20,	%f8
	edge16n	%i5,	%l6,	%l0
	wr	%g0,	0x89,	%asi
	ldswa	[%l7 + 0x74] %asi,	%l5
loop_2643:
	sdivcc	%l4,	0x15AE,	%i3
	udivcc	%o7,	0x05A0,	%l2
	nop
	setx	0x907D2272,	%l0,	%l6
	st	%l6,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%fsr
	nop
	setx	0xCB7C24C6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f3
	setx	0xC89AFDA1,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f3,	%f17
	ldd	[%l7 + 0x40],	%f20
	tne	%icc,	0x2
	array8	%o0,	%o5,	%i2
	fmovrslz	%i7,	%f1,	%f15
	srax	%o4,	0x08,	%o1
	fcmpne16	%f2,	%f26,	%l3
	edge8	%g1,	%i1,	%g4
	movneg	%icc,	%i6,	%g6
	ldstub	[%l7 + 0x0B],	%o6
	array8	%o2,	%i0,	%g7
	movge	%xcc,	%g3,	%g2
	fbule,a	%fcc1,	loop_2644
	be,a,pt	%xcc,	loop_2645
	lduh	[%l7 + 0x1E],	%l1
	umul	%i4,	0x1F22,	%o3
loop_2644:
	fcmpne16	%f14,	%f6,	%i5
loop_2645:
	sdivcc	%g5,	0x01E3,	%l6
	fbe,a	%fcc0,	loop_2646
	and	%l5,	0x02BD,	%l0
	bneg,a,pt	%xcc,	loop_2647
	sra	%i3,	0x02,	%l4
loop_2646:
	tl	%icc,	0x6
	fba	%fcc1,	loop_2648
loop_2647:
	nop
	set	0x08, %i0
	std	%f16,	[%l7 + %i0]
	fnot1	%f28,	%f4
	fble,a	%fcc2,	loop_2649
loop_2648:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o7,	0x03E,	%o0
	udivcc	%l2,	0x1055,	%o5
loop_2649:
	alignaddr	%i7,	%o4,	%i2
	tvs	%icc,	0x5
	fmovdleu	%xcc,	%f10,	%f7
	tl	%icc,	0x6
	wr	%g0,	0x10,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o1
	bneg	loop_2650
	call	loop_2651
	edge32l	%l3,	%g1,	%i1
	orncc	%i6,	0x1F0B,	%g6
loop_2650:
	fcmple32	%f16,	%f14,	%g4
loop_2651:
	tge	%xcc,	0x1
	array16	%o2,	%i0,	%g7
	std	%f0,	[%l7 + 0x58]
	st	%f1,	[%l7 + 0x68]
	bpos,a,pt	%xcc,	loop_2652
	mulscc	%o6,	0x0EE8,	%g3
	edge8n	%l1,	%g2,	%o3
	nop
	setx	0xB3EFBEB6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	setx	0xDF21DFF8,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fdivs	%f7,	%f30,	%f3
loop_2652:
	tvc	%xcc,	0x1
	sethi	0x1835,	%i4
	movvc	%icc,	%g5,	%l6
	tcs	%xcc,	0x4
	fmovdne	%xcc,	%f12,	%f18
	taddcctv	%l5,	0x0A98,	%l0
	membar	0x7C
	st	%f4,	[%l7 + 0x48]
	tpos	%icc,	0x7
	nop
	fitod	%f6,	%f16
	fdtox	%f16,	%f18
	fxtod	%f18,	%f16
	call	loop_2653
	bl,a	%xcc,	loop_2654
	membar	0x57
	movpos	%xcc,	%i3,	%l4
loop_2653:
	nop
	setx loop_2655, %l0, %l1
	jmpl %l1, %o7
loop_2654:
	nop
	setx loop_2656, %l0, %l1
	jmpl %l1, %o0
	subcc	%l2,	%i5,	%i7
	fmovsle	%icc,	%f12,	%f1
loop_2655:
	xorcc	%o5,	0x167C,	%i2
loop_2656:
	fsrc1	%f14,	%f28
	array8	%o4,	%l3,	%g1
	set	0x3E, %l1
	ldsha	[%l7 + %l1] 0x80,	%o1
	tsubcctv	%i6,	0x06E2,	%g6
	fcmple16	%f18,	%f6,	%i1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	fitos	%f14,	%f26
	fstox	%f26,	%f6
	sir	0x0134
	array8	%o2,	%i0,	%g7
	fxors	%f2,	%f2,	%f13
	movn	%icc,	%g4,	%o6
	nop
	fitos	%f9,	%f21
	movl	%xcc,	%g3,	%g2
	alignaddr	%l1,	%o3,	%g5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcc	loop_2657
	bvc,a	%icc,	loop_2658
	orn	%l6,	%i4,	%l0
	fmovdg	%xcc,	%f10,	%f23
loop_2657:
	nop
	set	0x48, %g6
	prefetcha	[%l7 + %g6] 0x0c,	 0x1
loop_2658:
	addc	%l5,	0x04EC,	%o7
	wr	%g0,	0x11,	%asi
	lduwa	[%l7 + 0x74] %asi,	%l4
	fbo	%fcc3,	loop_2659
	xor	%l2,	0x10C9,	%i5
	subcc	%o0,	%o5,	%i7
	edge32n	%i2,	%l3,	%g1
loop_2659:
	ldub	[%l7 + 0x20],	%o1
	alignaddr	%o4,	%i6,	%i1
	udivcc	%o2,	0x1074,	%i0
	movge	%icc,	%g7,	%g6
	movge	%icc,	%o6,	%g4
	fmovdle	%icc,	%f20,	%f31
	movne	%icc,	%g2,	%l1
	or	%o3,	%g3,	%g5
	add	%l6,	0x1567,	%l0
	swap	[%l7 + 0x08],	%i4
	xor	%i3,	%l5,	%l4
	tpos	%icc,	0x3
	srlx	%l2,	%i5,	%o7
	or	%o5,	0x0C35,	%o0
	bpos,pt	%icc,	loop_2660
	stw	%i2,	[%l7 + 0x5C]
	ba,pt	%xcc,	loop_2661
	tsubcctv	%i7,	%l3,	%g1
loop_2660:
	srl	%o4,	0x12,	%i6
	edge16l	%i1,	%o1,	%i0
loop_2661:
	swap	[%l7 + 0x0C],	%g7
	nop
	setx	0xCB8D9F78,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f11
	setx	0x9E7440B9,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f3
	fadds	%f3,	%f11,	%f15
	addcc	%g6,	0x0C35,	%o2
	fble,a	%fcc1,	loop_2662
	tgu	%xcc,	0x6
	fbl,a	%fcc0,	loop_2663
	ta	%xcc,	0x3
loop_2662:
	bn,a	%xcc,	loop_2664
	mulscc	%o6,	0x1078,	%g2
loop_2663:
	edge16ln	%g4,	%l1,	%g3
	movpos	%xcc,	%o3,	%l6
loop_2664:
	edge32l	%l0,	%g5,	%i4
	fmovdvs	%icc,	%f22,	%f17
	mova	%xcc,	%i3,	%l5
	set	0x64, %i6
	lda	[%l7 + %i6] 0x80,	%f28
	tgu	%xcc,	0x1
	edge32ln	%l2,	%i5,	%l4
	movre	%o5,	%o0,	%o7
	bpos,a,pt	%xcc,	loop_2665
	te	%xcc,	0x7
	and	%i7,	0x1085,	%i2
	movg	%icc,	%l3,	%g1
loop_2665:
	fpack16	%f26,	%f28
	ta	%icc,	0x6
	movg	%icc,	%i6,	%i1
	udivx	%o4,	0x1A9E,	%i0
	movcc	%icc,	%o1,	%g6
	tpos	%xcc,	0x5
	fmovrsgz	%o2,	%f28,	%f19
	ldub	[%l7 + 0x23],	%o6
	fone	%f20
	addc	%g7,	0x199A,	%g4
	wr	%g0,	0x19,	%asi
	lduba	[%l7 + 0x15] %asi,	%l1
	ld	[%l7 + 0x74],	%f12
	fbg,a	%fcc1,	loop_2666
	mulx	%g2,	0x10A5,	%o3
	fmovsa	%xcc,	%f8,	%f13
	nop
	fitos	%f4,	%f15
	fstod	%f15,	%f14
loop_2666:
	nop
	fitos	%f6,	%f2
	fstod	%f2,	%f4
	movpos	%icc,	%g3,	%l6
	movneg	%xcc,	%l0,	%i4
	alignaddr	%i3,	%l5,	%g5
	wr	%g0,	0x2b,	%asi
	stxa	%i5,	[%l7 + 0x10] %asi
	membar	#Sync
	fbug,a	%fcc2,	loop_2667
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l2,	%o5,	%o0
	umul	%o7,	%i7,	%i2
loop_2667:
	fors	%f10,	%f1,	%f7
	tne	%xcc,	0x7
	brgez,a	%l3,	loop_2668
	udiv	%g1,	0x1469,	%l4
	umul	%i1,	0x125D,	%o4
	tpos	%xcc,	0x6
loop_2668:
	nop
	fitos	%f2,	%f15
	fstox	%f15,	%f20
	array16	%i6,	%i0,	%g6
	edge16l	%o2,	%o6,	%o1
	ldx	[%l7 + 0x58],	%g7
	movcc	%xcc,	%l1,	%g2
	movg	%xcc,	%o3,	%g3
	tleu	%xcc,	0x6
	fblg,a	%fcc3,	loop_2669
	sir	0x17D5
	bleu,a	%xcc,	loop_2670
	movrgz	%g4,	%l0,	%l6
loop_2669:
	mova	%xcc,	%i3,	%i4
	fmul8ulx16	%f22,	%f0,	%f16
loop_2670:
	bl,a,pn	%icc,	loop_2671
	sra	%l5,	0x00,	%g5
	andcc	%l2,	0x0E12,	%o5
	movcc	%xcc,	%i5,	%o7
loop_2671:
	bshuffle	%f10,	%f4,	%f4
	fmovscc	%xcc,	%f11,	%f12
	andn	%i7,	%o0,	%l3
	fxor	%f20,	%f12,	%f20
	ldstub	[%l7 + 0x4A],	%g1
	umul	%l4,	%i1,	%o4
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tg	%icc,	0x1
	andncc	%i6,	%i2,	%g6
	sir	0x0DB4
	udivcc	%o2,	0x100C,	%i0
	tgu	%xcc,	0x7
	ldstub	[%l7 + 0x13],	%o1
	movneg	%icc,	%g7,	%o6
	ldsw	[%l7 + 0x44],	%l1
	ldd	[%l7 + 0x38],	%o2
	and	%g3,	0x0013,	%g4
	edge16l	%g2,	%l6,	%l0
	nop
	setx	0x907CE648,	%l0,	%l6
	st	%l6,	[%l7 + 0x78]
	ld	[%l7 + 0x78],	%fsr
	orncc	%i4,	0x046C,	%l5
	fpsub32s	%f29,	%f21,	%f5
	umul	%g5,	0x1C60,	%l2
	lduh	[%l7 + 0x78],	%o5
	fsrc2s	%f3,	%f4
	udivcc	%i5,	0x18FC,	%o7
	tge	%icc,	0x5
	tsubcctv	%i3,	0x06F8,	%i7
	nop
	setx	0x40632445,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
	te	%icc,	0x0
	movrgz	%o0,	%g1,	%l3
	subccc	%i1,	0x16D3,	%l4
	flush	%l7 + 0x2C
	set	0x1D, %i7
	ldstuba	[%l7 + %i7] 0x81,	%i6
	tl	%icc,	0x1
	sll	%o4,	%g6,	%i2
	set	0x20, %i5
	ldsha	[%l7 + %i5] 0x10,	%i0
	tle	%icc,	0x3
	te	%xcc,	0x6
	udivcc	%o1,	0x1343,	%g7
	fbule,a	%fcc0,	loop_2672
	movgu	%icc,	%o2,	%o6
	andcc	%l1,	%g3,	%g4
	fbo,a	%fcc0,	loop_2673
loop_2672:
	fandnot1s	%f13,	%f14,	%f6
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x0D] %asi,	%o3
loop_2673:
	edge16l	%l6,	%l0,	%g2
	taddcctv	%i4,	0x164A,	%g5
	edge16l	%l2,	%o5,	%i5
	andncc	%o7,	%i3,	%i7
	movrlz	%l5,	%g1,	%l3
	nop
	setx	0x06F992876043F070,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	movge	%xcc,	%o0,	%l4
	xnor	%i6,	0x199B,	%i1
	addcc	%o4,	0x1D76,	%g6
	ba,pt	%icc,	loop_2674
	nop
	setx	0xBEEF2AF2,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	setx	0x50B492D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f4,	%f25
	move	%icc,	%i0,	%o1
	wr	%g0,	0x04,	%asi
	ldda	[%l7 + 0x30] %asi,	%i2
loop_2674:
	fpadd32s	%f23,	%f3,	%f16
	sdiv	%g7,	0x10AB,	%o2
	tn	%icc,	0x7
	fmovrdne	%o6,	%f10,	%f20
	fpsub16s	%f31,	%f11,	%f0
	movg	%icc,	%l1,	%g4
	andncc	%g3,	%l6,	%l0
	tvs	%xcc,	0x6
	bvs,a,pn	%icc,	loop_2675
	fornot1s	%f0,	%f2,	%f5
	nop
	setx	0xE30A84DE6C1404ED,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f2
	setx	0xDA4E8158309729FE,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f6
	fsubd	%f6,	%f2,	%f28
	tsubcc	%g2,	0x0A74,	%i4
loop_2675:
	sllx	%g5,	%l2,	%o3
	movvs	%xcc,	%i5,	%o5
	lduh	[%l7 + 0x1A],	%o7
	umul	%i7,	0x1149,	%l5
	fones	%f27
	fmovspos	%xcc,	%f23,	%f15
	set	0x61, %l2
	ldstuba	[%l7 + %l2] 0x19,	%i3
	andncc	%g1,	%l3,	%l4
	nop
	setx	0xC4A9F930,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f0
	fsqrts	%f0,	%f8
	tsubcc	%o0,	%i6,	%i1
	fandnot2s	%f17,	%f9,	%f6
	fcmpeq32	%f12,	%f4,	%o4
	fbl,a	%fcc2,	loop_2676
	xnorcc	%g6,	0x05C4,	%o1
	wr	%g0,	0x04,	%asi
	stba	%i0,	[%l7 + 0x0A] %asi
loop_2676:
	tle	%xcc,	0x4
	nop
	fitod	%f6,	%f12
	fdtox	%f12,	%f10
	fxtod	%f10,	%f20
	movg	%xcc,	%g7,	%i2
	fnot2	%f30,	%f8
	smulcc	%o6,	0x0C69,	%l1
	nop
	setx	0x92C6E70B,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f6
	fsqrts	%f6,	%f26
	addccc	%o2,	%g4,	%l6
	brnz	%l0,	loop_2677
	movne	%xcc,	%g2,	%g3
	nop
	setx	loop_2678,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tvs	%xcc,	0x2
loop_2677:
	fbuge	%fcc0,	loop_2679
	udiv	%g5,	0x0F4D,	%i4
loop_2678:
	ldsh	[%l7 + 0x08],	%o3
	fpsub16	%f18,	%f4,	%f28
loop_2679:
	movle	%xcc,	%l2,	%o5
	xorcc	%o7,	0x0B1A,	%i5
	nop
	setx	loop_2680,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	sdivcc	%l5,	0x0264,	%i3
	nop
	fitos	%f8,	%f28
	fstox	%f28,	%f2
	fmovrsgez	%i7,	%f26,	%f1
loop_2680:
	bg,a,pn	%xcc,	loop_2681
	srax	%g1,	%l4,	%o0
	edge16ln	%i6,	%i1,	%o4
	fbne	%fcc2,	loop_2682
loop_2681:
	movvs	%icc,	%g6,	%l3
	tn	%icc,	0x7
	edge8l	%o1,	%i0,	%i2
loop_2682:
	fmovdle	%xcc,	%f31,	%f8
	nop
	setx	0x9BECD61B105F24BC,	%l0,	%l6
	stx	%l6,	[%l7 + 0x48]
	ldx	[%l7 + 0x48],	%fsr
	fbl,a	%fcc3,	loop_2683
	fmul8sux16	%f2,	%f6,	%f6
	fbo,a	%fcc1,	loop_2684
	subcc	%o6,	%g7,	%o2
loop_2683:
	movvs	%icc,	%g4,	%l1
	ldd	[%l7 + 0x10],	%l0
loop_2684:
	udiv	%l6,	0x1296,	%g3
	fmovsvc	%icc,	%f8,	%f6
	fbul,a	%fcc1,	loop_2685
	fmovrde	%g2,	%f16,	%f26
	fpsub16s	%f23,	%f0,	%f8
	edge16l	%i4,	%o3,	%l2
loop_2685:
	nop
	fitod	%f0,	%f10
	fdtox	%f10,	%f22
	fxtod	%f22,	%f6
	edge32n	%o5,	%o7,	%g5
	subcc	%i5,	%l5,	%i7
	sub	%i3,	0x0194,	%g1
	bl	%icc,	loop_2686
	tg	%icc,	0x7
	sethi	0x1BD8,	%o0
	tle	%xcc,	0x1
loop_2686:
	tgu	%xcc,	0x5
	movg	%xcc,	%l4,	%i6
	ldsw	[%l7 + 0x08],	%i1
	te	%xcc,	0x6
	tn	%icc,	0x7
	fpadd32	%f16,	%f4,	%f30
	ble,pn	%xcc,	loop_2687
	movrne	%g6,	%l3,	%o4
	udiv	%i0,	0x00D1,	%o1
	addccc	%i2,	0x0BE9,	%g7
loop_2687:
	fsrc2s	%f5,	%f4
	addccc	%o2,	%g4,	%l1
	bcs,a,pn	%icc,	loop_2688
	movre	%o6,	%l6,	%l0
	udiv	%g2,	0x1E70,	%i4
	fmul8x16	%f1,	%f20,	%f6
loop_2688:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tsubcctv	%o3,	0x023F,	%l2
	orn	%o5,	0x0CEF,	%o7
	stx	%g5,	[%l7 + 0x48]
	movrgez	%i5,	0x16A,	%l5
	call	loop_2689
	movrgz	%g3,	0x11C,	%i3
	sdivx	%g1,	0x04AE,	%o0
	sethi	0x1161,	%i7
loop_2689:
	ld	[%l7 + 0x44],	%f10
	nop
	setx	0x40BAFF00,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f31
	setx	0xCE9C85D4,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f24
	fdivs	%f24,	%f31,	%f16
	edge32l	%l4,	%i6,	%i1
	addcc	%g6,	0x0E79,	%o4
	movvc	%xcc,	%l3,	%i0
	movne	%xcc,	%i2,	%o1
	st	%f25,	[%l7 + 0x08]
	array32	%o2,	%g4,	%l1
	srl	%o6,	0x12,	%g7
	add	%l0,	%g2,	%i4
	fand	%f0,	%f14,	%f28
	sub	%l6,	0x100F,	%l2
	fsrc2	%f12,	%f22
	xor	%o5,	%o3,	%o7
	taddcc	%g5,	%l5,	%i5
	umulcc	%i3,	%g3,	%g1
	stw	%o0,	[%l7 + 0x28]
	srlx	%i7,	%l4,	%i6
	fones	%f20
	movrlez	%g6,	0x3D5,	%o4
	addccc	%l3,	0x1F5E,	%i1
	mulx	%i2,	%o1,	%i0
	tvs	%icc,	0x5
	te	%icc,	0x0
	tl	%xcc,	0x1
	sub	%o2,	0x03FB,	%g4
	set	0x08, %l5
	prefetcha	[%l7 + %l5] 0x11,	 0x3
	tn	%xcc,	0x3
	edge32n	%l1,	%l0,	%g2
	fpsub16s	%f22,	%f2,	%f12
	andncc	%i4,	%g7,	%l6
	movl	%icc,	%l2,	%o3
	fnors	%f1,	%f0,	%f22
	flush	%l7 + 0x08
	movrgez	%o5,	%g5,	%l5
	alignaddr	%o7,	%i3,	%g3
	or	%g1,	%o0,	%i7
	fbug	%fcc3,	loop_2690
	smul	%i5,	0x0AC7,	%l4
	alignaddr	%i6,	%g6,	%l3
	brlz	%o4,	loop_2691
loop_2690:
	fabss	%f6,	%f15
	fmovsge	%icc,	%f20,	%f11
	tsubcctv	%i2,	%o1,	%i0
loop_2691:
	smulcc	%o2,	%i1,	%g4
	xnorcc	%o6,	%l1,	%l0
	edge16l	%g2,	%i4,	%l6
	subccc	%g7,	0x1539,	%l2
	fandnot2s	%f23,	%f31,	%f8
	alignaddrl	%o3,	%o5,	%l5
	nop
	set	0x32, %g1
	lduh	[%l7 + %g1],	%o7
	edge32ln	%g5,	%g3,	%g1
	wr	%g0,	0x0c,	%asi
	stwa	%i3,	[%l7 + 0x30] %asi
	tgu	%xcc,	0x0
	alignaddrl	%i7,	%i5,	%o0
	mova	%xcc,	%i6,	%l4
	movrgez	%l3,	%o4,	%i2
	movcs	%icc,	%o1,	%g6
	edge8ln	%o2,	%i0,	%i1
	fpack32	%f10,	%f30,	%f16
	andcc	%o6,	%l1,	%g4
	tgu	%xcc,	0x7
	wr	%g0,	0xe2,	%asi
	ldda	[%l7 + 0x60] %asi,	%l0
	movrlz	%i4,	%g2,	%l6
	sethi	0x14BF,	%g7
	srl	%o3,	0x05,	%l2
	movneg	%icc,	%l5,	%o5
	sra	%g5,	%o7,	%g3
	xorcc	%g1,	%i7,	%i5
	sll	%i3,	%o0,	%i6
	sllx	%l4,	0x09,	%o4
	edge16n	%i2,	%o1,	%g6
	movne	%icc,	%l3,	%i0
	movrne	%o2,	%i1,	%o6
	fones	%f17
	tvs	%icc,	0x2
	flush	%l7 + 0x10
	tn	%icc,	0x3
	movre	%g4,	0x101,	%l1
	nop
	setx	loop_2692,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	orncc	%i4,	%g2,	%l0
	umul	%l6,	%o3,	%g7
	fbn	%fcc1,	loop_2693
loop_2692:
	movge	%xcc,	%l5,	%l2
	fnegd	%f8,	%f30
	faligndata	%f16,	%f14,	%f14
loop_2693:
	nop
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x10] %asi,	%g4
	andn	%o7,	0x0A56,	%o5
	fand	%f20,	%f16,	%f10
	wr	%g0,	0x80,	%asi
	stda	%f0,	[%l7 + 0x40] %asi
	fmovsge	%icc,	%f4,	%f5
	edge32l	%g3,	%g1,	%i5
	smulcc	%i7,	0x0062,	%o0
	mova	%xcc,	%i6,	%l4
	xnorcc	%o4,	%i2,	%i3
	sth	%o1,	[%l7 + 0x14]
	wr	%g0,	0x04,	%asi
	lduha	[%l7 + 0x60] %asi,	%g6
	fmovda	%icc,	%f27,	%f0
	fnegs	%f17,	%f0
	subccc	%l3,	%i0,	%o2
	subc	%i1,	0x0388,	%o6
	xnorcc	%g4,	%i4,	%g2
	movle	%xcc,	%l0,	%l1
	movg	%xcc,	%l6,	%g7
	xorcc	%l5,	0x11F9,	%o3
	fnegs	%f10,	%f25
	tle	%xcc,	0x4
	fnegs	%f11,	%f24
	taddcctv	%g5,	%l2,	%o5
	set	0x70, %o2
	ldxa	[%l7 + %o2] 0x0c,	%o7
	fpmerge	%f28,	%f25,	%f4
	fmovdcs	%xcc,	%f7,	%f8
	array8	%g1,	%g3,	%i5
	ldub	[%l7 + 0x7B],	%i7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	loop_2694,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	srax	%o0,	0x10,	%l4
	popc	0x1FA7,	%o4
	tsubcc	%i6,	%i2,	%o1
loop_2694:
	sdiv	%i3,	0x0C1E,	%g6
	movleu	%icc,	%i0,	%l3
	addcc	%i1,	%o6,	%o2
	edge8ln	%i4,	%g4,	%l0
	brgez	%l1,	loop_2695
	std	%f18,	[%l7 + 0x60]
	fmovsge	%icc,	%f1,	%f14
	fabss	%f12,	%f12
loop_2695:
	movrlez	%g2,	%g7,	%l6
	fmul8sux16	%f6,	%f8,	%f12
	bleu	loop_2696
	edge32l	%l5,	%o3,	%l2
	set	0x40, %l4
	stxa	%g5,	[%l7 + %l4] 0xea
	membar	#Sync
loop_2696:
	ldub	[%l7 + 0x56],	%o7
	andcc	%g1,	%g3,	%o5
	set	0x18, %i3
	lduwa	[%l7 + %i3] 0x04,	%i7
	edge16	%o0,	%l4,	%o4
	edge8	%i6,	%i2,	%i5
	fcmple32	%f18,	%f26,	%i3
	tl	%icc,	0x1
	tsubcc	%g6,	%o1,	%i0
	tsubcctv	%i1,	0x0954,	%l3
	movrgez	%o6,	0x246,	%i4
	ldx	[%l7 + 0x58],	%g4
	brgz,a	%o2,	loop_2697
	tneg	%xcc,	0x3
	movre	%l1,	0x3A2,	%l0
	movgu	%icc,	%g2,	%g7
loop_2697:
	stx	%l5,	[%l7 + 0x60]
	sllx	%o3,	%l2,	%l6
	movrgez	%o7,	%g5,	%g1
	sdivx	%o5,	0x0C30,	%i7
	tvs	%xcc,	0x6
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
	lduh	[%l7 + 0x52],	%g3
	array32	%l4,	%o0,	%o4
	edge32	%i6,	%i5,	%i3
loop_2698:
	bcs,pn	%icc,	loop_2699
	movn	%xcc,	%i2,	%g6
	sub	%o1,	%i1,	%i0
	subc	%o6,	0x0ECD,	%l3
loop_2699:
	fand	%f2,	%f2,	%f0
	nop
	setx	loop_2700,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tsubcc	%g4,	0x185C,	%o2
	movleu	%icc,	%l1,	%i4
	stb	%l0,	[%l7 + 0x0B]
loop_2700:
	fbne	%fcc3,	loop_2701
	andncc	%g2,	%l5,	%o3
	sll	%g7,	%l2,	%o7
	srlx	%g5,	0x1F,	%g1
loop_2701:
	tl	%icc,	0x5
	fmovrdlez	%l6,	%f20,	%f24
	taddcc	%i7,	0x1C4D,	%g3
	alignaddr	%l4,	%o0,	%o5
	fmovrdne	%i6,	%f26,	%f18
	fbg,a	%fcc3,	loop_2702
	mova	%xcc,	%i5,	%o4
	add	%l7,	0x20,	%l6
	wr	%g0,	0x10,	%asi
	casxa	[%l6] 0x10,	%i3,	%g6
loop_2702:
	brgez,a	%o1,	loop_2703
	nop
	fitos	%f12,	%f13
	fstox	%f13,	%f12
	fxtos	%f12,	%f20
	movneg	%icc,	%i2,	%i0
	edge8	%o6,	%i1,	%l3
loop_2703:
	tge	%xcc,	0x3
	bg,a,pt	%xcc,	loop_2704
	smulcc	%o2,	%g4,	%i4
	fpadd16s	%f6,	%f21,	%f27
	bge,pt	%icc,	loop_2705
loop_2704:
	tle	%xcc,	0x5
	nop
	fitod	%f12,	%f0
	fdtos	%f0,	%f18
	subccc	%l0,	0x13E2,	%l1
loop_2705:
	srl	%g2,	%o3,	%g7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f24
	fba	%fcc0,	loop_2706
	addc	%l5,	%o7,	%l2
	nop
	setx	loop_2707,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%g1,	0x0258,	%l6
loop_2706:
	fmovsg	%xcc,	%f26,	%f3
	ldsh	[%l7 + 0x34],	%g5
loop_2707:
	and	%g3,	%l4,	%o0
	tvs	%icc,	0x3
	fpack32	%f18,	%f0,	%f26
	fbe,a	%fcc3,	loop_2708
	fmovsneg	%xcc,	%f14,	%f5
	bleu,a,pt	%xcc,	loop_2709
	orncc	%i7,	0x15B7,	%o5
loop_2708:
	movle	%xcc,	%i6,	%o4
	taddcc	%i3,	0x1628,	%i5
loop_2709:
	and	%o1,	0x0E85,	%g6
	movneg	%icc,	%i0,	%o6
	edge32	%i1,	%i2,	%o2
	andcc	%g4,	0x0F7F,	%i4
	movrne	%l3,	0x0E2,	%l1
	fbuge,a	%fcc1,	loop_2710
	xorcc	%g2,	%o3,	%g7
	tne	%icc,	0x2
	or	%l0,	%l5,	%o7
loop_2710:
	or	%g1,	0x191D,	%l2
	movge	%icc,	%g5,	%g3
	call	loop_2711
	lduh	[%l7 + 0x6E],	%l6
	ldd	[%l7 + 0x20],	%f14
	taddcctv	%l4,	0x10D3,	%i7
loop_2711:
	mulx	%o0,	%i6,	%o5
	sethi	0x0726,	%i3
	nop
	setx	loop_2712,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	edge16l	%o4,	%o1,	%i5
	fmovrdgez	%g6,	%f18,	%f6
	stbar
loop_2712:
	fornot1s	%f25,	%f29,	%f26
	tleu	%xcc,	0x5
	lduw	[%l7 + 0x1C],	%i0
	fpsub16s	%f13,	%f3,	%f2
	fpmerge	%f29,	%f25,	%f14
	sdivcc	%o6,	0x006B,	%i1
	edge8n	%i2,	%o2,	%i4
	brgz	%g4,	loop_2713
	movg	%icc,	%l3,	%l1
	andn	%g2,	0x1199,	%o3
	movrlez	%g7,	0x2C0,	%l0
loop_2713:
	edge8	%o7,	%l5,	%l2
	udivcc	%g1,	0x1A42,	%g5
	tleu	%icc,	0x7
	tge	%icc,	0x3
	xorcc	%g3,	%l6,	%i7
	add	%o0,	0x094E,	%i6
	membar	0x54
	nop
	fitos	%f18,	%f26
	fcmpne32	%f20,	%f0,	%o5
	fbl,a	%fcc2,	loop_2714
	fbul,a	%fcc1,	loop_2715
	fmovdg	%xcc,	%f1,	%f5
	fmovd	%f30,	%f20
loop_2714:
	membar	0x00
loop_2715:
	xnor	%i3,	0x0E18,	%o4
	udivx	%o1,	0x1561,	%i5
	membar	0x70
	add	%l7,	0x58,	%l6
	wr	%g0,	0x18,	%asi
	ldxa	[%l6] %asi,	%l4
	casxa	[%l6] 0x18,	%l4,	%i0
	lduw	[%l7 + 0x34],	%g6
	fbn	%fcc1,	loop_2716
	addc	%i1,	0x0609,	%i2
	taddcctv	%o2,	%o6,	%i4
	andn	%g4,	%l1,	%g2
loop_2716:
	fmovrdne	%o3,	%f0,	%f8
	srax	%g7,	%l3,	%o7
	fcmple32	%f28,	%f12,	%l0
	edge8n	%l2,	%l5,	%g5
	lduh	[%l7 + 0x36],	%g1
	fmovdle	%icc,	%f23,	%f6
	or	%g3,	%i7,	%o0
	nop
	fitod	%f8,	%f6
	fdtox	%f6,	%f0
	fxtod	%f0,	%f16
	fcmpne32	%f16,	%f14,	%i6
	fbn	%fcc0,	loop_2717
	fbule,a	%fcc3,	loop_2718
	tg	%xcc,	0x2
	brlez,a	%o5,	loop_2719
loop_2717:
	movrgez	%l6,	%i3,	%o4
loop_2718:
	nop
	set	0x20, %o3
	ldd	[%l7 + %o3],	%f10
	tge	%xcc,	0x2
loop_2719:
	nop
	set	0x60, %o6
	swapa	[%l7 + %o6] 0x10,	%o1
	movrgz	%i5,	%i0,	%g6
	mova	%xcc,	%i1,	%i2
	and	%o2,	0x0073,	%l4
	taddcctv	%i4,	%o6,	%g4
	stbar
	bne	loop_2720
	tcs	%xcc,	0x7
	bg,a,pn	%icc,	loop_2721
	fmovrdgz	%l1,	%f14,	%f20
loop_2720:
	orncc	%o3,	0x011D,	%g7
	smul	%l3,	0x0F0B,	%o7
loop_2721:
	bge,a,pn	%xcc,	loop_2722
	membar	0x04
	tvs	%icc,	0x2
	edge16l	%l0,	%g2,	%l2
loop_2722:
	edge32n	%g5,	%g1,	%g3
	tsubcctv	%i7,	0x1BFC,	%o0
	tleu	%icc,	0x5
	nop
	setx	loop_2723,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	tl	%xcc,	0x2
	fnors	%f29,	%f18,	%f4
	array32	%i6,	%l5,	%o5
loop_2723:
	fmul8x16al	%f11,	%f27,	%f20
	fcmpeq32	%f6,	%f22,	%i3
	tgu	%xcc,	0x2
	bne	loop_2724
	addcc	%l6,	%o1,	%o4
	fcmple16	%f16,	%f8,	%i5
	sethi	0x18EF,	%g6
loop_2724:
	flush	%l7 + 0x7C
	subc	%i0,	0x068A,	%i1
	mulx	%i2,	0x162D,	%l4
	tg	%icc,	0x2
	fpsub32	%f8,	%f24,	%f4
	ba,a,pn	%icc,	loop_2725
	tne	%icc,	0x7
	subccc	%o2,	%o6,	%g4
	stx	%l1,	[%l7 + 0x28]
loop_2725:
	nop
	set	0x73, %i1
	lduba	[%l7 + %i1] 0x89,	%o3
	fmovrse	%g7,	%f18,	%f25
	subc	%i4,	0x0C58,	%l3
	array16	%l0,	%o7,	%g2
	alignaddrl	%l2,	%g1,	%g3
	lduw	[%l7 + 0x1C],	%i7
	movrgez	%g5,	0x1F9,	%o0
	array16	%l5,	%o5,	%i3
	fmovsvs	%xcc,	%f8,	%f2
	tleu	%icc,	0x0
	bpos,pt	%xcc,	loop_2726
	ta	%xcc,	0x1
	array32	%i6,	%o1,	%o4
	nop
	setx	0x218541E1B4E098C7,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f14
	setx	0x74F5457D6EE85096,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f16
	fdivd	%f16,	%f14,	%f6
loop_2726:
	movrlz	%l6,	%g6,	%i5
	movrgez	%i1,	0x39B,	%i0
	edge8l	%l4,	%i2,	%o6
	orn	%o2,	%g4,	%o3
	movne	%icc,	%g7,	%l1
	array8	%l3,	%l0,	%i4
	tne	%xcc,	0x5
	tsubcctv	%o7,	%g2,	%l2
	bl,a,pt	%icc,	loop_2727
	addcc	%g3,	%i7,	%g1
	bne,pn	%icc,	loop_2728
	movl	%xcc,	%o0,	%l5
loop_2727:
	edge16	%o5,	%i3,	%g5
	set	0x40, %g2
	ldda	[%l7 + %g2] 0x11,	%f0
loop_2728:
	orncc	%i6,	%o1,	%l6
	xnorcc	%g6,	0x04D9,	%i5
	umul	%i1,	0x0740,	%i0
	pdist	%f10,	%f2,	%f28
	edge8	%l4,	%i2,	%o4
	sub	%o2,	%o6,	%o3
	fmovsvs	%icc,	%f10,	%f11
	smul	%g7,	%l1,	%l3
	std	%f26,	[%l7 + 0x18]
	andncc	%g4,	%l0,	%o7
	movrgz	%i4,	0x166,	%g2
	tleu	%xcc,	0x7
	movg	%icc,	%l2,	%i7
	fcmpne16	%f0,	%f14,	%g1
	array32	%o0,	%g3,	%l5
	brlez,a	%o5,	loop_2729
	bvs,a	%icc,	loop_2730
	subcc	%i3,	%g5,	%o1
	andncc	%i6,	%g6,	%i5
loop_2729:
	addcc	%i1,	0x053C,	%i0
loop_2730:
	tn	%icc,	0x6
	fornot1s	%f20,	%f26,	%f6
	movrlez	%l6,	0x0A3,	%l4
	fnot1s	%f2,	%f31
	fandnot2	%f6,	%f8,	%f8
	movgu	%icc,	%o4,	%o2
	edge32ln	%i2,	%o3,	%g7
	tg	%icc,	0x3
	movrlez	%o6,	%l3,	%g4
	fandnot2s	%f3,	%f1,	%f22
	fmul8ulx16	%f0,	%f2,	%f8
	bvs,pt	%xcc,	loop_2731
	bleu,a,pn	%xcc,	loop_2732
	xnorcc	%l0,	%o7,	%l1
	fornot2	%f0,	%f24,	%f14
loop_2731:
	fnot1	%f12,	%f8
loop_2732:
	sethi	0x020A,	%i4
	brnz,a	%g2,	loop_2733
	edge8	%i7,	%l2,	%g1
	fxors	%f2,	%f2,	%f8
	movrlz	%g3,	%l5,	%o5
loop_2733:
	edge8	%i3,	%o0,	%g5
	ba,pn	%icc,	loop_2734
	sethi	0x0A6C,	%i6
	edge8	%o1,	%i5,	%g6
	stx	%i0,	[%l7 + 0x38]
loop_2734:
	fxors	%f25,	%f7,	%f31
	edge32l	%l6,	%l4,	%o4
	mulscc	%i1,	%i2,	%o3
	fandnot2	%f16,	%f22,	%f18
	fmovdgu	%xcc,	%f8,	%f23
	fblg,a	%fcc3,	loop_2735
	fpack32	%f26,	%f20,	%f14
	smul	%g7,	0x089E,	%o2
	subcc	%l3,	%o6,	%l0
loop_2735:
	fnot2s	%f7,	%f7
	bvc,a	%icc,	loop_2736
	movge	%xcc,	%g4,	%o7
	array32	%l1,	%i4,	%g2
	xor	%l2,	0x0B20,	%g1
loop_2736:
	edge8	%g3,	%l5,	%o5
	xorcc	%i3,	0x0AE6,	%i7
	fbu,a	%fcc3,	loop_2737
	movrne	%o0,	%g5,	%o1
	wr	%g0,	0x11,	%asi
	lduha	[%l7 + 0x78] %asi,	%i6
loop_2737:
	edge16ln	%i5,	%i0,	%g6
	edge8n	%l6,	%o4,	%l4
	call	loop_2738
	ldsh	[%l7 + 0x7E],	%i2
	bleu,pt	%xcc,	loop_2739
	brlz,a	%i1,	loop_2740
loop_2738:
	nop
	fitos	%f13,	%f25
	fstox	%f25,	%f0
	fxtos	%f0,	%f25
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
loop_2739:
	movl	%xcc,	%o3,	%o2
loop_2740:
	xorcc	%l3,	0x18FD,	%g7
	tvs	%xcc,	0x6
loop_2741:
	fandnot1s	%f8,	%f4,	%f17
	mulx	%o6,	0x14B0,	%g4
	fbge,a	%fcc2,	loop_2742
	bge,a	loop_2743
	movrlez	%l0,	%o7,	%i4
	bl,a,pt	%icc,	loop_2744
loop_2742:
	sdivcc	%g2,	0x08A5,	%l2
loop_2743:
	fmovsg	%xcc,	%f25,	%f8
	nop
	fitod	%f6,	%f18
	fdtos	%f18,	%f4
loop_2744:
	fsrc1s	%f2,	%f13
	fbug,a	%fcc2,	loop_2745
	ldsh	[%l7 + 0x7C],	%l1
	subcc	%g3,	0x0129,	%l5
	fble,a	%fcc0,	loop_2746
loop_2745:
	tpos	%xcc,	0x7
	bvs,pn	%xcc,	loop_2747
	edge8n	%g1,	%i3,	%i7
loop_2746:
	move	%xcc,	%o0,	%g5
	tneg	%icc,	0x2
loop_2747:
	bvc,a,pt	%xcc,	loop_2748
	tne	%xcc,	0x7
	set	0x40, %g5
	stda	%f0,	[%l7 + %g5] 0x10
loop_2748:
	movcs	%icc,	%o5,	%i6
	fmovrsgz	%i5,	%f21,	%f9
	bn,a,pn	%icc,	loop_2749
	fmovsle	%xcc,	%f29,	%f5
	sra	%i0,	0x01,	%g6
	sir	0x1622
loop_2749:
	stbar
	movrne	%o1,	%o4,	%l4
	fpackfix	%f18,	%f25
	nop
	setx	0x87D2D59EFA507ECF,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	setx	0xCD590B25772AEAD3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f4
	faddd	%f4,	%f24,	%f10
	fcmpgt16	%f22,	%f22,	%l6
	fpsub16	%f18,	%f8,	%f16
	fabss	%f5,	%f9
	wr	%g0,	0x10,	%asi
	lduba	[%l7 + 0x66] %asi,	%i1
	tg	%xcc,	0x6
	subcc	%i2,	%o2,	%o3
	and	%l3,	%o6,	%g4
	fmovdgu	%xcc,	%f25,	%f30
	movge	%xcc,	%g7,	%l0
	movcc	%icc,	%i4,	%g2
	faligndata	%f28,	%f22,	%f8
	fmul8x16	%f18,	%f24,	%f26
	andncc	%l2,	%l1,	%g3
	fmovrde	%l5,	%f8,	%f14
	nop
	fitod	%f8,	%f8
	fdtoi	%f8,	%f11
	fpsub16	%f20,	%f8,	%f0
	fmovs	%f20,	%f22
	andcc	%g1,	%o7,	%i3
	movrlz	%o0,	%g5,	%i7
	mulx	%i6,	%i5,	%i0
	tcc	%icc,	0x0
	fblg	%fcc2,	loop_2750
	fbuge	%fcc0,	loop_2751
	fbu	%fcc1,	loop_2752
	andcc	%o5,	0x17DB,	%o1
loop_2750:
	xnorcc	%g6,	%o4,	%l6
loop_2751:
	tvs	%xcc,	0x3
loop_2752:
	movn	%icc,	%l4,	%i2
	fmul8x16	%f11,	%f22,	%f16
	sll	%i1,	0x1E,	%o2
	set	0x0E, %l0
	ldsba	[%l7 + %l0] 0x0c,	%l3
	or	%o3,	0x00E6,	%g4
	alignaddr	%o6,	%g7,	%i4
	fxnor	%f14,	%f12,	%f16
	fmovsneg	%icc,	%f23,	%f26
	move	%icc,	%g2,	%l0
	tcc	%icc,	0x2
	tsubcctv	%l2,	%g3,	%l5
	wr	%g0,	0x80,	%asi
	swapa	[%l7 + 0x2C] %asi,	%l1
	fbo	%fcc3,	loop_2753
	edge32n	%g1,	%o7,	%o0
	ldsh	[%l7 + 0x4A],	%g5
	sub	%i7,	%i3,	%i6
loop_2753:
	edge32n	%i0,	%o5,	%i5
	movcc	%icc,	%o1,	%g6
	orncc	%o4,	0x1D85,	%l4
	edge32n	%l6,	%i1,	%i2
	fmovda	%icc,	%f7,	%f11
	ldsb	[%l7 + 0x08],	%l3
	mulscc	%o3,	0x17EC,	%o2
	lduw	[%l7 + 0x08],	%o6
	sdivx	%g4,	0x0B98,	%g7
	mova	%icc,	%g2,	%l0
	bl,a	loop_2754
	tge	%xcc,	0x3
	orn	%i4,	%g3,	%l5
	tvc	%icc,	0x0
loop_2754:
	fbul,a	%fcc1,	loop_2755
	sra	%l1,	0x0D,	%g1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bcs,a,pt	%icc,	loop_2756
loop_2755:
	bne	%xcc,	loop_2757
	movpos	%icc,	%o7,	%l2
	movg	%icc,	%o0,	%g5
loop_2756:
	udivx	%i7,	0x007D,	%i6
loop_2757:
	subccc	%i3,	%o5,	%i0
	tneg	%xcc,	0x6
	popc	%o1,	%i5
	tvs	%icc,	0x7
	movvc	%xcc,	%g6,	%o4
	edge32l	%l4,	%i1,	%i2
	ldsb	[%l7 + 0x6A],	%l3
	udivcc	%l6,	0x11A6,	%o3
	fpackfix	%f10,	%f21
	fmovdcc	%xcc,	%f14,	%f17
	orn	%o6,	%o2,	%g4
	tneg	%icc,	0x3
	tsubcc	%g2,	%g7,	%l0
	tl	%xcc,	0x6
	sethi	0x1461,	%g3
	tgu	%xcc,	0x7
	sub	%i4,	%l1,	%g1
	bge,a,pn	%xcc,	loop_2758
	udivx	%o7,	0x053B,	%l2
	stbar
	and	%o0,	0x0A4A,	%g5
loop_2758:
	mulx	%i7,	%i6,	%i3
	movrlz	%l5,	0x25F,	%i0
	brnz,a	%o5,	loop_2759
	edge32n	%i5,	%g6,	%o4
	bg	loop_2760
	fnot1	%f22,	%f2
loop_2759:
	edge16l	%o1,	%l4,	%i1
	sdiv	%l3,	0x1E47,	%i2
loop_2760:
	tge	%icc,	0x3
	nop
	set	0x18, %o1
	stx	%o3,	[%l7 + %o1]
	mulscc	%l6,	%o6,	%o2
	array16	%g2,	%g4,	%l0
	edge32ln	%g7,	%i4,	%l1
	sub	%g1,	0x0024,	%g3
	umul	%o7,	%o0,	%l2
	sir	0x0309
	set	0x68, %o0
	lduwa	[%l7 + %o0] 0x80,	%i7
	bgu	loop_2761
	array8	%g5,	%i3,	%i6
	fnands	%f29,	%f30,	%f24
	taddcc	%i0,	0x11FA,	%l5
loop_2761:
	xorcc	%o5,	%i5,	%o4
	tneg	%xcc,	0x6
	movneg	%xcc,	%o1,	%g6
	alignaddr	%l4,	%i1,	%l3
	flush	%l7 + 0x4C
	udiv	%o3,	0x125F,	%l6
	alignaddr	%o6,	%i2,	%g2
	edge16	%o2,	%g4,	%g7
	fbule	%fcc0,	loop_2762
	fpsub16s	%f3,	%f7,	%f23
	fpsub16	%f20,	%f0,	%f18
	fbge,a	%fcc2,	loop_2763
loop_2762:
	fcmple32	%f2,	%f8,	%l0
	fba,a	%fcc1,	loop_2764
	orncc	%l1,	0x03A7,	%g1
loop_2763:
	array32	%i4,	%g3,	%o7
	set	0x60, %g4
	ldda	[%l7 + %g4] 0xeb,	%l2
loop_2764:
	array16	%i7,	%o0,	%i3
	sdivcc	%i6,	0x0CD9,	%i0
	sethi	0x0B8D,	%l5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g5,	%o5,	%i5
	movrgz	%o4,	0x3BF,	%o1
	bcs,pt	%icc,	loop_2765
	array16	%g6,	%l4,	%i1
	taddcctv	%o3,	%l3,	%l6
	srax	%o6,	0x19,	%g2
loop_2765:
	srlx	%o2,	%g4,	%g7
	mulx	%l0,	%i2,	%g1
	andncc	%i4,	%g3,	%o7
	tvs	%xcc,	0x2
	bgu,a	loop_2766
	edge8l	%l1,	%l2,	%i7
	movne	%icc,	%i3,	%i6
	fxnor	%f16,	%f4,	%f2
loop_2766:
	bcc,a,pt	%icc,	loop_2767
	nop
	fitos	%f21,	%f26
	andncc	%i0,	%o0,	%g5
	tsubcc	%o5,	%i5,	%l5
loop_2767:
	fbu,a	%fcc2,	loop_2768
	subcc	%o1,	%o4,	%g6
	fmovrsgz	%l4,	%f28,	%f5
	tsubcctv	%o3,	0x1348,	%l3
loop_2768:
	nop
	wr	%g0,	0x80,	%asi
	ldxa	[%l7 + 0x28] %asi,	%l6
	srlx	%o6,	%g2,	%i1
	wr	%g0,	0x10,	%asi
	lduha	[%l7 + 0x48] %asi,	%o2
	tpos	%xcc,	0x5
	movgu	%xcc,	%g7,	%l0
	umulcc	%i2,	0x1F79,	%g4
	sdiv	%g1,	0x17A2,	%i4
	fbug,a	%fcc2,	loop_2769
	edge32	%o7,	%g3,	%l2
	wr	%g0,	0x89,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2769:
	tg	%icc,	0x7
	addccc	%i7,	0x1720,	%l1
	orcc	%i3,	%i0,	%o0
	nop
	setx	0x85F9C3E6E0440B41,	%l0,	%l6
	stx	%l6,	[%l7 + 0x70]
	ldx	[%l7 + 0x70],	%fsr
	fmovdle	%icc,	%f12,	%f21
	ldx	[%l7 + 0x18],	%g5
	udivcc	%o5,	0x18B8,	%i6
	fabss	%f16,	%f29
	brlz,a	%i5,	loop_2770
	edge16n	%l5,	%o4,	%g6
	tcc	%xcc,	0x4
	fmovrdne	%o1,	%f0,	%f26
loop_2770:
	movrgz	%o3,	0x044,	%l3
	tne	%xcc,	0x7
	fmovse	%xcc,	%f0,	%f3
	movrgz	%l4,	%l6,	%o6
	fbo	%fcc0,	loop_2771
	tn	%xcc,	0x3
	srl	%i1,	%o2,	%g7
	stw	%g2,	[%l7 + 0x60]
loop_2771:
	addc	%i2,	%l0,	%g1
	movrgez	%i4,	0x3D2,	%g4
	edge32	%g3,	%l2,	%o7
	edge8	%i7,	%i3,	%l1
	fbne,a	%fcc1,	loop_2772
	xnorcc	%o0,	0x081D,	%i0
	move	%icc,	%g5,	%o5
	add	%l7,	0x18,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%i6,	%l5
loop_2772:
	fmovsge	%icc,	%f2,	%f5
	bshuffle	%f8,	%f16,	%f28
	edge32n	%o4,	%g6,	%o1
	ldsh	[%l7 + 0x12],	%o3
	fmovsl	%icc,	%f18,	%f23
	or	%l3,	%i5,	%l4
	tleu	%xcc,	0x4
	brlz	%l6,	loop_2773
	edge8n	%i1,	%o6,	%o2
	sra	%g2,	%g7,	%i2
	movle	%xcc,	%l0,	%i4
loop_2773:
	nop
	setx	0xB12C97AE,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f25
	fsqrts	%f25,	%f30
	smulcc	%g4,	%g1,	%g3
	fmovse	%xcc,	%f13,	%f1
	fxors	%f18,	%f22,	%f7
	xnorcc	%l2,	0x1917,	%o7
	tvs	%xcc,	0x5
	lduh	[%l7 + 0x62],	%i7
	movcs	%icc,	%i3,	%o0
	array16	%l1,	%g5,	%o5
	movn	%xcc,	%i0,	%l5
	smulcc	%o4,	0x0105,	%i6
	wr	%g0,	0x20,	%asi
	stxa	%g6,	[%g0 + 0x28] %asi
	xnor	%o3,	0x01FD,	%o1
	tle	%icc,	0x2
	srax	%l3,	0x06,	%l4
	tsubcc	%i5,	%i1,	%o6
	udivcc	%o2,	0x13B6,	%l6
	taddcc	%g7,	0x1D4A,	%i2
	tne	%xcc,	0x6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l0,	%g2
	edge16n	%i4,	%g4,	%g1
	add	%l2,	0x1280,	%o7
	mova	%icc,	%g3,	%i3
	bpos	loop_2774
	brgez,a	%o0,	loop_2775
	edge16n	%i7,	%g5,	%o5
	fandnot2s	%f7,	%f13,	%f19
loop_2774:
	st	%f14,	[%l7 + 0x24]
loop_2775:
	fba,a	%fcc1,	loop_2776
	nop
	set	0x38, %o7
	stx	%i0,	[%l7 + %o7]
	move	%icc,	%l1,	%l5
	wr	%g0,	0x18,	%asi
	sta	%f22,	[%l7 + 0x70] %asi
loop_2776:
	fba	%fcc3,	loop_2777
	fmovdcc	%icc,	%f20,	%f24
	bne,pn	%icc,	loop_2778
	fmul8ulx16	%f22,	%f14,	%f22
loop_2777:
	movvs	%xcc,	%i6,	%o4
	fmovde	%xcc,	%f11,	%f13
loop_2778:
	edge32l	%g6,	%o1,	%l3
	movrgez	%o3,	0x3A1,	%l4
	fmovdcs	%xcc,	%f13,	%f25
	nop
	fitos	%f1,	%f7
	fstox	%f7,	%f2
	fxtos	%f2,	%f13
	set	0x54, %o5
	lduwa	[%l7 + %o5] 0x10,	%i5
	movvs	%xcc,	%i1,	%o6
	sdivx	%l6,	0x1330,	%o2
	fmovdcs	%icc,	%f7,	%f1
	subc	%i2,	%l0,	%g7
	xorcc	%g2,	%i4,	%g1
	tne	%xcc,	0x0
	nop
	fitod	%f2,	%f12
	fdtox	%f12,	%f12
	fxtod	%f12,	%f26
	bneg,a,pn	%icc,	loop_2779
	nop
	setx	0x80666E58,	%l0,	%l6
	st	%l6,	[%l7 + 0x40]
	ld	[%l7 + 0x40],	%fsr
	fpsub16s	%f21,	%f12,	%f22
	udivx	%l2,	0x0ABF,	%g4
loop_2779:
	stx	%o7,	[%l7 + 0x68]
	fpackfix	%f0,	%f9
	and	%g3,	%o0,	%i3
	array16	%g5,	%i7,	%o5
	movneg	%xcc,	%l1,	%i0
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f2,	%f8
	srlx	%l5,	%i6,	%g6
	bn,pt	%xcc,	loop_2780
	xorcc	%o1,	0x1098,	%l3
	brgz	%o4,	loop_2781
	movvs	%xcc,	%l4,	%i5
loop_2780:
	tcs	%icc,	0x5
	movcc	%icc,	%o3,	%o6
loop_2781:
	fmovde	%icc,	%f9,	%f17
	taddcctv	%i1,	0x1BBD,	%l6
	andn	%o2,	0x1D26,	%i2
	be,a	loop_2782
	fmovdg	%xcc,	%f19,	%f29
	sth	%l0,	[%l7 + 0x16]
	fbg	%fcc0,	loop_2783
loop_2782:
	fmovs	%f1,	%f23
	srlx	%g2,	%i4,	%g7
	andncc	%l2,	%g1,	%g4
loop_2783:
	tcc	%icc,	0x1
	sdivcc	%g3,	0x18F9,	%o7
	fmovdvs	%icc,	%f5,	%f14
	tgu	%icc,	0x7
	edge32l	%i3,	%o0,	%i7
	popc	0x0A65,	%o5
	andcc	%g5,	%i0,	%l5
	movcc	%icc,	%l1,	%g6
	taddcctv	%i6,	0x1F0F,	%o1
	fcmpgt16	%f8,	%f0,	%l3
	prefetch	[%l7 + 0x34],	 0x1
	bl,pt	%xcc,	loop_2784
	addcc	%l4,	0x1B48,	%i5
	smul	%o4,	%o6,	%o3
	fnot2s	%f16,	%f8
loop_2784:
	fxor	%f24,	%f28,	%f18
	nop
	set	0x5E, %l3
	sth	%l6,	[%l7 + %l3]
	edge8ln	%o2,	%i2,	%i1
	sdivx	%g2,	0x0B7E,	%i4
	tvc	%icc,	0x6
	tsubcc	%g7,	%l2,	%l0
	tvs	%xcc,	0x6
	bleu,a,pt	%xcc,	loop_2785
	lduw	[%l7 + 0x44],	%g1
	popc	0x0B2E,	%g3
	fmovrdgez	%g4,	%f2,	%f14
loop_2785:
	taddcctv	%o7,	%o0,	%i7
	bgu,a	%icc,	loop_2786
	nop
	setx	loop_2787,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	bgu,a,pt	%xcc,	loop_2788
	subccc	%o5,	%i3,	%g5
loop_2786:
	fmovsgu	%xcc,	%f9,	%f17
loop_2787:
	orn	%i0,	%l1,	%l5
loop_2788:
	nop
	wr	%g0,	0x89,	%asi
	ldsha	[%l7 + 0x14] %asi,	%g6
	fnegd	%f8,	%f30
	stb	%o1,	[%l7 + 0x68]
	umul	%i6,	%l4,	%i5
	array8	%l3,	%o6,	%o3
	set	0x18, %l6
	sta	%f29,	[%l7 + %l6] 0x89
	brgz	%o4,	loop_2789
	fble,a	%fcc2,	loop_2790
	tvs	%icc,	0x7
	fabss	%f22,	%f17
loop_2789:
	edge32ln	%l6,	%i2,	%o2
loop_2790:
	edge16ln	%g2,	%i4,	%g7
	fnot1	%f10,	%f14
	tsubcc	%l2,	0x1044,	%i1
	fmovrdgz	%l0,	%f8,	%f10
	tpos	%xcc,	0x4
	edge32ln	%g1,	%g4,	%g3
	ldsb	[%l7 + 0x33],	%o7
	bpos,a	%xcc,	loop_2791
	movl	%xcc,	%o0,	%o5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bge,pn	%xcc,	loop_2792
loop_2791:
	srax	%i7,	0x0B,	%i3
	popc	%g5,	%l1
	movrne	%i0,	%g6,	%o1
loop_2792:
	fmovda	%icc,	%f3,	%f13
	edge16	%l5,	%l4,	%i5
	movcs	%icc,	%l3,	%i6
	fsrc2	%f8,	%f22
	sdiv	%o6,	0x1503,	%o4
	movcc	%icc,	%l6,	%o3
	fornot1s	%f6,	%f17,	%f23
	taddcctv	%i2,	%o2,	%i4
	movrlz	%g7,	0x35C,	%g2
	srax	%l2,	%l0,	%i1
	fcmpne16	%f18,	%f24,	%g1
	fands	%f20,	%f13,	%f23
	edge8ln	%g4,	%o7,	%g3
	fmovdvc	%xcc,	%f17,	%f1
	sethi	0x1731,	%o0
	fnands	%f16,	%f0,	%f16
	sdiv	%i7,	0x1BEB,	%i3
	xor	%o5,	0x1984,	%g5
	nop
	setx	0x8E212C7E,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f13
	fsqrts	%f13,	%f2
	edge8	%l1,	%g6,	%i0
	xor	%o1,	0x07E2,	%l4
	fcmpgt16	%f24,	%f24,	%i5
	tsubcc	%l3,	%l5,	%o6
	ldsb	[%l7 + 0x50],	%o4
	fpadd32	%f2,	%f4,	%f8
	edge32l	%i6,	%l6,	%i2
	fnand	%f24,	%f18,	%f12
	bgu,a,pn	%icc,	loop_2793
	tsubcctv	%o2,	%o3,	%i4
	tcc	%icc,	0x3
	stb	%g2,	[%l7 + 0x67]
loop_2793:
	edge8ln	%g7,	%l0,	%i1
	fnors	%f18,	%f7,	%f8
	swap	[%l7 + 0x24],	%l2
	movgu	%xcc,	%g1,	%g4
	wr	%g0,	0x18,	%asi
	ldda	[%l7 + 0x30] %asi,	%g2
	movrlez	%o0,	%i7,	%i3
	popc	%o7,	%g5
	stx	%o5,	[%l7 + 0x18]
	swap	[%l7 + 0x28],	%g6
	set	0x56, %i2
	ldsba	[%l7 + %i2] 0x04,	%i0
	nop
	set	0x26, %i4
	stb	%o1,	[%l7 + %i4]
	andncc	%l4,	%i5,	%l3
	brgz,a	%l1,	loop_2794
	mulx	%o6,	0x1A8F,	%l5
	andn	%i6,	%l6,	%i2
	movrgz	%o4,	0x22C,	%o2
loop_2794:
	fzeros	%f10
	brgz	%o3,	loop_2795
	fbo,a	%fcc3,	loop_2796
	edge8	%g2,	%g7,	%l0
	stw	%i4,	[%l7 + 0x0C]
loop_2795:
	nop
	wr	%g0,	0x0c,	%asi
	ldswa	[%l7 + 0x24] %asi,	%l2
loop_2796:
	fxnors	%f11,	%f30,	%f15
	nop
	setx	0x8039F5DA00489E78,	%l0,	%l6
	stx	%l6,	[%l7 + 0x18]
	ldx	[%l7 + 0x18],	%fsr
	tgu	%icc,	0x7
	fmuld8ulx16	%f25,	%f5,	%f2
	fmovrdgz	%i1,	%f0,	%f6
	movvs	%icc,	%g4,	%g3
	tl	%xcc,	0x7
	fbuge	%fcc2,	loop_2797
	popc	0x1D59,	%o0
	for	%f6,	%f16,	%f30
	edge8l	%g1,	%i3,	%i7
loop_2797:
	fba	%fcc3,	loop_2798
	tcs	%icc,	0x4
	subc	%o7,	0x1C1F,	%g5
	fcmpne16	%f14,	%f4,	%o5
loop_2798:
	movg	%xcc,	%i0,	%o1
	bvc	loop_2799
	movrgez	%g6,	%i5,	%l3
	bshuffle	%f6,	%f22,	%f0
	fnands	%f6,	%f31,	%f22
loop_2799:
	srlx	%l1,	0x1F,	%l4
	fpmerge	%f22,	%f10,	%f4
	mova	%icc,	%l5,	%i6
	nop
	fitos	%f8,	%f19
	fstox	%f19,	%f10
	fxtos	%f10,	%f18
	prefetch	[%l7 + 0x3C],	 0x0
	nop
	fitod	%f21,	%f18
	andn	%l6,	%o6,	%i2
	xnorcc	%o2,	%o3,	%g2
	nop
	setx	loop_2800,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	movne	%xcc,	%g7,	%l0
	tg	%xcc,	0x0
	sdiv	%i4,	0x121E,	%l2
loop_2800:
	fbo	%fcc1,	loop_2801
	movpos	%xcc,	%i1,	%o4
	mulx	%g4,	0x0F97,	%g3
	mulx	%o0,	0x0329,	%g1
loop_2801:
	movcc	%icc,	%i3,	%o7
	fabss	%f20,	%f25
	mulx	%i7,	%o5,	%i0
	fxnors	%f31,	%f20,	%f7
	move	%xcc,	%o1,	%g6
	fbe	%fcc1,	loop_2802
	edge16	%i5,	%l3,	%l1
	fmovd	%f6,	%f26
	edge8	%g5,	%l4,	%i6
loop_2802:
	orcc	%l5,	%l6,	%o6
	edge32n	%i2,	%o3,	%o2
	fmovdle	%xcc,	%f13,	%f10
	mulscc	%g7,	0x13E6,	%l0
	nop
	set	0x24, %g3
	lduw	[%l7 + %g3],	%g2
	bvc	%xcc,	loop_2803
	sdivcc	%i4,	0x1D48,	%l2
	mulx	%o4,	%i1,	%g4
	fbl	%fcc1,	loop_2804
loop_2803:
	fnot2	%f0,	%f10
	add	%l7,	0x48,	%l6
	wr	%g0,	0x81,	%asi
	lda	[%l6] %asi,	%g3
	casa	[%l6] 0x81,	%g3,	%g1
loop_2804:
	fmul8x16au	%f4,	%f8,	%f4
	edge16l	%i3,	%o7,	%i7
	fcmpgt32	%f6,	%f30,	%o0
	addc	%i0,	0x17AE,	%o5
	fmovsge	%icc,	%f20,	%f0
	ldd	[%l7 + 0x40],	%f20
	bne,a	%xcc,	loop_2805
	movpos	%icc,	%g6,	%o1
	xor	%i5,	%l1,	%g5
	tsubcc	%l3,	0x0598,	%i6
loop_2805:
	movleu	%icc,	%l5,	%l4
	xnorcc	%l6,	0x1F60,	%i2
	bvc,a	%xcc,	loop_2806
	bcs,pt	%icc,	loop_2807
	edge16l	%o6,	%o2,	%g7
	ldd	[%l7 + 0x70],	%f18
loop_2806:
	stb	%o3,	[%l7 + 0x3A]
loop_2807:
	movn	%icc,	%l0,	%g2
	fmul8ulx16	%f30,	%f6,	%f10
	fbo,a	%fcc1,	loop_2808
	bcs,a	%icc,	loop_2809
	fmovrslz	%i4,	%f8,	%f7
	fones	%f29
loop_2808:
	nop
	setx	0x363249B5,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	setx	0xD36A0425,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f7
	fadds	%f7,	%f21,	%f2
loop_2809:
	fands	%f27,	%f9,	%f20
	wr	%g0,	0x81,	%asi
	lduwa	[%l7 + 0x28] %asi,	%o4
	std	%f10,	[%l7 + 0x58]
	ldx	[%l7 + 0x08],	%l2
	fcmpne32	%f0,	%f10,	%g4
	movrgz	%i1,	0x244,	%g1
	movl	%icc,	%g3,	%i3
	movrlez	%i7,	%o7,	%o0
	popc	0x1172,	%o5
	sll	%g6,	0x1F,	%i0
	edge8ln	%o1,	%l1,	%i5
	fmovsvc	%xcc,	%f10,	%f10
	andcc	%g5,	%l3,	%l5
	tge	%icc,	0x2
	move	%icc,	%l4,	%i6
	wr	%g0,	0x89,	%asi
	swapa	[%l7 + 0x54] %asi,	%l6
	xor	%o6,	0x0717,	%i2
	bneg,a,pn	%icc,	loop_2810
	bleu,a	%xcc,	loop_2811
	taddcctv	%g7,	%o3,	%l0
	tvs	%icc,	0x7
loop_2810:
	membar	0x67
loop_2811:
	tleu	%xcc,	0x5
	movre	%o2,	0x30E,	%g2
	wr	%g0,	0x04,	%asi
	stha	%i4,	[%l7 + 0x12] %asi
	fcmple16	%f10,	%f2,	%l2
	movl	%icc,	%g4,	%o4
	andn	%i1,	0x0050,	%g1
	bvs,a	%xcc,	loop_2812
	tn	%icc,	0x3
	sll	%i3,	0x09,	%g3
	movne	%xcc,	%i7,	%o0
loop_2812:
	prefetch	[%l7 + 0x10],	 0x3
	orcc	%o5,	%o7,	%g6
	fornot1	%f20,	%f16,	%f2
	edge8	%o1,	%i0,	%i5
	subc	%g5,	%l3,	%l1
	fmovrsgez	%l4,	%f22,	%f24
	ldx	[%l7 + 0x48],	%i6
	wr	%g0,	0x10,	%asi
	stba	%l5,	[%l7 + 0x4B] %asi
	tne	%xcc,	0x4
	srax	%l6,	%o6,	%g7
	fmovsvs	%xcc,	%f12,	%f8
	nop
	setx	loop_2813,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	tgu	%xcc,	0x5
	movl	%xcc,	%o3,	%l0
	nop
	setx	0xF04B66C2,	%l0,	%l6
	st	%l6,	[%l7 + 0x2C]
	ld	[%l7 + 0x2C],	%fsr
loop_2813:
	fmovrde	%o2,	%f26,	%f26
	edge16n	%i2,	%g2,	%l2
	movrne	%g4,	%i4,	%i1
	fmovdcs	%icc,	%f7,	%f10
	nop
	setx	0x154BE435,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f21
	fsqrts	%f21,	%f31
	nop
	setx	0x801C554D,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f7
	fsqrts	%f7,	%f21
	bneg,pt	%xcc,	loop_2814
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	taddcctv	%g1,	0x1E73,	%i3
	fble	%fcc3,	loop_2815
loop_2814:
	fmovdvs	%xcc,	%f2,	%f14
	edge8n	%o4,	%i7,	%o0
	srl	%o5,	%o7,	%g6
loop_2815:
	nop
	add	%l7,	0x78,	%l6
	wr	%g0,	0x89,	%asi
	casxa	[%l6] %asi,	%g3,	%o1
	fmovrdgez	%i0,	%f26,	%f22
	tgu	%icc,	0x3
	nop
	fitos	%f1,	%f3
	fstox	%f3,	%f24
	fxtos	%f24,	%f26
	movrne	%i5,	0x393,	%g5
	fmovdn	%icc,	%f7,	%f4
	mova	%xcc,	%l3,	%l1
	tne	%xcc,	0x7
	tcc	%xcc,	0x4
	movl	%icc,	%i6,	%l5
	wr	%g0,	0xe3,	%asi
	ldda	[%l7 + 0x40] %asi,	%l4
	fmovrsne	%l6,	%f23,	%f28
	movrgez	%g7,	%o3,	%l0
	edge8	%o6,	%i2,	%g2
	movcs	%xcc,	%l2,	%o2
	prefetch	[%l7 + 0x58],	 0x1
	alignaddr	%g4,	%i4,	%g1
	tvs	%xcc,	0x4
	tge	%xcc,	0x2
	taddcc	%i3,	%i1,	%i7
	subccc	%o0,	%o5,	%o7
	subcc	%g6,	%o4,	%o1
	tsubcctv	%i0,	0x113E,	%i5
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g5,	%l3,	%g3
	movcs	%xcc,	%l1,	%i6
	tvs	%xcc,	0x1
	mulscc	%l5,	%l6,	%g7
	edge16l	%l4,	%o3,	%o6
	wr	%g0,	0x19,	%asi
	stba	%l0,	[%l7 + 0x39] %asi
	tvc	%xcc,	0x2
	nop
	fitod	%f0,	%f12
	fdtox	%f12,	%f6
	movcc	%xcc,	%i2,	%l2
	fpsub32	%f30,	%f12,	%f12
	add	%l7,	0x28,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%g2
	casa	[%l6] 0x80,	%g2,	%o2
	movvs	%xcc,	%i4,	%g4
	edge32	%i3,	%i1,	%g1
	be,a,pt	%icc,	loop_2816
	prefetch	[%l7 + 0x44],	 0x3
	bcs,pt	%icc,	loop_2817
	fmul8x16au	%f10,	%f30,	%f2
loop_2816:
	stbar
	fnor	%f30,	%f28,	%f16
loop_2817:
	fmovrdlz	%i7,	%f28,	%f6
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o5,	%o7,	%g6
	flush	%l7 + 0x3C
	edge16n	%o4,	%o0,	%i0
	fabsd	%f2,	%f18
	tne	%icc,	0x7
	srl	%i5,	0x04,	%g5
	movleu	%xcc,	%o1,	%g3
	fandnot2s	%f2,	%f20,	%f20
	addc	%l1,	%l3,	%l5
	tn	%xcc,	0x6
	sethi	0x0620,	%l6
	movgu	%xcc,	%i6,	%g7
	srl	%o3,	0x00,	%l4
	tge	%xcc,	0x5
	sra	%l0,	0x0A,	%o6
	movrlez	%l2,	0x201,	%i2
	addccc	%o2,	%i4,	%g4
	xor	%g2,	%i1,	%g1
	ldsb	[%l7 + 0x3D],	%i7
	fzero	%f10
	nop
	setx	0x968E3AC6A0451131,	%l0,	%l6
	stx	%l6,	[%l7 + 0x08]
	ldx	[%l7 + 0x08],	%fsr
	fpsub16s	%f5,	%f23,	%f16
	faligndata	%f28,	%f16,	%f26
	fmovdcc	%xcc,	%f9,	%f7
	fmovrse	%o5,	%f8,	%f14
	umulcc	%o7,	%i3,	%o4
	sll	%o0,	0x0E,	%i0
	fand	%f0,	%f6,	%f26
	nop
	fitos	%f13,	%f30
	fstox	%f30,	%f14
	prefetch	[%l7 + 0x78],	 0x0
	swap	[%l7 + 0x58],	%g6
	be,a	%icc,	loop_2818
	tle	%icc,	0x5
	tvs	%xcc,	0x4
	fsrc1s	%f19,	%f24
loop_2818:
	nop
	set	0x10, %o4
	stxa	%g5,	[%l7 + %o4] 0x11
	nop
	fitod	%f4,	%f10
	edge16	%i5,	%o1,	%g3
	stb	%l3,	[%l7 + 0x30]
	fbn	%fcc2,	loop_2819
	fpsub32s	%f19,	%f24,	%f14
	fmovsleu	%xcc,	%f3,	%f7
	edge16l	%l5,	%l1,	%i6
loop_2819:
	tvs	%icc,	0x2
	andn	%l6,	0x01DE,	%g7
	fmovscc	%icc,	%f19,	%f28
	umulcc	%l4,	%o3,	%l0
	fxnors	%f2,	%f4,	%f21
	bcs,a	%xcc,	loop_2820
	std	%f28,	[%l7 + 0x68]
	orn	%o6,	0x1DFA,	%l2
	set	0x14, %g7
	stwa	%o2,	[%l7 + %g7] 0x23
	membar	#Sync
loop_2820:
	edge16n	%i2,	%g4,	%i4
	edge16n	%i1,	%g1,	%g2
	nop
	fitod	%f2,	%f6
	fdtox	%f6,	%f22
	fxtod	%f22,	%f26
	movrgez	%o5,	%o7,	%i3
	movneg	%xcc,	%i7,	%o4
	set	0x2C, %l1
	ldswa	[%l7 + %l1] 0x04,	%o0
	tvs	%icc,	0x4
	srl	%g6,	%i0,	%g5
	brgez,a	%o1,	loop_2821
	nop
	fitos	%f11,	%f5
	fstod	%f5,	%f0
	movrlez	%i5,	%l3,	%g3
	tleu	%icc,	0x5
loop_2821:
	fabss	%f7,	%f30
	membar	0x00
	movgu	%icc,	%l5,	%l1
	xnorcc	%i6,	0x076C,	%g7
	fmovrde	%l4,	%f10,	%f6
	std	%f12,	[%l7 + 0x78]
	fbl	%fcc3,	loop_2822
	xor	%o3,	%l6,	%o6
	wr	%g0,	0x2a,	%asi
	stha	%l0,	[%l7 + 0x20] %asi
	membar	#Sync
loop_2822:
	ldd	[%l7 + 0x38],	%o2
	movvs	%icc,	%i2,	%l2
	sdivx	%i4,	0x1C44,	%i1
	wr	%g0,	0x10,	%asi
	ldswa	[%l7 + 0x64] %asi,	%g4
	movneg	%icc,	%g2,	%g1
	fbuge,a	%fcc1,	loop_2823
	tpos	%icc,	0x2
	movrgez	%o7,	%o5,	%i3
	tl	%icc,	0x7
loop_2823:
	nop
	set	0x18, %g6
	stxa	%o4,	[%l7 + %g6] 0xe3
	membar	#Sync
	sll	%o0,	0x16,	%i7
	smul	%g6,	%i0,	%g5
	edge32	%i5,	%o1,	%g3
	bcs,pn	%icc,	loop_2824
	xorcc	%l3,	%l5,	%l1
	movg	%icc,	%i6,	%l4
	xor	%g7,	0x075C,	%l6
loop_2824:
	tg	%icc,	0x3
	movleu	%icc,	%o3,	%l0
	umul	%o2,	0x0738,	%o6
	bvs,a,pt	%xcc,	loop_2825
	bgu,a	loop_2826
	movrgz	%l2,	0x0FC,	%i2
	movpos	%xcc,	%i1,	%g4
loop_2825:
	fbn,a	%fcc0,	loop_2827
loop_2826:
	movleu	%xcc,	%g2,	%g1
	edge16n	%i4,	%o5,	%i3
	movvc	%icc,	%o7,	%o0
loop_2827:
	nop
	set	0x0F, %i6
	lduba	[%l7 + %i6] 0x0c,	%i7
	fornot2s	%f1,	%f29,	%f6
	mulx	%o4,	0x0C3E,	%g6
	movrlez	%g5,	%i5,	%o1
	mulx	%g3,	0x1DAE,	%i0
	fmovdcs	%xcc,	%f30,	%f26
	udivcc	%l5,	0x1E2B,	%l3
	fbl	%fcc2,	loop_2828
	ba,a	%icc,	loop_2829
	tg	%xcc,	0x1
	fmovdne	%icc,	%f5,	%f7
loop_2828:
	fnand	%f14,	%f28,	%f10
loop_2829:
	fba	%fcc0,	loop_2830
	fpadd16s	%f14,	%f10,	%f26
	srl	%i6,	%l1,	%l4
	bg,pt	%icc,	loop_2831
loop_2830:
	umul	%l6,	0x17A3,	%o3
	subc	%l0,	%g7,	%o2
	brgz,a	%o6,	loop_2832
loop_2831:
	sir	0x1BD2
	edge32	%i2,	%i1,	%l2
	popc	%g2,	%g4
loop_2832:
	fnors	%f21,	%f7,	%f12
	fabss	%f26,	%f13
	fmovscc	%icc,	%f0,	%f4
	fpadd16	%f20,	%f20,	%f14
	set	0x2A, %i0
	stha	%i4,	[%l7 + %i0] 0x88
	srlx	%g1,	%o5,	%i3
	movleu	%icc,	%o0,	%o7
	nop
	fitos	%f1,	%f5
	fstoi	%f5,	%f7
	fxor	%f24,	%f16,	%f30
	xor	%o4,	%i7,	%g5
	udiv	%i5,	0x03FF,	%g6
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x40] %asi,	%g3
	mulx	%o1,	%i0,	%l3
	fbue	%fcc2,	loop_2833
	st	%f22,	[%l7 + 0x2C]
	set	0x70, %i5
	ldda	[%l7 + %i5] 0x04,	%i6
loop_2833:
	nop
	wr	%g0,	0x10,	%asi
	prefetcha	[%l7 + 0x38] %asi,	 0x1
	tcc	%xcc,	0x1
	tle	%xcc,	0x2
	movne	%icc,	%l4,	%l1
	sub	%o3,	0x11B7,	%l6
	membar	0x03
	orn	%l0,	0x008A,	%o2
	set	0x78, %l2
	prefetcha	[%l7 + %l2] 0x89,	 0x0
	prefetch	[%l7 + 0x14],	 0x0
	bge	loop_2834
	movgu	%xcc,	%i2,	%g7
	array16	%l2,	%i1,	%g4
	mulscc	%g2,	0x12BF,	%g1
loop_2834:
	nop
	fitod	%f6,	%f10
	fdtos	%f10,	%f31
	tcc	%xcc,	0x4
	sub	%o5,	0x10FE,	%i3
	nop
	set	0x6C, %i7
	ldsw	[%l7 + %i7],	%i4
	fxors	%f24,	%f31,	%f25
	ldd	[%l7 + 0x58],	%o0
	fmovdcs	%icc,	%f29,	%f20
	ldstub	[%l7 + 0x38],	%o7
	subcc	%o4,	0x19FD,	%i7
	fabsd	%f4,	%f26
	brgez,a	%g5,	loop_2835
	udivcc	%g6,	0x17AF,	%g3
	bne	loop_2836
	xnor	%o1,	0x1880,	%i5
loop_2835:
	bneg,a	%xcc,	loop_2837
	edge32ln	%l3,	%i0,	%l5
loop_2836:
	movpos	%xcc,	%i6,	%l1
	edge8	%l4,	%l6,	%o3
loop_2837:
	xnorcc	%l0,	0x12CD,	%o2
	alignaddr	%i2,	%o6,	%l2
	movrgez	%i1,	0x08D,	%g7
	xnorcc	%g2,	0x0812,	%g4
	fandnot2s	%f14,	%f21,	%f3
	wr	%g0,	0xe3,	%asi
	stha	%g1,	[%l7 + 0x4E] %asi
	membar	#Sync
	subccc	%i3,	%o5,	%o0
	bvs,pt	%icc,	loop_2838
	udivx	%o7,	0x0997,	%o4
	movleu	%xcc,	%i7,	%i4
	sdivcc	%g6,	0x07F2,	%g3
loop_2838:
	fbg,a	%fcc3,	loop_2839
	fbuge,a	%fcc0,	loop_2840
	te	%xcc,	0x3
	smul	%g5,	0x0C66,	%i5
loop_2839:
	fcmpne32	%f14,	%f14,	%o1
loop_2840:
	tge	%icc,	0x7
	movl	%icc,	%l3,	%i0
	edge32	%l5,	%i6,	%l1
	fmovdleu	%icc,	%f0,	%f10
	edge32l	%l4,	%o3,	%l6
	mulx	%l0,	%i2,	%o2
	tge	%icc,	0x0
	andn	%l2,	%i1,	%g7
	fmul8x16al	%f15,	%f5,	%f26
	edge32n	%g2,	%o6,	%g4
	tsubcctv	%i3,	%o5,	%g1
	fmovrdlez	%o0,	%f12,	%f2
	fnot2	%f8,	%f30
	std	%f28,	[%l7 + 0x18]
	tcc	%icc,	0x7
	ldstub	[%l7 + 0x63],	%o7
	tcs	%icc,	0x1
	fmovsn	%icc,	%f15,	%f4
	popc	0x175D,	%o4
	bneg	%xcc,	loop_2841
	tcc	%xcc,	0x7
	wr	%g0,	0x2b,	%asi
	stwa	%i7,	[%l7 + 0x44] %asi
	membar	#Sync
loop_2841:
	tpos	%xcc,	0x1
	sethi	0x092B,	%i4
	add	%l7,	0x50,	%l6
	wr	%g0,	0x18,	%asi
	casxa	[%l6] %asi,	%g6,	%g3
	set	0x2C, %l5
	sta	%f7,	[%l7 + %l5] 0x10
	stw	%g5,	[%l7 + 0x48]
	fbe	%fcc3,	loop_2842
	fmul8ulx16	%f18,	%f4,	%f10
	fbu,a	%fcc1,	loop_2843
	bl,pt	%icc,	loop_2844
loop_2842:
	tn	%icc,	0x1
	edge16	%i5,	%l3,	%o1
loop_2843:
	fbu	%fcc1,	loop_2845
loop_2844:
	fornot1	%f16,	%f22,	%f6
	add	%l5,	%i6,	%i0
	fmul8sux16	%f0,	%f20,	%f30
loop_2845:
	bl,a,pt	%icc,	loop_2846
	bge,a,pn	%icc,	loop_2847
	addcc	%l4,	0x058A,	%l1
	fcmpgt32	%f24,	%f30,	%o3
loop_2846:
	stb	%l6,	[%l7 + 0x09]
loop_2847:
	movpos	%xcc,	%i2,	%l0
	fbug	%fcc2,	loop_2848
	fnot1	%f28,	%f10
	lduw	[%l7 + 0x38],	%l2
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
loop_2848:
	taddcc	%o2,	%g7,	%i1
	add	%o6,	0x04C2,	%g4
	tg	%xcc,	0x1
	edge32l	%g2,	%o5,	%i3
	fbue,a	%fcc0,	loop_2849
	tsubcctv	%o0,	%g1,	%o4
	edge16n	%o7,	%i4,	%i7
	sethi	0x13D4,	%g6
loop_2849:
	te	%icc,	0x3
	nop
	set	0x2E, %g1
	lduh	[%l7 + %g1],	%g3
	fmul8ulx16	%f14,	%f4,	%f30
	bpos	loop_2850
	membar	0x1F
	fmovsg	%icc,	%f24,	%f18
	fmovsne	%xcc,	%f18,	%f26
loop_2850:
	fmovsa	%icc,	%f30,	%f4
	be,pn	%icc,	loop_2851
	tsubcc	%g5,	0x017D,	%l3
	fornot1	%f28,	%f16,	%f4
	set	0x20, %o2
	sta	%f8,	[%l7 + %o2] 0x18
loop_2851:
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f4,	%f1
	bg,pt	%icc,	loop_2852
	sllx	%o1,	%l5,	%i6
	wr	%g0,	0x80,	%asi
	stwa	%i0,	[%l7 + 0x48] %asi
loop_2852:
	bvc,a,pt	%icc,	loop_2853
	ldub	[%l7 + 0x79],	%i5
	subc	%l1,	%o3,	%l4
	orcc	%i2,	0x02AF,	%l0
loop_2853:
	nop
	set	0x40, %i3
	ldda	[%l7 + %i3] 0x80,	%f16
	mulscc	%l6,	0x0F86,	%o2
	mulx	%l2,	%i1,	%g7
	fcmple16	%f2,	%f30,	%o6
	nop
	setx loop_2854, %l0, %l1
	jmpl %l1, %g4
	movvs	%icc,	%g2,	%i3
	fmovdcs	%icc,	%f30,	%f1
	ble,a,pt	%xcc,	loop_2855
loop_2854:
	stbar
	orn	%o5,	0x1972,	%o0
	edge32ln	%g1,	%o7,	%o4
loop_2855:
	flush	%l7 + 0x54
	taddcc	%i7,	0x17A6,	%i4
	or	%g6,	0x1EC6,	%g3
	fmul8sux16	%f0,	%f6,	%f30
	edge32ln	%g5,	%l3,	%o1
	fmovscc	%icc,	%f6,	%f10
	xnor	%l5,	0x111B,	%i0
	fpack32	%f10,	%f2,	%f16
	tl	%xcc,	0x2
	edge32	%i5,	%l1,	%i6
	fsrc2	%f8,	%f4
	faligndata	%f0,	%f22,	%f10
	tcs	%icc,	0x1
	sdiv	%l4,	0x0168,	%o3
	orcc	%l0,	%i2,	%o2
	tge	%xcc,	0x4
	wr	%g0,	0x81,	%asi
	sta	%f10,	[%l7 + 0x08] %asi
	subc	%l2,	%i1,	%l6
	fornot2	%f10,	%f22,	%f20
	movrgez	%o6,	%g4,	%g2
	popc	0x040F,	%i3
	ldsb	[%l7 + 0x38],	%g7
	xnor	%o0,	%g1,	%o7
	sir	0x0442
	sra	%o4,	%i7,	%i4
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x78] %asi,	 0x1
	orcc	%g6,	0x183B,	%g3
	subccc	%l3,	0x051A,	%o1
	edge32	%l5,	%i0,	%g5
	tpos	%xcc,	0x4
	tl	%icc,	0x3
	tleu	%icc,	0x3
	srax	%i5,	%l1,	%l4
	udivcc	%o3,	0x0583,	%l0
	fbu,a	%fcc1,	loop_2856
	addcc	%i6,	%o2,	%i2
	fmovdvs	%xcc,	%f13,	%f5
	bpos,a	%xcc,	loop_2857
loop_2856:
	nop
	fitod	%f4,	%f14
	fdtox	%f14,	%f30
	fxtod	%f30,	%f2
	set	0x40, %l4
	ldxa	[%l7 + %l4] 0x80,	%i1
loop_2857:
	sub	%l6,	%l2,	%g4
	tge	%xcc,	0x0
	nop
	setx	0x7B5FAC589040936D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	tn	%xcc,	0x4
	and	%o6,	%g2,	%i3
	fbn	%fcc1,	loop_2858
	nop
	setx	0xEBB400F5C05B8359,	%l0,	%l6
	stx	%l6,	[%l7 + 0x40]
	ldx	[%l7 + 0x40],	%fsr
	stw	%g7,	[%l7 + 0x08]
	ldstub	[%l7 + 0x3F],	%g1
loop_2858:
	fnot2s	%f31,	%f29
	tpos	%xcc,	0x0
	ldsh	[%l7 + 0x34],	%o0
	set	0x0D, %o3
	stba	%o7,	[%l7 + %o3] 0x27
	membar	#Sync
	edge8n	%o4,	%i7,	%o5
	mulx	%g6,	%i4,	%g3
	umul	%l3,	0x077C,	%o1
	nop
	fitos	%f9,	%f3
	fstox	%f3,	%f22
	movrne	%l5,	0x0A6,	%i0
	addc	%g5,	%l1,	%i5
	bleu,a,pn	%xcc,	loop_2859
	fxnor	%f2,	%f0,	%f8
	sub	%o3,	0x0948,	%l0
	sdivcc	%l4,	0x0733,	%o2
loop_2859:
	tne	%xcc,	0x0
	tge	%icc,	0x6
	movg	%icc,	%i2,	%i6
	membar	#Sync
	set	0x40, %i1
	ldda	[%l7 + %i1] 0xf0,	%f0
	ta	%icc,	0x3
	orcc	%i1,	0x0186,	%l2
	movl	%icc,	%l6,	%o6
	fnot2s	%f1,	%f22
	movleu	%icc,	%g2,	%i3
	movg	%icc,	%g4,	%g1
	sdivx	%g7,	0x1AC7,	%o7
	movcc	%icc,	%o0,	%o4
	bn,a,pt	%xcc,	loop_2860
	movl	%xcc,	%i7,	%g6
	tge	%icc,	0x1
	tg	%xcc,	0x3
loop_2860:
	movg	%xcc,	%o5,	%i4
	popc	0x14BE,	%l3
	edge8	%o1,	%g3,	%l5
	call	loop_2861
	fmovsn	%xcc,	%f0,	%f27
	bne	loop_2862
	fnot1s	%f12,	%f10
loop_2861:
	edge32n	%i0,	%l1,	%i5
	movl	%xcc,	%o3,	%g5
loop_2862:
	ba,a	loop_2863
	fornot2s	%f7,	%f10,	%f25
	fnegd	%f30,	%f10
	movg	%xcc,	%l0,	%l4
loop_2863:
	fxnors	%f29,	%f2,	%f30
	fxors	%f18,	%f19,	%f29
	udivx	%o2,	0x1FCE,	%i2
	nop
	setx	loop_2864,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	andcc	%i6,	%l2,	%i1
	taddcc	%o6,	%g2,	%i3
	set	0x3C, %g2
	sta	%f5,	[%l7 + %g2] 0x19
loop_2864:
	fors	%f20,	%f12,	%f18
	tvs	%icc,	0x1
	edge8	%g4,	%l6,	%g1
	edge8n	%o7,	%g7,	%o0
	movgu	%xcc,	%i7,	%o4
	fnors	%f24,	%f3,	%f7
	addcc	%g6,	0x0802,	%i4
	set	0x2A, %g5
	lduha	[%l7 + %g5] 0x14,	%o5
	srlx	%o1,	%g3,	%l5
	xorcc	%l3,	%l1,	%i0
	umul	%i5,	0x09DC,	%g5
	orn	%o3,	0x14CE,	%l4
	array32	%l0,	%o2,	%i2
	tn	%xcc,	0x4
	taddcc	%i6,	%l2,	%o6
	pdist	%f26,	%f22,	%f0
	bl,a,pt	%icc,	loop_2865
	alignaddr	%g2,	%i1,	%g4
	popc	%l6,	%i3
	edge8	%g1,	%o7,	%o0
loop_2865:
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l7,	0x08,	%l6
	wr	%g0,	0x11,	%asi
	casxa	[%l6] 0x11,	%i7,	%o4
	add	%l7,	0x48,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%g7
	casxa	[%l6] 0x19,	%g7,	%g6
	srax	%i4,	%o1,	%o5
	edge8ln	%g3,	%l3,	%l1
	sra	%l5,	%i5,	%g5
	tne	%xcc,	0x1
	movrlez	%o3,	0x218,	%l4
	move	%icc,	%i0,	%o2
	nop
	fitos	%f1,	%f19
	fstox	%f19,	%f22
	fxtos	%f22,	%f12
	andncc	%i2,	%l0,	%i6
	andncc	%l2,	%o6,	%i1
	array8	%g4,	%l6,	%i3
	fcmpgt16	%f12,	%f28,	%g1
	tleu	%icc,	0x3
	edge32ln	%o7,	%g2,	%o0
	te	%icc,	0x5
	move	%icc,	%o4,	%i7
	tn	%xcc,	0x5
	tl	%icc,	0x3
	array8	%g6,	%i4,	%g7
	fmovsvc	%icc,	%f21,	%f1
	nop
	fitos	%f11,	%f13
	addccc	%o5,	%g3,	%o1
	udivcc	%l1,	0x13F7,	%l3
	fabsd	%f0,	%f18
	tgu	%icc,	0x3
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i5,	0x1CC4,	%l5
	fpadd32	%f10,	%f24,	%f14
	subc	%o3,	0x1CF2,	%g5
	edge32ln	%l4,	%o2,	%i2
	movn	%xcc,	%i0,	%l0
	movleu	%icc,	%l2,	%i6
	wr	%g0,	0x89,	%asi
	ldsba	[%l7 + 0x33] %asi,	%i1
	edge8n	%o6,	%g4,	%l6
	sdiv	%i3,	0x1897,	%g1
	edge16ln	%o7,	%o0,	%g2
	addc	%i7,	0x121F,	%o4
	fbule,a	%fcc1,	loop_2866
	mulx	%i4,	%g6,	%o5
	tl	%icc,	0x5
	subc	%g7,	%g3,	%o1
loop_2866:
	smulcc	%l3,	%l1,	%i5
	fbuge	%fcc0,	loop_2867
	sub	%o3,	%l5,	%g5
	fcmple32	%f16,	%f16,	%o2
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f18
	fxtod	%f18,	%f12
loop_2867:
	fmovdleu	%xcc,	%f1,	%f20
	fmovdgu	%xcc,	%f28,	%f11
	edge16l	%l4,	%i2,	%i0
	fbge	%fcc2,	loop_2868
	fbl,a	%fcc1,	loop_2869
	nop
	setx	0x7070E011,	%l0,	%l6
	st	%l6,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%fsr
	popc	%l0,	%l2
loop_2868:
	xorcc	%i1,	0x01D7,	%o6
loop_2869:
	array16	%i6,	%l6,	%g4
	ba,a,pn	%xcc,	loop_2870
	fcmpeq16	%f2,	%f12,	%g1
	tcs	%xcc,	0x0
	movrgz	%i3,	0x11E,	%o0
loop_2870:
	addcc	%o7,	0x02B4,	%i7
	edge16ln	%o4,	%i4,	%g2
	tle	%icc,	0x7
	std	%f28,	[%l7 + 0x58]
	popc	0x0B08,	%g6
	fcmpeq32	%f16,	%f12,	%o5
	edge8ln	%g7,	%o1,	%l3
	movre	%g3,	%l1,	%o3
	fbne	%fcc3,	loop_2871
	taddcctv	%i5,	0x02FF,	%l5
	tn	%icc,	0x4
	fmovspos	%icc,	%f3,	%f2
loop_2871:
	movrlz	%g5,	0x161,	%l4
	movre	%o2,	0x1A3,	%i0
	movcs	%xcc,	%i2,	%l0
	movpos	%xcc,	%i1,	%o6
	movn	%icc,	%l2,	%i6
	fmovdvc	%icc,	%f31,	%f16
	fbug,a	%fcc0,	loop_2872
	array32	%g4,	%l6,	%i3
	bge,a	loop_2873
	alignaddrl	%o0,	%o7,	%g1
loop_2872:
	fone	%f10
	edge8	%i7,	%i4,	%o4
loop_2873:
	andncc	%g2,	%o5,	%g7
	bn	%icc,	loop_2874
	fbn,a	%fcc3,	loop_2875
	subc	%o1,	%l3,	%g3
	bleu,pt	%xcc,	loop_2876
loop_2874:
	movpos	%icc,	%g6,	%l1
loop_2875:
	ldsb	[%l7 + 0x21],	%i5
	fnor	%f20,	%f12,	%f16
loop_2876:
	pdist	%f2,	%f22,	%f0
	array32	%l5,	%o3,	%g5
	movcc	%xcc,	%l4,	%o2
	fsrc1	%f26,	%f8
	fmovs	%f6,	%f3
	nop
	fitod	%f12,	%f18
	fdtox	%f18,	%f2
	fxtod	%f2,	%f20
	ldd	[%l7 + 0x78],	%f16
	fnands	%f19,	%f12,	%f2
	te	%xcc,	0x1
	wr	%g0,	0x17,	%asi
	stda	%f16,	[%l7 + 0x40] %asi
	membar	#Sync
	edge32ln	%i2,	%i0,	%l0
	bpos,a	%icc,	loop_2877
	edge8l	%i1,	%l2,	%o6
	set	0x0C, %l0
	ldswa	[%l7 + %l0] 0x11,	%g4
loop_2877:
	fpack32	%f14,	%f14,	%f18
	or	%i6,	%l6,	%i3
	wr	%g0,	0x04,	%asi
	ldswa	[%l7 + 0x44] %asi,	%o0
	and	%o7,	%i7,	%i4
	movgu	%xcc,	%o4,	%g2
	edge8ln	%g1,	%g7,	%o5
	movne	%icc,	%o1,	%l3
	fbug	%fcc0,	loop_2878
	fbe,a	%fcc0,	loop_2879
	add	%g6,	0x0B65,	%g3
	fmovspos	%icc,	%f5,	%f9
loop_2878:
	nop
	setx	0xBCC56931,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f16
	setx	0xE1400F3C,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f28
	fsubs	%f28,	%f16,	%f1
loop_2879:
	fmovrde	%i5,	%f20,	%f12
	taddcc	%l5,	%o3,	%g5
	bcc,a,pt	%icc,	loop_2880
	movcs	%icc,	%l1,	%o2
	movg	%icc,	%i2,	%l4
	fmovsle	%icc,	%f17,	%f7
loop_2880:
	nop
	setx	loop_2881,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tpc
	add	%l1,	0x4,	%l1
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	retry
	fbo	%fcc0,	loop_2882
	fbge,a	%fcc0,	loop_2883
	brgez,a	%i0,	loop_2884
loop_2881:
	edge16ln	%l0,	%l2,	%o6
loop_2882:
	sllx	%g4,	%i6,	%i1
loop_2883:
	tsubcc	%l6,	0x1214,	%i3
loop_2884:
	bge	loop_2885
	edge16l	%o0,	%i7,	%o7
	movne	%icc,	%o4,	%i4
	tl	%icc,	0x4
loop_2885:
	orncc	%g1,	%g2,	%g7
	tcs	%xcc,	0x6
	subc	%o1,	%l3,	%o5
	udivcc	%g6,	0x1A01,	%g3
	srl	%l5,	%o3,	%g5
	mulx	%i5,	%l1,	%i2
	tpos	%icc,	0x2
	andcc	%o2,	%l4,	%i0
	nop
	setx	0x8E65BB75,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f4
	fsqrts	%f4,	%f17
	fnot1s	%f29,	%f14
	xor	%l2,	%o6,	%g4
	fmul8x16au	%f31,	%f23,	%f8
	fmovrdne	%l0,	%f26,	%f26
	edge32ln	%i1,	%i6,	%i3
	subcc	%o0,	%i7,	%l6
	srax	%o4,	0x13,	%o7
	fornot1	%f12,	%f14,	%f16
	udiv	%g1,	0x127B,	%g2
	fand	%f4,	%f18,	%f6
	mulx	%i4,	%o1,	%l3
	movg	%icc,	%g7,	%o5
	bcs,pn	%icc,	loop_2886
	array8	%g3,	%g6,	%l5
	sra	%g5,	0x02,	%o3
	fmovrse	%l1,	%f23,	%f14
loop_2886:
	movge	%xcc,	%i2,	%i5
	fmuld8sux16	%f7,	%f7,	%f14
	edge32n	%o2,	%i0,	%l4
	umulcc	%l2,	%o6,	%l0
	tne	%xcc,	0x5
	fabss	%f22,	%f31
	bleu,a	loop_2887
	bn,a,pn	%xcc,	loop_2888
	movcs	%icc,	%g4,	%i1
	std	%f2,	[%l7 + 0x20]
loop_2887:
	fand	%f6,	%f12,	%f2
loop_2888:
	movvc	%icc,	%i6,	%i3
	xorcc	%o0,	0x1DAB,	%l6
	movn	%icc,	%i7,	%o7
	tl	%xcc,	0x7
	tn	%icc,	0x0
	array8	%g1,	%g2,	%i4
	and	%o1,	%o4,	%l3
	sethi	0x0AA2,	%o5
	xnor	%g3,	%g6,	%l5
	ldd	[%l7 + 0x08],	%g6
	tneg	%icc,	0x0
	move	%xcc,	%o3,	%g5
	fbe,a	%fcc3,	loop_2889
	fmovrdgz	%l1,	%f22,	%f24
	movgu	%xcc,	%i2,	%o2
	tle	%icc,	0x5
loop_2889:
	ldub	[%l7 + 0x0E],	%i5
	udivcc	%i0,	0x1A03,	%l4
	bgu,a,pt	%icc,	loop_2890
	sdivcc	%o6,	0x1C71,	%l2
	addc	%l0,	0x1AA7,	%g4
	edge32l	%i1,	%i6,	%o0
loop_2890:
	be	loop_2891
	ldsb	[%l7 + 0x20],	%l6
	membar	0x38
	array32	%i3,	%o7,	%g1
loop_2891:
	nop
	add	%l7,	0x58,	%l6
	wr	%g0,	0x19,	%asi
	ldxa	[%l6] %asi,	%i7
	casxa	[%l6] 0x19,	%i7,	%g2
	fbu,a	%fcc0,	loop_2892
	smulcc	%o1,	%i4,	%o4
	nop
	setx	loop_2893,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	taddcc	%l3,	%o5,	%g3
loop_2892:
	tl	%icc,	0x6
	bcc,pt	%icc,	loop_2894
loop_2893:
	sir	0x0BCB
	st	%f21,	[%l7 + 0x5C]
	andcc	%l5,	%g6,	%o3
loop_2894:
	mova	%icc,	%g7,	%l1
	nop
	fitos	%f9,	%f4
	fstoi	%f4,	%f4
	te	%icc,	0x2
	fmovsvs	%xcc,	%f27,	%f23
	wr	%g0,	0x80,	%asi
	lduwa	[%l7 + 0x54] %asi,	%i2
	udivx	%g5,	0x0770,	%i5
	wr	%g0,	0x2a,	%asi
	stba	%i0,	[%l7 + 0x44] %asi
	membar	#Sync
	ldsw	[%l7 + 0x34],	%l4
	fnands	%f23,	%f26,	%f16
	tn	%icc,	0x0
	movrlez	%o6,	0x2DD,	%l2
	fmovdgu	%icc,	%f30,	%f2
	tpos	%icc,	0x7
	addcc	%o2,	0x06CD,	%g4
	taddcctv	%i1,	0x129D,	%i6
	fbn	%fcc0,	loop_2895
	tpos	%xcc,	0x0
	tcc	%icc,	0x2
	umulcc	%l0,	%l6,	%i3
loop_2895:
	nop
	set	0x70, %o6
	stxa	%o0,	[%l7 + %o6] 0x89
	subc	%g1,	%o7,	%i7
	movn	%xcc,	%g2,	%o1
	ldstub	[%l7 + 0x71],	%i4
	alignaddr	%l3,	%o5,	%o4
	tle	%icc,	0x6
	xorcc	%l5,	%g3,	%o3
	smul	%g6,	%l1,	%g7
	fbl	%fcc2,	loop_2896
	sub	%i2,	0x057B,	%i5
	array8	%i0,	%l4,	%g5
	orn	%l2,	0x06C6,	%o6
loop_2896:
	smul	%g4,	%o2,	%i1
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%icc,	%f20,	%f21
	nop
	setx	loop_2897,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	move	%xcc,	%l0,	%i6
	andncc	%l6,	%i3,	%g1
	bpos	loop_2898
loop_2897:
	prefetch	[%l7 + 0x34],	 0x2
	udivcc	%o0,	0x0416,	%i7
	tvs	%xcc,	0x5
loop_2898:
	andcc	%o7,	0x15B8,	%o1
	srax	%g2,	%i4,	%o5
	movrgez	%o4,	%l3,	%l5
	movvs	%xcc,	%g3,	%o3
	fmul8x16	%f20,	%f26,	%f18
	xnor	%l1,	%g7,	%i2
	edge16	%g6,	%i5,	%i0
	fmovsgu	%xcc,	%f31,	%f7
	brnz	%l4,	loop_2899
	brlz,a	%g5,	loop_2900
	edge8ln	%l2,	%g4,	%o6
	ldstub	[%l7 + 0x6C],	%i1
loop_2899:
	bpos,a,pn	%icc,	loop_2901
loop_2900:
	addcc	%l0,	0x1A95,	%o2
	mulscc	%l6,	%i6,	%i3
	sra	%g1,	%i7,	%o7
loop_2901:
	nop
	set	0x38, %o0
	lduha	[%l7 + %o0] 0x14,	%o0
	ldsh	[%l7 + 0x14],	%g2
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x74] %asi,	%o1
	bleu,pn	%icc,	loop_2902
	subccc	%i4,	0x199E,	%o5
	fbn	%fcc0,	loop_2903
	sdiv	%l3,	0x11B0,	%o4
loop_2902:
	bl	loop_2904
	fsrc2	%f22,	%f2
loop_2903:
	udivx	%g3,	0x033F,	%o3
	fbu	%fcc0,	loop_2905
loop_2904:
	tcs	%xcc,	0x3
	fbule	%fcc3,	loop_2906
	subcc	%l1,	0x17EB,	%l5
loop_2905:
	nop
	wr	%g0,	0x88,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x1
loop_2906:
	or	%i2,	0x0381,	%i5
	edge8ln	%g6,	%l4,	%g5
	xnorcc	%l2,	0x0F69,	%g4
	or	%i0,	%o6,	%l0
	movl	%icc,	%i1,	%l6
	edge32l	%o2,	%i6,	%g1
	tne	%xcc,	0x0
	array8	%i3,	%i7,	%o7
	xnor	%o0,	%o1,	%g2
	movleu	%xcc,	%o5,	%i4
	popc	%l3,	%g3
	mova	%icc,	%o3,	%l1
	movge	%icc,	%o4,	%l5
	membar	0x6A
	fmovdvc	%icc,	%f4,	%f7
	bcs	loop_2907
	fble,a	%fcc1,	loop_2908
	add	%g7,	%i5,	%i2
	tge	%icc,	0x7
loop_2907:
	sll	%l4,	%g5,	%l2
loop_2908:
	fsrc1	%f0,	%f0
	ldsw	[%l7 + 0x0C],	%g6
	srl	%i0,	%o6,	%g4
	fmovdl	%xcc,	%f30,	%f30
	tne	%icc,	0x1
	nop
	fitod	%f2,	%f26
	fdtox	%f26,	%f28
	tsubcctv	%l0,	0x0ABF,	%l6
	sdivcc	%i1,	0x1454,	%i6
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g1,	%i3,	%i7
	mova	%xcc,	%o7,	%o0
	movgu	%icc,	%o1,	%o2
	movvc	%icc,	%g2,	%o5
	tcs	%xcc,	0x3
	or	%i4,	0x0A59,	%l3
	fabsd	%f12,	%f0
	brlz	%g3,	loop_2909
	edge8ln	%o3,	%l1,	%l5
	alignaddrl	%o4,	%i5,	%i2
	udivx	%g7,	0x0B47,	%g5
loop_2909:
	tvs	%icc,	0x7
	tgu	%icc,	0x4
	sll	%l2,	0x07,	%g6
	edge8ln	%l4,	%i0,	%o6
	bcs,pt	%icc,	loop_2910
	movrgz	%l0,	0x2AC,	%l6
	fbo	%fcc0,	loop_2911
	tne	%xcc,	0x3
loop_2910:
	movne	%icc,	%g4,	%i1
	brlz	%i6,	loop_2912
loop_2911:
	umul	%g1,	%i3,	%o7
	tne	%xcc,	0x2
	fpsub32s	%f14,	%f13,	%f22
loop_2912:
	ldstub	[%l7 + 0x61],	%o0
	and	%i7,	%o1,	%g2
	orn	%o5,	%i4,	%o2
	fmovdge	%icc,	%f17,	%f12
	fpadd16	%f18,	%f6,	%f30
	sub	%g3,	%l3,	%l1
	set	0x20, %g4
	stwa	%l5,	[%l7 + %g4] 0xe3
	membar	#Sync
	wr	%g0,	0x88,	%asi
	stha	%o4,	[%l7 + 0x62] %asi
	addcc	%o3,	0x0BC6,	%i5
	tcc	%icc,	0x4
	umulcc	%i2,	%g7,	%l2
	fmovde	%icc,	%f6,	%f11
	mulx	%g5,	0x1D95,	%g6
	movpos	%xcc,	%l4,	%o6
	sdivcc	%i0,	0x1E4D,	%l0
	fcmpgt32	%f30,	%f10,	%g4
	alignaddr	%i1,	%l6,	%i6
	edge32n	%i3,	%o7,	%g1
	ldx	[%l7 + 0x20],	%o0
	add	%i7,	%g2,	%o5
	call	loop_2913
	movneg	%xcc,	%i4,	%o1
	umulcc	%g3,	0x1FF6,	%o2
	movcs	%xcc,	%l1,	%l5
loop_2913:
	movcc	%xcc,	%o4,	%l3
	smulcc	%i5,	%i2,	%o3
	fornot2	%f26,	%f12,	%f24
	fble,a	%fcc3,	loop_2914
	bcs,a	%icc,	loop_2915
	stb	%l2,	[%l7 + 0x7F]
	sdivx	%g7,	0x19A7,	%g5
loop_2914:
	fmovdne	%xcc,	%f15,	%f17
loop_2915:
	bvc,a	loop_2916
	fbule	%fcc1,	loop_2917
	te	%icc,	0x5
	fnor	%f8,	%f6,	%f4
loop_2916:
	brlz	%l4,	loop_2918
loop_2917:
	tle	%icc,	0x7
	fcmpgt16	%f14,	%f8,	%g6
	umul	%o6,	0x1191,	%i0
loop_2918:
	fand	%f24,	%f6,	%f28
	nop
	setx	loop_2919,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	nop
	setx	0x92ECAC06,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f19
	setx	0xF8210542,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f16
	fadds	%f16,	%f19,	%f5
	movvc	%xcc,	%l0,	%i1
	andcc	%l6,	0x1C4B,	%i6
loop_2919:
	fsrc1	%f2,	%f0
	ba,a,pn	%icc,	loop_2920
	edge32n	%i3,	%g4,	%g1
	nop
	fitos	%f9,	%f5
	fstox	%f5,	%f6
	fxtos	%f6,	%f11
	alignaddr	%o7,	%i7,	%o0
loop_2920:
	andcc	%g2,	%i4,	%o1
	move	%icc,	%o5,	%o2
	st	%f20,	[%l7 + 0x08]
	fmovsne	%xcc,	%f11,	%f1
	ta	%xcc,	0x3
	fsrc2s	%f24,	%f30
	edge16n	%l1,	%g3,	%o4
	fmovsneg	%icc,	%f26,	%f3
	sir	0x0D69
	smulcc	%l5,	%i5,	%i2
	srlx	%o3,	%l2,	%g7
	set	0x7C, %o1
	lda	[%l7 + %o1] 0x88,	%f6
	fmovsgu	%icc,	%f21,	%f18
	fba	%fcc0,	loop_2921
	edge32l	%g5,	%l4,	%g6
	fpadd16s	%f2,	%f7,	%f7
	wr	%g0,	0x80,	%asi
	sta	%f29,	[%l7 + 0x44] %asi
loop_2921:
	edge16	%l3,	%i0,	%o6
	movrlez	%i1,	0x20D,	%l6
	swap	[%l7 + 0x10],	%i6
	mova	%icc,	%l0,	%g4
	fsrc1	%f28,	%f28
	edge8n	%i3,	%o7,	%g1
	brz,a	%o0,	loop_2922
	membar	0x20
	tvs	%icc,	0x7
	tsubcc	%g2,	0x0772,	%i4
loop_2922:
	edge8ln	%o1,	%o5,	%i7
	udivx	%o2,	0x14B2,	%l1
	alignaddrl	%o4,	%g3,	%l5
	tvc	%xcc,	0x3
	orcc	%i2,	%o3,	%i5
	orn	%g7,	0x1F05,	%l2
	set	0x28, %o5
	ldswa	[%l7 + %o5] 0x80,	%l4
	fmovdvs	%icc,	%f26,	%f8
	subccc	%g5,	%l3,	%i0
	sllx	%g6,	%o6,	%l6
	fmovrdlz	%i1,	%f28,	%f24
	ldx	[%l7 + 0x58],	%i6
	sdiv	%l0,	0x0DD4,	%g4
	ldd	[%l7 + 0x78],	%f2
	orn	%i3,	0x158D,	%o7
	movle	%xcc,	%o0,	%g2
	std	%f18,	[%l7 + 0x20]
	andcc	%i4,	0x0928,	%g1
	umulcc	%o5,	0x1B5F,	%o1
	fmovdvs	%icc,	%f29,	%f9
	srax	%i7,	0x1D,	%l1
	bcc,a	%icc,	loop_2923
	membar	0x04
	ldsb	[%l7 + 0x32],	%o2
	fmovsne	%xcc,	%f8,	%f20
loop_2923:
	movrgez	%g3,	0x060,	%o4
	movg	%xcc,	%l5,	%i2
	nop
	fitod	%f4,	%f26
	fdtox	%f26,	%f28
	fexpand	%f21,	%f10
	mova	%icc,	%i5,	%o3
	or	%g7,	0x0123,	%l2
	fmovrdgez	%g5,	%f12,	%f20
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x5
	smul	%l3,	0x0B0F,	%i0
	subc	%l4,	0x1182,	%o6
	movneg	%icc,	%g6,	%i1
	tcs	%icc,	0x3
	nop
	fitos	%f11,	%f9
	fstox	%f9,	%f20
	fxtos	%f20,	%f6
	movne	%icc,	%l6,	%i6
	addccc	%g4,	%i3,	%l0
	nop
	setx	0xB121DF8FC55D160B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f4
	setx	0xCB8090154A323AC3,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f22
	fdivd	%f22,	%f4,	%f24
	fbne,a	%fcc0,	loop_2924
	nop
	setx	0xDA44613F0472018B,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f12
	fsqrtd	%f12,	%f0
	ldstub	[%l7 + 0x70],	%o7
	fbul,a	%fcc1,	loop_2925
loop_2924:
	tvc	%xcc,	0x4
	move	%icc,	%o0,	%g2
	fbo,a	%fcc2,	loop_2926
loop_2925:
	movrlz	%i4,	0x086,	%o5
	fors	%f27,	%f23,	%f2
	bneg,a,pt	%icc,	loop_2927
loop_2926:
	sll	%g1,	%o1,	%i7
	ldsh	[%l7 + 0x18],	%o2
	alignaddr	%l1,	%o4,	%l5
loop_2927:
	nop
	wr	%g0,	0x89,	%asi
	stwa	%g3,	[%l7 + 0x6C] %asi
	movrne	%i5,	0x1BA,	%o3
	fbe	%fcc0,	loop_2928
	movg	%xcc,	%g7,	%l2
	xor	%g5,	0x072A,	%l3
	fmovsge	%xcc,	%f7,	%f16
loop_2928:
	movleu	%icc,	%i2,	%l4
	bvs,a	loop_2929
	tl	%icc,	0x2
	wr	%g0,	0x89,	%asi
	ldstuba	[%l7 + 0x4F] %asi,	%o6
loop_2929:
	nop
	fitos	%f9,	%f9
	fstox	%f9,	%f6
	add	%i0,	0x1CCF,	%i1
	nop
	fitod	%f2,	%f10
	fdtox	%f10,	%f24
	nop
	fitod	%f30,	%f16
	tgu	%xcc,	0x6
	tsubcc	%l6,	0x0DD3,	%g6
	bleu,pt	%xcc,	loop_2930
	movcs	%xcc,	%i6,	%g4
	fbo	%fcc0,	loop_2931
	smul	%l0,	%i3,	%o0
loop_2930:
	fxnors	%f9,	%f8,	%f25
	mulx	%o7,	0x0CB1,	%g2
loop_2931:
	nop
	add	%l7,	0x28,	%l6
	wr	%g0,	0x11,	%asi
	ldxa	[%l6] %asi,	%o5
	casxa	[%l6] %asi,	%o5,	%g1
	brlz	%i4,	loop_2932
	edge8	%o1,	%o2,	%l1
	tle	%icc,	0x7
	andn	%o4,	%i7,	%l5
loop_2932:
	te	%icc,	0x1
	tsubcctv	%g3,	%o3,	%g7
	fnegd	%f0,	%f4
	edge16	%l2,	%i5,	%g5
	movpos	%xcc,	%i2,	%l3
	nop
	setx	0xB3DDAB3F,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f30
	fsqrts	%f30,	%f29
	tl	%xcc,	0x0
	nop
	fitos	%f13,	%f17
	fstox	%f17,	%f4
	fxtos	%f4,	%f25
	mulscc	%o6,	%l4,	%i0
	ldx	[%l7 + 0x40],	%i1
	fmovsleu	%icc,	%f31,	%f8
	set	0x3B, %l3
	ldstuba	[%l7 + %l3] 0x80,	%g6
	st	%f10,	[%l7 + 0x40]
	bvs	%xcc,	loop_2933
	stbar
	array16	%l6,	%g4,	%l0
	tvs	%icc,	0x1
loop_2933:
	and	%i3,	0x0FC7,	%i6
	taddcctv	%o0,	0x1C87,	%g2
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f14,	%f0
	smul	%o7,	0x023C,	%g1
	tn	%xcc,	0x4
	movrlz	%i4,	0x3BA,	%o1
	fmovsneg	%icc,	%f17,	%f14
	movcc	%icc,	%o5,	%l1
	edge8ln	%o4,	%i7,	%l5
	subcc	%g3,	%o3,	%o2
	add	%l2,	%i5,	%g7
	subc	%i2,	0x1CA1,	%l3
	edge16n	%g5,	%o6,	%i0
	set	0x2A, %l6
	lduha	[%l7 + %l6] 0x10,	%l4
	set	0x56, %i2
	lduha	[%l7 + %i2] 0x15,	%g6
	tl	%icc,	0x4
	subc	%l6,	0x1D1E,	%i1
	alignaddr	%g4,	%i3,	%l0
	fmovsneg	%xcc,	%f1,	%f3
	fornot2s	%f14,	%f9,	%f4
	wr	%g0,	0x19,	%asi
	ldswa	[%l7 + 0x20] %asi,	%o0
	movrgz	%i6,	%g2,	%o7
	tn	%icc,	0x4
	movge	%xcc,	%i4,	%o1
	bgu,a	%icc,	loop_2934
	movleu	%xcc,	%o5,	%g1
	fmovsvs	%xcc,	%f22,	%f15
	addcc	%o4,	0x150C,	%l1
loop_2934:
	umulcc	%i7,	0x00C0,	%l5
	fxors	%f9,	%f22,	%f1
	bleu,a,pn	%xcc,	loop_2935
	edge32n	%g3,	%o3,	%o2
	xor	%l2,	%g7,	%i5
	wr	%g0,	0x04,	%asi
	prefetcha	[%l7 + 0x20] %asi,	 0x0
loop_2935:
	fandnot2	%f28,	%f12,	%f18
	tgu	%xcc,	0x3
	movg	%xcc,	%i2,	%o6
	fbn,a	%fcc2,	loop_2936
	alignaddrl	%i0,	%g5,	%g6
	tcs	%xcc,	0x4
	tleu	%icc,	0x1
loop_2936:
	fba,a	%fcc3,	loop_2937
	edge8n	%l4,	%i1,	%g4
	edge8	%l6,	%l0,	%i3
	movrlz	%o0,	0x271,	%i6
loop_2937:
	movcs	%icc,	%g2,	%o7
	wr	%g0,	0x0c,	%asi
	swapa	[%l7 + 0x5C] %asi,	%i4
	tsubcctv	%o5,	%o1,	%o4
	ble,a	%icc,	loop_2938
	edge8ln	%l1,	%g1,	%l5
	smul	%g3,	%o3,	%o2
	movrgez	%i7,	0x008,	%l2
loop_2938:
	tpos	%icc,	0x0
	wr	%g0,	0x80,	%asi
	ldstuba	[%l7 + 0x52] %asi,	%i5
	movge	%icc,	%g7,	%l3
	nop
	setx loop_2939, %l0, %l1
	jmpl %l1, %o6
	sdiv	%i2,	0x03A8,	%g5
	fcmpeq32	%f28,	%f18,	%g6
	addc	%i0,	%l4,	%i1
loop_2939:
	fble,a	%fcc2,	loop_2940
	andcc	%l6,	0x0B32,	%l0
	faligndata	%f18,	%f16,	%f16
	udivx	%i3,	0x0B7A,	%g4
loop_2940:
	fcmpeq32	%f30,	%f12,	%i6
	fmovdge	%icc,	%f4,	%f24
	sdiv	%g2,	0x0C14,	%o0
	brlez,a	%o7,	loop_2941
	andn	%o5,	0x06BB,	%o1
	restored
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o4,	%i4
loop_2941:
	tle	%xcc,	0x7
	xorcc	%g1,	%l5,	%l1
	fmovse	%xcc,	%f31,	%f24
	fbuge	%fcc0,	loop_2942
	smul	%o3,	%g3,	%o2
	nop
	fitod	%f4,	%f12
	fdtox	%f12,	%f8
	sir	0x1F17
loop_2942:
	fmul8x16al	%f23,	%f30,	%f18
	sra	%l2,	%i5,	%i7
	nop
	setx	0x690F000F80F64BE4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f6
	fsqrtd	%f6,	%f20
	movpos	%xcc,	%l3,	%g7
	fbu,a	%fcc2,	loop_2943
	fmuld8ulx16	%f21,	%f30,	%f16
	mulx	%i2,	0x171D,	%g5
	ldx	[%l7 + 0x10],	%o6
loop_2943:
	fba	%fcc2,	loop_2944
	edge16l	%g6,	%l4,	%i1
	movn	%icc,	%i0,	%l6
	movvs	%icc,	%i3,	%g4
loop_2944:
	nop
	setx	0x2DF3DEB6,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f29
	fsqrts	%f29,	%f15
	ldsb	[%l7 + 0x47],	%l0
	fcmpne16	%f6,	%f24,	%i6
	orcc	%o0,	0x05E5,	%o7
	movrne	%o5,	0x2AB,	%g2
	xnorcc	%o4,	0x0127,	%o1
	popc	%g1,	%i4
	edge8n	%l1,	%o3,	%l5
	fmovrsne	%o2,	%f3,	%f9
	srax	%g3,	0x15,	%i5
	addccc	%i7,	0x090F,	%l2
	movl	%xcc,	%g7,	%l3
	movleu	%xcc,	%i2,	%g5
	sllx	%g6,	%o6,	%l4
	ldsh	[%l7 + 0x74],	%i1
	wr	%g0,	0x89,	%asi
	stwa	%i0,	[%l7 + 0x20] %asi
	nop
	setx	0x82A4A699207297B4,	%l0,	%l6
	stx	%l6,	[%l7 + 0x50]
	ldx	[%l7 + 0x50],	%fsr
	subccc	%l6,	0x1A6A,	%i3
	fpack16	%f30,	%f22
	fpmerge	%f22,	%f8,	%f22
	fands	%f12,	%f10,	%f15
	tcc	%icc,	0x6
	edge16n	%g4,	%i6,	%l0
	edge16	%o0,	%o7,	%o5
	edge32ln	%g2,	%o4,	%g1
	wr	%g0,	0x80,	%asi
	stba	%o1,	[%l7 + 0x68] %asi
	fnegs	%f27,	%f21
	nop
	setx	0x9CC8552A,	%l0,	%l6
	st	%l6,	[%l7 + 0x28]
	ld	[%l7 + 0x28],	%f27
	setx	0x5C1F9CDA,	%l1,	%l5
	st	%l5,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%f2
	fdivs	%f2,	%f27,	%f5
	edge32	%l1,	%i4,	%l5
	edge32n	%o2,	%g3,	%i5
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	setx	0x00696D00,	%l0,	%l6
	st	%l6,	[%l7 + 0x10]
	ld	[%l7 + 0x10],	%fsr
	udiv	%i7,	0x1C2D,	%o3
	tsubcctv	%g7,	0x09AE,	%l3
	add	%l7,	0x28,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l2,	%i2
	movl	%xcc,	%g5,	%o6
	prefetch	[%l7 + 0x48],	 0x2
	movcc	%icc,	%l4,	%i1
	ta	%xcc,	0x6
	fmovsle	%icc,	%f27,	%f28
	edge16ln	%i0,	%g6,	%i3
	fmul8x16	%f4,	%f10,	%f18
	edge8n	%g4,	%i6,	%l6
	fmovdle	%xcc,	%f27,	%f22
	array32	%o0,	%l0,	%o7
	xor	%o5,	%g2,	%o4
	fmovdcc	%icc,	%f25,	%f8
	edge8l	%o1,	%g1,	%l1
	wr	%g0,	0x89,	%asi
	lduba	[%l7 + 0x76] %asi,	%l5
	popc	%i4,	%o2
	tleu	%icc,	0x4
	fba,a	%fcc1,	loop_2945
	xorcc	%i5,	%g3,	%o3
	wr	%g0,	0x80,	%asi
	ldswa	[%l7 + 0x60] %asi,	%i7
loop_2945:
	bcs,a,pt	%icc,	loop_2946
	ldsh	[%l7 + 0x3C],	%g7
	tg	%icc,	0x7
	fbn,a	%fcc3,	loop_2947
loop_2946:
	udiv	%l3,	0x178B,	%i2
	sllx	%g5,	%l2,	%l4
	tleu	%icc,	0x0
loop_2947:
	edge16ln	%o6,	%i1,	%i0
	sra	%g6,	0x0A,	%g4
	movgu	%icc,	%i3,	%i6
	fxnors	%f0,	%f14,	%f20
	array32	%o0,	%l6,	%l0
	lduw	[%l7 + 0x14],	%o5
	set	0x38, %i4
	lduha	[%l7 + %i4] 0x0c,	%g2
	alignaddrl	%o4,	%o1,	%o7
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	tgu	%icc,	0x5
	taddcctv	%g1,	%l1,	%i4
	udivx	%l5,	0x043B,	%i5
	array8	%g3,	%o3,	%i7
	bshuffle	%f20,	%f10,	%f14
	movrgz	%g7,	%l3,	%o2
	lduw	[%l7 + 0x34],	%i2
	movgu	%icc,	%l2,	%g5
	membar	#Sync
	wr	%g0,	0xf9,	%asi
	ldda	[%l7 + 0x40] %asi,	%f0
	set	0x45, %o7
	ldsba	[%l7 + %o7] 0x0c,	%o6
	fmovsvs	%xcc,	%f8,	%f14
	bleu,a,pt	%icc,	loop_2948
	fmovdcs	%icc,	%f15,	%f5
	fbe,a	%fcc3,	loop_2949
	fmuld8sux16	%f1,	%f0,	%f26
loop_2948:
	movrlz	%i1,	0x165,	%i0
	wr	%g0,	0x81,	%asi
	ldswa	[%l7 + 0x70] %asi,	%g6
loop_2949:
	xnorcc	%g4,	0x0348,	%i3
	tg	%icc,	0x2
	bneg,pn	%xcc,	loop_2950
	bl,a	%xcc,	loop_2951
	smulcc	%i6,	0x141C,	%l4
	edge32ln	%l6,	%o0,	%o5
loop_2950:
	xnorcc	%l0,	%g2,	%o1
loop_2951:
	edge32ln	%o7,	%o4,	%g1
	sub	%l1,	0x015A,	%l5
	wr	%g0,	0x19,	%asi
	stba	%i5,	[%l7 + 0x62] %asi
	call	loop_2952
	membar	0x5A
	set	0x10, %o4
	ldxa	[%g0 + %o4] 0x21,	%g3
loop_2952:
	fmovdcc	%icc,	%f25,	%f3
	andcc	%i4,	0x1D5E,	%o3
	tle	%icc,	0x0
	sethi	0x1BCB,	%g7
	subc	%i7,	%l3,	%o2
	tcs	%icc,	0x2
	fmovdge	%xcc,	%f24,	%f22
	udivx	%l2,	0x14FA,	%i2
	movvs	%xcc,	%g5,	%i1
	fabss	%f4,	%f6
	xor	%o6,	0x088A,	%i0
	array16	%g6,	%i3,	%g4
	fmovsgu	%xcc,	%f25,	%f9
	srax	%i6,	0x1A,	%l4
	fpadd16s	%f4,	%f25,	%f6
	movrne	%l6,	0x0CA,	%o0
	wr	%g0,	0x89,	%asi
	ldxa	[%l7 + 0x08] %asi,	%o5
	movl	%xcc,	%g2,	%l0
	fble,a	%fcc2,	loop_2953
	swap	[%l7 + 0x74],	%o7
	fbug,a	%fcc0,	loop_2954
	fpsub32s	%f12,	%f20,	%f10
loop_2953:
	tgu	%xcc,	0x6
	movre	%o4,	%o1,	%l1
loop_2954:
	fmovsvs	%xcc,	%f31,	%f14
	call	loop_2955
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
	fmovdleu	%xcc,	%f7,	%f25
	movcc	%icc,	%l5,	%g1
loop_2955:
	udivcc	%i5,	0x0D02,	%g3
loop_2956:
	std	%f30,	[%l7 + 0x28]
	tge	%icc,	0x4
	fpadd32s	%f24,	%f7,	%f23
	wr	%g0,	0x81,	%asi
	lduba	[%l7 + 0x4B] %asi,	%o3
	bge,a,pt	%icc,	loop_2957
	smulcc	%i4,	0x1AF3,	%g7
	umul	%l3,	%o2,	%i7
	or	%i2,	0x0AA5,	%l2
loop_2957:
	movrlez	%g5,	%i1,	%o6
	fmovdge	%xcc,	%f25,	%f27
	subc	%i0,	%g6,	%i3
	xnor	%g4,	%i6,	%l4
	edge32n	%l6,	%o0,	%o5
	fbule,a	%fcc1,	loop_2958
	add	%l0,	0x10D2,	%o7
	fxnor	%f2,	%f8,	%f14
	tvs	%xcc,	0x7
loop_2958:
	brz,a	%g2,	loop_2959
	bcc,pn	%icc,	loop_2960
	stbar
	lduh	[%l7 + 0x22],	%o4
loop_2959:
	bvs,a,pt	%icc,	loop_2961
loop_2960:
	udivcc	%l1,	0x1D57,	%o1
	nop
	fitod	%f4,	%f16
	fdtox	%f16,	%f4
	fxtod	%f4,	%f16
	popc	%l5,	%i5
loop_2961:
	subcc	%g3,	0x17FC,	%g1
	tg	%xcc,	0x1
	tcs	%icc,	0x0
	addc	%o3,	0x0C12,	%g7
	stbar
	tle	%icc,	0x4
	andcc	%l3,	0x17EE,	%i4
	nop
	setx	loop_2962,	%l0,	%l1
	wrpr	0x1,	%tl
	wrpr	%l1,	%tnpc
	setx	0x34400001400,	%l0,	%l1
	wrpr	%l1,	%tstate
	wrhpr	0x4,	%htstate
	done
	swap	[%l7 + 0x60],	%i7
	fmovsn	%icc,	%f30,	%f29
	fcmpne32	%f6,	%f6,	%o2
loop_2962:
	array32	%l2,	%g5,	%i1
	sllx	%i2,	%i0,	%o6
	orncc	%i3,	0x12DE,	%g4
	saved
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f18,	%f26,	%f24
	membar	0x6B
	brlz,a	%g6,	loop_2963
	nop
	fitod	%f4,	%f2
	fdtox	%f2,	%f2
	nop
	fitos	%f7,	%f21
	fstox	%f21,	%f24
	fxtos	%f24,	%f22
	tcs	%xcc,	0x1
loop_2963:
	fcmpne16	%f28,	%f12,	%i6
	edge32l	%l4,	%l6,	%o5
	fxors	%f29,	%f5,	%f29
	bpos,a,pn	%xcc,	loop_2964
	edge16ln	%l0,	%o7,	%o0
	wr	%g0,	0x0c,	%asi
	ldsha	[%l7 + 0x78] %asi,	%o4
loop_2964:
	tgu	%icc,	0x0
	mova	%icc,	%g2,	%l1
	addcc	%o1,	0x1FFF,	%i5
	fble	%fcc3,	loop_2965
	array8	%g3,	%l5,	%g1
	nop
	setx	0x005F21E2,	%l0,	%l6
	st	%l6,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%fsr
	fbe,a	%fcc1,	loop_2966
loop_2965:
	udiv	%o3,	0x00C8,	%g7
	xnorcc	%l3,	%i7,	%i4
	fmovrsgez	%o2,	%f30,	%f5
loop_2966:
	andn	%l2,	%g5,	%i1
	fxnor	%f22,	%f12,	%f24
	fabss	%f18,	%f31
	sdivx	%i0,	0x17FD,	%o6
	edge16	%i3,	%g4,	%g6
	movrgz	%i2,	0x12A,	%i6
	tn	%xcc,	0x2
	fmovsneg	%xcc,	%f19,	%f24
	movgu	%icc,	%l6,	%l4
	srax	%l0,	%o5,	%o0
	fabss	%f8,	%f3
	subcc	%o7,	0x035B,	%g2
	te	%icc,	0x4
	fcmpgt32	%f4,	%f8,	%o4
	array16	%o1,	%l1,	%i5
	fmovrdgez	%g3,	%f12,	%f12
	fmovrdlz	%g1,	%f10,	%f4
	edge16	%o3,	%g7,	%l5
	ldsw	[%l7 + 0x4C],	%l3
	taddcctv	%i7,	0x1E83,	%o2
	fand	%f14,	%f16,	%f2
	fsrc2s	%f2,	%f19
	edge8	%i4,	%g5,	%l2
	bne	loop_2967
	ld	[%l7 + 0x40],	%f4
	fmovrslez	%i0,	%f12,	%f17
	fmovdle	%xcc,	%f9,	%f10
loop_2967:
	fornot2	%f16,	%f4,	%f28
	alignaddr	%o6,	%i1,	%g4
	fmovdne	%icc,	%f7,	%f25
	addc	%g6,	%i2,	%i3
	edge32ln	%l6,	%l4,	%l0
	add	%l7,	0x4C,	%l6
	wr	%g0,	0x80,	%asi
	casa	[%l6] 0x80,	%i6,	%o5
	bshuffle	%f28,	%f6,	%f8
	add	%o0,	0x0B4E,	%g2
	fmovrse	%o7,	%f15,	%f13
	tvc	%icc,	0x7
	udivcc	%o1,	0x1D5B,	%l1
	fandnot2	%f20,	%f16,	%f10
	ba	%xcc,	loop_2968
	prefetch	[%l7 + 0x7C],	 0x1
	movrlez	%o4,	0x2C2,	%g3
	xorcc	%i5,	0x02F9,	%g1
loop_2968:
	movle	%xcc,	%g7,	%o3
	array16	%l3,	%l5,	%i7
	fmovsle	%xcc,	%f14,	%f2
	nop
	setx	0x942D4859586C1E95,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f0
	setx	0x695F90DE23C2E86E,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f2
	fmuld	%f2,	%f0,	%f14
	fbne,a	%fcc0,	loop_2969
	andn	%o2,	0x094F,	%i4
	bl	loop_2970
	mova	%icc,	%l2,	%g5
loop_2969:
	nop
	set	0x8, %g3
	stxa	%i0,	[%g0 + %g3] 0x21
loop_2970:
	fbg,a	%fcc0,	loop_2971
	fandnot1s	%f26,	%f26,	%f8
	sdiv	%o6,	0x1F56,	%i1
	fmovrsgz	%g6,	%f18,	%f30
loop_2971:
	srl	%i2,	%i3,	%g4
	add	%l7,	0x38,	%l6
	wr	%g0,	0x10,	%asi
	casa	[%l6] %asi,	%l4,	%l0
	tcc	%xcc,	0x6
	xor	%l6,	0x10EE,	%o5
	edge8l	%i6,	%o0,	%g2
	edge16	%o7,	%o1,	%l1
	bvs,a,pn	%xcc,	loop_2972
	sethi	0x0F62,	%o4
	fornot1s	%f21,	%f10,	%f28
	movle	%xcc,	%g3,	%g1
loop_2972:
	movneg	%icc,	%i5,	%g7
	fmovsne	%xcc,	%f12,	%f27
	nop
	setx	0x38353A4B430F866F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f18
	setx	0xCDF74D0AE6EBB328,	%l1,	%l5
	stx	%l5,	[%l7 + 0x10]
	ldd	[%l7 + 0x10],	%f28
	fsubd	%f28,	%f18,	%f4
	fbug,a	%fcc3,	loop_2973
	tl	%icc,	0x6
	xorcc	%l3,	%l5,	%o3
	edge8l	%i7,	%i4,	%l2
loop_2973:
	smul	%o2,	0x1165,	%i0
	fornot2	%f4,	%f14,	%f4
	movpos	%xcc,	%o6,	%g5
	nop
	setx	0x57F62BDAF7D27D37,	%l0,	%l6
	stx	%l6,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%f24
	fsqrtd	%f24,	%f28
	wr	%g0,	0x81,	%asi
	ldstuba	[%l7 + 0x69] %asi,	%g6
	umulcc	%i2,	%i3,	%i1
	fandnot1s	%f6,	%f8,	%f17
	taddcc	%l4,	%l0,	%g4
	bcs,a,pn	%xcc,	loop_2974
	fmovsneg	%xcc,	%f1,	%f3
	andncc	%o5,	%i6,	%o0
	and	%g2,	0x0219,	%l6
loop_2974:
	sethi	0x0C66,	%o7
	and	%l1,	0x18A4,	%o4
	movg	%xcc,	%g3,	%g1
	ta	%xcc,	0x7
	movleu	%xcc,	%o1,	%g7
	ldd	[%l7 + 0x18],	%f8
	fpsub16s	%f21,	%f8,	%f15
	fmovrde	%l3,	%f20,	%f20
	xor	%l5,	%o3,	%i7
	add	%l7,	0x78,	%l6
	wr	%g0,	0x80,	%asi
	lda	[%l6] %asi,	%i4
	casa	[%l6] %asi,	%i4,	%l2
	fsrc1s	%f1,	%f15
	movge	%xcc,	%o2,	%i5
	bleu,pt	%xcc,	loop_2975
	tneg	%icc,	0x4
	fmovrde	%i0,	%f20,	%f28
	taddcctv	%o6,	0x0578,	%g5
loop_2975:
	fzero	%f18
	udivcc	%g6,	0x1284,	%i2
	edge32n	%i3,	%i1,	%l0
	lduw	[%l7 + 0x64],	%l4
	movvc	%icc,	%o5,	%i6
	umulcc	%g4,	%g2,	%o0
	tl	%icc,	0x3
	edge8l	%o7,	%l6,	%l1
	orncc	%g3,	%g1,	%o1
	fpmerge	%f14,	%f2,	%f10
	xnorcc	%g7,	%o4,	%l3
	addc	%o3,	%l5,	%i4
	movge	%icc,	%l2,	%i7
	movne	%xcc,	%o2,	%i0
	mulx	%i5,	0x0710,	%o6
	fbuge	%fcc3,	loop_2976
	ldsh	[%l7 + 0x50],	%g5
	smulcc	%g6,	%i3,	%i1
loop_2976:
	nop

	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 2831
!	Type x   	: 1248
!	Type cti   	: 2976
!	Type f   	: 4465
!	Type i   	: 13480
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xB8DF39F1
.word 0xB21DDFAF
.word 0xF3679DB9
.word 0xA51C67DC
.word 0x4F77EFD7
.word 0xF45AC87D
.word 0x7455C51E
.word 0x1EB57F3F
.word 0xD3BF81A8
.word 0x55CD2DD7
.word 0x0CE5D42C
.word 0xC5DBBED3
.word 0x95C2D8F1
.word 0xF55A79F9
.word 0x3471742C
.word 0x7FC88383
.word 0xE50319A2
.word 0x6313D507
.word 0x3629168D
.word 0xEC1DF5BD
.word 0xDED172F3
.word 0x6A2B0B3C
.word 0x0DFDFD83
.word 0xA9178A4D
.word 0x99E453FE
.word 0xB77ECD6A
.word 0x869B275C
.word 0xDDC03D58
.word 0xB90144FB
.word 0x87E41D73
.word 0x8B3DFD21
.word 0x818865C5
.word 0x3F29A84B
.word 0x8A2197E0
.word 0x4D3E0B81
.word 0x1FBBE8F3
.word 0x130DB10B
.word 0x2901CB3A
.word 0x98E6F502
.word 0xC263DB67
.word 0x328F1947
.word 0xD13F9152
.word 0xD0F51A80
.word 0x1F00C979
.word 0xE3654FE9
.word 0x77227F29
.word 0x752CE961
.word 0x396C40B4
.word 0xA86BCEE1
.word 0x86C31185
.word 0x9FD2677B
.word 0x290D3FC9
.word 0xDD8E7D20
.word 0x9A2EC79E
.word 0x70F06274
.word 0x040623FB
.word 0x42FFF70F
.word 0x48D466B2
.word 0x2EEEDE5B
.word 0xB635F063
.word 0x9DCA71D0
.word 0x4D4B21EA
.word 0xD9C4197F
.word 0x8F718A40
.end
